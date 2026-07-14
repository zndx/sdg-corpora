## The Vehicle Inspection Domain

Vehicle inspection is a regulated process that connects mechanical assets, qualified personnel, and compliance documentation into a coherent audit trail. A vehicle enters the system with a registration number and an odometer reading; a qualified mechanic examines it against a defined set of inspection items; any non-compliance issues are recorded with severity classifications and rectification dates; and the entire engagement is captured in an inspection record that ties every participant and artifact together. The data model preserves this chain of custody by separating entities into distinct tables and using junction tables to express the many-to-many relationships that naturally arise when a single inspection record references multiple items, or when a mechanic has performed inspections across many vehicles.

**Table `VehicleInspectionRecord`**

| id | inspectionDate | reviewDueDate | odometerReading | registrationNumber | mechanicName | mechanicSignature | businessName | businessAddress | vehicleId | mechanicId |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 2025-12-03 | 2023-06-24 | 17 | REG-2136 | Integrated Model A | compact-mechanic-98 | Baseline Protocol D | pilot-business-32 | 1 | 100 |
| 2 | 2022-05-14 | 2024-11-08 | 23 | REG-2142 | Extended Cluster | composite-mechanic-99 | Distributed Programme | extended-business-33 | 2 | 101 |
| 3 | 2023-10-25 | 2025-04-19 | 29 | REG-2148 | Pilot Review | primary-mechanic-100 | Adaptive Standard | integrated-business-34 | 3 | 102 |
| 4 | 2024-03-09 | 2022-09-03 | 35 | REG-2154 | Baseline Initiative D | adaptive-mechanic-101 | Primary Framework A | seasonal-business-35 | 4 | 103 |

The inspection record is the central artifact of the process. Each row captures a discrete inspection event identified by an integer `id`, dated with an `inspectionDate`, and carrying a `reviewDueDate` that signals when the next review is required. The `odometerReading` records the vehicle's mileage at the time of inspection, while `registrationNumber` provides a human-readable vehicle identifier. The `mechanicName`, `mechanicSignature`, `businessName`, and `businessAddress` fields embed the inspecting professional's identity and organizational affiliation directly into the record. Foreign keys `vehicleId` and `mechanicId` link the record to the `Vehicle` and `QualifiedMechanic` tables respectively. Record 1, for example, documents an inspection performed on 2025-12-03 for vehicle REG-2136, with a review due on 2023-06-24, conducted by Integrated Model A of Baseline Protocol D. Record 4, dated 2024-03-09, shows a later inspection for REG-2154 with a review due date that has already passed (2022-09-03), indicating a lapsed compliance window.

**Table `Vehicle`**

| id | makeModel | registrationNumber | ownerName | odometerReading | inspectionStatus |
|---|---|---|---|---|---|
| 1 | adaptive-make-59 | REG-2136 | Craig Childs | 17 | safe |
| 2 | distributed-make-60 | REG-2142 | Kimberly Smith | 23 | unsafe |
| 3 | baseline-make-61 | REG-2148 | Michelle Kelley | 29 | non-operational |
| 4 | pilot-make-62 | REG-2154 | Jorge Sullivan | 35 | safe |

The `Vehicle` table stores the static attributes of each registered vehicle. The primary key `id` is an integer, while `makeModel` holds a descriptive identifier such as `adaptive-make-59` or `pilot-make-62`. The `registrationNumber` column mirrors the value found in inspection records, enabling join operations across the two tables. `ownerName` records the registered owner — Craig Childs for vehicle 1, Kimberly Smith for vehicle 2, Michelle Kelley for vehicle 3, and Jorge Sullivan for vehicle 4. The `odometerReading` column duplicates the mileage captured at inspection time, serving as a reference point for consistency checks. The `inspectionStatus` column classifies the vehicle as `safe`, `unsafe`, or `non-operational`. Vehicle 1 and vehicle 4 carry a `safe` status, while vehicle 2 is marked `unsafe` and vehicle 3 is `non-operational`, reflecting the outcomes of their most recent inspections.

**Table `InspectionItem`**

| itemId | itemName | systemCategory | complianceStatus | defectDescription | rectificationDate | vehicleId | recordId | issueId |
|---|---|---|---|---|---|---|---|---|
| 1 | Seasonal Survey | ELECTRICAL SYSTEM & LIGHTS | compliant | Extended Initiative | 2022-01-08 | 1 | 1 | 1 |
| 2 | Integrated Corridor | SEAT BELTS & RESTRAINTS | non-compliant | Pilot Model A | 2023-06-19 | 2 | 2 | 2 |
| 3 | Extended Series D | WHEELS & TYRES | compliant | Baseline Cluster | 2024-11-03 | 3 | 3 | 3 |
| 4 | Pilot Assessment | BRAKES | non-compliant | Distributed Review | 2025-04-14 | 4 | 4 | 4 |

