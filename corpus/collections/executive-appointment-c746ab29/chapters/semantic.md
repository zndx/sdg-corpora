## Ontology-Grounded Relational Modelling of Executive Governance

The executive governance domain captures the interlocking relationships between people, organisations, roles, and geographic jurisdictions that define corporate leadership structures. At its core, the model tracks appointments — the formal events that bind an executive person to a corporate entity in a specific role — and enriches those appointments with temporal metadata, status flags, and hierarchical context. The relational schema materialises this domain through five base tables and eleven derived views, each table corresponding to an ontology class and each view reconstructing a domain fact from the normalised tables. The following sections walk through the entity types, their attributes, the foreign-key topology that connects them, and the view-level joins that answer concrete business questions.

**Table `executive_appointments`**

| executive_appointment_id | appointment_date | start_date | end_date | appointment_status | appointment_identifier | executive_person_id | corporate_entity_id | executive_role_id | created_at |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 2022-05-03 | 2022-09-05 | 2022-09-01 | active | APP-2343 | 1 | 1 | 1 | 2025-01-01 00:14:00 |
| 2 | 2023-10-14 | 2023-02-16 | 2023-02-12 | terminated | APP-2345 | 2 | 2 | 2 | 2025-02-06 03:14:00 |
| 3 | 2024-03-25 | 2024-07-27 | 2024-07-23 | pending | APP-2347 | 3 | 3 | 3 | 2025-03-11 06:14:00 |
| 4 | 2025-08-09 | 2025-12-11 | 2025-12-07 | active | APP-2349 | 4 | 4 | 4 | 2025-04-16 09:14:00 |

The `executive_appointments` table is the central fact table of the schema. Each row represents a single appointment event, identified by `executive_appointment_id` (a surrogate key such as `1`, `2`, `3`, `4`) and a human-readable `appointment_identifier` like `APP-2343` or `APP-2349`. Temporal attributes — `appointment_date`, `start_date`, and `end_date` — record when the appointment was made, when it took effect, and when it concluded. For example, appointment `APP-2343` was made on `2022-05-03`, started on `2022-09-05`, and ended on `2022-09-01`, suggesting a retroactive or backdated arrangement. The `appointment_status` column constrains the lifecycle state to values such as `active`, `terminated`, or `pending`. Three foreign keys anchor the appointment to the rest of the domain: `executive_person_id` references `executive_persons.id`, `corporate_entity_id` references `corporate_entities.corporate_entity_id`, and `executive_role_id` references `executive_roles.id`. The `created_at` timestamp records when the row was inserted into the system. Cardinality is one-to-many in each direction: one executive person can hold multiple appointments over time, one corporate entity can employ multiple executives, and one role title can be assigned across multiple entities.

**Table `executive_persons`**

| id | person_identifier | full_name | professional_title | certification_status | certification_body | executive_appointment_id | corporate_entity_id |
|---|---|---|---|---|---|---|---|
| 1 | Block Magic | Theodore Mcgrath | Integrated Programme A | fellow | integrated-certific-58 | 1 | 1 |
| 2 | Susan Butler | Account Name | Extended Standard | member | seasonal-certific-59 | 2 | 2 |
| 3 | Guam International Airport | Saipan International Airport | Pilot Framework | candidate | regional-certific-60 | 3 | 3 |
| 4 | Norma Fisher | Norma Fisher | Baseline Protocol D | none | legacy-certific-61 | 4 | 4 |

The `executive_persons` table stores the canonical records of individual executives. Its primary key is `id`, and the `person_identifier` column carries a free-text label — `Block Magic` for person `1`, `Susan Butler` for person `2`, `Guam International Airport` for person `3`, and `Norma Fisher` for person `4`. The `full_name` column provides the legal name; notably, person `4` (Norma Fisher) has a `full_name` that matches the `person_identifier`, while person `3` has a `full_name` of `Saipan International Airport`, illustrating that identifiers and names are not constrained to be human names in this fictional schema. The `professional_title` field captures the executive's domain specialisation, with values such as `Integrated Programme A`, `Extended Standard`, `Pilot Framework`, and `Baseline Protocol D`. Certification metadata is stored in `certification_status` (with values `fellow`, `member`, `candidate`, or `none`) and `certification_body` (e.g., `integrated-certific-58`, `seasonal-certific-59`). Two foreign keys link this table outward: `executive_appointment_id` points back to `executive_appointments.executive_appointment_id`, and `corporate_entity_id` points to `corporate_entities.corporate_entity_id`. The bidirectional link between `executive_persons` and `executive_appointments` means the schema supports both appointment-centric and person-centric queries.

