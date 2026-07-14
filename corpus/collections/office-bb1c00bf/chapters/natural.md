## Infrastructure Governance and Observability

Modern distributed organizations maintain complex physical and logical infrastructures that span multiple geographic locations, each hosting specialized computing resources running defined software stacks. The integrity of such environments depends on systematic tracking of where assets reside, what software they execute, how they perform under load, and who or what has modified them. This chapter documents the core entities and their interrelationships within an infrastructure governance framework, drawing on operational records from a fictional multi-region deployment. The data captures a snapshot of four active office locations, their associated servers, software versions under management, performance metrics collected by monitoring tools, and audit trails of system actions.

**Table `offices`**

| office_id | city | region | country | is_active | established_date | server_id | software_version_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|
| 1 | integrated-city-34 | distributed-region-12 | compact-country-26 | true | 2024-03-27 | 1 | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | seasonal-city-35 | baseline-region-13 | composite-country-27 | false | 2025-08-11 | 2 | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | regional-city-36 | pilot-region-14 | primary-country-28 | true | 2022-01-22 | 3 | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | legacy-city-37 | extended-region-15 | adaptive-country-29 | false | 2023-06-06 | 4 | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Office locations form the foundational layer of the infrastructure model. Each office record anchors a geographic presence with an identifier, city name, regional designation, and country assignment. The `is_active` flag distinguishes operational sites from decommissioned ones; in the current dataset, offices 1 and 3 remain active while offices 2 and 4 have been deactivated. The `established_date` column records when each office was originally commissioned, ranging from early 2022 to mid-2025. The `created_at` and `updated_at` timestamps track when the office record itself was first entered and last modified in the system. Notably, each office carries foreign references to a `server_id` and `software_version_id`, establishing direct associations between physical locations and the computing assets and software configurations they host. For instance, office 1 in integrated-city-34 is linked to server 1 and software version 1, while office 3 in regional-city-36 maps to server 3 and software version 3.

**Table `servers`**

| id | server_id | model | partition_type | ipar_count | status | last_health_check_date | office_id | software_version_id | system_metric_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 911352d5dab64576b7a6da51aa69d76d | composite-model-81 | legacy-partitio-91 | 13 | regional-status-84 | 2023-10-23 | 1 | 1 | 1 |
| 2 | 1450637 | primary-model-82 | compact-partitio-92 | 15 | legacy-status-85 | 2024-03-07 | 2 | 2 | 2 |
| 3 | 4985152 | adaptive-model-83 | composite-partitio-93 | 4 | compact-status-86 | 2025-08-18 | 3 | 3 | 3 |
| 4 | 9736887 | distributed-model-84 | primary-partitio-94 | 4 | composite-status-87 | 2022-01-02 | 4 | 4 | 4 |

Servers represent the computing resources deployed within the infrastructure. Each server record includes a unique identifier (`server_id`), a model designation, partition type, the number of IP addresses allocated (`ipar_count`), and a status indicator. The `last_health_check_date` records when the server was last evaluated for operational readiness. The dataset shows four servers with models ranging from composite-model-81 to distributed-model-84, partition types spanning legacy-partitio-91 through primary-partitio-94, and IP allocations between 4 and 15 addresses. Server 1, for example, carries 13 IP addresses and was last health-checked on 2023-10-23, while server 3, with only 4 IP addresses, had its most recent health check on 2025-08-18. Each server is associated with an office through `office_id` and with a software version through `software_version_id`, creating a clear chain from physical location to computing resource to software stack. The `system_metric_id` column further ties each server to its performance data.

**Table `software_versions`**

| software_version_id | software_id | application_name | version_number | release_date | is_obsolete | maintenance_status | office_id | server_id |
|---|---|---|---|---|---|---|---|---|
| 1 | gd_taxc_2111 | Integrated Protocol A | VER-2245 | 2022-09-07 | false | extended-maintena-33 | 1 | 1 |
| 2 | 5917273 | Extended Programme | VER-2249 | 2023-02-18 | true | integrated-maintena-34 | 2 | 2 |
| 3 | id_4 | Pilot Standard | VER-2253 | 2024-07-02 | false | seasonal-maintena-35 | 3 | 3 |
| 4 | 8928496 | Baseline Framework D | VER-2257 | 2025-12-13 | true | regional-maintena-36 | 4 | 4 |

