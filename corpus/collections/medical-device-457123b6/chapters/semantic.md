In the clinical engineering domain, medical devices are not merely instruments of care but nodes in a cyber-physical network whose security posture must be continuously assessed, monitored, and governed. A hospital's fleet of infusion pumps, imaging systems, and patient monitors spans multiple clinical sites, is managed by engineering teams, is evaluated against evolving cyber threats, and is protected by formalized cybersecurity programs. The relational schema that captures this ecosystem normalizes every entity into its own table, binds them through foreign keys and junction tables, and then reassembles them through views that answer the operational questions clinicians and IT security officers actually ask.

## The Core Entity Tables

The schema centres on seven base tables that model the principal domain concepts. The first and most central is `medical_devices`, which records every piece of equipment deployed in the clinical environment.

**Table `medical_devices`**

| device_identifier | manufacturer | model_number | serial_number | operating_system | firmware_version | is_network_capable | is_currently_connected | deployment_date | expected_service_life_years | cyber_risk_score_id | clinical_site_id | clinical_engineering_team_id | cyber_threat_id |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| DEV-2372 | Standard Chartered | MOD-2238 | 5844275 | distributed-operatin-66 | distributed-firmware-48 | false | false | 2023-02-14T13:51:00 | 37 | 1 | 100 | 100 | 100 |
| DEV-2378 | General Motors | MOD-2244 | 69422 | baseline-operatin-67 | baseline-firmware-49 | true | true | 2024-07-25T20:08:00 | 42 | 2 | 101 | 101 | 101 |
| DEV-2384 | Column Name cannot be empty | MOD-2250 | 7731874 | pilot-operatin-68 | pilot-firmware-50 | false | false | 2025-12-09T03:25:00 | 47 | 3 | 102 | 102 | 102 |
| DEV-2390 | Financial Information Service Co. Ltd. | MOD-2256 | 10445632 | extended-operatin-69 | extended-firmware-51 | true | true | 2022-05-20T10:42:00 | 52 | 4 | 103 | 103 | 103 |

Each row represents a single device. The column `device_identifier` (for example, `DEV-2372`) serves as the primary key. Other columns capture manufacturer (`Standard Chartered`), model number (`MOD-2238`), serial number (`5844275`), operating system (`distributed-operatin-66`), and firmware version (`distributed-firmware-48`). Boolean flags `is_network_capable` and `is_currently_connected` distinguish devices that can reach a network from those that are actively connected. The `deployment_date` and `expected_service_life_years` columns (37 years for `DEV-2372`, 42 for `DEV-2378`) support lifecycle planning. Crucially, four foreign-key columns — `cyber_risk_score_id`, `clinical_site_id`, `clinical_engineering_team_id`, and `cyber_threat_id` — anchor each device to its risk assessment, its physical location, its managing team, and the threat landscape it faces.

The `cyber_risk_scores` table stores the outcome of each risk assessment.

**Table `cyber_risk_scores`**

| id | score_value | risk_level | assessment_date | scoring_methodology | is_prioritized_for_response | response_action | medical_device_model_number | cyber_threat_id | created_at |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 8.95 | low | 2022-05-10T04:24:00 | seasonal-scoring-83 | false | replace | MOD-2238 | 100 | 2025-01-01 00:14:00 |
| 2 | 11.90 | medium | 2023-10-21T11:41:00 | regional-scoring-84 | true | upgrade | MOD-2244 | 101 | 2025-02-06 03:14:00 |
| 3 | 14.85 | high | 2024-03-05T18:58:00 | legacy-scoring-85 | false | patch | MOD-2250 | 102 | 2025-03-11 06:14:00 |
| 4 | 17.80 | critical | 2025-08-16T01:15:00 | compact-scoring-86 | true | monitor | MOD-2256 | 103 | 2025-04-16 09:14:00 |

The primary key `id` (1, 2, 3, 4) identifies each score record. The `score_value` column holds a numeric assessment (8.95, 11.90, 14.85, 17.80), while `risk_level` classifies it as `low`, `medium`, `high`, or `critical`. The `assessment_date` records when the evaluation was performed, `scoring_methodology` names the approach used (`seasonal-scoring-83`, `regional-scoring-84`, `legacy-scoring-85`, `compact-scoring-86`), and `is_prioritized_for_response` indicates whether the finding demands immediate action. The `response_action` column prescribes a remediation step — `replace`, `upgrade`, `patch`, or `monitor`. The column `medical_device_model_number` links the score back to a specific device model, and `cyber_threat_id` connects the risk to a particular threat vector.

The `cyber_threats` table catalogues the threats themselves.

**Table `cyber_threats`**

| id | threat_identifier | threat_type | target_operating_system | target_device_model | discovery_date | severity_level | is_exploited | mitigation_status | medical_device_model_number | network_monitoring_solution_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 100 | THR-2510 | ransomware | legacy-target-55 | primary-target-22 | 2024-03-23T14:18:00 | low | false | pending | MOD-2238 | 1 |
| 101 | THR-2516 | data_breach | compact-target-56 | adaptive-target-23 | 2025-08-07T21:35:00 | medium | true | in_progress | MOD-2244 | 2 |
| 102 | THR-2522 | denial_of_service | composite-target-57 | distributed-target-24 | 2022-01-18T04:52:00 | high | false | mitigated | MOD-2250 | 3 |
| 103 | THR-2528 | unauthorized_access | primary-target-58 | baseline-target-25 | 2023-06-02T11:09:00 | critical | true | not_applicable | MOD-2256 | 4 |

