A healthcare administration system must reconcile three distinct operational concerns: the organizational structure of its clinical staff, the scheduling and documentation of patient encounters, and the financial and logistical transactions that follow each visit. The domain is modelled as a set of seven normalized base tables and eleven denormalized views that reconstruct domain facts for reporting. The base tables capture positions and the people who fill them, patient records and their associated appointments, monetary transactions, and inventory items consumed during visits. The views join these tables along the foreign-key paths that connect them, producing flat result sets that answer specific operational questions.

## Organizational Structure: Positions and Staff

The organizational backbone of the system is defined by two tables. The `StaffPosition` table enumerates every role in the hierarchy, while `StaffMember` records the individuals who occupy those roles.

**Table `StaffPosition`**

| id | positionId | title | department | supervisorTitle | educationRequired | experienceRequired | status | memberId | reportsToPositionId |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 14477856 | Compact Initiative | adaptive-departme-89 | Pilot Series | distributed-educatio-12 | pilot-experien-68 | active | 1 | 1 |
| 2 | gd_acc_260002 | Legacy Model | distributed-departme-90 | Baseline Assessment | baseline-educatio-13 | extended-experien-69 | vacant | 2 | 2 |
| 3 | 3e41f384-9bac-11eb-a8a2-19ed5c03f8d3 | Regional Cluster A | baseline-departme-91 | Distributed Survey A | pilot-educatio-14 | integrated-experien-70 | terminated | 3 | 3 |
| 4 | 82871 | Seasonal Review | pilot-departme-92 | Adaptive Corridor | extended-educatio-15 | seasonal-experien-71 | active | 4 | 4 |

Each row in `StaffPosition` carries a surrogate primary key `id`, a business identifier `positionId`, and descriptive columns `title`, `department`, `supervisorTitle`, `educationRequired`, `experienceRequired`, and `status`. The table also includes a self-referencing foreign key `reportsToPositionId` that points to another row's `id`, encoding the supervisory chain. For example, position `14477856` (title "Compact Initiative", department "adaptive-departme-89", status "active") has `reportsToPositionId = 1`, meaning it reports to itself in this seed data — a common pattern for top-level roles. Position `gd_acc_260002` (title "Legacy Model", department "distributed-departme-90", status "vacant") similarly references itself, while `3e41f384-9bac-11eb-a8a2-19ed5c03f8d3` (title "Regional Cluster A", department "baseline-departme-91", status "terminated") and `82871` (title "Seasonal Review", department "pilot-departme-92", status "active") follow the same pattern. The `educationRequired` and `experienceRequired` columns store abbreviated codes such as `distributed-educatio-12` and `pilot-experien-68`, which serve as lookup keys into external reference tables not shown here.

**Table `StaffMember`**

| id | staffId | firstName | lastName | hireDate | employmentStatus | contactEmail | positionId |
|---|---|---|---|---|---|---|---|
| 1 | 937735 | Stephanie Collins | Paul Allen | 2023-06-01T05:39:00 | active | Christopher Wilson | 1 |
| 2 | 3158139 | Janice Johnston | Heather Beasley | 2024-11-12T12:56:00 | on_leave | Charles Larsen | 2 |
| 3 | 8189502 | Upal Saha | Audrey Taylor | 2025-04-23T19:13:00 | terminated | Mary Alvarez | 3 |
| 4 | 69438 | Katherine Snyder | Susan Wagner | 2022-09-07T02:30:00 | active | April Snyder | 4 |

The `StaffMember` table stores one row per employee. Its primary key is `id`, and it carries the business identifier `staffId`, the name columns `firstName` and `lastName`, the `hireDate`, the `employmentStatus`, and the `contactEmail`. The critical foreign key is `positionId`, which references `StaffPosition.id`, establishing a many-to-one relationship: each staff member holds exactly one position, but a position may be held by zero, one, or many members over time. In the seed data, member `937735` (first name "Stephanie Collins", last name "Paul Allen", hired `2023-06-01T05:39:00`, status "active", email "Christopher Wilson") occupies position `1`. Member `3158139` (first name "Janice Johnston", last name "Heather Beasley", hired `2024-11-12T12:56:00`, status "on_leave", email "Charles Larsen") occupies position `2`. Member `8189502` (first name "Upal Saha", last name "Audrey Taylor", hired `2025-04-23T19:13:00`, status "terminated", email "Mary Alvarez") occupies position `3`. Member `69438` (first name "Katherine Snyder", last name "Susan Wagner", hired `2022-09-07T02:30:00`, status "active", email "April Snyder") occupies position `4`. The cardinality is bounded: `positionId` is a single column, so each staff member is assigned to exactly one position at any point in time.

