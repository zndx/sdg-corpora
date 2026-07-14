## The University Entrepreneurship Ecosystem

Student entrepreneurship within higher education operates as a multi-layered support network, connecting academic departments, external mentors, structured programs, and the students themselves across geographic and institutional boundaries. The records maintained by university administration capture not only the existence of these entities but the precise operational relationships that bind them: which support system funds which initiative, which department houses which mentor, and how geographic jurisdictions influence the viability of student-led ventures. Understanding this ecosystem requires examining each component in isolation before tracing the joins that reveal the full picture of institutional support.

At the foundation of the ecosystem are the university support systems themselves—structured programs designed to nurture student entrepreneurship through mentorship, funding, incubation, or workshops. These systems operate on defined schedules with measurable budgets and accessibility metrics.

**Table `university_support_systems`**

| university_support_system_id | system_id | system_name | system_type | start_date | end_date | status | budget | accessibility_score | department_id | created_at |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 8189503 | Legacy Programme D | Mentorship | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | Active | 35.45 | 11.20 | 2087755 | 2025-01-01 00:14:00 |
| 2 | 3717623 | Regional Standard | Funding | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | Inactive | 18.47 | 15.40 | 790483 | 2025-02-06 03:14:00 |
| 3 | 7441161 | Seasonal Framework | Incubation | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | Planned | 26.25 | 19.60 | 505978 | 2025-03-11 06:14:00 |
| 4 | 605963 | Integrated Protocol A | Workshop | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | Active | 17.12 | 23.80 | id_6 | 2025-04-16 09:14:00 |

The Legacy Programme D (system_id 8189503) represents a mentorship-based initiative with a budget of 35.45 and an accessibility score of 11.20, currently active despite its end date predating its start date—a data pattern suggesting retrospective enrollment or system migration. The Regional Standard (system_id 3717623) operates as a funding mechanism with a lower budget of 18.47 and higher accessibility at 15.40, yet carries an Inactive status. Seasonal Framework (system_id 7441161) is a planned incubation program with the highest accessibility score of 19.60 and a budget of 26.25. The Integrated Protocol A (system_id 605963) is a workshop-based system with the highest accessibility score at 23.80 and the smallest budget of 17.12. Each system is anchored to a university department, whether identified by numeric codes like 2087755 and 790483 or by string identifiers such as id_6.

Student-led business initiatives represent the practical output of this ecosystem—the actual ventures that students launch and operate. These initiatives span diverse sectors and exhibit varying stages of development.

**Table `student_led_business_initiatives`**

| id | initiative_id | initiative_name | status | founded_date | sector | revenue | employee_count | success_rating | student_entrepreneur_student_id | geographic_jurisdiction_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 100 | compta | Baseline Corridor D | Ideation | 2024-03-15 | Technology | 18.70 | 131 | 9.45 | 392507 | 1 |
| 101 | f209107c-8fcd-11eb-924d-9cd76263cbd0 | Distributed Series | Planning | 2025-08-26 | Retail | 21.40 | 428 | 11.90 | 25388256 | 2 |
| 102 | 8928495 | Adaptive Assessment | Active | 2022-01-10 | Services | 24.10 | 3 | 14.35 | id_16 | 3 |
| 103 | 392495 | Primary Survey A | Paused | 2023-06-21 | Manufacturing | 26.80 | 9 | 16.80 | gd_taxc_2211 | 4 |

The Baseline Corridor D (initiative_id compta) operates in the Technology sector with 131 employees and generates revenue of 18.70, currently in the Ideation phase with a success rating of 9.45. The Distributed Series (initiative_id f209107c-8fcd-11eb-924d-9cd76263cbd0) is a Retail venture with 428 employees and revenue of 21.40, still in the Planning stage but showing a strong success rating of 11.90. The Adaptive Assessment (initiative_id 8928495) is an Active Services venture with only 3 employees and revenue of 24.10, achieving a success rating of 14.35. The Primary Survey A (initiative_id 392495) is a Manufacturing venture in Paused status with 9 employees, revenue of 26.80, and the highest success rating of 16.80. Each initiative is tied to a specific student entrepreneur and a geographic jurisdiction, creating a spatial dimension to the ecosystem.

