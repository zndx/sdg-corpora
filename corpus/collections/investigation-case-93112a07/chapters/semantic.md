## Ontology-Grounded Relational Modelling in Legal-Tech Forensic Operations

The domain under examination concerns the orchestration of legal technology solution labs within a forensic investigation ecosystem. Each lab serves as a central organisational hub that coordinates investigation cases, deploys artificial intelligence engines, and integrates data analysis tools, while being operationally anchored to both discovery and forensic operation centres. The relational schema materialises this ontology through six base tables whose primary keys and foreign-key columns encode a star-like topology: `investigation_cases` sits at the centre of case-level facts, `legal_tech_solution_labs` anchors the organisational layer, and the four peripheral tables — `discovery_operation_centers`, `forensic_operation_centers`, `a_i_engines`, and `data_analysis_tools` — provide specialised attribute sets that are linked back to the lab through foreign keys. The following sections walk through the entity types, their attributes, the cardinality-bounded relationships that become columns and join keys, and the materialised views that reconstruct domain facts from the normalised tables.

**Table `investigation_cases`**

| case_id | case_title | start_date | end_date | case_status | case_type | data_volume | lab_id | engine_id | data_analysis_tool_id |
|---|---|---|---|---|---|---|---|---|---|
| 39800622 | Integrated Assessment A | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | pending | compliance_breach | 9.95 | 2106706 | 5006437 | 100 |
| 4891 | Extended Survey | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | active | litigation | 12.90 | 1437591 | 726035 | 101 |
| 17374813 | Pilot Corridor | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | closed | fraud | 15.85 | 12042 | 8843749 | 102 |
| state_uk_9 | Baseline Series D | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | failed | cyber_security | 18.80 | 1562831 | 209207 | 103 |

The `investigation_cases` table is the primary fact table for case-level records. Its surrogate primary key, `case_id`, carries heterogeneous identifiers such as `39800622` for the *Integrated Assessment A* case and `state_uk_9` for the *Baseline Series D* case, reflecting a mix of numeric and state-tagged identifiers. The descriptive columns `case_title`, `start_date`, and `end_date` capture the temporal scope of each investigation; for instance, case `39800622` spans from `2022-09-05T20:24:00` to `2022-09-01T08:00:00`, while case `state_uk_9` is scheduled for `2025-12-11T17:15:00` through `2025-12-07T05:51:00`. The `case_status` column enumerates lifecycle states — `pending`, `active`, `closed`, and `failed` — and `case_type` classifies the nature of the investigation as `compliance_breach`, `litigation`, `fraud`, or `cyber_security`. The numeric column `data_volume` (e.g., `9.95` for case `39800622`, `18.80` for case `state_uk_9`) quantifies the data footprint of each case. Crucially, three foreign-key columns — `lab_id`, `engine_id`, and `data_analysis_tool_id` — bind each case to its parent lab, its assigned AI engine, and its data analysis tool, respectively. These FK columns are the join keys that the views later exploit.

**Table `legal_tech_solution_labs`**

| lab_id | lab_name | location | establishment_date | isms_compliant | service_scope | supported_languages | discovery_operation_center_id | forensic_operation_center_id | engine_id | data_analysis_tool_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 2106706 | Baseline Protocol D | extended-location-99 | 2024-07-11 | false | discovery | english | 1 | 100 | 5006437 | 100 |
| 1437591 | Distributed Programme | integrated-location-100 | 2025-12-22 | true | forensics | japanese | 2 | 101 | 726035 | 101 |
| 12042 | Adaptive Standard | seasonal-location-101 | 2022-05-06 | false | cyber_security | chinese | 3 | 102 | 8843749 | 102 |
| 1562831 | Primary Framework A | regional-location-102 | 2023-10-17 | true | independent_committee | korean | 4 | 103 | 209207 | 103 |

The `legal_tech_solution_labs` table defines the organisational entities. Its primary key `lab_id` (e.g., `2106706`, `1437591`, `12042`, `1562831`) identifies each lab. The `lab_name` column carries names such as *Baseline Protocol D* and *Primary Framework A*, while `location` stores values like `extended-location-99` and `regional-location-102`. The `establishment_date` column (e.g., `2024-07-11`) records when the lab was founded. The boolean `isms_compliant` flag indicates whether the lab adheres to an Information Security Management System — `true` for labs `1437591` and `1562831`, `false` for labs `2106706` and `12042`. The `service_scope` column enumerates operational domains: `discovery`, `forensics`, `cyber_security`, and `independent_committee`. The `supported_languages` column stores `english`, `japanese`, `chinese`, and `korean` for the four labs respectively. Four additional foreign-key columns — `discovery_operation_center_id`, `forensic_operation_center_id`, `engine_id`, and `data_analysis_tool_id` — link each lab to its discovery centre, forensic centre, AI engine, and data analysis tool, forming the backbone of the relational model's join structure.

