## The Care Services Ecosystem

Home care delivery operates as a tightly regulated ecosystem where organizations, individuals, and operational records intersect across multiple dimensions. A care agency provides services to recipients, each of whom carries a personalized care plan composed of discrete tasks. Staff assignments bind those tasks to specific recipients on defined schedules, while inspection events and their accompanying reports document regulatory oversight of the agencies themselves. Understanding how these records relate requires tracing the flow from organizational registration through individual care delivery and the compliance mechanisms that govern them.

**Table `care_agencies`**

| id | agency_id | agency_name | registered_address | contact_telephone | website_url | registration_status | last_inspection_date | inspection_event_id | care_recipient_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | U.S. Steel | FSG Social Impact Advisors | regional-register-36 | Walter Pratt | https://github.com/chiphuyen/lazynlp | active | 2025-04-12T15:09:00 | 100 | 1 |
| 2 | Nikola Corporation | Whirlpool Corporation | legacy-register-37 | Anand Central Lab | https://bugs.launchpad.net/ironic/+bug/1346406 | suspended | 2022-09-23T22:26:00 | 101 | 2 |
| 3 | Oberthur Technologies | Education Writers Association | compact-register-38 | Ryan Brown | http://en.wikipedia.org/wiki/Hyla_femoralis | revoked | 2023-02-07T05:43:00 | 102 | 3 |
| 4 | General Telephone & Electronics | Switch Card Services Ltd. | composite-register-39 | Kimberly Myers | https://www.nature.com/articles/nphoton.2014.41 | active | 2024-07-18T12:00:00 | 103 | 4 |

The `care_agencies` table establishes the organizational backbone of the domain. Each row represents a registered home care provider, identified by a surrogate `id` and a human-readable `agency_id` such as `U.S. Steel` or `Nikola Corporation`. The `agency_name` field carries the operational name — FSG Social Impact Advisors, Whirlpool Corporation, Education Writers Association, Switch Card Services Ltd. — while `registered_address` encodes a register classification like `regional-register-36` or `legacy-register-37`. Contact information flows through `contact_telephone` (Walter Pratt, Anand Central Lab, Ryan Brown, Kimberly Myers) and `website_url`, which points to external resources ranging from GitHub repositories to Wikipedia entries. The `registration_status` column classifies each agency as `active`, `suspended`, or `revoked`, and the `last_inspection_date` and `inspection_event_id` fields anchor the agency to its most recent regulatory review. The `care_recipient_id` column links the agency to the primary recipient it serves, establishing the first bridge between organizational and individual records.

**Table `inspection_events`**

| inspection_event_id | inspection_id | inspection_date | inspection_type | overall_rating | safety_rating | effectiveness_rating | caring_rating | responsive_rating | well_led_rating | publication_date | care_agency_id | inspection_report_id |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 100 | BJanecke | 2025-12-03T23:09:00 | announced | inadequate | inadequate | inadequate | inadequate | inadequate | inadequate | 2025-12-01T23:33:00 | 1 | 100 |
| 101 | 575199 | 2022-05-14T06:26:00 | unannounced | requires improvement | requires improvement | requires improvement | requires improvement | requires improvement | requires improvement | 2022-05-12T06:50:00 | 2 | 101 |
| 102 | state_uk_4 | 2023-10-25T13:43:00 | announced | good | good | good | good | good | good | 2023-10-23T13:07:00 | 3 | 102 |
| 103 | 8350011 | 2024-03-09T20:00:00 | unannounced | outstanding | outstanding | outstanding | outstanding | outstanding | outstanding | 2024-03-07T20:24:00 | 4 | 103 |

Regulatory oversight materializes through the `inspection_events` table, which records each inspection with a unique `inspection_event_id` (100 through 103). The `inspection_id` field carries an external identifier — `BJanecke`, `575199`, `state_uk_4`, `8350011` — while `inspection_date` and `publication_date` frame the temporal boundaries of the event. The `inspection_type` distinguishes between `announced` and `unannounced` visits. Five rating dimensions — `overall_rating`, `safety_rating`, `effectiveness_rating`, `caring_rating`, `responsive_rating`, and `well_led_rating` — form a consistent evaluation scale. In the sample data, these ratings cluster into two patterns: inspection 100 received `inadequate` across all five dimensions, while inspection 103 achieved `outstanding` uniformly. Inspections 101 and 102 sit in the middle, rated `requires improvement` and `good` respectively. Each event is tied to a `care_agency_id` and an `inspection_report_id`, connecting the inspection to both the agency under review and the detailed report that follows.