The student entrepreneurs are the human core of this network—individuals enrolled in academic programs who simultaneously pursue business ventures.

**Table `student_entrepreneurs`**

| student_id | full_name | major | enrollment_status | demographic_group | contact_email | satisfaction_score | department_id | mentor_id |
|---|---|---|---|---|---|---|---|---|
| 392507 | Theodore Mcgrath | Entrepreneurship | Active | Freshman | Christopher Wilson | 4.45 | 2087755 | 8189495 |
| 25388256 | Account Name | Business Administration | Graduated | Sophomore | Charles Larsen | 6.90 | 790483 | 7731856 |
| id_16 | Saipan International Airport | Accountancy | Withdrawn | Junior | Mary Alvarez | 9.35 | 505978 | 3468 |
| gd_taxc_2211 | Norma Fisher | Other | Active | Senior | April Snyder | 11.80 | id_6 | 4447006 |

Theodore Mcgrath (student_id 392507), majoring in Entrepreneurship with Active enrollment status and classified as a Freshman, carries a satisfaction score of 4.45 and is affiliated with department 2087755 under mentor 8189495. Account Name (student_id 25388256), a Graduated Business Administration student classified as a Sophomore, shows a satisfaction score of 6.90 within department 790483 and is mentored by 7731856. Saipan International Airport (student_id id_16), an Accountancy major with Withdrawn status classified as a Junior, has the highest satisfaction score of 9.35 and belongs to department 505978 under mentor 3468. Norma Fisher (student_id gd_taxc_2211), studying Other with Active enrollment and Senior classification, records a satisfaction score of 11.80 in department id_6 with mentor 4447006.

Mentors provide the expert guidance that bridges academic theory and practical business execution.

**Table `mentors`**

| mentor_id | full_name | expertise_area | years_of_experience | affiliation | rating | availability_status | contact_info | department_id | created_at |
|---|---|---|---|---|---|---|---|---|---|
| 8189495 | Theodore Mcgrath | Business Planning | 7 | Alumni | 22.45 | Available | Jorge Luis Borges | 2087755 | 2025-01-01 00:14:00 |
| 7731856 | Account Name | Marketing | 10 | Industry Professional | 25.90 | Busy | Focus Device | 790483 | 2025-02-06 03:14:00 |
| 3468 | Saipan International Airport | Finance | 13 | Faculty | 29.35 | Unavailable | Thomas Rivers | 505978 | 2025-03-11 06:14:00 |
| 4447006 | Norma Fisher | Legal | 16 | External Expert | 32.80 | Available | Kimberly Myers | id_6 | 2025-04-16 09:14:00 |

Mentor 8189495, Theodore Mcgrath (notably sharing a name with a student entrepreneur, suggesting a possible data overlap or naming convention), specializes in Business Planning with 7 years of experience, holds an Alumni affiliation, carries a rating of 22.45, and maintains Available status within department 2087755. Mentor 7731856, Account Name, focuses on Marketing with 10 years of experience as an Industry Professional, rated at 25.90, currently Busy, and assigned to department 790483. Mentor 3468, Saipan International Airport, brings Finance expertise with 13 years of experience as Faculty, the highest rating of 29.35, Unavailable status, and department 505978. Mentor 4447006, Norma Fisher, specializes in Legal matters with 16 years of experience as an External Expert, the highest rating at 32.80, Available status, and department id_6.

University departments serve as the institutional backbone, organizing faculty, programs, and resources.

**Table `university_departments`**

| department_id | department_name | department_code | head_of_department | location | established_date | operational_status | budget_allocation | mentor_id |
|---|---|---|---|---|---|---|---|---|
| 2087755 | College of Business Administration and Accountancy | 605962 | composite-head-57 | San Bartolome, Novaliches | 2024-03-27 | Active | 446.22 | 8189495 |
| 790483 | College of Engineering | 10449510 | primary-head-58 | Main Campus | 2025-08-11 | Inactive | 763.46 | 7731856 |
| 505978 | College of Arts and Sciences | 2002007020080 | adaptive-head-59 | Satellite Campus | 2022-01-22 | Reorganized | 12.34 | 3468 |
| id_6 | College of Business Administration and Accountancy | drafting-skills | distributed-head-60 | San Bartolome, Novaliches | 2023-06-06 | Active | 1,737 | 4447006 |

