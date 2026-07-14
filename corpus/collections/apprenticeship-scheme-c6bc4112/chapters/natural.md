## Apprenticeship Ecosystems: Schemes, Funding, and Workforce Development

Apprenticeship systems sit at the intersection of education, labor markets, and industrial policy. They connect individual learners to structured training programs, employers to funding mechanisms, and entire economic sectors to targeted skill development. The data model underlying this domain captures every layer of that ecosystem: the schemes themselves, the training frameworks that define curricula, the economic sectors where demand concentrates, the participants who enroll, the employers who host them, the funding instruments that finance them, the skill gaps that motivate them, and the qualifications that certify outcomes. Understanding how these pieces interlock is essential for policymakers, program administrators, and workforce analysts who need to trace a single apprentice from enrollment through completion, or to evaluate how a funding instrument flows through an employer into a specific scheme.

The foundation of the system is the apprenticeship scheme, a structured program that defines the scope, duration, and governance of a training pathway. Each scheme carries a level—Intermediate, Advanced, or Higher—along with a sector designation, a duration measured in months, and a status indicating whether it is active, inactive, or pending. Scheme identifiers range from simple numeric codes like `4716393` to UUIDs such as `4bbb5d4c-9bad-11eb-a8a2-19ed5c03f8d3`, reflecting the heterogeneous origins of programs across jurisdictions. A scheme with ID `4716393` operates at the Intermediate level within `adaptive-sector-53`, runs for 44 months, and holds active status. By contrast, scheme `338514` is an Advanced program in `distributed-sector-54` spanning 54 months but currently inactive. The `template_ivacode_pagata_20ind` scheme represents a Higher-level program in `baseline-sector-55` with a 64-month duration and pending status, while `4bbb5d4c-9bad-11eb-a8a2-19ed5c03f8d3` is an Intermediate scheme in `pilot-sector-56` lasting 74 months and marked active.

**Table `apprenticeship_schemes`**

| scheme_id | level | sector | duration_months | status | framework_id | training_framework_id | economic_sector_id | funding_instrument_id |
|---|---|---|---|---|---|---|---|---|
| 4716393 | Intermediate | adaptive-sector-53 | 44 | active | lu_tax_code_template_m11 | 100 | 1 | 1000 |
| 338514 | Advanced | distributed-sector-54 | 54 | inactive | 228bd7e4-9bad-11eb-a8a2-19ed5c03f8d3 | 101 | 2 | 1001 |
| template_ivacode_pagata_20ind | Higher | baseline-sector-55 | 64 | pending | 8843756 | 102 | 3 | 1002 |
| 4bbb5d4c-9bad-11eb-a8a2-19ed5c03f8d3 | Intermediate | pilot-sector-56 | 74 | active | ChIJm7V_gxFu5kcRAbqaOJHQUy0 | 103 | 4 | 1003 |

Every scheme is anchored to a training framework, which specifies the curriculum, competency requirements, and versioning of the educational content. The `training_frameworks` table stores each framework's unique identifier, a human-readable title, a version string, a last-updated timestamp, and a competency count that quantifies the breadth of skills covered. Framework `100`, titled "Compact Initiative" and versioned as `seasonal-version-71`, was last updated on 2023-06-17 and encompasses 18 competencies. Framework `101`, "Legacy Model" at `regional-version-72`, carries 39 competencies and was updated more recently on 2024-11-01. Framework `102`, "Regional Cluster A" with `legacy-version-73`, is the most competency-rich at 66 items, while framework `103`, "Seasonal Review" at `compact-version-74`, is the leanest with only 16 competencies. Each framework links back to its parent scheme and forward to a qualification that certifies completion.

**Table `training_frameworks`**