The relationship between these two tables is materialized in three views. The view `v_staff_position_staff_member` joins `StaffPosition` to `StaffMember` on `StaffPosition.id = StaffMember.positionId`, producing a flat row that pairs each position with its current occupant. The view `v_staff_position_staff_position` performs a self-join on `StaffPosition`, linking each position's `reportsToPositionId` to the referenced position's `id`, thereby reconstructing the supervisory hierarchy in a single flat result. The view `v_staff_member_staff_position` joins in the opposite direction, starting from `StaffMember` and attaching the full position details — title, department, status — so that a query can answer "what position does this staff member hold, and what are its attributes?"

## Patient Encounters: Records and Appointments

The clinical side of the domain is captured by two tables that describe who the patients are and when they are seen.

**Table `PatientRecord`**

| recordId | dateOfBirth | insuranceProvider | policyNumber | lastUpdated | hipaaCompliant | transactionId |
|---|---|---|---|---|---|---|
| 100 | 2025-04-02 | seasonal-insuranc-11 | POL-2302 | 2023-06-17T17:27:00 | true | 1 |
| 101 | 2022-09-13 | regional-insuranc-12 | POL-2304 | 2024-11-01T00:44:00 | false | 2 |
| 102 | 2023-02-24 | legacy-insuranc-13 | POL-2306 | 2025-04-12T07:01:00 | true | 3 |
| 103 | 2024-07-08 | compact-insuranc-14 | POL-2308 | 2022-09-23T14:18:00 | false | 4 |

The `PatientRecord` table stores demographic and insurance information. Its primary key is `recordId`. Each row carries `dateOfBirth`, `insuranceProvider`, `policyNumber`, `lastUpdated`, a boolean `hipaaCompliant`, and a `transactionId` that links to the financial system. In the seed data, record `100` belongs to a patient born `2025-04-02`, insured by "seasonal-insuranc-11" under policy "POL-2303", last updated `2023-06-17T17:27:00`, marked HIPAA-compliant, with transaction `1`. Record `101` (DOB `2022-09-13`, insurer "regional-insuranc-12", policy "POL-2304", not HIPAA-compliant, transaction `2`) and record `102` (DOB `2023-02-24`, insurer "legacy-insuranc-13", policy "POL-2306", HIPAA-compliant, transaction `3`) follow the same structure. Record `103` (DOB `2024-07-08`, insurer "compact-insuranc-14", policy "POL-2308", not HIPAA-compliant, transaction `4`) completes the set.

**Table `PatientAppointment`**

| id | appointmentId | scheduledDateTime | status | providerId | patientId | serviceType | reminderSent | memberId | recordId |
|---|---|---|---|---|---|---|---|---|---|
| 100 | 2087748 | 2023-10-18T21:03:00 | scheduled | 3717633 | 8387541 | composite-service-81 | true | 1 | 100 |
| 101 | ChIJJ60m-q5t5kcRMZ9MdM8fVm4 | 2024-03-02T04:20:00 | confirmed | ChIJYRd8uPtt5kcRunQjrWb4IKs | 10207142 | primary-service-82 | false | 2 | 101 |
| 102 | 2087740 | 2025-08-13T11:37:00 | completed | 8928519 | 7119782 | adaptive-service-83 | true | 3 | 102 |
| 103 | 1250223 | 2022-01-24T18:54:00 | cancelled | lu_tax_code_template_m13 | gd_acc_160003 | distributed-service-84 | false | 4 | 103 |

