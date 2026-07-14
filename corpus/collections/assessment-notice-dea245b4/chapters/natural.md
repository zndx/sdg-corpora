## The Property Assessment Lifecycle

Property assessment is the systematic process by which jurisdictions determine the value of real estate for taxation, exemption, and appeal purposes. At its core, the domain revolves around physical land parcels, the administrative notices that document their assessed values, the exemptions that reduce tax liability, and the waiver mechanisms that allow property owners to contest valuations. Each parcel carries a unique identifier, an address, a land-use classification, and a zoning district. Each assessment notice ties a parcel to a specific date and property type. Exemptions and waivers introduce temporal dimensions—applicable years and certification dates—that track how a parcel's fiscal treatment evolves over time. The entire operation is overseen by two distinct governing bodies: the Board of Assessors, which handles valuation notices and exemption approvals, and the Board of Equalization, which processes appeal waivers.

**Table `property_parcels`**

| id | parcel_id | address | land_use | area | zoning_district | owner_name | assessment_notice_id | exemption_id | appeal_waiver_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 4447034 | distributed-address-72 | compact-land-14 | 5.95 | adaptive-zoning-95 | Craig Childs | 1 | 5006458 | 1 |
| 2 | 325464 | baseline-address-73 | composite-land-15 | 7.90 | distributed-zoning-96 | Kimberly Smith | 2 | 611515 | 2 |
| 3 | 3990187 | pilot-address-74 | primary-land-16 | 9.85 | baseline-zoning-97 | Michelle Kelley | 3 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | 3 |
| 4 | 110 | extended-address-75 | adaptive-land-17 | 11.80 | pilot-zoning-98 | Jorge Sullivan | 4 | 10238272 | 4 |

The property parcels table forms the geographic and administrative anchor of the system. Each row represents a distinct parcel of land, identified by a parcel number such as `4447034` or `110`, and linked to a physical address like `distributed-address-72` or `extended-address-75`. The land-use classification—values such as `compact-land-14`, `composite-land-15`, `primary-land-16`, and `adaptive-land-17`—describes how the parcel is utilized, while the area column records the parcel's size in acres, ranging from `5.95` for parcel `4447034` to `11.80` for parcel `110`. Zoning districts such as `adaptive-zoning-95` and `pilot-zoning-98` define the regulatory framework within which each parcel operates. Owner names like Craig Childs, Kimberly Smith, Michelle Kelley, and Jorge Sullivan are recorded alongside the parcel, establishing the human entity responsible for the property. Critically, each parcel row also holds foreign keys pointing to its associated assessment notice, exemption, and appeal waiver, creating the foundational links that bind the entire assessment lifecycle together.

**Table `assessment_notices`**

| id | notice_id | issue_date | property_type | notice_type | status | property_identifier | property_parcel_id | board_of_assessors_id |
|---|---|---|---|---|---|---|---|---|
| 1 | b69ce49c-8fd1-11eb-924d-9cd76263cbd0 | 2023-02-01 | seasonal-property-41 | regional-notice-12 | regional-status-84 | PRO-2098 | 1 | 1 |
| 2 | 1889771 | 2024-07-12 | regional-property-42 | legacy-notice-13 | legacy-status-85 | PRO-2103 | 2 | 2 |
| 3 | 6926362 | 2025-12-23 | legacy-property-43 | compact-notice-14 | compact-status-86 | PRO-2108 | 3 | 3 |
| 4 | lu_tax_code_template_b_VB-EC-12 | 2022-05-07 | compact-property-44 | composite-notice-15 | composite-status-87 | PRO-2113 | 4 | 4 |

