The safeguarding domain captures the lifecycle of child-protection governance within an educational institution: policies are issued, legal frameworks give them statutory force, incidents are recorded and classified by abuse type, students and staff members are the people at the heart of every case, and safeguarding protocols and referrals operationalise the response. The relational schema models this ecosystem as a set of normalised base tables linked by foreign keys and junction tables, then exposes the domain through twenty materialised views that reassemble the normalised facts into human-readable summaries. Every identifier, date, and classification in the data traces back to a single source column; every many-to-many relationship is resolved through an explicit junction table.

## Core Entity Tables

The anchor of the model is the `safeguarding_policies` table, which stores each institutional policy as a single row. Its primary key is `safeguarding_policy_id`, a surrogate integer, while the business-unique `policy_identifier` carries values such as `POL-2480` and `POL-2498`. The policy row records when it takes effect (`effective_date`), which authority issued it (`issuing_authority` — for example, `extended-issuing-33`), the `jurisdiction` it covers (`regional-jurisdic-30`), the `compliance_standard` it satisfies (`primary-complian-88`), the `review_cycle` (`legacy-review-37`), and a `status` column that cycles through `draft`, `active`, `superseded`, and `archived`. A self-referencing foreign key, `supersedes_safeguarding_policy_id`, lets one policy replace another; row 2 (`POL-2486`) supersedes row 1, and row 3 supersedes row 2, forming a simple version chain. Two additional foreign keys, `student_id` and `staff_member_staff_id`, attach each policy to a specific student and staff member — in row 1 the student is `937735` and the staff member is also `937735` (Stephanie Collins).

**Table `safeguarding_policies`**

| safeguarding_policy_id | policy_identifier | effective_date | issuing_authority | jurisdiction | compliance_standard | review_cycle | status | supersedes_safeguarding_policy_id | student_id | staff_member_staff_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | POL-2480 | 2023-02-14 | extended-issuing-33 | regional-jurisdic-30 | primary-complian-88 | legacy-review-37 | draft | 1 | 1 | 937735 |
| 2 | POL-2486 | 2024-07-25 | integrated-issuing-34 | legacy-jurisdic-31 | adaptive-complian-89 | compact-review-38 | active | 2 | 2 | 3158139 |
| 3 | POL-2492 | 2025-12-09 | seasonal-issuing-35 | compact-jurisdic-32 | distributed-complian-90 | composite-review-39 | superseded | 3 | 3 | 8189502 |
| 4 | POL-2498 | 2022-05-20 | regional-issuing-36 | composite-jurisdic-33 | baseline-complian-91 | primary-review-40 | archived | 4 | 4 | 69438 |

The `legal_frameworks` table gives each policy its statutory backing. Its primary key is `id`, and the business identifier `framework_identifier` carries values like `FRA-2787` and `FRA-2790`. The `jurisdiction` column mirrors the policy's jurisdiction (`regional-jurisdic-30`), while `enactment_date` and `issuing_body` (e.g. `baseline-issuing-13`) record when and by whom the framework was enacted. The `framework_type` column distinguishes `treaty`, `federal_law`, `regional_policy`, and `international_convention`. The `status` column takes values `active`, `amended`, and `repealed`. A foreign key `safeguarding_policy_id` links each framework to exactly one safeguarding policy, establishing a one-to-many relationship: policy 1 is backed by framework `FRA-2787`, and policy 4 by `FRA-2790`.

**Table `legal_frameworks`**

| id | framework_identifier | jurisdiction | enactment_date | issuing_body | framework_type | status | safeguarding_policy_id |
|---|---|---|---|---|---|---|---|
| 1 | FRA-2787 | regional-jurisdic-30 | 2022-01-04 | baseline-issuing-13 | treaty | active | 1 |
| 2 | FRA-2788 | legacy-jurisdic-31 | 2023-06-15 | pilot-issuing-14 | federal_law | amended | 2 |
| 3 | FRA-2789 | compact-jurisdic-32 | 2024-11-26 | extended-issuing-15 | regional_policy | repealed | 3 |
| 4 | FRA-2790 | composite-jurisdic-33 | 2025-04-10 | integrated-issuing-16 | international_convention | active | 4 |

Incidents are the operational heart of the system. The `incidents` table stores each event with surrogate key `id` and business key `incident_id` (values such as `1336174` and `state_uk_4`). Timestamps `reported_date` and `incident_date` capture when the event was logged and when it occurred. The `location` column holds values like `extended-location-99` and `integrated-location-100`. A numeric `severity_rating` (39, 43, 47, 51) and a categorical `risk_level` (`low`, `medium`, `high`, `critical`) describe the event's gravity. The `status` column tracks the investigation lifecycle: `reported`, `under_investigation`, `substantiated`, and `unsubstantiated`. A foreign key `staff_member_staff_id` ties the incident to the staff member who reported or is involved — incident 1 is linked to staff member `937735` (Stephanie Collins), incident 3 to `8189502` (Upal Saha).

**Table `incidents`**

| id | incident_id | reported_date | incident_date | location | severity_rating | status | risk_level | staff_member_staff_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 1336174 | 2025-04-27T03:09:00 | 2022-09-26T20:48:00 | extended-location-99 | 39 | reported | low | 937735 |
| 2 | state_uk_4 | 2022-09-11T10:26:00 | 2023-02-10T03:05:00 | integrated-location-100 | 43 | under_investigation | medium | 3158139 |
| 3 | 2933483 | 2023-02-22T17:43:00 | 2024-07-21T10:22:00 | seasonal-location-101 | 47 | substantiated | high | 8189502 |
| 4 | 2986243 | 2024-07-06T00:00:00 | 2025-12-05T17:39:00 | regional-location-102 | 51 | unsubstantiated | critical | 69438 |

The `abuse_types` table classifies the nature of each incident. Its primary key is `abuse_code`, a UUID such as `c747f9a8-8fcc-11eb-924d-9cd76263cbd0` or the integer `4447035`. The `definition` column holds abbreviated labels (`primary-definiti-22`, `adaptive-definiti-23`). The `severity_level` is a numeric score (29, 40, 51, 62), `requires_mandatory_reporting` is a boolean (`true` for physical and sexual abuse, `false` for emotional and neglect), and `classification` takes the values `physical`, `emotional`, `sexual`, and `neglect`. A foreign key `incident_id` links each abuse type to exactly one incident, so incident 1 is classified as `physical`, incident 3 as `sexual`.

