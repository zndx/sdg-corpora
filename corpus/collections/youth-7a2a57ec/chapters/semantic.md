Youth justice administration tracks the movement of young people through a network of facilities, the health-care summaries that accompany each transition, and the authorizations that govern those transitions. The domain is modelled as six base tables—`youths`, `health_care_summaries`, `transfer_events`, `release_events`, `healthcare_facilities`, and `authorizations`—whose columns capture identifiers, timestamps, status flags, and foreign keys that bind the entities together. Views then reassemble these normalised tables into denormalised projections that answer specific analytical questions, such as "which health-care summary belongs to which youth" or "which facility received a transfer." The following sections walk through the entity types, their attributes, the foreign-key relationships that materialise as columns and junction tables, and the join logic that each view encodes.

## Entity Types and Their Attributes

The `youths` table is the central person entity. Each row represents a young person in the justice system, identified by a surrogate primary key `id` and a business key `youth_identifier`. Demographic and administrative attributes include `date_of_birth`, `current_status` (which takes values such as `in_custody`, `transferred`, or `released`), and `jurisdiction_code`. The table also carries `health_care_summary_format_code`, which records the format of the health-care summary associated with the youth, and two foreign keys—`transfer_event_id` and `release_event_id`—that point to the most recent transfer and release events for that youth. For example, youth `YOU-2285` (id `1000`) has `current_status` `in_custody`, was born on `2025-04-02`, belongs to jurisdiction `5917299`, and is linked to transfer event `1` and release event `100`.

**Table `youths`**

| id | youth_identifier | date_of_birth | current_status | jurisdiction_code | health_care_summary_format_code | transfer_event_id | release_event_id |
|---|---|---|---|---|---|---|---|
| 1000 | YOU-2285 | 2025-04-02 | in_custody | 5917299 | gd_taxp_3 | 1 | 100 |
| 1001 | YOU-2286 | 2022-09-13 | transferred | id_25 | 9736899 | 2 | 101 |
| 1002 | YOU-2287 | 2023-02-24 | released | 7731856 | 2002007020260 | 3 | 102 |
| 1003 | YOU-2288 | 2024-07-08 | in_custody | 7c692762-8fcd-11eb-924d-9cd76263cbd0 | 255 | 4 | 103 |

The `health_care_summaries` table stores one row per health-care summary generated for a youth. Its primary key is `summary_identifier` (e.g., `SUM-2619`), and it records `creation_date` as an ISO timestamp (`2022-01-13T12:24:00`), a `format_code` (such as `gd_taxp_3`), a boolean `has_records` flag, and a `confidentiality_status` (`confidential`, `restricted`, or `public`). Three foreign keys—`youth_id`, `healthcare_facility_id`, and `authorization_id`—tie the summary to the youth it describes, the facility that produced it, and the authorisation that governs its release.

**Table `health_care_summaries`**

| summary_identifier | creation_date | format_code | has_records | confidentiality_status | youth_id | healthcare_facility_id | authorization_id |
|---|---|---|---|---|---|---|---|
| SUM-2619 | 2022-01-13T12:24:00 | gd_taxp_3 | false | confidential | 1000 | 1 | 1 |
| SUM-2623 | 2023-06-24T19:41:00 | 9736899 | true | restricted | 1001 | 2 | 2 |
| SUM-2627 | 2024-11-08T02:58:00 | 2002007020260 | false | public | 1002 | 3 | 3 |
| SUM-2631 | 2025-04-19T09:15:00 | 255 | true | confidential | 1003 | 4 | 4 |

The `transfer_events` table captures each physical or administrative transfer of a youth between facilities. Its primary key is `transfer_event_id`, and the business key `transfer_identifier` (e.g., `TRA-2375`) is human-readable. The `transfer_date` column stores the timestamp of the event, while `origin_facility_code` and `destination_facility_code` record the sending and receiving facilities as codes. A boolean `has_communicable_disease` flag indicates whether the transfer was triggered by a health concern. The table also carries `youth_id` (linking the event to the youth), `health_care_summary_format_code` (echoing the format from the youth record), and `healthcare_facility_id` (identifying the facility that initiated or received the transfer).

**Table `transfer_events`**

| transfer_event_id | transfer_identifier | transfer_date | origin_facility_code | destination_facility_code | has_communicable_disease | youth_id | health_care_summary_format_code | healthcare_facility_id |
|---|---|---|---|---|---|---|---|---|
| 1 | TRA-2375 | 2025-08-12T07:33:00 | 9125639 | 10449530 | false | 1000 | gd_taxp_3 | 1 |
| 2 | TRA-2376 | 2022-01-23T14:50:00 | a854635a-9bad-11eb-a8a2-19ed5c03f8d3 | 1437591 | true | 1001 | 9736899 | 2 |
| 3 | TRA-2377 | 2023-06-07T21:07:00 | 1202-0008-S | 726046 | false | 1002 | 2002007020260 | 3 |
| 4 | TRA-2378 | 2024-11-18T04:24:00 | arc | 15426389 | true | 1003 | 255 | 4 |

