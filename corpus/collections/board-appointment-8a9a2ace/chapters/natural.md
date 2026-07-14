## Governance Architecture and Appointment Cycles

Public administration at the county level relies on a structured network of boards, executives, and institutions that must be tracked with precision. Each county jurisdiction operates under a legislative body, is overseen by a county executive, and maintains one or more public institutions whose governance is delegated to a board of trustees. Appointments to these boards follow statutory authority, undergo confirmation processes, and carry defined terms. The records in this system capture every layer of that architecture — from the establishment of a board to the individual serving on it, from the executive who nominates to the institution that benefits. Understanding how these entities interlock requires examining each table and the views that join them into coherent narratives.

**Table `board_appointments`**

| board_appointment_id | appointment_id | appointment_date | term_start_date | term_end_date | term_length_years | confirmation_status | statutory_authority | board_of_trustees_id | county_executive_id |
|---|---|---|---|---|---|---|---|---|---|
| 1000 | 2087748 | 2022-05-03T16:12:00 | 2022-05-26 | 2025-08-24 | 13 | pending | extended-statutor-93 | 1 | 1000 |
| 1001 | ChIJJ60m-q5t5kcRMZ9MdM8fVm4 | 2023-10-14T23:29:00 | 2023-10-10 | 2022-01-08 | 22 | confirmed | integrated-statutor-94 | 2 | 1001 |
| 1002 | 2087740 | 2024-03-25T06:46:00 | 2024-03-21 | 2023-06-19 | 31 | rejected | seasonal-statutor-95 | 3 | 1002 |
| 1003 | 1250223 | 2025-08-09T13:03:00 | 2025-08-05 | 2024-11-03 | 40 | pending | regional-statutor-96 | 4 | 1003 |

Board appointments form the operational core of the system. Each appointment record ties a specific date of nomination to a term with a start and end, measured in years. The confirmation status — whether pending, confirmed, or rejected — signals the current standing of the appointment, while the statutory authority field identifies the legal basis under which the appointment was made. For example, appointment 1000, bearing the external identifier 2087748, was nominated on 2022-05-03 under the authority extended-statutor-93, with a term of thirteen years stretching from 2022-05-26 to 2025-08-24. It remains in pending status and is linked to board of trustees record 1 and county executive 1000. Appointment 1001, identified by the Google Place ID ChIJJ60m-q5t5kcRMZ9MdM8fVm4, carries a twenty-two-year term under integrated-statutor-94 and has been confirmed. The data also includes appointments with anomalous date ranges — appointment 1002 shows a term end date of 2023-06-19 that precedes its term start of 2024-03-21, a pattern that warrants review.

**Table `board_members`**

| board_member_id | member_id | first_name | last_name | current_role | is_reappointment | board_of_trustees_id | board_appointment_id | county_jurisdiction_id |
|---|---|---|---|---|---|---|---|---|
| 100 | 10207158 | Stephanie Collins | Paul Allen | Trustee | false | 1 | 1000 | 1000 |
| 101 | 10207158 | Janice Johnston | Heather Beasley | Supervisor | true | 2 | 1001 | 1001 |
| 102 | 25820616 | Upal Saha | Audrey Taylor | Ex-Officio | false | 3 | 1002 | 1002 |
| 103 | 2002007020250 | Katherine Snyder | Susan Wagner | Trustee | true | 4 | 1003 | 1003 |

Board members are the individuals who fill the seats created by these appointments. The board_members table records each member's identifier, given and family names, current role within the board, and whether the person is serving a reappointment. The role designations — Trustee, Supervisor, Ex-Officio — reflect the capacity in which the member participates. Member 100, Stephanie Collins (Paul Allen), serves as a Trustee on a non-reappointment basis for board of trustees 1 under appointment 1000 in county jurisdiction 1000. Member 101, Janice Johnston (Heather Beasley), holds the role of Supervisor and is marked as a reappointment, serving on board 2 under appointment 1001 in jurisdiction 1001. Member 102, Upal Saha (Audrey Taylor), serves as an Ex-Officio member on board 3, while member 103, Katherine Snyder (Susan Wagner), is a reappointed Trustee on board 4.

**Table `board_of_trusteeses`**

| id | board_id | board_name | establishment_date | governing_statute | jurisdiction | public_institution_id | county_jurisdiction_id |
|---|---|---|---|---|---|---|---|
| 1 | ChIJH2V4UYBt5kcR5doeFwuU7Ns | Compact Series | 2024-07-11 | distributed-governin-84 | regional-jurisdic-30 | 100 | 1000 |
| 2 | 168553 | Legacy Assessment | 2025-12-22 | baseline-governin-85 | legacy-jurisdic-31 | 101 | 1001 |
| 3 | 5006454 | Regional Survey A | 2022-05-06 | pilot-governin-86 | compact-jurisdic-32 | 102 | 1002 |
| 4 | 1437585 | Seasonal Corridor | 2023-10-17 | extended-governin-87 | composite-jurisdic-33 | 103 | 1003 |