**Table `discovery_operation_centers`**

| discovery_operation_center_id | center_id | center_name | focus_area | data_sources | analysis_techniques | lab_id | case_id |
|---|---|---|---|---|---|---|---|
| 1 | 5844261 | Seasonal Survey | discovery | servers | data_analysis | 2106706 | 39800622 |
| 2 | 1437588 | Integrated Corridor | evidence_disclosure | computers | log_based_behavioral_analysis | 1437591 | 4891 |
| 3 | 6564397 | Extended Series D | international_litigation | cloud | data_analysis | 12042 | 17374813 |
| 4 | default_chart_a_tax_13 | Pilot Assessment | discovery | mobile_devices | log_based_behavioral_analysis | 1562831 | state_uk_9 |

The `discovery_operation_centers` table captures the discovery-side operational infrastructure. Its primary key `discovery_operation_center_id` (values `1` through `4`) identifies each centre. The `center_id` column carries identifiers such as `5844261` and `default_chart_a_tax_13`, while `center_name` stores names like *Seasonal Survey* and *Pilot Assessment*. The `focus_area` column distinguishes between `discovery` and `evidence_disclosure` and `international_litigation`, and `data_sources` enumerates `servers`, `computers`, `cloud`, and `mobile_devices`. The `analysis_techniques` column records methods such as `data_analysis` and `log_based_behavioral_analysis`. Two foreign-key columns — `lab_id` and `case_id` — bind each discovery centre to its parent lab and to an investigation case, enabling the reconstruction of which case is being served by which discovery infrastructure.

**Table `forensic_operation_centers`**

| forensic_operation_center_id | center_id | center_name | focus_area | techniques | reporting_capability | lab_id | case_id |
|---|---|---|---|---|---|---|---|
| 100 | 5844261 | Seasonal Survey | forensics | data_salvaging | true | 2106706 | 39800622 |
| 101 | 1437588 | Integrated Corridor | fraud_investigation | data_restoration | false | 1437591 | 4891 |
| 102 | 6564397 | Extended Series D | digital_forensics | log_tracing | true | 12042 | 17374813 |
| 103 | default_chart_a_tax_13 | Pilot Assessment | forensics | behavioral_analysis | false | 1562831 | state_uk_9 |

The `forensic_operation_centers` table mirrors the discovery centres on the forensic side. Its primary key `forensic_operation_center_id` (values `100` through `103`) identifies each centre. The `center_id` column carries the same identifiers as the discovery centres (`5844261`, `1437588`, `6564397`, `default_chart_a_tax_13`), and `center_name` stores matching names (*Seasonal Survey*, *Integrated Corridor*, *Extended Series D*, *Pilot Assessment*). The `focus_area` column enumerates `forensics`, `fraud_investigation`, and `digital_forensics`. The `techniques` column records `data_salvaging`, `data_restoration`, `log_tracing`, and `behavioral_analysis`. The boolean `reporting_capability` flag indicates whether the centre can produce reports — `true` for centres `100` and `102`, `false` for `101` and `103`. As with discovery centres, `lab_id` and `case_id` foreign-key columns bind each forensic centre to its parent lab and to an investigation case.

**Table `a_i_engines`**

| engine_id | engine_name | version | training_data | supported_languages | processing_efficiency | lab_id | case_id |
|---|---|---|---|---|---|---|---|
| 5006437 | Baseline Series D | seasonal-version-71 | primary-training-34 | english | 23.70 | 2106706 | 39800622 |
| 726035 | Distributed Assessment | regional-version-72 | adaptive-training-35 | japanese | 28.40 | 1437591 | 4891 |
| 8843749 | Adaptive Survey | legacy-version-73 | distributed-training-36 | chinese | 33.10 | 12042 | 17374813 |
| 209207 | Primary Corridor A | compact-version-74 | baseline-training-37 | korean | 37.80 | 1562831 | state_uk_9 |

The `a_i_engines` table defines the artificial intelligence engines deployed across the ecosystem. Its primary key `engine_id` (e.g., `5006437`, `726035`, `8843749`, `209207`) identifies each engine. The `engine_name` column carries names such as *Baseline Series D* and *Primary Corridor A*. The `version` column stores version strings like `seasonal-version-71` and `compact-version-74`, while `training_data` records the training dataset type (`primary-training-34`, `adaptive-training-35`, `distributed-training-36`, `baseline-training-37`). The `supported_languages` column mirrors the lab-level language support, and `processing_efficiency` is a numeric metric (e.g., `23.70` for engine `5006437`, `37.80` for engine `209207`). The `lab_id` and `case_id` foreign-key columns bind each AI engine to its parent lab and to an investigation case.

**Table `data_analysis_tools`**

