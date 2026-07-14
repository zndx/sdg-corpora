# Organizational Records in Library Operations

Modern library systems maintain a structured ledger of personnel, departments, events, and external partnerships. The records captured here describe how staff members are assigned to roles, how those roles map to departments, and how departments anchor to individual library branches. Events—ranging from single-day programs to recurring series—bring together staff, departments, and external speakers under a unified scheduling framework. Student assistants round out the operational picture, providing supplementary support across libraries, roles, and staff assignments. Understanding these records requires tracing the relationships between people, positions, places, and programs, each linked by explicit foreign keys that preserve the integrity of the organizational graph.

## Staff Members and Their Assignments

The foundation of the organizational model rests on the staff member records, which capture employment details, role assignments, and branch affiliations. Each entry carries a unique identifier, a staff number, a full name, and a start date that anchors the employment timeline. An end date is also recorded, though in several cases it precedes the start date—a data artifact that signals incomplete lifecycle processing rather than a logical impossibility. The current role field encodes a categorical label such as `distributed-current-42` or `baseline-current-43`, while the employment status distinguishes between active, resigned, and retired personnel.

**Table `library_staff_members`**

| id | staff_id | full_name | start_date | end_date | current_role | employment_status | library_id | role_code | library_staff_member_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 937735 | Theodore Mcgrath | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | distributed-current-42 | active | 1 | 6969430 | 1 |
| 2 | 3158139 | Account Name | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | baseline-current-43 | resigned | 2 | lu_tax_code_template_m16 | 2 |
| 3 | 8189502 | Saipan International Airport | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | pilot-current-44 | retired | 3 | 3158154 | 3 |
| 4 | 69438 | Norma Fisher | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | extended-current-45 | active | 4 | 39800616 | 4 |

Consider the first record: Theodore Mcgrath, staff number 937735, began employment on 2022-09-05 and holds the role code `6969430` at library identifier 1. The employment status is `active`, and the current role is labeled `distributed-current-42`. By contrast, the second record—Account Name, staff number 3158139—shows a status of `resigned` with role code `lu_tax_code_template_m16` at library 2. The third record, attributed to Saipan International Airport (staff number 8189502), carries a `retired` status and role code `3158154` at library 3. The fourth record, Norma Fisher (staff number 69438), is `active` with role code `39800616` at library 4. The `library_staff_member_id` column provides a secondary key that links back to the broader staff roster.

## Roles and Their Responsibilities

Every staff member is associated with a role, and the role table enumerates the titles, departments, and responsibility levels that define each position. The `role_code` serves as the primary key and also appears as a foreign key in the staff members table, creating a direct linkage between person and position. The `role_title` field provides a human-readable label—`Distributed Standard`, `Adaptive Framework D`, `Primary Protocol`, and `Composite Programme` in the four records shown. The `responsibility_level` is a numeric value ranging from 12 to 39, indicating the hierarchical weight of each role.

**Table `library_roles`**

| role_code | role_title | department | responsibility_level | library_staff_member_id | library_department_dept_code |
|---|---|---|---|---|---|
| 6969430 | Distributed Standard | Technical Services | 12 | 1 | Takings |
| lu_tax_code_template_m16 | Adaptive Framework D | Public Services | 21 | 2 | 2002007020200 |
| 3158154 | Primary Protocol | Audio-Visual | 30 | 3 | 10966229 |
| 39800616 | Composite Programme | Bibliographic Services | 39 | 4 | 3001009030050 |

The department column in this table references the department code, and the `library_department_dept_code` column further anchors the role to a specific department within a library. The `library_staff_member_id` column completes the triad, tying the role back to the individual who holds it. In the first record, role code `6969430` corresponds to `Distributed Standard` in the Technical Services department with a responsibility level of 12, assigned to staff member 1 and department `Takings`. The second record maps role code `lu_tax_code_template_m16` to `Adaptive Framework D` in Public Services (responsibility level 21), assigned to staff member 2 and department `2002007020200`.

## Departments and Their Locations

Departments organize the operational structure of each library. The department table records the department code, a descriptive name, a location identifier, the role code associated with the department, and the library to which the department belongs. The `dept_code` serves as the primary key and appears as a foreign key in both the roles table and the libraries table.

