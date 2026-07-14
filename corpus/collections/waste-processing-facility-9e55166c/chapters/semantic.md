## Domain Modelling and Relational Materialisation

The waste management domain centres on the flow of refuse from jurisdictions through processing facilities, integrated systems, and ultimately into energy outputs that feed power grids. Seven core entity types capture this lifecycle: `WasteProcessingFacility` represents the physical plants where waste is treated; `WasteStream` describes the material entering those plants; `IntegratedWasteSystem` models the coordinated processing programmes operating within facilities; `EnergyOutput` records the electricity generated as a by-product; `PowerGrid` captures the distribution infrastructure receiving that electricity; `StaffMember` tracks the personnel operating the facilities; and `Jurisdiction` defines the geographic authorities responsible for waste collection and delivery. The relational schema materialises these entities through a combination of normalised base tables, junction tables for many-to-many associations, and materialised views that reconstruct domain facts from the normalised form.

**Table `WasteProcessingFacility`**

| facilityId | facilityName | location | operationalStatus | wasteCapacityTonsPerDay | energyOutputMWhPerDay | lastInspectionDate |
|---|---|---|---|---|---|---|
| 69447 | Integrated Protocol A | extended-location-99 | active | 8.95 | 8.45 | 2025-04-12T15:09:00 |
| 1040 | Extended Programme | integrated-location-100 | inactive | 12.90 | 12.90 | 2022-09-23T22:26:00 |
| 2986228 | Pilot Standard | seasonal-location-101 | under_maintenance | 16.85 | 17.35 | 2023-02-07T05:43:00 |
| ChIJvSxSbfdv5kcRanVzI8RRu20 | Baseline Framework D | regional-location-102 | active | 20.80 | 21.80 | 2024-07-18T12:00:00 |

The `WasteProcessingFacility` table is the anchor of the domain model. Each row represents a physical plant identified by `facilityId`, which serves as the primary key. The column `facilityName` stores human-readable identifiers such as "Integrated Protocol A" and "Baseline Framework D", while `location` holds location descriptors like "extended-location-99" and "regional-location-102". The `operationalStatus` column constrains the plant's state to values including `active`, `inactive`, and `under_maintenance` — the row with `facilityId` 69447 ("Integrated Protocol A") is active, whereas row 1040 ("Extended Programme") is inactive. Quantitative capacity is captured by `wasteCapacityTonsPerDay` (ranging from 8.95 to 20.80 tons per day in the sample data) and `energyOutputMWhPerDay` (8.45 to 21.80 MWh per day). The `lastInspectionDate` column records the most recent audit timestamp, such as "2025-04-12T15:09:00" for facility 69447.

**Table `WasteStream`**

| id | streamId | streamType | sourceJurisdiction | deliveryFrequency | averageWeightTons | contaminationRatePercent | facilityId | systemId | createdAt |
|---|---|---|---|---|---|---|---|---|---|
| 1000 | 2839512 | municipal_solid_waste | compact-source-86 | daily | 0.76 | 12.70 | 69447 | 1000 | 2025-01-01 00:14:00 |
| 1001 | e7a5231e-8fc3-11eb-924d-9cd76263cbd0 | recyclables | composite-source-87 | weekly | 0.4194766 | 14.40 | 1040 | 1001 | 2025-02-06 03:14:00 |
| 1002 | 3e41f384-9bac-11eb-a8a2-19ed5c03f8d3 | refuse | primary-source-88 | as_needed | 1.48 | 16.10 | 2986228 | 1002 | 2025-03-11 06:14:00 |
| 1003 | 1186092 | municipal_solid_waste | adaptive-source-89 | daily | 0.7 | 17.80 | ChIJvSxSbfdv5kcRanVzI8RRu20 | 1003 | 2025-04-16 09:14:00 |

`WasteStream` describes the material flowing into a facility. Its primary key is the surrogate `id` column, while `streamId` carries a business-level identifier that may be numeric (2839512) or UUID-formatted (e7a5231e-8fc3-11eb-924d-9cd76263cbd0). The `streamType` column classifies material as `municipal_solid_waste`, `recyclables`, or `refuse`. The `sourceJurisdiction` column stores a jurisdiction reference such as "compact-source-86" or "composite-source-87". Delivery logistics are captured by `deliveryFrequency` (values include `daily`, `weekly`, and `as_needed`), while `averageWeightTons` and `contaminationRatePercent` quantify the stream's mass and purity — for instance, stream 1000 weighs 0.76 tons with a 12.70% contamination rate. The foreign key `facilityId` links the stream to its destination plant, and `systemId` links it to the processing programme. The `createdAt` timestamp records when the stream record was created.

**Table `IntegratedWasteSystem`**

| id | systemId | systemName | efficiencyRating | landfillCapacitySavedPercent | energyGeneratedMWh | lastAuditDate | facilityId |
|---|---|---|---|---|---|---|---|
| 1000 | 8189503 | Legacy Programme D | 16.95 | 5.70 | 22.20 | 2023-10-23T09:51:00 | 69447 |
| 1001 | 3717623 | Regional Standard | 20.90 | 9.40 | 26.40 | 2024-03-07T16:08:00 | 1040 |
| 1002 | 7441161 | Seasonal Framework | 24.85 | 13.10 | 30.60 | 2025-08-18T23:25:00 | 2986228 |
| 1003 | 605963 | Integrated Protocol A | 28.80 | 16.80 | 34.80 | 2022-01-02T06:42:00 | ChIJvSxSbfdv5kcRanVzI8RRu20 |

`IntegratedWasteSystem` models the coordinated processing programmes operating within facilities. The surrogate primary key `id` distinguishes rows, while `systemId` holds a business identifier (8189503, 3717623, etc.). `systemName` provides a human label such as "Legacy Programme D" or "Integrated Protocol A". Performance metrics include `efficiencyRating` (16.95 to 28.80), `landfillCapacitySavedPercent` (5.70 to 16.80), and `energyGeneratedMWh` (22.20 to 34.80). The `lastAuditDate` column records the most recent audit, and `facilityId` is a foreign key pointing to the host facility.

**Table `EnergyOutput`**

