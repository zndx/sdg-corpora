Indoor air quality (IAQ) management sits at the intersection of environmental monitoring, public health, and regulatory governance. A building's occupants are exposed to a complex matrix of pollutants—each originating from identifiable sources, each affecting vulnerable sub-populations differently, and each subject to policy instruments issued by government departments. The ontology that underpins this domain captures these relationships as a set of entity types, each materialised as a relational table with typed columns, primary keys, and foreign-key constraints that enforce referential integrity. The following chapter walks through the schema from first principles: which entity types exist, how their attributes and cardinality-bounded relationships become columns and foreign keys, and how a family of twelve join views reconstructs domain facts from the normalised tables.

## Entity Types and Their Relational Materialisation

The ontology defines seven entity types. Each maps to a single base table whose columns correspond to the ontology's data properties and whose foreign-key columns correspond to object properties bounded by cardinality constraints.

**Table `indoor_air_quality_measurements`**

| id | measurement_id | timestamp | pollutant_concentration | unit_of_measure | measurement_method | sensor_calibration_date | indoor_environment_id | indoor_pollutant_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 2618580 | 2024-07-08T18:18:00 | 18.95 | composite-unit-69 | baseline-measurem-25 | 2024-11-22 | 1 | 100 |
| 2 | 1450664 | 2025-12-19T01:35:00 | 21.90 | primary-unit-70 | pilot-measurem-26 | 2025-04-06 | 2 | 101 |
| 3 | 8843762 | 2022-05-03T08:52:00 | 24.85 | adaptive-unit-71 | extended-measurem-27 | 2022-09-17 | 3 | 102 |
| 4 | 392481 | 2023-10-14T15:09:00 | 27.80 | distributed-unit-72 | integrated-measurem-28 | 2023-02-01 | 4 | 103 |

The `indoor_air_quality_measurements` table captures the most granular observational fact: a sensor reading of a specific pollutant in a specific indoor environment at a specific moment. Its primary key is the surrogate `id` column, while `measurement_id` serves as a business-level identifier that is unique across the measurement stream. The temporal dimension is stored in `timestamp` as an ISO-8601 datetime; representative values such as `2024-07-08T18:18:00` and `2025-12-19T01:35:00` anchor each reading to a real-world clock. The numeric core of the measurement is `pollutant_concentration` (e.g. `18.95`, `21.90`, `24.85`, `27.80`), paired with a semantic unit in `unit_of_measure` (values like `composite-unit-69`, `primary-unit-70`). The `measurement_method` column records how the reading was obtained—`baseline-measurem-25`, `pilot-measurem-26`, `extended-measurem-27`, `integrated-measurem-28`—and `sensor_calibration_date` (e.g. `2024-11-22`) tracks the last calibration event. Two foreign-key columns, `indoor_environment_id` and `indoor_pollutant_id`, bind each measurement to its spatial and chemical context. The FK to `indoor_environments` is cardinality-bounded: each measurement belongs to exactly one environment, while each environment hosts many measurements. The FK to `indoor_pollutants` is similarly bounded: each measurement quantifies exactly one pollutant, while each pollutant is measured many times.

**Table `indoor_environments`**

| indoor_environment_id | environment_id | environment_type | building_age | ventilation_rate | occupancy_level | last_inspection_date | indoor_pollutant_id |
|---|---|---|---|---|---|---|---|
| 1 | 726050 | home | 23 | 10.45 | 28 | 2025-04-12 | 100 |
| 2 | 1996940 | school | 31 | 13.90 | 36 | 2022-09-23 | 101 |
| 3 | 2986218 | healthcare_facility | 39 | 17.35 | 44 | 2023-02-07 | 102 |
| 4 | 8350020 | office | 47 | 20.80 | 52 | 2024-07-18 | 103 |

The `indoor_environments` table models the physical spaces where IAQ is relevant. Its surrogate primary key is `indoor_environment_id`, and `environment_id` is a business-level identifier (e.g. `726050`, `1996940`, `2986218`, `8350020`). The `environment_type` column is an enumerated attribute whose values—`home`, `school`, `healthcare_facility`, `office`—distinguish the functional category of the space. Structural and operational attributes include `building_age` (integer years: `23`, `31`, `39`, `47`), `ventilation_rate` (float: `10.45`, `13.90`, `17.35`, `20.80`), and `occupancy_level` (integer persons: `28`, `36`, `44`, `52`). The `last_inspection_date` column (e.g. `2025-04-12`) records the most recent compliance audit. A foreign-key column `indoor_pollutant_id` links each environment to the primary pollutant of concern within it; this is a one-to-one cardinality bound in the current model, meaning each environment is associated with exactly one indoor pollutant entity, and each pollutant entity is associated with exactly one environment.

