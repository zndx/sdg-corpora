## Domain Modelling and Relational Materialization

The domain under examination governs the operational lifecycle of nonprofit organizations that manage physical facilities, run programs, host events, and sustain donor relationships. At its core, the model distinguishes seven principal entity types—`executive_directors`, `organizations`, `facilities`, `events`, `programs`, `staff_members`, and `donors`—and binds them together through a set of junction tables that capture many-to-many associations. The relational schema is fully normalized: every entity type occupies its own table, foreign keys encode one-to-many and many-to-one relationships, and junction tables resolve many-to-many links. Views then materialize denormalized projections that answer specific analytical questions by joining the normalized base tables back together.

**Table `executive_directors`**

| id | employee_id | reporting_to | position_type | salary_min | salary_max | degree_level | years_experience | is_exempt | organization_id | facility_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | Norma Fisher | integrated-reportin-82 | distributed-position-78 | 13.49 | 13.94 | primary-degree-22 | 16 | true | 1 | 1000 |
| 2 | Tasha Rodriguez | seasonal-reportin-83 | baseline-position-79 | 17.12 | 25.36 | adaptive-degree-23 | 22 | false | 2 | 1001 |
| 3 | Theodore Mcgrath | regional-reportin-84 | pilot-position-80 | 25.36 | 26.25 | distributed-degree-24 | 28 | true | 3 | 1002 |
| 4 | Peter Mcdowell | legacy-reportin-85 | extended-position-81 | 35.61 | 10.72 | baseline-degree-25 | 34 | false | 4 | 1003 |

The `executive_directors` table anchors the leadership hierarchy. Each row represents a single executive, identified by a surrogate `id` and distinguished by an `employee_id` such as "Norma Fisher" or "Tasha Rodriguez." The `reporting_to` column encodes a self-referential chain of command—values like "integrated-reportin-82" and "seasonal-reportin-83" denote the reporting relationship within the organizational structure. Position characteristics are captured through `position_type` (e.g., "distributed-position-78", "baseline-position-79"), while compensation is bounded by `salary_min` and `salary_max` (for instance, row 1 spans 13.49 to 13.94). The `degree_level` column stores educational attainment ("primary-degree-22", "adaptive-degree-23"), `years_experience` quantifies tenure (16, 22, 28, 34), and `is_exempt` is a boolean flag. Crucially, `organization_id` and `facility_id` are foreign keys that tie each executive to a specific organization and facility, respectively, establishing a one-to-many relationship from both `organizations` and `facilities` to `executive_directors`.

**Table `organizations`**

| id | legal_name | founded_year | annual_revenue | employee_count | volunteer_count | location | is_nonprofit | facility_id | donor_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | Adaptive Model | 27 | 12,608 | 131 | 85 | extended-location-99 | false | 1000 | 1 |
| 2 | Primary Cluster | 31 | 56,418 | 428 | 5 | integrated-location-100 | true | 1001 | 2 |
| 3 | Composite Review D | 35 | 16,254 | 3 | 4 | seasonal-location-101 | false | 1002 | 3 |
| 4 | Compact Initiative | 39 | 745,000 | 9 | 32 | regional-location-102 | true | 1003 | 4 |

The `organizations` table is the central hub of the domain. Each row identifies a legal entity through `legal_name`—"Adaptive Model", "Primary Cluster", "Composite Review D", "Compact Initiative"—alongside `founded_year` (27, 31, 35, 39), `annual_revenue` (12,608 through 745,000), `employee_count` (3 to 428), and `volunteer_count` (5 to 85). The `location` column stores a categorical descriptor ("extended-location-99", "integrated-location-100"), and `is_nonprofit` is a boolean flag. The `facility_id` and `donor_id` columns are foreign keys pointing to the `facilities` and `donors` tables, respectively, indicating that each organization is associated with a primary facility and a primary donor.

**Table `facilities`**

| id | building_count | age_min | age_max | safety_status | last_inspection_date | maintenance_schedule | is_historic | organization_id |
|---|---|---|---|---|---|---|---|---|
| 1000 | 15 | 19 | 24 | integrated-safety-88 | 2025-04-12 | adaptive-maintena-59 | true | 1 |
| 1001 | 45 | 25 | 27 | seasonal-safety-89 | 2022-09-23 | distributed-maintena-60 | false | 2 |
| 1002 | 18 | 31 | 30 | regional-safety-90 | 2023-02-07 | baseline-maintena-61 | true | 3 |
| 1003 | 7 | 37 | 33 | legacy-safety-91 | 2024-07-18 | pilot-maintena-62 | false | 4 |

Facilities represent the physical infrastructure managed by organizations. The `facilities` table stores `building_count` (7 to 45), age ranges via `age_min` and `age_max` (e.g., 19–24 for facility 1000), `safety_status` ("integrated-safety-88", "seasonal-safety-89"), `last_inspection_date` (ranging from 2022-09-23 to 2025-04-12), `maintenance_schedule` ("adaptive-maintena-59", "distributed-maintena-60"), and `is_historic` (a boolean). The `organization_id` foreign key establishes that each facility belongs to exactly one organization, while the reverse relationship is many-to-one.

**Table `events`**

| event_id | event_name | event_date | event_type | is_rental_show | attendee_count | revenue_generated | facility_id | organization_id | staff_member_staff_id | program_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 2002007020060 | Seasonal Standard | 2025-04-15T15:21:00 | distributed-event-24 | false | 6 | 13.49 | 1000 | 1 | 937735 | 1000 |
| 168535 | Integrated Framework | 2022-09-26T22:38:00 | baseline-event-25 | true | 23 | 19.97 | 1001 | 2 | 3158139 | 1001 |
| ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 | Extended Protocol D | 2023-02-10T05:55:00 | pilot-event-26 | false | 0 | 13.49 | 1002 | 3 | 8189502 | 1002 |
| 1186089 | Pilot Programme | 2024-07-21T12:12:00 | extended-event-27 | true | 32 | 21.11 | 1003 | 4 | 69438 | 1003 |

