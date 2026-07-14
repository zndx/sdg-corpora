## Ontology-Grounded Relational Modelling in Emissions Monitoring

The emissions monitoring domain captures the lifecycle of industrial pollution sources, the instruments deployed to measure them, the crews that perform compliance tests, and the managerial hierarchy that orchestrates everything. At the conceptual level, the ontology distinguishes six core entity types—emissions monitoring stations, emission sources, test crews, project managers, emissions test programs, and regional offices—along with two associative roles that materialize as junction tables. The relational schema grounds each ontology class in a table, encards attributes as columns, and binds entities together through foreign keys and join views. The following sections walk through the materialisation step by step, using concrete rows to illustrate how domain facts survive normalisation and how views reconstruct them.

### Base Tables and Their Ontological Roles

The anchor of the schema is `emissions_monitoring_stations`, which stores the physical instruments installed at industrial sites.

**Table `emissions_monitoring_stations`**

| id | station_id | installation_date | last_calibration_date | operational_status | manufacturer | model_number | emission_source_id | test_crew_id |
|---|---|---|---|---|---|---|---|---|
| 1 | strategic-networking | 2022-01-10 | 2025-12-01 | active | Standard Chartered | MOD-2238 | 100 | 1000 |
| 2 | 974947 | 2023-06-21 | 2022-05-12 | inactive | General Motors | MOD-2244 | 101 | 1001 |
| 3 | 374 | 2024-11-05 | 2023-10-23 | under_maintenance | Column Name cannot be empty | MOD-2250 | 102 | 1002 |
| 4 | dce72594-8fcd-11eb-924d-9cd76263cbd0 | 2025-04-16 | 2024-03-07 | active | Financial Information Service Co. Ltd. | MOD-2256 | 103 | 1003 |

Each row carries a surrogate primary key `id`, a business-meaningful `station_id` (values range from the UUID-like `dce72594-8fcd-11eb-924d-924d-9cd76263cbd0` to the short code `374`), and two date columns—`installation_date` and `last_calibration_date`—that track the instrument's lifecycle. The `operational_status` column is a categorical attribute with values such as `active`, `inactive`, and `under_maintenance`. Manufacturer information is captured in `manufacturer` and `model_number` (e.g., `Standard Chartered` / `MOD-2238`). Crucially, two foreign keys—`emission_source_id` and `test_crew_id`—tie the station to its source and the crew assigned to it. In the sample data, station `id = 1` (station_id `strategic-networking`) references emission source `100` and test crew `1000`, establishing a direct one-to-one linkage that the ontology models as a bounded association.

The counterpart entity, `emission_sources`, describes the industrial facilities themselves.

**Table `emission_sources`**

| emission_source_id | source_id | source_type | commissioning_date | operational_status | fuel_type | capacity_mw | emissions_monitoring_station_id | test_crew_id | created_at |
|---|---|---|---|---|---|---|---|---|---|
| 100 | 3e9b5c70-8fcd-11eb-924d-9cd76263cbd0 | coal_fired_boiler | 2025-12-03 | operational | coal | 18.70 | 1 | 1000 | 2025-01-01 00:14:00 |
| 101 | 7021001070050 | oil_fired_boiler | 2022-05-14 | decommissioned | oil | 20.40 | 2 | 1001 | 2025-02-06 03:14:00 |
| 102 | achat | gas_turbine | 2023-10-25 | standby | natural_gas | 22.10 | 3 | 1002 | 2025-03-11 06:14:00 |
| 103 | template_impcode_pagata_10det50 | foundry | 2024-03-09 | operational | waste | 23.80 | 4 | 1003 | 2025-04-16 09:14:00 |

The primary key `emission_source_id` (values `100` through `103`) anchors each row, while `source_id` carries a domain identifier that can be a UUID (`3e9b5c70-8fcd-11eb-924d-9cd76263cbd0`), a numeric string (`7021001070050`), or a short code (`achat`). The `source_type` column classifies the facility—`coal_fired_boiler`, `oil_fired_boiler`, `gas_turbine`, `foundry`—and `fuel_type` records the energy input (`coal`, `oil`, `natural_gas`, `waste`). Capacity is stored as `capacity_mw` (ranging from `18.70` to `23.80` megawatts). The `commissioning_date` and `operational_status` (`operational`, `decommissioned`, `standby`) mirror the lifecycle attributes of the monitoring station. Foreign keys `emissions_monitoring_station_id` and `test_crew_id` create a bidirectional link back to the station and crew tables, ensuring referential integrity in both directions.

Test crews are the human (or organisational) actors performing compliance measurements.

