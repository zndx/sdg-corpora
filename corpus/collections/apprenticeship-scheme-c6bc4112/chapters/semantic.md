# Chapter 7 — From Ontology to Relational Schema: Apprenticeship Domain Modelling

The apprenticeship domain captures the interlocking relationships between training schemes, employers, participants, funding mechanisms, and the economic sectors in which they operate. An apprentice does not exist in isolation; they are enrolled in a scheme, sponsored by an employer, funded through an instrument, and working toward a qualification — all within the context of a sector that may be experiencing a skill gap. This chapter explains how that conceptual model is encoded as a set of normalized base tables and how a collection of materialized views reconstructs the domain facts that analysts and data consumers need.

## Base Tables and Entity Types

The schema defines eight base tables, each representing a distinct entity type in the apprenticeship domain. The primary entity is `apprenticeship_schemes`, which stores the structural metadata for each programme. Its primary key is `scheme_id`, a column that accepts both integer identifiers (such as `4716393` and `338514`) and string-based identifiers (such as `template_ivacode_pagata_20ind` and `4bbb5d4c-9bad-11eb-a8a2-19ed5c03f8d3`). The scheme carries descriptive attributes: `level` (e.g., `Intermediate`, `Advanced`, `Higher`), `sector` (e.g., `adaptive-sector-53`, `distributed-sector-54`), `duration_months` (ranging from `44` to `74`), and `status` (one of `active`, `inactive`, or `pending`). Crucially, `apprenticeship_schemes` also holds foreign-key columns — `framework_id`, `training_framework_id`, `economic_sector_id`, and `funding_instrument_id` — that link the scheme to its supporting entities.

**Table `apprenticeship_schemes`**

| scheme_id | level | sector | duration_months | status | framework_id | training_framework_id | economic_sector_id | funding_instrument_id |
|---|---|---|---|---|---|---|---|---|
| 4716393 | Intermediate | adaptive-sector-53 | 44 | active | lu_tax_code_template_m11 | 100 | 1 | 1000 |
| 338514 | Advanced | distributed-sector-54 | 54 | inactive | 228bd7e4-9bad-11eb-a8a2-19ed5c03f8d3 | 101 | 2 | 1001 |
| template_ivacode_pagata_20ind | Higher | baseline-sector-55 | 64 | pending | 8843756 | 102 | 3 | 1002 |
| 4bbb5d4c-9bad-11eb-a8a2-19ed5c03f8d3 | Intermediate | pilot-sector-56 | 74 | active | ChIJm7V_gxFu5kcRAbqaOJHQUy0 | 103 | 4 | 1003 |

The `training_frameworks` table models the curricular backbone of each scheme. Its primary key is `id`, an integer column (values `100` through `103` in the sample data). Each framework carries a `framework_id` (a string such as `lu_tax_code_template_m11` or `228bd7e4-9bad-11eb-a8a2-19ed5c03f8d3`), a human-readable `title` (e.g., `Compact Initiative`, `Legacy Model`, `Regional Cluster A`, `Seasonal Review`), a `version` label, a `last_updated` timestamp, and a `competency_count` (ranging from `16` to `66`). The table also stores `scheme_id` and `qualification_id` as foreign keys, establishing a bidirectional link back to the scheme and forward to the qualification.

**Table `training_frameworks`**

| id | framework_id | title | version | last_updated | competency_count | scheme_id | qualification_id |
|---|---|---|---|---|---|---|---|
| 100 | lu_tax_code_template_m11 | Compact Initiative | seasonal-version-71 | 2023-06-17T17:27:00 | 18 | 4716393 | 005588c4-9bac-11eb-a8a2-19ed5c03f8d3 |
| 101 | 228bd7e4-9bad-11eb-a8a2-19ed5c03f8d3 | Legacy Model | regional-version-72 | 2024-11-01T00:44:00 | 39 | 338514 | 1562831 |
| 102 | 8843756 | Regional Cluster A | legacy-version-73 | 2025-04-12T07:01:00 | 66 | template_ivacode_pagata_20ind | 9424925 |
| 103 | ChIJm7V_gxFu5kcRAbqaOJHQUy0 | Seasonal Review | compact-version-74 | 2022-09-23T14:18:00 | 16 | 4bbb5d4c-9bad-11eb-a8a2-19ed5c03f8d3 | 1996940 |

Economic context is captured in `economic_sectors`. The primary key is `economic_sector_id` (integers `1` through `4`), and each row carries a `sector_code` (e.g., `89434`, `8843752`, `3001009030220`), a `sector_name` (e.g., `Distributed Survey`, `Adaptive Corridor D`, `Primary Series`, `Composite Assessment`), a `skill_shortage_level` (one of `low`, `moderate`, `high`, `critical`), and an `apprenticeship_capacity` (ranging from `22` to `43`). Timestamps `created_at` and `updated_at` track the lifecycle of each sector record. The table includes `scheme_id` and `gap_id` as foreign keys, connecting the sector to its associated scheme and to a skill gap record.

**Table `economic_sectors`**

| economic_sector_id | sector_code | sector_name | skill_shortage_level | apprenticeship_capacity | scheme_id | gap_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|
| 1 | 89434 | Distributed Survey | low | 22 | 4716393 | 10449531 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | 8843752 | Adaptive Corridor D | moderate | 29 | 338514 | 575212 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | 3001009030220 | Primary Series | high | 36 | template_ivacode_pagata_20ind | 317 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | 937714 | Composite Assessment | critical | 43 | 4bbb5d4c-9bad-11eb-a8a2-19ed5c03f8d3 | ChIJ20iLSYBt5kcRqH2vq_dd6GU | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The `apprenticeship_participants` table records individual enrolments. Its primary key is `apprenticeship_participant_id` (integers `100` through `103`), and each participant carries a `participant_id` (a mix of integers and UUIDs, such as `3990185` and `c7460a44-8fcc-11eb-924d-9cd76263cbd0`), demographic attributes (`age` from `35` to `50`, `gender` as `male`, `female`, or `other`), `employment_status` (one of `new_hire`, `existing_employee`, `unemployed`), a `start_date`, and a `completion_status` (one of `in_progress`, `completed`, `dropped_out`). Foreign keys `scheme_id`, `employer_id`, and `qualification_id` tie the participant to their scheme, sponsoring employer, and target qualification.