**Table `abuse_types`**

| abuse_code | definition | severity_level | requires_mandatory_reporting | classification | incident_id |
|---|---|---|---|---|---|
| c747f9a8-8fcc-11eb-924d-9cd76263cbd0 | primary-definiti-22 | 29 | true | physical | 1 |
| 4447035 | adaptive-definiti-23 | 40 | false | emotional | 2 |
| 8189490 | distributed-definiti-24 | 51 | true | sexual | 3 |
| 4bbb5d4c-9bad-11eb-a8a2-19ed5c03f8d3 | baseline-definiti-25 | 62 | false | neglect | 4 |

Students and staff members are modelled as parallel entity tables. The `students` table carries surrogate key `id`, business key `student_id` (values like `392507`, `25388256`, `id_16`, `gd_taxc_2211`), and the personal fields `first_name` and `last_name` (Stephanie Collins, Janice Johnston, Upal Saha, Katherine Snyder). The `date_of_birth` column stores dates such as `2025-04-02`. The `enrollment_status` column takes values `active`, `suspended`, `withdrawn`, and `expelled`. A `guardian_contact_id` (Karen Keller, Stephanie Lawrence, Walter Pratt, Julian Brown) and a `risk_profile` (`standard`, `at_risk`, `high_needs`) provide additional context. A foreign key `incident_id` links each student to an incident — student 1 to incident 1, student 2 to incident 2.

**Table `students`**

| id | student_id | first_name | last_name | date_of_birth | enrollment_status | guardian_contact_id | risk_profile | incident_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 392507 | Stephanie Collins | Paul Allen | 2025-04-02 | active | Karen Keller | standard | 1 |
| 2 | 25388256 | Janice Johnston | Heather Beasley | 2022-09-13 | suspended | Stephanie Lawrence | at_risk | 2 |
| 3 | id_16 | Upal Saha | Audrey Taylor | 2023-02-24 | withdrawn | Walter Pratt | high_needs | 3 |
| 4 | gd_taxc_2211 | Katherine Snyder | Susan Wagner | 2024-07-08 | expelled | Julian Brown | standard | 4 |

The `staff_members` table mirrors this structure with surrogate key `id` and business key `staff_id` (values `937735`, `3158139`, `8189502`, `69438`). The `first_name` and `last_name` columns hold the same names as in the students table because the data reflects staff members who are also recorded as students in this fictional dataset. The `employment_status` column takes values `active`, `on_leave`, `terminated`, and `suspended`. The `role` column distinguishes `teacher`, `administrator`, `counselor`, and `support_staff`. The `last_training_date` and `background_check_status` (values `passed`, `pending`, `failed`, `expired`) track compliance. A foreign key `staff_member_staff_id` links the staff member to an incident, and a separate `incident_id` column provides a second linkage point.

**Table `staff_members`**

| staff_id | first_name | last_name | employment_status | role | last_training_date | background_check_status | staff_member_staff_id | incident_id |
|---|---|---|---|---|---|---|---|---|
| 937735 | Stephanie Collins | Paul Allen | active | teacher | 2022-01-16 | passed | 937735 | 1 |
| 3158139 | Janice Johnston | Heather Beasley | on_leave | administrator | 2023-06-27 | pending | 3158139 | 2 |
| 8189502 | Upal Saha | Audrey Taylor | terminated | counselor | 2024-11-11 | failed | 8189502 | 3 |
| 69438 | Katherine Snyder | Susan Wagner | suspended | support_staff | 2025-04-22 | expired | 69438 | 4 |

## Safeguarding Protocols and Referrals

The `safeguarding_protocols` table stores the procedural responses that staff members must follow when an incident occurs. Although the sample data does not display its rows, the table is a first-class entity in the model, linked to staff members through the junction tables `members_protocols` and `protocols_members`, and to incidents through the view `safeguarding_protocol_incident_view`. Each protocol row represents a named procedure — for example, a mandatory-reporting workflow or a risk-assessment checklist — that is assigned to specific staff members and triggered by specific incident types.

**Table `safeguarding_protocols`**

| protocol_id | protocol_name | trigger_condition | required_action | deadline_hours | status | incident_id | referral_id |
|---|---|---|---|---|---|---|---|
| 9085260 | Baseline Initiative D | legacy-trigger-49 | primary-required-94 | 33 | initiated | 1 | 1 |
| 6926357 | Distributed Model | compact-trigger-50 | adaptive-required-95 | 43 | in_progress | 2 | 2 |
| 4277008 | Adaptive Cluster | composite-trigger-51 | distributed-required-96 | 53 | completed | 3 | 3 |
| 726040 | Primary Review A | primary-trigger-52 | baseline-required-97 | 63 | escalated | 4 | 4 |

The `referrals` table records formal referrals to external agencies or internal safeguarding teams. Like `safeguarding_protocols`, its row-level data is not shown in the sample, but the table is linked to incidents and staff members through the views `referral_incident_view` and `referral_staff_member_view`. A referral row captures who initiated the referral, which incident prompted it, and the current status of the referral process.

**Table `referrals`**

| referral_id | submitted_date | recipient_agency | agency_contact | referral_type | status | incident_id | staff_member_staff_id |
|---|---|---|---|---|---|---|---|
| 1 | 2022-09-06T08:12:00 | Litton Industries | Ocean Network Express Pte Ltd | police | submitted | 1 | 937735 |
| 2 | 2023-02-17T15:29:00 | LINK Interchange Network Ltd | National Beverage Corp. | social_services | acknowledged | 2 | 3158139 |
| 3 | 2024-07-01T22:46:00 | Tata Steel | Pan-United Corporation Ltd | health_authority | under_review | 3 | 8189502 |
| 4 | 2025-12-12T05:03:00 | TDS TODOS DATA SYSTEM AB | Align Technology | education_authority | closed | 4 | 69438 |

