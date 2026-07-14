## The Cybersecurity Operations Schema

The domain under consideration models the operational lifecycle of cybersecurity monitoring and response within an enterprise environment. At its core, the schema captures five interrelated entity types — cyber incidents, threat detection systems, security events, digital assets, and security platforms — along with automated responses that bridge events to remediation actions. A seventh junction entity, `platforms_systems`, resolves the many-to-many relationship between security platforms and threat detection systems. Together, these tables form a normalized relational model that preserves the full provenance of each security fact while enabling efficient reconstruction of domain-level narratives through a suite of materialized views.

The foundation of the model is the `cyber_incidents` table, which records each security incident as a discrete row. Its primary key `id` is an auto-incrementing surrogate, while the business identifier `incident_id` carries values such as `1336174`, `state_uk_4`, and `2933483`. Temporal context is provided by `timestamp`, which stores the moment of incident detection in ISO 8601 format (e.g., `2024-07-08T18:18:00`). The `severity_level` column holds integer scores — `29`, `40`, `51`, `62` — that quantify the seriousness of each incident. The `dwell_time` column, measured in hours, records how long the threat persisted undetected, with values ranging from `9.20` to `15.80`. The `status` column is a categorical field with values `detected`, `investigating`, `contained`, and `neutralized`, reflecting the current lifecycle stage. A boolean `false_positive_flag` indicates whether the incident was later determined to be benign. The table also carries two foreign keys: `threat_detection_system_id` references the system that first flagged the incident, and `asset_id` points to the digital asset that was targeted. The `created_at` column records when the incident row was inserted into the system.

**Table `cyber_incidents`**

| id | incident_id | timestamp | severity_level | dwell_time | status | false_positive_flag | threat_detection_system_id | asset_id | created_at |
|---|---|---|---|---|---|---|---|---|---|
| 100 | 1336174 | 2024-07-08T18:18:00 | 29 | 9.20 | detected | false | 1000 | 7731874 | 2025-01-01 00:14:00 |
| 101 | state_uk_4 | 2025-12-19T01:35:00 | 40 | 11.40 | investigating | true | 1001 | 6564392 | 2025-02-06 03:14:00 |
| 102 | 2933483 | 2022-05-03T08:52:00 | 51 | 13.60 | contained | false | 1002 | 5917296 | 2025-03-11 06:14:00 |
| 103 | 2986243 | 2023-10-14T15:09:00 | 62 | 15.80 | neutralized | true | 1003 | 990e161e10664c5885182d95dc07e606 | 2025-04-16 09:14:00 |

The `threat_detection_systems` table models the monitoring infrastructure itself. Each row represents a distinct detection system identified by a surrogate `id` and a business `system_id` (e.g., `8189503`, `3717623`, `7441161`). The `system_name` column carries human-readable labels such as `Legacy Programme D`, `Regional Standard`, and `Integrated Protocol A`. The `deployment_type` column is an enumerated attribute with values `cloud`, `endpoint`, `network`, and `application`, indicating the scope of the system's monitoring reach. The `monitoring_status` column holds the operational state — `active`, `inactive`, or `maintenance` — while `last_scan_date` records the most recent scan performed. The `ai_enabled` boolean signals whether the system employs machine learning for threat detection. Three foreign keys anchor this table to the rest of the schema: `asset_id` references the digital asset under surveillance, `security_event_id` links to the event that triggered the system's most recent detection, and `security_platform_id` identifies the platform that hosts or manages the system.

**Table `threat_detection_systems`**

| id | system_id | system_name | deployment_type | monitoring_status | last_scan_date | ai_enabled | asset_id | security_event_id | security_platform_id |
|---|---|---|---|---|---|---|---|---|---|
| 1000 | 8189503 | Legacy Programme D | cloud | active | 2025-08-15 | false | 7731874 | 1 | 1 |
| 1001 | 3717623 | Regional Standard | endpoint | inactive | 2022-01-26 | true | 6564392 | 2 | 2 |
| 1002 | 7441161 | Seasonal Framework | network | maintenance | 2023-06-10 | false | 5917296 | 3 | 3 |
| 1003 | 605963 | Integrated Protocol A | application | active | 2024-11-21 | true | 990e161e10664c5885182d95dc07e606 | 4 | 4 |

