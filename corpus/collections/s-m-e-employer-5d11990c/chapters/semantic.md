The domain of small and medium enterprise (SME) economic activity is captured through a survey-driven data model that links employer characteristics, survey administration, financial access, growth trajectories, and policy interventions into a single coherent schema. The model is built around six base tables that together describe who the employers are, how they were surveyed, what financial resources they accessed, how they performed over time, and which policy instruments were applied to them. This chapter explains the entity types, their attributes, the foreign-key relationships that bind them, and how the twelve materialized views reconstruct domain facts from the normalized tables.

The central entity is the SME employer, stored in `s_m_e_employers`. Each row identifies a distinct organization by its `employer_id` — a free-text name such as "The Hongkong and Shanghai Banking Corporation Limited", "ChargePoint Holdings.", "Intl. Business Machines", or "Feedback Ratings". The table records structural attributes: `employee_count` (an integer ranging from 3 to 428 in the sample), `commercial_sector` (a coded label like `seasonal-commerci-83` or `regional-commerci-84`), `region` (a geographic classification such as `distributed-region-12` or `baseline-region-13`), `export_status` (a boolean indicating whether the employer engages in export activity), and `training_commitment` (a categorical field with values `positive`, `neutral`, or `negative`). The employer table also carries three foreign-key columns — `survey_wave_id`, `growth_performance_id`, and `finance_access_id` — that anchor each employer to its corresponding survey wave, growth record, and finance access record. These three columns are the primary join keys that enable the cross-entity views described later in this chapter.

**Table `s_m_e_employers`**

| id | employer_id | employee_count | commercial_sector | region | export_status | training_commitment | survey_wave_id | growth_performance_id | finance_access_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | The Hongkong and Shanghai Banking Corporation Limited | 131 | seasonal-commerci-83 | distributed-region-12 | false | positive | 1 | 1 | 1 |
| 2 | ChargePoint Holdings. | 428 | regional-commerci-84 | baseline-region-13 | true | neutral | 2 | 2 | 2 |
| 3 | Intl. Business Machines | 3 | legacy-commerci-85 | pilot-region-14 | false | negative | 3 | 3 | 3 |
| 4 | Feedback Ratings | 9 | compact-commerci-86 | extended-region-15 | true | positive | 4 | 4 | 4 |

Survey waves are the temporal containers for data collection. The `survey_waves` table stores one row per wave, identified by a `wave_id` that is a human-readable string such as `5844258`, `8189498`, `296`, or `managing-resources`. Each wave has a `survey_type` (either `ASBS` or `BusinessBarometer`), a `start_date` and `end_date` that define the collection window, an `economic_period` classification (`pre-recession` or `during-recession`), and a `sample_size` (ranging from 31 to 52 in the sample). The table also stores two foreign keys: `s_m_e_employer_id`, which links the wave to the employer it surveyed, and `research_agency_id`, which identifies the agency that conducted the survey. This dual foreign-key structure means that each survey wave is a fact that simultaneously connects an employer to a research agency.

**Table `survey_waves`**

| id | wave_id | survey_type | start_date | end_date | economic_period | sample_size | s_m_e_employer_id | research_agency_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 5844258 | ASBS | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | pre-recession | 31 | 1 | 1 |
| 2 | 8189498 | BusinessBarometer | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | during-recession | 38 | 2 | 2 |
| 3 | 296 | ASBS | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | pre-recession | 45 | 3 | 3 |
| 4 | managing-resources | BusinessBarometer | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | during-recession | 52 | 4 | 4 |

Research agencies are the organizations responsible for administering the surveys. The `research_agencies` table contains one row per agency, with columns `agency_name` (e.g., "FSG Social Impact Advisors", "Whirlpool Corporation", "Education Writers Association", "Switch Card Services Ltd."), `contract_id` (a string identifier such as `255`, `state_uk_25`, `10966229`, or `195352`), and `survey_wave_id`, which is a foreign key pointing to the `survey_waves` table. The cardinality here is one-to-one in the current data: each research agency is associated with exactly one survey wave, and each survey wave references exactly one research agency. This relationship is materialized through the `survey_wave_id` column in `research_agencies`, which references the `id` column of `survey_waves`.

**Table `research_agencies`**

| id | agency_name | contract_id | survey_wave_id |
|---|---|---|---|
| 1 | FSG Social Impact Advisors | 255 | 1 |
| 2 | Whirlpool Corporation | state_uk_25 | 2 |
| 3 | Education Writers Association | 10966229 | 3 |
| 4 | Switch Card Services Ltd. | 195352 | 4 |

