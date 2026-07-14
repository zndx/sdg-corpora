## The Computational Materials Science Data Ecosystem

Modern computational materials science operates as an integrated pipeline of simulation, analysis, storage, and visualization. Researchers generate material records using specialized codes, process them through parsing pipelines running on high-performance computing centers, analyze results with big data tools, store outcomes in dedicated repositories, and present findings through visualization services. Every stage produces structured records that link back to the originating material system, the computational method applied, and the infrastructure that executed the work. Understanding how these components interrelate is essential for reproducibility, resource planning, and cross-institutional collaboration.

**Table `computational_material_records`**

| computational_material_record_id | record_id | creation_date | file_size_bytes | file_format | status | checksum | computational_code_id | material_system_id | pipeline_id |
|---|---|---|---|---|---|---|---|---|---|
| 100 | 10449530 | 2022-01-13T12:24:00 | 32 | pilot-file-44 | parsed | integrated-checksum-40 | 1 | 1 | en_US |
| 101 | 10445619 | 2023-06-24T19:41:00 | 38 | extended-file-45 | validated | seasonal-checksum-41 | 2 | 2 | 43197171 |
| 102 | 9568457 | 2024-11-08T02:58:00 | 44 | integrated-file-46 | archived | regional-checksum-42 | 3 | 3 | 7731880 |
| 103 | 20743593 | 2025-04-19T09:15:00 | 50 | seasonal-file-47 | corrupted | legacy-checksum-43 | 4 | 4 | 10782184 |

The computational material records table forms the central ledger of the ecosystem. Each row captures a discrete simulation output, identified by a unique record identifier such as `10449530` or `20743593`, alongside a creation timestamp, file size, format designation, processing status, and an integrity checksum. The `file_format` column uses descriptive labels like `pilot-file-44` and `integrated-file-46`, while the `status` field tracks the lifecycle stage—`parsed`, `validated`, `archived`, or `corrupted`. The checksum values (`integrated-checksum-40`, `seasonal-checksum-41`, and so on) provide verification anchors. Each record references a computational code via `computational_code_id`, a material system via `material_system_id`, and a parsing pipeline via `pipeline_id`, establishing the foundational foreign-key relationships that tie simulation outputs to their methods, subjects, and processing workflows.

**Table `computational_codes`**

| id | code_id | code_name | version | license_type | developer_group | center_id |
|---|---|---|---|---|---|---|
| 1 | levels | 10238283 | seasonal-version-71 | open_source | regional-develope-48 | 5844261 |
| 2 | 5082964 | 9736912 | regional-version-72 | proprietary | legacy-develope-49 | 1437588 |
| 3 | b75be5bc-8fcd-11eb-924d-9cd76263cbd0 | account_pymes_255 | legacy-version-73 | academic | compact-develope-50 | 6564397 |
| 4 | eff24a44-8fcb-11eb-924d-9cd76263cbd0 | 627 | compact-version-74 | open_source | composite-develope-51 | default_chart_a_tax_13 |

Computational codes represent the simulation engines themselves. The `code_name` column holds identifiers such as `account_pymes_255` and `627`, while the `version` column tracks revisions like `legacy-version-73` and `compact-version-74`. Licensing is classified under `license_type` as `open_source`, `proprietary`, or `academic`, and the `developer_group` column attributes each code to a development team—for instance, `regional-develope-48` or `compact-develope-50`. The `center_id` column links each code to the high-performance computing center where it is deployed. Codes with `id` values of 1 through 4 correspond to the four primary simulation engines in this dataset, each assigned to a distinct center.

**Table `material_systems`**

| id | system_id | chemical_formula | crystal_system | space_group_number | lattice_parameter_a | lattice_parameter_b | lattice_parameter_c | formation_energy | material_property_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 8189503 | integrated-chemical-82 | cubic | 41 | 20.45 | 3.95 | 17.20 | 1.95 | 100 |
| 2 | 3717623 | seasonal-chemical-83 | tetragonal | 51 | 23.90 | 7.90 | 19.40 | 3.90 | 101 |
| 3 | 7441161 | regional-chemical-84 | orthorhombic | 61 | 27.35 | 11.85 | 21.60 | 5.85 | 102 |
| 4 | 605963 | legacy-chemical-85 | hexagonal | 71 | 30.80 | 15.80 | 23.80 | 7.80 | 103 |

Material systems describe the chemical and crystallographic subjects of the simulations. The `chemical_formula` column uses labels such as `integrated-chemical-82` and `legacy-chemical-85`. Crystallographic detail is captured through `crystal_system` (cubic, tetragonal, orthorhombic, hexagonal), `space_group_number` (41, 51, 61, 71), and lattice parameters `lattice_parameter_a`, `lattice_parameter_b`, and `lattice_parameter_c`, which increase progressively across the four rows—from `20.45` to `30.80` for parameter `a`, for example. The `formation_energy` column records thermodynamic stability values ranging from `1.95` to `7.80`. Each material system links to a `material_property_id`, connecting structural descriptions to measured or predicted properties.

**Table `material_properties`**

| id | property_id | property_name | numeric_value | unit_of_measure | confidence_interval | measurement_method | material_system_id | computational_material_record_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|
| 100 | 23461971 | Baseline Standard D | 5.20 | composite-unit-69 | 8.70 | DFT | 1 | 100 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 101 | 9424936 | Distributed Framework | 9.40 | primary-unit-70 | 11.40 | MD | 2 | 101 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 102 | 4985172 | Adaptive Protocol | 13.60 | adaptive-unit-71 | 14.10 | experiment | 3 | 102 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 103 | 25566008 | Primary Programme A | 17.80 | distributed-unit-72 | 16.80 | ML_prediction | 4 | 103 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Material properties provide the quantitative measurements associated with each system. The `property_name` column uses designations like `Baseline Standard D`, `Distributed Framework`, `Adaptive Protocol D`, and `Primary Programme A`. The `numeric_value` column records measurements from `5.20` to `17.80`, with corresponding `unit_of_measure` labels such as `composite-unit-69` and `distributed-unit-72`. Confidence intervals (`8.70` through `16.80`) and measurement methods (`DFT`, `MD`, `experiment`, `ML_prediction`) document the provenance and reliability of each value. Each property references its parent `material_system_id` and the originating `computational_material_record_id`, creating a direct chain from measurement back to simulation output.

**Table `parsing_pipelines`**

