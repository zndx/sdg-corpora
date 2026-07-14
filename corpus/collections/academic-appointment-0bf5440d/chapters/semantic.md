The domain under examination captures the professional trajectories of individuals who hold dual affiliations across two distinct institutional ecosystems: academia and law enforcement. Each person in the dataset may occupy an academic appointment at a university or research institution, and simultaneously or sequentially hold a law enforcement appointment within a corporate or governmental agency. The schema is deliberately normalized to avoid redundancy in names, locations, and dates, while preserving the ability to reconstruct any person–institution–role triad through a small set of well-defined views. The following chapter explains how the ontology maps to relational tables, how foreign keys enforce the cardinality constraints, and how each view materializes a domain fact from the normalized base tables.

## The Person as the Universal Anchor

Every professional fact in this domain is anchored to a person. The `persons` table serves as the central entity, and every other table that records an appointment, affiliation, or award carries a `person_id` column that references it. In the sample data, person `100` holds an academic appointment with identifier `2087748` at the institution named *Extended Corridor*, while the same person also holds a law enforcement appointment with identifier `2087748` at the agency *FSG Social Impact Advisors*. Person `101` is similarly dual-affiliated, holding an academic appointment `ChIJJ60m-q5t5kcRMZ9MdM8fVm4` at *Pilot Series A* and a law enforcement appointment with the same identifier at *Whirlpool Corporation*. The `person_id` column appears in nearly every base table, making `persons` the hub of a star-like schema.

**Table `persons`**

| person_id | first_name | last_name | birth_date | nationality | academic_appointment_id | law_enforcement_appointment_id | academic_award_id | academic_institution_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|
| 100 | Stephanie Collins | Paul Allen | 2023-10-18 | composite-national-39 | 1 | 1 | 1 | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 101 | Janice Johnston | Heather Beasley | 2024-03-02 | primary-national-40 | 2 | 2 | 2 | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 102 | Upal Saha | Audrey Taylor | 2025-08-13 | adaptive-national-41 | 3 | 3 | 3 | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 103 | Katherine Snyder | Susan Wagner | 2022-01-24 | distributed-national-42 | 4 | 4 | 4 | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The `persons` table itself is not shown in the data excerpt, but its role as the referent of every `person_id` foreign key is evident across all appointment, department, agency, and division tables. The schema assumes that each person has a unique surrogate `id` (values `100`, `101`, `102`, `103` in the sample) and that this identifier is the sole key by which all other facts are joined.

## Academic Appointments and Their Temporal Structure

The `academic_appointments` table records each person's tenure at an academic institution. It carries a composite set of columns: a surrogate `id`, a business-level `appointment_id` (which may be a numeric string like `2087748` or a UUID-like string such as `ChIJJ60m-q5t5kcRMZ9MdM8fVm4`), a `start_date` and `end_date` pair, a `title` (e.g., *Compact Initiative*, *Legacy Model*, *Regional Cluster A*, *Seasonal Review*), a free-text `department` name, a free-text `institution_name`, and three foreign-key columns: `academic_institution_id`, `person_id`, and `academic_department_id`.

**Table `academic_appointments`**

| id | appointment_id | start_date | end_date | title | department | institution_name | academic_institution_id | person_id | academic_department_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 2087748 | 2022-09-05 | 2022-09-01 | Compact Initiative | adaptive-departme-89 | Extended Corridor | 1 | 100 | 1000 |
| 2 | ChIJJ60m-q5t5kcRMZ9MdM8fVm4 | 2023-02-16 | 2023-02-12 | Legacy Model | distributed-departme-90 | Pilot Series A | 2 | 101 | 1001 |
| 3 | 2087740 | 2024-07-27 | 2024-07-23 | Regional Cluster A | baseline-departme-91 | Baseline Assessment | 3 | 102 | 1002 |
| 4 | 1250223 | 2025-12-11 | 2025-12-07 | Seasonal Review | pilot-departme-92 | Distributed Survey | 4 | 103 | 1003 |

The `start_date` and `end_date` columns encode the temporal bounds of the appointment. In the sample, appointment `2087748` for person `100` spans from `2022-09-05` to `2022-09-01`, suggesting that the end date may precede the start date in certain data-generation scenarios (a quirk of the synthetic data, not a schema constraint). The `title` column captures the role or project name, while `department` and `institution_name` are denormalized convenience columns that duplicate the names stored in the `academic_departments` and `academic_institutions` tables respectively. The true structural relationships are expressed through the foreign keys `academic_institution_id` → `academic_institutions.id` and `academic_department_id` → `academic_departments.id`.

## Academic Institutions and Their Location Metadata

The `academic_institutions` table stores the canonical list of universities, research centers, and similar entities. Each row carries a surrogate `id`, a business `institution_id` (e.g., `9424913`, `8189481`), a `name` (e.g., *Extended Review*, *Pilot Initiative A*, *Baseline Model*, *Distributed Cluster*), geographic columns (`location_city`, `location_state`, `location_country`), a `founding_year` (values `43`, `48`, `53`, `58` in the sample), and two foreign-key columns: `academic_department_id` and `academic_award_id`.

**Table `academic_institutions`**