Each threat has an `id` (100–103), a `threat_identifier` (`THR-2510`, `THR-2516`, `THR-2522`, `THR-2528`), and a `threat_type` such as `ransomware`, `data_breach`, `denial_of_service`, or `unauthorized_access`. The `target_operating_system` and `target_device_model` columns describe what the threat exploits. The `discovery_date`, `severity_level` (`low` through `critical`), `is_exploited` flag, and `mitigation_status` (`pending`, `in_progress`, `mitigated`, `not_applicable`) provide operational context. The `medical_device_model_number` and `network_monitoring_solution_id` columns link the threat to affected devices and to the monitoring solution tracking it.

The `clinical_sites` table records physical or virtual locations where devices are deployed.

**Table `clinical_sites`**

| clinical_site_id | site_identifier | site_name | site_type | address | is_connected_to_network | total_devices_at_site | last_audit_date | clinical_engineering_team_id |
|---|---|---|---|---|---|---|---|---|
| 100 | SIT-2771 | Composite Review | hospital | distributed-address-72 | false | 10 | 2023-10-23 | 100 |
| 101 | SIT-2772 | Compact Initiative A | outpatient_clinic | baseline-address-73 | true | 15 | 2024-03-07 | 101 |
| 102 | SIT-2773 | Legacy Model | home_care | pilot-address-74 | false | 1 | 2025-08-18 | 102 |
| 103 | SIT-2774 | Regional Cluster | telehealth_hub | extended-address-75 | true | 5 | 2022-01-02 | 103 |

The `clinical_site_id` (100–103) is the primary key. The `site_identifier` (`SIT-2771` through `SIT-2774`) and `site_name` (`Composite Review`, `Compact Initiative A`, `Legacy Model`, `Regional Cluster`) provide human-readable labels. The `site_type` distinguishes `hospital`, `outpatient_clinic`, `home_care`, and `telehealth_hub`. The `address`, `is_connected_to_network` flag, `total_devices_at_site` (ranging from 1 to 15), and `last_audit_date` support site-level governance. The `clinical_engineering_team_id` foreign key assigns each site to a managing team.

The `clinical_engineering_teams` table models the organizational units responsible for device management.

**Table `clinical_engineering_teams`**

| clinical_engineering_team_id | team_identifier | team_name | has_c_i_o | has_c_i_s_o | responsibility_scope | is_formalized | cybersecurity_program_id |
|---|---|---|---|---|---|---|---|
| 100 | TEA-2539 | Composite Model | false | false | device_inventory | true | 1000 |
| 101 | TEA-2542 | Compact Cluster A | true | true | risk_scoring | false | 1001 |
| 102 | TEA-2545 | Legacy Review | false | false | network_monitoring | true | 1002 |
| 103 | TEA-2548 | Regional Initiative | true | true | patch_management | false | 1003 |

Each team has a `clinical_engineering_team_id` (100–103), a `team_identifier` (`TEA-2539` through `TEA-2548`), and a `team_name` (`Composite Model`, `Compact Cluster A`, `Legacy Review`, `Regional Initiative`). Boolean columns `has_c_i_o` and `has_c_i_s_o` indicate whether the team includes a Chief Information Officer and a Chief Information Security Officer. The `responsibility_scope` column (`device_inventory`, `risk_scoring`, `network_monitoring`, `patch_management`) describes the team's functional mandate, while `is_formalized` indicates whether the team is an officially constituted unit. The `cybersecurity_program_id` foreign key ties the team to its governing program.

The `cybersecurity_programs` table captures the formal governance structures.

**Table `cybersecurity_programs`**

| id | program_identifier | program_name | is_formalized | has_risk_scoring_process | has_network_monitoring | has_device_inventory_management | has_defined_roles | implementation_date | clinical_engineering_team_id | cyber_threat_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1000 | PRO-2198 | Extended Review | true | false | true | true | true | 2024-11-14T10:06:00 | 100 | 100 |
| 1001 | PRO-2205 | Pilot Initiative A | false | true | false | false | false | 2025-04-25T17:23:00 | 101 | 101 |
| 1002 | PRO-2212 | Baseline Model | true | false | true | true | true | 2022-09-09T00:40:00 | 102 | 102 |
| 1003 | PRO-2219 | Distributed Cluster | false | true | false | false | false | 2023-02-20T07:57:00 | 103 | 103 |

Each program has an `id` (1000–1003), a `program_identifier` (`PRO-2198` through `PRO-2219`), and a `program_name` (`Extended Review`, `Pilot Initiative A`, `Baseline Model`, `Distributed Cluster`). Boolean flags `is_formalized`, `has_risk_scoring_process`, `has_network_monitoring`, `has_device_inventory_management`, and `has_defined_roles` describe the program's capabilities. The `implementation_date` records when the program went live. The `clinical_engineering_team_id` and `cyber_threat_id` foreign keys link the program to its responsible team and to the threat profile it addresses.

The `network_monitoring_solutions` table records the tools used to observe network activity.

**Table `network_monitoring_solutions`**

| id | solution_identifier | solution_name | is_real_time | monitors_device_inventory | detects_vulnerabilities | last_scan_date | alert_threshold | cyber_threat_id | clinical_site_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | SOL-2254 | Primary Review A | true | true | false | 2025-08-15T07:21:00 | 11.45 | 100 | 100 |
| 2 | SOL-2258 | Composite Initiative | false | false | true | 2022-01-26T14:38:00 | 14.90 | 101 | 101 |
| 3 | SOL-2262 | Compact Model | true | true | false | 2023-06-10T21:55:00 | 18.35 | 102 | 102 |
| 4 | SOL-2266 | Legacy Cluster D | false | false | true | 2024-11-21T04:12:00 | 21.80 | 103 | 103 |

Each solution has a `solution_id` (1–4), a `solution_identifier` (`MON-2801` through `MON-2804`), and a `solution_name` (`Extended Monitor`, `Pilot Tracker A`, `Baseline Watch`, `Distributed Sentinel`). The `vendor` column names the software provider, `is_active` indicates whether the solution is currently operational, and `deployment_date` records when it was installed.

