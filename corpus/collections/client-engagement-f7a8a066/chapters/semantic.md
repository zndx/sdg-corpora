## The Client Engagement Domain

The client engagement domain captures the lifecycle of accounting and financial services engagements, from initial onboarding through compliance delivery and financial forecasting. At its core, a single engagement ties together a client, a financial controller, management accounts, compliance tasks, financial forecasts, and junior accountants. The relational schema models this as six base tables with carefully chosen foreign-key links that enforce referential integrity while allowing each view to reconstruct a complete business fact by joining the relevant tables. The design follows a hub-and-spoke pattern: `clie_client_engagements` serves as the central hub, with each of the five supporting tables linked back through `engagement_id`, while cross-links between controllers, accounts, and tasks create a tightly coupled network that mirrors the real-world dependencies of an accounting practice.

**Table `clie_client_engagements`**

| engagement_id | client_name | industry_sector | start_date | end_date | status | financial_controller_id | account_id | compliance_task_id |
|---|---|---|---|---|---|---|---|---|
| 3717629 | Mercy Helpline | Technology | 2022-09-05 | 2022-09-01 | Active | 1 | fbc33b0c-9bac-11eb-a8a2-19ed5c03f8d3 | 1 |
| 1562852 | Tasha Rodriguez | Manufacturing | 2023-02-16 | 2023-02-12 | Onboarding | 2 | 10207152 | 2 |
| 9246331 | Glen Taylor | Services | 2024-07-27 | 2024-07-23 | Review | 3 | a4afb8ee-9bad-11eb-a8a2-19ed5c03f8d3 | 3 |
| 32827 | Nicole Andrews | Retail | 2025-12-11 | 2025-12-07 | Closed | 4 | 3717632 | 4 |

The `clie_client_engagements` table anchors the entire schema. Each row represents a discrete engagement identified by `engagement_id`, a numeric surrogate key. The `client_name` column stores the name of the client or organization served — in the data, we see entries such as "Mercy Helpline" in the Technology sector and "Nicole Andrews" in Retail. The `industry_sector` column classifies the engagement by sector (Technology, Manufacturing, Services, Retail), while `start_date` and `end_date` record the temporal bounds of the engagement. The `status` column tracks the current phase of the engagement, with values like "Active", "Onboarding", "Review", and "Closed". Critically, three foreign-key columns — `financial_controller_id`, `account_id`, and `compliance_task_id` — link the engagement to its supporting entities. For engagement 3717629 (Mercy Helpline), the financial controller is 1, the management account is `fbc33b0c-9bac-11eb-a8a2-19ed5c03f8d3`, and the compliance task is 1. This triple-link means that every engagement row already carries the identifiers needed to reconstruct the full picture of who is responsible, what accounts exist, and what compliance work is required.

**Table `clie_financial_controllers`**

| financial_controller_id | controller_id | full_name | qualification_status | employment_type | days_per_week | base_location | has_driver_license | engagement_id | junior_accountant_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 7441148 | Theodore Mcgrath | Fully Qualified | Full-time | 28 | London | true | 3717629 | 1000 |
| 2 | 21248390 | Account Name | ACA | Part-time | 36 | Egham | false | 1562852 | 1001 |
| 3 | 727063 | Saipan International Airport | ACCA | Full-time | 44 | Remote | true | 9246331 | 1002 |
| 4 | lu_tax_code_template_m13 | Norma Fisher | CIMA | Part-time | 52 | London | false | 32827 | 1003 |

The `clie_financial_controllers` table stores the personnel responsible for overseeing engagements. Each controller is identified by `financial_controller_id`, which doubles as a foreign key into `clie_client_engagements`. The `controller_id` column holds an internal identifier (e.g., 7441148 for Theodore Mcgrath), while `full_name` provides the human-readable name. The `qualification_status` column captures professional credentials, with values ranging from "Fully Qualified" to designations like "ACA", "ACCA", and "CIMA". The `employment_type` column distinguishes between "Full-time" and "Part-time" arrangements, and `days_per_week` records the contracted workload — notably, the data shows values like 28, 36, 44, and 52, suggesting these may represent hours rather than calendar days. The `base_location` column stores the geographic location (London, Egham, Remote), and `has_driver_license` is a boolean flag. The `engagement_id` column links the controller back to their assigned engagement, and `junior_account_id` links to the junior accountant assigned under that controller. For controller 1 (Theodore Mcgrath), the engagement is 3717629 and the junior accountant is 1000.

**Table `clie_management_accounts`**

| account_id | reporting_period | total_revenue | total_expenses | net_profit | status | review_date | engagement_id | financial_controller_id |
|---|---|---|---|---|---|---|---|---|
| fbc33b0c-9bac-11eb-a8a2-19ed5c03f8d3 | 2023-06-18 | 29.24 | 8.20 | 12.20 | Draft | 2024-11-03T22:54:00 | 3717629 | 1 |
| 10207152 | 2024-11-02 | 18.47 | 12.40 | 14.40 | PendingReview | 2025-04-14T05:11:00 | 1562852 | 2 |
| a4afb8ee-9bad-11eb-a8a2-19ed5c03f8d3 | 2025-04-13 | 19.93 | 16.60 | 16.60 | Approved | 2022-09-25T12:28:00 | 9246331 | 3 |
| 3717632 | 2022-09-24 | 24.09 | 20.80 | 18.80 | Filed | 2023-02-09T19:45:00 | 32827 | 4 |

