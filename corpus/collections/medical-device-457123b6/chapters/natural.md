## Medical Device Cybersecurity in Clinical Environments

Healthcare organizations manage fleets of networked medical devices that span hospitals, outpatient clinics, home-care settings, and telehealth hubs. Each device carries a unique identifier, manufacturer designation, model number, and serial number, and operates on a specific firmware version. The security posture of these assets depends on their network connectivity, their deployment date, and their expected service life. Clinical engineering teams maintain these devices across multiple sites, applying cybersecurity programs that address known threats through risk scoring, network monitoring, and structured response actions. The records below capture the full lifecycle of this management process, from device registration through threat mitigation.

**Table `medical_devices`**

| device_identifier | manufacturer | model_number | serial_number | operating_system | firmware_version | is_network_capable | is_currently_connected | deployment_date | expected_service_life_years | cyber_risk_score_id | clinical_site_id | clinical_engineering_team_id | cyber_threat_id |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| DEV-2372 | Standard Chartered | MOD-2238 | 5844275 | distributed-operatin-66 | distributed-firmware-48 | false | false | 2023-02-14T13:51:00 | 37 | 1 | 100 | 100 | 100 |
| DEV-2378 | General Motors | MOD-2244 | 69422 | baseline-operatin-67 | baseline-firmware-49 | true | true | 2024-07-25T20:08:00 | 42 | 2 | 101 | 101 | 101 |
| DEV-2384 | Column Name cannot be empty | MOD-2250 | 7731874 | pilot-operatin-68 | pilot-firmware-50 | false | false | 2025-12-09T03:25:00 | 47 | 3 | 102 | 102 | 102 |
| DEV-2390 | Financial Information Service Co. Ltd. | MOD-2256 | 10445632 | extended-operatin-69 | extended-firmware-51 | true | true | 2022-05-20T10:42:00 | 52 | 4 | 103 | 103 | 103 |

The medical devices table anchors the entire inventory. Each row represents a single asset deployed in a clinical environment. The device identifier, such as DEV-2372 or DEV-2390, provides a stable reference for tracking. Manufacturer names range from Standard Chartered to General Motors to Financial Information Service Co. Ltd., reflecting the diverse vendor landscape. The operating system and firmware version columns record the software stack in use, with values like distributed-operatin-66 and baseline-firmware-49. The boolean flags is_network_capable and is_currently_connected distinguish devices that can communicate over a network from those that are isolated. Deployment dates span from early 2022 to late 2025, and expected service life ranges from 37 to 52 years, indicating the long operational horizon of clinical equipment.

**Table `cyber_risk_scores`**

| id | score_value | risk_level | assessment_date | scoring_methodology | is_prioritized_for_response | response_action | medical_device_model_number | cyber_threat_id | created_at |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 8.95 | low | 2022-05-10T04:24:00 | seasonal-scoring-83 | false | replace | MOD-2238 | 100 | 2025-01-01 00:14:00 |
| 2 | 11.90 | medium | 2023-10-21T11:41:00 | regional-scoring-84 | true | upgrade | MOD-2244 | 101 | 2025-02-06 03:14:00 |
| 3 | 14.85 | high | 2024-03-05T18:58:00 | legacy-scoring-85 | false | patch | MOD-2250 | 102 | 2025-03-11 06:14:00 |
| 4 | 17.80 | critical | 2025-08-16T01:15:00 | compact-scoring-86 | true | monitor | MOD-2256 | 103 | 2025-04-16 09:14:00 |

Cyber risk scores quantify the vulnerability of each device model to known threats. The score_value column presents a numeric assessment, ranging from 8.95 for low-risk devices to 17.80 for critical-risk devices. The risk_level column categorizes these scores into four tiers: low, medium, high, and critical. Assessment dates record when each evaluation was performed, and the scoring_methodology column identifies the approach used, such as seasonal-scoring-83 or compact-scoring-86. The is_prioritized_for_response flag indicates whether the organization has escalated the finding for immediate action. When prioritized, a response_action column specifies the recommended remediation step—replace, upgrade, patch, or monitor. Each score is linked to a specific medical device model number and a cyber threat identifier, creating a direct chain from threat identification to risk quantification.

**Table `cyber_threats`**

