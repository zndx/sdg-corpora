## Domain Modelling and Relational Materialization

This chapter documents the relational schema that materializes a corporate governance domain encompassing organizational divisions, budgeting workflows, employee management, training programs, office infrastructure, productivity tooling, and business process orchestration. The domain captures how a multi-division enterprise plans its fiscal year, tracks expenditure at the line-item level, assigns employees to locations and training classes, and maps the tools and processes that underpin daily operations. Every entity type is modelled as a base table with a primary key, and relationships are expressed through foreign keys and junction tables that enforce cardinality-bounded associations. Views then reconstitute domain facts by joining these normalized tables back into denormalized projections.

**Table `operating_divisions`**

| division_id | division_name | headquarters_location | employee_count | fiscal_year |
|---|---|---|---|---|
| 89512 | Composite Protocol | composite-headquar-63 | 131 | 17 |
| 10207146 | Compact Programme A | primary-headquar-64 | 428 | 20 |
| 212 | Legacy Standard | adaptive-headquar-65 | 3 | 23 |
| id_14 | Regional Framework | distributed-headquar-66 | 9 | 26 |

The `operating_divisions` table anchors the organizational hierarchy. Each row represents a distinct division within the enterprise, identified by `division_id` (a surrogate integer or string key such as `89512` or `id_14`). The `division_name` column carries human-readable labels like *Composite Protocol* or *Regional Framework*, while `headquarters_location` stores a reference to the division's primary office — for instance, `composite-headquar-63` or `adaptive-headquar-65`. The `employee_count` field provides a snapshot of headcount (values range from `3` for *Legacy Standard* to `428` for *Compact Programme A*), and `fiscal_year` constrains the division's planning horizon to a specific year such as `17`, `20`, `23`, or `26`. This table is the primary referent for all budgeting and employee-related foreign keys.

**Table `budget_submissions`**

| id | submission_id | total_projected_expenditure | submission_date | fiscal_year | submission_status | division_id |
|---|---|---|---|---|---|---|
| 100 | 605952 | 6.70 | 2025-04-24T03:57:00 | 17 | draft | 89512 |
| 101 | 10445631 | 9.40 | 2022-09-08T10:14:00 | 20 | submitted | 10207146 |
| 102 | id_9 | 12.10 | 2023-02-19T17:31:00 | 23 | merged | 212 |
| 103 | 1450658 | 14.80 | 2024-07-03T00:48:00 | 26 | approved | id_14 |

Budget planning is captured in `budget_submissions`, which records each division's fiscal-year expenditure proposal. The table's primary key is `id`, an integer surrogate (e.g., `100`, `101`, `102`, `103`). The `submission_id` column carries a business-level identifier such as `605952` or `id_9`, enabling traceability across systems. `total_projected_expenditure` holds the monetary forecast — values like `6.70`, `9.40`, `12.10`, and `14.80` — while `submission_date` records the timestamp of filing, for example `2025-04-24T03:57:00`. The `submission_status` column tracks the lifecycle stage of the submission, with observed values including `draft`, `submitted`, `merged`, and `approved`. The `division_id` column is a foreign key referencing `operating_divisions`, binding each submission to its originating division; the `fiscal_year` column provides an additional denormalized anchor for time-based queries.

**Table `budget_line_items`**

| budget_line_item_id | line_item_id | category_name | allocated_amount | currency_code | approval_status | budget_submission_id | division_id |
|---|---|---|---|---|---|---|---|
| 1000 | LIN-2645 | Legacy Programme D | 261.79 | gd_fp_eu_acc3 | pending | 100 | 89512 |
| 1001 | LIN-2652 | Regional Standard | 19.72 | managing-resources | approved | 101 | 10207146 |
| 1002 | LIN-2659 | Seasonal Framework | 47.66 | f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 | rejected | 102 | 212 |
| 1003 | LIN-2666 | Integrated Protocol A | 16.11 | 10445649 | pending | 103 | id_14 |

At the granular level, `budget_line_items` decomposes each submission into individual expenditure categories. The primary key is `budget_line_item_id`, and the `line_item_id` column carries business identifiers such as `LIN-2645` or `LIN-2666`. The `category_name` field describes the expenditure type — *Legacy Programme D*, *Regional Standard*, *Seasonal Framework*, *Integrated Protocol A* — while `allocated_amount` records the specific budget allocation (e.g., `261.79`, `19.72`, `47.66`, `16.11`). The `currency_code` column stores a code for the currency unit, which in this dataset includes values like `gd_fp_eu_acc3`, `managing-resources`, `f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3`, and `10445649`. The `approval_status` column tracks the review state with values `pending` and `rejected`. The `budget_submission_id` foreign key links each line item to its parent submission, and `division_id` provides a denormalized reference to the owning division.

**Table `internal_training_classes`**

| id | class_id | class_name | topic_category | scheduled_date | max_capacity | current_enrollment | office_location_id |
|---|---|---|---|---|---|---|---|
| 1 | 5844263 | Seasonal Review | regional-topic-42 | 2024-11-27T22:18:00 | 32 | 50 | 100 |
| 2 | 1336191 | Integrated Initiative | legacy-topic-43 | 2025-04-11T05:35:00 | 42 | 61 | 101 |
| 3 | 7441153 | Extended Model D | compact-topic-44 | 2022-09-22T12:52:00 | 52 | 72 | 102 |
| 4 | 8189485 | Pilot Cluster | composite-topic-45 | 2023-02-06T19:09:00 | 62 | 83 | 103 |

