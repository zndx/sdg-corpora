The architecture of a modern accounting practice rests on the disciplined coordination of client engagements, financial oversight, compliance obligations, and forward-looking projections. Every engagement begins with a client relationship, proceeds through managed accounts and regulatory filings, and is guided by financial controllers who allocate junior staff and forecast outcomes. The records below capture this lifecycle in full: who is engaged, who oversees the work, what accounts are produced, which compliance tasks must be completed, how forecasts are constructed, and which junior accountants contribute hours. Together they form a coherent operational model where each entity is traceable to every other through well-defined foreign-key relationships.

## Client Engagements

**Table `clie_client_engagements`**

| engagement_id | client_name | industry_sector | start_date | end_date | status | financial_controller_id | account_id | compliance_task_id |
|---|---|---|---|---|---|---|---|---|
| 3717629 | Mercy Helpline | Technology | 2022-09-05 | 2022-09-01 | Active | 1 | fbc33b0c-9bac-11eb-a8a2-19ed5c03f8d3 | 1 |
| 1562852 | Tasha Rodriguez | Manufacturing | 2023-02-16 | 2023-02-12 | Onboarding | 2 | 10207152 | 2 |
| 9246331 | Glen Taylor | Services | 2024-07-27 | 2024-07-23 | Review | 3 | a4afb8ee-9bad-11eb-a8a2-19ed5c03f8d3 | 3 |
| 32827 | Nicole Andrews | Retail | 2025-12-11 | 2025-12-07 | Closed | 4 | 3717632 | 4 |

The client engagement table is the central hub of the practice. Each row represents a single engagement identified by `engagement_id`, linked to a `client_name`, an `industry_sector`, and a date range from `start_date` through `end_date`. The `status` column tracks the engagement's current phase—Active, Onboarding, Review, or Closed. Every engagement carries three foreign keys: `financial_controller_id` points to the controller responsible for oversight, `account_id` references the associated management accounts record, and `compliance_task_id` points to the compliance task governing regulatory filings.

Consider engagement 3717629 for Mercy Helpline in the Technology sector. It ran from 2022-09-05 to 2022-09-01, is currently Active, and is overseen by financial controller 1, linked to management account fbc33b0c-9bac-11eb-a8a2-19ed5c03f8d3, and governed by compliance task 1. Engagement 1562852 for Tasha Rodriguez in Manufacturing is in Onboarding status, managed by controller 2, with account 10207152 and compliance task 2. Engagement 9246331 for Glen Taylor in Services is in Review, handled by controller 3, with account a4afb8ee-9bad-11eb-a8a2-19ed5c03f8d3 and compliance task 3. Engagement 32827 for Nicole Andrews in Retail is Closed, overseen by controller 4, with account 3717632 and compliance task 4. The engagement table thus serves as the primary navigation point into all other records.

## Financial Controllers

**Table `clie_financial_controllers`**

| financial_controller_id | controller_id | full_name | qualification_status | employment_type | days_per_week | base_location | has_driver_license | engagement_id | junior_accountant_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 7441148 | Theodore Mcgrath | Fully Qualified | Full-time | 28 | London | true | 3717629 | 1000 |
| 2 | 21248390 | Account Name | ACA | Part-time | 36 | Egham | false | 1562852 | 1001 |
| 3 | 727063 | Saipan International Airport | ACCA | Full-time | 44 | Remote | true | 9246331 | 1002 |
| 4 | lu_tax_code_template_m13 | Norma Fisher | CIMA | Part-time | 52 | London | false | 32827 | 1003 |

Financial controllers are the senior practitioners who direct engagement work. The `clie_financial_controllers` table stores each controller's `financial_controller_id`, an internal `controller_id`, their `full_name`, `qualification_status`, `employment_type`, `days_per_week`, `base_location`, and whether they `has_driver_license`. Each controller is assigned to exactly one `engagement_id` and one `junior_accountant_id`, establishing a direct supervisory chain.

