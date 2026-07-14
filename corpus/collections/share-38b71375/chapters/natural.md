Corporate governance records capture the formal architecture through which ownership, oversight, and decision-making intersect within an organization. Every share issued, every board appointment made, every resolution passed at an annual general meeting leaves a traceable footprint across interconnected datasets. These records do not exist in isolation; they form a web of relationships where a single meeting can tie together a board member, a nomination committee, a resolution, and a set of shareholders. Understanding how these entities relate requires examining both the individual records and the composite views that bring them into focus.

## Shares and Shareholders

The foundation of any ownership structure begins with the shares themselves. Each share carries an identifier, a nominal value, a count of voting rights, an issuance date, and a current status that indicates whether it is actively held, held in treasury, or cancelled.

**Table `shares`**

| id | identifier | nominal_value | voting_rights | issuance_date | current_status | shareholder_id |
|---|---|---|---|---|---|---|
| 100 | IDE-2086 | 22.70 | 12 | 2022-01-17 | issued | 1 |
| 101 | IDE-2091 | 26.40 | 16 | 2023-06-01 | treasury | 2 |
| 102 | IDE-2096 | 30.10 | 20 | 2024-11-12 | cancelled | 3 |
| 103 | IDE-2101 | 33.80 | 24 | 2025-04-23 | issued | 4 |

Consider share IDE-2086, issued on 2022-01-17 with a nominal value of 22.70 and twelve voting rights, currently in issued status. By contrast, share IDE-2096, issued on 2024-11-12 with twenty voting rights, carries a cancelled status, meaning it no longer participates in governance. The issuance dates span from early 2022 through mid-2025, reflecting a continuous issuance cycle.

**Table `shareholders`**

| shareholder_id | identifier | legal_name | shareholder_type | registration_date | is_proxy_holder | share_id | annual_general_meeting_id |
|---|---|---|---|---|---|---|---|
| 1 | IDE-2086 | Jorge Sullivan | individual | 2023-06-19 | Fredrik Backman | 100 | 1 |
| 2 | IDE-2091 | Walter Pratt | institutional | 2024-11-03 | Janice Johnston | 101 | 2 |
| 3 | IDE-2096 | Home Medix Oxygen | foreign | 2025-04-14 | Jorge Sullivan | 102 | 3 |
| 4 | IDE-2101 | Hector Garcia | individual | 2022-09-25 | Laurie Wallace | 103 | 4 |

Shareholders are the counterpart entities that hold these shares. The table records each shareholder's identifier, legal name, type (individual, institutional, or foreign), registration date, and whether they act as a proxy holder. Shareholder IDE-2086, Jorge Sullivan, is registered as an individual, while IDE-2096, Home Medix Oxygen, is classified as foreign. The proxy holder field contains names such as Fredrik Backman and Janice Johnston, indicating third-party custodial arrangements. Each shareholder record links to a specific share and, through the annual general meeting field, to the meeting at which their participation is recorded.

## Annual General Meetings

The annual general meeting serves as the central event where governance actions converge. Each meeting carries a unique meeting identifier, scheduled and actual dates, a location, a quorum determination, and counts of total shares represented and attendees.

**Table `annual_general_meetings`**

