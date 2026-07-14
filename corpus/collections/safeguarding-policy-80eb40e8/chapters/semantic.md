## Ontology-Grounded Relational Modelling in the Safeguarding Domain

The safeguarding domain captures the lifecycle of institutional policies, the procedures they trigger, the harm categories they address, and the incident reports that document real-world events involving students and staff. At its core, the ontology distinguishes six entity types—policies, procedures, harm types, incident reports, students, and staff roles—each materialised as a base table with a primary key and a set of attributes that encode the business vocabulary verbatim. The relationships between these entities are not stored inline; instead, they are expressed through a family of junction tables that enforce many-to-many cardinality, and they are later reassembled by a suite of detail views that join the normalised tables back into domain facts. The following sections walk through the schema from first principles, showing how each entity, relationship, and view maps to the relational model.

**Table `safeguarding_policies`**

| safeguarding_policy_id | policy_identifier | effective_date | issuing_authority | jurisdiction | compliance_status | last_review_date |
|---|---|---|---|---|---|---|
| 1 | POL-2480 | 2023-02-14 | extended-issuing-33 | regional-jurisdic-30 | active | 2022-09-03 |
| 2 | POL-2486 | 2024-07-25 | integrated-issuing-34 | legacy-jurisdic-31 | under_review | 2023-02-14 |
| 3 | POL-2492 | 2025-12-09 | seasonal-issuing-35 | compact-jurisdic-32 | superseded | 2024-07-25 |
| 4 | POL-2498 | 2022-05-20 | regional-issuing-36 | composite-jurisdic-33 | active | 2025-12-09 |

The `safeguarding_policies` table anchors the policy layer of the ontology. Each row represents a distinct institutional policy, identified by the surrogate key `safeguarding_policy_id` and the human-readable `policy_identifier` such as `POL-2480` or `POL-2498`. Temporal governance is captured through `effective_date` and `last_review_date`, while `issuing_authority` (e.g. `extended-issuing-33`) and `jurisdiction` (e.g. `regional-jurisdic-30`) encode the organisational provenance of the policy. The `compliance_status` column constrains each policy to one of three lifecycle states—`active`, `under_review`, or `superseded`—allowing downstream queries to filter for currently enforceable rules. Row 1, for instance, carries `POL-2480` issued by `extended-issuing-33` under `regional-jurisdic-30` with an `active` status, whereas row 3 (`POL-2492`) has already been `superseded`.

**Table `safeguarding_procedures`**

| safeguarding_procedure_id | procedure_code | procedure_name | trigger_condition | response_time_limit | status | assigned_role | incident_report_id |
|---|---|---|---|---|---|---|---|
| 1000 | 3990183 | Integrated Protocol A | legacy-trigger-49 | 9.70 | pending | adaptive-assigned-35 | 1 |
| 1001 | 10782181 | Extended Programme | compact-trigger-50 | 12.40 | active | distributed-assigned-36 | 2 |
| 1002 | account_pymes_663 | Pilot Standard | composite-trigger-51 | 15.10 | archived | baseline-assigned-37 | 3 |
| 1003 | 1c87986a-8fcd-11eb-924d-9cd76263cbd0 | Baseline Framework D | primary-trigger-52 | 17.80 | pending | pilot-assigned-38 | 4 |

Procedures are the actionable artefacts that operationalise policies. The `safeguarding_procedures` table stores each procedure under a unique `safeguarding_procedure_id` alongside a `procedure_code` (ranging from short numeric strings like `3990183` to UUIDs such as `1c87986a-8fcd-11eb-924d-9cd76263cbd0`), a human-readable `procedure_name`, and a `trigger_condition` that specifies when the procedure activates. The `response_time_limit` column (a numeric value in hours, e.g. `9.70` or `17.80`) imposes a cardinality-bounded SLA on response, while `status` tracks the procedural lifecycle (`pending`, `active`, `archived`). The `assigned_role` column points to the staff role responsible for execution, and `incident_report_id` links the procedure to a specific incident report, establishing a direct foreign-key relationship to the `incident_reports` table.

**Table `harm_types`**

| id | harm_code | harm_category | severity_level | description | requires_mandatory_reporting |
|---|---|---|---|---|---|
| 100 | 3001009030150 | compact-harm-68 | 29 | Extended Survey | true |
| 101 | 52ef0c068b8f4ba5b4fcc52c95ef9e5e | composite-harm-69 | 40 | Pilot Corridor A | false |
| 102 | gd_taxc_1211 | primary-harm-70 | 51 | Baseline Series | true |
| 103 | 10966231 | adaptive-harm-71 | 62 | Distributed Assessment | false |

The `harm_types` table enumerates the categories of harm that the safeguarding framework recognises. Each harm type carries a surrogate `id`, a machine-readable `harm_code` (e.g. `3001009030150` or the UUID-like `52ef0c068b8f4ba5b4fcc52c95ef9e5e`), a `harm_category` such as `compact-harm-68` or `composite-harm-69`, and a numeric `severity_level` ranging from 29 to 62 in the sample data. The `description` column provides a human-readable label (e.g. `Extended Survey`, `Pilot Corridor A`), and the boolean `requires_mandatory_reporting` flag determines whether incidents of this type must be escalated to external authorities.

