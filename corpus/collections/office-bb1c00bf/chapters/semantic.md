## Ontology-Grounded Relational Modelling of Infrastructure Observability

The domain under examination concerns the observability of distributed computing infrastructure: a network of physical offices, the servers they house, the software versions deployed on those servers, the system metrics collected from them, the monitoring tools that perform the collection, and the audit trails that record every action taken within the system. The ontology treats each of these as a distinct entity type, with attributes that capture both intrinsic properties (such as a server's model or a software version's release date) and relationships that bind entities together (such as a server residing in an office or a monitoring tool measuring a system metric). The relational schema materialises this ontology by assigning each entity type its own table, encoding attributes as columns, and representing cardinality-bounded relationships through foreign keys and, where necessary, junction tables. The following sections walk through the base tables, the foreign-key topology, and the materialised views that reconstruct domain facts from the normalised structure.

### Base Tables and Entity Types

The `offices` table captures the geographic and administrative footprint of the infrastructure. Its primary key is `office_id`, an integer surrogate that orders records sequentially. The natural attributes `city`, `region`, and `country` carry synthetic identifiers such as `integrated-city-34`, `distributed-region-12`, and `compact-country-26` for the first record, and `seasonal-city-35`, `baseline-region-13`, `composite-country-27` for the second. The boolean column `is_active` distinguishes operational offices from decommissioned ones — office 1 and office 3 are active, while offices 2 and 4 are not. The `established_date` column anchors each office in time (e.g. `2024-03-27` for office 1, `2022-01-22` for office 3). Audit columns `created_at` and `updated_at` record the lifecycle of the row itself, with office 1 created on `2025-01-01 00:14:00` and last updated on `2025-01-02 00:41:00`. The table also carries `server_id` and `software_version_id` as foreign keys, establishing a direct link from each office to the server and software version it hosts.

**Table `offices`**

| office_id | city | region | country | is_active | established_date | server_id | software_version_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|
| 1 | integrated-city-34 | distributed-region-12 | compact-country-26 | true | 2024-03-27 | 1 | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | seasonal-city-35 | baseline-region-13 | composite-country-27 | false | 2025-08-11 | 2 | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | regional-city-36 | pilot-region-14 | primary-country-28 | true | 2022-01-22 | 3 | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | legacy-city-37 | extended-region-15 | adaptive-country-29 | false | 2023-06-06 | 4 | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The `servers` table is the central hub of the schema. Its surrogate primary key is `id`, while the natural identifier `server_id` carries UUID-like values such as `911352d5dab64576b7a6da51aa69d76d` for the first server and the shorter `1450637` for the second. The `model` column classifies servers into types like `composite-model-81`, `primary-model-82`, `adaptive-model-83`, and `distributed-model-84`. The `partition_type` column (e.g. `legacy-partitio-91`, `compact-partitio-92`) and the integer `ipar_count` (values 13, 15, 4, 4) describe the server's partitioning configuration. The `status` column carries values such as `regional-status-84` and `legacy-status-85`, while `last_health_check_date` records the most recent health probe (e.g. `2023-10-23` for server 1). Foreign keys `office_id`, `software_version_id`, and `system_metric_id` bind each server to its parent office, its deployed software version, and the system metric it produces.

**Table `servers`**

| id | server_id | model | partition_type | ipar_count | status | last_health_check_date | office_id | software_version_id | system_metric_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 911352d5dab64576b7a6da51aa69d76d | composite-model-81 | legacy-partitio-91 | 13 | regional-status-84 | 2023-10-23 | 1 | 1 | 1 |
| 2 | 1450637 | primary-model-82 | compact-partitio-92 | 15 | legacy-status-85 | 2024-03-07 | 2 | 2 | 2 |
| 3 | 4985152 | adaptive-model-83 | composite-partitio-93 | 4 | compact-status-86 | 2025-08-18 | 3 | 3 | 3 |
| 4 | 9736887 | distributed-model-84 | primary-partitio-94 | 4 | composite-status-87 | 2022-01-02 | 4 | 4 | 4 |

The `software_versions` table tracks the software lifecycle. Its primary key is `software_version_id`. The natural identifier `software_id` carries values like `gd_taxc_2111` and `5917273`. The `application_name` column names the software (e.g. `Integrated Protocol A`, `Extended Programme`, `Pilot Standard`, `Baseline Framework D`), and `version_number` carries version strings such as `VER-2245` and `VER-2249`. The `release_date` column (e.g. `2022-09-07`, `2025-12-13`) and the boolean `is_obsolete` flag (false for versions 1 and 3, true for versions 2 and 4) capture the lifecycle state. The `maintenance_status` column carries values like `extended-maintena-33` and `integrated-maintena-34`. Foreign keys `office_id` and `server_id` link each software version to the office and server where it is deployed.

