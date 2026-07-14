## Emissions Monitoring and Compliance Testing

Environmental compliance programs require rigorous coordination between monitoring infrastructure, emission sources, testing personnel, and administrative oversight. The records in this domain capture the full lifecycle of emissions monitoring—from the installation and calibration of monitoring stations at industrial facilities, through the scheduling and execution of compliance tests, to the organizational structures that manage and supervise these activities. Each facility hosts emission sources such as coal-fired boilers, gas turbines, and foundries, each equipped with dedicated monitoring hardware operated by certified test crews under the direction of project managers assigned to regional offices.

**Table `emissions_monitoring_stations`**

| id | station_id | installation_date | last_calibration_date | operational_status | manufacturer | model_number | emission_source_id | test_crew_id |
|---|---|---|---|---|---|---|---|---|
| 1 | strategic-networking | 2022-01-10 | 2025-12-01 | active | Standard Chartered | MOD-2238 | 100 | 1000 |
| 2 | 974947 | 2023-06-21 | 2022-05-12 | inactive | General Motors | MOD-2244 | 101 | 1001 |
| 3 | 374 | 2024-11-05 | 2023-10-23 | under_maintenance | Column Name cannot be empty | MOD-2250 | 102 | 1002 |
| 4 | dce72594-8fcd-11eb-924d-9cd76263cbd0 | 2025-04-16 | 2024-03-07 | active | Financial Information Service Co. Ltd. | MOD-2256 | 103 | 1003 |

Emissions monitoring stations form the physical backbone of the compliance program. Each station is uniquely identified by a station identifier and linked to a specific emission source via the `emission_source_id` column. The station labeled `strategic-networking` (record 1) was installed on 2022-01-10 by manufacturer Standard Chartered under model MOD-2238, and its last calibration occurred on 2025-12-01, placing it in active operational status. Station `974947` (record 2), a General Motors MOD-2244 unit, has been inactive since its 2023-06-21 installation, suggesting either decommissioning or a prolonged maintenance window. Station `374` (record 3) carries the unusual manufacturer designation "Column Name cannot be empty" and sits under maintenance as of its 2024-11-05 installation. The fourth station, identified by the UUID `dce72594-8fcd-11eb-924d-9cd76263cbd0`, is an active unit from Financial Information Service Co. Ltd. (model MOD-2256) installed in April 2025 with a calibration date of 2024-03-07. Every station carries a `test_crew_id` foreign key pointing to the crew responsible for its operation.

**Table `emission_sources`**

| emission_source_id | source_id | source_type | commissioning_date | operational_status | fuel_type | capacity_mw | emissions_monitoring_station_id | test_crew_id | created_at |
|---|---|---|---|---|---|---|---|---|---|
| 100 | 3e9b5c70-8fcd-11eb-924d-9cd76263cbd0 | coal_fired_boiler | 2025-12-03 | operational | coal | 18.70 | 1 | 1000 | 2025-01-01 00:14:00 |
| 101 | 7021001070050 | oil_fired_boiler | 2022-05-14 | decommissioned | oil | 20.40 | 2 | 1001 | 2025-02-06 03:14:00 |
| 102 | achat | gas_turbine | 2023-10-25 | standby | natural_gas | 22.10 | 3 | 1002 | 2025-03-11 06:14:00 |
| 103 | template_impcode_pagata_10det50 | foundry | 2024-03-09 | operational | waste | 23.80 | 4 | 1003 | 2025-04-16 09:14:00 |

Emission sources represent the industrial facilities or equipment units whose output is subject to regulatory scrutiny. The `emission_sources` table records each source's type, fuel, capacity, and operational state. Source 100, a coal-fired boiler with identifier `3e9b5c70-8fcd-11eb-924d-9cd76263cbd0`, operates at 18.70 MW capacity using coal as fuel and is currently operational. Source 101, an oil-fired boiler (`7021001070050`) rated at 20.40 MW, is marked decommissioned. Source 102 is a gas turbine (`achat`) running on natural gas at 22.10 MW, held in standby status. Source 103, a foundry identified as `template_impcode_pagata_10det50`, operates at 23.80 MW using waste fuel and remains operational. Each source is linked to its monitoring station through `emissions_monitoring_station_id` and to its assigned test crew through `test_crew_id`.

