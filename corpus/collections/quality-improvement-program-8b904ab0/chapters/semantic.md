## Domain Ontology and Relational Materialization

Healthcare quality improvement operates as a multi-layered governance ecosystem in which organizations commission programs, programs execute measurement activities, activities are staffed by professionals, and the resulting clinical performance data are analysed with analytic tools under the authority of policy instruments. The ontology captures seven principal entity types—`quality_improvement_programs`, `clinical_performance_datas`, `measurement_activities`, `healthcare_professionals`, `organizations`, `policy_instruments`, and `analytic_tools`—alongside six associative (junction) tables that resolve many-to-many relationships. Every view materialises a domain fact by joining the normalised tables along their foreign-key edges, so that a single query can answer questions such as "which organization sponsors a given program?" or "what policy instrument governs a specific clinical performance record?"

### Core Entity Types

The anchor of the model is `quality_improvement_programs`, which represents discrete improvement initiatives. Each row carries a surrogate `id`, a human-readable `program_identifier` (e.g. `PRO-2198`), a `program_name` such as *Extended Review* or *Pilot Initiative A*, a `start_date` in ISO-8601 format, a lifecycle `status` (`active`, `planning`, `suspended`, `completed`), and a `methodology` (`PDSA`, `Lean`, `Six Sigma`, `Other`). The program table also stores two foreign keys—`organization_org_id` and `policy_instrument_policy_id`—that immediately bind a program to its sponsoring organisation and the governing policy instrument.

**Table `quality_improvement_programs`**

| id | program_identifier | program_name | start_date | status | methodology | organization_org_id | policy_instrument_policy_id |
|---|---|---|---|---|---|---|---|
| 1 | PRO-2198 | Extended Review | 2022-09-05T20:24:00 | active | PDSA | 790471 | 5844252 |
| 2 | PRO-2205 | Pilot Initiative A | 2023-02-16T03:41:00 | planning | Lean | 1717 | 10207142 |
| 3 | PRO-2212 | Baseline Model | 2024-07-27T10:58:00 | suspended | Six Sigma | 69437 | 1562847 |
| 4 | PRO-2219 | Distributed Cluster | 2025-12-11T17:15:00 | completed | Other | m16 | ChIJkzsYUIBt5kcRM6_JHx26ONk |

Clinical performance is captured in `clinical_performance_datas`, which records individual metric observations. Each row has a `clinical_performance_data_id`, a `data_record_id` (e.g. `1889764`), a `collection_date`, a `metric_type` (`outcome`, `process`, `structure`), a numeric `value` (e.g. `19.95`), a `unit_of_measure` (`composite-unit-69`), a `data_quality_score` (e.g. `8.70`), and two foreign keys: `measurement_activity_id` links the observation to the activity that produced it, while `analytic_tool_id` records which tool was used in the analysis.

**Table `clinical_performance_datas`**

| clinical_performance_data_id | data_record_id | collection_date | metric_type | value | unit_of_measure | data_quality_score | measurement_activity_id | analytic_tool_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 1889764 | 2025-12-17T11:57:00 | outcome | 19.95 | composite-unit-69 | 8.70 | 1 | 1000 |
| 2 | 1437601 | 2022-05-01T18:14:00 | process | 21.90 | primary-unit-70 | 10.40 | 2 | 1001 |
| 3 | 9736911 | 2023-10-12T01:31:00 | structure | 23.85 | adaptive-unit-71 | 12.10 | 3 | 1002 |
| 4 | 7119777 | 2024-03-23T08:48:00 | outcome | 25.80 | distributed-unit-72 | 13.80 | 4 | 1003 |

Measurement activities are the operational events through which data are collected. The `measurement_activities` table stores an `id`, an `activity_id` (e.g. `8843761`), `start_time` and `end_time` timestamps, a `protocol_version` (`legacy-protocol-43`), an `instrument_used` (`pilot-instrume-62`), a `status` (`scheduled`, `inProgress`, `completed`, `failed`), and two foreign keys: `healthcare_professional_id` identifies the staff member who conducted the activity, and `quality_improvement_program_id` ties the activity back to its parent program.

**Table `measurement_activities`**

| id | activity_id | start_time | end_time | protocol_version | instrument_used | status | healthcare_professional_id | quality_improvement_program_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 8843761 | 2024-03-27T14:42:00 | 2023-02-26T13:27:00 | legacy-protocol-43 | pilot-instrume-62 | scheduled | 100 | 1 |
| 2 | 4180957 | 2025-08-11T21:59:00 | 2024-07-10T20:44:00 | compact-protocol-44 | extended-instrume-63 | inProgress | 101 | 2 |
| 3 | 168545 | 2022-01-22T04:16:00 | 2025-12-21T03:01:00 | composite-protocol-45 | integrated-instrume-64 | completed | 102 | 3 |
| 4 | default_chart_a_account_53 | 2023-06-06T11:33:00 | 2022-05-05T10:18:00 | primary-protocol-46 | seasonal-instrume-65 | failed | 103 | 4 |

Healthcare professionals are the human actors. The `healthcare_professionals` table holds a `healthcare_professional_id`, a `professional_id` (e.g. `5082965`), a `full_name` (e.g. *Theodore Mcgrath*), a `role` (`paramedic`, `clinical_quality_coordinator`, `medical_director`, `researcher`), `years_of_experience`, a `certification_status` (`active`, `expired`, `pending`), an `organization_affiliation` string, and two foreign keys: `organization_org_id` links the professional to their employing organisation, while `quality_improvement_program_id` associates them with a program.