Assessment notices are the formal documents that communicate a parcel's evaluated value to its owner. Each notice carries a unique identifier—UUIDs like `b69ce49c-8fd1-11eb-924d-9cd76263cbd0` or numeric codes such as `1889771` and `6926362`—and is issued on a specific date, with issue dates spanning from `2022-05-07` to `2025-12-23` in the current dataset. The `property_type` column categorizes the notice by property classification, with values like `seasonal-property-41`, `regional-property-42`, `legacy-property-43`, and `compact-property-44`. The `notice_type` field further distinguishes the format of the notice: `regional-notice-12`, `legacy-notice-13`, `compact-notice-14`, and `composite-notice-15`. A `status` column tracks the processing state of each notice, using values such as `regional-status-84`, `legacy-status-85`, `compact-status-86`, and `composite-status-87`. Every notice is tied to a property identifier (e.g., `PRO-2098`, `PRO-2103`) and, through the `property_parcel_id` and `board_of_assessors_id` columns, links back to the originating parcel and the responsible board.

**Table `board_of_assessorses`**

| board_of_assessors_id | board_id | jurisdiction | meeting_date | status | assessment_notice_id | exemption_id | created_at |
|---|---|---|---|---|---|---|---|
| 1 | ChIJH2V4UYBt5kcR5doeFwuU7Ns | regional-jurisdic-30 | 2023-10-23 | regional-status-84 | 1 | 5006458 | 2025-01-01 00:14:00 |
| 2 | 168553 | legacy-jurisdic-31 | 2024-03-07 | legacy-status-85 | 2 | 611515 | 2025-02-06 03:14:00 |
| 3 | 5006454 | compact-jurisdic-32 | 2025-08-18 | compact-status-86 | 3 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | 2025-03-11 06:14:00 |
| 4 | 1437585 | composite-jurisdic-33 | 2022-01-02 | composite-status-87 | 4 | 10238272 | 2025-04-16 09:14:00 |

The Board of Assessors is the administrative body responsible for issuing assessment notices and approving property exemptions. Each board entry is identified by a `board_id`, which in this dataset includes identifiers such as `ChIJH2V4UYBt5kcR5doeFwuU7Ns`, `168553`, `5006454`, and `1437585`. The `jurisdiction` column specifies the geographic or administrative scope of each board, with values like `regional-jurisdic-30`, `legacy-jurisdic-31`, `compact-jurisdic-32`, and `composite-jurisdic-33`. Meeting dates—`2023-10-23`, `2024-03-07`, `2025-08-18`, and `2022-01-02`—record when each board convened, and the `status` column mirrors the assessment notice statuses, ensuring consistency across the system. Each board record is directly associated with an assessment notice and an exemption through the `assessment_notice_id` and `exemption_id` columns, reinforcing the tight coupling between valuation, exemption, and governance.

**Table `property_exemptions`**

| exemption_id | exemption_type | approval_date | status | property_identifier | applicable_year | property_parcel_id | board_of_assessors_id |
|---|---|---|---|---|---|---|---|
| 5006458 | composite-exemptio-75 | 2023-10-10 | regional-status-84 | PRO-2098 | 34 | 1 | 1 |
| 611515 | primary-exemptio-76 | 2024-03-21 | legacy-status-85 | PRO-2103 | 44 | 2 | 2 |
| e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | adaptive-exemptio-77 | 2025-08-05 | compact-status-86 | PRO-2108 | 54 | 3 | 3 |
| 10238272 | distributed-exemptio-78 | 2022-01-16 | composite-status-87 | PRO-2113 | 64 | 4 | 4 |

Property exemptions reduce or eliminate the tax liability associated with a parcel. The `property_exemptions` table records each exemption with an `exemption_id`—values such as `5006458`, `611515`, `e29bafe2-8fd1-11eb-924d-9cd76263cbd0`, and `10238272`—and an `exemption_type` that describes the nature of the relief: `composite-exemptio-75`, `primary-exemptio-76`, `adaptive-exemptio-77`, and `distributed-exemptio-78`. The `approval_date` marks when the exemption was authorized, ranging from `2022-01-16` to `2025-08-05`. The `applicable_year` column indicates the fiscal year to which the exemption applies, with values of `34`, `44`, `54`, and `64` in the current data. Each exemption is linked to a property identifier (e.g., `PRO-2098`), a `property_parcel_id`, and a `board_of_assessors_id`, ensuring that every exemption can be traced back to the parcel it benefits and the board that approved it.

**Table `appeal_waivers`**

