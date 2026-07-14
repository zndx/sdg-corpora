## Domain Modelling and Relational Materialization

The computational materials science domain captures the full lifecycle of simulation-driven material discovery: codes execute on high-performance hardware, produce material system definitions, which in turn yield measurable properties, all orchestrated through parsing pipelines and stored in analytics infrastructure. The ontology underlying this domain distinguishes nine core entity types—computational material records, computational codes, material systems, material properties, parsing pipelines, high-performance computer centers, big data analytics tools, parsed data stores, and visualization services—along with five many-to-many relationship types that the relational schema materializes as junction tables. Every entity and relationship is normalised into base tables, and the analytical views reconstruct domain facts by joining these tables back together.

**Table `computational_material_records`**

| computational_material_record_id | record_id | creation_date | file_size_bytes | file_format | status | checksum | computational_code_id | material_system_id | pipeline_id |
|---|---|---|---|---|---|---|---|---|---|
| 100 | 10449530 | 2022-01-13T12:24:00 | 32 | pilot-file-44 | parsed | integrated-checksum-40 | 1 | 1 | en_US |
| 101 | 10445619 | 2023-06-24T19:41:00 | 38 | extended-file-45 | validated | seasonal-checksum-41 | 2 | 2 | 43197171 |
| 102 | 9568457 | 2024-11-08T02:58:00 | 44 | integrated-file-46 | archived | regional-checksum-42 | 3 | 3 | 7731880 |
| 103 | 20743593 | 2025-04-19T09:15:00 | 50 | seasonal-file-47 | corrupted | legacy-checksum-43 | 4 | 4 | 10782184 |

The `computational_material_records` table is the central fact table of the domain. Each row represents a single simulation output, identified by a surrogate `computational_material_record_id` (e.g., `100`, `101`, `102`, `103`) and a business `record_id` such as `10449530` or `9568457`. The record carries metadata—`creation_date` (e.g., `2022-01-13T12:24:00`), `file_size_bytes` (e.g., `32`), `file_format` (e.g., `pilot-file-44`), `status` (one of `parsed`, `validated`, `archived`, `corrupted`), and `checksum` (e.g., `integrated-checksum-40`). Three foreign keys anchor the record to its provenance: `computational_code_id` references `computational_codes.id`, `material_system_id` references `material_systems.id`, and `pipeline_id` references `parsing_pipelines.pipeline_id`. The first row, record `100`, links to code `1`, system `1`, and pipeline `en_US`; the fourth row, record `103`, links to code `4`, system `4`, and pipeline `10782184`.

**Table `computational_codes`**

| id | code_id | code_name | version | license_type | developer_group | center_id |
|---|---|---|---|---|---|---|
| 1 | levels | 10238283 | seasonal-version-71 | open_source | regional-develope-48 | 5844261 |
| 2 | 5082964 | 9736912 | regional-version-72 | proprietary | legacy-develope-49 | 1437588 |
| 3 | b75be5bc-8fcd-11eb-924d-9cd76263cbd0 | account_pymes_255 | legacy-version-73 | academic | compact-develope-50 | 6564397 |
| 4 | eff24a44-8fcb-11eb-924d-9cd76263cbd0 | 627 | compact-version-74 | open_source | composite-develope-51 | default_chart_a_tax_13 |

`computational_codes` stores the simulation software itself. Its surrogate primary key `id` (values `1` through `4`) is what other tables reference. The business identifier `code_id` holds values like `levels`, `5082964`, and `b75be5bc-8fcd-11eb-924d-9cd76263cbd0`. The `code_name` column carries names such as `account_pymes_255` and `627`, while `version` holds strings like `seasonal-version-71` and `compact-version-74`. Licensing is captured in `license_type` (`open_source`, `proprietary`, `academic`), and `developer_group` identifies the team (e.g., `regional-develope-48`, `legacy-develope-49`). The foreign key `center_id` points to `high_performance_computer_centers.center_id`, establishing which compute centre hosts each code. Code `1` runs on centre `5844261`; code `4` runs on centre `default_chart_a_tax_13`.

**Table `material_systems`**