| id | framework_id | title | version | last_updated | competency_count | scheme_id | qualification_id |
|---|---|---|---|---|---|---|---|
| 100 | lu_tax_code_template_m11 | Compact Initiative | seasonal-version-71 | 2023-06-17T17:27:00 | 18 | 4716393 | 005588c4-9bac-11eb-a8a2-19ed5c03f8d3 |
| 101 | 228bd7e4-9bad-11eb-a8a2-19ed5c03f8d3 | Legacy Model | regional-version-72 | 2024-11-01T00:44:00 | 39 | 338514 | 1562831 |
| 102 | 8843756 | Regional Cluster A | legacy-version-73 | 2025-04-12T07:01:00 | 66 | template_ivacode_pagata_20ind | 9424925 |
| 103 | ChIJm7V_gxFu5kcRAbqaOJHQUy0 | Seasonal Review | compact-version-74 | 2022-09-23T14:18:00 | 16 | 4bbb5d4c-9bad-11eb-a8a2-19ed5c03f8d3 | 1996940 |

The economic context in which schemes operate is captured through the `economic_sectors` table. Each sector record carries a numeric code, a descriptive name, a skill shortage level ranging from low to critical, an apprenticeship capacity figure, and timestamps for when the record was created and last updated. Sector `1`, coded `89434` and named "Distributed Survey," reports a low skill shortage level with a capacity of 22 apprentices. Sector `2`, `8843752` ("Adaptive Corridor D"), shows a moderate shortage and capacity of 29. Sector `3`, identified by the longer code `3001009030220` and named "Primary Series," registers a high shortage level with capacity 36. Sector `4`, `937714` ("Composite Assessment"), faces a critical shortage and the highest capacity at 43. These shortage levels directly inform where training investment is most urgently needed.

**Table `economic_sectors`**

| economic_sector_id | sector_code | sector_name | skill_shortage_level | apprenticeship_capacity | scheme_id | gap_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|
| 1 | 89434 | Distributed Survey | low | 22 | 4716393 | 10449531 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | 8843752 | Adaptive Corridor D | moderate | 29 | 338514 | 575212 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | 3001009030220 | Primary Series | high | 36 | template_ivacode_pagata_20ind | 317 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | 937714 | Composite Assessment | critical | 43 | 4bbb5d4c-9bad-11eb-a8a2-19ed5c03f8d3 | ChIJ20iLSYBt5kcRqH2vq_dd6GU | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

At the individual level, the `apprenticeship_participants` table records every enrolled learner. Each participant has a unique identifier, an age, an employment status (new_hire, existing_employee, or unemployed), a gender category, a start date, and a completion status (in_progress, completed, or dropped_out). Participant `100`, aged 35 and classified as a new_hire, is male, began on 2022-09-05, and remains in_progress. Participant `101`, aged 40 and an existing_employee, is female, started on 2023-02-16, and has completed the program. Participant `102`, aged 45 and previously unemployed, identifies as other, began on 2024-07-27, and dropped out. Participant `103`, aged 50 and a new_hire, is male, started on 2025-12-11, and is in_progress. Each participant is tied to a specific scheme, an employer, and a qualification.

**Table `apprenticeship_participants`**

| apprenticeship_participant_id | participant_id | age | employment_status | gender | start_date | completion_status | scheme_id | employer_id | qualification_id |
|---|---|---|---|---|---|---|---|---|---|
| 100 | 3990185 | 35 | new_hire | male | 2022-09-05 | in_progress | 4716393 | 1 | 005588c4-9bac-11eb-a8a2-19ed5c03f8d3 |
| 101 | 4716387 | 40 | existing_employee | female | 2023-02-16 | completed | 338514 | 2 | 1562831 |
| 102 | 69430 | 45 | unemployed | other | 2024-07-27 | dropped_out | template_ivacode_pagata_20ind | 3 | 9424925 |
| 103 | c7460a44-8fcc-11eb-924d-9cd76263cbd0 | 50 | new_hire | male | 2025-12-11 | in_progress | 4bbb5d4c-9bad-11eb-a8a2-19ed5c03f8d3 | 4 | 1996940 |

