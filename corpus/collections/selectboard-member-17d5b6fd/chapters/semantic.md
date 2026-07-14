The municipal governance domain captures the interlocking relationships between elected officials, deliberative bodies, regulatory instruments, and the commercial enterprises they oversee. At its core, the model distinguishes between the people who serve on selectboards, the boards themselves that exercise jurisdiction, the motions those members debate and vote upon, the policies that codify regulatory decisions, and the licenses that authorize business activity within defined parcels of land. Municipal funds track the financial infrastructure supporting these activities, while projects represent the capital initiatives funded through those channels. This chapter explains how each entity type is modelled as a relational table, how foreign keys and junction tables encode cardinality-bounded relationships, and how materialized views reconstruct domain facts from the normalized schema.

## Entity Types and Their Attributes

The foundation of the schema consists of ten base tables, each representing a distinct entity type with a primary key and a set of attributes that capture the entity's properties. The `selectboard_members` table stores individual officials who serve on municipal selectboards. Its primary key is `id`, an auto-incrementing integer, while `member_id` carries a domain-level identifier such as `10207158` for Theodore Mcgrath or `25820616` for Saipan International Airport. The `full_name` column holds the official's name, `role_title` records their position within the board (Chair, Vice Chair, Clerk, or Member), and `appointment_date` and `term_end_date` capture the temporal bounds of their service. The boolean `is_ex_officio` flag distinguishes members who serve by virtue of another office from those elected directly. The table also carries `municipal_board_id` and `motion_id` as foreign keys linking to the `municipal_boards` and `motions` tables respectively. A representative row shows Theodore Mcgrath appointed as Chair on `2022-05-03T16:12:00` with a term ending `2025-08-24`, serving ex officio on board `100`.

**Table `selectboard_members`**

| id | member_id | full_name | role_title | appointment_date | term_end_date | is_ex_officio | municipal_board_id | motion_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 10207158 | Theodore Mcgrath | Chair | 2022-05-03T16:12:00 | 2025-08-24 | true | 100 | OECD-CORE |
| 2 | 10207158 | Account Name | Vice Chair | 2023-10-14T23:29:00 | 2022-01-08 | false | 101 | 69422 |
| 3 | 25820616 | Saipan International Airport | Clerk | 2024-03-25T06:46:00 | 2023-06-19 | true | 102 | ChIJr7cItPtt5kcRM6ry7ecIYgw |
| 4 | 2002007020250 | Norma Fisher | Member | 2025-08-09T13:03:00 | 2024-11-03 | false | 103 | 4180962 |

The `municipal_boards` table defines the deliberative bodies themselves. Its surrogate primary key is `id`, while `board_id` holds a domain identifier such as `ChIJH2V4UYBt5kcR5doeFwuU7Ns` for the Compact Series board or `168553` for Legacy Assessment. The `board_name` and `jurisdiction_name` columns describe the board's identity and geographic or functional scope. The `meeting_schedule` column encodes the cadence of deliberation (e.g., `extended-meeting-99`, `integrated-meeting-100`), and `official_newspaper` records the publication through which the board communicates. The table includes `policy_id` and `municipal_fund_id` as foreign keys, along with `created_at` to timestamp the board's establishment. Board `100`, the Compact Series, operates under the `Pilot Cluster` jurisdiction with the `baseline-official-67` newspaper.

**Table `municipal_boards`**

| id | board_id | board_name | jurisdiction_name | meeting_schedule | official_newspaper | policy_id | municipal_fund_id | created_at |
|---|---|---|---|---|---|---|---|---|
| 100 | ChIJH2V4UYBt5kcR5doeFwuU7Ns | Compact Series | Pilot Cluster | extended-meeting-99 | baseline-official-67 | 100 | 1 | 2025-01-01 00:14:00 |
| 101 | 168553 | Legacy Assessment | Baseline Review | integrated-meeting-100 | pilot-official-68 | 101 | 2 | 2025-02-06 03:14:00 |
| 102 | 5006454 | Regional Survey A | Distributed Initiative A | seasonal-meeting-101 | extended-official-69 | 102 | 3 | 2025-03-11 06:14:00 |
| 103 | 1437585 | Seasonal Corridor | Adaptive Model | regional-meeting-102 | integrated-official-70 | 103 | 4 | 2025-04-16 09:14:00 |

The `motions` table records formal proposals brought before selectboards for deliberation. Its primary key is `motion_id`, which carries domain identifiers such as `OECD-CORE` or `ChIJr7cItPtt5kcRM6ry7ecIYgw`. The `motion_text` column stores a human-readable description (e.g., `pilot-motion-86`, `extended-motion-87`), while `vote_result` captures the outcome as `unanimous`, `majority`, `defeated`, or `abstained`. The `meeting_date` records when the motion was considered, and `is_adopted` is a boolean indicating whether it passed. The table includes `selectboard_member_id` and `seconded_by_selectboard_member_id` as foreign keys referencing the member who proposed and the member who seconded the motion, plus `policy_id` and `license_id` linking to the policy and license domains. Motion `OECD-CORE` was voted on `2023-10-23T21:39:00` with a unanimous result but was not adopted.

**Table `motions`**

| motion_id | motion_text | vote_result | meeting_date | is_adopted | selectboard_member_id | seconded_by_selectboard_member_id | policy_id | license_id |
|---|---|---|---|---|---|---|---|---|
| OECD-CORE | pilot-motion-86 | unanimous | 2023-10-23T21:39:00 | false | 1 | 1 | 100 | account_pymes_296 |
| 69422 | extended-motion-87 | majority | 2024-03-07T04:56:00 | true | 2 | 2 | 101 | 1250199 |
| ChIJr7cItPtt5kcRM6ry7ecIYgw | integrated-motion-88 | defeated | 2025-08-18T11:13:00 | false | 3 | 3 | 102 | ChIJm7V_gxFu5kcRAbqaOJHQUy0 |
| 4180962 | seasonal-motion-89 | abstained | 2022-01-02T18:30:00 | true | 4 | 4 | 103 | 605958 |

The `policies` table codifies the regulatory decisions that result from board deliberations. Its surrogate primary key is `id`, while `policy_id` carries a domain identifier such as `5844252` for the Regional Series policy or `ChIJkzsYUIBt5kcRM6_JHx26ONk` for the Extended Corridor policy. The `policy_name` column holds the policy's title, `adoption_date` records when it was enacted, and `version_number` tracks revisions (values range from `16` to `49` in the sample data). The `is_current` boolean indicates whether the version is the active one. Foreign keys `municipal_board_id` and `selectboard_member_id` link the policy to the board that adopted it and the member who sponsored it. Policy `5844252` (Regional Series) was adopted on `2025-08-12T07:09:00` at version `16` and is marked as current.

**Table `policies`**