| appeal_waiver_id | waiver_id | waiver_date | property_identifier | status | certified_by | property_parcel_id | board_of_equalization_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 7731859 | 2023-02-17 | PRO-2098 | regional-status-84 | integrated-certifie-22 | 1 | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | default_chart_a_tax_code_29 | 2024-07-01 | PRO-2103 | legacy-status-85 | seasonal-certifie-23 | 2 | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | dac5dfc2-8e30-4950-9bd2-de2b1c28db38 | 2025-12-12 | PRO-2108 | compact-status-86 | regional-certifie-24 | 3 | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | 212 | 2022-05-23 | PRO-2113 | composite-status-87 | legacy-certifie-25 | 4 | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Appeal waivers provide a mechanism for property owners to formally contest their assessment. The `appeal_waivers` table captures each waiver with an `appeal_waiver_id` and a `waiver_id`, the latter including values like `7731859`, `default_chart_a_tax_code_29`, `dac5dfc2-8e30-4950-9bd2-de2b1c28db38`, and `212`. The `waiver_date` records when the waiver was filed, with dates spanning `2022-05-23` to `2025-12-12`. A `certified_by` column identifies the certifying official, using values such as `integrated-certifie-22`, `seasonal-certifie-23`, `regional-certifie-24`, and `legacy-certifie-25`. The `status` column tracks the waiver's processing state, and the `property_parcel_id` and `board_of_equalization_id` columns link the waiver to the relevant parcel and the Board of Equalization. Timestamps for creation (`created_at`) and last update (`updated_at`) provide an audit trail, with values like `2025-01-01 00:14:00` and `2025-04-23 15:41:00` in the dataset.

**Table `board_of_equalizations`**

| board_of_equalization_id | board_id | jurisdiction | meeting_date | status | appeal_waiver_id |
|---|---|---|---|---|---|
| 1 | ChIJH2V4UYBt5kcR5doeFwuU7Ns | regional-jurisdic-30 | 2023-10-23 | regional-status-84 | 1 |
| 2 | 168553 | legacy-jurisdic-31 | 2024-03-07 | legacy-status-85 | 2 |
| 3 | 5006454 | compact-jurisdic-32 | 2025-08-18 | compact-status-86 | 3 |
| 4 | 1437585 | composite-jurisdic-33 | 2022-01-02 | composite-status-87 | 4 |

The Board of Equalization operates independently from the Board of Assessors and is specifically tasked with reviewing appeal waivers. Each board entry carries a `board_of_equalization_id`, a `board_id` (matching the identifiers used by the Board of Assessors, such as `ChIJH2V4UYBt5kcR5doeFwuU7Ns` and `168553`), and a `jurisdiction` column with values like `regional-jurisdic-30` and `legacy-jurisdic-31`. Meeting dates and statuses mirror those of the Board of Assessors, and the `appeal_waiver_id` column directly associates each board record with a specific waiver. This structural symmetry between the two boards—shared board identifiers, matching jurisdictions, and aligned meeting dates—reflects a coordinated governance model in which both bodies operate within the same temporal and geographic framework.

### Cross-Referenced Views

The power of the assessment system lies in its ability to join these base tables into coherent, queryable views. Each view answers a specific operational question by combining data from two or more tables.

**View `assessment_notice_property_parcel_view`**

```sql
CREATE VIEW assessment_notice_property_parcel_view AS
SELECT a.id, a.notice_id, a.issue_date, a.property_type, b.id AS parcel_id, b.parcel_id AS parcel_parcel_id, b.address AS parcel_address
FROM assessment_notices a JOIN property_parcels b ON a.property_parcel_id = b.id;
```

| id | notice_id | issue_date | property_type | parcel_id | parcel_parcel_id | parcel_address |
|---|---|---|---|---|---|---|
| 1 | b69ce49c-8fd1-11eb-924d-9cd76263cbd0 | 2023-02-01 | seasonal-property-41 | 1 | 4447034 | distributed-address-72 |
| 2 | 1889771 | 2024-07-12 | regional-property-42 | 2 | 325464 | baseline-address-73 |
| 3 | 6926362 | 2025-12-23 | legacy-property-43 | 3 | 3990187 | pilot-address-74 |
| 4 | lu_tax_code_template_b_VB-EC-12 | 2022-05-07 | compact-property-44 | 4 | 110 | extended-address-75 |

