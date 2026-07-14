## Domain Modelling and Relational Materialization

The building-permit lifecycle in this domain is captured across seven base tables that together record the full arc from property identification through permit issuance, inspection scheduling, segment-level project tracking, and final occupancy certification. At the centre of the model sits the building permit, a document that binds a physical property parcel to a regulatory jurisdiction, an inspection event, and a project segment, while also carrying its own lifecycle metadata such as issue and expiry dates, project type, ownership classification, unit count, square footage, and current status. The permit is the primary anchor: every other entity either references it directly or is reachable through a chain of foreign keys that trace back to it. The relational schema is deliberately normalised, with each base table owning a single natural key and exposing foreign-key columns that reconstruct domain facts only when joined through explicit views. This chapter walks through the entity types, their attributes, the cardinality-bounded relationships that become columns and junction tables, and the materialised views that answer the most common analytical questions.

**Table `building_permits`**

| permit_id | issue_date | expiry_date | project_type_code | project_type_description | ownership_type | total_units | contracted_square_feet | status | property_parcel_id | building_inspections_division_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 3ac831c6-8fb5-11eb-924d-9cd76263cbd0 | 2023-02-01 | 2023-10-24 | gd_taxc_2211 | Primary Survey A | baseline-ownershi-73 | 19 | 12.70 | pending | 1 | 100 |
| ase | 2024-07-12 | 2024-03-08 | 4543 | Composite Corridor | pilot-ownershi-74 | 2 | 14.40 | active | 2 | 101 |
| 6969410 | 2025-12-23 | 2025-08-19 | 103167 | Compact Series | extended-ownershi-75 | 57 | 16.10 | completed | 3 | 102 |
| 727069 | 2022-05-07 | 2022-01-03 | 10966232 | Legacy Assessment D | integrated-ownershi-76 | 0 | 17.80 | revoked | 4 | 103 |

The `building_permits` table is the central entity. Its primary key, `permit_id`, is a UUID (for example, `3ac831c6-8fb5-11eb-924d-9cd76263cbd0`) that uniquely identifies each permit record. The table stores temporal metadata in `issue_date` and `expiry_date`—the first permit was issued on `2023-02-01` and expires on `2023-10-24`, while a later permit (`ase`) was issued on `2024-07-12` with an expiry of `2024-03-08`, suggesting a back-dated or retroactive permit. The `project_type_code` and `project_type_description` columns classify the nature of the work; values range from `gd_taxc_2211` (Primary Survey A) to `4543` (Composite Corridor) and `103167` (Compact Series). Ownership is captured in `ownership_type`, with coded values such as `baseline-ownershi-73`, `pilot-ownershi-74`, `extended-ownershi-75`, and `integrated-ownershi-76`. Quantitative attributes include `total_units` (ranging from `0` to `57` units) and `contracted_square_feet` (from `12.70` to `17.80`). The `status` column tracks the permit's lifecycle state with values `pending`, `active`, `completed`, and `revoked`. Two foreign-key columns, `property_parcel_id` and `building_inspections_division_id`, link the permit to the `property_parcels` and `building_inspections_divisions` tables respectively, establishing one-to-one or one-to-many relationships depending on the cardinality constraints enforced at the schema level.

**Table `property_parcels`**

| id | street_address | municipality | parcel_id | zoning_district | land_use_category | permit_id | inspection_event_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|
| 1 | composite-street-15 | extended-municipa-99 | 4447034 | adaptive-zoning-95 | adaptive-land-65 | 3ac831c6-8fb5-11eb-924d-9cd76263cbd0 | 100 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | primary-street-16 | integrated-municipa-100 | 325464 | distributed-zoning-96 | distributed-land-66 | ase | 101 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | adaptive-street-17 | seasonal-municipa-101 | 3990187 | baseline-zoning-97 | baseline-land-67 | 6969410 | 102 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | distributed-street-18 | regional-municipa-102 | 110 | pilot-zoning-98 | pilot-land-68 | 727069 | 103 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The `property_parcels` table models the physical land parcels on which permitted work occurs. Its primary key is `id`, a small integer (`1` through `4` in the sample data). The table stores the `street_address` (e.g., `composite-street-15`, `primary-street-16`), `municipality` (e.g., `extended-municipa-99`, `integrated-municipa-100`), a human-readable `parcel_id` (such as `4447034` or `325464`), and classification columns `zoning_district` (e.g., `adaptive-zoning-95`, `distributed-zoning-96`) and `land_use_category` (e.g., `adaptive-land-65`, `distributed-land-66`). Timestamps `created_at` and `updated_at` record the lifecycle of the parcel record itself. The table also carries `permit_id` and `inspection_event_id` as foreign-key columns, creating a bidirectional linkage: each parcel row points to exactly one permit and one inspection event, while the permit table's `property_parcel_id` column points back, forming a tightly coupled relationship. The sample data shows parcel `1` linked to permit `3ac831c6-8fb5-11eb-924d-9cd76263cbd0` and inspection event `100`, parcel `2` linked to permit `ase` and inspection event `101`, and so on through parcel `4`.

**Table `inspection_events`**

| id | inspection_id | scheduled_date | completion_date | inspection_type | result_status | completed_within24_hours | inspector_badge_number | permit_id | property_parcel_id | project_segment_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 100 | BJanecke | 2024-11-27T22:18:00 | 2024-03-14T02:06:00 | compact-inspecti-44 | passed | false | INS-2007 | 3ac831c6-8fb5-11eb-924d-9cd76263cbd0 | 1 | 1 |
| 101 | 575199 | 2025-04-11T05:35:00 | 2025-08-25T09:23:00 | composite-inspecti-45 | failed | true | INS-2013 | ase | 2 | 2 |
| 102 | state_uk_4 | 2022-09-22T12:52:00 | 2022-01-09T16:40:00 | primary-inspecti-46 | pending | false | INS-2019 | 6969410 | 3 | 3 |
| 103 | 8350011 | 2023-02-06T19:09:00 | 2023-06-20T23:57:00 | adaptive-inspecti-47 | re-inspection_required | true | INS-2025 | 727069 | 4 | 4 |

