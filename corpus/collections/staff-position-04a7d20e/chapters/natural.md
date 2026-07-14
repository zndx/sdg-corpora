## Organizational and Clinical Operations in a Multi-Department Practice

A modern healthcare practice operates as an interconnected system of staffing, patient care, financial processing, and supply management. Each operational layer generates structured records that, when viewed in isolation, tell only part of the story. The staffing tables define who works where and under what authority; the clinical tables capture who received care and when; the financial tables document what was charged and how it was settled; and the inventory tables track the physical resources consumed during each encounter. Understanding how these records relate is essential for auditing, reporting, and day-to-day coordination. The following sections walk through each domain, using concrete identifiers and values drawn from the practice's active records.

## Staffing and Organizational Structure

The backbone of any practice is its workforce. The staffing domain is captured across two base tables that together describe positions and the individuals who fill them.

**Table `StaffPosition`**

| id | positionId | title | department | supervisorTitle | educationRequired | experienceRequired | status | memberId | reportsToPositionId |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 14477856 | Compact Initiative | adaptive-departme-89 | Pilot Series | distributed-educatio-12 | pilot-experien-68 | active | 1 | 1 |
| 2 | gd_acc_260002 | Legacy Model | distributed-departme-90 | Baseline Assessment | baseline-educatio-13 | extended-experien-69 | vacant | 2 | 2 |
| 3 | 3e41f384-9bac-11eb-a8a2-19ed5c03f8d3 | Regional Cluster A | baseline-departme-91 | Distributed Survey A | pilot-educatio-14 | integrated-experien-70 | terminated | 3 | 3 |
| 4 | 82871 | Seasonal Review | pilot-departme-92 | Adaptive Corridor | extended-educatio-15 | seasonal-experien-71 | active | 4 | 4 |

The `StaffPosition` table defines the organizational architecture. Each row represents a distinct role within the practice, identified by a surrogate `id` and a human-readable `positionId`. The `title` column carries the role name — for example, "Compact Initiative" or "Regional Cluster A" — while the `department` column assigns the position to a functional unit such as `adaptive-departme-89` or `baseline-departme-91`. Supervisory structure is encoded through `supervisorTitle`, which names the position's direct manager, and `reportsToPositionId`, which creates a self-referencing link to another row in the same table. In the sample data, every position reports to itself (`reportsToPositionId` equals `id`), indicating a flat hierarchy at this stage. The `educationRequired` and `experienceRequired` columns store coded requirements like `distributed-educatio-12` and `pilot-experien-68`, while the `status` column tracks whether the position is `active`, `vacant`, or `terminated`. The `memberId` column links the position to a specific staff member, establishing the first bridge to the workforce table.

**Table `StaffMember`**

| id | staffId | firstName | lastName | hireDate | employmentStatus | contactEmail | positionId |
|---|---|---|---|---|---|---|---|
| 1 | 937735 | Stephanie Collins | Paul Allen | 2023-06-01T05:39:00 | active | Christopher Wilson | 1 |
| 2 | 3158139 | Janice Johnston | Heather Beasley | 2024-11-12T12:56:00 | on_leave | Charles Larsen | 2 |
| 3 | 8189502 | Upal Saha | Audrey Taylor | 2025-04-23T19:13:00 | terminated | Mary Alvarez | 3 |
| 4 | 69438 | Katherine Snyder | Susan Wagner | 2022-09-07T02:30:00 | active | April Snyder | 4 |

The `StaffMember` table holds the personnel records. Each staff member has a unique `staffId` — for instance, `937735` for Stephanie Collins or `3158139` for Janice Johnston — along with `firstName` and `lastName` fields that, in this dataset, are combined into a single display name column. The `hireDate` records when employment began, ranging from `2022-09-07` for Katherine Snyder to `2025-04-23` for Upal Saha. The `employmentStatus` column mirrors the position's `status` with values such as `active`, `on_leave`, and `terminated`. Contact information is stored in `contactEmail`, and the `positionId` column creates the foreign-key link back to `StaffPosition`, tying each person to their assigned role.

The relationship between these two tables is explored through three dedicated views. The first joins position metadata with the staff member occupying it, answering the question of which person holds which role at any given time.

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

