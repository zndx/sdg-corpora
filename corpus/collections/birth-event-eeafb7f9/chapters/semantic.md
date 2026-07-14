## Ontology-Grounded Schema Design for Civic Event Registries

The domain under examination concerns the recording and cross-referencing of civic life events—births, registrations, and legislative mandates—within a municipal or regional administrative context. At its core, the model captures a simple but richly connected scenario: a birth event occurs at a location, involves human participants (parents and infant), and may be accompanied by material provisions such as infant care items. Separately, the same humans and locations are enrolled in census registrations, which are themselves governed by legislative decrees. The ontology behind this schema distinguishes five principal entity types—`birth_events`, `humans`, `locations`, `census_registrations`, and `legislative_decrees`—alongside a supporting entity for `infant_care_items` and a junction table `decrees_registrations` that mediates the many-to-many relationship between decrees and registrations. Each entity type materializes as a base table whose columns correspond directly to ontology attributes, while foreign keys encode the cardinality-bounded relationships. Views then reassemble these normalized tables into denormalized projections that answer specific domain questions.

The foundational table, `birth_events`, anchors the entire model. It records each birth with a surrogate primary key `birth_event_id`, a business identifier `identifier` (such as `IDE-2086`), the date of birth (`birth_date`), and free-text fields for the infant's name, the mother's name, and the father's name. The table also carries denormalized copies of the location name (`location_name`) and parent names for query convenience, while the true relational structure is preserved through foreign keys `location_id`, `human_id`, `involves_mother_human_id`, and `involves_father_human_id` that point to the `locations` and `humans` tables respectively.

**Table `birth_events`**

| birth_event_id | identifier | birth_date | location_name | parent_female_name | parent_male_name | infant_name | location_id | human_id | involves_mother_human_id | involves_father_human_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 100 | IDE-2086 | 2023-10-18 | Legacy Review D | Legacy Assessment D | Extended Standard | Pilot Protocol | 1 | 1 | 1 | 1 |
| 101 | IDE-2091 | 2024-03-02 | Regional Initiative | Regional Survey | Pilot Framework A | Baseline Programme | 2 | 2 | 2 | 2 |
| 102 | IDE-2096 | 2025-08-13 | Seasonal Model | Seasonal Corridor | Baseline Protocol | Distributed Standard A | 3 | 3 | 3 | 3 |
| 103 | IDE-2101 | 2022-01-24 | Integrated Cluster A | Integrated Series A | Distributed Programme | Adaptive Framework | 4 | 4 | 4 | 4 |

Consider the first row: birth event `IDE-2086` occurred on `2023-10-18` at the location identified by `location_id = 1`, involved the mother recorded as `human_id = 1`, the father as `involves_father_human_id = 1`, and the infant as `human_id = 1`. The denormalized columns echo these relationships with `location_name = Legacy Review D`, `parent_female_name = Legacy Assessment D`, `parent_male_name = Extended Standard`, and `infant_name = Pilot Protocol`. This redundancy is intentional in the base table—it allows a single-table query to retrieve the full birth narrative without joins, while the foreign keys maintain referential integrity with the normalized entity tables.

The `humans` table stores the canonical records of individuals. Each row carries a surrogate `id`, the person's `given_name` and `family_name`, their `role` within the birth event context (one of `infant`, `mother`, `father`, or `resident`), an `ancestral_town` identifier, an `occupation` code, and two foreign keys: `location_id` linking the person to their current location, and `census_registration_id` linking them to their census record.

**Table `humans`**

| id | given_name | family_name | role | ancestral_town | occupation | location_id | census_registration_id |
|---|---|---|---|---|---|---|---|
| 1 | Dana Nguyen | Primary Corridor A | infant | composite-ancestra-99 | legacy-occupati-37 | 1 | 1 |
| 2 | Susan Levy | Composite Series | mother | primary-ancestra-100 | compact-occupati-38 | 2 | 2 |
| 3 | Elizabeth Woods | Compact Assessment | father | adaptive-ancestra-101 | composite-occupati-39 | 3 | 3 |
| 4 | Cheryl Bradley | Legacy Survey D | resident | distributed-ancestra-102 | primary-occupati-40 | 4 | 4 |

