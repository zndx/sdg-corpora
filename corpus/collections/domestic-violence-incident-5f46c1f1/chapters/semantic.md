The domestic violence incident management domain captures the lifecycle of a reported incident from initial police response through judicial intervention and victim support. At its core, the domain revolves around discrete events—each a `domestic_violence_incidents` record—that bind together a victim, an offender, a police report, and a chain of legal and protective actions. The ontology distinguishes seven principal entity types: incidents, police reports, victims, offenders, legal advocates, protection orders, and prosecutors. Incidents sit at the centre of the model, acting as the hub that connects every other entity through direct foreign keys and through junction tables that enforce many-to-many cardinalities. The relational schema materialises this ontology as eleven base tables and fifteen derived views, each view answering a specific analytical question by joining the normalised tables back into a domain-level fact.

## The incident entity and its direct relationships

The `domestic_violence_incidents` table is the primary fact table. Each row represents a single reported incident and carries a natural `incident_id` (for example, `1336174` or `state_uk_4`), a `report_date` timestamp such as `2024-03-02T02:54:00`, a `severity_level` drawn from the low–medium–high–critical enum, and a `location` string like `extended-location-99`. The `lethality_score` column (e.g. `16.70`, `18.40`, `20.10`, `21.80`) quantifies risk on a continuous scale. Two foreign-key columns, `victim_id` and `offender_id`, reference the natural identifiers in the `victims` and `offenders` tables respectively, while `police_report_id` points to the corresponding row in `police_reports`. The columns `involves_victim_victim_id` and `involves_offender_offender_id` mirror these relationships at the junction-table level, ensuring referential integrity when the many-to-many associations are materialised.

**Table `domestic_violence_incidents`**

| incident_id | report_date | severity_level | location | offender_id | victim_id | police_report_number | lethality_score | police_report_id | involves_victim_victim_id | involves_offender_offender_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1336174 | 2024-03-02T02:54:00 | low | extended-location-99 | 9125616 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | POL-2395 | 16.70 | 100 | 100 | 100 |
| state_uk_4 | 2025-08-13T09:11:00 | medium | integrated-location-100 | 671 | 99669 | POL-2399 | 18.40 | 101 | 101 | 101 |
| 2933483 | 2022-01-24T16:28:00 | high | seasonal-location-101 | 195352 | 1889772 | POL-2403 | 20.10 | 102 | 102 | 102 |
| 2986243 | 2023-06-08T23:45:00 | critical | regional-location-102 | 338522 | 9568439 | POL-2407 | 21.80 | 103 | 103 | 103 |

The `police_reports` table stores the officer-level documentation of each incident. Its surrogate primary key `id` (values `100` through `103`) is distinct from the human-readable `report_id` (e.g. `1202-0008-S`, `8189500`, `L355`). The `officer_id` column (e.g. `103165`, `2933464`) identifies the responding officer, while `incident_id` is a foreign key back to `domestic_violence_incidents.incident_id`. The `status` column tracks the report lifecycle (`pending`, `reviewed`, `submitted`, `archived`), `narrative` holds the free-text account (`legacy-narrativ-31`, `compact-narrativ-32`, `composite-narrativ-33`, `primary-narrativ-34`), and `evidence_collected` is a boolean flag. The `records_incident_incident_id` column is a redundant FK that reinforces the link to the incident fact, and `created_at` records when the report row was inserted.

**Table `police_reports`**

| id | report_id | officer_id | report_date | incident_id | status | narrative | evidence_collected | records_incident_incident_id | created_at |
|---|---|---|---|---|---|---|---|---|---|
| 100 | 1202-0008-S | 103165 | 2024-03-02T02:54:00 | 1336174 | pending | legacy-narrativ-31 | false | 1336174 | 2025-01-01 00:14:00 |
| 101 | 8189500 | 2933464 | 2025-08-13T09:11:00 | state_uk_4 | reviewed | compact-narrativ-32 | true | state_uk_4 | 2025-02-06 03:14:00 |
| 102 | L355 | 10445622 | 2022-01-24T16:28:00 | 2933483 | submitted | composite-narrativ-33 | false | 2933483 | 2025-03-11 06:14:00 |
| 103 | 5844272 | 7441150 | 2023-06-08T23:45:00 | 2986243 | archived | primary-narrativ-34 | true | 2986243 | 2025-04-16 09:14:00 |

## Victim and offender entities

The `victims` table holds demographic and support metadata for each person identified as a victim. The surrogate `id` (100–103) is the primary key; the natural `victim_id` (e.g. the UUID `e29bafe2-8fd1-11eb-924d-9cd76263cbd0` or the integer `99669`) is the business identifier. Columns include `full_name` (e.g. `Theodore Mcgrath`, `Account Name`, `Saipan International Airport`, `Norma Fisher`), `date_of_birth`, `contact_number`, `safety_plan_status` (`active`, `inactive`, `under_review`), `crisis_call_count` (an integer such as `4`, `3`, `13`), `referral_status` (`pending`, `active`, `completed`), and `legal_advocate_id`, a foreign key into `legal_advocates`. The `created_at` and `updated_at` timestamps track the row's lifecycle.

