# Humanitarian Aid Program Management

The administration of humanitarian assistance programs requires coordinated tracking of beneficiaries, their dependents, program offerings, distribution logistics, and communication events. At the core of this system are aid recipients—individuals who register for assistance—and the children associated with them. Each recipient enrolls in one or more aid programs, which are organized by season, supported by partner organizations, and fulfilled through physical distribution sites. Notifications keep recipients informed of program milestones, from registration deadlines to pickup schedules. This chapter documents the data structures that capture these relationships, the views that synthesize them for operational reporting, and the patterns that emerge when the data is examined together.

## Aid Recipients and Program Enrollment

Aid recipients form the primary entity in the assistance ecosystem. Each record captures a person's contact information, physical address, registration timeline, and current enrollment status.

**Table `aid_recipients`**

| id | contact_name | cell_phone | physical_address | registration_deadline | registration_status | aid_program_id | notification_event_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|
| 1 | Kenneth Smith | distributed-cell-72 | pilot-physical-98 | 2023-02-05 | pending | 1 | 1000 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | Michelle Kelley | baseline-cell-73 | extended-physical-99 | 2024-07-16 | accepted | 2 | 1001 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | Kimberly Myers | pilot-cell-74 | integrated-physical-100 | 2025-12-27 | rejected | 3 | 1002 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | Tasha Rodriguez | extended-cell-75 | seasonal-physical-101 | 2022-05-11 | pending | 4 | 1003 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The `aid_recipients` table stores four registered individuals, each associated with a distinct aid program and notification event. Kenneth Smith (id 1) has a `pending` registration status for program 1, with a registration deadline of 2023-02-05 and a scheduled notification (id 1000). Michelle Kelley (id 2) holds an `accepted` status for program 2, with her notification (id 1001) already marked as `sent`. Kimberly Myers (id 3) has a `rejected` application for program 3, and her notification (id 1002) shows a `failed` delivery status. Tasha Rodriguez (id 4) remains `pending` for program 4, with notification id 1003 still `scheduled`. The `registration_status` field—taking values of `pending`, `accepted`, or `rejected`—serves as the operational indicator of whether a recipient has been approved for assistance. Each recipient is linked to exactly one aid program via `aid_program_id` and one notification event via `notification_event_id`, establishing the foundational one-to-one relationships that anchor the rest of the data model.

## Children and Household Composition

Families applying for aid often include children who require specific provisions such as clothing, footwear, and diapers. The `childs` table records these dependents with detailed sizing and demographic information.

**Table `childs`**

| id | child_name | age | sex | shirt_size | pants_size | shoe_size | diaper_size | favorite_color | aid_recipient_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 100 | Integrated Framework A | 35 | male | pilot-shirt-68 | pilot-pants-44 | composite-shoe-99 | compact-diaper-44 | Strawberry Blond | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 101 | Extended Protocol | 40 | female | extended-shirt-69 | extended-pants-45 | primary-shoe-100 | composite-diaper-45 | Brownn | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 102 | Pilot Programme | 45 | other | integrated-shirt-70 | integrated-pants-46 | adaptive-shoe-101 | primary-diaper-46 | Black | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 103 | Baseline Standard D | 50 | male | seasonal-shirt-71 | seasonal-pants-47 | distributed-shoe-102 | adaptive-diaper-47 | Pink | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Four children are registered in the system, each linked to an aid recipient through the `aid_recipient_id` foreign key. Child id 100, named "Integrated Framework A," is a 35-year-old male with shirt size `pilot-shirt-68`, pants size `pilot-pants-44`, shoe size `composite-shoe-99`, and diaper size `compact-diaper-44`. Child id 101, "Extended Protocol," is a 40-year-old female with sizes `extended-shirt-69`, `extended-pants-45`, `primary-shoe-100`, and `composite-diaper-45`. Child id 102, "Pilot Programme," is 45 years old, identifies as `other`, and has sizes `integrated-shirt-70`, `integrated-pants-46`, `adaptive-shoe-101`, and `primary-diaper-46`. Child id 103, "Baseline Standard D," is a 50-year-old male with sizes `seasonal-shirt-71`, `seasonal-pants-47`, `distributed-shoe-102`, and `adaptive-diaper-47`. The `sex` column accepts values of `male`, `female`, and `other`, while `favorite_color` provides an additional demographic field. Ages range from 35 to 50, and sizes follow a naming convention that ties each measurement to a program phase—`pilot`, `extended`, `integrated`, or `seasonal`.

