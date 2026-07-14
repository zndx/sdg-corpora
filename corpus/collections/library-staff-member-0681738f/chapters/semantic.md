## Domain Modelling and Relational Materialisation

The library management domain captures the organisational fabric of a network of libraries, their staff, the roles those staff occupy, the departments that structure their work, and the public-facing events that connect the institution to external speakers and recurring series. At the conceptual level the domain distinguishes eight entity types: staff members, roles, departments, libraries, events, external speakers, event series, and student assistants. Each entity type materialises as a base table whose columns encode attributes and whose foreign keys encode cardinality-bounded relationships. The resulting schema is normalised to third normal form, and a suite of derived views reconstructs the domain facts that end users and reporting tools need by joining the normalised tables back together. The following sections walk through the base tables, the foreign-key topology, and the view-level reconstructions, grounding every claim in the actual row values.

**Table `library_staff_members`**

| id | staff_id | full_name | start_date | end_date | current_role | employment_status | library_id | role_code | library_staff_member_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 937735 | Theodore Mcgrath | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | distributed-current-42 | active | 1 | 6969430 | 1 |
| 2 | 3158139 | Account Name | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | baseline-current-43 | resigned | 2 | lu_tax_code_template_m16 | 2 |
| 3 | 8189502 | Saipan International Airport | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | pilot-current-44 | retired | 3 | 3158154 | 3 |
| 4 | 69438 | Norma Fisher | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | extended-current-45 | active | 4 | 39800616 | 4 |

The `library_staff_members` table is the central personnel registry. Each row represents one staff member and carries a surrogate primary key `id`, a business identifier `staff_id`, the person's `full_name`, employment dates (`start_date` and `end_date`), a `current_role` label, an `employment_status` flag, and two foreign-key columns: `library_id` pointing to the owning library and `role_code` pointing to the role definition. A tertiary identifier `library_staff_member_id` provides an additional stable reference. The first row records Theodore Mcgrath (business id `937735`), employed at library `1` under role code `6969430`, with status `active`. The second row, for Account Name (business id `3158139`), carries status `resigned` and role code `lu_tax_code_template_m16` at library `2`. The third and fourth rows follow the same pattern, with Saipan International Airport (id `8189502`, retired, role `3158154`, library `3`) and Norma Fisher (id `69438`, active, role `39800616`, library `4`). The `start_date` and `end_date` columns store ISO-8601 timestamps; in the sample data the end dates precede the start dates, which is a data-generation artefact rather than a modelling constraint.

**Table `library_roles`**

| role_code | role_title | department | responsibility_level | library_staff_member_id | library_department_dept_code |
|---|---|---|---|---|---|
| 6969430 | Distributed Standard | Technical Services | 12 | 1 | Takings |
| lu_tax_code_template_m16 | Adaptive Framework D | Public Services | 21 | 2 | 2002007020200 |
| 3158154 | Primary Protocol | Audio-Visual | 30 | 3 | 10966229 |
| 39800616 | Composite Programme | Bibliographic Services | 39 | 4 | 3001009030050 |

The `library_roles` table defines the catalogue of roles that staff members can hold. Its primary key is `role_code`, a string column that doubles as the foreign key referenced from `library_staff_members.role_code`. Each role row carries a human-readable `role_title`, a `department` string, a numeric `responsibility_level`, a foreign key `library_staff_member_id` linking the role back to the staff member who currently occupies it, and a foreign key `library_department_dept_code` pointing to the department that owns the role. The first role, code `6969430`, is titled "Distributed Standard", sits at responsibility level `12`, belongs to the "Technical Services" department, and is linked to staff member `1` and department code `Takings`. The second role, `lu_tax_code_template_m16`, is "Adaptive Framework D" at level `21` in "Public Services", tied to staff member `2` and department `2002007020200`. The remaining two roles—`3158154` ("Primary Protocol", level `30`, "Audio-Visual") and `39800616` ("Composite Programme", level `39`, "Bibliographic Services")—follow the same structure.

**Table `library_departments`**

| dept_code | dept_name | location | role_code | library_id |
|---|---|---|---|---|
| Takings | Legacy Review D | extended-location-99 | 6969430 | 1 |
| 2002007020200 | Regional Initiative | integrated-location-100 | lu_tax_code_template_m16 | 2 |
| 10966229 | Seasonal Model | seasonal-location-101 | 3158154 | 3 |
| 3001009030050 | Integrated Cluster A | regional-location-102 | 39800616 | 4 |

Departments are captured in `library_departments`, keyed by `dept_code`. Each department row stores a `dept_name`, a `location` string, a `role_code` foreign key back to the role table, and a `library_id` foreign key to the owning library. The department `Takings` (name "Legacy Review D", location `extended-location-99`) is associated with role `6969430` and library `1`. The department `2002007020200` ("Regional Initiative", `integrated-location-100`) links to role `lu_tax_code_template_m16` and library `2`. The department `10966229` ("Seasonal Model", `seasonal-location-101`) connects to role `3158154` and library `3`. Finally, `3001009030050` ("Integrated Cluster A", `regional-location-102`) ties to role `39800616` and library `4`. The `role_code` column in this table creates a bidirectional bridge: a department references a role, and the role references a department, forming a mutual dependency that the view layer resolves through self-joins.

**Table `libraries`**

