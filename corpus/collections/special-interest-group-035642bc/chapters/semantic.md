## Ontology-Grounded Relational Modelling of the Special Interest Group Domain

The special interest group (SIG) domain captures the organisational anatomy of academic or professional societies: groups that convene around shared research interests, appoint officers to govern their activities, sponsor conferences, publish newsletters, and maintain curricula linked to research areas. The ontology underlying this domain distinguishes six core entity types—`special_interest_groups`, `officers`, `conferences`, `research_areas`, `newsletters`, and `curriculums`—alongside a many-to-many association between groups and officers mediated by the `groups_officers` junction table. Every entity is assigned a surrogate primary key (`id` or `conference_id`) and a business-level `identifier` where applicable. Relationships are cardinality-bounded: each group has at most one newsletter, one conference, and one parent group (self-referencing), while officers are assigned to exactly one group, and research areas and curriculums each reference a single group and curriculum respectively. The following sections walk through the materialisation of this ontology into a normalised relational schema and then demonstrate how each materialised view reconstructs a domain fact from the normalised tables.

### Base Tables and Their Structural Roles

The central entity is `special_interest_groups`, which anchors the entire schema. Its surrogate key `id` is an auto-incrementing integer, while the `identifier` column carries human-readable codes such as `IDE-2086` for the "Extended Review" group and `IDE-2101` for "Distributed Cluster". The `name` column stores the group's display name, `founding_year` records the year of establishment (values range from 43 to 58 in the sample data), and `status` constrains the group's lifecycle to one of `proposed`, `active`, or `dissolved`. The `mission_statement` column holds descriptive text like `compact-mission-14` or `adaptive-mission-17`. Three foreign keys—`newsletter_id`, `conference_id`, and `special_interest_group_id`—enforce the one-to-one or self-referencing relationships described above. The `special_interest_group_id` column is a self-reference pointing to the parent group, enabling hierarchical group structures; in the sample data every row references itself (e.g., row 1 has `special_interest_group_id = 1`), indicating a flat hierarchy at present.

**Table `special_interest_groups`**

| id | identifier | name | founding_year | status | mission_statement | newsletter_id | conference_id | special_interest_group_id |
|---|---|---|---|---|---|---|---|---|
| 1 | IDE-2086 | Extended Review | 43 | proposed | compact-mission-14 | 1 | 1 | 1 |
| 2 | IDE-2091 | Pilot Initiative A | 48 | active | composite-mission-15 | 2 | 2 | 2 |
| 3 | IDE-2096 | Baseline Model | 53 | dissolved | primary-mission-16 | 3 | 3 | 3 |
| 4 | IDE-2101 | Distributed Cluster | 58 | proposed | adaptive-mission-17 | 4 | 4 | 4 |

The `officers` table models the governance layer. Each row represents a person holding a specific role within a group. The `role` column takes values such as `Chair`, `Vice-Chair`, `Treasurer`, and `Secretary`. Appointment timing is captured by `appointment_date` and `term_end_date`, both stored as ISO-8601 timestamps (e.g., `2022-05-03T16:12:00`). The `status` column distinguishes between `active` and `former` officers. The foreign key `special_interest_group_id` binds each officer to exactly one group, enforcing a many-to-one cardinality: multiple officers can serve a single group, but each officer serves only one.

**Table `officers`**

| id | role | appointment_date | term_end_date | status | special_interest_group_id |
|---|---|---|---|---|---|
| 1000 | Chair | 2022-05-03T16:12:00 | 2025-08-24T07:45:00 | active | 1 |
| 1001 | Vice-Chair | 2023-10-14T23:29:00 | 2022-01-08T14:02:00 | former | 2 |
| 1002 | Treasurer | 2024-03-25T06:46:00 | 2023-06-19T21:19:00 | active | 3 |
| 1003 | Secretary | 2025-08-09T13:03:00 | 2024-11-03T04:36:00 | former | 4 |