| id | outputId | energyType | quantityMWh | gridConnectionStatus | qualityStandard | measurementDate | systemId | gridId | createdAt |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 3717613 | adaptive-energy-71 | 9.70 | connected | seasonal-quality-77 | 2024-07-01T18:54:00 | 1000 | 1437601 | 2025-01-01 00:14:00 |
| 2 | 937738 | distributed-energy-72 | 14.40 | disconnected | regional-quality-78 | 2025-12-12T01:11:00 | 1001 | 4277021 | 2025-02-06 03:14:00 |
| 3 | 974934 | baseline-energy-73 | 19.10 | maintenance | legacy-quality-79 | 2022-05-23T08:28:00 | 1002 | cb0a4823-4395-4437-b37e-f439932452f6 | 2025-03-11 06:14:00 |
| 4 | 5f8f9bda-8fcd-11eb-924d-9cd76263cbd0 | pilot-energy-74 | 23.80 | connected | compact-quality-80 | 2023-10-07T15:45:00 | 1003 | 726042 | 2025-04-16 09:14:00 |

`EnergyOutput` records the electricity generated by an integrated system and delivered to a power grid. The surrogate `id` is the primary key; `outputId` carries a business identifier that may be numeric (3717613) or UUID-formatted (5f8f9bda-8fcd-11eb-924d-9cd76263cbd0). `energyType` classifies the output as `adaptive-energy-71`, `distributed-energy-72`, `baseline-energy-73`, or `pilot-energy-74`. The `quantityMWh` column stores the energy volume (9.70 to 23.80 MWh), while `gridConnectionStatus` indicates whether the output is `connected`, `disconnected`, or in `maintenance`. `qualityStandard` stores a label such as `seasonal-quality-77` or `compact-quality-80`. The `measurementDate` records when the energy was measured, and the foreign keys `systemId` and `gridId` link the output to its source system and destination grid respectively. The `createdAt` timestamp records row creation.

**Table `PowerGrid`**

| gridId | gridOperator | voltageLevel | capacityMVA | lastMaintenanceDate |
|---|---|---|---|---|
| 1437601 | seasonal-grid-47 | compact-voltage-14 | 3.20 | 2024-03-27T14:06:00 |
| 4277021 | regional-grid-48 | composite-voltage-15 | 6.40 | 2025-08-11T21:23:00 |
| cb0a4823-4395-4437-b37e-f439932452f6 | legacy-grid-49 | primary-voltage-16 | 9.60 | 2022-01-22T04:40:00 |
| 726042 | compact-grid-50 | adaptive-voltage-17 | 12.80 | 2023-06-06T11:57:00 |

`PowerGrid` captures the distribution infrastructure. The primary key `gridId` identifies each grid (1437601, 4277021, cb0a4823-4395-4437-b37e-f439932452f6, 726042). `gridOperator` stores the operator name (e.g., "seasonal-grid-47", "compact-grid-50"), `voltageLevel` classifies the grid (compact-voltage-14 through adaptive-voltage-17), `capacityMVA` records the grid's capacity (3.20 to 12.80 MVA), and `lastMaintenanceDate` records the most recent maintenance event.

**Table `StaffMember`**

| id | staffId | fullName | roleTitle | employmentStatus | yearsOfExperience | educationLevel | facilityId | memberId | systemId |
|---|---|---|---|---|---|---|---|---|---|
| 100 | 937735 | Theodore Mcgrath | Chief_Financial_Officer | full_time | 7 | bachelors | 69447 | 100 | 1000 |
| 101 | 3158139 | Account Name | Accounting_Staff | part_time | 10 | masters | 1040 | 101 | 1001 |
| 102 | 8189502 | Saipan International Airport | IT_Staff | contract | 13 | phd | 2986228 | 102 | 1002 |
| 103 | 69438 | Norma Fisher | Executive_Team_Member | full_time | 16 | bachelors | ChIJvSxSbfdv5kcRanVzI8RRu20 | 103 | 1003 |

`StaffMember` tracks personnel. The surrogate `id` is the primary key; `staffId` carries a business identifier (937735, 3158139, etc.). `fullName` stores the person's name (Theodore Mcgrath, Account Name, Saipan International Airport, Norma Fisher). `roleTitle` classifies the position (Chief_Financial_Officer, Accounting_Staff, IT_Staff, Executive_Team_Member), and `employmentStatus` records full_time, part_time, or contract. `yearsOfExperience` ranges from 7 to 16, and `educationLevel` stores bachelors, masters, or phd. The foreign key `facilityId` links the staff member to their host facility, while `memberId` and `systemId` provide additional business-level references.

**Table `Jurisdiction`**

| id | jurisdictionId | jurisdictionName | jurisdictionType | population | wasteGenerationRateTonsPerCapita |
|---|---|---|---|---|---|
| 1000 | 8387534 | Pilot Cluster | county | 42 | 19.20 |
| 1001 | 99654 | Baseline Review | city | 49 | 22.40 |
| 1002 | lu_tax_code_template_m_I_4 | Distributed Initiative A | township | 56 | 25.60 |
| 1003 | 1186090 | Adaptive Model | county | 63 | 28.80 |

`Jurisdiction` defines the geographic authorities. The primary key `jurisdictionId` identifies each jurisdiction (compact-source-86, composite-source-87, primary-source-88, adaptive-source-89). `jurisdictionName` stores the authority's name, `region` classifies the geographic area, `population` records the served population, `wasteGenerationRate` quantifies waste production, and `lastAssessmentDate` records the most recent evaluation.

The many-to-many relationships between these entities are materialised through junction tables. Each junction table contains two foreign key columns referencing the primary keys of the associated entities, plus a surrogate primary key.

**Table `WasteProcessingFacilityWasteStream`**

| facilityId | streamId |
|---|---|
| 69447 | 1000 |
| 69447 | 1001 |
| 1040 | 1001 |
| 1040 | 1002 |
| 2986228 | 1002 |
| 2986228 | 1003 |
| ChIJvSxSbfdv5kcRanVzI8RRu20 | 1003 |
| ChIJvSxSbfdv5kcRanVzI8RRu20 | 1000 |

The `WasteProcessingFacilityWasteStream` junction table links facilities to waste streams. Its surrogate `id` is the primary key, while `facilityId` and `streamId` are foreign keys referencing `WasteProcessingFacility.facilityId` and `WasteStream.streamId` respectively. This table captures the assignment of waste streams to processing facilities.