| id | institution_id | name | location_city | location_state | location_country | founding_year | academic_department_id | academic_award_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 9424913 | Extended Review | seasonal-location-23 | composite-location-93 | adaptive-location-47 | 43 | 1000 | 1 |
| 2 | 8189481 | Pilot Initiative A | regional-location-24 | primary-location-94 | distributed-location-48 | 48 | 1001 | 2 |
| 3 | 1437604 | Baseline Model | legacy-location-25 | adaptive-location-95 | baseline-location-49 | 53 | 1002 | 3 |
| 4 | 884346 | Distributed Cluster | compact-location-26 | distributed-location-96 | pilot-location-50 | 58 | 1003 | 4 |

The `location_city` column contains synthetic location tokens such as *seasonal-location-23* and *regional-location-24*. The `founding_year` values are small integers, suggesting they may represent years since an epoch rather than calendar years. The `academic_department_id` foreign key links the institution to its parent department (e.g., institution `9424913` / *Extended Review* is linked to department `1000`), while `academic_award_id` links the institution to an award record (e.g., institution `9424913` is linked to award `1`).

## Academic Departments as Organizational Units

The `academic_departments` table models the organizational subdivisions within academic institutions. Each row has a surrogate `id` (e.g., `1000`, `1001`, `1002`, `1003`), a business `department_id` (e.g., `2087755`, `790483`, `505978`, `id_6`), a `name` (e.g., *Extended Review*, *Pilot Initiative A*, *Baseline Model*, *Distributed Cluster*), a `parent_institution_id` (a string identifier such as `209215` or `14c2e512-8fcd-11eb-924d-9cd76263cbd0`), an `established_date`, a foreign key `academic_institution_id` referencing `academic_institutions.id`, and a `person_id` referencing `persons.id`.

**Table `academic_departments`**

| id | department_id | name | parent_institution_id | established_date | academic_institution_id | person_id |
|---|---|---|---|---|---|---|
| 1000 | 2087755 | Extended Review | 209215 | 2024-03-27 | 1 | 100 |
| 1001 | 790483 | Pilot Initiative A | 14c2e512-8fcd-11eb-924d-9cd76263cbd0 | 2025-08-11 | 2 | 101 |
| 1002 | 505978 | Baseline Model | 505979 | 2022-01-22 | 3 | 102 |
| 1003 | id_6 | Distributed Cluster | 1186081 | 2023-06-06 | 4 | 103 |

The `parent_institution_id` column appears to store a free-text or UUID-style reference to the parent institution, while `academic_institution_id` provides the structured foreign-key link. The `person_id` column in this table suggests that each department may have an assigned head or primary contact person. In the sample, department `1000` (*Extended Review*) is associated with person `100`, department `1001` (*Pilot Initiative A*) with person `101`, and so on, forming a one-to-one correspondence between departments and persons in the sample data.

## Academic Awards

The `academic_awards` table stores recognition records associated with academic institutions. Although the full table content is not shown in the data excerpt, the `academic_institutions` table references it via the `academic_award_id` column, establishing a many-to-one relationship: multiple institutions may share the same award, or each institution may hold a distinct award. The sample data shows award identifiers `1`, `2`, `3`, `4` linked to institutions `1` through `4` respectively.

**Table `academic_awards`**

| id | award_id | name | awarding_organization | year_awarded | citation | person_id | academic_institution_id |
|---|---|---|---|---|---|---|---|
| 1 | e02275d4-8fd1-11eb-924d-9cd76263cbd0 | Extended Review | School District of Philadelphia | 37 | legacy-citation-79 | 100 | 1 |
| 2 | 3012811 | Pilot Initiative A | School District of Philadelphia | 46 | compact-citation-80 | 101 | 2 |
| 3 | 15493350 | Baseline Model | Luddic Church | 55 | composite-citation-81 | 102 | 3 |
| 4 | state_uk_17 | Distributed Cluster | Feedback Rating | 64 | primary-citation-82 | 103 | 4 |

## Law Enforcement Appointments

The `law_enforcement_appointments` table mirrors the structure of `academic_appointments` but within the law enforcement domain. It carries `id`, `appointment_id`, `start_date`, `end_date`, `title`, `agency_name`, `jurisdiction`, `law_enforcement_agency_id`, `person_id`, and `law_enforcement_division_id`.

**Table `law_enforcement_appointments`**

| id | appointment_id | start_date | end_date | title | agency_name | jurisdiction | law_enforcement_agency_id | person_id | law_enforcement_division_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 2087748 | 2022-09-05 | 2022-09-01 | Compact Initiative | FSG Social Impact Advisors | regional-jurisdic-30 | 1000 | 100 | 1 |
| 2 | ChIJJ60m-q5t5kcRMZ9MdM8fVm4 | 2023-02-16 | 2023-02-12 | Legacy Model | Whirlpool Corporation | legacy-jurisdic-31 | 1001 | 101 | 2 |
| 3 | 2087740 | 2024-07-27 | 2024-07-23 | Regional Cluster A | Education Writers Association | compact-jurisdic-32 | 1002 | 102 | 3 |
| 4 | 1250223 | 2025-12-11 | 2025-12-07 | Seasonal Review | Switch Card Services Ltd. | composite-jurisdic-33 | 1003 | 103 | 4 |