Employee development is modelled through `internal_training_classes`, which represents scheduled training sessions. The primary key `id` is an integer (e.g., `1`, `2`, `3`, `4`), and `class_id` carries a business identifier such as `5844263` or `8189485`. The `class_name` column holds descriptive titles like *Seasonal Review*, *Integrated Initiative*, *Extended Model D*, and *Pilot Cluster*. The `topic_category` field classifies the training content with values such as `regional-topic-42`, `legacy-topic-43`, `compact-topic-44`, and `composite-topic-45`. The `scheduled_date` records the session date and time (e.g., `2024-11-27T22:18:00`), while `max_capacity` and `current_enrollment` track seat availability — note that `current_enrollment` can exceed `max_capacity` in the sample data (e.g., enrollment of `50` against a capacity of `32`), suggesting the system permits over-enrollment. The `office_location_id` column is a foreign key pointing to `office_locations`, indicating where the class is held.

**Table `employees`**

| id | employee_id | full_name | job_title | office_location | hire_date | is_manager | division_id | budget_submission_id |
|---|---|---|---|---|---|---|---|---|
| 1000 | Norma Fisher | Theodore Mcgrath | Primary Initiative A | composite-office-99 | 2023-06-01 | true | 89512 | 100 |
| 1001 | Tasha Rodriguez | Account Name | Composite Model | primary-office-100 | 2024-11-12 | false | 10207146 | 101 |
| 1002 | Theodore Mcgrath | Saipan International Airport | Compact Cluster | adaptive-office-101 | 2025-04-23 | true | 212 | 102 |
| 1003 | Peter Mcdowell | Norma Fisher | Legacy Review D | distributed-office-102 | 2022-09-07 | false | id_14 | 103 |

The `employees` table stores the workforce roster. Its primary key `id` is an integer (e.g., `1000`, `1001`, `1002`, `1003`). The `employee_id` column carries a business identifier such as `Norma Fisher` or `Tasha Rodriguez`, while `full_name` stores the employee's full name — in this dataset, names like *Theodore Mcgrath*, *Account Name*, *Saipan International Airport*, and *Norma Fisher* appear. The `job_title` column records the role (e.g., *Primary Initiative A*, *Composite Model*, *Compact Cluster*, *Legacy Review D*), and `office_location` stores a reference to the employee's assigned office such as `composite-office-99` or `distributed-office-102`. The `hire_date` column captures the employment start date (e.g., `2023-06-01`), and `is_manager` is a boolean flag (`true` or `false`). The `division_id` foreign key links the employee to their organizational division, and `budget_submission_id` links them to a specific budget submission, enabling traceability from individual contributor to fiscal plan.

**Table `office_locations`**

| office_location_id | location_id | city | state | is_headquarters | employee_capacity |
|---|---|---|---|---|---|
| 100 | 778556 | integrated-city-34 | distributed-state-84 | false | 21 |
| 101 | 1250220 | seasonal-city-35 | baseline-state-85 | true | 26 |
| 102 | 14511 | regional-city-36 | pilot-state-86 | false | 31 |
| 103 | 611510 | legacy-city-37 | extended-state-87 | true | 36 |

Physical infrastructure is captured in `office_locations`. The primary key `office_location_id` is an integer (e.g., `100`, `101`, `102`, `103`), and `location_id` carries a business identifier such as `778556` or `14511`. The `city` and `state` columns store geographic descriptors — for example, `integrated-city-34` in `distributed-state-84`, or `seasonal-city-35` in `baseline-state-85`. The `is_headquarters` boolean flag distinguishes headquarters offices (e.g., `true` for `seasonal-city-35` and `legacy-city-37`) from satellite locations. The `employee_capacity` column records the maximum number of employees the office can accommodate, with values ranging from `21` to `36`.

**Table `productivity_tools`**

| id | tool_id | tool_name | software_version | deployment_date | is_collaborative |
|---|---|---|---|---|---|
| 1 | comi | Composite Model | seasonal-software-47 | 2023-02-14T13:51:00 | false |
| 2 | 195360 | Compact Cluster A | regional-software-48 | 2024-07-25T20:08:00 | true |
| 3 | 3355763 | Legacy Review | legacy-software-49 | 2025-12-09T03:25:00 | false |
| 4 | 8387539 | Regional Initiative | compact-software-50 | 2022-05-20T10:42:00 | true |

Productivity tools represent the software and platforms used across the enterprise. This table stores tool identifiers, names, and metadata that employees and business processes consume.

**Table `business_processes`**

| id | process_id | process_name | average_duration_hours | efficiency_gain_percent | process_status | budget_submission_id |
|---|---|---|---|---|---|---|
| 1 | template_ivacode_pagata_art15 | Distributed Review | 18.20 | 5.70 | manual | 100 |
| 2 | 27cebc1c-9bad-11eb-a8a2-19ed5c03f8d3 | Adaptive Initiative D | 22.40 | 9.40 | automated | 101 |
| 3 | 57e52fbc-8fcd-11eb-924d-9cd76263cbd0 | Primary Model | 26.60 | 13.10 | hybrid | 102 |
| 4 | 1205-0002-XL | Composite Cluster | 30.80 | 16.80 | manual | 103 |

Business processes capture the operational workflows that define how work gets done. This table stores process identifiers, names, and metadata that employees and productivity tools participate in.