Security events form the operational heartbeat of the model. The `security_events` table stores each discrete event with a surrogate `id` and a business `event_id` that can be numeric (`2002007020060`), short (`168535`), or UUID-formatted (`ab8e1d18-8fcd-11eb-924d-9cd76263cbd0`). The `event_type` column is categorical, with values including `phishing`, `malware`, `unauthorized_access`, and `policy_violation`. Network-level provenance is captured by `source_ip` and `destination_ip`, which carry hostnames such as `baseline-source-37` and `legacy-destinat-79`. The `timestamp` column records when the event occurred. The `correlation_score` column holds a floating-point value (e.g., `21.95`, `25.90`, `29.85`, `33.80`) that quantifies the confidence that the event is part of a broader attack pattern. Two foreign keys link events to their context: `threat_detection_system_id` identifies the system that observed the event, and `cyber_incident_id` associates the event with the incident it contributed to. A third foreign key, `automated_response_id`, points to any automated remediation action that was triggered.

**Table `security_events`**

| id | event_id | event_type | source_ip | destination_ip | timestamp | correlation_score | threat_detection_system_id | cyber_incident_id | automated_response_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 2002007020060 | phishing | baseline-source-37 | legacy-destinat-79 | 2024-07-08T18:18:00 | 21.95 | 1000 | 100 | 1 |
| 2 | 168535 | malware | pilot-source-38 | compact-destinat-80 | 2025-12-19T01:35:00 | 25.90 | 1001 | 101 | 2 |
| 3 | ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 | unauthorized_access | extended-source-39 | composite-destinat-81 | 2022-05-03T08:52:00 | 29.85 | 1002 | 102 | 3 |
| 4 | 1186089 | policy_violation | integrated-source-40 | primary-destinat-82 | 2023-10-14T15:09:00 | 33.80 | 1003 | 103 | 4 |

The `digital_assets` table catalogs the computing resources under security management. Its primary key `asset_id` serves as both a surrogate and a business identifier, carrying values such as `7731874`, `6564392`, and `990e161e10664c5885182d95dc07e606`. The `asset_name` column provides human-readable labels like `Pilot Programme`, `Baseline Standard`, and `Adaptive Protocol`. The `asset_type` column is an enumerated attribute with values `server`, `database`, `endpoint`, and `application`. The `os_type` column records the operating system — `windows`, `linux`, `macos`, or `unknown`. The `criticality_level` column holds an integer score (`26`, `37`, `48`, `59`) that reflects the asset's importance to the organization. The `last_compliance_check` column stores the date of the most recent compliance audit. Two foreign keys link assets to the security infrastructure: `security_platform_id` identifies the platform responsible for the asset's protection, and `security_event_id` references the most recent event that affected the asset.

**Table `digital_assets`**

| asset_id | asset_name | asset_type | os_type | criticality_level | last_compliance_check | security_platform_id | security_event_id |
|---|---|---|---|---|---|---|---|
| 7731874 | Pilot Programme | server | windows | 26 | 2025-12-03 | 1 | 1 |
| 6564392 | Baseline Standard | database | linux | 37 | 2022-05-14 | 2 | 2 |
| 5917296 | Distributed Framework A | endpoint | macos | 48 | 2023-10-25 | 3 | 3 |
| 990e161e10664c5885182d95dc07e606 | Adaptive Protocol | application | unknown | 59 | 2024-03-09 | 4 | 4 |

Security platforms represent the overarching security operations infrastructure. The `security_platforms` table uses a surrogate `id` and a business `platform_id` (e.g., `state_uk_28`, `e6ce01fe-8fc3-11eb-924d-9cd76263cbd0`) as identifiers. The `platform_name` column carries labels such as `Baseline Initiative D`, `Distributed Model`, and `Primary Review A`. The `version` column stores version strings like `seasonal-version-71` and `regional-version-72`. The `deployment_date` column records when the platform was deployed. The `compliance_framework` column is an enumerated attribute with values `NIST_2.0`, `ISO_27001`, and `SOC2`. The `is_open_xdr` boolean indicates whether the platform supports open Extended Detection and Response standards. A single foreign key, `automated_response_id`, links the platform to the automated response it orchestrates.

**Table `security_platforms`**

