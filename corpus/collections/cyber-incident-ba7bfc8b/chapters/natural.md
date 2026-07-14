## Cybersecurity Operations: Incident Lifecycle and Response Orchestration

Modern security operations centers manage a continuous flow of threats, detections, and automated countermeasures across distributed infrastructure. At the heart of this ecosystem lies a structured lifecycle: a cyber incident is identified, correlated with security events, traced to the digital assets under threat, and resolved through coordinated responses orchestrated by security platforms. The records captured at each stage form an interconnected web of operational intelligence, where every detection system, asset, and response action is tied to a common timeline. Understanding how these records relate to one another is essential for practitioners who must reconstruct attack narratives, evaluate detection efficacy, and optimize automated response playbooks.

**Table `cyber_incidents`**

| id | incident_id | timestamp | severity_level | dwell_time | status | false_positive_flag | threat_detection_system_id | asset_id | created_at |
|---|---|---|---|---|---|---|---|---|---|
| 100 | 1336174 | 2024-07-08T18:18:00 | 29 | 9.20 | detected | false | 1000 | 7731874 | 2025-01-01 00:14:00 |
| 101 | state_uk_4 | 2025-12-19T01:35:00 | 40 | 11.40 | investigating | true | 1001 | 6564392 | 2025-02-06 03:14:00 |
| 102 | 2933483 | 2022-05-03T08:52:00 | 51 | 13.60 | contained | false | 1002 | 5917296 | 2025-03-11 06:14:00 |
| 103 | 2986243 | 2023-10-14T15:09:00 | 62 | 15.80 | neutralized | true | 1003 | 990e161e10664c5885182d95dc07e606 | 2025-04-16 09:14:00 |

The cyber incidents table captures the primary events that trigger the entire response lifecycle. Each record represents a confirmed or suspected security breach, identified by a unique incident identifier and timestamped to the minute. Severity levels range from 29 to 62 across the observed records, with the highest-severity incident (2986243) exhibiting a dwell time of 15.80 hours — the duration between initial compromise and detection. The status field tracks the operational state of each incident, progressing through stages such as detected, investigating, contained, and neutralized. Notably, the false_positive_flag column distinguishes confirmed threats from benign anomalies; incident 1336174 was confirmed as a genuine threat, while state_uk_4 and 2986243 were later determined to be false positives. Each incident is linked to a specific threat detection system and a digital asset, anchoring the event to both the detection infrastructure and the target under attack.

**Table `threat_detection_systems`**

| id | system_id | system_name | deployment_type | monitoring_status | last_scan_date | ai_enabled | asset_id | security_event_id | security_platform_id |
|---|---|---|---|---|---|---|---|---|---|
| 1000 | 8189503 | Legacy Programme D | cloud | active | 2025-08-15 | false | 7731874 | 1 | 1 |
| 1001 | 3717623 | Regional Standard | endpoint | inactive | 2022-01-26 | true | 6564392 | 2 | 2 |
| 1002 | 7441161 | Seasonal Framework | network | maintenance | 2023-06-10 | false | 5917296 | 3 | 3 |
| 1003 | 605963 | Integrated Protocol A | application | active | 2024-11-21 | true | 990e161e10664c5885182d95dc07e606 | 4 | 4 |

Threat detection systems serve as the sensors and analytical engines that identify malicious activity. These systems span multiple deployment types — cloud, endpoint, network, and application — each monitoring a distinct segment of the infrastructure. The Legacy Programme D operates in a cloud environment with active monitoring, while the Regional Standard runs on endpoint agents in an inactive state, suggesting a system that has been decommissioned or is undergoing review. Monitoring status varies across active, inactive, and maintenance states, with last_scan_date providing a temporal reference for when each system last performed its analytical cycle. The ai_enabled flag indicates whether the system leverages machine learning for detection; Regional Standard and Integrated Protocol A both employ AI capabilities, which may explain their ability to flag complex threats. Each detection system is associated with a digital asset and a security event, forming the bridge between detection and the underlying operational data.