The domain's many-to-many relationships are materialized through junction tables. The `divisions_submissions` table links divisions to their budget submissions, and `submissions_items` links submissions to their constituent line items. Training enrollment is modelled through two junction tables: `classes_employees` associates training classes with enrolled employees, while `employees_classes` provides the inverse mapping. Office-to-employee assignments are captured in `locations_employees`, and office-to-class assignments in `locations_classes`. Productivity tool assignments use `employees_tools` and `tools_employees` to link employees with the tools they use. Business process participation is modelled through `processes_employees` (employees assigned to processes) and `tools_processes` / `processes_tools` (tool-process associations). These junction tables collectively enforce the cardinality-bounded relationships that the base tables alone cannot express.

**Table `divisions_submissions`**

| division_id | budget_submission_id |
|---|---|
| 89512 | 100 |
| 89512 | 101 |
| 10207146 | 101 |
| 10207146 | 102 |
| 212 | 102 |
| 212 | 103 |
| id_14 | 103 |
| id_14 | 100 |

**Table `submissions_items`**

| budget_submission_id | budget_line_item_id |
|---|---|
| 100 | 1000 |
| 100 | 1001 |
| 101 | 1001 |
| 101 | 1002 |
| 102 | 1002 |
| 102 | 1003 |
| 103 | 1003 |
| 103 | 1000 |

**Table `classes_employees`**

| internal_training_class_id | employee_id |
|---|---|
| 1 | 1000 |
| 1 | 1001 |
| 2 | 1001 |
| 2 | 1002 |
| 3 | 1002 |
| 3 | 1003 |
| 4 | 1003 |
| 4 | 1000 |

**Table `employees_classes`**

| employee_id | internal_training_class_id |
|---|---|
| 1000 | 1 |
| 1000 | 2 |
| 1001 | 2 |
| 1001 | 3 |
| 1002 | 3 |
| 1002 | 4 |
| 1003 | 4 |
| 1003 | 1 |

**Table `employees_tools`**

| employee_id | productivity_tool_id |
|---|---|
| 1000 | 1 |
| 1000 | 2 |
| 1001 | 2 |
| 1001 | 3 |
| 1002 | 3 |
| 1002 | 4 |
| 1003 | 4 |
| 1003 | 1 |

**Table `locations_classes`**

| office_location_id | internal_training_class_id |
|---|---|
| 100 | 1 |
| 100 | 2 |
| 101 | 2 |
| 101 | 3 |
| 102 | 3 |
| 102 | 4 |
| 103 | 4 |
| 103 | 1 |

**Table `locations_employees`**

| office_location_id | employee_id |
|---|---|
| 100 | 1000 |
| 100 | 1001 |
| 101 | 1001 |
| 101 | 1002 |
| 102 | 1002 |
| 102 | 1003 |
| 103 | 1003 |
| 103 | 1000 |

**Table `tools_employees`**

| productivity_tool_id | employee_id |
|---|---|
| 1 | 1000 |
| 1 | 1001 |
| 2 | 1001 |
| 2 | 1002 |
| 3 | 1002 |
| 3 | 1003 |
| 4 | 1003 |
| 4 | 1000 |

**Table `tools_processes`**

| productivity_tool_id | business_process_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

**Table `processes_employees`**

| business_process_id | employee_id |
|---|---|
| 1 | 1000 |
| 1 | 1001 |
| 2 | 1001 |
| 2 | 1002 |
| 3 | 1002 |
| 3 | 1003 |
| 4 | 1003 |
| 4 | 1000 |

**Table `processes_tools`**

| business_process_id | productivity_tool_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

Views reconstruct domain facts by joining these normalized tables into denormalized projections that answer specific analytical questions. Each view is described below with its join logic and the concrete rows it surfaces.

**View `vw_operating_division_budget_submission_detail`**

```sql
CREATE VIEW vw_operating_division_budget_submission_detail AS
SELECT a.division_id, a.division_name, a.headquarters_location, b.id AS submission_id, b.submission_id AS submission_submission_id, b.total_projected_expenditure AS submission_total_projected_expenditure
FROM operating_divisions a
  JOIN divisions_submissions j ON j.division_id = a.division_id
  JOIN budget_submissions b ON b.id = j.budget_submission_id;
```

| division_id | division_name | headquarters_location | submission_id | submission_submission_id | submission_total_projected_expenditure |
|---|---|---|---|---|---|
| 89512 | Composite Protocol | composite-headquar-63 | 100 | 605952 | 6.70 |
| 89512 | Composite Protocol | composite-headquar-63 | 101 | 10445631 | 9.40 |
| 10207146 | Compact Programme A | primary-headquar-64 | 101 | 10445631 | 9.40 |
| 10207146 | Compact Programme A | primary-headquar-64 | 102 | id_9 | 12.10 |
| 212 | Legacy Standard | adaptive-headquar-65 | 102 | id_9 | 12.10 |
| 212 | Legacy Standard | adaptive-headquar-65 | 103 | 1450658 | 14.80 |
| id_14 | Regional Framework | distributed-headquar-66 | 103 | 1450658 | 14.80 |
| id_14 | Regional Framework | distributed-headquar-66 | 100 | 605952 | 6.70 |

This view joins `operating_divisions` to `budget_submissions` on `division_id`, producing a row per submission enriched with division metadata. It answers the question: *What budget submission did each division file, and what are the division's characteristics?* For example, a row might show that division `89512` (*Composite Protocol*) filed submission `100` with a projected expenditure of `6.70` in `draft` status during fiscal year `17`.

**View `vw_budget_submission_operating_division`**

