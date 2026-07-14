Conference sponsorship ecosystems operate at the intersection of event programming, organizational partnerships, and public recognition. A single major event brings together multiple moving parts: tiered sponsorship packages with defined pricing and benefits, award ceremonies that honor individuals in the field, networking sessions that facilitate professional connections, silent auctions that generate revenue, and conference marketplaces that provide exhibitor space. Each component is tracked through its own set of records, and the operational relationships between them form the backbone of event planning and execution. This chapter documents the entities, measurements, and cross-references that practitioners use to manage these ecosystems end to end.

## Sponsorship Packages and Tier Structures

Sponsorship packages define the commercial framework through which organizations support events. Each package carries a unique identifier, a human-readable name, and a tier level that signals its premium standing. The tier levels observed in the data—Platinum, Gold, Silver, and Bronze—correspond to progressively lower price points and correspondingly scoped benefits.

**Table `sponsorship_packages`**

| id | package_id | package_name | tier_level | price | benefits_description | valid_from | valid_until | major_event_id | sponsoring_organization_org_id |
|---|---|---|---|---|---|---|---|---|---|
| 1000 | 9424918 | Legacy Standard D | Platinum | 12.87 | Extended Model | 2025-12-17 | 2023-06-09 | 100 | 790471 |
| 1001 | account_pymes_1044 | Regional Framework | Gold | 35.45 | Pilot Cluster A | 2022-05-01 | 2024-11-20 | 101 | 1717 |
| 1002 | 5844275 | Seasonal Protocol | Silver | 29.24 | Baseline Review | 2023-10-12 | 2025-04-04 | 102 | 69437 |
| 1003 | 2106710 | Integrated Programme A | Bronze | 29.99 | Distributed Initiative | 2024-03-23 | 2022-09-15 | 103 | m16 |

The pricing structure reveals a deliberate spread: the Platinum-tier Legacy Standard D is priced at 12.87, while the Gold-tier Regional Framework sits at 35.45, and the Silver and Bronze tiers cluster near 29.24 and 29.99 respectively. Each package includes a benefits description—such as "Extended Model" or "Pilot Cluster A"—that summarizes the value proposition. Validity windows are tracked through `valid_from` and `valid_until` dates, enabling organizers to enforce temporal boundaries on which packages are available for purchase. Every package is also linked to a specific major event via `major_event_id` and to a sponsoring organization through `sponsoring_organization_org_id`, establishing the commercial chain from organization to event.

## Major Events and Their Components

Major events serve as the central anchor of the sponsorship ecosystem. Each event is identified by both a system-level `id` and a human-readable `event_id`, and carries metadata including the event name, date, venue, type, and annual edition number. The `event_type` field distinguishes between formats such as AwardCelebration and BusinessConference, while the `theme` field provides a topical label for the edition.

**Table `major_events`**

| id | event_id | event_name | event_date | venue_name | venue_address | event_type | annual_edition | theme | award_recipient_id | networking_session_id | silent_auction_id |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 100 | 2002007020060 | Seasonal Standard | 2025-04-15T15:21:00 | Legacy Review D | pilot-venue-20 | AwardCelebration | 41 | baseline-theme-79 | 1 | 1000 | 100 |
| 101 | 168535 | Integrated Framework | 2022-09-26T22:38:00 | Regional Initiative | extended-venue-21 | BusinessConference | 49 | pilot-theme-80 | 2 | 1001 | 101 |
| 102 | ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 | Extended Protocol D | 2023-02-10T05:55:00 | Seasonal Model | integrated-venue-22 | AwardCelebration | 57 | extended-theme-81 | 3 | 1002 | 102 |
| 103 | 1186089 | Pilot Programme | 2024-07-21T12:12:00 | Integrated Cluster A | seasonal-venue-23 | BusinessConference | 65 | integrated-theme-82 | 4 | 1003 | 103 |

Consider the event with identifier 100, named "Seasonal Standard," held on 2025-04-15 at the Legacy Review D venue. This is the 41st annual edition of its kind, classified as an AwardCelebration with the theme "baseline-theme-79." It is associated with award recipient 1, networking session 1000, and silent auction 100. The second event, "Integrated Framework" (id 101), is a BusinessConference held on 2022-09-26 at Regional Initiative, marking its 49th annual edition. The venue address field—such as "pilot-venue-20" or "extended-venue-21"—provides a location reference for logistical planning. Each event's foreign keys to award recipients, networking sessions, and silent auctions create a natural grouping of components that belong together under a single event umbrella.

