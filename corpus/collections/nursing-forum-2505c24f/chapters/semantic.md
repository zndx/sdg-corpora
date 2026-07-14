The National Nursing Data Fabric is a domain model that captures the interlocking relationships between nursing forums, individual professionals, quality improvement workstreams, health trusts, clinical outcome measurements, and educational institutions. At its core, the schema answers questions such as which professionals belong to which forums, which workstreams track which clinical outcomes, and how health trusts govern the delivery of care. The model is normalised into ten base tables and sixteen materialised views, each view representing a specific join that reconstructs a domain fact from the underlying normalised tables.

## Entity Types and Their Attributes

The domain is anchored by six entity types, each materialised as a base table. The `nursing_forums` table stores the forums themselves. Each row carries a surrogate primary key `nursing_forum_id`, a business-level `forum_identifier` such as `FOR-2131`, a human-readable `forum_name` like *Compact Model* or *Legacy Cluster*, an `established_date`, a `status` enum (`active`, `dissolved`, `pending`), a `jurisdiction` (`national`, `regional`, `local`), and audit timestamps `created_at` and `updated_at`. The forum rows are the starting point for two many-to-many relationships: professionals can belong to multiple forums, and forums can sponsor multiple workstreams.

**Table `nursing_forums`**

| nursing_forum_id | forum_identifier | forum_name | established_date | status | jurisdiction | nursing_professional_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|
| 1000 | FOR-2131 | Compact Model | 2024-03-27 | active | national | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 1001 | FOR-2132 | Legacy Cluster | 2025-08-11 | dissolved | regional | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 1002 | FOR-2133 | Regional Review A | 2022-01-22 | pending | local | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 1003 | FOR-2134 | Seasonal Initiative | 2023-06-06 | active | national | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The `nursing_professionals` table is the central person entity. Its surrogate key is `id`, and each professional carries a `professional_id` (e.g. `5082965`), a `full_name` such as *Theodore Mcgrath* or *Norma Fisher*, a `registration_number` (`REG-2136`), a `primary_qualification` (`compact-primary-14`), `years_of_experience` (ranging from 7 to 16), a `current_role_title` (`Adaptive Cluster`, `Primary Review`), and a boolean `has_fellowship`. Crucially, this table also embeds four foreign keys — `health_trust_id`, `nursing_forum_id`, `quality_workstream_id`, and `educational_institution_id` — that bind each professional to one row in each of the four organisational entity tables.

**Table `nursing_professionals`**

| id | professional_id | full_name | registration_number | primary_qualification | years_of_experience | current_role_title | has_fellowship | health_trust_id | nursing_forum_id | quality_workstream_id | educational_institution_id |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 5082965 | Theodore Mcgrath | REG-2136 | compact-primary-14 | 7 | Adaptive Cluster | true | 1 | 1000 | 1 | 1 |
| 2 | 2618560 | Account Name | REG-2142 | composite-primary-15 | 10 | Primary Review | false | 2 | 1001 | 2 | 2 |
| 3 | 3355767 | Saipan International Airport | REG-2148 | primary-primary-16 | 13 | Composite Initiative D | true | 3 | 1002 | 3 | 3 |
| 4 | 3355784 | Norma Fisher | REG-2154 | adaptive-primary-17 | 16 | Compact Model | false | 4 | 1003 | 4 | 4 |

The `quality_workstreams` table captures improvement initiatives. Each row has a surrogate `quality_workstream_id`, a business `workstream_id` (e.g. `10782179`), a `workstream_title` (*Primary Framework A*), a `start_date` in ISO-8601 format, a `target_metric` (`integrated-target-82`), a `status` (`planning`, `active`, `completed`, `suspended`), a `scope` (`infection_control`, `patient_dignity`, `leadership`, `staff_engagement`), and foreign keys `nursing_forum_id`, `nursing_professional_id`, and `clinical_outcome_id`.

**Table `quality_workstreams`**

| quality_workstream_id | workstream_id | workstream_title | start_date | target_metric | status | scope | nursing_forum_id | nursing_professional_id | clinical_outcome_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 10782179 | Primary Framework A | 2022-09-05T20:24:00 | integrated-target-82 | planning | infection_control | 1000 | 1 | 1000 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | 3001009030140 | Composite Protocol | 2023-02-16T03:41:00 | seasonal-target-83 | active | patient_dignity | 1001 | 2 | 1001 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | 8928521 | Compact Programme | 2024-07-27T10:58:00 | regional-target-84 | completed | leadership | 1002 | 3 | 1002 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | 6440 | Legacy Standard D | 2025-12-11T17:15:00 | legacy-target-85 | suspended | staff_engagement | 1003 | 4 | 1003 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The `health_trusts` table stores NHS-style trust organisations. Its surrogate key is `health_trust_id`, complemented by a UUID `trust_id` (e.g. `5f923cfa-8fcd-11eb-924d-9cd76263cbd0`), a `trust_name` (*Compact Framework*), a `trust_type` (`Foundation_Trust`, `Specialist_Trust`, `Acute_Trust`), a `region` (`distributed-region-12`), a `cqc_rating` (`outstanding`, `good`, `requires_improvement`, `inadequate`), an `established_year`, a foreign key `clinical_outcome_id`, and audit timestamps.

