# Safeguarding Operations: Policies, Procedures, and Incident Management

Safeguarding in educational and institutional settings demands a structured approach to policy governance, procedural response, and incident documentation. This chapter describes the operational architecture that connects institutional policies to frontline procedures, classifies types of harm, tracks incident reports, and maintains the relationships between students, staff roles, and the procedural responses they trigger. Every element—from the highest-level policy directive to the granular assignment of a staff member to a specific procedure—exists within a coherent framework designed to ensure accountability, timeliness, and appropriate response.

## Policy Governance and Procedural Framework

At the foundation of any safeguarding system lies a set of formal policies that establish the rules, standards, and compliance expectations. These policies carry unique identifiers, effective dates, and jurisdictional scope, and they are maintained through a lifecycle of review and status transitions.

**Table `safeguarding_policies`**

| safeguarding_policy_id | policy_identifier | effective_date | issuing_authority | jurisdiction | compliance_status | last_review_date |
|---|---|---|---|---|---|---|
| 1 | POL-2480 | 2023-02-14 | extended-issuing-33 | regional-jurisdic-30 | active | 2022-09-03 |
| 2 | POL-2486 | 2024-07-25 | integrated-issuing-34 | legacy-jurisdic-31 | under_review | 2023-02-14 |
| 3 | POL-2492 | 2025-12-09 | seasonal-issuing-35 | compact-jurisdic-32 | superseded | 2024-07-25 |
| 4 | POL-2498 | 2022-05-20 | regional-issuing-36 | composite-jurisdic-33 | active | 2025-12-09 |

The policy register contains four active entries, each issued by a distinct authority and operating under a specific jurisdiction. Policy POL-2480, issued by extended-issuing-33 under regional-jurisdic-30, has been active since February 2023 and was last reviewed in September 2022. Policy POL-2486, from integrated-issuing-34, carries a legacy-jurisdic-31 designation and is currently under_review, indicating it is undergoing revision. Policy POL-2492, issued by seasonal-issuing-35, has been superseded as of December 2025, while POL-2498 from regional-issuing-36 remains active under composite-jurisdic-33. The compliance_status field—active, under_review, or superseded—provides an immediate signal of each policy's current standing within the institutional governance structure.

Policies do not exist in isolation; they are linked to specific safeguarding procedures that operationalize their requirements. The linkage between policies and procedures ensures that every procedural action can be traced back to its governing authority.

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

This association table establishes which procedures fall under which policy umbrella, creating a clear chain of accountability. When an incident occurs, investigators can determine not only which procedure was triggered but also which policy mandates its execution.

The procedures themselves define the operational response to safeguarding events. Each procedure carries a code, a descriptive name, a trigger condition that initiates it, a response time limit measured in hours, and a current status indicating whether it is active, pending, archived, or otherwise.

**Table `safeguarding_procedures`**

| safeguarding_procedure_id | procedure_code | procedure_name | trigger_condition | response_time_limit | status | assigned_role | incident_report_id |
|---|---|---|---|---|---|---|---|
| 1000 | 3990183 | Integrated Protocol A | legacy-trigger-49 | 9.70 | pending | adaptive-assigned-35 | 1 |
| 1001 | 10782181 | Extended Programme | compact-trigger-50 | 12.40 | active | distributed-assigned-36 | 2 |
| 1002 | account_pymes_663 | Pilot Standard | composite-trigger-51 | 15.10 | archived | baseline-assigned-37 | 3 |
| 1003 | 1c87986a-8fcd-11eb-924d-9cd76263cbd0 | Baseline Framework D | primary-trigger-52 | 17.80 | pending | pilot-assigned-38 | 4 |

Procedure 3990183, titled Integrated Protocol A, is triggered by legacy-trigger-49 and requires a response within 9.70 hours. It is currently in pending status and assigned to the adaptive-assigned-35 role. Extended Programme (code 10782181) responds to compact-trigger-50 with a 12.40-hour response window and is active, assigned to distributed-assigned-36. Pilot Standard (account_pymes_663) is archived and associated with composite-trigger-51, while Baseline Framework D (1c87986a-8fcd-11eb-924d-9cd76263cbd0) is pending, triggered by primary-trigger-52, and assigned to pilot-assigned-38. The incident_report_id column on each procedure links the procedural response directly to the incident that triggered it, creating an auditable trail from event to action.

