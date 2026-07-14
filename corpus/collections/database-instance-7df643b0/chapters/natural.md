## Infrastructure Management in Enterprise Database Environments

Enterprise database operations rest on a structured ecosystem of computing resources, storage architectures, and human expertise. At the core of this ecosystem are database instances—software engines running on physical or virtual server hosts, backed by organized storage structures, managed by database administrators, and evaluated through periodic performance reports. Maintenance tasks bridge the gap between daily operations and long-term system health, each assigned to a specific administrator and tied to a particular instance. Understanding how these elements interlock requires examining the records that capture every dimension of the deployment: the instance itself, the host it inhabits, the storage it consumes, the people who maintain it, the work they perform, and the reports that measure outcomes.

**Table `database_instances`**

| instance_id | version | operating_system | status | environment_type | created_date | server_host_id | d_b_a_id | storage_structure_id |
|---|---|---|---|---|---|---|---|---|
| 26730215 | seasonal-version-71 | distributed-operatin-66 | production | RAC | 2024-11-19T22:30:00 | 1 | 1 | 100 |
| en_AU | regional-version-72 | baseline-operatin-67 | test | standalone | 2025-04-03T05:47:00 | 2 | 2 | 101 |
| IVC20det15 | legacy-version-73 | pilot-operatin-68 | development | RAC | 2022-09-14T12:04:00 | 3 | 3 | 102 |
| 937736 | compact-version-74 | extended-operatin-69 | production | standalone | 2023-02-25T19:21:00 | 4 | 4 | 103 |

Each database instance carries a unique identifier, a software version string, and an operating system designation. The `status` column records whether the instance is in production, test, or development, while `environment_type` distinguishes between RAC (Real Application Clusters) and standalone configurations. Instance `26730215`, running `seasonal-version-71` on `distributed-operatin-66`, operates in a production RAC environment and was provisioned on 2024-11-19. The instance labeled `en_AU` uses `regional-version-72` in a test standalone setup, created more recently on 2025-04-03. Instance `IVC20det15` represents a legacy deployment with `legacy-version-73` in a development RAC configuration, dating back to 2022-09-14. The compact instance `937736` runs `compact-version-74` as a production standalone, established on 2023-02-25. Every instance is linked to a server host, a DBA, and a storage structure through foreign keys, forming the backbone of the operational model.

**Table `server_hosts`**

| id | host_id | os_type | os_version | cpu_count | ram_g_b | san_allocation_g_b | instance_id |
|---|---|---|---|---|---|---|---|
| 1 | 575204 | extended-os-27 | integrated-os-46 | 5 | 8.70 | 17.70 | 26730215 |
| 2 | 9736903 | integrated-os-28 | seasonal-os-47 | 52 | 11.40 | 21.40 | en_AU |
| 3 | supp2 | seasonal-os-29 | regional-os-48 | 17 | 14.10 | 25.10 | IVC20det15 |
| 4 | lu_tax_code_template_m_I_2 | regional-os-30 | legacy-os-49 | 14 | 16.80 | 28.80 | 937736 |

Server hosts provide the compute and memory resources that database instances require. The `server_hosts` table records each host's operating system type and version, CPU count, RAM in gigabytes, and SAN allocation in gigabytes. Host `575204` runs `extended-os-27` with 5 CPUs, 8.70 GB of RAM, and 17.70 GB of SAN storage, hosting instance `26730215`. Host `9736903` is a substantially more capable machine, running `integrated-os-28` with 52 CPUs, 11.40 GB of RAM, and 21.40 GB of SAN allocation, assigned to instance `en_AU`. The host identified as `supp2` operates `seasonal-os-29` with 17 CPUs, 14.10 GB of RAM, and 25.10 GB of SAN, supporting instance `IVC20det15`. The fourth host, `lu_tax_code_template_m_I_2`, runs `regional-os-30` with 14 CPUs, 16.80 GB of RAM, and 28.80 GB of SAN, serving instance `937736`. The disparity in CPU counts—ranging from 5 to 52—reflects the varied workload demands across the deployment.

**Table `storage_structures`**

