The university ecosystem for student entrepreneurship is a multi-layered domain where institutional infrastructure, human capital, and geographic context intersect to support venture creation. At its core, the model captures six principal entity types—university support systems, student-led business initiatives, student entrepreneurs, mentors, university departments, and geographic jurisdictions—along with seven association tables that resolve many-to-many relationships between them. The resulting relational schema normalizes these entities into base tables with primary keys and foreign-key columns, while a set of fourteen materialized views reconstructs domain facts by joining across the normalized structure. Every entity carries a unique identifier, and every relationship is expressed either as a direct foreign-key column or as a row in a junction table.

## Base Entity Tables

The foundation of the schema consists of six base tables, each representing a distinct entity type in the student-entrepreneurship domain. The table `university_support_systems` stores the institutional programs that provide mentorship, funding, incubation, and workshop services to student ventures. Each row is identified by `university_support_system_id` and carries a `system_id` (a secondary business key), a `system_name`, a `system_type` drawn from the values Mentorship, Funding, Incubation, and Workshop, and temporal columns `start_date` and `end_date` that define the program's active window. The `status` column records whether a system is Active, Inactive, or Planned, while `budget` holds a numeric allocation and `accessibility_score` provides a quality metric. A foreign-key column `department_id` links each system to its sponsoring university department. Representative rows include system 8189503, "Legacy Programme D," a Mentorship-type program with a budget of 35.45 and an accessibility score of 11.20, and system 605963, "Integrated Protocol A," a Workshop program with the highest accessibility score of 23.80.

**Table `university_support_systems`**

| university_support_system_id | system_id | system_name | system_type | start_date | end_date | status | budget | accessibility_score | department_id | created_at |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 8189503 | Legacy Programme D | Mentorship | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | Active | 35.45 | 11.20 | 2087755 | 2025-01-01 00:14:00 |
| 2 | 3717623 | Regional Standard | Funding | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | Inactive | 18.47 | 15.40 | 790483 | 2025-02-06 03:14:00 |
| 3 | 7441161 | Seasonal Framework | Incubation | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | Planned | 26.25 | 19.60 | 505978 | 2025-03-11 06:14:00 |
| 4 | 605963 | Integrated Protocol A | Workshop | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | Active | 17.12 | 23.80 | id_6 | 2025-04-16 09:14:00 |

The table `student_led_business_initiatives` captures the ventures themselves. Its primary key is `id`, and each row carries an `initiative_id` (a secondary identifier), an `initiative_name`, a `status` (Ideation, Planning, Active, or Paused), a `founded_date`, a `sector` (Technology, Retail, Services, or Manufacturing), and operational metrics including `revenue`, `employee_count`, and `success_rating`. Two foreign-key columns anchor the initiative to its creator and its location: `student_entrepreneur_student_id` references the `student_id` in `student_entrepreneurs`, and `geographic_jurisdiction_id` references the `id` in `geographic_jurisdictions`. Row 100, "Baseline Corridor D," is an Ideation-stage Technology venture with 131 employees and a success rating of 9.45; row 103, "Primary Survey A," is a Paused Manufacturing venture with only 9 employees but the highest success rating at 16.80.

**Table `student_led_business_initiatives`**

| id | initiative_id | initiative_name | status | founded_date | sector | revenue | employee_count | success_rating | student_entrepreneur_student_id | geographic_jurisdiction_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 100 | compta | Baseline Corridor D | Ideation | 2024-03-15 | Technology | 18.70 | 131 | 9.45 | 392507 | 1 |
| 101 | f209107c-8fcd-11eb-924d-9cd76263cbd0 | Distributed Series | Planning | 2025-08-26 | Retail | 21.40 | 428 | 11.90 | 25388256 | 2 |
| 102 | 8928495 | Adaptive Assessment | Active | 2022-01-10 | Services | 24.10 | 3 | 14.35 | id_16 | 3 |
| 103 | 392495 | Primary Survey A | Paused | 2023-06-21 | Manufacturing | 26.80 | 9 | 16.80 | gd_taxc_2211 | 4 |

The table `student_entrepreneurs` stores the people behind the ventures. Its primary key is `student_id`, and each row includes `full_name`, `major` (Entrepreneurship, Business Administration, Accountancy, or Other), `enrollment_status` (Active, Graduated, or Withdrawn), `demographic_group` (Freshman, Sophomore, Junior, or Senior), `contact_email`, and `satisfaction_score`. Two foreign-key columns link each entrepreneur to their academic home (`department_id`) and their assigned advisor (`mentor_id`). Student 392507, Theodore Mcgrath, is an Active Entrepreneurship major with a satisfaction score of 4.45; student gd_taxc_2211, Norma Fisher, is an Active Senior in the "Other" major category with a satisfaction score of 11.80.

**Table `student_entrepreneurs`**

