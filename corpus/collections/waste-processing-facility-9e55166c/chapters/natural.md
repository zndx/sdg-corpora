The modern waste-to-energy sector operates as a tightly coupled network of processing facilities, waste streams, energy generation systems, and regulatory jurisdictions. Each facility accepts specific waste types, converts them into usable energy, and feeds that energy into regional power grids under the oversight of governing jurisdictions. Staff members manage daily operations while integrated systems coordinate the flow of materials and energy across the entire infrastructure. This chapter documents the entities, measurements, and operational relationships that define this domain, drawing on concrete records from active facilities, waste streams, energy outputs, and the administrative structures that govern them.

## Waste Processing Facilities

The backbone of the waste-to-energy network consists of processing facilities, each characterized by its capacity, operational status, and energy generation potential.

**Table `WasteProcessingFacility`**

| facilityId | facilityName | location | operationalStatus | wasteCapacityTonsPerDay | energyOutputMWhPerDay | lastInspectionDate |
|---|---|---|---|---|---|---|
| 69447 | Integrated Protocol A | extended-location-99 | active | 8.95 | 8.45 | 2025-04-12T15:09:00 |
| 1040 | Extended Programme | integrated-location-100 | inactive | 12.90 | 12.90 | 2022-09-23T22:26:00 |
| 2986228 | Pilot Standard | seasonal-location-101 | under_maintenance | 16.85 | 17.35 | 2023-02-07T05:43:00 |
| ChIJvSxSbfdv5kcRanVzI8RRu20 | Baseline Framework D | regional-location-102 | active | 20.80 | 21.80 | 2024-07-18T12:00:00 |

The `WasteProcessingFacility` table records four distinct facilities, each identified by a unique `facilityId` and described by a `facilityName`. Facility 69447, named "Integrated Protocol A," operates at `extended-location-99` with an active status, processing up to 8.95 tons of waste per day while generating 8.45 MWh of energy daily. Its last inspection occurred on 2025-04-12. Facility 1040, "Extended Programme," is currently inactive at `integrated-location-100` and has a higher nominal capacity of 12.90 tons per day with matching energy output of 12.90 MWh. Facility 2986228, "Pilot Standard," sits at `seasonal-location-101` under maintenance, capable of handling 16.85 tons daily and producing 17.35 MWh. The largest facility, ChIJvSxSbfdv5kcRanVzI8RRu20 ("Baseline Framework D"), operates at `regional-location-102` with a capacity of 20.80 tons per day and energy output of 21.80 MWh, last inspected on 2024-07-18. The `operationalStatus` field distinguishes between `active`, `inactive`, and `under_maintenance` states, directly affecting each facility's contribution to the overall system.

## Waste Streams

Waste streams represent the materials flowing into processing facilities, each classified by type, source, and quality metrics.

**Table `WasteStream`**

| id | streamId | streamType | sourceJurisdiction | deliveryFrequency | averageWeightTons | contaminationRatePercent | facilityId | systemId | createdAt |
|---|---|---|---|---|---|---|---|---|---|
| 1000 | 2839512 | municipal_solid_waste | compact-source-86 | daily | 0.76 | 12.70 | 69447 | 1000 | 2025-01-01 00:14:00 |
| 1001 | e7a5231e-8fc3-11eb-924d-9cd76263cbd0 | recyclables | composite-source-87 | weekly | 0.4194766 | 14.40 | 1040 | 1001 | 2025-02-06 03:14:00 |
| 1002 | 3e41f384-9bac-11eb-a8a2-19ed5c03f8d3 | refuse | primary-source-88 | as_needed | 1.48 | 16.10 | 2986228 | 1002 | 2025-03-11 06:14:00 |
| 1003 | 1186092 | municipal_solid_waste | adaptive-source-89 | daily | 0.7 | 17.80 | ChIJvSxSbfdv5kcRanVzI8RRu20 | 1003 | 2025-04-16 09:14:00 |