## Junction Tables and Many-to-Many Relationships

Several base tables participate in many-to-many relationships that cannot be expressed through a single foreign key column. These relationships are modelled through five junction tables, each containing two foreign-key columns that reference the participating entities.

The `sites_devices` junction table links clinical sites to the medical devices deployed at them.

**Table `sites_devices`**

| clinical_site_id | medical_device_model_number |
|---|---|
| 100 | MOD-2238 |
| 100 | MOD-2244 |
| 101 | MOD-2244 |
| 101 | MOD-2250 |
| 102 | MOD-2250 |
| 102 | MOD-2256 |
| 103 | MOD-2256 |
| 103 | MOD-2238 |

Each row pairs a `clinical_site_id` with a `device_identifier`, establishing that a particular device resides at a particular site. This allows a single site to host many devices and a single device model to be deployed across multiple sites.

The `teams_devices` junction table links clinical engineering teams to the devices they manage.

**Table `teams_devices`**

| clinical_engineering_team_id | medical_device_model_number |
|---|---|
| 100 | MOD-2238 |
| 100 | MOD-2244 |
| 101 | MOD-2244 |
| 101 | MOD-2250 |
| 102 | MOD-2250 |
| 102 | MOD-2256 |
| 103 | MOD-2256 |
| 103 | MOD-2238 |

Each row pairs a `clinical_engineering_team_id` with a `device_identifier`, enabling a team to be responsible for many devices and a device to be managed by multiple teams (for example, a primary team and a specialist team).

The `teams_sites` junction table links clinical engineering teams to the sites they oversee.

**Table `teams_sites`**

| clinical_engineering_team_id | clinical_site_id |
|---|---|
| 100 | 100 |
| 100 | 101 |
| 101 | 101 |
| 101 | 102 |
| 102 | 102 |
| 102 | 103 |
| 103 | 103 |
| 103 | 100 |

Each row pairs a `clinical_engineering_team_id` with a `clinical_site_id`, allowing a team to manage multiple sites and a site to be supported by multiple teams.

The `programs_devices` junction table links cybersecurity programs to the medical devices they protect.

**Table `programs_devices`**

| cybersecurity_program_id | medical_device_model_number |
|---|---|
| 1000 | MOD-2238 |
| 1000 | MOD-2244 |
| 1001 | MOD-2244 |
| 1001 | MOD-2250 |
| 1002 | MOD-2250 |
| 1002 | MOD-2256 |
| 1003 | MOD-2256 |
| 1003 | MOD-2238 |

Each row pairs a `cybersecurity_program_id` with a `device_identifier`, enabling a program to cover many devices and a device to fall under multiple programs (for example, a general program and a specialty program).

The `solutions_devices` junction table links network monitoring solutions to the devices they monitor.

**Table `solutions_devices`**

| network_monitoring_solution_id | medical_device_model_number |
|---|---|
| 1 | MOD-2238 |
| 1 | MOD-2244 |
| 2 | MOD-2244 |
| 2 | MOD-2250 |
| 3 | MOD-2250 |
| 3 | MOD-2256 |
| 4 | MOD-2256 |
| 4 | MOD-2238 |

Each row pairs a `solution_id` with a `device_identifier`, allowing a monitoring solution to observe many devices and a device to be monitored by multiple solutions.

## Views: Reconstructing Domain Facts

The base tables and junction tables provide a fully normalized store. Views then join these tables to answer the specific questions that clinical engineers, IT security officers, and compliance auditors need answered on a daily basis. Each view is a named query that reassembles a domain fact from the normalized pieces.

The view `vw_medical_device_cyber_risk_score` joins `medical_devices` to `cyber_risk_scores` so that every device row is enriched with its risk assessment.

**View `vw_medical_device_cyber_risk_score`**

```sql
CREATE VIEW vw_medical_device_cyber_risk_score AS
SELECT a.device_identifier, a.manufacturer, a.model_number, a.serial_number, b.id AS score_id, b.score_value AS score_score_value, b.risk_level AS score_risk_level
FROM medical_devices a JOIN cyber_risk_scores b ON a.cyber_risk_score_id = b.id;
```

| device_identifier | manufacturer | model_number | serial_number | score_id | score_score_value | score_risk_level |
|---|---|---|---|---|---|---|
| DEV-2372 | Standard Chartered | MOD-2238 | 5844275 | 1 | 8.95 | low |
| DEV-2378 | General Motors | MOD-2244 | 69422 | 2 | 11.90 | medium |
| DEV-2384 | Column Name cannot be empty | MOD-2250 | 7731874 | 3 | 14.85 | high |
| DEV-2390 | Financial Information Service Co. Ltd. | MOD-2256 | 10445632 | 4 | 17.80 | critical |

Reading a concrete row from this view: device `DEV-2372` from manufacturer `Standard Chartered` carries a risk score of 8.95 at `low` severity, assessed on 2022-05-10 using `seasonal-scoring-83`, with a `replace` action prescribed. The view answers the question "What is the current risk posture of each medical device?"

The view `vw_medical_device_clinical_site` joins `medical_devices` to `clinical_sites` to show where each device is deployed.

**View `vw_medical_device_clinical_site`**

```sql
CREATE VIEW vw_medical_device_clinical_site AS
SELECT a.device_identifier, a.manufacturer, a.model_number, a.serial_number, b.clinical_site_id AS site_clinical_site_id, b.site_identifier AS site_site_identifier, b.site_name AS site_site_name
FROM medical_devices a JOIN clinical_sites b ON a.clinical_site_id = b.clinical_site_id;
```

