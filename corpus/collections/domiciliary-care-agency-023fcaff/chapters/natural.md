## Domiciliary Care Operations: Governance, Inspection, and Service Delivery

Domiciliary care services deliver essential health and social support to individuals within their own homes, operating under a structured regulatory framework that tracks organizational compliance, staff assignments, and individualized care planning. The ecosystem comprises registered care agencies, legally accountable managers, scheduled regulatory inspections, multi-dimensional service ratings, and the operational layer of care plans, recipients, and assigned staff. Each entity maintains precise identifiers and status markers that enable auditors, administrators, and care coordinators to trace accountability from the organizational level down to the individual recipient. The following sections document the core records and the analytical views that join them into actionable intelligence.

**Table `domiciliary_care_agencies`**

| domiciliary_care_agency_id | registration_number | legal_name | physical_address | telephone | website | operational_status | registered_manager_id | regulatory_inspection_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|
| 100 | REG-2136 | Adaptive Model | pilot-physical-98 | adaptive-telephon-23 | https://bugs.launchpad.net/murano/+bug/1294080 | active | 1 | 1000 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 101 | REG-2142 | Primary Cluster | extended-physical-99 | distributed-telephon-24 | https://bugs.launchpad.net/murano/+bug/1294080 | suspended | 2 | 1001 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 102 | REG-2148 | Composite Review D | integrated-physical-100 | baseline-telephon-25 | https://www.nature.com/articles/nphoton.2008.245 | closed | 3 | 1002 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 103 | REG-2154 | Compact Initiative | seasonal-physical-101 | pilot-telephon-26 | https://bugs.launchpad.net/trove/+bug/1347114 | active | 4 | 1003 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Domiciliary care agencies form the foundational layer of the service delivery network. Each agency carries a unique registration number—such as REG-2136 for Adaptive Model or REG-2154 for Compact Initiative—and maintains a physical address, telephone contact, and web presence. The operational status field distinguishes between active providers like Adaptive Model and Compact Initiative, suspended operations such as Primary Cluster, and permanently closed entities like Composite Review D. Timestamps for creation and last update provide an audit trail of organizational lifecycle events. Every agency record links to a designated registered manager and the most recent regulatory inspection, anchoring the organization within both managerial and compliance contexts.

**Table `registered_managers`**

| registered_manager_id | manager_id | full_name | registration_date | legal_responsibility_scope | domiciliary_care_agency_id |
|---|---|---|---|---|---|
| 1 | id_23 | Theodore Mcgrath | 2023-06-19T17:27:00 | full | 100 |
| 2 | 10449531 | Account Name | 2024-11-03T00:44:00 | partial | 101 |
| 3 | 659 | Saipan International Airport | 2025-04-14T07:01:00 | full | 102 |
| 4 | f208f470-8fcd-11eb-924d-9cd76263cbd0 | Norma Fisher | 2022-09-25T14:18:00 | partial | 103 |

Registered managers bear legal responsibility for the operations of their assigned agencies. The manager registry captures the full name, registration date, and the scope of legal responsibility—either full or partial. Theodore Mcgrath, registered on 2023-06-19, holds full legal responsibility for Adaptive Model (agency 100), while Norma Fisher carries partial responsibility for Compact Initiative (agency 103). The manager_id field serves as an external identifier, ranging from numeric codes like 10449531 to UUIDs such as f208f470-8fcd-11eb-924d-9cd76263cbd0. The domiciliary_care_agency_id column creates the direct linkage between manager and organization, ensuring that every agency has a named accountable individual.

**Table `regulatory_inspections`**

