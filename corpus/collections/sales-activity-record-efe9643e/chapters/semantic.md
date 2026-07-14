## Ontology-Grounded Relational Modelling in the Sales Domain

The sales domain under examination captures the lifecycle of a prospective customer from initial contact through quotation and reporting, orchestrated by a hierarchy of sales administrators supervised by marketing managers. At the conceptual level, the ontology distinguishes six entity types: `SaleSalesActivityRecord`, `ProspectiveCustomer`, `Quotation`, `SalesReport`, `SalesAdministrator`, and `MarketingManager`. Each entity type materialises as a base table whose columns correspond to the ontology's attributes, while the cardinality-bounded relationships between entities become foreign-key columns or junction tables. The views then reconstitute domain facts by joining these normalised tables back together.

### The Activity Record as the Central Fact

The backbone of the schema is the `sale_sales_activity_records` table, which records discrete sales activities performed by administrators. Each row carries a surrogate primary key (`id`), a business-level `activity_id` (such as `8843761` or `4180957`), a timestamped `activity_date`, an `activity_type` drawn from a controlled vocabulary (`Telemarketing`, `Appointment Setting`, `Client Inquiry`, `Quotation Preparation`), a `duration_minutes` field, an `outcome` (`Successful`, `Unsuccessful`, `Pending`), free-text `notes`, and three foreign keys pointing to the administrator, the prospective customer, and the sales report that the activity belongs to.

**Table `sale_sales_activity_records`**

| id | activity_id | activity_date | activity_type | duration_minutes | outcome | notes | sales_administrator_id | prospective_customer_id | sales_report_id |
|---|---|---|---|---|---|---|---|---|---|
| 100 | 8843761 | 2024-11-08T22:30:00 | Telemarketing | 35 | Successful | extended-notes-75 | 1000 | 1 | 1000 |
| 101 | 4180957 | 2025-04-19T05:47:00 | Appointment Setting | 38 | Unsuccessful | integrated-notes-76 | 1001 | 2 | 1001 |
| 102 | 168545 | 2022-09-03T12:04:00 | Client Inquiry | 41 | Pending | seasonal-notes-77 | 1002 | 3 | 1002 |
| 103 | default_chart_a_account_53 | 2023-02-14T19:21:00 | Quotation Preparation | 44 | Successful | regional-notes-78 | 1003 | 4 | 1003 |

Consider row `id = 100`: a telemarketing activity of 35 minutes, marked `Successful`, performed by administrator `1000` on prospective customer `1` and linked to sales report `1000`. Row `id = 103` illustrates a `Quotation Preparation` activity of 44 minutes with outcome `Successful`, tied to administrator `1003`, customer `4`, and report `1003`. The three foreign-key columns (`sales_administrator_id`, `prospective_customer_id`, `sales_report_id`) encode the ontology's binary relationships as cardinality-bounded links: each activity record references exactly one administrator, one customer, and one report.

### Prospective Customers and Quotations

The `sale_prospective_customers` table stores the identity and contact details of leads. Its columns include a surrogate `id`, a business `customer_id`, `company_name`, `contact_person`, `contact_email`, `contact_phone`, `lead_source` (e.g. `Business Directory`, `Existing Client`, `Other`), a `status` (`New`, `Contacted`, `Qualified`, `Lost`), a foreign key to `quotation_id`, and audit timestamps.

**Table `sale_prospective_customers`**

| id | customer_id | company_name | contact_person | contact_email | contact_phone | lead_source | status | quotation_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | Stephanie Lawrence | Feedback Rating | Alyssa Chung | Christopher Wilson | Joe Tsai | Business Directory | New | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | Bryan Larson | Virgin Group | Brianna Mejia | Charles Larsen | Stephanie Collins | Existing Client | Contacted | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | Allen Saunders | United Technologies | Eric Schultz | Mary Alvarez | Tasha Rodriguez | Other | Qualified | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | Francis Gulotta | Link Title | Peter Montgomery | April Snyder | Walter Pratt | Business Directory | Lost | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Row `id = 1` represents Stephanie Lawrence of Feedback Rating, contacted via `Business Directory`, with status `New` and quotation `1`. Row `id = 4` is Francis Gulotta of Link Title, also sourced from `Business Directory` but with status `Lost` and quotation `4`. The `quotation_id` column binds each customer to a single quotation, enforcing a one-to-one relationship at the row level.

The `sale_quotations` table holds the financial and administrative details of offers made to customers. Columns include `id`, `quotation_id` (a business identifier such as `12715698` or `1050`), `issue_date`, `expiry_date`, `total_amount` (ranging from `112.11` to `15,418`), `status` (`Draft`, `Sent`, `Accepted`, `Rejected`), a `description` field, and foreign keys to `prospective_customer_id`, `sales_administrator_id`, and `sales_activity_record_id`.

