## Ontology-Grounded Relational Modelling in the ESG Governance Domain

The ESG governance domain captures how organizations plan, measure, and report on environmental, social, and governance initiatives. At its core, the model distinguishes six entity types: metrics that quantify performance, reports that aggregate those metrics into formal publications, advisors who author and advise on the content, executive leaders who own accountability, strategies that define the planned trajectory, and standards that supply the regulatory or normative framework against which everything is evaluated. The relational schema materialises these entities as six base tables, twelve junction tables that resolve many-to-many associations, and nineteen derived views that reconstruct domain facts for analytical consumption. Every column in every table traces back to an ontological concept; every foreign key encodes a relationship whose cardinality was bounded during modelling.

**Table `e_s_g_metrics`**

| id | metric_id | metric_name | category | standard | unit_of_measure | is_material | report_id | e_s_g_advisor_id |
|---|---|---|---|---|---|---|---|---|
| 1000 | 3744010 | Primary Programme A | Environmental | SASB | composite-unit-69 | false | 1202-0008-S | 100 |
| 1001 | 136630a8-8fcc-11eb-924d-9cd76263cbd0 | Composite Standard | Social | GRI | primary-unit-70 | true | 8189500 | 101 |
| 1002 | 2986226 | Compact Framework | Governance | TCFD | adaptive-unit-71 | false | L355 | 102 |
| 1003 | 2002007020010 | Legacy Protocol D | Environmental | Internal | distributed-unit-72 | true | 5844272 | 103 |

The `e_s_g_metrics` table is the central measurement entity. Each row represents a single ESG metric identified by a surrogate `id` (e.g. `1000`) and a business-level `metric_id` such as `3744010` or the UUID `136630a8-8fcc-11eb-924d-9cd76263cbd0`. The `metric_name` column carries human-readable labels like *Primary Programme A* or *Composite Standard*. The `category` attribute constrains the metric to one of three ontological buckets—`Environmental`, `Social`, or `Governance`—as seen in the sample rows. The `standard` column records the normative framework the metric aligns with, taking values such as `SASB`, `GRI`, `TCFD`, or `Internal`. Measurement is further qualified by `unit_of_measure` (e.g. `composite-unit-69`, `primary-unit-70`), a boolean `is_material` flag indicating whether the metric is deemed material to the organisation, and two foreign keys: `report_id` links the metric to the report in which it appears, while `e_s_g_advisor_id` attributes authorship to a specific advisor. The presence of both foreign keys in the entity table itself signals that, in this ontology, a metric is always associated with exactly one report and one advisor—a 1:1 cardinality bound at the entity level.

**Table `e_s_g_reports`**

| report_id | report_title | publication_date | reporting_period_start | reporting_period_end | status | sector_classification | e_s_g_advisor_id | executive_leader_id |
|---|---|---|---|---|---|---|---|---|
| 1202-0008-S | Composite Protocol | 2025-12-01 | 2023-02-20 | 2024-03-23 | Draft | extended-sector-51 | 100 | 1 |
| 8189500 | Compact Programme A | 2022-05-12 | 2024-07-04 | 2025-08-07 | UnderReview | integrated-sector-52 | 101 | 2 |
| L355 | Legacy Standard | 2023-10-23 | 2025-12-15 | 2022-01-18 | Published | seasonal-sector-53 | 102 | 3 |
| 5844272 | Regional Framework | 2024-03-07 | 2022-05-26 | 2023-06-02 | Archived | regional-sector-54 | 103 | 4 |

Reports aggregate metrics into formal publications. The `e_s_g_reports` table uses `report_id` as its primary key, with values like `1202-0008-S` and `8189500`. The `report_title` column stores descriptive names such as *Composite Protocol* or *Compact Programme A*. Temporal scope is captured through `publication_date` (e.g. `2025-12-01`), `reporting_period_start` (e.g. `2023-02-20`), and `reporting_period_end` (e.g. `2024-03-23`). The `status` column constrains the report lifecycle to values including `Draft`, `UnderReview`, `Published`, and `Archived`. Sector classification is recorded in `sector_classification` with values like `extended-sector-51` and `integrated-sector-52`. Two foreign keys anchor the report to the organisational hierarchy: `e_s_g_advisor_id` attributes authorship (e.g. `100`), and `executive_leader_id` assigns accountability (e.g. `1`).

**Table `e_s_g_advisors`**

| id | employee_id | job_title | department | salary_min | salary_max | contract_type | start_date | executive_leader_id |
|---|---|---|---|---|---|---|---|---|
| 100 | Norma Fisher | Primary Initiative A | adaptive-departme-89 | 13.49 | 13.94 | Full Time | 2022-09-05 | 1 |
| 101 | Tasha Rodriguez | Composite Model | distributed-departme-90 | 17.12 | 25.36 | Indefinite | 2023-02-16 | 2 |
| 102 | Theodore Mcgrath | Compact Cluster | baseline-departme-91 | 25.36 | 26.25 | Full Time | 2024-07-27 | 3 |
| 103 | Peter Mcdowell | Legacy Review D | pilot-departme-92 | 35.61 | 10.72 | Indefinite | 2025-12-11 | 4 |

Advisors are the people who author, review, and advise on ESG content. The `e_s_g_advisors` table uses a surrogate `id` (e.g. `100`) as primary key, alongside a business `employee_id` that mirrors the name stored in `job_title`—for instance, `Norma Fisher` holds both the employee identifier and the job title in the sample data. The `department` column classifies the advisor into organisational units such as `adaptive-departme-89` or `distributed-departme-90`. Compensation is bounded by `salary_min` and `salary_max` (e.g. `13.49` and `13.94` for advisor `100`). Employment terms are captured in `contract_type` (`Full Time` or `Indefinite`), and `start_date` records when the advisor joined (e.g. `2022-09-05`). The foreign key `executive_leader_id` binds each advisor to their sponsoring executive (e.g. `1`), establishing a hierarchical reporting line.

**Table `executive_leaders`**

| executive_leader_id | employee_id | job_title | department | has_dotted_line_to |
|---|---|---|---|---|
| 1 | Norma Fisher | Executive Vice President, Corporate Services and Chief Financial Officer | Corporate Services | seasonal-dotted-95 |
| 2 | Tasha Rodriguez | President and Chief Executive Officer | Executive Office | regional-dotted-96 |
| 3 | Theodore Mcgrath | Executive Vice President, Corporate Services and Chief Financial Officer | Corporate Services | legacy-dotted-97 |
| 4 | Peter Mcdowell | President and Chief Executive Officer | Executive Office | compact-dotted-98 |

