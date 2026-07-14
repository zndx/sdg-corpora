Corporate governance and shareholder management form the operational backbone of any publicly traded enterprise. At the heart of this system lie share capital records, individual shareholder registries, and the formal mechanisms through which ownership decisions are ratified. Annual general meetings serve as the central event where board appointments, dividend distributions, and fee structures are debated and approved. Nomination committees act as the gatekeepers of board composition, while resolution records capture the authoritative outcomes of every vote. The data infrastructure supporting these processes must track not only what was decided, but who was present, what ownership stakes were represented, and how each decision cascades across the organization's financial and governance layers.

## Share Capital and Shareholder Registry

Share capital records establish the financial foundation upon which all ownership claims rest. Each entry in the share capital ledger specifies the total value of issued shares, the currency denomination, the number of shares outstanding, and the voting rights attached to each share. The record date anchors the capital structure to a specific point in time, while resolution identifiers link the capital to the formal governance action that authorized it.

**Table `share_capitals`**

| id | total_value | currency_code | total_shares_issued | voting_rights_per_share | record_date | resolution_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|
| 100 | 9.45 | gd_fp_eu_acc3 | 487 | 25 | 2023-10-23 | 9085246 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 101 | 12.90 | managing-resources | 5 | 33 | 2024-03-07 | gd_acc_120000 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 102 | 16.35 | f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 | 5 | 41 | 2025-08-18 | 16587506 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 103 | 19.80 | 10445649 | 11 | 49 | 2022-01-02 | 9736899 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Consider the capital record with identifier 100, valued at 9.45 in the currency code gd_fp_eu_acc3, with 487 total shares issued and 25 voting rights per share. Its record date of 2023-10-23 and resolution identifier 9085246 tie this capital structure directly to a specific governance action. The capital record 101, valued at 12.90 in managing-resources currency, carries only 5 shares issued but with 33 voting rights each, suggesting a concentrated ownership structure with disproportionate voting power per share.

Shareholders are the individuals and entities that hold these shares. The shareholder registry captures each holder's identifier, full name, the number of shares they own, their percentage of total ownership, and whether they are classified as a foreign owner. Registration dates and links to both the relevant share capital and the overseeing nomination committee complete the profile.

**Table `shareholders`**

| id | shareholder_id | shareholder_name | share_count | ownership_percentage | is_foreign_owner | registration_date | share_capital_id | nomination_committee_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 605948 | Mary Alvarez | 99298 | 6.95 | James Sherman | 2023-06-19 | 100 | 1 |
| 2 | lu_tax_code_template_b_VB-EC-15 | Kimberly Williams | 16954 | 8.90 | Isabel Mack | 2024-11-03 | 101 | 2 |
| 3 | 4447026 | Nicole Hampton | 54 | 10.85 | Editorial Status | 2025-04-14 | 102 | 3 |
| 4 | 2933460 | Laurie Wallace | 1122 | 12.80 | Brian Hamilton | 2022-09-25 | 103 | 4 |

Mary Alvarez, registered under identifier 605948, holds 99,298 shares representing 6.95 percent ownership, with her registration dated 2023-06-19 under share capital 100 and nomination committee 1. Kimberly Williams, identified by the tax code template lu_tax_code_template_b_VB-EC-15, holds 16,954 shares for 8.90 percent ownership under share capital 101 and nomination committee 2. The shareholder Nicole Hampton (identifier 4447026) holds a modest 54 shares but commands 10.85 percent ownership, indicating a very small total share pool for that capital class. Laurie Wallace (identifier 2933460) holds 1,122 shares representing 12.80 percent under share capital 103, with Brian Hamilton listed as the foreign owner designation.

The junction table capitals_shareholders formalizes the many-to-many relationship between share capital classes and individual shareholders, ensuring that each ownership claim is traceable to both the capital structure and the holder.

## Annual General Meetings

Annual general meetings are the formal assemblies where shareholders exercise their voting rights. Each meeting record captures the meeting identifier, date, location, the total number of shares represented at the meeting, the count of attending shareholders, whether a quorum was achieved, and whether the minutes were published. The meeting is linked to a nomination committee and a resolution identifier, anchoring the event within the broader governance framework.

**Table `annual_general_meetings`**

| meeting_id | meeting_date | location | total_shares_represented | attendee_shareholder_count | quorum_met | minutes_published | nomination_committee_id | resolution_id |
|---|---|---|---|---|---|---|---|---|
| 20967529 | 2023-10-23T21:39:00 | extended-location-99 | 6 | 2 | false | true | 1 | 9085246 |
| ChIJd13ymnZu5kcRXM7jx5boJBs | 2024-03-07T04:56:00 | integrated-location-100 | 15 | 7 | true | false | 2 | gd_acc_120000 |
| gd_acc_763000 | 2025-08-18T11:13:00 | seasonal-location-101 | 75 | 8 | false | true | 3 | 16587506 |
| 922ad118-9bad-11eb-a8a2-19ed5c03f8d3 | 2022-01-02T18:30:00 | regional-location-102 | 179 | 57 | true | false | 4 | 9736899 |

