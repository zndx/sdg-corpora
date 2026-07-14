## SME Survey Ecosystems: Tracking Enterprise Performance Across Economic Cycles

Small and medium enterprises (SMEs) form the backbone of regional economies, yet their trajectories shift dramatically across business cycles. Understanding these shifts requires coordinated survey infrastructure that links employer characteristics, growth metrics, financial access, and policy interventions into a single analytical framework. The data model described here captures that linkage: each employer record anchors a chain of observations spanning survey waves, research agencies, growth performances, finance accesses, and policy instruments. Practitioners use these records to answer questions such as which sectors show resilience during recessions, how credit availability correlates with employment trends, and which policy instruments reach their intended targets. The following sections walk through each component of the ecosystem and the joined views that make cross-domain analysis possible.

## Employer Records and Survey Infrastructure

The foundation of the system is the employer registry, where each row represents a distinct SME with attributes that shape its economic behavior.

**Table `s_m_e_employers`**

| id | employer_id | employee_count | commercial_sector | region | export_status | training_commitment | survey_wave_id | growth_performance_id | finance_access_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | The Hongkong and Shanghai Banking Corporation Limited | 131 | seasonal-commerci-83 | distributed-region-12 | false | positive | 1 | 1 | 1 |
| 2 | ChargePoint Holdings. | 428 | regional-commerci-84 | baseline-region-13 | true | neutral | 2 | 2 | 2 |
| 3 | Intl. Business Machines | 3 | legacy-commerci-85 | pilot-region-14 | false | negative | 3 | 3 | 3 |
| 4 | Feedback Ratings | 9 | compact-commerci-86 | extended-region-15 | true | positive | 4 | 4 | 4 |

The `s_m_e_employers` table stores core identifiers and operational characteristics. The `employer_id` column holds the organization name — for example, "The Hongkong and Shanghai Banking Corporation Limited" with 131 employees operating in the `seasonal-commerci-83` sector within `distributed-region-12`, or "ChargePoint Holdings." with 428 employees in `regional-commerci-84` and `baseline-region-13`. The `employee_count` field quantifies workforce size, while `commercial_sector` and `region` provide categorical context for geographic and industry analysis. The `export_status` flag distinguishes export-oriented firms (such as ChargePoint Holdings. and Feedback Ratings) from domestic-focused ones. The `training_commitment` column records whether the employer has a positive, neutral, or negative stance on workforce training — a factor that often correlates with growth ambition. Each employer row also carries foreign keys (`survey_wave_id`, `growth_performance_id`, `finance_access_id`) that tie it to the corresponding survey wave, growth record, and finance access, forming the backbone of the joined views.

Survey waves provide the temporal dimension. Each wave captures a snapshot of economic conditions over a defined period.

**Table `survey_waves`**

| id | wave_id | survey_type | start_date | end_date | economic_period | sample_size | s_m_e_employer_id | research_agency_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 5844258 | ASBS | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | pre-recession | 31 | 1 | 1 |
| 2 | 8189498 | BusinessBarometer | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | during-recession | 38 | 2 | 2 |
| 3 | 296 | ASBS | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | pre-recession | 45 | 3 | 3 |
| 4 | managing-resources | BusinessBarometer | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | during-recession | 52 | 4 | 4 |

The `survey_waves` table records the `wave_id`, which serves as a unique identifier for each survey round — values range from numeric codes like `5844258` to descriptive identifiers such as `managing-resources`. The `survey_type` distinguishes between instruments like ASBS and BusinessBarometer. Date fields (`start_date` and `end_date`) define the data collection window, while `economic_period` classifies the macroeconomic context as `pre-recession` or `during-recession`. The `sample_size` column indicates how many employers were included in each wave. Foreign keys `s_m_e_employer_id` and `research_agency_id` link each wave to the employer being surveyed and the agency conducting it.

Research agencies are the organizations responsible for data collection and survey administration.

