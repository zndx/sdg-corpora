## The Auto Repair Shop Domain

An auto repair shop operates as a network of interconnected entities: facilities that accept service requests, technicians who perform the work, vehicles that require attention, customers who own those vehicles, and invoices that formalize the financial exchange. Understanding this domain requires tracing how a service request moves from a customer's initial visit through diagnostic assessment, repair execution, and final billing. Each stage leaves a record, and the relationships between those records form the operational backbone of the business.

**Table `auto_repair_shops`**

| auto_repair_shop_id | shop_id | shop_name | established_date | shop_type | daily_production_target | customer_satisfaction_score | is_profitable | customer_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 3717615 | Regional Initiative | 2024-03-27 | repair_shop | 8.95 | 16.20 | true | 1 |
| 2 | 9bb5de9a-8fcc-11eb-924d-9cd76263cbd0 | Seasonal Model D | 2025-08-11 | franchise | 12.90 | 18.40 | false | 2 |
| 3 | 3001009030060 | Integrated Cluster | 2022-01-22 | quick_lube | 16.85 | 20.60 | true | 3 |
| 4 | 505989 | Extended Review | 2023-06-06 | repair_shop | 20.80 | 22.80 | false | 4 |

The foundation of the operation is the repair shop itself. Each shop carries a unique identifier and a name that distinguishes it within the portfolio—Regional Initiative, Seasonal Model D, Integrated Cluster, and Extended Review are four examples. Shops are classified by type: repair_shop, franchise, or quick_lube—labels that signal the scope of services offered. Operational metrics are tracked at the shop level. The daily production target measures expected output, ranging from 8.95 to 20.80 units across the sample. Customer satisfaction scores, recorded as decimal values between 16.20 and 22.80, provide a performance indicator. The profitability flag offers a binary snapshot of financial health, with two shops in the sample marked as profitable and two as not.

**Table `technicians`**

| technician_id | tech_id | full_name | hourly_rate | skill_level | is_owner | daily_tasks_completed | auto_repair_shop_id | repair_job_id |
|---|---|---|---|---|---|---|---|---|
| 1 | b350e544-8fcd-11eb-924d-9cd76263cbd0 | Theodore Mcgrath | 13.45 | entry_level | Nathaniel Hood | 4 | 1 | 1000 |
| 2 | 7441163 | Account Name | 17.90 | basic | Michelle Kelley | 8 | 2 | 1001 |
| 3 | 2839497 | Saipan International Airport | 22.35 | master | Kimberly Maynard | 12 | 3 | 1002 |
| 4 | 9125641 | Norma Fisher | 26.80 | entry_level | Theodore Mcgrath | 16 | 4 | 1003 |

Technicians are the human resource at the center of repair execution. Each technician record captures an identifier, a full name, an hourly rate, and a skill level. Skill levels in the sample include entry_level, basic, and master, forming a clear hierarchy. The hourly rate scales with expertise, from $13.45 for Theodore Mcgrath at entry level to $26.80 for Norma Fisher, also at entry level, suggesting that rate may reflect additional factors beyond the recorded skill tier. The is_owner field indicates ownership status, storing the name of the owner rather than a simple boolean. Daily tasks completed provides a productivity measure, with values ranging from 4 to 16 tasks per day. Each technician is associated with a shop and may be assigned to a repair job.

**Table `shops_technicians`**

| auto_repair_shop_id | technician_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

The relationship between shops and technicians is managed through a dedicated junction table. This structure allows a technician to be linked to a shop independently of any specific repair assignment, establishing the employment or affiliation relationship that underpins daily operations.

**Table `repair_jobs`**

