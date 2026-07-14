## The Building Permit Lifecycle

Municipal building departments manage a continuous flow of authorization, inspection, and occupancy documentation across property parcels and project segments. Each construction or renovation effort begins with a building permit, which anchors a chain of inspections, financial assessments, and regulatory divisions. The records in this system trace those efforts from initial issuance through final occupancy certification, capturing the temporal, financial, and jurisdictional dimensions of the work. A permit such as `3ac831c6-8fb5-11eb-924d-9cd76263cbd0`, issued on 2023-02-01 and set to expire on 2023-10-24, represents a Primary Survey A project under baseline ownership with nineteen total units and a contracted footprint of 12.70 square feet. Its counterpart, permit `727069`, carries a Legacy Assessment D classification under integrated ownership with zero units and a revoked status, illustrating how the system accommodates projects at every stage of their lifecycle.

**Table `building_permits`**

| permit_id | issue_date | expiry_date | project_type_code | project_type_description | ownership_type | total_units | contracted_square_feet | status | property_parcel_id | building_inspections_division_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 3ac831c6-8fb5-11eb-924d-9cd76263cbd0 | 2023-02-01 | 2023-10-24 | gd_taxc_2211 | Primary Survey A | baseline-ownershi-73 | 19 | 12.70 | pending | 1 | 100 |
| ase | 2024-07-12 | 2024-03-08 | 4543 | Composite Corridor | pilot-ownershi-74 | 2 | 14.40 | active | 2 | 101 |
| 6969410 | 2025-12-23 | 2025-08-19 | 103167 | Compact Series | extended-ownershi-75 | 57 | 16.10 | completed | 3 | 102 |
| 727069 | 2022-05-07 | 2022-01-03 | 10966232 | Legacy Assessment D | integrated-ownershi-76 | 0 | 17.80 | revoked | 4 | 103 |

Every permit is tied to a specific property parcel and a building inspections division, establishing the geographic and administrative boundaries of the work. The property parcel `1` at composite-street-15 falls within the extended-municipa-99 jurisdiction and carries the parcel identifier 4447034 under an adaptive-zoning-95 district with adaptive-land-65 land use. The parcel record was created on 2025-01-01 and last updated on 2025-01-02, reflecting the system's tracking of property metadata over time. Similarly, parcel `4` at distributed-street-18 sits in the regional-municipa-102 municipality with a pilot-zoning-98 designation and pilot-land-68 land use category, linked to the revoked permit `727069`.

**Table `property_parcels`**

| id | street_address | municipality | parcel_id | zoning_district | land_use_category | permit_id | inspection_event_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|
| 1 | composite-street-15 | extended-municipa-99 | 4447034 | adaptive-zoning-95 | adaptive-land-65 | 3ac831c6-8fb5-11eb-924d-9cd76263cbd0 | 100 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | primary-street-16 | integrated-municipa-100 | 325464 | distributed-zoning-96 | distributed-land-66 | ase | 101 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | adaptive-street-17 | seasonal-municipa-101 | 3990187 | baseline-zoning-97 | baseline-land-67 | 6969410 | 102 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | distributed-street-18 | regional-municipa-102 | 110 | pilot-zoning-98 | pilot-land-68 | 727069 | 103 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Inspections form the operational core of the permit lifecycle. An inspection event such as `100` (inspection identifier BJanecke) was scheduled for 2024-11-27 at 22:18 and completed on 2024-03-14 at 02:06, falling under the compact-inspecti-44 type with a passed result. The inspector carried badge number INS-2007, and the inspection was not completed within the 24-hour window. Event `101` (identifier 575199) was scheduled for 2025-04-11 but completed on 2025-08-25 under the composite-inspecti-45 type; it failed its review yet was marked as completed within 24 hours, with inspector INS-2013 on record. Event `103` (identifier 8350011) carries a re-inspection_required status, indicating that the adaptive-inspecti-47 review did not achieve final clearance on the first attempt.

**Table `inspection_events`**

| id | inspection_id | scheduled_date | completion_date | inspection_type | result_status | completed_within24_hours | inspector_badge_number | permit_id | property_parcel_id | project_segment_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 100 | BJanecke | 2024-11-27T22:18:00 | 2024-03-14T02:06:00 | compact-inspecti-44 | passed | false | INS-2007 | 3ac831c6-8fb5-11eb-924d-9cd76263cbd0 | 1 | 1 |
| 101 | 575199 | 2025-04-11T05:35:00 | 2025-08-25T09:23:00 | composite-inspecti-45 | failed | true | INS-2013 | ase | 2 | 2 |
| 102 | state_uk_4 | 2022-09-22T12:52:00 | 2022-01-09T16:40:00 | primary-inspecti-46 | pending | false | INS-2019 | 6969410 | 3 | 3 |
| 103 | 8350011 | 2023-02-06T19:09:00 | 2023-06-20T23:57:00 | adaptive-inspecti-47 | re-inspection_required | true | INS-2025 | 727069 | 4 | 4 |