**Table `healthcare_professionals`**

| healthcare_professional_id | professional_id | full_name | role | years_of_experience | certification_status | organization_affiliation | organization_org_id | quality_improvement_program_id |
|---|---|---|---|---|---|---|---|---|
| 100 | 5082965 | Theodore Mcgrath | paramedic | 7 | active | China Unionpay Co. Ltd | 790471 | 1 |
| 101 | 2618560 | Account Name | clinical_quality_coordinator | 10 | expired | Taito Corporation Japan | 1717 | 2 |
| 102 | 3355767 | Saipan International Airport | medical_director | 13 | pending | Ocean Network Express Pte Ltd | 69437 | 3 |
| 103 | 3355784 | Norma Fisher | researcher | 16 | active | District No. 3 | m16 | 4 |

Organisations are the institutional entities. The `organizations` table contains an `org_id` (e.g. `790471`), an `org_name` (which in the data coincides with program names such as *Extended Review* and *Pilot Initiative A*), an `org_type` (`ems_authority`, `hospital`, `first_responder`, `municipality`), a `jurisdiction` (`regional-jurisdic-30`), an `established_date`, a `status` (`active`, `inactive`, `merger`), and a `quality_improvement_program_id` foreign key that creates a direct link back to a program.

**Table `organizations`**

| org_id | org_name | org_type | jurisdiction | established_date | status | quality_improvement_program_id |
|---|---|---|---|---|---|---|
| 790471 | Extended Review | ems_authority | regional-jurisdic-30 | 2024-03-27 | active | 1 |
| 1717 | Pilot Initiative A | hospital | legacy-jurisdic-31 | 2025-08-11 | inactive | 2 |
| 69437 | Baseline Model | first_responder | compact-jurisdic-32 | 2022-01-22 | merger | 3 |
| m16 | Distributed Cluster | municipality | composite-jurisdic-33 | 2023-06-06 | active | 4 |

Policy instruments encode the regulatory and procedural framework. The `policy_instruments` table stores a `policy_id` (e.g. `5844252`), a `policy_title` (*Baseline Initiative D*), an `effective_date`, an `issuing_authority` (`extended-issuing-33`), a `policy_type` (`clinical_protocol`, `quality_standard`, `regulation`, `guideline`), a `version` (`seasonal-version-71`), a `status` (`draft`, `active`, `superseded`, `withdrawn`), and three foreign keys: `quality_improvement_program_id`, `clinical_performance_data_id`, and `organization_org_id` together bind a policy to a program, a data record, and an organisation.

**Table `policy_instruments`**

| policy_id | policy_title | effective_date | issuing_authority | policy_type | version | status | quality_improvement_program_id | clinical_performance_data_id | organization_org_id |
|---|---|---|---|---|---|---|---|---|---|
| 5844252 | Baseline Initiative D | 2023-02-14 | extended-issuing-33 | clinical_protocol | seasonal-version-71 | draft | 1 | 1 | 790471 |
| 10207142 | Distributed Model | 2024-07-25 | integrated-issuing-34 | quality_standard | regional-version-72 | active | 2 | 2 | 1717 |
| 1562847 | Adaptive Cluster | 2025-12-09 | seasonal-issuing-35 | regulation | legacy-version-73 | superseded | 3 | 3 | 69437 |
| ChIJkzsYUIBt5kcRM6_JHx26ONk | Primary Review A | 2022-05-20 | regional-issuing-36 | guideline | compact-version-74 | withdrawn | 4 | 4 | m16 |

Analytic tools represent the software or methodological instruments used to analyse clinical performance data. Although the `analytic_tools` table is not displayed in the sample rows, it is referenced via the `analytic_tool_id` foreign key in `clinical_performance_datas` and appears in several views that join tools to programs, professionals, and data records.

**Table `analytic_tools`**

| analytic_tool_id | tool_id | tool_name | tool_type | version | last_updated | validation_status | healthcare_professional_id | quality_improvement_program_id |
|---|---|---|---|---|---|---|---|---|
| 1000 | comi | Composite Model | statistical_package | seasonal-version-71 | 2023-06-17T17:27:00 | validated | 100 | 1 |
| 1001 | 195360 | Compact Cluster A | dashboard | regional-version-72 | 2024-11-01T00:44:00 | pilot | 101 | 2 |
| 1002 | 3355763 | Legacy Review | machine_learning_model | legacy-version-73 | 2025-04-12T07:01:00 | unvalidated | 102 | 3 |
| 1003 | 8387539 | Regional Initiative | spreadsheet | compact-version-74 | 2022-09-23T14:18:00 | validated | 103 | 4 |

### Associative (Junction) Tables

The model employs six junction tables to resolve many-to-many relationships that cannot be expressed through simple foreign keys. The `programs_datas` table links quality improvement programs to clinical performance data records, enabling a single program to be associated with multiple data collections and vice versa.

**Table `programs_datas`**

| quality_improvement_program_id | clinical_performance_data_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

The `activities_datas` table connects measurement activities to clinical performance data, allowing the model to track which activities produced which data points.

**Table `activities_datas`**

| measurement_activity_id | clinical_performance_data_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

The `professionals_activities` table resolves the relationship between healthcare professionals and measurement activities, supporting the scenario where a professional participates in multiple activities and an activity involves multiple professionals.

**Table `professionals_activities`**

