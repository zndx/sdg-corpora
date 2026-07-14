The conference ecosystem under study comprises a tightly coupled set of entities that together describe how organizations sponsor events, how events host award ceremonies and networking sessions, and how marketplaces and silent auctions populate the event experience. At the heart of the model sits `major_events`, a central hub whose foreign-key columns reach out to every other base table. The seven base tables—`sponsorship_packages`, `major_events`, `award_recipients`, `sponsoring_organizations`, `networking_sessions`, `silent_auctions`, and `conference_marketplaces`—form a star-like topology in which `major_events` occupies the centre, while `sponsorship_packages` and `sponsoring_organizations` also maintain cross-references to each other and to `conference_marketplaces`. The materialised views then reassemble these normalised fragments into flat, question-oriented projections.

## Entity types and their columns

The `sponsorship_packages` table captures the commercial offerings that organisations purchase to gain visibility at events. Each row carries a surrogate primary key `id`, a business-facing `package_id` (such as `9424918` or the string `account_pymes_1044`), a human-readable `package_name` like *Legacy Standard D* or *Integrated Programme A*, and a `tier_level` drawn from the ordered set {Platinum, Gold, Silver, Bronze}. The `price` column stores decimal values ranging from `12.87` to `35.45`, while `benefits_description` holds free-text summaries such as *Extended Model* or *Distributed Initiative*. Temporal validity is expressed through `valid_from` and `valid_until` date columns; notably, the sample data contains rows where `valid_from` lies after `valid_until` (for instance, row `1000` has `valid_from = 2025-12-17` and `valid_until = 2023-06-09`), a pattern that signals either data-entry artefacts or a business rule that permits retroactive package definitions. Two foreign-key columns anchor each package to its event and its sponsor: `major_event_id` references `major_events.id`, and `sponsoring_organization_org_id` references `sponsoring_organizations.org_id`.

**Table `sponsorship_packages`**

| id | package_id | package_name | tier_level | price | benefits_description | valid_from | valid_until | major_event_id | sponsoring_organization_org_id |
|---|---|---|---|---|---|---|---|---|---|
| 1000 | 9424918 | Legacy Standard D | Platinum | 12.87 | Extended Model | 2025-12-17 | 2023-06-09 | 100 | 790471 |
| 1001 | account_pymes_1044 | Regional Framework | Gold | 35.45 | Pilot Cluster A | 2022-05-01 | 2024-11-20 | 101 | 1717 |
| 1002 | 5844275 | Seasonal Protocol | Silver | 29.24 | Baseline Review | 2023-10-12 | 2025-04-04 | 102 | 69437 |
| 1003 | 2106710 | Integrated Programme A | Bronze | 29.99 | Distributed Initiative | 2024-03-23 | 2022-09-15 | 103 | m16 |

The `major_events` table is the structural nucleus of the schema. Its surrogate key `id` (values `100` through `103`) is referenced by nearly every other table. The natural identifier `event_id` carries heterogeneous formats—a UUID-like string (`ab8e1d18-8fcd-11eb-924d-9cd76263cbd0`), a numeric string (`168535`), and a plain integer (`1186089`). The `event_name` column holds labels such as *Seasonal Standard* and *Pilot Programme*, while `event_date` stores ISO-8601 timestamps like `2025-04-15T15:21:00`. Venue information is split across `venue_name` (e.g. *Legacy Review D*) and `venue_address` (e.g. *pilot-venue-20*). The `event_type` column is an enumeration with values *AwardCelebration* and *BusinessConference*; `annual_edition` stores integer counts (`41`, `49`, `57`, `65`); and `theme` carries strings such as *baseline-theme-79*. Three foreign-key columns—`award_recipient_id`, `networking_session_id`, and `silent_auction_id`—point respectively to `award_recipients.id`, `networking_sessions.id`, and `silent_auctions.silent_auction_id`, thereby embedding each event's sub-components directly into the event row.

**Table `major_events`**

| id | event_id | event_name | event_date | venue_name | venue_address | event_type | annual_edition | theme | award_recipient_id | networking_session_id | silent_auction_id |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 100 | 2002007020060 | Seasonal Standard | 2025-04-15T15:21:00 | Legacy Review D | pilot-venue-20 | AwardCelebration | 41 | baseline-theme-79 | 1 | 1000 | 100 |
| 101 | 168535 | Integrated Framework | 2022-09-26T22:38:00 | Regional Initiative | extended-venue-21 | BusinessConference | 49 | pilot-theme-80 | 2 | 1001 | 101 |
| 102 | ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 | Extended Protocol D | 2023-02-10T05:55:00 | Seasonal Model | integrated-venue-22 | AwardCelebration | 57 | extended-theme-81 | 3 | 1002 | 102 |
| 103 | 1186089 | Pilot Programme | 2024-07-21T12:12:00 | Integrated Cluster A | seasonal-venue-23 | BusinessConference | 65 | integrated-theme-82 | 4 | 1003 | 103 |

