## Municipal Governance and Economic Development

Municipal governance operates as a layered system of elected bodies, legislative instruments, and regulatory mechanisms that together shape the economic and social landscape of a jurisdiction. At its core, the system records who holds authority, what decisions those authorities make, how those decisions translate into binding policy, and how policy interacts with the businesses and properties that populate the municipality. The data model underlying this domain captures every layer: individual members of the selectboard, the boards they serve on, the motions they introduce and vote upon, the policies that codify collective decisions, the licenses that authorize commercial activity, and the business entities, parcels, and municipal funds that represent the tangible assets under governance. Understanding how these records interlock is essential for practitioners who audit compliance, trace accountability, or plan resource allocation across a municipality.

**Table `selectboard_members`**

| id | member_id | full_name | role_title | appointment_date | term_end_date | is_ex_officio | municipal_board_id | motion_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 10207158 | Theodore Mcgrath | Chair | 2022-05-03T16:12:00 | 2025-08-24 | true | 100 | OECD-CORE |
| 2 | 10207158 | Account Name | Vice Chair | 2023-10-14T23:29:00 | 2022-01-08 | false | 101 | 69422 |
| 3 | 25820616 | Saipan International Airport | Clerk | 2024-03-25T06:46:00 | 2023-06-19 | true | 102 | ChIJr7cItPtt5kcRM6ry7ecIYgw |
| 4 | 2002007020250 | Norma Fisher | Member | 2025-08-09T13:03:00 | 2024-11-03 | false | 103 | 4180962 |

The selectboard serves as the primary elected governing body, with each member carrying a distinct role and term. Theodore Mcgrath, identified by member ID 10207158, holds the position of Chair and serves as an ex-officio member whose term is scheduled to conclude on August 24, 2025. His appointment dates back to May 3, 2022, and he is associated with municipal board 100 and the motion identified as OECD-CORE. Norma Fisher, bearing member ID 2002007020250, serves as a regular Member with a term ending November 3, 2024, and is linked to municipal board 103 and motion 4180962. The membership roster also includes entities with organizational identifiers such as Saipan International Airport (member ID 25820616), which serves as Clerk and holds ex-officio status on municipal board 102. These records establish the human and organizational actors who drive the legislative and regulatory functions of the municipality.

**Table `municipal_boards`**

| id | board_id | board_name | jurisdiction_name | meeting_schedule | official_newspaper | policy_id | municipal_fund_id | created_at |
|---|---|---|---|---|---|---|---|---|
| 100 | ChIJH2V4UYBt5kcR5doeFwuU7Ns | Compact Series | Pilot Cluster | extended-meeting-99 | baseline-official-67 | 100 | 1 | 2025-01-01 00:14:00 |
| 101 | 168553 | Legacy Assessment | Baseline Review | integrated-meeting-100 | pilot-official-68 | 101 | 2 | 2025-02-06 03:14:00 |
| 102 | 5006454 | Regional Survey A | Distributed Initiative A | seasonal-meeting-101 | extended-official-69 | 102 | 3 | 2025-03-11 06:14:00 |
| 103 | 1437585 | Seasonal Corridor | Adaptive Model | regional-meeting-102 | integrated-official-70 | 103 | 4 | 2025-04-16 09:14:00 |

Municipal boards provide the structural framework within which selectboard members operate. Each board is defined by a board identifier, a descriptive name, and a jurisdiction. The Compact Series board, identified by the Google Place ID ChIJH2V4UYBt5kcR5doeFwuU7Ns, operates within the Pilot Cluster jurisdiction and follows an extended-meeting-99 schedule. Its official newspaper is designated baseline-official-67. The Legacy Assessment board (board ID 168553) serves the Baseline Review jurisdiction under an integrated-meeting-100 schedule, while the Regional Survey A board (ID 5006454) covers the Distributed Initiative A jurisdiction with seasonal-meeting-101 scheduling. The Seasonal Corridor board (ID 1437585) operates within the Adaptive Model jurisdiction on a regional-meeting-102 cadence. Each board is associated with a policy and a municipal fund, creating direct links to the legislative and financial arms of governance.

**Table `motions`**

