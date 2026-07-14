# ESG Governance: Measuring, Reporting, and Leading

Organizations today operate under an increasingly complex web of environmental, social, and governance expectations. Stakeholders—from regulators and investors to employees and community members—demand transparent, comparable, and actionable disclosures. The architecture of ESG governance rests on a disciplined separation of concerns: measurable indicators are defined, validated against recognized standards, aggregated into formal reports, and overseen by a hierarchy of advisors and executive leaders who steer strategic initiatives. Understanding how these elements interlock is essential for any practitioner tasked with building, auditing, or improving an ESG program.

## Defining What Matters: Metrics and Standards

At the foundation of any ESG program lies a set of measurable indicators. These metrics capture the organization's performance across environmental, social, and governance dimensions.

**Table `e_s_g_metrics`**

| id | metric_id | metric_name | category | standard | unit_of_measure | is_material | report_id | e_s_g_advisor_id |
|---|---|---|---|---|---|---|---|---|
| 1000 | 3744010 | Primary Programme A | Environmental | SASB | composite-unit-69 | false | 1202-0008-S | 100 |
| 1001 | 136630a8-8fcc-11eb-924d-9cd76263cbd0 | Composite Standard | Social | GRI | primary-unit-70 | true | 8189500 | 101 |
| 1002 | 2986226 | Compact Framework | Governance | TCFD | adaptive-unit-71 | false | L355 | 102 |
| 1003 | 2002007020010 | Legacy Protocol D | Environmental | Internal | distributed-unit-72 | true | 5844272 | 103 |

Each metric carries a unique identifier, a descriptive name, and a categorical classification. The `category` column distinguishes whether the indicator falls under Environmental, Social, or Governance. For instance, "Primary Programme A" (metric_id `3744010`) is classified as Environmental and measured in a composite unit, while "Composite Standard" (metric_id `136630a8-8fcc-11eb-924d-9cd76263cbd0`) belongs to the Social category and is flagged as material—meaning it is deemed significant to the organization's impact and stakeholder decisions. The `is_material` flag is a critical discriminator: material metrics warrant deeper scrutiny and more rigorous reporting. The `standard` column links each metric to the framework against which it is measured, whether an external standard such as SASB, GRI, or TCFD, or an Internal framework. Units of measure range from composite and primary to adaptive and distributed, reflecting the diversity of ESG data types.

Metrics do not exist in isolation. They are anchored to recognized standards that provide methodological rigor and comparability.

**Table `e_s_g_standards`**

| e_s_g_standard_id | standard_id | standard_name | issuing_body | effective_date | jurisdiction |
|---|---|---|---|---|---|
| 1 | 7119764 | SASB | Sustainability Accounting Standards Board | 2023-02-14 | National |
| 2 | 9125617 | GRI | Global Reporting Initiative | 2024-07-25 | International |
| 3 | 338526 | TCFD | Task Force on Climate-related Financial Disclosures | 2025-12-09 | British Columbia |
| 4 | 3717623 | BC Legislation | Government of British Columbia | 2022-05-20 | Canadian |

The standards table enumerates the authoritative frameworks governing ESG disclosure. SASB, issued by the Sustainability Accounting Standards Board, carries a National jurisdiction and an effective date of 2023-02-14. GRI, from the Global Reporting Initiative, operates at the International level and became effective on 2024-07-25. TCFD, the Task Force on Climate-related Financial Disclosures, is scoped to British Columbia with an effective date of 2025-12-09. BC Legislation, issued by the Government of British Columbia, applies within the Canadian jurisdiction and took effect on 2022-05-20. These standards serve as the reference against which metrics are validated and reports are structured.

The linkage between metrics and standards is captured in the join table `standards_metrics`, which records which metrics are governed by which standards. This many-to-many relationship allows a single metric to be evaluated against multiple frameworks simultaneously, and a single standard to govern numerous metrics across the organization.

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

## The Reporting Lifecycle

Metrics are aggregated into formal reports that communicate an organization's ESG performance to external and internal audiences. Reports carry their own lifecycle: they move through Draft, UnderReview, Published, and Archived states.

**Table `e_s_g_reports`**

