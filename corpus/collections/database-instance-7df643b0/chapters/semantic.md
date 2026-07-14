## Modelling the Database Infrastructure Domain

The domain under examination captures the operational lifecycle of an enterprise database platform, where software instances, physical hosts, storage allocations, human administrators, and maintenance activities interlock to sustain production workloads. At the centre of the model sits the `database_instances` table, which records each deployed database engine along with its version, operating system, deployment status, and environment classification. Surrounding it are five supporting tables that capture the infrastructure and human resources required to keep those instances running: `server_hosts` for the compute nodes, `storage_structures` for the underlying storage allocations, `d_b_as` for the administrators responsible for each instance, `maintenance_tasks` for scheduled and ad-hoc operations, and `performance_reports` for the periodic health assessments. The model is normalised to third normal form, and a suite of twelve views materialises the most common join paths so that analysts can reconstruct domain facts without writing ad-hoc SQL.

**Table `database_instances`**

| instance_id | version | operating_system | status | environment_type | created_date | server_host_id | d_b_a_id | storage_structure_id |
|---|---|---|---|---|---|---|---|---|
| 26730215 | seasonal-version-71 | distributed-operatin-66 | production | RAC | 2024-11-19T22:30:00 | 1 | 1 | 100 |
| en_AU | regional-version-72 | baseline-operatin-67 | test | standalone | 2025-04-03T05:47:00 | 2 | 2 | 101 |
| IVC20det15 | legacy-version-73 | pilot-operatin-68 | development | RAC | 2022-09-14T12:04:00 | 3 | 3 | 102 |
| 937736 | compact-version-74 | extended-operatin-69 | production | standalone | 2023-02-25T19:21:00 | 4 | 4 | 103 |

The `database_instances` table is the hub of the schema. Its primary key, `instance_id`, is a heterogeneous identifier — the first row carries the integer-like value `26730215`, the second carries the locale-style string `en_AU`, the third carries the Oracle-style identifier `IVC20det15`, and the fourth carries the short integer `937736`. This heterogeneity is intentional: the model accommodates instances provisioned under different naming conventions without enforcing a single format. The `version` column stores human-readable version strings such as `seasonal-version-71` and `regional-version-72`, while `operating_system` records the host OS flavour, for example `distributed-operatin-66` or `baseline-operatin-67`. The `status` column distinguishes `production`, `test`, and `development` deployments, and `environment_type` further classifies each instance as either `RAC` (Real Application Clusters) or `standalone`. The `created_date` column is a timestamp in ISO-8601 format, ranging from `2022-09-14T12:04:00` to `2025-04-03T05:47:00` across the four rows. Three foreign keys anchor the instance to its supporting resources: `server_host_id` references `server_hosts`, `d_b_a_id` references `d_b_as`, and `storage_structure_id` references `storage_structures`. Each instance is thus a composite fact — a specific software release running on a specific host, managed by a specific administrator, backed by a specific storage structure.

**Table `server_hosts`**

| id | host_id | os_type | os_version | cpu_count | ram_g_b | san_allocation_g_b | instance_id |
|---|---|---|---|---|---|---|---|
| 1 | 575204 | extended-os-27 | integrated-os-46 | 5 | 8.70 | 17.70 | 26730215 |
| 2 | 9736903 | integrated-os-28 | seasonal-os-47 | 52 | 11.40 | 21.40 | en_AU |
| 3 | supp2 | seasonal-os-29 | regional-os-48 | 17 | 14.10 | 25.10 | IVC20det15 |
| 4 | lu_tax_code_template_m_I_2 | regional-os-30 | legacy-os-49 | 14 | 16.80 | 28.80 | 937736 |

The `server_hosts` table describes the compute infrastructure. Its surrogate primary key `id` is a small integer (1 through 4), while the business identifier `host_id` carries values such as `575204`, `9736903`, `supp2`, and `lu_tax_code_template_m_I_2`. The `os_type` and `os_version` columns together describe the operating system installed on the host; for instance, host `supp2` runs `seasonal-os-29` at version `regional-os-48`. The `cpu_count` column is an integer ranging from 5 to 52 cores, `ram_g_b` stores memory in gigabytes (8.70 to 16.80 GB in the sample), and `san_allocation_g_b` records the SAN storage quota (17.70 to 28.80 GB). The foreign key `instance_id` links each host row back to exactly one database instance, establishing a one-to-one physical placement relationship in this dataset. The view `database_instance_server_host_view` joins `database_instances` to `server_hosts` on this key, answering the question "which host runs which instance?" — for example, instance `26730215` is placed on host `575204`, which has 5 CPUs and 8.70 GB of RAM.

