## Domain Modelling and Relational Materialization

The domain under examination concerns the regulatory oversight of agricultural confinement operations—specifically, the management of animal feeding operations, their physical infrastructure, and the permitting lifecycle that governs their construction, modification, and ongoing compliance. At the heart of the model sit seven core entity types: `OwnerOperator`, `Facility`, `Watershed`, `AnimalConfinementBuilding`, `AnimalCapacity`, `PermitApplication`, and `OtherPermit`. Each entity type materializes as a base table whose columns correspond directly to the entity's intrinsic attributes, while the relationships between entities—many of which are many-to-many in the domain—become junction tables that preserve referential integrity without introducing data anomalies. The model also defines a set of denormalized views that reassemble normalized rows into domain-level facts, enabling analysts to answer questions like "which owner-operator holds which permits at which facility" or "what is the total animal capacity across all buildings in a given watershed" without writing multi-join queries by hand.

**Table `OwnerOperator`**

| id | legalName | contactPerson | streetAddress | city | state | zipCode | phone | emailAddress | entityType |
|---|---|---|---|---|---|---|---|---|---|
| 1000 | Jorge Sullivan | Alyssa Chung | composite-street-15 | integrated-city-34 | distributed-state-84 | 69434 | compact-phone-26 | primary-email-70 | Individual |
| 1001 | Walter Pratt | Brianna Mejia | primary-street-16 | seasonal-city-35 | baseline-state-85 | 13589 | composite-phone-27 | adaptive-email-71 | Corporation |
| 1002 | Home Medix Oxygen | Eric Schultz | adaptive-street-17 | regional-city-36 | pilot-state-86 | 9bb5fec0-8fcc-11eb-924d-9cd76263cbd0 | primary-phone-28 | distributed-email-72 | LLC |
| 1003 | Hector Garcia | Peter Montgomery | distributed-street-18 | legacy-city-37 | extended-state-87 | 1250214 | adaptive-phone-29 | baseline-email-73 | LLP |

The `OwnerOperator` table captures the legal and contact identity of the entity responsible for a confinement operation. Its primary key, `id`, is an integer surrogate (values such as `1000`, `1001`, `1002`, `1003` in the sample data), while the `legalName` column stores the registered business or individual name—`Jorge Sullivan`, `Walter Pratt`, `Home Medix Oxygen`, `Hector Garcia`. The `contactPerson` column names the human point of contact (`Alyssa Chung`, `Brianna Mejia`, `Eric Schultz`, `Peter Montgomery`), and the address fields (`streetAddress`, `city`, `state`, `zipCode`) together with `phone` and `emailAddress` provide full contactability. The `entityType` column classifies the operator as `Individual`, `Corporation`, `LLC`, or `LLP`, a discriminator that downstream views can use to filter or aggregate by legal structure.

**Table `Facility`**

| facilityName | streetAddress | city | state | zipCode | county | township | section | contactPhone | contactEmail | watershedId |
|---|---|---|---|---|---|---|---|---|---|---|
| Integrated Protocol A | composite-street-15 | integrated-city-34 | distributed-state-84 | 69434 | primary-county-52 | legacy-township-61 | extended-section-45 | Joe Tsai | Christopher Wilson | 1 |
| Extended Programme | primary-street-16 | seasonal-city-35 | baseline-state-85 | 13589 | adaptive-county-53 | compact-township-62 | integrated-section-46 | Stephanie Collins | Charles Larsen | 2 |
| Pilot Standard | adaptive-street-17 | regional-city-36 | pilot-state-86 | 9bb5fec0-8fcc-11eb-924d-9cd76263cbd0 | distributed-county-54 | composite-township-63 | seasonal-section-47 | Tasha Rodriguez | Mary Alvarez | 3 |
| Baseline Framework D | distributed-street-18 | legacy-city-37 | extended-state-87 | 1250214 | baseline-county-55 | primary-township-64 | regional-section-48 | Walter Pratt | April Snyder | 4 |