| id | job_id | job_type | start_time | end_time | labor_cost | parts_cost | status | technician_id | vehicle_id | invoice_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1000 | template_ivacode_pagata_art15 | oil_change | 2024-03-27T14:42:00 | 2023-02-26T13:27:00 | 16.54 | 25.36 | pending | 1 | 1000 | 9125631 |
| 1001 | analytical-thinking | brake_repair | 2025-08-11T21:59:00 | 2024-07-10T20:44:00 | 35.61 | 14.31 | in_progress | 2 | 1001 | 4985154 |
| 1002 | BJibe | engine_diagnostic | 2022-01-22T04:16:00 | 2025-12-21T03:01:00 | 12.72 | 24.01 | complete | 3 | 1002 | 726063 |
| 1003 | 325469 | transmission_repair | 2023-06-06T11:33:00 | 2022-05-05T10:18:00 | 33.06 | 17.41 | failed | 4 | 1003 | e604b688-8fd1-11eb-924d-9cd76263cbd0 |

A repair job represents the core service transaction. Each job has a type—oil_change, brake_repair, engine_diagnostic, or transmission_repair—defining the scope of work. The job lifecycle is tracked through timestamps: start_time and end_time mark the operational window, though in practice these dates may not always follow chronological order, reflecting real-world scheduling complexities. Costs are itemized into labor_cost and parts_cost, with labor ranging from $12.72 to $35.61 and parts from $14.31 to $25.36 in the sample. The status field records the current state of the job: pending, in_progress, complete, or failed. Each job is assigned to a technician and linked to a specific vehicle.

**Table `vehicles`**

| id | vin | make | model | year | mileage | customer_name | customer_id | repair_job_id | created_at |
|---|---|---|---|---|---|---|---|---|---|
| 1000 | legacy-vin-25 | extended-make-81 | composite-model-81 | 12 | 20 | Susan Wagner | 1 | 1000 | 2025-01-01 00:14:00 |
| 1001 | compact-vin-26 | integrated-make-82 | primary-model-82 | 21 | 29 | Norma Fisher | 2 | 1001 | 2025-02-06 03:14:00 |
| 1002 | composite-vin-27 | seasonal-make-83 | adaptive-model-83 | 30 | 38 | Peter Anthony | 3 | 1002 | 2025-03-11 06:14:00 |
| 1003 | primary-vin-28 | regional-make-84 | distributed-model-84 | 39 | 47 | Bobby Flores | 4 | 1003 | 2025-04-16 09:14:00 |

Vehicles are the objects of service. Each record contains a VIN, make, model, year, and mileage. The year values in the sample are notably low—12, 21, 30, 39—suggesting encoded or abbreviated year representations rather than calendar years. Mileage ranges from 20 to 47 thousand miles. Each vehicle is associated with a customer and may have an active repair job.

**Table `customers`**

| id | customer_id | full_name | contact_phone | email_address | total_visits | satisfaction_rating | vehicle_id | invoice_id |
|---|---|---|---|---|---|---|---|---|
| 1 | Stephanie Lawrence | Theodore Mcgrath | Joe Tsai | primary-email-70 | 2 | 11.45 | 1000 | 9125631 |
| 2 | Bryan Larson | Account Name | Stephanie Collins | adaptive-email-71 | 40 | 13.90 | 1001 | 4985154 |
| 3 | Allen Saunders | Saipan International Airport | Tasha Rodriguez | distributed-email-72 | 16 | 16.35 | 1002 | 726063 |
| 4 | Francis Gulotta | Norma Fisher | Walter Pratt | baseline-email-73 | 23 | 18.80 | 1003 | e604b688-8fd1-11eb-924d-9cd76263cbd0 |

Customers are the individuals who bring vehicles for service. Each customer record includes a full name, contact phone, email address, and a count of total visits, which ranges from 2 to 40 visits in the sample. The satisfaction rating, recorded as a decimal value between 11.45 and 18.80, provides a measure of customer experience. Each customer is linked to a vehicle and may have associated invoices.

**Table `invoices`**

