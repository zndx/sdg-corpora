## Social Care Service Delivery and Oversight

The social care ecosystem operates through a structured network of agencies, services, assessments, and regulatory inspections. At its core, the system tracks how organizations deliver care to individuals with varying needs, how those needs are formally assessed, and how policy documents govern the standards under which services operate. Each component—from the initial needs assessment through to the final inspection finding—forms a chain of accountability that ensures care delivery meets established criteria. The records in this domain capture the full lifecycle of a social care service: from its creation and the agency responsible for it, through the individuals it serves, the assessments that determine eligibility, and the inspections that verify compliance.

**Table `service_inspections`**

| id | inspection_id | inspection_date | inspection_status | inspection_scope | findings_summary | policy_document_policy_ref |
|---|---|---|---|---|---|---|
| 1 | BJanecke | 2025-12-03T23:09:00 | planned | national | pilot-findings-32 | 8189490 |
| 2 | 575199 | 2022-05-14T06:26:00 | in_progress | local_authority | extended-findings-33 | 1450659 |
| 3 | state_uk_4 | 2023-10-25T13:43:00 | completed | agency_specific | integrated-findings-34 | 937738 |
| 4 | 8350011 | 2024-03-09T20:00:00 | archived | national | seasonal-findings-35 | 4277030 |

Service inspections form the regulatory backbone of the system. Each inspection record carries a unique identifier, a scheduled date, and a status that reflects its current position in the oversight cycle. Inspections span multiple scopes, from national-level reviews to local authority audits and agency-specific evaluations. The findings summary field captures the essential outcome of each inspection, with entries such as pilot-findings-32 and extended-findings-33 documenting the nature of the review. Policy document references tie each inspection to the governing standards under which it was conducted. The inspection at identifier BJanecke, scheduled for December 2025, carries a national scope and references policy document 8189490, while the completed inspection state_uk_4 from October 2023 operated at the agency-specific level under policy 937738.

**Table `social_care_services`**

| service_code | service_name | service_type | delivery_mode | is_integrated | eligibility_criteria | agency_id | needs_assessment_id |
|---|---|---|---|---|---|---|---|
| 20789856 | Distributed Initiative | personal_care | in_home | true | composite-eligibil-57 | U.S. Steel | 1000 |
| 3990167 | Adaptive Model D | child_care | centre_based | false | primary-eligibil-58 | Nikola Corporation | 1001 |
| 14484998 | Primary Cluster | family_support | community | true | adaptive-eligibil-59 | Oberthur Technologies | 1002 |
| Total | Composite Review | multi_purpose | in_home | false | distributed-eligibil-60 | General Telephone & Electronics | 1003 |

Social care services represent the actual programs and interventions delivered to individuals. Each service is classified by type—personal_care, child_care, family_support, or multi_purpose—and by its delivery mode, which may be in_home, centre_based, or community-based. The is_integrated flag indicates whether the service operates as part of a broader coordinated care network. Eligibility criteria define who qualifies for each service, with entries ranging from composite-eligibil-57 to adaptive-eligibil-59. Every service is associated with a responsible agency and a needs assessment, creating the foundational link between the program and the individual it serves. The Distributed Initiative (code 20789856) provides personal care in the home under the U.S. Steel agency, while the Adaptive Model D (code 3990167) delivers child care at a centre-based facility operated by Nikola Corporation.

**Table `service_users`**

| id | user_id | user_type | has_disability | disability_type | parenting_status | needs_acknowledged | service_user_id | needs_assessment_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 9736910 | disabled_parent | false | learning | active_parent | false | 1 | 1000 |
| 2 | 40c1e50ce74c42d6801b1e2f409c1cfc | child | true | physical | expectant_parent | true | 2 | 1001 |
| 3 | 92297f70-9bad-11eb-a8a2-19ed5c03f8d3 | carer | false | sensory | non_parent | false | 3 | 1002 |
| 4 | 9125634 | disabled_parent | true | chronic_sickness | active_parent | true | 4 | 1003 |

Service users are the individuals who receive care through the system. Each user record captures demographic and situational information including user_type (disabled_parent, child, carer), disability status, and parenting_status (active_parent, expectant_parent, non_parent). The disability_type field records the nature of any disability, encompassing categories such as learning, physical, sensory, and chronic_sickness. The needs_acknowledged flag indicates whether the user's requirements have been formally recognized. Service user identifiers vary in format, from numeric values like 9736910 to UUIDs such as 92297f70-9bad-11eb-a8a2-19ed5c03f8d3. Each user is linked to a specific service and a needs assessment, ensuring that care delivery is grounded in documented need.

**Table `needs_assessments`**

| id | assessment_id | assessment_date | assessment_type | is_service_led | needs_identified | assessment_outcome | agency_id | service_code |
|---|---|---|---|---|---|---|---|---|
| 1000 | template_ivacode_pagata_20det40ind | 2022-05-10T04:24:00 | holistic | false | 47 | eligible | U.S. Steel | 20789856 |
| 1001 | 19508914 | 2023-10-21T11:41:00 | adult_focused | true | 56 | ineligible | Nikola Corporation | 3990167 |
| 1002 | 506000 | 2024-03-05T18:58:00 | child_focused | false | 65 | pending_review | Oberthur Technologies | 14484998 |
| 1003 | 1204-0009-M | 2025-08-16T01:15:00 | holistic | true | 74 | eligible | General Telephone & Electronics | Total |

