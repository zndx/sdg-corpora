## Field Operations and Expedition Records

Expeditionary science demands rigorous coordination between personnel, equipment, environmental measurements, and geographic scope. The records maintained by field operations teams capture every dimension of this coordination: who was deployed, what tools they carried, where they went, what they measured, and what recognition their work earned. This chapter documents the structure of those records, the relationships that bind them, and the analytical views that synthesize them into actionable intelligence.

**Table `expeditions`**

| expedition_id | start_date | end_date | duration_days | objective | status | team_size | region | explorer_id | equipment_id | observation_id | geographic_area_id |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 8189498 | 2022-09-05 | 2022-09-01 | 38 | distributed-objectiv-36 | planned | 19 | distributed-region-12 | 100 | 1 | 2986222 | 1 |
| 8387552 | 2023-02-16 | 2023-02-12 | 49 | baseline-objectiv-37 | ongoing | 23 | baseline-region-13 | 101 | 2 | 605970 | 2 |
| 6926365 | 2024-07-27 | 2024-07-23 | 60 | pilot-objectiv-38 | completed | 27 | pilot-region-14 | 102 | 3 | 6564399 | 3 |
| 3355779 | 2025-12-11 | 2025-12-07 | 71 | extended-objectiv-39 | abandoned | 31 | extended-region-15 | 103 | 4 | 9125614 | 4 |

Each expedition record anchors a distinct field campaign. The expedition identifier serves as the primary key, while the start and end dates define the operational window. Expedition 8189499, for instance, was scheduled from September 5, 2022, through September 1, 2022, spanning 38 days with a team of 19 members operating under the objective labeled distributed-objectiv-36 in distributed-region-12. Its status reads planned. Expedition 8387552, running from February 16 to February 12, 2023, lasted 49 days with 23 personnel and carried the objective baseline-objectiv-37 in baseline-region-13; it is marked ongoing. Expedition 6926365, a completed mission from July 27 to July 23, 2024, involved 27 team members pursuing pilot-objectiv-38 in pilot-region-14 over 60 days. The final record, expedition 3355779, was abandoned after 71 days in extended-region-15, with 31 personnel assigned to extended-objectiv-39. The status field—planned, ongoing, completed, or abandoned—provides an immediate snapshot of campaign health.

**Table `explorers`**

| explorer_id | full_name | birth_date | death_date | nationality | specialization | skills | expedition_id | award_id | document_id |
|---|---|---|---|---|---|---|---|---|---|
| 100 | Theodore Mcgrath | 2023-10-18 | 2022-01-12 | composite-national-39 | zoology | legacy-skills-31 | 8189498 | 1000 | 1000 |
| 101 | Account Name | 2024-03-02 | 2023-06-23 | primary-national-40 | oceanography | compact-skills-32 | 8387552 | 1001 | 1001 |
| 102 | Saipan International Airport | 2025-08-13 | 2024-11-07 | adaptive-national-41 | exploration | composite-skills-33 | 6926365 | 1002 | 1002 |
| 103 | Norma Fisher | 2022-01-24 | 2025-04-18 | distributed-national-42 | zoology | primary-skills-34 | 3355779 | 1003 | 1003 |

The explorer table catalogs the individuals deployed on these campaigns. Each explorer carries a unique identifier, a full name, biographical dates, nationality, specialization, and a skills descriptor. Explorer 100, Theodore Mcgrath, born October 18, 2023, holds a specialization in zoology and is associated with legacy-skills-31. Explorer 101, listed as Account Name, specializes in oceanography with compact-skills-32. Explorer 102, recorded under the name Saipan International Airport, focuses on exploration with composite-skills-33. Explorer 103, Norma Fisher, also specializes in zoology and carries primary-skills-34. Each explorer record links to an expedition, an award, and a document, establishing the core relational spine of the system.

**Table `equipments`**

| equipment_id | name | type | weight_kg | designer | status | expedition_id |
|---|---|---|---|---|---|---|
| 1 | Extended Review | sled | 1.48 | pilot-designer-50 | designed | 8189498 |
| 2 | Pilot Initiative A | sleepingBag | 0.385 | extended-designer-51 | manufactured | 8387552 |
| 3 | Baseline Model | clothing | 0.5465680900000001 | integrated-designer-52 | deployed | 6926365 |
| 4 | Distributed Cluster | cookingStove | 0.9 | seasonal-designer-53 | lost | 3355779 |