```sql
CREATE VIEW vw_budget_submission_operating_division AS
SELECT a.id, a.submission_id, a.total_projected_expenditure, a.submission_date, b.division_id AS division_division_id, b.division_name AS division_division_name, b.headquarters_location AS division_headquarters_location
FROM budget_submissions a JOIN operating_divisions b ON a.division_id = b.division_id;
```

| id | submission_id | total_projected_expenditure | submission_date | division_division_id | division_division_name | division_headquarters_location |
|---|---|---|---|---|---|---|
| 100 | 605952 | 6.70 | 2025-04-24T03:57:00 | 89512 | Composite Protocol | composite-headquar-63 |
| 101 | 10445631 | 9.40 | 2022-09-08T10:14:00 | 10207146 | Compact Programme A | primary-headquar-64 |
| 102 | id_9 | 12.10 | 2023-02-19T17:31:00 | 212 | Legacy Standard | adaptive-headquar-65 |
| 103 | 1450658 | 14.80 | 2024-07-03T00:48:00 | id_14 | Regional Framework | distributed-headquar-66 |

The inverse of the above, this view joins `budget_submissions` to `operating_divisions` and answers: *Which division owns this budget submission?* A sample row would show submission `101` (ID `10445631`, expenditure `9.40`, status `submitted`) belonging to division `10207146` (*Compact Programme A*) in fiscal year `20`.

**View `vw_budget_submission_budget_line_item_detail`**

```sql
CREATE VIEW vw_budget_submission_budget_line_item_detail AS
SELECT a.id, a.submission_id, a.total_projected_expenditure, b.budget_line_item_id AS item_budget_line_item_id, b.line_item_id AS item_line_item_id, b.category_name AS item_category_name
FROM budget_submissions a
  JOIN submissions_items j ON j.budget_submission_id = a.id
  JOIN budget_line_items b ON b.budget_line_item_id = j.budget_line_item_id;
```

| id | submission_id | total_projected_expenditure | item_budget_line_item_id | item_line_item_id | item_category_name |
|---|---|---|---|---|---|
| 100 | 605952 | 6.70 | 1000 | LIN-2645 | Legacy Programme D |
| 100 | 605952 | 6.70 | 1001 | LIN-2652 | Regional Standard |
| 101 | 10445631 | 9.40 | 1001 | LIN-2652 | Regional Standard |
| 101 | 10445631 | 9.40 | 1002 | LIN-2659 | Seasonal Framework |
| 102 | id_9 | 12.10 | 1002 | LIN-2659 | Seasonal Framework |
| 102 | id_9 | 12.10 | 1003 | LIN-2666 | Integrated Protocol A |
| 103 | 1450658 | 14.80 | 1003 | LIN-2666 | Integrated Protocol A |
| 103 | 1450658 | 14.80 | 1000 | LIN-2645 | Legacy Programme D |

This view joins `budget_submissions` to `budget_line_items` on `budget_submission_id`, answering: *What line items compose each budget submission?* A row might reveal that submission `100` contains line item `LIN-2645` (*Legacy Programme D*) with an allocation of `261.79` in status `pending`.

**View `vw_budget_line_item_budget_submission`**

```sql
CREATE VIEW vw_budget_line_item_budget_submission AS
SELECT a.budget_line_item_id, a.line_item_id, a.category_name, a.allocated_amount, b.id AS submission_id, b.submission_id AS submission_submission_id, b.total_projected_expenditure AS submission_total_projected_expenditure
FROM budget_line_items a JOIN budget_submissions b ON a.budget_submission_id = b.id;
```

| budget_line_item_id | line_item_id | category_name | allocated_amount | submission_id | submission_submission_id | submission_total_projected_expenditure |
|---|---|---|---|---|---|---|
| 1000 | LIN-2645 | Legacy Programme D | 261.79 | 100 | 605952 | 6.70 |
| 1001 | LIN-2652 | Regional Standard | 19.72 | 101 | 10445631 | 9.40 |
| 1002 | LIN-2659 | Seasonal Framework | 47.66 | 102 | id_9 | 12.10 |
| 1003 | LIN-2666 | Integrated Protocol A | 16.11 | 103 | 1450658 | 14.80 |

The inverse mapping, this view joins `budget_line_items` to `budget_submissions` and answers: *Which submission does this line item belong to?* A sample row would show line item `LIN-2652` (*Regional Standard*, allocated `19.72`, status `approved`) belonging to submission `101`.

**View `vw_budget_line_item_operating_division`**

```sql
CREATE VIEW vw_budget_line_item_operating_division AS
SELECT a.budget_line_item_id, a.line_item_id, a.category_name, a.allocated_amount, b.division_id AS division_division_id, b.division_name AS division_division_name, b.headquarters_location AS division_headquarters_location
FROM budget_line_items a JOIN operating_divisions b ON a.division_id = b.division_id;
```

| budget_line_item_id | line_item_id | category_name | allocated_amount | division_division_id | division_division_name | division_headquarters_location |
|---|---|---|---|---|---|---|
| 1000 | LIN-2645 | Legacy Programme D | 261.79 | 89512 | Composite Protocol | composite-headquar-63 |
| 1001 | LIN-2652 | Regional Standard | 19.72 | 10207146 | Compact Programme A | primary-headquar-64 |
| 1002 | LIN-2659 | Seasonal Framework | 47.66 | 212 | Legacy Standard | adaptive-headquar-65 |
| 1003 | LIN-2666 | Integrated Protocol A | 16.11 | id_14 | Regional Framework | distributed-headquar-66 |