## Program-Recipient and Child-Recipient Linkages

Not every child belongs to a single recipient, and not every recipient enrolls in only one program. The system uses two junction tables to model these many-to-many relationships: `recipients_childs` and `programs_recipients`.

**Table `recipients_childs`**

| aid_recipient_id | child_id |
|---|---|
| 1 | 100 |
| 1 | 101 |
| 2 | 101 |
| 2 | 102 |
| 3 | 102 |
| 3 | 103 |
| 4 | 103 |
| 4 | 100 |

**Table `programs_recipients`**

| aid_program_id | aid_recipient_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

The `recipients_childs` table establishes which children are associated with which aid recipients. Aid recipient 1 is linked to children 100 and 101, meaning Kenneth Smith has two registered dependents. Aid recipient 2 (Michelle Kelley) is also linked to children 101 and 102, indicating that child 101—"Extended Protocol"—is shared between two recipients. Aid recipient 3 (Kimberly Myers) has children 102 and 103, and aid recipient 4 (Tasha Rodriguez) is linked to children 103 and 100. This creates a web of shared dependents: child 100 appears under recipients 1 and 4, child 101 under recipients 1 and 2, child 102 under recipients 2 and 3, and child 103 under recipients 3 and 4. The `programs_recipients` table, though its contents are not enumerated here, serves the same structural purpose for program enrollments, allowing a single recipient to participate in multiple aid programs and a single program to serve multiple recipients.

## Aid Programs and Distribution Logistics

Aid programs define the scope of assistance offered, including the season of operation, the supporting organization, and the logistics of distribution.

**Table `aid_programs`**

| id | program_name | season | supporting_organization | registration_deadline | pickup_date | pickup_start_time | pickup_end_time | distribution_site_id |
|---|---|---|---|---|---|---|---|---|
| 1 | Extended Review | distributed-season-36 | Align Technology | 2023-02-05 | 2023-10-06 | 2023-06-03T05:39:00 | 2025-08-22T19:33:00 | 1 |
| 2 | Pilot Initiative A | baseline-season-37 | Professional Educator Standards Board | 2024-07-16 | 2024-03-17 | 2024-11-14T12:56:00 | 2022-01-06T02:50:00 | 2 |
| 3 | Baseline Model | pilot-season-38 | Luddic Path | 2025-12-27 | 2025-08-01 | 2025-04-25T19:13:00 | 2023-06-17T09:07:00 | 3 |
| 4 | Distributed Cluster | extended-season-39 | Column Name cannot be empty | 2022-05-11 | 2022-01-12 | 2022-09-09T02:30:00 | 2024-11-01T16:24:00 | 4 |

Four aid programs are active in the system. Program id 1, "Extended Review," runs during `distributed-season-36` and is supported by Align Technology. Its registration deadline is 2023-02-05, with pickup scheduled for 2023-10-06, between 05:39 and 19:33. Program id 2, "Pilot Initiative A," operates in `baseline-season-37` under the Professional Educator Standards Board, with a deadline of 2024-07-16 and pickup on 2024-03-17. Program id 3, "Baseline Model," is run by Luddic Path during `pilot-season-38`, with a deadline of 2025-12-27 and pickup on 2025-08-01. Program id 4, "Distributed Cluster," is supported by "Column Name cannot be empty" during `extended-season-39`, with a deadline of 2022-05-11 and pickup on 2022-01-12. Each program is assigned to a distribution site via `distribution_site_id`, creating a direct link between the program and the physical location where assistance is dispensed.

## Distribution Sites

Distribution sites are the physical locations where aid is picked up. Each site is associated with a specific aid program.

**Table `distribution_sites`**

| id | site_name | street_address | city | state | postal_code | aid_program_id |
|---|---|---|---|---|---|---|
| 1 | Composite Review | composite-street-15 | integrated-city-34 | distributed-state-84 | 9125611 | 1 |
| 2 | Compact Initiative A | primary-street-16 | seasonal-city-35 | baseline-state-85 | ChIJt4hBkzhu5kcRJJDUNqGUpso | 2 |
| 3 | Legacy Model | adaptive-street-17 | regional-city-36 | pilot-state-86 | 3001009030200 | 3 |
| 4 | Regional Cluster | distributed-street-18 | legacy-city-37 | extended-state-87 | 4060635 | 4 |