| pipeline_id | pipeline_name | start_date_time | end_date_time | status | records_processed | center_id | parsed_data_store_id |
|---|---|---|---|---|---|---|---|
| en_US | Adaptive Series | 2024-07-24T18:42:00 | 2025-12-16T11:09:00 | pending | 33 | 5844261 | 1000 |
| 43197171 | Primary Assessment | 2025-12-08T01:59:00 | 2022-05-27T18:26:00 | running | 38 | 1437588 | 1001 |
| 7731880 | Composite Survey D | 2022-05-19T08:16:00 | 2023-10-11T01:43:00 | completed | 43 | 6564397 | 1002 |
| 10782184 | Compact Corridor | 2023-10-03T15:33:00 | 2024-03-22T08:00:00 | failed | 48 | default_chart_a_tax_13 | 1003 |

Parsing pipelines orchestrate the transformation of raw simulation outputs into structured, analyzable data. The `pipeline_name` column identifies workflows such as `Adaptive Series`, `Primary Assessment`, `Composite Survey D`, and `Compact Corridor`. Each pipeline has a `start_date_time` and `end_date_time` defining its execution window, a `status` field (`pending`, `running`, `completed`, `failed`), and a `records_processed` count ranging from `33` to `48`. The `center_id` column links each pipeline to the HPC center executing it, while `parsed_data_store_id` identifies the destination repository. Pipeline `en_US` (Adaptive Series) remains in a `pending` state, whereas `7731880` (Composite Survey D) has reached `completed` status after processing `43` records.

**Table `high_performance_computer_centers`**

| center_id | center_name | location | total_compute_nodes | peak_performance_flops | operational_status | computational_code_id | big_data_analytics_tool_id |
|---|---|---|---|---|---|---|---|
| 5844261 | Seasonal Survey | extended-location-99 | 17 | 16.20 | active | 1 | 1 |
| 1437588 | Integrated Corridor | integrated-location-100 | 37 | 18.40 | maintenance | 2 | 2 |
| 6564397 | Extended Series D | seasonal-location-101 | 47 | 20.60 | offline | 3 | 3 |
| default_chart_a_tax_13 | Pilot Assessment | regional-location-102 | 16 | 22.80 | active | 4 | 4 |

High-performance computer centers provide the computational infrastructure. The `center_name` column lists facilities such as `Seasonal Survey`, `Integrated Corridor`, `Extended Series D`, and `Pilot Assessment`. The `location` column uses descriptive identifiers like `extended-location-99` and `regional-location-102`. Infrastructure capacity is captured through `total_compute_nodes` (ranging from `16` to `47`) and `peak_performance_flops` (from `16.20` to `22.80`). The `operational_status` field tracks availability as `active`, `maintenance`, or `offline`. Each center hosts specific computational codes and big data analytics tools, linking the infrastructure layer to the software stack.

**Table `big_data_analytics_tools`**

| id | tool_id | tool_name | algorithm_type | start_date | end_date | status | novel_materials_discovered | parsed_data_store_id | center_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | comi | Composite Model | data_mining | 2022-09-05 | 2022-09-01 | planned | 46 | 1000 | 5844261 |
| 2 | 195360 | Compact Cluster A | statistical_analysis | 2023-02-16 | 2023-02-12 | running | 55 | 1001 | 1437588 |
| 3 | 3355763 | Legacy Review | machine_learning | 2024-07-27 | 2024-07-23 | completed | 64 | 1002 | 6564397 |
| 4 | 8387539 | Regional Initiative | neural_network | 2025-12-11 | 2025-12-07 | archived | 73 | 1003 | default_chart_a_tax_13 |

Big data analytics tools perform the statistical and machine learning analyses on parsed material data. The `tool_name` column identifies analytics platforms such as `Adaptive Analytics`, `Primary Framework`, `Composite Protocol`, and `Compact Programme`. The `version` column tracks software revisions, while `license_type` classifies them as `open_source`, `proprietary`, or `academic`. The `developer_group` column attributes each tool to a development team. The `center_id` column links each tool to the HPC center where it operates, and `parsed_data_store_id` identifies the data repository it reads from.

**Table `parsed_data_stores`**

| parsed_data_store_id | store_id | store_name | total_records | last_updated | storage_size_g_b | data_integrity_status | big_data_analytics_tool_id | visualization_service_id |
|---|---|---|---|---|---|---|---|---|
| 1000 | pgc_pyme_551 | Distributed Standard | 235 | 2023-06-17T17:27:00 | 0.96 | verified | 1 | 100 |
| 1001 | ee5baef3-0504-4234-bef8-c21eaafd150e | Adaptive Framework D | 6 | 2024-11-01T00:44:00 | 0.63 | pending_verification | 2 | 101 |
| 1002 | 2986218 | Primary Protocol | 4 | 2025-04-12T07:01:00 | 0.46 | corrupted | 3 | 102 |
| 1003 | 9424908 | Composite Programme | 5 | 2022-09-23T14:18:00 | 1.19 | verified | 4 | 103 |

Parsed data stores are the repositories where processed simulation outputs are persisted. The `store_name` column identifies storage locations such as `Adaptive Archive`, `Primary Vault`, `Composite Repository`, and `Compact Storage`. The `storage_type` column classifies the storage medium, while `capacity_gb` records available space (from `100.00` to `400.00`). The `center_id` column links each store to its hosting HPC center, and `big_data_analytics_tool_id` identifies the analytics tool that writes to it.

**Table `visualization_services`**

| id | service_id | service_name | endpoint_url | uptime_percentage | max_concurrent_users | active_status | parsed_data_store_id | center_id |
|---|---|---|---|---|---|---|---|---|
| 100 | 1996925 | Distributed Initiative | http://news.sys-con.com/node/4234365 | 16.45 | 33 | false | 1000 | 5844261 |
| 101 | 3990164 | Adaptive Model D | http://marvel.wikia.com/Thor_Odinson_(Earth-616) | 18.90 | 43 | true | 1001 | 1437588 |
| 102 | 5844258 | Primary Cluster | https://bugs.launchpad.net/keystone/+bug/1437032 | 21.35 | 53 | false | 1002 | 6564397 |
| 103 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | Composite Review | https://leetcode.com/problems/snakes-and-ladders | 23.80 | 63 | true | 1003 | default_chart_a_tax_13 |

Visualization services render parsed data for human interpretation. The `service_name` column lists visualization platforms such as `Adaptive Visualizer`, `Primary Dashboard`, `Composite Viewer`, and `Compact Display`. The `rendering_engine` column identifies the underlying technology, while `supported_formats` lists compatible data formats. The `center_id` column links each service to its hosting center, and `parsed_data_store_id` identifies the data source it reads from.

The cross-cutting records tables capture the operational relationships between these components.

**Table `codes_records`**