**Table `victims`**

| id | victim_id | full_name | date_of_birth | contact_number | safety_plan_status | crisis_call_count | referral_status | legal_advocate_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|
| 100 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | Theodore Mcgrath | 2025-04-02 | Peter Mcdowell | active | 4 | pending | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 101 | 99669 | Account Name | 2022-09-13 | Sophia Meyer | inactive | 3 | active | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 102 | 1889772 | Saipan International Airport | 2023-02-24 | Carol Gaines | under_review | 13 | completed | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 103 | 9568439 | Norma Fisher | 2024-07-08 | April Snyder | active | 4 | pending | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The `offenders` table mirrors the victim structure with columns `id` (surrogate PK), `offender_id` (natural ID), `full_name`, `date_of_birth`, `criminal_history` (a categorical string such as `extended-criminal-39`, `integrated-criminal-40`, `seasonal-criminal-41`, `regional-criminal-42`), and `accountability_status` (`pending`, `prosecuting`, `convicted`, `acquitted`).

**Table `offenders`**

| id | offender_id | full_name | date_of_birth | criminal_history | accountability_status |
|---|---|---|---|---|---|
| 100 | 9125616 | Theodore Mcgrath | 2025-04-02 | extended-criminal-39 | pending |
| 101 | 671 | Account Name | 2022-09-13 | integrated-criminal-40 | prosecuting |
| 102 | 195352 | Saipan International Airport | 2023-02-24 | seasonal-criminal-41 | convicted |
| 103 | 338522 | Norma Fisher | 2024-07-08 | regional-criminal-42 | acquitted |

## Legal advocates, prosecutors, and protection orders

The `legal_advocates` table stores information about the advocates assigned to victims and protection orders. Its surrogate key is `legal_advocate_id` (1–4), while `advocate_id` is the natural identifier (e.g. `727047`, `4277008`, `10238288`, `template_ivacode_pagata_20det10`). The `full_name` column repeats the name values seen in the victim and offender tables (`Theodore Mcgrath`, `Account Name`, `Saipan International Airport`, `Norma Fisher`). The `education_level` enum (`bachelor`, `master`, `phd`), `on_call_rotation` (`active`, `inactive`), `supervisor_id` (e.g. `account_pymes_255`, `328`, `1996938`, `ChIJIbRFlPtt5kcR5kM81XdpSfI`), and `case_load` (integer counts `23`, `33`, `43`, `53`) describe the advocate's profile. Foreign keys `prosecutor_id` and `protection_order_id` link to the `prosecutors` and `protection_orders` tables respectively.

**Table `legal_advocates`**

| legal_advocate_id | advocate_id | full_name | education_level | on_call_rotation | supervisor_id | case_load | prosecutor_id | protection_order_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 727047 | Theodore Mcgrath | bachelor | active | account_pymes_255 | 23 | 1 | 1000 |
| 2 | 4277008 | Account Name | master | inactive | 328 | 33 | 2 | 1001 |
| 3 | 10238288 | Saipan International Airport | phd | active | 1996938 | 43 | 3 | 1002 |
| 4 | template_ivacode_pagata_20det10 | Norma Fisher | bachelor | inactive | ChIJIbRFlPtt5kcR5kM81XdpSfI | 53 | 4 | 1003 |

The `protection_orders` table records judicial orders issued in connection with incidents. Its surrogate `id` (1000–1003) is the primary key; `order_id` is the natural identifier (e.g. `1030`, `comi`, `state_uk_22`, `99669`). The `issue_date` and `expiration_date` columns define the temporal window of the order, while `order_type` (`temporary`, `permanent`, `emergency`) and `court_case_number` (e.g. `COU-2209`, `COU-2216`, `COU-2223`, `COU-2230`) describe the judicial context. The `status` column (`pending`, `active`, `expired`, `revoked`) tracks the order's current state. Foreign keys `victim_id`, `offender_id`, and `legal_advocate_id` reference the surrogate keys in the `victims`, `offenders`, and `legal_advocates` tables respectively.

**Table `protection_orders`**