**Table `research_agencies`**

| id | agency_name | contract_id | survey_wave_id |
|---|---|---|---|
| 1 | FSG Social Impact Advisors | 255 | 1 |
| 2 | Whirlpool Corporation | state_uk_25 | 2 |
| 3 | Education Writers Association | 10966229 | 3 |
| 4 | Switch Card Services Ltd. | 195352 | 4 |

The `research_agencies` table lists agencies such as FSG Social Impact Advisors, Whirlpool Corporation, Education Writers Association, and Switch Card Services Ltd. Each agency is identified by `agency_name` and linked to a specific survey wave via `survey_wave_id`. The `contract_id` field (e.g., `255`, `state_uk_25`, `10966229`) tracks the contractual arrangement under which the agency operates. This table enables practitioners to trace data provenance and assess whether certain agencies produce systematically different results.

## Growth Performance Metrics

Growth performance records capture how SMEs evolve over time, measured through employment and turnover changes.

**Table `growth_performances`**

| growth_performance_id | employment_change | turnover_change | measurement_period | growth_ambition | s_m_e_employer_id | survey_wave_id |
|---|---|---|---|---|---|---|
| 1 | growth | growth | primary-measurem-76 | high | 1 | 1 |
| 2 | stable | stable | adaptive-measurem-77 | medium | 2 | 2 |
| 3 | decline | decline | distributed-measurem-78 | low | 3 | 3 |
| 4 | growth | growth | baseline-measurem-79 | high | 4 | 4 |

The `growth_performances` table uses `growth_performance_id` as its primary key and records `employment_change` and `turnover_change` as categorical indicators — values include `growth`, `stable`, and `decline`. In the sample data, employer 1 (The Hongkong and Shanghai Banking Corporation Limited) shows growth in both employment and turnover, while employer 3 (Intl. Business Machines) exhibits decline across both dimensions. The `measurement_period` column (e.g., `primary-measurem-76`, `adaptive-measurem-77`) specifies the analytical lens through which changes are assessed. The `growth_ambition` field captures the employer's strategic intent, ranging from `high` to `medium` to `low`. Foreign keys `s_m_e_employer_id` and `survey_wave_id` anchor each performance record to the corresponding employer and survey wave, enabling temporal and cross-employer comparisons.

## Finance Access and Credit Markets

Access to finance is a critical determinant of SME survival and expansion. The finance accesses table documents credit outcomes and their determinants.

**Table `finance_accesses`**

| id | access_status | finance_type | banking_sector_impact | amount_requested | amount_approved | s_m_e_employer_id | survey_wave_id | created_at |
|---|---|---|---|---|---|---|---|---|
| 1 | available | loan | positive | 30.51 | 55.49 | 1 | 1 | 2025-01-01 00:14:00 |
| 2 | restricted | equity | neutral | 24.09 | 9,957 | 2 | 2 | 2025-02-06 03:14:00 |
| 3 | denied | grant | negative | 10.72 | 1,040 | 3 | 3 | 2025-03-11 06:14:00 |
| 4 | available | loan | positive | 12.74 | 43.25 | 4 | 4 | 2025-04-16 09:14:00 |

The `finance_accesses` table records `access_status` as `available`, `restricted`, or `denied`, providing a clear picture of credit availability. The `finance_type` column distinguishes between `loan`, `equity`, and `grant` instruments. The `banking_sector_impact` field captures whether the banking sector's influence on the employer is `positive`, `neutral`, or `negative`. Financial amounts are tracked in `amount_requested` and `amount_approved` — for instance, employer 2 (ChargePoint Holdings.) requested 24.09 but received 9,957 in approved equity financing, while employer 3 (Intl. Business Machines) requested 10.72 in grant funding but was denied, receiving only 1,040. The `created_at` timestamp records when the finance record was established. Foreign keys `s_m_e_employer_id` and `survey_wave_id` link each finance record to its employer and survey context.

