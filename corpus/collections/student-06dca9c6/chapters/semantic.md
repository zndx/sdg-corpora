## Domain Modelling and Relational Materialisation

The student management domain captures the administrative relationships between learners, their living arrangements, guardians, educational institutions, athletic participation, and transfer authorisations. At its core, the model represents a school district's operational view of student life: where a student lives, who is responsible for them, which school they attend, whether they participate in athletics, and whether any special transfer waivers apply. The relational schema materialises this domain through six base tables and twelve derived views, each serving a distinct query perspective. The base tables enforce referential integrity through foreign keys, while the views reconstruct domain facts by joining across the normalised structure.

**Table `students`**

| student_id | date_of_birth | grade_level | age | current_address | date_entered9th_grade | is_eligible | residence_id | school_id | athletic_history_id |
|---|---|---|---|---|---|---|---|---|---|
| 392507 | 2025-04-02 | 29 | 35 | integrated-current-64 | 2024-11-11 | true | 100 | 1 | 1000 |
| 25388256 | 2022-09-13 | 33 | 40 | seasonal-current-65 | 2025-04-22 | false | 101 | 2 | 1001 |
| id_16 | 2023-02-24 | 37 | 45 | regional-current-66 | 2022-09-06 | true | 102 | 3 | 1002 |
| gd_taxc_2211 | 2024-07-08 | 41 | 50 | legacy-current-67 | 2023-02-17 | false | 103 | 4 | 1003 |

The `students` table is the central entity, anchoring the entire schema. Each row represents a learner identified by `student_id`, with demographic attributes including `date_of_birth`, `grade_level`, and `age`. The `current_address` column stores a textual address reference, while `date_entered9th_grade` records the date the student began ninth grade. The `is_eligible` boolean indicates general eligibility status. Critically, `students` carries three foreign keys — `residence_id`, `school_id`, and `athletic_history_id` — that link outward to the `residences`, `schools`, and `athletic_histories` tables respectively. A row such as student `392507`, born on `2025-04-02`, in grade level `29` and age `35`, residing at `integrated-current-64`, entered ninth grade on `2024-11-11`, is marked eligible, and is associated with residence `100`, school `1`, and athletic history `1000`. The identifier `id_16` and the opaque identifier `gd_taxc_2211` demonstrate that the system accepts both numeric and string-based student identifiers.

**Table `residences`**

| residence_id | address | date_moved_in | duration_months | school_district | is_primary_residence | student_id | guardian_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|
| 100 | distributed-address-72 | 2023-06-26 | 44 | extended-school-45 | false | 392507 | 1000 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 101 | baseline-address-73 | 2024-11-10 | 54 | integrated-school-46 | true | 25388256 | 1001 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 102 | pilot-address-74 | 2025-04-21 | 64 | seasonal-school-47 | false | id_16 | 1002 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 103 | extended-address-75 | 2022-09-05 | 74 | regional-school-48 | true | gd_taxc_2211 | 1003 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The `residences` table models where students live. Its primary key is `residence_id`, and each row records an `address`, the `date_moved_in`, the `duration_months` of stay, the `school_district` (a textual district name such as `extended-school-45` or `integrated-school-46`), and whether the residence `is_primary_residence`. The table also carries `student_id` and `guardian_id` foreign keys, creating a bidirectional link: while `students.residence_id` points to `residences.residence_id`, `residences.student_id` points back to `students.student_id`. This dual referencing allows queries to navigate from residence to student and vice versa. The `created_at` and `updated_at` timestamps provide auditability. Residence `100`, for instance, is located at `distributed-address-72`, was occupied since `2023-06-26` for `44` months, falls within the `extended-school-45` district, is not a primary residence, and is linked to student `392507` and guardian `1000`.

**Table `guardians`**