| id | policy_id | policy_name | adoption_date | version_number | is_current | municipal_board_id | selectboard_member_id |
|---|---|---|---|---|---|---|---|
| 100 | 5844252 | Regional Series | 2025-08-12T07:09:00 | 16 | true | 100 | 1 |
| 101 | 10207142 | Seasonal Assessment D | 2022-01-23T14:26:00 | 27 | false | 101 | 2 |
| 102 | 1562847 | Integrated Survey | 2023-06-07T21:43:00 | 38 | true | 102 | 3 |
| 103 | ChIJkzsYUIBt5kcRM6_JHx26ONk | Extended Corridor | 2024-11-18T04:00:00 | 49 | false | 103 | 4 |

The `licenses` table captures the authorization instruments that permit business activity. Its primary key is `license_id`, carrying identifiers such as `account_pymes_296` or `ChIJm7V_gxFu5kcRAbqaOJHQUy0`. The `business_name` column records the name of the licensed entity (e.g., `Baseline Protocol D`, `Distributed Programme`), and `license_class` categorizes the authorization (e.g., `1st class hotel`, `2nd class`, `tobacco`). The `issue_date` and `expiry_date` columns define the validity period, while `status` records the current state as `approved`, `pending`, or `revoked`. Foreign keys `municipal_board_id` and `motion_id` link the license to the board that issued it and the motion that authorized it, and `business_entity_business_id` links to the `business_entities` table. License `account_pymes_296` for Baseline Protocol D was issued on `2023-02-01T13:51:00` and approved.

**Table `licenses`**

| license_id | business_name | license_class | issue_date | expiry_date | status | municipal_board_id | motion_id | business_entity_business_id |
|---|---|---|---|---|---|---|---|---|
| account_pymes_296 | Baseline Protocol D | 1st class hotel | 2023-02-01T13:51:00 | 2023-10-24 | approved | 100 | OECD-CORE | 3122ef58d8b44fb197236734beef7b29 |
| 1250199 | Distributed Programme | 2nd class | 2024-07-12T20:08:00 | 2024-03-08 | pending | 101 | 69422 | StasStaStS |
| ChIJm7V_gxFu5kcRAbqaOJHQUy0 | Adaptive Standard | tobacco | 2025-12-23T03:25:00 | 2025-08-19 | revoked | 102 | ChIJr7cItPtt5kcRM6ry7ecIYgw | 3990175 |
| 605958 | Primary Framework A | 1st class hotel | 2022-05-07T10:42:00 | 2022-01-03 | approved | 103 | 4180962 | 14484998 |

The `business_entities` table stores the commercial organizations subject to licensing. Its primary key is `business_id`, carrying identifiers such as `3122ef58d8b44fb197236734beef7b29` for the entity legally named Adaptive Model or `StasStaStS` for Primary Cluster. The `legal_name` column holds the formal corporate name, `dba_name` records the doing-business-as name, `business_type` classifies the legal structure (corporation, limited liability company, sole proprietorship), and `industry_sector` identifies the economic sector (e.g., `seasonal-industry-35`, `regional-industry-36`). Foreign keys `license_id`, `parcel_id`, and `municipal_fund_id` link the entity to its license, the parcel where it operates, and the municipal fund that supports it. The entity `3122ef58d8b44fb197236734beef7b29` (Adaptive Model) is a corporation in the seasonal-industry-35 sector.

**Table `business_entities`**

| business_id | legal_name | dba_name | business_type | industry_sector | license_id | parcel_id | municipal_fund_id |
|---|---|---|---|---|---|---|---|
| 3122ef58d8b44fb197236734beef7b29 | Adaptive Model | Regional Corridor | corporation | seasonal-industry-35 | account_pymes_296 | 1000 | 1 |
| StasStaStS | Primary Cluster | Seasonal Series D | limited liability company | regional-industry-36 | 1250199 | 1001 | 2 |
| 3990175 | Composite Review D | Integrated Assessment | sole proprietorship | legacy-industry-37 | ChIJm7V_gxFu5kcRAbqaOJHQUy0 | 1002 | 3 |
| 14484998 | Compact Initiative | Extended Survey | corporation | compact-industry-38 | 605958 | 1003 | 4 |

The `municipal_funds` table tracks the financial infrastructure through which the municipality allocates resources. Each fund is identified by a surrogate `id` and carries attributes describing its purpose, balance, and governance. Funds are linked to the `municipal_boards` that oversee them and to the `business_entities` and `projects` they finance.

**Table `municipal_funds`**

| municipal_fund_id | fund_id | fund_name | fiscal_year | total_allocation | current_balance | spending_threshold | municipal_board_id | project_id | business_entity_business_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 3158147 | 1% Option Tax Fund | primary-fiscal-64 | 9.95 | 1,387 | 15.20 | 100 | 1 | 3122ef58d8b44fb197236734beef7b29 |
| 2 | 6510 | Loan Fund | adaptive-fiscal-65 | 12.90 | 1,867 | 18.40 | 101 | 2 | StasStaStS |
| 3 | lu_tax_code_template_m_I | Reserve Fund | distributed-fiscal-66 | 15.85 | 65.72 | 21.60 | 102 | 3 | 3990175 |
| 4 | 3990185 | 1% Option Tax Fund | baseline-fiscal-67 | 18.80 | 2,453 | 24.80 | 103 | 4 | 14484998 |

The `projects` table records capital initiatives funded through municipal channels. Each project carries a surrogate primary key and attributes describing its scope, budget, timeline, and status. Projects are linked to the `municipal_funds` that finance them, the `parcels` where they are executed, and the `municipal_boards` that approve them.

**Table `projects`**

| project_id | project_name | estimated_cost | approval_level | status | municipal_fund_id | parcel_id | municipal_board_id |
|---|---|---|---|---|---|---|---|
| 1 | Compact Survey | 36.43 | board | proposed | 1 | 1000 | 100 |
| 2 | Legacy Corridor | 17.41 | voter referendum | approved | 2 | 1001 | 101 |
| 3 | Regional Series A | 12.74 | board | in progress | 3 | 1002 | 102 |
| 4 | Seasonal Assessment | 13.49 | voter referendum | complete | 4 | 1003 | 103 |

The `parcels` table represents the geographic parcels of land within municipal jurisdiction. Each parcel carries a surrogate primary key and attributes describing its boundaries, zoning classification, and land use. Parcels are linked to the `business_entities` that operate on them, the `projects` executed there, and the `municipal_boards` that regulate them.

**Table `parcels`**

| id | parcel_id | address | zoning_district | land_use | owner_name | is_publicly_accessible | business_entity_business_id | project_id | municipal_board_id |
|---|---|---|---|---|---|---|---|---|---|
| 1000 | 4447034 | distributed-address-72 | adaptive-zoning-95 | parking | Craig Childs | false | 3122ef58d8b44fb197236734beef7b29 | 1 | 100 |
| 1001 | 325464 | baseline-address-73 | distributed-zoning-96 | commercial | Kimberly Smith | true | StasStaStS | 2 | 101 |
| 1002 | 3990187 | pilot-address-74 | baseline-zoning-97 | residential | Michelle Kelley | false | 3990175 | 3 | 102 |
| 1003 | 110 | extended-address-75 | pilot-zoning-98 | public | Jorge Sullivan | true | 14484998 | 4 | 103 |

