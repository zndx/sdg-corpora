## The SME Ecosystem: Recording Enterprises, People, and Markets

Small and medium enterprises (SMEs) form the backbone of regional economies, and tracking them requires a structured approach that captures not only the enterprises themselves but also the people who lead and staff them, the markets they operate in, and the regulatory environments that shape their activities. The records in this domain organize every facet of an SME's existence into interlocking tables and composite views, enabling analysts to answer questions ranging from "which jurisdictions host the most growth-oriented sectors?" to "what is the experience profile of business owners in a given market?" The following sections walk through each record type, the relationships that bind them, and the analytical views that synthesize the data into actionable insight.

**Table `s_m_es`**

| s_m_e_id | enterprise_id | name | employee_count | annual_revenue | sector | country_of_operation | is_publicly_traded | founding_date | market_sector_id | jurisdiction_id | business_owner_id |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 9568454 | Extended Review | 131 | 12,608 | adaptive-sector-53 | pilot-country-50 | false | 2023-06-24 | 1000 | 1 | 1 |
| 2 | managing-resources | Pilot Initiative A | 428 | 56,418 | distributed-sector-54 | extended-country-51 | true | 2024-11-08 | 1001 | 2 | 2 |
| 3 | 974930 | Baseline Model | 3 | 16,254 | baseline-sector-55 | integrated-country-52 | false | 2025-04-19 | 1002 | 3 | 3 |
| 4 | state_et_11 | Distributed Cluster | 9 | 745,000 | pilot-sector-56 | seasonal-country-53 | true | 2022-09-03 | 1003 | 4 | 4 |

The `s_m_es` table is the central entity in the domain, holding one row per enterprise. Each record carries a unique `s_m_e_id`, a human-readable `name`, and operational metrics including `employee_count` and `annual_revenue`. The `sector` column classifies the enterprise's primary line of business, while `country_of_operation` identifies the geographic market. Boolean and date fields — `is_publicly_traded` and `founding_date` — add further context. Consider the first four rows: "Extended Review" (s_m_e_id 1) is a 131-employee enterprise founded in June 2023 with annual revenue of 12,608, operating in the adaptive-sector-53 space under pilot-country-50. By contrast, "Distributed Cluster" (s_m_e_id 4) is a smaller nine-employee firm but commands annual revenue of 745,000, founded in September 2022 and publicly traded. Each SME row also carries foreign keys — `market_sector_id`, `jurisdiction_id`, and `business_owner_id` — that anchor it to the other tables in the domain.

**Table `business_owners`**

| business_owner_id | owner_id | full_name | generation | age | title | years_of_experience | exit_plan | exit_timeframe | s_m_e_id | jurisdiction_id | survey_id |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | Brian Hamilton | Theodore Mcgrath | compact-generati-62 | 35 | Compact Initiative | 7 | false | 26 | 1 | 1 | 1 |
| 2 | Kerry West | Account Name | composite-generati-63 | 40 | Legacy Model | 10 | true | 35 | 2 | 2 | 2 |
| 3 | Peter Montgomery | Saipan International Airport | primary-generati-64 | 45 | Regional Cluster A | 13 | false | 44 | 3 | 3 | 3 |
| 4 | Susan Wagner | Norma Fisher | adaptive-generati-65 | 50 | Seasonal Review | 16 | true | 53 | 4 | 4 | 4 |

Every SME is associated with a business owner, recorded in the `business_owners` table. This table stores the `business_owner_id`, an `owner_id`, the `full_name` of the individual, and demographic and professional metadata: `generation`, `age`, `title`, `years_of_experience`, `exit_plan`, and `exit_timeframe`. The `s_m_e_id`, `jurisdiction_id`, and `survey_id` columns link the owner back to their enterprise, the jurisdiction in which they operate, and the survey instrument under which their data was collected. For example, business owner ID 1, "Theodore Mcgrath," is 35 years old, holds the title "Compact Initiative," has seven years of experience, and does not have an exit plan (exit_plan is false) with an exit_timeframe of 26. Business owner ID 4, "Susan Wagner," is 50 years old with 16 years of experience, holds the title "Seasonal Review," and does have an exit plan set to true with an exit_timeframe of 53.

**Table `employees`**

| employee_id | full_name | role | department | start_date | termination_date | is_leader | performance_rating | s_m_e_id | job_role_id | jurisdiction_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | Theodore Mcgrath | pilot-role-20 | adaptive-departme-89 | 2022-09-05 | 2022-09-11 | true | 15.95 | 1 | 100 | 1 |
| 2 | Account Name | extended-role-21 | distributed-departme-90 | 2023-02-16 | 2023-02-22 | false | 18.90 | 2 | 101 | 2 |
| 3 | Saipan International Airport | integrated-role-22 | baseline-departme-91 | 2024-07-27 | 2024-07-06 | true | 21.85 | 3 | 102 | 3 |
| 4 | Norma Fisher | seasonal-role-23 | pilot-departme-92 | 2025-12-11 | 2025-12-17 | false | 24.80 | 4 | 103 | 4 |