**Table `incident_reports`**

| id | report_id | reported_date | report_status | risk_level | investigator_id | resolution_outcome | role_code |
|---|---|---|---|---|---|---|---|
| 1 | 1202-0008-S | 2025-04-27T03:09:00 | open | 37 | id_23 | seasonal-resoluti-71 | 6969430 |
| 2 | 8189500 | 2022-09-11T10:26:00 | under_investigation | 42 | 4011 | regional-resoluti-72 | lu_tax_code_template_m16 |
| 3 | L355 | 2023-02-22T17:43:00 | closed | 47 | 3158159 | legacy-resoluti-73 | 3158154 |
| 4 | 5844272 | 2024-07-06T00:00:00 | escalated | 52 | 4277008 | compact-resoluti-74 | 39800616 |

Incident reports are the central event entity. The `incident_reports` table records each report with a surrogate `id`, a human-readable `report_id` (e.g. `1202-0008-S`, `8189500`, `L355`), and a `reported_date` timestamp. The `report_status` column constrains the report to one of four states—`open`, `under_investigation`, `closed`, or `escalated`—while `risk_level` (a numeric value from 37 to 52) quantifies the assessed severity. The `investigator_id` identifies the staff member assigned to the case, and `resolution_outcome` (e.g. `seasonal-resoluti-71`) records the final disposition. The `role_code` column links the report to a specific staff role, creating a foreign-key relationship to `staff_roles`.

**Table `students`**

| student_id | enrollment_status | date_of_birth | guardian_contact_id | counselor_id | harm_type_id | role_code |
|---|---|---|---|---|---|---|
| 1 | active | 2025-04-02 | Karen Keller | 8387531 | 100 | 6969430 |
| 2 | withdrawn | 2022-09-13 | Stephanie Lawrence | 7731869 | 101 | lu_tax_code_template_m16 |
| 3 | suspended | 2023-02-24 | Walter Pratt | 2839527 | 102 | 3158154 |
| 4 | active | 2024-07-08 | Julian Brown | 4180947 | 103 | 39800616 |

The `students` table models the learner population. Each student is identified by a `student_id` and carries an `enrollment_status` (`active`, `withdrawn`, or `suspended`), a `date_of_birth`, and a `guardian_contact_id` that stores the guardian's name (e.g. `Karen Keller`, `Stephanie Lawrence`). The `counselor_id` links to the assigned counsellor, while `harm_type_id` and `role_code` establish foreign-key relationships to `harm_types` and `staff_roles` respectively, indicating which harm category and staff role are associated with the student.

**Table `staff_roles`**

| role_code | role_title | certification_level | training_completion_date | access_level | created_at | updated_at |
|---|---|---|---|---|---|---|
| 6969430 | Distributed Standard | seasonal-certific-59 | 2024-11-27 | baseline-access-91 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| lu_tax_code_template_m16 | Adaptive Framework D | regional-certific-60 | 2025-04-11 | pilot-access-92 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3158154 | Primary Protocol | legacy-certific-61 | 2022-09-22 | extended-access-93 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 39800616 | Composite Programme | compact-certific-62 | 2023-02-06 | integrated-access-94 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Staff roles define the organisational positions within the safeguarding framework. The `staff_roles` table stores each role under a `role_code` primary key (e.g. `6969430`, `lu_tax_code_template_m16`), a `role_title` such as `Distributed Standard` or `Adaptive Framework D`, and a `certification_level` that encodes the required qualification tier. The `training_completion_date` records when the role holder completed mandatory training, while `access_level` (e.g. `baseline-access-91`, `pilot-access-92`) constrains system permissions. The `created_at` and `updated_at` timestamps provide an audit trail for role metadata.

With the six base entities established, the schema moves to relationship modelling. The safeguarding domain is inherently polyadic: a single policy may govern multiple procedures, a procedure may apply to multiple roles, and an incident report may involve multiple students and harm types. These many-to-many relationships are materialised through junction tables, each of which carries a composite foreign key that references the two entities it connects.

**Table `policies_procedures`**

| safeguarding_policy_id | safeguarding_procedure_id |
|---|---|
| 1 | 1000 |
| 1 | 1001 |
| 2 | 1001 |
| 2 | 1002 |
| 3 | 1002 |
| 3 | 1003 |
| 4 | 1003 |
| 4 | 1000 |

The `policies_procedures` junction table links `safeguarding_policies` to `safeguarding_procedures`, capturing which procedures are governed by which policies. Each row represents a single policy-procedure pairing, and the composite key enforces referential integrity to both parent tables.

**Table `procedures_roles`**

| safeguarding_procedure_id | role_code |
|---|---|
| 1000 | 6969430 |
| 1000 | lu_tax_code_template_m16 |
| 1001 | lu_tax_code_template_m16 |
| 1001 | 3158154 |
| 1002 | 3158154 |
| 1002 | 39800616 |
| 1003 | 39800616 |
| 1003 | 6969430 |

The `procedures_roles` table connects `safeguarding_procedures` to `staff_roles`, indicating which roles are responsible for executing which procedures. This relationship is critical for role-based access control and workload assignment.

**Table `procedures_types`**