Meeting 20967529, held on 2023-10-23 at extended-location-99, had 6 shares represented by 2 attendees. The quorum was not met (false), yet the minutes were published (true). This meeting is associated with nomination committee 1 and resolution 9085246. Meeting ChIJd13ymnZu5kcRXM7jx5boJBs, held on 2024-03-07 at integrated-location-100, saw 15 shares represented by 7 attendees, with quorum successfully achieved and minutes not published. The meeting gd_acc_763000 on 2025-08-18 at seasonal-location-101 had 75 shares represented by 8 attendees but failed to meet quorum. The largest meeting, 922ad118-9bad-11eb-a8a2-19ed5c03f8d3, held on 2022-01-02 at regional-location-102, had 179 shares represented by 57 attendees with quorum met.

The meetings_members junction table records which board members and other participants attended each meeting, while meetings_resolutions links each meeting to the resolutions that were tabled and voted upon.

## Board Governance and Nomination Committees

Board members are the individuals entrusted with overseeing corporate strategy and management. Each board member record includes a member identifier, full name, role designation, employment status (whether they are an employee of the company), the year of appointment, the fee amount and currency they receive, and links to both the nomination committee that recommended their appointment and the fee resolution that set their compensation.

**Table `board_members`**

| id | member_id | full_name | role | is_employee | appointment_year | fee_amount | currency_code | nomination_committee_id | fee_resolution_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 100 | 10207158 | Theodore Mcgrath | pilot-role-20 | Jennifer Summers | 26 | 38.08 | gd_fp_eu_acc3 | 1 | 100 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 101 | 10207158 | Account Name | extended-role-21 | Patricia Pham | 36 | 18.47 | managing-resources | 2 | 101 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 102 | 25820616 | Saipan International Airport | integrated-role-22 | Theodore Mcgrath | 46 | 38.08 | f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 | 3 | 102 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 103 | 2002007020250 | Norma Fisher | seasonal-role-23 | Haruki Murakami | 56 | 26.25 | 10445649 | 4 | 103 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Theodore Mcgrath (member identifier 10207158) serves under role pilot-role-20, with Jennifer Summers listed in the associated field, appointed in year 26, receiving a fee of 38.08 in gd_fp_eu_acc3 currency. This member is linked to nomination committee 1 and fee resolution 100. Account Name (member identifier 10207158) holds role extended-role-21 with Patricia Pham, appointed in year 36, receiving 18.47 in managing-resources currency, linked to nomination committee 2 and fee resolution 101. Saipan International Airport (member identifier 25820616) holds role integrated-role-22 with Theodore Mcgrath, appointed in year 46, receiving 38.08 in f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 currency, linked to nomination committee 3 and fee resolution 102. Norma Fisher (member identifier 2002007020250) holds role seasonal-role-23 with Haruki Murakami, appointed in year 56, receiving 26.25 in 10445649 currency, linked to nomination committee 4 and fee resolution 103.

Nomination committees are the bodies responsible for identifying, vetting, and recommending board candidates. Each committee record includes a committee identifier, the date of its establishing meeting, minimum and maximum member counts, the chairman's name, whether formal instructions have been adopted, and the associated meeting identifier.

**Table `nomination_committees`**

| nomination_committee_id | committee_id | meeting_date | min_members | max_members | chairman_name | instructions_adopted | meeting_id |
|---|---|---|---|---|---|---|---|
| 1 | PHR-98 | 2023-10-23T21:39:00 | 38 | 16 | Integrated Programme A | true | 20967529 |
| 2 | L785 | 2024-03-07T04:56:00 | 41 | 23 | Extended Standard | false | ChIJd13ymnZu5kcRXM7jx5boJBs |
| 3 | 7119774 | 2025-08-18T11:13:00 | 44 | 30 | Pilot Framework | true | gd_acc_763000 |
| 4 | 1186094 | 2022-01-02T18:30:00 | 47 | 37 | Baseline Protocol D | false | 922ad118-9bad-11eb-a8a2-19ed5c03f8d3 |

Committee PHR-98, established at meeting 20967529, has a minimum of 38 members and a maximum of 16 members — a configuration that suggests the maximum was set below the minimum, possibly indicating a correction or a special case. Its chairman is Integrated Programme A, and instructions have been adopted (true). Committee L785, established at meeting ChIJd13ymnZu5kcRXM7jx5boJBs, has 41 minimum and 23 maximum members, chaired by Extended Standard, with instructions not adopted (false). Committee 7119774, established at meeting gd_acc_763000, has 44 minimum and 30 maximum members, chaired by Pilot Framework, with instructions adopted (true). Committee 1186094, established at meeting 922ad118-9bad-11eb-a8a2-19ed5c03f8d3, has 47 minimum and 37 maximum members, chaired by Baseline Protocol D, with instructions not adopted (false).

The committees_members junction table records which board members serve on which nomination committees, creating the governance linkage between individual directors and the committees that oversee their appointments.

## Dividend and Fee Resolutions

Dividend resolutions formalize the distribution of profits to shareholders. Each resolution record specifies the amount per share, the currency, the payment date, the approval status (including which meeting approved it), the meeting identifier, and the share capital to which the dividend applies.

**Table `dividend_resolutions`**

