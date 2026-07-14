## Ontology-Grounded Relational Modelling of the Property Assessment Domain

The property assessment ecosystem revolves around a single physical asset—the parcel—and the administrative actions that attach to it across a fiscal year. A parcel of land carries an address, a land-use classification, an area, and a zoning district; it is owned by a person whose name appears in the registry. Three distinct administrative events orbit each parcel: an assessment notice that establishes the taxable value, a property exemption that reduces or eliminates that value, and an appeal waiver that records a certified decision by a board of equalization. Each event is independently governed by a board—either a board of assessors or a board of equalization—and each board is itself a persistent entity with its own jurisdictional identity, meeting schedule, and status. The relational schema captures this structure through six base tables whose foreign keys form a star around `property_parcels`, with two board tables providing the organizational context for the administrative events.

**Table `assessment_notices`**

| id | notice_id | issue_date | property_type | notice_type | status | property_identifier | property_parcel_id | board_of_assessors_id |
|---|---|---|---|---|---|---|---|---|
| 1 | b69ce49c-8fd1-11eb-924d-9cd76263cbd0 | 2023-02-01 | seasonal-property-41 | regional-notice-12 | regional-status-84 | PRO-2098 | 1 | 1 |
| 2 | 1889771 | 2024-07-12 | regional-property-42 | legacy-notice-13 | legacy-status-85 | PRO-2103 | 2 | 2 |
| 3 | 6926362 | 2025-12-23 | legacy-property-43 | compact-notice-14 | compact-status-86 | PRO-2108 | 3 | 3 |
| 4 | lu_tax_code_template_b_VB-EC-12 | 2022-05-07 | compact-property-44 | composite-notice-15 | composite-status-87 | PRO-2113 | 4 | 4 |

The `assessment_notices` table is the primary record of a valuation action. Its surrogate key `id` is an auto-incrementing integer, while the business identifier `notice_id` carries a UUID or a legacy code such as `lu_tax_code_template_b_VB-EC-12`. The `issue_date` column anchors the notice to a calendar day—`2023-02-01` for the first row, `2024-07-12` for the second—while `property_type` and `notice_type` classify the notice using coded values like `seasonal-property-41` and `regional-notice-12`. The `status` column (e.g. `regional-status-84`, `legacy-status-85`) tracks the lifecycle stage. Two foreign keys bind the notice to the rest of the model: `property_parcel_id` points to the parcel being assessed, and `board_of_assessors_id` points to the board that issued the notice. The `property_identifier` column (e.g. `PRO-2098`) provides a human-readable alias for the parcel.

**Table `property_exemptions`**

| exemption_id | exemption_type | approval_date | status | property_identifier | applicable_year | property_parcel_id | board_of_assessors_id |
|---|---|---|---|---|---|---|---|
| 5006458 | composite-exemptio-75 | 2023-10-10 | regional-status-84 | PRO-2098 | 34 | 1 | 1 |
| 611515 | primary-exemptio-76 | 2024-03-21 | legacy-status-85 | PRO-2103 | 44 | 2 | 2 |
| e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | adaptive-exemptio-77 | 2025-08-05 | compact-status-86 | PRO-2108 | 54 | 3 | 3 |
| 10238272 | distributed-exemptio-78 | 2022-01-16 | composite-status-87 | PRO-2113 | 64 | 4 | 4 |

The `property_exemptions` table records tax relief actions. Its primary key is the `exemption_id`, which may be a UUID such as `e29bafe2-8fd1-11eb-924d-9cd76263cbd0` or a numeric code like `5006458`. The `exemption_type` column carries values such as `primary-exemptio-76` or `distributed-exemptio-78`. The `approval_date` (e.g. `2024-03-21`) and `status` columns mirror the pattern in `assessment_notices`. The `applicable_year` column stores an integer—`34`, `44`, `54`, `64`—indicating the fiscal year to which the exemption applies. Like the notice table, `property_exemptions` carries `property_parcel_id` and `board_of_assessors_id` as foreign keys, linking the exemption to the parcel and to the issuing board. The `property_identifier` column again provides the human-readable alias.

**Table `appeal_waivers`**