**Table `software_versions`**

| software_version_id | software_id | application_name | version_number | release_date | is_obsolete | maintenance_status | office_id | server_id |
|---|---|---|---|---|---|---|---|---|
| 1 | gd_taxc_2111 | Integrated Protocol A | VER-2245 | 2022-09-07 | false | extended-maintena-33 | 1 | 1 |
| 2 | 5917273 | Extended Programme | VER-2249 | 2023-02-18 | true | integrated-maintena-34 | 2 | 2 |
| 3 | id_4 | Pilot Standard | VER-2253 | 2024-07-02 | false | seasonal-maintena-35 | 3 | 3 |
| 4 | 8928496 | Baseline Framework D | VER-2257 | 2025-12-13 | true | regional-maintena-36 | 4 | 4 |

The `system_metrics` table records time-series observations. Its surrogate primary key is `id`, while the natural `metric_id` carries values such as `3744010` and the UUID `136630a8-8fcc-11eb-924d-9cd76263cbd0`. The `metric_type` column classifies the measurement (e.g. `extended-metric-87`, `integrated-metric-88`), and the `value` column holds the numeric reading (19.95, 21.90, 23.85, 25.80). The `timestamp` column records when the measurement was taken (e.g. `2024-07-08T18:18:00`), and `unit` carries synthetic unit identifiers like `distributed-unit-18` and `baseline-unit-19`. The boolean `is_anomalous` flag (true for metrics 1 and 3, false for 2 and 4) marks outliers. Foreign keys `server_id` and `monitoring_tool_id` bind each metric to the server it measures and the tool that collected it.

**Table `system_metrics`**

| id | metric_id | metric_type | value | timestamp | unit | is_anomalous | server_id | monitoring_tool_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 3744010 | extended-metric-87 | 19.95 | 2024-07-08T18:18:00 | distributed-unit-18 | true | 1 | 1000 |
| 2 | 136630a8-8fcc-11eb-924d-9cd76263cbd0 | integrated-metric-88 | 21.90 | 2025-12-19T01:35:00 | baseline-unit-19 | false | 2 | 1001 |
| 3 | 2986226 | seasonal-metric-89 | 23.85 | 2022-05-03T08:52:00 | pilot-unit-20 | true | 3 | 1002 |
| 4 | 2002007020010 | regional-metric-90 | 25.80 | 2023-10-14T15:09:00 | extended-unit-21 | false | 4 | 1003 |

The `monitoring_tools` table describes the tools used for observation. Its surrogate primary key is `id`, with natural identifier `tool_id` carrying values like `comi` and `195360`. The `tool_name` column names the tool (e.g. `Composite Model`, `Compact Cluster A`, `Legacy Review`, `Regional Initiative`), and `version` carries version strings such as `seasonal-version-71` and `regional-version-72`. The `vendor` column names the vendor (e.g. `Feedback Ratings`, `Abbott Laboratories`, `American Express`, `Whatsapp Inc.`). The boolean `is_automated` flag (false for tools 1000 and 1002, true for 1001 and 1003) indicates whether the tool runs autonomously. The `last_run_date` column records the most recent execution (e.g. `2022-01-02` for tool 1000). Foreign keys `server_id` and `system_metric_id` link each monitoring tool to the server it operates on and the metric it produces.

**Table `monitoring_tools`**

| id | tool_id | tool_name | version | vendor | is_automated | last_run_date | server_id | system_metric_id |
|---|---|---|---|---|---|---|---|---|
| 1000 | comi | Composite Model | seasonal-version-71 | Feedback Ratings | false | 2022-01-02 | 1 | 1 |
| 1001 | 195360 | Compact Cluster A | regional-version-72 | Abbott Laboratories | true | 2023-06-13 | 2 | 2 |
| 1002 | 3355763 | Legacy Review | legacy-version-73 | American Express | false | 2024-11-24 | 3 | 3 |
| 1003 | 8387539 | Regional Initiative | compact-version-74 | Whatsapp Inc. | true | 2025-04-08 | 4 | 4 |