| resolution_id | amount_per_share | currency_code | payment_date | approved_by_meeting | meeting_id | share_capital_id |
|---|---|---|---|---|---|---|
| 9085246 | 1,097 | gd_fp_eu_acc3 | 2024-03-24 | baseline-approved-73 | 20967529 | 100 |
| gd_acc_120000 | 5.84 | managing-resources | 2025-08-08 | pilot-approved-74 | ChIJd13ymnZu5kcRXM7jx5boJBs | 101 |
| 16587506 | 12.72 | f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 | 2022-01-19 | extended-approved-75 | gd_acc_763000 | 102 |
| 9736899 | 221.03 | 10445649 | 2023-06-03 | integrated-approved-76 | 922ad118-9bad-11eb-a8a2-19ed5c03f8d3 | 103 |

Resolution 9085246 authorizes a dividend of 1,097 per share in gd_fp_eu_acc3 currency, payable on 2024-03-24, approved by baseline-approved-73 at meeting 20967529, applying to share capital 100. Resolution gd_acc_120000 authorizes 5.84 per share in managing-resources currency, payable on 2025-08-08, approved by pilot-approved-74 at meeting ChIJd13ymnZu5kcRXM7jx5boJBs, applying to share capital 101. Resolution 16587506 authorizes 12.72 per share in f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 currency, payable on 2022-01-19, approved by extended-approved-75 at meeting gd_acc_763000, applying to share capital 102. Resolution 9736899 authorizes 221.03 per share in 10445649 currency, payable on 2023-06-03, approved by integrated-approved-76 at meeting 922ad118-9bad-11eb-a8a2-19ed5c03f8d3, applying to share capital 103.

Fee resolutions govern the compensation structure for board members. Each fee resolution record captures the resolution identifier, the fee amount, the currency, the meeting that approved it, and the board members to whom the fee structure applies.

**Table `fee_resolutions`**

| id | resolution_id | role_type | fee_amount | currency_code | payment_frequency | approved_by_meeting | meeting_id |
|---|---|---|---|---|---|---|---|
| 100 | 9085246 | baseline-role-67 | 38.08 | gd_fp_eu_acc3 | legacy-payment-19 | baseline-approved-73 | 20967529 |
| 101 | gd_acc_120000 | pilot-role-68 | 18.47 | managing-resources | compact-payment-20 | pilot-approved-74 | ChIJd13ymnZu5kcRXM7jx5boJBs |
| 102 | 16587506 | extended-role-69 | 38.08 | f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 | composite-payment-21 | extended-approved-75 | gd_acc_763000 |
| 103 | 9736899 | integrated-role-70 | 26.25 | 10445649 | primary-payment-22 | integrated-approved-76 | 922ad118-9bad-11eb-a8a2-19ed5c03f8d3 |

The resolutions_members junction table links each resolution to the board members affected by it, ensuring that every fee or dividend decision can be traced to the specific individuals it impacts.

## Detailed Ownership and Capital Relationships

The view v_share_capital_shareholder_detail joins share capital records with their associated shareholders, answering the question of which shareholders hold stakes in which capital classes and at what ownership percentages. A row from this view would show, for example, that Mary Alvarez (shareholder 605948) holds 99,298 shares representing 6.95 percent of share capital 100, which has a total value of 9.45 and 487 shares issued with 25 voting rights per share.

The view v_share_capital_dividend_resolution connects share capital records to the dividend resolutions that apply to them. This view reveals, for instance, that share capital 100 is associated with dividend resolution 9085246, which pays 1,097 per share in gd_fp_eu_acc3 currency with a payment date of 2024-03-24.

The view v_shareholder_share_capital provides the reverse perspective, starting from the shareholder and showing which capital classes they participate in. A row would indicate that Kimberly Williams (lu_tax_code_template_b_VB-EC-15) holds 16,954 shares with 8.90 percent ownership in share capital 101, which has a total value of 12.90 and 5 shares issued.

The view v_shareholder_nomination_committee links shareholders to the nomination committees that oversee their share class. This view shows, for example, that Nicole Hampton (4447026) is associated with nomination committee 3, which has 44 minimum and 30 maximum members and is chaired by Pilot Framework.

## Meeting and Governance Detail Views

The view v_annual_general_meeting_board_member_detail joins annual general meetings with the board members who attended, answering which directors were present at each assembly. A row from this view would show that meeting 20967529, held on 2023-10-23 at extended-location-99, had board members present, with 6 shares represented and 2 attendees.

The view v_annual_general_meeting_nomination_committee links meetings to the nomination committees involved in their proceedings. This view reveals that meeting ChIJd13ymnZu5kcRXM7jx5boJBs, held on 2024-03-07 at integrated-location-100, is associated with nomination committee 2, which has 41 minimum and 23 maximum members and is chaired by Extended Standard.

The view v_annual_general_meeting_dividend_resolution connects meetings to the dividend resolutions that were tabled and voted upon at each assembly. A row would show that meeting gd_acc_763000, held on 2025-08-18 at seasonal-location-101, considered dividend resolution 16587506, which pays 12.72 per share in f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 currency.

The view v_annual_general_meeting_fee_resolution_detail joins meetings with the fee resolutions approved at each assembly. This view answers which compensation structures were ratified at each gathering, linking the governance event to its financial outcomes.

## Board and Committee Cross-References