The `title` column again holds role or project names (*Compact Initiative*, *Legacy Model*, *Regional Cluster A*, *Seasonal Review*). The `agency_name` column is a denormalized convenience field duplicating the name from `law_enforcement_agencies`. The `jurisdiction` column contains synthetic tokens such as *regional-jurisdic-30* and *legacy-jurisdic-31*. The foreign keys `law_enforcement_agency_id` → `law_enforcement_agencies.law_enforcement_agency_id` and `law_enforcement_division_id` → `law_enforcement_divisions.id` establish the structural relationships.

## Law Enforcement Agencies

The `law_enforcement_agencies` table stores the canonical list of agencies. Each row has a `law_enforcement_agency_id` (e.g., `1000`, `1001`, `1002`, `1003`), an `agency_id` (e.g., *U.S. Steel*, *Nikola Corporation*, *Oberthur Technologies*, *General Telephone & Electronics*), a `name` (e.g., *Extended Review*, *Pilot Initiative A*, *Baseline Model*, *Distributed Cluster*), geographic columns (`location_city`, `location_state`, `location_country`), an `established_year` (values `10`, `16`, `22`, `28`), a `person_id`, a `law_enforcement_division_id`, and audit columns `created_at` and `updated_at`.

**Table `law_enforcement_agencies`**

| law_enforcement_agency_id | agency_id | name | location_city | location_state | location_country | established_year | person_id | law_enforcement_division_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|
| 1000 | U.S. Steel | Extended Review | seasonal-location-23 | composite-location-93 | adaptive-location-47 | 10 | 100 | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 1001 | Nikola Corporation | Pilot Initiative A | regional-location-24 | primary-location-94 | distributed-location-48 | 16 | 101 | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 1002 | Oberthur Technologies | Baseline Model | legacy-location-25 | adaptive-location-95 | baseline-location-49 | 22 | 102 | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 1003 | General Telephone & Electronics | Distributed Cluster | compact-location-26 | distributed-location-96 | pilot-location-50 | 28 | 103 | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The `agency_id` column contains what appear to be real company names (*U.S. Steel*, *Nikola Corporation*), while the `name` column contains synthetic tokens. The `established_year` values are small integers, similar to the academic institution `founding_year`. The `person_id` column links the agency to a person, and `law_enforcement_division_id` links it to a division.

## Law Enforcement Divisions

The `law_enforcement_divisions` table models subdivisions within agencies. Each row has a surrogate `id` (e.g., `1`, `2`, `3`, `4`), a business `division_id` (e.g., `89512`, `10207146`, `212`, `id_14`), a `name` (e.g., *Extended Review*, *Pilot Initiative A*, *Baseline Model*, *Distributed Cluster*), a `parent_agency_id` (free-text such as *Charlotte-Mecklenburg Schools* or *Lucas Industries*), an `established_date`, a foreign key `law_enforcement_agency_id` referencing `law_enforcement_agencies.law_enforcement_agency_id`, and a `person_id`.

**Table `law_enforcement_divisions`**

| id | division_id | name | parent_agency_id | established_date | law_enforcement_agency_id | person_id |
|---|---|---|---|---|---|---|
| 1 | 89512 | Extended Review | Charlotte-Mecklenburg Schools | 2024-03-27 | 1000 | 100 |
| 2 | 10207146 | Pilot Initiative A | Lucas Industries | 2025-08-11 | 1001 | 101 |
| 3 | 212 | Baseline Model | Altice USA | 2022-01-22 | 1002 | 102 |
| 4 | id_14 | Distributed Cluster | Thales Group | 2023-06-06 | 1003 | 103 |

The `parent_agency_id` column, like its academic counterpart `parent_institution_id`, stores a free-text or UUID-style reference, while `law_enforcement_agency_id` provides the structured foreign-key link. The `person_id` column associates a person with the division.

## Academic Appointment to Institution View

The view `v_academic_appointment_academic_institution` joins `academic_appointments` with `academic_institutions` on the `academic_institution_id` column, producing a denormalized row that combines appointment metadata with institution details. This view answers the question: *Which institution is associated with each academic appointment?* Reading the sample, the join reconstructs the fact that appointment `2087748` (title *Compact Initiative*, person `100`) is associated with institution `9424913` (*Extended Review*, located at *seasonal-location-23*, founded in year `43`).

**View `v_academic_appointment_academic_institution`**

```sql
CREATE VIEW v_academic_appointment_academic_institution AS
SELECT a.id, a.appointment_id, a.start_date, a.end_date, b.id AS institution_id, b.institution_id AS institution_institution_id, b.name AS institution_name
FROM academic_appointments a JOIN academic_institutions b ON a.academic_institution_id = b.id;
```

| id | appointment_id | start_date | end_date | institution_id | institution_institution_id | institution_name |
|---|---|---|---|---|---|---|
| 1 | 2087748 | 2022-09-05 | 2022-09-01 | 1 | 9424913 | Extended Review |
| 2 | ChIJJ60m-q5t5kcRMZ9MdM8fVm4 | 2023-02-16 | 2023-02-12 | 2 | 8189481 | Pilot Initiative A |
| 3 | 2087740 | 2024-07-27 | 2024-07-23 | 3 | 1437604 | Baseline Model |
| 4 | 1250223 | 2025-12-11 | 2025-12-07 | 4 | 884346 | Distributed Cluster |

## Academic Appointment to Person View

The view `v_academic_appointment_person` joins `academic_appointments` with `persons` on `person_id`, answering: *Which person holds each academic appointment?* For appointment `ChIJJ60m-q5t5kcRMZ9MdM8fVm4` (title *Legacy Model*, department *distributed-departme-90*), the view reveals that person `101` is the appointee.

