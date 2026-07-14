The 2022–2025 period witnessed a cascade of financial disruptions, each triggering a distinct policy response. Governments deployed bailout programs, agencies issued directives, and institutions absorbed the shock. The relational schema that captures this ecosystem is built from six core entity tables, three junction tables that resolve many-to-many associations, and a suite of materialized views that reassemble normalized facts for analytical consumption. This chapter walks through the ontology, the DDL it produces, and the join logic that powers every view.

## The Core Entities

The domain centres on six entity types. The `financial_crisises` table anchors the model. Each row represents a discrete crisis event identified by an auto-incrementing `id` (1 through 4 in the sample data), bounded by a `start_date` and an `end_date` — for example, crisis 1 ran from `2022-09-05T20:24:00` to `2022-09-01T08:00:00`. The `severity_index` column quantifies impact numerically (20.95, 22.90, 24.85, 26.80), while `affected_regions` and `primary_trigger` carry categorical labels such as `compact-affected-62` and `integrated-primary-58`. Audit columns `created_at` and `updated_at` record the lifecycle of each row. Two foreign keys, `policy_decision_id` and `bailout_program_id`, point into the `policy_decisions` and `bailout_programs` tables respectively, establishing the first cross-entity links.

**Table `financial_crisises`**

| id | start_date | end_date | severity_index | affected_regions | primary_trigger | policy_decision_id | bailout_program_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | 20.95 | compact-affected-62 | integrated-primary-58 | 1 | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | 22.90 | composite-affected-63 | seasonal-primary-59 | 2 | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | 24.85 | primary-affected-64 | regional-primary-60 | 3 | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | 26.80 | adaptive-affected-65 | legacy-primary-61 | 4 | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The `economic_conditions` table captures the macroeconomic state observed during each crisis. Its `id` column (1–4) is the primary key; `condition_type` enumerates categories like `inequality`, `debt`, `stagnantIncome`, and `financialization`. The `measurement_value` column stores a numeric reading (14.45, 17.90, 21.35, 24.80) alongside a `measurement_unit` such as `extended-measurem-87`. Geographic and temporal context is carried by `geographic_scope` (`distributed-geograph-78`, `baseline-geograph-79`, …) and `time_period` (`pilot-time-26`, `extended-time-27`, …). The foreign key `financial_crisis_id` ties each condition record to exactly one crisis row.

**Table `economic_conditions`**

| id | condition_type | measurement_value | measurement_unit | geographic_scope | time_period | financial_crisis_id |
|---|---|---|---|---|---|---|
| 1 | inequality | 14.45 | extended-measurem-87 | distributed-geograph-78 | pilot-time-26 | 1 |
| 2 | debt | 17.90 | integrated-measurem-88 | baseline-geograph-79 | extended-time-27 | 2 |
| 3 | stagnantIncome | 21.35 | seasonal-measurem-89 | pilot-geograph-80 | integrated-time-28 | 3 |
| 4 | financialization | 24.80 | regional-measurem-90 | extended-geograph-81 | seasonal-time-29 | 4 |

Bailout programs are recorded in `bailout_programs`. The primary key is `bailout_program_id` (1–4), and each row carries a `program_name` — `Extended Review`, `Pilot Initiative A`, `Baseline Model`, `Distributed Cluster` — along with its own `start_date` and `end_date`. The `total_cost` column holds a decimal figure (61.82, 89.53, 29.24, 13.94) in a `currency` such as `seasonal-currency-71`. A `status` column tracks lifecycle states (`active`, `completed`, `terminated`). The foreign key `financial_crisis_id` links the program to the crisis it was designed to address.

**Table `bailout_programs`**

| bailout_program_id | program_name | start_date | end_date | total_cost | currency | status | financial_crisis_id |
|---|---|---|---|---|---|---|---|
| 1 | Extended Review | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | 61.82 | seasonal-currency-71 | active | 1 |
| 2 | Pilot Initiative A | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | 89.53 | regional-currency-72 | completed | 2 |
| 3 | Baseline Model | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | 29.24 | legacy-currency-73 | terminated | 3 |
| 4 | Distributed Cluster | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | 13.94 | compact-currency-74 | active | 4 |