| id | platform_id | platform_name | version | deployment_date | compliance_framework | is_open_xdr | automated_response_id |
|---|---|---|---|---|---|---|---|
| 1 | state_uk_28 | Baseline Initiative D | seasonal-version-71 | 2023-02-14 | NIST_2.0 | true | 1 |
| 2 | e6ce01fe-8fc3-11eb-924d-9cd76263cbd0 | Distributed Model | regional-version-72 | 2024-07-25 | ISO_27001 | false | 2 |
| 3 | 4716417 | Adaptive Cluster | legacy-version-73 | 2025-12-09 | SOC2 | true | 3 |
| 4 | 10966228 | Primary Review A | compact-version-74 | 2022-05-20 | NIST_2.0 | false | 4 |

Automated responses capture the remediation actions triggered by security events. The table's primary key is `automated_response_id`, and the `response_id` column carries business identifiers such as `ChIJr7cItPtt5kcRM6ry7ecIYgw`, `9736917`, and `Invoice`. The `response_type` column is categorical, with values including `block_ip`, `quarantine_endpoint`, `alert_analyst`, and `patch_vulnerability`. The `execution_time` column records when the response was executed. The `success_status` boolean indicates whether the response action succeeded. The `trigger_event_id` column stores the event that initiated the response, which may be a named constant like `default_chart_a_tax_code_23` or a UUID. Three foreign keys anchor the response to its context: `security_event_id` identifies the event that triggered the response, `asset_id` references the asset that was the target of the response, and `security_platform_id` identifies the platform that executed the response. The `created_at` column records when the response record was inserted.

**Table `automated_responses`**

| automated_response_id | response_id | response_type | execution_time | success_status | trigger_event_id | security_event_id | asset_id | security_platform_id | created_at |
|---|---|---|---|---|---|---|---|---|---|
| 1 | ChIJr7cItPtt5kcRM6ry7ecIYgw | block_ip | 2024-11-13T10:54:00 | false | default_chart_a_tax_code_23 | 1 | 7731874 | 1 | 2025-01-01 00:14:00 |
| 2 | 9736917 | quarantine_endpoint | 2025-04-24T17:11:00 | true | 8189481 | 2 | 6564392 | 2 | 2025-02-06 03:14:00 |
| 3 | 8189493 | alert_analyst | 2022-09-08T00:28:00 | false | a556311c-8fb2-11eb-924d-9cd76263cbd0 | 3 | 5917296 | 3 | 2025-03-11 06:14:00 |
| 4 | Invoice | patch_vulnerability | 2023-02-19T07:45:00 | true | 778560 | 4 | 990e161e10664c5885182d95dc07e606 | 4 | 2025-04-16 09:14:00 |

The `platforms_systems` table serves as a junction entity that resolves the many-to-many relationship between security platforms and threat detection systems. In a normalized schema, this table would contain pairs of foreign keys — one referencing `security_platforms` and the other referencing `threat_detection_systems` — enabling any platform to manage multiple detection systems and any detection system to be managed by multiple platforms. This design avoids the redundancy of embedding platform identifiers directly into the `threat_detection_systems` table and allows for flexible reassignment of systems across platforms as the security architecture evolves.

**Table `platforms_systems`**

| security_platform_id | threat_detection_system_id |
|---|---|
| 1 | 1000 |
| 1 | 1001 |
| 2 | 1001 |
| 2 | 1002 |
| 3 | 1002 |
| 3 | 1003 |
| 4 | 1003 |
| 4 | 1000 |

With the base tables defined, the schema provides a suite of materialized views that reconstruct domain-level facts by joining the normalized tables. Each view answers a specific analytical question by assembling the relevant columns from two or more base tables.

The view `vw_cyber_incident_threat_detection_system` joins `cyber_incidents` to `threat_detection_systems` on `cyber_incidents.threat_detection_system_id = threat_detection_systems.id`, producing a consolidated record that pairs each incident with the detection system that flagged it. For example, incident `1336174` with severity `29` is linked to the detection system `Legacy Programme D` (system_id `8189503`), which was deployed in the `cloud` and was `active` at the time.

**View `vw_cyber_incident_threat_detection_system`**

```sql
CREATE VIEW vw_cyber_incident_threat_detection_system AS
SELECT a.id, a.incident_id, a.timestamp, a.severity_level, b.id AS system_id, b.system_id AS system_system_id, b.system_name AS system_system_name
FROM cyber_incidents a JOIN threat_detection_systems b ON a.threat_detection_system_id = b.id;
```