| regulatory_inspection_id | inspection_id | inspection_date | publication_date | notice_period | inspection_type | overall_compliance_status | domiciliary_care_agency_id | service_rating_id |
|---|---|---|---|---|---|---|---|---|
| 1000 | BJanecke | 2025-12-03T23:09:00 | 2025-12-01 | 9 | announced | compliant | 100 | 1000 |
| 1001 | 575199 | 2022-05-14T06:26:00 | 2022-05-12 | 13 | unannounced | non-compliant | 101 | 1001 |
| 1002 | state_uk_4 | 2023-10-25T13:43:00 | 2023-10-23 | 17 | announced | partially compliant | 102 | 1002 |
| 1003 | 8350011 | 2024-03-09T20:00:00 | 2024-03-07 | 21 | unannounced | compliant | 103 | 1003 |

Regulatory inspections document the compliance assessments conducted against each domiciliary care agency. Inspections are identified by a composite key and carry an external inspection_id, such as BJanecke for inspection 1000 or 575199 for inspection 1001. Each record specifies the inspection date, publication date, notice period in days, and whether the visit was announced or unannounced. The overall_compliance_status field records the outcome as compliant, non-compliant, or partially compliant. Inspection 1000 on Adaptive Model was an announced visit with a nine-day notice period that resulted in a compliant status, whereas inspection 1001 on Primary Cluster was an unannounced visit with a thirteen-day notice that yielded a non-compliant finding. Every inspection is tied to a specific agency and a corresponding service rating.

**Table `service_ratings`**

| service_rating_id | rating_id | safety_rating | effectiveness_rating | caring_rating | responsiveness_rating | well_led_rating | regulatory_inspection_id |
|---|---|---|---|---|---|---|---|
| 1000 | 1450640 | Good | Good | Good | Good | Good | 1000 |
| 1001 | 338540 | Requires Improvement | Requires Improvement | Requires Improvement | Requires Improvement | Requires Improvement | 1001 |
| 1002 | 10445621 | Inadequate | Inadequate | Inadequate | Inadequate | Inadequate | 1002 |
| 1003 | 9568460 | Good | Good | Good | Good | Good | 1003 |

Service ratings provide a granular, five-dimension assessment of care quality, each scored independently. The dimensions—safety, effectiveness, caring, responsiveness, and well-led—collectively form the composite judgment of a provider. For inspection 1000 on Adaptive Model, all five dimensions received a Good rating, reflecting consistent performance across the board. In contrast, inspection 1002 on Composite Review D resulted in Inadequate ratings across every dimension, signaling systemic deficiencies. Inspection 1001 on Primary Cluster received Requires Improvement ratings uniformly, indicating a need for targeted remediation. The service_rating_id links directly back to its parent regulatory_inspection_id, ensuring that every rating is traceable to a specific inspection event.

**Table `care_plans`**

| id | plan_id | last_review_date | dietary_requirements | medication_regimen | risk_assessment_status | care_recipient_id |
|---|---|---|---|---|---|---|
| 1000 | 505977 | 2022-09-03T08:24:00 | legacy-dietary-97 | pilot-medicati-68 | current | 100 |
| 1001 | 727038 | 2023-02-14T15:41:00 | compact-dietary-98 | extended-medicati-69 | expired | 101 |
| 1002 | 937726 | 2024-07-25T22:58:00 | composite-dietary-99 | integrated-medicati-70 | pending | 102 |
| 1003 | 1290 | 2025-12-09T05:15:00 | primary-dietary-100 | seasonal-medicati-71 | current | 103 |

Care plans represent the individualized service agreements prepared for each care recipient. Each plan carries a review date, dietary requirements specification, medication regimen identifier, and a risk assessment status that can be current, expired, or pending. Plan 1000 for recipient 100 specifies legacy-dietary-97 and pilot-medicati-68 with a current risk assessment, while plan 1001 for recipient 101 carries compact-dietary-98 and extended-medicati-69 with an expired risk assessment, suggesting the need for renewal. Plan 1002 for recipient 102 has a pending risk assessment, indicating that evaluation is underway. The care_recipient_id column anchors each plan to the individual it serves.

**Table `care_recipients`**

