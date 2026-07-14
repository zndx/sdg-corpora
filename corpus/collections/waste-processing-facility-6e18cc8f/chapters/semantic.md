## Ontology-Grounded Relational Modelling in Waste Processing

The waste processing domain captures the lifecycle of material throughput at treatment sites, the energy recovered from that processing, and the financial oversight that governs each operation. Six base tables encode the core ontology: `waste_processing_facilities` anchors the physical infrastructure, `waste_streams` describes the inbound material flows, `energy_outputs` records the energy recovered, `financial_reports` tracks fiscal accountability, `financial_staffs` models the personnel who prepare those reports, and `departments` groups staff into organisational units. Every table carries a surrogate primary key and at least one foreign key that ties it to another entity, forming a normalised schema where each domain fact is stored once and reconstructed through joins.

**Table `waste_processing_facilities`**

| waste_processing_facility_id | facility_id | facility_name | location | capacity_tons_per_day | operational_status | commissioning_date | waste_stream_id | energy_output_id |
|---|---|---|---|---|---|---|---|---|
| 1000 | 69447 | Integrated Protocol A | extended-location-99 | 1.70 | active | 2025-12-03 | 100 | 1 |
| 1001 | 1040 | Extended Programme | integrated-location-100 | 3.40 | inactive | 2022-05-14 | 101 | 2 |
| 1002 | 2986228 | Pilot Standard | seasonal-location-101 | 5.10 | under_maintenance | 2023-10-25 | 102 | 3 |
| 1003 | ChIJvSxSbfdv5kcRanVzI8RRu20 | Baseline Framework D | regional-location-102 | 6.80 | active | 2024-03-09 | 103 | 4 |

The `waste_processing_facilities` table is the central hub. Its surrogate key `waste_processing_facility_id` (values 1000 through 1003) uniquely identifies each site. The business identifier `facility_id` carries heterogeneous values — integer codes like `69447` and `1040`, a Google Place ID `ChIJvSxSbfdv5kcRanVzI8RRu20`, and a numeric `2986228` — reflecting integration with external registries. The `facility_name` column stores human-readable labels such as *Integrated Protocol A* and *Baseline Framework D*. The `location` column holds synthetic locality strings like `extended-location-99` and `regional-location-102`. Capacity is recorded as a decimal in `capacity_tons_per_day` (ranging from 1.70 to 6.80), `operational_status` is an enumerated string (`active`, `inactive`, `under_maintenance`), and `commissioning_date` stores the date the facility began operations. Two foreign keys, `waste_stream_id` and `energy_output_id`, link each facility to exactly one waste stream and one energy output record, enforcing a one-to-one cardinality from the facility's perspective.

**Table `waste_streams`**

| id | stream_id | waste_type | origin_jurisdiction | daily_volume_tons | collection_frequency | hauler_contract_id | waste_processing_facility_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|
| 100 | 2839512 | municipal_solid_waste | integrated-origin-94 | 10.20 | daily | 4277016 | 1000 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 101 | e7a5231e-8fc3-11eb-924d-9cd76263cbd0 | recyclables | seasonal-origin-95 | 13.40 | weekly | 1437584 | 1001 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 102 | 3e41f384-9bac-11eb-a8a2-19ed5c03f8d3 | refuse | regional-origin-96 | 16.60 | biweekly | 1437604 | 1002 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 103 | 1186092 | municipal_solid_waste | legacy-origin-97 | 19.80 | daily | 2618566 | 1003 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The `waste_streams` table models the inbound material. Its primary key `id` (100–103) is a surrogate, while `stream_id` carries the business identifier — a mix of integers (`2839512`, `1186092`) and UUIDs (`e7a5231e-8fc3-11eb-924d-9cd76263cbd0`). The `waste_type` column distinguishes categories such as `municipal_solid_waste`, `recyclables`, and `refuse`. The `origin_jurisdiction` column records the provenance of the waste with synthetic labels like `integrated-origin-94` and `seasonal-origin-95`. Daily throughput is captured in `daily_volume_tons` (10.20 to 19.80), `collection_frequency` is an enumerated string (`daily`, `weekly`, `biweekly`), and `hauler_contract_id` references the external hauler. The foreign key `waste_processing_facility_id` (values 1000–1003) points back to the receiving facility, establishing a one-to-many relationship: one facility processes many waste streams, but each stream is assigned to exactly one facility. Timestamps `created_at` and `updated_at` track the lifecycle of each stream record.

