## Ontology-Grounded Relational Modelling in Financial Services

The domain under examination is a financial services organisation that coordinates investment research, client account management, and sales campaign execution across a hierarchy of executives, account managers, and diverse client segments. The relational schema materialises this ontology through six core entity tables, three junction tables that resolve many-to-many associations, and twelve materialised views that reconstruct domain facts from the normalised base. Each table encodes a distinct concept from the business ontology; each column is a typed attribute; and each foreign key is a referential constraint that preserves the cardinality-bounded relationships between entities. The views, in turn, serve as denormalised lenses that answer specific analytical questions by joining the appropriate tables.

### Base Entity Tables

The research domain centres on the `research_reports` table, which stores each published investment recommendation as a row. The primary key `id` is a surrogate integer, while the business identifier `report_id` carries human-readable codes such as `1202-0008-S`, `8189500`, `L355`, and `5844272`. The `publish_date` column records the timestamp of publication, the `ticker_symbol` column holds symbolic identifiers like `composite-ticker-63` and `adaptive-ticker-65`, and the `recommendation` column encodes the analyst's stance as `BUY`, `SELL`, or `HOLD`. The `performance_vs_index` column stores a numeric measure of outperformance (values range from `4.20` to `10.80` in the sample), and the boolean `is_bold_call` flag marks particularly assertive recommendations. The table also carries a `client_account_id` foreign key that links each report to the `client_accounts` table, establishing a one-to-many relationship: a single client account may receive multiple research reports over time.

**Table `research_reports`**

| id | report_id | publish_date | ticker_symbol | recommendation | performance_vs_index | is_bold_call | client_account_id |
|---|---|---|---|---|---|---|---|
| 1 | 1202-0008-S | 2023-06-06T17:03:00 | composite-ticker-63 | BUY | 4.20 | false | 1000 |
| 2 | 8189500 | 2024-11-17T00:20:00 | primary-ticker-64 | SELL | 6.40 | true | 1001 |
| 3 | L355 | 2025-04-01T07:37:00 | adaptive-ticker-65 | HOLD | 8.60 | false | 1002 |
| 4 | 5844272 | 2022-09-12T14:54:00 | distributed-ticker-66 | BUY | 10.80 | true | 1003 |

The `client_accounts` table captures the client portfolio. Its surrogate primary key `id` is an integer, while the business identifier `account_id` uses either UUIDs such as `fbc33b0c-9bac-11eb-a8a2-19ed5c03f8d3` or numeric codes like `10207152`. The `client_type` column distinguishes segments — `Family Office`, `Institutional Investor`, `Retail Client`, and `Hedge Fund` — and the `region` column assigns a geographic or operational zone (e.g., `distributed-region-12`, `baseline-region-13`). The `account_status` column tracks lifecycle state with values `Active`, `Prospect`, and `Churned`. Revenue is quantified in the `revenue_generated` column (sample values: `13.49`, `19.97`, `21.11`). Two foreign keys anchor this table: `account_manager_id` references `account_managers`, and `research_report_id` references `research_reports`, thereby embedding both the management and research relationships directly into the client entity.

**Table `client_accounts`**

| id | account_id | client_type | region | account_status | revenue_generated | account_manager_id | research_report_id |
|---|---|---|---|---|---|---|---|
| 1000 | fbc33b0c-9bac-11eb-a8a2-19ed5c03f8d3 | Family Office | distributed-region-12 | Active | 13.49 | 100 | 1 |
| 1001 | 10207152 | Institutional Investor | baseline-region-13 | Prospect | 19.97 | 101 | 2 |
| 1002 | a4afb8ee-9bad-11eb-a8a2-19ed5c03f8d3 | Retail Client | pilot-region-14 | Churned | 13.49 | 102 | 3 |
| 1003 | 3717632 | Hedge Fund | extended-region-15 | Active | 21.11 | 103 | 4 |

The `account_managers` table represents the frontline sales and relationship staff. The surrogate `id` is an integer, while the business identifier `manager_id` uses mixed formats — UUIDs like `f208f470-8fcd-11eb-924d-9cd76263cbd0` and short codes such as `659` and `10449531`. The `employee_name` column stores names including `Cole Vasquez`, `Susan Levy`, `Tasha Rodriguez`, and `Sarah Villanueva`. Performance targets are captured in `sales_target` (values from `11.20` to `17.80`), engagement intensity in `crm_usage_level` (`High`, `Medium`, `Low`), and regulatory standing in the boolean `compliance_status`. A foreign key `executive_id` links each manager to the `executives` table, encoding the supervisory chain.