Project segments break the overall permit scope into discrete, billable work packages. Segment `1` (code 3990169, Baseline Corridor D) carries a valuation of 442.51 and a fee of 38.08 across seven sub-segments, and is associated with permit `3ac831c6-8fb5-11eb-924d-9cd76263cbd0` and inspection event `100`. Segment `4` (code L137, Primary Survey A) stands out with a valuation of 45,650 and a fee of 26.25 across only two sub-segments, linked to the revoked permit `727069` and inspection event `103`. The valuation-to-fee ratio varies significantly across segments, reflecting differing scopes and risk profiles.

**Table `project_segments`**

| project_segment_id | segment_code | segment_description | valuation_amount | fee_amount | segment_count | permit_id | inspection_event_id |
|---|---|---|---|---|---|---|---|
| 1 | 3990169 | Baseline Corridor D | 442.51 | 38.08 | 7 | 3ac831c6-8fb5-11eb-924d-9cd76263cbd0 | 100 |
| 2 | 9085246 | Distributed Series | 33.06 | 18.47 | 8 | ase | 101 |
| 3 | 5006449 | Adaptive Assessment | 3,079 | 38.08 | 7 | 6969410 | 102 |
| 4 | L137 | Primary Survey A | 45,650 | 26.25 | 2 | 727069 | 103 |

Certificates of occupancy (COs) represent the terminal authorization that permits a property to be occupied or used for its intended purpose. Certificate `100` (c_of_o_id 209217) was issued on 2023-02-01 for a new_tenant reason, covering 15.70 building square feet with an approved occupancy status. Certificate `102` (c_of_o_id lu_tax_code_template_b_VB-IC-6) was issued on 2025-12-23 for a name_change reason, covering 19.10 square feet but carries a revoked occupancy status, signaling that the authorization was later withdrawn. Certificate `101` (c_of_o_id 10039) carries a conditional status for a management_change reason, illustrating the intermediate states between full approval and revocation.

**Table `certificate_of_occupancies`**

| certificate_of_occupancy_id | c_of_o_id | issue_date | reason | building_square_footage | occupancy_status | property_parcel_id | permit_id | building_inspections_division_id |
|---|---|---|---|---|---|---|---|---|
| 100 | 209217 | 2023-02-01 | new_tenant | 15.70 | approved | 1 | 3ac831c6-8fb5-11eb-924d-9cd76263cbd0 | 100 |
| 101 | 10039 | 2024-07-12 | management_change | 17.40 | conditional | 2 | ase | 101 |
| 102 | lu_tax_code_template_b_VB-IC-6 | 2025-12-23 | name_change | 19.10 | revoked | 3 | 6969410 | 102 |
| 103 | 10782165 | 2022-05-07 | ownership_change | 20.80 | approved | 4 | 727069 | 103 |

Building inspections divisions define the administrative units responsible for oversight. Division `100` (code 103191, Pilot Cluster) covers a reporting period from 2023-02-20 to 2024-03-23, collected 289.59 in total permit fees, and targets the distributed-performa-36 performance benchmark. Division `103` (code 5f923cfa-8fcd-11eb-924d-9cd76263cbd0, Adaptive Model) spans 2022-05-26 to 2023-06-02, collected 76,784 in fees, and targets the extended-performa-39 benchmark. The wide range in fee collections—from 2.87 in division `102` to 76,784 in division `103`—reflects the diversity of jurisdictions and project scales under each division's purview.

**Table `building_inspections_divisions`**

| id | division_code | jurisdiction_name | reporting_period_start | reporting_period_end | total_permit_fees_collected | performance_target | permit_id | certificate_of_occupancy_id | inspection_event_id |
|---|---|---|---|---|---|---|---|---|---|
| 100 | 103191 | Pilot Cluster | 2023-02-20 | 2024-03-23 | 289.59 | distributed-performa-36 | 3ac831c6-8fb5-11eb-924d-9cd76263cbd0 | 100 | 100 |
| 101 | 113 | Baseline Review | 2024-07-04 | 2025-08-07 | 6,025 | baseline-performa-37 | ase | 101 | 101 |
| 102 | 1250220 | Distributed Initiative A | 2025-12-15 | 2022-01-18 | 2.87 | pilot-performa-38 | 6969410 | 102 | 102 |
| 103 | 5f923cfa-8fcd-11eb-924d-9cd76263cbd0 | Adaptive Model | 2022-05-26 | 2023-06-02 | 76,784 | extended-performa-39 | 727069 | 103 | 103 |