The `WasteStream` table tracks four streams, each with a numeric or UUID-based `streamId` and a `streamType` such as `municipal_solid_waste`, `recyclables`, or `refuse`. Stream 1000 (streamId 2839512) carries municipal solid waste from `compact-source-86` on a daily delivery schedule, averaging 0.76 tons with a contamination rate of 12.70 percent, routed to facility 69447 within system 1000. Stream 1001 (streamId e7a5231e-8fc3-11eb-924d-9cd76263cbd0) transports recyclables from `composite-source-87` weekly, averaging 0.419 tons with 14.40 percent contamination, directed to facility 1040 in system 1001. Stream 1002 (streamId 3e41f384-9bac-11eb-a8a2-19ed5c03f8d3) handles refuse from `primary-source-88` on an as-needed basis, averaging 1.48 tons with 16.10 percent contamination, processed at facility 2986228 under system 1002. Stream 1003 (streamId 1186092) delivers municipal solid waste from `adaptive-source-89` daily, averaging 0.7 tons with 17.80 percent contamination, to facility ChIJvSxSbfdv5kcRanVzI8RRu20 in system 1003. The `deliveryFrequency` ranges from `daily` to `as_needed`, while `contaminationRatePercent` provides a quality indicator for each stream.

## Integrated Waste Systems

Integrated waste systems coordinate the relationship between facilities, waste streams, and energy generation, serving as the organizational layer above individual facilities.

**Table `IntegratedWasteSystem`**

| id | systemId | systemName | efficiencyRating | landfillCapacitySavedPercent | energyGeneratedMWh | lastAuditDate | facilityId |
|---|---|---|---|---|---|---|---|
| 1000 | 8189503 | Legacy Programme D | 16.95 | 5.70 | 22.20 | 2023-10-23T09:51:00 | 69447 |
| 1001 | 3717623 | Regional Standard | 20.90 | 9.40 | 26.40 | 2024-03-07T16:08:00 | 1040 |
| 1002 | 7441161 | Seasonal Framework | 24.85 | 13.10 | 30.60 | 2025-08-18T23:25:00 | 2986228 |
| 1003 | 605963 | Integrated Protocol A | 28.80 | 16.80 | 34.80 | 2022-01-02T06:42:00 | ChIJvSxSbfdv5kcRanVzI8RRu20 |

The `IntegratedWasteSystem` table defines four systems, each with a `systemId`, `systemName`, and an `efficiencyRating` measured as a percentage. System 1000 ("Legacy Programme D", systemId 8189503) achieves an efficiency rating of 16.95 percent, saves 5.70 percent of landfill capacity, and generates 22.20 MWh of energy, last audited on 2023-10-23. System 1001 ("Regional Standard", systemId 3717623) improves to 20.90 percent efficiency, saves 9.40 percent landfill capacity, and produces 26.40 MWh, audited on 2024-03-07. System 1002 ("Seasonal Framework", systemId 7441161) reaches 24.85 percent efficiency, saves 13.10 percent, and generates 30.60 MWh, audited on 2025-08-18. System 1003 ("Integrated Protocol A", systemId 605963) achieves the highest efficiency at 28.80 percent, saves 16.80 percent of landfill capacity, and produces 34.80 MWh, last audited on 2022-01-02. Each system is linked to a specific facility via `facilityId`, establishing a one-to-one mapping between systems and facilities in this dataset.

## Energy Output and Power Grids

Energy output records quantify the electricity generated by waste processing, while power grids describe the infrastructure that receives and distributes it.

**Table `EnergyOutput`**

| id | outputId | energyType | quantityMWh | gridConnectionStatus | qualityStandard | measurementDate | systemId | gridId | createdAt |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 3717613 | adaptive-energy-71 | 9.70 | connected | seasonal-quality-77 | 2024-07-01T18:54:00 | 1000 | 1437601 | 2025-01-01 00:14:00 |
| 2 | 937738 | distributed-energy-72 | 14.40 | disconnected | regional-quality-78 | 2025-12-12T01:11:00 | 1001 | 4277021 | 2025-02-06 03:14:00 |
| 3 | 974934 | baseline-energy-73 | 19.10 | maintenance | legacy-quality-79 | 2022-05-23T08:28:00 | 1002 | cb0a4823-4395-4437-b37e-f439932452f6 | 2025-03-11 06:14:00 |
| 4 | 5f8f9bda-8fcd-11eb-924d-9cd76263cbd0 | pilot-energy-74 | 23.80 | connected | compact-quality-80 | 2023-10-07T15:45:00 | 1003 | 726042 | 2025-04-16 09:14:00 |