| healthcare_professional_id | measurement_activity_id |
|---|---|
| 100 | 1 |
| 100 | 2 |
| 101 | 2 |
| 101 | 3 |
| 102 | 3 |
| 102 | 4 |
| 103 | 4 |
| 103 | 1 |

The `organizations_programs` table links organisations to quality improvement programs, reflecting the fact that an organisation may sponsor multiple programs and a program may involve multiple organisations.

**Table `organizations_programs`**

| organization_org_id | quality_improvement_program_id |
|---|---|
| 790471 | 1 |
| 790471 | 2 |
| 1717 | 2 |
| 1717 | 3 |
| 69437 | 3 |
| 69437 | 4 |
| m16 | 4 |
| m16 | 1 |

The `organizations_professionals` table associates healthcare professionals with their employing organisations, supporting the many-to-many relationship between staff and institutions.

**Table `organizations_professionals`**

| organization_org_id | healthcare_professional_id |
|---|---|
| 790471 | 100 |
| 790471 | 101 |
| 1717 | 101 |
| 1717 | 102 |
| 69437 | 102 |
| 69437 | 103 |
| m16 | 103 |
| m16 | 100 |

The `tools_datas` table connects analytic tools to clinical performance data, enabling the tracking of which tools were applied to which data records.

**Table `tools_datas`**

| analytic_tool_id | clinical_performance_data_id |
|---|---|
| 1000 | 1 |
| 1000 | 2 |
| 1001 | 2 |
| 1001 | 3 |
| 1002 | 3 |
| 1002 | 4 |
| 1003 | 4 |
| 1003 | 1 |

### View-Based Fact Reconstruction

Views in this schema serve as denormalised lenses that reconstruct domain facts from the normalised base tables. Each view answers a specific analytical question by joining the relevant tables along their foreign-key relationships.

The `quality_improvement_program_organization_view` joins `quality_improvement_programs` with `organizations` to answer the question "which organisation sponsors which program?" For example, the program *Extended Review* (`PRO-2198`) is linked to the organisation with `org_id` `790471`, while *Distributed Cluster* is associated with organisation `m16`.

**View `quality_improvement_program_organization_view`**

```sql
CREATE VIEW quality_improvement_program_organization_view AS
SELECT a.id, a.program_identifier, a.program_name, a.start_date, b.org_id AS organization_org_id, b.org_name AS organization_org_name, b.org_type AS organization_org_type
FROM quality_improvement_programs a JOIN organizations b ON a.organization_org_id = b.org_id;
```

| id | program_identifier | program_name | start_date | organization_org_id | organization_org_name | organization_org_type |
|---|---|---|---|---|---|---|
| 1 | PRO-2198 | Extended Review | 2022-09-05T20:24:00 | 790471 | Extended Review | ems_authority |
| 2 | PRO-2205 | Pilot Initiative A | 2023-02-16T03:41:00 | 1717 | Pilot Initiative A | hospital |
| 3 | PRO-2212 | Baseline Model | 2024-07-27T10:58:00 | 69437 | Baseline Model | first_responder |
| 4 | PRO-2219 | Distributed Cluster | 2025-12-11T17:15:00 | m16 | Distributed Cluster | municipality |

The `quality_improvement_program_clinical_performance_data_detail_view` joins programs to clinical performance data, revealing which data records fall under which improvement initiatives. A row might show that program *Pilot Initiative A* is associated with a clinical performance data record of type `process` and value `21.90`.

**View `quality_improvement_program_clinical_performance_data_detail_view`**

```sql
CREATE VIEW quality_improvement_program_clinical_performance_data_detail_view AS
SELECT a.id, a.program_identifier, a.program_name, b.clinical_performance_data_id AS data_clinical_performance_data_id, b.data_record_id AS data_data_record_id, b.collection_date AS data_collection_date
FROM quality_improvement_programs a
  JOIN programs_datas j ON j.quality_improvement_program_id = a.id
  JOIN clinical_performance_datas b ON b.clinical_performance_data_id = j.clinical_performance_data_id;
```

| id | program_identifier | program_name | data_clinical_performance_data_id | data_data_record_id | data_collection_date |
|---|---|---|---|---|---|
| 1 | PRO-2198 | Extended Review | 1 | 1889764 | 2025-12-17T11:57:00 |
| 1 | PRO-2198 | Extended Review | 2 | 1437601 | 2022-05-01T18:14:00 |
| 2 | PRO-2205 | Pilot Initiative A | 2 | 1437601 | 2022-05-01T18:14:00 |
| 2 | PRO-2205 | Pilot Initiative A | 3 | 9736911 | 2023-10-12T01:31:00 |
| 3 | PRO-2212 | Baseline Model | 3 | 9736911 | 2023-10-12T01:31:00 |
| 3 | PRO-2212 | Baseline Model | 4 | 7119777 | 2024-03-23T08:48:00 |
| 4 | PRO-2219 | Distributed Cluster | 4 | 7119777 | 2024-03-23T08:48:00 |
| 4 | PRO-2219 | Distributed Cluster | 1 | 1889764 | 2025-12-17T11:57:00 |

The `quality_improvement_program_policy_instrument_view` connects programs to their governing policy instruments. For instance, the program *Extended Review* is governed by the policy *Baseline Initiative D* (`5844252`), a `clinical_protocol` of `seasonal-version-71` in `draft` status.

**View `quality_improvement_program_policy_instrument_view`**

