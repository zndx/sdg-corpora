The domain under examination is a theological-interpretive knowledge base that captures how scriptural passages are read, how doctrinal claims are articulated, and how those claims interlock with covenantal structures and human lineages. Five base tables—`interpretations`, `biblical_texts`, `theological_claims`, `covenants`, and `humanities`—store the canonical entities, while eight materialized views materialize the most useful join paths so that analysts can query domain facts without writing joins by hand. The schema is deliberately normalized: each entity type lives in its own table, foreign keys encode the cardinality-bounded relationships, and the views reassemble the pieces into readable rows.

## Base Tables and Their Attributes

The `interpretations` table is the central interpretive node. Each row represents a distinct reading of scripture, identified by `interpretation_id` and named in `interpretation_name`. The column `primary_subject` carries a composite key concept (e.g., `composite-primary-93`), while `is_mainstream` is a boolean flag distinguishing mainstream from non-mainstream readings. The column `is_author_preferred` stores the name of the author who prefers the interpretation—`Sarah Villanueva` for the first row, `Chloe Foley` for the second, `Steve Harvey` for the third, and `Laurie Wallace` for the fourth. Two foreign keys anchor the interpretation to its scriptural and doctrinal context: `biblical_text_id` references `biblical_texts.id`, and `theological_claim_id` references `theological_claims.id`. A self-referencing column `contradicts_interpretation_id` allows one interpretation to contradict another within the same table.

**Table `interpretations`**

| interpretation_id | interpretation_name | primary_subject | is_mainstream | is_author_preferred | biblical_text_id | theological_claim_id | contradicts_interpretation_id |
|---|---|---|---|---|---|---|---|
| 1 | Adaptive Assessment | composite-primary-93 | false | Sarah Villanueva | 1 | 100 | 1 |
| 2 | Primary Survey | primary-primary-94 | true | Chloe Foley | 2 | 101 | 2 |
| 3 | Composite Corridor D | adaptive-primary-95 | false | Steve Harvey | 3 | 102 | 3 |
| 4 | Compact Series | distributed-primary-96 | true | Laurie Wallace | 4 | 103 | 4 |

The `biblical_texts` table stores individual scriptural references. Each row carries a UUID-style `text_id` (such as `6a4248dc-8fc0-11eb-924d-9cd76263cbd0`), a `book_name` (e.g., `Compact Corridor`, `Legacy Series`, `Regional Assessment A`, `Seasonal Survey`), a `chapter_number`, and a `verse_range` (e.g., `primary-verse-70`). The `language` column holds values like `composite-language-45` and `primary-language-46`. A boolean `is_historic_narrative` flags whether the passage is a historical account. The table also contains `interpretation_id` and `theological_claim_id` columns, each pointing back to their respective tables, creating bidirectional links from text to interpretation and from text to claim.

**Table `biblical_texts`**

| id | text_id | book_name | chapter_number | verse_range | language | is_historic_narrative | interpretation_id | theological_claim_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 6a4248dc-8fc0-11eb-924d-9cd76263cbd0 | Compact Corridor | 49 | primary-verse-70 | composite-language-45 | false | 1 | 100 |
| 2 | 7731874 | Legacy Series | 60 | adaptive-verse-71 | primary-language-46 | true | 2 | 101 |
| 3 | 5917299 | Regional Assessment A | 71 | distributed-verse-72 | adaptive-language-47 | false | 3 | 102 |
| 4 | 611500 | Seasonal Survey | 82 | baseline-verse-73 | distributed-language-48 | true | 4 | 103 |

The `theological_claims` table holds doctrinal assertions. Each row has a surrogate `id` (100 through 103), a `claim_id` (a UUID such as `6969435`), and the actual `claim_text` (e.g., `pilot-claim-56`, `extended-claim-57`). The `claim_type` column categorizes the claim (`baseline-claim-31`, `pilot-claim-32`, `extended-claim-33`, `integrated-claim-34`). Boolean flags `is_covenantal` and `is_eschatological` indicate whether the claim pertains to covenant theology or eschatology. The table references `biblical_texts.id` via `biblical_text_id`, and it also has `interpretation_id` to point to the interpretation that articulates the claim. A column `is_contradicted_by_biblical_text_id` creates a self-referencing link within `biblical_texts`, and `created_at` / `updated_at` timestamps record the lifecycle of each claim.