Award recipients are recorded in `award_recipients`, where the surrogate `id` (1–4) is the primary key. The natural `recipient_id` mixes formats: a hyphenated code (`b_VB-EC-15`), a plain integer (`1889791`), and a long hex string (`5789a9197ed7473eb37814ca09efb2c8`). The `recipient_name` column holds values such as *Legacy Cluster D* and *Regional Review*. The `award_category` is an enumeration with values *W_Award* and *Up_and_Coming_Businesswoman*. Numeric attributes `years_in_field` (24–42) and `nomination_year` (26–38) describe the honoree's career length and the nomination cycle. Boolean flags `is_finalist` and `is_winner` (both `true` for recipients `2` and `4`, both `false` for `1` and `3`) capture selection status. A foreign key `major_event_id` links each recipient to the event at which the award is presented, and `created_at` / `updated_at` timestamps record the audit trail.

**Table `award_recipients`**

| id | recipient_id | recipient_name | award_category | years_in_field | nomination_year | is_finalist | is_winner | major_event_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | b_VB-EC-15 | Legacy Cluster D | W_Award | 24 | 26 | false | false | 100 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | 1889791 | Regional Review | Up_and_Coming_Businesswoman | 30 | 30 | true | true | 101 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | 4180946 | Seasonal Initiative | W_Award | 36 | 34 | false | false | 102 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | 5789a9197ed7473eb37814ca09efb2c8 | Integrated Model A | Up_and_Coming_Businesswoman | 42 | 38 | true | true | 103 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The `sponsoring_organizations` table stores the corporate entities. Its primary key is `org_id`, which mixes integers (`790471`, `1717`, `69437`) and a short string (`m16`). The `org_name` column holds values such as *Extended Review* and *Distributed Cluster*. The `business_type` enumeration includes *Women-Owned*, *Local_Employer*, *Service_Provider*, and *Other*. Contact details are captured in `contact_email` and `contact_phone`; in the sample data these columns contain personal names (*Christopher Wilson*, *Joe Tsai*) rather than email addresses or phone numbers, suggesting either placeholder data or a schema design where the same column serves dual purposes. The `membership_status` column distinguishes *Member* from *Non-Member*. Two foreign keys anchor the organisation to its purchased package (`sponsorship_package_id` → `sponsorship_packages.id`) and to its marketplace (`conference_marketplace_id` → `conference_marketplaces.conference_marketplace_id`).

**Table `sponsoring_organizations`**

| org_id | org_name | business_type | contact_email | contact_phone | membership_status | sponsorship_package_id | conference_marketplace_id |
|---|---|---|---|---|---|---|---|
| 790471 | Extended Review | Women-Owned | Christopher Wilson | Joe Tsai | Member | 1000 | 1 |
| 1717 | Pilot Initiative A | Local_Employer | Charles Larsen | Stephanie Collins | Non-Member | 1001 | 2 |
| 69437 | Baseline Model | Service_Provider | Mary Alvarez | Tasha Rodriguez | Member | 1002 | 3 |
| m16 | Distributed Cluster | Other | April Snyder | Walter Pratt | Non-Member | 1003 | 4 |

Networking sessions are modelled in `networking_sessions`. The surrogate `id` (1000–1003) is the primary key. The natural `session_id` carries UUIDs and integers. The `session_name` mirrors event naming conventions (*Seasonal Standard*, *Integrated Framework*). Temporal bounds are stored in `start_time` and `end_time` as ISO-8601 timestamps; the sample data exhibits swapped dates (row `1000` has `start_time = 2024-03-27T14:42:00` but `end_time = 2023-02-26T13:27:00`), again suggesting data-entry noise. The `location` column holds strings like *extended-location-99*. The `is_mandatory` boolean distinguishes required from optional sessions. Foreign keys `major_event_id` and `sponsoring_organization_org_id` link each session to its parent event and to the sponsoring organisation. Audit timestamps `created_at` and `updated_at` complete the row.

**Table `networking_sessions`**