**Table `account_managers`**

| id | manager_id | employee_name | sales_target | crm_usage_level | compliance_status | executive_id |
|---|---|---|---|---|---|---|
| 100 | id_23 | Cole Vasquez | 11.20 | High | false | 1 |
| 101 | 10449531 | Susan Levy | 13.40 | Medium | true | 2 |
| 102 | 659 | Tasha Rodriguez | 15.60 | Low | false | 3 |
| 103 | f208f470-8fcd-11eb-924d-9cd76263cbd0 | Sarah Villanueva | 17.80 | High | true | 4 |

Sales activities are modelled in the `sales_campaigns` table. The surrogate `id` is an integer, while the business identifier `campaign_id` uses long numeric strings such as `7021001070100` and `1437599`. The `campaign_type` column categorises activities as `Analyst Seminar`, `Training Webinar`, `Promotional Event`, or `Email Blast`. Engagement quality is measured by `open_rate` (sample values: `11.70` through `19.80`), and temporal scope is captured by `start_date` and `end_date` columns. Two foreign keys — `client_account_id` pointing to `client_accounts` and `account_manager_id` pointing to `account_managers` — bind each campaign to its target client and its responsible manager, forming a composite association that reflects the operational reality of campaign execution.

**Table `sales_campaigns`**

| id | campaign_id | campaign_type | open_rate | start_date | end_date | client_account_id | account_manager_id |
|---|---|---|---|---|---|---|---|
| 100 | 7021001070100 | Analyst Seminar | 11.70 | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | 1000 | 100 |
| 101 | 1437599 | Training Webinar | 14.40 | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | 1001 | 101 |
| 102 | 2106708 | Promotional Event | 17.10 | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | 1002 | 102 |
| 103 | 4985162 | Email Blast | 19.80 | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | 1003 | 103 |

The `executives` table sits at the apex of the organisational hierarchy. The surrogate `id` is an integer, while the business identifier `executive_id` uses UUIDs and numeric codes. The `executive_name` column holds names such as `Adaptive Framework`, `Primary Protocol`, `Composite Programme D`, and `Compact Standard`. The `title` column encodes seniority levels — `Chief Executive Officer` and `Head of Research` — and the `decision_authority` column distinguishes between `Strategic`, `Operational`, and `Compliance` decision domains. The `report_id` foreign key references `research_reports`, linking each executive to a research report under their purview.

**Table `executives`**

| id | executive_id | executive_name | title | decision_authority | report_id |
|---|---|---|---|---|---|
| 1 | 9424942 | Adaptive Framework | Chief Executive Officer | Strategic | 1202-0008-S |
| 2 | 1250213 | Primary Protocol | Head of Research | Operational | 8189500 |
| 3 | 1996941 | Composite Programme D | Chief Executive Officer | Compliance | L355 |
| 4 | bd2a0f9d-ff94-4412-832f-f289a7a8ef40 | Compact Standard | Head of Research | Strategic | 5844272 |

The `sales_reports` table captures structured feedback and strategic observations. Its primary key is the `report_id` column, which shares values with the `research_reports.report_id` column (e.g., `1202-0008-S`, `8189500`, `L355`, `5844272`), establishing a natural key alignment across the two tables. The `submission_date` column records when the report was filed, `observation_type` categorises the nature of the observation (`Client Feedback`, `Strategic Recommendation`, `Service Issue`), and `priority_level` assigns a numeric urgency score (values from `22` to `31`). The boolean `is_actionable` flag indicates whether the report warrants follow-up. The `account_manager_id` and `executive_id` foreign keys link each sales report to its originating manager and its supervising executive, respectively. Audit timestamps are maintained in `created_at` and `updated_at` columns.

**Table `sales_reports`**

| report_id | submission_date | observation_type | priority_level | is_actionable | account_manager_id | executive_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|
| 1202-0008-S | 2025-04-24T03:57:00 | Client Feedback | 22 | false | 100 | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 8189500 | 2022-09-08T10:14:00 | Strategic Recommendation | 25 | true | 101 | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| L355 | 2023-02-19T17:31:00 | Service Issue | 28 | false | 102 | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 5844272 | 2024-07-03T00:48:00 | Client Feedback | 31 | true | 103 | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

