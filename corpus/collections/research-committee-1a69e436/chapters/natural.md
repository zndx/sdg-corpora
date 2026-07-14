## Governance and Research Administration

University research ecosystems operate through layered governance structures that coordinate academic inquiry, doctoral training, and commercialization. At the highest level, research vice presidents oversee strategic direction while research committees manage review and approval processes, and scientific bureaus provide operational infrastructure. This chapter documents the organizational records that capture these relationships, tracing how authority flows from executive leadership through administrative directors and technology transfer offices to the research laboratories and doctoral schools where actual work occurs.

**Table `research_committees`**

| id | committee_id | name | established_date | status | research_vice_president_id |
|---|---|---|---|---|---|
| 1 | PHR-98 | Extended Review | 2024-03-27 | active | 1 |
| 2 | L785 | Pilot Initiative A | 2025-08-11 | inactive | 2 |
| 3 | 7119774 | Baseline Model | 2022-01-22 | pending | 3 |
| 4 | 1186094 | Distributed Cluster | 2023-06-06 | active | 4 |

Research committees serve as the primary review bodies within the research governance framework. Each committee carries a unique identifier—such as PHR-98 for the Extended Review committee or L785 for Pilot Initiative A—and maintains a status reflecting its current operational state. The Extended Review committee, established on 2024-03-27, remains active under vice president oversight, while Pilot Initiative A has transitioned to inactive status since 2025-08-11. The Baseline Model committee (identifier 7119774) holds a pending status, indicating it is awaiting full activation, and the Distributed Cluster committee (1186094) operates actively since its 2023-06-06 establishment. Every committee record links to a specific research vice president through the research_vice_president_id column, establishing the chain of executive accountability.

**Table `research_vice_presidents`**

| id | official_name | title | appointment_date | status | research_committee_id | scientific_bureau_id |
|---|---|---|---|---|---|---|
| 1 | Extended Review | Compact Initiative | 2022-05-03 | active | 1 | 1 |
| 2 | Pilot Initiative A | Legacy Model | 2023-10-14 | inactive | 2 | 2 |
| 3 | Baseline Model | Regional Cluster A | 2024-03-25 | suspended | 3 | 3 |
| 4 | Distributed Cluster | Seasonal Review | 2025-08-09 | active | 4 | 4 |

Research vice presidents occupy the executive tier of the governance hierarchy. Their records capture both an official_name and a title, which may differ—for instance, the vice president officially named "Extended Review" holds the title "Compact Initiative," while "Pilot Initiative A" carries the title "Legacy Model." Appointment dates span from 2022-05-03 through 2025-08-09, reflecting staggered leadership transitions. Status values include active, inactive, and suspended, with the Baseline Model vice president currently suspended as of 2024-03-25. Each vice president record connects to both a research committee and a scientific bureau, creating a dual-link structure that ties executive authority to both review bodies and operational bureaus.

**Table `scientific_bureaus`**

| id | bureau_id | name | established_date | status |
|---|---|---|---|---|
| 1 | 195361 | Extended Review | 2024-03-27 | active |
| 2 | 3158162 | Pilot Initiative A | 2025-08-11 | inactive |
| 3 | 2106698 | Baseline Model | 2022-01-22 | pending |
| 4 | L331 | Distributed Cluster | 2023-06-06 | active |

Scientific bureaus form the operational backbone of research administration. Identified by codes such as 195361 for the Extended Review bureau and L331 for the Distributed Cluster bureau, these entities maintain their own establishment dates and status tracks. The Pilot Initiative A bureau (3158162) is inactive, while the Baseline Model bureau (2106698) remains pending. The bureau records stand independently but are referenced by vice president records, meaning the governance chain flows from vice president down to bureau rather than the reverse.

**Table `doctoral_schools`**