The `boards_members` table serves as a junction table that resolves many-to-many relationships between boards and members. It carries composite foreign keys referencing both `municipal_boards` and `selectboard_members`, enabling a single member to serve on multiple boards and a single board to include multiple members. This normalization prevents data redundancy while preserving the full membership history.

**Table `boards_members`**

| municipal_board_id | selectboard_member_id |
|---|---|
| 100 | 1 |
| 100 | 2 |
| 101 | 2 |
| 101 | 3 |
| 102 | 3 |
| 102 | 4 |
| 103 | 4 |
| 103 | 1 |

## Foreign Keys and Cardinality-Bounded Relationships

The schema encodes cardinality-bounded relationships through foreign key columns embedded directly in the base tables. The `selectboard_members.municipal_board_id` column constrains each member to belong to exactly one municipal board, establishing a many-to-one relationship: many members map to one board. In the data, member `10207158` (Theodore Mcgrath) is linked to board `100` (Compact Series), while member `25820616` (Saipan International Airport) is linked to board `102` (Regional Survey A). The `selectboard_members.motion_id` column similarly constrains each member to a single motion, though this design suggests a simplified model where each member is associated with their most recent or primary motion.

The `municipal_boards.policy_id` and `municipal_boards.municipal_fund_id` columns each establish many-to-one relationships: many boards may reference the same policy or fund, but each board row points to exactly one policy and one fund. Board `100` references policy `100` and fund `1`, while board `101` references policy `101` and fund `2`. The `motions.selectboard_member_id` and `motions.seconded_by_selectboard_member_id` columns both reference `selectboard_members`, creating two distinct foreign key paths from motions to members — one for the proposer and one for the seconder. Motion `OECD-CORE` was proposed by member `1` and seconded by member `1`, indicating the same member both proposed and seconded the motion.

The `motions.policy_id` and `motions.license_id` columns link motions to the policy and license domains, respectively. The `policies.municipal_board_id` and `policies.selectboard_member_id` columns create bidirectional links: policies reference the board that adopted them and the member who sponsored them, while boards and members are referenced back from policies. License `account_pymes_296` is linked to motion `OECD-CORE` and board `100`, showing how a single license can be traced back through the motion that authorized it to the board that issued it.

The `licenses.municipal_board_id` and `licenses.motion_id` columns establish that each license is issued by a specific board and authorized by a specific motion. The `licenses.business_entity_business_id` column links each license to the business entity it authorizes. The `business_entities.license_id`, `business_entities.parcel_id`, and `business_entities.municipal_fund_id` columns each create many-to-one relationships: many business entities may hold the same license (though in practice each entity typically holds one), many operate on the same parcel, and many are supported by the same municipal fund. Entity `3122ef58d8b44fb197236734beef7b29` (Adaptive Model) holds license `account_pymes_296`, operates on parcel `1000`, and is supported by fund `1`.

The `boards_members` junction table resolves the many-to-many relationship between `municipal_boards` and `selectboard_members` that the direct foreign keys in `selectboard_members` cannot fully capture. Each row in `boards_members` contains a pair of foreign keys — one referencing a board and one referencing a member — allowing a member to appear in multiple rows (serving on multiple boards) and a board to appear in multiple rows (having multiple members). This is the canonical normalization pattern for many-to-many relationships in relational design.

## Materialized Views and Domain Fact Reconstruction

Materialized views in this schema reconstruct domain facts by joining normalized tables along their foreign key paths. Each view answers a specific analytical question by denormalizing the relationships that span multiple base tables.

**View `v_selectboard_member_municipal_board`**

```sql
CREATE VIEW v_selectboard_member_municipal_board AS
SELECT a.id, a.member_id, a.full_name, a.role_title, b.id AS board_id, b.board_id AS board_board_id, b.board_name AS board_board_name
FROM selectboard_members a JOIN municipal_boards b ON a.municipal_board_id = b.id;
```

| id | member_id | full_name | role_title | board_id | board_board_id | board_board_name |
|---|---|---|---|---|---|---|
| 1 | 10207158 | Theodore Mcgrath | Chair | 100 | ChIJH2V4UYBt5kcR5doeFwuU7Ns | Compact Series |
| 2 | 10207158 | Account Name | Vice Chair | 101 | 168553 | Legacy Assessment |
| 3 | 25820616 | Saipan International Airport | Clerk | 102 | 5006454 | Regional Survey A |
| 4 | 2002007020250 | Norma Fisher | Member | 103 | 1437585 | Seasonal Corridor |

The view `v_selectboard_member_municipal_board` joins `selectboard_members` to `municipal_boards` on the `municipal_board_id` foreign key, producing a denormalized row that combines member attributes with board attributes. This view answers the question: "Which municipal board does each selectboard member serve on, and what are that board's characteristics?" A row from this view might show Theodore Mcgrath (Chair, appointed `2022-05-03T16:12:00`) serving on the Compact Series board (`board_id: ChIJH2V4UYBt5kcR5doeFwuU7Ns`) under the Pilot Cluster jurisdiction. The join is a simple inner join on `selectboard_members.municipal_board_id = municipal_boards.id`, and the view materializes the board's `board_name`, `jurisdiction_name`, `meeting_schedule`, and `official_newspaper` alongside the member's `full_name`, `role_title`, and term dates.

**View `v_selectboard_member_motion`**

```sql
CREATE VIEW v_selectboard_member_motion AS
SELECT a.id, a.member_id, a.full_name, a.role_title, b.motion_id AS motion_motion_id, b.motion_text AS motion_motion_text, b.vote_result AS motion_vote_result
FROM selectboard_members a JOIN motions b ON a.motion_id = b.motion_id;
```

| id | member_id | full_name | role_title | motion_motion_id | motion_motion_text | motion_vote_result |
|---|---|---|---|---|---|---|
| 1 | 10207158 | Theodore Mcgrath | Chair | OECD-CORE | pilot-motion-86 | unanimous |
| 2 | 10207158 | Account Name | Vice Chair | 69422 | extended-motion-87 | majority |
| 3 | 25820616 | Saipan International Airport | Clerk | ChIJr7cItPtt5kcRM6ry7ecIYgw | integrated-motion-88 | defeated |
| 4 | 2002007020250 | Norma Fisher | Member | 4180962 | seasonal-motion-89 | abstained |

The view `v_selectboard_member_motion` joins `selectboard_members` to `motions` on the `motion_id` foreign key, answering: "What motion is associated with each selectboard member, and what was the outcome of that motion?" A representative row might show member `10207158` (Theodore Mcgrath) associated with motion `OECD-CORE` (text: `pilot-motion-86`, vote result: `unanimous`, meeting date: `2023-10-23T21:39:00`, not adopted). The join reconstructs the member-motion relationship that is stored as a foreign key in `selectboard_members`, making it directly queryable without requiring a join at query time.

**View `v_municipal_board_selectboard_member_detail`**

