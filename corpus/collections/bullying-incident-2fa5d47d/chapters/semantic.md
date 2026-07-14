## Ontology-Grounded Relational Modelling of the Bullying Incident Management Domain

The domain under examination concerns the recording, classification, and governance of bullying incidents within an institutional setting. At its core, the ontology distinguishes five principal entity types—incidents, persons, staff roles, bullying types, and policy reviews—each materialized as a relational table with a carefully chosen primary key and a set of attributes that capture both intrinsic properties and cross-entity relationships. The schema is deliberately normalized: each entity type occupies its own table, relationships are expressed through foreign keys, and a pair of policy-related tables (`policy_documents` and `policy_reviews`) form a one-to-many composition. Views then reassemble these normalized fragments into domain-level facts that answer concrete analytical questions.

**Table `bullying_incidents`**

| incident_id | incident_date | severity_level | is_repeated | is_cyber_bullying | description | location | status | person_id | targeted_by_person_id | perpetrated_by_person_id | type_id | role_id |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 1336174 | 2022-09-26T20:48:00 | low | true | true | Extended Survey | extended-location-99 | reported | 1 | 1 | 1 | 5082983 | 2933463 |
| state_uk_4 | 2023-02-10T03:05:00 | medium | false | false | Pilot Corridor A | integrated-location-100 | investigating | 2 | 2 | 2 | a0f8eb4e-8fcd-11eb-924d-9cd76263cbd0 | id_3 |
| 2933483 | 2024-07-21T10:22:00 | high | true | true | Baseline Series | seasonal-location-101 | resolved | 3 | 3 | 3 | 884340 | gd_taxc_2111 |
| 2986243 | 2025-12-05T17:39:00 | critical | false | false | Distributed Assessment | regional-location-102 | escalated | 4 | 4 | 4 | 57e4c59a-8fcd-11eb-924d-9cd76263cbd0 | 994a4fa0-9bad-11eb-a8a2-19ed5c03f8d3 |

The `bullying_incidents` table is the central fact table of the schema. Its primary key, `incident_id`, is a surrogate identifier that uniquely tags each recorded event. The table stores temporal metadata (`incident_date`), qualitative severity (`severity_level`), and boolean flags (`is_repeated`, `is_cyber_bullying`) that encode the ontology's cardinality-bounded constraints on incident properties. The `description` and `location` columns carry free-text contextual information, while `status` captures the procedural lifecycle state of the incident—values such as `reported`, `investigating`, `resolved`, and `escalated` trace the progression from initial report through resolution.

Critically, `bullying_incidents` embeds three foreign keys that bind it to other entity types. The `person_id` column references the `persons` table, establishing the primary subject of the incident. The `targeted_by_person_id` and `perpetrated_by_person_id` columns are also foreign keys into `persons`, modelling the directed relationship between a target and a perpetrator. The `type_id` column points to `bullying_types`, and `role_id` points to `staff_roles`. These foreign keys are the structural mechanism through which the normalized schema reconstructs domain facts when queried through views.

**Table `persons`**

| id | person_id | full_name | role | year_group | email_address | is_vulnerable | special_needs | role_id | incident_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | George Bernard Shaw | Theodore Mcgrath | student | 45 | primary-email-70 | false | false | 2933463 | 1336174 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | Maria Rodriguez | Account Name | staff | 55 | adaptive-email-71 | true | true | id_3 | state_uk_4 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | Sarah Villanueva | Saipan International Airport | governor | 65 | distributed-email-72 | false | false | gd_taxc_2111 | 2933483 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | Susan Wagner | Norma Fisher | parent | 75 | baseline-email-73 | true | true | 994a4fa0-9bad-11eb-a8a2-19ed5c03f8d3 | 2986243 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The `persons` table captures the roster of individuals involved in the domain. Its primary key is `id`, and it carries a secondary identifier `person_id` that appears to serve as a business key. The `full_name` column stores the human-readable name, while `role` classifies the person's institutional position—values observed include `student`, `staff`, `governor`, and `parent`. The `year_group` column is an integer attribute, and `email_address` provides contact information. Boolean flags `is_vulnerable` and `special_needs` encode safeguarding attributes. The table also includes `role_id` and `incident_id` as foreign keys linking back to `staff_roles` and `bullying_incidents` respectively, creating bidirectional navigability from person to their associated role and incident.

**Table `staff_roles`**