Conferences are modelled in the `conferences` table, which uses `conference_id` as its surrogate primary key. The `name` column mirrors the group name in the sample data (e.g., "Extended Review" for conference 1), suggesting a naming convention where conferences inherit their parent group's title. The `location` column stores descriptive strings such as `extended-location-99` or `regional-location-102`. Date columns `start_date` and `end_date` capture the event window, while `expected_attendance` holds integer counts (15, 21, 27, 33 in the sample). The `cluster` column groups conferences into logical clusters like `extended-cluster-75` or `seasonal-cluster-77`. The foreign key `special_interest_group_id` ties each conference to its sponsoring group.

**Table `conferences`**

| conference_id | name | location | start_date | end_date | expected_attendance | cluster | special_interest_group_id |
|---|---|---|---|---|---|---|---|
| 1 | Extended Review | extended-location-99 | 2022-09-05 | 2022-09-01 | 15 | extended-cluster-75 | 1 |
| 2 | Pilot Initiative A | integrated-location-100 | 2023-02-16 | 2023-02-12 | 21 | integrated-cluster-76 | 2 |
| 3 | Baseline Model | seasonal-location-101 | 2024-07-27 | 2024-07-23 | 27 | seasonal-cluster-77 | 3 |
| 4 | Distributed Cluster | regional-location-102 | 2025-12-11 | 2025-12-07 | 33 | regional-cluster-78 | 4 |

Research areas are captured in `research_areas`, with surrogate key `id` and a `name` column that again mirrors group names in the sample (e.g., "Extended Review" for research area 100). The `classification` column categorises areas into `logic`, `computation`, or `interdisciplinary`. A free-text `description` column holds values like `Extended Survey` or `Pilot Corridor A`. The `special_interest_group_id` foreign key links each research area to its parent group, and `curriculum_id` links it to a curriculum. Timestamps `created_at` and `updated_at` record the lifecycle of each research area entry.

**Table `research_areas`**

| id | name | classification | description | special_interest_group_id | curriculum_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|
| 100 | Extended Review | logic | Extended Survey | 1 | 1000 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 101 | Pilot Initiative A | computation | Pilot Corridor A | 2 | 1001 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 102 | Baseline Model | interdisciplinary | Baseline Series | 3 | 1002 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 103 | Distributed Cluster | logic | Distributed Assessment | 4 | 1003 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The `newsletters` table models publication outputs. Its surrogate key `id` is an integer, and the `frequency` column constrains values to `quarterly`, `monthly`, or `annually`. The `format` column distinguishes `electronic` from `print` editions. The `start_date` column records when the newsletter began, and `status` takes values such as `planned`, `active`, or `discontinued`. The foreign key `special_interest_group_id` binds each newsletter to its sponsoring group.

**Table `newsletters`**

| id | frequency | format | start_date | status | special_interest_group_id |
|---|---|---|---|---|---|
| 1 | quarterly | electronic | 2022-09-05T20:24:00 | planned | 1 |
| 2 | monthly | print | 2023-02-16T03:41:00 | active | 2 |
| 3 | annually | electronic | 2024-07-27T10:58:00 | discontinued | 3 |
| 4 | quarterly | print | 2025-12-11T17:15:00 | planned | 4 |

Curriculums are stored in the `curriculums` table, with surrogate key `id` and columns `level` (constrained to `undergraduate`, `graduate`, or `doctoral`), `institution_type` (`university` or `college`), and `status` (`proposed`, `implemented`, or `reviewed`). The foreign keys `special_interest_group_id` and `research_area_id` establish a bridge between the curriculum entity and both the sponsoring group and the associated research area, creating a triangular relationship among these three tables.

**Table `curriculums`**

| id | level | institution_type | status | special_interest_group_id | research_area_id |
|---|---|---|---|---|---|
| 1000 | undergraduate | university | proposed | 1 | 100 |
| 1001 | graduate | college | implemented | 2 | 101 |
| 1002 | doctoral | university | reviewed | 3 | 102 |
| 1003 | undergraduate | college | proposed | 4 | 103 |