Software versions track the application configurations running across the infrastructure. Each record identifies a specific version of an application through `software_id`, `application_name`, and `version_number`. The `release_date` indicates when the version was published, while `is_obsolete` marks whether the version has reached end-of-life status. The `maintenance_status` column describes the current support posture of each version. In the dataset, Integrated Protocol A (VER-2245) released on 2022-09-07 remains under extended maintenance and is not obsolete, whereas Extended Programme (VER-2249) released on 2023-02-18 is marked obsolete with integrated maintenance status. Pilot Standard (VER-2253) and Baseline Framework D (VER-2257) follow similar patterns, with the latter also marked obsolete. Each software version record references an `office_id` and `server_id`, anchoring the software configuration to specific locations and computing resources.

**Table `system_metrics`**

| id | metric_id | metric_type | value | timestamp | unit | is_anomalous | server_id | monitoring_tool_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 3744010 | extended-metric-87 | 19.95 | 2024-07-08T18:18:00 | distributed-unit-18 | true | 1 | 1000 |
| 2 | 136630a8-8fcc-11eb-924d-9cd76263cbd0 | integrated-metric-88 | 21.90 | 2025-12-19T01:35:00 | baseline-unit-19 | false | 2 | 1001 |
| 3 | 2986226 | seasonal-metric-89 | 23.85 | 2022-05-03T08:52:00 | pilot-unit-20 | true | 3 | 1002 |
| 4 | 2002007020010 | regional-metric-90 | 25.80 | 2023-10-14T15:09:00 | extended-unit-21 | false | 4 | 1003 |

System metrics capture the performance characteristics of computing resources over time. Each metric record includes a `metric_id`, a `metric_type` classification, a numeric `value`, a `timestamp` for when the measurement was taken, a `unit` of measurement, and an `is_anomalous` flag indicating whether the value deviates from expected ranges. The dataset contains four metrics with types ranging from extended-metric-87 to regional-metric-90, values spanning 19.95 to 25.80, and timestamps distributed across 2022 to 2025. Metrics 1 and 3 are flagged as anomalous, while metrics 2 and 4 are within normal parameters. Each metric is associated with a specific server through `server_id` and with a monitoring tool through `monitoring_tool_id`, enabling traceability from measurement to the tool that collected it.

**Table `monitoring_tools`**

| id | tool_id | tool_name | version | vendor | is_automated | last_run_date | server_id | system_metric_id |
|---|---|---|---|---|---|---|---|---|
| 1000 | comi | Composite Model | seasonal-version-71 | Feedback Ratings | false | 2022-01-02 | 1 | 1 |
| 1001 | 195360 | Compact Cluster A | regional-version-72 | Abbott Laboratories | true | 2023-06-13 | 2 | 2 |
| 1002 | 3355763 | Legacy Review | legacy-version-73 | American Express | false | 2024-11-24 | 3 | 3 |
| 1003 | 8387539 | Regional Initiative | compact-version-74 | Whatsapp Inc. | true | 2025-04-08 | 4 | 4 |

Monitoring tools are the automated and manual systems responsible for collecting system metrics and generating audit events. Each tool record includes a `tool_id`, a descriptive `tool_name`, a `version`, the `vendor` that provides the tool, an `is_automated` flag, and a `last_run_date` indicating when the tool was last executed. The dataset features four tools: Composite Model (seasonal-version-71) from Feedback Ratings, Compact Cluster A (regional-version-72) from Abbott Laboratories, Legacy Review (legacy-version-73) from American Express, and Regional Initiative (compact-version-74) from Whatsapp Inc. Tools 1001 and 1003 are automated, while tools 1000 and 1002 require manual execution. Each tool is linked to a server via `server_id` and to a system metric via `system_metric_id`, forming the collection pipeline from tool to metric to server.