**Table `sale_quotations`**

| id | quotation_id | issue_date | expiry_date | total_amount | status | description | prospective_customer_id | sales_administrator_id | sales_activity_record_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 12715698 | 2023-02-01 | 2023-10-24 | 112.11 | Draft | Extended Survey | 1 | 1000 | 100 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | 1996939 | 2024-07-12 | 2024-03-08 | 1,979 | Sent | Pilot Corridor A | 2 | 1001 | 101 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | 1050 | 2025-12-23 | 2025-08-19 | 15,418 | Accepted | Baseline Series | 3 | 1002 | 102 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | 2087744 | 2022-05-07 | 2022-01-03 | 12,579 | Rejected | Distributed Assessment | 4 | 1003 | 103 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Row `id = 1` is quotation `12715698` for `112.11`, in `Draft` status, assigned to administrator `1000` and activity record `100`. Row `id = 3` is quotation `1050` for `15,418`, in `Accepted` status, linked to administrator `1002` and activity record `102`. The quotation table thus forms a hub: each quotation references one customer, one administrator, and one activity record, creating a triangular relationship that the views later unfold.

### Sales Reports and Administrators

The `sale_sales_reports` table captures periodic performance summaries. Its columns are `id`, `report_id` (e.g. `1202-0008-S`, `L355`), `report_date`, `total_calls`, `new_prospects`, `appointments_set`, `status` (`Draft`, `Submitted`, `Reviewed`), and a foreign key to `sales_administrator_id`.

**Table `sale_sales_reports`**

| id | report_id | report_date | total_calls | new_prospects | appointments_set | status | sales_administrator_id |
|---|---|---|---|---|---|---|---|
| 1000 | 1202-0008-S | 2024-03-02 | 25 | 31 | 16 | Draft | 1000 |
| 1001 | 8189500 | 2025-08-13 | 57 | 41 | 24 | Submitted | 1001 |
| 1002 | L355 | 2022-01-24 | 3 | 51 | 32 | Reviewed | 1002 |
| 1003 | 5844272 | 2023-06-08 | 820 | 61 | 40 | Draft | 1003 |

Row `id = 1000` is report `1202-0008-S` dated `2024-03-02` with `25` total calls, `31` new prospects, and `16` appointments set, in `Draft` status, attributed to administrator `1000`. Row `id = 1003` is report `5844272` with `820` total calls and `61` new prospects, also in `Draft` status, for administrator `1003`. The `sales_administrator_id` foreign key binds each report to exactly one administrator.

The `sale_sales_administrators` table stores the personnel records of sales staff. Columns include `id`, `admin_id` (a business identifier such as `2986232` or a UUID like `9222f51a-9bad-11eb-a8a2-19ed5c03f8d3`), `full_name`, `department`, `office_location`, `weekly_hours`, `salary_grade`, and foreign keys to `marketing_manager_id`, `quotation_id`, and `sales_report_id`.

**Table `sale_sales_administrators`**

| id | admin_id | full_name | department | office_location | weekly_hours | salary_grade | marketing_manager_id | quotation_id | sales_report_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 1000 | 2986232 | Theodore Mcgrath | adaptive-departme-89 | composite-office-99 | 43 | integrated-salary-88 | 1 | 1 | 1000 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 1001 | 9222f51a-9bad-11eb-a8a2-19ed5c03f8d3 | Account Name | distributed-departme-90 | primary-office-100 | 51 | seasonal-salary-89 | 2 | 2 | 1001 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 1002 | 859ac854-9bad-11eb-a8a2-19ed5c03f8d3 | Saipan International Airport | baseline-departme-91 | adaptive-office-101 | 59 | regional-salary-90 | 3 | 3 | 1002 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 1003 | 57e4c59a-8fcd-11eb-924d-9cd76263cbd0 | Norma Fisher | pilot-departme-92 | distributed-office-102 | 67 | legacy-salary-91 | 4 | 4 | 1003 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Row `id = 1000` is Theodore Mcgrath of department `adaptive-departme-89`, office `composite-office-99`, working `43` weekly hours at salary grade `integrated-salary-88`, supervised by marketing manager `1`, with quotation `1` and sales report `1000` linked. Row `id = 1003` is Norma Fisher of department `pilot-departme-92`, office `distributed-office-102`, working `67` weekly hours at salary grade `legacy-salary-91`, supervised by marketing manager `4`, with quotation `4` and sales report `1003`. The administrator table thus serves as a second hub, connecting to marketing managers, quotations, and sales reports.

The `sale_marketing_managers` table is the leaf of the hierarchy, containing `id`, `manager_id`, `full_name`, `department`, and `office_location`.