The `groups_officers` junction table resolves the many-to-many relationship between `special_interest_groups` and `officers`. In the current data model, this table exists to allow a group to have multiple officers and an officer to potentially serve across multiple groups (though the sample data shows each officer assigned to exactly one group via the `special_interest_group_id` column in the `officers` table). The junction table's structure ensures referential integrity: every row contains a `special_interest_group_id` and an `officer_id` (or equivalent foreign key pair), and the composite key prevents duplicate assignments.

**Table `groups_officers`**

| special_interest_group_id | officer_id |
|---|---|
| 1 | 1000 |
| 1 | 1001 |
| 2 | 1001 |
| 2 | 1002 |
| 3 | 1002 |
| 3 | 1003 |
| 4 | 1003 |
| 4 | 1000 |

### Materialised Views: Reconstructing Domain Facts

Views in this schema are denormalised projections that join the base tables to answer specific analytical questions. Each view materialises a particular facet of the domain ontology by pulling together related entities into a single flat result set.

The view `v_special_interest_group_officer_detail` joins `special_interest_groups` with `officers` on `special_interest_group_id`, producing a flat record that pairs each group with its appointed officers. A sample row would show group `IDE-2086` ("Extended Review") alongside officer 1000 (Chair, active, appointed 2022-05-03). This view answers the question: "Which officers serve which groups, and what are their appointment details?"

**View `v_special_interest_group_officer_detail`**

```sql
CREATE VIEW v_special_interest_group_officer_detail AS
SELECT a.id, a.identifier, a.name, b.id AS officer_id, b.role AS officer_role, b.appointment_date AS officer_appointment_date
FROM special_interest_groups a
  JOIN groups_officers j ON j.special_interest_group_id = a.id
  JOIN officers b ON b.id = j.officer_id;
```

| id | identifier | name | officer_id | officer_role | officer_appointment_date |
|---|---|---|---|---|---|
| 1 | IDE-2086 | Extended Review | 1000 | Chair | 2022-05-03T16:12:00 |
| 1 | IDE-2086 | Extended Review | 1001 | Vice-Chair | 2023-10-14T23:29:00 |
| 2 | IDE-2091 | Pilot Initiative A | 1001 | Vice-Chair | 2023-10-14T23:29:00 |
| 2 | IDE-2091 | Pilot Initiative A | 1002 | Treasurer | 2024-03-25T06:46:00 |
| 3 | IDE-2096 | Baseline Model | 1002 | Treasurer | 2024-03-25T06:46:00 |
| 3 | IDE-2096 | Baseline Model | 1003 | Secretary | 2025-08-09T13:03:00 |
| 4 | IDE-2101 | Distributed Cluster | 1003 | Secretary | 2025-08-09T13:03:00 |
| 4 | IDE-2101 | Distributed Cluster | 1000 | Chair | 2022-05-03T16:12:00 |

The view `v_special_interest_group_newsletter` joins `special_interest_groups` with `newsletters` on `special_interest_group_id`, producing a row per group–newsletter pair. A representative row would show group `IDE-2091` ("Pilot Initiative A") with its monthly print newsletter (id 2, status `active`). This view answers: "What newsletter does each group publish, and what are its characteristics?"

**View `v_special_interest_group_newsletter`**

```sql
CREATE VIEW v_special_interest_group_newsletter AS
SELECT a.id, a.identifier, a.name, a.founding_year, b.id AS newsletter_id, b.frequency AS newsletter_frequency, b.format AS newsletter_format
FROM special_interest_groups a JOIN newsletters b ON a.newsletter_id = b.id;
```

| id | identifier | name | founding_year | newsletter_id | newsletter_frequency | newsletter_format |
|---|---|---|---|---|---|---|
| 1 | IDE-2086 | Extended Review | 43 | 1 | quarterly | electronic |
| 2 | IDE-2091 | Pilot Initiative A | 48 | 2 | monthly | print |
| 3 | IDE-2096 | Baseline Model | 53 | 3 | annually | electronic |
| 4 | IDE-2101 | Distributed Cluster | 58 | 4 | quarterly | print |

The view `v_special_interest_group_conference` joins `special_interest_groups` with `conferences` on `special_interest_group_id`, yielding a row per group–conference pair. A sample row would show group `IDE-2096` ("Baseline Model") with conference 3 at `seasonal-location-101`, expected attendance of 27. This view answers: "Which conferences does each group sponsor, and what are the event details?"