| guardian_id | full_name | relationship | telephone | is_parent | residence_id | student_id |
|---|---|---|---|---|---|---|
| 1000 | Theodore Mcgrath | baseline-relation-67 | adaptive-telephon-23 | true | 100 | 392507 |
| 1001 | Account Name | pilot-relation-68 | distributed-telephon-24 | false | 101 | 25388256 |
| 1002 | Saipan International Airport | extended-relation-69 | baseline-telephon-25 | true | 102 | id_16 |
| 1003 | Norma Fisher | integrated-relation-70 | pilot-telephon-26 | false | 103 | gd_taxc_2211 |

Guardians represent the adult responsible for a student. The `guardians` table uses `guardian_id` as its primary key and stores `full_name` (such as `Theodore Mcgrath` or `Norma Fisher`), `relationship` (a descriptive string like `baseline-relation-67`), `telephone` (e.g., `adaptive-telephon-23`), and `is_parent` (a boolean). Like residences, guardians carry bidirectional foreign keys: `residence_id` links to the `residences` table, and `student_id` links to the `students` table. Guardian `1000`, Theodore Mcgrath, is a parent (`is_parent = true`) of student `392507` and is associated with residence `100`. Guardian `1002`, named `Saipan International Airport` — a fictional placeholder — is also a parent of student `id_16`.

**Table `schools`**

| id | school_name | school_type | district | has_open_enrollment | student_id | athletic_history_id |
|---|---|---|---|---|---|---|
| 1 | Seasonal Standard | public | integrated-district-40 | true | 392507 | 1000 |
| 2 | Integrated Framework | private | seasonal-district-41 | false | 25388256 | 1001 |
| 3 | Extended Protocol D | parochial | regional-district-42 | true | id_16 | 1002 |
| 4 | Pilot Programme | public | legacy-district-43 | false | gd_taxc_2211 | 1003 |

The `schools` table describes educational institutions. Its primary key is `id`, and each row contains `school_name` (e.g., `Seasonal Standard`, `Integrated Framework`, `Extended Protocol D`, `Pilot Programme`), `school_type` (one of `public`, `private`, or `parochial`), `district` (such as `integrated-district-40` or `seasonal-district-41`), and `has_open_enrollment` (a boolean). The table also includes `student_id` and `athletic_history_id` foreign keys, again forming bidirectional links with the `students` and `athletic_histories` tables. School `1`, `Seasonal Standard`, is a public institution in the `integrated-district-40` district with open enrollment enabled, associated with student `392507` and athletic history `1000`.

**Table `athletic_histories`**

| athletic_history_id | season | year | sport | level | practices_completed | is_eligible | student_id | school_id |
|---|---|---|---|---|---|---|---|---|
| 1000 | Fall | 12 | pilot-sport-92 | Varsity | 34 | true | 392507 | 1 |
| 1001 | Winter | 21 | extended-sport-93 | JV | 43 | false | 25388256 | 2 |
| 1002 | Spring | 30 | integrated-sport-94 | Varsity | 52 | true | id_16 | 3 |
| 1003 | Fall | 39 | seasonal-sport-95 | JV | 61 | false | gd_taxc_2211 | 4 |

Athletic participation is tracked in the `athletic_histories` table, keyed by `athletic_history_id`. Each row records the `season` (`Fall`, `Winter`, or `Spring`), `year` (a numeric value such as `12`, `21`, `30`, or `39`), `sport` (e.g., `pilot-sport-92`, `extended-sport-93`), `level` (`Varsity` or `JV`), `practices_completed` (an integer count like `34` or `61`), and `is_eligible` (a boolean). The table links to `students` via `student_id` and to `schools` via `school_id`. Athletic history `1000` corresponds to student `392507` at school `1`, in the `Fall` season of year `12`, playing `pilot-sport-92` at the `Varsity` level, with `34` practices completed and `is_eligible` set to `true`.

**Table `transfer_waivers`**