**Table `apprenticeship_participants`**

| apprenticeship_participant_id | participant_id | age | employment_status | gender | start_date | completion_status | scheme_id | employer_id | qualification_id |
|---|---|---|---|---|---|---|---|---|---|
| 100 | 3990185 | 35 | new_hire | male | 2022-09-05 | in_progress | 4716393 | 1 | 005588c4-9bac-11eb-a8a2-19ed5c03f8d3 |
| 101 | 4716387 | 40 | existing_employee | female | 2023-02-16 | completed | 338514 | 2 | 1562831 |
| 102 | 69430 | 45 | unemployed | other | 2024-07-27 | dropped_out | template_ivacode_pagata_20ind | 3 | 9424925 |
| 103 | c7460a44-8fcc-11eb-924d-9cd76263cbd0 | 50 | new_hire | male | 2025-12-11 | in_progress | 4bbb5d4c-9bad-11eb-a8a2-19ed5c03f8d3 | 4 | 1996940 |

Employers are modelled in the `employers` table, keyed by `id` (integers `1` through `4`). Each employer has an `employer_id`, a `name` (e.g., `The Hongkong and Shanghai Banking Corporation Limited`, `ChargePoint Holdings.`, `Intl. Business Machines`, `Feedback Ratings`), a `sector` reference, `total_workforce` (from `19` to `3565`), `apprentice_count` (from `1` to `44`), and a `reclassification_rate` (from `3.70` to `11.80`). The table also stores `scheme_id`, `apprenticeship_participant_id`, and `funding_instrument_id` as foreign keys.

**Table `employers`**

| id | employer_id | name | sector | total_workforce | apprentice_count | reclassification_rate | scheme_id | apprenticeship_participant_id | funding_instrument_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | The Hongkong and Shanghai Banking Corporation Limited | Extended Review | adaptive-sector-53 | 3565 | 44 | 3.70 | 4716393 | 100 | 1000 |
| 2 | ChargePoint Holdings. | Pilot Initiative A | distributed-sector-54 | 55 | 11 | 6.40 | 338514 | 101 | 1001 |
| 3 | Intl. Business Machines | Baseline Model | baseline-sector-55 | 19 | 1 | 9.10 | template_ivacode_pagata_20ind | 102 | 1002 |
| 4 | Feedback Ratings | Distributed Cluster | pilot-sector-56 | 3093 | 16 | 11.80 | 4bbb5d4c-9bad-11eb-a8a2-19ed5c03f8d3 | 103 | 1003 |

Funding is captured in `funding_instruments`, keyed by `id` (integers `1000` through `1003`). Each instrument has an `instrument_id` (e.g., `6926365`, `account_pymes_691`), a `type` (one of `employer_levy`, `grant`, `tax_relief`, `reimbursement`), an `amount` (from `12.74` to `25.47`), a `currency` label (e.g., `seasonal-currency-71`), an `eligibility_criteria` (e.g., `composite-eligibil-57`), and an `effective_date`. Foreign keys `scheme_id`, `employer_id`, and `apprenticeship_participant_id` link the instrument to the relevant entities.

**Table `funding_instruments`**

| id | instrument_id | type | amount | currency | eligibility_criteria | effective_date | scheme_id | employer_id | apprenticeship_participant_id |
|---|---|---|---|---|---|---|---|---|---|
| 1000 | 6926365 | employer_levy | 13.49 | seasonal-currency-71 | composite-eligibil-57 | 2023-02-14 | 4716393 | 1 | 100 |
| 1001 | account_pymes_691 | grant | 25.47 | regional-currency-72 | primary-eligibil-58 | 2024-07-25 | 338514 | 2 | 101 |
| 1002 | 726063 | tax_relief | 19.72 | legacy-currency-73 | adaptive-eligibil-59 | 2025-12-09 | template_ivacode_pagata_20ind | 3 | 102 |
| 1003 | 23256422 | reimbursement | 12.74 | compact-currency-74 | distributed-eligibil-60 | 2022-05-20 | 4bbb5d4c-9bad-11eb-a8a2-19ed5c03f8d3 | 4 | 103 |

Skill gaps are recorded in `skill_gaps`, keyed by `gap_id` (values such as `10449531`, `575212`, `317`, and `ChIJ20iLSYBt5kcRqH2vq_dd6GU`). The table stores the gap's name, severity, affected sectors, and remediation strategy, along with `created_at` and `updated_at` timestamps.

**Table `skill_gaps`**

| gap_id | sector | occupation | severity | estimated_shortage | reported_date | economic_sector_id | scheme_id | qualification_id |
|---|---|---|---|---|---|---|---|---|
| 10449531 | adaptive-sector-53 | legacy-occupati-37 | low | 32 | 2025-04-27 | 1 | 4716393 | 005588c4-9bac-11eb-a8a2-19ed5c03f8d3 |
| 575212 | distributed-sector-54 | compact-occupati-38 | moderate | 40 | 2022-09-11 | 2 | 338514 | 1562831 |
| 317 | baseline-sector-55 | composite-occupati-39 | high | 48 | 2023-02-22 | 3 | template_ivacode_pagata_20ind | 9424925 |
| ChIJ20iLSYBt5kcRqH2vq_dd6GU | pilot-sector-56 | primary-occupati-40 | critical | 56 | 2024-07-06 | 4 | 4bbb5d4c-9bad-11eb-a8a2-19ed5c03f8d3 | 1996940 |

Qualifications are stored in `qualifications`, keyed by `qualification_id` (a mix of UUIDs like `005588c4-9bac-11eb-a8a2-19ed5c03f8d3` and integers like `1562831`, `9424925`, `1996940`). Each qualification carries a name, level, issuing body, validity period, and description.

**Table `qualifications`**