**Table `WasteProcessingFacilityJurisdiction`**

| facilityId | jurisdictionId |
|---|---|
| 69447 | 1000 |
| 69447 | 1001 |
| 1040 | 1001 |
| 1040 | 1002 |
| 2986228 | 1002 |
| 2986228 | 1003 |
| ChIJvSxSbfdv5kcRanVzI8RRu20 | 1003 |
| ChIJvSxSbfdv5kcRanVzI8RRu20 | 1000 |

`WasteProcessingFacilityJurisdiction` links facilities to jurisdictions. The surrogate `id` is the primary key, and the foreign keys `facilityId` and `jurisdictionId` reference the respective entity primary keys. This table records which jurisdictions supply waste to which facilities.

**Table `WasteProcessingFacilityStaffMember`**

| facilityId | memberId |
|---|---|
| 69447 | 100 |
| 69447 | 101 |
| 1040 | 101 |
| 1040 | 102 |
| 2986228 | 102 |
| 2986228 | 103 |
| ChIJvSxSbfdv5kcRanVzI8RRu20 | 103 |
| ChIJvSxSbfdv5kcRanVzI8RRu20 | 100 |

`WasteProcessingFacilityStaffMember` links facilities to staff members. The surrogate `id` is the primary key, with foreign keys `facilityId` and `staffId` referencing `WasteProcessingFacility.facilityId` and `StaffMember.staffId`. This table captures staff assignments to facilities.

**Table `IntegratedWasteSystemWasteStream`**

| systemId | streamId |
|---|---|
| 1000 | 1000 |
| 1000 | 1001 |
| 1001 | 1001 |
| 1001 | 1002 |
| 1002 | 1002 |
| 1002 | 1003 |
| 1003 | 1003 |
| 1003 | 1000 |

`IntegratedWasteSystemWasteStream` links integrated systems to waste streams. The surrogate `id` is the primary key, and the foreign keys `systemId` and `streamId` reference `IntegratedWasteSystem.systemId` and `WasteStream.streamId`. This table records which waste streams are processed by which integrated systems.

**Table `IntegratedWasteSystemEnergyOutput`**

| systemId | outputId |
|---|---|
| 1000 | 1 |
| 1000 | 2 |
| 1001 | 2 |
| 1001 | 3 |
| 1002 | 3 |
| 1002 | 4 |
| 1003 | 4 |
| 1003 | 1 |

`IntegratedWasteSystemEnergyOutput` links integrated systems to energy outputs. The surrogate `id` is the primary key, with foreign keys `systemId` and `outputId` referencing `IntegratedWasteSystem.systemId` and `EnergyOutput.outputId`. This table captures the production relationship between systems and their energy outputs.

**Table `PowerGridEnergyOutput`**

| gridId | outputId |
|---|---|
| 1437601 | 1 |
| 1437601 | 2 |
| 4277021 | 2 |
| 4277021 | 3 |
| cb0a4823-4395-4437-b37e-f439932452f6 | 3 |
| cb0a4823-4395-4437-b37e-f439932452f6 | 4 |
| 726042 | 4 |
| 726042 | 1 |

`PowerGridEnergyOutput` links power grids to energy outputs. The surrogate `id` is the primary key, and the foreign keys `gridId` and `outputId` reference `PowerGrid.gridId` and `EnergyOutput.outputId`. This table records which energy outputs feed into which grids.

**Table `PowerGridJurisdiction`**

| gridId | jurisdictionId |
|---|---|
| 1437601 | 1000 |
| 1437601 | 1001 |
| 4277021 | 1001 |
| 4277021 | 1002 |
| cb0a4823-4395-4437-b37e-f439932452f6 | 1002 |
| cb0a4823-4395-4437-b37e-f439932452f6 | 1003 |
| 726042 | 1003 |
| 726042 | 1000 |

`PowerGridJurisdiction` links power grids to jurisdictions. The surrogate `id` is the primary key, with foreign keys `gridId` and `jurisdictionId` referencing `PowerGrid.gridId` and `Jurisdiction.jurisdictionId`. This table captures the relationship between distribution grids and the jurisdictions they serve.

**Table `JurisdictionWasteProcessingFacility`**

| jurisdictionId | facilityId |
|---|---|
| 1000 | 69447 |
| 1000 | 1040 |
| 1001 | 1040 |
| 1001 | 2986228 |
| 1002 | 2986228 |
| 1002 | ChIJvSxSbfdv5kcRanVzI8RRu20 |
| 1003 | ChIJvSxSbfdv5kcRanVzI8RRu20 |
| 1003 | 69447 |

`JurisdictionWasteProcessingFacility` provides an alternative junction linking jurisdictions to facilities. The surrogate `id` is the primary key, and the foreign keys `jurisdictionId` and `facilityId` reference the respective entity primary keys. This table mirrors the jurisdiction-to-facility relationship from the opposite direction.

**Table `JurisdictionPowerGrid`**

| jurisdictionId | gridId |
|---|---|
| 1000 | 1437601 |
| 1000 | 4277021 |
| 1001 | 4277021 |
| 1001 | cb0a4823-4395-4437-b37e-f439932452f6 |
| 1002 | cb0a4823-4395-4437-b37e-f439932452f6 |
| 1002 | 726042 |
| 1003 | 726042 |
| 1003 | 1437601 |

`JurisdictionPowerGrid` links jurisdictions to power grids. The surrogate `id` is the primary key, with foreign keys `jurisdictionId` and `gridId` referencing `Jurisdiction.jurisdictionId` and `PowerGrid.gridId`. This table records which jurisdictions are served by which power grids.

The materialised views reconstruct domain facts by joining the normalised tables. Each view answers a specific analytical question by denormalising the relevant entities and their relationships into a single flat result set.

**View `waste_processing_facility_waste_stream_detail_view`**

```sql
CREATE VIEW waste_processing_facility_waste_stream_detail_view AS
SELECT a.facilityId, a.facilityName, a.location, b.id AS stream_id, b.streamId AS stream_streamId, b.streamType AS stream_streamType
FROM WasteProcessingFacility a
  JOIN WasteProcessingFacilityWasteStream j ON j.facilityId = a.facilityId
  JOIN WasteStream b ON b.id = j.streamId;
```

