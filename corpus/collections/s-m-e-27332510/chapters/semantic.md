## Domain Modelling and Relational Materialization

The domain under examination captures the interlocking relationships among small and medium enterprises (SMEs), their business owners, employees, job roles, market sectors, jurisdictions, and surveys. At its core, the model treats an SME as the central entity—each record in `s_m_es` represents a distinct enterprise with attributes such as `employee_count`, `annual_revenue`, `sector`, `country_of_operation`, `is_publicly_traded`, and `founding_date`. Consider the first row: `s_m_e_id` 1 identifies "Extended Review," an adaptive-sector enterprise operating in `pilot-country-50` with 131 employees and annual revenue of 12,608, founded on 2023-06-24 and not publicly traded. The second row, "Pilot Initiative A," is a larger distributed-sector enterprise with 428 employees, 56,418 in annual revenue, and a true `is_publicly_traded` flag. The model deliberately separates concerns: market-sector metadata, jurisdictional context, and human-capital data each occupy their own tables, linked through foreign keys and junction tables that enforce many-to-many cardinality.

**Table `s_m_es`**

| s_m_e_id | enterprise_id | name | employee_count | annual_revenue | sector | country_of_operation | is_publicly_traded | founding_date | market_sector_id | jurisdiction_id | business_owner_id |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 9568454 | Extended Review | 131 | 12,608 | adaptive-sector-53 | pilot-country-50 | false | 2023-06-24 | 1000 | 1 | 1 |
| 2 | managing-resources | Pilot Initiative A | 428 | 56,418 | distributed-sector-54 | extended-country-51 | true | 2024-11-08 | 1001 | 2 | 2 |
| 3 | 974930 | Baseline Model | 3 | 16,254 | baseline-sector-55 | integrated-country-52 | false | 2025-04-19 | 1002 | 3 | 3 |
| 4 | state_et_11 | Distributed Cluster | 9 | 745,000 | pilot-sector-56 | seasonal-country-53 | true | 2022-09-03 | 1003 | 4 | 4 |

The `s_m_es` table anchors the schema with three foreign keys: `market_sector_id` references `market_sectors.id`, `jurisdiction_id` references `jurisdictions.id`, and `business_owner_id` references `business_owners.business_owner_id`. These FKs establish the primary one-to-many relationships that the model relies on. An SME belongs to exactly one market sector, operates within exactly one jurisdiction, and is owned by exactly one business owner. The `enterprise_id` column (e.g., `9568454` for "Extended Review") serves as an external identifier, while `s_m_e_id` is the internal surrogate key.

**Table `market_sectors`**

| id | sector_id | name | industry_classification_code | growth_rate | is_growth_sector | description | jurisdiction_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|
| 1000 | 7119771 | Extended Review | 4447026 | 6.20 | false | Extended Survey | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 1001 | 726049 | Pilot Initiative A | 8843745 | 9.40 | true | Pilot Corridor A | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 1002 | 103175 | Baseline Model | 9125619 | 12.60 | false | Baseline Series | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 1003 | 9125631 | Distributed Cluster | 790487 | 15.80 | true | Distributed Assessment | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The `market_sectors` table stores sector-level metadata including `name`, `industry_classification_code`, `growth_rate`, `is_growth_sector`, and `description`. Each sector is itself associated with a jurisdiction via `jurisdiction_id`, reflecting the observation that market sectors are geographically bounded. For instance, sector 1000 ("Extended Review") has a growth rate of 6.20, is classified under code 4447026, and is not flagged as a growth sector; it resides in jurisdiction 1. Sector 1001 ("Pilot Initiative A") boasts a 9.40 growth rate and is marked as a growth sector, residing in jurisdiction 2. The `created_at` and `updated_at` timestamps provide an audit trail for sector metadata changes.

**Table `jurisdictions`**

| id | jurisdiction_id | name | country_code | region | population | gdp | regulatory_environment | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 8387534 | Extended Review | 2e55e0b6-8fcc-11eb-924d-9cd76263cbd0 | distributed-region-12 | 42 | 23.20 | composite-regulato-57 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | 99654 | Pilot Initiative A | lu_tax_code_template_m_I_2 | baseline-region-13 | 49 | 27.40 | primary-regulato-58 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | lu_tax_code_template_m_I_4 | Baseline Model | default_chart_a_account_57 | pilot-region-14 | 56 | 31.60 | adaptive-regulato-59 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | 1186090 | Distributed Cluster | 727045 | extended-region-15 | 63 | 35.80 | distributed-regulato-60 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Jurisdictions represent the geographic and regulatory context in which enterprises operate. The `jurisdictions` table carries `name`, `country_code`, `region`, `population`, `gdp`, and `regulatory_environment`. Jurisdiction 1, named "Extended Review," has a population of 42, a GDP of 23.20, and a `composite-regulato-57` regulatory environment. Jurisdiction 4, "Distributed Cluster," is the largest with a population of 63 and GDP of 35.80, operating under `distributed-regulato-60`. Like market sectors, jurisdictions maintain `created_at` and `updated_at` timestamps.