```sql
CREATE VIEW quality_improvement_program_policy_instrument_view AS
SELECT a.id, a.program_identifier, a.program_name, a.start_date, b.policy_id AS instrument_policy_id, b.policy_title AS instrument_policy_title, b.effective_date AS instrument_effective_date
FROM quality_improvement_programs a JOIN policy_instruments b ON a.policy_instrument_policy_id = b.policy_id;
```

| id | program_identifier | program_name | start_date | instrument_policy_id | instrument_policy_title | instrument_effective_date |
|---|---|---|---|---|---|---|
| 1 | PRO-2198 | Extended Review | 2022-09-05T20:24:00 | 5844252 | Baseline Initiative D | 2023-02-14 |
| 2 | PRO-2205 | Pilot Initiative A | 2023-02-16T03:41:00 | 10207142 | Distributed Model | 2024-07-25 |
| 3 | PRO-2212 | Baseline Model | 2024-07-27T10:58:00 | 1562847 | Adaptive Cluster | 2025-12-09 |
| 4 | PRO-2219 | Distributed Cluster | 2025-12-11T17:15:00 | ChIJkzsYUIBt5kcRM6_JHx26ONk | Primary Review A | 2022-05-20 |

The `clinical_performance_data_measurement_activity_view` joins clinical performance data to the measurement activities that produced them. A data record with `clinical_performance_data_id` `1` and value `19.95` is linked to measurement activity `1`, which used the instrument `pilot-instrume-62`.

**View `clinical_performance_data_measurement_activity_view`**

```sql
CREATE VIEW clinical_performance_data_measurement_activity_view AS
SELECT a.clinical_performance_data_id, a.data_record_id, a.collection_date, a.metric_type, b.id AS activity_id, b.activity_id AS activity_activity_id, b.start_time AS activity_start_time
FROM clinical_performance_datas a JOIN measurement_activities b ON a.measurement_activity_id = b.id;
```

| clinical_performance_data_id | data_record_id | collection_date | metric_type | activity_id | activity_activity_id | activity_start_time |
|---|---|---|---|---|---|---|
| 1 | 1889764 | 2025-12-17T11:57:00 | outcome | 1 | 8843761 | 2024-03-27T14:42:00 |
| 2 | 1437601 | 2022-05-01T18:14:00 | process | 2 | 4180957 | 2025-08-11T21:59:00 |
| 3 | 9736911 | 2023-10-12T01:31:00 | structure | 3 | 168545 | 2022-01-22T04:16:00 |
| 4 | 7119777 | 2024-03-23T08:48:00 | outcome | 4 | default_chart_a_account_53 | 2023-06-06T11:33:00 |

The `clinical_performance_data_analytic_tool_view` links clinical performance data to the analytic tools used in their analysis. A data record with `analytic_tool_id` `1000` might have been analysed using a specific tool whose details are resolved through the join.

**View `clinical_performance_data_analytic_tool_view`**

```sql
CREATE VIEW clinical_performance_data_analytic_tool_view AS
SELECT a.clinical_performance_data_id, a.data_record_id, a.collection_date, a.metric_type, b.analytic_tool_id AS tool_analytic_tool_id, b.tool_id AS tool_tool_id, b.tool_name AS tool_tool_name
FROM clinical_performance_datas a JOIN analytic_tools b ON a.analytic_tool_id = b.analytic_tool_id;
```

| clinical_performance_data_id | data_record_id | collection_date | metric_type | tool_analytic_tool_id | tool_tool_id | tool_tool_name |
|---|---|---|---|---|---|---|
| 1 | 1889764 | 2025-12-17T11:57:00 | outcome | 1000 | comi | Composite Model |
| 2 | 1437601 | 2022-05-01T18:14:00 | process | 1001 | 195360 | Compact Cluster A |
| 3 | 9736911 | 2023-10-12T01:31:00 | structure | 1002 | 3355763 | Legacy Review |
| 4 | 7119777 | 2024-03-23T08:48:00 | outcome | 1003 | 8387539 | Regional Initiative |

The `measurement_activity_healthcare_professional_view` joins measurement activities to the healthcare professionals who conducted them. Activity `1` (with `activity_id` `8843761`) was conducted by professional `100` (Theodore Mcgrath, a `paramedic` with `7` years of experience).

**View `measurement_activity_healthcare_professional_view`**

```sql
CREATE VIEW measurement_activity_healthcare_professional_view AS
SELECT a.id, a.activity_id, a.start_time, a.end_time, b.healthcare_professional_id AS professional_healthcare_professional_id, b.professional_id AS professional_professional_id, b.full_name AS professional_full_name
FROM measurement_activities a JOIN healthcare_professionals b ON a.healthcare_professional_id = b.healthcare_professional_id;
```

| id | activity_id | start_time | end_time | professional_healthcare_professional_id | professional_professional_id | professional_full_name |
|---|---|---|---|---|---|---|
| 1 | 8843761 | 2024-03-27T14:42:00 | 2023-02-26T13:27:00 | 100 | 5082965 | Theodore Mcgrath |
| 2 | 4180957 | 2025-08-11T21:59:00 | 2024-07-10T20:44:00 | 101 | 2618560 | Account Name |
| 3 | 168545 | 2022-01-22T04:16:00 | 2025-12-21T03:01:00 | 102 | 3355767 | Saipan International Airport |
| 4 | default_chart_a_account_53 | 2023-06-06T11:33:00 | 2022-05-05T10:18:00 | 103 | 3355784 | Norma Fisher |