**Table `library_departments`**

| dept_code | dept_name | location | role_code | library_id |
|---|---|---|---|---|
| Takings | Legacy Review D | extended-location-99 | 6969430 | 1 |
| 2002007020200 | Regional Initiative | integrated-location-100 | lu_tax_code_template_m16 | 2 |
| 10966229 | Seasonal Model | seasonal-location-101 | 3158154 | 3 |
| 3001009030050 | Integrated Cluster A | regional-location-102 | 39800616 | 4 |

The first department, `Takings`, is named `Legacy Review D` and is located at `extended-location-99`. It is associated with role code `6969430` and belongs to library 1. The second department, coded `2002007020200`, carries the name `Regional Initiative`, is situated at `integrated-location-100`, links to role code `lu_tax_code_template_m16`, and belongs to library 2. The third department, `10966229`, is named `Seasonal Model`, located at `seasonal-location-101`, tied to role code `3158154`, and assigned to library 3. The fourth department, `3001009030050`, is `Integrated Cluster A`, at `regional-location-102`, associated with role code `39800616`, and part of library 4.

## Libraries and Their Institutional Context

The libraries table provides the institutional context for all other records. Each library has a unique identifier, a library name, an institution name, an established date, and foreign keys linking to staff members, departments, and events. The `id` column is the primary key, while `library_id` provides an external reference.

**Table `libraries`**

| id | library_id | library_name | institution | established_date | library_staff_member_id | library_department_dept_code | library_event_id |
|---|---|---|---|---|---|---|---|
| 1 | id_17 | Distributed Assessment | baseline-institut-31 | 2024-03-27 | 1 | Takings | 100 |
| 2 | ChIJD7fiBh9u5kcRYJSMaMOCCwQ | Adaptive Survey D | pilot-institut-32 | 2025-08-11 | 2 | 2002007020200 | 101 |
| 3 | 6564374 | Primary Corridor | extended-institut-33 | 2022-01-22 | 3 | 10966229 | 102 |
| 4 | 1437592 | Composite Series | integrated-institut-34 | 2023-06-06 | 4 | 3001009030050 | 103 |

Library 1, identified externally as `id_17`, is named `Distributed Assessment` and belongs to institution `baseline-institut-31`. It was established on 2024-03-27 and links to staff member 1, department `Takings`, and event 100. Library 2, with external identifier `ChIJD7fiBh9u5kcRYJSMaMOCCwQ`, is `Adaptive Survey D`, part of `pilot-institut-32`, established 2025-08-11, and connects to staff member 2, department `2002007020200`, and event 101. Library 3, coded `6564374`, is `Primary Corridor`, under `extended-institut-33`, established 2022-01-22, linked to staff member 3, department `10966229`, and event 102. Library 4, `1437592`, is `Composite Series`, institution `integrated-institut-34`, established 2023-06-06, connected to staff member 4, department `3001009030050`, and event 103.

## Events and Their Scheduling

Library events capture the programmatic activities that occur within each branch. The events table records the event identifier, name, date, time, location, series name, library association, external speaker, and event series. The `id` column is the primary key, and `event_id` provides an external reference.

**Table `library_events`**

| id | event_id | event_name | event_date | event_time | location | series_name | library_id | external_speaker_id | event_series_id |
|---|---|---|---|---|---|---|---|---|---|
| 100 | 2002007020060 | Seasonal Standard | 2025-04-15T15:21:00 | extended-event-15 | extended-location-99 | Extended Survey | 1 | 1 | 1 |
| 101 | 168535 | Integrated Framework | 2022-09-26T22:38:00 | integrated-event-16 | integrated-location-100 | Pilot Corridor A | 2 | 2 | 2 |
| 102 | ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 | Extended Protocol D | 2023-02-10T05:55:00 | seasonal-event-17 | seasonal-location-101 | Baseline Series | 3 | 3 | 3 |
| 103 | 1186089 | Pilot Programme | 2024-07-21T12:12:00 | regional-event-18 | regional-location-102 | Distributed Assessment | 4 | 4 | 4 |