Equipment records describe the tools deployed during each expedition. The equipment table stores a name, type, weight in kilograms, designer identifier, operational status, and the expedition to which the item is assigned. Equipment item 1, named Extended Review, is a sled weighing 1.48 kg, designed by pilot-designer-50, and currently in designed status. Item 2, Pilot Initiative A, is a sleeping bag at 0.385 kg, manufactured by extended-designer-51. Item 3, the Baseline Model clothing weighing 0.547 kg, was designed by integrated-designer-52 and is deployed. Item 4, Distributed Cluster, a cooking stove at 0.9 kg designed by seasonal-designer-53, is recorded as lost. The status field—designed, manufactured, deployed, or lost—tracks the lifecycle of each piece of gear.

**Table `observations`**

| observation_id | timestamp | parameter | value | unit | status | expedition_id | equipment_id |
|---|---|---|---|---|---|---|---|
| 2986222 | 2024-07-08T18:18:00 | temperature | 19.95 | distributed-unit-18 | recorded | 8189498 | 1 |
| 605970 | 2025-12-19T01:35:00 | pressure | 21.90 | baseline-unit-19 | verified | 8387552 | 2 |
| 6564399 | 2022-05-03T08:52:00 | salinity | 23.85 | pilot-unit-20 | analyzed | 6926365 | 3 |
| 9125614 | 2023-10-14T15:09:00 | location | 25.80 | extended-unit-21 | recorded | 3355779 | 4 |

Environmental observations form the scientific output of every expedition. Each observation record includes a timestamp, a measured parameter, a numeric value, a unit of measure, a processing status, and links to the originating expedition and the equipment used. Observation 2986222, recorded on July 8, 2024, at 18:18 UTC, measured temperature at 19.95 in distributed-unit-18 and is marked recorded. Observation 605970, taken December 19, 2025, at 01:35 UTC, measured pressure at 21.90 in baseline-unit-19 with verified status. Observation 6564399, from May 3, 2022, at 08:52 UTC, captured salinity at 23.85 in pilot-unit-20 and is analyzed. Observation 9125614, recorded October 14, 2023, at 15:09 UTC, logged location at 25.80 in extended-unit-21 with recorded status. The parameter field—temperature, pressure, salinity, or location—indicates the type of measurement taken.

**Table `geographic_areas`**

| id | area_id | name | type | latitude | longitude | description | expedition_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|
| 1 | default_chart_a_tax_19 | Extended Review | coast | 13.95 | 21.20 | Extended Survey | 8189498 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | fro | Pilot Initiative A | interior | 17.90 | 25.40 | Pilot Corridor A | 8387552 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | account_pymes_296 | Baseline Model | ocean | 21.85 | 29.60 | Baseline Series | 6926365 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | 57e52fbc-8fcd-11eb-924d-9cd76263cbd0 | Distributed Cluster | port | 25.80 | 33.80 | Distributed Assessment | 3355779 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Geographic areas define the spatial boundaries of each expedition. The table stores an internal identifier, an area identifier, a descriptive name, a type classification, latitude and longitude coordinates, a description, and timestamps for creation and last update. Area 1, named Extended Review, is classified as a coast at coordinates 13.95 latitude and 21.20 longitude, described as Extended Survey. Area 2, Pilot Initiative A, is an interior region at 17.90 and 25.40, described as Pilot Corridor A. Area 3, Baseline Model, is an ocean zone at 21.85 and 29.60, described as Baseline Series. Area 4, Distributed Cluster, is a port at 25.80 and 33.80, described as Distributed Assessment. The type field—coast, interior, ocean, or port—categorizes the terrain.

**Table `awards`**

| id | award_id | name | year | category | reason | explorer_id | created_at |
|---|---|---|---|---|---|---|---|
| 1000 | e02275d4-8fd1-11eb-924d-9cd76263cbd0 | Extended Review | 12 | Peace | distributed-reason-66 | 100 | 2025-01-01 00:14:00 |
| 1001 | 3012811 | Pilot Initiative A | 21 | Science | baseline-reason-67 | 101 | 2025-02-06 03:14:00 |
| 1002 | 15493350 | Baseline Model | 30 | Exploration | pilot-reason-68 | 102 | 2025-03-11 06:14:00 |
| 1003 | state_uk_17 | Distributed Cluster | 39 | Peace | extended-reason-69 | 103 | 2025-04-16 09:14:00 |

