## Ontology-Grounded Relational Modelling of the Controlling Domain

The controlling domain captures the lifecycle of financial and operational reporting within multi-organizational enterprises. At its core, a `controlling_report` is the central fact: a named document of a specific `report_type` (such as `annual_figures`, `balance_sheets`, `business_plans`, or `profit_and_loss`) that is authored by a `controlling_user`, associated with a `business_segment`, and executed under a `business_process`. The relational schema materialises this ontology through five base tables whose primary keys and foreign keys encode the cardinality-bounded relationships between these entity types. Every view in the schema is a single `JOIN` that reconstructs a domain fact from the normalised tables, projecting the relevant columns into a denormalised row that answers a concrete business question.

**Table `controlling_reports`**

| id | report_id | report_name | report_type | creation_date | status | layout_format | process_id | business_segment_id | user_id | created_at |
|---|---|---|---|---|---|---|---|---|---|---|
| 1000 | 1202-0008-S | Legacy Survey D | annual_figures | 2022-01-13T12:24:00 | draft | print_ready | template_ivacode_pagata_art15 | 1 | 9736910 | 2025-01-01 00:14:00 |
| 1001 | 8189500 | Regional Corridor | balance_sheets | 2023-06-24T19:41:00 | review | board_presentation | 27cebc1c-9bad-11eb-a8a2-19ed5c03f8d3 | 2 | 40c1e50ce74c42d6801b1e2f409c1cfc | 2025-02-06 03:14:00 |
| 1002 | L355 | Seasonal Series | business_plans | 2024-11-08T02:58:00 | approved | excel_list | 57e52fbc-8fcd-11eb-924d-9cd76263cbd0 | 3 | 92297f70-9bad-11eb-a8a2-19ed5c03f8d3 | 2025-03-11 06:14:00 |
| 1003 | 5844272 | Integrated Assessment A | profit_and_loss | 2025-04-19T09:15:00 | archived | print_ready | 1205-0002-XL | 4 | 9125634 | 2025-04-16 09:14:00 |

The `controlling_reports` table is the hub of the schema. Its surrogate primary key `id` (values `1000` through `1003`) is an internal identifier, while the business-level `report_id` column carries human-readable codes such as `1202-0008-S` and `8189500`. The `report_name` column stores descriptive titles like "Legacy Survey D" and "Regional Corridor", and `report_type` classifies each report into one of four categories. The `status` column tracks the workflow state (`draft`, `review`, `approved`, `archived`), and `layout_format` records the output medium (`print_ready`, `board_presentation`, `excel_list`). Three foreign keys anchor the report to the rest of the domain: `process_id` references `business_processes.process_id`, `business_segment_id` references `business_segments.id`, and `user_id` references `controlling_users.user_id`. The `created_at` timestamp records when the row was inserted. Because every foreign key is present on every row, the cardinality is one-to-one in the sample data — each report is linked to exactly one process, one segment, and one user.

**Table `business_segments`**

| id | segment_code | segment_name | segment_type | is_consolidated | parent_organization_id | controlling_report_id | business_segment_id |
|---|---|---|---|---|---|---|---|
| 1 | 3990169 | Adaptive Series | retail | false | Senseonics Holdings Inc. | 1000 | 1 |
| 2 | 9085246 | Primary Assessment | properties | true | Singapore General Hospital | 1001 | 2 |
| 3 | 5006449 | Composite Survey D | flight_operations | false | RECRUIT EXPRESS PTE LTD | 1002 | 3 |
| 4 | L137 | Compact Corridor | real_estate | true | Akamai Technologies | 1003 | 4 |

The `business_segments` table models the organisational units to which reports belong. Its surrogate key `id` (values `1` through `4`) is referenced by `controlling_reports.business_segment_id`. The business-level `segment_code` column carries identifiers such as `3990169` and `L137`, while `segment_name` stores human-readable labels like "Adaptive Series" and "Compact Corridor". The `segment_type` column classifies the segment (`retail`, `properties`, `flight_operations`, `real_estate`), and `is_consolidated` is a boolean flag indicating whether the segment participates in consolidation. The `parent_organization_id` column stores the name of the parent organisation (e.g., "Senseonics Holdings Inc.", "Singapore General Hospital"). Two additional foreign keys — `controlling_report_id` and `business_segment_id` — create reverse and self-referencing links back to the controlling domain, enabling views that navigate from segment to report and from segment to its parent segment.