Events are the operational activities that bring the domain to life. The `events` table uses a composite identifier `event_id` that can be numeric ("2002007020060", "168535") or UUID-formatted ("ab8e1d18-8fcd-11eb-924d-9cd76263cbd0"). Each event has an `event_name` ("Seasonal Standard", "Integrated Framework"), an `event_date` with full timestamp precision, an `event_type` ("distributed-event-24", "baseline-event-25"), and an `is_rental_show` boolean. Attendance and financial impact are captured through `attendee_count` (0 to 32) and `revenue_generated` (13.49 to 21.11). The `facility_id`, `organization_id`, `staff_member_staff_id`, and `program_id` columns are all foreign keys, meaning each event is simultaneously associated with a facility, an organization, a staff member, and a program.

**Table `programs`**

| program_id | program_name | year | event_count | budget | status | executive_director_id | donor_id |
|---|---|---|---|---|---|---|---|
| 1000 | Extended Review | 12 | 26 | 35.45 | regional-status-84 | 1 | 1 |
| 1001 | Pilot Initiative A | 21 | 22 | 18.47 | legacy-status-85 | 2 | 2 |
| 1002 | Baseline Model | 30 | 19 | 26.25 | compact-status-86 | 3 | 3 |
| 1003 | Distributed Cluster | 39 | 64 | 17.12 | composite-status-87 | 4 | 4 |

Programs encapsulate structured initiatives. The `programs` table uses `program_id` (1000–1003) as its key, with `program_name` ("Extended Review", "Pilot Initiative A", "Baseline Model", "Distributed Cluster"), `year` (12 to 39), `event_count` (6 to 64), `budget` (17.12 to 35.45), and `status` ("regional-status-84", "legacy-status-85"). The `executive_director_id` and `donor_id` foreign keys tie each program to a specific executive and donor, respectively.

**Table `staff_members`**

| staff_id | full_name | employment_type | department | hire_date | salary | is_supervisor | organization_id | executive_director_id | facility_id | event_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 937735 | Theodore Mcgrath | adaptive-employme-17 | adaptive-departme-89 | 2023-06-01 | 13.94 | true | 1 | 1 | 1000 | 2002007020060 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 3158139 | Account Name | distributed-employme-18 | distributed-departme-90 | 2024-11-12 | 18.47 | false | 2 | 2 | 1001 | 168535 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 8189502 | Saipan International Airport | baseline-employme-19 | baseline-departme-91 | 2025-04-23 | 66.14 | true | 3 | 3 | 1002 | ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 69438 | Norma Fisher | pilot-employme-20 | pilot-departme-92 | 2022-09-07 | 61.82 | false | 4 | 4 | 1003 | 1186089 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Staff members are the human resources of the domain. The `staff_members` table uses `staff_id` as its primary key (e.g., 937735, 3158139, 8189502, 69438) and stores `full_name` ("Theodore Mcgrath", "Account Name", "Saipan International Airport", "Norma Fisher"), `employment_type` ("adaptive-employme-17", "distributed-employme-18"), `department` ("adaptive-departme-89", "distributed-departme-90"), `hire_date`, `salary` (13.94 to 66.14), and `is_supervisor` (a boolean). The `organization_id`, `executive_director_id`, `facility_id`, and `event_id` columns are foreign keys, meaning each staff member is associated with an organization, an executive director, a facility, and an event. Timestamps `created_at` and `updated_at` track the lifecycle of each record.

**Table `donors`**

| id | donor_id | donor_name | donor_type | total_contributed | last_donation_date | is_major_donor | organization_id | program_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 3012833 | Regional Framework | seasonal-donor-47 | 5.70 | 2025-12-11 | true | 1 | 1000 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | 05c8953a-8fc7-11eb-924d-9cd76263cbd0 | Seasonal Protocol D | regional-donor-48 | 10.40 | 2022-05-22 | false | 2 | 1001 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | 4793488 | Integrated Programme | legacy-donor-49 | 15.10 | 2023-10-06 | true | 3 | 1002 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | 3717626 | Extended Standard | compact-donor-50 | 19.80 | 2024-03-17 | false | 4 | 1003 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Donors represent the funding sources. While the `donors` table is not shown in the sample data, its presence is confirmed by foreign key references in `organizations` (`donor_id`), `programs` (`donor_id`), and the junction table `donors_members`.

The domain also contains seven junction tables that resolve many-to-many relationships. The `directors_members` table links executive directors to members; `organizations_members` links organizations to members; `organizations_programs` links organizations to programs; `facilities_events` links facilities to events; `facilities_members` links facilities to members; `programs_events` links programs to events; and `donors_members` links donors to members. These junction tables are the relational manifestation of the ontology's many-to-many object properties, materialized as binary relation tables with composite foreign keys.

**Table `organizations_programs`**

| organization_id | program_id |
|---|---|
| 1 | 1000 |
| 1 | 1001 |
| 2 | 1001 |
| 2 | 1002 |
| 3 | 1002 |
| 3 | 1003 |
| 4 | 1003 |
| 4 | 1000 |

The `organizations_programs` junction table captures the many-to-many relationship between organizations and programs. An organization can sponsor multiple programs, and a program can be associated with multiple organizations. The table's composite key consists of `organization_id` and `program_id`, each referencing its respective base table.

**Table `facilities_events`**

| facility_id | event_id |
|---|---|
| 1000 | 2002007020060 |
| 1000 | 168535 |
| 1001 | 168535 |
| 1001 | ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 |
| 1002 | ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 |
| 1002 | 1186089 |
| 1003 | 1186089 |
| 1003 | 2002007020060 |

The `facilities_events` junction table resolves the many-to-many relationship between facilities and events. A facility can host multiple events, and an event can be associated with multiple facilities. The composite key of `facility_id` and `event_id` ensures referential integrity.

**Table `facilities_members`**

| facility_id | staff_member_staff_id |
|---|---|
| 1000 | 937735 |
| 1000 | 3158139 |
| 1001 | 3158139 |
| 1001 | 8189502 |
| 1002 | 8189502 |
| 1002 | 69438 |
| 1003 | 69438 |
| 1003 | 937735 |

The `facilities_members` junction table links facilities to members, allowing a facility to serve multiple members and a member to be associated with multiple facilities.

**Table `programs_events`**

