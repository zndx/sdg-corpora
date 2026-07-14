## Incident Management and Policy Oversight in Educational Settings

Educational institutions operate within a complex ecosystem where the safety of students, staff, and visitors must be actively monitored, documented, and protected through structured incident management and policy review processes. At the core of this ecosystem are recorded events—bullying incidents—that capture what happened, who was involved, where it occurred, and how the institution responded. These records form the foundation for accountability, intervention, and continuous improvement. The domain encompasses five principal record types: bullying incidents, persons, staff roles, bullying types, and policy reviews, alongside policy documents that define the institutional standards against which conduct is measured. Each record carries identifiers, timestamps, and categorical flags that enable precise querying, reporting, and cross-referencing.

**Table `bullying_incidents`**

| incident_id | incident_date | severity_level | is_repeated | is_cyber_bullying | description | location | status | person_id | targeted_by_person_id | perpetrated_by_person_id | type_id | role_id |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 1336174 | 2022-09-26T20:48:00 | low | true | true | Extended Survey | extended-location-99 | reported | 1 | 1 | 1 | 5082983 | 2933463 |
| state_uk_4 | 2023-02-10T03:05:00 | medium | false | false | Pilot Corridor A | integrated-location-100 | investigating | 2 | 2 | 2 | a0f8eb4e-8fcd-11eb-924d-9cd76263cbd0 | id_3 |
| 2933483 | 2024-07-21T10:22:00 | high | true | true | Baseline Series | seasonal-location-101 | resolved | 3 | 3 | 3 | 884340 | gd_taxc_2111 |
| 2986243 | 2025-12-05T17:39:00 | critical | false | false | Distributed Assessment | regional-location-102 | escalated | 4 | 4 | 4 | 57e4c59a-8fcd-11eb-924d-9cd76263cbd0 | 994a4fa0-9bad-11eb-a8a2-19ed5c03f8d3 |

The `bullying_incidents` table serves as the central ledger of reported events. Each row represents a single incident, identified by a unique `incident_id` such as `1336174` or `state_uk_4`. The `incident_date` field anchors the event in time, with entries ranging from September 2022 through December 2025. Severity is classified into four levels—low, medium, high, and critical—as seen in the progression from incident `1336174` (low severity) to incident `2986243` (critical severity). Boolean flags `is_repeated` and `is_cyber_bullying` distinguish patterns: incident `1336174` is both repeated and cyber-based, while `2986243` is a one-time, non-cyber event. The `description` field provides a narrative label such as "Extended Survey" or "Distributed Assessment," and `location` records where the incident occurred, using coded identifiers like `extended-location-99` and `regional-location-102`. The `status` field tracks the lifecycle stage—reported, investigating, resolved, or escalated—and foreign keys `person_id`, `targeted_by_person_id`, and `perpetrated_by_person_id` link the incident to the individuals involved, while `type_id` and `role_id` connect to the bullying classification and the staff role responsible for handling the case.

**Table `persons`**

| id | person_id | full_name | role | year_group | email_address | is_vulnerable | special_needs | role_id | incident_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | George Bernard Shaw | Theodore Mcgrath | student | 45 | primary-email-70 | false | false | 2933463 | 1336174 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | Maria Rodriguez | Account Name | staff | 55 | adaptive-email-71 | true | true | id_3 | state_uk_4 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | Sarah Villanueva | Saipan International Airport | governor | 65 | distributed-email-72 | false | false | gd_taxc_2111 | 2933483 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | Susan Wagner | Norma Fisher | parent | 75 | baseline-email-73 | true | true | 994a4fa0-9bad-11eb-a8a2-19ed5c03f8d3 | 2986243 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The `persons` table maintains the roster of all individuals associated with incidents. Each person is identified by a surrogate `id` and a business `person_id`, with `full_name` providing the human-readable identifier. The `role` column classifies individuals as student, staff, governor, or parent, as demonstrated by George Bernard Shaw (student, year group 45), Maria Rodriguez (staff, year group 55), Sarah Villanueva (governor, year group 65), and Susan Wagner (parent, year group 75). The `email_address` field stores contact information using coded addresses such as `primary-email-70` and `baseline-email-73`. Vulnerability is tracked through `is_vulnerable` and `special_needs` flags; Maria Rodriguez and Susan Wagner are both marked as vulnerable with special needs, which triggers additional safeguarding protocols. The `role_id` and `incident_id` columns create direct links to the staff role managing the case and the specific incident the person is associated with.