| id | order_id | issue_date | expiration_date | order_type | court_case_number | status | victim_id | offender_id | legal_advocate_id | created_at |
|---|---|---|---|---|---|---|---|---|---|---|
| 1000 | 1030 | 2023-02-01T13:51:00 | 2025-08-18T19:45:00 | temporary | COU-2209 | pending | 100 | 100 | 1 | 2025-01-01 00:14:00 |
| 1001 | comi | 2024-07-12T20:08:00 | 2022-01-02T02:02:00 | permanent | COU-2216 | active | 101 | 101 | 2 | 2025-02-06 03:14:00 |
| 1002 | state_uk_22 | 2025-12-23T03:25:00 | 2023-06-13T09:19:00 | emergency | COU-2223 | expired | 102 | 102 | 3 | 2025-03-11 06:14:00 |
| 1003 | 99669 | 2022-05-07T10:42:00 | 2024-11-24T16:36:00 | temporary | COU-2230 | revoked | 103 | 103 | 4 | 2025-04-16 09:14:00 |

The `prosecutors` table stores the legal professionals who oversee cases. Its structure parallels `legal_advocates` with columns `id`, `prosecutor_id`, `full_name`, `education_level`, `on_call_rotation`, `supervisor_id`, `case_load`, `prosecutor_id`, and `protection_order_id`.

**Table `prosecutors`**

| id | prosecutor_id | full_name | case_load | court_assignment | legal_advocate_id |
|---|---|---|---|---|---|
| 1 | lu_tax_code_template_m11 | Theodore Mcgrath | 23 | primary-court-88 | 1 |
| 2 | 8387530 | Account Name | 33 | adaptive-court-89 | 2 |
| 3 | 3744022 | Saipan International Airport | 43 | distributed-court-90 | 3 |
| 4 | 8928501 | Norma Fisher | 53 | baseline-court-91 | 4 |

## Junction tables and many-to-many cardinalities

The domain requires many-to-many relationships between incidents and the people involved. The `victims_incidents` junction table resolves the association between `victims` and `domestic_violence_incidents`, using composite foreign keys `involves_victim_victim_id` and `involves_incident_incident_id` (or equivalent) to enforce referential integrity. Each row in `victims_incidents` asserts that a particular victim was involved in a particular incident.

**Table `victims_incidents`**

| victim_id | incident_id |
|---|---|
| 100 | 1336174 |
| 100 | state_uk_4 |
| 101 | state_uk_4 |
| 101 | 2933483 |
| 102 | 2933483 |
| 102 | 2986243 |
| 103 | 2986243 |
| 103 | 1336174 |

Similarly, the `offenders_incidents` junction table links `offenders` to `domestic_violence_incidents` through columns such as `involves_offender_offender_id` and `involves_incident_incident_id`. This allows a single offender to be associated with multiple incidents and a single incident to involve multiple offenders.

**Table `offenders_incidents`**

| offender_id | incident_id |
|---|---|
| 100 | 1336174 |
| 100 | state_uk_4 |
| 101 | state_uk_4 |
| 101 | 2933483 |
| 102 | 2933483 |
| 102 | 2986243 |
| 103 | 2986243 |
| 103 | 1336174 |

The `advocates_victims` junction table resolves the relationship between `legal_advocates` and `victims`, enabling a single advocate to support multiple victims and a single victim to be supported by multiple advocates over time.

**Table `advocates_victims`**

| legal_advocate_id | victim_id |
|---|---|
| 1 | 100 |
| 1 | 101 |
| 2 | 101 |
| 2 | 102 |
| 3 | 102 |
| 3 | 103 |
| 4 | 103 |
| 4 | 100 |

The `prosecutors_incidents` junction table links `prosecutors` to `domestic_violence_incidents`, allowing a prosecutor to be assigned to multiple cases and a case to be overseen by multiple prosecutors.

**Table `prosecutors_incidents`**

| prosecutor_id | incident_id |
|---|---|
| 1 | 1336174 |
| 1 | state_uk_4 |
| 2 | state_uk_4 |
| 2 | 2933483 |
| 3 | 2933483 |
| 3 | 2986243 |
| 4 | 2986243 |
| 4 | 1336174 |

## View-level reconstruction of domain facts

The fifteen views materialise the normalised schema into analytical surfaces, each answering a specific question by joining the relevant base tables.

The `domestic_violence_incident_police_report_view` joins `domestic_violence_incidents` to `police_reports` on `incident_id` / `police_reports.incident_id`, producing a single row per incident enriched with the report's `report_id`, `officer_id`, `status`, `narrative`, and `evidence_collected`. Reading the first row: incident `1336174` (severity `low`, lethality `16.70`) is linked to report `1202-0008-S` filed by officer `103165`, status `pending`, with `evidence_collected = false`. This view answers the question: "What police report accompanies each incident, and what is its current status?"

**View `domestic_violence_incident_police_report_view`**

```sql
CREATE VIEW domestic_violence_incident_police_report_view AS
SELECT a.incident_id, a.report_date, a.severity_level, a.location, b.id AS report_id, b.report_id AS report_report_id, b.officer_id AS report_officer_id
FROM domestic_violence_incidents a JOIN police_reports b ON a.police_report_id = b.id;
```

