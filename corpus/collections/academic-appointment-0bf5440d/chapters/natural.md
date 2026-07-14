## The Architecture of Dual-Career Records

Every professional ecosystem contains individuals who hold positions across multiple organizational structures. In this domain, the records capture two distinct career tracks: academic appointments within educational institutions and law enforcement appointments within regulatory agencies. The data model tracks persons, their affiliations, the organizations they serve, and the honors they receive. Each person may hold an academic appointment at an institution, a law enforcement appointment with an agency, and an academic award. The base tables store the raw records; the views assemble them into coherent narratives about who worked where, when, and for what recognition.

**Table `persons`**

| person_id | first_name | last_name | birth_date | nationality | academic_appointment_id | law_enforcement_appointment_id | academic_award_id | academic_institution_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|
| 100 | Stephanie Collins | Paul Allen | 2023-10-18 | composite-national-39 | 1 | 1 | 1 | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 101 | Janice Johnston | Heather Beasley | 2024-03-02 | primary-national-40 | 2 | 2 | 2 | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 102 | Upal Saha | Audrey Taylor | 2025-08-13 | adaptive-national-41 | 3 | 3 | 3 | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 103 | Katherine Snyder | Susan Wagner | 2022-01-24 | distributed-national-42 | 4 | 4 | 4 | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The persons table anchors the entire system. Each row represents a unique individual identified by a `person_id`. The `full_name` field carries the person's legal name, while `date_of_birth` and `gender` provide demographic context. The `email_address` and `phone_number` fields supply contact information, and `created_at` / `updated_at` timestamps record when the record was first created and last modified. Person 100, for example, is listed as "Person 100" with the email "person.100@example.com" and was created on 2025-01-01. Person 103, "Person 103," carries the email "person.103@example.com" and was last updated on 2025-04-23. These identifiers link every appointment, department, agency, division, and award back to a single human subject.

**Table `academic_appointments`**

| id | appointment_id | start_date | end_date | title | department | institution_name | academic_institution_id | person_id | academic_department_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 2087748 | 2022-09-05 | 2022-09-01 | Compact Initiative | adaptive-departme-89 | Extended Corridor | 1 | 100 | 1000 |
| 2 | ChIJJ60m-q5t5kcRMZ9MdM8fVm4 | 2023-02-16 | 2023-02-12 | Legacy Model | distributed-departme-90 | Pilot Series A | 2 | 101 | 1001 |
| 3 | 2087740 | 2024-07-27 | 2024-07-23 | Regional Cluster A | baseline-departme-91 | Baseline Assessment | 3 | 102 | 1002 |
| 4 | 1250223 | 2025-12-11 | 2025-12-07 | Seasonal Review | pilot-departme-92 | Distributed Survey | 4 | 103 | 1003 |

Academic appointments record the tenure of a person within an academic department at an academic institution. Each row carries an `appointment_id` (such as `2087748` or `ChIJJ60m-q5t5kcRMZ9MdM8fVm4`), a `title` describing the role (e.g., "Compact Initiative" or "Legacy Model"), and a `department` name (e.g., "adaptive-departme-89" or "distributed-departme-90"). The `start_date` and `end_date` fields define the appointment window. The foreign keys `academic_institution_id` and `academic_department_id` tie the appointment to its organizational home, while `person_id` identifies the appointee. Row 1, for instance, links person 100 to institution 1 and department 1000, with a title of "Compact Initiative" spanning from 2022-09-05 to 2022-09-01. Row 4 links person 103 to institution 4 and department 1003, titled "Seasonal Review," running from 2025-12-11 to 2025-12-07.

**Table `academic_institutions`**

| id | institution_id | name | location_city | location_state | location_country | founding_year | academic_department_id | academic_award_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 9424913 | Extended Review | seasonal-location-23 | composite-location-93 | adaptive-location-47 | 43 | 1000 | 1 |
| 2 | 8189481 | Pilot Initiative A | regional-location-24 | primary-location-94 | distributed-location-48 | 48 | 1001 | 2 |
| 3 | 1437604 | Baseline Model | legacy-location-25 | adaptive-location-95 | baseline-location-49 | 53 | 1002 | 3 |
| 4 | 884346 | Distributed Cluster | compact-location-26 | distributed-location-96 | pilot-location-50 | 58 | 1003 | 4 |