Executive leaders sit at the apex of the accountability hierarchy. The `executive_leaders` table uses `executive_leader_id` as its primary key, with values `1` through `4`. The `employee_id` column stores the leader's name (e.g. `Norma Fisher`), and `job_title` carries the full formal title such as *Executive Vice President, Corporate Services and Chief Financial Officer*. The `department` column distinguishes between `Corporate Services` and `Executive Office`. The `has_dotted_line_to` column encodes a lateral or dotted-line relationship to another entity, taking values like `seasonal-dotted-95` or `regional-dotted-96`. This column is a self-referential foreign key that enables the modelling of matrix reporting structures within the executive tier.

**Table `e_s_g_strategies`**

| strategy_id | strategy_name | status | target_completion_date | scope | e_s_g_advisor_id | executive_leader_id |
|---|---|---|---|---|---|---|
| 392481 | Integrated Framework A | Planning | 2024-07-25 | Internal Operations | 100 | 1 |
| 24897677 | Extended Protocol | Implementation | 2025-12-09 | Member Education | 101 | 2 |
| 9736901 | Pilot Programme | Evaluation | 2022-05-20 | Policy Advocacy | 102 | 3 |
| 25893422 | Baseline Standard D | Completed | 2023-10-04 | Organizational Practices | 103 | 4 |

Strategies define the planned trajectory of ESG initiatives. The `e_s_g_strategies` table uses `strategy_id` as its primary key (e.g. `392481`, `24897677`). The `strategy_name` column carries labels such as *Integrated Framework A* or *Extended Protocol*. The `status` column constrains the strategy lifecycle to `Planning`, `Implementation`, `Evaluation`, or `Completed`. The `target_completion_date` (e.g. `2024-07-25`) provides a temporal anchor. The `scope` column classifies the strategic focus area, with values including `Internal Operations`, `Member Education`, `Policy Advocacy`, and `Organizational Practices`. Two foreign keys bind the strategy to the organisational structure: `e_s_g_advisor_id` attributes ownership (e.g. `100`), and `executive_leader_id` assigns executive sponsorship (e.g. `1`).

**Table `e_s_g_standards`**

| e_s_g_standard_id | standard_id | standard_name | issuing_body | effective_date | jurisdiction |
|---|---|---|---|---|---|
| 1 | 7119764 | SASB | Sustainability Accounting Standards Board | 2023-02-14 | National |
| 2 | 9125617 | GRI | Global Reporting Initiative | 2024-07-25 | International |
| 3 | 338526 | TCFD | Task Force on Climate-related Financial Disclosures | 2025-12-09 | British Columbia |
| 4 | 3717623 | BC Legislation | Government of British Columbia | 2022-05-20 | Canadian |

Standards supply the normative and regulatory framework. The `e_s_g_standards` table uses `e_s_g_standard_id` as its surrogate primary key and `standard_id` as the business identifier (e.g. `7119764`, `9125617`). The `standard_name` column carries the formal name such as *SASB*, *GRI*, *TCFD*, or *BC Legislation*. The `issuing_body` column records the organisation that promulgates the standard (e.g. *Sustainability Accounting Standards Board*, *Global Reporting Initiative*). The `effective_date` (e.g. `2023-02-14`) marks when the standard came into force, and `jurisdiction` constrains its geographic applicability to values like `National`, `International`, `British Columbia`, or `Canadian`.

The six base tables above capture the core entities. However, the ontology also requires many-to-many relationships that cannot be expressed through simple foreign keys. These are materialised as junction tables.

**Table `reports_metrics`**

| report_id | e_s_g_metric_id |
|---|---|
| 1202-0008-S | 1000 |
| 1202-0008-S | 1001 |
| 8189500 | 1001 |
| 8189500 | 1002 |
| L355 | 1002 |
| L355 | 1003 |
| 5844272 | 1003 |
| 5844272 | 1000 |

The `reports_metrics` junction table resolves the many-to-many relationship between reports and metrics. A single report can contain many metrics, and a metric can appear in multiple reports. The table's composite key consists of `report_id` and `metric_id`, each acting as a foreign key referencing `e_s_g_reports` and `e_s_g_metrics` respectively. This normalisation allows the schema to track metric reuse across reports without duplicating metric definitions.

**Table `advisors_metrics`**

| e_s_g_advisor_id | e_s_g_metric_id |
|---|---|
| 100 | 1000 |
| 100 | 1001 |
| 101 | 1001 |
| 101 | 1002 |
| 102 | 1002 |
| 102 | 1003 |
| 103 | 1003 |
| 103 | 1000 |

The `advisors_metrics` junction table links advisors to the metrics they author or advise on. A single advisor can be associated with many metrics, and a metric can have multiple advisors. The composite key of `advisor_id` and `metric_id` enables fine-grained attribution of metric authorship across the advisory team.

**Table `advisors_reports`**

| e_s_g_advisor_id | report_id |
|---|---|
| 100 | 1202-0008-S |
| 100 | 8189500 |
| 101 | 8189500 |
| 101 | L355 |
| 102 | L355 |
| 102 | 5844272 |
| 103 | 5844272 |
| 103 | 1202-0008-S |

The `advisors_reports` junction table connects advisors to the reports they contribute to. This decouples the single `e_s_g_advisor_id` foreign key in `e_s_g_reports` (which captures primary authorship) from the broader set of contributors. The composite key of `advisor_id` and `report_id` supports collaborative report authorship.

**Table `advisors_standards`**

| e_s_g_advisor_id | e_s_g_standard_id |
|---|---|
| 100 | 1 |
| 100 | 2 |
| 101 | 2 |
| 101 | 3 |
| 102 | 3 |
| 102 | 4 |
| 103 | 4 |
| 103 | 1 |

The `advisors_standards` junction table maps advisors to the standards they specialise in or advise upon. An advisor may be an expert in multiple standards (e.g. both SASB and GRI), and a standard may have multiple advisor experts. The composite key of `advisor_id` and `standard_id` captures this expertise mapping.

**Table `leaders_advisors`**

| executive_leader_id | e_s_g_advisor_id |
|---|---|
| 1 | 100 |
| 1 | 101 |
| 2 | 101 |
| 2 | 102 |
| 3 | 102 |
| 3 | 103 |
| 4 | 103 |
| 4 | 100 |

The `leaders_advisors` junction table resolves the relationship between executive leaders and advisors. While `e_s_g_advisors` already contains a direct `executive_leader_id` foreign key, this junction table supports the case where an advisor may report to multiple executives in a matrix structure. The composite key of `leader_id` and `advisor_id` enables many-to-many reporting relationships.

**Table `leaders_reports`**

| executive_leader_id | report_id |
|---|---|
| 1 | 1202-0008-S |
| 1 | 8189500 |
| 2 | 8189500 |
| 2 | L355 |
| 3 | L355 |
| 3 | 5844272 |
| 4 | 5844272 |
| 4 | 1202-0008-S |

