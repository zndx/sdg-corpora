## Modelling Care Delivery and Regulatory Oversight as a Relational Schema

The domain under examination captures the operational and regulatory lifecycle of adult social care provision. At its core, the model tracks three interlocking concerns: the organisations that deliver care, the individuals who receive it, and the inspections that verify compliance. These concerns are normalised into eight base tables and exposed through fourteen materialised views that reconstruct domain facts from the normalised tables. The following sections walk through the entity types, their attributes, the foreign-key topology that binds them, and the view-level joins that answer the questions stakeholders actually ask.

**Table `care_agencies`**

| id | agency_id | agency_name | registered_address | contact_telephone | website_url | registration_status | last_inspection_date | inspection_event_id | care_recipient_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | U.S. Steel | FSG Social Impact Advisors | regional-register-36 | Walter Pratt | https://github.com/chiphuyen/lazynlp | active | 2025-04-12T15:09:00 | 100 | 1 |
| 2 | Nikola Corporation | Whirlpool Corporation | legacy-register-37 | Anand Central Lab | https://bugs.launchpad.net/ironic/+bug/1346406 | suspended | 2022-09-23T22:26:00 | 101 | 2 |
| 3 | Oberthur Technologies | Education Writers Association | compact-register-38 | Ryan Brown | http://en.wikipedia.org/wiki/Hyla_femoralis | revoked | 2023-02-07T05:43:00 | 102 | 3 |
| 4 | General Telephone & Electronics | Switch Card Services Ltd. | composite-register-39 | Kimberly Myers | https://www.nature.com/articles/nphoton.2014.41 | active | 2024-07-18T12:00:00 | 103 | 4 |

The `care_agencies` table is the organisational anchor. Each row represents a single care provider, identified by a surrogate primary key `id` and a business-level `agency_id` (for example, `U.S. Steel` in row 1). The column `agency_name` carries the human-readable label — `FSG Social Impact Advisors` — while `registered_address` and `contact_telephone` store the provider's physical and telephonic contact points. The `website_url` column holds an external link such as `https://github.com/chiphuyen/lazynlp`. Regulatory posture is captured by `registration_status`, which takes one of three discrete values: `active`, `suspended`, or `revoked`. The temporal column `last_inspection_date` records the most recent inspection timestamp, and the two foreign-key columns `inspection_event_id` and `care_recipient_id` link the agency to its latest inspection event and to a representative care recipient, respectively. Row 1 shows an `active` agency with `last_inspection_date` of `2025-04-12T15:09:00` and `inspection_event_id` 100; row 3, by contrast, carries a `revoked` status and `inspection_event_id` 102.

**Table `inspection_events`**

| inspection_event_id | inspection_id | inspection_date | inspection_type | overall_rating | safety_rating | effectiveness_rating | caring_rating | responsive_rating | well_led_rating | publication_date | care_agency_id | inspection_report_id |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 100 | BJanecke | 2025-12-03T23:09:00 | announced | inadequate | inadequate | inadequate | inadequate | inadequate | inadequate | 2025-12-01T23:33:00 | 1 | 100 |
| 101 | 575199 | 2022-05-14T06:26:00 | unannounced | requires improvement | requires improvement | requires improvement | requires improvement | requires improvement | requires improvement | 2022-05-12T06:50:00 | 2 | 101 |
| 102 | state_uk_4 | 2023-10-25T13:43:00 | announced | good | good | good | good | good | good | 2023-10-23T13:07:00 | 3 | 102 |
| 103 | 8350011 | 2024-03-09T20:00:00 | unannounced | outstanding | outstanding | outstanding | outstanding | outstanding | outstanding | 2024-03-07T20:24:00 | 4 | 103 |

Inspection events form the regulatory spine. The table is keyed on `inspection_event_id`, a natural identifier that doubles as a foreign key in both `care_agencies` and `inspection_reports`. Each event records an `inspection_id` (e.g. `BJanecke` or `575199`), the moment the inspection occurred (`inspection_date`), and whether it was `announced` or `unannounced`. The five rating columns — `overall_rating`, `safety_rating`, `effectiveness_rating`, `caring_rating`, `responsive_rating`, and `well_led_rating` — all share the same four-valued domain: `inadequate`, `requires improvement`, `good`, or `outstanding`. Row 100 exhibits a uniform `inadequate` profile across every dimension, while row 103 presents a uniform `outstanding` profile. The `publication_date` marks when the report was made public, and the foreign keys `care_agency_id` and `inspection_report_id` point back to the responsible agency and its detailed report, respectively.