| program_id | event_id |
|---|---|
| 1000 | 2002007020060 |
| 1000 | 168535 |
| 1001 | 168535 |
| 1001 | ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 |
| 1002 | ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 |
| 1002 | 1186089 |
| 1003 | 1186089 |
| 1003 | 2002007020060 |

The `programs_events` junction table captures the many-to-many relationship between programs and events. A program can encompass multiple events, and an event can be part of multiple programs.

**Table `donors_members`**

| donor_id | staff_member_staff_id |
|---|---|
| 1 | 937735 |
| 1 | 3158139 |
| 2 | 3158139 |
| 2 | 8189502 |
| 3 | 8189502 |
| 3 | 69438 |
| 4 | 69438 |
| 4 | 937735 |

The `donors_members` junction table links donors to members, enabling a donor to support multiple members and a member to receive support from multiple donors.

**Table `directors_members`**

| executive_director_id | staff_member_staff_id |
|---|---|
| 1 | 937735 |
| 1 | 3158139 |
| 2 | 3158139 |
| 2 | 8189502 |
| 3 | 8189502 |
| 3 | 69438 |
| 4 | 69438 |
| 4 | 937735 |

The `directors_members` junction table links executive directors to members, allowing directors to oversee multiple members and members to be associated with multiple directors.

**Table `organizations_members`**

| organization_id | staff_member_staff_id |
|---|---|
| 1 | 937735 |
| 1 | 3158139 |
| 2 | 3158139 |
| 2 | 8189502 |
| 3 | 8189502 |
| 3 | 69438 |
| 4 | 69438 |
| 4 | 937735 |

The `organizations_members` junction table links organizations to members, enabling an organization to have multiple members and a member to belong to multiple organizations.

## View Projections

Views materialize the normalized schema into analytical projections that answer specific domain questions. Each view joins the relevant base tables and junction tables to reconstruct a coherent fact from the distributed data.

**View `executive_director_organization_view`**

```sql
CREATE VIEW executive_director_organization_view AS
SELECT a.id, a.employee_id, a.reporting_to, a.position_type, b.id AS organization_id, b.legal_name AS organization_legal_name, b.founded_year AS organization_founded_year
FROM executive_directors a JOIN organizations b ON a.organization_id = b.id;
```

| id | employee_id | reporting_to | position_type | organization_id | organization_legal_name | organization_founded_year |
|---|---|---|---|---|---|---|
| 1 | Norma Fisher | integrated-reportin-82 | distributed-position-78 | 1 | Adaptive Model | 27 |
| 2 | Tasha Rodriguez | seasonal-reportin-83 | baseline-position-79 | 2 | Primary Cluster | 31 |
| 3 | Theodore Mcgrath | regional-reportin-84 | pilot-position-80 | 3 | Composite Review D | 35 |
| 4 | Peter Mcdowell | legacy-reportin-85 | extended-position-81 | 4 | Compact Initiative | 39 |

This view answers the question: "Which organization does each executive director lead?" By joining `executive_directors` to `organizations` on `organization_id`, it produces rows such as Norma Fisher (id 1) leading Adaptive Model (id 1) and Tasha Rodriguez (id 2) leading Primary Cluster (id 2). The join reconstructs the leadership assignment that is encoded as a foreign key in the base table.

**View `executive_director_staff_member_detail_view`**

```sql
CREATE VIEW executive_director_staff_member_detail_view AS
SELECT a.id, a.employee_id, a.reporting_to, b.staff_id AS member_staff_id, b.full_name AS member_full_name, b.employment_type AS member_employment_type
FROM executive_directors a
  JOIN directors_members j ON j.executive_director_id = a.id
  JOIN staff_members b ON b.staff_id = j.staff_member_staff_id;
```

| id | employee_id | reporting_to | member_staff_id | member_full_name | member_employment_type |
|---|---|---|---|---|---|
| 1 | Norma Fisher | integrated-reportin-82 | 937735 | Theodore Mcgrath | adaptive-employme-17 |
| 1 | Norma Fisher | integrated-reportin-82 | 3158139 | Account Name | distributed-employme-18 |
| 2 | Tasha Rodriguez | seasonal-reportin-83 | 3158139 | Account Name | distributed-employme-18 |
| 2 | Tasha Rodriguez | seasonal-reportin-83 | 8189502 | Saipan International Airport | baseline-employme-19 |
| 3 | Theodore Mcgrath | regional-reportin-84 | 8189502 | Saipan International Airport | baseline-employme-19 |
| 3 | Theodore Mcgrath | regional-reportin-84 | 69438 | Norma Fisher | pilot-employme-20 |
| 4 | Peter Mcdowell | legacy-reportin-85 | 69438 | Norma Fisher | pilot-employme-20 |
| 4 | Peter Mcdowell | legacy-reportin-85 | 937735 | Theodore Mcgrath | adaptive-employme-17 |

This view answers: "Which staff members report to each executive director?" Joining `executive_directors` to `staff_members` on `executive_director_id` yields rows like Theodore Mcgrath (staff_id 937735) reporting to executive director id 1 (Norma Fisher), and Account Name (staff_id 3158139) reporting to executive director id 2 (Tasha Rodriguez). The view materializes the supervisory chain.

**View `executive_director_facility_view`**

```sql
CREATE VIEW executive_director_facility_view AS
SELECT a.id, a.employee_id, a.reporting_to, a.position_type, b.id AS facility_id, b.building_count AS facility_building_count, b.age_min AS facility_age_min
FROM executive_directors a JOIN facilities b ON a.facility_id = b.id;
```

| id | employee_id | reporting_to | position_type | facility_id | facility_building_count | facility_age_min |
|---|---|---|---|---|---|---|
| 1 | Norma Fisher | integrated-reportin-82 | distributed-position-78 | 1000 | 15 | 19 |
| 2 | Tasha Rodriguez | seasonal-reportin-83 | baseline-position-79 | 1001 | 45 | 25 |
| 3 | Theodore Mcgrath | regional-reportin-84 | pilot-position-80 | 1002 | 18 | 31 |
| 4 | Peter Mcdowell | legacy-reportin-85 | extended-position-81 | 1003 | 7 | 37 |