## Policy Instruments and Regulatory Framework

Policy instruments represent the government and regulatory interventions that shape SME operating conditions.

**Table `policy_instruments`**

| id | instrument_id | instrument_name | issuing_body | target_sector | effective_date | s_m_e_employer_id | finance_access_id |
|---|---|---|---|---|---|---|---|
| 1 | 6926365 | Distributed Initiative | baseline-issuing-13 | pilot-target-74 | 2023-02-14 | 1 | 1 |
| 2 | account_pymes_691 | Adaptive Model D | pilot-issuing-14 | extended-target-75 | 2024-07-25 | 2 | 2 |
| 3 | 726063 | Primary Cluster | extended-issuing-15 | integrated-target-76 | 2025-12-09 | 3 | 3 |
| 4 | 23256422 | Composite Review | integrated-issuing-16 | seasonal-target-77 | 2022-05-20 | 4 | 4 |

The `policy_instruments` table catalogs interventions with `instrument_id` as the unique key and `instrument_name` describing the policy (e.g., "Distributed Initiative," "Adaptive Model D," "Primary Cluster," "Composite Review"). The `issuing_body` field identifies the authority responsible for the instrument, while `target_sector` specifies the intended recipient sector (e.g., `pilot-target-74`, `extended-target-75`). The `effective_date` marks when the policy takes effect. Foreign keys `s_m_e_employer_id` and `finance_access_id` connect each policy instrument to the employer it targets and the finance access it influences, enabling analysis of how policy design intersects with credit outcomes.

## Cross-Referenced Survey Views

The system provides a suite of joined views that combine employer data with related records, answering specific analytical questions. Each view is designed to surface a particular relationship.

The view `vw_s_m_e_employer_survey_wave` joins employer records with their corresponding survey waves, answering the question: what survey conditions apply to each employer? Reading the first row reveals that The Hongkong and Shanghai Banking Corporation Limited was surveyed in wave `5844258` (ASBS type, `pre-recession` period, sample size 31). The second row shows ChargePoint Holdings. was surveyed in wave `8189498` (BusinessBarometer, `during-recession`, sample size 38). This view enables practitioners to correlate employer characteristics with the economic context of their survey.

The view `vw_survey_wave_s_m_e_employer` presents the same relationship from the survey wave's perspective, answering: which employers were included in each survey wave? The first row shows wave `5844258` included The Hongkong and Shanghai Banking Corporation Limited, while the fourth row links wave `managing-resources` to Feedback Ratings. This orientation is useful for survey designers assessing sample composition.

The view `vw_s_m_e_employer_growth_performance` joins employers with their growth metrics, answering: how is each employer performing? The first row shows The Hongkong and Shanghai Banking Corporation Limited experienced `growth` in both employment and turnover with `high` growth ambition. The third row reveals Intl. Business Machines underwent `decline` with `low` ambition. This view supports sectoral and regional performance benchmarking.

The view `vw_growth_performance_s_m_e_employer` reverses the join, answering: which employer corresponds to each growth record? The first row maps growth performance ID 1 to The Hongkong and Shanghai Banking Corporation Limited, while the third row maps performance ID 3 to Intl. Business Machines. This orientation is useful for growth analysts tracing performance back to organizational characteristics.

The view `vw_s_m_e_employer_finance_access` joins employers with their finance records, answering: what is each employer's credit situation? The first row shows The Hongkong and Shanghai Banking Corporation Limited has `available` loan access with a `positive` banking sector impact, having requested 30.51 and received 55.49. The third row reveals Intl. Business Machines was `denied` grant access with a `negative` banking impact. This view is essential for credit risk assessment and financial inclusion analysis.

The view `vw_finance_access_s_m_e_employer` presents the relationship from the finance access perspective, answering: which employer is associated with each finance record? The first row links finance access ID 1 to The Hongkong and Shanghai Banking Corporation Limited, while the second row connects access ID 2 to ChargePoint Holdings. This orientation supports finance officers reviewing portfolio composition.