The board_of_trusteeses table defines the governing bodies themselves. Each board carries a unique identifier, a descriptive name such as Compact Series or Legacy Assessment, an establishment date, and the governing statute that authorizes its existence. The jurisdiction field provides a categorical label for the board's scope. Board 1, Compact Series, was established on 2024-07-11 under distributed-governin-84 and operates within regional-jurisdic-30. Board 2, Legacy Assessment, dates to 2025-12-22 under baseline-governin-85. Board 3, Regional Survey A, was created earliest on 2022-05-06 under pilot-governin-86, while Board 4, Seasonal Corridor, was established on 2023-10-17 under extended-governin-87. Each board is associated with a public institution and a county jurisdiction, anchoring it within the broader administrative geography.

**Table `county_jurisdictions`**

| county_jurisdiction_id | jurisdiction_id | jurisdiction_name | state_code | legislative_body | board_of_trustees_id | county_executive_id | public_institution_id |
|---|---|---|---|---|---|---|---|
| 1000 | 8387534 | Pilot Cluster | 17788643 | extended-legislat-21 | 1 | 1000 | 100 |
| 1001 | 99654 | Baseline Review | 8350031 | integrated-legislat-22 | 2 | 1001 | 101 |
| 1002 | lu_tax_code_template_m_I_4 | Distributed Initiative A | 790483 | seasonal-legislat-23 | 3 | 1002 | 102 |
| 1003 | 1186090 | Adaptive Model | 8387549 | regional-legislat-24 | 4 | 1003 | 103 |

County jurisdictions represent the geographic and legislative units within which all other entities operate. Each jurisdiction has a name, a state code, and a legislative body designation. Jurisdiction 1000, Pilot Cluster, carries state code 17788643 and operates under extended-legislat-21. Jurisdiction 1001, Baseline Review, uses state code 8350031 with integrated-legislat-22. Jurisdiction 1002, Distributed Initiative A, is identified by the template lu_tax_code_template_m_I_4 and state code 790483, operating under seasonal-legislat-23. Jurisdiction 1003, Adaptive Model, carries state code 8387549 and regional-legislat-24. Each jurisdiction is linked to exactly one board of trustees, one county executive, and one public institution, forming a tight triad of governance.

**Table `county_executives`**

| id | executive_id | full_name | term_start_date | term_end_date | appointment_authority | county_jurisdiction_id |
|---|---|---|---|---|---|---|
| 1000 | 9424942 | Theodore Mcgrath | 2022-05-26 | 2025-08-24 | primary-appointm-16 | 1000 |
| 1001 | 1250213 | Account Name | 2023-10-10 | 2022-01-08 | adaptive-appointm-17 | 1001 |
| 1002 | 1996941 | Saipan International Airport | 2024-03-21 | 2023-06-19 | distributed-appointm-18 | 1002 |
| 1003 | bd2a0f9d-ff94-4412-832f-f289a7a8ef40 | Norma Fisher | 2025-08-05 | 2024-11-03 | baseline-appointm-19 | 1003 |

County executives serve as the administrative officers who oversee jurisdictional operations and participate in the appointment process. The county_executives table records each executive's identifier, full name, term dates, and the appointment authority under which they serve. Executive 1000, Theodore Mcgrath, holds a term from 2022-05-26 to 2025-08-24 under primary-appointm-16 and is assigned to jurisdiction 1000. Executive 1001, listed as Account Name, serves from 2023-10-10 to 2022-01-08 under adaptive-appointm-17 in jurisdiction 1001. Executive 1002, recorded as Saipan International Airport, operates under distributed-appointm-18 in jurisdiction 1002. Executive 1003, Norma Fisher, carries the UUID bd2a0f9d-ff94-4412-832f-f289a7a8ef40 and serves under baseline-appointm-19 in jurisdiction 1003.

**Table `public_institutions`**

| id | institution_id | institution_name | institution_type | location_address | operational_status | board_of_trustees_id | county_jurisdiction_id |
|---|---|---|---|---|---|---|---|
| 100 | 9424913 | Extended Corridor | Memorial | baseline-location-61 | Active | 1 | 1000 |
| 101 | 8189481 | Pilot Series A | Museum | pilot-location-62 | Inactive | 2 | 1001 |
| 102 | 1437604 | Baseline Assessment | Park | extended-location-63 | Under Renovation | 3 | 1002 |
| 103 | 884346 | Distributed Survey | Civic Center | integrated-location-64 | Active | 4 | 1003 |

Public institutions are the facilities and organizations that benefit from the governance structure. Each institution has a name, a type classification, a location address, and an operational status. Institution 100, Extended Corridor, is classified as a Memorial, located at baseline-location-61, and is currently Active. Institution 101, Pilot Series A, is a Museum at pilot-location-62 with Inactive status. Institution 102, Baseline Assessment, is a Park at extended-location-63 currently Under Renovation. Institution 103, Distributed Survey, is a Civic Center at integrated-location-64 and is Active. Each institution is tied to a board of trustees and a county jurisdiction, ensuring that governance and oversight are geographically and administratively grounded.

The relationships between these entities are captured through three junction tables that resolve many-to-many associations. The appointments_members table links board appointments to the individual members who serve under them. The trusteeses_members table connects board of trustees records to their constituent members. The executives_appointments table ties county executives to the appointments they are involved in nominating or confirming. Together, these tables allow the system to represent complex membership structures where a single person may serve on multiple boards, a board may have multiple members appointed through different processes, and an executive may be associated with multiple appointments across jurisdictions.

**View `v_board_appointment_board_member_detail`**