**Table `security_events`**

| id | event_id | event_type | source_ip | destination_ip | timestamp | correlation_score | threat_detection_system_id | cyber_incident_id | automated_response_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 2002007020060 | phishing | baseline-source-37 | legacy-destinat-79 | 2024-07-08T18:18:00 | 21.95 | 1000 | 100 | 1 |
| 2 | 168535 | malware | pilot-source-38 | compact-destinat-80 | 2025-12-19T01:35:00 | 25.90 | 1001 | 101 | 2 |
| 3 | ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 | unauthorized_access | extended-source-39 | composite-destinat-81 | 2022-05-03T08:52:00 | 29.85 | 1002 | 102 | 3 |
| 4 | 1186089 | policy_violation | integrated-source-40 | primary-destinat-82 | 2023-10-14T15:09:00 | 33.80 | 1003 | 103 | 4 |

Security events represent the raw telemetry that feeds into the detection and response pipeline. Each event carries a unique identifier, a type classification, and source and destination IP addresses that trace the network path of the activity. Event types include phishing, malware, unauthorized_access, and policy_violation — each representing a distinct category of malicious or non-compliant behavior. The correlation_score quantifies the confidence that the event is related to a broader threat pattern, with scores ranging from 21.95 for the phishing event to 33.80 for the policy_violation event. Timestamps align precisely with the incident records, confirming that each event is the operational precursor to a documented cyber incident. Every security event is linked to a threat detection system, a cyber incident, and an automated response, creating a direct chain from detection through to remediation.

**Table `digital_assets`**

| asset_id | asset_name | asset_type | os_type | criticality_level | last_compliance_check | security_platform_id | security_event_id |
|---|---|---|---|---|---|---|---|
| 7731874 | Pilot Programme | server | windows | 26 | 2025-12-03 | 1 | 1 |
| 6564392 | Baseline Standard | database | linux | 37 | 2022-05-14 | 2 | 2 |
| 5917296 | Distributed Framework A | endpoint | macos | 48 | 2023-10-25 | 3 | 3 |
| 990e161e10664c5885182d95dc07e606 | Adaptive Protocol | application | unknown | 59 | 2024-03-09 | 4 | 4 |

Digital assets form the foundation of the security landscape — the servers, databases, endpoints, and applications that organizations must protect. The Pilot Programme server runs Windows and carries a criticality level of 26, while the Baseline Standard database operates on Linux with a higher criticality of 37. The Distributed Framework A endpoint uses macOS with a criticality of 48, and the Adaptive Protocol application runs on an unknown operating system with the highest criticality level of 59. Last compliance check dates span from 2022 to 2025, indicating varying levels of maintenance rigor across the asset portfolio. Each asset is associated with a security platform and a security event, tying the protected resource directly to both the defensive infrastructure and the threat that targeted it.

**Table `security_platforms`**

| id | platform_id | platform_name | version | deployment_date | compliance_framework | is_open_xdr | automated_response_id |
|---|---|---|---|---|---|---|---|
| 1 | state_uk_28 | Baseline Initiative D | seasonal-version-71 | 2023-02-14 | NIST_2.0 | true | 1 |
| 2 | e6ce01fe-8fc3-11eb-924d-9cd76263cbd0 | Distributed Model | regional-version-72 | 2024-07-25 | ISO_27001 | false | 2 |
| 3 | 4716417 | Adaptive Cluster | legacy-version-73 | 2025-12-09 | SOC2 | true | 3 |
| 4 | 10966228 | Primary Review A | compact-version-74 | 2022-05-20 | NIST_2.0 | false | 4 |