**Table `corporate_entities`**

| corporate_entity_id | entity_identifier | legal_name | jurisdiction | market_segment | entity_status | executive_person_id | has_subsidiary_corporate_entity_id | geographic_region_id |
|---|---|---|---|---|---|---|---|---|
| 1 | ENT-2129 | Adaptive Model | regional-jurisdic-30 | primary-market-10 | active | 1 | 1 | 1 |
| 2 | ENT-2135 | Primary Cluster | legacy-jurisdic-31 | adaptive-market-11 | dissolved | 2 | 2 | 2 |
| 3 | ENT-2141 | Composite Review D | compact-jurisdic-32 | distributed-market-12 | merged | 3 | 3 | 3 |
| 4 | ENT-2147 | Compact Initiative | composite-jurisdic-33 | baseline-market-13 | active | 4 | 4 | 4 |

The `corporate_entities` table models the organisations at the heart of the governance domain. Its primary key is `corporate_entity_id`, and the `entity_identifier` column provides a short code such as `ENT-2129` or `ENT-2147`. The `legal_name` column holds the full organisational name — `Adaptive Model`, `Primary Cluster`, `Composite Review D`, and `Compact Initiative` — while `jurisdiction` records the legal jurisdiction (e.g., `regional-jurisdic-30`, `legacy-jurisdic-31`). The `market_segment` column classifies the entity's market focus (`primary-market-10`, `adaptive-market-11`, `distributed-market-12`, `baseline-market-13`), and `entity_status` tracks the corporate lifecycle state (`active`, `dissolved`, `merged`). A foreign key `executive_person_id` links the entity to its primary executive contact in `executive_persons.id`. The table also contains a self-referencing foreign key, `has_subsidiary_corporate_entity_id`, which points to `corporate_entities.corporate_entity_id` and encodes parent-subsidiary relationships; for instance, entity `1` (`Adaptive Model`) lists itself as its own subsidiary, and entity `2` (`Primary Cluster`) does the same. Finally, `geographic_region_id` references `geographic_regions.geographic_region_id`, anchoring each entity to a geographic jurisdiction.

**Table `executive_roles`**

| id | role_title | role_level | department | role_status | executive_appointment_id | corporate_entity_id |
|---|---|---|---|---|---|---|
| 1 | Distributed Standard | c-suite | adaptive-departme-89 | current | 1 | 1 |
| 2 | Adaptive Framework D | vp | distributed-departme-90 | former | 2 | 2 |
| 3 | Primary Protocol | director | baseline-departme-91 | interim | 3 | 3 |
| 4 | Composite Programme | manager | pilot-departme-92 | current | 4 | 4 |

The `executive_roles` table defines the role templates that executives occupy. Its primary key is `id`, and the `role_title` column carries descriptive names such as `Distributed Standard`, `Adaptive Framework D`, `Primary Protocol`, and `Composite Programme`. The `role_level` column encodes the seniority tier — `c-suite`, `vp`, `director`, or `manager` — while `department` identifies the organisational unit (`adaptive-departme-89`, `distributed-departme-90`, `baseline-departme-91`, `pilot-departme-92`). The `role_status` field indicates whether the role is `current`, `former`, or `interim`. Two foreign keys connect this table to the rest of the schema: `executive_appointment_id` references `executive_appointments.executive_appointment_id`, and `corporate_entity_id` references `corporate_entities.corporate_entity_id`. This design allows the same role title to be instantiated across multiple entities and appointments, supporting the many-to-many relationship between roles and organisations.

**Table `geographic_regions`**

| geographic_region_id | region_code | region_name | region_type | region_status | corporate_entity_id |
|---|---|---|---|---|---|
| 1 | 1562837 | Distributed Assessment | country | active | 1 |
| 2 | 6564391 | Adaptive Survey D | market | inactive | 2 |
| 3 | 778560 | Primary Corridor | zone | emerging | 3 |
| 4 | 8667ec1da10c4a0293d91388b49bc77c | Composite Series | country | active | 4 |