**Table `health_trusts`**

| health_trust_id | trust_id | trust_name | trust_type | region | cqc_rating | established_year | clinical_outcome_id | created_at |
|---|---|---|---|---|---|---|---|---|
| 1 | 5f923cfa-8fcd-11eb-924d-9cd76263cbd0 | Compact Framework | Foundation_Trust | distributed-region-12 | outstanding | 10 | 1000 | 2025-01-01 00:14:00 |
| 2 | 8387551 | Legacy Protocol | Specialist_Trust | baseline-region-13 | good | 16 | 1001 | 2025-02-06 03:14:00 |
| 3 | ChIJAaQOcwdu5kcRArYphCv0bl0 | Regional Programme A | Acute_Trust | pilot-region-14 | requires_improvement | 22 | 1002 | 2025-03-11 06:14:00 |
| 4 | 27cebc1c-9bad-11eb-a8a2-19ed5c03f8d3 | Seasonal Standard | Foundation_Trust | extended-region-15 | inadequate | 28 | 1003 | 2025-04-16 09:14:00 |

The `clinical_outcomes` table records measured health indicators. Its surrogate key is `clinical_outcome_id`, with a business `outcome_id` (e.g. `2618555`), an `outcome_type` (`infection_rate`, `patient_satisfaction`, `mortality_rate`, `quality_rating`), a numeric `measurement_value` (14.45, 17.90, 21.35, 24.80), a `unit_of_measure` (`percent`, `count`, `score`), a `measurement_date`, a `trend` (`improving`, `declining`, `stable`), a `data_source` (`pilot-data-38`), and foreign keys `health_trust_id`, `quality_workstream_id`, and `nursing_professional_id`.

**Table `clinical_outcomes`**

| clinical_outcome_id | outcome_id | outcome_type | measurement_value | unit_of_measure | measurement_date | trend | data_source | health_trust_id | quality_workstream_id | nursing_professional_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1000 | 2618555 | infection_rate | 14.45 | percent | 2024-07-01 | improving | pilot-data-38 | 1 | 1 | 1 |
| 1001 | lu_tax_code_template_m46 | patient_satisfaction | 17.90 | count | 2025-12-12 | declining | extended-data-39 | 2 | 2 | 2 |
| 1002 | 168561 | mortality_rate | 21.35 | score | 2022-05-23 | stable | integrated-data-40 | 3 | 3 | 3 |
| 1003 | 1210-0007-M | quality_rating | 24.80 | percent | 2023-10-07 | improving | seasonal-data-41 | 4 | 4 | 4 |

The `educational_institutions` table captures the training organisations. Its surrogate key is `id`, with a business `institution_id` (e.g. `9424913`), an `institution_name` (*Extended Corridor*), an `institution_type` (`university`, `hospital_school`, `training_academy`), a `location`, and an `accreditation_body`.

**Table `educational_institutions`**

| id | institution_id | institution_name | institution_type | location | accreditation_body |
|---|---|---|---|---|---|
| 1 | 9424913 | Extended Corridor | university | extended-location-99 | integrated-accredit-88 |
| 2 | 8189481 | Pilot Series A | hospital_school | integrated-location-100 | seasonal-accredit-89 |
| 3 | 1437604 | Baseline Assessment | training_academy | seasonal-location-101 | regional-accredit-90 |
| 4 | 884346 | Distributed Survey | university | regional-location-102 | legacy-accredit-91 |

## Junction Tables and Many-to-Many Relationships

Four junction tables resolve the many-to-many relationships that the six entity tables cannot express through simple foreign keys. The `forums_professionals` table links `nursing_forums` to `nursing_professionals`, allowing a professional to participate in multiple forums and a forum to host multiple professionals.

**Table `forums_professionals`**

| nursing_forum_id | nursing_professional_id |
|---|---|
| 1000 | 1 |
| 1000 | 2 |
| 1001 | 2 |
| 1001 | 3 |
| 1002 | 3 |
| 1002 | 4 |
| 1003 | 4 |
| 1003 | 1 |

The `forums_workstreams` table links `nursing_forums` to `quality_workstreams`, enabling a forum to sponsor multiple workstreams and a workstream to be associated with multiple forums.