A `Facility` represents a physical site where animal confinement activities occur. Unlike `OwnerOperator`, the `Facility` table does not carry an explicit surrogate primary key in the sample schema; instead, the combination of `facilityName` and the address columns serves as the natural key. The `facilityName` column holds values such as `Integrated Protocol A`, `Extended Programme`, `Pilot Standard`, and `Baseline Framework D`. Address and jurisdictional fields (`streetAddress`, `city`, `state`, `zipCode`, `county`, `township`, `section`) mirror the granularity of the `OwnerOperator` address model, enabling geospatial joins. The `contactPhone` and `contactEmail` columns store site-specific contact information, distinct from the operator's corporate contact. Crucially, the `watershedId` column is a foreign key referencing `Watershed.id`, establishing a many-to-one relationship: each facility belongs to exactly one watershed, while a watershed may contain many facilities.

**Table `Watershed`**

| id | watershedName | epaAddressCode |
|---|---|---|
| 1 | Distributed Survey | 8928512 |
| 2 | Adaptive Corridor D | c19a2028-8fc0-11eb-924d-9cd76263cbd0 |
| 3 | Primary Series | 39800619 |
| 4 | Composite Assessment | 168556 |

The `Watershed` table defines the hydrological basin to which a facility contributes runoff. Its primary key `id` (values `1` through `4`) pairs with `watershedName` (`Distributed Survey`, `Adaptive Corridor D`, `Primary Series`, `Composite Assessment`) and `epaAddressCode` (numeric codes like `8928512` and `39800619`, or UUID-like strings such as `c19a2028-8fc0-11eb-924d-9cd76263cbd0`). The watershed acts as a geographic container; the foreign key in `Facility.watershedId` ensures that every facility is attributable to a single watershed for environmental reporting.

**Table `AnimalConfinementBuilding`**

| id | buildingIdentifier | buildingType | constructionStatus | facilityZipCode |
|---|---|---|---|---|
| 1 | BUI-2149 | composite-building-51 | Existing | 69434 |
| 2 | BUI-2152 | primary-building-52 | Proposed New | 13589 |
| 3 | BUI-2155 | adaptive-building-53 | Proposed Modification | 9bb5fec0-8fcc-11eb-924d-9cd76263cbd0 |
| 4 | BUI-2158 | distributed-building-54 | Existing | 1250214 |

Within a facility, individual structures that house confined animals are modelled as `AnimalConfinementBuilding` records. The primary key `id` (values `1` through `4`) identifies each building, while `buildingIdentifier` provides a human-readable tag (`BUI-2149`, `BUI-2152`, `BUI-2155`, `BUI-2158`). The `buildingType` column distinguishes structural categories (`composite-building-51`, `primary-building-52`, `adaptive-building-53`, `distributed-building-54`), and `constructionStatus` records whether the building is `Existing`, `Proposed New`, or `Proposed Modification`. The `facilityZipCode` column anchors the building to a geographic area, and the many-to-many relationship between buildings and facilities is resolved through the junction table `FacilityAnimalConfinementBuilding`.

**Table `AnimalCapacity`**

| capacityId | animalType | capacityCount | facilityClassification | buildingId | facilityZipCode |
|---|---|---|---|---|---|
| 100 | seasonal-animal-59 | 9 | AFF | 1 | 69434 |
| 101 | regional-animal-60 | 0 | CAFF | 2 | 13589 |
| 102 | legacy-animal-61 | 0 | MCAFF | 3 | 9bb5fec0-8fcc-11eb-924d-9cd76263cbd0 |
| 103 | compact-animal-62 | 20 | AFF | 4 | 1250214 |

The `AnimalCapacity` table quantifies the animal-holding capability of each building. Its primary key `capacityId` (values `100` through `103`) identifies each capacity record. The `animalType` column specifies the species or class (`seasonal-animal-59`, `regional-animal-60`, `legacy-animal-61`, `compact-animal-62`), `capacityCount` stores the integer headcount (`9`, `0`, `0`, `20`), and `facilityClassification` categorizes the operation as `AFF`, `CAFF`, or `MCAFF`. The `buildingId` column is a foreign key to `AnimalConfinementBuilding.id`, creating a one-to-many relationship: each building can have multiple capacity records (one per animal type), and each capacity record belongs to exactly one building. The `facilityZipCode` column provides a redundant geographic anchor for query performance.