| computational_code_id | computational_material_record_id |
|---|---|
| 1 | 100 |
| 1 | 101 |
| 2 | 101 |
| 2 | 102 |
| 3 | 102 |
| 3 | 103 |
| 4 | 103 |
| 4 | 100 |

The codes records table documents which computational codes are deployed at which centers. Each row links a `code_id` to a `center_id`, establishing the deployment matrix. For example, code `10238283` is deployed at center `5844261`, while code `9736912` operates at center `1437588`.

**Table `systems_records`**

| material_system_id | computational_material_record_id |
|---|---|
| 1 | 100 |
| 1 | 101 |
| 2 | 101 |
| 2 | 102 |
| 3 | 102 |
| 3 | 103 |
| 4 | 103 |
| 4 | 100 |

The systems records table maps material systems to their associated computational material records. Each row connects a `system_id` to a `computational_material_record_id`, providing a traceability layer between material subjects and their simulation outputs.

**Table `pipelines_records`**

| pipeline_id | computational_material_record_id |
|---|---|
| en_US | 100 |
| en_US | 101 |
| 43197171 | 101 |
| 43197171 | 102 |
| 7731880 | 102 |
| 7731880 | 103 |
| 10782184 | 103 |
| 10782184 | 100 |

The pipelines records table tracks the execution history of parsing pipelines. Each row links a `pipeline_id` to a `center_id` and a `parsed_data_store_id`, documenting where and how data was processed and where the results were stored.

**Table `centers_pipelines`**

| center_id | pipeline_id |
|---|---|
| 5844261 | en_US |
| 5844261 | 43197171 |
| 1437588 | 43197171 |
| 1437588 | 7731880 |
| 6564397 | 7731880 |
| 6564397 | 10782184 |
| default_chart_a_tax_13 | 10782184 |
| default_chart_a_tax_13 | en_US |

The centers pipelines table provides a direct mapping between HPC centers and the parsing pipelines they execute. This relationship ensures that pipeline execution can be traced back to the specific computing infrastructure responsible.

**Table `tools_systems`**

| big_data_analytics_tool_id | material_system_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

The tools systems table connects big data analytics tools to the material systems they analyze. Each row links a `tool_id` to a `system_id`, documenting which analytics platforms are applied to which material subjects.

**Table `stores_records`**

| parsed_data_store_id | computational_material_record_id |
|---|---|
| 1000 | 100 |
| 1000 | 101 |
| 1001 | 101 |
| 1001 | 102 |
| 1002 | 102 |
| 1002 | 103 |
| 1003 | 103 |
| 1003 | 100 |

The stores records table links parsed data stores to the computational material records they contain. This relationship enables reverse lookup from storage location back to the original simulation outputs.

The views synthesize these relationships into analytical queries that answer specific operational questions.

**View `computational_material_record_computational_code_view`**

```sql
CREATE VIEW computational_material_record_computational_code_view AS
SELECT a.computational_material_record_id, a.record_id, a.creation_date, a.file_size_bytes, b.id AS code_id, b.code_id AS code_code_id, b.code_name AS code_code_name
FROM computational_material_records a JOIN computational_codes b ON a.computational_code_id = b.id;
```

| computational_material_record_id | record_id | creation_date | file_size_bytes | code_id | code_code_id | code_code_name |
|---|---|---|---|---|---|---|
| 100 | 10449530 | 2022-01-13T12:24:00 | 32 | 1 | levels | 10238283 |
| 101 | 10445619 | 2023-06-24T19:41:00 | 38 | 2 | 5082964 | 9736912 |
| 102 | 9568457 | 2024-11-08T02:58:00 | 44 | 3 | b75be5bc-8fcd-11eb-924d-9cd76263cbd0 | account_pymes_255 |
| 103 | 20743593 | 2025-04-19T09:15:00 | 50 | 4 | eff24a44-8fcb-11eb-924d-9cd76263cbd0 | 627 |

This view joins computational material records with their associated computational codes, answering which simulation engine produced each output. A row with record `10449530` joined to code `10238283` (version `seasonal-version-71`, license `open_source`) reveals that the `pilot-file-44` output was generated by an open-source engine at center `5844261`.

**View `computational_material_record_material_system_view`**

```sql
CREATE VIEW computational_material_record_material_system_view AS
SELECT a.computational_material_record_id, a.record_id, a.creation_date, a.file_size_bytes, b.id AS system_id, b.system_id AS system_system_id, b.chemical_formula AS system_chemical_formula
FROM computational_material_records a JOIN material_systems b ON a.material_system_id = b.id;
```

| computational_material_record_id | record_id | creation_date | file_size_bytes | system_id | system_system_id | system_chemical_formula |
|---|---|---|---|---|---|---|
| 100 | 10449530 | 2022-01-13T12:24:00 | 32 | 1 | 8189503 | integrated-chemical-82 |
| 101 | 10445619 | 2023-06-24T19:41:00 | 38 | 2 | 3717623 | seasonal-chemical-83 |
| 102 | 9568457 | 2024-11-08T02:58:00 | 44 | 3 | 7441161 | regional-chemical-84 |
| 103 | 20743593 | 2025-04-19T09:15:00 | 50 | 4 | 605963 | legacy-chemical-85 |

This view links material records to their subject systems, answering which chemical composition was simulated. Record `10449530` joined to system `8189503` (formula `integrated-chemical-82`, cubic crystal system, space group `41`) shows that the `pilot-file-44` output corresponds to a cubic material with lattice parameter `a` of `20.45`.

**View `computational_material_record_parsing_pipeline_view`**

```sql
CREATE VIEW computational_material_record_parsing_pipeline_view AS
SELECT a.computational_material_record_id, a.record_id, a.creation_date, a.file_size_bytes, b.pipeline_id AS pipeline_pipeline_id, b.pipeline_name AS pipeline_pipeline_name, b.start_date_time AS pipeline_start_date_time
FROM computational_material_records a JOIN parsing_pipelines b ON a.pipeline_id = b.pipeline_id;
```

| computational_material_record_id | record_id | creation_date | file_size_bytes | pipeline_pipeline_id | pipeline_pipeline_name | pipeline_start_date_time |
|---|---|---|---|---|---|---|
| 100 | 10449530 | 2022-01-13T12:24:00 | 32 | en_US | Adaptive Series | 2024-07-24T18:42:00 |
| 101 | 10445619 | 2023-06-24T19:41:00 | 38 | 43197171 | Primary Assessment | 2025-12-08T01:59:00 |
| 102 | 9568457 | 2024-11-08T02:58:00 | 44 | 7731880 | Composite Survey D | 2022-05-19T08:16:00 |
| 103 | 20743593 | 2025-04-19T09:15:00 | 50 | 10782184 | Compact Corridor | 2023-10-03T15:33:00 |