**View `v_academic_appointment_person`**

```sql
CREATE VIEW v_academic_appointment_person AS
SELECT a.id, a.appointment_id, a.start_date, a.end_date, b.person_id AS person_person_id, b.first_name AS person_first_name, b.last_name AS person_last_name
FROM academic_appointments a JOIN persons b ON a.person_id = b.person_id;
```

| id | appointment_id | start_date | end_date | person_person_id | person_first_name | person_last_name |
|---|---|---|---|---|---|---|
| 1 | 2087748 | 2022-09-05 | 2022-09-01 | 100 | Stephanie Collins | Paul Allen |
| 2 | ChIJJ60m-q5t5kcRMZ9MdM8fVm4 | 2023-02-16 | 2023-02-12 | 101 | Janice Johnston | Heather Beasley |
| 3 | 2087740 | 2024-07-27 | 2024-07-23 | 102 | Upal Saha | Audrey Taylor |
| 4 | 1250223 | 2025-12-11 | 2025-12-07 | 103 | Katherine Snyder | Susan Wagner |

## Academic Appointment to Department View

The view `v_academic_appointment_academic_department` joins `academic_appointments` with `academic_departments` on `academic_department_id`, answering: *Which department is associated with each academic appointment?* Appointment `2087748` (person `100`) joins to department `1000` (*Extended Review*, established `2024-03-27`, parent institution `209215`).

**View `v_academic_appointment_academic_department`**

```sql
CREATE VIEW v_academic_appointment_academic_department AS
SELECT a.id, a.appointment_id, a.start_date, a.end_date, b.id AS department_id, b.department_id AS department_department_id, b.name AS department_name
FROM academic_appointments a JOIN academic_departments b ON a.academic_department_id = b.id;
```

| id | appointment_id | start_date | end_date | department_id | department_department_id | department_name |
|---|---|---|---|---|---|---|
| 1 | 2087748 | 2022-09-05 | 2022-09-01 | 1000 | 2087755 | Extended Review |
| 2 | ChIJJ60m-q5t5kcRMZ9MdM8fVm4 | 2023-02-16 | 2023-02-12 | 1001 | 790483 | Pilot Initiative A |
| 3 | 2087740 | 2024-07-27 | 2024-07-23 | 1002 | 505978 | Baseline Model |
| 4 | 1250223 | 2025-12-11 | 2025-12-07 | 1003 | id_6 | Distributed Cluster |

## Academic Institution to Department View

The view `v_academic_institution_academic_department` joins `academic_institutions` with `academic_departments` on `academic_department_id` (or equivalently through `academic_institution_id`), answering: *Which department belongs to which institution?* Institution `9424913` (*Extended Review*) joins to department `1000` (*Extended Review*, established `2024-03-27`).

**View `v_academic_institution_academic_department`**

```sql
CREATE VIEW v_academic_institution_academic_department AS
SELECT a.id, a.institution_id, a.name, a.location_city, b.id AS department_id, b.department_id AS department_department_id, b.name AS department_name
FROM academic_institutions a JOIN academic_departments b ON a.academic_department_id = b.id;
```

| id | institution_id | name | location_city | department_id | department_department_id | department_name |
|---|---|---|---|---|---|---|
| 1 | 9424913 | Extended Review | seasonal-location-23 | 1000 | 2087755 | Extended Review |
| 2 | 8189481 | Pilot Initiative A | regional-location-24 | 1001 | 790483 | Pilot Initiative A |
| 3 | 1437604 | Baseline Model | legacy-location-25 | 1002 | 505978 | Baseline Model |
| 4 | 884346 | Distributed Cluster | compact-location-26 | 1003 | id_6 | Distributed Cluster |

## Academic Institution to Award View

The view `v_academic_institution_academic_award` joins `academic_institutions` with `academic_awards` on `academic_award_id`, answering: *Which award is associated with each institution?* Institution `9424913` (*Extended Review*) joins to award `1`.

**View `v_academic_institution_academic_award`**

```sql
CREATE VIEW v_academic_institution_academic_award AS
SELECT a.id, a.institution_id, a.name, a.location_city, b.id AS award_id, b.award_id AS award_award_id, b.name AS award_name
FROM academic_institutions a JOIN academic_awards b ON a.academic_award_id = b.id;
```

| id | institution_id | name | location_city | award_id | award_award_id | award_name |
|---|---|---|---|---|---|---|
| 1 | 9424913 | Extended Review | seasonal-location-23 | 1 | e02275d4-8fd1-11eb-924d-9cd76263cbd0 | Extended Review |
| 2 | 8189481 | Pilot Initiative A | regional-location-24 | 2 | 3012811 | Pilot Initiative A |
| 3 | 1437604 | Baseline Model | legacy-location-25 | 3 | 15493350 | Baseline Model |
| 4 | 884346 | Distributed Cluster | compact-location-26 | 4 | state_uk_17 | Distributed Cluster |

## Academic Department to Institution View

The view `v_academic_department_academic_institution` joins `academic_departments` with `academic_institutions` on `academic_institution_id`, answering: *Which institution hosts each department?* Department `1000` (*Extended Review*, established `2024-03-27`) joins to institution `1` (*Extended Review*, located at *seasonal-location-23*).

**View `v_academic_department_academic_institution`**

