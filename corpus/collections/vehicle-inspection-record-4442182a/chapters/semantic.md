## Domain Modelling and Relational Materialization

Vehicle safety inspection management requires tracking the lifecycle of a vehicle through a sequence of inspections, each of which decomposes into discrete inspection items, some of which may surface non-compliance issues that must be rectified and documented. The domain centres on five entity types: `Vehicle`, `VehicleInspectionRecord`, `InspectionItem`, `NonComplianceIssue`, and `QualifiedMechanic`. The relational schema materialises these entities as base tables, their many-to-many relationships as junction tables, and the most common join paths as materialised views. The following sections walk through the model from first principles, showing how each concept maps to columns, keys, and join structures.

**Table `VehicleInspectionRecord`**

| id | inspectionDate | reviewDueDate | odometerReading | registrationNumber | mechanicName | mechanicSignature | businessName | businessAddress | vehicleId | mechanicId |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 2025-12-03 | 2023-06-24 | 17 | REG-2136 | Integrated Model A | compact-mechanic-98 | Baseline Protocol D | pilot-business-32 | 1 | 100 |
| 2 | 2022-05-14 | 2024-11-08 | 23 | REG-2142 | Extended Cluster | composite-mechanic-99 | Distributed Programme | extended-business-33 | 2 | 101 |
| 3 | 2023-10-25 | 2025-04-19 | 29 | REG-2148 | Pilot Review | primary-mechanic-100 | Adaptive Standard | integrated-business-34 | 3 | 102 |
| 4 | 2024-03-09 | 2022-09-03 | 35 | REG-2154 | Baseline Initiative D | adaptive-mechanic-101 | Primary Framework A | seasonal-business-35 | 4 | 103 |

The `VehicleInspectionRecord` table is the central fact table of the domain. Each row represents a single inspection event and carries both temporal and administrative attributes. The `id` column serves as the primary key, while `inspectionDate` and `reviewDueDate` capture the scheduling window — for example, record 1 was inspected on 2025-12-03 with a review due by 2023-06-24, and record 4 on 2024-03-09 with a review due by 2022-09-03. The `odometerReading` column records the vehicle's mileage at the time of inspection (17, 23, 29, 35 across the four rows). The `registrationNumber` column (e.g. `REG-2136`, `REG-2142`) provides a human-readable vehicle identifier that is also stored in the `Vehicle` table for referential integrity. Mechanic attribution is captured in two ways: the `mechanicName` column holds a free-text name such as "Integrated Model A" or "Extended Cluster", while the `mechanicId` column (values 100 through 103) is a foreign key into the `QualifiedMechanic` table. Similarly, the `businessName` and `businessAddress` columns store the mechanic's business context at the time of inspection, and the `vehicleId` column is a foreign key into the `Vehicle` table. This dual storage of mechanic and vehicle identifiers — both as direct columns and as foreign keys — reflects a design choice that keeps the inspection record self-contained for reporting while preserving referential links to the master entity tables.

**Table `Vehicle`**

| id | makeModel | registrationNumber | ownerName | odometerReading | inspectionStatus |
|---|---|---|---|---|---|
| 1 | adaptive-make-59 | REG-2136 | Craig Childs | 17 | safe |
| 2 | distributed-make-60 | REG-2142 | Kimberly Smith | 23 | unsafe |
| 3 | baseline-make-61 | REG-2148 | Michelle Kelley | 29 | non-operational |
| 4 | pilot-make-62 | REG-2154 | Jorge Sullivan | 35 | safe |

The `Vehicle` table is the master entity for vehicles. Its primary key is `id`, and each row describes a single vehicle with `makeModel` (e.g. `adaptive-make-59`, `distributed-make-60`), `registrationNumber` (matching the value in `VehicleInspectionRecord`, such as `REG-2136`), `ownerName` (e.g. "Craig Childs", "Kimberly Smith"), `odometerReading` (17, 23, 29, 35 — mirroring the inspection record values), and `inspectionStatus` which takes one of three values: `safe`, `unsafe`, or `non-operational`. The `inspectionStatus` column is derived from the aggregate of inspection items associated with the vehicle; for instance, vehicle 1 and vehicle 4 are marked `safe`, vehicle 2 is `unsafe`, and vehicle 3 is `non-operational`. The `registrationNumber` column serves as a natural key that is referenced by `VehicleInspectionRecord.registrationNumber`, creating a foreign-key relationship between the two tables.