**Table `staff_roles`**

| role_id | role_name | responsibilities | is_policy_owner | year_group | person_id | incident_id |
|---|---|---|---|---|---|---|
| 2933463 | Terry Pratchett | integrated-responsi-58 | Laurie Wallace | 45 | 1 | 1336174 |
| id_3 | Theodore Mcgrath | seasonal-responsi-59 | Ralph Waldo Emerson | 55 | 2 | state_uk_4 |
| gd_taxc_2111 | Janice Johnston | regional-responsi-60 | Peter Montgomery | 65 | 3 | 2933483 |
| 994a4fa0-9bad-11eb-a8a2-19ed5c03f8d3 | Theodore Mcgrath | legacy-responsi-61 | Madison Gonzalez | 75 | 4 | 2986243 |

Staff roles define the organizational structure through which incidents are managed. The `staff_roles` table maps each `role_id` to a `role_name`, a description of `responsibilities`, and a `is_policy_owner` flag indicating whether the role holder has authority over policy documents. For example, role `2933463` is named "Terry Pratchett" with responsibilities coded as `integrated-responsi-58`, and Laurie Wallace is designated as the policy owner. The `year_group` field provides an additional organizational dimension, and the `person_id` and `incident_id` columns tie each role to a specific individual and incident, ensuring clear lines of accountability.

**Table `bullying_types`**

| type_id | type_name | description | is_cyber_bullying | is_physical | is_verbal | incident_id |
|---|---|---|---|---|---|---|
| 5082983 | Extended Review | Extended Survey | true | false | true | 1336174 |
| a0f8eb4e-8fcd-11eb-924d-9cd76263cbd0 | Pilot Initiative A | Pilot Corridor A | false | true | false | state_uk_4 |
| 884340 | Baseline Model | Baseline Series | true | false | true | 2933483 |
| 57e4c59a-8fcd-11eb-924d-9cd76263cbd0 | Distributed Cluster | Distributed Assessment | false | true | false | 2986243 |

Bullying types categorize incidents by their nature and modality. The `bullying_types` table records each `type_id` alongside a `type_name` and `description`. The boolean flags `is_cyber_bullying`, `is_physical`, and `is_verbal` allow multi-dimensional classification. Type `5082983`, described as "Extended Review," is both cyber and verbal but not physical, while type `a0f8eb4e-8fcd-11eb-924d-9cd76263cbd0`, labeled "Pilot Initiative A," is physical but not cyber or verbal. Each type is linked to an `incident_id`, establishing a direct relationship between the classification and the event it describes.

**Table `policy_reviews`**

| policy_review_id | review_id | review_date | review_status | reviewer | findings | recommendations | person_id | document_id |
|---|---|---|---|---|---|---|---|---|
| 1000 | 3001009030040 | 2024-11-03T22:54:00 | planned | composite-reviewer-75 | integrated-findings-46 | extended-recommen-27 | 1 | IVC10I |
| 1001 | a001f18c-9bac-11eb-a8a2-19ed5c03f8d3 | 2025-04-14T05:11:00 | inProgress | primary-reviewer-76 | seasonal-findings-47 | integrated-recommen-28 | 2 | 605943 |
| 1002 | 3990167 | 2022-09-25T12:28:00 | completed | adaptive-reviewer-77 | regional-findings-48 | seasonal-recommen-29 | 3 | 10449525 |
| 1003 | 2bc4a76a-8fcc-11eb-924d-9cd76263cbd0 | 2023-02-09T19:45:00 | archived | distributed-reviewer-78 | legacy-findings-49 | regional-recommen-30 | 4 | 5f93a090-8fcd-11eb-924d-9cd76263cbd0 |

Policy reviews document the institutional oversight process. The `policy_reviews` table records each `policy_review_id` with a `review_id`, `review_date`, and `review_status` that can be planned, inProgress, completed, or archived. Reviewer identities such as `composite-reviewer-75` and `adaptive-reviewer-77` are captured alongside `findings` and `recommendations`, which are coded summaries of the review outcome. Each review is associated with a `person_id` for the responsible individual and a `document_id` linking to the policy document under review.

