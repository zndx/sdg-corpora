## Environmental Permitting and Facility Management for Animal Confinement Operations

Regulatory oversight of concentrated animal feeding operations requires a structured approach to tracking operators, facilities, geographic jurisdictions, and the permitting lifecycle. The records in this system capture the full chain of accountability: from the legal entities that own and operate facilities, through the physical buildings and their animal capacities, to the environmental permits that authorize construction, modification, and ongoing operation. Each facility sits within a defined watershed, carries one or more confinement buildings with specified animal capacities, and is managed by an owner operator who holds or applies for the necessary regulatory approvals. The following sections describe how these entities interrelate and how the system's views synthesize the data for operational decision-making.

**Table `OwnerOperator`**

| id | legalName | contactPerson | streetAddress | city | state | zipCode | phone | emailAddress | entityType |
|---|---|---|---|---|---|---|---|---|---|
| 1000 | Jorge Sullivan | Alyssa Chung | composite-street-15 | integrated-city-34 | distributed-state-84 | 69434 | compact-phone-26 | primary-email-70 | Individual |
| 1001 | Walter Pratt | Brianna Mejia | primary-street-16 | seasonal-city-35 | baseline-state-85 | 13589 | composite-phone-27 | adaptive-email-71 | Corporation |
| 1002 | Home Medix Oxygen | Eric Schultz | adaptive-street-17 | regional-city-36 | pilot-state-86 | 9bb5fec0-8fcc-11eb-924d-9cd76263cbd0 | primary-phone-28 | distributed-email-72 | LLC |
| 1003 | Hector Garcia | Peter Montgomery | distributed-street-18 | legacy-city-37 | extended-state-87 | 1250214 | adaptive-phone-29 | baseline-email-73 | LLP |

Owner operators are the legal entities responsible for facility compliance. The system distinguishes between four entity types: Individuals, Corporations, Limited Liability Companies, and Limited Liability Partnerships. Jorge Sullivan, registered as an Individual, operates under the name Jorge Sullivan and can be reached through contact person Alyssa Chung at primary-email-70. Walter Pratt, a Corporation, is represented by Brianna Mejia at adaptive-email-71. Home Medix Oxygen, organized as an LLC, lists Eric Schultz as the contact person with distributed-email-72 as the email address. Hector Garcia, an LLP, is managed by Peter Montgomery at baseline-email-73. Each operator carries a full street address, city, state, and zip code, forming the basis for jurisdictional assignment and regulatory correspondence. The operator identifiers (1000 through 1003) serve as the primary keys that link operators to facilities, permit applications, and the broader regulatory network.

**Table `Facility`**

| facilityName | streetAddress | city | state | zipCode | county | township | section | contactPhone | contactEmail | watershedId |
|---|---|---|---|---|---|---|---|---|---|---|
| Integrated Protocol A | composite-street-15 | integrated-city-34 | distributed-state-84 | 69434 | primary-county-52 | legacy-township-61 | extended-section-45 | Joe Tsai | Christopher Wilson | 1 |
| Extended Programme | primary-street-16 | seasonal-city-35 | baseline-state-85 | 13589 | adaptive-county-53 | compact-township-62 | integrated-section-46 | Stephanie Collins | Charles Larsen | 2 |
| Pilot Standard | adaptive-street-17 | regional-city-36 | pilot-state-86 | 9bb5fec0-8fcc-11eb-924d-9cd76263cbd0 | distributed-county-54 | composite-township-63 | seasonal-section-47 | Tasha Rodriguez | Mary Alvarez | 3 |
| Baseline Framework D | distributed-street-18 | legacy-city-37 | extended-state-87 | 1250214 | baseline-county-55 | primary-township-64 | regional-section-48 | Walter Pratt | April Snyder | 4 |

Facilities represent the physical sites where animal confinement and agricultural operations occur. Each facility record includes a descriptive name, a street address, and geographic identifiers spanning city, state, zip code, county, township, and section. Integrated Protocol A, located at composite-street-15 in integrated-city-34, falls under primary-county-52 and legacy-township-61. Extended Programme occupies primary-street-16 in seasonal-city-35 within adaptive-county-53. Pilot Standard sits at adaptive-street-17 in regional-city-36, assigned to distributed-county-54. Baseline Framework D is situated at distributed-street-18 in legacy-city-37, under baseline-county-55. Contact information for each facility includes a designated contact person and their phone number, alongside a contact email. The watershed identifier on each facility record establishes the environmental jurisdiction that governs water quality and runoff management for that site.

**Table `Watershed`**

| id | watershedName | epaAddressCode |
|---|---|---|
| 1 | Distributed Survey | 8928512 |
| 2 | Adaptive Corridor D | c19a2028-8fc0-11eb-924d-9cd76263cbd0 |
| 3 | Primary Series | 39800619 |
| 4 | Composite Assessment | 168556 |

Watersheds define the environmental management zones within which facilities must operate. The system tracks four watersheds, each identified by a numeric or alphanumeric ID, a descriptive name, and an EPA address code. Distributed Survey (ID 1) carries EPA address code 8928512. Adaptive Corridor D (ID 2) uses the identifier c19a2028-8fc0-11eb-924d-9cd76263cbd0. Primary Series (ID 3) is assigned code 39800619. Composite Assessment (ID 4) carries code 168556. These EPA codes serve as the federal reporting identifiers that link state-level facility records to national environmental databases. The watershed assignment determines the applicable water quality standards and discharge requirements for each facility.

**Table `AnimalConfinementBuilding`**

| id | buildingIdentifier | buildingType | constructionStatus | facilityZipCode |
|---|---|---|---|---|
| 1 | BUI-2149 | composite-building-51 | Existing | 69434 |
| 2 | BUI-2152 | primary-building-52 | Proposed New | 13589 |
| 3 | BUI-2155 | adaptive-building-53 | Proposed Modification | 9bb5fec0-8fcc-11eb-924d-9cd76263cbd0 |
| 4 | BUI-2158 | distributed-building-54 | Existing | 1250214 |

