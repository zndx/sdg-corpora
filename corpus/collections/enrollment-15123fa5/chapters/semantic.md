The enrollment lifecycle of an educational institution is a tightly coupled domain: a student registers for a program, one or more parents assume financial and legal responsibility, media consent governs how the institution may use the child's likeness, and the origin of the enrollment is tracked for outreach analytics. The relational model captures this lifecycle across nine base tables and ten analytical views, each view materializing a specific business question by joining the normalized tables back together. The schema enforces referential integrity through explicit foreign keys and junction tables, while the views flatten the structure for reporting.

## The Enrollment Entity

The enrollment is the central fact in the domain. The `enrollments` table records every registration event with a composite key consisting of the surrogate `id` and the business `enrollment_id`. Each row captures the financial terms—`registration_fee`, `monthly_tuition`, and `late_fee`—as decimal values, alongside the temporal boundaries of the program via `program_period_start` and `program_period_end`. The `enrollment_date` marks when the registration occurred, `is_refundable` is a boolean flag governing the refund policy, and two foreign keys anchor the enrollment to its child and its media consent: `student_id` references `students.id`, and `media_release_id` references `media_releases.id`.

**Table `enrollments`**

| id | enrollment_id | registration_fee | monthly_tuition | late_fee | enrollment_date | program_period_start | program_period_end | is_refundable | student_id | media_release_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 4447035 | 24.01 | 16.20 | 3.75 | 2022-05-11T16:00:00 | 2024-03-11 | 2023-02-19 | true | 1 | 100 |
| 2 | gd_taxc_2121 | 12.87 | 19.40 | 5.98 | 2023-10-22T23:17:00 | 2025-08-22 | 2024-07-03 | false | 2 | 101 |
| 3 | id_30 | 19.72 | 22.60 | 8.17 | 2024-03-06T06:34:00 | 2022-01-06 | 2025-12-14 | true | 3 | 102 |
| 4 | b_VB-EC-0 | 16.11 | 25.80 | 4.59 | 2025-08-17T13:51:00 | 2023-06-17 | 2022-05-25 | false | 4 | 103 |

Consider enrollment `4447035` (row `id = 1`): Stephanie Collins is registered for a program running from 2024-03-11 to 2023-02-19, with a registration fee of $24.01, monthly tuition of $16.20, and a late fee of $3.75. The enrollment is refundable and is linked to student `1` and media release `100`. In contrast, enrollment `gd_taxc_2121` (row `id = 2`) belongs to Janice Johnston, is non-refundable, and carries a higher monthly tuition of $19.40. The enrollment table is the pivot around which all other entities orbit.

## Students and Their Attributes

The `students` table stores the demographic and administrative profile of each enrolled child. The surrogate `id` serves as the primary key, while `student_id` holds the external identifier. The columns `first_name` and `chinese_name` capture the child's name in two scripts, `birth_date` records the date of birth, and `school_name` identifies the school or program track. The `enrollment_status` column—taking values such as `active`, `withdrawn`, or `suspended`—tracks the current standing of the student, and `enrollment_id` is a foreign key back to `enrollments.id`, establishing a one-to-one or one-to-few relationship between a student record and their enrollment(s).

**Table `students`**

| id | student_id | first_name | chinese_name | birth_date | school_name | enrollment_status | enrollment_id |
|---|---|---|---|---|---|---|---|
| 1 | 392507 | Stephanie Collins | Adaptive Framework | 2023-10-18 | Seasonal Standard | active | 1 |
| 2 | 25388256 | Janice Johnston | Primary Protocol | 2024-03-02 | Integrated Framework | withdrawn | 2 |
| 3 | id_16 | Upal Saha | Composite Programme D | 2025-08-13 | Extended Protocol D | suspended | 3 |
| 4 | gd_taxc_2211 | Katherine Snyder | Compact Standard | 2022-01-24 | Pilot Programme | active | 4 |

Row `id = 1` shows Stephanie Collins, whose Chinese name is recorded as "Adaptive Framework," born on 2023-10-18, enrolled at "Seasonal Standard," and currently `active`. Row `id = 2` records Janice Johnston, status `withdrawn`, at "Integrated Framework." The `students` table is referenced by `enrollments.student_id`, creating the primary link from the enrollment fact to the child.

## Parents and Contact Information

