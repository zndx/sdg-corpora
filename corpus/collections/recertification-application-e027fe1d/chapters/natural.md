## Certification Lifecycle Management

Professional certification bodies operate within a structured recertification ecosystem where practitioners must continuously demonstrate competence through documented activities, completed education, and active participation in their field. The recertification process tracks each certified individual's journey from initial credentialing through ongoing professional development, culminating in a formal application that consolidates all earned recertification units. This chapter examines the data architecture that supports this lifecycle, describing how applications, professionals, activities, documents, courses, and society roles interrelate to produce a verifiable record of continuing competence.

**Table `recertification_applications`**

| id | application_id | submission_date | fee_amount | status | verification_status | ethics_pledge_signed | ru_total_earned | ru_required | certified_professional_id |
|---|---|---|---|---|---|---|---|---|---|
| 100 | 505997 | 2025-04-24T03:57:00 | 38.08 | pending | not_selected | true | 9 | 42 | 100 |
| 101 | 1250196 | 2022-09-08T10:14:00 | 18.47 | under_review | selected_for_verification | false | 24 | 48 | 101 |
| 102 | 124 | 2023-02-19T17:31:00 | 38.08 | approved | verified | true | 300 | 54 | 102 |
| 103 | IVC20det40 | 2024-07-03T00:48:00 | 26.25 | rejected | failed_verification | false | 1 | 60 | 103 |

The recertification applications table serves as the central transactional record for each recertification cycle. Each row represents a formal submission by a certified professional seeking to maintain or restore their credential. The `application_id` provides a human-readable identifier—such as `505997` or `IVC20det40`—while the `id` column serves as the internal primary key. The `submission_date` anchors the application in time, and `fee_amount` reflects the processing cost, ranging from `18.47` to `38.08` in the current dataset. The `status` column tracks the application's progression through the pipeline: `pending`, `under_review`, `approved`, or `rejected`. Correspondingly, `verification_status` indicates whether the application was `selected_for_verification`, `verified`, `failed_verification`, or `not_selected`. The boolean `ethics_pledge_signed` confirms whether the applicant attested to the code of ethics, and the `ru_total_earned` versus `ru_required` columns enable a quick compliance check—for instance, application `102` shows `300` units earned against a requirement of `54`, while application `103` shows only `1` unit earned against a requirement of `60`, explaining its `rejected` status. The `certified_professional_id` links each application to the submitting professional.

**Table `certified_professionals`**

| certified_professional_id | professional_id | certification_status | current_certification_period_start | current_certification_period_end | ru_requirement | code_of_ethics_pledge | employment_type | recertification_application_id | professional_society_role_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 100 | 5082965 | active | 2024-11-07 | 2025-08-18 | 38 | 884363 | full_time | 100 | 1000 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 101 | 2618560 | retired | 2025-04-18 | 2022-01-02 | 43 | 922a1b88-9bad-11eb-a8a2-19ed5c03f8d3 | part_time | 101 | 1001 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 102 | 3355767 | suspended | 2022-09-02 | 2023-06-13 | 48 | 937731 | retired | 102 | 1002 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 103 | 3355784 | expired | 2023-02-13 | 2024-11-24 | 53 | 3717633 | unemployed | 103 | 1003 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Certified professionals form the foundational entity of the certification program. Each record captures a practitioner's current standing through `certification_status`, which takes values such as `active`, `retired`, `suspended`, or `expired`. The `current_certification_period_start` and `current_certification_period_end` define the validity window of the credential; notably, professional `101` shows a period end date of `2022-01-02` that precedes the start date of `2025-04-18`, indicating a data anomaly or a retroactively reassigned period. The `ru_requirement` column specifies the number of recertification units each professional must accumulate during their current cycle—values range from `38` for professional `100` to `53` for professional `103`. The `code_of_ethics_pledge` field stores a unique identifier for the ethics attestation, ranging from short numeric codes like `884363` to UUIDs such as `922a1b88-9bad-11eb-a8a2-19ed5c03f8d3`. Employment type is recorded in `employment_type`, with values including `full_time`, `part_time`, `retired`, and `unemployed`. The `recertification_application_id` and `professional_society_role_id` columns create direct foreign-key links to the application and role tables, respectively.

**Table `recertification_unit_records`**

