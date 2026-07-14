## Ontology-Grounded Relational Modelling of the Board Governance Domain

The board governance domain captures the interlocking relationships among public institutions, county jurisdictions, board of trustees bodies, board appointments, board members, and county executives. Each entity type carries a distinct lifecycle and set of attributes, and the relationships between them are modelled as foreign keys and junction tables that preserve referential integrity while supporting flexible membership and appointment patterns. The materialized schema normalizes these concepts into six base tables, three junction tables, and a suite of twelve denormalized views that reconstruct domain facts for reporting. The following sections walk through the ontology, the relational mapping, and the view-level joins that answer concrete governance questions.

**Table `board_appointments`**

| board_appointment_id | appointment_id | appointment_date | term_start_date | term_end_date | term_length_years | confirmation_status | statutory_authority | board_of_trustees_id | county_executive_id |
|---|---|---|---|---|---|---|---|---|---|
| 1000 | 2087748 | 2022-05-03T16:12:00 | 2022-05-26 | 2025-08-24 | 13 | pending | extended-statutor-93 | 1 | 1000 |
| 1001 | ChIJJ60m-q5t5kcRMZ9MdM8fVm4 | 2023-10-14T23:29:00 | 2023-10-10 | 2022-01-08 | 22 | confirmed | integrated-statutor-94 | 2 | 1001 |
| 1002 | 2087740 | 2024-03-25T06:46:00 | 2024-03-21 | 2023-06-19 | 31 | rejected | seasonal-statutor-95 | 3 | 1002 |
| 1003 | 1250223 | 2025-08-09T13:03:00 | 2025-08-05 | 2024-11-03 | 40 | pending | regional-statutor-96 | 4 | 1003 |

The `board_appointments` table anchors the appointment lifecycle. Each row represents a single appointment to a board of trustees, identified by `board_appointment_id` (a surrogate key such as `1000`) and linked to an external `appointment_id` (e.g. `2087748` or the Google Place ID `ChIJJ60m-q5t5kcRMZ9MdM8fVm4`). Temporal attributes — `appointment_date`, `term_start_date`, `term_end_date`, and `term_length_years` — record when the appointment was made and the span of the term. The `confirmation_status` column (values `pending`, `confirmed`, `rejected`) tracks the procedural state, while `statutory_authority` encodes the legal basis (e.g. `extended-statutor-93`). Two foreign keys, `board_of_trustees_id` and `county_executive_id`, bind each appointment to the governing board and the authorizing county executive, respectively.

**Table `board_members`**

| board_member_id | member_id | first_name | last_name | current_role | is_reappointment | board_of_trustees_id | board_appointment_id | county_jurisdiction_id |
|---|---|---|---|---|---|---|---|---|
| 100 | 10207158 | Stephanie Collins | Paul Allen | Trustee | false | 1 | 1000 | 1000 |
| 101 | 10207158 | Janice Johnston | Heather Beasley | Supervisor | true | 2 | 1001 | 1001 |
| 102 | 25820616 | Upal Saha | Audrey Taylor | Ex-Officio | false | 3 | 1002 | 1002 |
| 103 | 2002007020250 | Katherine Snyder | Susan Wagner | Trustee | true | 4 | 1003 | 1003 |

Board members are stored in `board_members`, where `board_member_id` serves as the surrogate primary key and `member_id` carries the external identifier (e.g. `10207158`). The columns `first_name` and `last_name` store the person's name — note that the sample data pairs `Stephanie Collins` with `Paul Allen`, reflecting the fictional composite naming convention. `current_role` captures the position title (`Trustee`, `Supervisor`, `Ex-Officio`), and `is_reappointment` is a boolean flag. The table holds three foreign keys: `board_of_trustees_id` links the member to a board, `board_appointment_id` links to the appointment record, and `county_jurisdiction_id` ties the membership to a geographic jurisdiction.

**Table `board_of_trusteeses`**

| id | board_id | board_name | establishment_date | governing_statute | jurisdiction | public_institution_id | county_jurisdiction_id |
|---|---|---|---|---|---|---|---|
| 1 | ChIJH2V4UYBt5kcR5doeFwuU7Ns | Compact Series | 2024-07-11 | distributed-governin-84 | regional-jurisdic-30 | 100 | 1000 |
| 2 | 168553 | Legacy Assessment | 2025-12-22 | baseline-governin-85 | legacy-jurisdic-31 | 101 | 1001 |
| 3 | 5006454 | Regional Survey A | 2022-05-06 | pilot-governin-86 | compact-jurisdic-32 | 102 | 1002 |
| 4 | 1437585 | Seasonal Corridor | 2023-10-17 | extended-governin-87 | composite-jurisdic-33 | 103 | 1003 |