**Table `test_crews`**

| test_crew_id | crew_id | crew_name | supervisor_id | certification_level | active_since | manager_id | emission_source_id | emissions_monitoring_station_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|
| 1000 | state_et_7 | Distributed Review | account_pymes_255 | seasonal-certific-59 | 2023-10-11 | id_23 | 100 | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 1001 | ChIJB4i7Dqpt5kcRfEnfwsHulbU | Adaptive Initiative D | 328 | regional-certific-60 | 2024-03-22 | 10449531 | 101 | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 1002 | 4180964 | Primary Model | 1996938 | legacy-certific-61 | 2025-08-06 | 659 | 102 | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 1003 | Cash | Composite Cluster | ChIJIbRFlPtt5kcR5kM81XdpSfI | compact-certific-62 | 2022-01-17 | f208f470-8fcd-11eb-924d-9cd76263cbd0 | 103 | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Test crews are the operational units that perform emissions measurements. The `test_crews` table stores crew identifiers, names, certification levels, and supervisory relationships. Crew `state_et_7`, named "Distributed Review," holds a seasonal certification (level `seasonal-certific-59`) and has been active since 2023-10-11 under supervisor `account_pymes_255`. Crew `ChIJB4i7Dqpt5kcRfEnfwsHulbU`, labeled "Adaptive Initiative D," carries a regional certification (`regional-certific-60`) and began operations on 2024-03-22. Crew `4180964`, the "Primary Model," holds a legacy certification (`legacy-certific-61`) with an active-since date of 2025-08-06. Crew `Cash`, named "Composite Cluster," possesses a compact certification (`compact-certific-62`) and has been active since 2022-01-17. Each crew is assigned to a specific emission source and monitoring station, and each carries a `manager_id` linking to the project manager who oversees their work.

**Table `project_managers`**

| manager_id | full_name | office_location | certifications | years_of_experience | regional_office_id | emissions_test_program_id | created_at |
|---|---|---|---|---|---|---|---|
| id_23 | Theodore Mcgrath | composite-office-99 | distributed-certific-78 | 7 | 1 | 1000 | 2025-01-01 00:14:00 |
| 10449531 | Account Name | primary-office-100 | baseline-certific-79 | 10 | 2 | 1001 | 2025-02-06 03:14:00 |
| 659 | Saipan International Airport | adaptive-office-101 | pilot-certific-80 | 13 | 3 | 1002 | 2025-03-11 06:14:00 |
| f208f470-8fcd-11eb-924d-9cd76263cbd0 | Norma Fisher | distributed-office-102 | extended-certific-81 | 16 | 4 | 1003 | 2025-04-16 09:14:00 |

Project managers provide administrative oversight and are responsible for coordinating test programs across facilities. Manager `id_23`, Theodore Mcgrath, has seven years of experience and holds a distributed certification (`distributed-certific-78`), operating out of `composite-office-99`. Account Name (manager `10449531`) brings ten years of experience with a baseline certification (`baseline-certific-79`) from `primary-office-100`. Saipan International Airport (manager `659`) has thirteen years of experience and an adaptive certification (`adaptive-certific-80`) based at `adaptive-office-101`. Norma Fisher (manager `f208f470-8fcd-11eb-924d-9cd76263cbd0`) is the most experienced at sixteen years, holding an extended certification (`extended-certific-81`) from `distributed-office-102`. Each manager is assigned to a regional office and oversees specific emissions test programs.

**Table `emissions_test_programs`**

| id | program_id | program_name | start_date | end_date | test_type | status | emission_source_id | emissions_monitoring_station_id |
|---|---|---|---|---|---|---|---|---|
| 1000 | 103176 | Extended Review | 2022-09-05 | 2022-09-01 | relative_accuracy_test | planned | 100 | 1 |
| 1001 | 2986219 | Pilot Initiative A | 2023-02-16 | 2023-02-12 | performance_evaluation | ongoing | 101 | 2 |
| 1002 | 1186079 | Baseline Model | 2024-07-27 | 2024-07-23 | wet_chemistry_analysis | completed | 102 | 3 |
| 1003 | 1562855 | Distributed Cluster | 2025-12-11 | 2025-12-07 | relative_accuracy_test | failed | 103 | 4 |