| qualification_id | title | level | issuing_body | credits | awarded_date | apprenticeship_participant_id | training_framework_id | gap_id |
|---|---|---|---|---|---|---|---|---|
| 005588c4-9bac-11eb-a8a2-19ed5c03f8d3 | Compact Initiative | GCSE | baseline-issuing-13 | 28 | 2022-09-27 | 100 | 100 | 10449531 |
| 1562831 | Legacy Model | A_Level | pilot-issuing-14 | 33 | 2023-02-11 | 101 | 101 | 575212 |
| 9424925 | Regional Cluster A | Intermediate | extended-issuing-15 | 38 | 2024-07-22 | 102 | 102 | 317 |
| 1996940 | Seasonal Review | Advanced | integrated-issuing-16 | 43 | 2025-12-06 | 103 | 103 | ChIJ20iLSYBt5kcRqH2vq_dd6GU |

## Foreign-Key Relationships and Normalization

The foreign-key columns embedded in each base table encode the domain's cardinality-bounded relationships. In `apprenticeship_schemes`, the columns `framework_id`, `training_framework_id`, `economic_sector_id`, and `funding_instrument_id` each point to a single related record in their respective tables. This design means that a scheme row alone does not contain the full name or detail of its framework, sector, or funding instrument — those details must be joined from the referenced tables. The same pattern holds for `training_frameworks` (which stores `scheme_id` and `qualification_id`), `economic_sectors` (which stores `scheme_id` and `gap_id`), `apprenticeship_participants` (which stores `scheme_id`, `employer_id`, and `qualification_id`), `employers` (which stores `scheme_id`, `apprenticeship_participant_id`, and `funding_instrument_id`), and `funding_instruments` (which stores `scheme_id`, `employer_id`, and `apprenticeship_participant_id`).

This normalization strategy avoids data duplication: the employer name `The Hongkong and Shanghai Banking Corporation Limited` appears once in `employers` and is referenced by `apprenticeship_participants` and `funding_instruments` via `employer_id`. Similarly, the qualification `005588c4-9bac-11eb-a8a2-19ed5c03f8d3` is stored once in `qualifications` and referenced by both `training_frameworks` and `apprenticeship_participants`. The trade-off is that answering any question about a complete entity — for example, "what qualification is participant `100` pursuing, and which scheme funds it?" — requires joining across multiple tables.

## Views as Reconstructed Domain Facts

The view layer materializes the most common join patterns as virtual tables, allowing consumers to query domain facts without writing joins explicitly. Each view answers a specific analytical question by combining two or more base tables.

### Scheme–Framework and Scheme–Sector Views

The view `v_apprenticeship_scheme_training_framework` joins `apprenticeship_schemes` with `training_frameworks` on the matching `scheme_id` / `training_framework_id` relationship. It answers the question: "which training framework is associated with each apprenticeship scheme?" For example, scheme `4716393` (level `Intermediate`, status `active`) is linked to framework `100` (`Compact Initiative`, version `seasonal-version-71`, `18` competencies). Scheme `338514` (level `Advanced`, status `inactive`) maps to framework `101` (`Legacy Model`, version `regional-version-72`, `39` competencies).

**View `v_apprenticeship_scheme_training_framework`**

```sql
CREATE VIEW v_apprenticeship_scheme_training_framework AS
SELECT a.scheme_id, a.level, a.sector, a.duration_months, b.id AS framework_id, b.framework_id AS framework_framework_id, b.title AS framework_title
FROM apprenticeship_schemes a JOIN training_frameworks b ON a.training_framework_id = b.id;
```

| scheme_id | level | sector | duration_months | framework_id | framework_framework_id | framework_title |
|---|---|---|---|---|---|---|
| 4716393 | Intermediate | adaptive-sector-53 | 44 | 100 | lu_tax_code_template_m11 | Compact Initiative |
| 338514 | Advanced | distributed-sector-54 | 54 | 101 | 228bd7e4-9bad-11eb-a8a2-19ed5c03f8d3 | Legacy Model |
| template_ivacode_pagata_20ind | Higher | baseline-sector-55 | 64 | 102 | 8843756 | Regional Cluster A |
| 4bbb5d4c-9bad-11eb-a8a2-19ed5c03f8d3 | Intermediate | pilot-sector-56 | 74 | 103 | ChIJm7V_gxFu5kcRAbqaOJHQUy0 | Seasonal Review |

Conversely, `v_training_framework_apprenticeship_scheme` presents the same join from the framework's perspective, answering: "which scheme does each training framework support?" Framework `100` (`Compact Initiative`) supports scheme `4716393`, while framework `103` (`Seasonal Review`) supports scheme `4bbb5d4c-9bad-11eb-a8a2-19ed5c03f8d3`.

**View `v_training_framework_apprenticeship_scheme`**

```sql
CREATE VIEW v_training_framework_apprenticeship_scheme AS
SELECT a.id, a.framework_id, a.title, a.version, b.scheme_id AS scheme_scheme_id, b.level AS scheme_level, b.sector AS scheme_sector
FROM training_frameworks a JOIN apprenticeship_schemes b ON a.scheme_id = b.scheme_id;
```

| id | framework_id | title | version | scheme_scheme_id | scheme_level | scheme_sector |
|---|---|---|---|---|---|---|
| 100 | lu_tax_code_template_m11 | Compact Initiative | seasonal-version-71 | 4716393 | Intermediate | adaptive-sector-53 |
| 101 | 228bd7e4-9bad-11eb-a8a2-19ed5c03f8d3 | Legacy Model | regional-version-72 | 338514 | Advanced | distributed-sector-54 |
| 102 | 8843756 | Regional Cluster A | legacy-version-73 | template_ivacode_pagata_20ind | Higher | baseline-sector-55 |
| 103 | ChIJm7V_gxFu5kcRAbqaOJHQUy0 | Seasonal Review | compact-version-74 | 4bbb5d4c-9bad-11eb-a8a2-19ed5c03f8d3 | Intermediate | pilot-sector-56 |

The view `v_apprenticeship_scheme_economic_sector` joins `apprenticeship_schemes` with `economic_sectors` to answer: "in which economic sector does each scheme operate?" Scheme `4716393` operates in sector `1` (`Distributed Survey`, code `89434`, shortage level `low`, capacity `22`). Scheme `4bbb5d4c-9bad-11eb-a8a2-19ed5c03f8d3` operates in sector `4` (`Composite Assessment`, code `937714`, shortage level `critical`, capacity `43`).

