## Operational Records in Waste-to-Energy Facility Management

Municipal waste processing and energy recovery operations generate a continuous stream of operational, financial, and organizational records. A single facility receives waste streams from multiple jurisdictions, converts that material into measurable energy output, and produces financial reports tied to specific staff members and departments. The data model captures these relationships through six core tables—waste_processing_facilities, waste_streams, energy_outputs, financial_reports, financial_staffs, and departments—alongside twelve derived views that join these tables to answer cross-domain questions. Each record carries a unique identifier, timestamps for auditability, and foreign-key links that trace any observation back to the facility, the staff member, or the department responsible.

**Table `waste_processing_facilities`**

| waste_processing_facility_id | facility_id | facility_name | location | capacity_tons_per_day | operational_status | commissioning_date | waste_stream_id | energy_output_id |
|---|---|---|---|---|---|---|---|---|
| 1000 | 69447 | Integrated Protocol A | extended-location-99 | 1.70 | active | 2025-12-03 | 100 | 1 |
| 1001 | 1040 | Extended Programme | integrated-location-100 | 3.40 | inactive | 2022-05-14 | 101 | 2 |
| 1002 | 2986228 | Pilot Standard | seasonal-location-101 | 5.10 | under_maintenance | 2023-10-25 | 102 | 3 |
| 1003 | ChIJvSxSbfdv5kcRanVzI8RRu20 | Baseline Framework D | regional-location-102 | 6.80 | active | 2024-03-09 | 103 | 4 |

The waste_processing_facilities table is the operational anchor. Each row represents a single processing plant, identified by waste_processing_facility_id and facility_id, with a human-readable facility_name and location. The capacity_tons_per_day column quantifies how much material the plant can handle, while operational_status tracks whether the facility is active, inactive, or under_maintenance. Commissioning_date records when the plant entered service. Foreign keys waste_stream_id and energy_output_id link the facility to its primary waste input and energy generation record. For example, facility 1000, named Integrated Protocol A at extended-location-99, operates at 1.70 tons per day and is currently active, having been commissioned on 2025-12-03. Facility 1001, Extended Programme at integrated-location-100, runs at 3.40 tons per day but is inactive as of its 2022-05-14 commissioning. Facility 1002, Pilot Standard at seasonal-location-101, sits at 5.10 tons per day under_maintenance, while facility 1003, Baseline Framework D at regional-location-102, processes 6.80 tons per day and remains active.

**Table `waste_streams`**

| id | stream_id | waste_type | origin_jurisdiction | daily_volume_tons | collection_frequency | hauler_contract_id | waste_processing_facility_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|
| 100 | 2839512 | municipal_solid_waste | integrated-origin-94 | 10.20 | daily | 4277016 | 1000 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 101 | e7a5231e-8fc3-11eb-924d-9cd76263cbd0 | recyclables | seasonal-origin-95 | 13.40 | weekly | 1437584 | 1001 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 102 | 3e41f384-9bac-11eb-a8a2-19ed5c03f8d3 | refuse | regional-origin-96 | 16.60 | biweekly | 1437604 | 1002 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 103 | 1186092 | municipal_solid_waste | legacy-origin-97 | 19.80 | daily | 2618566 | 1003 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Waste streams document the material entering each facility. The waste_streams table records waste_type (such as municipal_solid_waste, recyclables, or refuse), origin_jurisdiction, and daily_volume_tons. Collection_frequency indicates how often material is gathered—daily, weekly, or biweekly—while hauler_contract_id ties the stream to a specific logistics provider. The waste_processing_facility_id column assigns each stream to a receiving plant. Stream 100 carries municipal_solid_waste from integrated-origin-94 at 10.20 tons per day on a daily collection schedule under contract 4277016, feeding facility 1000. Stream 101 transports recyclables from seasonal-origin-95 at 13.40 tons per week under contract 1437584 to facility 1001. Stream 102 handles refuse from regional-origin-96 at 16.60 tons per biweekly cycle under contract 1437604, destined for facility 1002. Stream 103 processes municipal_solid_waste from legacy-origin-97 at 19.80 tons per day under contract 2618566, routed to facility 1003. Timestamps created_at and updated_at provide a full audit trail for each stream record.

**Table `energy_outputs`**

| id | output_id | energy_type | capacity_megawatts | daily_generation_m_wh | grid_connection_status | measurement_date | waste_processing_facility_id | created_at |
|---|---|---|---|---|---|---|---|---|
| 1 | 3717613 | adaptive-energy-71 | 6.70 | 6.70 | connected | 2024-07-01T18:54:00 | 1000 | 2025-01-01 00:14:00 |
| 2 | 937738 | distributed-energy-72 | 8.40 | 9.40 | disconnected | 2025-12-12T01:11:00 | 1001 | 2025-02-06 03:14:00 |
| 3 | 974934 | baseline-energy-73 | 10.10 | 12.10 | maintenance | 2022-05-23T08:28:00 | 1002 | 2025-03-11 06:14:00 |
| 4 | 5f8f9bda-8fcd-11eb-924d-9cd76263cbd0 | pilot-energy-74 | 11.80 | 14.80 | connected | 2023-10-07T15:45:00 | 1003 | 2025-04-16 09:14:00 |

