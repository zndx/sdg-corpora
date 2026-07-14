## The Architecture of Corporate Controlling

Organizations that manage complex financial operations rely on a structured ecosystem of reports, processes, users, and strategic plans to maintain visibility and control. At the center of this ecosystem sits the controlling report—a formal document that captures financial or operational data in a defined format, assigned to a specific business segment, authored by a designated user, and executed through a named business process. Each report carries a unique identifier, a human-readable name, a type classification, and a lifecycle status that moves from draft through review to approval or archival. The controlling function itself is organized around business segments—distinct operational units such as retail, properties, flight operations, or real estate—that may or may not be consolidated at the organizational level. Strategic plans provide the forward-looking dimension, defining planning horizons, driver-based methodologies, and approval states that guide how segments and their associated reports are managed over time.

**Table `controlling_reports`**

| id | report_id | report_name | report_type | creation_date | status | layout_format | process_id | business_segment_id | user_id | created_at |
|---|---|---|---|---|---|---|---|---|---|---|
| 1000 | 1202-0008-S | Legacy Survey D | annual_figures | 2022-01-13T12:24:00 | draft | print_ready | template_ivacode_pagata_art15 | 1 | 9736910 | 2025-01-01 00:14:00 |
| 1001 | 8189500 | Regional Corridor | balance_sheets | 2023-06-24T19:41:00 | review | board_presentation | 27cebc1c-9bad-11eb-a8a2-19ed5c03f8d3 | 2 | 40c1e50ce74c42d6801b1e2f409c1cfc | 2025-02-06 03:14:00 |
| 1002 | L355 | Seasonal Series | business_plans | 2024-11-08T02:58:00 | approved | excel_list | 57e52fbc-8fcd-11eb-924d-9cd76263cbd0 | 3 | 92297f70-9bad-11eb-a8a2-19ed5c03f8d3 | 2025-03-11 06:14:00 |
| 1003 | 5844272 | Integrated Assessment A | profit_and_loss | 2025-04-19T09:15:00 | archived | print_ready | 1205-0002-XL | 4 | 9125634 | 2025-04-16 09:14:00 |

The controlling reports table establishes the foundational ledger of all financial and operational documents produced within the organization. Each row represents a single report, identified by an internal surrogate key and a human-readable report identifier such as `1202-0008-S` or `8189500`. The report name—`Legacy Survey D`, `Regional Corridor`, `Seasonal Series`, `Integrated Assessment A`—provides a descriptive label, while the report type classifies the document into one of four categories: `annual_figures`, `balance_sheets`, `business_plans`, or `profit_and_loss`. The creation date records when the report was initially generated, and the status field tracks its current position in the workflow lifecycle, ranging from `draft` through `review` and `approved` to `archived`. The layout format indicates the intended output medium, with values such as `print_ready`, `board_presentation`, or `excel_list`. Each report is linked to a business process via the `process_id` column, a business segment through `business_segment_id`, and an authoring user through `user_id`.

**Table `business_segments`**

| id | segment_code | segment_name | segment_type | is_consolidated | parent_organization_id | controlling_report_id | business_segment_id |
|---|---|---|---|---|---|---|---|
| 1 | 3990169 | Adaptive Series | retail | false | Senseonics Holdings Inc. | 1000 | 1 |
| 2 | 9085246 | Primary Assessment | properties | true | Singapore General Hospital | 1001 | 2 |
| 3 | 5006449 | Composite Survey D | flight_operations | false | RECRUIT EXPRESS PTE LTD | 1002 | 3 |
| 4 | L137 | Compact Corridor | real_estate | true | Akamai Technologies | 1003 | 4 |

Business segments define the organizational boundaries within which reports are produced and processes are executed. The segment table records each unit with a code, a descriptive name, and a type classification. Segment `3990169`, named `Adaptive Series`, operates as a retail unit and is not consolidated, meaning its financial data is reported independently rather than rolled up into a parent entity. Segment `9085246`, `Primary Assessment`, operates in the properties domain and is marked as consolidated, indicating its figures are aggregated at a higher organizational level. The parent organization column identifies the overarching entity—`Senseonics Holdings Inc.`, `Singapore General Hospital`, `RECRUIT EXPRESS PTE LTD`, `Akamai Technologies`—providing a clear line of organizational accountability. Each segment is associated with a controlling report through the `controlling_report_id` column, establishing a direct linkage between the operational unit and the financial document it produces.