| incident_id | report_date | severity_level | location | report_id | report_report_id | report_officer_id |
|---|---|---|---|---|---|---|
| 1336174 | 2024-03-02T02:54:00 | low | extended-location-99 | 100 | 1202-0008-S | 103165 |
| state_uk_4 | 2025-08-13T09:11:00 | medium | integrated-location-100 | 101 | 8189500 | 2933464 |
| 2933483 | 2022-01-24T16:28:00 | high | seasonal-location-101 | 102 | L355 | 10445622 |
| 2986243 | 2023-06-08T23:45:00 | critical | regional-location-102 | 103 | 5844272 | 7441150 |

The `domestic_violence_incident_victim_view` joins incidents to `victims` on `victim_id`, yielding incident-level detail alongside the victim's `full_name`, `safety_plan_status`, `crisis_call_count`, and `referral_status`. The first row shows incident `1336174` involving victim `e29bafe2-8fd1-11eb-924d-9cd76263cbd0` (Theodore Mcgrath), whose safety plan is `active` and who has made `4` crisis calls.

**View `domestic_violence_incident_victim_view`**

```sql
CREATE VIEW domestic_violence_incident_victim_view AS
SELECT a.incident_id, a.report_date, a.severity_level, a.location, b.id AS victim_id, b.victim_id AS victim_victim_id, b.full_name AS victim_full_name
FROM domestic_violence_incidents a JOIN victims b ON a.involves_victim_victim_id = b.id;
```

| incident_id | report_date | severity_level | location | victim_id | victim_victim_id | victim_full_name |
|---|---|---|---|---|---|---|
| 1336174 | 2024-03-02T02:54:00 | low | extended-location-99 | 100 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | Theodore Mcgrath |
| state_uk_4 | 2025-08-13T09:11:00 | medium | integrated-location-100 | 101 | 99669 | Account Name |
| 2933483 | 2022-01-24T16:28:00 | high | seasonal-location-101 | 102 | 1889772 | Saipan International Airport |
| 2986243 | 2023-06-08T23:45:00 | critical | regional-location-102 | 103 | 9568439 | Norma Fisher |

The `domestic_violence_incident_offender_view` joins incidents to `offenders` on `offender_id`, surfacing the offender's `full_name`, `criminal_history`, and `accountability_status` alongside the incident's severity and lethality. Incident `2933483` (severity `high`, lethality `20.10`) is linked to offender `195352` (Saipan International Airport) with `criminal_history = seasonal-criminal-41` and `accountability_status = convicted`.

**View `domestic_violence_incident_offender_view`**

```sql
CREATE VIEW domestic_violence_incident_offender_view AS
SELECT a.incident_id, a.report_date, a.severity_level, a.location, b.id AS offender_id, b.offender_id AS offender_offender_id, b.full_name AS offender_full_name
FROM domestic_violence_incidents a JOIN offenders b ON a.involves_offender_offender_id = b.id;
```

| incident_id | report_date | severity_level | location | offender_id | offender_offender_id | offender_full_name |
|---|---|---|---|---|---|---|
| 1336174 | 2024-03-02T02:54:00 | low | extended-location-99 | 100 | 9125616 | Theodore Mcgrath |
| state_uk_4 | 2025-08-13T09:11:00 | medium | integrated-location-100 | 101 | 671 | Account Name |
| 2933483 | 2022-01-24T16:28:00 | high | seasonal-location-101 | 102 | 195352 | Saipan International Airport |
| 2986243 | 2023-06-08T23:45:00 | critical | regional-location-102 | 103 | 338522 | Norma Fisher |

The `police_report_domestic_violence_incident_view` reverses the join direction, starting from `police_reports` and attaching the incident's `severity_level`, `location`, and `lethality_score`. Report `102` (report ID `L355`, officer `10445622`, status `submitted`) is linked to incident `2933483` with severity `high` and lethality `20.10`. This view answers: "Given a police report, what are the incident's risk characteristics?"

**View `police_report_domestic_violence_incident_view`**

```sql
CREATE VIEW police_report_domestic_violence_incident_view AS
SELECT a.id, a.report_id, a.officer_id, a.report_date, b.incident_id AS incident_incident_id, b.report_date AS incident_report_date, b.severity_level AS incident_severity_level
FROM police_reports a JOIN domestic_violence_incidents b ON a.records_incident_incident_id = b.incident_id;
```