**Table `indoor_pollutants`**

| id | pollutant_id | pollutant_name | source_type | toxicity_level | regulatory_limit | health_impact_category | source_id | vulnerable_population_id | created_at |
|---|---|---|---|---|---|---|---|---|---|
| 100 | 2087746 | Integrated Series A | building_materials | low | 7.95 | respiratory | 3e9b5c70-8fcd-11eb-924d-9cd76263cbd0 | 1 | 2025-01-01 00:14:00 |
| 101 | 129 | Extended Assessment | fossil_fuel_appliances | moderate | 9.90 | cognitive | 7021001070050 | 2 | 2025-02-06 03:14:00 |
| 102 | 73a5d11c-9bac-11eb-a8a2-19ed5c03f8d3 | Pilot Survey | cleaning_products | high | 11.85 | developmental | achat | 3 | 2025-03-11 06:14:00 |
| 103 | 3717632 | Baseline Corridor D | damp_mould | critical | 13.80 | cardiovascular | template_impcode_pagata_10det50 | 4 | 2025-04-16 09:14:00 |

The `indoor_pollutants` table is the central chemical entity. Its surrogate primary key is `id` (integer: `100`–`103`), while `pollutant_id` is a business-level identifier that uses heterogeneous formats—integers (`2087746`, `129`), UUIDs (`73a5d11c-9bac-11eb-a8a2-19ed5c03f8d3`), and string codes (`achat`, `template_impcode_pagata_10det50`). The `pollutant_name` column carries human-readable labels such as `Integrated Series A`, `Extended Assessment`, `Pilot Survey`, and `Baseline Corridor D`. The `source_type` column (values: `building_materials`, `fossil_fuel_appliances`, `cleaning_products`, `damp_mould`) classifies the origin category of the pollutant. Toxicological attributes include `toxicity_level` (`low`, `moderate`, `high`, `critical`), `regulatory_limit` (float: `7.95`, `9.90`, `11.85`, `13.80`), and `health_impact_category` (`respiratory`, `cognitive`, `developmental`, `cardiovascular`). Two foreign-key columns bind this entity to its provenance and its affected populations: `source_id` references `pollutant_sources.source_id`, and `vulnerable_population_id` references `vulnerable_populations.id`. The `created_at` timestamp (e.g. `2025-01-01 00:14:00`) records when the pollutant record was instantiated.

**Table `pollutant_sources`**

| source_id | source_name | source_category | emission_rate | installation_date | maintenance_status | indoor_environment_id | indoor_pollutant_id |
|---|---|---|---|---|---|---|---|
| 3e9b5c70-8fcd-11eb-924d-9cd76263cbd0 | Composite Model | cooking_appliance | 11.70 | 2022-01-10 | operational | 1 | 100 |
| 7021001070050 | Compact Cluster A | heating_appliance | 16.40 | 2023-06-21 | needs_repair | 2 | 101 |
| achat | Legacy Review | building_material | 21.10 | 2024-11-05 | decommissioned | 3 | 102 |
| template_impcode_pagata_10det50 | Regional Initiative | cleaning_product | 25.80 | 2025-04-16 | operational | 4 | 103 |

The `pollutant_sources` table models the physical or behavioural origin of a pollutant. Its primary key is `source_id`, which uses heterogeneous types—UUIDs (`3e9b5c70-8fcd-11eb-924d-9cd76263cbd0`, `7021001070050`), short strings (`achat`), and descriptive codes (`template_impcode_pagata_10det50`). The `source_name` column carries labels such as `Composite Model`, `Compact Cluster A`, `Legacy Review`, and `Regional Initiative`. The `source_category` column (values: `cooking_appliance`, `heating_appliance`, `building_material`, `cleaning_product`) classifies the source type. Quantitative and operational attributes include `emission_rate` (float: `11.70`, `16.40`, `21.10`, `25.80`), `installation_date` (e.g. `2022-01-10`), and `maintenance_status` (`operational`, `needs_repair`, `decommissioned`). Two foreign-key columns, `indoor_environment_id` and `indoor_pollutant_id`, bind each source to the environment in which it resides and the pollutant it emits.

**Table `vulnerable_populations`**

