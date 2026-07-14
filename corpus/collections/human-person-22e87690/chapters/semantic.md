## Relational Materialization of the Civic Registry Domain

The civic registry domain captures the interlocking facts of population, habitation, and governance within a structured settlement system. At its core, the model tracks individual persons, their residential and ancestral ties to named settlements, the buildings that constitute those settlements, and the birth events that anchor lineage. Government decrees impose census mandates, and infant care items document the material support surrounding births. The ontology behind this domain distinguishes seven entity types—`human_person`, `settlement`, `building`, `birth_event`, `census_registration`, `government_decree`, and `infant_care_item`—and expresses their relationships as foreign keys, self-referential links, and junction views. The following sections walk through how each entity type materializes as a base table, how cardinality-bounded relationships become columns, and how the twelve views reconstruct domain facts from the normalized schema.

### Base Tables and Entity Types

The `human_persons` table is the central entity in the registry. Each row represents a distinct person identified by a surrogate `id` and enriched with personal attributes. The `has_given_name` and `has_family_name` columns store the person's full name, while `has_occupation_role` encodes their occupational classification as a controlled vocabulary term. Residential and ancestral geography are captured through `has_residence_location` and `has_ancestral_origin_location`, both of which reference settlement-level location codes. The table also carries a self-referential column, `has_spouse_human_person_id`, which links a person to their spouse within the same table, enabling the model to express marital relationships without requiring a separate junction table.

**Table `human_persons`**

| id | has_given_name | has_family_name | has_occupation_role | has_residence_location | has_ancestral_origin_location | human_person_id | has_spouse_human_person_id | settlement_id | census_registration_id |
|---|---|---|---|---|---|---|---|---|---|
| 1000 | Kona International Airport | Cheryl Bradley | extended-occupati-81 | distributed-residenc-90 | integrated-ancestra-46 | 1000 | 1000 | 1 | 1 |
| 1001 | Collin Lopez | Mary Alvarez | integrated-occupati-82 | baseline-residenc-91 | seasonal-ancestra-47 | 1001 | 1001 | 2 | 2 |
| 1002 | Susan Wagner | Stefanie Lara | seasonal-occupati-83 | pilot-residenc-92 | regional-ancestra-48 | 1002 | 1002 | 3 | 3 |
| 1003 | Sean Green | Desiree Cain | regional-occupati-84 | extended-residenc-93 | legacy-ancestra-49 | 1003 | 1003 | 4 | 4 |

Consider the first row: person `1000`, named Kona International Airport with family name Cheryl Bradley, holds occupation role `extended-occupati-81` and resides at `distributed-residenc-90`, with ancestral origin at `integrated-ancestra-46`. Their `human_person_id` is `1000`, and their `has_spouse_human_person_id` points to themselves, indicating a self-referential marital entry. The row also carries `settlement_id = 1` and `census_registration_id = 1`, linking this person to a specific settlement and census record. Person `1001`, Collin Lopez (family name Mary Alvarez), occupies `integrated-occupati-82`, resides at `baseline-residenc-91`, and traces ancestry to `seasonal-ancestra-47`. Person `1002`, Susan Wagner (family name Stefanie Lara), holds `seasonal-occupati-83` and resides at `pilot-residenc-92`. Person `1003`, Sean Green (family name Desiree Cain), holds `regional-occupati-84` and resides at `extended-residenc-93`. Each person's `settlement_id` and `census_registration_id` form the backbone of the relational joins that follow.

The `settlements` table models inhabited places. Each row carries a `settlement_id` that serves as the primary key and a `has_settlement_name` column that gives the place its human-readable label. The `has_geographic_region` column classifies the settlement's broader geographic zone, while `has_population_density` stores a numeric density value. The table also includes `building_id` and `census_registration_id` columns, which create direct foreign-key links to the `buildings` and `census_registrations` tables respectively.

**Table `settlements`**

| settlement_id | has_settlement_name | has_geographic_region | has_population_density | building_id | census_registration_id |
|---|---|---|---|---|---|
| 1 | Integrated Model A | distributed-geograph-24 | 13 | 1 | 1 |
| 2 | Extended Cluster | baseline-geograph-25 | 16 | 2 | 2 |
| 3 | Pilot Review | pilot-geograph-26 | 19 | 3 | 3 |
| 4 | Baseline Initiative D | extended-geograph-27 | 22 | 4 | 4 |

Settlement `1`, named Integrated Model A, sits in geographic region `distributed-geograph-24` with a population density of `13`. It is associated with `building_id = 1` and `census_registration_id = 1`. Settlement `2`, Extended Cluster, occupies `baseline-geograph-25` with density `16`, linked to building `2` and census registration `2`. Settlement `3`, Pilot Review, is in `pilot-geograph-26` with density `19`. Settlement `4`, Baseline Initiative D, resides in `extended-geograph-27` with density `22`. The settlement-to-building and settlement-to-census links are one-to-one in this dataset, though the schema supports broader cardinalities through the view layer.