## Junction Tables and Many-to-Many Relationships

Several relationships in the safeguarding domain are inherently many-to-many, and the schema resolves them through explicit junction tables. The `policies_frameworks` table links safeguarding policies to legal frameworks, allowing a single policy to be supported by multiple frameworks and a single framework to underpin multiple policies. The `frameworks_types` table connects legal frameworks to abuse types, enabling a framework to address multiple classifications of abuse. The `types_protocols` table binds abuse types to safeguarding protocols, so that each abuse classification triggers one or more procedural responses.

**Table `policies_frameworks`**

| safeguarding_policy_id | legal_framework_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

**Table `frameworks_types`**

| legal_framework_id | abuse_type_abuse_code |
|---|---|
| 1 | c747f9a8-8fcc-11eb-924d-9cd76263cbd0 |
| 1 | 4447035 |
| 2 | 4447035 |
| 2 | 8189490 |
| 3 | 8189490 |
| 3 | 4bbb5d4c-9bad-11eb-a8a2-19ed5c03f8d3 |
| 4 | 4bbb5d4c-9bad-11eb-a8a2-19ed5c03f8d3 |
| 4 | c747f9a8-8fcc-11eb-924d-9cd76263cbd0 |

**Table `types_protocols`**

| abuse_type_abuse_code | protocol_id |
|---|---|
| c747f9a8-8fcc-11eb-924d-9cd76263cbd0 | 9085260 |
| c747f9a8-8fcc-11eb-924d-9cd76263cbd0 | 6926357 |
| 4447035 | 6926357 |
| 4447035 | 4277008 |
| 8189490 | 4277008 |
| 8189490 | 726040 |
| 4bbb5d4c-9bad-11eb-a8a2-19ed5c03f8d3 | 726040 |
| 4bbb5d4c-9bad-11eb-a8a2-19ed5c03f8d3 | 9085260 |

The `incidents_students` junction table resolves the relationship between incidents and students. While the `students` table carries a single `incident_id` foreign key, the junction table allows a student to be associated with multiple incidents and an incident to involve multiple students. Similarly, `incidents_types` links incidents to abuse types, supporting the case where a single incident involves multiple classifications of abuse.

**Table `incidents_students`**

| incident_id | student_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

**Table `incidents_types`**

| incident_id | abuse_type_abuse_code |
|---|---|
| 1 | c747f9a8-8fcc-11eb-924d-9cd76263cbd0 |
| 1 | 4447035 |
| 2 | 4447035 |
| 2 | 8189490 |
| 3 | 8189490 |
| 3 | 4bbb5d4c-9bad-11eb-a8a2-19ed5c03f8d3 |
| 4 | 4bbb5d4c-9bad-11eb-a8a2-19ed5c03f8d3 |
| 4 | c747f9a8-8fcc-11eb-924d-9cd76263cbd0 |

The `members_protocols` and `protocols_members` tables form a bidirectional many-to-many link between staff members and safeguarding protocols. `members_protocols` records which staff members are trained in or assigned to which protocols, while `protocols_members` provides the reverse mapping. This dual-junction design supports auditing: one can query which protocols a staff member has completed, or which staff members are qualified to execute a given protocol.

**Table `members_protocols`**

| staff_member_staff_id | protocol_id |
|---|---|
| 937735 | 9085260 |
| 937735 | 6926357 |
| 3158139 | 6926357 |
| 3158139 | 4277008 |
| 8189502 | 4277008 |
| 8189502 | 726040 |
| 69438 | 726040 |
| 69438 | 9085260 |

**Table `protocols_members`**

| protocol_id | staff_member_staff_id |
|---|---|
| 9085260 | 937735 |
| 9085260 | 3158139 |
| 6926357 | 3158139 |
| 6926357 | 8189502 |
| 4277008 | 8189502 |
| 4277008 | 69438 |
| 726040 | 69438 |
| 726040 | 937735 |

## Views: Reconstructing Domain Facts

The twenty views in the schema materialise the most common analytical and operational queries by joining the normalised tables. Each view answers a specific question about the domain, and reading its output rows reveals how the join reconstructs a coherent fact from distributed columns.

The `safeguarding_policy_safeguarding_policy_view` presents a self-contained summary of each policy, including its identifier, effective date, issuing authority, jurisdiction, compliance standard, review cycle, and status. For policy `POL-2480` (row 1), the view shows the `extended-issuing-33` authority, the `regional-jurisdic-30` jurisdiction, and the `draft` status, alongside the linked student `937735` and staff member `937735`.

**View `safeguarding_policy_safeguarding_policy_view`**

```sql
CREATE VIEW safeguarding_policy_safeguarding_policy_view AS
SELECT a.safeguarding_policy_id, a.policy_identifier, a.effective_date, a.issuing_authority, b.safeguarding_policy_id AS policy_safeguarding_policy_id, b.policy_identifier AS policy_policy_identifier, b.effective_date AS policy_effective_date
FROM safeguarding_policies a JOIN safeguarding_policies b ON a.supersedes_safeguarding_policy_id = b.safeguarding_policy_id;
```

| safeguarding_policy_id | policy_identifier | effective_date | issuing_authority | policy_safeguarding_policy_id | policy_policy_identifier | policy_effective_date |
|---|---|---|---|---|---|---|
| 1 | POL-2480 | 2023-02-14 | extended-issuing-33 | 1 | POL-2480 | 2023-02-14 |
| 2 | POL-2486 | 2024-07-25 | integrated-issuing-34 | 2 | POL-2486 | 2024-07-25 |
| 3 | POL-2492 | 2025-12-09 | seasonal-issuing-35 | 3 | POL-2492 | 2025-12-09 |
| 4 | POL-2498 | 2022-05-20 | regional-issuing-36 | 4 | POL-2498 | 2022-05-20 |

The `safeguarding_policy_legal_framework_detail_view` joins `safeguarding_policies` to `legal_frameworks`, answering the question: "Which legal frameworks support each policy?" For policy `POL-2480`, the view reveals framework `FRA-2787` of type `treaty`, enacted on `2022-01-04` by `baseline-issuing-13`, with `active` status.

**View `safeguarding_policy_legal_framework_detail_view`**