**Table `test_crews`**

| test_crew_id | crew_id | crew_name | supervisor_id | certification_level | active_since | manager_id | emission_source_id | emissions_monitoring_station_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|
| 1000 | state_et_7 | Distributed Review | account_pymes_255 | seasonal-certific-59 | 2023-10-11 | id_23 | 100 | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 1001 | ChIJB4i7Dqpt5kcRfEnfwsHulbU | Adaptive Initiative D | 328 | regional-certific-60 | 2024-03-22 | 10449531 | 101 | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 1002 | 4180964 | Primary Model | 1996938 | legacy-certific-61 | 2025-08-06 | 659 | 102 | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 1003 | Cash | Composite Cluster | ChIJIbRFlPtt5kcR5kM81XdpSfI | compact-certific-62 | 2022-01-17 | f208f470-8fcd-11eb-924d-9cd76263cbd0 | 103 | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The primary key `test_crew_id` (values `1000`–`1003`) identifies each crew, while `crew_id` holds a domain-level identifier such as `state_et_7` or `ChIJB4i7Dqpt5kcRfEnfwsHulbU`. The `crew_name` column carries descriptive labels like `Distributed Review` and `Adaptive Initiative D`. The `supervisor_id` column references a manager or supervisory entity, and `certification_level` encodes the crew's qualification tier (`seasonal-certific-59`, `regional-certific-60`, `legacy-certific-61`, `compact-certific-62`). The `active_since` date marks when the crew became operational. The `manager_id` foreign key links the crew to a `project_manager`, while `emission_source_id` and `emissions_monitoring_station_id` re-establish the bidirectional associations with the physical entities. Timestamps `created_at` and `updated_at` provide audit trails.

Project managers sit at the top of the operational hierarchy.

**Table `project_managers`**

| manager_id | full_name | office_location | certifications | years_of_experience | regional_office_id | emissions_test_program_id | created_at |
|---|---|---|---|---|---|---|---|
| id_23 | Theodore Mcgrath | composite-office-99 | distributed-certific-78 | 7 | 1 | 1000 | 2025-01-01 00:14:00 |
| 10449531 | Account Name | primary-office-100 | baseline-certific-79 | 10 | 2 | 1001 | 2025-02-06 03:14:00 |
| 659 | Saipan International Airport | adaptive-office-101 | pilot-certific-80 | 13 | 3 | 1002 | 2025-03-11 06:14:00 |
| f208f470-8fcd-11eb-924d-9cd76263cbd0 | Norma Fisher | distributed-office-102 | extended-certific-81 | 16 | 4 | 1003 | 2025-04-16 09:14:00 |

Each manager is identified by `manager_id` (values include the UUID `f208f470-8fcd-11eb-924d-9cd76263cbd0` and the short identifier `659`). The `full_name` column stores names like `Theodore Mcgrath` and `Norma Fisher`. The `office_location` column (e.g., `composite-office-99`, `distributed-office-102`) and the `certifications` column (e.g., `distributed-certific-78`, `extended-certific-81`) capture organisational and qualification metadata. `years_of_experience` is a numeric attribute ranging from `7` to `16`. Two foreign keys—`regional_office_id` and `emissions_test_program_id`—tie the manager to a regional office and an emissions test program respectively, embedding the managerial hierarchy directly into the table.

Emissions test programs define the compliance activities themselves.

**Table `emissions_test_programs`**

| id | program_id | program_name | start_date | end_date | test_type | status | emission_source_id | emissions_monitoring_station_id |
|---|---|---|---|---|---|---|---|---|
| 1000 | 103176 | Extended Review | 2022-09-05 | 2022-09-01 | relative_accuracy_test | planned | 100 | 1 |
| 1001 | 2986219 | Pilot Initiative A | 2023-02-16 | 2023-02-12 | performance_evaluation | ongoing | 101 | 2 |
| 1002 | 1186079 | Baseline Model | 2024-07-27 | 2024-07-23 | wet_chemistry_analysis | completed | 102 | 3 |
| 1003 | 1562855 | Distributed Cluster | 2025-12-11 | 2025-12-07 | relative_accuracy_test | failed | 103 | 4 |

The surrogate primary key `id` (values `1000`–`1003`) anchors each program, while `program_id` carries a domain identifier such as `103176` or `1562855`. The `program_name` column holds descriptive titles like `Extended Review` and `Distributed Cluster`. The `start_date` and `end_date` columns define the program's temporal window, and `test_type` classifies the methodology (`relative_accuracy_test`, `performance_evaluation`, `wet_chemistry_analysis`). The `status` column tracks progress with values including `planned`, `ongoing`, `completed`, and `failed`. Foreign keys `emission_source_id` and `emissions_monitoring_station_id` bind each program to the specific source and station it evaluates.