This view joins `budget_line_items` directly to `operating_divisions` on `division_id`, answering: *Which division's budget does this line item fund?* A row might show line item `LIN-2659` (*Seasonal Framework*, allocated `47.66`, status `rejected`) belonging to division `212` (*Legacy Standard*).

**View `vw_internal_training_class_office_location`**

```sql
CREATE VIEW vw_internal_training_class_office_location AS
SELECT a.id, a.class_id, a.class_name, a.topic_category, b.office_location_id AS location_office_location_id, b.location_id AS location_location_id, b.city AS location_city
FROM internal_training_classes a JOIN office_locations b ON a.office_location_id = b.office_location_id;
```

| id | class_id | class_name | topic_category | location_office_location_id | location_location_id | location_city |
|---|---|---|---|---|---|---|
| 1 | 5844263 | Seasonal Review | regional-topic-42 | 100 | 778556 | integrated-city-34 |
| 2 | 1336191 | Integrated Initiative | legacy-topic-43 | 101 | 1250220 | seasonal-city-35 |
| 3 | 7441153 | Extended Model D | compact-topic-44 | 102 | 14511 | regional-city-36 |
| 4 | 8189485 | Pilot Cluster | composite-topic-45 | 103 | 611510 | legacy-city-37 |

This view joins `internal_training_classes` to `office_locations` on `office_location_id`, answering: *Where is each training class held?* A sample row would show class `5844263` (*Seasonal Review*, topic `regional-topic-42`, scheduled `2024-11-27T22:18:00`, capacity `32`, enrollment `50`) held at office location `100` (`integrated-city-34`, capacity `21`, not a headquarters).

**View `vw_internal_training_class_employee_detail`**

```sql
CREATE VIEW vw_internal_training_class_employee_detail AS
SELECT a.id, a.class_id, a.class_name, b.id AS employee_id, b.employee_id AS employee_employee_id, b.full_name AS employee_full_name
FROM internal_training_classes a
  JOIN classes_employees j ON j.internal_training_class_id = a.id
  JOIN employees b ON b.id = j.employee_id;
```

| id | class_id | class_name | employee_id | employee_employee_id | employee_full_name |
|---|---|---|---|---|---|
| 1 | 5844263 | Seasonal Review | 1000 | Norma Fisher | Theodore Mcgrath |
| 1 | 5844263 | Seasonal Review | 1001 | Tasha Rodriguez | Account Name |
| 2 | 1336191 | Integrated Initiative | 1001 | Tasha Rodriguez | Account Name |
| 2 | 1336191 | Integrated Initiative | 1002 | Theodore Mcgrath | Saipan International Airport |
| 3 | 7441153 | Extended Model D | 1002 | Theodore Mcgrath | Saipan International Airport |
| 3 | 7441153 | Extended Model D | 1003 | Peter Mcdowell | Norma Fisher |
| 4 | 8189485 | Pilot Cluster | 1003 | Peter Mcdowell | Norma Fisher |
| 4 | 8189485 | Pilot Cluster | 1000 | Norma Fisher | Theodore Mcgrath |

This view joins `internal_training_classes` to `employees` through the `classes_employees` junction table, answering: *Which employees are enrolled in each training class?* A row might show class `1336191` (*Integrated Initiative*, topic `legacy-topic-43`) with enrolled employees such as `Tasha Rodriguez`.

**View `vw_employee_operating_division`**

```sql
CREATE VIEW vw_employee_operating_division AS
SELECT a.id, a.employee_id, a.full_name, a.job_title, b.division_id AS division_division_id, b.division_name AS division_division_name, b.headquarters_location AS division_headquarters_location
FROM employees a JOIN operating_divisions b ON a.division_id = b.division_id;
```

| id | employee_id | full_name | job_title | division_division_id | division_division_name | division_headquarters_location |
|---|---|---|---|---|---|---|
| 1000 | Norma Fisher | Theodore Mcgrath | Primary Initiative A | 89512 | Composite Protocol | composite-headquar-63 |
| 1001 | Tasha Rodriguez | Account Name | Composite Model | 10207146 | Compact Programme A | primary-headquar-64 |
| 1002 | Theodore Mcgrath | Saipan International Airport | Compact Cluster | 212 | Legacy Standard | adaptive-headquar-65 |
| 1003 | Peter Mcdowell | Norma Fisher | Legacy Review D | id_14 | Regional Framework | distributed-headquar-66 |

This view joins `employees` to `operating_divisions` on `division_id`, answering: *Which division does each employee belong to?* A sample row would show employee `1000` (*Norma Fisher*, title *Theodore Mcgrath*, hired `2023-06-01`, manager `true`) belonging to division `89512` (*Composite Protocol*).

**View `vw_employee_budget_submission`**

```sql
CREATE VIEW vw_employee_budget_submission AS
SELECT a.id, a.employee_id, a.full_name, a.job_title, b.id AS submission_id, b.submission_id AS submission_submission_id, b.total_projected_expenditure AS submission_total_projected_expenditure
FROM employees a JOIN budget_submissions b ON a.budget_submission_id = b.id;
```

| id | employee_id | full_name | job_title | submission_id | submission_submission_id | submission_total_projected_expenditure |
|---|---|---|---|---|---|---|
| 1000 | Norma Fisher | Theodore Mcgrath | Primary Initiative A | 100 | 605952 | 6.70 |
| 1001 | Tasha Rodriguez | Account Name | Composite Model | 101 | 10445631 | 9.40 |
| 1002 | Theodore Mcgrath | Saipan International Airport | Compact Cluster | 102 | id_9 | 12.10 |
| 1003 | Peter Mcdowell | Norma Fisher | Legacy Review D | 103 | 1450658 | 14.80 |