Management accounts are financial summaries tied to specific engagements and controllers. The `account_id` column serves as the primary key and is a UUID in some rows (e.g., `fbc33b0c-9bac-11eb-a8a2-19ed5c03f8d3`) and a numeric string in others (e.g., `10207152`). The `reporting_period` column records the date of the report, `total_revenue` and `total_expenses` capture the financial figures, and `net_profit` is the computed difference. The `status` column tracks the lifecycle of the account through "Draft", "PendingReview", "Approved", and "Filed" states. The `review_date` column records when the account was last reviewed as a timestamp. Foreign keys `engagement_id` and `financial_controller_id` link the account to its parent engagement and responsible controller. For account `fbc33b0c-9bac-11eb-a8a2-19ed5c03f8d3`, the reporting period is 2023-06-18, total revenue is 29.24, total expenses are 8.20, net profit is 12.20, and the status is "Draft".

**Table `clie_compliance_tasks`**

| compliance_task_id | task_id | task_type | due_date | filing_deadline | status | external_advisor_id | financial_controller_id | engagement_id | account_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 7731870 | VAT | 2024-11-11 | 2022-05-18 | NotStarted | 4060648 | 1 | 3717629 | fbc33b0c-9bac-11eb-a8a2-19ed5c03f8d3 |
| 2 | id_28 | CorporationTax | 2025-04-22 | 2023-10-02 | InProgress | info | 2 | 1562852 | 10207152 |
| 3 | 7119763 | PAYE | 2022-09-06 | 2024-03-13 | UnderReview | 1450658 | 3 | 9246331 | a4afb8ee-9bad-11eb-a8a2-19ed5c03f8d3 |
| 4 | lu_tax_code_template_m82 | StatutoryAccounts | 2023-02-17 | 2025-08-24 | Completed | 15687 | 4 | 32827 | 3717632 |

Compliance tasks represent the regulatory obligations associated with each engagement. The `compliance_task_id` is the primary key, and `task_id` holds an internal identifier (e.g., 7731870 or the string `id_28`). The `task_type` column classifies the type of compliance work: "VAT", "CorporationTax", "PAYE", and "StatutoryAccounts". The `due_date` and `filing_deadline` columns record the two critical dates for each task. The `status` column tracks progress through "NotStarted", "InProgress", "UnderReview", and "Completed". The `external_advisor_id` column references an external advisor if one is involved. Foreign keys `financial_controller_id`, `engagement_id`, and `account_id` link the task to its controller, engagement, and management account. For task 1 (task_id 7731870), the type is "VAT", the due date is 2024-11-11, the filing deadline is 2022-05-18, the status is "NotStarted", and the external advisor is 4060648.

**Table `clie_financial_forecasts`**

| forecast_id | forecast_type | projection_period | projected_revenue | projected_expenses | projected_net_cash | confidence_level | engagement_id | financial_controller_id | account_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 7119771 | CashFlow | Monthly | 2,499 | 10.95 | 21.20 | Low | 3717629 | 1 | fbc33b0c-9bac-11eb-a8a2-19ed5c03f8d3 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 3012834 | Profit | Quarterly | 8,598 | 13.90 | 23.40 | Medium | 1562852 | 2 | 10207152 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 2b2bb518-8fcd-11eb-924d-9cd76263cbd0 | Combined | Annually | 3,334 | 16.85 | 25.60 | High | 9246331 | 3 | a4afb8ee-9bad-11eb-a8a2-19ed5c03f8d3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 13219 | CashFlow | Monthly | 0.22 | 19.80 | 27.80 | Low | 32827 | 4 | 3717632 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Financial forecasts provide forward-looking projections for each engagement. The `forecast_id` is the primary key, with values that mix numeric IDs (7119771, 3012834) and UUIDs (`2b2bb518-8fcd-11eb-924d-9cd76263cbd0`). The `forecast_type` column distinguishes between "CashFlow", "Profit", and "Combined" forecasts. The `projection_period` column indicates the granularity: "Monthly", "Quarterly", or "Annually". The `projected_revenue`, `projected_expenses`, and `projected_net_cash` columns hold the forecast figures. The `confidence_level` column captures the forecast's reliability as "Low", "Medium", or "High". Timestamps `created_at` and `updated_at` track the forecast's lifecycle. Foreign keys `engagement_id`, `financial_controller_id`, and `account_id` link the forecast to its engagement, controller, and account. For forecast 7119771, the type is "CashFlow", the period is "Monthly", projected revenue is 2,499, projected expenses are 10.95, projected net cash is 21.20, and the confidence level is "Low".

**Table `clie_junior_accountants`**

| junior_accountant_id | accountant_id | full_name | qualification_level | specialization | hours_allocated | financial_controller_id | engagement_id | account_id |
|---|---|---|---|---|---|---|---|---|
| 1000 | 7441155 | Theodore Mcgrath | Trainee | Audit | 2.70 | 1 | 3717629 | fbc33b0c-9bac-11eb-a8a2-19ed5c03f8d3 |
| 1001 | 790465 | Account Name | PartQualified | Tax | 4.40 | 2 | 1562852 | 10207152 |
| 1002 | 338514 | Saipan International Airport | FullyQualified | AccountsPrep | 6.10 | 3 | 9246331 | a4afb8ee-9bad-11eb-a8a2-19ed5c03f8d3 |
| 1003 | BJibe | Norma Fisher | Trainee | Advisory | 7.80 | 4 | 32827 | 3717632 |

