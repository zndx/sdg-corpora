## The Architecture of Educational Administration

Educational systems operate through a layered structure of organizations, campuses, programs, and the people who staff them. Each entity carries its own identifiers, dates, and status markers, and the relationships between them form the operational backbone of any administrative review. The records below capture a snapshot of this ecosystem: awards granted to individuals and organizations, positions held by staff members, campuses serving students at various levels, programs delivering services, and policies governing the whole. Understanding how these pieces interlock is essential for anyone responsible for oversight, compliance, or strategic planning.

**Table `awards`**

| award_id | award_name | award_year | award_description | award_status | person_id | organization_id |
|---|---|---|---|---|---|---|
| 1 | Primary Review A | 36 | Composite Cluster | pending | 100 | 1 |
| 2 | Composite Initiative | 43 | Compact Review A | awarded | 101 | 2 |
| 3 | Compact Model | 50 | Legacy Initiative | revoked | 102 | 3 |
| 4 | Legacy Cluster D | 57 | Regional Model | pending | 103 | 4 |

The awards table records formal recognitions and designations within the system. Each award carries an identifier, a name, a year, a description, and a status that tracks its lifecycle from pending through awarded to revoked. Stephanie Collins received the Primary Review A in year 36, currently marked as pending, while Janice Johnston's Composite Initiative in year 43 has progressed to awarded status. Upal Saha's Compact Model from year 50 was ultimately revoked, and Katherine Snyder's Legacy Cluster D from year 57 remains pending. Every award is tied to a specific person and organization, anchoring the recognition to both an individual contributor and the institutional home.

**Table `persons`**

| person_id | first_name | last_name | degree | certification | birth_date | position_id | award_id | organization_id |
|---|---|---|---|---|---|---|---|---|
| 100 | Stephanie Collins | Paul Allen | legacy-degree-61 | seasonal-certific-29 | 2023-10-18 | 1000 | 1 | 1 |
| 101 | Janice Johnston | Heather Beasley | compact-degree-62 | regional-certific-30 | 2024-03-02 | 1001 | 2 | 2 |
| 102 | Upal Saha | Audrey Taylor | composite-degree-63 | legacy-certific-31 | 2025-08-13 | 1002 | 3 | 3 |
| 103 | Katherine Snyder | Susan Wagner | primary-degree-64 | compact-certific-32 | 2022-01-24 | 1003 | 4 | 4 |

Persons represent the human actors in this administrative landscape. Each person record includes a first and last name, a degree designation, a certification type, and a birth date. Stephanie Collins holds a legacy-degree-61 and a seasonal-certific-29, born on October 18, 2023. Janice Johnston carries a compact-degree-62 with a regional-certific-30, born March 2, 2024. Upal Saha's credentials include a composite-degree-63 and a legacy-certific-31, with a birth date of August 13, 2025. Katherine Snyder holds a primary-degree-64 and a compact-certific-32, born January 24, 2022. Each person is linked to a position, an award, and an organization, forming a triad of professional identity.

**Table `positions`**

| id | position_id | position_title | start_date | end_date | responsibilities | person_id | organization_id |
|---|---|---|---|---|---|---|---|
| 1000 | 14477856 | Extended Model | 2022-09-05 | 2022-09-01 | integrated-responsi-58 | 100 | 1 |
| 1001 | gd_acc_260002 | Pilot Cluster A | 2023-02-16 | 2023-02-12 | seasonal-responsi-59 | 101 | 2 |
| 1002 | 3e41f384-9bac-11eb-a8a2-19ed5c03f8d3 | Baseline Review | 2024-07-27 | 2024-07-23 | regional-responsi-60 | 102 | 3 |
| 1003 | 82871 | Distributed Initiative | 2025-12-11 | 2025-12-07 | legacy-responsi-61 | 103 | 4 |