| id | school_id | name | code | established_date | status | doctoral_school_director_id | doctoral_college_id |
|---|---|---|---|---|---|---|---|
| 1 | 1152671 | Dana Nguyen | lu_tax_code_template_m_I_4 | 2024-03-27 | active | 1000 | 1 |
| 2 | 1186099 | Kimberly Myers | 2986219 | 2025-08-11 | inactive | 1001 | 2 |
| 3 | 7441154 | Kimberly Myers | 8928520 | 2022-01-22 | pending | 1002 | 3 |
| 4 | 338514 | Guam International Airport | 195369 | 2023-06-06 | active | 1003 | 4 |

Doctoral schools represent the academic training dimension of the research ecosystem. The Dana Nguyen school (identifier 1152671) operates under the code lu_tax_code_template_m_I_4 and is currently active, while the Kimberly Myers school (1186099) carries code 2986219 and holds inactive status. A second Kimberly Myers entry (7441154) with code 8928520 exists in pending status, and the Guam International Airport school (338514) is active under code 195369. Each doctoral school records an established date, a status, and links to both a doctoral school director and a doctoral college, embedding the school within both personnel and structural hierarchies.

**Table `doctoral_school_directors`**

| id | official_name | title | appointment_date | status | doctoral_school_id |
|---|---|---|---|---|---|
| 1000 | Carolyn Randall | Compact Initiative | 2022-05-03 | active | 1 |
| 1001 | Ontario International Airport | Legacy Model | 2023-10-14 | inactive | 2 |
| 1002 | Elizabeth Riggs | Regional Cluster A | 2024-03-25 | suspended | 3 |
| 1003 | Jeff Davidson | Seasonal Review | 2025-08-09 | active | 4 |

Doctoral school directors provide individual leadership for each school. Carolyn Randall directs the Dana Nguyen school and holds active status with the title "Compact Initiative," while Ontario International Airport directs the Kimberly Myers school (1186099) under the title "Legacy Model" with inactive status. Elizabeth Riggs, suspended since 2024-03-25, directs the pending Kimberly Myers school (7441154) with the title "Regional Cluster A," and Jeff Davidson directs the Guam International Airport school under the title "Seasonal Review" with active status. The appointment dates for these directors range from 2022-05-03 to 2025-08-09, mirroring the broader leadership timeline.

**Table `doctoral_colleges`**

| doctoral_college_id | college_id | name | established_date | status |
|---|---|---|---|---|
| 1 | 575206 | Dana Nguyen | 2024-03-27 | active |
| 2 | Takings | Kimberly Myers | 2025-08-11 | inactive |
| 3 | 10449517 | Kimberly Myers | 2022-01-22 | pending |
| 4 | 10449524 | Guam International Airport | 2023-06-06 | active |

Doctoral colleges sit above schools in the organizational hierarchy. The Dana Nguyen college (college_id 575206) is active, while the Kimberly Myers college (college_id Takings) is inactive. Two additional colleges—10449517 and 10449524—hold pending and active statuses respectively, with the latter associated with the Guam International Airport name. Colleges serve as the structural parent of doctoral schools, and this parent-child relationship is captured through the doctoral_college_id foreign key in the doctoral_schools table.

**Table `research_laboratories`**

| lab_id | name | established_date | status |
|---|---|---|---|
| 2106706 | Extended Review | 2024-03-27 | active |
| 1437591 | Pilot Initiative A | 2025-08-11 | inactive |
| 12042 | Baseline Model | 2022-01-22 | pending |
| 1562831 | Distributed Cluster | 2023-06-06 | active |

Research laboratories constitute the physical and intellectual sites where investigations take place. Each laboratory is assigned a unique identifier and carries a name, establishment date, and status. Laboratories link to doctoral schools through the schools_laboratories junction table, creating a many-to-many relationship that allows a single laboratory to serve multiple doctoral programs and a single doctoral school to draw from multiple laboratories.

**Table `technology_transfer_departments`**