Junior accountants are the support staff assigned to engagements under the supervision of financial controllers. The `junior_accountant_id` is the primary key, with values 1000 through 1003 in the sample data. The `accountant_id` column holds an internal identifier (e.g., 7441155 for Theodore Mcgrath), and `full_name` provides the human-readable name. The `qualification_level` column tracks professional standing: "Trainee", "PartQualified", and "FullyQualified". The `specialization` column records the area of expertise: "Audit", "Tax", "AccountsPrep", and "Advisory". The `hours_allocated` column records the number of hours assigned to the engagement. Foreign keys `financial_controller_id`, `engagement_id`, and `account_id` link the junior accountant to their supervising controller, the engagement, and the management account. For junior accountant 1000 (Theodore Mcgrath), the qualification level is "Trainee", the specialization is "Audit", and hours allocated are 2.70.

### The Client Engagement–Financial Controller View

**View `client_engagement_financial_controller_view`**

```sql
CREATE VIEW client_engagement_financial_controller_view AS
SELECT a.engagement_id, a.client_name, a.industry_sector, a.start_date, b.financial_controller_id AS controller_financial_controller_id, b.controller_id AS controller_controller_id, b.full_name AS controller_full_name
FROM clie_client_engagements a JOIN clie_financial_controllers b ON a.financial_controller_id = b.financial_controller_id;
```

| engagement_id | client_name | industry_sector | start_date | controller_financial_controller_id | controller_controller_id | controller_full_name |
|---|---|---|---|---|---|---|
| 3717629 | Mercy Helpline | Technology | 2022-09-05 | 1 | 7441148 | Theodore Mcgrath |
| 1562852 | Tasha Rodriguez | Manufacturing | 2023-02-16 | 2 | 21248390 | Account Name |
| 9246331 | Glen Taylor | Services | 2024-07-27 | 3 | 727063 | Saipan International Airport |
| 32827 | Nicole Andrews | Retail | 2025-12-11 | 4 | lu_tax_code_template_m13 | Norma Fisher |

This view joins `clie_client_engagements` with `clie_financial_controllers` on `engagement_id` to answer the question: "Which financial controller is responsible for each client engagement, and what are their qualifications?" The join reconstructs the assignment relationship that is stored as a foreign key in both tables. Reading the row for engagement 3717629 (Mercy Helpline), the view reveals that controller Theodore Mcgrath (ID 7441148), who is "Fully Qualified" and works full-time from London, is assigned to this engagement. The second row shows engagement 1562852 (Tasha Rodriguez) paired with controller "Account Name" (ID 21248390), who holds "ACA" qualification and works part-time from Egham. This view is essential for answering resource-allocation questions: which controllers are handling which clients, and what is their capacity profile?

### The Client Engagement–Management Account View

**View `client_engagement_management_account_view`**

```sql
CREATE VIEW client_engagement_management_account_view AS
SELECT a.engagement_id, a.client_name, a.industry_sector, a.start_date, b.account_id AS account_account_id, b.reporting_period AS account_reporting_period, b.total_revenue AS account_total_revenue
FROM clie_client_engagements a JOIN clie_management_accounts b ON a.account_id = b.account_id;
```

| engagement_id | client_name | industry_sector | start_date | account_account_id | account_reporting_period | account_total_revenue |
|---|---|---|---|---|---|---|
| 3717629 | Mercy Helpline | Technology | 2022-09-05 | fbc33b0c-9bac-11eb-a8a2-19ed5c03f8d3 | 2023-06-18 | 29.24 |
| 1562852 | Tasha Rodriguez | Manufacturing | 2023-02-16 | 10207152 | 2024-11-02 | 18.47 |
| 9246331 | Glen Taylor | Services | 2024-07-27 | a4afb8ee-9bad-11eb-a8a2-19ed5c03f8d3 | 2025-04-13 | 19.93 |
| 32827 | Nicole Andrews | Retail | 2025-12-11 | 3717632 | 2022-09-24 | 24.09 |

This view joins `clie_client_engagements` with `clie_management_accounts` on `engagement_id` to answer: "What financial summary is associated with each engagement, and what is its current status?" The join links the engagement's identity to its financial reporting. For engagement 3717629 (Mercy Helpline), the view shows management account `fbc33b0c-9bac-11eb-a8a2-19ed5c03f8d3` with a reporting period of 2023-06-18, total revenue of 29.24, total expenses of 8.20, net profit of 12.20, and a "Draft" status. For engagement 32827 (Nicole Andrews), the account `3717632` shows revenue of 24.09, expenses of 20.80, net profit of 18.80, and a "Filed" status. This view enables financial oversight by presenting the complete picture of each engagement's financial reporting state.

### The Client Engagement–Compliance Task View

**View `client_engagement_compliance_task_view`**

```sql
CREATE VIEW client_engagement_compliance_task_view AS
SELECT a.engagement_id, a.client_name, a.industry_sector, a.start_date, b.compliance_task_id AS task_compliance_task_id, b.task_id AS task_task_id, b.task_type AS task_task_type
FROM clie_client_engagements a JOIN clie_compliance_tasks b ON a.compliance_task_id = b.compliance_task_id;
```

| engagement_id | client_name | industry_sector | start_date | task_compliance_task_id | task_task_id | task_task_type |
|---|---|---|---|---|---|---|
| 3717629 | Mercy Helpline | Technology | 2022-09-05 | 1 | 7731870 | VAT |
| 1562852 | Tasha Rodriguez | Manufacturing | 2023-02-16 | 2 | id_28 | CorporationTax |
| 9246331 | Glen Taylor | Services | 2024-07-27 | 3 | 7119763 | PAYE |
| 32827 | Nicole Andrews | Retail | 2025-12-11 | 4 | lu_tax_code_template_m82 | StatutoryAccounts |

