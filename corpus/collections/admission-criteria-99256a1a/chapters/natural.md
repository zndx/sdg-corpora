## Admission Criteria Management in Academic Program Governance

Higher education institutions maintain rigorous frameworks for evaluating prospective students, and at the heart of these frameworks lies a structured system of admission criteria. Each criterion serves as a gatekeeping mechanism, specifying the academic standards, examination requirements, experiential benchmarks, and prerequisite coursework that applicants must satisfy. The records in this system are organized around six core entities: admission criteria themselves, the academic programs they serve, the prerequisite courses that prepare applicants, the standardized examinations used for assessment, the experiential requirements that demonstrate practical competence, and the departments that administer and govern the entire process.

**Table `AdmissionCriteria`**

| id | criteriaId | effectiveDate | minimumGPA | status | description | programId | examId | requirementId | createdAt | updatedAt |
|---|---|---|---|---|---|---|---|---|---|---|
| 100 | 3743997 | 2023-02-14 | 17.20 | proposed | Extended Survey | 1 | 1 | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 101 | 46d4e72c-8fcc-11eb-924d-9cd76263cbd0 | 2024-07-25 | 20.40 | approved | Pilot Corridor A | 2 | 2 | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 102 | 3717614 | 2025-12-09 | 23.60 | implemented | Baseline Series | 3 | 3 | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 103 | 6564392 | 2022-05-20 | 26.80 | withdrawn | Distributed Assessment | 4 | 4 | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

An admission criterion functions as the central organizing record. Each entry carries a unique identifier, an effective date that determines when the requirement takes hold, and a minimum GPA threshold that applicants must meet. The status field tracks the lifecycle stage of the criterion—whether it is proposed, approved, implemented, or withdrawn. For instance, criterion 3743997, titled "Extended Survey," became effective on 2023-02-14 with a minimum GPA of 17.20 and currently holds proposed status. In contrast, criterion 3717614, "Baseline Series," took effect on 2025-12-09 with a minimum GPA of 23.60 and has progressed to implemented status. The system also records creation and update timestamps, enabling full auditability of when requirements were established and last modified.

**Table `AcademicProgram`**

| programId | programName | degreeLevel | departmentId | status | totalCreditsRequired | criteriaId | offeredByDepartmentId |
|---|---|---|---|---|---|---|---|
| 1 | Extended Review | A.A.S. | 2087755 | active | 2 | 100 | 2087755 |
| 2 | Pilot Initiative A | B.S. | 790483 | proposed | 5 | 101 | 790483 |
| 3 | Baseline Model | M.S. | 505978 | closed | 2 | 102 | 505978 |
| 4 | Distributed Cluster | Ph.D. | id_6 | suspended | 20 | 103 | id_6 |

Academic programs represent the degree-granting offerings that adoption of these criteria affects. Each program specifies a name, a degree level ranging from A.A.S. through Ph.D., and the department responsible for its administration. The total credits required for completion vary significantly: the "Extended Review" A.A.S. program requires only 2 credits, while the "Distributed Cluster" Ph.D. program demands 20. Programs also carry their own status designations—active, proposed, closed, or suspended—and each is linked to a specific admission criterion through the criteriaId field. The "Pilot Initiative A" B.S. program, for example, is currently in proposed status and is governed by criterion 101.

**Table `PrerequisiteCourse`**

| id | courseCode | courseTitle | credits | departmentId | status | criteriaId | offeredByDepartmentId |
|---|---|---|---|---|---|---|---|
| 1000 | 10238263 | Baseline Series D | 28 | 2087755 | active | 100 | 2087755 |
| 1001 | 4463667 | Distributed Assessment | 33 | 790483 | inactive | 101 | 790483 |
| 1002 | 24077793 | Adaptive Survey | 38 | 505978 | deprecated | 102 | 505978 |
| 1003 | 1204-0009-L | Primary Corridor A | 43 | id_6 | active | 103 | id_6 |