This view connects material records to the parsing pipelines that processed them, answering which workflow transformed the raw output. Record `10449530` joined to pipeline `en_US` (Adaptive Series, status `pending`, `33` records processed) indicates that the `pilot-file-44` file was processed by the Adaptive Series pipeline at center `5844261`.

**View `computational_code_computational_material_record_detail_view`**

```sql
CREATE VIEW computational_code_computational_material_record_detail_view AS
SELECT a.id, a.code_id, a.code_name, b.computational_material_record_id AS record_computational_material_record_id, b.record_id AS record_record_id, b.creation_date AS record_creation_date
FROM computational_codes a
  JOIN codes_records j ON j.computational_code_id = a.id
  JOIN computational_material_records b ON b.computational_material_record_id = j.computational_material_record_id;
```

| id | code_id | code_name | record_computational_material_record_id | record_record_id | record_creation_date |
|---|---|---|---|---|---|
| 1 | levels | 10238283 | 100 | 10449530 | 2022-01-13T12:24:00 |
| 1 | levels | 10238283 | 101 | 10445619 | 2023-06-24T19:41:00 |
| 2 | 5082964 | 9736912 | 101 | 10445619 | 2023-06-24T19:41:00 |
| 2 | 5082964 | 9736912 | 102 | 9568457 | 2024-11-08T02:58:00 |
| 3 | b75be5bc-8fcd-11eb-924d-9cd76263cbd0 | account_pymes_255 | 102 | 9568457 | 2024-11-08T02:58:00 |
| 3 | b75be5bc-8fcd-11eb-924d-9cd76263cbd0 | account_pymes_255 | 103 | 20743593 | 2025-04-19T09:15:00 |
| 4 | eff24a44-8fcb-11eb-924d-9cd76263cbd0 | 627 | 103 | 20743593 | 2025-04-19T09:15:00 |
| 4 | eff24a44-8fcb-11eb-924d-9cd76263cbd0 | 627 | 100 | 10449530 | 2022-01-13T12:24:00 |

This view aggregates material records by computational code, answering which codes produced the most outputs. Code `10238283` (seasonal-version-71) is associated with record `10449530` (file size `32`, status `parsed`), while code `9736912` (regional-version-72) is linked to record `10445619` (file size `38`, status `validated`).

**View `computational_code_high_performance_computer_center_view`**

```sql
CREATE VIEW computational_code_high_performance_computer_center_view AS
SELECT a.id, a.code_id, a.code_name, a.version, b.center_id AS center_center_id, b.center_name AS center_center_name, b.location AS center_location
FROM computational_codes a JOIN high_performance_computer_centers b ON a.center_id = b.center_id;
```

| id | code_id | code_name | version | center_center_id | center_center_name | center_location |
|---|---|---|---|---|---|---|
| 1 | levels | 10238283 | seasonal-version-71 | 5844261 | Seasonal Survey | extended-location-99 |
| 2 | 5082964 | 9736912 | regional-version-72 | 1437588 | Integrated Corridor | integrated-location-100 |
| 3 | b75be5bc-8fcd-11eb-924d-9cd76263cbd0 | account_pymes_255 | legacy-version-73 | 6564397 | Extended Series D | seasonal-location-101 |
| 4 | eff24a44-8fcb-11eb-924d-9cd76263cbd0 | 627 | compact-version-74 | default_chart_a_tax_13 | Pilot Assessment | regional-location-102 |

This view maps computational codes to their hosting centers, answering which infrastructure runs which simulation engine. Code `10238283` (seasonal-version-71, open_source) runs at center `5844261` (Seasonal Survey, `17` nodes, `16.20` flops, active). Code `eff24a44-8fcb-11eb-924d-9cd76263cbd0` (compact-version-74) operates at center `default_chart_a_tax_13` (Pilot Assessment, `16` nodes, `22.80` flops, active).

**View `material_system_computational_material_record_detail_view`**

```sql
CREATE VIEW material_system_computational_material_record_detail_view AS
SELECT a.id, a.system_id, a.chemical_formula, b.computational_material_record_id AS record_computational_material_record_id, b.record_id AS record_record_id, b.creation_date AS record_creation_date
FROM material_systems a
  JOIN systems_records j ON j.material_system_id = a.id
  JOIN computational_material_records b ON b.computational_material_record_id = j.computational_material_record_id;
```

| id | system_id | chemical_formula | record_computational_material_record_id | record_record_id | record_creation_date |
|---|---|---|---|---|---|
| 1 | 8189503 | integrated-chemical-82 | 100 | 10449530 | 2022-01-13T12:24:00 |
| 1 | 8189503 | integrated-chemical-82 | 101 | 10445619 | 2023-06-24T19:41:00 |
| 2 | 3717623 | seasonal-chemical-83 | 101 | 10445619 | 2023-06-24T19:41:00 |
| 2 | 3717623 | seasonal-chemical-83 | 102 | 9568457 | 2024-11-08T02:58:00 |
| 3 | 7441161 | regional-chemical-84 | 102 | 9568457 | 2024-11-08T02:58:00 |
| 3 | 7441161 | regional-chemical-84 | 103 | 20743593 | 2025-04-19T09:15:00 |
| 4 | 605963 | legacy-chemical-85 | 103 | 20743593 | 2025-04-19T09:15:00 |
| 4 | 605963 | legacy-chemical-85 | 100 | 10449530 | 2022-01-13T12:24:00 |

This view links material systems to their simulation records, answering which systems have been simulated and with what outcomes. System `8189503` (integrated-chemical-82, cubic) is linked to record `10449530` (file format `pilot-file-44`, status `parsed`), while system `605963` (legacy-chemical-85, hexagonal) connects to record `20743593` (file format `seasonal-file-47`, status `corrupted`).

**View `material_system_material_property_view`**

```sql
CREATE VIEW material_system_material_property_view AS
SELECT a.id, a.system_id, a.chemical_formula, a.crystal_system, b.id AS property_id, b.property_id AS property_property_id, b.property_name AS property_property_name
FROM material_systems a JOIN material_properties b ON a.material_property_id = b.id;
```

| id | system_id | chemical_formula | crystal_system | property_id | property_property_id | property_property_name |
|---|---|---|---|---|---|---|
| 1 | 8189503 | integrated-chemical-82 | cubic | 100 | 23461971 | Baseline Standard D |
| 2 | 3717623 | seasonal-chemical-83 | tetragonal | 101 | 9424936 | Distributed Framework |
| 3 | 7441161 | regional-chemical-84 | orthorhombic | 102 | 4985172 | Adaptive Protocol |
| 4 | 605963 | legacy-chemical-85 | hexagonal | 103 | 25566008 | Primary Programme A |