| recertification_unit_record_id | record_id | activity_category | sub_category | ru_credits_earned | activity_date | applies_to_body_of_knowledge | double_counting_allowed | verification_required | recertification_application_id | activity_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 10449530 | publication | pilot-sub-20 | 21 | 2024-11-08 | true | true | false | 100 | 8843761 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | 10445619 | professional_society_participation | extended-sub-21 | 25 | 2025-04-19 | false | false | true | 101 | 4180957 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | 9568457 | education | integrated-sub-22 | 29 | 2022-09-03 | true | true | false | 102 | 168545 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | 20743593 | conference | seasonal-sub-23 | 33 | 2023-02-14 | false | false | true | 103 | default_chart_a_account_53 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Recertification unit records quantify the professional development activities that contribute toward a practitioner's continuing education requirements. Each row represents a discrete activity credit, identified by `recertification_unit_record_id` and linked to an external `record_id` such as `10449530` or `20743593`. The `activity_category` classifies the type of contribution—`publication`, `professional_society_participation`, `education`, and `conference` appear in the current data—while `sub_category` provides finer granularity with values like `pilot-sub-20` and `seasonal-sub-23`. The `ru_credits_earned` column assigns a numeric credit value, ranging from `21` to `33` in the sample rows. The `activity_date` records when the activity occurred, and `applies_to_body_of_knowledge` indicates whether the activity aligns with the certification's defined knowledge domains. The `double_counting_allowed` and `verification_required` flags control whether the same activity can be claimed in multiple cycles and whether manual review is needed. Each record is tied to a `recertification_application_id` and an `activity_id`, bridging the unit record to both the application and the underlying professional activity.

**Table `professional_activities`**

| activity_id | activity_type | start_date | end_date | authorship_role | accreditation_status | is_part_of_regular_duties | credits_awarded | certified_professional_id | document_id | course_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 8843761 | publication | 2022-09-05 | 2022-09-01 | 1st_author | peer_reviewed | true | 4 | 100 | IVC10I | 100 |
| 4180957 | conference_attendance | 2023-02-16 | 2023-02-12 | 2nd_or_3rd_author | accredited_agency | false | 7 | 101 | 605943 | 101 |
| 168545 | conference_presenting | 2024-07-27 | 2024-07-23 | >3rd_author | non_accredited | true | 10 | 102 | 10449525 | 102 |
| default_chart_a_account_53 | teaching | 2025-12-11 | 2025-12-07 | primary_presenter | peer_reviewed | false | 13 | 103 | 5f93a090-8fcd-11eb-924d-9cd76263cbd0 | 103 |

Professional activities represent the actual work or engagement that generates recertification credit. The `activity_type` column distinguishes between `publication`, `conference_attendance`, `conference_presenting`, and `teaching`. Temporal boundaries are captured by `start_date` and `end_date`; in several rows, the end date precedes the start date (for example, activity `8843761` spans from `2022-09-05` to `2022-09-01`), suggesting either data entry conventions or retroactive reporting. The `authorship_role` field describes the contributor's position—`1st_author`, `2nd_or_3rd_author`, `>3rd_author`, and `primary_presenter`—and `accreditation_status` indicates whether the activity was conducted under a recognized accrediting body, with values including `peer_reviewed`, `accredited_agency`, and `non_accredited`. The boolean `is_part_of_regular_duties` distinguishes activities performed as part of the practitioner's job from voluntary professional development. The `credits_awarded` column assigns the final credit value, ranging from `4` to `13`. Each activity is linked to a `certified_professional_id`, and optionally to a `document_id` and `course_id`, connecting the activity to supporting evidence and educational records.

**Table `professional_documents`**

| document_id | title | publication_date | publisher | document_type | applies_to_body_of_knowledge | claimed_once_per_period | total_authors | certified_professional_id | activity_id |
|---|---|---|---|---|---|---|---|---|---|
| IVC10I | Compact Initiative | 2025-12-01 | pilot-publishe-50 | peer_reviewed_journal | true | false | 13 | 100 | 8843761 |
| 605943 | Legacy Model | 2022-05-12 | extended-publishe-51 | online_transaction | false | true | 2 | 101 | 4180957 |
| 10449525 | Regional Cluster A | 2023-10-23 | integrated-publishe-52 | magazine | true | false | 12 | 102 | 168545 |
| 5f93a090-8fcd-11eb-924d-9cd76263cbd0 | Seasonal Review | 2024-03-07 | seasonal-publishe-53 | conference_proceeding | false | true | 11 | 103 | default_chart_a_account_53 |