Prerequisite courses establish the academic foundation that applicants must complete before enrollment. Each course carries a code, a title, a credit value, and a status indicating whether it is currently active, inactive, or deprecated. The "Baseline Series D" course (code 10238263) carries 28 credits and remains active, while "Adaptive Survey" (code 24077793), worth 38 credits, has been deprecated. Courses are associated with admission criteria and offered by specific departments, creating a clear chain of academic accountability.

**Table `StandardizedExam`**

| id | examCode | examName | status | administeredBy | lastUsedDate | criteriaId |
|---|---|---|---|---|---|---|
| 1 | 3001009030010 | Primary Programme A | active | legacy-administ-49 | 2023-06-12 | 100 |
| 2 | ae409270-8fcd-11eb-924d-9cd76263cbd0 | Composite Standard | discontinued | compact-administ-50 | 2024-11-23 | 101 |
| 3 | 1996923 | Compact Framework | proposed | composite-administ-51 | 2025-04-07 | 102 |
| 4 | 9125639 | Legacy Protocol D | active | primary-administ-52 | 2022-09-18 | 103 |

Standardized examinations provide a uniform assessment mechanism across applicant pools. Each exam record includes a code, a descriptive name, a status indicating whether the exam is active, discontinued, or proposed, and the administrator responsible for its delivery. The "Primary Programme A" (code 3001009030010) remains active and was last administered on 2023-06-12 under the legacy-administ-49 administrator. Meanwhile, the "Composite Standard" (code ae409270-8fcd-11eb-924d-9cd76263cbd0) has been discontinued, with its last use recorded on 2024-11-23.

**Table `ExperientialRequirement`**

| id | requirementId | description | minimumHours | verificationMethod | status | criteriaId |
|---|---|---|---|---|---|---|
| 1 | 778568 | Extended Survey | 44 | letter_of_recommendation | active | 100 |
| 2 | lu_tax_code_template_b_VB-EC-0 | Pilot Corridor A | 49 | supervisor_signature | inactive | 101 |
| 3 | 99901 | Baseline Series | 54 | logbook | active | 102 |
| 4 | 5917277 | Distributed Assessment | 59 | letter_of_recommendation | inactive | 103 |

Experiential requirements capture the practical or professional experience that applicants must demonstrate. Each requirement specifies a minimum number of hours, a verification method such as letter of recommendation, supervisor signature, or logbook, and a status. The "Extended Survey" requirement demands 44 hours verified by letter of recommendation and is currently active. The "Pilot Corridor A" requirement, by contrast, requires 49 hours verified by supervisor signature but is marked inactive.

**Table `Department`**

| departmentId | departmentName | collegeId | chairpersonName | status | criteriaId |
|---|---|---|---|---|---|
| 2087755 | Baseline Framework D | 575206 | Jennifer Summers | active | 100 |
| 790483 | Distributed Protocol | Takings | Michael Oconnell | inactive | 101 |
| 505978 | Adaptive Programme | 10449517 | Sean Green | active | 102 |
| id_6 | Primary Standard A | 10449524 | Kimberly Myers | inactive | 103 |

Departments serve as the administrative and organizational backbone of the entire system. Each department has a name, an associated college identifier, a designated chairperson, and a status. The "Baseline Framework D" department, chaired by Jennifer Summers, is active and linked to college 575206. The "Distributed Protocol" department, under chairperson Michael Oconnell, is currently inactive. Departments are also associated with admission criteria, establishing a direct line of governance responsibility.

The relationships between these entities are managed through junction tables that enable many-to-many associations where the domain requires flexibility.

**Table `AdmissionCriteriaPrerequisiteCourse`**

| criteriaId | courseId |
|---|---|
| 100 | 1000 |
| 100 | 1001 |
| 101 | 1001 |
| 101 | 1002 |
| 102 | 1002 |
| 102 | 1003 |
| 103 | 1003 |
| 103 | 1000 |