Awards recognize the contributions of explorers. Each award record includes an internal identifier, an award identifier, a name, a year, a category, a reason descriptor, the associated explorer, and a creation timestamp. Award 1000, named Extended Review, was given in year 12 under the Peace category for distributed-reason-66 to explorer 100. Award 1001, Pilot Initiative A, was conferred in year 21 under Science for baseline-reason-67 to explorer 101. Award 1002, Baseline Model, was awarded in year 30 under Exploration for pilot-reason-68 to explorer 102. Award 1003, Distributed Cluster, was given in year 39 under Peace for extended-reason-69 to explorer 103. The category field—Peace, Science, or Exploration—classifies the nature of the recognition.

**Table `documents`**

| id | document_id | name | type | issue_date | issuing_authority | recognized_by | explorer_id | action_id |
|---|---|---|---|---|---|---|---|---|
| 1000 | IVC10I | Extended Review | passport | 2023-02-01 | extended-issuing-33 | 23 | 100 | 8250 |
| 1001 | 605943 | Pilot Initiative A | report | 2024-07-12 | integrated-issuing-34 | 32 | 101 | 450 |
| 1002 | 10449525 | Baseline Model | thesis | 2025-12-23 | seasonal-issuing-35 | 41 | 102 | 21005921 |
| 1003 | 5f93a090-8fcd-11eb-924d-9cd76263cbd0 | Distributed Cluster | passport | 2022-05-07 | regional-issuing-36 | 50 | 103 | 1437589 |

Documents serve as the archival backbone, linking explorers to humanitarian actions and providing supplementary records for each expedition. The document table stores a document identifier, a title, a document type, a file path, a creation date, and links to the associated explorer and humanitarian action. Each document record ties a specific explorer to a humanitarian action, creating a chain of accountability and traceability across the operational record.

**Table `humanitarian_actions`**

| action_id | start_date | end_date | type | beneficiaries_count | status | explorer_id | document_id |
|---|---|---|---|---|---|---|---|
| 8250 | 2022-09-05 | 2022-09-01 | repatriation | 18 | planned | 100 | 1000 |
| 450 | 2023-02-16 | 2023-02-12 | refugeeAssistance | 2 | ongoing | 101 | 1001 |
| 21005921 | 2024-07-27 | 2024-07-23 | repatriation | 0 | completed | 102 | 1002 |
| 1437589 | 2025-12-11 | 2025-12-07 | refugeeAssistance | 5 | planned | 103 | 1003 |

Humanitarian actions represent the relief and support activities conducted alongside or in conjunction with scientific expeditions. The table records an action identifier, a description, an action type, a location, a date, and a status. Each humanitarian action is linked to an explorer and to one or more documents, ensuring that relief efforts are documented and attributable. The status field—completed, ongoing, or planned—mirrors the expedition status taxonomy, enabling cross-referencing between scientific and humanitarian timelines.

### Expedition–Explorer Relationships

The view v_expedition_explorer joins expedition records with their assigned explorers, answering the question of which personnel were deployed on which campaign. In this view, expedition 8189498 maps to explorer Theodore Mcgrath (ID 100), a zoologist with legacy-skills-31. Expedition 8387552 maps to Account Name (ID 101), an oceanographer with compact-skills-32. Expedition 6926365 maps to Saipan International Airport (ID 102), an exploration specialist with composite-skills-33. Expedition 3355779 maps to Norma Fisher (ID 103), another zoologist with primary-skills-34. This join enables commanders to assess team composition at a glance.

**View `v_expedition_explorer`**

```sql
CREATE VIEW v_expedition_explorer AS
SELECT a.expedition_id, a.start_date, a.end_date, a.duration_days, b.explorer_id AS explorer_explorer_id, b.full_name AS explorer_full_name, b.birth_date AS explorer_birth_date
FROM expeditions a JOIN explorers b ON a.explorer_id = b.explorer_id;
```

| expedition_id | start_date | end_date | duration_days | explorer_explorer_id | explorer_full_name | explorer_birth_date |
|---|---|---|---|---|---|---|
| 8189498 | 2022-09-05 | 2022-09-01 | 38 | 100 | Theodore Mcgrath | 2023-10-18 |
| 8387552 | 2023-02-16 | 2023-02-12 | 49 | 101 | Account Name | 2024-03-02 |
| 6926365 | 2024-07-27 | 2024-07-23 | 60 | 102 | Saipan International Airport | 2025-08-13 |
| 3355779 | 2025-12-11 | 2025-12-07 | 71 | 103 | Norma Fisher | 2022-01-24 |

