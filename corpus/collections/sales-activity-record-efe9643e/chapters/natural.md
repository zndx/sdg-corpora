The sales organization operates as a structured pipeline where prospective customers move through stages of engagement, each documented by activity records, quotations, and periodic reports. Sales administrators coordinate these activities under the oversight of marketing managers, and every interaction leaves a traceable record. The domain captures the full lifecycle: from initial lead capture through quotation issuance, activity tracking, and performance reporting. Understanding how these records interrelate requires examining both the individual tables that store raw data and the views that join them into coherent operational narratives.

## Sales Activity Records

The core operational unit is the sales activity record, which logs every discrete interaction between a sales administrator and a prospective customer. Each record carries a unique activity identifier, a timestamp, and a classification of the activity type.

**Table `sale_sales_activity_records`**

| id | activity_id | activity_date | activity_type | duration_minutes | outcome | notes | sales_administrator_id | prospective_customer_id | sales_report_id |
|---|---|---|---|---|---|---|---|---|---|
| 100 | 8843761 | 2024-11-08T22:30:00 | Telemarketing | 35 | Successful | extended-notes-75 | 1000 | 1 | 1000 |
| 101 | 4180957 | 2025-04-19T05:47:00 | Appointment Setting | 38 | Unsuccessful | integrated-notes-76 | 1001 | 2 | 1001 |
| 102 | 168545 | 2022-09-03T12:04:00 | Client Inquiry | 41 | Pending | seasonal-notes-77 | 1002 | 3 | 1002 |
| 103 | default_chart_a_account_53 | 2023-02-14T19:21:00 | Quotation Preparation | 44 | Successful | regional-notes-78 | 1003 | 4 | 1003 |

Activity types span the full range of sales engagement: telemarketing calls, appointment setting, client inquiries, and quotation preparation. The duration of each activity is measured in minutes, with examples ranging from thirty-five minutes for a telemarketing session to forty-four minutes for quotation preparation. Outcomes are categorized as Successful, Unsuccessful, or Pending, providing a straightforward measure of engagement effectiveness. The notes field captures extended context for each interaction, with entries such as "extended-notes-75" and "regional-notes-78" providing additional detail. Each activity record links to a specific sales administrator, a prospective customer, and optionally a sales report, forming the connective tissue of the entire system.

## Prospective Customers

Prospective customers represent the pipeline of potential business relationships. Each entry captures the company name, the designated contact person, and their communication details including email and phone number.

**Table `sale_prospective_customers`**

| id | customer_id | company_name | contact_person | contact_email | contact_phone | lead_source | status | quotation_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | Stephanie Lawrence | Feedback Rating | Alyssa Chung | Christopher Wilson | Joe Tsai | Business Directory | New | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | Bryan Larson | Virgin Group | Brianna Mejia | Charles Larsen | Stephanie Collins | Existing Client | Contacted | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | Allen Saunders | United Technologies | Eric Schultz | Mary Alvarez | Tasha Rodriguez | Other | Qualified | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | Francis Gulotta | Link Title | Peter Montgomery | April Snyder | Walter Pratt | Business Directory | Lost | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Lead sources vary, with entries such as "Business Directory" and "Existing Client" indicating how the relationship was initially established. The status field tracks the current stage of engagement, ranging from "New" through "Contacted" and "Qualified" to "Lost," providing a clear snapshot of pipeline health. For instance, Stephanie Lawrence at Feedback Rating holds a "New" status, while Francis Gulotta at Link Title has progressed to "Lost." Each prospective customer record also references a quotation, linking the customer profile to the commercial offer extended to them.

## Quotations

Quotations formalize the commercial proposals issued to prospective customers. Each quotation carries a unique identifier, issue and expiry dates, a total amount, and a status reflecting its current standing.

**Table `sale_quotations`**

| id | quotation_id | issue_date | expiry_date | total_amount | status | description | prospective_customer_id | sales_administrator_id | sales_activity_record_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 12715698 | 2023-02-01 | 2023-10-24 | 112.11 | Draft | Extended Survey | 1 | 1000 | 100 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | 1996939 | 2024-07-12 | 2024-03-08 | 1,979 | Sent | Pilot Corridor A | 2 | 1001 | 101 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | 1050 | 2025-12-23 | 2025-08-19 | 15,418 | Accepted | Baseline Series | 3 | 1002 | 102 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | 2087744 | 2022-05-07 | 2022-01-03 | 12,579 | Rejected | Distributed Assessment | 4 | 1003 | 103 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The total amounts span a wide range, from modest figures like 112.11 for the "Extended Survey" quotation to substantial commitments such as 15,418 for the "Baseline Series" quotation. Statuses include Draft, Sent, Accepted, and Rejected, providing a clear view of quotation outcomes. The description field offers a brief characterization of the offer, with entries like "Pilot Corridor A" and "Distributed Assessment" indicating the nature of the proposed engagement. Each quotation ties back to a prospective customer and a sales administrator, and references the underlying activity record that preceded it.