Procedures are further connected to staff roles, ensuring that the right personnel are assigned to the right response actions.

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

This mapping ensures that every procedure has a designated role responsible for its execution. The procedures_roles table, along with its counterpart roles_procedures, provides bidirectional traceability: from procedure to responsible role and from role to all procedures it is authorized to execute.

## Classification of Harm

A critical component of safeguarding operations is the systematic classification of harm. Not all incidents are equivalent, and the severity and category of harm determine the procedural response, reporting requirements, and escalation paths.

**Table `harm_types`**

| id | harm_code | harm_category | severity_level | description | requires_mandatory_reporting |
|---|---|---|---|---|---|
| 100 | 3001009030150 | compact-harm-68 | 29 | Extended Survey | true |
| 101 | 52ef0c068b8f4ba5b4fcc52c95ef9e5e | composite-harm-69 | 40 | Pilot Corridor A | false |
| 102 | gd_taxc_1211 | primary-harm-70 | 51 | Baseline Series | true |
| 103 | 10966231 | adaptive-harm-71 | 62 | Distributed Assessment | false |

The harm_types table defines four distinct categories of harm, each with a unique code, a severity level on a numeric scale, and a flag indicating whether mandatory reporting is required. Harm type 3001009030150, classified as compact-harm-68, carries a severity level of 29 and is described as Extended Survey. It requires mandatory reporting, as indicated by the true value in requires_mandatory_reporting. The composite-harm-69 category (code 52ef0c068b8f4ba5b4fcc52c95ef9e5e) has a higher severity of 40, is described as Pilot Corridor A, and does not require mandatory reporting. Primary-harm-70 (gd_taxc_1211) reaches severity level 51, is described as Baseline Series, and mandates reporting. The adaptive-harm-71 category (code 10966231) has the highest severity at 62, is described as Distributed Assessment, and does not require mandatory reporting. The severity_level values—29, 40, 51, and 62—provide a quantitative basis for prioritizing response efforts and allocating resources.

Harm types are linked to procedures, establishing which procedural responses are appropriate for each category of harm.

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

This linkage ensures that when an incident is classified under a particular harm type, the system can automatically recommend or mandate the corresponding procedures. The procedures_types table, together with its inverse types_reports, creates a comprehensive mapping between harm categories and the procedural and reporting frameworks that apply to them.

## Incident Reporting and Documentation

Incident reports serve as the primary record of safeguarding events. Each report captures the essential facts: when it was reported, its current status, its risk level, who is investigating it, and what outcome was reached.

**Table `incident_reports`**

| id | report_id | reported_date | report_status | risk_level | investigator_id | resolution_outcome | role_code |
|---|---|---|---|---|---|---|---|
| 1 | 1202-0008-S | 2025-04-27T03:09:00 | open | 37 | id_23 | seasonal-resoluti-71 | 6969430 |
| 2 | 8189500 | 2022-09-11T10:26:00 | under_investigation | 42 | 4011 | regional-resoluti-72 | lu_tax_code_template_m16 |
| 3 | L355 | 2023-02-22T17:43:00 | closed | 47 | 3158159 | legacy-resoluti-73 | 3158154 |
| 4 | 5844272 | 2024-07-06T00:00:00 | escalated | 52 | 4277008 | compact-resoluti-74 | 39800616 |

The incident report register contains four reports, each with a unique identifier and a distinct status. Report 1202-0008-S was reported on April 27, 2025, is currently open, carries a risk level of 37, and is being investigated by id_23. Resolution outcome is attributed to seasonal-resoluti-71, and the associated role code is 6969430. Report 8189500, reported on September 11, 2022, is under_investigation with a risk level of 42, investigated by 4011, with regional-resoluti-72 as the resolution outcome and lu_tax_code_template_m16 as the role code. Report L355, from February 22, 2023, is closed with a risk level of 47, investigated by 3158159, and resolved by legacy-resoluti-73 under role code 3158154. Report 5844272, reported on July 6, 2024, is escalated with the highest risk level of 52, investigated by 4277008, with compact-resoluti-74 as the resolution outcome and role code 39800616. The report_status values—open, under_investigation, closed, and escalated—provide a clear picture of the lifecycle stage of each incident.

Incident reports are linked to harm types, ensuring that each report is classified according to the appropriate category of harm.

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