Animal confinement buildings are the physical structures where animals are housed. Each building carries a unique building identifier, a type classification, a construction status, and the zip code of the facility it belongs to. Building BUI-2149, classified as composite-building-51, has an Existing status and is located at zip code 69434. Building BUI-2152, classified as primary-building-52, carries a Proposed New status at zip code 13589. Building BUI-2155, classified as adaptive-building-53, has a Proposed Modification status at zip code 9bb5fec0-8fcc-11eb-9cd76263cbd0. Building BUI-2158, classified as distributed-building-54, has an Existing status at zip code 1250214. The construction status indicates whether a building is already in operation, planned for new construction, or undergoing modification, which directly affects the type of permit required.

**Table `AnimalCapacity`**

| capacityId | animalType | capacityCount | facilityClassification | buildingId | facilityZipCode |
|---|---|---|---|---|---|
| 100 | seasonal-animal-59 | 9 | AFF | 1 | 69434 |
| 101 | regional-animal-60 | 0 | CAFF | 2 | 13589 |
| 102 | legacy-animal-61 | 0 | MCAFF | 3 | 9bb5fec0-8fcc-11eb-924d-9cd76263cbd0 |
| 103 | compact-animal-62 | 20 | AFF | 4 | 1250214 |

Animal capacity records quantify the number and type of animals housed at each facility. Each record specifies an animal type, a capacity count, a facility classification, and the associated building and facility zip code. The seasonal-animal-59 category at capacity ID 100 has a count of 9 animals under an AFF classification, housed in building 1 at zip code 69434. The regional-animal-60 category at capacity ID 101 has a count of 0 animals under a CAFF classification in building 2 at zip code 13589. The legacy-animal-61 category at capacity ID 102 has a count of 0 animals under an MCAFF classification in building 3 at zip code 9bb5fec0-8fcc-11eb-924d-9cd76263cbd0. The compact-animal-62 category at capacity ID 103 has a count of 20 animals under an AFF classification in building 4 at zip code 1250214. Facility classifications (AFF, CAFF, MCAFF) determine regulatory thresholds and permitting requirements based on the scale of operations.

**Table `PermitApplication`**

| applicationId | applicationDate | permitType | reasonCode | feeAmount | preparedBy | preparedByCompany | preparedByPhone | preparedByEmail | facilityZipCode | operatorId | permitId |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 505997 | 2022-05-16T16:24:00 | Permit to Install | New CAFF/MCAFF | 38.08 | composite-prepared-15 | U.S. Steel | distributed-prepared-24 | adaptive-prepared-35 | 69434 | 1000 | 1 |
| 1250196 | 2023-10-27T23:41:00 | Permit to Operate | Manure Storage Expansion | 18.47 | primary-prepared-16 | District No. 3 | baseline-prepared-25 | distributed-prepared-36 | 13589 | 1001 | 2 |
| 124 | 2024-03-11T06:58:00 | NPDES | Modification | 38.08 | adaptive-prepared-17 | E2open Parent Holdings Inc. | pilot-prepared-26 | baseline-prepared-37 | 9bb5fec0-8fcc-11eb-924d-9cd76263cbd0 | 1002 | 3 |
| IVC20det40 | 2025-08-22T13:15:00 | Construction Storm Water NPDES | Capacity Expansion | 26.25 | distributed-prepared-18 | Sanniquellie Mahn | extended-prepared-27 | pilot-prepared-38 | 1250214 | 1003 | 4 |

Permit applications document the regulatory requests submitted by operators for their facilities. Each application carries a unique application ID, a submission date, a permit type, a reason code, a fee amount, and the preparer's details. Application 505997, submitted on 2022-05-16, is a Permit to Install for a New CAFF/MCAFF operation, with a fee of 38.08, prepared by composite-prepared-15 at U.S. Steel. Application 1250196, submitted on 2023-10-27, is a Permit to Operate for Manure Storage Expansion, with a fee of 18.47, prepared by primary-prepared-16 at District No. 3. Application 124, submitted on 2024-03-11, is an NPDES permit for Modification, with a fee of 38.08, prepared by adaptive-prepared-17 at E2open Parent Holdings Inc. Application IVC20det40, submitted on 2025-08-22, is a Construction Storm Water NPDES permit for Capacity Expansion, with a fee of 26.25, prepared by distributed-prepared-18 by Sanniquellie Mahn. Each application references a facility zip code, an operator ID, and a permit ID, linking the regulatory request to the physical site and the responsible party.

**Table `OtherPermit`**

| id | permitName | issuingAuthority | permitNumber | status | applicationId |
|---|---|---|---|---|---|
| 1 | Regional Model | extended-issuing-33 | PER-2638 | Pending | 505997 |
| 2 | Seasonal Cluster D | integrated-issuing-34 | PER-2640 | Active | 1250196 |
| 3 | Integrated Review | seasonal-issuing-35 | PER-2642 | Expired | 124 |
| 4 | Extended Initiative | regional-issuing-36 | PER-2644 | Not Required | IVC20det40 |

Other permits represent additional regulatory authorizations that may be required alongside the primary permit application. These permits capture supplementary environmental or operational approvals that complement the main permitting process. The system tracks these secondary permits and links them to their parent permit applications, ensuring a complete picture of all regulatory requirements for each facility.

**Table `OwnerOperatorPermitApplication`**

| operatorId | applicationId |
|---|---|
| 1000 | 505997 |
| 1000 | 1250196 |
| 1001 | 1250196 |
| 1001 | 124 |
| 1002 | 124 |
| 1002 | IVC20det40 |
| 1003 | IVC20det40 |
| 1003 | 505997 |

The OwnerOperatorPermitApplication table establishes the relationship between operators and their permit applications. This linkage ensures that every permit request is attributable to a specific legal entity, enabling regulatory agencies to track compliance history, enforcement actions, and application patterns at the operator level.

