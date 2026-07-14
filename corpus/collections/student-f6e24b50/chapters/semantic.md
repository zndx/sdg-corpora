# Chapter 7 — Schema Design for a Student Enrollment and Parent-Guardian Registry

## 7.1 Domain Scenario

The domain under consideration is a student enrollment and parent-guardian registry operated by an educational institution. The business problem is straightforward yet rich in relational structure: the school must track each enrolled student, associate one or more parents or guardians with that student, record the financial and administrative details of the enrollment itself, classify how each enrollment was acquired, and maintain emergency-contact information for every parent on file. Because a single student may have multiple parents and a single parent may be associated with multiple students, the data model must support many-to-many relationships. The normalized schema resolves these relationships through junction tables, and a set of materialized views reconstructs the domain facts that administrators query in their daily work.

## 7.2 Core Entity Tables

### 7.2.1 The Student Entity

The `students` table is the primary entity for the registry. Each row represents a single enrolled child and carries a natural-key surrogate `id`, a `given_name`, a `chinese_name`, a `birth_date`, the `school_name` the student attends, and a foreign key `enrollment_id` that links the student to their enrollment record.

**Table `students`**

| id | given_name | chinese_name | birth_date | school_name | enrollment_id |
|---|---|---|---|---|---|
| 100 | Dana Nguyen | Adaptive Framework | 2023-10-18 | Seasonal Standard | 1 |
| 101 | Susan Levy | Primary Protocol | 2024-03-02 | Integrated Framework | 2 |
| 102 | Elizabeth Woods | Composite Programme D | 2025-08-13 | Extended Protocol D | 3 |
| 103 | Cheryl Bradley | Compact Standard | 2022-01-24 | Pilot Programme | 4 |

The `id` column serves as the primary key. The `given_name` column holds values such as `Dana Nguyen`, `Susan Levy`, `Elizabeth Woods`, and `Cheryl Bradley`. The `chinese_name` column contains values like `Adaptive Framework` and `Primary Protocol`, which in this fictional dataset represent Chinese-language identifiers. The `birth_date` column stores dates in ISO format, for example `2023-10-18` for student 100. The `school_name` column carries values such as `Seasonal Standard` and `Integrated Framework`. Finally, the `enrollment_id` column (values `1` through `4`) is a foreign key referencing the `enrollments` table, establishing a one-to-one link from student to enrollment.

### 7.2.2 The Parent Entity

The `parents` table stores contact and demographic information for each parent or guardian. Its columns include `id` (primary key), `given_name`, `chinese_name`, `home_phone`, `cell_phone`, `email`, `home_address`, `city`, `zip_code`, and `emergency_contact_id` (a foreign key to `emergency_contacts`).

**Table `parents`**

| id | given_name | chinese_name | home_phone | cell_phone | email | home_address | city | zip_code | emergency_contact_id |
|---|---|---|---|---|---|---|---|---|---|
| 100 | Dana Nguyen | Adaptive Framework | regional-home-54 | distributed-cell-72 | seasonal-email-11 | distributed-home-60 | integrated-city-34 | 69434 | 100 |
| 101 | Susan Levy | Primary Protocol | legacy-home-55 | baseline-cell-73 | regional-email-12 | baseline-home-61 | seasonal-city-35 | 13589 | 101 |
| 102 | Elizabeth Woods | Composite Programme D | compact-home-56 | pilot-cell-74 | legacy-email-13 | pilot-home-62 | regional-city-36 | 9bb5fec0-8fcc-11eb-924d-9cd76263cbd0 | 102 |
| 103 | Cheryl Bradley | Compact Standard | composite-home-57 | extended-cell-75 | compact-email-14 | extended-home-63 | legacy-city-37 | 1250214 | 103 |

Each parent row carries a rich set of contact attributes. For instance, parent 100 (`Dana Nguyen`) has `home_phone` value `regional-home-54`, `cell_phone` value `distributed-cell-72`, and `email` value `seasonal-email-11`. The `home_address` column stores values like `distributed-home-60`, while `city` holds values such as `integrated-city-34` and `zip_code` stores values like `69434`. The `emergency_contact_id` column references the `emergency_contacts` table, linking each parent to their designated emergency contact.