Needs assessments are the formal evaluations that determine an individual's eligibility for care services. Each assessment carries a unique identifier, a date, and a type that reflects its focus—holistic, adult_focused, or child_focused. The is_service_led flag indicates whether the assessment was initiated by the service provider rather than an external party. The needs_identified field records a numeric count of identified needs, ranging from 47 in the template_ivacode_pagata_20det40ind assessment to 74 in the 1204-0009-M assessment. The assessment_outcome field captures the determination: eligible, ineligible, or pending_review. Each assessment is tied to a specific agency and service code, anchoring the evaluation within the organizational and programmatic context.

**Table `service_agencies`**

| agency_id | agency_name | agency_type | has_specific_policy | jurisdiction | adoption_of_social_model | created_at | updated_at |
|---|---|---|---|---|---|---|---|
| U.S. Steel | FSG Social Impact Advisors | local_council | false | regional-jurisdic-30 | true | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| Nikola Corporation | Whirlpool Corporation | voluntary_org | true | legacy-jurisdic-31 | false | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| Oberthur Technologies | Education Writers Association | private_agency | false | compact-jurisdic-32 | true | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| General Telephone & Electronics | Switch Card Services Ltd. | local_council | true | composite-jurisdic-33 | false | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Service agencies are the organizations responsible for delivering and managing care services. The agency_id serves as the primary key and often corresponds to the organization's legal name, as seen with entries like U.S. Steel, Nikola Corporation, Oberthur Technologies, and General Telephone & Electronics. The agency_name field provides the operational or trading name, such as FSG Social Impact Advisors or Whirlpool Corporation. Agencies are classified by type—local_council, voluntary_org, or private_agency—and by their jurisdiction, which may be regional, legacy, compact, or composite. The has_specific_policy flag indicates whether the agency maintains its own policy documentation, while adoption_of_social_model reflects alignment with social model principles. Timestamps for created_at and updated_at track the administrative lifecycle of each agency record.

**Table `policy_documents`**

| policy_ref | policy_title | publish_date | policy_scope | legislation_reference | is_mandatory | service_code | service_inspection_id |
|---|---|---|---|---|---|---|---|
| 8189490 | Baseline Initiative D | 2023-06-06 | national | Children Act 1989 | true | 20789856 | 1 |
| 1450659 | Distributed Model | 2024-11-17 | local | Social Care Act | false | 3990167 | 2 |
| 937738 | Adaptive Cluster | 2025-04-01 | agency_specific | Children Act 1989 | true | 14484998 | 3 |
| 4277030 | Primary Review A | 2022-09-12 | national | Social Care Act | false | Total | 4 |

Policy documents establish the regulatory framework within which inspections and services operate. Each document is identified by a policy_ref and carries a title such as Baseline Initiative D or Distributed Model. The publish_date records when the policy came into effect, spanning from September 2022 to April 2025. Policy_scope defines the reach of the document—national, local, or agency_specific—and the legislation_reference cites the governing statute, typically the Children Act 1989 or the Social Care Act. The is_mandatory flag distinguishes binding requirements from advisory guidance. Each policy document is associated with a service code and a service inspection, creating the linkage between regulatory standards and their enforcement through the inspection process.

The relationships between these core entities are captured through a series of junction tables that encode the many-to-many associations inherent in social care delivery.

**Table `inspections_services`**

| service_inspection_id | service_code |
|---|---|
| 1 | 20789856 |
| 1 | 3990167 |
| 2 | 3990167 |
| 2 | 14484998 |
| 3 | 14484998 |
| 3 | Total |
| 4 | Total |
| 4 | 20789856 |

**Table `services_users`**

| service_code | service_user_id |
|---|---|
| 20789856 | 1 |
| 20789856 | 2 |
| 3990167 | 2 |
| 3990167 | 3 |
| 14484998 | 3 |
| 14484998 | 4 |
| Total | 4 |
| Total | 1 |

**Table `users_services`**

| service_user_id | service_code |
|---|---|
| 1 | 20789856 |
| 1 | 3990167 |
| 2 | 3990167 |
| 2 | 14484998 |
| 3 | 14484998 |
| 3 | Total |
| 4 | Total |
| 4 | 20789856 |

**Table `assessments_users`**

| needs_assessment_id | service_user_id |
|---|---|
| 1000 | 1 |
| 1000 | 2 |
| 1001 | 2 |
| 1001 | 3 |
| 1002 | 3 |
| 1002 | 4 |
| 1003 | 4 |
| 1003 | 1 |

**Table `agencies_services`**

| agency_id | service_code |
|---|---|
| U.S. Steel | 20789856 |
| U.S. Steel | 3990167 |
| Nikola Corporation | 3990167 |
| Nikola Corporation | 14484998 |
| Oberthur Technologies | 14484998 |
| Oberthur Technologies | Total |
| General Telephone & Electronics | Total |
| General Telephone & Electronics | 20789856 |