This view joins `employees` to `budget_submissions` on `budget_submission_id`, answering: *Which budget submission is associated with each employee?* A row might show employee `1001` (*Tasha Rodriguez*, title *Account Name*, hired `2024-11-12`, manager `false`) linked to submission `101` (expenditure `9.40`, status `submitted`).

**View `vw_employee_internal_training_class_detail`**

```sql
CREATE VIEW vw_employee_internal_training_class_detail AS
SELECT a.id, a.employee_id, a.full_name, b.id AS class_id, b.class_id AS class_class_id, b.class_name AS class_class_name
FROM employees a
  JOIN employees_classes j ON j.employee_id = a.id
  JOIN internal_training_classes b ON b.id = j.internal_training_class_id;
```

| id | employee_id | full_name | class_id | class_class_id | class_class_name |
|---|---|---|---|---|---|
| 1000 | Norma Fisher | Theodore Mcgrath | 1 | 5844263 | Seasonal Review |
| 1000 | Norma Fisher | Theodore Mcgrath | 2 | 1336191 | Integrated Initiative |
| 1001 | Tasha Rodriguez | Account Name | 2 | 1336191 | Integrated Initiative |
| 1001 | Tasha Rodriguez | Account Name | 3 | 7441153 | Extended Model D |
| 1002 | Theodore Mcgrath | Saipan International Airport | 3 | 7441153 | Extended Model D |
| 1002 | Theodore Mcgrath | Saipan International Airport | 4 | 8189485 | Pilot Cluster |
| 1003 | Peter Mcdowell | Norma Fisher | 4 | 8189485 | Pilot Cluster |
| 1003 | Peter Mcdowell | Norma Fisher | 1 | 5844263 | Seasonal Review |

This view joins `employees` to `internal_training_classes` through the `employees_classes` junction table, answering: *Which training classes has each employee attended?* A sample row would show employee `1002` (*Theodore Mcgrath*, title *Saipan International Airport*, hired `2025-04-23`, manager `true`) enrolled in class `7441153` (*Extended Model D*, topic `compact-topic-44`).

**View `vw_employee_productivity_tool_detail`**

```sql
CREATE VIEW vw_employee_productivity_tool_detail AS
SELECT a.id, a.employee_id, a.full_name, b.id AS tool_id, b.tool_id AS tool_tool_id, b.tool_name AS tool_tool_name
FROM employees a
  JOIN employees_tools j ON j.employee_id = a.id
  JOIN productivity_tools b ON b.id = j.productivity_tool_id;
```

| id | employee_id | full_name | tool_id | tool_tool_id | tool_tool_name |
|---|---|---|---|---|---|
| 1000 | Norma Fisher | Theodore Mcgrath | 1 | comi | Composite Model |
| 1000 | Norma Fisher | Theodore Mcgrath | 2 | 195360 | Compact Cluster A |
| 1001 | Tasha Rodriguez | Account Name | 2 | 195360 | Compact Cluster A |
| 1001 | Tasha Rodriguez | Account Name | 3 | 3355763 | Legacy Review |
| 1002 | Theodore Mcgrath | Saipan International Airport | 3 | 3355763 | Legacy Review |
| 1002 | Theodore Mcgrath | Saipan International Airport | 4 | 8387539 | Regional Initiative |
| 1003 | Peter Mcdowell | Norma Fisher | 4 | 8387539 | Regional Initiative |
| 1003 | Peter Mcdowell | Norma Fisher | 1 | comi | Composite Model |

This view joins `employees` to `productivity_tools` through the `employees_tools` junction table, answering: *Which productivity tools does each employee use?* A row might show employee `1003` (*Peter Mcdowell*, title *Norma Fisher*, hired `2022-09-07`, manager `false`) using assigned productivity tools.

**View `vw_office_location_internal_training_class_detail`**

```sql
CREATE VIEW vw_office_location_internal_training_class_detail AS
SELECT a.office_location_id, a.location_id, a.city, b.id AS class_id, b.class_id AS class_class_id, b.class_name AS class_class_name
FROM office_locations a
  JOIN locations_classes j ON j.office_location_id = a.office_location_id
  JOIN internal_training_classes b ON b.id = j.internal_training_class_id;
```

| office_location_id | location_id | city | class_id | class_class_id | class_class_name |
|---|---|---|---|---|---|
| 100 | 778556 | integrated-city-34 | 1 | 5844263 | Seasonal Review |
| 100 | 778556 | integrated-city-34 | 2 | 1336191 | Integrated Initiative |
| 101 | 1250220 | seasonal-city-35 | 2 | 1336191 | Integrated Initiative |
| 101 | 1250220 | seasonal-city-35 | 3 | 7441153 | Extended Model D |
| 102 | 14511 | regional-city-36 | 3 | 7441153 | Extended Model D |
| 102 | 14511 | regional-city-36 | 4 | 8189485 | Pilot Cluster |
| 103 | 611510 | legacy-city-37 | 4 | 8189485 | Pilot Cluster |
| 103 | 611510 | legacy-city-37 | 1 | 5844263 | Seasonal Review |