The `audit_logs` table records every action taken within the system. Its surrogate primary key is `audit_log_id`, while the natural `log_id` carries UUIDs such as `d5dc19c8-8fc1-11eb-924d-9cd76263cbd0` and `2618582`. The `action_type` column classifies the action (e.g. `compact-action-62`, `composite-action-63`, `primary-action-64`, `adaptive-action-65`), and `user_id` carries the identifier of the user who performed the action (e.g. `9736910`, `40c1e50ce74c42d6801b1e2f409c1cfc`). The `timestamp` column records when the action occurred, and `status` carries values like `regional-status-84` and `legacy-status-85`. The boolean `is_suspicious` flag (true for logs 1 and 3, false for 2 and 4) marks potentially concerning actions. Foreign keys `monitoring_tool_id` and `system_metric_id` bind each audit log to the monitoring tool and system metric it references.

**Table `audit_logs`**

| audit_log_id | log_id | action_type | user_id | timestamp | status | is_suspicious | monitoring_tool_id | system_metric_id |
|---|---|---|---|---|---|---|---|---|
| 1 | d5dc19c8-8fc1-11eb-924d-9cd76263cbd0 | compact-action-62 | 9736910 | 2024-07-08T18:18:00 | regional-status-84 | true | 1000 | 1 |
| 2 | 2618582 | composite-action-63 | 40c1e50ce74c42d6801b1e2f409c1cfc | 2025-12-19T01:35:00 | legacy-status-85 | false | 1001 | 2 |
| 3 | 10449536 | primary-action-64 | 92297f70-9bad-11eb-a8a2-19ed5c03f8d3 | 2022-05-03T08:52:00 | compact-status-86 | true | 1002 | 3 |
| 4 | 6564387 | adaptive-action-65 | 9125634 | 2023-10-14T15:09:00 | composite-status-87 | false | 1003 | 4 |

### Foreign-Key Topology and Cardinality

The foreign-key graph forms a star-like topology centred on `servers`. Every server row carries three foreign keys — `office_id`, `software_version_id`, and `system_metric_id` — creating a many-to-one relationship from servers to offices, to software versions, and to system metrics respectively. This means each server is associated with exactly one office, one software version, and one system metric, while each office, software version, and system metric can be referenced by multiple servers. The `offices` table mirrors this pattern with its own `server_id` and `software_version_id` foreign keys, creating a bidirectional linkage: an office points to its server and software version, and the server points back to its office and software version.

The `software_versions` table also carries `office_id` and `server_id` foreign keys, reinforcing the same bidirectional relationships from the software side. The `system_metrics` table carries `server_id` and `monitoring_tool_id`, linking each metric to its source server and the tool that collected it. The `monitoring_tools` table carries `server_id` and `system_metric_id`, creating a reciprocal link: each tool operates on a server and produces a metric. Finally, the `audit_logs` table carries `monitoring_tool_id` and `system_metric_id`, tying every audit entry to the tool and metric it documents.

This topology ensures that any domain fact — such as "which software version runs on the server in office 1" or "which monitoring tool collected the anomalous metric from server 3" — can be reconstructed through a single join across two tables. The views below materialise these joins as named queries.

### Materialised Views

Each view is a named join that answers a specific domain question by pulling columns from two base tables. The following sections interpret each view's result, reading concrete rows as evidence.

The view `v_office_server` joins `offices` to `servers` on the shared `office_id` and `server_id` columns, answering the question "which server resides in which office?" The first row pairs office 1 (`integrated-city-34`, `compact-country-26`, active) with server `911352d5dab64576b7a6da51aa69d76d` (model `composite-model-81`, partition type `legacy-partitio-91`, 13 ipars, status `regional-status-84`). The second row pairs office 2 (`seasonal-city-35`, `composite-country-27`, inactive) with server `1450637` (model `primary-model-82`, partition type `compact-partitio-92`, 15 ipars, status `legacy-status-85`).

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

The view `v_office_software_version` joins `offices` to `software_versions` on `office_id` and `software_version_id`, answering "which software version is deployed in which office?" The first row links office 1 with software version `gd_taxc_2111` (`Integrated Protocol A`, version `VER-2245`, released `2022-09-07`, not obsolete, maintenance status `extended-maintena-33`). The second row links office 2 with software version `5917273` (`Extended Programme`, version `VER-2249`, released `2023-02-18`, obsolete, maintenance status `integrated-maintena-34`).

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

The view `v_server_office` is the inverse of `v_office_server`: it joins `servers` to `offices` on the same keys, answering "which office does this server belong to?" The first row shows server `911352d5dab64576b7a6da51aa69d76d` (model `composite-model-81`, status `regional-status-84`, last health check `2023-10-23`) belonging to office 1 (`integrated-city-34`, `distributed-region-12`, `compact-country-26`, active, established `2024-03-27`). The fourth row shows server `9736887` (model `distributed-model-84`, status `composite-status-87`, last health check `2022-01-02`) belonging to office 4 (`legacy-city-37`, `extended-region-15`, `adaptive-country-29`, inactive, established `2023-06-06`).

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