| id | population_group_id | group_type | prevalence_rate | risk_factor | health_outcome | indoor_pollutant_id | indoor_environment_id | created_at |
|---|---|---|---|---|---|---|---|---|
| 1 | 9085255 | children | 22.45 | greater_exposure | asthma | 100 | 1 | 2025-01-01 00:14:00 |
| 2 | 9bb4ab06-8fcc-11eb-924d-9cd76263cbd0 | older_people | 25.90 | worse_underlying_health | cognitive_impairment | 101 | 2 | 2025-02-06 03:14:00 |
| 3 | 10449506 | pregnant_women | 29.35 | least_empowerment | developmental_defects | 102 | 3 | 2025-03-11 06:14:00 |
| 4 | 3744013 | lower_socioeconomic | 32.80 | greater_exposure | premature_death | 103 | 4 | 2025-04-16 09:14:00 |

The `vulnerable_populations` table captures demographic groups at elevated risk from indoor pollutants. Its surrogate primary key is `id` (integer: `1`–`4`), and `population_group_id` is a business-level identifier using mixed formats (integers like `9085255`, UUIDs like `9bb4ab06-8fcc-11eb-924d-9cd76263cbd0`, and strings like `10449506`, `3744013`). The `group_type` column enumerates the demographic category: `children`, `older_people`, `pregnant_women`, `lower_socioeconomic`. Epidemiological attributes include `prevalence_rate` (float: `22.45`, `25.90`, `29.35`, `32.80`), `risk_factor` (`greater_exposure`, `worse_underlying_health`, `least_empowerment`), and `health_outcome` (`asthma`, `cognitive_impairment`, `developmental_defects`, `premature_death`). Two foreign-key columns, `indoor_pollutant_id` and `indoor_environment_id`, bind each vulnerable population to the pollutant that affects it and the environment where exposure occurs. The `created_at` timestamp (e.g. `2025-01-01 00:14:00`) records record creation.

**Table `policy_instruments`**

| id | instrument_id | instrument_name | instrument_type | issuing_authority | effective_date | enforcement_level | indoor_pollutant_id | indoor_environment_id | department_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 6926365 | Distributed Initiative | regulation | extended-issuing-33 | 2023-02-14 | mandatory | 100 | 1 | 2087755 |
| 2 | account_pymes_691 | Adaptive Model D | guidance | integrated-issuing-34 | 2024-07-25 | voluntary | 101 | 2 | 790483 |
| 3 | 726063 | Primary Cluster | licensing_scheme | seasonal-issuing-35 | 2025-12-09 | penalty_based | 102 | 3 | 505978 |
| 4 | 23256422 | Composite Review | action_plan | regional-issuing-36 | 2022-05-20 | mandatory | 103 | 4 | id_6 |

The `policy_instruments` table encodes regulatory and governance actions. Its surrogate primary key is `id` (integer: `1`–`4`), and `instrument_id` is a business-level identifier (e.g. `6926365`, `account_pymes_691`, `726063`, `23256422`). The `instrument_name` column carries labels such as `Distributed Initiative`, `Adaptive Model D`, `Primary Cluster`, and `Composite Review`. The `instrument_type` column (values: `regulation`, `guidance`, `licensing_scheme`, `action_plan`) classifies the policy mechanism. Governance attributes include `issuing_authority` (e.g. `extended-issuing-33`), `effective_date` (e.g. `2023-02-14`), and `enforcement_level` (`mandatory`, `voluntary`, `penalty_based`). Three foreign-key columns bind each policy instrument to its domain of application: `indoor_pollutant_id`, `indoor_environment_id`, and `department_id` (which references `government_departments`).

**Table `government_departments`**

| department_id | department_name | department_code | responsibility_area | ministerial_lead | established_date | policy_instrument_id | coordinates_with_department_id |
|---|---|---|---|---|---|---|---|
| 2087755 | Baseline Framework D | 605962 | air_quality | legacy-minister-37 | 2024-03-27 | 1 | 2087755 |
| 790483 | Distributed Protocol | 10449510 | health | compact-minister-38 | 2025-08-11 | 2 | 790483 |
| 505978 | Adaptive Programme | 2002007020080 | housing | composite-minister-39 | 2022-01-22 | 3 | 505978 |
| id_6 | Primary Standard A | drafting-skills | education | primary-minister-40 | 2023-06-06 | 4 | id_6 |

The `government_departments` table is a reference table that stores the issuing authorities for policy instruments. Each department is identified by a surrogate primary key (`id`) and a business-level `department_id`. The table's columns capture the department's name, jurisdictional scope, and operational metadata. In the current data, department identifiers include `2087755`, `790483`, `505978`, and `id_6`. Because departments are reference entities, they have no outgoing foreign keys in the base schema; instead, they are the target of the `department_id` FK in `policy_instruments`.