```sql
CREATE VIEW v_board_appointment_board_member_detail AS
SELECT a.board_appointment_id, a.appointment_id, a.appointment_date, b.board_member_id AS member_board_member_id, b.member_id AS member_member_id, b.first_name AS member_first_name
FROM board_appointments a
  JOIN appointments_members j ON j.board_appointment_id = a.board_appointment_id
  JOIN board_members b ON b.board_member_id = j.board_member_id;
```

| board_appointment_id | appointment_id | appointment_date | member_board_member_id | member_member_id | member_first_name |
|---|---|---|---|---|---|
| 1000 | 2087748 | 2022-05-03T16:12:00 | 100 | 10207158 | Stephanie Collins |
| 1000 | 2087748 | 2022-05-03T16:12:00 | 101 | 10207158 | Janice Johnston |
| 1001 | ChIJJ60m-q5t5kcRMZ9MdM8fVm4 | 2023-10-14T23:29:00 | 101 | 10207158 | Janice Johnston |
| 1001 | ChIJJ60m-q5t5kcRMZ9MdM8fVm4 | 2023-10-14T23:29:00 | 102 | 25820616 | Upal Saha |
| 1002 | 2087740 | 2024-03-25T06:46:00 | 102 | 25820616 | Upal Saha |
| 1002 | 2087740 | 2024-03-25T06:46:00 | 103 | 2002007020250 | Katherine Snyder |
| 1003 | 1250223 | 2025-08-09T13:03:00 | 103 | 2002007020250 | Katherine Snyder |
| 1003 | 1250223 | 2025-08-09T13:03:00 | 100 | 10207158 | Stephanie Collins |

The view v_board_appointment_board_member_detail answers the question of which individual members are associated with each board appointment, providing a complete profile of the person serving. It joins board_appointments with board_members to surface the member's full name, role, and reappointment status alongside the appointment's dates and confirmation state. Reading the row for appointment 1000, we see that Stephanie Collins (Paul Allen) serves as a Trustee under this appointment, with the appointment itself in pending status and a thirteen-year term. The row for appointment 1001 shows Janice Johnston (Heather Beasley) as a reappointed Supervisor, linked to a confirmed appointment with a twenty-two-year term. This view is essential for personnel tracking — it tells administrators exactly who is serving, in what capacity, and under what appointment authority.

**View `v_board_appointment_board_of_trustees`**

```sql
CREATE VIEW v_board_appointment_board_of_trustees AS
SELECT a.board_appointment_id, a.appointment_id, a.appointment_date, a.term_start_date, b.id AS trustees_id, b.board_id AS trustees_board_id, b.board_name AS trustees_board_name
FROM board_appointments a JOIN board_of_trusteeses b ON a.board_of_trustees_id = b.id;
```

| board_appointment_id | appointment_id | appointment_date | term_start_date | trustees_id | trustees_board_id | trustees_board_name |
|---|---|---|---|---|---|---|
| 1000 | 2087748 | 2022-05-03T16:12:00 | 2022-05-26 | 1 | ChIJH2V4UYBt5kcR5doeFwuU7Ns | Compact Series |
| 1001 | ChIJJ60m-q5t5kcRMZ9MdM8fVm4 | 2023-10-14T23:29:00 | 2023-10-10 | 2 | 168553 | Legacy Assessment |
| 1002 | 2087740 | 2024-03-25T06:46:00 | 2024-03-21 | 3 | 5006454 | Regional Survey A |
| 1003 | 1250223 | 2025-08-09T13:03:00 | 2025-08-05 | 4 | 1437585 | Seasonal Corridor |

The view v_board_appointment_board_of_trustees connects each board appointment to the governing board it serves, revealing the institutional context of the appointment. It joins board_appointments with board_of_trusteeses to surface the board's name, establishment date, and governing statute. Appointment 1000 is linked to Compact Series, a board established on 2024-07-11 under distributed-governin-84. Appointment 1001 connects to Legacy Assessment, established 2025-12-22 under baseline-governin-85. This view enables auditors to verify that each appointment is properly anchored to a legally established board and to trace the lineage of board creation back to its governing statute.

**View `v_board_appointment_county_executive`**

```sql
CREATE VIEW v_board_appointment_county_executive AS
SELECT a.board_appointment_id, a.appointment_id, a.appointment_date, a.term_start_date, b.id AS executive_id, b.executive_id AS executive_executive_id, b.full_name AS executive_full_name
FROM board_appointments a JOIN county_executives b ON a.county_executive_id = b.id;
```

| board_appointment_id | appointment_id | appointment_date | term_start_date | executive_id | executive_executive_id | executive_full_name |
|---|---|---|---|---|---|---|
| 1000 | 2087748 | 2022-05-03T16:12:00 | 2022-05-26 | 1000 | 9424942 | Theodore Mcgrath |
| 1001 | ChIJJ60m-q5t5kcRMZ9MdM8fVm4 | 2023-10-14T23:29:00 | 2023-10-10 | 1001 | 1250213 | Account Name |
| 1002 | 2087740 | 2024-03-25T06:46:00 | 2024-03-21 | 1002 | 1996941 | Saipan International Airport |
| 1003 | 1250223 | 2025-08-09T13:03:00 | 2025-08-05 | 1003 | bd2a0f9d-ff94-4412-832f-f289a7a8ef40 | Norma Fisher |