**Table `controlling_users`**

| user_id | user_name | role_title | department | is_strategic_planner | controlling_report_id | strategic_plan_id |
|---|---|---|---|---|---|---|
| 9736910 | Desiree Cain | Team Leader | Controlling Concepts and Systems | false | 1000 | 1 |
| 40c1e50ce74c42d6801b1e2f409c1cfc | Jennifer Summers | Controlling Expert | Corporate Controlling | true | 1001 | 2 |
| 92297f70-9bad-11eb-a8a2-19ed5c03f8d3 | Nicole Todd | Executive | Executive Reporting | false | 1002 | 3 |
| 9125634 | Rebekah Mueller | System Administrator | Controlling Concepts and Systems | true | 1003 | 4 |

The `controlling_users` table stores the people who author and manage reports. Its primary key `user_id` is a heterogeneous identifier: some rows use numeric strings like `9736910`, while others use UUIDs such as `40c1e50ce74c42d6801b1e2f409c1cfc`. The `user_name` column holds names like "Desiree Cain" and "Jennifer Summers", `role_title` captures the job title ("Team Leader", "Controlling Expert", "Executive", "System Administrator"), and `department` records the organisational unit ("Controlling Concepts and Systems", "Corporate Controlling", "Executive Reporting"). The boolean `is_strategic_planner` flag distinguishes users who participate in strategic planning. The foreign key `controlling_report_id` links a user to the report they authored, and `strategic_plan_id` links them to a strategic plan, enabling the strategic planning facet of the domain.

**Table `strategic_plans`**

| id | plan_id | plan_name | planning_horizon | is_driver_based | approval_status | last_review_date | user_id | business_segment_id | controlling_report_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 505977 | Regional Cluster | 13 | false | proposed | 2022-09-03T08:24:00 | 9736910 | 1 | 1000 |
| 2 | 727038 | Seasonal Review D | 23 | true | approved | 2023-02-14T15:41:00 | 40c1e50ce74c42d6801b1e2f409c1cfc | 2 | 1001 |
| 3 | 937726 | Integrated Initiative | 33 | false | executing | 2024-07-25T22:58:00 | 92297f70-9bad-11eb-a8a2-19ed5c03f8d3 | 3 | 1002 |
| 4 | 1290 | Extended Model | 43 | true | monitored | 2025-12-09T05:15:00 | 9125634 | 4 | 1003 |

The `strategic_plans` table captures long-term planning artefacts. Its surrogate key `id` (values `1` through `4`) is referenced by `controlling_users.strategic_plan_id`. The business-level `plan_id` column carries codes such as `505977` and `1290`, while `plan_name` stores titles like "Regional Cluster" and "Extended Model". The `planning_horizon` column is an integer representing the number of periods covered (values `13`, `23`, `33`, `43`), and `is_driver_based` is a boolean indicating whether the plan uses driver-based methodology. The `approval_status` column tracks the lifecycle state (`proposed`, `approved`, `executing`, `monitored`), and `last_review_date` records the most recent review. Three foreign keys anchor the plan to the domain: `user_id` references `controlling_users.user_id`, `business_segment_id` references `business_segments.id`, and `controlling_report_id` references `controlling_reports.id`.

**Table `business_processes`**

| process_id | process_name | process_category | is_automated | execution_frequency | controlling_report_id | business_segment_id | user_id |
|---|---|---|---|---|---|---|---|
| template_ivacode_pagata_art15 | Distributed Review | planning | false | daily | 1000 | 1 | 9736910 |
| 27cebc1c-9bad-11eb-a8a2-19ed5c03f8d3 | Adaptive Initiative D | reporting | true | weekly | 1001 | 2 | 40c1e50ce74c42d6801b1e2f409c1cfc |
| 57e52fbc-8fcd-11eb-924d-9cd76263cbd0 | Primary Model | accounting | false | monthly | 1002 | 3 | 92297f70-9bad-11eb-a8a2-19ed5c03f8d3 |
| 1205-0002-XL | Composite Cluster | consolidation | true | quarterly | 1003 | 4 | 9125634 |

