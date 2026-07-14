## Corporate Governance as a Normalised Relational Model

Corporate governance in a joint-stock company is a web of interlocking obligations: shareholders own shares, board members preside over meetings, nomination committees oversee governance, and resolutions formalise the decisions reached at annual general meetings. The domain model captures these relationships through six base tables and a suite of materialised views that reconstruct the full picture from normalised rows. Every table is keyed on a surrogate `id` (or a compound surrogate such as `nomination_committee_id`), and foreign-key columns thread the entities together so that a single domain fact—*which shareholder attended which meeting and under which resolution*—can be recovered by a deterministic join.

**Table `shares`**

| id | identifier | nominal_value | voting_rights | issuance_date | current_status | shareholder_id |
|---|---|---|---|---|---|---|
| 100 | IDE-2086 | 22.70 | 12 | 2022-01-17 | issued | 1 |
| 101 | IDE-2091 | 26.40 | 16 | 2023-06-01 | treasury | 2 |
| 102 | IDE-2096 | 30.10 | 20 | 2024-11-12 | cancelled | 3 |
| 103 | IDE-2101 | 33.80 | 24 | 2025-04-23 | issued | 4 |

The `shares` table is the atomic unit of equity. Each row represents a single share instrument, identified by a synthetic primary key `id` and a business-level `identifier` such as `IDE-2086` or `IDE-2101`. The column `nominal_value` records the face value of the share (22.70, 26.40, 30.10, 33.80), while `voting_rights` quantifies the voting weight attached to that share (12, 16, 20, 24). The `issuance_date` anchors the share in time, and `current_status` constrains the share to one of three states: `issued`, `treasury`, or `cancelled`. The foreign key `shareholder_id` binds the share to its owner in the `shareholders` table, establishing a many-to-one cardinality: many shares may belong to one shareholder, but each share row points to exactly one shareholder.

**Table `shareholders`**

| shareholder_id | identifier | legal_name | shareholder_type | registration_date | is_proxy_holder | share_id | annual_general_meeting_id |
|---|---|---|---|---|---|---|---|
| 1 | IDE-2086 | Jorge Sullivan | individual | 2023-06-19 | Fredrik Backman | 100 | 1 |
| 2 | IDE-2091 | Walter Pratt | institutional | 2024-11-03 | Janice Johnston | 101 | 2 |
| 3 | IDE-2096 | Home Medix Oxygen | foreign | 2025-04-14 | Jorge Sullivan | 102 | 3 |
| 4 | IDE-2101 | Hector Garcia | individual | 2022-09-25 | Laurie Wallace | 103 | 4 |

The `shareholders` table stores the legal entities that hold shares. Its primary key is `shareholder_id`, and each row carries a business identifier (`IDE-2086` through `IDE-2101`), a `legal_name` (Jorge Sullivan, Walter Pratt, Home Medix Oxygen, Hector Garcia), and a `shareholder_type` that classifies the holder as `individual`, `institutional`, or `foreign`. The `registration_date` records when the shareholder was entered into the register, and `is_proxy_holder`—despite its boolean name—stores a free-text proxy-holder name (Fredrik Backman, Janice Johnston, Jorge Sullivan, Laurie Wallace), reflecting a modelling choice where the column is nullable and populated only when a proxy arrangement exists. The foreign key `share_id` points back to `shares.id`, creating the inverse of the `shares.shareholder_id` relationship: from the shareholder's perspective, the row tells which share it holds. The column `annual_general_meeting_id` links the shareholder to a specific meeting, enabling a direct many-to-one association between shareholders and the meetings they attend.

**Table `annual_general_meetings`**

| id | meeting_id | scheduled_date | actual_date | location | quorum_met | total_shares_represented | attendee_count | board_member_id | nomination_committee_id | resolution_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 20967529 | 2024-11-27T22:18:00 | 2025-12-19T11:57:00 | extended-location-99 | false | 6 | 6 | 1 | 1 | 1000 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | ChIJd13ymnZu5kcRXM7jx5boJBs | 2025-04-11T05:35:00 | 2022-05-03T18:14:00 | integrated-location-100 | true | 15 | 23 | 2 | 2 | 1001 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | gd_acc_763000 | 2022-09-22T12:52:00 | 2023-10-14T01:31:00 | seasonal-location-101 | false | 75 | 0 | 3 | 3 | 1002 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | 922ad118-9bad-11eb-a8a2-19ed5c03f8d3 | 2023-02-06T19:09:00 | 2024-03-25T08:48:00 | regional-location-102 | true | 179 | 32 | 4 | 4 | 1003 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The `annual_general_meetings` table is the central hub of the model. Each meeting is identified by a synthetic `id` and a business-level `meeting_id` that varies in format: numeric (`20967529`), Google Place ID-style (`ChIJd13ymnZu5kcRXM7jx5boJBs`), prefixed (`gd_acc_763000`), or UUID (`922ad118-9bad-11eb-a8a2-19ed5c03f8d3`). The `scheduled_date` and `actual_date` capture the planned and realised timestamps; note that in the data the actual date may precede the scheduled date, reflecting rescheduling. The `location` column stores a descriptive string (e.g. `extended-location-99`), while `quorum_met` is a boolean indicating whether the meeting achieved the required quorum. The integer columns `total_shares_represented` and `attendee_count` quantify the meeting's scope (6 shares and 6 attendees for meeting 1; 179 shares and 32 attendees for meeting 4). Three foreign-key columns—`board_member_id`, `nomination_committee_id`, and `resolution_id`—tie the meeting to its presiding board member, its overseeing nomination committee, and the resolution it passed, respectively. The audit columns `created_at` and `updated_at` record the lifecycle of the meeting row.