**Table `audit_logs`**

| audit_log_id | log_id | action_type | user_id | timestamp | status | is_suspicious | monitoring_tool_id | system_metric_id |
|---|---|---|---|---|---|---|---|---|
| 1 | d5dc19c8-8fc1-11eb-924d-9cd76263cbd0 | compact-action-62 | 9736910 | 2024-07-08T18:18:00 | regional-status-84 | true | 1000 | 1 |
| 2 | 2618582 | composite-action-63 | 40c1e50ce74c42d6801b1e2f409c1cfc | 2025-12-19T01:35:00 | legacy-status-85 | false | 1001 | 2 |
| 3 | 10449536 | primary-action-64 | 92297f70-9bad-11eb-a8a2-19ed5c03f8d3 | 2022-05-03T08:52:00 | compact-status-86 | true | 1002 | 3 |
| 4 | 6564387 | adaptive-action-65 | 9125634 | 2023-10-14T15:09:00 | composite-status-87 | false | 1003 | 4 |

Audit logs provide a chronological record of actions taken within the infrastructure, enabling accountability and forensic analysis. Each audit log entry includes an `audit_log_id`, a `log_id`, an `action_type`, a `user_id` identifying the actor, a `timestamp`, a `status`, and an `is_suspicious` flag for security review. The dataset contains four audit entries with action types ranging from compact-action-62 to adaptive-action-65, user identifiers spanning numeric and UUID formats, and timestamps aligned with the metric collection schedule. Actions 1 and 3 are flagged as suspicious, warranting further investigation, while actions 2 and 4 are marked as routine. Each audit log references a `monitoring_tool_id` and a `system_metric_id`, connecting the action to the tool that triggered it and the metric context in which it occurred.

The relationships between these entities become most valuable when examined through joined views that answer specific operational questions. The following sections interpret each view and demonstrate how the data supports infrastructure governance.

**View `v_office_server`**

```sql
CREATE VIEW v_office_server AS
SELECT a.office_id, a.city, a.region, a.country, b.id AS server_id, b.server_id AS server_server_id, b.model AS server_model
FROM offices a JOIN servers b ON a.server_id = b.id;
```

| office_id | city | region | country | server_id | server_server_id | server_model |
|---|---|---|---|---|---|---|
| 1 | integrated-city-34 | distributed-region-12 | compact-country-26 | 1 | 911352d5dab64576b7a6da51aa69d76d | composite-model-81 |
| 2 | seasonal-city-35 | baseline-region-13 | composite-country-27 | 2 | 1450637 | primary-model-82 |
| 3 | regional-city-36 | pilot-region-14 | primary-country-28 | 3 | 4985152 | adaptive-model-83 |
| 4 | legacy-city-37 | extended-region-15 | adaptive-country-29 | 4 | 9736887 | distributed-model-84 |

This view joins office records with their associated servers, answering the question: which servers are deployed at which office locations? The join produces rows that pair each office with its server, revealing the physical-to-computing mapping. For example, the row linking office 1 (integrated-city-34) with server 1 (composite-model-81) shows that this office hosts a server with 13 IP addresses under regional-status-84. The row for office 3 (regional-city-36) paired with server 3 (adaptive-model-83) reveals a smaller deployment with only 4 IP addresses and compact-status-86. This view is essential for capacity planning and geographic resource inventory.

**View `v_office_software_version`**

```sql
CREATE VIEW v_office_software_version AS
SELECT a.office_id, a.city, a.region, a.country, b.software_version_id AS version_software_version_id, b.software_id AS version_software_id, b.application_name AS version_application_name
FROM offices a JOIN software_versions b ON a.software_version_id = b.software_version_id;
```