**View `v_special_interest_group_conference`**

```sql
CREATE VIEW v_special_interest_group_conference AS
SELECT a.id, a.identifier, a.name, a.founding_year, b.conference_id AS conference_conference_id, b.name AS conference_name, b.location AS conference_location
FROM special_interest_groups a JOIN conferences b ON a.conference_id = b.conference_id;
```

| id | identifier | name | founding_year | conference_conference_id | conference_name | conference_location |
|---|---|---|---|---|---|---|
| 1 | IDE-2086 | Extended Review | 43 | 1 | Extended Review | extended-location-99 |
| 2 | IDE-2091 | Pilot Initiative A | 48 | 2 | Pilot Initiative A | integrated-location-100 |
| 3 | IDE-2096 | Baseline Model | 53 | 3 | Baseline Model | seasonal-location-101 |
| 4 | IDE-2101 | Distributed Cluster | 58 | 4 | Distributed Cluster | regional-location-102 |

The view `v_special_interest_group_special_interest_group` performs a self-join on `special_interest_groups`, linking each group to its parent group via the `special_interest_group_id` foreign key. In the sample data, since every group references itself, each row would pair a group with itself (e.g., `IDE-2086` with parent `IDE-2086`). This view answers: "What is the hierarchical parent of each group?"

**View `v_special_interest_group_special_interest_group`**

```sql
CREATE VIEW v_special_interest_group_special_interest_group AS
SELECT a.id, a.identifier, a.name, a.founding_year, b.id AS group_id, b.identifier AS group_identifier, b.name AS group_name
FROM special_interest_groups a JOIN special_interest_groups b ON a.special_interest_group_id = b.id;
```

| id | identifier | name | founding_year | group_id | group_identifier | group_name |
|---|---|---|---|---|---|---|
| 1 | IDE-2086 | Extended Review | 43 | 1 | IDE-2086 | Extended Review |
| 2 | IDE-2091 | Pilot Initiative A | 48 | 2 | IDE-2091 | Pilot Initiative A |
| 3 | IDE-2096 | Baseline Model | 53 | 3 | IDE-2096 | Baseline Model |
| 4 | IDE-2101 | Distributed Cluster | 58 | 4 | IDE-2101 | Distributed Cluster |

The view `v_officer_special_interest_group` joins `officers` with `special_interest_groups` on `special_interest_group_id`, producing a flat record that shows each officer alongside their group's full details. A sample row would pair officer 1001 (Vice-Chair, former status) with group `IDE-2091` ("Pilot Initiative A", active, founded in year 48). This view answers: "Which group does each officer belong to, and what is the group's profile?"

**View `v_officer_special_interest_group`**

```sql
CREATE VIEW v_officer_special_interest_group AS
SELECT a.id, a.role, a.appointment_date, a.term_end_date, b.id AS group_id, b.identifier AS group_identifier, b.name AS group_name
FROM officers a JOIN special_interest_groups b ON a.special_interest_group_id = b.id;
```

| id | role | appointment_date | term_end_date | group_id | group_identifier | group_name |
|---|---|---|---|---|---|---|
| 1000 | Chair | 2022-05-03T16:12:00 | 2025-08-24T07:45:00 | 1 | IDE-2086 | Extended Review |
| 1001 | Vice-Chair | 2023-10-14T23:29:00 | 2022-01-08T14:02:00 | 2 | IDE-2091 | Pilot Initiative A |
| 1002 | Treasurer | 2024-03-25T06:46:00 | 2023-06-19T21:19:00 | 3 | IDE-2096 | Baseline Model |
| 1003 | Secretary | 2025-08-09T13:03:00 | 2024-11-03T04:36:00 | 4 | IDE-2101 | Distributed Cluster |

The view `v_conference_special_interest_group` joins `conferences` with `special_interest_groups` on `special_interest_group_id`, producing a row that pairs each conference with its sponsoring group. A representative row would show conference 4 ("Distributed Cluster" at `regional-location-102`) alongside group `IDE-2101` ("Distributed Cluster", proposed, founded in year 58). This view answers: "Which group sponsors each conference?"

