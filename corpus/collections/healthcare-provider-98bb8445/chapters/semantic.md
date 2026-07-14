The domain under examination concerns the management of disclosure events within a healthcare ecosystem, where patients navigate the process of sharing sensitive information with trusted recipients while being supported by healthcare providers and organizational resources. At its core, the model captures a patient-centric narrative: an individual receives a diagnosis, is assigned to a healthcare provider, discloses information through a particular method and outcome, communicates with one or more recipients whose relationship and trust level are recorded, and is allocated support resources of varying types and availability. The relational schema materializes this narrative through five base tables and five derived views, each serving a distinct role in the normalization and reconstruction of domain facts.

## The Healthcare Provider Entity

**Table `HealthcareProvider`**

| providerId | providerName | specialty | contactInfo |
|---|---|---|---|
| 1 | Primary Initiative A | extended-specialt-21 | Jorge Luis Borges |
| 2 | Composite Model | integrated-specialt-22 | Focus Device |
| 3 | Compact Cluster | seasonal-specialt-23 | Thomas Rivers |
| 4 | Legacy Review D | regional-specialt-24 | Kimberly Myers |

The `HealthcareProvider` table anchors the clinical side of the domain. It stores provider records identified by the surrogate key `id` and the business identifier `providerId`. The column `providerName` carries human-readable labels such as "Primary Initiative A", "Composite Model", "Compact Cluster", and "Legacy Review D". The `specialty` column encodes the provider's area of expertise using coded values like `extended-specialt-21`, `integrated-specialt-22`, `seasonal-specialt-23`, and `regional-specialt-24`. Finally, `contactInfo` holds a free-text or coded contact descriptor — for instance, "Jorge Luis Borges", "Focus Device", "Thomas Rivers", and "Kimberly Myers". This table is a leaf entity in the sense that no other base table references it through a foreign key; instead, the relationship flows in the opposite direction, with `Patient` holding a `providerId` column that points back to `HealthcareProvider.providerId`.

## The Patient Entity

**Table `Patient`**

| id | patientId | patientName | diagnosisDate | ageAtDiagnosis | providerId |
|---|---|---|---|---|---|
| 1 | 8387541 | National Geographic Kids | 2023-10-26T21:51:00 | 32 | 1 |
| 2 | 10207142 | Ralph Waldo Emerson | 2024-03-10T04:08:00 | 35 | 2 |
| 3 | 7119782 | Mary Alvarez | 2025-08-21T11:25:00 | 38 | 3 |
| 4 | gd_acc_160003 | Peter Montgomery | 2022-01-05T18:42:00 | 41 | 4 |

The `Patient` table is the central entity of the domain model. Each row represents a diagnosed individual, identified by the surrogate `id` and the business-level `patientId`. The `patientName` column stores names such as "National Geographic Kids", "Ralph Waldo Emerson", "Mary Alvarez", and "Peter Montgomery". The `diagnosisDate` column records the timestamp of diagnosis in ISO 8601 format — for example, `2023-10-26T21:51:00` for the first patient and `2022-01-05T18:42:00` for the fourth. The `ageAtDiagnosis` column captures the patient's age at the time of diagnosis as an integer (32, 35, 38, and 41 in the sample data). The critical structural column here is `providerId`, which serves as a foreign key referencing `HealthcareProvider.providerId`. This column binds each patient to exactly one healthcare provider, establishing a many-to-one cardinality: multiple patients may share the same provider, but each patient is associated with a single provider record. In the sample data, patient `8387541` (National Geographic Kids) is linked to provider `1` (Primary Initiative A), patient `10207142` (Ralph Waldo Emerson) to provider `2` (Composite Model), patient `7119782` (Mary Alvarez) to provider `3` (Compact Cluster), and patient `gd_acc_160003` (Peter Montgomery) to provider `4` (Legacy Review D).

## The Disclosure Event Entity

**Table `DisclosureEvent`**