**Table `policy_documents`**

| document_id | title | version | effective_date | expiry_date | status | policy_review_id |
|---|---|---|---|---|---|---|
| IVC10I | Compact Initiative | seasonal-version-71 | 2023-02-14 | 2023-10-24 | draft | 1000 |
| 605943 | Legacy Model | regional-version-72 | 2024-07-25 | 2024-03-08 | active | 1001 |
| 10449525 | Regional Cluster A | legacy-version-73 | 2025-12-09 | 2025-08-19 | archived | 1002 |
| 5f93a090-8fcd-11eb-924d-9cd76263cbd0 | Seasonal Review | compact-version-74 | 2022-05-20 | 2022-01-03 | draft | 1003 |

Policy documents represent the formal standards governing conduct. The `policy_documents` table stores each `document_id` with a `title` such as "Compact Initiative" or "Regional Cluster A," a `version` identifier, and `effective_date` and `expiry_date` fields that define the document's validity period. The `status` column tracks whether a document is in draft, active, or archived state. The `policy_review_id` column creates a bidirectional link to the review that evaluated the document, ensuring that every policy document has a corresponding review record and vice versa.

## Cross-Referential Views

The power of the incident management system lies in its ability to join these base tables into analytical views that answer specific operational questions. Each view combines data from two or more tables to produce a unified record that supports investigation, reporting, and policy evaluation.

**View `bullying_incident_person_view`**

```sql
CREATE VIEW bullying_incident_person_view AS
SELECT a.incident_id, a.incident_date, a.severity_level, a.is_repeated, b.id AS person_id, b.person_id AS person_person_id, b.full_name AS person_full_name
FROM bullying_incidents a JOIN persons b ON a.person_id = b.id;
```

| incident_id | incident_date | severity_level | is_repeated | person_id | person_person_id | person_full_name |
|---|---|---|---|---|---|---|
| 1336174 | 2022-09-26T20:48:00 | low | true | 1 | George Bernard Shaw | Theodore Mcgrath |
| state_uk_4 | 2023-02-10T03:05:00 | medium | false | 2 | Maria Rodriguez | Account Name |
| 2933483 | 2024-07-21T10:22:00 | high | true | 3 | Sarah Villanueva | Saipan International Airport |
| 2986243 | 2025-12-05T17:39:00 | critical | false | 4 | Susan Wagner | Norma Fisher |

The `bullying_incident_person_view` joins incidents with the persons involved, answering the question: "Who was involved in each reported incident?" This view combines the incident's `incident_id`, `incident_date`, `severity_level`, and `status` with the person's `full_name`, `role`, and `is_vulnerable` status. For instance, the view would reveal that incident `1336174`, a low-severity reported cyber-bullying event, involved a person with the role of student, while incident `2986243`, a critical escalated event, involved a parent. This join is essential for safeguarding teams to quickly identify vulnerable individuals across all incidents.

**View `bullying_incident_bullying_type_view`**

```sql
CREATE VIEW bullying_incident_bullying_type_view AS
SELECT a.incident_id, a.incident_date, a.severity_level, a.is_repeated, b.type_id AS type_type_id, b.type_name AS type_type_name, b.description AS type_description
FROM bullying_incidents a JOIN bullying_types b ON a.type_id = b.type_id;
```

| incident_id | incident_date | severity_level | is_repeated | type_type_id | type_type_name | type_description |
|---|---|---|---|---|---|---|
| 1336174 | 2022-09-26T20:48:00 | low | true | 5082983 | Extended Review | Extended Survey |
| state_uk_4 | 2023-02-10T03:05:00 | medium | false | a0f8eb4e-8fcd-11eb-924d-9cd76263cbd0 | Pilot Initiative A | Pilot Corridor A |
| 2933483 | 2024-07-21T10:22:00 | high | true | 884340 | Baseline Model | Baseline Series |
| 2986243 | 2025-12-05T17:39:00 | critical | false | 57e4c59a-8fcd-11eb-924d-9cd76263cbd0 | Distributed Cluster | Distributed Assessment |