| id | incident_id | timestamp | severity_level | system_id | system_system_id | system_system_name |
|---|---|---|---|---|---|---|
| 100 | 1336174 | 2024-07-08T18:18:00 | 29 | 1000 | 8189503 | Legacy Programme D |
| 101 | state_uk_4 | 2025-12-19T01:35:00 | 40 | 1001 | 3717623 | Regional Standard |
| 102 | 2933483 | 2022-05-03T08:52:00 | 51 | 1002 | 7441161 | Seasonal Framework |
| 103 | 2986243 | 2023-10-14T15:09:00 | 62 | 1003 | 605963 | Integrated Protocol A |

The view `vw_cyber_incident_digital_asset` joins `cyber_incidents` to `digital_assets` on `cyber_incidents.asset_id = digital_assets.asset_id`, answering the question of which asset was targeted by each incident. Incident `state_uk_4` (severity `40`, status `investigating`) is associated with the asset `Baseline Standard` (asset_id `6564392`), a `database` running `linux` with a criticality level of `37`.

**View `vw_cyber_incident_digital_asset`**

```sql
CREATE VIEW vw_cyber_incident_digital_asset AS
SELECT a.id, a.incident_id, a.timestamp, a.severity_level, b.asset_id AS asset_asset_id, b.asset_name AS asset_asset_name, b.asset_type AS asset_asset_type
FROM cyber_incidents a JOIN digital_assets b ON a.asset_id = b.asset_id;
```

| id | incident_id | timestamp | severity_level | asset_asset_id | asset_asset_name | asset_asset_type |
|---|---|---|---|---|---|---|
| 100 | 1336174 | 2024-07-08T18:18:00 | 29 | 7731874 | Pilot Programme | server |
| 101 | state_uk_4 | 2025-12-19T01:35:00 | 40 | 6564392 | Baseline Standard | database |
| 102 | 2933483 | 2022-05-03T08:52:00 | 51 | 5917296 | Distributed Framework A | endpoint |
| 103 | 2986243 | 2023-10-14T15:09:00 | 62 | 990e161e10664c5885182d95dc07e606 | Adaptive Protocol | application |

The view `vw_threat_detection_system_digital_asset` joins `threat_detection_systems` to `digital_assets` on `threat_detection_systems.asset_id = digital_assets.asset_id`, revealing which assets are under the surveillance of each detection system. The detection system `Regional Standard` (system_id `3717623`) monitors the asset `Baseline Standard` (asset_id `6564392`), a `database` with criticality level `37`.

**View `vw_threat_detection_system_digital_asset`**

```sql
CREATE VIEW vw_threat_detection_system_digital_asset AS
SELECT a.id, a.system_id, a.system_name, a.deployment_type, b.asset_id AS asset_asset_id, b.asset_name AS asset_asset_name, b.asset_type AS asset_asset_type
FROM threat_detection_systems a JOIN digital_assets b ON a.asset_id = b.asset_id;
```

| id | system_id | system_name | deployment_type | asset_asset_id | asset_asset_name | asset_asset_type |
|---|---|---|---|---|---|---|
| 1000 | 8189503 | Legacy Programme D | cloud | 7731874 | Pilot Programme | server |
| 1001 | 3717623 | Regional Standard | endpoint | 6564392 | Baseline Standard | database |
| 1002 | 7441161 | Seasonal Framework | network | 5917296 | Distributed Framework A | endpoint |
| 1003 | 605963 | Integrated Protocol A | application | 990e161e10664c5885182d95dc07e606 | Adaptive Protocol | application |

The view `vw_threat_detection_system_security_event` joins `threat_detection_systems` to `security_events` on `threat_detection_systems.id = security_events.threat_detection_system_id`, connecting each detection system to the events it observed. The system `Legacy Programme D` (id `1000`) generated the phishing event `2002007020060` with a correlation score of `21.95`.

**View `vw_threat_detection_system_security_event`**

```sql
CREATE VIEW vw_threat_detection_system_security_event AS
SELECT a.id, a.system_id, a.system_name, a.deployment_type, b.id AS event_id, b.event_id AS event_event_id, b.event_type AS event_event_type
FROM threat_detection_systems a JOIN security_events b ON a.security_event_id = b.id;
```