## Join Views and Domain Fact Reconstruction

The base tables are normalised to third normal form, which means that any domain fact spanning multiple entity types must be reconstructed via a join. The ontology provides twelve views, each of which joins two base tables to answer a specific analytical question. The following sections interpret each view, reading concrete rows as evidence.

**View `indoor_air_quality_measurement_indoor_environment_view`**

```sql
CREATE VIEW indoor_air_quality_measurement_indoor_environment_view AS
SELECT a.id, a.measurement_id, a.timestamp, a.pollutant_concentration, b.indoor_environment_id AS environment_indoor_environment_id, b.environment_id AS environment_environment_id, b.environment_type AS environment_environment_type
FROM indoor_air_quality_measurements a JOIN indoor_environments b ON a.indoor_environment_id = b.indoor_environment_id;
```

| id | measurement_id | timestamp | pollutant_concentration | environment_indoor_environment_id | environment_environment_id | environment_environment_type |
|---|---|---|---|---|---|---|
| 1 | 2618580 | 2024-07-08T18:18:00 | 18.95 | 1 | 726050 | home |
| 2 | 1450664 | 2025-12-19T01:35:00 | 21.90 | 2 | 1996940 | school |
| 3 | 8843762 | 2022-05-03T08:52:00 | 24.85 | 3 | 2986218 | healthcare_facility |
| 4 | 392481 | 2023-10-14T15:09:00 | 27.80 | 4 | 8350020 | office |

This view joins `indoor_air_quality_measurements` to `indoor_environments` on `indoor_environment_id`, producing a fact that answers: *What pollutant concentration was recorded in this specific environment at this time?* A representative row shows measurement `2618580` at timestamp `2024-07-08T18:18:00` with concentration `18.95` in environment type `home` (environment_id `726050`), building age `23`, ventilation rate `10.45`, and occupancy level `28`. The join is a many-to-one: each measurement maps to exactly one environment, so the view replicates environment attributes across all measurements taken in that space.

**View `indoor_air_quality_measurement_indoor_pollutant_view`**

```sql
CREATE VIEW indoor_air_quality_measurement_indoor_pollutant_view AS
SELECT a.id, a.measurement_id, a.timestamp, a.pollutant_concentration, b.id AS pollutant_id, b.pollutant_id AS pollutant_pollutant_id, b.pollutant_name AS pollutant_pollutant_name
FROM indoor_air_quality_measurements a JOIN indoor_pollutants b ON a.indoor_pollutant_id = b.id;
```

| id | measurement_id | timestamp | pollutant_concentration | pollutant_id | pollutant_pollutant_id | pollutant_pollutant_name |
|---|---|---|---|---|---|---|
| 1 | 2618580 | 2024-07-08T18:18:00 | 18.95 | 100 | 2087746 | Integrated Series A |
| 2 | 1450664 | 2025-12-19T01:35:00 | 21.90 | 101 | 129 | Extended Assessment |
| 3 | 8843762 | 2022-05-03T08:52:00 | 24.85 | 102 | 73a5d11c-9bac-11eb-a8a2-19ed5c03f8d3 | Pilot Survey |
| 4 | 392481 | 2023-10-14T15:09:00 | 27.80 | 103 | 3717632 | Baseline Corridor D |

This view joins `indoor_air_quality_measurements` to `indoor_pollutants` on `indoor_pollutant_id`, answering: *Which pollutant was measured, and what are its toxicological properties?* A representative row shows measurement `1450664` at timestamp `2025-12-19T01:35:00` with concentration `21.90` for pollutant `Extended Assessment` (id `101`), source type `fossil_fuel_appliances`, toxicity level `moderate`, regulatory limit `9.90`, and health impact category `cognitive`. The join is many-to-one: each measurement quantifies exactly one pollutant.

**View `indoor_environment_indoor_pollutant_view`**

```sql
CREATE VIEW indoor_environment_indoor_pollutant_view AS
SELECT a.indoor_environment_id, a.environment_id, a.environment_type, a.building_age, b.id AS pollutant_id, b.pollutant_id AS pollutant_pollutant_id, b.pollutant_name AS pollutant_pollutant_name
FROM indoor_environments a JOIN indoor_pollutants b ON a.indoor_pollutant_id = b.id;
```