**Table `board_members`**

| id | member_id | full_name | appointment_date | term_end_date | is_chairman | fee_amount | payment_method | annual_general_meeting_id | resolution_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 10207158 | Theodore Mcgrath | 2022-05-03 | 2025-08-24 | true | 38.08 | direct | 1 | 1000 |
| 2 | 10207158 | Account Name | 2023-10-14 | 2022-01-08 | false | 18.47 | via_company | 2 | 1001 |
| 3 | 25820616 | Saipan International Airport | 2024-03-25 | 2023-06-19 | true | 38.08 | direct | 3 | 1002 |
| 4 | 2002007020250 | Norma Fisher | 2025-08-09 | 2024-11-03 | false | 26.25 | via_company | 4 | 1003 |

The `board_members` table records the individuals (or entities) serving on the board. Its primary key is `id`, and each row carries a business-level `member_id` (10207158, 25820616, 2002007020250), a `full_name` (Theodore Mcgrath, Account Name, Saipan International Airport, Norma Fisher), and the dates `appointment_date` and `term_end_date`. The boolean `is_chairman` flags the chair of the board. The `fee_amount` column stores the board member's remuneration (38.08, 18.47, 26.25), and `payment_method` constrains the value to `direct` or `via_company`. The foreign key `annual_general_meeting_id` links the board member to the meeting they preside over, and `resolution_id` links them to the resolution they presented or are associated with.

**Table `nomination_committees`**

| nomination_committee_id | committee_id | charter_version | min_members | max_members | chairman_id | annual_general_meeting_id | resolution_id |
|---|---|---|---|---|---|---|---|
| 1 | PHR-98 | legacy-charter-19 | 38 | 16 | default_chart_a_tax_19 | 1 | 1000 |
| 2 | L785 | compact-charter-20 | 41 | 23 | gd_taxc_1122 | 2 | 1001 |
| 3 | 7119774 | composite-charter-21 | 44 | 30 | 168551 | 3 | 1002 |
| 4 | 1186094 | primary-charter-22 | 47 | 37 | 5082968 | 4 | 1003 |

The `nomination_committees` table captures the governance committees responsible for nominating board members. Its primary key is `nomination_committee_id`, and each row carries a business-level `committee_id` (PHR-98, L785, 7119774, 1186094), a `charter_version` (legacy-charter-19 through primary-charter-22), and cardinality bounds `min_members` and `max_members` that constrain the committee's size (e.g. 38–16 for committee 1, 47–37 for committee 4). The `chairman_id` stores the identifier of the committee chair (default_chart_a_tax_19, gd_taxc_1122, 168551, 5082968). The foreign keys `annual_general_meeting_id` and `resolution_id` tie the committee to the meeting it oversees and the resolution it is associated with.

**Table `resolutions`**

| id | resolution_id | pass_date | resolution_type | amount | currency | is_published | annual_general_meeting_id | shareholder_id | board_member_id |
|---|---|---|---|---|---|---|---|---|---|
| 1000 | 9085246 | 2024-11-13T22:18:00 | dividend | 13.49 | seasonal-currency-71 | true | 1 | 1 | 1 |
| 1001 | gd_acc_120000 | 2025-04-24T05:35:00 | fee | 25.47 | regional-currency-72 | false | 2 | 2 | 2 |
| 1002 | 16587506 | 2022-09-08T12:52:00 | appointment | 19.72 | legacy-currency-73 | true | 3 | 3 | 3 |
| 1003 | 9736899 | 2023-02-19T19:09:00 | discharge | 12.74 | compact-currency-74 | false | 4 | 4 | 4 |

The `resolutions` table formalises the decisions passed at annual general meetings. Its primary key is `id`, and each row carries a business-level `resolution_id` (9085246, gd_acc_120000, 16587506, 9736899), a `pass_date`, and a `resolution_type` that constrains the value to one of four categories: `dividend`, `fee`, `appointment`, or `discharge`. The `amount` column stores the monetary value of the resolution (13.49, 25.47, 19.72, 12.74), and `currency` stores a descriptive currency string (seasonal-currency-71, regional-currency-72, legacy-currency-73, compact-currency-74). The boolean `is_published` indicates whether the resolution has been made public. The foreign key `annual_general_meeting_id` links the resolution to the meeting that passed it, while `shareholder_id` and `board_member_id` link it to the shareholder who proposed it and the board member who presented it.