The `board_of_trusteeses` table defines each board body. Its surrogate key `id` (values `1` through `4`) is distinct from the external `board_id` (e.g. `ChIJH2V4UYBt5kcR5doeFwuU7Ns`). The `board_name` column holds names such as `Compact Series` and `Legacy Assessment`. `establishment_date` and `governing_statute` record when the board was created and under which statute. The `jurisdiction` column stores a jurisdiction code (e.g. `regional-jurisdic-30`). Foreign keys `public_institution_id` and `county_jurisdiction_id` connect the board to its host institution and to the county jurisdiction it serves.

**Table `county_jurisdictions`**

| county_jurisdiction_id | jurisdiction_id | jurisdiction_name | state_code | legislative_body | board_of_trustees_id | county_executive_id | public_institution_id |
|---|---|---|---|---|---|---|---|
| 1000 | 8387534 | Pilot Cluster | 17788643 | extended-legislat-21 | 1 | 1000 | 100 |
| 1001 | 99654 | Baseline Review | 8350031 | integrated-legislat-22 | 2 | 1001 | 101 |
| 1002 | lu_tax_code_template_m_I_4 | Distributed Initiative A | 790483 | seasonal-legislat-23 | 3 | 1002 | 102 |
| 1003 | 1186090 | Adaptive Model | 8387549 | regional-legislat-24 | 4 | 1003 | 103 |

`county_jurisdictions` models the geographic and legislative boundaries. The surrogate key `county_jurisdiction_id` (e.g. `1000`) is paired with an external `jurisdiction_id` (e.g. `8387534`). The `jurisdiction_name` column holds descriptive names like `Pilot Cluster` and `Baseline Review`. `state_code` stores a numeric code (e.g. `17788643`), `legislative_body` encodes the type of legislature (e.g. `extended-legislat-21`), and three foreign keys — `board_of_trustees_id`, `county_executive_id`, and `public_institution_id` — link the jurisdiction to its board, executive, and institution.

**Table `county_executives`**

| id | executive_id | full_name | term_start_date | term_end_date | appointment_authority | county_jurisdiction_id |
|---|---|---|---|---|---|---|
| 1000 | 9424942 | Theodore Mcgrath | 2022-05-26 | 2025-08-24 | primary-appointm-16 | 1000 |
| 1001 | 1250213 | Account Name | 2023-10-10 | 2022-01-08 | adaptive-appointm-17 | 1001 |
| 1002 | 1996941 | Saipan International Airport | 2024-03-21 | 2023-06-19 | distributed-appointm-18 | 1002 |
| 1003 | bd2a0f9d-ff94-4412-832f-f289a7a8ef40 | Norma Fisher | 2025-08-05 | 2024-11-03 | baseline-appointm-19 | 1003 |

County executives are captured in `county_executives`. The surrogate key `id` (e.g. `1000`) is distinct from the external `executive_id`. The `full_name` column stores names such as `Theodore Mcgrath` and `Norma Fisher`, while `term_start_date` and `term_end_date` define the executive's term. The `appointment_authority` column records the authority type (e.g. `primary-appointm-16`). The foreign key `county_jurisdiction_id` ties each executive to their jurisdiction.

**Table `public_institutions`**

| id | institution_id | institution_name | institution_type | location_address | operational_status | board_of_trustees_id | county_jurisdiction_id |
|---|---|---|---|---|---|---|---|
| 100 | 9424913 | Extended Corridor | Memorial | baseline-location-61 | Active | 1 | 1000 |
| 101 | 8189481 | Pilot Series A | Museum | pilot-location-62 | Inactive | 2 | 1001 |
| 102 | 1437604 | Baseline Assessment | Park | extended-location-63 | Under Renovation | 3 | 1002 |
| 103 | 884346 | Distributed Survey | Civic Center | integrated-location-64 | Active | 4 | 1003 |

The `public_institutions` table describes the institutions under governance. The surrogate key `id` (e.g. `100`) is distinct from the external `institution_id`. The `institution_name` column holds names like `Extended Corridor` and `Pilot Series A`. `institution_type` categorizes the institution (`Memorial`, `Museum`, `Park`, `Civic Center`), `location_address` stores a location code (e.g. `baseline-location-61`), and `operational_status` records the current state (`Active`, `Inactive`, `Under Renovation`). Foreign keys `board_of_trustees_id` and `county_jurisdiction_id` link the institution to its board and jurisdiction.

The six base tables above form the core of the normalized schema. Three additional junction tables resolve many-to-many relationships that cannot be expressed through simple foreign keys.

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

The `appointments_members` junction table resolves the many-to-many relationship between `board_appointments` and `board_members`. A single appointment can involve multiple members, and a member can hold multiple appointments. The junction table contains foreign keys referencing `board_appointment_id` and `board_member_id`, enabling the database to track which members are associated with which appointments without duplicating data.

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

