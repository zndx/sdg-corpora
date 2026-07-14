## Safeguarding Records and Their Interdependencies

Safeguarding systems exist to protect vulnerable individuals within institutional settings, and the integrity of any such system depends on how well its records interlock. The dataset under examination captures the full lifecycle of safeguarding activity: policies are established, legal frameworks give them force, abuse types are classified, incidents are reported and investigated, and the people involved—students and staff members—are tracked through every stage. Referrals connect incidents to the personnel who manage them, while protocols define the procedures that staff must follow. This chapter walks through each record type, explains how they relate, and interprets the joined views that answer the operational questions practitioners actually face.

**Table `safeguarding_policies`**

| safeguarding_policy_id | policy_identifier | effective_date | issuing_authority | jurisdiction | compliance_standard | review_cycle | status | supersedes_safeguarding_policy_id | student_id | staff_member_staff_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | POL-2480 | 2023-02-14 | extended-issuing-33 | regional-jurisdic-30 | primary-complian-88 | legacy-review-37 | draft | 1 | 1 | 937735 |
| 2 | POL-2486 | 2024-07-25 | integrated-issuing-34 | legacy-jurisdic-31 | adaptive-complian-89 | compact-review-38 | active | 2 | 2 | 3158139 |
| 3 | POL-2492 | 2025-12-09 | seasonal-issuing-35 | compact-jurisdic-32 | distributed-complian-90 | composite-review-39 | superseded | 3 | 3 | 8189502 |
| 4 | POL-2498 | 2022-05-20 | regional-issuing-36 | composite-jurisdic-33 | baseline-complian-91 | primary-review-40 | archived | 4 | 4 | 69438 |

Safeguarding policies form the foundational layer of institutional governance. Each policy carries a unique identifier such as POL-2480 or POL-2498, an effective date, and an issuing authority drawn from a set of standardized categories like regional-issuing-36 or seasonal-issuing-35. The jurisdiction field situates the policy within a geographic or administrative scope—composite-jurisdic-33, for instance—while the compliance_standard column encodes the benchmark against which adherence is measured, ranging from baseline-complian-91 to adaptive-complian-89. Review cycles follow a similar taxonomy: primary-review-40, compact-review-38, and composite-review-39 appear across the four records. The status column tracks the policy's lifecycle stage, with values of draft, active, superseded, and archived. Notably, the supersedes_safeguarding_policy_id column creates a self-referential chain: policy POL-2486 (id 2) supersedes POL-2480 (id 1), and POL-2492 (id 3) supersedes POL-2486, forming a clear lineage of policy evolution. The student_id and staff_member_staff_id columns anchor each policy to the individuals it governs, with student 937735 and staff member 937735 both appearing under the earliest policy.

**Table `legal_frameworks`**

| id | framework_identifier | jurisdiction | enactment_date | issuing_body | framework_type | status | safeguarding_policy_id |
|---|---|---|---|---|---|---|---|
| 1 | FRA-2787 | regional-jurisdic-30 | 2022-01-04 | baseline-issuing-13 | treaty | active | 1 |
| 2 | FRA-2788 | legacy-jurisdic-31 | 2023-06-15 | pilot-issuing-14 | federal_law | amended | 2 |
| 3 | FRA-2789 | compact-jurisdic-32 | 2024-11-26 | extended-issuing-15 | regional_policy | repealed | 3 |
| 4 | FRA-2790 | composite-jurisdic-33 | 2025-04-10 | integrated-issuing-16 | international_convention | active | 4 |

Legal frameworks provide the statutory backbone that gives safeguarding policies their enforceability. Each framework is identified by a code such as FRA-2787 or FRA-2790 and is tied to a jurisdiction that mirrors the policy landscape—regional-jurisdic-30, legacy-jurisdic-31, compact-jurisdic-32, and composite-jurisdic-33. The enactment_date records when the framework came into force, with dates spanning from 2022-01-04 to 2025-04-10. The issuing_body field identifies the authority responsible, using labels like baseline-issuing-13 and integrated-issuing-16. Frameworks are categorized by type: treaty, federal_law, regional_policy, and international_convention. Their status—active, amended, or repealed—reflects their current legal standing. The safeguarding_policy_id column creates a direct link to the policies they support, so framework FRA-2787 underpins policy POL-2480, while FRA-2790 supports POL-2498.

**Table `abuse_types`**

| abuse_code | definition | severity_level | requires_mandatory_reporting | classification | incident_id |
|---|---|---|---|---|---|
| c747f9a8-8fcc-11eb-924d-9cd76263cbd0 | primary-definiti-22 | 29 | true | physical | 1 |
| 4447035 | adaptive-definiti-23 | 40 | false | emotional | 2 |
| 8189490 | distributed-definiti-24 | 51 | true | sexual | 3 |
| 4bbb5d4c-9bad-11eb-a8a2-19ed5c03f8d3 | baseline-definiti-25 | 62 | false | neglect | 4 |