## Award Recipients and Recognition

Award recipients represent the individuals or entities honored at events. Each recipient record includes a unique identifier, a name, the award category, years of experience in the field, and the nomination year. Boolean flags `is_finalist` and `is_winner` indicate the recipient's status in the selection process.

**Table `award_recipients`**

| id | recipient_id | recipient_name | award_category | years_in_field | nomination_year | is_finalist | is_winner | major_event_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | b_VB-EC-15 | Legacy Cluster D | W_Award | 24 | 26 | false | false | 100 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | 1889791 | Regional Review | Up_and_Coming_Businesswoman | 30 | 30 | true | true | 101 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | 4180946 | Seasonal Initiative | W_Award | 36 | 34 | false | false | 102 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | 5789a9197ed7473eb37814ca09efb2c8 | Integrated Model A | Up_and_Coming_Businesswoman | 42 | 38 | true | true | 103 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The recipient identified as "Legacy Cluster D" (recipient_id b_VB-EC-15) received a W_Award and has 24 years in the field. This individual was nominated in year 26 but was neither a finalist nor a winner. In contrast, "Regional Review" (recipient_id 1889791) received an Up_and_Coming_Businesswoman award, has 30 years in the field, and holds both finalist and winner status. The award ceremony is tied to a specific major event through `major_event_id`, ensuring that recognition is contextualized within the event's program. Timestamps `created_at` and `updated_at` track when the record was first entered and last modified, supporting audit trails for nomination and selection processes.

## Sponsoring Organizations

Sponsoring organizations are the entities that provide financial or in-kind support to events and their associated packages. Each organization record contains an `org_id`, a name, a business type classification, and contact information including email and phone. The `membership_status` field distinguishes between Members and Non-Members, which may affect pricing or access privileges.

**Table `sponsoring_organizations`**

| org_id | org_name | business_type | contact_email | contact_phone | membership_status | sponsorship_package_id | conference_marketplace_id |
|---|---|---|---|---|---|---|---|
| 790471 | Extended Review | Women-Owned | Christopher Wilson | Joe Tsai | Member | 1000 | 1 |
| 1717 | Pilot Initiative A | Local_Employer | Charles Larsen | Stephanie Collins | Non-Member | 1001 | 2 |
| 69437 | Baseline Model | Service_Provider | Mary Alvarez | Tasha Rodriguez | Member | 1002 | 3 |
| m16 | Distributed Cluster | Other | April Snyder | Walter Pratt | Non-Member | 1003 | 4 |

Extended Review (org_id 790471) is classified as a Women-Owned business with contact Christopher Wilson and membership status Member. Pilot Initiative A (org_id 1717) is a Local_Employer with contact Charles Larsen and Non-Member status. The business type categories—Women-Owned, Local_Employer, Service_Provider, and Other—reflect a diversity of organizational profiles. Each organization is linked to a sponsorship package via `sponsorship_package_id` and to a conference marketplace via `conference_marketplace_id`, forming the organizational backbone of the sponsorship chain.

## Networking Sessions

Networking sessions are scheduled interactions within events that facilitate professional connections. Each session has a unique identifier, a name, start and end times, a location, and a mandatory flag indicating whether attendance is required.

**Table `networking_sessions`**