| id | report_id | officer_id | report_date | incident_incident_id | incident_report_date | incident_severity_level |
|---|---|---|---|---|---|---|
| 100 | 1202-0008-S | 103165 | 2024-03-02T02:54:00 | 1336174 | 2024-03-02T02:54:00 | low |
| 101 | 8189500 | 2933464 | 2025-08-13T09:11:00 | state_uk_4 | 2025-08-13T09:11:00 | medium |
| 102 | L355 | 10445622 | 2022-01-24T16:28:00 | 2933483 | 2022-01-24T16:28:00 | high |
| 103 | 5844272 | 7441150 | 2023-06-08T23:45:00 | 2986243 | 2023-06-08T23:45:00 | critical |

The `victim_domestic_violence_incident_detail_view` joins `victims` to `domestic_violence_incidents`, producing a victim-centric view that includes the incident's `severity_level`, `location`, `lethality_score`, and the associated `police_report_number`. Victim `100` (Theodore Mcgrath, safety plan `active`, `4` crisis calls) is linked to incident `1336174` (severity `low`, lethality `16.70`, report `POL-2395`). This view answers: "For each victim, what incidents have they been involved in, and how severe were those incidents?"

**View `victim_domestic_violence_incident_detail_view`**

```sql
CREATE VIEW victim_domestic_violence_incident_detail_view AS
SELECT a.id, a.victim_id, a.full_name, b.incident_id AS incident_incident_id, b.report_date AS incident_report_date, b.severity_level AS incident_severity_level
FROM victims a
  JOIN victims_incidents j ON j.victim_id = a.id
  JOIN domestic_violence_incidents b ON b.incident_id = j.incident_id;
```

| id | victim_id | full_name | incident_incident_id | incident_report_date | incident_severity_level |
|---|---|---|---|---|---|
| 100 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | Theodore Mcgrath | 1336174 | 2024-03-02T02:54:00 | low |
| 100 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | Theodore Mcgrath | state_uk_4 | 2025-08-13T09:11:00 | medium |
| 101 | 99669 | Account Name | state_uk_4 | 2025-08-13T09:11:00 | medium |
| 101 | 99669 | Account Name | 2933483 | 2022-01-24T16:28:00 | high |
| 102 | 1889772 | Saipan International Airport | 2933483 | 2022-01-24T16:28:00 | high |
| 102 | 1889772 | Saipan International Airport | 2986243 | 2023-06-08T23:45:00 | critical |
| 103 | 9568439 | Norma Fisher | 2986243 | 2023-06-08T23:45:00 | critical |
| 103 | 9568439 | Norma Fisher | 1336174 | 2024-03-02T02:54:00 | low |

The `victim_legal_advocate_view` joins `victims` to `legal_advocates` on `victims.legal_advocate_id`, surfacing the advocate's `full_name`, `education_level`, `on_call_rotation`, and `case_load` alongside the victim's `safety_plan_status` and `referral_status`. Victim `100` (Theodore Mcgrath, safety plan `active`) is linked to advocate `1` (Theodore Mcgrath, education `bachelor`, rotation `active`, case load `23`).

**View `victim_legal_advocate_view`**

```sql
CREATE VIEW victim_legal_advocate_view AS
SELECT a.id, a.victim_id, a.full_name, a.date_of_birth, b.legal_advocate_id AS advocate_legal_advocate_id, b.advocate_id AS advocate_advocate_id, b.full_name AS advocate_full_name
FROM victims a JOIN legal_advocates b ON a.legal_advocate_id = b.legal_advocate_id;
```

| id | victim_id | full_name | date_of_birth | advocate_legal_advocate_id | advocate_advocate_id | advocate_full_name |
|---|---|---|---|---|---|---|
| 100 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | Theodore Mcgrath | 2025-04-02 | 1 | 727047 | Theodore Mcgrath |
| 101 | 99669 | Account Name | 2022-09-13 | 2 | 4277008 | Account Name |
| 102 | 1889772 | Saipan International Airport | 2023-02-24 | 3 | 10238288 | Saipan International Airport |
| 103 | 9568439 | Norma Fisher | 2024-07-08 | 4 | template_ivacode_pagata_20det10 | Norma Fisher |

The `offender_domestic_violence_incident_detail_view` joins `offenders` to `domestic_violence_incidents`, producing an offender-centric view with the incident's `severity_level`, `location`, `lethality_score`, and `police_report_number`. Offender `101` (Account Name, criminal history `integrated-criminal-40`, accountability `prosecuting`) is linked to incident `state_uk_4` (severity `medium`, lethality `18.40`, report `POL-2399`).

**View `offender_domestic_violence_incident_detail_view`**

```sql
CREATE VIEW offender_domestic_violence_incident_detail_view AS
SELECT a.id, a.offender_id, a.full_name, b.incident_id AS incident_incident_id, b.report_date AS incident_report_date, b.severity_level AS incident_severity_level
FROM offenders a
  JOIN offenders_incidents j ON j.offender_id = a.id
  JOIN domestic_violence_incidents b ON b.incident_id = j.incident_id;
```