The `PatientAppointment` table records each scheduled encounter. Its primary key is `id`, and it carries the business identifier `appointmentId`, the `scheduledDateTime`, the `status` (one of "scheduled", "confirmed", "completed", "cancelled"), the `providerId` (the staff member or system ID assigned to the appointment), the `patientId`, the `serviceType` (a code such as "composite-service-81"), a boolean `reminderSent`, a `memberId`, and the foreign key `recordId` that references `PatientRecord.recordId`. In the seed data, appointment `100` (business ID "2087748", scheduled `2023-10-18T21:03:00`, status "scheduled", provider "3717633", patient "8387541", service "composite-service-81", reminder sent, record `100`) is linked to patient record `100`. Appointment `101` (business ID "ChIJJ60m-q5t5kcRMZ9MdM8fVm4", scheduled `2024-03-02T04:20:00`, status "confirmed", provider "ChIJYRd8uPtt5kcRunQjrWb4IKs", patient "10207142", service "primary-service-82", no reminder, record `101`) links to record `101`. Appointment `102` (business ID "2087740", scheduled `2025-08-13T11:37:00`, status "completed", provider "8928519", patient "7119782", service "adaptive-service-83", reminder sent, record `102`) links to record `102`. Appointment `103` (business ID "1250223", scheduled `2022-01-24T18:54:00`, status "cancelled", provider "lu_tax_code_template_m13", patient "gd_acc_160003", service "distributed-service-84", no reminder, record `103`) links to record `103`.

The relationship between patient records and appointments is further mediated by the junction table `PatientRecordPatientAppointment`, which exists to support a many-to-many relationship: a single patient record may be associated with multiple appointments, and a single appointment may reference multiple records (for example, in multi-patient encounters). This table is the bridge that the view `v_patient_record_patient_appointment_detail` traverses.

The view `v_patient_appointment_staff_member` joins `PatientAppointment` to `StaffMember` through the `providerId` column, answering the question "which staff member is assigned to each appointment?" The view `v_patient_appointment_patient_record` joins `PatientAppointment` to `PatientRecord` on `PatientAppointment.recordId = PatientRecord.recordId`, producing a flat row that pairs each appointment with the patient's demographic and insurance data. The view `v_patient_record_patient_appointment_detail` starts from `PatientRecord`, joins through `PatientRecordPatientAppointment`, and attaches the full appointment details, answering "which appointments belong to this patient record?"

## Financial Transactions

Payments are captured in the `PaymentTransaction` table, which links financial events to both patient records and appointments.

**Table `PaymentTransaction`**

| id | transactionId | amount | transactionDate | paymentMethod | status | processedBy | recordId | appointmentId | createdAt |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 937738 | 13.49 | 2023-02-25T01:39:00 | cash | pending | adaptive-processe-41 | 100 | 100 | 2025-01-01 00:14:00 |
| 2 | 89509 | 25.47 | 2024-07-09T08:56:00 | credit_card | completed | distributed-processe-42 | 101 | 101 | 2025-02-06 03:14:00 |
| 3 | 1186092 | 19.72 | 2025-12-20T15:13:00 | check | failed | baseline-processe-43 | 102 | 102 | 2025-03-11 06:14:00 |
| 4 | 9085243 | 12.74 | 2022-05-04T22:30:00 | insurance | refunded | pilot-processe-44 | 103 | 103 | 2025-04-16 09:14:00 |

The `PaymentTransaction` table has a surrogate primary key `id` and a business identifier `transactionId`. It carries `amount` (a decimal such as `13.49` or `25.47`), `transactionDate`, `paymentMethod` (one of "cash", "credit_card", "check", "insurance"), `status` (one of "pending", "completed", "failed", "refunded"), `processedBy` (a code identifying the processing system), `createdAt`, and two foreign keys: `recordId` referencing `PatientRecord.recordId` and `appointmentId` referencing `PatientAppointment.id`. In the seed data, transaction `1` (business ID "937738", amount `13.49`, date `2023-02-25T01:39:00`, method "cash", status "pending", processed by "adaptive-processe-41", linked to record `100` and appointment `100`, created `2025-01-01 00:14:00`) is the financial counterpart of appointment `100`. Transaction `2` (business ID "89509", amount `25.47`, date `2024-07-09T08:56:00`, method "credit_card", status "completed", processed by "distributed-processe-42", linked to record `101` and appointment `101`, created `2025-02-06 03:14:00`) corresponds to appointment `101`. Transaction `3` (business ID "1186092", amount `19.72`, date `2025-12-20T15:13:00`, method "check", status "failed", processed by "baseline-processe-43", linked to record `102` and appointment `102`, created `2025-03-11 06:14:00`) corresponds to appointment `102`. Transaction `4` (business ID "9085243", amount `12.74`, date `2022-05-04T22:30:00`, method "insurance", status "refunded", processed by "pilot-processe-44", linked to record `103` and appointment `103`, created `2025-04-16 09:14:00`) corresponds to appointment `103`.