The `business_processes` table models the operational workflows under which reports are produced. Its primary key `process_id` is a heterogeneous identifier — some values are UUIDs like `27cebc1c-9bad-11eb-a8a2-19ed5c03f8d3`, while others are alphanumeric codes such as `template_ivacode_pagata_art15` and `1205-0002-XL`. The `process_name` column stores descriptive titles ("Distributed Review", "Adaptive Initiative D", "Primary Model", "Composite Cluster"), and `process_category` classifies the process (`planning`, `reporting`, `accounting`, `consolidation`). The boolean `is_automated` flag indicates whether the process is automated, and `execution_frequency` records how often it runs (`daily`, `weekly`, `monthly`, `quarterly`). Three foreign keys — `controlling_report_id`, `business_segment_id`, and `user_id` — link the process back to the controlling report, the business segment, and the controlling user, respectively.

The five base tables form a star-like topology with `controlling_reports` at the centre. Every foreign key in the schema is a column in one table that references the primary key of another, and every view is a single `JOIN` that reconstructs a domain fact by combining the hub with one of its spokes. The following sections interpret each view.

**View `vw_controlling_report_business_process`**

```sql
CREATE VIEW vw_controlling_report_business_process AS
SELECT a.id, a.report_id, a.report_name, a.report_type, b.process_id AS process_process_id, b.process_name AS process_process_name, b.process_category AS process_process_category
FROM controlling_reports a JOIN business_processes b ON a.process_id = b.process_id;
```

| id | report_id | report_name | report_type | process_process_id | process_process_name | process_process_category |
|---|---|---|---|---|---|---|
| 1000 | 1202-0008-S | Legacy Survey D | annual_figures | template_ivacode_pagata_art15 | Distributed Review | planning |
| 1001 | 8189500 | Regional Corridor | balance_sheets | 27cebc1c-9bad-11eb-a8a2-19ed5c03f8d3 | Adaptive Initiative D | reporting |
| 1002 | L355 | Seasonal Series | business_plans | 57e52fbc-8fcd-11eb-924d-9cd76263cbd0 | Primary Model | accounting |
| 1003 | 5844272 | Integrated Assessment A | profit_and_loss | 1205-0002-XL | Composite Cluster | consolidation |

The view `vw_controlling_report_business_process` answers the question: "Which business process is associated with each controlling report?" It joins `controlling_reports` to `business_processes` on `a.process_id = b.process_id`, projecting the report's `id`, `report_id`, `report_name`, and `report_type` alongside the process's `process_id`, `process_name`, and `process_category`. The result shows that report `1202-0008-S` ("Legacy Survey D", type `annual_figures`) is executed under the "Distributed Review" process in the `planning` category, while report `8189500` ("Regional Corridor", type `balance_sheets`) runs under "Adaptive Initiative D" in the `reporting` category. This view materialises the process-report relationship as a flat row suitable for reporting dashboards.

**View `vw_controlling_report_business_segment`**

```sql
CREATE VIEW vw_controlling_report_business_segment AS
SELECT a.id, a.report_id, a.report_name, a.report_type, b.id AS segment_id, b.segment_code AS segment_segment_code, b.segment_name AS segment_segment_name
FROM controlling_reports a JOIN business_segments b ON a.business_segment_id = b.id;
```

| id | report_id | report_name | report_type | segment_id | segment_segment_code | segment_segment_name |
|---|---|---|---|---|---|---|
| 1000 | 1202-0008-S | Legacy Survey D | annual_figures | 1 | 3990169 | Adaptive Series |
| 1001 | 8189500 | Regional Corridor | balance_sheets | 2 | 9085246 | Primary Assessment |
| 1002 | L355 | Seasonal Series | business_plans | 3 | 5006449 | Composite Survey D |
| 1003 | 5844272 | Integrated Assessment A | profit_and_loss | 4 | L137 | Compact Corridor |

The view `vw_controlling_report_business_segment` answers: "Which business segment does each controlling report belong to?" It joins `controlling_reports` to `business_segments` on `a.business_segment_id = b.id`. The result shows that report `1202-0008-S` is associated with segment `3990169` ("Adaptive Series", type `retail`), while report `8189500` is associated with segment `9085246` ("Primary Assessment", type `properties`). This view reconstructs the segment-report relationship, enabling analysts to filter reports by organisational unit.

**View `vw_controlling_report_controlling_user`**

```sql
CREATE VIEW vw_controlling_report_controlling_user AS
SELECT a.id, a.report_id, a.report_name, a.report_type, b.user_id AS user_user_id, b.user_name AS user_user_name, b.role_title AS user_role_title
FROM controlling_reports a JOIN controlling_users b ON a.user_id = b.user_id;
```