Event 100, externally identified as `2002007020060`, is named `Seasonal Standard` and took place on 2025-04-15 at 15:21. Its location is `extended-location-99`, it belongs to the series `Extended Survey`, is hosted at library 1, features external speaker 1, and is part of event series 1. Event 101, `168535`, is `Integrated Framework`, held on 2022-09-26 at 22:38, at `integrated-location-100`, in the `Pilot Corridor A` series, at library 2, with speaker 2 and series 2. Event 102, identified by UUID `ab8e1d18-8fcd-11eb-924d-9cd76263cbd0`, is `Extended Protocol D`, scheduled for 2023-02-10 at 05:55, at `seasonal-location-101`, in the `Baseline Series` at library 3, with speaker 3 and series 3. Event 103, `1186089`, is `Pilot Programme`, occurring on 2024-07-21 at 12:12, at `regional-location-102`, in the `Distributed Assessment` series, at library 4, with speaker 4 and series 4.

## External Speakers and Their Expertise

External speakers bring specialized knowledge to library events. The speakers table records the speaker identifier, an external speaker ID, full name, affiliation, area of expertise, and the event they are associated with.

**Table `external_speakers`**

| external_speaker_id | speaker_id | full_name | affiliation | expertise | library_event_id |
|---|---|---|---|---|---|
| 1 | 884355 | Theodore Mcgrath | baseline-affiliat-55 | composite-expertis-81 | 100 |
| 2 | 4060644 | Account Name | pilot-affiliat-56 | primary-expertis-82 | 101 |
| 3 | 3775 | Saipan International Airport | extended-affiliat-57 | adaptive-expertis-83 | 102 |
| 4 | 13195 | Norma Fisher | integrated-affiliat-58 | distributed-expertis-84 | 103 |

Speaker 1, externally identified as `884355`, is Theodore Mcgrath, affiliated with `baseline-affiliat-55`, specializing in `composite-expertis-81`, and assigned to event 100. Speaker 2, `4060644`, is Account Name, from `pilot-affiliat-56`, with expertise `primary-expertis-82`, linked to event 101. Speaker 3, `3775`, is Saipan International Airport, affiliated with `extended-affiliat-57`, expertise `adaptive-expertis-83`, connected to event 102. Speaker 4, `13195`, is Norma Fisher, from `integrated-affiliat-58`, expertise `distributed-expertis-84`, associated with event 103.

## Event Series and Programmatic Grouping

Event series organize individual events into recurring or thematic programs. The series table captures the series identifier, name, and the events that belong to each series.

**Table `event_serieses`**

| id | series_id | series_name | frequency | library_event_id | library_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|
| 1 | 937729 | Extended Survey | monthly | 100 | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | id_28 | Pilot Corridor A | quarterly | 101 | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | 157 | Baseline Series | annual | 102 | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | 6926352 | Distributed Assessment | monthly | 103 | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Series 1 is named `Extended Survey` and encompasses event 100. Series 2, `Pilot Corridor A`, includes event 101. Series 3, `Baseline Series`, contains event 102. Series 4, `Distributed Assessment`, holds event 103. Each series provides a higher-level organizational frame that groups events under a common thematic or scheduling umbrella.

## Student Assistants and Their Support Roles

Student assistants provide supplementary operational support across the library system. The student assistants table records the assistant identifier, name, library assignment, role assignment, and staff member association.

**Table `student_assistants`**

| student_assistant_id | student_id | full_name | major | graduation_year | employment_status | library_id | role_code | library_staff_member_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 392507 | Theodore Mcgrath | primary-major-94 | 38 | active | 1 | 6969430 | 1 |
| 2 | 25388256 | Account Name | adaptive-major-95 | 45 | graduated | 2 | lu_tax_code_template_m16 | 2 |
| 3 | id_16 | Saipan International Airport | distributed-major-96 | 52 | resigned | 3 | 3158154 | 3 |
| 4 | gd_taxc_2211 | Norma Fisher | baseline-major-97 | 59 | active | 4 | 39800616 | 4 |

The student assistants table captures the personnel who provide supplementary support within the library ecosystem. Each assistant is linked to a specific library, a role within that library, and a staff member who may serve as their supervisor or point of contact.

## Staff-to-Library Relationships

The staff member library view consolidates the relationship between individual staff members and the libraries they serve. This join answers the question of which staff member is assigned to which library, combining the staff roster with the institutional context.

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