**Table `PermitApplication`**

| applicationId | applicationDate | permitType | reasonCode | feeAmount | preparedBy | preparedByCompany | preparedByPhone | preparedByEmail | facilityZipCode | operatorId | permitId |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 505997 | 2022-05-16T16:24:00 | Permit to Install | New CAFF/MCAFF | 38.08 | composite-prepared-15 | U.S. Steel | distributed-prepared-24 | adaptive-prepared-35 | 69434 | 1000 | 1 |
| 1250196 | 2023-10-27T23:41:00 | Permit to Operate | Manure Storage Expansion | 18.47 | primary-prepared-16 | District No. 3 | baseline-prepared-25 | distributed-prepared-36 | 13589 | 1001 | 2 |
| 124 | 2024-03-11T06:58:00 | NPDES | Modification | 38.08 | adaptive-prepared-17 | E2open Parent Holdings Inc. | pilot-prepared-26 | baseline-prepared-37 | 9bb5fec0-8fcc-11eb-924d-9cd76263cbd0 | 1002 | 3 |
| IVC20det40 | 2025-08-22T13:15:00 | Construction Storm Water NPDES | Capacity Expansion | 26.25 | distributed-prepared-18 | Sanniquellie Mahn | extended-prepared-27 | pilot-prepared-38 | 1250214 | 1003 | 4 |

The `PermitApplication` table records the lifecycle of regulatory permit submissions. Its primary key `applicationId` is a string (values such as `505997`, `1250196`, `124`, `IVC20det40`), and `applicationDate` stores the submission timestamp (`2022-05-16T16:24:00`, `2023-10-27T23:41:00`, `2024-03-11T06:58:00`, `2025-08-22T13:15:00`). The `permitType` column identifies the permit category (`Permit to Install`, `Permit to Operate`, `NPDES`, `Construction Storm Water NPDES`), while `reasonCode` describes the trigger (`New CAFF/MCAFF`, `Manure Storage Expansion`, `Modification`, `Capacity Expansion`). Financial and administrative metadata include `feeAmount` (`38.08`, `18.47`, `38.08`, `26.25`), `preparedBy`, `preparedByCompany` (`U.S. Steel`, `District No. 3`, `E2open Parent Holdings Inc.`, `Sanniquellie Mahn`), `preparedByPhone`, and `preparedByEmail`. The `facilityZipCode` column anchors the application to a location, `operatorId` is a foreign key to `OwnerOperator.id` (values `1000` through `1003`), and `permitId` is a foreign key to `OtherPermit.permitId` (values `1` through `4`). The many-to-many relationship between operators and applications is additionally captured in the junction table `PermitApplicationOwnerOperator`.

**Table `OtherPermit`**

| id | permitName | issuingAuthority | permitNumber | status | applicationId |
|---|---|---|---|---|---|
| 1 | Regional Model | extended-issuing-33 | PER-2638 | Pending | 505997 |
| 2 | Seasonal Cluster D | integrated-issuing-34 | PER-2640 | Active | 1250196 |
| 3 | Integrated Review | seasonal-issuing-35 | PER-2642 | Expired | 124 |
| 4 | Extended Initiative | regional-issuing-36 | PER-2644 | Not Required | IVC20det40 |

The `OtherPermit` table defines the catalog of permit types available in the regulatory system. Its primary key `permitId` (values `1` through `4`) pairs with `permitName`, `permitDescription`, `permitStatus`, and `permitExpiryDate`. Each `PermitApplication` references exactly one `OtherPermit` record via `permitId`, while a single permit type can be referenced by many applications over time.

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

The junction table `OwnerOperatorPermitApplication` resolves the many-to-many relationship between `OwnerOperator` and `PermitApplication`. It contains foreign keys to both parent tables, allowing an operator to hold multiple permit applications and a single application to be associated with multiple operators (e.g., in joint ventures). The companion junction table `PermitApplicationOwnerOperator` serves the same logical purpose from the application's perspective, ensuring bidirectional navigability in the data model.

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