**Table `energy_outputs`**

| id | output_id | energy_type | capacity_megawatts | daily_generation_m_wh | grid_connection_status | measurement_date | waste_processing_facility_id | created_at |
|---|---|---|---|---|---|---|---|---|
| 1 | 3717613 | adaptive-energy-71 | 6.70 | 6.70 | connected | 2024-07-01T18:54:00 | 1000 | 2025-01-01 00:14:00 |
| 2 | 937738 | distributed-energy-72 | 8.40 | 9.40 | disconnected | 2025-12-12T01:11:00 | 1001 | 2025-02-06 03:14:00 |
| 3 | 974934 | baseline-energy-73 | 10.10 | 12.10 | maintenance | 2022-05-23T08:28:00 | 1002 | 2025-03-11 06:14:00 |
| 4 | 5f8f9bda-8fcd-11eb-924d-9cd76263cbd0 | pilot-energy-74 | 11.80 | 14.80 | connected | 2023-10-07T15:45:00 | 1003 | 2025-04-16 09:14:00 |

Energy recovery is modelled in `energy_outputs`. The surrogate primary key `id` (1–4) is paired with a business `output_id` that mixes integers (`3717613`, `937738`) and a UUID (`5f8f9bda-8fcd-11eb-924d-9cd76263cbd0`). The `energy_type` column stores synthetic type labels such as `adaptive-energy-71` and `pilot-energy-74`. Capacity in `capacity_megawatts` ranges from 6.70 to 11.80, and `daily_generation_m_wh` records actual output (6.70 to 14.80). The `grid_connection_status` column is enumerated (`connected`, `disconnected`, `maintenance`), and `measurement_date` captures the timestamp of the reading. The foreign key `waste_processing_facility_id` links each energy output to its source facility, mirroring the one-to-one cardinality seen in the facilities table.

**Table `financial_reports`**

| id | report_id | report_type | fiscal_year | reporting_period_start | reporting_period_end | status | prepared_by_staff_id | waste_processing_facility_id | financial_staff_id | created_at |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 1202-0008-S | budget | 17 | 2023-02-20 | 2024-03-23 | draft | template_impcode_pagata_10det50 | 1000 | 100 | 2025-01-01 00:14:00 |
| 2 | 8189500 | quarterly | 20 | 2024-07-04 | 2025-08-07 | review | template_impcode_pagata_4ind | 1001 | 101 | 2025-02-06 03:14:00 |
| 3 | L355 | annual | 23 | 2025-12-15 | 2022-01-18 | approved | state_et_9 | 1002 | 102 | 2025-03-11 06:14:00 |
| 4 | 5844272 | risk_assessment | 26 | 2022-05-26 | 2023-06-02 | archived | ChIJ20iLSYBt5kcRpX1RdgTAmNY | 1003 | 103 | 2025-04-16 09:14:00 |

Fiscal accountability is captured in `financial_reports`. The surrogate key `id` (1–4) is paired with a human-readable `report_id` such as `1202-0008-S` and `L355`. The `report_type` column distinguishes `budget`, `quarterly`, `annual`, and `risk_assessment` reports. `fiscal_year` stores integer years (17, 20, 23, 26), and `reporting_period_start` / `reporting_period_end` define the coverage window. The `status` column is enumerated (`draft`, `review`, `approved`, `archived`). Three foreign keys anchor this table: `prepared_by_staff_id` references a staff member (values like `template_impcode_pagata_10det50` and `ChIJ20iLSYBt5kcRpX1RdgTAmNY`), `waste_processing_facility_id` ties the report to a specific site, and `financial_staff_id` (100–103) links to the staff record. The `created_at` timestamp records when the report was generated.