The `employees` table records individual workers within each SME. Each row includes `employee_id`, `full_name`, `role`, `department`, `start_date`, `termination_date`, `is_leader`, `performance_rating`, and foreign keys to `s_m_e_id`, `job_role_id`, and `jurisdiction_id`. The `is_leader` flag distinguishes managerial staff, while `performance_rating` provides a quantitative measure of individual contribution. Employee ID 1, "Theodore Mcgrath," works in adaptive-departme-89, holds the role pilot-role-20, is marked as a leader, and has a performance rating of 15.95. Employee ID 3, "Saipan International Airport," works in baseline-departme-91, holds the role integrated-role-22, is also a leader, and has a higher performance rating of 21.85.

**Table `job_roles`**

| job_role_id | role_id | title | department | required_skills | is_leadership | min_qualifications | salary_range |
|---|---|---|---|---|---|---|---|
| 100 | 2933463 | Compact Initiative | adaptive-departme-89 | legacy-required-37 | true | seasonal-min-77 | distributed-salary-96 |
| 101 | id_3 | Legacy Model | distributed-departme-90 | compact-required-38 | false | regional-min-78 | baseline-salary-97 |
| 102 | gd_taxc_2111 | Regional Cluster A | baseline-departme-91 | composite-required-39 | true | legacy-min-79 | pilot-salary-98 |
| 103 | 994a4fa0-9bad-11eb-a8a2-19ed5c03f8d3 | Seasonal Review | pilot-departme-92 | primary-required-40 | false | compact-min-80 | extended-salary-99 |

Job roles are defined independently in the `job_roles` table, which captures the structure of positions available across the domain. Each row has a `job_role_id`, `role_id`, `title`, `department`, `required_skills`, `is_leadership`, `min_qualifications`, and `salary_range`. The role "Compact Initiative" (job_role_id 100) is a leadership position in adaptive-departme-89 requiring legacy-required-37 skills, with seasonal-min-77 as the minimum qualification and distributed-salary-96 as the salary range. The role "Legacy Model" (job_role_id 101) is non-leadership, in distributed-departme-90, requiring compact-required-38 skills, with regional-min-78 qualifications and baseline-salary-97 compensation.

**Table `market_sectors`**

| id | sector_id | name | industry_classification_code | growth_rate | is_growth_sector | description | jurisdiction_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|
| 1000 | 7119771 | Extended Review | 4447026 | 6.20 | false | Extended Survey | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 1001 | 726049 | Pilot Initiative A | 8843745 | 9.40 | true | Pilot Corridor A | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 1002 | 103175 | Baseline Model | 9125619 | 12.60 | false | Baseline Series | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 1003 | 9125631 | Distributed Cluster | 790487 | 15.80 | true | Distributed Assessment | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Market sectors provide a higher-level classification of economic activity. The `market_sectors` table includes `id`, `sector_id`, `name`, `industry_classification_code`, `growth_rate`, `is_growth_sector`, `description`, `jurisdiction_id`, and timestamps (`created_at`, `updated_at`). Sector ID 1000, "Extended Review," has an industry classification code of 4447026, a growth rate of 6.20 percent, is not flagged as a growth sector, and is described as "Extended Survey." Sector ID 1003, "Distributed Cluster," has a growth rate of 15.80 percent, is flagged as a growth sector, and carries the description "Distributed Assessment."

**Table `jurisdictions`**

| id | jurisdiction_id | name | country_code | region | population | gdp | regulatory_environment | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 8387534 | Extended Review | 2e55e0b6-8fcc-11eb-924d-9cd76263cbd0 | distributed-region-12 | 42 | 23.20 | composite-regulato-57 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | 99654 | Pilot Initiative A | lu_tax_code_template_m_I_2 | baseline-region-13 | 49 | 27.40 | primary-regulato-58 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | lu_tax_code_template_m_I_4 | Baseline Model | default_chart_a_account_57 | pilot-region-14 | 56 | 31.60 | adaptive-regulato-59 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | 1186090 | Distributed Cluster | 727045 | extended-region-15 | 63 | 35.80 | distributed-regulato-60 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Jurisdictions represent the geographic and regulatory contexts in which enterprises operate. The `jurisdictions` table contains `id`, `jurisdiction_id`, `name`, `country_code`, `region`, `population`, `gdp`, `regulatory_environment`, and timestamps. Jurisdiction ID 1, "Extended Review," has a population of 42, a GDP of 23.20, and a regulatory environment classified as composite-regulato-57. Jurisdiction ID 4, "Distributed Cluster," has a population of 63, a GDP of 35.80, and a regulatory environment of distributed-regulato-60.

**Table `surveys`**

| id | survey_id | title | commissioned_by | conducted_by | start_date | end_date | total_respondents | countries_covered | timeframe |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 21005921 | Compact Initiative | composite-commissi-45 | adaptive-conducte-65 | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | 14 | 25 | adaptive-timefram-59 |
| 2 | 726059 | Legacy Model | primary-commissi-46 | distributed-conducte-66 | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | 62 | 34 | distributed-timefram-60 |
| 3 | 32814 | Regional Cluster A | adaptive-commissi-47 | baseline-conducte-67 | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | 5 | 43 | baseline-timefram-61 |
| 4 | b83e028a-8fcd-11eb-924d-9cd76263cbd0 | Seasonal Review | distributed-commissi-48 | pilot-conducte-68 | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | 47 | 52 | pilot-timefram-62 |