The `OwnerOperatorFacility` junction table links operators to the facilities they manage. Since an operator may manage multiple facilities and a facility may have multiple managing operators, this table captures the full cardinality of the relationship. The companion table `FacilityOwnerOperator` provides the inverse mapping, ensuring that queries can start from either entity type without loss of information.

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

As noted, `FacilityOwnerOperator` is the inverse of `OwnerOperatorFacility`. Both tables exist to support efficient bidirectional joins in the view layer: a query seeking "all operators for a facility" can join directly through `FacilityOwnerOperator` without traversing the reverse direction of `OwnerOperatorFacility`.

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

The `FacilityAnimalConfinementBuilding` junction table associates facilities with their constituent confinement buildings. A facility may contain many buildings, and a building may be associated with multiple facilities (e.g., in multi-site operations). This table preserves the full many-to-many cardinality.

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

The `FacilityAnimalCapacity` junction table links facilities to animal capacity records. Since capacity records are already tied to buildings via `AnimalConfinementBuilding.id`, this table provides a direct facility-to-capacity path that avoids an extra join when querying aggregate capacity at the facility level.

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

The `WatershedFacility` junction table captures the watershed-to-facility relationship. Although `Facility.watershedId` already provides a direct foreign key, the junction table exists to support additional metadata on the relationship (such as effective dates or classification codes) and to enable clean joins in the view layer.

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

The `AnimalConfinementBuildingAnimalCapacity` junction table links buildings to their capacity records. While `AnimalCapacity.buildingId` already provides a direct foreign key, this junction table allows for additional relationship metadata and supports the view layer's denormalized queries.

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

The view `owner_operator_permit_application_detail_view` reconstructs the operator-permit-application fact by joining `OwnerOperator`, `PermitApplication`, and the junction tables `OwnerOperatorPermitApplication` and `PermitApplicationOwnerOperator`. The result answers the question: "Which permit applications does each owner-operator hold, and what are the details of those applications?" A representative row shows operator `1000` (`Jorge Sullivan`, entityType `Individual`) associated with application `505997` (`Permit to Install`, reason `New CAFF/MCAFF`, fee `38.08`, prepared by `U.S. Steel`). Another row links operator `1001` (`Walter Pratt`, entityType `Corporation`) to application `1250196` (`Permit to Operate`, reason `Manure Storage Expansion`, fee `18.47`, prepared by `District No. 3`). The view materializes the legal name, contact details, and entity type alongside the full permit application record, enabling compliance officers to audit operator-level permit portfolios.

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

The view `owner_operator_facility_detail_view` joins `OwnerOperator`, `Facility`, and the junction tables `OwnerOperatorFacility` and `FacilityOwnerOperator` to answer: "Which facilities does each owner-operator manage?" A sample row pairs operator `1000` (`Jorge Sullivan`) with facility `Integrated Protocol A` located at `composite-street-15`, `integrated-city-34`, `distributed-state-84`, zip `69434`, in `primary-county-52`. Another row links operator `1001` (`Walter Pratt`) to facility `Extended Programme` at `primary-street-16`, `seasonal-city-35`, `baseline-state-85`, zip `13589`, in `adaptive-county-53`. The view preserves the operator's contact information alongside the facility's full address and jurisdictional details, supporting field inspections and correspondence.

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

The view `facility_watershed_view` joins `Facility` with `Watershed` (via `Facility.watershedId` and the `WatershedFacility` junction table) to answer: "Which watershed does each facility belong to?" A representative row shows facility `Integrated Protocol A` assigned to watershed `Distributed Survey` (EPA code `8928512`). Another row links facility `Extended Programme` to watershed `Adaptive Corridor D` (EPA code `c19a2028-8fc0-11eb-924d-9cd76263cbd0`). The view enables environmental impact analysis at the watershed level, aggregating facility counts, total capacity, and permit activity by hydrological basin.

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