| motion_id | motion_text | vote_result | meeting_date | is_adopted | selectboard_member_id | seconded_by_selectboard_member_id | policy_id | license_id |
|---|---|---|---|---|---|---|---|---|
| OECD-CORE | pilot-motion-86 | unanimous | 2023-10-23T21:39:00 | false | 1 | 1 | 100 | account_pymes_296 |
| 69422 | extended-motion-87 | majority | 2024-03-07T04:56:00 | true | 2 | 2 | 101 | 1250199 |
| ChIJr7cItPtt5kcRM6ry7ecIYgw | integrated-motion-88 | defeated | 2025-08-18T11:13:00 | false | 3 | 3 | 102 | ChIJm7V_gxFu5kcRAbqaOJHQUy0 |
| 4180962 | seasonal-motion-89 | abstained | 2022-01-02T18:30:00 | true | 4 | 4 | 103 | 605958 |

Motions represent the formal proposals introduced before the selectboard for deliberation and vote. The motion OECD-CORE, carrying the text pilot-motion-86, was voted on October 23, 2023, and received a unanimous vote but was not adopted. It was sponsored by selectboard member 1 and seconded by member 1, and it references policy 100 and license account_pymes_296. The motion 69422, labeled extended-motion-87, achieved a majority vote on March 7, 2024, and was adopted; it connects to policy 101 and license 1250199. The motion ChIJr7cItPtt5kcRM6ry7ecIYgw (integrated-motion-88) was defeated on August 18, 2025, despite being sponsored by member 3 and seconded by member 3, and it references policy 102 and license ChIJm7V_gxFu5kcRAbqaOJHQUy0. The motion 4180962 (seasonal-motion-89) resulted in an abstention on January 2, 2022, yet was marked as adopted, linking to policy 103 and license 605958. These records capture the legislative lifecycle from proposal through vote outcome.

**Table `policies`**

| id | policy_id | policy_name | adoption_date | version_number | is_current | municipal_board_id | selectboard_member_id |
|---|---|---|---|---|---|---|---|
| 100 | 5844252 | Regional Series | 2025-08-12T07:09:00 | 16 | true | 100 | 1 |
| 101 | 10207142 | Seasonal Assessment D | 2022-01-23T14:26:00 | 27 | false | 101 | 2 |
| 102 | 1562847 | Integrated Survey | 2023-06-07T21:43:00 | 38 | true | 102 | 3 |
| 103 | ChIJkzsYUIBt5kcRM6_JHx26ONk | Extended Corridor | 2024-11-18T04:00:00 | 49 | false | 103 | 4 |

Policies codify the binding rules and standards that govern municipal activity. The Regional Series policy (ID 100, policy ID 5844252) is at version 16 and is currently in effect, having been adopted on August 12, 2025. It is administered by municipal board 100 and overseen by selectboard member 1. The Seasonal Assessment D policy (ID 101, policy ID 10207142) sits at version 27 and is no longer current, having been adopted on January 23, 2022; it falls under municipal board 101 and member 2. The Integrated Survey policy (ID 102, policy ID 1562847) is the active version at number 38, adopted June 7, 2023, under municipal board 102 and member 3. The Extended Corridor policy (ID 103, policy ID ChIJkzsYUIBt5kcRM6_JHx26ONk) is at version 49 and is not current, adopted November 18, 2024, under municipal board 103 and member 4. The version numbers and current-status flags enable practitioners to determine which policy iteration governs any given situation.

**Table `licenses`**

| license_id | business_name | license_class | issue_date | expiry_date | status | municipal_board_id | motion_id | business_entity_business_id |
|---|---|---|---|---|---|---|---|---|
| account_pymes_296 | Baseline Protocol D | 1st class hotel | 2023-02-01T13:51:00 | 2023-10-24 | approved | 100 | OECD-CORE | 3122ef58d8b44fb197236734beef7b29 |
| 1250199 | Distributed Programme | 2nd class | 2024-07-12T20:08:00 | 2024-03-08 | pending | 101 | 69422 | StasStaStS |
| ChIJm7V_gxFu5kcRAbqaOJHQUy0 | Adaptive Standard | tobacco | 2025-12-23T03:25:00 | 2025-08-19 | revoked | 102 | ChIJr7cItPtt5kcRM6ry7ecIYgw | 3990175 |
| 605958 | Primary Framework A | 1st class hotel | 2022-05-07T10:42:00 | 2022-01-03 | approved | 103 | 4180962 | 14484998 |

