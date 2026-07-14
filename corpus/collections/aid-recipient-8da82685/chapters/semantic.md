## Normalised Modelling of the Aid Distribution Domain

The aid distribution domain captures the lifecycle of a social assistance programme: organisations design programmes, assign them to physical distribution sites, individuals register as recipients, children are enrolled under each recipient, and automated notifications are dispatched to confirm or reject participation. The relational schema is built from seven base tables and nine derived views. The base tables enforce a clean normal form; the views materialise the domain facts by joining the normalised pieces back together.

**Table `aid_recipients`**

| id | contact_name | cell_phone | physical_address | registration_deadline | registration_status | aid_program_id | notification_event_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|
| 1 | Kenneth Smith | distributed-cell-72 | pilot-physical-98 | 2023-02-05 | pending | 1 | 1000 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | Michelle Kelley | baseline-cell-73 | extended-physical-99 | 2024-07-16 | accepted | 2 | 1001 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | Kimberly Myers | pilot-cell-74 | integrated-physical-100 | 2025-12-27 | rejected | 3 | 1002 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | Tasha Rodriguez | extended-cell-75 | seasonal-physical-101 | 2022-05-11 | pending | 4 | 1003 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The `aid_recipients` table is the central entity. Each row represents a person who has applied to receive aid. The primary key `id` is an integer surrogate; the business identifiers are the `contact_name` column (e.g. "Kenneth Smith", "Michelle Kelley") and the `cell_phone` column (e.g. "distributed-cell-72", "pilot-cell-74"). The `physical_address` column stores a free-text location such as "pilot-physical-98" or "extended-physical-99". Two date columns — `registration_deadline` and the audit timestamps `created_at` / `updated_at` — track the application window and the row's lifecycle. The `registration_status` column is a categorical flag with values "pending", "accepted", and "rejected", as seen in rows 1 through 4.

Two foreign keys anchor `aid_recipients` to other entities. The column `aid_program_id` references `aid_programs.id`, binding each recipient to exactly one programme. The column `notification_event_id` references `notification_events.id`, linking the recipient to a single notification event. These relationships are cardinality-bounded: a recipient belongs to one programme and receives one notification event, while a programme or notification event may be associated with many recipients.

**Table `childs`**

| id | child_name | age | sex | shirt_size | pants_size | shoe_size | diaper_size | favorite_color | aid_recipient_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 100 | Integrated Framework A | 35 | male | pilot-shirt-68 | pilot-pants-44 | composite-shoe-99 | compact-diaper-44 | Strawberry Blond | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 101 | Extended Protocol | 40 | female | extended-shirt-69 | extended-pants-45 | primary-shoe-100 | composite-diaper-45 | Brownn | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 102 | Pilot Programme | 45 | other | integrated-shirt-70 | integrated-pants-46 | adaptive-shoe-101 | primary-diaper-46 | Black | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 103 | Baseline Standard D | 50 | male | seasonal-shirt-71 | seasonal-pants-47 | distributed-shoe-102 | adaptive-diaper-47 | Pink | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The `childs` table stores dependents of aid recipients. Its primary key `id` is an integer surrogate; the `child_name` column carries descriptive labels such as "Integrated Framework A" and "Extended Protocol". The `age` column holds integer values ranging from 35 to 50 in the sample data. The `sex` column is categorical ("male", "female", "other"). Six sizing columns — `shirt_size`, `pants_size`, `shoe_size`, `diaper_size` — store string-encoded sizes like "pilot-shirt-68" and "compact-diaper-44". The `favorite_color` column is a free-text attribute ("Strawberry Blond", "Brownn", "Black"). The foreign key `aid_recipient_id` references `aid_recipients.id`, establishing a one-to-many relationship: each child belongs to exactly one recipient, but a recipient may have multiple children. The audit columns `created_at` and `updated_at` mirror the pattern in `aid_recipients`.

**Table `aid_programs`**

| id | program_name | season | supporting_organization | registration_deadline | pickup_date | pickup_start_time | pickup_end_time | distribution_site_id |
|---|---|---|---|---|---|---|---|---|
| 1 | Extended Review | distributed-season-36 | Align Technology | 2023-02-05 | 2023-10-06 | 2023-06-03T05:39:00 | 2025-08-22T19:33:00 | 1 |
| 2 | Pilot Initiative A | baseline-season-37 | Professional Educator Standards Board | 2024-07-16 | 2024-03-17 | 2024-11-14T12:56:00 | 2022-01-06T02:50:00 | 2 |
| 3 | Baseline Model | pilot-season-38 | Luddic Path | 2025-12-27 | 2025-08-01 | 2025-04-25T19:13:00 | 2023-06-17T09:07:00 | 3 |
| 4 | Distributed Cluster | extended-season-39 | Column Name cannot be empty | 2022-05-11 | 2022-01-12 | 2022-09-09T02:30:00 | 2024-11-01T16:24:00 | 4 |