| role_id | role_name | responsibilities | is_policy_owner | year_group | person_id | incident_id |
|---|---|---|---|---|---|---|
| 2933463 | Terry Pratchett | integrated-responsi-58 | Laurie Wallace | 45 | 1 | 1336174 |
| id_3 | Theodore Mcgrath | seasonal-responsi-59 | Ralph Waldo Emerson | 55 | 2 | state_uk_4 |
| gd_taxc_2111 | Janice Johnston | regional-responsi-60 | Peter Montgomery | 65 | 3 | 2933483 |
| 994a4fa0-9bad-11eb-a8a2-19ed5c03f8d3 | Theodore Mcgrath | legacy-responsi-61 | Madison Gonzalez | 75 | 4 | 2986243 |

`staff_roles` defines the institutional role taxonomy. Its primary key is `role_id`, and the `role_name` column stores the human-readable designation. The `responsibilities` column carries a free-text description of the role's duties, while `is_policy_owner` is a boolean flag indicating whether the role holds policy ownership. The `year_group` column mirrors the integer attribute found in `persons`, and `person_id` and `incident_id` are foreign keys into the respective tables, enabling the schema to associate a specific person and a specific incident with a given staff role.

**Table `bullying_types`**

| type_id | type_name | description | is_cyber_bullying | is_physical | is_verbal | incident_id |
|---|---|---|---|---|---|---|
| 5082983 | Extended Review | Extended Survey | true | false | true | 1336174 |
| a0f8eb4e-8fcd-11eb-924d-9cd76263cbd0 | Pilot Initiative A | Pilot Corridor A | false | true | false | state_uk_4 |
| 884340 | Baseline Model | Baseline Series | true | false | true | 2933483 |
| 57e4c59a-8fcd-11eb-924d-9cd76263cbd0 | Distributed Cluster | Distributed Assessment | false | true | false | 2986243 |

The `bullying_types` table classifies the nature of each incident. Its primary key is `type_id`, and `type_name` provides a human-readable label for the classification. The `description` column offers additional context. Three boolean columns—`is_cyber_bullying`, `is_physical`, and `is_verbal`—encode the ontology's multi-dimensional classification of bullying modality, allowing a single incident type to be tagged across multiple dimensions. The `incident_id` column is a foreign key into `bullying_incidents`, establishing a one-to-many relationship where each incident type is associated with exactly one incident.

**Table `policy_reviews`**

| policy_review_id | review_id | review_date | review_status | reviewer | findings | recommendations | person_id | document_id |
|---|---|---|---|---|---|---|---|---|
| 1000 | 3001009030040 | 2024-11-03T22:54:00 | planned | composite-reviewer-75 | integrated-findings-46 | extended-recommen-27 | 1 | IVC10I |
| 1001 | a001f18c-9bac-11eb-a8a2-19ed5c03f8d3 | 2025-04-14T05:11:00 | inProgress | primary-reviewer-76 | seasonal-findings-47 | integrated-recommen-28 | 2 | 605943 |
| 1002 | 3990167 | 2022-09-25T12:28:00 | completed | adaptive-reviewer-77 | regional-findings-48 | seasonal-recommen-29 | 3 | 10449525 |
| 1003 | 2bc4a76a-8fcc-11eb-924d-9cd76263cbd0 | 2023-02-09T19:45:00 | archived | distributed-reviewer-78 | legacy-findings-49 | regional-recommen-30 | 4 | 5f93a090-8fcd-11eb-924d-9cd76263cbd0 |

`policy_reviews` records the governance lifecycle of policy oversight. Its primary key is `policy_review_id`, and `review_id` serves as a secondary identifier. The `review_date` captures when the review occurred, `review_status` records the procedural state (values include `planned`, `inProgress`, `completed`, and `archived`), and `reviewer` identifies the individual or entity conducting the review. The `findings` and `recommendations` columns store free-text outputs of the review process. The table includes `person_id` as a foreign key into `persons` and `document_id` as a foreign key into `policy_documents`, linking each review to both a responsible person and a policy document.

**Table `policy_documents`**

| document_id | title | version | effective_date | expiry_date | status | policy_review_id |
|---|---|---|---|---|---|---|
| IVC10I | Compact Initiative | seasonal-version-71 | 2023-02-14 | 2023-10-24 | draft | 1000 |
| 605943 | Legacy Model | regional-version-72 | 2024-07-25 | 2024-03-08 | active | 1001 |
| 10449525 | Regional Cluster A | legacy-version-73 | 2025-12-09 | 2025-08-19 | archived | 1002 |
| 5f93a090-8fcd-11eb-924d-9cd76263cbd0 | Seasonal Review | compact-version-74 | 2022-05-20 | 2022-01-03 | draft | 1003 |

