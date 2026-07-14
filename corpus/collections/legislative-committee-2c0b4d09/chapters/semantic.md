## Modelling Legislative Governance: From Ontology to Relational Schema

The domain under examination captures the organisational fabric of a legislative body: committees that deliberate, legislators who serve within them, policy domains that define regulatory scope, and the physical venues where meetings convene. At the heart of the model lies a set of five base tables that store entities in first normal form, augmented by three junction tables that resolve many-to-many relationships, and a suite of ten materialised views that reassemble the normalised facts into domain-meaningful records. The schema is designed so that every view corresponds to a single analytical question—such as "which legislators attend which meetings?" or "what policy domains does a committee oversee?"—and each view's join path traces a clear foreign-key chain from the base tables.

**Table `legislative_committees`**

| id | committee_id | committee_name | jurisdiction_description | status | established_date | venue_id |
|---|---|---|---|---|---|---|
| 1 | PHR-98 | Composite Cluster | Adaptive Corridor | active | 2024-03-27T14:30:00 | 2839523 |
| 2 | L785 | Compact Review A | Primary Series | inactive | 2025-08-11T21:47:00 | goh |
| 3 | 7119774 | Legacy Initiative | Composite Assessment D | dissolved | 2022-01-22T04:04:00 | 27d06ecf80b34272bb825aa8d4b0983f |
| 4 | 1186094 | Regional Model | Compact Survey | active | 2023-06-06T11:21:00 | L296 |

The `legislative_committees` table is the central entity. Each row represents a standing or ad-hoc committee, identified by a surrogate primary key `id` and a human-readable `committee_id` such as `PHR-98` or `L785`. The `committee_name` column carries descriptive labels like "Composite Cluster" and "Compact Review A", while `jurisdiction_description`—values such as "Adaptive Corridor" and "Primary Series"—articulates the committee's functional remit. The `status` column is a categorical flag taking values `active`, `inactive`, or `dissolved`, and `established_date` records the committee's founding timestamp, for instance `2024-03-27T14:30:00`. The `venue_id` column is a foreign key pointing to `meeting_venues`, establishing a one-to-many relationship: a single venue can host meetings for multiple committees, but each committee row references exactly one default venue. In the sample data, committee `PHR-98` (id 1) points to venue `2839523`, while committee `L785` (id 2) references venue `goh`.

**Table `legislators`**

| id | legislator_id | full_name | role | contact_email | contact_phone | legislative_committee_id |
|---|---|---|---|---|---|---|
| 1 | ChIJyQkrS_pt5kcRgcBUZri0Wao | Theodore Mcgrath | member | Christopher Wilson | Joe Tsai | 1 |
| 2 | 1996927 | Account Name | chair | Charles Larsen | Stephanie Collins | 2 |
| 3 | 20963968 | Saipan International Airport | vice-chair | Mary Alvarez | Tasha Rodriguez | 3 |
| 4 | 4843 | Norma Fisher | clerk | April Snyder | Walter Pratt | 4 |