Positions define the roles that persons occupy within organizations. The position table records a unique position identifier, a title, start and end dates, and a responsibilities descriptor. The Extended Model position (identifier 14477856) held by person 100 ran from September 5, 2022, to September 1, 2022, with integrated-responsi-58 as its responsibility scope. The Pilot Cluster A position (gd_acc_260002) for person 101 spanned February 16 to February 12, 2023, carrying seasonal-responsi-59. The Baseline Review position (3e41f384-9bac-11eb-a8a2-19ed5c03f8d3) for person 102 covered July 27 to July 23, 2024, with regional-responsi-60. The Distributed Initiative position (82871) for person 103 ran from December 11 to December 7, 2025, under legacy-responsi-61. Each position is assigned to a person and an organization, creating a clear chain of accountability.

**Table `organizations`**

| id | org_id | org_name | org_type | founding_date | headquarters_location | person_id | award_id | campus_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 790471 | Extended Review | school_district | 2023-06-24 | composite-headquar-63 | 100 | 1 | 1 |
| 2 | 1717 | Pilot Initiative A | professional_society | 2024-11-08 | primary-headquar-64 | 101 | 2 | 2 |
| 3 | 69437 | Baseline Model | university | 2025-04-19 | adaptive-headquar-65 | 102 | 3 | 3 |
| 4 | m16 | Distributed Cluster | school_district | 2022-09-03 | distributed-headquar-66 | 103 | 4 | 4 |

Organizations form the institutional framework within which all other entities operate. The organization table captures an internal identifier, an org identifier, a name, a type, a founding date, and a headquarters location. Extended Review (org_id 790471) is a school_district founded on June 24, 2023, with composite-headquar-63 as its headquarters. Pilot Initiative A (org_id 1717) is a professional_society founded November 8, 2024, headquartered at primary-headquar-64. Baseline Model (org_id 69437) is a university founded April 19, 2025, with adaptive-headquar-65. Distributed Cluster (org_id m16) is a school_district founded September 3, 2022, at distributed-headquar-66. Each organization is associated with a person, an award, and a campus, reinforcing the interconnected nature of the system.

**Table `campuses`**

| campus_id | campus_name | campus_level | enrollment | location | organization_id | program_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|
| 1 | Integrated Assessment A | elementary | 13 | extended-location-99 | 1 | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | Extended Survey | middle | 21 | integrated-location-100 | 2 | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | Pilot Corridor | high | 29 | seasonal-location-101 | 3 | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | Baseline Series D | k12 | 37 | regional-location-102 | 4 | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Campuses are the physical or operational units where programs are delivered. The campuses table records a campus identifier, name, level, enrollment count, location, and timestamps for creation and updates. Integrated Assessment A is an elementary campus with 13 students at extended-location-99, created on January 1, 2025. Extended Survey is a middle campus with 21 students at integrated-location-100, created February 6, 2025. Pilot Corridor is a high campus with 29 students at seasonal-location-101, created March 11, 2025. Baseline Series D is a k12 campus with 37 students at regional-location-102, created April 16, 2025. Each campus belongs to an organization and hosts a program, linking the institutional level to the delivery level.

**Table `programs`**

| id | program_id | program_name | program_type | start_date | end_date | budget | campus_id | person_id | policy_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 103176 | Extended Review | child_nutrition | 2022-09-05 | 2022-09-01 | 35.45 | 1 | 100 | 1000 |
| 2 | 2986219 | Pilot Initiative A | food_service | 2023-02-16 | 2023-02-12 | 18.47 | 2 | 101 | 1001 |
| 3 | 1186079 | Baseline Model | child_nutrition | 2024-07-27 | 2024-07-23 | 26.25 | 3 | 102 | 1002 |
| 4 | 1562855 | Distributed Cluster | food_service | 2025-12-11 | 2025-12-07 | 17.12 | 4 | 103 | 1003 |

Programs represent the service-delivery mechanisms operating within campuses. The programs table includes a program identifier, name, type, start and end dates, a budget figure, and links to a campus, a person, and a policy. Extended Review (program_id 103176) is a child_nutrition program running from September 5 to September 1, 2022, with a budget of 35.45, assigned to campus 1, person 100, and policy 1000. Pilot Initiative A (program_id 2986219) is a food_service program from February 16 to February 12, 2023, budgeted at 18.47, tied to campus 2, person 101, and policy 1001. Baseline Model (program_id 1186079) is a child_nutrition program from July 27 to July 23, 2024, with a budget of 26.25, linked to campus 3, person 102, and policy 1002. Distributed Cluster (program_id 1562855) is a food_service program from December 11 to December 7, 2025, budgeted at 17.12, connected to campus 4, person 103, and policy 1003.