The `leaders_reports` junction table links executive leaders to the reports they are accountable for. This complements the direct `executive_leader_id` foreign key in `e_s_g_reports` by allowing multiple leaders to share accountability for a single report. The composite key of `leader_id` and `report_id` supports shared executive ownership.

**Table `leaders_strategies`**

| executive_leader_id | strategy_id |
|---|---|
| 1 | 392481 |
| 1 | 24897677 |
| 2 | 24897677 |
| 2 | 9736901 |
| 3 | 9736901 |
| 3 | 25893422 |
| 4 | 25893422 |
| 4 | 392481 |

The `leaders_strategies` junction table connects executive leaders to the strategies they sponsor. While `e_s_g_strategies` contains a direct `executive_leader_id` foreign key, this junction table enables multiple leaders to co-sponsor a strategy. The composite key of `leader_id` and `strategy_id` captures shared strategic sponsorship.

**Table `strategies_metrics`**

| strategy_id | e_s_g_metric_id |
|---|---|
| 392481 | 1000 |
| 392481 | 1001 |
| 24897677 | 1001 |
| 24897677 | 1002 |
| 9736901 | 1002 |
| 9736901 | 1003 |
| 25893422 | 1003 |
| 25893422 | 1000 |

The `strategies_metrics` junction table links strategies to the metrics that measure their progress. A strategy can be evaluated against multiple metrics, and a metric can track progress across multiple strategies. The composite key of `strategy_id` and `metric_id` enables this cross-cutting measurement relationship.

**Table `strategies_reports`**

| strategy_id | report_id |
|---|---|
| 392481 | 1202-0008-S |
| 392481 | 8189500 |
| 24897677 | 8189500 |
| 24897677 | L355 |
| 9736901 | L355 |
| 9736901 | 5844272 |
| 25893422 | 5844272 |
| 25893422 | 1202-0008-S |

The `strategies_reports` junction table connects strategies to the reports in which they are discussed or reported. A strategy may appear in multiple reports, and a report may cover multiple strategies. The composite key of `strategy_id` and `report_id` supports this many-to-many association.

**Table `standards_metrics`**

| e_s_g_standard_id | e_s_g_metric_id |
|---|---|
| 1 | 1000 |
| 1 | 1001 |
| 2 | 1001 |
| 2 | 1002 |
| 3 | 1002 |
| 3 | 1003 |
| 4 | 1003 |
| 4 | 1000 |

The `standards_metrics` junction table maps standards to the metrics they govern. A standard can prescribe multiple metrics, and a metric can be governed by multiple standards. The composite key of `standard_id` and `metric_id` captures this normative relationship.

**Table `standards_advisors`**

| e_s_g_standard_id | e_s_g_advisor_id |
|---|---|
| 1 | 100 |
| 1 | 101 |
| 2 | 101 |
| 2 | 102 |
| 3 | 102 |
| 3 | 103 |
| 4 | 103 |
| 4 | 100 |

The `standards_advisors` junction table links standards to the advisors who specialise in them. This is a symmetric counterpart to `advisors_standards`, ensuring that the relationship can be traversed from either direction without loss of information. The composite key of `standard_id` and `advisor_id` mirrors the expertise mapping.

**Table `standards_reports`**

| e_s_g_standard_id | report_id |
|---|---|
| 1 | 1202-0008-S |
| 1 | 8189500 |
| 2 | 8189500 |
| 2 | L355 |
| 3 | L355 |
| 3 | 5844272 |
| 4 | 5844272 |
| 4 | 1202-0008-S |

The `standards_reports` junction table connects standards to the reports that reference them. A standard can be cited in multiple reports, and a report can reference multiple standards. The composite key of `standard_id` and `report_id` captures the citation relationship.

With the base and junction tables established, the schema provides nineteen derived views that reconstruct domain facts by joining the normalised tables. Each view answers a specific analytical question.

**View `vw_e_s_g_metric_e_s_g_report`**

```sql
CREATE VIEW vw_e_s_g_metric_e_s_g_report AS
SELECT a.id, a.metric_id, a.metric_name, a.category, b.report_id AS report_report_id, b.report_title AS report_report_title, b.publication_date AS report_publication_date
FROM e_s_g_metrics a JOIN e_s_g_reports b ON a.report_id = b.report_id;
```

| id | metric_id | metric_name | category | report_report_id | report_report_title | report_publication_date |
|---|---|---|---|---|---|---|
| 1000 | 3744010 | Primary Programme A | Environmental | 1202-0008-S | Composite Protocol | 2025-12-01 |
| 1001 | 136630a8-8fcc-11eb-924d-9cd76263cbd0 | Composite Standard | Social | 8189500 | Compact Programme A | 2022-05-12 |
| 1002 | 2986226 | Compact Framework | Governance | L355 | Legacy Standard | 2023-10-23 |
| 1003 | 2002007020010 | Legacy Protocol D | Environmental | 5844272 | Regional Framework | 2024-03-07 |

This view joins `e_s_g_metrics` to `e_s_g_reports` on the metric's `report_id` foreign key, producing a flat row per metric that includes the report's title, status, and publication date. It answers the question: *Which report does this metric belong to, and what is the report's current state?* A row for metric `Primary Programme A` would show it belongs to report `1202-0008-S` (Composite Protocol), which is in `Draft` status and was published on `2025-12-01`.

**View `vw_e_s_g_metric_e_s_g_advisor`**

```sql
CREATE VIEW vw_e_s_g_metric_e_s_g_advisor AS
SELECT a.id, a.metric_id, a.metric_name, a.category, b.id AS advisor_id, b.employee_id AS advisor_employee_id, b.job_title AS advisor_job_title
FROM e_s_g_metrics a JOIN e_s_g_advisors b ON a.e_s_g_advisor_id = b.id;
```

| id | metric_id | metric_name | category | advisor_id | advisor_employee_id | advisor_job_title |
|---|---|---|---|---|---|---|
| 1000 | 3744010 | Primary Programme A | Environmental | 100 | Norma Fisher | Primary Initiative A |
| 1001 | 136630a8-8fcc-11eb-924d-9cd76263cbd0 | Composite Standard | Social | 101 | Tasha Rodriguez | Composite Model |
| 1002 | 2986226 | Compact Framework | Governance | 102 | Theodore Mcgrath | Compact Cluster |
| 1003 | 2002007020010 | Legacy Protocol D | Environmental | 103 | Peter Mcdowell | Legacy Review D |