**Table `storage_structures`**

| id | structure_id | structure_type | size_g_b | storage_location | instance_id |
|---|---|---|---|---|---|
| 100 | 2405 | tablespace | 0.74 | distributed-storage-48 | 26730215 |
| 101 | 7441140 | datafile | 0.73 | baseline-storage-49 | en_AU |
| 102 | 7119772 | block | 0.286487255225401 | pilot-storage-50 | IVC20det15 |
| 103 | 1996930 | tablespace | 0.6000001 | extended-storage-51 | 937736 |

Storage is modelled in `storage_structures`, a table that captures the granularity of database storage objects. The surrogate key `id` takes values 100 through 103, while `structure_id` carries business identifiers such as `2405` and `7441140`. The `structure_type` column distinguishes between `tablespace`, `datafile`, and `block` — the three fundamental storage abstractions in Oracle-like systems. The `size_g_b` column is a decimal ranging from 0.286 GB (a single block) to 0.74 GB (a tablespace). The `storage_location` column records where the structure resides, with values like `distributed-storage-48` and `pilot-storage-50`. The foreign key `instance_id` ties each storage structure to its owning database instance. The view `database_instance_storage_structure_view` reconstructs this relationship, answering "what storage does each instance consume?" — instance `IVC20det15` owns a `block`-type structure of 0.286 GB located at `pilot-storage-50`.

**Table `d_b_as`**

| d_b_a_id | dba_id | name | years_experience | specialization | employer | instance_id | maintenance_task_id |
|---|---|---|---|---|---|---|---|
| 1 | L441 | Extended Review | 16 | legacy-speciali-13 | National University of Singapore | 26730215 | 1000 |
| 2 | 4447035 | Pilot Initiative A | 22 | compact-speciali-14 | Occidental Petroleum | en_AU | 1001 |
| 3 | 2106707 | Baseline Model | 28 | composite-speciali-15 | ChargePoint Holdings. | IVC20det15 | 1002 |
| 4 | 5f90765e-8fcd-11eb-924d-9cd76263cbd0 | Distributed Cluster | 34 | primary-speciali-16 | Ninja Van | 937736 | 1003 |

The `d_b_as` table records the human administrators. Its primary key `d_b_a_id` is an integer (1 through 4), while the business identifier `dba_id` is a string that can be a short code (`L441`), a long integer (`4447035`), or a UUID (`5f90765e-8fcd-11eb-924d-9cd76263cbd0`). The `name` column holds descriptive titles such as `Extended Review` and `Distributed Cluster`, and `years_experience` ranges from 16 to 34 years. The `specialization` column stores domain expertise codes like `legacy-speciali-13` and `primary-speciali-16`. The `employer` column names the organisation — `National University of Singapore`, `Occidental Petroleum`, `ChargePoint Holdings.`, and `Ninja Van` — all fictional. The foreign key `instance_id` links each DBA to the instance they manage, and `maintenance_task_id` links each DBA to a maintenance task they are assigned. The view `database_instance_d_b_a_view` joins `database_instances` to `d_b_as`, answering "who manages which instance?" — instance `937736` is managed by `Distributed Cluster`, a DBA with 34 years of experience employed by Ninja Van.

**Table `maintenance_tasks`**

| id | task_id | task_type | start_date | end_date | status | tool_used | d_b_a_id | instance_id |
|---|---|---|---|---|---|---|---|---|
| 1000 | 7731870 | backup | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | pending | extended-tool-75 | 1 | 26730215 |
| 1001 | id_28 | recovery | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | running | integrated-tool-76 | 2 | en_AU |
| 1002 | 7119763 | tuning | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | complete | seasonal-tool-77 | 3 | IVC20det15 |
| 1003 | lu_tax_code_template_m82 | patching | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | failed | regional-tool-78 | 4 | 937736 |

Maintenance activities are captured in `maintenance_tasks`. The surrogate primary key `id` takes values 1000 through 1003, while `task_id` carries business identifiers such as `7731870`, `id_28`, `7119763`, and `lu_tax_code_template_m82`. The `task_type` column distinguishes `backup`, `recovery`, `tuning`, and `patching` operations. The `start_date` and `end_date` columns are ISO-8601 timestamps; notably, in this dataset the end dates precede the start dates (e.g., `2022-09-05T20:24:00` to `2022-09-01T08:00:00`), which may indicate a data entry convention or a scheduling anomaly. The `status` column records `pending`, `running`, `complete`, and `failed` states. The `tool_used` column names the maintenance utility, for example `extended-tool-75` and `regional-tool-78`. Foreign keys `d_b_a_id` and `instance_id` link each task to its assigned administrator and its target instance. The view `d_b_a_maintenance_task_view` joins `d_b_as` to `maintenance_tasks`, answering "which tasks is each DBA performing?" — DBA `Extended Review` (d_b_a_id 1) is assigned the `backup` task `7731870` with status `pending`.