Inspection events are recorded in the `inspection_events` table, which captures the scheduling and outcome of regulatory inspections. The primary key is `id` (integer values `100` through `103`). The `inspection_id` column holds a secondary identifier, which in the sample data takes values like `BJanecke`, `575199`, `state_uk_4`, and `8350011`. Temporal columns `scheduled_date` and `completion_date` record when the inspection was planned and when it was actually completed; for inspection `100`, the scheduled date is `2024-11-27T22:18:00` while the completion date is `2024-03-14T02:06:00`, indicating the inspection was completed before its scheduled date. The `inspection_type` column classifies the inspection (e.g., `compact-inspecti-44`, `composite-inspecti-45`, `primary-inspecti-46`, `adaptive-inspecti-47`), and `result_status` records the outcome as `passed`, `failed`, `pending`, or `re-inspection_required`. A boolean flag `completed_within24_hours` indicates timeliness, while `inspector_badge_number` identifies the inspector (e.g., `INS-2007`, `INS-2013`, `INS-2019`, `INS-2025`). Foreign-key columns `permit_id`, `property_parcel_id`, and `project_segment_id` link the inspection event to its parent permit, the associated property parcel, and the project segment being inspected, respectively.

**Table `project_segments`**

| project_segment_id | segment_code | segment_description | valuation_amount | fee_amount | segment_count | permit_id | inspection_event_id |
|---|---|---|---|---|---|---|---|
| 1 | 3990169 | Baseline Corridor D | 442.51 | 38.08 | 7 | 3ac831c6-8fb5-11eb-924d-9cd76263cbd0 | 100 |
| 2 | 9085246 | Distributed Series | 33.06 | 18.47 | 8 | ase | 101 |
| 3 | 5006449 | Adaptive Assessment | 3,079 | 38.08 | 7 | 6969410 | 102 |
| 4 | L137 | Primary Survey A | 45,650 | 26.25 | 2 | 727069 | 103 |

Project segments break a permit into discrete, billable, or trackable work units. The `project_segments` table has `project_segment_id` as its primary key (integer values `1` through `4`). Each segment carries a `segment_code` (e.g., `3990169`, `9085246`, `5006449`, `L137`) and a `segment_description` (e.g., `Baseline Corridor D`, `Distributed Series`, `Adaptive Assessment`, `Primary Survey A`). Financial attributes include `valuation_amount` (ranging from `33.06` to `45,650`) and `fee_amount` (from `18.47` to `38.08`). The `segment_count` column indicates the number of segments (values `2`, `7`, and `8` in the sample). Foreign-key columns `permit_id` and `inspection_event_id` tie each segment to its parent permit and the associated inspection event, ensuring that every segment is traceable to both the regulatory document and the inspection that validated it.

**Table `certificate_of_occupancies`**

| certificate_of_occupancy_id | c_of_o_id | issue_date | reason | building_square_footage | occupancy_status | property_parcel_id | permit_id | building_inspections_division_id |
|---|---|---|---|---|---|---|---|---|
| 100 | 209217 | 2023-02-01 | new_tenant | 15.70 | approved | 1 | 3ac831c6-8fb5-11eb-924d-9cd76263cbd0 | 100 |
| 101 | 10039 | 2024-07-12 | management_change | 17.40 | conditional | 2 | ase | 101 |
| 102 | lu_tax_code_template_b_VB-IC-6 | 2025-12-23 | name_change | 19.10 | revoked | 3 | 6969410 | 102 |
| 103 | 10782165 | 2022-05-07 | ownership_change | 20.80 | approved | 4 | 727069 | 103 |

Certificate of occupancy records are stored in the `certificate_of_occupancies` table, which documents the final occupancy status of a permitted structure. The primary key is `certificate_of_occupancy_id` (integer values `100` through `103`). The `c_of_o_id` column provides a secondary identifier (e.g., `209217`, `10039`, `lu_tax_code_template_b_VB-IC-6`, `10782165`). The `issue_date` records when the certificate was issued, and `reason` captures the basis for issuance with values such as `new_tenant`, `management_change`, `name_change`, and `ownership_change`. The `building_square_footage` column (values `15.70` through `20.80`) and `occupancy_status` (values `approved`, `conditional`, `revoked`) provide quantitative and qualitative occupancy information. Foreign-key columns `property_parcel_id`, `permit_id`, and `building_inspections_division_id` link the certificate to the property parcel, the originating permit, and the inspections division responsible for the oversight.

**Table `building_inspections_divisions`**

| id | division_code | jurisdiction_name | reporting_period_start | reporting_period_end | total_permit_fees_collected | performance_target | permit_id | certificate_of_occupancy_id | inspection_event_id |
|---|---|---|---|---|---|---|---|---|---|
| 100 | 103191 | Pilot Cluster | 2023-02-20 | 2024-03-23 | 289.59 | distributed-performa-36 | 3ac831c6-8fb5-11eb-924d-9cd76263cbd0 | 100 | 100 |
| 101 | 113 | Baseline Review | 2024-07-04 | 2025-08-07 | 6,025 | baseline-performa-37 | ase | 101 | 101 |
| 102 | 1250220 | Distributed Initiative A | 2025-12-15 | 2022-01-18 | 2.87 | pilot-performa-38 | 6969410 | 102 | 102 |
| 103 | 5f923cfa-8fcd-11eb-924d-9cd76263cbd0 | Adaptive Model | 2022-05-26 | 2023-06-02 | 76,784 | extended-performa-39 | 727069 | 103 | 103 |

The `building_inspections_divisions` table models the regulatory bodies or divisions that oversee inspections. Its primary key is `id` (integer values `100` through `103`). The `division_code` column holds a secondary code (e.g., `103191`, `113`, `1250220`, `5f923cfa-8fcd-11eb-924d-9cd76263cbd0`), and `jurisdiction_name` provides a human-readable name (e.g., `Pilot Cluster`, `Baseline Review`, `Distributed Initiative A`, `Adaptive Model`). Temporal columns `reporting_period_start` and `reporting_period_end` define the active reporting window for the division. Financial and performance metrics include `total_permit_fees_collected` (ranging from `2.87` to `76,784`) and `performance_target` (coded values such as `distributed-performa-36`, `baseline-performa-37`, `pilot-performa-38`, `extended-performa-39`). Foreign-key columns `permit_id`, `certificate_of_occupancy_id`, and `inspection_event_id` link each division record to its associated permit, certificate, and inspection event.