Employers are the organizations that host apprentices and bear operational responsibility for their training. The `employers` table stores each employer's identifier, name, sector affiliation, total workforce size, the number of apprentices currently enrolled, and a reclassification rate that reflects workforce mobility. Employer `1`, "The Hongkong and Shanghai Banking Corporation Limited," operates in `adaptive-sector-53` with a workforce of 3,565 and 44 apprentices, yielding a reclassification rate of 3.70. Employer `2`, "ChargePoint Holdings.," in `distributed-sector-54`, has a much smaller workforce of 55 but still hosts 11 apprentices with a higher reclassification rate of 6.40. Employer `3`, "Intl. Business Machines," in `baseline-sector-55`, employs 19 people with just 1 apprentice and a reclassification rate of 9.10. Employer `4`, "Feedback Ratings," in `pilot-sector-56`, has 3,093 employees, 16 apprentices, and the highest reclassification rate at 11.80.

**Table `employers`**

| id | employer_id | name | sector | total_workforce | apprentice_count | reclassification_rate | scheme_id | apprenticeship_participant_id | funding_instrument_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | The Hongkong and Shanghai Banking Corporation Limited | Extended Review | adaptive-sector-53 | 3565 | 44 | 3.70 | 4716393 | 100 | 1000 |
| 2 | ChargePoint Holdings. | Pilot Initiative A | distributed-sector-54 | 55 | 11 | 6.40 | 338514 | 101 | 1001 |
| 3 | Intl. Business Machines | Baseline Model | baseline-sector-55 | 19 | 1 | 9.10 | template_ivacode_pagata_20ind | 102 | 1002 |
| 4 | Feedback Ratings | Distributed Cluster | pilot-sector-56 | 3093 | 16 | 11.80 | 4bbb5d4c-9bad-11eb-a8a2-19ed5c03f8d3 | 103 | 1003 |

Funding flows through the system via the `funding_instruments` table, which catalogs the financial mechanisms supporting apprenticeships. Each instrument has a type—employer_levy, grant, tax_relief, or reimbursement—along with an amount, a currency designation, eligibility criteria, and an effective date. Instrument `1000` is an employer_levy of 13.49 in `seasonal-currency-71`, effective 2023-02-14, with `composite-eligibil-57` criteria. Instrument `1001` is a grant of 25.47 in `regional-currency-72`, effective 2024-07-25, governed by `primary-eligibil-58`. Instrument `1002` provides tax_relief of 19.72 in `legacy-currency-73`, effective 2025-12-09, under `adaptive-eligibil-59`. Instrument `1003` offers reimbursement of 12.74 in `compact-currency-74`, effective 2022-05-20, with `distributed-eligibil-60` criteria. These instruments link schemes, employers, and participants into a coherent financial chain.

**Table `funding_instruments`**

| id | instrument_id | type | amount | currency | eligibility_criteria | effective_date | scheme_id | employer_id | apprenticeship_participant_id |
|---|---|---|---|---|---|---|---|---|---|
| 1000 | 6926365 | employer_levy | 13.49 | seasonal-currency-71 | composite-eligibil-57 | 2023-02-14 | 4716393 | 1 | 100 |
| 1001 | account_pymes_691 | grant | 25.47 | regional-currency-72 | primary-eligibil-58 | 2024-07-25 | 338514 | 2 | 101 |
| 1002 | 726063 | tax_relief | 19.72 | legacy-currency-73 | adaptive-eligibil-59 | 2025-12-09 | template_ivacode_pagata_20ind | 3 | 102 |
| 1003 | 23256422 | reimbursement | 12.74 | compact-currency-74 | distributed-eligibil-60 | 2022-05-20 | 4bbb5d4c-9bad-11eb-a8a2-19ed5c03f8d3 | 4 | 103 |

Skill gaps represent the mismatch between available workforce capabilities and the needs of specific economic sectors. The `skill_gaps` table records each gap's identifier, its associated economic sector, and the qualifications that would address it. While the skill_gaps table itself stores gap identifiers and sector references, its relationships are most visible through the joined views that connect gaps to sectors, schemes, and qualifications. The economic_sectors table already embeds a gap_id for each sector, establishing the primary linkage: sector `1` connects to gap `10449531`, sector `2` to gap `575212`, sector `3` to gap `317`, and sector `4` to gap `ChIJ20iLSYBt5kcRqH2vq_dd6GU`.

