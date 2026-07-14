Regulatory advisory and financial modeling form the analytical backbone of capital allocation in complex infrastructure and technology sectors. When organizations commit resources to large-scale initiatives, they must reconcile uncertain future conditions with disciplined financial frameworks. Regulatory advisory questions capture the substantive uncertainties that decision-makers face; expert advisory reports provide structured responses from domain specialists; financial modeling assumptions translate those responses into quantifiable parameters; cost of capital calculations anchor those parameters in market reality; and investment projects represent the concrete commitments that flow from this entire chain of reasoning. The data records in this domain track every step—from the initial question posed on a given date, through the expert analysis that addresses it, to the financial assumptions derived, the discount rates applied, and the investment projects ultimately funded.

## Regulatory Advisory Questions

Regulatory advisory questions serve as the entry point for structured inquiry into uncertain domains. Each record captures a specific question, its unique identifier, the date it was posed, and the status of its paraphrase. The question identifiers range from short numeric codes like `325448` to UUIDs such as `dc0d0562-8fcd-11eb-924d-9cd76263cbd0`, reflecting the diverse origins of these inquiries. The `question_text` column contains labels like `composite-question-63` and `primary-question-64`, which classify the nature of the inquiry. The `paraphrased` flag indicates whether the question has been reformulated for clarity or broader applicability.

**Table `regulatory_advisory_questions`**

| id | question_id | question_text | paraphrased | asked_date | responded_in_report_paragraph | expert_advisory_report_id | financial_modeling_assumption_id |
|---|---|---|---|---|---|---|---|
| 1 | 325448 | composite-question-63 | false | 2024-07-16T18:18:00 | pilot-responde-26 | 1000 | 1 |
| 2 | 5006438 | primary-question-64 | true | 2025-12-27T01:35:00 | extended-responde-27 | 1001 | 2 |
| 3 | dc0d0562-8fcd-11eb-924d-9cd76263cbd0 | adaptive-question-65 | false | 2022-05-11T08:52:00 | integrated-responde-28 | 1002 | 3 |
| 4 | ChIJEctqrYFt5kcRUrBEPR-XXBE | distributed-question-66 | true | 2023-10-22T15:09:00 | seasonal-responde-29 | 1003 | 4 |

The `asked_date` column timestamps each inquiry, with dates spanning from May 2022 through December 2025. The `responded_in_report_paragraph` field records the paragraph identifier where the answer appears, using values such as `pilot-responde-26` and `extended-responde-27`. Each question is linked to an expert advisory report via `expert_advisory_report_id` and to a financial modeling assumption via `financial_modeling_assumption_id`, establishing the two primary downstream relationships that connect inquiry to analysis and to quantification.

## Expert Advisory Reports

Expert advisory reports constitute the formal analytical responses to regulatory advisory questions. Each report record includes a report identifier, the name of the author, the publication date, the report title, the commissioning body, and a link to the associated financial modeling assumption. The authors—Sarah Villanueva, Terry Pratchett, Nicole Smith, and Collin Lopez—represent the specialist contributors whose analysis informs investment decisions.

**Table `expert_advisory_reports`**

| id | report_id | author_name | publication_date | report_title | commission_name | financial_modeling_assumption_id |
|---|---|---|---|---|---|---|
| 1000 | 1202-0008-S | Sarah Villanueva | 2025-12-01 | Composite Protocol | Primary Review A | 1 |
| 1001 | 8189500 | Terry Pratchett | 2022-05-12 | Compact Programme A | Composite Initiative | 2 |
| 1002 | L355 | Nicole Smith | 2023-10-23 | Legacy Standard | Compact Model | 3 |
| 1003 | 5844272 | Collin Lopez | 2024-03-07 | Regional Framework | Legacy Cluster D | 4 |

Report titles such as `Composite Protocol`, `Compact Programme A`, `Legacy Standard`, and `Regional Framework` reflect the scope and character of each advisory engagement. The `commission_name` column identifies the originating body, with entries like `Primary Review A`, `Composite Initiative`, `Compact Model`, and `Legacy Cluster D`. Each report is published on a specific date and is associated with exactly one financial modeling assumption through the `financial_modeling_assumption_id` column, ensuring that every analytical response feeds directly into the quantitative framework.