**View `v_apprenticeship_scheme_economic_sector`**

```sql
CREATE VIEW v_apprenticeship_scheme_economic_sector AS
SELECT a.scheme_id, a.level, a.sector, a.duration_months, b.economic_sector_id AS sector_economic_sector_id, b.sector_code AS sector_sector_code, b.sector_name AS sector_sector_name
FROM apprenticeship_schemes a JOIN economic_sectors b ON a.economic_sector_id = b.economic_sector_id;
```

| scheme_id | level | sector | duration_months | sector_economic_sector_id | sector_sector_code | sector_sector_name |
|---|---|---|---|---|---|---|
| 4716393 | Intermediate | adaptive-sector-53 | 44 | 1 | 89434 | Distributed Survey |
| 338514 | Advanced | distributed-sector-54 | 54 | 2 | 8843752 | Adaptive Corridor D |
| template_ivacode_pagata_20ind | Higher | baseline-sector-55 | 64 | 3 | 3001009030220 | Primary Series |
| 4bbb5d4c-9bad-11eb-a8a2-19ed5c03f8d3 | Intermediate | pilot-sector-56 | 74 | 4 | 937714 | Composite Assessment |

The reverse view `v_economic_sector_apprenticeship_scheme` presents the sector's perspective: "which schemes operate within each economic sector?" Sector `1` (`Distributed Survey`) hosts scheme `4716393`, and sector `3` (`Primary Series`) hosts scheme `template_ivacode_pagata_20ind`.

**View `v_economic_sector_apprenticeship_scheme`**

```sql
CREATE VIEW v_economic_sector_apprenticeship_scheme AS
SELECT a.economic_sector_id, a.sector_code, a.sector_name, a.skill_shortage_level, b.scheme_id AS scheme_scheme_id, b.level AS scheme_level, b.sector AS scheme_sector
FROM economic_sectors a JOIN apprenticeship_schemes b ON a.scheme_id = b.scheme_id;
```

| economic_sector_id | sector_code | sector_name | skill_shortage_level | scheme_scheme_id | scheme_level | scheme_sector |
|---|---|---|---|---|---|---|
| 1 | 89434 | Distributed Survey | low | 4716393 | Intermediate | adaptive-sector-53 |
| 2 | 8843752 | Adaptive Corridor D | moderate | 338514 | Advanced | distributed-sector-54 |
| 3 | 3001009030220 | Primary Series | high | template_ivacode_pagata_20ind | Higher | baseline-sector-55 |
| 4 | 937714 | Composite Assessment | critical | 4bbb5d4c-9bad-11eb-a8a2-19ed5c03f8d3 | Intermediate | pilot-sector-56 |

### Scheme–Funding Views

The view `v_apprenticeship_scheme_funding_instrument` joins `apprenticeship_schemes` with `funding_instruments` to answer: "what funding instrument supports each scheme?" Scheme `4716393` is funded by instrument `1000` (`employer_levy`, amount `13.49`, currency `seasonal-currency-71`, effective `2023-02-14`). Scheme `338514` is funded by instrument `1001` (`grant`, amount `25.47`, currency `regional-currency-72`, effective `2024-07-25`).

**View `v_apprenticeship_scheme_funding_instrument`**

```sql
CREATE VIEW v_apprenticeship_scheme_funding_instrument AS
SELECT a.scheme_id, a.level, a.sector, a.duration_months, b.id AS instrument_id, b.instrument_id AS instrument_instrument_id, b.type AS instrument_type
FROM apprenticeship_schemes a JOIN funding_instruments b ON a.funding_instrument_id = b.id;
```

| scheme_id | level | sector | duration_months | instrument_id | instrument_instrument_id | instrument_type |
|---|---|---|---|---|---|---|
| 4716393 | Intermediate | adaptive-sector-53 | 44 | 1000 | 6926365 | employer_levy |
| 338514 | Advanced | distributed-sector-54 | 54 | 1001 | account_pymes_691 | grant |
| template_ivacode_pagata_20ind | Higher | baseline-sector-55 | 64 | 1002 | 726063 | tax_relief |
| 4bbb5d4c-9bad-11eb-a8a2-19ed5c03f8d3 | Intermediate | pilot-sector-56 | 74 | 1003 | 23256422 | reimbursement |

The reverse view `v_funding_instrument_apprenticeship_scheme` presents the funding instrument's perspective: "which scheme does each funding instrument support?" Instrument `1000` (`employer_levy`) supports scheme `4716393`, and instrument `1003` (`reimbursement`) supports scheme `4bbb5d4c-9bad-11eb-a8a2-19ed5c03f8d3`.

**View `v_funding_instrument_apprenticeship_scheme`**

```sql
CREATE VIEW v_funding_instrument_apprenticeship_scheme AS
SELECT a.id, a.instrument_id, a.type, a.amount, b.scheme_id AS scheme_scheme_id, b.level AS scheme_level, b.sector AS scheme_sector
FROM funding_instruments a JOIN apprenticeship_schemes b ON a.scheme_id = b.scheme_id;
```

| id | instrument_id | type | amount | scheme_scheme_id | scheme_level | scheme_sector |
|---|---|---|---|---|---|---|
| 1000 | 6926365 | employer_levy | 13.49 | 4716393 | Intermediate | adaptive-sector-53 |
| 1001 | account_pymes_691 | grant | 25.47 | 338514 | Advanced | distributed-sector-54 |
| 1002 | 726063 | tax_relief | 19.72 | template_ivacode_pagata_20ind | Higher | baseline-sector-55 |
| 1003 | 23256422 | reimbursement | 12.74 | 4bbb5d4c-9bad-11eb-a8a2-19ed5c03f8d3 | Intermediate | pilot-sector-56 |

### Training Framework–Qualification Views

The view `v_training_framework_qualification` joins `training_frameworks` with `qualifications` to answer: "which qualification does each training framework lead to?" Framework `100` (`Compact Initiative`) leads to qualification `005588c4-9bac-11eb-a8a2-19ed5c03f8d3`. Framework `101` (`Legacy Model`) leads to qualification `1562831`.