| id | session_id | session_name | start_time | end_time | location | is_mandatory | major_event_id | sponsoring_organization_org_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|
| 1000 | 1186087 | Seasonal Standard | 2024-03-27T14:42:00 | 2023-02-26T13:27:00 | extended-location-99 | true | 100 | 790471 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 1001 | 2087748 | Integrated Framework | 2025-08-11T21:59:00 | 2024-07-10T20:44:00 | integrated-location-100 | false | 101 | 1717 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 1002 | 4716414 | Extended Protocol D | 2022-01-22T04:16:00 | 2025-12-21T03:01:00 | seasonal-location-101 | true | 102 | 69437 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 1003 | 005588c4-9bac-11eb-a8a2-19ed5c03f8d3 | Pilot Programme | 2023-06-06T11:33:00 | 2022-05-05T10:18:00 | regional-location-102 | false | 103 | m16 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The session "Seasonal Standard" (id 1000) runs from 2024-03-27T14:42:00 to 2023-02-26T13:27:00 at extended-location-99 and is marked as mandatory. It is associated with major event 100 and sponsoring organization 790471. The session "Integrated Framework" (id 1001) is non-mandatory, scheduled for 2025-08-11T21:59:00 to 2024-07-10T20:44:00 at integrated-location-100, and linked to event 101 and organization 1717. The mandatory flag allows event organizers to distinguish between required and optional networking activities. Timestamps `created_at` and `updated_at` support session lifecycle tracking.

## Silent Auctions

Silent auctions are fundraising activities conducted during events. Each auction record includes an auction date, total proceeds, the number of items offered, and a status indicating the auction's current phase.

**Table `silent_auctions`**

| silent_auction_id | auction_id | auction_date | total_proceeds | number_of_items | status | major_event_id |
|---|---|---|---|---|---|---|
| 100 | 611510 | 2023-06-18T05:27:00 | 17.95 | 32 | Upcoming | 100 |
| 101 | 19744285 | 2024-11-02T12:44:00 | 21.90 | 39 | Active | 101 |
| 102 | ChIJm7V_gxFu5kcRAbqaOJHQUy0 | 2025-04-13T19:01:00 | 25.85 | 46 | Completed | 102 |
| 103 | 103173 | 2022-09-24T02:18:00 | 29.80 | 53 | Upcoming | 103 |

Auction 100, with auction_id 611510, was held on 2023-06-18, generated proceeds of 17.95 from 32 items, and carries the status "Upcoming." Auction 101 (auction_id 19744285) occurred on 2024-11-02, brought in 21.90 from 39 items, and is marked "Active." Auction 102 (auction_id ChIJm7V_gxFu5kcRAbqaOJHQUy0) took place on 2025-04-13, yielded 25.85 from 46 items, and has status "Completed." The status field—Upcoming, Active, or Completed—enables organizers to track the lifecycle of each auction. Each auction is tied to a major event through `major_event_id`, ensuring that proceeds and item counts are attributed to the correct event.

## Conference Marketplaces

Conference marketplaces represent exhibitor spaces or vendor areas within the event ecosystem. While the base table provides the foundational marketplace records, their relationships to sponsoring organizations and major events are captured through the joined views described later in this chapter.

**Table `conference_marketplaces`**

| id | marketplace_id | booth_count | setup_date | dismantle_date | status | major_event_id | sponsoring_organization_org_id |
|---|---|---|---|---|---|---|---|
| 1 | 2bc3ed34-8fcc-11eb-924d-9cd76263cbd0 | 38 | 2023-02-04 | 2023-06-02 | Planned | 100 | 790471 |
| 2 | 8350027 | 12 | 2024-07-15 | 2024-11-13 | Active | 101 | 1717 |
| 3 | 0000000000000 | 5 | 2025-12-26 | 2025-04-24 | Closed | 102 | 69437 |
| 4 | lu_tax_code_template_b_VB-EC-3 | 1 | 2022-05-10 | 2022-09-08 | Planned | 103 | m16 |

The marketplace records are indexed by a numeric `id` and carry identifiers that link them to sponsoring organizations and major events. These linkages are essential for understanding which organizations occupy which marketplaces and which events host them.

## Cross-Referencing Sponsorship and Events

The sponsorship_package_major_event_view joins sponsorship packages with their associated major events, answering the question of which packages are available for which events and at what price points. This view is essential for event planners who need to match package offerings to event schedules.

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

Reading the first row of this view, package 9424918 (Legacy Standard D, Platinum tier, priced at 12.87) is linked to major event 100 (Seasonal Standard, an AwardCelebration held on 2025-04-15). The second row shows package account_pymes_1044 (Regional Framework, Gold tier, priced at 35.45) associated with event 101 (Integrated Framework, a BusinessConference on 2022-09-26). This join confirms that each package is scoped to a single event, and the tier-level and pricing information travels alongside the event metadata to support package selection and reporting.