## Financial Modeling Assumptions

Financial modeling assumptions bridge qualitative analysis and quantitative investment evaluation. Each assumption record specifies an assumption type, a parameter name, a value range defined by lower and upper bounds, a benchmark designation, and a status indicator. The assumption types—`extended-assumpti-75`, `integrated-assumpti-76`, `seasonal-assumpti-77`, and `regional-assumpti-78`—categorize the nature of the modeled uncertainty.

**Table `financial_modeling_assumptions`**

| id | assumption_id | assumption_type | parameter_name | value_range_lower_bound | value_range_upper_bound | is_benchmark | status | cost_of_capital_id | regulatory_advisory_question_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 57e4fc72-8fcd-11eb-924d-9cd76263cbd0 | extended-assumpti-75 | Extended Model | 6.45 | 21.70 | true | regional-status-84 | 100 | 1 |
| 2 | 43197169 | integrated-assumpti-76 | Pilot Cluster A | 10.90 | 26.40 | false | legacy-status-85 | 101 | 2 |
| 3 | 46d530ec-8fcc-11eb-924d-9cd76263cbd0 | seasonal-assumpti-77 | Baseline Review | 15.35 | 31.10 | true | compact-status-86 | 102 | 3 |
| 4 | 5082980 | regional-assumpti-78 | Distributed Initiative | 19.80 | 35.80 | false | composite-status-87 | 103 | 4 |

The parameter names, including `Extended Model`, `Pilot Cluster A`, `Baseline Review`, and `Distributed Initiative`, identify the specific quantities being modeled. Value ranges span from a lower bound of 6.45 to an upper bound of 35.80, reflecting the breadth of uncertainty across different domains. The `is_benchmark` flag distinguishes reference assumptions from exploratory ones; for instance, `Extended Model` and `Baseline Review` are marked as benchmarks, while `Pilot Cluster A` and `Distributed Initiative` are not. The `status` column carries values such as `regional-status-84` and `legacy-status-85`, indicating the current standing of each assumption. Each assumption links to a cost of capital record via `cost_of_capital_id` and to a regulatory advisory question via `regulatory_advisory_question_id`, completing the analytical chain from question to financial parameter.

## Cost of Capitals

Cost of capital records provide the market-based discount rates and risk parameters that underpin investment evaluation. Each record includes a calculation date, a discount rate, a risk-free rate, a beta estimate, a methodology designation, and a link to the associated investment project. The discount rates range from 4.20 to 16.80, the risk-free rates from 10.20 to 22.80, and the beta estimates from 21.20 to 33.80, reflecting the increasing risk profiles across the portfolio.

**Table `cost_of_capitals`**

| cost_of_capital_id | cost_id | calculation_date | discount_rate | risk_free_rate | beta_estimate | methodology | investment_project_id |
|---|---|---|---|---|---|---|---|
| 100 | 12042 | 2025-04-11T15:45:00 | 4.20 | 10.20 | 21.20 | compact-methodol-68 | 1 |
| 101 | 8387552 | 2022-09-22T22:02:00 | 8.40 | 14.40 | 25.40 | composite-methodol-69 | 2 |
| 102 | 1437587 | 2023-02-06T05:19:00 | 12.60 | 18.60 | 29.60 | primary-methodol-70 | 3 |
| 103 | 3906 | 2024-07-17T12:36:00 | 16.80 | 22.80 | 33.80 | adaptive-methodol-71 | 4 |

The methodology column uses labels such as `compact-methodol-68`, `composite-methodol-69`, `primary-methodol-70`, and `adaptive-methodol-71`, identifying the computational approach applied in each case. Calculation dates span from September 2022 to April 2025, indicating that cost of capital parameters are periodically recalculated as market conditions evolve. Each cost of capital record is linked to an investment project through `investment_project_id`, ensuring that the discount parameters are traceable to the specific commitments they inform.

## Investment Projects