**Table `skill_gaps`**

| gap_id | sector | occupation | severity | estimated_shortage | reported_date | economic_sector_id | scheme_id | qualification_id |
|---|---|---|---|---|---|---|---|---|
| 10449531 | adaptive-sector-53 | legacy-occupati-37 | low | 32 | 2025-04-27 | 1 | 4716393 | 005588c4-9bac-11eb-a8a2-19ed5c03f8d3 |
| 575212 | distributed-sector-54 | compact-occupati-38 | moderate | 40 | 2022-09-11 | 2 | 338514 | 1562831 |
| 317 | baseline-sector-55 | composite-occupati-39 | high | 48 | 2023-02-22 | 3 | template_ivacode_pagata_20ind | 9424925 |
| ChIJ20iLSYBt5kcRqH2vq_dd6GU | pilot-sector-56 | primary-occupati-40 | critical | 56 | 2024-07-06 | 4 | 4bbb5d4c-9bad-11eb-a8a2-19ed5c03f8d3 | 1996940 |

Qualifications represent the certifications or credentials awarded upon completion of training. The `qualifications` table stores qualification identifiers that link back to training frameworks and forward to individual participants. Qualification `005588c4-9bac-11eb-a8a2-19ed5c03f8d3` is associated with framework `100` and participant `100`. Qualification `1562831` ties framework `101` to participant `101`. Qualification `9424925` connects framework `102` to participant `102`. Qualification `1996940` links framework `103` to participant `103`. The qualification serves as the terminal node in the training pathway, certifying that a participant has met the competency requirements defined by the framework.

**Table `qualifications`**

| qualification_id | title | level | issuing_body | credits | awarded_date | apprenticeship_participant_id | training_framework_id | gap_id |
|---|---|---|---|---|---|---|---|---|
| 005588c4-9bac-11eb-a8a2-19ed5c03f8d3 | Compact Initiative | GCSE | baseline-issuing-13 | 28 | 2022-09-27 | 100 | 100 | 10449531 |
| 1562831 | Legacy Model | A_Level | pilot-issuing-14 | 33 | 2023-02-11 | 101 | 101 | 575212 |
| 9424925 | Regional Cluster A | Intermediate | extended-issuing-15 | 38 | 2024-07-22 | 102 | 102 | 317 |
| 1996940 | Seasonal Review | Advanced | integrated-issuing-16 | 43 | 2025-12-06 | 103 | 103 | ChIJ20iLSYBt5kcRqH2vq_dd6GU |

The view `v_apprenticeship_scheme_training_framework` answers the question of which training framework governs each apprenticeship scheme. It joins `apprenticeship_schemes` to `training_frameworks` on the scheme-to-framework relationship. In this view, scheme `4716393` (Intermediate, active, 44 months) is paired with framework `100` ("Compact Initiative," 18 competencies, last updated 2023-06-17). Scheme `338514` (Advanced, inactive, 54 months) maps to framework `101` ("Legacy Model," 39 competencies, updated 2024-11-01). The view reveals that the inactive Advanced scheme is governed by the more competency-rich framework, while the active Intermediate scheme uses the leaner curriculum.

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

The view `v_apprenticeship_scheme_economic_sector` links each scheme to its operating economic sector, answering which sector each program serves. Scheme `4716393` operates in sector `1` ("Distributed Survey," code `89434`, low shortage, capacity 22). Scheme `338514` serves sector `2` ("Adaptive Corridor D," code `8843752`, moderate shortage, capacity 29). Scheme `template_ivacode_pagata_20ind` targets sector `3` ("Primary Series," code `3001009030220`, high shortage, capacity 36). Scheme `4bbb5d4c-9bad-11eb-a8a2-19ed5c03f8d3` addresses sector `4` ("Composite Assessment," code `937714`, critical shortage, capacity 43). The view makes clear that the longest-running scheme (74 months) targets the sector with the most critical shortage, suggesting a policy alignment between program duration and labor market urgency.

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