| id | department_id | name | established_date | status | administrative_director_id | technology_transfer_vice_president_id |
|---|---|---|---|---|---|---|
| 1 | 2087755 | Extended Review | 2024-03-27 | active | 1 | 100 |
| 2 | 790483 | Pilot Initiative A | 2025-08-11 | inactive | 2 | 101 |
| 3 | 505978 | Baseline Model | 2022-01-22 | pending | 3 | 102 |
| 4 | id_6 | Distributed Cluster | 2023-06-06 | active | 4 | 103 |

Technology transfer departments manage the commercialization and licensing of research outputs. These departments maintain their own identifiers, names, establishment dates, and status records. Each department links to an administrative director and a technology transfer vice president, creating a parallel governance structure that runs alongside the research-focused hierarchy.

**Table `administrative_directors`**

| administrative_director_id | official_name | title | appointment_date | status | technology_transfer_department_id |
|---|---|---|---|---|---|
| 1 | Extended Review | Compact Initiative | 2022-05-03 | active | 1 |
| 2 | Pilot Initiative A | Legacy Model | 2023-10-14 | inactive | 2 |
| 3 | Baseline Model | Regional Cluster A | 2024-03-25 | suspended | 3 |
| 4 | Distributed Cluster | Seasonal Review | 2025-08-09 | active | 4 |

Administrative directors provide day-to-day management of technology transfer departments. Their records include an official name, title, appointment date, and status, with a foreign key pointing to the technology transfer department they manage. This mirrors the structure seen in doctoral school directors and research vice presidents, establishing a consistent pattern of individual leadership within organizational units.

**Table `technology_transfer_vice_presidents`**

| technology_transfer_vice_president_id | official_name | title | appointment_date | status | technology_transfer_department_id |
|---|---|---|---|---|---|
| 100 | Extended Review | Compact Initiative | 2022-05-03 | active | 1 |
| 101 | Pilot Initiative A | Legacy Model | 2023-10-14 | inactive | 2 |
| 102 | Baseline Model | Regional Cluster A | 2024-03-25 | suspended | 3 |
| 103 | Distributed Cluster | Seasonal Review | 2025-08-09 | active | 4 |

Technology transfer vice presidents occupy the executive tier of the commercialization chain. Like their research-focused counterparts, they carry official names, titles, appointment dates, and statuses, and link to their parent technology transfer department. This creates a governance structure where technology transfer vice presidents oversee departments managed by administrative directors, forming a clear chain of authority from executive to operational management.

**Table `schools_laboratories`**

| doctoral_school_id | research_laboratory_lab_id |
|---|---|
| 1 | 2106706 |
| 1 | 1437591 |
| 2 | 1437591 |
| 2 | 12042 |
| 3 | 12042 |
| 3 | 1562831 |
| 4 | 1562831 |
| 4 | 2106706 |

The schools_laboratories table captures the many-to-many relationship between doctoral schools and research laboratories. This junction table allows flexible assignment of laboratory resources to doctoral programs, reflecting the reality that research infrastructure is shared across academic units.

**Table `colleges_schools`**

| doctoral_college_id | doctoral_school_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

The colleges_schools junction table records the relationship between doctoral colleges and doctoral schools. While the doctoral_schools table already contains a doctoral_college_id foreign key, this explicit junction table provides a normalized structure for tracking college-school associations, potentially supporting historical changes or complex reorganizations.

**Table `laboratories_schools`**

| research_laboratory_lab_id | doctoral_school_id |
|---|---|
| 2106706 | 1 |
| 2106706 | 2 |
| 1437591 | 2 |
| 1437591 | 3 |
| 12042 | 3 |
| 12042 | 4 |
| 1562831 | 4 |
| 1562831 | 1 |

The laboratories_schools table provides an alternative or complementary record of the relationship between research laboratories and doctoral schools. Together with schools_laboratories, these junction tables offer redundancy and flexibility in tracking how research infrastructure serves academic programs.

### Research Governance Views

The research governance views connect executive leadership to the committees and bureaus they oversee, answering questions about which vice president manages which committee and which bureau provides operational support.