| device_identifier | manufacturer | model_number | serial_number | site_clinical_site_id | site_site_identifier | site_site_name |
|---|---|---|---|---|---|---|
| DEV-2372 | Standard Chartered | MOD-2238 | 5844275 | 100 | SIT-2771 | Composite Review |
| DEV-2378 | General Motors | MOD-2244 | 69422 | 101 | SIT-2772 | Compact Initiative A |
| DEV-2384 | Column Name cannot be empty | MOD-2250 | 7731874 | 102 | SIT-2773 | Legacy Model |
| DEV-2390 | Financial Information Service Co. Ltd. | MOD-2256 | 10445632 | 103 | SIT-2774 | Regional Cluster |

A row from this view might show device `DEV-2372` located at site `SIT-2771` (`Composite Review`, a `hospital` type). This view answers "Where is each device physically or virtually located?"

The view `vw_medical_device_clinical_engineering_team` joins `medical_devices` to `clinical_engineering_teams` to reveal which team manages each device.

**View `vw_medical_device_clinical_engineering_team`**

```sql
CREATE VIEW vw_medical_device_clinical_engineering_team AS
SELECT a.device_identifier, a.manufacturer, a.model_number, a.serial_number, b.clinical_engineering_team_id AS team_clinical_engineering_team_id, b.team_identifier AS team_team_identifier, b.team_name AS team_team_name
FROM medical_devices a JOIN clinical_engineering_teams b ON a.clinical_engineering_team_id = b.clinical_engineering_team_id;
```

| device_identifier | manufacturer | model_number | serial_number | team_clinical_engineering_team_id | team_team_identifier | team_team_name |
|---|---|---|---|---|---|---|
| DEV-2372 | Standard Chartered | MOD-2238 | 5844275 | 100 | TEA-2539 | Composite Model |
| DEV-2378 | General Motors | MOD-2244 | 69422 | 101 | TEA-2542 | Compact Cluster A |
| DEV-2384 | Column Name cannot be empty | MOD-2250 | 7731874 | 102 | TEA-2545 | Legacy Review |
| DEV-2390 | Financial Information Service Co. Ltd. | MOD-2256 | 10445632 | 103 | TEA-2548 | Regional Initiative |

A row might show device `DEV-2372` managed by team `TEA-2539` (`Composite Model`), which has responsibility scope `device_inventory` and is a formalized unit. This view answers "Which team is accountable for each device?"

The view `vw_medical_device_cyber_threat` joins `medical_devices` to `cyber_threats` to surface which threats affect each device.

**View `vw_medical_device_cyber_threat`**

```sql
CREATE VIEW vw_medical_device_cyber_threat AS
SELECT a.device_identifier, a.manufacturer, a.model_number, a.serial_number, b.id AS threat_id, b.threat_identifier AS threat_threat_identifier, b.threat_type AS threat_threat_type
FROM medical_devices a JOIN cyber_threats b ON a.cyber_threat_id = b.id;
```

| device_identifier | manufacturer | model_number | serial_number | threat_id | threat_threat_identifier | threat_threat_type |
|---|---|---|---|---|---|---|
| DEV-2372 | Standard Chartered | MOD-2238 | 5844275 | 100 | THR-2510 | ransomware |
| DEV-2378 | General Motors | MOD-2244 | 69422 | 101 | THR-2516 | data_breach |
| DEV-2384 | Column Name cannot be empty | MOD-2250 | 7731874 | 102 | THR-2522 | denial_of_service |
| DEV-2390 | Financial Information Service Co. Ltd. | MOD-2256 | 10445632 | 103 | THR-2528 | unauthorized_access |

A row might show device `DEV-2372` facing threat `THR-2510` (`ransomware`), targeting operating system `legacy-target-55`, with `low` severity and `pending` mitigation status. This view answers "What cyber threats are relevant to each device?"

The view `vw_cyber_risk_score_medical_device` is the inverse of `vw_medical_device_cyber_risk_score`, starting from the risk score and joining to the device.

**View `vw_cyber_risk_score_medical_device`**

```sql
CREATE VIEW vw_cyber_risk_score_medical_device AS
SELECT a.id, a.score_value, a.risk_level, a.assessment_date, b.device_identifier AS device_device_identifier, b.manufacturer AS device_manufacturer, b.model_number AS device_model_number
FROM cyber_risk_scores a JOIN medical_devices b ON a.medical_device_model_number = b.model_number;
```

| id | score_value | risk_level | assessment_date | device_device_identifier | device_manufacturer | device_model_number |
|---|---|---|---|---|---|---|
| 1 | 8.95 | low | 2022-05-10T04:24:00 | DEV-2372 | Standard Chartered | MOD-2238 |
| 2 | 11.90 | medium | 2023-10-21T11:41:00 | DEV-2378 | General Motors | MOD-2244 |
| 3 | 14.85 | high | 2024-03-05T18:58:00 | DEV-2384 | Column Name cannot be empty | MOD-2250 |
| 4 | 17.80 | critical | 2025-08-16T01:15:00 | DEV-2390 | Financial Information Service Co. Ltd. | MOD-2256 |

A row might show risk score 8.95 (`low`) associated with device `DEV-2372` (`MOD-2238`). This view answers "Which devices correspond to each risk assessment?"

The view `vw_cyber_risk_score_cyber_threat` joins `cyber_risk_scores` to `cyber_threats` to correlate risk levels with threat types.

**View `vw_cyber_risk_score_cyber_threat`**

```sql
CREATE VIEW vw_cyber_risk_score_cyber_threat AS
SELECT a.id, a.score_value, a.risk_level, a.assessment_date, b.id AS threat_id, b.threat_identifier AS threat_threat_identifier, b.threat_type AS threat_threat_type
FROM cyber_risk_scores a JOIN cyber_threats b ON a.cyber_threat_id = b.id;
```