**Table `financial_staffs`**

| id | staff_id | full_name | role | employment_status | hire_date | supervisor_staff_id | financial_report_id | financial_staff_id | department_id |
|---|---|---|---|---|---|---|---|---|---|
| 100 | 937735 | Theodore Mcgrath | accountant | full_time | 2023-06-01 | 3355774 | 1 | 100 | 2087755 |
| 101 | 3158139 | Account Name | financial_analyst | part_time | 2024-11-12 | template_ivacode_pagata_art15 | 2 | 101 | 790483 |
| 102 | 8189502 | Saipan International Airport | cfo | contract | 2025-04-23 | f208f470-8fcd-11eb-924d-9cd76263cbd0 | 3 | 102 | 505978 |
| 103 | 69438 | Norma Fisher | it_staff | full_time | 2022-09-07 | 4793470 | 4 | 103 | id_6 |

The `financial_staffs` table models personnel. Its surrogate primary key `id` (100–103) is paired with a business `staff_id` that mixes integers (`937735`, `69438`) and synthetic labels (`3158139`, `8189502`). The `full_name` column stores names such as *Theodore Mcgrath* and *Norma Fisher*, while `role` captures positions like `accountant`, `financial_analyst`, `cfo`, and `it_staff`. Employment status is enumerated (`full_time`, `part_time`, `contract`), and `hire_date` records the start date. The foreign key `supervisor_staff_id` creates a self-referencing hierarchy — supervisors are themselves staff members, with values ranging from integers (`3355774`, `4793470`) to UUIDs (`f208f470-8fcd-11eb-924d-9cd76263cbd0`). The `financial_report_id` links a staff member to a report they prepared, `financial_staff_id` (100–103) is a business identifier, and `department_id` (2087755, 790483, 505978, `id_6`) assigns the staff member to an organisational unit.

**Table `departments`**

| department_id | department_name | head_staff_id | budget_allocation | established_date | financial_staff_id | waste_processing_facility_id | financial_report_id |
|---|---|---|---|---|---|---|---|
| 2087755 | Baseline Framework D | 48753451 | 446.22 | 2024-03-27 | 100 | 1000 | 1 |
| 790483 | Distributed Protocol | 1152669 | 763.46 | 2025-08-11 | 101 | 1001 | 2 |
| 505978 | Adaptive Programme | 8350018 | 12.34 | 2022-01-22 | 102 | 1002 | 3 |
| id_6 | Primary Standard A | id_12 | 1,737 | 2023-06-06 | 103 | 1003 | 4 |

The `departments` table groups staff into units. Its surrogate primary key `department_id` (2087755, 790483, 505978, `id_6`) is paired with `department_name` labels such as *Baseline Framework D* and *Primary Standard A*. The `head_staff_id` column references the department head (integers like `48753451` and synthetic labels like `id_12`). `budget_allocation` stores decimal values (446.22 to 1,737), and `established_date` records the founding date. Three foreign keys tie the department to the wider ontology: `financial_staff_id` (100–103) links to a specific staff member, `waste_processing_facility_id` (1000–1003) associates the department with a facility, and `financial_report_id` (1–4) connects it to a report.

The base tables form a star-like topology with `waste_processing_facilities` at the centre. Facilities connect directly to waste streams and energy outputs via one-to-one foreign keys. Financial reports bridge the operational side (through `waste_processing_facility_id`) to the administrative side (through `prepared_by_staff_id` and `financial_staff_id`). Staff records form a recursive hierarchy through `supervisor_staff_id` and are grouped into departments. Departments, in turn, reference facilities, staff, and reports, creating a dense web of cross-entity relationships that views materialise into readable domain facts.

### Operational Views: Waste Streams and Energy Outputs