The `release_events` table mirrors the structure of `transfer_events` but captures releases rather than transfers. Its primary key is `release_event_id`, with business key `release_identifier` (e.g., `REL-2122`). The `release_date` stores the timestamp, `release_type` takes values like `community`, `court_ordered`, or `statutory`, and `authorization_obtained` is a boolean indicating whether the required authorisation was secured. Like `transfer_events`, it carries `youth_id`, `health_care_summary_format_code`, and `healthcare_facility_id` as foreign-key columns.

**Table `release_events`**

| release_event_id | release_identifier | release_date | release_type | authorization_obtained | youth_id | health_care_summary_format_code | healthcare_facility_id |
|---|---|---|---|---|---|---|---|
| 100 | REL-2122 | 2022-09-07T20:24:00 | community | false | 1000 | gd_taxp_3 | 1 |
| 101 | REL-2124 | 2023-02-18T03:41:00 | court_ordered | true | 1001 | 9736899 | 2 |
| 102 | REL-2126 | 2024-07-02T10:58:00 | statutory | false | 1002 | 2002007020260 | 3 |
| 103 | REL-2128 | 2025-12-13T17:15:00 | community | true | 1003 | 255 | 4 |

The `healthcare_facilities` table is the organisational entity for facilities. Its primary key is `id`, and the business key `facility_code` (e.g., `2933476`) identifies the facility externally. The `facility_name` (such as `Integrated Protocol A`) and `facility_type` (`juvenile_facility`, `community_clinic`, or `county_health_officer`) describe the facility. The `jurisdiction_code` links the facility to a geographic or administrative jurisdiction. The table also carries `health_care_summary_format_code`, `transfer_event_id`, and `is_destination_of_transfer_event_id` as foreign keys that tie the facility to specific transfer events.

**Table `healthcare_facilities`**

| id | facility_code | facility_name | facility_type | jurisdiction_code | health_care_summary_format_code | transfer_event_id | is_destination_of_transfer_event_id |
|---|---|---|---|---|---|---|---|
| 1 | 2933476 | Integrated Protocol A | juvenile_facility | 5917299 | gd_taxp_3 | 1 | 1 |
| 2 | Bjuukia | Extended Programme | community_clinic | id_25 | 9736899 | 2 | 2 |
| 3 | 2106693 | Pilot Standard | county_health_officer | 7731856 | 2002007020260 | 3 | 3 |
| 4 | 6969439 | Baseline Framework D | juvenile_facility | 7c692762-8fcd-11eb-924d-9cd76263cbd0 | 255 | 4 | 4 |

The `authorizations` table records the legal permissions required for transfers and releases. Its primary key is `id`, and the business key `authorization_identifier` (e.g., `AUT-2420`) is human-readable. The `issue_date` stores when the authorisation was granted, `grantor_type` indicates who issued it (`youth`, `parent`, or `legal_guardian`), `is_court_ordered` is a boolean, and `status` takes values such as `pending`, `obtained`, or `waived`. Three foreign keys—`youth_id`, `transfer_event_id`, and `release_event_id`—tie the authorisation to the relevant youth and events.

**Table `authorizations`**

| id | authorization_identifier | issue_date | grantor_type | is_court_ordered | status | youth_id | transfer_event_id | release_event_id |
|---|---|---|---|---|---|---|---|---|
| 1 | AUT-2420 | 2023-02-01T13:51:00 | youth | true | pending | 1000 | 1 | 100 |
| 2 | AUT-2423 | 2024-07-12T20:08:00 | parent | false | obtained | 1001 | 2 | 101 |
| 3 | AUT-2426 | 2025-12-23T03:25:00 | legal_guardian | true | waived | 1002 | 3 | 102 |
| 4 | AUT-2429 | 2022-05-07T10:42:00 | youth | false | pending | 1003 | 4 | 103 |

## Foreign-Key Relationships and Normalisation

The relational schema enforces referential integrity through foreign-key columns embedded directly in the base tables. The `youths` table holds `transfer_event_id` and `release_event_id`, which are foreign keys into `transfer_events.transfer_event_id` and `release_events.release_event_id` respectively. This models a one-to-one or one-to-many relationship: a youth may have at most one current transfer event and one current release event recorded, but a transfer or release event may be referenced by multiple youth rows in a historical archive.

The `health_care_summaries` table carries three foreign keys. `youth_id` references `youths.id`, establishing that each summary belongs to exactly one youth. `healthcare_facility_id` references `healthcare_facilities.id`, indicating the facility that produced the summary. `authorization_id` references `authorizations.id`, linking the summary to the authorisation that governs its release. These three foreign keys together form a composite relationship: a health-care summary is a fact that simultaneously involves a youth, a facility, and an authorisation.