**Table `agencies_assessments`**

| agency_id | needs_assessment_id |
|---|---|
| U.S. Steel | 1000 |
| U.S. Steel | 1001 |
| Nikola Corporation | 1001 |
| Nikola Corporation | 1002 |
| Oberthur Technologies | 1002 |
| Oberthur Technologies | 1003 |
| General Telephone & Electronics | 1003 |
| General Telephone & Electronics | 1000 |

**Table `agencies_agencies`**

| agency_id | collaborates_with_agency_id |
|---|---|
| U.S. Steel | U.S. Steel |
| U.S. Steel | Nikola Corporation |
| Nikola Corporation | Nikola Corporation |
| Nikola Corporation | Oberthur Technologies |
| Oberthur Technologies | Oberthur Technologies |
| Oberthur Technologies | General Telephone & Electronics |
| General Telephone & Electronics | General Telephone & Electronics |
| General Telephone & Electronics | U.S. Steel |

**Table `documents_agencies`**

| policy_document_policy_ref | agency_id |
|---|---|
| 8189490 | U.S. Steel |
| 8189490 | Nikola Corporation |
| 1450659 | Nikola Corporation |
| 1450659 | Oberthur Technologies |
| 937738 | Oberthur Technologies |
| 937738 | General Telephone & Electronics |
| 4277030 | General Telephone & Electronics |
| 4277030 | U.S. Steel |

These junction tables establish the operational connections that transform isolated records into a coherent service delivery network. Inspections_services links regulatory reviews to the services they evaluate, while agencies_services maps which organizations are responsible for which programs. The assessments_users and services_users tables connect individuals to their formal evaluations and assigned services, and agencies_agencies captures inter-organizational relationships that may indicate partnerships or hierarchical structures. Documents_agencies ties policy frameworks to the agencies they govern, ensuring that every organization operates under a documented regulatory umbrella.

## Detailed Service and Inspection Records

The detail views synthesize the base tables into comprehensive records that answer specific operational questions. Each view joins multiple entities to provide a complete picture of a particular aspect of the care delivery chain.

**View `service_inspection_social_care_service_detail_view`**

```sql
CREATE VIEW service_inspection_social_care_service_detail_view AS
SELECT a.id, a.inspection_id, a.inspection_date, b.service_code AS service_service_code, b.service_name AS service_service_name, b.service_type AS service_service_type
FROM service_inspections a
  JOIN inspections_services j ON j.service_inspection_id = a.id
  JOIN social_care_services b ON b.service_code = j.service_code;
```

| id | inspection_id | inspection_date | service_service_code | service_service_name | service_service_type |
|---|---|---|---|---|---|
| 1 | BJanecke | 2025-12-03T23:09:00 | 20789856 | Distributed Initiative | personal_care |
| 1 | BJanecke | 2025-12-03T23:09:00 | 3990167 | Adaptive Model D | child_care |
| 2 | 575199 | 2022-05-14T06:26:00 | 3990167 | Adaptive Model D | child_care |
| 2 | 575199 | 2022-05-14T06:26:00 | 14484998 | Primary Cluster | family_support |
| 3 | state_uk_4 | 2023-10-25T13:43:00 | 14484998 | Primary Cluster | family_support |
| 3 | state_uk_4 | 2023-10-25T13:43:00 | Total | Composite Review | multi_purpose |
| 4 | 8350011 | 2024-03-09T20:00:00 | Total | Composite Review | multi_purpose |
| 4 | 8350011 | 2024-03-09T20:00:00 | 20789856 | Distributed Initiative | personal_care |

This view answers the question of which services fall under which inspection and what the inspection findings were. A row from this view might show that the inspection with identifier BJanecke, conducted under national scope, evaluated the Distributed Initiative service (code 20789856), with findings summarized as pilot-findings-32. The view surfaces the inspection date, status, and the service's type and delivery mode in a single record, enabling auditors to assess whether the inspection scope was appropriate for the service characteristics.

**View `service_inspection_policy_document_view`**

```sql
CREATE VIEW service_inspection_policy_document_view AS
SELECT a.id, a.inspection_id, a.inspection_date, a.inspection_status, b.policy_ref AS document_policy_ref, b.policy_title AS document_policy_title, b.publish_date AS document_publish_date
FROM service_inspections a JOIN policy_documents b ON a.policy_document_policy_ref = b.policy_ref;
```

| id | inspection_id | inspection_date | inspection_status | document_policy_ref | document_policy_title | document_publish_date |
|---|---|---|---|---|---|---|
| 1 | BJanecke | 2025-12-03T23:09:00 | planned | 8189490 | Baseline Initiative D | 2023-06-06 |
| 2 | 575199 | 2022-05-14T06:26:00 | in_progress | 1450659 | Distributed Model | 2024-11-17 |
| 3 | state_uk_4 | 2023-10-25T13:43:00 | completed | 937738 | Adaptive Cluster | 2025-04-01 |
| 4 | 8350011 | 2024-03-09T20:00:00 | archived | 4277030 | Primary Review A | 2022-09-12 |