**Table `permits_events`**

| permit_id | inspection_event_id |
|---|---|
| 3ac831c6-8fb5-11eb-924d-9cd76263cbd0 | 100 |
| 3ac831c6-8fb5-11eb-924d-9cd76263cbd0 | 101 |
| ase | 101 |
| ase | 102 |
| 6969410 | 102 |
| 6969410 | 103 |
| 727069 | 103 |
| 727069 | 100 |

The `permits_events` table serves as a junction table that resolves the many-to-many relationship between building permits and inspection events. By storing pairs of `permit_id` and `inspection_event_id`, it allows a single permit to be associated with multiple inspection events and a single inspection event to be associated with multiple permits, while maintaining referential integrity through the foreign-key columns that reference the primary keys of the `building_permits` and `inspection_events` tables. This normalised design avoids data redundancy and supports flexible cardinality in the permit-inspection relationship.

The base tables above form the normalised core of the schema. Each table owns a single natural key and exposes foreign-key columns that point to related entities. The relationships are cardinality-bounded: a building permit references exactly one property parcel and one building inspections division through its `property_parcel_id` and `building_inspections_division_id` columns, while a property parcel references exactly one permit through its `permit_id` column. Inspection events reference their parent permit, property parcel, and project segment through their respective foreign-key columns. Project segments reference their parent permit and inspection event. Certificates of occupancy reference their property parcel, permit, and inspections division. The `permits_events` junction table provides an additional layer of flexibility for permit-inspection associations that may not be captured by the direct foreign-key columns in the base tables.

**View `building_permit_property_parcel_view`**

```sql
CREATE VIEW building_permit_property_parcel_view AS
SELECT a.permit_id, a.issue_date, a.expiry_date, a.project_type_code, b.id AS parcel_id, b.street_address AS parcel_street_address, b.municipality AS parcel_municipality
FROM building_permits a JOIN property_parcels b ON a.property_parcel_id = b.id;
```

| permit_id | issue_date | expiry_date | project_type_code | parcel_id | parcel_street_address | parcel_municipality |
|---|---|---|---|---|---|---|
| 3ac831c6-8fb5-11eb-924d-9cd76263cbd0 | 2023-02-01 | 2023-10-24 | gd_taxc_2211 | 1 | composite-street-15 | extended-municipa-99 |
| ase | 2024-07-12 | 2024-03-08 | 4543 | 2 | primary-street-16 | integrated-municipa-100 |
| 6969410 | 2025-12-23 | 2025-08-19 | 103167 | 3 | adaptive-street-17 | seasonal-municipa-101 |
| 727069 | 2022-05-07 | 2022-01-03 | 10966232 | 4 | distributed-street-18 | regional-municipa-102 |

The `building_permit_property_parcel_view` joins the `building_permits` table to the `property_parcels` table on the shared `property_parcel_id` / `id` relationship. This view answers the question: "What property parcel is associated with each building permit?" Reading the first row, the permit `3ac831c6-8fb5-11eb-924d-9cd76263cbd0` (issued `2023-02-01`, status `pending`, with `19` total units and `12.70` contracted square feet) is linked to parcel `1` at `composite-street-15` in municipality `extended-municipa-99`, with parcel ID `4447034`, zoning district `adaptive-zoning-95`, and land use category `adaptive-land-65`. The second row shows permit `ase` (issued `2024-07-12`, status `active`, `2` units, `14.40` sq ft) linked to parcel `2` at `primary-street-16` in municipality `integrated-municipa-100`, parcel ID `325464`, zoning district `distributed-zoning-96`, and land use category `distributed-land-66`.

**View `building_permit_building_inspections_division_view`**

```sql
CREATE VIEW building_permit_building_inspections_division_view AS
SELECT a.permit_id, a.issue_date, a.expiry_date, a.project_type_code, b.id AS division_id, b.division_code AS division_division_code, b.jurisdiction_name AS division_jurisdiction_name
FROM building_permits a JOIN building_inspections_divisions b ON a.building_inspections_division_id = b.id;
```

| permit_id | issue_date | expiry_date | project_type_code | division_id | division_division_code | division_jurisdiction_name |
|---|---|---|---|---|---|---|
| 3ac831c6-8fb5-11eb-924d-9cd76263cbd0 | 2023-02-01 | 2023-10-24 | gd_taxc_2211 | 100 | 103191 | Pilot Cluster |
| ase | 2024-07-12 | 2024-03-08 | 4543 | 101 | 113 | Baseline Review |
| 6969410 | 2025-12-23 | 2025-08-19 | 103167 | 102 | 1250220 | Distributed Initiative A |
| 727069 | 2022-05-07 | 2022-01-03 | 10966232 | 103 | 5f923cfa-8fcd-11eb-924d-9cd76263cbd0 | Adaptive Model |

The `building_permit_building_inspections_division_view` joins `building_permits` to `building_inspections_divisions` on the `building_inspections_division_id` / `id` relationship. This view answers: "Which inspections division oversees each building permit?" The first row shows permit `3ac831c6-8fb5-11eb-924d-9cd76263cbd0` overseen by division `100` (code `103191`, jurisdiction `Pilot Cluster`, reporting period `2023-02-20` to `2024-03-23`, fees collected `289.59`, performance target `distributed-performa-36`). The second row shows permit `ase` overseen by division `101` (code `113`, jurisdiction `Baseline Review`, reporting period `2024-07-04` to `2025-08-07`, fees collected `6,025`, performance target `baseline-performa-37`).

**View `building_permit_inspection_event_detail_view`**

```sql
CREATE VIEW building_permit_inspection_event_detail_view AS
SELECT a.permit_id, a.issue_date, a.expiry_date, b.id AS event_id, b.inspection_id AS event_inspection_id, b.scheduled_date AS event_scheduled_date
FROM building_permits a
  JOIN permits_events j ON j.permit_id = a.permit_id
  JOIN inspection_events b ON b.id = j.inspection_event_id;
```