**Table `OwnerOperatorFacility`**

| operatorId | facilityZipCode |
|---|---|
| 1000 | 69434 |
| 1000 | 13589 |
| 1001 | 13589 |
| 1001 | 9bb5fec0-8fcc-11eb-924d-9cd76263cbd0 |
| 1002 | 9bb5fec0-8fcc-11eb-924d-9cd76263cbd0 |
| 1002 | 1250214 |
| 1003 | 1250214 |
| 1003 | 69434 |

OwnerOperatorFacility records the direct ownership or operational relationship between an owner operator and a facility. This table ensures that each facility can be traced to its responsible party, forming the foundation for regulatory accountability and contact management.

**Table `FacilityOwnerOperator`**

| facilityZipCode | operatorId |
|---|---|
| 69434 | 1000 |
| 69434 | 1001 |
| 13589 | 1001 |
| 13589 | 1002 |
| 9bb5fec0-8fcc-11eb-924d-9cd76263cbd0 | 1002 |
| 9bb5fec0-8fcc-11eb-924d-9cd76263cbd0 | 1003 |
| 1250214 | 1003 |
| 1250214 | 1000 |

FacilityOwnerOperator provides an alternative perspective on the operator-facility relationship, potentially capturing multi-party arrangements or secondary operational responsibilities. This table supports scenarios where multiple operators may have roles at a single facility.

**Table `FacilityAnimalConfinementBuilding`**

| facilityZipCode | buildingId |
|---|---|
| 69434 | 1 |
| 69434 | 2 |
| 13589 | 2 |
| 13589 | 3 |
| 9bb5fec0-8fcc-11eb-924d-9cd76263cbd0 | 3 |
| 9bb5fec0-8fcc-11eb-924d-9cd76263cbd0 | 4 |
| 1250214 | 4 |
| 1250214 | 1 |

FacilityAnimalConfinementBuilding links facilities to their constituent confinement buildings. A single facility may contain multiple buildings, each with its own construction status and classification. This relationship enables the system to track the full physical footprint of a facility and the regulatory implications of each building's status.

**Table `FacilityAnimalCapacity`**

| facilityZipCode | capacityId |
|---|---|
| 69434 | 100 |
| 69434 | 101 |
| 13589 | 101 |
| 13589 | 102 |
| 9bb5fec0-8fcc-11eb-924d-9cd76263cbd0 | 102 |
| 9bb5fec0-8fcc-11eb-924d-9cd76263cbd0 | 103 |
| 1250214 | 103 |
| 1250214 | 100 |

FacilityAnimalCapacity connects facilities to their animal capacity records. This linkage ensures that capacity data is always associated with the correct facility, supporting regulatory threshold calculations and reporting requirements based on the total animal population at each site.

**Table `WatershedFacility`**

| watershedId | facilityZipCode |
|---|---|
| 1 | 69434 |
| 1 | 13589 |
| 2 | 13589 |
| 2 | 9bb5fec0-8fcc-11eb-924d-9cd76263cbd0 |
| 3 | 9bb5fec0-8fcc-11eb-924d-9cd76263cbd0 |
| 3 | 1250214 |
| 4 | 1250214 |
| 4 | 69434 |

WatershedFacility formalizes the relationship between watersheds and the facilities within them. This table supports the many-to-one relationship where multiple facilities may fall within a single watershed, enabling watershed-level aggregation of environmental data and regulatory analysis.

**Table `AnimalConfinementBuildingAnimalCapacity`**

| buildingId | capacityId |
|---|---|
| 1 | 100 |
| 1 | 101 |
| 2 | 101 |
| 2 | 102 |
| 3 | 102 |
| 3 | 103 |
| 4 | 103 |
| 4 | 100 |

AnimalConfinementBuildingAnimalCapacity links confinement buildings to their animal capacity records. This relationship ensures that capacity counts are associated with the specific buildings that house the animals, supporting detailed reporting on building-level operations and compliance.

**Table `PermitApplicationOwnerOperator`**

| applicationId | operatorId |
|---|---|
| 505997 | 1000 |
| 505997 | 1001 |
| 1250196 | 1001 |
| 1250196 | 1002 |
| 124 | 1002 |
| 124 | 1003 |
| IVC20det40 | 1003 |
| IVC20det40 | 1000 |

PermitApplicationOwnerOperator connects permit applications to the operators who submitted them. This table supports the regulatory workflow by ensuring that every application is attributable to a specific operator, enabling tracking of application history, approval rates, and compliance patterns.

**View `owner_operator_permit_application_detail_view`**

```sql
CREATE VIEW owner_operator_permit_application_detail_view AS
SELECT a.id, a.legalName, a.contactPerson, b.applicationId AS application_applicationId, b.applicationDate AS application_applicationDate, b.permitType AS application_permitType
FROM OwnerOperator a
  JOIN OwnerOperatorPermitApplication j ON j.operatorId = a.id
  JOIN PermitApplication b ON b.applicationId = j.applicationId;
```

| id | legalName | contactPerson | application_applicationId | application_applicationDate | application_permitType |
|---|---|---|---|---|---|
| 1000 | Jorge Sullivan | Alyssa Chung | 505997 | 2022-05-16T16:24:00 | Permit to Install |
| 1000 | Jorge Sullivan | Alyssa Chung | 1250196 | 2023-10-27T23:41:00 | Permit to Operate |
| 1001 | Walter Pratt | Brianna Mejia | 1250196 | 2023-10-27T23:41:00 | Permit to Operate |
| 1001 | Walter Pratt | Brianna Mejia | 124 | 2024-03-11T06:58:00 | NPDES |
| 1002 | Home Medix Oxygen | Eric Schultz | 124 | 2024-03-11T06:58:00 | NPDES |
| 1002 | Home Medix Oxygen | Eric Schultz | IVC20det40 | 2025-08-22T13:15:00 | Construction Storm Water NPDES |
| 1003 | Hector Garcia | Peter Montgomery | IVC20det40 | 2025-08-22T13:15:00 | Construction Storm Water NPDES |
| 1003 | Hector Garcia | Peter Montgomery | 505997 | 2022-05-16T16:24:00 | Permit to Install |