This association, along with the complementary types_reports table, ensures that every incident report is properly categorized and that every harm type has a complete inventory of associated reports. The bidirectional linkage supports both top-down analysis (which reports fall under a given harm category?) and bottom-up aggregation (what is the full report history for a specific harm type?).

## Student Records and Role Assignments

Students are central to the safeguarding ecosystem. Their records capture enrollment status, date of birth, guardian contact information, assigned counselor, associated harm type, and role code.

**Table `students`**

| student_id | enrollment_status | date_of_birth | guardian_contact_id | counselor_id | harm_type_id | role_code |
|---|---|---|---|---|---|---|
| 1 | active | 2025-04-02 | Karen Keller | 8387531 | 100 | 6969430 |
| 2 | withdrawn | 2022-09-13 | Stephanie Lawrence | 7731869 | 101 | lu_tax_code_template_m16 |
| 3 | suspended | 2023-02-24 | Walter Pratt | 2839527 | 102 | 3158154 |
| 4 | active | 2024-07-08 | Julian Brown | 4180947 | 103 | 39800616 |

The student register includes four students with varying enrollment statuses. Student 1 is active, born on April 2, 2025, with guardian Karen Keller, counselor 8387531, associated harm type 100, and role code 6969430. Student 2 has withdrawn status, was born on September 13, 2022, has guardian Stephanie Lawrence, counselor 7731869, harm type 101, and role code lu_tax_code_template_m16. Student 3 is suspended, born February 24, 2023, with guardian Walter Pratt, counselor 2839527, harm type 102, and role code 3158154. Student 4 is active, born July 8, 2024, with guardian Julian Brown, counselor 4180947, harm type 103, and role code 39800616. The enrollment_status field—active, withdrawn, or suspended—provides immediate visibility into each student's current standing.

Staff roles define the organizational structure through which safeguarding procedures are executed. Each role has a title, a certification level, a training completion date, an access level, and timestamps for creation and last update.

**Table `staff_roles`**

| role_code | role_title | certification_level | training_completion_date | access_level | created_at | updated_at |
|---|---|---|---|---|---|---|
| 6969430 | Distributed Standard | seasonal-certific-59 | 2024-11-27 | baseline-access-91 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| lu_tax_code_template_m16 | Adaptive Framework D | regional-certific-60 | 2025-04-11 | pilot-access-92 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3158154 | Primary Protocol | legacy-certific-61 | 2022-09-22 | extended-access-93 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 39800616 | Composite Programme | compact-certific-62 | 2023-02-06 | integrated-access-94 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The role register contains four distinct roles. Role 6969430, titled Distributed Standard, holds seasonal-certific-59 certification, was trained on November 27, 2024, has baseline-access-91 access, and was created on January 1, 2025. Role lu_tax_code_template_m16, titled Adaptive Framework D, carries regional-certific-60 certification, completed training on April 11, 2025, has pilot-access-92 access, and was created on February 6, 2025. Role 3158154, titled Primary Protocol, holds legacy-certific-61 certification, was trained on September 22, 2022, has extended-access-93 access, and was created on March 11, 2025. Role 39800616, titled Composite Programme, carries compact-certific-62 certification, completed training on February 6, 2023, has integrated-access-94 access, and was created on April 16, 2025. The access_level field—ranging from baseline-access through integrated-access—determines the scope of information and actions each role can perform within the safeguarding system.

Staff roles are linked to procedures, reports, and students, forming the operational backbone of the safeguarding framework.

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

These three association tables create a comprehensive matrix of role-based permissions and assignments. The roles_procedures table maps which roles are authorized to execute which procedures. The roles_reports table assigns roles to specific incident reports, designating who is responsible for investigation and resolution. The roles_students table links students to their assigned staff roles, ensuring that each student has appropriate oversight and support.

Students are also linked to incident reports, establishing which students are affected by or involved in each reported incident.

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

These bidirectional associations ensure that every incident report can be traced to the students it involves, and every student can be associated with all relevant incident reports. The reports_students table provides the report-centric view (which students are involved in this report?), while students_reports provides the student-centric view (which reports involve this student?).

Similarly, harm types are linked to students, establishing which students are associated with which categories of harm.

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

This linkage supports targeted monitoring and intervention planning. By knowing which students are associated with which harm types, safeguarding coordinators can prioritize resources and ensure that appropriate support is available.

