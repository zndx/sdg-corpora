## Institutional Architecture and Academic Governance

Higher education institutions operate as layered organizations where administrative boundaries, academic offerings, and human resources intersect in structured patterns. The data model captures this complexity through a hierarchy that begins with universities—the top-level legal entities—and cascades downward through schools, departments, programmes, and finally to the individuals who teach, study, and conduct research within them. Each layer carries its own set of attributes: legal names, establishment dates, operational statuses, and contact information that together form the institutional record. The relationships between these layers are not merely organizational charts; they are operational constraints that determine which faculty can teach which courses, which students enroll in which programmes, and which research projects receive departmental support.

**Table `universities`**

| id | university_id | university_name | legal_name | establishment_date | status | campus_location | total_campus_area_acres | funding_source | accreditation_body | accreditation_status |
|---|---|---|---|---|---|---|---|---|---|---|
| 100 | gd_acc_160002 | Compact Initiative | Adaptive Model | 2024-07-11T06:18:00 | active | pilot-campus-62 | 3.70 | baseline-funding-73 | integrated-accredit-88 | accredited |
| 101 | d87f6fa90b894eb8be0b031dcc4d667a | Legacy Model | Primary Cluster | 2025-12-22T13:35:00 | inactive | extended-campus-63 | 6.40 | pilot-funding-74 | seasonal-accredit-89 | provisional |
| 102 | 2002007020150 | Regional Cluster A | Composite Review D | 2022-05-06T20:52:00 | merging | integrated-campus-64 | 9.10 | extended-funding-75 | regional-accredit-90 | suspended |
| 103 | 392482 | Seasonal Review | Compact Initiative | 2023-10-17T03:09:00 | dissolving | seasonal-campus-65 | 11.80 | integrated-funding-76 | legacy-accredit-91 | denied |

Universities serve as the foundational organizational unit, each identified by a unique internal identifier and a public-facing university identifier. The record for Compact Initiative (identifier gd_acc_160002) illustrates a typical active institution: established on 2024-07-11, operating from pilot-campus-62 across 3.70 acres, and funded through baseline-funding-73 with accredited status. By contrast, Seasonal Review (identifier 392482) carries a denied accreditation status and a dissolving operational state, reflecting an institution in transition. The legal_name column distinguishes the formal corporate designation from the public-facing university_name, a separation that matters for contractual and regulatory purposes.

**Table `academic_schools`**

| academic_school_id | school_id | school_name | university_id | establishment_date | status | dean_id | contact_email | contact_phone | part_of_university_university_id |
|---|---|---|---|---|---|---|---|---|---|
| 100 | 1152671 | Seasonal Standard | gd_acc_160002 | 2024-07-11T06:18:00 | active | 9246321 | Christopher Wilson | Joe Tsai | 100 |
| 101 | 1186099 | Integrated Framework | d87f6fa90b894eb8be0b031dcc4d667a | 2025-12-22T13:35:00 | inactive | 14511 | Charles Larsen | Stephanie Collins | 101 |
| 102 | 7441154 | Extended Protocol D | 2002007020150 | 2022-05-06T20:52:00 | merging | 4976 | Mary Alvarez | Tasha Rodriguez | 102 |
| 103 | 338514 | Pilot Programme | 392482 | 2023-10-17T03:09:00 | dissolving | c7733852-9bac-11eb-a8a2-19ed5c03f8d3 | April Snyder | Walter Pratt | 103 |

Beneath the university level, academic schools aggregate departments into broader disciplinary or professional groupings. The school Seasonal Standard (school_id 1152671) belongs to Compact Initiative and is led by dean 9246321, with contact routed through Christopher Wilson at the phone number listed as Joe Tsai. The school's establishment_date of 2024-07-11T06:18:00 mirrors its parent university's founding, suggesting concurrent creation. The part_of_university_university_id column explicitly anchors each school to its parent, creating a navigable path from any school record upward to the university level.

**View `v_academic_school_university`**

```sql
CREATE VIEW v_academic_school_university AS
SELECT a.academic_school_id, a.school_id, a.school_name, a.university_id, b.id AS university_id, b.university_id AS university_university_id, b.university_name AS university_university_name
FROM academic_schools a JOIN universities b ON a.part_of_university_university_id = b.id;
```

| academic_school_id | school_id | school_name | university_id | university_id | university_university_id | university_university_name |
|---|---|---|---|---|---|---|
| 100 | 1152671 | Seasonal Standard | gd_acc_160002 | 100 | gd_acc_160002 | Compact Initiative |
| 101 | 1186099 | Integrated Framework | d87f6fa90b894eb8be0b031dcc4d667a | 101 | d87f6fa90b894eb8be0b031dcc4d667a | Legacy Model |
| 102 | 7441154 | Extended Protocol D | 2002007020150 | 102 | 2002007020150 | Regional Cluster A |
| 103 | 338514 | Pilot Programme | 392482 | 103 | 392482 | Seasonal Review |

This view resolves the school-to-university linkage into a single readable row. A record showing Integrated Framework (school_id 1186099) mapped to Legacy Model (university_id d87f6fa90b894eb8be0b031dcc4d667a) answers the operational question: which university governs this school's budget and accreditation? The joined result surfaces the university's accreditation_status alongside the school's own status, enabling administrators to spot misalignments—such as an inactive school within an active university—that may require governance intervention.

**View `v_university_academic_school_detail`**

```sql
CREATE VIEW v_university_academic_school_detail AS
SELECT a.id, a.university_id, a.university_name, b.academic_school_id AS school_academic_school_id, b.school_id AS school_school_id, b.school_name AS school_school_name
FROM universities a
  JOIN universities_schools j ON j.university_id = a.id
  JOIN academic_schools b ON b.academic_school_id = j.academic_school_id;
```

| id | university_id | university_name | school_academic_school_id | school_school_id | school_school_name |
|---|---|---|---|---|---|
| 100 | gd_acc_160002 | Compact Initiative | 100 | 1152671 | Seasonal Standard |
| 100 | gd_acc_160002 | Compact Initiative | 101 | 1186099 | Integrated Framework |
| 101 | d87f6fa90b894eb8be0b031dcc4d667a | Legacy Model | 101 | 1186099 | Integrated Framework |
| 101 | d87f6fa90b894eb8be0b031dcc4d667a | Legacy Model | 102 | 7441154 | Extended Protocol D |
| 102 | 2002007020150 | Regional Cluster A | 102 | 7441154 | Extended Protocol D |
| 102 | 2002007020150 | Regional Cluster A | 103 | 338514 | Pilot Programme |
| 103 | 392482 | Seasonal Review | 103 | 338514 | Pilot Programme |
| 103 | 392482 | Seasonal Review | 100 | 1152671 | Seasonal Standard |