The owner_operator_permit_application_detail_view joins operator records with their permit applications, answering the question of which operators have submitted which applications and under what terms. For example, operator 1000 (Jorge Sullivan) has submitted application 505997 for a Permit to Install with a fee of 38.08, prepared by U.S. Steel. Operator 1001 (Walter Pratt) submitted application 1250196 for a Permit to Operate with a fee of 18.47, prepared by District No. 3. This view enables regulators to assess an operator's permitting history and identify patterns in application types and fee structures.

**View `owner_operator_facility_detail_view`**

```sql
CREATE VIEW owner_operator_facility_detail_view AS
SELECT a.id, a.legalName, a.contactPerson, b.facilityName AS facility_facilityName, b.streetAddress AS facility_streetAddress, b.city AS facility_city
FROM OwnerOperator a
  JOIN OwnerOperatorFacility j ON j.operatorId = a.id
  JOIN Facility b ON b.zipCode = j.facilityZipCode;
```

| id | legalName | contactPerson | facility_facilityName | facility_streetAddress | facility_city |
|---|---|---|---|---|---|
| 1000 | Jorge Sullivan | Alyssa Chung | Integrated Protocol A | composite-street-15 | integrated-city-34 |
| 1000 | Jorge Sullivan | Alyssa Chung | Extended Programme | primary-street-16 | seasonal-city-35 |
| 1001 | Walter Pratt | Brianna Mejia | Extended Programme | primary-street-16 | seasonal-city-35 |
| 1001 | Walter Pratt | Brianna Mejia | Pilot Standard | adaptive-street-17 | regional-city-36 |
| 1002 | Home Medix Oxygen | Eric Schultz | Pilot Standard | adaptive-street-17 | regional-city-36 |
| 1002 | Home Medix Oxygen | Eric Schultz | Baseline Framework D | distributed-street-18 | legacy-city-37 |
| 1003 | Hector Garcia | Peter Montgomery | Baseline Framework D | distributed-street-18 | legacy-city-37 |
| 1003 | Hector Garcia | Peter Montgomery | Integrated Protocol A | composite-street-15 | integrated-city-34 |

The owner_operator_facility_detail_view combines operator information with facility details, answering which operators are responsible for which facilities and where those facilities are located. Operator 1000 (Jorge Sullivan) is associated with Integrated Protocol A at composite-street-15 in integrated-city-34. Operator 1001 (Walter Pratt) is linked to Extended Programme at primary-street-16 in seasonal-city-35. This view supports contact management, jurisdictional assignment, and the tracking of operator-facility relationships across geographic regions.

**View `facility_watershed_view`**

```sql
CREATE VIEW facility_watershed_view AS
SELECT a.facilityName, a.streetAddress, a.city, a.state, b.id AS watershed_id, b.watershedName AS watershed_watershedName, b.epaAddressCode AS watershed_epaAddressCode
FROM Facility a JOIN Watershed b ON a.watershedId = b.id;
```

| facilityName | streetAddress | city | state | watershed_id | watershed_watershedName | watershed_epaAddressCode |
|---|---|---|---|---|---|---|
| Integrated Protocol A | composite-street-15 | integrated-city-34 | distributed-state-84 | 1 | Distributed Survey | 8928512 |
| Extended Programme | primary-street-16 | seasonal-city-35 | baseline-state-85 | 2 | Adaptive Corridor D | c19a2028-8fc0-11eb-924d-9cd76263cbd0 |
| Pilot Standard | adaptive-street-17 | regional-city-36 | pilot-state-86 | 3 | Primary Series | 39800619 |
| Baseline Framework D | distributed-street-18 | legacy-city-37 | extended-state-87 | 4 | Composite Assessment | 168556 |

The facility_watershed_view joins facility records with their assigned watersheds, answering which facilities fall within which environmental management zones. Integrated Protocol A is located within the Distributed Survey watershed (EPA code 8928512). Extended Programme falls under Adaptive Corridor D (EPA code c19a2028-8fc0-11eb-924d-9cd76263cbd0). Pilot Standard is assigned to the Primary Series watershed (EPA code 39800619). Baseline Framework D sits within the Composite Assessment watershed (EPA code 168556). This view is essential for environmental compliance, as it determines the applicable water quality standards and discharge limits for each facility.

**View `facility_owner_operator_detail_view`**

```sql
CREATE VIEW facility_owner_operator_detail_view AS
SELECT a.facilityName, a.streetAddress, a.city, b.id AS operator_id, b.legalName AS operator_legalName, b.contactPerson AS operator_contactPerson
FROM Facility a
  JOIN FacilityOwnerOperator j ON j.facilityZipCode = a.zipCode
  JOIN OwnerOperator b ON b.id = j.operatorId;
```

| facilityName | streetAddress | city | operator_id | operator_legalName | operator_contactPerson |
|---|---|---|---|---|---|
| Integrated Protocol A | composite-street-15 | integrated-city-34 | 1000 | Jorge Sullivan | Alyssa Chung |
| Integrated Protocol A | composite-street-15 | integrated-city-34 | 1001 | Walter Pratt | Brianna Mejia |
| Extended Programme | primary-street-16 | seasonal-city-35 | 1001 | Walter Pratt | Brianna Mejia |
| Extended Programme | primary-street-16 | seasonal-city-35 | 1002 | Home Medix Oxygen | Eric Schultz |
| Pilot Standard | adaptive-street-17 | regional-city-36 | 1002 | Home Medix Oxygen | Eric Schultz |
| Pilot Standard | adaptive-street-17 | regional-city-36 | 1003 | Hector Garcia | Peter Montgomery |
| Baseline Framework D | distributed-street-18 | legacy-city-37 | 1003 | Hector Garcia | Peter Montgomery |
| Baseline Framework D | distributed-street-18 | legacy-city-37 | 1000 | Jorge Sullivan | Alyssa Chung |