Licenses authorize commercial entities to operate within specific classifications and jurisdictions. The license account_pymes_296, issued to Baseline Protocol D, is classified as a 1st class hotel and carries an approved status, having been issued on February 1, 2023, and expiring October 24, 2023. It is tied to municipal board 100, motion OECD-CORE, and business entity 3122ef58d8b44fb197236734beef7b29. License 1250199, issued to Distributed Programme, is a 2nd class license with pending status, issued July 12, 2024, and expiring March 8, 2024, linked to municipal board 101, motion 69422, and business entity StasStaStS. License ChIJm7V_gxFu5kcRAbqaOJHQUy0, issued to Adaptive Standard, is a tobacco license with revoked status, issued December 23, 2025, and expiring August 19, 2025, connected to municipal board 102, motion ChIJr7cItPtt5kcRM6ry7ecIYgw, and business entity 3990175. License 605958, issued to Primary Framework A, is a 1st class hotel license with approved status, issued May 7, 2022, and expiring January 3, 2022, tied to municipal board 103, motion 4180962, and business entity 14484998.

**Table `business_entities`**

| business_id | legal_name | dba_name | business_type | industry_sector | license_id | parcel_id | municipal_fund_id |
|---|---|---|---|---|---|---|---|
| 3122ef58d8b44fb197236734beef7b29 | Adaptive Model | Regional Corridor | corporation | seasonal-industry-35 | account_pymes_296 | 1000 | 1 |
| StasStaStS | Primary Cluster | Seasonal Series D | limited liability company | regional-industry-36 | 1250199 | 1001 | 2 |
| 3990175 | Composite Review D | Integrated Assessment | sole proprietorship | legacy-industry-37 | ChIJm7V_gxFu5kcRAbqaOJHQUy0 | 1002 | 3 |
| 14484998 | Compact Initiative | Extended Survey | corporation | compact-industry-38 | 605958 | 1003 | 4 |

Business entities represent the legal organizations that conduct commercial activity within the municipality. Adaptive Model, a corporation operating in seasonal-industry-35, holds the legal name Adaptive Model with the DBA Regional Corridor and is associated with license account_pymes_296, parcel 1000, and municipal fund 1. Primary Cluster, a limited liability company in regional-industry-36, operates under the DBA Seasonal Series D, holds license 1250199, is situated on parcel 1001, and is connected to municipal fund 2. Composite Review D, a sole proprietorship in legacy-industry-37, carries the DBA Integrated Assessment, holds license ChIJm7V_gxFu5kcRAbqaOJHQUy0, occupies parcel 1002, and is linked to municipal fund 3. Compact Initiative, a corporation in compact-industry-38, operates as Extended Survey under its DBA, holds license 605958, is located on parcel 1003, and is associated with municipal fund 4. These entities form the economic substrate that municipal governance regulates and supports.

**Table `municipal_funds`**

| municipal_fund_id | fund_id | fund_name | fiscal_year | total_allocation | current_balance | spending_threshold | municipal_board_id | project_id | business_entity_business_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 3158147 | 1% Option Tax Fund | primary-fiscal-64 | 9.95 | 1,387 | 15.20 | 100 | 1 | 3122ef58d8b44fb197236734beef7b29 |
| 2 | 6510 | Loan Fund | adaptive-fiscal-65 | 12.90 | 1,867 | 18.40 | 101 | 2 | StasStaStS |
| 3 | lu_tax_code_template_m_I | Reserve Fund | distributed-fiscal-66 | 15.85 | 65.72 | 21.60 | 102 | 3 | 3990175 |
| 4 | 3990185 | 1% Option Tax Fund | baseline-fiscal-67 | 18.80 | 2,453 | 24.80 | 103 | 4 | 14484998 |

Municipal funds represent the financial pools through which the municipality allocates resources for public purposes. Each fund is tied to a municipal board, establishing a direct line from governance decisions to financial execution. The funds serve as the financial mechanism through which projects are financed and business entities are supported, creating a bridge between the legislative and economic dimensions of municipal operations.

**Table `projects`**