This view answers: "Which facility is managed by each executive director?" The join between `executive_directors` and `facilities` on `facility_id` produces rows such as executive director id 1 (Norma Fisher) managing facility 1000 (with 15 buildings, safety status "integrated-safety-88") and executive director id 2 (Tasha Rodriguez) managing facility 1001 (with 45 buildings, safety status "seasonal-safety-89").

**View `organization_staff_member_detail_view`**

```sql
CREATE VIEW organization_staff_member_detail_view AS
SELECT a.id, a.legal_name, a.founded_year, b.staff_id AS member_staff_id, b.full_name AS member_full_name, b.employment_type AS member_employment_type
FROM organizations a
  JOIN organizations_members j ON j.organization_id = a.id
  JOIN staff_members b ON b.staff_id = j.staff_member_staff_id;
```

| id | legal_name | founded_year | member_staff_id | member_full_name | member_employment_type |
|---|---|---|---|---|---|
| 1 | Adaptive Model | 27 | 937735 | Theodore Mcgrath | adaptive-employme-17 |
| 1 | Adaptive Model | 27 | 3158139 | Account Name | distributed-employme-18 |
| 2 | Primary Cluster | 31 | 3158139 | Account Name | distributed-employme-18 |
| 2 | Primary Cluster | 31 | 8189502 | Saipan International Airport | baseline-employme-19 |
| 3 | Composite Review D | 35 | 8189502 | Saipan International Airport | baseline-employme-19 |
| 3 | Composite Review D | 35 | 69438 | Norma Fisher | pilot-employme-20 |
| 4 | Compact Initiative | 39 | 69438 | Norma Fisher | pilot-employme-20 |
| 4 | Compact Initiative | 39 | 937735 | Theodore Mcgrath | adaptive-employme-17 |

This view answers: "Which staff members work for each organization?" Joining `organizations` to `staff_members` on `organization_id` yields rows like Adaptive Model (id 1) employing Theodore Mcgrath (staff_id 937735) in the adaptive-departme-89 department, and Primary Cluster (id 2) employing Account Name (staff_id 3158139) in the distributed-departme-90 department.

**View `organization_facility_view`**

```sql
CREATE VIEW organization_facility_view AS
SELECT a.id, a.legal_name, a.founded_year, a.annual_revenue, b.id AS facility_id, b.building_count AS facility_building_count, b.age_min AS facility_age_min
FROM organizations a JOIN facilities b ON a.facility_id = b.id;
```

| id | legal_name | founded_year | annual_revenue | facility_id | facility_building_count | facility_age_min |
|---|---|---|---|---|---|---|
| 1 | Adaptive Model | 27 | 12,608 | 1000 | 15 | 19 |
| 2 | Primary Cluster | 31 | 56,418 | 1001 | 45 | 25 |
| 3 | Composite Review D | 35 | 16,254 | 1002 | 18 | 31 |
| 4 | Compact Initiative | 39 | 745,000 | 1003 | 7 | 37 |

This view answers: "Which facilities belong to each organization?" The join between `organizations` and `facilities` on `organization_id` produces rows such as Adaptive Model (id 1) owning facility 1000 (last inspected 2025-04-12, historic status true) and Primary Cluster (id 2) owning facility 1001 (last inspected 2022-09-23, historic status false).

**View `organization_program_detail_view`**

```sql
CREATE VIEW organization_program_detail_view AS
SELECT a.id, a.legal_name, a.founded_year, b.program_id AS program_program_id, b.program_name AS program_program_name, b.year AS program_year
FROM organizations a
  JOIN organizations_programs j ON j.organization_id = a.id
  JOIN programs b ON b.program_id = j.program_id;
```

| id | legal_name | founded_year | program_program_id | program_program_name | program_year |
|---|---|---|---|---|---|
| 1 | Adaptive Model | 27 | 1000 | Extended Review | 12 |
| 1 | Adaptive Model | 27 | 1001 | Pilot Initiative A | 21 |
| 2 | Primary Cluster | 31 | 1001 | Pilot Initiative A | 21 |
| 2 | Primary Cluster | 31 | 1002 | Baseline Model | 30 |
| 3 | Composite Review D | 35 | 1002 | Baseline Model | 30 |
| 3 | Composite Review D | 35 | 1003 | Distributed Cluster | 39 |
| 4 | Compact Initiative | 39 | 1003 | Distributed Cluster | 39 |
| 4 | Compact Initiative | 39 | 1000 | Extended Review | 12 |

This view answers: "Which programs are associated with each organization?" Joining `organizations` to `programs` via the `organizations_programs` junction table yields rows like Adaptive Model (id 1) associated with Extended Review (program_id 1000, budget 35.45, status "regional-status-84") and Primary Cluster (id 2) associated with Pilot Initiative A (program_id 1001, budget 18.47, status "legacy-status-85").

**View `organization_donor_view`**

```sql
CREATE VIEW organization_donor_view AS
SELECT a.id, a.legal_name, a.founded_year, a.annual_revenue, b.id AS donor_id, b.donor_id AS donor_donor_id, b.donor_name AS donor_donor_name
FROM organizations a JOIN donors b ON a.donor_id = b.id;
```

| id | legal_name | founded_year | annual_revenue | donor_id | donor_donor_id | donor_donor_name |
|---|---|---|---|---|---|---|
| 1 | Adaptive Model | 27 | 12,608 | 1 | 3012833 | Regional Framework |
| 2 | Primary Cluster | 31 | 56,418 | 2 | 05c8953a-8fc7-11eb-924d-9cd76263cbd0 | Seasonal Protocol D |
| 3 | Composite Review D | 35 | 16,254 | 3 | 4793488 | Integrated Programme |
| 4 | Compact Initiative | 39 | 745,000 | 4 | 3717626 | Extended Standard |

This view answers: "Which donor funds each organization?" The join between `organizations` and `donors` on `donor_id` produces rows such as Adaptive Model (id 1) funded by donor id 1 and Primary Cluster (id 2) funded by donor id 2.

**View `facility_organization_view`**

```sql
CREATE VIEW facility_organization_view AS
SELECT a.id, a.building_count, a.age_min, a.age_max, b.id AS organization_id, b.legal_name AS organization_legal_name, b.founded_year AS organization_founded_year
FROM facilities a JOIN organizations b ON a.organization_id = b.id;
```

