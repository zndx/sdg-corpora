Youth health care administration operates at the intersection of custodial oversight and clinical continuity. When a young person enters custody, a health care summary is created, tracking their medical records across facilities, transfers, and eventual release. Each movement—whether a transfer between facilities or a release into the community—generates an event record that ties together the youth, the originating and receiving organizations, and the authorizations that govern information sharing. The system maintains a coherent chain of custody for health information, ensuring that every summary, transfer, and release can be traced back to the individuals and organizations involved. This chapter describes the core entities, their attributes, and the analytical views that connect them into a unified operational picture.

## The Youth Registry

The foundation of the system is the youth registry, which tracks each young person's identity, status, and jurisdictional assignment.

**Table `youths`**

| id | youth_identifier | date_of_birth | current_status | jurisdiction_code | health_care_summary_format_code | transfer_event_id | release_event_id |
|---|---|---|---|---|---|---|---|
| 1000 | YOU-2285 | 2025-04-02 | in_custody | 5917299 | gd_taxp_3 | 1 | 100 |
| 1001 | YOU-2286 | 2022-09-13 | transferred | id_25 | 9736899 | 2 | 101 |
| 1002 | YOU-2287 | 2023-02-24 | released | 7731856 | 2002007020260 | 3 | 102 |
| 1003 | YOU-2288 | 2024-07-08 | in_custody | 7c692762-8fcd-11eb-924d-9cd76263cbd0 | 255 | 4 | 103 |

Each youth receives a unique identifier such as `YOU-2285` or `YOU-2288`, alongside a date of birth that anchors their demographic record. The `current_status` column reflects their present custodial state: `in_custody`, `transferred`, `released`, or intermediate positions. Jurisdiction codes vary in format—numeric values like `5917299` and `7731856` appear alongside UUIDs such as `7c692762-8fcd-11eb-924d-9cd76263cbd0`—indicating that the system accommodates multiple jurisdictional numbering schemes. The `health_care_summary_format_code` column (e.g., `gd_taxp_3`, `2002007020260`, `255`) specifies the data format applicable to that youth's health care summaries. References to `transfer_event_id` and `release_event_id` link the youth record to the most recent movement events; for instance, youth `YOU-2285` (id `1000`) is associated with transfer event `1` and release event `100`.

## Health Care Summaries

Health care summaries serve as the clinical record container for each youth, aggregating medical information under controlled access rules.

**Table `health_care_summaries`**

| summary_identifier | creation_date | format_code | has_records | confidentiality_status | youth_id | healthcare_facility_id | authorization_id |
|---|---|---|---|---|---|---|---|
| SUM-2619 | 2022-01-13T12:24:00 | gd_taxp_3 | false | confidential | 1000 | 1 | 1 |
| SUM-2623 | 2023-06-24T19:41:00 | 9736899 | true | restricted | 1001 | 2 | 2 |
| SUM-2627 | 2024-11-08T02:58:00 | 2002007020260 | false | public | 1002 | 3 | 3 |
| SUM-2631 | 2025-04-19T09:15:00 | 255 | true | confidential | 1003 | 4 | 4 |

Each summary carries a `summary_identifier` such as `SUM-2619` or `SUM-2631`, a `creation_date` with full timestamp precision, and a `format_code` that mirrors the corresponding youth's format preference. The `has_records` flag indicates whether substantive clinical documentation exists for the summary. Confidentiality is managed through a three-tier classification: `confidential`, `restricted`, and `public`. The summary links to its owner via `youth_id`, to the responsible organization via `healthcare_facility_id`, and to the governing permission document via `authorization_id`. For example, summary `SUM-2619` belongs to youth `1000`, is managed by facility `1`, and is governed by authorization `1`, while summary `SUM-2627` for youth `1002` carries a `public` confidentiality status and no clinical records.

## Transfer Events

Transfers document the movement of a youth between facilities, capturing both logistical and clinical details of the transition.

**Table `transfer_events`**

| transfer_event_id | transfer_identifier | transfer_date | origin_facility_code | destination_facility_code | has_communicable_disease | youth_id | health_care_summary_format_code | healthcare_facility_id |
|---|---|---|---|---|---|---|---|---|
| 1 | TRA-2375 | 2025-08-12T07:33:00 | 9125639 | 10449530 | false | 1000 | gd_taxp_3 | 1 |
| 2 | TRA-2376 | 2022-01-23T14:50:00 | a854635a-9bad-11eb-a8a2-19ed5c03f8d3 | 1437591 | true | 1001 | 9736899 | 2 |
| 3 | TRA-2377 | 2023-06-07T21:07:00 | 1202-0008-S | 726046 | false | 1002 | 2002007020260 | 3 |
| 4 | TRA-2378 | 2024-11-18T04:24:00 | arc | 15426389 | true | 1003 | 255 | 4 |