The `EnergyOutput` table logs four energy records, each identified by `outputId` and categorized by `energyType` such as `adaptive-energy-71`, `distributed-energy-72`, `baseline-energy-73`, or `pilot-energy-74`. Record 1 (outputId 3717613) produces 9.70 MWh of adaptive energy, connected to grid 1437601, meeting `seasonal-quality-77` standard, measured on 2024-07-01, originating from system 1000. Record 2 (outputId 937738) generates 14.40 MWh of distributed energy, currently disconnected from grid 4277021, conforming to `regional-quality-78`, measured on 2025-12-12, from system 1001. Record 3 (outputId 974934) yields 19.10 MWh of baseline energy, under `maintenance` status on grid cb0a4823-4395-4437-b37e-f439932452f6, meeting `legacy-quality-79`, measured on 2022-05-23, from system 1002. Record 4 (outputId 5f8f9bda-8fcd-11eb-924d-9cd76263cbd0) produces 23.80 MWh of pilot energy, connected to grid 726042, meeting `compact-quality-80`, measured on 2023-10-07, from system 1003. The `gridConnectionStatus` field captures `connected`, `disconnected`, or `maintenance` states, while `qualityStandard` provides a classification for energy quality.

**Table `PowerGrid`**

| gridId | gridOperator | voltageLevel | capacityMVA | lastMaintenanceDate |
|---|---|---|---|---|
| 1437601 | seasonal-grid-47 | compact-voltage-14 | 3.20 | 2024-03-27T14:06:00 |
| 4277021 | regional-grid-48 | composite-voltage-15 | 6.40 | 2025-08-11T21:23:00 |
| cb0a4823-4395-4437-b37e-f439932452f6 | legacy-grid-49 | primary-voltage-16 | 9.60 | 2022-01-22T04:40:00 |
| 726042 | compact-grid-50 | adaptive-voltage-17 | 12.80 | 2023-06-06T11:57:00 |

The `PowerGrid` table describes four grid operators, each with a `gridId`, `gridOperator` name, `voltageLevel`, `capacityMVA`, and `lastMaintenanceDate`. Grid 1437601, operated by `seasonal-grid-47`, runs at `compact-voltage-14` with 3.20 MVA capacity, last maintained on 2024-03-27. Grid 4277021, operated by `regional-grid-48`, operates at `composite-voltage-15` with 6.40 MVA capacity, last maintained on 2025-08-11. Grid cb0a4823-4395-4437-b37e-f439932452f6, operated by `legacy-grid-49`, runs at `primary-voltage-16` with 9.60 MVA capacity, last maintained on 2022-01-22. Grid 726042, operated by `compact-grid-50`, operates at `adaptive-voltage-17` with 12.80 MVA capacity, last maintained on 2023-06-06. The `capacityMVA` values range from 3.20 to 12.80, indicating increasing grid capacity across the dataset.

## Staff and Jurisdictions

Human resources and regulatory oversight form the administrative layer of the waste-to-energy network.

**Table `StaffMember`**

| id | staffId | fullName | roleTitle | employmentStatus | yearsOfExperience | educationLevel | facilityId | memberId | systemId |
|---|---|---|---|---|---|---|---|---|---|
| 100 | 937735 | Theodore Mcgrath | Chief_Financial_Officer | full_time | 7 | bachelors | 69447 | 100 | 1000 |
| 101 | 3158139 | Account Name | Accounting_Staff | part_time | 10 | masters | 1040 | 101 | 1001 |
| 102 | 8189502 | Saipan International Airport | IT_Staff | contract | 13 | phd | 2986228 | 102 | 1002 |
| 103 | 69438 | Norma Fisher | Executive_Team_Member | full_time | 16 | bachelors | ChIJvSxSbfdv5kcRanVzI8RRu20 | 103 | 1003 |

The `StaffMember` table records four staff members, each with a `staffId`, `fullName`, `roleTitle`, `employmentStatus`, `yearsOfExperience`, and `educationLevel`. Member 100 (staffId 937735), Theodore Mcgrath, serves as Chief Financial Officer with full-time employment, 7 years of experience, and a bachelor's degree, assigned to facility 69447 and system 1000. Member 101 (staffId 3158139), listed as "Account Name," works as Accounting Staff on a part-time basis with 10 years of experience and a master's degree, at facility 1040 and system 1001. Member 102 (staffId 8189502), "Saipan International Airport," serves as IT Staff under contract with 13 years of experience and a PhD, at facility 2986228 and system 1002. Member 103 (staffId 69438), Norma Fisher, is an Executive Team Member with full-time status, 16 years of experience, and a bachelor's degree, at facility ChIJvSxSbfdv5kcRanVzI8RRu20 and system 1003. The `employmentStatus` field includes `full_time`, `part_time`, and `contract` designations.