| id | system_id | system_name | deployment_type | event_id | event_event_id | event_event_type |
|---|---|---|---|---|---|---|
| 1000 | 8189503 | Legacy Programme D | cloud | 1 | 2002007020060 | phishing |
| 1001 | 3717623 | Regional Standard | endpoint | 2 | 168535 | malware |
| 1002 | 7441161 | Seasonal Framework | network | 3 | ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 | unauthorized_access |
| 1003 | 605963 | Integrated Protocol A | application | 4 | 1186089 | policy_violation |

The view `vw_threat_detection_system_security_platform` joins `threat_detection_systems` to `security_platforms` on `threat_detection_systems.security_platform_id = security_platforms.id`, showing which platform manages each detection system. The system `Integrated Protocol A` (id `1003`) is managed by the platform `Primary Review A` (platform_id `10966228`), which operates under the `NIST_2.0` compliance framework.

**View `vw_threat_detection_system_security_platform`**

```sql
CREATE VIEW vw_threat_detection_system_security_platform AS
SELECT a.id, a.system_id, a.system_name, a.deployment_type, b.id AS platform_id, b.platform_id AS platform_platform_id, b.platform_name AS platform_platform_name
FROM threat_detection_systems a JOIN security_platforms b ON a.security_platform_id = b.id;
```

| id | system_id | system_name | deployment_type | platform_id | platform_platform_id | platform_platform_name |
|---|---|---|---|---|---|---|
| 1000 | 8189503 | Legacy Programme D | cloud | 1 | state_uk_28 | Baseline Initiative D |
| 1001 | 3717623 | Regional Standard | endpoint | 2 | e6ce01fe-8fc3-11eb-924d-9cd76263cbd0 | Distributed Model |
| 1002 | 7441161 | Seasonal Framework | network | 3 | 4716417 | Adaptive Cluster |
| 1003 | 605963 | Integrated Protocol A | application | 4 | 10966228 | Primary Review A |

The view `vw_security_event_threat_detection_system` performs the inverse join of `security_events` to `threat_detection_systems`, answering the question of which detection system observed each event. The malware event `168535` was observed by the detection system `Regional Standard` (id `1001`), which was in `inactive` status at the time.

**View `vw_security_event_threat_detection_system`**

```sql
CREATE VIEW vw_security_event_threat_detection_system AS
SELECT a.id, a.event_id, a.event_type, a.source_ip, b.id AS system_id, b.system_id AS system_system_id, b.system_name AS system_system_name
FROM security_events a JOIN threat_detection_systems b ON a.threat_detection_system_id = b.id;
```

| id | event_id | event_type | source_ip | system_id | system_system_id | system_system_name |
|---|---|---|---|---|---|---|
| 1 | 2002007020060 | phishing | baseline-source-37 | 1000 | 8189503 | Legacy Programme D |
| 2 | 168535 | malware | pilot-source-38 | 1001 | 3717623 | Regional Standard |
| 3 | ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 | unauthorized_access | extended-source-39 | 1002 | 7441161 | Seasonal Framework |
| 4 | 1186089 | policy_violation | integrated-source-40 | 1003 | 605963 | Integrated Protocol A |

The view `vw_security_event_cyber_incident` joins `security_events` to `cyber_incidents` on `security_events.cyber_incident_id = cyber_incidents.id`, linking each event to the incident it contributed to. The unauthorized access event `ab8e1d18-8fcd-11eb-924d-9cd76263cbd0` is associated with incident `2933483`, which had a severity level of `51` and a dwell time of `13.60` hours.

**View `vw_security_event_cyber_incident`**

```sql
CREATE VIEW vw_security_event_cyber_incident AS
SELECT a.id, a.event_id, a.event_type, a.source_ip, b.id AS incident_id, b.incident_id AS incident_incident_id, b.timestamp AS incident_timestamp
FROM security_events a JOIN cyber_incidents b ON a.cyber_incident_id = b.id;
```

| id | event_id | event_type | source_ip | incident_id | incident_incident_id | incident_timestamp |
|---|---|---|---|---|---|---|
| 1 | 2002007020060 | phishing | baseline-source-37 | 100 | 1336174 | 2024-07-08T18:18:00 |
| 2 | 168535 | malware | pilot-source-38 | 101 | state_uk_4 | 2025-12-19T01:35:00 |
| 3 | ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 | unauthorized_access | extended-source-39 | 102 | 2933483 | 2022-05-03T08:52:00 |
| 4 | 1186089 | policy_violation | integrated-source-40 | 103 | 2986243 | 2023-10-14T15:09:00 |