| id | waiver_type | approval_date | approved_by | is_one_time_only | student_id | school_id |
|---|---|---|---|---|---|---|
| 1 | ForeignExchange | 2023-10-10 | regional-approved-54 | false | 392507 | 1 |
| 2 | AgeOfMajority | 2024-03-21 | legacy-approved-55 | true | 25388256 | 2 |
| 3 | WardOfCourt | 2025-08-05 | compact-approved-56 | false | id_16 | 3 |
| 4 | SchoolClosure | 2022-01-16 | composite-approved-57 | true | gd_taxc_2211 | 4 |

The `transfer_waivers` table records authorisations for students to attend schools outside their normal zone. Its primary key is `id`, and each row stores `waiver_type` (such as `ForeignExchange`, `AgeOfMajority`, `WardOfCourt`, or `SchoolClosure`), `approval_date`, `approved_by` (a textual approver identifier like `regional-approved-54`), and `is_one_time_only` (a boolean). The table links to `students` via `student_id` and to `schools` via `school_id`. Waiver `1` is a `ForeignExchange` type, approved on `2023-10-10` by `regional-approved-54`, not one-time-only, for student `392507` at school `1`. Waiver `2`, an `AgeOfMajority` waiver for student `25388256` at school `2`, is marked as one-time-only.

The foreign-key topology of the base tables reveals a deliberately redundant, bidirectional design. Every major entity — `students`, `residences`, `guardians`, `schools`, `athletic_histories`, and `transfer_waivers` — carries at least one foreign key pointing to `students`, and `students` carries foreign keys pointing to `residences`, `schools`, and `athletic_histories`. This creates a star-like graph centred on `students`, with additional cross-links (e.g., `residences.guardian_id` → `guardians`, `residences.student_id` → `students`, `guardians.residence_id` → `residences`). The redundancy is intentional: it allows each entity to be queried independently while still maintaining referential anchors to the student record.

The twelve views materialise this graph into flat, query-ready result sets. Each view answers a specific domain question by joining two or more base tables.

**View `v_student_residence`**

```sql
CREATE VIEW v_student_residence AS
SELECT a.student_id, a.date_of_birth, a.grade_level, a.age, b.residence_id AS residence_residence_id, b.address AS residence_address, b.date_moved_in AS residence_date_moved_in
FROM students a JOIN residences b ON a.residence_id = b.residence_id;
```

| student_id | date_of_birth | grade_level | age | residence_residence_id | residence_address | residence_date_moved_in |
|---|---|---|---|---|---|---|
| 392507 | 2025-04-02 | 29 | 35 | 100 | distributed-address-72 | 2023-06-26 |
| 25388256 | 2022-09-13 | 33 | 40 | 101 | baseline-address-73 | 2024-11-10 |
| id_16 | 2023-02-24 | 37 | 45 | 102 | pilot-address-74 | 2025-04-21 |
| gd_taxc_2211 | 2024-07-08 | 41 | 50 | 103 | extended-address-75 | 2022-09-05 |

The `v_student_residence` view joins `students` with `residences` on the student–residence relationship, answering the question: "Where does each student live?" The result combines student demographics with residence details. For student `392507`, the view would show residence `100` at `distributed-address-72`, occupied since `2023-06-26` for `44` months in the `extended-school-45` district. For student `25388256`, the view would show residence `101` at `baseline-address-73`, occupied since `2024-11-10` for `54` months in the `integrated-school-46` district, marked as a primary residence.

**View `v_student_school`**

```sql
CREATE VIEW v_student_school AS
SELECT a.student_id, a.date_of_birth, a.grade_level, a.age, b.id AS school_id, b.school_name AS school_school_name, b.school_type AS school_school_type
FROM students a JOIN schools b ON a.school_id = b.id;
```

| student_id | date_of_birth | grade_level | age | school_id | school_school_name | school_school_type |
|---|---|---|---|---|---|---|
| 392507 | 2025-04-02 | 29 | 35 | 1 | Seasonal Standard | public |
| 25388256 | 2022-09-13 | 33 | 40 | 2 | Integrated Framework | private |
| id_16 | 2023-02-24 | 37 | 45 | 3 | Extended Protocol D | parochial |
| gd_taxc_2211 | 2024-07-08 | 41 | 50 | 4 | Pilot Programme | public |