**View `research_committee_research_vice_president_view`**

```sql
CREATE VIEW research_committee_research_vice_president_view AS
SELECT a.id, a.committee_id, a.name, a.established_date, b.id AS president_id, b.official_name AS president_official_name, b.title AS president_title
FROM research_committees a JOIN research_vice_presidents b ON a.research_vice_president_id = b.id;
```

| id | committee_id | name | established_date | president_id | president_official_name | president_title |
|---|---|---|---|---|---|---|
| 1 | PHR-98 | Extended Review | 2024-03-27 | 1 | Extended Review | Compact Initiative |
| 2 | L785 | Pilot Initiative A | 2025-08-11 | 2 | Pilot Initiative A | Legacy Model |
| 3 | 7119774 | Baseline Model | 2022-01-22 | 3 | Baseline Model | Regional Cluster A |
| 4 | 1186094 | Distributed Cluster | 2023-06-06 | 4 | Distributed Cluster | Seasonal Review |

This view joins research committees with their overseeing vice presidents, revealing the direct accountability relationship. For example, the Extended Review committee (PHR-98) is overseen by the vice president whose official name is also "Extended Review" and who holds the title "Compact Initiative." The view surfaces the committee's status alongside the vice president's status, allowing administrators to identify mismatches—such as an active committee managed by a suspended vice president.

**View `research_vice_president_research_committee_view`**

```sql
CREATE VIEW research_vice_president_research_committee_view AS
SELECT a.id, a.official_name, a.title, a.appointment_date, b.id AS committee_id, b.committee_id AS committee_committee_id, b.name AS committee_name
FROM research_vice_presidents a JOIN research_committees b ON a.research_committee_id = b.id;
```

| id | official_name | title | appointment_date | committee_id | committee_committee_id | committee_name |
|---|---|---|---|---|---|---|
| 1 | Extended Review | Compact Initiative | 2022-05-03 | 1 | PHR-98 | Extended Review |
| 2 | Pilot Initiative A | Legacy Model | 2023-10-14 | 2 | L785 | Pilot Initiative A |
| 3 | Baseline Model | Regional Cluster A | 2024-03-25 | 3 | 7119774 | Baseline Model |
| 4 | Distributed Cluster | Seasonal Review | 2025-08-09 | 4 | 1186094 | Distributed Cluster |

The inverse view starts from the vice president and enumerates their committee assignments. The vice president titled "Compact Initiative" manages the Extended Review committee, while the vice president titled "Legacy Model" oversees Pilot Initiative A. This perspective is useful for workload analysis and for understanding the distribution of committee oversight across the vice president population.

**View `research_vice_president_scientific_bureau_view`**

```sql
CREATE VIEW research_vice_president_scientific_bureau_view AS
SELECT a.id, a.official_name, a.title, a.appointment_date, b.id AS bureau_id, b.bureau_id AS bureau_bureau_id, b.name AS bureau_name
FROM research_vice_presidents a JOIN scientific_bureaus b ON a.scientific_bureau_id = b.id;
```

| id | official_name | title | appointment_date | bureau_id | bureau_bureau_id | bureau_name |
|---|---|---|---|---|---|---|
| 1 | Extended Review | Compact Initiative | 2022-05-03 | 1 | 195361 | Extended Review |
| 2 | Pilot Initiative A | Legacy Model | 2023-10-14 | 2 | 3158162 | Pilot Initiative A |
| 3 | Baseline Model | Regional Cluster A | 2024-03-25 | 3 | 2106698 | Baseline Model |
| 4 | Distributed Cluster | Seasonal Review | 2025-08-09 | 4 | L331 | Distributed Cluster |

This view links vice presidents to their associated scientific bureaus, completing the governance triangle. The "Compact Initiative" vice president is paired with the Extended Review bureau (195361), and the "Legacy Model" vice president with the Pilot Initiative A bureau (3158162). The view makes it straightforward to verify that every vice president has an assigned bureau and to audit the alignment between executive leadership and operational infrastructure.