This view joins `clie_client_engagements` with `clie_compliance_tasks` on `engagement_id` to answer: "What compliance obligations exist for each engagement, and what is their progress?" The join surfaces the regulatory workload tied to each client relationship. For engagement 3717629 (Mercy Helpline), the view reveals compliance task 1 (task_id 7731870), which is a "VAT" task with a due date of 2024-11-11, a filing deadline of 2022-05-18, and a "NotStarted" status. For engagement 1562852 (Tasha Rodriguez), task 2 (task_id `id_28`) is a "CorporationTax" task currently "InProgress" with a due date of 2025-04-22. This view is critical for compliance monitoring, allowing practitioners to see at a glance which engagements have overdue or pending regulatory obligations.

### The Financial Controller–Client Engagement View

**View `financial_controller_client_engagement_view`**

```sql
CREATE VIEW financial_controller_client_engagement_view AS
SELECT a.financial_controller_id, a.controller_id, a.full_name, a.qualification_status, b.engagement_id AS engagement_engagement_id, b.client_name AS engagement_client_name, b.industry_sector AS engagement_industry_sector
FROM clie_financial_controllers a JOIN clie_client_engagements b ON a.engagement_id = b.engagement_id;
```

| financial_controller_id | controller_id | full_name | qualification_status | engagement_engagement_id | engagement_client_name | engagement_industry_sector |
|---|---|---|---|---|---|---|
| 1 | 7441148 | Theodore Mcgrath | Fully Qualified | 3717629 | Mercy Helpline | Technology |
| 2 | 21248390 | Account Name | ACA | 1562852 | Tasha Rodriguez | Manufacturing |
| 3 | 727063 | Saipan International Airport | ACCA | 9246331 | Glen Taylor | Services |
| 4 | lu_tax_code_template_m13 | Norma Fisher | CIMA | 32827 | Nicole Andrews | Retail |

This view joins `clie_financial_controllers` with `clie_client_engagements` on `engagement_id` to answer the inverse question: "Which engagements is each financial controller managing?" While the previous view started from engagements, this one starts from controllers, providing a workload perspective. For controller Theodore Mcgrath (ID 7441148), the view shows engagement 3717629 (Mercy Helpline) in the Technology sector with "Active" status. For controller "Account Name" (ID 21248390), the view shows engagement 1562852 (Tasha Rodriguez) in Manufacturing with "Onboarding" status. This view supports capacity planning and workload balancing across the controller team.

### The Financial Controller–Junior Accountant View

**View `financial_controller_junior_accountant_view`**

```sql
CREATE VIEW financial_controller_junior_accountant_view AS
SELECT a.financial_controller_id, a.controller_id, a.full_name, a.qualification_status, b.junior_accountant_id AS accountant_junior_accountant_id, b.accountant_id AS accountant_accountant_id, b.full_name AS accountant_full_name
FROM clie_financial_controllers a JOIN clie_junior_accountants b ON a.junior_accountant_id = b.junior_accountant_id;
```

| financial_controller_id | controller_id | full_name | qualification_status | accountant_junior_accountant_id | accountant_accountant_id | accountant_full_name |
|---|---|---|---|---|---|---|
| 1 | 7441148 | Theodore Mcgrath | Fully Qualified | 1000 | 7441155 | Theodore Mcgrath |
| 2 | 21248390 | Account Name | ACA | 1001 | 790465 | Account Name |
| 3 | 727063 | Saipan International Airport | ACCA | 1002 | 338514 | Saipan International Airport |
| 4 | lu_tax_code_template_m13 | Norma Fisher | CIMA | 1003 | BJibe | Norma Fisher |

This view joins `clie_financial_controllers` with `clie_junior_accountants` on `financial_controller_id` to answer: "Which junior accountants are supervised by each financial controller, and what are their qualifications?" The join reveals the supervisory hierarchy within the practice. For controller Theodore Mcgrath (ID 7441148), the view shows junior accountant 1000 (also named Theodore Mcgrath), who is a "Trainee" specializing in "Audit" with 2.70 hours allocated. For controller "Account Name" (ID 21248390), the view shows junior accountant 1001 (also named "Account Name"), who is "PartQualified" with a "Tax" specialization and 4.40 hours allocated. This view is essential for understanding team composition and ensuring that junior staff have appropriate supervision and specialization alignment.

### The Management Account–Client Engagement View

**View `management_account_client_engagement_view`**

```sql
CREATE VIEW management_account_client_engagement_view AS
SELECT a.account_id, a.reporting_period, a.total_revenue, a.total_expenses, b.engagement_id AS engagement_engagement_id, b.client_name AS engagement_client_name, b.industry_sector AS engagement_industry_sector
FROM clie_management_accounts a JOIN clie_client_engagements b ON a.engagement_id = b.engagement_id;
```

| account_id | reporting_period | total_revenue | total_expenses | engagement_engagement_id | engagement_client_name | engagement_industry_sector |
|---|---|---|---|---|---|---|
| fbc33b0c-9bac-11eb-a8a2-19ed5c03f8d3 | 2023-06-18 | 29.24 | 8.20 | 3717629 | Mercy Helpline | Technology |
| 10207152 | 2024-11-02 | 18.47 | 12.40 | 1562852 | Tasha Rodriguez | Manufacturing |
| a4afb8ee-9bad-11eb-a8a2-19ed5c03f8d3 | 2025-04-13 | 19.93 | 16.60 | 9246331 | Glen Taylor | Services |
| 3717632 | 2022-09-24 | 24.09 | 20.80 | 32827 | Nicole Andrews | Retail |