```sql
CREATE VIEW v_academic_department_academic_institution AS
SELECT a.id, a.department_id, a.name, a.parent_institution_id, b.id AS institution_id, b.institution_id AS institution_institution_id, b.name AS institution_name
FROM academic_departments a JOIN academic_institutions b ON a.academic_institution_id = b.id;
```

| id | department_id | name | parent_institution_id | institution_id | institution_institution_id | institution_name |
|---|---|---|---|---|---|---|
| 1000 | 2087755 | Extended Review | 209215 | 1 | 9424913 | Extended Review |
| 1001 | 790483 | Pilot Initiative A | 14c2e512-8fcd-11eb-924d-9cd76263cbd0 | 2 | 8189481 | Pilot Initiative A |
| 1002 | 505978 | Baseline Model | 505979 | 3 | 1437604 | Baseline Model |
| 1003 | id_6 | Distributed Cluster | 1186081 | 4 | 884346 | Distributed Cluster |

## Academic Department to Person View

The view `v_academic_department_person` joins `academic_departments` with `persons` on `person_id`, answering: *Which person is associated with each department?* Department `1000` (*Extended Review*) joins to person `100`.

**View `v_academic_department_person`**

```sql
CREATE VIEW v_academic_department_person AS
SELECT a.id, a.department_id, a.name, a.parent_institution_id, b.person_id AS person_person_id, b.first_name AS person_first_name, b.last_name AS person_last_name
FROM academic_departments a JOIN persons b ON a.person_id = b.person_id;
```

| id | department_id | name | parent_institution_id | person_person_id | person_first_name | person_last_name |
|---|---|---|---|---|---|---|
| 1000 | 2087755 | Extended Review | 209215 | 100 | Stephanie Collins | Paul Allen |
| 1001 | 790483 | Pilot Initiative A | 14c2e512-8fcd-11eb-924d-9cd76263cbd0 | 101 | Janice Johnston | Heather Beasley |
| 1002 | 505978 | Baseline Model | 505979 | 102 | Upal Saha | Audrey Taylor |
| 1003 | id_6 | Distributed Cluster | 1186081 | 103 | Katherine Snyder | Susan Wagner |

## Law Enforcement Appointment to Agency View

The view `v_law_enforcement_appointment_law_enforcement_agency` joins `law_enforcement_appointments` with `law_enforcement_agencies` on `law_enforcement_agency_id`, answering: *Which agency is associated with each law enforcement appointment?* Appointment `2087748` (title *Compact Initiative*, person `100`) joins to agency `1000` (*U.S. Steel*, established year `10`, located at *seasonal-location-23*).

**View `v_law_enforcement_appointment_law_enforcement_agency`**

```sql
CREATE VIEW v_law_enforcement_appointment_law_enforcement_agency AS
SELECT a.id, a.appointment_id, a.start_date, a.end_date, b.law_enforcement_agency_id AS agency_law_enforcement_agency_id, b.agency_id AS agency_agency_id, b.name AS agency_name
FROM law_enforcement_appointments a JOIN law_enforcement_agencies b ON a.law_enforcement_agency_id = b.law_enforcement_agency_id;
```

| id | appointment_id | start_date | end_date | agency_law_enforcement_agency_id | agency_agency_id | agency_name |
|---|---|---|---|---|---|---|
| 1 | 2087748 | 2022-09-05 | 2022-09-01 | 1000 | U.S. Steel | Extended Review |
| 2 | ChIJJ60m-q5t5kcRMZ9MdM8fVm4 | 2023-02-16 | 2023-02-12 | 1001 | Nikola Corporation | Pilot Initiative A |
| 3 | 2087740 | 2024-07-27 | 2024-07-23 | 1002 | Oberthur Technologies | Baseline Model |
| 4 | 1250223 | 2025-12-11 | 2025-12-07 | 1003 | General Telephone & Electronics | Distributed Cluster |

## Law Enforcement Appointment to Person View

The view `v_law_enforcement_appointment_person` joins `law_enforcement_appointments` with `persons` on `person_id`, answering: *Which person holds each law enforcement appointment?* Appointment `ChIJJ60m-q5t5kcRMZ9MdM8fVm4` (title *Legacy Model*, agency *Whirlpool Corporation*) reveals that person `101` is the appointee.

**View `v_law_enforcement_appointment_person`**

```sql
CREATE VIEW v_law_enforcement_appointment_person AS
SELECT a.id, a.appointment_id, a.start_date, a.end_date, b.person_id AS person_person_id, b.first_name AS person_first_name, b.last_name AS person_last_name
FROM law_enforcement_appointments a JOIN persons b ON a.person_id = b.person_id;
```

| id | appointment_id | start_date | end_date | person_person_id | person_first_name | person_last_name |
|---|---|---|---|---|---|---|
| 1 | 2087748 | 2022-09-05 | 2022-09-01 | 100 | Stephanie Collins | Paul Allen |
| 2 | ChIJJ60m-q5t5kcRMZ9MdM8fVm4 | 2023-02-16 | 2023-02-12 | 101 | Janice Johnston | Heather Beasley |
| 3 | 2087740 | 2024-07-27 | 2024-07-23 | 102 | Upal Saha | Audrey Taylor |
| 4 | 1250223 | 2025-12-11 | 2025-12-07 | 103 | Katherine Snyder | Susan Wagner |