### Doctoral Education Administration Views

Doctoral education views connect schools, directors, colleges, and laboratories, answering questions about leadership assignments, structural hierarchies, and research infrastructure access.

**View `doctoral_school_doctoral_school_director_view`**

```sql
CREATE VIEW doctoral_school_doctoral_school_director_view AS
SELECT a.id, a.school_id, a.name, a.code, b.id AS director_id, b.official_name AS director_official_name, b.title AS director_title
FROM doctoral_schools a JOIN doctoral_school_directors b ON a.doctoral_school_director_id = b.id;
```

| id | school_id | name | code | director_id | director_official_name | director_title |
|---|---|---|---|---|---|---|
| 1 | 1152671 | Dana Nguyen | lu_tax_code_template_m_I_4 | 1000 | Carolyn Randall | Compact Initiative |
| 2 | 1186099 | Kimberly Myers | 2986219 | 1001 | Ontario International Airport | Legacy Model |
| 3 | 7441154 | Kimberly Myers | 8928520 | 1002 | Elizabeth Riggs | Regional Cluster A |
| 4 | 338514 | Guam International Airport | 195369 | 1003 | Jeff Davidson | Seasonal Review |

This view joins doctoral schools with their directors, providing a clear picture of who leads each school. The Dana Nguyen school (1152671) is directed by Carolyn Randall, whose active status aligns with the school's active status. The Kimberly Myers school (1186099) is directed by Ontario International Airport, whose inactive status matches the school's inactive status. Mismatches between school and director status—such as an active school with a suspended director—become immediately visible.

**View `doctoral_school_research_laboratory_detail_view`**

```sql
CREATE VIEW doctoral_school_research_laboratory_detail_view AS
SELECT a.id, a.school_id, a.name, b.lab_id AS laboratory_lab_id, b.name AS laboratory_name, b.established_date AS laboratory_established_date
FROM doctoral_schools a
  JOIN schools_laboratories j ON j.doctoral_school_id = a.id
  JOIN research_laboratories b ON b.lab_id = j.research_laboratory_lab_id;
```

| id | school_id | name | laboratory_lab_id | laboratory_name | laboratory_established_date |
|---|---|---|---|---|---|
| 1 | 1152671 | Dana Nguyen | 2106706 | Extended Review | 2024-03-27 |
| 1 | 1152671 | Dana Nguyen | 1437591 | Pilot Initiative A | 2025-08-11 |
| 2 | 1186099 | Kimberly Myers | 1437591 | Pilot Initiative A | 2025-08-11 |
| 2 | 1186099 | Kimberly Myers | 12042 | Baseline Model | 2022-01-22 |
| 3 | 7441154 | Kimberly Myers | 12042 | Baseline Model | 2022-01-22 |
| 3 | 7441154 | Kimberly Myers | 1562831 | Distributed Cluster | 2023-06-06 |
| 4 | 338514 | Guam International Airport | 1562831 | Distributed Cluster | 2023-06-06 |
| 4 | 338514 | Guam International Airport | 2106706 | Extended Review | 2024-03-27 |

This view connects doctoral schools to the research laboratories that serve them, revealing the infrastructure footprint of each school. The Dana Nguyen school draws from specific laboratories through the schools_laboratories relationship, and the view surfaces laboratory identifiers and names alongside school information. This enables administrators to assess whether doctoral programs have adequate laboratory resources and to identify schools that may be underserved.

**View `doctoral_school_doctoral_college_view`**

```sql
CREATE VIEW doctoral_school_doctoral_college_view AS
SELECT a.id, a.school_id, a.name, a.code, b.doctoral_college_id AS college_doctoral_college_id, b.college_id AS college_college_id, b.name AS college_name
FROM doctoral_schools a JOIN doctoral_colleges b ON a.doctoral_college_id = b.doctoral_college_id;
```

