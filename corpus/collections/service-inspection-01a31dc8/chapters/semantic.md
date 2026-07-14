The social care domain under examination is a multi-stakeholder ecosystem in which regulatory inspections, policy documents, service agencies, care services, needs assessments, and service users intersect through a web of formalised relationships. At its core, the domain distinguishes six principal entity types—`service_inspections`, `social_care_services`, `service_users`, `needs_assessments`, `service_agencies`, and `policy_documents`—each materialised as a base table with a stable primary key and a set of attribute columns that capture the entity's intrinsic properties. These entities are then connected through eight junction tables that resolve many-to-many associations, and finally exposed through seventeen denormalised views that reconstruct domain facts by joining the normalised tables back together. The chapter walks through the entity model, the junction-layer, and the view layer in turn, grounding every structural claim in the actual row values present in the data.

## Base Entity Types

The foundation of the model consists of six tables, each representing a distinct concept in the social care domain.

**Table `service_inspections`**

| id | inspection_id | inspection_date | inspection_status | inspection_scope | findings_summary | policy_document_policy_ref |
|---|---|---|---|---|---|---|
| 1 | BJanecke | 2025-12-03T23:09:00 | planned | national | pilot-findings-32 | 8189490 |
| 2 | 575199 | 2022-05-14T06:26:00 | in_progress | local_authority | extended-findings-33 | 1450659 |
| 3 | state_uk_4 | 2023-10-25T13:43:00 | completed | agency_specific | integrated-findings-34 | 937738 |
| 4 | 8350011 | 2024-03-09T20:00:00 | archived | national | seasonal-findings-35 | 4277030 |

The `service_inspections` table captures regulatory oversight events. Its surrogate key `id` is an integer, while the business identifier `inspection_id` carries human-readable codes such as `BJanecke` and `state_uk_4`. The `inspection_date` column stores timestamps like `2025-12-03T23:09:00`, and `inspection_status` is an enumerated attribute taking values `planned`, `in_progress`, `completed`, and `archived`. The `inspection_scope` column distinguishes between `national`, `local_authority`, and `agency_specific` inspections, while `findings_summary` holds free-text summaries such as `pilot-findings-32`. The foreign key `policy_document_policy_ref` links each inspection to a policy document, referencing the `policy_ref` column of the `policy_documents` table.

**Table `social_care_services`**

| service_code | service_name | service_type | delivery_mode | is_integrated | eligibility_criteria | agency_id | needs_assessment_id |
|---|---|---|---|---|---|---|---|
| 20789856 | Distributed Initiative | personal_care | in_home | true | composite-eligibil-57 | U.S. Steel | 1000 |
| 3990167 | Adaptive Model D | child_care | centre_based | false | primary-eligibil-58 | Nikola Corporation | 1001 |
| 14484998 | Primary Cluster | family_support | community | true | adaptive-eligibil-59 | Oberthur Technologies | 1002 |
| Total | Composite Review | multi_purpose | in_home | false | distributed-eligibil-60 | General Telephone & Electronics | 1003 |

The `social_care_services` table describes individual care services. Its primary key `service_code` is an integer (e.g., `20789856`, `3990167`), and the `service_name` column carries descriptive labels like `Distributed Initiative` and `Adaptive Model D`. The `service_type` attribute takes values such as `personal_care`, `child_care`, `family_support`, and `multi_purpose`. The `delivery_mode` column distinguishes between `in_home`, `centre_based`, and `community` delivery. A boolean column `is_integrated` indicates whether the service is integrated, while `eligibility_criteria` stores coded strings like `composite-eligibil-57`. The foreign key `agency_id` references `service_agencies.agency_id`, and `needs_assessment_id` references `needs_assessments.id`, establishing direct one-to-many relationships from agencies and assessments to services.

**Table `service_users`**

| id | user_id | user_type | has_disability | disability_type | parenting_status | needs_acknowledged | service_user_id | needs_assessment_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 9736910 | disabled_parent | false | learning | active_parent | false | 1 | 1000 |
| 2 | 40c1e50ce74c42d6801b1e2f409c1cfc | child | true | physical | expectant_parent | true | 2 | 1001 |
| 3 | 92297f70-9bad-11eb-a8a2-19ed5c03f8d3 | carer | false | sensory | non_parent | false | 3 | 1002 |
| 4 | 9125634 | disabled_parent | true | chronic_sickness | active_parent | true | 4 | 1003 |