This view joins `office_locations` to `internal_training_classes` on `office_location_id`, answering: *Which training classes are held at each office location?* A sample row would show office location `101` (`seasonal-city-35`, headquarters `true`, capacity `26`) hosting class `1336191` (*Integrated Initiative*).

**View `vw_office_location_employee_detail`**

```sql
CREATE VIEW vw_office_location_employee_detail AS
SELECT a.office_location_id, a.location_id, a.city, b.id AS employee_id, b.employee_id AS employee_employee_id, b.full_name AS employee_full_name
FROM office_locations a
  JOIN locations_employees j ON j.office_location_id = a.office_location_id
  JOIN employees b ON b.id = j.employee_id;
```

| office_location_id | location_id | city | employee_id | employee_employee_id | employee_full_name |
|---|---|---|---|---|---|
| 100 | 778556 | integrated-city-34 | 1000 | Norma Fisher | Theodore Mcgrath |
| 100 | 778556 | integrated-city-34 | 1001 | Tasha Rodriguez | Account Name |
| 101 | 1250220 | seasonal-city-35 | 1001 | Tasha Rodriguez | Account Name |
| 101 | 1250220 | seasonal-city-35 | 1002 | Theodore Mcgrath | Saipan International Airport |
| 102 | 14511 | regional-city-36 | 1002 | Theodore Mcgrath | Saipan International Airport |
| 102 | 14511 | regional-city-36 | 1003 | Peter Mcdowell | Norma Fisher |
| 103 | 611510 | legacy-city-37 | 1003 | Peter Mcdowell | Norma Fisher |
| 103 | 611510 | legacy-city-37 | 1000 | Norma Fisher | Theodore Mcgrath |

This view joins `office_locations` to `employees` through the `locations_employees` junction table, answering: *Which employees are assigned to each office location?* A row might show office location `102` (`regional-city-36`, not headquarters, capacity `31`) with assigned employees such as `Theodore Mcgrath`.

**View `vw_productivity_tool_employee_detail`**

```sql
CREATE VIEW vw_productivity_tool_employee_detail AS
SELECT a.id, a.tool_id, a.tool_name, b.id AS employee_id, b.employee_id AS employee_employee_id, b.full_name AS employee_full_name
FROM productivity_tools a
  JOIN tools_employees j ON j.productivity_tool_id = a.id
  JOIN employees b ON b.id = j.employee_id;
```

| id | tool_id | tool_name | employee_id | employee_employee_id | employee_full_name |
|---|---|---|---|---|---|
| 1 | comi | Composite Model | 1000 | Norma Fisher | Theodore Mcgrath |
| 1 | comi | Composite Model | 1001 | Tasha Rodriguez | Account Name |
| 2 | 195360 | Compact Cluster A | 1001 | Tasha Rodriguez | Account Name |
| 2 | 195360 | Compact Cluster A | 1002 | Theodore Mcgrath | Saipan International Airport |
| 3 | 3355763 | Legacy Review | 1002 | Theodore Mcgrath | Saipan International Airport |
| 3 | 3355763 | Legacy Review | 1003 | Peter Mcdowell | Norma Fisher |
| 4 | 8387539 | Regional Initiative | 1003 | Peter Mcdowell | Norma Fisher |
| 4 | 8387539 | Regional Initiative | 1000 | Norma Fisher | Theodore Mcgrath |

This view joins `productivity_tools` to `employees` through the `tools_employees` junction table, answering: *Which employees use each productivity tool?* A sample row would show a productivity tool with its associated employee roster.

**View `vw_productivity_tool_business_process_detail`**

```sql
CREATE VIEW vw_productivity_tool_business_process_detail AS
SELECT a.id, a.tool_id, a.tool_name, b.id AS process_id, b.process_id AS process_process_id, b.process_name AS process_process_name
FROM productivity_tools a
  JOIN tools_processes j ON j.productivity_tool_id = a.id
  JOIN business_processes b ON b.id = j.business_process_id;
```

| id | tool_id | tool_name | process_id | process_process_id | process_process_name |
|---|---|---|---|---|---|
| 1 | comi | Composite Model | 1 | template_ivacode_pagata_art15 | Distributed Review |
| 1 | comi | Composite Model | 2 | 27cebc1c-9bad-11eb-a8a2-19ed5c03f8d3 | Adaptive Initiative D |
| 2 | 195360 | Compact Cluster A | 2 | 27cebc1c-9bad-11eb-a8a2-19ed5c03f8d3 | Adaptive Initiative D |
| 2 | 195360 | Compact Cluster A | 3 | 57e52fbc-8fcd-11eb-924d-9cd76263cbd0 | Primary Model |
| 3 | 3355763 | Legacy Review | 3 | 57e52fbc-8fcd-11eb-924d-9cd76263cbd0 | Primary Model |
| 3 | 3355763 | Legacy Review | 4 | 1205-0002-XL | Composite Cluster |
| 4 | 8387539 | Regional Initiative | 4 | 1205-0002-XL | Composite Cluster |
| 4 | 8387539 | Regional Initiative | 1 | template_ivacode_pagata_art15 | Distributed Review |

This view joins `productivity_tools` to `business_processes` through the `tools_processes` junction table, answering: *Which business processes consume each productivity tool?* A row might show a tool linked to specific operational workflows.

**View `vw_business_process_employee_detail`**

```sql
CREATE VIEW vw_business_process_employee_detail AS
SELECT a.id, a.process_id, a.process_name, b.id AS employee_id, b.employee_id AS employee_employee_id, b.full_name AS employee_full_name
FROM business_processes a
  JOIN processes_employees j ON j.business_process_id = a.id
  JOIN employees b ON b.id = j.employee_id;
```