The view v_board_member_nomination_committee links individual board members to the nomination committees that recommended their appointments. A row from this view would show that Theodore Mcgrath (member 10207158) was recommended by nomination committee 1, which has 38 minimum and 16 maximum members and is chaired by Integrated Programme A.

The view v_board_member_fee_resolution connects board members to the fee resolutions that determine their compensation. This view reveals, for example, that board member 10207158 (Theodore Mcgrath) is compensated under fee resolution 100, receiving 38.08 in gd_fp_eu_acc3 currency.

The view v_nomination_committee_annual_general_meeting links nomination committees to the annual general meetings at which they participated or were discussed. A row would show that nomination committee PHR-98 (committee 1) is associated with meeting 20967529, held on 2023-10-23 at extended-location-99.

The view v_nomination_committee_board_member_detail provides a comprehensive view of which board members serve under which nomination committees, including their full names, roles, appointment years, and fee amounts. This view answers the question of how board composition is distributed across the governance committees.

## Resolution-Centric Views

The view v_dividend_resolution_annual_general_meeting joins dividend resolutions with the meetings that approved them, answering which governance assemblies authorized each dividend distribution. A row would show that dividend resolution 9085246, paying 1,097 per share, was approved at meeting 20967529 on 2023-10-23.

The view v_dividend_resolution_share_capital links dividend resolutions to the share capital classes they apply to. This view reveals, for instance, that resolution 9736899, paying 221.03 per share, applies to share capital 103, which has a total value of 19.80 and 11 shares issued.

The view v_fee_resolution_annual_general_meeting connects fee resolutions to the meetings that approved them, showing which assemblies ratified each compensation structure. A row would indicate that fee resolution 100 was approved at meeting 20967529.

The view v_fee_resolution_board_member_detail joins fee resolutions with the board members affected by them, providing a complete picture of how compensation decisions map to individual directors. This view answers the question of which board members receive fees under which resolution, including the specific amounts and currencies.

## Synthesis

The governance data ecosystem described here forms an interconnected web of financial, organizational, and procedural records. Share capital establishes the financial foundation, shareholders populate that foundation with ownership claims, and annual general meetings serve as the formal arena where decisions are made. Nomination committees gatekeep board composition, board members execute governance duties, and dividend and fee resolutions translate governance decisions into financial outcomes. The junction tables — capitals_shareholders, meetings_members, meetings_resolutions, committees_members, and resolutions_members — ensure that every relationship is explicit and traceable. The detail views synthesize these relationships into answerable questions: which shareholders hold which stakes, which resolutions were approved at which meetings, which board members serve under which committees, and which fee structures apply to which directors. Together, these records and their relationships provide a complete audit trail of corporate governance, from the initial issuance of shares through the ongoing cycle of meetings, appointments, and distributions.

## Data appendix

**Table `capitals_shareholders`**

| share_capital_id | shareholder_id |
|---|---|
| 100 | 1 |
| 100 | 2 |
| 101 | 2 |
| 101 | 3 |
| 102 | 3 |
| 102 | 4 |
| 103 | 4 |
| 103 | 1 |

**Table `meetings_members`**

| meeting_id | board_member_id |
|---|---|
| 20967529 | 100 |
| 20967529 | 101 |
| ChIJd13ymnZu5kcRXM7jx5boJBs | 101 |
| ChIJd13ymnZu5kcRXM7jx5boJBs | 102 |
| gd_acc_763000 | 102 |
| gd_acc_763000 | 103 |
| 922ad118-9bad-11eb-a8a2-19ed5c03f8d3 | 103 |
| 922ad118-9bad-11eb-a8a2-19ed5c03f8d3 | 100 |

**Table `meetings_resolutions`**

| meeting_id | fee_resolution_id |
|---|---|
| 20967529 | 100 |
| 20967529 | 101 |
| ChIJd13ymnZu5kcRXM7jx5boJBs | 101 |
| ChIJd13ymnZu5kcRXM7jx5boJBs | 102 |
| gd_acc_763000 | 102 |
| gd_acc_763000 | 103 |
| 922ad118-9bad-11eb-a8a2-19ed5c03f8d3 | 103 |
| 922ad118-9bad-11eb-a8a2-19ed5c03f8d3 | 100 |

**Table `committees_members`**

| nomination_committee_id | board_member_id |
|---|---|
| 1 | 100 |
| 1 | 101 |
| 2 | 101 |
| 2 | 102 |
| 3 | 102 |
| 3 | 103 |
| 4 | 103 |
| 4 | 100 |

**Table `resolutions_members`**

| fee_resolution_id | board_member_id |
|---|---|
| 100 | 100 |
| 100 | 101 |
| 101 | 101 |
| 101 | 102 |
| 102 | 102 |
| 102 | 103 |
| 103 | 103 |
| 103 | 100 |

**View `v_share_capital_shareholder_detail`**

```sql
CREATE VIEW v_share_capital_shareholder_detail AS
SELECT a.id, a.total_value, a.currency_code, b.id AS shareholder_id, b.shareholder_id AS shareholder_shareholder_id, b.shareholder_name AS shareholder_shareholder_name
FROM share_capitals a
  JOIN capitals_shareholders j ON j.share_capital_id = a.id
  JOIN shareholders b ON b.id = j.shareholder_id;
```