| safeguarding_procedure_id | harm_type_id |
|---|---|
| 1000 | 100 |
| 1000 | 101 |
| 1001 | 101 |
| 1001 | 102 |
| 1002 | 102 |
| 1002 | 103 |
| 1003 | 103 |
| 1003 | 100 |

The `procedures_types` junction links `safeguarding_procedures` to `harm_types`, specifying which harm categories each procedure addresses. A procedure may cover multiple harm types, and a harm type may be addressed by multiple procedures.

**Table `types_reports`**

| harm_type_id | incident_report_id |
|---|---|
| 100 | 1 |
| 100 | 2 |
| 101 | 2 |
| 101 | 3 |
| 102 | 3 |
| 102 | 4 |
| 103 | 4 |
| 103 | 1 |

The `types_reports` table connects `harm_types` to `incident_reports`, establishing which harm categories are associated with which incident reports. This relationship enables impact analysis by harm type.

**Table `types_students`**

| harm_type_id | student_id |
|---|---|
| 100 | 1 |
| 100 | 2 |
| 101 | 2 |
| 101 | 3 |
| 102 | 3 |
| 102 | 4 |
| 103 | 4 |
| 103 | 1 |

The `types_students` junction links `harm_types` to `students`, recording which harm categories are relevant to which students. This supports risk profiling and targeted interventions.

**Table `reports_students`**

| incident_report_id | student_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

The `reports_students` table connects `incident_reports` to `students`, capturing which students are involved in which incident reports. A single incident may involve multiple students, and a student may be involved in multiple incidents.

**Table `reports_types`**

| incident_report_id | harm_type_id |
|---|---|
| 1 | 100 |
| 1 | 101 |
| 2 | 101 |
| 2 | 102 |
| 3 | 102 |
| 3 | 103 |
| 4 | 103 |
| 4 | 100 |

The `reports_types` junction links `incident_reports` to `harm_types`, providing an alternative path from incidents to their associated harm categories. This redundancy supports flexible query patterns.

**Table `students_reports`**

| student_id | incident_report_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

The `students_reports` table mirrors the `reports_students` relationship, linking `students` to `incident_reports`. The dual representation allows queries to start from either entity without requiring a join direction convention.

**Table `roles_procedures`**

| role_code | safeguarding_procedure_id |
|---|---|
| 6969430 | 1000 |
| 6969430 | 1001 |
| lu_tax_code_template_m16 | 1001 |
| lu_tax_code_template_m16 | 1002 |
| 3158154 | 1002 |
| 3158154 | 1003 |
| 39800616 | 1003 |
| 39800616 | 1000 |

The `roles_procedures` junction connects `staff_roles` to `safeguarding_procedures`, providing an alternative path from roles to their associated procedures. This complements the `procedures_roles` table and supports role-centric queries.

**Table `roles_reports`**

| role_code | incident_report_id |
|---|---|
| 6969430 | 1 |
| 6969430 | 2 |
| lu_tax_code_template_m16 | 2 |
| lu_tax_code_template_m16 | 3 |
| 3158154 | 3 |
| 3158154 | 4 |
| 39800616 | 4 |
| 39800616 | 1 |

The `roles_reports` table links `staff_roles` to `incident_reports`, indicating which staff roles are associated with which incident reports. This relationship supports workload distribution and accountability tracking.

**Table `roles_students`**

| role_code | student_id |
|---|---|
| 6969430 | 1 |
| 6969430 | 2 |
| lu_tax_code_template_m16 | 2 |
| lu_tax_code_template_m16 | 3 |
| 3158154 | 3 |
| 3158154 | 4 |
| 39800616 | 4 |
| 39800616 | 1 |

The `roles_students` junction connects `staff_roles` to `students`, capturing which staff roles are associated with which students. This relationship is essential for determining which staff members are responsible for which learners.

The normalised base tables and junction tables form a fully decomposed schema that eliminates redundancy and enforces referential integrity. However, analysts and operators need to query the data in a denormalised, fact-oriented form. This is where the detail views come in. Each view joins a specific combination of base tables and junction tables to reconstruct a domain fact, presenting the result as a single virtual table that can be queried directly.

**View `safeguarding_policy_safeguarding_procedure_detail_view`**

```sql
CREATE VIEW safeguarding_policy_safeguarding_procedure_detail_view AS
SELECT a.safeguarding_policy_id, a.policy_identifier, a.effective_date, b.safeguarding_procedure_id AS procedure_safeguarding_procedure_id, b.procedure_code AS procedure_procedure_code, b.procedure_name AS procedure_procedure_name
FROM safeguarding_policies a
  JOIN policies_procedures j ON j.safeguarding_policy_id = a.safeguarding_policy_id
  JOIN safeguarding_procedures b ON b.safeguarding_procedure_id = j.safeguarding_procedure_id;
```