The `measurement_activity_clinical_performance_data_detail_view` provides a detailed view of measurement activities alongside their associated clinical performance data, enabling analysts to trace data provenance from activity to observation.

**View `measurement_activity_clinical_performance_data_detail_view`**

```sql
CREATE VIEW measurement_activity_clinical_performance_data_detail_view AS
SELECT a.id, a.activity_id, a.start_time, b.clinical_performance_data_id AS data_clinical_performance_data_id, b.data_record_id AS data_data_record_id, b.collection_date AS data_collection_date
FROM measurement_activities a
  JOIN activities_datas j ON j.measurement_activity_id = a.id
  JOIN clinical_performance_datas b ON b.clinical_performance_data_id = j.clinical_performance_data_id;
```

| id | activity_id | start_time | data_clinical_performance_data_id | data_data_record_id | data_collection_date |
|---|---|---|---|---|---|
| 1 | 8843761 | 2024-03-27T14:42:00 | 1 | 1889764 | 2025-12-17T11:57:00 |
| 1 | 8843761 | 2024-03-27T14:42:00 | 2 | 1437601 | 2022-05-01T18:14:00 |
| 2 | 4180957 | 2025-08-11T21:59:00 | 2 | 1437601 | 2022-05-01T18:14:00 |
| 2 | 4180957 | 2025-08-11T21:59:00 | 3 | 9736911 | 2023-10-12T01:31:00 |
| 3 | 168545 | 2022-01-22T04:16:00 | 3 | 9736911 | 2023-10-12T01:31:00 |
| 3 | 168545 | 2022-01-22T04:16:00 | 4 | 7119777 | 2024-03-23T08:48:00 |
| 4 | default_chart_a_account_53 | 2023-06-06T11:33:00 | 4 | 7119777 | 2024-03-23T08:48:00 |
| 4 | default_chart_a_account_53 | 2023-06-06T11:33:00 | 1 | 1889764 | 2025-12-17T11:57:00 |

The `measurement_activity_quality_improvement_program_view` links measurement activities back to their parent quality improvement programs. Activity `1` belongs to program `1` (*Extended Review*), while activity `2` belongs to program `2` (*Pilot Initiative A*).

**View `measurement_activity_quality_improvement_program_view`**

```sql
CREATE VIEW measurement_activity_quality_improvement_program_view AS
SELECT a.id, a.activity_id, a.start_time, a.end_time, b.id AS program_id, b.program_identifier AS program_program_identifier, b.program_name AS program_program_name
FROM measurement_activities a JOIN quality_improvement_programs b ON a.quality_improvement_program_id = b.id;
```

| id | activity_id | start_time | end_time | program_id | program_program_identifier | program_program_name |
|---|---|---|---|---|---|---|
| 1 | 8843761 | 2024-03-27T14:42:00 | 2023-02-26T13:27:00 | 1 | PRO-2198 | Extended Review |
| 2 | 4180957 | 2025-08-11T21:59:00 | 2024-07-10T20:44:00 | 2 | PRO-2205 | Pilot Initiative A |
| 3 | 168545 | 2022-01-22T04:16:00 | 2025-12-21T03:01:00 | 3 | PRO-2212 | Baseline Model |
| 4 | default_chart_a_account_53 | 2023-06-06T11:33:00 | 2022-05-05T10:18:00 | 4 | PRO-2219 | Distributed Cluster |

The `healthcare_professional_organization_view` joins healthcare professionals to their employing organisations. Theodore Mcgrath (`healthcare_professional_id` `100`) is affiliated with organisation `790471` (China Unionpay Co. Ltd), while Norma Fisher (`healthcare_professional_id` `103`) is affiliated with organisation `m16` (District No. 3).

**View `healthcare_professional_organization_view`**

```sql
CREATE VIEW healthcare_professional_organization_view AS
SELECT a.healthcare_professional_id, a.professional_id, a.full_name, a.role, b.org_id AS organization_org_id, b.org_name AS organization_org_name, b.org_type AS organization_org_type
FROM healthcare_professionals a JOIN organizations b ON a.organization_org_id = b.org_id;
```

| healthcare_professional_id | professional_id | full_name | role | organization_org_id | organization_org_name | organization_org_type |
|---|---|---|---|---|---|---|
| 100 | 5082965 | Theodore Mcgrath | paramedic | 790471 | Extended Review | ems_authority |
| 101 | 2618560 | Account Name | clinical_quality_coordinator | 1717 | Pilot Initiative A | hospital |
| 102 | 3355767 | Saipan International Airport | medical_director | 69437 | Baseline Model | first_responder |
| 103 | 3355784 | Norma Fisher | researcher | m16 | Distributed Cluster | municipality |

The `healthcare_professional_measurement_activity_detail_view` provides a detailed view of healthcare professionals alongside their measurement activities, showing which professionals participated in which activities and under what protocol versions.

**View `healthcare_professional_measurement_activity_detail_view`**

```sql
CREATE VIEW healthcare_professional_measurement_activity_detail_view AS
SELECT a.healthcare_professional_id, a.professional_id, a.full_name, b.id AS activity_id, b.activity_id AS activity_activity_id, b.start_time AS activity_start_time
FROM healthcare_professionals a
  JOIN professionals_activities j ON j.healthcare_professional_id = a.healthcare_professional_id
  JOIN measurement_activities b ON b.id = j.measurement_activity_id;
```