| id | process_id | process_name | employee_id | employee_employee_id | employee_full_name |
|---|---|---|---|---|---|
| 1 | template_ivacode_pagata_art15 | Distributed Review | 1000 | Norma Fisher | Theodore Mcgrath |
| 1 | template_ivacode_pagata_art15 | Distributed Review | 1001 | Tasha Rodriguez | Account Name |
| 2 | 27cebc1c-9bad-11eb-a8a2-19ed5c03f8d3 | Adaptive Initiative D | 1001 | Tasha Rodriguez | Account Name |
| 2 | 27cebc1c-9bad-11eb-a8a2-19ed5c03f8d3 | Adaptive Initiative D | 1002 | Theodore Mcgrath | Saipan International Airport |
| 3 | 57e52fbc-8fcd-11eb-924d-9cd76263cbd0 | Primary Model | 1002 | Theodore Mcgrath | Saipan International Airport |
| 3 | 57e52fbc-8fcd-11eb-924d-9cd76263cbd0 | Primary Model | 1003 | Peter Mcdowell | Norma Fisher |
| 4 | 1205-0002-XL | Composite Cluster | 1003 | Peter Mcdowell | Norma Fisher |
| 4 | 1205-0002-XL | Composite Cluster | 1000 | Norma Fisher | Theodore Mcgrath |

This view joins `business_processes` to `employees` through the `processes_employees` junction table, answering: *Which employees participate in each business process?* A sample row would show a business process with its assigned employee participants.

**View `vw_business_process_productivity_tool_detail`**

```sql
CREATE VIEW vw_business_process_productivity_tool_detail AS
SELECT a.id, a.process_id, a.process_name, b.id AS tool_id, b.tool_id AS tool_tool_id, b.tool_name AS tool_tool_name
FROM business_processes a
  JOIN processes_tools j ON j.business_process_id = a.id
  JOIN productivity_tools b ON b.id = j.productivity_tool_id;
```

| id | process_id | process_name | tool_id | tool_tool_id | tool_tool_name |
|---|---|---|---|---|---|
| 1 | template_ivacode_pagata_art15 | Distributed Review | 1 | comi | Composite Model |
| 1 | template_ivacode_pagata_art15 | Distributed Review | 2 | 195360 | Compact Cluster A |
| 2 | 27cebc1c-9bad-11eb-a8a2-19ed5c03f8d3 | Adaptive Initiative D | 2 | 195360 | Compact Cluster A |
| 2 | 27cebc1c-9bad-11eb-a8a2-19ed5c03f8d3 | Adaptive Initiative D | 3 | 3355763 | Legacy Review |
| 3 | 57e52fbc-8fcd-11eb-924d-9cd76263cbd0 | Primary Model | 3 | 3355763 | Legacy Review |
| 3 | 57e52fbc-8fcd-11eb-924d-9cd76263cbd0 | Primary Model | 4 | 8387539 | Regional Initiative |
| 4 | 1205-0002-XL | Composite Cluster | 4 | 8387539 | Regional Initiative |
| 4 | 1205-0002-XL | Composite Cluster | 1 | comi | Composite Model |

This view joins `business_processes` to `productivity_tools` through the `processes_tools` junction table, answering: *Which productivity tools are used by each business process?* A row might show a process with its required tooling.

**View `vw_business_process_budget_submission`**

```sql
CREATE VIEW vw_business_process_budget_submission AS
SELECT a.id, a.process_id, a.process_name, a.average_duration_hours, b.id AS submission_id, b.submission_id AS submission_submission_id, b.total_projected_expenditure AS submission_total_projected_expenditure
FROM business_processes a JOIN budget_submissions b ON a.budget_submission_id = b.id;
```

| id | process_id | process_name | average_duration_hours | submission_id | submission_submission_id | submission_total_projected_expenditure |
|---|---|---|---|---|---|---|
| 1 | template_ivacode_pagata_art15 | Distributed Review | 18.20 | 100 | 605952 | 6.70 |
| 2 | 27cebc1c-9bad-11eb-a8a2-19ed5c03f8d3 | Adaptive Initiative D | 22.40 | 101 | 10445631 | 9.40 |
| 3 | 57e52fbc-8fcd-11eb-924d-9cd76263cbd0 | Primary Model | 26.60 | 102 | id_9 | 12.10 |
| 4 | 1205-0002-XL | Composite Cluster | 30.80 | 103 | 1450658 | 14.80 |

This view joins `business_processes` to `budget_submissions`, answering: *Which budget submissions are associated with each business process?* A sample row would show a business process linked to a budget submission, connecting operational workflows to fiscal planning.

The schema design follows a disciplined normalization strategy: base tables store atomic facts with surrogate primary keys, foreign keys enforce referential integrity between related entities, and junction tables resolve many-to-many relationships that arise in training enrollment, tool assignment, and process participation. Views serve as the materialized interface between the normalized store and analytical consumption, each join reconstructing a specific domain fact — from the high-level question of which division filed which budget submission, down to the granular detail of which employee uses which tool within which business process. The representative values throughout this chapter — division names like *Composite Protocol*, submission statuses like `approved`, line item allocations like `261.79`, training enrollments exceeding capacity, and employee titles like *Saipan International Airport* — are drawn directly from the dataset and illustrate the schema's capacity to capture a realistic, multi-dimensional corporate governance domain.