Growth performance records capture the economic trajectory of each employer over a defined measurement period. The `growth_performances` table uses `growth_performance_id` as its primary key (values 1 through 4 in the sample). Its attributes include `employment_change` and `turnover_change`, both of which are categorical fields with values `growth`, `stable`, or `decline` — and in the sample data, these two columns are always identical for a given row. The `measurement_period` column holds coded labels such as `primary-measurem-76`, `adaptive-measurem-77`, `distributed-measurem-78`, and `baseline-measurem-79`. The `growth_ambition` column is a categorical field with values `high`, `medium`, or `low`. Two foreign-key columns anchor the growth record: `s_m_e_employer_id` links the growth performance to the employer, and `survey_wave_id` links it to the survey wave during which the measurement was taken.

**Table `growth_performances`**

| growth_performance_id | employment_change | turnover_change | measurement_period | growth_ambition | s_m_e_employer_id | survey_wave_id |
|---|---|---|---|---|---|---|
| 1 | growth | growth | primary-measurem-76 | high | 1 | 1 |
| 2 | stable | stable | adaptive-measurem-77 | medium | 2 | 2 |
| 3 | decline | decline | distributed-measurem-78 | low | 3 | 3 |
| 4 | growth | growth | baseline-measurem-79 | high | 4 | 4 |

Finance access records document the borrowing and funding interactions of each employer. The `finance_accesses` table has a surrogate primary key `id` (values 1 through 4), an `access_status` column with values `available`, `restricted`, or `denied`, a `finance_type` column with values `loan`, `equity`, or `grant`, and a `banking_sector_impact` column with values `positive`, `neutral`, or `negative`. The financial amounts are stored as `amount_requested` and `amount_approved` — for example, employer 1 requested 30.51 and was approved for 55.49, while employer 2 requested 24.09 and was approved for 9,957. The table also includes a `created_at` timestamp (e.g., `2025-01-01 00:14:00`) and two foreign-key columns: `s_m_e_employer_id` and `survey_wave_id`, which link the finance access record to the employer and the survey wave respectively.

**Table `finance_accesses`**

| id | access_status | finance_type | banking_sector_impact | amount_requested | amount_approved | s_m_e_employer_id | survey_wave_id | created_at |
|---|---|---|---|---|---|---|---|---|
| 1 | available | loan | positive | 30.51 | 55.49 | 1 | 1 | 2025-01-01 00:14:00 |
| 2 | restricted | equity | neutral | 24.09 | 9,957 | 2 | 2 | 2025-02-06 03:14:00 |
| 3 | denied | grant | negative | 10.72 | 1,040 | 3 | 3 | 2025-03-11 06:14:00 |
| 4 | available | loan | positive | 12.74 | 43.25 | 4 | 4 | 2025-04-16 09:14:00 |

Policy instruments represent the regulatory and support mechanisms applied to employers. The `policy_instruments` table uses a surrogate `id` as its primary key and carries an `instrument_id` (e.g., `6926365`, `account_pymes_691`, `726063`, `23256422`) and an `instrument_name` (e.g., "Distributed Initiative", "Adaptive Model D", "Primary Cluster", "Composite Review"). The `issuing_body` column identifies the authority that issued the instrument (coded values like `baseline-issuing-13`), the `target_sector` column specifies the sector the instrument targets (e.g., `pilot-target-74`), and the `effective_date` column records when the instrument became active (e.g., `2023-02-14`). Two foreign-key columns anchor the policy instrument: `s_m_e_employer_id` links it to the employer, and `finance_access_id` links it to the finance access record. This creates a direct relationship between policy instruments and finance access, allowing queries to trace which policies were associated with which funding outcomes.

**Table `policy_instruments`**

| id | instrument_id | instrument_name | issuing_body | target_sector | effective_date | s_m_e_employer_id | finance_access_id |
|---|---|---|---|---|---|---|---|
| 1 | 6926365 | Distributed Initiative | baseline-issuing-13 | pilot-target-74 | 2023-02-14 | 1 | 1 |
| 2 | account_pymes_691 | Adaptive Model D | pilot-issuing-14 | extended-target-75 | 2024-07-25 | 2 | 2 |
| 3 | 726063 | Primary Cluster | extended-issuing-15 | integrated-target-76 | 2025-12-09 | 3 | 3 |
| 4 | 23256422 | Composite Review | integrated-issuing-16 | seasonal-target-77 | 2022-05-20 | 4 | 4 |