## Sponsorship and Organization Linkages

The sponsorship_package_sponsoring_organization_view connects sponsorship packages to the sponsoring organizations that offer or purchase them. This relationship clarifies which organization is responsible for which package and enables financial attribution.

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

In the first row, package 9424918 (Legacy Standard D, Platinum) is linked to organization 790471 (Extended Review, a Women-Owned business). The second row associates package account_pymes_1044 (Regional Framework, Gold) with organization 1717 (Pilot Initiative A, a Local_Employer). The view carries through the tier level, price, and benefits description from the package alongside the organization name and business type, providing a complete picture of the commercial arrangement.

## Event-Award Recipient Associations

The major_event_award_recipient_view joins major events with their associated award recipients, answering which individuals are honored at which events and under what categories. This view is critical for award ceremony planning and recognition tracking.

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

The first row shows major event 100 (Seasonal Standard, AwardCelebration) paired with award recipient b_VB-EC-15 (Legacy Cluster D, W_Award category, 24 years in field, not a finalist or winner). The second row links event 101 (Integrated Framework, BusinessConference) with recipient 1889791 (Regional Review, Up_and_Coming_Businesswoman category, 30 years in field, finalist and winner). The view preserves the nomination year, finalist status, and winner status alongside the event's date and venue, enabling organizers to build award segments into the event program.

## Event-Networking Session Pairings

The major_event_networking_session_view associates major events with their scheduled networking sessions. This join answers the question of which sessions belong to which events and whether attendance is mandatory.

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

The first row pairs event 100 (Seasonal Standard, AwardCelebration, 2025-04-15) with networking session 1186087 (Seasonal Standard, mandatory, held at extended-location-99). The second row connects event 101 (Integrated Framework, BusinessConference, 2022-09-26) with session 2087748 (Integrated Framework, non-mandatory, at integrated-location-100). The view includes the session's start and end times alongside the event's venue and theme, allowing planners to construct detailed event schedules that account for mandatory and optional sessions.

## Event-Silent Auction Pairings

The major_event_silent_auction_view links major events with their associated silent auctions, providing a consolidated view of fundraising activities within each event.

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

The first row shows event 100 (Seasonal Standard, AwardCelebration) paired with silent auction 611510, which had 32 items, generated 17.95 in proceeds, and carries the status "Upcoming." The second row links event 101 (Integrated Framework, BusinessConference) with auction 19744285, which had 39 items, generated 21.90 in proceeds, and is marked "Active." The view carries the auction date and status alongside the event's date and type, enabling organizers to track fundraising performance across events.

## Award Recipients and Their Events

The award_recipient_major_event_view presents the relationship from the award recipient's perspective, showing which event each recipient is associated with. This view is useful for recognition tracking and post-event reporting.

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

The first row shows recipient b_VB-EC-15 (Legacy Cluster D, W_Award, 24 years in field) associated with event 100 (Seasonal Standard, AwardCelebration, held at Legacy Review D on 2025-04-15). The second row links recipient 1889791 (Regional Review, Up_and_Coming_Businesswoman, 30 years in field) to event 101 (Integrated Framework, BusinessConference, at Regional Initiative on 2022-09-26). The view includes the recipient's finalist and winner status alongside the event's annual edition number and theme, supporting both recognition and event-level analytics.

## Organization-Sponsorship Package Relationships

The sponsoring_organization_sponsorship_package_view presents the relationship from the organization's perspective, showing which sponsorship package each organization is linked to. This view supports financial reconciliation and partnership management.

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

The first row shows organization 790471 (Extended Review, Women-Owned, Member) linked to package 9424918 (Legacy Standard D, Platinum tier, priced at 12.87). The second row connects organization 1717 (Pilot Initiative A, Local_Employer, Non-Member) to package account_pymes_1044 (Regional Framework, Gold tier, priced at 35.45). The view carries the package's benefits description and validity dates alongside the organization's contact information and membership status, providing a complete picture of the organizational commitment.

## Organization-Marketplace Relationships

The sponsoring_organization_conference_marketplace_view links sponsoring organizations to the conference marketplaces they occupy. This relationship is essential for understanding exhibitor placement and marketplace utilization.

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