The view `v_waste_processing_facility_waste_stream` reconstructs the pairing of each facility with its assigned waste stream. It joins `waste_processing_facilities` on `waste_stream_id` to `waste_streams.id`, producing a denormalised row that combines facility metadata with stream characteristics. Reading the row for facility 1000 (*Integrated Protocol A*), the view reveals that it processes `municipal_solid_waste` from `integrated-origin-94` at a daily volume of 10.20 tons, collected daily under hauler contract `4277016`. The row for facility 1003 (*Baseline Framework D*) shows it handles `municipal_solid_waste` from `legacy-origin-97` at 19.80 tons per day. This view answers the operational question: *what material does each facility receive, and under what terms?*

**View `v_waste_processing_facility_waste_stream`**

```sql
CREATE VIEW v_waste_processing_facility_waste_stream AS
SELECT a.waste_processing_facility_id, a.facility_id, a.facility_name, a.location, b.id AS stream_id, b.stream_id AS stream_stream_id, b.waste_type AS stream_waste_type
FROM waste_processing_facilities a JOIN waste_streams b ON a.waste_stream_id = b.id;
```

| waste_processing_facility_id | facility_id | facility_name | location | stream_id | stream_stream_id | stream_waste_type |
|---|---|---|---|---|---|---|
| 1000 | 69447 | Integrated Protocol A | extended-location-99 | 100 | 2839512 | municipal_solid_waste |
| 1001 | 1040 | Extended Programme | integrated-location-100 | 101 | e7a5231e-8fc3-11eb-924d-9cd76263cbd0 | recyclables |
| 1002 | 2986228 | Pilot Standard | seasonal-location-101 | 102 | 3e41f384-9bac-11eb-a8a2-19ed5c03f8d3 | refuse |
| 1003 | ChIJvSxSbfdv5kcRanVzI8RRu20 | Baseline Framework D | regional-location-102 | 103 | 1186092 | municipal_solid_waste |

The complementary view `v_waste_stream_waste_processing_facility` inverts the join, starting from `waste_streams` and reaching the facility. It produces the same logical pairing but from the stream's perspective, answering: *which facility processes this waste stream?* The row for stream 100 (*municipal_solid_waste*) shows it is processed at facility 1000 (*Integrated Protocol A*) with a capacity of 1.70 tons per day — a useful sanity check, since the stream's daily volume of 10.20 tons exceeds the facility's stated capacity, flagging a potential data inconsistency.

**View `v_waste_stream_waste_processing_facility`**

```sql
CREATE VIEW v_waste_stream_waste_processing_facility AS
SELECT a.id, a.stream_id, a.waste_type, a.origin_jurisdiction, b.waste_processing_facility_id AS facility_waste_processing_facility_id, b.facility_id AS facility_facility_id, b.facility_name AS facility_facility_name
FROM waste_streams a JOIN waste_processing_facilities b ON a.waste_processing_facility_id = b.waste_processing_facility_id;
```

| id | stream_id | waste_type | origin_jurisdiction | facility_waste_processing_facility_id | facility_facility_id | facility_facility_name |
|---|---|---|---|---|---|---|
| 100 | 2839512 | municipal_solid_waste | integrated-origin-94 | 1000 | 69447 | Integrated Protocol A |
| 101 | e7a5231e-8fc3-11eb-924d-9cd76263cbd0 | recyclables | seasonal-origin-95 | 1001 | 1040 | Extended Programme |
| 102 | 3e41f384-9bac-11eb-a8a2-19ed5c03f8d3 | refuse | regional-origin-96 | 1002 | 2986228 | Pilot Standard |
| 103 | 1186092 | municipal_solid_waste | legacy-origin-97 | 1003 | ChIJvSxSbfdv5kcRanVzI8RRu20 | Baseline Framework D |

The view `v_waste_processing_facility_energy_output` joins `waste_processing_facilities` to `energy_outputs` on `energy_output_id`, pairing each facility with its energy recovery profile. The row for facility 1000 shows it produces `adaptive-energy-71` with a capacity of 6.70 megawatts and daily generation of 6.70 MWh, connected to the grid. The row for facility 1001 (*Extended Programme*) produces `distributed-energy-72` at 8.40 MW capacity but with 9.40 MWh daily generation — exceeding capacity, which may indicate peak output or a data entry anomaly — and the grid connection status is `disconnected`. This view answers: *what energy does each facility recover, and is it grid-connected?*