| permit_id | issue_date | expiry_date | event_id | event_inspection_id | event_scheduled_date |
|---|---|---|---|---|---|
| 3ac831c6-8fb5-11eb-924d-9cd76263cbd0 | 2023-02-01 | 2023-10-24 | 100 | BJanecke | 2024-11-27T22:18:00 |
| 3ac831c6-8fb5-11eb-924d-9cd76263cbd0 | 2023-02-01 | 2023-10-24 | 101 | 575199 | 2025-04-11T05:35:00 |
| ase | 2024-07-12 | 2024-03-08 | 101 | 575199 | 2025-04-11T05:35:00 |
| ase | 2024-07-12 | 2024-03-08 | 102 | state_uk_4 | 2022-09-22T12:52:00 |
| 6969410 | 2025-12-23 | 2025-08-19 | 102 | state_uk_4 | 2022-09-22T12:52:00 |
| 6969410 | 2025-12-23 | 2025-08-19 | 103 | 8350011 | 2023-02-06T19:09:00 |
| 727069 | 2022-05-07 | 2022-01-03 | 103 | 8350011 | 2023-02-06T19:09:00 |
| 727069 | 2022-05-07 | 2022-01-03 | 100 | BJanecke | 2024-11-27T22:18:00 |

The `building_permit_inspection_event_detail_view` joins `building_permits` to `inspection_events` on the `permit_id` column. This view answers: "What inspection events are associated with each building permit?" The first row links permit `3ac831c6-8fb5-11eb-924d-9cd76263cbd0` to inspection event `100` (inspection ID `BJanecke`, scheduled `2024-11-27T22:18:00`, completed `2024-03-14T02:06:00`, type `compact-inspecti-44`, result `passed`, completed within 24 hours `false`, inspector `INS-2007`). The second row links permit `ase` to inspection event `101` (inspection ID `575199`, scheduled `2025-04-11T05:35:00`, completed `2025-08-25T09:23:00`, type `composite-inspecti-45`, result `failed`, completed within 24 hours `true`, inspector `INS-2013`).

**View `property_parcel_building_permit_view`**

```sql
CREATE VIEW property_parcel_building_permit_view AS
SELECT a.id, a.street_address, a.municipality, a.parcel_id, b.permit_id AS permit_permit_id, b.issue_date AS permit_issue_date, b.expiry_date AS permit_expiry_date
FROM property_parcels a JOIN building_permits b ON a.permit_id = b.permit_id;
```

| id | street_address | municipality | parcel_id | permit_permit_id | permit_issue_date | permit_expiry_date |
|---|---|---|---|---|---|---|
| 1 | composite-street-15 | extended-municipa-99 | 4447034 | 3ac831c6-8fb5-11eb-924d-9cd76263cbd0 | 2023-02-01 | 2023-10-24 |
| 2 | primary-street-16 | integrated-municipa-100 | 325464 | ase | 2024-07-12 | 2024-03-08 |
| 3 | adaptive-street-17 | seasonal-municipa-101 | 3990187 | 6969410 | 2025-12-23 | 2025-08-19 |
| 4 | distributed-street-18 | regional-municipa-102 | 110 | 727069 | 2022-05-07 | 2022-01-03 |

The `property_parcel_building_permit_view` joins `property_parcels` to `building_permits` on the `id` / `property_parcel_id` relationship, effectively reversing the perspective of the `building_permit_property_parcel_view`. This view answers: "Which building permits are associated with each property parcel?" The first row shows parcel `1` at `composite-street-15` (municipality `extended-municipa-99`, parcel ID `4447034`, zoning `adaptive-zoning-95`, land use `adaptive-land-65`) linked to permit `3ac831c6-8fb5-11eb-924d-9cd76263cbd0` (issued `2023-02-01`, project type `gd_taxc_2211` / Primary Survey A, ownership `baseline-ownershi-73`, `19` units, `12.70` sq ft, status `pending`). The second row shows parcel `2` at `primary-street-16` (municipality `integrated-municipa-100`, parcel ID `325464`, zoning `distributed-zoning-96`, land use `distributed-land-66`) linked to permit `ase` (issued `2024-07-12`, project type `4543` / Composite Corridor, ownership `pilot-ownershi-74`, `2` units, `14.40` sq ft, status `active`).

**View `property_parcel_inspection_event_view`**

```sql
CREATE VIEW property_parcel_inspection_event_view AS
SELECT a.id, a.street_address, a.municipality, a.parcel_id, b.id AS event_id, b.inspection_id AS event_inspection_id, b.scheduled_date AS event_scheduled_date
FROM property_parcels a JOIN inspection_events b ON a.inspection_event_id = b.id;
```

| id | street_address | municipality | parcel_id | event_id | event_inspection_id | event_scheduled_date |
|---|---|---|---|---|---|---|
| 1 | composite-street-15 | extended-municipa-99 | 4447034 | 100 | BJanecke | 2024-11-27T22:18:00 |
| 2 | primary-street-16 | integrated-municipa-100 | 325464 | 101 | 575199 | 2025-04-11T05:35:00 |
| 3 | adaptive-street-17 | seasonal-municipa-101 | 3990187 | 102 | state_uk_4 | 2022-09-22T12:52:00 |
| 4 | distributed-street-18 | regional-municipa-102 | 110 | 103 | 8350011 | 2023-02-06T19:09:00 |

The `property_parcel_inspection_event_view` joins `property_parcels` to `inspection_events` on the `id` / `property_parcel_id` relationship. This view answers: "What inspection events have been conducted on each property parcel?" The first row links parcel `1` at `composite-street-15` to inspection event `100` (inspection ID `BJanecke`, scheduled `2024-11-27T22:18:00`, completed `2024-03-14T02:06:00`, type `compact-inspecti-44`, result `passed`, inspector `INS-2007`). The second row links parcel `2` at `primary-street-16` to inspection event `101` (inspection ID `575199`, scheduled `2025-04-11T05:35:00`, completed `2025-08-25T09:23:00`, type `composite-inspecti-45`, result `failed`, inspector `INS-2013`).

**View `inspection_event_building_permit_view`**

```sql
CREATE VIEW inspection_event_building_permit_view AS
SELECT a.id, a.inspection_id, a.scheduled_date, a.completion_date, b.permit_id AS permit_permit_id, b.issue_date AS permit_issue_date, b.expiry_date AS permit_expiry_date
FROM inspection_events a JOIN building_permits b ON a.permit_id = b.permit_id;
```