Professional documents provide the evidentiary backbone for publication-based and conference-based activities. Each document record includes a `document_id` (such as `IVC10I` or `5f93a090-8fcd-11eb-924d-9cd76263cbd0`), a `title` like "Compact Initiative" or "Seasonal Review", a `publication_date`, and a `publisher` identifier. The `document_type` field categorizes the publication as `peer_reviewed_journal`, `online_transaction`, `magazine`, or `conference_proceeding`. The `applies_to_body_of_knowledge` flag indicates alignment with certification domains, while `claimed_once_per_period` controls whether the document can be reused across recertification cycles. The `total_authors` column records the number of contributors, ranging from `2` to `13`. Each document is associated with a `certified_professional_id` and an `activity_id`, establishing the chain from credential holder through activity to supporting documentation.

**Table `courses`**

| id | course_id | course_title | institution | course_level | completion_date | applies_to_body_of_knowledge | is_audited | is_sponsored_by_employer | certified_professional_id | attended_by_certified_professional_id | activity_id |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 100 | 6983 | Baseline Series D | baseline-institut-31 | college | 2024-03-14 | true | true | The NEA Foundation for the Improvement of Education | 100 | 100 | 8843761 |
| 101 | 8189505 | Distributed Assessment | pilot-institut-32 | non_college | 2025-08-25 | false | false | Esperion Therapeutics Inc. | 101 | 101 | 4180957 |
| 102 | 9246307 | Adaptive Survey | extended-institut-33 | college | 2022-01-09 | true | true | PubMatic Inc. | 102 | 102 | 168545 |
| 103 | 99615 | Primary Corridor A | integrated-institut-34 | non_college | 2023-06-20 | false | false | Link Title | 103 | 103 | default_chart_a_account_53 |

The courses table records formal educational activities that contribute recertification units. Each row contains a `course_id` (such as `6983` or `8189505`), a `course_title` like "Baseline Series D" or "Distributed Assessment", and an `institution` identifier. The `course_level` distinguishes between `college` and `non_college` offerings, while `completion_date` marks when the practitioner finished the course. The `applies_to_body_of_knowledge` flag indicates domain alignment, and `is_audited` records whether the participant audited the course rather than seeking credit. The `is_sponsored_by_employer` column captures whether the employer funded the education, with values such as "The NEA Foundation for the Improvement of Education" and "Esperion Therapeutics Inc." appearing in the data. The `certified_professional_id` and `attended_by_certified_professional_id` columns both reference the professional, while `activity_id` links the course to the corresponding professional activity record.

**Table `professional_society_roles`**

| id | role_instance_id | role_title | society_name | start_date | end_date | ru_credits_per_year | applies_to_body_of_knowledge | certified_professional_id | activity_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 1000 | c7443b9c-8fcc-11eb-924d-9cd76263cbd0 | officer | Composite Model | 2022-09-05 | 2022-09-01 | 19 | true | 100 | 8843761 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 1001 | ca398dba-8fcd-11eb-924d-9cd76263cbd0 | committee_leader | Compact Cluster A | 2023-02-16 | 2023-02-12 | 30 | false | 101 | 4180957 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 1002 | id_15 | committee_member | Legacy Review | 2024-07-27 | 2024-07-23 | 41 | true | 102 | 168545 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 1003 | 2b2bd0a2-8fcd-11eb-924d-9cd76263cbd0 | individual_member | Regional Initiative | 2025-12-11 | 2025-12-07 | 52 | false | 103 | default_chart_a_account_53 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Professional society roles capture a practitioner's leadership and service contributions within professional organizations. Although the current dataset does not display explicit row values for this table, the `professional_society_role_id` column in the `certified_professionals` table (with values `1000` through `1003`) establishes a direct foreign-key relationship, indicating that each certified professional is associated with a specific society role record. This linkage enables the certification body to track and verify service-based recertification units.

**Table `applications_records`**

| recertification_application_id | recertification_unit_record_id |
|---|---|
| 100 | 1 |
| 100 | 2 |
| 101 | 2 |
| 101 | 3 |
| 102 | 3 |
| 102 | 4 |
| 103 | 4 |
| 103 | 1 |

The applications records table provides an additional layer of application metadata. While the current data snapshot does not display explicit row values, this table exists as a supporting record structure that complements the primary `recertification_applications` table, likely storing historical or audit-level information about each application submission.