The assessment notice–parcel view answers the question: which parcels are subject to which assessment notices, and what are their physical characteristics? A row from this view might show that parcel `4447034` at `distributed-address-72`, owned by Craig Childs, is covered by assessment notice `b69ce49c-8fd1-11eb-924d-9cd76263cbd0` issued on `2023-02-01` for a `seasonal-property-41` type. The view surfaces the parcel's area (`5.95` acres) and zoning district (`adaptive-zoning-95`) alongside the notice details, enabling assessors to verify that the correct valuation was applied to the correct physical property.

**View `assessment_notice_board_of_assessors_view`**

```sql
CREATE VIEW assessment_notice_board_of_assessors_view AS
SELECT a.id, a.notice_id, a.issue_date, a.property_type, b.board_of_assessors_id AS assessors_board_of_assessors_id, b.board_id AS assessors_board_id, b.jurisdiction AS assessors_jurisdiction
FROM assessment_notices a JOIN board_of_assessorses b ON a.board_of_assessors_id = b.board_of_assessors_id;
```

| id | notice_id | issue_date | property_type | assessors_board_of_assessors_id | assessors_board_id | assessors_jurisdiction |
|---|---|---|---|---|---|---|
| 1 | b69ce49c-8fd1-11eb-924d-9cd76263cbd0 | 2023-02-01 | seasonal-property-41 | 1 | ChIJH2V4UYBt5kcR5doeFwuU7Ns | regional-jurisdic-30 |
| 2 | 1889771 | 2024-07-12 | regional-property-42 | 2 | 168553 | legacy-jurisdic-31 |
| 3 | 6926362 | 2025-12-23 | legacy-property-43 | 3 | 5006454 | compact-jurisdic-32 |
| 4 | lu_tax_code_template_b_VB-EC-12 | 2022-05-07 | compact-property-44 | 4 | 1437585 | composite-jurisdic-33 |

This view links assessment notices to the Board of Assessors that issued them. It answers the question: which board is responsible for which notice? A representative row would connect notice `1889771` (issued `2024-07-12` for `regional-property-42`) to board `168553` with jurisdiction `legacy-jurisdic-31`, which met on `2024-03-07`. This linkage is essential for accountability and for routing appeals to the correct administrative body.

**View `property_exemption_property_parcel_view`**

```sql
CREATE VIEW property_exemption_property_parcel_view AS
SELECT a.exemption_id, a.exemption_type, a.approval_date, a.status, b.id AS parcel_id, b.parcel_id AS parcel_parcel_id, b.address AS parcel_address
FROM property_exemptions a JOIN property_parcels b ON a.property_parcel_id = b.id;
```

| exemption_id | exemption_type | approval_date | status | parcel_id | parcel_parcel_id | parcel_address |
|---|---|---|---|---|---|---|
| 5006458 | composite-exemptio-75 | 2023-10-10 | regional-status-84 | 1 | 4447034 | distributed-address-72 |
| 611515 | primary-exemptio-76 | 2024-03-21 | legacy-status-85 | 2 | 325464 | baseline-address-73 |
| e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | adaptive-exemptio-77 | 2025-08-05 | compact-status-86 | 3 | 3990187 | pilot-address-74 |
| 10238272 | distributed-exemptio-78 | 2022-01-16 | composite-status-87 | 4 | 110 | extended-address-75 |

The exemption–parcel view reveals which parcels benefit from which exemptions and under what terms. A row might show that parcel `3990187` at `pilot-address-74`, owned by Michelle Kelley, holds exemption `e29bafe2-8fd1-11eb-924d-9cd76263cbd0` of type `adaptive-exemptio-77`, approved on `2025-08-05` and applicable to year `54`. The parcel's land use (`primary-land-16`) and area (`9.85` acres) appear alongside the exemption details, allowing auditors to confirm that the exemption type is appropriate for the parcel's classification.