**Table `performance_reports`**

| performance_report_id | report_id | report_type | generated_date | duration_hours | top_wait_event | instance_id | d_b_a_id |
|---|---|---|---|---|---|---|---|
| 1 | 1202-0008-S | STATSPACK | 2024-11-04T10:30:00 | 3.70 | distributed-top-78 | 26730215 | 1 |
| 2 | 8189500 | AWR | 2025-04-15T17:47:00 | 7.40 | baseline-top-79 | en_AU | 2 |
| 3 | L355 | ADDM | 2022-09-26T00:04:00 | 11.10 | pilot-top-80 | IVC20det15 | 3 |
| 4 | 5844272 | STATSPACK | 2023-02-10T07:21:00 | 14.80 | extended-top-81 | 937736 | 4 |

Performance monitoring data lives in `performance_reports`. The surrogate primary key `performance_report_id` is an integer (1 through 4), while `report_id` carries business identifiers such as `1202-0008-S`, `8189500`, `L355`, and `5844272`. The `report_type` column distinguishes `STATSPACK`, `AWR`, and `ADDM` — the three standard Oracle performance diagnostic tools. The `generated_date` column is an ISO-8601 timestamp, `duration_hours` records how long the report collection took (3.70 to 14.80 hours), and `top_wait_event` names the most significant performance bottleneck, for example `distributed-top-78` and `baseline-top-79`. Foreign keys `instance_id` and `d_b_a_id` link each report to the instance it covers and the DBA who generated it. The view `performance_report_database_instance_view` joins `performance_reports` to `database_instances`, answering "what is the performance profile of each instance?" — instance `IVC20det15` has an `ADDM` report (`L355`) with a top wait event of `pilot-top-80` and a collection duration of 11.10 hours.

### View-Based Reconstitution of Domain Facts

Each view in the schema is a named join that materialises a specific domain relationship. The `server_host_database_instance_view` reverses the perspective of `database_instance_server_host_view`: instead of starting from the instance and asking which host it runs on, it starts from the host and asks which instance it hosts. For host `supp2` (id 3), the view reveals that it runs instance `IVC20det15`, which is a `RAC` environment in `development` status.

The `storage_structure_database_instance_view` similarly inverts the storage relationship. It starts from the storage structure and answers "which instance owns this structure?" — the tablespace structure `2405` (id 100) is owned by instance `26730215`.

The `d_b_a_database_instance_view` mirrors `database_instance_d_b_a_view` from the administrator's perspective. It answers "which instance does each DBA manage?" — DBA `Pilot Initiative A` (d_b_a_id 2) manages instance `en_AU`, which runs on host `9736903` with 52 CPUs.

The `maintenance_task_d_b_a_view` joins `maintenance_tasks` to `d_b_as` and answers "which DBA is responsible for each maintenance task?" — task `7119763` (a `tuning` operation with status `complete`) is assigned to DBA `Baseline Model` (d_b_a_id 3), who has 28 years of experience.

The `maintenance_task_database_instance_view` joins `maintenance_tasks` to `database_instances` and answers "which instance is affected by each maintenance task?" — instance `937736` is the target of task `lu_tax_code_template_m82`, a `patching` operation with status `failed` that used `regional-tool-78`.

The `performance_report_d_b_a_view` joins `performance_reports` to `d_b_as` and answers "which DBA generated each performance report?" — report `8189500` (an `AWR` report with duration 7.40 hours) was generated by DBA `Pilot Initiative A` (d_b_a_id 2) for instance `en_AU`.

### Synthesis

The schema models database infrastructure as a hub-and-spole architecture centred on `database_instances`. Each instance is a composite entity that simultaneously references a physical host, a storage structure, an administrator, and a set of maintenance and performance records. The twelve views provide every pairwise join path between the hub and its spokes, ensuring that any domain question — "which host runs this instance?", "who manages this instance?", "what storage does this instance consume?", "which tasks is this DBA performing?", "what is the performance profile of this instance?" — can be answered through a single named view rather than an ad-hoc join. The normalised design avoids redundancy: host specifications, storage definitions, and administrator profiles are stored once and referenced by multiple instances where appropriate. The heterogeneous identifier space (integers, UUIDs, locale codes, and Oracle-style names) reflects the real-world diversity of provisioning systems, while the surrogate primary keys (`id`, `performance_report_id`, `d_b_a_id`) provide stable join anchors for the relational engine.

## Data appendix

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