| indoor_environment_id | environment_id | environment_type | building_age | pollutant_id | pollutant_pollutant_id | pollutant_pollutant_name |
|---|---|---|---|---|---|---|
| 1 | 726050 | home | 23 | 100 | 2087746 | Integrated Series A |
| 2 | 1996940 | school | 31 | 101 | 129 | Extended Assessment |
| 3 | 2986218 | healthcare_facility | 39 | 102 | 73a5d11c-9bac-11eb-a8a2-19ed5c03f8d3 | Pilot Survey |
| 4 | 8350020 | office | 47 | 103 | 3717632 | Baseline Corridor D |

This view joins `indoor_environments` to `indoor_pollutants` on `indoor_pollutant_id`, answering: *Which pollutant is the primary concern in this environment?* A representative row links environment `home` (id `726050`, building age `23`, occupancy `28`) to pollutant `Integrated Series A` (id `100`, source type `building_materials`, toxicity `low`, health impact `respiratory`). Because the FK in `indoor_environments` is cardinality-bounded to one, this view produces a one-to-one mapping between environments and their primary pollutants.

**View `indoor_pollutant_pollutant_source_view`**

```sql
CREATE VIEW indoor_pollutant_pollutant_source_view AS
SELECT a.id, a.pollutant_id, a.pollutant_name, a.source_type, b.source_id AS source_source_id, b.source_name AS source_source_name, b.source_category AS source_source_category
FROM indoor_pollutants a JOIN pollutant_sources b ON a.source_id = b.source_id;
```

| id | pollutant_id | pollutant_name | source_type | source_source_id | source_source_name | source_source_category |
|---|---|---|---|---|---|---|
| 100 | 2087746 | Integrated Series A | building_materials | 3e9b5c70-8fcd-11eb-924d-9cd76263cbd0 | Composite Model | cooking_appliance |
| 101 | 129 | Extended Assessment | fossil_fuel_appliances | 7021001070050 | Compact Cluster A | heating_appliance |
| 102 | 73a5d11c-9bac-11eb-a8a2-19ed5c03f8d3 | Pilot Survey | cleaning_products | achat | Legacy Review | building_material |
| 103 | 3717632 | Baseline Corridor D | damp_mould | template_impcode_pagata_10det50 | Regional Initiative | cleaning_product |

This view joins `indoor_pollutants` to `pollutant_sources` on `source_id`, answering: *What is the physical origin of this pollutant, and what is its emission profile?* A representative row links pollutant `Integrated Series A` (toxicity `low`, regulatory limit `7.95`) to source `Composite Model` (category `cooking_appliance`, emission rate `11.70`, installation date `2022-01-10`, maintenance status `operational`). The join is one-to-one in the current model: each pollutant has exactly one source.

**View `indoor_pollutant_vulnerable_population_view`**

```sql
CREATE VIEW indoor_pollutant_vulnerable_population_view AS
SELECT a.id, a.pollutant_id, a.pollutant_name, a.source_type, b.id AS population_id, b.population_group_id AS population_population_group_id, b.group_type AS population_group_type
FROM indoor_pollutants a JOIN vulnerable_populations b ON a.vulnerable_population_id = b.id;
```

| id | pollutant_id | pollutant_name | source_type | population_id | population_population_group_id | population_group_type |
|---|---|---|---|---|---|---|
| 100 | 2087746 | Integrated Series A | building_materials | 1 | 9085255 | children |
| 101 | 129 | Extended Assessment | fossil_fuel_appliances | 2 | 9bb4ab06-8fcc-11eb-924d-9cd76263cbd0 | older_people |
| 102 | 73a5d11c-9bac-11eb-a8a2-19ed5c03f8d3 | Pilot Survey | cleaning_products | 3 | 10449506 | pregnant_women |
| 103 | 3717632 | Baseline Corridor D | damp_mould | 4 | 3744013 | lower_socioeconomic |

This view joins `indoor_pollutants` to `vulnerable_populations` on `vulnerable_population_id`, answering: *Which demographic group is most at risk from this pollutant, and what health outcome is expected?* A representative row links pollutant `Extended Assessment` (toxicity `moderate`, health impact `cognitive`) to vulnerable population `older_people` (prevalence `25.90`, risk factor `worse_underlying_health`, health outcome `cognitive_impairment`). The join is one-to-one: each pollutant is associated with exactly one vulnerable population in the current data.

**View `pollutant_source_indoor_environment_view`**

```sql
CREATE VIEW pollutant_source_indoor_environment_view AS
SELECT a.source_id, a.source_name, a.source_category, a.emission_rate, b.indoor_environment_id AS environment_indoor_environment_id, b.environment_id AS environment_environment_id, b.environment_type AS environment_environment_type
FROM pollutant_sources a JOIN indoor_environments b ON a.indoor_environment_id = b.indoor_environment_id;
```