| healthcare_professional_id | professional_id | full_name | activity_id | activity_activity_id | activity_start_time |
|---|---|---|---|---|---|
| 100 | 5082965 | Theodore Mcgrath | 1 | 8843761 | 2024-03-27T14:42:00 |
| 100 | 5082965 | Theodore Mcgrath | 2 | 4180957 | 2025-08-11T21:59:00 |
| 101 | 2618560 | Account Name | 2 | 4180957 | 2025-08-11T21:59:00 |
| 101 | 2618560 | Account Name | 3 | 168545 | 2022-01-22T04:16:00 |
| 102 | 3355767 | Saipan International Airport | 3 | 168545 | 2022-01-22T04:16:00 |
| 102 | 3355767 | Saipan International Airport | 4 | default_chart_a_account_53 | 2023-06-06T11:33:00 |
| 103 | 3355784 | Norma Fisher | 4 | default_chart_a_account_53 | 2023-06-06T11:33:00 |
| 103 | 3355784 | Norma Fisher | 1 | 8843761 | 2024-03-27T14:42:00 |

The `healthcare_professional_quality_improvement_program_view` links healthcare professionals to the quality improvement programs they are associated with. Professional `100` is linked to program `1`, professional `101` to program `2`, and so on.

**View `healthcare_professional_quality_improvement_program_view`**

```sql
CREATE VIEW healthcare_professional_quality_improvement_program_view AS
SELECT a.healthcare_professional_id, a.professional_id, a.full_name, a.role, b.id AS program_id, b.program_identifier AS program_program_identifier, b.program_name AS program_program_name
FROM healthcare_professionals a JOIN quality_improvement_programs b ON a.quality_improvement_program_id = b.id;
```

| healthcare_professional_id | professional_id | full_name | role | program_id | program_program_identifier | program_program_name |
|---|---|---|---|---|---|---|
| 100 | 5082965 | Theodore Mcgrath | paramedic | 1 | PRO-2198 | Extended Review |
| 101 | 2618560 | Account Name | clinical_quality_coordinator | 2 | PRO-2205 | Pilot Initiative A |
| 102 | 3355767 | Saipan International Airport | medical_director | 3 | PRO-2212 | Baseline Model |
| 103 | 3355784 | Norma Fisher | researcher | 4 | PRO-2219 | Distributed Cluster |

The `organization_quality_improvement_program_detail_view` joins organisations to their quality improvement programs with additional detail, showing the full picture of which organisations sponsor which programs and under what status.

**View `organization_quality_improvement_program_detail_view`**

```sql
CREATE VIEW organization_quality_improvement_program_detail_view AS
SELECT a.org_id, a.org_name, a.org_type, b.id AS program_id, b.program_identifier AS program_program_identifier, b.program_name AS program_program_name
FROM organizations a
  JOIN organizations_programs j ON j.organization_org_id = a.org_id
  JOIN quality_improvement_programs b ON b.id = j.quality_improvement_program_id;
```

| org_id | org_name | org_type | program_id | program_program_identifier | program_program_name |
|---|---|---|---|---|---|
| 790471 | Extended Review | ems_authority | 1 | PRO-2198 | Extended Review |
| 790471 | Extended Review | ems_authority | 2 | PRO-2205 | Pilot Initiative A |
| 1717 | Pilot Initiative A | hospital | 2 | PRO-2205 | Pilot Initiative A |
| 1717 | Pilot Initiative A | hospital | 3 | PRO-2212 | Baseline Model |
| 69437 | Baseline Model | first_responder | 3 | PRO-2212 | Baseline Model |
| 69437 | Baseline Model | first_responder | 4 | PRO-2219 | Distributed Cluster |
| m16 | Distributed Cluster | municipality | 4 | PRO-2219 | Distributed Cluster |
| m16 | Distributed Cluster | municipality | 1 | PRO-2198 | Extended Review |

The `organization_healthcare_professional_detail_view` provides a detailed view of organisations alongside their healthcare professionals, enabling organisational staffing analysis. Organisation `790471` employs Theodore Mcgrath, while organisation `1717` employs Account Name, a `clinical_quality_coordinator`.

**View `organization_healthcare_professional_detail_view`**

```sql
CREATE VIEW organization_healthcare_professional_detail_view AS
SELECT a.org_id, a.org_name, a.org_type, b.healthcare_professional_id AS professional_healthcare_professional_id, b.professional_id AS professional_professional_id, b.full_name AS professional_full_name
FROM organizations a
  JOIN organizations_professionals j ON j.organization_org_id = a.org_id
  JOIN healthcare_professionals b ON b.healthcare_professional_id = j.healthcare_professional_id;
```

| org_id | org_name | org_type | professional_healthcare_professional_id | professional_professional_id | professional_full_name |
|---|---|---|---|---|---|
| 790471 | Extended Review | ems_authority | 100 | 5082965 | Theodore Mcgrath |
| 790471 | Extended Review | ems_authority | 101 | 2618560 | Account Name |
| 1717 | Pilot Initiative A | hospital | 101 | 2618560 | Account Name |
| 1717 | Pilot Initiative A | hospital | 102 | 3355767 | Saipan International Airport |
| 69437 | Baseline Model | first_responder | 102 | 3355767 | Saipan International Airport |
| 69437 | Baseline Model | first_responder | 103 | 3355784 | Norma Fisher |
| m16 | Distributed Cluster | municipality | 103 | 3355784 | Norma Fisher |
| m16 | Distributed Cluster | municipality | 100 | 5082965 | Theodore Mcgrath |