| id | inspection_id | scheduled_date | completion_date | permit_permit_id | permit_issue_date | permit_expiry_date |
|---|---|---|---|---|---|---|
| 100 | BJanecke | 2024-11-27T22:18:00 | 2024-03-14T02:06:00 | 3ac831c6-8fb5-11eb-924d-9cd76263cbd0 | 2023-02-01 | 2023-10-24 |
| 101 | 575199 | 2025-04-11T05:35:00 | 2025-08-25T09:23:00 | ase | 2024-07-12 | 2024-03-08 |
| 102 | state_uk_4 | 2022-09-22T12:52:00 | 2022-01-09T16:40:00 | 6969410 | 2025-12-23 | 2025-08-19 |
| 103 | 8350011 | 2023-02-06T19:09:00 | 2023-06-20T23:57:00 | 727069 | 2022-05-07 | 2022-01-03 |

The `inspection_event_building_permit_view` joins `inspection_events` to `building_permits` on the `id` / `permit_id` relationship, reversing the perspective of the `building_permit_inspection_event_detail_view`. This view answers: "Which building permit triggered each inspection event?" The first row shows inspection event `100` (inspection ID `BJanecke`, scheduled `2024-11-27T22:18:00`, completed `2024-03-14T02:06:00`, type `compact-inspecti-44`, result `passed`, inspector `INS-2007`) triggered by permit `3ac831c6-8fb5-11eb-924d-9cd76263cbd0` (issued `2023-02-01`, project type `gd_taxc_2211` / Primary Survey A, ownership `baseline-ownershi-73`, `19` units, `12.70` sq ft, status `pending`). The second row shows inspection event `101` (inspection ID `575199`, scheduled `2025-04-11T05:35:00`, completed `2025-08-25T09:23:00`, type `composite-inspecti-45`, result `failed`, inspector `INS-2013`) triggered by permit `ase` (issued `2024-07-12`, project type `4543` / Composite Corridor, ownership `pilot-ownershi-74`, `2` units, `14.40` sq ft, status `active`).

**View `inspection_event_property_parcel_view`**

```sql
CREATE VIEW inspection_event_property_parcel_view AS
SELECT a.id, a.inspection_id, a.scheduled_date, a.completion_date, b.id AS parcel_id, b.street_address AS parcel_street_address, b.municipality AS parcel_municipality
FROM inspection_events a JOIN property_parcels b ON a.property_parcel_id = b.id;
```

| id | inspection_id | scheduled_date | completion_date | parcel_id | parcel_street_address | parcel_municipality |
|---|---|---|---|---|---|---|
| 100 | BJanecke | 2024-11-27T22:18:00 | 2024-03-14T02:06:00 | 1 | composite-street-15 | extended-municipa-99 |
| 101 | 575199 | 2025-04-11T05:35:00 | 2025-08-25T09:23:00 | 2 | primary-street-16 | integrated-municipa-100 |
| 102 | state_uk_4 | 2022-09-22T12:52:00 | 2022-01-09T16:40:00 | 3 | adaptive-street-17 | seasonal-municipa-101 |
| 103 | 8350011 | 2023-02-06T19:09:00 | 2023-06-20T23:57:00 | 4 | distributed-street-18 | regional-municipa-102 |

The `inspection_event_property_parcel_view` joins `inspection_events` to `property_parcels` on the `id` / `property_parcel_id` relationship. This view answers: "On which property parcel was each inspection event conducted?" The first row links inspection event `100` (inspection ID `BJanecke`, type `compact-inspecti-44`, result `passed`, inspector `INS-2007`) to parcel `1` at `composite-street-15` (municipality `extended-municipa-99`, parcel ID `4447034`, zoning `adaptive-zoning-95`, land use `adaptive-land-65`). The second row links inspection event `101` (inspection ID `575199`, type `composite-inspecti-45`, result `failed`, inspector `INS-2013`) to parcel `2` at `primary-street-16` (municipality `integrated-municipa-100`, parcel ID `325464`, zoning `distributed-zoning-96`, land use `distributed-land-66`).

**View `inspection_event_project_segment_view`**

```sql
CREATE VIEW inspection_event_project_segment_view AS
SELECT a.id, a.inspection_id, a.scheduled_date, a.completion_date, b.project_segment_id AS segment_project_segment_id, b.segment_code AS segment_segment_code, b.segment_description AS segment_segment_description
FROM inspection_events a JOIN project_segments b ON a.project_segment_id = b.project_segment_id;
```

| id | inspection_id | scheduled_date | completion_date | segment_project_segment_id | segment_segment_code | segment_segment_description |
|---|---|---|---|---|---|---|
| 100 | BJanecke | 2024-11-27T22:18:00 | 2024-03-14T02:06:00 | 1 | 3990169 | Baseline Corridor D |
| 101 | 575199 | 2025-04-11T05:35:00 | 2025-08-25T09:23:00 | 2 | 9085246 | Distributed Series |
| 102 | state_uk_4 | 2022-09-22T12:52:00 | 2022-01-09T16:40:00 | 3 | 5006449 | Adaptive Assessment |
| 103 | 8350011 | 2023-02-06T19:09:00 | 2023-06-20T23:57:00 | 4 | L137 | Primary Survey A |

The `inspection_event_project_segment_view` joins `inspection_events` to `project_segments` on the `id` / `project_segment_id` relationship. This view answers: "Which project segment was inspected in each inspection event?" The first row links inspection event `100` (inspection ID `BJanecke`, type `compact-inspecti-44`, result `passed`, inspector `INS-2007`) to project segment `1` (segment code `3990169`, description `Baseline Corridor D`, valuation `442.51`, fee `38.08`, segment count `7`). The second row links inspection event `101` (inspection ID `575199`, type `composite-inspecti-45`, result `failed`, inspector `INS-2013`) to project segment `2` (segment code `9085246`, description `Distributed Series`, valuation `33.06`, fee `18.47`, segment count `8`).

**View `project_segment_building_permit_view`**