**Table `policies`**

| id | policy_id | policy_name | policy_type | effective_date | status | program_id | campus_id |
|---|---|---|---|---|---|---|---|
| 1000 | 5844252 | Regional Series | operating | 2023-02-14 | active | 1 | 1 |
| 1001 | 10207142 | Seasonal Assessment D | procurement | 2024-07-25 | inactive | 2 | 2 |
| 1002 | 1562847 | Integrated Survey | menu | 2025-12-09 | draft | 3 | 3 |
| 1003 | ChIJkzsYUIBt5kcRM6_JHx26ONk | Extended Corridor | operating | 2022-05-20 | active | 4 | 4 |

Policies establish the governing rules under which programs operate. Each policy carries an identifier, a name, a type, a description, an effective date, and a status. The policies table anchors the regulatory framework that programs must follow, with each policy linked to one or more programs and campuses. The specific policy records define the compliance boundaries within which program budgets, timelines, and service types are evaluated.

### Award-Centric Relationships

The award_person_view joins awards with the persons who received them, answering the question of which individuals hold which recognitions and in what status. In this view, Stephanie Collins appears with the Primary Review A from year 36, currently pending, while Janice Johnston is linked to the Composite Initiative from year 43, already awarded. Upal Saha's Compact Model from year 50 shows a revoked status, and Katherine Snyder's Legacy Cluster D from year 57 remains pending. This join makes it straightforward to audit individual award histories and track the progression of recognitions over time.

**View `award_person_view`**

```sql
CREATE VIEW award_person_view AS
SELECT a.award_id, a.award_name, a.award_year, a.award_description, b.person_id AS person_person_id, b.first_name AS person_first_name, b.last_name AS person_last_name
FROM awards a JOIN persons b ON a.person_id = b.person_id;
```

| award_id | award_name | award_year | award_description | person_person_id | person_first_name | person_last_name |
|---|---|---|---|---|---|---|
| 1 | Primary Review A | 36 | Composite Cluster | 100 | Stephanie Collins | Paul Allen |
| 2 | Composite Initiative | 43 | Compact Review A | 101 | Janice Johnston | Heather Beasley |
| 3 | Compact Model | 50 | Legacy Initiative | 102 | Upal Saha | Audrey Taylor |
| 4 | Legacy Cluster D | 57 | Regional Model | 103 | Katherine Snyder | Susan Wagner |

The award_organization_view connects awards to the organizations associated with them, revealing which institutions are tied to which recognitions. Extended Review (org_id 790471) is linked to the Primary Review A, Pilot Initiative A (org_id 1717) to the Composite Initiative, Baseline Model (org_id 69437) to the Compact Model, and Distributed Cluster (org_id m16) to the Legacy Cluster D. This perspective is useful for institutional reporting, where leadership needs to understand the award portfolio associated with their organization.

**View `award_organization_view`**

```sql
CREATE VIEW award_organization_view AS
SELECT a.award_id, a.award_name, a.award_year, a.award_description, b.id AS organization_id, b.org_id AS organization_org_id, b.org_name AS organization_org_name
FROM awards a JOIN organizations b ON a.organization_id = b.id;
```

| award_id | award_name | award_year | award_description | organization_id | organization_org_id | organization_org_name |
|---|---|---|---|---|---|---|
| 1 | Primary Review A | 36 | Composite Cluster | 1 | 790471 | Extended Review |
| 2 | Composite Initiative | 43 | Compact Review A | 2 | 1717 | Pilot Initiative A |
| 3 | Compact Model | 50 | Legacy Initiative | 3 | 69437 | Baseline Model |
| 4 | Legacy Cluster D | 57 | Regional Model | 4 | m16 | Distributed Cluster |

### Person-Centric Relationships