This view connects material systems to their measured properties, answering what quantitative characteristics are known for each system. System `8189503` (integrated-chemical-82) is associated with property `23461971` (Baseline Standard D, value `5.20`, method `DFT`, confidence interval `8.70`), while system `605963` (legacy-chemical-85) links to property `25566008` (Primary Programme A, value `17.80`, method `ML_prediction`, confidence interval `16.80`).

**View `material_property_material_system_view`**

```sql
CREATE VIEW material_property_material_system_view AS
SELECT a.id, a.property_id, a.property_name, a.numeric_value, b.id AS system_id, b.system_id AS system_system_id, b.chemical_formula AS system_chemical_formula
FROM material_properties a JOIN material_systems b ON a.material_system_id = b.id;
```

| id | property_id | property_name | numeric_value | system_id | system_system_id | system_chemical_formula |
|---|---|---|---|---|---|---|
| 100 | 23461971 | Baseline Standard D | 5.20 | 1 | 8189503 | integrated-chemical-82 |
| 101 | 9424936 | Distributed Framework | 9.40 | 2 | 3717623 | seasonal-chemical-83 |
| 102 | 4985172 | Adaptive Protocol | 13.60 | 3 | 7441161 | regional-chemical-84 |
| 103 | 25566008 | Primary Programme A | 17.80 | 4 | 605963 | legacy-chemical-85 |

This view reverses the relationship, listing material systems by their properties. Property `23461971` (Baseline Standard D, `5.20`, DFT) belongs to system `8189503` (integrated-chemical-82, cubic, space group `41`), while property `25566008` (Primary Programme A, `17.80`, ML_prediction) belongs to system `605963` (legacy-chemical-85, hexagonal, space group `71`).

**View `material_property_computational_material_record_view`**

```sql
CREATE VIEW material_property_computational_material_record_view AS
SELECT a.id, a.property_id, a.property_name, a.numeric_value, b.computational_material_record_id AS record_computational_material_record_id, b.record_id AS record_record_id, b.creation_date AS record_creation_date
FROM material_properties a JOIN computational_material_records b ON a.computational_material_record_id = b.computational_material_record_id;
```

| id | property_id | property_name | numeric_value | record_computational_material_record_id | record_record_id | record_creation_date |
|---|---|---|---|---|---|---|
| 100 | 23461971 | Baseline Standard D | 5.20 | 100 | 10449530 | 2022-01-13T12:24:00 |
| 101 | 9424936 | Distributed Framework | 9.40 | 101 | 10445619 | 2023-06-24T19:41:00 |
| 102 | 4985172 | Adaptive Protocol | 13.60 | 102 | 9568457 | 2024-11-08T02:58:00 |
| 103 | 25566008 | Primary Programme A | 17.80 | 103 | 20743593 | 2025-04-19T09:15:00 |

This view links material properties to their originating simulation records, answering which simulation produced which measurement. Property `23461971` (Baseline Standard D, `5.20`) was derived from record `10449530` (file format `pilot-file-44`, status `parsed`, created `2022-01-13`), while property `25566008` (Primary Programme A, `17.80`) traces to record `20743593` (file format `seasonal-file-47`, status `corrupted`, created `2025-04-19`).

**View `parsing_pipeline_computational_material_record_detail_view`**

```sql
CREATE VIEW parsing_pipeline_computational_material_record_detail_view AS
SELECT a.pipeline_id, a.pipeline_name, a.start_date_time, b.computational_material_record_id AS record_computational_material_record_id, b.record_id AS record_record_id, b.creation_date AS record_creation_date
FROM parsing_pipelines a
  JOIN pipelines_records j ON j.pipeline_id = a.pipeline_id
  JOIN computational_material_records b ON b.computational_material_record_id = j.computational_material_record_id;
```

| pipeline_id | pipeline_name | start_date_time | record_computational_material_record_id | record_record_id | record_creation_date |
|---|---|---|---|---|---|
| en_US | Adaptive Series | 2024-07-24T18:42:00 | 100 | 10449530 | 2022-01-13T12:24:00 |
| en_US | Adaptive Series | 2024-07-24T18:42:00 | 101 | 10445619 | 2023-06-24T19:41:00 |
| 43197171 | Primary Assessment | 2025-12-08T01:59:00 | 101 | 10445619 | 2023-06-24T19:41:00 |
| 43197171 | Primary Assessment | 2025-12-08T01:59:00 | 102 | 9568457 | 2024-11-08T02:58:00 |
| 7731880 | Composite Survey D | 2022-05-19T08:16:00 | 102 | 9568457 | 2024-11-08T02:58:00 |
| 7731880 | Composite Survey D | 2022-05-19T08:16:00 | 103 | 20743593 | 2025-04-19T09:15:00 |
| 10782184 | Compact Corridor | 2023-10-03T15:33:00 | 103 | 20743593 | 2025-04-19T09:15:00 |
| 10782184 | Compact Corridor | 2023-10-03T15:33:00 | 100 | 10449530 | 2022-01-13T12:24:00 |

This view connects parsing pipelines to the material records they processed, answering which pipelines handled which outputs. Pipeline `en_US` (Adaptive Series, `33` records, status `pending`) processed record `10449530` (file format `pilot-file-44`, status `parsed`), while pipeline `10782184` (Compact Corridor, `48` records, status `failed`) processed record `20743593` (file format `seasonal-file-47`, status `corrupted`).

**View `parsing_pipeline_high_performance_computer_center_view`**

```sql
CREATE VIEW parsing_pipeline_high_performance_computer_center_view AS
SELECT a.pipeline_id, a.pipeline_name, a.start_date_time, a.end_date_time, b.center_id AS center_center_id, b.center_name AS center_center_name, b.location AS center_location
FROM parsing_pipelines a JOIN high_performance_computer_centers b ON a.center_id = b.center_id;
```

| pipeline_id | pipeline_name | start_date_time | end_date_time | center_center_id | center_center_name | center_location |
|---|---|---|---|---|---|---|
| en_US | Adaptive Series | 2024-07-24T18:42:00 | 2025-12-16T11:09:00 | 5844261 | Seasonal Survey | extended-location-99 |
| 43197171 | Primary Assessment | 2025-12-08T01:59:00 | 2022-05-27T18:26:00 | 1437588 | Integrated Corridor | integrated-location-100 |
| 7731880 | Composite Survey D | 2022-05-19T08:16:00 | 2023-10-11T01:43:00 | 6564397 | Extended Series D | seasonal-location-101 |
| 10782184 | Compact Corridor | 2023-10-03T15:33:00 | 2024-03-22T08:00:00 | default_chart_a_tax_13 | Pilot Assessment | regional-location-102 |