Government agencies are modelled in `government_agencies`. The surrogate key `id` runs from 1000 to 1003. The `agency_name` column carries names like `FSG Social Impact Advisors`, `Whirlpool Corporation`, `Education Writers Association`, and `Switch Card Services Ltd.`. The `jurisdiction` column stores codes such as `regional-jurisdic-30`; `established_date` records the founding date; `agency_type` is an enumeration (`centralBank`, `treasury`, `regulator`). The `legal_authority` column (e.g. `regional-legal-78`) documents the statutory basis. Three foreign keys — `bailout_program_id`, `financial_institution_id`, and `policy_decision_id` — connect each agency to a program, an institution, and a decision, respectively. Audit columns `created_at` and `updated_at` mirror the pattern in `financial_crisises`.

**Table `government_agencies`**

| id | agency_name | jurisdiction | established_date | agency_type | legal_authority | bailout_program_id | financial_institution_id | policy_decision_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|
| 1000 | FSG Social Impact Advisors | regional-jurisdic-30 | 2024-03-27 | centralBank | regional-legal-78 | 1 | 1 | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 1001 | Whirlpool Corporation | legacy-jurisdic-31 | 2025-08-11 | treasury | legacy-legal-79 | 2 | 2 | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 1002 | Education Writers Association | compact-jurisdic-32 | 2022-01-22 | regulator | compact-legal-80 | 3 | 3 | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 1003 | Switch Card Services Ltd. | composite-jurisdic-33 | 2023-06-06 | centralBank | composite-legal-81 | 4 | 4 | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Financial institutions live in `financial_institutions`. The primary key `id` (1–4) identifies each row. The `institution_name` column holds values such as `Extended Corridor`, `Pilot Series A`, `Baseline Assessment`, and `Distributed Survey`. The `institution_type` is an enumeration (`bank`, `investmentFirm`, `insuranceCompany`). The `asset_size` column stores a decimal (0.4837, 0.6000, 0.5600, 0.3513). The `currency` column mirrors the currency codes seen in other tables. The `risk_rating` column carries codes like `compact-risk-68`; `is_systemically_important` is a boolean flag. Foreign keys `bailout_program_id`, `government_agency_id`, and `economic_condition_id` link the institution to its program, overseeing agency, and the economic condition it experienced.

**Table `financial_institutions`**

| id | institution_name | institution_type | asset_size | currency | risk_rating | is_systemically_important | bailout_program_id | government_agency_id | economic_condition_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | Extended Corridor | bank | 0.4836947300000001 | seasonal-currency-71 | compact-risk-68 | false | 1 | 1000 | 1 |
| 2 | Pilot Series A | investmentFirm | 0.6000001 | regional-currency-72 | composite-risk-69 | true | 2 | 1001 | 2 |
| 3 | Baseline Assessment | insuranceCompany | 0.56 | legacy-currency-73 | primary-risk-70 | false | 3 | 1002 | 3 |
| 4 | Distributed Survey | bank | 0.351342673308077 | compact-currency-74 | adaptive-risk-71 | true | 4 | 1003 | 4 |

Policy decisions are captured in `policy_decisions`. The primary key `id` (1–4) identifies each decision. The `decision_title` column carries names such as `Pilot Cluster`, `Baseline Review`, `Distributed Initiative A`, and `Adaptive Model`. The `effective_date` is a date value (e.g. `2023-02-14`). The `decision_type` is an enumeration (`deregulation`, `fiscalTightening`, `monetaryExpansion`, `supervisionRelaxation`). The `issuing_authority` and `legal_basis` columns carry categorical codes (`extended-issuing-33`, `primary-legal-52`, …). Foreign keys `economic_condition_id`, `government_agency_id`, and `financial_crisis_id` tie each decision to the condition it responds to, the agency that issued it, and the crisis context.

**Table `policy_decisions`**

| id | decision_title | effective_date | decision_type | issuing_authority | legal_basis | economic_condition_id | government_agency_id | financial_crisis_id |
|---|---|---|---|---|---|---|---|---|
| 1 | Pilot Cluster | 2023-02-14 | deregulation | extended-issuing-33 | primary-legal-52 | 1 | 1000 | 1 |
| 2 | Baseline Review | 2024-07-25 | fiscalTightening | integrated-issuing-34 | adaptive-legal-53 | 2 | 1001 | 2 |
| 3 | Distributed Initiative A | 2025-12-09 | monetaryExpansion | seasonal-issuing-35 | distributed-legal-54 | 3 | 1002 | 3 |
| 4 | Adaptive Model | 2022-05-20 | supervisionRelaxation | regional-issuing-36 | baseline-legal-55 | 4 | 1003 | 4 |

## Junction Tables and Many-to-Many Relationships