```sql
CREATE VIEW v_municipal_board_selectboard_member_detail AS
SELECT a.id, a.board_id, a.board_name, b.id AS member_id, b.member_id AS member_member_id, b.full_name AS member_full_name
FROM municipal_boards a
  JOIN boards_members j ON j.municipal_board_id = a.id
  JOIN selectboard_members b ON b.id = j.selectboard_member_id;
```

| id | board_id | board_name | member_id | member_member_id | member_full_name |
|---|---|---|---|---|---|
| 100 | ChIJH2V4UYBt5kcR5doeFwuU7Ns | Compact Series | 1 | 10207158 | Theodore Mcgrath |
| 100 | ChIJH2V4UYBt5kcR5doeFwuU7Ns | Compact Series | 2 | 10207158 | Account Name |
| 101 | 168553 | Legacy Assessment | 2 | 10207158 | Account Name |
| 101 | 168553 | Legacy Assessment | 3 | 25820616 | Saipan International Airport |
| 102 | 5006454 | Regional Survey A | 3 | 25820616 | Saipan International Airport |
| 102 | 5006454 | Regional Survey A | 4 | 2002007020250 | Norma Fisher |
| 103 | 1437585 | Seasonal Corridor | 4 | 2002007020250 | Norma Fisher |
| 103 | 1437585 | Seasonal Corridor | 1 | 10207158 | Theodore Mcgrath |

The view `v_municipal_board_selectboard_member_detail` performs the inverse join of `v_selectboard_member_municipal_board`, starting from `municipal_boards` and joining to `selectboard_members`. It answers: "Which members serve on each municipal board, and what are their roles and term details?" A row from this view might show board `100` (Compact Series) with member Theodore Mcgrath serving as Chair, appointed `2022-05-03T16:12:00` with term ending `2025-08-24`. This view is useful for board-level reporting, where the board is the primary entity and members are the detail.

**View `v_municipal_board_policy`**

```sql
CREATE VIEW v_municipal_board_policy AS
SELECT a.id, a.board_id, a.board_name, a.jurisdiction_name, b.id AS policy_id, b.policy_id AS policy_policy_id, b.policy_name AS policy_policy_name
FROM municipal_boards a JOIN policies b ON a.policy_id = b.id;
```

| id | board_id | board_name | jurisdiction_name | policy_id | policy_policy_id | policy_policy_name |
|---|---|---|---|---|---|---|
| 100 | ChIJH2V4UYBt5kcR5doeFwuU7Ns | Compact Series | Pilot Cluster | 100 | 5844252 | Regional Series |
| 101 | 168553 | Legacy Assessment | Baseline Review | 101 | 10207142 | Seasonal Assessment D |
| 102 | 5006454 | Regional Survey A | Distributed Initiative A | 102 | 1562847 | Integrated Survey |
| 103 | 1437585 | Seasonal Corridor | Adaptive Model | 103 | ChIJkzsYUIBt5kcRM6_JHx26ONk | Extended Corridor |

The view `v_municipal_board_policy` joins `municipal_boards` to `policies` on the `policy_id` foreign key, answering: "Which policy is associated with each municipal board, and what are the policy's details?" A representative row might show board `100` (Compact Series) linked to policy `5844252` (Regional Series, adopted `2025-08-12T07:09:00`, version `16`, current). The join materializes the policy's `policy_name`, `adoption_date`, `version_number`, and `is_current` alongside the board's identifying attributes, enabling policy-level analysis grouped by board.

**View `v_municipal_board_municipal_fund`**

```sql
CREATE VIEW v_municipal_board_municipal_fund AS
SELECT a.id, a.board_id, a.board_name, a.jurisdiction_name, b.municipal_fund_id AS fund_municipal_fund_id, b.fund_id AS fund_fund_id, b.fund_name AS fund_fund_name
FROM municipal_boards a JOIN municipal_funds b ON a.municipal_fund_id = b.municipal_fund_id;
```

| id | board_id | board_name | jurisdiction_name | fund_municipal_fund_id | fund_fund_id | fund_fund_name |
|---|---|---|---|---|---|---|
| 100 | ChIJH2V4UYBt5kcR5doeFwuU7Ns | Compact Series | Pilot Cluster | 1 | 3158147 | 1% Option Tax Fund |
| 101 | 168553 | Legacy Assessment | Baseline Review | 2 | 6510 | Loan Fund |
| 102 | 5006454 | Regional Survey A | Distributed Initiative A | 3 | lu_tax_code_template_m_I | Reserve Fund |
| 103 | 1437585 | Seasonal Corridor | Adaptive Model | 4 | 3990185 | 1% Option Tax Fund |

The view `v_municipal_board_municipal_fund` joins `municipal_boards` to `municipal_funds` on the `municipal_fund_id` foreign key, answering: "Which municipal fund is associated with each board, and what are the fund's financial attributes?" A row from this view might show board `100` (Compact Series) linked to fund `1`, with the fund's balance, purpose, and governance details materialized alongside the board's attributes. This view supports financial reporting at the board level.

**View `v_motion_selectboard_member`**

```sql
CREATE VIEW v_motion_selectboard_member AS
SELECT a.motion_id, a.motion_text, a.vote_result, a.meeting_date, b.id AS member_id, b.member_id AS member_member_id, b.full_name AS member_full_name
FROM motions a JOIN selectboard_members b ON a.selectboard_member_id = b.id;
```

| motion_id | motion_text | vote_result | meeting_date | member_id | member_member_id | member_full_name |
|---|---|---|---|---|---|---|
| OECD-CORE | pilot-motion-86 | unanimous | 2023-10-23T21:39:00 | 1 | 10207158 | Theodore Mcgrath |
| 69422 | extended-motion-87 | majority | 2024-03-07T04:56:00 | 2 | 10207158 | Account Name |
| ChIJr7cItPtt5kcRM6ry7ecIYgw | integrated-motion-88 | defeated | 2025-08-18T11:13:00 | 3 | 25820616 | Saipan International Airport |
| 4180962 | seasonal-motion-89 | abstained | 2022-01-02T18:30:00 | 4 | 2002007020250 | Norma Fisher |

The view `v_motion_selectboard_member` joins `motions` to `selectboard_members` on the `selectboard_member_id` foreign key, answering: "Which selectboard member proposed each motion, and what were the motion's details?" A representative row might show motion `OECD-CORE` (text: `pilot-motion-86`, vote result: `unanimous`) proposed by member `1` (Theodore Mcgrath). The join materializes the proposer's `full_name` and `role_title` alongside the motion's attributes, enabling motion-level analysis with member context.

**View `v_motion_policy`**

```sql
CREATE VIEW v_motion_policy AS
SELECT a.motion_id, a.motion_text, a.vote_result, a.meeting_date, b.id AS policy_id, b.policy_id AS policy_policy_id, b.policy_name AS policy_policy_name
FROM motions a JOIN policies b ON a.policy_id = b.id;
```