| id | system_id | chemical_formula | crystal_system | space_group_number | lattice_parameter_a | lattice_parameter_b | lattice_parameter_c | formation_energy | material_property_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 8189503 | integrated-chemical-82 | cubic | 41 | 20.45 | 3.95 | 17.20 | 1.95 | 100 |
| 2 | 3717623 | seasonal-chemical-83 | tetragonal | 51 | 23.90 | 7.90 | 19.40 | 3.90 | 101 |
| 3 | 7441161 | regional-chemical-84 | orthorhombic | 61 | 27.35 | 11.85 | 21.60 | 5.85 | 102 |
| 4 | 605963 | legacy-chemical-85 | hexagonal | 71 | 30.80 | 15.80 | 23.80 | 7.80 | 103 |

`material_systems` describes the crystallographic and chemical identity of each simulated material. The surrogate `id` (1–4) is the reference key. The business `system_id` takes values like `8189503` and `605963`. The `chemical_formula` column holds strings such as `integrated-chemical-82` and `legacy-chemical-85`. Crystallographic detail is captured across `crystal_system` (`cubic`, `tetragonal`, `orthorhombic`, `hexagonal`), `space_group_number` (41, 51, 61, 71), and three lattice parameters: `lattice_parameter_a` (20.45–30.80), `lattice_parameter_b` (3.95–15.80), and `lattice_parameter_c` (17.20–23.80). The `formation_energy` column stores numeric values from `1.95` to `7.80`. A foreign key `material_property_id` links to `material_properties.id`, creating a one-to-one association between a system and its primary property measurement.

**Table `material_properties`**

| id | property_id | property_name | numeric_value | unit_of_measure | confidence_interval | measurement_method | material_system_id | computational_material_record_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|
| 100 | 23461971 | Baseline Standard D | 5.20 | composite-unit-69 | 8.70 | DFT | 1 | 100 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 101 | 9424936 | Distributed Framework | 9.40 | primary-unit-70 | 11.40 | MD | 2 | 101 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 102 | 4985172 | Adaptive Protocol | 13.60 | adaptive-unit-71 | 14.10 | experiment | 3 | 102 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 103 | 25566008 | Primary Programme A | 17.80 | distributed-unit-72 | 16.80 | ML_prediction | 4 | 103 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

`material_properties` holds the quantitative measurements derived from material systems. Its surrogate `id` (100–103) is referenced by `material_systems.material_property_id` and by `computational_material_records` through the view layer. The business `property_id` takes values like `23461971` and `25566008`. The `property_name` column carries names such as `Baseline Standard D`, `Distributed Framework`, `Adaptive Protocol A`, and `Primary Programme A`. The `numeric_value` column stores measurements (`5.20`, `9.40`, `13.60`, `17.80`), `unit_of_measure` holds strings like `composite-unit-69` and `distributed-unit-72`, and `confidence_interval` stores values from `8.70` to `16.80`. The `measurement_method` column distinguishes between `DFT`, `MD`, `experiment`, and `ML_prediction`. Two foreign keys anchor the property: `material_system_id` references `material_systems.id`, and `computational_material_record_id` references `computational_material_records.computational_material_record_id`. Timestamps `created_at` and `updated_at` record the lifecycle (e.g., property `100` was created on `2025-01-01` and updated on `2025-01-02`).

**Table `parsing_pipelines`**

| pipeline_id | pipeline_name | start_date_time | end_date_time | status | records_processed | center_id | parsed_data_store_id |
|---|---|---|---|---|---|---|---|
| en_US | Adaptive Series | 2024-07-24T18:42:00 | 2025-12-16T11:09:00 | pending | 33 | 5844261 | 1000 |
| 43197171 | Primary Assessment | 2025-12-08T01:59:00 | 2022-05-27T18:26:00 | running | 38 | 1437588 | 1001 |
| 7731880 | Composite Survey D | 2022-05-19T08:16:00 | 2023-10-11T01:43:00 | completed | 43 | 6564397 | 1002 |
| 10782184 | Compact Corridor | 2023-10-03T15:33:00 | 2024-03-22T08:00:00 | failed | 48 | default_chart_a_tax_13 | 1003 |