**Table `theological_claims`**

| id | claim_id | claim_text | claim_type | is_covenantal | is_eschatological | biblical_text_id | is_contradicted_by_biblical_text_id | interpretation_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|
| 100 | 6969435 | pilot-claim-56 | baseline-claim-31 | false | true | 1 | 1 | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 101 | 4463668 | extended-claim-57 | pilot-claim-32 | true | false | 2 | 2 | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 102 | lu_tax_code_template_b_VB-EC-Tab | integrated-claim-58 | extended-claim-33 | false | true | 3 | 3 | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 103 | 727058 | seasonal-claim-59 | integrated-claim-34 | true | false | 4 | 4 | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The `covenants` table models covenantal agreements. Each row has a surrogate `id`, a `covenant_id` (UUIDs like `4e386610-8fcc-11eb-924d-9cd76263cbd0`), and a `covenant_name` (e.g., `Extended Model`, `Pilot Cluster A`, `Baseline Review`, `Distributed Initiative`). Boolean columns `is_unilateral` and `is_bilateral` describe the nature of the covenant. The columns `promises` and `requirements` store descriptive strings such as `pilot-promises-38` and `composite-requirem-15`. Three foreign keys anchor the covenant: `humanity_id` points to `humanities.id`, `theological_claim_id` points to `theological_claims.id`, and `biblical_text_id` points to `biblical_texts.id`.

**Table `covenants`**

| id | covenant_id | covenant_name | is_unilateral | is_bilateral | promises | requirements | humanity_id | theological_claim_id | biblical_text_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 4e386610-8fcc-11eb-924d-9cd76263cbd0 | Extended Model | false | false | pilot-promises-38 | composite-requirem-15 | 1 | 100 | 1 |
| 2 | 195361 | Pilot Cluster A | true | true | extended-promises-39 | primary-requirem-16 | 2 | 101 | 2 |
| 3 | 10207171 | Baseline Review | false | false | integrated-promises-40 | adaptive-requirem-17 | 3 | 102 | 3 |
| 4 | 168555 | Distributed Initiative | true | true | seasonal-promises-41 | distributed-requirem-18 | 4 | 103 | 4 |

The `humanities` table captures human or people-group entities. Each row has a surrogate `id`, a `humanity_id` (UUIDs like `9424907`), and a `lineage` string (e.g., `compact-lineage-44`, `composite-lineage-45`). Boolean columns `is_godly`, `is_ungodly`, and `is_covenant_people` describe the moral and covenantal status of the group. The table references `covenants.id` via `covenant_id`, `theological_claims.id` via `theological_claim_id`, and includes a self-referencing `intermarries_with_humanity_id` column that links one humanity to another, modeling intermarriage or alliance relationships.

**Table `humanities`**

| id | humanity_id | lineage | is_godly | is_ungodly | is_covenant_people | covenant_id | theological_claim_id | intermarries_with_humanity_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 9424907 | compact-lineage-44 | true | true | true | 1 | 100 | 1 |
| 2 | 2986230 | composite-lineage-45 | false | false | false | 2 | 101 | 2 |
| 3 | 4e386610-8fcc-11eb-924d-9cd76263cbd0 | primary-lineage-46 | true | true | true | 3 | 102 | 3 |
| 4 | ce090318-ea6a-431b-949e-c1573da75d62 | adaptive-lineage-47 | false | false | false | 4 | 103 | 4 |

## Materialized Views

The views reassemble the normalized tables into readable domain facts. Each view is a `SELECT` with explicit `JOIN` clauses that reconstruct a specific relationship path.

### `vw_interpretation_biblical_text`

This view joins `interpretations` to `biblical_texts` on `interpretations.biblical_text_id = biblical_texts.id`, producing a row for every interpretation–text pairing. It selects `interpretation_id`, `interpretation_name`, `primary_subject`, `is_mainstream`, and aliases the text columns as `text_id`, `text_text_id`, and `text_book_name` to avoid naming collisions. The first row tells us that the interpretation named `Adaptive Assessment` (with `primary_subject = composite-primary-93` and `is_mainstream = false`) is linked to the biblical text `Compact Corridor` (UUID `6a4248dc-8fc0-11eb-924d-9cd76263cbd0`). The second row pairs `Primary Survey` with `Legacy Series`. This view answers the question: *Which biblical text does each interpretation draw upon?*