**Table `sale_marketing_managers`**

| id | manager_id | full_name | department | office_location |
|---|---|---|---|---|
| 1 | id_23 | Theodore Mcgrath | adaptive-departme-89 | composite-office-99 |
| 2 | 10449531 | Account Name | distributed-departme-90 | primary-office-100 |
| 3 | 659 | Saipan International Airport | baseline-departme-91 | adaptive-office-101 |
| 4 | f208f470-8fcd-11eb-924d-9cd76263cbd0 | Norma Fisher | pilot-departme-92 | distributed-office-102 |

Row `id = 1` is manager `id_23` (Theodore Mcgrath) of department `adaptive-departme-89` at office `composite-office-99`. Row `id = 4` is manager `f208f470-8fcd-11eb-924d-9cd76263cbd0` (Norma Fisher) of department `pilot-departme-92` at office `distributed-office-102`. Marketing managers have no outgoing foreign keys; they are supervised entities in the ontology.

### Junction Tables and Many-to-Many Relationships

The ontology also encodes many-to-many relationships through junction tables. The `sale_prospective_customersSalesActivityRecord` table links prospective customers to sales activity records, allowing a single customer to be associated with multiple activities and vice versa.

**Table `sale_prospective_customersSalesActivityRecord`**

| prospective_customer_id | sales_activity_record_id |
|---|---|
| 1 | 100 |
| 1 | 101 |
| 2 | 101 |
| 2 | 102 |
| 3 | 102 |
| 3 | 103 |
| 4 | 103 |
| 4 | 100 |

Similarly, `sale_sales_reportsSalesActivityRecord` connects sales reports to activity records, and `sale_sales_administratorsSalesActivityRecord` connects administrators to activity records. These junction tables decompose what would otherwise be ambiguous multi-valued relationships into explicit binary associations, preserving first normal form.

The `sale_marketing_managersSalesAdministrator` junction table links marketing managers to sales administrators, enabling a manager to supervise multiple administrators and an administrator to potentially report to multiple managers.

**Table `sale_marketing_managersSalesAdministrator`**

| marketing_manager_id | sales_administrator_id |
|---|---|
| 1 | 1000 |
| 1 | 1001 |
| 2 | 1001 |
| 2 | 1002 |
| 3 | 1002 |
| 3 | 1003 |
| 4 | 1003 |
| 4 | 1000 |

### Views: Reconstructing Domain Facts

Views in this schema are declarative joins that reassemble normalised rows into domain-level facts. Each view answers a specific analytical question by pulling together the relevant tables.

The view `v_sales_activity_record_sales_administrator` joins `sale_sales_activity_records` with `sale_sales_administrators` on `sales_administrator_id`, answering the question "which administrator performed which activity?" A row from this view might show activity `8843761` (Telemarketing, `Successful`) performed by Theodore Mcgrath of department `adaptive-departme-89`.

**View `v_sales_activity_record_sales_administrator`**

```sql
CREATE VIEW v_sales_activity_record_sales_administrator AS
SELECT a.id, a.activity_id, a.activity_date, a.activity_type, b.id AS administrator_id, b.admin_id AS administrator_admin_id, b.full_name AS administrator_full_name
FROM sale_sales_activity_records a JOIN sale_sales_administrators b ON a.sales_administrator_id = b.id;
```

| id | activity_id | activity_date | activity_type | administrator_id | administrator_admin_id | administrator_full_name |
|---|---|---|---|---|---|---|
| 100 | 8843761 | 2024-11-08T22:30:00 | Telemarketing | 1000 | 2986232 | Theodore Mcgrath |
| 101 | 4180957 | 2025-04-19T05:47:00 | Appointment Setting | 1001 | 9222f51a-9bad-11eb-a8a2-19ed5c03f8d3 | Account Name |
| 102 | 168545 | 2022-09-03T12:04:00 | Client Inquiry | 1002 | 859ac854-9bad-11eb-a8a2-19ed5c03f8d3 | Saipan International Airport |
| 103 | default_chart_a_account_53 | 2023-02-14T19:21:00 | Quotation Preparation | 1003 | 57e4c59a-8fcd-11eb-924d-9cd76263cbd0 | Norma Fisher |

The view `v_sales_activity_record_prospective_customer` joins activity records with prospective customers on `prospective_customer_id`, answering "which customer was the subject of which activity?" A row might show activity `4180957` (Appointment Setting, `Unsuccessful`) directed at Bryan Larson of Virgin Group, whose status is `Contacted`.

**View `v_sales_activity_record_prospective_customer`**

```sql
CREATE VIEW v_sales_activity_record_prospective_customer AS
SELECT a.id, a.activity_id, a.activity_date, a.activity_type, b.id AS customer_id, b.customer_id AS customer_customer_id, b.company_name AS customer_company_name
FROM sale_sales_activity_records a JOIN sale_prospective_customers b ON a.prospective_customer_id = b.id;
```