Surveys capture the data collection instruments used to gather information about business owners and enterprises. The `surveys` table holds `survey_id`, `survey_name`, `description`, `status`, `created_at`, `updated_at`, and `created_by`. Survey ID 1, "Extended Survey," is described as "Extended Survey," has status "completed," and was created on 2025-01-01. Survey ID 3, "Baseline Series," is described as "Baseline Series," also has status "completed," and was created on 2025-03-11.

The domain uses several junction tables to manage many-to-many relationships and additional linkage layers. The `es_employees` table links SMEs to their employees, `roles_employees` connects job roles to employees, and `sectors_es` associates market sectors with enterprises. The `jurisdictions_es` table links jurisdictions to SMEs, `jurisdictions_owners` links jurisdictions to business owners, and `jurisdictions_employees` links jurisdictions to employees. Finally, `surveys_owners` connects surveys to business owners. These junction tables ensure that the domain can represent complex, multi-directional relationships without redundancy.

**Table `es_employees`**

| s_m_e_id | employee_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

**Table `roles_employees`**

| job_role_id | employee_id |
|---|---|
| 100 | 1 |
| 100 | 2 |
| 101 | 2 |
| 101 | 3 |
| 102 | 3 |
| 102 | 4 |
| 103 | 4 |
| 103 | 1 |

**Table `sectors_es`**

| market_sector_id | s_m_e_id |
|---|---|
| 1000 | 1 |
| 1000 | 2 |
| 1001 | 2 |
| 1001 | 3 |
| 1002 | 3 |
| 1002 | 4 |
| 1003 | 4 |
| 1003 | 1 |

**Table `jurisdictions_es`**

| jurisdiction_id | s_m_e_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

**Table `jurisdictions_owners`**

| jurisdiction_id | business_owner_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

**Table `jurisdictions_employees`**

| jurisdiction_id | employee_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

**Table `surveys_owners`**

| survey_id | business_owner_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

With the base tables and junction tables established, the domain provides a rich set of analytical views that join these records into coherent, query-ready structures. Each view answers a specific class of question by combining data from multiple tables.

**View `vw_s_m_e_market_sector`**

```sql
CREATE VIEW vw_s_m_e_market_sector AS
SELECT a.s_m_e_id, a.enterprise_id, a.name, a.employee_count, b.id AS sector_id, b.sector_id AS sector_sector_id, b.name AS sector_name
FROM s_m_es a JOIN market_sectors b ON a.market_sector_id = b.id;
```

| s_m_e_id | enterprise_id | name | employee_count | sector_id | sector_sector_id | sector_name |
|---|---|---|---|---|---|---|
| 1 | 9568454 | Extended Review | 131 | 1000 | 7119771 | Extended Review |
| 2 | managing-resources | Pilot Initiative A | 428 | 1001 | 726049 | Pilot Initiative A |
| 3 | 974930 | Baseline Model | 3 | 1002 | 103175 | Baseline Model |
| 4 | state_et_11 | Distributed Cluster | 9 | 1003 | 9125631 | Distributed Cluster |

The view `vw_s_m_e_market_sector` joins SMEs with their market sectors, answering the question: "What market sector does each enterprise belong to, and what are the sector's growth characteristics?" In this view, the SME "Extended Review" (s_m_e_id 1) is linked to market sector ID 1000, "Extended Review," which has a growth rate of 6.20 percent and is not a growth sector. The SME "Distributed Cluster" (s_m_e_id 4) is linked to market sector ID 1003, "Distributed Cluster," with a growth rate of 15.80 percent and flagged as a growth sector.

**View `vw_s_m_e_jurisdiction`**

```sql
CREATE VIEW vw_s_m_e_jurisdiction AS
SELECT a.s_m_e_id, a.enterprise_id, a.name, a.employee_count, b.id AS jurisdiction_id, b.jurisdiction_id AS jurisdiction_jurisdiction_id, b.name AS jurisdiction_name
FROM s_m_es a JOIN jurisdictions b ON a.jurisdiction_id = b.id;
```

| s_m_e_id | enterprise_id | name | employee_count | jurisdiction_id | jurisdiction_jurisdiction_id | jurisdiction_name |
|---|---|---|---|---|---|---|
| 1 | 9568454 | Extended Review | 131 | 1 | 8387534 | Extended Review |
| 2 | managing-resources | Pilot Initiative A | 428 | 2 | 99654 | Pilot Initiative A |
| 3 | 974930 | Baseline Model | 3 | 3 | lu_tax_code_template_m_I_4 | Baseline Model |
| 4 | state_et_11 | Distributed Cluster | 9 | 4 | 1186090 | Distributed Cluster |

The view `vw_s_m_e_jurisdiction` joins SMEs with their operating jurisdictions, answering: "In which jurisdiction does each enterprise operate, and what are the jurisdiction's economic indicators?" For s_m_e_id 1, "Extended Review," the jurisdiction is ID 1, "Extended Review," with a population of 42 and GDP of 23.20. For s_m_e_id 4, "Distributed Cluster," the jurisdiction is ID 4, "Distributed Cluster," with a population of 63 and GDP of 35.80.