| id | session_id | session_name | start_time | end_time | location | is_mandatory | major_event_id | sponsoring_organization_org_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|
| 1000 | 1186087 | Seasonal Standard | 2024-03-27T14:42:00 | 2023-02-26T13:27:00 | extended-location-99 | true | 100 | 790471 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 1001 | 2087748 | Integrated Framework | 2025-08-11T21:59:00 | 2024-07-10T20:44:00 | integrated-location-100 | false | 101 | 1717 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 1002 | 4716414 | Extended Protocol D | 2022-01-22T04:16:00 | 2025-12-21T03:01:00 | seasonal-location-101 | true | 102 | 69437 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 1003 | 005588c4-9bac-11eb-a8a2-19ed5c03f8d3 | Pilot Programme | 2023-06-06T11:33:00 | 2022-05-05T10:18:00 | regional-location-102 | false | 103 | m16 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Silent auctions are captured in `silent_auctions`. The primary key is `silent_auction_id` (100–103), with a natural `auction_id` that mixes integers, long numeric strings, and a Google Place ID (`ChIJm7V_gxFu5kcRAbqaOJHQUy0`). The `auction_date` stores ISO-8601 timestamps. Financial and inventory metrics are recorded in `total_proceeds` (decimal values from `17.95` to `29.80`) and `number_of_items` (integers 32–53). The `status` column enumerates *Upcoming*, *Active*, and *Completed*. A single foreign key `major_event_id` ties each auction to its host event.

**Table `silent_auctions`**

| silent_auction_id | auction_id | auction_date | total_proceeds | number_of_items | status | major_event_id |
|---|---|---|---|---|---|---|
| 100 | 611510 | 2023-06-18T05:27:00 | 17.95 | 32 | Upcoming | 100 |
| 101 | 19744285 | 2024-11-02T12:44:00 | 21.90 | 39 | Active | 101 |
| 102 | ChIJm7V_gxFu5kcRAbqaOJHQUy0 | 2025-04-13T19:01:00 | 25.85 | 46 | Completed | 102 |
| 103 | 103173 | 2022-09-24T02:18:00 | 29.80 | 53 | Upcoming | 103 |

Conference marketplaces, stored in `conference_marketplaces`, represent vendor or exhibitor spaces within events. The primary key is `conference_marketplace_id` (values `1` through `4` in the sample). Each marketplace is linked to a `major_event_id` and a `sponsoring_organization_org_id`, mirroring the dual-foreign-key pattern seen in `sponsorship_packages` and `networking_sessions`. The remaining columns—`marketplace_id`, `marketplace_name`, `marketplace_type`, `description`, `location`, and `capacity`—describe the exhibitor space in business terms.

**Table `conference_marketplaces`**

| id | marketplace_id | booth_count | setup_date | dismantle_date | status | major_event_id | sponsoring_organization_org_id |
|---|---|---|---|---|---|---|---|
| 1 | 2bc3ed34-8fcc-11eb-924d-9cd76263cbd0 | 38 | 2023-02-04 | 2023-06-02 | Planned | 100 | 790471 |
| 2 | 8350027 | 12 | 2024-07-15 | 2024-11-13 | Active | 101 | 1717 |
| 3 | 0000000000000 | 5 | 2025-12-26 | 2025-04-24 | Closed | 102 | 69437 |
| 4 | lu_tax_code_template_b_VB-EC-3 | 1 | 2022-05-10 | 2022-09-08 | Planned | 103 | m16 |

## Foreign-key topology and cardinality

The foreign-key graph forms a star centred on `major_events`. Every base table except `sponsoring_organizations` holds at least one column that references `major_events.id`. The `sponsorship_packages` table reaches outward with two foreign keys: `major_event_id` and `sponsoring_organization_org_id`. The `networking_sessions` table similarly carries both `major_event_id` and `sponsoring_organization_org_id`. The `conference_marketplaces` table also references both `major_events.id` and `sponsoring_organizations.org_id`. This repeated pattern means that a single sponsoring organisation can appear in multiple contexts—sponsorship packages, networking sessions, and marketplaces—all tied to the same or different events.

The `sponsoring_organizations` table inverts the direction: its `sponsorship_package_id` column points back to `sponsorship_packages.id`, creating a bidirectional link between organisations and packages. Its `conference_marketplace_id` column points forward to `conference_marketplaces.conference_marketplace_id`. The `award_recipients` table holds a single foreign key, `major_event_id`, establishing a one-to-one or one-to-many relationship between events and their award honorees.