| id | report_id | report_name | report_type | user_user_id | user_user_name | user_role_title |
|---|---|---|---|---|---|---|
| 1000 | 1202-0008-S | Legacy Survey D | annual_figures | 9736910 | Desiree Cain | Team Leader |
| 1001 | 8189500 | Regional Corridor | balance_sheets | 40c1e50ce74c42d6801b1e2f409c1cfc | Jennifer Summers | Controlling Expert |
| 1002 | L355 | Seasonal Series | business_plans | 92297f70-9bad-11eb-a8a2-19ed5c03f8d3 | Nicole Todd | Executive |
| 1003 | 5844272 | Integrated Assessment A | profit_and_loss | 9125634 | Rebekah Mueller | System Administrator |

The view `vw_controlling_report_controlling_user` answers: "Who authored each controlling report?" It joins `controlling_reports` to `controlling_users` on `a.user_id = b.user_id`. The result shows that report `1202-0008-S` was authored by "Desiree Cain" (role: "Team Leader", department: "Controlling Concepts and Systems"), while report `8189500` was authored by "Jennifer Summers" (role: "Controlling Expert", department: "Corporate Controlling"). This view materialises the user-report relationship, enabling audit trails and accountability reports.

**View `vw_business_segment_controlling_report`**

```sql
CREATE VIEW vw_business_segment_controlling_report AS
SELECT a.id, a.segment_code, a.segment_name, a.segment_type, b.id AS report_id, b.report_id AS report_report_id, b.report_name AS report_report_name
FROM business_segments a JOIN controlling_reports b ON a.controlling_report_id = b.id;
```

| id | segment_code | segment_name | segment_type | report_id | report_report_id | report_report_name |
|---|---|---|---|---|---|---|
| 1 | 3990169 | Adaptive Series | retail | 1000 | 1202-0008-S | Legacy Survey D |
| 2 | 9085246 | Primary Assessment | properties | 1001 | 8189500 | Regional Corridor |
| 3 | 5006449 | Composite Survey D | flight_operations | 1002 | L355 | Seasonal Series |
| 4 | L137 | Compact Corridor | real_estate | 1003 | 5844272 | Integrated Assessment A |

The view `vw_business_segment_controlling_report` answers the reverse question: "Which controlling reports are linked to each business segment?" It joins `business_segments` to `controlling_reports` on `a.controlling_report_id = b.id`. The result shows that segment `3990169` ("Adaptive Series") is linked to report `1202-0008-S`, while segment `9085246` ("Primary Assessment") is linked to report `8189500`. This view is useful when starting from the organisational unit and wanting to enumerate its associated reports.

**View `vw_business_segment_business_segment`**

```sql
CREATE VIEW vw_business_segment_business_segment AS
SELECT a.id, a.segment_code, a.segment_name, a.segment_type, b.id AS segment_id, b.segment_code AS segment_segment_code, b.segment_name AS segment_segment_name
FROM business_segments a JOIN business_segments b ON a.business_segment_id = b.id;
```

| id | segment_code | segment_name | segment_type | segment_id | segment_segment_code | segment_segment_name |
|---|---|---|---|---|---|---|
| 1 | 3990169 | Adaptive Series | retail | 1 | 3990169 | Adaptive Series |
| 2 | 9085246 | Primary Assessment | properties | 2 | 9085246 | Primary Assessment |
| 3 | 5006449 | Composite Survey D | flight_operations | 3 | 5006449 | Composite Survey D |
| 4 | L137 | Compact Corridor | real_estate | 4 | L137 | Compact Corridor |

The view `vw_business_segment_business_segment` answers: "Which business segment is the parent of each business segment?" It joins `business_segments` to itself on `a.business_segment_id = b.id`. The result shows that segment `3990169` ("Adaptive Series") has parent segment `1` ("Adaptive Series"), while segment `9085246` ("Primary Assessment") has parent segment `2` ("Primary Assessment"). This self-join reconstructs the hierarchical parent-child relationship within the segment ontology, enabling org-chart-style navigation.

**View `vw_controlling_user_controlling_report`**

```sql
CREATE VIEW vw_controlling_user_controlling_report AS
SELECT a.user_id, a.user_name, a.role_title, a.department, b.id AS report_id, b.report_id AS report_report_id, b.report_name AS report_report_name
FROM controlling_users a JOIN controlling_reports b ON a.controlling_report_id = b.id;
```