This view pairs each position's title, department, and status with the corresponding staff member's name, hire date, and employment status. Reading the row for position `14477856` ("Compact Initiative") reveals that Stephanie Collins, hired on `2023-06-01`, holds an `active` position and maintains an `active` employment status. The second row shows Janice Johnston in the "Legacy Model" position (`gd_acc_260002`); although the position is marked `vacant`, her employment status is `on_leave`, suggesting she is temporarily absent rather than permanently separated.

The second view expands the join to include the supervisor's position title, providing a complete chain-of-command snapshot.

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

By self-joining `StaffPosition` on itself, this view surfaces the supervisor's title alongside the subordinate's. In the sample data, each position's `supervisorTitle` matches its own title, confirming that the current organizational chart has no cross-position reporting relationships. This is a useful baseline for auditing: any future row where `supervisorTitle` diverges from the position's own title would signal a reorganization.

The third view reverses the perspective, starting from the staff member and resolving outward to the full position details.

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

This view answers the question "what does this person's role look like in full?" For Katherine Snyder (`staffId` `69438`), the view resolves her position to `82871` ("Seasonal Review") in the `pilot-departme-92` department, with `extended-educatio-15` as the required education level. Her `active` employment status aligns with the position's `active` status, confirming a clean, unambiguous assignment.

## Patient Care and Appointment Scheduling

Clinical operations revolve around appointments and the patient records that document each encounter. Two base tables capture this domain, and a junction table manages the many-to-many relationship between patients and their appointments.

**Table `PatientAppointment`**

| id | appointmentId | scheduledDateTime | status | providerId | patientId | serviceType | reminderSent | memberId | recordId |
|---|---|---|---|---|---|---|---|---|---|
| 100 | 2087748 | 2023-10-18T21:03:00 | scheduled | 3717633 | 8387541 | composite-service-81 | true | 1 | 100 |
| 101 | ChIJJ60m-q5t5kcRMZ9MdM8fVm4 | 2024-03-02T04:20:00 | confirmed | ChIJYRd8uPtt5kcRunQjrWb4IKs | 10207142 | primary-service-82 | false | 2 | 101 |
| 102 | 2087740 | 2025-08-13T11:37:00 | completed | 8928519 | 7119782 | adaptive-service-83 | true | 3 | 102 |
| 103 | 1250223 | 2022-01-24T18:54:00 | cancelled | lu_tax_code_template_m13 | gd_acc_160003 | distributed-service-84 | false | 4 | 103 |

The `PatientAppointment` table logs every scheduled encounter. Each row carries a surrogate `id` (e.g., `100`, `101`), a business-level `appointmentId` such as `2087748` or the UUID-like `ChIJJ60m-q5t5kcRMZ9MdM8fVm4`, and a `scheduledDateTime` that specifies when the visit was planned. The `status` column tracks the appointment's lifecycle: `scheduled`, `confirmed`, `completed`, or `cancelled`. The `providerId` identifies the clinician or service unit responsible, while `patientId` identifies the recipient. The `serviceType` column categorizes the encounter — values in the sample include `composite-service-81`, `primary-service-82`, `adaptive-service-83`, and `distributed-service-84`. A boolean `reminderSent` flag indicates whether an automated reminder was dispatched, and `memberId` links the appointment to a staff member. The `recordId` column ties the appointment to the patient's clinical record.

**Table `PatientRecord`**

| recordId | dateOfBirth | insuranceProvider | policyNumber | lastUpdated | hipaaCompliant | transactionId |
|---|---|---|---|---|---|---|
| 100 | 2025-04-02 | seasonal-insuranc-11 | POL-2302 | 2023-06-17T17:27:00 | true | 1 |
| 101 | 2022-09-13 | regional-insuranc-12 | POL-2304 | 2024-11-01T00:44:00 | false | 2 |
| 102 | 2023-02-24 | legacy-insuranc-13 | POL-2306 | 2025-04-12T07:01:00 | true | 3 |
| 103 | 2024-07-08 | compact-insuranc-14 | POL-2308 | 2022-09-23T14:18:00 | false | 4 |

The `PatientRecord` table stores demographic and insurance information for each patient. The `recordId` serves as the primary key and matches the `recordId` in `PatientAppointment`. The `dateOfBirth` column holds the patient's birth date — for example, `2025-04-02` for record `100` and `2022-09-13` for record `101`. The `insuranceProvider` column names the insurer, with coded values like `seasonal-insuranc-11` and `regional-insuranc-12`. The `policyNumber` column carries the actual policy identifier (e.g., `POL-2302`, `POL-2304`). The `lastUpdated` timestamp records when the record was last modified, and `hipaaCompliant` is a boolean flag indicating whether the record meets compliance standards. The `transactionId` column links to the financial domain, connecting the patient's clinical record to their payment history.

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