| facilityId | facilityName | location | stream_id | stream_streamId | stream_streamType |
|---|---|---|---|---|---|
| 69447 | Integrated Protocol A | extended-location-99 | 1000 | 2839512 | municipal_solid_waste |
| 69447 | Integrated Protocol A | extended-location-99 | 1001 | e7a5231e-8fc3-11eb-924d-9cd76263cbd0 | recyclables |
| 1040 | Extended Programme | integrated-location-100 | 1001 | e7a5231e-8fc3-11eb-924d-9cd76263cbd0 | recyclables |
| 1040 | Extended Programme | integrated-location-100 | 1002 | 3e41f384-9bac-11eb-a8a2-19ed5c03f8d3 | refuse |
| 2986228 | Pilot Standard | seasonal-location-101 | 1002 | 3e41f384-9bac-11eb-a8a2-19ed5c03f8d3 | refuse |
| 2986228 | Pilot Standard | seasonal-location-101 | 1003 | 1186092 | municipal_solid_waste |
| ChIJvSxSbfdv5kcRanVzI8RRu20 | Baseline Framework D | regional-location-102 | 1003 | 1186092 | municipal_solid_waste |
| ChIJvSxSbfdv5kcRanVzI8RRu20 | Baseline Framework D | regional-location-102 | 1000 | 2839512 | municipal_solid_waste |

The `waste_processing_facility_waste_stream_detail_view` joins `WasteProcessingFacility` with `WasteProcessingFacilityWasteStream` and `WasteStream` to answer the question: "Which waste streams are assigned to which facilities, and what are their characteristics?" A row from this view might show facility "Integrated Protocol A" (facilityId 69447) processing a municipal solid waste stream (streamId 2839512) with a 12.70% contamination rate, delivering daily at 0.76 tons.

**View `waste_processing_facility_jurisdiction_detail_view`**

```sql
CREATE VIEW waste_processing_facility_jurisdiction_detail_view AS
SELECT a.facilityId, a.facilityName, a.location, b.id AS jurisdiction_id, b.jurisdictionId AS jurisdiction_jurisdictionId, b.jurisdictionName AS jurisdiction_jurisdictionName
FROM WasteProcessingFacility a
  JOIN WasteProcessingFacilityJurisdiction j ON j.facilityId = a.facilityId
  JOIN Jurisdiction b ON b.id = j.jurisdictionId;
```

| facilityId | facilityName | location | jurisdiction_id | jurisdiction_jurisdictionId | jurisdiction_jurisdictionName |
|---|---|---|---|---|---|
| 69447 | Integrated Protocol A | extended-location-99 | 1000 | 8387534 | Pilot Cluster |
| 69447 | Integrated Protocol A | extended-location-99 | 1001 | 99654 | Baseline Review |
| 1040 | Extended Programme | integrated-location-100 | 1001 | 99654 | Baseline Review |
| 1040 | Extended Programme | integrated-location-100 | 1002 | lu_tax_code_template_m_I_4 | Distributed Initiative A |
| 2986228 | Pilot Standard | seasonal-location-101 | 1002 | lu_tax_code_template_m_I_4 | Distributed Initiative A |
| 2986228 | Pilot Standard | seasonal-location-101 | 1003 | 1186090 | Adaptive Model |
| ChIJvSxSbfdv5kcRanVzI8RRu20 | Baseline Framework D | regional-location-102 | 1003 | 1186090 | Adaptive Model |
| ChIJvSxSbfdv5kcRanVzI8RRu20 | Baseline Framework D | regional-location-102 | 1000 | 8387534 | Pilot Cluster |

The `waste_processing_facility_jurisdiction_detail_view` joins `WasteProcessingFacility` with `WasteProcessingFacilityJurisdiction` and `Jurisdiction` to answer: "Which jurisdictions supply waste to which facilities?" A representative row links facility "Baseline Framework D" (facilityId ChIJvSxSbfdv5kcRanVzI8RRu20) to its supplying jurisdiction, enabling operators to trace waste origins.

**View `waste_processing_facility_staff_member_detail_view`**

```sql
CREATE VIEW waste_processing_facility_staff_member_detail_view AS
SELECT a.facilityId, a.facilityName, a.location, b.id AS member_id, b.staffId AS member_staffId, b.fullName AS member_fullName
FROM WasteProcessingFacility a
  JOIN WasteProcessingFacilityStaffMember j ON j.facilityId = a.facilityId
  JOIN StaffMember b ON b.id = j.memberId;
```

| facilityId | facilityName | location | member_id | member_staffId | member_fullName |
|---|---|---|---|---|---|
| 69447 | Integrated Protocol A | extended-location-99 | 100 | 937735 | Theodore Mcgrath |
| 69447 | Integrated Protocol A | extended-location-99 | 101 | 3158139 | Account Name |
| 1040 | Extended Programme | integrated-location-100 | 101 | 3158139 | Account Name |
| 1040 | Extended Programme | integrated-location-100 | 102 | 8189502 | Saipan International Airport |
| 2986228 | Pilot Standard | seasonal-location-101 | 102 | 8189502 | Saipan International Airport |
| 2986228 | Pilot Standard | seasonal-location-101 | 103 | 69438 | Norma Fisher |
| ChIJvSxSbfdv5kcRanVzI8RRu20 | Baseline Framework D | regional-location-102 | 103 | 69438 | Norma Fisher |
| ChIJvSxSbfdv5kcRanVzI8RRu20 | Baseline Framework D | regional-location-102 | 100 | 937735 | Theodore Mcgrath |

The `waste_processing_facility_staff_member_detail_view` joins `WasteProcessingFacility` with `WasteProcessingFacilityStaffMember` and `StaffMember` to answer: "Which staff members work at which facilities, and what are their qualifications?" A row from this view might show facility "Integrated Protocol A" (facilityId 69447) employing Theodore Mcgrath as Chief_Financial_Officer with 7 years of experience and a bachelor's degree.

**View `waste_stream_waste_processing_facility_view`**