The `service_users` table records individuals who receive or are eligible for care services. Its surrogate key `id` is an integer, while `user_id` carries diverse identifier formats: a plain integer like `9736910`, a UUID-style string such as `40c1e50ce74c42d6801b1e2f409c1cfc`, and a full UUID like `92297f70-9bad-11eb-a8a2-19ed5c03f8d3`. The `user_type` column distinguishes `disabled_parent`, `child`, and `carer` roles. Boolean column `has_disability` and categorical column `disability_type` (with values `learning`, `physical`, `sensory`, `chronic_sickness`) capture health attributes. The `parenting_status` column takes values `active_parent`, `expectant_parent`, and `non_parent`. The boolean `needs_acknowledged` indicates whether the user's needs have been formally recognised. Foreign keys `service_user_id` and `needs_assessment_id` link the user to a service and an assessment respectively.

**Table `needs_assessments`**

| id | assessment_id | assessment_date | assessment_type | is_service_led | needs_identified | assessment_outcome | agency_id | service_code |
|---|---|---|---|---|---|---|---|---|
| 1000 | template_ivacode_pagata_20det40ind | 2022-05-10T04:24:00 | holistic | false | 47 | eligible | U.S. Steel | 20789856 |
| 1001 | 19508914 | 2023-10-21T11:41:00 | adult_focused | true | 56 | ineligible | Nikola Corporation | 3990167 |
| 1002 | 506000 | 2024-03-05T18:58:00 | child_focused | false | 65 | pending_review | Oberthur Technologies | 14484998 |
| 1003 | 1204-0009-M | 2025-08-16T01:15:00 | holistic | true | 74 | eligible | General Telephone & Electronics | Total |

The `needs_assessments` table documents formal assessments of care needs. Its surrogate key `id` is an integer (e.g., `1000`, `1001`), while `assessment_id` carries human-readable codes such as `template_ivacode_pagata_20det40ind` and `1204-0009-M`. The `assessment_date` column stores timestamps, and `assessment_type` distinguishes `holistic`, `adult_focused`, and `child_focused` assessments. The boolean `is_service_led` indicates whether the assessment was driven by the service provider. The integer column `needs_identified` records a count of identified needs (values range from `47` to `74`), and `assessment_outcome` takes values `eligible`, `ineligible`, and `pending_review`. Foreign keys `agency_id` and `service_code` link the assessment to a service agency and a social care service respectively.

**Table `service_agencies`**

| agency_id | agency_name | agency_type | has_specific_policy | jurisdiction | adoption_of_social_model | created_at | updated_at |
|---|---|---|---|---|---|---|---|
| U.S. Steel | FSG Social Impact Advisors | local_council | false | regional-jurisdic-30 | true | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| Nikola Corporation | Whirlpool Corporation | voluntary_org | true | legacy-jurisdic-31 | false | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| Oberthur Technologies | Education Writers Association | private_agency | false | compact-jurisdic-32 | true | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| General Telephone & Electronics | Switch Card Services Ltd. | local_council | true | composite-jurisdic-33 | false | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The `service_agencies` table describes the organisations that deliver or regulate care services. Its primary key `agency_id` is a string (e.g., `U.S. Steel`, `Nikola Corporation`, `Oberthur Technologies`, `General Telephone & Electronics`). The `agency_name` column carries the organisation's display name, such as `FSG Social Impact Advisors` and `Whirlpool Corporation`. The `agency_type` column distinguishes `local_council`, `voluntary_org`, and `private_agency`. Boolean column `has_specific_policy` indicates whether the agency maintains its own policy document, while `jurisdiction` stores coded strings like `regional-jurisdic-30`. The boolean `adoption_of_social_model` records whether the agency follows the social model of disability. Timestamp columns `created_at` and `updated_at` track the entity's lifecycle.

**Table `policy_documents`**

| policy_ref | policy_title | publish_date | policy_scope | legislation_reference | is_mandatory | service_code | service_inspection_id |
|---|---|---|---|---|---|---|---|
| 8189490 | Baseline Initiative D | 2023-06-06 | national | Children Act 1989 | true | 20789856 | 1 |
| 1450659 | Distributed Model | 2024-11-17 | local | Social Care Act | false | 3990167 | 2 |
| 937738 | Adaptive Cluster | 2025-04-01 | agency_specific | Children Act 1989 | true | 14484998 | 3 |
| 4277030 | Primary Review A | 2022-09-12 | national | Social Care Act | false | Total | 4 |