| id | structure_id | structure_type | size_g_b | storage_location | instance_id |
|---|---|---|---|---|---|
| 100 | 2405 | tablespace | 0.74 | distributed-storage-48 | 26730215 |
| 101 | 7441140 | datafile | 0.73 | baseline-storage-49 | en_AU |
| 102 | 7119772 | block | 0.286487255225401 | pilot-storage-50 | IVC20det15 |
| 103 | 1996930 | tablespace | 0.6000001 | extended-storage-51 | 937736 |

Storage structures define how data is organized and allocated for each database instance. The `storage_structures` table captures the structure type—whether a tablespace, datafile, or block—the size in gigabytes, and the storage location designation. Instance `26730215` uses structure `2405`, a tablespace of 0.74 GB located in `distributed-storage-48`. Instance `en_AU` relies on structure `7441140`, a datafile of 0.73 GB in `baseline-storage-49`. Instance `IVC20det15` is associated with structure `7119772`, a block-level allocation of approximately 0.286 GB in `pilot-storage-50`. Instance `937736` uses structure `1996930`, a tablespace of roughly 0.6 GB in `extended-storage-51`. The variation in structure types and sizes illustrates the diverse storage strategies employed across different environments.

**Table `d_b_as`**

| d_b_a_id | dba_id | name | years_experience | specialization | employer | instance_id | maintenance_task_id |
|---|---|---|---|---|---|---|---|
| 1 | L441 | Extended Review | 16 | legacy-speciali-13 | National University of Singapore | 26730215 | 1000 |
| 2 | 4447035 | Pilot Initiative A | 22 | compact-speciali-14 | Occidental Petroleum | en_AU | 1001 |
| 3 | 2106707 | Baseline Model | 28 | composite-speciali-15 | ChargePoint Holdings. | IVC20det15 | 1002 |
| 4 | 5f90765e-8fcd-11eb-924d-9cd76263cbd0 | Distributed Cluster | 34 | primary-speciali-16 | Ninja Van | 937736 | 1003 |

Database administrators are the human operators responsible for the health and performance of each instance. The `d_b_as` table records each DBA's identifier, name, years of experience, specialization area, and employer. DBA `L441`, named Extended Review, brings 16 years of experience with a legacy-speciali-13 focus, employed by the National University of Singapore, and is assigned to instance `26730215`. DBA `4447035`, Pilot Initiative A, has 22 years of experience in compact-speciali-14 and works at Occidental Petroleum, managing instance `en_AU`. DBA `2106707`, Baseline Model, possesses 28 years of experience in composite-speciali-15 at ChargePoint Holdings., overseeing instance `IVC20det15`. DBA `5f90765e-8fcd-11eb-924d-9cd76263cbd0`, Distributed Cluster, has the most experience at 34 years with a primary-speciali-16 specialization at Ninja Van, responsible for instance `937736`. Each DBA is also linked to a maintenance task, creating a direct line of accountability.

**Table `maintenance_tasks`**

| id | task_id | task_type | start_date | end_date | status | tool_used | d_b_a_id | instance_id |
|---|---|---|---|---|---|---|---|---|
| 1000 | 7731870 | backup | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | pending | extended-tool-75 | 1 | 26730215 |
| 1001 | id_28 | recovery | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | running | integrated-tool-76 | 2 | en_AU |
| 1002 | 7119763 | tuning | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | complete | seasonal-tool-77 | 3 | IVC20det15 |
| 1003 | lu_tax_code_template_m82 | patching | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | failed | regional-tool-78 | 4 | 937736 |

Maintenance tasks represent the operational work performed on database instances, ranging from backups and recoveries to tuning and patching. The `maintenance_tasks` table records the task type, start and end dates, current status, and the tool used to execute the work. Task `7731870` is a backup operation for instance `26730215`, initiated on 2022-09-05 with a scheduled end of 2022-09-01, currently in pending status and using `extended-tool-75`. Task `id_28` is a recovery operation for instance `en_AU`, started on 2023-02-16 with an end date of 2023-02-12, running at the time of capture and employing `integrated-tool-76`. Task `7119763` is a tuning operation for instance `IVC20det15`, beginning on 2024-07-27 with an end of 2024-07-23, marked as complete and using `seasonal-tool-77`. Task `lu_tax_code_template_m82` is a patching operation for instance `937736`, started on 2025-12-11 with an end of 2025-12-07, reported as failed and utilizing `regional-tool-78`. The status values—pending, running, complete, and failed—provide a real-time snapshot of operational health.