Regional offices provide the geographic and administrative structure.

**Table `regional_offices`**

| id | office_id | office_name | city | state | established_date | manager_id | test_crew_id |
|---|---|---|---|---|---|---|---|
| 1 | 5917279 | Pilot Review | integrated-city-34 | distributed-state-84 | 2024-03-27 | id_23 | 1000 |
| 2 | 10445641 | Baseline Initiative | seasonal-city-35 | baseline-state-85 | 2025-08-11 | 10449531 | 1001 |
| 3 | 12715698 | Distributed Model A | regional-city-36 | pilot-state-86 | 2022-01-22 | 659 | 1002 |
| 4 | 3012823 | Adaptive Cluster | legacy-city-37 | extended-state-87 | 2023-06-06 | f208f470-8fcd-11eb-924d-9cd76263cbd0 | 1003 |

Each office has a surrogate `id` (`1`–`4`), a domain `office_id` (`5917279`, `10445641`, etc.), and a `office_name` such as `Pilot Review` or `Adaptive Cluster`. The `city` and `state` columns (e.g., `integrated-city-34` / `distributed-state-84`) locate the office geographically. The `established_date` records when the office was founded. Foreign keys `manager_id` and `test_crew_id` link the office to its manager and assigned test crew, completing the administrative chain.

### Junction Tables and Many-to-Many Relationships

The ontology also defines two associative entity types that materialise as junction tables. The `managers_crews` table resolves the many-to-many relationship between `project_managers` and `test_crews`, allowing a single manager to supervise multiple crews and a crew to report to multiple managers across different programs or regions. Similarly, the `programs_crews` table resolves the many-to-many relationship between `emissions_test_programs` and `test_crews`, enabling a crew to participate in multiple test programs and a program to deploy multiple crews. These junction tables are the relational encoding of the ontology's association classes, preserving the flexibility of the conceptual model while maintaining third-normal-form integrity.

### View-Based Fact Reconstruction

The base tables are highly normalised, which means any single domain fact—such as "which test crew is assigned to which emission source at which monitoring station"—is scattered across multiple rows. Views perform the join operations that reconstruct these facts into flat, queryable result sets. Each view answers a specific analytical question by pulling columns from two or more base tables.

The view `emissions_monitoring_station_emission_source_view` joins `emissions_monitoring_stations` to `emission_sources` on the shared station-to-source linkage, answering the question: "For each monitoring station, what is the associated emission source and its technical specifications?" A row from this view might show station `strategic-networking` paired with emission source `3e9b5c70-8fcd-11eb-924d-9cd76263cbd0`, a coal-fired boiler of `18.70` MW capacity.

The view `emissions_monitoring_station_test_crew_view` joins the station table to the test crews table, answering: "Which test crew is assigned to each monitoring station?" A representative row links station `974947` (operational status `inactive`) to test crew `ChIJB4i7Dqpt5kcRfEnfwsHulbU` (crew name `Adaptive Initiative D`, certification level `regional-certific-60`).

The view `emission_source_emissions_monitoring_station_view` performs the inverse join—starting from the emission source and pulling in the monitoring station details. This answers: "For each emission source, which monitoring instrument is deployed?" A row might show emission source `achat` (a gas turbine on `natural_gas`) paired with monitoring station `374` (manufacturer `Column Name cannot be empty`, status `under_maintenance`).

The view `emission_source_test_crew_view` joins emission sources to test crews, answering: "Which test crew is responsible for testing each emission source?" A row could pair emission source `template_impcode_pagata_10det50` (a foundry, `waste` fuel, `23.80` MW) with test crew `Cash` (crew name `Composite Cluster`, certification level `compact-certific-62`).

The view `test_crew_project_manager_view` joins test crews to project managers, answering: "Which project manager supervises each test crew?" A row might show test crew `state_et_7` (crew name `Distributed Review`) supervised by manager `Theodore Mcgrath` (office `composite-office-99`, `7` years of experience).

The view `test_crew_emission_source_view` joins test crews to emission sources, answering: "Which emission source is each test crew assigned to test?" A row could pair test crew `4180964` (crew name `Primary Model`) with emission source `achat` (gas turbine, `natural_gas`, `22.10` MW).