Inspection items represent the specific components or systems evaluated during an inspection. Each item has a `itemId` (integer), an `itemName` such as `Seasonal Survey` or `Integrated Corridor`, and a `systemCategory` that groups items into functional domains like `ELECTRICAL SYSTEM & LIGHTS`, `SEAT BELTS & RESTRAINTS`, `WHEELS & TYRES`, and `BRAKES`. The `complianceStatus` field records whether the item passed (`compliant`) or failed (`non-compliant`) inspection. A `defectDescription` provides a brief narrative of the issue found, while `rectificationDate` records when the defect was corrected. The `vehicleId`, `recordId`, and `issueId` columns link the item to its parent vehicle, inspection record, and any associated non-compliance issue. Item 1, a `Seasonal Survey` of the electrical system, was compliant with a defect description of `Extended Initiative` rectified on 2022-01-08. Item 4, a `Pilot Assessment` of the brakes, was non-compliant with defect `Distributed Review` rectified on 2025-04-14.

**Table `NonComplianceIssue`**

| id | issueNumber | description | dateRectified | severity | itemId | mechanicId |
|---|---|---|---|---|---|---|
| 1 | 5 | Extended Survey | 2022-05-07 | minor | 1 | 100 |
| 2 | 8 | Pilot Corridor A | 2023-10-18 | major | 2 | 101 |
| 3 | 11 | Baseline Series | 2024-03-02 | critical | 3 | 102 |
| 4 | 14 | Distributed Assessment | 2025-08-13 | minor | 4 | 103 |

Non-compliance issues formalize the failures identified during inspection. Each issue has an integer `id`, an `issueNumber` (5, 8, 11, 14 in the sample data), and a `description` such as `Extended Survey` or `Pilot Corridor A`. The `dateRectified` column records when the issue was resolved, `severity` classifies the seriousness as `minor`, `major`, or `critical`, and the `itemId` foreign key links the issue back to the specific inspection item that triggered it. The `mechanicId` column identifies the qualified mechanic who documented the issue. Issue 3, for instance, carries issue number 11, describes `Baseline Series`, was rectified on 2024-03-02, classified as `critical` severity, and was documented by mechanic 102.

**Table `QualifiedMechanic`**

| mechanicId | fullName | businessName | businessAddress | phone | fax |
|---|---|---|---|---|---|
| 100 | Rebecca Hall | Baseline Protocol D | pilot-business-32 | compact-phone-26 | distributed-fax-12 |
| 101 | Brianna Mejia | Distributed Programme | extended-business-33 | composite-phone-27 | baseline-fax-13 |
| 102 | Desiree Cain | Adaptive Standard | integrated-business-34 | primary-phone-28 | pilot-fax-14 |
| 103 | Suzanne Collins | Primary Framework A | seasonal-business-35 | adaptive-phone-29 | extended-fax-15 |

The `QualifiedMechanic` table stores the credentials and contact information of authorized inspectors. The `mechanicId` is the primary key, `fullName` provides the professional's name (Rebecca Hall, Brianna Mejia, Desiree Cain, Suzanne Collins), and `businessName` and `businessAddress` identify their employing organization and location. The `phone` and `fax` columns provide contact details. Mechanic 100, Rebecca Hall, operates under Baseline Protocol D at pilot-business-32, while mechanic 103, Suzanne Collins, works for Primary Framework A at seasonal-business-35.

The relationships between these entities are expressed through junction tables that resolve many-to-many cardinalities. A single inspection record may reference multiple inspection items, and a single inspection item may appear in multiple records. Similarly, a mechanic may inspect multiple vehicles, and a vehicle may be inspected by multiple mechanics across different dates.

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

This junction table links inspection records to inspection items. Each row contains a `recordId` and an `itemId`. Record 1 references items 1 and 2, meaning the inspection on 2025-12-03 evaluated both the `Seasonal Survey` (electrical system) and the `Integrated Corridor` (seat belts). Record 4 references items 4 and 1, covering the `Pilot Assessment` of brakes and the `Seasonal Survey` of electrical systems.

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

This table establishes the relationship between vehicles and inspection records. Each row connects a `vehicleId` to a `recordId`, enabling queries that trace the inspection history of any given vehicle.

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

This junction table links vehicles directly to inspection items, providing an alternative path from the vehicle entity to the specific components evaluated during its inspections.

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

This table connects qualified mechanics to the inspection records they have produced, enabling queries that aggregate all inspections performed by a given mechanic.

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

This table links mechanics to the non-compliance issues they have documented, allowing analysis of which mechanics identify which types of issues and at what severity levels.

The following views synthesize these base tables and junction tables into analytical perspectives that answer specific operational questions.

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