The complementary view v_explorer_expedition inverts the relationship, presenting each explorer alongside their assigned expedition. Explorer Theodore Mcgrath (ID 100) is linked to expedition 8189498, a planned campaign in distributed-region-12 with 19 team members. Account Name (ID 101) is linked to expedition 8387552, an ongoing mission in baseline-region-13 with 23 members. Saipan International Airport (ID 102) is linked to expedition 6926365, a completed operation in pilot-region-14 with 27 members. Norma Fisher (ID 103) is linked to expedition 3355779, an abandoned campaign in extended-region-15 with 31 members. This perspective is useful for personnel management and career tracking.

**View `v_explorer_expedition`**

```sql
CREATE VIEW v_explorer_expedition AS
SELECT a.explorer_id, a.full_name, a.birth_date, a.death_date, b.expedition_id AS expedition_expedition_id, b.start_date AS expedition_start_date, b.end_date AS expedition_end_date
FROM explorers a JOIN expeditions b ON a.expedition_id = b.expedition_id;
```

| explorer_id | full_name | birth_date | death_date | expedition_expedition_id | expedition_start_date | expedition_end_date |
|---|---|---|---|---|---|---|
| 100 | Theodore Mcgrath | 2023-10-18 | 2022-01-12 | 8189498 | 2022-09-05 | 2022-09-01 |
| 101 | Account Name | 2024-03-02 | 2023-06-23 | 8387552 | 2023-02-16 | 2023-02-12 |
| 102 | Saipan International Airport | 2025-08-13 | 2024-11-07 | 6926365 | 2024-07-27 | 2024-07-23 |
| 103 | Norma Fisher | 2022-01-24 | 2025-04-18 | 3355779 | 2025-12-11 | 2025-12-07 |

### Equipment and Observation Integration

The view v_expedition_equipment associates each expedition with its assigned equipment. Expedition 8189498 is linked to Extended Review, a sled weighing 1.48 kg in designed status. Expedition 8387552 is linked to Pilot Initiative A, a sleeping bag at 0.385 kg in manufactured status. Expedition 6926365 is linked to the Baseline Model clothing at 0.547 kg, deployed. Expedition 3355779 is linked to Distributed Cluster, a cooking stove at 0.9 kg that is lost. This view supports logistics planning and equipment accountability.

**View `v_expedition_equipment`**

```sql
CREATE VIEW v_expedition_equipment AS
SELECT a.expedition_id, a.start_date, a.end_date, a.duration_days, b.equipment_id AS equipment_equipment_id, b.name AS equipment_name, b.type AS equipment_type
FROM expeditions a JOIN equipments b ON a.equipment_id = b.equipment_id;
```

| expedition_id | start_date | end_date | duration_days | equipment_equipment_id | equipment_name | equipment_type |
|---|---|---|---|---|---|---|
| 8189498 | 2022-09-05 | 2022-09-01 | 38 | 1 | Extended Review | sled |
| 8387552 | 2023-02-16 | 2023-02-12 | 49 | 2 | Pilot Initiative A | sleepingBag |
| 6926365 | 2024-07-27 | 2024-07-23 | 60 | 3 | Baseline Model | clothing |
| 3355779 | 2025-12-11 | 2025-12-07 | 71 | 4 | Distributed Cluster | cookingStove |

The view v_equipment_expedition reverses this association, presenting each equipment item alongside its expedition. Extended Review (ID 1) is assigned to expedition 8189498. Pilot Initiative A (ID 2) is assigned to expedition 8387552. Baseline Model (ID 3) is assigned to expedition 6926365. Distributed Cluster (ID 4) is assigned to expedition 3355779. The inversion is valuable for inventory audits and loss tracking.

**View `v_equipment_expedition`**

```sql
CREATE VIEW v_equipment_expedition AS
SELECT a.equipment_id, a.name, a.type, a.weight_kg, b.expedition_id AS expedition_expedition_id, b.start_date AS expedition_start_date, b.end_date AS expedition_end_date
FROM equipments a JOIN expeditions b ON a.expedition_id = b.expedition_id;
```

| equipment_id | name | type | weight_kg | expedition_expedition_id | expedition_start_date | expedition_end_date |
|---|---|---|---|---|---|---|
| 1 | Extended Review | sled | 1.48 | 8189498 | 2022-09-05 | 2022-09-01 |
| 2 | Pilot Initiative A | sleepingBag | 0.385 | 8387552 | 2023-02-16 | 2023-02-12 |
| 3 | Baseline Model | clothing | 0.5465680900000001 | 6926365 | 2024-07-27 | 2024-07-23 |
| 4 | Distributed Cluster | cookingStove | 0.9 | 3355779 | 2025-12-11 | 2025-12-07 |