```sql
CREATE VIEW safeguarding_policy_legal_framework_detail_view AS
SELECT a.safeguarding_policy_id, a.policy_identifier, a.effective_date, b.id AS framework_id, b.framework_identifier AS framework_framework_identifier, b.jurisdiction AS framework_jurisdiction
FROM safeguarding_policies a
  JOIN policies_frameworks j ON j.safeguarding_policy_id = a.safeguarding_policy_id
  JOIN legal_frameworks b ON b.id = j.legal_framework_id;
```

| safeguarding_policy_id | policy_identifier | effective_date | framework_id | framework_framework_identifier | framework_jurisdiction |
|---|---|---|---|---|---|
| 1 | POL-2480 | 2023-02-14 | 1 | FRA-2787 | regional-jurisdic-30 |
| 1 | POL-2480 | 2023-02-14 | 2 | FRA-2788 | legacy-jurisdic-31 |
| 2 | POL-2486 | 2024-07-25 | 2 | FRA-2788 | legacy-jurisdic-31 |
| 2 | POL-2486 | 2024-07-25 | 3 | FRA-2789 | compact-jurisdic-32 |
| 3 | POL-2492 | 2025-12-09 | 3 | FRA-2789 | compact-jurisdic-32 |
| 3 | POL-2492 | 2025-12-09 | 4 | FRA-2790 | composite-jurisdic-33 |
| 4 | POL-2498 | 2022-05-20 | 4 | FRA-2790 | composite-jurisdic-33 |
| 4 | POL-2498 | 2022-05-20 | 1 | FRA-2787 | regional-jurisdic-30 |

The `safeguarding_policy_student_view` and `safeguarding_policy_staff_member_view` attach the student and staff member details to each policy row. The student view for policy `POL-2480` surfaces student `392507` (Stephanie Collins, enrolled `active`, risk profile `standard`), while the staff member view surfaces staff `937735` (Stephanie Collins, role `teacher`, employment status `active`, background check `passed`).

**View `safeguarding_policy_student_view`**

```sql
CREATE VIEW safeguarding_policy_student_view AS
SELECT a.safeguarding_policy_id, a.policy_identifier, a.effective_date, a.issuing_authority, b.id AS student_id, b.student_id AS student_student_id, b.first_name AS student_first_name
FROM safeguarding_policies a JOIN students b ON a.student_id = b.id;
```

| safeguarding_policy_id | policy_identifier | effective_date | issuing_authority | student_id | student_student_id | student_first_name |
|---|---|---|---|---|---|---|
| 1 | POL-2480 | 2023-02-14 | extended-issuing-33 | 1 | 392507 | Stephanie Collins |
| 2 | POL-2486 | 2024-07-25 | integrated-issuing-34 | 2 | 25388256 | Janice Johnston |
| 3 | POL-2492 | 2025-12-09 | seasonal-issuing-35 | 3 | id_16 | Upal Saha |
| 4 | POL-2498 | 2022-05-20 | regional-issuing-36 | 4 | gd_taxc_2211 | Katherine Snyder |

**View `safeguarding_policy_staff_member_view`**

```sql
CREATE VIEW safeguarding_policy_staff_member_view AS
SELECT a.safeguarding_policy_id, a.policy_identifier, a.effective_date, a.issuing_authority, b.staff_id AS member_staff_id, b.first_name AS member_first_name, b.last_name AS member_last_name
FROM safeguarding_policies a JOIN staff_members b ON a.staff_member_staff_id = b.staff_id;
```

| safeguarding_policy_id | policy_identifier | effective_date | issuing_authority | member_staff_id | member_first_name | member_last_name |
|---|---|---|---|---|---|---|
| 1 | POL-2480 | 2023-02-14 | extended-issuing-33 | 937735 | Stephanie Collins | Paul Allen |
| 2 | POL-2486 | 2024-07-25 | integrated-issuing-34 | 3158139 | Janice Johnston | Heather Beasley |
| 3 | POL-2492 | 2025-12-09 | seasonal-issuing-35 | 8189502 | Upal Saha | Audrey Taylor |
| 4 | POL-2498 | 2022-05-20 | regional-issuing-36 | 69438 | Katherine Snyder | Susan Wagner |

The `legal_framework_safeguarding_policy_view` reverses the perspective, presenting each legal framework alongside the policy it supports. Framework `FRA-2787` is shown with its supporting policy `POL-2480`, and framework `FRA-2790` with policy `POL-2498`.

**View `legal_framework_safeguarding_policy_view`**

```sql
CREATE VIEW legal_framework_safeguarding_policy_view AS
SELECT a.id, a.framework_identifier, a.jurisdiction, a.enactment_date, b.safeguarding_policy_id AS policy_safeguarding_policy_id, b.policy_identifier AS policy_policy_identifier, b.effective_date AS policy_effective_date
FROM legal_frameworks a JOIN safeguarding_policies b ON a.safeguarding_policy_id = b.safeguarding_policy_id;
```

| id | framework_identifier | jurisdiction | enactment_date | policy_safeguarding_policy_id | policy_policy_identifier | policy_effective_date |
|---|---|---|---|---|---|---|
| 1 | FRA-2787 | regional-jurisdic-30 | 2022-01-04 | 1 | POL-2480 | 2023-02-14 |
| 2 | FRA-2788 | legacy-jurisdic-31 | 2023-06-15 | 2 | POL-2486 | 2024-07-25 |
| 3 | FRA-2789 | compact-jurisdic-32 | 2024-11-26 | 3 | POL-2492 | 2025-12-09 |
| 4 | FRA-2790 | composite-jurisdic-33 | 2025-04-10 | 4 | POL-2498 | 2022-05-20 |

The `legal_framework_abuse_type_detail_view` connects legal frameworks to the abuse types they govern, via the `frameworks_types` junction. This view answers: "What abuse classifications fall under each legal framework?"

**View `legal_framework_abuse_type_detail_view`**

```sql
CREATE VIEW legal_framework_abuse_type_detail_view AS
SELECT a.id, a.framework_identifier, a.jurisdiction, b.abuse_code AS type_abuse_code, b.definition AS type_definition, b.severity_level AS type_severity_level
FROM legal_frameworks a
  JOIN frameworks_types j ON j.legal_framework_id = a.id
  JOIN abuse_types b ON b.abuse_code = j.abuse_type_abuse_code;
```