**Table `inspection_reports`**

| id | report_id | report_title | summary_of_findings | compliance_status | previous_inspection_date | previous_compliance_status | inspection_event_id |
|---|---|---|---|---|---|---|---|
| 100 | 1202-0008-S | Composite Protocol | pilot-summary-26 | compliant | 2024-07-10T18:42:00 | compliant | 100 |
| 101 | 8189500 | Compact Programme A | extended-summary-27 | non-compliant | 2025-12-21T01:59:00 | non-compliant | 101 |
| 102 | L355 | Legacy Standard | integrated-summary-28 | compliant | 2022-05-05T08:16:00 | compliant | 102 |
| 103 | 5844272 | Regional Framework | seasonal-summary-29 | non-compliant | 2023-10-16T15:33:00 | non-compliant | 103 |

The `inspection_reports` table provides the narrative and compliance detail behind each inspection event. The `report_id` field carries a structured identifier such as `1202-0008-S` or `L355`, while `report_title` names the framework — Composite Protocol, Compact Programme A, Legacy Standard, Regional Framework. The `summary_of_findings` column holds a categorical summary label like `pilot-summary-26` or `extended-summary-27`. The `compliance_status` field records whether the agency was found `compliant` or `non-compliant` at the time of inspection, and `previous_compliance_status` captures the prior state, allowing auditors to track changes over time. The `previous_inspection_date` anchors the historical comparison. Each report is linked to its `inspection_event_id`, completing the chain from inspection event to written findings.

**Table `care_recipients`**

| care_recipient_id | recipient_id | first_name | last_name | address | support_needs_assessment_date | dietary_preferences | mental_capacity_status | care_agency_id | staff_assignment_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | b_VB-EC-15 | Stephanie Collins | Paul Allen | distributed-address-72 | 2024-03-02T02:54:00 | regional-dietary-12 | has capacity | 1 | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | 1889791 | Janice Johnston | Heather Beasley | baseline-address-73 | 2025-08-13T09:11:00 | legacy-dietary-13 | lacks capacity | 2 | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | 4180946 | Upal Saha | Audrey Taylor | pilot-address-74 | 2022-01-24T16:28:00 | compact-dietary-14 | undetermined | 3 | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | 5789a9197ed7473eb37814ca09efb2c8 | Katherine Snyder | Susan Wagner | extended-address-75 | 2023-06-08T23:45:00 | composite-dietary-15 | has capacity | 4 | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

At the individual level, the `care_recipients` table documents the people receiving home care services. Each row carries a `care_recipient_id` (1 through 4), a `recipient_id` such as `b_VB-EC-15` or the longer hash `5789a9197ed7473eb37814ca09efb2c8`, and personal identifiers — first name (Stephanie Collins, Janice Johnston, Upal Saha, Katherine Snyder) and last name (Paul Allen, Heather Beasley, Audrey Taylor, Susan Wagner). The `address` field uses categorical labels like `distributed-address-72` or `baseline-address-73`. Clinical and personal context is captured through `support_needs_assessment_date`, `dietary_preferences` (regional-dietary-12 through composite-dietary-15), and `mental_capacity_status`, which classifies each recipient as `has capacity`, `lacks capacity`, or `undetermined`. The `care_agency_id` links the recipient to their service provider, while `staff_assignment_id` points to the primary assignment record. Timestamps `created_at` and `updated_at` track the lifecycle of the recipient record.

**Table `care_plans`**

| id | care_plan_id | plan_start_date | plan_end_date | review_frequency | nutrition_monitoring | hydration_monitoring | medication_management | care_recipient_id | care_task_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 1152669 | 2025-08-17T07:21:00 | 2024-03-03T02:18:00 | weekly | false | true | true | 1 | 1000 |
| 2 | levels | 2022-01-01T14:38:00 | 2025-08-14T09:35:00 | monthly | true | false | false | 2 | 1001 |
| 3 | 18ba4c46-8fc8-11eb-924d-9cd76263cbd0 | 2023-06-12T21:55:00 | 2022-01-25T16:52:00 | quarterly | false | true | true | 3 | 1002 |
| 4 | 974935 | 2024-11-23T04:12:00 | 2023-06-09T23:09:00 | as needed | true | false | false | 4 | 1003 |