| id | building_count | age_min | age_max | organization_id | organization_legal_name | organization_founded_year |
|---|---|---|---|---|---|---|
| 1000 | 15 | 19 | 24 | 1 | Adaptive Model | 27 |
| 1001 | 45 | 25 | 27 | 2 | Primary Cluster | 31 |
| 1002 | 18 | 31 | 30 | 3 | Composite Review D | 35 |
| 1003 | 7 | 37 | 33 | 4 | Compact Initiative | 39 |

This view answers: "Which organization owns each facility?" The reverse of `organization_facility_view`, joining `facilities` to `organizations` on `organization_id` yields rows like facility 1000 (15 buildings, historic true) owned by Adaptive Model (id 1) and facility 1001 (45 buildings, historic false) owned by Primary Cluster (id 2).

**View `facility_event_detail_view`**

```sql
CREATE VIEW facility_event_detail_view AS
SELECT a.id, a.building_count, a.age_min, b.event_id AS event_event_id, b.event_name AS event_event_name, b.event_date AS event_event_date
FROM facilities a
  JOIN facilities_events j ON j.facility_id = a.id
  JOIN events b ON b.event_id = j.event_id;
```

| id | building_count | age_min | event_event_id | event_event_name | event_event_date |
|---|---|---|---|---|---|
| 1000 | 15 | 19 | 2002007020060 | Seasonal Standard | 2025-04-15T15:21:00 |
| 1000 | 15 | 19 | 168535 | Integrated Framework | 2022-09-26T22:38:00 |
| 1001 | 45 | 25 | 168535 | Integrated Framework | 2022-09-26T22:38:00 |
| 1001 | 45 | 25 | ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 | Extended Protocol D | 2023-02-10T05:55:00 |
| 1002 | 18 | 31 | ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 | Extended Protocol D | 2023-02-10T05:55:00 |
| 1002 | 18 | 31 | 1186089 | Pilot Programme | 2024-07-21T12:12:00 |
| 1003 | 7 | 37 | 1186089 | Pilot Programme | 2024-07-21T12:12:00 |
| 1003 | 7 | 37 | 2002007020060 | Seasonal Standard | 2025-04-15T15:21:00 |

This view answers: "Which events are hosted at each facility?" Joining `facilities` to `events` on `facility_id` produces rows such as facility 1000 hosting "Seasonal Standard" (event_id 2002007020060, 6 attendees, revenue 13.49) and facility 1001 hosting "Integrated Framework" (event_id 168535, 23 attendees, revenue 19.97).

**View `facility_staff_member_detail_view`**

```sql
CREATE VIEW facility_staff_member_detail_view AS
SELECT a.id, a.building_count, a.age_min, b.staff_id AS member_staff_id, b.full_name AS member_full_name, b.employment_type AS member_employment_type
FROM facilities a
  JOIN facilities_members j ON j.facility_id = a.id
  JOIN staff_members b ON b.staff_id = j.staff_member_staff_id;
```

| id | building_count | age_min | member_staff_id | member_full_name | member_employment_type |
|---|---|---|---|---|---|
| 1000 | 15 | 19 | 937735 | Theodore Mcgrath | adaptive-employme-17 |
| 1000 | 15 | 19 | 3158139 | Account Name | distributed-employme-18 |
| 1001 | 45 | 25 | 3158139 | Account Name | distributed-employme-18 |
| 1001 | 45 | 25 | 8189502 | Saipan International Airport | baseline-employme-19 |
| 1002 | 18 | 31 | 8189502 | Saipan International Airport | baseline-employme-19 |
| 1002 | 18 | 31 | 69438 | Norma Fisher | pilot-employme-20 |
| 1003 | 7 | 37 | 69438 | Norma Fisher | pilot-employme-20 |
| 1003 | 7 | 37 | 937735 | Theodore Mcgrath | adaptive-employme-17 |

This view answers: "Which staff members are assigned to each facility?" The join between `facilities` and `staff_members` on `facility_id` yields rows like facility 1000 employing Theodore Mcgrath (staff_id 937735, salary 13.94, supervisor true) and facility 1001 employing Account Name (staff_id 3158139, salary 18.47, supervisor false).

**View `event_facility_view`**

```sql
CREATE VIEW event_facility_view AS
SELECT a.event_id, a.event_name, a.event_date, a.event_type, b.id AS facility_id, b.building_count AS facility_building_count, b.age_min AS facility_age_min
FROM events a JOIN facilities b ON a.facility_id = b.id;
```

| event_id | event_name | event_date | event_type | facility_id | facility_building_count | facility_age_min |
|---|---|---|---|---|---|---|
| 2002007020060 | Seasonal Standard | 2025-04-15T15:21:00 | distributed-event-24 | 1000 | 15 | 19 |
| 168535 | Integrated Framework | 2022-09-26T22:38:00 | baseline-event-25 | 1001 | 45 | 25 |
| ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 | Extended Protocol D | 2023-02-10T05:55:00 | pilot-event-26 | 1002 | 18 | 31 |
| 1186089 | Pilot Programme | 2024-07-21T12:12:00 | extended-event-27 | 1003 | 7 | 37 |

This view answers: "At which facility was each event held?" Joining `events` to `facilities` on `facility_id` produces rows such as "Seasonal Standard" (event_id 2002007020060) held at facility 1000 and "Integrated Framework" (event_id 168535) held at facility 1001.

**View `event_organization_view`**

```sql
CREATE VIEW event_organization_view AS
SELECT a.event_id, a.event_name, a.event_date, a.event_type, b.id AS organization_id, b.legal_name AS organization_legal_name, b.founded_year AS organization_founded_year
FROM events a JOIN organizations b ON a.organization_id = b.id;
```

| event_id | event_name | event_date | event_type | organization_id | organization_legal_name | organization_founded_year |
|---|---|---|---|---|---|---|
| 2002007020060 | Seasonal Standard | 2025-04-15T15:21:00 | distributed-event-24 | 1 | Adaptive Model | 27 |
| 168535 | Integrated Framework | 2022-09-26T22:38:00 | baseline-event-25 | 2 | Primary Cluster | 31 |
| ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 | Extended Protocol D | 2023-02-10T05:55:00 | pilot-event-26 | 3 | Composite Review D | 35 |
| 1186089 | Pilot Programme | 2024-07-21T12:12:00 | extended-event-27 | 4 | Compact Initiative | 39 |

