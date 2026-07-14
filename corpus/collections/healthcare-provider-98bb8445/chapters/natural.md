## The Disclosure Management Domain

Healthcare organizations manage complex webs of patient care, information disclosure, and support resource allocation. At the heart of this domain lies a structured record-keeping system that tracks who receives care, who discloses information to whom, through what channels, and with what outcomes. The domain captures the full lifecycle of a disclosure event: from the patient's diagnosis, through the selection of a healthcare provider, to the identification of recipients and the assignment of support resources. Each record carries identifiers, timestamps, and categorical codes that allow practitioners to reconstruct the complete picture of a patient's care journey.

**Table `HealthcareProvider`**

| providerId | providerName | specialty | contactInfo |
|---|---|---|---|
| 1 | Primary Initiative A | extended-specialt-21 | Jorge Luis Borges |
| 2 | Composite Model | integrated-specialt-22 | Focus Device |
| 3 | Compact Cluster | seasonal-specialt-23 | Thomas Rivers |
| 4 | Legacy Review D | regional-specialt-24 | Kimberly Myers |

Healthcare providers form the foundational layer of the domain. Each provider is identified by a numeric `providerId` and a human-readable `providerName`. The `specialty` column encodes the provider's area of expertise using coded values such as `extended-specialt-21` and `regional-specialt-24`. Contact information is stored in the `contactInfo` field, which holds names like Jorge Luis Borges and Thomas Rivers. In the current dataset, four providers are registered: Primary Initiative A, Composite Model, Compact Cluster, and Legacy Review D. These providers serve as the clinical anchors for patients, establishing the professional relationship that underpins all subsequent disclosures and resource assignments.

**Table `Patient`**

| id | patientId | patientName | diagnosisDate | ageAtDiagnosis | providerId |
|---|---|---|---|---|---|
| 1 | 8387541 | National Geographic Kids | 2023-10-26T21:51:00 | 32 | 1 |
| 2 | 10207142 | Ralph Waldo Emerson | 2024-03-10T04:08:00 | 35 | 2 |
| 3 | 7119782 | Mary Alvarez | 2025-08-21T11:25:00 | 38 | 3 |
| 4 | gd_acc_160003 | Peter Montgomery | 2022-01-05T18:42:00 | 41 | 4 |

Patients are the central entities around which all other records orbit. Each patient record carries a unique `id`, a `patientId` that may be numeric or alphanumeric (for instance, `8387541` for National Geographic Kids and `gd_acc_160003` for Peter Montgomery), and a `patientName`. The `diagnosisDate` field records the precise moment of diagnosis as an ISO 8601 timestamp, ranging from 2022-01-05 for Peter Montgomery to 2025-08-21 for Mary Alvarez. The `ageAtDiagnosis` column captures the patient's age at the time of diagnosis, with values spanning 32 to 41 years in the current data. Crucially, the `providerId` column links each patient to their assigned healthcare provider, creating the first foreign-key relationship in the domain. Patient 1 (National Geographic Kids) is assigned to provider 1 (Primary Initiative A), while patient 4 (Peter Montgomery) is assigned to provider 4 (Legacy Review D).

**Table `DisclosureEvent`**

| id | eventId | disclosureDate | disclosureMethod | disclosureOutcome | patientId | recipientId |
|---|---|---|---|---|---|---|
| 1 | 2002007020060 | 2025-08-02T19:33:00 | composite-disclosu-69 | pilot-disclosu-50 | 1 | 1 |
| 2 | 168535 | 2022-01-13T02:50:00 | primary-disclosu-70 | extended-disclosu-51 | 2 | 2 |
| 3 | ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 | 2023-06-24T09:07:00 | adaptive-disclosu-71 | integrated-disclosu-52 | 3 | 3 |
| 4 | 1186089 | 2024-11-08T16:24:00 | distributed-disclosu-72 | seasonal-disclosu-53 | 4 | 4 |