**Table `meetings_shareholders`**

| annual_general_meeting_id | shareholder_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

The `meetings_shareholders` table is the junction table that resolves the many-to-many relationship between shareholders and annual general meetings. While the `shareholders` table carries a direct `annual_general_meeting_id` foreign key, the junction table provides an explicit association layer that can record additional metadata about each attendance relationship—such as proxy authorisation, voting instructions, or attendance timestamp—without altering the core entity tables. In the current data, each shareholder is associated with exactly one meeting, but the junction table's existence signals the schema's capacity to support multiple meetings per shareholder and multiple shareholders per meeting.

The base tables above form a star-like topology with `annual_general_meetings` at the centre. Every other entity table carries at least one foreign key pointing to `annual_general_meetings.id`, and several tables also carry foreign keys pointing to each other (e.g. `resolutions` links to both `shareholders` and `board_members`). This design normalises the data to third normal form while preserving the ability to reconstruct any domain fact through a deterministic set of joins. The views materialise these joins as named queries, each answering a specific question about the governance landscape.

**View `vw_share_shareholder`**

```sql
CREATE VIEW vw_share_shareholder AS
SELECT a.id, a.identifier, a.nominal_value, a.voting_rights, b.shareholder_id AS shareholder_shareholder_id, b.identifier AS shareholder_identifier, b.legal_name AS shareholder_legal_name
FROM shares a JOIN shareholders b ON a.shareholder_id = b.shareholder_id;
```

| id | identifier | nominal_value | voting_rights | shareholder_shareholder_id | shareholder_identifier | shareholder_legal_name |
|---|---|---|---|---|---|---|
| 100 | IDE-2086 | 22.70 | 12 | 1 | IDE-2086 | Jorge Sullivan |
| 101 | IDE-2091 | 26.40 | 16 | 2 | IDE-2091 | Walter Pratt |
| 102 | IDE-2096 | 30.10 | 20 | 3 | IDE-2096 | Home Medix Oxygen |
| 103 | IDE-2101 | 33.80 | 24 | 4 | IDE-2101 | Hector Garcia |

The view `vw_share_shareholder` answers the question: *which shareholder owns which share, and what are the share's financial attributes?* It joins `shares` to `shareholders` on `shares.shareholder_id = shareholders.shareholder_id`, producing a row that combines the share's `identifier`, `nominal_value`, `voting_rights`, and `current_status` with the shareholder's `legal_name` and `shareholder_type`. For example, the row for share `IDE-2086` (nominal value 22.70, 12 voting rights, status `issued`) is paired with shareholder Jorge Sullivan, an `individual` registered on 2023-06-19. The view makes it possible to query equity ownership without writing a join.

**View `vw_shareholder_share`**

```sql
CREATE VIEW vw_shareholder_share AS
SELECT a.shareholder_id, a.identifier, a.legal_name, a.shareholder_type, b.id AS share_id, b.identifier AS share_identifier, b.nominal_value AS share_nominal_value
FROM shareholders a JOIN shares b ON a.share_id = b.id;
```

| shareholder_id | identifier | legal_name | shareholder_type | share_id | share_identifier | share_nominal_value |
|---|---|---|---|---|---|---|
| 1 | IDE-2086 | Jorge Sullivan | individual | 100 | IDE-2086 | 22.70 |
| 2 | IDE-2091 | Walter Pratt | institutional | 101 | IDE-2091 | 26.40 |
| 3 | IDE-2096 | Home Medix Oxygen | foreign | 102 | IDE-2096 | 30.10 |
| 4 | IDE-2101 | Hector Garcia | individual | 103 | IDE-2101 | 33.80 |

The view `vw_shareholder_share` inverts the perspective: *which share does a given shareholder hold, and what are the shareholder's details?* It performs the same join as `vw_share_shareholder` but presents the columns in shareholder-first order. The row for Walter Pratt (shareholder `IDE-2091`, type `institutional`) shows the associated share `IDE-2091` with nominal value 26.40, 16 voting rights, and status `treasury`. This view is useful when the query starts from the shareholder entity and needs to enumerate their holdings.

**View `vw_shareholder_annual_general_meeting`**

```sql
CREATE VIEW vw_shareholder_annual_general_meeting AS
SELECT a.shareholder_id, a.identifier, a.legal_name, a.shareholder_type, b.id AS meeting_id, b.meeting_id AS meeting_meeting_id, b.scheduled_date AS meeting_scheduled_date
FROM shareholders a JOIN annual_general_meetings b ON a.annual_general_meeting_id = b.id;
```