The permits_events table captures the temporal linkage between permit issuance and inspection scheduling, providing the chronological backbone that connects authorization to field verification.

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

### Cross-Referencing Permits and Property Parcels

The building_permit_property_parcel_view joins permits to their underlying land records, answering the question of which parcels are authorized for which types of construction. In this joined result, permit `3ac831c6-8fb5-11eb-924d-9cd76263cbd0` appears alongside parcel `1` at composite-street-15, revealing that a pending Primary Survey A project with 19 units is situated in an adaptive-zoning-95 district. The second row pairs permit `ase` (active, Composite Corridor, 2 units) with parcel `2` at primary-street-16 under distributed-zoning-96, showing how an active pilot-ownership project maps to its land classification.

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

The property_parcel_building_permit_view inverts this relationship, starting from the land and surfacing the permits that apply to it. Parcel `3` at adaptive-street-17 (parcel_id 3990187, seasonal-municipa-101) is linked to permit `6969410`, a completed Compact Series project with 57 units and extended ownership. This perspective is useful for parcel-level audits: a single property may carry multiple permits over time, and this view surfaces the full authorization history for any given parcel identifier.

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

### Permits and Inspections Divisions

The building_permit_building_inspections_division_view connects each permit to the division responsible for its oversight. Permit `3ac831c6-8fb5-11eb-924d-9cd76263cbd0` is assigned to division `100` (Pilot Cluster, code 103191), which collected 289.59 in fees during its reporting window. Permit `727069`, despite its revoked status, remains associated with division `103` (Adaptive Model), which collected the highest fees at 76,784. This linkage is critical for accountability: it identifies which administrative unit bears responsibility for each permit's lifecycle, from issuance through inspection to occupancy certification.

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

### Detailed Inspection Records

The building_permit_inspection_event_detail_view enriches inspection events with their associated permit metadata, producing a comprehensive record of what was inspected, by whom, and under what authorization. Inspection event `100` (BJanecke, compact-inspecti-44, passed) is linked to permit `3ac831c6-8fb5-11eb-924d-9cd76263cbd0`, which carries 19 units and a pending status. The inspector badge INS-2007 and the completion timestamp 2024-03-14T02:06:00 provide an auditable trail. Event `101` (575199, composite-inspecti-45, failed) connects to permit `ase` (active, 2 units), demonstrating that failed inspections are recorded alongside their permit context for follow-up action.

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

### Property Parcels and Their Permits

The property_parcel_inspection_event_view bridges land records to the inspections that occurred on them, answering which parcels have been subject to which inspection events. Parcel `1` at composite-street-15 is linked to inspection event `100` (BJanecke, passed, compact-inspecti-44), while parcel `4` at distributed-street-18 is linked to event `103` (8350011, re-inspection_required, adaptive-inspecti-47). This view supports regulatory audits by showing the inspection history for any given parcel, including the type of inspection, its result, and whether it was completed within the 24-hour target window.

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

### Inspection Events and Their Permits

The inspection_event_building_permit_view starts from the inspection and traces back to the permit that authorized the work. Event `102` (state_uk_4, primary-inspecti-46, pending result) is tied to permit `6969410` (Compact Series, completed status, 57 units), illustrating a scenario where an inspection remains pending even though the permit itself has reached a completed state. Event `103` (8350011, adaptive-inspecti-47, re-inspection_required) connects to permit `727069` (Legacy Assessment D, revoked), showing that inspections can carry forward even after a permit's status has changed.

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

### Inspection Events and Property Parcels

The inspection_event_property_parcel_view provides a direct mapping from inspection events to the parcels they cover. Event `100` (scheduled 2024-11-27, completed 2024-03-14) is associated with parcel `1` (composite-street-15, adaptive-zoning-95), while event `101` (scheduled 2025-04-11, completed 2025-08-25) maps to parcel `2` (primary-street-16, distributed-zoning-96). The temporal gap between scheduled and completion dates is visible: event `101` was scheduled in April but completed in August, a delay that may be relevant for compliance analysis.

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

### Inspection Events and Project Segments

The inspection_event_project_segment_view links inspections to the specific project segments they evaluate. Event `100` connects to segment `1` (3990169, Baseline Corridor D, valuation 442.51, fee 38.08), while event `103` connects to segment `4` (L137, Primary Survey A, valuation 45,650, fee 26.25). This view is essential for cost accountability: it shows which inspection events correspond to which financial segments, enabling reconciliation between inspection outcomes and fee collections.

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

### Project Segments and Their Permits