| id | meeting_id | scheduled_date | actual_date | location | quorum_met | total_shares_represented | attendee_count | board_member_id | nomination_committee_id | resolution_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 20967529 | 2024-11-27T22:18:00 | 2025-12-19T11:57:00 | extended-location-99 | false | 6 | 6 | 1 | 1 | 1000 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | ChIJd13ymnZu5kcRXM7jx5boJBs | 2025-04-11T05:35:00 | 2022-05-03T18:14:00 | integrated-location-100 | true | 15 | 23 | 2 | 2 | 1001 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | gd_acc_763000 | 2022-09-22T12:52:00 | 2023-10-14T01:31:00 | seasonal-location-101 | false | 75 | 0 | 3 | 3 | 1002 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | 922ad118-9bad-11eb-a8a2-19ed5c03f8d3 | 2023-02-06T19:09:00 | 2024-03-25T08:48:00 | regional-location-102 | true | 179 | 32 | 4 | 4 | 1003 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Meeting 20967529 was scheduled for 2024-11-27 but did not actually occur until 2025-12-19, and the quorum was not met, with only six shares represented and six attendees. Meeting ChIJd13ymnZu5kcRXM7jx5boJBs, by contrast, had its quorum met, with fifteen shares represented and twenty-three attendees at the integrated-location-100. The meeting identifiers vary in format: numeric codes like 20967529, Google Place IDs like ChIJd13ymnZu5kcRXM7jx5boJBs, prefixed codes like gd_acc_763000, and UUIDs like 922ad118-9bad-11eb-a8a2-19ed5c03f8d3. The attendee counts range from zero to thirty-two, and the total shares represented span from six to one hundred seventy-nine.

## Board Members

Board members are the individuals or entities entrusted with oversight. Their records include a member identifier, full name, appointment and term-end dates, a designation as chairman or not, a fee amount, and a payment method.

**Table `board_members`**

| id | member_id | full_name | appointment_date | term_end_date | is_chairman | fee_amount | payment_method | annual_general_meeting_id | resolution_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 10207158 | Theodore Mcgrath | 2022-05-03 | 2025-08-24 | true | 38.08 | direct | 1 | 1000 |
| 2 | 10207158 | Account Name | 2023-10-14 | 2022-01-08 | false | 18.47 | via_company | 2 | 1001 |
| 3 | 25820616 | Saipan International Airport | 2024-03-25 | 2023-06-19 | true | 38.08 | direct | 3 | 1002 |
| 4 | 2002007020250 | Norma Fisher | 2025-08-09 | 2024-11-03 | false | 26.25 | via_company | 4 | 1003 |

Theodore Mcgrath (member ID 10207158) was appointed on 2022-05-03 with a term ending 2025-08-24, serves as chairman, and receives a fee of 38.08 paid via direct transfer. Saipan International Airport (member ID 25820616) also holds the chairman designation, with the same fee amount and payment method. The payment methods alternate between direct and via_company, and fee amounts range from 18.47 to 38.08. Each board member is associated with a specific annual general meeting and resolution, anchoring their service to concrete governance events.

## Nomination Committees

Nomination committees manage the process of selecting board members. Their records include a committee identifier, charter version, minimum and maximum member counts, a chairman identifier, and links to the associated annual general meeting and resolution.

**Table `nomination_committees`**

| nomination_committee_id | committee_id | charter_version | min_members | max_members | chairman_id | annual_general_meeting_id | resolution_id |
|---|---|---|---|---|---|---|---|
| 1 | PHR-98 | legacy-charter-19 | 38 | 16 | default_chart_a_tax_19 | 1 | 1000 |
| 2 | L785 | compact-charter-20 | 41 | 23 | gd_taxc_1122 | 2 | 1001 |
| 3 | 7119774 | composite-charter-21 | 44 | 30 | 168551 | 3 | 1002 |
| 4 | 1186094 | primary-charter-22 | 47 | 37 | 5082968 | 4 | 1003 |

Committee PHR-98 operates under the legacy-charter-19 with a minimum of thirty-eight and a maximum of sixteen members, chaired by default_chart_a_tax_19. Committee 1186094 uses the primary-charter-22 with a minimum of forty-seven and a maximum of thirty-seven members, chaired by 5082968. The charter versions progress from legacy through compact, composite, and primary, suggesting an evolution in governance frameworks. The member count ranges are notably wide, reflecting varying organizational scales.

## Resolutions

Resolutions formalize the decisions reached at meetings. Each resolution carries an identifier, a pass date, a type (such as dividend, fee, appointment, or discharge), an amount, a currency, a publication flag, and links to the meeting, shareholder, and board member involved.

**Table `resolutions`**

