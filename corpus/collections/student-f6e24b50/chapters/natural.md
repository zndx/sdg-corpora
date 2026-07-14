## Enrollment and Family Records in Early Education Administration

Educational institutions managing early childhood programs maintain interconnected records that link children to their guardians, track enrollment logistics, and document how families discovered the program. The data model underlying this domain captures four core entities—students, parents, emergency contacts, and enrollments—along with a lookup table for acquisition sources and three junction tables that resolve the many-to-many relationships between students and parents. Each entity carries its own set of attributes, and the joins between them answer operational questions about which parent is associated with which child, which emergency contact belongs to which guardian, and through which channel a family was recruited.

**Table `students`**

| id | given_name | chinese_name | birth_date | school_name | enrollment_id |
|---|---|---|---|---|---|
| 100 | Dana Nguyen | Adaptive Framework | 2023-10-18 | Seasonal Standard | 1 |
| 101 | Susan Levy | Primary Protocol | 2024-03-02 | Integrated Framework | 2 |
| 102 | Elizabeth Woods | Composite Programme D | 2025-08-13 | Extended Protocol D | 3 |
| 103 | Cheryl Bradley | Compact Standard | 2022-01-24 | Pilot Programme | 4 |

The students table anchors the entire dataset. Each row represents a single child enrolled in the program, identified by a numeric `id` and a `given_name`. The `chinese_name` column stores a transliterated or alternate name, while `birth_date` provides the child's date of birth for age-appropriate grouping. The `school_name` field indicates the campus or program track the child attends, and `enrollment_id` links the student to their specific enrollment record. For instance, student 100, Dana Nguyen, was born on 2023-10-18 and attends the Seasonal Standard campus under enrollment ID 1. Student 103, Cheryl Bradley, born 2022-01-24, is associated with the Pilot Programme track and enrollment ID 4.

**Table `parents`**

| id | given_name | chinese_name | home_phone | cell_phone | email | home_address | city | zip_code | emergency_contact_id |
|---|---|---|---|---|---|---|---|---|---|
| 100 | Dana Nguyen | Adaptive Framework | regional-home-54 | distributed-cell-72 | seasonal-email-11 | distributed-home-60 | integrated-city-34 | 69434 | 100 |
| 101 | Susan Levy | Primary Protocol | legacy-home-55 | baseline-cell-73 | regional-email-12 | baseline-home-61 | seasonal-city-35 | 13589 | 101 |
| 102 | Elizabeth Woods | Composite Programme D | compact-home-56 | pilot-cell-74 | legacy-email-13 | pilot-home-62 | regional-city-36 | 9bb5fec0-8fcc-11eb-924d-9cd76263cbd0 | 102 |
| 103 | Cheryl Bradley | Compact Standard | composite-home-57 | extended-cell-75 | compact-email-14 | extended-home-63 | legacy-city-37 | 1250214 | 103 |

The parents table mirrors the students table in structure, recording guardian information with a `given_name`, `chinese_name`, and contact details including `home_phone`, `cell_phone`, and `email`. The `home_address`, `city`, and `zip_code` columns capture the family's residential location. A critical column here is `emergency_contact_id`, which references the emergency_contacts table to designate which emergency contact is associated with each parent. Parent 100, Dana Nguyen, can be reached at regional-home-54 and seasonal-email-11, resides in integrated-city-34 with zip code 69434, and has emergency contact ID 100. Parent 102, Elizabeth Woods, carries the UUID-style identifier 9bb5fec0-8fcc-11eb-924d-9cd76263cbd0 as their emergency contact reference, illustrating that the system accommodates both numeric and string-based identifiers.

**Table `emergency_contacts`**

| id | contact_name | contact_phone | parent_id |
|---|---|---|---|
| 100 | Kenneth Smith | Joe Tsai | 100 |
| 101 | Michelle Kelley | Stephanie Collins | 101 |
| 102 | Kimberly Myers | Tasha Rodriguez | 102 |
| 103 | Tasha Rodriguez | Walter Pratt | 103 |