| report_id | report_title | publication_date | reporting_period_start | reporting_period_end | status | sector_classification | e_s_g_advisor_id | executive_leader_id |
|---|---|---|---|---|---|---|---|---|
| 1202-0008-S | Composite Protocol | 2025-12-01 | 2023-02-20 | 2024-03-23 | Draft | extended-sector-51 | 100 | 1 |
| 8189500 | Compact Programme A | 2022-05-12 | 2024-07-04 | 2025-08-07 | UnderReview | integrated-sector-52 | 101 | 2 |
| L355 | Legacy Standard | 2023-10-23 | 2025-12-15 | 2022-01-18 | Published | seasonal-sector-53 | 102 | 3 |
| 5844272 | Regional Framework | 2024-03-07 | 2022-05-26 | 2023-06-02 | Archived | regional-sector-54 | 103 | 4 |

Each report is identified by a `report_id` and titled descriptively—"Composite Protocol," "Compact Programme A," "Legacy Standard," and "Regional Framework" are examples. Reports cover defined reporting periods bounded by `reporting_period_start` and `reporting_period_end`, and they are dated by `publication_date`. The `sector_classification` column categorizes the report by industry or operational sector, such as extended-sector-51 or integrated-sector-52. Reports are authored under the guidance of an ESG advisor and overseen by an executive leader, establishing clear lines of accountability.

The relationship between reports and metrics is mediated by the `reports_metrics` join table, which records which metrics are included in which reports. This allows organizations to compose reports from diverse metric sets, tailoring disclosures to specific audiences, regulatory requirements, or reporting periods.

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

## Advisors and Executive Leadership

The human infrastructure of ESG governance consists of advisors who manage the day-to-day work of measurement and reporting, and executive leaders who provide strategic direction and accountability.

**Table `e_s_g_advisors`**

| id | employee_id | job_title | department | salary_min | salary_max | contract_type | start_date | executive_leader_id |
|---|---|---|---|---|---|---|---|---|
| 100 | Norma Fisher | Primary Initiative A | adaptive-departme-89 | 13.49 | 13.94 | Full Time | 2022-09-05 | 1 |
| 101 | Tasha Rodriguez | Composite Model | distributed-departme-90 | 17.12 | 25.36 | Indefinite | 2023-02-16 | 2 |
| 102 | Theodore Mcgrath | Compact Cluster | baseline-departme-91 | 25.36 | 26.25 | Full Time | 2024-07-27 | 3 |
| 103 | Peter Mcdowell | Legacy Review D | pilot-departme-92 | 35.61 | 10.72 | Indefinite | 2025-12-11 | 4 |

ESG advisors are employees with defined roles, departments, and compensation bands. Norma Fisher, holding the title "Primary Initiative A" within adaptive-departme-89, has a salary range of 13.49 to 13.94 and began her tenure on 2022-09-05 under a Full Time contract. Tasha Rodriguez, titled "Composite Model" in distributed-departme-90, earns between 17.12 and 25.36 and joined on 2023-02-16 under an Indefinite contract. Theodore Mcgrath, "Compact Cluster" in baseline-departme-91, has a salary range of 25.36 to 26.25 and started on 2024-07-27. Peter Mcdowell, "Legacy Review D" in pilot-departme-92, carries a salary range of 35.61 to 10.72 and began on 2025-12-11 under an Indefinite contract. Each advisor is assigned to an executive leader, establishing a direct supervisory relationship.

The advisors_metrics join table records which metrics each advisor is responsible for managing, while advisors_reports links advisors to the reports they author or review. Advisors also engage with standards through the advisors_standards table, indicating which frameworks they are authorized to interpret or apply.

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

Executive leaders sit at the apex of the ESG governance hierarchy.

**Table `executive_leaders`**

| executive_leader_id | employee_id | job_title | department | has_dotted_line_to |
|---|---|---|---|---|
| 1 | Norma Fisher | Executive Vice President, Corporate Services and Chief Financial Officer | Corporate Services | seasonal-dotted-95 |
| 2 | Tasha Rodriguez | President and Chief Executive Officer | Executive Office | regional-dotted-96 |
| 3 | Theodore Mcgrath | Executive Vice President, Corporate Services and Chief Financial Officer | Corporate Services | legacy-dotted-97 |
| 4 | Peter Mcdowell | President and Chief Executive Officer | Executive Office | compact-dotted-98 |