**View `vw_s_m_e_employee_detail`**

```sql
CREATE VIEW vw_s_m_e_employee_detail AS
SELECT a.s_m_e_id, a.enterprise_id, a.name, b.employee_id AS employee_employee_id, b.full_name AS employee_full_name, b.role AS employee_role
FROM s_m_es a
  JOIN es_employees j ON j.s_m_e_id = a.s_m_e_id
  JOIN employees b ON b.employee_id = j.employee_id;
```

| s_m_e_id | enterprise_id | name | employee_employee_id | employee_full_name | employee_role |
|---|---|---|---|---|---|
| 1 | 9568454 | Extended Review | 1 | Theodore Mcgrath | pilot-role-20 |
| 1 | 9568454 | Extended Review | 2 | Account Name | extended-role-21 |
| 2 | managing-resources | Pilot Initiative A | 2 | Account Name | extended-role-21 |
| 2 | managing-resources | Pilot Initiative A | 3 | Saipan International Airport | integrated-role-22 |
| 3 | 974930 | Baseline Model | 3 | Saipan International Airport | integrated-role-22 |
| 3 | 974930 | Baseline Model | 4 | Norma Fisher | seasonal-role-23 |
| 4 | state_et_11 | Distributed Cluster | 4 | Norma Fisher | seasonal-role-23 |
| 4 | state_et_11 | Distributed Cluster | 1 | Theodore Mcgrath | pilot-role-20 |

The view `vw_s_m_e_employee_detail` brings together SMEs, their employees, and the employees' job roles, answering: "Who works at each enterprise, in what role, and what are the role's characteristics?" Employee ID 1, "Theodore Mcgrath," works at SME ID 1 ("Extended Review") in role pilot-role-20, which is a leadership position in adaptive-departme-89 with a performance rating of 15.95. Employee ID 3, "Saipan International Airport," works at SME ID 3 ("Baseline Model") in role integrated-role-22, also a leadership position in baseline-departme-91 with a performance rating of 21.85.

**View `vw_s_m_e_business_owner`**

```sql
CREATE VIEW vw_s_m_e_business_owner AS
SELECT a.s_m_e_id, a.enterprise_id, a.name, a.employee_count, b.business_owner_id AS owner_business_owner_id, b.owner_id AS owner_owner_id, b.full_name AS owner_full_name
FROM s_m_es a JOIN business_owners b ON a.business_owner_id = b.business_owner_id;
```

| s_m_e_id | enterprise_id | name | employee_count | owner_business_owner_id | owner_owner_id | owner_full_name |
|---|---|---|---|---|---|---|
| 1 | 9568454 | Extended Review | 131 | 1 | Brian Hamilton | Theodore Mcgrath |
| 2 | managing-resources | Pilot Initiative A | 428 | 2 | Kerry West | Account Name |
| 3 | 974930 | Baseline Model | 3 | 3 | Peter Montgomery | Saipan International Airport |
| 4 | state_et_11 | Distributed Cluster | 9 | 4 | Susan Wagner | Norma Fisher |

The view `vw_s_m_e_business_owner` joins SMEs with their business owners, answering: "Who owns each enterprise, and what is the owner's profile?" SME ID 1 ("Extended Review") is owned by business owner ID 1, "Theodore Mcgrath," who is 35 years old with 7 years of experience and no exit plan. SME ID 4 ("Distributed Cluster") is owned by business owner ID 4, "Susan Wagner," who is 50 years old with 16 years of experience and an active exit plan.

**View `vw_business_owner_s_m_e`**

```sql
CREATE VIEW vw_business_owner_s_m_e AS
SELECT a.business_owner_id, a.owner_id, a.full_name, a.generation, b.s_m_e_id AS e_s_m_e_id, b.enterprise_id AS e_enterprise_id, b.name AS e_name
FROM business_owners a JOIN s_m_es b ON a.s_m_e_id = b.s_m_e_id;
```

| business_owner_id | owner_id | full_name | generation | e_s_m_e_id | e_enterprise_id | e_name |
|---|---|---|---|---|---|---|
| 1 | Brian Hamilton | Theodore Mcgrath | compact-generati-62 | 1 | 9568454 | Extended Review |
| 2 | Kerry West | Account Name | composite-generati-63 | 2 | managing-resources | Pilot Initiative A |
| 3 | Peter Montgomery | Saipan International Airport | primary-generati-64 | 3 | 974930 | Baseline Model |
| 4 | Susan Wagner | Norma Fisher | adaptive-generati-65 | 4 | state_et_11 | Distributed Cluster |

The view `vw_business_owner_s_m_e` reverses the perspective, starting from business owners and joining to their enterprises. It answers: "What enterprise is each business owner associated with, and what are the enterprise's metrics?" Business owner ID 1, "Theodore Mcgrath," is associated with SME ID 1 ("Extended Review"), which has 131 employees and annual revenue of 12,608. Business owner ID 3, "Peter Montgomery," is associated with SME ID 3 ("Baseline Model"), which has 3 employees and annual revenue of 16,254.

**View `vw_business_owner_jurisdiction`**