This view joins `clie_management_accounts` with `clie_client_engagements` on `engagement_id` to answer: "For which engagement was each management account prepared, and what is the client context?" Starting from the financial reports, this view provides the client-side context. For account `fbc33b0c-9bac-11eb-a8a2-19ed5c03f8d3` (reporting period 2023-06-18, revenue 29.24, status "Draft"), the view shows it belongs to engagement 3717629 for client "Mercy Helpline" in the Technology sector. For account `3717632` (reporting period 2022-09-24, revenue 24.09, status "Filed"), the view shows it belongs to engagement 32827 for client "Nicole Andrews" in Retail. This view supports audit trails and client-facing reporting by linking financial summaries back to their client relationships.

### The Management Account–Financial Controller View

**View `management_account_financial_controller_view`**

```sql
CREATE VIEW management_account_financial_controller_view AS
SELECT a.account_id, a.reporting_period, a.total_revenue, a.total_expenses, b.financial_controller_id AS controller_financial_controller_id, b.controller_id AS controller_controller_id, b.full_name AS controller_full_name
FROM clie_management_accounts a JOIN clie_financial_controllers b ON a.financial_controller_id = b.financial_controller_id;
```

| account_id | reporting_period | total_revenue | total_expenses | controller_financial_controller_id | controller_controller_id | controller_full_name |
|---|---|---|---|---|---|---|
| fbc33b0c-9bac-11eb-a8a2-19ed5c03f8d3 | 2023-06-18 | 29.24 | 8.20 | 1 | 7441148 | Theodore Mcgrath |
| 10207152 | 2024-11-02 | 18.47 | 12.40 | 2 | 21248390 | Account Name |
| a4afb8ee-9bad-11eb-a8a2-19ed5c03f8d3 | 2025-04-13 | 19.93 | 16.60 | 3 | 727063 | Saipan International Airport |
| 3717632 | 2022-09-24 | 24.09 | 20.80 | 4 | lu_tax_code_template_m13 | Norma Fisher |

This view joins `clie_management_accounts` with `clie_financial_controllers` on `financial_controller_id` to answer: "Which financial controller is responsible for each management account?" The join connects financial reporting to the accountable individual. For account `fbc33b0c-9bac-11eb-a8a2-19ed5c03f8d3` (revenue 29.24, status "Draft"), the view shows controller Theodore Mcgrath (ID 7441148), who is "Fully Qualified" and works full-time from London. For account `10207152` (revenue 18.47, status "PendingReview"), the view shows controller "Account Name" (ID 21248390), who holds "ACA" qualification and works part-time from Egham. This view supports accountability and quality assurance by identifying the controller responsible for each financial report.

### The Compliance Task–Financial Controller View

**View `compliance_task_financial_controller_view`**

```sql
CREATE VIEW compliance_task_financial_controller_view AS
SELECT a.compliance_task_id, a.task_id, a.task_type, a.due_date, b.financial_controller_id AS controller_financial_controller_id, b.controller_id AS controller_controller_id, b.full_name AS controller_full_name
FROM clie_compliance_tasks a JOIN clie_financial_controllers b ON a.financial_controller_id = b.financial_controller_id;
```

| compliance_task_id | task_id | task_type | due_date | controller_financial_controller_id | controller_controller_id | controller_full_name |
|---|---|---|---|---|---|---|
| 1 | 7731870 | VAT | 2024-11-11 | 1 | 7441148 | Theodore Mcgrath |
| 2 | id_28 | CorporationTax | 2025-04-22 | 2 | 21248390 | Account Name |
| 3 | 7119763 | PAYE | 2022-09-06 | 3 | 727063 | Saipan International Airport |
| 4 | lu_tax_code_template_m82 | StatutoryAccounts | 2023-02-17 | 4 | lu_tax_code_template_m13 | Norma Fisher |

This view joins `clie_compliance_tasks` with `clie_financial_controllers` on `financial_controller_id` to answer: "Which financial controller oversees each compliance task?" The join surfaces the accountability chain for regulatory work. For task 1 (task_id 7731870, type "VAT", status "NotStarted"), the view shows controller Theodore Mcgrath (ID 7441148). For task 2 (task_id `id_28`, type "CorporationTax", status "InProgress"), the view shows controller "Account Name" (ID 21248390). For task 4 (task_id `lu_tax_code_template_m82`, type "StatutoryAccounts", status "Completed"), the view shows controller Norma Fisher (ID `lu_tax_code_template_m13`), who holds "CIMA" qualification and works part-time from London. This view enables compliance oversight by mapping regulatory obligations to their responsible controllers.

### The Compliance Task–Client Engagement View

**View `compliance_task_client_engagement_view`**

```sql
CREATE VIEW compliance_task_client_engagement_view AS
SELECT a.compliance_task_id, a.task_id, a.task_type, a.due_date, b.engagement_id AS engagement_engagement_id, b.client_name AS engagement_client_name, b.industry_sector AS engagement_industry_sector
FROM clie_compliance_tasks a JOIN clie_client_engagements b ON a.engagement_id = b.engagement_id;
```

| compliance_task_id | task_id | task_type | due_date | engagement_engagement_id | engagement_client_name | engagement_industry_sector |
|---|---|---|---|---|---|---|
| 1 | 7731870 | VAT | 2024-11-11 | 3717629 | Mercy Helpline | Technology |
| 2 | id_28 | CorporationTax | 2025-04-22 | 1562852 | Tasha Rodriguez | Manufacturing |
| 3 | 7119763 | PAYE | 2022-09-06 | 9246331 | Glen Taylor | Services |
| 4 | lu_tax_code_template_m82 | StatutoryAccounts | 2023-02-17 | 32827 | Nicole Andrews | Retail |