In the first row, `Dana Nguyen` holds the role of `infant`, resides at `location_id = 1`, and is registered in census record `census_registration_id = 1`. The second row records `Susan Levy` as a `mother` at `location_id = 2` with census registration `2`. The `role` column is the critical discriminator: it tells us whether a human record represents the infant, the mother, the father, or a resident of the location. This design allows a single `humans` table to serve multiple roles without requiring class-table inheritance or separate tables for each role.

The `locations` table provides the geographic and administrative context. Its columns are `id` (primary key), `name`, `type` (such as `town`, `stable`, `manger`, or `region`), `description`, and two foreign keys: `birth_event_id` and `human_id`. The presence of both foreign keys on `locations` creates a bidirectional relationship: a location can be the site of a birth event, and a location can be the residence of a human.

**Table `locations`**

| id | name | type | description | birth_event_id | human_id |
|---|---|---|---|---|---|
| 1 | Extended Review | town | Extended Survey | 100 | 1 |
| 2 | Pilot Initiative A | stable | Pilot Corridor A | 101 | 2 |
| 3 | Baseline Model | manger | Baseline Series | 102 | 3 |
| 4 | Distributed Cluster | region | Distributed Assessment | 103 | 4 |

Row `id = 1` describes `Extended Review` as a `town` with description `Extended Survey`, and it is linked to `birth_event_id = 100` and `human_id = 1`. This means the birth event `IDE-2086` (from the `birth_events` table) took place at the location `Extended Review`, and the human `Dana Nguyen` resides there. The `type` column distinguishes between settlement types, which could be used for geographic aggregation or filtering in analytical queries.

The `census_registrations` table records the administrative enrollment of individuals. Its primary key is `census_registration_id`, and it carries `registration_date`, `mandated_by` (a code referencing the governing decree), `purpose`, `registrant_name`, and three foreign keys: `legislative_decree_id` pointing to the `legislative_decrees` table, `human_id` pointing to the `humans` table, and `location_id` pointing to the `locations` table.

**Table `census_registrations`**

| census_registration_id | registration_date | mandated_by | purpose | registrant_name | legislative_decree_id | human_id | location_id |
|---|---|---|---|---|---|---|---|
| 1 | 2023-06-19 | baseline-mandated-31 | adaptive-purpose-11 | Seasonal Programme | 1 | 1 | 1 |
| 2 | 2024-11-03 | pilot-mandated-32 | distributed-purpose-12 | Integrated Standard | 2 | 2 | 2 |
| 3 | 2025-04-14 | extended-mandated-33 | baseline-purpose-13 | Extended Framework D | 3 | 3 | 3 |
| 4 | 2022-09-25 | integrated-mandated-34 | pilot-purpose-14 | Pilot Protocol | 4 | 4 | 4 |

The first census registration, `census_registration_id = 1`, was created on `2023-06-19`, was mandated by `baseline-mandated-31`, served the purpose `adaptive-purpose-11`, and enrolled the registrant `Seasonal Programme`. It is linked to `legislative_decree_id = 1`, `human_id = 1` (the infant `Dana Nguyen`), and `location_id = 1` (the town `Extended Review`). This row demonstrates how a single census record ties together a person, a place, and a legislative authority.

The `legislative_decrees` table stores the regulatory framework. Its columns are `id` (primary key), `issuer_name`, `issuance_date`, `mandate_description`, `objective`, `created_at`, and `updated_at`.

**Table `legislative_decrees`**

