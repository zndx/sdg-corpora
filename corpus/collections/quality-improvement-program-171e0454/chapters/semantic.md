## Domain Modelling and Relational Materialization

This chapter documents the relational architecture of a quality improvement ecosystem in which emergency response organizations, municipalities, clinical performance metrics, analytic tools, and patient outcomes are interwoven through structured quality improvement programs. The domain centres on `quality_improvement_programs` as the primary fact table, anchoring every other entity through foreign-key relationships that encode which organization runs which program, which municipality hosts it, which clinical data it tracks, which analytic tools it employs, and which patient outcomes it targets. The schema follows a star-like normalisation: a single program table radiates relationships to five dimension tables, while two junction tables (`municipalities_organizations` and `tools_datas`) resolve many-to-many associations that cannot be expressed through direct foreign keys.

**Table `quality_improvement_programs`**

| quality_improvement_program_id | program_identifier | program_name | start_date | status | methodology | target_population | first_responder_organization_id | clinical_performance_data_id | patient_outcome_id |
|---|---|---|---|---|---|---|---|---|---|
| 100 | PRO-2198 | Extended Review | 2022-09-05T20:24:00 | planning | PDSA | composite-target-21 | 1 | 1 | 100 |
| 101 | PRO-2205 | Pilot Initiative A | 2023-02-16T03:41:00 | active | Lean | primary-target-22 | 2 | 2 | 101 |
| 102 | PRO-2212 | Baseline Model | 2024-07-27T10:58:00 | completed | Six Sigma | adaptive-target-23 | 3 | 3 | 102 |
| 103 | PRO-2219 | Distributed Cluster | 2025-12-11T17:15:00 | suspended | RCA | distributed-target-24 | 4 | 4 | 103 |

The `quality_improvement_programs` table is the central entity. Each row represents a discrete improvement initiative identified by a surrogate key `quality_improvement_program_id` and a business-level `program_identifier` such as `PRO-2198` or `PRO-2219`. The `program_name` column carries human-readable labels — `Extended Review`, `Pilot Initiative A`, `Baseline Model`, `Distributed Cluster` — while `start_date` records the initiative's launch timestamp, for example `2022-09-05T20:24:00`. The `status` column constrains the lifecycle state to one of `planning`, `active`, `completed`, or `suspended`, and `methodology` captures the improvement framework employed, drawn from `PDSA`, `Lean`, `Six Sigma`, or `RCA`. The `target_population` column encodes the intended beneficiary group using coded identifiers such as `composite-target-21` or `adaptive-target-23`.

Critically, `quality_improvement_programs` carries three foreign-key columns that bind it to other base tables: `first_responder_organization_id` references `first_responder_organizations`, `clinical_performance_data_id` references `clinical_performance_datas`, and `patient_outcome_id` references `patient_outcomes`. In the sample data, program `PRO-2198` (id 100) is linked to organization id 1, clinical data id 1, and patient outcome id 100, forming a coherent fact triplet. This design means that every program row is a join-ready nucleus: a single query against `quality_improvement_programs` can reconstruct the full context of an initiative by following its foreign keys.

**Table `first_responder_organizations`**

| first_responder_organization_id | organization_i_d | organization_name | jurisdiction | established_date | service_type | participation_status | quality_improvement_program_id | municipality_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | Lockheed Martin | Staples Inc. | regional-jurisdic-30 | 2024-03-27 | EMS | active | 100 | 1000 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | Austria Card | Oscar Health Inc. | legacy-jurisdic-31 | 2025-08-11 | Fire | inactive | 101 | 1001 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | Memphis City Schools Foundation | Atlantic Richfield | compact-jurisdic-32 | 2022-01-22 | Police | pending | 102 | 1002 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | New Schools for New Orleans | Port Loko | composite-jurisdic-33 | 2023-06-06 | Combined | active | 103 | 1003 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The `first_responder_organizations` table models the emergency response entities that execute quality improvement programs. Each organization is identified by `first_responder_organization_id` and a business key `organization_i_d` (e.g., `Lockheed Martin`, `Austria Card`, `Memphis City Schools Foundation`). The `organization_name` column provides the legal or operational name — `Staples Inc.`, `Oscar Health Inc.`, `Atlantic Richfield` — while `jurisdiction` classifies the geographic scope using codes such as `regional-jurisdic-30` or `compact-jurisdic-32`. The `established_date` records when the organization was founded, and `service_type` constrains the operational domain to `EMS`, `Fire`, `Police`, or `Combined`. The `participation_status` column tracks current engagement with `active`, `inactive`, or `pending` states.

Two foreign keys anchor this table to the broader schema: `quality_improvement_program_id` links back to `quality_improvement_programs`, and `municipality_id` links to `municipalities`. The bidirectional link between organizations and programs — present on both sides — reflects a design choice that allows queries to start from either entity. The `created_at` and `updated_at` timestamps provide auditability, with values such as `2025-01-01 00:14:00` for creation and `2025-01-02 00:41:00` for the last modification.

**Table `municipalities`**