| invoice_id | issue_date | total_amount | tax_amount | payment_status | due_date | repair_job_id | customer_id | created_at |
|---|---|---|---|---|---|---|---|---|
| 9125631 | 2023-02-01 | 112.11 | 4,590 | pending | 2024-11-11 | 1000 | 1 | 2025-01-01 00:14:00 |
| 4985154 | 2024-07-12 | 1,979 | 0.18 | paid | 2025-04-22 | 1001 | 2 | 2025-02-06 03:14:00 |
| 726063 | 2025-12-23 | 15,418 | 763.46 | overdue | 2022-09-06 | 1002 | 3 | 2025-03-11 06:14:00 |
| e604b688-8fd1-11eb-924d-9cd76263cbd0 | 2022-05-07 | 12,579 | 13,393 | pending | 2023-02-17 | 1003 | 4 | 2025-04-16 09:14:00 |

Invoices formalize the financial side of the repair transaction. Each invoice carries an issue date, a total amount, and a tax amount. Total amounts vary widely, from $112.11 to $15,418.00, reflecting the diversity of repair scopes. Payment status is tracked as pending, paid, or overdue, with the sample showing all three states represented. A due date establishes the payment deadline, which may precede or follow the issue date. Each invoice is linked to a repair job and a customer.

## Operational Views

The domain's relationships become most visible through joined views, which answer specific operational questions by combining data from multiple tables.

**View `vw_auto_repair_shop_technician_detail`**

```sql
CREATE VIEW vw_auto_repair_shop_technician_detail AS
SELECT a.auto_repair_shop_id, a.shop_id, a.shop_name, b.technician_id AS technician_technician_id, b.tech_id AS technician_tech_id, b.full_name AS technician_full_name
FROM auto_repair_shops a
  JOIN shops_technicians j ON j.auto_repair_shop_id = a.auto_repair_shop_id
  JOIN technicians b ON b.technician_id = j.technician_id;
```

| auto_repair_shop_id | shop_id | shop_name | technician_technician_id | technician_tech_id | technician_full_name |
|---|---|---|---|---|---|
| 1 | 3717615 | Regional Initiative | 1 | b350e544-8fcd-11eb-924d-9cd76263cbd0 | Theodore Mcgrath |
| 1 | 3717615 | Regional Initiative | 2 | 7441163 | Account Name |
| 2 | 9bb5de9a-8fcc-11eb-924d-9cd76263cbd0 | Seasonal Model D | 2 | 7441163 | Account Name |
| 2 | 9bb5de9a-8fcc-11eb-924d-9cd76263cbd0 | Seasonal Model D | 3 | 2839497 | Saipan International Airport |
| 3 | 3001009030060 | Integrated Cluster | 3 | 2839497 | Saipan International Airport |
| 3 | 3001009030060 | Integrated Cluster | 4 | 9125641 | Norma Fisher |
| 4 | 505989 | Extended Review | 4 | 9125641 | Norma Fisher |
| 4 | 505989 | Extended Review | 1 | b350e544-8fcd-11eb-924d-9cd76263cbd0 | Theodore Mcgrath |

This view connects shops to their technicians, answering which technicians are affiliated with which facilities. It reveals the staffing structure of each shop, showing how human resources are distributed across the organization.

**View `vw_auto_repair_shop_customer`**

```sql
CREATE VIEW vw_auto_repair_shop_customer AS
SELECT a.auto_repair_shop_id, a.shop_id, a.shop_name, a.established_date, b.id AS customer_id, b.customer_id AS customer_customer_id, b.full_name AS customer_full_name
FROM auto_repair_shops a JOIN customers b ON a.customer_id = b.id;
```

| auto_repair_shop_id | shop_id | shop_name | established_date | customer_id | customer_customer_id | customer_full_name |
|---|---|---|---|---|---|---|
| 1 | 3717615 | Regional Initiative | 2024-03-27 | 1 | Stephanie Lawrence | Theodore Mcgrath |
| 2 | 9bb5de9a-8fcc-11eb-924d-9cd76263cbd0 | Seasonal Model D | 2025-08-11 | 2 | Bryan Larson | Account Name |
| 3 | 3001009030060 | Integrated Cluster | 2022-01-22 | 3 | Allen Saunders | Saipan International Airport |
| 4 | 505989 | Extended Review | 2023-06-06 | 4 | Francis Gulotta | Norma Fisher |