The `buildings` table captures the physical structures within settlements. Each building has a surrogate `id`, a `has_building_type` classification, a `has_material_composition` describing its construction materials, and a `has_occupancy_status` indicating its current use state. The boolean column `has_animal_occupants` records whether the building houses animals. The `settlement_id` column creates a foreign-key relationship to the `settlements` table, while `birth_event_id` links the building to a specific birth event that occurred within it. A `created_at` timestamp records when the building record was first entered.

**Table `buildings`**

| id | has_building_type | has_material_composition | has_occupancy_status | has_animal_occupants | settlement_id | birth_event_id | created_at |
|---|---|---|---|---|---|---|---|
| 1 | composite-building-87 | distributed-material-66 | distributed-occupanc-18 | true | 1 | 1 | 2025-01-01 00:14:00 |
| 2 | primary-building-88 | baseline-material-67 | baseline-occupanc-19 | false | 2 | 2 | 2025-02-06 03:14:00 |
| 3 | adaptive-building-89 | pilot-material-68 | pilot-occupanc-20 | true | 3 | 3 | 2025-03-11 06:14:00 |
| 4 | distributed-building-90 | extended-material-69 | extended-occupanc-21 | false | 4 | 4 | 2025-04-16 09:14:00 |

Building `1` is a `composite-building-87` made of `distributed-material-66`, with `distributed-occupanc-18` status and `true` for animal occupants. It belongs to settlement `1` and is associated with `birth_event_id = 1`. Building `2`, a `primary-building-88` of `baseline-material-67`, has `baseline-occupanc-19` status and `false` for animal occupants, linked to settlement `2` and birth event `2`. Building `3`, an `adaptive-building-89` of `pilot-material-68`, has `pilot-occupanc-20` status and `true` for animal occupants, tied to settlement `3` and birth event `3`. Building `4`, a `distributed-building-90` of `extended-material-69`, has `extended-occupanc-21` status and `false` for animal occupants, connected to settlement `4` and birth event `4`.

The `birth_events` table records the occurrence of births. Each row has a `birth_event_id`, an `has_event_date` storing the calendar date, and a `has_birth_location` code identifying where the birth took place. The `building_id` column creates a foreign-key to the `buildings` table, anchoring the event to a physical structure. The `human_person_id` column links the event to the person who was born, while `has_father_human_person_id` and `has_child_human_person_id` provide explicit parent-child lineage references.

**Table `birth_events`**

| birth_event_id | has_event_date | has_birth_location | building_id | human_person_id | has_father_human_person_id | has_child_human_person_id |
|---|---|---|---|---|---|---|
| 1 | 2025-12-24 | pilot-birth-68 | 1 | 1000 | 1000 | 1000 |
| 2 | 2022-05-08 | extended-birth-69 | 2 | 1001 | 1001 | 1001 |
| 3 | 2023-10-19 | integrated-birth-70 | 3 | 1002 | 1002 | 1002 |
| 4 | 2024-03-03 | seasonal-birth-71 | 4 | 1003 | 1003 | 1003 |

Birth event `1` occurred on `2025-12-24` at location `pilot-birth-68`, within building `1`, involving person `1000` as both the person associated with the event, the father, and the child. Birth event `2` took place on `2022-05-08` at `extended-birth-69` in building `2`, involving person `1001`. Birth event `3` occurred on `2023-10-19` at `integrated-birth-70` in building `3`, involving person `1002`. Birth event `4` happened on `2024-03-03` at `seasonal-birth-71` in building `4`, involving person `1003`. The self-referential pattern in the father and child columns reflects a simplified lineage model where the person record doubles as both parent and child in the event context.

The `census_registrations` table captures the administrative act of registering a person for census purposes. Each row has an `id`, a `has_registration_date`, and a `has_registration_location` code. The `has_mandating_authority` column identifies which authority mandated the registration, while `has_purpose` describes the registration's intent. The `government_decree_id` column creates a foreign-key to the `government_decrees` table, linking the registration to the legal instrument that authorized it. The `human_person_id` column links the registration to the registered person, and `settlement_id` ties it to a specific settlement. Timestamps `created_at` and `updated_at` track the record's lifecycle.

**Table `census_registrations`**

| id | has_registration_date | has_registration_location | has_mandating_authority | has_purpose | government_decree_id | human_person_id | settlement_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 2023-10-25 | seasonal-registra-53 | legacy-mandatin-85 | compact-purpose-98 | 100 | 1000 | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | 2024-03-09 | regional-registra-54 | compact-mandatin-86 | composite-purpose-99 | 101 | 1001 | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | 2025-08-20 | legacy-registra-55 | composite-mandatin-87 | primary-purpose-100 | 102 | 1002 | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | 2022-01-04 | compact-registra-56 | primary-mandatin-88 | adaptive-purpose-101 | 103 | 1003 | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Census registration `1` was created on `2023-10-25` at location `seasonal-registra-53`, mandated by `legacy-mandatin-85` for purpose `compact-purpose-98`. It is governed by government decree `100`, registers person `1000`, and is associated with settlement `1`. Registration `2` occurred on `2024-03-09` at `regional-registra-54`, mandated by `compact-mandatin-86` for purpose `composite-purpose-99`, under decree `101`, registering person `1001` in settlement `2`. Registration `3` was made on `2025-08-20` at `legacy-registra-55`, mandated by `composite-mandatin-87` for purpose `primary-purpose-100`, under decree `102`, registering person `1002` in settlement `3`. Registration `4` dates to `2022-01-04` at `compact-registra-56`, mandated by `primary-mandatin-88` for purpose `adaptive-purpose-101`, under decree `103`, registering person `1003` in settlement `4`.