| id | eventId | disclosureDate | disclosureMethod | disclosureOutcome | patientId | recipientId |
|---|---|---|---|---|---|---|
| 1 | 2002007020060 | 2025-08-02T19:33:00 | composite-disclosu-69 | pilot-disclosu-50 | 1 | 1 |
| 2 | 168535 | 2022-01-13T02:50:00 | primary-disclosu-70 | extended-disclosu-51 | 2 | 2 |
| 3 | ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 | 2023-06-24T09:07:00 | adaptive-disclosu-71 | integrated-disclosu-52 | 3 | 3 |
| 4 | 1186089 | 2024-11-08T16:24:00 | distributed-disclosu-72 | seasonal-disclosu-53 | 4 | 4 |

The `DisclosureEvent` table captures the act of disclosure as a first-class event. Each row is identified by the surrogate `id` and the business identifier `eventId`, which in the sample data takes on diverse formats: a numeric string (`2002007020060`), a short integer (`168535`), a UUID (`ab8e1d18-8fcd-11eb-924d-9cd76263cbd0`), and another integer (`1186089`). The `disclosureDate` column records when the disclosure occurred, with values such as `2025-08-02T19:33:00` and `2022-01-13T02:50:00`. The `disclosureMethod` column encodes how the disclosure was made, using coded values like `composite-disclosu-69`, `primary-disclosu-70`, `adaptive-disclosu-71`, and `distributed-disclosu-72`. The `disclosureOutcome` column captures the result of the disclosure, with values including `pilot-disclosu-50`, `extended-disclosu-51`, `integrated-disclosu-52`, and `seasonal-disclosu-53`. Two foreign key columns anchor this event to the rest of the domain: `patientId` references `Patient.id`, and `recipientId` references `Recipient.id`. This dual foreign key structure means each disclosure event is simultaneously an action taken by a specific patient and directed toward a specific recipient. In the sample data, event `2002007020060` was initiated by patient `1` (National Geographic Kids) and directed to recipient `1` (Legacy Cluster D), while event `ab8e1d18-8fcd-11eb-924d-9cd76263cbd0` was initiated by patient `3` (Mary Alvarez) and directed to recipient `3` (Seasonal Initiative).

## The Recipient Entity

**Table `Recipient`**

| id | recipientId | recipientName | relationshipType | trustLevel | patientId |
|---|---|---|---|---|---|
| 1 | b_VB-EC-15 | Legacy Cluster D | composite-relation-69 | baseline-trust-73 | 1 |
| 2 | 1889791 | Regional Review | primary-relation-70 | pilot-trust-74 | 2 |
| 3 | 4180946 | Seasonal Initiative | adaptive-relation-71 | extended-trust-75 | 3 |
| 4 | 5789a9197ed7473eb37814ca09efb2c8 | Integrated Model A | distributed-relation-72 | integrated-trust-76 | 4 |

The `Recipient` table models the individuals or entities to whom a patient discloses information. Each row is identified by the surrogate `id` and the business identifier `recipientId`. The `recipientName` column stores names such as "Legacy Cluster D", "Regional Review", "Seasonal Initiative", and "Integrated Model A". The `relationshipType` column encodes the nature of the relationship between the recipient and the patient, using coded values like `composite-relation-69`, `primary-relation-70`, `adaptive-relation-71`, and `distributed-relation-72`. The `trustLevel` column captures the degree of trust in the relationship, with values including `baseline-trust-73`, `pilot-trust-74`, `extended-trust-75`, and `integrated-trust-76`. The foreign key column `patientId` references `Patient.id`, establishing that each recipient is associated with exactly one patient. This creates a one-to-many relationship from Patient to Recipient: a single patient may have multiple recipients, but each recipient record belongs to one patient. In the sample data, recipient `b_VB-EC-15` (Legacy Cluster D) is linked to patient `1`, recipient `1889791` (Regional Review) to patient `2`, recipient `4180946` (Seasonal Initiative) to patient `3`, and recipient `5789a9197ed7473eb37814ca09efb2c8` (Integrated Model A) to patient `4`.