**Table `inspection_reports`**

| id | report_id | report_title | summary_of_findings | compliance_status | previous_inspection_date | previous_compliance_status | inspection_event_id |
|---|---|---|---|---|---|---|---|
| 100 | 1202-0008-S | Composite Protocol | pilot-summary-26 | compliant | 2024-07-10T18:42:00 | compliant | 100 |
| 101 | 8189500 | Compact Programme A | extended-summary-27 | non-compliant | 2025-12-21T01:59:00 | non-compliant | 101 |
| 102 | L355 | Legacy Standard | integrated-summary-28 | compliant | 2022-05-05T08:16:00 | compliant | 102 |
| 103 | 5844272 | Regional Framework | seasonal-summary-29 | non-compliant | 2023-10-16T15:33:00 | non-compliant | 103 |

The `inspection_reports` table holds the narrative and compliance detail for each inspection event. Its surrogate key `id` coincides with `inspection_event_id` in the parent table, establishing a one-to-one correspondence: report 100 belongs to event 100. The column `report_id` carries a human-readable identifier such as `1202-0008-S`, while `report_title` provides a short label like `Composite Protocol`. The `summary_of_findings` column stores a compact textual summary (e.g. `pilot-summary-26`). Compliance posture is captured by `compliance_status` (`compliant` or `non-compliant`) and mirrored in `previous_compliance_status` for trend analysis. The `previous_inspection_date` column records the date of the prior inspection, enabling longitudinal comparison. The foreign key `inspection_event_id` ties the report back to the event.

**Table `care_recipients`**

| care_recipient_id | recipient_id | first_name | last_name | address | support_needs_assessment_date | dietary_preferences | mental_capacity_status | care_agency_id | staff_assignment_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | b_VB-EC-15 | Stephanie Collins | Paul Allen | distributed-address-72 | 2024-03-02T02:54:00 | regional-dietary-12 | has capacity | 1 | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | 1889791 | Janice Johnston | Heather Beasley | baseline-address-73 | 2025-08-13T09:11:00 | legacy-dietary-13 | lacks capacity | 2 | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | 4180946 | Upal Saha | Audrey Taylor | pilot-address-74 | 2022-01-24T16:28:00 | compact-dietary-14 | undetermined | 3 | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | 5789a9197ed7473eb37814ca09efb2c8 | Katherine Snyder | Susan Wagner | extended-address-75 | 2023-06-08T23:45:00 | composite-dietary-15 | has capacity | 4 | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Care recipients are the individuals who receive services. The table is keyed on `care_recipient_id`, with a secondary `recipient_id` that carries a business identifier such as `b_VB-EC-15` or the long hash `5789a9197ed7473eb37814ca09efb2c8`. Personal attributes include `first_name` and `last_name` (e.g. `Stephanie Collins` and `Paul Allen`), a physical `address`, and the `support_needs_assessment_date` when needs were formally assessed. The `dietary_preferences` column stores values like `regional-dietary-12`, while `mental_capacity_status` takes one of three values: `has capacity`, `lacks capacity`, or `undetermined`. The foreign key `care_agency_id` links the recipient to their provider agency, and `staff_assignment_id` points to their primary assignment. Audit timestamps `created_at` and `updated_at` record the row's lifecycle. Row 1 shows `Stephanie Collins` with `has capacity` status assigned to agency 1; row 2 shows `Janice Johnston` with `lacks capacity` status assigned to agency 2.

**Table `care_plans`**

| id | care_plan_id | plan_start_date | plan_end_date | review_frequency | nutrition_monitoring | hydration_monitoring | medication_management | care_recipient_id | care_task_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 1152669 | 2025-08-17T07:21:00 | 2024-03-03T02:18:00 | weekly | false | true | true | 1 | 1000 |
| 2 | levels | 2022-01-01T14:38:00 | 2025-08-14T09:35:00 | monthly | true | false | false | 2 | 1001 |
| 3 | 18ba4c46-8fc8-11eb-924d-9cd76263cbd0 | 2023-06-12T21:55:00 | 2022-01-25T16:52:00 | quarterly | false | true | true | 3 | 1002 |
| 4 | 974935 | 2024-11-23T04:12:00 | 2023-06-09T23:09:00 | as needed | true | false | false | 4 | 1003 |