The following views synthesize the base tables into analytical perspectives that answer specific operational questions.

**View `v_recertification_application_certified_professional`**

```sql
CREATE VIEW v_recertification_application_certified_professional AS
SELECT a.id, a.application_id, a.submission_date, a.fee_amount, b.certified_professional_id AS professional_certified_professional_id, b.professional_id AS professional_professional_id, b.certification_status AS professional_certification_status
FROM recertification_applications a JOIN certified_professionals b ON a.certified_professional_id = b.certified_professional_id;
```

| id | application_id | submission_date | fee_amount | professional_certified_professional_id | professional_professional_id | professional_certification_status |
|---|---|---|---|---|---|---|
| 100 | 505997 | 2025-04-24T03:57:00 | 38.08 | 100 | 5082965 | active |
| 101 | 1250196 | 2022-09-08T10:14:00 | 18.47 | 101 | 2618560 | retired |
| 102 | 124 | 2023-02-19T17:31:00 | 38.08 | 102 | 3355767 | suspended |
| 103 | IVC20det40 | 2024-07-03T00:48:00 | 26.25 | 103 | 3355784 | expired |

This view joins recertification applications with their corresponding certified professionals, answering the question: "What is the current status and professional context of each recertification application?" A representative row would show application `100` (submission date `2025-04-24`, fee `38.08`, status `pending`) alongside professional `100` (status `active`, employment `full_time`, certification period ending `2025-08-18`). This join enables administrators to see at a glance whether a pending application comes from an active practitioner or one whose credential has lapsed.

**View `v_recertification_application_recertification_unit_record_detail`**

```sql
CREATE VIEW v_recertification_application_recertification_unit_record_detail AS
SELECT a.id, a.application_id, a.submission_date, b.recertification_unit_record_id AS record_recertification_unit_record_id, b.record_id AS record_record_id, b.activity_category AS record_activity_category
FROM recertification_applications a
  JOIN applications_records j ON j.recertification_application_id = a.id
  JOIN recertification_unit_records b ON b.recertification_unit_record_id = j.recertification_unit_record_id;
```

| id | application_id | submission_date | record_recertification_unit_record_id | record_record_id | record_activity_category |
|---|---|---|---|---|---|
| 100 | 505997 | 2025-04-24T03:57:00 | 1 | 10449530 | publication |
| 100 | 505997 | 2025-04-24T03:57:00 | 2 | 10445619 | professional_society_participation |
| 101 | 1250196 | 2022-09-08T10:14:00 | 2 | 10445619 | professional_society_participation |
| 101 | 1250196 | 2022-09-08T10:14:00 | 3 | 9568457 | education |
| 102 | 124 | 2023-02-19T17:31:00 | 3 | 9568457 | education |
| 102 | 124 | 2023-02-19T17:31:00 | 4 | 20743593 | conference |
| 103 | IVC20det40 | 2024-07-03T00:48:00 | 4 | 20743593 | conference |
| 103 | IVC20det40 | 2024-07-03T00:48:00 | 1 | 10449530 | publication |

This view links recertification applications to their constituent unit records, answering: "Which activities contribute to a given application's unit total?" For application `100`, the view would surface unit record `1` (category `publication`, `21` credits earned, date `2024-11-08`), allowing reviewers to verify that the `ru_total_earned` of `9` for application `100` is correctly aggregated from its underlying records.

**View `v_certified_professional_recertification_application`**

```sql
CREATE VIEW v_certified_professional_recertification_application AS
SELECT a.certified_professional_id, a.professional_id, a.certification_status, a.current_certification_period_start, b.id AS application_id, b.application_id AS application_application_id, b.submission_date AS application_submission_date
FROM certified_professionals a JOIN recertification_applications b ON a.recertification_application_id = b.id;
```

| certified_professional_id | professional_id | certification_status | current_certification_period_start | application_id | application_application_id | application_submission_date |
|---|---|---|---|---|---|---|
| 100 | 5082965 | active | 2024-11-07 | 100 | 505997 | 2025-04-24T03:57:00 |
| 101 | 2618560 | retired | 2025-04-18 | 101 | 1250196 | 2022-09-08T10:14:00 |
| 102 | 3355767 | suspended | 2022-09-02 | 102 | 124 | 2023-02-19T17:31:00 |
| 103 | 3355784 | expired | 2023-02-13 | 103 | IVC20det40 | 2024-07-03T00:48:00 |

