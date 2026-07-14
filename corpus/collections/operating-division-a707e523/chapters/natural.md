## Corporate Operations and Resource Management

Every mid-sized enterprise must coordinate three moving parts: how its divisions are structured, how money flows through those divisions, and how people execute the work. The records in this system capture that coordination. Operating divisions anchor the hierarchy, each tied to a headquarters location and a fiscal year. Budget submissions carry the financial plan forward, broken into line items with categories, amounts, and approval states. Employees sit inside divisions, carry job titles, and are assigned to office locations. Training classes, productivity tools, and business processes form the operational fabric that connects people to the work they do.

**Table `operating_divisions`**

| division_id | division_name | headquarters_location | employee_count | fiscal_year |
|---|---|---|---|---|
| 89512 | Composite Protocol | composite-headquar-63 | 131 | 17 |
| 10207146 | Compact Programme A | primary-headquar-64 | 428 | 20 |
| 212 | Legacy Standard | adaptive-headquar-65 | 3 | 23 |
| id_14 | Regional Framework | distributed-headquar-66 | 9 | 26 |

The division table defines the organizational skeleton. Composite Protocol (id 89512) operates out of composite-headquar-63 with 131 employees in fiscal year 17. Compact Programme A (id 10207146) is the largest unit, headquartered at primary-headquar-64 with 428 staff in year 20. Legacy Standard (id 212) is a lean operation of three people at adaptive-headquar-65 in year 23. Regional Framework (id id_14) rounds out the set with nine employees at distributed-headquar-66 in year 26. Each row is a self-contained unit of accountability.

**Table `budget_submissions`**

| id | submission_id | total_projected_expenditure | submission_date | fiscal_year | submission_status | division_id |
|---|---|---|---|---|---|---|
| 100 | 605952 | 6.70 | 2025-04-24T03:57:00 | 17 | draft | 89512 |
| 101 | 10445631 | 9.40 | 2022-09-08T10:14:00 | 20 | submitted | 10207146 |
| 102 | id_9 | 12.10 | 2023-02-19T17:31:00 | 23 | merged | 212 |
| 103 | 1450658 | 14.80 | 2024-07-03T00:48:00 | 26 | approved | id_14 |

Budget submissions translate divisional strategy into dollar figures. Submission 100, linked to division 89512, projects an expenditure of 6.70 and sits in draft status as of April 2025. Submission 101, tied to division 10207146, carries 9.40 and has been submitted. Submission 102 (id id_9) for division 212 shows 12.10 and a merged status, while submission 103 for division id_14 reaches 14.80 and is approved. The submission_date and submission_status fields together form a lifecycle: draft, submitted, merged, approved.

**Table `budget_line_items`**

| budget_line_item_id | line_item_id | category_name | allocated_amount | currency_code | approval_status | budget_submission_id | division_id |
|---|---|---|---|---|---|---|---|
| 1000 | LIN-2645 | Legacy Programme D | 261.79 | gd_fp_eu_acc3 | pending | 100 | 89512 |
| 1001 | LIN-2652 | Regional Standard | 19.72 | managing-resources | approved | 101 | 10207146 |
| 1002 | LIN-2659 | Seasonal Framework | 47.66 | f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 | rejected | 102 | 212 |
| 1003 | LIN-2666 | Integrated Protocol A | 16.11 | 10445649 | pending | 103 | id_14 |

Line items decompose each submission into spendable categories. Item LIN-2645 under submission 100 is categorized as Legacy Programme D with an allocation of 261.79 in currency gd_fp_eu_acc3, currently pending approval. LIN-2652 under submission 101 is Regional Standard at 19.72 in managing-resources currency, already approved. LIN-2659 under submission 102 is Seasonal Framework at 47.66 in currency f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3, rejected. LIN-2666 under submission 103 is Integrated Protocol A at 16.11 in currency 10445649, pending. The approval_status field gates whether funds can move.

**Table `internal_training_classes`**

| id | class_id | class_name | topic_category | scheduled_date | max_capacity | current_enrollment | office_location_id |
|---|---|---|---|---|---|---|---|
| 1 | 5844263 | Seasonal Review | regional-topic-42 | 2024-11-27T22:18:00 | 32 | 50 | 100 |
| 2 | 1336191 | Integrated Initiative | legacy-topic-43 | 2025-04-11T05:35:00 | 42 | 61 | 101 |
| 3 | 7441153 | Extended Model D | compact-topic-44 | 2022-09-22T12:52:00 | 52 | 72 | 102 |
| 4 | 8189485 | Pilot Cluster | composite-topic-45 | 2023-02-06T19:09:00 | 62 | 83 | 103 |