Cardinality is bounded by the presence of these foreign keys. Each `major_event` row can reference at most one `award_recipient`, one `networking_session`, and one `silent_auction` through its dedicated columns, enforcing a one-to-one embedding for those sub-components. Conversely, multiple `sponsorship_packages`, `networking_sessions`, and `conference_marketplaces` rows can point to the same `major_event_id`, allowing many-to-one aggregation. The `sponsoring_organizations` table's `sponsorship_package_id` column similarly allows many organisations to reference a single package, while each organisation references at most one package.

## Materialised views as join reconstructions

The materialised views reassemble the normalised tables into flat projections that answer specific domain questions. Each view is a simple `JOIN` between two base tables, using the foreign-key columns identified above.

The view `sponsorship_package_major_event_view` joins `sponsorship_packages` to `major_events` on `sponsorship_packages.major_event_id = major_events.id`. It answers the question: *What event is each sponsorship package associated with?* Reading row `1000` as evidence, the view would present the package *Legacy Standard D* (tier *Platinum*, price `12.87`) alongside the event *Seasonal Standard* held at *Legacy Review D* on `2025-04-15T15:21:00`. Row `1003` would pair *Integrated Programme A* (tier *Bronze*, price `29.99`) with the event *Pilot Programme* at *Integrated Cluster A* on `2024-07-21T12:12:00`.

**View `sponsorship_package_major_event_view`**

```sql
CREATE VIEW sponsorship_package_major_event_view AS
SELECT a.id, a.package_id, a.package_name, a.tier_level, b.id AS event_id, b.event_id AS event_event_id, b.event_name AS event_event_name
FROM sponsorship_packages a JOIN major_events b ON a.major_event_id = b.id;
```

| id | package_id | package_name | tier_level | event_id | event_event_id | event_event_name |
|---|---|---|---|---|---|---|
| 1000 | 9424918 | Legacy Standard D | Platinum | 100 | 2002007020060 | Seasonal Standard |
| 1001 | account_pymes_1044 | Regional Framework | Gold | 101 | 168535 | Integrated Framework |
| 1002 | 5844275 | Seasonal Protocol | Silver | 102 | ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 | Extended Protocol D |
| 1003 | 2106710 | Integrated Programme A | Bronze | 103 | 1186089 | Pilot Programme |

The view `sponsorship_package_sponsoring_organization_view` joins `sponsorship_packages` to `sponsoring_organizations` on `sponsorship_packages.sponsoring_organization_org_id = sponsoring_organizations.org_id`. It answers: *Which organisation sponsors each package?* Row `1000` would show the package *Legacy Standard D* alongside the organisation *Extended Review* (business type *Women-Owned*, membership status *Member*). Row `1003` would pair *Integrated Programme A* with *Distributed Cluster* (business type *Other*, membership status *Non-Member*).

**View `sponsorship_package_sponsoring_organization_view`**

```sql
CREATE VIEW sponsorship_package_sponsoring_organization_view AS
SELECT a.id, a.package_id, a.package_name, a.tier_level, b.org_id AS organization_org_id, b.org_name AS organization_org_name, b.business_type AS organization_business_type
FROM sponsorship_packages a JOIN sponsoring_organizations b ON a.sponsoring_organization_org_id = b.org_id;
```

| id | package_id | package_name | tier_level | organization_org_id | organization_org_name | organization_business_type |
|---|---|---|---|---|---|---|
| 1000 | 9424918 | Legacy Standard D | Platinum | 790471 | Extended Review | Women-Owned |
| 1001 | account_pymes_1044 | Regional Framework | Gold | 1717 | Pilot Initiative A | Local_Employer |
| 1002 | 5844275 | Seasonal Protocol | Silver | 69437 | Baseline Model | Service_Provider |
| 1003 | 2106710 | Integrated Programme A | Bronze | m16 | Distributed Cluster | Other |

The view `major_event_award_recipient_view` joins `major_events` to `award_recipients` on `major_events.award_recipient_id = award_recipients.id`. It answers: *Which award recipient is associated with each event?* Row `100` would present the event *Seasonal Standard* alongside recipient *Legacy Cluster D* (category *W_Award*, 24 years in field, not a finalist or winner). Row `101` would pair *Integrated Framework* with *Regional Review* (category *Up_and_Coming_Businesswoman*, 30 years in field, both finalist and winner).

**View `major_event_award_recipient_view`**