| id | library_id | library_name | institution | established_date | library_staff_member_id | library_department_dept_code | library_event_id |
|---|---|---|---|---|---|---|---|
| 1 | id_17 | Distributed Assessment | baseline-institut-31 | 2024-03-27 | 1 | Takings | 100 |
| 2 | ChIJD7fiBh9u5kcRYJSMaMOCCwQ | Adaptive Survey D | pilot-institut-32 | 2025-08-11 | 2 | 2002007020200 | 101 |
| 3 | 6564374 | Primary Corridor | extended-institut-33 | 2022-01-22 | 3 | 10966229 | 102 |
| 4 | 1437592 | Composite Series | integrated-institut-34 | 2023-06-06 | 4 | 3001009030050 | 103 |

The `libraries` table is the institutional anchor. Its primary key is `id`, and it carries a business `library_id` (e.g., `id_17`, `ChIJD7fiBh9u5kcRYJSMaMOCCwQ`), a `library_name` such as "Distributed Assessment" or "Adaptive Survey D", an `institution` string like `baseline-institut-31`, an `established_date`, and three foreign-key columns: `library_staff_member_id` pointing to the primary staff member, `library_department_dept_code` pointing to the primary department, and `library_event_id` pointing to a primary event. The first library, id `1`, is "Distributed Assessment", established on `2024-03-27`, linked to staff member `1`, department `Takings`, and event `100`. The second library, id `2`, is "Adaptive Survey D" (established `2025-08-11`), linked to staff member `2`, department `2002007020200`, and event `101`. The third and fourth libraries—"Primary Corridor" (id `3`, established `2022-01-22`) and "Composite Series" (id `4`, established `2023-06-06`)—complete the set with analogous linkages.

**Table `library_events`**

| id | event_id | event_name | event_date | event_time | location | series_name | library_id | external_speaker_id | event_series_id |
|---|---|---|---|---|---|---|---|---|---|
| 100 | 2002007020060 | Seasonal Standard | 2025-04-15T15:21:00 | extended-event-15 | extended-location-99 | Extended Survey | 1 | 1 | 1 |
| 101 | 168535 | Integrated Framework | 2022-09-26T22:38:00 | integrated-event-16 | integrated-location-100 | Pilot Corridor A | 2 | 2 | 2 |
| 102 | ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 | Extended Protocol D | 2023-02-10T05:55:00 | seasonal-event-17 | seasonal-location-101 | Baseline Series | 3 | 3 | 3 |
| 103 | 1186089 | Pilot Programme | 2024-07-21T12:12:00 | regional-event-18 | regional-location-102 | Distributed Assessment | 4 | 4 | 4 |

Events are recorded in `library_events`, keyed by `id`. Each event row stores a business `event_id` (which can be numeric or UUID, as seen in row 3 with `ab8e1d18-8fcd-11eb-924d-9cd76263cbd0`), an `event_name`, an `event_date` and `event_time` (together forming a timestamp), a `location` string, a `series_name`, a `library_id` foreign key, an `external_speaker_id` foreign key, and an `event_series_id` foreign key. The first event, id `100`, is "Seasonal Standard" held on `2025-04-15T15:21:00` at `extended-location-99`, part of the "Extended Survey" series, at library `1`, with external speaker `1` and event series `1`. The second event, id `101`, is "Integrated Framework" (`2022-09-26T22:38:00`, `integrated-location-100`, "Pilot Corridor A", library `2`, speaker `2`, series `2`). The third event carries a UUID business id and is named "Extended Protocol D" (`2023-02-10T05:55:00`, library `3`, speaker `3`, series `3`). The fourth event, id `103`, is "Pilot Programme" (`2024-07-21T12:12:00`, library `4`, speaker `4`, series `4`).

**Table `external_speakers`**

| external_speaker_id | speaker_id | full_name | affiliation | expertise | library_event_id |
|---|---|---|---|---|---|
| 1 | 884355 | Theodore Mcgrath | baseline-affiliat-55 | composite-expertis-81 | 100 |
| 2 | 4060644 | Account Name | pilot-affiliat-56 | primary-expertis-82 | 101 |
| 3 | 3775 | Saipan International Airport | extended-affiliat-57 | adaptive-expertis-83 | 102 |
| 4 | 13195 | Norma Fisher | integrated-affiliat-58 | distributed-expertis-84 | 103 |

External speakers are modelled in `external_speakers`, keyed by `external_speaker_id`. Each row stores a business `speaker_id`, a `full_name`, an `affiliation` string, an `expertise` string, and a foreign key `library_event_id` linking the speaker to the event they are presenting at. Speaker `1` (business id `884355`, name "Theodore Mcgrath", affiliation `baseline-affiliat-55`, expertise `composite-expertis-81`) is assigned to event `100`. Speaker `2` (business id `4060644`, "Account Name", `pilot-affiliat-56`, `primary-expertis-82`) to event `101`. Speaker `3` (business id `3775`, "Saipan International Airport", `extended-affiliat-57`, `adaptive-expertis-83`) to event `102`. Speaker `4` (business id `13195`, "Norma Fisher", `integrated-affiliat-58`, `distributed-expertis-84`) to event `103`.

**Table `event_serieses`**

| id | series_id | series_name | frequency | library_event_id | library_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|
| 1 | 937729 | Extended Survey | monthly | 100 | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | id_28 | Pilot Corridor A | quarterly | 101 | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | 157 | Baseline Series | annual | 102 | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | 6926352 | Distributed Assessment | monthly | 103 | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Event series are captured in `event_serieses`. The table is keyed by `id` and carries a `series_name`, an `event_id` foreign key linking the series to a representative event, and a `library_id` foreign key linking the series to the owning library. The first series, id `1`, is named "Extended Survey", associated with event `100` and library `1`. The second series, id `2`, is "Pilot Corridor A" (event `101`, library `2`). The third series, id `3`, is "Baseline Series" (event `102`, library `3`). The fourth series, id `4`, is "Distributed Assessment" (event `103`, library `4`).