**Table `InspectionItem`**

| itemId | itemName | systemCategory | complianceStatus | defectDescription | rectificationDate | vehicleId | recordId | issueId |
|---|---|---|---|---|---|---|---|---|
| 1 | Seasonal Survey | ELECTRICAL SYSTEM & LIGHTS | compliant | Extended Initiative | 2022-01-08 | 1 | 1 | 1 |
| 2 | Integrated Corridor | SEAT BELTS & RESTRAINTS | non-compliant | Pilot Model A | 2023-06-19 | 2 | 2 | 2 |
| 3 | Extended Series D | WHEELS & TYRES | compliant | Baseline Cluster | 2024-11-03 | 3 | 3 | 3 |
| 4 | Pilot Assessment | BRAKES | non-compliant | Distributed Review | 2025-04-14 | 4 | 4 | 4 |

The `InspectionItem` table captures the granular checks performed during an inspection. Each row is identified by `itemId` and carries `itemName` (e.g. "Seasonal Survey", "Integrated Corridor"), `systemCategory` (such as "ELECTRICAL SYSTEM & LIGHTS", "SEAT BELTS & RESTRAINTS", "WHEELS & TYRES", "BRAKES"), and `complianceStatus` which is either `compliant` or `non-compliant`. The `defectDescription` column provides a free-text description of any defect found (e.g. "Extended Initiative", "Pilot Model A"), and `rectificationDate` records when the defect was corrected (e.g. 2022-01-08, 2023-06-19). The `vehicleId` and `recordId` columns are foreign keys into the `Vehicle` and `VehicleInspectionRecord` tables respectively, while `issueId` is a foreign key into `NonComplianceIssue`. This table thus sits at the intersection of vehicle, inspection record, and non-compliance domains.

**Table `NonComplianceIssue`**

| id | issueNumber | description | dateRectified | severity | itemId | mechanicId |
|---|---|---|---|---|---|---|
| 1 | 5 | Extended Survey | 2022-05-07 | minor | 1 | 100 |
| 2 | 8 | Pilot Corridor A | 2023-10-18 | major | 2 | 101 |
| 3 | 11 | Baseline Series | 2024-03-02 | critical | 3 | 102 |
| 4 | 14 | Distributed Assessment | 2025-08-13 | minor | 4 | 103 |

The `NonComplianceIssue` table records formal non-compliance findings. Its primary key is `id`, and each row carries `issueNumber` (5, 8, 11, 14), `description` (e.g. "Extended Survey", "Pilot Corridor A"), `dateRectified` (2022-05-07, 2023-10-18, 2024-03-02, 2025-08-13), and `severity` which takes one of three values: `minor`, `major`, or `critical`. The `itemId` column is a foreign key into `InspectionItem`, and `mechanicId` is a foreign key into `QualifiedMechanic`. This table is therefore a child of `InspectionItem` and a sibling of `QualifiedMechanic` through the mechanic attribution.

**Table `QualifiedMechanic`**

| mechanicId | fullName | businessName | businessAddress | phone | fax |
|---|---|---|---|---|---|
| 100 | Rebecca Hall | Baseline Protocol D | pilot-business-32 | compact-phone-26 | distributed-fax-12 |
| 101 | Brianna Mejia | Distributed Programme | extended-business-33 | composite-phone-27 | baseline-fax-13 |
| 102 | Desiree Cain | Adaptive Standard | integrated-business-34 | primary-phone-28 | pilot-fax-14 |
| 103 | Suzanne Collins | Primary Framework A | seasonal-business-35 | adaptive-phone-29 | extended-fax-15 |

The `QualifiedMechanic` table is the master entity for mechanics. Its primary key is `mechanicId`, and each row stores `fullName` (e.g. "Rebecca Hall", "Brianna Mejia", "Desiree Cain", "Suzanne Collins"), `businessName` (e.g. "Baseline Protocol D", "Distributed Programme"), `businessAddress` (e.g. `pilot-business-32`, `extended-business-33`), `phone` (e.g. `compact-phone-26`, `composite-phone-27`), and `fax` (e.g. `distributed-fax-12`, `baseline-fax-13`). This table is referenced by `VehicleInspectionRecord.mechanicId`, `InspectionItem.issueId` (indirectly through `NonComplianceIssue.mechanicId`), and by the junction tables described below.