This view joins `clie_compliance_tasks` with `clie_client_engagements` on `engagement_id` to answer: "For which client engagement is each compliance task being performed?" Starting from the compliance perspective, this view provides the client context for regulatory work. For task 1 (type "VAT", due date 2024-11-11, status "NotStarted"), the view shows engagement 3717629 for client "Mercy Helpline" in Technology. For task 3 (type "PAYE", due date 2022-09-06, status "UnderReview"), the view shows engagement 9246331 for client "Glen Taylor" in Services. This view supports client communication and deadline management by presenting compliance obligations in the context of the client relationship.

### The Compliance Task–Management Account View

**View `compliance_task_management_account_view`**

```sql
CREATE VIEW compliance_task_management_account_view AS
SELECT a.compliance_task_id, a.task_id, a.task_type, a.due_date, b.account_id AS account_account_id, b.reporting_period AS account_reporting_period, b.total_revenue AS account_total_revenue
FROM clie_compliance_tasks a JOIN clie_management_accounts b ON a.account_id = b.account_id;
```

| compliance_task_id | task_id | task_type | due_date | account_account_id | account_reporting_period | account_total_revenue |
|---|---|---|---|---|---|---|
| 1 | 7731870 | VAT | 2024-11-11 | fbc33b0c-9bac-11eb-a8a2-19ed5c03f8d3 | 2023-06-18 | 29.24 |
| 2 | id_28 | CorporationTax | 2025-04-22 | 10207152 | 2024-11-02 | 18.47 |
| 3 | 7119763 | PAYE | 2022-09-06 | a4afb8ee-9bad-11eb-a8a2-19ed5c03f8d3 | 2025-04-13 | 19.93 |
| 4 | lu_tax_code_template_m82 | StatutoryAccounts | 2023-02-17 | 3717632 | 2022-09-24 | 24.09 |

This view joins `clie_compliance_tasks` with `clie_management_accounts` on `account_id` to answer: "Which management account is associated with each compliance task?" The join links regulatory work to the financial reporting it depends on. For task 1 (type "VAT", status "NotStarted"), the view shows account `fbc33b0c-9bac-11eb-a8a2-19ed5c03f8d3` (reporting period 2023-06-18, revenue 29.24, status "Draft"). For task 2 (type "CorporationTax", status "InProgress"), the view shows account `10207152` (reporting period 2024-11-02, revenue 18.47, status "PendingReview"). This view is essential for understanding the data dependencies between compliance deliverables and financial reports.

### The Financial Forecast–Client Engagement View

**View `financial_forecast_client_engagement_view`**

```sql
CREATE VIEW financial_forecast_client_engagement_view AS
SELECT a.forecast_id, a.forecast_type, a.projection_period, a.projected_revenue, b.engagement_id AS engagement_engagement_id, b.client_name AS engagement_client_name, b.industry_sector AS engagement_industry_sector
FROM clie_financial_forecasts a JOIN clie_client_engagements b ON a.engagement_id = b.engagement_id;
```

| forecast_id | forecast_type | projection_period | projected_revenue | engagement_engagement_id | engagement_client_name | engagement_industry_sector |
|---|---|---|---|---|---|---|
| 7119771 | CashFlow | Monthly | 2,499 | 3717629 | Mercy Helpline | Technology |
| 3012834 | Profit | Quarterly | 8,598 | 1562852 | Tasha Rodriguez | Manufacturing |
| 2b2bb518-8fcd-11eb-924d-9cd76263cbd0 | Combined | Annually | 3,334 | 9246331 | Glen Taylor | Services |
| 13219 | CashFlow | Monthly | 0.22 | 32827 | Nicole Andrews | Retail |

This view joins `clie_financial_forecasts` with `clie_client_engagements` on `engagement_id` to answer: "For which client engagement was each financial forecast prepared?" The join connects forward-looking projections to their client context. For forecast 7119771 (type "CashFlow", period "Monthly", projected revenue 2,499, confidence "Low"), the view shows engagement 3717629 for client "Mercy Helpline". For forecast 3012834 (type "Profit", period "Quarterly", projected revenue 8,598, confidence "Medium"), the view shows engagement 1562852 for client "Tasha Rodriguez". For forecast `2b2bb518-8fcd-11eb-924d-9cd76263cbd0` (type "Combined", period "Annually", projected revenue 3,334, confidence "High"), the view shows engagement 9246331 for client "Glen Taylor". This view supports strategic planning by presenting forecasts in the context of the underlying client relationships.

### The Financial Forecast–Financial Controller View

**View `financial_forecast_financial_controller_view`**

```sql
CREATE VIEW financial_forecast_financial_controller_view AS
SELECT a.forecast_id, a.forecast_type, a.projection_period, a.projected_revenue, b.financial_controller_id AS controller_financial_controller_id, b.controller_id AS controller_controller_id, b.full_name AS controller_full_name
FROM clie_financial_forecasts a JOIN clie_financial_controllers b ON a.financial_controller_id = b.financial_controller_id;
```

| forecast_id | forecast_type | projection_period | projected_revenue | controller_financial_controller_id | controller_controller_id | controller_full_name |
|---|---|---|---|---|---|---|
| 7119771 | CashFlow | Monthly | 2,499 | 1 | 7441148 | Theodore Mcgrath |
| 3012834 | Profit | Quarterly | 8,598 | 2 | 21248390 | Account Name |
| 2b2bb518-8fcd-11eb-924d-9cd76263cbd0 | Combined | Annually | 3,334 | 3 | 727063 | Saipan International Airport |
| 13219 | CashFlow | Monthly | 0.22 | 4 | lu_tax_code_template_m13 | Norma Fisher |