The view v_board_appointment_county_executive links each board appointment to the county executive involved in the process, answering which administrative officer is associated with a given appointment. It joins board_appointments with county_executives to surface the executive's name, term dates, and appointment authority. Appointment 1000 is associated with Theodore Mcgrath, whose term runs from 2022-05-26 to 2025-08-24 under primary-appointm-16. Appointment 1001 connects to Account Name, serving under adaptive-appointm-17. This view is critical for accountability — it identifies the executive responsible for each appointment and allows comparison of appointment patterns across different executives and their terms.

**View `v_board_member_board_of_trustees`**

```sql
CREATE VIEW v_board_member_board_of_trustees AS
SELECT a.board_member_id, a.member_id, a.first_name, a.last_name, b.id AS trustees_id, b.board_id AS trustees_board_id, b.board_name AS trustees_board_name
FROM board_members a JOIN board_of_trusteeses b ON a.board_of_trustees_id = b.id;
```

| board_member_id | member_id | first_name | last_name | trustees_id | trustees_board_id | trustees_board_name |
|---|---|---|---|---|---|---|
| 100 | 10207158 | Stephanie Collins | Paul Allen | 1 | ChIJH2V4UYBt5kcR5doeFwuU7Ns | Compact Series |
| 101 | 10207158 | Janice Johnston | Heather Beasley | 2 | 168553 | Legacy Assessment |
| 102 | 25820616 | Upal Saha | Audrey Taylor | 3 | 5006454 | Regional Survey A |
| 103 | 2002007020250 | Katherine Snyder | Susan Wagner | 4 | 1437585 | Seasonal Corridor |

The view v_board_member_board_of_trustees reveals which board of trustees each board member serves on, joining board_members with board_of_trusteeses. It surfaces the board's name, establishment date, and governing statute alongside the member's role and reappointment status. Member 100, Stephanie Collins, serves on Compact Series, a board established 2024-07-11 under distributed-governin-84, in the role of Trustee. Member 101, Janice Johnston, serves on Legacy Assessment, established 2025-12-22 under baseline-governin-85, as a reappointed Supervisor. This view supports board composition analysis, allowing administrators to see at a glance which members serve on which boards and whether those boards are newly established or legacy bodies.

**View `v_board_member_board_appointment`**

```sql
CREATE VIEW v_board_member_board_appointment AS
SELECT a.board_member_id, a.member_id, a.first_name, a.last_name, b.board_appointment_id AS appointment_board_appointment_id, b.appointment_id AS appointment_appointment_id, b.appointment_date AS appointment_appointment_date
FROM board_members a JOIN board_appointments b ON a.board_appointment_id = b.board_appointment_id;
```

| board_member_id | member_id | first_name | last_name | appointment_board_appointment_id | appointment_appointment_id | appointment_appointment_date |
|---|---|---|---|---|---|---|
| 100 | 10207158 | Stephanie Collins | Paul Allen | 1000 | 2087748 | 2022-05-03T16:12:00 |
| 101 | 10207158 | Janice Johnston | Heather Beasley | 1001 | ChIJJ60m-q5t5kcRMZ9MdM8fVm4 | 2023-10-14T23:29:00 |
| 102 | 25820616 | Upal Saha | Audrey Taylor | 1002 | 2087740 | 2024-03-25T06:46:00 |
| 103 | 2002007020250 | Katherine Snyder | Susan Wagner | 1003 | 1250223 | 2025-08-09T13:03:00 |

The view v_board_member_board_appointment connects each board member to their specific board appointment, joining board_members with board_appointments. It surfaces the appointment's date, term dates, confirmation status, and statutory authority alongside the member's role. Member 100 (Stephanie Collins) is linked to appointment 1000, which is pending, has a thirteen-year term, and is authorized under extended-statutor-93. Member 103 (Katherine Snyder) is linked to appointment 1003, also pending, with a forty-year term under regional-statutor-96. This view is the primary tool for verifying that each member's service is backed by a valid, properly documented appointment.

**View `v_board_member_county_jurisdiction`**

```sql
CREATE VIEW v_board_member_county_jurisdiction AS
SELECT a.board_member_id, a.member_id, a.first_name, a.last_name, b.county_jurisdiction_id AS jurisdiction_county_jurisdiction_id, b.jurisdiction_id AS jurisdiction_jurisdiction_id, b.jurisdiction_name AS jurisdiction_jurisdiction_name
FROM board_members a JOIN county_jurisdictions b ON a.county_jurisdiction_id = b.county_jurisdiction_id;
```

| board_member_id | member_id | first_name | last_name | jurisdiction_county_jurisdiction_id | jurisdiction_jurisdiction_id | jurisdiction_jurisdiction_name |
|---|---|---|---|---|---|---|
| 100 | 10207158 | Stephanie Collins | Paul Allen | 1000 | 8387534 | Pilot Cluster |
| 101 | 10207158 | Janice Johnston | Heather Beasley | 1001 | 99654 | Baseline Review |
| 102 | 25820616 | Upal Saha | Audrey Taylor | 1002 | lu_tax_code_template_m_I_4 | Distributed Initiative A |
| 103 | 2002007020250 | Katherine Snyder | Susan Wagner | 1003 | 1186090 | Adaptive Model |