## Law Enforcement Appointment to Division View

The view `v_law_enforcement_appointment_law_enforcement_division` joins `law_enforcement_appointments` with `law_enforcement_divisions` on `law_enforcement_division_id`, answering: *Which division is associated with each law enforcement appointment?* Appointment `2087748` (person `100`) joins to division `1` (*Extended Review*, established `2024-03-27`, parent agency *Charlotte-Mecklenburg Schools*).

**View `v_law_enforcement_appointment_law_enforcement_division`**

```sql
CREATE VIEW v_law_enforcement_appointment_law_enforcement_division AS
SELECT a.id, a.appointment_id, a.start_date, a.end_date, b.id AS division_id, b.division_id AS division_division_id, b.name AS division_name
FROM law_enforcement_appointments a JOIN law_enforcement_divisions b ON a.law_enforcement_division_id = b.id;
```

| id | appointment_id | start_date | end_date | division_id | division_division_id | division_name |
|---|---|---|---|---|---|---|
| 1 | 2087748 | 2022-09-05 | 2022-09-01 | 1 | 89512 | Extended Review |
| 2 | ChIJJ60m-q5t5kcRMZ9MdM8fVm4 | 2023-02-16 | 2023-02-12 | 2 | 10207146 | Pilot Initiative A |
| 3 | 2087740 | 2024-07-27 | 2024-07-23 | 3 | 212 | Baseline Model |
| 4 | 1250223 | 2025-12-11 | 2025-12-07 | 4 | id_14 | Distributed Cluster |

## Law Enforcement Agency to Person View

The view `v_law_enforcement_agency_person` joins `law_enforcement_agencies` with `persons` on `person_id`, answering: *Which person is associated with each agency?* Agency `1000` (*U.S. Steel*, established year `10`) joins to person `100`.

**View `v_law_enforcement_agency_person`**

```sql
CREATE VIEW v_law_enforcement_agency_person AS
SELECT a.law_enforcement_agency_id, a.agency_id, a.name, a.location_city, b.person_id AS person_person_id, b.first_name AS person_first_name, b.last_name AS person_last_name
FROM law_enforcement_agencies a JOIN persons b ON a.person_id = b.person_id;
```

| law_enforcement_agency_id | agency_id | name | location_city | person_person_id | person_first_name | person_last_name |
|---|---|---|---|---|---|---|
| 1000 | U.S. Steel | Extended Review | seasonal-location-23 | 100 | Stephanie Collins | Paul Allen |
| 1001 | Nikola Corporation | Pilot Initiative A | regional-location-24 | 101 | Janice Johnston | Heather Beasley |
| 1002 | Oberthur Technologies | Baseline Model | legacy-location-25 | 102 | Upal Saha | Audrey Taylor |
| 1003 | General Telephone & Electronics | Distributed Cluster | compact-location-26 | 103 | Katherine Snyder | Susan Wagner |

## Law Enforcement Agency to Division View

The view `v_law_enforcement_agency_law_enforcement_division` joins `law_enforcement_agencies` with `law_enforcement_divisions` on `law_enforcement_division_id`, answering: *Which division is associated with each agency?* Agency `1000` (*U.S. Steel*) joins to division `1` (*Extended Review*, established `2024-03-27`).

**View `v_law_enforcement_agency_law_enforcement_division`**

```sql
CREATE VIEW v_law_enforcement_agency_law_enforcement_division AS
SELECT a.law_enforcement_agency_id, a.agency_id, a.name, a.location_city, b.id AS division_id, b.division_id AS division_division_id, b.name AS division_name
FROM law_enforcement_agencies a JOIN law_enforcement_divisions b ON a.law_enforcement_division_id = b.id;
```

| law_enforcement_agency_id | agency_id | name | location_city | division_id | division_division_id | division_name |
|---|---|---|---|---|---|---|
| 1000 | U.S. Steel | Extended Review | seasonal-location-23 | 1 | 89512 | Extended Review |
| 1001 | Nikola Corporation | Pilot Initiative A | regional-location-24 | 2 | 10207146 | Pilot Initiative A |
| 1002 | Oberthur Technologies | Baseline Model | legacy-location-25 | 3 | 212 | Baseline Model |
| 1003 | General Telephone & Electronics | Distributed Cluster | compact-location-26 | 4 | id_14 | Distributed Cluster |

## Law Enforcement Division to Agency View

The view `v_law_enforcement_division_law_enforcement_agency` joins `law_enforcement_divisions` with `law_enforcement_agencies` on `law_enforcement_agency_id`, answering: *Which agency hosts each division?* Division `1` (*Extended Review*, parent agency *Charlotte-Mecklenburg Schools*) joins to agency `1000` (*U.S. Steel*, established year `10`).

**View `v_law_enforcement_division_law_enforcement_agency`**

```sql
CREATE VIEW v_law_enforcement_division_law_enforcement_agency AS
SELECT a.id, a.division_id, a.name, a.parent_agency_id, b.law_enforcement_agency_id AS agency_law_enforcement_agency_id, b.agency_id AS agency_agency_id, b.name AS agency_name
FROM law_enforcement_divisions a JOIN law_enforcement_agencies b ON a.law_enforcement_agency_id = b.law_enforcement_agency_id;
```