The `bullying_incident_bullying_type_view` links incidents to their bullying classifications, answering: "What type of bullying occurred in each incident?" By joining `bullying_incidents` with `bullying_types`, the view surfaces the `type_name` and the modality flags alongside the incident's severity and status. Incident `1336174` joins with type `5082983` (Extended Review), which is both cyber and verbal, while incident `state_uk_4` joins with type `a0f8eb4e-8fcd-11eb-924d-9cd76263cbd0` (Pilot Initiative A), which is physical. This view enables pattern analysis across bullying modalities and helps identify whether certain severity levels correlate with specific types.

**View `bullying_incident_staff_role_view`**

```sql
CREATE VIEW bullying_incident_staff_role_view AS
SELECT a.incident_id, a.incident_date, a.severity_level, a.is_repeated, b.role_id AS role_role_id, b.role_name AS role_role_name, b.responsibilities AS role_responsibilities
FROM bullying_incidents a JOIN staff_roles b ON a.role_id = b.role_id;
```

| incident_id | incident_date | severity_level | is_repeated | role_role_id | role_role_name | role_responsibilities |
|---|---|---|---|---|---|---|
| 1336174 | 2022-09-26T20:48:00 | low | true | 2933463 | Terry Pratchett | integrated-responsi-58 |
| state_uk_4 | 2023-02-10T03:05:00 | medium | false | id_3 | Theodore Mcgrath | seasonal-responsi-59 |
| 2933483 | 2024-07-21T10:22:00 | high | true | gd_taxc_2111 | Janice Johnston | regional-responsi-60 |
| 2986243 | 2025-12-05T17:39:00 | critical | false | 994a4fa0-9bad-11eb-a8a2-19ed5c03f8d3 | Theodore Mcgrath | legacy-responsi-61 |

The `bullying_incident_staff_role_view` connects incidents to the staff roles responsible for handling them, answering: "Which staff role is managing each incident?" The joined record includes the incident's `description`, `location`, and `status` alongside the role's `role_name`, `responsibilities`, and `is_policy_owner` flag. For example, incident `2933483` (Baseline Series, high severity, resolved) is managed by role `gd_taxc_2111` (Janice Johnston) with responsibilities coded as `regional-responsi-60`. This view supports workload analysis and ensures that policy owners are appropriately engaged with the incidents they oversee.

**View `person_staff_role_view`**

```sql
CREATE VIEW person_staff_role_view AS
SELECT a.id, a.person_id, a.full_name, a.role, b.role_id AS role_role_id, b.role_name AS role_role_name, b.responsibilities AS role_responsibilities
FROM persons a JOIN staff_roles b ON a.role_id = b.role_id;
```

| id | person_id | full_name | role | role_role_id | role_role_name | role_responsibilities |
|---|---|---|---|---|---|---|
| 1 | George Bernard Shaw | Theodore Mcgrath | student | 2933463 | Terry Pratchett | integrated-responsi-58 |
| 2 | Maria Rodriguez | Account Name | staff | id_3 | Theodore Mcgrath | seasonal-responsi-59 |
| 3 | Sarah Villanueva | Saipan International Airport | governor | gd_taxc_2111 | Janice Johnston | regional-responsi-60 |
| 4 | Susan Wagner | Norma Fisher | parent | 994a4fa0-9bad-11eb-a8a2-19ed5c03f8d3 | Theodore Mcgrath | legacy-responsi-61 |

The `person_staff_role_view` maps persons to their associated staff roles, answering: "Which staff role is assigned to each person?" This join combines the person's `full_name`, `role`, and `is_vulnerable` status with the role's `role_name` and `is_policy_owner` designation. Maria Rodriguez, a staff member marked as vulnerable, is linked to role `id_3` (Theodore Mcgrath), while Susan Wagner, a parent also marked as vulnerable, is linked to role `994a4fa0-9bad-11eb-a8a2-19ed5c03f8d3` (Theodore Mcgrath). This view is critical for ensuring that vulnerable individuals are assigned to appropriate staff contacts.

**View `person_bullying_incident_view`**

```sql
CREATE VIEW person_bullying_incident_view AS
SELECT a.id, a.person_id, a.full_name, a.role, b.incident_id AS incident_incident_id, b.incident_date AS incident_incident_date, b.severity_level AS incident_severity_level
FROM persons a JOIN bullying_incidents b ON a.incident_id = b.incident_id;
```