| id | recipient_id | date_of_birth | mental_capacity_status | primary_language | domiciliary_care_agency_id | care_plan_id |
|---|---|---|---|---|---|---|
| 100 | b_VB-EC-15 | 2025-04-02 | capable | primary-primary-10 | 100 | 1000 |
| 101 | 1889791 | 2022-09-13 | incapable | adaptive-primary-11 | 101 | 1001 |
| 102 | 4180946 | 2023-02-24 | assessing | distributed-primary-12 | 102 | 1002 |
| 103 | 5789a9197ed7473eb37814ca09efb2c8 | 2024-07-08 | capable | baseline-primary-13 | 103 | 1003 |

Care recipients are the individuals who receive domiciliary support services. Each record includes a unique recipient identifier, date of birth, mental capacity status, and primary language. Recipient b_VB-EC-15 (id 100) is classified as capable of making decisions and speaks primary-primary-10, while recipient 1889791 (id 101) is classified as incapable, requiring substituted decision-making. Recipient 4180946 (id 102) is in the assessing category, meaning their capacity is under formal evaluation. The domiciliary_care_agency_id links each recipient to the agency providing their care, and the care_plan_id connects them to their individualized plan.

**Table `care_staffs`**

| care_staff_id | staff_id | security_clearance_status | training_completion_date | employment_status | domiciliary_care_agency_id |
|---|---|---|---|---|---|
| 1 | 937735 | cleared | 2024-11-27 | active | 100 |
| 2 | 3158139 | pending | 2025-04-11 | on_leave | 101 |
| 3 | 8189502 | expired | 2022-09-22 | terminated | 102 |
| 4 | 69438 | cleared | 2023-02-06 | active | 103 |

Care staff records document the personnel who deliver hands-on support to recipients. Each staff member is assigned to a specific domiciliary care agency through the domiciliary_care_agency_id foreign key, establishing the organizational context for their work. The staff registry captures professional identifiers and role assignments that enable care coordinators to match qualified personnel with recipient needs.

**Table `plans_staffs`**

| care_plan_id | care_staff_id |
|---|---|
| 1000 | 1 |
| 1000 | 2 |
| 1001 | 2 |
| 1001 | 3 |
| 1002 | 3 |
| 1002 | 4 |
| 1003 | 4 |
| 1003 | 1 |

The plans_staffs table establishes the assignment relationship between care plans and care staff. It records which staff members are designated to deliver the services outlined in each care plan, creating a traceable link from the individualized plan to the personnel responsible for its execution.

**Table `staffs_recipients`**

| care_staff_id | care_recipient_id |
|---|---|
| 1 | 100 |
| 1 | 101 |
| 2 | 101 |
| 2 | 102 |
| 3 | 102 |
| 3 | 103 |
| 4 | 103 |
| 4 | 100 |

The staffs_recipients table captures the direct working relationship between care staff and care recipients. This junction record documents which staff members are actively assigned to which recipients, enabling oversight of caseload distribution and ensuring that every recipient has identified care providers.

**View `v_domiciliary_care_agency_registered_manager`**

```sql
CREATE VIEW v_domiciliary_care_agency_registered_manager AS
SELECT a.domiciliary_care_agency_id, a.registration_number, a.legal_name, a.physical_address, b.registered_manager_id AS manager_registered_manager_id, b.manager_id AS manager_manager_id, b.full_name AS manager_full_name
FROM domiciliary_care_agencies a JOIN registered_managers b ON a.registered_manager_id = b.registered_manager_id;
```

| domiciliary_care_agency_id | registration_number | legal_name | physical_address | manager_registered_manager_id | manager_manager_id | manager_full_name |
|---|---|---|---|---|---|---|
| 100 | REG-2136 | Adaptive Model | pilot-physical-98 | 1 | id_23 | Theodore Mcgrath |
| 101 | REG-2142 | Primary Cluster | extended-physical-99 | 2 | 10449531 | Account Name |
| 102 | REG-2148 | Composite Review D | integrated-physical-100 | 3 | 659 | Saipan International Airport |
| 103 | REG-2154 | Compact Initiative | seasonal-physical-101 | 4 | f208f470-8fcd-11eb-924d-9cd76263cbd0 | Norma Fisher |