| id | issuer_name | issuance_date | mandate_description | objective | created_at | updated_at |
|---|---|---|---|---|---|---|
| 1 | Compact Series | 2022-01-17 | Regional Framework | distributed-objectiv-36 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | Legacy Assessment | 2023-06-01 | Seasonal Protocol D | baseline-objectiv-37 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | Regional Survey A | 2024-11-12 | Integrated Programme | pilot-objectiv-38 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | Seasonal Corridor | 2025-04-23 | Extended Standard | extended-objectiv-39 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Decree `id = 1` was issued by `Compact Series` on `2022-01-17`, carries the mandate description `Regional Framework`, and pursues the objective `distributed-objectiv-36`. It was created on `2025-01-01` and last updated on `2025-01-02`. The temporal columns `created_at` and `updated_at` enable audit trails, while the `mandate_description` and `objective` columns provide human-readable summaries of the decree's intent.

The `infant_care_items` table records material provisions associated with births. Its columns are `id` (primary key), `item_type` (such as `cloth`, `bed`, or `manger`), `material`, `condition`, `birth_event_id` (foreign key to `birth_events`), and `location_id` (foreign key to `locations`).

**Table `infant_care_items`**

| id | item_type | material | condition | birth_event_id | location_id |
|---|---|---|---|---|---|
| 100 | cloth | primary-material-94 | seasonal-conditio-89 | 100 | 1 |
| 101 | bed | adaptive-material-95 | regional-conditio-90 | 101 | 2 |
| 102 | manger | distributed-material-96 | legacy-conditio-91 | 102 | 3 |
| 103 | cloth | baseline-material-97 | compact-conditio-92 | 103 | 4 |

Item `id = 100` is a `cloth` of `primary-material-94` in condition `seasonal-conditio-89`, associated with `birth_event_id = 100` (the birth of `IDE-2086`) at `location_id = 1`. Item `id = 102` is a `manger` of `distributed-material-96` in condition `legacy-conditio-91`, linked to `birth_event_id = 102` and `location_id = 3`. The `item_type` column captures the category of care item, while `material` and `condition` provide descriptive attributes that could be used for inventory or quality tracking.

The `decrees_registrations` table serves as a junction table, mediating the many-to-many relationship between `legislative_decrees` and `census_registrations`. While the `census_registrations` table already carries a `legislative_decree_id` foreign key suggesting a direct one-to-many relationship (one decree governs many registrations), the presence of a dedicated junction table indicates that the model also supports scenarios where a registration may be associated with multiple decrees, or where the relationship is tracked independently for audit or historical reasons.

**Table `decrees_registrations`**

| legislative_decree_id | census_registration_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

The junction table enables flexible querying of decree-registration associations without modifying the core `census_registrations` structure. It likely contains at minimum `decree_id` and `registration_id` columns, forming a composite key that uniquely identifies each association.

With the base tables established, the views reassemble the normalized data into domain-meaningful projections. Each view answers a specific question by joining the relevant tables.

The view `v_birth_event_location` joins `birth_events` to `locations` on `birth_events.location_id = locations.id`, answering the question: "Where did each birth event occur?"

**View `v_birth_event_location`**

```sql
CREATE VIEW v_birth_event_location AS
SELECT a.birth_event_id, a.identifier, a.birth_date, a.location_name, b.id AS location_id, b.name AS location_name, b.type AS location_type
FROM birth_events a JOIN locations b ON a.location_id = b.id;
```

| birth_event_id | identifier | birth_date | location_name | location_id | location_name | location_type |
|---|---|---|---|---|---|---|
| 100 | IDE-2086 | 2023-10-18 | Legacy Review D | 1 | Extended Review | town |
| 101 | IDE-2091 | 2024-03-02 | Regional Initiative | 2 | Pilot Initiative A | stable |
| 102 | IDE-2096 | 2025-08-13 | Seasonal Model | 3 | Baseline Model | manger |
| 103 | IDE-2101 | 2022-01-24 | Integrated Cluster A | 4 | Distributed Cluster | region |

Reading the first row of this view, we see that birth event `IDE-2086` occurred at the location `Extended Review`, which is classified as a `town`. The view flattens the foreign key into a readable location name, making it suitable for reports that list births by place.

