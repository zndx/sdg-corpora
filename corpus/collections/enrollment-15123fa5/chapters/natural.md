## Enrollment Management and Consent Tracking

Educational institutions and program operators must maintain precise records of student enrollment, parental guardianship, media consent, and referral attribution. The domain centers on four primary entities—enrollments, students, parents, and media releases—linked through a network of relational tables that capture the operational reality of a program's lifecycle. Each enrollment represents a financial and temporal commitment, carrying registration fees, monthly tuition, and defined program periods. Students are the individuals enrolled, with their personal identifiers and current enrollment status tracked alongside their assigned school. Parents carry contact information and legal guardianship responsibilities, often linked to multiple students and enrollments. Media releases document the consent given for video, audio, photography, and promotional use, forming a legal layer atop the enrollment record. Referral sources attribute how families discovered the program, providing operational intelligence for outreach planning.

**Table `enrollments`**

| id | enrollment_id | registration_fee | monthly_tuition | late_fee | enrollment_date | program_period_start | program_period_end | is_refundable | student_id | media_release_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 4447035 | 24.01 | 16.20 | 3.75 | 2022-05-11T16:00:00 | 2024-03-11 | 2023-02-19 | true | 1 | 100 |
| 2 | gd_taxc_2121 | 12.87 | 19.40 | 5.98 | 2023-10-22T23:17:00 | 2025-08-22 | 2024-07-03 | false | 2 | 101 |
| 3 | id_30 | 19.72 | 22.60 | 8.17 | 2024-03-06T06:34:00 | 2022-01-06 | 2025-12-14 | true | 3 | 102 |
| 4 | b_VB-EC-0 | 16.11 | 25.80 | 4.59 | 2025-08-17T13:51:00 | 2023-06-17 | 2022-05-25 | false | 4 | 103 |

An enrollment record anchors the entire operational dataset. The `enrollment_id` column serves as the primary business key, while the `id` column provides a surrogate identifier. Financial obligations are captured through `registration_fee`, `monthly_tuition`, and `late_fee`—for instance, enrollment 4447035 carries a registration fee of 24.01, a monthly tuition of 16.20, and a late fee of 3.75. The temporal scope of each enrollment is defined by `program_period_start` and `program_period_end`, which may not always follow chronological order in the data, as seen with enrollment b_VB-EC-0 where the start date (2023-06-17) postdates the end date (2022-05-25). The `is_refundable` flag indicates whether fees paid are recoverable. Each enrollment references a `student_id` and a `media_release_id`, establishing the core foreign-key relationships that tie the financial record to the individual and the consent documentation.

**Table `students`**

| id | student_id | first_name | chinese_name | birth_date | school_name | enrollment_status | enrollment_id |
|---|---|---|---|---|---|---|---|
| 1 | 392507 | Stephanie Collins | Adaptive Framework | 2023-10-18 | Seasonal Standard | active | 1 |
| 2 | 25388256 | Janice Johnston | Primary Protocol | 2024-03-02 | Integrated Framework | withdrawn | 2 |
| 3 | id_16 | Upal Saha | Composite Programme D | 2025-08-13 | Extended Protocol D | suspended | 3 |
| 4 | gd_taxc_2211 | Katherine Snyder | Compact Standard | 2022-01-24 | Pilot Programme | active | 4 |

Student records provide the human dimension of the enrollment system. The `student_id` column holds the business identifier, while `first_name` and `chinese_name` capture the student's given names in both English and Chinese. The `birth_date` field records the date of birth, and `school_name` identifies the assigned school or program track. The `enrollment_status` column tracks the current state of the student within the program, with values such as `active`, `withdrawn`, and `suspended` appearing across the dataset. Each student record also carries an `enrollment_id`, linking the individual to their specific enrollment. Stephanie Collins, for example, is associated with the school named "Seasonal Standard" and holds an active enrollment status, while Janice Johnston is marked as withdrawn from the "Integrated Framework" program.

**Table `parents`**