| id | school_id | name | code | college_doctoral_college_id | college_college_id | college_name |
|---|---|---|---|---|---|---|
| 1 | 1152671 | Dana Nguyen | lu_tax_code_template_m_I_4 | 1 | 575206 | Dana Nguyen |
| 2 | 1186099 | Kimberly Myers | 2986219 | 2 | Takings | Kimberly Myers |
| 3 | 7441154 | Kimberly Myers | 8928520 | 3 | 10449517 | Kimberly Myers |
| 4 | 338514 | Guam International Airport | 195369 | 4 | 10449524 | Guam International Airport |

This view links doctoral schools to their parent doctoral colleges, clarifying the organizational hierarchy. The Dana Nguyen school belongs to the Dana Nguyen college (575206), and the Kimberly Myers school (1186099) belongs to the Kimberly Myers college (Takings). The view surfaces the college's status alongside the school's, allowing for audits of structural consistency.

**View `doctoral_school_director_doctoral_school_view`**

```sql
CREATE VIEW doctoral_school_director_doctoral_school_view AS
SELECT a.id, a.official_name, a.title, a.appointment_date, b.id AS school_id, b.school_id AS school_school_id, b.name AS school_name
FROM doctoral_school_directors a JOIN doctoral_schools b ON a.doctoral_school_id = b.id;
```

| id | official_name | title | appointment_date | school_id | school_school_id | school_name |
|---|---|---|---|---|---|---|
| 1000 | Carolyn Randall | Compact Initiative | 2022-05-03 | 1 | 1152671 | Dana Nguyen |
| 1001 | Ontario International Airport | Legacy Model | 2023-10-14 | 2 | 1186099 | Kimberly Myers |
| 1002 | Elizabeth Riggs | Regional Cluster A | 2024-03-25 | 3 | 7441154 | Kimberly Myers |
| 1003 | Jeff Davidson | Seasonal Review | 2025-08-09 | 4 | 338514 | Guam International Airport |

The inverse of the director-school view, this perspective starts from the director and surfaces their school assignment. Carolyn Randall's record shows her assignment to the Dana Nguyen school, while Jeff Davidson's record shows his assignment to the Guam International Airport school. This view is useful for personnel management and for verifying that every director has a valid school assignment.

**View `doctoral_college_doctoral_school_detail_view`**

```sql
CREATE VIEW doctoral_college_doctoral_school_detail_view AS
SELECT a.doctoral_college_id, a.college_id, a.name, b.id AS school_id, b.school_id AS school_school_id, b.name AS school_name
FROM doctoral_colleges a
  JOIN colleges_schools j ON j.doctoral_college_id = a.doctoral_college_id
  JOIN doctoral_schools b ON b.id = j.doctoral_school_id;
```

| doctoral_college_id | college_id | name | school_id | school_school_id | school_name |
|---|---|---|---|---|---|
| 1 | 575206 | Dana Nguyen | 1 | 1152671 | Dana Nguyen |
| 1 | 575206 | Dana Nguyen | 2 | 1186099 | Kimberly Myers |
| 2 | Takings | Kimberly Myers | 2 | 1186099 | Kimberly Myers |
| 2 | Takings | Kimberly Myers | 3 | 7441154 | Kimberly Myers |
| 3 | 10449517 | Kimberly Myers | 3 | 7441154 | Kimberly Myers |
| 3 | 10449517 | Kimberly Myers | 4 | 338514 | Guam International Airport |
| 4 | 10449524 | Guam International Airport | 4 | 338514 | Guam International Airport |
| 4 | 10449524 | Guam International Airport | 1 | 1152671 | Dana Nguyen |

This view starts from the doctoral college and enumerates its schools, providing a top-down view of the college-school hierarchy. The Dana Nguyen college encompasses the Dana Nguyen school, and the Guam International Airport college (10449524) encompasses the Guam International Airport school (338514). Administrators can use this view to understand the scope of each college and to plan resource allocation at the college level.