| id | tool_id | tool_name | tool_type | developer | version | features | lab_id | case_id |
|---|---|---|---|---|---|---|---|---|
| 100 | comi | Composite Model | litigation_support | extended-develope-63 | seasonal-version-71 | data_collection | 2106706 | 39800622 |
| 101 | 195360 | Compact Cluster A | data_analysis | integrated-develope-64 | regional-version-72 | preservation | 1437591 | 4891 |
| 102 | 3355763 | Legacy Review | log_tracing | seasonal-develope-65 | legacy-version-73 | analysis | 12042 | 17374813 |
| 103 | 8387539 | Regional Initiative | information_aggregation | regional-develope-66 | compact-version-74 | reporting | 1562831 | state_uk_9 |

The `data_analysis_tools` table defines the data analysis tooling. Its primary key `id` (values `100` through `103`) identifies each tool. The `tool_id` column carries identifiers such as `comi`, `195360`, `3355763`, and `8387539`. The `tool_name` column stores names like *Composite Model*, *Compact Cluster A*, *Legacy Review*, and *Regional Initiative*. The `tool_type` column enumerates `litigation_support`, `data_analysis`, `log_tracing`, and `information_aggregation`. The `developer` column stores values such as `extended-develope-63` and `regional-develope-66`. The `version` column mirrors the engine versioning pattern, and `features` records capabilities like `data_collection`, `preservation`, `analysis`, and `reporting`. The `lab_id` and `case_id` foreign-key columns bind each tool to its parent lab and to an investigation case.

The foreign-key topology of this schema is characterised by two complementary linkage patterns. In the `investigation_cases` table, the FK columns `lab_id`, `engine_id`, and `data_analysis_tool_id` point outward to `legal_tech_solution_labs`, `a_i_engines`, and `data_analysis_tools` respectively, establishing a many-to-one relationship from cases to their parent resources. In the four peripheral tables (`discovery_operation_centers`, `forensic_operation_centers`, `a_i_engines`, `data_analysis_tools`), the FK columns `lab_id` and `case_id` point inward to `legal_tech_solution_labs` and `investigation_cases`, establishing the reverse linkage. This bidirectional FK structure ensures that every fact table row can be joined to its organisational and resource context from either direction.

### View-Based Reconstruction of Domain Facts

The materialised views in this schema serve as pre-joined projections that answer specific domain questions by combining the normalised tables. Each view is defined as a `SELECT` with explicit `JOIN` clauses that reconstruct a domain fact from the base tables. The following sections interpret each view's join logic and illustrate the reconstructed facts with concrete rows.

**View `vw_investigation_case_legal_tech_solution_lab`**

```sql
CREATE VIEW vw_investigation_case_legal_tech_solution_lab AS
SELECT a.case_id, a.case_title, a.start_date, a.end_date, b.lab_id AS lab_lab_id, b.lab_name AS lab_lab_name, b.location AS lab_location
FROM investigation_cases a JOIN legal_tech_solution_labs b ON a.lab_id = b.lab_id;
```

| case_id | case_title | start_date | end_date | lab_lab_id | lab_lab_name | lab_location |
|---|---|---|---|---|---|---|
| 39800622 | Integrated Assessment A | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | 2106706 | Baseline Protocol D | extended-location-99 |
| 4891 | Extended Survey | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | 1437591 | Distributed Programme | integrated-location-100 |
| 17374813 | Pilot Corridor | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | 12042 | Adaptive Standard | seasonal-location-101 |
| state_uk_9 | Baseline Series D | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | 1562831 | Primary Framework A | regional-location-102 |

The view `vw_investigation_case_legal_tech_solution_lab` joins `investigation_cases` to `legal_tech_solution_labs` on `investigation_cases.lab_id = legal_tech_solution_labs.lab_id`. This view answers the question: *which legal tech solution lab is responsible for each investigation case?* For case `39800622` (*Integrated Assessment A*), the join yields lab `2106706` (*Baseline Protocol D*), which is located at `extended-location-99`, is not `isms_compliant`, operates with `discovery` scope, and supports `english`. For case `state_uk_9` (*Baseline Series D*), the join yields lab `1562831` (*Primary Framework A*), which is `isms_compliant`, operates with `independent_committee` scope, and supports `korean`.

**View `vw_investigation_case_a_i_engine`**

```sql
CREATE VIEW vw_investigation_case_a_i_engine AS
SELECT a.case_id, a.case_title, a.start_date, a.end_date, b.engine_id AS engine_engine_id, b.engine_name AS engine_engine_name, b.version AS engine_version
FROM investigation_cases a JOIN a_i_engines b ON a.engine_id = b.engine_id;
```

| case_id | case_title | start_date | end_date | engine_engine_id | engine_engine_name | engine_version |
|---|---|---|---|---|---|---|
| 39800622 | Integrated Assessment A | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | 5006437 | Baseline Series D | seasonal-version-71 |
| 4891 | Extended Survey | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | 726035 | Distributed Assessment | regional-version-72 |
| 17374813 | Pilot Corridor | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | 8843749 | Adaptive Survey | legacy-version-73 |
| state_uk_9 | Baseline Series D | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | 209207 | Primary Corridor A | compact-version-74 |