## Analytical Views and Cross-Domain Relationships

The safeguarding system provides a suite of analytical views that join data across multiple tables to answer specific operational questions. These views synthesize information from policies, procedures, harm types, incident reports, students, and staff roles into actionable insights.

The safeguarding_policy_safeguarding_procedure_detail_view joins policy records with their associated procedures, answering the question: which procedures are governed by which policies? This view is essential for compliance audits and for understanding the procedural implications of each policy.

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

The safeguarding_procedure_staff_role_detail_view connects procedures with the staff roles responsible for executing them, answering: which roles are assigned to which procedures? This view supports workload balancing and role-based training planning.

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

The safeguarding_procedure_harm_type_detail_view links procedures to harm types, answering: which procedures apply to which categories of harm? This view is critical for ensuring that the correct procedural response is triggered for each type of incident.

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

The safeguarding_procedure_incident_report_view joins procedures with the incident reports that triggered them, answering: which procedures were activated by which incidents? This view provides an audit trail from event to procedural response.

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

The harm_type_incident_report_detail_view connects harm types with their associated incident reports, answering: which incidents fall under which harm categories? Reading a concrete example, harm type 100 (compact-harm-68, severity 29) is associated with incident reports that carry risk levels reflecting its classification.

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

The harm_type_student_detail_view links harm types to students, answering: which students are associated with which harm categories? For instance, student 1 (active enrollment, guardian Karen Keller) is associated with harm type 100, while student 2 (withdrawn, guardian Stephanie Lawrence) is associated with harm type 101.

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

The incident_report_student_detail_view connects incident reports with the students they involve, answering: which students are affected by which incidents? Report 1202-0008-S, currently open with risk level 37, is linked to specific students who require follow-up and support.

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

The incident_report_harm_type_detail_view joins incident reports with their harm type classifications, answering: what category of harm does each incident represent? Report 5844272, escalated with the highest risk level of 52, is classified under a specific harm type that determines its reporting and escalation requirements.

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

The incident_report_staff_role_view connects incident reports with the staff roles responsible for their investigation and resolution, answering: which roles are handling which reports? Report L355, closed with risk level 47, was handled by the role designated by code 3158154.

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

The student_incident_report_detail_view provides a student-centric perspective on incident involvement, answering: which incidents involve a given student? This view is essential for maintaining a complete history of a student's safeguarding record.

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

The student_harm_type_view links students to their associated harm types, answering: what harm categories apply to each student? Student 3 (suspended, guardian Walter Pratt) is associated with harm type 102 (primary-harm-70, severity 51), which requires mandatory reporting.

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

The student_staff_role_view connects students with their assigned staff roles, answering: which staff roles are responsible for which students? This view ensures that every student has appropriate staff oversight.

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

The staff_role_safeguarding_procedure_detail_view joins staff roles with the procedures they are authorized to execute, answering: which procedures can a given role perform? Role 6969430 (Distributed Standard, baseline-access-91) is associated with specific procedures that fall within its authorization scope.

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

The staff_role_incident_report_detail_view connects staff roles with the incident reports they are handling, answering: which reports is a given role responsible for? Role lu_tax_code_template_m16 (Adaptive Framework D, pilot-access-92) is assigned to specific reports that require its specialized expertise.

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

The staff_role_student_detail_view links staff roles with the students they oversee, answering: which students are under the responsibility of a given role? This view supports workload management and ensures comprehensive student coverage.

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

## Synthesis

The safeguarding operational framework described in this chapter integrates policy governance, procedural response, harm classification, incident documentation, and role-based execution into a single coherent system. Policies establish the rules; procedures define the actions; harm types provide the classification; incident reports capture the events; students are the subjects of protection; and staff roles deliver the response. The association tables and analytical views weave these elements together, ensuring that every action can be traced to its policy basis, every incident can be classified and escalated appropriately, and every student can be monitored and supported effectively. The data values—policy identifiers like POL-2480 and POL-2498, procedure codes such as 3990183 and 10782181, harm severity levels ranging from 29 to 62, risk levels from 37 to 52, and enrollment statuses of active, withdrawn, and suspended—provide the concrete evidence that this framework operates as designed. Together, these records form the operational backbone of a safeguarding system that is transparent, accountable, and responsive to the needs of the students it serves.

## Data appendix

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