The view v_board_member_county_jurisdiction joins board_members with county_jurisdictions to reveal the geographic and legislative context of each member's service. It surfaces the jurisdiction's name, state code, and legislative body alongside the member's role and reappointment status. Member 100 (Stephanie Collins) serves in Pilot Cluster, jurisdiction 1000, which carries state code 17788643 and operates under extended-legislat-21. Member 102 (Upal Saha) serves in Distributed Initiative A, jurisdiction 1002, with state code 790483 and seasonal-legislat-23. This view enables geographic analysis of board membership, showing how members are distributed across jurisdictions and which legislative bodies they fall under.

**View `v_board_of_trustees_board_member_detail`**

```sql
CREATE VIEW v_board_of_trustees_board_member_detail AS
SELECT a.id, a.board_id, a.board_name, b.board_member_id AS member_board_member_id, b.member_id AS member_member_id, b.first_name AS member_first_name
FROM board_of_trusteeses a
  JOIN trusteeses_members j ON j.board_of_trustees_id = a.id
  JOIN board_members b ON b.board_member_id = j.board_member_id;
```

| id | board_id | board_name | member_board_member_id | member_member_id | member_first_name |
|---|---|---|---|---|---|
| 1 | ChIJH2V4UYBt5kcR5doeFwuU7Ns | Compact Series | 100 | 10207158 | Stephanie Collins |
| 1 | ChIJH2V4UYBt5kcR5doeFwuU7Ns | Compact Series | 101 | 10207158 | Janice Johnston |
| 2 | 168553 | Legacy Assessment | 101 | 10207158 | Janice Johnston |
| 2 | 168553 | Legacy Assessment | 102 | 25820616 | Upal Saha |
| 3 | 5006454 | Regional Survey A | 102 | 25820616 | Upal Saha |
| 3 | 5006454 | Regional Survey A | 103 | 2002007020250 | Katherine Snyder |
| 4 | 1437585 | Seasonal Corridor | 103 | 2002007020250 | Katherine Snyder |
| 4 | 1437585 | Seasonal Corridor | 100 | 10207158 | Stephanie Collins |

The view v_board_of_trustees_board_member_detail inverts the perspective, starting from the board of trustees and listing all members serving on it. It joins board_of_trusteeses with board_members to surface each member's name, role, and reappointment status alongside the board's name and establishment date. Board 1, Compact Series, established 2024-07-11, includes member 100 (Stephanie Collins) as a Trustee who is not a reappointment. Board 2, Legacy Assessment, established 2025-12-22, includes member 101 (Janice Johnston) as a reappointed Supervisor. This view is essential for board composition reports and for verifying that each board has the required number of members in appropriate roles.

**View `v_board_of_trustees_public_institution`**

```sql
CREATE VIEW v_board_of_trustees_public_institution AS
SELECT a.id, a.board_id, a.board_name, a.establishment_date, b.id AS institution_id, b.institution_id AS institution_institution_id, b.institution_name AS institution_institution_name
FROM board_of_trusteeses a JOIN public_institutions b ON a.public_institution_id = b.id;
```

| id | board_id | board_name | establishment_date | institution_id | institution_institution_id | institution_institution_name |
|---|---|---|---|---|---|---|
| 1 | ChIJH2V4UYBt5kcR5doeFwuU7Ns | Compact Series | 2024-07-11 | 100 | 9424913 | Extended Corridor |
| 2 | 168553 | Legacy Assessment | 2025-12-22 | 101 | 8189481 | Pilot Series A |
| 3 | 5006454 | Regional Survey A | 2022-05-06 | 102 | 1437604 | Baseline Assessment |
| 4 | 1437585 | Seasonal Corridor | 2023-10-17 | 103 | 884346 | Distributed Survey |

The view v_board_of_trustees_public_institution joins board_of_trusteeses with public_institutions to reveal which public institution each board of trustees governs. It surfaces the institution's name, type, location, and operational status alongside the board's name and establishment date. Board 1 (Compact Series) governs Extended Corridor, a Memorial at baseline-location-61 that is Active. Board 2 (Legacy Assessment) governs Pilot Series A, a Museum at pilot-location-62 that is Inactive. This view clarifies the operational mission of each board — it shows which facilities and organizations each board is responsible for overseeing.

**View `v_board_of_trustees_county_jurisdiction`**

```sql
CREATE VIEW v_board_of_trustees_county_jurisdiction AS
SELECT a.id, a.board_id, a.board_name, a.establishment_date, b.county_jurisdiction_id AS jurisdiction_county_jurisdiction_id, b.jurisdiction_id AS jurisdiction_jurisdiction_id, b.jurisdiction_name AS jurisdiction_jurisdiction_name
FROM board_of_trusteeses a JOIN county_jurisdictions b ON a.county_jurisdiction_id = b.county_jurisdiction_id;
```

| id | board_id | board_name | establishment_date | jurisdiction_county_jurisdiction_id | jurisdiction_jurisdiction_id | jurisdiction_jurisdiction_name |
|---|---|---|---|---|---|---|
| 1 | ChIJH2V4UYBt5kcR5doeFwuU7Ns | Compact Series | 2024-07-11 | 1000 | 8387534 | Pilot Cluster |
| 2 | 168553 | Legacy Assessment | 2025-12-22 | 1001 | 99654 | Baseline Review |
| 3 | 5006454 | Regional Survey A | 2022-05-06 | 1002 | lu_tax_code_template_m_I_4 | Distributed Initiative A |
| 4 | 1437585 | Seasonal Corridor | 2023-10-17 | 1003 | 1186090 | Adaptive Model |