The view `vw_investigation_case_a_i_engine` joins `investigation_cases` to `a_i_engines` on `investigation_cases.engine_id = a_i_engines.engine_id`. This view answers: *which AI engine is assigned to each investigation case?* For case `39800622`, the join yields engine `5006437` (*Baseline Series D*), version `seasonal-version-71`, trained on `primary-training-34`, supporting `english`, with a processing efficiency of `23.70`. For case `17374813` (*Pilot Corridor*), the join yields engine `8843749` (*Adaptive Survey*), version `legacy-version-73`, trained on `distributed-training-36`, supporting `chinese`, with a processing efficiency of `33.10`.

**View `vw_investigation_case_data_analysis_tool`**

```sql
CREATE VIEW vw_investigation_case_data_analysis_tool AS
SELECT a.case_id, a.case_title, a.start_date, a.end_date, b.id AS tool_id, b.tool_id AS tool_tool_id, b.tool_name AS tool_tool_name
FROM investigation_cases a JOIN data_analysis_tools b ON a.data_analysis_tool_id = b.id;
```

| case_id | case_title | start_date | end_date | tool_id | tool_tool_id | tool_tool_name |
|---|---|---|---|---|---|---|
| 39800622 | Integrated Assessment A | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | 100 | comi | Composite Model |
| 4891 | Extended Survey | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | 101 | 195360 | Compact Cluster A |
| 17374813 | Pilot Corridor | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | 102 | 3355763 | Legacy Review |
| state_uk_9 | Baseline Series D | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | 103 | 8387539 | Regional Initiative |

The view `vw_investigation_case_data_analysis_tool` joins `investigation_cases` to `data_analysis_tools` on `investigation_cases.data_analysis_tool_id = data_analysis_tools.id`. This view answers: *which data analysis tool is assigned to each investigation case?* For case `39800622`, the join yields tool `100` (*Composite Model*), type `litigation_support`, developed by `extended-develope-63`, version `seasonal-version-71`, with feature `data_collection`. For case `4891` (*Extended Survey*), the join yields tool `101` (*Compact Cluster A*), type `data_analysis`, developed by `integrated-develope-64`, version `regional-version-72`, with feature `preservation`.

**View `vw_legal_tech_solution_lab_discovery_operation_center`**

```sql
CREATE VIEW vw_legal_tech_solution_lab_discovery_operation_center AS
SELECT a.lab_id, a.lab_name, a.location, a.establishment_date, b.discovery_operation_center_id AS center_discovery_operation_center_id, b.center_id AS center_center_id, b.center_name AS center_center_name
FROM legal_tech_solution_labs a JOIN discovery_operation_centers b ON a.discovery_operation_center_id = b.discovery_operation_center_id;
```

| lab_id | lab_name | location | establishment_date | center_discovery_operation_center_id | center_center_id | center_center_name |
|---|---|---|---|---|---|---|
| 2106706 | Baseline Protocol D | extended-location-99 | 2024-07-11 | 1 | 5844261 | Seasonal Survey |
| 1437591 | Distributed Programme | integrated-location-100 | 2025-12-22 | 2 | 1437588 | Integrated Corridor |
| 12042 | Adaptive Standard | seasonal-location-101 | 2022-05-06 | 3 | 6564397 | Extended Series D |
| 1562831 | Primary Framework A | regional-location-102 | 2023-10-17 | 4 | default_chart_a_tax_13 | Pilot Assessment |

The view `vw_legal_tech_solution_lab_discovery_operation_center` joins `legal_tech_solution_labs` to `discovery_operation_centers` on `legal_tech_solution_labs.discovery_operation_center_id = discovery_operation_centers.discovery_operation_center_id`. This view answers: *which discovery operation centre is associated with each legal tech solution lab?* Lab `2106706` (*Baseline Protocol D*) is linked to discovery centre `1` (*Seasonal Survey*), which focuses on `discovery`, draws data from `servers`, and uses `data_analysis` techniques. Lab `1437591` (*Distributed Programme*) is linked to discovery centre `2` (*Integrated Corridor*), which focuses on `evidence_disclosure`, draws data from `computers`, and uses `log_based_behavioral_analysis` techniques.

**View `vw_legal_tech_solution_lab_forensic_operation_center`**

```sql
CREATE VIEW vw_legal_tech_solution_lab_forensic_operation_center AS
SELECT a.lab_id, a.lab_name, a.location, a.establishment_date, b.forensic_operation_center_id AS center_forensic_operation_center_id, b.center_id AS center_center_id, b.center_name AS center_center_name
FROM legal_tech_solution_labs a JOIN forensic_operation_centers b ON a.forensic_operation_center_id = b.forensic_operation_center_id;
```