**View `vw_interpretation_biblical_text`**

```sql
CREATE VIEW vw_interpretation_biblical_text AS
SELECT a.interpretation_id, a.interpretation_name, a.primary_subject, a.is_mainstream, b.id AS text_id, b.text_id AS text_text_id, b.book_name AS text_book_name
FROM interpretations a JOIN biblical_texts b ON a.biblical_text_id = b.id;
```

| interpretation_id | interpretation_name | primary_subject | is_mainstream | text_id | text_text_id | text_book_name |
|---|---|---|---|---|---|---|
| 1 | Adaptive Assessment | composite-primary-93 | false | 1 | 6a4248dc-8fc0-11eb-924d-9cd76263cbd0 | Compact Corridor |
| 2 | Primary Survey | primary-primary-94 | true | 2 | 7731874 | Legacy Series |
| 3 | Composite Corridor D | adaptive-primary-95 | false | 3 | 5917299 | Regional Assessment A |
| 4 | Compact Series | distributed-primary-96 | true | 4 | 611500 | Seasonal Survey |

### `vw_interpretation_theological_claim`

This view joins `interpretations` to `theological_claims` on `interpretations.theological_claim_id = theological_claims.id`. It surfaces the interpretation alongside the claim it articulates, enabling analysts to see which doctrinal assertion each reading supports. The first row connects `Adaptive Assessment` to claim `pilot-claim-56` (type `baseline-claim-31`, eschatological but not covenantal). The second row links `Primary Survey` to `extended-claim-57` (type `pilot-claim-32`, covenantal but not eschatological). This view answers: *What theological claim does each interpretation advance?*

**View `vw_interpretation_theological_claim`**

```sql
CREATE VIEW vw_interpretation_theological_claim AS
SELECT a.interpretation_id, a.interpretation_name, a.primary_subject, a.is_mainstream, b.id AS claim_id, b.claim_id AS claim_claim_id, b.claim_text AS claim_claim_text
FROM interpretations a JOIN theological_claims b ON a.theological_claim_id = b.id;
```

| interpretation_id | interpretation_name | primary_subject | is_mainstream | claim_id | claim_claim_id | claim_claim_text |
|---|---|---|---|---|---|---|
| 1 | Adaptive Assessment | composite-primary-93 | false | 100 | 6969435 | pilot-claim-56 |
| 2 | Primary Survey | primary-primary-94 | true | 101 | 4463668 | extended-claim-57 |
| 3 | Composite Corridor D | adaptive-primary-95 | false | 102 | lu_tax_code_template_b_VB-EC-Tab | integrated-claim-58 |
| 4 | Compact Series | distributed-primary-96 | true | 103 | 727058 | seasonal-claim-59 |

### `vw_interpretation_interpretation`

This view performs a self-join on `interpretations`, typically on the `contradicts_interpretation_id` column, to surface pairs of interpretations where one contradicts another. The first row shows that interpretation `Adaptive Assessment` (id 1) contradicts interpretation id 1—a self-reference indicating the row itself is the contradicted target. The second row shows `Primary Survey` (id 2) contradicting id 2, and so on. This view answers: *Which interpretations stand in contradiction to which others?*

**View `vw_interpretation_interpretation`**

```sql
CREATE VIEW vw_interpretation_interpretation AS
SELECT a.interpretation_id, a.interpretation_name, a.primary_subject, a.is_mainstream, b.interpretation_id AS interpretation_interpretation_id, b.interpretation_name AS interpretation_interpretation_name, b.primary_subject AS interpretation_primary_subject
FROM interpretations a JOIN interpretations b ON a.contradicts_interpretation_id = b.interpretation_id;
```