The inverse perspective, listing all schools under a given university, supports resource allocation and strategic planning. For Compact Initiative, the view surfaces Seasonal Standard as its sole active school, with the dean's name and contact details readily available. When a university operates multiple schools, this view becomes the primary tool for comparing establishment dates, status distributions, and headcount across the institutional portfolio.

**Table `academic_departments`**

| department_id | department_name | school_id | establishment_date | status | head_of_department_id | contact_email | contact_phone | academic_school_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|
| 2087755 | Baseline Framework D | 1152671 | 2024-07-11T06:18:00 | active | id_27 | Christopher Wilson | Joe Tsai | 100 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 790483 | Distributed Protocol | 1186099 | 2025-12-22T13:35:00 | inactive | 8350033 | Charles Larsen | Stephanie Collins | 101 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 505978 | Adaptive Programme | 7441154 | 2022-05-06T20:52:00 | merging | 575203 | Mary Alvarez | Tasha Rodriguez | 102 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| id_6 | Primary Standard A | 338514 | 2023-10-17T03:09:00 | dissolving | 8350027 | April Snyder | Walter Pratt | 103 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Departments represent the operational core where teaching and research are organized. The department Baseline Framework D (department_id 2087755) operates under school_id 1152671 with head_of_department_id id_27 and contact routed through Christopher Wilson. Its status is active, and it was established on 2024-07-11T06:18:00. The department Distributed Protocol (department_id 790483), by contrast, carries an inactive status and was established more recently on 2025-12-22T13:35:00, suggesting a department that has been created but not yet activated for operations. The contact_email and contact_phone columns store what appear to be reference identifiers rather than conventional email addresses or phone numbers, consistent with the internal naming conventions observed throughout the dataset.

**View `v_academic_department_academic_school`**

```sql
CREATE VIEW v_academic_department_academic_school AS
SELECT a.department_id, a.department_name, a.school_id, a.establishment_date, b.academic_school_id AS school_academic_school_id, b.school_id AS school_school_id, b.school_name AS school_school_name
FROM academic_departments a JOIN academic_schools b ON a.academic_school_id = b.academic_school_id;
```

| department_id | department_name | school_id | establishment_date | school_academic_school_id | school_school_id | school_school_name |
|---|---|---|---|---|---|---|
| 2087755 | Baseline Framework D | 1152671 | 2024-07-11T06:18:00 | 100 | 1152671 | Seasonal Standard |
| 790483 | Distributed Protocol | 1186099 | 2025-12-22T13:35:00 | 101 | 1186099 | Integrated Framework |
| 505978 | Adaptive Programme | 7441154 | 2022-05-06T20:52:00 | 102 | 7441154 | Extended Protocol D |
| id_6 | Primary Standard A | 338514 | 2023-10-17T03:09:00 | 103 | 338514 | Pilot Programme |

This view joins each department to its parent school, answering the question of organizational归属. A row showing Adaptive Programme (department_id 505978) nested under Extended Protocol D (school_id 7441154) with a merging status signals a department undergoing structural change. The view's joined output allows administrators to assess how many departments fall under each school and whether any departments carry non-standard statuses such as merging or dissolving that may require special handling.

**View `v_academic_school_academic_department_detail`**

```sql
CREATE VIEW v_academic_school_academic_department_detail AS
SELECT a.academic_school_id, a.school_id, a.school_name, b.department_id AS department_department_id, b.department_name AS department_department_name, b.school_id AS department_school_id
FROM academic_schools a
  JOIN schools_departments j ON j.academic_school_id = a.academic_school_id
  JOIN academic_departments b ON b.department_id = j.department_id;
```

| academic_school_id | school_id | school_name | department_department_id | department_department_name | department_school_id |
|---|---|---|---|---|---|
| 100 | 1152671 | Seasonal Standard | 2087755 | Baseline Framework D | 1152671 |
| 100 | 1152671 | Seasonal Standard | 790483 | Distributed Protocol | 1186099 |
| 101 | 1186099 | Integrated Framework | 790483 | Distributed Protocol | 1186099 |
| 101 | 1186099 | Integrated Framework | 505978 | Adaptive Programme | 7441154 |
| 102 | 7441154 | Extended Protocol D | 505978 | Adaptive Programme | 7441154 |
| 102 | 7441154 | Extended Protocol D | id_6 | Primary Standard A | 338514 |
| 103 | 338514 | Pilot Programme | id_6 | Primary Standard A | 338514 |
| 103 | 338514 | Pilot Programme | 2087755 | Baseline Framework D | 1152671 |

From the school's perspective, this view enumerates all departments under its jurisdiction. For Seasonal Standard, the view would list Baseline Framework D as its active department, with the head of department's identifier and contact information available for direct outreach. This view is essential for deans who need to understand the operational capacity of their schools, including which departments are active, which are in transition, and which have no assigned head.

**Table `academic_programmes`**

| id | programme_id | programme_name | degree_level | department_id | start_date | status | credit_hours | duration_years | offered_by_department_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 1186102 | Extended Standard | primary-degree-22 | 2087755 | 2022-09-05T20:24:00 | planned | 14 | 14 | 2087755 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | 168535 | Pilot Framework A | adaptive-degree-23 | 790483 | 2023-02-16T03:41:00 | active | 22 | 18 | 790483 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | 17788643 | Baseline Protocol | distributed-degree-24 | 505978 | 2024-07-27T10:58:00 | suspended | 30 | 22 | 505978 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | f852e24c-9bac-11eb-a8a2-19ed5c03f8d3 | Distributed Programme | baseline-degree-25 | id_6 | 2025-12-11T17:15:00 | discontinued | 38 | 26 | id_6 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Academic programmes define the structured curricula through which students progress toward degrees. The programme Extended Standard (programme_id 1186102) is classified at the primary-degree-22 level, carries 14 credit hours, and has a duration of 14 years—a notably extended timeline that may reflect a part-time or modular delivery model. Its status is planned, with a start_date of 2022-09-05T20:24:00, and it is offered by department 2087755. The programme Pilot Framework A (programme_id 168535) represents an adaptive-degree-23 offering with 22 credit hours over 18 years, currently in active status. The Baseline Protocol (programme_id 17788643) carries 30 credit hours and a 22-year duration, with a suspended status indicating it is not currently accepting enrollments.

**View `v_academic_programme_academic_department`**

```sql
CREATE VIEW v_academic_programme_academic_department AS
SELECT a.id, a.programme_id, a.programme_name, a.degree_level, b.department_id AS department_department_id, b.department_name AS department_department_name, b.school_id AS department_school_id
FROM academic_programmes a JOIN academic_departments b ON a.offered_by_department_id = b.department_id;
```