The person_position_view merges person records with their assigned positions, providing a clear picture of each individual's role and tenure. Stephanie Collins (person 100) holds the Extended Model position (14477856) with integrated-responsi-58 responsibilities, while Janice Johnston (person 101) holds Pilot Cluster A (gd_acc_260002) with seasonal-responsi-59. Upal Saha (person 102) occupies the Baseline Review position (3e41f384-9bac-11eb-a8a2-19ed5c03f8d3) under regional-responsi-60, and Katherine Snyder (person 103) holds Distributed Initiative (82871) with legacy-responsi-61. This view supports workforce management by aligning personnel with their designated roles.

**View `person_position_view`**

```sql
CREATE VIEW person_position_view AS
SELECT a.person_id, a.first_name, a.last_name, a.degree, b.id AS position_id, b.position_id AS position_position_id, b.position_title AS position_position_title
FROM persons a JOIN positions b ON a.position_id = b.id;
```

| person_id | first_name | last_name | degree | position_id | position_position_id | position_position_title |
|---|---|---|---|---|---|---|
| 100 | Stephanie Collins | Paul Allen | legacy-degree-61 | 1000 | 14477856 | Extended Model |
| 101 | Janice Johnston | Heather Beasley | compact-degree-62 | 1001 | gd_acc_260002 | Pilot Cluster A |
| 102 | Upal Saha | Audrey Taylor | composite-degree-63 | 1002 | 3e41f384-9bac-11eb-a8a2-19ed5c03f8d3 | Baseline Review |
| 103 | Katherine Snyder | Susan Wagner | primary-degree-64 | 1003 | 82871 | Distributed Initiative |

The person_award_view links persons to their awards, creating a direct mapping between individuals and their recognitions. Stephanie Collins is associated with the Primary Review A (status pending), Janice Johnston with the Composite Initiative (awarded), Upal Saha with the Compact Model (revoked), and Katherine Snyder with the Legacy Cluster D (pending). This relationship is critical for performance tracking and for verifying that award recipients meet the qualifications recorded in their person profiles.

**View `person_award_view`**

```sql
CREATE VIEW person_award_view AS
SELECT a.person_id, a.first_name, a.last_name, a.degree, b.award_id AS award_award_id, b.award_name AS award_award_name, b.award_year AS award_award_year
FROM persons a JOIN awards b ON a.award_id = b.award_id;
```

| person_id | first_name | last_name | degree | award_award_id | award_award_name | award_award_year |
|---|---|---|---|---|---|---|
| 100 | Stephanie Collins | Paul Allen | legacy-degree-61 | 1 | Primary Review A | 36 |
| 101 | Janice Johnston | Heather Beasley | compact-degree-62 | 2 | Composite Initiative | 43 |
| 102 | Upal Saha | Audrey Taylor | composite-degree-63 | 3 | Compact Model | 50 |
| 103 | Katherine Snyder | Susan Wagner | primary-degree-64 | 4 | Legacy Cluster D | 57 |

The person_organization_view joins persons with their affiliated organizations, answering which individuals belong to which institutional homes. Stephanie Collins is tied to Extended Review (org_id 790471), a school_district; Janice Johnston to Pilot Initiative A (org_id 1717), a professional_society; Upal Saha to Baseline Model (org_id 69437), a university; and Katherine Snyder to Distributed Cluster (org_id m16), a school_district. This view supports organizational charting and helps clarify reporting lines across the system.

**View `person_organization_view`**

```sql
CREATE VIEW person_organization_view AS
SELECT a.person_id, a.first_name, a.last_name, a.degree, b.id AS organization_id, b.org_id AS organization_org_id, b.org_name AS organization_org_name
FROM persons a JOIN organizations b ON a.organization_id = b.id;
```

| person_id | first_name | last_name | degree | organization_id | organization_org_id | organization_org_name |
|---|---|---|---|---|---|---|
| 100 | Stephanie Collins | Paul Allen | legacy-degree-61 | 1 | 790471 | Extended Review |
| 101 | Janice Johnston | Heather Beasley | compact-degree-62 | 2 | 1717 | Pilot Initiative A |
| 102 | Upal Saha | Audrey Taylor | composite-degree-63 | 3 | 69437 | Baseline Model |
| 103 | Katherine Snyder | Susan Wagner | primary-degree-64 | 4 | m16 | Distributed Cluster |

