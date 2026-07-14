## Normalized Modelling of a Professional Recertification Domain

The recertification management domain captures the lifecycle of a certified professional's continuing-education obligations. A professional holds a certification that expires on a known date; between expiry events they accumulate recertification units (RUs) through activities such as publications, conference attendance, teaching, and course completion. Each certification cycle culminates in a recertification application that tallies earned units against a required threshold, pays a fee, and passes through a verification pipeline. The relational schema below decomposes this lifecycle into eight base tables whose primary keys, foreign keys, and attribute types encode the domain's cardinality constraints. Every view then reassembles a slice of that normalized structure into a flat fact that a downstream consumer can read without writing joins.

### Base Tables and Their Attribute Topology

The anchor of the model is `certified_professionals`, which stores one row per active, retired, suspended, or expired certification holder. The surrogate key `certified_professional_id` (values 100 through 103 in the sample) identifies the person; `professional_id` (e.g. `5082965`, `2618560`) is the business identifier. The column `certification_status` enumerates the four lifecycle states, while `current_certification_period_start` and `current_certification_period_end` bound the active window — for instance, professional 100's period runs from `2024-11-07` to `2025-08-18`. The RU requirement for that period lives in `ru_requirement` (38 for professional 100), and `code_of_ethics_pledge` stores a hash or reference such as `884363`. Employment classification is captured in `employment_type` (`full_time`, `part_time`, `retired`, `unemployed`), and the audit timestamps `created_at` / `updated_at` record when the row was materialized.

**Table `certified_professionals`**

| certified_professional_id | professional_id | certification_status | current_certification_period_start | current_certification_period_end | ru_requirement | code_of_ethics_pledge | employment_type | recertification_application_id | professional_society_role_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 100 | 5082965 | active | 2024-11-07 | 2025-08-18 | 38 | 884363 | full_time | 100 | 1000 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 101 | 2618560 | retired | 2025-04-18 | 2022-01-02 | 43 | 922a1b88-9bad-11eb-a8a2-19ed5c03f8d3 | part_time | 101 | 1001 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 102 | 3355767 | suspended | 2022-09-02 | 2023-06-13 | 48 | 937731 | retired | 102 | 1002 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 103 | 3355784 | expired | 2023-02-13 | 2024-11-24 | 53 | 3717633 | unemployed | 103 | 1003 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The `recertification_applications` table records each submission a professional makes to renew their credential. Its surrogate key `id` (100–103) is distinct from the human-readable `application_id` (e.g. `505997`, `1250196`, `124`, `IVC20det40`). The `submission_date` column timestamps the filing; `fee_amount` holds the monetary charge (`38.08`, `18.47`, `26.25`). The `status` column enumerates `pending`, `under_review`, `approved`, and `rejected`, while `verification_status` refines the pipeline with values such as `not_selected`, `selected_for_verification`, `verified`, and `failed_verification`. The boolean `ethics_pledge_signed` confirms whether the applicant attested to the code of ethics. The columns `ru_total_earned` and `ru_required` store the tallied credits and the threshold for that cycle (e.g. application 102 shows 300 earned against 54 required). A foreign key `certified_professional_id` links the application to its owner.

**Table `recertification_applications`**

| id | application_id | submission_date | fee_amount | status | verification_status | ethics_pledge_signed | ru_total_earned | ru_required | certified_professional_id |
|---|---|---|---|---|---|---|---|---|---|
| 100 | 505997 | 2025-04-24T03:57:00 | 38.08 | pending | not_selected | true | 9 | 42 | 100 |
| 101 | 1250196 | 2022-09-08T10:14:00 | 18.47 | under_review | selected_for_verification | false | 24 | 48 | 101 |
| 102 | 124 | 2023-02-19T17:31:00 | 38.08 | approved | verified | true | 300 | 54 | 102 |
| 103 | IVC20det40 | 2024-07-03T00:48:00 | 26.25 | rejected | failed_verification | false | 1 | 60 | 103 |

The `recertification_unit_records` table is the granular ledger of RU credits. Each row represents a single credit-bearing event with surrogate key `recertification_unit_record_id` and business key `record_id`. The `activity_category` column classifies the event (`publication`, `professional_society_participation`, `education`, `conference`), and `sub_category` provides a finer tag (`pilot-sub-20`, `extended-sub-21`, `integrated-sub-22`, `seasonal-sub-23`). The numeric `ru_credits_earned` column holds the credit value (21, 25, 29, 33), and `activity_date` timestamps the event. Boolean flags `applies_to_body_of_knowledge` and `double_counting_allowed` control whether the credit counts toward a knowledge domain and whether it may be reused. The `verification_required` flag gates downstream review. Foreign keys `recertification_application_id` and `activity_id` tie the record to its application and to the originating activity.