The view `facility_owner_operator_detail_view` joins `Facility` with `OwnerOperator` through `FacilityOwnerOperator` and `OwnerOperatorFacility` to answer: "Which owner-operator manages each facility?" A sample row shows facility `Integrated Protocol A` managed by operator `1000` (`Jorge Sullivan`, entityType `Individual`, contact `Alyssa Chung`). Another row links facility `Baseline Framework D` to operator `1003` (`Hector Garcia`, entityType `LLP`, contact `Peter Montgomery`). The view provides a facility-centric perspective on operator assignments, useful for regulatory notifications and enforcement actions.

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

The view `facility_animal_confinement_building_detail_view` joins `Facility` with `AnimalConfinementBuilding` via `FacilityAnimalConfinementBuilding` to answer: "Which confinement buildings are located at each facility?" A representative row pairs facility `Integrated Protocol A` with building `BUI-2149` (type `composite-building-51`, status `Existing`, zip `69434`). Another row links facility `Extended Programme` to building `BUI-2152` (type `primary-building-52`, status `Proposed New`, zip `13589`). The view supports infrastructure inventories and construction-status tracking at the facility level.

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

The view `facility_animal_capacity_detail_view` joins `Facility` with `AnimalCapacity` through `FacilityAnimalCapacity` to answer: "What is the animal capacity at each facility?" A sample row shows facility `Integrated Protocol A` with capacity record `100` (animal type `seasonal-animal-59`, count `9`, classification `AFF`). Another row links facility `Extended Programme` to capacity record `101` (animal type `regional-animal-60`, count `0`, classification `CAFF`). The view enables capacity-based regulatory classification and reporting.

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

The view `watershed_facility_detail_view` joins `Watershed` with `Facility` via `WatershedFacility` to answer: "Which facilities are located within each watershed?" A representative row shows watershed `Distributed Survey` containing facility `Integrated Protocol A` at `composite-street-15`, `integrated-city-34`. Another row links watershed `Adaptive Corridor D` to facility `Extended Programme` at `primary-street-16`, `seasonal-city-35`. The view supports watershed-level environmental assessments and regulatory planning.

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

The view `animal_confinement_building_facility_view` joins `AnimalConfinementBuilding` with `Facility` through `FacilityAnimalConfinementBuilding` to answer: "Which facility does each confinement building belong to?" A sample row shows building `BUI-2149` (type `composite-building-51`, status `Existing`) associated with facility `Integrated Protocol A`. Another row links building `BUI-2152` (type `primary-building-52`, status `Proposed New`) to facility `Extended Programme`. The view provides a building-centric perspective on facility assignments.

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

The view `animal_confinement_building_animal_capacity_detail_view` joins `AnimalConfinementBuilding` with `AnimalCapacity` via `AnimalConfinementBuildingAnimalCapacity` to answer: "What is the animal capacity of each confinement building?" A representative row shows building `BUI-2149` with capacity record `100` (animal type `seasonal-animal-59`, count `9`, classification `AFF`). Another row links building `BUI-2152` to capacity record `101` (animal type `regional-animal-60`, count `0`, classification `CAFF`). The view supports building-level capacity audits and compliance verification.

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

The view `animal_capacity_animal_confinement_building_view` joins `AnimalCapacity` with `AnimalConfinementBuilding` through `AnimalConfinementBuildingAnimalCapacity` to answer: "Which building does each capacity record belong to?" A sample row shows capacity record `100` (animal type `seasonal-animal-59`, count `9`) associated with building `BUI-2149` (type `composite-building-51`). Another row links capacity record `103` (animal type `compact-animal-62`, count `20`) to building `BUI-2158` (type `distributed-building-54`). The view provides a capacity-centric perspective on building assignments.

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

The view `animal_capacity_facility_view` joins `AnimalCapacity` with `Facility` through `FacilityAnimalCapacity` to answer: "Which facility does each capacity record belong to?" A representative row shows capacity record `100` (animal type `seasonal-animal-59`, count `9`, classification `AFF`) associated with facility `Integrated Protocol A`. Another row links capacity record `103` (animal type `compact-animal-62`, count `20`, classification `AFF`) to facility `Baseline Framework D`. The view enables facility-level capacity aggregation and regulatory classification.

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

