## Domain Modeling and Relational Materialization

The domain under examination is a regulatory and financial advisory ecosystem in which expert advisory reports, financial modeling assumptions, cost-of-capital calculations, and investment projects are interwoven through a network of regulatory questions. Each regulatory question serves as a pivot point: it is answered within an expert advisory report, it grounds a financial modeling assumption, and it is referenced by investment projects. The relational schema captures this web by distributing the entities across seven base tables, linking them with foreign keys and a single junction table, and then reassembling the domain facts through ten materialized views. The following sections walk through the entity types, their attributes, the cardinality-bounded relationships that become columns and foreign keys, and the joins that reconstruct the original domain facts.

### The Core Entity Types

Five principal entity types populate the schema. The `regulatory_advisory_questions` table anchors the model. Each row represents a single question posed in the regulatory advisory process, carrying a surrogate `id` (an integer or UUID), a business `question_id` (such as `325448` or `ChIJEctqrYFt5kcRUrBEPR-XXBE`), the free-text `question_text` (e.g. `composite-question-63`), a boolean `paraphrased` flag, the `asked_date` (`2024-07-16T18:18:00`), the `responded_in_report_paragraph` field (`pilot-responde-26`), and two foreign keys: `expert_advisory_report_id` pointing to `expert_advisory_reports.id` and `financial_modeling_assumption_id` pointing to `financial_modeling_assumptions.id`. The first row illustrates the pattern: question `325448` was asked on 2024-07-16, has not been paraphrased, was answered in paragraph `pilot-responde-26`, and is linked to expert advisory report `1000` and financial modeling assumption `1`.

**Table `regulatory_advisory_questions`**

| id | question_id | question_text | paraphrased | asked_date | responded_in_report_paragraph | expert_advisory_report_id | financial_modeling_assumption_id |
|---|---|---|---|---|---|---|---|
| 1 | 325448 | composite-question-63 | false | 2024-07-16T18:18:00 | pilot-responde-26 | 1000 | 1 |
| 2 | 5006438 | primary-question-64 | true | 2025-12-27T01:35:00 | extended-responde-27 | 1001 | 2 |
| 3 | dc0d0562-8fcd-11eb-924d-9cd76263cbd0 | adaptive-question-65 | false | 2022-05-11T08:52:00 | integrated-responde-28 | 1002 | 3 |
| 4 | ChIJEctqrYFt5kcRUrBEPR-XXBE | distributed-question-66 | true | 2023-10-22T15:09:00 | seasonal-responde-29 | 1003 | 4 |

The `expert_advisory_reports` table stores the advisory reports themselves. Each row has a surrogate `id` (e.g. `1000`), a business `report_id` (`1202-0008-S`), the `author_name` (`Sarah Villanueva`), the `publication_date` (`2025-12-01`), the `report_title` (`Composite Protocol`), the `commission_name` (`Primary Review A`), and a foreign key `financial_modeling_assumption_id` referencing `financial_modeling_assumptions.id`. The report authored by Sarah Villanueva, titled "Composite Protocol," was published on 2025-12-01 under the commission "Primary Review A" and is associated with financial modeling assumption `1`.

**Table `expert_advisory_reports`**

| id | report_id | author_name | publication_date | report_title | commission_name | financial_modeling_assumption_id |
|---|---|---|---|---|---|---|
| 1000 | 1202-0008-S | Sarah Villanueva | 2025-12-01 | Composite Protocol | Primary Review A | 1 |
| 1001 | 8189500 | Terry Pratchett | 2022-05-12 | Compact Programme A | Composite Initiative | 2 |
| 1002 | L355 | Nicole Smith | 2023-10-23 | Legacy Standard | Compact Model | 3 |
| 1003 | 5844272 | Collin Lopez | 2024-03-07 | Regional Framework | Legacy Cluster D | 4 |