Reading the first row of this view, Theodore Mcgrath (staff number 937735) is associated with library `id_17`, named `Distributed Assessment`, under institution `baseline-institut-31`. The second row shows Account Name (staff number 3158139) linked to library `ChIJD7fiBh9u5kcRYJSMaMOCCwQ`, `Adaptive Survey D`, institution `pilot-institut-32`. The third row maps Saipan International Airport (staff number 8189502) to library `6564374`, `Primary Corridor`, institution `extended-institut-33`. The fourth row connects Norma Fisher (staff number 69438) to library `1437592`, `Composite Series`, institution `integrated-institut-34`.

## Staff-to-Role Relationships

The staff member library role view integrates staff records with their assigned roles, revealing the title and responsibility level associated with each person at their library.

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

In the first row, Theodore Mcgrath at library `id_17` holds role code `6969430`, titled `Distributed Standard`, with a responsibility level of 12. The second row places Account Name at library `ChIJD7fiBh9u5kcRYJSMaMOCCwQ` under role code `lu_tax_code_template_m16`, `Adaptive Framework D`, responsibility level 21. The third row shows Saipan International Airport at library `6564374` with role code `3158154`, `Primary Protocol`, level 30. The fourth row assigns Norma Fisher at library `1437592` to role code `39800616`, `Composite Programme`, level 39.

## Staff-to-Staff Relationships

The staff member library staff member view provides a self-referential linkage, connecting each staff member to their broader staff roster entry. This join is useful for auditing and cross-referencing personnel records.

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

The first row links Theodore Mcgrath (staff number 937735) at library `id_17` to staff member ID 1. The second row connects Account Name (staff number 3158139) at library `ChIJD7fiBh9u5kcRYJSMaMOCCwQ` to staff member ID 2. The third row maps Saipan International Airport (staff number 8189502) at library `6564374` to staff member ID 3. The fourth row associates Norma Fisher (staff number 69438) at library `1437592` with staff member ID 4.

## Role-to-Staff Relationships

The library role library staff member view inverts the perspective, starting from the role and showing which staff member holds it. This join clarifies the staffing of each position.

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

The first row shows role code `6969430` (`Distributed Standard`) held by staff member 1, Theodore Mcgrath, at library `id_17`. The second row maps role code `lu_tax_code_template_m16` (`Adaptive Framework D`) to staff member 2, Account Name, at library `ChIJD7fiBh9u5kcRYJSMaMOCCwQ`. The third row links role code `3158154` (`Primary Protocol`) to staff member 3, Saipan International Airport, at library `6564374`. The fourth row connects role code `39800616` (`Composite Programme`) to staff member 4, Norma Fisher, at library `1437592`.

## Role-to-Department Relationships

The library role library department view connects roles to their home departments, revealing the organizational placement of each position.

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

The first row places role code `6969430` (`Distributed Standard`) within department `Takings` (`Legacy Review D`) at library `id_17`. The second row assigns role code `lu_tax_code_template_m16` (`Adaptive Framework D`) to department `2002007020200` (`Regional Initiative`) at library `ChIJD7fiBh9u5kcRYJSMaMOCCwQ`. The third row links role code `3158154` (`Primary Protocol`) to department `10966229` (`Seasonal Model`) at library `6564374`. The fourth row connects role code `39800616` (`Composite Programme`) to department `3001009030050` (`Integrated Cluster A`) at library `1437592`.

## Department-to-Role Relationships

The library department library role view starts from the department and enumerates the roles housed within it, providing a department-centric view of staffing.

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

Department `Takings` (`Legacy Review D`) at library `id_17` contains role code `6969430` (`Distributed Standard`). Department `2002007020200` (`Regional Initiative`) at library `ChIJD7fiBh9u5kcRYJSMaMOCCwQ` contains role code `lu_tax_code_template_m16` (`Adaptive Framework D`). Department `10966229` (`Seasonal Model`) at library `6564374` contains role code `3158154` (`Primary Protocol`). Department `3001009030050` (`Integrated Cluster A`) at library `1437592` contains role code `39800616` (`Composite Programme`).

## Department-to-Library Relationships

The library department library view maps departments to their parent libraries, answering the question of which library houses which department.

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