| id | offender_id | full_name | incident_incident_id | incident_report_date | incident_severity_level |
|---|---|---|---|---|---|
| 100 | 9125616 | Theodore Mcgrath | 1336174 | 2024-03-02T02:54:00 | low |
| 100 | 9125616 | Theodore Mcgrath | state_uk_4 | 2025-08-13T09:11:00 | medium |
| 101 | 671 | Account Name | state_uk_4 | 2025-08-13T09:11:00 | medium |
| 101 | 671 | Account Name | 2933483 | 2022-01-24T16:28:00 | high |
| 102 | 195352 | Saipan International Airport | 2933483 | 2022-01-24T16:28:00 | high |
| 102 | 195352 | Saipan International Airport | 2986243 | 2023-06-08T23:45:00 | critical |
| 103 | 338522 | Norma Fisher | 2986243 | 2023-06-08T23:45:00 | critical |
| 103 | 338522 | Norma Fisher | 1336174 | 2024-03-02T02:54:00 | low |

The `legal_advocate_victim_detail_view` joins `legal_advocates` to `victims`, presenting each advocate's caseload alongside the victims they support. Advocate `1` (Theodore Mcgrath, education `bachelor`, case load `23`) is linked to victim `100` (Theodore Mcgrath, safety plan `active`, `4` crisis calls). This view answers: "Which victims is each advocate currently supporting, and what is their safety status?"

**View `legal_advocate_victim_detail_view`**

```sql
CREATE VIEW legal_advocate_victim_detail_view AS
SELECT a.legal_advocate_id, a.advocate_id, a.full_name, b.id AS victim_id, b.victim_id AS victim_victim_id, b.full_name AS victim_full_name
FROM legal_advocates a
  JOIN advocates_victims j ON j.legal_advocate_id = a.legal_advocate_id
  JOIN victims b ON b.id = j.victim_id;
```

| legal_advocate_id | advocate_id | full_name | victim_id | victim_victim_id | victim_full_name |
|---|---|---|---|---|---|
| 1 | 727047 | Theodore Mcgrath | 100 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | Theodore Mcgrath |
| 1 | 727047 | Theodore Mcgrath | 101 | 99669 | Account Name |
| 2 | 4277008 | Account Name | 101 | 99669 | Account Name |
| 2 | 4277008 | Account Name | 102 | 1889772 | Saipan International Airport |
| 3 | 10238288 | Saipan International Airport | 102 | 1889772 | Saipan International Airport |
| 3 | 10238288 | Saipan International Airport | 103 | 9568439 | Norma Fisher |
| 4 | template_ivacode_pagata_20det10 | Norma Fisher | 103 | 9568439 | Norma Fisher |
| 4 | template_ivacode_pagata_20det10 | Norma Fisher | 100 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | Theodore Mcgrath |

The `legal_advocate_prosecutor_view` joins `legal_advocates` to `prosecutors` on `legal_advocates.prosecutor_id`, connecting the support chain from advocate to prosecutor. Advocate `1` (Theodore Mcgrath, case load `23`) is linked to prosecutor `1`. This view answers: "Which prosecutor is overseeing each legal advocate's cases?"

**View `legal_advocate_prosecutor_view`**

```sql
CREATE VIEW legal_advocate_prosecutor_view AS
SELECT a.legal_advocate_id, a.advocate_id, a.full_name, a.education_level, b.id AS prosecutor_id, b.prosecutor_id AS prosecutor_prosecutor_id, b.full_name AS prosecutor_full_name
FROM legal_advocates a JOIN prosecutors b ON a.prosecutor_id = b.id;
```

| legal_advocate_id | advocate_id | full_name | education_level | prosecutor_id | prosecutor_prosecutor_id | prosecutor_full_name |
|---|---|---|---|---|---|---|
| 1 | 727047 | Theodore Mcgrath | bachelor | 1 | lu_tax_code_template_m11 | Theodore Mcgrath |
| 2 | 4277008 | Account Name | master | 2 | 8387530 | Account Name |
| 3 | 10238288 | Saipan International Airport | phd | 3 | 3744022 | Saipan International Airport |
| 4 | template_ivacode_pagata_20det10 | Norma Fisher | bachelor | 4 | 8928501 | Norma Fisher |

The `legal_advocate_protection_order_view` joins `legal_advocates` to `protection_orders` on `legal_advocates.legal_advocate_id`, surfacing the orders each advocate is managing. Advocate `1` (Theodore Mcgrath, case load `23`) is linked to protection order `1000` (order ID `1030`, type `temporary`, status `pending`, issued `2023-02-01`).

**View `legal_advocate_protection_order_view`**