Theodore Mcgrath (controller 1) is Fully Qualified, works full-time, is based in London, holds a driver's license, and supervises engagement 3717629 and junior accountant 1000. Account Name (controller 2) holds ACA qualification, works part-time from Egham without a driver's license, and supervises engagement 1562852 and junior accountant 1001. Saipan International Airport (controller 3) holds ACCA qualification, works full-time remotely with a driver's license, and supervises engagement 9246331 and junior accountant 1002. Norma Fisher (controller 4) holds CIMA qualification, works part-time from London without a driver's license, and supervises engagement 32827 and junior accountant 1003. The controller table bridges the engagement layer to both the junior staff and the downstream financial records.

## Management Accounts

**Table `clie_management_accounts`**

| account_id | reporting_period | total_revenue | total_expenses | net_profit | status | review_date | engagement_id | financial_controller_id |
|---|---|---|---|---|---|---|---|---|
| fbc33b0c-9bac-11eb-a8a2-19ed5c03f8d3 | 2023-06-18 | 29.24 | 8.20 | 12.20 | Draft | 2024-11-03T22:54:00 | 3717629 | 1 |
| 10207152 | 2024-11-02 | 18.47 | 12.40 | 14.40 | PendingReview | 2025-04-14T05:11:00 | 1562852 | 2 |
| a4afb8ee-9bad-11eb-a8a2-19ed5c03f8d3 | 2025-04-13 | 19.93 | 16.60 | 16.60 | Approved | 2022-09-25T12:28:00 | 9246331 | 3 |
| 3717632 | 2022-09-24 | 24.09 | 20.80 | 18.80 | Filed | 2023-02-09T19:45:00 | 32827 | 4 |

Management accounts capture the financial performance of each engagement. The `clie_management_accounts` table records an `account_id`, a `reporting_period`, `total_revenue`, `total_expenses`, `net_profit`, a `status` (Draft, PendingReview, Approved, or Filed), a `review_date`, and foreign keys to the `engagement_id` and `financial_controller_id`.

For engagement 3717629, management account fbc33b0c-9bac-11eb-a8a2-19ed5c03f8d3 covers the period 2023-06-18 with revenue of 29.24, expenses of 8.20, and net profit of 12.20; it is in Draft status and was reviewed on 2024-11-03. For engagement 1562852, account 10207152 covers 2024-11-02 with revenue of 18.47, expenses of 12.40, and net profit of 14.40; it is PendingReview with a review date of 2025-04-14. For engagement 9246331, account a4afb8ee-9bad-11eb-a8a2-19ed5c03f8d3 covers 2025-04-13 with revenue of 19.93, expenses of 16.60, and net profit of 16.60; it is Approved and was reviewed on 2022-09-25. For engagement 32827, account 3717632 covers 2022-09-24 with revenue of 24.09, expenses of 20.80, and net profit of 18.80; it is Filed and was reviewed on 2023-02-09. The status progression from Draft through Filed mirrors the lifecycle of the engagement itself.

## Compliance Tasks

**Table `clie_compliance_tasks`**

| compliance_task_id | task_id | task_type | due_date | filing_deadline | status | external_advisor_id | financial_controller_id | engagement_id | account_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 7731870 | VAT | 2024-11-11 | 2022-05-18 | NotStarted | 4060648 | 1 | 3717629 | fbc33b0c-9bac-11eb-a8a2-19ed5c03f8d3 |
| 2 | id_28 | CorporationTax | 2025-04-22 | 2023-10-02 | InProgress | info | 2 | 1562852 | 10207152 |
| 3 | 7119763 | PAYE | 2022-09-06 | 2024-03-13 | UnderReview | 1450658 | 3 | 9246331 | a4afb8ee-9bad-11eb-a8a2-19ed5c03f8d3 |
| 4 | lu_tax_code_template_m82 | StatutoryAccounts | 2023-02-17 | 2025-08-24 | Completed | 15687 | 4 | 32827 | 3717632 |