```sql
CREATE VIEW waste_stream_waste_processing_facility_view AS
SELECT a.id, a.streamId, a.streamType, a.sourceJurisdiction, b.facilityId AS facility_facilityId, b.facilityName AS facility_facilityName, b.location AS facility_location
FROM WasteStream a JOIN WasteProcessingFacility b ON a.facilityId = b.facilityId;
```

| id | streamId | streamType | sourceJurisdiction | facility_facilityId | facility_facilityName | facility_location |
|---|---|---|---|---|---|---|
| 1000 | 2839512 | municipal_solid_waste | compact-source-86 | 69447 | Integrated Protocol A | extended-location-99 |
| 1001 | e7a5231e-8fc3-11eb-924d-9cd76263cbd0 | recyclables | composite-source-87 | 1040 | Extended Programme | integrated-location-100 |
| 1002 | 3e41f384-9bac-11eb-a8a2-19ed5c03f8d3 | refuse | primary-source-88 | 2986228 | Pilot Standard | seasonal-location-101 |
| 1003 | 1186092 | municipal_solid_waste | adaptive-source-89 | ChIJvSxSbfdv5kcRanVzI8RRu20 | Baseline Framework D | regional-location-102 |

The `waste_stream_waste_processing_facility_view` joins `WasteStream` with `WasteProcessingFacilityWasteStream` and `WasteProcessingFacility` to answer the inverse question: "Which facility processes a given waste stream?" A row might show stream 2839512 (municipal_solid_waste) being processed at facility 69447 ("Integrated Protocol A"), with the stream's average weight of 0.76 tons and contamination rate of 12.70% visible alongside the facility's capacity of 8.95 tons per day.

**View `waste_stream_integrated_waste_system_view`**

```sql
CREATE VIEW waste_stream_integrated_waste_system_view AS
SELECT a.id, a.streamId, a.streamType, a.sourceJurisdiction, b.id AS system_id, b.systemId AS system_systemId, b.systemName AS system_systemName
FROM WasteStream a JOIN IntegratedWasteSystem b ON a.systemId = b.id;
```

| id | streamId | streamType | sourceJurisdiction | system_id | system_systemId | system_systemName |
|---|---|---|---|---|---|---|
| 1000 | 2839512 | municipal_solid_waste | compact-source-86 | 1000 | 8189503 | Legacy Programme D |
| 1001 | e7a5231e-8fc3-11eb-924d-9cd76263cbd0 | recyclables | composite-source-87 | 1001 | 3717623 | Regional Standard |
| 1002 | 3e41f384-9bac-11eb-a8a2-19ed5c03f8d3 | refuse | primary-source-88 | 1002 | 7441161 | Seasonal Framework |
| 1003 | 1186092 | municipal_solid_waste | adaptive-source-89 | 1003 | 605963 | Integrated Protocol A |

The `waste_stream_integrated_waste_system_view` joins `WasteStream` with `IntegratedWasteSystemWasteStream` and `IntegratedWasteSystem` to answer: "Which integrated system processes a given waste stream?" A row might link stream 2839512 to system 8189503 ("Legacy Programme D") with an efficiency rating of 16.95 and energy generation of 22.20 MWh.

**View `integrated_waste_system_waste_stream_detail_view`**

```sql
CREATE VIEW integrated_waste_system_waste_stream_detail_view AS
SELECT a.id, a.systemId, a.systemName, b.id AS stream_id, b.streamId AS stream_streamId, b.streamType AS stream_streamType
FROM IntegratedWasteSystem a
  JOIN IntegratedWasteSystemWasteStream j ON j.systemId = a.id
  JOIN WasteStream b ON b.id = j.streamId;
```

| id | systemId | systemName | stream_id | stream_streamId | stream_streamType |
|---|---|---|---|---|---|
| 1000 | 8189503 | Legacy Programme D | 1000 | 2839512 | municipal_solid_waste |
| 1000 | 8189503 | Legacy Programme D | 1001 | e7a5231e-8fc3-11eb-924d-9cd76263cbd0 | recyclables |
| 1001 | 3717623 | Regional Standard | 1001 | e7a5231e-8fc3-11eb-924d-9cd76263cbd0 | recyclables |
| 1001 | 3717623 | Regional Standard | 1002 | 3e41f384-9bac-11eb-a8a2-19ed5c03f8d3 | refuse |
| 1002 | 7441161 | Seasonal Framework | 1002 | 3e41f384-9bac-11eb-a8a2-19ed5c03f8d3 | refuse |
| 1002 | 7441161 | Seasonal Framework | 1003 | 1186092 | municipal_solid_waste |
| 1003 | 605963 | Integrated Protocol A | 1003 | 1186092 | municipal_solid_waste |
| 1003 | 605963 | Integrated Protocol A | 1000 | 2839512 | municipal_solid_waste |

The `integrated_waste_system_waste_stream_detail_view` joins `IntegratedWasteSystem` with `IntegratedWasteSystemWasteStream` and `WasteStream` to answer: "Which waste streams are processed by a given integrated system, and what are their properties?" A row might show system "Legacy Programme D" (systemId 8189503) processing stream 2839512 (municipal_solid_waste, 0.76 tons, 12.70% contamination).

**View `integrated_waste_system_waste_processing_facility_view`**

```sql
CREATE VIEW integrated_waste_system_waste_processing_facility_view AS
SELECT a.id, a.systemId, a.systemName, a.efficiencyRating, b.facilityId AS facility_facilityId, b.facilityName AS facility_facilityName, b.location AS facility_location
FROM IntegratedWasteSystem a JOIN WasteProcessingFacility b ON a.facilityId = b.facilityId;
```

| id | systemId | systemName | efficiencyRating | facility_facilityId | facility_facilityName | facility_location |
|---|---|---|---|---|---|---|
| 1000 | 8189503 | Legacy Programme D | 16.95 | 69447 | Integrated Protocol A | extended-location-99 |
| 1001 | 3717623 | Regional Standard | 20.90 | 1040 | Extended Programme | integrated-location-100 |
| 1002 | 7441161 | Seasonal Framework | 24.85 | 2986228 | Pilot Standard | seasonal-location-101 |
| 1003 | 605963 | Integrated Protocol A | 28.80 | ChIJvSxSbfdv5kcRanVzI8RRu20 | Baseline Framework D | regional-location-102 |