| office_id | city | region | country | version_software_version_id | version_software_id | version_application_name |
|---|---|---|---|---|---|---|
| 1 | integrated-city-34 | distributed-region-12 | compact-country-26 | 1 | gd_taxc_2111 | Integrated Protocol A |
| 2 | seasonal-city-35 | baseline-region-13 | composite-country-27 | 2 | 5917273 | Extended Programme |
| 3 | regional-city-36 | pilot-region-14 | primary-country-28 | 3 | id_4 | Pilot Standard |
| 4 | legacy-city-37 | extended-region-15 | adaptive-country-29 | 4 | 8928496 | Baseline Framework D |

This view connects offices with the software versions they host, answering: what software configurations are deployed at each office? The joined rows pair office identifiers with software version details, including application names and maintenance statuses. Office 1 is associated with Integrated Protocol A (VER-2245) under extended maintenance, while office 2 carries Extended Programme (VER-2249), which is marked obsolete. Office 3 runs Pilot Standard (VER-2253) with seasonal maintenance, and office 4 hosts Baseline Framework D (VER-2257), also obsolete. This view supports software compliance audits and migration planning by highlighting which offices run deprecated software.

**View `v_server_office`**

```sql
CREATE VIEW v_server_office AS
SELECT a.id, a.server_id, a.model, a.partition_type, b.office_id AS office_office_id, b.city AS office_city, b.region AS office_region
FROM servers a JOIN offices b ON a.office_id = b.office_id;
```

| id | server_id | model | partition_type | office_office_id | office_city | office_region |
|---|---|---|---|---|---|---|
| 1 | 911352d5dab64576b7a6da51aa69d76d | composite-model-81 | legacy-partitio-91 | 1 | integrated-city-34 | distributed-region-12 |
| 2 | 1450637 | primary-model-82 | compact-partitio-92 | 2 | seasonal-city-35 | baseline-region-13 |
| 3 | 4985152 | adaptive-model-83 | composite-partitio-93 | 3 | regional-city-36 | pilot-region-14 |
| 4 | 9736887 | distributed-model-84 | primary-partitio-94 | 4 | legacy-city-37 | extended-region-15 |

This view presents the same office-server relationship from the server's perspective, answering: which office does each server belong to? The join inverts the relationship, with each server row carrying its parent office's city, region, and country information. Server 1 (911352d5dab64576b7a6da51aa69d76d) appears alongside office 1's details (integrated-city-34, distributed-region-12, compact-country-26), while server 4 (9736887) is associated with office 4 (legacy-city-37, extended-region-15, adaptive-country-29). This perspective is useful when troubleshooting from the server side and needing to quickly identify the responsible office.

**View `v_server_software_version`**

```sql
CREATE VIEW v_server_software_version AS
SELECT a.id, a.server_id, a.model, a.partition_type, b.software_version_id AS version_software_version_id, b.software_id AS version_software_id, b.application_name AS version_application_name
FROM servers a JOIN software_versions b ON a.software_version_id = b.software_version_id;
```

| id | server_id | model | partition_type | version_software_version_id | version_software_id | version_application_name |
|---|---|---|---|---|---|---|
| 1 | 911352d5dab64576b7a6da51aa69d76d | composite-model-81 | legacy-partitio-91 | 1 | gd_taxc_2111 | Integrated Protocol A |
| 2 | 1450637 | primary-model-82 | compact-partitio-92 | 2 | 5917273 | Extended Programme |
| 3 | 4985152 | adaptive-model-83 | composite-partitio-93 | 3 | id_4 | Pilot Standard |
| 4 | 9736887 | distributed-model-84 | primary-partitio-94 | 4 | 8928496 | Baseline Framework D |

This view links servers with their software versions, answering: what software runs on each server? Each row pairs a server's model and status with the application name, version number, and maintenance status of its software. Server 1 runs Integrated Protocol A VER-2245 under extended maintenance, while server 2 runs Extended Programme VER-2249, which is obsolete. Server 3 hosts Pilot Standard VER-2253 with seasonal maintenance, and server 4 runs Baseline Framework D VER-2257, also obsolete. This view is critical for vulnerability management, as it identifies servers running deprecated software that may require immediate patching or replacement.