This view presents the reverse perspective of the first view, joining certified professionals to their recertification applications. It answers: "Which applications has each professional submitted, and what is the outcome?" Professional `102` (status `suspended`, employment `retired`) would appear alongside application `102` (status `approved`, `300` units earned, `54` required), demonstrating that even a suspended professional can have an approved application if the unit requirements are met.

**View `v_certified_professional_professional_society_role`**

```sql
CREATE VIEW v_certified_professional_professional_society_role AS
SELECT a.certified_professional_id, a.professional_id, a.certification_status, a.current_certification_period_start, b.id AS role_id, b.role_instance_id AS role_role_instance_id, b.role_title AS role_role_title
FROM certified_professionals a JOIN professional_society_roles b ON a.professional_society_role_id = b.id;
```

| certified_professional_id | professional_id | certification_status | current_certification_period_start | role_id | role_role_instance_id | role_role_title |
|---|---|---|---|---|---|---|
| 100 | 5082965 | active | 2024-11-07 | 1000 | c7443b9c-8fcc-11eb-924d-9cd76263cbd0 | officer |
| 101 | 2618560 | retired | 2025-04-18 | 1001 | ca398dba-8fcd-11eb-924d-9cd76263cbd0 | committee_leader |
| 102 | 3355767 | suspended | 2022-09-02 | 1002 | id_15 | committee_member |
| 103 | 3355784 | expired | 2023-02-13 | 1003 | 2b2bd0a2-8fcd-11eb-924d-9cd76263cbd0 | individual_member |

This view connects certified professionals to their professional society roles, answering: "What society role is associated with each professional's record?" Professional `100` would appear with society role `1000`, professional `101` with role `1001`, and so on. This join supports verification of service-based recertification units and enables reporting on the professional engagement levels of the certified population.

**View `v_recertification_unit_record_recertification_application`**

```sql
CREATE VIEW v_recertification_unit_record_recertification_application AS
SELECT a.recertification_unit_record_id, a.record_id, a.activity_category, a.sub_category, b.id AS application_id, b.application_id AS application_application_id, b.submission_date AS application_submission_date
FROM recertification_unit_records a JOIN recertification_applications b ON a.recertification_application_id = b.id;
```

| recertification_unit_record_id | record_id | activity_category | sub_category | application_id | application_application_id | application_submission_date |
|---|---|---|---|---|---|---|
| 1 | 10449530 | publication | pilot-sub-20 | 100 | 505997 | 2025-04-24T03:57:00 |
| 2 | 10445619 | professional_society_participation | extended-sub-21 | 101 | 1250196 | 2022-09-08T10:14:00 |
| 3 | 9568457 | education | integrated-sub-22 | 102 | 124 | 2023-02-19T17:31:00 |
| 4 | 20743593 | conference | seasonal-sub-23 | 103 | IVC20det40 | 2024-07-03T00:48:00 |

This view joins unit records back to their parent applications, answering: "To which application does each unit record belong, and what is the application's overall status?" Unit record `3` (category `education`, `29` credits, date `2022-09-03`) would be associated with application `102` (status `approved`, `verified`), providing auditors a clear trail from individual credit to final application disposition.

**View `v_recertification_unit_record_professional_activity`**

```sql
CREATE VIEW v_recertification_unit_record_professional_activity AS
SELECT a.recertification_unit_record_id, a.record_id, a.activity_category, a.sub_category, b.activity_id AS activity_activity_id, b.activity_type AS activity_activity_type, b.start_date AS activity_start_date
FROM recertification_unit_records a JOIN professional_activities b ON a.activity_id = b.activity_id;
```

| recertification_unit_record_id | record_id | activity_category | sub_category | activity_activity_id | activity_activity_type | activity_start_date |
|---|---|---|---|---|---|---|
| 1 | 10449530 | publication | pilot-sub-20 | 8843761 | publication | 2022-09-05 |
| 2 | 10445619 | professional_society_participation | extended-sub-21 | 4180957 | conference_attendance | 2023-02-16 |
| 3 | 9568457 | education | integrated-sub-22 | 168545 | conference_presenting | 2024-07-27 |
| 4 | 20743593 | conference | seasonal-sub-23 | default_chart_a_account_53 | teaching | 2025-12-11 |