| lab_id | lab_name | location | establishment_date | center_forensic_operation_center_id | center_center_id | center_center_name |
|---|---|---|---|---|---|---|
| 2106706 | Baseline Protocol D | extended-location-99 | 2024-07-11 | 100 | 5844261 | Seasonal Survey |
| 1437591 | Distributed Programme | integrated-location-100 | 2025-12-22 | 101 | 1437588 | Integrated Corridor |
| 12042 | Adaptive Standard | seasonal-location-101 | 2022-05-06 | 102 | 6564397 | Extended Series D |
| 1562831 | Primary Framework A | regional-location-102 | 2023-10-17 | 103 | default_chart_a_tax_13 | Pilot Assessment |

The view `vw_legal_tech_solution_lab_forensic_operation_center` joins `legal_tech_solution_labs` to `forensic_operation_centers` on `legal_tech_solution_labs.forensic_operation_center_id = forensic_operation_centers.forensic_operation_center_id`. This view answers: *which forensic operation centre is associated with each legal tech solution lab?* Lab `2106706` (*Baseline Protocol D*) is linked to forensic centre `100` (*Seasonal Survey*), which focuses on `forensics`, uses `data_salvaging` techniques, and has `reporting_capability` set to `true`. Lab `1437591` (*Distributed Programme*) is linked to forensic centre `101` (*Integrated Corridor*), which focuses on `fraud_investigation`, uses `data_restoration` techniques, and has `reporting_capability` set to `false`.

**View `vw_legal_tech_solution_lab_a_i_engine`**

```sql
CREATE VIEW vw_legal_tech_solution_lab_a_i_engine AS
SELECT a.lab_id, a.lab_name, a.location, a.establishment_date, b.engine_id AS engine_engine_id, b.engine_name AS engine_engine_name, b.version AS engine_version
FROM legal_tech_solution_labs a JOIN a_i_engines b ON a.engine_id = b.engine_id;
```

| lab_id | lab_name | location | establishment_date | engine_engine_id | engine_engine_name | engine_version |
|---|---|---|---|---|---|---|
| 2106706 | Baseline Protocol D | extended-location-99 | 2024-07-11 | 5006437 | Baseline Series D | seasonal-version-71 |
| 1437591 | Distributed Programme | integrated-location-100 | 2025-12-22 | 726035 | Distributed Assessment | regional-version-72 |
| 12042 | Adaptive Standard | seasonal-location-101 | 2022-05-06 | 8843749 | Adaptive Survey | legacy-version-73 |
| 1562831 | Primary Framework A | regional-location-102 | 2023-10-17 | 209207 | Primary Corridor A | compact-version-74 |

The view `vw_legal_tech_solution_lab_a_i_engine` joins `legal_tech_solution_labs` to `a_i_engines` on `legal_tech_solution_labs.engine_id = a_i_engines.engine_id`. This view answers: *which AI engine is deployed by each legal tech solution lab?* Lab `2106706` (*Baseline Protocol D*) deploys engine `5006437` (*Baseline Series D*), version `seasonal-version-71`, with processing efficiency `23.70`. Lab `1562831` (*Primary Framework A*) deploys engine `209207` (*Primary Corridor A*), version `compact-version-74`, with processing efficiency `37.80`.

**View `vw_legal_tech_solution_lab_data_analysis_tool`**

```sql
CREATE VIEW vw_legal_tech_solution_lab_data_analysis_tool AS
SELECT a.lab_id, a.lab_name, a.location, a.establishment_date, b.id AS tool_id, b.tool_id AS tool_tool_id, b.tool_name AS tool_tool_name
FROM legal_tech_solution_labs a JOIN data_analysis_tools b ON a.data_analysis_tool_id = b.id;
```

| lab_id | lab_name | location | establishment_date | tool_id | tool_tool_id | tool_tool_name |
|---|---|---|---|---|---|---|
| 2106706 | Baseline Protocol D | extended-location-99 | 2024-07-11 | 100 | comi | Composite Model |
| 1437591 | Distributed Programme | integrated-location-100 | 2025-12-22 | 101 | 195360 | Compact Cluster A |
| 12042 | Adaptive Standard | seasonal-location-101 | 2022-05-06 | 102 | 3355763 | Legacy Review |
| 1562831 | Primary Framework A | regional-location-102 | 2023-10-17 | 103 | 8387539 | Regional Initiative |

The view `vw_legal_tech_solution_lab_data_analysis_tool` joins `legal_tech_solution_labs` to `data_analysis_tools` on `legal_tech_solution_labs.data_analysis_tool_id = data_analysis_tools.id`. This view answers: *which data analysis tool is deployed by each legal tech solution lab?* Lab `2106706` (*Baseline Protocol D*) deploys tool `100` (*Composite Model*), type `litigation_support`, with feature `data_collection`. Lab `1562831` (*Primary Framework A*) deploys tool `103` (*Regional Initiative*), type `information_aggregation`, with feature `reporting`.