| source_id | source_name | source_category | emission_rate | environment_indoor_environment_id | environment_environment_id | environment_environment_type |
|---|---|---|---|---|---|---|
| 3e9b5c70-8fcd-11eb-924d-9cd76263cbd0 | Composite Model | cooking_appliance | 11.70 | 1 | 726050 | home |
| 7021001070050 | Compact Cluster A | heating_appliance | 16.40 | 2 | 1996940 | school |
| achat | Legacy Review | building_material | 21.10 | 3 | 2986218 | healthcare_facility |
| template_impcode_pagata_10det50 | Regional Initiative | cleaning_product | 25.80 | 4 | 8350020 | office |

This view joins `pollutant_sources` to `indoor_environments` on `indoor_environment_id`, answering: *In which environment does this pollutant source reside, and what are the environmental conditions?* A representative row links source `Compact Cluster A` (category `heating_appliance`, emission rate `16.40`, status `needs_repair`) to environment `school` (building age `31`, ventilation rate `13.90`, occupancy `36`). The join is one-to-one: each source resides in exactly one environment.

**View `pollutant_source_indoor_pollutant_view`**

```sql
CREATE VIEW pollutant_source_indoor_pollutant_view AS
SELECT a.source_id, a.source_name, a.source_category, a.emission_rate, b.id AS pollutant_id, b.pollutant_id AS pollutant_pollutant_id, b.pollutant_name AS pollutant_pollutant_name
FROM pollutant_sources a JOIN indoor_pollutants b ON a.indoor_pollutant_id = b.id;
```

| source_id | source_name | source_category | emission_rate | pollutant_id | pollutant_pollutant_id | pollutant_pollutant_name |
|---|---|---|---|---|---|---|
| 3e9b5c70-8fcd-11eb-924d-9cd76263cbd0 | Composite Model | cooking_appliance | 11.70 | 100 | 2087746 | Integrated Series A |
| 7021001070050 | Compact Cluster A | heating_appliance | 16.40 | 101 | 129 | Extended Assessment |
| achat | Legacy Review | building_material | 21.10 | 102 | 73a5d11c-9bac-11eb-a8a2-19ed5c03f8d3 | Pilot Survey |
| template_impcode_pagata_10det50 | Regional Initiative | cleaning_product | 25.80 | 103 | 3717632 | Baseline Corridor D |

This view joins `pollutant_sources` to `indoor_pollutants` on `indoor_pollutant_id`, answering: *Which pollutant does this source emit?* A representative row links source `Legacy Review` (category `building_material`, emission rate `21.10`, status `decommissioned`) to pollutant `Pilot Survey` (source type `cleaning_products`, toxicity `high`, regulatory limit `11.85`). The join is one-to-one in the current model.

**View `vulnerable_population_indoor_pollutant_view`**

```sql
CREATE VIEW vulnerable_population_indoor_pollutant_view AS
SELECT a.id, a.population_group_id, a.group_type, a.prevalence_rate, b.id AS pollutant_id, b.pollutant_id AS pollutant_pollutant_id, b.pollutant_name AS pollutant_pollutant_name
FROM vulnerable_populations a JOIN indoor_pollutants b ON a.indoor_pollutant_id = b.id;
```

| id | population_group_id | group_type | prevalence_rate | pollutant_id | pollutant_pollutant_id | pollutant_pollutant_name |
|---|---|---|---|---|---|---|
| 1 | 9085255 | children | 22.45 | 100 | 2087746 | Integrated Series A |
| 2 | 9bb4ab06-8fcc-11eb-924d-9cd76263cbd0 | older_people | 25.90 | 101 | 129 | Extended Assessment |
| 3 | 10449506 | pregnant_women | 29.35 | 102 | 73a5d11c-9bac-11eb-a8a2-19ed5c03f8d3 | Pilot Survey |
| 4 | 3744013 | lower_socioeconomic | 32.80 | 103 | 3717632 | Baseline Corridor D |

This view joins `vulnerable_populations` to `indoor_pollutants` on `indoor_pollutant_id`, answering: *Which pollutant affects this vulnerable population?* A representative row links vulnerable population `pregnant_women` (prevalence `29.35`, risk factor `least_empowerment`, health outcome `developmental_defects`) to pollutant `Pilot Survey` (toxicity `high`, health impact `developmental`). The join is one-to-one.

**View `vulnerable_population_indoor_environment_view`**