The `aid_programs` table defines the programmes themselves. Its primary key `id` is an integer surrogate. The `program_name` column holds names such as "Extended Review", "Pilot Initiative A", "Baseline Model", and "Distributed Cluster". The `season` column is a categorical string ("distributed-season-36", "baseline-season-37", etc.). The `supporting_organization` column names the sponsoring body — "Align Technology", "Professional Educator Standards Board", "Luddic Path", and "Column Name cannot be empty" in the sample. Two date columns, `registration_deadline` and `pickup_date`, define the application and distribution windows. The `pickup_start_time` and `pickup_end_time` columns store `TIMESTAMP` values such as "2023-06-03T05:39:00" and "2025-08-22T19:33:00". The foreign key `distribution_site_id` references `distribution_sites.id`, binding each programme to exactly one distribution site.

**Table `distribution_sites`**

| id | site_name | street_address | city | state | postal_code | aid_program_id |
|---|---|---|---|---|---|---|
| 1 | Composite Review | composite-street-15 | integrated-city-34 | distributed-state-84 | 9125611 | 1 |
| 2 | Compact Initiative A | primary-street-16 | seasonal-city-35 | baseline-state-85 | ChIJt4hBkzhu5kcRJJDUNqGUpso | 2 |
| 3 | Legacy Model | adaptive-street-17 | regional-city-36 | pilot-state-86 | 3001009030200 | 3 |
| 4 | Regional Cluster | distributed-street-18 | legacy-city-37 | extended-state-87 | 4060635 | 4 |

The `distribution_sites` table describes physical locations where aid is picked up. Its primary key `id` is an integer surrogate. The `site_name` column holds names like "Composite Review", "Compact Initiative A", "Legacy Model", and "Regional Cluster". The address is decomposed into `street_address`, `city`, `state`, and `postal_code` columns — for example, "composite-street-15" in "integrated-city-34", "distributed-state-84", postal code "9125611". The foreign key `aid_program_id` references `aid_programs.id`, creating a reciprocal relationship with `aid_programs`: each site is associated with exactly one programme, and each programme is associated with exactly one site. This one-to-one pairing is enforced by the foreign keys on both sides.

**Table `notification_events`**

| id | notification_type | scheduled_date | delivery_status | aid_recipient_id | aid_program_id |
|---|---|---|---|---|---|
| 1000 | adaptive-notifica-35 | 2024-11-27 | scheduled | 1 | 1 |
| 1001 | distributed-notifica-36 | 2025-04-11 | sent | 2 | 2 |
| 1002 | baseline-notifica-37 | 2022-09-22 | failed | 3 | 3 |
| 1003 | pilot-notifica-38 | 2023-02-06 | scheduled | 4 | 4 |

The `notification_events` table records the automated messages sent to recipients. Its primary key `id` is an integer surrogate. The `notification_type` column is a categorical string such as "adaptive-notifica-35" and "distributed-notifica-36". The `scheduled_date` column stores a `DATE` value like "2024-11-27". The `delivery_status` column is a categorical flag with values "scheduled", "sent", and "failed". Two foreign keys anchor this table: `aid_recipient_id` references `aid_recipients.id`, and `aid_program_id` references `aid_programs.id`. Thus each notification event is associated with exactly one recipient and exactly one programme, while a recipient or programme may have multiple notification events.

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

The `recipients_childs` table is a junction table that resolves the many-to-many relationship between `aid_recipients` and `childs`. It has two columns, `aid_recipient_id` and `child_id`, both of which are foreign keys referencing their respective parent tables. The composite primary key is the pair `(aid_recipient_id, child_id)`. In the sample data, recipient 1 is linked to children 100 and 101; recipient 2 to children 101 and 102; recipient 3 to children 102 and 103; and recipient 4 to children 103 and 100. This cross-linking pattern — where child 100 appears under both recipients 1 and 4, and child 101 under both recipients 1 and 2 — demonstrates that the model supports a child being associated with multiple recipients, which is the defining characteristic of a many-to-many relationship.

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

The `programs_recipients` table is a second junction table that resolves the many-to-many relationship between `aid_programs` and `aid_recipients`. Although the `aid_recipients` table also carries a direct `aid_program_id` foreign key, the existence of this junction table indicates that the domain allows a recipient to be enrolled in multiple programmes and a programme to have multiple recipients. The two columns are `aid_program_id` and `aid_recipient_id`, forming a composite primary key. This table provides an explicit, auditable record of programme enrolments separate from the current programme assignment stored in `aid_recipients.aid_program_id`.

### Materialised Views

The nine views reconstruct domain facts by joining the normalised tables. Each view answers a specific analytical question.

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