Three junction tables resolve associations that cannot be expressed through a single foreign key. The `crisises_conditions` table links `financial_crisises` to `economic_conditions`, allowing a single crisis to be associated with multiple economic condition records and vice versa. The `programs_agencies` table resolves the many-to-many relationship between `bailout_programs` and `government_agencies`. The `programs_institutions` table does the same for `bailout_programs` and `financial_institutions`. These tables contain only foreign key columns referencing the two sides of each relationship, with no additional attributes.

**Table `crisises_conditions`**

| financial_crisis_id | economic_condition_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

**Table `programs_agencies`**

| bailout_program_id | government_agency_id |
|---|---|
| 1 | 1000 |
| 1 | 1001 |
| 2 | 1001 |
| 2 | 1002 |
| 3 | 1002 |
| 3 | 1003 |
| 4 | 1003 |
| 4 | 1000 |

**Table `programs_institutions`**

| bailout_program_id | financial_institution_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

## Materialized Views: Reassembling Domain Facts

The views are the analytical surface of the schema. Each view performs a join across two or more base tables to present a domain fact in a single denormalized row. The following sections interpret every view, reading concrete rows as evidence.

### `v_financial_crisis_economic_condition_detail`

This view joins `financial_crisises` to `economic_conditions` on `financial_crisis_id`, presenting each crisis alongside the economic conditions observed during it. Row 1 shows crisis 1 (`severity_index` 20.95, `affected_regions` `compact-affected-62`) paired with condition 1 (`condition_type` `inequality`, `measurement_value` 14.45, `geographic_scope` `distributed-geograph-78`). The join reconstructs the fact that a crisis of moderate severity coincided with an inequality measurement in a distributed geographic scope.

**View `v_financial_crisis_economic_condition_detail`**

```sql
CREATE VIEW v_financial_crisis_economic_condition_detail AS
SELECT a.id, a.start_date, a.end_date, b.id AS condition_id, b.condition_type AS condition_condition_type, b.measurement_value AS condition_measurement_value
FROM financial_crisises a
  JOIN crisises_conditions j ON j.financial_crisis_id = a.id
  JOIN economic_conditions b ON b.id = j.economic_condition_id;
```

| id | start_date | end_date | condition_id | condition_condition_type | condition_measurement_value |
|---|---|---|---|---|---|
| 1 | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | 1 | inequality | 14.45 |
| 1 | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | 2 | debt | 17.90 |
| 2 | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | 2 | debt | 17.90 |
| 2 | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | 3 | stagnantIncome | 21.35 |
| 3 | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | 3 | stagnantIncome | 21.35 |
| 3 | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | 4 | financialization | 24.80 |
| 4 | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | 4 | financialization | 24.80 |
| 4 | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | 1 | inequality | 14.45 |

### `v_financial_crisis_policy_decision`

This view joins `financial_crisises` to `policy_decisions` on `financial_crisis_id`, answering the question: which policy decision was issued in response to which crisis? Row 1 pairs crisis 1 with decision 1 (`decision_title` `Pilot Cluster`, `decision_type` `deregulation`, `effective_date` `2023-02-14`). The view makes it possible to trace a crisis event directly to the regulatory action it provoked.

**View `v_financial_crisis_policy_decision`**

```sql
CREATE VIEW v_financial_crisis_policy_decision AS
SELECT a.id, a.start_date, a.end_date, a.severity_index, b.id AS decision_id, b.decision_title AS decision_decision_title, b.effective_date AS decision_effective_date
FROM financial_crisises a JOIN policy_decisions b ON a.policy_decision_id = b.id;
```

| id | start_date | end_date | severity_index | decision_id | decision_decision_title | decision_effective_date |
|---|---|---|---|---|---|---|
| 1 | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | 20.95 | 1 | Pilot Cluster | 2023-02-14 |
| 2 | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | 22.90 | 2 | Baseline Review | 2024-07-25 |
| 3 | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | 24.85 | 3 | Distributed Initiative A | 2025-12-09 |
| 4 | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | 26.80 | 4 | Adaptive Model | 2022-05-20 |

### `v_financial_crisis_bailout_program`

This view joins `financial_crisises` to `bailout_programs` on `financial_crisis_id`. Row 1 links crisis 1 to program 1 (`program_name` `Extended Review`, `total_cost` 61.82, `status` `active`). The join answers: which bailout program was deployed for which crisis, and at what cost?

**View `v_financial_crisis_bailout_program`**