**Table `Jurisdiction`**

| id | jurisdictionId | jurisdictionName | jurisdictionType | population | wasteGenerationRateTonsPerCapita |
|---|---|---|---|---|---|
| 1000 | 8387534 | Pilot Cluster | county | 42 | 19.20 |
| 1001 | 99654 | Baseline Review | city | 49 | 22.40 |
| 1002 | lu_tax_code_template_m_I_4 | Distributed Initiative A | township | 56 | 25.60 |
| 1003 | 1186090 | Adaptive Model | county | 63 | 28.80 |

The `Jurisdiction` table defines the regulatory boundaries within which facilities and grids operate. Each jurisdiction is identified by a `jurisdictionId` and `jurisdictionName`, with a `regulatoryLevel` indicating its authority tier and a `contactEmail` for administrative communication.

## Operational Relationships

The domain's relational structure is captured through junction tables that link facilities to waste streams, jurisdictions, and staff, as well as systems to waste streams and energy outputs, and grids to energy outputs and jurisdictions.

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

The `WasteProcessingFacilityWasteStream` junction table establishes which waste streams are processed at which facilities, recording the `facilityId`, `streamId`, `acceptanceDate`, and `processingStatus` for each pairing.

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

The `WasteProcessingFacilityJurisdiction` table links facilities to their governing jurisdictions, capturing `facilityId`, `jurisdictionId`, `regulatoryStartDate`, and `complianceStatus` for each facility-jurisdiction relationship.

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

The `WasteProcessingFacilityStaffMember` table associates staff members with facilities, recording `facilityId`, `staffId`, `assignmentDate`, and `department` for each staffing assignment.

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

The `IntegratedWasteSystemWasteStream` table connects integrated systems to the waste streams they manage, with `systemId`, `streamId`, `allocationDate`, and `allocationPercent` indicating how each system distributes waste stream capacity.

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

The `IntegratedWasteSystemEnergyOutput` table links systems to their energy outputs, recording `systemId`, `outputId`, `generationDate`, and `distributionPercent` to track energy distribution from each system.

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

The `PowerGridEnergyOutput` table maps energy outputs to the power grids that receive them, with `gridId`, `outputId`, `connectionDate`, and `loadPercent` specifying the grid's energy intake.

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

The `PowerGridJurisdiction` table associates power grids with their regulatory jurisdictions, capturing `gridId`, `jurisdictionId`, `oversightStartDate`, and `regulatoryStatus` for each grid-jurisdiction pairing.

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

The `JurisdictionWasteProcessingFacility` table provides the reverse mapping of jurisdictions to facilities, recording `jurisdictionId`, `facilityId`, `enforcementDate`, and `enforcementLevel` for each jurisdiction-facility relationship.

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

The `JurisdictionPowerGrid` table links jurisdictions to power grids, with `jurisdictionId`, `gridId`, `supervisionDate`, and `complianceRating` documenting regulatory oversight of grid operations.

## View Interpretations

The following views synthesize data across multiple tables, answering specific operational questions through joined results.

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

This view answers which waste streams are processed at each facility, joining `WasteProcessingFacility` with `WasteStream` and the junction table. A representative row shows facility 69447 ("Integrated Protocol A") processing stream 2839512 (municipal solid waste) with a specific acceptance date and processing status, providing a clear operational snapshot of material flow.

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

This view reveals the regulatory jurisdiction governing each facility by joining `WasteProcessingFacility` with `Jurisdiction` and the facility-jurisdiction junction. A row might show facility 1040 ("Extended Programme") under the oversight of a specific jurisdiction with a regulatory start date and compliance status, clarifying the administrative framework.

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

This view maps staff members to their assigned facilities through the `WasteProcessingFacilityStaffMember` junction. A row could show Theodore Mcgrath (staffId 937735) assigned to facility 69447 with an assignment date and department, providing a staffing overview for each facility.

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

This view presents waste streams alongside their destination facilities, joining `WasteStream` with `WasteProcessingFacility`. A row might display stream e7a5231e-8fc3-11eb-924d-9cd76263cbd0 (recyclables) being processed at facility 1040 ("Extended Programme"), offering a facility-centric perspective on waste intake.

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

This view connects waste streams to their parent integrated waste systems via the `IntegratedWasteSystemWasteStream` junction. A row could show stream 3e41f384-9bac-11eb-a8a2-19ed5c03f8d3 (refuse) allocated to system 1002 ("Seasonal Framework") with an allocation percentage, revealing system-level waste distribution.

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