The view v_expedition_observation links each expedition to its scientific observations. Expedition 8189498 produced observation 2986222, a temperature reading of 19.95 in distributed-unit-18. Expedition 8387552 produced observation 605970, a pressure reading of 21.90 in baseline-unit-19. Expedition 6926365 produced observation 6564399, a salinity reading of 23.85 in pilot-unit-20. Expedition 3355779 produced observation 9125614, a location reading of 25.80 in extended-unit-21. This view provides a scientific output summary per campaign.

**View `v_expedition_observation`**

```sql
CREATE VIEW v_expedition_observation AS
SELECT a.expedition_id, a.start_date, a.end_date, a.duration_days, b.observation_id AS observation_observation_id, b.timestamp AS observation_timestamp, b.parameter AS observation_parameter
FROM expeditions a JOIN observations b ON a.observation_id = b.observation_id;
```

| expedition_id | start_date | end_date | duration_days | observation_observation_id | observation_timestamp | observation_parameter |
|---|---|---|---|---|---|---|
| 8189498 | 2022-09-05 | 2022-09-01 | 38 | 2986222 | 2024-07-08T18:18:00 | temperature |
| 8387552 | 2023-02-16 | 2023-02-12 | 49 | 605970 | 2025-12-19T01:35:00 | pressure |
| 6926365 | 2024-07-27 | 2024-07-23 | 60 | 6564399 | 2022-05-03T08:52:00 | salinity |
| 3355779 | 2025-12-11 | 2025-12-07 | 71 | 9125614 | 2023-10-14T15:09:00 | location |

The view v_observation_expedition inverts the observation-to-expedition link. Observation 2986222 traces to expedition 8189498. Observation 605970 traces to expedition 8387552. Observation 6564399 traces to expedition 6926365. Observation 9125614 traces to expedition 3355779. This perspective supports data provenance and quality assurance workflows.

**View `v_observation_expedition`**

```sql
CREATE VIEW v_observation_expedition AS
SELECT a.observation_id, a.timestamp, a.parameter, a.value, b.expedition_id AS expedition_expedition_id, b.start_date AS expedition_start_date, b.end_date AS expedition_end_date
FROM observations a JOIN expeditions b ON a.expedition_id = b.expedition_id;
```

| observation_id | timestamp | parameter | value | expedition_expedition_id | expedition_start_date | expedition_end_date |
|---|---|---|---|---|---|---|
| 2986222 | 2024-07-08T18:18:00 | temperature | 19.95 | 8189498 | 2022-09-05 | 2022-09-01 |
| 605970 | 2025-12-19T01:35:00 | pressure | 21.90 | 8387552 | 2023-02-16 | 2023-02-12 |
| 6564399 | 2022-05-03T08:52:00 | salinity | 23.85 | 6926365 | 2024-07-27 | 2024-07-23 |
| 9125614 | 2023-10-14T15:09:00 | location | 25.80 | 3355779 | 2025-12-11 | 2025-12-07 |

The view v_observation_equipment connects each observation to the equipment used for its measurement. Observation 2986222 was captured using equipment 1 (Extended Review sled). Observation 605970 was captured using equipment 2 (Pilot Initiative A sleeping bag). Observation 6564399 was captured using equipment 3 (Baseline Model clothing). Observation 9125614 was captured using equipment 4 (Distributed Cluster cooking stove). This join is essential for calibrating instruments and validating measurement chains.

**View `v_observation_equipment`**

```sql
CREATE VIEW v_observation_equipment AS
SELECT a.observation_id, a.timestamp, a.parameter, a.value, b.equipment_id AS equipment_equipment_id, b.name AS equipment_name, b.type AS equipment_type
FROM observations a JOIN equipments b ON a.equipment_id = b.equipment_id;
```

| observation_id | timestamp | parameter | value | equipment_equipment_id | equipment_name | equipment_type |
|---|---|---|---|---|---|---|
| 2986222 | 2024-07-08T18:18:00 | temperature | 19.95 | 1 | Extended Review | sled |
| 605970 | 2025-12-19T01:35:00 | pressure | 21.90 | 2 | Pilot Initiative A | sleepingBag |
| 6564399 | 2022-05-03T08:52:00 | salinity | 23.85 | 3 | Baseline Model | clothing |
| 9125614 | 2023-10-14T15:09:00 | location | 25.80 | 4 | Distributed Cluster | cookingStove |