Disclosure events represent the core operational activity of the domain. Each event is uniquely identified by an `eventId`, which may be a numeric string like `2002007020060`, a short integer like `168535`, or a UUID such as `ab8e1d18-8fcd-11eb-924d-9cd76263cbd0`. The `disclosureDate` records when the event occurred, and the `disclosureMethod` and `disclosureOutcome` columns encode categorical values describing how the disclosure was made and what resulted from it. Method codes include `composite-disclosu-69`, `primary-disclosu-70`, `adaptive-disclosu-71`, and `distributed-disclosu-72`. Outcome codes follow a similar pattern, with values like `pilot-disclosu-50` and `seasonal-disclosu-53`. Each disclosure event links to both a patient (via `patientId`) and a recipient (via `recipientId`), forming the critical bridge between the patient's care record and the recipient's profile.

**Table `Recipient`**

| id | recipientId | recipientName | relationshipType | trustLevel | patientId |
|---|---|---|---|---|---|
| 1 | b_VB-EC-15 | Legacy Cluster D | composite-relation-69 | baseline-trust-73 | 1 |
| 2 | 1889791 | Regional Review | primary-relation-70 | pilot-trust-74 | 2 |
| 3 | 4180946 | Seasonal Initiative | adaptive-relation-71 | extended-trust-75 | 3 |
| 4 | 5789a9197ed7473eb37814ca09efb2c8 | Integrated Model A | distributed-relation-72 | integrated-trust-76 | 4 |

Recipients are the individuals or entities to whom disclosure events are directed. Each recipient has a `recipientId` that may be a short alphanumeric string like `b_VB-EC-15` or a long hash like `5789a9197ed7473eb37814ca09efb2c8`. The `recipientName` provides a human-readable label, such as Legacy Cluster D or Integrated Model A. The `relationshipType` column encodes the nature of the relationship between the recipient and the patient, using codes like `composite-relation-69` and `distributed-relation-72`. The `trustLevel` column captures the degree of trust in the relationship, with values ranging from `baseline-trust-73` to `integrated-trust-76`. The `patientId` column creates the foreign-key link back to the Patient table, ensuring every recipient is associated with exactly one patient.

**Table `SupportResource`**

| resourceId | resourceName | resourceType | availabilityStatus | patientId |
|---|---|---|---|---|
| 1 | Adaptive Corridor | seasonal-resource-65 | regional-availabi-42 | 1 |
| 2 | Primary Series | regional-resource-66 | legacy-availabi-43 | 2 |
| 3 | Composite Assessment D | legacy-resource-67 | compact-availabi-44 | 3 |
| 4 | Compact Survey | compact-resource-68 | composite-availabi-45 | 4 |

Support resources represent the auxiliary services and materials allocated to patients. Each resource has a `resourceId`, a `resourceName` (such as Adaptive Corridor or Compact Survey), and a `resourceType` encoded as a code like `seasonal-resource-65` or `compact-resource-68`. The `availabilityStatus` field indicates the current availability of the resource, with values including `regional-availabi-42` and `composite-availabi-45`. The `patientId` column links each support resource to its assigned patient, allowing practitioners to track which resources are allocated to which individuals. In the current dataset, four resources are registered, each assigned to a different patient.

**View `v_patient_healthcare_provider`**

```sql
CREATE VIEW v_patient_healthcare_provider AS
SELECT a.id, a.patientId, a.patientName, a.diagnosisDate, b.providerId AS provider_providerId, b.providerName AS provider_providerName, b.specialty AS provider_specialty
FROM Patient a JOIN HealthcareProvider b ON a.providerId = b.providerId;
```

| id | patientId | patientName | diagnosisDate | provider_providerId | provider_providerName | provider_specialty |
|---|---|---|---|---|---|---|
| 1 | 8387541 | National Geographic Kids | 2023-10-26T21:51:00 | 1 | Primary Initiative A | extended-specialt-21 |
| 2 | 10207142 | Ralph Waldo Emerson | 2024-03-10T04:08:00 | 2 | Composite Model | integrated-specialt-22 |
| 3 | 7119782 | Mary Alvarez | 2025-08-21T11:25:00 | 3 | Compact Cluster | seasonal-specialt-23 |
| 4 | gd_acc_160003 | Peter Montgomery | 2022-01-05T18:42:00 | 4 | Legacy Review D | regional-specialt-24 |