Compliance tasks govern the regulatory obligations attached to each engagement. The `clie_compliance_tasks` table stores a `compliance_task_id`, a `task_id`, the `task_type` (VAT, CorporationTax, PAYE, or StatutoryAccounts), a `due_date`, a `filing_deadline`, a `status` (NotStarted, InProgress, UnderReview, or Completed), an `external_advisor_id`, and foreign keys to `financial_controller_id`, `engagement_id`, and `account_id`.

Compliance task 1 (task_id 7731870) is a VAT filing for engagement 3717629, due 2024-11-11 with a filing deadline of 2022-05-18, currently NotStarted, overseen by controller 1 and linked to account fbc33b0c-9bac-11eb-a8a2-19ed5c03f8d3. Compliance task 2 (task_id id_28) is a CorporationTax filing for engagement 1562852, due 2025-04-22 with a filing deadline of 2023-10-02, currently InProgress, overseen by controller 2 and linked to account 10207152. Compliance task 3 (task_id 7119763) is a PAYE filing for engagement 9246331, due 2022-09-06 with a filing deadline of 2024-03-13, currently UnderReview, overseen by controller 3 and linked to account a4afb8ee-9bad-11eb-a8a2-19ed5c03f8d3. Compliance task 4 (task_id lu_tax_code_template_m82) is a StatutoryAccounts filing for engagement 32827, due 2023-02-17 with a filing deadline of 2025-08-24, currently Completed, overseen by controller 4 and linked to account 3717632. The task_type and status fields together indicate both the regulatory category and the completion stage.

## Financial Forecasts

**Table `clie_financial_forecasts`**

| forecast_id | forecast_type | projection_period | projected_revenue | projected_expenses | projected_net_cash | confidence_level | engagement_id | financial_controller_id | account_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 7119771 | CashFlow | Monthly | 2,499 | 10.95 | 21.20 | Low | 3717629 | 1 | fbc33b0c-9bac-11eb-a8a2-19ed5c03f8d3 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 3012834 | Profit | Quarterly | 8,598 | 13.90 | 23.40 | Medium | 1562852 | 2 | 10207152 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 2b2bb518-8fcd-11eb-924d-9cd76263cbd0 | Combined | Annually | 3,334 | 16.85 | 25.60 | High | 9246331 | 3 | a4afb8ee-9bad-11eb-a8a2-19ed5c03f8d3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 13219 | CashFlow | Monthly | 0.22 | 19.80 | 27.80 | Low | 32827 | 4 | 3717632 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Financial forecasts project future performance for each engagement. The `clie_financial_forecasts` table records a `forecast_id`, `forecast_type` (CashFlow, Profit, or Combined), a `projection_period` (Monthly, Quarterly, or Annually), `projected_revenue`, `projected_expenses`, `projected_net_cash`, a `confidence_level` (Low, Medium, or High), and foreign keys to `engagement_id`, `financial_controller_id`, and `account_id`, along with `created_at` and `updated_at` timestamps.

Forecast 7119771 is a Monthly CashFlow projection for engagement 3717629, projecting revenue of 2,499 against expenses of 10.95 and net cash of 21.20 with Low confidence; it was created on 2025-01-01 and updated on 2025-01-02. Forecast 3012834 is a Quarterly Profit projection for engagement 1562852, projecting revenue of 8,598 against expenses of 13.90 and net cash of 23.40 with Medium confidence; created 2025-02-06, updated 2025-02-09. Forecast 2b2bb518-8fcd-11eb-924d-9cd76263cbd0 is an Annually Combined projection for engagement 9246331, projecting revenue of 3,334 against expenses of 16.85 and net cash of 25.60 with High confidence; created 2025-03-11, updated 2025-03-16. Forecast 13219 is a Monthly CashFlow projection for engagement 32827, projecting revenue of 0.22 against expenses of 19.80 and net cash of 27.80 with Low confidence; created 2025-04-16, updated 2025-04-23. The confidence level and projection period together indicate the reliability and granularity of each forecast.