Emissions test programs define the scheduled compliance activities. Program 1000, "Extended Review" (`103176`), is a relative accuracy test that was planned but has an end date (2022-09-01) preceding its start date (2022-09-05), suggesting a scheduling anomaly. Program 1001, "Pilot Initiative A" (`2986219`), is a performance evaluation currently in ongoing status, running from 2023-02-16 to 2023-02-12. Program 1002, "Baseline Model" (`1186079`), a wet chemistry analysis, is marked completed with dates spanning 2024-07-27 to 2024-07-23. Program 1003, "Distributed Cluster" (`1562855`), another relative accuracy test, has failed status and a start date of 2025-12-11. Each program is tied to a specific emission source and monitoring station.

**Table `regional_offices`**

| id | office_id | office_name | city | state | established_date | manager_id | test_crew_id |
|---|---|---|---|---|---|---|---|
| 1 | 5917279 | Pilot Review | integrated-city-34 | distributed-state-84 | 2024-03-27 | id_23 | 1000 |
| 2 | 10445641 | Baseline Initiative | seasonal-city-35 | baseline-state-85 | 2025-08-11 | 10449531 | 1001 |
| 3 | 12715698 | Distributed Model A | regional-city-36 | pilot-state-86 | 2022-01-22 | 659 | 1002 |
| 4 | 3012823 | Adaptive Cluster | legacy-city-37 | extended-state-87 | 2023-06-06 | f208f470-8fcd-11eb-924d-9cd76263cbd0 | 1003 |

Regional offices serve as the geographic and administrative anchors for the compliance program. Office `5917279`, named "Pilot Review," is located in `integrated-city-34` within `distributed-state-84` and was established on 2024-03-27. Office `10445641`, "Baseline Initiative," resides in `seasonal-city-35` (`baseline-state-85`) and was established in 2025-08-11. Office `12715698`, "Distributed Model A," is based in `regional-city-36` (`pilot-state-86`) since 2022-01-22. Office `3012823`, "Adaptive Cluster," operates from `legacy-city-37` (`extended-state-87`) since 2023-06-06. Each office is associated with a project manager and a test crew.

The operational relationships between these entities are captured through association tables that resolve many-to-many mappings. The `managers_crews` table links project managers to the test crews they supervise, enabling flexible assignment where a single manager may oversee multiple crews or a crew may report to multiple managers across different programs.

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

Similarly, the `programs_crews` table establishes the relationship between emissions test programs and the test crews assigned to execute them. This association table allows a single crew to participate in multiple programs and a single program to draw on multiple crews, reflecting the dynamic staffing requirements of compliance testing operations.

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

The joined views in this domain synthesize these relationships into actionable reports. The view `emissions_monitoring_station_emission_source_view` answers the question of which emission sources are monitored by which stations, combining the station's hardware details with the source's operational characteristics. For instance, the station `strategic-networking` is joined with emission source 100, the coal-fired boiler operating at 18.70 MW, providing a complete picture of the monitoring setup at that facility.

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

The view `emissions_monitoring_station_test_crew_view` links monitoring stations to their operating test crews, answering which crew is responsible for which station. Station `strategic-networking` (record 1) is associated with test crew `state_et_7` ("Distributed Review"), which holds a seasonal certification and has been active since October 2023. This view is essential for accountability, ensuring that each station has a designated crew with appropriate certification levels.

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

Conversely, the view `emission_source_emissions_monitoring_station_view` presents emission sources alongside their monitoring infrastructure, answering the question of what monitoring equipment serves each source. Source 100, the coal-fired boiler, is monitored by station 1 (`strategic-networking`), a Standard Chartered MOD-2238 unit. This perspective is useful for capacity planning and equipment lifecycle management.

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

The view `emission_source_test_crew_view` connects emission sources directly to their assigned test crews, answering which crew performs measurements at each source. Source 100 (coal-fired boiler) is served by test crew 1000 (`state_et_7`), while source 101 (decommissioned oil-fired boiler) is served by crew 1001 ("Adaptive Initiative D"). This view supports workload distribution analysis across crews.

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