### Position-Centric Relationships

The position_person_view reverses the perspective, starting from positions and revealing the persons who fill them. The Extended Model position (14477856) is held by Stephanie Collins, the Pilot Cluster A position (gd_acc_260002) by Janice Johnston, the Baseline Review position (3e41f384-9bac-11eb-a8a2-19ed5c03f8d3) by Upal Saha, and the Distributed Initiative position (82871) by Katherine Snyder. This orientation is particularly useful for position management, where the focus is on whether a role is filled, who holds it, and when the tenure began and ended.

**View `position_person_view`**

```sql
CREATE VIEW position_person_view AS
SELECT a.id, a.position_id, a.position_title, a.start_date, b.person_id AS person_person_id, b.first_name AS person_first_name, b.last_name AS person_last_name
FROM positions a JOIN persons b ON a.person_id = b.person_id;
```

| id | position_id | position_title | start_date | person_person_id | person_first_name | person_last_name |
|---|---|---|---|---|---|---|
| 1000 | 14477856 | Extended Model | 2022-09-05 | 100 | Stephanie Collins | Paul Allen |
| 1001 | gd_acc_260002 | Pilot Cluster A | 2023-02-16 | 101 | Janice Johnston | Heather Beasley |
| 1002 | 3e41f384-9bac-11eb-a8a2-19ed5c03f8d3 | Baseline Review | 2024-07-27 | 102 | Upal Saha | Audrey Taylor |
| 1003 | 82871 | Distributed Initiative | 2025-12-11 | 103 | Katherine Snyder | Susan Wagner |

The position_organization_view connects positions to their host organizations, clarifying which institutional unit each role belongs to. The Extended Model position resides within Extended Review (org_id 790471), the Pilot Cluster A position within Pilot Initiative A (org_id 1717), the Baseline Review position within Baseline Model (org_id 69437), and the Distributed Initiative position within Distributed Cluster (org_id m16). This join supports budget allocation and headcount reporting at the organizational level.

**View `position_organization_view`**

```sql
CREATE VIEW position_organization_view AS
SELECT a.id, a.position_id, a.position_title, a.start_date, b.id AS organization_id, b.org_id AS organization_org_id, b.org_name AS organization_org_name
FROM positions a JOIN organizations b ON a.organization_id = b.id;
```

| id | position_id | position_title | start_date | organization_id | organization_org_id | organization_org_name |
|---|---|---|---|---|---|---|
| 1000 | 14477856 | Extended Model | 2022-09-05 | 1 | 790471 | Extended Review |
| 1001 | gd_acc_260002 | Pilot Cluster A | 2023-02-16 | 2 | 1717 | Pilot Initiative A |
| 1002 | 3e41f384-9bac-11eb-a8a2-19ed5c03f8d3 | Baseline Review | 2024-07-27 | 3 | 69437 | Baseline Model |
| 1003 | 82871 | Distributed Initiative | 2025-12-11 | 4 | m16 | Distributed Cluster |

### Organization-Centric Relationships

The organization_person_view starts from organizations and lists the persons associated with each one. Extended Review (org_id 790471) is linked to Stephanie Collins, Pilot Initiative A (org_id 1717) to Janice Johnston, Baseline Model (org_id 69437) to Upal Saha, and Distributed Cluster (org_id m16) to Katherine Snyder. This view is valuable for organizational administrators who need a roster of all personnel under their institutional umbrella.

**View `organization_person_view`**

```sql
CREATE VIEW organization_person_view AS
SELECT a.id, a.org_id, a.org_name, a.org_type, b.person_id AS person_person_id, b.first_name AS person_first_name, b.last_name AS person_last_name
FROM organizations a JOIN persons b ON a.person_id = b.person_id;
```

| id | org_id | org_name | org_type | person_person_id | person_first_name | person_last_name |
|---|---|---|---|---|---|---|
| 1 | 790471 | Extended Review | school_district | 100 | Stephanie Collins | Paul Allen |
| 2 | 1717 | Pilot Initiative A | professional_society | 101 | Janice Johnston | Heather Beasley |
| 3 | 69437 | Baseline Model | university | 102 | Upal Saha | Audrey Taylor |
| 4 | m16 | Distributed Cluster | school_district | 103 | Katherine Snyder | Susan Wagner |