This view joins the agency and manager tables to present a unified record of organizational leadership. It answers the question: which registered manager is accountable for which domiciliary care agency, and what is the scope of their legal responsibility? The row for agency 100 (Adaptive Model) shows Theodore Mcgrath with full legal responsibility, while the row for agency 103 (Compact Initiative) shows Norma Fisher with partial responsibility. This view is essential for compliance audits that require rapid identification of the accountable individual at any given organization.

**View `v_domiciliary_care_agency_regulatory_inspection`**

```sql
CREATE VIEW v_domiciliary_care_agency_regulatory_inspection AS
SELECT a.domiciliary_care_agency_id, a.registration_number, a.legal_name, a.physical_address, b.regulatory_inspection_id AS inspection_regulatory_inspection_id, b.inspection_id AS inspection_inspection_id, b.inspection_date AS inspection_inspection_date
FROM domiciliary_care_agencies a JOIN regulatory_inspections b ON a.regulatory_inspection_id = b.regulatory_inspection_id;
```

| domiciliary_care_agency_id | registration_number | legal_name | physical_address | inspection_regulatory_inspection_id | inspection_inspection_id | inspection_inspection_date |
|---|---|---|---|---|---|---|
| 100 | REG-2136 | Adaptive Model | pilot-physical-98 | 1000 | BJanecke | 2025-12-03T23:09:00 |
| 101 | REG-2142 | Primary Cluster | extended-physical-99 | 1001 | 575199 | 2022-05-14T06:26:00 |
| 102 | REG-2148 | Composite Review D | integrated-physical-100 | 1002 | state_uk_4 | 2023-10-25T13:43:00 |
| 103 | REG-2154 | Compact Initiative | seasonal-physical-101 | 1003 | 8350011 | 2024-03-09T20:00:00 |

This view links agencies to their most recent regulatory inspections, answering: what was the compliance outcome of the latest inspection for each agency? The row for Adaptive Model (agency 100) shows inspection 1000 with a compliant status, while Primary Cluster (agency 101) shows inspection 1001 with a non-compliant status. Composite Review D (agency 102) carries inspection 1002 with a partially compliant finding. Administrators use this view to monitor the compliance trajectory of each provider and to prioritize follow-up actions for organizations with adverse inspection outcomes.

**View `v_registered_manager_domiciliary_care_agency`**

```sql
CREATE VIEW v_registered_manager_domiciliary_care_agency AS
SELECT a.registered_manager_id, a.manager_id, a.full_name, a.registration_date, b.domiciliary_care_agency_id AS agency_domiciliary_care_agency_id, b.registration_number AS agency_registration_number, b.legal_name AS agency_legal_name
FROM registered_managers a JOIN domiciliary_care_agencies b ON a.domiciliary_care_agency_id = b.domiciliary_care_agency_id;
```

| registered_manager_id | manager_id | full_name | registration_date | agency_domiciliary_care_agency_id | agency_registration_number | agency_legal_name |
|---|---|---|---|---|---|---|
| 1 | id_23 | Theodore Mcgrath | 2023-06-19T17:27:00 | 100 | REG-2136 | Adaptive Model |
| 2 | 10449531 | Account Name | 2024-11-03T00:44:00 | 101 | REG-2142 | Primary Cluster |
| 3 | 659 | Saipan International Airport | 2025-04-14T07:01:00 | 102 | REG-2148 | Composite Review D |
| 4 | f208f470-8fcd-11eb-924d-9cd76263cbd0 | Norma Fisher | 2022-09-25T14:18:00 | 103 | REG-2154 | Compact Initiative |

This view reverses the perspective of the manager-agency join, presenting each manager alongside their assigned agency details. It answers: what are the operational characteristics of the agency managed by a given registered manager? The row for Theodore Mcgrath displays the full details of Adaptive Model, including its registration number REG-2136, active operational status, and the associated inspection 1000. This orientation is useful when a regulator needs to evaluate all agencies under a manager's purview or when a manager's performance is being assessed against their organization's compliance record.