The AdmissionCriteriaPrerequisiteCourse junction table links admission criteria to prerequisite courses, allowing a single criterion to reference multiple courses or a single course to satisfy multiple criteria. This flexibility is essential in programs where applicants may fulfill prerequisites through alternative pathways.

**Table `DepartmentAcademicProgram`**

| departmentId | programId |
|---|---|
| 2087755 | 1 |
| 2087755 | 2 |
| 790483 | 2 |
| 790483 | 3 |
| 505978 | 3 |
| 505978 | 4 |
| id_6 | 4 |
| id_6 | 1 |

The DepartmentAcademicProgram junction table connects departments to the academic programs they offer. A department may sponsor multiple programs, and a program may be co-administered by multiple departments, reflecting the collaborative nature of modern academic governance.

**Table `DepartmentPrerequisiteCourse`**

| departmentId | courseId |
|---|---|
| 2087755 | 1000 |
| 2087755 | 1001 |
| 790483 | 1001 |
| 790483 | 1002 |
| 505978 | 1002 |
| 505978 | 1003 |
| id_6 | 1003 |
| id_6 | 1000 |

The DepartmentPrerequisiteCourse junction table associates departments with the prerequisite courses they teach or oversee. This ensures that each course has a clear administrative home and that departments can be audited for their course offerings.

### Admission Criteria and Program Relationships

The view v_admission_criteria_academic_program joins admission criteria with their associated academic programs, answering the fundamental question of which criteria govern which programs. This view reveals that criterion 100, with its minimum GPA of 17.20, governs the "Extended Review" A.A.S. program, while criterion 101, requiring a GPA of 20.40, applies to the "Pilot Initiative A" B.S. program. The joined result makes it immediately clear how GPA thresholds scale with program rigor: the implemented criterion 102, with its 23.60 GPA floor, corresponds to the M.S.-level "Baseline Model" program, and the withdrawn criterion 103, demanding a GPA of 26.80, aligns with the Ph.D.-level "Distributed Cluster" program.

**View `v_admission_criteria_academic_program`**

```sql
CREATE VIEW v_admission_criteria_academic_program AS
SELECT a.id, a.criteriaId, a.effectiveDate, a.minimumGPA, b.programId AS program_programId, b.programName AS program_programName, b.degreeLevel AS program_degreeLevel
FROM AdmissionCriteria a JOIN AcademicProgram b ON a.programId = b.programId;
```

| id | criteriaId | effectiveDate | minimumGPA | program_programId | program_programName | program_degreeLevel |
|---|---|---|---|---|---|---|
| 100 | 3743997 | 2023-02-14 | 17.20 | 1 | Extended Review | A.A.S. |
| 101 | 46d4e72c-8fcc-11eb-924d-9cd76263cbd0 | 2024-07-25 | 20.40 | 2 | Pilot Initiative A | B.S. |
| 102 | 3717614 | 2025-12-09 | 23.60 | 3 | Baseline Model | M.S. |
| 103 | 6564392 | 2022-05-20 | 26.80 | 4 | Distributed Cluster | Ph.D. |

The complementary view v_academic_program_admission_criteria presents the same relationship from the program's perspective, answering the question of what admission standards apply to a given program. Reading the row for program 1, "Extended Review," we see it is governed by criterion 100, effective 2023-02-14, with a minimum GPA of 17.20 and proposed status. The row for program 4, "Distributed Cluster," shows criterion 103 with a minimum GPA of 26.80 and withdrawn status, suggesting that this Ph.D. program's admission standards have been rescinded and may require revision.

**View `v_academic_program_admission_criteria`**

```sql
CREATE VIEW v_academic_program_admission_criteria AS
SELECT a.programId, a.programName, a.degreeLevel, a.departmentId, b.id AS criteria_id, b.criteriaId AS criteria_criteriaId, b.effectiveDate AS criteria_effectiveDate
FROM AcademicProgram a JOIN AdmissionCriteria b ON a.criteriaId = b.id;
```