This view joins `e_s_g_metrics` to `e_s_g_advisors` on the metric's `e_s_g_advisor_id` foreign key, producing a flat row per metric that includes the advisor's name, department, and contract type. It answers: *Which advisor authored this metric, and what is their employment context?* A row for metric `Composite Standard` would show it was authored by advisor `101` (Tasha Rodriguez) in department `distributed-departme-90` under an `Indefinite` contract.

**View `vw_e_s_g_report_e_s_g_metric_detail`**

```sql
CREATE VIEW vw_e_s_g_report_e_s_g_metric_detail AS
SELECT a.report_id, a.report_title, a.publication_date, b.id AS metric_id, b.metric_id AS metric_metric_id, b.metric_name AS metric_metric_name
FROM e_s_g_reports a
  JOIN reports_metrics j ON j.report_id = a.report_id
  JOIN e_s_g_metrics b ON b.id = j.e_s_g_metric_id;
```

| report_id | report_title | publication_date | metric_id | metric_metric_id | metric_metric_name |
|---|---|---|---|---|---|
| 1202-0008-S | Composite Protocol | 2025-12-01 | 1000 | 3744010 | Primary Programme A |
| 1202-0008-S | Composite Protocol | 2025-12-01 | 1001 | 136630a8-8fcc-11eb-924d-9cd76263cbd0 | Composite Standard |
| 8189500 | Compact Programme A | 2022-05-12 | 1001 | 136630a8-8fcc-11eb-924d-9cd76263cbd0 | Composite Standard |
| 8189500 | Compact Programme A | 2022-05-12 | 1002 | 2986226 | Compact Framework |
| L355 | Legacy Standard | 2023-10-23 | 1002 | 2986226 | Compact Framework |
| L355 | Legacy Standard | 2023-10-23 | 1003 | 2002007020010 | Legacy Protocol D |
| 5844272 | Regional Framework | 2024-03-07 | 1003 | 2002007020010 | Legacy Protocol D |
| 5844272 | Regional Framework | 2024-03-07 | 1000 | 3744010 | Primary Programme A |

This view joins `e_s_g_reports` to `e_s_g_metrics` on the report's `report_id`, producing a flat row per metric-report pair that includes the metric's name, category, standard, and unit of measure. It answers: *What metrics are included in this report, and how are they classified?* A row for report `8189500` (Compact Programme A) would show it contains metric `136630a8-8fcc-11eb-924d-9cd76263cbd0` (Composite Standard) in the `Social` category under the `GRI` standard.

**View `vw_e_s_g_report_e_s_g_advisor`**

```sql
CREATE VIEW vw_e_s_g_report_e_s_g_advisor AS
SELECT a.report_id, a.report_title, a.publication_date, a.reporting_period_start, b.id AS advisor_id, b.employee_id AS advisor_employee_id, b.job_title AS advisor_job_title
FROM e_s_g_reports a JOIN e_s_g_advisors b ON a.e_s_g_advisor_id = b.id;
```

| report_id | report_title | publication_date | reporting_period_start | advisor_id | advisor_employee_id | advisor_job_title |
|---|---|---|---|---|---|---|
| 1202-0008-S | Composite Protocol | 2025-12-01 | 2023-02-20 | 100 | Norma Fisher | Primary Initiative A |
| 8189500 | Compact Programme A | 2022-05-12 | 2024-07-04 | 101 | Tasha Rodriguez | Composite Model |
| L355 | Legacy Standard | 2023-10-23 | 2025-12-15 | 102 | Theodore Mcgrath | Compact Cluster |
| 5844272 | Regional Framework | 2024-03-07 | 2022-05-26 | 103 | Peter Mcdowell | Legacy Review D |

This view joins `e_s_g_reports` to `e_s_g_advisors` on the report's `e_s_g_advisor_id` foreign key, producing a flat row per report that includes the advisor's name, department, and salary range. It answers: *Which advisor is responsible for this report, and what are their employment details?* A row for report `L355` (Legacy Standard) would show it is authored by advisor `102` (Theodore Mcgrath) in department `baseline-departme-91` with a salary range of `25.36` to `26.25`.

**View `vw_e_s_g_report_executive_leader`**

```sql
CREATE VIEW vw_e_s_g_report_executive_leader AS
SELECT a.report_id, a.report_title, a.publication_date, a.reporting_period_start, b.executive_leader_id AS leader_executive_leader_id, b.employee_id AS leader_employee_id, b.job_title AS leader_job_title
FROM e_s_g_reports a JOIN executive_leaders b ON a.executive_leader_id = b.executive_leader_id;
```

| report_id | report_title | publication_date | reporting_period_start | leader_executive_leader_id | leader_employee_id | leader_job_title |
|---|---|---|---|---|---|---|
| 1202-0008-S | Composite Protocol | 2025-12-01 | 2023-02-20 | 1 | Norma Fisher | Executive Vice President, Corporate Services and Chief Financial Officer |
| 8189500 | Compact Programme A | 2022-05-12 | 2024-07-04 | 2 | Tasha Rodriguez | President and Chief Executive Officer |
| L355 | Legacy Standard | 2023-10-23 | 2025-12-15 | 3 | Theodore Mcgrath | Executive Vice President, Corporate Services and Chief Financial Officer |
| 5844272 | Regional Framework | 2024-03-07 | 2022-05-26 | 4 | Peter Mcdowell | President and Chief Executive Officer |

This view joins `e_s_g_reports` to `executive_leaders` on the report's `executive_leader_id` foreign key, producing a flat row per report that includes the executive's full title, department, and dotted-line relationship. It answers: *Which executive is accountable for this report?* A row for report `5844272` (Regional Framework) would show it is overseen by executive leader `4` (Peter Mcdowell), President and Chief Executive Officer in the Executive Office, with a dotted-line to `compact-dotted-98`.

**View `vw_e_s_g_advisor_executive_leader`**

```sql
CREATE VIEW vw_e_s_g_advisor_executive_leader AS
SELECT a.id, a.employee_id, a.job_title, a.department, b.executive_leader_id AS leader_executive_leader_id, b.employee_id AS leader_employee_id, b.job_title AS leader_job_title
FROM e_s_g_advisors a JOIN executive_leaders b ON a.executive_leader_id = b.executive_leader_id;
```

| id | employee_id | job_title | department | leader_executive_leader_id | leader_employee_id | leader_job_title |
|---|---|---|---|---|---|---|
| 100 | Norma Fisher | Primary Initiative A | adaptive-departme-89 | 1 | Norma Fisher | Executive Vice President, Corporate Services and Chief Financial Officer |
| 101 | Tasha Rodriguez | Composite Model | distributed-departme-90 | 2 | Tasha Rodriguez | President and Chief Executive Officer |
| 102 | Theodore Mcgrath | Compact Cluster | baseline-departme-91 | 3 | Theodore Mcgrath | Executive Vice President, Corporate Services and Chief Financial Officer |
| 103 | Peter Mcdowell | Legacy Review D | pilot-departme-92 | 4 | Peter Mcdowell | President and Chief Executive Officer |