The `government_decrees` table stores the legal instruments that authorize census activities. Each decree has an `id`, a `has_decree_title`, a `has_issuing_emperor` identifying the issuing authority, a `has_enforcement_date`, and a `has_legal_requirement` classification. The `human_person_id` column links the decree to a person, and `census_registration_id` links it to a specific census registration.

**Table `government_decrees`**

| id | has_decree_title | has_issuing_emperor | has_enforcement_date | has_legal_requirement | human_person_id | census_registration_id |
|---|---|---|---|---|---|---|
| 100 | Primary Survey A | composite-issuing-81 | 2024-03-07 | integrated-legal-52 | 1000 | 1 |
| 101 | Composite Corridor | primary-issuing-82 | 2025-08-18 | seasonal-legal-53 | 1001 | 2 |
| 102 | Compact Series | adaptive-issuing-83 | 2022-01-02 | regional-legal-54 | 1002 | 3 |
| 103 | Legacy Assessment D | distributed-issuing-84 | 2023-06-13 | legacy-legal-55 | 1003 | 4 |

Decree `100`, titled Primary Survey A, was issued by `composite-issuing-81` and enforced on `2024-03-07` under legal requirement `integrated-legal-52`. It is associated with person `1000` and census registration `1`. Decree `101`, Composite Corridor, was issued by `primary-issuing-82`, enforced on `2025-08-18` under `seasonal-legal-53`, linked to person `1001` and registration `2`. Decree `102`, Compact Series, was issued by `adaptive-issuing-83`, enforced on `2022-01-02` under `regional-legal-54`, linked to person `1002` and registration `3`. Decree `103`, Legacy Assessment D, was issued by `distributed-issuing-84`, enforced on `2023-06-13` under `legacy-legal-55`, linked to person `1003` and registration `4`.

The `infant_care_items` table, while present in the schema, does not appear in the provided sample data. Its role in the ontology is to document the material goods and services provided to infants in connection with birth events and buildings. The table's columns and relationships are defined in the schema but remain unpopulated in the current dataset snapshot.

**Table `infant_care_items`**

| infant_care_item_id | has_item_name | has_material_type | has_physical_condition | birth_event_id | building_id | created_at |
|---|---|---|---|---|---|---|
| 1 | Baseline Initiative D | seasonal-material-53 | extended-physical-75 | 1 | 1 | 2025-01-01 00:14:00 |
| 2 | Distributed Model | regional-material-54 | integrated-physical-76 | 2 | 2 | 2025-02-06 03:14:00 |
| 3 | Adaptive Cluster | legacy-material-55 | seasonal-physical-77 | 3 | 3 | 2025-03-11 06:14:00 |
| 4 | Primary Review A | compact-material-56 | regional-physical-78 | 4 | 4 | 2025-04-16 09:14:00 |

### View Layer: Reconstructing Domain Facts

The view layer materializes the domain's relational facts by joining base tables along their foreign-key relationships. Each view answers a specific analytical question by denormalizing the normalized schema.

The `human_person_human_person_view` reconstructs the self-referential marital relationship encoded in `human_persons`. By joining the table to itself on `has_spouse_human_person_id`, the view produces pairs of spouses. In the data, person `1000` (Kona International Airport) is linked to spouse `1000`, indicating a self-referential entry. The view makes this relationship queryable as a first-class fact rather than a column-level reference.

**View `human_person_human_person_view`**

```sql
CREATE VIEW human_person_human_person_view AS
SELECT a.id, a.has_given_name, a.has_family_name, a.has_occupation_role, b.id AS person_id, b.has_given_name AS person_has_given_name, b.has_family_name AS person_has_family_name
FROM human_persons a JOIN human_persons b ON a.human_person_id = b.id;
```

| id | has_given_name | has_family_name | has_occupation_role | person_id | person_has_given_name | person_has_family_name |
|---|---|---|---|---|---|---|
| 1000 | Kona International Airport | Cheryl Bradley | extended-occupati-81 | 1000 | Kona International Airport | Cheryl Bradley |
| 1001 | Collin Lopez | Mary Alvarez | integrated-occupati-82 | 1001 | Collin Lopez | Mary Alvarez |
| 1002 | Susan Wagner | Stefanie Lara | seasonal-occupati-83 | 1002 | Susan Wagner | Stefanie Lara |
| 1003 | Sean Green | Desiree Cain | regional-occupati-84 | 1003 | Sean Green | Desiree Cain |