| id | division_id | name | parent_agency_id | agency_law_enforcement_agency_id | agency_agency_id | agency_name |
|---|---|---|---|---|---|---|
| 1 | 89512 | Extended Review | Charlotte-Mecklenburg Schools | 1000 | U.S. Steel | Extended Review |
| 2 | 10207146 | Pilot Initiative A | Lucas Industries | 1001 | Nikola Corporation | Pilot Initiative A |
| 3 | 212 | Baseline Model | Altice USA | 1002 | Oberthur Technologies | Baseline Model |
| 4 | id_14 | Distributed Cluster | Thales Group | 1003 | General Telephone & Electronics | Distributed Cluster |

## Law Enforcement Division to Person View

The view `v_law_enforcement_division_person` joins `law_enforcement_divisions` with `persons` on `person_id`, answering: *Which person is associated with each division?* Division `1` (*Extended Review*, established `2024-03-27`) joins to person `100`.

**View `v_law_enforcement_division_person`**

```sql
CREATE VIEW v_law_enforcement_division_person AS
SELECT a.id, a.division_id, a.name, a.parent_agency_id, b.person_id AS person_person_id, b.first_name AS person_first_name, b.last_name AS person_last_name
FROM law_enforcement_divisions a JOIN persons b ON a.person_id = b.person_id;
```

| id | division_id | name | parent_agency_id | person_person_id | person_first_name | person_last_name |
|---|---|---|---|---|---|---|
| 1 | 89512 | Extended Review | Charlotte-Mecklenburg Schools | 100 | Stephanie Collins | Paul Allen |
| 2 | 10207146 | Pilot Initiative A | Lucas Industries | 101 | Janice Johnston | Heather Beasley |
| 3 | 212 | Baseline Model | Altice USA | 102 | Upal Saha | Audrey Taylor |
| 4 | id_14 | Distributed Cluster | Thales Group | 103 | Katherine Snyder | Susan Wagner |

## Academic Award to Person View

The view `v_academic_award_person` joins `academic_awards` with `persons` on `person_id`, answering: *Which person is associated with each academic award?* Award `1` joins to person `100`.

**View `v_academic_award_person`**

```sql
CREATE VIEW v_academic_award_person AS
SELECT a.id, a.award_id, a.name, a.awarding_organization, b.person_id AS person_person_id, b.first_name AS person_first_name, b.last_name AS person_last_name
FROM academic_awards a JOIN persons b ON a.person_id = b.person_id;
```

| id | award_id | name | awarding_organization | person_person_id | person_first_name | person_last_name |
|---|---|---|---|---|---|---|
| 1 | e02275d4-8fd1-11eb-924d-9cd76263cbd0 | Extended Review | School District of Philadelphia | 100 | Stephanie Collins | Paul Allen |
| 2 | 3012811 | Pilot Initiative A | School District of Philadelphia | 101 | Janice Johnston | Heather Beasley |
| 3 | 15493350 | Baseline Model | Luddic Church | 102 | Upal Saha | Audrey Taylor |
| 4 | state_uk_17 | Distributed Cluster | Feedback Rating | 103 | Katherine Snyder | Susan Wagner |

## Academic Award to Institution View

The view `v_academic_award_academic_institution` joins `academic_awards` with `academic_institutions` on `academic_award_id`, answering: *Which institution holds each award?* Award `1` joins to institution `9424913` (*Extended Review*, located at *seasonal-location-23*).

**View `v_academic_award_academic_institution`**

```sql
CREATE VIEW v_academic_award_academic_institution AS
SELECT a.id, a.award_id, a.name, a.awarding_organization, b.id AS institution_id, b.institution_id AS institution_institution_id, b.name AS institution_name
FROM academic_awards a JOIN academic_institutions b ON a.academic_institution_id = b.id;
```

| id | award_id | name | awarding_organization | institution_id | institution_institution_id | institution_name |
|---|---|---|---|---|---|---|
| 1 | e02275d4-8fd1-11eb-924d-9cd76263cbd0 | Extended Review | School District of Philadelphia | 1 | 9424913 | Extended Review |
| 2 | 3012811 | Pilot Initiative A | School District of Philadelphia | 2 | 8189481 | Pilot Initiative A |
| 3 | 15493350 | Baseline Model | Luddic Church | 3 | 1437604 | Baseline Model |
| 4 | state_uk_17 | Distributed Cluster | Feedback Rating | 4 | 884346 | Distributed Cluster |

## Person to Academic Appointment View

The view `v_person_academic_appointment` joins `persons` with `academic_appointments` on `person_id`, answering the inverse question: *Which academic appointments does each person hold?* Person `100` joins to appointment `2087748` (title *Compact Initiative*, institution *Extended Corridor*, department *adaptive-departme-89*).

**View `v_person_academic_appointment`**

```sql
CREATE VIEW v_person_academic_appointment AS
SELECT a.person_id, a.first_name, a.last_name, a.birth_date, b.id AS appointment_id, b.appointment_id AS appointment_appointment_id, b.start_date AS appointment_start_date
FROM persons a JOIN academic_appointments b ON a.academic_appointment_id = b.id;
```