This view joins `e_s_g_advisors` to `executive_leaders` on the advisor's `executive_leader_id` foreign key, producing a flat row per advisor that includes the executive's title and department. It answers: *Which executive sponsors this advisor?* A row for advisor `100` (Norma Fisher) would show she is sponsored by executive leader `1` (Norma Fisher), Executive Vice President, Corporate Services and Chief Financial Officer in Corporate Services.

**View `vw_e_s_g_advisor_e_s_g_metric_detail`**

```sql
CREATE VIEW vw_e_s_g_advisor_e_s_g_metric_detail AS
SELECT a.id, a.employee_id, a.job_title, b.id AS metric_id, b.metric_id AS metric_metric_id, b.metric_name AS metric_metric_name
FROM e_s_g_advisors a
  JOIN advisors_metrics j ON j.e_s_g_advisor_id = a.id
  JOIN e_s_g_metrics b ON b.id = j.e_s_g_metric_id;
```

| id | employee_id | job_title | metric_id | metric_metric_id | metric_metric_name |
|---|---|---|---|---|---|
| 100 | Norma Fisher | Primary Initiative A | 1000 | 3744010 | Primary Programme A |
| 100 | Norma Fisher | Primary Initiative A | 1001 | 136630a8-8fcc-11eb-924d-9cd76263cbd0 | Composite Standard |
| 101 | Tasha Rodriguez | Composite Model | 1001 | 136630a8-8fcc-11eb-924d-9cd76263cbd0 | Composite Standard |
| 101 | Tasha Rodriguez | Composite Model | 1002 | 2986226 | Compact Framework |
| 102 | Theodore Mcgrath | Compact Cluster | 1002 | 2986226 | Compact Framework |
| 102 | Theodore Mcgrath | Compact Cluster | 1003 | 2002007020010 | Legacy Protocol D |
| 103 | Peter Mcdowell | Legacy Review D | 1003 | 2002007020010 | Legacy Protocol D |
| 103 | Peter Mcdowell | Legacy Review D | 1000 | 3744010 | Primary Programme A |

This view joins `e_s_g_advisors` to `e_s_g_metrics` on the metric's `e_s_g_advisor_id` foreign key, producing a flat row per metric that includes the advisor's name, department, and contract type. It answers: *Which advisor authored this metric, and what are their employment details?* A row for metric `Compact Framework` would show it was authored by advisor `102` (Theodore Mcgrath) in department `baseline-departme-91` under a `Full Time` contract.

**View `vw_e_s_g_advisor_e_s_g_report_detail`**

```sql
CREATE VIEW vw_e_s_g_advisor_e_s_g_report_detail AS
SELECT a.id, a.employee_id, a.job_title, b.report_id AS report_report_id, b.report_title AS report_report_title, b.publication_date AS report_publication_date
FROM e_s_g_advisors a
  JOIN advisors_reports j ON j.e_s_g_advisor_id = a.id
  JOIN e_s_g_reports b ON b.report_id = j.report_id;
```

| id | employee_id | job_title | report_report_id | report_report_title | report_publication_date |
|---|---|---|---|---|---|
| 100 | Norma Fisher | Primary Initiative A | 1202-0008-S | Composite Protocol | 2025-12-01 |
| 100 | Norma Fisher | Primary Initiative A | 8189500 | Compact Programme A | 2022-05-12 |
| 101 | Tasha Rodriguez | Composite Model | 8189500 | Compact Programme A | 2022-05-12 |
| 101 | Tasha Rodriguez | Composite Model | L355 | Legacy Standard | 2023-10-23 |
| 102 | Theodore Mcgrath | Compact Cluster | L355 | Legacy Standard | 2023-10-23 |
| 102 | Theodore Mcgrath | Compact Cluster | 5844272 | Regional Framework | 2024-03-07 |
| 103 | Peter Mcdowell | Legacy Review D | 5844272 | Regional Framework | 2024-03-07 |
| 103 | Peter Mcdowell | Legacy Review D | 1202-0008-S | Composite Protocol | 2025-12-01 |

This view joins `e_s_g_advisors` to `e_s_g_reports` on the report's `e_s_g_advisor_id` foreign key, producing a flat row per report that includes the advisor's name, department, and salary range. It answers: *Which advisor authored this report, and what are their employment details?* A row for report `1202-0008-S` (Composite Protocol) would show it was authored by advisor `100` (Norma Fisher) in department `adaptive-departme-89` with a salary range of `13.49` to `13.94`.

**View `vw_e_s_g_advisor_e_s_g_standard_detail`**

```sql
CREATE VIEW vw_e_s_g_advisor_e_s_g_standard_detail AS
SELECT a.id, a.employee_id, a.job_title, b.e_s_g_standard_id AS standard_e_s_g_standard_id, b.standard_id AS standard_standard_id, b.standard_name AS standard_standard_name
FROM e_s_g_advisors a
  JOIN advisors_standards j ON j.e_s_g_advisor_id = a.id
  JOIN e_s_g_standards b ON b.e_s_g_standard_id = j.e_s_g_standard_id;
```

| id | employee_id | job_title | standard_e_s_g_standard_id | standard_standard_id | standard_standard_name |
|---|---|---|---|---|---|
| 100 | Norma Fisher | Primary Initiative A | 1 | 7119764 | SASB |
| 100 | Norma Fisher | Primary Initiative A | 2 | 9125617 | GRI |
| 101 | Tasha Rodriguez | Composite Model | 2 | 9125617 | GRI |
| 101 | Tasha Rodriguez | Composite Model | 3 | 338526 | TCFD |
| 102 | Theodore Mcgrath | Compact Cluster | 3 | 338526 | TCFD |
| 102 | Theodore Mcgrath | Compact Cluster | 4 | 3717623 | BC Legislation |
| 103 | Peter Mcdowell | Legacy Review D | 4 | 3717623 | BC Legislation |
| 103 | Peter Mcdowell | Legacy Review D | 1 | 7119764 | SASB |

This view joins `e_s_g_advisors` to `e_s_g_standards` through the `advisors_standards` junction table, producing a flat row per advisor-standard pair that includes the standard's name, issuing body, effective date, and jurisdiction. It answers: *Which standards does this advisor specialise in?* A row for advisor `100` would show expertise in standard `7119764` (SASB), issued by the Sustainability Accounting Standards Board, effective `2023-02-14` at the National jurisdiction level.

**View `vw_executive_leader_e_s_g_advisor_detail`**