Care plans define the structured support prescribed to each recipient. The surrogate key `id` is complemented by a business-level `care_plan_id` that can be numeric (`1152669`), textual (`levels`), or a UUID (`18ba4c46-8fc8-11eb-924d-9cd76263cbd0`). The plan's validity window is captured by `plan_start_date` and `plan_end_date`, while `review_frequency` takes one of four values: `weekly`, `monthly`, `quarterly`, or `as needed`. Boolean columns `nutrition_monitoring`, `hydration_monitoring`, and `medication_management` indicate which support domains are active. The foreign key `care_recipient_id` binds the plan to its recipient, and `care_task_id` links to the specific task the plan governs. Row 1 prescribes `weekly` reviews with hydration and medication management enabled but nutrition monitoring disabled.

**Table `staff_assignments`**

| id | assignment_id | scheduled_date_time | completed_date_time | staff_count_required | assignment_status | care_recipient_id | care_task_id |
|---|---|---|---|---|---|---|---|
| 1 | 4462 | 2023-10-18T21:03:00 | 2023-06-17T05:51:00 | 35 | scheduled | 1 | 1000 |
| 2 | 5f933650-8fcd-11eb-924d-9cd76263cbd0 | 2024-03-02T04:20:00 | 2024-11-01T12:08:00 | 20 | in progress | 2 | 1001 |
| 3 | 57e54d62-8fcd-11eb-924d-9cd76263cbd0 | 2025-08-13T11:37:00 | 2025-04-12T19:25:00 | 10 | completed | 3 | 1002 |
| 4 | 3355778 | 2022-01-24T18:54:00 | 2022-09-23T02:42:00 | 37 | cancelled | 4 | 1003 |

Staff assignments record the operational deployment of care workers. The surrogate key `id` is complemented by `assignment_id`, which can be numeric (`4462`) or a UUID (`5f933650-8fcd-11eb-924d-9cd76263cbd0`). The `scheduled_date_time` and `completed_date_time` columns capture the planned and actual execution moments. `staff_count_required` stores an integer such as `35` or `20`, and `assignment_status` takes one of four values: `scheduled`, `in progress`, `completed`, or `cancelled`. The foreign keys `care_recipient_id` and `care_task_id` bind the assignment to its recipient and its task. Row 1 shows assignment `4462` scheduled for `2023-10-18T21:03:00` with a status of `scheduled` and a requirement of 35 staff members.

**Table `care_tasks`**

| id | task_id | task_description | task_category | requires_two_staff | care_plan_id | staff_assignment_id |
|---|---|---|---|---|---|---|
| 1000 | 7731870 | Legacy Standard D | personal care | false | 1 | 1 |
| 1001 | id_28 | Regional Framework | medication | true | 2 | 2 |
| 1002 | 7119763 | Seasonal Protocol | nutrition | false | 3 | 3 |
| 1003 | lu_tax_code_template_m82 | Integrated Programme A | mobility | true | 4 | 4 |

Care tasks represent the atomic units of care delivery — discrete activities such as personal hygiene support, mobility assistance, or medication administration. Each task is identified by a surrogate `id` and a business-level `task_id`. The `task_name` column carries a human-readable label, while `task_type` classifies the activity (e.g. personal care, clinical support, or social engagement). The `priority_level` column assigns a numeric priority, and `duration_minutes` records the expected time commitment. The foreign key `care_plan_id` links the task to the plan that prescribes it. Tasks serve as the bridge between planning and execution, appearing as foreign keys in both `care_plans` and `staff_assignments`.

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

The `recipients_plans` table is a junction table that resolves the many-to-many relationship between care recipients and care plans. A single recipient may have multiple active plans over time, and a plan template may be instantiated for multiple recipients. The table contains two foreign keys: `care_recipient_id` and `care_plan_id`, forming a composite primary key. Each row represents an instantiation of a plan for a specific recipient, with `assigned_date` recording when the association was created and `status` capturing whether the plan is `active`, `pending`, or `discontinued`. This normalisation prevents data duplication and supports historical tracking of plan changes.