By joining shops with customers, this view answers which customers have engaged with which shops. It provides a customer-to-shop mapping that supports analysis of customer loyalty and shop-level demand patterns.

**View `vw_technician_auto_repair_shop`**

```sql
CREATE VIEW vw_technician_auto_repair_shop AS
SELECT a.technician_id, a.tech_id, a.full_name, a.hourly_rate, b.auto_repair_shop_id AS shop_auto_repair_shop_id, b.shop_id AS shop_shop_id, b.shop_name AS shop_shop_name
FROM technicians a JOIN auto_repair_shops b ON a.auto_repair_shop_id = b.auto_repair_shop_id;
```

| technician_id | tech_id | full_name | hourly_rate | shop_auto_repair_shop_id | shop_shop_id | shop_shop_name |
|---|---|---|---|---|---|---|
| 1 | b350e544-8fcd-11eb-924d-9cd76263cbd0 | Theodore Mcgrath | 13.45 | 1 | 3717615 | Regional Initiative |
| 2 | 7441163 | Account Name | 17.90 | 2 | 9bb5de9a-8fcc-11eb-924d-9cd76263cbd0 | Seasonal Model D |
| 3 | 2839497 | Saipan International Airport | 22.35 | 3 | 3001009030060 | Integrated Cluster |
| 4 | 9125641 | Norma Fisher | 26.80 | 4 | 505989 | Extended Review |

This view presents the technician-to-shop relationship from the technician's perspective, listing each technician alongside their affiliated shop. It supports workforce planning and capacity analysis by showing the shop-level distribution of technical staff.

**View `vw_technician_repair_job`**

```sql
CREATE VIEW vw_technician_repair_job AS
SELECT a.technician_id, a.tech_id, a.full_name, a.hourly_rate, b.id AS job_id, b.job_id AS job_job_id, b.job_type AS job_job_type
FROM technicians a JOIN repair_jobs b ON a.repair_job_id = b.id;
```

| technician_id | tech_id | full_name | hourly_rate | job_id | job_job_id | job_job_type |
|---|---|---|---|---|---|---|
| 1 | b350e544-8fcd-11eb-924d-9cd76263cbd0 | Theodore Mcgrath | 13.45 | 1000 | template_ivacode_pagata_art15 | oil_change |
| 2 | 7441163 | Account Name | 17.90 | 1001 | analytical-thinking | brake_repair |
| 3 | 2839497 | Saipan International Airport | 22.35 | 1002 | BJibe | engine_diagnostic |
| 4 | 9125641 | Norma Fisher | 26.80 | 1003 | 325469 | transmission_repair |

This view links technicians to their assigned repair jobs, answering which technician is responsible for which service. It is essential for workload management, performance tracking, and accountability. A technician like Theodore Mcgrath (technician_id 1) can be traced to job 1000, an oil_change with a labor cost of $16.54.

**View `vw_repair_job_technician`**

```sql
CREATE VIEW vw_repair_job_technician AS
SELECT a.id, a.job_id, a.job_type, a.start_time, b.technician_id AS technician_technician_id, b.tech_id AS technician_tech_id, b.full_name AS technician_full_name
FROM repair_jobs a JOIN technicians b ON a.technician_id = b.technician_id;
```