The view `vw_security_event_automated_response` joins `security_events` to `automated_responses` on `security_events.automated_response_id = automated_responses.automated_response_id`, connecting each event to the remediation action it triggered. The phishing event `2002007020060` triggered the response `ChIJr7cItPtt5kcRM6ry7ecIYgw`, which was of type `block_ip` and had a `success_status` of `false`.

**View `vw_security_event_automated_response`**

```sql
CREATE VIEW vw_security_event_automated_response AS
SELECT a.id, a.event_id, a.event_type, a.source_ip, b.automated_response_id AS response_automated_response_id, b.response_id AS response_response_id, b.response_type AS response_response_type
FROM security_events a JOIN automated_responses b ON a.automated_response_id = b.automated_response_id;
```

| id | event_id | event_type | source_ip | response_automated_response_id | response_response_id | response_response_type |
|---|---|---|---|---|---|---|
| 1 | 2002007020060 | phishing | baseline-source-37 | 1 | ChIJr7cItPtt5kcRM6ry7ecIYgw | block_ip |
| 2 | 168535 | malware | pilot-source-38 | 2 | 9736917 | quarantine_endpoint |
| 3 | ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 | unauthorized_access | extended-source-39 | 3 | 8189493 | alert_analyst |
| 4 | 1186089 | policy_violation | integrated-source-40 | 4 | Invoice | patch_vulnerability |

The view `vw_digital_asset_security_platform` joins `digital_assets` to `security_platforms` on `digital_assets.security_platform_id = security_platforms.id`, revealing which platform protects each asset. The asset `Pilot Programme` (asset_id `7731874`) is protected by the platform `Baseline Initiative D` (platform_id `state_uk_28`), which is an open XDR platform operating under `NIST_2.0`.

**View `vw_digital_asset_security_platform`**

```sql
CREATE VIEW vw_digital_asset_security_platform AS
SELECT a.asset_id, a.asset_name, a.asset_type, a.os_type, b.id AS platform_id, b.platform_id AS platform_platform_id, b.platform_name AS platform_platform_name
FROM digital_assets a JOIN security_platforms b ON a.security_platform_id = b.id;
```

| asset_id | asset_name | asset_type | os_type | platform_id | platform_platform_id | platform_platform_name |
|---|---|---|---|---|---|---|
| 7731874 | Pilot Programme | server | windows | 1 | state_uk_28 | Baseline Initiative D |
| 6564392 | Baseline Standard | database | linux | 2 | e6ce01fe-8fc3-11eb-924d-9cd76263cbd0 | Distributed Model |
| 5917296 | Distributed Framework A | endpoint | macos | 3 | 4716417 | Adaptive Cluster |
| 990e161e10664c5885182d95dc07e606 | Adaptive Protocol | application | unknown | 4 | 10966228 | Primary Review A |

The view `vw_digital_asset_security_event` joins `digital_assets` to `security_events` on `digital_assets.security_event_id = security_events.id`, showing which event most recently affected each asset. The asset `Adaptive Protocol` (asset_id `990e161e10664c5885182d95dc07e606`) was affected by the policy violation event `1186089` with a correlation score of `33.80`.

**View `vw_digital_asset_security_event`**

```sql
CREATE VIEW vw_digital_asset_security_event AS
SELECT a.asset_id, a.asset_name, a.asset_type, a.os_type, b.id AS event_id, b.event_id AS event_event_id, b.event_type AS event_event_type
FROM digital_assets a JOIN security_events b ON a.security_event_id = b.id;
```

| asset_id | asset_name | asset_type | os_type | event_id | event_event_id | event_event_type |
|---|---|---|---|---|---|---|
| 7731874 | Pilot Programme | server | windows | 1 | 2002007020060 | phishing |
| 6564392 | Baseline Standard | database | linux | 2 | 168535 | malware |
| 5917296 | Distributed Framework A | endpoint | macos | 3 | ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 | unauthorized_access |
| 990e161e10664c5885182d95dc07e606 | Adaptive Protocol | application | unknown | 4 | 1186089 | policy_violation |

The view `vw_security_platform_threat_detection_system_detail` joins `security_platforms` to `threat_detection_systems` on `security_platforms.id = threat_detection_systems.security_platform_id`, providing a detailed view of which detection systems are managed by each platform. The platform `Adaptive Cluster` (platform_id `4716417`) manages the detection system `Seasonal Framework` (id `1002`), which monitors the `network` deployment type and is currently in `maintenance` status.