The `human_person_settlement_view` joins `human_persons` to `settlements` on `settlement_id`, answering the question "which settlement does each person belong to?" Person `1000` (Kona International Airport) is linked to settlement `1` (Integrated Model A). Person `1001` (Collin Lopez) belongs to settlement `2` (Extended Cluster). Person `1002` (Susan Wagner) is in settlement `3` (Pilot Review). Person `1003` (Sean Green) resides in settlement `4` (Baseline Initiative D). This view is the primary mechanism for resolving a person's geographic context.

**View `human_person_settlement_view`**

```sql
CREATE VIEW human_person_settlement_view AS
SELECT a.id, a.has_given_name, a.has_family_name, a.has_occupation_role, b.settlement_id AS settlement_settlement_id, b.has_settlement_name AS settlement_has_settlement_name, b.has_geographic_region AS settlement_has_geographic_region
FROM human_persons a JOIN settlements b ON a.settlement_id = b.settlement_id;
```

| id | has_given_name | has_family_name | has_occupation_role | settlement_settlement_id | settlement_has_settlement_name | settlement_has_geographic_region |
|---|---|---|---|---|---|---|
| 1000 | Kona International Airport | Cheryl Bradley | extended-occupati-81 | 1 | Integrated Model A | distributed-geograph-24 |
| 1001 | Collin Lopez | Mary Alvarez | integrated-occupati-82 | 2 | Extended Cluster | baseline-geograph-25 |
| 1002 | Susan Wagner | Stefanie Lara | seasonal-occupati-83 | 3 | Pilot Review | pilot-geograph-26 |
| 1003 | Sean Green | Desiree Cain | regional-occupati-84 | 4 | Baseline Initiative D | extended-geograph-27 |

The `human_person_census_registration_view` joins `human_persons` to `census_registrations` on `human_person_id`, answering "which census registration is associated with each person?" Person `1000` is linked to census registration `1`, created on `2023-10-25` under decree `100`. Person `1001` is linked to registration `2` (date `2024-03-09`, decree `101`). Person `1002` connects to registration `3` (date `2025-08-20`, decree `102`). Person `1003` connects to registration `4` (date `2022-01-04`, decree `103`). This view enables tracing the administrative lifecycle of each person.

**View `human_person_census_registration_view`**

```sql
CREATE VIEW human_person_census_registration_view AS
SELECT a.id, a.has_given_name, a.has_family_name, a.has_occupation_role, b.id AS registration_id, b.has_registration_date AS registration_has_registration_date, b.has_registration_location AS registration_has_registration_location
FROM human_persons a JOIN census_registrations b ON a.census_registration_id = b.id;
```

| id | has_given_name | has_family_name | has_occupation_role | registration_id | registration_has_registration_date | registration_has_registration_location |
|---|---|---|---|---|---|---|
| 1000 | Kona International Airport | Cheryl Bradley | extended-occupati-81 | 1 | 2023-10-25 | seasonal-registra-53 |
| 1001 | Collin Lopez | Mary Alvarez | integrated-occupati-82 | 2 | 2024-03-09 | regional-registra-54 |
| 1002 | Susan Wagner | Stefanie Lara | seasonal-occupati-83 | 3 | 2025-08-20 | legacy-registra-55 |
| 1003 | Sean Green | Desiree Cain | regional-occupati-84 | 4 | 2022-01-04 | compact-registra-56 |

The `settlement_building_view` joins `settlements` to `buildings` on `settlement_id`, answering "which buildings belong to which settlement?" Settlement `1` (Integrated Model A) contains building `1` (composite-building-87). Settlement `2` (Extended Cluster) contains building `2` (primary-building-88). Settlement `3` (Pilot Review) contains building `3` (adaptive-building-89). Settlement `4` (Baseline Initiative D) contains building `4` (distributed-building-90). This view materializes the settlement-to-building containment relationship.

**View `settlement_building_view`**

```sql
CREATE VIEW settlement_building_view AS
SELECT a.settlement_id, a.has_settlement_name, a.has_geographic_region, a.has_population_density, b.id AS building_id, b.has_building_type AS building_has_building_type, b.has_material_composition AS building_has_material_composition
FROM settlements a JOIN buildings b ON a.building_id = b.id;
```

| settlement_id | has_settlement_name | has_geographic_region | has_population_density | building_id | building_has_building_type | building_has_material_composition |
|---|---|---|---|---|---|---|
| 1 | Integrated Model A | distributed-geograph-24 | 13 | 1 | composite-building-87 | distributed-material-66 |
| 2 | Extended Cluster | baseline-geograph-25 | 16 | 2 | primary-building-88 | baseline-material-67 |
| 3 | Pilot Review | pilot-geograph-26 | 19 | 3 | adaptive-building-89 | pilot-material-68 |
| 4 | Baseline Initiative D | extended-geograph-27 | 22 | 4 | distributed-building-90 | extended-material-69 |