| id | total_value | currency_code | shareholder_id | shareholder_shareholder_id | shareholder_shareholder_name |
|---|---|---|---|---|---|
| 100 | 9.45 | gd_fp_eu_acc3 | 1 | 605948 | Mary Alvarez |
| 100 | 9.45 | gd_fp_eu_acc3 | 2 | lu_tax_code_template_b_VB-EC-15 | Kimberly Williams |
| 101 | 12.90 | managing-resources | 2 | lu_tax_code_template_b_VB-EC-15 | Kimberly Williams |
| 101 | 12.90 | managing-resources | 3 | 4447026 | Nicole Hampton |
| 102 | 16.35 | f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 | 3 | 4447026 | Nicole Hampton |
| 102 | 16.35 | f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 | 4 | 2933460 | Laurie Wallace |
| 103 | 19.80 | 10445649 | 4 | 2933460 | Laurie Wallace |
| 103 | 19.80 | 10445649 | 1 | 605948 | Mary Alvarez |

**View `v_share_capital_dividend_resolution`**

```sql
CREATE VIEW v_share_capital_dividend_resolution AS
SELECT a.id, a.total_value, a.currency_code, a.total_shares_issued, b.resolution_id AS resolution_resolution_id, b.amount_per_share AS resolution_amount_per_share, b.currency_code AS resolution_currency_code
FROM share_capitals a JOIN dividend_resolutions b ON a.resolution_id = b.resolution_id;
```

| id | total_value | currency_code | total_shares_issued | resolution_resolution_id | resolution_amount_per_share | resolution_currency_code |
|---|---|---|---|---|---|---|
| 100 | 9.45 | gd_fp_eu_acc3 | 487 | 9085246 | 1,097 | gd_fp_eu_acc3 |
| 101 | 12.90 | managing-resources | 5 | gd_acc_120000 | 5.84 | managing-resources |
| 102 | 16.35 | f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 | 5 | 16587506 | 12.72 | f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 |
| 103 | 19.80 | 10445649 | 11 | 9736899 | 221.03 | 10445649 |

**View `v_shareholder_share_capital`**

```sql
CREATE VIEW v_shareholder_share_capital AS
SELECT a.id, a.shareholder_id, a.shareholder_name, a.share_count, b.id AS capital_id, b.total_value AS capital_total_value, b.currency_code AS capital_currency_code
FROM shareholders a JOIN share_capitals b ON a.share_capital_id = b.id;
```

| id | shareholder_id | shareholder_name | share_count | capital_id | capital_total_value | capital_currency_code |
|---|---|---|---|---|---|---|
| 1 | 605948 | Mary Alvarez | 99298 | 100 | 9.45 | gd_fp_eu_acc3 |
| 2 | lu_tax_code_template_b_VB-EC-15 | Kimberly Williams | 16954 | 101 | 12.90 | managing-resources |
| 3 | 4447026 | Nicole Hampton | 54 | 102 | 16.35 | f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 |
| 4 | 2933460 | Laurie Wallace | 1122 | 103 | 19.80 | 10445649 |

**View `v_shareholder_nomination_committee`**

```sql
CREATE VIEW v_shareholder_nomination_committee AS
SELECT a.id, a.shareholder_id, a.shareholder_name, a.share_count, b.nomination_committee_id AS committee_nomination_committee_id, b.committee_id AS committee_committee_id, b.meeting_date AS committee_meeting_date
FROM shareholders a JOIN nomination_committees b ON a.nomination_committee_id = b.nomination_committee_id;
```

| id | shareholder_id | shareholder_name | share_count | committee_nomination_committee_id | committee_committee_id | committee_meeting_date |
|---|---|---|---|---|---|---|
| 1 | 605948 | Mary Alvarez | 99298 | 1 | PHR-98 | 2023-10-23T21:39:00 |
| 2 | lu_tax_code_template_b_VB-EC-15 | Kimberly Williams | 16954 | 2 | L785 | 2024-03-07T04:56:00 |
| 3 | 4447026 | Nicole Hampton | 54 | 3 | 7119774 | 2025-08-18T11:13:00 |
| 4 | 2933460 | Laurie Wallace | 1122 | 4 | 1186094 | 2022-01-02T18:30:00 |

**View `v_annual_general_meeting_board_member_detail`**

```sql
CREATE VIEW v_annual_general_meeting_board_member_detail AS
SELECT a.meeting_id, a.meeting_date, a.location, b.id AS member_id, b.member_id AS member_member_id, b.full_name AS member_full_name
FROM annual_general_meetings a
  JOIN meetings_members j ON j.meeting_id = a.meeting_id
  JOIN board_members b ON b.id = j.board_member_id;
```