The `policy_documents` table stores the regulatory and policy instruments that govern care services. Its primary key `policy_ref` is an integer (e.g., `8189490`, `1450659`). The `policy_title` column carries descriptive names like `Baseline Initiative D` and `Distributed Model`. The `publish_date` column stores dates, and `policy_scope` distinguishes `national`, `local`, and `agency_specific` documents. The `legislation_reference` column cites relevant statutes such as `Children Act 1989` and `Social Care Act`. Boolean column `is_mandatory` indicates whether compliance is compulsory. Foreign keys `service_code` and `service_inspection_id` link the document to a social care service and a service inspection respectively.

## Junction Tables

The six base entities are connected through eight junction tables that resolve many-to-many relationships. These tables contain pairs of foreign keys that reference the primary keys of the entities they connect.

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

The `inspections_services` junction table links `service_inspections` to `social_care_services`, enabling a single inspection to cover multiple services and a single service to be subject to multiple inspections.

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

The `services_users` junction table connects `social_care_services` to `service_users`, allowing a service to serve multiple users and a user to receive multiple services.

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

The `users_services` junction table provides a second association between `service_users` and `social_care_services`, potentially capturing a different semantic relationship or directionality of the user-service association.

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

The `assessments_users` junction table links `needs_assessments` to `service_users`, enabling a single assessment to cover multiple users and a user to be subject to multiple assessments.

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

The `agencies_services` junction table connects `service_agencies` to `social_care_services`, allowing an agency to deliver multiple services and a service to be delivered by multiple agencies.

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

The `agencies_assessments` junction table links `service_agencies` to `needs_assessments`, enabling an agency to conduct multiple assessments and an assessment to involve multiple agencies.

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

The `agencies_agencies` junction table creates a self-referential many-to-many relationship within `service_agencies`, capturing inter-agency collaborations, partnerships, or hierarchical relationships.

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

The `documents_agencies` junction table links `policy_documents` to `service_agencies`, allowing a policy document to apply to multiple agencies and an agency to be governed by multiple policy documents.

## Denormalised Views

The junction tables and base tables are combined through seventeen views that reconstruct domain facts for analytical and reporting purposes. Each view joins a specific set of tables to answer a particular question about the domain.

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

This view joins `service_inspections` with `social_care_services` to answer which services are covered by which inspections. A row such as inspection `BJanecke` (status `planned`, scope `national`) linked to service `20789856` (`Distributed Initiative`, type `personal_care`) tells a regulator that a planned national inspection encompasses the Distributed Initiative personal care service delivered in-home.

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

This view joins `service_inspections` with `policy_documents` to answer which policy documents govern which inspections. The row linking inspection `575199` (status `in_progress`, scope `local_authority`) to policy document `1450659` (`Distributed Model`, scope `local`, legislation `Social Care Act`) shows that an ongoing local-authority inspection is governed by a non-mandatory local policy document.

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

This view joins `social_care_services` with `service_agencies` to answer which agency delivers which service. The row linking service `3990167` (`Adaptive Model D`, type `child_care`, delivery `centre_based`) to agency `Nikola Corporation` (`Whirlpool Corporation`, type `voluntary_org`) indicates that a voluntary organisation delivers a centre-based child care service.

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

This view joins `social_care_services` with `service_users` to answer which users receive which services. The row linking service `14484998` (`Primary Cluster`, type `family_support`, delivery `community`) to user `92297f70-9bad-11eb-a8a2-19ed5c03f8d3` (type `carer`, disability type `sensory`, parenting status `non_parent`) shows that a community-based family support service serves a carer with a sensory disability who is not a parent.

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

This view joins `social_care_services` with `needs_assessments` to answer which assessments are associated with which services. The row linking service `20789856` (`Distributed Initiative`) to assessment `1000` (type `holistic`, outcome `eligible`, needs identified `47`) indicates that a holistic assessment found 47 needs and determined the user eligible for the Distributed Initiative service.

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

This view joins `service_users` with `social_care_services` from the user's perspective, answering which services are available to which users. The row linking user `9736910` (type `disabled_parent`, has disability `false`, parenting status `active_parent`) to service `20789856` (`Distributed Initiative`, type `personal_care`) shows that an active parent without a recorded disability is associated with a personal care service.

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

This view joins `service_users` with itself through the junction tables to answer which users are connected through shared services or assessments. Two users such as `9736910` and `40c1e50ce74c42d6801b1e2f409c1cfc` linked through the same service or assessment would indicate a shared care pathway.

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

This view joins `service_users` with `needs_assessments` to answer which assessments have been conducted for which users. The row linking user `40c1e50ce74c42d6801b1e2f409c1cfc` (type `child`, has disability `true`, disability type `physical`) to assessment `1001` (type `adult_focused`, outcome `ineligible`, needs identified `56`) shows that a child with a physical disability underwent an adult-focused assessment that resulted in an ineligible outcome.

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