**View `v_server_system_metric`**

```sql
CREATE VIEW v_server_system_metric AS
SELECT a.id, a.server_id, a.model, a.partition_type, b.id AS metric_id, b.metric_id AS metric_metric_id, b.metric_type AS metric_metric_type
FROM servers a JOIN system_metrics b ON a.system_metric_id = b.id;
```

| id | server_id | model | partition_type | metric_id | metric_metric_id | metric_metric_type |
|---|---|---|---|---|---|---|
| 1 | 911352d5dab64576b7a6da51aa69d76d | composite-model-81 | legacy-partitio-91 | 1 | 3744010 | extended-metric-87 |
| 2 | 1450637 | primary-model-82 | compact-partitio-92 | 2 | 136630a8-8fcc-11eb-924d-9cd76263cbd0 | integrated-metric-88 |
| 3 | 4985152 | adaptive-model-83 | composite-partitio-93 | 3 | 2986226 | seasonal-metric-89 |
| 4 | 9736887 | distributed-model-84 | primary-partitio-94 | 4 | 2002007020010 | regional-metric-90 |

This view associates servers with their system metrics, answering: how is each server performing? The joined rows combine server details with metric values, types, and anomaly flags. Server 1 has metric value 19.95 of type extended-metric-87, flagged as anomalous, while server 2 shows value 21.90 of type integrated-metric-88, within normal parameters. Server 3 records value 23.85 of type seasonal-metric-89, also anomalous, and server 4 shows value 25.80 of type regional-metric-90, normal. This view enables performance trend analysis and anomaly detection across the server fleet.

**View `v_software_version_office`**

```sql
CREATE VIEW v_software_version_office AS
SELECT a.software_version_id, a.software_id, a.application_name, a.version_number, b.office_id AS office_office_id, b.city AS office_city, b.region AS office_region
FROM software_versions a JOIN offices b ON a.office_id = b.office_id;
```

| software_version_id | software_id | application_name | version_number | office_office_id | office_city | office_region |
|---|---|---|---|---|---|---|
| 1 | gd_taxc_2111 | Integrated Protocol A | VER-2245 | 1 | integrated-city-34 | distributed-region-12 |
| 2 | 5917273 | Extended Programme | VER-2249 | 2 | seasonal-city-35 | baseline-region-13 |
| 3 | id_4 | Pilot Standard | VER-2253 | 3 | regional-city-36 | pilot-region-14 |
| 4 | 8928496 | Baseline Framework D | VER-2257 | 4 | legacy-city-37 | extended-region-15 |

This view presents the software-office relationship from the software version's perspective, answering: at which offices is each software version deployed? Each row carries the software version's application name and version number alongside the office's geographic details. Integrated Protocol A VER-2245 is deployed at office 1 in integrated-city-34, while Extended Programme VER-2249 is at office 2 in seasonal-city-35. Pilot Standard VER-2253 runs at office 3 in regional-city-36, and Baseline Framework D VER-2257 is at office 4 in legacy-city-37. This view supports software deployment audits and geographic distribution analysis.

**View `v_software_version_server`**

```sql
CREATE VIEW v_software_version_server AS
SELECT a.software_version_id, a.software_id, a.application_name, a.version_number, b.id AS server_id, b.server_id AS server_server_id, b.model AS server_model
FROM software_versions a JOIN servers b ON a.server_id = b.id;
```

| software_version_id | software_id | application_name | version_number | server_id | server_server_id | server_model |
|---|---|---|---|---|---|---|
| 1 | gd_taxc_2111 | Integrated Protocol A | VER-2245 | 1 | 911352d5dab64576b7a6da51aa69d76d | composite-model-81 |
| 2 | 5917273 | Extended Programme | VER-2249 | 2 | 1450637 | primary-model-82 |
| 3 | id_4 | Pilot Standard | VER-2253 | 3 | 4985152 | adaptive-model-83 |
| 4 | 8928496 | Baseline Framework D | VER-2257 | 4 | 9736887 | distributed-model-84 |