| interpretation_id | interpretation_name | primary_subject | is_mainstream | interpretation_interpretation_id | interpretation_interpretation_name | interpretation_primary_subject |
|---|---|---|---|---|---|---|
| 1 | Adaptive Assessment | composite-primary-93 | false | 1 | Adaptive Assessment | composite-primary-93 |
| 2 | Primary Survey | primary-primary-94 | true | 2 | Primary Survey | primary-primary-94 |
| 3 | Composite Corridor D | adaptive-primary-95 | false | 3 | Composite Corridor D | adaptive-primary-95 |
| 4 | Compact Series | distributed-primary-96 | true | 4 | Compact Series | distributed-primary-96 |

### `vw_biblical_text_interpretation`

This view joins `biblical_texts` to `interpretations` on `biblical_texts.id = interpretations.biblical_text_id`, effectively the reverse of `vw_interpretation_biblical_text`. It answers the complementary question: *Which interpretation is associated with each biblical text?* The first row shows that the text `Compact Corridor` (id 1) is interpreted by `Adaptive Assessment`. The second row pairs `Legacy Series` with `Primary Survey`.

**View `vw_biblical_text_interpretation`**

```sql
CREATE VIEW vw_biblical_text_interpretation AS
SELECT a.id, a.text_id, a.book_name, a.chapter_number, b.interpretation_id AS interpretation_interpretation_id, b.interpretation_name AS interpretation_interpretation_name, b.primary_subject AS interpretation_primary_subject
FROM biblical_texts a JOIN interpretations b ON a.interpretation_id = b.interpretation_id;
```

| id | text_id | book_name | chapter_number | interpretation_interpretation_id | interpretation_interpretation_name | interpretation_primary_subject |
|---|---|---|---|---|---|---|
| 1 | 6a4248dc-8fc0-11eb-924d-9cd76263cbd0 | Compact Corridor | 49 | 1 | Adaptive Assessment | composite-primary-93 |
| 2 | 7731874 | Legacy Series | 60 | 2 | Primary Survey | primary-primary-94 |
| 3 | 5917299 | Regional Assessment A | 71 | 3 | Composite Corridor D | adaptive-primary-95 |
| 4 | 611500 | Seasonal Survey | 82 | 4 | Compact Series | distributed-primary-96 |

### `vw_biblical_text_theological_claim`

This view joins `biblical_texts` to `theological_claims` on `biblical_texts.id = theological_claims.biblical_text_id`. It surfaces the doctrinal claims that are grounded in each scriptural passage. The first row links the text `Compact Corridor` (id 1) to claim `pilot-claim-56`. The second row links `Legacy Series` (id 2) to `extended-claim-57`. This view answers: *Which theological claims are derived from each biblical text?*

**View `vw_biblical_text_theological_claim`**

```sql
CREATE VIEW vw_biblical_text_theological_claim AS
SELECT a.id, a.text_id, a.book_name, a.chapter_number, b.id AS claim_id, b.claim_id AS claim_claim_id, b.claim_text AS claim_claim_text
FROM biblical_texts a JOIN theological_claims b ON a.theological_claim_id = b.id;
```

| id | text_id | book_name | chapter_number | claim_id | claim_claim_id | claim_claim_text |
|---|---|---|---|---|---|---|
| 1 | 6a4248dc-8fc0-11eb-924d-9cd76263cbd0 | Compact Corridor | 49 | 100 | 6969435 | pilot-claim-56 |
| 2 | 7731874 | Legacy Series | 60 | 101 | 4463668 | extended-claim-57 |
| 3 | 5917299 | Regional Assessment A | 71 | 102 | lu_tax_code_template_b_VB-EC-Tab | integrated-claim-58 |
| 4 | 611500 | Seasonal Survey | 82 | 103 | 727058 | seasonal-claim-59 |

### `vw_theological_claim_biblical_text`

This view joins `theological_claims` to `biblical_texts` on `theological_claims.biblical_text_id = biblical_texts.id`, the reverse of the previous view. It answers: *From which biblical text does each theological claim originate?* The first row shows that claim `pilot-claim-56` originates from the text `Compact Corridor` (id 1). The second row shows `extended-claim-57` originating from `Legacy Series` (id 2).

**View `vw_theological_claim_biblical_text`**

