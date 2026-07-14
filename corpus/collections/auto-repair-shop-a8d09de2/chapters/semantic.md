## Domain Modelling in the Auto Repair Management System

The auto repair management domain captures the operational lifecycle of a service facility: shops employ technicians, customers bring vehicles for repair, jobs are performed and invoiced, and satisfaction is tracked across every touchpoint. The relational schema normalises this lifecycle into six base tables and a junction table, with foreign keys encoding one-to-many and many-to-many relationships. A set of twelve materialised views then re-assembles the normalised facts into domain-readable narratives — for example, which technician worked on which vehicle, or which customer incurred which invoice. The following sections walk through the entity types, their attributes, the cardinality-bounded relationships that become columns and foreign keys, and the join logic that each view executes.

**Table `auto_repair_shops`**

| auto_repair_shop_id | shop_id | shop_name | established_date | shop_type | daily_production_target | customer_satisfaction_score | is_profitable | customer_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 3717615 | Regional Initiative | 2024-03-27 | repair_shop | 8.95 | 16.20 | true | 1 |
| 2 | 9bb5de9a-8fcc-11eb-924d-9cd76263cbd0 | Seasonal Model D | 2025-08-11 | franchise | 12.90 | 18.40 | false | 2 |
| 3 | 3001009030060 | Integrated Cluster | 2022-01-22 | quick_lube | 16.85 | 20.60 | true | 3 |
| 4 | 505989 | Extended Review | 2023-06-06 | repair_shop | 20.80 | 22.80 | false | 4 |

The `auto_repair_shops` table is the organisational anchor. Each row represents a service location identified by a surrogate primary key `auto_repair_shop_id` and a business-facing `shop_id` (a UUID or integer depending on the franchise). The `shop_name` column carries human-readable identifiers such as *Regional Initiative* or *Seasonal Model D*, while `shop_type` classifies the location as `repair_shop`, `franchise`, or `quick_lube`. Operational metrics — `daily_production_target` (e.g. `8.95` for shop 1, `20.80` for shop 4), `customer_satisfaction_score` (ranging from `16.20` to `22.80`), and the boolean `is_profitable` flag — are stored as denormalised aggregates. The column `customer_id` is a foreign key pointing to the `customers` table, establishing a one-to-many relationship: a single shop can serve many customers, but each customer row in the base table references exactly one shop.

**Table `technicians`**

| technician_id | tech_id | full_name | hourly_rate | skill_level | is_owner | daily_tasks_completed | auto_repair_shop_id | repair_job_id |
|---|---|---|---|---|---|---|---|---|
| 1 | b350e544-8fcd-11eb-924d-9cd76263cbd0 | Theodore Mcgrath | 13.45 | entry_level | Nathaniel Hood | 4 | 1 | 1000 |
| 2 | 7441163 | Account Name | 17.90 | basic | Michelle Kelley | 8 | 2 | 1001 |
| 3 | 2839497 | Saipan International Airport | 22.35 | master | Kimberly Maynard | 12 | 3 | 1002 |
| 4 | 9125641 | Norma Fisher | 26.80 | entry_level | Theodore Mcgrath | 16 | 4 | 1003 |

Technicians are the human resources of the domain. The `technicians` table uses `technician_id` as its surrogate primary key and stores a business identifier `tech_id` alongside the employee's `full_name` (e.g. *Theodore Mcgrath*, *Michelle Kelley*). The `hourly_rate` column (values such as `13.45` and `26.80`) and `skill_level` (categorical values: `entry_level`, `basic`, `master`) describe compensation and competence. The `is_owner` column is a free-text field in the current schema that stores the name of a supervisory owner (e.g. *Nathaniel Hood*, *Theodore Mcgrath*). The integer column `daily_tasks_completed` tracks throughput, while `auto_repair_shop_id` is a foreign key linking the technician to their employing shop — a many-to-one relationship, since multiple technicians belong to one shop. The column `repair_job_id` is a foreign key to `repair_jobs`, creating a direct association between a technician and the job they are assigned to.

**Table `repair_jobs`**