**View `v_waste_processing_facility_energy_output`**

```sql
CREATE VIEW v_waste_processing_facility_energy_output AS
SELECT a.waste_processing_facility_id, a.facility_id, a.facility_name, a.location, b.id AS output_id, b.output_id AS output_output_id, b.energy_type AS output_energy_type
FROM waste_processing_facilities a JOIN energy_outputs b ON a.energy_output_id = b.id;
```

| waste_processing_facility_id | facility_id | facility_name | location | output_id | output_output_id | output_energy_type |
|---|---|---|---|---|---|---|
| 1000 | 69447 | Integrated Protocol A | extended-location-99 | 1 | 3717613 | adaptive-energy-71 |
| 1001 | 1040 | Extended Programme | integrated-location-100 | 2 | 937738 | distributed-energy-72 |
| 1002 | 2986228 | Pilot Standard | seasonal-location-101 | 3 | 974934 | baseline-energy-73 |
| 1003 | ChIJvSxSbfdv5kcRanVzI8RRu20 | Baseline Framework D | regional-location-102 | 4 | 5f8f9bda-8fcd-11eb-924d-9cd76263cbd0 | pilot-energy-74 |

The inverse view `v_energy_output_waste_processing_facility` starts from `energy_outputs` and joins to the facility, answering: *which facility generates this energy output?* The row for output 4 (`pilot-energy-74`) shows it is generated at facility 1003 (*Baseline Framework D*), which is currently `active` and commissioned on 2024-03-09.

**View `v_energy_output_waste_processing_facility`**

```sql
CREATE VIEW v_energy_output_waste_processing_facility AS
SELECT a.id, a.output_id, a.energy_type, a.capacity_megawatts, b.waste_processing_facility_id AS facility_waste_processing_facility_id, b.facility_id AS facility_facility_id, b.facility_name AS facility_facility_name
FROM energy_outputs a JOIN waste_processing_facilities b ON a.waste_processing_facility_id = b.waste_processing_facility_id;
```

| id | output_id | energy_type | capacity_megawatts | facility_waste_processing_facility_id | facility_facility_id | facility_facility_name |
|---|---|---|---|---|---|---|
| 1 | 3717613 | adaptive-energy-71 | 6.70 | 1000 | 69447 | Integrated Protocol A |
| 2 | 937738 | distributed-energy-72 | 8.40 | 1001 | 1040 | Extended Programme |
| 3 | 974934 | baseline-energy-73 | 10.10 | 1002 | 2986228 | Pilot Standard |
| 4 | 5f8f9bda-8fcd-11eb-924d-9cd76263cbd0 | pilot-energy-74 | 11.80 | 1003 | ChIJvSxSbfdv5kcRanVzI8RRu20 | Baseline Framework D |

### Financial Views: Reports, Staff, and Departments

The view `v_financial_report_waste_processing_facility` joins `financial_reports` to `waste_processing_facilities`, linking fiscal documents to the operational sites they cover. The row for report `1202-0008-S` (a `budget` report for fiscal year 17, status `draft`) is associated with facility 1000 (*Integrated Protocol A*). The row for report `L355` (an `annual` report, status `approved`) covers facility 1002 (*Pilot Standard*). This view answers: *which facility does each financial report pertain to?*

**View `v_financial_report_waste_processing_facility`**

```sql
CREATE VIEW v_financial_report_waste_processing_facility AS
SELECT a.id, a.report_id, a.report_type, a.fiscal_year, b.waste_processing_facility_id AS facility_waste_processing_facility_id, b.facility_id AS facility_facility_id, b.facility_name AS facility_facility_name
FROM financial_reports a JOIN waste_processing_facilities b ON a.waste_processing_facility_id = b.waste_processing_facility_id;
```