## Junior Accountants

**Table `clie_junior_accountants`**

| junior_accountant_id | accountant_id | full_name | qualification_level | specialization | hours_allocated | financial_controller_id | engagement_id | account_id |
|---|---|---|---|---|---|---|---|---|
| 1000 | 7441155 | Theodore Mcgrath | Trainee | Audit | 2.70 | 1 | 3717629 | fbc33b0c-9bac-11eb-a8a2-19ed5c03f8d3 |
| 1001 | 790465 | Account Name | PartQualified | Tax | 4.40 | 2 | 1562852 | 10207152 |
| 1002 | 338514 | Saipan International Airport | FullyQualified | AccountsPrep | 6.10 | 3 | 9246331 | a4afb8ee-9bad-11eb-a8a2-19ed5c03f8d3 |
| 1003 | BJibe | Norma Fisher | Trainee | Advisory | 7.80 | 4 | 32827 | 3717632 |

Junior accountants are the staff who execute engagement work under controller supervision. The `clie_junior_accountants` table stores a `junior_accountant_id`, an internal `accountant_id`, their `full_name`, `qualification_level` (Trainee, PartQualified, or FullyQualified), `specialization` (Audit, Tax, AccountsPrep, or Advisory), `hours_allocated`, and foreign keys to `financial_controller_id`, `engagement_id`, and `account_id`.

Junior accountant 1000 (Theodore Mcgrath) is a Trainee specializing in Audit with 2.70 hours allocated to controller 1, engagement 3717629, and account fbc33b0c-9bac-11eb-a8a2-19ed5c03f8d3. Junior accountant 1001 (Account Name) is PartQualified specializing in Tax with 4.40 hours allocated to controller 2, engagement 1562852, and account 10207152. Junior accountant 1002 (Saipan International Airport) is FullyQualified specializing in AccountsPrep with 6.10 hours allocated to controller 3, engagement 9246331, and account a4afb8ee-9bad-11eb-a8a2-19ed5c03f8d3. Junior accountant 1003 (Norma Fisher) is a Trainee specializing in Advisory with 7.80 hours allocated to controller 4, engagement 32827, and account 3717632. The hours_allocated field quantifies the capacity each junior accountant dedicates to their assigned engagement.

## Client Engagement to Financial Controller View

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

This view joins `clie_client_engagements` with `clie_financial_controllers` on `engagement_id` to answer which controller is assigned to each engagement and what their qualifications and employment terms are. The joined result surfaces the controller's `full_name`, `qualification_status`, `employment_type`, `days_per_week`, `base_location`, and `has_driver_license` alongside the engagement's `client_name`, `industry_sector`, `start_date`, `end_date`, and `status`. Reading engagement 3717629 in this view reveals that Mercy Helpline (Technology, Active) is overseen by Theodore Mcgrath, a Fully Qualified full-time controller based in London with a driver's license. Reading engagement 1562852 shows Tasha Rodriguez (Manufacturing, Onboarding) is overseen by Account Name, an ACA-qualified part-time controller based in Egham without a driver's license. This view is the primary tool for assessing whether controller capacity and qualifications align with engagement requirements.

## Client Engagement to Management Account View

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

This view joins `clie_client_engagements` with `clie_management_accounts` on `engagement_id` to surface the financial performance data associated with each engagement. The joined result includes the account's `reporting_period`, `total_revenue`, `total_expenses`, `net_profit`, `status`, and `review_date` alongside the engagement's identifying columns. For engagement 3717629, the view shows that Mercy Helpline has a management account covering 2023-06-18 with revenue of 29.24, expenses of 8.20, net profit of 12.20, in Draft status, reviewed on 2024-11-03. For engagement 32827, the view shows Nicole Andrews (Retail, Closed) has a management account covering 2022-09-24 with revenue of 24.09, expenses of 20.80, net profit of 18.80, in Filed status, reviewed on 2023-02-09. This view enables practitioners to assess the financial maturity of each engagement at a glance.