The view v_board_of_trustees_county_jurisdiction joins board_of_trusteeses with county_jurisdictions to reveal the geographic and legislative home of each board. It surfaces the jurisdiction's name, state code, and legislative body alongside the board's name and establishment date. Board 1 (Compact Series) operates within Pilot Cluster, jurisdiction 1000, state code 17788643, under extended-legislat-21. Board 4 (Seasonal Corridor) operates within Adaptive Model, jurisdiction 1003, state code 8387549, under regional-legislat-24. This view is critical for understanding the jurisdictional boundaries within which each board exercises its authority.

**View `v_county_jurisdiction_board_of_trustees`**

```sql
CREATE VIEW v_county_jurisdiction_board_of_trustees AS
SELECT a.county_jurisdiction_id, a.jurisdiction_id, a.jurisdiction_name, a.state_code, b.id AS trustees_id, b.board_id AS trustees_board_id, b.board_name AS trustees_board_name
FROM county_jurisdictions a JOIN board_of_trusteeses b ON a.board_of_trustees_id = b.id;
```

| county_jurisdiction_id | jurisdiction_id | jurisdiction_name | state_code | trustees_id | trustees_board_id | trustees_board_name |
|---|---|---|---|---|---|---|
| 1000 | 8387534 | Pilot Cluster | 17788643 | 1 | ChIJH2V4UYBt5kcR5doeFwuU7Ns | Compact Series |
| 1001 | 99654 | Baseline Review | 8350031 | 2 | 168553 | Legacy Assessment |
| 1002 | lu_tax_code_template_m_I_4 | Distributed Initiative A | 790483 | 3 | 5006454 | Regional Survey A |
| 1003 | 1186090 | Adaptive Model | 8387549 | 4 | 1437585 | Seasonal Corridor |

The view v_county_jurisdiction_board_of_trustees starts from the county jurisdiction and lists the board of trustees associated with it, joining county_jurisdictions with board_of_trusteeses. It surfaces the board's name, establishment date, and governing statute alongside the jurisdiction's name and legislative body. Jurisdiction 1000 (Pilot Cluster) is associated with Compact Series, established 2024-07-11 under distributed-governin-84. Jurisdiction 1002 (Distributed Initiative A) is associated with Regional Survey A, established 2022-05-06 under pilot-governin-86. This view supports jurisdiction-level reporting, showing which board governs which jurisdiction and under what statutory authority.

**View `v_county_jurisdiction_county_executive`**

```sql
CREATE VIEW v_county_jurisdiction_county_executive AS
SELECT a.county_jurisdiction_id, a.jurisdiction_id, a.jurisdiction_name, a.state_code, b.id AS executive_id, b.executive_id AS executive_executive_id, b.full_name AS executive_full_name
FROM county_jurisdictions a JOIN county_executives b ON a.county_executive_id = b.id;
```

| county_jurisdiction_id | jurisdiction_id | jurisdiction_name | state_code | executive_id | executive_executive_id | executive_full_name |
|---|---|---|---|---|---|---|
| 1000 | 8387534 | Pilot Cluster | 17788643 | 1000 | 9424942 | Theodore Mcgrath |
| 1001 | 99654 | Baseline Review | 8350031 | 1001 | 1250213 | Account Name |
| 1002 | lu_tax_code_template_m_I_4 | Distributed Initiative A | 790483 | 1002 | 1996941 | Saipan International Airport |
| 1003 | 1186090 | Adaptive Model | 8387549 | 1003 | bd2a0f9d-ff94-4412-832f-f289a7a8ef40 | Norma Fisher |

The view v_county_jurisdiction_county_executive joins county_jurisdictions with county_executives to reveal which executive oversees each jurisdiction. It surfaces the executive's name, term dates, and appointment authority alongside the jurisdiction's name and legislative body. Jurisdiction 1000 (Pilot Cluster) is overseen by Theodore Mcgrath, whose term runs from 2022-05-26 to 2025-08-24 under primary-appointm-16. Jurisdiction 1003 (Adaptive Model) is overseen by Norma Fisher, serving under baseline-appointm-19. This view is essential for understanding the executive leadership structure across jurisdictions and for identifying any gaps or overlaps in coverage.

**View `v_county_jurisdiction_public_institution`**

```sql
CREATE VIEW v_county_jurisdiction_public_institution AS
SELECT a.county_jurisdiction_id, a.jurisdiction_id, a.jurisdiction_name, a.state_code, b.id AS institution_id, b.institution_id AS institution_institution_id, b.institution_name AS institution_institution_name
FROM county_jurisdictions a JOIN public_institutions b ON a.public_institution_id = b.id;
```