Care plans formalize the structured support each recipient receives. The `care_plans` table stores plan identifiers (`1152669`, `levels`, `18ba4c46-8fc8-11eb-924d-9cd76263cbd0`, `974935`), with `plan_start_date` and `plan_end_date` defining the validity window. The `review_frequency` column specifies how often the plan should be reassessed — `weekly`, `monthly`, `quarterly`, or `as needed`. Three boolean monitoring flags — `nutrition_monitoring`, `hydration_monitoring`, and `medication_management` — indicate which clinical areas are actively tracked. For example, plan 1 enables hydration monitoring and medication management but not nutrition monitoring, while plan 2 enables nutrition monitoring exclusively. Each plan is associated with a `care_recipient_id` and a `care_task_id`, linking the plan to both the individual and the specific task it governs.

**Table `staff_assignments`**

| id | assignment_id | scheduled_date_time | completed_date_time | staff_count_required | assignment_status | care_recipient_id | care_task_id |
|---|---|---|---|---|---|---|---|
| 1 | 4462 | 2023-10-18T21:03:00 | 2023-06-17T05:51:00 | 35 | scheduled | 1 | 1000 |
| 2 | 5f933650-8fcd-11eb-924d-9cd76263cbd0 | 2024-03-02T04:20:00 | 2024-11-01T12:08:00 | 20 | in progress | 2 | 1001 |
| 3 | 57e54d62-8fcd-11eb-924d-9cd76263cbd0 | 2025-08-13T11:37:00 | 2025-04-12T19:25:00 | 10 | completed | 3 | 1002 |
| 4 | 3355778 | 2022-01-24T18:54:00 | 2022-09-23T02:42:00 | 37 | cancelled | 4 | 1003 |

The `staff_assignments` table records the operational execution of care delivery. Each assignment carries an `assignment_id` (4462, `5f933650-8fcd-11eb-924d-9cd76263cbd0`, `57e54d62-8fcd-11eb-924d-9cd76263cbd0`, 3355778), with `scheduled_date_time` and `completed_date_time` marking the planned and actual execution windows. The `staff_count_required` field specifies how many staff members are needed (35, 20, 10, 37), and `assignment_status` tracks the current state — `scheduled`, `in progress`, `completed`, or `cancelled`. Each assignment references a `care_recipient_id` and a `care_task_id`, binding the operational event to both the person receiving care and the task being performed.

**Table `care_tasks`**

| id | task_id | task_description | task_category | requires_two_staff | care_plan_id | staff_assignment_id |
|---|---|---|---|---|---|---|
| 1000 | 7731870 | Legacy Standard D | personal care | false | 1 | 1 |
| 1001 | id_28 | Regional Framework | medication | true | 2 | 2 |
| 1002 | 7119763 | Seasonal Protocol | nutrition | false | 3 | 3 |
| 1003 | lu_tax_code_template_m82 | Integrated Programme A | mobility | true | 4 | 4 |

Care tasks define the discrete units of service that appear in plans and assignments. The `care_tasks` table catalogs each task with a `task_id` (1000 through 1003), a `task_name` describing the activity, a `task_category` classifying its type, and a `task_duration_minutes` specifying the expected time commitment. Tasks are linked to their parent `care_plan_id`, forming the foundation upon which plans and assignments are built.

**Table `recipients_plans`**

| care_recipient_id | care_plan_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

The `recipients_plans` table serves as the linkage layer between recipients and their care plans. It records the relationship with a `recipients_plans_id`, a `care_recipient_id`, a `care_plan_id`, and a `link_status` indicating whether the association is `active`, `inactive`, or `pending`. This table allows for multiple plans per recipient and supports the lifecycle management of plan assignments.

### Inspection and Agency Relationships

The view `v_care_agency_inspection_event` joins care agencies to their inspection events, answering the question of which agency underwent which inspection and what the outcome was. Row 1 shows agency `U.S. Steel` (FSG Social Impact Advisors) linked to inspection event 100, which received an `inadequate` overall rating and was published on 2025-12-01. Row 4 shows agency `General Telephone & Electronics` (Switch Card Services Ltd.) linked to inspection event 103, which achieved an `outstanding` rating. This view enables regulators and stakeholders to trace the inspection history of any registered agency.

**View `v_care_agency_inspection_event`**

```sql
CREATE VIEW v_care_agency_inspection_event AS
SELECT a.id, a.agency_id, a.agency_name, a.registered_address, b.inspection_event_id AS event_inspection_event_id, b.inspection_id AS event_inspection_id, b.inspection_date AS event_inspection_date
FROM care_agencies a JOIN inspection_events b ON a.inspection_event_id = b.inspection_event_id;
```