| safeguarding_policy_id | policy_identifier | effective_date | procedure_safeguarding_procedure_id | procedure_procedure_code | procedure_procedure_name |
|---|---|---|---|---|---|
| 1 | POL-2480 | 2023-02-14 | 1000 | 3990183 | Integrated Protocol A |
| 1 | POL-2480 | 2023-02-14 | 1001 | 10782181 | Extended Programme |
| 2 | POL-2486 | 2024-07-25 | 1001 | 10782181 | Extended Programme |
| 2 | POL-2486 | 2024-07-25 | 1002 | account_pymes_663 | Pilot Standard |
| 3 | POL-2492 | 2025-12-09 | 1002 | account_pymes_663 | Pilot Standard |
| 3 | POL-2492 | 2025-12-09 | 1003 | 1c87986a-8fcd-11eb-924d-9cd76263cbd0 | Baseline Framework D |
| 4 | POL-2498 | 2022-05-20 | 1003 | 1c87986a-8fcd-11eb-924d-9cd76263cbd0 | Baseline Framework D |
| 4 | POL-2498 | 2022-05-20 | 1000 | 3990183 | Integrated Protocol A |

The `safeguarding_policy_safeguarding_procedure_detail_view` joins `safeguarding_policies` with `safeguarding_procedures` through the `policies_procedures` junction, answering the question: "Which procedures are governed by which policies?" A row in this view might show `POL-2480` paired with procedure code `3990183` (Integrated Protocol A), revealing the direct governance relationship between a specific policy and its operational procedures.

**View `safeguarding_procedure_staff_role_detail_view`**

```sql
CREATE VIEW safeguarding_procedure_staff_role_detail_view AS
SELECT a.safeguarding_procedure_id, a.procedure_code, a.procedure_name, b.role_code AS role_role_code, b.role_title AS role_role_title, b.certification_level AS role_certification_level
FROM safeguarding_procedures a
  JOIN procedures_roles j ON j.safeguarding_procedure_id = a.safeguarding_procedure_id
  JOIN staff_roles b ON b.role_code = j.role_code;
```

| safeguarding_procedure_id | procedure_code | procedure_name | role_role_code | role_role_title | role_certification_level |
|---|---|---|---|---|---|
| 1000 | 3990183 | Integrated Protocol A | 6969430 | Distributed Standard | seasonal-certific-59 |
| 1000 | 3990183 | Integrated Protocol A | lu_tax_code_template_m16 | Adaptive Framework D | regional-certific-60 |
| 1001 | 10782181 | Extended Programme | lu_tax_code_template_m16 | Adaptive Framework D | regional-certific-60 |
| 1001 | 10782181 | Extended Programme | 3158154 | Primary Protocol | legacy-certific-61 |
| 1002 | account_pymes_663 | Pilot Standard | 3158154 | Primary Protocol | legacy-certific-61 |
| 1002 | account_pymes_663 | Pilot Standard | 39800616 | Composite Programme | compact-certific-62 |
| 1003 | 1c87986a-8fcd-11eb-924d-9cd76263cbd0 | Baseline Framework D | 39800616 | Composite Programme | compact-certific-62 |
| 1003 | 1c87986a-8fcd-11eb-924d-9cd76263cbd0 | Baseline Framework D | 6969430 | Distributed Standard | seasonal-certific-59 |

The `safeguarding_procedure_staff_role_detail_view` joins `safeguarding_procedures` with `staff_roles` via the `procedures_roles` junction, answering: "Which staff roles are responsible for executing which procedures?" A representative row might pair procedure `10782181` (Extended Programme) with role `lu_tax_code_template_m16` (Adaptive Framework D), showing the assignment of procedural responsibility to a specific organisational position.

**View `safeguarding_procedure_harm_type_detail_view`**

```sql
CREATE VIEW safeguarding_procedure_harm_type_detail_view AS
SELECT a.safeguarding_procedure_id, a.procedure_code, a.procedure_name, b.id AS type_id, b.harm_code AS type_harm_code, b.harm_category AS type_harm_category
FROM safeguarding_procedures a
  JOIN procedures_types j ON j.safeguarding_procedure_id = a.safeguarding_procedure_id
  JOIN harm_types b ON b.id = j.harm_type_id;
```

| safeguarding_procedure_id | procedure_code | procedure_name | type_id | type_harm_code | type_harm_category |
|---|---|---|---|---|---|
| 1000 | 3990183 | Integrated Protocol A | 100 | 3001009030150 | compact-harm-68 |
| 1000 | 3990183 | Integrated Protocol A | 101 | 52ef0c068b8f4ba5b4fcc52c95ef9e5e | composite-harm-69 |
| 1001 | 10782181 | Extended Programme | 101 | 52ef0c068b8f4ba5b4fcc52c95ef9e5e | composite-harm-69 |
| 1001 | 10782181 | Extended Programme | 102 | gd_taxc_1211 | primary-harm-70 |
| 1002 | account_pymes_663 | Pilot Standard | 102 | gd_taxc_1211 | primary-harm-70 |
| 1002 | account_pymes_663 | Pilot Standard | 103 | 10966231 | adaptive-harm-71 |
| 1003 | 1c87986a-8fcd-11eb-924d-9cd76263cbd0 | Baseline Framework D | 103 | 10966231 | adaptive-harm-71 |
| 1003 | 1c87986a-8fcd-11eb-924d-9cd76263cbd0 | Baseline Framework D | 100 | 3001009030150 | compact-harm-68 |

The `safeguarding_procedure_harm_type_detail_view` joins `safeguarding_procedures` with `harm_types` through the `procedures_types` junction, answering: "Which harm categories does each procedure address?" A row might show procedure `account_pymes_663` (Pilot Standard) linked to harm type `3001009030150` (compact-harm-68), revealing the scope of the procedure's applicability.