Each transfer event has a `transfer_identifier` (e.g., `TRA-2375`, `TRA-2378`) and a `transfer_date` with timestamp precision. The `origin_facility_code` and `destination_facility_code` identify the sending and receiving organizations; these codes may be numeric (`9125639`, `10449530`), UUID-formatted (`a854635a-9bad-11eb-a8a2-19ed5c03f8d3`), alphanumeric (`1202-0008-S`, `arc`), or simple strings. A critical clinical flag, `has_communicable_disease`, signals whether the transferring youth carries a communicable condition—transfer `TRA-2376` and `TRA-2378` both report `true`, while `TRA-2375` and `TRA-2377` report `false`. The event ties to the youth via `youth_id`, to the health care summary format via `health_care_summary_format_code`, and to the receiving facility via `healthcare_facility_id`.

## Release Events

Release events record the conclusion of custodial care and the transition to community or court-supervised settings.

**Table `release_events`**

| release_event_id | release_identifier | release_date | release_type | authorization_obtained | youth_id | health_care_summary_format_code | healthcare_facility_id |
|---|---|---|---|---|---|---|---|
| 100 | REL-2122 | 2022-09-07T20:24:00 | community | false | 1000 | gd_taxp_3 | 1 |
| 101 | REL-2124 | 2023-02-18T03:41:00 | court_ordered | true | 1001 | 9736899 | 2 |
| 102 | REL-2126 | 2024-07-02T10:58:00 | statutory | false | 1002 | 2002007020260 | 3 |
| 103 | REL-2128 | 2025-12-13T17:15:00 | community | true | 1003 | 255 | 4 |

Each release carries a `release_identifier` such as `REL-2122` or `REL-2128`, a `release_date`, and a `release_type` that categorizes the departure: `community`, `court_ordered`, or `statutory`. The `authorization_obtained` flag indicates whether the required consent or legal authorization was secured before release. Release `REL-2124` (youth `1001`) and `REL-2128` (youth `1003`) both show `true` for authorization, while `REL-2122` and `REL-2126` show `false`. The event links to the youth, the applicable health care summary format, and the healthcare facility through `youth_id`, `health_care_summary_format_code`, and `healthcare_facility_id` respectively.

## Healthcare Facilities

The facility registry catalogs the organizations that receive, house, and treat youth within the system.

**Table `healthcare_facilities`**

| id | facility_code | facility_name | facility_type | jurisdiction_code | health_care_summary_format_code | transfer_event_id | is_destination_of_transfer_event_id |
|---|---|---|---|---|---|---|---|
| 1 | 2933476 | Integrated Protocol A | juvenile_facility | 5917299 | gd_taxp_3 | 1 | 1 |
| 2 | Bjuukia | Extended Programme | community_clinic | id_25 | 9736899 | 2 | 2 |
| 3 | 2106693 | Pilot Standard | county_health_officer | 7731856 | 2002007020260 | 3 | 3 |
| 4 | 6969439 | Baseline Framework D | juvenile_facility | 7c692762-8fcd-11eb-924d-9cd76263cbd0 | 255 | 4 | 4 |

Facilities are identified by a numeric or alphanumeric `facility_code` (e.g., `2933476`, `Bjuukia`, `6969439`) and a descriptive `facility_name` such as "Integrated Protocol A" or "Baseline Framework D." The `facility_type` distinguishes between `juvenile_facility`, `community_clinic`, and `county_health_officer` designations. Jurisdiction codes follow the same mixed-format pattern seen in the youth registry. The `health_care_summary_format_code` column specifies the summary format used by that facility. The `transfer_event_id` and `is_destination_of_transfer_event_id` columns link the facility to its role as the receiving end of a transfer; facility `1` ("Integrated Protocol A") is the destination of transfer event `1`, and facility `4` ("Baseline Framework D") is the destination of transfer event `4`.

## Authorizations

Authorizations govern the legal and procedural permissions required for health information sharing and release decisions.

**Table `authorizations`**