| programId | programName | degreeLevel | departmentId | criteria_id | criteria_criteriaId | criteria_effectiveDate |
|---|---|---|---|---|---|---|
| 1 | Extended Review | A.A.S. | 2087755 | 100 | 3743997 | 2023-02-14 |
| 2 | Pilot Initiative A | B.S. | 790483 | 101 | 46d4e72c-8fcc-11eb-924d-9cd76263cbd0 | 2024-07-25 |
| 3 | Baseline Model | M.S. | 505978 | 102 | 3717614 | 2025-12-09 |
| 4 | Distributed Cluster | Ph.D. | id_6 | 103 | 6564392 | 2022-05-20 |

### Admission Criteria and Prerequisite Course Relationships

The view v_admission_criteria_prerequisite_course_detail joins admission criteria with their associated prerequisite courses, answering the question of which courses applicants must complete to satisfy a given criterion. Criterion 100 is linked to course 1000, "Baseline Series D," a 28-credit active course. Criterion 101 connects to course 1001, "Distributed Assessment," which carries 33 credits but holds inactive status, potentially signaling that this prerequisite is no longer being offered or accepted.

**View `v_admission_criteria_prerequisite_course_detail`**

```sql
CREATE VIEW v_admission_criteria_prerequisite_course_detail AS
SELECT a.id, a.criteriaId, a.effectiveDate, b.id AS course_id, b.courseCode AS course_courseCode, b.courseTitle AS course_courseTitle
FROM AdmissionCriteria a
  JOIN AdmissionCriteriaPrerequisiteCourse j ON j.criteriaId = a.id
  JOIN PrerequisiteCourse b ON b.id = j.courseId;
```

| id | criteriaId | effectiveDate | course_id | course_courseCode | course_courseTitle |
|---|---|---|---|---|---|
| 100 | 3743997 | 2023-02-14 | 1000 | 10238263 | Baseline Series D |
| 100 | 3743997 | 2023-02-14 | 1001 | 4463667 | Distributed Assessment |
| 101 | 46d4e72c-8fcc-11eb-924d-9cd76263cbd0 | 2024-07-25 | 1001 | 4463667 | Distributed Assessment |
| 101 | 46d4e72c-8fcc-11eb-924d-9cd76263cbd0 | 2024-07-25 | 1002 | 24077793 | Adaptive Survey |
| 102 | 3717614 | 2025-12-09 | 1002 | 24077793 | Adaptive Survey |
| 102 | 3717614 | 2025-12-09 | 1003 | 1204-0009-L | Primary Corridor A |
| 103 | 6564392 | 2022-05-20 | 1003 | 1204-0009-L | Primary Corridor A |
| 103 | 6564392 | 2022-05-20 | 1000 | 10238263 | Baseline Series D |

The view v_prerequisite_course_admission_criteria reverses this perspective, answering which criteria a given prerequisite course satisfies. Course 1000, "Baseline Series D," satisfies criterion 100, while course 1003, "Primary Corridor A," satisfies criterion 103. This bidirectional mapping ensures that both admissions officers and curriculum planners can trace the full chain of academic requirements.

**View `v_prerequisite_course_admission_criteria`**

```sql
CREATE VIEW v_prerequisite_course_admission_criteria AS
SELECT a.id, a.courseCode, a.courseTitle, a.credits, b.id AS criteria_id, b.criteriaId AS criteria_criteriaId, b.effectiveDate AS criteria_effectiveDate
FROM PrerequisiteCourse a JOIN AdmissionCriteria b ON a.criteriaId = b.id;
```