The `financial_modeling_assumptions` table captures the quantitative assumptions underpinning financial models. Its columns include a surrogate `id`, a business `assumption_id` (e.g. `57e4fc72-8fcd-11eb-924d-9cd76263cbd0`), the `assumption_type` (`extended-assumpti-75`), the `parameter_name` (`Extended Model`), numeric bounds `value_range_lower_bound` (`6.45`) and `value_range_upper_bound` (`21.70`), a boolean `is_benchmark` flag, a `status` field (`regional-status-84`), and two foreign keys: `cost_of_capital_id` pointing to `cost_of_capitals.cost_of_capital_id` and `regulatory_advisory_question_id` pointing to `regulatory_advisory_questions.id`. The first assumption, of type `extended-assumpti-75` for the parameter "Extended Model," spans the range 6.45 to 21.70, is marked as a benchmark, carries status `regional-status-84`, and is linked to cost of capital `100` and regulatory advisory question `1`.

**Table `financial_modeling_assumptions`**

| id | assumption_id | assumption_type | parameter_name | value_range_lower_bound | value_range_upper_bound | is_benchmark | status | cost_of_capital_id | regulatory_advisory_question_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 57e4fc72-8fcd-11eb-924d-9cd76263cbd0 | extended-assumpti-75 | Extended Model | 6.45 | 21.70 | true | regional-status-84 | 100 | 1 |
| 2 | 43197169 | integrated-assumpti-76 | Pilot Cluster A | 10.90 | 26.40 | false | legacy-status-85 | 101 | 2 |
| 3 | 46d530ec-8fcc-11eb-924d-9cd76263cbd0 | seasonal-assumpti-77 | Baseline Review | 15.35 | 31.10 | true | compact-status-86 | 102 | 3 |
| 4 | 5082980 | regional-assumpti-78 | Distributed Initiative | 19.80 | 35.80 | false | composite-status-87 | 103 | 4 |

The `cost_of_capitals` table holds the capital cost calculations. Each row has a surrogate `cost_of_capital_id` (e.g. `100`), a business `cost_id` (`12042`), the `calculation_date` (`2025-04-11T15:45:00`), the `discount_rate` (`4.20`), the `risk_free_rate` (`10.20`), the `beta_estimate` (`21.20`), the `methodology` (`compact-methodol-68`), and a foreign key `investment_project_id` referencing `investment_projects.investment_project_id`. The first cost of capital, identified by business key `12042`, was calculated on 2025-04-11 with a discount rate of 4.20, a risk-free rate of 10.20, a beta estimate of 21.20, using methodology `compact-methodol-68`, and is associated with investment project `1`.

**Table `cost_of_capitals`**

| cost_of_capital_id | cost_id | calculation_date | discount_rate | risk_free_rate | beta_estimate | methodology | investment_project_id |
|---|---|---|---|---|---|---|---|
| 100 | 12042 | 2025-04-11T15:45:00 | 4.20 | 10.20 | 21.20 | compact-methodol-68 | 1 |
| 101 | 8387552 | 2022-09-22T22:02:00 | 8.40 | 14.40 | 25.40 | composite-methodol-69 | 2 |
| 102 | 1437587 | 2023-02-06T05:19:00 | 12.60 | 18.60 | 29.60 | primary-methodol-70 | 3 |
| 103 | 3906 | 2024-07-17T12:36:00 | 16.80 | 22.80 | 33.80 | adaptive-methodol-71 | 4 |

The `investment_projects` table records the investment projects themselves. Columns include a surrogate `investment_project_id` (e.g. `1`), a business `project_id` (`1437597`), the `provider_name` (`Primary Initiative A`), the `funding_source` (`baseline-funding-73`), the `total_value` (`9.45`), the `implementation_status` (`distributed-implemen-72`), the `risk_category` (`regional-risk-90`), and two foreign keys: `cost_of_capital_id` pointing to `cost_of_capitals.cost_of_capital_id` and `regulatory_advisory_question_id` pointing to `regulatory_advisory_questions.id`. The first project, "Primary Initiative A," is funded via `baseline-funding-73`, has a total value of 9.45, is in status `distributed-implemen-72`, carries risk category `regional-risk-90`, and is linked to cost of capital `100` and regulatory advisory question `1`.