| shareholder_id | identifier | legal_name | shareholder_type | meeting_id | meeting_meeting_id | meeting_scheduled_date |
|---|---|---|---|---|---|---|
| 1 | IDE-2086 | Jorge Sullivan | individual | 1 | 20967529 | 2024-11-27T22:18:00 |
| 2 | IDE-2091 | Walter Pratt | institutional | 2 | ChIJd13ymnZu5kcRXM7jx5boJBs | 2025-04-11T05:35:00 |
| 3 | IDE-2096 | Home Medix Oxygen | foreign | 3 | gd_acc_763000 | 2022-09-22T12:52:00 |
| 4 | IDE-2101 | Hector Garcia | individual | 4 | 922ad118-9bad-11eb-a8a2-19ed5c03f8d3 | 2023-02-06T19:09:00 |

The view `vw_shareholder_annual_general_meeting` answers: *which shareholders attended which annual general meeting, and what were the meeting's logistics?* It joins `shareholders` to `annual_general_meetings` on `shareholders.annual_general_meeting_id = annual_general_meetings.id`, producing rows that combine the shareholder's `legal_name` and `shareholder_type` with the meeting's `meeting_id`, `scheduled_date`, `actual_date`, `location`, `quorum_met`, `total_shares_represented`, and `attendee_count`. For instance, Hector Garcia (shareholder `IDE-2101`, type `individual`) is linked to meeting `922ad118-9bad-11eb-a8a2-19ed5c03f8d3`, scheduled for 2023-02-06, held at `regional-location-102`, with quorum met (`true`), 179 shares represented, and 32 attendees. This view reconstructs the attendance record from the normalised tables.

**View `vw_annual_general_meeting_board_member`**

```sql
CREATE VIEW vw_annual_general_meeting_board_member AS
SELECT a.id, a.meeting_id, a.scheduled_date, a.actual_date, b.id AS member_id, b.member_id AS member_member_id, b.full_name AS member_full_name
FROM annual_general_meetings a JOIN board_members b ON a.board_member_id = b.id;
```

| id | meeting_id | scheduled_date | actual_date | member_id | member_member_id | member_full_name |
|---|---|---|---|---|---|---|
| 1 | 20967529 | 2024-11-27T22:18:00 | 2025-12-19T11:57:00 | 1 | 10207158 | Theodore Mcgrath |
| 2 | ChIJd13ymnZu5kcRXM7jx5boJBs | 2025-04-11T05:35:00 | 2022-05-03T18:14:00 | 2 | 10207158 | Account Name |
| 3 | gd_acc_763000 | 2022-09-22T12:52:00 | 2023-10-14T01:31:00 | 3 | 25820616 | Saipan International Airport |
| 4 | 922ad118-9bad-11eb-a8a2-19ed5c03f8d3 | 2023-02-06T19:09:00 | 2024-03-25T08:48:00 | 4 | 2002007020250 | Norma Fisher |

The view `vw_annual_general_meeting_board_member` answers: *which board member presided over which annual general meeting, and what are their terms and remuneration?* It joins `annual_general_meetings` to `board_members` on `annual_general_meetings.board_member_id = board_members.id`. The row for meeting 1 (meeting_id `20967529`, location `extended-location-99`, quorum not met) is paired with board member Theodore Mcgrath (member_id `10207158`, chairman `true`, fee 38.08, payment `direct`), appointed on 2022-05-03 with term ending 2025-08-24. The row for meeting 3 (meeting_id `gd_acc_763000`, quorum not met) is paired with Saipan International Airport (member_id `25820616`, chairman `true`, fee 38.08, payment `direct`), illustrating that board members can be legal entities as well as natural persons.

**View `vw_annual_general_meeting_nomination_committee`**

```sql
CREATE VIEW vw_annual_general_meeting_nomination_committee AS
SELECT a.id, a.meeting_id, a.scheduled_date, a.actual_date, b.nomination_committee_id AS committee_nomination_committee_id, b.committee_id AS committee_committee_id, b.charter_version AS committee_charter_version
FROM annual_general_meetings a JOIN nomination_committees b ON a.nomination_committee_id = b.nomination_committee_id;
```

| id | meeting_id | scheduled_date | actual_date | committee_nomination_committee_id | committee_committee_id | committee_charter_version |
|---|---|---|---|---|---|---|
| 1 | 20967529 | 2024-11-27T22:18:00 | 2025-12-19T11:57:00 | 1 | PHR-98 | legacy-charter-19 |
| 2 | ChIJd13ymnZu5kcRXM7jx5boJBs | 2025-04-11T05:35:00 | 2022-05-03T18:14:00 | 2 | L785 | compact-charter-20 |
| 3 | gd_acc_763000 | 2022-09-22T12:52:00 | 2023-10-14T01:31:00 | 3 | 7119774 | composite-charter-21 |
| 4 | 922ad118-9bad-11eb-a8a2-19ed5c03f8d3 | 2023-02-06T19:09:00 | 2024-03-25T08:48:00 | 4 | 1186094 | primary-charter-22 |