```sql
CREATE VIEW major_event_award_recipient_view AS
SELECT a.id, a.event_id, a.event_name, a.event_date, b.id AS recipient_id, b.recipient_id AS recipient_recipient_id, b.recipient_name AS recipient_recipient_name
FROM major_events a JOIN award_recipients b ON a.award_recipient_id = b.id;
```

| id | event_id | event_name | event_date | recipient_id | recipient_recipient_id | recipient_recipient_name |
|---|---|---|---|---|---|---|
| 100 | 2002007020060 | Seasonal Standard | 2025-04-15T15:21:00 | 1 | b_VB-EC-15 | Legacy Cluster D |
| 101 | 168535 | Integrated Framework | 2022-09-26T22:38:00 | 2 | 1889791 | Regional Review |
| 102 | ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 | Extended Protocol D | 2023-02-10T05:55:00 | 3 | 4180946 | Seasonal Initiative |
| 103 | 1186089 | Pilot Programme | 2024-07-21T12:12:00 | 4 | 5789a9197ed7473eb37814ca09efb2c8 | Integrated Model A |

The view `major_event_networking_session_view` joins `major_events` to `networking_sessions` on `major_events.networking_session_id = networking_sessions.id`. It answers: *Which networking session belongs to each event?* Row `100` would show *Seasonal Standard* alongside session *Seasonal Standard* at *extended-location-99*, marked mandatory, sponsored by organisation `790471`. Row `102` would pair *Extended Protocol D* with session *Extended Protocol D* at *seasonal-location-101*, also mandatory, sponsored by organisation `69437`.

**View `major_event_networking_session_view`**

```sql
CREATE VIEW major_event_networking_session_view AS
SELECT a.id, a.event_id, a.event_name, a.event_date, b.id AS session_id, b.session_id AS session_session_id, b.session_name AS session_session_name
FROM major_events a JOIN networking_sessions b ON a.networking_session_id = b.id;
```

| id | event_id | event_name | event_date | session_id | session_session_id | session_session_name |
|---|---|---|---|---|---|---|
| 100 | 2002007020060 | Seasonal Standard | 2025-04-15T15:21:00 | 1000 | 1186087 | Seasonal Standard |
| 101 | 168535 | Integrated Framework | 2022-09-26T22:38:00 | 1001 | 2087748 | Integrated Framework |
| 102 | ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 | Extended Protocol D | 2023-02-10T05:55:00 | 1002 | 4716414 | Extended Protocol D |
| 103 | 1186089 | Pilot Programme | 2024-07-21T12:12:00 | 1003 | 005588c4-9bac-11eb-a8a2-19ed5c03f8d3 | Pilot Programme |

The view `major_event_silent_auction_view` joins `major_events` to `silent_auctions` on `major_events.silent_auction_id = silent_auctions.silent_auction_id`. It answers: *Which silent auction is hosted by each event?* Row `100` would present *Seasonal Standard* alongside auction `611510` with `17.95` in proceeds from `32` items, status *Upcoming*. Row `102` would pair *Extended Protocol D* with auction `ChIJm7V_gxFu5kcRAbqaOJHQUy0` generating `25.85` from `46` items, status *Completed*.

**View `major_event_silent_auction_view`**

```sql
CREATE VIEW major_event_silent_auction_view AS
SELECT a.id, a.event_id, a.event_name, a.event_date, b.silent_auction_id AS auction_silent_auction_id, b.auction_id AS auction_auction_id, b.auction_date AS auction_auction_date
FROM major_events a JOIN silent_auctions b ON a.silent_auction_id = b.silent_auction_id;
```

| id | event_id | event_name | event_date | auction_silent_auction_id | auction_auction_id | auction_auction_date |
|---|---|---|---|---|---|---|
| 100 | 2002007020060 | Seasonal Standard | 2025-04-15T15:21:00 | 100 | 611510 | 2023-06-18T05:27:00 |
| 101 | 168535 | Integrated Framework | 2022-09-26T22:38:00 | 101 | 19744285 | 2024-11-02T12:44:00 |
| 102 | ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 | Extended Protocol D | 2023-02-10T05:55:00 | 102 | ChIJm7V_gxFu5kcRAbqaOJHQUy0 | 2025-04-13T19:01:00 |
| 103 | 1186089 | Pilot Programme | 2024-07-21T12:12:00 | 103 | 103173 | 2022-09-24T02:18:00 |