The view `v_apprenticeship_scheme_funding_instrument` reveals the financial backing for each scheme. Scheme `4716393` is funded by instrument `1000` (employer_levy, 13.49, effective 2023-02-14). Scheme `338514` receives instrument `1001` (grant, 25.47, effective 2024-07-25). Scheme `template_ivacode_pagata_20ind` is supported by instrument `1002` (tax_relief, 19.72, effective 2025-12-09). Scheme `4bbb5d4c-9bad-11eb-a8a2-19ed5c03f8d3` uses instrument `1003` (reimbursement, 12.74, effective 2022-05-20). The view shows a diversity of funding mechanisms: the active Intermediate scheme relies on an employer levy, the inactive Advanced scheme on a grant, the pending Higher scheme on tax relief, and the active pilot scheme on reimbursement.

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

The view `v_training_framework_apprenticeship_scheme` inverts the scheme-to-framework relationship, presenting each framework alongside its parent scheme. Framework `100` ("Compact Initiative") is associated with scheme `4716393` (Intermediate, 44 months, active). Framework `101` ("Legacy Model") links to scheme `338514` (Advanced, 54 months, inactive). Framework `102` ("Regional Cluster A") connects to scheme `template_ivacode_pagata_20ind` (Higher, 64 months, pending). Framework `103` ("Seasonal Review") maps to scheme `4bbb5d4c-9bad-11eb-a8a2-19ed5c03f8d3` (Intermediate, 74 months, active). This perspective is useful for framework administrators who need to see which schemes are consuming their curriculum.

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

The view `v_training_framework_qualification` connects each training framework to the qualification that certifies its completion. Framework `100` ("Compact Initiative") leads to qualification `005588c4-9bac-11eb-a8a2-19ed5c03f8d3`. Framework `101` ("Legacy Model") leads to qualification `1562831`. Framework `102` ("Regional Cluster A") leads to qualification `9424925`. Framework `103` ("Seasonal Review") leads to qualification `1996940`. This view is essential for quality assurance, ensuring that every framework has a defined credential pathway.

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

The view `v_economic_sector_apprenticeship_scheme` presents each economic sector alongside the schemes operating within it. Sector `1` ("Distributed Survey," low shortage, capacity 22) hosts scheme `4716393`. Sector `2` ("Adaptive Corridor D," moderate shortage, capacity 29) hosts scheme `338514`. Sector `3` ("Primary Series," high shortage, capacity 36) hosts scheme `template_ivacode_pagata_20ind`. Sector `4` ("Composite Assessment," critical shortage, capacity 43) hosts scheme `4bbb5d4c-9bad-11eb-a8a2-19ed5c03f8d3`. Each sector hosts exactly one scheme in this dataset, but the view structure supports many-to-many relationships in expanded deployments.

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

The view `v_economic_sector_skill_gap` pairs each economic sector with its associated skill gap. Sector `1` ("Distributed Survey") is linked to gap `10449531`. Sector `2` ("Adaptive Corridor D") connects to gap `575212`. Sector `3` ("Primary Series") connects to gap `317`. Sector `4` ("Composite Assessment") connects to gap `ChIJ20iLSYBt5kcRqH2vq_dd6GU`. This view enables labor market analysts to trace from a sector's shortage level directly to the specific gap that training programs are designed to address.

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

The view `v_apprenticeship_participant_apprenticeship_scheme` links each participant to the scheme they are enrolled in. Participant `100` (age 35, new_hire, in_progress) is enrolled in scheme `4716393` (Intermediate, 44 months, active). Participant `101` (age 40, existing_employee, completed) is enrolled in scheme `338514` (Advanced, 54 months, inactive). Participant `102` (age 45, unemployed, dropped_out) is enrolled in scheme `template_ivacode_pagata_20ind` (Higher, 64 months, pending). Participant `103` (age 50, new_hire, in_progress) is enrolled in scheme `4bbb5d4c-9bad-11eb-a8a2-19ed5c03f8d3` (Intermediate, 74 months, active). This view is the primary lens for tracking individual progress through the program lifecycle.

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