| id | agency_id | agency_name | registered_address | event_inspection_event_id | event_inspection_id | event_inspection_date |
|---|---|---|---|---|---|---|
| 1 | U.S. Steel | FSG Social Impact Advisors | regional-register-36 | 100 | BJanecke | 2025-12-03T23:09:00 |
| 2 | Nikola Corporation | Whirlpool Corporation | legacy-register-37 | 101 | 575199 | 2022-05-14T06:26:00 |
| 3 | Oberthur Technologies | Education Writers Association | compact-register-38 | 102 | state_uk_4 | 2023-10-25T13:43:00 |
| 4 | General Telephone & Electronics | Switch Card Services Ltd. | composite-register-39 | 103 | 8350011 | 2024-03-09T20:00:00 |

The view `v_inspection_event_care_agency` reverses this perspective, starting from the inspection event and revealing the agency that was inspected. Inspection event 101 (inspection ID `575199`, type `unannounced`, rated `requires improvement`) maps to agency `Nikola Corporation` (Whirlpool Corporation), which holds a `suspended` registration status. This orientation is useful when an inspector begins with an event record and needs to identify the responsible organization.

**View `v_inspection_event_care_agency`**

```sql
CREATE VIEW v_inspection_event_care_agency AS
SELECT a.inspection_event_id, a.inspection_id, a.inspection_date, a.inspection_type, b.id AS agency_id, b.agency_id AS agency_agency_id, b.agency_name AS agency_agency_name
FROM inspection_events a JOIN care_agencies b ON a.care_agency_id = b.id;
```

| inspection_event_id | inspection_id | inspection_date | inspection_type | agency_id | agency_agency_id | agency_agency_name |
|---|---|---|---|---|---|---|
| 100 | BJanecke | 2025-12-03T23:09:00 | announced | 1 | U.S. Steel | FSG Social Impact Advisors |
| 101 | 575199 | 2022-05-14T06:26:00 | unannounced | 2 | Nikola Corporation | Whirlpool Corporation |
| 102 | state_uk_4 | 2023-10-25T13:43:00 | announced | 3 | Oberthur Technologies | Education Writers Association |
| 103 | 8350011 | 2024-03-09T20:00:00 | unannounced | 4 | General Telephone & Electronics | Switch Card Services Ltd. |

The view `v_inspection_event_inspection_report` connects each inspection event to its detailed report. Inspection event 100 links to report `1202-0008-S` (Composite Protocol), which found the agency `compliant` despite the `inadequate` ratings — a discrepancy that warrants further investigation. Inspection event 102 links to report `L355` (Legacy Standard), which also found the agency `compliant` and rated the inspection `good`. This view is essential for auditors who need to navigate from a high-level inspection event to the full written findings.

**View `v_inspection_event_inspection_report`**

```sql
CREATE VIEW v_inspection_event_inspection_report AS
SELECT a.inspection_event_id, a.inspection_id, a.inspection_date, a.inspection_type, b.id AS report_id, b.report_id AS report_report_id, b.report_title AS report_report_title
FROM inspection_events a JOIN inspection_reports b ON a.inspection_report_id = b.id;
```

| inspection_event_id | inspection_id | inspection_date | inspection_type | report_id | report_report_id | report_report_title |
|---|---|---|---|---|---|---|
| 100 | BJanecke | 2025-12-03T23:09:00 | announced | 100 | 1202-0008-S | Composite Protocol |
| 101 | 575199 | 2022-05-14T06:26:00 | unannounced | 101 | 8189500 | Compact Programme A |
| 102 | state_uk_4 | 2023-10-25T13:43:00 | announced | 102 | L355 | Legacy Standard |
| 103 | 8350011 | 2024-03-09T20:00:00 | unannounced | 103 | 5844272 | Regional Framework |

The view `v_inspection_report_inspection_event` presents the same relationship from the report's perspective. Report `8189500` (Compact Programme A) is associated with inspection event 101, which rated the agency `requires improvement` and found the agency `non-compliant`. The report's `previous_compliance_status` was also `non-compliant`, indicating no improvement since the prior inspection. This view supports compliance tracking by allowing auditors to start from a report and trace back to the inspection event that generated it.

**View `v_inspection_report_inspection_event`**

```sql
CREATE VIEW v_inspection_report_inspection_event AS
SELECT a.id, a.report_id, a.report_title, a.summary_of_findings, b.inspection_event_id AS event_inspection_event_id, b.inspection_id AS event_inspection_id, b.inspection_date AS event_inspection_date
FROM inspection_reports a JOIN inspection_events b ON a.inspection_event_id = b.inspection_event_id;
```