**Table `business_owners`**

| business_owner_id | owner_id | full_name | generation | age | title | years_of_experience | exit_plan | exit_timeframe | s_m_e_id | jurisdiction_id | survey_id |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | Brian Hamilton | Theodore Mcgrath | compact-generati-62 | 35 | Compact Initiative | 7 | false | 26 | 1 | 1 | 1 |
| 2 | Kerry West | Account Name | composite-generati-63 | 40 | Legacy Model | 10 | true | 35 | 2 | 2 | 2 |
| 3 | Peter Montgomery | Saipan International Airport | primary-generati-64 | 45 | Regional Cluster A | 13 | false | 44 | 3 | 3 | 3 |
| 4 | Susan Wagner | Norma Fisher | adaptive-generati-65 | 50 | Seasonal Review | 16 | true | 53 | 4 | 4 | 4 |

Business owners are captured in `business_owners`, which stores `full_name`, `generation`, `age`, `title`, `years_of_experience`, `exit_plan`, and `exit_timeframe`. The first owner, "Theodore Mcgrath," is 35 years old, holds the title "Compact Initiative," has 7 years of experience, and has not set an exit plan (`exit_plan` is false) with an `exit_timeframe` of 26. The fourth owner, "Susan Wagner," is 50, titled "Seasonal Review," has 16 years of experience, has an exit plan in place, and targets an exit timeframe of 53. Each owner is linked to an SME via `s_m_e_id`, to a jurisdiction via `jurisdiction_id`, and to a survey via `survey_id`.

**Table `employees`**

| employee_id | full_name | role | department | start_date | termination_date | is_leader | performance_rating | s_m_e_id | job_role_id | jurisdiction_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | Theodore Mcgrath | pilot-role-20 | adaptive-departme-89 | 2022-09-05 | 2022-09-11 | true | 15.95 | 1 | 100 | 1 |
| 2 | Account Name | extended-role-21 | distributed-departme-90 | 2023-02-16 | 2023-02-22 | false | 18.90 | 2 | 101 | 2 |
| 3 | Saipan International Airport | integrated-role-22 | baseline-departme-91 | 2024-07-27 | 2024-07-06 | true | 21.85 | 3 | 102 | 3 |
| 4 | Norma Fisher | seasonal-role-23 | pilot-departme-92 | 2025-12-11 | 2025-12-17 | false | 24.80 | 4 | 103 | 4 |

Employees form a parallel human-capital dimension. The `employees` table records `full_name`, `role`, `department`, `start_date`, `termination_date`, `is_leader`, `performance_rating`, and foreign keys to `s_m_e_id`, `job_role_id`, and `jurisdiction_id`. Employee 1, "Theodore Mcgrath," works in `adaptive-departme-89` under `pilot-role-20`, is a leader (`is_leader` is true), and has a performance rating of 15.95. Employee 3, "Saipan International Airport," is also a leader with a higher performance rating of 21.85, working in `baseline-departme-91` under `integrated-role-22`. The `termination_date` column allows for historical tracking of departed employees.

**Table `job_roles`**

| job_role_id | role_id | title | department | required_skills | is_leadership | min_qualifications | salary_range |
|---|---|---|---|---|---|---|---|
| 100 | 2933463 | Compact Initiative | adaptive-departme-89 | legacy-required-37 | true | seasonal-min-77 | distributed-salary-96 |
| 101 | id_3 | Legacy Model | distributed-departme-90 | compact-required-38 | false | regional-min-78 | baseline-salary-97 |
| 102 | gd_taxc_2111 | Regional Cluster A | baseline-departme-91 | composite-required-39 | true | legacy-min-79 | pilot-salary-98 |
| 103 | 994a4fa0-9bad-11eb-a8a2-19ed5c03f8d3 | Seasonal Review | pilot-departme-92 | primary-required-40 | false | compact-min-80 | extended-salary-99 |