| id | municipality_i_d | municipality_name | state | population | area_sq_km | incorporation_date | quality_improvement_program_id | created_at |
|---|---|---|---|---|---|---|---|---|
| 1000 | MUN-2165 | Compact Model | distributed-state-84 | 42 | 15.45 | 2025-08-22 | 100 | 2025-01-01 00:14:00 |
| 1001 | MUN-2168 | Legacy Cluster | baseline-state-85 | 49 | 17.90 | 2022-01-06 | 101 | 2025-02-06 03:14:00 |
| 1002 | MUN-2171 | Regional Review A | pilot-state-86 | 56 | 20.35 | 2023-06-17 | 102 | 2025-03-11 06:14:00 |
| 1003 | MUN-2174 | Seasonal Initiative | extended-state-87 | 63 | 22.80 | 2024-11-01 | 103 | 2025-04-16 09:14:00 |

The `municipalities` table captures the geographic and administrative context in which quality improvement programs operate. Each row is keyed by `id` (e.g., 1000, 1001) and a business identifier `municipality_i_d` such as `MUN-2165`. The `municipality_name` column carries descriptive labels — `Compact Model`, `Legacy Cluster A`, `Regional Review A` — while `state` encodes the regional classification using codes like `distributed-state-84` or `baseline-state-85`. The `population` column stores integer counts (42, 49, 56, 63 in the sample), and `area_sq_km` records the geographic extent as a decimal (15.45, 17.90, 20.35, 22.80). The `incorporation_date` records when the municipality was formally established, and `created_at` provides a system-level timestamp.

The foreign key `quality_improvement_program_id` links each municipality to the program operating within its jurisdiction. This creates a direct association between geographic entities and improvement initiatives, enabling queries that answer which programs are active in which municipalities.

**Table `clinical_performance_datas`**

| clinical_performance_data_id | data_record_i_d | collection_date | metric_type | value | unit_of_measure | data_quality | first_responder_organization_id | quantitative_analytic_tool_id | quality_improvement_program_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | DAT-2681 | 2025-12-17T11:57:00 | responseTime | 19.95 | composite-unit-69 | verified | 1 | 1000 | 100 |
| 2 | DAT-2686 | 2022-05-01T18:14:00 | treatmentAccuracy | 21.90 | primary-unit-70 | unverified | 2 | 1001 | 101 |
| 3 | DAT-2691 | 2023-10-12T01:31:00 | patientSatisfaction | 23.85 | adaptive-unit-71 | estimated | 3 | 1002 | 102 |
| 4 | DAT-2696 | 2024-03-23T08:48:00 | protocolAdherence | 25.80 | distributed-unit-72 | verified | 4 | 1003 | 103 |

The `clinical_performance_datas` table stores quantitative performance measurements collected during quality improvement programs. Each record is identified by `clinical_performance_data_id` and a business key `data_record_i_d` such as `DAT-2681`. The `collection_date` records when the measurement was taken (e.g., `2025-12-17T11:57:00`), and `metric_type` classifies the measurement as `responseTime`, `treatmentAccuracy`, `patientSatisfaction`, or `protocolAdherence`. The `value` column holds the numeric measurement (19.95, 21.90, 23.85, 25.80), while `unit_of_measure` provides the measurement context using coded identifiers like `composite-unit-69` or `primary-unit-70`. The `data_quality` column indicates confidence in the measurement with values of `verified`, `unverified`, or `estimated`.

Three foreign keys bind clinical performance data to the rest of the schema: `first_responder_organization_id` links to the organization that collected the data, `quantitative_analytic_tool_id` links to the tool used for analysis, and `quality_improvement_program_id` links to the program under which the data was gathered. This triple-linkage means that every clinical data row can be traced to a specific organization, tool, and program — a design that supports granular auditability and root-cause analysis.

**Table `quantitative_analytic_tools`**

| id | tool_i_d | tool_name | tool_type | version | last_updated | validation_status | patient_outcome_id | quality_improvement_program_id |
|---|---|---|---|---|---|---|---|---|
| 1000 | TOO-2591 | Composite Model | statistical | seasonal-version-71 | 2023-06-17T17:27:00 | validated | 100 | 100 |
| 1001 | TOO-2594 | Compact Cluster A | machineLearning | regional-version-72 | 2024-11-01T00:44:00 | pilot | 101 | 101 |
| 1002 | TOO-2597 | Legacy Review | dashboard | legacy-version-73 | 2025-04-12T07:01:00 | deprecated | 102 | 102 |
| 1003 | TOO-2600 | Regional Initiative | simulation | compact-version-74 | 2022-09-23T14:18:00 | validated | 103 | 103 |

The `quantitative_analytic_tools` table models the software and statistical instruments used to analyse clinical performance data and patient outcomes. Each tool is identified by `id` (e.g., 1000, 1001) and a business key `tool_i_d` such as `TOO-2591`. The `tool_name` column carries descriptive labels — `Composite Model`, `Compact Cluster A`, `Legacy Review`, `Regional Initiative` — while `tool_type` classifies the analytical approach as `statistical`, `machineLearning`, `dashboard`, or `simulation`. The `version` column stores version identifiers like `seasonal-version-71` or `regional-version-72`, and `last_updated` records the most recent modification timestamp. The `validation_status` column indicates the tool's certification state with values of `validated`, `pilot`, or `deprecated`.

Two foreign keys link this table to other entities: `patient_outcome_id` associates the tool with a specific patient outcome, and `quality_improvement_program_id` associates it with the program that employs it. This dual linkage supports queries that answer which tools are used by which programs and which outcomes they are designed to measure.

**Table `patient_outcomes`**