**View `research_laboratory_doctoral_school_detail_view`**

```sql
CREATE VIEW research_laboratory_doctoral_school_detail_view AS
SELECT a.lab_id, a.name, a.established_date, b.id AS school_id, b.school_id AS school_school_id, b.name AS school_name
FROM research_laboratories a
  JOIN laboratories_schools j ON j.research_laboratory_lab_id = a.lab_id
  JOIN doctoral_schools b ON b.id = j.doctoral_school_id;
```

| lab_id | name | established_date | school_id | school_school_id | school_name |
|---|---|---|---|---|---|
| 2106706 | Extended Review | 2024-03-27 | 1 | 1152671 | Dana Nguyen |
| 2106706 | Extended Review | 2024-03-27 | 2 | 1186099 | Kimberly Myers |
| 1437591 | Pilot Initiative A | 2025-08-11 | 2 | 1186099 | Kimberly Myers |
| 1437591 | Pilot Initiative A | 2025-08-11 | 3 | 7441154 | Kimberly Myers |
| 12042 | Baseline Model | 2022-01-22 | 3 | 7441154 | Kimberly Myers |
| 12042 | Baseline Model | 2022-01-22 | 4 | 338514 | Guam International Airport |
| 1562831 | Distributed Cluster | 2023-06-06 | 4 | 338514 | Guam International Airport |
| 1562831 | Distributed Cluster | 2023-06-06 | 1 | 1152671 | Dana Nguyen |

Starting from the research laboratory, this view reveals which doctoral schools it serves. A laboratory that supports multiple schools will appear multiple times in this view, once per school association. This perspective is essential for understanding laboratory utilization and for identifying laboratories that may be over- or under-utilized relative to their capacity.

### Technology Transfer Administration Views

Technology transfer views connect departments, administrative directors, and vice presidents, answering questions about management assignments and executive oversight within the commercialization chain.

**View `technology_transfer_department_administrative_director_view`**

```sql
CREATE VIEW technology_transfer_department_administrative_director_view AS
SELECT a.id, a.department_id, a.name, a.established_date, b.administrative_director_id AS director_administrative_director_id, b.official_name AS director_official_name, b.title AS director_title
FROM technology_transfer_departments a JOIN administrative_directors b ON a.administrative_director_id = b.administrative_director_id;
```

| id | department_id | name | established_date | director_administrative_director_id | director_official_name | director_title |
|---|---|---|---|---|---|---|
| 1 | 2087755 | Extended Review | 2024-03-27 | 1 | Extended Review | Compact Initiative |
| 2 | 790483 | Pilot Initiative A | 2025-08-11 | 2 | Pilot Initiative A | Legacy Model |
| 3 | 505978 | Baseline Model | 2022-01-22 | 3 | Baseline Model | Regional Cluster A |
| 4 | id_6 | Distributed Cluster | 2023-06-06 | 4 | Distributed Cluster | Seasonal Review |

This view joins technology transfer departments with their administrative directors, providing a clear picture of departmental management. Each department record is paired with its director's official name, title, and status. The view enables administrators to verify that every department has an assigned director and to identify departments where the director's status may not align with the department's operational needs.

**View `technology_transfer_department_technology_transfer_vice_president_view`**

```sql
CREATE VIEW technology_transfer_department_technology_transfer_vice_president_view AS
SELECT a.id, a.department_id, a.name, a.established_date, b.technology_transfer_vice_president_id AS president_technology_transfer_vice_president_id, b.official_name AS president_official_name, b.title AS president_title
FROM technology_transfer_departments a JOIN technology_transfer_vice_presidents b ON a.technology_transfer_vice_president_id = b.technology_transfer_vice_president_id;
```