The organization_award_view joins organizations with their associated awards, providing an institutional view of the recognition portfolio. Extended Review is connected to the Primary Review A, Pilot Initiative A to the Composite Initiative, Baseline Model to the Compact Model, and Distributed Cluster to the Legacy Cluster D. This perspective helps institutional leaders understand the awards landscape and plan for future recognition cycles.

**View `organization_award_view`**

```sql
CREATE VIEW organization_award_view AS
SELECT a.id, a.org_id, a.org_name, a.org_type, b.award_id AS award_award_id, b.award_name AS award_award_name, b.award_year AS award_award_year
FROM organizations a JOIN awards b ON a.award_id = b.award_id;
```

| id | org_id | org_name | org_type | award_award_id | award_award_name | award_award_year |
|---|---|---|---|---|---|---|
| 1 | 790471 | Extended Review | school_district | 1 | Primary Review A | 36 |
| 2 | 1717 | Pilot Initiative A | professional_society | 2 | Composite Initiative | 43 |
| 3 | 69437 | Baseline Model | university | 3 | Compact Model | 50 |
| 4 | m16 | Distributed Cluster | school_district | 4 | Legacy Cluster D | 57 |

The organization_campus_view links organizations to the campuses under their jurisdiction. Extended Review (org_id 790471) oversees Integrated Assessment A, Pilot Initiative A (org_id 1717) oversees Extended Survey, Baseline Model (org_id 69437) oversees Pilot Corridor, and Distributed Cluster (org_id m16) oversees Baseline Series D. This view is essential for campus management, enabling administrators to track enrollment, location, and operational status across their campus portfolio.

**View `organization_campus_view`**

```sql
CREATE VIEW organization_campus_view AS
SELECT a.id, a.org_id, a.org_name, a.org_type, b.campus_id AS campus_campus_id, b.campus_name AS campus_campus_name, b.campus_level AS campus_campus_level
FROM organizations a JOIN campuses b ON a.campus_id = b.campus_id;
```

| id | org_id | org_name | org_type | campus_campus_id | campus_campus_name | campus_campus_level |
|---|---|---|---|---|---|---|
| 1 | 790471 | Extended Review | school_district | 1 | Integrated Assessment A | elementary |
| 2 | 1717 | Pilot Initiative A | professional_society | 2 | Extended Survey | middle |
| 3 | 69437 | Baseline Model | university | 3 | Pilot Corridor | high |
| 4 | m16 | Distributed Cluster | school_district | 4 | Baseline Series D | k12 |

### Campus-Centric Relationships

The campus_organization_view reverses the relationship, starting from campuses and identifying their parent organizations. Integrated Assessment A belongs to Extended Review (org_id 790471), Extended Survey to Pilot Initiative A (org_id 1717), Pilot Corridor to Baseline Model (org_id 69437), and Baseline Series D to Distributed Cluster (org_id m16). This orientation is useful for campus-level reporting, where the focus is on understanding the institutional context of each campus's operations.

**View `campus_organization_view`**

```sql
CREATE VIEW campus_organization_view AS
SELECT a.campus_id, a.campus_name, a.campus_level, a.enrollment, b.id AS organization_id, b.org_id AS organization_org_id, b.org_name AS organization_org_name
FROM campuses a JOIN organizations b ON a.organization_id = b.id;
```

| campus_id | campus_name | campus_level | enrollment | organization_id | organization_org_id | organization_org_name |
|---|---|---|---|---|---|---|
| 1 | Integrated Assessment A | elementary | 13 | 1 | 790471 | Extended Review |
| 2 | Extended Survey | middle | 21 | 2 | 1717 | Pilot Initiative A |
| 3 | Pilot Corridor | high | 29 | 3 | 69437 | Baseline Model |
| 4 | Baseline Series D | k12 | 37 | 4 | m16 | Distributed Cluster |