The facility_owner_operator_detail_view provides a facility-centric perspective on operator relationships, answering which operators are associated with each facility and what their entity types are. Integrated Protocol A is linked to an operator of type Individual. Extended Programme is associated with a Corporation. Pilot Standard connects to an LLC. Baseline Framework D is tied to an LLP. This view supports regulatory analysis by revealing the distribution of entity types across facilities and helping identify operators with multiple facility interests.

**View `facility_animal_confinement_building_detail_view`**

```sql
CREATE VIEW facility_animal_confinement_building_detail_view AS
SELECT a.facilityName, a.streetAddress, a.city, b.id AS building_id, b.buildingIdentifier AS building_buildingIdentifier, b.buildingType AS building_buildingType
FROM Facility a
  JOIN FacilityAnimalConfinementBuilding j ON j.facilityZipCode = a.zipCode
  JOIN AnimalConfinementBuilding b ON b.id = j.buildingId;
```

| facilityName | streetAddress | city | building_id | building_buildingIdentifier | building_buildingType |
|---|---|---|---|---|---|
| Integrated Protocol A | composite-street-15 | integrated-city-34 | 1 | BUI-2149 | composite-building-51 |
| Integrated Protocol A | composite-street-15 | integrated-city-34 | 2 | BUI-2152 | primary-building-52 |
| Extended Programme | primary-street-16 | seasonal-city-35 | 2 | BUI-2152 | primary-building-52 |
| Extended Programme | primary-street-16 | seasonal-city-35 | 3 | BUI-2155 | adaptive-building-53 |
| Pilot Standard | adaptive-street-17 | regional-city-36 | 3 | BUI-2155 | adaptive-building-53 |
| Pilot Standard | adaptive-street-17 | regional-city-36 | 4 | BUI-2158 | distributed-building-54 |
| Baseline Framework D | distributed-street-18 | legacy-city-37 | 4 | BUI-2158 | distributed-building-54 |
| Baseline Framework D | distributed-street-18 | legacy-city-37 | 1 | BUI-2149 | composite-building-51 |

The facility_animal_confinement_building_detail_view joins facility records with their confinement buildings, answering which buildings exist at each facility and what their construction statuses are. Integrated Protocol A contains building BUI-2149 (composite-building-51, Existing status). Extended Programme contains building BUI-2152 (primary-building-52, Proposed New status). Pilot Standard contains building BUI-2155 (adaptive-building-53, Proposed Modification status). Baseline Framework D contains building BUI-2158 (distributed-building-54, Existing status). This view enables regulators to assess the physical development stage of each facility and determine which buildings require new permits versus those that are already authorized.

**View `facility_animal_capacity_detail_view`**

```sql
CREATE VIEW facility_animal_capacity_detail_view AS
SELECT a.facilityName, a.streetAddress, a.city, b.capacityId AS capacity_capacityId, b.animalType AS capacity_animalType, b.capacityCount AS capacity_capacityCount
FROM Facility a
  JOIN FacilityAnimalCapacity j ON j.facilityZipCode = a.zipCode
  JOIN AnimalCapacity b ON b.capacityId = j.capacityId;
```

| facilityName | streetAddress | city | capacity_capacityId | capacity_animalType | capacity_capacityCount |
|---|---|---|---|---|---|
| Integrated Protocol A | composite-street-15 | integrated-city-34 | 100 | seasonal-animal-59 | 9 |
| Integrated Protocol A | composite-street-15 | integrated-city-34 | 101 | regional-animal-60 | 0 |
| Extended Programme | primary-street-16 | seasonal-city-35 | 101 | regional-animal-60 | 0 |
| Extended Programme | primary-street-16 | seasonal-city-35 | 102 | legacy-animal-61 | 0 |
| Pilot Standard | adaptive-street-17 | regional-city-36 | 102 | legacy-animal-61 | 0 |
| Pilot Standard | adaptive-street-17 | regional-city-36 | 103 | compact-animal-62 | 20 |
| Baseline Framework D | distributed-street-18 | legacy-city-37 | 103 | compact-animal-62 | 20 |
| Baseline Framework D | distributed-street-18 | legacy-city-37 | 100 | seasonal-animal-59 | 9 |

The facility_animal_capacity_detail_view links facilities to their animal capacity records, answering what types and quantities of animals are housed at each facility and under what classifications. Integrated Protocol A holds seasonal-animal-59 with a capacity of 9 under AFF classification. Extended Programme holds regional-animal-60 with a capacity of 0 under CAFF classification. Pilot Standard holds legacy-animal-61 with a capacity of 0 under MCAFF classification. Baseline Framework D holds compact-animal-62 with a capacity of 20 under AFF classification. This view is critical for determining regulatory thresholds, as facility classifications dictate the permitting requirements and operational restrictions applicable to each site.

**View `watershed_facility_detail_view`**

```sql
CREATE VIEW watershed_facility_detail_view AS
SELECT a.id, a.watershedName, a.epaAddressCode, b.facilityName AS facility_facilityName, b.streetAddress AS facility_streetAddress, b.city AS facility_city
FROM Watershed a
  JOIN WatershedFacility j ON j.watershedId = a.id
  JOIN Facility b ON b.zipCode = j.facilityZipCode;
```