The view `vw_annual_general_meeting_nomination_committee` answers: *which nomination committee oversaw which annual general meeting, and what are the committee's charter and size constraints?* It joins `annual_general_meetings` to `nomination_committees` on `annual_general_meetings.nomination_committee_id = nomination_committees.nomination_committee_id`. For meeting 2 (meeting_id `ChIJd13ymnZu5kcRXM7jx5boJBs`, quorum met, 15 shares represented, 23 attendees), the view surfaces nomination committee `L785` with charter version `compact-charter-20`, minimum 41 members, maximum 23 members, and chairman `gd_taxc_1122`. The view makes it possible to audit whether committee compositions comply with their charters.

**View `vw_annual_general_meeting_resolution`**

```sql
CREATE VIEW vw_annual_general_meeting_resolution AS
SELECT a.id, a.meeting_id, a.scheduled_date, a.actual_date, b.id AS resolution_id, b.resolution_id AS resolution_resolution_id, b.pass_date AS resolution_pass_date
FROM annual_general_meetings a JOIN resolutions b ON a.resolution_id = b.id;
```

| id | meeting_id | scheduled_date | actual_date | resolution_id | resolution_resolution_id | resolution_pass_date |
|---|---|---|---|---|---|---|
| 1 | 20967529 | 2024-11-27T22:18:00 | 2025-12-19T11:57:00 | 1000 | 9085246 | 2024-11-13T22:18:00 |
| 2 | ChIJd13ymnZu5kcRXM7jx5boJBs | 2025-04-11T05:35:00 | 2022-05-03T18:14:00 | 1001 | gd_acc_120000 | 2025-04-24T05:35:00 |
| 3 | gd_acc_763000 | 2022-09-22T12:52:00 | 2023-10-14T01:31:00 | 1002 | 16587506 | 2022-09-08T12:52:00 |
| 4 | 922ad118-9bad-11eb-a8a2-19ed5c03f8d3 | 2023-02-06T19:09:00 | 2024-03-25T08:48:00 | 1003 | 9736899 | 2023-02-19T19:09:00 |

The view `vw_annual_general_meeting_resolution` answers: *which resolution was passed at which annual general meeting, and what are the resolution's financial and publication details?* It joins `annual_general_meetings` to `resolutions` on `annual_general_meetings.resolution_id = resolutions.id`. For meeting 1 (meeting_id `20967529`, quorum not met), the view surfaces resolution 1000 (resolution_id `9085246`, type `dividend`, amount 13.49, currency `seasonal-currency-71`, published `true`), passed on 2024-11-13. For meeting 4 (meeting_id `922ad118-9bad-11eb-a8a2-19ed5c03f8d3`, quorum met), the view surfaces resolution 1003 (resolution_id `9736899`, type `discharge`, amount 12.74, currency `compact-currency-74`, published `false`), passed on 2023-02-19. This view is the primary query surface for meeting-level decision records.

**View `vw_annual_general_meeting_shareholder_detail`**

```sql
CREATE VIEW vw_annual_general_meeting_shareholder_detail AS
SELECT a.id, a.meeting_id, a.scheduled_date, b.shareholder_id AS shareholder_shareholder_id, b.identifier AS shareholder_identifier, b.legal_name AS shareholder_legal_name
FROM annual_general_meetings a
  JOIN meetings_shareholders j ON j.annual_general_meeting_id = a.id
  JOIN shareholders b ON b.shareholder_id = j.shareholder_id;
```

| id | meeting_id | scheduled_date | shareholder_shareholder_id | shareholder_identifier | shareholder_legal_name |
|---|---|---|---|---|---|
| 1 | 20967529 | 2024-11-27T22:18:00 | 1 | IDE-2086 | Jorge Sullivan |
| 1 | 20967529 | 2024-11-27T22:18:00 | 2 | IDE-2091 | Walter Pratt |
| 2 | ChIJd13ymnZu5kcRXM7jx5boJBs | 2025-04-11T05:35:00 | 2 | IDE-2091 | Walter Pratt |
| 2 | ChIJd13ymnZu5kcRXM7jx5boJBs | 2025-04-11T05:35:00 | 3 | IDE-2096 | Home Medix Oxygen |
| 3 | gd_acc_763000 | 2022-09-22T12:52:00 | 3 | IDE-2096 | Home Medix Oxygen |
| 3 | gd_acc_763000 | 2022-09-22T12:52:00 | 4 | IDE-2101 | Hector Garcia |
| 4 | 922ad118-9bad-11eb-a8a2-19ed5c03f8d3 | 2023-02-06T19:09:00 | 4 | IDE-2101 | Hector Garcia |
| 4 | 922ad118-9bad-11eb-a8a2-19ed5c03f8d3 | 2023-02-06T19:09:00 | 1 | IDE-2086 | Jorge Sullivan |