The `parents` table holds the adult party's information. Its surrogate `id` is the primary key, and `parent_id` stores the external identifier. The columns `first_name` and `chinese_name` mirror the student naming convention, while `home_phone`, `cell_phone`, and `email` provide three distinct contact channels. The `home_address`, `city`, and `zip_code` columns capture the residential location. The `student_id` column is a foreign key to `students.id`, linking a parent to a specific child.

**Table `parents`**

| id | parent_id | first_name | chinese_name | home_phone | cell_phone | email | home_address | city | zip_code | student_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1000 | 4793462 | Stephanie Collins | Adaptive Framework | regional-home-54 | distributed-cell-72 | seasonal-email-11 | distributed-home-60 | integrated-city-34 | 69434 | 1 |
| 1001 | gd_acc_120000 | Janice Johnston | Primary Protocol | legacy-home-55 | baseline-cell-73 | regional-email-12 | baseline-home-61 | seasonal-city-35 | 13589 | 2 |
| 1002 | 9568439 | Upal Saha | Composite Programme D | compact-home-56 | pilot-cell-74 | legacy-email-13 | pilot-home-62 | regional-city-36 | 9bb5fec0-8fcc-11eb-924d-9cd76263cbd0 | 3 |
| 1003 | BJBBB | Katherine Snyder | Compact Standard | composite-home-57 | extended-cell-75 | compact-email-14 | extended-home-63 | legacy-city-37 | 1250214 | 4 |

Parent `id = 1000` (external `parent_id = 4793462`) is Stephanie Collins, reachable at `regional-home-54` and `distributed-cell-72`, with email `seasonal-email-11`, residing at `distributed-home-60` in `integrated-city-37` with zip `69434`, and linked to student `1`. Parent `id = 1003` (external `parent_id = BJBBB`) is Katherine Snyder, with email `compact-email-14`, linked to student `4`. The parent table is the hub for the many-to-many relationships that follow.

## Media Releases and Consent

The `media_releases` table stores the legal consent document associated with each enrollment. The surrogate `id` is the primary key, and `release_id` holds the external identifier. Boolean columns `allows_video_recording`, `allows_audio_recording`, `allows_photography`, and `allows_promotional_use` enumerate the specific permissions granted by the parent. The `waives_right_to_sue` and `hold_harmless_agreement` columns record additional legal protections. The `signed_date` captures when the consent was executed, and `enrollment_id` is a foreign key to `enrollments.id`, tying the consent to a specific registration.

**Table `media_releases`**

| id | release_id | allows_video_recording | allows_audio_recording | allows_photography | allows_promotional_use | waives_right_to_sue | hold_harmless_agreement | signed_date | enrollment_id |
|---|---|---|---|---|---|---|---|---|---|
| 100 | BJGopher | true | true | true | false | true | true | 2024-07-17T06:42:00 | 1 |
| 101 | 2e556f8c-8fcc-11eb-924d-9cd76263cbd0 | false | false | false | true | false | false | 2025-12-01T13:59:00 | 2 |
| 102 | 9085248 | true | true | true | false | true | true | 2022-05-12T20:16:00 | 3 |
| 103 | 0981c420-9bad-11eb-a8a2-19ed5c03f8d3 | false | false | false | true | false | false | 2023-10-23T03:33:00 | 4 |

Media release `id = 100` (external `release_id = BJGopher`) is linked to enrollment `1` and was signed on 2024-07-17. It permits video recording, audio recording, and photography, but explicitly denies promotional use. The parent waives the right to sue and signs a hold-harmless agreement. In contrast, release `id = 101` (linked to enrollment `2`) denies all recording and photography permissions but allows promotional use, and the parent does not waive liability.

## Referral Sources

The `referral_sources` table tracks how each enrollment was acquired. The `referral_source_id` serves as the primary key and also functions as a foreign key to `enrollments.id`, ensuring every enrollment has at most one recorded source. The `source_id` holds the external identifier for the source, `source_name` provides a human-readable label, and `other_details` captures supplementary information.

**Table `referral_sources`**

| referral_source_id | source_id | source_name | other_details | enrollment_id |
|---|---|---|---|---|
| 100 | 3e9b5c70-8fcd-11eb-924d-9cd76263cbd0 | Internet | seasonal-other-29 | 1 |
| 101 | 7021001070050 | Texas Capital News | regional-other-30 | 2 |
| 102 | achat | parents | legacy-other-31 | 3 |
| 103 | template_impcode_pagata_10det50 | Other | compact-other-32 | 4 |