The `v_student_school` view joins `students` with `schools`, answering: "Which school does each student attend?" The result pairs student records with school metadata. Student `392507` is associated with school `1`, `Seasonal Standard`, a public institution in the `integrated-district-40` district with open enrollment. Student `id_16` attends school `3`, `Extended Protocol D`, a parochial school in the `regional-district-42` district.

**View `v_student_athletic_history`**

```sql
CREATE VIEW v_student_athletic_history AS
SELECT a.student_id, a.date_of_birth, a.grade_level, a.age, b.athletic_history_id AS history_athletic_history_id, b.season AS history_season, b.year AS history_year
FROM students a JOIN athletic_histories b ON a.athletic_history_id = b.athletic_history_id;
```

| student_id | date_of_birth | grade_level | age | history_athletic_history_id | history_season | history_year |
|---|---|---|---|---|---|---|
| 392507 | 2025-04-02 | 29 | 35 | 1000 | Fall | 12 |
| 25388256 | 2022-09-13 | 33 | 40 | 1001 | Winter | 21 |
| id_16 | 2023-02-24 | 37 | 45 | 1002 | Spring | 30 |
| gd_taxc_2211 | 2024-07-08 | 41 | 50 | 1003 | Fall | 39 |

The `v_student_athletic_history` view joins `students` with `athletic_histories`, answering: "What athletic participation does each student have?" The result combines student identity with sport, season, level, and eligibility. Student `392507` participated in `pilot-sport-92` during the `Fall` season of year `12` at the `Varsity` level, completing `34` practices and being eligible. Student `gd_taxc_2211` participated in `seasonal-sport-95` during the `Fall` season of year `39` at the `JV` level, completing `61` practices but not eligible.

**View `v_residence_student`**

```sql
CREATE VIEW v_residence_student AS
SELECT a.residence_id, a.address, a.date_moved_in, a.duration_months, b.student_id AS student_student_id, b.date_of_birth AS student_date_of_birth, b.grade_level AS student_grade_level
FROM residences a JOIN students b ON a.student_id = b.student_id;
```

| residence_id | address | date_moved_in | duration_months | student_student_id | student_date_of_birth | student_grade_level |
|---|---|---|---|---|---|---|
| 100 | distributed-address-72 | 2023-06-26 | 44 | 392507 | 2025-04-02 | 29 |
| 101 | baseline-address-73 | 2024-11-10 | 54 | 25388256 | 2022-09-13 | 33 |
| 102 | pilot-address-74 | 2025-04-21 | 64 | id_16 | 2023-02-24 | 37 |
| 103 | extended-address-75 | 2022-09-05 | 74 | gd_taxc_2211 | 2024-07-08 | 41 |

The `v_residence_student` view reverses the perspective, joining `residences` with `students` to answer: "Which student lives at each residence?" This is the residence-centric counterpart to `v_student_residence`. Residence `100` at `distributed-address-72` is home to student `392507`. Residence `103` at `extended-address-75` is home to student `gd_taxc_2211`.

**View `v_residence_guardian`**

```sql
CREATE VIEW v_residence_guardian AS
SELECT a.residence_id, a.address, a.date_moved_in, a.duration_months, b.guardian_id AS guardian_guardian_id, b.full_name AS guardian_full_name, b.relationship AS guardian_relationship
FROM residences a JOIN guardians b ON a.guardian_id = b.guardian_id;
```

| residence_id | address | date_moved_in | duration_months | guardian_guardian_id | guardian_full_name | guardian_relationship |
|---|---|---|---|---|---|---|
| 100 | distributed-address-72 | 2023-06-26 | 44 | 1000 | Theodore Mcgrath | baseline-relation-67 |
| 101 | baseline-address-73 | 2024-11-10 | 54 | 1001 | Account Name | pilot-relation-68 |
| 102 | pilot-address-74 | 2025-04-21 | 64 | 1002 | Saipan International Airport | extended-relation-69 |
| 103 | extended-address-75 | 2022-09-05 | 74 | 1003 | Norma Fisher | integrated-relation-70 |