| id | programme_id | programme_name | degree_level | department_department_id | department_department_name | department_school_id |
|---|---|---|---|---|---|---|
| 1 | 1186102 | Extended Standard | primary-degree-22 | 2087755 | Baseline Framework D | 1152671 |
| 2 | 168535 | Pilot Framework A | adaptive-degree-23 | 790483 | Distributed Protocol | 1186099 |
| 3 | 17788643 | Baseline Protocol | distributed-degree-24 | 505978 | Adaptive Programme | 7441154 |
| 4 | f852e24c-9bac-11eb-a8a2-19ed5c03f8d3 | Distributed Programme | baseline-degree-25 | id_6 | Primary Standard A | 338514 |

This view links each programme to its offering department, answering the question of which department is responsible for programme delivery and oversight. A row showing Distributed Programme (programme_id f852e24c-9bac-11eb-a8a2-19ed5c03f8d3) mapped to department id_6 with a discontinued status provides a clear audit trail: the department that created the programme is also the one accountable for its current inactive state. This relationship is critical for programme review cycles, where departmental leadership must demonstrate compliance with accreditation requirements.

**View `v_academic_department_academic_programme_detail`**

```sql
CREATE VIEW v_academic_department_academic_programme_detail AS
SELECT a.department_id, a.department_name, a.school_id, b.id AS programme_id, b.programme_id AS programme_programme_id, b.programme_name AS programme_programme_name
FROM academic_departments a
  JOIN departments_programmes j ON j.department_id = a.department_id
  JOIN academic_programmes b ON b.id = j.academic_programme_id;
```

| department_id | department_name | school_id | programme_id | programme_programme_id | programme_programme_name |
|---|---|---|---|---|---|
| 2087755 | Baseline Framework D | 1152671 | 1 | 1186102 | Extended Standard |
| 2087755 | Baseline Framework D | 1152671 | 2 | 168535 | Pilot Framework A |
| 790483 | Distributed Protocol | 1186099 | 2 | 168535 | Pilot Framework A |
| 790483 | Distributed Protocol | 1186099 | 3 | 17788643 | Baseline Protocol |
| 505978 | Adaptive Programme | 7441154 | 3 | 17788643 | Baseline Protocol |
| 505978 | Adaptive Programme | 7441154 | 4 | f852e24c-9bac-11eb-a8a2-19ed5c03f8d3 | Distributed Programme |
| id_6 | Primary Standard A | 338514 | 4 | f852e24c-9bac-11eb-a8a2-19ed5c03f8d3 | Distributed Programme |
| id_6 | Primary Standard A | 338514 | 1 | 1186102 | Extended Standard |

From the department's perspective, this view enumerates all programmes it offers. For Baseline Framework D, the view surfaces Extended Standard as its primary programme offering. When a department manages multiple programmes across different degree levels, this view becomes the primary tool for assessing the department's academic portfolio and ensuring that programme capacity aligns with faculty resources.

**Table `faculty_members`**

| faculty_member_id | faculty_id | first_name | last_name | title | department_id | school_id | university_id | employment_status | hire_date | contact_email | contact_phone |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 100 | 98a02b9c-8fcd-11eb-924d-9cd76263cbd0 | Stephanie Collins | Paul Allen | Compact Initiative | 2087755 | 1152671 | gd_acc_160002 | active | 2023-06-01T05:39:00 | Christopher Wilson | Joe Tsai |
| 101 | 605968 | Janice Johnston | Heather Beasley | Legacy Model | 790483 | 1186099 | d87f6fa90b894eb8be0b031dcc4d667a | on_leave | 2024-11-12T12:56:00 | Charles Larsen | Stephanie Collins |
| 102 | 10449508 | Upal Saha | Audrey Taylor | Regional Cluster A | 505978 | 7441154 | 2002007020150 | retired | 2025-04-23T19:13:00 | Mary Alvarez | Tasha Rodriguez |
| 103 | 2002007020230 | Katherine Snyder | Susan Wagner | Seasonal Review | id_6 | 338514 | 392482 | terminated | 2022-09-07T02:30:00 | April Snyder | Walter Pratt |

Faculty members constitute the teaching and research workforce. Stephanie Collins (faculty_member_id 100, faculty_id 98a02b9c-8fcd-11eb-924d-9cd76263cbd0) holds the title Compact Initiative and is employed in department 2087755, school 1152671, under university gd_acc_160002. Her employment_status is active, with a hire_date of 2023-06-01T05:39:00. Janice Johnston (faculty_member_id 101) is on_leave from department 790483, while Upal Saha (faculty_member_id 102) has retired from department 505978. Katherine Snyder (faculty_member_id 103) carries a terminated status, indicating a separation from the institution. The contact_email and contact_phone columns again store reference identifiers, consistent with the internal naming convention.

**View `v_university_faculty_member_detail`**

```sql
CREATE VIEW v_university_faculty_member_detail AS
SELECT a.id, a.university_id, a.university_name, b.faculty_member_id AS member_faculty_member_id, b.faculty_id AS member_faculty_id, b.first_name AS member_first_name
FROM universities a
  JOIN universities_members j ON j.university_id = a.id
  JOIN faculty_members b ON b.faculty_member_id = j.faculty_member_id;
```

| id | university_id | university_name | member_faculty_member_id | member_faculty_id | member_first_name |
|---|---|---|---|---|---|
| 100 | gd_acc_160002 | Compact Initiative | 100 | 98a02b9c-8fcd-11eb-924d-9cd76263cbd0 | Stephanie Collins |
| 100 | gd_acc_160002 | Compact Initiative | 101 | 605968 | Janice Johnston |
| 101 | d87f6fa90b894eb8be0b031dcc4d667a | Legacy Model | 101 | 605968 | Janice Johnston |
| 101 | d87f6fa90b894eb8be0b031dcc4d667a | Legacy Model | 102 | 10449508 | Upal Saha |
| 102 | 2002007020150 | Regional Cluster A | 102 | 10449508 | Upal Saha |
| 102 | 2002007020150 | Regional Cluster A | 103 | 2002007020230 | Katherine Snyder |
| 103 | 392482 | Seasonal Review | 103 | 2002007020230 | Katherine Snyder |
| 103 | 392482 | Seasonal Review | 100 | 98a02b9c-8fcd-11eb-924d-9cd76263cbd0 | Stephanie Collins |

This view lists all faculty members under a given university, providing a comprehensive roster for administrative purposes. For Compact Initiative, the view surfaces Stephanie Collins as its active faculty member, with her department, school, and employment status all visible in a single row. This view supports workforce planning, budget allocation, and compliance reporting by aggregating faculty data at the university level.

**View `v_academic_department_faculty_member_detail`**

```sql
CREATE VIEW v_academic_department_faculty_member_detail AS
SELECT a.department_id, a.department_name, a.school_id, b.faculty_member_id AS member_faculty_member_id, b.faculty_id AS member_faculty_id, b.first_name AS member_first_name
FROM academic_departments a
  JOIN departments_members j ON j.department_id = a.department_id
  JOIN faculty_members b ON b.faculty_member_id = j.faculty_member_id;
```