| user_id | user_name | role_title | department | report_id | report_report_id | report_report_name |
|---|---|---|---|---|---|---|
| 9736910 | Desiree Cain | Team Leader | Controlling Concepts and Systems | 1000 | 1202-0008-S | Legacy Survey D |
| 40c1e50ce74c42d6801b1e2f409c1cfc | Jennifer Summers | Controlling Expert | Corporate Controlling | 1001 | 8189500 | Regional Corridor |
| 92297f70-9bad-11eb-a8a2-19ed5c03f8d3 | Nicole Todd | Executive | Executive Reporting | 1002 | L355 | Seasonal Series |
| 9125634 | Rebekah Mueller | System Administrator | Controlling Concepts and Systems | 1003 | 5844272 | Integrated Assessment A |

The view `vw_controlling_user_controlling_report` answers: "Which controlling report is linked to each controlling user?" It joins `controlling_users` to `controlling_reports` on `a.controlling_report_id = b.id`. The result shows that user "Desiree Cain" (user_id `9736910`) is linked to report `1202-0008-S`, while user "Jennifer Summers" (user_id `40c1e50ce74c42d6801b1e2f409c1cfc`) is linked to report `8189500`. This view is the user-centric counterpart to `vw_controlling_report_controlling_user`.

**View `vw_controlling_user_strategic_plan`**

```sql
CREATE VIEW vw_controlling_user_strategic_plan AS
SELECT a.user_id, a.user_name, a.role_title, a.department, b.id AS plan_id, b.plan_id AS plan_plan_id, b.plan_name AS plan_plan_name
FROM controlling_users a JOIN strategic_plans b ON a.strategic_plan_id = b.id;
```

| user_id | user_name | role_title | department | plan_id | plan_plan_id | plan_plan_name |
|---|---|---|---|---|---|---|
| 9736910 | Desiree Cain | Team Leader | Controlling Concepts and Systems | 1 | 505977 | Regional Cluster |
| 40c1e50ce74c42d6801b1e2f409c1cfc | Jennifer Summers | Controlling Expert | Corporate Controlling | 2 | 727038 | Seasonal Review D |
| 92297f70-9bad-11eb-a8a2-19ed5c03f8d3 | Nicole Todd | Executive | Executive Reporting | 3 | 937726 | Integrated Initiative |
| 9125634 | Rebekah Mueller | System Administrator | Controlling Concepts and Systems | 4 | 1290 | Extended Model |

The view `vw_controlling_user_strategic_plan` answers: "Which strategic plan is assigned to each controlling user?" It joins `controlling_users` to `strategic_plans` on `a.strategic_plan_id = b.id`. The result shows that user "Desiree Cain" is assigned to strategic plan `505977` ("Regional Cluster", planning horizon `13`, status `proposed`), while user "Jennifer Summers" is assigned to plan `727038` ("Seasonal Review D", planning horizon `23`, status `approved`). This view materialises the user-plan relationship, enabling workload and responsibility tracking.

**View `vw_strategic_plan_controlling_user`**

```sql
CREATE VIEW vw_strategic_plan_controlling_user AS
SELECT a.id, a.plan_id, a.plan_name, a.planning_horizon, b.user_id AS user_user_id, b.user_name AS user_user_name, b.role_title AS user_role_title
FROM strategic_plans a JOIN controlling_users b ON a.user_id = b.user_id;
```

| id | plan_id | plan_name | planning_horizon | user_user_id | user_user_name | user_role_title |
|---|---|---|---|---|---|---|
| 1 | 505977 | Regional Cluster | 13 | 9736910 | Desiree Cain | Team Leader |
| 2 | 727038 | Seasonal Review D | 23 | 40c1e50ce74c42d6801b1e2f409c1cfc | Jennifer Summers | Controlling Expert |
| 3 | 937726 | Integrated Initiative | 33 | 92297f70-9bad-11eb-a8a2-19ed5c03f8d3 | Nicole Todd | Executive |
| 4 | 1290 | Extended Model | 43 | 9125634 | Rebekah Mueller | System Administrator |

The view `vw_strategic_plan_controlling_user` answers the reverse: "Which controlling user is assigned to each strategic plan?" It joins `strategic_plans` to `controlling_users` on `a.user_id = b.user_id`. The result shows that plan `505977` ("Regional Cluster") is assigned to user "Desiree Cain", while plan `727038` ("Seasonal Review D") is assigned to user "Jennifer Summers". This view is useful when starting from the strategic plan and wanting to enumerate its assigned users.