The view `test_crew_emissions_monitoring_station_view` joins test crews to monitoring stations, answering: "Which monitoring station does each test crew operate?" A row might show test crew `ChIJB4i7Dqpt5kcRfEnfwsHulbU` operating monitoring station `974947` (manufacturer `General Motors`, model `MOD-2244`, status `inactive`).

The view `project_manager_regional_office_view` joins project managers to regional offices, answering: "Which regional office is each project manager assigned to?" A row could show manager `Account Name` (certifications `baseline-certific-79`, `10` years experience) assigned to regional office `Baseline Initiative` (city `seasonal-city-35`, state `baseline-state-85`).

The view `project_manager_test_crew_detail_view` joins project managers to test crews, answering: "Which test crews report to each project manager?" A row might pair manager `Norma Fisher` (office `distributed-office-102`, `16` years experience, certifications `extended-certific-81`) with test crew `Cash` (crew name `Composite Cluster`, certification level `compact-certific-62`).

The view `project_manager_emissions_test_program_view` joins project managers to emissions test programs, answering: "Which test programs is each project manager overseeing?" A row could show manager `Saipan International Airport` (office `adaptive-office-101`, `13` years experience) overseeing program `1186079` (program name `Baseline Model`, test type `wet_chemistry_analysis`, status `completed`).

The view `emissions_test_program_emission_source_view` joins emissions test programs to emission sources, answering: "Which emission source is each test program evaluating?" A row might show program `103176` (program name `Extended Review`, test type `relative_accuracy_test`, status `planned`) evaluating emission source `3e9b5c70-8fcd-11eb-924d-9cd76263cbd0` (coal-fired boiler, `coal` fuel, `18.70` MW).

The view `emissions_test_program_emissions_monitoring_station_view` joins emissions test programs to monitoring stations, answering: "Which monitoring station is used for each test program?" A row could pair program `2986219` (program name `Pilot Initiative A`, test type `performance_evaluation`, status `ongoing`) with monitoring station `974947` (manufacturer `General Motors`, model `MOD-2244`).

The view `emissions_test_program_test_crew_detail_view` joins emissions test programs to test crews, answering: "Which test crews are deployed for each test program?" A row might show program `1562855` (program name `Distributed Cluster`, test type `relative_accuracy_test`, status `failed`) deploying test crew `4180964` (crew name `Primary Model`, certification level `legacy-certific-61`).

The view `regional_office_project_manager_view` joins regional offices to project managers, answering: "Which project managers are assigned to each regional office?" A row could show regional office `Distributed Model A` (city `regional-city-36`, state `pilot-state-86`) with manager `Saipan International Airport` (office `adaptive-office-101`, `13` years experience).

The view `regional_office_test_crew_view` joins regional offices to test crews, answering: "Which test crews are assigned to each regional office?" A row might pair regional office `Adaptive Cluster` (city `legacy-city-37`, state `extended-state-87`) with test crew `Cash` (crew name `Composite Cluster`, certification level `compact-certific-62`).

### Synthesis

The ontology-grounded schema demonstrates a clean separation between entity storage and fact reconstruction. Six base tables encode the core domain concepts with their attributes as columns and inter-entity relationships as foreign keys. Two junction tables (`managers_crews` and `programs_crews`) resolve many-to-many associations that cannot be expressed through simple foreign key columns. Fourteen views perform the join operations that reconstruct domain facts from the normalised tables, each view answering a specific analytical question by combining columns from two or more base tables. The concrete values in the data—station identifiers like `strategic-networking` and `dce72594-8fcd-11eb-924d-9cd76263cbd0`, emission source types like `coal_fired_boiler` and `foundry`, certification levels like `seasonal-certific-59` and `compact-certific-62`, and program statuses like `planned` and `failed`—serve as evidence that the schema faithfully captures the richness of the emissions monitoring domain while remaining structurally sound and query-efficient.

## Data appendix

**Table `managers_crews`**

| manager_id | test_crew_id |
|---|---|
| id_23 | 1000 |
| id_23 | 1001 |
| 10449531 | 1001 |
| 10449531 | 1002 |
| 659 | 1002 |
| 659 | 1003 |
| f208f470-8fcd-11eb-924d-9cd76263cbd0 | 1003 |
| f208f470-8fcd-11eb-924d-9cd76263cbd0 | 1000 |

**Table `programs_crews`**

| emissions_test_program_id | test_crew_id |
|---|---|
| 1000 | 1000 |
| 1000 | 1001 |
| 1001 | 1001 |
| 1001 | 1002 |
| 1002 | 1002 |
| 1002 | 1003 |
| 1003 | 1003 |
| 1003 | 1000 |

**View `emissions_monitoring_station_emission_source_view`**