Similarly, `trusteeses_members` resolves the many-to-many relationship between `board_of_trusteeses` and `board_members`. A board can have many members, and a member can serve on multiple boards. The junction table contains foreign keys referencing `board_of_trustees_id` and `board_member_id`, allowing flexible membership across boards.

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

The `executives_appointments` junction table resolves the many-to-many relationship between `county_executives` and `board_appointments`. A county executive can authorize multiple appointments, and an appointment can involve multiple executives. The junction table contains foreign keys referencing `county_executive_id` and `board_appointment_id`, enabling the tracking of executive-appointment associations.

With the base tables and junction tables established, the schema provides a rich set of denormalized views that reconstruct domain facts for reporting. Each view joins the relevant tables to answer a specific governance question.

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

This view joins `board_appointments` with `board_members` to answer the question: "Which board members are associated with a given appointment?" The join reconstructs the appointment-member relationship, combining appointment metadata (`appointment_date`, `confirmation_status`) with member details (`first_name`, `last_name`, `current_role`). Reading a concrete row, one might see appointment `1000` (confirmed on `2022-05-03`) linked to board member `100` (Stephanie Collins, role `Trustee`). This view is essential for generating appointment rosters and verifying member assignments.

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

This view joins `board_appointments` with `board_of_trusteeses` to answer: "Which board does a given appointment belong to?" The join combines appointment temporal data (`term_start_date`, `term_end_date`) with board metadata (`board_name`, `establishment_date`, `governing_statute`). A sample row might show appointment `1001` (term `2023-10-10` to `2022-01-08`) linked to board `2` (`Legacy Assessment`, established `2025-12-22`). This view supports board-level appointment tracking and statutory compliance reporting.

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

This view joins `board_appointments` with `county_executives` to answer: "Which county executive authorized a given appointment?" The join combines appointment details (`appointment_date`, `statutory_authority`) with executive information (`full_name`, `term_start_date`, `appointment_authority`). A sample row might show appointment `1002` (statutory authority `seasonal-statutor-95`) linked to county executive `1002` (Saipan International Airport, authority `distributed-appointm-18`). This view is critical for accountability and executive oversight reporting.

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

This view joins `board_members` with `board_of_trusteeses` to answer: "Which board does a given member serve on?" The join combines member details (`first_name`, `last_name`, `current_role`, `is_reappointment`) with board metadata (`board_name`, `establishment_date`, `governing_statute`). A sample row might show board member `101` (Janice Johnston, role `Supervisor`, reappointment `true`) serving on board `2` (`Legacy Assessment`). This view supports membership rosters and board composition analysis.

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

This view joins `board_members` with `board_appointments` to answer: "Which appointment is associated with a given board member?" The join combines member details (`first_name`, `last_name`, `current_role`) with appointment metadata (`appointment_date`, `term_start_date`, `confirmation_status`). A sample row might show board member `102` (Upal Saha, role `Ex-Officio`) linked to appointment `1002` (date `2024-03-25`, status `rejected`). This view is useful for tracking member appointment histories and confirmation outcomes.

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

This view joins `board_members` with `county_jurisdictions` to answer: "Which county jurisdiction does a given board member serve?" The join combines member details (`first_name`, `last_name`, `current_role`) with jurisdiction metadata (`jurisdiction_name`, `state_code`, `legislative_body`). A sample row might show board member `103` (Katherine Snyder, role `Trustee`) serving jurisdiction `1003` (`Adaptive Model`, state code `8387549`). This view supports geographic membership analysis and jurisdictional compliance reporting.

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

This view joins `board_of_trusteeses` with `board_members` to answer: "Which board members serve on a given board of trustees?" The join combines board metadata (`board_name`, `establishment_date`, `governing_statute`) with member details (`first_name`, `last_name`, `current_role`, `is_reappointment`). A sample row might show board `1` (`Compact Series`, established `2024-07-11`) with member `100` (Stephanie Collins, role `Trustee`). This view is essential for board composition reports and membership verification.

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

This view joins `board_of_trusteeses` with `public_institutions` to answer: "Which public institution is associated with a given board of trustees?" The join combines board metadata (`board_name`, `establishment_date`) with institution details (`institution_name`, `institution_type`, `operational_status`). A sample row might show board `3` (`Regional Survey A`) linked to institution `102` (`Baseline Assessment`, type `Park`, status `Under Renovation`). This view supports institution-board relationship tracking and operational status reporting.

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

This view joins `board_of_trusteeses` with `county_jurisdictions` to answer: "Which county jurisdiction does a given board of trustees serve?" The join combines board metadata (`board_name`, `governing_statute`) with jurisdiction details (`jurisdiction_name`, `state_code`, `legislative_body`). A sample row might show board `4` (`Seasonal Corridor`) serving jurisdiction `1003` (`Adaptive Model`, legislative body `regional-legislat-24`). This view is critical for jurisdictional coverage analysis and legislative compliance.

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