The `transfer_events` table carries `youth_id` (referencing `youths.id`) and `healthcare_facility_id` (referencing `healthcare_facilities.id`), establishing that each transfer event involves exactly one youth and one facility. The `release_events` table follows the same pattern with `youth_id` and `healthcare_facility_id`.

The `healthcare_facilities` table carries `transfer_event_id` and `is_destination_of_transfer_event_id`, both referencing `transfer_events.transfer_event_id`. This models the bidirectional relationship between facilities and transfers: a facility can be the origin of a transfer (via `transfer_event_id`) and the destination of a transfer (via `is_destination_of_transfer_event_id`).

The `authorizations` table carries `youth_id`, `transfer_event_id`, and `release_event_id`, referencing `youths.id`, `transfer_events.transfer_event_id`, and `release_events.release_event_id` respectively. This means each authorisation is associated with exactly one youth and may be linked to a specific transfer event and/or release event.

## View Projections

Each view is a named `SELECT` statement that joins the base tables to produce a denormalised row set answering a specific analytical question. The following sections interpret each view by describing its join logic and reading concrete rows as evidence.

**View `vw_youth_health_care_summary`**

```sql
CREATE VIEW vw_youth_health_care_summary AS
SELECT a.id, a.youth_identifier, a.date_of_birth, a.current_status, b.summary_identifier AS summary_summary_identifier, b.creation_date AS summary_creation_date, b.format_code AS summary_format_code
FROM youths a JOIN health_care_summaries b ON a.health_care_summary_format_code = b.format_code;
```

| id | youth_identifier | date_of_birth | current_status | summary_summary_identifier | summary_creation_date | summary_format_code |
|---|---|---|---|---|---|---|
| 1000 | YOU-2285 | 2025-04-02 | in_custody | SUM-2619 | 2022-01-13T12:24:00 | gd_taxp_3 |
| 1001 | YOU-2286 | 2022-09-13 | transferred | SUM-2623 | 2023-06-24T19:41:00 | 9736899 |
| 1002 | YOU-2287 | 2023-02-24 | released | SUM-2627 | 2024-11-08T02:58:00 | 2002007020260 |
| 1003 | YOU-2288 | 2024-07-08 | in_custody | SUM-2631 | 2025-04-19T09:15:00 | 255 |

The view `vw_youth_health_care_summary` joins `youths` to `health_care_summaries` on `youths.id = health_care_summaries.youth_id`. It answers the question: "What health-care summary is associated with each youth?" For example, the row for youth `YOU-2285` (id `1000`) shows the health-care summary `SUM-2619`, created on `2022-01-13T12:24:00` with format code `gd_taxp_3`, confidentiality status `confidential`, and no records (`has_records` = `false`). The view flattens the one-to-many relationship so that each youth-summary pair appears as a single row.

**View `vw_youth_transfer_event`**

```sql
CREATE VIEW vw_youth_transfer_event AS
SELECT a.id, a.youth_identifier, a.date_of_birth, a.current_status, b.transfer_event_id AS event_transfer_event_id, b.transfer_identifier AS event_transfer_identifier, b.transfer_date AS event_transfer_date
FROM youths a JOIN transfer_events b ON a.transfer_event_id = b.transfer_event_id;
```

| id | youth_identifier | date_of_birth | current_status | event_transfer_event_id | event_transfer_identifier | event_transfer_date |
|---|---|---|---|---|---|---|
| 1000 | YOU-2285 | 2025-04-02 | in_custody | 1 | TRA-2375 | 2025-08-12T07:33:00 |
| 1001 | YOU-2286 | 2022-09-13 | transferred | 2 | TRA-2376 | 2022-01-23T14:50:00 |
| 1002 | YOU-2287 | 2023-02-24 | released | 3 | TRA-2377 | 2023-06-07T21:07:00 |
| 1003 | YOU-2288 | 2024-07-08 | in_custody | 4 | TRA-2378 | 2024-11-18T04:24:00 |

The view `vw_youth_transfer_event` joins `youths` to `transfer_events` on `youths.id = transfer_events.youth_id`. It answers: "Which transfer event is associated with each youth?" For youth `YOU-2286` (id `1001`), the view shows transfer event `TRA-2376`, which occurred on `2022-01-23T14:50:00`, originated from facility code `a854635a-9bad-11eb-a8a2-19ed5c03f8d3`, was destined for facility code `1437591`, and involved a communicable disease (`has_communicable_disease` = `true`).

**View `vw_youth_release_event`**

```sql
CREATE VIEW vw_youth_release_event AS
SELECT a.id, a.youth_identifier, a.date_of_birth, a.current_status, b.release_event_id AS event_release_event_id, b.release_identifier AS event_release_identifier, b.release_date AS event_release_date
FROM youths a JOIN release_events b ON a.release_event_id = b.release_event_id;
```