**View `vw_discovery_operation_center_legal_tech_solution_lab`**

```sql
CREATE VIEW vw_discovery_operation_center_legal_tech_solution_lab AS
SELECT a.discovery_operation_center_id, a.center_id, a.center_name, a.focus_area, b.lab_id AS lab_lab_id, b.lab_name AS lab_lab_name, b.location AS lab_location
FROM discovery_operation_centers a JOIN legal_tech_solution_labs b ON a.lab_id = b.lab_id;
```

| discovery_operation_center_id | center_id | center_name | focus_area | lab_lab_id | lab_lab_name | lab_location |
|---|---|---|---|---|---|---|
| 1 | 5844261 | Seasonal Survey | discovery | 2106706 | Baseline Protocol D | extended-location-99 |
| 2 | 1437588 | Integrated Corridor | evidence_disclosure | 1437591 | Distributed Programme | integrated-location-100 |
| 3 | 6564397 | Extended Series D | international_litigation | 12042 | Adaptive Standard | seasonal-location-101 |
| 4 | default_chart_a_tax_13 | Pilot Assessment | discovery | 1562831 | Primary Framework A | regional-location-102 |

The view `vw_discovery_operation_center_legal_tech_solution_lab` joins `discovery_operation_centers` to `legal_tech_solution_labs` on `discovery_operation_centers.lab_id = legal_tech_solution_labs.lab_id`. This view answers the reverse question: *which legal tech solution lab does each discovery operation centre serve?* Discovery centre `1` (*Seasonal Survey*) serves lab `2106706` (*Baseline Protocol D*), which is located at `extended-location-99` and supports `english`. Discovery centre `4` (*Pilot Assessment*) serves lab `1562831` (*Primary Framework A*), which is `isms_compliant` and supports `korean`.

**View `vw_discovery_operation_center_investigation_case`**

```sql
CREATE VIEW vw_discovery_operation_center_investigation_case AS
SELECT a.discovery_operation_center_id, a.center_id, a.center_name, a.focus_area, b.case_id AS case_case_id, b.case_title AS case_case_title, b.start_date AS case_start_date
FROM discovery_operation_centers a JOIN investigation_cases b ON a.case_id = b.case_id;
```

| discovery_operation_center_id | center_id | center_name | focus_area | case_case_id | case_case_title | case_start_date |
|---|---|---|---|---|---|---|
| 1 | 5844261 | Seasonal Survey | discovery | 39800622 | Integrated Assessment A | 2022-09-05T20:24:00 |
| 2 | 1437588 | Integrated Corridor | evidence_disclosure | 4891 | Extended Survey | 2023-02-16T03:41:00 |
| 3 | 6564397 | Extended Series D | international_litigation | 17374813 | Pilot Corridor | 2024-07-27T10:58:00 |
| 4 | default_chart_a_tax_13 | Pilot Assessment | discovery | state_uk_9 | Baseline Series D | 2025-12-11T17:15:00 |

The view `vw_discovery_operation_center_investigation_case` joins `discovery_operation_centers` to `investigation_cases` on `discovery_operation_centers.case_id = investigation_cases.case_id`. This view answers: *which investigation case is being served by each discovery operation centre?* Discovery centre `1` (*Seasonal Survey*) serves case `39800622` (*Integrated Assessment A*), which is of type `compliance_breach`, has status `pending`, and a data volume of `9.95`. Discovery centre `2` (*Integrated Corridor*) serves case `4891` (*Extended Survey*), which is of type `litigation`, has status `active`, and a data volume of `12.90`.

**View `vw_forensic_operation_center_legal_tech_solution_lab`**

```sql
CREATE VIEW vw_forensic_operation_center_legal_tech_solution_lab AS
SELECT a.forensic_operation_center_id, a.center_id, a.center_name, a.focus_area, b.lab_id AS lab_lab_id, b.lab_name AS lab_lab_name, b.location AS lab_location
FROM forensic_operation_centers a JOIN legal_tech_solution_labs b ON a.lab_id = b.lab_id;
```

| forensic_operation_center_id | center_id | center_name | focus_area | lab_lab_id | lab_lab_name | lab_location |
|---|---|---|---|---|---|---|
| 100 | 5844261 | Seasonal Survey | forensics | 2106706 | Baseline Protocol D | extended-location-99 |
| 101 | 1437588 | Integrated Corridor | fraud_investigation | 1437591 | Distributed Programme | integrated-location-100 |
| 102 | 6564397 | Extended Series D | digital_forensics | 12042 | Adaptive Standard | seasonal-location-101 |
| 103 | default_chart_a_tax_13 | Pilot Assessment | forensics | 1562831 | Primary Framework A | regional-location-102 |