## Sales Reports

Sales reports aggregate performance metrics for individual sales administrators over defined periods. These reports provide a summary view of activity volume and outcomes.

**Table `sale_sales_reports`**

| id | report_id | report_date | total_calls | new_prospects | appointments_set | status | sales_administrator_id |
|---|---|---|---|---|---|---|---|
| 1000 | 1202-0008-S | 2024-03-02 | 25 | 31 | 16 | Draft | 1000 |
| 1001 | 8189500 | 2025-08-13 | 57 | 41 | 24 | Submitted | 1001 |
| 1002 | L355 | 2022-01-24 | 3 | 51 | 32 | Reviewed | 1002 |
| 1003 | 5844272 | 2023-06-08 | 820 | 61 | 40 | Draft | 1003 |

Report identifiers follow varied formats, from structured codes like "1202-0008-S" to simpler numeric strings like "8189500." The metrics captured include total calls made, new prospects generated, and appointments set. Theodore Mcgrath's report (1202-0008-S) shows 25 total calls and 31 new prospects, while Norma Fisher's report (5844272) reflects significantly higher activity with 820 total calls and 61 new prospects. Report statuses mirror those of other records: Draft, Submitted, and Reviewed, indicating the review cycle each report has undergone.

## Sales Administrators and Marketing Managers

Sales administrators are the frontline personnel who execute the activities, prepare quotations, and generate reports. Their records capture personal and organizational details.

**Table `sale_sales_administrators`**

| id | admin_id | full_name | department | office_location | weekly_hours | salary_grade | marketing_manager_id | quotation_id | sales_report_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 1000 | 2986232 | Theodore Mcgrath | adaptive-departme-89 | composite-office-99 | 43 | integrated-salary-88 | 1 | 1 | 1000 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 1001 | 9222f51a-9bad-11eb-a8a2-19ed5c03f8d3 | Account Name | distributed-departme-90 | primary-office-100 | 51 | seasonal-salary-89 | 2 | 2 | 1001 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 1002 | 859ac854-9bad-11eb-a8a2-19ed5c03f8d3 | Saipan International Airport | baseline-departme-91 | adaptive-office-101 | 59 | regional-salary-90 | 3 | 3 | 1002 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 1003 | 57e4c59a-8fcd-11eb-924d-9cd76263cbd0 | Norma Fisher | pilot-departme-92 | distributed-office-102 | 67 | legacy-salary-91 | 4 | 4 | 1003 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Administrators are assigned to departments such as "adaptive-departme-89" and "pilot-departme-92," with office locations like "composite-office-99" and "distributed-office-102." Weekly hours range from 43 to 67, and salary grades follow a structured naming convention. Each administrator record references a marketing manager, a quotation, and a sales report, embedding the administrator within the broader organizational structure.

Marketing managers provide oversight for the sales team.

**Table `sale_marketing_managers`**

| id | manager_id | full_name | department | office_location |
|---|---|---|---|---|
| 1 | id_23 | Theodore Mcgrath | adaptive-departme-89 | composite-office-99 |
| 2 | 10449531 | Account Name | distributed-departme-90 | primary-office-100 |
| 3 | 659 | Saipan International Airport | baseline-departme-91 | adaptive-office-101 |
| 4 | f208f470-8fcd-11eb-924d-9cd76263cbd0 | Norma Fisher | pilot-departme-92 | distributed-office-102 |

The marketing manager records mirror the organizational structure of the administrators they oversee, with matching department and office location values. Theodore Mcgrath appears in both the marketing manager and sales administrator tables, illustrating the potential for role overlap within the organization.

## Junction Records

The domain employs junction tables to manage many-to-many relationships between activity records and the other entities. These association tables ensure that a single activity can be linked to multiple prospective customers, sales reports, or sales administrators as needed.

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

The prospective customer to sales activity record junction enables flexible tracking of which customers participated in which activities. Similarly, the sales report to sales activity record junction allows a single report to encompass multiple activities.

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

The sales administrator to sales activity record junction provides the same flexibility for administrator assignments.

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

The marketing manager to sales administrator junction establishes the supervisory chain.

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

## Operational Views

The views synthesize the base tables into actionable narratives, each answering a specific operational question.

### Activity Record to Sales Administrator

The view joining activity records with their assigned administrators clarifies who executed each interaction.

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