**View `v_training_framework_qualification`**

```sql
CREATE VIEW v_training_framework_qualification AS
SELECT a.id, a.framework_id, a.title, a.version, b.qualification_id AS qualification_qualification_id, b.title AS qualification_title, b.level AS qualification_level
FROM training_frameworks a JOIN qualifications b ON a.qualification_id = b.qualification_id;
```

| id | framework_id | title | version | qualification_qualification_id | qualification_title | qualification_level |
|---|---|---|---|---|---|---|
| 100 | lu_tax_code_template_m11 | Compact Initiative | seasonal-version-71 | 005588c4-9bac-11eb-a8a2-19ed5c03f8d3 | Compact Initiative | GCSE |
| 101 | 228bd7e4-9bad-11eb-a8a2-19ed5c03f8d3 | Legacy Model | regional-version-72 | 1562831 | Legacy Model | A_Level |
| 102 | 8843756 | Regional Cluster A | legacy-version-73 | 9424925 | Regional Cluster A | Intermediate |
| 103 | ChIJm7V_gxFu5kcRAbqaOJHQUy0 | Seasonal Review | compact-version-74 | 1996940 | Seasonal Review | Advanced |

The reverse view `v_qualification_training_framework` presents the qualification's perspective: "which training framework is associated with each qualification?" Qualification `005588c4-9bac-11eb-a8a2-19ed5c03f8d3` is associated with framework `100`, and qualification `1996940` is associated with framework `103`.

**View `v_qualification_training_framework`**

```sql
CREATE VIEW v_qualification_training_framework AS
SELECT a.qualification_id, a.title, a.level, a.issuing_body, b.id AS framework_id, b.framework_id AS framework_framework_id, b.title AS framework_title
FROM qualifications a JOIN training_frameworks b ON a.training_framework_id = b.id;
```

| qualification_id | title | level | issuing_body | framework_id | framework_framework_id | framework_title |
|---|---|---|---|---|---|---|
| 005588c4-9bac-11eb-a8a2-19ed5c03f8d3 | Compact Initiative | GCSE | baseline-issuing-13 | 100 | lu_tax_code_template_m11 | Compact Initiative |
| 1562831 | Legacy Model | A_Level | pilot-issuing-14 | 101 | 228bd7e4-9bad-11eb-a8a2-19ed5c03f8d3 | Legacy Model |
| 9424925 | Regional Cluster A | Intermediate | extended-issuing-15 | 102 | 8843756 | Regional Cluster A |
| 1996940 | Seasonal Review | Advanced | integrated-issuing-16 | 103 | ChIJm7V_gxFu5kcRAbqaOJHQUy0 | Seasonal Review |

### Economic Sector–Skill Gap Views

The view `v_economic_sector_skill_gap` joins `economic_sectors` with `skill_gaps` to answer: "what skill gap is associated with each economic sector?" Sector `1` (`Distributed Survey`) is associated with gap `10449531`. Sector `4` (`Composite Assessment`) is associated with gap `ChIJ20iLSYBt5kcRqH2vq_dd6GU`.

**View `v_economic_sector_skill_gap`**

```sql
CREATE VIEW v_economic_sector_skill_gap AS
SELECT a.economic_sector_id, a.sector_code, a.sector_name, a.skill_shortage_level, b.gap_id AS gap_gap_id, b.sector AS gap_sector, b.occupation AS gap_occupation
FROM economic_sectors a JOIN skill_gaps b ON a.gap_id = b.gap_id;
```

| economic_sector_id | sector_code | sector_name | skill_shortage_level | gap_gap_id | gap_sector | gap_occupation |
|---|---|---|---|---|---|---|
| 1 | 89434 | Distributed Survey | low | 10449531 | adaptive-sector-53 | legacy-occupati-37 |
| 2 | 8843752 | Adaptive Corridor D | moderate | 575212 | distributed-sector-54 | compact-occupati-38 |
| 3 | 3001009030220 | Primary Series | high | 317 | baseline-sector-55 | composite-occupati-39 |
| 4 | 937714 | Composite Assessment | critical | ChIJ20iLSYBt5kcRqH2vq_dd6GU | pilot-sector-56 | primary-occupati-40 |

The reverse view `v_skill_gap_economic_sector` presents the gap's perspective: "which economic sector does each skill gap affect?" Gap `10449531` affects sector `1`, and gap `ChIJ20iLSYBt5kcRqH2vq_dd6GU` affects sector `4`.

**View `v_skill_gap_economic_sector`**

```sql
CREATE VIEW v_skill_gap_economic_sector AS
SELECT a.gap_id, a.sector, a.occupation, a.severity, b.economic_sector_id AS sector_economic_sector_id, b.sector_code AS sector_sector_code, b.sector_name AS sector_sector_name
FROM skill_gaps a JOIN economic_sectors b ON a.economic_sector_id = b.economic_sector_id;
```

| gap_id | sector | occupation | severity | sector_economic_sector_id | sector_sector_code | sector_sector_name |
|---|---|---|---|---|---|---|
| 10449531 | adaptive-sector-53 | legacy-occupati-37 | low | 1 | 89434 | Distributed Survey |
| 575212 | distributed-sector-54 | compact-occupati-38 | moderate | 2 | 8843752 | Adaptive Corridor D |
| 317 | baseline-sector-55 | composite-occupati-39 | high | 3 | 3001009030220 | Primary Series |
| ChIJ20iLSYBt5kcRqH2vq_dd6GU | pilot-sector-56 | primary-occupati-40 | critical | 4 | 937714 | Composite Assessment |

### Participant–Scheme, Participant–Employer, and Participant–Qualification Views

The view `v_apprenticeship_participant_apprenticeship_scheme` joins `apprenticeship_participants` with `apprenticeship_schemes` to answer: "which scheme is each participant enrolled in?" Participant `100` (age `35`, `new_hire`, `in_progress`) is enrolled in scheme `4716393`. Participant `102` (age `45`, `unemployed`, `dropped_out`) is enrolled in scheme `template_ivacode_pagata_20ind`.