This view connects software versions with their hosting servers, answering: which servers run each software version? The joined rows pair software application details with server model, partition type, and status. Integrated Protocol A VER-2245 runs on server 1 (composite-model-81, legacy-partitio-91), Extended Programme VER-2249 on server 2 (primary-model-82, compact-partitio-92), Pilot Standard VER-2253 on server 3 (adaptive-model-83, composite-partitio-93), and Baseline Framework D VER-2257 on server 4 (distributed-model-84, primary-partitio-94). This view is valuable for software rollout planning and compatibility verification.

**View `v_system_metric_server`**

```sql
CREATE VIEW v_system_metric_server AS
SELECT a.id, a.metric_id, a.metric_type, a.value, b.id AS server_id, b.server_id AS server_server_id, b.model AS server_model
FROM system_metrics a JOIN servers b ON a.server_id = b.id;
```

| id | metric_id | metric_type | value | server_id | server_server_id | server_model |
|---|---|---|---|---|---|---|
| 1 | 3744010 | extended-metric-87 | 19.95 | 1 | 911352d5dab64576b7a6da51aa69d76d | composite-model-81 |
| 2 | 136630a8-8fcc-11eb-924d-9cd76263cbd0 | integrated-metric-88 | 21.90 | 2 | 1450637 | primary-model-82 |
| 3 | 2986226 | seasonal-metric-89 | 23.85 | 3 | 4985152 | adaptive-model-83 |
| 4 | 2002007020010 | regional-metric-90 | 25.80 | 4 | 9736887 | distributed-model-84 |

This view presents system metrics from the server's perspective, answering: which metrics belong to each server? Each row pairs server details with the metric type, value, timestamp, and anomaly status. Server 1 (composite-model-81) has metric 3744010 of type extended-metric-87 recorded on 2024-07-08 with value 19.95, flagged anomalous. Server 2 (primary-model-82) has metric 136630a8-8fcc-11eb-924d-9cd76263cbd0 of type integrated-metric-88 recorded on 2025-12-19 with value 21.90, normal. Server 3 (adaptive-model-83) has metric 2986226 of type seasonal-metric-89 recorded on 2022-05-03 with value 23.85, anomalous. Server 4 (distributed-model-84) has metric 2002007020010 of type regional-metric-90 recorded on 2023-10-14 with value 25.80, normal. This view supports server-specific performance baselining.

**View `v_system_metric_monitoring_tool`**

```sql
CREATE VIEW v_system_metric_monitoring_tool AS
SELECT a.id, a.metric_id, a.metric_type, a.value, b.id AS tool_id, b.tool_id AS tool_tool_id, b.tool_name AS tool_tool_name
FROM system_metrics a JOIN monitoring_tools b ON a.monitoring_tool_id = b.id;
```

| id | metric_id | metric_type | value | tool_id | tool_tool_id | tool_tool_name |
|---|---|---|---|---|---|---|
| 1 | 3744010 | extended-metric-87 | 19.95 | 1000 | comi | Composite Model |
| 2 | 136630a8-8fcc-11eb-924d-9cd76263cbd0 | integrated-metric-88 | 21.90 | 1001 | 195360 | Compact Cluster A |
| 3 | 2986226 | seasonal-metric-89 | 23.85 | 1002 | 3355763 | Legacy Review |
| 4 | 2002007020010 | regional-metric-90 | 25.80 | 1003 | 8387539 | Regional Initiative |

This view links system metrics with the monitoring tools that collected them, answering: which tool generated each metric? The joined rows pair metric details with tool names, versions, and vendor information. Metric 3744010 was collected by tool comi (Composite Model, seasonal-version-71) from Feedback Ratings, while metric 136630a8-8fcc-11eb-924d-9cd76263cbd0 was collected by tool 195360 (Compact Cluster A, regional-version-72) from Abbott Laboratories. Metric 2986226 came from tool 3355763 (Legacy Review, legacy-version-73) from American Express, and metric 2002007020010 from tool 8387539 (Regional Initiative, compact-version-74) from Whatsapp Inc. This view supports tool performance evaluation and vendor management.