| id | job_id | job_type | start_time | technician_technician_id | technician_tech_id | technician_full_name |
|---|---|---|---|---|---|---|
| 1000 | template_ivacode_pagata_art15 | oil_change | 2024-03-27T14:42:00 | 1 | b350e544-8fcd-11eb-924d-9cd76263cbd0 | Theodore Mcgrath |
| 1001 | analytical-thinking | brake_repair | 2025-08-11T21:59:00 | 2 | 7441163 | Account Name |
| 1002 | BJibe | engine_diagnostic | 2022-01-22T04:16:00 | 3 | 2839497 | Saipan International Airport |
| 1003 | 325469 | transmission_repair | 2023-06-06T11:33:00 | 4 | 9125641 | Norma Fisher |

The inverse of the previous view, this perspective starts from the repair job and identifies the assigned technician. It supports job-level queries where the primary question is "who is working on this?"

**View `vw_repair_job_vehicle`**

```sql
CREATE VIEW vw_repair_job_vehicle AS
SELECT a.id, a.job_id, a.job_type, a.start_time, b.id AS vehicle_id, b.vin AS vehicle_vin, b.make AS vehicle_make
FROM repair_jobs a JOIN vehicles b ON a.vehicle_id = b.id;
```

| id | job_id | job_type | start_time | vehicle_id | vehicle_vin | vehicle_make |
|---|---|---|---|---|---|---|
| 1000 | template_ivacode_pagata_art15 | oil_change | 2024-03-27T14:42:00 | 1000 | legacy-vin-25 | extended-make-81 |
| 1001 | analytical-thinking | brake_repair | 2025-08-11T21:59:00 | 1001 | compact-vin-26 | integrated-make-82 |
| 1002 | BJibe | engine_diagnostic | 2022-01-22T04:16:00 | 1002 | composite-vin-27 | seasonal-make-83 |
| 1003 | 325469 | transmission_repair | 2023-06-06T11:33:00 | 1003 | primary-vin-28 | regional-make-84 |

This view connects repair jobs to the vehicles being serviced, answering which vehicle is undergoing which type of repair. For example, vehicle 1000 (with VIN legacy-vin-25) is associated with repair job 1000, an oil_change. This relationship is critical for tracking vehicle service history and maintenance schedules.

**View `vw_repair_job_invoice`**

```sql
CREATE VIEW vw_repair_job_invoice AS
SELECT a.id, a.job_id, a.job_type, a.start_time, b.invoice_id AS invoice_invoice_id, b.issue_date AS invoice_issue_date, b.total_amount AS invoice_total_amount
FROM repair_jobs a JOIN invoices b ON a.invoice_id = b.invoice_id;
```

| id | job_id | job_type | start_time | invoice_invoice_id | invoice_issue_date | invoice_total_amount |
|---|---|---|---|---|---|---|
| 1000 | template_ivacode_pagata_art15 | oil_change | 2024-03-27T14:42:00 | 9125631 | 2023-02-01 | 112.11 |
| 1001 | analytical-thinking | brake_repair | 2025-08-11T21:59:00 | 4985154 | 2024-07-12 | 1,979 |
| 1002 | BJibe | engine_diagnostic | 2022-01-22T04:16:00 | 726063 | 2025-12-23 | 15,418 |
| 1003 | 325469 | transmission_repair | 2023-06-06T11:33:00 | e604b688-8fd1-11eb-924d-9cd76263cbd0 | 2022-05-07 | 12,579 |

By linking repair jobs to their invoices, this view answers the financial question: "what was charged for this repair?" Job 1000, an oil_change with labor cost $16.54 and parts cost $25.36, maps to invoice 9125631 with a total amount of $112.11. The view supports reconciliation between service delivery and billing.

**View `vw_vehicle_customer`**

```sql
CREATE VIEW vw_vehicle_customer AS
SELECT a.id, a.vin, a.make, a.model, b.id AS customer_id, b.customer_id AS customer_customer_id, b.full_name AS customer_full_name
FROM vehicles a JOIN customers b ON a.customer_id = b.id;
```