Emergency contacts exist as a separate table to allow flexibility in designating alternate contacts independent of the primary parent record. Each row contains a `contact_name`, `contact_phone`, and a `parent_id` that links the contact to the parent who designated them. Contact 100, Kenneth Smith with phone number Joe Tsai, is associated with parent 100. Contact 103, Tasha Rodriguez with phone number Walter Pratt, is linked to parent 103. The separation of this table from the parents table means that a single parent could theoretically designate multiple emergency contacts by adding additional rows with the same `parent_id`.

**Table `enrollments`**

| id | registration_fee | monthly_tuition | late_fee_amount | payment_due_day | late_fee_deadline_day | program_months | consent_given | waiver_signed | enrollment_date | student_id | acquisition_source_id |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 24.01 | 16.20 | 13.49 | 44 | 29 | composite-program-21 | false | false | 2022-05-11 | 100 | 100 |
| 2 | 12.87 | 19.40 | 25.47 | 54 | 34 | primary-program-22 | true | true | 2023-10-22 | 101 | 101 |
| 3 | 19.72 | 22.60 | 0.18 | 64 | 39 | adaptive-program-23 | false | false | 2024-03-06 | 102 | 102 |
| 4 | 16.11 | 25.80 | 9.54 | 74 | 44 | distributed-program-24 | true | true | 2025-08-17 | 103 | 103 |

Enrollment records capture the financial and administrative terms of a child's participation. The `registration_fee`, `monthly_tuition`, and `late_fee_amount` columns define the cost structure, while `payment_due_day` and `late_fee_deadline_day` specify the billing calendar. The `program_months` field describes the program duration or type, and `consent_given` and `waiver_signed` are boolean flags indicating whether required permissions have been obtained. The `enrollment_date` records when the enrollment was initiated, and `student_id` and `acquisition_source_id` link the enrollment to the child and the source through which the family was acquired. Enrollment 1, associated with student 100, carries a registration fee of 24.01, a monthly tuition of 16.20, and a late fee of 13.49. The program is labeled composite-program-21, consent has not been given, and the waiver has not been signed. Enrollment 2, for student 101, shows a lower registration fee of 12.87 but a higher monthly tuition of 19.40, with both consent and waiver confirmed as true.

**Table `acquisition_sources`**

| acquisition_source_id | source_type | other_details | enrollment_id |
|---|---|---|---|
| 100 | Internet | seasonal-other-29 | 1 |
| 101 | Texas Capital News | regional-other-30 | 2 |
| 102 | Parents | legacy-other-31 | 3 |
| 103 | Other | compact-other-32 | 4 |

The acquisition_sources table provides a controlled vocabulary for how families learned about the program. Each row has an `acquisition_source_id`, a `source_type` such as Internet or Parents, an `other_details` field for free-form notes, and an `enrollment_id` that ties the source back to the specific enrollment. Source 100 is classified as Internet with seasonal-other-29 as additional detail, linked to enrollment 1. Source 101, Texas Capital News, carries regional-other-30 as supplementary information and connects to enrollment 2. Source 102, labeled simply Parents, indicates a referral and is associated with enrollment 3.

**Table `students_parents`**

| student_id | parent_id |
|---|---|
| 100 | 100 |
| 100 | 101 |
| 101 | 101 |
| 101 | 102 |
| 102 | 102 |
| 102 | 103 |
| 103 | 103 |
| 103 | 100 |

The students_parents junction table resolves the many-to-many relationship between students and parents. Each row pairs a `student_id` with a `parent_id`, allowing a single student to have multiple parents and a single parent to have multiple students. Student 100 is linked to both parent 100 and parent 101, indicating two guardians for that child. Student 101 is similarly connected to parents 101 and 102. Student 103 has an interesting cross-assignment: it is linked to parent 103 and also to parent 100, meaning parent 100 (Dana Nguyen) is a guardian for two different students across the dataset.

**Table `parents_students`**