This view answers: "Which organization sponsored each event?" The join between `events` and `organizations` on `organization_id` yields rows like "Seasonal Standard" (event_id 2002007020060) sponsored by Adaptive Model (id 1) and "Integrated Framework" (event_id 168535) sponsored by Primary Cluster (id 2).

**View `event_staff_member_view`**

```sql
CREATE VIEW event_staff_member_view AS
SELECT a.event_id, a.event_name, a.event_date, a.event_type, b.staff_id AS member_staff_id, b.full_name AS member_full_name, b.employment_type AS member_employment_type
FROM events a JOIN staff_members b ON a.staff_member_staff_id = b.staff_id;
```

| event_id | event_name | event_date | event_type | member_staff_id | member_full_name | member_employment_type |
|---|---|---|---|---|---|---|
| 2002007020060 | Seasonal Standard | 2025-04-15T15:21:00 | distributed-event-24 | 937735 | Theodore Mcgrath | adaptive-employme-17 |
| 168535 | Integrated Framework | 2022-09-26T22:38:00 | baseline-event-25 | 3158139 | Account Name | distributed-employme-18 |
| ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 | Extended Protocol D | 2023-02-10T05:55:00 | pilot-event-26 | 8189502 | Saipan International Airport | baseline-employme-19 |
| 1186089 | Pilot Programme | 2024-07-21T12:12:00 | extended-event-27 | 69438 | Norma Fisher | pilot-employme-20 |

This view answers: "Which staff member is associated with each event?" Joining `events` to `staff_members` on `staff_member_staff_id` produces rows such as "Seasonal Standard" (event_id 2002007020060) associated with Theodore Mcgrath (staff_id 937735) and "Integrated Framework" (event_id 168535) associated with Account Name (staff_id 3158139).

**View `event_program_view`**

```sql
CREATE VIEW event_program_view AS
SELECT a.event_id, a.event_name, a.event_date, a.event_type, b.program_id AS program_program_id, b.program_name AS program_program_name, b.year AS program_year
FROM events a JOIN programs b ON a.program_id = b.program_id;
```

| event_id | event_name | event_date | event_type | program_program_id | program_program_name | program_year |
|---|---|---|---|---|---|---|
| 2002007020060 | Seasonal Standard | 2025-04-15T15:21:00 | distributed-event-24 | 1000 | Extended Review | 12 |
| 168535 | Integrated Framework | 2022-09-26T22:38:00 | baseline-event-25 | 1001 | Pilot Initiative A | 21 |
| ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 | Extended Protocol D | 2023-02-10T05:55:00 | pilot-event-26 | 1002 | Baseline Model | 30 |
| 1186089 | Pilot Programme | 2024-07-21T12:12:00 | extended-event-27 | 1003 | Distributed Cluster | 39 |

This view answers: "Which program does each event belong to?" The join between `events` and `programs` on `program_id` yields rows like "Seasonal Standard" (event_id 2002007020060) belonging to Extended Review (program_id 1000) and "Integrated Framework" (event_id 168535) belonging to Pilot Initiative A (program_id 1001).

**View `program_event_detail_view`**

```sql
CREATE VIEW program_event_detail_view AS
SELECT a.program_id, a.program_name, a.year, b.event_id AS event_event_id, b.event_name AS event_event_name, b.event_date AS event_event_date
FROM programs a
  JOIN programs_events j ON j.program_id = a.program_id
  JOIN events b ON b.event_id = j.event_id;
```

| program_id | program_name | year | event_event_id | event_event_name | event_event_date |
|---|---|---|---|---|---|
| 1000 | Extended Review | 12 | 2002007020060 | Seasonal Standard | 2025-04-15T15:21:00 |
| 1000 | Extended Review | 12 | 168535 | Integrated Framework | 2022-09-26T22:38:00 |
| 1001 | Pilot Initiative A | 21 | 168535 | Integrated Framework | 2022-09-26T22:38:00 |
| 1001 | Pilot Initiative A | 21 | ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 | Extended Protocol D | 2023-02-10T05:55:00 |
| 1002 | Baseline Model | 30 | ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 | Extended Protocol D | 2023-02-10T05:55:00 |
| 1002 | Baseline Model | 30 | 1186089 | Pilot Programme | 2024-07-21T12:12:00 |
| 1003 | Distributed Cluster | 39 | 1186089 | Pilot Programme | 2024-07-21T12:12:00 |
| 1003 | Distributed Cluster | 39 | 2002007020060 | Seasonal Standard | 2025-04-15T15:21:00 |

This view answers: "Which events are part of each program?" Joining `programs` to `events` on `program_id` produces rows such as Extended Review (program_id 1000, budget 35.45) containing event "Seasonal Standard" (event_id 2002007020060, 6 attendees) and Pilot Initiative A (program_id 1001, budget 18.47) containing event "Integrated Framework" (event_id 168535, 23 attendees).

**View `program_executive_director_view`**

```sql
CREATE VIEW program_executive_director_view AS
SELECT a.program_id, a.program_name, a.year, a.event_count, b.id AS director_id, b.employee_id AS director_employee_id, b.reporting_to AS director_reporting_to
FROM programs a JOIN executive_directors b ON a.executive_director_id = b.id;
```

| program_id | program_name | year | event_count | director_id | director_employee_id | director_reporting_to |
|---|---|---|---|---|---|---|
| 1000 | Extended Review | 12 | 26 | 1 | Norma Fisher | integrated-reportin-82 |
| 1001 | Pilot Initiative A | 21 | 22 | 2 | Tasha Rodriguez | seasonal-reportin-83 |
| 1002 | Baseline Model | 30 | 19 | 3 | Theodore Mcgrath | regional-reportin-84 |
| 1003 | Distributed Cluster | 39 | 64 | 4 | Peter Mcdowell | legacy-reportin-85 |