The `v_residence_guardian` view joins `residences` with `guardians`, answering: "Which guardian is associated with each residence?" The result links residence details with guardian identity and contact information. Residence `100` is associated with guardian `1000`, Theodore Mcgrath, a parent reachable at `adaptive-telephon-23`. Residence `102` is associated with guardian `1002`, named `Saipan International Airport`, also a parent.

**View `v_guardian_residence`**

```sql
CREATE VIEW v_guardian_residence AS
SELECT a.guardian_id, a.full_name, a.relationship, a.telephone, b.residence_id AS residence_residence_id, b.address AS residence_address, b.date_moved_in AS residence_date_moved_in
FROM guardians a JOIN residences b ON a.residence_id = b.residence_id;
```

| guardian_id | full_name | relationship | telephone | residence_residence_id | residence_address | residence_date_moved_in |
|---|---|---|---|---|---|---|
| 1000 | Theodore Mcgrath | baseline-relation-67 | adaptive-telephon-23 | 100 | distributed-address-72 | 2023-06-26 |
| 1001 | Account Name | pilot-relation-68 | distributed-telephon-24 | 101 | baseline-address-73 | 2024-11-10 |
| 1002 | Saipan International Airport | extended-relation-69 | baseline-telephon-25 | 102 | pilot-address-74 | 2025-04-21 |
| 1003 | Norma Fisher | integrated-relation-70 | pilot-telephon-26 | 103 | extended-address-75 | 2022-09-05 |

The `v_guardian_residence` view joins `guardians` with `residences`, answering: "Which residence does each guardian occupy?" This is the guardian-centric counterpart to `v_residence_guardian`. Guardian `1000` (Theodore Mcgrath) occupies residence `100` at `distributed-address-72`. Guardian `1003` (Norma Fisher) occupies residence `103` at `extended-address-75`.

**View `v_guardian_student`**

```sql
CREATE VIEW v_guardian_student AS
SELECT a.guardian_id, a.full_name, a.relationship, a.telephone, b.student_id AS student_student_id, b.date_of_birth AS student_date_of_birth, b.grade_level AS student_grade_level
FROM guardians a JOIN students b ON a.student_id = b.student_id;
```

| guardian_id | full_name | relationship | telephone | student_student_id | student_date_of_birth | student_grade_level |
|---|---|---|---|---|---|---|
| 1000 | Theodore Mcgrath | baseline-relation-67 | adaptive-telephon-23 | 392507 | 2025-04-02 | 29 |
| 1001 | Account Name | pilot-relation-68 | distributed-telephon-24 | 25388256 | 2022-09-13 | 33 |
| 1002 | Saipan International Airport | extended-relation-69 | baseline-telephon-25 | id_16 | 2023-02-24 | 37 |
| 1003 | Norma Fisher | integrated-relation-70 | pilot-telephon-26 | gd_taxc_2211 | 2024-07-08 | 41 |

The `v_guardian_student` view joins `guardians` with `students`, answering: "Which student is under the care of each guardian?" The result pairs guardian identity with student demographics. Guardian `1000` (Theodore Mcgrath) is the guardian of student `392507`. Guardian `1003` (Norma Fisher) is the guardian of student `gd_taxc_2211`.

**View `v_school_student`**

```sql
CREATE VIEW v_school_student AS
SELECT a.id, a.school_name, a.school_type, a.district, b.student_id AS student_student_id, b.date_of_birth AS student_date_of_birth, b.grade_level AS student_grade_level
FROM schools a JOIN students b ON a.student_id = b.student_id;
```