```sql
CREATE VIEW vulnerable_population_indoor_environment_view AS
SELECT a.id, a.population_group_id, a.group_type, a.prevalence_rate, b.indoor_environment_id AS environment_indoor_environment_id, b.environment_id AS environment_environment_id, b.environment_type AS environment_environment_type
FROM vulnerable_populations a JOIN indoor_environments b ON a.indoor_environment_id = b.indoor_environment_id;
```

| id | population_group_id | group_type | prevalence_rate | environment_indoor_environment_id | environment_environment_id | environment_environment_type |
|---|---|---|---|---|---|---|
| 1 | 9085255 | children | 22.45 | 1 | 726050 | home |
| 2 | 9bb4ab06-8fcc-11eb-924d-9cd76263cbd0 | older_people | 25.90 | 2 | 1996940 | school |
| 3 | 10449506 | pregnant_women | 29.35 | 3 | 2986218 | healthcare_facility |
| 4 | 3744013 | lower_socioeconomic | 32.80 | 4 | 8350020 | office |

This view joins `vulnerable_populations` to `indoor_environments` on `indoor_environment_id`, answering: *In which environment is this vulnerable population exposed?* A representative row links vulnerable population `lower_socioeconomic` (prevalence `32.80`, risk factor `greater_exposure`, health outcome `premature_death`) to environment `office` (building age `47`, ventilation rate `20.80`, occupancy `52`). The join is one-to-one.

**View `policy_instrument_indoor_pollutant_view`**

```sql
CREATE VIEW policy_instrument_indoor_pollutant_view AS
SELECT a.id, a.instrument_id, a.instrument_name, a.instrument_type, b.id AS pollutant_id, b.pollutant_id AS pollutant_pollutant_id, b.pollutant_name AS pollutant_pollutant_name
FROM policy_instruments a JOIN indoor_pollutants b ON a.indoor_pollutant_id = b.id;
```

| id | instrument_id | instrument_name | instrument_type | pollutant_id | pollutant_pollutant_id | pollutant_pollutant_name |
|---|---|---|---|---|---|---|
| 1 | 6926365 | Distributed Initiative | regulation | 100 | 2087746 | Integrated Series A |
| 2 | account_pymes_691 | Adaptive Model D | guidance | 101 | 129 | Extended Assessment |
| 3 | 726063 | Primary Cluster | licensing_scheme | 102 | 73a5d11c-9bac-11eb-a8a2-19ed5c03f8d3 | Pilot Survey |
| 4 | 23256422 | Composite Review | action_plan | 103 | 3717632 | Baseline Corridor D |

This view joins `policy_instruments` to `indoor_pollutants` on `indoor_pollutant_id`, answering: *Which pollutant is targeted by this policy instrument?* A representative row links policy instrument `Distributed Initiative` (type `regulation`, issuing authority `extended-issuing-33`, effective date `2023-02-14`, enforcement `mandatory`) to pollutant `Integrated Series A` (toxicity `low`, health impact `respiratory`). The join is one-to-one.

**View `policy_instrument_indoor_environment_view`**

```sql
CREATE VIEW policy_instrument_indoor_environment_view AS
SELECT a.id, a.instrument_id, a.instrument_name, a.instrument_type, b.indoor_environment_id AS environment_indoor_environment_id, b.environment_id AS environment_environment_id, b.environment_type AS environment_environment_type
FROM policy_instruments a JOIN indoor_environments b ON a.indoor_environment_id = b.indoor_environment_id;
```

| id | instrument_id | instrument_name | instrument_type | environment_indoor_environment_id | environment_environment_id | environment_environment_type |
|---|---|---|---|---|---|---|
| 1 | 6926365 | Distributed Initiative | regulation | 1 | 726050 | home |
| 2 | account_pymes_691 | Adaptive Model D | guidance | 2 | 1996940 | school |
| 3 | 726063 | Primary Cluster | licensing_scheme | 3 | 2986218 | healthcare_facility |
| 4 | 23256422 | Composite Review | action_plan | 4 | 8350020 | office |

This view joins `policy_instruments` to `indoor_environments` on `indoor_environment_id`, answering: *In which environment does this policy instrument apply?* A representative row links policy instrument `Adaptive Model D` (type `guidance`, issuing authority `integrated-issuing-34`, effective date `2024-07-25`, enforcement `voluntary`) to environment `school` (building age `31`, ventilation rate `13.90`, occupancy `36`). The join is one-to-one.

**View `policy_instrument_government_department_view`**

```sql
CREATE VIEW policy_instrument_government_department_view AS
SELECT a.id, a.instrument_id, a.instrument_name, a.instrument_type, b.department_id AS department_department_id, b.department_name AS department_department_name, b.department_code AS department_department_code
FROM policy_instruments a JOIN government_departments b ON a.department_id = b.department_id;
```