**View `v_regulatory_inspection_domiciliary_care_agency`**

```sql
CREATE VIEW v_regulatory_inspection_domiciliary_care_agency AS
SELECT a.regulatory_inspection_id, a.inspection_id, a.inspection_date, a.publication_date, b.domiciliary_care_agency_id AS agency_domiciliary_care_agency_id, b.registration_number AS agency_registration_number, b.legal_name AS agency_legal_name
FROM regulatory_inspections a JOIN domiciliary_care_agencies b ON a.domiciliary_care_agency_id = b.domiciliary_care_agency_id;
```

| regulatory_inspection_id | inspection_id | inspection_date | publication_date | agency_domiciliary_care_agency_id | agency_registration_number | agency_legal_name |
|---|---|---|---|---|---|---|
| 1000 | BJanecke | 2025-12-03T23:09:00 | 2025-12-01 | 100 | REG-2136 | Adaptive Model |
| 1001 | 575199 | 2022-05-14T06:26:00 | 2022-05-12 | 101 | REG-2142 | Primary Cluster |
| 1002 | state_uk_4 | 2023-10-25T13:43:00 | 2023-10-23 | 102 | REG-2148 | Composite Review D |
| 1003 | 8350011 | 2024-03-09T20:00:00 | 2024-03-07 | 103 | REG-2154 | Compact Initiative |

This view presents each regulatory inspection alongside the full details of the agency that was inspected. It answers: what agency was subject to a given inspection, and under what circumstances? The row for inspection 1000 shows that Adaptive Model (registration REG-2136, active status) underwent an announced inspection with a nine-day notice period. Inspection 1001 reveals that Primary Cluster (registration REG-2142, suspended status) was subject to an unannounced visit with a thirteen-day notice. This view supports investigative workflows where the context of the inspected organization is needed to interpret the inspection findings.

**View `v_regulatory_inspection_service_rating`**

```sql
CREATE VIEW v_regulatory_inspection_service_rating AS
SELECT a.regulatory_inspection_id, a.inspection_id, a.inspection_date, a.publication_date, b.service_rating_id AS rating_service_rating_id, b.rating_id AS rating_rating_id, b.safety_rating AS rating_safety_rating
FROM regulatory_inspections a JOIN service_ratings b ON a.service_rating_id = b.service_rating_id;
```

| regulatory_inspection_id | inspection_id | inspection_date | publication_date | rating_service_rating_id | rating_rating_id | rating_safety_rating |
|---|---|---|---|---|---|---|
| 1000 | BJanecke | 2025-12-03T23:09:00 | 2025-12-01 | 1000 | 1450640 | Good |
| 1001 | 575199 | 2022-05-14T06:26:00 | 2022-05-12 | 1001 | 338540 | Requires Improvement |
| 1002 | state_uk_4 | 2023-10-25T13:43:00 | 2023-10-23 | 1002 | 10445621 | Inadequate |
| 1003 | 8350011 | 2024-03-09T20:00:00 | 2024-03-07 | 1003 | 9568460 | Good |

This view joins inspections with their corresponding service ratings, answering: what were the five-dimension ratings associated with each regulatory inspection? The row for inspection 1000 shows that Adaptive Model received Good ratings across all five dimensions—safety, effectiveness, caring, responsiveness, and well-led. Inspection 1002 on Composite Review D shows Inadequate ratings across every dimension, providing a stark contrast. Inspection 1001 on Primary Cluster shows Requires Improvement uniformly. This view is the primary analytical tool for comparing performance across agencies and for identifying patterns in rating distributions.

**View `v_service_rating_regulatory_inspection`**

```sql
CREATE VIEW v_service_rating_regulatory_inspection AS
SELECT a.service_rating_id, a.rating_id, a.safety_rating, a.effectiveness_rating, b.regulatory_inspection_id AS inspection_regulatory_inspection_id, b.inspection_id AS inspection_inspection_id, b.inspection_date AS inspection_inspection_date
FROM service_ratings a JOIN regulatory_inspections b ON a.regulatory_inspection_id = b.regulatory_inspection_id;
```