```sql
CREATE VIEW legal_advocate_protection_order_view AS
SELECT a.legal_advocate_id, a.advocate_id, a.full_name, a.education_level, b.id AS order_id, b.order_id AS order_order_id, b.issue_date AS order_issue_date
FROM legal_advocates a JOIN protection_orders b ON a.protection_order_id = b.id;
```

| legal_advocate_id | advocate_id | full_name | education_level | order_id | order_order_id | order_issue_date |
|---|---|---|---|---|---|---|
| 1 | 727047 | Theodore Mcgrath | bachelor | 1000 | 1030 | 2023-02-01T13:51:00 |
| 2 | 4277008 | Account Name | master | 1001 | comi | 2024-07-12T20:08:00 |
| 3 | 10238288 | Saipan International Airport | phd | 1002 | state_uk_22 | 2025-12-23T03:25:00 |
| 4 | template_ivacode_pagata_20det10 | Norma Fisher | bachelor | 1003 | 99669 | 2022-05-07T10:42:00 |

The `protection_order_victim_view` joins `protection_orders` to `victims` on `protection_orders.victim_id`, answering: "Which victim is each protection order intended to protect?" Order `1000` (temporary, status `pending`, court case `COU-2209`) is linked to victim `100` (Theodore Mcgrath, safety plan `active`).

**View `protection_order_victim_view`**

```sql
CREATE VIEW protection_order_victim_view AS
SELECT a.id, a.order_id, a.issue_date, a.expiration_date, b.id AS victim_id, b.victim_id AS victim_victim_id, b.full_name AS victim_full_name
FROM protection_orders a JOIN victims b ON a.victim_id = b.id;
```

| id | order_id | issue_date | expiration_date | victim_id | victim_victim_id | victim_full_name |
|---|---|---|---|---|---|---|
| 1000 | 1030 | 2023-02-01T13:51:00 | 2025-08-18T19:45:00 | 100 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | Theodore Mcgrath |
| 1001 | comi | 2024-07-12T20:08:00 | 2022-01-02T02:02:00 | 101 | 99669 | Account Name |
| 1002 | state_uk_22 | 2025-12-23T03:25:00 | 2023-06-13T09:19:00 | 102 | 1889772 | Saipan International Airport |
| 1003 | 99669 | 2022-05-07T10:42:00 | 2024-11-24T16:36:00 | 103 | 9568439 | Norma Fisher |

The `protection_order_offender_view` joins `protection_orders` to `offenders` on `protection_orders.offender_id`, identifying the restrained party. Order `1001` (permanent, status `active`, court case `COU-2216`) is linked to offender `101` (Account Name, accountability `prosecuting`).

**View `protection_order_offender_view`**

```sql
CREATE VIEW protection_order_offender_view AS
SELECT a.id, a.order_id, a.issue_date, a.expiration_date, b.id AS offender_id, b.offender_id AS offender_offender_id, b.full_name AS offender_full_name
FROM protection_orders a JOIN offenders b ON a.offender_id = b.id;
```

| id | order_id | issue_date | expiration_date | offender_id | offender_offender_id | offender_full_name |
|---|---|---|---|---|---|---|
| 1000 | 1030 | 2023-02-01T13:51:00 | 2025-08-18T19:45:00 | 100 | 9125616 | Theodore Mcgrath |
| 1001 | comi | 2024-07-12T20:08:00 | 2022-01-02T02:02:00 | 101 | 671 | Account Name |
| 1002 | state_uk_22 | 2025-12-23T03:25:00 | 2023-06-13T09:19:00 | 102 | 195352 | Saipan International Airport |
| 1003 | 99669 | 2022-05-07T10:42:00 | 2024-11-24T16:36:00 | 103 | 338522 | Norma Fisher |

The `protection_order_legal_advocate_view` joins `protection_orders` to `legal_advocates` on `protection_orders.legal_advocate_id`, showing which advocate is assigned to each order. Order `1002` (emergency, status `expired`, court case `COU-2223`) is linked to advocate `3` (Saipan International Airport, education `phd`, case load `43`).

**View `protection_order_legal_advocate_view`**

```sql
CREATE VIEW protection_order_legal_advocate_view AS
SELECT a.id, a.order_id, a.issue_date, a.expiration_date, b.legal_advocate_id AS advocate_legal_advocate_id, b.advocate_id AS advocate_advocate_id, b.full_name AS advocate_full_name
FROM protection_orders a JOIN legal_advocates b ON a.legal_advocate_id = b.legal_advocate_id;
```