The foreign-key topology of the schema can be visualised as a hub-and-spoke centred on `care_recipients`. The `care_agencies` table links outward through `care_recipient_id` and `inspection_event_id`. The `inspection_events` table links to `care_agencies` via `care_agency_id` and to `inspection_reports` via `inspection_report_id`. The `care_plans` table links to `care_recipients` via `care_recipient_id` and to `care_tasks` via `care_task_id`. The `staff_assignments` table similarly links to both `care_recipients` and `care_tasks`. The junction table `recipients_plans` sits between `care_recipients` and `care_plans`, enabling the many-to-many relationship that the direct foreign key in `care_plans` alone cannot express.

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

This view joins `care_agencies` to `inspection_events` on the matching `inspection_event_id` / `id` relationship, producing a flat record that answers the question: "What inspection event is associated with each care agency?" The result surface the agency's name, registration status, and the inspection's overall rating in a single row. For example, the row for agency `FSG Social Impact Advisors` shows `inspection_event_id` 100 with an `inadequate` overall rating, while the row for `Switch Card Services Ltd.` shows `inspection_event_id` 103 with an `outstanding` rating. This view is the primary lens for regulatory dashboards that need to surface agency-level inspection outcomes.

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

By joining `care_agencies` to `care_recipients` on `care_agency_id`, this view answers: "Which care recipients are served by each agency?" Each row pairs an agency name with a recipient's full name and mental capacity status. The row for `FSG Social Impact Advisors` shows `Stephanie Collins` with `has capacity` status, while `Whirlpool Corporation` is paired with `Janice Johnston` who `lacks capacity`. This view supports workload analysis, enabling administrators to count recipients per agency and assess capacity distribution across the provider network.

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

This view reverses the join direction of `v_care_agency_inspection_event`, joining `inspection_events` to `care_agencies` on `care_agency_id`. It answers: "Which care agency was inspected in this event?" The result presents the inspection date, type, and all five rating dimensions alongside the agency's name and registration status. Row 100 shows an `announced` inspection of `FSG Social Impact Advisors` with all ratings at `inadequate`, while row 103 shows an `unannounced` inspection of `Switch Card Services Ltd.` with all ratings at `outstanding`. This orientation is useful for inspection audit trails that start from the event and drill down to the responsible provider.

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

This view joins `inspection_events` to `inspection_reports` on `inspection_event_id` = `id`, producing a composite record that pairs the inspection's rating profile with its narrative summary. It answers: "What report accompanies this inspection event?" The row for event 100 shows report `1202-0008-S` titled `Composite Protocol` with a `compliant` status, while event 101 shows report `8189500` titled `Compact Programme A` with a `non-compliant` status. This view is essential for compliance reporting, as it brings together the quantitative ratings and the qualitative findings in a single row.

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

This view reverses the join of `v_inspection_event_inspection_report`, joining `inspection_reports` to `inspection_events` on `inspection_event_id`. It answers: "Which inspection event generated this report?" The result presents the report's title, compliance status, and previous inspection date alongside the event's inspection date, type, and all five rating dimensions. Row 100 shows the `Composite Protocol` report linked to event 100 with an `announced` inspection on `2025-12-03T23:09:00`. This orientation supports report-centric queries where the starting point is the published document rather than the inspection event.

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

This view joins `care_recipients` to `care_agencies` on `care_agency_id`, answering: "Which agency provides care to this recipient?" Each row pairs a recipient's name and mental capacity status with the agency's name, registration status, and last inspection date. The row for `Stephanie Collins` shows agency `FSG Social Impact Advisors` with `active` status and last inspection on `2025-04-12T15:09:00`. The row for `Katherine Snyder` shows `Switch Card Services Ltd.` with `active` status and last inspection on `2024-07-18T12:00:00`. This view is the foundation for recipient-level care coordination dashboards.

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

This view joins `care_recipients` to `care_plans` on `care_recipient_id`, answering: "What care plan is prescribed for this recipient?" The result presents the recipient's name and dietary preferences alongside the plan's start and end dates, review frequency, and the three monitoring booleans. Row 1 shows `Stephanie Collins` with a plan starting `2025-08-17T07:21:00`, reviewed `weekly`, with hydration and medication management enabled but nutrition monitoring disabled. Row 2 shows `Janice Johnston` with a plan reviewed `monthly` where nutrition monitoring is the only enabled domain. This view supports care plan compliance checks and review scheduling.

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