This view links inspections directly to their governing policy documents. It reveals, for example, that inspection 575199 (status in_progress, scope local_authority) was conducted under the Distributed Model policy (ref 1450659), published in November 2024 and governed by the Social Care Act. The is_mandatory flag on the policy document indicates whether compliance with this specific policy is a binding requirement for the inspection outcome.

**View `social_care_service_service_agency_view`**

```sql
CREATE VIEW social_care_service_service_agency_view AS
SELECT a.service_code, a.service_name, a.service_type, a.delivery_mode, b.agency_id AS agency_agency_id, b.agency_name AS agency_agency_name, b.agency_type AS agency_agency_type
FROM social_care_services a JOIN service_agencies b ON a.agency_id = b.agency_id;
```

| service_code | service_name | service_type | delivery_mode | agency_agency_id | agency_agency_name | agency_agency_type |
|---|---|---|---|---|---|---|
| 20789856 | Distributed Initiative | personal_care | in_home | U.S. Steel | FSG Social Impact Advisors | local_council |
| 3990167 | Adaptive Model D | child_care | centre_based | Nikola Corporation | Whirlpool Corporation | voluntary_org |
| 14484998 | Primary Cluster | family_support | community | Oberthur Technologies | Education Writers Association | private_agency |
| Total | Composite Review | multi_purpose | in_home | General Telephone & Electronics | Switch Card Services Ltd. | local_council |

This view maps services to their responsible agencies, answering which organization delivers which program. The Distributed Initiative service (personal_care, in_home) is delivered by FSG Social Impact Advisors, a local_council agency operating under regional-jurisdic-30 jurisdiction. The view also surfaces whether the agency has specific policy documentation and whether it has adopted the social model, providing context for understanding the service's governance structure.

**View `social_care_service_service_user_detail_view`**

```sql
CREATE VIEW social_care_service_service_user_detail_view AS
SELECT a.service_code, a.service_name, a.service_type, b.id AS user_id, b.user_id AS user_user_id, b.user_type AS user_user_type
FROM social_care_services a
  JOIN services_users j ON j.service_code = a.service_code
  JOIN service_users b ON b.id = j.service_user_id;
```

| service_code | service_name | service_type | user_id | user_user_id | user_user_type |
|---|---|---|---|---|---|
| 20789856 | Distributed Initiative | personal_care | 1 | 9736910 | disabled_parent |
| 20789856 | Distributed Initiative | personal_care | 2 | 40c1e50ce74c42d6801b1e2f409c1cfc | child |
| 3990167 | Adaptive Model D | child_care | 2 | 40c1e50ce74c42d6801b1e2f409c1cfc | child |
| 3990167 | Adaptive Model D | child_care | 3 | 92297f70-9bad-11eb-a8a2-19ed5c03f8d3 | carer |
| 14484998 | Primary Cluster | family_support | 3 | 92297f70-9bad-11eb-a8a2-19ed5c03f8d3 | carer |
| 14484998 | Primary Cluster | family_support | 4 | 9125634 | disabled_parent |
| Total | Composite Review | multi_purpose | 4 | 9125634 | disabled_parent |
| Total | Composite Review | multi_purpose | 1 | 9736910 | disabled_parent |

This view connects individual service users to the services they receive, enriched with service-level details. A representative row would show that service user 9736910, classified as a disabled_parent with parenting_status active_parent, is receiving the Distributed Initiative service (20789856), which is a personal_care service delivered in_home. The view also includes the needs_assessment_id, linking the user's current service to their formal assessment record.

**View `social_care_service_needs_assessment_view`**

```sql
CREATE VIEW social_care_service_needs_assessment_view AS
SELECT a.service_code, a.service_name, a.service_type, a.delivery_mode, b.id AS assessment_id, b.assessment_id AS assessment_assessment_id, b.assessment_date AS assessment_assessment_date
FROM social_care_services a JOIN needs_assessments b ON a.needs_assessment_id = b.id;
```

| service_code | service_name | service_type | delivery_mode | assessment_id | assessment_assessment_id | assessment_assessment_date |
|---|---|---|---|---|---|---|
| 20789856 | Distributed Initiative | personal_care | in_home | 1000 | template_ivacode_pagata_20det40ind | 2022-05-10T04:24:00 |
| 3990167 | Adaptive Model D | child_care | centre_based | 1001 | 19508914 | 2023-10-21T11:41:00 |
| 14484998 | Primary Cluster | family_support | community | 1002 | 506000 | 2024-03-05T18:58:00 |
| Total | Composite Review | multi_purpose | in_home | 1003 | 1204-0009-M | 2025-08-16T01:15:00 |

This view associates each service with its corresponding needs assessment, revealing the eligibility determination for the service's primary beneficiary. The Distributed Initiative service (20789856) is linked to assessment template_ivacode_pagata_20det40ind, which identified 47 needs and resulted in an eligible outcome. The assessment type (holistic) and whether it was service_led provide additional context about how the eligibility determination was reached.

**View `service_user_social_care_service_detail_view`**