Job roles are defined independently in `job_roles`, which stores `title`, `department`, `required_skills`, `is_leadership`, `min_qualifications`, and `salary_range`. Role 100, titled "Compact Initiative," is a leadership position (`is_leadership` is true) requiring `legacy-required-37` skills, with `seasonal-min-77` as minimum qualifications and `distributed-salary-96` as the salary range. Role 101, "Legacy Model," is non-leadership and requires `compact-required-38` skills. The separation of role definitions from individual employees enables the model to support role reassignment and historical tracking.

The model employs a rich set of junction tables to resolve many-to-many relationships that the base tables cannot express through simple foreign keys alone. The `es_employees` junction table links SMEs to employees, allowing an employee to be associated with multiple enterprises and an enterprise to employ multiple workers. The `roles_employees` table connects job roles to employees, supporting the scenario where an employee may hold multiple roles over time or simultaneously. The `sectors_es` table links market sectors to SMEs, reflecting that a sector may encompass multiple enterprises. The `jurisdictions_es` table associates jurisdictions with SMEs, capturing the possibility that an enterprise operates across multiple jurisdictions.

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

Additional junction tables extend the jurisdictional and survey relationships. The `jurisdictions_owners` table links jurisdictions to business owners, `jurisdictions_employees` links jurisdictions to employees, and `surveys_owners` links surveys to business owners. These junctions reflect the observation that the model treats jurisdictional and survey associations as potentially many-to-many, even though the base tables also carry direct FK columns — the junction tables provide an explicit, auditable record of these associations.

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

The materialized views in this schema serve as denormalized lenses that reconstruct domain facts from the normalized base tables. Each view answers a specific analytical question by joining the relevant tables and projecting a coherent set of columns.

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

The view `vw_s_m_e_market_sector` joins `s_m_es` with `market_sectors` to answer the question: "What market sector does each SME belong to, and what are the sector's characteristics?" For the first row, the view would show "Extended Review" (SME) alongside sector 1000 ("Extended Review") with a growth rate of 6.20 and industry code 4447026. This view is useful for sector-level analytics, such as comparing SME performance across sectors.

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

`vw_s_m_e_jurisdiction` joins `s_m_es` with `jurisdictions` to answer: "In which jurisdiction does each SME operate, and what is the jurisdiction's economic profile?" The first row would pair "Extended Review" (SME) with jurisdiction 1 ("Extended Review"), population 42, GDP 23.20, and regulatory environment `composite-regulato-57`. This view supports geographic and regulatory analysis of the SME portfolio.

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

`vw_s_m_e_employee_detail` joins `s_m_es` with `employees` to answer: "Which employees work at each SME, and what are their employment details?" The first row would show "Extended Review" alongside employee "Theodore Mcgrath," role `pilot-role-20`, department `adaptive-departme-89`, a performance rating of 15.95, and leader status. This view is essential for human-capital reporting at the enterprise level.

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

`vw_s_m_e_business_owner` joins `s_m_es` with `business_owners` to answer: "Who owns each SME, and what is the owner's profile?" The first row would pair "Extended Review" with owner "Theodore Mcgrath," age 35, 7 years of experience, and no exit plan. This view supports ownership analysis and succession planning.

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

`vw_business_owner_s_m_e` reverses the perspective, joining `business_owners` with `s_m_es` to answer: "Which SMEs does each business owner operate?" The first row would show "Theodore Mcgrath" alongside "Extended Review," with 131 employees and annual revenue of 12,608. This view is useful for portfolio-level analysis from the owner's perspective.

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

`vw_business_owner_jurisdiction` joins `business_owners` with `jurisdictions` to answer: "In which jurisdictions does each business owner operate?" The first row would pair "Theodore Mcgrath" with jurisdiction 1 ("Extended Review"), population 42, and GDP 23.20. This view supports geographic diversification analysis for owners.

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

`vw_business_owner_survey` joins `business_owners` with `surveys` to answer: "Which surveys has each business owner participated in?" The first row would show "Theodore Mcgrath" alongside the survey associated with `survey_id` 1. This view supports survey participation tracking and compliance reporting.

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

`vw_employee_s_m_e` joins `employees` with `s_m_es` to answer: "Which SME does each employee work for?" The first row would show "Theodore Mcgrath" (employee) working at "Extended Review" (SME), with 131 employees and annual revenue of 12,608. This view supports enterprise-level headcount and revenue attribution.

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