| service_rating_id | rating_id | safety_rating | effectiveness_rating | inspection_regulatory_inspection_id | inspection_inspection_id | inspection_inspection_date |
|---|---|---|---|---|---|---|
| 1000 | 1450640 | Good | Good | 1000 | BJanecke | 2025-12-03T23:09:00 |
| 1001 | 338540 | Requires Improvement | Requires Improvement | 1001 | 575199 | 2022-05-14T06:26:00 |
| 1002 | 10445621 | Inadequate | Inadequate | 1002 | state_uk_4 | 2023-10-25T13:43:00 |
| 1003 | 9568460 | Good | Good | 1003 | 8350011 | 2024-03-09T20:00:00 |

This view presents the service rating perspective, linking each rating back to its parent inspection and agency. It answers: given a service rating, what inspection and agency does it belong to? The row for service rating 1000 shows that it derives from inspection 1000 on Adaptive Model, with all five dimensions rated Good. The row for service rating 1002 shows that it derives from inspection 1002 on Composite Review D, with all five dimensions rated Inadequate. This orientation is useful when starting from a rating and needing to trace back to the inspection event and the organization assessed.

**View `v_care_plan_care_recipient`**

```sql
CREATE VIEW v_care_plan_care_recipient AS
SELECT a.id, a.plan_id, a.last_review_date, a.dietary_requirements, b.id AS recipient_id, b.recipient_id AS recipient_recipient_id, b.date_of_birth AS recipient_date_of_birth
FROM care_plans a JOIN care_recipients b ON a.care_recipient_id = b.id;
```

| id | plan_id | last_review_date | dietary_requirements | recipient_id | recipient_recipient_id | recipient_date_of_birth |
|---|---|---|---|---|---|---|
| 1000 | 505977 | 2022-09-03T08:24:00 | legacy-dietary-97 | 100 | b_VB-EC-15 | 2025-04-02 |
| 1001 | 727038 | 2023-02-14T15:41:00 | compact-dietary-98 | 101 | 1889791 | 2022-09-13 |
| 1002 | 937726 | 2024-07-25T22:58:00 | composite-dietary-99 | 102 | 4180946 | 2023-02-24 |
| 1003 | 1290 | 2025-12-09T05:15:00 | primary-dietary-100 | 103 | 5789a9197ed7473eb37814ca09efb2c8 | 2024-07-08 |

This view joins care plans with their associated recipients, answering: which care plan serves which recipient, and what are the plan's current specifications? The row for plan 1000 shows it serves recipient b_VB-EC-15 (id 100), with a last review date of 2022-09-03, dietary requirements of legacy-dietary-97, and a current risk assessment status. Plan 1001 serves recipient 1889791 (id 101), with an expired risk assessment, indicating that the plan requires immediate review. This view enables care coordinators to identify plans that need attention and to verify that every recipient has an active, up-to-date plan.

**View `v_care_plan_care_staff_detail`**

```sql
CREATE VIEW v_care_plan_care_staff_detail AS
SELECT a.id, a.plan_id, a.last_review_date, b.care_staff_id AS staff_care_staff_id, b.staff_id AS staff_staff_id, b.security_clearance_status AS staff_security_clearance_status
FROM care_plans a
  JOIN plans_staffs j ON j.care_plan_id = a.id
  JOIN care_staffs b ON b.care_staff_id = j.care_staff_id;
```