The view `v_apprenticeship_participant_employer` connects each participant to their hosting employer. Participant `100` is hosted by employer `1` ("The Hongkong and Shanghai Banking Corporation Limited," workforce 3,565, 44 apprentices). Participant `101` is hosted by employer `2` ("ChargePoint Holdings.," workforce 55, 11 apprentices). Participant `102` is hosted by employer `3` ("Intl. Business Machines," workforce 19, 1 apprentice). Participant `103` is hosted by employer `4` ("Feedback Ratings," workforce 3,093, 16 apprentices). The view reveals that the largest employers by workforce size (employers 1 and 4) also host the most apprentices, while the smallest employer (employer 3) has only one apprentice despite having a high reclassification rate.

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

The view `v_apprenticeship_participant_qualification` links each participant to the qualification they are pursuing. Participant `100` is pursuing qualification `005588c4-9bac-11eb-a8a2-19ed5c03f8d3`. Participant `101` is pursuing qualification `1562831`. Participant `102` is pursuing qualification `9424925`. Participant `103` is pursuing qualification `1996940`. This view is critical for tracking credential attainment and for reporting completion rates by qualification type.

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

The view `v_employer_apprenticeship_scheme` shows which schemes each employer participates in. Employer `1` participates in scheme `4716393`. Employer `2` participates in scheme `338514`. Employer `3` participates in scheme `template_ivacode_pagata_20ind`. Employer `4` participates in scheme `4bbb5d4c-9bad-11eb-a8a2-19ed5c03f8d3`. Each employer is linked to exactly one scheme in this dataset, but the view structure supports multi-scheme participation in broader deployments.

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

The view `v_employer_apprenticeship_participant` connects each employer to the participants they host. Employer `1` hosts participant `100`. Employer `2` hosts participant `101`. Employer `3` hosts participant `102`. Employer `4` hosts participant `103`. This view is the operational backbone for employer-level reporting, enabling administrators to see which apprentices are assigned to which organizations.

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

The view `v_employer_funding_instrument` reveals the funding mechanism each employer accesses. Employer `1` accesses instrument `1000` (employer_levy, 13.49). Employer `2` accesses instrument `1001` (grant, 25.47). Employer `3` accesses instrument `1002` (tax_relief, 19.72). Employer `4` accesses instrument `1003` (reimbursement, 12.74). The view shows that the largest employer (employer 1) uses an employer levy, while the smallest (employer 3) uses tax relief, suggesting that funding instrument choice may correlate with employer size.

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

The view `v_funding_instrument_apprenticeship_scheme` presents each funding instrument alongside the scheme it supports. Instrument `1000` supports scheme `4716393`. Instrument `1001` supports scheme `338514`. Instrument `1002` supports scheme `template_ivacode_pagata_20ind`. Instrument `1003` supports scheme `4bbb5d4c-9bad-11eb-a8a2-19ed5c03f8d3`. This view is essential for financial auditors who need to trace funding from instrument to scheme to ensure compliance with eligibility criteria.

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

The view `v_funding_instrument_employer` links each funding instrument to the employer that accesses it. Instrument `1000` is accessed by employer `1`. Instrument `1001` is accessed by employer `2`. Instrument `1002` is accessed by employer `3`. Instrument `1003` is accessed by employer `4`. This view enables employers to understand their funding entitlements and allows policymakers to evaluate the distribution of funding across organizations.

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

The view `v_funding_instrument_apprenticeship_participant` connects each funding instrument to the participant it ultimately supports. Instrument `1000` supports participant `100`. Instrument `1001` supports participant `101`. Instrument `1002` supports participant `102`. Instrument `1003` supports participant `103`. This view completes the financial chain from instrument through employer and scheme to the individual learner, providing a full audit trail for public expenditure reporting.

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