| id | courseCode | courseTitle | credits | criteria_id | criteria_criteriaId | criteria_effectiveDate |
|---|---|---|---|---|---|---|
| 1000 | 10238263 | Baseline Series D | 28 | 100 | 3743997 | 2023-02-14 |
| 1001 | 4463667 | Distributed Assessment | 33 | 101 | 46d4e72c-8fcc-11eb-924d-9cd76263cbd0 | 2024-07-25 |
| 1002 | 24077793 | Adaptive Survey | 38 | 102 | 3717614 | 2025-12-09 |
| 1003 | 1204-0009-L | Primary Corridor A | 43 | 103 | 6564392 | 2022-05-20 |

### Admission Criteria and Standardized Exam Relationships

The view v_admission_criteria_standardized_exam joins admission criteria with the standardized examinations they require, answering the question of which exams applicants must take for each criterion. Criterion 100 requires exam 1, "Primary Programme A," which remains active and was last administered on 2023-06-12. Criterion 101 requires exam 2, "Composite Standard," which has been discontinued—a potential gap that admissions offices would need to address by identifying a replacement examination.

**View `v_admission_criteria_standardized_exam`**

```sql
CREATE VIEW v_admission_criteria_standardized_exam AS
SELECT a.id, a.criteriaId, a.effectiveDate, a.minimumGPA, b.id AS exam_id, b.examCode AS exam_examCode, b.examName AS exam_examName
FROM AdmissionCriteria a JOIN StandardizedExam b ON a.examId = b.id;
```

| id | criteriaId | effectiveDate | minimumGPA | exam_id | exam_examCode | exam_examName |
|---|---|---|---|---|---|---|
| 100 | 3743997 | 2023-02-14 | 17.20 | 1 | 3001009030010 | Primary Programme A |
| 101 | 46d4e72c-8fcc-11eb-924d-9cd76263cbd0 | 2024-07-25 | 20.40 | 2 | ae409270-8fcd-11eb-924d-9cd76263cbd0 | Composite Standard |
| 102 | 3717614 | 2025-12-09 | 23.60 | 3 | 1996923 | Compact Framework |
| 103 | 6564392 | 2022-05-20 | 26.80 | 4 | 9125639 | Legacy Protocol D |

The view v_standardized_exam_admission_criteria presents this relationship from the exam's perspective, answering which criteria each examination serves. Exam 1, "Primary Programme A," serves criterion 100, while exam 4, "Legacy Protocol D," serves criterion 103 and remains active despite its criterion being in withdrawn status, suggesting the exam may be retained for other purposes.

**View `v_standardized_exam_admission_criteria`**

```sql
CREATE VIEW v_standardized_exam_admission_criteria AS
SELECT a.id, a.examCode, a.examName, a.status, b.id AS criteria_id, b.criteriaId AS criteria_criteriaId, b.effectiveDate AS criteria_effectiveDate
FROM StandardizedExam a JOIN AdmissionCriteria b ON a.criteriaId = b.id;
```

| id | examCode | examName | status | criteria_id | criteria_criteriaId | criteria_effectiveDate |
|---|---|---|---|---|---|---|
| 1 | 3001009030010 | Primary Programme A | active | 100 | 3743997 | 2023-02-14 |
| 2 | ae409270-8fcd-11eb-924d-9cd76263cbd0 | Composite Standard | discontinued | 101 | 46d4e72c-8fcc-11eb-924d-9cd76263cbd0 | 2024-07-25 |
| 3 | 1996923 | Compact Framework | proposed | 102 | 3717614 | 2025-12-09 |
| 4 | 9125639 | Legacy Protocol D | active | 103 | 6564392 | 2022-05-20 |

### Admission Criteria and Experiential Requirement Relationships

The view v_admission_criteria_experiential_requirement joins admission criteria with their associated experiential requirements, answering the question of what practical experience applicants must demonstrate. Criterion 100 requires 44 hours verified by letter of recommendation. Criterion 102 requires 54 hours verified by logbook and is currently active. Criterion 103 requires 59 hours verified by letter of recommendation but is marked inactive, indicating that this experiential benchmark is not currently enforced.