**View `vw_security_platform_threat_detection_system_detail`**

```sql
CREATE VIEW vw_security_platform_threat_detection_system_detail AS
SELECT a.id, a.platform_id, a.platform_name, b.id AS system_id, b.system_id AS system_system_id, b.system_name AS system_system_name
FROM security_platforms a
  JOIN platforms_systems j ON j.security_platform_id = a.id
  JOIN threat_detection_systems b ON b.id = j.threat_detection_system_id;
```

| id | platform_id | platform_name | system_id | system_system_id | system_system_name |
|---|---|---|---|---|---|
| 1 | state_uk_28 | Baseline Initiative D | 1000 | 8189503 | Legacy Programme D |
| 1 | state_uk_28 | Baseline Initiative D | 1001 | 3717623 | Regional Standard |
| 2 | e6ce01fe-8fc3-11eb-924d-9cd76263cbd0 | Distributed Model | 1001 | 3717623 | Regional Standard |
| 2 | e6ce01fe-8fc3-11eb-924d-9cd76263cbd0 | Distributed Model | 1002 | 7441161 | Seasonal Framework |
| 3 | 4716417 | Adaptive Cluster | 1002 | 7441161 | Seasonal Framework |
| 3 | 4716417 | Adaptive Cluster | 1003 | 605963 | Integrated Protocol A |
| 4 | 10966228 | Primary Review A | 1003 | 605963 | Integrated Protocol A |
| 4 | 10966228 | Primary Review A | 1000 | 8189503 | Legacy Programme D |

The view `vw_security_platform_automated_response` joins `security_platforms` to `automated_responses` on `security_platforms.automated_response_id = automated_responses.automated_response_id`, linking each platform to the automated responses it orchestrates. The platform `Distributed Model` (platform_id `e6ce01fe-8fc3-11eb-924d-9cd76263cbd0`) orchestrates the response `9736917`, which is of type `quarantine_endpoint` and executed successfully.

**View `vw_security_platform_automated_response`**

```sql
CREATE VIEW vw_security_platform_automated_response AS
SELECT a.id, a.platform_id, a.platform_name, a.version, b.automated_response_id AS response_automated_response_id, b.response_id AS response_response_id, b.response_type AS response_response_type
FROM security_platforms a JOIN automated_responses b ON a.automated_response_id = b.automated_response_id;
```

| id | platform_id | platform_name | version | response_automated_response_id | response_response_id | response_response_type |
|---|---|---|---|---|---|---|
| 1 | state_uk_28 | Baseline Initiative D | seasonal-version-71 | 1 | ChIJr7cItPtt5kcRM6ry7ecIYgw | block_ip |
| 2 | e6ce01fe-8fc3-11eb-924d-9cd76263cbd0 | Distributed Model | regional-version-72 | 2 | 9736917 | quarantine_endpoint |
| 3 | 4716417 | Adaptive Cluster | legacy-version-73 | 3 | 8189493 | alert_analyst |
| 4 | 10966228 | Primary Review A | compact-version-74 | 4 | Invoice | patch_vulnerability |

The view `vw_automated_response_security_event` joins `automated_responses` to `security_events` on `automated_responses.security_event_id = security_events.id`, providing the inverse perspective of which event triggered each response. The response `8189493` (type `alert_analyst`) was triggered by the unauthorized access event `ab8e1d18-8fcd-11eb-924d-9cd76263cbd0` with a correlation score of `29.85`.

**View `vw_automated_response_security_event`**

```sql
CREATE VIEW vw_automated_response_security_event AS
SELECT a.automated_response_id, a.response_id, a.response_type, a.execution_time, b.id AS event_id, b.event_id AS event_event_id, b.event_type AS event_event_type
FROM automated_responses a JOIN security_events b ON a.security_event_id = b.id;
```

| automated_response_id | response_id | response_type | execution_time | event_id | event_event_id | event_event_type |
|---|---|---|---|---|---|---|
| 1 | ChIJr7cItPtt5kcRM6ry7ecIYgw | block_ip | 2024-11-13T10:54:00 | 1 | 2002007020060 | phishing |
| 2 | 9736917 | quarantine_endpoint | 2025-04-24T17:11:00 | 2 | 168535 | malware |
| 3 | 8189493 | alert_analyst | 2022-09-08T00:28:00 | 3 | ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 | unauthorized_access |
| 4 | Invoice | patch_vulnerability | 2023-02-19T07:45:00 | 4 | 1186089 | policy_violation |