**Table `recertification_unit_records`**

| recertification_unit_record_id | record_id | activity_category | sub_category | ru_credits_earned | activity_date | applies_to_body_of_knowledge | double_counting_allowed | verification_required | recertification_application_id | activity_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 10449530 | publication | pilot-sub-20 | 21 | 2024-11-08 | true | true | false | 100 | 8843761 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | 10445619 | professional_society_participation | extended-sub-21 | 25 | 2025-04-19 | false | false | true | 101 | 4180957 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | 9568457 | education | integrated-sub-22 | 29 | 2022-09-03 | true | true | false | 102 | 168545 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | 20743593 | conference | seasonal-sub-23 | 33 | 2023-02-14 | false | false | true | 103 | default_chart_a_account_53 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The `professional_activities` table is the central hub of the domain. Each activity — a publication, a conference attendance, a teaching session, or a presenting engagement — is a row identified by `activity_id`. The `activity_type` column enumerates the kind (`publication`, `conference_attendance`, `conference_presenting`, `teaching`). Date columns `start_date` and `end_date` bound the activity window. The `authorship_role` column captures the contributor's position (`1st_author`, `2nd_or_3rd_author`, `>3rd_author`, `primary_presenter`), while `accreditation_status` records whether the activity is `peer_reviewed`, `accredited_agency`, `non_accredited`, or similar. The boolean `is_part_of_regular_duties` flags whether the activity falls inside normal job responsibilities. The `credits_awarded` column stores the RU value granted (4, 7, 10, 13). Foreign keys `certified_professional_id`, `document_id`, and `course_id` link the activity to its supporting document, its associated course (if any), and its owner.

**Table `professional_activities`**

| activity_id | activity_type | start_date | end_date | authorship_role | accreditation_status | is_part_of_regular_duties | credits_awarded | certified_professional_id | document_id | course_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 8843761 | publication | 2022-09-05 | 2022-09-01 | 1st_author | peer_reviewed | true | 4 | 100 | IVC10I | 100 |
| 4180957 | conference_attendance | 2023-02-16 | 2023-02-12 | 2nd_or_3rd_author | accredited_agency | false | 7 | 101 | 605943 | 101 |
| 168545 | conference_presenting | 2024-07-27 | 2024-07-23 | >3rd_author | non_accredited | true | 10 | 102 | 10449525 | 102 |
| default_chart_a_account_53 | teaching | 2025-12-11 | 2025-12-07 | primary_presenter | peer_reviewed | false | 13 | 103 | 5f93a090-8fcd-11eb-924d-9cd76263cbd0 | 103 |

The `professional_documents` table stores metadata about publications and other documentary artifacts. Its surrogate key `document_id` (values such as `IVC10I`, `605943`, `10449525`, `5f93a090-8fcd-11eb-924d-9cd76263cbd0`) identifies the document. The `title` column holds the name (`Compact Initiative`, `Legacy Model`, `Regional Cluster A`, `Seasonal Review`), `publication_date` timestamps it, and `publisher` names the issuing body (`pilot-publishe-50`, `extended-publishe-51`, `integrated-publishe-52`, `seasonal-publishe-53`). The `document_type` column classifies the artifact (`peer_reviewed_journal`, `online_transaction`, `magazine`, `conference_proceeding`). Boolean flags `applies_to_body_of_knowledge` and `claimed_once_per_period` control credit eligibility, and `total_authors` records the contributor count (13, 2, 12, 11). Foreign keys `certified_professional_id` and `activity_id` tie the document to its owner and to the activity it supports.

**Table `professional_documents`**

| document_id | title | publication_date | publisher | document_type | applies_to_body_of_knowledge | claimed_once_per_period | total_authors | certified_professional_id | activity_id |
|---|---|---|---|---|---|---|---|---|---|
| IVC10I | Compact Initiative | 2025-12-01 | pilot-publishe-50 | peer_reviewed_journal | true | false | 13 | 100 | 8843761 |
| 605943 | Legacy Model | 2022-05-12 | extended-publishe-51 | online_transaction | false | true | 2 | 101 | 4180957 |
| 10449525 | Regional Cluster A | 2023-10-23 | integrated-publishe-52 | magazine | true | false | 12 | 102 | 168545 |
| 5f93a090-8fcd-11eb-924d-9cd76263cbd0 | Seasonal Review | 2024-03-07 | seasonal-publishe-53 | conference_proceeding | false | true | 11 | 103 | default_chart_a_account_53 |