The College of Business Administration and Accountancy (department_id 2087755, code 605962) is led by composite-head-57, located in San Bartolome, Novaliches, established on 2024-03-27, with Active operational status and a budget allocation of 446.22. The College of Engineering (department_id 790483, code 10449510) operates from Main Campus under primary-head-58, established 2025-08-11, currently Inactive with a budget of 763.46. The College of Arts and Sciences (department_id 505978, code 2002007020080) is situated at Satellite Campus, led by adaptive-head-59, established 2022-01-22, in Reorganized status with a budget of 12.34. A second College of Business Administration and Accountancy (department_id id_6, code drafting-skills) shares the San Bartolome, Novaliches location, led by distributed-head-60, established 2023-06-06, Active status, and the largest budget allocation of 1,737.

Geographic jurisdictions provide the external context within which student ventures operate, each characterized by economic indicators and policy frameworks.

**Table `geographic_jurisdictions`**

| id | jurisdiction_id | jurisdiction_name | jurisdiction_type | population | gdp | entrepreneurship_index | government_policies | last_updated |
|---|---|---|---|---|---|---|---|---|
| 1 | 8387534 | Quezon City | City | 42 | 23.20 | 2.20 | Philippine Development Plan | 2023-06-17T17:27:00 |
| 2 | 99654 | Metro Manila | Province | 49 | 27.40 | 4.40 | Local Business Code | 2024-11-01T00:44:00 |
| 3 | lu_tax_code_template_m_I_4 | Philippines | Country | 56 | 31.60 | 6.60 | National Entrepreneurship Act | 2025-04-12T07:01:00 |
| 4 | 1186090 | Quezon City | Region | 63 | 35.80 | 8.80 | Philippine Development Plan | 2022-09-23T14:18:00 |

Quezon City (id 1, jurisdiction_id 8387534) is classified as a City with a population of 42, GDP of 23.20, an entrepreneurship index of 2.20, and operates under the Philippine Development Plan. Metro Manila (id 2, jurisdiction_id 99654) is designated as a Province with population 49, GDP 27.40, entrepreneurship index 4.40, governed by the Local Business Code. The Philippines (id 3, jurisdiction_id lu_tax_code_template_m_I_4) is a Country with population 56, GDP 31.60, entrepreneurship index 6.60, and the National Entrepreneurship Act as its policy framework. A second Quezon City entry (id 4, jurisdiction_id 1186090) is classified as a Region with population 63, GDP 35.80, entrepreneurship index 8.80, also under the Philippine Development Plan.

The ecosystem's relational complexity emerges through the cross-cutting association tables that link these core entities.

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

These association tables encode the many-to-many relationships that define how support systems reach initiatives, how mentors connect to entrepreneurs, how departments sponsor both systems and entrepreneurs, and how geographic jurisdictions influence specific business ventures. The presence of both systems_initiatives and initiatives_systems suggests bidirectional tracking—perhaps capturing both top-down program assignments and bottom-up initiative selections. Similarly, the dual presence of departments_systems and departments_entrepreneurs indicates that departments exert influence through both programmatic and direct entrepreneurial channels.

The detail views synthesize these relationships into actionable records, each answering a specific analytical question about the ecosystem.

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

This view joins support systems with the initiatives they fund or support, answering the question: which student ventures benefit from which university programs? A row linking the Legacy Programme D (system_id 8189503) to the Baseline Corridor D initiative would reveal the direct pipeline from institutional support to student venture.

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

This view connects support systems to their host departments, answering: which academic unit is responsible for which entrepreneurship programs? The Legacy Programme D (system_id 8189503) anchored to department 2087755 (College of Business Administration and Accountancy) demonstrates how departmental ownership structures program accountability.

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