The view `vw_automated_response_digital_asset` joins `automated_responses` to `digital_assets` on `automated_responses.asset_id = digital_assets.asset_id`, showing which asset was the target of each automated response. The response `Invoice` (type `patch_vulnerability`) targeted the asset `Adaptive Protocol` (asset_id `990e161e10664c5885182d95dc07e606`), an `application` running on an `unknown` operating system with a criticality level of `59`.

**View `vw_automated_response_digital_asset`**

```sql
CREATE VIEW vw_automated_response_digital_asset AS
SELECT a.automated_response_id, a.response_id, a.response_type, a.execution_time, b.asset_id AS asset_asset_id, b.asset_name AS asset_asset_name, b.asset_type AS asset_asset_type
FROM automated_responses a JOIN digital_assets b ON a.asset_id = b.asset_id;
```

| automated_response_id | response_id | response_type | execution_time | asset_asset_id | asset_asset_name | asset_asset_type |
|---|---|---|---|---|---|---|
| 1 | ChIJr7cItPtt5kcRM6ry7ecIYgw | block_ip | 2024-11-13T10:54:00 | 7731874 | Pilot Programme | server |
| 2 | 9736917 | quarantine_endpoint | 2025-04-24T17:11:00 | 6564392 | Baseline Standard | database |
| 3 | 8189493 | alert_analyst | 2022-09-08T00:28:00 | 5917296 | Distributed Framework A | endpoint |
| 4 | Invoice | patch_vulnerability | 2023-02-19T07:45:00 | 990e161e10664c5885182d95dc07e606 | Adaptive Protocol | application |

The view `vw_automated_response_security_platform` joins `automated_responses` to `security_platforms` on `automated_responses.security_platform_id = security_platforms.id`, linking each automated response to the platform that executed it. The response `ChIJr7cItPtt5kcRM6ry7ecIYgw` (type `block_ip`) was executed by the platform `Baseline Initiative D` (platform_id `state_uk_28`), which operates under the `NIST_2.0` compliance framework.

**View `vw_automated_response_security_platform`**

```sql
CREATE VIEW vw_automated_response_security_platform AS
SELECT a.automated_response_id, a.response_id, a.response_type, a.execution_time, b.id AS platform_id, b.platform_id AS platform_platform_id, b.platform_name AS platform_platform_name
FROM automated_responses a JOIN security_platforms b ON a.security_platform_id = b.id;
```

| automated_response_id | response_id | response_type | execution_time | platform_id | platform_platform_id | platform_platform_name |
|---|---|---|---|---|---|---|
| 1 | ChIJr7cItPtt5kcRM6ry7ecIYgw | block_ip | 2024-11-13T10:54:00 | 1 | state_uk_28 | Baseline Initiative D |
| 2 | 9736917 | quarantine_endpoint | 2025-04-24T17:11:00 | 2 | e6ce01fe-8fc3-11eb-924d-9cd76263cbd0 | Distributed Model |
| 3 | 8189493 | alert_analyst | 2022-09-08T00:28:00 | 3 | 4716417 | Adaptive Cluster |
| 4 | Invoice | patch_vulnerability | 2023-02-19T07:45:00 | 4 | 10966228 | Primary Review A |

The schema as a whole embodies a carefully normalized design that separates concerns across seven base tables while providing fifteen materialized views that reconstruct the domain's natural join patterns. The foreign key relationships form a directed graph: cyber incidents point to both the detection system that flagged them and the asset they targeted; detection systems point to the assets they monitor, the events they generate, and the platforms that manage them; security events point to the detection systems that observed them, the incidents they contributed to, and the automated responses they triggered; digital assets point to the platforms that protect them and the events that affected them; security platforms point to the automated responses they orchestrate; and automated responses point back to the events, assets, and platforms involved in their execution. The junction table `platforms_systems` adds an additional layer of flexibility by decoupling the platform-system relationship from a single foreign key. This design ensures that each fact is stored exactly once, eliminating update anomalies while the views provide convenient access to the multi-table joins that domain analysts naturally reason about. The result is a schema that is both rigorously normalized for data integrity and richly connected through its views for analytical clarity.