```sql
CREATE VIEW vw_theological_claim_biblical_text AS
SELECT a.id, a.claim_id, a.claim_text, a.claim_type, b.id AS text_id, b.text_id AS text_text_id, b.book_name AS text_book_name
FROM theological_claims a JOIN biblical_texts b ON a.biblical_text_id = b.id;
```

| id | claim_id | claim_text | claim_type | text_id | text_text_id | text_book_name |
|---|---|---|---|---|---|---|
| 100 | 6969435 | pilot-claim-56 | baseline-claim-31 | 1 | 6a4248dc-8fc0-11eb-924d-9cd76263cbd0 | Compact Corridor |
| 101 | 4463668 | extended-claim-57 | pilot-claim-32 | 2 | 7731874 | Legacy Series |
| 102 | lu_tax_code_template_b_VB-EC-Tab | integrated-claim-58 | extended-claim-33 | 3 | 5917299 | Regional Assessment A |
| 103 | 727058 | seasonal-claim-59 | integrated-claim-34 | 4 | 611500 | Seasonal Survey |

### `vw_theological_claim_interpretation`

This view joins `theological_claims` to `interpretations` on `theological_claims.interpretation_id = interpretations.interpretation_id`. It surfaces the interpretation that articulates each claim. The first row connects claim `pilot-claim-56` to interpretation `Adaptive Assessment`. The second row connects `extended-claim-57` to `Primary Survey`. This view answers: *Which interpretation articulates each theological claim?*

**View `vw_theological_claim_interpretation`**

```sql
CREATE VIEW vw_theological_claim_interpretation AS
SELECT a.id, a.claim_id, a.claim_text, a.claim_type, b.interpretation_id AS interpretation_interpretation_id, b.interpretation_name AS interpretation_interpretation_name, b.primary_subject AS interpretation_primary_subject
FROM theological_claims a JOIN interpretations b ON a.interpretation_id = b.interpretation_id;
```

| id | claim_id | claim_text | claim_type | interpretation_interpretation_id | interpretation_interpretation_name | interpretation_primary_subject |
|---|---|---|---|---|---|---|
| 100 | 6969435 | pilot-claim-56 | baseline-claim-31 | 1 | Adaptive Assessment | composite-primary-93 |
| 101 | 4463668 | extended-claim-57 | pilot-claim-32 | 2 | Primary Survey | primary-primary-94 |
| 102 | lu_tax_code_template_b_VB-EC-Tab | integrated-claim-58 | extended-claim-33 | 3 | Composite Corridor D | adaptive-primary-95 |
| 103 | 727058 | seasonal-claim-59 | integrated-claim-34 | 4 | Compact Series | distributed-primary-96 |

### `vw_covenant_humanity`

This view joins `covenants` to `humanities` on `covenants.humanity_id = humanities.id`. It surfaces the people group associated with each covenant. The first row shows that the covenant `Extended Model` is linked to humanity with lineage `compact-lineage-44`. The second row links `Pilot Cluster A` to humanity with lineage `composite-lineage-45`. This view answers: *Which humanity is bound by each covenant?*

**View `vw_covenant_humanity`**

```sql
CREATE VIEW vw_covenant_humanity AS
SELECT a.id, a.covenant_id, a.covenant_name, a.is_unilateral, b.id AS humanity_id, b.humanity_id AS humanity_humanity_id, b.lineage AS humanity_lineage
FROM covenants a JOIN humanities b ON a.humanity_id = b.id;
```

| id | covenant_id | covenant_name | is_unilateral | humanity_id | humanity_humanity_id | humanity_lineage |
|---|---|---|---|---|---|---|
| 1 | 4e386610-8fcc-11eb-924d-9cd76263cbd0 | Extended Model | false | 1 | 9424907 | compact-lineage-44 |
| 2 | 195361 | Pilot Cluster A | true | 2 | 2986230 | composite-lineage-45 |
| 3 | 10207171 | Baseline Review | false | 3 | 4e386610-8fcc-11eb-924d-9cd76263cbd0 | primary-lineage-46 |
| 4 | 168555 | Distributed Initiative | true | 4 | ce090318-ea6a-431b-949e-c1573da75d62 | adaptive-lineage-47 |

### `vw_covenant_theological_claim`