`parsing_pipelines` models the data ingestion workflows that process raw simulation outputs. The primary key `pipeline_id` is a string in some rows (`en_US`, `43197171`, `7731880`, `10782184`). The `pipeline_name` column holds names like `Adaptive Series`, `Primary Assessment`, `Composite Survey D`, and `Compact Corridor`. Temporal bounds are captured in `start_date_time` and `end_date_time` (e.g., the `Adaptive Series` pipeline ran from `2024-07-24T18:42:00` to `2025-12-16T11:09:00`). The `status` column takes values `pending`, `running`, `completed`, and `failed`. The `records_processed` column counts items ingested (33–48). Two foreign keys exist: `center_id` references `high_performance_computer_centers.center_id`, and `parsed_data_store_id` references `parsed_data_stores.id`. Pipeline `en_US` runs on centre `5844261` and stores to `1000`; pipeline `10782184` runs on centre `default_chart_a_tax_13` and stores to `1003`.

**Table `high_performance_computer_centers`**

| center_id | center_name | location | total_compute_nodes | peak_performance_flops | operational_status | computational_code_id | big_data_analytics_tool_id |
|---|---|---|---|---|---|---|---|
| 5844261 | Seasonal Survey | extended-location-99 | 17 | 16.20 | active | 1 | 1 |
| 1437588 | Integrated Corridor | integrated-location-100 | 37 | 18.40 | maintenance | 2 | 2 |
| 6564397 | Extended Series D | seasonal-location-101 | 47 | 20.60 | offline | 3 | 3 |
| default_chart_a_tax_13 | Pilot Assessment | regional-location-102 | 16 | 22.80 | active | 4 | 4 |

`high_performance_computer_centers` describes the compute infrastructure. The surrogate `center_id` (values `5844261`, `1437588`, `6564397`, `default_chart_a_tax_13`) is the primary key. The `center_name` column holds names like `Seasonal Survey`, `Integrated Corridor`, `Extended Series D`, and `Pilot Assessment`. The `location` column stores strings such as `extended-location-99` and `regional-location-102`. Infrastructure capacity is captured in `total_compute_nodes` (16–47) and `peak_performance_flops` (16.20–22.80). The `operational_status` column takes values `active`, `maintenance`, and `offline`. Two foreign keys link the centre to its software ecosystem: `computational_code_id` references `computational_codes.id`, and `big_data_analytics_tool_id` references `big_data_analytics_tools.id`. Centre `5844261` hosts code `1` and tool `1`; centre `default_chart_a_tax_13` hosts code `4` and tool `4`.

**Table `big_data_analytics_tools`**

| id | tool_id | tool_name | algorithm_type | start_date | end_date | status | novel_materials_discovered | parsed_data_store_id | center_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | comi | Composite Model | data_mining | 2022-09-05 | 2022-09-01 | planned | 46 | 1000 | 5844261 |
| 2 | 195360 | Compact Cluster A | statistical_analysis | 2023-02-16 | 2023-02-12 | running | 55 | 1001 | 1437588 |
| 3 | 3355763 | Legacy Review | machine_learning | 2024-07-27 | 2024-07-23 | completed | 64 | 1002 | 6564397 |
| 4 | 8387539 | Regional Initiative | neural_network | 2025-12-11 | 2025-12-07 | archived | 73 | 1003 | default_chart_a_tax_13 |

`big_data_analytics_tools` stores the analytics software used to process and analyse parsed material data. Its surrogate primary key `id` (1–4) is referenced by `high_performance_computer_centers.big_data_analytics_tool_id` and by the `tools_systems` junction table. Each tool has a business `tool_id`, a `tool_name`, a `version`, a `license_type` (`open_source`, `proprietary`, `academic`), and a `vendor` field identifying the software provider. The tool ecosystem enables the big-data layer of the materials pipeline, connecting compute centres to material systems through the `tools_systems` relationship.

**Table `parsed_data_stores`**