The `geographic_regions` table provides the spatial dimension of the governance model. Its primary key is `geographic_region_id`, and the `region_code` column holds a short code — `1562837`, `6564391`, `778560`, or the longer `8667ec1da10c4a0293d91388b49bc77c`. The `region_name` column gives a human-readable label such as `Distributed Assessment`, `Adaptive Survey D`, `Primary Corridor`, and `Composite Series`. The `region_type` column classifies the geographic unit as a `country`, `market`, or `zone`, and `region_status` records its operational state (`active`, `inactive`, or `emerging`). A single foreign key, `corporate_entity_id`, links each region to the corporate entity it governs. This is a one-to-many relationship: one corporate entity can be associated with multiple geographic regions, but each region belongs to exactly one entity.

The foreign-key topology of the schema forms a star-like graph centred on `executive_appointments`. The appointment table references three dimension tables — `executive_persons`, `corporate_entities`, and `executive_roles` — through its foreign keys `executive_person_id`, `corporate_entity_id`, and `executive_role_id`. Each of those dimension tables, in turn, references back to `executive_appointments` or to other dimensions: `executive_persons` links to `executive_appointments` and `corporate_entities`; `corporate_entities` links to `executive_persons`, itself (via the subsidiary self-reference), and `geographic_regions`; `executive_roles` links to `executive_appointments` and `corporate_entities`; and `geographic_regions` links to `corporate_entities`. This bidirectional referencing pattern ensures that queries can start from any entity type and traverse to related entities without requiring explicit junction tables — the appointment table itself serves as the join hub.

**View `executive_appointment_executive_person_view`**

```sql
CREATE VIEW executive_appointment_executive_person_view AS
SELECT a.executive_appointment_id, a.appointment_date, a.start_date, a.end_date, b.id AS person_id, b.person_identifier AS person_person_identifier, b.full_name AS person_full_name
FROM executive_appointments a JOIN executive_persons b ON a.executive_person_id = b.id;
```

| executive_appointment_id | appointment_date | start_date | end_date | person_id | person_person_identifier | person_full_name |
|---|---|---|---|---|---|---|
| 1 | 2022-05-03 | 2022-09-05 | 2022-09-01 | 1 | Block Magic | Theodore Mcgrath |
| 2 | 2023-10-14 | 2023-02-16 | 2023-02-12 | 2 | Susan Butler | Account Name |
| 3 | 2024-03-25 | 2024-07-27 | 2024-07-23 | 3 | Guam International Airport | Saipan International Airport |
| 4 | 2025-08-09 | 2025-12-11 | 2025-12-07 | 4 | Norma Fisher | Norma Fisher |

The view `executive_appointment_executive_person_view` answers the question: "Which executive person is associated with each appointment?" It performs an inner join between `executive_appointments` and `executive_persons` on the condition `a.executive_person_id = b.id`, projecting the appointment's temporal attributes alongside the person's identifier and name. The result for appointment `1` shows person `1` (`Block Magic`, full name `Theodore Mcgrath`) linked to the appointment dated `2022-05-03`. Appointment `2` pairs with person `2` (`Susan Butler`, full name `Account Name`), and appointment `4` pairs with person `4` (`Norma Fisher`, full name `Norma Fisher`). This view materialises the person-side of the appointment relationship, allowing downstream consumers to read appointment timelines alongside the names of the executives involved without writing a join.

**View `executive_appointment_corporate_entity_view`**

```sql
CREATE VIEW executive_appointment_corporate_entity_view AS
SELECT a.executive_appointment_id, a.appointment_date, a.start_date, a.end_date, b.corporate_entity_id AS entity_corporate_entity_id, b.entity_identifier AS entity_entity_identifier, b.legal_name AS entity_legal_name
FROM executive_appointments a JOIN corporate_entities b ON a.corporate_entity_id = b.corporate_entity_id;
```