### Junction Tables for Many-to-Many Relationships

Three junction tables resolve many-to-many associations that cannot be expressed through simple foreign keys. The `managers_accounts` table maps account managers to the client accounts they oversee, enabling a manager to be associated with multiple accounts and an account to be managed by multiple managers over time. The `managers_campaigns` table similarly decouples the manager-campaign relationship, allowing campaigns to be assigned to multiple managers and managers to run multiple campaigns. The `executives_managers` table resolves the executive-manager hierarchy, supporting scenarios where an executive supervises multiple managers and a manager may report to multiple executives. These junction tables each contain at least two foreign key columns referencing the participating entity tables, and their composite primary keys enforce the uniqueness of each association.

**Table `managers_accounts`**

| account_manager_id | client_account_id |
|---|---|
| 100 | 1000 |
| 100 | 1001 |
| 101 | 1001 |
| 101 | 1002 |
| 102 | 1002 |
| 102 | 1003 |
| 103 | 1003 |
| 103 | 1000 |

**Table `managers_campaigns`**

| account_manager_id | sales_campaign_id |
|---|---|
| 100 | 100 |
| 100 | 101 |
| 101 | 101 |
| 101 | 102 |
| 102 | 102 |
| 102 | 103 |
| 103 | 103 |
| 103 | 100 |

**Table `executives_managers`**

| executive_id | account_manager_id |
|---|---|
| 1 | 100 |
| 1 | 101 |
| 2 | 101 |
| 2 | 102 |
| 3 | 102 |
| 3 | 103 |
| 4 | 103 |
| 4 | 100 |

### Materialised Views as Analytical Lenses

The twelve views in the schema serve as pre-joined projections that answer specific analytical questions by reconstructing domain facts from the normalised base tables. Each view is a stored query that joins the relevant tables on their foreign key relationships, producing a denormalised result set that is directly consumable by reporting tools and dashboards.

The view `v_research_report_client_account` joins `research_reports` to `client_accounts` on the `client_account_id` foreign key, answering the question: "Which research reports have been delivered to which client accounts?" A sample row reveals that report `1202-0008-S` with a `BUY` recommendation for `composite-ticker-63` was delivered to the `Family Office` account `fbc33b0c-9bac-11eb-a8a2-19ed5c03f8d3` in `distributed-region-12`.

**View `v_research_report_client_account`**

```sql
CREATE VIEW v_research_report_client_account AS
SELECT a.id, a.report_id, a.publish_date, a.ticker_symbol, b.id AS account_id, b.account_id AS account_account_id, b.client_type AS account_client_type
FROM research_reports a JOIN client_accounts b ON a.client_account_id = b.id;
```

| id | report_id | publish_date | ticker_symbol | account_id | account_account_id | account_client_type |
|---|---|---|---|---|---|---|
| 1 | 1202-0008-S | 2023-06-06T17:03:00 | composite-ticker-63 | 1000 | fbc33b0c-9bac-11eb-a8a2-19ed5c03f8d3 | Family Office |
| 2 | 8189500 | 2024-11-17T00:20:00 | primary-ticker-64 | 1001 | 10207152 | Institutional Investor |
| 3 | L355 | 2025-04-01T07:37:00 | adaptive-ticker-65 | 1002 | a4afb8ee-9bad-11eb-a8a2-19ed5c03f8d3 | Retail Client |
| 4 | 5844272 | 2022-09-12T14:54:00 | distributed-ticker-66 | 1003 | 3717632 | Hedge Fund |

The view `v_client_account_account_manager` joins `client_accounts` to `account_managers` on `account_manager_id`, answering: "Which account manager is responsible for which client account?" The row for account `10207152` (an `Institutional Investor` in `Prospect` status) shows it is managed by `Susan Levy` with a `Medium` CRM usage level and `true` compliance status.

**View `v_client_account_account_manager`**

```sql
CREATE VIEW v_client_account_account_manager AS
SELECT a.id, a.account_id, a.client_type, a.region, b.id AS manager_id, b.manager_id AS manager_manager_id, b.employee_name AS manager_employee_name
FROM client_accounts a JOIN account_managers b ON a.account_manager_id = b.id;
```