## Growth, Finance, and Policy Cross-References

Additional views connect survey waves to growth, finance, and policy records, enabling multi-dimensional analysis.

The view `vw_survey_wave_research_agency` joins survey waves with their conducting agencies, answering: which agency conducted each survey? The first row shows wave `5844258` was conducted by FSG Social Impact Advisors, while the second row links wave `8189498` to Whirlpool Corporation. This view supports quality assurance and inter-agency comparison.

The view `vw_research_agency_survey_wave` reverses the join, answering: which survey waves did each agency conduct? The first row maps FSG Social Impact Advisors to wave `5844258`, while the fourth row links Switch Card Services Ltd. to wave `managing-resources`. This orientation is useful for agency performance evaluation.

The view `vw_growth_performance_survey_wave` joins growth records with their survey waves, answering: what economic context surrounded each growth measurement? The first row shows growth performance ID 1 (growth in employment and turnover) was measured during survey wave `5844258` (pre-recession). The third row links performance ID 3 (decline) to wave `296` (also pre-recession). This view helps practitioners distinguish between cyclical and structural performance changes.

The view `vw_finance_access_survey_wave` joins finance records with their survey waves, answering: what economic conditions characterized each finance outcome? The first row shows finance access ID 1 (available loan, positive banking impact) was recorded during wave `5844258` (pre-recession). The third row links access ID 3 (denied grant, negative impact) to wave `296`. This view supports analysis of how credit markets behave across economic periods.

The view `vw_policy_instrument_s_m_e_employer` joins policy instruments with their target employers, answering: which employers are subject to each policy? The first row shows instrument `6926365` (Distributed Initiative) targets The Hongkong and Shanghai Banking Corporation Limited in sector `pilot-target-74`. The fourth row links instrument `23256422` (Composite Review) to Feedback Ratings in `seasonal-target-77`. This view enables practitioners to assess policy coverage and targeting accuracy.

The view `vw_policy_instrument_finance_access` joins policy instruments with their linked finance accesses, answering: how does each policy instrument relate to credit outcomes? The first row connects instrument `6926365` (Distributed Initiative) to finance access ID 1 (available loan, positive banking impact). The third row links instrument `726063` (Primary Cluster) to access ID 3 (denied grant, negative impact). This view is critical for evaluating whether policy design aligns with actual credit outcomes.

## Closing Synthesis

The SME survey ecosystem integrates employer characteristics, survey timing, growth trajectories, credit access, and policy interventions into a coherent analytical framework. Each base table captures a distinct dimension of the SME experience, while the joined views enable practitioners to answer complex questions that span multiple dimensions. The foreign-key relationships — from employers to survey waves, from growth records to employers, from finance accesses to survey waves, and from policy instruments to both employers and finance records — create a web of traceable connections that support rigorous analysis. By reading specific rows across these tables and views, practitioners can identify patterns such as the correlation between training commitment and growth ambition, the relationship between economic period and credit availability, or the alignment between policy targeting and actual finance outcomes. This structured approach to SME data management ensures that decisions about enterprise support, survey design, and policy implementation are grounded in a comprehensive and interconnected evidence base.

## Data appendix

**View `vw_s_m_e_employer_survey_wave`**

```sql
CREATE VIEW vw_s_m_e_employer_survey_wave AS
SELECT a.id, a.employer_id, a.employee_count, a.commercial_sector, b.id AS wave_id, b.wave_id AS wave_wave_id, b.survey_type AS wave_survey_type
FROM s_m_e_employers a JOIN survey_waves b ON a.survey_wave_id = b.id;
```