| id | score_value | risk_level | assessment_date | threat_id | threat_threat_identifier | threat_threat_type |
|---|---|---|---|---|---|---|
| 1 | 8.95 | low | 2022-05-10T04:24:00 | 100 | THR-2510 | ransomware |
| 2 | 11.90 | medium | 2023-10-21T11:41:00 | 101 | THR-2516 | data_breach |
| 3 | 14.85 | high | 2024-03-05T18:58:00 | 102 | THR-2522 | denial_of_service |
| 4 | 17.80 | critical | 2025-08-16T01:15:00 | 103 | THR-2528 | unauthorized_access |

A row might show risk score 8.95 (`low`) linked to threat `THR-2510` (`ransomware`). This view answers "What is the relationship between risk scores and the threats that drive them?"

The view `vw_cyber_threat_medical_device` is the inverse of `vw_medical_device_cyber_threat`, starting from the threat and joining to the device.

**View `vw_cyber_threat_medical_device`**

```sql
CREATE VIEW vw_cyber_threat_medical_device AS
SELECT a.id, a.threat_identifier, a.threat_type, a.target_operating_system, b.device_identifier AS device_device_identifier, b.manufacturer AS device_manufacturer, b.model_number AS device_model_number
FROM cyber_threats a JOIN medical_devices b ON a.medical_device_model_number = b.model_number;
```

| id | threat_identifier | threat_type | target_operating_system | device_device_identifier | device_manufacturer | device_model_number |
|---|---|---|---|---|---|---|
| 100 | THR-2510 | ransomware | legacy-target-55 | DEV-2372 | Standard Chartered | MOD-2238 |
| 101 | THR-2516 | data_breach | compact-target-56 | DEV-2378 | General Motors | MOD-2244 |
| 102 | THR-2522 | denial_of_service | composite-target-57 | DEV-2384 | Column Name cannot be empty | MOD-2250 |
| 103 | THR-2528 | unauthorized_access | primary-target-58 | DEV-2390 | Financial Information Service Co. Ltd. | MOD-2256 |

A row might show threat `THR-2510` (`ransomware`, `low` severity) affecting device `DEV-2372` (`MOD-2238`). This view answers "Which devices are affected by each threat?"

The view `vw_cyber_threat_network_monitoring_solution` joins `cyber_threats` to `network_monitoring_solutions` to show which monitoring solutions track which threats.

**View `vw_cyber_threat_network_monitoring_solution`**

```sql
CREATE VIEW vw_cyber_threat_network_monitoring_solution AS
SELECT a.id, a.threat_identifier, a.threat_type, a.target_operating_system, b.id AS solution_id, b.solution_identifier AS solution_solution_identifier, b.solution_name AS solution_solution_name
FROM cyber_threats a JOIN network_monitoring_solutions b ON a.network_monitoring_solution_id = b.id;
```

| id | threat_identifier | threat_type | target_operating_system | solution_id | solution_solution_identifier | solution_solution_name |
|---|---|---|---|---|---|---|
| 100 | THR-2510 | ransomware | legacy-target-55 | 1 | SOL-2254 | Primary Review A |
| 101 | THR-2516 | data_breach | compact-target-56 | 2 | SOL-2258 | Composite Initiative |
| 102 | THR-2522 | denial_of_service | composite-target-57 | 3 | SOL-2262 | Compact Model |
| 103 | THR-2528 | unauthorized_access | primary-target-58 | 4 | SOL-2266 | Legacy Cluster D |

A row might show threat `THR-2510` (`ransomware`) monitored by solution `MON-2801` (`Extended Monitor`). This view answers "Which monitoring solutions are tracking each threat?"

The view `vw_clinical_site_medical_device_detail` joins `clinical_sites` to `medical_devices` to provide a detailed inventory of devices at each site.

**View `vw_clinical_site_medical_device_detail`**

```sql
CREATE VIEW vw_clinical_site_medical_device_detail AS
SELECT a.clinical_site_id, a.site_identifier, a.site_name, b.device_identifier AS device_device_identifier, b.manufacturer AS device_manufacturer, b.model_number AS device_model_number
FROM clinical_sites a
  JOIN sites_devices j ON j.clinical_site_id = a.clinical_site_id
  JOIN medical_devices b ON b.model_number = j.medical_device_model_number;
```

| clinical_site_id | site_identifier | site_name | device_device_identifier | device_manufacturer | device_model_number |
|---|---|---|---|---|---|
| 100 | SIT-2771 | Composite Review | DEV-2372 | Standard Chartered | MOD-2238 |
| 100 | SIT-2771 | Composite Review | DEV-2378 | General Motors | MOD-2244 |
| 101 | SIT-2772 | Compact Initiative A | DEV-2378 | General Motors | MOD-2244 |
| 101 | SIT-2772 | Compact Initiative A | DEV-2384 | Column Name cannot be empty | MOD-2250 |
| 102 | SIT-2773 | Legacy Model | DEV-2384 | Column Name cannot be empty | MOD-2250 |
| 102 | SIT-2773 | Legacy Model | DEV-2390 | Financial Information Service Co. Ltd. | MOD-2256 |
| 103 | SIT-2774 | Regional Cluster | DEV-2390 | Financial Information Service Co. Ltd. | MOD-2256 |
| 103 | SIT-2774 | Regional Cluster | DEV-2372 | Standard Chartered | MOD-2238 |

A row might show site `SIT-2771` (`Composite Review`, `hospital`) hosting device `DEV-2372` (`MOD-2238`, `Standard Chartered`). This view answers "What devices are deployed at each clinical site?"

The view `vw_clinical_site_clinical_engineering_team` joins `clinical_sites` to `clinical_engineering_teams` to show which team manages each site.