Enrollment `1` was referred via the `Internet` (external `source_id = 3e9b5c70-8fcd-11eb-924d-9cd76263cbd0`), with additional details `seasonal-other-29`. Enrollment `2` came from `Texas Capital News` (external `source_id = 7021001070050`). This table supports marketing attribution by linking each enrollment to its origin channel.

## Junction Tables for Many-to-Many Relationships

The domain requires several many-to-many relationships that cannot be expressed through simple foreign keys. The `enrollments_parents` junction table links enrollments to parents, allowing a single enrollment to have multiple responsible adults and a single parent to be associated with multiple enrollments. It consists of two columns: `enrollment_id` and `parent_id`, both of which are foreign keys referencing `enrollments.id` and `parents.id` respectively.

**Table `enrollments_parents`**

| enrollment_id | parent_id |
|---|---|
| 1 | 1000 |
| 1 | 1001 |
| 2 | 1001 |
| 2 | 1002 |
| 3 | 1002 |
| 3 | 1003 |
| 4 | 1003 |
| 4 | 1000 |

Enrollment `1` is linked to parents `1000` and `1001`, indicating two adults share responsibility for Stephanie Collins's registration. Enrollment `2` connects parents `1001` and `1002`, showing that Janice Johnston's enrollment involves a different pair of adults. The junction table contains eight rows across four enrollments, with each enrollment having exactly two parent associations.

The `students_parents` table provides an alternative or complementary linkage between students and parents. It contains `student_id` and `parent_id` columns, both foreign keys to their respective tables.

**Table `students_parents`**

| student_id | parent_id |
|---|---|
| 1 | 1000 |
| 1 | 1001 |
| 2 | 1001 |
| 2 | 1002 |
| 3 | 1002 |
| 3 | 1003 |
| 4 | 1003 |
| 4 | 1000 |

This table directly associates students with their parents, independent of the enrollment context. It supports queries that need to identify all parents of a given student regardless of enrollment status.

The `parents_enrollments` table is another junction table that links parents to enrollments, mirroring the relationship in `enrollments_parents` but from the parent's perspective.

**Table `parents_enrollments`**

| parent_id | enrollment_id |
|---|---|
| 1000 | 1 |
| 1000 | 2 |
| 1001 | 2 |
| 1001 | 3 |
| 1002 | 3 |
| 1002 | 4 |
| 1003 | 4 |
| 1003 | 1 |

This table enables parent-centric queries, such as "which enrollments is parent 1000 associated with?" Parent `1000` appears linked to enrollments `1` and `4`, spanning two different students.

The `releases_parents` table connects media releases to parents, allowing the system to track which parent signed which consent document.

**Table `releases_parents`**

| media_release_id | parent_id |
|---|---|
| 100 | 1000 |
| 100 | 1001 |
| 101 | 1001 |
| 101 | 1002 |
| 102 | 1002 |
| 102 | 1003 |
| 103 | 1003 |
| 103 | 1000 |

This junction table supports scenarios where multiple parents may need to sign a media release, or where a single parent's consent applies across multiple enrollments.

## Analytical Views

The views materialize the normalized schema into flat, report-ready structures. Each view answers a specific business question by joining the relevant base tables.

### Enrollment-to-Student View

The view `v_enrollment_student` joins `enrollments` with `students` on `enrollments.student_id = students.id`, producing a flat record that combines financial and demographic data.

**View `v_enrollment_student`**

```sql
CREATE VIEW v_enrollment_student AS
SELECT a.id, a.enrollment_id, a.registration_fee, a.monthly_tuition, b.id AS student_id, b.student_id AS student_student_id, b.first_name AS student_first_name
FROM enrollments a JOIN students b ON a.student_id = b.id;
```

| id | enrollment_id | registration_fee | monthly_tuition | student_id | student_student_id | student_first_name |
|---|---|---|---|---|---|---|
| 1 | 4447035 | 24.01 | 16.20 | 1 | 392507 | Stephanie Collins |
| 2 | gd_taxc_2121 | 12.87 | 19.40 | 2 | 25388256 | Janice Johnston |
| 3 | id_30 | 19.72 | 22.60 | 3 | id_16 | Upal Saha |
| 4 | b_VB-EC-0 | 16.11 | 25.80 | 4 | gd_taxc_2211 | Katherine Snyder |