**View `v_conference_special_interest_group`**

```sql
CREATE VIEW v_conference_special_interest_group AS
SELECT a.conference_id, a.name, a.location, a.start_date, b.id AS group_id, b.identifier AS group_identifier, b.name AS group_name
FROM conferences a JOIN special_interest_groups b ON a.special_interest_group_id = b.id;
```

| conference_id | name | location | start_date | group_id | group_identifier | group_name |
|---|---|---|---|---|---|---|
| 1 | Extended Review | extended-location-99 | 2022-09-05 | 1 | IDE-2086 | Extended Review |
| 2 | Pilot Initiative A | integrated-location-100 | 2023-02-16 | 2 | IDE-2091 | Pilot Initiative A |
| 3 | Baseline Model | seasonal-location-101 | 2024-07-27 | 3 | IDE-2096 | Baseline Model |
| 4 | Distributed Cluster | regional-location-102 | 2025-12-11 | 4 | IDE-2101 | Distributed Cluster |

The view `v_research_area_special_interest_group` joins `research_areas` with `special_interest_groups` on `special_interest_group_id`, yielding a row per research area with its group's details. A sample row would show research area 100 ("Extended Review", classification `logic`) alongside group `IDE-2086` ("Extended Review", active). This view answers: "Which research areas belong to which groups?"

**View `v_research_area_special_interest_group`**

```sql
CREATE VIEW v_research_area_special_interest_group AS
SELECT a.id, a.name, a.classification, a.description, b.id AS group_id, b.identifier AS group_identifier, b.name AS group_name
FROM research_areas a JOIN special_interest_groups b ON a.special_interest_group_id = b.id;
```

| id | name | classification | description | group_id | group_identifier | group_name |
|---|---|---|---|---|---|---|
| 100 | Extended Review | logic | Extended Survey | 1 | IDE-2086 | Extended Review |
| 101 | Pilot Initiative A | computation | Pilot Corridor A | 2 | IDE-2091 | Pilot Initiative A |
| 102 | Baseline Model | interdisciplinary | Baseline Series | 3 | IDE-2096 | Baseline Model |
| 103 | Distributed Cluster | logic | Distributed Assessment | 4 | IDE-2101 | Distributed Cluster |

The view `v_research_area_curriculum` joins `research_areas` with `curriculums` on `curriculum_id` (via the `curriculum_id` column in `research_areas`), producing a row that pairs each research area with its associated curriculum. A representative row would show research area 101 ("Pilot Initiative A", classification `computation`) alongside curriculum 1001 (graduate level, college, implemented). This view answers: "Which curriculum is associated with each research area?"

**View `v_research_area_curriculum`**

```sql
CREATE VIEW v_research_area_curriculum AS
SELECT a.id, a.name, a.classification, a.description, b.id AS curriculum_id, b.level AS curriculum_level, b.institution_type AS curriculum_institution_type
FROM research_areas a JOIN curriculums b ON a.curriculum_id = b.id;
```

| id | name | classification | description | curriculum_id | curriculum_level | curriculum_institution_type |
|---|---|---|---|---|---|---|
| 100 | Extended Review | logic | Extended Survey | 1000 | undergraduate | university |
| 101 | Pilot Initiative A | computation | Pilot Corridor A | 1001 | graduate | college |
| 102 | Baseline Model | interdisciplinary | Baseline Series | 1002 | doctoral | university |
| 103 | Distributed Cluster | logic | Distributed Assessment | 1003 | undergraduate | college |

The view `v_newsletter_special_interest_group` joins `newsletters` with `special_interest_groups` on `special_interest_group_id`, producing a row per newsletter with its group's full profile. A sample row would pair newsletter 3 (annually, electronic, discontinued) with group `IDE-2096` ("Baseline Model", dissolved, founded in year 53). This view answers: "Which group publishes each newsletter, and what is the group's status?"

**View `v_newsletter_special_interest_group`**