| id | report_id | report_type | fiscal_year | facility_waste_processing_facility_id | facility_facility_id | facility_facility_name |
|---|---|---|---|---|---|---|
| 1 | 1202-0008-S | budget | 17 | 1000 | 69447 | Integrated Protocol A |
| 2 | 8189500 | quarterly | 20 | 1001 | 1040 | Extended Programme |
| 3 | L355 | annual | 23 | 1002 | 2986228 | Pilot Standard |
| 4 | 5844272 | risk_assessment | 26 | 1003 | ChIJvSxSbfdv5kcRanVzI8RRu20 | Baseline Framework D |

The view `v_financial_report_financial_staff` joins `financial_reports` to `financial_staffs`, revealing the personnel responsible for each report. The row for report `1202-0008-S` shows it was prepared by staff member 100 (*Theodore Mcgrath*, role `accountant`, employment status `full_time`). The row for report `8189500` (a `quarterly` report in `review` status) is linked to staff 101 (*Account Name*, role `financial_analyst`, `part_time`). This view answers: *who prepared each financial report?*

**View `v_financial_report_financial_staff`**

```sql
CREATE VIEW v_financial_report_financial_staff AS
SELECT a.id, a.report_id, a.report_type, a.fiscal_year, b.id AS staff_id, b.staff_id AS staff_staff_id, b.full_name AS staff_full_name
FROM financial_reports a JOIN financial_staffs b ON a.financial_staff_id = b.id;
```

| id | report_id | report_type | fiscal_year | staff_id | staff_staff_id | staff_full_name |
|---|---|---|---|---|---|---|
| 1 | 1202-0008-S | budget | 17 | 100 | 937735 | Theodore Mcgrath |
| 2 | 8189500 | quarterly | 20 | 101 | 3158139 | Account Name |
| 3 | L355 | annual | 23 | 102 | 8189502 | Saipan International Airport |
| 4 | 5844272 | risk_assessment | 26 | 103 | 69438 | Norma Fisher |

The view `v_financial_staff_financial_report` inverts the relationship, starting from `financial_staffs` and joining to `financial_reports`. It answers: *which report did each staff member prepare?* The row for staff 100 (*Theodore Mcgrath*) shows they prepared report `1202-0008-S`. The row for staff 102 (*Saipan International Airport*, role `cfo`, `contract` status) prepared report `L355`, an `annual` report with `approved` status.

**View `v_financial_staff_financial_report`**

```sql
CREATE VIEW v_financial_staff_financial_report AS
SELECT a.id, a.staff_id, a.full_name, a.role, b.id AS report_id, b.report_id AS report_report_id, b.report_type AS report_report_type
FROM financial_staffs a JOIN financial_reports b ON a.financial_report_id = b.id;
```

| id | staff_id | full_name | role | report_id | report_report_id | report_report_type |
|---|---|---|---|---|---|---|
| 100 | 937735 | Theodore Mcgrath | accountant | 1 | 1202-0008-S | budget |
| 101 | 3158139 | Account Name | financial_analyst | 2 | 8189500 | quarterly |
| 102 | 8189502 | Saipan International Airport | cfo | 3 | L355 | annual |
| 103 | 69438 | Norma Fisher | it_staff | 4 | 5844272 | risk_assessment |

The view `v_financial_staff_financial_staff` performs a self-join on `financial_staffs` through the `supervisor_staff_id` foreign key, reconstructing the supervisory hierarchy. The row for staff 100 (*Theodore Mcgrath*, `accountant`) shows their supervisor is staff with ID `3355774`. The row for staff 103 (*Norma Fisher*, `it_staff`) has supervisor `4793470`. This view answers: *who supervises each staff member?* The heterogeneous supervisor IDs — integers and UUIDs — reflect the same integration pattern seen in other tables, where business identifiers are not constrained to a single format.

**View `v_financial_staff_financial_staff`**

```sql
CREATE VIEW v_financial_staff_financial_staff AS
SELECT a.id, a.staff_id, a.full_name, a.role, b.id AS staff_id, b.staff_id AS staff_staff_id, b.full_name AS staff_full_name
FROM financial_staffs a JOIN financial_staffs b ON a.financial_staff_id = b.id;
```