The campus_program_view connects campuses to the programs they host. Integrated Assessment A hosts the Extended Review program (program_id 103176), a child_nutrition program with a budget of 35.45. Extended Survey hosts Pilot Initiative A (program_id 2986219), a food_service program budgeted at 18.47. Pilot Corridor hosts Baseline Model (program_id 1186079), a child_nutrition program with a budget of 26.25. Baseline Series D hosts Distributed Cluster (program_id 1562855), a food_service program budgeted at 17.12. This view supports program oversight by linking service delivery to the physical locations where it occurs.

**View `campus_program_view`**

```sql
CREATE VIEW campus_program_view AS
SELECT a.campus_id, a.campus_name, a.campus_level, a.enrollment, b.id AS program_id, b.program_id AS program_program_id, b.program_name AS program_program_name
FROM campuses a JOIN programs b ON a.program_id = b.id;
```

| campus_id | campus_name | campus_level | enrollment | program_id | program_program_id | program_program_name |
|---|---|---|---|---|---|---|
| 1 | Integrated Assessment A | elementary | 13 | 1 | 103176 | Extended Review |
| 2 | Extended Survey | middle | 21 | 2 | 2986219 | Pilot Initiative A |
| 3 | Pilot Corridor | high | 29 | 3 | 1186079 | Baseline Model |
| 4 | Baseline Series D | k12 | 37 | 4 | 1562855 | Distributed Cluster |

### Program-Centric Relationships

The program_campus_view joins programs with their host campuses, answering where each program is delivered. The Extended Review program operates at Integrated Assessment A, the Pilot Initiative A program at Extended Survey, the Baseline Model program at Pilot Corridor, and the Distributed Cluster program at Baseline Series D. This perspective is critical for logistics and resource planning, as it ties program budgets and timelines to specific campus locations.

**View `program_campus_view`**

```sql
CREATE VIEW program_campus_view AS
SELECT a.id, a.program_id, a.program_name, a.program_type, b.campus_id AS campus_campus_id, b.campus_name AS campus_campus_name, b.campus_level AS campus_campus_level
FROM programs a JOIN campuses b ON a.campus_id = b.campus_id;
```

| id | program_id | program_name | program_type | campus_campus_id | campus_campus_name | campus_campus_level |
|---|---|---|---|---|---|---|
| 1 | 103176 | Extended Review | child_nutrition | 1 | Integrated Assessment A | elementary |
| 2 | 2986219 | Pilot Initiative A | food_service | 2 | Extended Survey | middle |
| 3 | 1186079 | Baseline Model | child_nutrition | 3 | Pilot Corridor | high |
| 4 | 1562855 | Distributed Cluster | food_service | 4 | Baseline Series D | k12 |

The program_person_view links programs to the persons responsible for them. The Extended Review program is managed by person 100 (Stephanie Collins), Pilot Initiative A by person 101 (Janice Johnston), Baseline Model by person 102 (Upal Saha), and Distributed Cluster by person 103 (Katherine Snyder). This relationship supports accountability by identifying the individual responsible for each program's execution and outcomes.

**View `program_person_view`**

```sql
CREATE VIEW program_person_view AS
SELECT a.id, a.program_id, a.program_name, a.program_type, b.person_id AS person_person_id, b.first_name AS person_first_name, b.last_name AS person_last_name
FROM programs a JOIN persons b ON a.person_id = b.person_id;
```

| id | program_id | program_name | program_type | person_person_id | person_first_name | person_last_name |
|---|---|---|---|---|---|---|
| 1 | 103176 | Extended Review | child_nutrition | 100 | Stephanie Collins | Paul Allen |
| 2 | 2986219 | Pilot Initiative A | food_service | 101 | Janice Johnston | Heather Beasley |
| 3 | 1186079 | Baseline Model | child_nutrition | 102 | Upal Saha | Audrey Taylor |
| 4 | 1562855 | Distributed Cluster | food_service | 103 | Katherine Snyder | Susan Wagner |

The program_policy_view connects programs to the policies that govern them. The Extended Review program operates under policy 1000, Pilot Initiative A under policy 1001, Baseline Model under policy 1002, and Distributed Cluster under policy 1003. This join is essential for compliance auditing, as it reveals whether each program's activities align with the applicable policy framework.