```sql
CREATE VIEW emissions_monitoring_station_emission_source_view AS
SELECT a.id, a.station_id, a.installation_date, a.last_calibration_date, b.emission_source_id AS source_emission_source_id, b.source_id AS source_source_id, b.source_type AS source_source_type
FROM emissions_monitoring_stations a JOIN emission_sources b ON a.emission_source_id = b.emission_source_id;
```

| id | station_id | installation_date | last_calibration_date | source_emission_source_id | source_source_id | source_source_type |
|---|---|---|---|---|---|---|
| 1 | strategic-networking | 2022-01-10 | 2025-12-01 | 100 | 3e9b5c70-8fcd-11eb-924d-9cd76263cbd0 | coal_fired_boiler |
| 2 | 974947 | 2023-06-21 | 2022-05-12 | 101 | 7021001070050 | oil_fired_boiler |
| 3 | 374 | 2024-11-05 | 2023-10-23 | 102 | achat | gas_turbine |
| 4 | dce72594-8fcd-11eb-924d-9cd76263cbd0 | 2025-04-16 | 2024-03-07 | 103 | template_impcode_pagata_10det50 | foundry |

**View `emissions_monitoring_station_test_crew_view`**

```sql
CREATE VIEW emissions_monitoring_station_test_crew_view AS
SELECT a.id, a.station_id, a.installation_date, a.last_calibration_date, b.test_crew_id AS crew_test_crew_id, b.crew_id AS crew_crew_id, b.crew_name AS crew_crew_name
FROM emissions_monitoring_stations a JOIN test_crews b ON a.test_crew_id = b.test_crew_id;
```

| id | station_id | installation_date | last_calibration_date | crew_test_crew_id | crew_crew_id | crew_crew_name |
|---|---|---|---|---|---|---|
| 1 | strategic-networking | 2022-01-10 | 2025-12-01 | 1000 | state_et_7 | Distributed Review |
| 2 | 974947 | 2023-06-21 | 2022-05-12 | 1001 | ChIJB4i7Dqpt5kcRfEnfwsHulbU | Adaptive Initiative D |
| 3 | 374 | 2024-11-05 | 2023-10-23 | 1002 | 4180964 | Primary Model |
| 4 | dce72594-8fcd-11eb-924d-9cd76263cbd0 | 2025-04-16 | 2024-03-07 | 1003 | Cash | Composite Cluster |

**View `emission_source_emissions_monitoring_station_view`**

```sql
CREATE VIEW emission_source_emissions_monitoring_station_view AS
SELECT a.emission_source_id, a.source_id, a.source_type, a.commissioning_date, b.id AS station_id, b.station_id AS station_station_id, b.installation_date AS station_installation_date
FROM emission_sources a JOIN emissions_monitoring_stations b ON a.emissions_monitoring_station_id = b.id;
```

| emission_source_id | source_id | source_type | commissioning_date | station_id | station_station_id | station_installation_date |
|---|---|---|---|---|---|---|
| 100 | 3e9b5c70-8fcd-11eb-924d-9cd76263cbd0 | coal_fired_boiler | 2025-12-03 | 1 | strategic-networking | 2022-01-10 |
| 101 | 7021001070050 | oil_fired_boiler | 2022-05-14 | 2 | 974947 | 2023-06-21 |
| 102 | achat | gas_turbine | 2023-10-25 | 3 | 374 | 2024-11-05 |
| 103 | template_impcode_pagata_10det50 | foundry | 2024-03-09 | 4 | dce72594-8fcd-11eb-924d-9cd76263cbd0 | 2025-04-16 |

**View `emission_source_test_crew_view`**

```sql
CREATE VIEW emission_source_test_crew_view AS
SELECT a.emission_source_id, a.source_id, a.source_type, a.commissioning_date, b.test_crew_id AS crew_test_crew_id, b.crew_id AS crew_crew_id, b.crew_name AS crew_crew_name
FROM emission_sources a JOIN test_crews b ON a.test_crew_id = b.test_crew_id;
```

| emission_source_id | source_id | source_type | commissioning_date | crew_test_crew_id | crew_crew_id | crew_crew_name |
|---|---|---|---|---|---|---|
| 100 | 3e9b5c70-8fcd-11eb-924d-9cd76263cbd0 | coal_fired_boiler | 2025-12-03 | 1000 | state_et_7 | Distributed Review |
| 101 | 7021001070050 | oil_fired_boiler | 2022-05-14 | 1001 | ChIJB4i7Dqpt5kcRfEnfwsHulbU | Adaptive Initiative D |
| 102 | achat | gas_turbine | 2023-10-25 | 1002 | 4180964 | Primary Model |
| 103 | template_impcode_pagata_10det50 | foundry | 2024-03-09 | 1003 | Cash | Composite Cluster |