The view `award_recipient_major_event_view` performs the inverse join of `major_event_award_recipient_view`, linking `award_recipients` to `major_events` on `award_recipients.major_event_id = major_events.id`. It answers: *At which event was each award recipient honoured?* Recipient `b_VB-EC-15` (*Legacy Cluster D*, category *W_Award*) would appear alongside event *Seasonal Standard* (type *AwardCelebration*, edition `41`). Recipient `1889791` (*Regional Review*, category *Up_and_Coming_Businesswoman*) would appear alongside event *Integrated Framework* (type *BusinessConference*, edition `49`).

**View `award_recipient_major_event_view`**

```sql
CREATE VIEW award_recipient_major_event_view AS
SELECT a.id, a.recipient_id, a.recipient_name, a.award_category, b.id AS event_id, b.event_id AS event_event_id, b.event_name AS event_event_name
FROM award_recipients a JOIN major_events b ON a.major_event_id = b.id;
```

| id | recipient_id | recipient_name | award_category | event_id | event_event_id | event_event_name |
|---|---|---|---|---|---|---|
| 1 | b_VB-EC-15 | Legacy Cluster D | W_Award | 100 | 2002007020060 | Seasonal Standard |
| 2 | 1889791 | Regional Review | Up_and_Coming_Businesswoman | 101 | 168535 | Integrated Framework |
| 3 | 4180946 | Seasonal Initiative | W_Award | 102 | ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 | Extended Protocol D |
| 4 | 5789a9197ed7473eb37814ca09efb2c8 | Integrated Model A | Up_and_Coming_Businesswoman | 103 | 1186089 | Pilot Programme |

The view `sponsoring_organization_sponsorship_package_view` joins `sponsoring_organizations` to `sponsorship_packages` on `sponsoring_organizations.sponsorship_package_id = sponsorship_packages.id`. It answers: *Which package does each sponsoring organisation hold?* Organisation *Extended Review* (`org_id = 790471`) would appear alongside package *Legacy Standard D* (tier *Platinum*, price `12.87`). Organisation *Pilot Initiative A* (`org_id = 1717`) would appear alongside *Regional Framework* (tier *Gold*, price `35.45`).

**View `sponsoring_organization_sponsorship_package_view`**

```sql
CREATE VIEW sponsoring_organization_sponsorship_package_view AS
SELECT a.org_id, a.org_name, a.business_type, a.contact_email, b.id AS package_id, b.package_id AS package_package_id, b.package_name AS package_package_name
FROM sponsoring_organizations a JOIN sponsorship_packages b ON a.sponsorship_package_id = b.id;
```

| org_id | org_name | business_type | contact_email | package_id | package_package_id | package_package_name |
|---|---|---|---|---|---|---|
| 790471 | Extended Review | Women-Owned | Christopher Wilson | 1000 | 9424918 | Legacy Standard D |
| 1717 | Pilot Initiative A | Local_Employer | Charles Larsen | 1001 | account_pymes_1044 | Regional Framework |
| 69437 | Baseline Model | Service_Provider | Mary Alvarez | 1002 | 5844275 | Seasonal Protocol |
| m16 | Distributed Cluster | Other | April Snyder | 1003 | 2106710 | Integrated Programme A |

The view `sponsoring_organization_conference_marketplace_view` joins `sponsoring_organizations` to `conference_marketplaces` on `sponsoring_organizations.conference_marketplace_id = conference_marketplaces.conference_marketplace_id`. It answers: *Which marketplace is each organisation associated with?* Organisation *Extended Review* (`org_id = 790471`) would appear alongside marketplace `1`. Organisation *Baseline Model* (`org_id = 69437`) would appear alongside marketplace `3`.

**View `sponsoring_organization_conference_marketplace_view`**

```sql
CREATE VIEW sponsoring_organization_conference_marketplace_view AS
SELECT a.org_id, a.org_name, a.business_type, a.contact_email, b.id AS marketplace_id, b.marketplace_id AS marketplace_marketplace_id, b.booth_count AS marketplace_booth_count
FROM sponsoring_organizations a JOIN conference_marketplaces b ON a.conference_marketplace_id = b.id;
```

| org_id | org_name | business_type | contact_email | marketplace_id | marketplace_marketplace_id | marketplace_booth_count |
|---|---|---|---|---|---|---|
| 790471 | Extended Review | Women-Owned | Christopher Wilson | 1 | 2bc3ed34-8fcc-11eb-924d-9cd76263cbd0 | 38 |
| 1717 | Pilot Initiative A | Local_Employer | Charles Larsen | 2 | 8350027 | 12 |
| 69437 | Baseline Model | Service_Provider | Mary Alvarez | 3 | 0000000000000 | 5 |
| m16 | Distributed Cluster | Other | April Snyder | 4 | lu_tax_code_template_b_VB-EC-3 | 1 |