**View `property_exemption_board_of_assessors_view`**

```sql
CREATE VIEW property_exemption_board_of_assessors_view AS
SELECT a.exemption_id, a.exemption_type, a.approval_date, a.status, b.board_of_assessors_id AS assessors_board_of_assessors_id, b.board_id AS assessors_board_id, b.jurisdiction AS assessors_jurisdiction
FROM property_exemptions a JOIN board_of_assessorses b ON a.board_of_assessors_id = b.board_of_assessors_id;
```

| exemption_id | exemption_type | approval_date | status | assessors_board_of_assessors_id | assessors_board_id | assessors_jurisdiction |
|---|---|---|---|---|---|---|
| 5006458 | composite-exemptio-75 | 2023-10-10 | regional-status-84 | 1 | ChIJH2V4UYBt5kcR5doeFwuU7Ns | regional-jurisdic-30 |
| 611515 | primary-exemptio-76 | 2024-03-21 | legacy-status-85 | 2 | 168553 | legacy-jurisdic-31 |
| e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | adaptive-exemptio-77 | 2025-08-05 | compact-status-86 | 3 | 5006454 | compact-jurisdic-32 |
| 10238272 | distributed-exemptio-78 | 2022-01-16 | composite-status-87 | 4 | 1437585 | composite-jurisdic-33 |

This view connects exemptions to the approving board. It answers: which board approved which exemption? A row might link exemption `611515` (type `primary-exemptio-76`, approved `2024-03-21`) to board `168553` (jurisdiction `legacy-jurisdic-31`). This relationship is critical for tracking which administrative body authorized each tax relief and for ensuring that approvals fall within the correct jurisdictional boundaries.

**View `appeal_waiver_property_parcel_view`**

```sql
CREATE VIEW appeal_waiver_property_parcel_view AS
SELECT a.appeal_waiver_id, a.waiver_id, a.waiver_date, a.property_identifier, b.id AS parcel_id, b.parcel_id AS parcel_parcel_id, b.address AS parcel_address
FROM appeal_waivers a JOIN property_parcels b ON a.property_parcel_id = b.id;
```

| appeal_waiver_id | waiver_id | waiver_date | property_identifier | parcel_id | parcel_parcel_id | parcel_address |
|---|---|---|---|---|---|---|
| 1 | 7731859 | 2023-02-17 | PRO-2098 | 1 | 4447034 | distributed-address-72 |
| 2 | default_chart_a_tax_code_29 | 2024-07-01 | PRO-2103 | 2 | 325464 | baseline-address-73 |
| 3 | dac5dfc2-8e30-4950-9bd2-de2b1c28db38 | 2025-12-12 | PRO-2108 | 3 | 3990187 | pilot-address-74 |
| 4 | 212 | 2022-05-23 | PRO-2113 | 4 | 110 | extended-address-75 |

The appeal waiver–parcel view shows which parcels have active or pending waivers and the details of those appeals. A row might indicate that parcel `110` at `extended-address-75`, owned by Jorge Sullivan, has waiver `212` filed on `2022-05-23`, certified by `legacy-certifie-25`, with status `composite-status-87`. The parcel's land use (`adaptive-land-17`) and area (`11.80` acres) are included, providing context for the appeal—whether the contested valuation relates to the parcel's size, zoning, or land-use classification.

**View `appeal_waiver_board_of_equalization_view`**

```sql
CREATE VIEW appeal_waiver_board_of_equalization_view AS
SELECT a.appeal_waiver_id, a.waiver_id, a.waiver_date, a.property_identifier, b.board_of_equalization_id AS equalization_board_of_equalization_id, b.board_id AS equalization_board_id, b.jurisdiction AS equalization_jurisdiction
FROM appeal_waivers a JOIN board_of_equalizations b ON a.board_of_equalization_id = b.board_of_equalization_id;
```