| id | report_id | report_title | summary_of_findings | event_inspection_event_id | event_inspection_id | event_inspection_date |
|---|---|---|---|---|---|---|
| 100 | 1202-0008-S | Composite Protocol | pilot-summary-26 | 100 | BJanecke | 2025-12-03T23:09:00 |
| 101 | 8189500 | Compact Programme A | extended-summary-27 | 101 | 575199 | 2022-05-14T06:26:00 |
| 102 | L355 | Legacy Standard | integrated-summary-28 | 102 | state_uk_4 | 2023-10-25T13:43:00 |
| 103 | 5844272 | Regional Framework | seasonal-summary-29 | 103 | 8350011 | 2024-03-09T20:00:00 |

### Recipient and Agency Relationships

The view `v_care_recipient_care_agency` joins care recipients to their service-providing agencies. Recipient `Stephanie Collins` (recipient ID `b_VB-EC-15`) is served by agency `U.S. Steel` (FSG Social Impact Advisors), which holds an `active` registration status. Recipient `Janice Johnston` (recipient ID `1889791`) is served by agency `Nikola Corporation` (Whirlpool Corporation), which is `suspended`. This view is critical for verifying that recipients are assigned to properly registered agencies.

**View `v_care_recipient_care_agency`**

```sql
CREATE VIEW v_care_recipient_care_agency AS
SELECT a.care_recipient_id, a.recipient_id, a.first_name, a.last_name, b.id AS agency_id, b.agency_id AS agency_agency_id, b.agency_name AS agency_agency_name
FROM care_recipients a JOIN care_agencies b ON a.care_agency_id = b.id;
```

| care_recipient_id | recipient_id | first_name | last_name | agency_id | agency_agency_id | agency_agency_name |
|---|---|---|---|---|---|---|
| 1 | b_VB-EC-15 | Stephanie Collins | Paul Allen | 1 | U.S. Steel | FSG Social Impact Advisors |
| 2 | 1889791 | Janice Johnston | Heather Beasley | 2 | Nikola Corporation | Whirlpool Corporation |
| 3 | 4180946 | Upal Saha | Audrey Taylor | 3 | Oberthur Technologies | Education Writers Association |
| 4 | 5789a9197ed7473eb37814ca09efb2c8 | Katherine Snyder | Susan Wagner | 4 | General Telephone & Electronics | Switch Card Services Ltd. |

The view `v_care_agency_care_recipient` reverses this relationship, showing which recipients are served by each agency. Agency `Oberthur Technologies` (Education Writers Association), with `revoked` registration status, serves recipient `Upal Saha` (recipient ID `4180946`), who has an `undetermined` mental capacity status. This orientation helps agency managers review their full roster of assigned recipients.

**View `v_care_agency_care_recipient`**

```sql
CREATE VIEW v_care_agency_care_recipient AS
SELECT a.id, a.agency_id, a.agency_name, a.registered_address, b.care_recipient_id AS recipient_care_recipient_id, b.recipient_id AS recipient_recipient_id, b.first_name AS recipient_first_name
FROM care_agencies a JOIN care_recipients b ON a.care_recipient_id = b.care_recipient_id;
```

| id | agency_id | agency_name | registered_address | recipient_care_recipient_id | recipient_recipient_id | recipient_first_name |
|---|---|---|---|---|---|---|
| 1 | U.S. Steel | FSG Social Impact Advisors | regional-register-36 | 1 | b_VB-EC-15 | Stephanie Collins |
| 2 | Nikola Corporation | Whirlpool Corporation | legacy-register-37 | 2 | 1889791 | Janice Johnston |
| 3 | Oberthur Technologies | Education Writers Association | compact-register-38 | 3 | 4180946 | Upal Saha |
| 4 | General Telephone & Electronics | Switch Card Services Ltd. | composite-register-39 | 4 | 5789a9197ed7473eb37814ca09efb2c8 | Katherine Snyder |

### Care Plan and Task Relationships

The view `v_care_recipient_care_plan_detail` enriches recipient records with their associated care plan information. Recipient `Stephanie Collins` is linked to care plan `1152669`, which has a `weekly` review frequency, enables hydration monitoring and medication management, and is associated with care task 1000. This view provides a comprehensive snapshot of each recipient's care configuration.

**View `v_care_recipient_care_plan_detail`**