The view `networking_session_major_event_view` joins `networking_sessions` to `major_events` on `networking_sessions.major_event_id = major_events.id`. It answers: *Which event hosts each networking session?* Session `1186087` (*Seasonal Standard*, mandatory, at *extended-location-99*) would appear alongside event *Seasonal Standard* (type *AwardCelebration*, theme *baseline-theme-79*). Session `2087748` (*Integrated Framework*, not mandatory, at *integrated-location-100*) would appear alongside event *Integrated Framework* (type *BusinessConference*, theme *pilot-theme-80*).

**View `networking_session_major_event_view`**

```sql
CREATE VIEW networking_session_major_event_view AS
SELECT a.id, a.session_id, a.session_name, a.start_time, b.id AS event_id, b.event_id AS event_event_id, b.event_name AS event_event_name
FROM networking_sessions a JOIN major_events b ON a.major_event_id = b.id;
```

| id | session_id | session_name | start_time | event_id | event_event_id | event_event_name |
|---|---|---|---|---|---|---|
| 1000 | 1186087 | Seasonal Standard | 2024-03-27T14:42:00 | 100 | 2002007020060 | Seasonal Standard |
| 1001 | 2087748 | Integrated Framework | 2025-08-11T21:59:00 | 101 | 168535 | Integrated Framework |
| 1002 | 4716414 | Extended Protocol D | 2022-01-22T04:16:00 | 102 | ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 | Extended Protocol D |
| 1003 | 005588c4-9bac-11eb-a8a2-19ed5c03f8d3 | Pilot Programme | 2023-06-06T11:33:00 | 103 | 1186089 | Pilot Programme |

The view `networking_session_sponsoring_organization_view` joins `networking_sessions` to `sponsoring_organizations` on `networking_sessions.sponsoring_organization_org_id = sponsoring_organizations.org_id`. It answers: *Which organisation sponsors each networking session?* Session `1186087` would appear alongside organisation *Extended Review* (business type *Women-Owned*, membership status *Member*). Session `2087748` would appear alongside *Pilot Initiative A* (business type *Local_Employer*, membership status *Non-Member*).

**View `networking_session_sponsoring_organization_view`**

```sql
CREATE VIEW networking_session_sponsoring_organization_view AS
SELECT a.id, a.session_id, a.session_name, a.start_time, b.org_id AS organization_org_id, b.org_name AS organization_org_name, b.business_type AS organization_business_type
FROM networking_sessions a JOIN sponsoring_organizations b ON a.sponsoring_organization_org_id = b.org_id;
```

| id | session_id | session_name | start_time | organization_org_id | organization_org_name | organization_business_type |
|---|---|---|---|---|---|---|
| 1000 | 1186087 | Seasonal Standard | 2024-03-27T14:42:00 | 790471 | Extended Review | Women-Owned |
| 1001 | 2087748 | Integrated Framework | 2025-08-11T21:59:00 | 1717 | Pilot Initiative A | Local_Employer |
| 1002 | 4716414 | Extended Protocol D | 2022-01-22T04:16:00 | 69437 | Baseline Model | Service_Provider |
| 1003 | 005588c4-9bac-11eb-a8a2-19ed5c03f8d3 | Pilot Programme | 2023-06-06T11:33:00 | m16 | Distributed Cluster | Other |

The view `silent_auction_major_event_view` joins `silent_auctions` to `major_events` on `silent_auctions.major_event_id = major_events.id`. It answers: *Which event hosts each silent auction?* Auction `611510` (proceeds `17.95`, `32` items, status *Upcoming*) would appear alongside event *Seasonal Standard* (venue *Legacy Review D*, edition `41`). Auction `19744285` (proceeds `21.90`, `39` items, status *Active*) would appear alongside event *Integrated Framework* (venue *Regional Initiative*, edition `49`).

**View `silent_auction_major_event_view`**

```sql
CREATE VIEW silent_auction_major_event_view AS
SELECT a.silent_auction_id, a.auction_id, a.auction_date, a.total_proceeds, b.id AS event_id, b.event_id AS event_event_id, b.event_name AS event_event_name
FROM silent_auctions a JOIN major_events b ON a.major_event_id = b.id;
```