Academic institutions represent the educational organizations themselves. Each row has an `institution_id` (e.g., `9424913` or `8189481`), a `name` (such as "Extended Review" or "Pilot Initiative A"), and geographic fields: `location_city`, `location_state`, and `location_country`. The `founding_year` records when the institution was established (values range from 43 to 58 in the sample data). The `academic_department_id` and `academic_award_id` foreign keys connect the institution to its departments and awards. Institution 1, "Extended Review," was founded in year 43 and is located at `seasonal-location-23`, `composite-location-93`, `adaptive-location-47`. Institution 4, "Distributed Cluster," was founded in year 58 and sits at `compact-location-26`, `distributed-location-96`, `pilot-location-50`.

**Table `academic_departments`**

| id | department_id | name | parent_institution_id | established_date | academic_institution_id | person_id |
|---|---|---|---|---|---|---|
| 1000 | 2087755 | Extended Review | 209215 | 2024-03-27 | 1 | 100 |
| 1001 | 790483 | Pilot Initiative A | 14c2e512-8fcd-11eb-924d-9cd76263cbd0 | 2025-08-11 | 2 | 101 |
| 1002 | 505978 | Baseline Model | 505979 | 2022-01-22 | 3 | 102 |
| 1003 | id_6 | Distributed Cluster | 1186081 | 2023-06-06 | 4 | 103 |

Academic departments are the subunits within institutions. Each row carries a `department_id` (e.g., `2087755` or `790483`), a `name` (such as "Extended Review" or "Pilot Initiative A"), and a `parent_institution_id` that references the parent organization. The `established_date` records when the department was created. The `academic_institution_id` and `person_id` foreign keys link the department to its institution and to a person associated with it. Department 1000, "Extended Review," was established on 2024-03-27 under institution 1 and is associated with person 100. Department 1003, "Distributed Cluster," was established on 2023-06-06 under institution 4 and is associated with person 103.

**Table `law_enforcement_appointments`**

| id | appointment_id | start_date | end_date | title | agency_name | jurisdiction | law_enforcement_agency_id | person_id | law_enforcement_division_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 2087748 | 2022-09-05 | 2022-09-01 | Compact Initiative | FSG Social Impact Advisors | regional-jurisdic-30 | 1000 | 100 | 1 |
| 2 | ChIJJ60m-q5t5kcRMZ9MdM8fVm4 | 2023-02-16 | 2023-02-12 | Legacy Model | Whirlpool Corporation | legacy-jurisdic-31 | 1001 | 101 | 2 |
| 3 | 2087740 | 2024-07-27 | 2024-07-23 | Regional Cluster A | Education Writers Association | compact-jurisdic-32 | 1002 | 102 | 3 |
| 4 | 1250223 | 2025-12-11 | 2025-12-07 | Seasonal Review | Switch Card Services Ltd. | composite-jurisdic-33 | 1003 | 103 | 4 |

Law enforcement appointments record the tenure of a person within a law enforcement division of a law enforcement agency. Each row carries an `appointment_id` (e.g., `2087748` or `ChIJJ60m-q5t5kcRMZ9MdM8fVm4`), a `title` (e.g., "Compact Initiative" or "Legacy Model"), and an `agency_name` (e.g., "FSG Social Impact Advisors" or "Whirlpool Corporation"). The `jurisdiction` field describes the operational area (e.g., "regional-jurisdic-30" or "legacy-jurisdic-31"). The `start_date` and `end_date` fields define the appointment window. The foreign keys `law_enforcement_agency_id` and `law_enforcement_division_id` tie the appointment to its organizational home, while `person_id` identifies the appointee. Row 1 links person 100 to agency 1000 and division 1, titled "Compact Initiative," spanning 2022-09-05 to 2022-09-01. Row 4 links person 103 to agency 1003 and division 4, titled "Seasonal Review," spanning 2025-12-11 to 2025-12-07.

**Table `law_enforcement_agencies`**