This view joins `needs_assessments` with `service_users` from the assessment's perspective, answering which users were assessed and what their outcomes were. The row linking assessment `1002` (type `child_focused`, outcome `pending_review`, needs identified `65`) to user `92297f70-9bad-11eb-a8a2-19ed5c03f8d3` (type `carer`, disability type `sensory`) shows that a child-focused assessment with 65 identified needs is still pending review for a carer with a sensory disability.

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

This view joins `needs_assessments` with `service_agencies` to answer which agency conducted which assessment. The row linking assessment `1003` (type `holistic`, outcome `eligible`, needs identified `74`) to agency `General Telephone & Electronics` (`Switch Card Services Ltd.`, type `local_council`) indicates that a local council conducted a holistic assessment that found 74 needs and determined eligibility.

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

This view joins `needs_assessments` with `social_care_services` to answer which service an assessment was conducted for. The row linking assessment `1000` (outcome `eligible`) to service `20789856` (`Distributed Initiative`, type `personal_care`, delivery `in_home`) shows that an eligible assessment was conducted for an in-home personal care service.

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

This view joins `service_agencies` with `social_care_services` to answer which services an agency delivers. The row linking agency `U.S. Steel` (`FSG Social Impact Advisors`, type `local_council`, adoption of social model `true`) to service `20789856` (`Distributed Initiative`, type `personal_care`, is integrated `true`) shows that a local council that adopts the social model delivers an integrated personal care service.

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

This view joins `service_agencies` with `needs_assessments` to answer which assessments an agency has conducted. The row linking agency `Nikola Corporation` (`Whirlpool Corporation`, type `voluntary_org`, adoption of social model `false`) to assessment `1001` (type `adult_focused`, outcome `ineligible`, is service led `true`) shows that a voluntary organisation that does not adopt the social model conducted a service-led adult-focused assessment that resulted in ineligibility.

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

This view joins `service_agencies` with itself through the `agencies_agencies` junction table to answer which agencies are connected to which other agencies. Two agencies such as `U.S. Steel` and `Nikola Corporation` linked through this view would indicate a formal inter-agency relationship.

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

This view joins `policy_documents` with `service_agencies` to answer which agencies are governed by which policy documents. The row linking policy document `8189490` (`Baseline Initiative D`, scope `national`, legislation `Children Act 1989`, is mandatory `true`) to agency `U.S. Steel` (`FSG Social Impact Advisors`, type `local_council`) shows that a mandatory national policy under the Children Act 1989 governs a local council.

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

This view joins `policy_documents` with `social_care_services` to answer which services are governed by which policy documents. The row linking policy document `937738` (`Adaptive Cluster`, scope `agency_specific`, legislation `Children Act 1989`, is mandatory `true`) to service `14484998` (`Primary Cluster`, type `family_support`, delivery `community`) shows that an agency-specific mandatory policy under the Children Act 1989 governs a community-based family support service.

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

This view joins `policy_documents` with `service_inspections` to answer which inspections are governed by which policy documents. The row linking policy document `4277030` (`Primary Review A`, scope `national`, legislation `Social Care Act`, is mandatory `false`) to inspection `8350011` (status `archived`, scope `national`, findings `seasonal-findings-35`) shows that an archived national inspection was governed by a non-mandatory national policy under the Social Care Act.

## Synthesis

The social care domain model follows a clean normalised structure: six base tables capture the core entities with their intrinsic attributes, eight junction tables resolve the many-to-many relationships between them, and seventeen views reconstruct the domain facts by joining the normalised tables back together. The foreign keys—`policy_document_policy_ref` in `service_inspections`, `agency_id` and `needs_assessment_id` in `social_care_services`, `service_user_id` and `needs_assessment_id` in `service_users`, `agency_id` and `service_code` in `needs_assessments`, and the cross-references in `policy_documents`—form a coherent web of relationships that can be traversed in either direction through the views. Each view answers a specific analytical question: which services are inspected, which agencies deliver which services, which users receive which services, which assessments are linked to which entities, and which policy documents govern which inspections and services. The concrete row values—inspection codes like `BJanecke` and `state_uk_4`, service types like `personal_care` and `child_care`, user types like `disabled_parent` and `carer`, assessment outcomes like `eligible` and `ineligible`, and agency types like `local_council` and `voluntary_org`—ground the abstract schema in the operational reality of the social care domain.