| department_id | department_name | school_id | member_faculty_member_id | member_faculty_id | member_first_name |
|---|---|---|---|---|---|
| 2087755 | Baseline Framework D | 1152671 | 100 | 98a02b9c-8fcd-11eb-924d-9cd76263cbd0 | Stephanie Collins |
| 2087755 | Baseline Framework D | 1152671 | 101 | 605968 | Janice Johnston |
| 790483 | Distributed Protocol | 1186099 | 101 | 605968 | Janice Johnston |
| 790483 | Distributed Protocol | 1186099 | 102 | 10449508 | Upal Saha |
| 505978 | Adaptive Programme | 7441154 | 102 | 10449508 | Upal Saha |
| 505978 | Adaptive Programme | 7441154 | 103 | 2002007020230 | Katherine Snyder |
| id_6 | Primary Standard A | 338514 | 103 | 2002007020230 | Katherine Snyder |
| id_6 | Primary Standard A | 338514 | 100 | 98a02b9c-8fcd-11eb-924d-9cd76263cbd0 | Stephanie Collins |

From the department's perspective, this view enumerates all faculty members assigned to it. Baseline Framework D (department_id 2087755) has Stephanie Collins as its active member. The view includes the faculty member's title, employment status, and hire date, enabling department heads to assess staffing levels, identify coverage gaps, and plan for succession in cases of retirement or termination.

**View `v_faculty_member_course_detail`**

```sql
CREATE VIEW v_faculty_member_course_detail AS
SELECT a.faculty_member_id, a.faculty_id, a.first_name, b.course_id AS course_course_id, b.course_code AS course_course_code, b.course_name AS course_course_name
FROM faculty_members a
  JOIN members_courses j ON j.faculty_member_id = a.faculty_member_id
  JOIN courses b ON b.course_id = j.course_id;
```

| faculty_member_id | faculty_id | first_name | course_course_id | course_course_code | course_course_name |
|---|---|---|---|---|---|
| 100 | 98a02b9c-8fcd-11eb-924d-9cd76263cbd0 | Stephanie Collins | 1 | 10238263 | Legacy Protocol D |
| 100 | 98a02b9c-8fcd-11eb-924d-9cd76263cbd0 | Stephanie Collins | 2 | 4463667 | Regional Programme |
| 101 | 605968 | Janice Johnston | 2 | 4463667 | Regional Programme |
| 101 | 605968 | Janice Johnston | 3 | 24077793 | Seasonal Standard |
| 102 | 10449508 | Upal Saha | 3 | 24077793 | Seasonal Standard |
| 102 | 10449508 | Upal Saha | 4 | 1204-0009-L | Integrated Framework A |
| 103 | 2002007020230 | Katherine Snyder | 4 | 1204-0009-L | Integrated Framework A |
| 103 | 2002007020230 | Katherine Snyder | 1 | 10238263 | Legacy Protocol D |

This view links faculty members to the courses they teach, answering the question of instructional assignment. A row showing Stephanie Collins assigned to a course under department 2087755 provides the operational record for scheduling and workload calculation. The view surfaces the course identifier alongside the faculty member's details, enabling administrators to verify that teaching assignments align with faculty expertise and availability.

**View `v_faculty_member_research_project_detail`**

```sql
CREATE VIEW v_faculty_member_research_project_detail AS
SELECT a.faculty_member_id, a.faculty_id, a.first_name, b.project_id AS project_project_id, b.project_title AS project_project_title, b.start_date AS project_start_date
FROM faculty_members a
  JOIN members_projects j ON j.faculty_member_id = a.faculty_member_id
  JOIN research_projects b ON b.project_id = j.project_id;
```

| faculty_member_id | faculty_id | first_name | project_project_id | project_project_title | project_start_date |
|---|---|---|---|---|---|
| 100 | 98a02b9c-8fcd-11eb-924d-9cd76263cbd0 | Stephanie Collins | 1437597 | Integrated Model A | 2022-09-05T20:24:00 |
| 100 | 98a02b9c-8fcd-11eb-924d-9cd76263cbd0 | Stephanie Collins | df5a6648-8fd1-11eb-924d-9cd76263cbd0 | Extended Cluster | 2023-02-16T03:41:00 |
| 101 | 605968 | Janice Johnston | df5a6648-8fd1-11eb-924d-9cd76263cbd0 | Extended Cluster | 2023-02-16T03:41:00 |
| 101 | 605968 | Janice Johnston | 5006462 | Pilot Review | 2024-07-27T10:58:00 |
| 102 | 10449508 | Upal Saha | 5006462 | Pilot Review | 2024-07-27T10:58:00 |
| 102 | 10449508 | Upal Saha | 10207143 | Baseline Initiative D | 2025-12-11T17:15:00 |
| 103 | 2002007020230 | Katherine Snyder | 10207143 | Baseline Initiative D | 2025-12-11T17:15:00 |
| 103 | 2002007020230 | Katherine Snyder | 1437597 | Integrated Model A | 2022-09-05T20:24:00 |

Research engagement is captured through the linkage between faculty members and research projects. This view surfaces which faculty members are participating in which projects, providing a record of research productivity and collaboration. For Upal Saha, who has retired, the view may show historical project participation, offering a complete research record even after employment has ended.

**View `v_faculty_member_student_detail`**

```sql
CREATE VIEW v_faculty_member_student_detail AS
SELECT a.faculty_member_id, a.faculty_id, a.first_name, b.id AS student_id, b.student_id AS student_student_id, b.first_name AS student_first_name
FROM faculty_members a
  JOIN members_students j ON j.faculty_member_id = a.faculty_member_id
  JOIN students b ON b.id = j.student_id;
```

| faculty_member_id | faculty_id | first_name | student_id | student_student_id | student_first_name |
|---|---|---|---|---|---|
| 100 | 98a02b9c-8fcd-11eb-924d-9cd76263cbd0 | Stephanie Collins | 1 | 392507 | Stephanie Collins |
| 100 | 98a02b9c-8fcd-11eb-924d-9cd76263cbd0 | Stephanie Collins | 2 | 25388256 | Janice Johnston |
| 101 | 605968 | Janice Johnston | 2 | 25388256 | Janice Johnston |
| 101 | 605968 | Janice Johnston | 3 | id_16 | Upal Saha |
| 102 | 10449508 | Upal Saha | 3 | id_16 | Upal Saha |
| 102 | 10449508 | Upal Saha | 4 | gd_taxc_2211 | Katherine Snyder |
| 103 | 2002007020230 | Katherine Snyder | 4 | gd_taxc_2211 | Katherine Snyder |
| 103 | 2002007020230 | Katherine Snyder | 1 | 392507 | Stephanie Collins |

The faculty-to-student relationship, often representing academic advising or supervisory roles, is captured here. Stephanie Collins (faculty_member_id 100) is linked to student 392507 (Stephanie Collins, student_id), creating a clear advising relationship. This view supports academic advising workflows by surfacing which faculty member is responsible for which students, enabling students to identify their advisor and faculty to track advisee progress.