```sql
CREATE VIEW service_user_social_care_service_detail_view AS
SELECT a.id, a.user_id, a.user_type, b.service_code AS service_service_code, b.service_name AS service_service_name, b.service_type AS service_service_type
FROM service_users a
  JOIN users_services j ON j.service_user_id = a.id
  JOIN social_care_services b ON b.service_code = j.service_code;
```

| id | user_id | user_type | service_service_code | service_service_name | service_service_type |
|---|---|---|---|---|---|
| 1 | 9736910 | disabled_parent | 20789856 | Distributed Initiative | personal_care |
| 1 | 9736910 | disabled_parent | 3990167 | Adaptive Model D | child_care |
| 2 | 40c1e50ce74c42d6801b1e2f409c1cfc | child | 3990167 | Adaptive Model D | child_care |
| 2 | 40c1e50ce74c42d6801b1e2f409c1cfc | child | 14484998 | Primary Cluster | family_support |
| 3 | 92297f70-9bad-11eb-a8a2-19ed5c03f8d3 | carer | 14484998 | Primary Cluster | family_support |
| 3 | 92297f70-9bad-11eb-a8a2-19ed5c03f8d3 | carer | Total | Composite Review | multi_purpose |
| 4 | 9125634 | disabled_parent | Total | Composite Review | multi_purpose |
| 4 | 9125634 | disabled_parent | 20789856 | Distributed Initiative | personal_care |

This view presents the service user's perspective, showing the individual's characteristics alongside the service they receive. Service user 40c1e50ce74c42d6801b1e2f409c1cfc, a child with a physical disability and expectant_parent status, is enrolled in the Adaptive Model D service (3990167), which is a child_care service delivered centre_based. The needs_acknowledged flag for this user is true, indicating their requirements have been formally recognized.

**View `service_user_service_user_view`**

```sql
CREATE VIEW service_user_service_user_view AS
SELECT a.id, a.user_id, a.user_type, a.has_disability, b.id AS user_id, b.user_id AS user_user_id, b.user_type AS user_user_type
FROM service_users a JOIN service_users b ON a.service_user_id = b.id;
```

| id | user_id | user_type | has_disability | user_id | user_user_id | user_user_type |
|---|---|---|---|---|---|---|
| 1 | 9736910 | disabled_parent | false | 1 | 9736910 | disabled_parent |
| 2 | 40c1e50ce74c42d6801b1e2f409c1cfc | child | true | 2 | 40c1e50ce74c42d6801b1e2f409c1cfc | child |
| 3 | 92297f70-9bad-11eb-a8a2-19ed5c03f8d3 | carer | false | 3 | 92297f70-9bad-11eb-a8a2-19ed5c03f8d3 | carer |
| 4 | 9125634 | disabled_parent | true | 4 | 9125634 | disabled_parent |

This view captures relationships between service users, potentially indicating shared services or coordinated care arrangements. It enables the identification of user clusters that may benefit from integrated service planning, such as multiple users receiving services from the same agency or sharing similar assessment outcomes.

**View `service_user_needs_assessment_view`**

```sql
CREATE VIEW service_user_needs_assessment_view AS
SELECT a.id, a.user_id, a.user_type, a.has_disability, b.id AS assessment_id, b.assessment_id AS assessment_assessment_id, b.assessment_date AS assessment_assessment_date
FROM service_users a JOIN needs_assessments b ON a.needs_assessment_id = b.id;
```

| id | user_id | user_type | has_disability | assessment_id | assessment_assessment_id | assessment_assessment_date |
|---|---|---|---|---|---|---|
| 1 | 9736910 | disabled_parent | false | 1000 | template_ivacode_pagata_20det40ind | 2022-05-10T04:24:00 |
| 2 | 40c1e50ce74c42d6801b1e2f409c1cfc | child | true | 1001 | 19508914 | 2023-10-21T11:41:00 |
| 3 | 92297f70-9bad-11eb-a8a2-19ed5c03f8d3 | carer | false | 1002 | 506000 | 2024-03-05T18:58:00 |
| 4 | 9125634 | disabled_parent | true | 1003 | 1204-0009-M | 2025-08-16T01:15:00 |

This view links individual users to their needs assessments, providing a complete picture of the evaluation that determined their eligibility. Service user 92297f70-9bad-11eb-a8a2-19ed5c03f8d3, a carer with sensory disability and non_parent status, is associated with assessment 506000, which is a child_focused assessment with outcome pending_review and 65 identified needs.

**View `needs_assessment_service_user_detail_view`**

```sql
CREATE VIEW needs_assessment_service_user_detail_view AS
SELECT a.id, a.assessment_id, a.assessment_date, b.id AS user_id, b.user_id AS user_user_id, b.user_type AS user_user_type
FROM needs_assessments a
  JOIN assessments_users j ON j.needs_assessment_id = a.id
  JOIN service_users b ON b.id = j.service_user_id;
```