| id | job_id | job_type | start_time | end_time | labor_cost | parts_cost | status | technician_id | vehicle_id | invoice_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1000 | template_ivacode_pagata_art15 | oil_change | 2024-03-27T14:42:00 | 2023-02-26T13:27:00 | 16.54 | 25.36 | pending | 1 | 1000 | 9125631 |
| 1001 | analytical-thinking | brake_repair | 2025-08-11T21:59:00 | 2024-07-10T20:44:00 | 35.61 | 14.31 | in_progress | 2 | 1001 | 4985154 |
| 1002 | BJibe | engine_diagnostic | 2022-01-22T04:16:00 | 2025-12-21T03:01:00 | 12.72 | 24.01 | complete | 3 | 1002 | 726063 |
| 1003 | 325469 | transmission_repair | 2023-06-06T11:33:00 | 2022-05-05T10:18:00 | 33.06 | 17.41 | failed | 4 | 1003 | e604b688-8fd1-11eb-924d-9cd76263cbd0 |

The `repair_jobs` table is the central transactional entity. Its surrogate primary key `id` (values `1000` through `1003`) is distinct from the business-facing `job_id` column, which carries identifiers such as `template_ivacode_pagata_art15` or `analytical-thinking`. The `job_type` column enumerates the service category (`oil_change`, `brake_repair`, `engine_diagnostic`, `transmission_repair`), while `start_time` and `end_time` are ISO-8601 timestamps that record the job window. Cost columns `labor_cost` and `parts_cost` (e.g. `16.54` and `25.36` for job 1000) are stored separately to support itemised billing. The `status` column is an enumerated state machine with values `pending`, `in_progress`, `complete`, and `failed`. Three foreign keys anchor the job to the rest of the domain: `technician_id` references `technicians`, `vehicle_id` references `vehicles`, and `invoice_id` references `invoices`. Each repair job is performed by exactly one technician on exactly one vehicle and generates exactly one invoice — a three-way many-to-one relationship.

**Table `vehicles`**

| id | vin | make | model | year | mileage | customer_name | customer_id | repair_job_id | created_at |
|---|---|---|---|---|---|---|---|---|---|
| 1000 | legacy-vin-25 | extended-make-81 | composite-model-81 | 12 | 20 | Susan Wagner | 1 | 1000 | 2025-01-01 00:14:00 |
| 1001 | compact-vin-26 | integrated-make-82 | primary-model-82 | 21 | 29 | Norma Fisher | 2 | 1001 | 2025-02-06 03:14:00 |
| 1002 | composite-vin-27 | seasonal-make-83 | adaptive-model-83 | 30 | 38 | Peter Anthony | 3 | 1002 | 2025-03-11 06:14:00 |
| 1003 | primary-vin-28 | regional-make-84 | distributed-model-84 | 39 | 47 | Bobby Flores | 4 | 1003 | 2025-04-16 09:14:00 |

Vehicles represent the assets brought into the shop. The surrogate primary key `id` (values `1000` through `1003`) is paired with a business identifier `vin` (e.g. `legacy-vin-25`, `compact-vin-26`). The `make` and `model` columns store categorical identifiers such as *extended-make-81* and *composite-model-81*, while `year` and `mileage` are integer attributes (e.g. year `12`, mileage `20` for vehicle 1000). The denormalised `customer_name` column (e.g. *Susan Wagner*, *Norma Fisher*) and the foreign key `customer_id` link the vehicle to its owner. The `repair_job_id` foreign key creates a one-to-one relationship with `repair_jobs` in the current data: each vehicle row references exactly one repair job, and each repair job references exactly one vehicle. The `created_at` timestamp records when the vehicle record was first entered.

**Table `customers`**

| id | customer_id | full_name | contact_phone | email_address | total_visits | satisfaction_rating | vehicle_id | invoice_id |
|---|---|---|---|---|---|---|---|---|
| 1 | Stephanie Lawrence | Theodore Mcgrath | Joe Tsai | primary-email-70 | 2 | 11.45 | 1000 | 9125631 |
| 2 | Bryan Larson | Account Name | Stephanie Collins | adaptive-email-71 | 40 | 13.90 | 1001 | 4985154 |
| 3 | Allen Saunders | Saipan International Airport | Tasha Rodriguez | distributed-email-72 | 16 | 16.35 | 1002 | 726063 |
| 4 | Francis Gulotta | Norma Fisher | Walter Pratt | baseline-email-73 | 23 | 18.80 | 1003 | e604b688-8fd1-11eb-924d-9cd76263cbd0 |