| executive_appointment_id | appointment_date | start_date | end_date | entity_corporate_entity_id | entity_entity_identifier | entity_legal_name |
|---|---|---|---|---|---|---|
| 1 | 2022-05-03 | 2022-09-05 | 2022-09-01 | 1 | ENT-2129 | Adaptive Model |
| 2 | 2023-10-14 | 2023-02-16 | 2023-02-12 | 2 | ENT-2135 | Primary Cluster |
| 3 | 2024-03-25 | 2024-07-27 | 2024-07-23 | 3 | ENT-2141 | Composite Review D |
| 4 | 2025-08-09 | 2025-12-11 | 2025-12-07 | 4 | ENT-2147 | Compact Initiative |

The view `executive_appointment_corporate_entity_view` reconstructs the appointment-to-entity relationship by joining `executive_appointments` with `corporate_entities`. It surfaces the appointment's date range and status alongside the corporate entity's identifier and legal name, answering the question: "Which corporate entity is each appointment tied to?" For appointment `APP-2343` (id `1`), the view reveals the entity `ENT-2129` (`Adaptive Model`), while appointment `APP-2345` (id `2`) maps to `ENT-2135` (`Primary Cluster`). This view is essential for reporting on appointment activity by organisation, enabling stakeholders to see which entities have active, terminated, or pending appointments.

**View `executive_appointment_executive_role_view`**

```sql
CREATE VIEW executive_appointment_executive_role_view AS
SELECT a.executive_appointment_id, a.appointment_date, a.start_date, a.end_date, b.id AS role_id, b.role_title AS role_role_title, b.role_level AS role_role_level
FROM executive_appointments a JOIN executive_roles b ON a.executive_role_id = b.id;
```

| executive_appointment_id | appointment_date | start_date | end_date | role_id | role_role_title | role_role_level |
|---|---|---|---|---|---|---|
| 1 | 2022-05-03 | 2022-09-05 | 2022-09-01 | 1 | Distributed Standard | c-suite |
| 2 | 2023-10-14 | 2023-02-16 | 2023-02-12 | 2 | Adaptive Framework D | vp |
| 3 | 2024-03-25 | 2024-07-27 | 2024-07-23 | 3 | Primary Protocol | director |
| 4 | 2025-08-09 | 2025-12-11 | 2025-12-07 | 4 | Composite Programme | manager |

The view `executive_appointment_executive_role_view` joins `executive_appointments` with `executive_roles` to answer: "What role does each appointment correspond to?" It projects the appointment's temporal metadata alongside the role's title, level, and department. Appointment `1` (`APP-2343`) is associated with role `1` (`Distributed Standard`, level `c-suite`, department `adaptive-departme-89`), while appointment `4` (`APP-2349`) corresponds to role `4` (`Composite Programme`, level `manager`, department `pilot-departme-92`). This view enables hierarchical analysis of the executive team, revealing the distribution of seniority levels across appointments and identifying which departments hold which role titles.

**View `executive_person_executive_appointment_view`**

```sql
CREATE VIEW executive_person_executive_appointment_view AS
SELECT a.id, a.person_identifier, a.full_name, a.professional_title, b.executive_appointment_id AS appointment_executive_appointment_id, b.appointment_date AS appointment_appointment_date, b.start_date AS appointment_start_date
FROM executive_persons a JOIN executive_appointments b ON a.executive_appointment_id = b.executive_appointment_id;
```

| id | person_identifier | full_name | professional_title | appointment_executive_appointment_id | appointment_appointment_date | appointment_start_date |
|---|---|---|---|---|---|---|
| 1 | Block Magic | Theodore Mcgrath | Integrated Programme A | 1 | 2022-05-03 | 2022-09-05 |
| 2 | Susan Butler | Account Name | Extended Standard | 2 | 2023-10-14 | 2023-02-16 |
| 3 | Guam International Airport | Saipan International Airport | Pilot Framework | 3 | 2024-03-25 | 2024-07-27 |
| 4 | Norma Fisher | Norma Fisher | Baseline Protocol D | 4 | 2025-08-09 | 2025-12-11 |

The view `executive_person_executive_appointment_view` inverts the perspective of the appointment-person relationship by joining `executive_persons` with `executive_appointments`. It answers: "Which appointments is each executive person involved in?" Person `1` (`Block Magic`, full name `Theodore Mcgrath`) is linked to appointment `1` (`APP-2343`), dated `2022-05-03` with status `active`. Person `2` (`Susan Butler`, full name `Account Name`) is linked to appointment `2` (`APP-2345`), dated `2023-10-14` with status `terminated`. This person-centric view is useful for building executive profiles that aggregate their appointment history, certification status, and professional titles in a single result set.