| id | authorization_identifier | issue_date | grantor_type | is_court_ordered | status | youth_id | transfer_event_id | release_event_id |
|---|---|---|---|---|---|---|---|---|
| 1 | AUT-2420 | 2023-02-01T13:51:00 | youth | true | pending | 1000 | 1 | 100 |
| 2 | AUT-2423 | 2024-07-12T20:08:00 | parent | false | obtained | 1001 | 2 | 101 |
| 3 | AUT-2426 | 2025-12-23T03:25:00 | legal_guardian | true | waived | 1002 | 3 | 102 |
| 4 | AUT-2429 | 2022-05-07T10:42:00 | youth | false | pending | 1003 | 4 | 103 |

Each authorization has an `authorization_identifier` (e.g., `AUT-2420`, `AUT-2429`), an `issue_date`, and a `grantor_type` indicating who provided consent: `youth`, `parent`, or `legal_guardian`. The `is_court_ordered` flag distinguishes court-mandated authorizations from voluntary ones. The `status` column tracks the authorization lifecycle with values such as `pending`, `obtained`, and `waived`. Authorization `AUT-2420` was granted by the youth themselves, is court-ordered, and remains `pending`; `AUT-2423` was granted by a parent, is not court-ordered, and shows `obtained`; `AUT-2426` was granted by a legal guardian, is court-ordered, and has been `waived`. The authorization links to the youth, the associated transfer event, and the associated release event, forming a bridge between consent and action.

## Youth-Centric Analytical Views

Three views present the system's data from the youth's perspective, joining the youth record with related clinical and movement information.

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

This view joins the youth registry with their health care summary, answering the question: "What clinical record is associated with this youth, and what are its access controls?" For youth `YOU-2285` (id `1000`), the joined row reveals summary `SUM-2619`, created on `2022-01-13`, with `confidential` status and no clinical records (`has_records: false`). For youth `YOU-2287` (id `1002`), the joined row shows summary `SUM-2627` with `public` confidentiality and a format code of `2002007020260`.

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

This view connects each youth to their transfer event, answering: "When and where was this youth transferred, and under what clinical conditions?" Youth `YOU-2286` (id `1001`) appears in transfer `TRA-2376`, which occurred on `2022-01-23` from facility `a854635a-9bad-11eb-a8a2-19ed5c03f8d3` to facility `1437591`, with `has_communicable_disease` set to `true`. Youth `YOU-2288` (id `1003`) appears in transfer `TRA-2378`, occurring on `2024-11-18` from `arc` to `15426389`, also with a communicable disease flag.

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

This view links each youth to their release event, answering: "How and when did this youth leave custody, and was authorization secured?" Youth `YOU-2285` (id `1000`) was released via `REL-2122` on `2022-09-07` under `community` type, with `authorization_obtained` set to `false`. Youth `YOU-2286` (id `1001`) was released via `REL-2124` on `2023-02-18` under `court_ordered` type, with `authorization_obtained` set to `true`.

## Health Care Summary Analytical Views

Three views pivot around the health care summary, connecting it to the youth, the facility, and the authorization.

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

This view joins the health care summary with the youth record, answering: "Which youth does this summary belong to, and what is their current custodial status?" Summary `SUM-2619` joins with youth `YOU-2285` (id `1000`), whose `current_status` is `in_custody` and whose jurisdiction code is `5917299`. Summary `SUM-2627` joins with youth `YOU-2287` (id `1002`), whose `current_status` is `released` and whose jurisdiction code is `7731856`.

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

This view joins the health care summary with the facility, answering: "Which organization manages this summary, and what type of facility is it?" Summary `SUM-2619` joins with facility `1` ("Integrated Protocol A"), a `juvenile_facility` under jurisdiction `5917299`. Summary `SUM-2623` joins with facility `2` ("Extended Programme"), a `community_clinic` under jurisdiction `id_25`.

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

This view joins the health care summary with the authorization, answering: "What permission document governs this summary, and what is its current status?" Summary `SUM-2619` joins with authorization `AUT-2420`, granted by the `youth`, court-ordered, with `pending` status. Summary `SUM-2623` joins with authorization `AUT-2423`, granted by a `parent`, not court-ordered, with `obtained` status.

## Transfer Event Analytical Views

Three views pivot around the transfer event, connecting it to the youth, the health care summary, and the receiving facility.

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

This view joins the transfer event with the youth record, answering: "Which youth was transferred, and what is their current status?" Transfer `TRA-2375` joins with youth `YOU-2285` (id `1000`), currently `in_custody`. Transfer `TRA-2377` joins with youth `YOU-2287` (id `1002`), currently `released`.

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