Norma Fisher serves as Executive Vice President, Corporate Services and Chief Financial Officer within Corporate Services, with a dotted-line reporting relationship to seasonal-dotted-95. Tasha Rodriguez holds the title of President and Chief Executive Officer in the Executive Office, with a dotted line to regional-dotted-96. Theodore Mcgrath mirrors Norma's role as Executive Vice President, Corporate Services and Chief Financial Officer, with a dotted line to legacy-dotted-97. Peter Mcdowell, also President and Chief Executive Officer in the Executive Office, reports with a dotted line to compact-dotted-98. The `has_dotted_line_to` column captures cross-functional accountability relationships that extend beyond the direct reporting structure.

The leaders_advisors table formalizes the supervisory relationships between executive leaders and ESG advisors, while leaders_reports and leaders_strategies track which reports and strategies each leader oversees.

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

## Strategic Initiatives

ESG governance is not merely retrospective; it is forward-looking. Strategies encode the organization's planned actions to improve performance, close gaps, and align with stakeholder expectations.

**Table `e_s_g_strategies`**

| strategy_id | strategy_name | status | target_completion_date | scope | e_s_g_advisor_id | executive_leader_id |
|---|---|---|---|---|---|---|
| 392481 | Integrated Framework A | Planning | 2024-07-25 | Internal Operations | 100 | 1 |
| 24897677 | Extended Protocol | Implementation | 2025-12-09 | Member Education | 101 | 2 |
| 9736901 | Pilot Programme | Evaluation | 2022-05-20 | Policy Advocacy | 102 | 3 |
| 25893422 | Baseline Standard D | Completed | 2023-10-04 | Organizational Practices | 103 | 4 |

Strategies are identified by a `strategy_id` and named descriptively—"Integrated Framework A," "Extended Protocol," "Pilot Programme," and "Baseline Standard D." Each strategy has a status indicating its current phase: Planning, Implementation, Evaluation, or Completed. Target completion dates provide temporal anchors, and the `scope` column describes the operational domain the strategy addresses, ranging from Internal Operations to Member Education, Policy Advocacy, and Organizational Practices. Strategies are owned by an ESG advisor and overseen by an executive leader, mirroring the accountability structure of reports.

The strategies_metrics table links strategies to the metrics they are designed to influence, enabling organizations to trace the causal chain from strategic intent to measurable outcome. Strategies also connect to reports through strategies_reports, ensuring that strategic progress is reflected in formal disclosures.

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

## The Relational Fabric: Joined Perspectives

The true power of the ESG data model emerges when its tables are joined into coherent views. Each view answers a specific analytical question by combining records from multiple tables.

The view `vw_e_s_g_metric_e_s_g_report` joins metrics to the reports that contain them, answering the question: which metrics appear in which reports? A row linking metric `3744010` (Primary Programme A) to report `1202-0008-S` (Composite Protocol) tells us that this Environmental metric is part of the Composite Protocol disclosure.

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

Conversely, `vw_e_s_g_metric_e_s_g_advisor` connects metrics to the advisors responsible for them, answering: who owns which metrics? A row pairing metric `136630a8-8fcc-11eb-924d-9cd76263cbd0` (Composite Standard) with advisor `101` (Tasha Rodriguez) indicates that Rodriguez manages this Social metric.

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

The view `vw_e_s_g_report_e_s_g_metric_detail` enriches report records with the metrics they contain, providing a detailed breakdown of each report's composition. Reading a row that pairs report `8189500` (Compact Programme A) with metric `2986226` (Compact Framework) reveals that this Governance metric is a component of the Compact Programme A report.

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

`vw_e_s_g_report_e_s_g_advisor` joins reports to their overseeing advisors, answering: which advisor is responsible for which report? A row linking report `L355` (Legacy Standard) to advisor `102` (Theodore Mcgrath) shows that Mcgrath is the advisor for this report.

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

The view `vw_e_s_g_report_executive_leader` connects reports to the executive leaders who oversee them, answering: which leader is accountable for which report? A row pairing report `1202-0008-S` (Composite Protocol) with executive leader `1` (Norma Fisher) indicates that Fisher holds oversight of this report.

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

`vw_e_s_g_advisor_executive_leader` joins advisors to their supervising executive leaders, answering: which leader supervises which advisor? A row linking advisor `100` (Norma Fisher) to executive leader `1` (Norma Fisher) shows a self-referential supervisory relationship, where the advisor and leader share the same employee identity.

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