This view joins `covenants` to `theological_claims` on `covenants.theological_claim_id = theological_claims.id`. It surfaces the doctrinal claim underpinning each covenant. The first row shows that covenant `Extended Model` is grounded in claim `pilot-claim-56`. The second row links `Pilot Cluster A` to `extended-claim-57`. This view answers: *What theological claim does each covenant embody?*

**View `vw_covenant_theological_claim`**

```sql
CREATE VIEW vw_covenant_theological_claim AS
SELECT a.id, a.covenant_id, a.covenant_name, a.is_unilateral, b.id AS claim_id, b.claim_id AS claim_claim_id, b.claim_text AS claim_claim_text
FROM covenants a JOIN theological_claims b ON a.theological_claim_id = b.id;
```

| id | covenant_id | covenant_name | is_unilateral | claim_id | claim_claim_id | claim_claim_text |
|---|---|---|---|---|---|---|
| 1 | 4e386610-8fcc-11eb-924d-9cd76263cbd0 | Extended Model | false | 100 | 6969435 | pilot-claim-56 |
| 2 | 195361 | Pilot Cluster A | true | 101 | 4463668 | extended-claim-57 |
| 3 | 10207171 | Baseline Review | false | 102 | lu_tax_code_template_b_VB-EC-Tab | integrated-claim-58 |
| 4 | 168555 | Distributed Initiative | true | 103 | 727058 | seasonal-claim-59 |

### `vw_covenant_biblical_text`

This view joins `covenants` to `biblical_texts` on `covenants.biblical_text_id = biblical_texts.id`. It surfaces the scriptural passage that grounds each covenant. The first row shows that covenant `Extended Model` is grounded in the text `Compact Corridor` (id 1). The second row links `Pilot Cluster A` to `Legacy Series` (id 2). This view answers: *Which biblical text grounds each covenant?*

**View `vw_covenant_biblical_text`**

```sql
CREATE VIEW vw_covenant_biblical_text AS
SELECT a.id, a.covenant_id, a.covenant_name, a.is_unilateral, b.id AS text_id, b.text_id AS text_text_id, b.book_name AS text_book_name
FROM covenants a JOIN biblical_texts b ON a.biblical_text_id = b.id;
```

| id | covenant_id | covenant_name | is_unilateral | text_id | text_text_id | text_book_name |
|---|---|---|---|---|---|---|
| 1 | 4e386610-8fcc-11eb-924d-9cd76263cbd0 | Extended Model | false | 1 | 6a4248dc-8fc0-11eb-924d-9cd76263cbd0 | Compact Corridor |
| 2 | 195361 | Pilot Cluster A | true | 2 | 7731874 | Legacy Series |
| 3 | 10207171 | Baseline Review | false | 3 | 5917299 | Regional Assessment A |
| 4 | 168555 | Distributed Initiative | true | 4 | 611500 | Seasonal Survey |

### `vw_humanity_covenant`

This view joins `humanities` to `covenants` on `humanities.covenant_id = covenants.id`, the reverse of `vw_covenant_humanity`. It answers: *Which covenant binds each humanity?* The first row shows that humanity with lineage `compact-lineage-44` is bound by the covenant `Extended Model`. The second row links humanity with lineage `composite-lineage-45` to `Pilot Cluster A`.

**View `vw_humanity_covenant`**

```sql
CREATE VIEW vw_humanity_covenant AS
SELECT a.id, a.humanity_id, a.lineage, a.is_godly, b.id AS covenant_id, b.covenant_id AS covenant_covenant_id, b.covenant_name AS covenant_covenant_name
FROM humanities a JOIN covenants b ON a.covenant_id = b.id;
```

| id | humanity_id | lineage | is_godly | covenant_id | covenant_covenant_id | covenant_covenant_name |
|---|---|---|---|---|---|---|
| 1 | 9424907 | compact-lineage-44 | true | 1 | 4e386610-8fcc-11eb-924d-9cd76263cbd0 | Extended Model |
| 2 | 2986230 | composite-lineage-45 | false | 2 | 195361 | Pilot Cluster A |
| 3 | 4e386610-8fcc-11eb-924d-9cd76263cbd0 | primary-lineage-46 | true | 3 | 10207171 | Baseline Review |
| 4 | ce090318-ea6a-431b-949e-c1573da75d62 | adaptive-lineage-47 | false | 4 | 168555 | Distributed Initiative |