The remaining base tables are junction (associative) tables that resolve many-to-many relationships. The `VehicleInspectionRecordInspectionItem` table links inspection records to inspection items with a composite key of `recordId` and `itemId`. Its rows show that record 1 is associated with items 1 and 2, record 2 with items 2 and 3, record 3 with items 3 and 4, and record 4 with items 4 and 1 — demonstrating that each inspection record can contain multiple inspection items and each item can appear in multiple records.

**Table `VehicleInspectionRecordInspectionItem`**

| recordId | itemId |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

The `VehicleVehicleInspectionRecord` table links vehicles to inspection records with a composite key of `vehicleId` and `recordId`. This junction table allows a vehicle to have multiple inspection records over time and an inspection record to potentially reference multiple vehicles (e.g. fleet inspections).

**Table `VehicleVehicleInspectionRecord`**

| vehicleId | recordId |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

The `VehicleInspectionItem` table links vehicles to inspection items with a composite key of `vehicleId` and `itemId`. This provides a direct vehicle-to-item association that bypasses the inspection record layer, useful for queries that need to know which items have been checked on which vehicles regardless of the inspection event.

**Table `VehicleInspectionItem`**

| vehicleId | itemId |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

The `QualifiedMechanicVehicleInspectionRecord` table links mechanics to inspection records with a composite key of `mechanicId` and `recordId`. This allows a mechanic to perform multiple inspections and an inspection to be performed by multiple mechanics (e.g. team inspections).

**Table `QualifiedMechanicVehicleInspectionRecord`**

| mechanicId | recordId |
|---|---|
| 100 | 1 |
| 100 | 2 |
| 101 | 2 |
| 101 | 3 |
| 102 | 3 |
| 102 | 4 |
| 103 | 4 |
| 103 | 1 |

The `QualifiedMechanicNonComplianceIssue` table links mechanics to non-compliance issues with a composite key of `mechanicId` and `issueId`. This captures which mechanic was responsible for which non-compliance finding.

**Table `QualifiedMechanicNonComplianceIssue`**

| mechanicId | issueId |
|---|---|
| 100 | 1 |
| 100 | 2 |
| 101 | 2 |
| 101 | 3 |
| 102 | 3 |
| 102 | 4 |
| 103 | 4 |
| 103 | 1 |

With the base schema established, the views materialise the most common analytical join paths. Each view answers a specific domain question by joining the relevant tables and presenting the result as a single flat table.

**View `vw_vehicle_inspection_record_vehicle`**

```sql
CREATE VIEW vw_vehicle_inspection_record_vehicle AS
SELECT a.id, a.inspectionDate, a.reviewDueDate, a.odometerReading, b.id AS vehicle_id, b.makeModel AS vehicle_makeModel, b.registrationNumber AS vehicle_registrationNumber
FROM VehicleInspectionRecord a JOIN Vehicle b ON a.vehicleId = b.id;
```

| id | inspectionDate | reviewDueDate | odometerReading | vehicle_id | vehicle_makeModel | vehicle_registrationNumber |
|---|---|---|---|---|---|---|
| 1 | 2025-12-03 | 2023-06-24 | 17 | 1 | adaptive-make-59 | REG-2136 |
| 2 | 2022-05-14 | 2024-11-08 | 23 | 2 | distributed-make-60 | REG-2142 |
| 3 | 2023-10-25 | 2025-04-19 | 29 | 3 | baseline-make-61 | REG-2148 |
| 4 | 2024-03-09 | 2022-09-03 | 35 | 4 | pilot-make-62 | REG-2154 |

The view `vw_vehicle_inspection_record_vehicle` joins `VehicleInspectionRecord` with `Vehicle` on the vehicle identifier, producing a flat table that answers the question: "What vehicle was inspected, when, and what is its current status?" Each row combines the inspection record's `id`, `inspectionDate`, `reviewDueDate`, `odometerReading`, `registrationNumber`, `mechanicName`, `mechanicSignature`, `businessName`, `businessAddress`, `vehicleId`, and `mechanicId` with the vehicle's `makeModel`, `registrationNumber`, `ownerName`, `odometerReading`, and `inspectionStatus`. For example, one row would show that vehicle 1 (make model `adaptive-make-59`, owner "Craig Childs", status `safe`) was inspected on 2025-12-03 by mechanic 100.

**View `vw_vehicle_inspection_record_qualified_mechanic`**