The view `permit_application_owner_operator_detail_view` joins `PermitApplication` with `OwnerOperator` via `PermitApplicationOwnerOperator` and `OwnerOperatorPermitApplication` to answer: "Which owner-operator submitted each permit application?" A sample row shows application `505997` (`Permit to Install`, reason `New CAFF/MCAFF`, fee `38.08`) submitted by operator `1000` (`Jorge Sullivan`, entityType `Individual`, contact `Alyssa Chung`). Another row links application `1250196` (`Permit to Operate`, reason `Manure Storage Expansion`, fee `18.47`) to operator `1001` (`Walter Pratt`, entityType `Corporation`, contact `Brianna Mejia`). The view supports application-level operator attribution and audit trails.

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

The view `permit_application_facility_view` joins `PermitApplication` with `Facility` (via `facilityZipCode` and the facility junction tables) to answer: "Which facility is each permit application associated with?" A representative row shows application `505997` associated with facility `Integrated Protocol A` at zip `69434`. Another row links application `1250196` to facility `Extended Programme` at zip `13589`. The view enables facility-level permit tracking and compliance monitoring.

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

The view `permit_application_owner_operator_view` joins `PermitApplication` with `OwnerOperator` through `PermitApplicationOwnerOperator` to answer: "Which owner-operator is associated with each permit application?" A sample row shows application `505997` (`Permit to Install`) associated with operator `1000` (`Jorge Sullivan`). Another row links application `124` (`NPDES`) to operator `1002` (`Home Medix Oxygen`, entityType `LLC`). The view provides a simplified operator-application mapping for reporting dashboards.

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

The view `permit_application_other_permit_view` joins `PermitApplication` with `OtherPermit` via the `permitId` foreign key to answer: "Which permit type does each application reference?" A representative row shows application `505997` (`Permit to Install`) referencing permit `1`. Another row links application `1250196` (`Permit to Operate`) to permit `2`. The view enables permit-type analysis and categorization across the application portfolio.

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

The view `other_permit_permit_application_view` joins `OtherPermit` with `PermitApplication` through the `permitId` foreign key to answer: "Which permit applications reference each permit type?" A sample row shows permit `1` referenced by application `505997` (`Permit to Install`, reason `New CAFF/MCAFF`). Another row links permit `2` to application `1250196` (`Permit to Operate`, reason `Manure Storage Expansion`). The view supports permit-type usage statistics and lifecycle analysis.

## Synthesis

The relational schema materializes a rich, multi-faceted domain model where each base table encodes a distinct entity type with its intrinsic attributes, and junction tables preserve the many-to-many relationships that arise naturally in regulatory oversight—operators managing multiple facilities, facilities containing multiple buildings, buildings holding multiple capacity records, and applications referencing multiple permit types. The foreign keys (`Facility.watershedId → Watershed.id`, `AnimalCapacity.buildingId → AnimalConfinementBuilding.id`, `PermitApplication.operatorId → OwnerOperator.id`, `PermitApplication.permitId → OtherPermit.permitId`) enforce referential integrity at the database level, while the junction tables (`OwnerOperatorFacility`, `FacilityAnimalConfinementBuilding`, `FacilityAnimalCapacity`, `WatershedFacility`, `AnimalConfinementBuildingAnimalCapacity`, `PermitApplicationOwnerOperator`, and their inverses) capture the full cardinality of cross-entity relationships. The twenty-two views then reassemble these normalized pieces into domain-level facts: operator-permit portfolios, operator-facility assignments, watershed-facility mappings, building inventories, capacity summaries, and permit-type usage statistics. Each view answers a specific analytical question by joining the appropriate combination of base and junction tables, presenting the result as a flat, queryable surface that mirrors the way domain experts think about the regulatory landscape—by operator, by facility, by watershed, by building, by capacity, and by permit type.

## Data appendix

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