| appeal_waiver_id | waiver_id | waiver_date | property_identifier | status | certified_by | property_parcel_id | board_of_equalization_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 7731859 | 2023-02-17 | PRO-2098 | regional-status-84 | integrated-certifie-22 | 1 | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | default_chart_a_tax_code_29 | 2024-07-01 | PRO-2103 | legacy-status-85 | seasonal-certifie-23 | 2 | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | dac5dfc2-8e30-4950-9bd2-de2b1c28db38 | 2025-12-12 | PRO-2108 | compact-status-86 | regional-certifie-24 | 3 | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | 212 | 2022-05-23 | PRO-2113 | composite-status-87 | legacy-certifie-25 | 4 | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The `appeal_waivers` table captures the outcome of an appeal process. Its surrogate key `appeal_waiver_id` is an integer, while the `waiver_id` column carries a business identifier that may be numeric (`7731859`), a UUID (`dac5dfc2-8e30-4950-9bd2-de2b1c28db38`), or a template code (`default_chart_a_tax_code_29`). The `waiver_date` (e.g. `2023-02-17`) records when the waiver was issued. The `certified_by` column names the certifying official—`integrated-certifie-22`, `seasonal-certifie-23`—and the `status` column tracks the waiver's lifecycle stage. Two audit columns, `created_at` and `updated_at`, store timestamps such as `2025-01-01 00:14:00`. The foreign keys `property_parcel_id` and `board_of_equalization_id` bind the waiver to the parcel and to the board of equalization that certified it. The `property_identifier` column provides the parcel alias.

**Table `property_parcels`**

| id | parcel_id | address | land_use | area | zoning_district | owner_name | assessment_notice_id | exemption_id | appeal_waiver_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 4447034 | distributed-address-72 | compact-land-14 | 5.95 | adaptive-zoning-95 | Craig Childs | 1 | 5006458 | 1 |
| 2 | 325464 | baseline-address-73 | composite-land-15 | 7.90 | distributed-zoning-96 | Kimberly Smith | 2 | 611515 | 2 |
| 3 | 3990187 | pilot-address-74 | primary-land-16 | 9.85 | baseline-zoning-97 | Michelle Kelley | 3 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | 3 |
| 4 | 110 | extended-address-75 | adaptive-land-17 | 11.80 | pilot-zoning-98 | Jorge Sullivan | 4 | 10238272 | 4 |

The `property_parcels` table is the central entity in the schema. Its surrogate key `id` is an integer primary key. The `parcel_id` column carries a business identifier such as `4447034` or `110`. The `address` column stores values like `distributed-address-72` and `baseline-address-73`, while `land_use` carries coded values such as `compact-land-14` and `adaptive-land-17`. The `area` column stores a decimal—`5.95`, `7.90`, `9.85`, `11.80`—representing the parcel's size. The `zoning_district` column carries values like `adaptive-zoning-95` and `pilot-zoning-98`. The `owner_name` column stores the owner's full name—`Craig Childs`, `Kimberly Smith`, `Michelle Kelley`, `Jorge Sullivan`. Critically, `property_parcels` also carries three foreign keys—`assessment_notice_id`, `exemption_id`, and `appeal_waiver_id`—that point back to the three administrative event tables. This creates a bidirectional linkage: the event tables point to the parcel, and the parcel points to the events.

**Table `board_of_assessorses`**

| board_of_assessors_id | board_id | jurisdiction | meeting_date | status | assessment_notice_id | exemption_id | created_at |
|---|---|---|---|---|---|---|---|
| 1 | ChIJH2V4UYBt5kcR5doeFwuU7Ns | regional-jurisdic-30 | 2023-10-23 | regional-status-84 | 1 | 5006458 | 2025-01-01 00:14:00 |
| 2 | 168553 | legacy-jurisdic-31 | 2024-03-07 | legacy-status-85 | 2 | 611515 | 2025-02-06 03:14:00 |
| 3 | 5006454 | compact-jurisdic-32 | 2025-08-18 | compact-status-86 | 3 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | 2025-03-11 06:14:00 |
| 4 | 1437585 | composite-jurisdic-33 | 2022-01-02 | composite-status-87 | 4 | 10238272 | 2025-04-16 09:14:00 |

The `board_of_assessorses` table (note the deliberate spelling) stores the boards that issue assessment notices and exemptions. Its surrogate key `board_of_assessors_id` is an integer. The `board_id` column carries a Google Places-style identifier such as `ChIJH2V4UYBt5kcR5doeFwuU7Ns` or a numeric code like `168553`. The `jurisdiction` column stores values like `regional-jurisdic-30` and `composite-jurisdic-33`. The `meeting_date` column (e.g. `2023-10-23`) records the board's meeting date, and the `status` column tracks its lifecycle. The foreign keys `assessment_notice_id` and `exemption_id` link the board to the events it issued. The `created_at` column stores a timestamp.

**Table `board_of_equalizations`**

| board_of_equalization_id | board_id | jurisdiction | meeting_date | status | appeal_waiver_id |
|---|---|---|---|---|---|
| 1 | ChIJH2V4UYBt5kcR5doeFwuU7Ns | regional-jurisdic-30 | 2023-10-23 | regional-status-84 | 1 |
| 2 | 168553 | legacy-jurisdic-31 | 2024-03-07 | legacy-status-85 | 2 |
| 3 | 5006454 | compact-jurisdic-32 | 2025-08-18 | compact-status-86 | 3 |
| 4 | 1437585 | composite-jurisdic-33 | 2022-01-02 | composite-status-87 | 4 |