This view links unit records to their underlying professional activities, answering: "What specific activity generated each unit record, and what are its characteristics?" Unit record `1` (category `publication`, `21` credits) would join to activity `8843761` (type `publication`, `1st_author`, `peer_reviewed`, `4` credits awarded), enabling cross-validation between the unit record's credit assignment and the activity's own credit calculation.

**View `v_professional_activity_certified_professional`**

```sql
CREATE VIEW v_professional_activity_certified_professional AS
SELECT a.activity_id, a.activity_type, a.start_date, a.end_date, b.certified_professional_id AS professional_certified_professional_id, b.professional_id AS professional_professional_id, b.certification_status AS professional_certification_status
FROM professional_activities a JOIN certified_professionals b ON a.certified_professional_id = b.certified_professional_id;
```

| activity_id | activity_type | start_date | end_date | professional_certified_professional_id | professional_professional_id | professional_certification_status |
|---|---|---|---|---|---|---|
| 8843761 | publication | 2022-09-05 | 2022-09-01 | 100 | 5082965 | active |
| 4180957 | conference_attendance | 2023-02-16 | 2023-02-12 | 101 | 2618560 | retired |
| 168545 | conference_presenting | 2024-07-27 | 2024-07-23 | 102 | 3355767 | suspended |
| default_chart_a_account_53 | teaching | 2025-12-11 | 2025-12-07 | 103 | 3355784 | expired |

This view joins professional activities to their associated certified professionals, answering: "Which professional is responsible for each activity, and what is their current certification standing?" Activity `8843761` (type `publication`, `4` credits) would appear alongside professional `100` (status `active`, `full_time` employment), allowing the certification body to confirm that activities are being claimed by practitioners in good standing.

**View `v_professional_activity_professional_document`**

```sql
CREATE VIEW v_professional_activity_professional_document AS
SELECT a.activity_id, a.activity_type, a.start_date, a.end_date, b.document_id AS document_document_id, b.title AS document_title, b.publication_date AS document_publication_date
FROM professional_activities a JOIN professional_documents b ON a.document_id = b.document_id;
```

| activity_id | activity_type | start_date | end_date | document_document_id | document_title | document_publication_date |
|---|---|---|---|---|---|---|
| 8843761 | publication | 2022-09-05 | 2022-09-01 | IVC10I | Compact Initiative | 2025-12-01 |
| 4180957 | conference_attendance | 2023-02-16 | 2023-02-12 | 605943 | Legacy Model | 2022-05-12 |
| 168545 | conference_presenting | 2024-07-27 | 2024-07-23 | 10449525 | Regional Cluster A | 2023-10-23 |
| default_chart_a_account_53 | teaching | 2025-12-11 | 2025-12-07 | 5f93a090-8fcd-11eb-924d-9cd76263cbd0 | Seasonal Review | 2024-03-07 |

This view connects professional activities to their supporting documents, answering: "What document substantiates each activity?" Activity `8843761` (type `publication`) would join to document `IVC10I` (title "Compact Initiative", type `peer_reviewed_journal`, `13` total authors), providing the evidentiary link required for peer-review-based credit claims.

**View `v_professional_activity_course`**

```sql
CREATE VIEW v_professional_activity_course AS
SELECT a.activity_id, a.activity_type, a.start_date, a.end_date, b.id AS course_id, b.course_id AS course_course_id, b.course_title AS course_course_title
FROM professional_activities a JOIN courses b ON a.course_id = b.id;
```

| activity_id | activity_type | start_date | end_date | course_id | course_course_id | course_course_title |
|---|---|---|---|---|---|---|
| 8843761 | publication | 2022-09-05 | 2022-09-01 | 100 | 6983 | Baseline Series D |
| 4180957 | conference_attendance | 2023-02-16 | 2023-02-12 | 101 | 8189505 | Distributed Assessment |
| 168545 | conference_presenting | 2024-07-27 | 2024-07-23 | 102 | 9246307 | Adaptive Survey |
| default_chart_a_account_53 | teaching | 2025-12-11 | 2025-12-07 | 103 | 99615 | Primary Corridor A |

This view links professional activities to their associated courses, answering: "Which course corresponds to each activity, and what are the course details?" Activity `8843761` would join to course `100` (title "Baseline Series D", institution `baseline-institut-31`, level `college`, completion date `2024-03-14`), enabling verification that the educational component of an activity meets the required standards.

**View `v_professional_document_certified_professional`**