| id | plan_id | last_review_date | staff_care_staff_id | staff_staff_id | staff_security_clearance_status |
|---|---|---|---|---|---|
| 1000 | 505977 | 2022-09-03T08:24:00 | 1 | 937735 | cleared |
| 1000 | 505977 | 2022-09-03T08:24:00 | 2 | 3158139 | pending |
| 1001 | 727038 | 2023-02-14T15:41:00 | 2 | 3158139 | pending |
| 1001 | 727038 | 2023-02-14T15:41:00 | 3 | 8189502 | expired |
| 1002 | 937726 | 2024-07-25T22:58:00 | 3 | 8189502 | expired |
| 1002 | 937726 | 2024-07-25T22:58:00 | 4 | 69438 | cleared |
| 1003 | 1290 | 2025-12-09T05:15:00 | 4 | 69438 | cleared |
| 1003 | 1290 | 2025-12-09T05:15:00 | 1 | 937735 | cleared |

This view connects care plans with the staff members assigned to deliver the services they specify. It answers: which staff members are responsible for executing a given care plan? The joined record shows the plan's dietary and medication specifications alongside the assigned staff's identity and agency affiliation. This view is critical for ensuring that care delivery aligns with plan specifications and for auditing staff workload distribution across plans.

**View `v_care_recipient_domiciliary_care_agency`**

```sql
CREATE VIEW v_care_recipient_domiciliary_care_agency AS
SELECT a.id, a.recipient_id, a.date_of_birth, a.mental_capacity_status, b.domiciliary_care_agency_id AS agency_domiciliary_care_agency_id, b.registration_number AS agency_registration_number, b.legal_name AS agency_legal_name
FROM care_recipients a JOIN domiciliary_care_agencies b ON a.domiciliary_care_agency_id = b.domiciliary_care_agency_id;
```

| id | recipient_id | date_of_birth | mental_capacity_status | agency_domiciliary_care_agency_id | agency_registration_number | agency_legal_name |
|---|---|---|---|---|---|---|
| 100 | b_VB-EC-15 | 2025-04-02 | capable | 100 | REG-2136 | Adaptive Model |
| 101 | 1889791 | 2022-09-13 | incapable | 101 | REG-2142 | Primary Cluster |
| 102 | 4180946 | 2023-02-24 | assessing | 102 | REG-2148 | Composite Review D |
| 103 | 5789a9197ed7473eb37814ca09efb2c8 | 2024-07-08 | capable | 103 | REG-2154 | Compact Initiative |

This view links care recipients to their assigned domiciliary care agencies, answering: which agency provides care to each recipient? The row for recipient b_VB-EC-15 (id 100) shows that care is provided by agency 100 (Adaptive Model), while recipient 1889791 (id 101) receives care from agency 101 (Primary Cluster). This view supports resource allocation analysis, allowing administrators to understand the distribution of recipients across agencies and to identify agencies with unusually high or low caseloads.

**View `v_care_recipient_care_plan`**

```sql
CREATE VIEW v_care_recipient_care_plan AS
SELECT a.id, a.recipient_id, a.date_of_birth, a.mental_capacity_status, b.id AS plan_id, b.plan_id AS plan_plan_id, b.last_review_date AS plan_last_review_date
FROM care_recipients a JOIN care_plans b ON a.care_plan_id = b.id;
```

| id | recipient_id | date_of_birth | mental_capacity_status | plan_id | plan_plan_id | plan_last_review_date |
|---|---|---|---|---|---|---|
| 100 | b_VB-EC-15 | 2025-04-02 | capable | 1000 | 505977 | 2022-09-03T08:24:00 |
| 101 | 1889791 | 2022-09-13 | incapable | 1001 | 727038 | 2023-02-14T15:41:00 |
| 102 | 4180946 | 2023-02-24 | assessing | 1002 | 937726 | 2024-07-25T22:58:00 |
| 103 | 5789a9197ed7473eb37814ca09efb2c8 | 2024-07-08 | capable | 1003 | 1290 | 2025-12-09T05:15:00 |

This view presents the recipient perspective, joining each care recipient with their individualized care plan. It answers: what care plan is associated with a given recipient, and what are the plan's key characteristics? The row for recipient b_VB-EC-15 (id 100) shows care plan 1000 with a last review date of 2022-09-03, dietary requirements of legacy-dietary-97, and a current risk assessment. Recipient 4180946 (id 102) is linked to plan 1002, which has a pending risk assessment status. This view is the primary tool for care coordinators reviewing individual recipient records and verifying plan currency.