| id | account_id | client_type | region | manager_id | manager_manager_id | manager_employee_name |
|---|---|---|---|---|---|---|
| 1000 | fbc33b0c-9bac-11eb-a8a2-19ed5c03f8d3 | Family Office | distributed-region-12 | 100 | id_23 | Cole Vasquez |
| 1001 | 10207152 | Institutional Investor | baseline-region-13 | 101 | 10449531 | Susan Levy |
| 1002 | a4afb8ee-9bad-11eb-a8a2-19ed5c03f8d3 | Retail Client | pilot-region-14 | 102 | 659 | Tasha Rodriguez |
| 1003 | 3717632 | Hedge Fund | extended-region-15 | 103 | f208f470-8fcd-11eb-924d-9cd76263cbd0 | Sarah Villanueva |

The view `v_client_account_research_report` joins `client_accounts` to `research_reports` on `research_report_id`, answering: "Which research reports are associated with which client accounts?" The row for the `Retail Client` account `a4afb8ee-9bad-11eb-a8a2-19ed5c03f8d3` (status `Churned`) is linked to report `L355` with a `HOLD` recommendation and `8.60` performance versus index.

**View `v_client_account_research_report`**

```sql
CREATE VIEW v_client_account_research_report AS
SELECT a.id, a.account_id, a.client_type, a.region, b.id AS report_id, b.report_id AS report_report_id, b.publish_date AS report_publish_date
FROM client_accounts a JOIN research_reports b ON a.research_report_id = b.id;
```

| id | account_id | client_type | region | report_id | report_report_id | report_publish_date |
|---|---|---|---|---|---|---|
| 1000 | fbc33b0c-9bac-11eb-a8a2-19ed5c03f8d3 | Family Office | distributed-region-12 | 1 | 1202-0008-S | 2023-06-06T17:03:00 |
| 1001 | 10207152 | Institutional Investor | baseline-region-13 | 2 | 8189500 | 2024-11-17T00:20:00 |
| 1002 | a4afb8ee-9bad-11eb-a8a2-19ed5c03f8d3 | Retail Client | pilot-region-14 | 3 | L355 | 2025-04-01T07:37:00 |
| 1003 | 3717632 | Hedge Fund | extended-region-15 | 4 | 5844272 | 2022-09-12T14:54:00 |

The view `v_account_manager_client_account_detail` joins `account_managers` to `client_accounts`, answering: "What is the full detail of each account under a given manager?" For manager `Cole Vasquez` (`id_23`) with a `High` CRM usage level and `false` compliance status, the view surfaces the `Family Office` account `fbc33b0c-9bac-11eb-a8a2-19ed5c03f8d3` generating `13.49` in revenue.

**View `v_account_manager_client_account_detail`**

```sql
CREATE VIEW v_account_manager_client_account_detail AS
SELECT a.id, a.manager_id, a.employee_name, b.id AS account_id, b.account_id AS account_account_id, b.client_type AS account_client_type
FROM account_managers a
  JOIN managers_accounts j ON j.account_manager_id = a.id
  JOIN client_accounts b ON b.id = j.client_account_id;
```

| id | manager_id | employee_name | account_id | account_account_id | account_client_type |
|---|---|---|---|---|---|
| 100 | id_23 | Cole Vasquez | 1000 | fbc33b0c-9bac-11eb-a8a2-19ed5c03f8d3 | Family Office |
| 100 | id_23 | Cole Vasquez | 1001 | 10207152 | Institutional Investor |
| 101 | 10449531 | Susan Levy | 1001 | 10207152 | Institutional Investor |
| 101 | 10449531 | Susan Levy | 1002 | a4afb8ee-9bad-11eb-a8a2-19ed5c03f8d3 | Retail Client |
| 102 | 659 | Tasha Rodriguez | 1002 | a4afb8ee-9bad-11eb-a8a2-19ed5c03f8d3 | Retail Client |
| 102 | 659 | Tasha Rodriguez | 1003 | 3717632 | Hedge Fund |
| 103 | f208f470-8fcd-11eb-924d-9cd76263cbd0 | Sarah Villanueva | 1003 | 3717632 | Hedge Fund |
| 103 | f208f470-8fcd-11eb-924d-9cd76263cbd0 | Sarah Villanueva | 1000 | fbc33b0c-9bac-11eb-a8a2-19ed5c03f8d3 | Family Office |