**View `safeguarding_procedure_incident_report_view`**

```sql
CREATE VIEW safeguarding_procedure_incident_report_view AS
SELECT a.safeguarding_procedure_id, a.procedure_code, a.procedure_name, a.trigger_condition, b.id AS report_id, b.report_id AS report_report_id, b.reported_date AS report_reported_date
FROM safeguarding_procedures a JOIN incident_reports b ON a.incident_report_id = b.id;
```

| safeguarding_procedure_id | procedure_code | procedure_name | trigger_condition | report_id | report_report_id | report_reported_date |
|---|---|---|---|---|---|---|
| 1000 | 3990183 | Integrated Protocol A | legacy-trigger-49 | 1 | 1202-0008-S | 2025-04-27T03:09:00 |
| 1001 | 10782181 | Extended Programme | compact-trigger-50 | 2 | 8189500 | 2022-09-11T10:26:00 |
| 1002 | account_pymes_663 | Pilot Standard | composite-trigger-51 | 3 | L355 | 2023-02-22T17:43:00 |
| 1003 | 1c87986a-8fcd-11eb-924d-9cd76263cbd0 | Baseline Framework D | primary-trigger-52 | 4 | 5844272 | 2024-07-06T00:00:00 |

The `safeguarding_procedure_incident_report_view` joins `safeguarding_procedures` directly with `incident_reports` on the `incident_report_id` foreign key, answering: "Which procedures are triggered by which incident reports?" A row might show procedure `1c87986a-8fcd-11eb-924d-9cd76263cbd0` (Baseline Framework D) associated with incident report `5844272`, providing a direct procedural response trace for each incident.

**View `harm_type_incident_report_detail_view`**

```sql
CREATE VIEW harm_type_incident_report_detail_view AS
SELECT a.id, a.harm_code, a.harm_category, b.id AS report_id, b.report_id AS report_report_id, b.reported_date AS report_reported_date
FROM harm_types a
  JOIN types_reports j ON j.harm_type_id = a.id
  JOIN incident_reports b ON b.id = j.incident_report_id;
```

| id | harm_code | harm_category | report_id | report_report_id | report_reported_date |
|---|---|---|---|---|---|
| 100 | 3001009030150 | compact-harm-68 | 1 | 1202-0008-S | 2025-04-27T03:09:00 |
| 100 | 3001009030150 | compact-harm-68 | 2 | 8189500 | 2022-09-11T10:26:00 |
| 101 | 52ef0c068b8f4ba5b4fcc52c95ef9e5e | composite-harm-69 | 2 | 8189500 | 2022-09-11T10:26:00 |
| 101 | 52ef0c068b8f4ba5b4fcc52c95ef9e5e | composite-harm-69 | 3 | L355 | 2023-02-22T17:43:00 |
| 102 | gd_taxc_1211 | primary-harm-70 | 3 | L355 | 2023-02-22T17:43:00 |
| 102 | gd_taxc_1211 | primary-harm-70 | 4 | 5844272 | 2024-07-06T00:00:00 |
| 103 | 10966231 | adaptive-harm-71 | 4 | 5844272 | 2024-07-06T00:00:00 |
| 103 | 10966231 | adaptive-harm-71 | 1 | 1202-0008-S | 2025-04-27T03:09:00 |

The `harm_type_incident_report_detail_view` joins `harm_types` with `incident_reports` through the `types_reports` junction, answering: "Which harm categories are associated with which incident reports?" A row might pair harm type `52ef0c068b8f4ba5b4fcc52c95ef9e5e` (composite-harm-69) with incident report `8189500`, enabling impact analysis by harm category.

**View `harm_type_student_detail_view`**

```sql
CREATE VIEW harm_type_student_detail_view AS
SELECT a.id, a.harm_code, a.harm_category, b.student_id AS student_student_id, b.enrollment_status AS student_enrollment_status, b.date_of_birth AS student_date_of_birth
FROM harm_types a
  JOIN types_students j ON j.harm_type_id = a.id
  JOIN students b ON b.student_id = j.student_id;
```

| id | harm_code | harm_category | student_student_id | student_enrollment_status | student_date_of_birth |
|---|---|---|---|---|---|
| 100 | 3001009030150 | compact-harm-68 | 1 | active | 2025-04-02 |
| 100 | 3001009030150 | compact-harm-68 | 2 | withdrawn | 2022-09-13 |
| 101 | 52ef0c068b8f4ba5b4fcc52c95ef9e5e | composite-harm-69 | 2 | withdrawn | 2022-09-13 |
| 101 | 52ef0c068b8f4ba5b4fcc52c95ef9e5e | composite-harm-69 | 3 | suspended | 2023-02-24 |
| 102 | gd_taxc_1211 | primary-harm-70 | 3 | suspended | 2023-02-24 |
| 102 | gd_taxc_1211 | primary-harm-70 | 4 | active | 2024-07-08 |
| 103 | 10966231 | adaptive-harm-71 | 4 | active | 2024-07-08 |
| 103 | 10966231 | adaptive-harm-71 | 1 | active | 2025-04-02 |

The `harm_type_student_detail_view` joins `harm_types` with `students` via the `types_students` junction, answering: "Which harm categories are relevant to which students?" A row might show harm type `gd_taxc_1211` (primary-harm-70) associated with student `3` (Walter Pratt), supporting targeted risk profiling.