The view `vw_annual_general_meeting_shareholder_detail` answers: *which shareholders attended which annual general meeting, and what are the meeting's full logistics?* It joins `annual_general_meetings` to `shareholders` on `annual_general_meetings.id = shareholders.annual_general_meeting_id`, producing a comprehensive row that combines the meeting's `meeting_id`, `scheduled_date`, `actual_date`, `location`, `quorum_met`, `total_shares_represented`, and `attendee_count` with the shareholder's `identifier`, `legal_name`, `shareholder_type`, `registration_date`, and `is_proxy_holder`. For meeting 3 (meeting_id `gd_acc_763000`, quorum not met, 75 shares represented, 0 attendees), the view surfaces shareholder Home Medix Oxygen (identifier `IDE-2096`, type `foreign`, registered 2025-04-14, proxy holder Jorge Sullivan). The zero attendee count for this meeting, despite 75 shares represented, suggests a proxy-only attendance scenario.

**View `vw_board_member_annual_general_meeting`**

```sql
CREATE VIEW vw_board_member_annual_general_meeting AS
SELECT a.id, a.member_id, a.full_name, a.appointment_date, b.id AS meeting_id, b.meeting_id AS meeting_meeting_id, b.scheduled_date AS meeting_scheduled_date
FROM board_members a JOIN annual_general_meetings b ON a.annual_general_meeting_id = b.id;
```

| id | member_id | full_name | appointment_date | meeting_id | meeting_meeting_id | meeting_scheduled_date |
|---|---|---|---|---|---|---|
| 1 | 10207158 | Theodore Mcgrath | 2022-05-03 | 1 | 20967529 | 2024-11-27T22:18:00 |
| 2 | 10207158 | Account Name | 2023-10-14 | 2 | ChIJd13ymnZu5kcRXM7jx5boJBs | 2025-04-11T05:35:00 |
| 3 | 25820616 | Saipan International Airport | 2024-03-25 | 3 | gd_acc_763000 | 2022-09-22T12:52:00 |
| 4 | 2002007020250 | Norma Fisher | 2025-08-09 | 4 | 922ad118-9bad-11eb-a8a2-19ed5c03f8d3 | 2023-02-06T19:09:00 |

The view `vw_board_member_annual_general_meeting` inverts the perspective of `vw_annual_general_meeting_board_member`: *which annual general meetings did a given board member preside over, and what were the meeting outcomes?* It joins `board_members` to `annual_general_meetings` on `board_members.annual_general_meeting_id = annual_general_meetings.id`. Board member Theodore Mcgrath (member_id `10207158`, chairman `true`) is linked to meeting 1 (meeting_id `20967529`, quorum not met, 6 shares represented, 6 attendees). Board member Norma Fisher (member_id `2002007020250`, chairman `false`, fee 26.25, payment `via_company`) is linked to meeting 4 (meeting_id `922ad118-9bad-11eb-a8a2-19ed5c03f8d3`, quorum met, 179 shares represented, 32 attendees). This view supports queries that start from the board member entity.

**View `vw_board_member_resolution`**

```sql
CREATE VIEW vw_board_member_resolution AS
SELECT a.id, a.member_id, a.full_name, a.appointment_date, b.id AS resolution_id, b.resolution_id AS resolution_resolution_id, b.pass_date AS resolution_pass_date
FROM board_members a JOIN resolutions b ON a.resolution_id = b.id;
```

| id | member_id | full_name | appointment_date | resolution_id | resolution_resolution_id | resolution_pass_date |
|---|---|---|---|---|---|---|
| 1 | 10207158 | Theodore Mcgrath | 2022-05-03 | 1000 | 9085246 | 2024-11-13T22:18:00 |
| 2 | 10207158 | Account Name | 2023-10-14 | 1001 | gd_acc_120000 | 2025-04-24T05:35:00 |
| 3 | 25820616 | Saipan International Airport | 2024-03-25 | 1002 | 16587506 | 2022-09-08T12:52:00 |
| 4 | 2002007020250 | Norma Fisher | 2025-08-09 | 1003 | 9736899 | 2023-02-19T19:09:00 |

The view `vw_board_member_resolution` answers: *which resolutions were presented by or associated with a given board member?* It joins `board_members` to `resolutions` on `board_members.resolution_id = resolutions.id`. Board member Theodore Mcgrath (member_id `10207158`, chairman `true`) is linked to resolution 1000 (resolution_id `9085246`, type `dividend`, amount 13.49, currency `seasonal-currency-71`, published `true`). Board member Saipan International Airport (member_id `25820616`, chairman `true`) is linked to resolution 1002 (resolution_id `16587506`, type `appointment`, amount 19.72, currency `legacy-currency-73`, published `true`). This view is useful for auditing which board members are associated with which resolution types.

**View `vw_nomination_committee_annual_general_meeting`**

```sql
CREATE VIEW vw_nomination_committee_annual_general_meeting AS
SELECT a.nomination_committee_id, a.committee_id, a.charter_version, a.min_members, b.id AS meeting_id, b.meeting_id AS meeting_meeting_id, b.scheduled_date AS meeting_scheduled_date
FROM nomination_committees a JOIN annual_general_meetings b ON a.annual_general_meeting_id = b.id;
```