| id | outcome_i_d | measurement_date | outcome_type | value | unit_of_measure | improvement_direction | quality_improvement_program_id | quantitative_analytic_tool_id | first_responder_organization_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 100 | OUT-2379 | 2024-07-01T18:54:00 | mortality | 19.95 | composite-unit-69 | improved | 100 | 1000 | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 101 | OUT-2380 | 2025-12-12T01:11:00 | morbidity | 21.90 | primary-unit-70 | worsened | 101 | 1001 | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 102 | OUT-2381 | 2022-05-23T08:28:00 | recoveryRate | 23.85 | adaptive-unit-71 | unchanged | 102 | 1002 | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 103 | OUT-2382 | 2023-10-07T15:45:00 | complicationRate | 25.80 | distributed-unit-72 | improved | 103 | 1003 | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The `patient_outcomes` table records the health results that quality improvement programs aim to influence. Each outcome is identified by `id` (e.g., 100, 101) and a business key `outcome_i_d` such as `OUT-2379`. The `measurement_date` records when the outcome was assessed (e.g., `2024-07-01T18:54:00`), and `outcome_type` classifies the health metric as `mortality`, `morbidity`, `recoveryRate`, or `complicationRate`. The `value` column holds the numeric measurement (19.95, 21.90, 23.85, 25.80), while `unit_of_measure` provides the measurement context. The `improvement_direction` column indicates whether the measured value represents `improved`, `worsened`, or `unchanged` conditions relative to a baseline.

Three foreign keys bind patient outcomes to the broader schema: `quality_improvement_program_id` links to the program targeting the outcome, `quantitative_analytic_tool_id` links to the tool used to measure it, and `first_responder_organization_id` links to the organization responsible for the outcome. This design ensures that every patient outcome can be traced to the program, tool, and organization that produced it.

**Table `municipalities_organizations`**

| municipality_id | first_responder_organization_id |
|---|---|
| 1000 | 1 |
| 1000 | 2 |
| 1001 | 2 |
| 1001 | 3 |
| 1002 | 3 |
| 1002 | 4 |
| 1003 | 4 |
| 1003 | 1 |

The `municipalities_organizations` junction table resolves the many-to-many relationship between municipalities and first responder organizations. In the base tables, each organization has a single `municipality_id` foreign key, suggesting a one-to-many relationship from municipality to organization. However, the presence of this junction table indicates that the domain model supports more complex associations — an organization may operate across multiple municipalities, and a municipality may host multiple organizations. The junction table's columns (not shown in the base table definition but implied by its name) would contain `municipality_id` and `first_responder_organization_id` as composite foreign keys, enabling queries that enumerate all organization-municipality pairings beyond the primary association stored in `first_responder_organizations`.

**Table `tools_datas`**

| quantitative_analytic_tool_id | clinical_performance_data_id |
|---|---|
| 1000 | 1 |
| 1000 | 2 |
| 1001 | 2 |
| 1001 | 3 |
| 1002 | 3 |
| 1002 | 4 |
| 1003 | 4 |
| 1003 | 1 |

The `tools_datas` junction table resolves the many-to-many relationship between quantitative analytic tools and clinical performance data records. While `clinical_performance_datas` carries a single `quantitative_analytic_tool_id` foreign key, the junction table allows a clinical data record to be associated with multiple tools, or a tool to be applied across multiple data records. The table's columns would contain `quantitative_analytic_tool_id` and `clinical_performance_data_id` as composite foreign keys, supporting flexible analytical workflows where multiple tools are applied to the same dataset or the same tool is reused across different datasets.

## View-Based Fact Reconstruction

The views in this schema serve as denormalised lenses that reconstruct domain facts from the normalized base tables. Each view answers a specific analytical question by joining the relevant tables and presenting the result as a single, queryable entity.

**View `vw_quality_improvement_program_first_responder_organization`**

```sql
CREATE VIEW vw_quality_improvement_program_first_responder_organization AS
SELECT a.quality_improvement_program_id, a.program_identifier, a.program_name, a.start_date, b.first_responder_organization_id AS organization_first_responder_organization_id, b.organization_i_d AS organization_organization_i_d, b.organization_name AS organization_organization_name
FROM quality_improvement_programs a JOIN first_responder_organizations b ON a.first_responder_organization_id = b.first_responder_organization_id;
```

| quality_improvement_program_id | program_identifier | program_name | start_date | organization_first_responder_organization_id | organization_organization_i_d | organization_organization_name |
|---|---|---|---|---|---|---|
| 100 | PRO-2198 | Extended Review | 2022-09-05T20:24:00 | 1 | Lockheed Martin | Staples Inc. |
| 101 | PRO-2205 | Pilot Initiative A | 2023-02-16T03:41:00 | 2 | Austria Card | Oscar Health Inc. |
| 102 | PRO-2212 | Baseline Model | 2024-07-27T10:58:00 | 3 | Memphis City Schools Foundation | Atlantic Richfield |
| 103 | PRO-2219 | Distributed Cluster | 2025-12-11T17:15:00 | 4 | New Schools for New Orleans | Port Loko |

This view joins `quality_improvement_programs` with `first_responder_organizations` to answer the question: which organization is responsible for which quality improvement program? The join is performed on `quality_improvement_programs.first_responder_organization_id = first_responder_organizations.first_responder_organization_id`. A representative row would show program `PRO-2198` (`Extended Review`) operated by `Staples Inc.` under the `Lockheed Martin` organization identifier, with a `regional-jurisdic-30` jurisdiction and `EMS` service type. This view is the primary interface for program-organization accountability queries.