| id | youth_identifier | date_of_birth | current_status | event_release_event_id | event_release_identifier | event_release_date |
|---|---|---|---|---|---|---|
| 1000 | YOU-2285 | 2025-04-02 | in_custody | 100 | REL-2122 | 2022-09-07T20:24:00 |
| 1001 | YOU-2286 | 2022-09-13 | transferred | 101 | REL-2124 | 2023-02-18T03:41:00 |
| 1002 | YOU-2287 | 2023-02-24 | released | 102 | REL-2126 | 2024-07-02T10:58:00 |
| 1003 | YOU-2288 | 2024-07-08 | in_custody | 103 | REL-2128 | 2025-12-13T17:15:00 |

The view `vw_youth_release_event` joins `youths` to `release_events` on `youths.id = release_events.youth_id`. It answers: "Which release event is associated with each youth?" For youth `YOU-2287` (id `1002`), the view shows release event `REL-2126`, which occurred on `2024-07-02T10:58:00`, was of type `statutory`, and had authorisation obtained (`authorization_obtained` = `false`).

**View `vw_health_care_summary_youth`**

```sql
CREATE VIEW vw_health_care_summary_youth AS
SELECT a.summary_identifier, a.creation_date, a.format_code, a.has_records, b.id AS youth_id, b.youth_identifier AS youth_youth_identifier, b.date_of_birth AS youth_date_of_birth
FROM health_care_summaries a JOIN youths b ON a.youth_id = b.id;
```

| summary_identifier | creation_date | format_code | has_records | youth_id | youth_youth_identifier | youth_date_of_birth |
|---|---|---|---|---|---|---|
| SUM-2619 | 2022-01-13T12:24:00 | gd_taxp_3 | false | 1000 | YOU-2285 | 2025-04-02 |
| SUM-2623 | 2023-06-24T19:41:00 | 9736899 | true | 1001 | YOU-2286 | 2022-09-13 |
| SUM-2627 | 2024-11-08T02:58:00 | 2002007020260 | false | 1002 | YOU-2287 | 2023-02-24 |
| SUM-2631 | 2025-04-19T09:15:00 | 255 | true | 1003 | YOU-2288 | 2024-07-08 |

The view `vw_health_care_summary_youth` is the inverse of `vw_youth_health_care_summary`: it joins `health_care_summaries` to `youths` on `health_care_summaries.youth_id = youths.id`. It answers: "Which youth is associated with each health-care summary?" For summary `SUM-2623`, the view shows the associated youth `YOU-2286` (id `1001`), who has `current_status` `transferred` and belongs to jurisdiction `id_25`. This view is useful when starting from a summary and needing to navigate to the youth.

**View `vw_health_care_summary_healthcare_facility`**

```sql
CREATE VIEW vw_health_care_summary_healthcare_facility AS
SELECT a.summary_identifier, a.creation_date, a.format_code, a.has_records, b.id AS facility_id, b.facility_code AS facility_facility_code, b.facility_name AS facility_facility_name
FROM health_care_summaries a JOIN healthcare_facilities b ON a.healthcare_facility_id = b.id;
```

| summary_identifier | creation_date | format_code | has_records | facility_id | facility_facility_code | facility_facility_name |
|---|---|---|---|---|---|---|
| SUM-2619 | 2022-01-13T12:24:00 | gd_taxp_3 | false | 1 | 2933476 | Integrated Protocol A |
| SUM-2623 | 2023-06-24T19:41:00 | 9736899 | true | 2 | Bjuukia | Extended Programme |
| SUM-2627 | 2024-11-08T02:58:00 | 2002007020260 | false | 3 | 2106693 | Pilot Standard |
| SUM-2631 | 2025-04-19T09:15:00 | 255 | true | 4 | 6969439 | Baseline Framework D |

The view `vw_health_care_summary_healthcare_facility` joins `health_care_summaries` to `healthcare_facilities` on `health_care_summaries.healthcare_facility_id = healthcare_facilities.id`. It answers: "Which facility produced each health-care summary?" For summary `SUM-2627`, the view shows facility `2106693` (`Pilot Standard`), which is of type `county_health_officer` and belongs to jurisdiction `7731856`.

**View `vw_health_care_summary_authorization`**

```sql
CREATE VIEW vw_health_care_summary_authorization AS
SELECT a.summary_identifier, a.creation_date, a.format_code, a.has_records, b.id AS authorization_id, b.authorization_identifier AS authorization_authorization_identifier, b.issue_date AS authorization_issue_date
FROM health_care_summaries a JOIN authorizations b ON a.authorization_id = b.id;
```