**View `v_apprenticeship_participant_apprenticeship_scheme`**

```sql
CREATE VIEW v_apprenticeship_participant_apprenticeship_scheme AS
SELECT a.apprenticeship_participant_id, a.participant_id, a.age, a.employment_status, b.scheme_id AS scheme_scheme_id, b.level AS scheme_level, b.sector AS scheme_sector
FROM apprenticeship_participants a JOIN apprenticeship_schemes b ON a.scheme_id = b.scheme_id;
```

| apprenticeship_participant_id | participant_id | age | employment_status | scheme_scheme_id | scheme_level | scheme_sector |
|---|---|---|---|---|---|---|
| 100 | 3990185 | 35 | new_hire | 4716393 | Intermediate | adaptive-sector-53 |
| 101 | 4716387 | 40 | existing_employee | 338514 | Advanced | distributed-sector-54 |
| 102 | 69430 | 45 | unemployed | template_ivacode_pagata_20ind | Higher | baseline-sector-55 |
| 103 | c7460a44-8fcc-11eb-924d-9cd76263cbd0 | 50 | new_hire | 4bbb5d4c-9bad-11eb-a8a2-19ed5c03f8d3 | Intermediate | pilot-sector-56 |

The view `v_apprenticeship_participant_employer` joins `apprenticeship_participants` with `employers` to answer: "which employer sponsors each participant?" Participant `100` is sponsored by employer `1` (`The Hongkong and Shanghai Banking Corporation Limited`, workforce `3565`, `44` apprentices). Participant `102` is sponsored by employer `3` (`Intl. Business Machines`, workforce `19`, `1` apprentice).

**View `v_apprenticeship_participant_employer`**

```sql
CREATE VIEW v_apprenticeship_participant_employer AS
SELECT a.apprenticeship_participant_id, a.participant_id, a.age, a.employment_status, b.id AS employer_id, b.employer_id AS employer_employer_id, b.name AS employer_name
FROM apprenticeship_participants a JOIN employers b ON a.employer_id = b.id;
```

| apprenticeship_participant_id | participant_id | age | employment_status | employer_id | employer_employer_id | employer_name |
|---|---|---|---|---|---|---|
| 100 | 3990185 | 35 | new_hire | 1 | The Hongkong and Shanghai Banking Corporation Limited | Extended Review |
| 101 | 4716387 | 40 | existing_employee | 2 | ChargePoint Holdings. | Pilot Initiative A |
| 102 | 69430 | 45 | unemployed | 3 | Intl. Business Machines | Baseline Model |
| 103 | c7460a44-8fcc-11eb-924d-9cd76263cbd0 | 50 | new_hire | 4 | Feedback Ratings | Distributed Cluster |

The view `v_apprenticeship_participant_qualification` joins `apprenticeship_participants` with `qualifications` to answer: "which qualification is each participant pursuing?" Participant `100` is pursuing qualification `005588c4-9bac-11eb-a8a2-19ed5c03f8d3`. Participant `102` is pursuing qualification `9424925`.

**View `v_apprenticeship_participant_qualification`**

```sql
CREATE VIEW v_apprenticeship_participant_qualification AS
SELECT a.apprenticeship_participant_id, a.participant_id, a.age, a.employment_status, b.qualification_id AS qualification_qualification_id, b.title AS qualification_title, b.level AS qualification_level
FROM apprenticeship_participants a JOIN qualifications b ON a.qualification_id = b.qualification_id;
```

| apprenticeship_participant_id | participant_id | age | employment_status | qualification_qualification_id | qualification_title | qualification_level |
|---|---|---|---|---|---|---|
| 100 | 3990185 | 35 | new_hire | 005588c4-9bac-11eb-a8a2-19ed5c03f8d3 | Compact Initiative | GCSE |
| 101 | 4716387 | 40 | existing_employee | 1562831 | Legacy Model | A_Level |
| 102 | 69430 | 45 | unemployed | 9424925 | Regional Cluster A | Intermediate |
| 103 | c7460a44-8fcc-11eb-924d-9cd76263cbd0 | 50 | new_hire | 1996940 | Seasonal Review | Advanced |

### Employer–Scheme, Employer–Participant, and Employer–Funding Views

The view `v_employer_apprenticeship_scheme` joins `employers` with `apprenticeship_schemes` to answer: "which scheme is each employer associated with?" Employer `1` (`The Hongkong and Shanghai Banking Corporation Limited`) is associated with scheme `4716393`. Employer `4` (`Feedback Ratings`) is associated with scheme `4bbb5d4c-9bad-11eb-a8a2-19ed5c03f8d3`.

**View `v_employer_apprenticeship_scheme`**

```sql
CREATE VIEW v_employer_apprenticeship_scheme AS
SELECT a.id, a.employer_id, a.name, a.sector, b.scheme_id AS scheme_scheme_id, b.level AS scheme_level, b.sector AS scheme_sector
FROM employers a JOIN apprenticeship_schemes b ON a.scheme_id = b.scheme_id;
```

| id | employer_id | name | sector | scheme_scheme_id | scheme_level | scheme_sector |
|---|---|---|---|---|---|---|
| 1 | The Hongkong and Shanghai Banking Corporation Limited | Extended Review | adaptive-sector-53 | 4716393 | Intermediate | adaptive-sector-53 |
| 2 | ChargePoint Holdings. | Pilot Initiative A | distributed-sector-54 | 338514 | Advanced | distributed-sector-54 |
| 3 | Intl. Business Machines | Baseline Model | baseline-sector-55 | template_ivacode_pagata_20ind | Higher | baseline-sector-55 |
| 4 | Feedback Ratings | Distributed Cluster | pilot-sector-56 | 4bbb5d4c-9bad-11eb-a8a2-19ed5c03f8d3 | Intermediate | pilot-sector-56 |

The view `v_employer_apprenticeship_participant` joins `employers` with `apprenticeship_participants` to answer: "which participants are sponsored by each employer?" Employer `1` sponsors participant `100` (age `35`, `in_progress`). Employer `4` sponsors participant `103` (age `50`, `in_progress`).