| id | framework_identifier | jurisdiction | type_abuse_code | type_definition | type_severity_level |
|---|---|---|---|---|---|
| 1 | FRA-2787 | regional-jurisdic-30 | c747f9a8-8fcc-11eb-924d-9cd76263cbd0 | primary-definiti-22 | 29 |
| 1 | FRA-2787 | regional-jurisdic-30 | 4447035 | adaptive-definiti-23 | 40 |
| 2 | FRA-2788 | legacy-jurisdic-31 | 4447035 | adaptive-definiti-23 | 40 |
| 2 | FRA-2788 | legacy-jurisdic-31 | 8189490 | distributed-definiti-24 | 51 |
| 3 | FRA-2789 | compact-jurisdic-32 | 8189490 | distributed-definiti-24 | 51 |
| 3 | FRA-2789 | compact-jurisdic-32 | 4bbb5d4c-9bad-11eb-a8a2-19ed5c03f8d3 | baseline-definiti-25 | 62 |
| 4 | FRA-2790 | composite-jurisdic-33 | 4bbb5d4c-9bad-11eb-a8a2-19ed5c03f8d3 | baseline-definiti-25 | 62 |
| 4 | FRA-2790 | composite-jurisdic-33 | c747f9a8-8fcc-11eb-924d-9cd76263cbd0 | primary-definiti-22 | 29 |

The `abuse_type_incident_view` joins `abuse_types` to `incidents`, answering: "Which incident is classified by this abuse type?" For abuse code `c747f9a8-8fcc-11eb-924d-9cd76263cbd0` (classification `physical`, severity `29`, mandatory reporting `true`), the view shows incident `1336174` with risk level `low` and status `reported`.

**View `abuse_type_incident_view`**

```sql
CREATE VIEW abuse_type_incident_view AS
SELECT a.abuse_code, a.definition, a.severity_level, a.requires_mandatory_reporting, b.id AS incident_id, b.incident_id AS incident_incident_id, b.reported_date AS incident_reported_date
FROM abuse_types a JOIN incidents b ON a.incident_id = b.id;
```

| abuse_code | definition | severity_level | requires_mandatory_reporting | incident_id | incident_incident_id | incident_reported_date |
|---|---|---|---|---|---|---|
| c747f9a8-8fcc-11eb-924d-9cd76263cbd0 | primary-definiti-22 | 29 | true | 1 | 1336174 | 2025-04-27T03:09:00 |
| 4447035 | adaptive-definiti-23 | 40 | false | 2 | state_uk_4 | 2022-09-11T10:26:00 |
| 8189490 | distributed-definiti-24 | 51 | true | 3 | 2933483 | 2023-02-22T17:43:00 |
| 4bbb5d4c-9bad-11eb-a8a2-19ed5c03f8d3 | baseline-definiti-25 | 62 | false | 4 | 2986243 | 2024-07-06T00:00:00 |

The `abuse_type_safeguarding_protocol_detail_view` links abuse types to the safeguarding protocols that respond to them, via the `types_protocols` junction. This view answers: "Which protocols are triggered by this abuse classification?"

**View `abuse_type_safeguarding_protocol_detail_view`**

```sql
CREATE VIEW abuse_type_safeguarding_protocol_detail_view AS
SELECT a.abuse_code, a.definition, a.severity_level, b.protocol_id AS protocol_protocol_id, b.protocol_name AS protocol_protocol_name, b.trigger_condition AS protocol_trigger_condition
FROM abuse_types a
  JOIN types_protocols j ON j.abuse_type_abuse_code = a.abuse_code
  JOIN safeguarding_protocols b ON b.protocol_id = j.protocol_id;
```

| abuse_code | definition | severity_level | protocol_protocol_id | protocol_protocol_name | protocol_trigger_condition |
|---|---|---|---|---|---|
| c747f9a8-8fcc-11eb-924d-9cd76263cbd0 | primary-definiti-22 | 29 | 9085260 | Baseline Initiative D | legacy-trigger-49 |
| c747f9a8-8fcc-11eb-924d-9cd76263cbd0 | primary-definiti-22 | 29 | 6926357 | Distributed Model | compact-trigger-50 |
| 4447035 | adaptive-definiti-23 | 40 | 6926357 | Distributed Model | compact-trigger-50 |
| 4447035 | adaptive-definiti-23 | 40 | 4277008 | Adaptive Cluster | composite-trigger-51 |
| 8189490 | distributed-definiti-24 | 51 | 4277008 | Adaptive Cluster | composite-trigger-51 |
| 8189490 | distributed-definiti-24 | 51 | 726040 | Primary Review A | primary-trigger-52 |
| 4bbb5d4c-9bad-11eb-a8a2-19ed5c03f8d3 | baseline-definiti-25 | 62 | 726040 | Primary Review A | primary-trigger-52 |
| 4bbb5d4c-9bad-11eb-a8a2-19ed5c03f8d3 | baseline-definiti-25 | 62 | 9085260 | Baseline Initiative D | legacy-trigger-49 |

The `incident_student_detail_view` joins `incidents` to `students`, answering: "Which student is involved in this incident?" Incident `1336174` (reported `2025-04-27T03:09:00`, location `extended-location-99`, severity `39`) is linked to student `392507` (Stephanie Collins, DOB `2025-04-02`, enrollment `active`, risk profile `standard`).

**View `incident_student_detail_view`**

```sql
CREATE VIEW incident_student_detail_view AS
SELECT a.id, a.incident_id, a.reported_date, b.id AS student_id, b.student_id AS student_student_id, b.first_name AS student_first_name
FROM incidents a
  JOIN incidents_students j ON j.incident_id = a.id
  JOIN students b ON b.id = j.student_id;
```