**View `vw_strategic_plan_business_segment`**

```sql
CREATE VIEW vw_strategic_plan_business_segment AS
SELECT a.id, a.plan_id, a.plan_name, a.planning_horizon, b.id AS segment_id, b.segment_code AS segment_segment_code, b.segment_name AS segment_segment_name
FROM strategic_plans a JOIN business_segments b ON a.business_segment_id = b.id;
```

| id | plan_id | plan_name | planning_horizon | segment_id | segment_segment_code | segment_segment_name |
|---|---|---|---|---|---|---|
| 1 | 505977 | Regional Cluster | 13 | 1 | 3990169 | Adaptive Series |
| 2 | 727038 | Seasonal Review D | 23 | 2 | 9085246 | Primary Assessment |
| 3 | 937726 | Integrated Initiative | 33 | 3 | 5006449 | Composite Survey D |
| 4 | 1290 | Extended Model | 43 | 4 | L137 | Compact Corridor |

The view `vw_strategic_plan_business_segment` answers: "Which business segment is associated with each strategic plan?" It joins `strategic_plans` to `business_segments` on `a.business_segment_id = b.id`. The result shows that plan `505977` ("Regional Cluster") is associated with segment `3990169` ("Adaptive Series"), while plan `727038` ("Seasonal Review D") is associated with segment `9085246` ("Primary Assessment"). This view reconstructs the plan-segment relationship, enabling strategic planning to be traced back to its organisational context.

**View `vw_strategic_plan_controlling_report`**

```sql
CREATE VIEW vw_strategic_plan_controlling_report AS
SELECT a.id, a.plan_id, a.plan_name, a.planning_horizon, b.id AS report_id, b.report_id AS report_report_id, b.report_name AS report_report_name
FROM strategic_plans a JOIN controlling_reports b ON a.controlling_report_id = b.id;
```

| id | plan_id | plan_name | planning_horizon | report_id | report_report_id | report_report_name |
|---|---|---|---|---|---|---|
| 1 | 505977 | Regional Cluster | 13 | 1000 | 1202-0008-S | Legacy Survey D |
| 2 | 727038 | Seasonal Review D | 23 | 1001 | 8189500 | Regional Corridor |
| 3 | 937726 | Integrated Initiative | 33 | 1002 | L355 | Seasonal Series |
| 4 | 1290 | Extended Model | 43 | 1003 | 5844272 | Integrated Assessment A |

The view `vw_strategic_plan_controlling_report` answers: "Which controlling report is linked to each strategic plan?" It joins `strategic_plans` to `controlling_reports` on `a.controlling_report_id = b.id`. The result shows that plan `505977` ("Regional Cluster") is linked to report `1202-0008-S`, while plan `727038` ("Seasonal Review D") is linked to report `8189500`. This view materialises the plan-report relationship, enabling traceability from strategic intent to operational reporting.

**View `vw_business_process_controlling_report`**

```sql
CREATE VIEW vw_business_process_controlling_report AS
SELECT a.process_id, a.process_name, a.process_category, a.is_automated, b.id AS report_id, b.report_id AS report_report_id, b.report_name AS report_report_name
FROM business_processes a JOIN controlling_reports b ON a.controlling_report_id = b.id;
```

| process_id | process_name | process_category | is_automated | report_id | report_report_id | report_report_name |
|---|---|---|---|---|---|---|
| template_ivacode_pagata_art15 | Distributed Review | planning | false | 1000 | 1202-0008-S | Legacy Survey D |
| 27cebc1c-9bad-11eb-a8a2-19ed5c03f8d3 | Adaptive Initiative D | reporting | true | 1001 | 8189500 | Regional Corridor |
| 57e52fbc-8fcd-11eb-924d-9cd76263cbd0 | Primary Model | accounting | false | 1002 | L355 | Seasonal Series |
| 1205-0002-XL | Composite Cluster | consolidation | true | 1003 | 5844272 | Integrated Assessment A |

The view `vw_business_process_controlling_report` answers the reverse: "Which controlling report is linked to each business process?" It joins `business_processes` to `controlling_reports` on `a.controlling_report_id = b.id`. The result shows that process "Distributed Review" (category `planning`) is linked to report `1202-0008-S`, while process "Adaptive Initiative D" (category `reporting`) is linked to report `8189500`. This view is useful when starting from the process and wanting to enumerate its associated reports.