**Table `forums_workstreams`**

| nursing_forum_id | quality_workstream_id |
|---|---|
| 1000 | 1 |
| 1000 | 2 |
| 1001 | 2 |
| 1001 | 3 |
| 1002 | 3 |
| 1002 | 4 |
| 1003 | 4 |
| 1003 | 1 |

The `trusts_professionals` table links `health_trusts` to `nursing_professionals`, supporting the scenario where a professional may be employed by or affiliated with multiple trusts over time.

**Table `trusts_professionals`**

| health_trust_id | nursing_professional_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

The `institutions_professionals` table links `educational_institutions` to `nursing_professionals`, capturing the fact that a professional may have graduated from or hold a continuing appointment at multiple institutions.

**Table `institutions_professionals`**

| educational_institution_id | nursing_professional_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

## Views as Reconstructed Domain Facts

Each view materialises a specific join across the normalised tables, answering a concrete analytical question. The views fall into three categories: professional-centric views, forum-centric views, workstream-centric views, trust-centric views, outcome-centric views, and institution-centric views.

### Professional-Centric Views

The view `nursing_professional_health_trust_view` joins `nursing_professionals` to `health_trusts` on the `health_trust_id` foreign key, answering the question: *Which health trust is each professional affiliated with?* A row for Theodore Mcgrath (`REG-2136`) would show his affiliation with the trust whose `trust_name` is *Compact Framework* and whose `cqc_rating` is *outstanding*.

**View `nursing_professional_health_trust_view`**

```sql
CREATE VIEW nursing_professional_health_trust_view AS
SELECT a.id, a.professional_id, a.full_name, a.registration_number, b.health_trust_id AS trust_health_trust_id, b.trust_id AS trust_trust_id, b.trust_name AS trust_trust_name
FROM nursing_professionals a JOIN health_trusts b ON a.health_trust_id = b.health_trust_id;
```

| id | professional_id | full_name | registration_number | trust_health_trust_id | trust_trust_id | trust_trust_name |
|---|---|---|---|---|---|---|
| 1 | 5082965 | Theodore Mcgrath | REG-2136 | 1 | 5f923cfa-8fcd-11eb-924d-9cd76263cbd0 | Compact Framework |
| 2 | 2618560 | Account Name | REG-2142 | 2 | 8387551 | Legacy Protocol |
| 3 | 3355767 | Saipan International Airport | REG-2148 | 3 | ChIJAaQOcwdu5kcRArYphCv0bl0 | Regional Programme A |
| 4 | 3355784 | Norma Fisher | REG-2154 | 4 | 27cebc1c-9bad-11eb-a8a2-19ed5c03f8d3 | Seasonal Standard |

The view `nursing_professional_nursing_forum_view` joins `nursing_professionals` to `nursing_forums` on `nursing_forum_id`, answering: *Which forum is each professional registered with?* The row for Account Name (`REG-2142`) would show the forum *Legacy Cluster* (`FOR-2132`) with status *dissolved* and jurisdiction *regional*.

**View `nursing_professional_nursing_forum_view`**

```sql
CREATE VIEW nursing_professional_nursing_forum_view AS
SELECT a.id, a.professional_id, a.full_name, a.registration_number, b.nursing_forum_id AS forum_nursing_forum_id, b.forum_identifier AS forum_forum_identifier, b.forum_name AS forum_forum_name
FROM nursing_professionals a JOIN nursing_forums b ON a.nursing_forum_id = b.nursing_forum_id;
```

| id | professional_id | full_name | registration_number | forum_nursing_forum_id | forum_forum_identifier | forum_forum_name |
|---|---|---|---|---|---|---|
| 1 | 5082965 | Theodore Mcgrath | REG-2136 | 1000 | FOR-2131 | Compact Model |
| 2 | 2618560 | Account Name | REG-2142 | 1001 | FOR-2132 | Legacy Cluster |
| 3 | 3355767 | Saipan International Airport | REG-2148 | 1002 | FOR-2133 | Regional Review A |
| 4 | 3355784 | Norma Fisher | REG-2154 | 1003 | FOR-2134 | Seasonal Initiative |

The view `nursing_professional_quality_workstream_view` joins `nursing_professionals` to `quality_workstreams` on `quality_workstream_id`, answering: *Which quality workstream is each professional assigned to?* The row for Saipan International Airport (`REG-2148`) would show the workstream *Compact Programme* with scope *leadership* and status *completed*.

**View `nursing_professional_quality_workstream_view`**