**Table `investment_projects`**

| investment_project_id | project_id | provider_name | funding_source | total_value | implementation_status | risk_category | cost_of_capital_id | regulatory_advisory_question_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 1437597 | Primary Initiative A | baseline-funding-73 | 9.45 | distributed-implemen-72 | regional-risk-90 | 100 | 1 |
| 2 | df5a6648-8fd1-11eb-924d-9cd76263cbd0 | Composite Model | pilot-funding-74 | 12.90 | baseline-implemen-73 | legacy-risk-91 | 101 | 2 |
| 3 | 5006462 | Compact Cluster | extended-funding-75 | 16.35 | pilot-implemen-74 | compact-risk-92 | 102 | 3 |
| 4 | 10207143 | Legacy Review D | integrated-funding-76 | 19.80 | extended-implemen-75 | composite-risk-93 | 103 | 4 |

### The Junction Tables

Two junction tables mediate many-to-many relationships that cannot be expressed through simple foreign keys. The `reports_questions` table links `expert_advisory_reports` to `regulatory_advisory_questions`. Its two columns, `expert_advisory_report_id` and `regulatory_advisory_question_id`, form a composite key. The data shows that report `1000` is associated with questions `1` and `2`, report `1001` with questions `2` and `3`, report `1002` with questions `3` and `4`, and report `1003` with questions `4` and `1`. This eight-row table establishes that each expert advisory report can address multiple regulatory questions, and each regulatory question can be addressed by multiple reports.

**Table `reports_questions`**

| expert_advisory_report_id | regulatory_advisory_question_id |
|---|---|
| 1000 | 1 |
| 1000 | 2 |
| 1001 | 2 |
| 1001 | 3 |
| 1002 | 3 |
| 1002 | 4 |
| 1003 | 4 |
| 1003 | 1 |

The `capitals_assumptions` table serves a similar mediating role between `cost_of_capitals` and `financial_modeling_assumptions`. Although the row-level data is not enumerated here, its structural purpose is clear: it resolves the many-to-many relationship between cost-of-capital records and financial modeling assumptions, allowing a single cost of capital to be associated with multiple assumptions and vice versa.

**Table `capitals_assumptions`**

| cost_of_capital_id | financial_modeling_assumption_id |
|---|---|
| 100 | 1 |
| 100 | 2 |
| 101 | 2 |
| 101 | 3 |
| 102 | 3 |
| 102 | 4 |
| 103 | 4 |
| 103 | 1 |

### Foreign Keys and Cardinality

The foreign keys in this schema encode several distinct cardinality patterns. The `regulatory_advisory_questions.expert_advisory_report_id` column enforces a many-to-one relationship: many regulatory questions can reference the same expert advisory report, but each question references at most one report. The `regulatory_advisory_questions.financial_modeling_assumption_id` column similarly enforces many-to-one: many questions can reference the same financial modeling assumption. The `financial_modeling_assumptions.cost_of_capital_id` and `financial_modeling_assumptions.regulatory_advisory_question_id` columns each enforce many-to-one from assumptions to their respective parents. The `cost_of_capitals.investment_project_id` and `investment_projects.cost_of_capital_id` columns form a bidirectional many-to-one pair: many cost-of-capital records can reference the same investment project, and many investment projects can reference the same cost of capital. The `investment_projects.regulatory_advisory_question_id` column enforces many-to-one from projects to questions.

These foreign keys, together with the two junction tables, ensure that the schema is in at least third normal form. No non-key attribute depends transitively on a primary key; all transitive dependencies are resolved through explicit foreign key references or junction tables.

### View-Based Reassembly of Domain Facts

The ten views materialize the domain facts by joining the normalized tables back together. Each view answers a specific analytical question by reconstructing a multi-table fact from the normalized base tables.