Training classes represent the learning infrastructure. Seasonal Review (id 5844263) covers regional-topic-42, scheduled for November 2024, with a max capacity of 32 and current enrollment of 50 at office location 100. Integrated Initiative (id 1336191) addresses legacy-topic-43 in April 2025, capacity 42, enrollment 61 at location 101. Extended Model D (id 7441153) on compact-topic-44 runs in September 2022, capacity 52, enrollment 72 at location 102. Pilot Cluster (id 8189485) covers composite-topic-45 in February 2023, capacity 62, enrollment 83 at location 103. In every case, current_enrollment exceeds max_capacity, indicating over-enrollment is a recurring operational pattern.

**Table `employees`**

| id | employee_id | full_name | job_title | office_location | hire_date | is_manager | division_id | budget_submission_id |
|---|---|---|---|---|---|---|---|---|
| 1000 | Norma Fisher | Theodore Mcgrath | Primary Initiative A | composite-office-99 | 2023-06-01 | true | 89512 | 100 |
| 1001 | Tasha Rodriguez | Account Name | Composite Model | primary-office-100 | 2024-11-12 | false | 10207146 | 101 |
| 1002 | Theodore Mcgrath | Saipan International Airport | Compact Cluster | adaptive-office-101 | 2025-04-23 | true | 212 | 102 |
| 1003 | Peter Mcdowell | Norma Fisher | Legacy Review D | distributed-office-102 | 2022-09-07 | false | id_14 | 103 |

The employee roster links people to divisions, locations, and budget submissions. Norma Fisher (id 1000), job title Theodore Mcgrath, works at composite-office-99, hired June 2023, is a manager in division 89512 with budget submission 100. Tasha Rodriguez (id 1001), title Account Name, at primary-office-100, hired November 2024, is not a manager in division 10207146 with submission 101. Theodore Mcgrath (id 1002), title Saipan International Airport, at adaptive-office-101, hired April 2025, is a manager in division 212 with submission 102. Peter Mcdowell (id 1003), title Norma Fisher, at distributed-office-102, hired September 2022, is not a manager in division id_14 with submission 103. The is_manager flag distinguishes supervisory staff from individual contributors.

**Table `office_locations`**

| office_location_id | location_id | city | state | is_headquarters | employee_capacity |
|---|---|---|---|---|---|
| 100 | 778556 | integrated-city-34 | distributed-state-84 | false | 21 |
| 101 | 1250220 | seasonal-city-35 | baseline-state-85 | true | 26 |
| 102 | 14511 | regional-city-36 | pilot-state-86 | false | 31 |
| 103 | 611510 | legacy-city-37 | extended-state-87 | true | 36 |

Office locations ground the organization in physical space. Location 100 (id 778556) is integrated-city-34 in distributed-state-84, not a headquarters, with capacity for 21 employees. Location 101 (id 1250220) is seasonal-city-35 in baseline-state-85, designated as headquarters, capacity 26. Location 102 (id 14511) is regional-city-36 in pilot-state-86, not a headquarters, capacity 31. Location 103 (id 611510) is legacy-city-37 in extended-state-87, also a headquarters, capacity 36. The is_headquarters flag identifies the primary administrative centers.

**Table `productivity_tools`**

| id | tool_id | tool_name | software_version | deployment_date | is_collaborative |
|---|---|---|---|---|---|
| 1 | comi | Composite Model | seasonal-software-47 | 2023-02-14T13:51:00 | false |
| 2 | 195360 | Compact Cluster A | regional-software-48 | 2024-07-25T20:08:00 | true |
| 3 | 3355763 | Legacy Review | legacy-software-49 | 2025-12-09T03:25:00 | false |
| 4 | 8387539 | Regional Initiative | compact-software-50 | 2022-05-20T10:42:00 | true |

Productivity tools capture the software and platforms employees use. These tools are cataloged with identifiers and names, then linked to employees and the business processes they support.

**Table `business_processes`**