```sql
CREATE VIEW vw_business_owner_jurisdiction AS
SELECT a.business_owner_id, a.owner_id, a.full_name, a.generation, b.id AS jurisdiction_id, b.jurisdiction_id AS jurisdiction_jurisdiction_id, b.name AS jurisdiction_name
FROM business_owners a JOIN jurisdictions b ON a.jurisdiction_id = b.id;
```

| business_owner_id | owner_id | full_name | generation | jurisdiction_id | jurisdiction_jurisdiction_id | jurisdiction_name |
|---|---|---|---|---|---|---|
| 1 | Brian Hamilton | Theodore Mcgrath | compact-generati-62 | 1 | 8387534 | Extended Review |
| 2 | Kerry West | Account Name | composite-generati-63 | 2 | 99654 | Pilot Initiative A |
| 3 | Peter Montgomery | Saipan International Airport | primary-generati-64 | 3 | lu_tax_code_template_m_I_4 | Baseline Model |
| 4 | Susan Wagner | Norma Fisher | adaptive-generati-65 | 4 | 1186090 | Distributed Cluster |

The view `vw_business_owner_jurisdiction` joins business owners with their jurisdictions, answering: "In which jurisdiction does each business owner operate?" Business owner ID 1, "Theodore Mcgrath," operates in jurisdiction ID 1 ("Extended Review"), which has a population of 42 and GDP of 23.20. Business owner ID 4, "Susan Wagner," operates in jurisdiction ID 4 ("Distributed Cluster"), with a population of 63 and GDP of 35.80.

**View `vw_business_owner_survey`**

```sql
CREATE VIEW vw_business_owner_survey AS
SELECT a.business_owner_id, a.owner_id, a.full_name, a.generation, b.id AS survey_id, b.survey_id AS survey_survey_id, b.title AS survey_title
FROM business_owners a JOIN surveys b ON a.survey_id = b.id;
```

| business_owner_id | owner_id | full_name | generation | survey_id | survey_survey_id | survey_title |
|---|---|---|---|---|---|---|
| 1 | Brian Hamilton | Theodore Mcgrath | compact-generati-62 | 1 | 21005921 | Compact Initiative |
| 2 | Kerry West | Account Name | composite-generati-63 | 2 | 726059 | Legacy Model |
| 3 | Peter Montgomery | Saipan International Airport | primary-generati-64 | 3 | 32814 | Regional Cluster A |
| 4 | Susan Wagner | Norma Fisher | adaptive-generati-65 | 4 | b83e028a-8fcd-11eb-924d-9cd76263cbd0 | Seasonal Review |

The view `vw_business_owner_survey` joins business owners with the surveys under which their data was collected, answering: "Which survey instrument captured each owner's information?" Business owner ID 1, "Theodore Mcgrath," was captured under survey ID 1 ("Extended Survey"), which has status "completed." Business owner ID 3, "Peter Montgomery," was captured under survey ID 3 ("Baseline Series"), also with status "completed."

**View `vw_employee_s_m_e`**

```sql
CREATE VIEW vw_employee_s_m_e AS
SELECT a.employee_id, a.full_name, a.role, a.department, b.s_m_e_id AS e_s_m_e_id, b.enterprise_id AS e_enterprise_id, b.name AS e_name
FROM employees a JOIN s_m_es b ON a.s_m_e_id = b.s_m_e_id;
```

| employee_id | full_name | role | department | e_s_m_e_id | e_enterprise_id | e_name |
|---|---|---|---|---|---|---|
| 1 | Theodore Mcgrath | pilot-role-20 | adaptive-departme-89 | 1 | 9568454 | Extended Review |
| 2 | Account Name | extended-role-21 | distributed-departme-90 | 2 | managing-resources | Pilot Initiative A |
| 3 | Saipan International Airport | integrated-role-22 | baseline-departme-91 | 3 | 974930 | Baseline Model |
| 4 | Norma Fisher | seasonal-role-23 | pilot-departme-92 | 4 | state_et_11 | Distributed Cluster |

The view `vw_employee_s_m_e` joins employees with their SMEs, answering: "Which enterprise employs each worker?" Employee ID 1, "Theodore Mcgrath," is employed by SME ID 1 ("Extended Review"). Employee ID 4, "Norma Fisher," is employed by SME ID 4 ("Distributed Cluster").

**View `vw_employee_job_role`**

```sql
CREATE VIEW vw_employee_job_role AS
SELECT a.employee_id, a.full_name, a.role, a.department, b.job_role_id AS role_job_role_id, b.role_id AS role_role_id, b.title AS role_title
FROM employees a JOIN job_roles b ON a.job_role_id = b.job_role_id;
```

| employee_id | full_name | role | department | role_job_role_id | role_role_id | role_title |
|---|---|---|---|---|---|---|
| 1 | Theodore Mcgrath | pilot-role-20 | adaptive-departme-89 | 100 | 2933463 | Compact Initiative |
| 2 | Account Name | extended-role-21 | distributed-departme-90 | 101 | id_3 | Legacy Model |
| 3 | Saipan International Airport | integrated-role-22 | baseline-departme-91 | 102 | gd_taxc_2111 | Regional Cluster A |
| 4 | Norma Fisher | seasonal-role-23 | pilot-departme-92 | 103 | 994a4fa0-9bad-11eb-a8a2-19ed5c03f8d3 | Seasonal Review |