**View `vw_quality_improvement_program_clinical_performance_data`**

```sql
CREATE VIEW vw_quality_improvement_program_clinical_performance_data AS
SELECT a.quality_improvement_program_id, a.program_identifier, a.program_name, a.start_date, b.clinical_performance_data_id AS data_clinical_performance_data_id, b.data_record_i_d AS data_data_record_i_d, b.collection_date AS data_collection_date
FROM quality_improvement_programs a JOIN clinical_performance_datas b ON a.clinical_performance_data_id = b.clinical_performance_data_id;
```

| quality_improvement_program_id | program_identifier | program_name | start_date | data_clinical_performance_data_id | data_data_record_i_d | data_collection_date |
|---|---|---|---|---|---|---|
| 100 | PRO-2198 | Extended Review | 2022-09-05T20:24:00 | 1 | DAT-2681 | 2025-12-17T11:57:00 |
| 101 | PRO-2205 | Pilot Initiative A | 2023-02-16T03:41:00 | 2 | DAT-2686 | 2022-05-01T18:14:00 |
| 102 | PRO-2212 | Baseline Model | 2024-07-27T10:58:00 | 3 | DAT-2691 | 2023-10-12T01:31:00 |
| 103 | PRO-2219 | Distributed Cluster | 2025-12-11T17:15:00 | 4 | DAT-2696 | 2024-03-23T08:48:00 |

This view joins `quality_improvement_programs` with `clinical_performance_datas` to answer: which clinical performance metrics are tracked by which program? The join on `quality_improvement_programs.clinical_performance_data_id = clinical_performance_datas.clinical_performance_data_id` produces rows such as program `PRO-2205` (`Pilot Initiative A`) linked to a `treatmentAccuracy` metric with value `21.90` collected on `2022-05-01T18:14:00`. This view supports program-level performance dashboards.

**View `vw_quality_improvement_program_patient_outcome`**

```sql
CREATE VIEW vw_quality_improvement_program_patient_outcome AS
SELECT a.quality_improvement_program_id, a.program_identifier, a.program_name, a.start_date, b.id AS outcome_id, b.outcome_i_d AS outcome_outcome_i_d, b.measurement_date AS outcome_measurement_date
FROM quality_improvement_programs a JOIN patient_outcomes b ON a.patient_outcome_id = b.id;
```

| quality_improvement_program_id | program_identifier | program_name | start_date | outcome_id | outcome_outcome_i_d | outcome_measurement_date |
|---|---|---|---|---|---|---|
| 100 | PRO-2198 | Extended Review | 2022-09-05T20:24:00 | 100 | OUT-2379 | 2024-07-01T18:54:00 |
| 101 | PRO-2205 | Pilot Initiative A | 2023-02-16T03:41:00 | 101 | OUT-2380 | 2025-12-12T01:11:00 |
| 102 | PRO-2212 | Baseline Model | 2024-07-27T10:58:00 | 102 | OUT-2381 | 2022-05-23T08:28:00 |
| 103 | PRO-2219 | Distributed Cluster | 2025-12-11T17:15:00 | 103 | OUT-2382 | 2023-10-07T15:45:00 |

This view joins `quality_improvement_programs` with `patient_outcomes` to answer: which patient outcomes does each program target? The join on `quality_improvement_programs.patient_outcome_id = patient_outcomes.id` produces rows such as program `PRO-2212` (`Baseline Model`) linked to a `recoveryRate` outcome with value `23.85` showing `unchanged` improvement direction. This view is essential for outcome-tracking and impact assessment.

**View `vw_first_responder_organization_quality_improvement_program`**

```sql
CREATE VIEW vw_first_responder_organization_quality_improvement_program AS
SELECT a.first_responder_organization_id, a.organization_i_d, a.organization_name, a.jurisdiction, b.quality_improvement_program_id AS program_quality_improvement_program_id, b.program_identifier AS program_program_identifier, b.program_name AS program_program_name
FROM first_responder_organizations a JOIN quality_improvement_programs b ON a.quality_improvement_program_id = b.quality_improvement_program_id;
```

| first_responder_organization_id | organization_i_d | organization_name | jurisdiction | program_quality_improvement_program_id | program_program_identifier | program_program_name |
|---|---|---|---|---|---|---|
| 1 | Lockheed Martin | Staples Inc. | regional-jurisdic-30 | 100 | PRO-2198 | Extended Review |
| 2 | Austria Card | Oscar Health Inc. | legacy-jurisdic-31 | 101 | PRO-2205 | Pilot Initiative A |
| 3 | Memphis City Schools Foundation | Atlantic Richfield | compact-jurisdic-32 | 102 | PRO-2212 | Baseline Model |
| 4 | New Schools for New Orleans | Port Loko | composite-jurisdic-33 | 103 | PRO-2219 | Distributed Cluster |

This view reverses the perspective of the first view, joining `first_responder_organizations` with `quality_improvement_programs` to answer: which programs does each organization run? The join on `first_responder_organizations.quality_improvement_program_id = quality_improvement_programs.quality_improvement_program_id` produces rows such as `Staples Inc.` (organization id 1) running program `PRO-2198` (`Extended Review`) with `PDSA` methodology. This view supports organizational capacity planning.