| law_enforcement_agency_id | agency_id | name | location_city | location_state | location_country | established_year | person_id | law_enforcement_division_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|
| 1000 | U.S. Steel | Extended Review | seasonal-location-23 | composite-location-93 | adaptive-location-47 | 10 | 100 | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 1001 | Nikola Corporation | Pilot Initiative A | regional-location-24 | primary-location-94 | distributed-location-48 | 16 | 101 | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 1002 | Oberthur Technologies | Baseline Model | legacy-location-25 | adaptive-location-95 | baseline-location-49 | 22 | 102 | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 1003 | General Telephone & Electronics | Distributed Cluster | compact-location-26 | distributed-location-96 | pilot-location-50 | 28 | 103 | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Law enforcement agencies are the parent organizations within the law enforcement track. Each row has a `law_enforcement_agency_id` (e.g., `1000` or `1001`), an `agency_id` (e.g., "U.S. Steel" or "Nikola Corporation"), and a `name` (such as "Extended Review" or "Pilot Initiative A"). Geographic fields include `location_city`, `location_state`, and `location_country`. The `established_year` records when the agency was founded (values range from 10 to 28). The `person_id` and `law_enforcement_division_id` foreign keys link the agency to a person and a division. Agency 1000, "Extended Review," was established in year 10 and is located at `seasonal-location-23`, `composite-location-93`, `adaptive-location-47`. Agency 1003, "Distributed Cluster," was established in year 28 and is located at `compact-location-26`, `distributed-location-96`, `pilot-location-50`.

**Table `law_enforcement_divisions`**

| id | division_id | name | parent_agency_id | established_date | law_enforcement_agency_id | person_id |
|---|---|---|---|---|---|---|
| 1 | 89512 | Extended Review | Charlotte-Mecklenburg Schools | 2024-03-27 | 1000 | 100 |
| 2 | 10207146 | Pilot Initiative A | Lucas Industries | 2025-08-11 | 1001 | 101 |
| 3 | 212 | Baseline Model | Altice USA | 2022-01-22 | 1002 | 102 |
| 4 | id_14 | Distributed Cluster | Thales Group | 2023-06-06 | 1003 | 103 |

Law enforcement divisions are the subunits within agencies. Each row carries an `id`, a `division_id` (e.g., `89512` or `10207146`), a `name` (such as "Extended Review" or "Pilot Initiative A"), and a `parent_agency_id` referencing the parent organization. The `established_date` records when the division was created. The `law_enforcement_agency_id` and `person_id` foreign keys link the division to its agency and to a person. Division 1, "Extended Review," was established on 2024-03-27 under agency 1000 and is associated with person 100. Division 4, "Distributed Cluster," was established on 2023-06-06 under agency 1003 and is associated with person 103.

**Table `academic_awards`**

| id | award_id | name | awarding_organization | year_awarded | citation | person_id | academic_institution_id |
|---|---|---|---|---|---|---|---|
| 1 | e02275d4-8fd1-11eb-924d-9cd76263cbd0 | Extended Review | School District of Philadelphia | 37 | legacy-citation-79 | 100 | 1 |
| 2 | 3012811 | Pilot Initiative A | School District of Philadelphia | 46 | compact-citation-80 | 101 | 2 |
| 3 | 15493350 | Baseline Model | Luddic Church | 55 | composite-citation-81 | 102 | 3 |
| 4 | state_uk_17 | Distributed Cluster | Feedback Rating | 64 | primary-citation-82 | 103 | 4 |

Academic awards capture the honors bestowed upon persons or institutions. The table stores award identifiers, names, the date they were conferred, and the recipient type and identifier. Awards link persons to their recognitions and institutions to the honors they have received.

## Academic Career Records

The academic career track is built from three base tables—`academic_appointments`, `academic_institutions`, and `academic_departments`—and enriched by the `academic_awards` table. The views join these tables to answer specific questions about the academic career landscape.

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

This view joins academic appointments with their parent institutions, answering the question: which institution did each appointment belong to? The result pairs each appointment's `appointment_id`, `title`, and `start_date` with the institution's `name`, `location_city`, and `founding_year`. Row 1 shows appointment `2087748` (title "Compact Initiative") at institution "Extended Review," founded in year 43. Row 4 shows appointment `1250223` (title "Seasonal Review") at institution "Distributed Cluster," founded in year 58.

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

This view joins academic appointments with the persons who held them, answering: who held each appointment? The result pairs each appointment's `appointment_id`, `title`, and `department` with the person's `full_name`, `email_address`, and `date_of_birth`. Row 1 shows appointment `2087748` (title "Compact Initiative") held by person 100 ("Person 100", email "person.100@example.com"). Row 4 shows appointment `1250223` (title "Seasonal Review") held by person 103 ("Person 103", email "person.103@example.com").

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