| student_id | full_name | major | enrollment_status | demographic_group | contact_email | satisfaction_score | department_id | mentor_id |
|---|---|---|---|---|---|---|---|---|
| 392507 | Theodore Mcgrath | Entrepreneurship | Active | Freshman | Christopher Wilson | 4.45 | 2087755 | 8189495 |
| 25388256 | Account Name | Business Administration | Graduated | Sophomore | Charles Larsen | 6.90 | 790483 | 7731856 |
| id_16 | Saipan International Airport | Accountancy | Withdrawn | Junior | Mary Alvarez | 9.35 | 505978 | 3468 |
| gd_taxc_2211 | Norma Fisher | Other | Active | Senior | April Snyder | 11.80 | id_6 | 4447006 |

The table `mentors` holds the advisors who guide student entrepreneurs. Its primary key is `mentor_id`, and each row carries `full_name`, `expertise_area` (Business Planning, Marketing, Finance, or Legal), `years_of_experience` (ranging from 7 to 16), `affiliation` (Alumni, Industry Professional, Faculty, or External Expert), `rating`, `availability_status` (Available, Busy, or Unavailable), `contact_info`, and a `department_id` foreign key. Mentor 8189495, Theodore Mcgrath, has 7 years of experience in Business Planning and is an Alumni affiliate; mentor 4447006, Norma Fisher, has 16 years of Legal expertise and is an External Expert.

**Table `mentors`**

| mentor_id | full_name | expertise_area | years_of_experience | affiliation | rating | availability_status | contact_info | department_id | created_at |
|---|---|---|---|---|---|---|---|---|---|
| 8189495 | Theodore Mcgrath | Business Planning | 7 | Alumni | 22.45 | Available | Jorge Luis Borges | 2087755 | 2025-01-01 00:14:00 |
| 7731856 | Account Name | Marketing | 10 | Industry Professional | 25.90 | Busy | Focus Device | 790483 | 2025-02-06 03:14:00 |
| 3468 | Saipan International Airport | Finance | 13 | Faculty | 29.35 | Unavailable | Thomas Rivers | 505978 | 2025-03-11 06:14:00 |
| 4447006 | Norma Fisher | Legal | 16 | External Expert | 32.80 | Available | Kimberly Myers | id_6 | 2025-04-16 09:14:00 |

The table `university_departments` represents the academic units that sponsor systems, employ mentors, and house entrepreneurs. Its primary key is `department_id`, and each row includes `department_name`, `department_code`, `head_of_department`, `location`, `established_date`, `operational_status` (Active, Inactive, or Reorganized), `budget_allocation`, and a `mentor_id` column that references the head mentor. Department 2087755, the "College of Business Administration and Accountancy," is located in San Bartolome, Novaliches, has an operational budget of 446.22, and is Active. Department id_6, sharing the same name, has a much larger budget of 1,737 and is also Active.

**Table `university_departments`**

| department_id | department_name | department_code | head_of_department | location | established_date | operational_status | budget_allocation | mentor_id |
|---|---|---|---|---|---|---|---|---|
| 2087755 | College of Business Administration and Accountancy | 605962 | composite-head-57 | San Bartolome, Novaliches | 2024-03-27 | Active | 446.22 | 8189495 |
| 790483 | College of Engineering | 10449510 | primary-head-58 | Main Campus | 2025-08-11 | Inactive | 763.46 | 7731856 |
| 505978 | College of Arts and Sciences | 2002007020080 | adaptive-head-59 | Satellite Campus | 2022-01-22 | Reorganized | 12.34 | 3468 |
| id_6 | College of Business Administration and Accountancy | drafting-skills | distributed-head-60 | San Bartolome, Novaliches | 2023-06-06 | Active | 1,737 | 4447006 |

The table `geographic_jurisdictions` captures the external regulatory and economic context in which student ventures operate. Its primary key is `id`, and each row carries a `jurisdiction_id`, `jurisdiction_name`, `jurisdiction_type` (City, Province, Country, or Region), `population`, `gdp`, `entrepreneurship_index`, `government_policies`, and `last_updated`. Jurisdiction 1, Quezon City, is a City with a population of 42 and an entrepreneurship index of 2.20; jurisdiction 3, the Philippines, is a Country with a GDP of 31.60 and a National Entrepreneurship Act as its governing policy.

**Table `geographic_jurisdictions`**

| id | jurisdiction_id | jurisdiction_name | jurisdiction_type | population | gdp | entrepreneurship_index | government_policies | last_updated |
|---|---|---|---|---|---|---|---|---|
| 1 | 8387534 | Quezon City | City | 42 | 23.20 | 2.20 | Philippine Development Plan | 2023-06-17T17:27:00 |
| 2 | 99654 | Metro Manila | Province | 49 | 27.40 | 4.40 | Local Business Code | 2024-11-01T00:44:00 |
| 3 | lu_tax_code_template_m_I_4 | Philippines | Country | 56 | 31.60 | 6.60 | National Entrepreneurship Act | 2025-04-12T07:01:00 |
| 4 | 1186090 | Quezon City | Region | 63 | 35.80 | 8.80 | Philippine Development Plan | 2022-09-23T14:18:00 |