**View `vw_clinical_site_clinical_engineering_team`**

```sql
CREATE VIEW vw_clinical_site_clinical_engineering_team AS
SELECT a.clinical_site_id, a.site_identifier, a.site_name, a.site_type, b.clinical_engineering_team_id AS team_clinical_engineering_team_id, b.team_identifier AS team_team_identifier, b.team_name AS team_team_name
FROM clinical_sites a JOIN clinical_engineering_teams b ON a.clinical_engineering_team_id = b.clinical_engineering_team_id;
```

| clinical_site_id | site_identifier | site_name | site_type | team_clinical_engineering_team_id | team_team_identifier | team_team_name |
|---|---|---|---|---|---|---|
| 100 | SIT-2771 | Composite Review | hospital | 100 | TEA-2539 | Composite Model |
| 101 | SIT-2772 | Compact Initiative A | outpatient_clinic | 101 | TEA-2542 | Compact Cluster A |
| 102 | SIT-2773 | Legacy Model | home_care | 102 | TEA-2545 | Legacy Review |
| 103 | SIT-2774 | Regional Cluster | telehealth_hub | 103 | TEA-2548 | Regional Initiative |

A row might show site `SIT-2771` (`Composite Review`) managed by team `TEA-2539` (`Composite Model`). This view answers "Which engineering team is responsible for each clinical site?"

The view `vw_clinical_engineering_team_medical_device_detail` joins `clinical_engineering_teams` to `medical_devices` to show which devices each team manages.

**View `vw_clinical_engineering_team_medical_device_detail`**

```sql
CREATE VIEW vw_clinical_engineering_team_medical_device_detail AS
SELECT a.clinical_engineering_team_id, a.team_identifier, a.team_name, b.device_identifier AS device_device_identifier, b.manufacturer AS device_manufacturer, b.model_number AS device_model_number
FROM clinical_engineering_teams a
  JOIN teams_devices j ON j.clinical_engineering_team_id = a.clinical_engineering_team_id
  JOIN medical_devices b ON b.model_number = j.medical_device_model_number;
```

| clinical_engineering_team_id | team_identifier | team_name | device_device_identifier | device_manufacturer | device_model_number |
|---|---|---|---|---|---|
| 100 | TEA-2539 | Composite Model | DEV-2372 | Standard Chartered | MOD-2238 |
| 100 | TEA-2539 | Composite Model | DEV-2378 | General Motors | MOD-2244 |
| 101 | TEA-2542 | Compact Cluster A | DEV-2378 | General Motors | MOD-2244 |
| 101 | TEA-2542 | Compact Cluster A | DEV-2384 | Column Name cannot be empty | MOD-2250 |
| 102 | TEA-2545 | Legacy Review | DEV-2384 | Column Name cannot be empty | MOD-2250 |
| 102 | TEA-2545 | Legacy Review | DEV-2390 | Financial Information Service Co. Ltd. | MOD-2256 |
| 103 | TEA-2548 | Regional Initiative | DEV-2390 | Financial Information Service Co. Ltd. | MOD-2256 |
| 103 | TEA-2548 | Regional Initiative | DEV-2372 | Standard Chartered | MOD-2238 |

A row might show team `TEA-2539` (`Composite Model`, scope `device_inventory`) managing device `DEV-2372` (`MOD-2238`). This view answers "Which medical devices are managed by each engineering team?"

The view `vw_clinical_engineering_team_clinical_site_detail` joins `clinical_engineering_teams` to `clinical_sites` to show which sites each team oversees.

**View `vw_clinical_engineering_team_clinical_site_detail`**

```sql
CREATE VIEW vw_clinical_engineering_team_clinical_site_detail AS
SELECT a.clinical_engineering_team_id, a.team_identifier, a.team_name, b.clinical_site_id AS site_clinical_site_id, b.site_identifier AS site_site_identifier, b.site_name AS site_site_name
FROM clinical_engineering_teams a
  JOIN teams_sites j ON j.clinical_engineering_team_id = a.clinical_engineering_team_id
  JOIN clinical_sites b ON b.clinical_site_id = j.clinical_site_id;
```

| clinical_engineering_team_id | team_identifier | team_name | site_clinical_site_id | site_site_identifier | site_site_name |
|---|---|---|---|---|---|
| 100 | TEA-2539 | Composite Model | 100 | SIT-2771 | Composite Review |
| 100 | TEA-2539 | Composite Model | 101 | SIT-2772 | Compact Initiative A |
| 101 | TEA-2542 | Compact Cluster A | 101 | SIT-2772 | Compact Initiative A |
| 101 | TEA-2542 | Compact Cluster A | 102 | SIT-2773 | Legacy Model |
| 102 | TEA-2545 | Legacy Review | 102 | SIT-2773 | Legacy Model |
| 102 | TEA-2545 | Legacy Review | 103 | SIT-2774 | Regional Cluster |
| 103 | TEA-2548 | Regional Initiative | 103 | SIT-2774 | Regional Cluster |
| 103 | TEA-2548 | Regional Initiative | 100 | SIT-2771 | Composite Review |

A row might show team `TEA-2539` (`Composite Model`) overseeing site `SIT-2771` (`Composite Review`, `hospital`). This view answers "Which clinical sites are overseen by each engineering team?"

The view `vw_clinical_engineering_team_cybersecurity_program` joins `clinical_engineering_teams` to `cybersecurity_programs` to reveal which program governs each team.

**View `vw_clinical_engineering_team_cybersecurity_program`**