**Table `students`**

| id | student_id | first_name | last_name | date_of_birth | gender | enrollment_date | expected_graduation_date | academic_standing | contact_email | contact_phone | address | emergency_contact_name | emergency_contact_phone | academic_programme_id | faculty_member_id |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 392507 | Stephanie Collins | Paul Allen | 2025-04-02 | male | 2022-05-11T16:00:00 | 2022-01-26 | good_standing | Christopher Wilson | Joe Tsai | distributed-address-72 | Elizabeth Woods | Jennifer Summers | 1 | 100 |
| 2 | 25388256 | Janice Johnston | Heather Beasley | 2022-09-13 | female | 2023-10-22T23:17:00 | 2023-06-10 | probation | Charles Larsen | Stephanie Collins | baseline-address-73 | Apache Commons Net | Cheryl Bradley | 2 | 101 |
| 3 | id_16 | Upal Saha | Audrey Taylor | 2023-02-24 | other | 2024-03-06T06:34:00 | 2024-11-21 | suspended | Mary Alvarez | Tasha Rodriguez | pilot-address-74 | Desiree Cain | Sheila Lane | 3 | 102 |
| 4 | gd_taxc_2211 | Katherine Snyder | Susan Wagner | 2024-07-08 | prefer_not_to_say | 2025-08-17T13:51:00 | 2025-04-05 | graduated | April Snyder | Walter Pratt | extended-address-75 | Heavy Torpedo | Stephanie Collins | 4 | 103 |

Students are the primary beneficiaries of the academic programme structure. Student 392507 (first_name Stephanie Collins, last_name Paul Allen) was born on 2025-04-02, enrolled on 2022-05-11T16:00:00, and is in good_standing academic status. Their expected_graduation_date is 2022-01-26, and they are enrolled in academic_programme_id 1. Student 25388256 (Janice Johnston, Heather Beasley) carries a probation status, indicating academic difficulty requiring intervention. Student id_16 (Upal Saha, Audrey Taylor) has a suspended status, while student gd_taxc_2211 (Katherine Snyder, Susan Wagner) has graduated, completing their programme of study. The gender column captures male, female, other, and prefer_not_to_say values, reflecting inclusive data collection practices.

**View `v_university_student_detail`**

```sql
CREATE VIEW v_university_student_detail AS
SELECT a.id, a.university_id, a.university_name, b.id AS student_id, b.student_id AS student_student_id, b.first_name AS student_first_name
FROM universities a
  JOIN universities_students j ON j.university_id = a.id
  JOIN students b ON b.id = j.student_id;
```

| id | university_id | university_name | student_id | student_student_id | student_first_name |
|---|---|---|---|---|---|
| 100 | gd_acc_160002 | Compact Initiative | 1 | 392507 | Stephanie Collins |
| 100 | gd_acc_160002 | Compact Initiative | 2 | 25388256 | Janice Johnston |
| 101 | d87f6fa90b894eb8be0b031dcc4d667a | Legacy Model | 2 | 25388256 | Janice Johnston |
| 101 | d87f6fa90b894eb8be0b031dcc4d667a | Legacy Model | 3 | id_16 | Upal Saha |
| 102 | 2002007020150 | Regional Cluster A | 3 | id_16 | Upal Saha |
| 102 | 2002007020150 | Regional Cluster A | 4 | gd_taxc_2211 | Katherine Snyder |
| 103 | 392482 | Seasonal Review | 4 | gd_taxc_2211 | Katherine Snyder |
| 103 | 392482 | Seasonal Review | 1 | 392507 | Stephanie Collins |

This view aggregates all students under a given university, providing enrollment statistics and demographic breakdowns. For Compact Initiative, the view surfaces student 392507 as its enrolled student, with full personal and academic details available in a single row. This view supports institutional reporting, accreditation documentation, and resource planning by consolidating student data at the university level.

**View `v_student_academic_programme`**

```sql
CREATE VIEW v_student_academic_programme AS
SELECT a.id, a.student_id, a.first_name, a.last_name, b.id AS programme_id, b.programme_id AS programme_programme_id, b.programme_name AS programme_programme_name
FROM students a JOIN academic_programmes b ON a.academic_programme_id = b.id;
```

| id | student_id | first_name | last_name | programme_id | programme_programme_id | programme_programme_name |
|---|---|---|---|---|---|---|
| 1 | 392507 | Stephanie Collins | Paul Allen | 1 | 1186102 | Extended Standard |
| 2 | 25388256 | Janice Johnston | Heather Beasley | 2 | 168535 | Pilot Framework A |
| 3 | id_16 | Upal Saha | Audrey Taylor | 3 | 17788643 | Baseline Protocol |
| 4 | gd_taxc_2211 | Katherine Snyder | Susan Wagner | 4 | f852e24c-9bac-11eb-a8a2-19ed5c03f8d3 | Distributed Programme |

This view links each student to their enrolled programme, answering the question of which curriculum the student is following. Student 392507 is enrolled in programme 1 (Extended Standard), which is classified at the primary-degree-22 level and offered by department 2087755. The view surfaces the programme's credit_hours, duration_years, and status, enabling students and advisors to verify that the student's programme is active and that the credit requirements are clearly understood.

**View `v_student_course_detail`**

```sql
CREATE VIEW v_student_course_detail AS
SELECT a.id, a.student_id, a.first_name, b.course_id AS course_course_id, b.course_code AS course_course_code, b.course_name AS course_course_name
FROM students a
  JOIN students_courses j ON j.student_id = a.id
  JOIN courses b ON b.course_id = j.course_id;
```

| id | student_id | first_name | course_course_id | course_course_code | course_course_name |
|---|---|---|---|---|---|
| 1 | 392507 | Stephanie Collins | 1 | 10238263 | Legacy Protocol D |
| 1 | 392507 | Stephanie Collins | 2 | 4463667 | Regional Programme |
| 2 | 25388256 | Janice Johnston | 2 | 4463667 | Regional Programme |
| 2 | 25388256 | Janice Johnston | 3 | 24077793 | Seasonal Standard |
| 3 | id_16 | Upal Saha | 3 | 24077793 | Seasonal Standard |
| 3 | id_16 | Upal Saha | 4 | 1204-0009-L | Integrated Framework A |
| 4 | gd_taxc_2211 | Katherine Snyder | 4 | 1204-0009-L | Integrated Framework A |
| 4 | gd_taxc_2211 | Katherine Snyder | 1 | 10238263 | Legacy Protocol D |

Course enrollment is captured through this view, which links students to the courses they are taking. A row showing student 392507 enrolled in a course provides the operational record for grading, attendance tracking, and academic progress monitoring. The view surfaces the course identifier alongside the student's academic_standing, enabling administrators to identify students who may be struggling while maintaining course loads.

**View `v_student_faculty_member`**