The view `vw_employee_job_role` joins employees with their job roles, answering: "What is the role profile of each employee?" Employee ID 1, "Theodore Mcgrath," holds role ID 100 ("Compact Initiative"), a leadership position in adaptive-departme-89 with required skills legacy-required-37. Employee ID 2, "Account Name," holds role ID 101 ("Legacy Model"), a non-leadership position in distributed-departme-90 with required skills compact-required-38.

**View `vw_employee_jurisdiction`**

```sql
CREATE VIEW vw_employee_jurisdiction AS
SELECT a.employee_id, a.full_name, a.role, a.department, b.id AS jurisdiction_id, b.jurisdiction_id AS jurisdiction_jurisdiction_id, b.name AS jurisdiction_name
FROM employees a JOIN jurisdictions b ON a.jurisdiction_id = b.id;
```

| employee_id | full_name | role | department | jurisdiction_id | jurisdiction_jurisdiction_id | jurisdiction_name |
|---|---|---|---|---|---|---|
| 1 | Theodore Mcgrath | pilot-role-20 | adaptive-departme-89 | 1 | 8387534 | Extended Review |
| 2 | Account Name | extended-role-21 | distributed-departme-90 | 2 | 99654 | Pilot Initiative A |
| 3 | Saipan International Airport | integrated-role-22 | baseline-departme-91 | 3 | lu_tax_code_template_m_I_4 | Baseline Model |
| 4 | Norma Fisher | seasonal-role-23 | pilot-departme-92 | 4 | 1186090 | Distributed Cluster |

The view `vw_employee_jurisdiction` joins employees with their jurisdictions, answering: "In which jurisdiction does each employee work?" Employee ID 1, "Theodore Mcgrath," works in jurisdiction ID 1 ("Extended Review"). Employee ID 4, "Norma Fisher," works in jurisdiction ID 4 ("Distributed Cluster").

**View `vw_job_role_employee_detail`**

```sql
CREATE VIEW vw_job_role_employee_detail AS
SELECT a.job_role_id, a.role_id, a.title, b.employee_id AS employee_employee_id, b.full_name AS employee_full_name, b.role AS employee_role
FROM job_roles a
  JOIN roles_employees j ON j.job_role_id = a.job_role_id
  JOIN employees b ON b.employee_id = j.employee_id;
```

| job_role_id | role_id | title | employee_employee_id | employee_full_name | employee_role |
|---|---|---|---|---|---|
| 100 | 2933463 | Compact Initiative | 1 | Theodore Mcgrath | pilot-role-20 |
| 100 | 2933463 | Compact Initiative | 2 | Account Name | extended-role-21 |
| 101 | id_3 | Legacy Model | 2 | Account Name | extended-role-21 |
| 101 | id_3 | Legacy Model | 3 | Saipan International Airport | integrated-role-22 |
| 102 | gd_taxc_2111 | Regional Cluster A | 3 | Saipan International Airport | integrated-role-22 |
| 102 | gd_taxc_2111 | Regional Cluster A | 4 | Norma Fisher | seasonal-role-23 |
| 103 | 994a4fa0-9bad-11eb-a8a2-19ed5c03f8d3 | Seasonal Review | 4 | Norma Fisher | seasonal-role-23 |
| 103 | 994a4fa0-9bad-11eb-a8a2-19ed5c03f8d3 | Seasonal Review | 1 | Theodore Mcgrath | pilot-role-20 |

The view `vw_job_role_employee_detail` starts from job roles and joins to the employees who hold them, answering: "Which employees occupy each role, and what are their performance metrics?" Role ID 100 ("Compact Initiative") is held by employee ID 1, "Theodore Mcgrath," with a performance rating of 15.95. Role ID 102 ("Regional Cluster A") is held by employee ID 3, "Saipan International Airport," with a performance rating of 21.85.

**View `vw_market_sector_s_m_e_detail`**

```sql
CREATE VIEW vw_market_sector_s_m_e_detail AS
SELECT a.id, a.sector_id, a.name, b.s_m_e_id AS e_s_m_e_id, b.enterprise_id AS e_enterprise_id, b.name AS e_name
FROM market_sectors a
  JOIN sectors_es j ON j.market_sector_id = a.id
  JOIN s_m_es b ON b.s_m_e_id = j.s_m_e_id;
```

| id | sector_id | name | e_s_m_e_id | e_enterprise_id | e_name |
|---|---|---|---|---|---|
| 1000 | 7119771 | Extended Review | 1 | 9568454 | Extended Review |
| 1000 | 7119771 | Extended Review | 2 | managing-resources | Pilot Initiative A |
| 1001 | 726049 | Pilot Initiative A | 2 | managing-resources | Pilot Initiative A |
| 1001 | 726049 | Pilot Initiative A | 3 | 974930 | Baseline Model |
| 1002 | 103175 | Baseline Model | 3 | 974930 | Baseline Model |
| 1002 | 103175 | Baseline Model | 4 | state_et_11 | Distributed Cluster |
| 1003 | 9125631 | Distributed Cluster | 4 | state_et_11 | Distributed Cluster |
| 1003 | 9125631 | Distributed Cluster | 1 | 9568454 | Extended Review |