The view `v_account_manager_executive` joins `account_managers` to `executives` on `executive_id`, answering: "Which executive supervises which account manager?" Manager `Susan Levy` (sales target `13.40`) is supervised by `Primary Protocol` (`Head of Research`, `Operational` decision authority).

**View `v_account_manager_executive`**

```sql
CREATE VIEW v_account_manager_executive AS
SELECT a.id, a.manager_id, a.employee_name, a.sales_target, b.id AS executive_id, b.executive_id AS executive_executive_id, b.executive_name AS executive_executive_name
FROM account_managers a JOIN executives b ON a.executive_id = b.id;
```

| id | manager_id | employee_name | sales_target | executive_id | executive_executive_id | executive_executive_name |
|---|---|---|---|---|---|---|
| 100 | id_23 | Cole Vasquez | 11.20 | 1 | 9424942 | Adaptive Framework |
| 101 | 10449531 | Susan Levy | 13.40 | 2 | 1250213 | Primary Protocol |
| 102 | 659 | Tasha Rodriguez | 15.60 | 3 | 1996941 | Composite Programme D |
| 103 | f208f470-8fcd-11eb-924d-9cd76263cbd0 | Sarah Villanueva | 17.80 | 4 | bd2a0f9d-ff94-4412-832f-f289a7a8ef40 | Compact Standard |

The view `v_account_manager_sales_campaign_detail` joins `account_managers` to `sales_campaigns` on `account_manager_id`, answering: "Which sales campaigns has each manager executed?" Manager `Tasha Rodriguez` (sales target `15.60`, `Low` CRM usage) ran the `Promotional Event` campaign `2106708` with an `open_rate` of `17.10` targeting client account `1002`.

**View `v_account_manager_sales_campaign_detail`**

```sql
CREATE VIEW v_account_manager_sales_campaign_detail AS
SELECT a.id, a.manager_id, a.employee_name, b.id AS campaign_id, b.campaign_id AS campaign_campaign_id, b.campaign_type AS campaign_campaign_type
FROM account_managers a
  JOIN managers_campaigns j ON j.account_manager_id = a.id
  JOIN sales_campaigns b ON b.id = j.sales_campaign_id;
```

| id | manager_id | employee_name | campaign_id | campaign_campaign_id | campaign_campaign_type |
|---|---|---|---|---|---|
| 100 | id_23 | Cole Vasquez | 100 | 7021001070100 | Analyst Seminar |
| 100 | id_23 | Cole Vasquez | 101 | 1437599 | Training Webinar |
| 101 | 10449531 | Susan Levy | 101 | 1437599 | Training Webinar |
| 101 | 10449531 | Susan Levy | 102 | 2106708 | Promotional Event |
| 102 | 659 | Tasha Rodriguez | 102 | 2106708 | Promotional Event |
| 102 | 659 | Tasha Rodriguez | 103 | 4985162 | Email Blast |
| 103 | f208f470-8fcd-11eb-924d-9cd76263cbd0 | Sarah Villanueva | 103 | 4985162 | Email Blast |
| 103 | f208f470-8fcd-11eb-924d-9cd76263cbd0 | Sarah Villanueva | 100 | 7021001070100 | Analyst Seminar |

The view `v_sales_campaign_client_account` joins `sales_campaigns` to `client_accounts` on `client_account_id`, answering: "Which client accounts are targeted by which sales campaigns?" The `Analyst Seminar` campaign `7021001070100` with `11.70` open rate targets the `Family Office` account `fbc33b0c-9bac-11eb-a8a2-19ed5c03f8d3` in `distributed-region-12`.

**View `v_sales_campaign_client_account`**

```sql
CREATE VIEW v_sales_campaign_client_account AS
SELECT a.id, a.campaign_id, a.campaign_type, a.open_rate, b.id AS account_id, b.account_id AS account_account_id, b.client_type AS account_client_type
FROM sales_campaigns a JOIN client_accounts b ON a.client_account_id = b.id;
```

| id | campaign_id | campaign_type | open_rate | account_id | account_account_id | account_client_type |
|---|---|---|---|---|---|---|
| 100 | 7021001070100 | Analyst Seminar | 11.70 | 1000 | fbc33b0c-9bac-11eb-a8a2-19ed5c03f8d3 | Family Office |
| 101 | 1437599 | Training Webinar | 14.40 | 1001 | 10207152 | Institutional Investor |
| 102 | 2106708 | Promotional Event | 17.10 | 1002 | a4afb8ee-9bad-11eb-a8a2-19ed5c03f8d3 | Retail Client |
| 103 | 4985162 | Email Blast | 19.80 | 1003 | 3717632 | Hedge Fund |