| nomination_committee_id | committee_id | charter_version | min_members | meeting_id | meeting_meeting_id | meeting_scheduled_date |
|---|---|---|---|---|---|---|
| 1 | PHR-98 | legacy-charter-19 | 38 | 1 | 20967529 | 2024-11-27T22:18:00 |
| 2 | L785 | compact-charter-20 | 41 | 2 | ChIJd13ymnZu5kcRXM7jx5boJBs | 2025-04-11T05:35:00 |
| 3 | 7119774 | composite-charter-21 | 44 | 3 | gd_acc_763000 | 2022-09-22T12:52:00 |
| 4 | 1186094 | primary-charter-22 | 47 | 4 | 922ad118-9bad-11eb-a8a2-19ed5c03f8d3 | 2023-02-06T19:09:00 |

The view `vw_nomination_committee_annual_general_meeting` answers: *which annual general meetings did a given nomination committee oversee?* It joins `nomination_committees` to `annual_general_meetings` on `nomination_committees.nomination_committee_id = annual_general_meetings.nomination_committee_id`. Committee `PHR-98` (charter version `legacy-charter-19`, min 38 members, max 16 members, chairman `default_chart_a_tax_19`) oversaw meeting 1 (meeting_id `20967529`, quorum not met, 6 shares represented, 6 attendees). Committee `1186094` (charter version `primary-charter-22`, min 47 members, max 37 members, chairman `5082968`) oversaw meeting 4 (meeting_id `922ad118-9bad-11eb-a8a2-19ed5c03f8d3`, quorum met, 179 shares represented, 32 attendees). This view supports governance audits of committee-meeting assignments.

**View `vw_nomination_committee_resolution`**

```sql
CREATE VIEW vw_nomination_committee_resolution AS
SELECT a.nomination_committee_id, a.committee_id, a.charter_version, a.min_members, b.id AS resolution_id, b.resolution_id AS resolution_resolution_id, b.pass_date AS resolution_pass_date
FROM nomination_committees a JOIN resolutions b ON a.resolution_id = b.id;
```

| nomination_committee_id | committee_id | charter_version | min_members | resolution_id | resolution_resolution_id | resolution_pass_date |
|---|---|---|---|---|---|---|
| 1 | PHR-98 | legacy-charter-19 | 38 | 1000 | 9085246 | 2024-11-13T22:18:00 |
| 2 | L785 | compact-charter-20 | 41 | 1001 | gd_acc_120000 | 2025-04-24T05:35:00 |
| 3 | 7119774 | composite-charter-21 | 44 | 1002 | 16587506 | 2022-09-08T12:52:00 |
| 4 | 1186094 | primary-charter-22 | 47 | 1003 | 9736899 | 2023-02-19T19:09:00 |

The view `vw_nomination_committee_resolution` answers: *which resolutions are associated with a given nomination committee?* It joins `nomination_committees` to `resolutions` on `nomination_committees.resolution_id = resolutions.id`. Committee `PHR-98` (charter version `legacy-charter-19`) is linked to resolution 1000 (resolution_id `9085246`, type `dividend`, amount 13.49, currency `seasonal-currency-71`, published `true`). Committee `1186094` (charter version `primary-charter-22`) is linked to resolution 1003 (resolution_id `9736899`, type `discharge`, amount 12.74, currency `compact-currency-74`, published `false`). This view enables queries that trace resolution lineage back through the committee structure.

**View `vw_resolution_annual_general_meeting`**

```sql
CREATE VIEW vw_resolution_annual_general_meeting AS
SELECT a.id, a.resolution_id, a.pass_date, a.resolution_type, b.id AS meeting_id, b.meeting_id AS meeting_meeting_id, b.scheduled_date AS meeting_scheduled_date
FROM resolutions a JOIN annual_general_meetings b ON a.annual_general_meeting_id = b.id;
```

| id | resolution_id | pass_date | resolution_type | meeting_id | meeting_meeting_id | meeting_scheduled_date |
|---|---|---|---|---|---|---|
| 1000 | 9085246 | 2024-11-13T22:18:00 | dividend | 1 | 20967529 | 2024-11-27T22:18:00 |
| 1001 | gd_acc_120000 | 2025-04-24T05:35:00 | fee | 2 | ChIJd13ymnZu5kcRXM7jx5boJBs | 2025-04-11T05:35:00 |
| 1002 | 16587506 | 2022-09-08T12:52:00 | appointment | 3 | gd_acc_763000 | 2022-09-22T12:52:00 |
| 1003 | 9736899 | 2023-02-19T19:09:00 | discharge | 4 | 922ad118-9bad-11eb-a8a2-19ed5c03f8d3 | 2023-02-06T19:09:00 |