This view answers the question of accountability: which administrator was responsible for each activity? Reading the joined data reveals that activity 8843761 (a telemarketing session) was handled by administrator 1000, while activity 4180957 (appointment setting) was managed by administrator 1001.

### Activity Record to Prospective Customer

This view maps every activity to the prospective customer it targeted.

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

The joined result shows that activity 168545 (a client inquiry) was directed at prospective customer 3, while activity default_chart_a_account_53 (quotation preparation) was associated with prospective customer 4. This linkage is essential for understanding which customers received which types of engagement.

### Activity Record to Sales Report

This view connects individual activities to the reports that aggregate them.

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

By joining these tables, the view reveals that activity 1000 contributed to sales report 1000, and activity 1001 fed into sales report 1001. This connection enables drill-down analysis from aggregate metrics to individual interactions.

### Prospective Customer with Activity Detail

This view enriches prospective customer records with their associated activity information.

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

The joined result provides a comprehensive view of each customer's engagement history. For prospective customer 1 (Stephanie Lawrence), the view surfaces the activities conducted on their behalf, enabling a full history of interactions in a single record.

### Prospective Customer with Quotation

This view links prospective customers directly to their quotations.

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

Reading this view, prospective customer 1 is associated with quotation 12715698 for 112.11, while prospective customer 3 is linked to quotation 1050 for 15,418. This relationship is critical for understanding the commercial progression from engagement to offer.

### Quotation to Prospective Customer

This view presents quotations from the customer's perspective, showing which customer each quotation was issued to.

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

The joined data confirms that quotation 12715698 was issued to prospective customer 1, and quotation 1996939 was issued to prospective customer 2. This bidirectional view ensures consistency between the customer and quotation records.

### Quotation to Sales Administrator

This view identifies which administrator prepared or managed each quotation.

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

The joined result shows that administrator 1000 managed quotation 12715698, while administrator 1001 handled quotation 1996939. This linkage is essential for attributing quotation outcomes to individual performance.

### Quotation to Sales Activity Record

This view connects quotations back to the activities that preceded them.

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

The joined data reveals that quotation 12715698 was preceded by activity record 100, and quotation 1996939 followed activity record 101. This temporal chain documents the progression from initial engagement to formal offer.

### Sales Report to Sales Administrator

This view links performance reports to their originating administrators.

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

The joined result confirms that report 1202-0008-S was generated by administrator 1000, and report 8189500 was generated by administrator 1001. This view is fundamental for performance evaluation and accountability.

### Sales Report with Activity Detail

This view enriches sales reports with the individual activities they encompass.

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

The joined result provides granular insight into how aggregate metrics are derived. For report 1202-0008-S, the view surfaces the specific activities that contributed to the 25 total calls and 31 new prospects, enabling detailed performance analysis.

### Sales Administrator to Marketing Manager

This view establishes the supervisory relationship between administrators and their overseeing managers.

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

The joined data shows that administrator 1000 (Theodore Mcgrath) is overseen by marketing manager 1, and administrator 1003 (Norma Fisher) reports to marketing manager 4. This view clarifies the organizational hierarchy and reporting lines.

### Sales Administrator with Activity Detail

This view provides a comprehensive record of all activities handled by each administrator.

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

The joined result enables performance tracking at the individual level. For administrator 1000, the view surfaces all activities they conducted, their durations, outcomes, and associated customers, providing a complete picture of their operational output.

### Sales Administrator with Quotation

This view links administrators to the quotations they managed.

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

The joined data shows that administrator 1000 managed quotation 12715698, and administrator 1002 handled quotation 1050. This view is essential for attributing quotation success or failure to individual administrators.

### Sales Administrator with Sales Report

This view connects administrators to their submitted reports.

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

The joined result confirms that administrator 1000 submitted report 1202-0008-S, and administrator 1001 submitted report 8189500. This linkage supports performance review and administrative oversight.

### Marketing Manager with Sales Administrator Detail

This view provides marketing managers with a comprehensive overview of their team's activities.

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

The joined result enables managerial oversight at scale. For marketing manager 1, the view surfaces all administrators under their supervision along with their activity records, quotations, and reports, providing a consolidated dashboard for team management.

## Synthesis

The sales domain captures a complete operational ecosystem where every interaction, offer, and report is traceable to the personnel responsible. Sales activity records serve as the atomic unit of engagement, linking administrators to prospective customers and feeding into both quotations and periodic reports. The junction tables provide the flexibility needed for complex many-to-many relationships, while the views synthesize these relationships into actionable narratives. From the initial lead captured in a prospective customer record through the final quotation status and the aggregated metrics in a sales report, the system maintains a coherent chain of evidence. Marketing managers can trace performance from the top down, administrators can review their own activity histories, and the organization as a whole can analyze pipeline progression with precision.