| id | activity_id | activity_date | activity_type | customer_id | customer_customer_id | customer_company_name |
|---|---|---|---|---|---|---|
| 100 | 8843761 | 2024-11-08T22:30:00 | Telemarketing | 1 | Stephanie Lawrence | Feedback Rating |
| 101 | 4180957 | 2025-04-19T05:47:00 | Appointment Setting | 2 | Bryan Larson | Virgin Group |
| 102 | 168545 | 2022-09-03T12:04:00 | Client Inquiry | 3 | Allen Saunders | United Technologies |
| 103 | default_chart_a_account_53 | 2023-02-14T19:21:00 | Quotation Preparation | 4 | Francis Gulotta | Link Title |

The view `v_sales_activity_record_sales_report` joins activity records with sales reports on `sales_report_id`, answering "which activity contributed to which report?" A row might show activity `168545` (Client Inquiry) contributing to report `L355` (3 total calls, 51 new prospects).

**View `v_sales_activity_record_sales_report`**

```sql
CREATE VIEW v_sales_activity_record_sales_report AS
SELECT a.id, a.activity_id, a.activity_date, a.activity_type, b.id AS report_id, b.report_id AS report_report_id, b.report_date AS report_report_date
FROM sale_sales_activity_records a JOIN sale_sales_reports b ON a.sales_report_id = b.id;
```

| id | activity_id | activity_date | activity_type | report_id | report_report_id | report_report_date |
|---|---|---|---|---|---|---|
| 100 | 8843761 | 2024-11-08T22:30:00 | Telemarketing | 1000 | 1202-0008-S | 2024-03-02 |
| 101 | 4180957 | 2025-04-19T05:47:00 | Appointment Setting | 1001 | 8189500 | 2025-08-13 |
| 102 | 168545 | 2022-09-03T12:04:00 | Client Inquiry | 1002 | L355 | 2022-01-24 |
| 103 | default_chart_a_account_53 | 2023-02-14T19:21:00 | Quotation Preparation | 1003 | 5844272 | 2023-06-08 |

The view `v_prospective_customer_sales_activity_record_detail` joins prospective customers with their associated activity records, providing a customer-centric detail view. A row might combine Stephanie Lawrence (company: Feedback Rating, status: `New`) with her telemarketing activity `8843761` (outcome: `Successful`).

**View `v_prospective_customer_sales_activity_record_detail`**

```sql
CREATE VIEW v_prospective_customer_sales_activity_record_detail AS
SELECT a.id, a.customer_id, a.company_name, b.id AS record_id, b.activity_id AS record_activity_id, b.activity_date AS record_activity_date
FROM sale_prospective_customers a
  JOIN sale_prospective_customersSalesActivityRecord j ON j.prospective_customer_id = a.id
  JOIN sale_sales_activity_records b ON b.id = j.sales_activity_record_id;
```

| id | customer_id | company_name | record_id | record_activity_id | record_activity_date |
|---|---|---|---|---|---|
| 1 | Stephanie Lawrence | Feedback Rating | 100 | 8843761 | 2024-11-08T22:30:00 |
| 1 | Stephanie Lawrence | Feedback Rating | 101 | 4180957 | 2025-04-19T05:47:00 |
| 2 | Bryan Larson | Virgin Group | 101 | 4180957 | 2025-04-19T05:47:00 |
| 2 | Bryan Larson | Virgin Group | 102 | 168545 | 2022-09-03T12:04:00 |
| 3 | Allen Saunders | United Technologies | 102 | 168545 | 2022-09-03T12:04:00 |
| 3 | Allen Saunders | United Technologies | 103 | default_chart_a_account_53 | 2023-02-14T19:21:00 |
| 4 | Francis Gulotta | Link Title | 103 | default_chart_a_account_53 | 2023-02-14T19:21:00 |
| 4 | Francis Gulotta | Link Title | 100 | 8843761 | 2024-11-08T22:30:00 |

The view `v_prospective_customer_quotation` joins prospective customers with quotations on `prospective_customer_id`, answering "which quotation was issued to which customer?" A row might show Bryan Larson (Virgin Group, status: `Contacted`) linked to quotation `1996939` for `1,979` in `Sent` status.

**View `v_prospective_customer_quotation`**

```sql
CREATE VIEW v_prospective_customer_quotation AS
SELECT a.id, a.customer_id, a.company_name, a.contact_person, b.id AS quotation_id, b.quotation_id AS quotation_quotation_id, b.issue_date AS quotation_issue_date
FROM sale_prospective_customers a JOIN sale_quotations b ON a.quotation_id = b.id;
```