The view `v_regulatory_advisory_question_expert_advisory_report` joins `regulatory_advisory_questions` to `expert_advisory_reports` on `regulatory_advisory_questions.expert_advisory_report_id = expert_advisory_reports.id`. It answers the question: "Which expert advisory report answered which regulatory question?" The first row of this view would show that question `325448` (text: `composite-question-63`, asked on `2024-07-16T18:18:00`) was answered in report `1202-0008-S` ("Composite Protocol") authored by Sarah Villanueva and published on `2025-12-01`.

**View `v_regulatory_advisory_question_expert_advisory_report`**

```sql
CREATE VIEW v_regulatory_advisory_question_expert_advisory_report AS
SELECT a.id, a.question_id, a.question_text, a.paraphrased, b.id AS report_id, b.report_id AS report_report_id, b.author_name AS report_author_name
FROM regulatory_advisory_questions a JOIN expert_advisory_reports b ON a.expert_advisory_report_id = b.id;
```

| id | question_id | question_text | paraphrased | report_id | report_report_id | report_author_name |
|---|---|---|---|---|---|---|
| 1 | 325448 | composite-question-63 | false | 1000 | 1202-0008-S | Sarah Villanueva |
| 2 | 5006438 | primary-question-64 | true | 1001 | 8189500 | Terry Pratchett |
| 3 | dc0d0562-8fcd-11eb-924d-9cd76263cbd0 | adaptive-question-65 | false | 1002 | L355 | Nicole Smith |
| 4 | ChIJEctqrYFt5kcRUrBEPR-XXBE | distributed-question-66 | true | 1003 | 5844272 | Collin Lopez |

The view `v_regulatory_advisory_question_financial_modeling_assumption` joins `regulatory_advisory_questions` to `financial_modeling_assumptions` on `regulatory_advisory_questions.financial_modeling_assumption_id = financial_modeling_assumptions.id`. It answers: "Which financial modeling assumption is grounded by which regulatory question?" The first row would show that question `325448` is grounded by assumption `57e4fc72-8fcd-11eb-924d-9cd76263cbd0` of type `extended-assumpti-75`, parameter "Extended Model," with value range 6.45 to 21.70, marked as a benchmark.

**View `v_regulatory_advisory_question_financial_modeling_assumption`**

```sql
CREATE VIEW v_regulatory_advisory_question_financial_modeling_assumption AS
SELECT a.id, a.question_id, a.question_text, a.paraphrased, b.id AS assumption_id, b.assumption_id AS assumption_assumption_id, b.assumption_type AS assumption_assumption_type
FROM regulatory_advisory_questions a JOIN financial_modeling_assumptions b ON a.financial_modeling_assumption_id = b.id;
```

| id | question_id | question_text | paraphrased | assumption_id | assumption_assumption_id | assumption_assumption_type |
|---|---|---|---|---|---|---|
| 1 | 325448 | composite-question-63 | false | 1 | 57e4fc72-8fcd-11eb-924d-9cd76263cbd0 | extended-assumpti-75 |
| 2 | 5006438 | primary-question-64 | true | 2 | 43197169 | integrated-assumpti-76 |
| 3 | dc0d0562-8fcd-11eb-924d-9cd76263cbd0 | adaptive-question-65 | false | 3 | 46d530ec-8fcc-11eb-924d-9cd76263cbd0 | seasonal-assumpti-77 |
| 4 | ChIJEctqrYFt5kcRUrBEPR-XXBE | distributed-question-66 | true | 4 | 5082980 | regional-assumpti-78 |

The view `v_expert_advisory_report_regulatory_advisory_question_detail` joins `expert_advisory_reports` to `regulatory_advisory_questions` through the `reports_questions` junction table. It answers: "For each expert advisory report, which regulatory questions does it address, with full question detail?" The first row would show that report `1202-0008-S` ("Composite Protocol") addresses question `325448` (`composite-question-63`) and question `5006438` (`primary-question-64`), with the latter having been paraphrased and asked on `2025-12-27T01:35:00`.

**View `v_expert_advisory_report_regulatory_advisory_question_detail`**