| id | threat_identifier | threat_type | target_operating_system | target_device_model | discovery_date | severity_level | is_exploited | mitigation_status | medical_device_model_number | network_monitoring_solution_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 100 | THR-2510 | ransomware | legacy-target-55 | primary-target-22 | 2024-03-23T14:18:00 | low | false | pending | MOD-2238 | 1 |
| 101 | THR-2516 | data_breach | compact-target-56 | adaptive-target-23 | 2025-08-07T21:35:00 | medium | true | in_progress | MOD-2244 | 2 |
| 102 | THR-2522 | denial_of_service | composite-target-57 | distributed-target-24 | 2022-01-18T04:52:00 | high | false | mitigated | MOD-2250 | 3 |
| 103 | THR-2528 | unauthorized_access | primary-target-58 | baseline-target-25 | 2023-06-02T11:09:00 | critical | true | not_applicable | MOD-2256 | 4 |

Cyber threats represent the adversarial forces that clinical organizations must defend against. The threat_identifier column, with entries like THR-2510 and THR-2528, provides a stable reference for each threat event. Threat types include ransomware, data_breach, denial_of_service, and unauthorized_access, covering the most common attack vectors in healthcare. The target_operating_system and target_device_model columns describe the software and hardware families under attack. Discovery dates record when each threat was first identified, ranging from January 2022 to August 2025. The severity_level column assigns a qualitative rating from low to critical, while the is_exploited flag indicates whether the threat has been actively weaponized. The mitigation_status column tracks the progress of defense efforts, with values such as pending, in_progress, mitigated, and not_applicable.

**Table `clinical_sites`**

| clinical_site_id | site_identifier | site_name | site_type | address | is_connected_to_network | total_devices_at_site | last_audit_date | clinical_engineering_team_id |
|---|---|---|---|---|---|---|---|---|
| 100 | SIT-2771 | Composite Review | hospital | distributed-address-72 | false | 10 | 2023-10-23 | 100 |
| 101 | SIT-2772 | Compact Initiative A | outpatient_clinic | baseline-address-73 | true | 15 | 2024-03-07 | 101 |
| 102 | SIT-2773 | Legacy Model | home_care | pilot-address-74 | false | 1 | 2025-08-18 | 102 |
| 103 | SIT-2774 | Regional Cluster | telehealth_hub | extended-address-75 | true | 5 | 2022-01-02 | 103 |

Clinical sites are the physical and virtual locations where medical devices operate. The site_identifier, such as SIT-2771 or SIT-2774, provides a unique reference for each location. Site names like Composite Review and Compact Initiative A distinguish individual facilities. Site types categorize the environment: hospital, outpatient_clinic, home_care, and telehealth_hub, each presenting distinct security considerations. The address column records the location, while is_connected_to_network indicates whether the site has active network infrastructure. The total_devices_at_site column quantifies the asset density, ranging from a single device in a home-care setting to fifteen devices in an outpatient clinic. Last audit dates track the most recent security review, and each site is assigned to a clinical engineering team for ongoing management.

**Table `clinical_engineering_teams`**

| clinical_engineering_team_id | team_identifier | team_name | has_c_i_o | has_c_i_s_o | responsibility_scope | is_formalized | cybersecurity_program_id |
|---|---|---|---|---|---|---|---|
| 100 | TEA-2539 | Composite Model | false | false | device_inventory | true | 1000 |
| 101 | TEA-2542 | Compact Cluster A | true | true | risk_scoring | false | 1001 |
| 102 | TEA-2545 | Legacy Review | false | false | network_monitoring | true | 1002 |
| 103 | TEA-2548 | Regional Initiative | true | true | patch_management | false | 1003 |

Clinical engineering teams provide the organizational structure for device lifecycle management. The team_identifier, such as TEA-2539 or TEA-2548, serves as a stable reference. Team names like Composite Model and Compact Cluster A identify individual groups. The has_c_i_o and has_c_i_s_o columns indicate whether the team includes a Chief Information Officer and a Chief Information Security Officer, respectively. Responsibility scope defines the team's primary function, with values including device_inventory, risk_scoring, network_monitoring, and patch_management. The is_formalized flag indicates whether the team operates under a documented charter. Each team is associated with a cybersecurity program, creating a direct link between organizational structure and security policy.

**Table `cybersecurity_programs`**