```sql
CREATE VIEW v_student_faculty_member AS
SELECT a.id, a.student_id, a.first_name, a.last_name, b.faculty_member_id AS member_faculty_member_id, b.faculty_id AS member_faculty_id, b.first_name AS member_first_name
FROM students a JOIN faculty_members b ON a.faculty_member_id = b.faculty_member_id;
```

| id | student_id | first_name | last_name | member_faculty_member_id | member_faculty_id | member_first_name |
|---|---|---|---|---|---|---|
| 1 | 392507 | Stephanie Collins | Paul Allen | 100 | 98a02b9c-8fcd-11eb-924d-9cd76263cbd0 | Stephanie Collins |
| 2 | 25388256 | Janice Johnston | Heather Beasley | 101 | 605968 | Janice Johnston |
| 3 | id_16 | Upal Saha | Audrey Taylor | 102 | 10449508 | Upal Saha |
| 4 | gd_taxc_2211 | Katherine Snyder | Susan Wagner | 103 | 2002007020230 | Katherine Snyder |

This view surfaces the advising or supervisory relationship between students and faculty members. Student 392507 is linked to faculty member 100 (Stephanie Collins), creating a clear advising chain. This relationship is essential for academic support services, ensuring that every student has a designated faculty contact for guidance on programme requirements, course selection, and career planning.

**Table `courses`**

| course_id | course_code | course_name | credit_hours | semester | year | status | prerequisite_course_id | department_id | school_id | university_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 10238263 | Legacy Protocol D | 14 | fall | 12 | planned | lu_tax_code_template_m09 | 2087755 | 1152671 | gd_acc_160002 |
| 2 | 4463667 | Regional Programme | 22 | spring | 21 | active | account_pymes_2405 | 790483 | 1186099 | d87f6fa90b894eb8be0b031dcc4d667a |
| 3 | 24077793 | Seasonal Standard | 30 | summer | 30 | suspended | Invoices | 505978 | 7441154 | 2002007020150 |
| 4 | 1204-0009-L | Integrated Framework A | 38 | winter | 39 | discontinued | 255 | id_6 | 338514 | 392482 |

Courses represent the individual instructional units within academic programmes. While the specific course records are not enumerated in the sample data, the courses table serves as the central node in the instructional graph, linking to programmes through courses_programmes, to faculty through courses_members, and to students through courses_students. Each course carries its own identifier and is associated with one or more academic programmes, one or more faculty instructors, and one or more enrolled students.

**View `v_course_academic_programme_detail`**

```sql
CREATE VIEW v_course_academic_programme_detail AS
SELECT a.course_id, a.course_code, a.course_name, b.id AS programme_id, b.programme_id AS programme_programme_id, b.programme_name AS programme_programme_name
FROM courses a
  JOIN courses_programmes j ON j.course_id = a.course_id
  JOIN academic_programmes b ON b.id = j.academic_programme_id;
```

| course_id | course_code | course_name | programme_id | programme_programme_id | programme_programme_name |
|---|---|---|---|---|---|
| 1 | 10238263 | Legacy Protocol D | 1 | 1186102 | Extended Standard |
| 1 | 10238263 | Legacy Protocol D | 2 | 168535 | Pilot Framework A |
| 2 | 4463667 | Regional Programme | 2 | 168535 | Pilot Framework A |
| 2 | 4463667 | Regional Programme | 3 | 17788643 | Baseline Protocol |
| 3 | 24077793 | Seasonal Standard | 3 | 17788643 | Baseline Protocol |
| 3 | 24077793 | Seasonal Standard | 4 | f852e24c-9bac-11eb-a8a2-19ed5c03f8d3 | Distributed Programme |
| 4 | 1204-0009-L | Integrated Framework A | 4 | f852e24c-9bac-11eb-a8a2-19ed5c03f8d3 | Distributed Programme |
| 4 | 1204-0009-L | Integrated Framework A | 1 | 1186102 | Extended Standard |

This view links courses to their parent programmes, answering the question of which curriculum a course serves. A row showing a course mapped to programme 1 (Extended Standard) provides the curricular context for the course, including the degree_level and credit_hours of the parent programme. This view is essential for curriculum mapping, ensuring that every course contributes to a defined programme outcome.

**View `v_course_faculty_member_detail`**

```sql
CREATE VIEW v_course_faculty_member_detail AS
SELECT a.course_id, a.course_code, a.course_name, b.faculty_member_id AS member_faculty_member_id, b.faculty_id AS member_faculty_id, b.first_name AS member_first_name
FROM courses a
  JOIN courses_members j ON j.course_id = a.course_id
  JOIN faculty_members b ON b.faculty_member_id = j.faculty_member_id;
```

| course_id | course_code | course_name | member_faculty_member_id | member_faculty_id | member_first_name |
|---|---|---|---|---|---|
| 1 | 10238263 | Legacy Protocol D | 100 | 98a02b9c-8fcd-11eb-924d-9cd76263cbd0 | Stephanie Collins |
| 1 | 10238263 | Legacy Protocol D | 101 | 605968 | Janice Johnston |
| 2 | 4463667 | Regional Programme | 101 | 605968 | Janice Johnston |
| 2 | 4463667 | Regional Programme | 102 | 10449508 | Upal Saha |
| 3 | 24077793 | Seasonal Standard | 102 | 10449508 | Upal Saha |
| 3 | 24077793 | Seasonal Standard | 103 | 2002007020230 | Katherine Snyder |
| 4 | 1204-0009-L | Integrated Framework A | 103 | 2002007020230 | Katherine Snyder |
| 4 | 1204-0009-L | Integrated Framework A | 100 | 98a02b9c-8fcd-11eb-924d-9cd76263cbd0 | Stephanie Collins |

Instructional assignment is captured through this view, which links courses to their faculty instructors. A row showing a course taught by faculty member 100 (Stephanie Collins) provides the operational record for scheduling, workload calculation, and quality assurance. The view surfaces the faculty member's department and employment status, enabling administrators to verify that courses are staffed by qualified and available instructors.

**View `v_course_student_detail`**

```sql
CREATE VIEW v_course_student_detail AS
SELECT a.course_id, a.course_code, a.course_name, b.id AS student_id, b.student_id AS student_student_id, b.first_name AS student_first_name
FROM courses a
  JOIN courses_students j ON j.course_id = a.course_id
  JOIN students b ON b.id = j.student_id;
```

| course_id | course_code | course_name | student_id | student_student_id | student_first_name |
|---|---|---|---|---|---|
| 1 | 10238263 | Legacy Protocol D | 1 | 392507 | Stephanie Collins |
| 1 | 10238263 | Legacy Protocol D | 2 | 25388256 | Janice Johnston |
| 2 | 4463667 | Regional Programme | 2 | 25388256 | Janice Johnston |
| 2 | 4463667 | Regional Programme | 3 | id_16 | Upal Saha |
| 3 | 24077793 | Seasonal Standard | 3 | id_16 | Upal Saha |
| 3 | 24077793 | Seasonal Standard | 4 | gd_taxc_2211 | Katherine Snyder |
| 4 | 1204-0009-L | Integrated Framework A | 4 | gd_taxc_2211 | Katherine Snyder |
| 4 | 1204-0009-L | Integrated Framework A | 1 | 392507 | Stephanie Collins |