This view joins the inspection record with the vehicle table, answering the question: "What vehicle was inspected, and what are its current status and registration details?" The result combines the inspection date, odometer reading, and registration number from the record with the vehicle's make model, owner name, and inspection status. For record 1, the view would show that vehicle REG-2136 (make `adaptive-make-59`, owner Craig Childs) was inspected on 2025-12-03 with an odometer reading of 17 and currently holds a `safe` status.

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

This view joins the inspection record with the qualified mechanic table, answering: "Which mechanic performed this inspection, and what are their business credentials?" The result includes the mechanic's full name, business name, business address, phone, and fax alongside the inspection record's date and vehicle identifier. Record 1 would show that Rebecca Hall of Baseline Protocol D, based at pilot-business-32, conducted the inspection.

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

This view joins the inspection record with the inspection items it references, answering: "What specific items were evaluated during this inspection, and what were their compliance outcomes?" The result combines the record's metadata with each item's name, system category, compliance status, defect description, and rectification date. For record 1, the view would produce two rows: one for the `Seasonal Survey` of the electrical system (compliant) and one for the `Integrated Corridor` of seat belts (non-compliant).

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

This view joins the vehicle with its associated inspection records, answering: "What is the inspection history of this vehicle?" The result includes the vehicle's make model, owner name, registration number, and current status alongside each inspection record's date, odometer reading, and mechanic details. Vehicle 1 (Craig Childs, `adaptive-make-59`, status `safe`) would appear with all records referencing it, showing the progression of inspections over time.

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

This view joins the inspection item with the vehicle it pertains to, answering: "Which vehicle was evaluated for this specific inspection item?" The result combines the item's name, system category, compliance status, and defect description with the vehicle's make model, owner name, and registration number. Item 1 (`Seasonal Survey`, electrical system, compliant) would show that it pertains to vehicle REG-2136 owned by Craig Childs.

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

This view joins the inspection item with the inspection record that contains it, answering: "Which inspection record includes this item, and when was it performed?" The result combines the item's details with the record's inspection date, review due date, odometer reading, and registration number. Item 2 (`Integrated Corridor`, seat belts, non-compliant) would show it was part of record 2, inspected on 2022-05-14 for vehicle REG-2142.

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

This view joins the inspection item with its associated non-compliance issue, answering: "What non-compliance issue was triggered by this inspection item?" The result combines the item's name and compliance status with the issue's number, description, rectification date, and severity. Item 2 (non-compliant `Integrated Corridor`) would show issue 8 (`Pilot Corridor A`), rectified on 2023-10-18 with `major` severity.

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

This view joins the non-compliance issue with the inspection item that triggered it, answering: "Which inspection item led to this non-compliance issue?" The result combines the issue's number, description, rectification date, and severity with the item's name, system category, and defect description. Issue 3 (`Baseline Series`, critical severity, rectified 2024-03-02) would show it was triggered by item 3 (`Extended Series D`, wheels and tyres, compliant).

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

This view joins the non-compliance issue with the mechanic who documented it, answering: "Which mechanic identified this non-compliance issue?" The result combines the issue's number, description, and severity with the mechanic's full name, business name, and contact details. Issue 2 (`Pilot Corridor A`, major severity) would show it was documented by Brianna Mejia of Distributed Programme.

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

This view joins the qualified mechanic with the inspection records they have produced, answering: "What inspections has this mechanic performed?" The result includes the mechanic's name, business name, and address alongside each record's inspection date, vehicle registration number, odometer reading, and review due date. Mechanic 100 (Rebecca Hall) would appear with record 1, showing the inspection of REG-2136 on 2025-12-03.

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

This view joins the qualified mechanic with the non-compliance issues they have documented, answering: "What non-compliance issues has this mechanic identified?" The result combines the mechanic's name and business details with each issue's number, description, rectification date, and severity. Mechanic 102 (Desiree Cain) would show issue 3 (`Baseline Series`, critical severity), demonstrating that this mechanic identified a critical-level non-compliance.

The vehicle inspection domain demonstrates how structured data can capture the full lifecycle of a compliance event — from the vehicle entering the inspection bay, through the mechanic's evaluation of specific systems, to the documentation of any non-compliance issues and their eventual rectification. The separation of entities into focused tables (vehicles, mechanics, inspection items, non-compliance issues, and inspection records) keeps each concept's attributes clean and independently maintainable. The junction tables preserve the flexibility needed when real-world relationships are many-to-many: a single inspection evaluates multiple items, a mechanic inspects multiple vehicles, and a non-compliance issue traces back to a specific item within a specific record. The views then reassemble these pieces into the analytical perspectives that operators actually need — whether they are tracking a vehicle's inspection history, reviewing a mechanic's performance, or auditing the severity distribution of non-compliance issues across the fleet.

## Data appendix

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