```sql
CREATE VIEW nursing_professional_quality_workstream_view AS
SELECT a.id, a.professional_id, a.full_name, a.registration_number, b.quality_workstream_id AS workstream_quality_workstream_id, b.workstream_id AS workstream_workstream_id, b.workstream_title AS workstream_workstream_title
FROM nursing_professionals a JOIN quality_workstreams b ON a.quality_workstream_id = b.quality_workstream_id;
```

| id | professional_id | full_name | registration_number | workstream_quality_workstream_id | workstream_workstream_id | workstream_workstream_title |
|---|---|---|---|---|---|---|
| 1 | 5082965 | Theodore Mcgrath | REG-2136 | 1 | 10782179 | Primary Framework A |
| 2 | 2618560 | Account Name | REG-2142 | 2 | 3001009030140 | Composite Protocol |
| 3 | 3355767 | Saipan International Airport | REG-2148 | 3 | 8928521 | Compact Programme |
| 4 | 3355784 | Norma Fisher | REG-2154 | 4 | 6440 | Legacy Standard D |

The view `nursing_professional_educational_institution_view` joins `nursing_professionals` to `educational_institutions` on `educational_institution_id`, answering: *Which educational institution is each professional associated with?* The row for Norma Fisher (`REG-2154`) would show the institution *Distributed Survey*, a `university` located at `regional-location-102`.

**View `nursing_professional_educational_institution_view`**

```sql
CREATE VIEW nursing_professional_educational_institution_view AS
SELECT a.id, a.professional_id, a.full_name, a.registration_number, b.id AS institution_id, b.institution_id AS institution_institution_id, b.institution_name AS institution_institution_name
FROM nursing_professionals a JOIN educational_institutions b ON a.educational_institution_id = b.id;
```

| id | professional_id | full_name | registration_number | institution_id | institution_institution_id | institution_institution_name |
|---|---|---|---|---|---|---|
| 1 | 5082965 | Theodore Mcgrath | REG-2136 | 1 | 9424913 | Extended Corridor |
| 2 | 2618560 | Account Name | REG-2142 | 2 | 8189481 | Pilot Series A |
| 3 | 3355767 | Saipan International Airport | REG-2148 | 3 | 1437604 | Baseline Assessment |
| 4 | 3355784 | Norma Fisher | REG-2154 | 4 | 884346 | Distributed Survey |

The view `nursing_forum_nursing_professional_detail_view` performs a richer join between `nursing_forums` and `nursing_professionals`, augmenting the forum row with the full professional profile. It answers: *What are the complete details of every professional belonging to each forum?* A row for forum *Compact Model* (`FOR-2131`) would include Theodore Mcgrath's 7 years of experience, his `Adaptive Cluster` role title, and his fellowship status of `true`.

**View `nursing_forum_nursing_professional_detail_view`**

```sql
CREATE VIEW nursing_forum_nursing_professional_detail_view AS
SELECT a.nursing_forum_id, a.forum_identifier, a.forum_name, b.id AS professional_id, b.professional_id AS professional_professional_id, b.full_name AS professional_full_name
FROM nursing_forums a
  JOIN forums_professionals j ON j.nursing_forum_id = a.nursing_forum_id
  JOIN nursing_professionals b ON b.id = j.nursing_professional_id;
```

| nursing_forum_id | forum_identifier | forum_name | professional_id | professional_professional_id | professional_full_name |
|---|---|---|---|---|---|
| 1000 | FOR-2131 | Compact Model | 1 | 5082965 | Theodore Mcgrath |
| 1000 | FOR-2131 | Compact Model | 2 | 2618560 | Account Name |
| 1001 | FOR-2132 | Legacy Cluster | 2 | 2618560 | Account Name |
| 1001 | FOR-2132 | Legacy Cluster | 3 | 3355767 | Saipan International Airport |
| 1002 | FOR-2133 | Regional Review A | 3 | 3355767 | Saipan International Airport |
| 1002 | FOR-2133 | Regional Review A | 4 | 3355784 | Norma Fisher |
| 1003 | FOR-2134 | Seasonal Initiative | 4 | 3355784 | Norma Fisher |
| 1003 | FOR-2134 | Seasonal Initiative | 1 | 5082965 | Theodore Mcgrath |

The view `nursing_forum_nursing_professional_view` is a lighter join between `nursing_forums` and `nursing_professionals`, answering: *Which professionals are associated with which forums, at a glance?* A row would pair forum *Seasonal Initiative* (`FOR-2134`) with professional *Norma Fisher* (`REG-2154`), whose role is *Compact Model* and who has 16 years of experience.

**View `nursing_forum_nursing_professional_view`**

```sql
CREATE VIEW nursing_forum_nursing_professional_view AS
SELECT a.nursing_forum_id, a.forum_identifier, a.forum_name, a.established_date, b.id AS professional_id, b.professional_id AS professional_professional_id, b.full_name AS professional_full_name
FROM nursing_forums a JOIN nursing_professionals b ON a.nursing_professional_id = b.id;
```