| id | employer_id | employee_count | commercial_sector | wave_id | wave_wave_id | wave_survey_type |
|---|---|---|---|---|---|---|
| 1 | The Hongkong and Shanghai Banking Corporation Limited | 131 | seasonal-commerci-83 | 1 | 5844258 | ASBS |
| 2 | ChargePoint Holdings. | 428 | regional-commerci-84 | 2 | 8189498 | BusinessBarometer |
| 3 | Intl. Business Machines | 3 | legacy-commerci-85 | 3 | 296 | ASBS |
| 4 | Feedback Ratings | 9 | compact-commerci-86 | 4 | managing-resources | BusinessBarometer |

**View `vw_s_m_e_employer_growth_performance`**

```sql
CREATE VIEW vw_s_m_e_employer_growth_performance AS
SELECT a.id, a.employer_id, a.employee_count, a.commercial_sector, b.growth_performance_id AS performance_growth_performance_id, b.employment_change AS performance_employment_change, b.turnover_change AS performance_turnover_change
FROM s_m_e_employers a JOIN growth_performances b ON a.growth_performance_id = b.growth_performance_id;
```

| id | employer_id | employee_count | commercial_sector | performance_growth_performance_id | performance_employment_change | performance_turnover_change |
|---|---|---|---|---|---|---|
| 1 | The Hongkong and Shanghai Banking Corporation Limited | 131 | seasonal-commerci-83 | 1 | growth | growth |
| 2 | ChargePoint Holdings. | 428 | regional-commerci-84 | 2 | stable | stable |
| 3 | Intl. Business Machines | 3 | legacy-commerci-85 | 3 | decline | decline |
| 4 | Feedback Ratings | 9 | compact-commerci-86 | 4 | growth | growth |

**View `vw_s_m_e_employer_finance_access`**

```sql
CREATE VIEW vw_s_m_e_employer_finance_access AS
SELECT a.id, a.employer_id, a.employee_count, a.commercial_sector, b.id AS access_id, b.access_status AS access_access_status, b.finance_type AS access_finance_type
FROM s_m_e_employers a JOIN finance_accesses b ON a.finance_access_id = b.id;
```

| id | employer_id | employee_count | commercial_sector | access_id | access_access_status | access_finance_type |
|---|---|---|---|---|---|---|
| 1 | The Hongkong and Shanghai Banking Corporation Limited | 131 | seasonal-commerci-83 | 1 | available | loan |
| 2 | ChargePoint Holdings. | 428 | regional-commerci-84 | 2 | restricted | equity |
| 3 | Intl. Business Machines | 3 | legacy-commerci-85 | 3 | denied | grant |
| 4 | Feedback Ratings | 9 | compact-commerci-86 | 4 | available | loan |

**View `vw_survey_wave_s_m_e_employer`**

```sql
CREATE VIEW vw_survey_wave_s_m_e_employer AS
SELECT a.id, a.wave_id, a.survey_type, a.start_date, b.id AS employer_id, b.employer_id AS employer_employer_id, b.employee_count AS employer_employee_count
FROM survey_waves a JOIN s_m_e_employers b ON a.s_m_e_employer_id = b.id;
```

| id | wave_id | survey_type | start_date | employer_id | employer_employer_id | employer_employee_count |
|---|---|---|---|---|---|---|
| 1 | 5844258 | ASBS | 2022-09-05T20:24:00 | 1 | The Hongkong and Shanghai Banking Corporation Limited | 131 |
| 2 | 8189498 | BusinessBarometer | 2023-02-16T03:41:00 | 2 | ChargePoint Holdings. | 428 |
| 3 | 296 | ASBS | 2024-07-27T10:58:00 | 3 | Intl. Business Machines | 3 |
| 4 | managing-resources | BusinessBarometer | 2025-12-11T17:15:00 | 4 | Feedback Ratings | 9 |

**View `vw_survey_wave_research_agency`**

