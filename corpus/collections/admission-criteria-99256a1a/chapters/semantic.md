The academic admissions ecosystem is modelled as a normalized relational schema that captures the interplay between institutional departments, degree programs, admission criteria, prerequisite courses, standardized examinations, and experiential requirements. At its core, the domain revolves around the `AdmissionCriteria` entity — a policy-level construct that binds together a program, an examination, and an experiential requirement into a single evaluative framework. Each criterion carries a temporal dimension through `effectiveDate`, a quality threshold via `minimumGPA`, and a lifecycle `status` ranging from `proposed` through `implemented` to `withdrawn`. The schema distributes related attributes across six base tables and three junction tables, then reassembles them through thirteen materialized views that answer the analytical questions admissions committees actually ask.

**Table `AdmissionCriteria`**

| id | criteriaId | effectiveDate | minimumGPA | status | description | programId | examId | requirementId | createdAt | updatedAt |
|---|---|---|---|---|---|---|---|---|---|---|
| 100 | 3743997 | 2023-02-14 | 17.20 | proposed | Extended Survey | 1 | 1 | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 101 | 46d4e72c-8fcc-11eb-924d-9cd76263cbd0 | 2024-07-25 | 20.40 | approved | Pilot Corridor A | 2 | 2 | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 102 | 3717614 | 2025-12-09 | 23.60 | implemented | Baseline Series | 3 | 3 | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 103 | 6564392 | 2022-05-20 | 26.80 | withdrawn | Distributed Assessment | 4 | 4 | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The `AdmissionCriteria` table is the central hub of the model. Its surrogate key `id` (values 100 through 103) provides an internal row identifier, while the business key `criteriaId` — for example `3743997` or the UUID `46d4e72c-8fcc-11eb-924d-9cd76263cbd0` — serves as the stable reference across all related tables. The `effectiveDate` column anchors each criterion in time; criterion 100 became effective on `2023-02-14`, while criterion 102 is dated `2025-12-09`, indicating a future policy. The `minimumGPA` column stores numeric thresholds such as `17.20` and `26.80`, and the `status` column tracks the lifecycle state (`proposed`, `approved`, `implemented`, `withdrawn`). The `description` column carries human-readable labels like `Extended Survey` and `Pilot Corridor A`. Foreign keys `programId`, `examId`, and `requirementId` point to the `AcademicProgram`, `StandardizedExam`, and `ExperientialRequirement` tables respectively, establishing the three primary relationships. Audit columns `createdAt` and `updatedAt` record the creation and last-modification timestamps.

**Table `AcademicProgram`**

| programId | programName | degreeLevel | departmentId | status | totalCreditsRequired | criteriaId | offeredByDepartmentId |
|---|---|---|---|---|---|---|---|
| 1 | Extended Review | A.A.S. | 2087755 | active | 2 | 100 | 2087755 |
| 2 | Pilot Initiative A | B.S. | 790483 | proposed | 5 | 101 | 790483 |
| 3 | Baseline Model | M.S. | 505978 | closed | 2 | 102 | 505978 |
| 4 | Distributed Cluster | Ph.D. | id_6 | suspended | 20 | 103 | id_6 |

The `AcademicProgram` table defines the degree offerings. Each row represents a program identified by `programId` (1 through 4), with a `programName` such as `Extended Review` or `Distributed Cluster`. The `degreeLevel` column distinguishes between `A.A.S.`, `B.S.`, `M.S.`, and `Ph.D.` programs. The `departmentId` and `offeredByDepartmentId` columns both reference `Department.departmentId`, indicating the owning department and the department that delivers the program — in this model, they are the same value (for instance, program 1 is offered by department `2087755`). The `totalCreditsRequired` column stores credit counts (`2`, `5`, `20`), and `status` mirrors the lifecycle pattern (`active`, `proposed`, `closed`, `suspended`). The `criteriaId` column links back to `AdmissionCriteria.id`, forming a foreign key that ties each program to its governing admission criterion.

**Table `PrerequisiteCourse`**

| id | courseCode | courseTitle | credits | departmentId | status | criteriaId | offeredByDepartmentId |
|---|---|---|---|---|---|---|---|
| 1000 | 10238263 | Baseline Series D | 28 | 2087755 | active | 100 | 2087755 |
| 1001 | 4463667 | Distributed Assessment | 33 | 790483 | inactive | 101 | 790483 |
| 1002 | 24077793 | Adaptive Survey | 38 | 505978 | deprecated | 102 | 505978 |
| 1003 | 1204-0009-L | Primary Corridor A | 43 | id_6 | active | 103 | id_6 |