| id | incident_id | reported_date | student_id | student_student_id | student_first_name |
|---|---|---|---|---|---|
| 1 | 1336174 | 2025-04-27T03:09:00 | 1 | 392507 | Stephanie Collins |
| 1 | 1336174 | 2025-04-27T03:09:00 | 2 | 25388256 | Janice Johnston |
| 2 | state_uk_4 | 2022-09-11T10:26:00 | 2 | 25388256 | Janice Johnston |
| 2 | state_uk_4 | 2022-09-11T10:26:00 | 3 | id_16 | Upal Saha |
| 3 | 2933483 | 2023-02-22T17:43:00 | 3 | id_16 | Upal Saha |
| 3 | 2933483 | 2023-02-22T17:43:00 | 4 | gd_taxc_2211 | Katherine Snyder |
| 4 | 2986243 | 2024-07-06T00:00:00 | 4 | gd_taxc_2211 | Katherine Snyder |
| 4 | 2986243 | 2024-07-06T00:00:00 | 1 | 392507 | Stephanie Collins |

The `incident_staff_member_view` joins `incidents` to `staff_members`, answering: "Which staff member is associated with this incident?" Incident `1336174` is linked to staff member `937735` (Stephanie Collins, role `teacher`, employment status `active`, last training `2022-01-16`, background check `passed`).

**View `incident_staff_member_view`**

```sql
CREATE VIEW incident_staff_member_view AS
SELECT a.id, a.incident_id, a.reported_date, a.incident_date, b.staff_id AS member_staff_id, b.first_name AS member_first_name, b.last_name AS member_last_name
FROM incidents a JOIN staff_members b ON a.staff_member_staff_id = b.staff_id;
```

| id | incident_id | reported_date | incident_date | member_staff_id | member_first_name | member_last_name |
|---|---|---|---|---|---|---|
| 1 | 1336174 | 2025-04-27T03:09:00 | 2022-09-26T20:48:00 | 937735 | Stephanie Collins | Paul Allen |
| 2 | state_uk_4 | 2022-09-11T10:26:00 | 2023-02-10T03:05:00 | 3158139 | Janice Johnston | Heather Beasley |
| 3 | 2933483 | 2023-02-22T17:43:00 | 2024-07-21T10:22:00 | 8189502 | Upal Saha | Audrey Taylor |
| 4 | 2986243 | 2024-07-06T00:00:00 | 2025-12-05T17:39:00 | 69438 | Katherine Snyder | Susan Wagner |

The `incident_abuse_type_detail_view` joins `incidents` to `abuse_types`, answering: "What abuse classification applies to this incident?" Incident `1336174` is classified as `physical` abuse with severity level `29` and mandatory reporting required.

**View `incident_abuse_type_detail_view`**

```sql
CREATE VIEW incident_abuse_type_detail_view AS
SELECT a.id, a.incident_id, a.reported_date, b.abuse_code AS type_abuse_code, b.definition AS type_definition, b.severity_level AS type_severity_level
FROM incidents a
  JOIN incidents_types j ON j.incident_id = a.id
  JOIN abuse_types b ON b.abuse_code = j.abuse_type_abuse_code;
```

| id | incident_id | reported_date | type_abuse_code | type_definition | type_severity_level |
|---|---|---|---|---|---|
| 1 | 1336174 | 2025-04-27T03:09:00 | c747f9a8-8fcc-11eb-924d-9cd76263cbd0 | primary-definiti-22 | 29 |
| 1 | 1336174 | 2025-04-27T03:09:00 | 4447035 | adaptive-definiti-23 | 40 |
| 2 | state_uk_4 | 2022-09-11T10:26:00 | 4447035 | adaptive-definiti-23 | 40 |
| 2 | state_uk_4 | 2022-09-11T10:26:00 | 8189490 | distributed-definiti-24 | 51 |
| 3 | 2933483 | 2023-02-22T17:43:00 | 8189490 | distributed-definiti-24 | 51 |
| 3 | 2933483 | 2023-02-22T17:43:00 | 4bbb5d4c-9bad-11eb-a8a2-19ed5c03f8d3 | baseline-definiti-25 | 62 |
| 4 | 2986243 | 2024-07-06T00:00:00 | 4bbb5d4c-9bad-11eb-a8a2-19ed5c03f8d3 | baseline-definiti-25 | 62 |
| 4 | 2986243 | 2024-07-06T00:00:00 | c747f9a8-8fcc-11eb-924d-9cd76263cbd0 | primary-definiti-22 | 29 |

The `student_incident_view` reverses the student-to-incident direction, presenting each student alongside their associated incident. Student `392507` (Stephanie Collins, enrollment `active`) is shown with incident `1336174` (status `reported`, risk level `low`).

**View `student_incident_view`**

```sql
CREATE VIEW student_incident_view AS
SELECT a.id, a.student_id, a.first_name, a.last_name, b.id AS incident_id, b.incident_id AS incident_incident_id, b.reported_date AS incident_reported_date
FROM students a JOIN incidents b ON a.incident_id = b.id;
```

| id | student_id | first_name | last_name | incident_id | incident_incident_id | incident_reported_date |
|---|---|---|---|---|---|---|
| 1 | 392507 | Stephanie Collins | Paul Allen | 1 | 1336174 | 2025-04-27T03:09:00 |
| 2 | 25388256 | Janice Johnston | Heather Beasley | 2 | state_uk_4 | 2022-09-11T10:26:00 |
| 3 | id_16 | Upal Saha | Audrey Taylor | 3 | 2933483 | 2023-02-22T17:43:00 |
| 4 | gd_taxc_2211 | Katherine Snyder | Susan Wagner | 4 | 2986243 | 2024-07-06T00:00:00 |

The `staff_member_staff_member_view` presents a self-contained summary of each staff member, including their identifier, name, employment status, role, last training date, and background check status. Staff member `937735` (Stephanie Collins, role `teacher`, status `active`, background check `passed`) is one such row.

**View `staff_member_staff_member_view`**

```sql
CREATE VIEW staff_member_staff_member_view AS
SELECT a.staff_id, a.first_name, a.last_name, a.employment_status, b.staff_id AS member_staff_id, b.first_name AS member_first_name, b.last_name AS member_last_name
FROM staff_members a JOIN staff_members b ON a.staff_member_staff_id = b.staff_id;
```