**View `incident_report_student_detail_view`**

```sql
CREATE VIEW incident_report_student_detail_view AS
SELECT a.id, a.report_id, a.reported_date, b.student_id AS student_student_id, b.enrollment_status AS student_enrollment_status, b.date_of_birth AS student_date_of_birth
FROM incident_reports a
  JOIN reports_students j ON j.incident_report_id = a.id
  JOIN students b ON b.student_id = j.student_id;
```

| id | report_id | reported_date | student_student_id | student_enrollment_status | student_date_of_birth |
|---|---|---|---|---|---|
| 1 | 1202-0008-S | 2025-04-27T03:09:00 | 1 | active | 2025-04-02 |
| 1 | 1202-0008-S | 2025-04-27T03:09:00 | 2 | withdrawn | 2022-09-13 |
| 2 | 8189500 | 2022-09-11T10:26:00 | 2 | withdrawn | 2022-09-13 |
| 2 | 8189500 | 2022-09-11T10:26:00 | 3 | suspended | 2023-02-24 |
| 3 | L355 | 2023-02-22T17:43:00 | 3 | suspended | 2023-02-24 |
| 3 | L355 | 2023-02-22T17:43:00 | 4 | active | 2024-07-08 |
| 4 | 5844272 | 2024-07-06T00:00:00 | 4 | active | 2024-07-08 |
| 4 | 5844272 | 2024-07-06T00:00:00 | 1 | active | 2025-04-02 |

The `incident_report_student_detail_view` joins `incident_reports` with `students` through the `reports_students` junction, answering: "Which students are involved in which incident reports?" A row might pair incident report `1202-0008-S` with student `1` (Karen Keller), providing a direct victim-incident linkage.

**View `incident_report_harm_type_detail_view`**

```sql
CREATE VIEW incident_report_harm_type_detail_view AS
SELECT a.id, a.report_id, a.reported_date, b.id AS type_id, b.harm_code AS type_harm_code, b.harm_category AS type_harm_category
FROM incident_reports a
  JOIN reports_types j ON j.incident_report_id = a.id
  JOIN harm_types b ON b.id = j.harm_type_id;
```

| id | report_id | reported_date | type_id | type_harm_code | type_harm_category |
|---|---|---|---|---|---|
| 1 | 1202-0008-S | 2025-04-27T03:09:00 | 100 | 3001009030150 | compact-harm-68 |
| 1 | 1202-0008-S | 2025-04-27T03:09:00 | 101 | 52ef0c068b8f4ba5b4fcc52c95ef9e5e | composite-harm-69 |
| 2 | 8189500 | 2022-09-11T10:26:00 | 101 | 52ef0c068b8f4ba5b4fcc52c95ef9e5e | composite-harm-69 |
| 2 | 8189500 | 2022-09-11T10:26:00 | 102 | gd_taxc_1211 | primary-harm-70 |
| 3 | L355 | 2023-02-22T17:43:00 | 102 | gd_taxc_1211 | primary-harm-70 |
| 3 | L355 | 2023-02-22T17:43:00 | 103 | 10966231 | adaptive-harm-71 |
| 4 | 5844272 | 2024-07-06T00:00:00 | 103 | 10966231 | adaptive-harm-71 |
| 4 | 5844272 | 2024-07-06T00:00:00 | 100 | 3001009030150 | compact-harm-68 |

The `incident_report_harm_type_detail_view` joins `incident_reports` with `harm_types` via the `reports_types` junction, answering: "Which harm categories are associated with which incident reports?" This view provides an alternative path to the same fact as `harm_type_incident_report_detail_view`, supporting queries that start from the incident perspective.

**View `incident_report_staff_role_view`**

```sql
CREATE VIEW incident_report_staff_role_view AS
SELECT a.id, a.report_id, a.reported_date, a.report_status, b.role_code AS role_role_code, b.role_title AS role_role_title, b.certification_level AS role_certification_level
FROM incident_reports a JOIN staff_roles b ON a.role_code = b.role_code;
```

| id | report_id | reported_date | report_status | role_role_code | role_role_title | role_certification_level |
|---|---|---|---|---|---|---|
| 1 | 1202-0008-S | 2025-04-27T03:09:00 | open | 6969430 | Distributed Standard | seasonal-certific-59 |
| 2 | 8189500 | 2022-09-11T10:26:00 | under_investigation | lu_tax_code_template_m16 | Adaptive Framework D | regional-certific-60 |
| 3 | L355 | 2023-02-22T17:43:00 | closed | 3158154 | Primary Protocol | legacy-certific-61 |
| 4 | 5844272 | 2024-07-06T00:00:00 | escalated | 39800616 | Composite Programme | compact-certific-62 |

The `incident_report_staff_role_view` joins `incident_reports` with `staff_roles` through the `roles_reports` junction, answering: "Which staff roles are associated with which incident reports?" A row might link incident report `L355` with role `3158154` (Primary Protocol), showing the organisational accountability for each incident.

**View `student_incident_report_detail_view`**