| nursing_forum_id | forum_identifier | forum_name | established_date | professional_id | professional_professional_id | professional_full_name |
|---|---|---|---|---|---|---|
| 1000 | FOR-2131 | Compact Model | 2024-03-27 | 1 | 5082965 | Theodore Mcgrath |
| 1001 | FOR-2132 | Legacy Cluster | 2025-08-11 | 2 | 2618560 | Account Name |
| 1002 | FOR-2133 | Regional Review A | 2022-01-22 | 3 | 3355767 | Saipan International Airport |
| 1003 | FOR-2134 | Seasonal Initiative | 2023-06-06 | 4 | 3355784 | Norma Fisher |

### Forum-Centric Views

The view `nursing_forum_quality_workstream_detail_view` joins `nursing_forums` to `quality_workstreams` on `nursing_forum_id`, answering: *What are the detailed attributes of every workstream sponsored by each forum?* A row for forum *Regional Review A* (`FOR-2133`) would show the workstream *Compact Programme* with target metric `regional-target-84`, scope `leadership`, and status `completed`.

**View `nursing_forum_quality_workstream_detail_view`**

```sql
CREATE VIEW nursing_forum_quality_workstream_detail_view AS
SELECT a.nursing_forum_id, a.forum_identifier, a.forum_name, b.quality_workstream_id AS workstream_quality_workstream_id, b.workstream_id AS workstream_workstream_id, b.workstream_title AS workstream_workstream_title
FROM nursing_forums a
  JOIN forums_workstreams j ON j.nursing_forum_id = a.nursing_forum_id
  JOIN quality_workstreams b ON b.quality_workstream_id = j.quality_workstream_id;
```

| nursing_forum_id | forum_identifier | forum_name | workstream_quality_workstream_id | workstream_workstream_id | workstream_workstream_title |
|---|---|---|---|---|---|
| 1000 | FOR-2131 | Compact Model | 1 | 10782179 | Primary Framework A |
| 1000 | FOR-2131 | Compact Model | 2 | 3001009030140 | Composite Protocol |
| 1001 | FOR-2132 | Legacy Cluster | 2 | 3001009030140 | Composite Protocol |
| 1001 | FOR-2132 | Legacy Cluster | 3 | 8928521 | Compact Programme |
| 1002 | FOR-2133 | Regional Review A | 3 | 8928521 | Compact Programme |
| 1002 | FOR-2133 | Regional Review A | 4 | 6440 | Legacy Standard D |
| 1003 | FOR-2134 | Seasonal Initiative | 4 | 6440 | Legacy Standard D |
| 1003 | FOR-2134 | Seasonal Initiative | 1 | 10782179 | Primary Framework A |

The view `quality_workstream_nursing_forum_view` joins `quality_workstreams` to `nursing_forums` on `nursing_forum_id`, answering: *Which forum sponsors each workstream?* A row would pair workstream *Primary Framework A* (`10782179`) with forum *Compact Model* (`FOR-2131`), whose jurisdiction is `national` and status is `active`.

**View `quality_workstream_nursing_forum_view`**

```sql
CREATE VIEW quality_workstream_nursing_forum_view AS
SELECT a.quality_workstream_id, a.workstream_id, a.workstream_title, a.start_date, b.nursing_forum_id AS forum_nursing_forum_id, b.forum_identifier AS forum_forum_identifier, b.forum_name AS forum_forum_name
FROM quality_workstreams a JOIN nursing_forums b ON a.nursing_forum_id = b.nursing_forum_id;
```

| quality_workstream_id | workstream_id | workstream_title | start_date | forum_nursing_forum_id | forum_forum_identifier | forum_forum_name |
|---|---|---|---|---|---|---|
| 1 | 10782179 | Primary Framework A | 2022-09-05T20:24:00 | 1000 | FOR-2131 | Compact Model |
| 2 | 3001009030140 | Composite Protocol | 2023-02-16T03:41:00 | 1001 | FOR-2132 | Legacy Cluster |
| 3 | 8928521 | Compact Programme | 2024-07-27T10:58:00 | 1002 | FOR-2133 | Regional Review A |
| 4 | 6440 | Legacy Standard D | 2025-12-11T17:15:00 | 1003 | FOR-2134 | Seasonal Initiative |

### Workstream-Centric Views

The view `quality_workstream_nursing_professional_view` joins `quality_workstreams` to `nursing_professionals` on `nursing_professional_id`, answering: *Which professional is assigned to each workstream?* A row would pair workstream *Composite Protocol* (`3001009030140`) with professional *Account Name* (`REG-2142`), whose role is *Primary Review* and who has 10 years of experience.