| appeal_waiver_id | waiver_id | waiver_date | property_identifier | equalization_board_of_equalization_id | equalization_board_id | equalization_jurisdiction |
|---|---|---|---|---|---|---|
| 1 | 7731859 | 2023-02-17 | PRO-2098 | 1 | ChIJH2V4UYBt5kcR5doeFwuU7Ns | regional-jurisdic-30 |
| 2 | default_chart_a_tax_code_29 | 2024-07-01 | PRO-2103 | 2 | 168553 | legacy-jurisdic-31 |
| 3 | dac5dfc2-8e30-4950-9bd2-de2b1c28db38 | 2025-12-12 | PRO-2108 | 3 | 5006454 | compact-jurisdic-32 |
| 4 | 212 | 2022-05-23 | PRO-2113 | 4 | 1437585 | composite-jurisdic-33 |

This view ties appeal waivers to the Board of Equalization that reviews them. It answers: which board is handling which waiver? A row might connect waiver `7731859` (filed `2023-02-17`, certified by `integrated-certifie-22`) to board `ChIJH2V4UYBt5kcR5doeFwuU7Ns` (jurisdiction `regional-jurisdic-30`, meeting `2023-10-23`). This linkage ensures that appeals are routed to the correct equalization board and that the board's meeting schedule aligns with the waiver timeline.

**View `property_parcel_assessment_notice_view`**

```sql
CREATE VIEW property_parcel_assessment_notice_view AS
SELECT a.id, a.parcel_id, a.address, a.land_use, b.id AS notice_id, b.notice_id AS notice_notice_id, b.issue_date AS notice_issue_date
FROM property_parcels a JOIN assessment_notices b ON a.assessment_notice_id = b.id;
```

| id | parcel_id | address | land_use | notice_id | notice_notice_id | notice_issue_date |
|---|---|---|---|---|---|---|
| 1 | 4447034 | distributed-address-72 | compact-land-14 | 1 | b69ce49c-8fd1-11eb-924d-9cd76263cbd0 | 2023-02-01 |
| 2 | 325464 | baseline-address-73 | composite-land-15 | 2 | 1889771 | 2024-07-12 |
| 3 | 3990187 | pilot-address-74 | primary-land-16 | 3 | 6926362 | 2025-12-23 |
| 4 | 110 | extended-address-75 | adaptive-land-17 | 4 | lu_tax_code_template_b_VB-EC-12 | 2022-05-07 |

The parcel–notice view reverses the perspective, starting from the parcel and surfacing its associated assessment notice. It answers: what notice applies to this parcel, and when was it issued? A row might show that parcel `4447034` (owner Craig Childs, area `5.95` acres, zoning `adaptive-zoning-95`) is covered by notice `b69ce49c-8fd1-11eb-924d-9cd76263cbd0` of type `regional-notice-12`, issued `2023-02-01` with status `regional-status-84`. This view is particularly useful for parcel-centric queries, such as generating a complete assessment history for a specific property.

**View `property_parcel_property_exemption_view`**

```sql
CREATE VIEW property_parcel_property_exemption_view AS
SELECT a.id, a.parcel_id, a.address, a.land_use, b.exemption_id AS exemption_exemption_id, b.exemption_type AS exemption_exemption_type, b.approval_date AS exemption_approval_date
FROM property_parcels a JOIN property_exemptions b ON a.exemption_id = b.exemption_id;
```

| id | parcel_id | address | land_use | exemption_exemption_id | exemption_exemption_type | exemption_approval_date |
|---|---|---|---|---|---|---|
| 1 | 4447034 | distributed-address-72 | compact-land-14 | 5006458 | composite-exemptio-75 | 2023-10-10 |
| 2 | 325464 | baseline-address-73 | composite-land-15 | 611515 | primary-exemptio-76 | 2024-03-21 |
| 3 | 3990187 | pilot-address-74 | primary-land-16 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | adaptive-exemptio-77 | 2025-08-05 |
| 4 | 110 | extended-address-75 | adaptive-land-17 | 10238272 | distributed-exemptio-78 | 2022-01-16 |