```sql
CREATE VIEW vw_vehicle_inspection_record_qualified_mechanic AS
SELECT a.id, a.inspectionDate, a.reviewDueDate, a.odometerReading, b.mechanicId AS mechanic_mechanicId, b.fullName AS mechanic_fullName, b.businessName AS mechanic_businessName
FROM VehicleInspectionRecord a JOIN QualifiedMechanic b ON a.mechanicId = b.mechanicId;
```

| id | inspectionDate | reviewDueDate | odometerReading | mechanic_mechanicId | mechanic_fullName | mechanic_businessName |
|---|---|---|---|---|---|---|
| 1 | 2025-12-03 | 2023-06-24 | 17 | 100 | Rebecca Hall | Baseline Protocol D |
| 2 | 2022-05-14 | 2024-11-08 | 23 | 101 | Brianna Mejia | Distributed Programme |
| 3 | 2023-10-25 | 2025-04-19 | 29 | 102 | Desiree Cain | Adaptive Standard |
| 4 | 2024-03-09 | 2022-09-03 | 35 | 103 | Suzanne Collins | Primary Framework A |

The view `vw_vehicle_inspection_record_qualified_mechanic` joins `VehicleInspectionRecord` with `QualifiedMechanic` on `mechanicId`, answering: "Which qualified mechanic performed each inspection, and what are their business details?" Each row combines the inspection record's attributes with the mechanic's `fullName`, `businessName`, `businessAddress`, `phone`, and `fax`. For instance, record 1 (inspected by mechanic 100) would show the mechanic's full name as "Rebecca Hall", business name as "Baseline Protocol D", and business address as `pilot-business-32`.

**View `vw_vehicle_inspection_record_inspection_item_detail`**

```sql
CREATE VIEW vw_vehicle_inspection_record_inspection_item_detail AS
SELECT a.id, a.inspectionDate, a.reviewDueDate, b.itemId AS item_itemId, b.itemName AS item_itemName, b.systemCategory AS item_systemCategory
FROM VehicleInspectionRecord a
  JOIN VehicleInspectionRecordInspectionItem j ON j.recordId = a.id
  JOIN InspectionItem b ON b.itemId = j.itemId;
```

| id | inspectionDate | reviewDueDate | item_itemId | item_itemName | item_systemCategory |
|---|---|---|---|---|---|
| 1 | 2025-12-03 | 2023-06-24 | 1 | Seasonal Survey | ELECTRICAL SYSTEM & LIGHTS |
| 1 | 2025-12-03 | 2023-06-24 | 2 | Integrated Corridor | SEAT BELTS & RESTRAINTS |
| 2 | 2022-05-14 | 2024-11-08 | 2 | Integrated Corridor | SEAT BELTS & RESTRAINTS |
| 2 | 2022-05-14 | 2024-11-08 | 3 | Extended Series D | WHEELS & TYRES |
| 3 | 2023-10-25 | 2025-04-19 | 3 | Extended Series D | WHEELS & TYRES |
| 3 | 2023-10-25 | 2025-04-19 | 4 | Pilot Assessment | BRAKES |
| 4 | 2024-03-09 | 2022-09-03 | 4 | Pilot Assessment | BRAKES |
| 4 | 2024-03-09 | 2022-09-03 | 1 | Seasonal Survey | ELECTRICAL SYSTEM & LIGHTS |