| parent_id | student_id |
|---|---|
| 100 | 100 |
| 100 | 101 |
| 101 | 101 |
| 101 | 102 |
| 102 | 102 |
| 102 | 103 |
| 103 | 103 |
| 103 | 100 |

The parents_students table serves as the inverse junction, pairing each `parent_id` with the `student_id` of their child. This table mirrors the relationships in students_parents but from the parent's perspective. Parent 100 is associated with student 100, and parent 101 with student 101. Parent 102 connects to student 102, and parent 103 to student 103. The presence of this table alongside students_parents suggests the system supports bidirectional queries, allowing lookups from either side of the relationship without requiring a join reversal.

**Table `enrollments_parents`**

| enrollment_id | parent_id |
|---|---|
| 1 | 100 |
| 1 | 101 |
| 2 | 101 |
| 2 | 102 |
| 3 | 102 |
| 3 | 103 |
| 4 | 103 |
| 4 | 100 |

The enrollments_parents table links enrollment records to parents, enabling queries about which parent is responsible for which enrollment. This relationship is essential for billing, consent tracking, and communication workflows. While the specific row values are not enumerated here, the table's existence confirms that enrollments are associated with parents independently of the student-enrollment link, supporting scenarios where a parent manages multiple children's enrollments or where billing responsibility differs from the student record.

### Detail Views for Student-Parent Relationships

The view v_student_parent_detail combines student information with their associated parent records, answering the question of which guardians belong to which child. This join pulls from students, students_parents, and parents to produce a unified row per student-parent pair. For student 100, Dana Nguyen, the view would produce two rows—one for parent 100 (Dana Nguyen) and one for parent 101 (Susan Levy)—reflecting the two guardians in the students_parents table. The view preserves the student's birth_date, school_name, and enrollment_id alongside the parent's contact details and address, making it suitable for generating family contact sheets or consent forms.

The view v_parent_student_detail performs the inverse operation, starting from the parent record and joining to their associated students. For parent 100, this view would return rows for student 100 and student 103, since parent 100 is linked to both students in the junction table. The parent's home_address, city, and emergency_contact_id travel with each row, enabling the institution to see all children under a single guardian's care along with that guardian's contact and emergency information in one consolidated output.

### Emergency Contact Views

The view v_parent_emergency_contact joins the parents table to emergency_contacts on the emergency_contact_id column, producing a single row per parent with their designated emergency contact's name and phone number. Parent 100, Dana Nguyen, would appear with emergency contact Kenneth Smith and phone number Joe Tsai. Parent 101, Susan Levy, would show Michelle Kelley as the contact with phone number Stephanie Collins. This view is particularly useful for pre-populating emergency notification lists or verifying that every parent record has an associated emergency contact.

The view v_emergency_contact_parent reverses the perspective, starting from the emergency contact and joining to the parent who designated them. Contact 100, Kenneth Smith, would be linked to parent 100, Dana Nguyen. Contact 103, Tasha Rodriguez, would be linked to parent 103, Cheryl Bradley. This orientation supports workflows where the institution needs to reach out to a contact and requires the parent's full details—address, phone, email—in the same result set.

### Enrollment Detail Views

The view v_enrollment_student joins enrollments to students, producing a row that combines the financial and administrative terms of an enrollment with the child's personal information. Enrollment 1, with a registration fee of 24.01 and monthly tuition of 16.20, would appear alongside student 100, Dana Nguyen, born 2023-10-18, attending the Seasonal Standard campus. Enrollment 4, carrying a monthly tuition of 25.80 and program_months of distributed-program-24, would be paired with student 103, Cheryl Bradley, who is associated with the Pilot Programme track. This view is the foundation for billing statements and enrollment confirmations.

The view v_enrollment_parent_detail extends the enrollment-student join by also pulling in parent information through the junction tables. For enrollment 1, the view would produce rows for both parent 100 and parent 101, since student 100 has two parents. Each row would include the enrollment's payment terms alongside the parent's contact details, enabling the institution to send billing notifications to all relevant guardians. Enrollment 3, with a late_fee_amount of just 0.18 and consent_given set to false, would appear with parents 102 and 103, highlighting that despite the low late fee, consent has not yet been obtained for that enrollment.