The view `v_patient_healthcare_provider` answers the fundamental question: which healthcare provider is responsible for each patient's care? This join combines the Patient table with the HealthcareProvider table on the `providerId` field, producing a flattened record that pairs each patient's identifying information with their provider's name and specialty. Row 1 shows that patient 8387541 (National Geographic Kids), diagnosed on 2023-10-26, is under the care of Primary Initiative A, whose specialty is coded as `extended-specialt-21`. Row 4 reveals that Peter Montgomery (`gd_acc_160003`), diagnosed earliest in the dataset on 2022-01-05, is assigned to Legacy Review D with specialty `regional-specialt-24`. This view is essential for administrative oversight, enabling practitioners to quickly assess provider workloads and specialty distribution across the patient population.

**View `v_disclosure_event_patient`**

```sql
CREATE VIEW v_disclosure_event_patient AS
SELECT a.id, a.eventId, a.disclosureDate, a.disclosureMethod, b.id AS patient_id, b.patientId AS patient_patientId, b.patientName AS patient_patientName
FROM DisclosureEvent a JOIN Patient b ON a.patientId = b.id;
```

| id | eventId | disclosureDate | disclosureMethod | patient_id | patient_patientId | patient_patientName |
|---|---|---|---|---|---|---|
| 1 | 2002007020060 | 2025-08-02T19:33:00 | composite-disclosu-69 | 1 | 8387541 | National Geographic Kids |
| 2 | 168535 | 2022-01-13T02:50:00 | primary-disclosu-70 | 2 | 10207142 | Ralph Waldo Emerson |
| 3 | ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 | 2023-06-24T09:07:00 | adaptive-disclosu-71 | 3 | 7119782 | Mary Alvarez |
| 4 | 1186089 | 2024-11-08T16:24:00 | distributed-disclosu-72 | 4 | gd_acc_160003 | Peter Montgomery |

The view `v_disclosure_event_patient` connects disclosure events to their originating patients, answering the question: which patient is associated with each disclosure event? By joining DisclosureEvent with Patient on the `patientId` field, this view provides a complete picture of the disclosure's context, including the patient's name and diagnosis date. Row 1 shows that event `2002007020060`, disclosed on 2025-08-02 using method `composite-disclosu-69` with outcome `pilot-disclosu-50`, is associated with patient 8387541 (National Geographic Kids), who was diagnosed on 2023-10-26. Row 3 links event `ab8e1d18-8fcd-11eb-924d-9cd76263cbd0` to patient 7119782 (Mary Alvarez), diagnosed on 2025-08-21, using the `adaptive-disclosu-71` method and producing the `integrated-disclosu-52` outcome. This view supports audit trails and temporal analysis of disclosure patterns relative to diagnosis dates.

**View `v_disclosure_event_recipient`**

```sql
CREATE VIEW v_disclosure_event_recipient AS
SELECT a.id, a.eventId, a.disclosureDate, a.disclosureMethod, b.id AS recipient_id, b.recipientId AS recipient_recipientId, b.recipientName AS recipient_recipientName
FROM DisclosureEvent a JOIN Recipient b ON a.recipientId = b.id;
```

| id | eventId | disclosureDate | disclosureMethod | recipient_id | recipient_recipientId | recipient_recipientName |
|---|---|---|---|---|---|---|
| 1 | 2002007020060 | 2025-08-02T19:33:00 | composite-disclosu-69 | 1 | b_VB-EC-15 | Legacy Cluster D |
| 2 | 168535 | 2022-01-13T02:50:00 | primary-disclosu-70 | 2 | 1889791 | Regional Review |
| 3 | ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 | 2023-06-24T09:07:00 | adaptive-disclosu-71 | 3 | 4180946 | Seasonal Initiative |
| 4 | 1186089 | 2024-11-08T16:24:00 | distributed-disclosu-72 | 4 | 5789a9197ed7473eb37814ca09efb2c8 | Integrated Model A |

The view `v_disclosure_event_recipient` bridges disclosure events with their intended recipients, answering the question: to whom was each disclosure event directed? This join between DisclosureEvent and Recipient on the `recipientId` field reveals the recipient's name, relationship type, and trust level alongside the event's method and outcome. Row 1 indicates that event `2002007020060` was directed to recipient `b_VB-EC-15` (Legacy Cluster D), with a relationship type of `composite-relation-69` and a trust level of `baseline-trust-73`. Row 4 shows that event `1186089`, disclosed on 2024-11-08 using the `distributed-disclosu-72` method, was directed to recipient `5789a9197ed7473eb37814ca09efb2c8` (Integrated Model A), who has a `distributed-relation-72` relationship type and an `integrated-trust-76` trust level. This view is critical for evaluating the effectiveness of disclosures across different relationship types and trust levels.