The `board_of_equalizations` table stores the boards that certify appeal waivers. Its structure mirrors `board_of_assessorses`: the surrogate key `board_of_equalization_id` is an integer, the `board_id` carries identifiers like `ChIJH2V4UYBt5kcR5doeFwuU7Ns`, the `jurisdiction` column stores values such as `regional-jurisdic-30`, the `meeting_date` records the meeting date, and the `status` column tracks the lifecycle. The foreign key `appeal_waiver_id` links the board to the waiver it certified.

The materialization of this ontology into a relational schema follows a star-join pattern. Each administrative event table (`assessment_notices`, `property_exemptions`, `appeal_waivers`) carries a `property_parcel_id` foreign key that references `property_parcels.id`, forming a many-to-one relationship from events to parcels. The `board_of_assessorses` table is referenced by both `assessment_notices.board_of_assessors_id` and `property_exemptions.board_of_assessors_id`, while `board_of_equalizations` is referenced by `appeal_waivers.board_of_equalization_id`. The `property_parcels` table also carries reverse foreign keys (`assessment_notice_id`, `exemption_id`, `appeal_waiver_id`) that point back to the event tables, creating a bidirectional linkage that supports queries from either direction.

The views materialize domain facts by joining these tables. Each view answers a specific question by reconstructing a complete picture of an entity from its normalized components.

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

The `assessment_notice_property_parcel_view` joins `assessment_notices` to `property_parcels` on `property_parcel_id`. It answers the question: "What parcel does this assessment notice cover, and what are its physical characteristics?" Reading the first row, the notice with `notice_id` `b69ce49c-8fd1-11eb-924d-9cd76263cbd0` issued on `2023-02-01` for property type `seasonal-property-41` covers parcel `4447034` at `distributed-address-72`, owned by `Craig Childs`, with an area of `5.95` and zoning district `adaptive-zoning-95`. The second row links notice `1889771` (issued `2024-07-12`) to parcel `325464` at `baseline-address-73`, owned by `Kimberly Smith`.

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

The `assessment_notice_board_of_assessors_view` joins `assessment_notices` to `board_of_assessorses` on `board_of_assessors_id`. It answers: "Which board issued this notice, and what is its jurisdictional context?" The first row shows that notice `b69ce49c-8fd1-11eb-924d-9cd76263cbd0` was issued by board `ChIJH2V4UYBt5kcR5doeFwuU7Ns` with jurisdiction `regional-jurisdic-30`, which met on `2023-10-23` and holds status `regional-status-84`. The fourth row shows notice `lu_tax_code_template_b_VB-EC-12` was issued by board `1437585` with jurisdiction `composite-jurisdic-33`, which met on `2022-01-02`.

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

The `property_exemption_property_parcel_view` joins `property_exemptions` to `property_parcels` on `property_parcel_id`. It answers: "What parcel benefits from this exemption, and what are its details?" The first row shows that exemption `5006458` of type `composite-exemptio-75`, approved on `2023-10-10` and applicable to year `34`, covers parcel `4447034` at `distributed-address-72` owned by `Craig Childs`. The third row shows exemption `e29bafe2-8fd1-11eb-924d-9cd76263cbd0` of type `adaptive-exemptio-77`, approved on `2025-08-05` and applicable to year `54`, covers parcel `3990187` at `pilot-address-74` owned by `Michelle Kelley`.

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

The `property_exemption_board_of_assessors_view` joins `property_exemptions` to `board_of_assessorses` on `board_of_assessors_id`. It answers: "Which board approved this exemption?" The first row shows exemption `5006458` was approved by board `ChIJH2V4UYBt5kcR5doeFwuU7Ns` with jurisdiction `regional-jurisdic-30`. The fourth row shows exemption `10238272` of type `distributed-exemptio-78` was approved by board `1437585` with jurisdiction `composite-jurisdic-33`.

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

The `appeal_waiver_property_parcel_view` joins `appeal_waivers` to `property_parcels` on `property_parcel_id`. It answers: "What parcel is the subject of this appeal waiver?" The first row shows that waiver `7731859`, issued on `2023-02-17` and certified by `integrated-certifie-22`, concerns parcel `4447034` at `distributed-address-72` owned by `Craig Childs`, with an area of `5.95`. The third row shows waiver `dac5dfc2-8e30-4950-9bd2-de2b1c28db38`, issued on `2025-12-12` and certified by `regional-certifie-24`, concerns parcel `3990187` at `pilot-address-74` owned by `Michelle Kelley`.

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