The view `v_birth_event_human` joins `birth_events` to `humans` on `birth_events.human_id = humans.id`, answering: "Who was the infant involved in each birth event?"

**View `v_birth_event_human`**

```sql
CREATE VIEW v_birth_event_human AS
SELECT a.birth_event_id, a.identifier, a.birth_date, a.location_name, b.id AS human_id, b.given_name AS human_given_name, b.family_name AS human_family_name
FROM birth_events a JOIN humans b ON a.human_id = b.id;
```

| birth_event_id | identifier | birth_date | location_name | human_id | human_given_name | human_family_name |
|---|---|---|---|---|---|---|
| 100 | IDE-2086 | 2023-10-18 | Legacy Review D | 1 | Dana Nguyen | Primary Corridor A |
| 101 | IDE-2091 | 2024-03-02 | Regional Initiative | 2 | Susan Levy | Composite Series |
| 102 | IDE-2096 | 2025-08-13 | Seasonal Model | 3 | Elizabeth Woods | Compact Assessment |
| 103 | IDE-2101 | 2022-01-24 | Integrated Cluster A | 4 | Cheryl Bradley | Legacy Survey D |

The first row shows that the infant in birth event `IDE-2086` is `Dana Nguyen`, whose role is recorded as `infant`. This view isolates the infant-parent relationship by joining the birth event to the human record that represents the child.

The view `v_human_location` joins `humans` to `locations` on `humans.location_id = locations.id`, answering: "Where does each person reside?"

**View `v_human_location`**

```sql
CREATE VIEW v_human_location AS
SELECT a.id, a.given_name, a.family_name, a.role, b.id AS location_id, b.name AS location_name, b.type AS location_type
FROM humans a JOIN locations b ON a.location_id = b.id;
```

| id | given_name | family_name | role | location_id | location_name | location_type |
|---|---|---|---|---|---|---|
| 1 | Dana Nguyen | Primary Corridor A | infant | 1 | Extended Review | town |
| 2 | Susan Levy | Composite Series | mother | 2 | Pilot Initiative A | stable |
| 3 | Elizabeth Woods | Compact Assessment | father | 3 | Baseline Model | manger |
| 4 | Cheryl Bradley | Legacy Survey D | resident | 4 | Distributed Cluster | region |

In the first row, `Dana Nguyen` resides at `Extended Review`, a `town`. The second row shows `Susan Levy` at `Pilot Initiative A`, classified as `stable`. This view is essential for geographic queries about population distribution.

The view `v_human_census_registration` joins `humans` to `census_registrations` on `humans.census_registration_id = census_registrations.census_registration_id`, answering: "Which census record is associated with each person?"

**View `v_human_census_registration`**

```sql
CREATE VIEW v_human_census_registration AS
SELECT a.id, a.given_name, a.family_name, a.role, b.census_registration_id AS registration_census_registration_id, b.registration_date AS registration_registration_date, b.mandated_by AS registration_mandated_by
FROM humans a JOIN census_registrations b ON a.census_registration_id = b.census_registration_id;
```

| id | given_name | family_name | role | registration_census_registration_id | registration_registration_date | registration_mandated_by |
|---|---|---|---|---|---|---|
| 1 | Dana Nguyen | Primary Corridor A | infant | 1 | 2023-06-19 | baseline-mandated-31 |
| 2 | Susan Levy | Composite Series | mother | 2 | 2024-11-03 | pilot-mandated-32 |
| 3 | Elizabeth Woods | Compact Assessment | father | 3 | 2025-04-14 | extended-mandated-33 |
| 4 | Cheryl Bradley | Legacy Survey D | resident | 4 | 2022-09-25 | integrated-mandated-34 |

The first row links `Dana Nguyen` to census registration `1`, which was created on `2023-06-19` and mandated by `baseline-mandated-31`. This view enables queries about the registration status of individuals.

The view `v_location_birth_event` joins `locations` to `birth_events` on `locations.id = birth_events.location_id`, answering: "Which birth events took place at each location?"