The `courses` table records continuing-education course completions. Its surrogate key `id` doubles as the row identifier, while `course_id` (e.g. `6983`, `8189505`, `9246307`, `99615`) is the business key. The `course_title` column names the offering (`Baseline Series D`, `Distributed Assessment`, `Adaptive Survey`, `Primary Corridor A`), `institution` names the provider (`baseline-institut-31`, `pilot-institut-32`, `extended-institut-33`, `integrated-institut-34`), and `course_level` classifies it as `college` or `non_college`. The `completion_date` column timestamps the finish, and `applies_to_body_of_knowledge` gates credit eligibility. Boolean flags `is_audited` and `is_sponsored_by_employer` record the enrollment context. Foreign keys `certified_professional_id`, `attended_by_certified_professional_id`, and `activity_id` link the course to its owner, to the person who attended, and to the activity row.

**Table `courses`**

| id | course_id | course_title | institution | course_level | completion_date | applies_to_body_of_knowledge | is_audited | is_sponsored_by_employer | certified_professional_id | attended_by_certified_professional_id | activity_id |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 100 | 6983 | Baseline Series D | baseline-institut-31 | college | 2024-03-14 | true | true | The NEA Foundation for the Improvement of Education | 100 | 100 | 8843761 |
| 101 | 8189505 | Distributed Assessment | pilot-institut-32 | non_college | 2025-08-25 | false | false | Esperion Therapeutics Inc. | 101 | 101 | 4180957 |
| 102 | 9246307 | Adaptive Survey | extended-institut-33 | college | 2022-01-09 | true | true | PubMatic Inc. | 102 | 102 | 168545 |
| 103 | 99615 | Primary Corridor A | integrated-institut-34 | non_college | 2023-06-20 | false | false | Link Title | 103 | 103 | default_chart_a_account_53 |

The `professional_society_roles` table captures a professional's service on committees, boards, or editorial panels. Its surrogate key `professional_society_role_id` (1000–1003 in the sample) identifies the role. The table stores the role's title, the society name, the start and end dates, and a boolean `is_elected` flag. A foreign key `certified_professional_id` links the role to its holder.

**Table `professional_society_roles`**

| id | role_instance_id | role_title | society_name | start_date | end_date | ru_credits_per_year | applies_to_body_of_knowledge | certified_professional_id | activity_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 1000 | c7443b9c-8fcc-11eb-924d-9cd76263cbd0 | officer | Composite Model | 2022-09-05 | 2022-09-01 | 19 | true | 100 | 8843761 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 1001 | ca398dba-8fcd-11eb-924d-9cd76263cbd0 | committee_leader | Compact Cluster A | 2023-02-16 | 2023-02-12 | 30 | false | 101 | 4180957 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 1002 | id_15 | committee_member | Legacy Review | 2024-07-27 | 2024-07-23 | 41 | true | 102 | 168545 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 1003 | 2b2bd0a2-8fcd-11eb-924d-9cd76263cbd0 | individual_member | Regional Initiative | 2025-12-11 | 2025-12-07 | 52 | false | 103 | default_chart_a_account_53 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The `applications_records` table is a parallel ledger that mirrors or supplements the application lifecycle. Its surrogate key `id` and business key `application_id` store the same identifiers found in `recertification_applications`. The `submission_date`, `fee_amount`, `status`, and `verification_status` columns duplicate the application metadata, while `ru_total_earned` and `ru_required` store the credit tallies. The boolean `ethics_pledge_signed` mirrors the pledge flag. A foreign key `certified_professional_id` links each record to its owner.

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

### Views as Reconstructed Domain Facts

Each view materializes a specific join across the base tables, answering a single analytical question without requiring the consumer to write SQL. The following sections describe what each view returns and illustrate with concrete rows.

The view `v_recertification_application_certified_professional` joins `recertification_applications` to `certified_professionals` on `certified_professional_id`. It answers the question: *what is the status and fee of each application, and who submitted it?* A row for application 100 shows `application_id` `505997` with `status` `pending`, `fee_amount` `38.08`, and the owner's `certification_status` `active`.

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