**View `executive_person_corporate_entity_view`**

```sql
CREATE VIEW executive_person_corporate_entity_view AS
SELECT a.id, a.person_identifier, a.full_name, a.professional_title, b.corporate_entity_id AS entity_corporate_entity_id, b.entity_identifier AS entity_entity_identifier, b.legal_name AS entity_legal_name
FROM executive_persons a JOIN corporate_entities b ON a.corporate_entity_id = b.corporate_entity_id;
```

| id | person_identifier | full_name | professional_title | entity_corporate_entity_id | entity_entity_identifier | entity_legal_name |
|---|---|---|---|---|---|---|
| 1 | Block Magic | Theodore Mcgrath | Integrated Programme A | 1 | ENT-2129 | Adaptive Model |
| 2 | Susan Butler | Account Name | Extended Standard | 2 | ENT-2135 | Primary Cluster |
| 3 | Guam International Airport | Saipan International Airport | Pilot Framework | 3 | ENT-2141 | Composite Review D |
| 4 | Norma Fisher | Norma Fisher | Baseline Protocol D | 4 | ENT-2147 | Compact Initiative |

The view `executive_person_corporate_entity_view` joins `executive_persons` with `corporate_entities` on the shared `corporate_entity_id` foreign key, answering: "Which corporate entity is each executive person associated with?" Person `1` (`Block Magic`) is associated with entity `1` (`ENT-2129`, `Adaptive Model`), and person `2` (`Susan Butler`) with entity `2` (`ENT-2135`, `Primary Cluster`). This view materialises the direct person-to-entity linkage stored in the `executive_persons` table, providing a flat view of the executive-to-organisation mapping that is independent of the appointment timeline.

**View `corporate_entity_executive_person_view`**

```sql
CREATE VIEW corporate_entity_executive_person_view AS
SELECT a.corporate_entity_id, a.entity_identifier, a.legal_name, a.jurisdiction, b.id AS person_id, b.person_identifier AS person_person_identifier, b.full_name AS person_full_name
FROM corporate_entities a JOIN executive_persons b ON a.executive_person_id = b.id;
```

| corporate_entity_id | entity_identifier | legal_name | jurisdiction | person_id | person_person_identifier | person_full_name |
|---|---|---|---|---|---|---|
| 1 | ENT-2129 | Adaptive Model | regional-jurisdic-30 | 1 | Block Magic | Theodore Mcgrath |
| 2 | ENT-2135 | Primary Cluster | legacy-jurisdic-31 | 2 | Susan Butler | Account Name |
| 3 | ENT-2141 | Composite Review D | compact-jurisdic-32 | 3 | Guam International Airport | Saipan International Airport |
| 4 | ENT-2147 | Compact Initiative | composite-jurisdic-33 | 4 | Norma Fisher | Norma Fisher |

The view `corporate_entity_executive_person_view` joins `corporate_entities` with `executive_persons` to answer: "Which executive person is linked to each corporate entity?" Entity `1` (`ENT-2129`, `Adaptive Model`) is linked to person `1` (`Block Magic`, full name `Theodore Mcgrath`), and entity `4` (`ENT-2147`, `Compact Initiative`) to person `4` (`Norma Fisher`, full name `Norma Fisher`). This entity-centric view is the inverse of the person-to-entity view and is useful for organisational charts that start from the entity and drill down to the responsible executive.

**View `corporate_entity_corporate_entity_view`**

```sql
CREATE VIEW corporate_entity_corporate_entity_view AS
SELECT a.corporate_entity_id, a.entity_identifier, a.legal_name, a.jurisdiction, b.corporate_entity_id AS entity_corporate_entity_id, b.entity_identifier AS entity_entity_identifier, b.legal_name AS entity_legal_name
FROM corporate_entities a JOIN corporate_entities b ON a.has_subsidiary_corporate_entity_id = b.corporate_entity_id;
```