This view starts from the parcel and reveals its exemption details. It answers: what exemption does this parcel hold, and what are its terms? A row might show that parcel `325464` (owner Kimberly Smith, area `7.90` acres, land use `composite-land-15`) holds exemption `611515` of type `primary-exemptio-76`, approved `2024-03-21` and applicable to year `44`. The combined view of parcel characteristics and exemption terms enables assessors to quickly verify that exemptions are correctly assigned and that the applicable year aligns with the current fiscal period.

**View `property_parcel_appeal_waiver_view`**

```sql
CREATE VIEW property_parcel_appeal_waiver_view AS
SELECT a.id, a.parcel_id, a.address, a.land_use, b.appeal_waiver_id AS waiver_appeal_waiver_id, b.waiver_id AS waiver_waiver_id, b.waiver_date AS waiver_waiver_date
FROM property_parcels a JOIN appeal_waivers b ON a.appeal_waiver_id = b.appeal_waiver_id;
```

| id | parcel_id | address | land_use | waiver_appeal_waiver_id | waiver_waiver_id | waiver_waiver_date |
|---|---|---|---|---|---|---|
| 1 | 4447034 | distributed-address-72 | compact-land-14 | 1 | 7731859 | 2023-02-17 |
| 2 | 325464 | baseline-address-73 | composite-land-15 | 2 | default_chart_a_tax_code_29 | 2024-07-01 |
| 3 | 3990187 | pilot-address-74 | primary-land-16 | 3 | dac5dfc2-8e30-4950-9bd2-de2b1c28db38 | 2025-12-12 |
| 4 | 110 | extended-address-75 | adaptive-land-17 | 4 | 212 | 2022-05-23 |

The parcel–waiver view shows which parcels have associated appeal waivers and the status of those appeals. A row might indicate that parcel `3990187` (owner Michelle Kelley, area `9.85` acres, land use `primary-land-16`) has waiver `3` (waiver ID `dac5dfc2-8e30-4950-9bd2-de2b1c28db38`), filed `2025-12-12`, certified by `regional-certifie-24`, with status `compact-status-86`. This view supports parcel-centric appeal tracking, allowing administrators to see at a glance which properties have active disputes and what their current status is.

**View `board_of_assessors_assessment_notice_view`**

```sql
CREATE VIEW board_of_assessors_assessment_notice_view AS
SELECT a.board_of_assessors_id, a.board_id, a.jurisdiction, a.meeting_date, b.id AS notice_id, b.notice_id AS notice_notice_id, b.issue_date AS notice_issue_date
FROM board_of_assessorses a JOIN assessment_notices b ON a.assessment_notice_id = b.id;
```

| board_of_assessors_id | board_id | jurisdiction | meeting_date | notice_id | notice_notice_id | notice_issue_date |
|---|---|---|---|---|---|---|
| 1 | ChIJH2V4UYBt5kcR5doeFwuU7Ns | regional-jurisdic-30 | 2023-10-23 | 1 | b69ce49c-8fd1-11eb-924d-9cd76263cbd0 | 2023-02-01 |
| 2 | 168553 | legacy-jurisdic-31 | 2024-03-07 | 2 | 1889771 | 2024-07-12 |
| 3 | 5006454 | compact-jurisdic-32 | 2025-08-18 | 3 | 6926362 | 2025-12-23 |
| 4 | 1437585 | composite-jurisdic-33 | 2022-01-02 | 4 | lu_tax_code_template_b_VB-EC-12 | 2022-05-07 |

This view starts from the Board of Assessors and lists the notices it has issued. It answers: which notices has this board processed? A row might show that board `ChIJH2V4UYBt5kcR5doeFwuU7Ns` (jurisdiction `regional-jurisdic-30`, meeting `2023-10-23`) issued notice `b69ce49c-8fd1-11eb-924d-9cd76263cbd0` (type `regional-notice-12`, issued `2023-02-01`, status `regional-status-84`). This perspective is valuable for board-level reporting, enabling administrators to audit the volume and types of notices issued by each board.

**View `board_of_assessors_property_exemption_view`**