The `integrated_waste_system_waste_processing_facility_view` joins `IntegratedWasteSystem` with `WasteProcessingFacility` to answer: "Which facility hosts a given integrated system?" A row might show system "Legacy Programme D" (systemId 8189503) hosted at facility 69447 ("Integrated Protocol A"), with the system's efficiency rating of 16.95 and the facility's waste capacity of 8.95 tons per day both visible.

**View `integrated_waste_system_energy_output_detail_view`**

```sql
CREATE VIEW integrated_waste_system_energy_output_detail_view AS
SELECT a.id, a.systemId, a.systemName, b.id AS output_id, b.outputId AS output_outputId, b.energyType AS output_energyType
FROM IntegratedWasteSystem a
  JOIN IntegratedWasteSystemEnergyOutput j ON j.systemId = a.id
  JOIN EnergyOutput b ON b.id = j.outputId;
```

| id | systemId | systemName | output_id | output_outputId | output_energyType |
|---|---|---|---|---|---|
| 1000 | 8189503 | Legacy Programme D | 1 | 3717613 | adaptive-energy-71 |
| 1000 | 8189503 | Legacy Programme D | 2 | 937738 | distributed-energy-72 |
| 1001 | 3717623 | Regional Standard | 2 | 937738 | distributed-energy-72 |
| 1001 | 3717623 | Regional Standard | 3 | 974934 | baseline-energy-73 |
| 1002 | 7441161 | Seasonal Framework | 3 | 974934 | baseline-energy-73 |
| 1002 | 7441161 | Seasonal Framework | 4 | 5f8f9bda-8fcd-11eb-924d-9cd76263cbd0 | pilot-energy-74 |
| 1003 | 605963 | Integrated Protocol A | 4 | 5f8f9bda-8fcd-11eb-924d-9cd76263cbd0 | pilot-energy-74 |
| 1003 | 605963 | Integrated Protocol A | 1 | 3717613 | adaptive-energy-71 |

The `integrated_waste_system_energy_output_detail_view` joins `IntegratedWasteSystem` with `IntegratedWasteSystemEnergyOutput` and `EnergyOutput` to answer: "Which energy outputs are produced by a given integrated system?" A row might show system "Legacy Programme D" (systemId 8189503) producing energy output 3717613 (adaptive-energy-71, 9.70 MWh, connected status).

**View `energy_output_integrated_waste_system_view`**

```sql
CREATE VIEW energy_output_integrated_waste_system_view AS
SELECT a.id, a.outputId, a.energyType, a.quantityMWh, b.id AS system_id, b.systemId AS system_systemId, b.systemName AS system_systemName
FROM EnergyOutput a JOIN IntegratedWasteSystem b ON a.systemId = b.id;
```

| id | outputId | energyType | quantityMWh | system_id | system_systemId | system_systemName |
|---|---|---|---|---|---|---|
| 1 | 3717613 | adaptive-energy-71 | 9.70 | 1000 | 8189503 | Legacy Programme D |
| 2 | 937738 | distributed-energy-72 | 14.40 | 1001 | 3717623 | Regional Standard |
| 3 | 974934 | baseline-energy-73 | 19.10 | 1002 | 7441161 | Seasonal Framework |
| 4 | 5f8f9bda-8fcd-11eb-924d-9cd76263cbd0 | pilot-energy-74 | 23.80 | 1003 | 605963 | Integrated Protocol A |

The `energy_output_integrated_waste_system_view` joins `EnergyOutput` with `IntegratedWasteSystemEnergyOutput` and `IntegratedWasteSystem` to answer the inverse: "Which integrated system produces a given energy output?" A row might link energy output 3717613 (adaptive-energy-71, 9.70 MWh) to system 8189503 ("Legacy Programme D") with efficiency rating 16.95.

**View `energy_output_power_grid_view`**

```sql
CREATE VIEW energy_output_power_grid_view AS
SELECT a.id, a.outputId, a.energyType, a.quantityMWh, b.gridId AS grid_gridId, b.gridOperator AS grid_gridOperator, b.voltageLevel AS grid_voltageLevel
FROM EnergyOutput a JOIN PowerGrid b ON a.gridId = b.gridId;
```

| id | outputId | energyType | quantityMWh | grid_gridId | grid_gridOperator | grid_voltageLevel |
|---|---|---|---|---|---|---|
| 1 | 3717613 | adaptive-energy-71 | 9.70 | 1437601 | seasonal-grid-47 | compact-voltage-14 |
| 2 | 937738 | distributed-energy-72 | 14.40 | 4277021 | regional-grid-48 | composite-voltage-15 |
| 3 | 974934 | baseline-energy-73 | 19.10 | cb0a4823-4395-4437-b37e-f439932452f6 | legacy-grid-49 | primary-voltage-16 |
| 4 | 5f8f9bda-8fcd-11eb-924d-9cd76263cbd0 | pilot-energy-74 | 23.80 | 726042 | compact-grid-50 | adaptive-voltage-17 |

The `energy_output_power_grid_view` joins `EnergyOutput` with `PowerGridEnergyOutput` and `PowerGrid` to answer: "Which power grid receives a given energy output?" A row might link energy output 3717613 (9.70 MWh, connected) to grid 1437601 (operator "seasonal-grid-47", voltage compact-voltage-14, capacity 3.20 MVA).

**View `power_grid_energy_output_detail_view`**

```sql
CREATE VIEW power_grid_energy_output_detail_view AS
SELECT a.gridId, a.gridOperator, a.voltageLevel, b.id AS output_id, b.outputId AS output_outputId, b.energyType AS output_energyType
FROM PowerGrid a
  JOIN PowerGridEnergyOutput j ON j.gridId = a.gridId
  JOIN EnergyOutput b ON b.id = j.outputId;
```