| id | customer_id | company_name | contact_person | quotation_id | quotation_quotation_id | quotation_issue_date |
|---|---|---|---|---|---|---|
| 1 | Stephanie Lawrence | Feedback Rating | Alyssa Chung | 1 | 12715698 | 2023-02-01 |
| 2 | Bryan Larson | Virgin Group | Brianna Mejia | 2 | 1996939 | 2024-07-12 |
| 3 | Allen Saunders | United Technologies | Eric Schultz | 3 | 1050 | 2025-12-23 |
| 4 | Francis Gulotta | Link Title | Peter Montgomery | 4 | 2087744 | 2022-05-07 |

The view `v_quotation_prospective_customer` performs the inverse join, presenting quotations as the primary entity with customer details attached. A row might show quotation `1050` (Baseline Series, `15,418`, `Accepted`) issued to Allen Saunders of United Technologies, status `Qualified`.

**View `v_quotation_prospective_customer`**

```sql
CREATE VIEW v_quotation_prospective_customer AS
SELECT a.id, a.quotation_id, a.issue_date, a.expiry_date, b.id AS customer_id, b.customer_id AS customer_customer_id, b.company_name AS customer_company_name
FROM sale_quotations a JOIN sale_prospective_customers b ON a.prospective_customer_id = b.id;
```

| id | quotation_id | issue_date | expiry_date | customer_id | customer_customer_id | customer_company_name |
|---|---|---|---|---|---|---|
| 1 | 12715698 | 2023-02-01 | 2023-10-24 | 1 | Stephanie Lawrence | Feedback Rating |
| 2 | 1996939 | 2024-07-12 | 2024-03-08 | 2 | Bryan Larson | Virgin Group |
| 3 | 1050 | 2025-12-23 | 2025-08-19 | 3 | Allen Saunders | United Technologies |
| 4 | 2087744 | 2022-05-07 | 2022-01-03 | 4 | Francis Gulotta | Link Title |

The view `v_quotation_sales_administrator` joins quotations with sales administrators on `sales_administrator_id`, answering "which administrator is responsible for which quotation?" A row might show quotation `2087744` (Distributed Assessment, `12,579`, `Rejected`) assigned to Norma Fisher of department `pilot-departme-92`.

**View `v_quotation_sales_administrator`**

```sql
CREATE VIEW v_quotation_sales_administrator AS
SELECT a.id, a.quotation_id, a.issue_date, a.expiry_date, b.id AS administrator_id, b.admin_id AS administrator_admin_id, b.full_name AS administrator_full_name
FROM sale_quotations a JOIN sale_sales_administrators b ON a.sales_administrator_id = b.id;
```

| id | quotation_id | issue_date | expiry_date | administrator_id | administrator_admin_id | administrator_full_name |
|---|---|---|---|---|---|---|
| 1 | 12715698 | 2023-02-01 | 2023-10-24 | 1000 | 2986232 | Theodore Mcgrath |
| 2 | 1996939 | 2024-07-12 | 2024-03-08 | 1001 | 9222f51a-9bad-11eb-a8a2-19ed5c03f8d3 | Account Name |
| 3 | 1050 | 2025-12-23 | 2025-08-19 | 1002 | 859ac854-9bad-11eb-a8a2-19ed5c03f8d3 | Saipan International Airport |
| 4 | 2087744 | 2022-05-07 | 2022-01-03 | 1003 | 57e4c59a-8fcd-11eb-924d-9cd76263cbd0 | Norma Fisher |

The view `v_quotation_sales_activity_record` joins quotations with activity records on `sales_activity_record_id`, answering "which activity led to which quotation?" A row might show quotation `12715698` (Extended Survey, `112.11`, `Draft`) stemming from activity `100` (Telemarketing, `Successful`).

**View `v_quotation_sales_activity_record`**

```sql
CREATE VIEW v_quotation_sales_activity_record AS
SELECT a.id, a.quotation_id, a.issue_date, a.expiry_date, b.id AS record_id, b.activity_id AS record_activity_id, b.activity_date AS record_activity_date
FROM sale_quotations a JOIN sale_sales_activity_records b ON a.sales_activity_record_id = b.id;
```

| id | quotation_id | issue_date | expiry_date | record_id | record_activity_id | record_activity_date |
|---|---|---|---|---|---|---|
| 1 | 12715698 | 2023-02-01 | 2023-10-24 | 100 | 8843761 | 2024-11-08T22:30:00 |
| 2 | 1996939 | 2024-07-12 | 2024-03-08 | 101 | 4180957 | 2025-04-19T05:47:00 |
| 3 | 1050 | 2025-12-23 | 2025-08-19 | 102 | 168545 | 2022-09-03T12:04:00 |
| 4 | 2087744 | 2022-05-07 | 2022-01-03 | 103 | default_chart_a_account_53 | 2023-02-14T19:21:00 |