The view `vw_forensic_operation_center_legal_tech_solution_lab` joins `forensic_operation_centers` to `legal_tech_solution_labs` on `forensic_operation_centers.lab_id = legal_tech_solution_labs.lab_id`. This view answers: *which legal tech solution lab does each forensic operation centre serve?* Forensic centre `100` (*Seasonal Survey*) serves lab `2106706` (*Baseline Protocol D*), which has `discovery` service scope. Forensic centre `103` (*Pilot Assessment*) serves lab `1562831` (*Primary Framework A*), which has `independent_committee` service scope.

**View `vw_forensic_operation_center_investigation_case`**

```sql
CREATE VIEW vw_forensic_operation_center_investigation_case AS
SELECT a.forensic_operation_center_id, a.center_id, a.center_name, a.focus_area, b.case_id AS case_case_id, b.case_title AS case_case_title, b.start_date AS case_start_date
FROM forensic_operation_centers a JOIN investigation_cases b ON a.case_id = b.case_id;
```

| forensic_operation_center_id | center_id | center_name | focus_area | case_case_id | case_case_title | case_start_date |
|---|---|---|---|---|---|---|
| 100 | 5844261 | Seasonal Survey | forensics | 39800622 | Integrated Assessment A | 2022-09-05T20:24:00 |
| 101 | 1437588 | Integrated Corridor | fraud_investigation | 4891 | Extended Survey | 2023-02-16T03:41:00 |
| 102 | 6564397 | Extended Series D | digital_forensics | 17374813 | Pilot Corridor | 2024-07-27T10:58:00 |
| 103 | default_chart_a_tax_13 | Pilot Assessment | forensics | state_uk_9 | Baseline Series D | 2025-12-11T17:15:00 |

The view `vw_forensic_operation_center_investigation_case` joins `forensic_operation_centers` to `investigation_cases` on `forensic_operation_centers.case_id = investigation_cases.case_id`. This view answers: *which investigation case is being served by each forensic operation centre?* Forensic centre `100` (*Seasonal Survey*) serves case `39800622` (*Integrated Assessment A*), which is of type `compliance_breach` and has status `pending`. Forensic centre `102` (*Extended Series D*) serves case `17374813` (*Pilot Corridor*), which is of type `fraud` and has status `closed`.

**View `vw_a_i_engine_legal_tech_solution_lab`**

```sql
CREATE VIEW vw_a_i_engine_legal_tech_solution_lab AS
SELECT a.engine_id, a.engine_name, a.version, a.training_data, b.lab_id AS lab_lab_id, b.lab_name AS lab_lab_name, b.location AS lab_location
FROM a_i_engines a JOIN legal_tech_solution_labs b ON a.lab_id = b.lab_id;
```

| engine_id | engine_name | version | training_data | lab_lab_id | lab_lab_name | lab_location |
|---|---|---|---|---|---|---|
| 5006437 | Baseline Series D | seasonal-version-71 | primary-training-34 | 2106706 | Baseline Protocol D | extended-location-99 |
| 726035 | Distributed Assessment | regional-version-72 | adaptive-training-35 | 1437591 | Distributed Programme | integrated-location-100 |
| 8843749 | Adaptive Survey | legacy-version-73 | distributed-training-36 | 12042 | Adaptive Standard | seasonal-location-101 |
| 209207 | Primary Corridor A | compact-version-74 | baseline-training-37 | 1562831 | Primary Framework A | regional-location-102 |

The view `vw_a_i_engine_legal_tech_solution_lab` joins `a_i_engines` to `legal_tech_solution_labs` on `a_i_engines.lab_id = legal_tech_solution_labs.lab_id`. This view answers: *which legal tech solution lab does each AI engine serve?* Engine `5006437` (*Baseline Series D*) serves lab `2106706` (*Baseline Protocol D*), which is located at `extended-location-99`. Engine `209207` (*Primary Corridor A*) serves lab `1562831` (*Primary Framework A*), which is `isms_compliant`.

**View `vw_a_i_engine_investigation_case`**

```sql
CREATE VIEW vw_a_i_engine_investigation_case AS
SELECT a.engine_id, a.engine_name, a.version, a.training_data, b.case_id AS case_case_id, b.case_title AS case_case_title, b.start_date AS case_start_date
FROM a_i_engines a JOIN investigation_cases b ON a.case_id = b.case_id;
```

| engine_id | engine_name | version | training_data | case_case_id | case_case_title | case_start_date |
|---|---|---|---|---|---|---|
| 5006437 | Baseline Series D | seasonal-version-71 | primary-training-34 | 39800622 | Integrated Assessment A | 2022-09-05T20:24:00 |
| 726035 | Distributed Assessment | regional-version-72 | adaptive-training-35 | 4891 | Extended Survey | 2023-02-16T03:41:00 |
| 8843749 | Adaptive Survey | legacy-version-73 | distributed-training-36 | 17374813 | Pilot Corridor | 2024-07-27T10:58:00 |
| 209207 | Primary Corridor A | compact-version-74 | baseline-training-37 | state_uk_9 | Baseline Series D | 2025-12-11T17:15:00 |