**View `v_recipient_patient`**

```sql
CREATE VIEW v_recipient_patient AS
SELECT a.id, a.recipientId, a.recipientName, a.relationshipType, b.id AS patient_id, b.patientId AS patient_patientId, b.patientName AS patient_patientName
FROM Recipient a JOIN Patient b ON a.patientId = b.id;
```

| id | recipientId | recipientName | relationshipType | patient_id | patient_patientId | patient_patientName |
|---|---|---|---|---|---|---|
| 1 | b_VB-EC-15 | Legacy Cluster D | composite-relation-69 | 1 | 8387541 | National Geographic Kids |
| 2 | 1889791 | Regional Review | primary-relation-70 | 2 | 10207142 | Ralph Waldo Emerson |
| 3 | 4180946 | Seasonal Initiative | adaptive-relation-71 | 3 | 7119782 | Mary Alvarez |
| 4 | 5789a9197ed7473eb37814ca09efb2c8 | Integrated Model A | distributed-relation-72 | 4 | gd_acc_160003 | Peter Montgomery |

The view `v_recipient_patient` maps recipients directly to their associated patients, answering the question: which patient does each recipient serve? By joining Recipient with Patient on the `patientId` field, this view consolidates the recipient's profile with the patient's identifying details. Row 1 shows that recipient `b_VB-EC-15` (Legacy Cluster D), with relationship type `composite-relation-69` and trust level `baseline-trust-73`, serves patient 8387541 (National Geographic Kids). Row 4 reveals that recipient `5789a9197ed7473eb37814ca09efb2c8` (Integrated Model A), characterized by a `distributed-relation-72` relationship and the highest trust level `integrated-trust-76`, serves patient `gd_acc_160003` (Peter Montgomery). This view supports relationship management and trust-level analysis across the recipient population.

**View `v_support_resource_patient`**

```sql
CREATE VIEW v_support_resource_patient AS
SELECT a.resourceId, a.resourceName, a.resourceType, a.availabilityStatus, b.id AS patient_id, b.patientId AS patient_patientId, b.patientName AS patient_patientName
FROM SupportResource a JOIN Patient b ON a.patientId = b.id;
```

| resourceId | resourceName | resourceType | availabilityStatus | patient_id | patient_patientId | patient_patientName |
|---|---|---|---|---|---|---|
| 1 | Adaptive Corridor | seasonal-resource-65 | regional-availabi-42 | 1 | 8387541 | National Geographic Kids |
| 2 | Primary Series | regional-resource-66 | legacy-availabi-43 | 2 | 10207142 | Ralph Waldo Emerson |
| 3 | Composite Assessment D | legacy-resource-67 | compact-availabi-44 | 3 | 7119782 | Mary Alvarez |
| 4 | Compact Survey | compact-resource-68 | composite-availabi-45 | 4 | gd_acc_160003 | Peter Montgomery |

The view `v_support_resource_patient` links support resources to their assigned patients, answering the question: which support resources are allocated to each patient? This join between SupportResource and Patient on the `patientId` field provides a comprehensive view of resource allocation. Row 1 shows that resource `Adaptive Corridor` (type `seasonal-resource-65`, status `regional-availabi-42`) is allocated to patient 8387541 (National Geographic Kids). Row 3 indicates that resource `Composite Assessment D` (type `legacy-resource-67`, status `compact-availabi-44`) is assigned to patient 7119782 (Mary Alvarez). This view enables practitioners to monitor resource utilization, identify availability bottlenecks, and ensure that all patients have appropriate support allocations.

## Synthesis

The disclosure management domain operates as an interconnected system of five base tables and five analytical views. The base tables establish the core entities—healthcare providers, patients, disclosure events, recipients, and support resources—each carrying its own set of identifiers, descriptive attributes, and categorical codes. The foreign-key relationships, anchored by `providerId`, `patientId`, and `recipientId`, create a coherent network that traces the flow of care from diagnosis through disclosure to resource allocation. The views synthesize these relationships into actionable perspectives: provider assignments, disclosure contexts, recipient targeting, relationship mapping, and resource distribution. Together, they form a complete operational picture that supports clinical oversight, administrative reporting, and strategic planning within the healthcare disclosure management workflow.