### Acquisition Source Views

The view v_enrollment_acquisition_source joins enrollments to acquisition_sources, revealing how each family was recruited. Enrollment 1, associated with student 100, traces back to acquisition source 100, classified as Internet with seasonal-other-29 as additional detail. Enrollment 2, for student 101, came through Texas Capital News (source 101) with regional-other-30 noted. This view supports marketing analytics by allowing the institution to count enrollments by source type and evaluate the return on investment for different acquisition channels.

The view v_acquisition_source_enrollment inverts the relationship, starting from the acquisition source and listing all enrollments that originated from it. Source 100, Internet, would show enrollment 1 with its registration fee of 24.01 and monthly tuition of 16.20. Source 102, Parents, would display enrollment 3 with its registration fee of 19.72 and a program duration of adaptive-program-23. This orientation is useful for campaign-level reporting, where the institution wants to see the full financial profile of all enrollments generated by a particular source.

### Synthesis

The data model for early education enrollment management is built on a small set of well-defined tables that capture students, parents, emergency contacts, enrollments, and acquisition sources, connected through junction tables that resolve many-to-many relationships. The base tables store the raw records—student 100 Dana Nguyen with birth date 2023-10-18, parent 101 Susan Levy with home phone legacy-home-55, enrollment 2 with monthly tuition 19.40 and consent confirmed as true. The views layer on top of these tables, joining the records to answer specific operational questions: which parent is responsible for which child, which emergency contact belongs to which guardian, through which channel a family was acquired, and what the financial terms of each enrollment are. Together, the tables and views form a coherent record system that supports billing, communication, consent tracking, and marketing analysis for an early education program.

## Data appendix

**View `v_student_parent_detail`**

```sql
CREATE VIEW v_student_parent_detail AS
SELECT a.id, a.given_name, a.chinese_name, b.id AS parent_id, b.given_name AS parent_given_name, b.chinese_name AS parent_chinese_name
FROM students a
  JOIN students_parents j ON j.student_id = a.id
  JOIN parents b ON b.id = j.parent_id;
```

| id | given_name | chinese_name | parent_id | parent_given_name | parent_chinese_name |
|---|---|---|---|---|---|
| 100 | Dana Nguyen | Adaptive Framework | 100 | Dana Nguyen | Adaptive Framework |
| 100 | Dana Nguyen | Adaptive Framework | 101 | Susan Levy | Primary Protocol |
| 101 | Susan Levy | Primary Protocol | 101 | Susan Levy | Primary Protocol |
| 101 | Susan Levy | Primary Protocol | 102 | Elizabeth Woods | Composite Programme D |
| 102 | Elizabeth Woods | Composite Programme D | 102 | Elizabeth Woods | Composite Programme D |
| 102 | Elizabeth Woods | Composite Programme D | 103 | Cheryl Bradley | Compact Standard |
| 103 | Cheryl Bradley | Compact Standard | 103 | Cheryl Bradley | Compact Standard |
| 103 | Cheryl Bradley | Compact Standard | 100 | Dana Nguyen | Adaptive Framework |

**View `v_student_enrollment`**

```sql
CREATE VIEW v_student_enrollment AS
SELECT a.id, a.given_name, a.chinese_name, a.birth_date, b.id AS enrollment_id, b.registration_fee AS enrollment_registration_fee, b.monthly_tuition AS enrollment_monthly_tuition
FROM students a JOIN enrollments b ON a.enrollment_id = b.id;
```

| id | given_name | chinese_name | birth_date | enrollment_id | enrollment_registration_fee | enrollment_monthly_tuition |
|---|---|---|---|---|---|---|
| 100 | Dana Nguyen | Adaptive Framework | 2023-10-18 | 1 | 24.01 | 16.20 |
| 101 | Susan Levy | Primary Protocol | 2024-03-02 | 2 | 12.87 | 19.40 |
| 102 | Elizabeth Woods | Composite Programme D | 2025-08-13 | 3 | 19.72 | 22.60 |
| 103 | Cheryl Bradley | Compact Standard | 2022-01-24 | 4 | 16.11 | 25.80 |