The view `vw_market_sector_s_m_e_detail` joins market sectors with the SMEs in each sector, answering: "Which enterprises operate within each market sector, and what are their operational metrics?" Market sector ID 1000 ("Extended Review") contains SME ID 1 ("Extended Review"), which has 131 employees and annual revenue of 12,608. Market sector ID 1003 ("Distributed Cluster") contains SME ID 4 ("Distributed Cluster"), which has 9 employees and annual revenue of 745,000.

**View `vw_market_sector_jurisdiction`**

```sql
CREATE VIEW vw_market_sector_jurisdiction AS
SELECT a.id, a.sector_id, a.name, a.industry_classification_code, b.id AS jurisdiction_id, b.jurisdiction_id AS jurisdiction_jurisdiction_id, b.name AS jurisdiction_name
FROM market_sectors a JOIN jurisdictions b ON a.jurisdiction_id = b.id;
```

| id | sector_id | name | industry_classification_code | jurisdiction_id | jurisdiction_jurisdiction_id | jurisdiction_name |
|---|---|---|---|---|---|---|
| 1000 | 7119771 | Extended Review | 4447026 | 1 | 8387534 | Extended Review |
| 1001 | 726049 | Pilot Initiative A | 8843745 | 2 | 99654 | Pilot Initiative A |
| 1002 | 103175 | Baseline Model | 9125619 | 3 | lu_tax_code_template_m_I_4 | Baseline Model |
| 1003 | 9125631 | Distributed Cluster | 790487 | 4 | 1186090 | Distributed Cluster |

The view `vw_market_sector_jurisdiction` joins market sectors with their jurisdictions, answering: "In which jurisdiction does each market sector operate?" Market sector ID 1000 ("Extended Review") operates in jurisdiction ID 1 ("Extended Review"), with population 42 and GDP 23.20. Market sector ID 1003 ("Distributed Cluster") operates in jurisdiction ID 4 ("Distributed Cluster"), with population 63 and GDP 35.80.

**View `vw_jurisdiction_s_m_e_detail`**

```sql
CREATE VIEW vw_jurisdiction_s_m_e_detail AS
SELECT a.id, a.jurisdiction_id, a.name, b.s_m_e_id AS e_s_m_e_id, b.enterprise_id AS e_enterprise_id, b.name AS e_name
FROM jurisdictions a
  JOIN jurisdictions_es j ON j.jurisdiction_id = a.id
  JOIN s_m_es b ON b.s_m_e_id = j.s_m_e_id;
```

| id | jurisdiction_id | name | e_s_m_e_id | e_enterprise_id | e_name |
|---|---|---|---|---|---|
| 1 | 8387534 | Extended Review | 1 | 9568454 | Extended Review |
| 1 | 8387534 | Extended Review | 2 | managing-resources | Pilot Initiative A |
| 2 | 99654 | Pilot Initiative A | 2 | managing-resources | Pilot Initiative A |
| 2 | 99654 | Pilot Initiative A | 3 | 974930 | Baseline Model |
| 3 | lu_tax_code_template_m_I_4 | Baseline Model | 3 | 974930 | Baseline Model |
| 3 | lu_tax_code_template_m_I_4 | Baseline Model | 4 | state_et_11 | Distributed Cluster |
| 4 | 1186090 | Distributed Cluster | 4 | state_et_11 | Distributed Cluster |
| 4 | 1186090 | Distributed Cluster | 1 | 9568454 | Extended Review |

The view `vw_jurisdiction_s_m_e_detail` joins jurisdictions with the SMEs operating within them, answering: "Which enterprises are present in each jurisdiction, and how do they compare?" Jurisdiction ID 1 ("Extended Review") hosts SME ID 1 ("Extended Review"), a 131-employee firm with annual revenue of 12,608. Jurisdiction ID 4 ("Distributed Cluster") hosts SME ID 4 ("Distributed Cluster"), a 9-employee firm with annual revenue of 745,000.

**View `vw_jurisdiction_business_owner_detail`**

```sql
CREATE VIEW vw_jurisdiction_business_owner_detail AS
SELECT a.id, a.jurisdiction_id, a.name, b.business_owner_id AS owner_business_owner_id, b.owner_id AS owner_owner_id, b.full_name AS owner_full_name
FROM jurisdictions a
  JOIN jurisdictions_owners j ON j.jurisdiction_id = a.id
  JOIN business_owners b ON b.business_owner_id = j.business_owner_id;
```

| id | jurisdiction_id | name | owner_business_owner_id | owner_owner_id | owner_full_name |
|---|---|---|---|---|---|
| 1 | 8387534 | Extended Review | 1 | Brian Hamilton | Theodore Mcgrath |
| 1 | 8387534 | Extended Review | 2 | Kerry West | Account Name |
| 2 | 99654 | Pilot Initiative A | 2 | Kerry West | Account Name |
| 2 | 99654 | Pilot Initiative A | 3 | Peter Montgomery | Saipan International Airport |
| 3 | lu_tax_code_template_m_I_4 | Baseline Model | 3 | Peter Montgomery | Saipan International Airport |
| 3 | lu_tax_code_template_m_I_4 | Baseline Model | 4 | Susan Wagner | Norma Fisher |
| 4 | 1186090 | Distributed Cluster | 4 | Susan Wagner | Norma Fisher |
| 4 | 1186090 | Distributed Cluster | 1 | Brian Hamilton | Theodore Mcgrath |