| id | resolution_id | pass_date | resolution_type | amount | currency | is_published | annual_general_meeting_id | shareholder_id | board_member_id |
|---|---|---|---|---|---|---|---|---|---|
| 1000 | 9085246 | 2024-11-13T22:18:00 | dividend | 13.49 | seasonal-currency-71 | true | 1 | 1 | 1 |
| 1001 | gd_acc_120000 | 2025-04-24T05:35:00 | fee | 25.47 | regional-currency-72 | false | 2 | 2 | 2 |
| 1002 | 16587506 | 2022-09-08T12:52:00 | appointment | 19.72 | legacy-currency-73 | true | 3 | 3 | 3 |
| 1003 | 9736899 | 2023-02-19T19:09:00 | discharge | 12.74 | compact-currency-74 | false | 4 | 4 | 4 |

Resolution 9085246, passed on 2024-11-13, is a dividend resolution for 13.49 in seasonal-currency-71, marked as published. Resolution gd_acc_120000, passed on 2025-04-24, is a fee resolution for 25.47 in regional-currency-72, not published. Resolution 16587506 is an appointment resolution for 19.72 in legacy-currency-73, published. Resolution 9736899 is a discharge resolution for 12.74 in compact-currency-74, not published. The resolution types cover the full spectrum of governance actions, and the currencies follow a naming convention that mirrors the meeting locations.

## Meetings and Shareholders

The meetings_shareholders table captures the direct participation of shareholders in specific meetings, serving as the bridge between ownership records and governance events.

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

This table records which shareholders attended which meetings, completing the participation chain from share ownership through shareholder registration to actual meeting attendance.

## Composite Views

The individual tables provide the raw records, but the true operational picture emerges when these records are joined into composite views. Each view answers a specific governance question by bringing together related entities.

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

This view joins shares with their corresponding shareholders, answering the question: which shareholder holds which share, and under what terms? Row IDE-2086 shows that Jorge Sullivan holds share IDE-2086, a share with a nominal value of 22.70 and twelve voting rights, issued on 2022-01-17. Row IDE-2096 reveals that Home Medix Oxygen holds share IDE-2096, which carries twenty voting rights but is in cancelled status, illustrating how a shareholder record can exist alongside an inactive share.

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

The inverse perspective, this view starts from the shareholder and enumerates their holdings. Walter Pratt (shareholder IDE-2091) holds share IDE-2091, an institutional holding with a nominal value of 26.40 and sixteen voting rights, currently in treasury status. Hector Garcia (shareholder IDE-2101) holds share IDE-2101, an individual holding with a nominal value of 33.80 and twenty-four voting rights, in issued status. This view is essential for determining voting power concentration across the shareholder base.

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

This view connects shareholders to the annual general meetings they attended. Jorge Sullivan participated in meeting 20967529, which was scheduled for 2024-11-27 and ultimately held on 2025-12-19 at extended-location-99. Walter Pratt attended meeting ChIJd13ymnZu5kcRXM7jx5boJBs, where the quorum was met with fifteen shares represented. This view enables tracking of shareholder engagement over time and across multiple meetings.

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

This view links each annual general meeting to its board members, answering which individuals served oversight at each event. Meeting 20967529 was overseen by Theodore Mcgrath, the chairman, who received a fee of 38.08 via direct payment. Meeting ChIJd13ymnZu5kcRXM7jx5boJBs was overseen by Account Name, a non-chairman member receiving 18.47 via company payment. The view makes it straightforward to audit board attendance and compensation per meeting.

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

This view associates each meeting with its nomination committee, revealing which committee was responsible for board selections at each gathering. Meeting 20967529 was served by committee PHR-98 under the legacy-charter-19, with a chairman identified as default_chart_a_tax_19. Meeting 922ad118-9bad-11eb-a8a2-19ed5c03f8d3 was served by committee 1186094 under the primary-charter-22, chaired by 5082968. This view supports governance audits by tracing committee accountability to specific meetings.

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