Four distribution sites serve the aid programs. Site id 1, "Composite Review," is located at `composite-street-15` in `integrated-city-34`, state `distributed-state-84`, with postal code 9125611, and serves program 1. Site id 2, "Compact Initiative A," is at `primary-street-16` in `seasonal-city-35`, state `baseline-state-85`, with postal code ChIJt4hBkzhu5kcRJJDUNqGUpso, and serves program 2. Site id 3, "Legacy Model," is located at `adaptive-street-17` in `regional-city-36`, state `pilot-state-86`, with postal code 3001009030200, and serves program 3. Site id 4, "Regional Cluster," is at `distributed-street-18` in `legacy-city-37`, state `extended-state-87`, with postal code 4060635, and serves program 4. The `aid_program_id` foreign key on each site ensures that every distribution location is tied to exactly one program, simplifying logistics planning and recipient routing.

## Notification Events

Communication with aid recipients is tracked through the `notification_events` table, which records the type, timing, and delivery status of each notification.

**Table `notification_events`**

| id | notification_type | scheduled_date | delivery_status | aid_recipient_id | aid_program_id |
|---|---|---|---|---|---|
| 1000 | adaptive-notifica-35 | 2024-11-27 | scheduled | 1 | 1 |
| 1001 | distributed-notifica-36 | 2025-04-11 | sent | 2 | 2 |
| 1002 | baseline-notifica-37 | 2022-09-22 | failed | 3 | 3 |
| 1003 | pilot-notifica-38 | 2023-02-06 | scheduled | 4 | 4 |

Four notification events are recorded, each linked to a specific aid recipient and aid program. Notification id 1000 is of type `adaptive-notifica-35`, scheduled for 2024-11-27, with a `scheduled` delivery status, associated with recipient 1 and program 1. Notification id 1001, type `distributed-notifica-36`, is dated 2025-04-11, marked as `sent`, and linked to recipient 2 and program 2. Notification id 1002, type `baseline-notifica-37`, was scheduled for 2022-09-22 but has a `failed` delivery status, tied to recipient 3 and program 3. Notification id 1003, type `pilot-notifica-38`, is set for 2023-02-06 with a `scheduled` status, connected to recipient 4 and program 4. The `delivery_status` field—taking values of `scheduled`, `sent`, or `failed`—provides a real-time indicator of communication reliability. The `notification_type` field uses a naming convention that mirrors the program phases, suggesting that notification templates are customized per program cycle.

## Operational Views

The system provides several materialized views that join base tables to answer specific operational questions. These views synthesize data across entities, enabling administrators to query relationships without constructing complex joins manually.

**View `aid_recipient_child_detail_view`**

```sql
CREATE VIEW aid_recipient_child_detail_view AS
SELECT a.id, a.contact_name, a.cell_phone, b.id AS child_id, b.child_name AS child_child_name, b.age AS child_age
FROM aid_recipients a
  JOIN recipients_childs j ON j.aid_recipient_id = a.id
  JOIN childs b ON b.id = j.child_id;
```

| id | contact_name | cell_phone | child_id | child_child_name | child_age |
|---|---|---|---|---|---|
| 1 | Kenneth Smith | distributed-cell-72 | 100 | Integrated Framework A | 35 |
| 1 | Kenneth Smith | distributed-cell-72 | 101 | Extended Protocol | 40 |
| 2 | Michelle Kelley | baseline-cell-73 | 101 | Extended Protocol | 40 |
| 2 | Michelle Kelley | baseline-cell-73 | 102 | Pilot Programme | 45 |
| 3 | Kimberly Myers | pilot-cell-74 | 102 | Pilot Programme | 45 |
| 3 | Kimberly Myers | pilot-cell-74 | 103 | Baseline Standard D | 50 |
| 4 | Tasha Rodriguez | extended-cell-75 | 103 | Baseline Standard D | 50 |
| 4 | Tasha Rodriguez | extended-cell-75 | 100 | Integrated Framework A | 35 |