| id | instrument_id | instrument_name | instrument_type | department_department_id | department_department_name | department_department_code |
|---|---|---|---|---|---|---|
| 1 | 6926365 | Distributed Initiative | regulation | 2087755 | Baseline Framework D | 605962 |
| 2 | account_pymes_691 | Adaptive Model D | guidance | 790483 | Distributed Protocol | 10449510 |
| 3 | 726063 | Primary Cluster | licensing_scheme | 505978 | Adaptive Programme | 2002007020080 |
| 4 | 23256422 | Composite Review | action_plan | id_6 | Primary Standard A | drafting-skills |

This view joins `policy_instruments` to `government_departments` on `department_id`, answering: *Which government department issued this policy instrument?* A representative row links policy instrument `Primary Cluster` (type `licensing_scheme`, issuing authority `seasonal-issuing-35`, effective date `2025-12-09`, enforcement `penalty_based`) to government department `505978`. The join is many-to-one: each department issues many policy instruments.

**View `government_department_policy_instrument_view`**

```sql
CREATE VIEW government_department_policy_instrument_view AS
SELECT a.department_id, a.department_name, a.department_code, a.responsibility_area, b.id AS instrument_id, b.instrument_id AS instrument_instrument_id, b.instrument_name AS instrument_instrument_name
FROM government_departments a JOIN policy_instruments b ON a.policy_instrument_id = b.id;
```

| department_id | department_name | department_code | responsibility_area | instrument_id | instrument_instrument_id | instrument_instrument_name |
|---|---|---|---|---|---|---|
| 2087755 | Baseline Framework D | 605962 | air_quality | 1 | 6926365 | Distributed Initiative |
| 790483 | Distributed Protocol | 10449510 | health | 2 | account_pymes_691 | Adaptive Model D |
| 505978 | Adaptive Programme | 2002007020080 | housing | 3 | 726063 | Primary Cluster |
| id_6 | Primary Standard A | drafting-skills | education | 4 | 23256422 | Composite Review |

This view joins `government_departments` to `policy_instruments` on `department_id`, answering: *Which policy instruments has this government department issued?* A representative row links government department `2087755` to policy instrument `Distributed Initiative` (type `regulation`, issuing authority `extended-issuing-33`, effective date `2023-02-14`, enforcement `mandatory`). The join is one-to-many: each department issues many instruments.

**View `government_department_government_department_view`**

```sql
CREATE VIEW government_department_government_department_view AS
SELECT a.department_id, a.department_name, a.department_code, a.responsibility_area, b.department_id AS department_department_id, b.department_name AS department_department_name, b.department_code AS department_department_code
FROM government_departments a JOIN government_departments b ON a.coordinates_with_department_id = b.department_id;
```

| department_id | department_name | department_code | responsibility_area | department_department_id | department_department_name | department_department_code |
|---|---|---|---|---|---|---|
| 2087755 | Baseline Framework D | 605962 | air_quality | 2087755 | Baseline Framework D | 605962 |
| 790483 | Distributed Protocol | 10449510 | health | 790483 | Distributed Protocol | 10449510 |
| 505978 | Adaptive Programme | 2002007020080 | housing | 505978 | Adaptive Programme | 2002007020080 |
| id_6 | Primary Standard A | drafting-skills | education | id_6 | Primary Standard A | drafting-skills |

This view joins `government_departments` to itself, answering: *Which government departments share a hierarchical or collaborative relationship?* In the current data, this self-join produces rows that link department `2087755` to department `790483`, department `505978` to department `id_6`, and so on. The self-join reflects an ontology relationship between departments—such as parent-child jurisdiction, shared mandate, or inter-departmental coordination—that is stored as a foreign key within the `government_departments` table itself.

## Synthesis

The schema embodies a clean separation of concerns: observational data (`indoor_air_quality_measurements`) is decoupled from the physical spaces (`indoor_environments`) and chemical entities (`indoor_pollutants`) it describes; pollutant provenance (`pollutant_sources`) and affected demographics (`vulnerable_populations`) are modelled as independent entities linked by foreign keys; and governance (`policy_instruments`, `government_departments`) sits as a parallel layer that targets specific pollutants and environments. The twelve join views reconstruct the multi-entity facts that the normalised base tables deliberately fragment. Together, the tables and views form a complete relational materialisation of the indoor air quality ontology, enabling both transactional integrity through foreign-key constraints and analytical flexibility through declarative joins.