```sql
CREATE VIEW v_professional_document_certified_professional AS
SELECT a.document_id, a.title, a.publication_date, a.publisher, b.certified_professional_id AS professional_certified_professional_id, b.professional_id AS professional_professional_id, b.certification_status AS professional_certification_status
FROM professional_documents a JOIN certified_professionals b ON a.certified_professional_id = b.certified_professional_id;
```

| document_id | title | publication_date | publisher | professional_certified_professional_id | professional_professional_id | professional_certification_status |
|---|---|---|---|---|---|---|
| IVC10I | Compact Initiative | 2025-12-01 | pilot-publishe-50 | 100 | 5082965 | active |
| 605943 | Legacy Model | 2022-05-12 | extended-publishe-51 | 101 | 2618560 | retired |
| 10449525 | Regional Cluster A | 2023-10-23 | integrated-publishe-52 | 102 | 3355767 | suspended |
| 5f93a090-8fcd-11eb-924d-9cd76263cbd0 | Seasonal Review | 2024-03-07 | seasonal-publishe-53 | 103 | 3355784 | expired |

This view joins professional documents to their associated certified professionals, answering: "Which professional authored or contributed to each document?" Document `IVC10I` ("Compact Initiative", `peer_reviewed_journal`) would appear alongside professional `100` (status `active`), supporting the verification that document-based recertification units are claimed by the correct practitioners.

**View `v_professional_document_professional_activity`**

```sql
CREATE VIEW v_professional_document_professional_activity AS
SELECT a.document_id, a.title, a.publication_date, a.publisher, b.activity_id AS activity_activity_id, b.activity_type AS activity_activity_type, b.start_date AS activity_start_date
FROM professional_documents a JOIN professional_activities b ON a.activity_id = b.activity_id;
```

| document_id | title | publication_date | publisher | activity_activity_id | activity_activity_type | activity_start_date |
|---|---|---|---|---|---|---|
| IVC10I | Compact Initiative | 2025-12-01 | pilot-publishe-50 | 8843761 | publication | 2022-09-05 |
| 605943 | Legacy Model | 2022-05-12 | extended-publishe-51 | 4180957 | conference_attendance | 2023-02-16 |
| 10449525 | Regional Cluster A | 2023-10-23 | integrated-publishe-52 | 168545 | conference_presenting | 2024-07-27 |
| 5f93a090-8fcd-11eb-924d-9cd76263cbd0 | Seasonal Review | 2024-03-07 | seasonal-publishe-53 | default_chart_a_account_53 | teaching | 2025-12-11 |

This view connects professional documents to their corresponding activities, answering: "Which activity does each document support?" Document `605943` ("Legacy Model", `online_transaction`) would join to activity `4180957` (type `conference_attendance`, `2nd_or_3rd_author`), establishing the evidentiary chain from document through activity to the recertification credit.

**View `v_course_certified_professional`**

```sql
CREATE VIEW v_course_certified_professional AS
SELECT a.id, a.course_id, a.course_title, a.institution, b.certified_professional_id AS professional_certified_professional_id, b.professional_id AS professional_professional_id, b.certification_status AS professional_certification_status
FROM courses a JOIN certified_professionals b ON a.certified_professional_id = b.certified_professional_id;
```

| id | course_id | course_title | institution | professional_certified_professional_id | professional_professional_id | professional_certification_status |
|---|---|---|---|---|---|---|
| 100 | 6983 | Baseline Series D | baseline-institut-31 | 100 | 5082965 | active |
| 101 | 8189505 | Distributed Assessment | pilot-institut-32 | 101 | 2618560 | retired |
| 102 | 9246307 | Adaptive Survey | extended-institut-33 | 102 | 3355767 | suspended |
| 103 | 99615 | Primary Corridor A | integrated-institut-34 | 103 | 3355784 | expired |

This view joins courses to their associated certified professionals, answering: "Which professional completed each course?" Course `100` ("Baseline Series D", `college` level, completed `2024-03-14`) would appear alongside professional `100` (status `active`, `full_time`), enabling the certification body to verify that course-based credits are attributed to the correct practitioners.

**View `v_course_professional_activity`**

```sql
CREATE VIEW v_course_professional_activity AS
SELECT a.id, a.course_id, a.course_title, a.institution, b.activity_id AS activity_activity_id, b.activity_type AS activity_activity_type, b.start_date AS activity_start_date
FROM courses a JOIN professional_activities b ON a.activity_id = b.activity_id;
```