| id | watershedName | epaAddressCode | facility_facilityName | facility_streetAddress | facility_city |
|---|---|---|---|---|---|
| 1 | Distributed Survey | 8928512 | Integrated Protocol A | composite-street-15 | integrated-city-34 |
| 1 | Distributed Survey | 8928512 | Extended Programme | primary-street-16 | seasonal-city-35 |
| 2 | Adaptive Corridor D | c19a2028-8fc0-11eb-924d-9cd76263cbd0 | Extended Programme | primary-street-16 | seasonal-city-35 |
| 2 | Adaptive Corridor D | c19a2028-8fc0-11eb-924d-9cd76263cbd0 | Pilot Standard | adaptive-street-17 | regional-city-36 |
| 3 | Primary Series | 39800619 | Pilot Standard | adaptive-street-17 | regional-city-36 |
| 3 | Primary Series | 39800619 | Baseline Framework D | distributed-street-18 | legacy-city-37 |
| 4 | Composite Assessment | 168556 | Baseline Framework D | distributed-street-18 | legacy-city-37 |
| 4 | Composite Assessment | 168556 | Integrated Protocol A | composite-street-15 | integrated-city-34 |

The watershed_facility_detail_view presents a watershed-centric view of the facilities within each environmental zone, answering which facilities are managed under each watershed's jurisdiction. The Distributed Survey watershed contains Integrated Protocol A. The Adaptive Corridor D watershed contains Extended Programme. The Primary Series watershed contains Pilot Standard. The Composite Assessment watershed contains Baseline Framework D. This view supports watershed-level environmental planning, allowing regulators to aggregate facility data and assess cumulative environmental impacts within each management zone.

**View `animal_confinement_building_facility_view`**

```sql
CREATE VIEW animal_confinement_building_facility_view AS
SELECT a.id, a.buildingIdentifier, a.buildingType, a.constructionStatus, b.facilityName AS facility_facilityName, b.streetAddress AS facility_streetAddress, b.city AS facility_city
FROM AnimalConfinementBuilding a JOIN Facility b ON a.facilityZipCode = b.zipCode;
```

| id | buildingIdentifier | buildingType | constructionStatus | facility_facilityName | facility_streetAddress | facility_city |
|---|---|---|---|---|---|---|
| 1 | BUI-2149 | composite-building-51 | Existing | Integrated Protocol A | composite-street-15 | integrated-city-34 |
| 2 | BUI-2152 | primary-building-52 | Proposed New | Extended Programme | primary-street-16 | seasonal-city-35 |
| 3 | BUI-2155 | adaptive-building-53 | Proposed Modification | Pilot Standard | adaptive-street-17 | regional-city-36 |
| 4 | BUI-2158 | distributed-building-54 | Existing | Baseline Framework D | distributed-street-18 | legacy-city-37 |

The animal_confinement_building_facility_view joins building records with their parent facilities, answering which facility each building belongs to and what the facility's geographic context is. Building BUI-2149 is part of Integrated Protocol A at zip code 69434. Building BUI-2152 belongs to Extended Programme at zip code 13589. Building BUI-2155 is associated with Pilot Standard at zip code 9bb5fec0-8fcc-11eb-924d-9cd76263cbd0. Building BUI-2158 is part of Baseline Framework D at zip code 1250214. This view supports building-level regulatory tracking and ensures that construction status and building type are always evaluated in the context of the parent facility.

**View `animal_confinement_building_animal_capacity_detail_view`**

```sql
CREATE VIEW animal_confinement_building_animal_capacity_detail_view AS
SELECT a.id, a.buildingIdentifier, a.buildingType, b.capacityId AS capacity_capacityId, b.animalType AS capacity_animalType, b.capacityCount AS capacity_capacityCount
FROM AnimalConfinementBuilding a
  JOIN AnimalConfinementBuildingAnimalCapacity j ON j.buildingId = a.id
  JOIN AnimalCapacity b ON b.capacityId = j.capacityId;
```

| id | buildingIdentifier | buildingType | capacity_capacityId | capacity_animalType | capacity_capacityCount |
|---|---|---|---|---|---|
| 1 | BUI-2149 | composite-building-51 | 100 | seasonal-animal-59 | 9 |
| 1 | BUI-2149 | composite-building-51 | 101 | regional-animal-60 | 0 |
| 2 | BUI-2152 | primary-building-52 | 101 | regional-animal-60 | 0 |
| 2 | BUI-2152 | primary-building-52 | 102 | legacy-animal-61 | 0 |
| 3 | BUI-2155 | adaptive-building-53 | 102 | legacy-animal-61 | 0 |
| 3 | BUI-2155 | adaptive-building-53 | 103 | compact-animal-62 | 20 |
| 4 | BUI-2158 | distributed-building-54 | 103 | compact-animal-62 | 20 |
| 4 | BUI-2158 | distributed-building-54 | 100 | seasonal-animal-59 | 9 |

The animal_confinement_building_animal_capacity_detail_view connects buildings to their animal capacity records, answering what animal populations are housed in each building and under what classification. Building BUI-2149 houses seasonal-animal-59 with a capacity of 9 under AFF classification. Building BUI-2152 houses regional-animal-60 with a capacity of 0 under CAFF classification. Building BUI-2155 houses legacy-animal-61 with a capacity of 0 under MCAFF classification. Building BUI-2158 houses compact-animal-62 with a capacity of 20 under AFF classification. This view enables building-level capacity reporting and supports compliance verification by linking physical structures to their authorized animal populations.

**View `animal_capacity_animal_confinement_building_view`**

```sql
CREATE VIEW animal_capacity_animal_confinement_building_view AS
SELECT a.capacityId, a.animalType, a.capacityCount, a.facilityClassification, b.id AS building_id, b.buildingIdentifier AS building_buildingIdentifier, b.buildingType AS building_buildingType
FROM AnimalCapacity a JOIN AnimalConfinementBuilding b ON a.buildingId = b.id;
```