This view joins `clie_financial_forecasts` with `clie_financial_controllers` on `financial_controller_id` to answer: "Which financial controller is responsible for each financial forecast?" The join links projections to the accountable individual. For forecast 7119771 (type "CashFlow", confidence "Low"), the view shows controller Theodore Mcgrath (ID 7441148), who is "Fully Qualified" and works full-time from London. For forecast 3012834 (type "Profit", confidence "Medium"), the view shows controller "Account Name" (ID 21248390), who holds "ACA" qualification and works part-time from Egham. For forecast `2b2bb518-8fcd-11eb-924d-9cd76263cbd0` (type "Combined", confidence "High"), the view shows controller Saipan International Airport (ID 727063), who holds "ACCA" qualification and works full-time from Remote. This view supports forecast governance by identifying the controller responsible for each projection.

### The Financial Forecast–Management Account View

**View `financial_forecast_management_account_view`**

```sql
CREATE VIEW financial_forecast_management_account_view AS
SELECT a.forecast_id, a.forecast_type, a.projection_period, a.projected_revenue, b.account_id AS account_account_id, b.reporting_period AS account_reporting_period, b.total_revenue AS account_total_revenue
FROM clie_financial_forecasts a JOIN clie_management_accounts b ON a.account_id = b.account_id;
```

| forecast_id | forecast_type | projection_period | projected_revenue | account_account_id | account_reporting_period | account_total_revenue |
|---|---|---|---|---|---|---|
| 7119771 | CashFlow | Monthly | 2,499 | fbc33b0c-9bac-11eb-a8a2-19ed5c03f8d3 | 2023-06-18 | 29.24 |
| 3012834 | Profit | Quarterly | 8,598 | 10207152 | 2024-11-02 | 18.47 |
| 2b2bb518-8fcd-11eb-924d-9cd76263cbd0 | Combined | Annually | 3,334 | a4afb8ee-9bad-11eb-a8a2-19ed5c03f8d3 | 2025-04-13 | 19.93 |
| 13219 | CashFlow | Monthly | 0.22 | 3717632 | 2022-09-24 | 24.09 |

This view joins `clie_financial_forecasts` with `clie_management_accounts` on `account_id` to answer: "Which management account underpins each financial forecast?" The join connects forward-looking projections to their historical financial basis. For forecast 7119771 (type "CashFlow", projected revenue 2,499, confidence "Low"), the view shows account `fbc33b0c-9bac-11eb-a8a2-19ed5c03f8d3` (reporting period 2023-06-18, revenue 29.24, status "Draft"). For forecast 3012834 (type "Profit", projected revenue 8,598, confidence "Medium"), the view shows account `10207152` (reporting period 2024-11-02, revenue 18.47, status "PendingReview"). For forecast `2b2bb518-8fcd-11eb-924d-9cd76263cbd0` (type "Combined", projected revenue 3,334, confidence "High"), the view shows account `a4afb8ee-9bad-11eb-a8a2-19ed5c03f8d3` (reporting period 2025-04-13, revenue 19.93, status "Approved"). This view supports forecast validation by allowing practitioners to compare projections against actual reported figures.

### The Junior Accountant–Financial Controller View

**View `junior_accountant_financial_controller_view`**

```sql
CREATE VIEW junior_accountant_financial_controller_view AS
SELECT a.junior_accountant_id, a.accountant_id, a.full_name, a.qualification_level, b.financial_controller_id AS controller_financial_controller_id, b.controller_id AS controller_controller_id, b.full_name AS controller_full_name
FROM clie_junior_accountants a JOIN clie_financial_controllers b ON a.financial_controller_id = b.financial_controller_id;
```

| junior_accountant_id | accountant_id | full_name | qualification_level | controller_financial_controller_id | controller_controller_id | controller_full_name |
|---|---|---|---|---|---|---|
| 1000 | 7441155 | Theodore Mcgrath | Trainee | 1 | 7441148 | Theodore Mcgrath |
| 1001 | 790465 | Account Name | PartQualified | 2 | 21248390 | Account Name |
| 1002 | 338514 | Saipan International Airport | FullyQualified | 3 | 727063 | Saipan International Airport |
| 1003 | BJibe | Norma Fisher | Trainee | 4 | lu_tax_code_template_m13 | Norma Fisher |

This view joins `clie_junior_accountants` with `clie_financial_controllers` on `financial_controller_id` to answer: "Which financial controller supervises each junior accountant?" The join reveals the supervisory chain from the junior staff perspective. For junior accountant 1000 (Theodore Mcgrath, "Trainee", "Audit" specialization, 2.70 hours), the view shows controller Theodore Mcgrath (ID 7441148), who is "Fully Qualified" and works full-time from London. For junior accountant 1001 ("Account Name", "PartQualified", "Tax" specialization, 4.40 hours), the view shows controller "Account Name" (ID 21248390), who holds "ACA" qualification and works part-time from Egham. For junior accountant 1002 ("Saipan International Airport", "FullyQualified", "AccountsPrep" specialization, 6.10 hours), the view shows controller Saipan International Airport (ID 727063), who holds "ACCA" qualification and works full-time from Remote. For junior accountant 1003 (Norma Fisher, "Trainee", "Advisory" specialization, 7.80 hours), the view shows controller Norma Fisher (ID `lu_tax_code_template_m13`), who holds "CIMA" qualification and works part-time from London. This view supports team management and ensures appropriate supervision ratios.