| id | course_id | course_title | institution | activity_activity_id | activity_activity_type | activity_start_date |
|---|---|---|---|---|---|---|
| 100 | 6983 | Baseline Series D | baseline-institut-31 | 8843761 | publication | 2022-09-05 |
| 101 | 8189505 | Distributed Assessment | pilot-institut-32 | 4180957 | conference_attendance | 2023-02-16 |
| 102 | 9246307 | Adaptive Survey | extended-institut-33 | 168545 | conference_presenting | 2024-07-27 |
| 103 | 99615 | Primary Corridor A | integrated-institut-34 | default_chart_a_account_53 | teaching | 2025-12-11 |

This view links courses to their corresponding professional activities, answering: "Which activity is associated with each course record?" Course `101` ("Distributed Assessment", `non_college` level) would join to activity `4180957` (type `conference_attendance`, `7` credits awarded), providing a cross-check between the educational record and the activity's credit assignment.

**View `v_professional_society_role_certified_professional`**

```sql
CREATE VIEW v_professional_society_role_certified_professional AS
SELECT a.id, a.role_instance_id, a.role_title, a.society_name, b.certified_professional_id AS professional_certified_professional_id, b.professional_id AS professional_professional_id, b.certification_status AS professional_certification_status
FROM professional_society_roles a JOIN certified_professionals b ON a.certified_professional_id = b.certified_professional_id;
```

| id | role_instance_id | role_title | society_name | professional_certified_professional_id | professional_professional_id | professional_certification_status |
|---|---|---|---|---|---|---|
| 1000 | c7443b9c-8fcc-11eb-924d-9cd76263cbd0 | officer | Composite Model | 100 | 5082965 | active |
| 1001 | ca398dba-8fcd-11eb-924d-9cd76263cbd0 | committee_leader | Compact Cluster A | 101 | 2618560 | retired |
| 1002 | id_15 | committee_member | Legacy Review | 102 | 3355767 | suspended |
| 1003 | 2b2bd0a2-8fcd-11eb-924d-9cd76263cbd0 | individual_member | Regional Initiative | 103 | 3355784 | expired |

This view joins professional society roles to their associated certified professionals, answering: "Which professional holds each society role?" Role `1000` would appear alongside professional `100` (status `active`, `full_time` employment), supporting the verification of service-based recertification units and enabling reporting on the professional engagement of the certified population.

**View `v_professional_society_role_professional_activity`**

```sql
CREATE VIEW v_professional_society_role_professional_activity AS
SELECT a.id, a.role_instance_id, a.role_title, a.society_name, b.activity_id AS activity_activity_id, b.activity_type AS activity_activity_type, b.start_date AS activity_start_date
FROM professional_society_roles a JOIN professional_activities b ON a.activity_id = b.activity_id;
```

| id | role_instance_id | role_title | society_name | activity_activity_id | activity_activity_type | activity_start_date |
|---|---|---|---|---|---|---|
| 1000 | c7443b9c-8fcc-11eb-924d-9cd76263cbd0 | officer | Composite Model | 8843761 | publication | 2022-09-05 |
| 1001 | ca398dba-8fcd-11eb-924d-9cd76263cbd0 | committee_leader | Compact Cluster A | 4180957 | conference_attendance | 2023-02-16 |
| 1002 | id_15 | committee_member | Legacy Review | 168545 | conference_presenting | 2024-07-27 |
| 1003 | 2b2bd0a2-8fcd-11eb-924d-9cd76263cbd0 | individual_member | Regional Initiative | default_chart_a_account_53 | teaching | 2025-12-11 |

This view connects professional society roles to their associated professional activities, answering: "Which activities are linked to each society role?" Role `1000` would join to activity `8843761` (type `publication`, `1st_author`), enabling the certification body to trace service contributions through society roles to specific professional activities and their associated recertification credits.

## Synthesis

The recertification data model forms an interconnected network of records that collectively document a practitioner's continuing competence. Certified professionals submit applications that aggregate unit records, which in turn derive from professional activities supported by documents and courses. Society roles provide an additional dimension of service-based credit. The views presented here synthesize these base tables into operational perspectives that answer the key questions certification administrators face: verifying application status against professional standing, tracing unit credits to their source activities, validating document-based claims, and confirming course completions. Together, these records and their relationships form the evidentiary foundation upon which certification decisions are made.