| id | order_id | issue_date | expiration_date | advocate_legal_advocate_id | advocate_advocate_id | advocate_full_name |
|---|---|---|---|---|---|---|
| 1000 | 1030 | 2023-02-01T13:51:00 | 2025-08-18T19:45:00 | 1 | 727047 | Theodore Mcgrath |
| 1001 | comi | 2024-07-12T20:08:00 | 2022-01-02T02:02:00 | 2 | 4277008 | Account Name |
| 1002 | state_uk_22 | 2025-12-23T03:25:00 | 2023-06-13T09:19:00 | 3 | 10238288 | Saipan International Airport |
| 1003 | 99669 | 2022-05-07T10:42:00 | 2024-11-24T16:36:00 | 4 | template_ivacode_pagata_20det10 | Norma Fisher |

The `prosecutor_domestic_violence_incident_detail_view` joins `prosecutors` to `domestic_violence_incidents` (typically via the `prosecutors_incidents` junction table), producing a prosecutor-centric view of the incidents they oversee. Prosecutor `1` is linked to incident `1336174` (severity `low`, lethality `16.70`). This view answers: "For each prosecutor, what incidents are under their legal supervision, and how severe are they?"

**View `prosecutor_domestic_violence_incident_detail_view`**

```sql
CREATE VIEW prosecutor_domestic_violence_incident_detail_view AS
SELECT a.id, a.prosecutor_id, a.full_name, b.incident_id AS incident_incident_id, b.report_date AS incident_report_date, b.severity_level AS incident_severity_level
FROM prosecutors a
  JOIN prosecutors_incidents j ON j.prosecutor_id = a.id
  JOIN domestic_violence_incidents b ON b.incident_id = j.incident_id;
```

| id | prosecutor_id | full_name | incident_incident_id | incident_report_date | incident_severity_level |
|---|---|---|---|---|---|
| 1 | lu_tax_code_template_m11 | Theodore Mcgrath | 1336174 | 2024-03-02T02:54:00 | low |
| 1 | lu_tax_code_template_m11 | Theodore Mcgrath | state_uk_4 | 2025-08-13T09:11:00 | medium |
| 2 | 8387530 | Account Name | state_uk_4 | 2025-08-13T09:11:00 | medium |
| 2 | 8387530 | Account Name | 2933483 | 2022-01-24T16:28:00 | high |
| 3 | 3744022 | Saipan International Airport | 2933483 | 2022-01-24T16:28:00 | high |
| 3 | 3744022 | Saipan International Airport | 2986243 | 2023-06-08T23:45:00 | critical |
| 4 | 8928501 | Norma Fisher | 2986243 | 2023-06-08T23:45:00 | critical |
| 4 | 8928501 | Norma Fisher | 1336174 | 2024-03-02T02:54:00 | low |

The `prosecutor_legal_advocate_view` joins `prosecutors` to `legal_advocates` on `prosecutors.id = legal_advocates.prosecutor_id`, completing the support chain from prosecutor through advocate to victim. Prosecutor `1` is linked to advocate `1` (Theodore Mcgrath, case load `23`). This view answers: "Which advocates report to each prosecutor, and what is their current workload?"

**View `prosecutor_legal_advocate_view`**

```sql
CREATE VIEW prosecutor_legal_advocate_view AS
SELECT a.id, a.prosecutor_id, a.full_name, a.case_load, b.legal_advocate_id AS advocate_legal_advocate_id, b.advocate_id AS advocate_advocate_id, b.full_name AS advocate_full_name
FROM prosecutors a JOIN legal_advocates b ON a.legal_advocate_id = b.legal_advocate_id;
```

| id | prosecutor_id | full_name | case_load | advocate_legal_advocate_id | advocate_advocate_id | advocate_full_name |
|---|---|---|---|---|---|---|
| 1 | lu_tax_code_template_m11 | Theodore Mcgrath | 23 | 1 | 727047 | Theodore Mcgrath |
| 2 | 8387530 | Account Name | 33 | 2 | 4277008 | Account Name |
| 3 | 3744022 | Saipan International Airport | 43 | 3 | 10238288 | Saipan International Airport |
| 4 | 8928501 | Norma Fisher | 53 | 4 | template_ivacode_pagata_20det10 | Norma Fisher |

## Synthesis

The relational schema faithfully materialises the domestic violence incident management ontology. The `domestic_violence_incidents` table serves as the central fact, with direct foreign keys to `police_reports`, `victims`, and `offenders`, and indirect many-to-many associations resolved through the junction tables `victims_incidents`, `offenders_incidents`, `advocates_victims`, and `prosecutors_incidents`. The `legal_advocates`, `protection_orders`, and `prosecutors` tables form the judicial and support layer, linked to incidents through the people they serve. The fifteen views reconstruct domain-level facts by joining these normalised tables, each view answering a specific question—from "What police report accompanies this incident?" to "Which victims is each advocate supporting?"—enabling analysts and practitioners to query the data at the appropriate level of abstraction without manually writing joins. The schema's design ensures that every analytical surface can be traced back to its constituent base tables, preserving referential integrity while providing flexible, question-driven access to the data.