| motion_id | motion_text | vote_result | meeting_date | policy_id | policy_policy_id | policy_policy_name |
|---|---|---|---|---|---|---|
| OECD-CORE | pilot-motion-86 | unanimous | 2023-10-23T21:39:00 | 100 | 5844252 | Regional Series |
| 69422 | extended-motion-87 | majority | 2024-03-07T04:56:00 | 101 | 10207142 | Seasonal Assessment D |
| ChIJr7cItPtt5kcRM6ry7ecIYgw | integrated-motion-88 | defeated | 2025-08-18T11:13:00 | 102 | 1562847 | Integrated Survey |
| 4180962 | seasonal-motion-89 | abstained | 2022-01-02T18:30:00 | 103 | ChIJkzsYUIBt5kcRM6_JHx26ONk | Extended Corridor |

The view `v_motion_policy` joins `motions` to `policies` on the `policy_id` foreign key, answering: "Which policy is associated with each motion, and what are the policy's details?" A row from this view might show motion `OECD-CORE` linked to policy `100` (Regional Series, adopted `2025-08-12T07:09:00`). This view supports the analysis of how motions relate to the policies they reference or amend.

**View `v_motion_license`**

```sql
CREATE VIEW v_motion_license AS
SELECT a.motion_id, a.motion_text, a.vote_result, a.meeting_date, b.license_id AS license_license_id, b.business_name AS license_business_name, b.license_class AS license_license_class
FROM motions a JOIN licenses b ON a.license_id = b.license_id;
```

| motion_id | motion_text | vote_result | meeting_date | license_license_id | license_business_name | license_license_class |
|---|---|---|---|---|---|---|
| OECD-CORE | pilot-motion-86 | unanimous | 2023-10-23T21:39:00 | account_pymes_296 | Baseline Protocol D | 1st class hotel |
| 69422 | extended-motion-87 | majority | 2024-03-07T04:56:00 | 1250199 | Distributed Programme | 2nd class |
| ChIJr7cItPtt5kcRM6ry7ecIYgw | integrated-motion-88 | defeated | 2025-08-18T11:13:00 | ChIJm7V_gxFu5kcRAbqaOJHQUy0 | Adaptive Standard | tobacco |
| 4180962 | seasonal-motion-89 | abstained | 2022-01-02T18:30:00 | 605958 | Primary Framework A | 1st class hotel |

The view `v_motion_license` joins `motions` to `licenses` on the `license_id` foreign key, answering: "Which license is associated with each motion, and what are the license's details?" A representative row might show motion `OECD-CORE` linked to license `account_pymes_296` (business: Baseline Protocol D, class: `1st class hotel`, status: `approved`). This view traces the relationship between deliberative motions and the licenses they authorize.

**View `v_policy_municipal_board`**

```sql
CREATE VIEW v_policy_municipal_board AS
SELECT a.id, a.policy_id, a.policy_name, a.adoption_date, b.id AS board_id, b.board_id AS board_board_id, b.board_name AS board_board_name
FROM policies a JOIN municipal_boards b ON a.municipal_board_id = b.id;
```

| id | policy_id | policy_name | adoption_date | board_id | board_board_id | board_board_name |
|---|---|---|---|---|---|---|
| 100 | 5844252 | Regional Series | 2025-08-12T07:09:00 | 100 | ChIJH2V4UYBt5kcR5doeFwuU7Ns | Compact Series |
| 101 | 10207142 | Seasonal Assessment D | 2022-01-23T14:26:00 | 101 | 168553 | Legacy Assessment |
| 102 | 1562847 | Integrated Survey | 2023-06-07T21:43:00 | 102 | 5006454 | Regional Survey A |
| 103 | ChIJkzsYUIBt5kcRM6_JHx26ONk | Extended Corridor | 2024-11-18T04:00:00 | 103 | 1437585 | Seasonal Corridor |

The view `v_policy_municipal_board` joins `policies` to `municipal_boards` on the `municipal_board_id` foreign key, answering: "Which municipal board adopted each policy, and what are the board's characteristics?" A row from this view might show policy `5844252` (Regional Series) adopted by board `100` (Compact Series, jurisdiction: Pilot Cluster). This view supports policy-level reporting with board context.

**View `v_policy_selectboard_member`**

```sql
CREATE VIEW v_policy_selectboard_member AS
SELECT a.id, a.policy_id, a.policy_name, a.adoption_date, b.id AS member_id, b.member_id AS member_member_id, b.full_name AS member_full_name
FROM policies a JOIN selectboard_members b ON a.selectboard_member_id = b.id;
```

| id | policy_id | policy_name | adoption_date | member_id | member_member_id | member_full_name |
|---|---|---|---|---|---|---|
| 100 | 5844252 | Regional Series | 2025-08-12T07:09:00 | 1 | 10207158 | Theodore Mcgrath |
| 101 | 10207142 | Seasonal Assessment D | 2022-01-23T14:26:00 | 2 | 10207158 | Account Name |
| 102 | 1562847 | Integrated Survey | 2023-06-07T21:43:00 | 3 | 25820616 | Saipan International Airport |
| 103 | ChIJkzsYUIBt5kcRM6_JHx26ONk | Extended Corridor | 2024-11-18T04:00:00 | 4 | 2002007020250 | Norma Fisher |

The view `v_policy_selectboard_member` joins `policies` to `selectboard_members` on the `selectboard_member_id` foreign key, answering: "Which selectboard member sponsored each policy, and what are the policy's details?" A representative row might show policy `5844252` (Regional Series) sponsored by member `1` (Theodore Mcgrath, Chair). This view enables analysis of which members are most active in policy sponsorship.

**View `v_license_municipal_board`**

```sql
CREATE VIEW v_license_municipal_board AS
SELECT a.license_id, a.business_name, a.license_class, a.issue_date, b.id AS board_id, b.board_id AS board_board_id, b.board_name AS board_board_name
FROM licenses a JOIN municipal_boards b ON a.municipal_board_id = b.id;
```

| license_id | business_name | license_class | issue_date | board_id | board_board_id | board_board_name |
|---|---|---|---|---|---|---|
| account_pymes_296 | Baseline Protocol D | 1st class hotel | 2023-02-01T13:51:00 | 100 | ChIJH2V4UYBt5kcR5doeFwuU7Ns | Compact Series |
| 1250199 | Distributed Programme | 2nd class | 2024-07-12T20:08:00 | 101 | 168553 | Legacy Assessment |
| ChIJm7V_gxFu5kcRAbqaOJHQUy0 | Adaptive Standard | tobacco | 2025-12-23T03:25:00 | 102 | 5006454 | Regional Survey A |
| 605958 | Primary Framework A | 1st class hotel | 2022-05-07T10:42:00 | 103 | 1437585 | Seasonal Corridor |

The view `v_license_municipal_board` joins `licenses` to `municipal_boards` on the `municipal_board_id` foreign key, answering: "Which municipal board issued each license, and what are the license's details?" A row from this view might show license `account_pymes_296` (Baseline Protocol D, `1st class hotel`, approved) issued by board `100` (Compact Series). This view supports license-level reporting with board context.