Abuse types classify the nature of harm that incidents involve. Each entry carries a UUID or numeric code, a definition field (primary-definiti-22, adaptive-definiti-23, distributed-definiti-24, baseline-definiti-25), and a severity_level that ranges from 29 to 62 across the four records. The requires_mandatory_reporting flag indicates whether the type triggers automatic reporting obligations—true for physical and sexual abuse, false for emotional and neglect. The classification column groups abuse into four categories: physical, emotional, sexual, and neglect. Each abuse type is linked to an incident via the incident_id column, establishing a one-to-one mapping in this dataset where each incident is associated with exactly one abuse classification.

**Table `incidents`**

| id | incident_id | reported_date | incident_date | location | severity_rating | status | risk_level | staff_member_staff_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 1336174 | 2025-04-27T03:09:00 | 2022-09-26T20:48:00 | extended-location-99 | 39 | reported | low | 937735 |
| 2 | state_uk_4 | 2022-09-11T10:26:00 | 2023-02-10T03:05:00 | integrated-location-100 | 43 | under_investigation | medium | 3158139 |
| 3 | 2933483 | 2023-02-22T17:43:00 | 2024-07-21T10:22:00 | seasonal-location-101 | 47 | substantiated | high | 8189502 |
| 4 | 2986243 | 2024-07-06T00:00:00 | 2025-12-05T17:39:00 | regional-location-102 | 51 | unsubstantiated | critical | 69438 |

Incidents are the central event records around which all other data orbits. Each incident has a unique identifier—1336174, state_uk_4, 2933483, 2986243—and carries timestamps for both the reported_date and the incident_date. The location field uses standardized labels such as extended-location-99 and integrated-location-100. Severity ratings range from 39 to 51, while the status column tracks investigative progress through reported, under_investigation, substantiated, and unsubstantiated. Risk levels escalate from low to medium, high, and critical, with incident 2986243 reaching the critical threshold. The staff_member_staff_id column identifies the staff member associated with the incident, creating a direct link to personnel records.

**Table `students`**

| id | student_id | first_name | last_name | date_of_birth | enrollment_status | guardian_contact_id | risk_profile | incident_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 392507 | Stephanie Collins | Paul Allen | 2025-04-02 | active | Karen Keller | standard | 1 |
| 2 | 25388256 | Janice Johnston | Heather Beasley | 2022-09-13 | suspended | Stephanie Lawrence | at_risk | 2 |
| 3 | id_16 | Upal Saha | Audrey Taylor | 2023-02-24 | withdrawn | Walter Pratt | high_needs | 3 |
| 4 | gd_taxc_2211 | Katherine Snyder | Susan Wagner | 2024-07-08 | expelled | Julian Brown | standard | 4 |

Students are the individuals at the center of safeguarding concern. The dataset includes four students: Stephanie Collins (student_id 392507), Janice Johnston (25388256), Upal Saha (id_16), and Katherine Snyder (gd_taxc_2211). Each record contains first and last names, a date of birth, and an enrollment_status that ranges from active to suspended, withdrawn, and expelled. The guardian_contact_id field names the responsible adult—Karen Keller, Stephanie Lawrence, Walter Pratt, Julian Brown—while the risk_profile column categorizes each student as standard, at_risk, or high_needs. The incident_id column links each student to the incident they are associated with.

**Table `staff_members`**

| staff_id | first_name | last_name | employment_status | role | last_training_date | background_check_status | staff_member_staff_id | incident_id |
|---|---|---|---|---|---|---|---|---|
| 937735 | Stephanie Collins | Paul Allen | active | teacher | 2022-01-16 | passed | 937735 | 1 |
| 3158139 | Janice Johnston | Heather Beasley | on_leave | administrator | 2023-06-27 | pending | 3158139 | 2 |
| 8189502 | Upal Saha | Audrey Taylor | terminated | counselor | 2024-11-11 | failed | 8189502 | 3 |
| 69438 | Katherine Snyder | Susan Wagner | suspended | support_staff | 2025-04-22 | expired | 69438 | 4 |

Staff members are the personnel responsible for implementing safeguarding measures and responding to incidents. The four records mirror the student names, reflecting the fictional nature of the dataset: Stephanie Collins (staff_id 937735), Janice Johnston (3158139), Upal Saha (8189502), and Katherine Snyder (69438). Employment statuses include active, on_leave, terminated, and suspended. Roles span teacher, administrator, counselor, and support_staff. Training recency is captured in last_training_date, and background_check_status ranges from passed to pending, failed, and expired. The staff_member_staff_id column serves as the primary key for cross-referencing, and the incident_id column links each staff member to their associated incident.