```sql
CREATE VIEW v_expert_advisory_report_regulatory_advisory_question_detail AS
SELECT a.id, a.report_id, a.author_name, b.id AS question_id, b.question_id AS question_question_id, b.question_text AS question_question_text
FROM expert_advisory_reports a
  JOIN reports_questions j ON j.expert_advisory_report_id = a.id
  JOIN regulatory_advisory_questions b ON b.id = j.regulatory_advisory_question_id;
```

| id | report_id | author_name | question_id | question_question_id | question_question_text |
|---|---|---|---|---|---|
| 1000 | 1202-0008-S | Sarah Villanueva | 1 | 325448 | composite-question-63 |
| 1000 | 1202-0008-S | Sarah Villanueva | 2 | 5006438 | primary-question-64 |
| 1001 | 8189500 | Terry Pratchett | 2 | 5006438 | primary-question-64 |
| 1001 | 8189500 | Terry Pratchett | 3 | dc0d0562-8fcd-11eb-924d-9cd76263cbd0 | adaptive-question-65 |
| 1002 | L355 | Nicole Smith | 3 | dc0d0562-8fcd-11eb-924d-9cd76263cbd0 | adaptive-question-65 |
| 1002 | L355 | Nicole Smith | 4 | ChIJEctqrYFt5kcRUrBEPR-XXBE | distributed-question-66 |
| 1003 | 5844272 | Collin Lopez | 4 | ChIJEctqrYFt5kcRUrBEPR-XXBE | distributed-question-66 |
| 1003 | 5844272 | Collin Lopez | 1 | 325448 | composite-question-63 |

The view `v_expert_advisory_report_financial_modeling_assumption` joins `expert_advisory_reports` to `financial_modeling_assumptions` through `regulatory_advisory_questions` and `reports_questions`. It answers: "Which financial modeling assumptions are connected to which expert advisory reports via the regulatory questions they address?" The first row would show that report `1202-0008-S` is connected to assumption `57e4fc72-8fcd-11eb-924d-9cd76263cbd0` (Extended Model, range 6.45–21.70) through question `325448`.

**View `v_expert_advisory_report_financial_modeling_assumption`**

```sql
CREATE VIEW v_expert_advisory_report_financial_modeling_assumption AS
SELECT a.id, a.report_id, a.author_name, a.publication_date, b.id AS assumption_id, b.assumption_id AS assumption_assumption_id, b.assumption_type AS assumption_assumption_type
FROM expert_advisory_reports a JOIN financial_modeling_assumptions b ON a.financial_modeling_assumption_id = b.id;
```

| id | report_id | author_name | publication_date | assumption_id | assumption_assumption_id | assumption_assumption_type |
|---|---|---|---|---|---|---|
| 1000 | 1202-0008-S | Sarah Villanueva | 2025-12-01 | 1 | 57e4fc72-8fcd-11eb-924d-9cd76263cbd0 | extended-assumpti-75 |
| 1001 | 8189500 | Terry Pratchett | 2022-05-12 | 2 | 43197169 | integrated-assumpti-76 |
| 1002 | L355 | Nicole Smith | 2023-10-23 | 3 | 46d530ec-8fcc-11eb-924d-9cd76263cbd0 | seasonal-assumpti-77 |
| 1003 | 5844272 | Collin Lopez | 2024-03-07 | 4 | 5082980 | regional-assumpti-78 |

The view `v_financial_modeling_assumption_cost_of_capital` joins `financial_modeling_assumptions` to `cost_of_capitals` on `financial_modeling_assumptions.cost_of_capital_id = cost_of_capitals.cost_of_capital_id`. It answers: "Which cost of capital calculation underpins which financial modeling assumption?" The first row would show that assumption `57e4fc72-8fcd-11eb-924d-9cd76263cbd0` (Extended Model, range 6.45–21.70) is underpinned by cost of capital `12042`, calculated on `2025-04-11T15:45:00` with discount rate 4.20, risk-free rate 10.20, beta estimate 21.20, using methodology `compact-methodol-68`.