The view `vw_vehicle_inspection_record_inspection_item_detail` joins `VehicleInspectionRecord` with `InspectionItem` through the junction table `VehicleInspectionRecordInspectionItem`, answering: "Which inspection items were part of each inspection record?" Each row combines the inspection record's attributes with the inspection item's `itemId`, `itemName`, `systemCategory`, `complianceStatus`, `defectDescription`, `rectificationDate`, `vehicleId`, `recordId`, and `issueId`. For example, record 1 is associated with item 1 ("Seasonal Survey", category "ELECTRICAL SYSTEM & LIGHTS", status `compliant`) and item 2 ("Integrated Corridor", category "SEAT BELTS & RESTRAINTS", status `non-compliant").

**View `vw_vehicle_vehicle_inspection_record_detail`**

```sql
CREATE VIEW vw_vehicle_vehicle_inspection_record_detail AS
SELECT a.id, a.makeModel, a.registrationNumber, b.id AS record_id, b.inspectionDate AS record_inspectionDate, b.reviewDueDate AS record_reviewDueDate
FROM Vehicle a
  JOIN VehicleVehicleInspectionRecord j ON j.vehicleId = a.id
  JOIN VehicleInspectionRecord b ON b.id = j.recordId;
```

| id | makeModel | registrationNumber | record_id | record_inspectionDate | record_reviewDueDate |
|---|---|---|---|---|---|
| 1 | adaptive-make-59 | REG-2136 | 1 | 2025-12-03 | 2023-06-24 |
| 1 | adaptive-make-59 | REG-2136 | 2 | 2022-05-14 | 2024-11-08 |
| 2 | distributed-make-60 | REG-2142 | 2 | 2022-05-14 | 2024-11-08 |
| 2 | distributed-make-60 | REG-2142 | 3 | 2023-10-25 | 2025-04-19 |
| 3 | baseline-make-61 | REG-2148 | 3 | 2023-10-25 | 2025-04-19 |
| 3 | baseline-make-61 | REG-2148 | 4 | 2024-03-09 | 2022-09-03 |
| 4 | pilot-make-62 | REG-2154 | 4 | 2024-03-09 | 2022-09-03 |
| 4 | pilot-make-62 | REG-2154 | 1 | 2025-12-03 | 2023-06-24 |

The view `vw_vehicle_vehicle_inspection_record_detail` joins `Vehicle` with `VehicleInspectionRecord` through the junction table `VehicleVehicleInspectionRecord`, answering: "Which inspection records belong to which vehicle?" Each row combines the vehicle's `id`, `makeModel`, `registrationNumber`, `ownerName`, `odometerReading`, `inspectionStatus` with the inspection record's `id`, `inspectionDate`, `reviewDueDate`, `odometerReading`, `registrationNumber`, `mechanicName`, `mechanicSignature`, `businessName`, `businessAddress`, `vehicleId`, and `mechanicId`. For instance, vehicle 1 (owner "Craig Childs", status `safe`) would appear alongside inspection record 1 (date 2025-12-03, mechanic 100).

**View `vw_vehicle_inspection_item_detail`**

```sql
CREATE VIEW vw_vehicle_inspection_item_detail AS
SELECT a.id, a.makeModel, a.registrationNumber, b.itemId AS item_itemId, b.itemName AS item_itemName, b.systemCategory AS item_systemCategory
FROM Vehicle a
  JOIN VehicleInspectionItem j ON j.vehicleId = a.id
  JOIN InspectionItem b ON b.itemId = j.itemId;
```

| id | makeModel | registrationNumber | item_itemId | item_itemName | item_systemCategory |
|---|---|---|---|---|---|
| 1 | adaptive-make-59 | REG-2136 | 1 | Seasonal Survey | ELECTRICAL SYSTEM & LIGHTS |
| 1 | adaptive-make-59 | REG-2136 | 2 | Integrated Corridor | SEAT BELTS & RESTRAINTS |
| 2 | distributed-make-60 | REG-2142 | 2 | Integrated Corridor | SEAT BELTS & RESTRAINTS |
| 2 | distributed-make-60 | REG-2142 | 3 | Extended Series D | WHEELS & TYRES |
| 3 | baseline-make-61 | REG-2148 | 3 | Extended Series D | WHEELS & TYRES |
| 3 | baseline-make-61 | REG-2148 | 4 | Pilot Assessment | BRAKES |
| 4 | pilot-make-62 | REG-2154 | 4 | Pilot Assessment | BRAKES |
| 4 | pilot-make-62 | REG-2154 | 1 | Seasonal Survey | ELECTRICAL SYSTEM & LIGHTS |

The view `vw_vehicle_inspection_item_detail` joins `Vehicle` with `InspectionItem` through the junction table `VehicleInspectionItem`, answering: "Which inspection items have been performed on which vehicle?" Each row combines the vehicle's attributes with the inspection item's attributes. For example, vehicle 1 would be linked to item 1 ("Seasonal Survey", "ELECTRICAL SYSTEM & LIGHTS", `compliant`) and vehicle 2 to item 2 ("Integrated Corridor", "SEAT BELTS & RESTRAINTS", `non-compliant`).

**View `vw_inspection_item_vehicle`**

```sql
CREATE VIEW vw_inspection_item_vehicle AS
SELECT a.itemId, a.itemName, a.systemCategory, a.complianceStatus, b.id AS vehicle_id, b.makeModel AS vehicle_makeModel, b.registrationNumber AS vehicle_registrationNumber
FROM InspectionItem a JOIN Vehicle b ON a.vehicleId = b.id;
```

| itemId | itemName | systemCategory | complianceStatus | vehicle_id | vehicle_makeModel | vehicle_registrationNumber |
|---|---|---|---|---|---|---|
| 1 | Seasonal Survey | ELECTRICAL SYSTEM & LIGHTS | compliant | 1 | adaptive-make-59 | REG-2136 |
| 2 | Integrated Corridor | SEAT BELTS & RESTRAINTS | non-compliant | 2 | distributed-make-60 | REG-2142 |
| 3 | Extended Series D | WHEELS & TYRES | compliant | 3 | baseline-make-61 | REG-2148 |
| 4 | Pilot Assessment | BRAKES | non-compliant | 4 | pilot-make-62 | REG-2154 |

The view `vw_inspection_item_vehicle` joins `InspectionItem` with `Vehicle` on `vehicleId`, answering: "For each inspection item, which vehicle was it performed on?" Each row combines the inspection item's `itemId`, `itemName`, `systemCategory`, `complianceStatus`, `defectDescription`, `rectificationDate`, `vehicleId`, `recordId`, and `issueId` with the vehicle's `id`, `makeModel`, `registrationNumber`, `ownerName`, `odometerReading`, and `inspectionStatus`. For instance, item 1 ("Seasonal Survey") would show vehicle 1 (`adaptive-make-59`, owner "Craig Childs", status `safe`).

**View `vw_inspection_item_vehicle_inspection_record`**

```sql
CREATE VIEW vw_inspection_item_vehicle_inspection_record AS
SELECT a.itemId, a.itemName, a.systemCategory, a.complianceStatus, b.id AS record_id, b.inspectionDate AS record_inspectionDate, b.reviewDueDate AS record_reviewDueDate
FROM InspectionItem a JOIN VehicleInspectionRecord b ON a.recordId = b.id;
```

| itemId | itemName | systemCategory | complianceStatus | record_id | record_inspectionDate | record_reviewDueDate |
|---|---|---|---|---|---|---|
| 1 | Seasonal Survey | ELECTRICAL SYSTEM & LIGHTS | compliant | 1 | 2025-12-03 | 2023-06-24 |
| 2 | Integrated Corridor | SEAT BELTS & RESTRAINTS | non-compliant | 2 | 2022-05-14 | 2024-11-08 |
| 3 | Extended Series D | WHEELS & TYRES | compliant | 3 | 2023-10-25 | 2025-04-19 |
| 4 | Pilot Assessment | BRAKES | non-compliant | 4 | 2024-03-09 | 2022-09-03 |

The view `vw_inspection_item_vehicle_inspection_record` joins `InspectionItem` with `VehicleInspectionRecord` on `recordId`, answering: "For each inspection item, which inspection record does it belong to?" Each row combines the inspection item's attributes with the inspection record's `id`, `inspectionDate`, `reviewDueDate`, `odometerReading`, `registrationNumber`, `mechanicName`, `mechanicSignature`, `businessName`, `businessAddress`, `vehicleId`, and `mechanicId`. For example, item 1 would be linked to record 1 (date 2025-12-03, mechanic 100).

**View `vw_inspection_item_non_compliance_issue`**

```sql
CREATE VIEW vw_inspection_item_non_compliance_issue AS
SELECT a.itemId, a.itemName, a.systemCategory, a.complianceStatus, b.id AS issue_id, b.issueNumber AS issue_issueNumber, b.description AS issue_description
FROM InspectionItem a JOIN NonComplianceIssue b ON a.issueId = b.id;
```

| itemId | itemName | systemCategory | complianceStatus | issue_id | issue_issueNumber | issue_description |
|---|---|---|---|---|---|---|
| 1 | Seasonal Survey | ELECTRICAL SYSTEM & LIGHTS | compliant | 1 | 5 | Extended Survey |
| 2 | Integrated Corridor | SEAT BELTS & RESTRAINTS | non-compliant | 2 | 8 | Pilot Corridor A |
| 3 | Extended Series D | WHEELS & TYRES | compliant | 3 | 11 | Baseline Series |
| 4 | Pilot Assessment | BRAKES | non-compliant | 4 | 14 | Distributed Assessment |

The view `vw_inspection_item_non_compliance_issue` joins `InspectionItem` with `NonComplianceIssue` on `issueId`, answering: "Which non-compliance issue is associated with each inspection item?" Each row combines the inspection item's attributes with the non-compliance issue's `id`, `issueNumber`, `description`, `dateRectified`, `severity`, `itemId`, and `mechanicId`. For instance, item 1 would be linked to issue 1 (issue number 5, description "Extended Survey", rectified 2022-05-07, severity `minor`).

**View `vw_non_compliance_issue_inspection_item`**

```sql
CREATE VIEW vw_non_compliance_issue_inspection_item AS
SELECT a.id, a.issueNumber, a.description, a.dateRectified, b.itemId AS item_itemId, b.itemName AS item_itemName, b.systemCategory AS item_systemCategory
FROM NonComplianceIssue a JOIN InspectionItem b ON a.itemId = b.itemId;
```

| id | issueNumber | description | dateRectified | item_itemId | item_itemName | item_systemCategory |
|---|---|---|---|---|---|---|
| 1 | 5 | Extended Survey | 2022-05-07 | 1 | Seasonal Survey | ELECTRICAL SYSTEM & LIGHTS |
| 2 | 8 | Pilot Corridor A | 2023-10-18 | 2 | Integrated Corridor | SEAT BELTS & RESTRAINTS |
| 3 | 11 | Baseline Series | 2024-03-02 | 3 | Extended Series D | WHEELS & TYRES |
| 4 | 14 | Distributed Assessment | 2025-08-13 | 4 | Pilot Assessment | BRAKES |

The view `vw_non_compliance_issue_inspection_item` joins `NonComplianceIssue` with `InspectionItem` on `itemId`, answering: "For each non-compliance issue, which inspection item triggered it?" Each row combines the non-compliance issue's attributes with the inspection item's `itemId`, `itemName`, `systemCategory`, `complianceStatus`, `defectDescription`, `rectificationDate`, `vehicleId`, `recordId`, and `issueId`. For example, issue 1 (issue number 5, "Extended Survey", severity `minor`) would show the triggering item as item 1 ("Seasonal Survey", category "ELECTRICAL SYSTEM & LIGHTS").

**View `vw_non_compliance_issue_qualified_mechanic`**

```sql
CREATE VIEW vw_non_compliance_issue_qualified_mechanic AS
SELECT a.id, a.issueNumber, a.description, a.dateRectified, b.mechanicId AS mechanic_mechanicId, b.fullName AS mechanic_fullName, b.businessName AS mechanic_businessName
FROM NonComplianceIssue a JOIN QualifiedMechanic b ON a.mechanicId = b.mechanicId;
```

| id | issueNumber | description | dateRectified | mechanic_mechanicId | mechanic_fullName | mechanic_businessName |
|---|---|---|---|---|---|---|
| 1 | 5 | Extended Survey | 2022-05-07 | 100 | Rebecca Hall | Baseline Protocol D |
| 2 | 8 | Pilot Corridor A | 2023-10-18 | 101 | Brianna Mejia | Distributed Programme |
| 3 | 11 | Baseline Series | 2024-03-02 | 102 | Desiree Cain | Adaptive Standard |
| 4 | 14 | Distributed Assessment | 2025-08-13 | 103 | Suzanne Collins | Primary Framework A |

The view `vw_non_compliance_issue_qualified_mechanic` joins `NonComplianceIssue` with `QualifiedMechanic` on `mechanicId`, answering: "Which qualified mechanic is responsible for each non-compliance issue?" Each row combines the non-compliance issue's attributes with the mechanic's `fullName`, `businessName`, `businessAddress`, `phone`, and `fax`. For instance, issue 1 (issue number 5, "Extended Survey", severity `minor`) would show the responsible mechanic as "Rebecca Hall" (business: "Baseline Protocol D", address: `pilot-business-32`).

**View `vw_qualified_mechanic_vehicle_inspection_record_detail`**

```sql
CREATE VIEW vw_qualified_mechanic_vehicle_inspection_record_detail AS
SELECT a.mechanicId, a.fullName, a.businessName, b.id AS record_id, b.inspectionDate AS record_inspectionDate, b.reviewDueDate AS record_reviewDueDate
FROM QualifiedMechanic a
  JOIN QualifiedMechanicVehicleInspectionRecord j ON j.mechanicId = a.mechanicId
  JOIN VehicleInspectionRecord b ON b.id = j.recordId;
```

| mechanicId | fullName | businessName | record_id | record_inspectionDate | record_reviewDueDate |
|---|---|---|---|---|---|
| 100 | Rebecca Hall | Baseline Protocol D | 1 | 2025-12-03 | 2023-06-24 |
| 100 | Rebecca Hall | Baseline Protocol D | 2 | 2022-05-14 | 2024-11-08 |
| 101 | Brianna Mejia | Distributed Programme | 2 | 2022-05-14 | 2024-11-08 |
| 101 | Brianna Mejia | Distributed Programme | 3 | 2023-10-25 | 2025-04-19 |
| 102 | Desiree Cain | Adaptive Standard | 3 | 2023-10-25 | 2025-04-19 |
| 102 | Desiree Cain | Adaptive Standard | 4 | 2024-03-09 | 2022-09-03 |
| 103 | Suzanne Collins | Primary Framework A | 4 | 2024-03-09 | 2022-09-03 |
| 103 | Suzanne Collins | Primary Framework A | 1 | 2025-12-03 | 2023-06-24 |

The view `vw_qualified_mechanic_vehicle_inspection_record_detail` joins `QualifiedMechanic` with `VehicleInspectionRecord` through the junction table `QualifiedMechanicVehicleInspectionRecord`, answering: "Which inspection records were performed by each qualified mechanic?" Each row combines the mechanic's attributes with the inspection record's attributes. For example, mechanic 100 ("Rebecca Hall", "Baseline Protocol D") would appear alongside record 1 (date 2025-12-03, vehicle 1, odometer 17).

**View `vw_qualified_mechanic_non_compliance_issue_detail`**

```sql
CREATE VIEW vw_qualified_mechanic_non_compliance_issue_detail AS
SELECT a.mechanicId, a.fullName, a.businessName, b.id AS issue_id, b.issueNumber AS issue_issueNumber, b.description AS issue_description
FROM QualifiedMechanic a
  JOIN QualifiedMechanicNonComplianceIssue j ON j.mechanicId = a.mechanicId
  JOIN NonComplianceIssue b ON b.id = j.issueId;
```

| mechanicId | fullName | businessName | issue_id | issue_issueNumber | issue_description |
|---|---|---|---|---|---|
| 100 | Rebecca Hall | Baseline Protocol D | 1 | 5 | Extended Survey |
| 100 | Rebecca Hall | Baseline Protocol D | 2 | 8 | Pilot Corridor A |
| 101 | Brianna Mejia | Distributed Programme | 2 | 8 | Pilot Corridor A |
| 101 | Brianna Mejia | Distributed Programme | 3 | 11 | Baseline Series |
| 102 | Desiree Cain | Adaptive Standard | 3 | 11 | Baseline Series |
| 102 | Desiree Cain | Adaptive Standard | 4 | 14 | Distributed Assessment |
| 103 | Suzanne Collins | Primary Framework A | 4 | 14 | Distributed Assessment |
| 103 | Suzanne Collins | Primary Framework A | 1 | 5 | Extended Survey |

The view `vw_qualified_mechanic_non_compliance_issue_detail` joins `QualifiedMechanic` with `NonComplianceIssue` through the junction table `QualifiedMechanicNonComplianceIssue`, answering: "Which non-compliance issues has each qualified mechanic been responsible for?" Each row combines the mechanic's attributes with the non-compliance issue's attributes. For instance, mechanic 100 ("Rebecca Hall") would be linked to issue 1 (issue number 5, "Extended Survey", rectified 2022-05-07, severity `minor`), and mechanic 101 ("Brianna Mejia") to issue 2 (issue number 8, "Pilot Corridor A", rectified 2023-10-18, severity `major`).

The relational model presented here demonstrates a classic star-and-snowflake pattern: `VehicleInspectionRecord` serves as the central fact table, with `Vehicle` and `QualifiedMechanic` as dimension tables linked by foreign keys, and `InspectionItem` and `NonComplianceIssue` as child entities that further decompose the inspection fact. The junction tables (`VehicleInspectionRecordInspectionItem`, `VehicleVehicleInspectionRecord`, `VehicleInspectionItem`, `QualifiedMechanicVehicleInspectionRecord`, `QualifiedMechanicNonComplianceIssue`) resolve the many-to-many relationships that arise when a single inspection contains multiple items, a vehicle accumulates multiple inspections, and a mechanic performs multiple inspections and is responsible for multiple non-compliance findings. The twelve views materialise the most common analytical join paths, each answering a specific domain question by flattening the normalised structure into a single denormalised result set. This design supports both transactional integrity — through foreign-key constraints on the base tables — and analytical convenience — through the pre-joined views — without requiring application-level join logic for the most frequent queries.