The `appeal_waiver_board_of_equalization_view` joins `appeal_waivers` to `board_of_equalizations` on `board_of_equalization_id`. It answers: "Which board of equalization certified this waiver?" The first row shows waiver `7731859` was certified by board `ChIJH2V4UYBt5kcR5doeFwuU7Ns` with jurisdiction `regional-jurisdic-30`, which met on `2023-10-23`. The fourth row shows waiver `212` was certified by board `1437585` with jurisdiction `composite-jurisdic-33`, which met on `2022-01-02`.

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

The `property_parcel_assessment_notice_view` joins `property_parcels` to `assessment_notices` on `assessment_notice_id`. It answers the reverse question: "What assessment notice is attached to this parcel?" The first row shows that parcel `4447034` at `distributed-address-72` owned by `Craig Childs` has assessment notice `b69ce49c-8fd1-11eb-924d-9cd76263cbd0` issued on `2023-02-01` for property type `seasonal-property-41`. The fourth row shows parcel `110` at `extended-address-75` owned by `Jorge Sullivan` has notice `lu_tax_code_template_b_VB-EC-12` issued on `2022-05-07`.

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

The `property_parcel_property_exemption_view` joins `property_parcels` to `property_exemptions` on `exemption_id`. It answers: "What exemption is attached to this parcel?" The first row shows parcel `4447034` owned by `Craig Childs` has exemption `5006458` of type `composite-exemptio-75`, approved on `2023-10-10` and applicable to year `34`. The third row shows parcel `3990187` owned by `Michelle Kelley` has exemption `e29bafe2-8fd1-11eb-924d-9cd76263cbd0` of type `adaptive-exemptio-77`, approved on `2025-08-05` and applicable to year `54`.

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

The `property_parcel_appeal_waiver_view` joins `property_parcels` to `appeal_waivers` on `appeal_waiver_id`. It answers: "What appeal waiver is attached to this parcel?" The first row shows parcel `4447034` owned by `Craig Childs` has appeal waiver `7731859`, issued on `2023-02-17` and certified by `integrated-certifie-22`. The fourth row shows parcel `110` owned by `Jorge Sullivan` has waiver `212`, issued on `2022-05-23` and certified by `legacy-certifie-25`.

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

The `board_of_assessors_assessment_notice_view` joins `board_of_assessorses` to `assessment_notices` on `assessment_notice_id`. It answers: "What assessment notices did this board issue?" The first row shows board `ChIJH2V4UYBt5kcR5doeFwuU7Ns` with jurisdiction `regional-jurisdic-30` issued notice `b69ce49c-8fd1-11eb-924d-9cd76263cbd0` of type `regional-notice-12` on `2023-02-01`. The second row shows board `168553` with jurisdiction `legacy-jurisdic-31` issued notice `1889771` of type `legacy-notice-13` on `2024-07-12`.

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

The `board_of_assessors_property_exemption_view` joins `board_of_assessorses` to `property_exemptions` on `exemption_id`. It answers: "What exemptions did this board approve?" The first row shows board `ChIJH2V4UYBt5kcR5doeFwuU7Ns` approved exemption `5006458` of type `composite-exemptio-75` on `2023-10-10`. The third row shows board `5006454` with jurisdiction `compact-jurisdic-32` approved exemption `e29bafe2-8fd1-11eb-924d-9cd76263cbd0` of type `adaptive-exemptio-77` on `2025-08-05`.

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

The `board_of_equalization_appeal_waiver_view` joins `board_of_equalizations` to `appeal_waivers` on `appeal_waiver_id`. It answers: "What appeal waivers did this board certify?" The first row shows board `ChIJH2V4UYBt5kcR5doeFwuU7Ns` with jurisdiction `regional-jurisdic-30` certified waiver `7731859` on `2023-02-17`. The fourth row shows board `1437585` with jurisdiction `composite-jurisdic-33` certified waiver `212` on `2022-05-23`.

The schema design achieves a balance between normalization and query convenience. The six base tables capture the core entities with minimal redundancy: each administrative event is stored once with its foreign keys pointing to the parcel and the governing board. The bidirectional foreign keys in `property_parcels` (pointing back to the event tables) enable efficient reverse lookups without requiring joins from the event side. The twelve views materialize the most common query patterns—looking up a parcel's details from an event, looking up an event's details from a parcel, and looking up all events issued or certified by a board—by pre-joining the relevant tables. This pattern, where a central entity (the parcel) is surrounded by event tables that each carry a foreign key to it, is a classic star schema variant adapted for a domain where events are the primary actors and the parcel is the persistent anchor. The board tables, referenced by the event tables, form a secondary star that provides organizational context. Together, the base tables and views provide a complete, queryable representation of the property assessment domain that faithfully reflects the underlying ontology.