| corporate_entity_id | entity_identifier | legal_name | jurisdiction | entity_corporate_entity_id | entity_entity_identifier | entity_legal_name |
|---|---|---|---|---|---|---|
| 1 | ENT-2129 | Adaptive Model | regional-jurisdic-30 | 1 | ENT-2129 | Adaptive Model |
| 2 | ENT-2135 | Primary Cluster | legacy-jurisdic-31 | 2 | ENT-2135 | Primary Cluster |
| 3 | ENT-2141 | Composite Review D | compact-jurisdic-32 | 3 | ENT-2141 | Composite Review D |
| 4 | ENT-2147 | Compact Initiative | composite-jurisdic-33 | 4 | ENT-2147 | Compact Initiative |

The view `corporate_entity_corporate_entity_view` performs a self-join on `corporate_entities` using the `has_subsidiary_corporate_entity_id` foreign key, answering: "Which corporate entities are subsidiaries of which parent entities?" In the data, entity `1` (`Adaptive Model`) lists itself as its subsidiary, and entity `2` (`Primary Cluster`) does the same, indicating a self-referential or circular subsidiary relationship. This view is critical for building organisational hierarchies and for auditing the corporate structure to detect circular references or orphaned subsidiary links.

**View `corporate_entity_geographic_region_view`**

```sql
CREATE VIEW corporate_entity_geographic_region_view AS
SELECT a.corporate_entity_id, a.entity_identifier, a.legal_name, a.jurisdiction, b.geographic_region_id AS region_geographic_region_id, b.region_code AS region_region_code, b.region_name AS region_region_name
FROM corporate_entities a JOIN geographic_regions b ON a.geographic_region_id = b.geographic_region_id;
```

| corporate_entity_id | entity_identifier | legal_name | jurisdiction | region_geographic_region_id | region_region_code | region_region_name |
|---|---|---|---|---|---|---|
| 1 | ENT-2129 | Adaptive Model | regional-jurisdic-30 | 1 | 1562837 | Distributed Assessment |
| 2 | ENT-2135 | Primary Cluster | legacy-jurisdic-31 | 2 | 6564391 | Adaptive Survey D |
| 3 | ENT-2141 | Composite Review D | compact-jurisdic-32 | 3 | 778560 | Primary Corridor |
| 4 | ENT-2147 | Compact Initiative | composite-jurisdic-33 | 4 | 8667ec1da10c4a0293d91388b49bc77c | Composite Series |

The view `corporate_entity_geographic_region_view` joins `corporate_entities` with `geographic_regions` to answer: "Which geographic region is associated with each corporate entity?" Entity `1` (`ENT-2129`, `Adaptive Model`) is linked to region `1` (`1562837`, `Distributed Assessment`, type `country`, status `active`), and entity `3` (`ENT-2141`, `Composite Review D`) to region `3` (`778560`, `Primary Corridor`, type `zone`, status `emerging`). This view enables geographic analysis of the corporate footprint, revealing which jurisdictions each entity operates in and the distribution of region types (country, market, zone) across the portfolio.

**View `executive_role_executive_appointment_view`**

```sql
CREATE VIEW executive_role_executive_appointment_view AS
SELECT a.id, a.role_title, a.role_level, a.department, b.executive_appointment_id AS appointment_executive_appointment_id, b.appointment_date AS appointment_appointment_date, b.start_date AS appointment_start_date
FROM executive_roles a JOIN executive_appointments b ON a.executive_appointment_id = b.executive_appointment_id;
```

| id | role_title | role_level | department | appointment_executive_appointment_id | appointment_appointment_date | appointment_start_date |
|---|---|---|---|---|---|---|
| 1 | Distributed Standard | c-suite | adaptive-departme-89 | 1 | 2022-05-03 | 2022-09-05 |
| 2 | Adaptive Framework D | vp | distributed-departme-90 | 2 | 2023-10-14 | 2023-02-16 |
| 3 | Primary Protocol | director | baseline-departme-91 | 3 | 2024-03-25 | 2024-07-27 |
| 4 | Composite Programme | manager | pilot-departme-92 | 4 | 2025-08-09 | 2025-12-11 |

The view `executive_role_executive_appointment_view` joins `executive_roles` with `executive_appointments` to answer: "Which appointment corresponds to each executive role?" Role `1` (`Distributed Standard`, level `c-suite`, department `adaptive-departme-89`, status `current`) is linked to appointment `1` (`APP-2343`), dated `2022-05-03` with status `active`. Role `2` (`Adaptive Framework D`, level `vp`, department `distributed-departme-90`, status `former`) is linked to appointment `2` (`APP-2345`), dated `2023-10-14` with status `terminated`. This view supports role-level reporting, enabling stakeholders to see which roles are currently active, which have been filled, and how role assignments map to appointment timelines.