The `settlement_census_registration_view` joins `settlements` to `census_registrations` on `settlement_id`, answering "which census registrations are associated with which settlement?" Settlement `1` is linked to census registration `1` (seasonal-registra-53, decree `100`). Settlement `2` links to registration `2` (regional-registra-54, decree `101`). Settlement `3` links to registration `3` (legacy-registra-55, decree `102`). Settlement `4` links to registration `4` (compact-registra-56, decree `103`). This view provides a settlement-level administrative summary.

**View `settlement_census_registration_view`**

```sql
CREATE VIEW settlement_census_registration_view AS
SELECT a.settlement_id, a.has_settlement_name, a.has_geographic_region, a.has_population_density, b.id AS registration_id, b.has_registration_date AS registration_has_registration_date, b.has_registration_location AS registration_has_registration_location
FROM settlements a JOIN census_registrations b ON a.census_registration_id = b.id;
```

| settlement_id | has_settlement_name | has_geographic_region | has_population_density | registration_id | registration_has_registration_date | registration_has_registration_location |
|---|---|---|---|---|---|---|
| 1 | Integrated Model A | distributed-geograph-24 | 13 | 1 | 2023-10-25 | seasonal-registra-53 |
| 2 | Extended Cluster | baseline-geograph-25 | 16 | 2 | 2024-03-09 | regional-registra-54 |
| 3 | Pilot Review | pilot-geograph-26 | 19 | 3 | 2025-08-20 | legacy-registra-55 |
| 4 | Baseline Initiative D | extended-geograph-27 | 22 | 4 | 2022-01-04 | compact-registra-56 |

The `building_settlement_view` performs the inverse of the settlement-building join, answering "which settlement does each building belong to?" Building `1` (composite-building-87) belongs to settlement `1` (Integrated Model A). Building `2` (primary-building-88) belongs to settlement `2` (Extended Cluster). Building `3` (adaptive-building-89) belongs to settlement `3` (Pilot Review). Building `4` (distributed-building-90) belongs to settlement `4` (Baseline Initiative D). This view is useful when querying from the building perspective upward to the settlement.

**View `building_settlement_view`**

```sql
CREATE VIEW building_settlement_view AS
SELECT a.id, a.has_building_type, a.has_material_composition, a.has_occupancy_status, b.settlement_id AS settlement_settlement_id, b.has_settlement_name AS settlement_has_settlement_name, b.has_geographic_region AS settlement_has_geographic_region
FROM buildings a JOIN settlements b ON a.settlement_id = b.settlement_id;
```

| id | has_building_type | has_material_composition | has_occupancy_status | settlement_settlement_id | settlement_has_settlement_name | settlement_has_geographic_region |
|---|---|---|---|---|---|---|
| 1 | composite-building-87 | distributed-material-66 | distributed-occupanc-18 | 1 | Integrated Model A | distributed-geograph-24 |
| 2 | primary-building-88 | baseline-material-67 | baseline-occupanc-19 | 2 | Extended Cluster | baseline-geograph-25 |
| 3 | adaptive-building-89 | pilot-material-68 | pilot-occupanc-20 | 3 | Pilot Review | pilot-geograph-26 |
| 4 | distributed-building-90 | extended-material-69 | extended-occupanc-21 | 4 | Baseline Initiative D | extended-geograph-27 |

The `building_birth_event_view` joins `buildings` to `birth_events` on `building_id`, answering "which birth events occurred in which building?" Building `1` is associated with birth event `1` (date `2025-12-24`, location `pilot-birth-68`). Building `2` is associated with birth event `2` (date `2022-05-08`, location `extended-birth-69`). Building `3` is associated with birth event `3` (date `2023-10-19`, location `integrated-birth-70`). Building `4` is associated with birth event `4` (date `2024-03-03`, location `seasonal-birth-71`). This view reconstructs the spatial context of births.

**View `building_birth_event_view`**

```sql
CREATE VIEW building_birth_event_view AS
SELECT a.id, a.has_building_type, a.has_material_composition, a.has_occupancy_status, b.birth_event_id AS event_birth_event_id, b.has_event_date AS event_has_event_date, b.has_birth_location AS event_has_birth_location
FROM buildings a JOIN birth_events b ON a.birth_event_id = b.birth_event_id;
```

| id | has_building_type | has_material_composition | has_occupancy_status | event_birth_event_id | event_has_event_date | event_has_birth_location |
|---|---|---|---|---|---|---|
| 1 | composite-building-87 | distributed-material-66 | distributed-occupanc-18 | 1 | 2025-12-24 | pilot-birth-68 |
| 2 | primary-building-88 | baseline-material-67 | baseline-occupanc-19 | 2 | 2022-05-08 | extended-birth-69 |
| 3 | adaptive-building-89 | pilot-material-68 | pilot-occupanc-20 | 3 | 2023-10-19 | integrated-birth-70 |
| 4 | distributed-building-90 | extended-material-69 | extended-occupanc-21 | 4 | 2024-03-03 | seasonal-birth-71 |