## Client Engagement to Compliance Task View

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

This view joins `clie_client_engagements` with `clie_compliance_tasks` on `engagement_id` to surface the regulatory obligations attached to each engagement. The joined result includes the task's `task_type`, `due_date`, `filing_deadline`, `status`, and `external_advisor_id` alongside the engagement's identifying columns. For engagement 3717629, the view shows that Mercy Helpline has a VAT compliance task due 2024-11-11 with a filing deadline of 2022-05-18, currently NotStarted, with external advisor 4060648. For engagement 32827, the view shows Nicole Andrews (Retail, Closed) has a StatutoryAccounts compliance task due 2023-02-17 with a filing deadline of 2025-08-24, currently Completed, with external advisor 15687. This view is essential for compliance monitoring and deadline management.

## Financial Controller to Client Engagement View

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

This view joins `clie_financial_controllers` with `clie_client_engagements` on `engagement_id` to answer which engagements each controller is managing and what the status of those engagements is. The joined result surfaces the engagement's `client_name`, `industry_sector`, `start_date`, `end_date`, and `status` alongside the controller's identifying columns. Reading controller 1 (Theodore Mcgrath) in this view reveals that he manages engagement 3717629 for Mercy Helpline in Technology, which is Active. Reading controller 4 (Norma Fisher) shows she manages engagement 32827 for Nicole Andrews in Retail, which is Closed. This view supports workload distribution analysis and controller performance tracking.

## Financial Controller to Junior Accountant View

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

This view joins `clie_financial_controllers` with `clie_junior_accountants` on `financial_controller_id` to surface the supervisory relationship between controllers and junior staff. The joined result includes the junior accountant's `full_name`, `qualification_level`, `specialization`, and `hours_allocated` alongside the controller's identifying columns. Controller 1 (Theodore Mcgrath) supervises junior accountant 1000 (Theodore Mcgrath), a Trainee in Audit with 2.70 hours allocated. Controller 3 (Saipan International Airport) supervises junior accountant 1002 (Saipan International Airport), a FullyQualified professional in AccountsPrep with 6.10 hours allocated. This view clarifies the staffing structure and helps identify whether junior staff qualifications match the complexity of the engagements they support.

## Management Account to Client Engagement View

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

This view joins `clie_management_accounts` with `clie_client_engagements` on `engagement_id` to surface the engagement context for each management account. The joined result includes the engagement's `client_name`, `industry_sector`, `start_date`, `end_date`, and `status` alongside the account's financial columns. For account fbc33b0c-9bac-11eb-a8a2-19ed5c03f8d3, the view shows it belongs to engagement 3717629 (Mercy Helpline, Technology, Active), with revenue of 29.24 and net profit of 12.20 in Draft status. For account 3717632, the view shows it belongs to engagement 32827 (Nicole Andrews, Retail, Closed), with revenue of 24.09 and net profit of 18.80 in Filed status. This view is useful for auditing the financial health of engagements and verifying that account statuses are consistent with engagement statuses.

## Management Account to Financial Controller View

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

This view joins `clie_management_accounts` with `clie_financial_controllers` on `financial_controller_id` to surface which controller is responsible for each management account. The joined result includes the controller's `full_name`, `qualification_status`, `employment_type`, and `base_location` alongside the account's financial columns. Account fbc33b0c-9bac-11eb-a8a2-19ed5c03f8d3 is overseen by Theodore Mcgrath (Fully Qualified, Full-time, London). Account 10207152 is overseen by Account Name (ACA, Part-time, Egham). This view supports accountability tracking and ensures that management accounts are reviewed by appropriately qualified controllers.