**View `v_license_motion`**

```sql
CREATE VIEW v_license_motion AS
SELECT a.license_id, a.business_name, a.license_class, a.issue_date, b.motion_id AS motion_motion_id, b.motion_text AS motion_motion_text, b.vote_result AS motion_vote_result
FROM licenses a JOIN motions b ON a.motion_id = b.motion_id;
```

| license_id | business_name | license_class | issue_date | motion_motion_id | motion_motion_text | motion_vote_result |
|---|---|---|---|---|---|---|
| account_pymes_296 | Baseline Protocol D | 1st class hotel | 2023-02-01T13:51:00 | OECD-CORE | pilot-motion-86 | unanimous |
| 1250199 | Distributed Programme | 2nd class | 2024-07-12T20:08:00 | 69422 | extended-motion-87 | majority |
| ChIJm7V_gxFu5kcRAbqaOJHQUy0 | Adaptive Standard | tobacco | 2025-12-23T03:25:00 | ChIJr7cItPtt5kcRM6ry7ecIYgw | integrated-motion-88 | defeated |
| 605958 | Primary Framework A | 1st class hotel | 2022-05-07T10:42:00 | 4180962 | seasonal-motion-89 | abstained |

The view `v_license_motion` joins `licenses` to `motions` on the `motion_id` foreign key, answering: "Which motion authorized each license, and what were the motion's details?" A representative row might show license `account_pymes_296` authorized by motion `OECD-CORE` (text: `pilot-motion-86`, vote result: `unanimous`). This view traces the causal chain from deliberation to authorization.

**View `v_license_business_entity`**

```sql
CREATE VIEW v_license_business_entity AS
SELECT a.license_id, a.business_name, a.license_class, a.issue_date, b.business_id AS entity_business_id, b.legal_name AS entity_legal_name, b.dba_name AS entity_dba_name
FROM licenses a JOIN business_entities b ON a.business_entity_business_id = b.business_id;
```

| license_id | business_name | license_class | issue_date | entity_business_id | entity_legal_name | entity_dba_name |
|---|---|---|---|---|---|---|
| account_pymes_296 | Baseline Protocol D | 1st class hotel | 2023-02-01T13:51:00 | 3122ef58d8b44fb197236734beef7b29 | Adaptive Model | Regional Corridor |
| 1250199 | Distributed Programme | 2nd class | 2024-07-12T20:08:00 | StasStaStS | Primary Cluster | Seasonal Series D |
| ChIJm7V_gxFu5kcRAbqaOJHQUy0 | Adaptive Standard | tobacco | 2025-12-23T03:25:00 | 3990175 | Composite Review D | Integrated Assessment |
| 605958 | Primary Framework A | 1st class hotel | 2022-05-07T10:42:00 | 14484998 | Compact Initiative | Extended Survey |

The view `v_license_business_entity` joins `licenses` to `business_entities` on the `business_entity_business_id` foreign key, answering: "Which business entity holds each license, and what are the entity's details?" A row from this view might show license `account_pymes_296` held by entity `3122ef58d8b44fb197236734beef7b29` (legal name: Adaptive Model, type: corporation, sector: seasonal-industry-35). This view supports license-level analysis with business entity context.

**View `v_business_entity_license`**

```sql
CREATE VIEW v_business_entity_license AS
SELECT a.business_id, a.legal_name, a.dba_name, a.business_type, b.license_id AS license_license_id, b.business_name AS license_business_name, b.license_class AS license_license_class
FROM business_entities a JOIN licenses b ON a.license_id = b.license_id;
```

| business_id | legal_name | dba_name | business_type | license_license_id | license_business_name | license_license_class |
|---|---|---|---|---|---|---|
| 3122ef58d8b44fb197236734beef7b29 | Adaptive Model | Regional Corridor | corporation | account_pymes_296 | Baseline Protocol D | 1st class hotel |
| StasStaStS | Primary Cluster | Seasonal Series D | limited liability company | 1250199 | Distributed Programme | 2nd class |
| 3990175 | Composite Review D | Integrated Assessment | sole proprietorship | ChIJm7V_gxFu5kcRAbqaOJHQUy0 | Adaptive Standard | tobacco |
| 14484998 | Compact Initiative | Extended Survey | corporation | 605958 | Primary Framework A | 1st class hotel |

The view `v_business_entity_license` joins `business_entities` to `licenses` on the `license_id` foreign key, answering: "Which license does each business entity hold, and what are the license's details?" A representative row might show entity `3122ef58d8b44fb197236734beef7b29` (Adaptive Model) holding license `account_pymes_296` (Baseline Protocol D, `1st class hotel`, approved). This view is useful for business-entity-level reporting with license context.

**View `v_business_entity_parcel`**

```sql
CREATE VIEW v_business_entity_parcel AS
SELECT a.business_id, a.legal_name, a.dba_name, a.business_type, b.id AS parcel_id, b.parcel_id AS parcel_parcel_id, b.address AS parcel_address
FROM business_entities a JOIN parcels b ON a.parcel_id = b.id;
```

| business_id | legal_name | dba_name | business_type | parcel_id | parcel_parcel_id | parcel_address |
|---|---|---|---|---|---|---|
| 3122ef58d8b44fb197236734beef7b29 | Adaptive Model | Regional Corridor | corporation | 1000 | 4447034 | distributed-address-72 |
| StasStaStS | Primary Cluster | Seasonal Series D | limited liability company | 1001 | 325464 | baseline-address-73 |
| 3990175 | Composite Review D | Integrated Assessment | sole proprietorship | 1002 | 3990187 | pilot-address-74 |
| 14484998 | Compact Initiative | Extended Survey | corporation | 1003 | 110 | extended-address-75 |

The view `v_business_entity_parcel` joins `business_entities` to `parcels` on the `parcel_id` foreign key, answering: "On which parcel does each business entity operate, and what are the parcel's characteristics?" A row from this view might show entity `3122ef58d8b44fb197236734beef7b29` (Adaptive Model) operating on parcel `1000`. This view supports geographic analysis of business activity.

**View `v_business_entity_municipal_fund`**

```sql
CREATE VIEW v_business_entity_municipal_fund AS
SELECT a.business_id, a.legal_name, a.dba_name, a.business_type, b.municipal_fund_id AS fund_municipal_fund_id, b.fund_id AS fund_fund_id, b.fund_name AS fund_fund_name
FROM business_entities a JOIN municipal_funds b ON a.municipal_fund_id = b.municipal_fund_id;
```

| business_id | legal_name | dba_name | business_type | fund_municipal_fund_id | fund_fund_id | fund_fund_name |
|---|---|---|---|---|---|---|
| 3122ef58d8b44fb197236734beef7b29 | Adaptive Model | Regional Corridor | corporation | 1 | 3158147 | 1% Option Tax Fund |
| StasStaStS | Primary Cluster | Seasonal Series D | limited liability company | 2 | 6510 | Loan Fund |
| 3990175 | Composite Review D | Integrated Assessment | sole proprietorship | 3 | lu_tax_code_template_m_I | Reserve Fund |
| 14484998 | Compact Initiative | Extended Survey | corporation | 4 | 3990185 | 1% Option Tax Fund |