The view `v_server_software_version` joins `servers` to `software_versions` on `software_version_id`, answering "which software version runs on this server?" The first row pairs server `911352d5dab64576b7a6da51aa69d76d` (model `composite-model-81`, partition type `legacy-partitio-91`, 13 ipars) with software version `gd_taxc_2111` (`Integrated Protocol A`, version `VER-2245`, released `2022-09-07`, not obsolete). The third row pairs server `4985152` (model `adaptive-model-83`, partition type `composite-partitio-93`, 4 ipars) with software version `id_4` (`Pilot Standard`, version `VER-2253`, released `2024-07-02`, not obsolete).

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

The view `v_server_system_metric` joins `servers` to `system_metrics` on `system_metric_id`, answering "which system metric is produced by this server?" The first row links server `911352d5dab64576b7a6da51aa69d76d` (model `composite-model-81`, status `regional-status-84`) with metric `3744010` (type `extended-metric-87`, value 19.95, timestamp `2024-07-08T18:18:00`, unit `distributed-unit-18`, anomalous). The fourth row links server `9736887` (model `distributed-model-84`, status `composite-status-87`) with metric `2002007020010` (type `regional-metric-90`, value 25.80, timestamp `2023-10-14T15:09:00`, unit `extended-unit-21`, not anomalous).

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

The view `v_software_version_office` joins `software_versions` to `offices` on `office_id`, answering "which office hosts this software version?" The first row shows software version `gd_taxc_2111` (`Integrated Protocol A`, version `VER-2245`, released `2022-09-07`, not obsolete, maintenance status `extended-maintena-33`) hosted in office 1 (`integrated-city-34`, `distributed-region-12`, `compact-country-26`, active, established `2024-03-27`). The fourth row shows software version `8928496` (`Baseline Framework D`, version `VER-2257`, released `2025-12-13`, obsolete, maintenance status `regional-maintena-36`) hosted in office 4 (`legacy-city-37`, `extended-region-15`, `adaptive-country-29`, inactive, established `2023-06-06`).

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

The view `v_software_version_server` joins `software_versions` to `servers` on `server_id`, answering "which server runs this software version?" The first row links software version `gd_taxc_2111` (`Integrated Protocol A`, version `VER-2245`, released `2022-09-07`, not obsolete) to server `911352d5dab64576b7a6da51aa69d76d` (model `composite-model-81`, partition type `legacy-partitio-91`, 13 ipars, status `regional-status-84`, last health check `2023-10-23`). The third row links software version `id_4` (`Pilot Standard`, version `VER-2253`, released `2024-07-02`, not obsolete) to server `4985152` (model `adaptive-model-83`, partition type `composite-partitio-93`, 4 ipars, status `compact-status-86`, last health check `2025-08-18`).

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

The view `v_system_metric_server` joins `system_metrics` to `servers` on `server_id`, answering "which server produced this metric?" The first row shows metric `3744010` (type `extended-metric-87`, value 19.95, timestamp `2024-07-08T18:18:00`, unit `distributed-unit-18`, anomalous) produced by server `911352d5dab64576b7a6da51aa69d76d` (model `composite-model-81`, partition type `legacy-partitio-91`, 13 ipars, status `regional-status-84`). The second row shows metric `136630a8-8fcc-11eb-924d-9cd76263cbd0` (type `integrated-metric-88`, value 21.90, timestamp `2025-12-19T01:35:00`, unit `baseline-unit-19`, not anomalous) produced by server `1450637` (model `primary-model-82`, partition type `compact-partitio-92`, 15 ipars, status `legacy-status-85`).

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

The view `v_system_metric_monitoring_tool` joins `system_metrics` to `monitoring_tools` on `monitoring_tool_id`, answering "which monitoring tool collected this metric?" The first row links metric `3744010` (type `extended-metric-87`, value 19.95, timestamp `2024-07-08T18:18:00`, unit `distributed-unit-18`, anomalous) to monitoring tool `comi` (`Composite Model`, version `seasonal-version-71`, vendor `Feedback Ratings`, not automated, last run `2022-01-02`). The third row links metric `2986226` (type `seasonal-metric-89`, value 23.85, timestamp `2022-05-03T08:52:00`, unit `pilot-unit-20`, anomalous) to monitoring tool `3355763` (`Legacy Review`, version `legacy-version-73`, vendor `American Express`, not automated, last run `2024-11-24`).

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