The `policy_documents` table stores the policy artefacts themselves. Its primary key is `document_id`, and the `title` column provides a human-readable name. The `version` column tracks document revisions, while `effective_date` and `expiry_date` define the temporal validity window. The `status` column captures the document lifecycle state (values include `draft`, `active`, and `archived`). The `policy_review_id` column is a foreign key into `policy_reviews`, establishing a one-to-many composition: each policy document is associated with exactly one policy review, but a single review may govern multiple documents.

The foreign-key topology of the schema can be summarized as follows. `bullying_incidents` is the central hub, with foreign keys `person_id`, `targeted_by_person_id`, `perpetrated_by_person_id`, `type_id`, and `role_id` pointing into `persons`, `bullying_types`, and `staff_roles` respectively. `persons` and `staff_roles` each carry `role_id` and `incident_id` foreign keys that create bidirectional links back to `bullying_incidents`. `bullying_types` carries `incident_id` as a foreign key. `policy_reviews` carries `person_id` and `document_id` as foreign keys into `persons` and `policy_documents`. `policy_documents` carries `policy_review_id` as a foreign key into `policy_reviews`. This topology ensures that every domain fact can be reconstructed through a join of the appropriate tables.

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

The `bullying_incident_person_view` joins `bullying_incidents` with `persons` on the `person_id` foreign key, answering the question: "What are the details of each incident alongside the primary person associated with it?" The joined result merges the incident's temporal and severity attributes with the person's name, role, and safeguarding flags. For example, incident `1336174` (dated `2022-09-26T20:48:00`, severity `low`, status `reported`) is joined with person `1` (full name `George Bernard Shaw`, role `student`, year group `45`), producing a row that simultaneously conveys the incident metadata and the person's institutional context. Similarly, incident `state_uk_4` (severity `medium`, status `investigating`) joins with person `2` (full name `Maria Rodriguez`, role `staff`, `is_vulnerable` = `true`), illustrating how the view surfaces safeguarding-relevant information alongside the incident record.

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

The `bullying_incident_bullying_type_view` joins `bullying_incidents` with `bullying_types` on `type_id`, answering: "What classification applies to each incident, and what are its modality characteristics?" The join merges the incident's core attributes with the type's name, description, and boolean modality flags. Incident `1336174` joins with type `5082983` (type name `Extended Review`, description `Extended Survey`, `is_cyber_bullying` = `true`, `is_verbal` = `true`), revealing that this incident is classified as a cyber and verbal bullying type. Incident `state_uk_4` joins with type `a0f8eb4e-8fcd-11eb-924d-9cd76263cbd0` (type name `Pilot Initiative A`, `is_physical` = `true`), showing a physical bullying classification. The view thus enables analysts to filter incidents by modality dimension.

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

The `bullying_incident_staff_role_view` joins `bullying_incidents` with `staff_roles` on `role_id`, answering: "Which staff role is associated with each incident, and what are that role's responsibilities and policy ownership status?" The join merges incident metadata with the role's name, responsibilities, and the `is_policy_owner` flag. Incident `1336174` joins with role `2933463` (role name `Terry Pratchett`, responsibilities `integrated-responsi-58`, `is_policy_owner` = `Laurie Wallace`), while incident `2933483` joins with role `gd_taxc_2111` (role name `Janice Johnston`, responsibilities `regional-responsi-60`), providing a clear mapping from incident to the institutional role responsible for its handling.

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

The `person_staff_role_view` joins `persons` with `staff_roles` on `role_id`, answering: "Which staff role is associated with each person?" This view is particularly useful for understanding the role-person mapping independently of incidents. Person `1` (full name `George Bernard Shaw`, role `student`) joins with role `2933463` (role name `Terry Pratchett`), while person `4` (full name `Susan Wagner`, role `parent`, `is_vulnerable` = `true`) joins with role `994a4fa0-9bad-11eb-a8a2-19ed5c03f8d3` (role name `Theodore Mcgrath`, responsibilities `legacy-responsi-61`), illustrating how the view surfaces the role context for each person record.

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

The `person_bullying_incident_view` joins `persons` with `bullying_incidents` on `incident_id`, answering: "Which incidents are associated with each person?" This view reconstructs the bidirectional relationship from person to incident. Person `1` (full name `George Bernard Shaw`) joins with incident `1336174` (severity `low`, `is_repeated` = `true`, `is_cyber_bullying` = `true`), while person `3` (full name `Sarah Villanueva`, role `governor`) joins with incident `2933483` (severity `high`, `is_repeated` = `true`, status `resolved`), providing a person-centric view of their incident involvement.

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