**View `test_crew_project_manager_view`**

```sql
CREATE VIEW test_crew_project_manager_view AS
SELECT a.test_crew_id, a.crew_id, a.crew_name, a.supervisor_id, b.manager_id AS manager_manager_id, b.full_name AS manager_full_name, b.office_location AS manager_office_location
FROM test_crews a JOIN project_managers b ON a.manager_id = b.manager_id;
```

| test_crew_id | crew_id | crew_name | supervisor_id | manager_manager_id | manager_full_name | manager_office_location |
|---|---|---|---|---|---|---|
| 1000 | state_et_7 | Distributed Review | account_pymes_255 | id_23 | Theodore Mcgrath | composite-office-99 |
| 1001 | ChIJB4i7Dqpt5kcRfEnfwsHulbU | Adaptive Initiative D | 328 | 10449531 | Account Name | primary-office-100 |
| 1002 | 4180964 | Primary Model | 1996938 | 659 | Saipan International Airport | adaptive-office-101 |
| 1003 | Cash | Composite Cluster | ChIJIbRFlPtt5kcR5kM81XdpSfI | f208f470-8fcd-11eb-924d-9cd76263cbd0 | Norma Fisher | distributed-office-102 |

**View `test_crew_emission_source_view`**

```sql
CREATE VIEW test_crew_emission_source_view AS
SELECT a.test_crew_id, a.crew_id, a.crew_name, a.supervisor_id, b.emission_source_id AS source_emission_source_id, b.source_id AS source_source_id, b.source_type AS source_source_type
FROM test_crews a JOIN emission_sources b ON a.emission_source_id = b.emission_source_id;
```

| test_crew_id | crew_id | crew_name | supervisor_id | source_emission_source_id | source_source_id | source_source_type |
|---|---|---|---|---|---|---|
| 1000 | state_et_7 | Distributed Review | account_pymes_255 | 100 | 3e9b5c70-8fcd-11eb-924d-9cd76263cbd0 | coal_fired_boiler |
| 1001 | ChIJB4i7Dqpt5kcRfEnfwsHulbU | Adaptive Initiative D | 328 | 101 | 7021001070050 | oil_fired_boiler |
| 1002 | 4180964 | Primary Model | 1996938 | 102 | achat | gas_turbine |
| 1003 | Cash | Composite Cluster | ChIJIbRFlPtt5kcR5kM81XdpSfI | 103 | template_impcode_pagata_10det50 | foundry |

**View `test_crew_emissions_monitoring_station_view`**

```sql
CREATE VIEW test_crew_emissions_monitoring_station_view AS
SELECT a.test_crew_id, a.crew_id, a.crew_name, a.supervisor_id, b.id AS station_id, b.station_id AS station_station_id, b.installation_date AS station_installation_date
FROM test_crews a JOIN emissions_monitoring_stations b ON a.emissions_monitoring_station_id = b.id;
```

| test_crew_id | crew_id | crew_name | supervisor_id | station_id | station_station_id | station_installation_date |
|---|---|---|---|---|---|---|
| 1000 | state_et_7 | Distributed Review | account_pymes_255 | 1 | strategic-networking | 2022-01-10 |
| 1001 | ChIJB4i7Dqpt5kcRfEnfwsHulbU | Adaptive Initiative D | 328 | 2 | 974947 | 2023-06-21 |
| 1002 | 4180964 | Primary Model | 1996938 | 3 | 374 | 2024-11-05 |
| 1003 | Cash | Composite Cluster | ChIJIbRFlPtt5kcR5kM81XdpSfI | 4 | dce72594-8fcd-11eb-924d-9cd76263cbd0 | 2025-04-16 |

**View `project_manager_regional_office_view`**

```sql
CREATE VIEW project_manager_regional_office_view AS
SELECT a.manager_id, a.full_name, a.office_location, a.certifications, b.id AS office_id, b.office_id AS office_office_id, b.office_name AS office_office_name
FROM project_managers a JOIN regional_offices b ON a.regional_office_id = b.id;
```