```sql
CREATE VIEW vw_executive_leader_e_s_g_advisor_detail AS
SELECT a.executive_leader_id, a.employee_id, a.job_title, b.id AS advisor_id, b.employee_id AS advisor_employee_id, b.job_title AS advisor_job_title
FROM executive_leaders a
  JOIN leaders_advisors j ON j.executive_leader_id = a.executive_leader_id
  JOIN e_s_g_advisors b ON b.id = j.e_s_g_advisor_id;
```

| executive_leader_id | employee_id | job_title | advisor_id | advisor_employee_id | advisor_job_title |
|---|---|---|---|---|---|
| 1 | Norma Fisher | Executive Vice President, Corporate Services and Chief Financial Officer | 100 | Norma Fisher | Primary Initiative A |
| 1 | Norma Fisher | Executive Vice President, Corporate Services and Chief Financial Officer | 101 | Tasha Rodriguez | Composite Model |
| 2 | Tasha Rodriguez | President and Chief Executive Officer | 101 | Tasha Rodriguez | Composite Model |
| 2 | Tasha Rodriguez | President and Chief Executive Officer | 102 | Theodore Mcgrath | Compact Cluster |
| 3 | Theodore Mcgrath | Executive Vice President, Corporate Services and Chief Financial Officer | 102 | Theodore Mcgrath | Compact Cluster |
| 3 | Theodore Mcgrath | Executive Vice President, Corporate Services and Chief Financial Officer | 103 | Peter Mcdowell | Legacy Review D |
| 4 | Peter Mcdowell | President and Chief Executive Officer | 103 | Peter Mcdowell | Legacy Review D |
| 4 | Peter Mcdowell | President and Chief Executive Officer | 100 | Norma Fisher | Primary Initiative A |

This view joins `executive_leaders` to `e_s_g_advisors` on the advisor's `executive_leader_id` foreign key, producing a flat row per advisor that includes the executive's full title, department, and dotted-line relationship. It answers: *Which executive sponsors this advisor, and what is the executive's organisational context?* A row for advisor `101` (Tasha Rodriguez) would show she is sponsored by executive leader `2` (Tasha Rodriguez), President and Chief Executive Officer in the Executive Office, with a dotted-line to `regional-dotted-96`.

**View `vw_executive_leader_e_s_g_report_detail`**

```sql
CREATE VIEW vw_executive_leader_e_s_g_report_detail AS
SELECT a.executive_leader_id, a.employee_id, a.job_title, b.report_id AS report_report_id, b.report_title AS report_report_title, b.publication_date AS report_publication_date
FROM executive_leaders a
  JOIN leaders_reports j ON j.executive_leader_id = a.executive_leader_id
  JOIN e_s_g_reports b ON b.report_id = j.report_id;
```

| executive_leader_id | employee_id | job_title | report_report_id | report_report_title | report_publication_date |
|---|---|---|---|---|---|
| 1 | Norma Fisher | Executive Vice President, Corporate Services and Chief Financial Officer | 1202-0008-S | Composite Protocol | 2025-12-01 |
| 1 | Norma Fisher | Executive Vice President, Corporate Services and Chief Financial Officer | 8189500 | Compact Programme A | 2022-05-12 |
| 2 | Tasha Rodriguez | President and Chief Executive Officer | 8189500 | Compact Programme A | 2022-05-12 |
| 2 | Tasha Rodriguez | President and Chief Executive Officer | L355 | Legacy Standard | 2023-10-23 |
| 3 | Theodore Mcgrath | Executive Vice President, Corporate Services and Chief Financial Officer | L355 | Legacy Standard | 2023-10-23 |
| 3 | Theodore Mcgrath | Executive Vice President, Corporate Services and Chief Financial Officer | 5844272 | Regional Framework | 2024-03-07 |
| 4 | Peter Mcdowell | President and Chief Executive Officer | 5844272 | Regional Framework | 2024-03-07 |
| 4 | Peter Mcdowell | President and Chief Executive Officer | 1202-0008-S | Composite Protocol | 2025-12-01 |

This view joins `executive_leaders` to `e_s_g_reports` on the report's `executive_leader_id` foreign key, producing a flat row per report that includes the executive's title, department, and dotted-line relationship. It answers: *Which executive is accountable for this report, and what is their organisational context?* A row for report `8189500` (Compact Programme A) would show it is overseen by executive leader `2` (Tasha Rodriguez), President and Chief Executive Officer in the Executive Office, with a dotted-line to `regional-dotted-96`.

**View `vw_executive_leader_e_s_g_strategy_detail`**

```sql
CREATE VIEW vw_executive_leader_e_s_g_strategy_detail AS
SELECT a.executive_leader_id, a.employee_id, a.job_title, b.strategy_id AS strategy_strategy_id, b.strategy_name AS strategy_strategy_name, b.status AS strategy_status
FROM executive_leaders a
  JOIN leaders_strategies j ON j.executive_leader_id = a.executive_leader_id
  JOIN e_s_g_strategies b ON b.strategy_id = j.strategy_id;
```

| executive_leader_id | employee_id | job_title | strategy_strategy_id | strategy_strategy_name | strategy_status |
|---|---|---|---|---|---|
| 1 | Norma Fisher | Executive Vice President, Corporate Services and Chief Financial Officer | 392481 | Integrated Framework A | Planning |
| 1 | Norma Fisher | Executive Vice President, Corporate Services and Chief Financial Officer | 24897677 | Extended Protocol | Implementation |
| 2 | Tasha Rodriguez | President and Chief Executive Officer | 24897677 | Extended Protocol | Implementation |
| 2 | Tasha Rodriguez | President and Chief Executive Officer | 9736901 | Pilot Programme | Evaluation |
| 3 | Theodore Mcgrath | Executive Vice President, Corporate Services and Chief Financial Officer | 9736901 | Pilot Programme | Evaluation |
| 3 | Theodore Mcgrath | Executive Vice President, Corporate Services and Chief Financial Officer | 25893422 | Baseline Standard D | Completed |
| 4 | Peter Mcdowell | President and Chief Executive Officer | 25893422 | Baseline Standard D | Completed |
| 4 | Peter Mcdowell | President and Chief Executive Officer | 392481 | Integrated Framework A | Planning |

This view joins `executive_leaders` to `e_s_g_strategies` on the strategy's `executive_leader_id` foreign key, producing a flat row per strategy that includes the executive's title, department, and dotted-line relationship. It answers: *Which executive sponsors this strategy?* A row for strategy `392481` (Integrated Framework A) would show it is sponsored by executive leader `1` (Norma Fisher), Executive Vice President, Corporate Services and Chief Financial Officer in Corporate Services, with a dotted-line to `seasonal-dotted-95`.