Enrollment is captured through this view, which links courses to their enrolled students. A row showing student 392507 enrolled in a course provides the operational record for grading, attendance, and academic progress. The view surfaces the student's academic_standing and expected_graduation_date, enabling instructors to identify students who may need additional support.

**Table `research_projects`**

| project_id | project_title | start_date | end_date | status | funding_amount | funding_source | department_id | school_id | university_id | part_of_department_department_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1437597 | Integrated Model A | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | planned | 10.72 | baseline-funding-73 | 2087755 | 1152671 | gd_acc_160002 | 2087755 |
| df5a6648-8fd1-11eb-924d-9cd76263cbd0 | Extended Cluster | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | active | 12.72 | pilot-funding-74 | 790483 | 1186099 | d87f6fa90b894eb8be0b031dcc4d667a | 790483 |
| 5006462 | Pilot Review | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | completed | 25.36 | extended-funding-75 | 505978 | 7441154 | 2002007020150 | 505978 |
| 10207143 | Baseline Initiative D | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | suspended | 11.88 | integrated-funding-76 | id_6 | 338514 | 392482 | id_6 |

Research projects represent the scholarly output of the institution, conducted by faculty members and often involving student participation. While the specific project records are not enumerated in the sample data, the research_projects table serves as the central node in the research graph, linking to faculty members through projects_members and to students through projects_students. Each project carries its own identifier and is associated with one or more faculty investigators and one or more student researchers.

**View `v_research_project_faculty_member_detail`**

```sql
CREATE VIEW v_research_project_faculty_member_detail AS
SELECT a.project_id, a.project_title, a.start_date, b.faculty_member_id AS member_faculty_member_id, b.faculty_id AS member_faculty_id, b.first_name AS member_first_name
FROM research_projects a
  JOIN projects_members j ON j.project_id = a.project_id
  JOIN faculty_members b ON b.faculty_member_id = j.faculty_member_id;
```

| project_id | project_title | start_date | member_faculty_member_id | member_faculty_id | member_first_name |
|---|---|---|---|---|---|
| 1437597 | Integrated Model A | 2022-09-05T20:24:00 | 100 | 98a02b9c-8fcd-11eb-924d-9cd76263cbd0 | Stephanie Collins |
| 1437597 | Integrated Model A | 2022-09-05T20:24:00 | 101 | 605968 | Janice Johnston |
| df5a6648-8fd1-11eb-924d-9cd76263cbd0 | Extended Cluster | 2023-02-16T03:41:00 | 101 | 605968 | Janice Johnston |
| df5a6648-8fd1-11eb-924d-9cd76263cbd0 | Extended Cluster | 2023-02-16T03:41:00 | 102 | 10449508 | Upal Saha |
| 5006462 | Pilot Review | 2024-07-27T10:58:00 | 102 | 10449508 | Upal Saha |
| 5006462 | Pilot Review | 2024-07-27T10:58:00 | 103 | 2002007020230 | Katherine Snyder |
| 10207143 | Baseline Initiative D | 2025-12-11T17:15:00 | 103 | 2002007020230 | Katherine Snyder |
| 10207143 | Baseline Initiative D | 2025-12-11T17:15:00 | 100 | 98a02b9c-8fcd-11eb-924d-9cd76263cbd0 | Stephanie Collins |

This view links research projects to their faculty investigators, answering the question of who is leading each project. A row showing a project associated with faculty member 100 (Stephanie Collins) provides the operational record for research productivity tracking and funding allocation. The view surfaces the faculty member's department and employment status, enabling research administrators to verify that projects are staffed by qualified and available investigators.

**View `v_research_project_student_detail`**

```sql
CREATE VIEW v_research_project_student_detail AS
SELECT a.project_id, a.project_title, a.start_date, b.id AS student_id, b.student_id AS student_student_id, b.first_name AS student_first_name
FROM research_projects a
  JOIN projects_students j ON j.project_id = a.project_id
  JOIN students b ON b.id = j.student_id;
```

| project_id | project_title | start_date | student_id | student_student_id | student_first_name |
|---|---|---|---|---|---|
| 1437597 | Integrated Model A | 2022-09-05T20:24:00 | 1 | 392507 | Stephanie Collins |
| 1437597 | Integrated Model A | 2022-09-05T20:24:00 | 2 | 25388256 | Janice Johnston |
| df5a6648-8fd1-11eb-924d-9cd76263cbd0 | Extended Cluster | 2023-02-16T03:41:00 | 2 | 25388256 | Janice Johnston |
| df5a6648-8fd1-11eb-924d-9cd76263cbd0 | Extended Cluster | 2023-02-16T03:41:00 | 3 | id_16 | Upal Saha |
| 5006462 | Pilot Review | 2024-07-27T10:58:00 | 3 | id_16 | Upal Saha |
| 5006462 | Pilot Review | 2024-07-27T10:58:00 | 4 | gd_taxc_2211 | Katherine Snyder |
| 10207143 | Baseline Initiative D | 2025-12-11T17:15:00 | 4 | gd_taxc_2211 | Katherine Snyder |
| 10207143 | Baseline Initiative D | 2025-12-11T17:15:00 | 1 | 392507 | Stephanie Collins |

Student participation in research is captured through this view, which links projects to their student researchers. A row showing student 392507 participating in a research project provides the operational record for research credit, mentorship tracking, and career development. The view surfaces the student's academic_standing and expected_graduation_date, enabling faculty advisors to identify students who may be balancing research commitments with coursework.

**View `v_research_project_academic_department`**

```sql
CREATE VIEW v_research_project_academic_department AS
SELECT a.project_id, a.project_title, a.start_date, a.end_date, b.department_id AS department_department_id, b.department_name AS department_department_name, b.school_id AS department_school_id
FROM research_projects a JOIN academic_departments b ON a.part_of_department_department_id = b.department_id;
```

| project_id | project_title | start_date | end_date | department_department_id | department_department_name | department_school_id |
|---|---|---|---|---|---|---|
| 1437597 | Integrated Model A | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | 2087755 | Baseline Framework D | 1152671 |
| df5a6648-8fd1-11eb-924d-9cd76263cbd0 | Extended Cluster | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | 790483 | Distributed Protocol | 1186099 |
| 5006462 | Pilot Review | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | 505978 | Adaptive Programme | 7441154 |
| 10207143 | Baseline Initiative D | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | id_6 | Primary Standard A | 338514 |