The view `vw_resolution_annual_general_meeting` inverts the perspective of `vw_annual_general_meeting_resolution`: *which annual general meeting passed a given resolution, and what were the meeting's logistics?* It joins `resolutions` to `annual_general_meetings` on `resolutions.annual_general_meeting_id = annual_general_meetings.id`. Resolution 1000 (resolution_id `9085246`, type `dividend`, amount 13.49, currency `seasonal-currency-71`, published `true`) was passed at meeting 1 (meeting_id `20967529`, scheduled 2024-11-27, actual 2025-12-19, location `extended-location-99`, quorum not met, 6 shares represented, 6 attendees). Resolution 1001 (resolution_id `gd_acc_120000`, type `fee`, amount 25.47, currency `regional-currency-72`, published `false`) was passed at meeting 2 (meeting_id `ChIJd13ymnZu5kcRXM7jx5boJBs`, quorum met, 15 shares represented, 23 attendees). This view is the primary surface for resolution-centric queries.

**View `vw_resolution_shareholder`**

```sql
CREATE VIEW vw_resolution_shareholder AS
SELECT a.id, a.resolution_id, a.pass_date, a.resolution_type, b.shareholder_id AS shareholder_shareholder_id, b.identifier AS shareholder_identifier, b.legal_name AS shareholder_legal_name
FROM resolutions a JOIN shareholders b ON a.shareholder_id = b.shareholder_id;
```

| id | resolution_id | pass_date | resolution_type | shareholder_shareholder_id | shareholder_identifier | shareholder_legal_name |
|---|---|---|---|---|---|---|
| 1000 | 9085246 | 2024-11-13T22:18:00 | dividend | 1 | IDE-2086 | Jorge Sullivan |
| 1001 | gd_acc_120000 | 2025-04-24T05:35:00 | fee | 2 | IDE-2091 | Walter Pratt |
| 1002 | 16587506 | 2022-09-08T12:52:00 | appointment | 3 | IDE-2096 | Home Medix Oxygen |
| 1003 | 9736899 | 2023-02-19T19:09:00 | discharge | 4 | IDE-2101 | Hector Garcia |

The view `vw_resolution_shareholder` answers: *which shareholder proposed a given resolution?* It joins `resolutions` to `shareholders` on `resolutions.shareholder_id = shareholders.shareholder_id`. Resolution 1000 (resolution_id `9085246`, type `dividend`, amount 13.49, currency `seasonal-currency-71`, published `true`) was proposed by shareholder Jorge Sullivan (identifier `IDE-2086`, type `individual`, registered 2023-06-19, proxy holder Fredrik Backman). Resolution 1002 (resolution_id `16587506`, type `appointment`, amount 19.72, currency `legacy-currency-73`, published `true`) was proposed by Home Medix Oxygen (identifier `IDE-2096`, type `foreign`, registered 2025-04-14, proxy holder Jorge Sullivan). This view traces the origin of resolutions back to their proposers.

**View `vw_resolution_board_member`**

```sql
CREATE VIEW vw_resolution_board_member AS
SELECT a.id, a.resolution_id, a.pass_date, a.resolution_type, b.id AS member_id, b.member_id AS member_member_id, b.full_name AS member_full_name
FROM resolutions a JOIN board_members b ON a.board_member_id = b.id;
```

| id | resolution_id | pass_date | resolution_type | member_id | member_member_id | member_full_name |
|---|---|---|---|---|---|---|
| 1000 | 9085246 | 2024-11-13T22:18:00 | dividend | 1 | 10207158 | Theodore Mcgrath |
| 1001 | gd_acc_120000 | 2025-04-24T05:35:00 | fee | 2 | 10207158 | Account Name |
| 1002 | 16587506 | 2022-09-08T12:52:00 | appointment | 3 | 25820616 | Saipan International Airport |
| 1003 | 9736899 | 2023-02-19T19:09:00 | discharge | 4 | 2002007020250 | Norma Fisher |

The view `vw_resolution_board_member` answers: *which board member presented or is associated with a given resolution?* It joins `resolutions` to `board_members` on `resolutions.board_member_id = board_members.id`. Resolution 1000 (resolution_id `9085246`, type `dividend`, amount 13.49, currency `seasonal-currency-71`, published `true`) was presented by board member Theodore Mcgrath (member_id `10207158`, chairman `true`, fee 38.08, payment `direct`). Resolution 1003 (resolution_id `9736899`, type `discharge`, amount 12.74, currency `compact-currency-74`, published `false`) was presented by board member Norma Fisher (member_id `2002007020250`, chairman `false`, fee 26.25, payment `via_company`). This view supports queries that start from the resolution entity and need to identify the presenting board member.

The materialised views collectively cover every pairwise relationship in the corporate governance domain. Each view is a deterministic join over the normalised base tables, and reading any view is equivalent to executing the underlying join and projecting the relevant columns. The schema's design ensures that no domain fact is duplicated: the `shares` table owns share-level data, `shareholders` owns holder-level data, `annual_general_meetings` owns meeting-level data, `board_members` owns board-member-level data, `nomination_committees` owns committee-level data, and `resolutions` owns resolution-level data. Foreign keys enforce referential integrity, and the views provide the denormalised surfaces that analysts and applications query without needing to write joins themselves. The result is a schema that is both normalised—minimising redundancy and update anomalies—and queryable through a stable, well-documented set of named views.