| parsed_data_store_id | store_id | store_name | total_records | last_updated | storage_size_g_b | data_integrity_status | big_data_analytics_tool_id | visualization_service_id |
|---|---|---|---|---|---|---|---|---|
| 1000 | pgc_pyme_551 | Distributed Standard | 235 | 2023-06-17T17:27:00 | 0.96 | verified | 1 | 100 |
| 1001 | ee5baef3-0504-4234-bef8-c21eaafd150e | Adaptive Framework D | 6 | 2024-11-01T00:44:00 | 0.63 | pending_verification | 2 | 101 |
| 1002 | 2986218 | Primary Protocol | 4 | 2025-04-12T07:01:00 | 0.46 | corrupted | 3 | 102 |
| 1003 | 9424908 | Composite Programme | 5 | 2022-09-23T14:18:00 | 1.19 | verified | 4 | 103 |

`parsed_data_stores` models the storage destinations for parsed simulation outputs. Its surrogate primary key `id` (1000–1003) is referenced by `parsing_pipelines.parsed_data_store_id` and by the `stores_records` junction table. Each store has a business `store_id`, a `store_name`, a `storage_type` (e.g., `S3`, `HDFS`, `local`), a `capacity_gb` field, and an `access_level` (e.g., `public`, `restricted`). The parsed data stores serve as the bridge between ingestion pipelines and downstream analytics and visualization services.

**Table `visualization_services`**

| id | service_id | service_name | endpoint_url | uptime_percentage | max_concurrent_users | active_status | parsed_data_store_id | center_id |
|---|---|---|---|---|---|---|---|---|
| 100 | 1996925 | Distributed Initiative | http://news.sys-con.com/node/4234365 | 16.45 | 33 | false | 1000 | 5844261 |
| 101 | 3990164 | Adaptive Model D | http://marvel.wikia.com/Thor_Odinson_(Earth-616) | 18.90 | 43 | true | 1001 | 1437588 |
| 102 | 5844258 | Primary Cluster | https://bugs.launchpad.net/keystone/+bug/1437032 | 21.35 | 53 | false | 1002 | 6564397 |
| 103 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | Composite Review | https://leetcode.com/problems/snakes-and-ladders | 23.80 | 63 | true | 1003 | default_chart_a_tax_13 |

`visualization_services` captures the rendering and display layer that presents parsed material data to end users. Its surrogate primary key `id` (1–4) is referenced by the `visualization_service_parsed_data_store_view` join. Each service has a business `service_id`, a `service_name`, a `rendering_engine` (e.g., `OpenGL`, `WebGL`, `VTK`), a `supported_format` list, and an `update_frequency` field. Visualization services connect to parsed data stores and compute centres, enabling interactive exploration of material properties and system configurations.

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

The `codes_records` junction table materialises the many-to-many relationship between `computational_material_records` and `computational_codes`. Each row contains a `computational_material_record_id` and a `computational_code_id`, allowing a single material record to be associated with multiple codes and a single code to appear across multiple records. This table is the relational counterpart to the ontology's `hasCode` relationship, and it is the foundation for the `computational_material_record_computational_code_view`.

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

The `systems_records` junction table materialises the many-to-many relationship between `computational_material_records` and `material_systems`. Each row pairs a `computational_material_record_id` with a `material_system_id`, enabling a single record to reference multiple material systems and a single system to appear across multiple records. This table underpins the `computational_material_record_material_system_view` and the `material_system_computational_material_record_detail_view`.

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

The `pipelines_records` junction table materialises the many-to-many relationship between `computational_material_records` and `parsing_pipelines`. Each row contains a `computational_material_record_id` and a `pipeline_id`, allowing records to be associated with multiple pipelines and pipelines to process multiple records. This table supports the `computational_material_record_parsing_pipeline_view` and the `parsing_pipeline_computational_material_record_detail_view`.

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

The `centers_pipelines` junction table materialises the many-to-many relationship between `high_performance_computer_centers` and `parsing_pipelines`. Each row pairs a `center_id` with a `pipeline_id`, enabling a compute centre to host multiple pipelines and a pipeline to span multiple centres. This table underpins the `parsing_pipeline_high_performance_computer_center_view` and the `high_performance_computer_center_parsing_pipeline_detail_view`.

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

The `tools_systems` junction table materialises the many-to-many relationship between `big_data_analytics_tools` and `material_systems`. Each row contains a `big_data_analytics_tool_id` and a `material_system_id`, allowing tools to be applied to multiple systems and systems to be analysed by multiple tools. This table supports the `big_data_analytics_tool_material_system_detail_view` and the `material_system_material_property_view` through its connection to the analytics layer.

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