**View `v_employer_apprenticeship_participant`**

```sql
CREATE VIEW v_employer_apprenticeship_participant AS
SELECT a.id, a.employer_id, a.name, a.sector, b.apprenticeship_participant_id AS participant_apprenticeship_participant_id, b.participant_id AS participant_participant_id, b.age AS participant_age
FROM employers a JOIN apprenticeship_participants b ON a.apprenticeship_participant_id = b.apprenticeship_participant_id;
```

| id | employer_id | name | sector | participant_apprenticeship_participant_id | participant_participant_id | participant_age |
|---|---|---|---|---|---|---|
| 1 | The Hongkong and Shanghai Banking Corporation Limited | Extended Review | adaptive-sector-53 | 100 | 3990185 | 35 |
| 2 | ChargePoint Holdings. | Pilot Initiative A | distributed-sector-54 | 101 | 4716387 | 40 |
| 3 | Intl. Business Machines | Baseline Model | baseline-sector-55 | 102 | 69430 | 45 |
| 4 | Feedback Ratings | Distributed Cluster | pilot-sector-56 | 103 | c7460a44-8fcc-11eb-924d-9cd76263cbd0 | 50 |

The view `v_employer_funding_instrument` joins `employers` with `funding_instruments` to answer: "what funding instrument is associated with each employer?" Employer `1` is associated with instrument `1000` (`employer_levy`, amount `13.49`). Employer `4` is associated with instrument `1003` (`reimbursement`, amount `12.74`).

**View `v_employer_funding_instrument`**

```sql
CREATE VIEW v_employer_funding_instrument AS
SELECT a.id, a.employer_id, a.name, a.sector, b.id AS instrument_id, b.instrument_id AS instrument_instrument_id, b.type AS instrument_type
FROM employers a JOIN funding_instruments b ON a.funding_instrument_id = b.id;
```

| id | employer_id | name | sector | instrument_id | instrument_instrument_id | instrument_type |
|---|---|---|---|---|---|---|
| 1 | The Hongkong and Shanghai Banking Corporation Limited | Extended Review | adaptive-sector-53 | 1000 | 6926365 | employer_levy |
| 2 | ChargePoint Holdings. | Pilot Initiative A | distributed-sector-54 | 1001 | account_pymes_691 | grant |
| 3 | Intl. Business Machines | Baseline Model | baseline-sector-55 | 1002 | 726063 | tax_relief |
| 4 | Feedback Ratings | Distributed Cluster | pilot-sector-56 | 1003 | 23256422 | reimbursement |

### Funding Instrument–Scheme, Funding Instrument–Employer, and Funding Instrument–Participant Views

The view `v_funding_instrument_employer` joins `funding_instruments` with `employers` to answer: "which employer receives each funding instrument?" Instrument `1000` (`employer_levy`) is received by employer `1`. Instrument `1002` (`tax_relief`) is received by employer `3`.

**View `v_funding_instrument_employer`**

```sql
CREATE VIEW v_funding_instrument_employer AS
SELECT a.id, a.instrument_id, a.type, a.amount, b.id AS employer_id, b.employer_id AS employer_employer_id, b.name AS employer_name
FROM funding_instruments a JOIN employers b ON a.employer_id = b.id;
```

| id | instrument_id | type | amount | employer_id | employer_employer_id | employer_name |
|---|---|---|---|---|---|---|
| 1000 | 6926365 | employer_levy | 13.49 | 1 | The Hongkong and Shanghai Banking Corporation Limited | Extended Review |
| 1001 | account_pymes_691 | grant | 25.47 | 2 | ChargePoint Holdings. | Pilot Initiative A |
| 1002 | 726063 | tax_relief | 19.72 | 3 | Intl. Business Machines | Baseline Model |
| 1003 | 23256422 | reimbursement | 12.74 | 4 | Feedback Ratings | Distributed Cluster |

The view `v_funding_instrument_apprenticeship_participant` joins `funding_instruments` with `apprenticeship_participants` to answer: "which participant is funded by each instrument?" Instrument `1000` funds participant `100` (age `35`, `in_progress`). Instrument `1003` funds participant `103` (age `50`, `in_progress`).

**View `v_funding_instrument_apprenticeship_participant`**

```sql
CREATE VIEW v_funding_instrument_apprenticeship_participant AS
SELECT a.id, a.instrument_id, a.type, a.amount, b.apprenticeship_participant_id AS participant_apprenticeship_participant_id, b.participant_id AS participant_participant_id, b.age AS participant_age
FROM funding_instruments a JOIN apprenticeship_participants b ON a.apprenticeship_participant_id = b.apprenticeship_participant_id;
```

| id | instrument_id | type | amount | participant_apprenticeship_participant_id | participant_participant_id | participant_age |
|---|---|---|---|---|---|---|
| 1000 | 6926365 | employer_levy | 13.49 | 100 | 3990185 | 35 |
| 1001 | account_pymes_691 | grant | 25.47 | 101 | 4716387 | 40 |
| 1002 | 726063 | tax_relief | 19.72 | 102 | 69430 | 45 |
| 1003 | 23256422 | reimbursement | 12.74 | 103 | c7460a44-8fcc-11eb-924d-9cd76263cbd0 | 50 |

### Skill Gap–Scheme and Skill Gap–Qualification Views

The view `v_skill_gap_apprenticeship_scheme` joins `skill_gaps` with `apprenticeship_schemes` to answer: "which scheme is associated with each skill gap?" Gap `10449531` is associated with scheme `4716393`. Gap `ChIJ20iLSYBt5kcRqH2vq_dd6GU` is associated with scheme `4bbb5d4c-9bad-11eb-a8a2-19ed5c03f8d3`.

**View `v_skill_gap_apprenticeship_scheme`**

```sql
CREATE VIEW v_skill_gap_apprenticeship_scheme AS
SELECT a.gap_id, a.sector, a.occupation, a.severity, b.scheme_id AS scheme_scheme_id, b.level AS scheme_level, b.sector AS scheme_sector
FROM skill_gaps a JOIN apprenticeship_schemes b ON a.scheme_id = b.scheme_id;
```