**Table `performance_reports`**

| performance_report_id | report_id | report_type | generated_date | duration_hours | top_wait_event | instance_id | d_b_a_id |
|---|---|---|---|---|---|---|---|
| 1 | 1202-0008-S | STATSPACK | 2024-11-04T10:30:00 | 3.70 | distributed-top-78 | 26730215 | 1 |
| 2 | 8189500 | AWR | 2025-04-15T17:47:00 | 7.40 | baseline-top-79 | en_AU | 2 |
| 3 | L355 | ADDM | 2022-09-26T00:04:00 | 11.10 | pilot-top-80 | IVC20det15 | 3 |
| 4 | 5844272 | STATSPACK | 2023-02-10T07:21:00 | 14.80 | extended-top-81 | 937736 | 4 |

Performance reports quantify the behavior of database instances over defined measurement windows. The `performance_reports` table captures the report type—STATSPACK, AWR, or ADDM—the generation date, the duration of the measurement window in hours, and the top wait event observed. Report `1202-0008-S` is a STATSPACK report for instance `26730215`, generated on 2024-11-04, covering a 3.70-hour window with `distributed-top-78` as the top wait event. Report `8189500` is an AWR report for instance `en_AU`, created on 2025-04-15, spanning 7.40 hours with `baseline-top-79` as the primary bottleneck. Report `L355` is an ADDM report for instance `IVC20det15`, produced on 2022-09-26, with an 11.10-hour measurement period and `pilot-top-80` as the top wait event. Report `5844272` is a STATSPACK report for instance `937736`, generated on 2023-02-10, covering the longest window at 14.80 hours with `extended-top-81` as the dominant wait event.

The relationships between these records become most visible through joined views, which answer specific operational questions by combining data from multiple base tables.

**View `database_instance_server_host_view`**

```sql
CREATE VIEW database_instance_server_host_view AS
SELECT a.instance_id, a.version, a.operating_system, a.status, b.id AS host_id, b.host_id AS host_host_id, b.os_type AS host_os_type
FROM database_instances a JOIN server_hosts b ON a.server_host_id = b.id;
```

| instance_id | version | operating_system | status | host_id | host_host_id | host_os_type |
|---|---|---|---|---|---|---|
| 26730215 | seasonal-version-71 | distributed-operatin-66 | production | 1 | 575204 | extended-os-27 |
| en_AU | regional-version-72 | baseline-operatin-67 | test | 2 | 9736903 | integrated-os-28 |
| IVC20det15 | legacy-version-73 | pilot-operatin-68 | development | 3 | supp2 | seasonal-os-29 |
| 937736 | compact-version-74 | extended-operatin-69 | production | 4 | lu_tax_code_template_m_I_2 | regional-os-30 |

This view answers the question: which server host is each database instance running on, and what are the host's resource specifications? The join links `database_instances` to `server_hosts` through the `server_host_id` foreign key. Row one shows instance `26730215` running on host `575204`, a machine with 5 CPUs and 8.70 GB of RAM. Row two reveals instance `en_AU` on host `9736903`, a significantly more powerful host with 52 CPUs and 11.40 GB of RAM. The view makes it immediately apparent that the test instance `en_AU` is allocated more compute resources than the production instance `26730215`, a configuration choice that may reflect testing requirements or resource optimization strategies.

**View `database_instance_d_b_a_view`**

```sql
CREATE VIEW database_instance_d_b_a_view AS
SELECT a.instance_id, a.version, a.operating_system, a.status, b.d_b_a_id AS a_d_b_a_id, b.dba_id AS a_dba_id, b.name AS a_name
FROM database_instances a JOIN d_b_as b ON a.d_b_a_id = b.d_b_a_id;
```

| instance_id | version | operating_system | status | a_d_b_a_id | a_dba_id | a_name |
|---|---|---|---|---|---|---|
| 26730215 | seasonal-version-71 | distributed-operatin-66 | production | 1 | L441 | Extended Review |
| en_AU | regional-version-72 | baseline-operatin-67 | test | 2 | 4447035 | Pilot Initiative A |
| IVC20det15 | legacy-version-73 | pilot-operatin-68 | development | 3 | 2106707 | Baseline Model |
| 937736 | compact-version-74 | extended-operatin-69 | production | 4 | 5f90765e-8fcd-11eb-924d-9cd76263cbd0 | Distributed Cluster |