| summary_identifier | creation_date | format_code | has_records | authorization_id | authorization_authorization_identifier | authorization_issue_date |
|---|---|---|---|---|---|---|
| SUM-2619 | 2022-01-13T12:24:00 | gd_taxp_3 | false | 1 | AUT-2420 | 2023-02-01T13:51:00 |
| SUM-2623 | 2023-06-24T19:41:00 | 9736899 | true | 2 | AUT-2423 | 2024-07-12T20:08:00 |
| SUM-2627 | 2024-11-08T02:58:00 | 2002007020260 | false | 3 | AUT-2426 | 2025-12-23T03:25:00 |
| SUM-2631 | 2025-04-19T09:15:00 | 255 | true | 4 | AUT-2429 | 2022-05-07T10:42:00 |

The view `vw_health_care_summary_authorization` joins `health_care_summaries` to `authorizations` on `health_care_summaries.authorization_id = authorizations.id`. It answers: "Which authorisation governs each health-care summary?" For summary `SUM-2631`, the view shows authorisation `AUT-2429`, issued on `2022-05-07T10:42:00` by a `youth` grantor, not court-ordered, with status `pending`.

**View `vw_transfer_event_youth`**

```sql
CREATE VIEW vw_transfer_event_youth AS
SELECT a.transfer_event_id, a.transfer_identifier, a.transfer_date, a.origin_facility_code, b.id AS youth_id, b.youth_identifier AS youth_youth_identifier, b.date_of_birth AS youth_date_of_birth
FROM transfer_events a JOIN youths b ON a.youth_id = b.id;
```

| transfer_event_id | transfer_identifier | transfer_date | origin_facility_code | youth_id | youth_youth_identifier | youth_date_of_birth |
|---|---|---|---|---|---|---|
| 1 | TRA-2375 | 2025-08-12T07:33:00 | 9125639 | 1000 | YOU-2285 | 2025-04-02 |
| 2 | TRA-2376 | 2022-01-23T14:50:00 | a854635a-9bad-11eb-a8a2-19ed5c03f8d3 | 1001 | YOU-2286 | 2022-09-13 |
| 3 | TRA-2377 | 2023-06-07T21:07:00 | 1202-0008-S | 1002 | YOU-2287 | 2023-02-24 |
| 4 | TRA-2378 | 2024-11-18T04:24:00 | arc | 1003 | YOU-2288 | 2024-07-08 |

The view `vw_transfer_event_youth` joins `transfer_events` to `youths` on `transfer_events.youth_id = youths.id`. It answers: "Which youth was involved in each transfer event?" For transfer event `TRA-2375`, the view shows youth `YOU-2285` (id `1000`), who has `current_status` `in_custody` and was born on `2025-04-02`.

**View `vw_transfer_event_health_care_summary`**

```sql
CREATE VIEW vw_transfer_event_health_care_summary AS
SELECT a.transfer_event_id, a.transfer_identifier, a.transfer_date, a.origin_facility_code, b.summary_identifier AS summary_summary_identifier, b.creation_date AS summary_creation_date, b.format_code AS summary_format_code
FROM transfer_events a JOIN health_care_summaries b ON a.health_care_summary_format_code = b.format_code;
```

| transfer_event_id | transfer_identifier | transfer_date | origin_facility_code | summary_summary_identifier | summary_creation_date | summary_format_code |
|---|---|---|---|---|---|---|
| 1 | TRA-2375 | 2025-08-12T07:33:00 | 9125639 | SUM-2619 | 2022-01-13T12:24:00 | gd_taxp_3 |
| 2 | TRA-2376 | 2022-01-23T14:50:00 | a854635a-9bad-11eb-a8a2-19ed5c03f8d3 | SUM-2623 | 2023-06-24T19:41:00 | 9736899 |
| 3 | TRA-2377 | 2023-06-07T21:07:00 | 1202-0008-S | SUM-2627 | 2024-11-08T02:58:00 | 2002007020260 |
| 4 | TRA-2378 | 2024-11-18T04:24:00 | arc | SUM-2631 | 2025-04-19T09:15:00 | 255 |

The view `vw_transfer_event_health_care_summary` joins `transfer_events` to `health_care_summaries` through the shared `youth_id` column (i.e., `transfer_events.youth_id = health_care_summaries.youth_id`). It answers: "Which health-care summary is associated with the youth involved in each transfer event?" For transfer event `TRA-2376`, the view shows health-care summary `SUM-2623`, which has format code `9736899` and confidentiality status `restricted`.

**View `vw_transfer_event_healthcare_facility`**

```sql
CREATE VIEW vw_transfer_event_healthcare_facility AS
SELECT a.transfer_event_id, a.transfer_identifier, a.transfer_date, a.origin_facility_code, b.id AS facility_id, b.facility_code AS facility_facility_code, b.facility_name AS facility_facility_name
FROM transfer_events a JOIN healthcare_facilities b ON a.healthcare_facility_id = b.id;
```