**View `program_policy_view`**

```sql
CREATE VIEW program_policy_view AS
SELECT a.id, a.program_id, a.program_name, a.program_type, b.id AS policy_id, b.policy_id AS policy_policy_id, b.policy_name AS policy_policy_name
FROM programs a JOIN policies b ON a.policy_id = b.id;
```

| id | program_id | program_name | program_type | policy_id | policy_policy_id | policy_policy_name |
|---|---|---|---|---|---|---|
| 1 | 103176 | Extended Review | child_nutrition | 1000 | 5844252 | Regional Series |
| 2 | 2986219 | Pilot Initiative A | food_service | 1001 | 10207142 | Seasonal Assessment D |
| 3 | 1186079 | Baseline Model | child_nutrition | 1002 | 1562847 | Integrated Survey |
| 4 | 1562855 | Distributed Cluster | food_service | 1003 | ChIJkzsYUIBt5kcRM6_JHx26ONk | Extended Corridor |

### Policy-Centric Relationships

The policy_program_view starts from policies and lists the programs subject to each one. Policy 1000 governs the Extended Review program, policy 1001 governs Pilot Initiative A, policy 1002 governs Baseline Model, and policy 1003 governs Distributed Cluster. This orientation is useful for policy administrators who need to understand the reach and impact of each policy across the program portfolio.

**View `policy_program_view`**

```sql
CREATE VIEW policy_program_view AS
SELECT a.id, a.policy_id, a.policy_name, a.policy_type, b.id AS program_id, b.program_id AS program_program_id, b.program_name AS program_program_name
FROM policies a JOIN programs b ON a.program_id = b.id;
```

| id | policy_id | policy_name | policy_type | program_id | program_program_id | program_program_name |
|---|---|---|---|---|---|---|
| 1000 | 5844252 | Regional Series | operating | 1 | 103176 | Extended Review |
| 1001 | 10207142 | Seasonal Assessment D | procurement | 2 | 2986219 | Pilot Initiative A |
| 1002 | 1562847 | Integrated Survey | menu | 3 | 1186079 | Baseline Model |
| 1003 | ChIJkzsYUIBt5kcRM6_JHx26ONk | Extended Corridor | operating | 4 | 1562855 | Distributed Cluster |

The policy_campus_view links policies to the campuses where the governed programs operate. Policy 1000 applies at Integrated Assessment A, policy 1001 at Extended Survey, policy 1002 at Pilot Corridor, and policy 1003 at Baseline Series D. This view supports campus-level compliance checks, ensuring that the policies governing programs are properly enforced at the locations where services are delivered.

**View `policy_campus_view`**

```sql
CREATE VIEW policy_campus_view AS
SELECT a.id, a.policy_id, a.policy_name, a.policy_type, b.campus_id AS campus_campus_id, b.campus_name AS campus_campus_name, b.campus_level AS campus_campus_level
FROM policies a JOIN campuses b ON a.campus_id = b.campus_id;
```

| id | policy_id | policy_name | policy_type | campus_campus_id | campus_campus_name | campus_campus_level |
|---|---|---|---|---|---|---|
| 1000 | 5844252 | Regional Series | operating | 1 | Integrated Assessment A | elementary |
| 1001 | 10207142 | Seasonal Assessment D | procurement | 2 | Extended Survey | middle |
| 1002 | 1562847 | Integrated Survey | menu | 3 | Pilot Corridor | high |
| 1003 | ChIJkzsYUIBt5kcRM6_JHx26ONk | Extended Corridor | operating | 4 | Baseline Series D | k12 |

### Synthesis

The records and their relationships form a coherent administrative ecosystem. Awards recognize individuals and institutions, persons fill positions within organizations, organizations oversee campuses, campuses host programs, and programs operate under policies. Each view presented above answers a specific operational question: who holds which award, which organization oversees which campus, which policy governs which program. Together, these relationships enable comprehensive oversight, from the individual level through the institutional level, ensuring that every award, position, campus, program, and policy is accounted for and traceable. The system's design supports both granular audits and broad strategic reviews, making it a reliable foundation for educational administration.