| meeting_id | meeting_date | location | member_id | member_member_id | member_full_name |
|---|---|---|---|---|---|
| 20967529 | 2023-10-23T21:39:00 | extended-location-99 | 100 | 10207158 | Theodore Mcgrath |
| 20967529 | 2023-10-23T21:39:00 | extended-location-99 | 101 | 10207158 | Account Name |
| ChIJd13ymnZu5kcRXM7jx5boJBs | 2024-03-07T04:56:00 | integrated-location-100 | 101 | 10207158 | Account Name |
| ChIJd13ymnZu5kcRXM7jx5boJBs | 2024-03-07T04:56:00 | integrated-location-100 | 102 | 25820616 | Saipan International Airport |
| gd_acc_763000 | 2025-08-18T11:13:00 | seasonal-location-101 | 102 | 25820616 | Saipan International Airport |
| gd_acc_763000 | 2025-08-18T11:13:00 | seasonal-location-101 | 103 | 2002007020250 | Norma Fisher |
| 922ad118-9bad-11eb-a8a2-19ed5c03f8d3 | 2022-01-02T18:30:00 | regional-location-102 | 103 | 2002007020250 | Norma Fisher |
| 922ad118-9bad-11eb-a8a2-19ed5c03f8d3 | 2022-01-02T18:30:00 | regional-location-102 | 100 | 10207158 | Theodore Mcgrath |

**View `v_annual_general_meeting_nomination_committee`**

```sql
CREATE VIEW v_annual_general_meeting_nomination_committee AS
SELECT a.meeting_id, a.meeting_date, a.location, a.total_shares_represented, b.nomination_committee_id AS committee_nomination_committee_id, b.committee_id AS committee_committee_id, b.meeting_date AS committee_meeting_date
FROM annual_general_meetings a JOIN nomination_committees b ON a.nomination_committee_id = b.nomination_committee_id;
```

| meeting_id | meeting_date | location | total_shares_represented | committee_nomination_committee_id | committee_committee_id | committee_meeting_date |
|---|---|---|---|---|---|---|
| 20967529 | 2023-10-23T21:39:00 | extended-location-99 | 6 | 1 | PHR-98 | 2023-10-23T21:39:00 |
| ChIJd13ymnZu5kcRXM7jx5boJBs | 2024-03-07T04:56:00 | integrated-location-100 | 15 | 2 | L785 | 2024-03-07T04:56:00 |
| gd_acc_763000 | 2025-08-18T11:13:00 | seasonal-location-101 | 75 | 3 | 7119774 | 2025-08-18T11:13:00 |
| 922ad118-9bad-11eb-a8a2-19ed5c03f8d3 | 2022-01-02T18:30:00 | regional-location-102 | 179 | 4 | 1186094 | 2022-01-02T18:30:00 |

**View `v_annual_general_meeting_dividend_resolution`**

```sql
CREATE VIEW v_annual_general_meeting_dividend_resolution AS
SELECT a.meeting_id, a.meeting_date, a.location, a.total_shares_represented, b.resolution_id AS resolution_resolution_id, b.amount_per_share AS resolution_amount_per_share, b.currency_code AS resolution_currency_code
FROM annual_general_meetings a JOIN dividend_resolutions b ON a.resolution_id = b.resolution_id;
```

| meeting_id | meeting_date | location | total_shares_represented | resolution_resolution_id | resolution_amount_per_share | resolution_currency_code |
|---|---|---|---|---|---|---|
| 20967529 | 2023-10-23T21:39:00 | extended-location-99 | 6 | 9085246 | 1,097 | gd_fp_eu_acc3 |
| ChIJd13ymnZu5kcRXM7jx5boJBs | 2024-03-07T04:56:00 | integrated-location-100 | 15 | gd_acc_120000 | 5.84 | managing-resources |
| gd_acc_763000 | 2025-08-18T11:13:00 | seasonal-location-101 | 75 | 16587506 | 12.72 | f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 |
| 922ad118-9bad-11eb-a8a2-19ed5c03f8d3 | 2022-01-02T18:30:00 | regional-location-102 | 179 | 9736899 | 221.03 | 10445649 |

**View `v_annual_general_meeting_fee_resolution_detail`**

```sql
CREATE VIEW v_annual_general_meeting_fee_resolution_detail AS
SELECT a.meeting_id, a.meeting_date, a.location, b.id AS resolution_id, b.resolution_id AS resolution_resolution_id, b.role_type AS resolution_role_type
FROM annual_general_meetings a
  JOIN meetings_resolutions j ON j.meeting_id = a.meeting_id
  JOIN fee_resolutions b ON b.id = j.fee_resolution_id;
```

| meeting_id | meeting_date | location | resolution_id | resolution_resolution_id | resolution_role_type |
|---|---|---|---|---|---|
| 20967529 | 2023-10-23T21:39:00 | extended-location-99 | 100 | 9085246 | baseline-role-67 |
| 20967529 | 2023-10-23T21:39:00 | extended-location-99 | 101 | gd_acc_120000 | pilot-role-68 |
| ChIJd13ymnZu5kcRXM7jx5boJBs | 2024-03-07T04:56:00 | integrated-location-100 | 101 | gd_acc_120000 | pilot-role-68 |
| ChIJd13ymnZu5kcRXM7jx5boJBs | 2024-03-07T04:56:00 | integrated-location-100 | 102 | 16587506 | extended-role-69 |
| gd_acc_763000 | 2025-08-18T11:13:00 | seasonal-location-101 | 102 | 16587506 | extended-role-69 |
| gd_acc_763000 | 2025-08-18T11:13:00 | seasonal-location-101 | 103 | 9736899 | integrated-role-70 |
| 922ad118-9bad-11eb-a8a2-19ed5c03f8d3 | 2022-01-02T18:30:00 | regional-location-102 | 103 | 9736899 | integrated-role-70 |
| 922ad118-9bad-11eb-a8a2-19ed5c03f8d3 | 2022-01-02T18:30:00 | regional-location-102 | 100 | 9085246 | baseline-role-67 |