**View `v_care_staff_domiciliary_care_agency`**

```sql
CREATE VIEW v_care_staff_domiciliary_care_agency AS
SELECT a.care_staff_id, a.staff_id, a.security_clearance_status, a.training_completion_date, b.domiciliary_care_agency_id AS agency_domiciliary_care_agency_id, b.registration_number AS agency_registration_number, b.legal_name AS agency_legal_name
FROM care_staffs a JOIN domiciliary_care_agencies b ON a.domiciliary_care_agency_id = b.domiciliary_care_agency_id;
```

| care_staff_id | staff_id | security_clearance_status | training_completion_date | agency_domiciliary_care_agency_id | agency_registration_number | agency_legal_name |
|---|---|---|---|---|---|---|
| 1 | 937735 | cleared | 2024-11-27 | 100 | REG-2136 | Adaptive Model |
| 2 | 3158139 | pending | 2025-04-11 | 101 | REG-2142 | Primary Cluster |
| 3 | 8189502 | expired | 2022-09-22 | 102 | REG-2148 | Composite Review D |
| 4 | 69438 | cleared | 2023-02-06 | 103 | REG-2154 | Compact Initiative |

This view connects care staff to their employing agencies, answering: which agency employs each care staff member? The joined record displays the staff member's professional details alongside the agency's registration number, legal name, and operational status. This view supports workforce management by enabling supervisors to verify that staff are assigned to active agencies and to monitor staffing levels across the organization.

**View `v_care_staff_care_recipient_detail`**

```sql
CREATE VIEW v_care_staff_care_recipient_detail AS
SELECT a.care_staff_id, a.staff_id, a.security_clearance_status, b.id AS recipient_id, b.recipient_id AS recipient_recipient_id, b.date_of_birth AS recipient_date_of_birth
FROM care_staffs a
  JOIN staffs_recipients j ON j.care_staff_id = a.care_staff_id
  JOIN care_recipients b ON b.id = j.care_recipient_id;
```

| care_staff_id | staff_id | security_clearance_status | recipient_id | recipient_recipient_id | recipient_date_of_birth |
|---|---|---|---|---|---|
| 1 | 937735 | cleared | 100 | b_VB-EC-15 | 2025-04-02 |
| 1 | 937735 | cleared | 101 | 1889791 | 2022-09-13 |
| 2 | 3158139 | pending | 101 | 1889791 | 2022-09-13 |
| 2 | 3158139 | pending | 102 | 4180946 | 2023-02-24 |
| 3 | 8189502 | expired | 102 | 4180946 | 2023-02-24 |
| 3 | 8189502 | expired | 103 | 5789a9197ed7473eb37814ca09efb2c8 | 2024-07-08 |
| 4 | 69438 | cleared | 103 | 5789a9197ed7473eb37814ca09efb2c8 | 2024-07-08 |
| 4 | 69438 | cleared | 100 | b_VB-EC-15 | 2025-04-02 |

This view joins care staff with the recipients they serve, answering: which recipients are being supported by a given care staff member? The joined record shows the staff member's agency affiliation alongside the recipient's details, including their mental capacity status and primary language. This view is essential for caseload management, ensuring that staff assignments are balanced and that recipients receive consistent, personalized care from identified providers.

## Synthesis

The domiciliary care data model captures a complete chain of accountability and service delivery. Agencies register with regulatory bodies, appoint legally responsible managers, and undergo periodic inspections that produce five-dimension service ratings. Within each agency, care recipients receive individualized care plans, which are executed by assigned staff members. The base tables record the discrete entities and their attributes, while the analytical views join these records into perspectives that answer specific operational questions—from managerial accountability and compliance status to care plan currency and staff-recipient matching. Together, these records form the evidentiary basis for regulatory oversight, quality improvement, and the day-to-day coordination of home-based care services.