## Compliance Task to Financial Controller View

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

This view joins `clie_compliance_tasks` with `clie_financial_controllers` on `financial_controller_id` to surface which controller is responsible for each compliance task. The joined result includes the controller's `full_name`, `qualification_status`, and `employment_type` alongside the task's `task_type`, `due_date`, `filing_deadline`, and `status`. Task 1 (VAT, NotStarted, due 2024-11-11) is overseen by Theodore Mcgrath (Fully Qualified). Task 4 (StatutoryAccounts, Completed, due 2023-02-17) is overseen by Norma Fisher (CIMA, Part-time). This view enables compliance managers to assess controller workload and task completion rates.

## Compliance Task to Client Engagement View

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

This view joins `clie_compliance_tasks` with `clie_client_engagements` on `engagement_id` to surface the engagement context for each compliance task. The joined result includes the engagement's `client_name`, `industry_sector`, and `status` alongside the task's `task_type`, `due_date`, and `status`. Task 1 (VAT, NotStarted) is attached to engagement 3717629 (Mercy Helpline, Technology, Active). Task 4 (StatutoryAccounts, Completed) is attached to engagement 32827 (Nicole Andrews, Retail, Closed). This view is particularly useful for identifying compliance tasks that are overdue relative to the engagement's current status.

## Compliance Task to Management Account View

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

This view joins `clie_compliance_tasks` with `clie_management_accounts` on `account_id` to surface the financial context for each compliance task. The joined result includes the account's `reporting_period`, `total_revenue`, `total_expenses`, `net_profit`, and `status` alongside the task's `task_type`, `due_date`, and `status`. Task 1 (VAT, NotStarted) is linked to account fbc33b0c-9bac-11eb-a8a2-19ed5c03f8d3 (period 2023-06-18, revenue 29.24, net profit 12.20, Draft). Task 3 (PAYE, UnderReview) is linked to account a4afb8ee-9bad-11eb-a8a2-19ed5c03f8d3 (period 2025-04-13, revenue 19.93, net profit 16.60, Approved). This view supports the correlation between financial performance and compliance readiness.

## Financial Forecast to Client Engagement View

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

This view joins `clie_financial_forecasts` with `clie_client_engagements` on `engagement_id` to surface the engagement context for each financial forecast. The joined result includes the engagement's `client_name`, `industry_sector`, and `status` alongside the forecast's `forecast_type`, `projection_period`, `projected_revenue`, `projected_expenses`, `projected_net_cash`, and `confidence_level`. Forecast 7119771 (Monthly CashFlow, Low confidence, projected revenue 2,499) is attached to engagement 3717629 (Mercy Helpline, Technology, Active). Forecast 2b2bb518-8fcd-11eb-924d-9cd76263cbd0 (Annually Combined, High confidence, projected revenue 3,334) is attached to engagement 9246331 (Glen Taylor, Services, Review). This view enables practitioners to assess whether forecast confidence levels are appropriate for the current engagement status.

## Financial Forecast to Financial Controller View

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

This view joins `clie_financial_forecasts` with `clie_financial_controllers` on `financial_controller_id` to surface which controller is responsible for each forecast. The joined result includes the controller's `full_name`, `qualification_status`, and `employment_type` alongside the forecast's `forecast_type`, `projection_period`, and `confidence_level`. Forecast 7119771 (Monthly CashFlow, Low confidence) is produced by Theodore Mcgrath (Fully Qualified, Full-time). Forecast 2b2bb518-8fcd-11eb-924d-9cd76263cbd0 (Annually Combined, High confidence) is produced by Saipan International Airport (ACCA, Full-time). This view supports the evaluation of forecast quality against controller qualifications.

## Financial Forecast to Management Account View

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