## Junction Tables and Many-to-Many Relationships

Six of the seven junction tables resolve relationships that cannot be expressed as a single foreign-key column because the cardinality on both sides exceeds one. The table `systems_initiatives` links university support systems to the student-led business initiatives they serve, enabling a single program to support multiple ventures and a single venture to draw from multiple programs. Its counterpart, `initiatives_systems`, stores the same relationship from the initiative's perspective, ensuring referential integrity in both directions.

The table `entrepreneurs_initiatives` connects student entrepreneurs to their ventures, supporting the case where an entrepreneur may found or lead multiple initiatives. The table `mentors_entrepreneurs` resolves the advisor-mentee relationship, allowing a mentor to guide multiple students and a student to receive guidance from multiple mentors.

Two additional junction tables link departments to the other entity types. The table `departments_systems` associates university departments with the support systems they sponsor, while `departments_entrepreneurs` links departments to the student entrepreneurs they enroll. The final junction table, `jurisdictions_initiatives`, connects geographic jurisdictions to the student-led business initiatives that operate within their boundaries, enabling a jurisdiction to encompass multiple ventures and a venture to span multiple jurisdictions.

**Table `systems_initiatives`**

| university_support_system_id | student_led_business_initiative_id |
|---|---|
| 1 | 100 |
| 1 | 101 |
| 2 | 101 |
| 2 | 102 |
| 3 | 102 |
| 3 | 103 |
| 4 | 103 |
| 4 | 100 |

**Table `initiatives_systems`**

| student_led_business_initiative_id | university_support_system_id |
|---|---|
| 100 | 1 |
| 100 | 2 |
| 101 | 2 |
| 101 | 3 |
| 102 | 3 |
| 102 | 4 |
| 103 | 4 |
| 103 | 1 |

**Table `entrepreneurs_initiatives`**

| student_entrepreneur_student_id | student_led_business_initiative_id |
|---|---|
| 392507 | 100 |
| 392507 | 101 |
| 25388256 | 101 |
| 25388256 | 102 |
| id_16 | 102 |
| id_16 | 103 |
| gd_taxc_2211 | 103 |
| gd_taxc_2211 | 100 |

**Table `mentors_entrepreneurs`**

| mentor_id | student_entrepreneur_student_id |
|---|---|
| 8189495 | 392507 |
| 8189495 | 25388256 |
| 7731856 | 25388256 |
| 7731856 | id_16 |
| 3468 | id_16 |
| 3468 | gd_taxc_2211 |
| 4447006 | gd_taxc_2211 |
| 4447006 | 392507 |

**Table `departments_systems`**

| department_id | university_support_system_id |
|---|---|
| 2087755 | 1 |
| 2087755 | 2 |
| 790483 | 2 |
| 790483 | 3 |
| 505978 | 3 |
| 505978 | 4 |
| id_6 | 4 |
| id_6 | 1 |

**Table `departments_entrepreneurs`**

| department_id | student_entrepreneur_student_id |
|---|---|
| 2087755 | 392507 |
| 2087755 | 25388256 |
| 790483 | 25388256 |
| 790483 | id_16 |
| 505978 | id_16 |
| 505978 | gd_taxc_2211 |
| id_6 | gd_taxc_2211 |
| id_6 | 392507 |

**Table `jurisdictions_initiatives`**

| geographic_jurisdiction_id | student_led_business_initiative_id |
|---|---|
| 1 | 100 |
| 1 | 101 |
| 2 | 101 |
| 2 | 102 |
| 3 | 102 |
| 3 | 103 |
| 4 | 103 |
| 4 | 100 |

## Materialized Views: Reconstructing Domain Facts

The fourteen views in the schema are denormalized joins that answer specific analytical questions by pulling together data from the base tables and junction tables. Each view is named to indicate its primary entity and the related entity it enriches with detail.

The view `university_support_system_student_led_business_initiative_detail_view` joins `university_support_systems` to `student_led_business_initiatives` through the junction tables `systems_initiatives` and `initiatives_systems`, producing a row for every system-initiative pairing. This view answers the question: "Which student ventures does each university support program serve?" A row in this view would show system 8189503 ("Legacy Programme D") linked to initiative 100 ("Baseline Corridor D"), revealing that a Mentorship-type program with a budget of 35.45 supports a Technology venture with 131 employees.

**View `university_support_system_student_led_business_initiative_detail_view`**