This view links research projects to their parent departments, answering the question of which department hosts each project. A row showing a project mapped to department 2087755 (Baseline Framework D) provides the organizational context for the project, including the department's status and head of department. This view is essential for research administration, ensuring that projects are properly attributed to their host departments for reporting and resource allocation purposes.

The cross-cutting relationship tables—programmes_courses, departments_programmes, departments_members, schools_departments, universities_schools, universities_members, universities_students, members_courses, members_projects, members_students, students_courses, courses_programmes, courses_members, courses_students, projects_members, and projects_students—serve as the connective tissue between the core entities. Each of these tables resolves a many-to-many or one-to-many relationship into a discrete record, enabling precise tracking of associations without data duplication. The programmes_courses table, for instance, links academic programmes to the courses they contain, while the departments_members table links departments to their assigned faculty members. These relationship tables are the operational backbone of the system, ensuring that every association between entities is explicitly recorded and queryable.

The views collectively provide a multi-perspective lens on the institutional data, allowing different stakeholders to access the information most relevant to their role. Deans use the school-level views to monitor departmental performance, department heads use the faculty and programme views to manage resources, faculty members use the course and research views to track their teaching and scholarly activities, and students use the programme and course views to plan their academic progress. This separation of concerns, enabled by the view layer, ensures that each user sees a coherent and actionable subset of the institutional record without being overwhelmed by the full complexity of the underlying data model.

## Data appendix

**Table `programmes_courses`**

| academic_programme_id | course_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

**Table `departments_programmes`**

| department_id | academic_programme_id |
|---|---|
| 2087755 | 1 |
| 2087755 | 2 |
| 790483 | 2 |
| 790483 | 3 |
| 505978 | 3 |
| 505978 | 4 |
| id_6 | 4 |
| id_6 | 1 |

**Table `departments_members`**

| department_id | faculty_member_id |
|---|---|
| 2087755 | 100 |
| 2087755 | 101 |
| 790483 | 101 |
| 790483 | 102 |
| 505978 | 102 |
| 505978 | 103 |
| id_6 | 103 |
| id_6 | 100 |

**Table `schools_departments`**

| academic_school_id | department_id |
|---|---|
| 100 | 2087755 |
| 100 | 790483 |
| 101 | 790483 |
| 101 | 505978 |
| 102 | 505978 |
| 102 | id_6 |
| 103 | id_6 |
| 103 | 2087755 |

**Table `universities_schools`**

| university_id | academic_school_id |
|---|---|
| 100 | 100 |
| 100 | 101 |
| 101 | 101 |
| 101 | 102 |
| 102 | 102 |
| 102 | 103 |
| 103 | 103 |
| 103 | 100 |

**Table `universities_members`**

| university_id | faculty_member_id |
|---|---|
| 100 | 100 |
| 100 | 101 |
| 101 | 101 |
| 101 | 102 |
| 102 | 102 |
| 102 | 103 |
| 103 | 103 |
| 103 | 100 |

**Table `universities_students`**

| university_id | student_id |
|---|---|
| 100 | 1 |
| 100 | 2 |
| 101 | 2 |
| 101 | 3 |
| 102 | 3 |
| 102 | 4 |
| 103 | 4 |
| 103 | 1 |

**Table `members_courses`**

| faculty_member_id | course_id |
|---|---|
| 100 | 1 |
| 100 | 2 |
| 101 | 2 |
| 101 | 3 |
| 102 | 3 |
| 102 | 4 |
| 103 | 4 |
| 103 | 1 |

**Table `members_projects`**

| faculty_member_id | project_id |
|---|---|
| 100 | 1437597 |
| 100 | df5a6648-8fd1-11eb-924d-9cd76263cbd0 |
| 101 | df5a6648-8fd1-11eb-924d-9cd76263cbd0 |
| 101 | 5006462 |
| 102 | 5006462 |
| 102 | 10207143 |
| 103 | 10207143 |
| 103 | 1437597 |

**Table `members_students`**

| faculty_member_id | student_id |
|---|---|
| 100 | 1 |
| 100 | 2 |
| 101 | 2 |
| 101 | 3 |
| 102 | 3 |
| 102 | 4 |
| 103 | 4 |
| 103 | 1 |

**Table `students_courses`**

| student_id | course_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

**Table `courses_programmes`**

| course_id | academic_programme_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

**Table `courses_members`**

| course_id | faculty_member_id |
|---|---|
| 1 | 100 |
| 1 | 101 |
| 2 | 101 |
| 2 | 102 |
| 3 | 102 |
| 3 | 103 |
| 4 | 103 |
| 4 | 100 |

**Table `courses_students`**

| course_id | student_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

**Table `projects_members`**

| project_id | faculty_member_id |
|---|---|
| 1437597 | 100 |
| 1437597 | 101 |
| df5a6648-8fd1-11eb-924d-9cd76263cbd0 | 101 |
| df5a6648-8fd1-11eb-924d-9cd76263cbd0 | 102 |
| 5006462 | 102 |
| 5006462 | 103 |
| 10207143 | 103 |
| 10207143 | 100 |

**Table `projects_students`**

| project_id | student_id |
|---|---|
| 1437597 | 1 |
| 1437597 | 2 |
| df5a6648-8fd1-11eb-924d-9cd76263cbd0 | 2 |
| df5a6648-8fd1-11eb-924d-9cd76263cbd0 | 3 |
| 5006462 | 3 |
| 5006462 | 4 |
| 10207143 | 4 |
| 10207143 | 1 |

**View `v_academic_programme_course_detail`**

```sql
CREATE VIEW v_academic_programme_course_detail AS
SELECT a.id, a.programme_id, a.programme_name, b.course_id AS course_course_id, b.course_code AS course_course_code, b.course_name AS course_course_name
FROM academic_programmes a
  JOIN programmes_courses j ON j.academic_programme_id = a.id
  JOIN courses b ON b.course_id = j.course_id;
```

| id | programme_id | programme_name | course_course_id | course_course_code | course_course_name |
|---|---|---|---|---|---|
| 1 | 1186102 | Extended Standard | 1 | 10238263 | Legacy Protocol D |
| 1 | 1186102 | Extended Standard | 2 | 4463667 | Regional Programme |
| 2 | 168535 | Pilot Framework A | 2 | 4463667 | Regional Programme |
| 2 | 168535 | Pilot Framework A | 3 | 24077793 | Seasonal Standard |
| 3 | 17788643 | Baseline Protocol | 3 | 24077793 | Seasonal Standard |
| 3 | 17788643 | Baseline Protocol | 4 | 1204-0009-L | Integrated Framework A |
| 4 | f852e24c-9bac-11eb-a8a2-19ed5c03f8d3 | Distributed Programme | 4 | 1204-0009-L | Integrated Framework A |
| 4 | f852e24c-9bac-11eb-a8a2-19ed5c03f8d3 | Distributed Programme | 1 | 10238263 | Legacy Protocol D |