The view `v_sales_campaign_account_manager` joins `sales_campaigns` to `account_managers` on `account_manager_id`, answering: "Which account manager is responsible for which sales campaign?" The `Training Webinar` campaign `1437599` with `14.40` open rate is managed by `Susan Levy` with a `Medium` CRM usage level.

**View `v_sales_campaign_account_manager`**

```sql
CREATE VIEW v_sales_campaign_account_manager AS
SELECT a.id, a.campaign_id, a.campaign_type, a.open_rate, b.id AS manager_id, b.manager_id AS manager_manager_id, b.employee_name AS manager_employee_name
FROM sales_campaigns a JOIN account_managers b ON a.account_manager_id = b.id;
```

| id | campaign_id | campaign_type | open_rate | manager_id | manager_manager_id | manager_employee_name |
|---|---|---|---|---|---|---|
| 100 | 7021001070100 | Analyst Seminar | 11.70 | 100 | id_23 | Cole Vasquez |
| 101 | 1437599 | Training Webinar | 14.40 | 101 | 10449531 | Susan Levy |
| 102 | 2106708 | Promotional Event | 17.10 | 102 | 659 | Tasha Rodriguez |
| 103 | 4985162 | Email Blast | 19.80 | 103 | f208f470-8fcd-11eb-924d-9cd76263cbd0 | Sarah Villanueva |

The view `v_executive_account_manager_detail` joins `executives` to `account_managers` on `executive_id`, answering: "Which account managers fall under which executive's supervision?" Executive `Composite Programme D` (`Chief Executive Officer`, `Compliance` authority) supervises `Tasha Rodriguez` (sales target `15.60`, `Low` CRM usage, `false` compliance status).

**View `v_executive_account_manager_detail`**

```sql
CREATE VIEW v_executive_account_manager_detail AS
SELECT a.id, a.executive_id, a.executive_name, b.id AS manager_id, b.manager_id AS manager_manager_id, b.employee_name AS manager_employee_name
FROM executives a
  JOIN executives_managers j ON j.executive_id = a.id
  JOIN account_managers b ON b.id = j.account_manager_id;
```

| id | executive_id | executive_name | manager_id | manager_manager_id | manager_employee_name |
|---|---|---|---|---|---|
| 1 | 9424942 | Adaptive Framework | 100 | id_23 | Cole Vasquez |
| 1 | 9424942 | Adaptive Framework | 101 | 10449531 | Susan Levy |
| 2 | 1250213 | Primary Protocol | 101 | 10449531 | Susan Levy |
| 2 | 1250213 | Primary Protocol | 102 | 659 | Tasha Rodriguez |
| 3 | 1996941 | Composite Programme D | 102 | 659 | Tasha Rodriguez |
| 3 | 1996941 | Composite Programme D | 103 | f208f470-8fcd-11eb-924d-9cd76263cbd0 | Sarah Villanueva |
| 4 | bd2a0f9d-ff94-4412-832f-f289a7a8ef40 | Compact Standard | 103 | f208f470-8fcd-11eb-924d-9cd76263cbd0 | Sarah Villanueva |
| 4 | bd2a0f9d-ff94-4412-832f-f289a7a8ef40 | Compact Standard | 100 | id_23 | Cole Vasquez |

The view `v_executive_sales_report` joins `executives` to `sales_reports` on `executive_id`, answering: "Which sales reports have been filed under which executive's oversight?" Executive `Primary Protocol` (`Head of Research`, `Operational` authority) oversees the sales report `8189500` of type `Strategic Recommendation` with `priority_level` `25` and `is_actionable` set to `true`.

**View `v_executive_sales_report`**

```sql
CREATE VIEW v_executive_sales_report AS
SELECT a.id, a.executive_id, a.executive_name, a.title, b.report_id AS report_report_id, b.submission_date AS report_submission_date, b.observation_type AS report_observation_type
FROM executives a JOIN sales_reports b ON a.report_id = b.report_id;
```