### 7.2.3 The Emergency Contact Entity

The `emergency_contacts` table holds emergency-contact records, each associated with exactly one parent. Its columns are `id` (primary key), `contact_name`, `contact_phone`, and `parent_id` (foreign key to `parents`).

**Table `emergency_contacts`**

| id | contact_name | contact_phone | parent_id |
|---|---|---|---|
| 100 | Kenneth Smith | Joe Tsai | 100 |
| 101 | Michelle Kelley | Stephanie Collins | 101 |
| 102 | Kimberly Myers | Tasha Rodriguez | 102 |
| 103 | Tasha Rodriguez | Walter Pratt | 103 |

The `contact_name` column stores names such as `Kenneth Smith` and `Michelle Kelley`, while `contact_phone` stores values like `Joe Tsai` and `Stephanie Collins`. The `parent_id` column creates a one-to-many relationship: one parent may have one emergency contact, and the foreign key enforces referential integrity back to the `parents` table.

### 7.2.4 The Enrollment Entity

The `enrollments` table captures the financial and administrative terms of a student's enrollment. Its columns are `id` (primary key), `registration_fee`, `monthly_tuition`, `late_fee_amount`, `payment_due_day`, `late_fee_deadline_day`, `program_months`, `consent_given`, `waiver_signed`, `enrollment_date`, `student_id` (foreign key to `students`), and `acquisition_source_id` (foreign key to `acquisition_sources`).

**Table `enrollments`**

| id | registration_fee | monthly_tuition | late_fee_amount | payment_due_day | late_fee_deadline_day | program_months | consent_given | waiver_signed | enrollment_date | student_id | acquisition_source_id |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 24.01 | 16.20 | 13.49 | 44 | 29 | composite-program-21 | false | false | 2022-05-11 | 100 | 100 |
| 2 | 12.87 | 19.40 | 25.47 | 54 | 34 | primary-program-22 | true | true | 2023-10-22 | 101 | 101 |
| 3 | 19.72 | 22.60 | 0.18 | 64 | 39 | adaptive-program-23 | false | false | 2024-03-06 | 102 | 102 |
| 4 | 16.11 | 25.80 | 9.54 | 74 | 44 | distributed-program-24 | true | true | 2025-08-17 | 103 | 103 |

The monetary columns store decimal values: `registration_fee` ranges from `12.87` to `24.01`, `monthly_tuition` from `16.20` to `25.80`, and `late_fee_amount` from `0.18` to `25.47`. The integer columns `payment_due_day` and `late_fee_deadline_day` hold values such as `44` and `29`. The `program_months` column stores string identifiers like `composite-program-21` and `primary-program-22`. Boolean columns `consent_given` and `waiver_signed` indicate whether the parent has provided consent and signed a waiver. The `enrollment_date` column stores dates like `2022-05-11`. The `student_id` column links the enrollment to a specific student, and `acquisition_source_id` links to the `acquisition_sources` table.

### 7.2.5 The Acquisition Source Entity

The `acquisition_sources` table classifies how each enrollment was acquired. Its columns are `acquisition_source_id` (primary key), `source_type`, `other_details`, and `enrollment_id` (foreign key to `enrollments`).

**Table `acquisition_sources`**

| acquisition_source_id | source_type | other_details | enrollment_id |
|---|---|---|---|
| 100 | Internet | seasonal-other-29 | 1 |
| 101 | Texas Capital News | regional-other-30 | 2 |
| 102 | Parents | legacy-other-31 | 3 |
| 103 | Other | compact-other-32 | 4 |

The `source_type` column holds categorical values such as `Internet`, `Texas Capital News`, `Parents`, and `Other`. The `other_details` column stores supplementary strings like `seasonal-other-29` and `regional-other-30`. The `enrollment_id` column creates a one-to-one link back to the `enrollments` table.

## 7.3 Resolving Many-to-Many Relationships with Junction Tables

The domain requires three many-to-many relationships, each resolved by a junction table.

### 7.3.1 Student–Parent Relationships