**View `v_financial_modeling_assumption_cost_of_capital`**

```sql
CREATE VIEW v_financial_modeling_assumption_cost_of_capital AS
SELECT a.id, a.assumption_id, a.assumption_type, a.parameter_name, b.cost_of_capital_id AS capital_cost_of_capital_id, b.cost_id AS capital_cost_id, b.calculation_date AS capital_calculation_date
FROM financial_modeling_assumptions a JOIN cost_of_capitals b ON a.cost_of_capital_id = b.cost_of_capital_id;
```

| id | assumption_id | assumption_type | parameter_name | capital_cost_of_capital_id | capital_cost_id | capital_calculation_date |
|---|---|---|---|---|---|---|
| 1 | 57e4fc72-8fcd-11eb-924d-9cd76263cbd0 | extended-assumpti-75 | Extended Model | 100 | 12042 | 2025-04-11T15:45:00 |
| 2 | 43197169 | integrated-assumpti-76 | Pilot Cluster A | 101 | 8387552 | 2022-09-22T22:02:00 |
| 3 | 46d530ec-8fcc-11eb-924d-9cd76263cbd0 | seasonal-assumpti-77 | Baseline Review | 102 | 1437587 | 2023-02-06T05:19:00 |
| 4 | 5082980 | regional-assumpti-78 | Distributed Initiative | 103 | 3906 | 2024-07-17T12:36:00 |

The view `v_financial_modeling_assumption_regulatory_advisory_question` joins `financial_modeling_assumptions` to `regulatory_advisory_questions` on `financial_modeling_assumptions.regulatory_advisory_question_id = regulatory_advisory_questions.id`. It answers: "Which regulatory question grounds which financial modeling assumption?" The first row would show that assumption `57e4fc72-8fcd-11eb-924d-9cd76263cbd0` (Extended Model, range 6.45–21.70) is grounded by question `325448` (`composite-question-63`), asked on `2024-07-16T18:18:00` and answered in paragraph `pilot-responde-26`.

**View `v_financial_modeling_assumption_regulatory_advisory_question`**

```sql
CREATE VIEW v_financial_modeling_assumption_regulatory_advisory_question AS
SELECT a.id, a.assumption_id, a.assumption_type, a.parameter_name, b.id AS question_id, b.question_id AS question_question_id, b.question_text AS question_question_text
FROM financial_modeling_assumptions a JOIN regulatory_advisory_questions b ON a.regulatory_advisory_question_id = b.id;
```

| id | assumption_id | assumption_type | parameter_name | question_id | question_question_id | question_question_text |
|---|---|---|---|---|---|---|
| 1 | 57e4fc72-8fcd-11eb-924d-9cd76263cbd0 | extended-assumpti-75 | Extended Model | 1 | 325448 | composite-question-63 |
| 2 | 43197169 | integrated-assumpti-76 | Pilot Cluster A | 2 | 5006438 | primary-question-64 |
| 3 | 46d530ec-8fcc-11eb-924d-9cd76263cbd0 | seasonal-assumpti-77 | Baseline Review | 3 | dc0d0562-8fcd-11eb-924d-9cd76263cbd0 | adaptive-question-65 |
| 4 | 5082980 | regional-assumpti-78 | Distributed Initiative | 4 | ChIJEctqrYFt5kcRUrBEPR-XXBE | distributed-question-66 |

The view `v_cost_of_capital_financial_modeling_assumption_detail` joins `cost_of_capitals` to `financial_modeling_assumptions` through the `capitals_assumptions` junction table. It answers: "For each cost of capital, which financial modeling assumptions does it support, with full assumption detail?" The first row would show that cost of capital `12042` (discount rate 4.20, methodology `compact-methodol-68`) supports assumption `57e4fc72-8fcd-11eb-924d-9cd76263cbd0` (Extended Model, range 6.45–21.70, benchmark status).

**View `v_cost_of_capital_financial_modeling_assumption_detail`**