The view `v_sales_report_sales_administrator` joins sales reports with sales administrators on `sales_administrator_id`, answering "which administrator produced which report?" A row might show report `8189500` (57 total calls, 41 new prospects, `Submitted`) produced by administrator `1001` (Account Name, department `distributed-departme-90`).

**View `v_sales_report_sales_administrator`**

```sql
CREATE VIEW v_sales_report_sales_administrator AS
SELECT a.id, a.report_id, a.report_date, a.total_calls, b.id AS administrator_id, b.admin_id AS administrator_admin_id, b.full_name AS administrator_full_name
FROM sale_sales_reports a JOIN sale_sales_administrators b ON a.sales_administrator_id = b.id;
```

| id | report_id | report_date | total_calls | administrator_id | administrator_admin_id | administrator_full_name |
|---|---|---|---|---|---|---|
| 1000 | 1202-0008-S | 2024-03-02 | 25 | 1000 | 2986232 | Theodore Mcgrath |
| 1001 | 8189500 | 2025-08-13 | 57 | 1001 | 9222f51a-9bad-11eb-a8a2-19ed5c03f8d3 | Account Name |
| 1002 | L355 | 2022-01-24 | 3 | 1002 | 859ac854-9bad-11eb-a8a2-19ed5c03f8d3 | Saipan International Airport |
| 1003 | 5844272 | 2023-06-08 | 820 | 1003 | 57e4c59a-8fcd-11eb-924d-9cd76263cbd0 | Norma Fisher |

The view `v_sales_report_sales_activity_record_detail` joins sales reports with activity records on `sales_report_id`, answering "which activities contributed to which report?" A row might show report `1202-0008-S` (25 calls, 31 new prospects, `Draft`) linked to activity `1000` (Telemarketing, `Successful`).

**View `v_sales_report_sales_activity_record_detail`**

```sql
CREATE VIEW v_sales_report_sales_activity_record_detail AS
SELECT a.id, a.report_id, a.report_date, b.id AS record_id, b.activity_id AS record_activity_id, b.activity_date AS record_activity_date
FROM sale_sales_reports a
  JOIN sale_sales_reportsSalesActivityRecord j ON j.sales_report_id = a.id
  JOIN sale_sales_activity_records b ON b.id = j.sales_activity_record_id;
```

| id | report_id | report_date | record_id | record_activity_id | record_activity_date |
|---|---|---|---|---|---|
| 1000 | 1202-0008-S | 2024-03-02 | 100 | 8843761 | 2024-11-08T22:30:00 |
| 1000 | 1202-0008-S | 2024-03-02 | 101 | 4180957 | 2025-04-19T05:47:00 |
| 1001 | 8189500 | 2025-08-13 | 101 | 4180957 | 2025-04-19T05:47:00 |
| 1001 | 8189500 | 2025-08-13 | 102 | 168545 | 2022-09-03T12:04:00 |
| 1002 | L355 | 2022-01-24 | 102 | 168545 | 2022-09-03T12:04:00 |
| 1002 | L355 | 2022-01-24 | 103 | default_chart_a_account_53 | 2023-02-14T19:21:00 |
| 1003 | 5844272 | 2023-06-08 | 103 | default_chart_a_account_53 | 2023-02-14T19:21:00 |
| 1003 | 5844272 | 2023-06-08 | 100 | 8843761 | 2024-11-08T22:30:00 |

The view `v_sales_administrator_marketing_manager` joins sales administrators with marketing managers on `marketing_manager_id`, answering "which manager supervises which administrator?" A row might show Theodore Mcgrath (administrator `1000`, department `adaptive-departme-89`) supervised by marketing manager `id_23` (also named Theodore Mcgrath, department `adaptive-departme-89`).

**View `v_sales_administrator_marketing_manager`**

```sql
CREATE VIEW v_sales_administrator_marketing_manager AS
SELECT a.id, a.admin_id, a.full_name, a.department, b.id AS manager_id, b.manager_id AS manager_manager_id, b.full_name AS manager_full_name
FROM sale_sales_administrators a JOIN sale_marketing_managers b ON a.marketing_manager_id = b.id;
```

| id | admin_id | full_name | department | manager_id | manager_manager_id | manager_full_name |
|---|---|---|---|---|---|---|
| 1000 | 2986232 | Theodore Mcgrath | adaptive-departme-89 | 1 | id_23 | Theodore Mcgrath |
| 1001 | 9222f51a-9bad-11eb-a8a2-19ed5c03f8d3 | Account Name | distributed-departme-90 | 2 | 10449531 | Account Name |
| 1002 | 859ac854-9bad-11eb-a8a2-19ed5c03f8d3 | Saipan International Airport | baseline-departme-91 | 3 | 659 | Saipan International Airport |
| 1003 | 57e4c59a-8fcd-11eb-924d-9cd76263cbd0 | Norma Fisher | pilot-departme-92 | 4 | f208f470-8fcd-11eb-924d-9cd76263cbd0 | Norma Fisher |