Prerequisite courses are captured in the `PrerequisiteCourse` table, where each row is identified by surrogate key `id` (1000 through 1003). The `courseCode` column holds codes ranging from numeric strings like `10238263` to formatted codes such as `1204-0009-L`. The `courseTitle` column provides descriptive names (`Baseline Series D`, `Adaptive Survey`), and `credits` stores the credit value (28 through 43). The `departmentId` and `offeredByDepartmentId` columns reference `Department.departmentId`, while `criteriaId` links to `AdmissionCriteria.id`. The `status` column tracks lifecycle states (`active`, `inactive`, `deprecated`).

**Table `StandardizedExam`**

| id | examCode | examName | status | administeredBy | lastUsedDate | criteriaId |
|---|---|---|---|---|---|---|
| 1 | 3001009030010 | Primary Programme A | active | legacy-administ-49 | 2023-06-12 | 100 |
| 2 | ae409270-8fcd-11eb-924d-9cd76263cbd0 | Composite Standard | discontinued | compact-administ-50 | 2024-11-23 | 101 |
| 3 | 1996923 | Compact Framework | proposed | composite-administ-51 | 2025-04-07 | 102 |
| 4 | 9125639 | Legacy Protocol D | active | primary-administ-52 | 2022-09-18 | 103 |

Standardized examinations are modelled in the `StandardizedExam` table. Each exam has a surrogate `id` (1 through 4), an `examCode` (such as `3001009030010` or the UUID `ae409270-8fcd-11eb-924d-9cd76263cbd0`), and an `examName` (`Primary Programme A`, `Composite Standard`). The `status` column records whether an exam is `active`, `discontinued`, or `proposed`. The `administeredBy` column names the administering body (`legacy-administ-49`, `compact-administ-50`), and `lastUsedDate` captures the most recent administration date. The `criteriaId` foreign key connects each exam to its parent admission criterion.

**Table `ExperientialRequirement`**

| id | requirementId | description | minimumHours | verificationMethod | status | criteriaId |
|---|---|---|---|---|---|---|
| 1 | 778568 | Extended Survey | 44 | letter_of_recommendation | active | 100 |
| 2 | lu_tax_code_template_b_VB-EC-0 | Pilot Corridor A | 49 | supervisor_signature | inactive | 101 |
| 3 | 99901 | Baseline Series | 54 | logbook | active | 102 |
| 4 | 5917277 | Distributed Assessment | 59 | letter_of_recommendation | inactive | 103 |

The `ExperientialRequirement` table captures hands-on or practical requirements. Rows are identified by surrogate `id` (1 through 4) and a business `requirementId` (`778568`, `lu_tax_code_template_b_VB-EC-0`, `99901`). The `description` column repeats the criterion label (`Extended Survey`, `Pilot Corridor A`). The `minimumHours` column stores required hours (`44`, `49`, `54`, `59`), and `verificationMethod` specifies how completion is validated (`letter_of_recommendation`, `supervisor_signature`, `logbook`). The `status` column tracks lifecycle state, and `criteriaId` links to `AdmissionCriteria.id`.

**Table `Department`**

| departmentId | departmentName | collegeId | chairpersonName | status | criteriaId |
|---|---|---|---|---|---|
| 2087755 | Baseline Framework D | 575206 | Jennifer Summers | active | 100 |
| 790483 | Distributed Protocol | Takings | Michael Oconnell | inactive | 101 |
| 505978 | Adaptive Programme | 10449517 | Sean Green | active | 102 |
| id_6 | Primary Standard A | 10449524 | Kimberly Myers | inactive | 103 |

The `Department` table defines the organizational units. Each department has a `departmentId` (such as `2087755`, `790483`, `505978`, or `id_6`), a `departmentName` (`Baseline Framework D`, `Distributed Protocol`, `Adaptive Programme`, `Primary Standard A`), a `collegeId` (`575206`, `Takings`, `10449517`, `10449524`), and a `chairpersonName` (`Jennifer Summers`, `Michael Oconnell`, `Sean Green`, `Kimberly Myers`). The `status` column records whether the department is `active` or `inactive`, and `criteriaId` links to `AdmissionCriteria.id`.

The three junction tables resolve many-to-many relationships that cannot be expressed through simple foreign keys. The `AdmissionCriteriaPrerequisiteCourse` table links admission criteria to prerequisite courses, enabling a single criterion to reference multiple courses and a single course to be required by multiple criteria. The `DepartmentAcademicProgram` table associates departments with the programs they offer, supporting the scenario where a department sponsors multiple programs or a program is jointly offered by several departments. The `DepartmentPrerequisiteCourse` table connects departments to the prerequisite courses they teach, allowing a department to offer multiple courses and a course to be cross-listed across departments.

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

With the base schema established, the thirteen views materialize the domain facts by joining the normalized tables. Each view answers a specific analytical question by denormalizing the relationships back into a flat, queryable structure.

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