| gap_id | sector | occupation | severity | scheme_scheme_id | scheme_level | scheme_sector |
|---|---|---|---|---|---|---|
| 10449531 | adaptive-sector-53 | legacy-occupati-37 | low | 4716393 | Intermediate | adaptive-sector-53 |
| 575212 | distributed-sector-54 | compact-occupati-38 | moderate | 338514 | Advanced | distributed-sector-54 |
| 317 | baseline-sector-55 | composite-occupati-39 | high | template_ivacode_pagata_20ind | Higher | baseline-sector-55 |
| ChIJ20iLSYBt5kcRqH2vq_dd6GU | pilot-sector-56 | primary-occupati-40 | critical | 4bbb5d4c-9bad-11eb-a8a2-19ed5c03f8d3 | Intermediate | pilot-sector-56 |

The view `v_skill_gap_qualification` joins `skill_gaps` with `qualifications` to answer: "which qualification is associated with each skill gap?" Gap `10449531` is associated with qualification `005588c4-9bac-11eb-a8a2-19ed5c03f8d3`. Gap `ChIJ20iLSYBt5kcRqH2vq_dd6GU` is associated with qualification `1996940`.

**View `v_skill_gap_qualification`**

```sql
CREATE VIEW v_skill_gap_qualification AS
SELECT a.gap_id, a.sector, a.occupation, a.severity, b.qualification_id AS qualification_qualification_id, b.title AS qualification_title, b.level AS qualification_level
FROM skill_gaps a JOIN qualifications b ON a.qualification_id = b.qualification_id;
```

| gap_id | sector | occupation | severity | qualification_qualification_id | qualification_title | qualification_level |
|---|---|---|---|---|---|---|
| 10449531 | adaptive-sector-53 | legacy-occupati-37 | low | 005588c4-9bac-11eb-a8a2-19ed5c03f8d3 | Compact Initiative | GCSE |
| 575212 | distributed-sector-54 | compact-occupati-38 | moderate | 1562831 | Legacy Model | A_Level |
| 317 | baseline-sector-55 | composite-occupati-39 | high | 9424925 | Regional Cluster A | Intermediate |
| ChIJ20iLSYBt5kcRqH2vq_dd6GU | pilot-sector-56 | primary-occupati-40 | critical | 1996940 | Seasonal Review | Advanced |

### Qualification–Participant and Qualification–Skill Gap Views

The view `v_qualification_apprenticeship_participant` joins `qualifications` with `apprenticeship_participants` to answer: "which participants are pursuing each qualification?" Qualification `005588c4-9bac-11eb-a8a2-19ed5c03f8d3` is pursued by participant `100` (age `35`, `new_hire`). Qualification `1996940` is pursued by participant `103` (age `50`, `new_hire`).

**View `v_qualification_apprenticeship_participant`**

```sql
CREATE VIEW v_qualification_apprenticeship_participant AS
SELECT a.qualification_id, a.title, a.level, a.issuing_body, b.apprenticeship_participant_id AS participant_apprenticeship_participant_id, b.participant_id AS participant_participant_id, b.age AS participant_age
FROM qualifications a JOIN apprenticeship_participants b ON a.apprenticeship_participant_id = b.apprenticeship_participant_id;
```

| qualification_id | title | level | issuing_body | participant_apprenticeship_participant_id | participant_participant_id | participant_age |
|---|---|---|---|---|---|---|
| 005588c4-9bac-11eb-a8a2-19ed5c03f8d3 | Compact Initiative | GCSE | baseline-issuing-13 | 100 | 3990185 | 35 |
| 1562831 | Legacy Model | A_Level | pilot-issuing-14 | 101 | 4716387 | 40 |
| 9424925 | Regional Cluster A | Intermediate | extended-issuing-15 | 102 | 69430 | 45 |
| 1996940 | Seasonal Review | Advanced | integrated-issuing-16 | 103 | c7460a44-8fcc-11eb-924d-9cd76263cbd0 | 50 |

The view `v_qualification_skill_gap` joins `qualifications` with `skill_gaps` to answer: "which skill gap is associated with each qualification?" Qualification `005588c4-9bac-11eb-a8a2-19ed5c03f8d3` is associated with gap `10449531`. Qualification `1996940` is associated with gap `ChIJ20iLSYBt5kcRqH2vq_dd6GU`.

**View `v_qualification_skill_gap`**

```sql
CREATE VIEW v_qualification_skill_gap AS
SELECT a.qualification_id, a.title, a.level, a.issuing_body, b.gap_id AS gap_gap_id, b.sector AS gap_sector, b.occupation AS gap_occupation
FROM qualifications a JOIN skill_gaps b ON a.gap_id = b.gap_id;
```

| qualification_id | title | level | issuing_body | gap_gap_id | gap_sector | gap_occupation |
|---|---|---|---|---|---|---|
| 005588c4-9bac-11eb-a8a2-19ed5c03f8d3 | Compact Initiative | GCSE | baseline-issuing-13 | 10449531 | adaptive-sector-53 | legacy-occupati-37 |
| 1562831 | Legacy Model | A_Level | pilot-issuing-14 | 575212 | distributed-sector-54 | compact-occupati-38 |
| 9424925 | Regional Cluster A | Intermediate | extended-issuing-15 | 317 | baseline-sector-55 | composite-occupati-39 |
| 1996940 | Seasonal Review | Advanced | integrated-issuing-16 | ChIJ20iLSYBt5kcRqH2vq_dd6GU | pilot-sector-56 | primary-occupati-40 |

## Closing Synthesis

The apprenticeship domain is modelled as a set of eight normalized base tables whose foreign-key columns encode the relationships between schemes, frameworks, sectors, participants, employers, funding instruments, skill gaps, and qualifications. Each base table stores a single entity type with its intrinsic attributes, while the foreign keys point to related entities without duplicating their data. The twenty-one views materialize the most common join patterns, each answering a specific analytical question by reconstructing a domain fact from the normalized tables. Together, the base tables and views form a complete relational representation of the apprenticeship ontology: the tables capture the entities and their attributes, the foreign keys capture the relationships, and the views capture the composite facts that analysts need to understand the domain.