The first row shows organization 790471 (Extended Review, Women-Owned) associated with conference marketplace id 1. The second row links organization 1717 (Pilot Initiative A, Local_Employer) to marketplace id 2. The view carries the organization's business type and membership status alongside the marketplace identifier, enabling organizers to analyze marketplace occupancy patterns by organization profile.

## Networking Sessions and Events

The networking_session_major_event_view presents the relationship from the networking session's perspective, showing which event each session belongs to. This view supports schedule construction and attendance tracking.

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

The first row shows session 1186087 (Seasonal Standard, mandatory, at extended-location-99) associated with event 100 (Seasonal Standard, AwardCelebration, 2025-04-15, at Legacy Review D). The second row links session 2087748 (Integrated Framework, non-mandatory, at integrated-location-100) to event 101 (Integrated Framework, BusinessConference, 2022-09-26, at Regional Initiative). The view includes the session's time window alongside the event's theme and annual edition, enabling detailed schedule planning.

## Networking Sessions and Organizations

The networking_session_sponsoring_organization_view connects networking sessions to their sponsoring organizations. This relationship clarifies which organization is responsible for facilitating each session.

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

The first row shows session 1186087 (Seasonal Standard, mandatory) sponsored by organization 790471 (Extended Review, Women-Owned, Member). The second row links session 2087748 (Integrated Framework, non-mandatory) to organization 1717 (Pilot Initiative A, Local_Employer, Non-Member). The view carries the session's location and time alongside the organization's contact details and membership status, supporting accountability and resource allocation.

## Silent Auctions and Events

The silent_auction_major_event_view presents the relationship from the silent auction's perspective, showing which event each auction supports. This view is useful for fundraising attribution and post-event financial reporting.

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

The first row shows auction 611510 (32 items, 17.95 proceeds, status Upcoming) associated with event 100 (Seasonal Standard, AwardCelebration, 2025-04-15). The second row links auction 19744285 (39 items, 21.90 proceeds, status Active) to event 101 (Integrated Framework, BusinessConference, 2022-09-26). The view includes the auction date and status alongside the event's venue and theme, enabling organizers to correlate fundraising performance with event characteristics.

## Conference Marketplaces and Events

The conference_marketplace_major_event_view links conference marketplaces to the major events that host them. This relationship answers which events provide marketplace space and supports exhibitor placement planning.

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

The first row shows conference marketplace id 1 associated with event 100 (Seasonal Standard, AwardCelebration, 2025-04-15). The second row links marketplace id 2 to event 101 (Integrated Framework, BusinessConference, 2022-09-26). The view carries the marketplace identifier alongside the event's type, theme, and annual edition, enabling organizers to analyze marketplace utilization across different event formats.

## Conference Marketplaces and Organizations

The conference_marketplace_sponsoring_organization_view connects conference marketplaces to the sponsoring organizations that occupy them. This relationship is essential for understanding exhibitor demographics and marketplace revenue attribution.

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

The first row shows conference marketplace id 1 occupied by organization 790471 (Extended Review, Women-Owned, Member). The second row links marketplace id 2 to organization 1717 (Pilot Initiative A, Local_Employer, Non-Member). The view carries the organization's business type and membership status alongside the marketplace identifier, enabling organizers to analyze marketplace composition by organizational profile and membership tier.

## Synthesis

The sponsorship ecosystem is held together by a network of relationships that span commercial packages, event programming, organizational partnerships, and recognition activities. Each base table captures a distinct dimension of the operation—pricing and benefits in sponsorship packages, scheduling and venue logistics in major events, recognition criteria in award recipients, organizational profiles in sponsoring organizations, session scheduling in networking sessions, fundraising metrics in silent auctions, and exhibitor space in conference marketplaces. The views synthesize these dimensions into actionable pairings: which package belongs to which event, which organization sponsors which package, which recipient is honored at which event, which session is mandatory at which event, which auction generates proceeds at which event, and which organization occupies which marketplace. Together, these records and their cross-references form the operational backbone of conference sponsorship management, enabling planners to track commitments, construct schedules, attribute revenue, and report on outcomes across the full lifecycle of an event.