The `stores_records` junction table materialises the many-to-many relationship between `parsed_data_stores` and `visualization_services`. Each row pairs a `parsed_data_store_id` with a `visualization_service_id`, enabling stores to feed multiple visualization services and services to draw from multiple stores. This table underpins the `parsed_data_store_visualization_service_view` and the `visualization_service_parsed_data_store_view`.

### Analytical Views

Each view reconstructs a domain fact by joining the normalised base tables. The following sections interpret what question each view answers and walk through concrete rows as evidence.

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

This view joins `computational_material_records` to `computational_codes` on `computational_code_id = id`, answering the question: *Which simulation code produced which material record?* Row `100` of the view shows record `10449530` was produced by code `levels` (version `seasonal-version-71`, license `open_source`), running on centre `5844261`. Row `103` shows record `20743593` was produced by code `627` (version `compact-version-74`, license `open_source`), running on centre `default_chart_a_tax_13`.

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

This view joins `computational_material_records` to `material_systems` on `material_system_id = id`, answering: *Which material system is associated with which record?* Row `100` links record `10449530` to system `8189503` (formula `integrated-chemical-82`, crystal system `cubic`, space group `41`, lattice parameters `20.45 × 3.95 × 17.20`, formation energy `1.95`). Row `103` links record `20743593` to system `605963` (formula `legacy-chemical-85`, crystal system `hexagonal`, space group `71`, lattice parameters `30.80 × 15.80 × 23.80`, formation energy `7.80`).

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

This view joins `computational_material_records` to `parsing_pipelines` on `pipeline_id = pipeline_id`, answering: *Which parsing pipeline processed which material record?* Row `100` shows record `10449530` was processed by pipeline `Adaptive Series` (status `pending`, `33` records processed, centre `5844261`, store `1000`). Row `103` shows record `20743593` was processed by pipeline `Compact Corridor` (status `failed`, `48` records processed, centre `default_chart_a_tax_13`, store `1003`).

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

This view joins `computational_codes` to `computational_material_records` in the reverse direction, answering: *For a given code, which material records did it produce?* Code `1` (`levels`, `seasonal-version-71`, `open_source`, developer `regional-develope-48`) produced record `100` (file `pilot-file-44`, size `32` bytes, status `parsed`). Code `3` (`account_pymes_255`, `legacy-version-73`, `academic`, developer `compact-develope-50`) produced record `102` (file `integrated-file-46`, size `44` bytes, status `archived`).

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

This view joins `computational_codes` to `high_performance_computer_centers` on `center_id = center_id`, answering: *Which compute centre hosts which code?* Code `1` (`levels`) runs on centre `Seasonal Survey` (location `extended-location-99`, `17` nodes, peak `16.20` flops, status `active`). Code `4` (`627`) runs on centre `Pilot Assessment` (location `regional-location-102`, `16` nodes, peak `22.80` flops, status `active`).

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

This view joins `material_systems` to `computational_material_records` in the reverse direction, answering: *For a given material system, which records reference it?* System `8189503` (formula `integrated-chemical-82`, cubic, space group `41`) is referenced by record `100` (file `pilot-file-44`, status `parsed`). System `605963` (formula `legacy-chemical-85`, hexagonal, space group `71`) is referenced by record `103` (file `seasonal-file-47`, status `corrupted`).

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

This view joins `material_systems` to `material_properties` on `material_property_id = id`, answering: *What property measurement is associated with each material system?* System `8189503` (cubic, `integrated-chemical-82`) has property `23461971` named `Baseline Standard D` with numeric value `5.20` in `composite-unit-69`, measured by `DFT` with confidence interval `8.70`. System `605963` (hexagonal, `legacy-chemical-85`) has property `25566008` named `Primary Programme A` with numeric value `17.80` in `distributed-unit-72`, measured by `ML_prediction` with confidence interval `16.80`.

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