This view answers: which database administrator is responsible for each instance? By joining `database_instances` with `d_b_as` on the `d_b_a_id` key, the view pairs each instance with its managing DBA's name, experience level, and employer. Instance `26730215` is managed by Extended Review, a DBA with 16 years of experience at the National University of Singapore. Instance `en_AU` falls under Pilot Initiative A, who has 22 years of experience at Occidental Petroleum. Instance `IVC20det15` is overseen by Baseline Model with 28 years of experience at ChargePoint Holdings. Instance `937736` is managed by Distributed Cluster, the most experienced DBA at 34 years, employed by Ninja Van. The view provides a clear accountability map across the entire deployment.

**View `database_instance_storage_structure_view`**

```sql
CREATE VIEW database_instance_storage_structure_view AS
SELECT a.instance_id, a.version, a.operating_system, a.status, b.id AS structure_id, b.structure_id AS structure_structure_id, b.structure_type AS structure_structure_type
FROM database_instances a JOIN storage_structures b ON a.storage_structure_id = b.id;
```

| instance_id | version | operating_system | status | structure_id | structure_structure_id | structure_structure_type |
|---|---|---|---|---|---|---|
| 26730215 | seasonal-version-71 | distributed-operatin-66 | production | 100 | 2405 | tablespace |
| en_AU | regional-version-72 | baseline-operatin-67 | test | 101 | 7441140 | datafile |
| IVC20det15 | legacy-version-73 | pilot-operatin-68 | development | 102 | 7119772 | block |
| 937736 | compact-version-74 | extended-operatin-69 | production | 103 | 1996930 | tablespace |

This view answers: what storage structure is allocated to each database instance? The join between `database_instances` and `storage_structures` on `storage_structure_id` reveals the storage allocation for each instance. Instance `26730215` uses a tablespace structure of 0.74 GB in `distributed-storage-48`. Instance `en_AU` uses a datafile structure of 0.73 GB in `baseline-storage-49`. Instance `IVC20det15` uses a block-level structure of approximately 0.286 GB in `pilot-storage-50`. Instance `937736` uses a tablespace structure of approximately 0.6 GB in `extended-storage-51`. The view highlights the diversity in storage granularity, from block-level allocations to full tablespaces, reflecting different data management strategies.

**View `server_host_database_instance_view`**

```sql
CREATE VIEW server_host_database_instance_view AS
SELECT a.id, a.host_id, a.os_type, a.os_version, b.instance_id AS instance_instance_id, b.version AS instance_version, b.operating_system AS instance_operating_system
FROM server_hosts a JOIN database_instances b ON a.instance_id = b.instance_id;
```

| id | host_id | os_type | os_version | instance_instance_id | instance_version | instance_operating_system |
|---|---|---|---|---|---|---|
| 1 | 575204 | extended-os-27 | integrated-os-46 | 26730215 | seasonal-version-71 | distributed-operatin-66 |
| 2 | 9736903 | integrated-os-28 | seasonal-os-47 | en_AU | regional-version-72 | baseline-operatin-67 |
| 3 | supp2 | seasonal-os-29 | regional-os-48 | IVC20det15 | legacy-version-73 | pilot-operatin-68 |
| 4 | lu_tax_code_template_m_I_2 | regional-os-30 | legacy-os-49 | 937736 | compact-version-74 | extended-operatin-69 |

This view reverses the perspective, answering: which database instances are hosted on each server? The join from `server_hosts` to `database_instances` through `instance_id` provides a host-centric view of the deployment. Host `575204` runs instance `26730215`, a production RAC instance. Host `9736903` runs instance `en_AU`, a test standalone instance. Host `supp2` runs instance `IVC20det15`, a development RAC instance. Host `lu_tax_code_template_m_I_2` runs instance `937736`, a production standalone instance. This host-centric view is particularly useful for capacity planning, as it shows the compute resource allocation per instance and helps identify hosts that may be under or over-utilized.

**View `storage_structure_database_instance_view`**