| capacityId | animalType | capacityCount | facilityClassification | building_id | building_buildingIdentifier | building_buildingType |
|---|---|---|---|---|---|---|
| 100 | seasonal-animal-59 | 9 | AFF | 1 | BUI-2149 | composite-building-51 |
| 101 | regional-animal-60 | 0 | CAFF | 2 | BUI-2152 | primary-building-52 |
| 102 | legacy-animal-61 | 0 | MCAFF | 3 | BUI-2155 | adaptive-building-53 |
| 103 | compact-animal-62 | 20 | AFF | 4 | BUI-2158 | distributed-building-54 |

The animal_capacity_animal_confinement_building_view presents capacity records alongside their associated buildings, answering which building is responsible for each capacity classification and what the building's construction status is. Capacity ID 100 (seasonal-animal-59, count 9, AFF) is associated with building BUI-2149 (Existing status). Capacity ID 101 (regional-animal-60, count 0, CAFF) is linked to building BUI-2152 (Proposed New status). Capacity ID 102 (legacy-animal-61, count 0, MCAFF) connects to building BUI-2155 (Proposed Modification status). Capacity ID 103 (compact-animal-62, count 20, AFF) is tied to building BUI-2158 (Existing status). This view supports capacity auditing and helps regulators verify that reported animal numbers align with the construction status and classification of the housing structures.

**View `animal_capacity_facility_view`**

```sql
CREATE VIEW animal_capacity_facility_view AS
SELECT a.capacityId, a.animalType, a.capacityCount, a.facilityClassification, b.facilityName AS facility_facilityName, b.streetAddress AS facility_streetAddress, b.city AS facility_city
FROM AnimalCapacity a JOIN Facility b ON a.facilityZipCode = b.zipCode;
```

| capacityId | animalType | capacityCount | facilityClassification | facility_facilityName | facility_streetAddress | facility_city |
|---|---|---|---|---|---|---|
| 100 | seasonal-animal-59 | 9 | AFF | Integrated Protocol A | composite-street-15 | integrated-city-34 |
| 101 | regional-animal-60 | 0 | CAFF | Extended Programme | primary-street-16 | seasonal-city-35 |
| 102 | legacy-animal-61 | 0 | MCAFF | Pilot Standard | adaptive-street-17 | regional-city-36 |
| 103 | compact-animal-62 | 20 | AFF | Baseline Framework D | distributed-street-18 | legacy-city-37 |

The animal_capacity_facility_view joins capacity records with their parent facilities, answering which facility each capacity record belongs to and what the facility's geographic identifiers are. Capacity ID 100 is associated with Integrated Protocol A at zip code 69434. Capacity ID 101 belongs to Extended Programme at zip code 13589. Capacity ID 102 is linked to Pilot Standard at zip code 9bb5fec0-8fcc-11eb-924d-9cd76263cbd0. Capacity ID 103 is part of Baseline Framework D at zip code 1250214. This view enables facility-level aggregation of animal populations and supports regulatory reporting on total animal counts by geographic jurisdiction.

**View `permit_application_owner_operator_detail_view`**

```sql
CREATE VIEW permit_application_owner_operator_detail_view AS
SELECT a.applicationId, a.applicationDate, a.permitType, b.id AS operator_id, b.legalName AS operator_legalName, b.contactPerson AS operator_contactPerson
FROM PermitApplication a
  JOIN PermitApplicationOwnerOperator j ON j.applicationId = a.applicationId
  JOIN OwnerOperator b ON b.id = j.operatorId;
```

| applicationId | applicationDate | permitType | operator_id | operator_legalName | operator_contactPerson |
|---|---|---|---|---|---|
| 505997 | 2022-05-16T16:24:00 | Permit to Install | 1000 | Jorge Sullivan | Alyssa Chung |
| 505997 | 2022-05-16T16:24:00 | Permit to Install | 1001 | Walter Pratt | Brianna Mejia |
| 1250196 | 2023-10-27T23:41:00 | Permit to Operate | 1001 | Walter Pratt | Brianna Mejia |
| 1250196 | 2023-10-27T23:41:00 | Permit to Operate | 1002 | Home Medix Oxygen | Eric Schultz |
| 124 | 2024-03-11T06:58:00 | NPDES | 1002 | Home Medix Oxygen | Eric Schultz |
| 124 | 2024-03-11T06:58:00 | NPDES | 1003 | Hector Garcia | Peter Montgomery |
| IVC20det40 | 2025-08-22T13:15:00 | Construction Storm Water NPDES | 1003 | Hector Garcia | Peter Montgomery |
| IVC20det40 | 2025-08-22T13:15:00 | Construction Storm Water NPDES | 1000 | Jorge Sullivan | Alyssa Chung |

The permit_application_owner_operator_detail_view joins permit applications with their submitting operators, answering which operator submitted each application and what the application's regulatory details are. Application 505997 was submitted by operator 1000 (Jorge Sullivan) for a Permit to Install with a fee of 38.08. Application 1250196 was submitted by operator 1001 (Walter Pratt) for a Permit to Operate with a fee of 18.47. Application 124 was submitted by operator 1002 (Home Medix Oxygen) for an NPDES permit with a fee of 38.08. Application IVC20det40 was submitted by operator 1003 (Hector Garcia) for a Construction Storm Water NPDES permit with a fee of 26.25. This view supports operator-level regulatory tracking and enables analysis of application patterns, fee structures, and permit types by operator entity.

**View `permit_application_facility_view`**

```sql
CREATE VIEW permit_application_facility_view AS
SELECT a.applicationId, a.applicationDate, a.permitType, a.reasonCode, b.facilityName AS facility_facilityName, b.streetAddress AS facility_streetAddress, b.city AS facility_city
FROM PermitApplication a JOIN Facility b ON a.facilityZipCode = b.zipCode;
```