**View `vw_business_process_business_segment`**

```sql
CREATE VIEW vw_business_process_business_segment AS
SELECT a.process_id, a.process_name, a.process_category, a.is_automated, b.id AS segment_id, b.segment_code AS segment_segment_code, b.segment_name AS segment_segment_name
FROM business_processes a JOIN business_segments b ON a.business_segment_id = b.id;
```

| process_id | process_name | process_category | is_automated | segment_id | segment_segment_code | segment_segment_name |
|---|---|---|---|---|---|---|
| template_ivacode_pagata_art15 | Distributed Review | planning | false | 1 | 3990169 | Adaptive Series |
| 27cebc1c-9bad-11eb-a8a2-19ed5c03f8d3 | Adaptive Initiative D | reporting | true | 2 | 9085246 | Primary Assessment |
| 57e52fbc-8fcd-11eb-924d-9cd76263cbd0 | Primary Model | accounting | false | 3 | 5006449 | Composite Survey D |
| 1205-0002-XL | Composite Cluster | consolidation | true | 4 | L137 | Compact Corridor |

The view `vw_business_process_business_segment` answers: "Which business segment is associated with each business process?" It joins `business_processes` to `business_segments` on `a.business_segment_id = b.id`. The result shows that process "Distributed Review" is associated with segment `3990169` ("Adaptive Series"), while process "Adaptive Initiative D" is associated with segment `9085246` ("Primary Assessment"). This view reconstructs the process-segment relationship, enabling operational workflows to be traced back to their organisational context.

**View `vw_business_process_controlling_user`**

```sql
CREATE VIEW vw_business_process_controlling_user AS
SELECT a.process_id, a.process_name, a.process_category, a.is_automated, b.user_id AS user_user_id, b.user_name AS user_user_name, b.role_title AS user_role_title
FROM business_processes a JOIN controlling_users b ON a.user_id = b.user_id;
```

| process_id | process_name | process_category | is_automated | user_user_id | user_user_name | user_role_title |
|---|---|---|---|---|---|---|
| template_ivacode_pagata_art15 | Distributed Review | planning | false | 9736910 | Desiree Cain | Team Leader |
| 27cebc1c-9bad-11eb-a8a2-19ed5c03f8d3 | Adaptive Initiative D | reporting | true | 40c1e50ce74c42d6801b1e2f409c1cfc | Jennifer Summers | Controlling Expert |
| 57e52fbc-8fcd-11eb-924d-9cd76263cbd0 | Primary Model | accounting | false | 92297f70-9bad-11eb-a8a2-19ed5c03f8d3 | Nicole Todd | Executive |
| 1205-0002-XL | Composite Cluster | consolidation | true | 9125634 | Rebekah Mueller | System Administrator |

The view `vw_business_process_controlling_user` answers: "Which controlling user is associated with each business process?" It joins `business_processes` to `controlling_users` on `a.user_id = b.user_id`. The result shows that process "Distributed Review" is associated with user "Desiree Cain" (user_id `9736910`), while process "Adaptive Initiative D" is associated with user "Jennifer Summers" (user_id `40c1e50ce74c42d6801b1e2f409c1cfc`). This view materialises the process-user relationship, enabling accountability and workload tracking at the operational level.

The schema's design reflects a disciplined normalisation strategy: each entity type lives in its own table with a single primary key, and every relationship is expressed as a foreign key column in the table that is the many side of the relationship. The `controlling_reports` table, as the central hub, carries three foreign keys pointing to `business_processes`, `business_segments`, and `controlling_users`. The `strategic_plans` table carries three foreign keys pointing to `controlling_users`, `business_segments`, and `controlling_reports`. The `business_processes` table carries three foreign keys pointing to `controlling_reports`, `business_segments`, and `controlling_users`. The `business_segments` table carries two foreign keys pointing to `controlling_reports` and itself. Every view is a single `JOIN` that reconstructs a domain fact from two normalised tables, projecting a subset of columns into a denormalised row. This pattern — normalise at the base, denormalise at the view — ensures that the schema is both update-consistent (changes propagate through foreign keys) and query-convenient (views present flat, report-ready rows). The result is a relational model that faithfully mirrors the controlling ontology: reports, segments, users, plans, and processes, each with their attributes and cardinality-bounded relationships, materialised as tables, columns, foreign keys, and views.