Investment projects represent the concrete financial commitments that result from the regulatory advisory and financial modeling process. Each project record includes a project identifier, a provider name, a funding source, a total value, an implementation status, a risk category, and links to both the cost of capital and the regulatory advisory question that informed the decision.

**Table `investment_projects`**

| investment_project_id | project_id | provider_name | funding_source | total_value | implementation_status | risk_category | cost_of_capital_id | regulatory_advisory_question_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 1437597 | Primary Initiative A | baseline-funding-73 | 9.45 | distributed-implemen-72 | regional-risk-90 | 100 | 1 |
| 2 | df5a6648-8fd1-11eb-924d-9cd76263cbd0 | Composite Model | pilot-funding-74 | 12.90 | baseline-implemen-73 | legacy-risk-91 | 101 | 2 |
| 3 | 5006462 | Compact Cluster | extended-funding-75 | 16.35 | pilot-implemen-74 | compact-risk-92 | 102 | 3 |
| 4 | 10207143 | Legacy Review D | integrated-funding-76 | 19.80 | extended-implemen-75 | composite-risk-93 | 103 | 4 |

Provider names such as `Primary Initiative A`, `Composite Model`, `Compact Cluster`, and `Legacy Review D` identify the organizations executing the projects. Funding sources include `baseline-funding-73`, `pilot-funding-74`, `extended-funding-75`, and `integrated-funding-76`. Total project values range from 9.45 to 19.80, reflecting the scale of commitments. Implementation statuses—`distributed-implemen-72`, `baseline-implemen-73`, `pilot-implemen-74`, and `extended-implemen-75`—track the execution phase of each project. Risk categories such as `regional-risk-90` and `legacy-risk-91` classify the risk profile. Each project is linked to a cost of capital via `cost_of_capital_id` and to a regulatory advisory question via `regulatory_advisory_question_id`, closing the loop between initial inquiry and final commitment.

## Junction Tables

Two junction tables capture the many-to-many relationships that exist between reports and questions, and between costs and assumptions. The `reports_questions` table links expert advisory reports to regulatory advisory questions, allowing a single report to address multiple questions and a single question to be addressed across multiple reports.

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

For example, report `1000` addresses questions `1` and `2`, while report `1003` addresses questions `4` and `1`. This structure reflects the reality that expert analyses often span multiple regulatory topics, and that complex questions may benefit from multiple analytical perspectives.

The `capitals_assumptions` table links cost of capital records to financial modeling assumptions, enabling the same cost parameters to be applied across multiple assumptions and the same assumption to be evaluated under different cost scenarios.

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

## Joined Views

The views in this domain synthesize the base tables into analytical perspectives that answer specific operational questions. Each view joins related records to provide a complete picture of a particular relationship.

The view `v_regulatory_advisory_question_expert_advisory_report` joins regulatory advisory questions with their corresponding expert advisory reports, answering the question of which report addressed which inquiry. A row from this view might show that question `325448` (`composite-question-63`) was addressed in the report authored by Sarah Villanueva, published on 2025-12-01 under the title `Composite Protocol`. This view enables practitioners to trace any question back to its authoritative response.

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

The view `v_regulatory_advisory_question_financial_modeling_assumption` connects regulatory advisory questions to the financial modeling assumptions derived from their analysis. For instance, question `5006438` (`primary-question-64`) maps to assumption `43197169` (`integrated-assumpti-76`), which models the parameter `Pilot Cluster A` with a value range of 10.90 to 26.40. This view reveals how qualitative inquiries are translated into quantitative parameters.

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

The view `v_expert_advisory_report_regulatory_advisory_question_detail` provides a detailed perspective on the relationship between expert advisory reports and the regulatory questions they address. A row from this view might show that Terry Pratchett's report `8189500` (`Compact Programme A`) addressed question `5006438` (`primary-question-64`), which was paraphrased and asked on 2025-12-27. This view supports audit trails and quality reviews by presenting the full context of each report-question pairing.

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