Energy outputs quantify the power generated by each facility. The energy_outputs table captures energy_type (adaptive-energy-71, distributed-energy-72, baseline-energy-73, pilot-energy-74), capacity_megawatts, and daily_generation_m_wh. The grid_connection_status column indicates whether the output is connected, disconnected, or in maintenance relative to the electrical grid. measurement_date records when the reading was taken, and waste_processing_facility_id links the energy record to its source plant. Energy record 1, tied to facility 1000, produces adaptive-energy-71 at a capacity of 6.70 megawatts with daily generation of 6.70 megawatt-hours and a connected grid status. Record 2, associated with facility 1001, generates distributed-energy-72 at 8.40 megawatts capacity and 9.40 megawatt-hours daily, but is currently disconnected from the grid. Record 3 for facility 1002 yields baseline-energy-73 at 10.10 megawatts capacity and 12.10 megawatt-hours daily, with maintenance status. Record 4 for facility 1003 produces pilot-energy-74 at 11.80 megawatts capacity and 14.80 megawatt-hours daily, connected to the grid.

**Table `financial_reports`**

| id | report_id | report_type | fiscal_year | reporting_period_start | reporting_period_end | status | prepared_by_staff_id | waste_processing_facility_id | financial_staff_id | created_at |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 1202-0008-S | budget | 17 | 2023-02-20 | 2024-03-23 | draft | template_impcode_pagata_10det50 | 1000 | 100 | 2025-01-01 00:14:00 |
| 2 | 8189500 | quarterly | 20 | 2024-07-04 | 2025-08-07 | review | template_impcode_pagata_4ind | 1001 | 101 | 2025-02-06 03:14:00 |
| 3 | L355 | annual | 23 | 2025-12-15 | 2022-01-18 | approved | state_et_9 | 1002 | 102 | 2025-03-11 06:14:00 |
| 4 | 5844272 | risk_assessment | 26 | 2022-05-26 | 2023-06-02 | archived | ChIJ20iLSYBt5kcRpX1RdgTAmNY | 1003 | 103 | 2025-04-16 09:14:00 |

Financial reports track the fiscal oversight of each facility. The financial_reports table includes report_type (budget, quarterly, annual, risk_assessment), fiscal_year, and the reporting_period_start and reporting_period_end dates. Status indicates the report's lifecycle stage—draft, review, approved, or archived. prepared_by_staff_id identifies the template or individual who authored the report, while waste_processing_facility_id and financial_staff_id link the report to its facility and the responsible staff member. Report 1202-0008-S is a budget report for fiscal year 17, covering 2023-02-20 through 2024-03-23, in draft status, prepared by template_impcode_pagata_10det50 for facility 1000 under staff 100. Report 8189500 is a quarterly report for fiscal year 20, spanning 2024-07-04 to 2025-08-07, in review status, prepared by template_impcode_pagata_4ind for facility 1001 under staff 101. Report L355 is an annual report for fiscal year 23, from 2025-12-15 to 2022-01-18, approved, prepared by state_et_9 for facility 1002 under staff 102. Report 5844272 is a risk_assessment for fiscal year 26, covering 2022-05-26 to 2023-06-02, archived, prepared by ChIJ20iLSYBt5kcRpX1RdgTAmNY for facility 1003 under staff 103.

**Table `financial_staffs`**

| id | staff_id | full_name | role | employment_status | hire_date | supervisor_staff_id | financial_report_id | financial_staff_id | department_id |
|---|---|---|---|---|---|---|---|---|---|
| 100 | 937735 | Theodore Mcgrath | accountant | full_time | 2023-06-01 | 3355774 | 1 | 100 | 2087755 |
| 101 | 3158139 | Account Name | financial_analyst | part_time | 2024-11-12 | template_ivacode_pagata_art15 | 2 | 101 | 790483 |
| 102 | 8189502 | Saipan International Airport | cfo | contract | 2025-04-23 | f208f470-8fcd-11eb-924d-9cd76263cbd0 | 3 | 102 | 505978 |
| 103 | 69438 | Norma Fisher | it_staff | full_time | 2022-09-07 | 4793470 | 4 | 103 | id_6 |

The financial_staffs table catalogs the personnel responsible for fiscal operations. Each row contains staff_id, full_name, role (accountant, financial_analyst, cfo, it_staff), and employment_status (full_time, part_time, contract). hire_date records when the employee joined, supervisor_staff_id identifies their manager, and financial_report_id links the staff member to a specific report they prepared. The financial_staff_id column provides an additional reference key, while department_id assigns the staff member to a department. Staff 100, Theodore Mcgrath, serves as an accountant on full_time status, hired 2023-06-01, supervised by 3355774, associated with report 1 and department 2087755. Staff 101, Account Name, is a financial_analyst on part_time status, hired 2024-11-12, supervised by template_ivacode_pagata_art15, linked to report 2 and department 790483. Staff 102, Saipan International Airport, holds the cfo role on contract status, hired 2025-04-23, supervised by f208f470-8fcd-11eb-924d-9cd76263cbd0, tied to report 3 and department 505978. Staff 103, Norma Fisher, works as it_staff on full_time status, hired 2022-09-07, supervised by 4793470, connected to report 4 and department id_6.