The `aid_recipient_child_detail_view` answers the question: "Which children are associated with each aid recipient, and what are their details?" This view joins `aid_recipients` with `recipients_childs` and `childs`, producing rows that pair each recipient with their dependents. For example, a row from this view would show Kenneth Smith (recipient id 1) alongside child 100 ("Integrated Framework A," age 35, male) and child 101 ("Extended Protocol," age 40, female), reflecting the two entries in `recipients_childs` for recipient 1. This view is essential for determining the total number of dependents per household and for sizing aid provisions accordingly.

**View `aid_recipient_aid_program_view`**

```sql
CREATE VIEW aid_recipient_aid_program_view AS
SELECT a.id, a.contact_name, a.cell_phone, a.physical_address, b.id AS program_id, b.program_name AS program_program_name, b.season AS program_season
FROM aid_recipients a JOIN aid_programs b ON a.aid_program_id = b.id;
```

| id | contact_name | cell_phone | physical_address | program_id | program_program_name | program_season |
|---|---|---|---|---|---|---|
| 1 | Kenneth Smith | distributed-cell-72 | pilot-physical-98 | 1 | Extended Review | distributed-season-36 |
| 2 | Michelle Kelley | baseline-cell-73 | extended-physical-99 | 2 | Pilot Initiative A | baseline-season-37 |
| 3 | Kimberly Myers | pilot-cell-74 | integrated-physical-100 | 3 | Baseline Model | pilot-season-38 |
| 4 | Tasha Rodriguez | extended-cell-75 | seasonal-physical-101 | 4 | Distributed Cluster | extended-season-39 |

The `aid_recipient_aid_program_view` links each aid recipient to their enrolled aid program, providing a consolidated record of who is enrolled in what. A representative row would show Kenneth Smith (recipient id 1) enrolled in "Extended Review" (program id 1), supported by Align Technology, with pickup scheduled for 2023-10-06. This view enables administrators to verify program assignments and to cross-reference recipient status with program logistics.

**View `aid_recipient_notification_event_view`**

```sql
CREATE VIEW aid_recipient_notification_event_view AS
SELECT a.id, a.contact_name, a.cell_phone, a.physical_address, b.id AS event_id, b.notification_type AS event_notification_type, b.scheduled_date AS event_scheduled_date
FROM aid_recipients a JOIN notification_events b ON a.notification_event_id = b.id;
```

| id | contact_name | cell_phone | physical_address | event_id | event_notification_type | event_scheduled_date |
|---|---|---|---|---|---|---|
| 1 | Kenneth Smith | distributed-cell-72 | pilot-physical-98 | 1000 | adaptive-notifica-35 | 2024-11-27 |
| 2 | Michelle Kelley | baseline-cell-73 | extended-physical-99 | 1001 | distributed-notifica-36 | 2025-04-11 |
| 3 | Kimberly Myers | pilot-cell-74 | integrated-physical-100 | 1002 | baseline-notifica-37 | 2022-09-22 |
| 4 | Tasha Rodriguez | extended-cell-75 | seasonal-physical-101 | 1003 | pilot-notifica-38 | 2023-02-06 |

The `aid_recipient_notification_event_view` connects recipients to their notification events, answering: "What communications has each recipient received, and what is the delivery status?" A row from this view would pair Kenneth Smith (recipient id 1) with notification id 1000 (type `adaptive-notifica-35`, scheduled for 2024-11-27, status `scheduled`). For Kimberly Myers (recipient id 3), the same view would show notification id 1002 with a `failed` status, flagging a communication breakdown that may require follow-up.

**View `child_aid_recipient_view`**

```sql
CREATE VIEW child_aid_recipient_view AS
SELECT a.id, a.child_name, a.age, a.sex, b.id AS recipient_id, b.contact_name AS recipient_contact_name, b.cell_phone AS recipient_cell_phone
FROM childs a JOIN aid_recipients b ON a.aid_recipient_id = b.id;
```

| id | child_name | age | sex | recipient_id | recipient_contact_name | recipient_cell_phone |
|---|---|---|---|---|---|---|
| 100 | Integrated Framework A | 35 | male | 1 | Kenneth Smith | distributed-cell-72 |
| 101 | Extended Protocol | 40 | female | 2 | Michelle Kelley | baseline-cell-73 |
| 102 | Pilot Programme | 45 | other | 3 | Kimberly Myers | pilot-cell-74 |
| 103 | Baseline Standard D | 50 | male | 4 | Tasha Rodriguez | extended-cell-75 |