```sql
CREATE VIEW v_care_recipient_care_plan_detail AS
SELECT a.care_recipient_id, a.recipient_id, a.first_name, b.id AS plan_id, b.care_plan_id AS plan_care_plan_id, b.plan_start_date AS plan_plan_start_date
FROM care_recipients a
  JOIN recipients_plans j ON j.care_recipient_id = a.care_recipient_id
  JOIN care_plans b ON b.id = j.care_plan_id;
```

| care_recipient_id | recipient_id | first_name | plan_id | plan_care_plan_id | plan_plan_start_date |
|---|---|---|---|---|---|
| 1 | b_VB-EC-15 | Stephanie Collins | 1 | 1152669 | 2025-08-17T07:21:00 |
| 1 | b_VB-EC-15 | Stephanie Collins | 2 | levels | 2022-01-01T14:38:00 |
| 2 | 1889791 | Janice Johnston | 2 | levels | 2022-01-01T14:38:00 |
| 2 | 1889791 | Janice Johnston | 3 | 18ba4c46-8fc8-11eb-924d-9cd76263cbd0 | 2023-06-12T21:55:00 |
| 3 | 4180946 | Upal Saha | 3 | 18ba4c46-8fc8-11eb-924d-9cd76263cbd0 | 2023-06-12T21:55:00 |
| 3 | 4180946 | Upal Saha | 4 | 974935 | 2024-11-23T04:12:00 |
| 4 | 5789a9197ed7473eb37814ca09efb2c8 | Katherine Snyder | 4 | 974935 | 2024-11-23T04:12:00 |
| 4 | 5789a9197ed7473eb37814ca09efb2c8 | Katherine Snyder | 1 | 1152669 | 2025-08-17T07:21:00 |

The view `v_care_plan_care_recipient` presents the same relationship from the plan's perspective. Care plan `levels` (plan ID `levels`) is associated with recipient `Janice Johnston` (recipient ID `1889791`), has a `monthly` review frequency, enables nutrition monitoring, and is linked to care task 1001. This view supports plan administrators who need to identify all recipients under a given plan.

**View `v_care_plan_care_recipient`**

```sql
CREATE VIEW v_care_plan_care_recipient AS
SELECT a.id, a.care_plan_id, a.plan_start_date, a.plan_end_date, b.care_recipient_id AS recipient_care_recipient_id, b.recipient_id AS recipient_recipient_id, b.first_name AS recipient_first_name
FROM care_plans a JOIN care_recipients b ON a.care_recipient_id = b.care_recipient_id;
```

| id | care_plan_id | plan_start_date | plan_end_date | recipient_care_recipient_id | recipient_recipient_id | recipient_first_name |
|---|---|---|---|---|---|---|
| 1 | 1152669 | 2025-08-17T07:21:00 | 2024-03-03T02:18:00 | 1 | b_VB-EC-15 | Stephanie Collins |
| 2 | levels | 2022-01-01T14:38:00 | 2025-08-14T09:35:00 | 2 | 1889791 | Janice Johnston |
| 3 | 18ba4c46-8fc8-11eb-924d-9cd76263cbd0 | 2023-06-12T21:55:00 | 2022-01-25T16:52:00 | 3 | 4180946 | Upal Saha |
| 4 | 974935 | 2024-11-23T04:12:00 | 2023-06-09T23:09:00 | 4 | 5789a9197ed7473eb37814ca09efb2c8 | Katherine Snyder |

The view `v_care_plan_care_task` connects care plans to their constituent tasks. Care plan `1152669` is linked to care task 1000, while care plan `18ba4c46-8fc8-11eb-924d-9cd76263cbd0` is linked to care task 1002. This view clarifies the task composition of each plan.

**View `v_care_plan_care_task`**

```sql
CREATE VIEW v_care_plan_care_task AS
SELECT a.id, a.care_plan_id, a.plan_start_date, a.plan_end_date, b.id AS task_id, b.task_id AS task_task_id, b.task_description AS task_task_description
FROM care_plans a JOIN care_tasks b ON a.care_task_id = b.id;
```

| id | care_plan_id | plan_start_date | plan_end_date | task_id | task_task_id | task_task_description |
|---|---|---|---|---|---|---|
| 1 | 1152669 | 2025-08-17T07:21:00 | 2024-03-03T02:18:00 | 1000 | 7731870 | Legacy Standard D |
| 2 | levels | 2022-01-01T14:38:00 | 2025-08-14T09:35:00 | 1001 | id_28 | Regional Framework |
| 3 | 18ba4c46-8fc8-11eb-924d-9cd76263cbd0 | 2023-06-12T21:55:00 | 2022-01-25T16:52:00 | 1002 | 7119763 | Seasonal Protocol |
| 4 | 974935 | 2024-11-23T04:12:00 | 2023-06-09T23:09:00 | 1003 | lu_tax_code_template_m82 | Integrated Programme A |