The view `v_sales_administrator_sales_activity_record_detail` joins sales administrators with activity records on `sales_administrator_id`, answering "which activities did which administrator perform?" A row might show administrator `1002` (Saipan International Airport, department `baseline-departme-91`) having performed activity `168545` (Client Inquiry, `Pending`, 41 minutes).

**View `v_sales_administrator_sales_activity_record_detail`**

```sql
CREATE VIEW v_sales_administrator_sales_activity_record_detail AS
SELECT a.id, a.admin_id, a.full_name, b.id AS record_id, b.activity_id AS record_activity_id, b.activity_date AS record_activity_date
FROM sale_sales_administrators a
  JOIN sale_sales_administratorsSalesActivityRecord j ON j.sales_administrator_id = a.id
  JOIN sale_sales_activity_records b ON b.id = j.sales_activity_record_id;
```

| id | admin_id | full_name | record_id | record_activity_id | record_activity_date |
|---|---|---|---|---|---|
| 1000 | 2986232 | Theodore Mcgrath | 100 | 8843761 | 2024-11-08T22:30:00 |
| 1000 | 2986232 | Theodore Mcgrath | 101 | 4180957 | 2025-04-19T05:47:00 |
| 1001 | 9222f51a-9bad-11eb-a8a2-19ed5c03f8d3 | Account Name | 101 | 4180957 | 2025-04-19T05:47:00 |
| 1001 | 9222f51a-9bad-11eb-a8a2-19ed5c03f8d3 | Account Name | 102 | 168545 | 2022-09-03T12:04:00 |
| 1002 | 859ac854-9bad-11eb-a8a2-19ed5c03f8d3 | Saipan International Airport | 102 | 168545 | 2022-09-03T12:04:00 |
| 1002 | 859ac854-9bad-11eb-a8a2-19ed5c03f8d3 | Saipan International Airport | 103 | default_chart_a_account_53 | 2023-02-14T19:21:00 |
| 1003 | 57e4c59a-8fcd-11eb-924d-9cd76263cbd0 | Norma Fisher | 103 | default_chart_a_account_53 | 2023-02-14T19:21:00 |
| 1003 | 57e4c59a-8fcd-11eb-924d-9cd76263cbd0 | Norma Fisher | 100 | 8843761 | 2024-11-08T22:30:00 |

The view `v_sales_administrator_quotation` joins sales administrators with quotations on `sales_administrator_id`, answering "which quotations did which administrator handle?" A row might show administrator `1003` (Norma Fisher, weekly hours `67`) handling quotation `2087744` (Distributed Assessment, `12,579`, `Rejected`).

**View `v_sales_administrator_quotation`**

```sql
CREATE VIEW v_sales_administrator_quotation AS
SELECT a.id, a.admin_id, a.full_name, a.department, b.id AS quotation_id, b.quotation_id AS quotation_quotation_id, b.issue_date AS quotation_issue_date
FROM sale_sales_administrators a JOIN sale_quotations b ON a.quotation_id = b.id;
```

| id | admin_id | full_name | department | quotation_id | quotation_quotation_id | quotation_issue_date |
|---|---|---|---|---|---|---|
| 1000 | 2986232 | Theodore Mcgrath | adaptive-departme-89 | 1 | 12715698 | 2023-02-01 |
| 1001 | 9222f51a-9bad-11eb-a8a2-19ed5c03f8d3 | Account Name | distributed-departme-90 | 2 | 1996939 | 2024-07-12 |
| 1002 | 859ac854-9bad-11eb-a8a2-19ed5c03f8d3 | Saipan International Airport | baseline-departme-91 | 3 | 1050 | 2025-12-23 |
| 1003 | 57e4c59a-8fcd-11eb-924d-9cd76263cbd0 | Norma Fisher | pilot-departme-92 | 4 | 2087744 | 2022-05-07 |

The view `v_sales_administrator_sales_report` joins sales administrators with sales reports on `sales_administrator_id`, answering "which reports did which administrator file?" A row might show administrator `1000` (Theodore Mcgrath, salary grade `integrated-salary-88`) filing report `1202-0008-S` (25 calls, 31 new prospects, `Draft`).

**View `v_sales_administrator_sales_report`**