This junction table resolves the many-to-many relationship between patient records and appointments. Each row contains a `recordId` and an `appointmentId`, creating an explicit association that allows a single patient record to be linked to multiple appointments and, conversely, allows an appointment to be traced back to its originating record. In the sample data, record `100` is associated with appointment `100`, record `101` with appointment `101`, and so on, forming a one-to-one mapping at this stage.

The views in this domain expand the junction into readable narratives. The first view joins appointments with the staff members who provided the service.

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

This view answers "who delivered this service?" For appointment `2087748` (scheduled for `2023-10-18T21:03:00`), the view resolves the `providerId` `3717633` to a staff member and surfaces the associated position details. The second row, appointment `ChIJJ60m-q5t5kcRMZ9MdM8fVm4`, links provider `ChIJYRd8uPtt5kcRunQjrWb4IKs` to a `confirmed` appointment in the `primary-service-82` category. This view is particularly useful for workload analysis, as it surfaces which staff members are handling which service types.

The second view joins appointments with their corresponding patient records, answering "which patient was seen and when?"

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

Reading the row for appointment `2087748` alongside patient record `100` reveals that the patient, born on `2025-04-02`, is insured through `seasonal-insuranc-11` with policy `POL-2302`. The appointment was `scheduled` for a `composite-service-81` encounter, and a reminder was sent (`reminderSent = true`). The second row pairs appointment `ChIJJ60m-q5t5kcRMZ9MdM8fVm4` with record `101`, whose patient was born on `2022-09-13` and carries `regional-insuranc-12` insurance. Notably, this record is marked `hipaaCompliant = false`, a flag that would trigger a compliance review.

The third view expands the patient record further to include appointment-level detail, creating a comprehensive clinical snapshot.

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

This view starts from the patient record and pulls in the full appointment context. For record `100`, it surfaces the appointment's `scheduledDateTime`, `status`, `serviceType`, and `reminderSent` flag alongside the patient's `dateOfBirth`, `insuranceProvider`, and `hipaaCompliant` status. The result is a single-row view of a patient's encounter, suitable for clinical review or insurance verification.

## Financial Operations

The financial domain is captured in the `PaymentTransaction` table, which records every monetary exchange associated with a patient's care.

**Table `PaymentTransaction`**

| id | transactionId | amount | transactionDate | paymentMethod | status | processedBy | recordId | appointmentId | createdAt |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 937738 | 13.49 | 2023-02-25T01:39:00 | cash | pending | adaptive-processe-41 | 100 | 100 | 2025-01-01 00:14:00 |
| 2 | 89509 | 25.47 | 2024-07-09T08:56:00 | credit_card | completed | distributed-processe-42 | 101 | 101 | 2025-02-06 03:14:00 |
| 3 | 1186092 | 19.72 | 2025-12-20T15:13:00 | check | failed | baseline-processe-43 | 102 | 102 | 2025-03-11 06:14:00 |
| 4 | 9085243 | 12.74 | 2022-05-04T22:30:00 | insurance | refunded | pilot-processe-44 | 103 | 103 | 2025-04-16 09:14:00 |

Each payment row carries a surrogate `id`, a business-level `transactionId`, and an `amount` — for example, `$13.49` for transaction `937738` and `$25.47` for transaction `89509`. The `transactionDate` records when the payment occurred, while `paymentMethod` categorizes the settlement type: `cash`, `credit_card`, `check`, or `insurance`. The `status` column tracks the financial lifecycle with values such as `pending`, `completed`, `failed`, and `refunded`. The `processedBy` column names the system or operator that handled the transaction, and the `recordId` and `appointmentId` columns create foreign-key links back to the clinical domain, ensuring every dollar can be traced to a specific patient encounter. The `createdAt` timestamp records when the transaction record was created.

The financial views bridge payments back to the clinical and staffing records. The first view joins payments with the patient records they relate to.

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

This view answers "what was charged to this patient's record?" For patient record `100`, the view surfaces payment transaction `937738` for `$13.49`, paid by `cash` with a `pending` status. The second row links record `101` to transaction `89509` for `$25.47`, settled via `credit_card` with a `completed` status. This view is essential for revenue reconciliation, as it maps each patient record to its associated financial activity.