| staff_id | first_name | last_name | employment_status | member_staff_id | member_first_name | member_last_name |
|---|---|---|---|---|---|---|
| 937735 | Stephanie Collins | Paul Allen | active | 937735 | Stephanie Collins | Paul Allen |
| 3158139 | Janice Johnston | Heather Beasley | on_leave | 3158139 | Janice Johnston | Heather Beasley |
| 8189502 | Upal Saha | Audrey Taylor | terminated | 8189502 | Upal Saha | Audrey Taylor |
| 69438 | Katherine Snyder | Susan Wagner | suspended | 69438 | Katherine Snyder | Susan Wagner |

The `staff_member_incident_view` joins `staff_members` to `incidents`, answering: "Which incidents involve this staff member?" Staff member `937735` (Stephanie Collins, teacher) is linked to incident `1336174` (reported `2025-04-27`, risk level `low`).

**View `staff_member_incident_view`**

```sql
CREATE VIEW staff_member_incident_view AS
SELECT a.staff_id, a.first_name, a.last_name, a.employment_status, b.id AS incident_id, b.incident_id AS incident_incident_id, b.reported_date AS incident_reported_date
FROM staff_members a JOIN incidents b ON a.incident_id = b.id;
```

| staff_id | first_name | last_name | employment_status | incident_id | incident_incident_id | incident_reported_date |
|---|---|---|---|---|---|---|
| 937735 | Stephanie Collins | Paul Allen | active | 1 | 1336174 | 2025-04-27T03:09:00 |
| 3158139 | Janice Johnston | Heather Beasley | on_leave | 2 | state_uk_4 | 2022-09-11T10:26:00 |
| 8189502 | Upal Saha | Audrey Taylor | terminated | 3 | 2933483 | 2023-02-22T17:43:00 |
| 69438 | Katherine Snyder | Susan Wagner | suspended | 4 | 2986243 | 2024-07-06T00:00:00 |

The `staff_member_safeguarding_protocol_detail_view` connects staff members to the safeguarding protocols they are assigned to, via the `members_protocols` junction. This view answers: "Which protocols is this staff member trained in or assigned to?"

**View `staff_member_safeguarding_protocol_detail_view`**

```sql
CREATE VIEW staff_member_safeguarding_protocol_detail_view AS
SELECT a.staff_id, a.first_name, a.last_name, b.protocol_id AS protocol_protocol_id, b.protocol_name AS protocol_protocol_name, b.trigger_condition AS protocol_trigger_condition
FROM staff_members a
  JOIN members_protocols j ON j.staff_member_staff_id = a.staff_id
  JOIN safeguarding_protocols b ON b.protocol_id = j.protocol_id;
```

| staff_id | first_name | last_name | protocol_protocol_id | protocol_protocol_name | protocol_trigger_condition |
|---|---|---|---|---|---|
| 937735 | Stephanie Collins | Paul Allen | 9085260 | Baseline Initiative D | legacy-trigger-49 |
| 937735 | Stephanie Collins | Paul Allen | 6926357 | Distributed Model | compact-trigger-50 |
| 3158139 | Janice Johnston | Heather Beasley | 6926357 | Distributed Model | compact-trigger-50 |
| 3158139 | Janice Johnston | Heather Beasley | 4277008 | Adaptive Cluster | composite-trigger-51 |
| 8189502 | Upal Saha | Audrey Taylor | 4277008 | Adaptive Cluster | composite-trigger-51 |
| 8189502 | Upal Saha | Audrey Taylor | 726040 | Primary Review A | primary-trigger-52 |
| 69438 | Katherine Snyder | Susan Wagner | 726040 | Primary Review A | primary-trigger-52 |
| 69438 | Katherine Snyder | Susan Wagner | 9085260 | Baseline Initiative D | legacy-trigger-49 |

The `safeguarding_protocol_incident_view` joins `safeguarding_protocols` to `incidents`, answering: "Which incidents trigger this safeguarding protocol?" This view materialises the `types_protocols` and `incidents_types` chain, reconstructing the full path from incident to abuse type to protocol.

**View `safeguarding_protocol_incident_view`**

```sql
CREATE VIEW safeguarding_protocol_incident_view AS
SELECT a.protocol_id, a.protocol_name, a.trigger_condition, a.required_action, b.id AS incident_id, b.incident_id AS incident_incident_id, b.reported_date AS incident_reported_date
FROM safeguarding_protocols a JOIN incidents b ON a.incident_id = b.id;
```

| protocol_id | protocol_name | trigger_condition | required_action | incident_id | incident_incident_id | incident_reported_date |
|---|---|---|---|---|---|---|
| 9085260 | Baseline Initiative D | legacy-trigger-49 | primary-required-94 | 1 | 1336174 | 2025-04-27T03:09:00 |
| 6926357 | Distributed Model | compact-trigger-50 | adaptive-required-95 | 2 | state_uk_4 | 2022-09-11T10:26:00 |
| 4277008 | Adaptive Cluster | composite-trigger-51 | distributed-required-96 | 3 | 2933483 | 2023-02-22T17:43:00 |
| 726040 | Primary Review A | primary-trigger-52 | baseline-required-97 | 4 | 2986243 | 2024-07-06T00:00:00 |

The `safeguarding_protocol_staff_member_detail_view` joins `safeguarding_protocols` to `staff_members`, answering: "Which staff members are assigned to this protocol?" This view materialises the `protocols_members` junction, providing the reverse of `staff_member_safeguarding_protocol_detail_view`.

**View `safeguarding_protocol_staff_member_detail_view`**

```sql
CREATE VIEW safeguarding_protocol_staff_member_detail_view AS
SELECT a.protocol_id, a.protocol_name, a.trigger_condition, b.staff_id AS member_staff_id, b.first_name AS member_first_name, b.last_name AS member_last_name
FROM safeguarding_protocols a
  JOIN protocols_members j ON j.protocol_id = a.protocol_id
  JOIN staff_members b ON b.staff_id = j.staff_member_staff_id;
```