```sql
CREATE VIEW storage_structure_database_instance_view AS
SELECT a.id, a.structure_id, a.structure_type, a.size_g_b, b.instance_id AS instance_instance_id, b.version AS instance_version, b.operating_system AS instance_operating_system
FROM storage_structures a JOIN database_instances b ON a.instance_id = b.instance_id;
```

| id | structure_id | structure_type | size_g_b | instance_instance_id | instance_version | instance_operating_system |
|---|---|---|---|---|---|---|
| 100 | 2405 | tablespace | 0.74 | 26730215 | seasonal-version-71 | distributed-operatin-66 |
| 101 | 7441140 | datafile | 0.73 | en_AU | regional-version-72 | baseline-operatin-67 |
| 102 | 7119772 | block | 0.286487255225401 | IVC20det15 | legacy-version-73 | pilot-operatin-68 |
| 103 | 1996930 | tablespace | 0.6000001 | 937736 | compact-version-74 | extended-operatin-69 |

This view provides a storage-centric perspective, answering: which database instance uses each storage structure? The join from `storage_structures` to `database_instances` on `instance_id` maps storage resources back to their consumers. Structure `2405` (a 0.74 GB tablespace in `distributed-storage-48`) serves instance `26730215`. Structure `7441140` (a 0.73 GB datafile in `baseline-storage-49`) serves instance `en_AU`. Structure `7119772` (a 0.286 GB block in `pilot-storage-50`) serves instance `IVC20det15`. Structure `1996930` (a 0.6 GB tablespace in `extended-storage-51`) serves instance `937736`. This view is valuable for storage capacity forecasting and for identifying storage structures that may need expansion as instances grow.

**View `d_b_a_database_instance_view`**

```sql
CREATE VIEW d_b_a_database_instance_view AS
SELECT a.d_b_a_id, a.dba_id, a.name, a.years_experience, b.instance_id AS instance_instance_id, b.version AS instance_version, b.operating_system AS instance_operating_system
FROM d_b_as a JOIN database_instances b ON a.instance_id = b.instance_id;
```

| d_b_a_id | dba_id | name | years_experience | instance_instance_id | instance_version | instance_operating_system |
|---|---|---|---|---|---|---|
| 1 | L441 | Extended Review | 16 | 26730215 | seasonal-version-71 | distributed-operatin-66 |
| 2 | 4447035 | Pilot Initiative A | 22 | en_AU | regional-version-72 | baseline-operatin-67 |
| 3 | 2106707 | Baseline Model | 28 | IVC20det15 | legacy-version-73 | pilot-operatin-68 |
| 4 | 5f90765e-8fcd-11eb-924d-9cd76263cbd0 | Distributed Cluster | 34 | 937736 | compact-version-74 | extended-operatin-69 |

This view answers: which database instances is each DBA managing? The join from `d_b_as` to `database_instances` on `instance_id` provides a DBA-centric view of their responsibilities. Extended Review (DBA `L441`) manages instance `26730215`, a production RAC instance running seasonal-version-71. Pilot Initiative A (DBA `4447035`) manages instance `en_AU`, a test standalone instance running regional-version-72. Baseline Model (DBA `2106707`) manages instance `IVC20det15`, a development RAC instance running legacy-version-73. Distributed Cluster (DBA `5f90765e-8fcd-11eb-924d-9cd76263cbd0`) manages instance `937736`, a production standalone instance running compact-version-74. Each DBA is responsible for exactly one instance in this dataset, establishing a clear one-to-one accountability relationship.

**View `d_b_a_maintenance_task_view`**

```sql
CREATE VIEW d_b_a_maintenance_task_view AS
SELECT a.d_b_a_id, a.dba_id, a.name, a.years_experience, b.id AS task_id, b.task_id AS task_task_id, b.task_type AS task_task_type
FROM d_b_as a JOIN maintenance_tasks b ON a.maintenance_task_id = b.id;
```

| d_b_a_id | dba_id | name | years_experience | task_id | task_task_id | task_task_type |
|---|---|---|---|---|---|---|
| 1 | L441 | Extended Review | 16 | 1000 | 7731870 | backup |
| 2 | 4447035 | Pilot Initiative A | 22 | 1001 | id_28 | recovery |
| 3 | 2106707 | Baseline Model | 28 | 1002 | 7119763 | tuning |
| 4 | 5f90765e-8fcd-11eb-924d-9cd76263cbd0 | Distributed Cluster | 34 | 1003 | lu_tax_code_template_m82 | patching |