**Table `safeguarding_protocols`**

| protocol_id | protocol_name | trigger_condition | required_action | deadline_hours | status | incident_id | referral_id |
|---|---|---|---|---|---|---|---|
| 9085260 | Baseline Initiative D | legacy-trigger-49 | primary-required-94 | 33 | initiated | 1 | 1 |
| 6926357 | Distributed Model | compact-trigger-50 | adaptive-required-95 | 43 | in_progress | 2 | 2 |
| 4277008 | Adaptive Cluster | composite-trigger-51 | distributed-required-96 | 53 | completed | 3 | 3 |
| 726040 | Primary Review A | primary-trigger-52 | baseline-required-97 | 63 | escalated | 4 | 4 |

Safeguarding protocols define the procedural steps that staff must follow when responding to incidents. While the specific column details are injected via the payload block, these protocols establish the operational backbone of incident response, specifying timelines, escalation paths, and documentation requirements that staff members are expected to follow.

**Table `referrals`**

| referral_id | submitted_date | recipient_agency | agency_contact | referral_type | status | incident_id | staff_member_staff_id |
|---|---|---|---|---|---|---|---|
| 1 | 2022-09-06T08:12:00 | Litton Industries | Ocean Network Express Pte Ltd | police | submitted | 1 | 937735 |
| 2 | 2023-02-17T15:29:00 | LINK Interchange Network Ltd | National Beverage Corp. | social_services | acknowledged | 2 | 3158139 |
| 3 | 2024-07-01T22:46:00 | Tata Steel | Pan-United Corporation Ltd | health_authority | under_review | 3 | 8189502 |
| 4 | 2025-12-12T05:03:00 | TDS TODOS DATA SYSTEM AB | Align Technology | education_authority | closed | 4 | 69438 |

Referrals connect incidents to the staff members who manage them through the referral process. These records capture the handoff between incident detection and formal safeguarding action, documenting which staff member initiated or received the referral and the circumstances that triggered it.

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

The policies_frameworks table creates the many-to-many relationship between safeguarding policies and legal frameworks. A single policy may be supported by multiple legal frameworks, and a single framework may underpin multiple policies. This junction table ensures that the institutional governance structure is accurately represented without forcing artificial one-to-one constraints.

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

The frameworks_types table links legal frameworks to abuse type classifications, establishing which statutory instruments govern which categories of harm. This relationship ensures that the legal basis for responding to each abuse type is traceable and auditable.

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

The types_protocols table maps abuse types to safeguarding protocols, defining which procedural responses are required for each category of harm. This ensures that the protocol selection is driven by the nature of the abuse rather than arbitrary staff discretion.

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

The incidents_students table creates the relationship between incidents and students, allowing for the possibility that a single incident involves multiple students or that a student is involved in multiple incidents. This junction table captures the actual associations without presuming a fixed cardinality.

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

The incidents_types table links incidents to abuse types, providing the classification layer that determines the severity, reporting requirements, and protocol response for each incident. This is the operational bridge between the raw event and the structured response framework.

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

The members_protocols table connects staff members to the safeguarding protocols they are trained to execute. This ensures accountability by recording which personnel are authorized and prepared to follow each protocol, supporting both compliance auditing and operational readiness assessments.

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

The protocols_members table provides the inverse mapping from protocols to staff members, enabling queries that answer which personnel are responsible for executing a given protocol. This bidirectional relationship supports both top-down protocol management and bottom-up staff capability tracking.

With the base tables established, the views synthesize these records into the operational narratives that practitioners need. Each view answers a specific question by joining the relevant tables.

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

This view returns the complete safeguarding policy record with all its attributes intact. It answers the question: what does the full policy record look like? Reading the first row reveals policy POL-2480, issued on 2023-02-14 by extended-issuing-33, operating under regional-jurisdic-30 with compliance standard primary-complian-88, currently in draft status, and linked to student 937735 and staff member 937735.

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

This view joins safeguarding policies with their supporting legal frameworks, answering which frameworks give each policy its enforceability. The first row shows policy POL-2480 supported by framework FRA-2787, a treaty enacted on 2022-01-04 by baseline-issuing-13 under regional-jurisdic-30, currently active. This join is essential for compliance audits that must trace policy authority back to its statutory source.

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

This view links policies to the students they govern, answering which students are covered by each policy. The first row connects policy POL-2480 to student 937735, establishing the scope of protection and the individuals to whom the policy's requirements apply.

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

This view connects policies to the staff members responsible for implementing them, answering which personnel must adhere to each policy. The first row shows policy POL-2480 applied to staff member 937735, creating a clear accountability chain from institutional governance to individual responsibility.

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