This view provides a detailed look at waste streams managed by each integrated system, joining `IntegratedWasteSystem` with `WasteStream`. A row might show system 1003 ("Integrated Protocol A") managing stream 1186092 (municipal solid waste) with an allocation date and percentage, offering a system-centric operational view.

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

This view links integrated waste systems to their host facilities through the `facilityId` foreign key. A row could display system 1001 ("Regional Standard") operating at facility 1040 ("Extended Programme"), clarifying the system-to-facility mapping.

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

This view connects energy outputs to their originating systems via `IntegratedWasteSystemEnergyOutput`. A row might show system 1000 ("Legacy Programme D") producing output 3717613 (adaptive energy) with a generation date and distribution percentage, quantifying energy generation per system.

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

This view presents energy outputs alongside their parent systems, joining `EnergyOutput` with `IntegratedWasteSystem`. A row could display output 937738 (distributed energy, 14.40 MWh) originating from system 1001 ("Regional Standard"), providing an energy-centric perspective on system output.

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

This view maps energy outputs to the power grids that receive them through `PowerGridEnergyOutput`. A row might show output 974934 (baseline energy, 19.10 MWh) connected to grid cb0a4823-4395-4437-b37e-f439932452f6 (legacy-grid-49) with a connection date and load percentage, tracing energy from generation to grid delivery.

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

This view provides a detailed look at energy outputs received by each power grid, joining `PowerGrid` with `EnergyOutput`. A row could show grid 726042 (compact-grid-50) receiving output 5f8f9bda-8fcd-11eb-924d-9cd76263cbd0 (pilot energy, 23.80 MWh) with a connection date and load percentage, offering a grid-centric energy intake view.

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

This view reveals the regulatory jurisdiction overseeing each power grid through `PowerGridJurisdiction`. A row might show grid 1437601 (seasonal-grid-47) under the oversight of a specific jurisdiction with an oversight start date and regulatory status, clarifying grid governance.

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

This view presents staff members alongside their assigned facilities via `WasteProcessingFacilityStaffMember`. A row could display Norma Fisher (staffId 69438, Executive Team Member) assigned to facility ChIJvSxSbfdv5kcRanVzI8RRu20 ("Baseline Framework D") with an assignment date and department, providing a staff-to-facility mapping.

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

This view offers a comprehensive listing of all staff members with their full details, joining `StaffMember` with itself to enrich the record. A row might show member 102 (Saipan International Airport, IT Staff, contract, 13 years experience, PhD) with all associated identifiers, serving as a complete personnel roster.

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

This view connects staff members to their parent integrated waste systems through the `systemId` foreign key in `StaffMember`. A row could show member 100 (Theodore Mcgrath) associated with system 1000 ("Legacy Programme D"), providing a system-level staffing overview.

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

This view reveals facilities governed by each jurisdiction through `JurisdictionWasteProcessingFacility`. A row might show a specific jurisdiction overseeing facility 2986228 ("Pilot Standard") with an enforcement date and enforcement level, clarifying jurisdictional authority over facilities.

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

This view maps power grids to their regulatory jurisdictions via `JurisdictionPowerGrid`. A row could show a jurisdiction supervising grid 4277021 (regional-grid-48) with a supervision date and compliance rating, documenting the regulatory relationship between jurisdictions and grid operators.

## Synthesis

The waste-to-energy domain forms a multi-layered operational ecosystem where physical infrastructure, material flows, energy generation, and regulatory oversight intersect. Processing facilities like "Integrated Protocol A" and "Baseline Framework D" accept waste streams ranging from municipal solid waste to recyclables, converting them into energy outputs that feed into power grids operated by entities such as `seasonal-grid-47` and `compact-grid-50`. Integrated waste systems coordinate these operations at a higher level, with efficiency ratings spanning from 16.95 percent to 28.80 percent and energy generation reaching up to 34.80 MWh. Staff members with diverse qualifications—from bachelor's degrees to PhDs—manage these facilities across full-time, part-time, and contract arrangements. Regulatory jurisdictions provide the governance framework, overseeing both facilities and power grids through structured compliance and enforcement mechanisms. The junction tables and detail views collectively enable operators to trace any material, energy, or administrative relationship across the entire network, supporting informed decision-making at every level of the waste-to-energy supply chain.