| id | department_id | name | established_date | president_technology_transfer_vice_president_id | president_official_name | president_title |
|---|---|---|---|---|---|---|
| 1 | 2087755 | Extended Review | 2024-03-27 | 100 | Extended Review | Compact Initiative |
| 2 | 790483 | Pilot Initiative A | 2025-08-11 | 101 | Pilot Initiative A | Legacy Model |
| 3 | 505978 | Baseline Model | 2022-01-22 | 102 | Baseline Model | Regional Cluster A |
| 4 | id_6 | Distributed Cluster | 2023-06-06 | 103 | Distributed Cluster | Seasonal Review |

This view links technology transfer departments to their overseeing vice presidents, completing the technology transfer governance chain. The view surfaces the department's identifier and name alongside the vice president's official name and title, making it straightforward to audit the alignment between departmental operations and executive oversight.

**View `administrative_director_technology_transfer_department_view`**

```sql
CREATE VIEW administrative_director_technology_transfer_department_view AS
SELECT a.administrative_director_id, a.official_name, a.title, a.appointment_date, b.id AS department_id, b.department_id AS department_department_id, b.name AS department_name
FROM administrative_directors a JOIN technology_transfer_departments b ON a.technology_transfer_department_id = b.id;
```

| administrative_director_id | official_name | title | appointment_date | department_id | department_department_id | department_name |
|---|---|---|---|---|---|---|
| 1 | Extended Review | Compact Initiative | 2022-05-03 | 1 | 2087755 | Extended Review |
| 2 | Pilot Initiative A | Legacy Model | 2023-10-14 | 2 | 790483 | Pilot Initiative A |
| 3 | Baseline Model | Regional Cluster A | 2024-03-25 | 3 | 505978 | Baseline Model |
| 4 | Distributed Cluster | Seasonal Review | 2025-08-09 | 4 | id_6 | Distributed Cluster |

The inverse view starts from the administrative director and surfaces their department assignment. This perspective is useful for personnel management, workload analysis, and verifying that every administrative director has a valid department assignment. It mirrors the pattern seen in the doctoral school director views, maintaining consistency across the administrative domain.

**View `technology_transfer_vice_president_technology_transfer_department_view`**

```sql
CREATE VIEW technology_transfer_vice_president_technology_transfer_department_view AS
SELECT a.technology_transfer_vice_president_id, a.official_name, a.title, a.appointment_date, b.id AS department_id, b.department_id AS department_department_id, b.name AS department_name
FROM technology_transfer_vice_presidents a JOIN technology_transfer_departments b ON a.technology_transfer_department_id = b.id;
```

| technology_transfer_vice_president_id | official_name | title | appointment_date | department_id | department_department_id | department_name |
|---|---|---|---|---|---|---|
| 100 | Extended Review | Compact Initiative | 2022-05-03 | 1 | 2087755 | Extended Review |
| 101 | Pilot Initiative A | Legacy Model | 2023-10-14 | 2 | 790483 | Pilot Initiative A |
| 102 | Baseline Model | Regional Cluster A | 2024-03-25 | 3 | 505978 | Baseline Model |
| 103 | Distributed Cluster | Seasonal Review | 2025-08-09 | 4 | id_6 | Distributed Cluster |

Starting from the technology transfer vice president, this view enumerates the departments under their purview. A vice president overseeing multiple departments will appear multiple times, once per department. This view is essential for understanding the scope of each vice president's responsibilities and for planning leadership transitions or workload redistribution.

### Synthesis

The records and views presented here form a comprehensive picture of university research administration. Research governance flows from vice presidents through committees and scientific bureaus, with each link captured in both base tables and join views. Doctoral education administration connects schools to directors, colleges, and laboratories, creating a multi-dimensional structure that supports both academic training and research infrastructure. Technology transfer administration runs a parallel chain from vice presidents through departments to administrative directors, managing the commercialization of research outputs. The junction tables—schools_laboratories, colleges_schools, and laboratories_schools—provide the flexible many-to-many relationships that reflect the complex reality of how research organizations share resources across institutional boundaries. Together, these tables and views provide the factual foundation for auditing, planning, and managing a university's research enterprise.