The `students_parents` junction table resolves the many-to-many relationship between students and parents. Its columns are `student_id` and `parent_id`, both foreign keys referencing their respective entity tables.

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

The data reveals that student 100 (`Dana Nguyen`) is associated with two parents (100 and 101), student 101 (`Susan Levy`) with two parents (101 and 102), student 102 (`Elizabeth Woods`) with two parents (102 and 103), and student 103 (`Cheryl Bradley`) with two parents (103 and 100). This bidirectional association means any parent can be linked to multiple students and vice versa.

The `parents_students` junction table provides the same relationship from the parent's perspective, with columns `parent_id` and `student_id`.

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

This table mirrors the `students_parents` data but with column order reversed, supporting queries that start from the parent entity and navigate to associated students.

### 7.3.2 Enrollment–Parent Relationships

The `enrollments_parents` junction table resolves the many-to-many relationship between enrollments and parents.

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

This table enables the system to track which parents are financially responsible for which enrollments, independent of the student-parent relationship.

## 7.4 Materialized Views: Reconstructing Domain Facts

The normalized schema requires joins to answer common administrative questions. The following views materialize these joins as virtual tables.

### 7.4.1 Student–Parent Detail View

The `v_student_parent_detail` view joins `students` with `students_parents` and `parents` to produce a flat record for each student–parent pairing.

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

This view answers the question: "Which parents are associated with which students, and what are their full contact details?" Reading a concrete row, the view might return student `Dana Nguyen` (id 100) alongside parent `Dana Nguyen` (id 100) with the parent's `home_phone` value `regional-home-54` and `email` value `seasonal-email-11`. A second row from the same view could show student `Dana Nguyen` (id 100) paired with parent `Susan Levy` (id 101), carrying that parent's `cell_phone` value `baseline-cell-73`. This view is the primary interface for administrators who need a complete picture of a student's family contacts.

### 7.4.2 Student–Enrollment Detail View

The `v_student_enrollment` view joins `students` with `enrollments` on the `enrollment_id` / `id` relationship.

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

This view answers: "What are the financial and administrative terms of a student's enrollment?" A row might show student `Susan Levy` (id 101) with `registration_fee` of `12.87`, `monthly_tuition` of `19.40`, `consent_given` as `true`, and `enrollment_date` of `2023-10-22`. Another row could show student `Elizabeth Woods` (id 102) with `monthly_tuition` of `22.60` and `waiver_signed` as `false`. This view is essential for billing and compliance queries.

### 7.4.3 Parent–Student Detail View

The `v_parent_student_detail` view joins `parents` with `parents_students` and `students` to produce a flat record for each parent–student pairing.

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

This view answers the inverse question of `v_student_parent_detail`: "Which students is a given parent associated with, and what are their enrollment and demographic details?" A row might return parent `Dana Nguyen` (id 100) with student `Dana Nguyen` (id 100) whose `birth_date` is `2023-10-18` and `school_name` is `Seasonal Standard`. Another row could show parent `Susan Levy` (id 101) with student `Susan Levy` (id 101) whose `chinese_name` is `Primary Protocol`. This view supports parent-facing portals and parent-initiated queries.

### 7.4.4 Parent–Emergency Contact View

The `v_parent_emergency_contact` view joins `parents` with `emergency_contacts` on the `emergency_contact_id` / `id` relationship.

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

This view answers: "Who is the emergency contact for each parent?" A row might show parent `Dana Nguyen` (id 100) with emergency contact name `Kenneth Smith` and contact phone `Joe Tsai`. Another row could show parent `Michelle Kelley` (id 101) with emergency contact `Stephanie Collins`. This view is critical for safety and emergency-response workflows.

### 7.4.5 Emergency Contact–Parent View

The `v_emergency_contact_parent` view joins `emergency_contacts` with `parents` to present the relationship from the emergency contact's perspective.

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

This view answers: "Which parent does this emergency contact belong to, and what are that parent's contact details?" A row might return emergency contact `Kenneth Smith` (id 100) alongside parent `Dana Nguyen` (id 100) with `home_phone` value `regional-home-54` and `city` value `integrated-city-34`. This view supports scenarios where an emergency contact needs to be reached and the system must display the associated parent's information.