The `customers` table stores the people who commission repairs. Its surrogate primary key `id` is distinct from the business identifier `customer_id`. The `full_name` column carries names such as *Stephanie Lawrence* and *Bryan Larson*, while `contact_phone` and `email_address` provide communication channels (e.g. *Joe Tsai*, *adaptive-email-71*). The integer `total_visits` (values `2`, `40`, `16`, `23`) and the numeric `satisfaction_rating` (ranging from `11.45` to `18.80`) are denormalised aggregates. The foreign key `vehicle_id` links a customer to their vehicle, and `invoice_id` links them to their most recent invoice. In the current schema, each customer row references exactly one vehicle and one invoice, forming one-to-one relationships with both.

**Table `invoices`**

| invoice_id | issue_date | total_amount | tax_amount | payment_status | due_date | repair_job_id | customer_id | created_at |
|---|---|---|---|---|---|---|---|---|
| 9125631 | 2023-02-01 | 112.11 | 4,590 | pending | 2024-11-11 | 1000 | 1 | 2025-01-01 00:14:00 |
| 4985154 | 2024-07-12 | 1,979 | 0.18 | paid | 2025-04-22 | 1001 | 2 | 2025-02-06 03:14:00 |
| 726063 | 2025-12-23 | 15,418 | 763.46 | overdue | 2022-09-06 | 1002 | 3 | 2025-03-11 06:14:00 |
| e604b688-8fd1-11eb-924d-9cd76263cbd0 | 2022-05-07 | 12,579 | 13,393 | pending | 2023-02-17 | 1003 | 4 | 2025-04-16 09:14:00 |

Invoices are the financial artefacts of the domain. The primary key `invoice_id` is a UUID or integer (e.g. `9125631`, `4985154`, `726063`, or `e604b688-8fd1-11eb-924d-9cd76263cbd0`). The `issue_date` and `due_date` columns define the billing window, while `total_amount` and `tax_amount` store the monetary values (e.g. a total of `112.11` with tax of `4,590` for invoice 9125631, or a total of `15,418` with tax of `763.46` for invoice 726063). The `payment_status` column is an enumerated state (`pending`, `paid`, `overdue`). The foreign keys `repair_job_id` and `customer_id` tie the invoice to the job that generated it and the customer who owes it, respectively. The `created_at` timestamp records when the invoice record was materialised.

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

The `shops_technicians` table is a junction (associative) table that resolves a many-to-many relationship between `auto_repair_shops` and `technicians`. In the current schema, each technician row in `technicians` already carries an `auto_repair_shop_id` foreign key, suggesting a direct many-to-one relationship. The junction table exists as a denormalised or historical artefact — it allows a technician to be associated with multiple shops over time, or it may serve as an audit trail of shop assignments. The table's composite key consists of `auto_repair_shop_id` and `technician_id`, each referencing the respective base table.

With the base tables established, the following views materialise the domain facts by joining the normalised tables back together. Each view answers a specific analytical question.

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

This view joins `auto_repair_shops` with `technicians` on `auto_repair_shop_id`, producing a flat row that answers: *Which technicians are employed at which shop, and what are their compensation and skill profiles?* A row from this view might show shop *Regional Initiative* (shop_id `3717615`) alongside technician *Theodore Mcgrath* with an hourly rate of `13.45` and skill level `entry_level`. The join reconstructs the shop-technician employment fact from two normalised tables.

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

This view joins `auto_repair_shops` with `customers` through the `customer_id` foreign key in `auto_repair_shops`, answering: *Which customers are associated with which shop?* A row might pair shop *Seasonal Model D* with customer *Stephanie Lawrence*. The join collapses the shop-to-customer relationship into a single denormalised row.

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