### Geographic and Award Records

The view v_expedition_geographic_area maps each expedition to its designated geographic area. Expedition 8189498 is associated with Extended Review, a coast at 13.95/21.20. Expedition 8387552 is associated with Pilot Initiative A, an interior at 17.90/25.40. Expedition 6926365 is associated with Baseline Model, an ocean at 21.85/29.60. Expedition 3355779 is associated with Distributed Cluster, a port at 25.80/33.80. This view supports route planning and terrain analysis.

**View `v_expedition_geographic_area`**

```sql
CREATE VIEW v_expedition_geographic_area AS
SELECT a.expedition_id, a.start_date, a.end_date, a.duration_days, b.id AS area_id, b.area_id AS area_area_id, b.name AS area_name
FROM expeditions a JOIN geographic_areas b ON a.geographic_area_id = b.id;
```

| expedition_id | start_date | end_date | duration_days | area_id | area_area_id | area_name |
|---|---|---|---|---|---|---|
| 8189498 | 2022-09-05 | 2022-09-01 | 38 | 1 | default_chart_a_tax_19 | Extended Review |
| 8387552 | 2023-02-16 | 2023-02-12 | 49 | 2 | fro | Pilot Initiative A |
| 6926365 | 2024-07-27 | 2024-07-23 | 60 | 3 | account_pymes_296 | Baseline Model |
| 3355779 | 2025-12-11 | 2025-12-07 | 71 | 4 | 57e52fbc-8fcd-11eb-924d-9cd76263cbd0 | Distributed Cluster |

The view v_geographic_area_expedition inverts this mapping. Area Extended Review (ID 1) is linked to expedition 8189498. Area Pilot Initiative A (ID 2) is linked to expedition 8387552. Area Baseline Model (ID 3) is linked to expedition 6926365. Area Distributed Cluster (ID 4) is linked to expedition 3355779. This perspective is useful for geographic information system (GIS) queries and regional reporting.

**View `v_geographic_area_expedition`**

```sql
CREATE VIEW v_geographic_area_expedition AS
SELECT a.id, a.area_id, a.name, a.type, b.expedition_id AS expedition_expedition_id, b.start_date AS expedition_start_date, b.end_date AS expedition_end_date
FROM geographic_areas a JOIN expeditions b ON a.expedition_id = b.expedition_id;
```

| id | area_id | name | type | expedition_expedition_id | expedition_start_date | expedition_end_date |
|---|---|---|---|---|---|---|
| 1 | default_chart_a_tax_19 | Extended Review | coast | 8189498 | 2022-09-05 | 2022-09-01 |
| 2 | fro | Pilot Initiative A | interior | 8387552 | 2023-02-16 | 2023-02-12 |
| 3 | account_pymes_296 | Baseline Model | ocean | 6926365 | 2024-07-27 | 2024-07-23 |
| 4 | 57e52fbc-8fcd-11eb-924d-9cd76263cbd0 | Distributed Cluster | port | 3355779 | 2025-12-11 | 2025-12-07 |

The view v_explorer_award connects each explorer to their recognized award. Explorer Theodore Mcgrath (ID 100) received award 1000, Extended Review, in year 12 under the Peace category. Explorer Account Name (ID 101) received award 1001, Pilot Initiative A, in year 21 under Science. Explorer Saipan International Airport (ID 102) received award 1002, Baseline Model, in year 30 under Exploration. Explorer Norma Fisher (ID 103) received award 1003, Distributed Cluster, in year 39 under Peace. This view supports recognition tracking and career milestone documentation.

**View `v_explorer_award`**

```sql
CREATE VIEW v_explorer_award AS
SELECT a.explorer_id, a.full_name, a.birth_date, a.death_date, b.id AS award_id, b.award_id AS award_award_id, b.name AS award_name
FROM explorers a JOIN awards b ON a.award_id = b.id;
```

| explorer_id | full_name | birth_date | death_date | award_id | award_award_id | award_name |
|---|---|---|---|---|---|---|
| 100 | Theodore Mcgrath | 2023-10-18 | 2022-01-12 | 1000 | e02275d4-8fd1-11eb-924d-9cd76263cbd0 | Extended Review |
| 101 | Account Name | 2024-03-02 | 2023-06-23 | 1001 | 3012811 | Pilot Initiative A |
| 102 | Saipan International Airport | 2025-08-13 | 2024-11-07 | 1002 | 15493350 | Baseline Model |
| 103 | Norma Fisher | 2022-01-24 | 2025-04-18 | 1003 | state_uk_17 | Distributed Cluster |