**Table `controlling_users`**

| user_id | user_name | role_title | department | is_strategic_planner | controlling_report_id | strategic_plan_id |
|---|---|---|---|---|---|---|
| 9736910 | Desiree Cain | Team Leader | Controlling Concepts and Systems | false | 1000 | 1 |
| 40c1e50ce74c42d6801b1e2f409c1cfc | Jennifer Summers | Controlling Expert | Corporate Controlling | true | 1001 | 2 |
| 92297f70-9bad-11eb-a8a2-19ed5c03f8d3 | Nicole Todd | Executive | Executive Reporting | false | 1002 | 3 |
| 9125634 | Rebekah Mueller | System Administrator | Controlling Concepts and Systems | true | 1003 | 4 |

The controlling users table captures the human element of the organization's financial operations. Each user is identified by a `user_id`, a `user_name`, and a `role_title` that specifies their functional capacity within the controlling function. Desiree Cain serves as a Team Leader within Controlling Concepts and Systems, while Jennifer Summers holds the title of Controlling Expert in Corporate Controlling. Nicole Todd operates as an Executive in Executive Reporting, and Rebekah Mueller functions as a System Administrator, also within Controlling Concepts and Systems. The `is_strategic_planner` flag distinguishes users who participate in strategic planning activities from those focused on operational controlling. Users are linked to specific controlling reports and strategic plans, creating a clear audit trail of responsibility and accountability.

**Table `strategic_plans`**

| id | plan_id | plan_name | planning_horizon | is_driver_based | approval_status | last_review_date | user_id | business_segment_id | controlling_report_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 505977 | Regional Cluster | 13 | false | proposed | 2022-09-03T08:24:00 | 9736910 | 1 | 1000 |
| 2 | 727038 | Seasonal Review D | 23 | true | approved | 2023-02-14T15:41:00 | 40c1e50ce74c42d6801b1e2f409c1cfc | 2 | 1001 |
| 3 | 937726 | Integrated Initiative | 33 | false | executing | 2024-07-25T22:58:00 | 92297f70-9bad-11eb-a8a2-19ed5c03f8d3 | 3 | 1002 |
| 4 | 1290 | Extended Model | 43 | true | monitored | 2025-12-09T05:15:00 | 9125634 | 4 | 1003 |

Strategic plans provide the forward-looking framework that guides how business segments and their reports are managed. Each plan carries a `plan_id`, a `plan_name`, and a `planning_horizon` expressed as a numeric value indicating the number of periods covered. Plan `505977`, `Regional Cluster`, spans a horizon of 13 periods and is not driver-based, meaning it relies on traditional budgeting approaches rather than activity-driven cost modeling. Plan `727038`, `Seasonal Review D`, covers 23 periods and is explicitly driver-based, incorporating cause-and-effect relationships into its projections. The `approval_status` field tracks the plan's lifecycle state—`proposed`, `approved`, `executing`, or `monitored`—while the `last_review_date` records when the plan was most recently evaluated. Each plan is associated with a controlling user, a business segment, and a controlling report, creating a comprehensive chain of strategic alignment.

**Table `business_processes`**

| process_id | process_name | process_category | is_automated | execution_frequency | controlling_report_id | business_segment_id | user_id |
|---|---|---|---|---|---|---|---|
| template_ivacode_pagata_art15 | Distributed Review | planning | false | daily | 1000 | 1 | 9736910 |
| 27cebc1c-9bad-11eb-a8a2-19ed5c03f8d3 | Adaptive Initiative D | reporting | true | weekly | 1001 | 2 | 40c1e50ce74c42d6801b1e2f409c1cfc |
| 57e52fbc-8fcd-11eb-924d-9cd76263cbd0 | Primary Model | accounting | false | monthly | 1002 | 3 | 92297f70-9bad-11eb-a8a2-19ed5c03f8d3 |
| 1205-0002-XL | Composite Cluster | consolidation | true | quarterly | 1003 | 4 | 9125634 |

Business processes define the operational mechanisms through which reports are generated, reviewed, and finalized. Each process is identified by a `process_id`, a `process_name`, and a `process_category` that classifies its functional domain. The `Distributed Review` process, identified as `template_ivacode_pagata_art15`, falls under the planning category and operates on a daily execution frequency without automation. The `Adaptive Initiative D` process, `27cebc1c-9bad-11eb-a8a2-18a2-19ed5c03f8d3`, is categorized as reporting, runs weekly, and is fully automated. The `Primary Model` process handles accounting functions on a monthly cadence without automation, while the `Composite Cluster` process manages consolidation activities quarterly and is automated. The `is_automated` flag indicates whether the process executes without manual intervention, and the `execution_frequency` field specifies how often the process runs. Each process is linked to a controlling report, a business segment, and a controlling user.