This view joins `aid_recipients` with `recipients_childs` and `childs` to produce a flat row per recipient–child pair. It answers the question: "Which children are associated with which aid recipients, and what are their details?" A row from this view would show the recipient's contact name alongside the child's name, age, sex, and all sizing attributes. For example, the join would surface that Kenneth Smith (recipient 1) is associated with child "Integrated Framework A" (child 100), age 35, male, with shirt size "pilot-shirt-68" and shoe size "composite-shoe-99".

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

This view joins `aid_recipients` with `aid_programs` on `aid_recipients.aid_program_id = aid_programs.id`. It answers: "Which aid programme is each recipient enrolled in, and what are the programme's logistics?" A row would show the recipient's name and status alongside the programme name, season, supporting organisation, and pickup schedule. For instance, Michelle Kelley (recipient 2, status "accepted") is enrolled in "Pilot Initiative A" (programme 2), supported by "Professional Educator Standards Board", with pickup on "2024-03-17" between "2024-11-14T12:56:00" and "2022-01-06T02:50:00".

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

This view joins `aid_recipients` with `notification_events` on `aid_recipients.notification_event_id = notification_events.id`. It answers: "What notification was sent to each recipient, and what was its delivery outcome?" A row would show the recipient's name alongside the notification type, scheduled date, and delivery status. For example, Kimberly Myers (recipient 3, status "rejected") received a "baseline-notifica-37" notification scheduled for "2022-09-22" with delivery status "failed".

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

This view joins `childs` with `aid_recipients` on `childs.aid_recipient_id = aid_recipients.id`. It answers: "Which recipient is the primary contact for each child?" Unlike the junction-based `aid_recipient_child_detail_view`, this view uses the direct foreign key in `childs`, producing one row per child. A row would show the child's name and attributes alongside the recipient's contact name and registration status. For instance, child "Extended Protocol" (child 101, age 40, female) is linked to recipient Michelle Kelley (recipient 2, status "accepted").

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

This view joins `aid_programs` with `distribution_sites` on `aid_programs.distribution_site_id = distribution_sites.id`. It answers: "Where is each aid programme distributed?" A row would show the programme name and pickup times alongside the site name and full address. For example, "Distributed Cluster" (programme 4) is distributed from "Regional Cluster" (site 4), located at "distributed-street-18" in "legacy-city-37", "extended-state-87", postal code "4060635".

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

This view joins `aid_programs` with `aid_recipients` on `aid_programs.id = aid_recipients.aid_program_id`. It answers: "Which recipients are enrolled in each programme, and what is their registration status?" A row would show the programme name and supporting organisation alongside the recipient's name, contact details, and status. For example, "Extended Review" (programme 1), supported by "Align Technology", has Kenneth Smith (recipient 1, status "pending") as an enrollee.

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

This view joins `distribution_sites` with `aid_programs` on `distribution_sites.aid_program_id = aid_programs.id`. It answers: "Which programme is associated with each distribution site?" This is the inverse of `aid_program_distribution_site_view` but from the site's perspective. A row would show the site name and address alongside the programme name, season, and pickup schedule. For instance, "Legacy Model" (site 3) at "adaptive-street-17" in "regional-city-36" hosts the "Baseline Model" programme (programme 3), supported by "Luddic Path".

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

This view joins `notification_events` with `aid_recipients` on `notification_events.aid_recipient_id = aid_recipients.id`. It answers: "Which recipient received each notification, and what is their registration status?" A row would show the notification type and delivery status alongside the recipient's name and status. For example, the "pilot-notifica-38" notification (event 1003), scheduled for "2023-02-06" with status "scheduled", was sent to Tasha Rodriguez (recipient 4, status "pending").

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

This view joins `notification_events` with `aid_programs` on `notification_events.aid_program_id = aid_programs.id`. It answers: "Which programme is associated with each notification event?" A row would show the notification type and delivery status alongside the programme name, season, and pickup logistics. For instance, the "distributed-notifica-36" notification (event 1001), sent on "2025-04-11" with status "sent", is associated with the "Pilot Initiative A" programme (programme 2), which has pickup on "2024-03-17".

### Synthesis

The schema models the aid distribution domain as a network of interrelated entities. The `aid_recipients` table sits at the centre, linked to `aid_programs` and `notification_events` through direct foreign keys, and to `childs` through both a direct foreign key and the `recipients_childs` junction table. The `aid_programs` and `distribution_sites` tables form a reciprocal one-to-one pairing. The nine views materialise the domain facts by joining these normalised tables, each view answering a specific analytical question about the relationships between recipients, children, programmes, sites, and notifications. The model balances normalisation — avoiding redundancy by storing each entity once — with readability — providing pre-joined views that reconstruct the flat, human-readable facts that domain stakeholders need.