| id | vin | make | model | customer_id | customer_customer_id | customer_full_name |
|---|---|---|---|---|---|---|
| 1000 | legacy-vin-25 | extended-make-81 | composite-model-81 | 1 | Stephanie Lawrence | Theodore Mcgrath |
| 1001 | compact-vin-26 | integrated-make-82 | primary-model-82 | 2 | Bryan Larson | Account Name |
| 1002 | composite-vin-27 | seasonal-make-83 | adaptive-model-83 | 3 | Allen Saunders | Saipan International Airport |
| 1003 | primary-vin-28 | regional-make-84 | distributed-model-84 | 4 | Francis Gulotta | Norma Fisher |

This view connects vehicles to their owners, answering which customer owns which vehicle. It is the foundation for customer communication, service reminders, and ownership-based analytics. Vehicle 1000, a composite-model-81, is linked to customer Stephanie Lawrence.

**View `vw_vehicle_repair_job`**

```sql
CREATE VIEW vw_vehicle_repair_job AS
SELECT a.id, a.vin, a.make, a.model, b.id AS job_id, b.job_id AS job_job_id, b.job_type AS job_job_type
FROM vehicles a JOIN repair_jobs b ON a.repair_job_id = b.id;
```

| id | vin | make | model | job_id | job_job_id | job_job_type |
|---|---|---|---|---|---|---|
| 1000 | legacy-vin-25 | extended-make-81 | composite-model-81 | 1000 | template_ivacode_pagata_art15 | oil_change |
| 1001 | compact-vin-26 | integrated-make-82 | primary-model-82 | 1001 | analytical-thinking | brake_repair |
| 1002 | composite-vin-27 | seasonal-make-83 | adaptive-model-83 | 1002 | BJibe | engine_diagnostic |
| 1003 | primary-vin-28 | regional-make-84 | distributed-model-84 | 1003 | 325469 | transmission_repair |

The inverse of the repair-job-to-vehicle view, this perspective starts from the vehicle and lists its repair history. It supports vehicle-centric queries such as "what repairs has this vehicle received?" and "how often does this vehicle require service?"

**View `vw_customer_vehicle`**

```sql
CREATE VIEW vw_customer_vehicle AS
SELECT a.id, a.customer_id, a.full_name, a.contact_phone, b.id AS vehicle_id, b.vin AS vehicle_vin, b.make AS vehicle_make
FROM customers a JOIN vehicles b ON a.vehicle_id = b.id;
```

| id | customer_id | full_name | contact_phone | vehicle_id | vehicle_vin | vehicle_make |
|---|---|---|---|---|---|---|
| 1 | Stephanie Lawrence | Theodore Mcgrath | Joe Tsai | 1000 | legacy-vin-25 | extended-make-81 |
| 2 | Bryan Larson | Account Name | Stephanie Collins | 1001 | compact-vin-26 | integrated-make-82 |
| 3 | Allen Saunders | Saipan International Airport | Tasha Rodriguez | 1002 | composite-vin-27 | seasonal-make-83 |
| 4 | Francis Gulotta | Norma Fisher | Walter Pratt | 1003 | primary-vin-28 | regional-make-84 |

Presenting the customer-to-vehicle relationship from the customer's side, this view answers which vehicles belong to which customer. It supports fleet analysis for customers who may own multiple vehicles and enables personalized service recommendations.

**View `vw_customer_invoice`**

```sql
CREATE VIEW vw_customer_invoice AS
SELECT a.id, a.customer_id, a.full_name, a.contact_phone, b.invoice_id AS invoice_invoice_id, b.issue_date AS invoice_issue_date, b.total_amount AS invoice_total_amount
FROM customers a JOIN invoices b ON a.invoice_id = b.invoice_id;
```