## Cross-Domain Relationships

The value of the controlling ecosystem emerges not from individual tables in isolation but from the relationships that connect them. Views provide structured lenses through which these relationships become visible, answering specific operational questions by joining data across multiple tables.

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

The controlling report to business process view answers the question: which operational process is responsible for generating each report? The join between controlling reports and business processes on the process identifier produces a clear mapping. Row 1000 shows that `Legacy Survey D`, an annual figures report, is produced through the `Distributed Review` process in the planning category. Row 1001 links the `Regional Corridor` balance sheet to the `Adaptive Initiative D` reporting process, which runs weekly and is automated. Row 1002 associates the `Seasonal Series` business plans with the `Primary Model` accounting process operating monthly, while row 1003 connects the `Integrated Assessment A` profit and loss report to the `Composite Cluster` consolidation process running quarterly.

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

This view reveals which business segment is associated with each controlling report. The join on the business segment identifier creates a direct correspondence between reports and their organizational home. Row 1000 places `Legacy Survey D` within the `Adaptive Series` retail segment operated by Senseonics Holdings Inc. Row 1001 associates `Regional Corridor` with the `Primary Assessment` properties segment under Singapore General Hospital. Row 1002 links `Seasonal Series` to the `Composite Survey D` flight operations segment managed by RECRUIT EXPRESS PTE LTD, and row 1003 connects `Integrated Assessment A` to the `Compact Corridor` real estate segment under Akamai Technologies.

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

The controlling report to controlling user view identifies the author responsible for each report. Row 1000 shows that `Legacy Survey D` was authored by Desiree Cain, a Team Leader in Controlling Concepts and Systems. Row 1001 attributes `Regional Corridor` to Jennifer Summers, a Controlling Expert in Corporate Controlling. Row 1002 links `Seasonal Series` to Nicole Todd, an Executive in Executive Reporting, while row 1003 associates `Integrated Assessment A` with Rebekah Mueller, a System Administrator in Controlling Concepts and Systems.

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

Reversing the perspective, this view answers the question: which controlling report is associated with each business segment? Row 1 shows that the `Adaptive Series` retail segment is linked to report `1202-0008-S` (`Legacy Survey D`). Row 2 connects the `Primary Assessment` properties segment to report `8189500` (`Regional Corridor`). Row 3 associates the `Composite Survey D` flight operations segment with report `L355` (`Seasonal Series`), and row 4 links the `Compact Corridor` real estate segment to report `5844272` (`Integrated Assessment A`).

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

This self-referential view on the business segments table provides a structural lens for examining segment-to-segment relationships. Each row reproduces the full segment record, enabling comparative analysis across segments. Row 1 presents the `Adaptive Series` retail segment with code `3990169`, non-consolidated status, and parent organization Senseonics Holdings Inc. Row 2 shows the `Primary Assessment` properties segment with code `9085246`, consolidated status, and parent Singapore General Hospital. Row 3 presents `Composite Survey D` in flight operations with code `5006449`, non-consolidated status, under RECRUIT EXPRESS PTE LTD. Row 4 shows `Compact Corridor` in real estate with code `L137`, consolidated status, under Akamai Technologies.

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

This view maps controlling users to their associated reports, answering the question: which reports is each user responsible for? Row 1 shows that Desiree Cain (user `9736910`) is associated with report `1202-0008-S` (`Legacy Survey D`). Row 2 links Jennifer Summers (user `40c1e50ce74c42d6801b1e2f409c1cfc`) to report `8189500` (`Regional Corridor`). Row 3 associates Nicole Todd (user `92297f70-9bad-11eb-a8a2-19ed5c03f8d3`) with report `L355` (`Seasonal Series`), and row 4 connects Rebekah Mueller (user `9125634`) to report `5844272` (`Integrated Assessment A`).

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