The view `v_patient_record_payment_transaction` joins `PatientRecord` to `PaymentTransaction` on `PatientRecord.recordId = PaymentTransaction.recordId`, answering "what payments have been made for this patient's record?" The view `v_payment_transaction_patient_record` joins in the opposite direction, starting from the payment and attaching the patient's demographic data. The view `v_payment_transaction_patient_appointment` joins `PaymentTransaction` to `PatientAppointment` on `PaymentTransaction.appointmentId = PatientAppointment.id`, answering "which appointment does this payment relate to?"

## Inventory Management

Inventory items consumed during patient visits are tracked in the `InventoryItem` table.

**Table `InventoryItem`**

| id | itemId | itemName | category | quantityOnHand | reorderLevel | lastRestocked | memberId | appointmentId |
|---|---|---|---|---|---|---|---|---|
| 1000 | ITE-2792 | Seasonal Survey | medical_supplies | 7 | 29 | 2022-05-17T16:24:00 | 1 | 100 |
| 1001 | ITE-2795 | Integrated Corridor | office_supplies | 4 | 33 | 2023-10-01T23:41:00 | 2 | 101 |
| 1002 | ITE-2798 | Extended Series D | cleaning | 6 | 37 | 2024-03-12T06:58:00 | 3 | 102 |
| 1003 | ITE-2801 | Pilot Assessment | medical_supplies | 6 | 41 | 2025-08-23T13:15:00 | 4 | 103 |

The `InventoryItem` table has a surrogate primary key `id` and a business identifier `itemId`. It carries `itemName`, `category` (one of "medical_supplies", "office_supplies", "cleaning"), `quantityOnHand`, `reorderLevel`, `lastRestocked`, a `memberId`, and the foreign key `appointmentId` referencing `PatientAppointment.id`. In the seed data, item `1000` (business ID "ITE-2792", name "Seasonal Survey", category "medical_supplies", quantity `7`, reorder level `29`, last restocked `2022-05-17T16:24:00`, member `1`, appointment `100`) is consumed during appointment `100`. Item `1001` (business ID "ITE-2795", name "Integrated Corridor", category "office_supplies", quantity `4`, reorder level `33`, last restocked `2023-10-01T23:41:00`, member `2`, appointment `101`) is consumed during appointment `101`. Item `1002` (business ID "ITE-2798", name "Extended Series D", category "cleaning", quantity `6`, reorder level `37`, last restocked `2024-03-12T06:58:00`, member `3`, appointment `102`) is consumed during appointment `102`. Item `1003` (business ID "ITE-2801", name "Pilot Assessment", category "medical_supplies", quantity `6`, reorder level `41`, last restocked `2025-08-23T13:15:00`, member `4`, appointment `103`) is consumed during appointment `103`.

The view `v_inventory_item_staff_member` joins `InventoryItem` to `StaffMember` through the `memberId` column, answering "which staff member is associated with each inventory item?" The view `v_inventory_item_patient_appointment` joins `InventoryItem` to `PatientAppointment` on `InventoryItem.appointmentId = PatientAppointment.id`, answering "which inventory items were consumed during each appointment?"

## Synthesis

The schema models a healthcare administration domain through seven normalized base tables and eleven denormalized views. The base tables enforce referential integrity through foreign keys: `StaffMember.positionId` references `StaffPosition.id`, `PatientAppointment.recordId` references `PatientRecord.recordId`, `PaymentTransaction.recordId` and `PaymentTransaction.appointmentId` reference `PatientRecord.recordId` and `PatientAppointment.id` respectively, and `InventoryItem.appointmentId` references `PatientAppointment.id`. The junction table `PatientRecordPatientAppointment` supports a many-to-many relationship between patient records and appointments. The eleven views reconstruct flat result sets by joining along these foreign-key paths, each answering a specific operational question — from "which staff member holds which position" to "what payment was made for which appointment" to "which inventory items were consumed during which visit." The concrete values in the seed data — position titles like "Compact Initiative" and "Regional Cluster A", staff names like "Stephanie Collins" and "Upal Saha", appointment statuses like "scheduled" and "cancelled", payment amounts like `13.49` and `25.47`, and inventory categories like "medical_supplies" and "office_supplies" — illustrate how the normalized model captures real-world entities while the views present them in the flat, queryable form that reporting and analytics require.

## Data appendix