| id | customer_id | full_name | contact_phone | invoice_invoice_id | invoice_issue_date | invoice_total_amount |
|---|---|---|---|---|---|---|
| 1 | Stephanie Lawrence | Theodore Mcgrath | Joe Tsai | 9125631 | 2023-02-01 | 112.11 |
| 2 | Bryan Larson | Account Name | Stephanie Collins | 4985154 | 2024-07-12 | 1,979 |
| 3 | Allen Saunders | Saipan International Airport | Tasha Rodriguez | 726063 | 2025-12-23 | 15,418 |
| 4 | Francis Gulotta | Norma Fisher | Walter Pratt | e604b688-8fd1-11eb-924d-9cd76263cbd0 | 2022-05-07 | 12,579 |

This view links customers to their invoices, answering which customer has received which invoice. It supports financial tracking at the customer level, enabling analysis of spending patterns and payment behavior. Customer 2, Bryan Larson, is linked to invoice 4985154, which shows a paid status and a total of $1,979.00.

**View `vw_invoice_repair_job`**

```sql
CREATE VIEW vw_invoice_repair_job AS
SELECT a.invoice_id, a.issue_date, a.total_amount, a.tax_amount, b.id AS job_id, b.job_id AS job_job_id, b.job_type AS job_job_type
FROM invoices a JOIN repair_jobs b ON a.repair_job_id = b.id;
```

| invoice_id | issue_date | total_amount | tax_amount | job_id | job_job_id | job_job_type |
|---|---|---|---|---|---|---|
| 9125631 | 2023-02-01 | 112.11 | 4,590 | 1000 | template_ivacode_pagata_art15 | oil_change |
| 4985154 | 2024-07-12 | 1,979 | 0.18 | 1001 | analytical-thinking | brake_repair |
| 726063 | 2025-12-23 | 15,418 | 763.46 | 1002 | BJibe | engine_diagnostic |
| e604b688-8fd1-11eb-924d-9cd76263cbd0 | 2022-05-07 | 12,579 | 13,393 | 1003 | 325469 | transmission_repair |

Starting from the invoice, this view identifies the associated repair job, answering "what service does this invoice cover?" It is essential for billing inquiries and dispute resolution, where the primary reference is the invoice number.

**View `vw_invoice_customer`**

```sql
CREATE VIEW vw_invoice_customer AS
SELECT a.invoice_id, a.issue_date, a.total_amount, a.tax_amount, b.id AS customer_id, b.customer_id AS customer_customer_id, b.full_name AS customer_full_name
FROM invoices a JOIN customers b ON a.customer_id = b.id;
```

| invoice_id | issue_date | total_amount | tax_amount | customer_id | customer_customer_id | customer_full_name |
|---|---|---|---|---|---|---|
| 9125631 | 2023-02-01 | 112.11 | 4,590 | 1 | Stephanie Lawrence | Theodore Mcgrath |
| 4985154 | 2024-07-12 | 1,979 | 0.18 | 2 | Bryan Larson | Account Name |
| 726063 | 2025-12-23 | 15,418 | 763.46 | 3 | Allen Saunders | Saipan International Airport |
| e604b688-8fd1-11eb-924d-9cd76263cbd0 | 2022-05-07 | 12,579 | 13,393 | 4 | Francis Gulotta | Norma Fisher |

This view connects invoices to their customers, answering "who is responsible for this invoice?" It supports accounts receivable management, payment follow-up, and customer billing history. Invoice 726063, with an overdue status and total of $15,418.00, is linked to customer 3, Allen Saunders.

## Synthesis

The auto repair shop domain is defined by a set of interlocking relationships that span from facility management to individual customer transactions. Shops employ technicians, who perform repair jobs on vehicles owned by customers, with invoices formalizing the financial outcome. Each entity carries its own attributes—shop types, skill levels, job statuses, payment states—while the foreign-key relationships bind them into a coherent operational model. The views derived from these relationships answer the practical questions that managers, technicians, and accountants need to resolve daily: who is working on what, which customer owns which vehicle, and whether the bill has been paid. Together, the tables and views form a complete record of the repair shop's operations, capturing both the structural organization of the business and the transactional details of each service interaction.