**View `v_board_member_nomination_committee`**

```sql
CREATE VIEW v_board_member_nomination_committee AS
SELECT a.id, a.member_id, a.full_name, a.role, b.nomination_committee_id AS committee_nomination_committee_id, b.committee_id AS committee_committee_id, b.meeting_date AS committee_meeting_date
FROM board_members a JOIN nomination_committees b ON a.nomination_committee_id = b.nomination_committee_id;
```

| id | member_id | full_name | role | committee_nomination_committee_id | committee_committee_id | committee_meeting_date |
|---|---|---|---|---|---|---|
| 100 | 10207158 | Theodore Mcgrath | pilot-role-20 | 1 | PHR-98 | 2023-10-23T21:39:00 |
| 101 | 10207158 | Account Name | extended-role-21 | 2 | L785 | 2024-03-07T04:56:00 |
| 102 | 25820616 | Saipan International Airport | integrated-role-22 | 3 | 7119774 | 2025-08-18T11:13:00 |
| 103 | 2002007020250 | Norma Fisher | seasonal-role-23 | 4 | 1186094 | 2022-01-02T18:30:00 |

**View `v_board_member_fee_resolution`**

```sql
CREATE VIEW v_board_member_fee_resolution AS
SELECT a.id, a.member_id, a.full_name, a.role, b.id AS resolution_id, b.resolution_id AS resolution_resolution_id, b.role_type AS resolution_role_type
FROM board_members a JOIN fee_resolutions b ON a.fee_resolution_id = b.id;
```

| id | member_id | full_name | role | resolution_id | resolution_resolution_id | resolution_role_type |
|---|---|---|---|---|---|---|
| 100 | 10207158 | Theodore Mcgrath | pilot-role-20 | 100 | 9085246 | baseline-role-67 |
| 101 | 10207158 | Account Name | extended-role-21 | 101 | gd_acc_120000 | pilot-role-68 |
| 102 | 25820616 | Saipan International Airport | integrated-role-22 | 102 | 16587506 | extended-role-69 |
| 103 | 2002007020250 | Norma Fisher | seasonal-role-23 | 103 | 9736899 | integrated-role-70 |

**View `v_nomination_committee_annual_general_meeting`**

```sql
CREATE VIEW v_nomination_committee_annual_general_meeting AS
SELECT a.nomination_committee_id, a.committee_id, a.meeting_date, a.min_members, b.meeting_id AS meeting_meeting_id, b.meeting_date AS meeting_meeting_date, b.location AS meeting_location
FROM nomination_committees a JOIN annual_general_meetings b ON a.meeting_id = b.meeting_id;
```

| nomination_committee_id | committee_id | meeting_date | min_members | meeting_meeting_id | meeting_meeting_date | meeting_location |
|---|---|---|---|---|---|---|
| 1 | PHR-98 | 2023-10-23T21:39:00 | 38 | 20967529 | 2023-10-23T21:39:00 | extended-location-99 |
| 2 | L785 | 2024-03-07T04:56:00 | 41 | ChIJd13ymnZu5kcRXM7jx5boJBs | 2024-03-07T04:56:00 | integrated-location-100 |
| 3 | 7119774 | 2025-08-18T11:13:00 | 44 | gd_acc_763000 | 2025-08-18T11:13:00 | seasonal-location-101 |
| 4 | 1186094 | 2022-01-02T18:30:00 | 47 | 922ad118-9bad-11eb-a8a2-19ed5c03f8d3 | 2022-01-02T18:30:00 | regional-location-102 |

**View `v_nomination_committee_board_member_detail`**

```sql
CREATE VIEW v_nomination_committee_board_member_detail AS
SELECT a.nomination_committee_id, a.committee_id, a.meeting_date, b.id AS member_id, b.member_id AS member_member_id, b.full_name AS member_full_name
FROM nomination_committees a
  JOIN committees_members j ON j.nomination_committee_id = a.nomination_committee_id
  JOIN board_members b ON b.id = j.board_member_id;
```

| nomination_committee_id | committee_id | meeting_date | member_id | member_member_id | member_full_name |
|---|---|---|---|---|---|
| 1 | PHR-98 | 2023-10-23T21:39:00 | 100 | 10207158 | Theodore Mcgrath |
| 1 | PHR-98 | 2023-10-23T21:39:00 | 101 | 10207158 | Account Name |
| 2 | L785 | 2024-03-07T04:56:00 | 101 | 10207158 | Account Name |
| 2 | L785 | 2024-03-07T04:56:00 | 102 | 25820616 | Saipan International Airport |
| 3 | 7119774 | 2025-08-18T11:13:00 | 102 | 25820616 | Saipan International Airport |
| 3 | 7119774 | 2025-08-18T11:13:00 | 103 | 2002007020250 | Norma Fisher |
| 4 | 1186094 | 2022-01-02T18:30:00 | 103 | 2002007020250 | Norma Fisher |
| 4 | 1186094 | 2022-01-02T18:30:00 | 100 | 10207158 | Theodore Mcgrath |