```sql
CREATE VIEW university_support_system_student_led_business_initiative_detail_view AS
SELECT a.university_support_system_id, a.system_id, a.system_name, b.id AS initiative_id, b.initiative_id AS initiative_initiative_id, b.initiative_name AS initiative_initiative_name
FROM university_support_systems a
  JOIN systems_initiatives j ON j.university_support_system_id = a.university_support_system_id
  JOIN student_led_business_initiatives b ON b.id = j.student_led_business_initiative_id;
```

| university_support_system_id | system_id | system_name | initiative_id | initiative_initiative_id | initiative_initiative_name |
|---|---|---|---|---|---|
| 1 | 8189503 | Legacy Programme D | 100 | compta | Baseline Corridor D |
| 1 | 8189503 | Legacy Programme D | 101 | f209107c-8fcd-11eb-924d-9cd76263cbd0 | Distributed Series |
| 2 | 3717623 | Regional Standard | 101 | f209107c-8fcd-11eb-924d-9cd76263cbd0 | Distributed Series |
| 2 | 3717623 | Regional Standard | 102 | 8928495 | Adaptive Assessment |
| 3 | 7441161 | Seasonal Framework | 102 | 8928495 | Adaptive Assessment |
| 3 | 7441161 | Seasonal Framework | 103 | 392495 | Primary Survey A |
| 4 | 605963 | Integrated Protocol A | 103 | 392495 | Primary Survey A |
| 4 | 605963 | Integrated Protocol A | 100 | compta | Baseline Corridor D |

The view `university_support_system_university_department_view` joins `university_support_systems` to `university_departments` on the `department_id` foreign key, answering: "Which department sponsors each support system?" A row would pair system 7441161 ("Seasonal Framework," an Incubation program) with department 505978 ("College of Arts and Sciences"), showing that the Reorganized department with a budget of 12.34 sponsors this Planned program.

**View `university_support_system_university_department_view`**

```sql
CREATE VIEW university_support_system_university_department_view AS
SELECT a.university_support_system_id, a.system_id, a.system_name, a.system_type, b.department_id AS department_department_id, b.department_name AS department_department_name, b.department_code AS department_department_code
FROM university_support_systems a JOIN university_departments b ON a.department_id = b.department_id;
```

| university_support_system_id | system_id | system_name | system_type | department_department_id | department_department_name | department_department_code |
|---|---|---|---|---|---|---|
| 1 | 8189503 | Legacy Programme D | Mentorship | 2087755 | College of Business Administration and Accountancy | 605962 |
| 2 | 3717623 | Regional Standard | Funding | 790483 | College of Engineering | 10449510 |
| 3 | 7441161 | Seasonal Framework | Incubation | 505978 | College of Arts and Sciences | 2002007020080 |
| 4 | 605963 | Integrated Protocol A | Workshop | id_6 | College of Business Administration and Accountancy | drafting-skills |

The view `student_led_business_initiative_university_support_system_detail_view` is the inverse of the first view, joining from initiatives to systems. It answers: "Which support programs back each student venture?" A row would show initiative 102 ("Adaptive Assessment," an Active Services venture) linked to system 605963 ("Integrated Protocol A," a Workshop program), revealing that the venture with 3 employees and a success rating of 14.35 draws from the program with the highest accessibility score of 23.80.

**View `student_led_business_initiative_university_support_system_detail_view`**

```sql
CREATE VIEW student_led_business_initiative_university_support_system_detail_view AS
SELECT a.id, a.initiative_id, a.initiative_name, b.university_support_system_id AS system_university_support_system_id, b.system_id AS system_system_id, b.system_name AS system_system_name
FROM student_led_business_initiatives a
  JOIN initiatives_systems j ON j.student_led_business_initiative_id = a.id
  JOIN university_support_systems b ON b.university_support_system_id = j.university_support_system_id;
```

| id | initiative_id | initiative_name | system_university_support_system_id | system_system_id | system_system_name |
|---|---|---|---|---|---|
| 100 | compta | Baseline Corridor D | 1 | 8189503 | Legacy Programme D |
| 100 | compta | Baseline Corridor D | 2 | 3717623 | Regional Standard |
| 101 | f209107c-8fcd-11eb-924d-9cd76263cbd0 | Distributed Series | 2 | 3717623 | Regional Standard |
| 101 | f209107c-8fcd-11eb-924d-9cd76263cbd0 | Distributed Series | 3 | 7441161 | Seasonal Framework |
| 102 | 8928495 | Adaptive Assessment | 3 | 7441161 | Seasonal Framework |
| 102 | 8928495 | Adaptive Assessment | 4 | 605963 | Integrated Protocol A |
| 103 | 392495 | Primary Survey A | 4 | 605963 | Integrated Protocol A |
| 103 | 392495 | Primary Survey A | 1 | 8189503 | Legacy Programme D |

The view `student_led_business_initiative_student_entrepreneur_view` joins `student_led_business_initiatives` to `student_entrepreneurs` on the `student_entrepreneur_student_id` foreign key, answering: "Which entrepreneur founded each initiative?" A row would pair initiative 101 ("Distributed Series," a Planning-stage Retail venture with 428 employees) with student 25388256 ("Account Name," a Graduated Business Administration major), showing the human actor behind the venture.