```sql
CREATE VIEW project_segment_building_permit_view AS
SELECT a.project_segment_id, a.segment_code, a.segment_description, a.valuation_amount, b.permit_id AS permit_permit_id, b.issue_date AS permit_issue_date, b.expiry_date AS permit_expiry_date
FROM project_segments a JOIN building_permits b ON a.permit_id = b.permit_id;
```

| project_segment_id | segment_code | segment_description | valuation_amount | permit_permit_id | permit_issue_date | permit_expiry_date |
|---|---|---|---|---|---|---|
| 1 | 3990169 | Baseline Corridor D | 442.51 | 3ac831c6-8fb5-11eb-924d-9cd76263cbd0 | 2023-02-01 | 2023-10-24 |
| 2 | 9085246 | Distributed Series | 33.06 | ase | 2024-07-12 | 2024-03-08 |
| 3 | 5006449 | Adaptive Assessment | 3,079 | 6969410 | 2025-12-23 | 2025-08-19 |
| 4 | L137 | Primary Survey A | 45,650 | 727069 | 2022-05-07 | 2022-01-03 |

The `project_segment_building_permit_view` joins `project_segments` to `building_permits` on the `project_segment_id` / `permit_id` relationship. This view answers: "Which building permit does each project segment belong to?" The first row shows project segment `1` (segment code `3990169`, description `Baseline Corridor D`, valuation `442.51`, fee `38.08`, segment count `7`) belonging to permit `3ac831c6-8fb5-11eb-924d-9cd76263cbd0` (issued `2023-02-01`, project type `gd_taxc_2211` / Primary Survey A, ownership `baseline-ownershi-73`, `19` units, `12.70` sq ft, status `pending`). The second row shows project segment `2` (segment code `9085246`, description `Distributed Series`, valuation `33.06`, fee `18.47`, segment count `8`) belonging to permit `ase` (issued `2024-07-12`, project type `4543` / Composite Corridor, ownership `pilot-ownershi-74`, `2` units, `14.40` sq ft, status `active`).

**View `project_segment_inspection_event_view`**

```sql
CREATE VIEW project_segment_inspection_event_view AS
SELECT a.project_segment_id, a.segment_code, a.segment_description, a.valuation_amount, b.id AS event_id, b.inspection_id AS event_inspection_id, b.scheduled_date AS event_scheduled_date
FROM project_segments a JOIN inspection_events b ON a.inspection_event_id = b.id;
```

| project_segment_id | segment_code | segment_description | valuation_amount | event_id | event_inspection_id | event_scheduled_date |
|---|---|---|---|---|---|---|
| 1 | 3990169 | Baseline Corridor D | 442.51 | 100 | BJanecke | 2024-11-27T22:18:00 |
| 2 | 9085246 | Distributed Series | 33.06 | 101 | 575199 | 2025-04-11T05:35:00 |
| 3 | 5006449 | Adaptive Assessment | 3,079 | 102 | state_uk_4 | 2022-09-22T12:52:00 |
| 4 | L137 | Primary Survey A | 45,650 | 103 | 8350011 | 2023-02-06T19:09:00 |

The `project_segment_inspection_event_view` joins `project_segments` to `inspection_events` on the `project_segment_id` / `id` relationship. This view answers: "Which inspection event validated each project segment?" The first row links project segment `1` (segment code `3990169`, description `Baseline Corridor D`, valuation `442.51`, fee `38.08`, segment count `7`) to inspection event `100` (inspection ID `BJanecke`, scheduled `2024-11-27T22:18:00`, completed `2024-03-14T02:06:00`, type `compact-inspecti-44`, result `passed`, inspector `INS-2007`). The second row links project segment `2` (segment code `9085246`, description `Distributed Series`, valuation `33.06`, fee `18.47`, segment count `8`) to inspection event `101` (inspection ID `575199`, scheduled `2025-04-11T05:35:00`, completed `2025-08-25T09:23:00`, type `composite-inspecti-45`, result `failed`, inspector `INS-2013`).

**View `certificate_of_occupancy_property_parcel_view`**

```sql
CREATE VIEW certificate_of_occupancy_property_parcel_view AS
SELECT a.certificate_of_occupancy_id, a.c_of_o_id, a.issue_date, a.reason, b.id AS parcel_id, b.street_address AS parcel_street_address, b.municipality AS parcel_municipality
FROM certificate_of_occupancies a JOIN property_parcels b ON a.property_parcel_id = b.id;
```

| certificate_of_occupancy_id | c_of_o_id | issue_date | reason | parcel_id | parcel_street_address | parcel_municipality |
|---|---|---|---|---|---|---|
| 100 | 209217 | 2023-02-01 | new_tenant | 1 | composite-street-15 | extended-municipa-99 |
| 101 | 10039 | 2024-07-12 | management_change | 2 | primary-street-16 | integrated-municipa-100 |
| 102 | lu_tax_code_template_b_VB-IC-6 | 2025-12-23 | name_change | 3 | adaptive-street-17 | seasonal-municipa-101 |
| 103 | 10782165 | 2022-05-07 | ownership_change | 4 | distributed-street-18 | regional-municipa-102 |

The `certificate_of_occupancy_property_parcel_view` joins `certificate_of_occupancies` to `property_parcels` on the `certificate_of_occupancy_id` / `id` relationship. This view answers: "Which property parcel received each certificate of occupancy?" The first row links certificate `100` (C of O ID `209217`, issued `2023-02-01`, reason `new_tenant`, building sq ft `15.70`, status `approved`) to parcel `1` at `composite-street-15` (municipality `extended-municipa-99`, parcel ID `4447034`, zoning `adaptive-zoning-95`, land use `adaptive-land-65`). The second row links certificate `101` (C of O ID `10039`, issued `2024-07-12`, reason `management_change`, building sq ft `17.40`, status `conditional`) to parcel `2` at `primary-street-16` (municipality `integrated-municipa-100`, parcel ID `325464`, zoning `distributed-zoning-96`, land use `distributed-land-66`).

**View `certificate_of_occupancy_building_permit_view`**

```sql
CREATE VIEW certificate_of_occupancy_building_permit_view AS
SELECT a.certificate_of_occupancy_id, a.c_of_o_id, a.issue_date, a.reason, b.permit_id AS permit_permit_id, b.issue_date AS permit_issue_date, b.expiry_date AS permit_expiry_date
FROM certificate_of_occupancies a JOIN building_permits b ON a.permit_id = b.permit_id;
```