| project_id | project_name | estimated_cost | approval_level | status | municipal_fund_id | parcel_id | municipal_board_id |
|---|---|---|---|---|---|---|---|
| 1 | Compact Survey | 36.43 | board | proposed | 1 | 1000 | 100 |
| 2 | Legacy Corridor | 17.41 | voter referendum | approved | 2 | 1001 | 101 |
| 3 | Regional Series A | 12.74 | board | in progress | 3 | 1002 | 102 |
| 4 | Seasonal Assessment | 13.49 | voter referendum | complete | 4 | 1003 | 103 |

Projects represent the concrete initiatives that municipal funds finance. Each project is tied to a specific municipal fund and often associated with a parcel, grounding financial decisions in physical locations. The project records capture the implementation side of governance, translating policy and budget into tangible outcomes.

**Table `parcels`**

| id | parcel_id | address | zoning_district | land_use | owner_name | is_publicly_accessible | business_entity_business_id | project_id | municipal_board_id |
|---|---|---|---|---|---|---|---|---|---|
| 1000 | 4447034 | distributed-address-72 | adaptive-zoning-95 | parking | Craig Childs | false | 3122ef58d8b44fb197236734beef7b29 | 1 | 100 |
| 1001 | 325464 | baseline-address-73 | distributed-zoning-96 | commercial | Kimberly Smith | true | StasStaStS | 2 | 101 |
| 1002 | 3990187 | pilot-address-74 | baseline-zoning-97 | residential | Michelle Kelley | false | 3990175 | 3 | 102 |
| 1003 | 110 | extended-address-75 | pilot-zoning-98 | public | Jorge Sullivan | true | 14484998 | 4 | 103 |

Parcels represent the geographic and property units within the municipality. Each parcel is associated with a business entity and a project, anchoring economic activity and public investment to specific locations. Parcels also link to municipal boards, ensuring that property-level decisions remain under appropriate governance oversight.

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

The boards_members table records the membership composition of municipal boards, linking individual selectboard members to the boards on which they serve. This table provides the explicit mapping that underlies the governance structure, ensuring that every board has a defined roster of members and that every member's board affiliations are documented.

The following views synthesize the base tables into joined results that answer specific operational questions. Each view interprets relationships across tables, enabling practitioners to trace accountability, verify compliance, and understand the full context of any municipal action.

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

This view joins selectboard members with their associated municipal boards, answering the question of which boards each member serves on. A row showing Theodore Mcgrath (member ID 10207158, Chair) on the Compact Series board (board ID ChIJH2V4UYBt5kcR5doeFwuU7Ns) within the Pilot Cluster jurisdiction demonstrates the direct assignment of leadership roles to specific boards. Another row linking Norma Fisher (member ID 2002007020250, Member) to the Seasonal Corridor board (ID 1437585) in the Adaptive Model jurisdiction illustrates how regular members are distributed across the board structure.

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

This view connects selectboard members to the motions they sponsor or second, revealing the legislative activity of each member. A row associating Theodore Mcgrath (member ID 10207158) with motion OECD-CORE (pilot-motion-86, unanimous vote, not adopted) shows how a Chair participates in the legislative process. A row linking Norma Fisher (member ID 2002007020250) to motion 69422 (extended-motion-87, majority vote, adopted) demonstrates how members contribute to motions that achieve passage.

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

This view provides a detailed roster of selectboard members assigned to each municipal board, answering the question of board composition. A row showing the Compact Series board (ID 100) with Theodore Mcgrath as Chair, ex-officio status true, and term ending 2025-08-24, gives a complete picture of one board's leadership. A row for the Legacy Assessment board (ID 101) with Account Name as Vice Chair, non-ex-officio status, and term ending 2022-01-08, illustrates the variation in member roles and tenures across boards.

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

This view links municipal boards to the policies they administer, answering which board is responsible for which policy. A row connecting the Compact Series board (ID 100) to the Regional Series policy (ID 100, policy ID 5844252, version 16, current) shows the active governance relationship. A row linking the Legacy Assessment board (ID 101) to the Seasonal Assessment D policy (ID 101, policy ID 10207142, version 27, not current) demonstrates how boards oversee both active and superseded policies.

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

This view associates municipal boards with the funds they manage, answering which board controls which financial resources. A row connecting the Compact Series board (ID 100) to municipal fund 1 shows the governance-financial link. A row linking the Regional Survey A board (ID 102) to municipal fund 3 illustrates how different boards oversee different financial pools, enabling practitioners to trace fund accountability back to the responsible board.

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