**View `vw_first_responder_organization_municipality`**

```sql
CREATE VIEW vw_first_responder_organization_municipality AS
SELECT a.first_responder_organization_id, a.organization_i_d, a.organization_name, a.jurisdiction, b.id AS municipality_id, b.municipality_i_d AS municipality_municipality_i_d, b.municipality_name AS municipality_municipality_name
FROM first_responder_organizations a JOIN municipalities b ON a.municipality_id = b.id;
```

| first_responder_organization_id | organization_i_d | organization_name | jurisdiction | municipality_id | municipality_municipality_i_d | municipality_municipality_name |
|---|---|---|---|---|---|---|
| 1 | Lockheed Martin | Staples Inc. | regional-jurisdic-30 | 1000 | MUN-2165 | Compact Model |
| 2 | Austria Card | Oscar Health Inc. | legacy-jurisdic-31 | 1001 | MUN-2168 | Legacy Cluster |
| 3 | Memphis City Schools Foundation | Atlantic Richfield | compact-jurisdic-32 | 1002 | MUN-2171 | Regional Review A |
| 4 | New Schools for New Orleans | Port Loko | composite-jurisdic-33 | 1003 | MUN-2174 | Seasonal Initiative |

This view joins `first_responder_organizations` with `municipalities` to answer: which municipality hosts which organization? The join on `first_responder_organizations.municipality_id = municipalities.id` produces rows such as `Staples Inc.` operating in `Compact Model` (municipality id 1000) with a population of 42 and area of 15.45 square kilometres. This view supports geographic resource allocation analysis.

**View `vw_municipality_first_responder_organization_detail`**

```sql
CREATE VIEW vw_municipality_first_responder_organization_detail AS
SELECT a.id, a.municipality_i_d, a.municipality_name, b.first_responder_organization_id AS organization_first_responder_organization_id, b.organization_i_d AS organization_organization_i_d, b.organization_name AS organization_organization_name
FROM municipalities a
  JOIN municipalities_organizations j ON j.municipality_id = a.id
  JOIN first_responder_organizations b ON b.first_responder_organization_id = j.first_responder_organization_id;
```

| id | municipality_i_d | municipality_name | organization_first_responder_organization_id | organization_organization_i_d | organization_organization_name |
|---|---|---|---|---|---|
| 1000 | MUN-2165 | Compact Model | 1 | Lockheed Martin | Staples Inc. |
| 1000 | MUN-2165 | Compact Model | 2 | Austria Card | Oscar Health Inc. |
| 1001 | MUN-2168 | Legacy Cluster | 2 | Austria Card | Oscar Health Inc. |
| 1001 | MUN-2168 | Legacy Cluster | 3 | Memphis City Schools Foundation | Atlantic Richfield |
| 1002 | MUN-2171 | Regional Review A | 3 | Memphis City Schools Foundation | Atlantic Richfield |
| 1002 | MUN-2171 | Regional Review A | 4 | New Schools for New Orleans | Port Loko |
| 1003 | MUN-2174 | Seasonal Initiative | 4 | New Schools for New Orleans | Port Loko |
| 1003 | MUN-2174 | Seasonal Initiative | 1 | Lockheed Martin | Staples Inc. |

This view provides a detailed join between `municipalities` and `first_responder_organizations`, enriched with additional columns from both tables. It answers: what are the full details of organizations operating within each municipality? A representative row would show municipality `Compact Model` (state `distributed-state-84`, population 42) hosting `Staples Inc.` (service type `EMS`, status `active`, established `2024-03-27`). This view is the primary interface for municipal resource inventories.

**View `vw_municipality_quality_improvement_program`**

```sql
CREATE VIEW vw_municipality_quality_improvement_program AS
SELECT a.id, a.municipality_i_d, a.municipality_name, a.state, b.quality_improvement_program_id AS program_quality_improvement_program_id, b.program_identifier AS program_program_identifier, b.program_name AS program_program_name
FROM municipalities a JOIN quality_improvement_programs b ON a.quality_improvement_program_id = b.quality_improvement_program_id;
```

| id | municipality_i_d | municipality_name | state | program_quality_improvement_program_id | program_program_identifier | program_program_name |
|---|---|---|---|---|---|---|
| 1000 | MUN-2165 | Compact Model | distributed-state-84 | 100 | PRO-2198 | Extended Review |
| 1001 | MUN-2168 | Legacy Cluster | baseline-state-85 | 101 | PRO-2205 | Pilot Initiative A |
| 1002 | MUN-2171 | Regional Review A | pilot-state-86 | 102 | PRO-2212 | Baseline Model |
| 1003 | MUN-2174 | Seasonal Initiative | extended-state-87 | 103 | PRO-2219 | Distributed Cluster |

This view joins `municipalities` with `quality_improvement_programs` to answer: which programs operate in which municipality? The join on `municipalities.quality_improvement_program_id = quality_improvement_programs.quality_improvement_program_id` produces rows such as `Compact Model` municipality hosting program `PRO-2198` (`Extended Review`) with `PDSA` methodology and `composite-target-21` target population. This view supports municipal program portfolio management.

**View `vw_clinical_performance_data_first_responder_organization`**