```sql
CREATE VIEW v_financial_crisis_bailout_program AS
SELECT a.id, a.start_date, a.end_date, a.severity_index, b.bailout_program_id AS program_bailout_program_id, b.program_name AS program_program_name, b.start_date AS program_start_date
FROM financial_crisises a JOIN bailout_programs b ON a.bailout_program_id = b.bailout_program_id;
```

| id | start_date | end_date | severity_index | program_bailout_program_id | program_program_name | program_start_date |
|---|---|---|---|---|---|---|
| 1 | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | 20.95 | 1 | Extended Review | 2022-09-05T20:24:00 |
| 2 | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | 22.90 | 2 | Pilot Initiative A | 2023-02-16T03:41:00 |
| 3 | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | 24.85 | 3 | Baseline Model | 2024-07-27T10:58:00 |
| 4 | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | 26.80 | 4 | Distributed Cluster | 2025-12-11T17:15:00 |

### `v_economic_condition_financial_crisis`

This is the inverse of `v_financial_crisis_economic_condition_detail`: it joins `economic_conditions` to `financial_crisises` on `financial_crisis_id`, presenting each economic condition alongside its parent crisis. Row 1 shows condition 1 (`condition_type` `inequality`, `measurement_value` 14.45) linked to crisis 1 (`severity_index` 20.95). The view is useful when analysis starts from an economic indicator and asks which crisis it belongs to.

**View `v_economic_condition_financial_crisis`**

```sql
CREATE VIEW v_economic_condition_financial_crisis AS
SELECT a.id, a.condition_type, a.measurement_value, a.measurement_unit, b.id AS crisis_id, b.start_date AS crisis_start_date, b.end_date AS crisis_end_date
FROM economic_conditions a JOIN financial_crisises b ON a.financial_crisis_id = b.id;
```

| id | condition_type | measurement_value | measurement_unit | crisis_id | crisis_start_date | crisis_end_date |
|---|---|---|---|---|---|---|
| 1 | inequality | 14.45 | extended-measurem-87 | 1 | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 |
| 2 | debt | 17.90 | integrated-measurem-88 | 2 | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 |
| 3 | stagnantIncome | 21.35 | seasonal-measurem-89 | 3 | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 |
| 4 | financialization | 24.80 | regional-measurem-90 | 4 | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 |

### `v_bailout_program_government_agency_detail`

This view joins `bailout_programs` to `government_agencies` on `bailout_program_id`. Row 1 links program 1 (`program_name` `Extended Review`, `total_cost` 61.82) to agency 1000 (`agency_name` `FSG Social Impact Advisors`, `agency_type` `centralBank`, `jurisdiction` `regional-jurisdic-30`). The join answers: which government agency administered which bailout program?

**View `v_bailout_program_government_agency_detail`**

```sql
CREATE VIEW v_bailout_program_government_agency_detail AS
SELECT a.bailout_program_id, a.program_name, a.start_date, b.id AS agency_id, b.agency_name AS agency_agency_name, b.jurisdiction AS agency_jurisdiction
FROM bailout_programs a
  JOIN programs_agencies j ON j.bailout_program_id = a.bailout_program_id
  JOIN government_agencies b ON b.id = j.government_agency_id;
```

| bailout_program_id | program_name | start_date | agency_id | agency_agency_name | agency_jurisdiction |
|---|---|---|---|---|---|
| 1 | Extended Review | 2022-09-05T20:24:00 | 1000 | FSG Social Impact Advisors | regional-jurisdic-30 |
| 1 | Extended Review | 2022-09-05T20:24:00 | 1001 | Whirlpool Corporation | legacy-jurisdic-31 |
| 2 | Pilot Initiative A | 2023-02-16T03:41:00 | 1001 | Whirlpool Corporation | legacy-jurisdic-31 |
| 2 | Pilot Initiative A | 2023-02-16T03:41:00 | 1002 | Education Writers Association | compact-jurisdic-32 |
| 3 | Baseline Model | 2024-07-27T10:58:00 | 1002 | Education Writers Association | compact-jurisdic-32 |
| 3 | Baseline Model | 2024-07-27T10:58:00 | 1003 | Switch Card Services Ltd. | composite-jurisdic-33 |
| 4 | Distributed Cluster | 2025-12-11T17:15:00 | 1003 | Switch Card Services Ltd. | composite-jurisdic-33 |
| 4 | Distributed Cluster | 2025-12-11T17:15:00 | 1000 | FSG Social Impact Advisors | regional-jurisdic-30 |