The view `v_expert_advisory_report_financial_modeling_assumption` links expert advisory reports directly to the financial modeling assumptions they inform. For example, Nicole Smith's report `L355` (`Legacy Standard`) is associated with assumption `46d530ec-8fcc-11eb-924d-9cd76263cbd0` (`seasonal-assumpti-77`), which models `Baseline Review` with a benchmark designation and a value range of 15.35 to 31.10. This view enables practitioners to assess whether the financial parameters used in investment decisions are grounded in expert analysis.

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

The view `v_financial_modeling_assumption_cost_of_capital` connects financial modeling assumptions to the cost of capital records that provide the discount rates and risk parameters. A row from this view might show that assumption `57e4fc72-8fcd-11eb-924d-9cd76263cbd0` (`extended-assumpti-75`) is evaluated using cost of capital `12042`, which applies a discount rate of 4.20, a risk-free rate of 10.20, and a beta estimate of 21.20 using the `compact-methodol-68` methodology. This view is essential for understanding how market conditions are applied to specific modeled parameters.

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

The view `v_financial_modeling_assumption_regulatory_advisory_question` provides the reverse linkage, showing which regulatory advisory question gave rise to each financial modeling assumption. For instance, assumption `5082980` (`regional-assumpti-78`) traces back to question `ChIJEctqrYFt5kcRUrBEPR-XXBE` (`distributed-question-66`), which was asked on 2023-10-22 and responded to in paragraph `seasonal-responde-29`. This view supports traceability from financial parameters back to the original regulatory uncertainties they were designed to address.

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

The view `v_cost_of_capital_financial_modeling_assumption_detail` offers a detailed perspective on the relationship between cost of capital records and the financial modeling assumptions they support. A row from this view might show that cost of capital `8387552`, calculated on 2022-09-22 with a discount rate of 8.40, supports assumption `43197169` (`integrated-assumpti-76`). This view is particularly useful for sensitivity analysis, as it allows practitioners to examine how changes in cost of capital parameters would affect the evaluation of specific assumptions.

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

The view `v_cost_of_capital_investment_project` links cost of capital records to the investment projects they inform. For example, cost of capital `1437587`, with a discount rate of 12.60 and methodology `primary-methodol-70`, is applied to investment project `5006462` (`Compact Cluster`), which has a total value of 16.35 and an implementation status of `pilot-implemen-74`. This view enables practitioners to verify that the correct discount parameters are being applied to each project.

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

The view `v_investment_project_cost_of_capital` provides the reverse linkage, showing which cost of capital record was used to evaluate each investment project. A row from this view might show that investment project `1437597` (`Primary Initiative A`), funded through `baseline-funding-73` with a total value of 9.45 and risk category `regional-risk-90`, was evaluated using cost of capital `12042`. This view supports governance reviews by ensuring that every investment decision can be traced to its underlying cost of capital parameters.

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

The view `v_investment_project_regulatory_advisory_question` connects investment projects directly to the regulatory advisory questions that informed their evaluation. For instance, investment project `df5a6648-8fd1-11eb-924d-9cd76263cbd0` (`Composite Model`), with a total value of 12.90 and implementation status `baseline-implemen-73`, is linked to regulatory advisory question `5006438` (`primary-question-64`). This view provides the highest-level traceability, connecting final investment commitments back to the original regulatory uncertainties that motivated the entire analytical process.

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

## Synthesis

The data in this domain forms a coherent analytical pipeline: regulatory advisory questions identify the uncertainties that matter, expert advisory reports provide structured responses, financial modeling assumptions translate those responses into quantifiable parameters, cost of capital records apply market-based discount rates and risk adjustments, and investment projects represent the final commitments. The junction tables and joined views ensure that every link in this chain is traceable and auditable. A practitioner reviewing investment project `10207143` (`Legacy Review D`) can trace its cost of capital `3906` back to financial modeling assumption `5082980`, then to regulatory advisory question `ChIJEctqrYFt5kcRUrBEPR-XXBE`, and finally to the expert advisory report `5844272` authored by Collin Lopez. This end-to-end traceability is what distinguishes disciplined capital allocation from ad hoc decision-making, ensuring that every dollar committed can be justified by a clear chain of reasoning from regulatory uncertainty to financial commitment.