### 7.4.6 Enrollment–Student View

The `v_enrollment_student` view joins `enrollments` with `students` on the `student_id` / `id` relationship.

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

This view answers: "Which student is associated with each enrollment, and what are the enrollment's financial terms?" A row might show enrollment with `registration_fee` of `24.01` and `monthly_tuition` of `16.20` alongside student `Dana Nguyen` (id 100) whose `school_name` is `Seasonal Standard`. Another row could show enrollment with `late_fee_amount` of `25.47` and `program_months` of `primary-program-22` alongside student `Susan Levy` (id 101) whose `birth_date` is `2024-03-02`. This view is the primary interface for enrollment administration.

### 7.4.7 Enrollment–Parent Detail View

The `v_enrollment_parent_detail` view joins `enrollments` with `enrollments_parents` and `parents` to produce a flat record linking enrollment terms to the responsible parent.

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

This view answers: "Which parent is financially responsible for each enrollment, and what are the enrollment's financial and administrative terms?" A row might return enrollment with `registration_fee` of `19.72` and `consent_given` as `false` alongside parent `Elizabeth Woods` (id 102) with `email` value `legacy-email-13` and `city` value `regional-city-36`. Another row could show enrollment with `monthly_tuition` of `25.80` and `waiver_signed` as `true` alongside parent `Cheryl Bradley` (id 103) with `home_address` value `extended-home-63`. This view is essential for billing notifications and parent communication.

### 7.4.8 Enrollment–Acquisition Source View

The `v_enrollment_acquisition_source` view joins `enrollments` with `acquisition_sources` on the `acquisition_source_id` / `acquisition_source_id` relationship.

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

This view answers: "How was each enrollment acquired, and what are the enrollment's financial terms?" A row might show enrollment with `enrollment_date` of `2022-05-11` and `registration_fee` of `24.01` alongside acquisition source `Internet` with `other_details` of `seasonal-other-29`. Another row could show enrollment with `monthly_tuition` of `19.40` and `late_fee_amount` of `25.47` alongside acquisition source `Texas Capital News` with `other_details` of `regional-other-30`. This view supports marketing analytics and acquisition-cost tracking.

### 7.4.9 Acquisition Source–Enrollment View

The `v_acquisition_source_enrollment` view joins `acquisition_sources` with `enrollments` to present the relationship from the acquisition source's perspective.

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

This view answers: "Which enrollments were acquired through each source, and what are those enrollments' financial terms?" A row might return acquisition source `Parents` (id 102) with `source_type` `Parents` alongside enrollment with `enrollment_date` of `2024-03-06` and `monthly_tuition` of `22.60`. Another row could show acquisition source `Other` (id 103) with `other_details` of `compact-other-32` alongside enrollment with `registration_fee` of `16.11` and `consent_given` as `true`. This view supports reverse queries where the marketing team starts from a source and enumerates its resulting enrollments.

## 7.5 Synthesis

The schema models five core entities — `students`, `parents`, `emergency_contacts`, `enrollments`, and `acquisition_sources` — connected through foreign keys and three junction tables (`students_parents`, `parents_students`, `enrollments_parents`) that resolve many-to-many relationships. The normalization eliminates redundancy: parent contact details are stored once in `parents`, student demographics once in `students`, and enrollment financial terms once in `enrollments`. The nine materialized views (`v_student_parent_detail`, `v_student_enrollment`, `v_parent_student_detail`, `v_parent_emergency_contact`, `v_emergency_contact_parent`, `v_enrollment_student`, `v_enrollment_parent_detail`, `v_enrollment_acquisition_source`, `v_acquisition_source_enrollment`) reconstruct the domain facts that administrators need by joining the normalized tables. Each view answers a specific question — from "which parents are associated with which students" to "how was each enrollment acquired" — and concrete rows such as student `Dana Nguyen` (id 100) with parent `Dana Nguyen` (id 100) and enrollment `registration_fee` of `24.01` demonstrate how the joins materialize real business information from the underlying relational structure.