This view joins academic appointments with their parent departments, answering: which department hosted each appointment? The result pairs each appointment's `appointment_id`, `title`, and `start_date` with the department's `name`, `parent_institution_id`, and `established_date`. Row 1 shows appointment `2087748` (title "Compact Initiative") in department "Extended Review" (established 2024-03-27). Row 4 shows appointment `1250223` (title "Seasonal Review") in department "Distributed Cluster" (established 2023-06-06).

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

This view joins academic institutions with their departments, answering: which departments belong to which institution? The result pairs each institution's `name`, `location_city`, and `founding_year` with the department's `name`, `parent_institution_id`, and `established_date`. Row 1 shows institution "Extended Review" (founded year 43) with department "Extended Review" (established 2024-03-27). Row 4 shows institution "Distributed Cluster" (founded year 58) with department "Distributed Cluster" (established 2023-06-06).

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

This view joins academic institutions with the awards associated with them, answering: which awards are linked to which institution? The result pairs each institution's `name`, `location_city`, and `founding_year` with the award's `name`, `award_date`, and `recipient_type`. Row 1 shows institution "Extended Review" linked to award 1. Row 4 shows institution "Distributed Cluster" linked to award 4.

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

This view joins academic departments with their parent institutions, answering: which institution does each department belong to? The result pairs each department's `name`, `parent_institution_id`, and `established_date` with the institution's `name`, `location_city`, and `founding_year`. Row 1 shows department "Extended Review" (established 2024-03-27) under institution "Extended Review" (founded year 43). Row 4 shows department "Distributed Cluster" (established 2023-06-06) under institution "Distributed Cluster" (founded year 58).

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

This view joins academic departments with the persons associated with them, answering: which person is linked to each department? The result pairs each department's `name`, `parent_institution_id`, and `established_date` with the person's `full_name`, `email_address`, and `date_of_birth`. Row 1 shows department "Extended Review" associated with person 100 ("Person 100"). Row 4 shows department "Distributed Cluster" associated with person 103 ("Person 103").

## Law Enforcement Career Records

The law enforcement career track is built from three base tables—`law_enforcement_appointments`, `law_enforcement_agencies`, and `law_enforcement_divisions`. The views join these tables to answer specific questions about the law enforcement career landscape.

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

This view joins law enforcement appointments with their parent agencies, answering: which agency did each appointment belong to? The result pairs each appointment's `appointment_id`, `title`, and `start_date` with the agency's `name`, `location_city`, and `established_year`. Row 1 shows appointment `2087748` (title "Compact Initiative") at agency "Extended Review" (established year 10). Row 4 shows appointment `1250223` (title "Seasonal Review") at agency "Distributed Cluster" (established year 28).

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

This view joins law enforcement appointments with the persons who held them, answering: who held each law enforcement appointment? The result pairs each appointment's `appointment_id`, `title`, and `agency_name` with the person's `full_name`, `email_address`, and `date_of_birth`. Row 1 shows appointment `2087748` (title "Compact Initiative") held by person 100 ("Person 100", email "person.100@example.com"). Row 4 shows appointment `1250223` (title "Seasonal Review") held by person 103 ("Person 103", email "person.103@example.com").

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

This view joins law enforcement appointments with their parent divisions, answering: which division hosted each appointment? The result pairs each appointment's `appointment_id`, `title`, and `start_date` with the division's `name`, `parent_agency_id`, and `established_date`. Row 1 shows appointment `2087748` (title "Compact Initiative") in division "Extended Review" (established 2024-03-27). Row 4 shows appointment `1250223` (title "Seasonal Review") in division "Distributed Cluster" (established 2023-06-06).

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

This view joins law enforcement agencies with the persons associated with them, answering: which person is linked to each agency? The result pairs each agency's `name`, `location_city`, and `established_year` with the person's `full_name`, `email_address`, and `date_of_birth`. Row 1 shows agency "Extended Review" (established year 10) associated with person 100 ("Person 100"). Row 4 shows agency "Distributed Cluster" (established year 28) associated with person 103 ("Person 103").

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

This view joins law enforcement agencies with their divisions, answering: which divisions belong to which agency? The result pairs each agency's `name`, `location_city`, and `established_year` with the division's `name`, `parent_agency_id`, and `established_date`. Row 1 shows agency "Extended Review" (established year 10) with division "Extended Review" (established 2024-03-27). Row 4 shows agency "Distributed Cluster" (established year 28) with division "Distributed Cluster" (established 2023-06-06).

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