| id | school_name | school_type | district | student_student_id | student_date_of_birth | student_grade_level |
|---|---|---|---|---|---|---|
| 1 | Seasonal Standard | public | integrated-district-40 | 392507 | 2025-04-02 | 29 |
| 2 | Integrated Framework | private | seasonal-district-41 | 25388256 | 2022-09-13 | 33 |
| 3 | Extended Protocol D | parochial | regional-district-42 | id_16 | 2023-02-24 | 37 |
| 4 | Pilot Programme | public | legacy-district-43 | gd_taxc_2211 | 2024-07-08 | 41 |

The `v_school_student` view joins `schools` with `students`, answering: "Which student attends each school?" This is the school-centric counterpart to `v_student_school`. School `1` (`Seasonal Standard`) enrolls student `392507`. School `4` (`Pilot Programme`) enrolls student `gd_taxc_2211`.

**View `v_school_athletic_history`**

```sql
CREATE VIEW v_school_athletic_history AS
SELECT a.id, a.school_name, a.school_type, a.district, b.athletic_history_id AS history_athletic_history_id, b.season AS history_season, b.year AS history_year
FROM schools a JOIN athletic_histories b ON a.athletic_history_id = b.athletic_history_id;
```

| id | school_name | school_type | district | history_athletic_history_id | history_season | history_year |
|---|---|---|---|---|---|---|
| 1 | Seasonal Standard | public | integrated-district-40 | 1000 | Fall | 12 |
| 2 | Integrated Framework | private | seasonal-district-41 | 1001 | Winter | 21 |
| 3 | Extended Protocol D | parochial | regional-district-42 | 1002 | Spring | 30 |
| 4 | Pilot Programme | public | legacy-district-43 | 1003 | Fall | 39 |

The `v_school_athletic_history` view joins `schools` with `athletic_histories`, answering: "What athletic participation occurs at each school?" The result pairs school identity with sport, season, level, and eligibility. School `1` (`Seasonal Standard`) has athletic history `1000`: `pilot-sport-92` at the `Varsity` level during the `Fall` season of year `12`. School `3` (`Extended Protocol D`) has athletic history `1002`: `integrated-sport-94` at the `Varsity` level during the `Spring` season of year `30`.

**View `v_athletic_history_student`**

```sql
CREATE VIEW v_athletic_history_student AS
SELECT a.athletic_history_id, a.season, a.year, a.sport, b.student_id AS student_student_id, b.date_of_birth AS student_date_of_birth, b.grade_level AS student_grade_level
FROM athletic_histories a JOIN students b ON a.student_id = b.student_id;
```

| athletic_history_id | season | year | sport | student_student_id | student_date_of_birth | student_grade_level |
|---|---|---|---|---|---|---|
| 1000 | Fall | 12 | pilot-sport-92 | 392507 | 2025-04-02 | 29 |
| 1001 | Winter | 21 | extended-sport-93 | 25388256 | 2022-09-13 | 33 |
| 1002 | Spring | 30 | integrated-sport-94 | id_16 | 2023-02-24 | 37 |
| 1003 | Fall | 39 | seasonal-sport-95 | gd_taxc_2211 | 2024-07-08 | 41 |

The `v_athletic_history_student` view joins `athletic_histories` with `students`, answering: "Which student has this athletic record?" This is the athletic-history-centric counterpart to `v_student_athletic_history`. Athletic history `1000` belongs to student `392507`. Athletic history `1003` belongs to student `gd_taxc_2211`.

**View `v_athletic_history_school`**

```sql
CREATE VIEW v_athletic_history_school AS
SELECT a.athletic_history_id, a.season, a.year, a.sport, b.id AS school_id, b.school_name AS school_school_name, b.school_type AS school_school_type
FROM athletic_histories a JOIN schools b ON a.school_id = b.id;
```

| athletic_history_id | season | year | sport | school_id | school_school_name | school_school_type |
|---|---|---|---|---|---|---|
| 1000 | Fall | 12 | pilot-sport-92 | 1 | Seasonal Standard | public |
| 1001 | Winter | 21 | extended-sport-93 | 2 | Integrated Framework | private |
| 1002 | Spring | 30 | integrated-sport-94 | 3 | Extended Protocol D | parochial |
| 1003 | Fall | 39 | seasonal-sport-95 | 4 | Pilot Programme | public |