**View `quality_workstream_nursing_professional_view`**

```sql
CREATE VIEW quality_workstream_nursing_professional_view AS
SELECT a.quality_workstream_id, a.workstream_id, a.workstream_title, a.start_date, b.id AS professional_id, b.professional_id AS professional_professional_id, b.full_name AS professional_full_name
FROM quality_workstreams a JOIN nursing_professionals b ON a.nursing_professional_id = b.id;
```

| quality_workstream_id | workstream_id | workstream_title | start_date | professional_id | professional_professional_id | professional_full_name |
|---|---|---|---|---|---|---|
| 1 | 10782179 | Primary Framework A | 2022-09-05T20:24:00 | 1 | 5082965 | Theodore Mcgrath |
| 2 | 3001009030140 | Composite Protocol | 2023-02-16T03:41:00 | 2 | 2618560 | Account Name |
| 3 | 8928521 | Compact Programme | 2024-07-27T10:58:00 | 3 | 3355767 | Saipan International Airport |
| 4 | 6440 | Legacy Standard D | 2025-12-11T17:15:00 | 4 | 3355784 | Norma Fisher |

The view `quality_workstream_clinical_outcome_view` joins `quality_workstreams` to `clinical_outcomes` on `clinical_outcome_id`, answering: *Which clinical outcome does each workstream measure?* A row would pair workstream *Legacy Standard D* (`6440`) with outcome *quality_rating* (`1210-0007-M`), whose measurement value is 24.80 percent and whose trend is `improving`.

**View `quality_workstream_clinical_outcome_view`**

```sql
CREATE VIEW quality_workstream_clinical_outcome_view AS
SELECT a.quality_workstream_id, a.workstream_id, a.workstream_title, a.start_date, b.clinical_outcome_id AS outcome_clinical_outcome_id, b.outcome_id AS outcome_outcome_id, b.outcome_type AS outcome_outcome_type
FROM quality_workstreams a JOIN clinical_outcomes b ON a.clinical_outcome_id = b.clinical_outcome_id;
```

| quality_workstream_id | workstream_id | workstream_title | start_date | outcome_clinical_outcome_id | outcome_outcome_id | outcome_outcome_type |
|---|---|---|---|---|---|---|
| 1 | 10782179 | Primary Framework A | 2022-09-05T20:24:00 | 1000 | 2618555 | infection_rate |
| 2 | 3001009030140 | Composite Protocol | 2023-02-16T03:41:00 | 1001 | lu_tax_code_template_m46 | patient_satisfaction |
| 3 | 8928521 | Compact Programme | 2024-07-27T10:58:00 | 1002 | 168561 | mortality_rate |
| 4 | 6440 | Legacy Standard D | 2025-12-11T17:15:00 | 1003 | 1210-0007-M | quality_rating |

### Trust-Centric Views

The view `health_trust_nursing_professional_detail_view` joins `health_trusts` to `nursing_professionals` on `health_trust_id`, answering: *What are the complete details of every professional employed by each trust?* A row for trust *Compact Framework* (`5f923cfa-8fcd-11eb-924d-9cd76263cbd0`) would include Theodore Mcgrath's full profile: registration `REG-2136`, qualification `compact-primary-14`, 7 years of experience, and fellowship status `true`.

**View `health_trust_nursing_professional_detail_view`**

```sql
CREATE VIEW health_trust_nursing_professional_detail_view AS
SELECT a.health_trust_id, a.trust_id, a.trust_name, b.id AS professional_id, b.professional_id AS professional_professional_id, b.full_name AS professional_full_name
FROM health_trusts a
  JOIN trusts_professionals j ON j.health_trust_id = a.health_trust_id
  JOIN nursing_professionals b ON b.id = j.nursing_professional_id;
```

| health_trust_id | trust_id | trust_name | professional_id | professional_professional_id | professional_full_name |
|---|---|---|---|---|---|
| 1 | 5f923cfa-8fcd-11eb-924d-9cd76263cbd0 | Compact Framework | 1 | 5082965 | Theodore Mcgrath |
| 1 | 5f923cfa-8fcd-11eb-924d-9cd76263cbd0 | Compact Framework | 2 | 2618560 | Account Name |
| 2 | 8387551 | Legacy Protocol | 2 | 2618560 | Account Name |
| 2 | 8387551 | Legacy Protocol | 3 | 3355767 | Saipan International Airport |
| 3 | ChIJAaQOcwdu5kcRArYphCv0bl0 | Regional Programme A | 3 | 3355767 | Saipan International Airport |
| 3 | ChIJAaQOcwdu5kcRArYphCv0bl0 | Regional Programme A | 4 | 3355784 | Norma Fisher |
| 4 | 27cebc1c-9bad-11eb-a8a2-19ed5c03f8d3 | Seasonal Standard | 4 | 3355784 | Norma Fisher |
| 4 | 27cebc1c-9bad-11eb-a8a2-19ed5c03f8d3 | Seasonal Standard | 1 | 5082965 | Theodore Mcgrath |