This view joins `care_recipients` to `staff_assignments` on `care_recipient_id`, answering: "What staff assignments are scheduled for this recipient?" Each row pairs the recipient's name with the assignment's scheduled time, completion time, required staff count, and status. The row for `Stephanie Collins` shows assignment `4462` scheduled for `2023-10-18T21:03:00` with 35 staff required and a `scheduled` status. The row for `Upal Saha` shows assignment `57e54d62-8fcd-11eb-924d-9cd76263cbd0` with a `completed` status and 10 staff required. This view is critical for workforce planning and assignment tracking.

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

This view reverses the join of `v_care_recipient_care_plan_detail`, joining `care_plans` to `care_recipients` on `care_recipient_id`. It answers: "Which recipient is this care plan assigned to?" The result presents the plan's review frequency and monitoring booleans alongside the recipient's name, mental capacity status, and dietary preferences. Row 1 shows plan `1152669` with `weekly` review assigned to `Stephanie Collins` who `has capacity`. Row 3 shows plan `18ba4c46-8fc8-11eb-924d-9cd76263cbd0` with `quarterly` review assigned to `Upal Saha` whose status is `undetermined`. This orientation supports plan-centric queries where the starting point is the plan template or instance.

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

This view joins `care_plans` to `care_tasks` on `care_task_id`, answering: "Which care task does this plan govern?" The result presents the plan's review frequency and monitoring booleans alongside the task's name, type, priority level, and duration. This view is essential for understanding the operational scope of each care plan — it maps the abstract plan to the concrete activities that staff must execute. A plan with `weekly` review and `medication_management` enabled would be linked to a task of type `clinical support` with a high priority level.

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

This view joins `staff_assignments` to `care_recipients` on `care_recipient_id`, answering: "Which recipient is this assignment for?" The result presents the assignment's scheduled and completed times, staff count, and status alongside the recipient's name, mental capacity status, and dietary preferences. Row 1 shows assignment `4462` for `Stephanie Collins` with a `scheduled` status and 35 staff required. Row 4 shows assignment `3355778` for `Katherine Snyder` with a `cancelled` status and 37 staff required. This view supports assignment-level auditing and recipient workload analysis.

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

This view joins `staff_assignments` to `care_tasks` on `care_task_id`, answering: "Which task is this assignment executing?" The result presents the assignment's status and staff count alongside the task's name, type, priority, and duration. This view is critical for operational reporting, as it links the execution record (the assignment) to the activity definition (the task). An assignment with status `completed` and 10 staff required would be linked to a task of type `personal care` with a moderate priority level.

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

This view joins `care_tasks` to `care_plans` on `care_plan_id`, answering: "Which care plan prescribes this task?" The result presents the task's name, type, and priority alongside the plan's review frequency and monitoring booleans. This view supports plan validation — ensuring that every task has a corresponding plan — and plan coverage analysis, showing which tasks are covered by which plans. A task of type `clinical support` with high priority would be linked to a plan with `medication_management` enabled and `weekly` review frequency.

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

This view joins `care_tasks` to `staff_assignments` on `care_task_id`, answering: "Which assignments are executing this task?" The result presents the task's name and type alongside the assignment's scheduled time, completion time, staff count, and status. This view is essential for task-level execution tracking, showing which assignments have been completed, are in progress, or are still scheduled for a given task. A task with type `personal care` would appear in multiple assignment rows with varying statuses, enabling managers to assess completion rates.

The materialisation of this domain as a relational schema demonstrates a disciplined approach to normalisation. Each entity type — agencies, recipients, plans, tasks, assignments, inspections, and reports — occupies its own table with a clear primary key and a minimal set of attributes. Foreign keys encode the cardinality-bounded relationships: one agency serves many recipients, one recipient has many plans, one plan prescribes many tasks, and one task is executed by many assignments. The junction table `recipients_plans` resolves the many-to-many relationship between recipients and plans that cannot be expressed through a single foreign key. The fourteen views then reconstruct the domain facts that stakeholders need, each join answering a specific question by bringing together the relevant tables into a flat, queryable result. This architecture separates the concerns of data storage from data access, allowing the base tables to evolve independently of the views that depend on them.