This view joins motions to the selectboard members who sponsor them, answering which member initiated each motion. A row showing motion OECD-CORE (pilot-motion-86, unanimous, not adopted) sponsored by selectboard member 1 (Theodore Mcgrath) demonstrates the sponsorship chain. A row linking motion 4180962 (seasonal-motion-89, abstained, adopted) to selectboard member 4 (Norma Fisher) shows how different members drive different legislative outcomes.

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

This view connects motions to the policies they reference, answering which policy each motion relates to. A row associating motion OECD-CORE with policy 100 (Regional Series, version 16, current) shows how a motion can reference an active policy. A row linking motion 69422 to policy 101 (Seasonal Assessment D, version 27, not current) demonstrates how motions may reference superseded policies, which is important for understanding the legislative context of each vote.

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

This view joins motions to the licenses they reference, answering which license each motion concerns. A row connecting motion OECD-CORE to license account_pymes_296 (Baseline Protocol D, 1st class hotel, approved) shows the motion-license relationship. A row linking motion ChIJr7cItPtt5kcRM6ry7ecIYgw to license ChIJm7V_gxFu5kcRAbqaOJHQUy0 (Adaptive Standard, tobacco, revoked) illustrates how motions can be associated with licenses that have been revoked, providing a complete audit trail.

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

This view links policies to the municipal boards that administer them, answering which board governs which policy. A row showing policy 100 (Regional Series, version 16, current) administered by municipal board 100 (Compact Series, Pilot Cluster) provides a clear governance mapping. A row linking policy 103 (Extended Corridor, version 49, not current) to municipal board 103 (Seasonal Corridor, Adaptive Model) demonstrates the board-policy relationship across both active and inactive policies.

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

This view connects policies to the selectboard members who oversee them, answering which member is responsible for which policy. A row associating policy 100 (Regional Series) with selectboard member 1 (Theodore Mcgrath, Chair) shows the oversight chain. A row linking policy 102 (Integrated Survey, version 38, current) to selectboard member 3 (Saipan International Airport, Clerk) demonstrates how ex-officio members can hold policy oversight responsibilities.

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

This view joins licenses to the municipal boards that issue them, answering which board authorizes which license. A row connecting license account_pymes_296 (Baseline Protocol D, approved) to municipal board 100 (Compact Series) shows the issuing authority. A row linking license 1250199 (Distributed Programme, pending) to municipal board 101 (Legacy Assessment) illustrates how boards at different stages of their meeting schedules handle licenses with different statuses.

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

This view links licenses to the motions that reference them, answering which motion concerns which license. A row showing license account_pymes_296 associated with motion OECD-CORE (pilot-motion-86, unanimous, not adopted) demonstrates the motion-license linkage. A row linking license 605958 (Primary Framework A, approved) to motion 4180962 (seasonal-motion-89, abstained, adopted) shows how a license can be tied to a motion that resulted in abstention but was still adopted.

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

This view connects licenses to the business entities that hold them, answering which entity operates under which license. A row associating license account_pymes_296 (Baseline Protocol D, 1st class hotel) with business entity 3122ef58d8b44fb197236734beef7b29 (Adaptive Model, corporation) shows the entity-license relationship. A row linking license ChIJm7V_gxFu5kcRAbqaOJHQUy0 (Adaptive Standard, tobacco, revoked) to business entity 3990175 (Composite Review D, sole proprietorship) illustrates how even revoked licenses remain traceable to their holding entities.

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

This view provides the reverse perspective, joining business entities to their licenses from the entity side. A row showing business entity 3122ef58d8b44fb197236734beef7b29 (Adaptive Model, DBA Regional Corridor, seasonal-industry-35) holding license account_pymes_296 (Baseline Protocol D, 1st class hotel, approved) gives a complete entity-level view. A row linking business entity StasStaStS (Primary Cluster, DBA Seasonal Series D, regional-industry-36) to license 1250199 (Distributed Programme, 2nd class, pending) demonstrates how entities with pending licenses are tracked.

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