| id | process_id | process_name | average_duration_hours | efficiency_gain_percent | process_status | budget_submission_id |
|---|---|---|---|---|---|---|
| 1 | template_ivacode_pagata_art15 | Distributed Review | 18.20 | 5.70 | manual | 100 |
| 2 | 27cebc1c-9bad-11eb-a8a2-19ed5c03f8d3 | Adaptive Initiative D | 22.40 | 9.40 | automated | 101 |
| 3 | 57e52fbc-8fcd-11eb-924d-9cd76263cbd0 | Primary Model | 26.60 | 13.10 | hybrid | 102 |
| 4 | 1205-0002-XL | Composite Cluster | 30.80 | 16.80 | manual | 103 |

Business processes define the repeatable workflows that structure organizational work. Each process has a name and category, and is associated with specific productivity tools and employees who execute it.

The relational structure extends beyond these base tables through a network of junction records that model many-to-many relationships. The divisions_submissions table links divisions to their budget submissions, while submissions_items connects submissions to their constituent line items. Training enrollment is captured in both classes_employees and employees_classes, providing bidirectional navigation between people and sessions. Office locations connect to employees through locations_employees and to training classes through locations_classes. Productivity tools link to employees via employees_tools and tools_employees, and to business processes through tools_processes. Business processes, in turn, connect to employees through processes_employees and to tools through processes_tools.

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

The divisions_submissions junction records which budget submissions belong to which operating divisions, enabling a division to have multiple submissions across fiscal years.

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

The submissions_items junction maps each budget submission to its line items, preserving the granular breakdown of projected expenditures.

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

The classes_employees junction records which employees are enrolled in which training classes, forming the enrollment graph.

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

The employees_classes junction provides the reverse mapping from employees to their enrolled classes, supporting queries that start from a person and find their training.

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

The employees_tools junction links employees to the productivity tools they use, capturing tool assignment at the individual level.

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

The locations_classes junction associates office locations with the training classes held there, enabling location-based training reports.

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

The locations_employees junction maps employees to their assigned office locations, supporting headcount and capacity analysis.

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

The tools_employees junction provides the reverse mapping from productivity tools to the employees who use them.

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

The tools_processes junction connects productivity tools to the business processes they support, documenting tool utilization across workflows.

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

The processes_employees junction links business processes to the employees who execute them, forming the operational assignment map.

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

The processes_tools junction connects business processes to the productivity tools they require, completing the tool-process relationship.

With the base tables and junction records in place, the system provides a set of materialized views that answer the most common analytical questions. Each view joins the relevant tables and presents a flattened result set for reporting and dashboarding.

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

This view joins operating divisions with their budget submissions, answering the question of how much each division has projected to spend. A row for division 89512 (Composite Protocol) would show submission 100 with 6.70 in projected expenditure, while division 10207146 (Compact Programme A) would show submission 101 with 9.40. The view surfaces division_name, headquarters_location, employee_count, and fiscal_year alongside submission details, giving a complete picture of divisional financial posture.

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

The inverse of the previous view, this joins budget submissions back to their parent divisions. It answers which division owns which submission. Submission 100 maps to division 89512 (Composite Protocol), submission 101 to division 10207146 (Compact Programme A), submission 102 to division 212 (Legacy Standard), and submission 103 to division id_14 (Regional Framework). The submission_status field (draft, submitted, merged, approved) appears alongside division identifiers, enabling status-based filtering.

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

This view connects budget submissions to their line items, answering how a total projected expenditure breaks down into categories. Submission 100 would appear with line item LIN-2645 (Legacy Programme D) at 261.79 in pending status. Submission 101 would show LIN-2652 (Regional Standard) at 19.72, approved. The view preserves the submission-level total alongside the line-item-level allocation, allowing comparison between planned and detailed spend.

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

The reverse mapping from line items to their parent submissions. It answers which submission a given line item belongs to. LIN-2645 traces back to submission 100, LIN-2652 to submission 101, LIN-2659 to submission 102, and LIN-2666 to submission 103. The approval_status of the line item appears alongside the submission's overall status, enabling analysis of approval alignment.

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