The view `health_trust_clinical_outcome_view` joins `health_trusts` to `clinical_outcomes` on `health_trust_id`, answering: *Which clinical outcomes are governed by each trust?* A row would pair trust *Legacy Protocol* (`8387551`) with outcome *patient_satisfaction* (`lu_tax_code_template_m46`), whose measurement value is 17.90 count and whose trend is `declining`.

**View `health_trust_clinical_outcome_view`**

```sql
CREATE VIEW health_trust_clinical_outcome_view AS
SELECT a.health_trust_id, a.trust_id, a.trust_name, a.trust_type, b.clinical_outcome_id AS outcome_clinical_outcome_id, b.outcome_id AS outcome_outcome_id, b.outcome_type AS outcome_outcome_type
FROM health_trusts a JOIN clinical_outcomes b ON a.clinical_outcome_id = b.clinical_outcome_id;
```

| health_trust_id | trust_id | trust_name | trust_type | outcome_clinical_outcome_id | outcome_outcome_id | outcome_outcome_type |
|---|---|---|---|---|---|---|
| 1 | 5f923cfa-8fcd-11eb-924d-9cd76263cbd0 | Compact Framework | Foundation_Trust | 1000 | 2618555 | infection_rate |
| 2 | 8387551 | Legacy Protocol | Specialist_Trust | 1001 | lu_tax_code_template_m46 | patient_satisfaction |
| 3 | ChIJAaQOcwdu5kcRArYphCv0bl0 | Regional Programme A | Acute_Trust | 1002 | 168561 | mortality_rate |
| 4 | 27cebc1c-9bad-11eb-a8a2-19ed5c03f8d3 | Seasonal Standard | Foundation_Trust | 1003 | 1210-0007-M | quality_rating |

### Outcome-Centric Views

The view `clinical_outcome_health_trust_view` joins `clinical_outcomes` to `health_trusts` on `health_trust_id`, answering: *Which trust is responsible for each clinical outcome?* A row would pair outcome *mortality_rate* (`168561`) with trust *Regional Programme A* (`ChIJAaQOcwdu5kcRArYphCv0bl0`), whose type is `Acute_Trust` and CQC rating is `requires_improvement`.

**View `clinical_outcome_health_trust_view`**

```sql
CREATE VIEW clinical_outcome_health_trust_view AS
SELECT a.clinical_outcome_id, a.outcome_id, a.outcome_type, a.measurement_value, b.health_trust_id AS trust_health_trust_id, b.trust_id AS trust_trust_id, b.trust_name AS trust_trust_name
FROM clinical_outcomes a JOIN health_trusts b ON a.health_trust_id = b.health_trust_id;
```

| clinical_outcome_id | outcome_id | outcome_type | measurement_value | trust_health_trust_id | trust_trust_id | trust_trust_name |
|---|---|---|---|---|---|---|
| 1000 | 2618555 | infection_rate | 14.45 | 1 | 5f923cfa-8fcd-11eb-924d-9cd76263cbd0 | Compact Framework |
| 1001 | lu_tax_code_template_m46 | patient_satisfaction | 17.90 | 2 | 8387551 | Legacy Protocol |
| 1002 | 168561 | mortality_rate | 21.35 | 3 | ChIJAaQOcwdu5kcRArYphCv0bl0 | Regional Programme A |
| 1003 | 1210-0007-M | quality_rating | 24.80 | 4 | 27cebc1c-9bad-11eb-a8a2-19ed5c03f8d3 | Seasonal Standard |

The view `clinical_outcome_quality_workstream_view` joins `clinical_outcomes` to `quality_workstreams` on `quality_workstream_id`, answering: *Which workstream tracks each clinical outcome?* A row would pair outcome *quality_rating* (`1210-0007-M`) with workstream *Legacy Standard D* (`6440`), whose scope is `staff_engagement` and status is `suspended`.

**View `clinical_outcome_quality_workstream_view`**

```sql
CREATE VIEW clinical_outcome_quality_workstream_view AS
SELECT a.clinical_outcome_id, a.outcome_id, a.outcome_type, a.measurement_value, b.quality_workstream_id AS workstream_quality_workstream_id, b.workstream_id AS workstream_workstream_id, b.workstream_title AS workstream_workstream_title
FROM clinical_outcomes a JOIN quality_workstreams b ON a.quality_workstream_id = b.quality_workstream_id;
```