The project_segment_building_permit_view traces each project segment back to its parent permit. Segment `2` (9085246, Distributed Series, valuation 33.06, 8 sub-segments) is linked to permit `ase` (active, Composite Corridor, 2 units), while segment `3` (5006449, Adaptive Assessment, valuation 3,079, 7 sub-segments) connects to permit `6969410` (completed, Compact Series, 57 units). This relationship clarifies the hierarchical structure of construction projects: a single permit may contain multiple segments, each with its own valuation and fee schedule.

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

### Project Segments and Inspection Events

The project_segment_inspection_event_view connects project segments to the inspections that validate their completion. Segment `1` (Baseline Corridor D) is paired with inspection event `100` (BJanecke, passed), while segment `2` (Distributed Series) is paired with event `101` (575199, failed). The pairing of a failed inspection with its corresponding segment is particularly important for tracking remediation: segment `2` with its 33.06 valuation and 8 sub-segments requires re-inspection following the failed composite-inspecti-45 review.

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

### Certificates of Occupancy and Property Parcels

The certificate_of_occupancy_property_parcel_view links occupancy certificates to their underlying parcels. Certificate `100` (c_of_o_id 209217, new_tenant, approved) is associated with parcel `1` (composite-street-15, adaptive-zoning-95), while certificate `102` (c_of_o_id lu_tax_code_template_b_VB-IC-6, name_change, revoked) maps to parcel `3` (adaptive-street-17, baseline-zoning-97). This view supports occupancy audits by showing which parcels hold valid, conditional, or revoked certificates, and the reasons for any changes in status.

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

### Certificates of Occupancy and Permits

The certificate_of_occupancy_building_permit_view connects occupancy certificates to their originating permits. Certificate `101` (management_change, conditional, 17.40 sq ft) is linked to permit `ase` (active, Composite Corridor, 2 units), while certificate `103` (ownership_change, approved, 20.80 sq ft) connects to permit `727069` (revoked, Legacy Assessment D). The fact that an approved certificate can exist alongside a revoked permit highlights the independence of occupancy authorization from permit status: a property may be cleared for occupancy even if the underlying permit has been revoked for other reasons.

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

### Certificates of Occupancy and Inspections Divisions

The certificate_of_occupancy_building_inspections_division_view ties occupancy certificates to the divisions that issued them. Certificate `100` (approved, new_tenant) is associated with division `100` (Pilot Cluster, 103191, 289.59 in fees), while certificate `103` (approved, ownership_change) connects to division `103` (Adaptive Model, 5f923cfa..., 76,784 in fees). This linkage is critical for financial reconciliation: it shows which division's fee collections correspond to which occupancy authorizations, enabling department-level revenue tracking.

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

### Inspections Divisions and Their Permits

The building_inspections_division_building_permit_view maps each division to the permits under its jurisdiction. Division `101` (Baseline Review, code 113, baseline-performa-37 target, 6,025 in fees) is linked to permit `ase` (active, 2 units), while division `102` (Distributed Initiative A, code 1250220, pilot-performa-38 target, 2.87 in fees) connects to permit `6969410` (completed, 57 units). This view supports resource allocation decisions by showing the volume and value of permits under each division's oversight.

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

### Inspections Divisions and Certificates of Occupancy

The building_inspections_division_certificate_of_occupancy_view connects divisions to the occupancy certificates they have processed. Division `100` (Pilot Cluster) is linked to certificate `100` (approved, new_tenant, 15.70 sq ft), while division `102` (Distributed Initiative A) connects to certificate `102` (revoked, name_change, 19.10 sq ft). The presence of a revoked certificate under a division's record indicates that the division must manage the downstream consequences of occupancy withdrawal, including potential re-inspection requirements.

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

### Inspections Divisions and Inspection Events

The building_inspections_division_inspection_event_view ties inspection events to the divisions responsible for their oversight. Division `101` (Baseline Review) is associated with event `101` (575199, failed, composite-inspecti-45), while division `103` (Adaptive Model) connects to event `103` (8350011, re-inspection_required, adaptive-inspecti-47). This view is essential for performance monitoring: it shows which divisions are handling inspections with adverse outcomes, enabling targeted quality assurance and inspector training.

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

### Synthesis

The building permit ecosystem is a tightly coupled network of authorizations, inspections, financial assessments, and occupancy certifications. Each permit anchors a chain of records that span property parcels, project segments, inspection events, and administrative divisions. The views in this system provide multiple entry points into the data, allowing practitioners to trace relationships from any entity outward. A parcel-level query reveals the permits and inspections affecting a given property; a division-level query surfaces the permits, certificates, and inspections under its jurisdiction; a permit-level query connects all downstream records to the original authorization. The temporal dimensions—issue dates, expiry dates, scheduled and completion timestamps—provide the chronological framework that makes the entire system auditable. Together, these records form a comprehensive picture of municipal building oversight, from the initial permit application through the final certificate of occupancy.