**View `v_location_birth_event`**

```sql
CREATE VIEW v_location_birth_event AS
SELECT a.id, a.name, a.type, a.description, b.birth_event_id AS event_birth_event_id, b.identifier AS event_identifier, b.birth_date AS event_birth_date
FROM locations a JOIN birth_events b ON a.birth_event_id = b.birth_event_id;
```

| id | name | type | description | event_birth_event_id | event_identifier | event_birth_date |
|---|---|---|---|---|---|---|
| 1 | Extended Review | town | Extended Survey | 100 | IDE-2086 | 2023-10-18 |
| 2 | Pilot Initiative A | stable | Pilot Corridor A | 101 | IDE-2091 | 2024-03-02 |
| 3 | Baseline Model | manger | Baseline Series | 102 | IDE-2096 | 2025-08-13 |
| 4 | Distributed Cluster | region | Distributed Assessment | 103 | IDE-2101 | 2022-01-24 |

The first row shows that location `Extended Review` (a `town`) was the site of birth event `IDE-2086`. This is the inverse of `v_birth_event_location` and is useful when querying from the location side—for example, finding all births in a given town.

The view `v_location_human` joins `locations` to `humans` on `locations.id = humans.location_id`, answering: "Which people reside at each location?"

**View `v_location_human`**

```sql
CREATE VIEW v_location_human AS
SELECT a.id, a.name, a.type, a.description, b.id AS human_id, b.given_name AS human_given_name, b.family_name AS human_family_name
FROM locations a JOIN humans b ON a.human_id = b.id;
```

| id | name | type | description | human_id | human_given_name | human_family_name |
|---|---|---|---|---|---|---|
| 1 | Extended Review | town | Extended Survey | 1 | Dana Nguyen | Primary Corridor A |
| 2 | Pilot Initiative A | stable | Pilot Corridor A | 2 | Susan Levy | Composite Series |
| 3 | Baseline Model | manger | Baseline Series | 3 | Elizabeth Woods | Compact Assessment |
| 4 | Distributed Cluster | region | Distributed Assessment | 4 | Cheryl Bradley | Legacy Survey D |

The first row shows that `Extended Review` is home to `Dana Nguyen`. This view supports population queries by location, such as counting residents per town.

The view `v_census_registration_legislative_decree` joins `census_registrations` to `legislative_decrees` on `census_registrations.legislative_decree_id = legislative_decrees.id`, answering: "Which legislative decree governs each census registration?"

**View `v_census_registration_legislative_decree`**

```sql
CREATE VIEW v_census_registration_legislative_decree AS
SELECT a.census_registration_id, a.registration_date, a.mandated_by, a.purpose, b.id AS decree_id, b.issuer_name AS decree_issuer_name, b.issuance_date AS decree_issuance_date
FROM census_registrations a JOIN legislative_decrees b ON a.legislative_decree_id = b.id;
```

| census_registration_id | registration_date | mandated_by | purpose | decree_id | decree_issuer_name | decree_issuance_date |
|---|---|---|---|---|---|---|
| 1 | 2023-06-19 | baseline-mandated-31 | adaptive-purpose-11 | 1 | Compact Series | 2022-01-17 |
| 2 | 2024-11-03 | pilot-mandated-32 | distributed-purpose-12 | 2 | Legacy Assessment | 2023-06-01 |
| 3 | 2025-04-14 | extended-mandated-33 | baseline-purpose-13 | 3 | Regional Survey A | 2024-11-12 |
| 4 | 2022-09-25 | integrated-mandated-34 | pilot-purpose-14 | 4 | Seasonal Corridor | 2025-04-23 |

The first row shows that census registration `1` is governed by decree `1`, issued by `Compact Series` on `2022-01-17` with the mandate description `Regional Framework`. This view is critical for compliance auditing—determining which decree authorized a given registration.

The view `v_census_registration_human` joins `census_registrations` to `humans` on `census_registrations.human_id = humans.id`, answering: "Which person is enrolled in each census registration?"