The view `v_admission_criteria_academic_program` joins `AdmissionCriteria` to `AcademicProgram` on the `programId` foreign key, producing a flat record that pairs each criterion with its associated program. Reading the first row reveals that criterion `3743997` (status `proposed`, effective `2023-02-14`, minimum GPA `17.20`) governs the `Extended Review` program at the `A.A.S.` degree level, requiring `2` total credits. The second row shows that criterion `46d4e72c-8fcc-11eb-924d-9cd76263cbd0` (status `approved`, effective `2024-07-25`, minimum GPA `20.40`) applies to `Pilot Initiative A` at the `B.S.` level with `5` credits required. This view answers the question: "What program does this admission criterion govern, and what are the program's structural attributes?"

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

The view `v_admission_criteria_prerequisite_course_detail` joins `AdmissionCriteria` to `PrerequisiteCourse` through the junction table `AdmissionCriteriaPrerequisiteCourse`, yielding a row for each criterion-course pairing. The first row indicates that criterion `3743997` requires the course `10238263` (`Baseline Series D`), which carries `28` credits and is offered by department `2087755` in `active` status. The second row shows criterion `46d4e72c-8fcc-11eb-924d-9cd76263cbd0` requiring course `4463667` (`Distributed Assessment`) with `33` credits from department `790483` in `inactive` status. This view answers: "Which prerequisite courses does each admission criterion mandate, and what are their academic properties?"

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

The view `v_admission_criteria_standardized_exam` joins `AdmissionCriteria` to `StandardizedExam` on the `examId` foreign key. The first row reveals that criterion `3743997` (status `proposed`, GPA threshold `17.20`) requires the exam `3001009030010` (`Primary Programme A`), which is `active` and administered by `legacy-administ-49`, last used on `2023-06-12`. The second row shows criterion `46d4e72c-8fcc-11eb-924d-9cd76263cbd0` (status `approved`, GPA `20.40`) requiring exam `ae409270-8fcd-11eb-924d-9cd76263cbd0` (`Composite Standard`), which is `discontinued` and administered by `compact-administ-50`, last used on `2024-11-23`. This view answers: "Which standardized examination is required by each admission criterion, and what is the exam's operational status?"

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

The view `v_admission_criteria_experiential_requirement` joins `AdmissionCriteria` to `ExperientialRequirement` on the `requirementId` foreign key. The first row shows criterion `3743997` (status `proposed`, GPA `17.20`) requiring experiential requirement `778568` (`Extended Survey`), which demands `44` minimum hours verified by `letter_of_recommendation` and is in `active` status. The second row links criterion `46d4e72c-8fcc-11eb-924d-9cd76263cbd0` (status `approved`, GPA `20.40`) to requirement `lu_tax_code_template_b_VB-EC-0` (`Pilot Corridor A`), requiring `49` hours verified by `supervisor_signature` in `inactive` status. This view answers: "What experiential requirement is attached to each admission criterion, and what are its verification and hour requirements?"

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

The view `v_academic_program_admission_criteria` performs the inverse join of `v_admission_criteria_academic_program`, joining `AcademicProgram` to `AdmissionCriteria` on `criteriaId`. The first row shows program `Extended Review` (`A.A.S.`, `active`, `2` credits) governed by criterion `100` (status `proposed`, effective `2023-02-14`, minimum GPA `17.20`, description `Extended Survey`). The second row links program `Pilot Initiative A` (`B.S.`, `proposed`, `5` credits) to criterion `101` (status `approved`, effective `2024-07-25`, minimum GPA `20.40`, description `Pilot Corridor A`). This view answers the reverse question: "What admission criterion governs this program, and what are the criterion's policy attributes?"

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

The view `v_academic_program_department` joins `AcademicProgram` to `Department` on `departmentId`, producing a flat view of each program alongside its sponsoring department. The first row shows `Extended Review` (`A.A.S.`, `active`, `2` credits) offered by department `2087755` (`Baseline Framework D`, `active`, chaired by `Jennifer Summers`). The second row links `Pilot Initiative A` (`B.S.`, `proposed`, `5` credits) to department `790483` (`Distributed Protocol`, `inactive`, chaired by `Michael Oconnell`). This view answers: "Which department sponsors each academic program, and what is the department's organizational status?"

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

The view `v_prerequisite_course_admission_criteria` joins `PrerequisiteCourse` to `AdmissionCriteria` through the junction table, yielding each course paired with its governing criterion. The first row shows course `10238263` (`Baseline Series D`, `28` credits, `active`) governed by criterion `100` (status `proposed`, effective `2023-02-14`, minimum GPA `17.20`). The second row links course `4463667` (`Distributed Assessment`, `33` credits, `inactive`) to criterion `101` (status `approved`, effective `2024-07-25`, minimum GPA `20.40`). This view answers: "Which admission criterion requires this prerequisite course, and what is the criterion's policy context?"

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