The `child_aid_recipient_view` inverts the perspective of the child-detail view, answering: "For each child, which aid recipient(s) are associated with them?" This is particularly useful for identifying shared dependents. A row from this view would show child 101 ("Extended Protocol") linked to both recipient 1 (Kenneth Smith) and recipient 2 (Michelle Kelley), confirming the shared relationship visible in the `recipients_childs` junction table. This view supports auditing of household composition and prevents duplicate provisioning.

**View `aid_program_distribution_site_view`**

```sql
CREATE VIEW aid_program_distribution_site_view AS
SELECT a.id, a.program_name, a.season, a.supporting_organization, b.id AS site_id, b.site_name AS site_site_name, b.street_address AS site_street_address
FROM aid_programs a JOIN distribution_sites b ON a.distribution_site_id = b.id;
```

| id | program_name | season | supporting_organization | site_id | site_site_name | site_street_address |
|---|---|---|---|---|---|---|
| 1 | Extended Review | distributed-season-36 | Align Technology | 1 | Composite Review | composite-street-15 |
| 2 | Pilot Initiative A | baseline-season-37 | Professional Educator Standards Board | 2 | Compact Initiative A | primary-street-16 |
| 3 | Baseline Model | pilot-season-38 | Luddic Path | 3 | Legacy Model | adaptive-street-17 |
| 4 | Distributed Cluster | extended-season-39 | Column Name cannot be empty | 4 | Regional Cluster | distributed-street-18 |

The `aid_program_distribution_site_view` maps each aid program to its designated distribution site, answering: "Where should recipients pick up their aid for a given program?" A row from this view would show "Extended Review" (program id 1) distributed through "Composite Review" (site id 1) at `composite-street-15` in `integrated-city-34`. This view is critical for generating pickup instructions and for verifying that each program has an assigned fulfillment location.

**View `aid_program_aid_recipient_detail_view`**

```sql
CREATE VIEW aid_program_aid_recipient_detail_view AS
SELECT a.id, a.program_name, a.season, b.id AS recipient_id, b.contact_name AS recipient_contact_name, b.cell_phone AS recipient_cell_phone
FROM aid_programs a
  JOIN programs_recipients j ON j.aid_program_id = a.id
  JOIN aid_recipients b ON b.id = j.aid_recipient_id;
```

| id | program_name | season | recipient_id | recipient_contact_name | recipient_cell_phone |
|---|---|---|---|---|---|
| 1 | Extended Review | distributed-season-36 | 1 | Kenneth Smith | distributed-cell-72 |
| 1 | Extended Review | distributed-season-36 | 2 | Michelle Kelley | baseline-cell-73 |
| 2 | Pilot Initiative A | baseline-season-37 | 2 | Michelle Kelley | baseline-cell-73 |
| 2 | Pilot Initiative A | baseline-season-37 | 3 | Kimberly Myers | pilot-cell-74 |
| 3 | Baseline Model | pilot-season-38 | 3 | Kimberly Myers | pilot-cell-74 |
| 3 | Baseline Model | pilot-season-38 | 4 | Tasha Rodriguez | extended-cell-75 |
| 4 | Distributed Cluster | extended-season-39 | 4 | Tasha Rodriguez | extended-cell-75 |
| 4 | Distributed Cluster | extended-season-39 | 1 | Kenneth Smith | distributed-cell-72 |

The `aid_program_aid_recipient_detail_view` provides a program-centric view of all enrolled recipients, answering: "Which recipients are enrolled in each aid program, and what are their registration statuses?" A row from this view would show "Pilot Initiative A" (program id 2) with Michelle Kelley (recipient id 2) in `accepted` status. This view supports program-level reporting, such as counting accepted versus pending applicants per program.

**View `distribution_site_aid_program_view`**

```sql
CREATE VIEW distribution_site_aid_program_view AS
SELECT a.id, a.site_name, a.street_address, a.city, b.id AS program_id, b.program_name AS program_program_name, b.season AS program_season
FROM distribution_sites a JOIN aid_programs b ON a.aid_program_id = b.id;
```