**View `v_admission_criteria_experiential_requirement`**

```sql
CREATE VIEW v_admission_criteria_experiential_requirement AS
SELECT a.id, a.criteriaId, a.effectiveDate, a.minimumGPA, b.id AS requirement_id, b.requirementId AS requirement_requirementId, b.description AS requirement_description
FROM AdmissionCriteria a JOIN ExperientialRequirement b ON a.requirementId = b.id;
```

| id | criteriaId | effectiveDate | minimumGPA | requirement_id | requirement_requirementId | requirement_description |
|---|---|---|---|---|---|---|
| 100 | 3743997 | 2023-02-14 | 17.20 | 1 | 778568 | Extended Survey |
| 101 | 46d4e72c-8fcc-11eb-924d-9cd76263cbd0 | 2024-07-25 | 20.40 | 2 | lu_tax_code_template_b_VB-EC-0 | Pilot Corridor A |
| 102 | 3717614 | 2025-12-09 | 23.60 | 3 | 99901 | Baseline Series |
| 103 | 6564392 | 2022-05-20 | 26.80 | 4 | 5917277 | Distributed Assessment |

The view v_experiential_requirement_admission_criteria reverses this view, answering which criteria each experiential requirement satisfies. Requirement 1, "Extended Survey," satisfies criterion 100, while requirement 3, "Baseline Series," satisfies criterion 102. This perspective is particularly useful for experiential education coordinators who need to verify that their programs meet the correct admission standards.

**View `v_experiential_requirement_admission_criteria`**

```sql
CREATE VIEW v_experiential_requirement_admission_criteria AS
SELECT a.id, a.requirementId, a.description, a.minimumHours, b.id AS criteria_id, b.criteriaId AS criteria_criteriaId, b.effectiveDate AS criteria_effectiveDate
FROM ExperientialRequirement a JOIN AdmissionCriteria b ON a.criteriaId = b.id;
```

| id | requirementId | description | minimumHours | criteria_id | criteria_criteriaId | criteria_effectiveDate |
|---|---|---|---|---|---|---|
| 1 | 778568 | Extended Survey | 44 | 100 | 3743997 | 2023-02-14 |
| 2 | lu_tax_code_template_b_VB-EC-0 | Pilot Corridor A | 49 | 101 | 46d4e72c-8fcc-11eb-924d-9cd76263cbd0 | 2024-07-25 |
| 3 | 99901 | Baseline Series | 54 | 102 | 3717614 | 2025-12-09 |
| 4 | 5917277 | Distributed Assessment | 59 | 103 | 6564392 | 2022-05-20 |

### Department and Program Relationships

The view v_academic_program_department joins academic programs with their sponsoring departments, answering the question of which department is responsible for each program. Program 1, "Extended Review," is offered by department 2087755, "Baseline Framework D," which is active and chaired by Jennifer Summers. Program 4, "Distributed Cluster," is offered by department id_6, "Primary Standard A," which is inactive and chaired by Kimberly Myers—a status mismatch that may warrant administrative review.

**View `v_academic_program_department`**

```sql
CREATE VIEW v_academic_program_department AS
SELECT a.programId, a.programName, a.degreeLevel, a.departmentId, b.departmentId AS department_departmentId, b.departmentName AS department_departmentName, b.collegeId AS department_collegeId
FROM AcademicProgram a JOIN Department b ON a.offeredByDepartmentId = b.departmentId;
```

| programId | programName | degreeLevel | departmentId | department_departmentId | department_departmentName | department_collegeId |
|---|---|---|---|---|---|---|
| 1 | Extended Review | A.A.S. | 2087755 | 2087755 | Baseline Framework D | 575206 |
| 2 | Pilot Initiative A | B.S. | 790483 | 790483 | Distributed Protocol | Takings |
| 3 | Baseline Model | M.S. | 505978 | 505978 | Adaptive Programme | 10449517 |
| 4 | Distributed Cluster | Ph.D. | id_6 | id_6 | Primary Standard A | 10449524 |