```sql
CREATE VIEW student_incident_report_detail_view AS
SELECT a.student_id, a.enrollment_status, a.date_of_birth, b.id AS report_id, b.report_id AS report_report_id, b.reported_date AS report_reported_date
FROM students a
  JOIN students_reports j ON j.student_id = a.student_id
  JOIN incident_reports b ON b.id = j.incident_report_id;
```

| student_id | enrollment_status | date_of_birth | report_id | report_report_id | report_reported_date |
|---|---|---|---|---|---|
| 1 | active | 2025-04-02 | 1 | 1202-0008-S | 2025-04-27T03:09:00 |
| 1 | active | 2025-04-02 | 2 | 8189500 | 2022-09-11T10:26:00 |
| 2 | withdrawn | 2022-09-13 | 2 | 8189500 | 2022-09-11T10:26:00 |
| 2 | withdrawn | 2022-09-13 | 3 | L355 | 2023-02-22T17:43:00 |
| 3 | suspended | 2023-02-24 | 3 | L355 | 2023-02-22T17:43:00 |
| 3 | suspended | 2023-02-24 | 4 | 5844272 | 2024-07-06T00:00:00 |
| 4 | active | 2024-07-08 | 4 | 5844272 | 2024-07-06T00:00:00 |
| 4 | active | 2024-07-08 | 1 | 1202-0008-S | 2025-04-27T03:09:00 |

The `student_incident_report_detail_view` joins `students` with `incident_reports` via the `students_reports` junction, answering: "Which incident reports involve which students?" This view mirrors `incident_report_student_detail_view` but starts from the student perspective, supporting queries that enumerate a student's incident history.

**View `student_harm_type_view`**

```sql
CREATE VIEW student_harm_type_view AS
SELECT a.student_id, a.enrollment_status, a.date_of_birth, a.guardian_contact_id, b.id AS type_id, b.harm_code AS type_harm_code, b.harm_category AS type_harm_category
FROM students a JOIN harm_types b ON a.harm_type_id = b.id;
```

| student_id | enrollment_status | date_of_birth | guardian_contact_id | type_id | type_harm_code | type_harm_category |
|---|---|---|---|---|---|---|
| 1 | active | 2025-04-02 | Karen Keller | 100 | 3001009030150 | compact-harm-68 |
| 2 | withdrawn | 2022-09-13 | Stephanie Lawrence | 101 | 52ef0c068b8f4ba5b4fcc52c95ef9e5e | composite-harm-69 |
| 3 | suspended | 2023-02-24 | Walter Pratt | 102 | gd_taxc_1211 | primary-harm-70 |
| 4 | active | 2024-07-08 | Julian Brown | 103 | 10966231 | adaptive-harm-71 |

The `student_harm_type_view` joins `students` with `harm_types` through the `types_students` junction, answering: "Which harm categories are associated with which students?" A row might show student `4` (Julian Brown) linked to harm type `10966231` (adaptive-harm-71), enabling student-level risk assessment.

**View `student_staff_role_view`**

```sql
CREATE VIEW student_staff_role_view AS
SELECT a.student_id, a.enrollment_status, a.date_of_birth, a.guardian_contact_id, b.role_code AS role_role_code, b.role_title AS role_role_title, b.certification_level AS role_certification_level
FROM students a JOIN staff_roles b ON a.role_code = b.role_code;
```

| student_id | enrollment_status | date_of_birth | guardian_contact_id | role_role_code | role_role_title | role_certification_level |
|---|---|---|---|---|---|---|
| 1 | active | 2025-04-02 | Karen Keller | 6969430 | Distributed Standard | seasonal-certific-59 |
| 2 | withdrawn | 2022-09-13 | Stephanie Lawrence | lu_tax_code_template_m16 | Adaptive Framework D | regional-certific-60 |
| 3 | suspended | 2023-02-24 | Walter Pratt | 3158154 | Primary Protocol | legacy-certific-61 |
| 4 | active | 2024-07-08 | Julian Brown | 39800616 | Composite Programme | compact-certific-62 |

The `student_staff_role_view` joins `students` with `staff_roles` via the `roles_students` junction, answering: "Which staff roles are associated with which students?" A row might pair student `2` (Stephanie Lawrence) with role `lu_tax_code_template_m16` (Adaptive Framework D), showing the staff-student assignment relationship.

**View `staff_role_safeguarding_procedure_detail_view`**

```sql
CREATE VIEW staff_role_safeguarding_procedure_detail_view AS
SELECT a.role_code, a.role_title, a.certification_level, b.safeguarding_procedure_id AS procedure_safeguarding_procedure_id, b.procedure_code AS procedure_procedure_code, b.procedure_name AS procedure_procedure_name
FROM staff_roles a
  JOIN roles_procedures j ON j.role_code = a.role_code
  JOIN safeguarding_procedures b ON b.safeguarding_procedure_id = j.safeguarding_procedure_id;
```