| id | assessment_id | assessment_date | user_id | user_user_id | user_user_type |
|---|---|---|---|---|---|
| 1000 | template_ivacode_pagata_20det40ind | 2022-05-10T04:24:00 | 1 | 9736910 | disabled_parent |
| 1000 | template_ivacode_pagata_20det40ind | 2022-05-10T04:24:00 | 2 | 40c1e50ce74c42d6801b1e2f409c1cfc | child |
| 1001 | 19508914 | 2023-10-21T11:41:00 | 2 | 40c1e50ce74c42d6801b1e2f409c1cfc | child |
| 1001 | 19508914 | 2023-10-21T11:41:00 | 3 | 92297f70-9bad-11eb-a8a2-19ed5c03f8d3 | carer |
| 1002 | 506000 | 2024-03-05T18:58:00 | 3 | 92297f70-9bad-11eb-a8a2-19ed5c03f8d3 | carer |
| 1002 | 506000 | 2024-03-05T18:58:00 | 4 | 9125634 | disabled_parent |
| 1003 | 1204-0009-M | 2025-08-16T01:15:00 | 4 | 9125634 | disabled_parent |
| 1003 | 1204-0009-M | 2025-08-16T01:15:00 | 1 | 9736910 | disabled_parent |

This view presents the needs assessment from the user's perspective, showing the assessment details alongside the characteristics of the individual being assessed. Assessment 1204-0009-M, a holistic assessment conducted on August 16, 2025, identified 74 needs and resulted in an eligible outcome for the associated service user. The assessment was service_led and conducted under the General Telephone & Electronics agency.

**View `needs_assessment_service_agency_view`**

```sql
CREATE VIEW needs_assessment_service_agency_view AS
SELECT a.id, a.assessment_id, a.assessment_date, a.assessment_type, b.agency_id AS agency_agency_id, b.agency_name AS agency_agency_name, b.agency_type AS agency_agency_type
FROM needs_assessments a JOIN service_agencies b ON a.agency_id = b.agency_id;
```

| id | assessment_id | assessment_date | assessment_type | agency_agency_id | agency_agency_name | agency_agency_type |
|---|---|---|---|---|---|---|
| 1000 | template_ivacode_pagata_20det40ind | 2022-05-10T04:24:00 | holistic | U.S. Steel | FSG Social Impact Advisors | local_council |
| 1001 | 19508914 | 2023-10-21T11:41:00 | adult_focused | Nikola Corporation | Whirlpool Corporation | voluntary_org |
| 1002 | 506000 | 2024-03-05T18:58:00 | child_focused | Oberthur Technologies | Education Writers Association | private_agency |
| 1003 | 1204-0009-M | 2025-08-16T01:15:00 | holistic | General Telephone & Electronics | Switch Card Services Ltd. | local_council |

This view connects assessments to the agencies that conducted them, revealing which organizations are responsible for which evaluations. The assessment 19508914, an adult_focused assessment with ineligible outcome, was conducted by Nikola Corporation, a voluntary_org agency. The view also surfaces the service code associated with the assessment, linking the evaluation to the specific program for which eligibility was determined.

**View `needs_assessment_social_care_service_view`**

```sql
CREATE VIEW needs_assessment_social_care_service_view AS
SELECT a.id, a.assessment_id, a.assessment_date, a.assessment_type, b.service_code AS service_service_code, b.service_name AS service_service_name, b.service_type AS service_service_type
FROM needs_assessments a JOIN social_care_services b ON a.service_code = b.service_code;
```

| id | assessment_id | assessment_date | assessment_type | service_service_code | service_service_name | service_service_type |
|---|---|---|---|---|---|---|
| 1000 | template_ivacode_pagata_20det40ind | 2022-05-10T04:24:00 | holistic | 20789856 | Distributed Initiative | personal_care |
| 1001 | 19508914 | 2023-10-21T11:41:00 | adult_focused | 3990167 | Adaptive Model D | child_care |
| 1002 | 506000 | 2024-03-05T18:58:00 | child_focused | 14484998 | Primary Cluster | family_support |
| 1003 | 1204-0009-M | 2025-08-16T01:15:00 | holistic | Total | Composite Review | multi_purpose |

This view ties needs assessments directly to the services they evaluate, showing the assessment outcome in the context of the service type and delivery mode. Assessment 506000, with outcome pending_review, is associated with the Primary Cluster service (14484998), a family_support service delivered in the community. The assessment was holistic in type and not service_led.

## Agency and Policy Oversight

The remaining views focus on the organizational and regulatory dimensions of the system, connecting agencies to their services, assessments, and governing policies.

**View `service_agency_social_care_service_detail_view`**

```sql
CREATE VIEW service_agency_social_care_service_detail_view AS
SELECT a.agency_id, a.agency_name, a.agency_type, b.service_code AS service_service_code, b.service_name AS service_service_name, b.service_type AS service_service_type
FROM service_agencies a
  JOIN agencies_services j ON j.agency_id = a.agency_id
  JOIN social_care_services b ON b.service_code = j.service_code;
```