| id | program_identifier | program_name | is_formalized | has_risk_scoring_process | has_network_monitoring | has_device_inventory_management | has_defined_roles | implementation_date | clinical_engineering_team_id | cyber_threat_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1000 | PRO-2198 | Extended Review | true | false | true | true | true | 2024-11-14T10:06:00 | 100 | 100 |
| 1001 | PRO-2205 | Pilot Initiative A | false | true | false | false | false | 2025-04-25T17:23:00 | 101 | 101 |
| 1002 | PRO-2212 | Baseline Model | true | false | true | true | true | 2022-09-09T00:40:00 | 102 | 102 |
| 1003 | PRO-2219 | Distributed Cluster | false | true | false | false | false | 2023-02-20T07:57:00 | 103 | 103 |

Cybersecurity programs codify the policies and procedures that govern device protection. The program_identifier, such as PRO-2198 or PRO-2219, provides a unique reference. Program names like Extended Review and Pilot Initiative A distinguish individual initiatives. The is_formalized flag indicates whether the program is documented and enforced. The has_risk_scoring_process, has_network_monitoring, has_device_inventory_management, and has_defined_roles columns capture the specific capabilities embedded in each program. Implementation dates record when each program was launched, ranging from September 2022 to April 2025. Each program is assigned to a clinical engineering team and linked to a cyber threat, ensuring that security policies are tailored to the specific threats facing the organization.

**Table `network_monitoring_solutions`**

| id | solution_identifier | solution_name | is_real_time | monitors_device_inventory | detects_vulnerabilities | last_scan_date | alert_threshold | cyber_threat_id | clinical_site_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | SOL-2254 | Primary Review A | true | true | false | 2025-08-15T07:21:00 | 11.45 | 100 | 100 |
| 2 | SOL-2258 | Composite Initiative | false | false | true | 2022-01-26T14:38:00 | 14.90 | 101 | 101 |
| 3 | SOL-2262 | Compact Model | true | true | false | 2023-06-10T21:55:00 | 18.35 | 102 | 102 |
| 4 | SOL-2266 | Legacy Cluster D | false | false | true | 2024-11-21T04:12:00 | 21.80 | 103 | 103 |

Network monitoring solutions provide the technical infrastructure for detecting and responding to cyber threats. Each solution is associated with a specific cyber threat, as indicated by the network_monitoring_solution_id column in the cyber_threats table. These solutions enable continuous surveillance of device communications, allowing clinical engineering teams to identify anomalous behavior and trigger response actions. The monitoring data feeds directly into risk scoring assessments, creating a feedback loop between detection and quantification.

The relational structure of the dataset captures the many-to-many relationships between devices, sites, teams, programs, and monitoring solutions. The sites_devices table links clinical sites to the medical devices deployed at each location, enabling site-level asset inventories. The teams_devices table associates clinical engineering teams with the devices they manage, supporting accountability and workload distribution. The teams_sites table connects engineering teams to the sites they serve, clarifying organizational coverage. The programs_devices table ties cybersecurity programs to the devices they protect, ensuring policy coverage. The solutions_devices table links network monitoring solutions to the devices they observe, enabling targeted surveillance.

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

The views in this dataset synthesize the base tables into actionable reports. Each view answers a specific operational question by joining related records and presenting the results in a unified format.

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

This view joins medical devices with their associated cyber risk scores, providing a comprehensive risk profile for each asset. It answers the question: what is the current risk assessment for every device in the inventory? A row for DEV-2372 would show its manufacturer, model number, and the corresponding risk score of 8.95 with a low risk level, indicating that this device requires minimal immediate attention.

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

This view links medical devices to the clinical sites where they are deployed. It answers the question: which devices are located at each site? A row connecting DEV-2378 to SIT-2772 would show that this General Motors device is deployed at the Compact Initiative A outpatient clinic, which has fifteen total devices and is connected to the network.

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

This view associates medical devices with the clinical engineering teams responsible for their management. It answers the question: which team is accountable for each device? A row for DEV-2384 would show that the Legacy Review team (TEA-2545) manages this device, with responsibility scoped to network monitoring.

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

This view connects medical devices to the cyber threats targeting them. It answers the question: what threats are directed at each device? A row for DEV-2390 would show that this Financial Information Service Co. Ltd. device is targeted by threat THR-2528, an unauthorized_access threat with critical severity that has been actively exploited.

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