The view v_department_academic_program_detail presents this relationship from the department's perspective, answering which programs each department sponsors. Department 2087755, "Baseline Framework D," sponsors program 1, "Extended Review," an A.A.S. program requiring 2 credits. Department 790483, "Distributed Protocol," sponsors program 2, "Pilot Initiative A," a B.S. program requiring 5 credits. This view is essential for department chairs who need to understand the full scope of their programmatic responsibilities.

**View `v_department_academic_program_detail`**

```sql
CREATE VIEW v_department_academic_program_detail AS
SELECT a.departmentId, a.departmentName, a.collegeId, b.programId AS program_programId, b.programName AS program_programName, b.degreeLevel AS program_degreeLevel
FROM Department a
  JOIN DepartmentAcademicProgram j ON j.departmentId = a.departmentId
  JOIN AcademicProgram b ON b.programId = j.programId;
```

| departmentId | departmentName | collegeId | program_programId | program_programName | program_degreeLevel |
|---|---|---|---|---|---|
| 2087755 | Baseline Framework D | 575206 | 1 | Extended Review | A.A.S. |
| 2087755 | Baseline Framework D | 575206 | 2 | Pilot Initiative A | B.S. |
| 790483 | Distributed Protocol | Takings | 2 | Pilot Initiative A | B.S. |
| 790483 | Distributed Protocol | Takings | 3 | Baseline Model | M.S. |
| 505978 | Adaptive Programme | 10449517 | 3 | Baseline Model | M.S. |
| 505978 | Adaptive Programme | 10449517 | 4 | Distributed Cluster | Ph.D. |
| id_6 | Primary Standard A | 10449524 | 4 | Distributed Cluster | Ph.D. |
| id_6 | Primary Standard A | 10449524 | 1 | Extended Review | A.A.S. |

### Department and Prerequisite Course Relationships

The view v_prerequisite_course_department joins prerequisite courses with their offering departments, answering the question of which department teaches each course. Course 1000, "Baseline Series D," is offered by department 2087755, "Baseline Framework D." Course 1003, "Primary Corridor A," is offered by department id_6, "Primary Standard A." This mapping ensures that course scheduling, faculty assignments, and curriculum reviews can be traced to the correct administrative unit.

**View `v_prerequisite_course_department`**

```sql
CREATE VIEW v_prerequisite_course_department AS
SELECT a.id, a.courseCode, a.courseTitle, a.credits, b.departmentId AS department_departmentId, b.departmentName AS department_departmentName, b.collegeId AS department_collegeId
FROM PrerequisiteCourse a JOIN Department b ON a.offeredByDepartmentId = b.departmentId;
```

| id | courseCode | courseTitle | credits | department_departmentId | department_departmentName | department_collegeId |
|---|---|---|---|---|---|---|
| 1000 | 10238263 | Baseline Series D | 28 | 2087755 | Baseline Framework D | 575206 |
| 1001 | 4463667 | Distributed Assessment | 33 | 790483 | Distributed Protocol | Takings |
| 1002 | 24077793 | Adaptive Survey | 38 | 505978 | Adaptive Programme | 10449517 |
| 1003 | 1204-0009-L | Primary Corridor A | 43 | id_6 | Primary Standard A | 10449524 |

The view v_department_prerequisite_course_detail presents this relationship from the department's perspective, answering which prerequisite courses each department offers. Department 2087755 offers course 1000, "Baseline Series D," a 28-credit active course. Department 790483 offers course 1001, "Distributed Assessment," a 33-credit inactive course. Department chairs can use this view to audit their course portfolios and identify courses that may need to be reactivated or retired.

**View `v_department_prerequisite_course_detail`**