The view `v_business_entity_municipal_fund` joins `business_entities` to `municipal_funds` on the `municipal_fund_id` foreign key, answering: "Which municipal fund supports each business entity, and what are the fund's financial attributes?" A representative row might show entity `3122ef58d8b44fb197236734beef7b29` (Adaptive Model) supported by fund `1`. This view enables financial analysis of which entities benefit from which funds.

**View `v_municipal_fund_municipal_board`**

```sql
CREATE VIEW v_municipal_fund_municipal_board AS
SELECT a.municipal_fund_id, a.fund_id, a.fund_name, a.fiscal_year, b.id AS board_id, b.board_id AS board_board_id, b.board_name AS board_board_name
FROM municipal_funds a JOIN municipal_boards b ON a.municipal_board_id = b.id;
```

| municipal_fund_id | fund_id | fund_name | fiscal_year | board_id | board_board_id | board_board_name |
|---|---|---|---|---|---|---|
| 1 | 3158147 | 1% Option Tax Fund | primary-fiscal-64 | 100 | ChIJH2V4UYBt5kcR5doeFwuU7Ns | Compact Series |
| 2 | 6510 | Loan Fund | adaptive-fiscal-65 | 101 | 168553 | Legacy Assessment |
| 3 | lu_tax_code_template_m_I | Reserve Fund | distributed-fiscal-66 | 102 | 5006454 | Regional Survey A |
| 4 | 3990185 | 1% Option Tax Fund | baseline-fiscal-67 | 103 | 1437585 | Seasonal Corridor |

The view `v_municipal_fund_municipal_board` joins `municipal_funds` to `municipal_boards` on the `municipal_board_id` foreign key, answering: "Which municipal board oversees each fund, and what are the fund's financial attributes?" A row from this view might show fund `1` overseen by board `100` (Compact Series). This view supports fund-level reporting with board governance context.

**View `v_municipal_fund_project`**

```sql
CREATE VIEW v_municipal_fund_project AS
SELECT a.municipal_fund_id, a.fund_id, a.fund_name, a.fiscal_year, b.project_id AS project_project_id, b.project_name AS project_project_name, b.estimated_cost AS project_estimated_cost
FROM municipal_funds a JOIN projects b ON a.project_id = b.project_id;
```

| municipal_fund_id | fund_id | fund_name | fiscal_year | project_project_id | project_project_name | project_estimated_cost |
|---|---|---|---|---|---|---|
| 1 | 3158147 | 1% Option Tax Fund | primary-fiscal-64 | 1 | Compact Survey | 36.43 |
| 2 | 6510 | Loan Fund | adaptive-fiscal-65 | 2 | Legacy Corridor | 17.41 |
| 3 | lu_tax_code_template_m_I | Reserve Fund | distributed-fiscal-66 | 3 | Regional Series A | 12.74 |
| 4 | 3990185 | 1% Option Tax Fund | baseline-fiscal-67 | 4 | Seasonal Assessment | 13.49 |

The view `v_municipal_fund_project` joins `municipal_funds` to `projects` on the `project_municipal_fund_id` foreign key, answering: "Which projects are funded by each municipal fund, and what are the project's details?" A representative row might show fund `1` funding project `100` (scope: road improvement, budget: $500,000). This view supports capital planning analysis at the fund level.

**View `v_municipal_fund_business_entity`**

```sql
CREATE VIEW v_municipal_fund_business_entity AS
SELECT a.municipal_fund_id, a.fund_id, a.fund_name, a.fiscal_year, b.business_id AS entity_business_id, b.legal_name AS entity_legal_name, b.dba_name AS entity_dba_name
FROM municipal_funds a JOIN business_entities b ON a.business_entity_business_id = b.business_id;
```

| municipal_fund_id | fund_id | fund_name | fiscal_year | entity_business_id | entity_legal_name | entity_dba_name |
|---|---|---|---|---|---|---|
| 1 | 3158147 | 1% Option Tax Fund | primary-fiscal-64 | 3122ef58d8b44fb197236734beef7b29 | Adaptive Model | Regional Corridor |
| 2 | 6510 | Loan Fund | adaptive-fiscal-65 | StasStaStS | Primary Cluster | Seasonal Series D |
| 3 | lu_tax_code_template_m_I | Reserve Fund | distributed-fiscal-66 | 3990175 | Composite Review D | Integrated Assessment |
| 4 | 3990185 | 1% Option Tax Fund | baseline-fiscal-67 | 14484998 | Compact Initiative | Extended Survey |

The view `v_municipal_fund_business_entity` joins `municipal_funds` to `business_entities` on the `municipal_fund_id` foreign key, answering: "Which business entities are supported by each municipal fund, and what are the entity's details?" A row from this view might show fund `1` supporting entity `3122ef58d8b44fb197236734beef7b29` (Adaptive Model, corporation). This view enables analysis of fund beneficiaries.

**View `v_project_municipal_fund`**

```sql
CREATE VIEW v_project_municipal_fund AS
SELECT a.project_id, a.project_name, a.estimated_cost, a.approval_level, b.municipal_fund_id AS fund_municipal_fund_id, b.fund_id AS fund_fund_id, b.fund_name AS fund_fund_name
FROM projects a JOIN municipal_funds b ON a.municipal_fund_id = b.municipal_fund_id;
```

| project_id | project_name | estimated_cost | approval_level | fund_municipal_fund_id | fund_fund_id | fund_fund_name |
|---|---|---|---|---|---|---|
| 1 | Compact Survey | 36.43 | board | 1 | 3158147 | 1% Option Tax Fund |
| 2 | Legacy Corridor | 17.41 | voter referendum | 2 | 6510 | Loan Fund |
| 3 | Regional Series A | 12.74 | board | 3 | lu_tax_code_template_m_I | Reserve Fund |
| 4 | Seasonal Assessment | 13.49 | voter referendum | 4 | 3990185 | 1% Option Tax Fund |

The view `v_project_municipal_fund` joins `projects` to `municipal_funds` on the `municipal_fund_id` foreign key, answering: "Which municipal fund finances each project, and what are the fund's financial attributes?" A representative row might show project `100` financed by fund `1` (balance: $2,000,000). This view supports project-level financial reporting.

**View `v_project_parcel`**

```sql
CREATE VIEW v_project_parcel AS
SELECT a.project_id, a.project_name, a.estimated_cost, a.approval_level, b.id AS parcel_id, b.parcel_id AS parcel_parcel_id, b.address AS parcel_address
FROM projects a JOIN parcels b ON a.parcel_id = b.id;
```