**Table `PatientRecordPatientAppointment`**

| recordId | appointmentId |
|---|---|
| 100 | 100 |
| 100 | 101 |
| 101 | 101 |
| 101 | 102 |
| 102 | 102 |
| 102 | 103 |
| 103 | 103 |
| 103 | 100 |

**View `v_staff_position_staff_member`**

```sql
CREATE VIEW v_staff_position_staff_member AS
SELECT a.id, a.positionId, a.title, a.department, b.id AS member_id, b.staffId AS member_staffId, b.firstName AS member_firstName
FROM StaffPosition a JOIN StaffMember b ON a.memberId = b.id;
```

| id | positionId | title | department | member_id | member_staffId | member_firstName |
|---|---|---|---|---|---|---|
| 1 | 14477856 | Compact Initiative | adaptive-departme-89 | 1 | 937735 | Stephanie Collins |
| 2 | gd_acc_260002 | Legacy Model | distributed-departme-90 | 2 | 3158139 | Janice Johnston |
| 3 | 3e41f384-9bac-11eb-a8a2-19ed5c03f8d3 | Regional Cluster A | baseline-departme-91 | 3 | 8189502 | Upal Saha |
| 4 | 82871 | Seasonal Review | pilot-departme-92 | 4 | 69438 | Katherine Snyder |

**View `v_staff_position_staff_position`**

```sql
CREATE VIEW v_staff_position_staff_position AS
SELECT a.id, a.positionId, a.title, a.department, b.id AS position_id, b.positionId AS position_positionId, b.title AS position_title
FROM StaffPosition a JOIN StaffPosition b ON a.reportsToPositionId = b.id;
```

| id | positionId | title | department | position_id | position_positionId | position_title |
|---|---|---|---|---|---|---|
| 1 | 14477856 | Compact Initiative | adaptive-departme-89 | 1 | 14477856 | Compact Initiative |
| 2 | gd_acc_260002 | Legacy Model | distributed-departme-90 | 2 | gd_acc_260002 | Legacy Model |
| 3 | 3e41f384-9bac-11eb-a8a2-19ed5c03f8d3 | Regional Cluster A | baseline-departme-91 | 3 | 3e41f384-9bac-11eb-a8a2-19ed5c03f8d3 | Regional Cluster A |
| 4 | 82871 | Seasonal Review | pilot-departme-92 | 4 | 82871 | Seasonal Review |

**View `v_staff_member_staff_position`**

```sql
CREATE VIEW v_staff_member_staff_position AS
SELECT a.id, a.staffId, a.firstName, a.lastName, b.id AS position_id, b.positionId AS position_positionId, b.title AS position_title
FROM StaffMember a JOIN StaffPosition b ON a.positionId = b.id;
```

| id | staffId | firstName | lastName | position_id | position_positionId | position_title |
|---|---|---|---|---|---|---|
| 1 | 937735 | Stephanie Collins | Paul Allen | 1 | 14477856 | Compact Initiative |
| 2 | 3158139 | Janice Johnston | Heather Beasley | 2 | gd_acc_260002 | Legacy Model |
| 3 | 8189502 | Upal Saha | Audrey Taylor | 3 | 3e41f384-9bac-11eb-a8a2-19ed5c03f8d3 | Regional Cluster A |
| 4 | 69438 | Katherine Snyder | Susan Wagner | 4 | 82871 | Seasonal Review |

**View `v_patient_appointment_staff_member`**

```sql
CREATE VIEW v_patient_appointment_staff_member AS
SELECT a.id, a.appointmentId, a.scheduledDateTime, a.status, b.id AS member_id, b.staffId AS member_staffId, b.firstName AS member_firstName
FROM PatientAppointment a JOIN StaffMember b ON a.memberId = b.id;
```

| id | appointmentId | scheduledDateTime | status | member_id | member_staffId | member_firstName |
|---|---|---|---|---|---|---|
| 100 | 2087748 | 2023-10-18T21:03:00 | scheduled | 1 | 937735 | Stephanie Collins |
| 101 | ChIJJ60m-q5t5kcRMZ9MdM8fVm4 | 2024-03-02T04:20:00 | confirmed | 2 | 3158139 | Janice Johnston |
| 102 | 2087740 | 2025-08-13T11:37:00 | completed | 3 | 8189502 | Upal Saha |
| 103 | 1250223 | 2022-01-24T18:54:00 | cancelled | 4 | 69438 | Katherine Snyder |