The `organization_quality_improvement_program_view` offers a broader organisational perspective on quality improvement programs, aggregating program-level information per organisation.

**View `organization_quality_improvement_program_view`**

```sql
CREATE VIEW organization_quality_improvement_program_view AS
SELECT a.org_id, a.org_name, a.org_type, a.jurisdiction, b.id AS program_id, b.program_identifier AS program_program_identifier, b.program_name AS program_program_name
FROM organizations a JOIN quality_improvement_programs b ON a.quality_improvement_program_id = b.id;
```

| org_id | org_name | org_type | jurisdiction | program_id | program_program_identifier | program_program_name |
|---|---|---|---|---|---|---|
| 790471 | Extended Review | ems_authority | regional-jurisdic-30 | 1 | PRO-2198 | Extended Review |
| 1717 | Pilot Initiative A | hospital | legacy-jurisdic-31 | 2 | PRO-2205 | Pilot Initiative A |
| 69437 | Baseline Model | first_responder | compact-jurisdic-32 | 3 | PRO-2212 | Baseline Model |
| m16 | Distributed Cluster | municipality | composite-jurisdic-33 | 4 | PRO-2219 | Distributed Cluster |

The `policy_instrument_quality_improvement_program_view` joins policy instruments to the quality improvement programs they govern. Policy `5844252` (*Baseline Initiative D*) governs program `1` (*Extended Review*), while policy `10207142` (*Distributed Model*) governs program `2` (*Pilot Initiative A*).

**View `policy_instrument_quality_improvement_program_view`**

```sql
CREATE VIEW policy_instrument_quality_improvement_program_view AS
SELECT a.policy_id, a.policy_title, a.effective_date, a.issuing_authority, b.id AS program_id, b.program_identifier AS program_program_identifier, b.program_name AS program_program_name
FROM policy_instruments a JOIN quality_improvement_programs b ON a.quality_improvement_program_id = b.id;
```

| policy_id | policy_title | effective_date | issuing_authority | program_id | program_program_identifier | program_program_name |
|---|---|---|---|---|---|---|
| 5844252 | Baseline Initiative D | 2023-02-14 | extended-issuing-33 | 1 | PRO-2198 | Extended Review |
| 10207142 | Distributed Model | 2024-07-25 | integrated-issuing-34 | 2 | PRO-2205 | Pilot Initiative A |
| 1562847 | Adaptive Cluster | 2025-12-09 | seasonal-issuing-35 | 3 | PRO-2212 | Baseline Model |
| ChIJkzsYUIBt5kcRM6_JHx26ONk | Primary Review A | 2022-05-20 | regional-issuing-36 | 4 | PRO-2219 | Distributed Cluster |

The `policy_instrument_clinical_performance_data_view` links policy instruments to clinical performance data records, showing which data records fall under which policy frameworks. Policy `5844252` is associated with clinical performance data record `1`.

**View `policy_instrument_clinical_performance_data_view`**

```sql
CREATE VIEW policy_instrument_clinical_performance_data_view AS
SELECT a.policy_id, a.policy_title, a.effective_date, a.issuing_authority, b.clinical_performance_data_id AS data_clinical_performance_data_id, b.data_record_id AS data_data_record_id, b.collection_date AS data_collection_date
FROM policy_instruments a JOIN clinical_performance_datas b ON a.clinical_performance_data_id = b.clinical_performance_data_id;
```

| policy_id | policy_title | effective_date | issuing_authority | data_clinical_performance_data_id | data_data_record_id | data_collection_date |
|---|---|---|---|---|---|---|
| 5844252 | Baseline Initiative D | 2023-02-14 | extended-issuing-33 | 1 | 1889764 | 2025-12-17T11:57:00 |
| 10207142 | Distributed Model | 2024-07-25 | integrated-issuing-34 | 2 | 1437601 | 2022-05-01T18:14:00 |
| 1562847 | Adaptive Cluster | 2025-12-09 | seasonal-issuing-35 | 3 | 9736911 | 2023-10-12T01:31:00 |
| ChIJkzsYUIBt5kcRM6_JHx26ONk | Primary Review A | 2022-05-20 | regional-issuing-36 | 4 | 7119777 | 2024-03-23T08:48:00 |

The `policy_instrument_organization_view` connects policy instruments to organisations, revealing which organisations are subject to which policies. Policy `5844252` applies to organisation `790471`, while policy `10207142` applies to organisation `1717`.

**View `policy_instrument_organization_view`**

```sql
CREATE VIEW policy_instrument_organization_view AS
SELECT a.policy_id, a.policy_title, a.effective_date, a.issuing_authority, b.org_id AS organization_org_id, b.org_name AS organization_org_name, b.org_type AS organization_org_type
FROM policy_instruments a JOIN organizations b ON a.organization_org_id = b.org_id;
```

| policy_id | policy_title | effective_date | issuing_authority | organization_org_id | organization_org_name | organization_org_type |
|---|---|---|---|---|---|---|
| 5844252 | Baseline Initiative D | 2023-02-14 | extended-issuing-33 | 790471 | Extended Review | ems_authority |
| 10207142 | Distributed Model | 2024-07-25 | integrated-issuing-34 | 1717 | Pilot Initiative A | hospital |
| 1562847 | Adaptive Cluster | 2025-12-09 | seasonal-issuing-35 | 69437 | Baseline Model | first_responder |
| ChIJkzsYUIBt5kcRM6_JHx26ONk | Primary Review A | 2022-05-20 | regional-issuing-36 | m16 | Distributed Cluster | municipality |