```sql
CREATE VIEW vw_survey_wave_research_agency AS
SELECT a.id, a.wave_id, a.survey_type, a.start_date, b.id AS agency_id, b.agency_name AS agency_agency_name, b.contract_id AS agency_contract_id
FROM survey_waves a JOIN research_agencies b ON a.research_agency_id = b.id;
```

| id | wave_id | survey_type | start_date | agency_id | agency_agency_name | agency_contract_id |
|---|---|---|---|---|---|---|
| 1 | 5844258 | ASBS | 2022-09-05T20:24:00 | 1 | FSG Social Impact Advisors | 255 |
| 2 | 8189498 | BusinessBarometer | 2023-02-16T03:41:00 | 2 | Whirlpool Corporation | state_uk_25 |
| 3 | 296 | ASBS | 2024-07-27T10:58:00 | 3 | Education Writers Association | 10966229 |
| 4 | managing-resources | BusinessBarometer | 2025-12-11T17:15:00 | 4 | Switch Card Services Ltd. | 195352 |

**View `vw_research_agency_survey_wave`**

```sql
CREATE VIEW vw_research_agency_survey_wave AS
SELECT a.id, a.agency_name, a.contract_id, b.id AS wave_id, b.wave_id AS wave_wave_id, b.survey_type AS wave_survey_type
FROM research_agencies a JOIN survey_waves b ON a.survey_wave_id = b.id;
```

| id | agency_name | contract_id | wave_id | wave_wave_id | wave_survey_type |
|---|---|---|---|---|---|
| 1 | FSG Social Impact Advisors | 255 | 1 | 5844258 | ASBS |
| 2 | Whirlpool Corporation | state_uk_25 | 2 | 8189498 | BusinessBarometer |
| 3 | Education Writers Association | 10966229 | 3 | 296 | ASBS |
| 4 | Switch Card Services Ltd. | 195352 | 4 | managing-resources | BusinessBarometer |

**View `vw_growth_performance_s_m_e_employer`**

```sql
CREATE VIEW vw_growth_performance_s_m_e_employer AS
SELECT a.growth_performance_id, a.employment_change, a.turnover_change, a.measurement_period, b.id AS employer_id, b.employer_id AS employer_employer_id, b.employee_count AS employer_employee_count
FROM growth_performances a JOIN s_m_e_employers b ON a.s_m_e_employer_id = b.id;
```

| growth_performance_id | employment_change | turnover_change | measurement_period | employer_id | employer_employer_id | employer_employee_count |
|---|---|---|---|---|---|---|
| 1 | growth | growth | primary-measurem-76 | 1 | The Hongkong and Shanghai Banking Corporation Limited | 131 |
| 2 | stable | stable | adaptive-measurem-77 | 2 | ChargePoint Holdings. | 428 |
| 3 | decline | decline | distributed-measurem-78 | 3 | Intl. Business Machines | 3 |
| 4 | growth | growth | baseline-measurem-79 | 4 | Feedback Ratings | 9 |

**View `vw_growth_performance_survey_wave`**

```sql
CREATE VIEW vw_growth_performance_survey_wave AS
SELECT a.growth_performance_id, a.employment_change, a.turnover_change, a.measurement_period, b.id AS wave_id, b.wave_id AS wave_wave_id, b.survey_type AS wave_survey_type
FROM growth_performances a JOIN survey_waves b ON a.survey_wave_id = b.id;
```

| growth_performance_id | employment_change | turnover_change | measurement_period | wave_id | wave_wave_id | wave_survey_type |
|---|---|---|---|---|---|---|
| 1 | growth | growth | primary-measurem-76 | 1 | 5844258 | ASBS |
| 2 | stable | stable | adaptive-measurem-77 | 2 | 8189498 | BusinessBarometer |
| 3 | decline | decline | distributed-measurem-78 | 3 | 296 | ASBS |
| 4 | growth | growth | baseline-measurem-79 | 4 | managing-resources | BusinessBarometer |