**Table `departments`**

| department_id | department_name | head_staff_id | budget_allocation | established_date | financial_staff_id | waste_processing_facility_id | financial_report_id |
|---|---|---|---|---|---|---|---|
| 2087755 | Baseline Framework D | 48753451 | 446.22 | 2024-03-27 | 100 | 1000 | 1 |
| 790483 | Distributed Protocol | 1152669 | 763.46 | 2025-08-11 | 101 | 1001 | 2 |
| 505978 | Adaptive Programme | 8350018 | 12.34 | 2022-01-22 | 102 | 1002 | 3 |
| id_6 | Primary Standard A | id_12 | 1,737 | 2023-06-06 | 103 | 1003 | 4 |

Departments organize the administrative structure underlying facility operations. The departments table includes department_name, head_staff_id, budget_allocation, and established_date. Foreign keys financial_staff_id, waste_processing_facility_id, and financial_report_id connect each department to a specific staff member, facility, and financial report. Department 2087755, Baseline Framework D, is headed by 48753451 with a budget allocation of 446.22, established 2024-03-27, linked to staff 100, facility 1000, and report 1. Department 790483, Distributed Protocol, is led by 1152669 with a budget of 763.46, established 2025-08-11, connected to staff 101, facility 1001, and report 2. Department 505978, Adaptive Programme, has head 8350018, a budget of 12.34, established 2022-01-22, associated with staff 102, facility 1002, and report 3. Department id_6, Primary Standard A, is headed by id_12 with a budget of 1,737, established 2023-06-06, tied to staff 103, facility 1003, and report 4.

The views synthesize these base tables into cross-domain perspectives. The view v_waste_processing_facility_waste_stream joins waste_processing_facilities with waste_streams to answer which waste streams feed which facilities. It reveals that facility 1000 (Integrated Protocol A) receives stream 100 (municipal_solid_waste at 10.20 tons per day), while facility 1003 (Baseline Framework D) receives stream 103 (municipal_solid_waste at 19.80 tons per day). The view v_waste_processing_facility_energy_output links facilities to their energy outputs, showing that facility 1000 generates adaptive-energy-71 at 6.70 megawatts capacity, and facility 1003 produces pilot-energy-74 at 11.80 megawatts capacity.

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

The reverse-direction views reframe the same relationships from the perspective of the source entity. The view v_waste_stream_waste_processing_facility starts from waste_streams and shows their destination facilities, confirming that stream 101 (recyclables) routes to facility 1001 and stream 102 (refuse) routes to facility 1002. The view v_energy_output_waste_processing_facility starts from energy_outputs and traces back to their source facilities, verifying that output 2 (distributed-energy-72) originates at facility 1001 and output 3 (baseline-energy-73) originates at facility 1002.

The financial views connect fiscal records to operational entities. The view v_financial_report_waste_processing_facility joins financial_reports with waste_processing_facilities, revealing that report 1202-0008-S (budget, draft) belongs to facility 1000, while report L355 (annual, approved) belongs to facility 1002. The view v_financial_report_financial_staff links reports to the staff members who prepared them, showing that staff 100 (Theodore Mcgrath) prepared report 1 and staff 102 (Saipan International Airport) prepared report 3.





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

The staff-centric views trace reporting relationships and departmental assignments. The view v_financial_staff_financial_report connects each staff member to their assigned report, confirming that staff 101 (Account Name) is linked to report 2 and staff 103 (Norma Fisher) to report 4. The view v_financial_staff_financial_staff exposes the supervisor hierarchy: staff 100 reports to supervisor 3355774, while staff 102 reports to supervisor f208f470-8fcd-11eb-924d-9cd76263cbd0. The view v_financial_staff_department maps staff to their departments, showing staff 100 belongs to department 2087755 (Baseline Framework D) and staff 103 to department id_6 (Primary Standard A).

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

The department-centric views complete the organizational picture. The view v_department_financial_staff links departments to their assigned staff, confirming that department 790483 (Distributed Protocol) is served by staff 101 and department 505978 (Adaptive Programme) by staff 102. The view v_department_waste_processing_facility connects departments to their operational facilities, showing department 2087755 oversees facility 1000 and department id_6 oversees facility 1003. Finally, the view v_department_financial_report ties departments to their financial reports, revealing that department 790483 is associated with report 2 and department 505978 with report 3.

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

Together, these tables and views form a coherent operational record system. A practitioner can trace any waste stream from its origin jurisdiction through the receiving facility, its energy output, and the financial report that documents the facility's fiscal performance, all the way to the staff member and department responsible. The identifiers—numeric IDs, UUIDs, and alphanumeric codes—provide unambiguous links across the entire dataset. Timestamps on waste streams, energy outputs, and financial reports enable temporal analysis, while status columns (operational_status, grid_connection_status, report status, employment_status) capture the current state of every entity. This structure supports both granular audits of individual records and broad cross-domain queries that reveal how waste processing, energy generation, and financial oversight interlock across the organization.