**Table `student_assistants`**

| student_assistant_id | student_id | full_name | major | graduation_year | employment_status | library_id | role_code | library_staff_member_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 392507 | Theodore Mcgrath | primary-major-94 | 38 | active | 1 | 6969430 | 1 |
| 2 | 25388256 | Account Name | adaptive-major-95 | 45 | graduated | 2 | lu_tax_code_template_m16 | 2 |
| 3 | id_16 | Saipan International Airport | distributed-major-96 | 52 | resigned | 3 | 3158154 | 3 |
| 4 | gd_taxc_2211 | Norma Fisher | baseline-major-97 | 59 | active | 4 | 39800616 | 4 |

Student assistants are recorded in `student_assistants`, keyed by `id`. Each row stores a `student_id`, a `full_name`, an `employment_status`, a `library_id` foreign key, a `role_code` foreign key, and a `library_staff_member_id` foreign key. The first student assistant (id `1`, student id `937735`, name "Theodore Mcgrath", status `active`) is linked to library `1`, role `6969430`, and staff member `1`. The second (id `2`, student id `3158139`, "Account Name", `resigned`) to library `2`, role `lu_tax_code_template_m16`, staff member `2`. The third (id `3`, student id `8189502`, "Saipan International Airport", `retired`) to library `3`, role `3158154`, staff member `3`. The fourth (id `4`, student id `69438`, "Norma Fisher", `active`) to library `4`, role `39800616`, staff member `4`.

The foreign-key topology across the eight base tables forms a star-and-chain pattern. The `libraries` table sits at the centre, with foreign keys pointing to `library_staff_members` (via `library_staff_member_id`), `library_departments` (via `library_department_dept_code`), and `library_events` (via `library_event_id`). The `library_staff_members` table points to `libraries` (via `library_id`) and `library_roles` (via `role_code`). The `library_roles` table points back to `library_staff_members` (via `library_staff_member_id`) and to `library_departments` (via `library_department_dept_code`). The `library_departments` table points to `library_roles` (via `role_code`) and to `libraries` (via `library_id`). The `library_events` table points to `libraries` (via `library_id`), `external_speakers` (via `external_speaker_id`), and `event_serieses` (via `event_series_id`). The `external_speakers` table points to `library_events` (via `library_event_id`). The `event_serieses` table points to `library_events` (via `event_id`) and to `libraries` (via `library_id`). The `student_assistants` table points to `libraries` (via `library_id`), `library_roles` (via `role_code`), and `library_staff_members` (via `library_staff_member_id`). This web of references ensures that every fact can be reconstructed through joins, and the view layer provides those joins as named, reusable queries.

**View `library_staff_member_library_view`**

```sql
CREATE VIEW library_staff_member_library_view AS
SELECT a.id, a.staff_id, a.full_name, a.start_date, b.id AS library_id, b.library_id AS library_library_id, b.library_name AS library_library_name
FROM library_staff_members a JOIN libraries b ON a.library_id = b.id;
```

| id | staff_id | full_name | start_date | library_id | library_library_id | library_library_name |
|---|---|---|---|---|---|---|
| 1 | 937735 | Theodore Mcgrath | 2022-09-05T20:24:00 | 1 | id_17 | Distributed Assessment |
| 2 | 3158139 | Account Name | 2023-02-16T03:41:00 | 2 | ChIJD7fiBh9u5kcRYJSMaMOCCwQ | Adaptive Survey D |
| 3 | 8189502 | Saipan International Airport | 2024-07-27T10:58:00 | 3 | 6564374 | Primary Corridor |
| 4 | 69438 | Norma Fisher | 2025-12-11T17:15:00 | 4 | 1437592 | Composite Series |

The view `library_staff_member_library_view` joins `library_staff_members` to `libraries` on `library_staff_members.library_id = libraries.id`. It answers the question: "Which library does each staff member belong to?" Reading the first row, Theodore Mcgrath (staff id `937735`) is employed at the library identified as `id_17` ("Distributed Assessment"). The second row shows Account Name (staff id `3158139`) at library `ChIJD7fiBh9u5kcRYJSMaMOCCwQ` ("Adaptive Survey D"). The view effectively flattens the one-to-many relationship between libraries and their staff into a single denormalised row per staff member.

**View `library_staff_member_library_role_view`**

```sql
CREATE VIEW library_staff_member_library_role_view AS
SELECT a.id, a.staff_id, a.full_name, a.start_date, b.role_code AS role_role_code, b.role_title AS role_role_title, b.department AS role_department
FROM library_staff_members a JOIN library_roles b ON a.role_code = b.role_code;
```

| id | staff_id | full_name | start_date | role_role_code | role_role_title | role_department |
|---|---|---|---|---|---|---|
| 1 | 937735 | Theodore Mcgrath | 2022-09-05T20:24:00 | 6969430 | Distributed Standard | Technical Services |
| 2 | 3158139 | Account Name | 2023-02-16T03:41:00 | lu_tax_code_template_m16 | Adaptive Framework D | Public Services |
| 3 | 8189502 | Saipan International Airport | 2024-07-27T10:58:00 | 3158154 | Primary Protocol | Audio-Visual |
| 4 | 69438 | Norma Fisher | 2025-12-11T17:15:00 | 39800616 | Composite Programme | Bibliographic Services |