The foreign-key topology of the schema can be summarized as follows. The `s_m_e_employers` table is the central hub: its `survey_wave_id` column references `survey_waves.id`, its `growth_performance_id` column references `growth_performances.growth_performance_id`, and its `finance_access_id` column references `finance_accesses.id`. The `survey_waves` table, in turn, has `s_m_e_employer_id` referencing `s_m_e_employers.id` and `research_agency_id` referencing `research_agencies.id`. The `growth_performances` table has `s_m_e_employer_id` referencing `s_m_e_employers.id` and `survey_wave_id` referencing `survey_waves.id`. The `finance_accesses` table has `s_m_e_employer_id` referencing `s_m_e_employers.id` and `survey_wave_id` referencing `survey_waves.id`. The `policy_instruments` table has `s_m_e_employer_id` referencing `s_m_e_employers.id` and `finance_access_id` referencing `finance_accesses.id`. This creates a web of bidirectional references: every entity can be reached from the employer table through a single hop, and the survey wave serves as a secondary hub connecting employers, research agencies, growth records, and finance records.

The twelve views materialize this topology into denormalized result sets that answer specific analytical questions. Each view is a `SELECT` that joins the relevant base tables and presents the combined attributes as a single flat row.

The view `vw_s_m_e_employer_survey_wave` joins `s_m_e_employers` to `survey_waves` on the employer's `survey_wave_id` matching the wave's `id`. This view answers the question: "What survey wave was each employer surveyed in, and what are the wave's administrative details?" Reading the first row as evidence, the join produces a record where the employer "The Hongkong and Shanghai Banking Corporation Limited" (with 131 employees in the `seasonal-commerci-83` sector) is linked to survey wave `5844258` of type `ASBS`, conducted during the `pre-recession` period with a sample size of 31. The second row shows "ChargePoint Holdings." (428 employees, `regional-commerci-84` sector, `export_status = true`) associated with wave `8189498` of type `BusinessBarometer` during the `during-recession` period with a sample size of 38.

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

The view `vw_s_m_e_employer_growth_performance` joins `s_m_e_employers` to `growth_performances` on the employer's `growth_performance_id` matching the growth record's `growth_performance_id`. This view answers: "How did each employer perform in terms of employment and turnover change, and what was their growth ambition?" The first row shows "The Hongkong and Shanghai Banking Corporation Limited" with `employment_change = growth`, `turnover_change = growth`, `measurement_period = primary-measurem-76`, and `growth_ambition = high`. The third row shows "Intl. Business Machines" with `employment_change = decline`, `turnover_change = decline`, `measurement_period = distributed-measurem-78`, and `growth_ambition = low`.

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

The view `vw_s_m_e_employer_finance_access` joins `s_m_e_employers` to `finance_accesses` on the employer's `finance_access_id` matching the finance record's `id`. This view answers: "What was each employer's financial access situation, including amounts requested and approved?" The first row shows "The Hongkong and Shanghai Banking Corporation Limited" with `access_status = available`, `finance_type = loan`, `banking_sector_impact = positive`, `amount_requested = 30.51`, and `amount_approved = 55.49`. The third row shows "Intl. Business Machines" with `access_status = denied`, `finance_type = grant`, `banking_sector_impact = negative`, `amount_requested = 10.72`, and `amount_approved = 1,040`.

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

The view `vw_survey_wave_s_m_e_employer` performs the inverse join of `vw_s_m_e_employer_survey_wave`: it starts from `survey_waves` and joins to `s_m_e_employers` on the wave's `s_m_e_employer_id` matching the employer's `id`. This view answers: "Which employer was surveyed in each wave, and what are the employer's structural attributes?" The first row shows wave `5844258` (type `ASBS`, `pre-recession`, sample size 31) linked to employer "The Hongkong and Shanghai Banking Corporation Limited" with 131 employees in the `seasonal-commerci-83` sector. The fourth row shows wave `managing-resources` (type `BusinessBarometer`, `during-recession`, sample size 52) linked to employer "Feedback Ratings" with 9 employees in the `compact-commerci-86` sector.

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

The view `vw_survey_wave_research_agency` joins `survey_waves` to `research_agencies` on the wave's `research_agency_id` matching the agency's `id`. This view answers: "Which research agency administered each survey wave?" The first row shows wave `5844258` administered by "FSG Social Impact Advisors" under contract `255`. The second row shows wave `8189498` administered by "Whirlpool Corporation" under contract `state_uk_25`.

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

The view `vw_research_agency_survey_wave` performs the inverse join of `vw_survey_wave_research_agency`: it starts from `research_agencies` and joins to `survey_waves` on the agency's `survey_wave_id` matching the wave's `id`. This view answers: "Which survey wave did each research agency conduct?" The first row shows "FSG Social Impact Advisors" (contract `255`) conducted wave `5844258` of type `ASBS` during the `pre-recession` period. The fourth row shows "Switch Card Services Ltd." (contract `195352`) conducted wave `managing-resources` of type `BusinessBarometer` during the `during-recession` period.

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