**View `vw_finance_access_s_m_e_employer`**

```sql
CREATE VIEW vw_finance_access_s_m_e_employer AS
SELECT a.id, a.access_status, a.finance_type, a.banking_sector_impact, b.id AS employer_id, b.employer_id AS employer_employer_id, b.employee_count AS employer_employee_count
FROM finance_accesses a JOIN s_m_e_employers b ON a.s_m_e_employer_id = b.id;
```

| id | access_status | finance_type | banking_sector_impact | employer_id | employer_employer_id | employer_employee_count |
|---|---|---|---|---|---|---|
| 1 | available | loan | positive | 1 | The Hongkong and Shanghai Banking Corporation Limited | 131 |
| 2 | restricted | equity | neutral | 2 | ChargePoint Holdings. | 428 |
| 3 | denied | grant | negative | 3 | Intl. Business Machines | 3 |
| 4 | available | loan | positive | 4 | Feedback Ratings | 9 |

**View `vw_finance_access_survey_wave`**

```sql
CREATE VIEW vw_finance_access_survey_wave AS
SELECT a.id, a.access_status, a.finance_type, a.banking_sector_impact, b.id AS wave_id, b.wave_id AS wave_wave_id, b.survey_type AS wave_survey_type
FROM finance_accesses a JOIN survey_waves b ON a.survey_wave_id = b.id;
```

| id | access_status | finance_type | banking_sector_impact | wave_id | wave_wave_id | wave_survey_type |
|---|---|---|---|---|---|---|
| 1 | available | loan | positive | 1 | 5844258 | ASBS |
| 2 | restricted | equity | neutral | 2 | 8189498 | BusinessBarometer |
| 3 | denied | grant | negative | 3 | 296 | ASBS |
| 4 | available | loan | positive | 4 | managing-resources | BusinessBarometer |

**View `vw_policy_instrument_s_m_e_employer`**

```sql
CREATE VIEW vw_policy_instrument_s_m_e_employer AS
SELECT a.id, a.instrument_id, a.instrument_name, a.issuing_body, b.id AS employer_id, b.employer_id AS employer_employer_id, b.employee_count AS employer_employee_count
FROM policy_instruments a JOIN s_m_e_employers b ON a.s_m_e_employer_id = b.id;
```

| id | instrument_id | instrument_name | issuing_body | employer_id | employer_employer_id | employer_employee_count |
|---|---|---|---|---|---|---|
| 1 | 6926365 | Distributed Initiative | baseline-issuing-13 | 1 | The Hongkong and Shanghai Banking Corporation Limited | 131 |
| 2 | account_pymes_691 | Adaptive Model D | pilot-issuing-14 | 2 | ChargePoint Holdings. | 428 |
| 3 | 726063 | Primary Cluster | extended-issuing-15 | 3 | Intl. Business Machines | 3 |
| 4 | 23256422 | Composite Review | integrated-issuing-16 | 4 | Feedback Ratings | 9 |

**View `vw_policy_instrument_finance_access`**

```sql
CREATE VIEW vw_policy_instrument_finance_access AS
SELECT a.id, a.instrument_id, a.instrument_name, a.issuing_body, b.id AS access_id, b.access_status AS access_access_status, b.finance_type AS access_finance_type
FROM policy_instruments a JOIN finance_accesses b ON a.finance_access_id = b.id;
```

| id | instrument_id | instrument_name | issuing_body | access_id | access_access_status | access_finance_type |
|---|---|---|---|---|---|---|
| 1 | 6926365 | Distributed Initiative | baseline-issuing-13 | 1 | available | loan |
| 2 | account_pymes_691 | Adaptive Model D | pilot-issuing-14 | 2 | restricted | equity |
| 3 | 726063 | Primary Cluster | extended-issuing-15 | 3 | denied | grant |
| 4 | 23256422 | Composite Review | integrated-issuing-16 | 4 | available | loan |