**View `executive_role_corporate_entity_view`**

```sql
CREATE VIEW executive_role_corporate_entity_view AS
SELECT a.id, a.role_title, a.role_level, a.department, b.corporate_entity_id AS entity_corporate_entity_id, b.entity_identifier AS entity_entity_identifier, b.legal_name AS entity_legal_name
FROM executive_roles a JOIN corporate_entities b ON a.corporate_entity_id = b.corporate_entity_id;
```

| id | role_title | role_level | department | entity_corporate_entity_id | entity_entity_identifier | entity_legal_name |
|---|---|---|---|---|---|---|
| 1 | Distributed Standard | c-suite | adaptive-departme-89 | 1 | ENT-2129 | Adaptive Model |
| 2 | Adaptive Framework D | vp | distributed-departme-90 | 2 | ENT-2135 | Primary Cluster |
| 3 | Primary Protocol | director | baseline-departme-91 | 3 | ENT-2141 | Composite Review D |
| 4 | Composite Programme | manager | pilot-departme-92 | 4 | ENT-2147 | Compact Initiative |

The view `executive_role_corporate_entity_view` joins `executive_roles` with `corporate_entities` to answer: "Which corporate entity is each executive role associated with?" Role `1` (`Distributed Standard`) is associated with entity `1` (`ENT-2129`, `Adaptive Model`), and role `4` (`Composite Programme`) with entity `4` (`ENT-2147`, `Compact Initiative`). This view materialises the role-to-entity linkage, enabling analysis of which entities employ which role titles and departments, and supporting cross-entity comparisons of role distribution.

**View `geographic_region_corporate_entity_view`**

```sql
CREATE VIEW geographic_region_corporate_entity_view AS
SELECT a.geographic_region_id, a.region_code, a.region_name, a.region_type, b.corporate_entity_id AS entity_corporate_entity_id, b.entity_identifier AS entity_entity_identifier, b.legal_name AS entity_legal_name
FROM geographic_regions a JOIN corporate_entities b ON a.corporate_entity_id = b.corporate_entity_id;
```

| geographic_region_id | region_code | region_name | region_type | entity_corporate_entity_id | entity_entity_identifier | entity_legal_name |
|---|---|---|---|---|---|---|
| 1 | 1562837 | Distributed Assessment | country | 1 | ENT-2129 | Adaptive Model |
| 2 | 6564391 | Adaptive Survey D | market | 2 | ENT-2135 | Primary Cluster |
| 3 | 778560 | Primary Corridor | zone | 3 | ENT-2141 | Composite Review D |
| 4 | 8667ec1da10c4a0293d91388b49bc77c | Composite Series | country | 4 | ENT-2147 | Compact Initiative |

The view `geographic_region_corporate_entity_view` joins `geographic_regions` with `corporate_entities` to answer: "Which corporate entity operates in each geographic region?" Region `1` (`1562837`, `Distributed Assessment`, type `country`, status `active`) is associated with entity `1` (`ENT-2129`, `Adaptive Model`), and region `4` (`8667ec1da10c4a0293d91388b49bc77c`, `Composite Series`, type `country`, status `active`) with entity `4` (`ENT-2147`, `Compact Initiative`). This view provides a geographic lens on the corporate structure, revealing the spatial distribution of entities and enabling regional reporting on entity counts, statuses, and market segments.

The schema's design reflects a deliberate trade-off between normalisation and query convenience. The five base tables are in third normal form, with each table storing atomic attributes and foreign keys encoding relationships. The eleven views then materialise the most common join paths, allowing consumers to query domain facts without writing joins themselves. For example, the `executive_appointment_executive_person_view` collapses a two-table join into a single virtual table, while the `corporate_entity_corporate_entity_view` exposes the self-referencing subsidiary structure that would otherwise require a self-join in every query. Together, the base tables and views form a complete relational representation of the executive governance domain, capturing the people, organisations, roles, and geographic jurisdictions that define corporate leadership, along with the temporal and status metadata that tracks their evolution over time.