The `birth_event_building_view` performs the inverse join, answering "which building hosted each birth event?" Birth event `1` occurred in building `1` (composite-building-87). Birth event `2` occurred in building `2` (primary-building-88). Birth event `3` occurred in building `3` (adaptive-building-89). Birth event `4` occurred in building `4` (distributed-building-90). This view is useful when starting from a birth event and tracing back to its physical location.

**View `birth_event_building_view`**

```sql
CREATE VIEW birth_event_building_view AS
SELECT a.birth_event_id, a.has_event_date, a.has_birth_location, a.human_person_id, b.id AS building_id, b.has_building_type AS building_has_building_type, b.has_material_composition AS building_has_material_composition
FROM birth_events a JOIN buildings b ON a.building_id = b.id;
```

| birth_event_id | has_event_date | has_birth_location | human_person_id | building_id | building_has_building_type | building_has_material_composition |
|---|---|---|---|---|---|---|
| 1 | 2025-12-24 | pilot-birth-68 | 1000 | 1 | composite-building-87 | distributed-material-66 |
| 2 | 2022-05-08 | extended-birth-69 | 1001 | 2 | primary-building-88 | baseline-material-67 |
| 3 | 2023-10-19 | integrated-birth-70 | 1002 | 3 | adaptive-building-89 | pilot-material-68 |
| 4 | 2024-03-03 | seasonal-birth-71 | 1003 | 4 | distributed-building-90 | extended-material-69 |

The `birth_event_human_person_view` joins `birth_events` to `human_persons` on `human_person_id`, answering "which person is associated with each birth event?" Birth event `1` is associated with person `1000` (Kona International Airport). Birth event `2` is associated with person `1001` (Collin Lopez). Birth event `3` is associated with person `1002` (Susan Wagner). Birth event `4` is associated with person `1003` (Sean Green). This view reconstructs the person-level context of each birth.

**View `birth_event_human_person_view`**

```sql
CREATE VIEW birth_event_human_person_view AS
SELECT a.birth_event_id, a.has_event_date, a.has_birth_location, a.building_id, b.id AS person_id, b.has_given_name AS person_has_given_name, b.has_family_name AS person_has_family_name
FROM birth_events a JOIN human_persons b ON a.human_person_id = b.id;
```

| birth_event_id | has_event_date | has_birth_location | building_id | person_id | person_has_given_name | person_has_family_name |
|---|---|---|---|---|---|---|
| 1 | 2025-12-24 | pilot-birth-68 | 1 | 1000 | Kona International Airport | Cheryl Bradley |
| 2 | 2022-05-08 | extended-birth-69 | 2 | 1001 | Collin Lopez | Mary Alvarez |
| 3 | 2023-10-19 | integrated-birth-70 | 3 | 1002 | Susan Wagner | Stefanie Lara |
| 4 | 2024-03-03 | seasonal-birth-71 | 4 | 1003 | Sean Green | Desiree Cain |

The `census_registration_government_decree_view` joins `census_registrations` to `government_decrees` on `government_decree_id`, answering "which government decree mandated each census registration?" Census registration `1` is mandated by decree `100` (Primary Survey A, enforced `2024-03-07`). Registration `2` is mandated by decree `101` (Composite Corridor, enforced `2025-08-18`). Registration `3` is mandated by decree `102` (Compact Series, enforced `2022-01-02`). Registration `4` is mandated by decree `103` (Legacy Assessment D, enforced `2023-06-13`). This view is critical for auditing the legal basis of census activities.

**View `census_registration_government_decree_view`**

```sql
CREATE VIEW census_registration_government_decree_view AS
SELECT a.id, a.has_registration_date, a.has_registration_location, a.has_mandating_authority, b.id AS decree_id, b.has_decree_title AS decree_has_decree_title, b.has_issuing_emperor AS decree_has_issuing_emperor
FROM census_registrations a JOIN government_decrees b ON a.government_decree_id = b.id;
```

| id | has_registration_date | has_registration_location | has_mandating_authority | decree_id | decree_has_decree_title | decree_has_issuing_emperor |
|---|---|---|---|---|---|---|
| 1 | 2023-10-25 | seasonal-registra-53 | legacy-mandatin-85 | 100 | Primary Survey A | composite-issuing-81 |
| 2 | 2024-03-09 | regional-registra-54 | compact-mandatin-86 | 101 | Composite Corridor | primary-issuing-82 |
| 3 | 2025-08-20 | legacy-registra-55 | composite-mandatin-87 | 102 | Compact Series | adaptive-issuing-83 |
| 4 | 2022-01-04 | compact-registra-56 | primary-mandatin-88 | 103 | Legacy Assessment D | distributed-issuing-84 |

The `census_registration_human_person_view` joins `census_registrations` to `human_persons` on `human_person_id`, answering "which person is registered in each census entry?" Registration `1` registers person `1000` (Kona International Airport). Registration `2` registers person `1001` (Collin Lopez). Registration `3` registers person `1002` (Susan Wagner). Registration `4` registers person `1003` (Sean Green). This view provides the person-level detail of census records.