The view `v_prerequisite_course_department` joins `PrerequisiteCourse` to `Department` on `departmentId`. The first row shows course `10238263` (`Baseline Series D`, `28` credits, `active`) offered by department `2087755` (`Baseline Framework D`, `active`, chaired by `Jennifer Summers`). The second row links course `4463667` (`Distributed Assessment`, `33` credits, `inactive`) to department `790483` (`Distributed Protocol`, `inactive`, chaired by `Michael Oconnell`). This view answers: "Which department teaches each prerequisite course, and what is the department's organizational standing?"

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

The view `v_standardized_exam_admission_criteria` joins `StandardizedExam` to `AdmissionCriteria` on `criteriaId`. The first row shows exam `3001009030010` (`Primary Programme A`, `active`, administered by `legacy-administ-49`, last used `2023-06-12`) required by criterion `100` (status `proposed`, effective `2023-02-14`, minimum GPA `17.20`). The second row links exam `ae409270-8fcd-11eb-924d-9cd76263cbd0` (`Composite Standard`, `discontinued`, administered by `compact-administ-50`, last used `2024-11-23`) to criterion `101` (status `approved`, effective `2024-07-25`, minimum GPA `20.40`). This view answers: "Which admission criterion mandates this examination, and what is the criterion's policy state?"

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

The view `v_experiential_requirement_admission_criteria` joins `ExperientialRequirement` to `AdmissionCriteria` on `criteriaId`. The first row shows requirement `778568` (`Extended Survey`, `44` hours, `letter_of_recommendation`, `active`) required by criterion `100` (status `proposed`, effective `2023-02-14`, minimum GPA `17.20`). The second row links requirement `lu_tax_code_template_b_VB-EC-0` (`Pilot Corridor A`, `49` hours, `supervisor_signature`, `inactive`) to criterion `101` (status `approved`, effective `2024-07-25`, minimum GPA `20.40`). This view answers: "Which admission criterion requires this experiential requirement, and what are the criterion's policy attributes?"

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

The view `v_department_academic_program_detail` joins `Department` to `AcademicProgram` on `departmentId`, producing a flat view of each department alongside its programs. The first row shows department `2087755` (`Baseline Framework D`, `active`, chaired by `Jennifer Summers`) offering program `Extended Review` (`A.A.S.`, `active`, `2` credits). The second row links department `790483` (`Distributed Protocol`, `inactive`, chaired by `Michael Oconnell`) to program `Pilot Initiative A` (`B.S.`, `proposed`, `5` credits). This view answers: "What programs does each department offer, and what are the programs' academic and lifecycle attributes?"

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

The view `v_department_prerequisite_course_detail` joins `Department` to `PrerequisiteCourse` on `departmentId`. The first row shows department `2087755` (`Baseline Framework D`, `active`, chaired by `Jennifer Summers`) teaching course `10238263` (`Baseline Series D`, `28` credits, `active`). The second row links department `790483` (`Distributed Protocol`, `inactive`, chaired by `Michael Oconnell`) to course `4463667` (`Distributed Assessment`, `33` credits, `inactive`). This view answers: "Which prerequisite courses does each department teach, and what are the courses' academic properties?"

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

The view `v_department_admission_criteria` joins `Department` to `AdmissionCriteria` on `criteriaId`. The first row shows department `2087755` (`Baseline Framework D`, `active`, chaired by `Jennifer Summers`) associated with criterion `100` (status `proposed`, effective `2023-02-14`, minimum GPA `17.20`, description `Extended Survey`). The second row links department `790483` (`Distributed Protocol`, `inactive`, chaired by `Michael Oconnell`) to criterion `101` (status `approved`, effective `2024-07-25`, minimum GPA `20.40`, description `Pilot Corridor A`). This view answers: "Which admission criteria are associated with each department, and what are the criteria's policy states?"

The schema achieves a clean separation of concerns: `AdmissionCriteria` serves as the central policy entity, while `AcademicProgram`, `PrerequisiteCourse`, `StandardizedExam`, `ExperientialRequirement`, and `Department` provide the contextual attributes that define each criterion's scope. The three junction tables (`AdmissionCriteriaPrerequisiteCourse`, `DepartmentAcademicProgram`, `DepartmentPrerequisiteCourse`) resolve the many-to-many relationships that arise when entities cross organizational boundaries. The thirteen views then materialize the most common analytical queries as denormalized, flat structures — each view answering a distinct question about the domain by joining the appropriate tables and presenting the result as a single, readable row. This architecture allows the normalized base schema to maintain data integrity through foreign key constraints while the views provide the denormalized perspectives that