This view connects business entities to the parcels on which they operate, answering which entity is located on which property. A row associating business entity 3122ef58d8b44fb197236734beef7b29 (Adaptive Model) with parcel 1000 shows the property-level anchoring of commercial activity. A row linking business entity 14484998 (Compact Initiative, DBA Extended Survey) to parcel 1003 demonstrates how different entities occupy different parcels within the municipality.

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

This view links business entities to the municipal funds that support them, answering which fund backs which entity. A row connecting business entity 3122ef58d8b44fb197236734beef7b29 (Adaptive Model) to municipal fund 1 shows the financial support relationship. A row linking business entity 3990175 (Composite Review D) to municipal fund 3 illustrates how entities in different industry sectors receive support from different funds.

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

This view associates municipal funds with the boards that manage them, answering which board controls which fund. A row showing municipal fund 1 managed by municipal board 100 (Compact Series, Pilot Cluster) provides a clear governance-financial mapping. A row linking municipal fund 4 to municipal board 103 (Seasonal Corridor, Adaptive Model) demonstrates the board-fund relationship across the full range of boards.

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

This view connects municipal funds to the projects they finance, answering which fund supports which project. A row associating municipal fund 1 with project records shows the financial-to-implementation chain. A row linking municipal fund 3 to project records illustrates how different funds finance different projects, enabling practitioners to trace project funding back to its source.

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

This view links municipal funds to the business entities they support, answering which fund backs which entity. A row connecting municipal fund 1 to business entity 3122ef58d8b44fb197236734beef7b29 (Adaptive Model) shows the financial support relationship. A row linking municipal fund 4 to business entity 14484998 (Compact Initiative) demonstrates how funds are distributed across entities in different industry sectors.

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

This view provides the reverse perspective, joining projects to the funds that finance them from the project side. A row showing a project financed by municipal fund 1 gives a project-level view of funding sources. A row linking a project to municipal fund 3 demonstrates how practitioners can trace any project's financial backing to its originating fund.

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

This view connects projects to the parcels on which they are implemented, answering which project occupies which property. A row associating a project with parcel 1000 shows the physical grounding of public initiatives. A row linking a project to parcel 1003 demonstrates how different projects are distributed across the municipality's property base.

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

This view links projects to the municipal boards that oversee them, answering which board supervises which project. A row connecting a project to municipal board 100 (Compact Series) shows the governance oversight chain. A row linking a project to municipal board 102 (Regional Survey A) demonstrates how different boards supervise different projects within their jurisdictions.

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

This view joins parcels to the business entities located on them, answering which entity operates on which property. A row showing parcel 1000 occupied by business entity 3122ef58d8b44fb197236734beef7b29 (Adaptive Model, DBA Regional Corridor) provides a property-level view of commercial activity. A row linking parcel 1002 to business entity 3990175 (Composite Review D, sole proprietorship) illustrates the diversity of entity types across parcels.

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

This view connects parcels to the projects implemented on them, answering which project is located on which property. A row associating parcel 1000 with a project shows the physical implementation of public initiatives. A row linking parcel 1003 to a project demonstrates how projects are distributed across the municipality's property base, enabling spatial analysis of public investment.

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

This view links parcels to the municipal boards that have jurisdiction over them, answering which board governs which property. A row connecting parcel 1000 to municipal board 100 (Compact Series, Pilot Cluster) shows the governance jurisdiction. A row linking parcel 1003 to municipal board 103 (Seasonal Corridor, Adaptive Model) demonstrates how property-level governance is distributed across boards, ensuring that every parcel falls under appropriate oversight.

The municipal governance domain presents a tightly interwoven system where elected members, legislative bodies, policy instruments, regulatory licenses, and economic entities form a coherent whole. Selectboard members serve on municipal boards, which administer policies and manage funds that finance projects on specific parcels. Motions capture the legislative decisions that connect members to policies and licenses, while licenses authorize the business entities that operate on parcels and receive fund support. Every record in this system is traceable to every other through the foreign-key relationships that bind them: a motion references a member, a policy, and a license; a license references a board, a motion, and a business entity; a business entity references a license, a parcel, and a fund. For practitioners, this means that any question—whether about who authorized a license, which board oversees a parcel, or which fund finances a project—can be answered by following the relationships encoded in these records. The views provide pre-joined perspectives on these relationships, enabling efficient querying without sacrificing the ability to drill down to the base tables when deeper investigation is required.