This view answers: what maintenance tasks has each DBA been assigned? The join from `d_b_as` to `maintenance_tasks` on `maintenance_task_id` links administrators to their operational responsibilities. Extended Review is assigned task `7731870`, a backup operation in pending status using `extended-tool-75`. Pilot Initiative A is assigned task `id_28`, a recovery operation currently running with `integrated-tool-76`. Baseline Model is assigned task `7119763`, a tuning operation that has been completed using `seasonal-tool-77`. Distributed Cluster is assigned task `lu_tax_code_template_m82`, a patching operation that has failed and used `regional-tool-78`. This view is essential for workload distribution analysis and for identifying DBAs whose tasks may require intervention, such as the failed patching operation.

**View `maintenance_task_d_b_a_view`**

```sql
CREATE VIEW maintenance_task_d_b_a_view AS
SELECT a.id, a.task_id, a.task_type, a.start_date, b.d_b_a_id AS a_d_b_a_id, b.dba_id AS a_dba_id, b.name AS a_name
FROM maintenance_tasks a JOIN d_b_as b ON a.d_b_a_id = b.d_b_a_id;
```

| id | task_id | task_type | start_date | a_d_b_a_id | a_dba_id | a_name |
|---|---|---|---|---|---|---|
| 1000 | 7731870 | backup | 2022-09-05T20:24:00 | 1 | L441 | Extended Review |
| 1001 | id_28 | recovery | 2023-02-16T03:41:00 | 2 | 4447035 | Pilot Initiative A |
| 1002 | 7119763 | tuning | 2024-07-27T10:58:00 | 3 | 2106707 | Baseline Model |
| 1003 | lu_tax_code_template_m82 | patching | 2025-12-11T17:15:00 | 4 | 5f90765e-8fcd-11eb-924d-9cd76263cbd0 | Distributed Cluster |

This view reverses the maintenance perspective, answering: which DBA is responsible for each maintenance task? The join from `maintenance_tasks` to `d_b_as` on `d_b_a_id` provides a task-centric accountability map. Task `7731870` (backup, pending) is assigned to Extended Review. Task `id_28` (recovery, running) is assigned to Pilot Initiative A. Task `7119763` (tuning, complete) is assigned to Baseline Model. Task `lu_tax_code_template_m82` (patching, failed) is assigned to Distributed Cluster. This view is particularly useful for operational dashboards, as it allows teams to quickly identify which administrator owns each active or problematic task.

**View `maintenance_task_database_instance_view`**

```sql
CREATE VIEW maintenance_task_database_instance_view AS
SELECT a.id, a.task_id, a.task_type, a.start_date, b.instance_id AS instance_instance_id, b.version AS instance_version, b.operating_system AS instance_operating_system
FROM maintenance_tasks a JOIN database_instances b ON a.instance_id = b.instance_id;
```

| id | task_id | task_type | start_date | instance_instance_id | instance_version | instance_operating_system |
|---|---|---|---|---|---|---|
| 1000 | 7731870 | backup | 2022-09-05T20:24:00 | 26730215 | seasonal-version-71 | distributed-operatin-66 |
| 1001 | id_28 | recovery | 2023-02-16T03:41:00 | en_AU | regional-version-72 | baseline-operatin-67 |
| 1002 | 7119763 | tuning | 2024-07-27T10:58:00 | IVC20det15 | legacy-version-73 | pilot-operatin-68 |
| 1003 | lu_tax_code_template_m82 | patching | 2025-12-11T17:15:00 | 937736 | compact-version-74 | extended-operatin-69 |

This view answers: which database instance is each maintenance task targeting? The join from `maintenance_tasks` to `database_instances` on `instance_id` connects operational work to its target system. Task `7731870` (backup) targets instance `26730215`, a production RAC instance. Task `id_28` (recovery) targets instance `en_AU`, a test standalone instance. Task `7119763` (tuning) targets instance `IVC20det15`, a development RAC instance. Task `lu_tax_code_template_m82` (patching) targets instance `937736`, a production standalone instance. This view is critical for impact analysis, as it shows which instances are affected by pending, running, or failed maintenance operations.