**View `student_led_business_initiative_student_entrepreneur_view`**

```sql
CREATE VIEW student_led_business_initiative_student_entrepreneur_view AS
SELECT a.id, a.initiative_id, a.initiative_name, a.status, b.student_id AS entrepreneur_student_id, b.full_name AS entrepreneur_full_name, b.major AS entrepreneur_major
FROM student_led_business_initiatives a JOIN student_entrepreneurs b ON a.student_entrepreneur_student_id = b.student_id;
```

| id | initiative_id | initiative_name | status | entrepreneur_student_id | entrepreneur_full_name | entrepreneur_major |
|---|---|---|---|---|---|---|
| 100 | compta | Baseline Corridor D | Ideation | 392507 | Theodore Mcgrath | Entrepreneurship |
| 101 | f209107c-8fcd-11eb-924d-9cd76263cbd0 | Distributed Series | Planning | 25388256 | Account Name | Business Administration |
| 102 | 8928495 | Adaptive Assessment | Active | id_16 | Saipan International Airport | Accountancy |
| 103 | 392495 | Primary Survey A | Paused | gd_taxc_2211 | Norma Fisher | Other |

The view `student_led_business_initiative_geographic_jurisdiction_view` joins initiatives to jurisdictions on `geographic_jurisdiction_id`, answering: "In which jurisdiction does each venture operate?" A row would show initiative 103 ("Primary Survey A," a Paused Manufacturing venture) linked to jurisdiction 4 ("Quezon City," a Region with an entrepreneurship index of 8.80), placing the venture within its regulatory and economic context.

**View `student_led_business_initiative_geographic_jurisdiction_view`**

```sql
CREATE VIEW student_led_business_initiative_geographic_jurisdiction_view AS
SELECT a.id, a.initiative_id, a.initiative_name, a.status, b.id AS jurisdiction_id, b.jurisdiction_id AS jurisdiction_jurisdiction_id, b.jurisdiction_name AS jurisdiction_jurisdiction_name
FROM student_led_business_initiatives a JOIN geographic_jurisdictions b ON a.geographic_jurisdiction_id = b.id;
```

| id | initiative_id | initiative_name | status | jurisdiction_id | jurisdiction_jurisdiction_id | jurisdiction_jurisdiction_name |
|---|---|---|---|---|---|---|
| 100 | compta | Baseline Corridor D | Ideation | 1 | 8387534 | Quezon City |
| 101 | f209107c-8fcd-11eb-924d-9cd76263cbd0 | Distributed Series | Planning | 2 | 99654 | Metro Manila |
| 102 | 8928495 | Adaptive Assessment | Active | 3 | lu_tax_code_template_m_I_4 | Philippines |
| 103 | 392495 | Primary Survey A | Paused | 4 | 1186090 | Quezon City |

The view `student_entrepreneur_student_led_business_initiative_detail_view` is the inverse of the entrepreneur-initiative join, answering: "Which ventures is each entrepreneur associated with?" A row would show student 392507 (Theodore Mcgrath, an Active Entrepreneurship major) linked to initiative 100 ("Baseline Corridor D"), connecting the person to their venture.

**View `student_entrepreneur_student_led_business_initiative_detail_view`**

```sql
CREATE VIEW student_entrepreneur_student_led_business_initiative_detail_view AS
SELECT a.student_id, a.full_name, a.major, b.id AS initiative_id, b.initiative_id AS initiative_initiative_id, b.initiative_name AS initiative_initiative_name
FROM student_entrepreneurs a
  JOIN entrepreneurs_initiatives j ON j.student_entrepreneur_student_id = a.student_id
  JOIN student_led_business_initiatives b ON b.id = j.student_led_business_initiative_id;
```

| student_id | full_name | major | initiative_id | initiative_initiative_id | initiative_initiative_name |
|---|---|---|---|---|---|
| 392507 | Theodore Mcgrath | Entrepreneurship | 100 | compta | Baseline Corridor D |
| 392507 | Theodore Mcgrath | Entrepreneurship | 101 | f209107c-8fcd-11eb-924d-9cd76263cbd0 | Distributed Series |
| 25388256 | Account Name | Business Administration | 101 | f209107c-8fcd-11eb-924d-9cd76263cbd0 | Distributed Series |
| 25388256 | Account Name | Business Administration | 102 | 8928495 | Adaptive Assessment |
| id_16 | Saipan International Airport | Accountancy | 102 | 8928495 | Adaptive Assessment |
| id_16 | Saipan International Airport | Accountancy | 103 | 392495 | Primary Survey A |
| gd_taxc_2211 | Norma Fisher | Other | 103 | 392495 | Primary Survey A |
| gd_taxc_2211 | Norma Fisher | Other | 100 | compta | Baseline Corridor D |