| project_id | project_name | estimated_cost | approval_level | parcel_id | parcel_parcel_id | parcel_address |
|---|---|---|---|---|---|---|
| 1 | Compact Survey | 36.43 | board | 1000 | 4447034 | distributed-address-72 |
| 2 | Legacy Corridor | 17.41 | voter referendum | 1001 | 325464 | baseline-address-73 |
| 3 | Regional Series A | 12.74 | board | 1002 | 3990187 | pilot-address-74 |
| 4 | Seasonal Assessment | 13.49 | voter referendum | 1003 | 110 | extended-address-75 |

The view `v_project_parcel` joins `projects` to `parcels` on the `parcel_id` foreign key, answering: "On which parcel is each project executed, and what are the parcel's characteristics?" A row from this view might show project `100` executed on parcel `1000` (zoning: commercial, area: 5 acres). This view supports geographic analysis of capital projects.

**View `v_project_municipal_board`**

```sql
CREATE VIEW v_project_municipal_board AS
SELECT a.project_id, a.project_name, a.estimated_cost, a.approval_level, b.id AS board_id, b.board_id AS board_board_id, b.board_name AS board_board_name
FROM projects a JOIN municipal_boards b ON a.municipal_board_id = b.id;
```

| project_id | project_name | estimated_cost | approval_level | board_id | board_board_id | board_board_name |
|---|---|---|---|---|---|---|
| 1 | Compact Survey | 36.43 | board | 100 | ChIJH2V4UYBt5kcR5doeFwuU7Ns | Compact Series |
| 2 | Legacy Corridor | 17.41 | voter referendum | 101 | 168553 | Legacy Assessment |
| 3 | Regional Series A | 12.74 | board | 102 | 5006454 | Regional Survey A |
| 4 | Seasonal Assessment | 13.49 | voter referendum | 103 | 1437585 | Seasonal Corridor |

The view `v_project_municipal_board` joins `projects` to `municipal_boards` on the `municipal_board_id` foreign key, answering: "Which municipal board approved each project, and what are the board's characteristics?" A representative row might show project `100` approved by board `100` (Compact Series, jurisdiction: Pilot Cluster). This view supports project-level reporting with board governance context.

**View `v_parcel_business_entity`**

```sql
CREATE VIEW v_parcel_business_entity AS
SELECT a.id, a.parcel_id, a.address, a.zoning_district, b.business_id AS entity_business_id, b.legal_name AS entity_legal_name, b.dba_name AS entity_dba_name
FROM parcels a JOIN business_entities b ON a.business_entity_business_id = b.business_id;
```

| id | parcel_id | address | zoning_district | entity_business_id | entity_legal_name | entity_dba_name |
|---|---|---|---|---|---|---|
| 1000 | 4447034 | distributed-address-72 | adaptive-zoning-95 | 3122ef58d8b44fb197236734beef7b29 | Adaptive Model | Regional Corridor |
| 1001 | 325464 | baseline-address-73 | distributed-zoning-96 | StasStaStS | Primary Cluster | Seasonal Series D |
| 1002 | 3990187 | pilot-address-74 | baseline-zoning-97 | 3990175 | Composite Review D | Integrated Assessment |
| 1003 | 110 | extended-address-75 | pilot-zoning-98 | 14484998 | Compact Initiative | Extended Survey |

The view `v_parcel_business_entity` joins `parcels` to `business_entities` on the `parcel_id` foreign key, answering: "Which business entities operate on each parcel, and what are the entity's details?" A row from this view might show parcel `1000` hosting entity `3122ef58d8b44fb197236734beef7b29` (Adaptive Model, corporation, seasonal-industry-35). This view supports geographic analysis of business activity.

**View `v_parcel_project`**

```sql
CREATE VIEW v_parcel_project AS
SELECT a.id, a.parcel_id, a.address, a.zoning_district, b.project_id AS project_project_id, b.project_name AS project_project_name, b.estimated_cost AS project_estimated_cost
FROM parcels a JOIN projects b ON a.project_id = b.project_id;
```

| id | parcel_id | address | zoning_district | project_project_id | project_project_name | project_estimated_cost |
|---|---|---|---|---|---|---|
| 1000 | 4447034 | distributed-address-72 | adaptive-zoning-95 | 1 | Compact Survey | 36.43 |
| 1001 | 325464 | baseline-address-73 | distributed-zoning-96 | 2 | Legacy Corridor | 17.41 |
| 1002 | 3990187 | pilot-address-74 | baseline-zoning-97 | 3 | Regional Series A | 12.74 |
| 1003 | 110 | extended-address-75 | pilot-zoning-98 | 4 | Seasonal Assessment | 13.49 |

The view `v_parcel_project` joins `parcels` to `projects` on the `parcel_id` foreign key, answering: "Which projects are executed on each parcel, and what are the project's details?" A representative row might show parcel `1000` hosting project `100` (scope: road improvement, budget: $500,000). This view supports geographic analysis of capital investment.

**View `v_parcel_municipal_board`**

```sql
CREATE VIEW v_parcel_municipal_board AS
SELECT a.id, a.parcel_id, a.address, a.zoning_district, b.id AS board_id, b.board_id AS board_board_id, b.board_name AS board_board_name
FROM parcels a JOIN municipal_boards b ON a.municipal_board_id = b.id;
```

| id | parcel_id | address | zoning_district | board_id | board_board_id | board_board_name |
|---|---|---|---|---|---|---|
| 1000 | 4447034 | distributed-address-72 | adaptive-zoning-95 | 100 | ChIJH2V4UYBt5kcR5doeFwuU7Ns | Compact Series |
| 1001 | 325464 | baseline-address-73 | distributed-zoning-96 | 101 | 168553 | Legacy Assessment |
| 1002 | 3990187 | pilot-address-74 | baseline-zoning-97 | 102 | 5006454 | Regional Survey A |
| 1003 | 110 | extended-address-75 | pilot-zoning-98 | 103 | 1437585 | Seasonal Corridor |

The view `v_parcel_municipal_board` joins `parcels` to `municipal_boards` on the `municipal_board_id` foreign key, answering: "Which municipal board regulates each parcel, and what are the board's characteristics?" A row from this view might show parcel `1000` regulated by board `100` (Compact Series, jurisdiction: Pilot Cluster). This view supports regulatory analysis at the parcel level.

## Synthesis

The schema models the municipal governance domain as a network of ten base tables connected by foreign keys that encode cardinality-bounded relationships. Each base table captures a distinct entity type — members, boards, motions, policies, licenses, business entities, funds, projects, and parcels — with attributes that describe the entity's properties and temporal bounds. The `boards_members` junction table resolves the many-to-many relationship between boards and members that cannot be expressed through simple foreign keys. The thirty materialized views reconstruct domain facts by joining normalized tables along their foreign key paths, denormalizing the relationships that span multiple base tables into queryable result sets. Each view answers a specific analytical question, from "Which board does each member serve on?" to "Which projects are funded by each municipal fund?" The schema's design reflects a careful balance between normalization (reducing redundancy through foreign keys) and denormalization (improving query performance through materialized views), ensuring that both data integrity and analytical accessibility are maintained.