### `v_bailout_program_financial_institution_detail`

This view joins `bailout_programs` to `financial_institutions` on `bailout_program_id`. Row 1 links program 1 to institution 1 (`institution_name` `Extended Corridor`, `institution_type` `bank`, `asset_size` 0.4837, `risk_rating` `compact-risk-68`). The view answers: which financial institutions received support under which bailout program?

**View `v_bailout_program_financial_institution_detail`**

```sql
CREATE VIEW v_bailout_program_financial_institution_detail AS
SELECT a.bailout_program_id, a.program_name, a.start_date, b.id AS institution_id, b.institution_name AS institution_institution_name, b.institution_type AS institution_institution_type
FROM bailout_programs a
  JOIN programs_institutions j ON j.bailout_program_id = a.bailout_program_id
  JOIN financial_institutions b ON b.id = j.financial_institution_id;
```

| bailout_program_id | program_name | start_date | institution_id | institution_institution_name | institution_institution_type |
|---|---|---|---|---|---|
| 1 | Extended Review | 2022-09-05T20:24:00 | 1 | Extended Corridor | bank |
| 1 | Extended Review | 2022-09-05T20:24:00 | 2 | Pilot Series A | investmentFirm |
| 2 | Pilot Initiative A | 2023-02-16T03:41:00 | 2 | Pilot Series A | investmentFirm |
| 2 | Pilot Initiative A | 2023-02-16T03:41:00 | 3 | Baseline Assessment | insuranceCompany |
| 3 | Baseline Model | 2024-07-27T10:58:00 | 3 | Baseline Assessment | insuranceCompany |
| 3 | Baseline Model | 2024-07-27T10:58:00 | 4 | Distributed Survey | bank |
| 4 | Distributed Cluster | 2025-12-11T17:15:00 | 4 | Distributed Survey | bank |
| 4 | Distributed Cluster | 2025-12-11T17:15:00 | 1 | Extended Corridor | bank |

### `v_bailout_program_financial_crisis`

This view joins `bailout_programs` to `financial_crisises` on `financial_crisis_id`, the same logical join as `v_financial_crisis_bailout_program` but with the program as the driving table. Row 1 shows program 1 (`program_name` `Extended Review`, `total_cost` 61.82, `status` `active`) linked to crisis 1 (`severity_index` 20.95, `affected_regions` `compact-affected-62`). The view is useful when analysis starts from a program and asks which crisis it was designed to address.

**View `v_bailout_program_financial_crisis`**

```sql
CREATE VIEW v_bailout_program_financial_crisis AS
SELECT a.bailout_program_id, a.program_name, a.start_date, a.end_date, b.id AS crisis_id, b.start_date AS crisis_start_date, b.end_date AS crisis_end_date
FROM bailout_programs a JOIN financial_crisises b ON a.financial_crisis_id = b.id;
```

| bailout_program_id | program_name | start_date | end_date | crisis_id | crisis_start_date | crisis_end_date |
|---|---|---|---|---|---|---|
| 1 | Extended Review | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | 1 | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 |
| 2 | Pilot Initiative A | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | 2 | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 |
| 3 | Baseline Model | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | 3 | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 |
| 4 | Distributed Cluster | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | 4 | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 |

### `v_government_agency_bailout_program`

This view joins `government_agencies` to `bailout_programs` on `bailout_program_id`. Row 1 links agency 1000 (`agency_name` `FSG Social Impact Advisors`, `agency_type` `centralBank`) to program 1 (`program_name` `Extended Review`, `total_cost` 61.82). The view answers: which programs was a given agency responsible for administering?

**View `v_government_agency_bailout_program`**

```sql
CREATE VIEW v_government_agency_bailout_program AS
SELECT a.id, a.agency_name, a.jurisdiction, a.established_date, b.bailout_program_id AS program_bailout_program_id, b.program_name AS program_program_name, b.start_date AS program_start_date
FROM government_agencies a JOIN bailout_programs b ON a.bailout_program_id = b.bailout_program_id;
```