| id | staff_id | full_name | role | staff_id | staff_staff_id | staff_full_name |
|---|---|---|---|---|---|---|
| 100 | 937735 | Theodore Mcgrath | accountant | 100 | 937735 | Theodore Mcgrath |
| 101 | 3158139 | Account Name | financial_analyst | 101 | 3158139 | Account Name |
| 102 | 8189502 | Saipan International Airport | cfo | 102 | 8189502 | Saipan International Airport |
| 103 | 69438 | Norma Fisher | it_staff | 103 | 69438 | Norma Fisher |

The view `v_financial_staff_department` joins `financial_staffs` to `departments`, revealing the organisational unit each staff member belongs to. The row for staff 100 (*Theodore Mcgrath*) shows they are in department 2087755 (*Baseline Framework D*), which has a budget allocation of 446.22 and was established on 2024-03-27. The row for staff 101 (*Account Name*) is in department 790483 (*Distributed Protocol*), with a budget of 763.46. This view answers: *which department does each staff member belong to?*

**View `v_financial_staff_department`**

```sql
CREATE VIEW v_financial_staff_department AS
SELECT a.id, a.staff_id, a.full_name, a.role, b.department_id AS department_department_id, b.department_name AS department_department_name, b.head_staff_id AS department_head_staff_id
FROM financial_staffs a JOIN departments b ON a.department_id = b.department_id;
```

| id | staff_id | full_name | role | department_department_id | department_department_name | department_head_staff_id |
|---|---|---|---|---|---|---|
| 100 | 937735 | Theodore Mcgrath | accountant | 2087755 | Baseline Framework D | 48753451 |
| 101 | 3158139 | Account Name | financial_analyst | 790483 | Distributed Protocol | 1152669 |
| 102 | 8189502 | Saipan International Airport | cfo | 505978 | Adaptive Programme | 8350018 |
| 103 | 69438 | Norma Fisher | it_staff | id_6 | Primary Standard A | id_12 |

The inverse view `v_department_financial_staff` starts from `departments` and joins to `financial_staffs`, answering: *which staff member is associated with each department?* The row for department 2087755 (*Baseline Framework D*) shows staff 100 (*Theodore Mcgrath*) is linked to it. The row for department `id_6` (*Primary Standard A*) is linked to staff 103 (*Norma Fisher*).

**View `v_department_financial_staff`**

```sql
CREATE VIEW v_department_financial_staff AS
SELECT a.department_id, a.department_name, a.head_staff_id, a.budget_allocation, b.id AS staff_id, b.staff_id AS staff_staff_id, b.full_name AS staff_full_name
FROM departments a JOIN financial_staffs b ON a.financial_staff_id = b.id;
```

| department_id | department_name | head_staff_id | budget_allocation | staff_id | staff_staff_id | staff_full_name |
|---|---|---|---|---|---|---|
| 2087755 | Baseline Framework D | 48753451 | 446.22 | 100 | 937735 | Theodore Mcgrath |
| 790483 | Distributed Protocol | 1152669 | 763.46 | 101 | 3158139 | Account Name |
| 505978 | Adaptive Programme | 8350018 | 12.34 | 102 | 8189502 | Saipan International Airport |
| id_6 | Primary Standard A | id_12 | 1,737 | 103 | 69438 | Norma Fisher |

The view `v_department_waste_processing_facility` joins `departments` to `waste_processing_facilities`, revealing the operational site each department supports. The row for department 2087755 (*Baseline Framework D*) shows it supports facility 1000 (*Integrated Protocol A*), which has a capacity of 1.70 tons per day and is `active`. The row for department 790483 (*Distributed Protocol*) supports facility 1001 (*Extended Programme*), which is `inactive` and was commissioned on 2022-05-14. This view answers: *which facility does each department oversee?*

**View `v_department_waste_processing_facility`**