| id | parent_id | first_name | chinese_name | home_phone | cell_phone | email | home_address | city | zip_code | student_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1000 | 4793462 | Stephanie Collins | Adaptive Framework | regional-home-54 | distributed-cell-72 | seasonal-email-11 | distributed-home-60 | integrated-city-34 | 69434 | 1 |
| 1001 | gd_acc_120000 | Janice Johnston | Primary Protocol | legacy-home-55 | baseline-cell-73 | regional-email-12 | baseline-home-61 | seasonal-city-35 | 13589 | 2 |
| 1002 | 9568439 | Upal Saha | Composite Programme D | compact-home-56 | pilot-cell-74 | legacy-email-13 | pilot-home-62 | regional-city-36 | 9bb5fec0-8fcc-11eb-924d-9cd76263cbd0 | 3 |
| 1003 | BJBBB | Katherine Snyder | Compact Standard | composite-home-57 | extended-cell-75 | compact-email-14 | extended-home-63 | legacy-city-37 | 1250214 | 4 |

Parent records store the contact and guardianship information for families involved in the program. The `parent_id` column serves as the business identifier, and each parent record includes `first_name` and `chinese_name` fields mirroring the student naming convention. Contact details are captured across `home_phone`, `cell_phone`, and `email`, with values like `regional-home-54` for home phone and `seasonal-email-11` for email. The `home_address` and `city` fields provide geographic context, while `zip_code` stores the postal code. Each parent record also includes a `student_id`, establishing a direct link to the student they are associated with. The parent table supports many-to-many relationships through dedicated junction tables, as a single parent may be linked to multiple students and enrollments across the system.

**Table `media_releases`**

| id | release_id | allows_video_recording | allows_audio_recording | allows_photography | allows_promotional_use | waives_right_to_sue | hold_harmless_agreement | signed_date | enrollment_id |
|---|---|---|---|---|---|---|---|---|---|
| 100 | BJGopher | true | true | true | false | true | true | 2024-07-17T06:42:00 | 1 |
| 101 | 2e556f8c-8fcc-11eb-924d-9cd76263cbd0 | false | false | false | true | false | false | 2025-12-01T13:59:00 | 2 |
| 102 | 9085248 | true | true | true | false | true | true | 2022-05-12T20:16:00 | 3 |
| 103 | 0981c420-9bad-11eb-a8a2-19ed5c03f8d3 | false | false | false | true | false | false | 2023-10-23T03:33:00 | 4 |

Media release records document the legal consents granted by families for the use of student media. The `release_id` column holds the business identifier for each consent document. The release captures five distinct permissions: `allows_video_recording`, `allows_audio_recording`, `allows_photography`, `allows_promotional_use`, and `waives_right_to_sue`, each stored as a boolean value. The `hold_harmless_agreement` field indicates whether a hold-harmless clause was signed. The `signed_date` records when the consent was executed. Release BJGopher, for instance, permits video recording, audio recording, and photography while denying promotional use, with both the waiver and hold-harmless agreement signed on 2024-07-17. In contrast, release 2e556f8c-8fcc-11eb-924d-9cd76263cbd0 denies all media permissions but grants promotional use rights, with no waiver or hold-harmless agreement in place. Each media release is tied to an `enrollment_id`, anchoring the consent to a specific enrollment record.

**Table `referral_sources`**

| referral_source_id | source_id | source_name | other_details | enrollment_id |
|---|---|---|---|---|
| 100 | 3e9b5c70-8fcd-11eb-924d-9cd76263cbd0 | Internet | seasonal-other-29 | 1 |
| 101 | 7021001070050 | Texas Capital News | regional-other-30 | 2 |
| 102 | achat | parents | legacy-other-31 | 3 |
| 103 | template_impcode_pagata_10det50 | Other | compact-other-32 | 4 |

Referral source records track how families discovered the program, providing operational intelligence for marketing and outreach efforts. The `referral_source_id` serves as the primary key, while `source_id` holds the business identifier. The `source_name` column identifies the origin channel, with values such as "Internet", "Texas Capital News", "parents", and "Other" appearing in the dataset. The `other_details` field captures supplementary information about the referral, and `enrollment_id` links the referral attribution to a specific enrollment. This table enables the program to measure the effectiveness of different acquisition channels and allocate resources accordingly.