**View `census_registration_human_person_view`**

```sql
CREATE VIEW census_registration_human_person_view AS
SELECT a.id, a.has_registration_date, a.has_registration_location, a.has_mandating_authority, b.id AS person_id, b.has_given_name AS person_has_given_name, b.has_family_name AS person_has_family_name
FROM census_registrations a JOIN human_persons b ON a.human_person_id = b.id;
```

| id | has_registration_date | has_registration_location | has_mandating_authority | person_id | person_has_given_name | person_has_family_name |
|---|---|---|---|---|---|---|
| 1 | 2023-10-25 | seasonal-registra-53 | legacy-mandatin-85 | 1000 | Kona International Airport | Cheryl Bradley |
| 2 | 2024-03-09 | regional-registra-54 | compact-mandatin-86 | 1001 | Collin Lopez | Mary Alvarez |
| 3 | 2025-08-20 | legacy-registra-55 | composite-mandatin-87 | 1002 | Susan Wagner | Stefanie Lara |
| 4 | 2022-01-04 | compact-registra-56 | primary-mandatin-88 | 1003 | Sean Green | Desiree Cain |

The `census_registration_settlement_view` joins `census_registrations` to `settlements` on `settlement_id`, answering "which settlement is associated with each census registration?" Registration `1` is associated with settlement `1` (Integrated Model A). Registration `2` with settlement `2` (Extended Cluster). Registration `3` with settlement `3` (Pilot Review). Registration `4` with settlement `4` (Baseline Initiative D). This view provides the geographic context of census activities.

**View `census_registration_settlement_view`**

```sql
CREATE VIEW census_registration_settlement_view AS
SELECT a.id, a.has_registration_date, a.has_registration_location, a.has_mandating_authority, b.settlement_id AS settlement_settlement_id, b.has_settlement_name AS settlement_has_settlement_name, b.has_geographic_region AS settlement_has_geographic_region
FROM census_registrations a JOIN settlements b ON a.settlement_id = b.settlement_id;
```

| id | has_registration_date | has_registration_location | has_mandating_authority | settlement_settlement_id | settlement_has_settlement_name | settlement_has_geographic_region |
|---|---|---|---|---|---|---|
| 1 | 2023-10-25 | seasonal-registra-53 | legacy-mandatin-85 | 1 | Integrated Model A | distributed-geograph-24 |
| 2 | 2024-03-09 | regional-registra-54 | compact-mandatin-86 | 2 | Extended Cluster | baseline-geograph-25 |
| 3 | 2025-08-20 | legacy-registra-55 | composite-mandatin-87 | 3 | Pilot Review | pilot-geograph-26 |
| 4 | 2022-01-04 | compact-registra-56 | primary-mandatin-88 | 4 | Baseline Initiative D | extended-geograph-27 |

The `government_decree_human_person_view` joins `government_decrees` to `human_persons` on `human_person_id`, answering "which person is associated with each government decree?" Decree `100` (Primary Survey A) is associated with person `1000`. Decree `101` (Composite Corridor) with person `1001`. Decree `102` (Compact Series) with person `1002`. Decree `103` (Legacy Assessment D) with person `1003`. This view links legal instruments to the individuals they concern.

**View `government_decree_human_person_view`**

```sql
CREATE VIEW government_decree_human_person_view AS
SELECT a.id, a.has_decree_title, a.has_issuing_emperor, a.has_enforcement_date, b.id AS person_id, b.has_given_name AS person_has_given_name, b.has_family_name AS person_has_family_name
FROM government_decrees a JOIN human_persons b ON a.human_person_id = b.id;
```

| id | has_decree_title | has_issuing_emperor | has_enforcement_date | person_id | person_has_given_name | person_has_family_name |
|---|---|---|---|---|---|---|
| 100 | Primary Survey A | composite-issuing-81 | 2024-03-07 | 1000 | Kona International Airport | Cheryl Bradley |
| 101 | Composite Corridor | primary-issuing-82 | 2025-08-18 | 1001 | Collin Lopez | Mary Alvarez |
| 102 | Compact Series | adaptive-issuing-83 | 2022-01-02 | 1002 | Susan Wagner | Stefanie Lara |
| 103 | Legacy Assessment D | distributed-issuing-84 | 2023-06-13 | 1003 | Sean Green | Desiree Cain |

The `government_decree_census_registration_view` joins `government_decrees` to `census_registrations` on `census_registration_id`, answering "which census registration is authorized by each decree?" Decree `100` authorizes registration `1`. Decree `101` authorizes registration `2`. Decree `102` authorizes registration `3`. Decree `103` authorizes registration `4`. This view is the inverse of the census-to-decree join and is useful when starting from a decree and tracing its administrative effects.

**View `government_decree_census_registration_view`**