**View `v_monitoring_tool_server`**

```sql
CREATE VIEW v_monitoring_tool_server AS
SELECT a.id, a.tool_id, a.tool_name, a.version, b.id AS server_id, b.server_id AS server_server_id, b.model AS server_model
FROM monitoring_tools a JOIN servers b ON a.server_id = b.id;
```

| id | tool_id | tool_name | version | server_id | server_server_id | server_model |
|---|---|---|---|---|---|---|
| 1000 | comi | Composite Model | seasonal-version-71 | 1 | 911352d5dab64576b7a6da51aa69d76d | composite-model-81 |
| 1001 | 195360 | Compact Cluster A | regional-version-72 | 2 | 1450637 | primary-model-82 |
| 1002 | 3355763 | Legacy Review | legacy-version-73 | 3 | 4985152 | adaptive-model-83 |
| 1003 | 8387539 | Regional Initiative | compact-version-74 | 4 | 9736887 | distributed-model-84 |

This view presents monitoring tools from the server's perspective, answering: which tools monitor each server? Each row pairs tool details with the server's model, partition type, and status. Tool comi (Composite Model) monitors server 1 (composite-model-81), tool 195360 (Compact Cluster A) monitors server 2 (primary-model-82), tool 3355763 (Legacy Review) monitors server 3 (adaptive-model-83), and tool 8387539 (Regional Initiative) monitors server 4 (distributed-model-84). This view is useful for monitoring coverage analysis and tool-to-server assignment verification.

**View `v_monitoring_tool_system_metric`**

```sql
CREATE VIEW v_monitoring_tool_system_metric AS
SELECT a.id, a.tool_id, a.tool_name, a.version, b.id AS metric_id, b.metric_id AS metric_metric_id, b.metric_type AS metric_metric_type
FROM monitoring_tools a JOIN system_metrics b ON a.system_metric_id = b.id;
```

| id | tool_id | tool_name | version | metric_id | metric_metric_id | metric_metric_type |
|---|---|---|---|---|---|---|
| 1000 | comi | Composite Model | seasonal-version-71 | 1 | 3744010 | extended-metric-87 |
| 1001 | 195360 | Compact Cluster A | regional-version-72 | 2 | 136630a8-8fcc-11eb-924d-9cd76263cbd0 | integrated-metric-88 |
| 1002 | 3355763 | Legacy Review | legacy-version-73 | 3 | 2986226 | seasonal-metric-89 |
| 1003 | 8387539 | Regional Initiative | compact-version-74 | 4 | 2002007020010 | regional-metric-90 |

This view connects monitoring tools with the metrics they produce, answering: what metrics does each tool generate? The joined rows pair tool names and vendor information with metric types, values, and anomaly flags. Tool comi generates metric 3744010 (extended-metric-87, value 19.95, anomalous), tool 195360 generates metric 136630a8-8fcc-11eb-924d-9cd76263cbd0 (integrated-metric-88, value 21.90, normal), tool 3355763 generates metric 2986226 (seasonal-metric-89, value 23.85, anomalous), and tool 8387539 generates metric 2002007020010 (regional-metric-90, value 25.80, normal). This view supports metric quality assessment and tool calibration.

**View `v_audit_log_monitoring_tool`**

```sql
CREATE VIEW v_audit_log_monitoring_tool AS
SELECT a.audit_log_id, a.log_id, a.action_type, a.user_id, b.id AS tool_id, b.tool_id AS tool_tool_id, b.tool_name AS tool_tool_name
FROM audit_logs a JOIN monitoring_tools b ON a.monitoring_tool_id = b.id;
```