This view answers: "Which executive director oversees each program?" The join between `programs` and `executive_directors` on `executive_director_id` yields rows like Extended Review (program_id 1000) overseen by executive director id 1 (Norma Fisher, 16 years experience) and Pilot Initiative A (program_id 1001) overseen by executive director id 2 (Tasha Rodriguez, 22 years experience).

**View `program_donor_view`**

```sql
CREATE VIEW program_donor_view AS
SELECT a.program_id, a.program_name, a.year, a.event_count, b.id AS donor_id, b.donor_id AS donor_donor_id, b.donor_name AS donor_donor_name
FROM programs a JOIN donors b ON a.donor_id = b.id;
```

| program_id | program_name | year | event_count | donor_id | donor_donor_id | donor_donor_name |
|---|---|---|---|---|---|---|
| 1000 | Extended Review | 12 | 26 | 1 | 3012833 | Regional Framework |
| 1001 | Pilot Initiative A | 21 | 22 | 2 | 05c8953a-8fc7-11eb-924d-9cd76263cbd0 | Seasonal Protocol D |
| 1002 | Baseline Model | 30 | 19 | 3 | 4793488 | Integrated Programme |
| 1003 | Distributed Cluster | 39 | 64 | 4 | 3717626 | Extended Standard |

This view answers: "Which donor funds each program?" Joining `programs` to `donors` on `donor_id` produces rows such as Extended Review (program_id 1000) funded by donor id 1 and Pilot Initiative A (program_id 1001) funded by donor id 2.

**View `staff_member_organization_view`**

```sql
CREATE VIEW staff_member_organization_view AS
SELECT a.staff_id, a.full_name, a.employment_type, a.department, b.id AS organization_id, b.legal_name AS organization_legal_name, b.founded_year AS organization_founded_year
FROM staff_members a JOIN organizations b ON a.organization_id = b.id;
```

| staff_id | full_name | employment_type | department | organization_id | organization_legal_name | organization_founded_year |
|---|---|---|---|---|---|---|
| 937735 | Theodore Mcgrath | adaptive-employme-17 | adaptive-departme-89 | 1 | Adaptive Model | 27 |
| 3158139 | Account Name | distributed-employme-18 | distributed-departme-90 | 2 | Primary Cluster | 31 |
| 8189502 | Saipan International Airport | baseline-employme-19 | baseline-departme-91 | 3 | Composite Review D | 35 |
| 69438 | Norma Fisher | pilot-employme-20 | pilot-departme-92 | 4 | Compact Initiative | 39 |

This view answers: "Which organization employs each staff member?" The join between `staff_members` and `organizations` on `organization_id` yields rows like Theodore Mcgrath (staff_id 937735) employed by Adaptive Model (id 1) and Account Name (staff_id 3158139) employed by Primary Cluster (id 2).

**View `staff_member_executive_director_view`**

```sql
CREATE VIEW staff_member_executive_director_view AS
SELECT a.staff_id, a.full_name, a.employment_type, a.department, b.id AS director_id, b.employee_id AS director_employee_id, b.reporting_to AS director_reporting_to
FROM staff_members a JOIN executive_directors b ON a.executive_director_id = b.id;
```

| staff_id | full_name | employment_type | department | director_id | director_employee_id | director_reporting_to |
|---|---|---|---|---|---|---|
| 937735 | Theodore Mcgrath | adaptive-employme-17 | adaptive-departme-89 | 1 | Norma Fisher | integrated-reportin-82 |
| 3158139 | Account Name | distributed-employme-18 | distributed-departme-90 | 2 | Tasha Rodriguez | seasonal-reportin-83 |
| 8189502 | Saipan International Airport | baseline-employme-19 | baseline-departme-91 | 3 | Theodore Mcgrath | regional-reportin-84 |
| 69438 | Norma Fisher | pilot-employme-20 | pilot-departme-92 | 4 | Peter Mcdowell | legacy-reportin-85 |

This view answers: "Which executive director supervises each staff member?" Joining `staff_members` to `executive_directors` on `executive_director_id` produces rows such as Theodore Mcgrath (staff_id 937735) supervised by Norma Fisher (id 1, salary range 13.49–13.94) and Account Name (staff_id 3158139) supervised by Tasha Rodriguez (id 2, salary range 17.12–25.36).

**View `staff_member_facility_view`**

```sql
CREATE VIEW staff_member_facility_view AS
SELECT a.staff_id, a.full_name, a.employment_type, a.department, b.id AS facility_id, b.building_count AS facility_building_count, b.age_min AS facility_age_min
FROM staff_members a JOIN facilities b ON a.facility_id = b.id;
```

| staff_id | full_name | employment_type | department | facility_id | facility_building_count | facility_age_min |
|---|---|---|---|---|---|---|
| 937735 | Theodore Mcgrath | adaptive-employme-17 | adaptive-departme-89 | 1000 | 15 | 19 |
| 3158139 | Account Name | distributed-employme-18 | distributed-departme-90 | 1001 | 45 | 25 |
| 8189502 | Saipan International Airport | baseline-employme-19 | baseline-departme-91 | 1002 | 18 | 31 |
| 69438 | Norma Fisher | pilot-employme-20 | pilot-departme-92 | 1003 | 7 | 37 |

This view answers: "At which facility does each staff member work?" The join between `staff_members` and `facilities` on `facility_id` yields rows like Theodore Mcgrath (staff_id 937735) working at facility 1000 (15 buildings, historic true) and Account Name (staff_id 3158139) working at facility 1001 (45 buildings, historic false).

**View `staff_member_event_view`**

```sql
CREATE VIEW staff_member_event_view AS
SELECT a.staff_id, a.full_name, a.employment_type, a.department, b.event_id AS event_event_id, b.event_name AS event_event_name, b.event_date AS event_event_date
FROM staff_members a JOIN events b ON a.event_id = b.event_id;
```