```sql
CREATE VIEW vw_clinical_engineering_team_cybersecurity_program AS
SELECT a.clinical_engineering_team_id, a.team_identifier, a.team_name, a.has_c_i_o, b.id AS program_id, b.program_identifier AS program_program_identifier, b.program_name AS program_program_name
FROM clinical_engineering_teams a JOIN cybersecurity_programs b ON a.cybersecurity_program_id = b.id;
```

| clinical_engineering_team_id | team_identifier | team_name | has_c_i_o | program_id | program_program_identifier | program_program_name |
|---|---|---|---|---|---|---|
| 100 | TEA-2539 | Composite Model | false | 1000 | PRO-2198 | Extended Review |
| 101 | TEA-2542 | Compact Cluster A | true | 1001 | PRO-2205 | Pilot Initiative A |
| 102 | TEA-2545 | Legacy Review | false | 1002 | PRO-2212 | Baseline Model |
| 103 | TEA-2548 | Regional Initiative | true | 1003 | PRO-2219 | Distributed Cluster |

A row might show team `TEA-2539` (`Composite Model`) governed by program `PRO-2198` (`Extended Review`), which is formalized and includes network monitoring and device inventory management. This view answers "Which cybersecurity program governs each engineering team?"

The view `vw_cybersecurity_program_clinical_engineering_team` is the inverse, starting from the program and joining to the team.

**View `vw_cybersecurity_program_clinical_engineering_team`**

```sql
CREATE VIEW vw_cybersecurity_program_clinical_engineering_team AS
SELECT a.id, a.program_identifier, a.program_name, a.is_formalized, b.clinical_engineering_team_id AS team_clinical_engineering_team_id, b.team_identifier AS team_team_identifier, b.team_name AS team_team_name
FROM cybersecurity_programs a JOIN clinical_engineering_teams b ON a.clinical_engineering_team_id = b.clinical_engineering_team_id;
```

| id | program_identifier | program_name | is_formalized | team_clinical_engineering_team_id | team_team_identifier | team_team_name |
|---|---|---|---|---|---|---|
| 1000 | PRO-2198 | Extended Review | true | 100 | TEA-2539 | Composite Model |
| 1001 | PRO-2205 | Pilot Initiative A | false | 101 | TEA-2542 | Compact Cluster A |
| 1002 | PRO-2212 | Baseline Model | true | 102 | TEA-2545 | Legacy Review |
| 1003 | PRO-2219 | Distributed Cluster | false | 103 | TEA-2548 | Regional Initiative |

A row might show program `PRO-2198` (`Extended Review`) governing team `TEA-2539` (`Composite Model`). This view answers "Which engineering teams are governed by each cybersecurity program?"

The view `vw_cybersecurity_program_medical_device_detail` joins `cybersecurity_programs` to `medical_devices` to show which devices each program protects.

**View `vw_cybersecurity_program_medical_device_detail`**

```sql
CREATE VIEW vw_cybersecurity_program_medical_device_detail AS
SELECT a.id, a.program_identifier, a.program_name, b.device_identifier AS device_device_identifier, b.manufacturer AS device_manufacturer, b.model_number AS device_model_number
FROM cybersecurity_programs a
  JOIN programs_devices j ON j.cybersecurity_program_id = a.id
  JOIN medical_devices b ON b.model_number = j.medical_device_model_number;
```

| id | program_identifier | program_name | device_device_identifier | device_manufacturer | device_model_number |
|---|---|---|---|---|---|
| 1000 | PRO-2198 | Extended Review | DEV-2372 | Standard Chartered | MOD-2238 |
| 1000 | PRO-2198 | Extended Review | DEV-2378 | General Motors | MOD-2244 |
| 1001 | PRO-2205 | Pilot Initiative A | DEV-2378 | General Motors | MOD-2244 |
| 1001 | PRO-2205 | Pilot Initiative A | DEV-2384 | Column Name cannot be empty | MOD-2250 |
| 1002 | PRO-2212 | Baseline Model | DEV-2384 | Column Name cannot be empty | MOD-2250 |
| 1002 | PRO-2212 | Baseline Model | DEV-2390 | Financial Information Service Co. Ltd. | MOD-2256 |
| 1003 | PRO-2219 | Distributed Cluster | DEV-2390 | Financial Information Service Co. Ltd. | MOD-2256 |
| 1003 | PRO-2219 | Distributed Cluster | DEV-2372 | Standard Chartered | MOD-2238 |

A row might show program `PRO-2198` (`Extended Review`) protecting device `DEV-2372` (`MOD-2238`). This view answers "Which medical devices are covered by each cybersecurity program?"

The view `vw_cybersecurity_program_cyber_threat` joins `cybersecurity_programs` to `cyber_threats` to show which threats each program addresses.

**View `vw_cybersecurity_program_cyber_threat`**

```sql
CREATE VIEW vw_cybersecurity_program_cyber_threat AS
SELECT a.id, a.program_identifier, a.program_name, a.is_formalized, b.id AS threat_id, b.threat_identifier AS threat_threat_identifier, b.threat_type AS threat_threat_type
FROM cybersecurity_programs a JOIN cyber_threats b ON a.cyber_threat_id = b.id;
```

| id | program_identifier | program_name | is_formalized | threat_id | threat_threat_identifier | threat_threat_type |
|---|---|---|---|---|---|---|
| 1000 | PRO-2198 | Extended Review | true | 100 | THR-2510 | ransomware |
| 1001 | PRO-2205 | Pilot Initiative A | false | 101 | THR-2516 | data_breach |
| 1002 | PRO-2212 | Baseline Model | true | 102 | THR-2522 | denial_of_service |
| 1003 | PRO-2219 | Distributed Cluster | false | 103 | THR-2528 | unauthorized_access |

A row might show program `PRO-2198` (`Extended Review`) addressing threat `THR-2510` (`ransomware`). This view answers "Which cyber threats are addressed by each cybersecurity program?"