The view `v_monitoring_tool_server` joins `monitoring_tools` to `servers` on `server_id`, answering "which server does this monitoring tool operate on?" The first row shows monitoring tool `comi` (`Composite Model`, version `seasonal-version-71`, vendor `Feedback Ratings`, not automated, last run `2022-01-02`) operating on server `911352d5dab64576b7a6da51aa69d76d` (model `composite-model-81`, partition type `legacy-partitio-91`, 13 ipars, status `regional-status-84`, last health check `2023-10-23`). The fourth row shows monitoring tool `8387539` (`Regional Initiative`, version `compact-version-74`, vendor `Whatsapp Inc.`, automated, last run `2025-04-08`) operating on server `9736887` (model `distributed-model-84`, partition type `primary-partitio-94`, 4 ipars, status `composite-status-87`, last health check `2022-01-02`).

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

The view `v_monitoring_tool_system_metric` joins `monitoring_tools` to `system_metrics` on `system_metric_id`, answering "which system metric does this monitoring tool produce?" The first row links monitoring tool `comi` (`Composite Model`, version `seasonal-version-71`, vendor `Feedback Ratings`, not automated, last run `2022-01-02`) to metric `3744010` (type `extended-metric-87`, value 19.95, timestamp `2024-07-08T18:18:00`, unit `distributed-unit-18`, anomalous). The second row links monitoring tool `195360` (`Compact Cluster A`, version `regional-version-72`, vendor `Abbott Laboratories`, automated, last run `2023-06-13`) to metric `136630a8-8fcc-11eb-924d-9cd76263cbd0` (type `integrated-metric-88`, value 21.90, timestamp `2025-12-19T01:35:00`, unit `baseline-unit-19`, not anomalous).

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

The view `v_audit_log_monitoring_tool` joins `audit_logs` to `monitoring_tools` on `monitoring_tool_id`, answering "which monitoring tool is referenced by this audit log?" The first row links audit log `d5dc19c8-8fc1-11eb-924d-9cd76263cbd0` (action type `compact-action-62`, user `9736910`, timestamp `2024-07-08T18:18:00`, status `regional-status-84`, suspicious) to monitoring tool `comi` (`Composite Model`, version `seasonal-version-71`, vendor `Feedback Ratings`, not automated, last run `2022-01-02`). The third row links audit log `10449536` (action type `primary-action-64`, user `92297f70-9bad-11eb-a8a2-19ed5c03f8d3`, timestamp `2022-05-03T08:52:00`, status `compact-status-86`, suspicious) to monitoring tool `3355763` (`Legacy Review`, version `legacy-version-73`, vendor `American Express`, not automated, last run `2024-11-24`).

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

The view `v_audit_log_system_metric` joins `audit_logs` to `system_metrics` on `system_metric_id`, answering "which system metric is referenced by this audit log?" The first row links audit log `d5dc19c8-8fc1-11eb-924d-9cd76263cbd0` (action type `compact-action-62`, user `9736910`, timestamp `2024-07-08T18:18:00`, status `regional-status-84`, suspicious) to metric `3744010` (type `extended-metric-87`, value 19.95, timestamp `2024-07-08T18:18:00`, unit `distributed-unit-18`, anomalous). The fourth row links audit log `6564387` (action type `adaptive-action-65`, user `9125634`, timestamp `2023-10-14T15:09:00`, status `composite-status-87`, not suspicious) to metric `2002007020010` (type `regional-metric-90`, value 25.80, timestamp `2023-10-14T15:09:00`, unit `extended-unit-21`, not anomalous).

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

### Synthesis

The relational schema materialises the infrastructure observability ontology through a disciplined separation of concerns: each entity type occupies its own table, attributes become columns, and relationships are encoded as foreign keys. The `servers` table sits at the centre of the foreign-key graph, linking offices, software versions, and system metrics in a single hop. The `offices` and `software_versions` tables mirror these links from their own perspectives, creating bidirectional relationships that support queries from either direction. The `system_metrics`, `monitoring_tools`, and `audit_logs` tables form a secondary chain that traces the provenance of every observation: a monitoring tool collects a metric from a server, and an audit log records the action. The twelve materialised views each answer a specific domain question by joining two tables along a single foreign-key edge, reconstructing the domain fact from the normalised tables in a single, efficient operation. This design ensures that every fact — from "office 1 hosts server `911352d5dab64576b7a6da51aa69d76d` running `Integrated Protocol A`" to "audit log `d5dc19c8-8fc1-11eb-924d-9cd76263cbd0` flagged a suspicious action by user `9736910` on metric `3744010` collected by tool `comi`" — is queryable through a single join, preserving both the clarity of the ontology and the efficiency of the relational model.