This view bridges line items to their parent divisions through the submission, answering which division is responsible for each line item. LIN-2645 traces to division 89512 (Composite Protocol), LIN-2652 to division 10207146 (Compact Programme A), LIN-2659 to division 212 (Legacy Standard), and LIN-2666 to division id_14 (Regional Framework). The division's employee_count and headquarters_location appear alongside line-item details, supporting cost-per-employee analysis.

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

This view joins training classes to their host office locations, answering where each class is held. Class 5844263 (Seasonal Review) is at location 100 (integrated-city-34), class 1336191 (Integrated Initiative) at location 101 (seasonal-city-35), class 7441153 (Extended Model D) at location 102 (regional-city-36), and class 8189485 (Pilot Cluster) at location 103 (legacy-city-37). The view includes the location's employee_capacity and is_headquarters flag, enabling capacity planning.

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

This view connects training classes to enrolled employees, answering which employees are taking which classes. It surfaces class_name, topic_category, scheduled_date, and current_enrollment alongside employee identifiers, supporting training completion tracking and compliance reporting.

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

This view joins employees to their parent divisions, answering which division each employee belongs to. Employee 1000 (Norma Fisher) maps to division 89512 (Composite Protocol), employee 1001 (Tasha Rodriguez) to division 10207146 (Compact Programme A), employee 1002 (Theodore Mcgrath) to division 212 (Legacy Standard), and employee 1003 (Peter Mcdowell) to division id_14 (Regional Framework). The division's employee_count and headquarters_location appear alongside employee details, enabling headcount verification.

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

This view links employees to their assigned budget submissions, answering which submission each employee is associated with. Employee 1000 connects to submission 100, employee 1001 to submission 101, employee 1002 to submission 102, and employee 1003 to submission 103. The submission's total_projected_expenditure and submission_status appear alongside employee details, supporting budget accountability tracking.

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

This view joins employees to their enrolled training classes, answering which classes each employee is taking. It surfaces employee full_name, job_title, and is_manager alongside class_name, topic_category, and scheduled_date, enabling training participation analysis by role and seniority.

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

This view connects employees to the productivity tools they use, answering which tools each employee has access to. It surfaces employee identifiers alongside tool names and categories, supporting software license management and tool adoption analysis.

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

This view joins office locations to the training classes held there, answering which classes are available at each location. Location 100 (integrated-city-34) would show class 5844263 (Seasonal Review), location 101 (seasonal-city-35) would show class 1336191 (Integrated Initiative), and so on. The view includes location city, state, and employee_capacity alongside class details, enabling location-based training availability reports.

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

This view joins office locations to their assigned employees, answering which employees work at each location. Location 100 would show employee 1000 (Norma Fisher), location 101 would show employee 1001 (Tasha Rodriguez), location 102 would show employee 1002 (Theodore Mcgrath), and location 103 would show employee 1003 (Peter Mcdowell). The view includes location city, state, is_headquarters, and employee_capacity alongside employee details, supporting office utilization analysis.

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

This view connects productivity tools to the employees who use them, answering which employees rely on each tool. It surfaces tool identifiers and names alongside employee full_name, job_title, and division, enabling tool usage reporting by organizational unit.

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

This view joins productivity tools to the business processes they support, answering which processes each tool enables. It surfaces tool identifiers alongside process names and categories, supporting tool-to-process mapping for workflow documentation.

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

This view connects business processes to the employees who execute them, answering which employees are responsible for each process. It surfaces process identifiers and names alongside employee full_name, job_title, and is_manager, enabling process ownership analysis.

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

This view joins business processes to the productivity tools they require, answering which tools each process depends on. It surfaces process identifiers and names alongside tool identifiers and names, completing the process-tool dependency map.

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

This final view connects business processes to budget submissions, answering which submissions fund which processes. It surfaces process identifiers and names alongside submission identifiers, total_projected_expenditure, and submission_status, enabling process-level budget tracking and financial accountability.

The system as a whole forms a coherent operational model. Divisions provide the organizational structure, budget submissions and line items capture the financial plan, employees represent the human capital, office locations provide the physical infrastructure, training classes support development, productivity tools enable work, and business processes define the workflows. The junction tables and materialized views weave these elements into a navigable network, allowing any stakeholder to trace a dollar from submission to line item to division, or a person from employee record to division to training to tool to process. The fictional entities—Composite Protocol, Norma Fisher, Seasonal Review, Legacy Programme D—serve as concrete anchors for understanding how real organizations track and manage their resources.