| agency_id | agency_name | agency_type | service_service_code | service_service_name | service_service_type |
|---|---|---|---|---|---|
| U.S. Steel | FSG Social Impact Advisors | local_council | 20789856 | Distributed Initiative | personal_care |
| U.S. Steel | FSG Social Impact Advisors | local_council | 3990167 | Adaptive Model D | child_care |
| Nikola Corporation | Whirlpool Corporation | voluntary_org | 3990167 | Adaptive Model D | child_care |
| Nikola Corporation | Whirlpool Corporation | voluntary_org | 14484998 | Primary Cluster | family_support |
| Oberthur Technologies | Education Writers Association | private_agency | 14484998 | Primary Cluster | family_support |
| Oberthur Technologies | Education Writers Association | private_agency | Total | Composite Review | multi_purpose |
| General Telephone & Electronics | Switch Card Services Ltd. | local_council | Total | Composite Review | multi_purpose |
| General Telephone & Electronics | Switch Card Services Ltd. | local_council | 20789856 | Distributed Initiative | personal_care |

This view presents the service agency alongside the services it delivers, providing a comprehensive organizational profile. FSG Social Impact Advisors (agency_id U.S. Steel), a local_council agency with regional-jurisdic-30 jurisdiction, delivers the Distributed Initiative service (20789856), a personal_care service delivered in_home. The view also surfaces whether the agency has adopted the social model and maintains specific policy documentation.

**View `service_agency_needs_assessment_detail_view`**

```sql
CREATE VIEW service_agency_needs_assessment_detail_view AS
SELECT a.agency_id, a.agency_name, a.agency_type, b.id AS assessment_id, b.assessment_id AS assessment_assessment_id, b.assessment_date AS assessment_assessment_date
FROM service_agencies a
  JOIN agencies_assessments j ON j.agency_id = a.agency_id
  JOIN needs_assessments b ON b.id = j.needs_assessment_id;
```

| agency_id | agency_name | agency_type | assessment_id | assessment_assessment_id | assessment_assessment_date |
|---|---|---|---|---|---|
| U.S. Steel | FSG Social Impact Advisors | local_council | 1000 | template_ivacode_pagata_20det40ind | 2022-05-10T04:24:00 |
| U.S. Steel | FSG Social Impact Advisors | local_council | 1001 | 19508914 | 2023-10-21T11:41:00 |
| Nikola Corporation | Whirlpool Corporation | voluntary_org | 1001 | 19508914 | 2023-10-21T11:41:00 |
| Nikola Corporation | Whirlpool Corporation | voluntary_org | 1002 | 506000 | 2024-03-05T18:58:00 |
| Oberthur Technologies | Education Writers Association | private_agency | 1002 | 506000 | 2024-03-05T18:58:00 |
| Oberthur Technologies | Education Writers Association | private_agency | 1003 | 1204-0009-M | 2025-08-16T01:15:00 |
| General Telephone & Electronics | Switch Card Services Ltd. | local_council | 1003 | 1204-0009-M | 2025-08-16T01:15:00 |
| General Telephone & Electronics | Switch Card Services Ltd. | local_council | 1000 | template_ivacode_pagata_20det40ind | 2022-05-10T04:24:00 |

This view links agencies to the needs assessments they conduct, showing the assessment outcomes in the context of the agency's profile. The agency Oberthur Technologies, a private_agency operating under compact-jurisdic-32, conducted assessment 506000, which had a child_focused type and pending_review outcome. The assessment identified 65 needs and was not service_led.

**View `service_agency_service_agency_detail_view`**

```sql
CREATE VIEW service_agency_service_agency_detail_view AS
SELECT a.agency_id, a.agency_name, a.agency_type, b.agency_id AS agency_agency_id, b.agency_name AS agency_agency_name, b.agency_type AS agency_agency_type
FROM service_agencies a
  JOIN agencies_agencies j ON j.agency_id = a.agency_id
  JOIN service_agencies b ON b.agency_id = j.collaborates_with_agency_id;
```

| agency_id | agency_name | agency_type | agency_agency_id | agency_agency_name | agency_agency_type |
|---|---|---|---|---|---|
| U.S. Steel | FSG Social Impact Advisors | local_council | U.S. Steel | FSG Social Impact Advisors | local_council |
| U.S. Steel | FSG Social Impact Advisors | local_council | Nikola Corporation | Whirlpool Corporation | voluntary_org |
| Nikola Corporation | Whirlpool Corporation | voluntary_org | Nikola Corporation | Whirlpool Corporation | voluntary_org |
| Nikola Corporation | Whirlpool Corporation | voluntary_org | Oberthur Technologies | Education Writers Association | private_agency |
| Oberthur Technologies | Education Writers Association | private_agency | Oberthur Technologies | Education Writers Association | private_agency |
| Oberthur Technologies | Education Writers Association | private_agency | General Telephone & Electronics | Switch Card Services Ltd. | local_council |
| General Telephone & Electronics | Switch Card Services Ltd. | local_council | General Telephone & Electronics | Switch Card Services Ltd. | local_council |
| General Telephone & Electronics | Switch Card Services Ltd. | local_council | U.S. Steel | FSG Social Impact Advisors | local_council |

This view captures inter-agency relationships, revealing partnerships or hierarchical structures between organizations. It enables the identification of agency networks that may coordinate service delivery or share policy frameworks, providing insight into the organizational ecology of the social care system.

**View `policy_document_service_agency_detail_view`**