This view answers the question: "What are the financial terms and student details for each enrollment?" Reading row `id = 1`, we see enrollment `4447035` with a registration fee of $24.01, monthly tuition of $16.20, and late fee of $3.75, linked to student Stephanie Collins, who is `active` at "Seasonal Standard." Row `id = 3` shows enrollment `id_30` with a higher monthly tuition of $22.60, linked to student Upal Saha, whose status is `suspended`.

### Enrollment-to-Parent Detail View

The view `v_enrollment_parent_detail` joins `enrollments` with `parents` through the `enrollments_parents` junction, producing one row per enrollment-parent pair.

**View `v_enrollment_parent_detail`**

```sql
CREATE VIEW v_enrollment_parent_detail AS
SELECT a.id, a.enrollment_id, a.registration_fee, b.id AS parent_id, b.parent_id AS parent_parent_id, b.first_name AS parent_first_name
FROM enrollments a
  JOIN enrollments_parents j ON j.enrollment_id = a.id
  JOIN parents b ON b.id = j.parent_id;
```

| id | enrollment_id | registration_fee | parent_id | parent_parent_id | parent_first_name |
|---|---|---|---|---|---|
| 1 | 4447035 | 24.01 | 1000 | 4793462 | Stephanie Collins |
| 1 | 4447035 | 24.01 | 1001 | gd_acc_120000 | Janice Johnston |
| 2 | gd_taxc_2121 | 12.87 | 1001 | gd_acc_120000 | Janice Johnston |
| 2 | gd_taxc_2121 | 12.87 | 1002 | 9568439 | Upal Saha |
| 3 | id_30 | 19.72 | 1002 | 9568439 | Upal Saha |
| 3 | id_30 | 19.72 | 1003 | BJBBB | Katherine Snyder |
| 4 | b_VB-EC-0 | 16.11 | 1003 | BJBBB | Katherine Snyder |
| 4 | b_VB-EC-0 | 16.11 | 1000 | 4793462 | Stephanie Collins |

This view answers: "Which parents are responsible for which enrollments, and what are the contact details?" Row `id = 1` shows enrollment `4447035` linked to parent `1000` (Stephanie Collins), reachable at `regional-home-54` and `seasonal-email-11`, residing in `integrated-city-37`. Row `id = 2` links the same enrollment to parent `1001` (Janice Johnston), with email `regional-email-12`. This view is essential for billing communications and parent outreach.

### Enrollment-to-Media Release View

The view `v_enrollment_media_release` joins `enrollments` with `media_releases` on `enrollments.media_release_id = media_releases.id`.

**View `v_enrollment_media_release`**

```sql
CREATE VIEW v_enrollment_media_release AS
SELECT a.id, a.enrollment_id, a.registration_fee, a.monthly_tuition, b.id AS release_id, b.release_id AS release_release_id, b.allows_video_recording AS release_allows_video_recording
FROM enrollments a JOIN media_releases b ON a.media_release_id = b.id;
```

| id | enrollment_id | registration_fee | monthly_tuition | release_id | release_release_id | release_allows_video_recording |
|---|---|---|---|---|---|---|
| 1 | 4447035 | 24.01 | 16.20 | 100 | BJGopher | true |
| 2 | gd_taxc_2121 | 12.87 | 19.40 | 101 | 2e556f8c-8fcc-11eb-924d-9cd76263cbd0 | false |
| 3 | id_30 | 19.72 | 22.60 | 102 | 9085248 | true |
| 4 | b_VB-EC-0 | 16.11 | 25.80 | 103 | 0981c420-9bad-11eb-a8a2-19ed5c03f8d3 | false |

This view answers: "What media permissions are in effect for each enrollment?" Row `id = 1` shows enrollment `4447035` with media release `BJGopher`, which permits video, audio, and photography but denies promotional use, and was signed on 2024-07-17. Row `id = 2` shows enrollment `gd_taxc_2121` with release `2e556f8c-8fcc-11eb-924d-9cd76263cbd0`, which denies all recording permissions but allows promotional use. This view is critical for compliance and content governance.

### Student-to-Enrollment View

The view `v_student_enrollment` joins `students` with `enrollments` on `students.enrollment_id = enrollments.id`.