**View `vw_e_s_g_strategy_e_s_g_metric_detail`**

```sql
CREATE VIEW vw_e_s_g_strategy_e_s_g_metric_detail AS
SELECT a.strategy_id, a.strategy_name, a.status, b.id AS metric_id, b.metric_id AS metric_metric_id, b.metric_name AS metric_metric_name
FROM e_s_g_strategies a
  JOIN strategies_metrics j ON j.strategy_id = a.strategy_id
  JOIN e_s_g_metrics b ON b.id = j.e_s_g_metric_id;
```

| strategy_id | strategy_name | status | metric_id | metric_metric_id | metric_metric_name |
|---|---|---|---|---|---|
| 392481 | Integrated Framework A | Planning | 1000 | 3744010 | Primary Programme A |
| 392481 | Integrated Framework A | Planning | 1001 | 136630a8-8fcc-11eb-924d-9cd76263cbd0 | Composite Standard |
| 24897677 | Extended Protocol | Implementation | 1001 | 136630a8-8fcc-11eb-924d-9cd76263cbd0 | Composite Standard |
| 24897677 | Extended Protocol | Implementation | 1002 | 2986226 | Compact Framework |
| 9736901 | Pilot Programme | Evaluation | 1002 | 2986226 | Compact Framework |
| 9736901 | Pilot Programme | Evaluation | 1003 | 2002007020010 | Legacy Protocol D |
| 25893422 | Baseline Standard D | Completed | 1003 | 2002007020010 | Legacy Protocol D |
| 25893422 | Baseline Standard D | Completed | 1000 | 3744010 | Primary Programme A |

This view joins `e_s_g_strategies` to `e_s_g_metrics` through the `strategies_metrics` junction table, producing a flat row per strategy-metric pair that includes the metric's name, category, standard, and unit of measure. It answers: *Which metrics measure the progress of this strategy?* A row for strategy `24897677` (Extended Protocol) would show it is measured by a metric in the `Social` category under the `GRI` standard.

**View `vw_e_s_g_strategy_e_s_g_advisor`**

```sql
CREATE VIEW vw_e_s_g_strategy_e_s_g_advisor AS
SELECT a.strategy_id, a.strategy_name, a.status, a.target_completion_date, b.id AS advisor_id, b.employee_id AS advisor_employee_id, b.job_title AS advisor_job_title
FROM e_s_g_strategies a JOIN e_s_g_advisors b ON a.e_s_g_advisor_id = b.id;
```

| strategy_id | strategy_name | status | target_completion_date | advisor_id | advisor_employee_id | advisor_job_title |
|---|---|---|---|---|---|---|
| 392481 | Integrated Framework A | Planning | 2024-07-25 | 100 | Norma Fisher | Primary Initiative A |
| 24897677 | Extended Protocol | Implementation | 2025-12-09 | 101 | Tasha Rodriguez | Composite Model |
| 9736901 | Pilot Programme | Evaluation | 2022-05-20 | 102 | Theodore Mcgrath | Compact Cluster |
| 25893422 | Baseline Standard D | Completed | 2023-10-04 | 103 | Peter Mcdowell | Legacy Review D |

This view joins `e_s_g_strategies` to `e_s_g_advisors` on the strategy's `e_s_g_advisor_id` foreign key, producing a flat row per strategy that includes the advisor's name, department, and contract type. It answers: *Which advisor owns this strategy?* A row for strategy `9736901` (Pilot Programme) would show it is owned by advisor `102` (Theodore Mcgrath) in department `baseline-departme-91` under a `Full Time` contract.

**View `vw_e_s_g_strategy_executive_leader`**

```sql
CREATE VIEW vw_e_s_g_strategy_executive_leader AS
SELECT a.strategy_id, a.strategy_name, a.status, a.target_completion_date, b.executive_leader_id AS leader_executive_leader_id, b.employee_id AS leader_employee_id, b.job_title AS leader_job_title
FROM e_s_g_strategies a JOIN executive_leaders b ON a.executive_leader_id = b.executive_leader_id;
```

| strategy_id | strategy_name | status | target_completion_date | leader_executive_leader_id | leader_employee_id | leader_job_title |
|---|---|---|---|---|---|---|
| 392481 | Integrated Framework A | Planning | 2024-07-25 | 1 | Norma Fisher | Executive Vice President, Corporate Services and Chief Financial Officer |
| 24897677 | Extended Protocol | Implementation | 2025-12-09 | 2 | Tasha Rodriguez | President and Chief Executive Officer |
| 9736901 | Pilot Programme | Evaluation | 2022-05-20 | 3 | Theodore Mcgrath | Executive Vice President, Corporate Services and Chief Financial Officer |
| 25893422 | Baseline Standard D | Completed | 2023-10-04 | 4 | Peter Mcdowell | President and Chief Executive Officer |

This view joins `e_s_g_strategies` to `executive_leaders` on the strategy's `executive_leader_id` foreign key, producing a flat row per strategy that includes the executive's title, department, and dotted-line relationship. It answers: *Which executive sponsors this strategy?* A row for strategy `25893422` (Baseline Standard D) would show it is sponsored by executive leader `4` (Peter Mcdowell), President and Chief Executive Officer in the Executive Office, with a dotted-line to `compact-dotted-98`.

**View `vw_e_s_g_strategy_e_s_g_report_detail`**

```sql
CREATE VIEW vw_e_s_g_strategy_e_s_g_report_detail AS
SELECT a.strategy_id, a.strategy_name, a.status, b.report_id AS report_report_id, b.report_title AS report_report_title, b.publication_date AS report_publication_date
FROM e_s_g_strategies a
  JOIN strategies_reports j ON j.strategy_id = a.strategy_id
  JOIN e_s_g_reports b ON b.report_id = j.report_id;
```

| strategy_id | strategy_name | status | report_report_id | report_report_title | report_publication_date |
|---|---|---|---|---|---|
| 392481 | Integrated Framework A | Planning | 1202-0008-S | Composite Protocol | 2025-12-01 |
| 392481 | Integrated Framework A | Planning | 8189500 | Compact Programme A | 2022-05-12 |
| 24897677 | Extended Protocol | Implementation | 8189500 | Compact Programme A | 2022-05-12 |
| 24897677 | Extended Protocol | Implementation | L355 | Legacy Standard | 2023-10-23 |
| 9736901 | Pilot Programme | Evaluation | L355 | Legacy Standard | 2023-10-23 |
| 9736901 | Pilot Programme | Evaluation | 5844272 | Regional Framework | 2024-03-07 |
| 25893422 | Baseline Standard D | Completed | 5844272 | Regional Framework | 2024-03-07 |
| 25893422 | Baseline Standard D | Completed | 1202-0008-S | Composite Protocol | 2025-12-01 |