The `analytic_tool_clinical_performance_data_detail_view` joins analytic tools to clinical performance data with detailed information, enabling analysts to understand which tools were used for which data records and under what conditions.

**View `analytic_tool_clinical_performance_data_detail_view`**

```sql
CREATE VIEW analytic_tool_clinical_performance_data_detail_view AS
SELECT a.analytic_tool_id, a.tool_id, a.tool_name, b.clinical_performance_data_id AS data_clinical_performance_data_id, b.data_record_id AS data_data_record_id, b.collection_date AS data_collection_date
FROM analytic_tools a
  JOIN tools_datas j ON j.analytic_tool_id = a.analytic_tool_id
  JOIN clinical_performance_datas b ON b.clinical_performance_data_id = j.clinical_performance_data_id;
```

| analytic_tool_id | tool_id | tool_name | data_clinical_performance_data_id | data_data_record_id | data_collection_date |
|---|---|---|---|---|---|
| 1000 | comi | Composite Model | 1 | 1889764 | 2025-12-17T11:57:00 |
| 1000 | comi | Composite Model | 2 | 1437601 | 2022-05-01T18:14:00 |
| 1001 | 195360 | Compact Cluster A | 2 | 1437601 | 2022-05-01T18:14:00 |
| 1001 | 195360 | Compact Cluster A | 3 | 9736911 | 2023-10-12T01:31:00 |
| 1002 | 3355763 | Legacy Review | 3 | 9736911 | 2023-10-12T01:31:00 |
| 1002 | 3355763 | Legacy Review | 4 | 7119777 | 2024-03-23T08:48:00 |
| 1003 | 8387539 | Regional Initiative | 4 | 7119777 | 2024-03-23T08:48:00 |
| 1003 | 8387539 | Regional Initiative | 1 | 1889764 | 2025-12-17T11:57:00 |

The `analytic_tool_healthcare_professional_view` links analytic tools to healthcare professionals, showing which professionals used which tools in their work.

**View `analytic_tool_healthcare_professional_view`**

```sql
CREATE VIEW analytic_tool_healthcare_professional_view AS
SELECT a.analytic_tool_id, a.tool_id, a.tool_name, a.tool_type, b.healthcare_professional_id AS professional_healthcare_professional_id, b.professional_id AS professional_professional_id, b.full_name AS professional_full_name
FROM analytic_tools a JOIN healthcare_professionals b ON a.healthcare_professional_id = b.healthcare_professional_id;
```

| analytic_tool_id | tool_id | tool_name | tool_type | professional_healthcare_professional_id | professional_professional_id | professional_full_name |
|---|---|---|---|---|---|---|
| 1000 | comi | Composite Model | statistical_package | 100 | 5082965 | Theodore Mcgrath |
| 1001 | 195360 | Compact Cluster A | dashboard | 101 | 2618560 | Account Name |
| 1002 | 3355763 | Legacy Review | machine_learning_model | 102 | 3355767 | Saipan International Airport |
| 1003 | 8387539 | Regional Initiative | spreadsheet | 103 | 3355784 | Norma Fisher |

The `analytic_tool_quality_improvement_program_view` connects analytic tools to quality improvement programs, revealing which tools are employed within which improvement initiatives.

**View `analytic_tool_quality_improvement_program_view`**

```sql
CREATE VIEW analytic_tool_quality_improvement_program_view AS
SELECT a.analytic_tool_id, a.tool_id, a.tool_name, a.tool_type, b.id AS program_id, b.program_identifier AS program_program_identifier, b.program_name AS program_program_name
FROM analytic_tools a JOIN quality_improvement_programs b ON a.quality_improvement_program_id = b.id;
```

| analytic_tool_id | tool_id | tool_name | tool_type | program_id | program_program_identifier | program_program_name |
|---|---|---|---|---|---|---|
| 1000 | comi | Composite Model | statistical_package | 1 | PRO-2198 | Extended Review |
| 1001 | 195360 | Compact Cluster A | dashboard | 2 | PRO-2205 | Pilot Initiative A |
| 1002 | 3355763 | Legacy Review | machine_learning_model | 3 | PRO-2212 | Baseline Model |
| 1003 | 8387539 | Regional Initiative | spreadsheet | 4 | PRO-2219 | Distributed Cluster |

### Synthesis

The relational schema materialises a healthcare quality improvement ontology through seven core entity tables, six associative junction tables, and twenty denormalising views. Foreign keys encode the cardinality-bounded relationships: a program belongs to one organisation and one policy instrument; a data record belongs to one measurement activity and one analytic tool; an activity is conducted by one professional and belongs to one program. The junction tables (`programs_datas`, `activities_datas`, `professionals_activities`, `organizations_programs`, `organizations_professionals`, `tools_datas`) resolve the remaining many-to-many relationships that the core tables cannot express through simple foreign keys. The twenty views reconstruct domain facts by joining these normalised tables, each view answering a specific analytical question—from "which organisation sponsors which program?" to "which policy instrument governs which clinical performance data?"—with concrete rows such as program `PRO-2198` (*Extended Review*) linked to organisation `790471` and policy `5844252` (*Baseline Initiative D*) serving as evidence of the model's fidelity to the domain.