## The Support Resource Entity

**Table `SupportResource`**

| resourceId | resourceName | resourceType | availabilityStatus | patientId |
|---|---|---|---|---|
| 1 | Adaptive Corridor | seasonal-resource-65 | regional-availabi-42 | 1 |
| 2 | Primary Series | regional-resource-66 | legacy-availabi-43 | 2 |
| 3 | Composite Assessment D | legacy-resource-67 | compact-availabi-44 | 3 |
| 4 | Compact Survey | compact-resource-68 | composite-availabi-45 | 4 |

The `SupportResource` table models the resources allocated to support a patient through their disclosure journey. Each row is identified by the surrogate `id` and the business identifier `resourceId`. The `resourceName` column stores human-readable resource names such as "Adaptive Corridor", "Primary Series", "Composite Assessment D", and "Compact Survey". The `resourceType` column encodes the type of resource using coded values like `seasonal-resource-65`, `regional-resource-66`, `legacy-resource-67`, and `compact-resource-68`. The `availabilityStatus` column captures the current availability of the resource, with values including `regional-availabi-42`, `legacy-availabi-43`, `compact-availabi-44`, and `composite-availabi-45`. The foreign key column `patientId` references `Patient.id`, binding each support resource to a specific patient. Like the Recipient table, this creates a one-to-many relationship from Patient to SupportResource: a patient may be allocated multiple resources, but each resource record is associated with exactly one patient. In the sample data, resource `1` (Adaptive Corridor) is linked to patient `1`, resource `2` (Primary Series) to patient `2`, resource `3` (Composite Assessment D) to patient `3`, and resource `4` (Compact Survey) to patient `4`.

## Reconstructing Patient-Provider Relationships

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

The view `v_patient_healthcare_provider` answers the question: "Which healthcare provider is associated with each patient, and what is that provider's specialty?" It achieves this by joining `Patient` to `HealthcareProvider` on the condition `Patient.providerId = HealthcareProvider.providerId`. The result is a denormalized row per patient that includes the patient's own attributes (`id`, `patientId`, `patientName`, `diagnosisDate`) alongside the provider's attributes (`providerId`, `providerName`, `specialty`), with the provider columns aliased using the `provider_` prefix to avoid naming collisions. Reading the first row of the view, we see that patient `8387541` (National Geographic Kids), diagnosed on `2023-10-26T21:51:00`, is served by provider `1` (Primary Initiative A) with specialty `extended-specialt-21`. The second row reveals that patient `10207142` (Ralph Waldo Emerson), diagnosed on `2024-03-10T04:08:00`, is served by provider `2` (Composite Model) with specialty `integrated-specialt-22`. The third and fourth rows follow the same pattern for patients `7119782` and `gd_acc_160003`. This view materializes the many-to-one patient-to-provider relationship as a flat, queryable structure, eliminating the need for the consumer to perform the join manually.

## Reconstructing Disclosure-Patient Relationships

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

The view `v_disclosure_event_patient` answers the question: "Which patient initiated each disclosure event, and what are the event's method and outcome?" Although the SQL definition is not provided in the payload, the naming convention and domain structure imply a join between `DisclosureEvent` and `Patient` on `DisclosureEvent.patientId = Patient.id`. The resulting view would present each disclosure event alongside the patient's identifying and demographic attributes, enabling analysts to trace every disclosure back to the individual who made it. For instance, event `2002007020060`, disclosed on `2025-08-02T19:33:00` via method `composite-disclosu-69` with outcome `pilot-disclosu-50`, would appear in the view alongside the patient record for `8387541` (National Geographic Kids). Similarly, event `ab8e1d18-8fcd-11eb-924d-9cd76263cbd0`, disclosed on `2023-06-24T09:07:00` via method `adaptive-disclosu-71` with outcome `integrated-disclosu-52`, would be associated with patient `7119782` (Mary Alvarez). This view supports queries about patient-level disclosure patterns, such as counting events per patient or comparing disclosure methods across the patient population.