Department `Takings` (`Legacy Review D`) at location `extended-location-99` belongs to library `id_17` (`Distributed Assessment`). Department `2002007020200` (`Regional Initiative`) at location `integrated-location-100` belongs to library `ChIJD7fiBh9u5kcRYJSMaMOCCwQ` (`Adaptive Survey D`). Department `10966229` (`Seasonal Model`) at location `seasonal-location-101` belongs to library `6564374` (`Primary Corridor`). Department `3001009030050` (`Integrated Cluster A`) at location `regional-location-102` belongs to library `1437592` (`Composite Series`).

## Library-to-Staff Relationships

The library library staff member view inverts the staff-to-library relationship, starting from the library and listing the staff members assigned to it.

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

Library `id_17` (`Distributed Assessment`, institution `baseline-institut-31`) has staff member Theodore Mcgrath (staff number 937735), role code `6969430`, status `active`. Library `ChIJD7fiBh9u5kcRYJSMaMOCCwQ` (`Adaptive Survey D`, institution `pilot-institut-32`) has staff member Account Name (staff number 3158139), role code `lu_tax_code_template_m16`, status `resigned`. Library `6564374` (`Primary Corridor`, institution `extended-institut-33`) has staff member Saipan International Airport (staff number 8189502), role code `3158154`, status `retired`. Library `1437592` (`Composite Series`, institution `integrated-institut-34`) has staff member Norma Fisher (staff number 69438), role code `39800616`, status `active`.

## Library-to-Department Relationships

The library library department view maps each library to its departments, providing a structural overview of the organizational layout.

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

Library `id_17` (`Distributed Assessment`) contains department `Takings` (`Legacy Review D`) at location `extended-location-99`. Library `ChIJD7fiBh9u5kcRYJSMaMOCCwQ` (`Adaptive Survey D`) contains department `2002007020200` (`Regional Initiative`) at location `integrated-location-100`. Library `6564374` (`Primary Corridor`) contains department `10966229` (`Seasonal Model`) at location `seasonal-location-101`. Library `1437592` (`Composite Series`) contains department `3001009030050` (`Integrated Cluster A`) at location `regional-location-102`.

## Library-to-Event Relationships

The library library event view connects libraries to the events they host, revealing the programmatic activity at each branch.

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

Library `id_17` (`Distributed Assessment`) hosts event 100 (`Seasonal Standard`) on 2025-04-15, part of the `Extended Survey` series. Library `ChIJD7fiBh9u5kcRYJSMaMOCCwQ` (`Adaptive Survey D`) hosts event 101 (`Integrated Framework`) on 2022-09-26, part of the `Pilot Corridor A` series. Library `6564374` (`Primary Corridor`) hosts event 102 (`Extended Protocol D`) on 2023-02-10, part of the `Baseline Series`. Library `1437592` (`Composite Series`) hosts event 103 (`Pilot Programme`) on 2024-07-21, part of the `Distributed Assessment` series.

## Event-to-Library Relationships

The library event library view starts from the event and shows which library hosts it, providing an event-centric organizational context.

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

Event 100 (`Seasonal Standard`) at location `extended-location-99` is hosted by library `id_17` (`Distributed Assessment`). Event 101 (`Integrated Framework`) at location `integrated-location-100` is hosted by library `ChIJD7fiBh9u5kcRYJSMaMOCCwQ` (`Adaptive Survey D`). Event 102 (`Extended Protocol D`) at location `seasonal-location-101` is hosted by library `6564374` (`Primary Corridor`). Event 103 (`Pilot Programme`) at location `regional-location-102` is hosted by library `1437592` (`Composite Series`).

## Event-to-Speaker Relationships

The library event external speaker view links events to their invited speakers, revealing the external expertise brought to each program.

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

Event 100 (`Seasonal Standard`) features external speaker 1, Theodore Mcgrath, from `baseline-affiliat-55`, with expertise `composite-expertis-81`. Event 101 (`Integrated Framework`) features external speaker 2, Account Name, from `pilot-affiliat-56`, with expertise `primary-expertis-82`. Event 102 (`Extended Protocol D`) features external speaker 3, Saipan International Airport, from `extended-affiliat-57`, with expertise `adaptive-expertis-83`. Event 103 (`Pilot Programme`) features external speaker 4, Norma Fisher, from `integrated-affiliat-58`, with expertise `distributed-expertis-84`.