This view is the inverse of `vw_auto_repair_shop_technician_detail`: it joins `technicians` with `auto_repair_shops` on `auto_repair_shop_id`, answering: *For each technician, which shop do they belong to?* A row might show *Theodore Mcgrath* (technician_id `1`) employed at shop *Regional Initiative* (auto_repair_shop_id `1`). The join direction is reversed but the data content is equivalent.

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

This view joins `technicians` with `repair_jobs` on `technician_id`, answering: *Which repair job is assigned to which technician?* A row might pair technician *Theodore Mcgrath* with job `1000` of type `oil_change` and status `pending`. The join reconstructs the technician-job assignment from two tables.

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

This view is the inverse of `vw_technician_repair_job`: it joins `repair_jobs` with `technicians` on `technician_id`, answering: *For each repair job, which technician performed it?* A row might show job `1001` (type `brake_repair`, status `in_progress`) assigned to technician `2` (*Account Name*). The join direction is reversed.

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

This view joins `repair_jobs` with `vehicles` on `vehicle_id`, answering: *Which vehicle is being repaired in which job?* A row might pair job `1000` (type `oil_change`) with vehicle `1000` (VIN `legacy-vin-25`, make *extended-make-81*). The join reconstructs the job-vehicle association.

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

This view joins `repair_jobs` with `invoices` on `invoice_id`, answering: *Which invoice was generated by which repair job?* A row might show job `1000` linked to invoice `9125631` with a total amount of `112.11` and payment status `pending`. The join reconstructs the job-invoice financial linkage.

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

This view joins `vehicles` with `customers` on `customer_id`, answering: *Which customer owns which vehicle?* A row might pair vehicle `1000` (VIN `legacy-vin-25`) with customer *Susan Wagner* (customer_id `1`). The join collapses the vehicle-customer ownership fact.

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

This view is the inverse of `vw_repair_job_vehicle`: it joins `vehicles` with `repair_jobs` on `repair_job_id`, answering: *For each vehicle, which repair job is it associated with?* A row might show vehicle `1001` (VIN `compact-vin-26`) linked to job `1001` (type `brake_repair`). The join direction is reversed.

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

This view is the inverse of `vw_vehicle_customer`: it joins `customers` with `vehicles` on `vehicle_id`, answering: *For each customer, which vehicle do they own?* A row might show customer *Stephanie Lawrence* (id `1`) owning vehicle `1000` (VIN `legacy-vin-25`). The join direction is reversed.

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

This view joins `customers` with `invoices` on `customer_id`, answering: *Which invoice was issued to which customer?* A row might pair customer *Stephanie Lawrence* with invoice `9125631` (total `112.11`, status `pending`). The join reconstructs the customer-invoice billing relationship.

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

This view is the inverse of `vw_repair_job_invoice`: it joins `invoices` with `repair_jobs` on `repair_job_id`, answering: *For each invoice, which repair job generated it?* A row might show invoice `4985154` (total `1,979`, status `paid`) generated by job `1001` (type `brake_repair`). The join direction is reversed.

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

This view is the inverse of `vw_customer_invoice`: it joins `invoices` with `customers` on `customer_id`, answering: *For each invoice, which customer is responsible?* A row might show invoice `726063` (total `15,418`, status `overdue`) owed by customer `3` (*Allen Saunders*). The join direction is reversed.

## Synthesis

The auto repair management schema demonstrates a classic normalised design: six base tables encode entities and their attributes, foreign keys encode cardinality-bounded relationships, and a junction table (`shops_technicians`) supports many-to-many associations. The twelve views are not additional storage — they are declarative joins that reconstruct domain facts from the normalised tables. Each view answers a single analytical question by joining exactly two tables, and the inverse pairs (e.g. `vw_technician_repair_job` / `vw_repair_job_technician`) demonstrate that the join direction is a matter of narrative perspective, not data content. The concrete values — shop names like *Regional Initiative*, technician names like *Theodore Mcgrath*, job types like `oil_change`, vehicle VINs like `legacy-vin-25`, customer names like *Stephanie Lawrence*, and invoice totals like `112.11` — ground the abstract schema in a tangible operational reality.