```sql
CREATE VIEW v_department_prerequisite_course_detail AS
SELECT a.departmentId, a.departmentName, a.collegeId, b.id AS course_id, b.courseCode AS course_courseCode, b.courseTitle AS course_courseTitle
FROM Department a
  JOIN DepartmentPrerequisiteCourse j ON j.departmentId = a.departmentId
  JOIN PrerequisiteCourse b ON b.id = j.courseId;
```

| departmentId | departmentName | collegeId | course_id | course_courseCode | course_courseTitle |
|---|---|---|---|---|---|
| 2087755 | Baseline Framework D | 575206 | 1000 | 10238263 | Baseline Series D |
| 2087755 | Baseline Framework D | 575206 | 1001 | 4463667 | Distributed Assessment |
| 790483 | Distributed Protocol | Takings | 1001 | 4463667 | Distributed Assessment |
| 790483 | Distributed Protocol | Takings | 1002 | 24077793 | Adaptive Survey |
| 505978 | Adaptive Programme | 10449517 | 1002 | 24077793 | Adaptive Survey |
| 505978 | Adaptive Programme | 10449517 | 1003 | 1204-0009-L | Primary Corridor A |
| id_6 | Primary Standard A | 10449524 | 1003 | 1204-0009-L | Primary Corridor A |
| id_6 | Primary Standard A | 10449524 | 1000 | 10238263 | Baseline Series D |

### Department and Admission Criteria Relationships

The view v_department_admission_criteria joins departments with the admission criteria they govern, answering the question of which department is accountable for each criterion. Department 2087755, "Baseline Framework D," governs criterion 100, "Extended Survey," with a minimum GPA of 17.20 and proposed status. Department 505978, "Adaptive Programme," chaired by Sean Green, governs criterion 102, "Baseline Series," with a minimum GPA of 23.60 and implemented status. This view provides a clear line of accountability, ensuring that each criterion has a designated department responsible for its maintenance, review, and enforcement.

**View `v_department_admission_criteria`**

```sql
CREATE VIEW v_department_admission_criteria AS
SELECT a.departmentId, a.departmentName, a.collegeId, a.chairpersonName, b.id AS criteria_id, b.criteriaId AS criteria_criteriaId, b.effectiveDate AS criteria_effectiveDate
FROM Department a JOIN AdmissionCriteria b ON a.criteriaId = b.id;
```

| departmentId | departmentName | collegeId | chairpersonName | criteria_id | criteria_criteriaId | criteria_effectiveDate |
|---|---|---|---|---|---|---|
| 2087755 | Baseline Framework D | 575206 | Jennifer Summers | 100 | 3743997 | 2023-02-14 |
| 790483 | Distributed Protocol | Takings | Michael Oconnell | 101 | 46d4e72c-8fcc-11eb-924d-9cd76263cbd0 | 2024-07-25 |
| 505978 | Adaptive Programme | 10449517 | Sean Green | 102 | 3717614 | 2025-12-09 |
| id_6 | Primary Standard A | 10449524 | Kimberly Myers | 103 | 6564392 | 2022-05-20 |

### Synthesis

The admission criteria management system described here provides a comprehensive framework for governing academic program entry requirements. Six base tables capture the essential entities—criteria, programs, courses, exams, experiential requirements, and departments—while three junction tables enable the flexible many-to-many relationships that real-world academic governance demands. Thirteen views then synthesize these base tables into actionable perspectives, each answering a specific operational question: which criteria govern which programs, which courses satisfy which criteria, which exams are required, which experiential requirements apply, and which departments are responsible for each element. The data reveals a system in active use, with criteria at various lifecycle stages, programs ranging from associate to doctoral level, and departments both active and inactive. Practitioners managing this system can rely on the views to quickly identify gaps—such as discontinued exams paired with active criteria, or inactive departments sponsoring programs—enabling timely administrative intervention.