## Event-to-Series Relationships

The library event event series view connects individual events to their parent series, showing how programs are grouped under thematic umbrellas.

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

Event 100 (`Seasonal Standard`) belongs to series 1, `Extended Survey`. Event 101 (`Integrated Framework`) belongs to series 2, `Pilot Corridor A`. Event 102 (`Extended Protocol D`) belongs to series 3, `Baseline Series`. Event 103 (`Pilot Programme`) belongs to series 4, `Distributed Assessment`.

## Speaker-to-Event Relationships

The external speaker library event view inverts the event-to-speaker relationship, starting from the speaker and showing which event they are assigned to.

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

External speaker 1, Theodore Mcgrath (`884355`), from `baseline-affiliat-55` with expertise `composite-expertis-81`, is assigned to event 100 (`Seasonal Standard`). External speaker 2, Account Name (`4060644`), from `pilot-affiliat-56` with expertise `primary-expertis-82`, is assigned to event 101 (`Integrated Framework`). External speaker 3, Saipan International Airport (`3775`), from `extended-affiliat-57` with expertise `adaptive-expertis-83`, is assigned to event 102 (`Extended Protocol D`). External speaker 4, Norma Fisher (`13195`), from `integrated-affiliat-58` with expertise `distributed-expertis-84`, is assigned to event 103 (`Pilot Programme`).

## Series-to-Event Relationships

The event series library event view starts from the event series and enumerates the events within it, providing a series-centric programmatic view.

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

Series 1, `Extended Survey`, contains event 100 (`Seasonal Standard`) at library `id_17` on 2025-04-15. Series 2, `Pilot Corridor A`, contains event 101 (`Integrated Framework`) at library `ChIJD7fiBh9u5kcRYJSMaMOCCwQ` on 2022-09-26. Series 3, `Baseline Series`, contains event 102 (`Extended Protocol D`) at library `6564374` on 2023-02-10. Series 4, `Distributed Assessment`, contains event 103 (`Pilot Programme`) at library `1437592` on 2024-07-21.

## Series-to-Library Relationships

The event series library view maps event series to the libraries that host their events, revealing the institutional distribution of programmatic activity.

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

Series 1 (`Extended Survey`) has its event at library `id_17` (`Distributed Assessment`). Series 2 (`Pilot Corridor A`) has its event at library `ChIJD7fiBh9u5kcRYJSMaMOCCwQ` (`Adaptive Survey D`). Series 3 (`Baseline Series`) has its event at library `6564374` (`Primary Corridor`). Series 4 (`Distributed Assessment`) has its event at library `1437592` (`Composite Series`).

## Student Assistant-to-Library Relationships

The student assistant library view connects student assistants to the libraries where they serve, providing a support-level organizational overview.

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

This view maps each student assistant to their assigned library, revealing the institutional context of their support role. The join combines the student assistant roster with the library table to show which branch each assistant serves.

## Student Assistant-to-Role Relationships

The student assistant library role view links student assistants to the roles they support within their library, clarifying the functional scope of their assignments.

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

This view connects each student assistant to the role code and title of the position they assist, providing insight into the operational areas where student support is deployed.

## Student Assistant-to-Staff Relationships

The student assistant library staff member view ties student assistants to the staff members they work alongside or report to, completing the support-level organizational picture.

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

This view links each student assistant to the staff member ID of their associated staff contact, enabling supervisors to identify which assistants are paired with which personnel across the library system.

## Synthesis

The records described in this chapter form a coherent organizational graph. Staff members hold roles with defined responsibility levels, roles belong to departments at specific locations, and departments anchor to libraries within institutional contexts. Events bring together staff, departments, speakers, and series under time-bound programs, while student assistants provide supplementary support across the same structural dimensions. The foreign keys—`library_id`, `role_code`, `library_department_dept_code`, `external_speaker_id`, and `event_series_id`—preserve the integrity of these relationships, ensuring that every query can trace a path from person to position, from department to branch, from event to series, and from speaker to program. Together, these tables and views provide a complete operational ledger for library management.