```sql
CREATE VIEW v_cost_of_capital_financial_modeling_assumption_detail AS
SELECT a.cost_of_capital_id, a.cost_id, a.calculation_date, b.id AS assumption_id, b.assumption_id AS assumption_assumption_id, b.assumption_type AS assumption_assumption_type
FROM cost_of_capitals a
  JOIN capitals_assumptions j ON j.cost_of_capital_id = a.cost_of_capital_id
  JOIN financial_modeling_assumptions b ON b.id = j.financial_modeling_assumption_id;
```

| cost_of_capital_id | cost_id | calculation_date | assumption_id | assumption_assumption_id | assumption_assumption_type |
|---|---|---|---|---|---|
| 100 | 12042 | 2025-04-11T15:45:00 | 1 | 57e4fc72-8fcd-11eb-924d-9cd76263cbd0 | extended-assumpti-75 |
| 100 | 12042 | 2025-04-11T15:45:00 | 2 | 43197169 | integrated-assumpti-76 |
| 101 | 8387552 | 2022-09-22T22:02:00 | 2 | 43197169 | integrated-assumpti-76 |
| 101 | 8387552 | 2022-09-22T22:02:00 | 3 | 46d530ec-8fcc-11eb-924d-9cd76263cbd0 | seasonal-assumpti-77 |
| 102 | 1437587 | 2023-02-06T05:19:00 | 3 | 46d530ec-8fcc-11eb-924d-9cd76263cbd0 | seasonal-assumpti-77 |
| 102 | 1437587 | 2023-02-06T05:19:00 | 4 | 5082980 | regional-assumpti-78 |
| 103 | 3906 | 2024-07-17T12:36:00 | 4 | 5082980 | regional-assumpti-78 |
| 103 | 3906 | 2024-07-17T12:36:00 | 1 | 57e4fc72-8fcd-11eb-924d-9cd76263cbd0 | extended-assumpti-75 |

The view `v_cost_of_capital_investment_project` joins `cost_of_capitals` to `investment_projects` on `cost_of_capitals.investment_project_id = investment_projects.investment_project_id`. It answers: "Which investment project is associated with which cost of capital calculation?" The first row would show that cost of capital `12042` (discount rate 4.20, methodology `compact-methodol-68`) is associated with investment project `1437597` ("Primary Initiative A"), funded via `baseline-funding-73`, with total value 9.45, status `distributed-implemen-72`, and risk category `regional-risk-90`.

**View `v_cost_of_capital_investment_project`**

```sql
CREATE VIEW v_cost_of_capital_investment_project AS
SELECT a.cost_of_capital_id, a.cost_id, a.calculation_date, a.discount_rate, b.investment_project_id AS project_investment_project_id, b.project_id AS project_project_id, b.provider_name AS project_provider_name
FROM cost_of_capitals a JOIN investment_projects b ON a.investment_project_id = b.investment_project_id;
```

| cost_of_capital_id | cost_id | calculation_date | discount_rate | project_investment_project_id | project_project_id | project_provider_name |
|---|---|---|---|---|---|---|
| 100 | 12042 | 2025-04-11T15:45:00 | 4.20 | 1 | 1437597 | Primary Initiative A |
| 101 | 8387552 | 2022-09-22T22:02:00 | 8.40 | 2 | df5a6648-8fd1-11eb-924d-9cd76263cbd0 | Composite Model |
| 102 | 1437587 | 2023-02-06T05:19:00 | 12.60 | 3 | 5006462 | Compact Cluster |
| 103 | 3906 | 2024-07-17T12:36:00 | 16.80 | 4 | 10207143 | Legacy Review D |

The view `v_investment_project_cost_of_capital` joins `investment_projects` to `cost_of_capitals` on `investment_projects.cost_of_capital_id = cost_of_capitals.cost_of_capital_id`. It answers: "For each investment project, which cost of capital calculation is applied?" The first row would show that investment project `1437597` ("Primary Initiative A", total value 9.45, risk category `regional-risk-90`) applies cost of capital `12042` (discount rate 4.20, risk-free rate 10.20, beta estimate 21.20, methodology `compact-methodol-68`).