The `v_athletic_history_school` view joins `athletic_histories` with `schools`, answering: "At which school does this athletic participation occur?" The result pairs athletic record details with school metadata. Athletic history `1000` (`pilot-sport-92`, `Varsity`, `Fall`, year `12`) occurs at school `1` (`Seasonal Standard`). Athletic history `1002` (`integrated-sport-94`, `Varsity`, `Spring`, year `30`) occurs at school `3` (`Extended Protocol D`).

**View `v_transfer_waiver_student`**

```sql
CREATE VIEW v_transfer_waiver_student AS
SELECT a.id, a.waiver_type, a.approval_date, a.approved_by, b.student_id AS student_student_id, b.date_of_birth AS student_date_of_birth, b.grade_level AS student_grade_level
FROM transfer_waivers a JOIN students b ON a.student_id = b.student_id;
```

| id | waiver_type | approval_date | approved_by | student_student_id | student_date_of_birth | student_grade_level |
|---|---|---|---|---|---|---|
| 1 | ForeignExchange | 2023-10-10 | regional-approved-54 | 392507 | 2025-04-02 | 29 |
| 2 | AgeOfMajority | 2024-03-21 | legacy-approved-55 | 25388256 | 2022-09-13 | 33 |
| 3 | WardOfCourt | 2025-08-05 | compact-approved-56 | id_16 | 2023-02-24 | 37 |
| 4 | SchoolClosure | 2022-01-16 | composite-approved-57 | gd_taxc_2211 | 2024-07-08 | 41 |

The `v_transfer_waiver_student` view joins `transfer_waivers` with `students`, answering: "Which student has this transfer waiver?" The result pairs waiver details with student identity. Waiver `1` (`ForeignExchange`, approved `2023-10-10`) belongs to student `392507`. Waiver `3` (`WardOfCourt`, approved `2025-08-05`) belongs to student `id_16`.

**View `v_transfer_waiver_school`**

```sql
CREATE VIEW v_transfer_waiver_school AS
SELECT a.id, a.waiver_type, a.approval_date, a.approved_by, b.id AS school_id, b.school_name AS school_school_name, b.school_type AS school_school_type
FROM transfer_waivers a JOIN schools b ON a.school_id = b.id;
```

| id | waiver_type | approval_date | approved_by | school_id | school_school_name | school_school_type |
|---|---|---|---|---|---|---|
| 1 | ForeignExchange | 2023-10-10 | regional-approved-54 | 1 | Seasonal Standard | public |
| 2 | AgeOfMajority | 2024-03-21 | legacy-approved-55 | 2 | Integrated Framework | private |
| 3 | WardOfCourt | 2025-08-05 | compact-approved-56 | 3 | Extended Protocol D | parochial |
| 4 | SchoolClosure | 2022-01-16 | composite-approved-57 | 4 | Pilot Programme | public |

The `v_transfer_waiver_school` view joins `transfer_waivers` with `schools`, answering: "At which school is this transfer waiver valid?" The result pairs waiver details with school metadata. Waiver `1` (`ForeignExchange`) is valid at school `1` (`Seasonal Standard`). Waiver `4` (`SchoolClosure`) is valid at school `4` (`Pilot Programme`).

The schema's design reflects a practical compromise between normalisation and query convenience. By embedding foreign keys in both directions between related tables, the model avoids the need for explicit junction tables for the common one-to-one or one-to-many relationships that characterise this domain. Each student has one residence, one school, and one athletic history in the current data, and each residence, school, and athletic history references one student. The views then flatten these relationships into denormalised result sets that answer specific administrative questions without requiring the application layer to construct joins manually. The bidirectional foreign keys — while technically redundant from a pure normalisation standpoint — ensure that every entity can serve as a query entry point, making the schema resilient to changes in access patterns. The twelve views collectively cover all pairwise combinations of the major entities, providing a comprehensive set of materialised perspectives on the student management domain.