The relational model extends beyond these five core tables through three junction tables that resolve many-to-many relationships. The `enrollments_parents` table links enrollments to parents, allowing a single enrollment to be associated with multiple guardians and a single parent to be associated with multiple enrollments. The `students_parents` table connects students to their parents, supporting the reality that a child may have multiple guardians and a guardian may be responsible for multiple children. The `parents_enrollments` table provides an additional linkage layer between parents and enrollments, ensuring comprehensive coverage of the parent-enrollment relationship. The `releases_parents` table connects media releases to parents, documenting which guardian signed which consent document.

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

The enrollments_parents junction table establishes the relationship between enrollment records and parent records. Each row contains an `enrollment_id` and a `parent_id`, forming a composite link. Enrollment 1 is associated with parents 1000 and 1001, indicating that two guardians are linked to this single enrollment. Similarly, enrollment 4 connects to parents 1003 and 1000, showing that parent 1000 appears across multiple enrollments. This table enables the system to query which parents are responsible for which enrollments, supporting communication workflows and consent verification.

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

The students_parents table links student records to parent records, capturing the guardianship relationship. Each row pairs a `student_id` with a `parent_id`, allowing a student to have multiple parents and a parent to have multiple students. This relationship is foundational for determining which contact information applies to which student in notification and reporting contexts.

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

The parents_enrollments table provides a direct linkage between parent records and enrollment records. Each row contains a `parent_id` and an `enrollment_id`, enabling queries that determine which enrollments a specific parent is associated with, independent of the student-level linkage. This table complements the enrollments_parents junction by providing an alternative path through the relationship graph.

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

The releases_parents table connects media release records to parent records, documenting which guardian signed which consent. Each row pairs a `release_id` with a `parent_id`, enabling the system to verify that the appropriate guardian has provided consent for a given enrollment. This relationship is critical for compliance, as it ensures that media usage permissions are traceable to the authorized signatory.

The view layer synthesizes these base tables into analytical constructs that answer specific operational questions. Each view joins the relevant tables to produce a flattened result set suitable for reporting and decision-making.

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

The v_enrollment_student view joins the enrollments table with the students table, producing a consolidated record that combines financial and temporal enrollment data with the student's personal information. This view answers the question: "What are the financial terms and program dates for each student's enrollment?" For enrollment 4447035, the view reveals that Stephanie Collins is enrolled under a registration fee of 24.01, a monthly tuition of 16.20, and a late fee of 3.75, with the program period spanning from 2024-03-11 to 2023-02-19. The view also surfaces the enrollment status, showing that Stephanie Collins is active while Janice Johnston is withdrawn.

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

The v_enrollment_parent_detail view joins enrollments with the enrollments_parents junction and the parents table, producing a record that pairs each enrollment with its associated parent contact information. This view answers: "Which parent(s) are linked to each enrollment, and how can they be contacted?" For enrollment 1, the view surfaces parent 1000 (Stephanie Collins) with home phone regional-home-54 and email seasonal-email-11, as well as parent 1001 (Janice Johnston) with home phone legacy-home-55 and email regional-email-12. This dual-parent linkage is essential for communication workflows that require reaching all guardians associated with an enrollment.

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

The v_enrollment_media_release view joins enrollments with media_releases, producing a consolidated record that pairs each enrollment with its associated media consent permissions. This view answers: "What media permissions are in effect for each enrollment?" For enrollment 1, the view shows that release BJGopher permits video recording, audio recording, and photography, while denying promotional use. The waiver and hold-harmless agreement are both signed, with the signed date recorded as 2024-07-17. For enrollment 2, the view reveals that release 2e556f8c-8fcc-11eb-924d-9cd76263cbd0 denies all media permissions but grants promotional use rights, with no waiver or hold-harmless agreement signed.

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