The view `test_crew_project_manager_view` reveals the supervisory chain by linking test crews to their project managers. Crew `state_et_7` is supervised by manager `id_23` (Theodore Mcgrath), who has seven years of experience and operates from `composite-office-99`. Crew `Cash` ("Composite Cluster") reports to manager `f208f470-8fcd-11eb-924d-9cd76263cbd0` (Norma Fisher), the most experienced manager at sixteen years. This view clarifies the management hierarchy and is critical for organizational reporting.

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

The view `test_crew_emission_source_view` provides a crew-centric perspective on which emission sources each crew is responsible for testing. Crew 1000 (`state_et_7`) is assigned to source 100 (the operational coal-fired boiler), while crew 1003 (`Cash`) is assigned to source 103 (the operational foundry). This view supports crew workload balancing and certification compliance verification.

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

The view `test_crew_emissions_monitoring_station_view` links test crews to the monitoring stations they operate, answering which crew manages which hardware. Crew 1000 operates station 1 (`strategic-networking`), and crew 1003 operates station 4 (the UUID-identified station from Financial Information Service Co. Ltd.). This view is essential for maintenance scheduling and calibration tracking.

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

The view `project_manager_regional_office_view` maps project managers to their assigned regional offices, answering which manager operates from which geographic location. Theodore Mcgrath (`id_23`) is assigned to regional office 1 ("Pilot Review" in `integrated-city-34`), while Norma Fisher is assigned to office 4 ("Adaptive Cluster" in `legacy-city-37`). This view supports regional resource allocation and administrative oversight.

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

The view `project_manager_test_crew_detail_view` provides a detailed listing of test crews under each project manager, combining crew certification levels with manager experience data. Manager Theodore Mcgrath supervises crew `state_et_7` (seasonal certification), and manager Norma Fisher supervises crew `Cash` (compact certification). This view is valuable for assessing the certification distribution across management teams.

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

The view `project_manager_emissions_test_program_view` connects project managers to the emissions test programs they oversee, answering which manager is responsible for which program. Manager `id_23` (Theodore Mcgrath) oversees program 1000 ("Extended Review"), a relative accuracy test. Manager `10449531` (Account Name) oversees program 1001 ("Pilot Initiative A"), a performance evaluation currently in ongoing status. This view supports program accountability and progress tracking.

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

The view `emissions_test_program_emission_source_view` links test programs to the emission sources they evaluate, answering which program tests which source. Program 1000 ("Extended Review") targets source 100 (the coal-fired boiler), while program 1003 ("Distributed Cluster") targets source 103 (the foundry). This view is essential for understanding the scope and coverage of each test program.

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

The view `emissions_test_program_emissions_monitoring_station_view` connects test programs to the monitoring stations used during testing, answering which station supports which program. Program 1000 uses station 1 (`strategic-networking`), and program 1003 uses station 4 (the UUID-identified station). This view supports equipment utilization analysis and calibration scheduling.

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

The view `emissions_test_program_test_crew_detail_view` provides a comprehensive listing of test crews assigned to each emissions test program, combining program details with crew certification and assignment information. Program 1000 ("Extended Review") is associated with test crew 1000 (`state_et_7`), while program 1003 ("Distributed Cluster") is associated with crew 1003 (`Cash`). This view is critical for staffing verification and program execution planning.

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

The view `regional_office_project_manager_view` presents regional offices alongside their assigned project managers, answering which manager is responsible for which office. Office 1 ("Pilot Review") is managed by Theodore Mcgrath, and office 2 ("Baseline Initiative") is managed by Account Name. This view supports regional administrative reporting and resource planning.

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

The view `regional_office_test_crew_view` links regional offices to the test crews operating within their jurisdiction, answering which crews are assigned to which office. Office 1 ("Pilot Review") is associated with test crew 1000 (`state_et_7`), and office 4 ("Adaptive Cluster") is associated with crew 1003 (`Cash`). This view supports regional workload distribution and operational coordination.

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

The emissions monitoring domain integrates physical infrastructure, operational personnel, and administrative oversight into a coherent compliance framework. Monitoring stations provide the measurement capability, emission sources define what is being measured, test crews execute the measurements, and project managers coordinate the programs that govern the entire process. Regional offices anchor these activities geographically, while association tables enable the flexible staffing and program assignments that real-world compliance testing demands. The joined views synthesize these relationships into actionable reports, enabling managers to verify certification compliance, track program status, allocate resources across regions, and ensure that every emission source has appropriate monitoring and testing coverage.