| county_jurisdiction_id | jurisdiction_id | jurisdiction_name | state_code | institution_id | institution_institution_id | institution_institution_name |
|---|---|---|---|---|---|---|
| 1000 | 8387534 | Pilot Cluster | 17788643 | 100 | 9424913 | Extended Corridor |
| 1001 | 99654 | Baseline Review | 8350031 | 101 | 8189481 | Pilot Series A |
| 1002 | lu_tax_code_template_m_I_4 | Distributed Initiative A | 790483 | 102 | 1437604 | Baseline Assessment |
| 1003 | 1186090 | Adaptive Model | 8387549 | 103 | 884346 | Distributed Survey |

The view v_county_jurisdiction_public_institution joins county_jurisdictions with public_institutions to reveal which public institution operates within each jurisdiction. It surfaces the institution's name, type, location, and operational status alongside the jurisdiction's name and legislative body. Jurisdiction 1000 (Pilot Cluster) contains Extended Corridor, a Memorial at baseline-location-61 that is Active. Jurisdiction 1002 (Distributed Initiative A) contains Baseline Assessment, a Park at extended-location-63 currently Under Renovation. This view provides a geographic inventory of public institutions and their operational states within each jurisdiction.

**View `v_county_executive_board_appointment_detail`**

```sql
CREATE VIEW v_county_executive_board_appointment_detail AS
SELECT a.id, a.executive_id, a.full_name, b.board_appointment_id AS appointment_board_appointment_id, b.appointment_id AS appointment_appointment_id, b.appointment_date AS appointment_appointment_date
FROM county_executives a
  JOIN executives_appointments j ON j.county_executive_id = a.id
  JOIN board_appointments b ON b.board_appointment_id = j.board_appointment_id;
```

| id | executive_id | full_name | appointment_board_appointment_id | appointment_appointment_id | appointment_appointment_date |
|---|---|---|---|---|---|
| 1000 | 9424942 | Theodore Mcgrath | 1000 | 2087748 | 2022-05-03T16:12:00 |
| 1000 | 9424942 | Theodore Mcgrath | 1001 | ChIJJ60m-q5t5kcRMZ9MdM8fVm4 | 2023-10-14T23:29:00 |
| 1001 | 1250213 | Account Name | 1001 | ChIJJ60m-q5t5kcRMZ9MdM8fVm4 | 2023-10-14T23:29:00 |
| 1001 | 1250213 | Account Name | 1002 | 2087740 | 2024-03-25T06:46:00 |
| 1002 | 1996941 | Saipan International Airport | 1002 | 2087740 | 2024-03-25T06:46:00 |
| 1002 | 1996941 | Saipan International Airport | 1003 | 1250223 | 2025-08-09T13:03:00 |
| 1003 | bd2a0f9d-ff94-4412-832f-f289a7a8ef40 | Norma Fisher | 1003 | 1250223 | 2025-08-09T13:03:00 |
| 1003 | bd2a0f9d-ff94-4412-832f-f289a7a8ef40 | Norma Fisher | 1000 | 2087748 | 2022-05-03T16:12:00 |

The view v_county_executive_board_appointment_detail joins county_executives with board_appointments to reveal which appointments are associated with each county executive. It surfaces the appointment's date, term dates, confirmation status, and statutory authority alongside the executive's name and term. Executive 1000 (Theodore Mcgrath) is associated with appointment 1000, a pending appointment with a thirteen-year term under extended-statutor-93. Executive 1003 (Norma Fisher) is associated with appointment 1003, also pending, with a forty-year term under regional-statutor-96. This view enables executive performance analysis, showing the volume and status of appointments linked to each executive's tenure.

**View `v_county_executive_county_jurisdiction`**

```sql
CREATE VIEW v_county_executive_county_jurisdiction AS
SELECT a.id, a.executive_id, a.full_name, a.term_start_date, b.county_jurisdiction_id AS jurisdiction_county_jurisdiction_id, b.jurisdiction_id AS jurisdiction_jurisdiction_id, b.jurisdiction_name AS jurisdiction_jurisdiction_name
FROM county_executives a JOIN county_jurisdictions b ON a.county_jurisdiction_id = b.county_jurisdiction_id;
```

| id | executive_id | full_name | term_start_date | jurisdiction_county_jurisdiction_id | jurisdiction_jurisdiction_id | jurisdiction_jurisdiction_name |
|---|---|---|---|---|---|---|
| 1000 | 9424942 | Theodore Mcgrath | 2022-05-26 | 1000 | 8387534 | Pilot Cluster |
| 1001 | 1250213 | Account Name | 2023-10-10 | 1001 | 99654 | Baseline Review |
| 1002 | 1996941 | Saipan International Airport | 2024-03-21 | 1002 | lu_tax_code_template_m_I_4 | Distributed Initiative A |
| 1003 | bd2a0f9d-ff94-4412-832f-f289a7a8ef40 | Norma Fisher | 2025-08-05 | 1003 | 1186090 | Adaptive Model |

The view v_county_executive_county_jurisdiction joins county_executives with county_jurisdictions to confirm the jurisdictional assignment of each executive. It surfaces the jurisdiction's name, state code, and legislative body alongside the executive's name, term dates, and appointment authority. Executive 1000 (Theodore Mcgrath) is assigned to Pilot Cluster, jurisdiction 1000, state code 17788643, under extended-legislat-21. Executive 1002 (Saipan International Airport) is assigned to Distributed Initiative A, jurisdiction 1002, state code 790483, under seasonal-legislat-23. This view verifies the one-to-one mapping between executives and jurisdictions, ensuring that every jurisdiction has a designated executive.