| gridId | gridOperator | voltageLevel | output_id | output_outputId | output_energyType |
|---|---|---|---|---|---|
| 1437601 | seasonal-grid-47 | compact-voltage-14 | 1 | 3717613 | adaptive-energy-71 |
| 1437601 | seasonal-grid-47 | compact-voltage-14 | 2 | 937738 | distributed-energy-72 |
| 4277021 | regional-grid-48 | composite-voltage-15 | 2 | 937738 | distributed-energy-72 |
| 4277021 | regional-grid-48 | composite-voltage-15 | 3 | 974934 | baseline-energy-73 |
| cb0a4823-4395-4437-b37e-f439932452f6 | legacy-grid-49 | primary-voltage-16 | 3 | 974934 | baseline-energy-73 |
| cb0a4823-4395-4437-b37e-f439932452f6 | legacy-grid-49 | primary-voltage-16 | 4 | 5f8f9bda-8fcd-11eb-924d-9cd76263cbd0 | pilot-energy-74 |
| 726042 | compact-grid-50 | adaptive-voltage-17 | 4 | 5f8f9bda-8fcd-11eb-924d-9cd76263cbd0 | pilot-energy-74 |
| 726042 | compact-grid-50 | adaptive-voltage-17 | 1 | 3717613 | adaptive-energy-71 |

The `power_grid_energy_output_detail_view` joins `PowerGrid` with `PowerGridEnergyOutput` and `EnergyOutput` to answer: "Which energy outputs feed into a given power grid?" A row might show grid 1437601 ("seasonal-grid-47") receiving energy output 3717613 (adaptive-energy-71, 9.70 MWh, connected, seasonal-quality-77).

**View `power_grid_jurisdiction_detail_view`**

```sql
CREATE VIEW power_grid_jurisdiction_detail_view AS
SELECT a.gridId, a.gridOperator, a.voltageLevel, b.id AS jurisdiction_id, b.jurisdictionId AS jurisdiction_jurisdictionId, b.jurisdictionName AS jurisdiction_jurisdictionName
FROM PowerGrid a
  JOIN PowerGridJurisdiction j ON j.gridId = a.gridId
  JOIN Jurisdiction b ON b.id = j.jurisdictionId;
```

| gridId | gridOperator | voltageLevel | jurisdiction_id | jurisdiction_jurisdictionId | jurisdiction_jurisdictionName |
|---|---|---|---|---|---|
| 1437601 | seasonal-grid-47 | compact-voltage-14 | 1000 | 8387534 | Pilot Cluster |
| 1437601 | seasonal-grid-47 | compact-voltage-14 | 1001 | 99654 | Baseline Review |
| 4277021 | regional-grid-48 | composite-voltage-15 | 1001 | 99654 | Baseline Review |
| 4277021 | regional-grid-48 | composite-voltage-15 | 1002 | lu_tax_code_template_m_I_4 | Distributed Initiative A |
| cb0a4823-4395-4437-b37e-f439932452f6 | legacy-grid-49 | primary-voltage-16 | 1002 | lu_tax_code_template_m_I_4 | Distributed Initiative A |
| cb0a4823-4395-4437-b37e-f439932452f6 | legacy-grid-49 | primary-voltage-16 | 1003 | 1186090 | Adaptive Model |
| 726042 | compact-grid-50 | adaptive-voltage-17 | 1003 | 1186090 | Adaptive Model |
| 726042 | compact-grid-50 | adaptive-voltage-17 | 1000 | 8387534 | Pilot Cluster |

The `power_grid_jurisdiction_detail_view` joins `PowerGrid` with `PowerGridJurisdiction` and `Jurisdiction` to answer: "Which jurisdictions are served by a given power grid?" A row might link grid 1437601 ("seasonal-grid-47") to its served jurisdiction, enabling operators to trace the geographic reach of each grid.

**View `staff_member_waste_processing_facility_view`**

```sql
CREATE VIEW staff_member_waste_processing_facility_view AS
SELECT a.id, a.staffId, a.fullName, a.roleTitle, b.facilityId AS facility_facilityId, b.facilityName AS facility_facilityName, b.location AS facility_location
FROM StaffMember a JOIN WasteProcessingFacility b ON a.facilityId = b.facilityId;
```

| id | staffId | fullName | roleTitle | facility_facilityId | facility_facilityName | facility_location |
|---|---|---|---|---|---|---|
| 100 | 937735 | Theodore Mcgrath | Chief_Financial_Officer | 69447 | Integrated Protocol A | extended-location-99 |
| 101 | 3158139 | Account Name | Accounting_Staff | 1040 | Extended Programme | integrated-location-100 |
| 102 | 8189502 | Saipan International Airport | IT_Staff | 2986228 | Pilot Standard | seasonal-location-101 |
| 103 | 69438 | Norma Fisher | Executive_Team_Member | ChIJvSxSbfdv5kcRanVzI8RRu20 | Baseline Framework D | regional-location-102 |

The `staff_member_waste_processing_facility_view` joins `StaffMember` with `WasteProcessingFacilityStaffMember` and `WasteProcessingFacility` to answer: "Which facility employs a given staff member?" A row might show Theodore Mcgrath (staffId 937735, Chief_Financial_Officer) employed at facility 69447 ("Integrated Protocol A"), with the facility's operational status of active and waste capacity of 8.95 tons per day visible.

**View `staff_member_staff_member_view`**

```sql
CREATE VIEW staff_member_staff_member_view AS
SELECT a.id, a.staffId, a.fullName, a.roleTitle, b.id AS member_id, b.staffId AS member_staffId, b.fullName AS member_fullName
FROM StaffMember a JOIN StaffMember b ON a.memberId = b.id;
```

| id | staffId | fullName | roleTitle | member_id | member_staffId | member_fullName |
|---|---|---|---|---|---|---|
| 100 | 937735 | Theodore Mcgrath | Chief_Financial_Officer | 100 | 937735 | Theodore Mcgrath |
| 101 | 3158139 | Account Name | Accounting_Staff | 101 | 3158139 | Account Name |
| 102 | 8189502 | Saipan International Airport | IT_Staff | 102 | 8189502 | Saipan International Airport |
| 103 | 69438 | Norma Fisher | Executive_Team_Member | 103 | 69438 | Norma Fisher |

The `staff_member_staff_member_view` is a self-join or identity view on `StaffMember` that provides a denormalised view of staff records, potentially enriching the base table with additional computed columns or cross-references. A row might show Account Name (staffId 3158139, Accounting_Staff, part_time, 10 years experience, masters degree) employed at facility 1040 ("Extended Programme").

**View `staff_member_integrated_waste_system_view`**