| id | site_name | street_address | city | program_id | program_program_name | program_season |
|---|---|---|---|---|---|---|
| 1 | Composite Review | composite-street-15 | integrated-city-34 | 1 | Extended Review | distributed-season-36 |
| 2 | Compact Initiative A | primary-street-16 | seasonal-city-35 | 2 | Pilot Initiative A | baseline-season-37 |
| 3 | Legacy Model | adaptive-street-17 | regional-city-36 | 3 | Baseline Model | pilot-season-38 |
| 4 | Regional Cluster | distributed-street-18 | legacy-city-37 | 4 | Distributed Cluster | extended-season-39 |

The `distribution_site_aid_program_view` mirrors the program-to-site mapping from the opposite direction, answering: "Which aid program does each distribution site serve?" A row from this view would show "Compact Initiative A" (site id 2) serving "Pilot Initiative A" (program id 2). This view is useful for site-level reporting, such as calculating the total number of recipients expected at a given location.

**View `notification_event_aid_recipient_view`**

```sql
CREATE VIEW notification_event_aid_recipient_view AS
SELECT a.id, a.notification_type, a.scheduled_date, a.delivery_status, b.id AS recipient_id, b.contact_name AS recipient_contact_name, b.cell_phone AS recipient_cell_phone
FROM notification_events a JOIN aid_recipients b ON a.aid_recipient_id = b.id;
```

| id | notification_type | scheduled_date | delivery_status | recipient_id | recipient_contact_name | recipient_cell_phone |
|---|---|---|---|---|---|---|
| 1000 | adaptive-notifica-35 | 2024-11-27 | scheduled | 1 | Kenneth Smith | distributed-cell-72 |
| 1001 | distributed-notifica-36 | 2025-04-11 | sent | 2 | Michelle Kelley | baseline-cell-73 |
| 1002 | baseline-notifica-37 | 2022-09-22 | failed | 3 | Kimberly Myers | pilot-cell-74 |
| 1003 | pilot-notifica-38 | 2023-02-06 | scheduled | 4 | Tasha Rodriguez | extended-cell-75 |

The `notification_event_aid_recipient_view` links notification events back to their associated recipients, answering: "Which recipient is each notification intended for?" A row from this view would show notification id 1001 (type `distributed-notifica-36`, status `sent`) directed at Michelle Kelley (recipient id 2). This view supports communication audits and helps identify patterns in notification delivery failures.

**View `notification_event_aid_program_view`**

```sql
CREATE VIEW notification_event_aid_program_view AS
SELECT a.id, a.notification_type, a.scheduled_date, a.delivery_status, b.id AS program_id, b.program_name AS program_program_name, b.season AS program_season
FROM notification_events a JOIN aid_programs b ON a.aid_program_id = b.id;
```

| id | notification_type | scheduled_date | delivery_status | program_id | program_program_name | program_season |
|---|---|---|---|---|---|---|
| 1000 | adaptive-notifica-35 | 2024-11-27 | scheduled | 1 | Extended Review | distributed-season-36 |
| 1001 | distributed-notifica-36 | 2025-04-11 | sent | 2 | Pilot Initiative A | baseline-season-37 |
| 1002 | baseline-notifica-37 | 2022-09-22 | failed | 3 | Baseline Model | pilot-season-38 |
| 1003 | pilot-notifica-38 | 2023-02-06 | scheduled | 4 | Distributed Cluster | extended-season-39 |

The `notification_event_aid_program_view` connects notification events to their corresponding aid programs, answering: "Which program is each notification related to?" A row from this view would show notification id 1003 (type `pilot-notifica-38`, scheduled for 2023-02-06) associated with "Distributed Cluster" (program id 4). This view enables program-level communication tracking, allowing administrators to assess the reach and reliability of notifications per program.

## Synthesis

The data model for humanitarian aid program management captures a network of interrelated entities: recipients who apply for assistance, children who depend on those recipients, programs that define the scope of aid, distribution sites that fulfill it, and notifications that communicate progress. The base tables store the raw records, while the junction tables (`recipients_childs` and `programs_recipients`) model the many-to-many relationships that reflect real-world complexity—children shared across recipients and recipients enrolled in multiple programs. The views synthesize these relationships into actionable reports, from household-level child inventories to program-level enrollment summaries and communication delivery audits. Together, these structures provide a comprehensive operational picture, enabling administrators to track beneficiaries, manage logistics, and ensure that aid reaches the people who need it.