**View `performance_report_database_instance_view`**

```sql
CREATE VIEW performance_report_database_instance_view AS
SELECT a.performance_report_id, a.report_id, a.report_type, a.generated_date, b.instance_id AS instance_instance_id, b.version AS instance_version, b.operating_system AS instance_operating_system
FROM performance_reports a JOIN database_instances b ON a.instance_id = b.instance_id;
```

| performance_report_id | report_id | report_type | generated_date | instance_instance_id | instance_version | instance_operating_system |
|---|---|---|---|---|---|---|
| 1 | 1202-0008-S | STATSPACK | 2024-11-04T10:30:00 | 26730215 | seasonal-version-71 | distributed-operatin-66 |
| 2 | 8189500 | AWR | 2025-04-15T17:47:00 | en_AU | regional-version-72 | baseline-operatin-67 |
| 3 | L355 | ADDM | 2022-09-26T00:04:00 | IVC20det15 | legacy-version-73 | pilot-operatin-68 |
| 4 | 5844272 | STATSPACK | 2023-02-10T07:21:00 | 937736 | compact-version-74 | extended-operatin-69 |

This view answers: which performance reports have been generated for each database instance? The join from `performance_reports` to `database_instances` on `instance_id` links measurement data to its source system. Report `1202-0008-S` (STATSPACK, 3.70 hours) was generated for instance `26730215`. Report `8189500` (AWR, 7.40 hours) was generated for instance `en_AU`. Report `L355` (ADDM, 11.10 hours) was generated for instance `IVC20det15`. Report `5844272` (STATSPACK, 14.80 hours) was generated for instance `937736`. The view reveals the measurement cadence and depth across instances, with instance `937736` having the longest measurement window and instance `26730215` the shortest.

**View `performance_report_d_b_a_view`**

```sql
CREATE VIEW performance_report_d_b_a_view AS
SELECT a.performance_report_id, a.report_id, a.report_type, a.generated_date, b.d_b_a_id AS a_d_b_a_id, b.dba_id AS a_dba_id, b.name AS a_name
FROM performance_reports a JOIN d_b_as b ON a.d_b_a_id = b.d_b_a_id;
```

| performance_report_id | report_id | report_type | generated_date | a_d_b_a_id | a_dba_id | a_name |
|---|---|---|---|---|---|---|
| 1 | 1202-0008-S | STATSPACK | 2024-11-04T10:30:00 | 1 | L441 | Extended Review |
| 2 | 8189500 | AWR | 2025-04-15T17:47:00 | 2 | 4447035 | Pilot Initiative A |
| 3 | L355 | ADDM | 2022-09-26T00:04:00 | 3 | 2106707 | Baseline Model |
| 4 | 5844272 | STATSPACK | 2023-02-10T07:21:00 | 4 | 5f90765e-8fcd-11eb-924d-9cd76263cbd0 | Distributed Cluster |

This view answers: which performance reports has each DBA generated or reviewed? The join from `performance_reports` to `d_b_as` on `d_b_a_id` connects measurement outcomes to the administrators responsible. Report `1202-0008-S` (STATSPACK) is associated with Extended Review. Report `8189500` (AWR) is associated with Pilot Initiative A. Report `L355` (ADDM) is associated with Baseline Model. Report `5844272` (STATSPACK) is associated with Distributed Cluster. This view supports performance review workflows by showing which administrator should be consulted for each report's findings and recommendations.

The records across these tables and views form a coherent operational model of enterprise database infrastructure. Each database instance sits on a server host, consumes a storage structure, is managed by a database administrator, undergoes maintenance tasks, and is evaluated through performance reports. The foreign-key relationships between these entities create a navigable graph: from any instance, one can trace to its host, its storage, its administrator, its tasks, and its reports. From any administrator, one can trace to their instance, their task, and their reports. From any task, one can trace to its instance and its administrator. This interconnected structure enables comprehensive operational visibility, supporting everything from capacity planning and workload distribution to incident response and performance optimization. The specific values—version strings, resource allocations, experience levels, task statuses, and measurement windows—provide the granular detail needed for informed decision-making across the entire database operations lifecycle.