Security platforms provide the overarching management and orchestration layer for the entire detection and response ecosystem. Platform names such as Baseline Initiative D, Distributed Model, Adaptive Cluster, and Primary Review A reflect the organizational naming conventions used to categorize defensive capabilities. Versions follow a pattern of seasonal, regional, legacy, and compact designations, suggesting a lifecycle of platform deployments and upgrades. Compliance frameworks — NIST_2.0, ISO_27001, and SOC2 — define the regulatory standards each platform adheres to, with two platforms supporting open XDR capabilities for cross-platform threat visibility. Deployment dates range from 2022 to 2025, and each platform is linked to an automated response mechanism, ensuring that every defensive layer has an associated countermeasure protocol.

**Table `automated_responses`**

| automated_response_id | response_id | response_type | execution_time | success_status | trigger_event_id | security_event_id | asset_id | security_platform_id | created_at |
|---|---|---|---|---|---|---|---|---|---|
| 1 | ChIJr7cItPtt5kcRM6ry7ecIYgw | block_ip | 2024-11-13T10:54:00 | false | default_chart_a_tax_code_23 | 1 | 7731874 | 1 | 2025-01-01 00:14:00 |
| 2 | 9736917 | quarantine_endpoint | 2025-04-24T17:11:00 | true | 8189481 | 2 | 6564392 | 2 | 2025-02-06 03:14:00 |
| 3 | 8189493 | alert_analyst | 2022-09-08T00:28:00 | false | a556311c-8fb2-11eb-924d-9cd76263cbd0 | 3 | 5917296 | 3 | 2025-03-11 06:14:00 |
| 4 | Invoice | patch_vulnerability | 2023-02-19T07:45:00 | true | 778560 | 4 | 990e161e10664c5885182d95dc07e606 | 4 | 2025-04-16 09:14:00 |

Automated responses represent the immediate actions taken to contain or mitigate threats without human intervention. Response types include block_ip, quarantine_endpoint, alert_analyst, and patch_vulnerability — each corresponding to a specific containment strategy. The execution timestamps reveal the timing of response actions, which may differ from the original event timestamps, indicating the latency between detection and response. Success status tracks whether the automated action achieved its intended outcome; block_ip and alert_analyst responses failed, while quarantine_endpoint and patch_vulnerability succeeded. Trigger event identifiers link each response to its initiating event, and each response is associated with a security event, a digital asset, and a security platform, completing the operational chain from detection through remediation.

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

The platforms_systems table documents the relationship between security platforms and the detection systems they manage. This mapping ensures that every detection system is governed by a specific platform, creating a clear chain of command and accountability. The platform-to-system relationship enables centralized policy enforcement, consistent configuration management, and unified reporting across heterogeneous detection infrastructure.

The following views synthesize the base tables into operational narratives that answer specific investigative questions.

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

This view joins cyber incidents with their originating threat detection systems, answering the question: which detection system identified each incident? The record for incident 1336174 shows it was detected by system 8189503 (Legacy Programme D), a cloud-based system with active monitoring. Incident state_uk_4 was identified by system 3717623 (Regional Standard), an endpoint-based system currently in an inactive state — a finding that raises questions about the reliability of detections from systems not actively monitored.

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

By linking incidents to their targeted digital assets, this view reveals which resources are most frequently under attack. Incident 1336174 targeted asset 7731874 (Pilot Programme), a Windows server with criticality level 26. Incident 2986243 targeted the Adaptive Protocol application (asset 990e161e10664c5885182d95dc07e606), the highest-criticality asset in the portfolio, suggesting that attackers prioritize the most valuable targets.

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

This view connects detection systems to the assets they monitor, clarifying the coverage map of the security infrastructure. System 8189503 (Legacy Programme D) monitors asset 7731874 (Pilot Programme), while system 605963 (Integrated Protocol A) monitors the Adaptive Protocol application. The one-to-one mapping observed in these records suggests a dedicated monitoring arrangement where each detection system is responsible for a specific asset.

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

This join reveals which security events each detection system processed. System 8189503 processed event 2002007020060, a phishing event with a correlation score of 21.95. System 605963 processed event 1186089, a policy_violation with the highest correlation score of 33.80. The correlation scores increase across the system sequence, potentially reflecting improved detection capabilities or more sophisticated attack patterns.

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