| id | person_id | full_name | role | incident_incident_id | incident_incident_date | incident_severity_level |
|---|---|---|---|---|---|---|
| 1 | George Bernard Shaw | Theodore Mcgrath | student | 1336174 | 2022-09-26T20:48:00 | low |
| 2 | Maria Rodriguez | Account Name | staff | state_uk_4 | 2023-02-10T03:05:00 | medium |
| 3 | Sarah Villanueva | Saipan International Airport | governor | 2933483 | 2024-07-21T10:22:00 | high |
| 4 | Susan Wagner | Norma Fisher | parent | 2986243 | 2025-12-05T17:39:00 | critical |

The `person_bullying_incident_view` provides a person-centric perspective by joining persons with their associated incidents, answering: "What incidents is each person connected to?" The view surfaces the person's `full_name`, `role`, and `year_group` alongside the incident's `incident_date`, `severity_level`, and `description`. George Bernard Shaw, a student in year group 45, is associated with incident `1336174` (Extended Survey, low severity), while Sarah Villanueva, a governor in year group 65, is associated with incident `2933483` (Baseline Series, high severity). This view supports individual case management and trend analysis at the person level.

**View `staff_role_person_view`**

```sql
CREATE VIEW staff_role_person_view AS
SELECT a.role_id, a.role_name, a.responsibilities, a.is_policy_owner, b.id AS person_id, b.person_id AS person_person_id, b.full_name AS person_full_name
FROM staff_roles a JOIN persons b ON a.person_id = b.id;
```

| role_id | role_name | responsibilities | is_policy_owner | person_id | person_person_id | person_full_name |
|---|---|---|---|---|---|---|
| 2933463 | Terry Pratchett | integrated-responsi-58 | Laurie Wallace | 1 | George Bernard Shaw | Theodore Mcgrath |
| id_3 | Theodore Mcgrath | seasonal-responsi-59 | Ralph Waldo Emerson | 2 | Maria Rodriguez | Account Name |
| gd_taxc_2111 | Janice Johnston | regional-responsi-60 | Peter Montgomery | 3 | Sarah Villanueva | Saipan International Airport |
| 994a4fa0-9bad-11eb-a8a2-19ed5c03f8d3 | Theodore Mcgrath | legacy-responsi-61 | Madison Gonzalez | 4 | Susan Wagner | Norma Fisher |

The `staff_role_person_view` inverts the person-to-role relationship, answering: "Which persons are associated with each staff role?" The joined record includes the role's `role_name`, `responsibilities`, and `is_policy_owner` flag alongside the person's `full_name`, `role`, and `is_vulnerable` status. Role `2933463` (Terry Pratchett) is linked to George Bernard Shaw (student), while role `id_3` (Theodore Mcgrath) is linked to Maria Rodriguez (staff). This view supports staffing decisions and ensures that each role has appropriate coverage across different person categories.

**View `staff_role_bullying_incident_view`**

```sql
CREATE VIEW staff_role_bullying_incident_view AS
SELECT a.role_id, a.role_name, a.responsibilities, a.is_policy_owner, b.incident_id AS incident_incident_id, b.incident_date AS incident_incident_date, b.severity_level AS incident_severity_level
FROM staff_roles a JOIN bullying_incidents b ON a.incident_id = b.incident_id;
```

| role_id | role_name | responsibilities | is_policy_owner | incident_incident_id | incident_incident_date | incident_severity_level |
|---|---|---|---|---|---|---|
| 2933463 | Terry Pratchett | integrated-responsi-58 | Laurie Wallace | 1336174 | 2022-09-26T20:48:00 | low |
| id_3 | Theodore Mcgrath | seasonal-responsi-59 | Ralph Waldo Emerson | state_uk_4 | 2023-02-10T03:05:00 | medium |
| gd_taxc_2111 | Janice Johnston | regional-responsi-60 | Peter Montgomery | 2933483 | 2024-07-21T10:22:00 | high |
| 994a4fa0-9bad-11eb-a8a2-19ed5c03f8d3 | Theodore Mcgrath | legacy-responsi-61 | Madison Gonzalez | 2986243 | 2025-12-05T17:39:00 | critical |