The view `v_skill_gap_economic_sector` pairs each skill gap with its parent economic sector. Gap `10449531` belongs to sector `1` ("Distributed Survey"). Gap `575212` belongs to sector `2` ("Adaptive Corridor D"). Gap `317` belongs to sector `3` ("Primary Series"). Gap `ChIJ20iLSYBt5kcRqH2vq_dd6GU` belongs to sector `4` ("Composite Assessment"). This view is the entry point for labor market analysis, allowing analysts to start from a specific gap and understand the sectoral context in which it exists.

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

The view `v_skill_gap_apprenticeship_scheme` connects each skill gap to the scheme designed to address it. Gap `10449531` is addressed by scheme `4716393`. Gap `575212` is addressed by scheme `338514`. Gap `317` is addressed by scheme `template_ivacode_pagata_20ind`. Gap `ChIJ20iLSYBt5kcRqH2vq_dd6GU` is addressed by scheme `4bbb5d4c-9bad-11eb-a8a2-19ed5c03f8d3`. This view enables policymakers to evaluate whether the right schemes are being deployed to address the most critical gaps.

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

The view `v_skill_gap_qualification` links each skill gap to the qualification that would mitigate it. Gap `10449531` is mitigated by qualification `005588c4-9bac-11eb-a8a2-19ed5c03f8d3`. Gap `575212` is mitigated by qualification `1562831`. Gap `317` is mitigated by qualification `9424925`. Gap `ChIJ20iLSYBt5kcRqH2vq_dd6GU` is mitigated by qualification `1996940`. This view is crucial for curriculum designers who need to ensure that qualifications are aligned with the skill gaps they are intended to fill.

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

The view `v_qualification_apprenticeship_participant` connects each qualification to the participant pursuing it. Qualification `005588c4-9bac-11eb-a8a2-19ed5c03f8d3` is pursued by participant `100`. Qualification `1562831` is pursued by participant `101`. Qualification `9424925` is pursued by participant `102`. Qualification `1996940` is pursued by participant `103`. This view is the primary mechanism for tracking credential attainment rates and for identifying participants who may need additional support to complete their qualifications.

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

The view `v_qualification_training_framework` links each qualification to the training framework that defines it. Qualification `005588c4-9bac-11eb-a8a2-19ed5c03f8d3` is defined by framework `100` ("Compact Initiative"). Qualification `1562831` is defined by framework `101` ("Legacy Model"). Qualification `9424925` is defined by framework `102` ("Regional Cluster A"). Qualification `1996940` is defined by framework `103` ("Seasonal Review"). This view ensures that every credential can be traced back to its curricular source, supporting quality assurance and framework versioning.

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

The view `v_qualification_skill_gap` connects each qualification to the skill gap it addresses. Qualification `005588c4-9bac-11eb-a8a2-19ed5c03f8d3` addresses gap `10449531`. Qualification `1562831` addresses gap `575212`. Qualification `9424925` addresses gap `317`. Qualification `1996940` addresses gap `ChIJ20iLSYBt5kcRqH2vq_dd6GU`. This view closes the analytical loop, allowing stakeholders to verify that every qualification in the system serves a documented labor market need.

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

The apprenticeship ecosystem is a tightly coupled system where every participant, employer, scheme, and funding instrument exists within a web of interdependent relationships. A single apprentice's journey—from enrollment through training to qualification—traverses multiple tables and views, each providing a distinct lens on the same underlying reality. The scheme defines the program structure, the framework defines the curriculum, the sector defines the labor market context, the employer defines the host environment, the funding instrument defines the financial mechanism, the skill gap defines the need, and the qualification defines the outcome. Together, these records form a complete picture of workforce development that can be queried from any angle: by individual, by organization, by program, by sector, or by funding stream. The views described above are not merely technical artifacts; they are the analytical instruments through which policymakers evaluate effectiveness, employers plan capacity, and administrators ensure compliance.