```sql
CREATE VIEW vw_clinical_performance_data_first_responder_organization AS
SELECT a.clinical_performance_data_id, a.data_record_i_d, a.collection_date, a.metric_type, b.first_responder_organization_id AS organization_first_responder_organization_id, b.organization_i_d AS organization_organization_i_d, b.organization_name AS organization_organization_name
FROM clinical_performance_datas a JOIN first_responder_organizations b ON a.first_responder_organization_id = b.first_responder_organization_id;
```

| clinical_performance_data_id | data_record_i_d | collection_date | metric_type | organization_first_responder_organization_id | organization_organization_i_d | organization_organization_name |
|---|---|---|---|---|---|---|
| 1 | DAT-2681 | 2025-12-17T11:57:00 | responseTime | 1 | Lockheed Martin | Staples Inc. |
| 2 | DAT-2686 | 2022-05-01T18:14:00 | treatmentAccuracy | 2 | Austria Card | Oscar Health Inc. |
| 3 | DAT-2691 | 2023-10-12T01:31:00 | patientSatisfaction | 3 | Memphis City Schools Foundation | Atlantic Richfield |
| 4 | DAT-2696 | 2024-03-23T08:48:00 | protocolAdherence | 4 | New Schools for New Orleans | Port Loko |

This view joins `clinical_performance_datas` with `first_responder_organizations` to answer: which organization produced which clinical performance metric? The join on `clinical_performance_datas.first_responder_organization_id = first_responder_organizations.first_responder_organization_id` produces rows such as `responseTime` metric with value `19.95` collected by `Staples Inc.` (organization id 1) with `verified` data quality. This view supports organizational performance benchmarking.

**View `vw_clinical_performance_data_quantitative_analytic_tool`**

```sql
CREATE VIEW vw_clinical_performance_data_quantitative_analytic_tool AS
SELECT a.clinical_performance_data_id, a.data_record_i_d, a.collection_date, a.metric_type, b.id AS tool_id, b.tool_i_d AS tool_tool_i_d, b.tool_name AS tool_tool_name
FROM clinical_performance_datas a JOIN quantitative_analytic_tools b ON a.quantitative_analytic_tool_id = b.id;
```

| clinical_performance_data_id | data_record_i_d | collection_date | metric_type | tool_id | tool_tool_i_d | tool_tool_name |
|---|---|---|---|---|---|---|
| 1 | DAT-2681 | 2025-12-17T11:57:00 | responseTime | 1000 | TOO-2591 | Composite Model |
| 2 | DAT-2686 | 2022-05-01T18:14:00 | treatmentAccuracy | 1001 | TOO-2594 | Compact Cluster A |
| 3 | DAT-2691 | 2023-10-12T01:31:00 | patientSatisfaction | 1002 | TOO-2597 | Legacy Review |
| 4 | DAT-2696 | 2024-03-23T08:48:00 | protocolAdherence | 1003 | TOO-2600 | Regional Initiative |

This view joins `clinical_performance_datas` with `quantitative_analytic_tools` to answer: which analytic tool was used to analyse which clinical performance data? The join on `clinical_performance_datas.quantitative_analytic_tool_id = quantitative_analytic_tools.id` produces rows such as `responseTime` metric (value `19.95`) analysed by `Composite Model` (tool id 1000, type `statistical`, status `validated`). This view supports tool effectiveness assessment.

**View `vw_clinical_performance_data_quality_improvement_program`**

```sql
CREATE VIEW vw_clinical_performance_data_quality_improvement_program AS
SELECT a.clinical_performance_data_id, a.data_record_i_d, a.collection_date, a.metric_type, b.quality_improvement_program_id AS program_quality_improvement_program_id, b.program_identifier AS program_program_identifier, b.program_name AS program_program_name
FROM clinical_performance_datas a JOIN quality_improvement_programs b ON a.quality_improvement_program_id = b.quality_improvement_program_id;
```

| clinical_performance_data_id | data_record_i_d | collection_date | metric_type | program_quality_improvement_program_id | program_program_identifier | program_program_name |
|---|---|---|---|---|---|---|
| 1 | DAT-2681 | 2025-12-17T11:57:00 | responseTime | 100 | PRO-2198 | Extended Review |
| 2 | DAT-2686 | 2022-05-01T18:14:00 | treatmentAccuracy | 101 | PRO-2205 | Pilot Initiative A |
| 3 | DAT-2691 | 2023-10-12T01:31:00 | patientSatisfaction | 102 | PRO-2212 | Baseline Model |
| 4 | DAT-2696 | 2024-03-23T08:48:00 | protocolAdherence | 103 | PRO-2219 | Distributed Cluster |

This view joins `clinical_performance_datas` with `quality_improvement_programs` to answer: which program is associated with which clinical performance data? The join on `clinical_performance_datas.quality_improvement_program_id = quality_improvement_programs.quality_improvement_program_id` produces rows such as program `PRO-2198` (`Extended Review`) linked to `responseTime` metric with value `19.95` and `verified` data quality. This view supports program-level clinical data aggregation.

**View `vw_quantitative_analytic_tool_clinical_performance_data_detail`**

```sql
CREATE VIEW vw_quantitative_analytic_tool_clinical_performance_data_detail AS
SELECT a.id, a.tool_i_d, a.tool_name, b.clinical_performance_data_id AS data_clinical_performance_data_id, b.data_record_i_d AS data_data_record_i_d, b.collection_date AS data_collection_date
FROM quantitative_analytic_tools a
  JOIN tools_datas j ON j.quantitative_analytic_tool_id = a.id
  JOIN clinical_performance_datas b ON b.clinical_performance_data_id = j.clinical_performance_data_id;
```