| certificate_of_occupancy_id | c_of_o_id | issue_date | reason | permit_permit_id | permit_issue_date | permit_expiry_date |
|---|---|---|---|---|---|---|
| 100 | 209217 | 2023-02-01 | new_tenant | 3ac831c6-8fb5-11eb-924d-9cd76263cbd0 | 2023-02-01 | 2023-10-24 |
| 101 | 10039 | 2024-07-12 | management_change | ase | 2024-07-12 | 2024-03-08 |
| 102 | lu_tax_code_template_b_VB-IC-6 | 2025-12-23 | name_change | 6969410 | 2025-12-23 | 2025-08-19 |
| 103 | 10782165 | 2022-05-07 | ownership_change | 727069 | 2022-05-07 | 2022-01-03 |

The `certificate_of_occupancy_building_permit_view` joins `certificate_of_occupancies` to `building_permits` on the `certificate_of_occupancy_id` / `permit_id` relationship. This view answers: "Which building permit led to each certificate of occupancy?" The first row links certificate `100` (C of O ID `209217`, issued `2023-02-01`, reason `new_tenant`, building sq ft `15.70`, status `approved`) to permit `3ac831c6-8fb5-11eb-924d-9cd76263cbd0` (issued `2023-02-01`, project type `gd_taxc_2211` / Primary Survey A, ownership `baseline-ownershi-73`, `19` units, `12.70` sq ft, status `pending`). The second row links certificate `101` (C of O ID `10039`, issued `2024-07-12`, reason `management_change`, building sq ft `17.40`, status `conditional`) to permit `ase` (issued `2024-07-12`, project type `4543` / Composite Corridor, ownership `pilot-ownershi-74`, `2` units, `14.40` sq ft, status `active`).

**View `certificate_of_occupancy_building_inspections_division_view`**

```sql
CREATE VIEW certificate_of_occupancy_building_inspections_division_view AS
SELECT a.certificate_of_occupancy_id, a.c_of_o_id, a.issue_date, a.reason, b.id AS division_id, b.division_code AS division_division_code, b.jurisdiction_name AS division_jurisdiction_name
FROM certificate_of_occupancies a JOIN building_inspections_divisions b ON a.building_inspections_division_id = b.id;
```

| certificate_of_occupancy_id | c_of_o_id | issue_date | reason | division_id | division_division_code | division_jurisdiction_name |
|---|---|---|---|---|---|---|
| 100 | 209217 | 2023-02-01 | new_tenant | 100 | 103191 | Pilot Cluster |
| 101 | 10039 | 2024-07-12 | management_change | 101 | 113 | Baseline Review |
| 102 | lu_tax_code_template_b_VB-IC-6 | 2025-12-23 | name_change | 102 | 1250220 | Distributed Initiative A |
| 103 | 10782165 | 2022-05-07 | ownership_change | 103 | 5f923cfa-8fcd-11eb-924d-9cd76263cbd0 | Adaptive Model |

The `certificate_of_occupancy_building_inspections_division_view` joins `certificate_of_occupancies` to `building_inspections_divisions` on the `certificate_of_occupancy_id` / `id` relationship. This view answers: "Which inspections division is responsible for each certificate of occupancy?" The first row links certificate `100` (C of O ID `209217`, issued `2023-02-01`, reason `new_tenant`, building sq ft `15.70`, status `approved`) to division `100` (code `103191`, jurisdiction `Pilot Cluster`, reporting period `2023-02-20` to `2024-03-23`, fees collected `289.59`, performance target `distributed-performa-36`). The second row links certificate `101` (C of O ID `10039`, issued `2024-07-12`, reason `management_change`, building sq ft `17.40`, status `conditional`) to division `101` (code `113`, jurisdiction `Baseline Review`, reporting period `2024-07-04` to `2025-08-07`, fees collected `6,025`, performance target `baseline-performa-37`).

**View `building_inspections_division_building_permit_view`**

```sql
CREATE VIEW building_inspections_division_building_permit_view AS
SELECT a.id, a.division_code, a.jurisdiction_name, a.reporting_period_start, b.permit_id AS permit_permit_id, b.issue_date AS permit_issue_date, b.expiry_date AS permit_expiry_date
FROM building_inspections_divisions a JOIN building_permits b ON a.permit_id = b.permit_id;
```

| id | division_code | jurisdiction_name | reporting_period_start | permit_permit_id | permit_issue_date | permit_expiry_date |
|---|---|---|---|---|---|---|
| 100 | 103191 | Pilot Cluster | 2023-02-20 | 3ac831c6-8fb5-11eb-924d-9cd76263cbd0 | 2023-02-01 | 2023-10-24 |
| 101 | 113 | Baseline Review | 2024-07-04 | ase | 2024-07-12 | 2024-03-08 |
| 102 | 1250220 | Distributed Initiative A | 2025-12-15 | 6969410 | 2025-12-23 | 2025-08-19 |
| 103 | 5f923cfa-8fcd-11eb-924d-9cd76263cbd0 | Adaptive Model | 2022-05-26 | 727069 | 2022-05-07 | 2022-01-03 |

The `building_inspections_division_building_permit_view` joins `building_inspections_divisions` to `building_permits` on the `id` / `permit_id` relationship. This view answers: "Which building permits are overseen by each inspections division?" The first row shows division `100` (code `103191`, jurisdiction `Pilot Cluster`, reporting period `2023-02-20` to `2024-03-23`, fees collected `289.59`, performance target `distributed-performa-36`) overseeing permit `3ac831c6-8fb5-11eb-924d-9cd76263cbd0` (issued `2023-02-01`, project type `gd_taxc_2211` / Primary Survey A, ownership `baseline-ownershi-73`, `19` units, `12.70` sq ft, status `pending`). The second row shows division `101` (code `113`, jurisdiction `Baseline Review`, reporting period `2024-07-04` to `2025-08-07`, fees collected `6,025`, performance target `baseline-performa-37`) overseeing permit `ase` (issued `2024-07-12`, project type `4543` / Composite Corridor, ownership `pilot-ownershi-74`, `2` units, `14.40` sq ft, status `active`).