This view joins law enforcement divisions with their parent agencies, answering: which agency does each division belong to? The result pairs each division's `name`, `parent_agency_id`, and `established_date` with the agency's `name`, `location_city`, and `established_year`. Row 1 shows division "Extended Review" (established 2024-03-27) under agency "Extended Review" (established year 10). Row 4 shows division "Distributed Cluster" (established 2023-06-06) under agency "Distributed Cluster" (established year 28).

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

This view joins law enforcement divisions with the persons associated with them, answering: which person is linked to each division? The result pairs each division's `name`, `parent_agency_id`, and `established_date` with the person's `full_name`, `email_address`, and `date_of_birth`. Row 1 shows division "Extended Review" associated with person 100 ("Person 100"). Row 4 shows division "Distributed Cluster" associated with person 103 ("Person 103").

## Awards and Person-Centric Views

The remaining views connect awards to persons and institutions, and provide person-centric aggregations that summarize each individual's full career profile across both tracks.

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

This view joins academic awards with the persons who received them, answering: which person received which award? The result pairs each award's `name`, `award_date`, and `recipient_type` with the person's `full_name`, `email_address`, and `date_of_birth`. Row 1 links award 1 to person 100. Row 4 links award 4 to person 103.

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

This view joins academic awards with the institutions associated with them, answering: which institution is linked to which award? The result pairs each award's `name`, `award_date`, and `recipient_type` with the institution's `name`, `location_city`, and `founding_year`. Row 1 links award 1 to institution "Extended Review" (founded year 43). Row 4 links award 4 to institution "Distributed Cluster" (founded year 58).

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

This view joins persons with their academic appointments, answering: what academic appointments did each person hold? The result pairs each person's `full_name`, `email_address`, and `date_of_birth` with the appointment's `appointment_id`, `title`, and `start_date`. Row 1 shows person 100 ("Person 100") holding appointment `2087748` (title "Compact Initiative", started 2022-09-05). Row 4 shows person 103 ("Person 103") holding appointment `1250223` (title "Seasonal Review", started 2025-12-11).

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

This view joins persons with their law enforcement appointments, answering: what law enforcement appointments did each person hold? The result pairs each person's `full_name`, `email_address`, and `date_of_birth` with the appointment's `appointment_id`, `title`, and `start_date`. Row 1 shows person 100 ("Person 100") holding appointment `2087748` (title "Compact Initiative", started 2022-09-05). Row 4 shows person 103 ("Person 103") holding appointment `1250223` (title "Seasonal Review", started 2025-12-11).

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

This view joins persons with the academic awards they received, answering: which awards did each person receive? The result pairs each person's `full_name`, `email_address`, and `date_of_birth` with the award's `name`, `award_date`, and `recipient_type`. Row 1 shows person 100 ("Person 100") receiving award 1. Row 4 shows person 103 ("Person 103") receiving award 4.

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

This view joins persons with the academic institutions they are associated with, answering: which institution is each person linked to? The result pairs each person's `full_name`, `email_address`, and `date_of_birth` with the institution's `name`, `location_city`, and `founding_year`. Row 1 shows person 100 ("Person 100") linked to institution "Extended Review" (founded year 43). Row 4 shows person 103 ("Person 103") linked to institution "Distributed Cluster" (founded year 58).

## Synthesis

The domain captures the professional trajectories of individuals across two parallel career tracks. Academic appointments connect persons to departments within institutions, with each appointment carrying a title, a date range, and organizational identifiers. Law enforcement appointments connect persons to divisions within agencies, with each appointment carrying a title, a jurisdiction, and organizational identifiers. Academic awards link persons and institutions to specific honors. The base tables store the atomic records; the views assemble them into person-centric and organization-centric narratives. Person 100, for example, appears in the academic track at institution "Extended Review" (founded year 43) in department "Extended Review" (established 2024-03-27) with appointment `2087748` (title "Compact Initiative"), and in the law enforcement track at agency "Extended Review" (established year 10) in division "Extended Review" (established 2024-03-27) with appointment `2087748` (title "Compact Initiative"). Person 103 follows a parallel pattern at institution "Distributed Cluster" (founded year 58) and agency "Distributed Cluster" (established year 28). The views ensure that any query about a person, an institution, an agency, a department, or a division can be answered by joining the appropriate tables, producing a complete picture of the professional relationships recorded in the system.