| id | tool_i_d | tool_name | data_clinical_performance_data_id | data_data_record_i_d | data_collection_date |
|---|---|---|---|---|---|
| 1000 | TOO-2591 | Composite Model | 1 | DAT-2681 | 2025-12-17T11:57:00 |
| 1000 | TOO-2591 | Composite Model | 2 | DAT-2686 | 2022-05-01T18:14:00 |
| 1001 | TOO-2594 | Compact Cluster A | 2 | DAT-2686 | 2022-05-01T18:14:00 |
| 1001 | TOO-2594 | Compact Cluster A | 3 | DAT-2691 | 2023-10-12T01:31:00 |
| 1002 | TOO-2597 | Legacy Review | 3 | DAT-2691 | 2023-10-12T01:31:00 |
| 1002 | TOO-2597 | Legacy Review | 4 | DAT-2696 | 2024-03-23T08:48:00 |
| 1003 | TOO-2600 | Regional Initiative | 4 | DAT-2696 | 2024-03-23T08:48:00 |
| 1003 | TOO-2600 | Regional Initiative | 1 | DAT-2681 | 2025-12-17T11:57:00 |

This view provides a detailed join between `quantitative_analytic_tools` and `clinical_performance_datas`, enriched with columns from both tables. It answers: what are the full details of clinical performance data analysed by each tool? A representative row would show `Composite Model` tool (type `statistical`, version `seasonal-version-71`, status `validated`) applied to `responseTime` metric (value `19.95`, unit `composite-unit-69`, quality `verified`) collected on `2025-12-17T11:57:00`. This view supports tool-data lineage tracking.

**View `vw_quantitative_analytic_tool_patient_outcome`**

```sql
CREATE VIEW vw_quantitative_analytic_tool_patient_outcome AS
SELECT a.id, a.tool_i_d, a.tool_name, a.tool_type, b.id AS outcome_id, b.outcome_i_d AS outcome_outcome_i_d, b.measurement_date AS outcome_measurement_date
FROM quantitative_analytic_tools a JOIN patient_outcomes b ON a.patient_outcome_id = b.id;
```

| id | tool_i_d | tool_name | tool_type | outcome_id | outcome_outcome_i_d | outcome_measurement_date |
|---|---|---|---|---|---|---|
| 1000 | TOO-2591 | Composite Model | statistical | 100 | OUT-2379 | 2024-07-01T18:54:00 |
| 1001 | TOO-2594 | Compact Cluster A | machineLearning | 101 | OUT-2380 | 2025-12-12T01:11:00 |
| 1002 | TOO-2597 | Legacy Review | dashboard | 102 | OUT-2381 | 2022-05-23T08:28:00 |
| 1003 | TOO-2600 | Regional Initiative | simulation | 103 | OUT-2382 | 2023-10-07T15:45:00 |

This view joins `quantitative_analytic_tools` with `patient_outcomes` to answer: which patient outcome does each analytic tool measure? The join on `quantitative_analytic_tools.patient_outcome_id = patient_outcomes.id` produces rows such as `Composite Model` tool (id 1000) measuring `mortality` outcome with value `19.95` and `improved` direction. This view supports outcome-tool mapping for validation purposes.

**View `vw_quantitative_analytic_tool_quality_improvement_program`**

```sql
CREATE VIEW vw_quantitative_analytic_tool_quality_improvement_program AS
SELECT a.id, a.tool_i_d, a.tool_name, a.tool_type, b.quality_improvement_program_id AS program_quality_improvement_program_id, b.program_identifier AS program_program_identifier, b.program_name AS program_program_name
FROM quantitative_analytic_tools a JOIN quality_improvement_programs b ON a.quality_improvement_program_id = b.quality_improvement_program_id;
```

| id | tool_i_d | tool_name | tool_type | program_quality_improvement_program_id | program_program_identifier | program_program_name |
|---|---|---|---|---|---|---|
| 1000 | TOO-2591 | Composite Model | statistical | 100 | PRO-2198 | Extended Review |
| 1001 | TOO-2594 | Compact Cluster A | machineLearning | 101 | PRO-2205 | Pilot Initiative A |
| 1002 | TOO-2597 | Legacy Review | dashboard | 102 | PRO-2212 | Baseline Model |
| 1003 | TOO-2600 | Regional Initiative | simulation | 103 | PRO-2219 | Distributed Cluster |

This view joins `quantitative_analytic_tools` with `quality_improvement_programs` to answer: which programs employ which analytic tools? The join on `quantitative_analytic_tools.quality_improvement_program_id = quality_improvement_programs.quality_improvement_program_id` produces rows such as program `PRO-2198` (`Extended Review`) employing `Composite Model` tool (type `statistical`, status `validated`). This view supports program tool inventory management.

**View `vw_patient_outcome_quality_improvement_program`**

```sql
CREATE VIEW vw_patient_outcome_quality_improvement_program AS
SELECT a.id, a.outcome_i_d, a.measurement_date, a.outcome_type, b.quality_improvement_program_id AS program_quality_improvement_program_id, b.program_identifier AS program_program_identifier, b.program_name AS program_program_name
FROM patient_outcomes a JOIN quality_improvement_programs b ON a.quality_improvement_program_id = b.quality_improvement_program_id;
```