The `legislators` table stores individual members of the legislature. Its surrogate primary key is `id`, and the `legislator_id` column carries a distinct identifier such as `ChIJyQkrS_pt5kcRgcBUZri0Wao` or `1996927`. The `full_name` column holds names like "Theodore Mcgrath" and "Norma Fisher", while `role` is a categorical attribute with values `member`, `chair`, `vice-chair`, and `clerk`. Contact information is captured in `contact_email` and `contact_phone`, which in the sample data contain personal names rather than standard email or phone formats—reflecting a synthetic dataset. The critical foreign key is `legislative_committee_id`, which links each legislator to exactly one `legislative_committees` row. For example, legislator id 1 ("Theodore Mcgrath", role `member`) is assigned to committee id 1, while legislator id 4 ("Norma Fisher", role `clerk") belongs to committee id 4. This column enforces a many-to-one cardinality: many legislators can belong to the same committee, but each legislator row references a single committee.

**Table `policy_domains`**

| domain_code | domain_name | regulatory_scope | enforcement_agency | legislative_committee_id | overlaps_with_domain_code | created_at | updated_at |
|---|---|---|---|---|---|---|---|
| 4716398 | Regional Protocol | legacy-regulato-85 | China Unionpay Co. Ltd | 1 | 4716398 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 605967 | Seasonal Programme D | compact-regulato-86 | Hamilton County Department of Education | 2 | 605967 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 16375765 | Integrated Standard | composite-regulato-87 | Petco Health and Wellness Company Inc. | 3 | 16375765 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 0471948470 | Extended Framework | primary-regulato-88 | Alexandria Real Estate Equities | 4 | 0471948470 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Policy domains are captured in the `policy_domains` table, where each row defines a regulatory area. The primary key is `domain_code`, with sample values `4716398` and `605967`. The `domain_name` column carries labels such as "Regional Protocol" and "Seasonal Programme D", while `regulatory_scope` provides a short code like `legacy-regulato-85`. The `enforcement_agency` column names the responsible body—"China Unionpay Co. Ltd" and "Hamilton County Department of Education" appear in the data. The foreign key `legislative_committee_id` ties each domain to a committee, meaning a committee oversees one or more policy domains. A self-referential foreign key `overlaps_with_domain_code` points back to `domain_code`, modelling the fact that policy domains can overlap with one another; in the sample data, each domain's `overlaps_with_domain_code` matches its own `domain_code`, indicating a reflexive overlap relationship. Timestamps `created_at` and `updated_at` track the lifecycle of each domain record.

**Table `meeting_venues`**

| venue_id | venue_name | street_address | city | state | zip_code | room_number | meeting_id | created_at |
|---|---|---|---|---|---|---|---|---|
| 2839523 | Legacy Review D | composite-street-15 | integrated-city-34 | distributed-state-84 | 69434 | ROO-2106 | 20967529 | 2025-01-01 00:14:00 |
| goh | Regional Initiative | primary-street-16 | seasonal-city-35 | baseline-state-85 | 13589 | ROO-2113 | ChIJd13ymnZu5kcRXM7jx5boJBs | 2025-02-06 03:14:00 |
| 27d06ecf80b34272bb825aa8d4b0983f | Seasonal Model | adaptive-street-17 | regional-city-36 | pilot-state-86 | 9bb5fec0-8fcc-11eb-924d-9cd76263cbd0 | ROO-2120 | gd_acc_763000 | 2025-03-11 06:14:00 |
| L296 | Integrated Cluster A | distributed-street-18 | legacy-city-37 | extended-state-87 | 1250214 | ROO-2127 | 922ad118-9bad-11eb-a8a2-19ed5c03f8d3 | 2025-04-16 09:14:00 |

The `meeting_venues` table stores physical locations where committee meetings occur. Its primary key is `venue_id`, with values such as `2839523`, `goh`, and `27d06ecf80b34272bb825aa8d4b0983f`. The `venue_name` column carries descriptive names like "Legacy Review D" and "Regional Initiative". Address fields—`street_address`, `city`, `state`, and `zip_code`—provide location detail; for instance, venue `2839523` is located at "composite-street-15" in "integrated-city-34". The `room_number` column, with values like `ROO-2106` and `ROO-2113`, identifies the specific room within the venue. The `meeting_id` column is a foreign key referencing `committee_meetings`, establishing that a venue row is associated with a particular meeting. The `created_at` timestamp records when the venue record was inserted.

**Table `committee_meetings`**

| meeting_id | scheduled_date_time | duration_minutes | meeting_type | status | legislative_committee_id | venue_id |
|---|---|---|---|---|---|---|
| 20967529 | 2023-10-18T21:03:00 | 35 | regular | scheduled | 1 | 2839523 |
| ChIJd13ymnZu5kcRXM7jx5boJBs | 2024-03-02T04:20:00 | 38 | special | ongoing | 2 | goh |
| gd_acc_763000 | 2025-08-13T11:37:00 | 41 | emergency | completed | 3 | 27d06ecf80b34272bb825aa8d4b0983f |
| 922ad118-9bad-11eb-a8a2-19ed5c03f8d3 | 2022-01-24T18:54:00 | 44 | public_hearing | cancelled | 4 | L296 |

Meetings are recorded in the `committee_meetings` table. The primary key `meeting_id` carries identifiers such as `20967529` and `ChIJd13ymnZu5kcRXM7jx5boJBs`. The `scheduled_date_time` column stores the meeting's date and time, for example `2023-10-18T21:03:00`. The `duration_minutes` column is an integer—values in the sample range from 35 to 44 minutes. The `meeting_type` column is categorical, taking values `regular`, `special`, `emergency`, and `public_hearing`. The `status` column tracks the meeting's lifecycle state with values `scheduled`, `ongoing`, `completed`, and `cancelled`. Two foreign keys anchor the meeting to the domain: `legislative_committee_id` links the meeting to its parent committee, and `venue_id` links it to the physical location. Meeting `20967529` (type `regular`, status `scheduled`) belongs to committee id 1 and is held at venue `2839523`.

**Table `committees_legislators`**

| legislative_committee_id | legislator_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

The `committees_legislators` junction table resolves the many-to-many relationship between committees and legislators. It contains two columns, `legislative_committee_id` and `legislator_id`, both of which are foreign keys referencing their respective base tables. The composite key (both columns together) is unique, ensuring a legislator cannot be listed twice in the same committee. In the sample data, committee id 1 includes legislators id 1 and id 2; committee id 2 includes legislators id 2 and id 3; committee id 3 includes legislators id 3 and id 4; and committee id 4 includes legislators id 4 and id 1. This cross-referencing pattern means that legislators id 1 and id 2 each serve on two committees, demonstrating the many-to-many cardinality that the junction table is designed to capture.

**Table `committees_domains`**

| legislative_committee_id | domain_code |
|---|---|
| 1 | 4716398 |
| 1 | 605967 |
| 2 | 605967 |
| 2 | 16375765 |
| 3 | 16375765 |
| 3 | 0471948470 |
| 4 | 0471948470 |
| 4 | 4716398 |

The `committees_domains` junction table resolves the many-to-many relationship between legislative committees and policy domains. Its two columns, `legislative_committee_id` and `domain_code`, are foreign keys referencing `legislative_committees` and `policy_domains` respectively. While the sample data does not display explicit rows for this table, its structural role is clear: a committee can oversee multiple policy domains, and a policy domain can be relevant to multiple committees. The composite key prevents duplicate assignments.

**Table `meetings_legislators`**

| meeting_id | legislator_id |
|---|---|
| 20967529 | 1 |
| 20967529 | 2 |
| ChIJd13ymnZu5kcRXM7jx5boJBs | 2 |
| ChIJd13ymnZu5kcRXM7jx5boJBs | 3 |
| gd_acc_763000 | 3 |
| gd_acc_763000 | 4 |
| 922ad118-9bad-11eb-a8a2-19ed5c03f8d3 | 4 |
| 922ad118-9bad-11eb-a8a2-19ed5c03f8d3 | 1 |

The `meetings_legislators` junction table captures attendance: which legislators participated in which meetings. Its columns `meeting_id` and `legislator_id` are foreign keys referencing `committee_meetings` and `legislators` respectively. Like the other junction tables, the composite key is unique, preventing a legislator from being recorded as attending the same meeting twice. This table enables the reconstruction of attendance records through joins across the three tables it connects.

With the base tables and junction tables established, the schema provides a fully normalised foundation. The following views materialise common analytical queries by joining these tables along their foreign-key paths.

**View `v_legislative_committee_legislator_detail`**

```sql
CREATE VIEW v_legislative_committee_legislator_detail AS
SELECT a.id, a.committee_id, a.committee_name, b.id AS legislator_id, b.legislator_id AS legislator_legislator_id, b.full_name AS legislator_full_name
FROM legislative_committees a
  JOIN committees_legislators j ON j.legislative_committee_id = a.id
  JOIN legislators b ON b.id = j.legislator_id;
```

| id | committee_id | committee_name | legislator_id | legislator_legislator_id | legislator_full_name |
|---|---|---|---|---|---|
| 1 | PHR-98 | Composite Cluster | 1 | ChIJyQkrS_pt5kcRgcBUZri0Wao | Theodore Mcgrath |
| 1 | PHR-98 | Composite Cluster | 2 | 1996927 | Account Name |
| 2 | L785 | Compact Review A | 2 | 1996927 | Account Name |
| 2 | L785 | Compact Review A | 3 | 20963968 | Saipan International Airport |
| 3 | 7119774 | Legacy Initiative | 3 | 20963968 | Saipan International Airport |
| 3 | 7119774 | Legacy Initiative | 4 | 4843 | Norma Fisher |
| 4 | 1186094 | Regional Model | 4 | 4843 | Norma Fisher |
| 4 | 1186094 | Regional Model | 1 | ChIJyQkrS_pt5kcRgcBUZri0Wao | Theodore Mcgrath |

This view joins `legislative_committees` with `committees_legislators` and `legislators` to produce a flat record of every legislator's assignment to a committee. The join path is: `legislative_committees.id` → `committees_legislators.legislative_committee_id` → `legislators.id`. The resulting rows combine committee metadata (name, jurisdiction, status) with legislator details (name, role, contact). A representative row would show committee "Composite Cluster" (id 1) alongside legislator "Theodore Mcgrath" (id 1, role `member`), answering the question "who serves on which committee?"

**View `v_legislative_committee_policy_domain_detail`**

```sql
CREATE VIEW v_legislative_committee_policy_domain_detail AS
SELECT a.id, a.committee_id, a.committee_name, b.domain_code AS domain_domain_code, b.domain_name AS domain_domain_name, b.regulatory_scope AS domain_regulatory_scope
FROM legislative_committees a
  JOIN committees_domains j ON j.legislative_committee_id = a.id
  JOIN policy_domains b ON b.domain_code = j.domain_code;
```

| id | committee_id | committee_name | domain_domain_code | domain_domain_name | domain_regulatory_scope |
|---|---|---|---|---|---|
| 1 | PHR-98 | Composite Cluster | 4716398 | Regional Protocol | legacy-regulato-85 |
| 1 | PHR-98 | Composite Cluster | 605967 | Seasonal Programme D | compact-regulato-86 |
| 2 | L785 | Compact Review A | 605967 | Seasonal Programme D | compact-regulato-86 |
| 2 | L785 | Compact Review A | 16375765 | Integrated Standard | composite-regulato-87 |
| 3 | 7119774 | Legacy Initiative | 16375765 | Integrated Standard | composite-regulato-87 |
| 3 | 7119774 | Legacy Initiative | 0471948470 | Extended Framework | primary-regulato-88 |
| 4 | 1186094 | Regional Model | 0471948470 | Extended Framework | primary-regulato-88 |
| 4 | 1186094 | Regional Model | 4716398 | Regional Protocol | legacy-regulato-85 |

This view joins `legislative_committees` with `committees_domains` and `policy_domains` to produce a flat record of every policy domain overseen by a committee. The join path is: `legislative_committees.id` → `committees_domains.legislative_committee_id` → `policy_domains.domain_code`. The result combines committee identity with domain metadata (name, regulatory scope, enforcement agency). A representative row would show committee "Compact Review A" (id 2) alongside domain "Seasonal Programme D" (code `605967`, scope `compact-regulato-86`), answering "which policy domains does a committee regulate?"

**View `v_legislative_committee_meeting_venue`**

```sql
CREATE VIEW v_legislative_committee_meeting_venue AS
SELECT a.id, a.committee_id, a.committee_name, a.jurisdiction_description, b.venue_id AS venue_venue_id, b.venue_name AS venue_venue_name, b.street_address AS venue_street_address
FROM legislative_committees a JOIN meeting_venues b ON a.venue_id = b.venue_id;
```

| id | committee_id | committee_name | jurisdiction_description | venue_venue_id | venue_venue_name | venue_street_address |
|---|---|---|---|---|---|---|
| 1 | PHR-98 | Composite Cluster | Adaptive Corridor | 2839523 | Legacy Review D | composite-street-15 |
| 2 | L785 | Compact Review A | Primary Series | goh | Regional Initiative | primary-street-16 |
| 3 | 7119774 | Legacy Initiative | Composite Assessment D | 27d06ecf80b34272bb825aa8d4b0983f | Seasonal Model | adaptive-street-17 |
| 4 | 1186094 | Regional Model | Compact Survey | L296 | Integrated Cluster A | distributed-street-18 |

This view joins `legislative_committees` directly with `meeting_venues` on `legislative_committees.venue_id` = `meeting_venues.venue_id`. It produces a flat record pairing each committee with its default meeting venue, including the full address and room number. A representative row would show committee "Composite Cluster" (id 1) at venue "Legacy Review D" (`2839523`), room `ROO-2106`, answering "where does a committee normally convene?"

**View `v_legislator_legislative_committee`**

```sql
CREATE VIEW v_legislator_legislative_committee AS
SELECT a.id, a.legislator_id, a.full_name, a.role, b.id AS committee_id, b.committee_id AS committee_committee_id, b.committee_name AS committee_committee_name
FROM legislators a JOIN legislative_committees b ON a.legislative_committee_id = b.id;
```

| id | legislator_id | full_name | role | committee_id | committee_committee_id | committee_committee_name |
|---|---|---|---|---|---|---|
| 1 | ChIJyQkrS_pt5kcRgcBUZri0Wao | Theodore Mcgrath | member | 1 | PHR-98 | Composite Cluster |
| 2 | 1996927 | Account Name | chair | 2 | L785 | Compact Review A |
| 3 | 20963968 | Saipan International Airport | vice-chair | 3 | 7119774 | Legacy Initiative |
| 4 | 4843 | Norma Fisher | clerk | 4 | 1186094 | Regional Model |

This view joins `legislators` with `legislative_committees` on `legislators.legislative_committee_id` = `legislative_committees.id`. It produces a flat record of each legislator's primary committee assignment, combining legislator details (name, role, contact) with committee metadata. A representative row would show "Theodore Mcgrath" (id 1, role `member`) assigned to committee "Composite Cluster" (id 1, status `active`), answering "which committee is a legislator assigned to?"

**View `v_policy_domain_legislative_committee`**

```sql
CREATE VIEW v_policy_domain_legislative_committee AS
SELECT a.domain_code, a.domain_name, a.regulatory_scope, a.enforcement_agency, b.id AS committee_id, b.committee_id AS committee_committee_id, b.committee_name AS committee_committee_name
FROM policy_domains a JOIN legislative_committees b ON a.legislative_committee_id = b.id;
```

| domain_code | domain_name | regulatory_scope | enforcement_agency | committee_id | committee_committee_id | committee_committee_name |
|---|---|---|---|---|---|---|
| 4716398 | Regional Protocol | legacy-regulato-85 | China Unionpay Co. Ltd | 1 | PHR-98 | Composite Cluster |
| 605967 | Seasonal Programme D | compact-regulato-86 | Hamilton County Department of Education | 2 | L785 | Compact Review A |
| 16375765 | Integrated Standard | composite-regulato-87 | Petco Health and Wellness Company Inc. | 3 | 7119774 | Legacy Initiative |
| 0471948470 | Extended Framework | primary-regulato-88 | Alexandria Real Estate Equities | 4 | 1186094 | Regional Model |

This view joins `policy_domains` with `legislative_committees` on `policy_domains.legislative_committee_id` = `legislative_committees.id`. It produces a flat record of each policy domain's overseeing committee, combining domain metadata (name, regulatory scope, enforcement agency) with committee identity. A representative row would show domain "Regional Protocol" (code `4716398`) overseen by committee "Composite Cluster" (id 1), answering "which committee oversees a policy domain?"

**View `v_policy_domain_policy_domain`**

```sql
CREATE VIEW v_policy_domain_policy_domain AS
SELECT a.domain_code, a.domain_name, a.regulatory_scope, a.enforcement_agency, b.domain_code AS domain_domain_code, b.domain_name AS domain_domain_name, b.regulatory_scope AS domain_regulatory_scope
FROM policy_domains a JOIN policy_domains b ON a.overlaps_with_domain_code = b.domain_code;
```

| domain_code | domain_name | regulatory_scope | enforcement_agency | domain_domain_code | domain_domain_name | domain_regulatory_scope |
|---|---|---|---|---|---|---|
| 4716398 | Regional Protocol | legacy-regulato-85 | China Unionpay Co. Ltd | 4716398 | Regional Protocol | legacy-regulato-85 |
| 605967 | Seasonal Programme D | compact-regulato-86 | Hamilton County Department of Education | 605967 | Seasonal Programme D | compact-regulato-86 |
| 16375765 | Integrated Standard | composite-regulato-87 | Petco Health and Wellness Company Inc. | 16375765 | Integrated Standard | composite-regulato-87 |
| 0471948470 | Extended Framework | primary-regulato-88 | Alexandria Real Estate Equities | 0471948470 | Extended Framework | primary-regulato-88 |

This view performs a self-join on `policy_domains`, linking `policy_domains.domain_code` to `policy_domains.overlaps_with_domain_code`. It produces a flat record of overlapping domain pairs, where each row shows a domain alongside the domain it overlaps with. In the sample data, since each domain's `overlaps_with_domain_code` matches its own `domain_code`, the view would return rows where a domain overlaps with itself—a reflexive relationship. A representative row would show "Regional Protocol" (code `4716398`) overlapping with "Regional Protocol" (code `4716398`), answering "which policy domains overlap with one another?"

**View `v_meeting_venue_committee_meeting`**

```sql
CREATE VIEW v_meeting_venue_committee_meeting AS
SELECT a.venue_id, a.venue_name, a.street_address, a.city, b.meeting_id AS meeting_meeting_id, b.scheduled_date_time AS meeting_scheduled_date_time, b.duration_minutes AS meeting_duration_minutes
FROM meeting_venues a JOIN committee_meetings b ON a.meeting_id = b.meeting_id;
```

| venue_id | venue_name | street_address | city | meeting_meeting_id | meeting_scheduled_date_time | meeting_duration_minutes |
|---|---|---|---|---|---|---|
| 2839523 | Legacy Review D | composite-street-15 | integrated-city-34 | 20967529 | 2023-10-18T21:03:00 | 35 |
| goh | Regional Initiative | primary-street-16 | seasonal-city-35 | ChIJd13ymnZu5kcRXM7jx5boJBs | 2024-03-02T04:20:00 | 38 |
| 27d06ecf80b34272bb825aa8d4b0983f | Seasonal Model | adaptive-street-17 | regional-city-36 | gd_acc_763000 | 2025-08-13T11:37:00 | 41 |
| L296 | Integrated Cluster A | distributed-street-18 | legacy-city-37 | 922ad118-9bad-11eb-a8a2-19ed5c03f8d3 | 2022-01-24T18:54:00 | 44 |

This view joins `meeting_venues` with `committee_meetings` on `meeting_venues.venue_id` = `committee_meetings.venue_id`. It produces a flat record of each meeting's venue, combining meeting metadata (scheduled date, duration, type, status) with venue details (name, address, room number). A representative row would show meeting `20967529` (type `regular`, scheduled `2023-10-18T21:03:00`) held at venue "Legacy Review D" (`2839523`), room `ROO-2106`, answering "where and when did a meeting take place?"

**View `v_committee_meeting_legislative_committee`**

```sql
CREATE VIEW v_committee_meeting_legislative_committee AS
SELECT a.meeting_id, a.scheduled_date_time, a.duration_minutes, a.meeting_type, b.id AS committee_id, b.committee_id AS committee_committee_id, b.committee_name AS committee_committee_name
FROM committee_meetings a JOIN legislative_committees b ON a.legislative_committee_id = b.id;
```

| meeting_id | scheduled_date_time | duration_minutes | meeting_type | committee_id | committee_committee_id | committee_committee_name |
|---|---|---|---|---|---|---|
| 20967529 | 2023-10-18T21:03:00 | 35 | regular | 1 | PHR-98 | Composite Cluster |
| ChIJd13ymnZu5kcRXM7jx5boJBs | 2024-03-02T04:20:00 | 38 | special | 2 | L785 | Compact Review A |
| gd_acc_763000 | 2025-08-13T11:37:00 | 41 | emergency | 3 | 7119774 | Legacy Initiative |
| 922ad118-9bad-11eb-a8a2-19ed5c03f8d3 | 2022-01-24T18:54:00 | 44 | public_hearing | 4 | 1186094 | Regional Model |

This view joins `committee_meetings` with `legislative_committees` on `committee_meetings.legislative_committee_id` = `legislative_committees.id`. It produces a flat record of each meeting's parent committee, combining meeting metadata with committee identity. A representative row would show meeting `20967529` (type `regular`, status `scheduled`) belonging to committee "Composite Cluster" (id 1, jurisdiction "Adaptive Corridor"), answering "which committee held a meeting?"

**View `v_committee_meeting_meeting_venue`**

```sql
CREATE VIEW v_committee_meeting_meeting_venue AS
SELECT a.meeting_id, a.scheduled_date_time, a.duration_minutes, a.meeting_type, b.venue_id AS venue_venue_id, b.venue_name AS venue_venue_name, b.street_address AS venue_street_address
FROM committee_meetings a JOIN meeting_venues b ON a.venue_id = b.venue_id;
```

| meeting_id | scheduled_date_time | duration_minutes | meeting_type | venue_venue_id | venue_venue_name | venue_street_address |
|---|---|---|---|---|---|---|
| 20967529 | 2023-10-18T21:03:00 | 35 | regular | 2839523 | Legacy Review D | composite-street-15 |
| ChIJd13ymnZu5kcRXM7jx5boJBs | 2024-03-02T04:20:00 | 38 | special | goh | Regional Initiative | primary-street-16 |
| gd_acc_763000 | 2025-08-13T11:37:00 | 41 | emergency | 27d06ecf80b34272bb825aa8d4b0983f | Seasonal Model | adaptive-street-17 |
| 922ad118-9bad-11eb-a8a2-19ed5c03f8d3 | 2022-01-24T18:54:00 | 44 | public_hearing | L296 | Integrated Cluster A | distributed-street-18 |

This view joins `committee_meetings` with `meeting_venues` on `committee_meetings.venue_id` = `meeting_venues.venue_id`. It produces a flat record of each meeting's venue, combining meeting metadata with venue address details. A representative row would show meeting `ChIJd13ymnZu5kcRXM7jx5boJBs` (type `special`, status `ongoing`) held at venue "Regional Initiative" (`goh`), room `ROO-2113`, answering "where is a meeting held?"

**View `v_committee_meeting_legislator_detail`**

```sql
CREATE VIEW v_committee_meeting_legislator_detail AS
SELECT a.meeting_id, a.scheduled_date_time, a.duration_minutes, b.id AS legislator_id, b.legislator_id AS legislator_legislator_id, b.full_name AS legislator_full_name
FROM committee_meetings a
  JOIN meetings_legislators j ON j.meeting_id = a.meeting_id
  JOIN legislators b ON b.id = j.legislator_id;
```

| meeting_id | scheduled_date_time | duration_minutes | legislator_id | legislator_legislator_id | legislator_full_name |
|---|---|---|---|---|---|
| 20967529 | 2023-10-18T21:03:00 | 35 | 1 | ChIJyQkrS_pt5kcRgcBUZri0Wao | Theodore Mcgrath |
| 20967529 | 2023-10-18T21:03:00 | 35 | 2 | 1996927 | Account Name |
| ChIJd13ymnZu5kcRXM7jx5boJBs | 2024-03-02T04:20:00 | 38 | 2 | 1996927 | Account Name |
| ChIJd13ymnZu5kcRXM7jx5boJBs | 2024-03-02T04:20:00 | 38 | 3 | 20963968 | Saipan International Airport |
| gd_acc_763000 | 2025-08-13T11:37:00 | 41 | 3 | 20963968 | Saipan International Airport |
| gd_acc_763000 | 2025-08-13T11:37:00 | 41 | 4 | 4843 | Norma Fisher |
| 922ad118-9bad-11eb-a8a2-19ed5c03f8d3 | 2022-01-24T18:54:00 | 44 | 4 | 4843 | Norma Fisher |
| 922ad118-9bad-11eb-a8a2-19ed5c03f8d3 | 2022-01-24T18:54:00 | 44 | 1 | ChIJyQkrS_pt5kcRgcBUZri0Wao | Theodore Mcgrath |

This view joins `committee_meetings` with `meetings_legislators` and `legislators` to produce a flat record of each legislator's attendance at a meeting. The join path is: `committee_meetings.meeting_id` → `meetings_legislators.meeting_id` → `meetings_legislators.legislator_id` → `legislators.id`. The result combines meeting metadata (scheduled date, type, status) with legislator details (name, role, contact). A representative row would show meeting `20967529` (type `regular`) attended by legislator "Theodore Mcgrath" (id 1, role `member`), answering "which legislators attended a meeting?"

The schema as a whole demonstrates a clean separation between entity storage and analytical access. The five base tables store committees, legislators, policy domains, venues, and meetings in normalised form, with three junction tables (`committees_legislators`, `committees_domains`, `meetings_legislators`) resolving the many-to-many relationships that arise when entities participate in multiple associations. Foreign keys enforce referential integrity: `legislators.legislative_committee_id` points to `legislative_committees.id`, `committee_meetings.legislative_committee_id` and `committee_meetings.venue_id` point to their respective parents, and `policy_domains.legislative_committee_id` and `policy_domains.overlaps_with_domain_code` anchor domains to committees and to each other. The ten views then reassemble these normalised facts along specific join paths, each view answering a single analytical question by projecting a flat, denormalised record. This architecture ensures that the underlying data remains consistent and updateable at the base-table level, while the views provide efficient, read-optimised access patterns for reporting and analysis. The result is a schema that faithfully models the legislative governance domain while remaining practical for query and inspection.