The view v_award_explorer inverts the award-to-explorer link. Award 1000 (Extended Review, Peace, year 12) is attributed to explorer 100. Award 1001 (Pilot Initiative A, Science, year 21) is attributed to explorer 101. Award 1002 (Baseline Model, Exploration, year 30) is attributed to explorer 102. Award 1003 (Distributed Cluster, Peace, year 39) is attributed to explorer 103. This inversion supports award committee reviews and historical recognition analysis.

**View `v_award_explorer`**

```sql
CREATE VIEW v_award_explorer AS
SELECT a.id, a.award_id, a.name, a.year, b.explorer_id AS explorer_explorer_id, b.full_name AS explorer_full_name, b.birth_date AS explorer_birth_date
FROM awards a JOIN explorers b ON a.explorer_id = b.explorer_id;
```

| id | award_id | name | year | explorer_explorer_id | explorer_full_name | explorer_birth_date |
|---|---|---|---|---|---|---|
| 1000 | e02275d4-8fd1-11eb-924d-9cd76263cbd0 | Extended Review | 12 | 100 | Theodore Mcgrath | 2023-10-18 |
| 1001 | 3012811 | Pilot Initiative A | 21 | 101 | Account Name | 2024-03-02 |
| 1002 | 15493350 | Baseline Model | 30 | 102 | Saipan International Airport | 2025-08-13 |
| 1003 | state_uk_17 | Distributed Cluster | 39 | 103 | Norma Fisher | 2022-01-24 |

### Document and Humanitarian Action Linkages

The view v_explorer_document links each explorer to their associated document. Explorer Theodore Mcgrath (ID 100) is linked to document 1000. Explorer Account Name (ID 101) is linked to document 1001. Explorer Saipan International Airport (ID 102) is linked to document 1002. Explorer Norma Fisher (ID 103) is linked to document 1003. This view supports archival retrieval and personnel file management.

**View `v_explorer_document`**

```sql
CREATE VIEW v_explorer_document AS
SELECT a.explorer_id, a.full_name, a.birth_date, a.death_date, b.id AS document_id, b.document_id AS document_document_id, b.name AS document_name
FROM explorers a JOIN documents b ON a.document_id = b.id;
```

| explorer_id | full_name | birth_date | death_date | document_id | document_document_id | document_name |
|---|---|---|---|---|---|---|
| 100 | Theodore Mcgrath | 2023-10-18 | 2022-01-12 | 1000 | IVC10I | Extended Review |
| 101 | Account Name | 2024-03-02 | 2023-06-23 | 1001 | 605943 | Pilot Initiative A |
| 102 | Saipan International Airport | 2025-08-13 | 2024-11-07 | 1002 | 10449525 | Baseline Model |
| 103 | Norma Fisher | 2022-01-24 | 2025-04-18 | 1003 | 5f93a090-8fcd-11eb-924d-9cd76263cbd0 | Distributed Cluster |

The view v_document_explorer inverts this link. Document 1000 is associated with explorer 100. Document 1001 is associated with explorer 101. Document 1002 is associated with explorer 102. Document 1003 is associated with explorer 103. This perspective is useful for document audits and compliance verification.

**View `v_document_explorer`**

```sql
CREATE VIEW v_document_explorer AS
SELECT a.id, a.document_id, a.name, a.type, b.explorer_id AS explorer_explorer_id, b.full_name AS explorer_full_name, b.birth_date AS explorer_birth_date
FROM documents a JOIN explorers b ON a.explorer_id = b.explorer_id;
```

| id | document_id | name | type | explorer_explorer_id | explorer_full_name | explorer_birth_date |
|---|---|---|---|---|---|---|
| 1000 | IVC10I | Extended Review | passport | 100 | Theodore Mcgrath | 2023-10-18 |
| 1001 | 605943 | Pilot Initiative A | report | 101 | Account Name | 2024-03-02 |
| 1002 | 10449525 | Baseline Model | thesis | 102 | Saipan International Airport | 2025-08-13 |
| 1003 | 5f93a090-8fcd-11eb-924d-9cd76263cbd0 | Distributed Cluster | passport | 103 | Norma Fisher | 2022-01-24 |

The view v_document_humanitarian_action connects each document to its linked humanitarian action. Each document record carries a reference to a humanitarian action, creating a traceable chain from archival material to field relief activity. This linkage ensures that every documented action can be traced back to its operational context and that humanitarian efforts are properly archived alongside their scientific counterparts.