The view `library_staff_member_library_role_view` joins `library_staff_members` to `library_roles` on `library_staff_members.role_code = library_roles.role_code`. It answers: "What role does each staff member hold?" The first row pairs Theodore Mcgrath with role code `6969430`, titled "Distributed Standard" at responsibility level `12`. The second row pairs Account Name with role code `lu_tax_code_template_m16`, titled "Adaptive Framework D" at level `21`. This view materialises the many-to-one relationship between staff members and roles.

**View `library_staff_member_library_staff_member_view`**

```sql
CREATE VIEW library_staff_member_library_staff_member_view AS
SELECT a.id, a.staff_id, a.full_name, a.start_date, b.id AS member_id, b.staff_id AS member_staff_id, b.full_name AS member_full_name
FROM library_staff_members a JOIN library_staff_members b ON a.library_staff_member_id = b.id;
```

| id | staff_id | full_name | start_date | member_id | member_staff_id | member_full_name |
|---|---|---|---|---|---|---|
| 1 | 937735 | Theodore Mcgrath | 2022-09-05T20:24:00 | 1 | 937735 | Theodore Mcgrath |
| 2 | 3158139 | Account Name | 2023-02-16T03:41:00 | 2 | 3158139 | Account Name |
| 3 | 8189502 | Saipan International Airport | 2024-07-27T10:58:00 | 3 | 8189502 | Saipan International Airport |
| 4 | 69438 | Norma Fisher | 2025-12-11T17:15:00 | 4 | 69438 | Norma Fisher |

The view `library_staff_member_library_staff_member_view` performs a self-join on `library_staff_members`, matching `library_staff_members.library_id` to another instance of `library_staff_members.id`. It answers: "Which staff members share the same library?" The first row links staff member `1` (Theodore Mcgrath) to staff member `1` (himself), and the second row links staff member `2` (Account Name) to staff member `2`. In a richer dataset this view would surface co-located colleagues; in the sample data each staff member is the sole occupant of their respective library, so the join is reflexive.

**View `library_role_library_staff_member_view`**

```sql
CREATE VIEW library_role_library_staff_member_view AS
SELECT a.role_code, a.role_title, a.department, a.responsibility_level, b.id AS member_id, b.staff_id AS member_staff_id, b.full_name AS member_full_name
FROM library_roles a JOIN library_staff_members b ON a.library_staff_member_id = b.id;
```

| role_code | role_title | department | responsibility_level | member_id | member_staff_id | member_full_name |
|---|---|---|---|---|---|---|
| 6969430 | Distributed Standard | Technical Services | 12 | 1 | 937735 | Theodore Mcgrath |
| lu_tax_code_template_m16 | Adaptive Framework D | Public Services | 21 | 2 | 3158139 | Account Name |
| 3158154 | Primary Protocol | Audio-Visual | 30 | 3 | 8189502 | Saipan International Airport |
| 39800616 | Composite Programme | Bibliographic Services | 39 | 4 | 69438 | Norma Fisher |

The view `library_role_library_staff_member_view` joins `library_roles` to `library_staff_members` on `library_roles.library_staff_member_id = library_staff_members.id`. It answers: "Which staff member currently occupies each role?" The first row shows role `6969430` ("Distributed Standard") occupied by staff member `1` (Theodore Mcgrath). The second row shows role `lu_tax_code_template_m16` ("Adaptive Framework D") occupied by staff member `2` (Account Name). This view inverts the direction of the foreign key from `library_staff_members.role_code` to `library_roles.library_staff_member_id`, providing a role-centric perspective.

**View `library_role_library_department_view`**

```sql
CREATE VIEW library_role_library_department_view AS
SELECT a.role_code, a.role_title, a.department, a.responsibility_level, b.dept_code AS department_dept_code, b.dept_name AS department_dept_name, b.location AS department_location
FROM library_roles a JOIN library_departments b ON a.library_department_dept_code = b.dept_code;
```

| role_code | role_title | department | responsibility_level | department_dept_code | department_dept_name | department_location |
|---|---|---|---|---|---|---|
| 6969430 | Distributed Standard | Technical Services | 12 | Takings | Legacy Review D | extended-location-99 |
| lu_tax_code_template_m16 | Adaptive Framework D | Public Services | 21 | 2002007020200 | Regional Initiative | integrated-location-100 |
| 3158154 | Primary Protocol | Audio-Visual | 30 | 10966229 | Seasonal Model | seasonal-location-101 |
| 39800616 | Composite Programme | Bibliographic Services | 39 | 3001009030050 | Integrated Cluster A | regional-location-102 |

The view `library_role_library_department_view` joins `library_roles` to `library_departments` on `library_roles.library_department_dept_code = library_departments.dept_code`. It answers: "Which department owns each role?" The first row links role `6969430` ("Distributed Standard") to department `Takings` ("Legacy Review D"). The second row links role `lu_tax_code_template_m16` ("Adaptive Framework D") to department `2002007020200` ("Regional Initiative"). The third row links role `3158154` ("Primary Protocol") to department `10966229` ("Seasonal Model"). The fourth row links role `39800616` ("Composite Programme") to department `3001009030050` ("Integrated Cluster A").

**View `library_department_library_role_view`**

```sql
CREATE VIEW library_department_library_role_view AS
SELECT a.dept_code, a.dept_name, a.location, a.library_id, b.role_code AS role_role_code, b.role_title AS role_role_title, b.department AS role_department
FROM library_departments a JOIN library_roles b ON a.role_code = b.role_code;
```