| role_code | role_title | certification_level | procedure_safeguarding_procedure_id | procedure_procedure_code | procedure_procedure_name |
|---|---|---|---|---|---|
| 6969430 | Distributed Standard | seasonal-certific-59 | 1000 | 3990183 | Integrated Protocol A |
| 6969430 | Distributed Standard | seasonal-certific-59 | 1001 | 10782181 | Extended Programme |
| lu_tax_code_template_m16 | Adaptive Framework D | regional-certific-60 | 1001 | 10782181 | Extended Programme |
| lu_tax_code_template_m16 | Adaptive Framework D | regional-certific-60 | 1002 | account_pymes_663 | Pilot Standard |
| 3158154 | Primary Protocol | legacy-certific-61 | 1002 | account_pymes_663 | Pilot Standard |
| 3158154 | Primary Protocol | legacy-certific-61 | 1003 | 1c87986a-8fcd-11eb-924d-9cd76263cbd0 | Baseline Framework D |
| 39800616 | Composite Programme | compact-certific-62 | 1003 | 1c87986a-8fcd-11eb-924d-9cd76263cbd0 | Baseline Framework D |
| 39800616 | Composite Programme | compact-certific-62 | 1000 | 3990183 | Integrated Protocol A |

The `staff_role_safeguarding_procedure_detail_view` joins `staff_roles` with `safeguarding_procedures` through the `roles_procedures` junction, answering: "Which procedures are assigned to which staff roles?" A row might link role `6969430` (Distributed Standard) with procedure `3990183` (Integrated Protocol A), providing a role-centric view of procedural responsibilities.

**View `staff_role_incident_report_detail_view`**

```sql
CREATE VIEW staff_role_incident_report_detail_view AS
SELECT a.role_code, a.role_title, a.certification_level, b.id AS report_id, b.report_id AS report_report_id, b.reported_date AS report_reported_date
FROM staff_roles a
  JOIN roles_reports j ON j.role_code = a.role_code
  JOIN incident_reports b ON b.id = j.incident_report_id;
```

| role_code | role_title | certification_level | report_id | report_report_id | report_reported_date |
|---|---|---|---|---|---|
| 6969430 | Distributed Standard | seasonal-certific-59 | 1 | 1202-0008-S | 2025-04-27T03:09:00 |
| 6969430 | Distributed Standard | seasonal-certific-59 | 2 | 8189500 | 2022-09-11T10:26:00 |
| lu_tax_code_template_m16 | Adaptive Framework D | regional-certific-60 | 2 | 8189500 | 2022-09-11T10:26:00 |
| lu_tax_code_template_m16 | Adaptive Framework D | regional-certific-60 | 3 | L355 | 2023-02-22T17:43:00 |
| 3158154 | Primary Protocol | legacy-certific-61 | 3 | L355 | 2023-02-22T17:43:00 |
| 3158154 | Primary Protocol | legacy-certific-61 | 4 | 5844272 | 2024-07-06T00:00:00 |
| 39800616 | Composite Programme | compact-certific-62 | 4 | 5844272 | 2024-07-06T00:00:00 |
| 39800616 | Composite Programme | compact-certific-62 | 1 | 1202-0008-S | 2025-04-27T03:09:00 |

The `staff_role_incident_report_detail_view` joins `staff_roles` with `incident_reports` via the `roles_reports` junction, answering: "Which incident reports are associated with which staff roles?" A row might pair role `39800616` (Composite Programme) with incident report `5844272`, supporting workload analysis by staff role.

**View `staff_role_student_detail_view`**

```sql
CREATE VIEW staff_role_student_detail_view AS
SELECT a.role_code, a.role_title, a.certification_level, b.student_id AS student_student_id, b.enrollment_status AS student_enrollment_status, b.date_of_birth AS student_date_of_birth
FROM staff_roles a
  JOIN roles_students j ON j.role_code = a.role_code
  JOIN students b ON b.student_id = j.student_id;
```

| role_code | role_title | certification_level | student_student_id | student_enrollment_status | student_date_of_birth |
|---|---|---|---|---|---|
| 6969430 | Distributed Standard | seasonal-certific-59 | 1 | active | 2025-04-02 |
| 6969430 | Distributed Standard | seasonal-certific-59 | 2 | withdrawn | 2022-09-13 |
| lu_tax_code_template_m16 | Adaptive Framework D | regional-certific-60 | 2 | withdrawn | 2022-09-13 |
| lu_tax_code_template_m16 | Adaptive Framework D | regional-certific-60 | 3 | suspended | 2023-02-24 |
| 3158154 | Primary Protocol | legacy-certific-61 | 3 | suspended | 2023-02-24 |
| 3158154 | Primary Protocol | legacy-certific-61 | 4 | active | 2024-07-08 |
| 39800616 | Composite Programme | compact-certific-62 | 4 | active | 2024-07-08 |
| 39800616 | Composite Programme | compact-certific-62 | 1 | active | 2025-04-02 |

The `staff_role_student_detail_view` joins `staff_roles` with `students` through the `roles_students` junction, answering: "Which students are assigned to which staff roles?" A row might link role `6969430` (Distributed Standard) with student `1` (Karen Keller), providing a staff-centric view of student assignments.

The schema as a whole embodies a clean separation between entity storage and relationship modelling. Base tables store only entity attributes, while junction tables encode the many-to-many relationships that the ontology requires. Detail views then reassemble these pieces into domain facts that analysts can query without needing to understand the underlying normalisation. This architecture supports both data integrity (enforced by foreign keys in the base and junction tables) and query convenience (provided by the pre-joined views). The safeguarding domain, with its complex web of policies, procedures, harm types, incidents, students, and staff roles, is thus faithfully represented in a relational form that is both rigorous and accessible.