This view maps detection systems to their governing security platforms, answering which platform oversees each detection capability. System 8189503 is managed by platform 1 (Baseline Initiative D), which operates under the NIST_2.0 framework and supports open XDR. System 3717623 is managed by platform 2 (Distributed Model), which follows ISO_27001 and does not support open XDR.

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

This perspective reverses the relationship, showing which detection system is responsible for each security event. Event 2002007020060 (phishing) was detected by system 1000, while event ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 (unauthorized_access) was detected by system 1002. The consistent one-to-one mapping confirms that each event is attributed to a single detection system.

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

This view links security events to the cyber incidents they generated, establishing the causal chain from raw telemetry to documented incident. Event 2002007020060 generated incident 100, event 168535 generated incident 101, and so on. The direct correspondence confirms that every security event in this dataset escalated to a formal incident record.

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

This join connects security events to the automated responses they triggered. Event 2002007020060 triggered response 1 (block_ip), which ultimately failed. Event 168535 triggered response 2 (quarantine_endpoint), which succeeded. The success or failure of automated responses directly impacts the overall incident outcome and should be factored into playbook optimization.

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

This view maps digital assets to the security platforms that protect them. Asset 7731874 (Pilot Programme) is protected by platform 1 (Baseline Initiative D), while asset 990e161e10664c5885182d95dc07e606 (Adaptive Protocol) is protected by platform 4 (Primary Review A). Each asset has a single governing platform, ensuring clear ownership of defensive responsibilities.

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

This join links digital assets to the security events that targeted them. Asset 7731874 was targeted by event 1, asset 6564392 by event 2, and so on. The one-to-one mapping indicates that each asset in this dataset was involved in exactly one security event, simplifying the attribution of risk to specific resources.

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

This view provides a detailed mapping of security platforms to their associated threat detection systems. Platform 1 (Baseline Initiative D) oversees system 1000 (Legacy Programme D), while platform 4 (Primary Review A) oversees system 1003 (Integrated Protocol A). This hierarchical structure enables centralized management of detection capabilities across the organization.

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

This join connects security platforms to the automated responses they orchestrate. Platform 1 triggers response 1 (block_ip), platform 2 triggers response 2 (quarantine_endpoint), and so on. Each platform has a dedicated response mechanism, ensuring that every defensive layer can execute its own containment strategy.

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

This view reverses the automated response relationship, showing which security event triggered each response. Response 1 was triggered by event 1, response 2 by event 2, and so on. The direct mapping confirms that every automated response has a clear origin in a specific security event.

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

This join links automated responses to the digital assets they protect. Response 1 (block_ip) protected asset 7731874 (Pilot Programme), while response 4 (patch_vulnerability) protected asset 990e161e10664c5885182d95dc07e606 (Adaptive Protocol). The asset-level granularity of automated responses ensures that containment actions are precisely targeted at the resources under threat.

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

This view connects automated responses to the security platforms that execute them. Response 1 is executed by platform 1, response 2 by platform 2, and so on. The one-to-one relationship between platforms and responses suggests a tightly coupled architecture where each platform manages its own response playbook.

The operational records described above form a cohesive narrative of cybersecurity defense in action. From the initial detection of a phishing event by a cloud-based system, through the escalation to a formal incident, the targeting of a specific digital asset, and the execution of an automated response, every record in this dataset tells part of the same story. The relationships between tables — incidents linked to detection systems and assets, events linked to incidents and responses, platforms governing both systems and responses — create a multidimensional view of the security landscape. Practitioners who understand these relationships can reconstruct attack timelines, evaluate the effectiveness of detection and response mechanisms, and identify gaps in coverage. The data reveals that not all automated responses succeed, that some detection systems operate in inactive states, and that the highest-criticality assets attract the most sophisticated threats — insights that should directly inform security strategy and resource allocation.