This view presents cyber risk scores with their associated medical device details, answering the question: which devices correspond to each risk assessment? A row showing score 17.80 with critical risk level would link to device DEV-2390, model MOD-2256, indicating that this device requires immediate monitoring as its response action.

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

This view joins cyber risk scores with the cyber threats that informed them, answering the question: which threats drove each risk assessment? A row for score 11.90 would link to threat THR-2516, a data_breach threat of medium severity that has been actively exploited, explaining why this score is prioritized for response.

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

This view connects cyber threats to the medical devices they target, answering the question: which devices are affected by each threat? A row for THR-2510 would show that this ransomware threat targets device DEV-2372, model MOD-2238, with a low severity level and pending mitigation status.

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

This view links cyber threats to the network monitoring solutions deployed against them, answering the question: which monitoring tools are assigned to each threat? A row for THR-2522 would show that this denial_of_service threat is monitored by solution ID 3, enabling the clinical engineering team to detect and respond to related attacks.

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

This view expands clinical site records with detailed device information, answering the question: what specific devices are deployed at each site? A row for SIT-2773 would show that the Legacy Model home-care site hosts a single device, DEV-2384, manufactured by Column Name cannot be empty, operating on pilot-operatin-68.

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

This view joins clinical sites with their assigned engineering teams, answering the question: which team manages each site? A row for SIT-2774 would show that the Regional Cluster telehealth hub is managed by the Regional Initiative team (TEA-2548), which has both a CIO and a CISO and focuses on patch management.

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

This view connects clinical engineering teams with the devices they manage, answering the question: what devices does each team oversee? A row for TEA-2539 would show that the Composite Model team manages device DEV-2372, with responsibility scoped to device inventory and a formalized charter.

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

This view links clinical engineering teams to the sites they serve, answering the question: which sites does each team cover? A row for TEA-2542 would show that the Compact Cluster A team serves site SIT-2772, the Compact Initiative A outpatient clinic, with fifteen devices and network connectivity enabled.

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

This view associates clinical engineering teams with their cybersecurity programs, answering the question: which program governs each team? A row for TEA-2545 would show that the Legacy Review team operates under program PRO-2212, the Baseline Model program, which is formalized and includes risk scoring, network monitoring, device inventory management, and defined roles.

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

This view presents cybersecurity programs with their assigned engineering teams, answering the question: which team implements each program? A row for PRO-2205 would show that the Pilot Initiative A program is implemented by the Compact Cluster A team (TEA-2542), which has both a CIO and a CISO but operates without a formalized charter.

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

This view connects cybersecurity programs to the medical devices they protect, answering the question: which devices are covered by each program? A row for PRO-2198 would show that the Extended Review program protects device DEV-2372, model MOD-2238, with a formalized program that includes network monitoring and device inventory management.

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

This view links cybersecurity programs to the cyber threats they address, answering the question: which threats does each program target? A row for PRO-2219 would show that the Distributed Cluster program addresses threat THR-2528, an unauthorized_access threat of critical severity that has been actively exploited.

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

This view connects network monitoring solutions to the medical devices they observe, answering the question: which devices are monitored by each solution? A row for solution ID 1 would show that it monitors device DEV-2372, model MOD-2238, providing visibility into the device's network activity.

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

This view links network monitoring solutions to the cyber threats they detect, answering the question: which threats is each solution designed to identify? A row for solution ID 2 would show that it monitors for threat THR-2516, a data_breach threat of medium severity that has been actively exploited.

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

This view connects network monitoring solutions to the clinical sites they protect, answering the question: which sites benefit from each monitoring solution? A row for solution ID 4 would show that it protects site SIT-2774, the Regional Cluster telehealth hub, which has five devices and is connected to the network.

The interplay between these tables and views creates a comprehensive framework for medical device cybersecurity management. Clinical engineering teams use risk scores to prioritize their response efforts, aligning their responsibilities with the severity of identified threats. Cybersecurity programs provide the policy foundation, while network monitoring solutions deliver the technical capability to detect and respond to attacks. Clinical sites serve as the operational context, with device inventories and network connectivity determining the scope of protection required. Together, these records enable healthcare organizations to maintain a defensible posture across their entire medical device fleet, from deployment through end-of-life.