`vw_employee_job_role` joins `employees` with `job_roles` to answer: "What job role does each employee hold, and what are the role's requirements?" The first row would pair "Theodore Mcgrath" with role 100 ("Compact Initiative"), department `adaptive-departme-89`, leadership status true, and salary range `distributed-salary-96`. This view is essential for role compliance and compensation analysis.

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

`vw_employee_jurisdiction` joins `employees` with `jurisdictions` to answer: "In which jurisdiction does each employee operate?" The first row would show "Theodore Mcgrath" in jurisdiction 1 ("Extended Review"), population 42, GDP 23.20. This view supports geographic workforce distribution analysis.

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

`vw_job_role_employee_detail` joins `job_roles` with `employees` to answer: "Which employees hold each job role, and what are their performance metrics?" The first row would show role 100 ("Compact Initiative") alongside employee "Theodore Mcgrath," performance rating 15.95, and leader status. This view supports role-level performance benchmarking.

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

`vw_market_sector_s_m_e_detail` joins `market_sectors` with `s_m_es` to answer: "Which SMEs belong to each market sector, and what are their operational metrics?" The first row would pair sector 1000 ("Extended Review") with SME "Extended Review," 131 employees, and revenue of 12,608. This view supports sector-level enterprise aggregation.

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

`vw_market_sector_jurisdiction` joins `market_sectors` with `jurisdictions` to answer: "Which jurisdiction hosts each market sector?" The first row would show sector 1000 ("Extended Review") in jurisdiction 1 ("Extended Review"), population 42, GDP 23.20. This view supports sector-jurisdiction mapping for regulatory and economic analysis.

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

`vw_jurisdiction_s_m_e_detail` joins `jurisdictions` with `s_m_es` to answer: "Which SMEs operate in each jurisdiction, and what are their characteristics?" The first row would pair jurisdiction 1 ("Extended Review") with SME "Extended Review," 131 employees, revenue 12,608, and founding date 2023-06-24. This view supports jurisdiction-level enterprise portfolio analysis.

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

`vw_jurisdiction_business_owner_detail` joins `jurisdictions` with `business_owners` to answer: "Which business owners operate in each jurisdiction?" The first row would show jurisdiction 1 ("Extended Review") alongside owner "Theodore Mcgrath," age 35, 7 years of experience, and title "Compact Initiative." This view supports jurisdiction-level ownership analysis.

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

`vw_jurisdiction_employee_detail` joins `jurisdictions` with `employees` to answer: "Which employees work in each jurisdiction?" The first row would pair jurisdiction 1 ("Extended Review") with employee "Theodore Mcgrath," role `pilot-role-20`, department `adaptive-departme-89`, and performance rating 15.95. This view supports jurisdiction-level workforce analysis.

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

`vw_survey_business_owner_detail` joins `surveys` with `business_owners` to answer: "Which business owners participated in each survey?" The first row would show survey 1 alongside owner "Theodore Mcgrath," age 35, 7 years of experience, and title "Compact Initiative." This view supports survey participation tracking and owner-level survey analytics.

The relational schema presented here demonstrates a disciplined approach to domain modelling: entities are separated by concern (enterprise, owner, employee, role, sector, jurisdiction, survey), relationships are expressed through explicit foreign keys where cardinality is bounded, and many-to-many associations are materialized through dedicated junction tables. The views then provide denormalized projections that answer specific analytical questions without requiring ad-hoc joins. This separation of normalized storage from denormalized access patterns supports both data integrity and query performance. The model accommodates the full complexity of the SME ecosystem — from individual employee performance ratings to jurisdiction-level GDP figures — while maintaining a clear, auditable structure that maps directly to the underlying domain concepts.

## Data appendix

**Table `surveys`**

| id | survey_id | title | commissioned_by | conducted_by | start_date | end_date | total_respondents | countries_covered | timeframe |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 21005921 | Compact Initiative | composite-commissi-45 | adaptive-conducte-65 | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | 14 | 25 | adaptive-timefram-59 |
| 2 | 726059 | Legacy Model | primary-commissi-46 | distributed-conducte-66 | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | 62 | 34 | distributed-timefram-60 |
| 3 | 32814 | Regional Cluster A | adaptive-commissi-47 | baseline-conducte-67 | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | 5 | 43 | baseline-timefram-61 |
| 4 | b83e028a-8fcd-11eb-924d-9cd76263cbd0 | Seasonal Review | distributed-commissi-48 | pilot-conducte-68 | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | 47 | 52 | pilot-timefram-62 |