The view `student_entrepreneur_university_department_view` joins entrepreneurs to departments on `department_id`, answering: "Which academic department does each entrepreneur belong to?" A row would pair student id_16 ("Saipan International Airport," a Withdrawn Junior in Accountancy) with department 505978 ("College of Arts and Sciences"), showing the academic home of the student.

**View `student_entrepreneur_university_department_view`**

```sql
CREATE VIEW student_entrepreneur_university_department_view AS
SELECT a.student_id, a.full_name, a.major, a.enrollment_status, b.department_id AS department_department_id, b.department_name AS department_department_name, b.department_code AS department_department_code
FROM student_entrepreneurs a JOIN university_departments b ON a.department_id = b.department_id;
```

| student_id | full_name | major | enrollment_status | department_department_id | department_department_name | department_department_code |
|---|---|---|---|---|---|---|
| 392507 | Theodore Mcgrath | Entrepreneurship | Active | 2087755 | College of Business Administration and Accountancy | 605962 |
| 25388256 | Account Name | Business Administration | Graduated | 790483 | College of Engineering | 10449510 |
| id_16 | Saipan International Airport | Accountancy | Withdrawn | 505978 | College of Arts and Sciences | 2002007020080 |
| gd_taxc_2211 | Norma Fisher | Other | Active | id_6 | College of Business Administration and Accountancy | drafting-skills |

The view `student_entrepreneur_mentor_view` joins entrepreneurs to mentors on `mentor_id`, answering: "Which mentor advises each student?" A row would show student gd_taxc_2211 (Norma Fisher, an Active Senior) linked to mentor 4447006 (Norma Fisher, an External Expert with 16 years of Legal experience), revealing the advisor relationship.

**View `student_entrepreneur_mentor_view`**

```sql
CREATE VIEW student_entrepreneur_mentor_view AS
SELECT a.student_id, a.full_name, a.major, a.enrollment_status, b.mentor_id AS mentor_mentor_id, b.full_name AS mentor_full_name, b.expertise_area AS mentor_expertise_area
FROM student_entrepreneurs a JOIN mentors b ON a.mentor_id = b.mentor_id;
```

| student_id | full_name | major | enrollment_status | mentor_mentor_id | mentor_full_name | mentor_expertise_area |
|---|---|---|---|---|---|---|
| 392507 | Theodore Mcgrath | Entrepreneurship | Active | 8189495 | Theodore Mcgrath | Business Planning |
| 25388256 | Account Name | Business Administration | Graduated | 7731856 | Account Name | Marketing |
| id_16 | Saipan International Airport | Accountancy | Withdrawn | 3468 | Saipan International Airport | Finance |
| gd_taxc_2211 | Norma Fisher | Other | Active | 4447006 | Norma Fisher | Legal |

The view `mentor_student_entrepreneur_detail_view` is the inverse, joining from mentors to entrepreneurs and answering: "Which students does each mentor advise?" A row would show mentor 8189495 (Theodore Mcgrath, a Business Planning expert with 7 years of experience and Alumni affiliation) linked to student 392507 (Theodore Mcgrath, an Active Entrepreneurship major), connecting the advisor to their mentee.

**View `mentor_student_entrepreneur_detail_view`**

```sql
CREATE VIEW mentor_student_entrepreneur_detail_view AS
SELECT a.mentor_id, a.full_name, a.expertise_area, b.student_id AS entrepreneur_student_id, b.full_name AS entrepreneur_full_name, b.major AS entrepreneur_major
FROM mentors a
  JOIN mentors_entrepreneurs j ON j.mentor_id = a.mentor_id
  JOIN student_entrepreneurs b ON b.student_id = j.student_entrepreneur_student_id;
```

| mentor_id | full_name | expertise_area | entrepreneur_student_id | entrepreneur_full_name | entrepreneur_major |
|---|---|---|---|---|---|
| 8189495 | Theodore Mcgrath | Business Planning | 392507 | Theodore Mcgrath | Entrepreneurship |
| 8189495 | Theodore Mcgrath | Business Planning | 25388256 | Account Name | Business Administration |
| 7731856 | Account Name | Marketing | 25388256 | Account Name | Business Administration |
| 7731856 | Account Name | Marketing | id_16 | Saipan International Airport | Accountancy |
| 3468 | Saipan International Airport | Finance | id_16 | Saipan International Airport | Accountancy |
| 3468 | Saipan International Airport | Finance | gd_taxc_2211 | Norma Fisher | Other |
| 4447006 | Norma Fisher | Legal | gd_taxc_2211 | Norma Fisher | Other |
| 4447006 | Norma Fisher | Legal | 392507 | Theodore Mcgrath | Entrepreneurship |