| audit_log_id | log_id | action_type | user_id | tool_id | tool_tool_id | tool_tool_name |
|---|---|---|---|---|---|---|
| 1 | d5dc19c8-8fc1-11eb-924d-9cd76263cbd0 | compact-action-62 | 9736910 | 1000 | comi | Composite Model |
| 2 | 2618582 | composite-action-63 | 40c1e50ce74c42d6801b1e2f409c1cfc | 1001 | 195360 | Compact Cluster A |
| 3 | 10449536 | primary-action-64 | 92297f70-9bad-11eb-a8a2-19ed5c03f8d3 | 1002 | 3355763 | Legacy Review |
| 4 | 6564387 | adaptive-action-65 | 9125634 | 1003 | 8387539 | Regional Initiative |

This view links audit logs with the monitoring tools that triggered them, answering: which tool generated each audit event? The joined rows pair audit action types and user identifiers with tool names and vendor information. Action compact-action-62 by user 9736910 was triggered by tool comi (Composite Model) from Feedback Ratings and flagged as suspicious. Action composite-action-63 by user 40c1e50ce74c42d6801b1e2f409c1cfc was triggered by tool 195360 (Compact Cluster A) from Abbott Laboratories and marked routine. Action primary-action-64 by user 92297f70-9bad-11eb-a8a2-19ed5c03f8d3 was triggered by tool 3355763 (Legacy Review) from American Express and flagged as suspicious. Action adaptive-action-65 by user 9125634 was triggered by tool 8387539 (Regional Initiative) from Whatsapp Inc. and marked routine. This view supports security investigations and tool accountability.

**View `v_audit_log_system_metric`**

```sql
CREATE VIEW v_audit_log_system_metric AS
SELECT a.audit_log_id, a.log_id, a.action_type, a.user_id, b.id AS metric_id, b.metric_id AS metric_metric_id, b.metric_type AS metric_metric_type
FROM audit_logs a JOIN system_metrics b ON a.system_metric_id = b.id;
```

| audit_log_id | log_id | action_type | user_id | metric_id | metric_metric_id | metric_metric_type |
|---|---|---|---|---|---|---|
| 1 | d5dc19c8-8fc1-11eb-924d-9cd76263cbd0 | compact-action-62 | 9736910 | 1 | 3744010 | extended-metric-87 |
| 2 | 2618582 | composite-action-63 | 40c1e50ce74c42d6801b1e2f409c1cfc | 2 | 136630a8-8fcc-11eb-924d-9cd76263cbd0 | integrated-metric-88 |
| 3 | 10449536 | primary-action-64 | 92297f70-9bad-11eb-a8a2-19ed5c03f8d3 | 3 | 2986226 | seasonal-metric-89 |
| 4 | 6564387 | adaptive-action-65 | 9125634 | 4 | 2002007020010 | regional-metric-90 |

This view connects audit logs with the system metrics in whose context the actions occurred, answering: which metrics were affected by each audit event? The joined rows pair audit action details with metric types, values, and anomaly statuses. Action compact-action-62 occurred in the context of metric 3744010 (extended-metric-87, value 19.95, anomalous), while action composite-action-63 occurred alongside metric 136630a8-8fcc-11eb-924d-9cd76263cbd0 (integrated-metric-88, value 21.90, normal). Action primary-action-64 was associated with metric 2986226 (seasonal-metric-89, value 23.85, anomalous), and action adaptive-action-65 with metric 2002007020010 (regional-metric-90, value 25.80, normal). This view enables correlation between system performance anomalies and audit events, supporting root cause analysis.

The infrastructure governance framework described here demonstrates how structured records of offices, servers, software versions, system metrics, monitoring tools, and audit logs interlock to provide comprehensive operational visibility. Each entity serves a distinct purpose: offices anchor the physical geography, servers represent computing resources, software versions track application configurations, system metrics capture performance, monitoring tools enable automated collection, and audit logs ensure accountability. The foreign-key relationships between these entities create a navigable graph that supports everything from capacity planning and compliance auditing to security investigation and performance optimization. By maintaining consistent references across all records, the framework ensures that any operational question—whether about which office runs obsolete software, which server has anomalous metrics, or which tool generated a suspicious audit event—can be answered through systematic joins across the available views.