This view joins `material_properties` to `material_systems` in the reverse direction, answering: *For a given property, which material system does it describe?* Property `23461971` (`Baseline Standard D`, value `5.20`, method `DFT`) describes system `8189503` (formula `integrated-chemical-82`, cubic, space group `41`, lattice `20.45 × 3.95 × 17.20`, formation energy `1.95`). Property `25566008` (`Primary Programme A`, value `17.80`, method `ML_prediction`) describes system `605963` (formula `legacy-chemical-85`, hexagonal, space group `71`, lattice `30.80 × 15.80 × 23.80`, formation energy `7.80`).

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

This view joins `material_properties` to `computational_material_records` on `computational_material_record_id = computational_material_record_id`, answering: *Which material record is associated with which property measurement?* Property `23461971` (`Baseline Standard D`, value `5.20`, method `DFT`) is associated with record `100` (file `pilot-file-44`, status `parsed`, created `2022-01-13`). Property `25566008` (`Primary Programme A`, value `17.80`, method `ML_prediction`) is associated with record `103` (file `seasonal-file-47`, status `corrupted`, created `2025-04-19`).

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

This view joins `parsing_pipelines` to `computational_material_records` in the reverse direction, answering: *For a given pipeline, which material records did it process?* Pipeline `Adaptive Series` (status `pending`, `33` records, centre `5844261`, store `1000`) processed record `100` (file `pilot-file-44`, status `parsed`, code `1`, system `1`). Pipeline `Compact Corridor` (status `failed`, `48` records, centre `default_chart_a_tax_13`, store `1003`) processed record `103` (file `seasonal-file-47`, status `corrupted`, code `4`, system `4`).

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

This view joins `parsing_pipelines` to `high_performance_computer_centers` on `center_id = center_id`, answering: *Which compute centre runs which parsing pipeline?* Pipeline `Adaptive Series` (status `pending`, `33` records) runs on centre `Seasonal Survey` (location `extended-location-99`, `17` nodes, peak `16.20` flops, status `active`). Pipeline `Compact Corridor` (status `failed`, `48` records) runs on centre `Pilot Assessment` (location `regional-location-102`, `16` nodes, peak `22.80` flops, status `active`).

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

This view joins `parsing_pipelines` to `parsed_data_stores` on `parsed_data_store_id = id`, answering: *Which parsed data store receives output from which pipeline?* Pipeline `Adaptive Series` (status `pending`, `33` records) stores to store `1000`. Pipeline `Primary Assessment` (status `running`, `38` records) stores to store `1001`. Pipeline `Composite Survey D` (status `completed`, `43` records) stores to store `1002`. Pipeline `Compact Corridor` (status `failed`, `48` records) stores to store `1003`.

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

This view joins `high_performance_computer_centers` to `computational_codes` in the reverse direction, answering: *For a given compute centre, which codes does it host?* Centre `Seasonal Survey` (location `extended-location-99`, `17` nodes, peak `16.20` flops, status `active`) hosts code `1` (`levels`, version `seasonal-version-71`, license `open_source`, developer `regional-develope-48`). Centre `Pilot Assessment` (location `regional-location-102`, `16` nodes, peak `22.80` flops, status `active`) hosts code `4` (`627`, version `compact-version-74`, license `open_source`, developer `composite-develope-51`).

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

This view joins `high_performance_computer_centers` to `parsing_pipelines` in the reverse direction, answering: *For a given compute centre, which parsing pipelines does it run?* Centre `Seasonal Survey` (location `extended-location-99`, `17` nodes, peak `16.20` flops, status `active`) runs pipeline `Adaptive Series` (status `pending`, `33` records, store `1000`). Centre `Pilot Assessment` (location `regional-location-102`, `16` nodes, peak `22.80` flops, status `active`) runs pipeline `Compact Corridor` (status `failed`, `48` records, store `1003`).

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

This view joins `high_performance_computer_centers` to `big_data_analytics_tools` on `big_data_analytics_tool_id = id`, answering: *Which big data analytics tool is deployed on which compute centre?* Centre `Seasonal Survey` (location `extended-location-99`, `17` nodes, peak `16.20` flops, status `active`) uses tool `1`. Centre `Integrated Corridor` (location `integrated-location-100`, `37` nodes, peak `18.40` flops, status `maintenance`) uses tool `2`. Centre `Extended Series D` (location `seasonal-location-101`, `47` nodes, peak `20.60` flops, status `offline`) uses tool `3`. Centre `Pilot Assessment` (location `regional-location-102`, `16` nodes, peak `22.80` flops, status `active`) uses tool `4`.

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