This view joins `clie_financial_forecasts` with `clie_management_accounts` on `account_id` to surface the historical financial context for each forecast. The joined result includes the account's `reporting_period`, `total_revenue`, `total_expenses`, `net_profit`, and `status` alongside the forecast's `projected_revenue`, `projected_expenses`, and `projected_net_cash`. Forecast 7119771 (projected revenue 2,499, projected expenses 10.95) is linked to account fbc33b0c-9bac-11eb-a8a2-19ed5c03f8d3 (actual revenue 29.24, actual expenses 8.20, net profit 12.20). Forecast 3012834 (projected revenue 8,598, projected expenses 13.90) is linked to account 10207152 (actual revenue 18.47, actual expenses 12.40, net profit 14.40). This view enables practitioners to compare projected figures against actual results and assess forecast accuracy.

## Junior Accountant to Financial Controller View

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

This view joins `clie_junior_accountants` with `clie_financial_controllers` on `financial_controller_id` to surface the supervisory relationship from the junior accountant's perspective. The joined result includes the controller's `full_name`, `qualification_status`, `employment_type`, and `base_location` alongside the junior accountant's `qualification_level`, `specialization`, and `hours_allocated`. Junior accountant 1000 (Theodore Mcgrath, Trainee, Audit, 2.70 hours) is supervised by controller 1 (Theodore Mcgrath, Fully Qualified, Full-time, London). Junior accountant 1003 (Norma Fisher, Trainee, Advisory, 7.80 hours) is supervised by controller 4 (Norma Fisher, CIMA, Part-time, London). This view supports workload balancing and qualification matching between controllers and their junior staff.

## Junior Accountant to Client Engagement View

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

This view joins `clie_junior_accountants` with `clie_client_engagements` on `engagement_id` to surface the engagement context for each junior accountant's allocation. The joined result includes the engagement's `client_name`, `industry_sector`, and `status` alongside the junior accountant's `full_name`, `qualification_level`, `specialization`, and `hours_allocated`. Junior accountant 1000 (Theodore Mcgrath, Trainee, Audit) is allocated to engagement 3717629 (Mercy Helpline, Technology, Active). Junior accountant 1002 (Saipan International Airport, FullyQualified, AccountsPrep) is allocated to engagement 9246331 (Glen Taylor, Services, Review). This view helps practitioners verify that junior staff specializations align with the industry and complexity of their assigned engagements.

## Junior Accountant to Management Account View

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

This view joins `clie_junior_accountants` with `clie_management_accounts` on `account_id` to surface the financial context for each junior accountant's allocation. The joined result includes the account's `reporting_period`, `total_revenue`, `total_expenses`, `net_profit`, and `status` alongside the junior accountant's `full_name`, `qualification_level`, `specialization`, and `hours_allocated`. Junior accountant 1000 (Trainee, Audit, 2.70 hours) is allocated to account fbc33b0c-9bac-11eb-a8a2-19ed5c03f8d3 (period 2023-06-18, revenue 29.24, net profit 12.20, Draft). Junior accountant 1002 (FullyQualified, AccountsPrep, 6.10 hours) is allocated to account a4afb8ee-9bad-11eb-a8a2-19ed5c03f8d3 (period 2025-04-13, revenue 19.93, net profit 16.60, Approved). This view supports the assessment of whether junior staff qualifications are appropriate for the financial complexity of the accounts they support.

## Synthesis

The six base tables and sixteen join views together form a complete operational model for an accounting practice. Client engagements anchor the model, each linked to a financial controller, a management account, and a compliance task. Financial controllers supervise junior accountants and produce financial forecasts. Management accounts capture historical financial performance. Compliance tasks track regulatory obligations. Financial forecasts project future outcomes. Junior accountants contribute specialized hours under controller supervision. Every join view answers a specific operational question: which controller manages which engagement, which junior staff support which account, which compliance tasks are overdue, and whether forecast confidence aligns with actual financial performance. The foreign-key relationships ensure that every record is traceable to every other, providing full auditability across the engagement lifecycle.