The view `v_care_task_care_plan` reverses this relationship, starting from the task and identifying the plan it belongs to. Care task 1003 is associated with care plan `974935`, which has an `as needed` review frequency and enables nutrition monitoring exclusively. This view is useful for task-level analysis and resource planning.

**View `v_care_task_care_plan`**

```sql
CREATE VIEW v_care_task_care_plan AS
SELECT a.id, a.task_id, a.task_description, a.task_category, b.id AS plan_id, b.care_plan_id AS plan_care_plan_id, b.plan_start_date AS plan_plan_start_date
FROM care_tasks a JOIN care_plans b ON a.care_plan_id = b.id;
```

| id | task_id | task_description | task_category | plan_id | plan_care_plan_id | plan_plan_start_date |
|---|---|---|---|---|---|---|
| 1000 | 7731870 | Legacy Standard D | personal care | 1 | 1152669 | 2025-08-17T07:21:00 |
| 1001 | id_28 | Regional Framework | medication | 2 | levels | 2022-01-01T14:38:00 |
| 1002 | 7119763 | Seasonal Protocol | nutrition | 3 | 18ba4c46-8fc8-11eb-924d-9cd76263cbd0 | 2023-06-12T21:55:00 |
| 1003 | lu_tax_code_template_m82 | Integrated Programme A | mobility | 4 | 974935 | 2024-11-23T04:12:00 |

### Staff Assignment and Operational Relationships

The view `v_care_recipient_staff_assignment` joins care recipients to their staff assignments. Recipient `Stephanie Collins` is linked to assignment 4462, which was scheduled for 2023-10-18 with a staff count of 35 and has a `scheduled` status. Recipient `Katherine Snyder` is linked to assignment 3355778, which was cancelled and required 37 staff members. This view enables oversight of assignment coverage for each recipient.

**View `v_care_recipient_staff_assignment`**

```sql
CREATE VIEW v_care_recipient_staff_assignment AS
SELECT a.care_recipient_id, a.recipient_id, a.first_name, a.last_name, b.id AS assignment_id, b.assignment_id AS assignment_assignment_id, b.scheduled_date_time AS assignment_scheduled_date_time
FROM care_recipients a JOIN staff_assignments b ON a.staff_assignment_id = b.id;
```

| care_recipient_id | recipient_id | first_name | last_name | assignment_id | assignment_assignment_id | assignment_scheduled_date_time |
|---|---|---|---|---|---|---|
| 1 | b_VB-EC-15 | Stephanie Collins | Paul Allen | 1 | 4462 | 2023-10-18T21:03:00 |
| 2 | 1889791 | Janice Johnston | Heather Beasley | 2 | 5f933650-8fcd-11eb-924d-9cd76263cbd0 | 2024-03-02T04:20:00 |
| 3 | 4180946 | Upal Saha | Audrey Taylor | 3 | 57e54d62-8fcd-11eb-924d-9cd76263cbd0 | 2025-08-13T11:37:00 |
| 4 | 5789a9197ed7473eb37814ca09efb2c8 | Katherine Snyder | Susan Wagner | 4 | 3355778 | 2022-01-24T18:54:00 |

The view `v_staff_assignment_care_recipient` presents the same relationship from the assignment's perspective. Assignment `5f933650-8fcd-11eb-924d-9cd76263cbd0` is associated with recipient `Janice Johnston`, was scheduled for 2024-03-02, and has an `in progress` status with a staff count of 20. This view supports operational managers reviewing active assignments.

**View `v_staff_assignment_care_recipient`**

```sql
CREATE VIEW v_staff_assignment_care_recipient AS
SELECT a.id, a.assignment_id, a.scheduled_date_time, a.completed_date_time, b.care_recipient_id AS recipient_care_recipient_id, b.recipient_id AS recipient_recipient_id, b.first_name AS recipient_first_name
FROM staff_assignments a JOIN care_recipients b ON a.care_recipient_id = b.care_recipient_id;
```