**View `v_student_enrollment`**

```sql
CREATE VIEW v_student_enrollment AS
SELECT a.id, a.student_id, a.first_name, a.chinese_name, b.id AS enrollment_id, b.enrollment_id AS enrollment_enrollment_id, b.registration_fee AS enrollment_registration_fee
FROM students a JOIN enrollments b ON a.enrollment_id = b.id;
```

| id | student_id | first_name | chinese_name | enrollment_id | enrollment_enrollment_id | enrollment_registration_fee |
|---|---|---|---|---|---|---|
| 1 | 392507 | Stephanie Collins | Adaptive Framework | 1 | 4447035 | 24.01 |
| 2 | 25388256 | Janice Johnston | Primary Protocol | 2 | gd_taxc_2121 | 12.87 |
| 3 | id_16 | Upal Saha | Composite Programme D | 3 | id_30 | 19.72 |
| 4 | gd_taxc_2211 | Katherine Snyder | Compact Standard | 4 | b_VB-EC-0 | 16.11 |

This view answers: "What is the enrollment status and financial profile of each student?" Row `id = 1` shows student Stephanie Collins, status `active`, with enrollment `4447035` having a registration fee of $24.01 and monthly tuition of $16.20. Row `id = 2` shows Janice Johnston, status `withdrawn`, with enrollment `gd_taxc_2121` and monthly tuition of $19.40. This view supports administrative reporting on enrollment outcomes.

### Student-to-Parent Detail View

The view `v_student_parent_detail` joins `students` with `parents` through the `students_parents` junction table.

**View `v_student_parent_detail`**

```sql
CREATE VIEW v_student_parent_detail AS
SELECT a.id, a.student_id, a.first_name, b.id AS parent_id, b.parent_id AS parent_parent_id, b.first_name AS parent_first_name
FROM students a
  JOIN students_parents j ON j.student_id = a.id
  JOIN parents b ON b.id = j.parent_id;
```

| id | student_id | first_name | parent_id | parent_parent_id | parent_first_name |
|---|---|---|---|---|---|
| 1 | 392507 | Stephanie Collins | 1000 | 4793462 | Stephanie Collins |
| 1 | 392507 | Stephanie Collins | 1001 | gd_acc_120000 | Janice Johnston |
| 2 | 25388256 | Janice Johnston | 1001 | gd_acc_120000 | Janice Johnston |
| 2 | 25388256 | Janice Johnston | 1002 | 9568439 | Upal Saha |
| 3 | id_16 | Upal Saha | 1002 | 9568439 | Upal Saha |
| 3 | id_16 | Upal Saha | 1003 | BJBBB | Katherine Snyder |
| 4 | gd_taxc_2211 | Katherine Snyder | 1003 | BJBBB | Katherine Snyder |
| 4 | gd_taxc_2211 | Katherine Snyder | 1000 | 4793462 | Stephanie Collins |

This view answers: "Who are the parents of each student, and how can they be contacted?" Row `id = 1` links student Stephanie Collins to parent `1000` (Stephanie Collins), with cell phone `distributed-cell-72` and email `seasonal-email-11`. Row `id = 2` links student Janice Johnston to parent `1001` (Janice Johnston), with email `regional-email-12`. This view is used for parent-teacher communications and emergency contact management.

### Parent-to-Enrollment Detail View

The view `v_parent_enrollment_detail` joins `parents` with `enrollments` through the `parents_enrollments` junction table.

**View `v_parent_enrollment_detail`**

```sql
CREATE VIEW v_parent_enrollment_detail AS
SELECT a.id, a.parent_id, a.first_name, b.id AS enrollment_id, b.enrollment_id AS enrollment_enrollment_id, b.registration_fee AS enrollment_registration_fee
FROM parents a
  JOIN parents_enrollments j ON j.parent_id = a.id
  JOIN enrollments b ON b.id = j.enrollment_id;
```