The view `vw_a_i_engine_investigation_case` joins `a_i_engines` to `investigation_cases` on `a_i_engines.case_id = investigation_cases.case_id`. This view answers: *which investigation case is being served by each AI engine?* Engine `5006437` (*Baseline Series D*) serves case `39800622` (*Integrated Assessment A*), which has data volume `9.95` and status `pending`. Engine `726035` (*Distributed Assessment*) serves case `4891` (*Extended Survey*), which has data volume `12.90` and status `active`.

**View `vw_data_analysis_tool_legal_tech_solution_lab`**

```sql
CREATE VIEW vw_data_analysis_tool_legal_tech_solution_lab AS
SELECT a.id, a.tool_id, a.tool_name, a.tool_type, b.lab_id AS lab_lab_id, b.lab_name AS lab_lab_name, b.location AS lab_location
FROM data_analysis_tools a JOIN legal_tech_solution_labs b ON a.lab_id = b.lab_id;
```

| id | tool_id | tool_name | tool_type | lab_lab_id | lab_lab_name | lab_location |
|---|---|---|---|---|---|---|
| 100 | comi | Composite Model | litigation_support | 2106706 | Baseline Protocol D | extended-location-99 |
| 101 | 195360 | Compact Cluster A | data_analysis | 1437591 | Distributed Programme | integrated-location-100 |
| 102 | 3355763 | Legacy Review | log_tracing | 12042 | Adaptive Standard | seasonal-location-101 |
| 103 | 8387539 | Regional Initiative | information_aggregation | 1562831 | Primary Framework A | regional-location-102 |

The view `vw_data_analysis_tool_legal_tech_solution_lab` joins `data_analysis_tools` to `legal_tech_solution_labs` on `data_analysis_tools.lab_id = legal_tech_solution_labs.lab_id`. This view answers: *which legal tech solution lab does each data analysis tool serve?* Tool `100` (*Composite Model*) serves lab `2106706` (*Baseline Protocol D*), which supports `english`. Tool `103` (*Regional Initiative*) serves lab `1562831` (*Primary Framework A*), which supports `korean`.

**View `vw_data_analysis_tool_investigation_case`**

```sql
CREATE VIEW vw_data_analysis_tool_investigation_case AS
SELECT a.id, a.tool_id, a.tool_name, a.tool_type, b.case_id AS case_case_id, b.case_title AS case_case_title, b.start_date AS case_start_date
FROM data_analysis_tools a JOIN investigation_cases b ON a.case_id = b.case_id;
```

| id | tool_id | tool_name | tool_type | case_case_id | case_case_title | case_start_date |
|---|---|---|---|---|---|---|
| 100 | comi | Composite Model | litigation_support | 39800622 | Integrated Assessment A | 2022-09-05T20:24:00 |
| 101 | 195360 | Compact Cluster A | data_analysis | 4891 | Extended Survey | 2023-02-16T03:41:00 |
| 102 | 3355763 | Legacy Review | log_tracing | 17374813 | Pilot Corridor | 2024-07-27T10:58:00 |
| 103 | 8387539 | Regional Initiative | information_aggregation | state_uk_9 | Baseline Series D | 2025-12-11T17:15:00 |

The view `vw_data_analysis_tool_investigation_case` joins `data_analysis_tools` to `investigation_cases` on `data_analysis_tools.case_id = investigation_cases.case_id`. This view answers: *which investigation case is being served by each data analysis tool?* Tool `100` (*Composite Model*) serves case `39800622` (*Integrated Assessment A*), which is of type `compliance_breach`. Tool `102` (*Legacy Review*) serves case `17374813` (*Pilot Corridor*), which is of type `fraud` and has status `closed`.

### Synthesis

The relational schema for this legal-tech forensic domain is a carefully normalised star topology in which the `investigation_cases` fact table and the `legal_tech_solution_labs` organisational table form the two central nodes, and the four peripheral tables (`discovery_operation_centers`, `forensic_operation_centers`, `a_i_engines`, `data_analysis_tools`) provide specialised attribute sets linked through bidirectional foreign-key relationships. The cardinality-bounded relationships — each case belongs to exactly one lab, each lab is associated with exactly one discovery centre, one forensic centre, one AI engine, and one data analysis tool — are encoded as single-column foreign keys rather than junction tables, reflecting the one-to-one or many-to-one cardinality of the domain model. The twenty materialised views collectively cover all pairwise join paths between the six base tables, enabling efficient query execution for any domain question: from "which lab serves this case?" to "which case does this discovery centre serve?" Each view's join reconstructs a domain fact by combining the normalised columns from its constituent tables, and the concrete rows in the data — such as case `39800622` being served by lab `2106706` (*Baseline Protocol D*), which deploys engine `5006437` (*Baseline Series D*) and tool `100` (*Composite Model*) — demonstrate the schema's ability to represent the full operational context of a forensic investigation in a single denormalised row.