This view ties each meeting to its resolutions, showing what decisions were formalized at each gathering. Meeting 20967529 produced resolution 9085246, a dividend resolution for 13.49 in seasonal-currency-71, passed on 2024-11-13 and published. Meeting ChIJd13ymnZu5kcRXM7jx5boJBs produced resolution gd_acc_120000, a fee resolution for 25.47 in regional-currency-72, passed on 2025-04-24 but not published. The view enables compliance checks by revealing which resolutions were made public.

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

This view provides a detailed snapshot of shareholder participation within each meeting, combining shareholder identity with meeting context. Jorge Sullivan (shareholder IDE-2086) participated in meeting 20967529 at extended-location-99, where the quorum was not met and six shares were represented. Hector Garcia (shareholder IDE-2101) participated in meeting 922ad118-9bad-11eb-a8a2-19ed5c03f8d3 at regional-location-102, where the quorum was met and thirty-two attendees were present. This view is particularly useful for calculating quorum compliance and attendance rates.

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

This view presents the board member's perspective on meetings, showing which meetings each member attended and oversaw. Theodore Mcgrath attended meeting 20967529, where he served as chairman and received a fee of 38.08. Norma Fisher attended meeting 922ad118-9bad-11eb-a8a2-19ed5c03f8d3, serving as a non-chairman member with a fee of 26.25 paid via company. This view supports workload analysis and fee reconciliation across the board.

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

This view connects board members to the resolutions they were associated with, answering which governance decisions each member influenced. Theodore Mcgrath is linked to resolution 9085246, a published dividend resolution for 13.49. Norma Fisher is linked to resolution 9736899, an unpublished discharge resolution for 12.74. The view enables accountability tracing from individual members to specific governance outcomes.

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

This view maps nomination committees to the meetings they served, clarifying the committee's operational scope. Committee PHR-98 served meeting 20967529, operating under the legacy-charter-19 with a chairman of default_chart_a_tax_19. Committee 1186094 served meeting 922ad118-9bad-11eb-a8a2-19ed5c03f8d3, operating under the primary-charter-22 with a chairman of 5082968. This view supports charter compliance reviews by showing which charter version governed each meeting's committee.

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

This view links nomination committees to the resolutions they produced, completing the governance chain from committee formation to formal decision. Committee PHR-98 is associated with resolution 9085246, a dividend resolution for 13.49. Committee 1186094 is associated with resolution 9736899, a discharge resolution for 12.74. The view reveals how committee governance translates into concrete financial and personnel decisions.

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

This view presents the resolution's perspective on meetings, showing which meeting each resolution belongs to and its key attributes. Resolution 9085246 belongs to meeting 20967529, was passed on 2024-11-13, and is a published dividend. Resolution 9736899 belongs to meeting 922ad118-9bad-11eb-a8a2-19ed5c03f8d3, was passed on 2023-02-19, and is an unpublished discharge. This view is essential for resolution lifecycle management and publication compliance.

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

This view connects resolutions to the shareholders involved, answering which ownership interests were affected by each decision. Resolution 9085246, a dividend, is linked to shareholder Jorge Sullivan (IDE-2086). Resolution 9736899, a discharge, is linked to shareholder Hector Garcia (IDE-2101). The view enables impact analysis, showing how governance decisions propagate to the ownership base.

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

This final view ties resolutions to the board members associated with them, completing the accountability chain. Resolution 9085246 is associated with board member Theodore Mcgrath, the chairman who received 38.08 in fees. Resolution 9736899 is associated with board member Norma Fisher, a non-chairman member receiving 26.25. This view provides a clear audit trail from resolution to the individual board members responsible for its execution.

## Synthesis

The governance ecosystem described by these records operates as an integrated system. Shares carry voting power; shareholders exercise that power at annual general meetings; board members provide oversight at those meetings; nomination committees select the board; resolutions formalize the outcomes; and every action is traceable through the composite views. A single meeting like 20967529 connects Theodore Mcgrath as chairman, committee PHR-98 as the nominating body, resolution 9085246 as the dividend decision, and Jorge Sullivan as the participating shareholder. The views do not merely join data; they reconstruct the governance narrative from its component records, enabling practitioners to answer questions about attendance, compensation, publication status, and accountability with precision.