The view `vw_e_s_g_advisor_e_s_g_metric_detail` provides a detailed perspective of advisors alongside the metrics they manage. A row pairing advisor `103` (Peter Mcdowell) with metric `2002007020010` (Legacy Protocol D) reveals that Mcdowell is responsible for this Environmental metric.

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

`vw_e_s_g_advisor_e_s_g_report_detail` joins advisors to the reports they author, providing a detailed view of each advisor's reporting portfolio. A row linking advisor `101` (Tasha Rodriguez) to report `8189500` (Compact Programme A) shows that Rodriguez authored this report.

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

The view `vw_e_s_g_advisor_e_s_g_standard_detail` connects advisors to the standards they interpret or apply. A row pairing advisor `102` (Theodore Mcgrath) with standard `338526` (TCFD) indicates that Mcgrath is authorized to apply the TCFD framework.

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

`vw_executive_leader_e_s_g_advisor_detail` provides a detailed view of executive leaders alongside the advisors they supervise. A row linking executive leader `2` (Tasha Rodriguez) to advisor `101` (Tasha Rodriguez) shows that Rodriguez supervises herself in an advisory capacity.

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

The view `vw_executive_leader_e_s_g_report_detail` connects executive leaders to the reports they oversee, providing a detailed view of each leader's reporting accountability. A row pairing executive leader `3` (Theodore Mcgrath) with report `L355` (Legacy Standard) shows that Mcgrath oversees this report.

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

`vw_executive_leader_e_s_g_strategy_detail` joins executive leaders to the strategies they oversee, answering: which leader is accountable for which strategy? A row linking executive leader `4` (Peter Mcdowell) to strategy `25893422` (Baseline Standard D) indicates that Mcdowell oversees this Completed strategy.

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

The view `vw_e_s_g_strategy_e_s_g_metric_detail` connects strategies to the metrics they are designed to influence, providing a detailed view of each strategy's metric targets. A row pairing strategy `392481` (Integrated Framework A) with metric `3744010` (Primary Programme A) reveals that this strategy targets the Primary Programme A metric.

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

`vw_e_s_g_strategy_e_s_g_advisor` joins strategies to the advisors who own them, answering: which advisor is responsible for which strategy? A row linking strategy `24897677` (Extended Protocol) to advisor `101` (Tasha Rodriguez) shows that Rodriguez owns this strategy.

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

The view `vw_e_s_g_strategy_executive_leader` connects strategies to the executive leaders who oversee them, answering: which leader is accountable for which strategy? A row pairing strategy `9736901` (Pilot Programme) with executive leader `3` (Theodore Mcgrath) indicates that Mcgrath oversees this strategy.

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

`vw_e_s_g_strategy_e_s_g_report_detail` joins strategies to the reports that document their progress, providing a detailed view of how strategic initiatives are reflected in formal disclosures. A row linking strategy `25893422` (Baseline Standard D) to report `5844272` (Regional Framework) shows that this Completed strategy is documented in the Regional Framework report.

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

The view `vw_e_s_g_standard_e_s_g_metric_detail` connects standards to the metrics they govern, providing a detailed view of each standard's metric coverage. A row pairing standard `7119764` (SASB) with metric `3744010` (Primary Programme A) reveals that this Environmental metric is governed by the SASB framework.

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

`vw_e_s_g_standard_e_s_g_advisor_detail` joins standards to the advisors who interpret them, providing a detailed view of each advisor's standard authorizations. A row linking standard `9125617` (GRI) to advisor `101` (Tasha Rodriguez) shows that Rodriguez is authorized to apply the GRI framework.

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

Finally, `vw_e_s_g_standard_e_s_g_report_detail` connects standards to the reports that are structured around them, answering: which reports are governed by which standards? A row pairing standard `338526` (TCFD) with report `L355` (Legacy Standard) indicates that this report is structured around the TCFD framework.

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

## Synthesis

The ESG governance model described here is a system of interlocking records that transform raw performance data into accountable, auditable, and actionable disclosures. Metrics define what is measured; standards define how it is measured; reports aggregate and communicate the results; advisors manage the work; leaders provide oversight; and strategies set the direction for improvement. The join tables and views bind these elements into a coherent whole, enabling practitioners to trace any metric back to its governing standard, any report to its contributing metrics and overseeing leader, and any strategy to its target metrics and responsible advisor. In practice, this structure supports everything from regulatory compliance audits to strategic planning cycles, ensuring that ESG governance is both rigorous and adaptable.

## Data appendix

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