The controlling user to strategic plan view reveals which strategic plan each user participates in. Row 1 shows that Desiree Cain is associated with plan `505977` (`Regional Cluster`), a 13-period non-driver-based plan in proposed status. Row 2 links Jennifer Summers to plan `727038` (`Seasonal Review D`), a 23-period driver-based plan in approved status. Row 3 associates Nicole Todd with plan `937726` (`Integrated Initiative`), a 33-period non-driver-based plan in executing status. Row 4 connects Rebekah Mueller to plan `1290` (`Extended Model`), a 43-period driver-based plan in monitored status.

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

Reversing the perspective, this view answers: which user is associated with each strategic plan? Row 1 shows that plan `505977` (`Regional Cluster`) is managed by Desiree Cain. Row 2 links plan `727038` (`Seasonal Review D`) to Jennifer Summers. Row 3 associates plan `937726` (`Integrated Initiative`) with Nicole Todd, and row 4 connects plan `1290` (`Extended Model`) to Rebekah Mueller.

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

This view maps strategic plans to their associated business segments, answering the question: which segment does each strategic plan govern? Row 1 shows that plan `505977` (`Regional Cluster`) is associated with segment `3990169` (`Adaptive Series`). Row 2 links plan `727038` (`Seasonal Review D`) to segment `9085246` (`Primary Assessment`). Row 3 associates plan `937726` (`Integrated Initiative`) with segment `5006449` (`Composite Survey D`), and row 4 connects plan `1290` (`Extended Model`) to segment `L137` (`Compact Corridor`).

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

The strategic plan to controlling report view reveals which report is associated with each strategic plan. Row 1 shows that plan `505977` (`Regional Cluster`) is linked to report `1202-0008-S` (`Legacy Survey D`). Row 2 links plan `727038` (`Seasonal Review D`) to report `8189500` (`Regional Corridor`). Row 3 associates plan `937726` (`Integrated Initiative`) with report `L355` (`Seasonal Series`), and row 4 connects plan `1290` (`Extended Model`) to report `5844272` (`Integrated Assessment A`).

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

This view maps business processes to their associated controlling reports, answering the question: which process generates each report? Row 1 shows that the `Distributed Review` process (`template_ivacode_pagata_art15`) generates report `1202-0008-S` (`Legacy Survey D`). Row 2 links the `Adaptive Initiative D` process (`27cebc1c-9bad-11eb-a8a2-19ed5c03f8d3`) to report `8189500` (`Regional Corridor`). Row 3 associates the `Primary Model` process (`57e52fbc-8fcd-11eb-924d-9cd76263cbd0`) with report `L355` (`Seasonal Series`), and row 4 connects the `Composite Cluster` process (`1205-0002-XL`) to report `5844272` (`Integrated Assessment A`).

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

The business process to business segment view reveals which segment each process operates within. Row 1 shows that the `Distributed Review` process operates within segment `3990169` (`Adaptive Series`). Row 2 links the `Adaptive Initiative D` process to segment `9085246` (`Primary Assessment`). Row 3 associates the `Primary Model` process with segment `5006449` (`Composite Survey D`), and row 4 connects the `Composite Cluster` process to segment `L137` (`Compact Corridor`).

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

This view maps business processes to their associated controlling users, answering the question: which user is responsible for each process? Row 1 shows that the `Distributed Review` process is managed by user `9736910` (Desiree Cain). Row 2 links the `Adaptive Initiative D` process to user `40c1e50ce74c42d6801b1e2f409c1cfc` (Jennifer Summers). Row 3 associates the `Primary Model` process with user `92297f70-9bad-11eb-924d-9cd76263cbd0` (Nicole Todd), and row 4 connects the `Composite Cluster` process to user `9125634` (Rebekah Mueller).

## Synthesis

The controlling ecosystem functions as an integrated network where reports, segments, users, plans, and processes are interdependent. A single controlling report such as `Legacy Survey D` (identifier `1202-0008-S`) sits at the intersection of multiple relationships: it is produced by the `Distributed Review` process in the planning category, assigned to the `Adaptive Series` retail segment under Senseonics Holdings Inc., authored by Desiree Cain, and governed by strategic plan `505977` (`Regional Cluster`). Similarly, the `Regional Corridor` balance sheet (`8189500`) connects the `Adaptive Initiative D` automated reporting process, the `Primary Assessment` consolidated properties segment, Jennifer Summers as its author, and the `Seasonal Review D` driver-based strategic plan spanning 23 periods. This web of relationships ensures that every financial document can be traced to its operational origin, its organizational home, its responsible individual, and its strategic context—providing the transparency and accountability that effective corporate controlling requires.