| dept_code | dept_name | location | library_id | role_role_code | role_role_title | role_department |
|---|---|---|---|---|---|---|
| Takings | Legacy Review D | extended-location-99 | 1 | 6969430 | Distributed Standard | Technical Services |
| 2002007020200 | Regional Initiative | integrated-location-100 | 2 | lu_tax_code_template_m16 | Adaptive Framework D | Public Services |
| 10966229 | Seasonal Model | seasonal-location-101 | 3 | 3158154 | Primary Protocol | Audio-Visual |
| 3001009030050 | Integrated Cluster A | regional-location-102 | 4 | 39800616 | Composite Programme | Bibliographic Services |

The view `library_department_library_role_view` joins `library_departments` to `library_roles` on `library_departments.role_code = library_roles.role_code`. It answers: "Which role is associated with each department?" The first row shows department `Takings` associated with role `6969430` ("Distributed Standard"). The second row shows department `2002007020200` associated with role `lu_tax_code_template_m16` ("Adaptive Framework D"). This view complements the previous one by presenting the department-first perspective of the same mutual relationship.

**View `library_department_library_view`**

```sql
CREATE VIEW library_department_library_view AS
SELECT a.dept_code, a.dept_name, a.location, a.role_code, b.id AS library_id, b.library_id AS library_library_id, b.library_name AS library_library_name
FROM library_departments a JOIN libraries b ON a.library_id = b.id;
```

| dept_code | dept_name | location | role_code | library_id | library_library_id | library_library_name |
|---|---|---|---|---|---|---|
| Takings | Legacy Review D | extended-location-99 | 6969430 | 1 | id_17 | Distributed Assessment |
| 2002007020200 | Regional Initiative | integrated-location-100 | lu_tax_code_template_m16 | 2 | ChIJD7fiBh9u5kcRYJSMaMOCCwQ | Adaptive Survey D |
| 10966229 | Seasonal Model | seasonal-location-101 | 3158154 | 3 | 6564374 | Primary Corridor |
| 3001009030050 | Integrated Cluster A | regional-location-102 | 39800616 | 4 | 1437592 | Composite Series |

The view `library_department_library_view` joins `library_departments` to `libraries` on `library_departments.library_id = libraries.id`. It answers: "Which library does each department belong to?" The first row links department `Takings` to library `1` ("Distributed Assessment"). The second row links department `2002007020200` to library `2` ("Adaptive Survey D"). The third row links department `10966229` to library `3` ("Primary Corridor"). The fourth row links department `3001009030050` to library `4` ("Composite Series").

**View `library_library_staff_member_view`**

```sql
CREATE VIEW library_library_staff_member_view AS
SELECT a.id, a.library_id, a.library_name, a.institution, b.id AS member_id, b.staff_id AS member_staff_id, b.full_name AS member_full_name
FROM libraries a JOIN library_staff_members b ON a.library_staff_member_id = b.id;
```

| id | library_id | library_name | institution | member_id | member_staff_id | member_full_name |
|---|---|---|---|---|---|---|
| 1 | id_17 | Distributed Assessment | baseline-institut-31 | 1 | 937735 | Theodore Mcgrath |
| 2 | ChIJD7fiBh9u5kcRYJSMaMOCCwQ | Adaptive Survey D | pilot-institut-32 | 2 | 3158139 | Account Name |
| 3 | 6564374 | Primary Corridor | extended-institut-33 | 3 | 8189502 | Saipan International Airport |
| 4 | 1437592 | Composite Series | integrated-institut-34 | 4 | 69438 | Norma Fisher |

The view `library_library_staff_member_view` joins `libraries` to `library_staff_members` on `libraries.library_staff_member_id = library_staff_members.id`. It answers: "Which staff member is the primary contact for each library?" The first row shows library `1` ("Distributed Assessment") with primary staff member `1` (Theodore Mcgrath). The second row shows library `2` ("Adaptive Survey D") with primary staff member `2` (Account Name). The third and fourth rows follow the same pattern for libraries `3` and `4`.

**View `library_library_department_view`**

```sql
CREATE VIEW library_library_department_view AS
SELECT a.id, a.library_id, a.library_name, a.institution, b.dept_code AS department_dept_code, b.dept_name AS department_dept_name, b.location AS department_location
FROM libraries a JOIN library_departments b ON a.library_department_dept_code = b.dept_code;
```

| id | library_id | library_name | institution | department_dept_code | department_dept_name | department_location |
|---|---|---|---|---|---|---|
| 1 | id_17 | Distributed Assessment | baseline-institut-31 | Takings | Legacy Review D | extended-location-99 |
| 2 | ChIJD7fiBh9u5kcRYJSMaMOCCwQ | Adaptive Survey D | pilot-institut-32 | 2002007020200 | Regional Initiative | integrated-location-100 |
| 3 | 6564374 | Primary Corridor | extended-institut-33 | 10966229 | Seasonal Model | seasonal-location-101 |
| 4 | 1437592 | Composite Series | integrated-institut-34 | 3001009030050 | Integrated Cluster A | regional-location-102 |