The second view reverses the perspective, starting from the payment and resolving outward to the patient record.

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

This view answers "which patient record does this payment belong to?" For transaction `937738` (`$13.49`, `cash`, `pending`), the view resolves the `recordId` `100` and surfaces the patient's `dateOfBirth` (`2025-04-02`), `insuranceProvider` (`seasonal-insuranc-11`), and `policyNumber` (`POL-2302`). The second row links transaction `89509` to record `101`, whose patient was born on `2022-09-13` and carries `regional-insuranc-12` insurance. This view is useful for billing inquiries, as it surfaces the patient context alongside the financial details.

The third view joins payments with their originating appointments, providing a complete encounter-to-payment trail.

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

This view answers "which appointment generated this payment?" For transaction `937738`, the view resolves the `appointmentId` `100` and surfaces the appointment's `scheduledDateTime` (`2023-10-18T21:03:00`), `status` (`scheduled`), and `serviceType` (`composite-service-81`). The second row links transaction `89509` to appointment `101`, which was `confirmed` for a `primary-service-82` encounter. This view is critical for audit purposes, as it creates an unbroken chain from appointment through payment.

## Supply Chain and Inventory Management

The physical resources consumed during patient care are tracked in the `InventoryItem` table.

**Table `InventoryItem`**

| id | itemId | itemName | category | quantityOnHand | reorderLevel | lastRestocked | memberId | appointmentId |
|---|---|---|---|---|---|---|---|---|
| 1000 | ITE-2792 | Seasonal Survey | medical_supplies | 7 | 29 | 2022-05-17T16:24:00 | 1 | 100 |
| 1001 | ITE-2795 | Integrated Corridor | office_supplies | 4 | 33 | 2023-10-01T23:41:00 | 2 | 101 |
| 1002 | ITE-2798 | Extended Series D | cleaning | 6 | 37 | 2024-03-12T06:58:00 | 3 | 102 |
| 1003 | ITE-2801 | Pilot Assessment | medical_supplies | 6 | 41 | 2025-08-23T13:15:00 | 4 | 103 |

Each inventory row carries a surrogate `id`, a business-level `itemId` (e.g., `ITE-2792`, `ITE-2795`), and an `itemName` such as "Seasonal Survey" or "Integrated Corridor". The `category` column classifies the item — values in the sample include `medical_supplies`, `office_supplies`, and `cleaning`. The `quantityOnHand` column tracks current stock levels, while `reorderLevel` specifies the threshold at which a reorder should be triggered. For example, item `ITE-2792` has `7` units on hand against a reorder level of `29`, indicating it is well below the threshold and should be reordered. The `lastRestocked` timestamp records when the item was last replenished, and the `memberId` and `appointmentId` columns link the inventory item to the staff member and appointment that consumed it.

The inventory views connect supply usage to the people and encounters that drove consumption. The first view joins inventory items with the staff members who used them.

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

This view answers "who used which supplies?" For item `ITE-2792` ("Seasonal Survey") in the `medical_supplies` category, the view resolves the `memberId` `1` and surfaces the associated staff member's details. The second row links item `ITE-2795` ("Integrated Corridor") in the `office_supplies` category to `memberId` `2`. This view supports cost allocation, as it attributes supply consumption to specific staff members.

The second view joins inventory items with the appointments that consumed them.

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

This view answers "which appointment consumed which supplies?" For item `ITE-2792` ("Seasonal Survey"), the view resolves the `appointmentId` `100` and surfaces the appointment's `scheduledDateTime`, `status`, and `serviceType`. The second row links item `ITE-2795` to appointment `101`, which was `confirmed` for a `primary-service-82` encounter. This view is essential for supply chain analytics, as it reveals which service types drive the highest consumption of specific categories.

## Closing Synthesis

The practice's operational data forms a coherent network: positions and staff define who works, appointments and patient records define who was served, payments define what was charged, and inventory items define what was consumed. The foreign-key relationships — from `StaffMember.positionId` to `StaffPosition.id`, from `PatientAppointment.recordId` to `PatientRecord.recordId`, from `PaymentTransaction.recordId` and `appointmentId` to their respective tables, and from `InventoryItem.appointmentId` and `memberId` to their targets — create a traceable chain from organizational structure through clinical encounter to financial settlement and resource consumption. Each view presented above answers a specific operational question by joining these records, and together they provide the analytical foundation for staffing decisions, compliance audits, revenue reconciliation, and supply chain management.