This view presents the inverse of the policy-to-framework relationship, answering which policies each legal framework supports. The first row shows framework FRA-2787 (a treaty, active status) supporting policy POL-2480. This perspective is useful for legal teams assessing the breadth of coverage for each statutory instrument.

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

This view joins legal frameworks with abuse types through the frameworks_types junction, answering which categories of harm each framework addresses. The first row connects framework FRA-2787 to the abuse type with code c747f9a8-8fcc-11eb-924d-9cd76263cbd0, a physical abuse classification with severity level 29 that requires mandatory reporting. This join is critical for determining the statutory basis for reporting obligations.

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

This view links abuse types to the incidents they classify, answering which incidents fall under each abuse category. The first row connects the physical abuse type (c747f9a8-8fcc-11eb-924d-9cd76263cbd0) to incident 1336174, which was reported on 2025-04-27 and is currently in reported status with low risk level. This relationship drives protocol selection and reporting workflows.

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

This view joins abuse types with safeguarding protocols through the types_protocols junction, answering which procedures must be followed for each category of harm. The first row connects the physical abuse type to its corresponding safeguarding protocol, ensuring that the response is calibrated to the nature of the harm.

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

This view joins incidents with the students involved, answering which students are affected by each incident. The first row links incident 1336174 to student 392507 (Stephanie Collins, Paul Allen), who is currently active with a standard risk profile. This join is essential for student protection planning and guardian notification.

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

This view connects incidents to the staff members associated with them, answering which personnel are involved in or responsible for each incident. The first row shows incident 1336174 linked to staff member 937735 (Stephanie Collins, Paul Allen), an active teacher whose background check has passed. This relationship supports both accountability and training needs assessment.

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

This view joins incidents with their abuse type classifications, answering what category of harm each incident involves. The first row connects incident 1336174 to the physical abuse type (c747f9a8-8fcc-11eb-924d-9cd76263cbd0), which has severity level 29 and requires mandatory reporting. This join determines the reporting obligations and protocol response for each incident.

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

This view presents the inverse of the incident-to-student relationship, answering which incidents each student is involved in. The first row shows student 392507 (Stephanie Collins) associated with incident 1336174. This perspective is useful for student risk assessment and historical tracking.

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

This view returns the complete staff member record with all attributes, answering what the full personnel profile looks like. The first row shows staff member 937735 (Stephanie Collins, Paul Allen), an active teacher with last training on 2022-01-16 and a passed background check, associated with incident 1.

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

This view connects staff members to their associated incidents, answering which incidents each staff member is involved in. The first row shows staff member 937735 (Stephanie Collins) linked to incident 1336174. This relationship supports workload balancing and incident response capacity planning.

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

This view joins staff members with the protocols they are trained to execute through the members_protocols junction, answering which procedures each staff member is prepared to carry out. The first row connects staff member 937735 to their assigned safeguarding protocol, ensuring that operational readiness can be verified against incident requirements.

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

This view links safeguarding protocols to the incidents they govern through the types_protocols and incidents_types chain, answering which incidents require each protocol. The first row connects a safeguarding protocol to incident 1336174, establishing the procedural framework that must be followed during the incident's investigation.

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

This view joins safeguarding protocols with the staff members responsible for executing them through the protocols_members junction, answering which personnel are accountable for each protocol. The first row connects a safeguarding protocol to staff member 937735 (Stephanie Collins), creating a clear line of operational responsibility.

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

This view connects safeguarding protocols to referrals, answering which referrals are governed by each protocol. The first row links a safeguarding protocol to a referral record, establishing the procedural context within which the referral was made and processed.

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

This view joins referrals with their associated incidents, answering which incident triggered each referral. The first row connects a referral to incident 1336174, documenting the formal handoff from incident detection to safeguarding action.

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

This view links referrals to the staff members who initiated or received them, answering which personnel managed each referral. The first row connects a referral to staff member 937735 (Stephanie Collins), documenting the human element of the safeguarding workflow.

The safeguarding ecosystem described here is a tightly interlocked system of governance, classification, and response. Policies establish the rules, legal frameworks give them force, abuse types categorize the harm, incidents record the events, and students and staff members populate the human dimension. Protocols define the procedures, referrals document the handoffs, and junction tables ensure that the relationships between these entities are captured with precision. The views synthesize these records into the operational narratives that practitioners need to answer the questions that matter: which policies apply, which frameworks support them, which students are affected, which staff members are responsible, and which protocols must be followed. Every record, from the earliest policy identifier POL-2480 to the most recent referral, contributes to a coherent picture of institutional safeguarding that can be audited, analyzed, and improved.