| silent_auction_id | auction_id | auction_date | total_proceeds | event_id | event_event_id | event_event_name |
|---|---|---|---|---|---|---|
| 100 | 611510 | 2023-06-18T05:27:00 | 17.95 | 100 | 2002007020060 | Seasonal Standard |
| 101 | 19744285 | 2024-11-02T12:44:00 | 21.90 | 101 | 168535 | Integrated Framework |
| 102 | ChIJm7V_gxFu5kcRAbqaOJHQUy0 | 2025-04-13T19:01:00 | 25.85 | 102 | ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 | Extended Protocol D |
| 103 | 103173 | 2022-09-24T02:18:00 | 29.80 | 103 | 1186089 | Pilot Programme |

The view `conference_marketplace_major_event_view` joins `conference_marketplaces` to `major_events` on `conference_marketplaces.major_event_id = major_events.id`. It answers: *Which event hosts each conference marketplace?* Marketplace `1` would appear alongside event *Seasonal Standard* (type *AwardCelebration*, theme *baseline-theme-79*). Marketplace `2` would appear alongside event *Integrated Framework* (type *BusinessConference*, theme *pilot-theme-80*).

**View `conference_marketplace_major_event_view`**

```sql
CREATE VIEW conference_marketplace_major_event_view AS
SELECT a.id, a.marketplace_id, a.booth_count, a.setup_date, b.id AS event_id, b.event_id AS event_event_id, b.event_name AS event_event_name
FROM conference_marketplaces a JOIN major_events b ON a.major_event_id = b.id;
```

| id | marketplace_id | booth_count | setup_date | event_id | event_event_id | event_event_name |
|---|---|---|---|---|---|---|
| 1 | 2bc3ed34-8fcc-11eb-924d-9cd76263cbd0 | 38 | 2023-02-04 | 100 | 2002007020060 | Seasonal Standard |
| 2 | 8350027 | 12 | 2024-07-15 | 101 | 168535 | Integrated Framework |
| 3 | 0000000000000 | 5 | 2025-12-26 | 102 | ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 | Extended Protocol D |
| 4 | lu_tax_code_template_b_VB-EC-3 | 1 | 2022-05-10 | 103 | 1186089 | Pilot Programme |

The view `conference_marketplace_sponsoring_organization_view` joins `conference_marketplaces` to `sponsoring_organizations` on `conference_marketplaces.sponsoring_organization_org_id = sponsoring_organizations.org_id`. It answers: *Which organisation is associated with each conference marketplace?* Marketplace `1` would appear alongside organisation *Extended Review* (business type *Women-Owned*, membership status *Member*). Marketplace `2` would appear alongside *Pilot Initiative A* (business type *Local_Employer*, membership status *Non-Member*).

**View `conference_marketplace_sponsoring_organization_view`**

```sql
CREATE VIEW conference_marketplace_sponsoring_organization_view AS
SELECT a.id, a.marketplace_id, a.booth_count, a.setup_date, b.org_id AS organization_org_id, b.org_name AS organization_org_name, b.business_type AS organization_business_type
FROM conference_marketplaces a JOIN sponsoring_organizations b ON a.sponsoring_organization_org_id = b.org_id;
```

| id | marketplace_id | booth_count | setup_date | organization_org_id | organization_org_name | organization_business_type |
|---|---|---|---|---|---|---|
| 1 | 2bc3ed34-8fcc-11eb-924d-9cd76263cbd0 | 38 | 2023-02-04 | 790471 | Extended Review | Women-Owned |
| 2 | 8350027 | 12 | 2024-07-15 | 1717 | Pilot Initiative A | Local_Employer |
| 3 | 0000000000000 | 5 | 2025-12-26 | 69437 | Baseline Model | Service_Provider |
| 4 | lu_tax_code_template_b_VB-EC-3 | 1 | 2022-05-10 | m16 | Distributed Cluster | Other |

## Synthesis

The schema models a conference domain where events are the central fact, enriched by embedded sub-components (awards, networking sessions, auctions) and surrounded by commercial relationships (sponsorship packages, sponsoring organisations, marketplaces). The normalised base tables enforce referential integrity through foreign keys, while the materialised views flatten these relationships into readable projections. Each view answers a single join-based question, reconstructing a domain fact from two normalised tables. The repeated pattern of `major_event_id` and `sponsoring_organization_org_id` as foreign keys across multiple tables reflects the dual axis of the domain: every activity is both an event activity and a sponsorship activity. The resulting design supports both analytical queries (what packages are associated with which events?) and operational queries (which organisation sponsors which session?), all derived from a consistent set of normalised base tables.