```sql
CREATE VIEW policy_document_service_agency_detail_view AS
SELECT a.policy_ref, a.policy_title, a.publish_date, b.agency_id AS agency_agency_id, b.agency_name AS agency_agency_name, b.agency_type AS agency_agency_type
FROM policy_documents a
  JOIN documents_agencies j ON j.policy_document_policy_ref = a.policy_ref
  JOIN service_agencies b ON b.agency_id = j.agency_id;
```

| policy_ref | policy_title | publish_date | agency_agency_id | agency_agency_name | agency_agency_type |
|---|---|---|---|---|---|
| 8189490 | Baseline Initiative D | 2023-06-06 | U.S. Steel | FSG Social Impact Advisors | local_council |
| 8189490 | Baseline Initiative D | 2023-06-06 | Nikola Corporation | Whirlpool Corporation | voluntary_org |
| 1450659 | Distributed Model | 2024-11-17 | Nikola Corporation | Whirlpool Corporation | voluntary_org |
| 1450659 | Distributed Model | 2024-11-17 | Oberthur Technologies | Education Writers Association | private_agency |
| 937738 | Adaptive Cluster | 2025-04-01 | Oberthur Technologies | Education Writers Association | private_agency |
| 937738 | Adaptive Cluster | 2025-04-01 | General Telephone & Electronics | Switch Card Services Ltd. | local_council |
| 4277030 | Primary Review A | 2022-09-12 | General Telephone & Electronics | Switch Card Services Ltd. | local_council |
| 4277030 | Primary Review A | 2022-09-12 | U.S. Steel | FSG Social Impact Advisors | local_council |

This view connects policy documents to the agencies they govern, showing which organizations are subject to which regulatory frameworks. Policy document 8189490, titled Baseline Initiative D and published in June 2023, governs agencies operating under national scope and references the Children Act 1989. The is_mandatory flag indicates that compliance with this policy is a binding requirement.

**View `policy_document_social_care_service_view`**

```sql
CREATE VIEW policy_document_social_care_service_view AS
SELECT a.policy_ref, a.policy_title, a.publish_date, a.policy_scope, b.service_code AS service_service_code, b.service_name AS service_service_name, b.service_type AS service_service_type
FROM policy_documents a JOIN social_care_services b ON a.service_code = b.service_code;
```

| policy_ref | policy_title | publish_date | policy_scope | service_service_code | service_service_name | service_service_type |
|---|---|---|---|---|---|---|
| 8189490 | Baseline Initiative D | 2023-06-06 | national | 20789856 | Distributed Initiative | personal_care |
| 1450659 | Distributed Model | 2024-11-17 | local | 3990167 | Adaptive Model D | child_care |
| 937738 | Adaptive Cluster | 2025-04-01 | agency_specific | 14484998 | Primary Cluster | family_support |
| 4277030 | Primary Review A | 2022-09-12 | national | Total | Composite Review | multi_purpose |

This view links policy documents to the services they regulate, showing the service type and delivery mode in the context of the governing policy. Policy 1450659, the Distributed Model published in November 2024 under the Social Care Act, governs the Adaptive Model D service (3990167), a child_care service delivered centre_based. The policy is not mandatory, indicating it provides advisory rather than binding guidance.

**View `policy_document_service_inspection_view`**

```sql
CREATE VIEW policy_document_service_inspection_view AS
SELECT a.policy_ref, a.policy_title, a.publish_date, a.policy_scope, b.id AS inspection_id, b.inspection_id AS inspection_inspection_id, b.inspection_date AS inspection_inspection_date
FROM policy_documents a JOIN service_inspections b ON a.service_inspection_id = b.id;
```

| policy_ref | policy_title | publish_date | policy_scope | inspection_id | inspection_inspection_id | inspection_inspection_date |
|---|---|---|---|---|---|---|
| 8189490 | Baseline Initiative D | 2023-06-06 | national | 1 | BJanecke | 2025-12-03T23:09:00 |
| 1450659 | Distributed Model | 2024-11-17 | local | 2 | 575199 | 2022-05-14T06:26:00 |
| 937738 | Adaptive Cluster | 2025-04-01 | agency_specific | 3 | state_uk_4 | 2023-10-25T13:43:00 |
| 4277030 | Primary Review A | 2022-09-12 | national | 4 | 8350011 | 2024-03-09T20:00:00 |

This view ties policy documents to the inspections that enforce them, showing the inspection scope and findings in the context of the governing policy. Inspection 8350011, an archived national-scope inspection with seasonal-findings-35, was conducted under policy 4277030 (Primary Review A), which references the Social Care Act and is not mandatory. The policy was published in September 2022 and governs the service identified by code Total.

## Synthesis

The social care domain operates as an interconnected system where agencies deliver services to users, needs assessments determine eligibility, and inspections verify compliance with policy documents. Each entity in the system—whether a service, an agency, a user, or a policy—exists in relationship to others, and the junction tables and detail views capture these relationships in structured form. The inspection records provide the regulatory oversight mechanism, the assessments provide the eligibility determination mechanism, and the service records provide the delivery mechanism. Together, they form a coherent framework for understanding how social care is organized, delivered, and regulated. The data reflects a system where accountability flows from policy documents through agencies and services to individual users, with inspections serving as the verification point that closes the loop.