**View `building_inspections_division_certificate_of_occupancy_view`**

```sql
CREATE VIEW building_inspections_division_certificate_of_occupancy_view AS
SELECT a.id, a.division_code, a.jurisdiction_name, a.reporting_period_start, b.certificate_of_occupancy_id AS occupancy_certificate_of_occupancy_id, b.c_of_o_id AS occupancy_c_of_o_id, b.issue_date AS occupancy_issue_date
FROM building_inspections_divisions a JOIN certificate_of_occupancies b ON a.certificate_of_occupancy_id = b.certificate_of_occupancy_id;
```

| id | division_code | jurisdiction_name | reporting_period_start | occupancy_certificate_of_occupancy_id | occupancy_c_of_o_id | occupancy_issue_date |
|---|---|---|---|---|---|---|
| 100 | 103191 | Pilot Cluster | 2023-02-20 | 100 | 209217 | 2023-02-01 |
| 101 | 113 | Baseline Review | 2024-07-04 | 101 | 10039 | 2024-07-12 |
| 102 | 1250220 | Distributed Initiative A | 2025-12-15 | 102 | lu_tax_code_template_b_VB-IC-6 | 2025-12-23 |
| 103 | 5f923cfa-8fcd-11eb-924d-9cd76263cbd0 | Adaptive Model | 2022-05-26 | 103 | 10782165 | 2022-05-07 |

The `building_inspections_division_certificate_of_occupancy_view` joins `building_inspections_divisions` to `certificate_of_occupancies` on the `id` / `certificate_of_occupancy_id` relationship. This view answers: "Which certificates of occupancy are issued under each inspections division?" The first row links division `100` (code `103191`, jurisdiction `Pilot Cluster`, reporting period `2023-02-20` to `2024-03-23`, fees collected `289.59`, performance target `distributed-performa-36`) to certificate `100` (C of O ID `209217`, issued `2023-02-01`, reason `new_tenant`, building sq ft `15.70`, status `approved`). The second row links division `101` (code `113`, jurisdiction `Baseline Review`, reporting period `2024-07-04` to `2025-08-07`, fees collected `6,025`, performance target `baseline-performa-37`) to certificate `101` (C of O ID `10039`, issued `2024-07-12`, reason `management_change`, building sq ft `17.40`, status `conditional`).

**View `building_inspections_division_inspection_event_view`**

```sql
CREATE VIEW building_inspections_division_inspection_event_view AS
SELECT a.id, a.division_code, a.jurisdiction_name, a.reporting_period_start, b.id AS event_id, b.inspection_id AS event_inspection_id, b.scheduled_date AS event_scheduled_date
FROM building_inspections_divisions a JOIN inspection_events b ON a.inspection_event_id = b.id;
```

| id | division_code | jurisdiction_name | reporting_period_start | event_id | event_inspection_id | event_scheduled_date |
|---|---|---|---|---|---|---|
| 100 | 103191 | Pilot Cluster | 2023-02-20 | 100 | BJanecke | 2024-11-27T22:18:00 |
| 101 | 113 | Baseline Review | 2024-07-04 | 101 | 575199 | 2025-04-11T05:35:00 |
| 102 | 1250220 | Distributed Initiative A | 2025-12-15 | 102 | state_uk_4 | 2022-09-22T12:52:00 |
| 103 | 5f923cfa-8fcd-11eb-924d-9cd76263cbd0 | Adaptive Model | 2022-05-26 | 103 | 8350011 | 2023-02-06T19:09:00 |

The `building_inspections_division_inspection_event_view` joins `building_inspections_divisions` to `inspection_events` on the `id` / `inspection_event_id` relationship. This view answers: "Which inspection events are overseen by each inspections division?" The first row links division `100` (code `103191`, jurisdiction `Pilot Cluster`, reporting period `2023-02-20` to `2024-03-23`, fees collected `289.59`, performance target `distributed-performa-36`) to inspection event `100` (inspection ID `BJanecke`, scheduled `2024-11-27T22:18:00`, completed `2024-03-14T02:06:00`, type `compact-inspecti-44`, result `passed`, inspector `INS-2007`). The second row links division `101` (code `113`, jurisdiction `Baseline Review`, reporting period `2024-07-04` to `2025-08-07`, fees collected `6,025`, performance target `baseline-performa-37`) to inspection event `101` (inspection ID `575199`, scheduled `2025-04-11T05:35:00`, completed `2025-08-25T09:23:00`, type `composite-inspecti-45`, result `failed`, inspector `INS-2013`).

The materialised views collectively provide a comprehensive set of analytical lenses on the building-permit domain. Each view performs a single join between two base tables, reconstructing a domain fact from the normalised schema. The views are symmetric in many cases: `building_permit_property_parcel_view` and `property_parcel_building_permit_view` present the same relationship from opposite directions, as do `building_permit_inspection_event_detail_view` and `inspection_event_building_permit_view`. This symmetry supports both permit-centric and entity-centric queries without requiring the application layer to manage join direction. The junction table `permits_events` provides an additional path for permit-inspection associations that may not be captured by the direct foreign-key columns, ensuring that the schema can accommodate complex many-to-many relationships that arise in real-world regulatory workflows.

The schema design reflects a clear separation of concerns: property identification (`property_parcels`), regulatory authorisation (`building_permits`), physical oversight (`building_inspections_divisions`), inspection execution (`inspection_events`), project decomposition (`project_segments`), and final certification (`certificate_of_occupancies`). The `permits_events` junction table adds flexibility where the one-to-one or one-to-many foreign-key relationships are insufficient. Every view name encodes its join direction, making it straightforward for analysts to identify the correct view for a given analytical question. The use of UUIDs for permit identifiers and integers for surrogate keys in other tables reflects a pragmatic approach to key management, where the permit—being the central entity—uses a globally unique identifier while other entities use simpler sequential identifiers. The coded classification columns (project types, ownership types, zoning districts, land use categories, inspection types, occupancy statuses, performance targets) suggest a controlled vocabulary that can be expanded through lookup tables or code-value dictionaries, though the current schema embeds these codes directly in the base tables for simplicity.