The view `vw_jurisdiction_business_owner_detail` joins jurisdictions with the business owners operating within them, answering: "Who are the business owners in each jurisdiction, and what are their profiles?" Jurisdiction ID 1 ("Extended Review") includes business owner ID 1, "Theodore Mcgrath," age 35 with 7 years of experience. Jurisdiction ID 4 ("Distributed Cluster") includes business owner ID 4, "Susan Wagner," age 50 with 16 years of experience.

**View `vw_jurisdiction_employee_detail`**

```sql
CREATE VIEW vw_jurisdiction_employee_detail AS
SELECT a.id, a.jurisdiction_id, a.name, b.employee_id AS employee_employee_id, b.full_name AS employee_full_name, b.role AS employee_role
FROM jurisdictions a
  JOIN jurisdictions_employees j ON j.jurisdiction_id = a.id
  JOIN employees b ON b.employee_id = j.employee_id;
```

| id | jurisdiction_id | name | employee_employee_id | employee_full_name | employee_role |
|---|---|---|---|---|---|
| 1 | 8387534 | Extended Review | 1 | Theodore Mcgrath | pilot-role-20 |
| 1 | 8387534 | Extended Review | 2 | Account Name | extended-role-21 |
| 2 | 99654 | Pilot Initiative A | 2 | Account Name | extended-role-21 |
| 2 | 99654 | Pilot Initiative A | 3 | Saipan International Airport | integrated-role-22 |
| 3 | lu_tax_code_template_m_I_4 | Baseline Model | 3 | Saipan International Airport | integrated-role-22 |
| 3 | lu_tax_code_template_m_I_4 | Baseline Model | 4 | Norma Fisher | seasonal-role-23 |
| 4 | 1186090 | Distributed Cluster | 4 | Norma Fisher | seasonal-role-23 |
| 4 | 1186090 | Distributed Cluster | 1 | Theodore Mcgrath | pilot-role-20 |

The view `vw_jurisdiction_employee_detail` joins jurisdictions with the employees working within them, answering: "Who are the employees in each jurisdiction, and what are their role and performance details?" Jurisdiction ID 1 ("Extended Review") includes employee ID 1, "Theodore Mcgrath," in role pilot-role-20 with a performance rating of 15.95. Jurisdiction ID 4 ("Distributed Cluster") includes employee ID 4, "Norma Fisher," in role seasonal-role-23 with a performance rating of 24.80.

**View `vw_survey_business_owner_detail`**

```sql
CREATE VIEW vw_survey_business_owner_detail AS
SELECT a.id, a.survey_id, a.title, b.business_owner_id AS owner_business_owner_id, b.owner_id AS owner_owner_id, b.full_name AS owner_full_name
FROM surveys a
  JOIN surveys_owners j ON j.survey_id = a.id
  JOIN business_owners b ON b.business_owner_id = j.business_owner_id;
```

| id | survey_id | title | owner_business_owner_id | owner_owner_id | owner_full_name |
|---|---|---|---|---|---|
| 1 | 21005921 | Compact Initiative | 1 | Brian Hamilton | Theodore Mcgrath |
| 1 | 21005921 | Compact Initiative | 2 | Kerry West | Account Name |
| 2 | 726059 | Legacy Model | 2 | Kerry West | Account Name |
| 2 | 726059 | Legacy Model | 3 | Peter Montgomery | Saipan International Airport |
| 3 | 32814 | Regional Cluster A | 3 | Peter Montgomery | Saipan International Airport |
| 3 | 32814 | Regional Cluster A | 4 | Susan Wagner | Norma Fisher |
| 4 | b83e028a-8fcd-11eb-924d-9cd76263cbd0 | Seasonal Review | 4 | Susan Wagner | Norma Fisher |
| 4 | b83e028a-8fcd-11eb-924d-9cd76263cbd0 | Seasonal Review | 1 | Brian Hamilton | Theodore Mcgrath |

The view `vw_survey_business_owner_detail` joins surveys with the business owners whose data was collected under them, answering: "Which business owners were surveyed, and what are their enterprise and jurisdiction details?" Survey ID 1 ("Extended Survey") includes business owner ID 1, "Theodore Mcgrath," who owns SME ID 1 ("Extended Review") in jurisdiction ID 1 ("Extended Review"). Survey ID 3 ("Baseline Series") includes business owner ID 3, "Peter Montgomery," who owns SME ID 3 ("Baseline Model") in jurisdiction ID 3 ("Baseline Model").

The domain's structure — base tables capturing discrete entities, junction tables managing many-to-many relationships, and composite views synthesizing cross-entity information — provides a comprehensive framework for analyzing the SME ecosystem. Analysts can drill down from high-level jurisdictional or sectoral trends to individual employee performance, or roll up from a single business owner's profile to the economic characteristics of their entire market sector. The consistency of foreign-key linkages across all tables ensures that every analytical question, whether about workforce composition, regulatory environment, or market growth, can be answered from a single, coherent data model.