The view `vw_growth_performance_s_m_e_employer` joins `growth_performances` to `s_m_e_employers` on the growth record's `s_m_e_employer_id` matching the employer's `id`. This view answers: "For each growth performance record, which employer does it describe, and what are that employer's attributes?" The first row shows growth record with `employment_change = growth`, `turnover_change = growth`, `measurement_period = primary-measurem-76`, and `growth_ambition = high` belonging to "The Hongkong and Shanghai Banking Corporation Limited" (131 employees, `seasonal-commerci-83` sector). The third row shows growth record with `employment_change = decline`, `turnover_change = decline`, `measurement_period = distributed-measurem-78`, and `growth_ambition = low` belonging to "Intl. Business Machines" (3 employees, `legacy-commerci-85` sector).

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

The view `vw_growth_performance_survey_wave` joins `growth_performances` to `survey_waves` on the growth record's `survey_wave_id` matching the wave's `id`. This view answers: "During which survey wave was each growth performance measured?" The first row shows growth record with `employment_change = growth` and `growth_ambition = high` measured during wave `5844258` (type `ASBS`, `pre-recession`, sample size 31). The fourth row shows growth record with `employment_change = growth` and `growth_ambition = high` measured during wave `managing-resources` (type `BusinessBarometer`, `during-recession`, sample size 52).

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

The view `vw_finance_access_s_m_e_employer` joins `finance_accesses` to `s_m_e_employers` on the finance record's `s_m_e_employer_id` matching the employer's `id`. This view answers: "For each finance access record, which employer does it describe, and what are that employer's attributes?" The first row shows finance record with `access_status = available`, `finance_type = loan`, `amount_requested = 30.51`, `amount_approved = 55.49` belonging to "The Hongkong and Shanghai Banking Corporation Limited" (131 employees, `seasonal-commerci-83` sector). The second row shows finance record with `access_status = restricted`, `finance_type = equity`, `amount_requested = 24.09`, `amount_approved = 9,957` belonging to "ChargePoint Holdings." (428 employees, `regional-commerci-84` sector).

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

The view `vw_finance_access_survey_wave` joins `finance_accesses` to `survey_waves` on the finance record's `survey_wave_id` matching the wave's `id`. This view answers: "During which survey wave was each finance access recorded?" The first row shows finance record with `access_status = available` and `finance_type = loan` recorded during wave `5844258` (type `ASBS`, `pre-recession`, sample size 31). The third row shows finance record with `access_status = denied` and `finance_type = grant` recorded during wave `296` (type `ASBS`, `pre-recession`, sample size 45).

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

The view `vw_policy_instrument_s_m_e_employer` joins `policy_instruments` to `s_m_e_employers` on the policy record's `s_m_e_employer_id` matching the employer's `id`. This view answers: "Which policy instrument was applied to each employer, and what are that employer's attributes?" The first row shows policy instrument "Distributed Initiative" (issued by `baseline-issuing-13`, targeting `pilot-target-74`, effective `2023-02-14`) applied to "The Hongkong and Shanghai Banking Corporation Limited" (131 employees, `seasonal-commerci-83` sector). The fourth row shows policy instrument "Composite Review" (issued by `integrated-issuing-16`, targeting `seasonal-target-77`, effective `2022-05-20`) applied to "Feedback Ratings" (9 employees, `compact-commerci-86` sector).

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

The view `vw_policy_instrument_finance_access` joins `policy_instruments` to `finance_accesses` on the policy record's `finance_access_id` matching the finance record's `id`. This view answers: "Which finance access record is associated with each policy instrument, and what were the financial terms?" The first row shows policy instrument "Distributed Initiative" associated with finance record having `access_status = available`, `finance_type = loan`, `amount_requested = 30.51`, `amount_approved = 55.49`. The second row shows policy instrument "Adaptive Model D" associated with finance record having `access_status = restricted`, `finance_type = equity`, `amount_requested = 24.09`, `amount_approved = 9,957`.

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

In synthesis, the schema models SME economic activity as a network of six interrelated entity types. The `s_m_e_employers` table serves as the primary anchor, with its three foreign-key columns (`survey_wave_id`, `growth_performance_id`, `finance_access_id`) creating direct links to the survey, growth, and finance domains. The `survey_waves` table acts as a secondary hub, connecting employers to research agencies through its `research_agency_id` column while also being referenced by growth and finance records through their own `survey_wave_id` columns. The `policy_instruments` table bridges the employer and finance domains through its dual foreign keys. The twelve views materialize this topology into denormalized perspectives, each answering a specific analytical question by joining the relevant base tables. Together, the base tables and views provide a complete, queryable representation of the SME survey domain, from employer characteristics through survey administration to financial outcomes and policy interventions.