| staff_id | full_name | employment_type | department | event_event_id | event_event_name | event_event_date |
|---|---|---|---|---|---|---|
| 937735 | Theodore Mcgrath | adaptive-employme-17 | adaptive-departme-89 | 2002007020060 | Seasonal Standard | 2025-04-15T15:21:00 |
| 3158139 | Account Name | distributed-employme-18 | distributed-departme-90 | 168535 | Integrated Framework | 2022-09-26T22:38:00 |
| 8189502 | Saipan International Airport | baseline-employme-19 | baseline-departme-91 | ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 | Extended Protocol D | 2023-02-10T05:55:00 |
| 69438 | Norma Fisher | pilot-employme-20 | pilot-departme-92 | 1186089 | Pilot Programme | 2024-07-21T12:12:00 |

This view answers: "Which event is each staff member associated with?" Joining `staff_members` to `events` on `event_id` produces rows such as Theodore Mcgrath (staff_id 937735) associated with "Seasonal Standard" (event_id 2002007020060, 6 attendees) and Account Name (staff_id 3158139) associated with "Integrated Framework" (event_id 168535, 23 attendees).

**View `donor_organization_view`**

```sql
CREATE VIEW donor_organization_view AS
SELECT a.id, a.donor_id, a.donor_name, a.donor_type, b.id AS organization_id, b.legal_name AS organization_legal_name, b.founded_year AS organization_founded_year
FROM donors a JOIN organizations b ON a.organization_id = b.id;
```

| id | donor_id | donor_name | donor_type | organization_id | organization_legal_name | organization_founded_year |
|---|---|---|---|---|---|---|
| 1 | 3012833 | Regional Framework | seasonal-donor-47 | 1 | Adaptive Model | 27 |
| 2 | 05c8953a-8fc7-11eb-924d-9cd76263cbd0 | Seasonal Protocol D | regional-donor-48 | 2 | Primary Cluster | 31 |
| 3 | 4793488 | Integrated Programme | legacy-donor-49 | 3 | Composite Review D | 35 |
| 4 | 3717626 | Extended Standard | compact-donor-50 | 4 | Compact Initiative | 39 |

This view answers: "Which organizations does each donor fund?" The join between `donors` and `organizations` on `donor_id` yields rows such as donor id 1 funding Adaptive Model (id 1, revenue 12,608) and donor id 2 funding Primary Cluster (id 2, revenue 56,418).

**View `donor_program_view`**

```sql
CREATE VIEW donor_program_view AS
SELECT a.id, a.donor_id, a.donor_name, a.donor_type, b.program_id AS program_program_id, b.program_name AS program_program_name, b.year AS program_year
FROM donors a JOIN programs b ON a.program_id = b.program_id;
```

| id | donor_id | donor_name | donor_type | program_program_id | program_program_name | program_year |
|---|---|---|---|---|---|---|
| 1 | 3012833 | Regional Framework | seasonal-donor-47 | 1000 | Extended Review | 12 |
| 2 | 05c8953a-8fc7-11eb-924d-9cd76263cbd0 | Seasonal Protocol D | regional-donor-48 | 1001 | Pilot Initiative A | 21 |
| 3 | 4793488 | Integrated Programme | legacy-donor-49 | 1002 | Baseline Model | 30 |
| 4 | 3717626 | Extended Standard | compact-donor-50 | 1003 | Distributed Cluster | 39 |

This view answers: "Which programs does each donor fund?" Joining `donors` to `programs` on `donor_id` produces rows like donor id 1 funding Extended Review (program_id 1000, budget 35.45) and donor id 2 funding Pilot Initiative A (program_id 1001, budget 18.47).

**View `donor_staff_member_detail_view`**

```sql
CREATE VIEW donor_staff_member_detail_view AS
SELECT a.id, a.donor_id, a.donor_name, b.staff_id AS member_staff_id, b.full_name AS member_full_name, b.employment_type AS member_employment_type
FROM donors a
  JOIN donors_members j ON j.donor_id = a.id
  JOIN staff_members b ON b.staff_id = j.staff_member_staff_id;
```

| id | donor_id | donor_name | member_staff_id | member_full_name | member_employment_type |
|---|---|---|---|---|---|
| 1 | 3012833 | Regional Framework | 937735 | Theodore Mcgrath | adaptive-employme-17 |
| 1 | 3012833 | Regional Framework | 3158139 | Account Name | distributed-employme-18 |
| 2 | 05c8953a-8fc7-11eb-924d-9cd76263cbd0 | Seasonal Protocol D | 3158139 | Account Name | distributed-employme-18 |
| 2 | 05c8953a-8fc7-11eb-924d-9cd76263cbd0 | Seasonal Protocol D | 8189502 | Saipan International Airport | baseline-employme-19 |
| 3 | 4793488 | Integrated Programme | 8189502 | Saipan International Airport | baseline-employme-19 |
| 3 | 4793488 | Integrated Programme | 69438 | Norma Fisher | pilot-employme-20 |
| 4 | 3717626 | Extended Standard | 69438 | Norma Fisher | pilot-employme-20 |
| 4 | 3717626 | Extended Standard | 937735 | Theodore Mcgrath | adaptive-employme-17 |

This view answers: "Which staff members are supported by each donor?" The join between `donors` and `staff_members` through the `donors_members` junction table yields rows such as donor id 1 supporting Theodore Mcgrath (staff_id 937735, salary 13.94, supervisor true) and donor id 2 supporting Account Name (staff_id 3158139, salary 18.47, supervisor false).

## Synthesis

The relational schema faithfully materializes the domain ontology. Seven base tables encode the core entity types, with foreign keys in `executive_directors`, `organizations`, `facilities`, `events`, `programs`, and `staff_members` establishing the directed acyclic graph of one-to-many relationships. Seven junction tables—`directors_members`, `organizations_members`, `organizations_programs`, `facilities_events`, `facilities_members`, `programs_events`, and `donors_members`—resolve the many-to-many associations that the ontology's object properties require. The twenty-three views then project this normalized structure into domain-specific narratives: leadership assignments, staffing hierarchies, facility management, event hosting, program sponsorship, and donor funding. Each view's join reconstructs a coherent fact from the distributed normalized tables, demonstrating how the relational model preserves the full expressivity of the ontology while enabling efficient analytical queries. The concrete values—Norma Fisher's 16 years of experience, Adaptive Model's 745,000 annual revenue, facility 1000's 15 buildings and historic status, the "Seasonal Standard" event's 6 attendees and 13.49 revenue—ground the abstract schema in the operational reality of the domain.