**View `v_census_registration_human`**

```sql
CREATE VIEW v_census_registration_human AS
SELECT a.census_registration_id, a.registration_date, a.mandated_by, a.purpose, b.id AS human_id, b.given_name AS human_given_name, b.family_name AS human_family_name
FROM census_registrations a JOIN humans b ON a.human_id = b.id;
```

| census_registration_id | registration_date | mandated_by | purpose | human_id | human_given_name | human_family_name |
|---|---|---|---|---|---|---|
| 1 | 2023-06-19 | baseline-mandated-31 | adaptive-purpose-11 | 1 | Dana Nguyen | Primary Corridor A |
| 2 | 2024-11-03 | pilot-mandated-32 | distributed-purpose-12 | 2 | Susan Levy | Composite Series |
| 3 | 2025-04-14 | extended-mandated-33 | baseline-purpose-13 | 3 | Elizabeth Woods | Compact Assessment |
| 4 | 2022-09-25 | integrated-mandated-34 | pilot-purpose-14 | 4 | Cheryl Bradley | Legacy Survey D |

The first row links census registration `1` to `Dana Nguyen`, the infant. This view enables queries about the demographic composition of census records.

The view `v_census_registration_location` joins `census_registrations` to `locations` on `census_registrations.location_id = locations.id`, answering: "At which location was each census registration made?"

**View `v_census_registration_location`**

```sql
CREATE VIEW v_census_registration_location AS
SELECT a.census_registration_id, a.registration_date, a.mandated_by, a.purpose, b.id AS location_id, b.name AS location_name, b.type AS location_type
FROM census_registrations a JOIN locations b ON a.location_id = b.id;
```

| census_registration_id | registration_date | mandated_by | purpose | location_id | location_name | location_type |
|---|---|---|---|---|---|---|
| 1 | 2023-06-19 | baseline-mandated-31 | adaptive-purpose-11 | 1 | Extended Review | town |
| 2 | 2024-11-03 | pilot-mandated-32 | distributed-purpose-12 | 2 | Pilot Initiative A | stable |
| 3 | 2025-04-14 | extended-mandated-33 | baseline-purpose-13 | 3 | Baseline Model | manger |
| 4 | 2022-09-25 | integrated-mandated-34 | pilot-purpose-14 | 4 | Distributed Cluster | region |

The first row shows that census registration `1` was made at `Extended Review`, a `town`. This view supports geographic analysis of census activity.

The view `v_legislative_decree_census_registration_detail` joins `legislative_decrees` to `census_registrations` on `legislative_decrees.id = census_registrations.legislative_decree_id`, answering: "Which census registrations fall under each legislative decree?"

**View `v_legislative_decree_census_registration_detail`**

```sql
CREATE VIEW v_legislative_decree_census_registration_detail AS
SELECT a.id, a.issuer_name, a.issuance_date, b.census_registration_id AS registration_census_registration_id, b.registration_date AS registration_registration_date, b.mandated_by AS registration_mandated_by
FROM legislative_decrees a
  JOIN decrees_registrations j ON j.legislative_decree_id = a.id
  JOIN census_registrations b ON b.census_registration_id = j.census_registration_id;
```

| id | issuer_name | issuance_date | registration_census_registration_id | registration_registration_date | registration_mandated_by |
|---|---|---|---|---|---|
| 1 | Compact Series | 2022-01-17 | 1 | 2023-06-19 | baseline-mandated-31 |
| 1 | Compact Series | 2022-01-17 | 2 | 2024-11-03 | pilot-mandated-32 |
| 2 | Legacy Assessment | 2023-06-01 | 2 | 2024-11-03 | pilot-mandated-32 |
| 2 | Legacy Assessment | 2023-06-01 | 3 | 2025-04-14 | extended-mandated-33 |
| 3 | Regional Survey A | 2024-11-12 | 3 | 2025-04-14 | extended-mandated-33 |
| 3 | Regional Survey A | 2024-11-12 | 4 | 2022-09-25 | integrated-mandated-34 |
| 4 | Seasonal Corridor | 2025-04-23 | 4 | 2022-09-25 | integrated-mandated-34 |
| 4 | Seasonal Corridor | 2025-04-23 | 1 | 2023-06-19 | baseline-mandated-31 |