| id | agency_name | jurisdiction | established_date | program_bailout_program_id | program_program_name | program_start_date |
|---|---|---|---|---|---|---|
| 1000 | FSG Social Impact Advisors | regional-jurisdic-30 | 2024-03-27 | 1 | Extended Review | 2022-09-05T20:24:00 |
| 1001 | Whirlpool Corporation | legacy-jurisdic-31 | 2025-08-11 | 2 | Pilot Initiative A | 2023-02-16T03:41:00 |
| 1002 | Education Writers Association | compact-jurisdic-32 | 2022-01-22 | 3 | Baseline Model | 2024-07-27T10:58:00 |
| 1003 | Switch Card Services Ltd. | composite-jurisdic-33 | 2023-06-06 | 4 | Distributed Cluster | 2025-12-11T17:15:00 |

### `v_government_agency_financial_institution`

This view joins `government_agencies` to `financial_institutions` on `government_agency_id`. Row 1 links agency 1000 (`agency_name` `FSG Social Impact Advisors`) to institution 1 (`institution_name` `Extended Corridor`, `institution_type` `bank`, `is_systemically_important` false). The join answers: which institutions were overseen by which agencies?

**View `v_government_agency_financial_institution`**

```sql
CREATE VIEW v_government_agency_financial_institution AS
SELECT a.id, a.agency_name, a.jurisdiction, a.established_date, b.id AS institution_id, b.institution_name AS institution_institution_name, b.institution_type AS institution_institution_type
FROM government_agencies a JOIN financial_institutions b ON a.financial_institution_id = b.id;
```

| id | agency_name | jurisdiction | established_date | institution_id | institution_institution_name | institution_institution_type |
|---|---|---|---|---|---|---|
| 1000 | FSG Social Impact Advisors | regional-jurisdic-30 | 2024-03-27 | 1 | Extended Corridor | bank |
| 1001 | Whirlpool Corporation | legacy-jurisdic-31 | 2025-08-11 | 2 | Pilot Series A | investmentFirm |
| 1002 | Education Writers Association | compact-jurisdic-32 | 2022-01-22 | 3 | Baseline Assessment | insuranceCompany |
| 1003 | Switch Card Services Ltd. | composite-jurisdic-33 | 2023-06-06 | 4 | Distributed Survey | bank |

### `v_government_agency_policy_decision`

This view joins `government_agencies` to `policy_decisions` on `government_agency_id`. Row 1 links agency 1000 (`agency_name` `FSG Social Impact Advisors`, `agency_type` `centralBank`) to decision 1 (`decision_title` `Pilot Cluster`, `decision_type` `deregulation`, `effective_date` `2023-02-14`). The view answers: which policy decisions were issued by which agencies?

**View `v_government_agency_policy_decision`**

```sql
CREATE VIEW v_government_agency_policy_decision AS
SELECT a.id, a.agency_name, a.jurisdiction, a.established_date, b.id AS decision_id, b.decision_title AS decision_decision_title, b.effective_date AS decision_effective_date
FROM government_agencies a JOIN policy_decisions b ON a.policy_decision_id = b.id;
```

| id | agency_name | jurisdiction | established_date | decision_id | decision_decision_title | decision_effective_date |
|---|---|---|---|---|---|---|
| 1000 | FSG Social Impact Advisors | regional-jurisdic-30 | 2024-03-27 | 1 | Pilot Cluster | 2023-02-14 |
| 1001 | Whirlpool Corporation | legacy-jurisdic-31 | 2025-08-11 | 2 | Baseline Review | 2024-07-25 |
| 1002 | Education Writers Association | compact-jurisdic-32 | 2022-01-22 | 3 | Distributed Initiative A | 2025-12-09 |
| 1003 | Switch Card Services Ltd. | composite-jurisdic-33 | 2023-06-06 | 4 | Adaptive Model | 2022-05-20 |

### `v_financial_institution_bailout_program`

This view joins `financial_institutions` to `bailout_programs` on `bailout_program_id`. Row 1 links institution 1 (`institution_name` `Extended Corridor`, `institution_type` `bank`, `asset_size` 0.4837) to program 1 (`program_name` `Extended Review`, `total_cost` 61.82). The view answers: which bailout programs supported a given institution?

**View `v_financial_institution_bailout_program`**

```sql
CREATE VIEW v_financial_institution_bailout_program AS
SELECT a.id, a.institution_name, a.institution_type, a.asset_size, b.bailout_program_id AS program_bailout_program_id, b.program_name AS program_program_name, b.start_date AS program_start_date
FROM financial_institutions a JOIN bailout_programs b ON a.bailout_program_id = b.bailout_program_id;
```