### The Junior Accountant–Client Engagement View

**View `junior_accountant_client_engagement_view`**

```sql
CREATE VIEW junior_accountant_client_engagement_view AS
SELECT a.junior_accountant_id, a.accountant_id, a.full_name, a.qualification_level, b.engagement_id AS engagement_engagement_id, b.client_name AS engagement_client_name, b.industry_sector AS engagement_industry_sector
FROM clie_junior_accountants a JOIN clie_client_engagements b ON a.engagement_id = b.engagement_id;
```

| junior_accountant_id | accountant_id | full_name | qualification_level | engagement_engagement_id | engagement_client_name | engagement_industry_sector |
|---|---|---|---|---|---|---|
| 1000 | 7441155 | Theodore Mcgrath | Trainee | 3717629 | Mercy Helpline | Technology |
| 1001 | 790465 | Account Name | PartQualified | 1562852 | Tasha Rodriguez | Manufacturing |
| 1002 | 338514 | Saipan International Airport | FullyQualified | 9246331 | Glen Taylor | Services |
| 1003 | BJibe | Norma Fisher | Trainee | 32827 | Nicole Andrews | Retail |

This view joins `clie_junior_accountants` with `clie_client_engagements` on `engagement_id` to answer: "For which client engagement is each junior accountant working?" The join connects support staff to their client assignments. For junior accountant 1000 (Theodore Mcgrath, "Trainee", "Audit" specialization, 2.70 hours), the view shows engagement 3717629 for client "Mercy Helpline" in Technology. For junior accountant 1001 ("Account Name", "PartQualified", "Tax" specialization, 4.40 hours), the view shows engagement 1562852 for client "Tasha Rodriguez" in Manufacturing. For junior accountant 1002 ("Saipan International Airport", "FullyQualified", "AccountsPrep" specialization, 6.10 hours), the view shows engagement 9246331 for client "Glen Taylor" in Services. For junior accountant 1003 (Norma Fisher, "Trainee", "Advisory" specialization, 7.80 hours), the view shows engagement 32827 for client "Nicole Andrews" in Retail. This view supports workload distribution and client assignment tracking.

### The Junior Accountant–Management Account View

**View `junior_accountant_management_account_view`**

```sql
CREATE VIEW junior_accountant_management_account_view AS
SELECT a.junior_accountant_id, a.accountant_id, a.full_name, a.qualification_level, b.account_id AS account_account_id, b.reporting_period AS account_reporting_period, b.total_revenue AS account_total_revenue
FROM clie_junior_accountants a JOIN clie_management_accounts b ON a.account_id = b.account_id;
```

| junior_accountant_id | accountant_id | full_name | qualification_level | account_account_id | account_reporting_period | account_total_revenue |
|---|---|---|---|---|---|---|
| 1000 | 7441155 | Theodore Mcgrath | Trainee | fbc33b0c-9bac-11eb-a8a2-19ed5c03f8d3 | 2023-06-18 | 29.24 |
| 1001 | 790465 | Account Name | PartQualified | 10207152 | 2024-11-02 | 18.47 |
| 1002 | 338514 | Saipan International Airport | FullyQualified | a4afb8ee-9bad-11eb-a8a2-19ed5c03f8d3 | 2025-04-13 | 19.93 |
| 1003 | BJibe | Norma Fisher | Trainee | 3717632 | 2022-09-24 | 24.09 |

This view joins `clie_junior_accountants` with `clie_management_accounts` on `account_id` to answer: "Which management account is each junior accountant supporting?" The join connects support staff to the financial reports they contribute to. For junior accountant 1000 (Theodore Mcgrath, "Trainee", "Audit" specialization, 2.70 hours), the view shows account `fbc33b0c-9bac-11eb-a8a2-19ed5c03f8d3` (reporting period 2023-06-18, revenue 29.24, status "Draft"). For junior accountant 1001 ("Account Name", "PartQualified", "Tax" specialization, 4.40 hours), the view shows account `10207152` (reporting period 2024-11-02, revenue 18.47, status "PendingReview"). For junior accountant 1002 ("Saipan International Airport", "FullyQualified", "AccountsPrep" specialization, 6.10 hours), the view shows account `a4afb8ee-9bad-11eb-a8a2-19ed5c03f8d3` (reporting period 2025-04-13, revenue 19.93, status "Approved"). For junior accountant 1003 (Norma Fisher, "Trainee", "Advisory" specialization, 7.80 hours), the view shows account `3717632` (reporting period 2022-09-24, revenue 24.09, status "Filed"). This view supports quality control and contribution tracking by linking junior staff to the specific financial reports they help prepare.

### Synthesis

The client engagement schema models a tightly coupled accounting practice where every business entity — client, controller, account, compliance task, forecast, and junior accountant — is linked through a network of foreign keys that enforce referential integrity. The six base tables form a star-like topology with `clie_client_engagements` at the center, while cross-links between controllers, accounts, and tasks create a fully connected mesh that mirrors the real-world dependencies of financial services delivery. The twenty-two views provide bidirectional access patterns, allowing practitioners to navigate the schema from any entity perspective: starting from an engagement to see all its components, or starting from a controller to see all their responsibilities. Each view reconstructs a domain fact by joining the relevant tables on their shared foreign keys, transforming the normalized storage into the business-contextualized views that users actually need. The schema's design ensures that no matter which entry point a practitioner chooses, the join operations reliably reconstruct the complete picture of the engagement, its financial health, its compliance obligations, and its team composition.