| protocol_id | protocol_name | trigger_condition | member_staff_id | member_first_name | member_last_name |
|---|---|---|---|---|---|
| 9085260 | Baseline Initiative D | legacy-trigger-49 | 937735 | Stephanie Collins | Paul Allen |
| 9085260 | Baseline Initiative D | legacy-trigger-49 | 3158139 | Janice Johnston | Heather Beasley |
| 6926357 | Distributed Model | compact-trigger-50 | 3158139 | Janice Johnston | Heather Beasley |
| 6926357 | Distributed Model | compact-trigger-50 | 8189502 | Upal Saha | Audrey Taylor |
| 4277008 | Adaptive Cluster | composite-trigger-51 | 8189502 | Upal Saha | Audrey Taylor |
| 4277008 | Adaptive Cluster | composite-trigger-51 | 69438 | Katherine Snyder | Susan Wagner |
| 726040 | Primary Review A | primary-trigger-52 | 69438 | Katherine Snyder | Susan Wagner |
| 726040 | Primary Review A | primary-trigger-52 | 937735 | Stephanie Collins | Paul Allen |

The `safeguarding_protocol_referral_view` joins `safeguarding_protocols` to `referrals`, answering: "Which referrals are associated with this protocol?" This view links procedural responses to formal referral records.

**View `safeguarding_protocol_referral_view`**

```sql
CREATE VIEW safeguarding_protocol_referral_view AS
SELECT a.protocol_id, a.protocol_name, a.trigger_condition, a.required_action, b.referral_id AS referral_referral_id, b.submitted_date AS referral_submitted_date, b.recipient_agency AS referral_recipient_agency
FROM safeguarding_protocols a JOIN referrals b ON a.referral_id = b.referral_id;
```

| protocol_id | protocol_name | trigger_condition | required_action | referral_referral_id | referral_submitted_date | referral_recipient_agency |
|---|---|---|---|---|---|---|
| 9085260 | Baseline Initiative D | legacy-trigger-49 | primary-required-94 | 1 | 2022-09-06T08:12:00 | Litton Industries |
| 6926357 | Distributed Model | compact-trigger-50 | adaptive-required-95 | 2 | 2023-02-17T15:29:00 | LINK Interchange Network Ltd |
| 4277008 | Adaptive Cluster | composite-trigger-51 | distributed-required-96 | 3 | 2024-07-01T22:46:00 | Tata Steel |
| 726040 | Primary Review A | primary-trigger-52 | baseline-required-97 | 4 | 2025-12-12T05:03:00 | TDS TODOS DATA SYSTEM AB |

The `referral_incident_view` joins `referrals` to `incidents`, answering: "Which incident prompted this referral?" This view materialises the causal chain from incident to formal referral.

**View `referral_incident_view`**

```sql
CREATE VIEW referral_incident_view AS
SELECT a.referral_id, a.submitted_date, a.recipient_agency, a.agency_contact, b.id AS incident_id, b.incident_id AS incident_incident_id, b.reported_date AS incident_reported_date
FROM referrals a JOIN incidents b ON a.incident_id = b.id;
```

| referral_id | submitted_date | recipient_agency | agency_contact | incident_id | incident_incident_id | incident_reported_date |
|---|---|---|---|---|---|---|
| 1 | 2022-09-06T08:12:00 | Litton Industries | Ocean Network Express Pte Ltd | 1 | 1336174 | 2025-04-27T03:09:00 |
| 2 | 2023-02-17T15:29:00 | LINK Interchange Network Ltd | National Beverage Corp. | 2 | state_uk_4 | 2022-09-11T10:26:00 |
| 3 | 2024-07-01T22:46:00 | Tata Steel | Pan-United Corporation Ltd | 3 | 2933483 | 2023-02-22T17:43:00 |
| 4 | 2025-12-12T05:03:00 | TDS TODOS DATA SYSTEM AB | Align Technology | 4 | 2986243 | 2024-07-06T00:00:00 |

The `referral_staff_member_view` joins `referrals` to `staff_members`, answering: "Which staff member initiated or is responsible for this referral?" This view links the human actor to the referral record.

**View `referral_staff_member_view`**

```sql
CREATE VIEW referral_staff_member_view AS
SELECT a.referral_id, a.submitted_date, a.recipient_agency, a.agency_contact, b.staff_id AS member_staff_id, b.first_name AS member_first_name, b.last_name AS member_last_name
FROM referrals a JOIN staff_members b ON a.staff_member_staff_id = b.staff_id;
```

| referral_id | submitted_date | recipient_agency | agency_contact | member_staff_id | member_first_name | member_last_name |
|---|---|---|---|---|---|---|
| 1 | 2022-09-06T08:12:00 | Litton Industries | Ocean Network Express Pte Ltd | 937735 | Stephanie Collins | Paul Allen |
| 2 | 2023-02-17T15:29:00 | LINK Interchange Network Ltd | National Beverage Corp. | 3158139 | Janice Johnston | Heather Beasley |
| 3 | 2024-07-01T22:46:00 | Tata Steel | Pan-United Corporation Ltd | 8189502 | Upal Saha | Audrey Taylor |
| 4 | 2025-12-12T05:03:00 | TDS TODOS DATA SYSTEM AB | Align Technology | 69438 | Katherine Snyder | Susan Wagner |

## Synthesis

The safeguarding schema models a domain where policies carry legal force, incidents are classified by abuse type, students and staff members are the people at the centre of every case, and protocols and referrals operationalise the response. The normalised base tables — `safeguarding_policies`, `legal_frameworks`, `abuse_types`, `incidents`, `students`, `staff_members`, `safeguarding_protocols`, and `referrals` — each store a single facet of the domain, linked by foreign keys such as `safeguarding_policy_id` in `legal_frameworks` and `incident_id` in `abuse_types`. Many-to-many relationships are resolved through seven junction tables: `policies_frameworks`, `frameworks_types`, `types_protocols`, `incidents_students`, `incidents_types`, `members_protocols`, and `protocols_members`. The twenty views then reassemble these normalised facts into domain-readable summaries, each answering a specific question — from "which legal framework supports this policy?" to "which staff member is assigned to this protocol?" — by joining the appropriate tables and projecting the relevant columns. The result is a schema that is both normalised enough to avoid update anomalies and exposed through views that present the domain as the safeguarding professionals who use it understand it.