| id | institution_name | institution_type | asset_size | program_bailout_program_id | program_program_name | program_start_date |
|---|---|---|---|---|---|---|
| 1 | Extended Corridor | bank | 0.4836947300000001 | 1 | Extended Review | 2022-09-05T20:24:00 |
| 2 | Pilot Series A | investmentFirm | 0.6000001 | 2 | Pilot Initiative A | 2023-02-16T03:41:00 |
| 3 | Baseline Assessment | insuranceCompany | 0.56 | 3 | Baseline Model | 2024-07-27T10:58:00 |
| 4 | Distributed Survey | bank | 0.351342673308077 | 4 | Distributed Cluster | 2025-12-11T17:15:00 |

### `v_financial_institution_government_agency`

This view joins `financial_institutions` to `government_agencies` on `government_agency_id`. Row 1 links institution 1 (`institution_name` `Extended Corridor`, `risk_rating` `compact-risk-68`) to agency 1000 (`agency_name` `FSG Social Impact Advisors`, `agency_type` `centralBank`). The view answers: which agency oversaw a given institution?

**View `v_financial_institution_government_agency`**

```sql
CREATE VIEW v_financial_institution_government_agency AS
SELECT a.id, a.institution_name, a.institution_type, a.asset_size, b.id AS agency_id, b.agency_name AS agency_agency_name, b.jurisdiction AS agency_jurisdiction
FROM financial_institutions a JOIN government_agencies b ON a.government_agency_id = b.id;
```

| id | institution_name | institution_type | asset_size | agency_id | agency_agency_name | agency_jurisdiction |
|---|---|---|---|---|---|---|
| 1 | Extended Corridor | bank | 0.4836947300000001 | 1000 | FSG Social Impact Advisors | regional-jurisdic-30 |
| 2 | Pilot Series A | investmentFirm | 0.6000001 | 1001 | Whirlpool Corporation | legacy-jurisdic-31 |
| 3 | Baseline Assessment | insuranceCompany | 0.56 | 1002 | Education Writers Association | compact-jurisdic-32 |
| 4 | Distributed Survey | bank | 0.351342673308077 | 1003 | Switch Card Services Ltd. | composite-jurisdic-33 |

### `v_financial_institution_economic_condition`

This view joins `financial_institutions` to `economic_conditions` on `economic_condition_id`. Row 1 links institution 1 (`institution_name` `Extended Corridor`, `institution_type` `bank`) to condition 1 (`condition_type` `inequality`, `measurement_value` 14.45, `geographic_scope` `distributed-geograph-78`). The view answers: under which economic conditions did a given institution operate?

**View `v_financial_institution_economic_condition`**

```sql
CREATE VIEW v_financial_institution_economic_condition AS
SELECT a.id, a.institution_name, a.institution_type, a.asset_size, b.id AS condition_id, b.condition_type AS condition_condition_type, b.measurement_value AS condition_measurement_value
FROM financial_institutions a JOIN economic_conditions b ON a.economic_condition_id = b.id;
```

| id | institution_name | institution_type | asset_size | condition_id | condition_condition_type | condition_measurement_value |
|---|---|---|---|---|---|---|
| 1 | Extended Corridor | bank | 0.4836947300000001 | 1 | inequality | 14.45 |
| 2 | Pilot Series A | investmentFirm | 0.6000001 | 2 | debt | 17.90 |
| 3 | Baseline Assessment | insuranceCompany | 0.56 | 3 | stagnantIncome | 21.35 |
| 4 | Distributed Survey | bank | 0.351342673308077 | 4 | financialization | 24.80 |

### `v_policy_decision_economic_condition`

This view joins `policy_decisions` to `economic_conditions` on `economic_condition_id`. Row 1 links decision 1 (`decision_title` `Pilot Cluster`, `decision_type` `deregulation`) to condition 1 (`condition_type` `inequality`, `measurement_value` 14.45). The view answers: which economic conditions prompted which policy decisions?

**View `v_policy_decision_economic_condition`**

```sql
CREATE VIEW v_policy_decision_economic_condition AS
SELECT a.id, a.decision_title, a.effective_date, a.decision_type, b.id AS condition_id, b.condition_type AS condition_condition_type, b.measurement_value AS condition_measurement_value
FROM policy_decisions a JOIN economic_conditions b ON a.economic_condition_id = b.id;
```