The view `v_recertification_application_recertification_unit_record_detail` joins `recertification_applications` to `recertification_unit_records` on `recertification_application_id`. It answers: *which RU records belong to which application, and how many credits did each record contribute?* Application 100's row shows `ru_credits_earned` `21` from a `publication` in category `pilot-sub-20`.

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

The view `v_certified_professional_recertification_application` joins `certified_professionals` to `recertification_applications` on `certified_professional_id`. It answers: *for each professional, what is their current certification period and what application did they file?* Professional 101, with `certification_status` `retired` and period ending `2022-01-02`, has application 101 with `status` `under_review` and `ru_total_earned` `24`.

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

The view `v_certified_professional_professional_society_role` joins `certified_professionals` to `professional_society_roles` on `certified_professional_id`. It answers: *which society roles does each professional hold?* Professional 100 holds role `1000`.

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

The view `v_recertification_unit_record_recertification_application` joins `recertification_unit_records` to `recertification_applications` on `recertification_application_id`. It answers: *which application does each RU record support, and what is the application's overall status?* Record 3 (category `education`, 29 credits) belongs to application 102, which has `status` `approved`.

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

The view `v_recertification_unit_record_professional_activity` joins `recertification_unit_records` to `professional_activities` on `activity_id`. It answers: *what activity generated each RU record, and what type of activity was it?* Record 1 (21 credits, category `publication`) links to activity `8843761` of type `publication` with `authorship_role` `1st_author`.

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

The view `v_professional_activity_certified_professional` joins `professional_activities` to `certified_professionals` on `certified_professional_id`. It answers: *which professional performed each activity, and what is their employment type?* Activity `8843761` (type `publication`, 4 credits) was performed by professional 100, who is `full_time`.

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

The view `v_professional_activity_professional_document` joins `professional_activities` to `professional_documents` on `document_id`. It answers: *which document supports each activity, and what is the document's type?* Activity `8843761` is supported by document `IVC10I` (`Compact Initiative`), a `peer_reviewed_journal` with 13 total authors.

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

The view `v_professional_activity_course` joins `professional_activities` to `courses` on `course_id`. It answers: *which course is associated with each activity, and what level was it?* Activity `8843761` is linked to course `6983` (`Baseline Series D`), a `college`-level offering completed on `2024-03-14`.

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

The view `v_professional_document_certified_professional` joins `professional_documents` to `certified_professionals` on `certified_professional_id`. It answers: *who authored each document, and what is their certification status?* Document `IVC10I` (`Compact Initiative`) was authored by professional 100, whose `certification_status` is `active`.

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

The view `v_professional_document_professional_activity` joins `professional_documents` to `professional_activities` on `activity_id`. It answers: *which activity does each document support, and what is the activity's accreditation status?* Document `IVC10I` supports activity `8843761`, which has `accreditation_status` `peer_reviewed`.

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

The view `v_course_certified_professional` joins `courses` to `certified_professionals` on `certified_professional_id`. It answers: *which professional completed each course, and what is their employment type?* Course `6983` (`Baseline Series D`) was completed by professional 100, who is `full_time`.

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

The view `v_course_professional_activity` joins `courses` to `professional_activities` on `activity_id`. It answers: *which activity is associated with each course, and what is the activity's credit award?* Course `6983` is linked to activity `8843761`, which awarded 4 credits.

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

The view `v_professional_society_role_certified_professional` joins `professional_society_roles` to `certified_professionals` on `certified_professional_id`. It answers: *which professional holds each society role, and what is their certification status?* Role `1000` is held by professional 100, whose `certification_status` is `active`.

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

The view `v_professional_society_role_professional_activity` joins `professional_society_roles` to `professional_activities` through a shared `certified_professional_id`. It answers: *which activities were performed by professionals who hold society roles?* Professional 100, who holds role `1000`, performed activity `8843761` (type `publication`).

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

### Synthesis

The schema decomposes the recertification lifecycle into eight normalized tables whose keys and foreign keys encode a clear ownership hierarchy: `certified_professionals` own `recertification_applications`, which own `recertification_unit_records`, which reference `professional_activities`; activities in turn reference `professional_documents` and `courses`, while `professional_society_roles` sit as a parallel attribute of the professional. The 16 views reassemble these pieces into flat, query-ready facts — each view answering a single domain question by joining exactly two tables. The concrete values in the sample data (application `505997` for professional 100, 21 RU credits from a `publication` activity, a `peer_reviewed_journal` document titled `Compact Initiative`) demonstrate how the normalized structure preserves every attribute while the views present them in the shapes that downstream consumers expect.