| person_id | first_name | last_name | birth_date | appointment_id | appointment_appointment_id | appointment_start_date |
|---|---|---|---|---|---|---|
| 100 | Stephanie Collins | Paul Allen | 2023-10-18 | 1 | 2087748 | 2022-09-05 |
| 101 | Janice Johnston | Heather Beasley | 2024-03-02 | 2 | ChIJJ60m-q5t5kcRMZ9MdM8fVm4 | 2023-02-16 |
| 102 | Upal Saha | Audrey Taylor | 2025-08-13 | 3 | 2087740 | 2024-07-27 |
| 103 | Katherine Snyder | Susan Wagner | 2022-01-24 | 4 | 1250223 | 2025-12-11 |

## Person to Law Enforcement Appointment View

The view `v_person_law_enforcement_appointment` joins `persons` with `law_enforcement_appointments` on `person_id`, answering: *Which law enforcement appointments does each person hold?* Person `100` joins to appointment `2087748` (title *Compact Initiative*, agency *FSG Social Impact Advisors*, jurisdiction *regional-jurisdic-30*).

**View `v_person_law_enforcement_appointment`**

```sql
CREATE VIEW v_person_law_enforcement_appointment AS
SELECT a.person_id, a.first_name, a.last_name, a.birth_date, b.id AS appointment_id, b.appointment_id AS appointment_appointment_id, b.start_date AS appointment_start_date
FROM persons a JOIN law_enforcement_appointments b ON a.law_enforcement_appointment_id = b.id;
```

| person_id | first_name | last_name | birth_date | appointment_id | appointment_appointment_id | appointment_start_date |
|---|---|---|---|---|---|---|
| 100 | Stephanie Collins | Paul Allen | 2023-10-18 | 1 | 2087748 | 2022-09-05 |
| 101 | Janice Johnston | Heather Beasley | 2024-03-02 | 2 | ChIJJ60m-q5t5kcRMZ9MdM8fVm4 | 2023-02-16 |
| 102 | Upal Saha | Audrey Taylor | 2025-08-13 | 3 | 2087740 | 2024-07-27 |
| 103 | Katherine Snyder | Susan Wagner | 2022-01-24 | 4 | 1250223 | 2025-12-11 |

## Person to Academic Award View

The view `v_person_academic_award` joins `persons` with `academic_awards` on `person_id`, answering: *Which academic awards does each person hold?* Person `100` joins to award `1`.

**View `v_person_academic_award`**

```sql
CREATE VIEW v_person_academic_award AS
SELECT a.person_id, a.first_name, a.last_name, a.birth_date, b.id AS award_id, b.award_id AS award_award_id, b.name AS award_name
FROM persons a JOIN academic_awards b ON a.academic_award_id = b.id;
```

| person_id | first_name | last_name | birth_date | award_id | award_award_id | award_name |
|---|---|---|---|---|---|---|
| 100 | Stephanie Collins | Paul Allen | 2023-10-18 | 1 | e02275d4-8fd1-11eb-924d-9cd76263cbd0 | Extended Review |
| 101 | Janice Johnston | Heather Beasley | 2024-03-02 | 2 | 3012811 | Pilot Initiative A |
| 102 | Upal Saha | Audrey Taylor | 2025-08-13 | 3 | 15493350 | Baseline Model |
| 103 | Katherine Snyder | Susan Wagner | 2022-01-24 | 4 | state_uk_17 | Distributed Cluster |

## Person to Academic Institution View

The view `v_person_academic_institution` joins `persons` with `academic_institutions` on `person_id`, answering: *Which academic institutions is each person associated with?* Person `100` joins to institution `9424913` (*Extended Review*, located at *seasonal-location-23*).

**View `v_person_academic_institution`**

```sql
CREATE VIEW v_person_academic_institution AS
SELECT a.person_id, a.first_name, a.last_name, a.birth_date, b.id AS institution_id, b.institution_id AS institution_institution_id, b.name AS institution_name
FROM persons a JOIN academic_institutions b ON a.academic_institution_id = b.id;
```

| person_id | first_name | last_name | birth_date | institution_id | institution_institution_id | institution_name |
|---|---|---|---|---|---|---|
| 100 | Stephanie Collins | Paul Allen | 2023-10-18 | 1 | 9424913 | Extended Review |
| 101 | Janice Johnston | Heather Beasley | 2024-03-02 | 2 | 8189481 | Pilot Initiative A |
| 102 | Upal Saha | Audrey Taylor | 2025-08-13 | 3 | 1437604 | Baseline Model |
| 103 | Katherine Snyder | Susan Wagner | 2022-01-24 | 4 | 884346 | Distributed Cluster |

## Synthesis

The schema models a dual-domain professional landscape where each person may hold concurrent or sequential roles in both academia and law enforcement. The eight base tables form a normalized core: `persons` is the universal anchor, `academic_appointments` and `law_enforcement_appointments` record temporal role assignments, `academic_institutions` and `law_enforcement_agencies` store organizational entities with location metadata, `academic_departments` and `law_enforcement_divisions` model organizational subdivisions, and `academic_awards` captures recognition records. Foreign keys enforce the cardinality constraints: each appointment references exactly one person, one institution or agency, and one department or division; each institution references one department and one award; each department references one institution and one person; each agency references one division and one person; each division references one agency and one person. The twenty-four views materialize every pairwise join between related tables, enabling queries that reconstruct domain facts—such as "which institution hosts the department where person `100` holds appointment `2087748`"—from the normalized base tables without requiring ad-hoc multi-table joins. This design achieves a balance between normalization (avoiding redundancy in names, locations, and dates) and query convenience (providing pre-joined views for common access patterns).