This view joins `e_s_g_strategies` to `e_s_g_reports` through the `strategies_reports` junction table, producing a flat row per strategy-report pair that includes the report's title, status, publication date, and sector classification. It answers: *In which reports is this strategy discussed or reported?* A row for strategy `392481` (Integrated Framework A) would show it appears in report `1202-0008-S` (Composite Protocol), which is in `Draft` status and classified under `extended-sector-51`.

**View `vw_e_s_g_standard_e_s_g_metric_detail`**

```sql
CREATE VIEW vw_e_s_g_standard_e_s_g_metric_detail AS
SELECT a.e_s_g_standard_id, a.standard_id, a.standard_name, b.id AS metric_id, b.metric_id AS metric_metric_id, b.metric_name AS metric_metric_name
FROM e_s_g_standards a
  JOIN standards_metrics j ON j.e_s_g_standard_id = a.e_s_g_standard_id
  JOIN e_s_g_metrics b ON b.id = j.e_s_g_metric_id;
```

| e_s_g_standard_id | standard_id | standard_name | metric_id | metric_metric_id | metric_metric_name |
|---|---|---|---|---|---|
| 1 | 7119764 | SASB | 1000 | 3744010 | Primary Programme A |
| 1 | 7119764 | SASB | 1001 | 136630a8-8fcc-11eb-924d-9cd76263cbd0 | Composite Standard |
| 2 | 9125617 | GRI | 1001 | 136630a8-8fcc-11eb-924d-9cd76263cbd0 | Composite Standard |
| 2 | 9125617 | GRI | 1002 | 2986226 | Compact Framework |
| 3 | 338526 | TCFD | 1002 | 2986226 | Compact Framework |
| 3 | 338526 | TCFD | 1003 | 2002007020010 | Legacy Protocol D |
| 4 | 3717623 | BC Legislation | 1003 | 2002007020010 | Legacy Protocol D |
| 4 | 3717623 | BC Legislation | 1000 | 3744010 | Primary Programme A |

This view joins `e_s_g_standards` to `e_s_g_metrics` through the `standards_metrics` junction table, producing a flat row per standard-metric pair that includes the metric's name, category, unit of measure, and materiality flag. It answers: *Which metrics are governed by this standard?* A row for standard `7119764` (SASB) would show it governs metric `3744010` (Primary Programme A) in the `Environmental` category, measured in `composite-unit-69`, and marked as non-material.

**View `vw_e_s_g_standard_e_s_g_advisor_detail`**

```sql
CREATE VIEW vw_e_s_g_standard_e_s_g_advisor_detail AS
SELECT a.e_s_g_standard_id, a.standard_id, a.standard_name, b.id AS advisor_id, b.employee_id AS advisor_employee_id, b.job_title AS advisor_job_title
FROM e_s_g_standards a
  JOIN standards_advisors j ON j.e_s_g_standard_id = a.e_s_g_standard_id
  JOIN e_s_g_advisors b ON b.id = j.e_s_g_advisor_id;
```

| e_s_g_standard_id | standard_id | standard_name | advisor_id | advisor_employee_id | advisor_job_title |
|---|---|---|---|---|---|
| 1 | 7119764 | SASB | 100 | Norma Fisher | Primary Initiative A |
| 1 | 7119764 | SASB | 101 | Tasha Rodriguez | Composite Model |
| 2 | 9125617 | GRI | 101 | Tasha Rodriguez | Composite Model |
| 2 | 9125617 | GRI | 102 | Theodore Mcgrath | Compact Cluster |
| 3 | 338526 | TCFD | 102 | Theodore Mcgrath | Compact Cluster |
| 3 | 338526 | TCFD | 103 | Peter Mcdowell | Legacy Review D |
| 4 | 3717623 | BC Legislation | 103 | Peter Mcdowell | Legacy Review D |
| 4 | 3717623 | BC Legislation | 100 | Norma Fisher | Primary Initiative A |

This view joins `e_s_g_standards` to `e_s_g_advisors` through the `standards_advisors` junction table, producing a flat row per standard-advisor pair that includes the advisor's name, department, and contract type. It answers: *Which advisors specialise in this standard?* A row for standard `9125617` (GRI) would show advisor `101` (Tasha Rodriguez) in department `distributed-departme-90` under an `Indefinite` contract as a specialist.

**View `vw_e_s_g_standard_e_s_g_report_detail`**

```sql
CREATE VIEW vw_e_s_g_standard_e_s_g_report_detail AS
SELECT a.e_s_g_standard_id, a.standard_id, a.standard_name, b.report_id AS report_report_id, b.report_title AS report_report_title, b.publication_date AS report_publication_date
FROM e_s_g_standards a
  JOIN standards_reports j ON j.e_s_g_standard_id = a.e_s_g_standard_id
  JOIN e_s_g_reports b ON b.report_id = j.report_id;
```

| e_s_g_standard_id | standard_id | standard_name | report_report_id | report_report_title | report_publication_date |
|---|---|---|---|---|---|
| 1 | 7119764 | SASB | 1202-0008-S | Composite Protocol | 2025-12-01 |
| 1 | 7119764 | SASB | 8189500 | Compact Programme A | 2022-05-12 |
| 2 | 9125617 | GRI | 8189500 | Compact Programme A | 2022-05-12 |
| 2 | 9125617 | GRI | L355 | Legacy Standard | 2023-10-23 |
| 3 | 338526 | TCFD | L355 | Legacy Standard | 2023-10-23 |
| 3 | 338526 | TCFD | 5844272 | Regional Framework | 2024-03-07 |
| 4 | 3717623 | BC Legislation | 5844272 | Regional Framework | 2024-03-07 |
| 4 | 3717623 | BC Legislation | 1202-0008-S | Composite Protocol | 2025-12-01 |

This view joins `e_s_g_standards` to `e_s_g_reports` through the `standards_reports` junction table, producing a flat row per standard-report pair that includes the report's title, status, publication date, and sector classification. It answers: *In which reports is this standard cited or referenced?* A row for standard `338526` (TCFD) would show it is cited in report `L355` (Legacy Standard), which is `Published` and classified under `seasonal-sector-53`.

The schema's design reflects a deliberate trade-off between normalisation and query convenience. The six base tables enforce first normal form, with every attribute atomic and every foreign key explicitly declared. The twelve junction tables resolve the many-to-many relationships that the ontology requires but that relational algebra cannot express in a single table. The nineteen views materialise the most common analytical joins as virtual tables, allowing downstream consumers to query domain facts without writing explicit join clauses. Together, they form a complete relational representation of the ESG governance ontology, where every row, column, and relationship traces back to a well-defined conceptual entity.