The view `library_library_department_view` joins `libraries` to `library_departments` on `libraries.library_department_dept_code = library_departments.dept_code`. It answers: "Which department is the primary department for each library?" The first row links library `1` ("Distributed Assessment") to department `Takings` ("Legacy Review D"). The second row links library `2` ("Adaptive Survey D") to department `2002007020200" ("Regional Initiative"). The third row links library `3` ("Primary Corridor") to department `10966229` ("Seasonal Model"). The fourth row links library `4` ("Composite Series") to department `3001009030050` ("Integrated Cluster A").

**View `library_library_event_view`**

```sql
CREATE VIEW library_library_event_view AS
SELECT a.id, a.library_id, a.library_name, a.institution, b.id AS event_id, b.event_id AS event_event_id, b.event_name AS event_event_name
FROM libraries a JOIN library_events b ON a.library_event_id = b.id;
```

| id | library_id | library_name | institution | event_id | event_event_id | event_event_name |
|---|---|---|---|---|---|---|
| 1 | id_17 | Distributed Assessment | baseline-institut-31 | 100 | 2002007020060 | Seasonal Standard |
| 2 | ChIJD7fiBh9u5kcRYJSMaMOCCwQ | Adaptive Survey D | pilot-institut-32 | 101 | 168535 | Integrated Framework |
| 3 | 6564374 | Primary Corridor | extended-institut-33 | 102 | ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 | Extended Protocol D |
| 4 | 1437592 | Composite Series | integrated-institut-34 | 103 | 1186089 | Pilot Programme |

The view `library_library_event_view` joins `libraries` to `library_events` on `libraries.library_event_id = library_events.id`. It answers: "Which event is the primary event for each library?" The first row links library `1` ("Distributed Assessment") to event `100` ("Seasonal Standard"). The second row links library `2` ("Adaptive Survey D") to event `101` ("Integrated Framework"). The third row links library `3` ("Primary Corridor") to event `102` ("Extended Protocol D"). The fourth row links library `4` ("Composite Series") to event `103` ("Pilot Programme").

**View `library_event_library_view`**

```sql
CREATE VIEW library_event_library_view AS
SELECT a.id, a.event_id, a.event_name, a.event_date, b.id AS library_id, b.library_id AS library_library_id, b.library_name AS library_library_name
FROM library_events a JOIN libraries b ON a.library_id = b.id;
```

| id | event_id | event_name | event_date | library_id | library_library_id | library_library_name |
|---|---|---|---|---|---|---|
| 100 | 2002007020060 | Seasonal Standard | 2025-04-15T15:21:00 | 1 | id_17 | Distributed Assessment |
| 101 | 168535 | Integrated Framework | 2022-09-26T22:38:00 | 2 | ChIJD7fiBh9u5kcRYJSMaMOCCwQ | Adaptive Survey D |
| 102 | ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 | Extended Protocol D | 2023-02-10T05:55:00 | 3 | 6564374 | Primary Corridor |
| 103 | 1186089 | Pilot Programme | 2024-07-21T12:12:00 | 4 | 1437592 | Composite Series |

The view `library_event_library_view` joins `library_events` to `libraries` on `library_events.library_id = libraries.id`. It answers: "Which library hosts each event?" The first row shows event `100` ("Seasonal Standard") hosted at library `1` ("Distributed Assessment"). The second row shows event `101` ("Integrated Framework") at library `2` ("Adaptive Survey D"). The third row shows event `102` ("Extended Protocol D") at library `3` ("Primary Corridor"). The fourth row shows event `103` ("Pilot Programme") at library `4` ("Composite Series").

**View `library_event_external_speaker_view`**

```sql
CREATE VIEW library_event_external_speaker_view AS
SELECT a.id, a.event_id, a.event_name, a.event_date, b.external_speaker_id AS speaker_external_speaker_id, b.speaker_id AS speaker_speaker_id, b.full_name AS speaker_full_name
FROM library_events a JOIN external_speakers b ON a.external_speaker_id = b.external_speaker_id;
```

| id | event_id | event_name | event_date | speaker_external_speaker_id | speaker_speaker_id | speaker_full_name |
|---|---|---|---|---|---|---|
| 100 | 2002007020060 | Seasonal Standard | 2025-04-15T15:21:00 | 1 | 884355 | Theodore Mcgrath |
| 101 | 168535 | Integrated Framework | 2022-09-26T22:38:00 | 2 | 4060644 | Account Name |
| 102 | ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 | Extended Protocol D | 2023-02-10T05:55:00 | 3 | 3775 | Saipan International Airport |
| 103 | 1186089 | Pilot Programme | 2024-07-21T12:12:00 | 4 | 13195 | Norma Fisher |

The view `library_event_external_speaker_view` joins `library_events` to `external_speakers` on `library_events.external_speaker_id = external_speakers.external_speaker_id`. It answers: "Which external speaker is presenting at each event?" The first row pairs event `100` ("Seasonal Standard") with speaker `1` (Theodore Mcgrath, affiliation `baseline-affiliat-55`, expertise `composite-expertis-81`). The second row pairs event `101` ("Integrated Framework") with speaker `2` (Account Name, `pilot-affiliat-56`, `primary-expertis-82`). The third row pairs event `102` ("Extended Protocol D") with speaker `3` (Saipan International Airport, `extended-affiliat-57`, `adaptive-expertis-83`). The fourth row pairs event `103` ("Pilot Programme") with speaker `4` (Norma Fisher, `integrated-affiliat-58`, `distributed-expertis-84`).

**View `library_event_event_series_view`**

```sql
CREATE VIEW library_event_event_series_view AS
SELECT a.id, a.event_id, a.event_name, a.event_date, b.id AS series_id, b.series_id AS series_series_id, b.series_name AS series_series_name
FROM library_events a JOIN event_serieses b ON a.event_series_id = b.id;
```

| id | event_id | event_name | event_date | series_id | series_series_id | series_series_name |
|---|---|---|---|---|---|---|
| 100 | 2002007020060 | Seasonal Standard | 2025-04-15T15:21:00 | 1 | 937729 | Extended Survey |
| 101 | 168535 | Integrated Framework | 2022-09-26T22:38:00 | 2 | id_28 | Pilot Corridor A |
| 102 | ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 | Extended Protocol D | 2023-02-10T05:55:00 | 3 | 157 | Baseline Series |
| 103 | 1186089 | Pilot Programme | 2024-07-21T12:12:00 | 4 | 6926352 | Distributed Assessment |

The view `library_event_event_series_view` joins `library_events` to `event_serieses` on `library_events.event_series_id = event_serieses.id`. It answers: "Which event series does each event belong to?" The first row links event `100` ("Seasonal Standard") to series `1` ("Extended Survey"). The second row links event `101` ("Integrated Framework") to series `2` ("Pilot Corridor A"). The third row links event `102` ("Extended Protocol D") to series `3` ("Baseline Series"). The fourth row links event `103` ("Pilot Programme") to series `4` ("Distributed Assessment").

**View `external_speaker_library_event_view`**

```sql
CREATE VIEW external_speaker_library_event_view AS
SELECT a.external_speaker_id, a.speaker_id, a.full_name, a.affiliation, b.id AS event_id, b.event_id AS event_event_id, b.event_name AS event_event_name
FROM external_speakers a JOIN library_events b ON a.library_event_id = b.id;
```

| external_speaker_id | speaker_id | full_name | affiliation | event_id | event_event_id | event_event_name |
|---|---|---|---|---|---|---|
| 1 | 884355 | Theodore Mcgrath | baseline-affiliat-55 | 100 | 2002007020060 | Seasonal Standard |
| 2 | 4060644 | Account Name | pilot-affiliat-56 | 101 | 168535 | Integrated Framework |
| 3 | 3775 | Saipan International Airport | extended-affiliat-57 | 102 | ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 | Extended Protocol D |
| 4 | 13195 | Norma Fisher | integrated-affiliat-58 | 103 | 1186089 | Pilot Programme |

The view `external_speaker_library_event_view` joins `external_speakers` to `library_events` on `external_speakers.library_event_id = library_events.id`. It answers: "At which event is each external speaker presenting?" The first row shows speaker `1` (Theodore Mcgrath) presenting at event `100` ("Seasonal Standard"). The second row shows speaker `2` (Account Name) at event `101` ("Integrated Framework"). The third row shows speaker `3` (Saipan International Airport) at event `102` ("Extended Protocol D"). The fourth row shows speaker `4` (Norma Fisher) at event `103` ("Pilot Programme"). This view inverts the foreign-key direction from `library_events.external_speaker_id` to `external_speakers.library_event_id`.

**View `event_series_library_event_view`**

```sql
CREATE VIEW event_series_library_event_view AS
SELECT a.id, a.series_id, a.series_name, a.frequency, b.id AS event_id, b.event_id AS event_event_id, b.event_name AS event_event_name
FROM event_serieses a JOIN library_events b ON a.library_event_id = b.id;
```

| id | series_id | series_name | frequency | event_id | event_event_id | event_event_name |
|---|---|---|---|---|---|---|
| 1 | 937729 | Extended Survey | monthly | 100 | 2002007020060 | Seasonal Standard |
| 2 | id_28 | Pilot Corridor A | quarterly | 101 | 168535 | Integrated Framework |
| 3 | 157 | Baseline Series | annual | 102 | ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 | Extended Protocol D |
| 4 | 6926352 | Distributed Assessment | monthly | 103 | 1186089 | Pilot Programme |

The view `event_series_library_event_view` joins `event_serieses` to `library_events` on `event_serieses.event_id = library_events.id`. It answers: "Which event is the representative event for each series?" The first row links series `1` ("Extended Survey") to event `100` ("Seasonal Standard"). The second row links series `2` ("Pilot Corridor A") to event `101` ("Integrated Framework"). The third row links series `3` ("Baseline Series") to event `102` ("Extended Protocol D"). The fourth row links series `4` ("Distributed Assessment") to event `103` ("Pilot Programme").

**View `event_series_library_view`**

```sql
CREATE VIEW event_series_library_view AS
SELECT a.id, a.series_id, a.series_name, a.frequency, b.id AS library_id, b.library_id AS library_library_id, b.library_name AS library_library_name
FROM event_serieses a JOIN libraries b ON a.library_id = b.id;
```

| id | series_id | series_name | frequency | library_id | library_library_id | library_library_name |
|---|---|---|---|---|---|---|
| 1 | 937729 | Extended Survey | monthly | 1 | id_17 | Distributed Assessment |
| 2 | id_28 | Pilot Corridor A | quarterly | 2 | ChIJD7fiBh9u5kcRYJSMaMOCCwQ | Adaptive Survey D |
| 3 | 157 | Baseline Series | annual | 3 | 6564374 | Primary Corridor |
| 4 | 6926352 | Distributed Assessment | monthly | 4 | 1437592 | Composite Series |

The view `event_series_library_view` joins `event_serieses` to `libraries` on `event_serieses.library_id = libraries.id`. It answers: "Which library owns each event series?" The first row links series `1` ("Extended Survey") to library `1` ("Distributed Assessment"). The second row links series `2` ("Pilot Corridor A") to library `2` ("Adaptive Survey D"). The third row links series `3` ("Baseline Series") to library `3` ("Primary Corridor"). The fourth row links series `4` ("Distributed Assessment") to library `4` ("Composite Series").

**View `student_assistant_library_view`**

```sql
CREATE VIEW student_assistant_library_view AS
SELECT a.student_assistant_id, a.student_id, a.full_name, a.major, b.id AS library_id, b.library_id AS library_library_id, b.library_name AS library_library_name
FROM student_assistants a JOIN libraries b ON a.library_id = b.id;
```

| student_assistant_id | student_id | full_name | major | library_id | library_library_id | library_library_name |
|---|---|---|---|---|---|---|
| 1 | 392507 | Theodore Mcgrath | primary-major-94 | 1 | id_17 | Distributed Assessment |
| 2 | 25388256 | Account Name | adaptive-major-95 | 2 | ChIJD7fiBh9u5kcRYJSMaMOCCwQ | Adaptive Survey D |
| 3 | id_16 | Saipan International Airport | distributed-major-96 | 3 | 6564374 | Primary Corridor |
| 4 | gd_taxc_2211 | Norma Fisher | baseline-major-97 | 4 | 1437592 | Composite Series |

The view `student_assistant_library_view` joins `student_assistants` to `libraries` on `student_assistants.library_id = libraries.id`. It answers: "Which library employs each student assistant?" The first row links student assistant `1` (Theodore Mcgrath) to library `1` ("Distributed Assessment"). The second row links student assistant `2` (Account Name) to library `2` ("Adaptive Survey D"). The third row links student assistant `3` (Saipan International Airport) to library `3` ("Primary Corridor"). The fourth row links student assistant `4` (Norma Fisher) to library `4` ("Composite Series").

**View `student_assistant_library_role_view`**

```sql
CREATE VIEW student_assistant_library_role_view AS
SELECT a.student_assistant_id, a.student_id, a.full_name, a.major, b.role_code AS role_role_code, b.role_title AS role_role_title, b.department AS role_department
FROM student_assistants a JOIN library_roles b ON a.role_code = b.role_code;
```

| student_assistant_id | student_id | full_name | major | role_role_code | role_role_title | role_department |
|---|---|---|---|---|---|---|
| 1 | 392507 | Theodore Mcgrath | primary-major-94 | 6969430 | Distributed Standard | Technical Services |
| 2 | 25388256 | Account Name | adaptive-major-95 | lu_tax_code_template_m16 | Adaptive Framework D | Public Services |
| 3 | id_16 | Saipan International Airport | distributed-major-96 | 3158154 | Primary Protocol | Audio-Visual |
| 4 | gd_taxc_2211 | Norma Fisher | baseline-major-97 | 39800616 | Composite Programme | Bibliographic Services |

The view `student_assistant_library_role_view` joins `student_assistants` to `library_roles` on `student_assistants.role_code = library_roles.role_code`. It answers: "What role does each student assistant hold?" The first row links student assistant `1` to role `6969430` ("Distributed Standard"). The second row links student assistant `2` to role `lu_tax_code_template_m16` ("Adaptive Framework D"). The third row links student assistant `3` to role `3158154` ("Primary Protocol"). The fourth row links student assistant `4` to role `39800616` ("Composite Programme").

**View `student_assistant_library_staff_member_view`**

```sql
CREATE VIEW student_assistant_library_staff_member_view AS
SELECT a.student_assistant_id, a.student_id, a.full_name, a.major, b.id AS member_id, b.staff_id AS member_staff_id, b.full_name AS member_full_name
FROM student_assistants a JOIN library_staff_members b ON a.library_staff_member_id = b.id;
```

| student_assistant_id | student_id | full_name | major | member_id | member_staff_id | member_full_name |
|---|---|---|---|---|---|---|
| 1 | 392507 | Theodore Mcgrath | primary-major-94 | 1 | 937735 | Theodore Mcgrath |
| 2 | 25388256 | Account Name | adaptive-major-95 | 2 | 3158139 | Account Name |
| 3 | id_16 | Saipan International Airport | distributed-major-96 | 3 | 8189502 | Saipan International Airport |
| 4 | gd_taxc_2211 | Norma Fisher | baseline-major-97 | 4 | 69438 | Norma Fisher |

The view `student_assistant_library_staff_member_view` joins `student_assistants` to `library_staff_members` on `student_assistants.library_staff_member_id = library_staff_members.id`. It answers: "Which staff member is associated with each student assistant?" The first row links student assistant `1` (Theodore Mcgrath) to staff member `1` (Theodore Mcgrath). The second row links student assistant `2` (Account Name) to staff member `2` (Account Name). The third row links student assistant `3` (Saipan International Airport) to staff member `3` (Saipan International Airport). The fourth row links student assistant `4` (Norma Fisher) to staff member `4` (Norma Fisher). In the sample data the student assistants share names and identifiers with the staff members, suggesting a one-to-one overlap in this synthetic dataset; in production the view would surface distinct individuals.

The relational materialisation of this domain achieves a clean separation between entity definitions and relationship instances. Each base table holds exactly one row per entity, with foreign keys encoding the cardinality constraints: a staff member holds one role at a time (many-to-one), a department belongs to one library (many-to-one), an event is hosted by one library and features one speaker and belongs to one series (all many-to-one). The views then reassemble these constraints into the flat, question-oriented projections that analysts and dashboards consume. Every view is a single join between two base tables, which means that the join cost is bounded and the result is deterministic. The schema supports straightforward extension: adding a new library requires a row in `libraries` and optionally rows in `library_staff_members`, `library_departments`, and `library_events` that reference the new library's id. Adding a new event series requires a row in `event_serieses` and a row in `library_events` that reference the new series's id. The mutual foreign keys between `library_roles` and `library_departments` (role → department and department → role) form a tight coupling that the view layer resolves through two complementary views (`library_role_library_department_view` and `library_department_library_role_view`), each answering the same underlying question from a different orientation. This bidirectional pattern is repeated across the schema wherever two entities have a reciprocal relationship, ensuring that no fact is accessible from only one direction. The result is a schema that is both normalised for update efficiency and fully reconstructible through the view layer for read efficiency—a classic trade-off resolved by the deliberate placement of foreign keys and the systematic naming of join views.