| transfer_event_id | transfer_identifier | transfer_date | origin_facility_code | facility_id | facility_facility_code | facility_facility_name |
|---|---|---|---|---|---|---|
| 1 | TRA-2375 | 2025-08-12T07:33:00 | 9125639 | 1 | 2933476 | Integrated Protocol A |
| 2 | TRA-2376 | 2022-01-23T14:50:00 | a854635a-9bad-11eb-a8a2-19ed5c03f8d3 | 2 | Bjuukia | Extended Programme |
| 3 | TRA-2377 | 2023-06-07T21:07:00 | 1202-0008-S | 3 | 2106693 | Pilot Standard |
| 4 | TRA-2378 | 2024-11-18T04:24:00 | arc | 4 | 6969439 | Baseline Framework D |

The view `vw_transfer_event_healthcare_facility` joins `transfer_events` to `healthcare_facilities` on `transfer_events.healthcare_facility_id = healthcare_facilities.id`. It answers: "Which facility is associated with each transfer event?" For transfer event `TRA-2377`, the view shows facility `2106693` (`Pilot Standard`), a `county_health_officer` facility in jurisdiction `7731856`.

**View `vw_release_event_youth`**

```sql
CREATE VIEW vw_release_event_youth AS
SELECT a.release_event_id, a.release_identifier, a.release_date, a.release_type, b.id AS youth_id, b.youth_identifier AS youth_youth_identifier, b.date_of_birth AS youth_date_of_birth
FROM release_events a JOIN youths b ON a.youth_id = b.id;
```

| release_event_id | release_identifier | release_date | release_type | youth_id | youth_youth_identifier | youth_date_of_birth |
|---|---|---|---|---|---|---|
| 100 | REL-2122 | 2022-09-07T20:24:00 | community | 1000 | YOU-2285 | 2025-04-02 |
| 101 | REL-2124 | 2023-02-18T03:41:00 | court_ordered | 1001 | YOU-2286 | 2022-09-13 |
| 102 | REL-2126 | 2024-07-02T10:58:00 | statutory | 1002 | YOU-2287 | 2023-02-24 |
| 103 | REL-2128 | 2025-12-13T17:15:00 | community | 1003 | YOU-2288 | 2024-07-08 |

The view `vw_release_event_youth` joins `release_events` to `youths` on `release_events.youth_id = youths.id`. It answers: "Which youth was involved in each release event?" For release event `REL-2124`, the view shows youth `YOU-2286` (id `1001`), who has `current_status` `transferred` and belongs to jurisdiction `id_25`.

**View `vw_release_event_health_care_summary`**

```sql
CREATE VIEW vw_release_event_health_care_summary AS
SELECT a.release_event_id, a.release_identifier, a.release_date, a.release_type, b.summary_identifier AS summary_summary_identifier, b.creation_date AS summary_creation_date, b.format_code AS summary_format_code
FROM release_events a JOIN health_care_summaries b ON a.health_care_summary_format_code = b.format_code;
```

| release_event_id | release_identifier | release_date | release_type | summary_summary_identifier | summary_creation_date | summary_format_code |
|---|---|---|---|---|---|---|
| 100 | REL-2122 | 2022-09-07T20:24:00 | community | SUM-2619 | 2022-01-13T12:24:00 | gd_taxp_3 |
| 101 | REL-2124 | 2023-02-18T03:41:00 | court_ordered | SUM-2623 | 2023-06-24T19:41:00 | 9736899 |
| 102 | REL-2126 | 2024-07-02T10:58:00 | statutory | SUM-2627 | 2024-11-08T02:58:00 | 2002007020260 |
| 103 | REL-2128 | 2025-12-13T17:15:00 | community | SUM-2631 | 2025-04-19T09:15:00 | 255 |

The view `vw_release_event_health_care_summary` joins `release_events` to `health_care_summaries` through the shared `youth_id` column. It answers: "Which health-care summary is associated with the youth involved in each release event?" For release event `REL-2126`, the view shows health-care summary `SUM-2627`, which has format code `2002007020260` and confidentiality status `public`.

**View `vw_release_event_healthcare_facility`**

```sql
CREATE VIEW vw_release_event_healthcare_facility AS
SELECT a.release_event_id, a.release_identifier, a.release_date, a.release_type, b.id AS facility_id, b.facility_code AS facility_facility_code, b.facility_name AS facility_facility_name
FROM release_events a JOIN healthcare_facilities b ON a.healthcare_facility_id = b.id;
```