### `vw_humanity_theological_claim`

This view joins `humanities` to `theological_claims` on `humanities.theological_claim_id = theological_claims.id`. It surfaces the doctrinal claim associated with each humanity. The first row links humanity with lineage `compact-lineage-44` to claim `pilot-claim-56`. The second row links humanity with lineage `composite-lineage-45` to `extended-claim-57`. This view answers: *Which theological claim is associated with each humanity?*

**View `vw_humanity_theological_claim`**

```sql
CREATE VIEW vw_humanity_theological_claim AS
SELECT a.id, a.humanity_id, a.lineage, a.is_godly, b.id AS claim_id, b.claim_id AS claim_claim_id, b.claim_text AS claim_claim_text
FROM humanities a JOIN theological_claims b ON a.theological_claim_id = b.id;
```

| id | humanity_id | lineage | is_godly | claim_id | claim_claim_id | claim_claim_text |
|---|---|---|---|---|---|---|
| 1 | 9424907 | compact-lineage-44 | true | 100 | 6969435 | pilot-claim-56 |
| 2 | 2986230 | composite-lineage-45 | false | 101 | 4463668 | extended-claim-57 |
| 3 | 4e386610-8fcc-11eb-924d-9cd76263cbd0 | primary-lineage-46 | true | 102 | lu_tax_code_template_b_VB-EC-Tab | integrated-claim-58 |
| 4 | ce090318-ea6a-431b-949e-c1573da75d62 | adaptive-lineage-47 | false | 103 | 727058 | seasonal-claim-59 |

### `vw_humanity_humanity`

This view performs a self-join on `humanities` via the `intermarries_with_humanity_id` column, surfacing pairs of human groups that intermarry or form alliances. The first row shows that humanity with lineage `compact-lineage-44` intermarries with humanity id 1 (itself). The second row shows humanity with lineage `composite-lineage-45` intermarrying with id 2 (itself). This view answers: *Which human groups intermarry with which others?*

**View `vw_humanity_humanity`**

```sql
CREATE VIEW vw_humanity_humanity AS
SELECT a.id, a.humanity_id, a.lineage, a.is_godly, b.id AS humanity_id, b.humanity_id AS humanity_humanity_id, b.lineage AS humanity_lineage
FROM humanities a JOIN humanities b ON a.intermarries_with_humanity_id = b.id;
```

| id | humanity_id | lineage | is_godly | humanity_id | humanity_humanity_id | humanity_lineage |
|---|---|---|---|---|---|---|
| 1 | 9424907 | compact-lineage-44 | true | 1 | 9424907 | compact-lineage-44 |
| 2 | 2986230 | composite-lineage-45 | false | 2 | 2986230 | composite-lineage-45 |
| 3 | 4e386610-8fcc-11eb-924d-9cd76263cbd0 | primary-lineage-46 | true | 3 | 4e386610-8fcc-11eb-924d-9cd76263cbd0 | primary-lineage-46 |
| 4 | ce090318-ea6a-431b-949e-c1573da75d62 | adaptive-lineage-47 | false | 4 | ce090318-ea6a-431b-949e-c1573da75d62 | adaptive-lineage-47 |

## Closing Synthesis

The schema models a theological-interpretive domain through five normalized base tables and eight materialized views. The base tables capture entities—interpretations, biblical texts, theological claims, covenants, and human lineages—each with its own surrogate key and a set of descriptive attributes. Foreign keys encode the cardinality-bounded relationships: an interpretation references one biblical text and one theological claim; a theological claim references one biblical text and one interpretation; a covenant references one humanity, one theological claim, and one biblical text; a humanity references one covenant and one theological claim. Self-referencing columns in `interpretations` (`contradicts_interpretation_id`) and `humanities` (`intermarries_with_humanity_id`) model intra-entity relationships. The views reassemble these normalized pieces into readable rows, each answering a specific domain question by joining the appropriate tables. Together, the tables and views form a coherent relational model that faithfully represents the structure of the theological-interpretive domain.