## Reconstructing Disclosure-Recipient Relationships

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

The view `v_disclosure_event_recipient` answers the question: "To which recipient was each disclosure event directed, and what is the nature of that recipient relationship?" This view joins `DisclosureEvent` to `Recipient` on `DisclosureEvent.recipientId = Recipient.id`, producing a row per disclosure event that includes the recipient's identifying attributes and relationship metadata. Reading the sample data, event `2002007020060` (disclosed on `2025-08-02T19:33:00` via `composite-disclosu-69` with outcome `pilot-disclosu-50`) was directed to recipient `b_VB-EC-15` (Legacy Cluster D), whose relationship type is `composite-relation-69` and trust level is `baseline-trust-73`. Event `168535` (disclosed on `2022-01-13T02:50:00` via `primary-disclosu-70` with outcome `extended-disclosu-51`) was directed to recipient `1889791` (Regional Review), whose relationship type is `primary-relation-70` and trust level is `pilot-trust-74`. This view enables analysis of recipient-level patterns, such as which recipients receive the most disclosures or how trust levels correlate with disclosure outcomes.

## Reconstructing Recipient-Patient Relationships

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

The view `v_recipient_patient` answers the question: "Which patient is each recipient associated with, and what are the recipient's relationship and trust characteristics?" This view joins `Recipient` to `Patient` on `Recipient.patientId = Patient.id`, producing a denormalized row per recipient that includes the patient's identifying attributes alongside the recipient's relationship metadata. In the sample data, recipient `b_VB-EC-15` (Legacy Cluster D), with relationship type `composite-relation-69` and trust level `baseline-trust-73`, is associated with patient `8387541` (National Geographic Kids). Recipient `5789a9197ed7473eb37814ca09efb2c8` (Integrated Model A), with relationship type `distributed-relation-72` and trust level `integrated-trust-76`, is associated with patient `gd_acc_160003` (Peter Montgomery). This view supports queries about the composition of a patient's support network, such as listing all recipients for a given patient or comparing trust levels across patients.

## Reconstructing Support Resource-Patient Relationships

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

The view `v_support_resource_patient` answers the question: "Which patient is allocated each support resource, and what are the resource's type and availability status?" This view joins `SupportResource` to `Patient` on `SupportResource.patientId = Patient.id`, producing a denormalized row per resource that includes the patient's identifying attributes alongside the resource's metadata. In the sample data, resource `1` (Adaptive Corridor), of type `seasonal-resource-65` with availability status `regional-availabi-42`, is allocated to patient `8387541` (National Geographic Kids). Resource `4` (Compact Survey), of type `compact-resource-68` with availability status `composite-availabi-45`, is allocated to patient `gd_acc_160003` (Peter Montgomery). This view supports queries about resource utilization, such as listing all resources for a given patient or filtering resources by type or availability.

## Synthesis

The schema embodies a patient-centric normalization strategy. The `Patient` table sits at the center, with four other base tables — `HealthcareProvider`, `DisclosureEvent`, `Recipient`, and `SupportResource` — each linked to it through a foreign key column (`providerId` in `Patient`, and `patientId` in `DisclosureEvent`, `Recipient`, and `SupportResource`). The `DisclosureEvent` table is unique in that it carries two foreign keys (`patientId` and `recipientId`), making it the bridge between the patient and recipient entities and enabling the reconstruction of the full disclosure narrative. The five views each collapse a pair of related tables into a single denormalized result, answering a specific domain question by joining on the appropriate foreign key and presenting the combined attributes in a flat, queryable form. Together, the base tables and views provide a complete relational representation of the disclosure management domain, from the individual patient and their provider through the events, recipients, and resources that constitute the care journey.