The view `vw_network_monitoring_solution_medical_device_detail` joins `network_monitoring_solutions` to `medical_devices` to show which devices each solution monitors.

**View `vw_network_monitoring_solution_medical_device_detail`**

```sql
CREATE VIEW vw_network_monitoring_solution_medical_device_detail AS
SELECT a.id, a.solution_identifier, a.solution_name, b.device_identifier AS device_device_identifier, b.manufacturer AS device_manufacturer, b.model_number AS device_model_number
FROM network_monitoring_solutions a
  JOIN solutions_devices j ON j.network_monitoring_solution_id = a.id
  JOIN medical_devices b ON b.model_number = j.medical_device_model_number;
```

| id | solution_identifier | solution_name | device_device_identifier | device_manufacturer | device_model_number |
|---|---|---|---|---|---|
| 1 | SOL-2254 | Primary Review A | DEV-2372 | Standard Chartered | MOD-2238 |
| 1 | SOL-2254 | Primary Review A | DEV-2378 | General Motors | MOD-2244 |
| 2 | SOL-2258 | Composite Initiative | DEV-2378 | General Motors | MOD-2244 |
| 2 | SOL-2258 | Composite Initiative | DEV-2384 | Column Name cannot be empty | MOD-2250 |
| 3 | SOL-2262 | Compact Model | DEV-2384 | Column Name cannot be empty | MOD-2250 |
| 3 | SOL-2262 | Compact Model | DEV-2390 | Financial Information Service Co. Ltd. | MOD-2256 |
| 4 | SOL-2266 | Legacy Cluster D | DEV-2390 | Financial Information Service Co. Ltd. | MOD-2256 |
| 4 | SOL-2266 | Legacy Cluster D | DEV-2372 | Standard Chartered | MOD-2238 |

A row might show solution `MON-2801` (`Extended Monitor`) monitoring device `DEV-2372` (`MOD-2238`). This view answers "Which medical devices are monitored by each network monitoring solution?"

The view `vw_network_monitoring_solution_cyber_threat` joins `network_monitoring_solutions` to `cyber_threats` to show which threats each solution tracks.

**View `vw_network_monitoring_solution_cyber_threat`**

```sql
CREATE VIEW vw_network_monitoring_solution_cyber_threat AS
SELECT a.id, a.solution_identifier, a.solution_name, a.is_real_time, b.id AS threat_id, b.threat_identifier AS threat_threat_identifier, b.threat_type AS threat_threat_type
FROM network_monitoring_solutions a JOIN cyber_threats b ON a.cyber_threat_id = b.id;
```

| id | solution_identifier | solution_name | is_real_time | threat_id | threat_threat_identifier | threat_threat_type |
|---|---|---|---|---|---|---|
| 1 | SOL-2254 | Primary Review A | true | 100 | THR-2510 | ransomware |
| 2 | SOL-2258 | Composite Initiative | false | 101 | THR-2516 | data_breach |
| 3 | SOL-2262 | Compact Model | true | 102 | THR-2522 | denial_of_service |
| 4 | SOL-2266 | Legacy Cluster D | false | 103 | THR-2528 | unauthorized_access |

A row might show solution `MON-2801` (`Extended Monitor`) tracking threat `THR-2510` (`ransomware`). This view answers "Which cyber threats are tracked by each network monitoring solution?"

The view `vw_network_monitoring_solution_clinical_site` joins `network_monitoring_solutions` to `clinical_sites` to show which sites each solution monitors.

**View `vw_network_monitoring_solution_clinical_site`**

```sql
CREATE VIEW vw_network_monitoring_solution_clinical_site AS
SELECT a.id, a.solution_identifier, a.solution_name, a.is_real_time, b.clinical_site_id AS site_clinical_site_id, b.site_identifier AS site_site_identifier, b.site_name AS site_site_name
FROM network_monitoring_solutions a JOIN clinical_sites b ON a.clinical_site_id = b.clinical_site_id;
```

| id | solution_identifier | solution_name | is_real_time | site_clinical_site_id | site_site_identifier | site_site_name |
|---|---|---|---|---|---|---|
| 1 | SOL-2254 | Primary Review A | true | 100 | SIT-2771 | Composite Review |
| 2 | SOL-2258 | Composite Initiative | false | 101 | SIT-2772 | Compact Initiative A |
| 3 | SOL-2262 | Compact Model | true | 102 | SIT-2773 | Legacy Model |
| 4 | SOL-2266 | Legacy Cluster D | false | 103 | SIT-2774 | Regional Cluster |

A row might show solution `MON-2801` (`Extended Monitor`) monitoring site `SIT-2771` (`Composite Review`). This view answers "Which clinical sites are monitored by each network monitoring solution?"

## Synthesis

The schema models clinical device cybersecurity as a network of interrelated entities. The `medical_devices` table sits at the centre, with foreign keys pointing to `cyber_risk_scores`, `clinical_sites`, `clinical_engineering_teams`, and `cyber_threats`. The `cyber_risk_scores` table links to `cyber_threats`, and `cyber_threats` links to `network_monitoring_solutions`. The `clinical_sites` table links to `clinical_engineering_teams`, and the `clinical_engineering_teams` table links to `cybersecurity_programs`. Five junction tables — `sites_devices`, `teams_devices`, `teams_sites`, `programs_devices`, and `solutions_devices` — handle the many-to-many relationships that a single foreign key cannot express. Nineteen views then reassemble these normalized tables into the specific joined results that operational roles need: device-centric views for engineers, risk-centric views for security analysts, site-centric views for facility managers, and program-centric views for compliance auditors. Every row in every view traces back to a concrete device identifier, a concrete risk score, a concrete threat, or a concrete site — grounding the abstract schema in the lived reality of clinical device management.