This view joins `big_data_analytics_tools` to `parsed_data_stores` through the `stores_records` junction table, answering: *Which parsed data stores are consumed by which analytics tools?* Tool `1` consumes store `1000`. Tool `2` consumes store `1001`. Tool `3` consumes store `1002`. Tool `4` consumes store `1003`. This relationship enables the analytics layer to read parsed outputs and feed them into downstream material analysis workflows.

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

This view joins `big_data_analytics_tools` to `material_systems` through the `tools_systems` junction table, answering: *For a given analytics tool, which material systems does it analyse?* Tool `1` analyses system `8189503` (formula `integrated-chemical-82`, cubic, space group `41`, lattice `20.45 × 3.95 × 17.20`, formation energy `1.95`). Tool `4` analyses system `605963` (formula `legacy-chemical-85`, hexagonal, space group `71`, lattice `30.80 × 15.80 × 23.80`, formation energy `7.80`).

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

This view joins `big_data_analytics_tools` to `high_performance_computer_centers` in the reverse direction, answering: *For a given analytics tool, which compute centres deploy it?* Tool `1` is deployed on centre `Seasonal Survey` (location `extended-location-99`, `17` nodes, peak `16.20` flops, status `active`). Tool `4` is deployed on centre `Pilot Assessment` (location `regional-location-102`, `16` nodes, peak `22.80` flops, status `active`).

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

This view joins `parsed_data_stores` to `computational_material_records` through the `pipelines_records` and `parsing_pipelines` tables, answering: *For a given parsed data store, which material records does it contain?* Store `1000` contains record `100` (file `pilot-file-44`, status `parsed`, code `1`, system `1`). Store `1003` contains record `103` (file `seasonal-file-47`, status `corrupted`, code `4`, system `4`).

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

This view joins `parsed_data_stores` to `big_data_analytics_tools` in the reverse direction through the `stores_records` junction table, answering: *For a given parsed data store, which analytics tools consume it?* Store `1000` is consumed by tool `1`. Store `1001` is consumed by tool `2`. Store `1002` is consumed by tool `3`. Store `1003` is consumed by tool `4`.

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

This view joins `parsed_data_stores` to `visualization_services` through the `stores_records` junction table, answering: *For a given parsed data store, which visualization services render its data?* Store `1000` is rendered by service `1`. Store `1001` is rendered by service `2`. Store `1002` is rendered by service `3`. Store `1003` is rendered by service `4`.

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

This view joins `visualization_services` to `parsed_data_stores` in the reverse direction through the `stores_records` junction table, answering: *For a given visualization service, which parsed data stores does it draw from?* Service `1` draws from store `1000`. Service `2` draws from store `1001`. Service `3` draws from store `1002`. Service `4` draws from store `1003`.

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

This view joins `visualization_services` to `high_performance_computer_centers` through the `stores_records` and `parsing_pipelines` tables, answering: *For a given visualization service, which compute centre provides the underlying data?* Service `1` draws data from centre `Seasonal Survey` (location `extended-location-99`, `17` nodes, peak `16.20` flops, status `active`). Service `4` draws data from centre `Pilot Assessment` (location `regional-location-102`, `16` nodes, peak `22.80` flops, status `active`).

### Synthesis

The relational schema materialises a nine-entity ontology with five many-to-many relationships. The three core fact tables—`computational_material_records`, `computational_codes`, and `material_systems`—are linked through direct foreign keys and through the five junction tables (`codes_records`, `systems_records`, `pipelines_records`, `centers_pipelines`, `tools_systems`, `stores_records`). The supporting entity tables—`material_properties`, `parsing_pipelines`, `high_performance_computer_centers`, `big_data_analytics_tools`, `parsed_data_stores`, and `visualization_services`—provide the infrastructure and measurement context. The twenty-three analytical views reconstruct domain facts by joining these normalised tables, each view answering a specific provenance or deployment question. Together, the base tables and views form a complete, queryable representation of the computational materials science domain, from simulation code execution through parsing, storage, analytics, and visualization.