**View `v_parent_student_detail`**

```sql
CREATE VIEW v_parent_student_detail AS
SELECT a.id, a.given_name, a.chinese_name, b.id AS student_id, b.given_name AS student_given_name, b.chinese_name AS student_chinese_name
FROM parents a
  JOIN parents_students j ON j.parent_id = a.id
  JOIN students b ON b.id = j.student_id;
```

| id | given_name | chinese_name | student_id | student_given_name | student_chinese_name |
|---|---|---|---|---|---|
| 100 | Dana Nguyen | Adaptive Framework | 100 | Dana Nguyen | Adaptive Framework |
| 100 | Dana Nguyen | Adaptive Framework | 101 | Susan Levy | Primary Protocol |
| 101 | Susan Levy | Primary Protocol | 101 | Susan Levy | Primary Protocol |
| 101 | Susan Levy | Primary Protocol | 102 | Elizabeth Woods | Composite Programme D |
| 102 | Elizabeth Woods | Composite Programme D | 102 | Elizabeth Woods | Composite Programme D |
| 102 | Elizabeth Woods | Composite Programme D | 103 | Cheryl Bradley | Compact Standard |
| 103 | Cheryl Bradley | Compact Standard | 103 | Cheryl Bradley | Compact Standard |
| 103 | Cheryl Bradley | Compact Standard | 100 | Dana Nguyen | Adaptive Framework |

**View `v_parent_emergency_contact`**

```sql
CREATE VIEW v_parent_emergency_contact AS
SELECT a.id, a.given_name, a.chinese_name, a.home_phone, b.id AS contact_id, b.contact_name AS contact_contact_name, b.contact_phone AS contact_contact_phone
FROM parents a JOIN emergency_contacts b ON a.emergency_contact_id = b.id;
```

| id | given_name | chinese_name | home_phone | contact_id | contact_contact_name | contact_contact_phone |
|---|---|---|---|---|---|---|
| 100 | Dana Nguyen | Adaptive Framework | regional-home-54 | 100 | Kenneth Smith | Joe Tsai |
| 101 | Susan Levy | Primary Protocol | legacy-home-55 | 101 | Michelle Kelley | Stephanie Collins |
| 102 | Elizabeth Woods | Composite Programme D | compact-home-56 | 102 | Kimberly Myers | Tasha Rodriguez |
| 103 | Cheryl Bradley | Compact Standard | composite-home-57 | 103 | Tasha Rodriguez | Walter Pratt |

**View `v_emergency_contact_parent`**

```sql
CREATE VIEW v_emergency_contact_parent AS
SELECT a.id, a.contact_name, a.contact_phone, b.id AS parent_id, b.given_name AS parent_given_name, b.chinese_name AS parent_chinese_name
FROM emergency_contacts a JOIN parents b ON a.parent_id = b.id;
```

| id | contact_name | contact_phone | parent_id | parent_given_name | parent_chinese_name |
|---|---|---|---|---|---|
| 100 | Kenneth Smith | Joe Tsai | 100 | Dana Nguyen | Adaptive Framework |
| 101 | Michelle Kelley | Stephanie Collins | 101 | Susan Levy | Primary Protocol |
| 102 | Kimberly Myers | Tasha Rodriguez | 102 | Elizabeth Woods | Composite Programme D |
| 103 | Tasha Rodriguez | Walter Pratt | 103 | Cheryl Bradley | Compact Standard |

**View `v_enrollment_student`**

```sql
CREATE VIEW v_enrollment_student AS
SELECT a.id, a.registration_fee, a.monthly_tuition, a.late_fee_amount, b.id AS student_id, b.given_name AS student_given_name, b.chinese_name AS student_chinese_name
FROM enrollments a JOIN students b ON a.student_id = b.id;
```