| manager_id | full_name | office_location | certifications | office_id | office_office_id | office_office_name |
|---|---|---|---|---|---|---|
| id_23 | Theodore Mcgrath | composite-office-99 | distributed-certific-78 | 1 | 5917279 | Pilot Review |
| 10449531 | Account Name | primary-office-100 | baseline-certific-79 | 2 | 10445641 | Baseline Initiative |
| 659 | Saipan International Airport | adaptive-office-101 | pilot-certific-80 | 3 | 12715698 | Distributed Model A |
| f208f470-8fcd-11eb-924d-9cd76263cbd0 | Norma Fisher | distributed-office-102 | extended-certific-81 | 4 | 3012823 | Adaptive Cluster |

**View `project_manager_test_crew_detail_view`**

```sql
CREATE VIEW project_manager_test_crew_detail_view AS
SELECT a.manager_id, a.full_name, a.office_location, b.test_crew_id AS crew_test_crew_id, b.crew_id AS crew_crew_id, b.crew_name AS crew_crew_name
FROM project_managers a
  JOIN managers_crews j ON j.manager_id = a.manager_id
  JOIN test_crews b ON b.test_crew_id = j.test_crew_id;
```

| manager_id | full_name | office_location | crew_test_crew_id | crew_crew_id | crew_crew_name |
|---|---|---|---|---|---|
| id_23 | Theodore Mcgrath | composite-office-99 | 1000 | state_et_7 | Distributed Review |
| id_23 | Theodore Mcgrath | composite-office-99 | 1001 | ChIJB4i7Dqpt5kcRfEnfwsHulbU | Adaptive Initiative D |
| 10449531 | Account Name | primary-office-100 | 1001 | ChIJB4i7Dqpt5kcRfEnfwsHulbU | Adaptive Initiative D |
| 10449531 | Account Name | primary-office-100 | 1002 | 4180964 | Primary Model |
| 659 | Saipan International Airport | adaptive-office-101 | 1002 | 4180964 | Primary Model |
| 659 | Saipan International Airport | adaptive-office-101 | 1003 | Cash | Composite Cluster |
| f208f470-8fcd-11eb-924d-9cd76263cbd0 | Norma Fisher | distributed-office-102 | 1003 | Cash | Composite Cluster |
| f208f470-8fcd-11eb-924d-9cd76263cbd0 | Norma Fisher | distributed-office-102 | 1000 | state_et_7 | Distributed Review |

**View `project_manager_emissions_test_program_view`**

```sql
CREATE VIEW project_manager_emissions_test_program_view AS
SELECT a.manager_id, a.full_name, a.office_location, a.certifications, b.id AS program_id, b.program_id AS program_program_id, b.program_name AS program_program_name
FROM project_managers a JOIN emissions_test_programs b ON a.emissions_test_program_id = b.id;
```

| manager_id | full_name | office_location | certifications | program_id | program_program_id | program_program_name |
|---|---|---|---|---|---|---|
| id_23 | Theodore Mcgrath | composite-office-99 | distributed-certific-78 | 1000 | 103176 | Extended Review |
| 10449531 | Account Name | primary-office-100 | baseline-certific-79 | 1001 | 2986219 | Pilot Initiative A |
| 659 | Saipan International Airport | adaptive-office-101 | pilot-certific-80 | 1002 | 1186079 | Baseline Model |
| f208f470-8fcd-11eb-924d-9cd76263cbd0 | Norma Fisher | distributed-office-102 | extended-certific-81 | 1003 | 1562855 | Distributed Cluster |

**View `emissions_test_program_emission_source_view`**

```sql
CREATE VIEW emissions_test_program_emission_source_view AS
SELECT a.id, a.program_id, a.program_name, a.start_date, b.emission_source_id AS source_emission_source_id, b.source_id AS source_source_id, b.source_type AS source_source_type
FROM emissions_test_programs a JOIN emission_sources b ON a.emission_source_id = b.emission_source_id;
```

| id | program_id | program_name | start_date | source_emission_source_id | source_source_id | source_source_type |
|---|---|---|---|---|---|---|
| 1000 | 103176 | Extended Review | 2022-09-05 | 100 | 3e9b5c70-8fcd-11eb-924d-9cd76263cbd0 | coal_fired_boiler |
| 1001 | 2986219 | Pilot Initiative A | 2023-02-16 | 101 | 7021001070050 | oil_fired_boiler |
| 1002 | 1186079 | Baseline Model | 2024-07-27 | 102 | achat | gas_turbine |
| 1003 | 1562855 | Distributed Cluster | 2025-12-11 | 103 | template_impcode_pagata_10det50 | foundry |

**View `emissions_test_program_emissions_monitoring_station_view`**