**View `v_public_institution_board_of_trustees`**

```sql
CREATE VIEW v_public_institution_board_of_trustees AS
SELECT a.id, a.institution_id, a.institution_name, a.institution_type, b.id AS trustees_id, b.board_id AS trustees_board_id, b.board_name AS trustees_board_name
FROM public_institutions a JOIN board_of_trusteeses b ON a.board_of_trustees_id = b.id;
```

| id | institution_id | institution_name | institution_type | trustees_id | trustees_board_id | trustees_board_name |
|---|---|---|---|---|---|---|
| 100 | 9424913 | Extended Corridor | Memorial | 1 | ChIJH2V4UYBt5kcR5doeFwuU7Ns | Compact Series |
| 101 | 8189481 | Pilot Series A | Museum | 2 | 168553 | Legacy Assessment |
| 102 | 1437604 | Baseline Assessment | Park | 3 | 5006454 | Regional Survey A |
| 103 | 884346 | Distributed Survey | Civic Center | 4 | 1437585 | Seasonal Corridor |

The view v_public_institution_board_of_trustees joins public_institutions with board_of_trusteeses to reveal which board governs each public institution. It surfaces the board's name, establishment date, and governing statute alongside the institution's name, type, and operational status. Extended Corridor (Institution 100), a Memorial that is Active, is governed by Compact Series (Board 1), established 2024-07-11 under distributed-governin-84. Pilot Series A (Institution 101), a Museum that is Inactive, is governed by Legacy Assessment (Board 2), established 2025-12-22 under baseline-governin-85. This view clarifies the governance chain from institution to board, ensuring that every public institution has a designated governing body.

**View `v_public_institution_county_jurisdiction`**

```sql
CREATE VIEW v_public_institution_county_jurisdiction AS
SELECT a.id, a.institution_id, a.institution_name, a.institution_type, b.county_jurisdiction_id AS jurisdiction_county_jurisdiction_id, b.jurisdiction_id AS jurisdiction_jurisdiction_id, b.jurisdiction_name AS jurisdiction_jurisdiction_name
FROM public_institutions a JOIN county_jurisdictions b ON a.county_jurisdiction_id = b.county_jurisdiction_id;
```

| id | institution_id | institution_name | institution_type | jurisdiction_county_jurisdiction_id | jurisdiction_jurisdiction_id | jurisdiction_jurisdiction_name |
|---|---|---|---|---|---|---|
| 100 | 9424913 | Extended Corridor | Memorial | 1000 | 8387534 | Pilot Cluster |
| 101 | 8189481 | Pilot Series A | Museum | 1001 | 99654 | Baseline Review |
| 102 | 1437604 | Baseline Assessment | Park | 1002 | lu_tax_code_template_m_I_4 | Distributed Initiative A |
| 103 | 884346 | Distributed Survey | Civic Center | 1003 | 1186090 | Adaptive Model |

The view v_public_institution_county_jurisdiction joins public_institutions with county_jurisdictions to reveal the jurisdictional home of each public institution. It surfaces the jurisdiction's name, state code, and legislative body alongside the institution's name, type, location, and operational status. Extended Corridor (Institution 100) is located in Pilot Cluster, jurisdiction 1000, state code 17788643, under extended-legislat-21. Distributed Survey (Institution 103) is located in Adaptive Model, jurisdiction 1003, state code 8387549, under regional-legislat-24. This view provides a complete geographic and administrative inventory of public institutions, showing where each is located and under which legislative body it falls.

The architecture described here — six base tables, three junction tables, and sixteen joined views — forms a comprehensive record of county-level governance. Board appointments anchor the system with their dates, terms, and confirmation states. Board members bring human agency to those appointments, serving in defined roles across multiple boards and jurisdictions. Boards of trustees provide the governing framework, each tied to a public institution and a county jurisdiction. County jurisdictions define the geographic and legislative boundaries within which everything operates. County executives serve as the administrative officers who oversee jurisdictions and participate in appointments. Public institutions are the end beneficiaries of this entire structure, their operational status tracked alongside their governance and location. The views synthesize these relationships into answerable questions — who serves where, which board governs which institution, which executive oversees which jurisdiction — enabling administrators, auditors, and policymakers to navigate the full complexity of county governance with clarity.

## Data appendix

**Table `appointments_members`**

| board_appointment_id | board_member_id |
|---|---|
| 1000 | 100 |
| 1000 | 101 |
| 1001 | 101 |
| 1001 | 102 |
| 1002 | 102 |
| 1002 | 103 |
| 1003 | 103 |
| 1003 | 100 |

**Table `trusteeses_members`**

| board_of_trustees_id | board_member_id |
|---|---|
| 1 | 100 |
| 1 | 101 |
| 2 | 101 |
| 2 | 102 |
| 3 | 102 |
| 3 | 103 |
| 4 | 103 |
| 4 | 100 |

**Table `executives_appointments`**

| county_executive_id | board_appointment_id |
|---|---|
| 1000 | 1000 |
| 1000 | 1001 |
| 1001 | 1001 |
| 1001 | 1002 |
| 1002 | 1002 |
| 1002 | 1003 |
| 1003 | 1003 |
| 1003 | 1000 |