```sql
CREATE VIEW government_decree_census_registration_view AS
SELECT a.id, a.has_decree_title, a.has_issuing_emperor, a.has_enforcement_date, b.id AS registration_id, b.has_registration_date AS registration_has_registration_date, b.has_registration_location AS registration_has_registration_location
FROM government_decrees a JOIN census_registrations b ON a.census_registration_id = b.id;
```

| id | has_decree_title | has_issuing_emperor | has_enforcement_date | registration_id | registration_has_registration_date | registration_has_registration_location |
|---|---|---|---|---|---|---|
| 100 | Primary Survey A | composite-issuing-81 | 2024-03-07 | 1 | 2023-10-25 | seasonal-registra-53 |
| 101 | Composite Corridor | primary-issuing-82 | 2025-08-18 | 2 | 2024-03-09 | regional-registra-54 |
| 102 | Compact Series | adaptive-issuing-83 | 2022-01-02 | 3 | 2025-08-20 | legacy-registra-55 |
| 103 | Legacy Assessment D | distributed-issuing-84 | 2023-06-13 | 4 | 2022-01-04 | compact-registra-56 |

The `infant_care_item_birth_event_view` joins `infant_care_items` to `birth_events`, answering "which infant care items are associated with each birth event?" While the current dataset does not contain rows in `infant_care_items`, the view is defined to support future population of care item records. When populated, this view will link specific care goods to the birth events they support.

**View `infant_care_item_birth_event_view`**

```sql
CREATE VIEW infant_care_item_birth_event_view AS
SELECT a.infant_care_item_id, a.has_item_name, a.has_material_type, a.has_physical_condition, b.birth_event_id AS event_birth_event_id, b.has_event_date AS event_has_event_date, b.has_birth_location AS event_has_birth_location
FROM infant_care_items a JOIN birth_events b ON a.birth_event_id = b.birth_event_id;
```

| infant_care_item_id | has_item_name | has_material_type | has_physical_condition | event_birth_event_id | event_has_event_date | event_has_birth_location |
|---|---|---|---|---|---|---|
| 1 | Baseline Initiative D | seasonal-material-53 | extended-physical-75 | 1 | 2025-12-24 | pilot-birth-68 |
| 2 | Distributed Model | regional-material-54 | integrated-physical-76 | 2 | 2022-05-08 | extended-birth-69 |
| 3 | Adaptive Cluster | legacy-material-55 | seasonal-physical-77 | 3 | 2023-10-19 | integrated-birth-70 |
| 4 | Primary Review A | compact-material-56 | regional-physical-78 | 4 | 2024-03-03 | seasonal-birth-71 |

The `infant_care_item_building_view` joins `infant_care_items` to `buildings`, answering "which infant care items are associated with which buildings?" Similarly, this view awaits data population. Once populated, it will connect care goods to the buildings where they are distributed or stored, providing a spatial dimension to infant care logistics.

**View `infant_care_item_building_view`**

```sql
CREATE VIEW infant_care_item_building_view AS
SELECT a.infant_care_item_id, a.has_item_name, a.has_material_type, a.has_physical_condition, b.id AS building_id, b.has_building_type AS building_has_building_type, b.has_material_composition AS building_has_material_composition
FROM infant_care_items a JOIN buildings b ON a.building_id = b.id;
```

| infant_care_item_id | has_item_name | has_material_type | has_physical_condition | building_id | building_has_building_type | building_has_material_composition |
|---|---|---|---|---|---|---|
| 1 | Baseline Initiative D | seasonal-material-53 | extended-physical-75 | 1 | composite-building-87 | distributed-material-66 |
| 2 | Distributed Model | regional-material-54 | integrated-physical-76 | 2 | primary-building-88 | baseline-material-67 |
| 3 | Adaptive Cluster | legacy-material-55 | seasonal-physical-77 | 3 | adaptive-building-89 | pilot-material-68 |
| 4 | Primary Review A | compact-material-56 | regional-physical-78 | 4 | distributed-building-90 | extended-material-69 |

### Synthesis

The civic registry domain is modelled as a set of seven base tables whose foreign-key relationships encode the structural dependencies between persons, settlements, buildings, birth events, census registrations, and government decrees. The `human_persons` table serves as the central hub, linking to settlements, census registrations, and itself through a self-referential spouse column. Settlements anchor buildings and census registrations. Buildings host birth events. Birth events reference persons and buildings. Census registrations tie persons to settlements and are mandated by government decrees. The view layer denormalizes these relationships into queryable facts: marital pairs, person-settlement associations, person-census links, settlement-building containment, building-birth event hosting, decree-registration authorization, and the prospective care item associations. Each view answers a specific analytical question by joining the appropriate tables along their foreign keys, reconstructing domain facts from the normalized base schema. The record identifiers and controlled vocabulary values—such as person `1000` (Kona International Airport) in settlement `1` (Integrated Model A), building `1` (composite-building-87), birth event `1` (2025-12-24), census registration `1` (mandated by decree `100`, Primary Survey A)—demonstrate how the model captures a coherent, interlocking picture of population, habitation, and governance.