| id | parent_id | first_name | enrollment_id | enrollment_enrollment_id | enrollment_registration_fee |
|---|---|---|---|---|---|
| 1000 | 4793462 | Stephanie Collins | 1 | 4447035 | 24.01 |
| 1000 | 4793462 | Stephanie Collins | 2 | gd_taxc_2121 | 12.87 |
| 1001 | gd_acc_120000 | Janice Johnston | 2 | gd_taxc_2121 | 12.87 |
| 1001 | gd_acc_120000 | Janice Johnston | 3 | id_30 | 19.72 |
| 1002 | 9568439 | Upal Saha | 3 | id_30 | 19.72 |
| 1002 | 9568439 | Upal Saha | 4 | b_VB-EC-0 | 16.11 |
| 1003 | BJBBB | Katherine Snyder | 4 | b_VB-EC-0 | 16.11 |
| 1003 | BJBBB | Katherine Snyder | 1 | 4447035 | 24.01 |

This view answers: "Which enrollments is each parent associated with, and what are the financial terms?" Row `id = 1` shows parent `1000` (Stephanie Collins) linked to enrollment `4447035` with monthly tuition of $16.20. Row `id = 4` shows the same parent linked to enrollment `b_VB-EC-0` with monthly tuition of $25.80. This view supports financial accountability and parent-level reporting.

### Parent-to-Student View

The view `v_parent_student` joins `parents` with `students` on `parents.student_id = students.id`.

**View `v_parent_student`**

```sql
CREATE VIEW v_parent_student AS
SELECT a.id, a.parent_id, a.first_name, a.chinese_name, b.id AS student_id, b.student_id AS student_student_id, b.first_name AS student_first_name
FROM parents a JOIN students b ON a.student_id = b.id;
```

| id | parent_id | first_name | chinese_name | student_id | student_student_id | student_first_name |
|---|---|---|---|---|---|---|
| 1000 | 4793462 | Stephanie Collins | Adaptive Framework | 1 | 392507 | Stephanie Collins |
| 1001 | gd_acc_120000 | Janice Johnston | Primary Protocol | 2 | 25388256 | Janice Johnston |
| 1002 | 9568439 | Upal Saha | Composite Programme D | 3 | id_16 | Upal Saha |
| 1003 | BJBBB | Katherine Snyder | Compact Standard | 4 | gd_taxc_2211 | Katherine Snyder |

This view answers: "Which student does each parent have on record?" Row `id = 1` links parent `1000` (Stephanie Collins) to student `1` (Stephanie Collins), born 2023-10-18, at "Seasonal Standard." Row `id = 4` links parent `1003` (Katherine Snyder) to student `4` (Katherine Snyder), born 2022-01-24, at "Pilot Programme." This view is useful for verifying parent-child relationships and generating family-level reports.

### Media Release-to-Enrollment View

The view `v_media_release_enrollment` joins `media_releases` with `enrollments` on `media_releases.enrollment_id = enrollments.id`.

**View `v_media_release_enrollment`**

```sql
CREATE VIEW v_media_release_enrollment AS
SELECT a.id, a.release_id, a.allows_video_recording, a.allows_audio_recording, b.id AS enrollment_id, b.enrollment_id AS enrollment_enrollment_id, b.registration_fee AS enrollment_registration_fee
FROM media_releases a JOIN enrollments b ON a.enrollment_id = b.id;
```

| id | release_id | allows_video_recording | allows_audio_recording | enrollment_id | enrollment_enrollment_id | enrollment_registration_fee |
|---|---|---|---|---|---|---|
| 100 | BJGopher | true | true | 1 | 4447035 | 24.01 |
| 101 | 2e556f8c-8fcc-11eb-924d-9cd76263cbd0 | false | false | 2 | gd_taxc_2121 | 12.87 |
| 102 | 9085248 | true | true | 3 | id_30 | 19.72 |
| 103 | 0981c420-9bad-11eb-a8a2-19ed5c03f8d3 | false | false | 4 | b_VB-EC-0 | 16.11 |

This view answers: "Which enrollment is each media release associated with, and what are the financial terms?" Row `id = 1` shows media release `BJGopher` linked to enrollment `4447035` with registration fee $24.01. Row `id = 2` shows release `2e556f8c-8fcc-11eb-924d-9cd76263cbd0` linked to enrollment `gd_taxc_2121` with registration fee $12.87. This view supports compliance audits by correlating consent status with active enrollments.

### Media Release-to-Parent Detail View

The view `v_media_release_parent_detail` joins `media_releases` with `parents` through the `releases_parents` junction table.

**View `v_media_release_parent_detail`**