The `staff_role_bullying_incident_view` connects staff roles to the incidents they manage, answering: "Which incidents is each staff role responsible for?" The view combines the role's `role_name`, `responsibilities`, and `is_policy_owner` status with the incident's `incident_date`, `severity_level`, `is_repeated`, and `status`. Role `gd_taxc_2111` (Janice Johnston) manages incident `2933483`, which is a repeated, high-severity, resolved cyber-bullying event. This view enables supervisors to assess the distribution of incident complexity across roles and identify whether policy owners are appropriately engaged with high-severity cases.

**View `bullying_type_bullying_incident_view`**

```sql
CREATE VIEW bullying_type_bullying_incident_view AS
SELECT a.type_id, a.type_name, a.description, a.is_cyber_bullying, b.incident_id AS incident_incident_id, b.incident_date AS incident_incident_date, b.severity_level AS incident_severity_level
FROM bullying_types a JOIN bullying_incidents b ON a.incident_id = b.incident_id;
```

| type_id | type_name | description | is_cyber_bullying | incident_incident_id | incident_incident_date | incident_severity_level |
|---|---|---|---|---|---|---|
| 5082983 | Extended Review | Extended Survey | true | 1336174 | 2022-09-26T20:48:00 | low |
| a0f8eb4e-8fcd-11eb-924d-9cd76263cbd0 | Pilot Initiative A | Pilot Corridor A | false | state_uk_4 | 2023-02-10T03:05:00 | medium |
| 884340 | Baseline Model | Baseline Series | true | 2933483 | 2024-07-21T10:22:00 | high |
| 57e4c59a-8fcd-11eb-924d-9cd76263cbd0 | Distributed Cluster | Distributed Assessment | false | 2986243 | 2025-12-05T17:39:00 | critical |

The `bullying_type_bullying_incident_view` provides a type-centric perspective by joining bullying types with their associated incidents, answering: "What incidents fall under each bullying type?" The view surfaces the type's `type_name`, `description`, and modality flags alongside the incident's `incident_date`, `severity_level`, and `location`. Type `5082983` (Extended Review) is associated with incident `1336174` at `extended-location-99`, while type `884340` (Baseline Model) is associated with incident `2933483` at `seasonal-location-101`. This view supports geographic and temporal analysis of bullying patterns by type.

**View `policy_review_person_view`**

```sql
CREATE VIEW policy_review_person_view AS
SELECT a.policy_review_id, a.review_id, a.review_date, a.review_status, b.id AS person_id, b.person_id AS person_person_id, b.full_name AS person_full_name
FROM policy_reviews a JOIN persons b ON a.person_id = b.id;
```

| policy_review_id | review_id | review_date | review_status | person_id | person_person_id | person_full_name |
|---|---|---|---|---|---|---|
| 1000 | 3001009030040 | 2024-11-03T22:54:00 | planned | 1 | George Bernard Shaw | Theodore Mcgrath |
| 1001 | a001f18c-9bac-11eb-a8a2-19ed5c03f8d3 | 2025-04-14T05:11:00 | inProgress | 2 | Maria Rodriguez | Account Name |
| 1002 | 3990167 | 2022-09-25T12:28:00 | completed | 3 | Sarah Villanueva | Saipan International Airport |
| 1003 | 2bc4a76a-8fcc-11eb-924d-9cd76263cbd0 | 2023-02-09T19:45:00 | archived | 4 | Susan Wagner | Norma Fisher |

The `policy_review_person_view` links policy reviews to the persons responsible for them, answering: "Which person is responsible for each policy review?" The joined record includes the review's `review_date`, `review_status`, `findings`, and `recommendations` alongside the person's `full_name`, `role`, and `is_vulnerable` status. Review `1000`, planned and conducted by `composite-reviewer-75` with findings coded as `integrated-findings-46`, is associated with person `1` (George Bernard Shaw). Review `1002`, completed by `adaptive-reviewer-77` with `regional-findings-48`, is associated with person `3` (Sarah Villanueva). This view supports accountability tracking for policy oversight activities.

**View `policy_review_policy_document_view`**

```sql
CREATE VIEW policy_review_policy_document_view AS
SELECT a.policy_review_id, a.review_id, a.review_date, a.review_status, b.document_id AS document_document_id, b.title AS document_title, b.version AS document_version
FROM policy_reviews a JOIN policy_documents b ON a.document_id = b.document_id;
```