| release_event_id | release_identifier | release_date | release_type | facility_id | facility_facility_code | facility_facility_name |
|---|---|---|---|---|---|---|
| 100 | REL-2122 | 2022-09-07T20:24:00 | community | 1 | 2933476 | Integrated Protocol A |
| 101 | REL-2124 | 2023-02-18T03:41:00 | court_ordered | 2 | Bjuukia | Extended Programme |
| 102 | REL-2126 | 2024-07-02T10:58:00 | statutory | 3 | 2106693 | Pilot Standard |
| 103 | REL-2128 | 2025-12-13T17:15:00 | community | 4 | 6969439 | Baseline Framework D |

The view `vw_release_event_healthcare_facility` joins `release_events` to `healthcare_facilities` on `release_events.healthcare_facility_id = healthcare_facilities.id`. It answers: "Which facility is associated with each release event?" For release event `REL-2128`, the view shows facility `6969439` (`Baseline Framework D`), a `juvenile_facility` in jurisdiction `7c692762-8fcd-11eb-924d-9cd76263cbd0`.

**View `vw_healthcare_facility_health_care_summary`**

```sql
CREATE VIEW vw_healthcare_facility_health_care_summary AS
SELECT a.id, a.facility_code, a.facility_name, a.facility_type, b.summary_identifier AS summary_summary_identifier, b.creation_date AS summary_creation_date, b.format_code AS summary_format_code
FROM healthcare_facilities a JOIN health_care_summaries b ON a.health_care_summary_format_code = b.format_code;
```

| id | facility_code | facility_name | facility_type | summary_summary_identifier | summary_creation_date | summary_format_code |
|---|---|---|---|---|---|---|
| 1 | 2933476 | Integrated Protocol A | juvenile_facility | SUM-2619 | 2022-01-13T12:24:00 | gd_taxp_3 |
| 2 | Bjuukia | Extended Programme | community_clinic | SUM-2623 | 2023-06-24T19:41:00 | 9736899 |
| 3 | 2106693 | Pilot Standard | county_health_officer | SUM-2627 | 2024-11-08T02:58:00 | 2002007020260 |
| 4 | 6969439 | Baseline Framework D | juvenile_facility | SUM-2631 | 2025-04-19T09:15:00 | 255 |

The view `vw_healthcare_facility_health_care_summary` joins `healthcare_facilities` to `health_care_summaries` on `healthcare_facilities.id = health_care_summaries.healthcare_facility_id`. It answers: "Which health-care summaries were produced by each facility?" For facility `2933476` (`Integrated Protocol A`), the view shows health-care summary `SUM-2619`, which belongs to youth `YOU-2285` and has confidentiality status `confidential`.

**View `vw_healthcare_facility_transfer_event`**

```sql
CREATE VIEW vw_healthcare_facility_transfer_event AS
SELECT a.id, a.facility_code, a.facility_name, a.facility_type, b.transfer_event_id AS event_transfer_event_id, b.transfer_identifier AS event_transfer_identifier, b.transfer_date AS event_transfer_date
FROM healthcare_facilities a JOIN transfer_events b ON a.transfer_event_id = b.transfer_event_id;
```

| id | facility_code | facility_name | facility_type | event_transfer_event_id | event_transfer_identifier | event_transfer_date |
|---|---|---|---|---|---|---|
| 1 | 2933476 | Integrated Protocol A | juvenile_facility | 1 | TRA-2375 | 2025-08-12T07:33:00 |
| 2 | Bjuukia | Extended Programme | community_clinic | 2 | TRA-2376 | 2022-01-23T14:50:00 |
| 3 | 2106693 | Pilot Standard | county_health_officer | 3 | TRA-2377 | 2023-06-07T21:07:00 |
| 4 | 6969439 | Baseline Framework D | juvenile_facility | 4 | TRA-2378 | 2024-11-18T04:24:00 |

The view `vw_healthcare_facility_transfer_event` joins `healthcare_facilities` to `transfer_events` on `healthcare_facilities.id = transfer_events.healthcare_facility_id`. It answers: "Which transfer events are associated with each facility?" For facility `Bjuukia` (id `2`), the view shows transfer event `TRA-2376`, which occurred on `2022-01-23T14:50:00` and involved a communicable disease.

**View `vw_authorization_youth`**

```sql
CREATE VIEW vw_authorization_youth AS
SELECT a.id, a.authorization_identifier, a.issue_date, a.grantor_type, b.id AS youth_id, b.youth_identifier AS youth_youth_identifier, b.date_of_birth AS youth_date_of_birth
FROM authorizations a JOIN youths b ON a.youth_id = b.id;
```

| id | authorization_identifier | issue_date | grantor_type | youth_id | youth_youth_identifier | youth_date_of_birth |
|---|---|---|---|---|---|---|
| 1 | AUT-2420 | 2023-02-01T13:51:00 | youth | 1000 | YOU-2285 | 2025-04-02 |
| 2 | AUT-2423 | 2024-07-12T20:08:00 | parent | 1001 | YOU-2286 | 2022-09-13 |
| 3 | AUT-2426 | 2025-12-23T03:25:00 | legal_guardian | 1002 | YOU-2287 | 2023-02-24 |
| 4 | AUT-2429 | 2022-05-07T10:42:00 | youth | 1003 | YOU-2288 | 2024-07-08 |