| id | decision_title | effective_date | decision_type | condition_id | condition_condition_type | condition_measurement_value |
|---|---|---|---|---|---|---|
| 1 | Pilot Cluster | 2023-02-14 | deregulation | 1 | inequality | 14.45 |
| 2 | Baseline Review | 2024-07-25 | fiscalTightening | 2 | debt | 17.90 |
| 3 | Distributed Initiative A | 2025-12-09 | monetaryExpansion | 3 | stagnantIncome | 21.35 |
| 4 | Adaptive Model | 2022-05-20 | supervisionRelaxation | 4 | financialization | 24.80 |

### `v_policy_decision_government_agency`

This view joins `policy_decisions` to `government_agencies` on `government_agency_id`. Row 1 links decision 1 (`decision_title` `Pilot Cluster`, `decision_type` `deregulation`, `effective_date` `2023-02-14`) to agency 1000 (`agency_name` `FSG Social Impact Advisors`, `agency_type` `centralBank`). The view answers: which agency issued a given policy decision?

**View `v_policy_decision_government_agency`**

```sql
CREATE VIEW v_policy_decision_government_agency AS
SELECT a.id, a.decision_title, a.effective_date, a.decision_type, b.id AS agency_id, b.agency_name AS agency_agency_name, b.jurisdiction AS agency_jurisdiction
FROM policy_decisions a JOIN government_agencies b ON a.government_agency_id = b.id;
```

| id | decision_title | effective_date | decision_type | agency_id | agency_agency_name | agency_jurisdiction |
|---|---|---|---|---|---|---|
| 1 | Pilot Cluster | 2023-02-14 | deregulation | 1000 | FSG Social Impact Advisors | regional-jurisdic-30 |
| 2 | Baseline Review | 2024-07-25 | fiscalTightening | 1001 | Whirlpool Corporation | legacy-jurisdic-31 |
| 3 | Distributed Initiative A | 2025-12-09 | monetaryExpansion | 1002 | Education Writers Association | compact-jurisdic-32 |
| 4 | Adaptive Model | 2022-05-20 | supervisionRelaxation | 1003 | Switch Card Services Ltd. | composite-jurisdic-33 |

### `v_policy_decision_financial_crisis`

This view joins `policy_decisions` to `financial_crisises` on `financial_crisis_id`. Row 1 links decision 1 (`decision_title` `Pilot Cluster`, `decision_type` `deregulation`) to crisis 1 (`severity_index` 20.95, `affected_regions` `compact-affected-62`). The view answers: which crisis context did a given policy decision address?

**View `v_policy_decision_financial_crisis`**

```sql
CREATE VIEW v_policy_decision_financial_crisis AS
SELECT a.id, a.decision_title, a.effective_date, a.decision_type, b.id AS crisis_id, b.start_date AS crisis_start_date, b.end_date AS crisis_end_date
FROM policy_decisions a JOIN financial_crisises b ON a.financial_crisis_id = b.id;
```

| id | decision_title | effective_date | decision_type | crisis_id | crisis_start_date | crisis_end_date |
|---|---|---|---|---|---|---|
| 1 | Pilot Cluster | 2023-02-14 | deregulation | 1 | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 |
| 2 | Baseline Review | 2024-07-25 | fiscalTightening | 2 | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 |
| 3 | Distributed Initiative A | 2025-12-09 | monetaryExpansion | 3 | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 |
| 4 | Adaptive Model | 2022-05-20 | supervisionRelaxation | 4 | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 |

## Synthesis

The schema models a five-actor ecosystem — crises, economic conditions, bailout programs, government agencies, and financial institutions — with policy decisions serving as the connective tissue that binds them. Foreign keys flow from `financial_crisises` to `policy_decisions` and `bailout_programs`; from `economic_conditions` to `financial_crisises`; from `bailout_programs` to `financial_crisises`; from `government_agencies` to `bailout_programs`, `financial_institutions`, and `policy_decisions`; from `financial_institutions` to `bailout_programs`, `government_agencies`, and `economic_conditions`; and from `policy_decisions` to `economic_conditions`, `government_agencies`, and `financial_crisises`. The three junction tables — `crisises_conditions`, `programs_agencies`, and `programs_institutions` — handle the many-to-many relationships that the single-column foreign keys cannot express. The twenty materialized views each perform a two-table join that reconstructs a single domain fact from the normalized tables, enabling analysts to ask and answer questions about the crisis-response ecosystem without writing join logic themselves. Every row in every view can be traced back to specific base-table records — crisis 1 with severity 20.95, program 1 with cost 61.82, agency 1000 `FSG Social Impact Advisors`, institution 1 `Extended Corridor`, decision 1 `Pilot Cluster` — grounding the abstract schema in concrete, queryable data.