```sql
CREATE VIEW v_sales_administrator_sales_report AS
SELECT a.id, a.admin_id, a.full_name, a.department, b.id AS report_id, b.report_id AS report_report_id, b.report_date AS report_report_date
FROM sale_sales_administrators a JOIN sale_sales_reports b ON a.sales_report_id = b.id;
```

| id | admin_id | full_name | department | report_id | report_report_id | report_report_date |
|---|---|---|---|---|---|---|
| 1000 | 2986232 | Theodore Mcgrath | adaptive-departme-89 | 1000 | 1202-0008-S | 2024-03-02 |
| 1001 | 9222f51a-9bad-11eb-a8a2-19ed5c03f8d3 | Account Name | distributed-departme-90 | 1001 | 8189500 | 2025-08-13 |
| 1002 | 859ac854-9bad-11eb-a8a2-19ed5c03f8d3 | Saipan International Airport | baseline-departme-91 | 1002 | L355 | 2022-01-24 |
| 1003 | 57e4c59a-8fcd-11eb-924d-9cd76263cbd0 | Norma Fisher | pilot-departme-92 | 1003 | 5844272 | 2023-06-08 |

The view `v_marketing_manager_sales_administrator_detail` joins marketing managers with sales administrators on `marketing_manager_id`, answering "which administrators report to which manager?" A row might show marketing manager `f208f470-8fcd-11eb-924d-9cd76263cbd0` (Norma Fisher, department `pilot-departme-92`) supervising administrator `1003` (also Norma Fisher, department `pilot-departme-92`, weekly hours `67`).

**View `v_marketing_manager_sales_administrator_detail`**

```sql
CREATE VIEW v_marketing_manager_sales_administrator_detail AS
SELECT a.id, a.manager_id, a.full_name, b.id AS administrator_id, b.admin_id AS administrator_admin_id, b.full_name AS administrator_full_name
FROM sale_marketing_managers a
  JOIN sale_marketing_managersSalesAdministrator j ON j.marketing_manager_id = a.id
  JOIN sale_sales_administrators b ON b.id = j.sales_administrator_id;
```

| id | manager_id | full_name | administrator_id | administrator_admin_id | administrator_full_name |
|---|---|---|---|---|---|
| 1 | id_23 | Theodore Mcgrath | 1000 | 2986232 | Theodore Mcgrath |
| 1 | id_23 | Theodore Mcgrath | 1001 | 9222f51a-9bad-11eb-a8a2-19ed5c03f8d3 | Account Name |
| 2 | 10449531 | Account Name | 1001 | 9222f51a-9bad-11eb-a8a2-19ed5c03f8d3 | Account Name |
| 2 | 10449531 | Account Name | 1002 | 859ac854-9bad-11eb-a8a2-19ed5c03f8d3 | Saipan International Airport |
| 3 | 659 | Saipan International Airport | 1002 | 859ac854-9bad-11eb-a8a2-19ed5c03f8d3 | Saipan International Airport |
| 3 | 659 | Saipan International Airport | 1003 | 57e4c59a-8fcd-11eb-924d-9cd76263cbd0 | Norma Fisher |
| 4 | f208f470-8fcd-11eb-924d-9cd76263cbd0 | Norma Fisher | 1003 | 57e4c59a-8fcd-11eb-924d-9cd76263cbd0 | Norma Fisher |
| 4 | f208f470-8fcd-11eb-924d-9cd76263cbd0 | Norma Fisher | 1000 | 2986232 | Theodore Mcgrath |

### Synthesis

The relational schema materialises the sales ontology through a disciplined decomposition: six base tables encode the entity types and their attributes, with foreign-key columns capturing one-to-many and many-to-one relationships, and four junction tables capturing many-to-many associations. The views then reconstitute the domain by joining these tables along the foreign-key paths, each view answering a specific analytical question about the sales process. The result is a normalised, queryable representation that faithfully reflects the underlying conceptual model while supporting efficient access patterns for reporting and analysis. Every row value—from the `15,418` total amount of quotation `1050` to the `820` total calls in report `5844272`—is traceable through the join paths back to its originating entity, ensuring that the relational schema remains a faithful projection of the ontology.

## Data appendix

**Table `sale_sales_reportsSalesActivityRecord`**

| sales_report_id | sales_activity_record_id |
|---|---|
| 1000 | 100 |
| 1000 | 101 |
| 1001 | 101 |
| 1001 | 102 |
| 1002 | 102 |
| 1002 | 103 |
| 1003 | 103 |
| 1003 | 100 |

**Table `sale_sales_administratorsSalesActivityRecord`**

| sales_administrator_id | sales_activity_record_id |
|---|---|
| 1000 | 100 |
| 1000 | 101 |
| 1001 | 101 |
| 1001 | 102 |
| 1002 | 102 |
| 1002 | 103 |
| 1003 | 103 |
| 1003 | 100 |