The view `vw_authorization_youth` joins `authorizations` to `youths` on `authorizations.youth_id = youths.id`. It answers: "Which youth is associated with each authorisation?" For authorisation `AUT-2423`, the view shows youth `YOU-2286` (id `1001`), who has `current_status` `transferred` and was born on `2022-09-13`.

**View `vw_authorization_transfer_event`**

```sql
CREATE VIEW vw_authorization_transfer_event AS
SELECT a.id, a.authorization_identifier, a.issue_date, a.grantor_type, b.transfer_event_id AS event_transfer_event_id, b.transfer_identifier AS event_transfer_identifier, b.transfer_date AS event_transfer_date
FROM authorizations a JOIN transfer_events b ON a.transfer_event_id = b.transfer_event_id;
```

| id | authorization_identifier | issue_date | grantor_type | event_transfer_event_id | event_transfer_identifier | event_transfer_date |
|---|---|---|---|---|---|---|
| 1 | AUT-2420 | 2023-02-01T13:51:00 | youth | 1 | TRA-2375 | 2025-08-12T07:33:00 |
| 2 | AUT-2423 | 2024-07-12T20:08:00 | parent | 2 | TRA-2376 | 2022-01-23T14:50:00 |
| 3 | AUT-2426 | 2025-12-23T03:25:00 | legal_guardian | 3 | TRA-2377 | 2023-06-07T21:07:00 |
| 4 | AUT-2429 | 2022-05-07T10:42:00 | youth | 4 | TRA-2378 | 2024-11-18T04:24:00 |

The view `vw_authorization_transfer_event` joins `authorizations` to `transfer_events` on `authorizations.transfer_event_id = transfer_events.transfer_event_id`. It answers: "Which transfer event is associated with each authorisation?" For authorisation `AUT-2426`, the view shows transfer event `TRA-2377`, which occurred on `2023-06-07T21:07:00` and originated from facility code `1202-0008-S`.

**View `vw_authorization_release_event`**

```sql
CREATE VIEW vw_authorization_release_event AS
SELECT a.id, a.authorization_identifier, a.issue_date, a.grantor_type, b.release_event_id AS event_release_event_id, b.release_identifier AS event_release_identifier, b.release_date AS event_release_date
FROM authorizations a JOIN release_events b ON a.release_event_id = b.release_event_id;
```

| id | authorization_identifier | issue_date | grantor_type | event_release_event_id | event_release_identifier | event_release_date |
|---|---|---|---|---|---|---|
| 1 | AUT-2420 | 2023-02-01T13:51:00 | youth | 100 | REL-2122 | 2022-09-07T20:24:00 |
| 2 | AUT-2423 | 2024-07-12T20:08:00 | parent | 101 | REL-2124 | 2023-02-18T03:41:00 |
| 3 | AUT-2426 | 2025-12-23T03:25:00 | legal_guardian | 102 | REL-2126 | 2024-07-02T10:58:00 |
| 4 | AUT-2429 | 2022-05-07T10:42:00 | youth | 103 | REL-2128 | 2025-12-13T17:15:00 |

The view `vw_authorization_release_event` joins `authorizations` to `release_events` on `authorizations.release_event_id = release_events.release_event_id`. It answers: "Which release event is associated with each authorisation?" For authorisation `AUT-2420`, the view shows release event `REL-2122`, which occurred on `2022-09-07T20:24:00`, was of type `community`, and had authorisation not obtained (`authorization_obtained` = `false`).

## Closing Synthesis

The schema models youth justice administration as a network of six interrelated entity types. The `youths` table anchors the model as the person entity, while `health_care_summaries`, `transfer_events`, and `release_events` capture the key events and documents in a youth's journey. The `healthcare_facilities` table provides the organisational context, and `authorizations` captures the legal permissions that govern transitions. Foreign-key columns embedded in each table enforce referential integrity and encode the cardinality-bounded relationships: a health-care summary belongs to exactly one youth, one facility, and one authorisation; a transfer or release event involves exactly one youth and one facility; an authorisation is linked to one youth and optionally to one transfer and one release event.

The twenty-one views materialise every pairwise and cross-entity projection that the base tables support. Each view is a named join that reconstructs a domain fact from the normalised tables, allowing analysts to ask questions such as "which facility produced which summary" or "which authorisation governs which release." The view names follow a consistent convention: the subject entity appears first (e.g., `vw_youth_health_care_summary`), and the joined entity appears second, making the direction of the relationship immediately apparent from the name alone. Together, the base tables and views form a complete, queryable representation of the youth justice domain that is both normalised for data integrity and denormalised for analytical clarity.