| clinical_outcome_id | outcome_id | outcome_type | measurement_value | workstream_quality_workstream_id | workstream_workstream_id | workstream_workstream_title |
|---|---|---|---|---|---|---|
| 1000 | 2618555 | infection_rate | 14.45 | 1 | 10782179 | Primary Framework A |
| 1001 | lu_tax_code_template_m46 | patient_satisfaction | 17.90 | 2 | 3001009030140 | Composite Protocol |
| 1002 | 168561 | mortality_rate | 21.35 | 3 | 8928521 | Compact Programme |
| 1003 | 1210-0007-M | quality_rating | 24.80 | 4 | 6440 | Legacy Standard D |

The view `clinical_outcome_nursing_professional_view` joins `clinical_outcomes` to `nursing_professionals` on `nursing_professional_id`, answering: *Which professional is associated with each clinical outcome?* A row would pair outcome *infection_rate* (`2618555`) with professional *Theodore Mcgrath* (`REG-2136`), whose role is *Adaptive Cluster* and who holds a fellowship.

**View `clinical_outcome_nursing_professional_view`**

```sql
CREATE VIEW clinical_outcome_nursing_professional_view AS
SELECT a.clinical_outcome_id, a.outcome_id, a.outcome_type, a.measurement_value, b.id AS professional_id, b.professional_id AS professional_professional_id, b.full_name AS professional_full_name
FROM clinical_outcomes a JOIN nursing_professionals b ON a.nursing_professional_id = b.id;
```

| clinical_outcome_id | outcome_id | outcome_type | measurement_value | professional_id | professional_professional_id | professional_full_name |
|---|---|---|---|---|---|---|
| 1000 | 2618555 | infection_rate | 14.45 | 1 | 5082965 | Theodore Mcgrath |
| 1001 | lu_tax_code_template_m46 | patient_satisfaction | 17.90 | 2 | 2618560 | Account Name |
| 1002 | 168561 | mortality_rate | 21.35 | 3 | 3355767 | Saipan International Airport |
| 1003 | 1210-0007-M | quality_rating | 24.80 | 4 | 3355784 | Norma Fisher |

### Institution-Centric Views

The view `educational_institution_nursing_professional_detail_view` joins `educational_institutions` to `nursing_professionals` on `educational_institution_id`, answering: *What are the complete details of every professional associated with each educational institution?* A row for institution *Extended Corridor* (`9424913`), a `university` at `extended-location-99`, would include Theodore Mcgrath's full profile: registration `REG-2136`, 7 years of experience, and role *Adaptive Cluster*.

**View `educational_institution_nursing_professional_detail_view`**

```sql
CREATE VIEW educational_institution_nursing_professional_detail_view AS
SELECT a.id, a.institution_id, a.institution_name, b.id AS professional_id, b.professional_id AS professional_professional_id, b.full_name AS professional_full_name
FROM educational_institutions a
  JOIN institutions_professionals j ON j.educational_institution_id = a.id
  JOIN nursing_professionals b ON b.id = j.nursing_professional_id;
```

| id | institution_id | institution_name | professional_id | professional_professional_id | professional_full_name |
|---|---|---|---|---|---|
| 1 | 9424913 | Extended Corridor | 1 | 5082965 | Theodore Mcgrath |
| 1 | 9424913 | Extended Corridor | 2 | 2618560 | Account Name |
| 2 | 8189481 | Pilot Series A | 2 | 2618560 | Account Name |
| 2 | 8189481 | Pilot Series A | 3 | 3355767 | Saipan International Airport |
| 3 | 1437604 | Baseline Assessment | 3 | 3355767 | Saipan International Airport |
| 3 | 1437604 | Baseline Assessment | 4 | 3355784 | Norma Fisher |
| 4 | 884346 | Distributed Survey | 4 | 3355784 | Norma Fisher |
| 4 | 884346 | Distributed Survey | 1 | 5082965 | Theodore Mcgrath |

## Synthesis

The schema models the nursing domain as a set of six core entities connected through a mix of direct foreign keys and junction tables. The `nursing_professionals` table sits at the centre, carrying foreign keys to `health_trusts`, `nursing_forums`, `quality_workstreams`, and `educational_institutions`, while the `quality_workstreams` and `clinical_outcomes` tables form a secondary hub through their mutual foreign keys. The four junction tables — `forums_professionals`, `forums_workstreams`, `trusts_professionals`, and `institutions_professionals` — handle the many-to-many relationships that the direct foreign keys cannot express. The sixteen views materialise specific joins across these tables, each view answering a single analytical question by reconstructing a domain fact from the normalised base tables. Together, the base tables and views provide a complete, queryable representation of the nursing data fabric, from individual professional records up through organisational trusts and clinical outcome measurements.