**View `v_investment_project_cost_of_capital`**

```sql
CREATE VIEW v_investment_project_cost_of_capital AS
SELECT a.investment_project_id, a.project_id, a.provider_name, a.funding_source, b.cost_of_capital_id AS capital_cost_of_capital_id, b.cost_id AS capital_cost_id, b.calculation_date AS capital_calculation_date
FROM investment_projects a JOIN cost_of_capitals b ON a.cost_of_capital_id = b.cost_of_capital_id;
```

| investment_project_id | project_id | provider_name | funding_source | capital_cost_of_capital_id | capital_cost_id | capital_calculation_date |
|---|---|---|---|---|---|---|
| 1 | 1437597 | Primary Initiative A | baseline-funding-73 | 100 | 12042 | 2025-04-11T15:45:00 |
| 2 | df5a6648-8fd1-11eb-924d-9cd76263cbd0 | Composite Model | pilot-funding-74 | 101 | 8387552 | 2022-09-22T22:02:00 |
| 3 | 5006462 | Compact Cluster | extended-funding-75 | 102 | 1437587 | 2023-02-06T05:19:00 |
| 4 | 10207143 | Legacy Review D | integrated-funding-76 | 103 | 3906 | 2024-07-17T12:36:00 |

The view `v_investment_project_regulatory_advisory_question` joins `investment_projects` to `regulatory_advisory_questions` on `investment_projects.regulatory_advisory_question_id = regulatory_advisory_questions.id`. It answers: "Which regulatory question is referenced by which investment project?" The first row would show that investment project `1437597` ("Primary Initiative A", total value 9.45, risk category `regional-risk-90`) references question `325448` (`composite-question-63`), asked on `2024-07-16T18:18:00` and answered in paragraph `pilot-responde-26`.

**View `v_investment_project_regulatory_advisory_question`**

```sql
CREATE VIEW v_investment_project_regulatory_advisory_question AS
SELECT a.investment_project_id, a.project_id, a.provider_name, a.funding_source, b.id AS question_id, b.question_id AS question_question_id, b.question_text AS question_question_text
FROM investment_projects a JOIN regulatory_advisory_questions b ON a.regulatory_advisory_question_id = b.id;
```

| investment_project_id | project_id | provider_name | funding_source | question_id | question_question_id | question_question_text |
|---|---|---|---|---|---|---|
| 1 | 1437597 | Primary Initiative A | baseline-funding-73 | 1 | 325448 | composite-question-63 |
| 2 | df5a6648-8fd1-11eb-924d-9cd76263cbd0 | Composite Model | pilot-funding-74 | 2 | 5006438 | primary-question-64 |
| 3 | 5006462 | Compact Cluster | extended-funding-75 | 3 | dc0d0562-8fcd-11eb-924d-9cd76263cbd0 | adaptive-question-65 |
| 4 | 10207143 | Legacy Review D | integrated-funding-76 | 4 | ChIJEctqrYFt5kcRUrBEPR-XXBE | distributed-question-66 |

### Closing Synthesis

The schema models a regulatory-financial advisory domain in which five core entities—regulatory advisory questions, expert advisory reports, financial modeling assumptions, cost of capitals, and investment projects—are linked through a combination of direct foreign keys and two junction tables. The foreign keys encode many-to-one relationships that flow from questions to reports and assumptions, from assumptions to costs and questions, and from costs and projects to each other. The junction tables `reports_questions` and `capitals_assumptions` resolve the many-to-many relationships that the direct foreign keys cannot express. The ten views reassemble these normalized pieces into domain-level facts: which report answers which question, which assumption is grounded by which question, which cost underpins which assumption, and which project applies which cost. Together, the base tables and views provide a complete, queryable representation of the regulatory advisory ecosystem, with every row value—from question `325448` to cost of capital `12042` to project `1437597`—traceable through the join paths that the views materialize.