**View `v_dividend_resolution_annual_general_meeting`**

```sql
CREATE VIEW v_dividend_resolution_annual_general_meeting AS
SELECT a.resolution_id, a.amount_per_share, a.currency_code, a.payment_date, b.meeting_id AS meeting_meeting_id, b.meeting_date AS meeting_meeting_date, b.location AS meeting_location
FROM dividend_resolutions a JOIN annual_general_meetings b ON a.meeting_id = b.meeting_id;
```

| resolution_id | amount_per_share | currency_code | payment_date | meeting_meeting_id | meeting_meeting_date | meeting_location |
|---|---|---|---|---|---|---|
| 9085246 | 1,097 | gd_fp_eu_acc3 | 2024-03-24 | 20967529 | 2023-10-23T21:39:00 | extended-location-99 |
| gd_acc_120000 | 5.84 | managing-resources | 2025-08-08 | ChIJd13ymnZu5kcRXM7jx5boJBs | 2024-03-07T04:56:00 | integrated-location-100 |
| 16587506 | 12.72 | f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 | 2022-01-19 | gd_acc_763000 | 2025-08-18T11:13:00 | seasonal-location-101 |
| 9736899 | 221.03 | 10445649 | 2023-06-03 | 922ad118-9bad-11eb-a8a2-19ed5c03f8d3 | 2022-01-02T18:30:00 | regional-location-102 |

**View `v_dividend_resolution_share_capital`**

```sql
CREATE VIEW v_dividend_resolution_share_capital AS
SELECT a.resolution_id, a.amount_per_share, a.currency_code, a.payment_date, b.id AS capital_id, b.total_value AS capital_total_value, b.currency_code AS capital_currency_code
FROM dividend_resolutions a JOIN share_capitals b ON a.share_capital_id = b.id;
```

| resolution_id | amount_per_share | currency_code | payment_date | capital_id | capital_total_value | capital_currency_code |
|---|---|---|---|---|---|---|
| 9085246 | 1,097 | gd_fp_eu_acc3 | 2024-03-24 | 100 | 9.45 | gd_fp_eu_acc3 |
| gd_acc_120000 | 5.84 | managing-resources | 2025-08-08 | 101 | 12.90 | managing-resources |
| 16587506 | 12.72 | f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 | 2022-01-19 | 102 | 16.35 | f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 |
| 9736899 | 221.03 | 10445649 | 2023-06-03 | 103 | 19.80 | 10445649 |

**View `v_fee_resolution_annual_general_meeting`**

```sql
CREATE VIEW v_fee_resolution_annual_general_meeting AS
SELECT a.id, a.resolution_id, a.role_type, a.fee_amount, b.meeting_id AS meeting_meeting_id, b.meeting_date AS meeting_meeting_date, b.location AS meeting_location
FROM fee_resolutions a JOIN annual_general_meetings b ON a.meeting_id = b.meeting_id;
```

| id | resolution_id | role_type | fee_amount | meeting_meeting_id | meeting_meeting_date | meeting_location |
|---|---|---|---|---|---|---|
| 100 | 9085246 | baseline-role-67 | 38.08 | 20967529 | 2023-10-23T21:39:00 | extended-location-99 |
| 101 | gd_acc_120000 | pilot-role-68 | 18.47 | ChIJd13ymnZu5kcRXM7jx5boJBs | 2024-03-07T04:56:00 | integrated-location-100 |
| 102 | 16587506 | extended-role-69 | 38.08 | gd_acc_763000 | 2025-08-18T11:13:00 | seasonal-location-101 |
| 103 | 9736899 | integrated-role-70 | 26.25 | 922ad118-9bad-11eb-a8a2-19ed5c03f8d3 | 2022-01-02T18:30:00 | regional-location-102 |

**View `v_fee_resolution_board_member_detail`**

```sql
CREATE VIEW v_fee_resolution_board_member_detail AS
SELECT a.id, a.resolution_id, a.role_type, b.id AS member_id, b.member_id AS member_member_id, b.full_name AS member_full_name
FROM fee_resolutions a
  JOIN resolutions_members j ON j.fee_resolution_id = a.id
  JOIN board_members b ON b.id = j.board_member_id;
```

| id | resolution_id | role_type | member_id | member_member_id | member_full_name |
|---|---|---|---|---|---|
| 100 | 9085246 | baseline-role-67 | 100 | 10207158 | Theodore Mcgrath |
| 100 | 9085246 | baseline-role-67 | 101 | 10207158 | Account Name |
| 101 | gd_acc_120000 | pilot-role-68 | 101 | 10207158 | Account Name |
| 101 | gd_acc_120000 | pilot-role-68 | 102 | 25820616 | Saipan International Airport |
| 102 | 16587506 | extended-role-69 | 102 | 25820616 | Saipan International Airport |
| 102 | 16587506 | extended-role-69 | 103 | 2002007020250 | Norma Fisher |
| 103 | 9736899 | integrated-role-70 | 103 | 2002007020250 | Norma Fisher |
| 103 | 9736899 | integrated-role-70 | 100 | 10207158 | Theodore Mcgrath |