```sql
CREATE VIEW staff_member_integrated_waste_system_view AS
SELECT a.id, a.staffId, a.fullName, a.roleTitle, b.id AS system_id, b.systemId AS system_systemId, b.systemName AS system_systemName
FROM StaffMember a JOIN IntegratedWasteSystem b ON a.systemId = b.id;
```

| id | staffId | fullName | roleTitle | system_id | system_systemId | system_systemName |
|---|---|---|---|---|---|---|
| 100 | 937735 | Theodore Mcgrath | Chief_Financial_Officer | 1000 | 8189503 | Legacy Programme D |
| 101 | 3158139 | Account Name | Accounting_Staff | 1001 | 3717623 | Regional Standard |
| 102 | 8189502 | Saipan International Airport | IT_Staff | 1002 | 7441161 | Seasonal Framework |
| 103 | 69438 | Norma Fisher | Executive_Team_Member | 1003 | 605963 | Integrated Protocol A |

The `staff_member_integrated_waste_system_view` joins `StaffMember` with `IntegratedWasteSystem` to answer: "Which integrated system is associated with a given staff member?" A row might link Theodore Mcgrath (facility 69447) to system 8189503 ("Legacy Programme D") with efficiency rating 16.95 and energy generation of 22.20 MWh.

**View `jurisdiction_waste_processing_facility_detail_view`**

```sql
CREATE VIEW jurisdiction_waste_processing_facility_detail_view AS
SELECT a.id, a.jurisdictionId, a.jurisdictionName, b.facilityId AS facility_facilityId, b.facilityName AS facility_facilityName, b.location AS facility_location
FROM Jurisdiction a
  JOIN JurisdictionWasteProcessingFacility j ON j.jurisdictionId = a.id
  JOIN WasteProcessingFacility b ON b.facilityId = j.facilityId;
```

| id | jurisdictionId | jurisdictionName | facility_facilityId | facility_facilityName | facility_location |
|---|---|---|---|---|---|
| 1000 | 8387534 | Pilot Cluster | 69447 | Integrated Protocol A | extended-location-99 |
| 1000 | 8387534 | Pilot Cluster | 1040 | Extended Programme | integrated-location-100 |
| 1001 | 99654 | Baseline Review | 1040 | Extended Programme | integrated-location-100 |
| 1001 | 99654 | Baseline Review | 2986228 | Pilot Standard | seasonal-location-101 |
| 1002 | lu_tax_code_template_m_I_4 | Distributed Initiative A | 2986228 | Pilot Standard | seasonal-location-101 |
| 1002 | lu_tax_code_template_m_I_4 | Distributed Initiative A | ChIJvSxSbfdv5kcRanVzI8RRu20 | Baseline Framework D | regional-location-102 |
| 1003 | 1186090 | Adaptive Model | ChIJvSxSbfdv5kcRanVzI8RRu20 | Baseline Framework D | regional-location-102 |
| 1003 | 1186090 | Adaptive Model | 69447 | Integrated Protocol A | extended-location-99 |

The `jurisdiction_waste_processing_facility_detail_view` joins `Jurisdiction` with `JurisdictionWasteProcessingFacility` and `WasteProcessingFacility` to answer: "Which facilities receive waste from a given jurisdiction?" A row might link jurisdiction compact-source-86 to facility 69447 ("Integrated Protocol A"), enabling waste traceability from source to processing.

**View `jurisdiction_power_grid_detail_view`**

```sql
CREATE VIEW jurisdiction_power_grid_detail_view AS
SELECT a.id, a.jurisdictionId, a.jurisdictionName, b.gridId AS grid_gridId, b.gridOperator AS grid_gridOperator, b.voltageLevel AS grid_voltageLevel
FROM Jurisdiction a
  JOIN JurisdictionPowerGrid j ON j.jurisdictionId = a.id
  JOIN PowerGrid b ON b.gridId = j.gridId;
```

| id | jurisdictionId | jurisdictionName | grid_gridId | grid_gridOperator | grid_voltageLevel |
|---|---|---|---|---|---|
| 1000 | 8387534 | Pilot Cluster | 1437601 | seasonal-grid-47 | compact-voltage-14 |
| 1000 | 8387534 | Pilot Cluster | 4277021 | regional-grid-48 | composite-voltage-15 |
| 1001 | 99654 | Baseline Review | 4277021 | regional-grid-48 | composite-voltage-15 |
| 1001 | 99654 | Baseline Review | cb0a4823-4395-4437-b37e-f439932452f6 | legacy-grid-49 | primary-voltage-16 |
| 1002 | lu_tax_code_template_m_I_4 | Distributed Initiative A | cb0a4823-4395-4437-b37e-f439932452f6 | legacy-grid-49 | primary-voltage-16 |
| 1002 | lu_tax_code_template_m_I_4 | Distributed Initiative A | 726042 | compact-grid-50 | adaptive-voltage-17 |
| 1003 | 1186090 | Adaptive Model | 726042 | compact-grid-50 | adaptive-voltage-17 |
| 1003 | 1186090 | Adaptive Model | 1437601 | seasonal-grid-47 | compact-voltage-14 |

The `jurisdiction_power_grid_detail_view` joins `Jurisdiction` with `JurisdictionPowerGrid` and `PowerGrid` to answer: "Which power grid serves a given jurisdiction?" A row might link jurisdiction compact-source-86 to grid 1437601 ("seasonal-grid-47", compact-voltage-14, 3.20 MVA capacity), enabling operators to trace the energy distribution path from jurisdiction to grid.

The schema design follows a disciplined normalisation strategy: each entity type is represented by a single base table with a primary key, many-to-many relationships are materialised through dedicated junction tables with surrogate keys, and foreign keys enforce referential integrity between entities. The materialised views then denormalise these normalised structures to answer specific analytical questions without requiring ad-hoc joins. This separation of concerns — normalised storage for data integrity, denormalised views for query convenience — is a hallmark of well-designed analytical schemas. The representative values in the data (facility "Integrated Protocol A" processing 8.95 tons per day, energy output 3717613 delivering 9.70 MWh to grid 1437601, staff member Theodore Mcgrath serving as Chief_Financial_Officer) illustrate the concrete domain facts that the schema captures and the views reconstruct.