The first row shows that decree `1` (issued by `Compact Series`) governs census registration `1`, which was created on `2023-06-19` for the registrant `Seasonal Programme`. This view is the inverse of `v_census_registration_legislative_decree` and is useful for decree-level reporting.

The view `v_infant_care_item_birth_event` joins `infant_care_items` to `birth_events` on `infant_care_items.birth_event_id = birth_events.birth_event_id`, answering: "Which care items were provided for each birth event?"

**View `v_infant_care_item_birth_event`**

```sql
CREATE VIEW v_infant_care_item_birth_event AS
SELECT a.id, a.item_type, a.material, a.condition, b.birth_event_id AS event_birth_event_id, b.identifier AS event_identifier, b.birth_date AS event_birth_date
FROM infant_care_items a JOIN birth_events b ON a.birth_event_id = b.birth_event_id;
```

| id | item_type | material | condition | event_birth_event_id | event_identifier | event_birth_date |
|---|---|---|---|---|---|---|
| 100 | cloth | primary-material-94 | seasonal-conditio-89 | 100 | IDE-2086 | 2023-10-18 |
| 101 | bed | adaptive-material-95 | regional-conditio-90 | 101 | IDE-2091 | 2024-03-02 |
| 102 | manger | distributed-material-96 | legacy-conditio-91 | 102 | IDE-2096 | 2025-08-13 |
| 103 | cloth | baseline-material-97 | compact-conditio-92 | 103 | IDE-2101 | 2022-01-24 |

The first row shows that birth event `IDE-2086` was accompanied by a `cloth` item of `primary-material-94` in condition `seasonal-conditio-89`. This view supports resource tracking and quality analysis of infant care provisions.

The view `v_infant_care_item_location` joins `infant_care_items` to `locations` on `infant_care_items.location_id = locations.id`, answering: "At which location were care items provided?"

**View `v_infant_care_item_location`**

```sql
CREATE VIEW v_infant_care_item_location AS
SELECT a.id, a.item_type, a.material, a.condition, b.id AS location_id, b.name AS location_name, b.type AS location_type
FROM infant_care_items a JOIN locations b ON a.location_id = b.id;
```

| id | item_type | material | condition | location_id | location_name | location_type |
|---|---|---|---|---|---|---|
| 100 | cloth | primary-material-94 | seasonal-conditio-89 | 1 | Extended Review | town |
| 101 | bed | adaptive-material-95 | regional-conditio-90 | 2 | Pilot Initiative A | stable |
| 102 | manger | distributed-material-96 | legacy-conditio-91 | 3 | Baseline Model | manger |
| 103 | cloth | baseline-material-97 | compact-conditio-92 | 4 | Distributed Cluster | region |

The first row shows that a `cloth` item was provided at `Extended Review`, a `town`. This view enables geographic analysis of care item distribution.

In synthesis, the schema models a civic registry domain through seven base tables that encode five core entity types and their relationships as foreign keys. The `birth_events` table serves as the central hub, connecting to `humans` (parents and infant), `locations` (birth site), and `infant_care_items` (material provisions). The `census_registrations` table forms a parallel structure, linking `humans` to `locations` and `legislative_decrees`. The junction table `decrees_registrations` provides additional flexibility for decree-registration associations. Twelve views then project these normalized tables into denormalized, question-oriented formats—each view answering a specific domain query by joining the relevant tables and flattening foreign keys into readable attributes. This design balances normalization (preserving referential integrity and reducing redundancy) with accessibility (providing pre-joined views for common analytical patterns), embodying a classic ontology-to-relational mapping where entity types become tables, attributes become columns, and relationships become foreign keys and junction tables.