```sql
CREATE VIEW v_department_waste_processing_facility AS
SELECT a.department_id, a.department_name, a.head_staff_id, a.budget_allocation, b.waste_processing_facility_id AS facility_waste_processing_facility_id, b.facility_id AS facility_facility_id, b.facility_name AS facility_facility_name
FROM departments a JOIN waste_processing_facilities b ON a.waste_processing_facility_id = b.waste_processing_facility_id;
```

| department_id | department_name | head_staff_id | budget_allocation | facility_waste_processing_facility_id | facility_facility_id | facility_facility_name |
|---|---|---|---|---|---|---|
| 2087755 | Baseline Framework D | 48753451 | 446.22 | 1000 | 69447 | Integrated Protocol A |
| 790483 | Distributed Protocol | 1152669 | 763.46 | 1001 | 1040 | Extended Programme |
| 505978 | Adaptive Programme | 8350018 | 12.34 | 1002 | 2986228 | Pilot Standard |
| id_6 | Primary Standard A | id_12 | 1,737 | 1003 | ChIJvSxSbfdv5kcRanVzI8RRu20 | Baseline Framework D |

The view `v_department_financial_report` joins `departments` to `financial_reports`, linking organisational units to the fiscal documents they produce or govern. The row for department 2087755 (*Baseline Framework D*) is linked to report `1202-0008-S` (a `budget` report, status `draft`). The row for department 790483 (*Distributed Protocol*) is linked to report `8189500` (a `quarterly` report, status `review`). The row for department `id_6` (*Primary Standard A*) is linked to report `5844272` (a `risk_assessment` report, status `archived`). This view answers: *which financial report is associated with each department?*

**View `v_department_financial_report`**

```sql
CREATE VIEW v_department_financial_report AS
SELECT a.department_id, a.department_name, a.head_staff_id, a.budget_allocation, b.id AS report_id, b.report_id AS report_report_id, b.report_type AS report_report_type
FROM departments a JOIN financial_reports b ON a.financial_report_id = b.id;
```

| department_id | department_name | head_staff_id | budget_allocation | report_id | report_report_id | report_report_type |
|---|---|---|---|---|---|---|
| 2087755 | Baseline Framework D | 48753451 | 446.22 | 1 | 1202-0008-S | budget |
| 790483 | Distributed Protocol | 1152669 | 763.46 | 2 | 8189500 | quarterly |
| 505978 | Adaptive Programme | 8350018 | 12.34 | 3 | L355 | annual |
| id_6 | Primary Standard A | id_12 | 1,737 | 4 | 5844272 | risk_assessment |

### Synthesis

The schema models the waste processing domain as a network of six interrelated tables, each encoding a distinct ontological category — infrastructure, material flow, energy recovery, fiscal documentation, personnel, and organisation. Foreign keys enforce referential integrity: facilities point to their waste streams and energy outputs; waste streams and energy outputs point back to their facility; financial reports point to facilities, staff, and departments; staff point to supervisors, reports, and departments; and departments point to staff, facilities, and reports. The surrogate primary keys (`waste_processing_facility_id`, `id` in each table, `department_id`) provide stable, system-managed identifiers, while the business-level columns (`facility_id`, `stream_id`, `report_id`, `staff_id`) carry the human-meaningful values that integrate with external systems.

The twelve views materialise the normalised schema into domain-specific perspectives. Operational views (`v_waste_processing_facility_waste_stream`, `v_waste_processing_facility_energy_output` and their inverses) answer questions about what material and energy each facility handles. Financial views (`v_financial_report_waste_processing_facility`, `v_financial_report_financial_staff`, `v_financial_staff_financial_report`) answer questions about fiscal accountability — which report covers which facility, and which staff member prepared it. Administrative views (`v_financial_staff_financial_staff`, `v_financial_staff_department`, `v_department_financial_staff`, `v_department_waste_processing_facility`, `v_department_financial_report`) answer questions about organisational structure — who supervises whom, which department employs whom, and which department oversees which facility and report. Each view is a single join that reconstructs a domain fact from the normalised tables, providing a read-optimised lens on the underlying data without duplicating storage.