The view `mentor_university_department_view` joins mentors to departments on `department_id`, answering: "Which department employs each mentor?" A row would pair mentor 7731856 ("Account Name," a Marketing expert with 10 years of experience and Industry Professional affiliation) with department 790483 ("College of Engineering"), showing the institutional home of the advisor.

**View `mentor_university_department_view`**

```sql
CREATE VIEW mentor_university_department_view AS
SELECT a.mentor_id, a.full_name, a.expertise_area, a.years_of_experience, b.department_id AS department_department_id, b.department_name AS department_department_name, b.department_code AS department_department_code
FROM mentors a JOIN university_departments b ON a.department_id = b.department_id;
```

| mentor_id | full_name | expertise_area | years_of_experience | department_department_id | department_department_name | department_department_code |
|---|---|---|---|---|---|---|
| 8189495 | Theodore Mcgrath | Business Planning | 7 | 2087755 | College of Business Administration and Accountancy | 605962 |
| 7731856 | Account Name | Marketing | 10 | 790483 | College of Engineering | 10449510 |
| 3468 | Saipan International Airport | Finance | 13 | 505978 | College of Arts and Sciences | 2002007020080 |
| 4447006 | Norma Fisher | Legal | 16 | id_6 | College of Business Administration and Accountancy | drafting-skills |

The view `university_department_university_support_system_detail_view` joins departments to systems on `department_id`, answering: "Which support systems does each department sponsor?" A row would show department 2087755 ("College of Business Administration and Accountancy," Active with a budget of 446.22) linked to system 8189503 ("Legacy Programme D," a Mentorship program), revealing the department's programmatic output.

**View `university_department_university_support_system_detail_view`**

```sql
CREATE VIEW university_department_university_support_system_detail_view AS
SELECT a.department_id, a.department_name, a.department_code, b.university_support_system_id AS system_university_support_system_id, b.system_id AS system_system_id, b.system_name AS system_system_name
FROM university_departments a
  JOIN departments_systems j ON j.department_id = a.department_id
  JOIN university_support_systems b ON b.university_support_system_id = j.university_support_system_id;
```

| department_id | department_name | department_code | system_university_support_system_id | system_system_id | system_system_name |
|---|---|---|---|---|---|
| 2087755 | College of Business Administration and Accountancy | 605962 | 1 | 8189503 | Legacy Programme D |
| 2087755 | College of Business Administration and Accountancy | 605962 | 2 | 3717623 | Regional Standard |
| 790483 | College of Engineering | 10449510 | 2 | 3717623 | Regional Standard |
| 790483 | College of Engineering | 10449510 | 3 | 7441161 | Seasonal Framework |
| 505978 | College of Arts and Sciences | 2002007020080 | 3 | 7441161 | Seasonal Framework |
| 505978 | College of Arts and Sciences | 2002007020080 | 4 | 605963 | Integrated Protocol A |
| id_6 | College of Business Administration and Accountancy | drafting-skills | 4 | 605963 | Integrated Protocol A |
| id_6 | College of Business Administration and Accountancy | drafting-skills | 1 | 8189503 | Legacy Programme D |

The view `university_department_mentor_view` joins departments to mentors on `department_id`, answering: "Which mentors are affiliated with each department?" A row would pair department id_6 ("College of Business Administration and Accountancy," Active with a budget of 1,737) with mentor 4447006 (Norma Fisher, an External Expert in Legal), showing the department's advisory resources.

**View `university_department_mentor_view`**

```sql
CREATE VIEW university_department_mentor_view AS
SELECT a.department_id, a.department_name, a.department_code, a.head_of_department, b.mentor_id AS mentor_mentor_id, b.full_name AS mentor_full_name, b.expertise_area AS mentor_expertise_area
FROM university_departments a JOIN mentors b ON a.mentor_id = b.mentor_id;
```

| department_id | department_name | department_code | head_of_department | mentor_mentor_id | mentor_full_name | mentor_expertise_area |
|---|---|---|---|---|---|---|
| 2087755 | College of Business Administration and Accountancy | 605962 | composite-head-57 | 8189495 | Theodore Mcgrath | Business Planning |
| 790483 | College of Engineering | 10449510 | primary-head-58 | 7731856 | Account Name | Marketing |
| 505978 | College of Arts and Sciences | 2002007020080 | adaptive-head-59 | 3468 | Saipan International Airport | Finance |
| id_6 | College of Business Administration and Accountancy | drafting-skills | distributed-head-60 | 4447006 | Norma Fisher | Legal |

The view `university_department_student_entrepreneur_detail_view` joins departments to entrepreneurs on `department_id`, answering: "Which students does each department enroll?" A row would show department 790483 ("College of Engineering," Inactive with a budget of 763.46) linked to student 25388256 ("Account Name," a Graduated Business Administration major), revealing the department's student body.

**View `university_department_student_entrepreneur_detail_view`**