```sql
CREATE VIEW v_media_release_parent_detail AS
SELECT a.id, a.release_id, a.allows_video_recording, b.id AS parent_id, b.parent_id AS parent_parent_id, b.first_name AS parent_first_name
FROM media_releases a
  JOIN releases_parents j ON j.media_release_id = a.id
  JOIN parents b ON b.id = j.parent_id;
```

| id | release_id | allows_video_recording | parent_id | parent_parent_id | parent_first_name |
|---|---|---|---|---|---|
| 100 | BJGopher | true | 1000 | 4793462 | Stephanie Collins |
| 100 | BJGopher | true | 1001 | gd_acc_120000 | Janice Johnston |
| 101 | 2e556f8c-8fcc-11eb-924d-9cd76263cbd0 | false | 1001 | gd_acc_120000 | Janice Johnston |
| 101 | 2e556f8c-8fcc-11eb-924d-9cd76263cbd0 | false | 1002 | 9568439 | Upal Saha |
| 102 | 9085248 | true | 1002 | 9568439 | Upal Saha |
| 102 | 9085248 | true | 1003 | BJBBB | Katherine Snyder |
| 103 | 0981c420-9bad-11eb-a8a2-19ed5c03f8d3 | false | 1003 | BJBBB | Katherine Snyder |
| 103 | 0981c420-9bad-11eb-a8a2-19ed5c03f8d3 | false | 1000 | 4793462 | Stephanie Collins |

This view answers: "Which parent signed which media release, and what permissions were granted?" Row `id = 1` links media release `BJGopher` to parent `1000` (Stephanie Collins), who granted permissions for video, audio, and photography. Row `id = 2` links release `2e556f8c-8fcc-11eb-924d-9cd76263cbd0` to parent `1001` (Janice Johnston), who denied all recording permissions. This view is essential for legal compliance and consent management.

### Referral Source-to-Enrollment View

The view `v_referral_source_enrollment` joins `referral_sources` with `enrollments` on `referral_sources.enrollment_id = enrollments.id`.

**View `v_referral_source_enrollment`**

```sql
CREATE VIEW v_referral_source_enrollment AS
SELECT a.referral_source_id, a.source_id, a.source_name, a.other_details, b.id AS enrollment_id, b.enrollment_id AS enrollment_enrollment_id, b.registration_fee AS enrollment_registration_fee
FROM referral_sources a JOIN enrollments b ON a.enrollment_id = b.id;
```

| referral_source_id | source_id | source_name | other_details | enrollment_id | enrollment_enrollment_id | enrollment_registration_fee |
|---|---|---|---|---|---|---|
| 100 | 3e9b5c70-8fcd-11eb-924d-9cd76263cbd0 | Internet | seasonal-other-29 | 1 | 4447035 | 24.01 |
| 101 | 7021001070050 | Texas Capital News | regional-other-30 | 2 | gd_taxc_2121 | 12.87 |
| 102 | achat | parents | legacy-other-31 | 3 | id_30 | 19.72 |
| 103 | template_impcode_pagata_10det50 | Other | compact-other-32 | 4 | b_VB-EC-0 | 16.11 |

This view answers: "How was each enrollment acquired, and what are the financial terms?" Row `id = 1` shows enrollment `4447035` referred via the `Internet` with registration fee $24.01. Row `id = 2` shows enrollment `gd_taxc_2121` referred via `Texas Capital News` with registration fee $12.87. Row `id = 3` shows enrollment `id_30` referred via `parents` (word-of-mouth) with registration fee $19.72. This view supports marketing analytics by attributing enrollments to their source channels.

## Synthesis

The schema models the enrollment domain as a star-like structure centered on `enrollments`, with `students` and `media_releases` as direct foreign-key neighbors, and `parents` connected through three distinct junction tables that capture the many-to-many relationships from different angles. The `referral_sources` table sits as a sibling to the enrollment, providing attribution. The ten views flatten this normalized structure into domain-specific lenses: enrollment-centric views (`v_enrollment_student`, `v_enrollment_parent_detail`, `v_enrollment_media_release`), student-centric views (`v_student_enrollment`, `v_student_parent_detail`), parent-centric views (`v_parent_enrollment_detail`, `v_parent_student`, `v_media_release_parent_detail`), and compliance and attribution views (`v_media_release_enrollment`, `v_referral_source_enrollment`). Together, the base tables and views provide a complete, queryable representation of the enrollment lifecycle, from registration through consent to financial accountability.