| applicationId | applicationDate | permitType | reasonCode | facility_facilityName | facility_streetAddress | facility_city |
|---|---|---|---|---|---|---|
| 505997 | 2022-05-16T16:24:00 | Permit to Install | New CAFF/MCAFF | Integrated Protocol A | composite-street-15 | integrated-city-34 |
| 1250196 | 2023-10-27T23:41:00 | Permit to Operate | Manure Storage Expansion | Extended Programme | primary-street-16 | seasonal-city-35 |
| 124 | 2024-03-11T06:58:00 | NPDES | Modification | Pilot Standard | adaptive-street-17 | regional-city-36 |
| IVC20det40 | 2025-08-22T13:15:00 | Construction Storm Water NPDES | Capacity Expansion | Baseline Framework D | distributed-street-18 | legacy-city-37 |

The permit_application_facility_view connects permit applications to their associated facilities, answering which facility each application pertains to and what the facility's location is. Application 505997 pertains to a facility at zip code 69434. Application 1250196 pertains to a facility at zip code 13589. Application 124 pertains to a facility at zip code 9bb5fec0-8fcc-11eb-924d-9cd76263cbd0. Application IVC20det40 pertains to a facility at zip code 1250214. This view ensures that every permit application is traceable to its physical site, supporting on-site inspections, compliance verification, and geographic analysis of permitting activity.

**View `permit_application_owner_operator_view`**

```sql
CREATE VIEW permit_application_owner_operator_view AS
SELECT a.applicationId, a.applicationDate, a.permitType, a.reasonCode, b.id AS operator_id, b.legalName AS operator_legalName, b.contactPerson AS operator_contactPerson
FROM PermitApplication a JOIN OwnerOperator b ON a.operatorId = b.id;
```

| applicationId | applicationDate | permitType | reasonCode | operator_id | operator_legalName | operator_contactPerson |
|---|---|---|---|---|---|---|
| 505997 | 2022-05-16T16:24:00 | Permit to Install | New CAFF/MCAFF | 1000 | Jorge Sullivan | Alyssa Chung |
| 1250196 | 2023-10-27T23:41:00 | Permit to Operate | Manure Storage Expansion | 1001 | Walter Pratt | Brianna Mejia |
| 124 | 2024-03-11T06:58:00 | NPDES | Modification | 1002 | Home Medix Oxygen | Eric Schultz |
| IVC20det40 | 2025-08-22T13:15:00 | Construction Storm Water NPDES | Capacity Expansion | 1003 | Hector Garcia | Peter Montgomery |

The permit_application_owner_operator_view provides a streamlined view of applications linked to their operators, answering which operators have active or historical permit applications and what types of permits they are pursuing. This view consolidates operator identity with application metadata, enabling regulators to quickly assess an operator's permitting portfolio and identify operators with multiple pending or approved applications.

**View `permit_application_other_permit_view`**

```sql
CREATE VIEW permit_application_other_permit_view AS
SELECT a.applicationId, a.applicationDate, a.permitType, a.reasonCode, b.id AS permit_id, b.permitName AS permit_permitName, b.issuingAuthority AS permit_issuingAuthority
FROM PermitApplication a JOIN OtherPermit b ON a.permitId = b.id;
```

| applicationId | applicationDate | permitType | reasonCode | permit_id | permit_permitName | permit_issuingAuthority |
|---|---|---|---|---|---|---|
| 505997 | 2022-05-16T16:24:00 | Permit to Install | New CAFF/MCAFF | 1 | Regional Model | extended-issuing-33 |
| 1250196 | 2023-10-27T23:41:00 | Permit to Operate | Manure Storage Expansion | 2 | Seasonal Cluster D | integrated-issuing-34 |
| 124 | 2024-03-11T06:58:00 | NPDES | Modification | 3 | Integrated Review | seasonal-issuing-35 |
| IVC20det40 | 2025-08-22T13:15:00 | Construction Storm Water NPDES | Capacity Expansion | 4 | Extended Initiative | regional-issuing-36 |

The permit_application_other_permit_view joins primary permit applications with their associated other permits, answering which supplementary permits accompany each primary application. This view ensures that regulators can see the complete set of regulatory authorizations required for a facility, capturing both the primary permit and any additional environmental or operational approvals that must be obtained.

**View `other_permit_permit_application_view`**

```sql
CREATE VIEW other_permit_permit_application_view AS
SELECT a.id, a.permitName, a.issuingAuthority, a.permitNumber, b.applicationId AS application_applicationId, b.applicationDate AS application_applicationDate, b.permitType AS application_permitType
FROM OtherPermit a JOIN PermitApplication b ON a.applicationId = b.applicationId;
```

| id | permitName | issuingAuthority | permitNumber | application_applicationId | application_applicationDate | application_permitType |
|---|---|---|---|---|---|---|
| 1 | Regional Model | extended-issuing-33 | PER-2638 | 505997 | 2022-05-16T16:24:00 | Permit to Install |
| 2 | Seasonal Cluster D | integrated-issuing-34 | PER-2640 | 1250196 | 2023-10-27T23:41:00 | Permit to Operate |
| 3 | Integrated Review | seasonal-issuing-35 | PER-2642 | 124 | 2024-03-11T06:58:00 | NPDES |
| 4 | Extended Initiative | regional-issuing-36 | PER-2644 | IVC20det40 | 2025-08-22T13:15:00 | Construction Storm Water NPDES |

The other_permit_permit_application_view presents other permits alongside their parent permit applications, answering which primary application each supplementary permit supports and what the application's regulatory context is. This view supports the tracking of secondary regulatory requirements and ensures that no supplementary permit is orphaned from its parent application, maintaining a complete regulatory record for each facility.

The system's architecture reflects the interconnected nature of environmental regulation: operators manage facilities, facilities contain buildings and animal populations, buildings define capacity classifications, and all of these elements exist within watershed jurisdictions and are governed by a layered permitting process. The views synthesize these relationships into actionable records, enabling regulators to trace accountability from the operator level down to individual buildings and capacity counts, while also aggregating data at the watershed level for environmental impact assessment. This structure supports both granular compliance verification and broad regional planning, ensuring that regulatory oversight operates at the appropriate scale for each decision context.