| id | registration_fee | monthly_tuition | late_fee_amount | student_id | student_given_name | student_chinese_name |
|---|---|---|---|---|---|---|
| 1 | 24.01 | 16.20 | 13.49 | 100 | Dana Nguyen | Adaptive Framework |
| 2 | 12.87 | 19.40 | 25.47 | 101 | Susan Levy | Primary Protocol |
| 3 | 19.72 | 22.60 | 0.18 | 102 | Elizabeth Woods | Composite Programme D |
| 4 | 16.11 | 25.80 | 9.54 | 103 | Cheryl Bradley | Compact Standard |

**View `v_enrollment_parent_detail`**

```sql
CREATE VIEW v_enrollment_parent_detail AS
SELECT a.id, a.registration_fee, a.monthly_tuition, b.id AS parent_id, b.given_name AS parent_given_name, b.chinese_name AS parent_chinese_name
FROM enrollments a
  JOIN enrollments_parents j ON j.enrollment_id = a.id
  JOIN parents b ON b.id = j.parent_id;
```

| id | registration_fee | monthly_tuition | parent_id | parent_given_name | parent_chinese_name |
|---|---|---|---|---|---|
| 1 | 24.01 | 16.20 | 100 | Dana Nguyen | Adaptive Framework |
| 1 | 24.01 | 16.20 | 101 | Susan Levy | Primary Protocol |
| 2 | 12.87 | 19.40 | 101 | Susan Levy | Primary Protocol |
| 2 | 12.87 | 19.40 | 102 | Elizabeth Woods | Composite Programme D |
| 3 | 19.72 | 22.60 | 102 | Elizabeth Woods | Composite Programme D |
| 3 | 19.72 | 22.60 | 103 | Cheryl Bradley | Compact Standard |
| 4 | 16.11 | 25.80 | 103 | Cheryl Bradley | Compact Standard |
| 4 | 16.11 | 25.80 | 100 | Dana Nguyen | Adaptive Framework |

**View `v_enrollment_acquisition_source`**

```sql
CREATE VIEW v_enrollment_acquisition_source AS
SELECT a.id, a.registration_fee, a.monthly_tuition, a.late_fee_amount, b.acquisition_source_id AS source_acquisition_source_id, b.source_type AS source_source_type, b.other_details AS source_other_details
FROM enrollments a JOIN acquisition_sources b ON a.acquisition_source_id = b.acquisition_source_id;
```

| id | registration_fee | monthly_tuition | late_fee_amount | source_acquisition_source_id | source_source_type | source_other_details |
|---|---|---|---|---|---|---|
| 1 | 24.01 | 16.20 | 13.49 | 100 | Internet | seasonal-other-29 |
| 2 | 12.87 | 19.40 | 25.47 | 101 | Texas Capital News | regional-other-30 |
| 3 | 19.72 | 22.60 | 0.18 | 102 | Parents | legacy-other-31 |
| 4 | 16.11 | 25.80 | 9.54 | 103 | Other | compact-other-32 |

**View `v_acquisition_source_enrollment`**

```sql
CREATE VIEW v_acquisition_source_enrollment AS
SELECT a.acquisition_source_id, a.source_type, a.other_details, b.id AS enrollment_id, b.registration_fee AS enrollment_registration_fee, b.monthly_tuition AS enrollment_monthly_tuition
FROM acquisition_sources a JOIN enrollments b ON a.enrollment_id = b.id;
```

| acquisition_source_id | source_type | other_details | enrollment_id | enrollment_registration_fee | enrollment_monthly_tuition |
|---|---|---|---|---|---|
| 100 | Internet | seasonal-other-29 | 1 | 24.01 | 16.20 |
| 101 | Texas Capital News | regional-other-30 | 2 | 12.87 | 19.40 |
| 102 | Parents | legacy-other-31 | 3 | 19.72 | 22.60 |
| 103 | Other | compact-other-32 | 4 | 16.11 | 25.80 |