```sql
CREATE VIEW university_department_student_entrepreneur_detail_view AS
SELECT a.department_id, a.department_name, a.department_code, b.student_id AS entrepreneur_student_id, b.full_name AS entrepreneur_full_name, b.major AS entrepreneur_major
FROM university_departments a
  JOIN departments_entrepreneurs j ON j.department_id = a.department_id
  JOIN student_entrepreneurs b ON b.student_id = j.student_entrepreneur_student_id;
```

| department_id | department_name | department_code | entrepreneur_student_id | entrepreneur_full_name | entrepreneur_major |
|---|---|---|---|---|---|
| 2087755 | College of Business Administration and Accountancy | 605962 | 392507 | Theodore Mcgrath | Entrepreneurship |
| 2087755 | College of Business Administration and Accountancy | 605962 | 25388256 | Account Name | Business Administration |
| 790483 | College of Engineering | 10449510 | 25388256 | Account Name | Business Administration |
| 790483 | College of Engineering | 10449510 | id_16 | Saipan International Airport | Accountancy |
| 505978 | College of Arts and Sciences | 2002007020080 | id_16 | Saipan International Airport | Accountancy |
| 505978 | College of Arts and Sciences | 2002007020080 | gd_taxc_2211 | Norma Fisher | Other |
| id_6 | College of Business Administration and Accountancy | drafting-skills | gd_taxc_2211 | Norma Fisher | Other |
| id_6 | College of Business Administration and Accountancy | drafting-skills | 392507 | Theodore Mcgrath | Entrepreneurship |

The view `geographic_jurisdiction_student_led_business_initiative_detail_view` joins jurisdictions to initiatives on `geographic_jurisdiction_id`, answering: "Which ventures operate within each jurisdiction?" A row would show jurisdiction 1 ("Quezon City," a City with population 42 and an entrepreneurship index of 2.20) linked to initiative 100 ("Baseline Corridor D," an Ideation-stage Technology venture), placing the venture within its geographic and regulatory context.

**View `geographic_jurisdiction_student_led_business_initiative_detail_view`**

```sql
CREATE VIEW geographic_jurisdiction_student_led_business_initiative_detail_view AS
SELECT a.id, a.jurisdiction_id, a.jurisdiction_name, b.id AS initiative_id, b.initiative_id AS initiative_initiative_id, b.initiative_name AS initiative_initiative_name
FROM geographic_jurisdictions a
  JOIN jurisdictions_initiatives j ON j.geographic_jurisdiction_id = a.id
  JOIN student_led_business_initiatives b ON b.id = j.student_led_business_initiative_id;
```

| id | jurisdiction_id | jurisdiction_name | initiative_id | initiative_initiative_id | initiative_initiative_name |
|---|---|---|---|---|---|
| 1 | 8387534 | Quezon City | 100 | compta | Baseline Corridor D |
| 1 | 8387534 | Quezon City | 101 | f209107c-8fcd-11eb-924d-9cd76263cbd0 | Distributed Series |
| 2 | 99654 | Metro Manila | 101 | f209107c-8fcd-11eb-924d-9cd76263cbd0 | Distributed Series |
| 2 | 99654 | Metro Manila | 102 | 8928495 | Adaptive Assessment |
| 3 | lu_tax_code_template_m_I_4 | Philippines | 102 | 8928495 | Adaptive Assessment |
| 3 | lu_tax_code_template_m_I_4 | Philippines | 103 | 392495 | Primary Survey A |
| 4 | 1186090 | Quezon City | 103 | 392495 | Primary Survey A |
| 4 | 1186090 | Quezon City | 100 | compta | Baseline Corridor D |

## Synthesis

The schema models the student-entrepreneurship ecosystem as a network of six entity types connected through direct foreign-key relationships and seven many-to-many junction tables. The base tables normalize each entity to its atomic attributes, with primary keys providing unique identification and foreign-key columns encoding one-to-many associations such as department-to-system, department-to-entrepreneur, and department-to-mentor. The junction tables—`systems_initiatives`, `initiatives_systems`, `entrepreneurs_initiatives`, `mentors_entrepreneurs`, `departments_systems`, `departments_entrepreneurs`, and `jurisdictions_initiatives`—resolve the remaining relationships where cardinality exceeds one on both sides, ensuring that the model can represent a single program supporting multiple ventures, a single venture drawing from multiple programs, a single mentor advising multiple students, and a single jurisdiction encompassing multiple ventures.

The fourteen materialized views reconstruct domain facts by joining across this normalized structure, each view answering a specific analytical question by presenting a primary entity alongside the details of its related entity. Together, the base tables and views provide a complete relational representation of the domain: the tables store the canonical data, and the views present it in the forms most useful for reporting and analysis. The model is internally consistent, with no logical clashes between the entity definitions and their relationships, and it faithfully captures the structure of a university ecosystem where institutional programs, academic departments, human advisors, student ventures, and geographic contexts all interact to foster entrepreneurship.