| id | outcome_i_d | measurement_date | outcome_type | program_quality_improvement_program_id | program_program_identifier | program_program_name |
|---|---|---|---|---|---|---|
| 100 | OUT-2379 | 2024-07-01T18:54:00 | mortality | 100 | PRO-2198 | Extended Review |
| 101 | OUT-2380 | 2025-12-12T01:11:00 | morbidity | 101 | PRO-2205 | Pilot Initiative A |
| 102 | OUT-2381 | 2022-05-23T08:28:00 | recoveryRate | 102 | PRO-2212 | Baseline Model |
| 103 | OUT-2382 | 2023-10-07T15:45:00 | complicationRate | 103 | PRO-2219 | Distributed Cluster |

This view joins `patient_outcomes` with `quality_improvement_programs` to answer: which program targets which patient outcome? The join on `patient_outcomes.quality_improvement_program_id = quality_improvement_programs.quality_improvement_program_id` produces rows such as program `PRO-2198` (`Extended Review`) targeting `mortality` outcome with value `19.95` and `improved` direction. This view supports program outcome alignment verification.

**View `vw_patient_outcome_quantitative_analytic_tool`**

```sql
CREATE VIEW vw_patient_outcome_quantitative_analytic_tool AS
SELECT a.id, a.outcome_i_d, a.measurement_date, a.outcome_type, b.id AS tool_id, b.tool_i_d AS tool_tool_i_d, b.tool_name AS tool_tool_name
FROM patient_outcomes a JOIN quantitative_analytic_tools b ON a.quantitative_analytic_tool_id = b.id;
```

| id | outcome_i_d | measurement_date | outcome_type | tool_id | tool_tool_i_d | tool_tool_name |
|---|---|---|---|---|---|---|
| 100 | OUT-2379 | 2024-07-01T18:54:00 | mortality | 1000 | TOO-2591 | Composite Model |
| 101 | OUT-2380 | 2025-12-12T01:11:00 | morbidity | 1001 | TOO-2594 | Compact Cluster A |
| 102 | OUT-2381 | 2022-05-23T08:28:00 | recoveryRate | 1002 | TOO-2597 | Legacy Review |
| 103 | OUT-2382 | 2023-10-07T15:45:00 | complicationRate | 1003 | TOO-2600 | Regional Initiative |

This view joins `patient_outcomes` with `quantitative_analytic_tools` to answer: which tool measures which patient outcome? The join on `patient_outcomes.quantitative_analytic_tool_id = quantitative_analytic_tools.id` produces rows such as `mortality` outcome (value `19.95`, direction `improved`) measured by `Composite Model` tool (type `statistical`, status `validated`). This view supports measurement methodology documentation.

**View `vw_patient_outcome_first_responder_organization`**

```sql
CREATE VIEW vw_patient_outcome_first_responder_organization AS
SELECT a.id, a.outcome_i_d, a.measurement_date, a.outcome_type, b.first_responder_organization_id AS organization_first_responder_organization_id, b.organization_i_d AS organization_organization_i_d, b.organization_name AS organization_organization_name
FROM patient_outcomes a JOIN first_responder_organizations b ON a.first_responder_organization_id = b.first_responder_organization_id;
```

| id | outcome_i_d | measurement_date | outcome_type | organization_first_responder_organization_id | organization_organization_i_d | organization_organization_name |
|---|---|---|---|---|---|---|
| 100 | OUT-2379 | 2024-07-01T18:54:00 | mortality | 1 | Lockheed Martin | Staples Inc. |
| 101 | OUT-2380 | 2025-12-12T01:11:00 | morbidity | 2 | Austria Card | Oscar Health Inc. |
| 102 | OUT-2381 | 2022-05-23T08:28:00 | recoveryRate | 3 | Memphis City Schools Foundation | Atlantic Richfield |
| 103 | OUT-2382 | 2023-10-07T15:45:00 | complicationRate | 4 | New Schools for New Orleans | Port Loko |

This view joins `patient_outcomes` with `first_responder_organizations` to answer: which organization is responsible for which patient outcome? The join on `patient_outcomes.first_responder_organization_id = first_responder_organizations.first_responder_organization_id` produces rows such as `mortality` outcome (value `19.95`, direction `improved`) produced by `Staples Inc.` (organization id 1, service type `EMS`, status `active`). This view supports organizational outcome accountability.

## Synthesis

The relational schema for this quality improvement domain follows a disciplined normalisation pattern: the central `quality_improvement_programs` table anchors the model with three direct foreign-key relationships to `first_responder_organizations`, `clinical_performance_datas`, and `patient_outcomes`, while `municipalities` and `quantitative_analytic_tools` provide additional dimensionality. Two junction tables — `municipalities_organizations` and `tools_datas` — resolve many-to-many associations that the star schema cannot express directly. The twenty views materialise every pairwise relationship between the core entities, each view answering a specific analytical question by joining the relevant tables and presenting the result as a single denormalised fact. This design ensures that every domain fact — which organization runs which program, which municipality hosts which service, which tool analyses which metric, which outcome improves which condition — can be reconstructed from the normalized base tables through a single, well-defined join. The record identifiers (`PRO-2198`, `DAT-2681`, `TOO-2591`, `OUT-2379`) and their associated values provide the traceability needed for audit, compliance, and continuous improvement workflows.