```sql
CREATE VIEW emissions_test_program_emissions_monitoring_station_view AS
SELECT a.id, a.program_id, a.program_name, a.start_date, b.id AS station_id, b.station_id AS station_station_id, b.installation_date AS station_installation_date
FROM emissions_test_programs a JOIN emissions_monitoring_stations b ON a.emissions_monitoring_station_id = b.id;
```

| id | program_id | program_name | start_date | station_id | station_station_id | station_installation_date |
|---|---|---|---|---|---|---|
| 1000 | 103176 | Extended Review | 2022-09-05 | 1 | strategic-networking | 2022-01-10 |
| 1001 | 2986219 | Pilot Initiative A | 2023-02-16 | 2 | 974947 | 2023-06-21 |
| 1002 | 1186079 | Baseline Model | 2024-07-27 | 3 | 374 | 2024-11-05 |
| 1003 | 1562855 | Distributed Cluster | 2025-12-11 | 4 | dce72594-8fcd-11eb-924d-9cd76263cbd0 | 2025-04-16 |

**View `emissions_test_program_test_crew_detail_view`**

```sql
CREATE VIEW emissions_test_program_test_crew_detail_view AS
SELECT a.id, a.program_id, a.program_name, b.test_crew_id AS crew_test_crew_id, b.crew_id AS crew_crew_id, b.crew_name AS crew_crew_name
FROM emissions_test_programs a
  JOIN programs_crews j ON j.emissions_test_program_id = a.id
  JOIN test_crews b ON b.test_crew_id = j.test_crew_id;
```

| id | program_id | program_name | crew_test_crew_id | crew_crew_id | crew_crew_name |
|---|---|---|---|---|---|
| 1000 | 103176 | Extended Review | 1000 | state_et_7 | Distributed Review |
| 1000 | 103176 | Extended Review | 1001 | ChIJB4i7Dqpt5kcRfEnfwsHulbU | Adaptive Initiative D |
| 1001 | 2986219 | Pilot Initiative A | 1001 | ChIJB4i7Dqpt5kcRfEnfwsHulbU | Adaptive Initiative D |
| 1001 | 2986219 | Pilot Initiative A | 1002 | 4180964 | Primary Model |
| 1002 | 1186079 | Baseline Model | 1002 | 4180964 | Primary Model |
| 1002 | 1186079 | Baseline Model | 1003 | Cash | Composite Cluster |
| 1003 | 1562855 | Distributed Cluster | 1003 | Cash | Composite Cluster |
| 1003 | 1562855 | Distributed Cluster | 1000 | state_et_7 | Distributed Review |

**View `regional_office_project_manager_view`**

```sql
CREATE VIEW regional_office_project_manager_view AS
SELECT a.id, a.office_id, a.office_name, a.city, b.manager_id AS manager_manager_id, b.full_name AS manager_full_name, b.office_location AS manager_office_location
FROM regional_offices a JOIN project_managers b ON a.manager_id = b.manager_id;
```

| id | office_id | office_name | city | manager_manager_id | manager_full_name | manager_office_location |
|---|---|---|---|---|---|---|
| 1 | 5917279 | Pilot Review | integrated-city-34 | id_23 | Theodore Mcgrath | composite-office-99 |
| 2 | 10445641 | Baseline Initiative | seasonal-city-35 | 10449531 | Account Name | primary-office-100 |
| 3 | 12715698 | Distributed Model A | regional-city-36 | 659 | Saipan International Airport | adaptive-office-101 |
| 4 | 3012823 | Adaptive Cluster | legacy-city-37 | f208f470-8fcd-11eb-924d-9cd76263cbd0 | Norma Fisher | distributed-office-102 |

**View `regional_office_test_crew_view`**

```sql
CREATE VIEW regional_office_test_crew_view AS
SELECT a.id, a.office_id, a.office_name, a.city, b.test_crew_id AS crew_test_crew_id, b.crew_id AS crew_crew_id, b.crew_name AS crew_crew_name
FROM regional_offices a JOIN test_crews b ON a.test_crew_id = b.test_crew_id;
```

| id | office_id | office_name | city | crew_test_crew_id | crew_crew_id | crew_crew_name |
|---|---|---|---|---|---|---|
| 1 | 5917279 | Pilot Review | integrated-city-34 | 1000 | state_et_7 | Distributed Review |
| 2 | 10445641 | Baseline Initiative | seasonal-city-35 | 1001 | ChIJB4i7Dqpt5kcRfEnfwsHulbU | Adaptive Initiative D |
| 3 | 12715698 | Distributed Model A | regional-city-36 | 1002 | 4180964 | Primary Model |
| 4 | 3012823 | Adaptive Cluster | legacy-city-37 | 1003 | Cash | Composite Cluster |