| id | executive_id | executive_name | title | report_report_id | report_submission_date | report_observation_type |
|---|---|---|---|---|---|---|
| 1 | 9424942 | Adaptive Framework | Chief Executive Officer | 1202-0008-S | 2025-04-24T03:57:00 | Client Feedback |
| 2 | 1250213 | Primary Protocol | Head of Research | 8189500 | 2022-09-08T10:14:00 | Strategic Recommendation |
| 3 | 1996941 | Composite Programme D | Chief Executive Officer | L355 | 2023-02-19T17:31:00 | Service Issue |
| 4 | bd2a0f9d-ff94-4412-832f-f289a7a8ef40 | Compact Standard | Head of Research | 5844272 | 2024-07-03T00:48:00 | Client Feedback |

The view `v_sales_report_account_manager` joins `sales_reports` to `account_managers` on `account_manager_id`, answering: "Which account manager filed which sales report?" Manager `Cole Vasquez` (`id_23`) filed the sales report `1202-0008-S` of type `Client Feedback` with `priority_level` `22` and `is_actionable` set to `false`.

**View `v_sales_report_account_manager`**

```sql
CREATE VIEW v_sales_report_account_manager AS
SELECT a.report_id, a.submission_date, a.observation_type, a.priority_level, b.id AS manager_id, b.manager_id AS manager_manager_id, b.employee_name AS manager_employee_name
FROM sales_reports a JOIN account_managers b ON a.account_manager_id = b.id;
```

| report_id | submission_date | observation_type | priority_level | manager_id | manager_manager_id | manager_employee_name |
|---|---|---|---|---|---|---|
| 1202-0008-S | 2025-04-24T03:57:00 | Client Feedback | 22 | 100 | id_23 | Cole Vasquez |
| 8189500 | 2022-09-08T10:14:00 | Strategic Recommendation | 25 | 101 | 10449531 | Susan Levy |
| L355 | 2023-02-19T17:31:00 | Service Issue | 28 | 102 | 659 | Tasha Rodriguez |
| 5844272 | 2024-07-03T00:48:00 | Client Feedback | 31 | 103 | f208f470-8fcd-11eb-924d-9cd76263cbd0 | Sarah Villanueva |

The view `v_sales_report_executive` joins `sales_reports` to `executives` on `executive_id`, answering: "Which executive is associated with which sales report?" The sales report `5844272` of type `Client Feedback` with `priority_level` `31` and `is_actionable` set to `true` is overseen by executive `Compact Standard` (`Head of Research`, `Strategic` authority).

**View `v_sales_report_executive`**

```sql
CREATE VIEW v_sales_report_executive AS
SELECT a.report_id, a.submission_date, a.observation_type, a.priority_level, b.id AS executive_id, b.executive_id AS executive_executive_id, b.executive_name AS executive_executive_name
FROM sales_reports a JOIN executives b ON a.executive_id = b.id;
```

| report_id | submission_date | observation_type | priority_level | executive_id | executive_executive_id | executive_executive_name |
|---|---|---|---|---|---|---|
| 1202-0008-S | 2025-04-24T03:57:00 | Client Feedback | 22 | 1 | 9424942 | Adaptive Framework |
| 8189500 | 2022-09-08T10:14:00 | Strategic Recommendation | 25 | 2 | 1250213 | Primary Protocol |
| L355 | 2023-02-19T17:31:00 | Service Issue | 28 | 3 | 1996941 | Composite Programme D |
| 5844272 | 2024-07-03T00:48:00 | Client Feedback | 31 | 4 | bd2a0f9d-ff94-4412-832f-f289a7a8ef40 | Compact Standard |

### Synthesis

The relational schema presented here demonstrates a disciplined application of normalisation principles to a financial services domain. Six base tables encode the core entities — research reports, client accounts, account managers, sales campaigns, executives, and sales reports — each with a surrogate primary key, a natural business identifier, typed attributes, and foreign keys that preserve referential integrity. Three junction tables resolve many-to-many relationships that arise naturally in the domain: managers overseeing multiple accounts and campaigns, and executives supervising multiple managers. The twelve materialised views serve as denormalised projections that answer specific analytical questions by joining the appropriate tables, effectively materialising the ontology's relationships into queryable result sets. The sample data — with its mix of UUIDs, numeric codes, and human-readable identifiers — illustrates the schema's flexibility in accommodating diverse identifier formats across entity types. Together, the tables and views form a coherent, queryable representation of the financial services domain that balances normalisation for data integrity with denormalisation for analytical accessibility.