This view joins the transfer event with the health care summary, answering: "What clinical format and confidentiality classification apply to the youth being transferred?" Transfer `TRA-2375` joins with summary `SUM-2619`, which has format code `gd_taxp_3` and `confidential` status. Transfer `TRA-2376` joins with summary `SUM-2623`, which has format code `9736899` and `restricted` status.

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

This view joins the transfer event with the receiving facility, answering: "Which facility is the destination of this transfer, and what type of organization is it?" Transfer `TRA-2375` joins with facility `1` ("Integrated Protocol A"), a `juvenile_facility`. Transfer `TRA-2378` joins with facility `4` ("Baseline Framework D"), also a `juvenile_facility`.

## Release Event Analytical Views

Three views pivot around the release event, connecting it to the youth, the health care summary, and the facility.

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

This view joins the release event with the youth record, answering: "Which youth was released, and under what custodial status?" Release `REL-2122` joins with youth `YOU-2285` (id `1000`), whose `current_status` is `in_custody`. Release `REL-2126` joins with youth `YOU-2287` (id `1002`), whose `current_status` is `released`.

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

This view joins the release event with the health care summary, answering: "What clinical format and confidentiality classification apply at the time of release?" Release `REL-2122` joins with summary `SUM-2619`, format `gd_taxp_3`, `confidential`. Release `REL-2128` joins with summary `SUM-2631`, format `255`, `confidential`.

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

This view joins the release event with the facility, answering: "Which facility is associated with this release?" Release `REL-2122` joins with facility `1` ("Integrated Protocol A"), a `juvenile_facility`. Release `REL-2124` joins with facility `2` ("Extended Programme"), a `community_clinic`.

## Healthcare Facility Analytical Views

Two views pivot around the facility, connecting it to the health care summaries and transfer events it manages.

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

This view joins the facility with its health care summaries, answering: "Which summaries does this facility manage, and what are their confidentiality levels?" Facility `1` ("Integrated Protocol A") joins with summary `SUM-2619`, which is `confidential` and has no clinical records. Facility `2` ("Extended Programme") joins with summary `SUM-2623`, which is `restricted` and has clinical records.

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

This view joins the facility with the transfer events for which it serves as destination, answering: "Which transfers is this facility the receiving end of, and do any involve communicable disease?" Facility `1` ("Integrated Protocol A") joins with transfer `TRA-2375`, which has `has_communicable_disease` set to `false`. Facility `4` ("Baseline Framework D") joins with transfer `TRA-2378`, which has `has_communicable_disease` set to `true`.

## Authorization Analytical Views

Three views pivot around the authorization, connecting it to the youth, the transfer event, and the release event it governs.

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

This view joins the authorization with the youth record, answering: "Which youth is this authorization for, and what is their current custodial status?" Authorization `AUT-2420` joins with youth `YOU-2285` (id `1000`), currently `in_custody`. Authorization `AUT-2426` joins with youth `YOU-2287` (id `1002`), currently `released`.

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

This view joins the authorization with the transfer event, answering: "Which transfer is this authorization associated with, and does it involve a communicable disease?" Authorization `AUT-2420` joins with transfer `TRA-2375`, which has `has_communicable_disease` set to `false`. Authorization `AUT-2426` joins with transfer `TRA-2377`, which also has `has_communicable_disease` set to `false`.

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

This view joins the authorization with the release event, answering: "Which release is this authorization associated with, and was authorization obtained?" Authorization `AUT-2420` joins with release `REL-2122`, where `authorization_obtained` is `false`. Authorization `AUT-2423` joins with release `REL-2124`, where `authorization_obtained` is `true`.

## Synthesis

The system's six base tables and twenty-one analytical views form a complete operational framework for youth health care administration. The base tables—youths, health care summaries, transfer events, release events, healthcare facilities, and authorizations—capture the core entities and their attributes, from demographic identifiers to clinical flags to legal permissions. The views recombine these entities from multiple perspectives: youth-centric views answer questions about individual care trajectories, summary-centric views reveal the clinical record landscape, event-centric views trace movements and their conditions, facility-centric views expose organizational responsibilities, and authorization-centric views connect consent to action. Together, they enable practitioners to track a youth's journey from intake through transfer and release, ensuring that health information remains accurate, accessible only to authorized parties, and fully auditable at every step.