The inverse perspective of the first view, this record answers: from the initiative's standpoint, which support systems are available? An initiative like Adaptive Assessment (initiative_id 8928495) linked to the Seasonal Framework (system_id 7441161) shows how a Planned incubation program might feed into an Active venture.

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

This view maps initiatives to their founding entrepreneurs, answering: which student is behind which venture? The Baseline Corridor D (initiative_id compta) connected to student 392507 (Theodore Mcgrath) provides a direct link from person to enterprise, with the Technology sector and 131 employees contextualizing the venture's scale.

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

This view situates initiatives within their geographic and regulatory context, answering: where does each venture operate and under what jurisdictional framework? The Baseline Corridor D (initiative_id compta) in jurisdiction 1 (Quezon City, City classification) places the Technology venture under the Philippine Development Plan with an entrepreneurship index of 2.20.

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

This view provides the entrepreneur-centric view of their ventures, answering: what businesses has each student founded? Student 392507 (Theodore Mcgrath) linked to initiative compta (Baseline Corridor D) in the Technology sector with 131 employees shows the tangible output of an Entrepreneurship major's academic training.

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

This view connects students to their academic homes, answering: which department does each entrepreneur belong to? Student 392507 (Theodore Mcgrath) within department 2087755 (College of Business Administration and Accountancy) demonstrates the departmental alignment between academic program and entrepreneurial pursuit.

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

This view reveals the mentorship relationships, answering: which mentor guides which student entrepreneur? Student 392507 (Theodore Mcgrath) paired with mentor 8189495 (Theodore Mcgrath, Business Planning specialist) illustrates the direct advisory relationship, with the mentor's 7 years of experience and Alumni affiliation providing relevant industry perspective.

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

The mentor-centric counterpart, this view answers: which students does each mentor advise? Mentor 8189495 (Theodore Mcgrath, Business Planning, 7 years experience, Alumni affiliation, Available status) linked to student 392507 shows the mentor's active engagement capacity.

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

This view establishes departmental ownership of mentorship resources, answering: which department employs or affiliates each mentor? Mentor 8189495 within department 2087755 (College of Business Administration and Accountancy) confirms the departmental anchoring of mentorship capacity.

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

This view details departmental program portfolios, answering: which support systems does each department operate? Department 2087755 (College of Business Administration and Accountancy) operating system 8189503 (Legacy Programme D, Mentorship type, budget 35.45) demonstrates how departmental budgets translate into specific program offerings.

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

This view maps departmental mentorship resources, answering: which mentors are available within each department? Department 2087755 with mentor 8189495 (Business Planning, 7 years experience, Alumni, Available) shows the department's advisory capacity.

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

This view reveals departmental entrepreneurial output, answering: which student entrepreneurs does each department cultivate? Department 2087755 (College of Business Administration and Accountancy) with student 392507 (Theodore Mcgrath, Entrepreneurship major, Active status, satisfaction 4.45) demonstrates the department's role in producing venture founders.

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

This view provides the jurisdictional perspective on venture distribution, answering: which initiatives operate within each geographic area? Jurisdiction 1 (Quezon City, City, population 42, GDP 23.20, entrepreneurship index 2.20) containing initiative compta (Baseline Corridor D, Technology sector, Ideation status) shows how local economic conditions correlate with venture characteristics.

The university entrepreneurship ecosystem functions as an integrated support architecture where academic departments provide institutional grounding, support systems deliver structured resources, mentors offer expert guidance, and geographic jurisdictions establish the external operating environment. Student entrepreneurs occupy the center of this network, simultaneously enrolled in academic programs, advised by mentors, supported by institutional systems, and launching ventures within specific geographic and regulatory contexts. The data records capture not just the existence of these entities but the precise operational relationships that determine which students receive which forms of support, through which departments, under which mentorship, and within which geographic frameworks. The accessibility scores of support systems, the satisfaction ratings of entrepreneurs, the experience levels of mentors, and the entrepreneurship indices of jurisdictions all provide measurable dimensions for evaluating the effectiveness and reach of the ecosystem. Understanding these relationships enables administrators to identify gaps in support coverage, optimize resource allocation across departments, and strengthen the connections between academic training and entrepreneurial outcomes.