The v_student_enrollment view joins the students table with the enrollments table, producing a consolidated record that combines student personal information with enrollment financial and temporal data. This view answers: "What are the enrollment details for each student?" For student 392507 (Stephanie Collins), the view reveals an enrollment with registration fee 24.01, monthly tuition 16.20, and an active status. For student id_16 (Upal Saha), the view shows enrollment id_30 with a registration fee of 19.72, monthly tuition of 22.60, and a suspended status. This view is particularly useful for administrative reports that need to display student and enrollment information side by side.

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

The v_student_parent_detail view joins students with the students_parents junction and the parents table, producing a record that pairs each student with their associated parent contact information. This view answers: "Which parent(s) are associated with each student, and what are their contact details?" For student 392507 (Stephanie Collins), the view surfaces parent 1000 with home address distributed-home-60 in city integrated-city-34 and zip code 69434. This view supports communication workflows that require reaching the correct guardian for a specific student.

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

The v_parent_enrollment_detail view joins the parents table with the parents_enrollments junction and the enrollments table, producing a record that pairs each parent with their associated enrollment financial and temporal data. This view answers: "Which enrollments is each parent associated with, and what are the financial terms?" For parent 1000 (Stephanie Collins), the view surfaces enrollment 4447035 with a registration fee of 24.01 and monthly tuition of 16.20, as well as enrollment 4 (b_VB-EC-0) with a registration fee of 16.11 and monthly tuition of 25.80. This view is essential for financial reconciliation and parent-facing billing communications.

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

The v_parent_student view joins the parents table with the students_parents junction and the students table, producing a record that pairs each parent with their associated student personal information. This view answers: "Which students is each parent responsible for, and what are their personal details?" For parent 1000, the view surfaces student 392507 (Stephanie Collins), born 2023-10-18, enrolled at Seasonal Standard with an active status. This view supports guardianship verification and student-specific communications routed through the correct parent.

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

The v_media_release_enrollment view joins the media_releases table with the enrollments table, producing a record that pairs each media release with its associated enrollment financial and temporal data. This view answers: "What enrollment is associated with each media release, and what are the financial terms?" For release BJGopher, the view shows enrollment 4447035 with a registration fee of 24.01 and monthly tuition of 16.20, with the release permitting video, audio, and photography while denying promotional use. This view is useful for compliance audits that need to verify that media permissions are in place for active enrollments.

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

The v_media_release_parent_detail view joins media_releases with the releases_parents junction and the parents table, producing a record that pairs each media release with its associated parent contact information. This view answers: "Which parent signed each media release, and how can they be contacted?" For release BJGopher, the view surfaces the associated parent's contact details, enabling the program to verify consent attribution and reach the signatory if questions arise about the permissions granted. This view is critical for legal compliance and consent management workflows.

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

The v_referral_source_enrollment view joins the referral_sources table with the enrollments table, producing a record that pairs each referral source with its associated enrollment financial and temporal data. This view answers: "Which referral source led to each enrollment, and what are the financial terms?" For referral source 3e9b5c70-8fcd-11eb-924d-9cd76263cbd0 (Internet), the view shows enrollment 4447035 with a registration fee of 24.01 and monthly tuition of 16.20. For referral source 7021001070050 (Texas Capital News), the view surfaces enrollment gd_taxc_2121 with a registration fee of 12.87 and monthly tuition of 19.40. This view enables the program to measure the return on investment for different referral channels and optimize outreach strategies accordingly.

The enrollment management domain demonstrates how relational data structures support complex operational workflows. Five base tables capture the core entities—enrollments, students, parents, media releases, and referral sources—while three junction tables resolve the many-to-many relationships between them. Nine additional junction and linking tables provide comprehensive coverage of the parent-enrollment-student-release relationship graph. The twelve views synthesize these base tables into analytical constructs that answer specific operational questions, from financial reporting to compliance verification to marketing attribution. Together, these tables and views form a coherent data model that supports the full lifecycle of a student's engagement with the program, from initial referral through enrollment, guardianship management, consent tracking, and ongoing communication.