**View `v_document_humanitarian_action`**

```sql
CREATE VIEW v_document_humanitarian_action AS
SELECT a.id, a.document_id, a.name, a.type, b.action_id AS action_action_id, b.start_date AS action_start_date, b.end_date AS action_end_date
FROM documents a JOIN humanitarian_actions b ON a.action_id = b.action_id;
```

| id | document_id | name | type | action_action_id | action_start_date | action_end_date |
|---|---|---|---|---|---|---|
| 1000 | IVC10I | Extended Review | passport | 8250 | 2022-09-05 | 2022-09-01 |
| 1001 | 605943 | Pilot Initiative A | report | 450 | 2023-02-16 | 2023-02-12 |
| 1002 | 10449525 | Baseline Model | thesis | 21005921 | 2024-07-27 | 2024-07-23 |
| 1003 | 5f93a090-8fcd-11eb-924d-9cd76263cbd0 | Distributed Cluster | passport | 1437589 | 2025-12-11 | 2025-12-07 |

The view v_humanitarian_action_explorer links each humanitarian action to the explorer responsible. This join answers the question of which personnel initiated or oversaw each relief effort. The explorer identifier on the humanitarian action record provides a direct foreign-key link to the explorer table, enabling commanders to assess personnel involvement in non-scientific operations.

**View `v_humanitarian_action_explorer`**

```sql
CREATE VIEW v_humanitarian_action_explorer AS
SELECT a.action_id, a.start_date, a.end_date, a.type, b.explorer_id AS explorer_explorer_id, b.full_name AS explorer_full_name, b.birth_date AS explorer_birth_date
FROM humanitarian_actions a JOIN explorers b ON a.explorer_id = b.explorer_id;
```

| action_id | start_date | end_date | type | explorer_explorer_id | explorer_full_name | explorer_birth_date |
|---|---|---|---|---|---|---|
| 8250 | 2022-09-05 | 2022-09-01 | repatriation | 100 | Theodore Mcgrath | 2023-10-18 |
| 450 | 2023-02-16 | 2023-02-12 | refugeeAssistance | 101 | Account Name | 2024-03-02 |
| 21005921 | 2024-07-27 | 2024-07-23 | repatriation | 102 | Saipan International Airport | 2025-08-13 |
| 1437589 | 2025-12-11 | 2025-12-07 | refugeeAssistance | 103 | Norma Fisher | 2022-01-24 |

The view v_humanitarian_action_document connects humanitarian actions to their supporting documents. Each humanitarian action may have one or more associated documents that provide procedural details, resource allocations, or outcome reports. This join supports after-action reviews and ensures that relief operations are fully documented and retrievable.

**View `v_humanitarian_action_document`**

```sql
CREATE VIEW v_humanitarian_action_document AS
SELECT a.action_id, a.start_date, a.end_date, a.type, b.id AS document_id, b.document_id AS document_document_id, b.name AS document_name
FROM humanitarian_actions a JOIN documents b ON a.document_id = b.id;
```

| action_id | start_date | end_date | type | document_id | document_document_id | document_name |
|---|---|---|---|---|---|---|
| 8250 | 2022-09-05 | 2022-09-01 | repatriation | 1000 | IVC10I | Extended Review |
| 450 | 2023-02-16 | 2023-02-12 | refugeeAssistance | 1001 | 605943 | Pilot Initiative A |
| 21005921 | 2024-07-27 | 2024-07-23 | repatriation | 1002 | 10449525 | Baseline Model |
| 1437589 | 2025-12-11 | 2025-12-07 | refugeeAssistance | 1003 | 5f93a090-8fcd-11eb-924d-9cd76263cbd0 | Distributed Cluster |

### Synthesis

The expeditionary record system integrates eight core entities—expeditions, explorers, equipment, observations, geographic areas, awards, documents, and humanitarian actions—into a coherent operational database. Foreign-key relationships bind each entity to its parent campaign, its assigned personnel, and its supporting materials. The twenty analytical views provide bidirectional access across these relationships, enabling both top-down expedition management and bottom-up personnel and equipment tracking. Together, the base tables and views form a complete operational picture: from the planning of expedition 8189498 through the deployment of sled Extended Review, the recording of temperature observation 2986222, the mapping of coast area Extended Review, and the recognition of explorer Theodore Mcgrath with award 1000. This structure supports the full lifecycle of field operations, from initial planning through archival and recognition.