This view maps parsing pipelines to their hosting centers, answering which infrastructure executes which workflow. Pipeline `en_US` (Adaptive Series) runs at center `5844261` (Seasonal Survey, `17` nodes, active), while pipeline `10782184` (Compact Corridor) operates at center `default_chart_a_tax_13` (Pilot Assessment, `16` nodes, active).

**View `parsing_pipeline_parsed_data_store_view`**

```sql
CREATE VIEW parsing_pipeline_parsed_data_store_view AS
SELECT a.pipeline_id, a.pipeline_name, a.start_date_time, a.end_date_time, b.parsed_data_store_id AS store_parsed_data_store_id, b.store_id AS store_store_id, b.store_name AS store_store_name
FROM parsing_pipelines a JOIN parsed_data_stores b ON a.parsed_data_store_id = b.parsed_data_store_id;
```

| pipeline_id | pipeline_name | start_date_time | end_date_time | store_parsed_data_store_id | store_store_id | store_store_name |
|---|---|---|---|---|---|---|
| en_US | Adaptive Series | 2024-07-24T18:42:00 | 2025-12-16T11:09:00 | 1000 | pgc_pyme_551 | Distributed Standard |
| 43197171 | Primary Assessment | 2025-12-08T01:59:00 | 2022-05-27T18:26:00 | 1001 | ee5baef3-0504-4234-bef8-c21eaafd150e | Adaptive Framework D |
| 7731880 | Composite Survey D | 2022-05-19T08:16:00 | 2023-10-11T01:43:00 | 1002 | 2986218 | Primary Protocol |
| 10782184 | Compact Corridor | 2023-10-03T15:33:00 | 2024-03-22T08:00:00 | 1003 | 9424908 | Composite Programme |

This view links parsing pipelines to their destination data stores, answering where processed results are stored. Pipeline `en_US` (Adaptive Series) writes to store `1000`, while pipeline `10782184` (Compact Corridor) writes to store `1003`.

**View `high_performance_computer_center_computational_code_view`**

```sql
CREATE VIEW high_performance_computer_center_computational_code_view AS
SELECT a.center_id, a.center_name, a.location, a.total_compute_nodes, b.id AS code_id, b.code_id AS code_code_id, b.code_name AS code_code_name
FROM high_performance_computer_centers a JOIN computational_codes b ON a.computational_code_id = b.id;
```

| center_id | center_name | location | total_compute_nodes | code_id | code_code_id | code_code_name |
|---|---|---|---|---|---|---|
| 5844261 | Seasonal Survey | extended-location-99 | 17 | 1 | levels | 10238283 |
| 1437588 | Integrated Corridor | integrated-location-100 | 37 | 2 | 5082964 | 9736912 |
| 6564397 | Extended Series D | seasonal-location-101 | 47 | 3 | b75be5bc-8fcd-11eb-924d-9cd76263cbd0 | account_pymes_255 |
| default_chart_a_tax_13 | Pilot Assessment | regional-location-102 | 16 | 4 | eff24a44-8fcb-11eb-924d-9cd76263cbd0 | 627 |

This view maps HPC centers to the computational codes they host, answering which simulation engines run on which infrastructure. Center `5844261` (Seasonal Survey, `17` nodes, `16.20` flops) hosts code `10238283` (seasonal-version-71, open_source), while center `default_chart_a_tax_13` (Pilot Assessment, `16` nodes, `22.80` flops) hosts code `eff24a44-8fcb-11eb-924d-9cd76263cbd0` (compact-version-74, open_source).

**View `high_performance_computer_center_parsing_pipeline_detail_view`**

```sql
CREATE VIEW high_performance_computer_center_parsing_pipeline_detail_view AS
SELECT a.center_id, a.center_name, a.location, b.pipeline_id AS pipeline_pipeline_id, b.pipeline_name AS pipeline_pipeline_name, b.start_date_time AS pipeline_start_date_time
FROM high_performance_computer_centers a
  JOIN centers_pipelines j ON j.center_id = a.center_id
  JOIN parsing_pipelines b ON b.pipeline_id = j.pipeline_id;
```

| center_id | center_name | location | pipeline_pipeline_id | pipeline_pipeline_name | pipeline_start_date_time |
|---|---|---|---|---|---|
| 5844261 | Seasonal Survey | extended-location-99 | en_US | Adaptive Series | 2024-07-24T18:42:00 |
| 5844261 | Seasonal Survey | extended-location-99 | 43197171 | Primary Assessment | 2025-12-08T01:59:00 |
| 1437588 | Integrated Corridor | integrated-location-100 | 43197171 | Primary Assessment | 2025-12-08T01:59:00 |
| 1437588 | Integrated Corridor | integrated-location-100 | 7731880 | Composite Survey D | 2022-05-19T08:16:00 |
| 6564397 | Extended Series D | seasonal-location-101 | 7731880 | Composite Survey D | 2022-05-19T08:16:00 |
| 6564397 | Extended Series D | seasonal-location-101 | 10782184 | Compact Corridor | 2023-10-03T15:33:00 |
| default_chart_a_tax_13 | Pilot Assessment | regional-location-102 | 10782184 | Compact Corridor | 2023-10-03T15:33:00 |
| default_chart_a_tax_13 | Pilot Assessment | regional-location-102 | en_US | Adaptive Series | 2024-07-24T18:42:00 |

This view connects HPC centers to the parsing pipelines they execute, answering which workflows run on which infrastructure. Center `5844261` (Seasonal Survey) executes pipeline `en_US` (Adaptive Series, `33` records, pending), while center `1437588` (Integrated Corridor) executes pipeline `43197171` (Primary Assessment, `38` records, running).

**View `high_performance_computer_center_big_data_analytics_tool_view`**

```sql
CREATE VIEW high_performance_computer_center_big_data_analytics_tool_view AS
SELECT a.center_id, a.center_name, a.location, a.total_compute_nodes, b.id AS tool_id, b.tool_id AS tool_tool_id, b.tool_name AS tool_tool_name
FROM high_performance_computer_centers a JOIN big_data_analytics_tools b ON a.big_data_analytics_tool_id = b.id;
```

| center_id | center_name | location | total_compute_nodes | tool_id | tool_tool_id | tool_tool_name |
|---|---|---|---|---|---|---|
| 5844261 | Seasonal Survey | extended-location-99 | 17 | 1 | comi | Composite Model |
| 1437588 | Integrated Corridor | integrated-location-100 | 37 | 2 | 195360 | Compact Cluster A |
| 6564397 | Extended Series D | seasonal-location-101 | 47 | 3 | 3355763 | Legacy Review |
| default_chart_a_tax_13 | Pilot Assessment | regional-location-102 | 16 | 4 | 8387539 | Regional Initiative |