**View `v_patient_appointment_patient_record`**

```sql
CREATE VIEW v_patient_appointment_patient_record AS
SELECT a.id, a.appointmentId, a.scheduledDateTime, a.status, b.recordId AS record_recordId, b.dateOfBirth AS record_dateOfBirth, b.insuranceProvider AS record_insuranceProvider
FROM PatientAppointment a JOIN PatientRecord b ON a.recordId = b.recordId;
```

| id | appointmentId | scheduledDateTime | status | record_recordId | record_dateOfBirth | record_insuranceProvider |
|---|---|---|---|---|---|---|
| 100 | 2087748 | 2023-10-18T21:03:00 | scheduled | 100 | 2025-04-02 | seasonal-insuranc-11 |
| 101 | ChIJJ60m-q5t5kcRMZ9MdM8fVm4 | 2024-03-02T04:20:00 | confirmed | 101 | 2022-09-13 | regional-insuranc-12 |
| 102 | 2087740 | 2025-08-13T11:37:00 | completed | 102 | 2023-02-24 | legacy-insuranc-13 |
| 103 | 1250223 | 2022-01-24T18:54:00 | cancelled | 103 | 2024-07-08 | compact-insuranc-14 |

**View `v_patient_record_patient_appointment_detail`**

```sql
CREATE VIEW v_patient_record_patient_appointment_detail AS
SELECT a.recordId, a.dateOfBirth, a.insuranceProvider, b.id AS appointment_id, b.appointmentId AS appointment_appointmentId, b.scheduledDateTime AS appointment_scheduledDateTime
FROM PatientRecord a
  JOIN PatientRecordPatientAppointment j ON j.recordId = a.recordId
  JOIN PatientAppointment b ON b.id = j.appointmentId;
```

| recordId | dateOfBirth | insuranceProvider | appointment_id | appointment_appointmentId | appointment_scheduledDateTime |
|---|---|---|---|---|---|
| 100 | 2025-04-02 | seasonal-insuranc-11 | 100 | 2087748 | 2023-10-18T21:03:00 |
| 100 | 2025-04-02 | seasonal-insuranc-11 | 101 | ChIJJ60m-q5t5kcRMZ9MdM8fVm4 | 2024-03-02T04:20:00 |
| 101 | 2022-09-13 | regional-insuranc-12 | 101 | ChIJJ60m-q5t5kcRMZ9MdM8fVm4 | 2024-03-02T04:20:00 |
| 101 | 2022-09-13 | regional-insuranc-12 | 102 | 2087740 | 2025-08-13T11:37:00 |
| 102 | 2023-02-24 | legacy-insuranc-13 | 102 | 2087740 | 2025-08-13T11:37:00 |
| 102 | 2023-02-24 | legacy-insuranc-13 | 103 | 1250223 | 2022-01-24T18:54:00 |
| 103 | 2024-07-08 | compact-insuranc-14 | 103 | 1250223 | 2022-01-24T18:54:00 |
| 103 | 2024-07-08 | compact-insuranc-14 | 100 | 2087748 | 2023-10-18T21:03:00 |

**View `v_patient_record_payment_transaction`**

```sql
CREATE VIEW v_patient_record_payment_transaction AS
SELECT a.recordId, a.dateOfBirth, a.insuranceProvider, a.policyNumber, b.id AS transaction_id, b.transactionId AS transaction_transactionId, b.amount AS transaction_amount
FROM PatientRecord a JOIN PaymentTransaction b ON a.transactionId = b.id;
```

| recordId | dateOfBirth | insuranceProvider | policyNumber | transaction_id | transaction_transactionId | transaction_amount |
|---|---|---|---|---|---|---|
| 100 | 2025-04-02 | seasonal-insuranc-11 | POL-2302 | 1 | 937738 | 13.49 |
| 101 | 2022-09-13 | regional-insuranc-12 | POL-2304 | 2 | 89509 | 25.47 |
| 102 | 2023-02-24 | legacy-insuranc-13 | POL-2306 | 3 | 1186092 | 19.72 |
| 103 | 2024-07-08 | compact-insuranc-14 | POL-2308 | 4 | 9085243 | 12.74 |

**View `v_payment_transaction_patient_record`**