This view joins `county_jurisdictions` with `board_of_trusteeses` to answer: "Which board of trustees serves a given county jurisdiction?" The join combines jurisdiction metadata (`jurisdiction_name`, `state_code`, `legislative_body`) with board details (`board_name`, `establishment_date`, `governing_statute`). A sample row might show jurisdiction `1000` (`Pilot Cluster`, state code `17788643`) served by board `1` (`Compact Series`, governing statute `distributed-governin-84`). This view supports jurisdiction-board mapping and governance structure documentation.

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

This view joins `county_jurisdictions` with `county_executives` to answer: "Which county executive serves a given county jurisdiction?" The join combines jurisdiction details (`jurisdiction_name`, `legislative_body`) with executive information (`full_name`, `term_start_date`, `appointment_authority`). A sample row might show jurisdiction `1001` (`Baseline Review`, legislative body `integrated-legislat-22`) served by executive `1001` (Account Name, authority `adaptive-appointm-17`). This view is essential for executive oversight and jurisdictional accountability reporting.

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

This view joins `county_jurisdictions` with `public_institutions` to answer: "Which public institution operates within a given county jurisdiction?" The join combines jurisdiction metadata (`jurisdiction_name`, `state_code`) with institution details (`institution_name`, `institution_type`, `operational_status`). A sample row might show jurisdiction `1002` (`Distributed Initiative A`, state code `790483`) containing institution `102` (`Baseline Assessment`, type `Park`, status `Under Renovation`). This view supports institutional coverage analysis and operational status monitoring.

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

This view joins `county_executives` with `board_appointments` to answer: "Which board appointments were authorized by a given county executive?" The join combines executive details (`full_name`, `term_start_date`, `appointment_authority`) with appointment metadata (`appointment_date`, `term_start_date`, `confirmation_status`, `statutory_authority`). A sample row might show county executive `1000` (Theodore Mcgrath, authority `primary-appointm-16`) authorizing appointment `1000` (date `2022-05-03`, status `pending`, statutory authority `extended-statutor-93`). This view is critical for executive appointment tracking and statutory compliance.

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

This view joins `county_executives` with `county_jurisdictions` to answer: "Which county jurisdiction does a given county executive serve?" The join combines executive details (`full_name`, `term_start_date`, `appointment_authority`) with jurisdiction metadata (`jurisdiction_name`, `state_code`, `legislative_body`). A sample row might show county executive `1003` (Norma Fisher, authority `baseline-appointm-19`) serving jurisdiction `1003` (`Adaptive Model`, state code `8387549`). This view supports executive jurisdiction mapping and governance structure documentation.

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

This view joins `public_institutions` with `board_of_trusteeses` to answer: "Which board of trustees governs a given public institution?" The join combines institution details (`institution_name`, `institution_type`, `operational_status`) with board metadata (`board_name`, `establishment_date`, `governing_statute`). A sample row might show institution `100` (`Extended Corridor`, type `Memorial`, status `Active`) governed by board `1` (`Compact Series`, established `2024-07-11`). This view is essential for institution-board relationship tracking and governance compliance.

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

This view joins `public_institutions` with `county_jurisdictions` to answer: "Which county jurisdiction contains a given public institution?" The join combines institution details (`institution_name`, `institution_type`, `location_address`) with jurisdiction metadata (`jurisdiction_name`, `state_code`, `legislative_body`). A sample row might show institution `103` (`Distributed Survey`, type `Civic Center`, location `integrated-location-64`) located in jurisdiction `1003` (`Adaptive Model`, legislative body `regional-legislat-24`). This view supports geographic institutional mapping and jurisdictional coverage analysis.

The schema design demonstrates a principled approach to ontology-grounded relational modelling. Six base tables capture the core entity types with their attributes and surrogate keys, while three junction tables resolve many-to-many relationships that arise from the flexible membership and appointment patterns inherent in the board governance domain. The twelve denormalized views reconstruct domain facts by joining the appropriate tables, each view answering a specific governance question with concrete data. For example, the view `v_board_appointment_board_member_detail` answers which members are associated with which appointments, combining appointment metadata with member details in a single result set. Similarly, `v_county_executive_board_appointment_detail` answers which appointments were authorized by which executives, linking executive information with appointment records. The foreign key relationships — such as `board_appointments.board_of_trustees_id` referencing `board_of_trusteeses.id`, or `county_jurisdictions.board_of_trustees_id` referencing `board_of_trusteeses.id` — ensure referential integrity across the schema, while the junction tables (`appointments_members`, `trusteeses_members`, `executives_appointments`) provide the flexibility needed to model the complex many-to-many relationships that characterize real-world board governance. This normalized design, combined with the denormalized views, provides both data integrity and reporting convenience, enabling stakeholders to query the schema at the appropriate level of abstraction for their needs.