```sql
CREATE VIEW v_newsletter_special_interest_group AS
SELECT a.id, a.frequency, a.format, a.start_date, b.id AS group_id, b.identifier AS group_identifier, b.name AS group_name
FROM newsletters a JOIN special_interest_groups b ON a.special_interest_group_id = b.id;
```

| id | frequency | format | start_date | group_id | group_identifier | group_name |
|---|---|---|---|---|---|---|
| 1 | quarterly | electronic | 2022-09-05T20:24:00 | 1 | IDE-2086 | Extended Review |
| 2 | monthly | print | 2023-02-16T03:41:00 | 2 | IDE-2091 | Pilot Initiative A |
| 3 | annually | electronic | 2024-07-27T10:58:00 | 3 | IDE-2096 | Baseline Model |
| 4 | quarterly | print | 2025-12-11T17:15:00 | 4 | IDE-2101 | Distributed Cluster |

The view `v_curriculum_special_interest_group` joins `curriculums` with `special_interest_groups` on `special_interest_group_id`, yielding a row that pairs each curriculum with its sponsoring group. A representative row would show curriculum 1002 (doctoral, university, reviewed) alongside group `IDE-2096` ("Baseline Model", dissolved). This view answers: "Which group sponsors each curriculum?"

**View `v_curriculum_special_interest_group`**

```sql
CREATE VIEW v_curriculum_special_interest_group AS
SELECT a.id, a.level, a.institution_type, a.status, b.id AS group_id, b.identifier AS group_identifier, b.name AS group_name
FROM curriculums a JOIN special_interest_groups b ON a.special_interest_group_id = b.id;
```

| id | level | institution_type | status | group_id | group_identifier | group_name |
|---|---|---|---|---|---|---|
| 1000 | undergraduate | university | proposed | 1 | IDE-2086 | Extended Review |
| 1001 | graduate | college | implemented | 2 | IDE-2091 | Pilot Initiative A |
| 1002 | doctoral | university | reviewed | 3 | IDE-2096 | Baseline Model |
| 1003 | undergraduate | college | proposed | 4 | IDE-2101 | Distributed Cluster |

The view `v_curriculum_research_area` joins `curriculums` with `research_areas` on `research_area_id` (via the `research_area_id` column in `curriculums`), producing a row that pairs each curriculum with its associated research area. A sample row would show curriculum 1003 (undergraduate, college, proposed) alongside research area 103 ("Distributed Cluster", classification `logic`). This view answers: "Which research area is linked to each curriculum?"

**View `v_curriculum_research_area`**

```sql
CREATE VIEW v_curriculum_research_area AS
SELECT a.id, a.level, a.institution_type, a.status, b.id AS area_id, b.name AS area_name, b.classification AS area_classification
FROM curriculums a JOIN research_areas b ON a.research_area_id = b.id;
```

| id | level | institution_type | status | area_id | area_name | area_classification |
|---|---|---|---|---|---|---|
| 1000 | undergraduate | university | proposed | 100 | Extended Review | logic |
| 1001 | graduate | college | implemented | 101 | Pilot Initiative A | computation |
| 1002 | doctoral | university | reviewed | 102 | Baseline Model | interdisciplinary |
| 1003 | undergraduate | college | proposed | 103 | Distributed Cluster | logic |

### Synthesis

The relational schema materialises the SIG ontology through a disciplined normalisation strategy: six base tables capture the core entities with surrogate keys and foreign-key-bounded relationships, while the `groups_officers` junction table resolves the many-to-many association between groups and officers. The self-referencing `special_interest_group_id` column in `special_interest_groups` enables hierarchical group structures, and the triangular relationship among `research_areas`, `curriculums`, and `special_interest_groups` (mediated by `curriculum_id` and `research_area_id` foreign keys) captures the educational dimension of the domain. The eleven materialised views each reconstruct a specific domain fact by joining two or more base tables, transforming the normalised schema into flat, query-ready projections. Together, the base tables and views provide a complete relational representation of the SIG domain, supporting both operational queries (e.g., "list all officers for a group") and analytical queries (e.g., "show the curriculum–research area mapping for each group").