This view maps HPC centers to the big data analytics tools they provide, answering which analytical platforms are available at each facility. Center `5844261` (Seasonal Survey) provides tool `1` (Adaptive Analytics), while center `1437588` (Integrated Corridor) provides tool `2` (Primary Framework).

**View `big_data_analytics_tool_parsed_data_store_view`**

```sql
CREATE VIEW big_data_analytics_tool_parsed_data_store_view AS
SELECT a.id, a.tool_id, a.tool_name, a.algorithm_type, b.parsed_data_store_id AS store_parsed_data_store_id, b.store_id AS store_store_id, b.store_name AS store_store_name
FROM big_data_analytics_tools a JOIN parsed_data_stores b ON a.parsed_data_store_id = b.parsed_data_store_id;
```

| id | tool_id | tool_name | algorithm_type | store_parsed_data_store_id | store_store_id | store_store_name |
|---|---|---|---|---|---|---|
| 1 | comi | Composite Model | data_mining | 1000 | pgc_pyme_551 | Distributed Standard |
| 2 | 195360 | Compact Cluster A | statistical_analysis | 1001 | ee5baef3-0504-4234-bef8-c21eaafd150e | Adaptive Framework D |
| 3 | 3355763 | Legacy Review | machine_learning | 1002 | 2986218 | Primary Protocol |
| 4 | 8387539 | Regional Initiative | neural_network | 1003 | 9424908 | Composite Programme |

This view links big data analytics tools to the parsed data stores they read from, answering which tools consume which datasets. Tool `1` (Adaptive Analytics) reads from store `1000`, while tool `2` (Primary Framework) reads from store `1001`.

**View `big_data_analytics_tool_material_system_detail_view`**

```sql
CREATE VIEW big_data_analytics_tool_material_system_detail_view AS
SELECT a.id, a.tool_id, a.tool_name, b.id AS system_id, b.system_id AS system_system_id, b.chemical_formula AS system_chemical_formula
FROM big_data_analytics_tools a
  JOIN tools_systems j ON j.big_data_analytics_tool_id = a.id
  JOIN material_systems b ON b.id = j.material_system_id;
```

| id | tool_id | tool_name | system_id | system_system_id | system_chemical_formula |
|---|---|---|---|---|---|
| 1 | comi | Composite Model | 1 | 8189503 | integrated-chemical-82 |
| 1 | comi | Composite Model | 2 | 3717623 | seasonal-chemical-83 |
| 2 | 195360 | Compact Cluster A | 2 | 3717623 | seasonal-chemical-83 |
| 2 | 195360 | Compact Cluster A | 3 | 7441161 | regional-chemical-84 |
| 3 | 3355763 | Legacy Review | 3 | 7441161 | regional-chemical-84 |
| 3 | 3355763 | Legacy Review | 4 | 605963 | legacy-chemical-85 |
| 4 | 8387539 | Regional Initiative | 4 | 605963 | legacy-chemical-85 |
| 4 | 8387539 | Regional Initiative | 1 | 8189503 | integrated-chemical-82 |

This view connects big data analytics tools to the material systems they analyze, answering which analytical platforms study which chemical compositions. Tool `1` (Adaptive Analytics) analyzes system `8189503` (integrated-chemical-82, cubic), while tool `4` (Compact Programme) analyzes system `605963` (legacy-chemical-85, hexagonal).

**View `big_data_analytics_tool_high_performance_computer_center_view`**

```sql
CREATE VIEW big_data_analytics_tool_high_performance_computer_center_view AS
SELECT a.id, a.tool_id, a.tool_name, a.algorithm_type, b.center_id AS center_center_id, b.center_name AS center_center_name, b.location AS center_location
FROM big_data_analytics_tools a JOIN high_performance_computer_centers b ON a.center_id = b.center_id;
```

| id | tool_id | tool_name | algorithm_type | center_center_id | center_center_name | center_location |
|---|---|---|---|---|---|---|
| 1 | comi | Composite Model | data_mining | 5844261 | Seasonal Survey | extended-location-99 |
| 2 | 195360 | Compact Cluster A | statistical_analysis | 1437588 | Integrated Corridor | integrated-location-100 |
| 3 | 3355763 | Legacy Review | machine_learning | 6564397 | Extended Series D | seasonal-location-101 |
| 4 | 8387539 | Regional Initiative | neural_network | default_chart_a_tax_13 | Pilot Assessment | regional-location-102 |

This view maps big data analytics tools to their hosting centers, answering which infrastructure provides which analytical platform. Tool `1` (Adaptive Analytics) runs at center `5844261` (Seasonal Survey, `17` nodes, active), while tool `4` (Compact Programme) operates at center `default_chart_a_tax_13` (Pilot Assessment, `16` nodes, active).

**View `parsed_data_store_computational_material_record_detail_view`**

```sql
CREATE VIEW parsed_data_store_computational_material_record_detail_view AS
SELECT a.parsed_data_store_id, a.store_id, a.store_name, b.computational_material_record_id AS record_computational_material_record_id, b.record_id AS record_record_id, b.creation_date AS record_creation_date
FROM parsed_data_stores a
  JOIN stores_records j ON j.parsed_data_store_id = a.parsed_data_store_id
  JOIN computational_material_records b ON b.computational_material_record_id = j.computational_material_record_id;
```

| parsed_data_store_id | store_id | store_name | record_computational_material_record_id | record_record_id | record_creation_date |
|---|---|---|---|---|---|
| 1000 | pgc_pyme_551 | Distributed Standard | 100 | 10449530 | 2022-01-13T12:24:00 |
| 1000 | pgc_pyme_551 | Distributed Standard | 101 | 10445619 | 2023-06-24T19:41:00 |
| 1001 | ee5baef3-0504-4234-bef8-c21eaafd150e | Adaptive Framework D | 101 | 10445619 | 2023-06-24T19:41:00 |
| 1001 | ee5baef3-0504-4234-bef8-c21eaafd150e | Adaptive Framework D | 102 | 9568457 | 2024-11-08T02:58:00 |
| 1002 | 2986218 | Primary Protocol | 102 | 9568457 | 2024-11-08T02:58:00 |
| 1002 | 2986218 | Primary Protocol | 103 | 20743593 | 2025-04-19T09:15:00 |
| 1003 | 9424908 | Composite Programme | 103 | 20743593 | 2025-04-19T09:15:00 |
| 1003 | 9424908 | Composite Programme | 100 | 10449530 | 2022-01-13T12:24:00 |