| id | assignment_id | scheduled_date_time | completed_date_time | recipient_care_recipient_id | recipient_recipient_id | recipient_first_name |
|---|---|---|---|---|---|---|
| 1 | 4462 | 2023-10-18T21:03:00 | 2023-06-17T05:51:00 | 1 | b_VB-EC-15 | Stephanie Collins |
| 2 | 5f933650-8fcd-11eb-924d-9cd76263cbd0 | 2024-03-02T04:20:00 | 2024-11-01T12:08:00 | 2 | 1889791 | Janice Johnston |
| 3 | 57e54d62-8fcd-11eb-924d-9cd76263cbd0 | 2025-08-13T11:37:00 | 2025-04-12T19:25:00 | 3 | 4180946 | Upal Saha |
| 4 | 3355778 | 2022-01-24T18:54:00 | 2022-09-23T02:42:00 | 4 | 5789a9197ed7473eb37814ca09efb2c8 | Katherine Snyder |

The view `v_staff_assignment_care_task` connects staff assignments to their associated care tasks. Assignment 4462 is linked to care task 1000, while assignment `57e54d62-8fcd-11eb-924d-9cd76263cbd0` is linked to care task 1002 and has a `completed` status. This view enables analysis of task execution patterns and staffing efficiency.

**View `v_staff_assignment_care_task`**

```sql
CREATE VIEW v_staff_assignment_care_task AS
SELECT a.id, a.assignment_id, a.scheduled_date_time, a.completed_date_time, b.id AS task_id, b.task_id AS task_task_id, b.task_description AS task_task_description
FROM staff_assignments a JOIN care_tasks b ON a.care_task_id = b.id;
```

| id | assignment_id | scheduled_date_time | completed_date_time | task_id | task_task_id | task_task_description |
|---|---|---|---|---|---|---|
| 1 | 4462 | 2023-10-18T21:03:00 | 2023-06-17T05:51:00 | 1000 | 7731870 | Legacy Standard D |
| 2 | 5f933650-8fcd-11eb-924d-9cd76263cbd0 | 2024-03-02T04:20:00 | 2024-11-01T12:08:00 | 1001 | id_28 | Regional Framework |
| 3 | 57e54d62-8fcd-11eb-924d-9cd76263cbd0 | 2025-08-13T11:37:00 | 2025-04-12T19:25:00 | 1002 | 7119763 | Seasonal Protocol |
| 4 | 3355778 | 2022-01-24T18:54:00 | 2022-09-23T02:42:00 | 1003 | lu_tax_code_template_m82 | Integrated Programme A |

The view `v_care_task_staff_assignment` reverses this relationship, starting from the care task and identifying the assignments that executed it. Care task 1001 is associated with assignment `5f933650-8fcd-11eb-924d-9cd76263cbd0`, which was `in progress` at the time of the record. This view supports task-level performance tracking and resource allocation analysis.

**View `v_care_task_staff_assignment`**

```sql
CREATE VIEW v_care_task_staff_assignment AS
SELECT a.id, a.task_id, a.task_description, a.task_category, b.id AS assignment_id, b.assignment_id AS assignment_assignment_id, b.scheduled_date_time AS assignment_scheduled_date_time
FROM care_tasks a JOIN staff_assignments b ON a.staff_assignment_id = b.id;
```

| id | task_id | task_description | task_category | assignment_id | assignment_assignment_id | assignment_scheduled_date_time |
|---|---|---|---|---|---|---|
| 1000 | 7731870 | Legacy Standard D | personal care | 1 | 4462 | 2023-10-18T21:03:00 |
| 1001 | id_28 | Regional Framework | medication | 2 | 5f933650-8fcd-11eb-924d-9cd76263cbd0 | 2024-03-02T04:20:00 |
| 1002 | 7119763 | Seasonal Protocol | nutrition | 3 | 57e54d62-8fcd-11eb-924d-9cd76263cbd0 | 2025-08-13T11:37:00 |
| 1003 | lu_tax_code_template_m82 | Integrated Programme A | mobility | 4 | 3355778 | 2022-01-24T18:54:00 |

### Synthesis

The care services domain is structured around four interlocking layers: organizational registration (care agencies), regulatory oversight (inspection events and reports), individual care delivery (care recipients and care plans), and operational execution (staff assignments and care tasks). The base tables capture the raw records at each layer, while the views provide the joined perspectives necessary for practical analysis. An inspector starting from an inspection event can trace to the agency, the report, and the recipients served. A care coordinator starting from a recipient can trace to their agency, their care plan, the tasks within that plan, and the staff assignments that execute those tasks. The foreign-key relationships — from agencies to inspections, from recipients to agencies, from plans to recipients and tasks, from assignments to recipients and tasks — form a coherent graph that supports both compliance auditing and day-to-day operational management.