The `staff_role_person_view` joins `staff_roles` with `persons` on `person_id`, answering: "Which person is associated with each staff role?" This view inverts the perspective of `person_staff_role_view`. Role `2933463` (role name `Terry Pratchett`, responsibilities `integrated-responsi-58`) joins with person `1` (full name `George Bernard Shaw`, role `student`), while role `994a4fa0-9bad-11eb-a8a2-19ed5c03f8d3` (role name `Theodore Mcgrath`, `is_policy_owner` = `Madison Gonzalez`) joins with person `4` (full name `Susan Wagner`, role `parent`), enabling role-centric queries about personnel assignments.

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

The `staff_role_bullying_incident_view` joins `staff_roles` with `bullying_incidents` on `incident_id`, answering: "Which incidents are associated with each staff role?" This view is useful for workload analysis and role-based incident tracking. Role `2933463` (role name `Terry Pratchett`) joins with incident `1336174` (severity `low`, `is_cyber_bullying` = `true`), while role `gd_taxc_2111` (role name `Janice Johnston`, responsibilities `regional-responsi-60`) joins with incident `2933483` (severity `high`, `is_repeated` = `true`), providing a clear picture of which roles handle which incidents.

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

The `bullying_type_bullying_incident_view` joins `bullying_types` with `bullying_incidents` on `incident_id`, answering: "Which incidents are classified under each bullying type?" This view inverts the perspective of `bullying_incident_bullying_type_view`. Type `5082983` (type name `Extended Review`, `is_cyber_bullying` = `true`, `is_verbal` = `true`) joins with incident `1336174` (severity `low`, status `reported`), while type `884340` (type name `Baseline Model`, `is_cyber_bullying` = `true`, `is_verbal` = `true`) joins with incident `2933483` (severity `high`, status `resolved`), enabling type-centric analysis of incident distribution.

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

The `policy_review_person_view` joins `policy_reviews` with `persons` on `person_id`, answering: "Which person is responsible for each policy review?" This view links the governance process to the responsible individual. Review `1000` (review date `2024-11-03T22:54:00`, status `planned`, reviewer `composite-reviewer-75`, findings `integrated-findings-46`) joins with person `1` (full name `George Bernard Shaw`, role `student`), while review `1003` (status `archived`, reviewer `distributed-reviewer-78`, findings `legacy-findings-49`) joins with person `4` (full name `Susan Wagner`, role `parent`), providing a clear audit trail of review responsibility.

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

The `policy_review_policy_document_view` joins `policy_reviews` with `policy_documents` on `document_id` (via `policy_review_id`), answering: "Which policy documents are governed by each policy review?" This view materializes the one-to-many composition between reviews and documents. Review `1000` (review date `2024-11-03T22:54:00`, status `planned`) joins with document `IVC10I` (title `Compact Initiative`, version `seasonal-version-71`, status `draft`, effective `2023-02-14`, expiry `2023-10-24`), while review `1002` (status `completed`, reviewer `adaptive-reviewer-77`) joins with document `10449525` (title `Regional Cluster A`, version `legacy-version-73`, status `archived`), enabling governance analysts to trace document lifecycle states through their governing reviews.

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

The `policy_document_policy_review_view` joins `policy_documents` with `policy_reviews` on `policy_review_id`, answering: "Which policy review governs each document?" This view inverts the perspective of `policy_review_policy_document_view`. Document `IVC10I` (title `Compact Initiative`, version `seasonal-version-71`, status `draft`) joins with review `1000` (review date `2024-11-03T22:54:00`, status `planned`, reviewer `composite-reviewer-75`), while document `5f93a090-8fcd-11eb-9d76263cbd0` (title `Seasonal Review`, version `compact-version-74`, status `draft`) joins with review `1003` (status `archived`, reviewer `distributed-reviewer-78`), providing a document-centric view of its governance context.

The schema's design reflects a deliberate balance between normalization and analytical accessibility. Each base table captures a single entity type with its intrinsic attributes, while foreign keys encode the relationships that the ontology defines. The views then serve as materialized interpretations of these relationships, each answering a specific analytical question by joining the appropriate tables. This architecture ensures that the normalized schema remains clean and maintainable while the views provide the domain-level facts that analysts and auditors need. The use of surrogate primary keys (`incident_id`, `id`, `role_id`, `type_id`, `policy_review_id`, `document_id`) alongside business identifiers (`person_id`, `review_id`) supports both referential integrity and human-readable queries. Boolean flags (`is_repeated`, `is_cyber_bullying`, `is_vulnerable`, `is_policy_owner`, `is_physical`, `is_verbal`) encode cardinality-bounded constraints that would otherwise require separate junction tables, keeping the schema compact without sacrificing expressiveness. The temporal attributes (`incident_date`, `review_date`, `effective_date`, `expiry_date`, `created_at`, `updated_at`) provide a complete audit trail across all entity types, supporting both historical analysis and compliance reporting.