This view links parsed data stores to the material records they contain, answering which storage locations hold which simulation outputs. Store `1000` contains record `10449530` (file format `pilot-file-44`, status `parsed`), while store `1003` contains record `20743593` (file format `seasonal-file-47`, status `corrupted`).

**View `parsed_data_store_big_data_analytics_tool_view`**

```sql
CREATE VIEW parsed_data_store_big_data_analytics_tool_view AS
SELECT a.parsed_data_store_id, a.store_id, a.store_name, a.total_records, b.id AS tool_id, b.tool_id AS tool_tool_id, b.tool_name AS tool_tool_name
FROM parsed_data_stores a JOIN big_data_analytics_tools b ON a.big_data_analytics_tool_id = b.id;
```

| parsed_data_store_id | store_id | store_name | total_records | tool_id | tool_tool_id | tool_tool_name |
|---|---|---|---|---|---|---|
| 1000 | pgc_pyme_551 | Distributed Standard | 235 | 1 | comi | Composite Model |
| 1001 | ee5baef3-0504-4234-bef8-c21eaafd150e | Adaptive Framework D | 6 | 2 | 195360 | Compact Cluster A |
| 1002 | 2986218 | Primary Protocol | 4 | 3 | 3355763 | Legacy Review |
| 1003 | 9424908 | Composite Programme | 5 | 4 | 8387539 | Regional Initiative |

This view connects parsed data stores to the analytics tools that read from them, answering which tools consume which storage locations. Store `1000` is read by tool `1` (Adaptive Analytics), while store `1003` is read by tool `4` (Compact Programme).

**View `parsed_data_store_visualization_service_view`**

```sql
CREATE VIEW parsed_data_store_visualization_service_view AS
SELECT a.parsed_data_store_id, a.store_id, a.store_name, a.total_records, b.id AS service_id, b.service_id AS service_service_id, b.service_name AS service_service_name
FROM parsed_data_stores a JOIN visualization_services b ON a.visualization_service_id = b.id;
```

| parsed_data_store_id | store_id | store_name | total_records | service_id | service_service_id | service_service_name |
|---|---|---|---|---|---|---|
| 1000 | pgc_pyme_551 | Distributed Standard | 235 | 100 | 1996925 | Distributed Initiative |
| 1001 | ee5baef3-0504-4234-bef8-c21eaafd150e | Adaptive Framework D | 6 | 101 | 3990164 | Adaptive Model D |
| 1002 | 2986218 | Primary Protocol | 4 | 102 | 5844258 | Primary Cluster |
| 1003 | 9424908 | Composite Programme | 5 | 103 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | Composite Review |

This view links parsed data stores to the visualization services that render their contents, answering which visualization platforms display which datasets. Store `1000` is rendered by service `1` (Adaptive Visualizer), while store `1003` is rendered by service `4` (Compact Display).

**View `visualization_service_parsed_data_store_view`**

```sql
CREATE VIEW visualization_service_parsed_data_store_view AS
SELECT a.id, a.service_id, a.service_name, a.endpoint_url, b.parsed_data_store_id AS store_parsed_data_store_id, b.store_id AS store_store_id, b.store_name AS store_store_name
FROM visualization_services a JOIN parsed_data_stores b ON a.parsed_data_store_id = b.parsed_data_store_id;
```

| id | service_id | service_name | endpoint_url | store_parsed_data_store_id | store_store_id | store_store_name |
|---|---|---|---|---|---|---|
| 100 | 1996925 | Distributed Initiative | http://news.sys-con.com/node/4234365 | 1000 | pgc_pyme_551 | Distributed Standard |
| 101 | 3990164 | Adaptive Model D | http://marvel.wikia.com/Thor_Odinson_(Earth-616) | 1001 | ee5baef3-0504-4234-bef8-c21eaafd150e | Adaptive Framework D |
| 102 | 5844258 | Primary Cluster | https://bugs.launchpad.net/keystone/+bug/1437032 | 1002 | 2986218 | Primary Protocol |
| 103 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | Composite Review | https://leetcode.com/problems/snakes-and-ladders | 1003 | 9424908 | Composite Programme |

This view reverses the relationship, listing visualization services by their data sources. Service `1` (Adaptive Visualizer) reads from store `1000`, while service `4` (Compact Display) reads from store `1003`.

**View `visualization_service_high_performance_computer_center_view`**

```sql
CREATE VIEW visualization_service_high_performance_computer_center_view AS
SELECT a.id, a.service_id, a.service_name, a.endpoint_url, b.center_id AS center_center_id, b.center_name AS center_center_name, b.location AS center_location
FROM visualization_services a JOIN high_performance_computer_centers b ON a.center_id = b.center_id;
```

| id | service_id | service_name | endpoint_url | center_center_id | center_center_name | center_location |
|---|---|---|---|---|---|---|
| 100 | 1996925 | Distributed Initiative | http://news.sys-con.com/node/4234365 | 5844261 | Seasonal Survey | extended-location-99 |
| 101 | 3990164 | Adaptive Model D | http://marvel.wikia.com/Thor_Odinson_(Earth-616) | 1437588 | Integrated Corridor | integrated-location-100 |
| 102 | 5844258 | Primary Cluster | https://bugs.launchpad.net/keystone/+bug/1437032 | 6564397 | Extended Series D | seasonal-location-101 |
| 103 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | Composite Review | https://leetcode.com/problems/snakes-and-ladders | default_chart_a_tax_13 | Pilot Assessment | regional-location-102 |

This view maps visualization services to their hosting centers, answering which infrastructure provides which visualization platform. Service `1` (Adaptive Visualizer) runs at center `5844261` (Seasonal Survey, `17` nodes, active), while service `4` (Compact Display) operates at center `default_chart_a_tax_13` (Pilot Assessment, `16` nodes, active).

The computational materials science data ecosystem operates as a tightly coupled chain: simulation codes generate material records on HPC centers, parsing pipelines transform raw outputs into structured data, big data analytics tools extract patterns, parsed data stores persist the results, and visualization services present findings. Each component is traceable through foreign-key relationships that span the entire lifecycle. Record `10449530`, for instance, connects code `10238283` to system `8189503`, processed by pipeline `en_US` at center `5844261`, stored in repository `1000`, analyzed by tool `1`, and rendered by service `1`. This end-to-end traceability ensures that every measurement, from the `DFT` calculation of property `23461971` (value `5.20`) to its visualization, can be audited, reproduced, and extended. The operational relationships documented across these tables and views form the backbone of reproducible computational materials research.