```sql
CREATE VIEW board_of_assessors_property_exemption_view AS
SELECT a.board_of_assessors_id, a.board_id, a.jurisdiction, a.meeting_date, b.exemption_id AS exemption_exemption_id, b.exemption_type AS exemption_exemption_type, b.approval_date AS exemption_approval_date
FROM board_of_assessorses a JOIN property_exemptions b ON a.exemption_id = b.exemption_id;
```

| board_of_assessors_id | board_id | jurisdiction | meeting_date | exemption_exemption_id | exemption_exemption_type | exemption_approval_date |
|---|---|---|---|---|---|---|
| 1 | ChIJH2V4UYBt5kcR5doeFwuU7Ns | regional-jurisdic-30 | 2023-10-23 | 5006458 | composite-exemptio-75 | 2023-10-10 |
| 2 | 168553 | legacy-jurisdic-31 | 2024-03-07 | 611515 | primary-exemptio-76 | 2024-03-21 |
| 3 | 5006454 | compact-jurisdic-32 | 2025-08-18 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | adaptive-exemptio-77 | 2025-08-05 |
| 4 | 1437585 | composite-jurisdic-33 | 2022-01-02 | 10238272 | distributed-exemptio-78 | 2022-01-16 |

This view connects the Board of Assessors to the exemptions it has approved. It answers: which exemptions has this board authorized? A row might link board `5006454` (jurisdiction `compact-jurisdic-32`, meeting `2025-08-18`) to exemption `e29bafe2-8fd1-11eb-924d-9cd76263cbd0` (type `adaptive-exemptio-77`, approved `2025-08-05`, applicable year `54`). This view supports compliance auditing by showing which board approved which exemption and whether the approval date precedes the meeting date, ensuring procedural correctness.

**View `board_of_equalization_appeal_waiver_view`**

```sql
CREATE VIEW board_of_equalization_appeal_waiver_view AS
SELECT a.board_of_equalization_id, a.board_id, a.jurisdiction, a.meeting_date, b.appeal_waiver_id AS waiver_appeal_waiver_id, b.waiver_id AS waiver_waiver_id, b.waiver_date AS waiver_waiver_date
FROM board_of_equalizations a JOIN appeal_waivers b ON a.appeal_waiver_id = b.appeal_waiver_id;
```

| board_of_equalization_id | board_id | jurisdiction | meeting_date | waiver_appeal_waiver_id | waiver_waiver_id | waiver_waiver_date |
|---|---|---|---|---|---|---|
| 1 | ChIJH2V4UYBt5kcR5doeFwuU7Ns | regional-jurisdic-30 | 2023-10-23 | 1 | 7731859 | 2023-02-17 |
| 2 | 168553 | legacy-jurisdic-31 | 2024-03-07 | 2 | default_chart_a_tax_code_29 | 2024-07-01 |
| 3 | 5006454 | compact-jurisdic-32 | 2025-08-18 | 3 | dac5dfc2-8e30-4950-9bd2-de2b1c28db38 | 2025-12-12 |
| 4 | 1437585 | composite-jurisdic-33 | 2022-01-02 | 4 | 212 | 2022-05-23 |

The final view connects the Board of Equalization to the waivers it reviews. It answers: which waivers is this board handling? A row might show that board `1437585` (jurisdiction `composite-jurisdic-33`, meeting `2022-01-02`) is reviewing waiver `4` (waiver ID `212`, filed `2022-05-23`, certified by `legacy-certifie-25`, status `composite-status-87`). This view is essential for tracking the workload of each equalization board and for ensuring that waivers are processed within the appropriate jurisdictional and temporal constraints.

### Synthesis

The property assessment domain is a tightly interlocked system of records, each table capturing a distinct phase of the lifecycle: the physical parcel, the valuation notice, the exemption approval, and the appeal waiver. The two boards—Assessors and Equalization—provide the governance layer, with the Board of Assessors handling notices and exemptions and the Board of Equalization handling appeals. The views synthesize these base tables into actionable perspectives, answering questions from both parcel-centric and board-centric angles. Together, the tables and views form a complete operational record of how property values are determined, modified, and contested within the jurisdiction.