```sql
CREATE VIEW v_payment_transaction_patient_record AS
SELECT a.id, a.transactionId, a.amount, a.transactionDate, b.recordId AS record_recordId, b.dateOfBirth AS record_dateOfBirth, b.insuranceProvider AS record_insuranceProvider
FROM PaymentTransaction a JOIN PatientRecord b ON a.recordId = b.recordId;
```

| id | transactionId | amount | transactionDate | record_recordId | record_dateOfBirth | record_insuranceProvider |
|---|---|---|---|---|---|---|
| 1 | 937738 | 13.49 | 2023-02-25T01:39:00 | 100 | 2025-04-02 | seasonal-insuranc-11 |
| 2 | 89509 | 25.47 | 2024-07-09T08:56:00 | 101 | 2022-09-13 | regional-insuranc-12 |
| 3 | 1186092 | 19.72 | 2025-12-20T15:13:00 | 102 | 2023-02-24 | legacy-insuranc-13 |
| 4 | 9085243 | 12.74 | 2022-05-04T22:30:00 | 103 | 2024-07-08 | compact-insuranc-14 |

**View `v_payment_transaction_patient_appointment`**

```sql
CREATE VIEW v_payment_transaction_patient_appointment AS
SELECT a.id, a.transactionId, a.amount, a.transactionDate, b.id AS appointment_id, b.appointmentId AS appointment_appointmentId, b.scheduledDateTime AS appointment_scheduledDateTime
FROM PaymentTransaction a JOIN PatientAppointment b ON a.appointmentId = b.id;
```

| id | transactionId | amount | transactionDate | appointment_id | appointment_appointmentId | appointment_scheduledDateTime |
|---|---|---|---|---|---|---|
| 1 | 937738 | 13.49 | 2023-02-25T01:39:00 | 100 | 2087748 | 2023-10-18T21:03:00 |
| 2 | 89509 | 25.47 | 2024-07-09T08:56:00 | 101 | ChIJJ60m-q5t5kcRMZ9MdM8fVm4 | 2024-03-02T04:20:00 |
| 3 | 1186092 | 19.72 | 2025-12-20T15:13:00 | 102 | 2087740 | 2025-08-13T11:37:00 |
| 4 | 9085243 | 12.74 | 2022-05-04T22:30:00 | 103 | 1250223 | 2022-01-24T18:54:00 |

**View `v_inventory_item_staff_member`**

```sql
CREATE VIEW v_inventory_item_staff_member AS
SELECT a.id, a.itemId, a.itemName, a.category, b.id AS member_id, b.staffId AS member_staffId, b.firstName AS member_firstName
FROM InventoryItem a JOIN StaffMember b ON a.memberId = b.id;
```

| id | itemId | itemName | category | member_id | member_staffId | member_firstName |
|---|---|---|---|---|---|---|
| 1000 | ITE-2792 | Seasonal Survey | medical_supplies | 1 | 937735 | Stephanie Collins |
| 1001 | ITE-2795 | Integrated Corridor | office_supplies | 2 | 3158139 | Janice Johnston |
| 1002 | ITE-2798 | Extended Series D | cleaning | 3 | 8189502 | Upal Saha |
| 1003 | ITE-2801 | Pilot Assessment | medical_supplies | 4 | 69438 | Katherine Snyder |

**View `v_inventory_item_patient_appointment`**

```sql
CREATE VIEW v_inventory_item_patient_appointment AS
SELECT a.id, a.itemId, a.itemName, a.category, b.id AS appointment_id, b.appointmentId AS appointment_appointmentId, b.scheduledDateTime AS appointment_scheduledDateTime
FROM InventoryItem a JOIN PatientAppointment b ON a.appointmentId = b.id;
```

| id | itemId | itemName | category | appointment_id | appointment_appointmentId | appointment_scheduledDateTime |
|---|---|---|---|---|---|---|
| 1000 | ITE-2792 | Seasonal Survey | medical_supplies | 100 | 2087748 | 2023-10-18T21:03:00 |
| 1001 | ITE-2795 | Integrated Corridor | office_supplies | 101 | ChIJJ60m-q5t5kcRMZ9MdM8fVm4 | 2024-03-02T04:20:00 |
| 1002 | ITE-2798 | Extended Series D | cleaning | 102 | 2087740 | 2025-08-13T11:37:00 |
| 1003 | ITE-2801 | Pilot Assessment | medical_supplies | 103 | 1250223 | 2022-01-24T18:54:00 |