| policy_review_id | review_id | review_date | review_status | document_document_id | document_title | document_version |
|---|---|---|---|---|---|---|
| 1000 | 3001009030040 | 2024-11-03T22:54:00 | planned | IVC10I | Compact Initiative | seasonal-version-71 |
| 1001 | a001f18c-9bac-11eb-a8a2-19ed5c03f8d3 | 2025-04-14T05:11:00 | inProgress | 605943 | Legacy Model | regional-version-72 |
| 1002 | 3990167 | 2022-09-25T12:28:00 | completed | 10449525 | Regional Cluster A | legacy-version-73 |
| 1003 | 2bc4a76a-8fcc-11eb-924d-9cd76263cbd0 | 2023-02-09T19:45:00 | archived | 5f93a090-8fcd-11eb-924d-9cd76263cbd0 | Seasonal Review | compact-version-74 |

The `policy_review_policy_document_view` connects policy reviews to the documents they evaluate, answering: "Which policy document is associated with each review?" The view combines the review's `review_date`, `review_status`, and `recommendations` with the document's `title`, `version`, `effective_date`, `expiry_date`, and `status`. Review `1000` is linked to document `IVC10I` (Compact Initiative, version `seasonal-version-71`, status draft), while review `1001`, in progress, is linked to document `605943` (Legacy Model, version `regional-version-72`, status active). This view is essential for ensuring that every active policy document has a corresponding review and that expired documents are properly archived.

**View `policy_document_policy_review_view`**

```sql
CREATE VIEW policy_document_policy_review_view AS
SELECT a.document_id, a.title, a.version, a.effective_date, b.policy_review_id AS review_policy_review_id, b.review_id AS review_review_id, b.review_date AS review_review_date
FROM policy_documents a JOIN policy_reviews b ON a.policy_review_id = b.policy_review_id;
```

| document_id | title | version | effective_date | review_policy_review_id | review_review_id | review_review_date |
|---|---|---|---|---|---|---|
| IVC10I | Compact Initiative | seasonal-version-71 | 2023-02-14 | 1000 | 3001009030040 | 2024-11-03T22:54:00 |
| 605943 | Legacy Model | regional-version-72 | 2024-07-25 | 1001 | a001f18c-9bac-11eb-a8a2-19ed5c03f8d3 | 2025-04-14T05:11:00 |
| 10449525 | Regional Cluster A | legacy-version-73 | 2025-12-09 | 1002 | 3990167 | 2022-09-25T12:28:00 |
| 5f93a090-8fcd-11eb-924d-9cd76263cbd0 | Seasonal Review | compact-version-74 | 2022-05-20 | 1003 | 2bc4a76a-8fcc-11eb-924d-9cd76263cbd0 | 2023-02-09T19:45:00 |

The `policy_document_policy_review_view` inverts the document-to-review relationship, answering: "Which policy review evaluated each document?" The joined record includes the document's `title`, `version`, `effective_date`, `expiry_date`, and `status` alongside the review's `review_date`, `review_status`, and `findings`. Document `10449525` (Regional Cluster A, status archived) was evaluated by review `1002`, which is completed with findings coded as `regional-findings-48`. Document `5f93a090-8fcd-11eb-924d-9cd76263cbd0` (Seasonal Review, status draft) was evaluated by review `1003`, which is archived with `legacy-findings-49`. This view supports document lifecycle management by ensuring that every document's review status is current and that expired documents have been properly reviewed and archived.

## Synthesis

The incident management and policy oversight domain operates as an interconnected system of records where each entity—incidents, persons, staff roles, bullying types, policy reviews, and policy documents—carries specific attributes that enable precise tracking, analysis, and accountability. The base tables capture the raw facts of each event and the individuals involved, while the views synthesize these facts into actionable perspectives that answer specific operational questions. A safeguarding officer can use the person-incident view to identify all vulnerable individuals across incidents, a supervisor can use the staff-role-incident view to assess workload distribution, and a policy administrator can use the document-review view to ensure that all active documents have current reviews. The foreign-key relationships between tables—linking incidents to persons, types, and roles, and linking reviews to documents and persons—create a navigable graph of information that supports both reactive incident response and proactive policy improvement. Through this structured approach, educational institutions can maintain a clear, auditable record of safety events and the policies designed to prevent them.