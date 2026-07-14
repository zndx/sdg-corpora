## The Healthcare Record Ecosystem

Healthcare delivery generates a continuous trail of patient encounters, each one producing clinical documentation, financial transactions, and regulatory disclosures. The records that capture these encounters form an interconnected ecosystem where patient identities, treatment activities, provider assignments, billing outcomes, and disclosure obligations must remain consistent across every system that touches them. A single service date can anchor a clinical note, a charge entry, a payment resolution, and a privacy disclosure—all traceable through shared identifiers. Understanding how these records relate is essential for anyone responsible for data integrity, audit readiness, or operational reporting within a healthcare organization.

The foundation of this ecosystem is the patient record, which serves as the primary container for encounter-level information.

**Table `patient_records`**

| record_id | patient_name | date_of_service | record_status | access_level | patient_id | billing_record_id | treatment_event_id |
|---|---|---|---|---|---|---|---|
| 10449530 | National Geographic Kids | 2024-07-09T06:30:00 | active | public | 1 | 1 | 1 |
| 10445619 | Ralph Waldo Emerson | 2025-12-20T13:47:00 | archived | internal | 2 | 2 | 2 |
| 9568457 | Mary Alvarez | 2022-05-04T20:04:00 | restricted | confidential | 3 | 3 | 3 |
| 20743593 | Peter Montgomery | 2023-10-15T03:21:00 | active | public | 4 | 4 | 4 |

Each patient record carries a unique record identifier, a patient name, and a date of service that anchors the encounter in time. The record status indicates whether the document is currently active, archived, or restricted, while the access level governs who may view it—public, internal, or confidential. In the data, record 10449530 belongs to National Geographic Kids, was created on 2024-07-09, and carries a public access level with an active status. By contrast, record 9568457 for Mary Alvarez is marked confidential and restricted, reflecting the sensitivity of the care provided. Every record also references a patient through a patient_id, links to a billing record via billing_record_id, and ties to a treatment event through treatment_event_id, forming the backbone of cross-referential integrity.

Patient-level information is maintained in a separate table that captures contact preferences and consent status.

**Table `patients`**

| id | patient_id | preferred_contact_method | preferred_contact_location | consent_status | record_id | treatment_event_id |
|---|---|---|---|---|---|---|
| 1 | 8387541 | phone | home | false | 10449530 | 1 |
| 2 | 10207142 | mail | work | true | 10445619 | 2 |
| 3 | 7119782 | email | mobile | false | 9568457 | 3 |
| 4 | gd_acc_160003 | phone | home | true | 20743593 | 4 |

The patients table stores each individual's preferred method of communication—phone, mail, or email—and their preferred contact location, which may be home or work. Consent status indicates whether the patient has provided affirmative consent for their data to be used in certain contexts. Patient 1, reachable by phone at home, has not provided consent, while patient 2, who prefers mail at work, has consented. Patient 4 carries the identifier gd_acc_160003, suggesting a GDPR-related account designation, and has provided consent for phone contact at home. Each patient entry links back to a patient_records record through the record_id column and to a treatment event through treatment_event_id, ensuring that consent and contact preferences travel with the clinical encounter.

Treatment events represent the actual delivery of care and serve as the operational hub of the system.

**Table `treatment_events`**

| id | event_id | event_date | service_code | event_status | patient_id | healthcare_provider_id | billing_record_id |
|---|---|---|---|---|---|---|---|
| 1 | 2002007020060 | 2025-04-15T15:21:00 | 20789856 | scheduled | 1 | 100 | 1 |
| 2 | 168535 | 2022-09-26T22:38:00 | 3990167 | completed | 2 | 101 | 2 |
| 3 | ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 | 2023-02-10T05:55:00 | 14484998 | cancelled | 3 | 102 | 3 |
| 4 | 1186089 | 2024-07-21T12:12:00 | Total | scheduled | 4 | 103 | 4 |

Every treatment event is identified by an event identifier, which may be a numeric string such as 2002007020060, a short numeric code like 168535, or a UUID such as ab8e1d18-8fcd-11eb-924d-9cd76263cbd0. The event date records when the service occurred, while the service code categorizes the type of care delivered. Event status tracks the lifecycle of the encounter—scheduled, completed, or cancelled. Treatment event 1, scheduled for 2025-04-15 under service code 20789856, is still pending. Event 2, completed on 2022-09-26 with service code 3990167, represents a finished encounter. Event 3, bearing a UUID as its event identifier, was cancelled on 2023-02-10. Each event references a patient, a healthcare provider, and a billing record, making it the central node that connects clinical, financial, and personnel data.

Healthcare providers are catalogued with their roles and access permissions.

**Table `healthcare_providers`**

| id | provider_id | provider_name | role | access_permission | treatment_event_id | disclosure_record_disclosure_id |
|---|---|---|---|---|---|---|
| 100 | 3717633 | Primary Initiative A | physician | false | 1 | 195359 |
| 101 | ChIJYRd8uPtt5kcRunQjrWb4IKs | Composite Model | nurse | true | 2 | 1250217 |
| 102 | 8928519 | Compact Cluster | admin | false | 3 | 4447022 |
| 103 | lu_tax_code_template_m13 | Legacy Review D | compliance | true | 4 | 1437596 |

The healthcare_providers table assigns each practitioner a provider identifier, a name, and a role such as physician, nurse, admin, or compliance. Access permission indicates whether the provider has elevated system access—true grants permission, false restricts it. Provider 100, named Primary Initiative A, serves as a physician without elevated access and is linked to disclosure record 195359. Provider 101, Composite Model, is a nurse with access permission enabled and connects to disclosure record 1250217. Provider 103, Legacy Review D, holds a compliance role with access permission active and is associated with disclosure record 1437596. Each provider entry references a treatment event and a disclosure record, ensuring that every clinical interaction is attributable to a credentialed individual with a documented disclosure history.

Financial transactions are captured in the billing records table.

**Table `billing_records`**

| id | billing_id | amount | payment_status | billing_date | treatment_event_id | record_id |
|---|---|---|---|---|---|---|
| 1 | 4985154 | 13.49 | pending | 2025-08-24T07:09:00 | 1 | 10449530 |
| 2 | 9568457 | 25.47 | paid | 2022-01-08T14:26:00 | 2 | 10445619 |
| 3 | 8928508 | 19.72 | denied | 2023-06-19T21:43:00 | 3 | 9568457 |
| 4 | 5f927026-8fcd-11eb-924d-9cd76263cbd0 | 12.74 | pending | 2024-11-03T04:00:00 | 4 | 20743593 |

Billing records store the monetary aspect of each encounter, recording the amount charged, the payment status, and the billing date. Amounts range from 12.74 to 25.47 in the current dataset. Payment status can be pending, paid, or denied, reflecting the outcome of insurance or direct-payment processing. Billing record 1, associated with treatment event 1, shows an amount of 13.49 with a pending status as of 2025-08-24. Billing record 2, tied to treatment event 2, reflects a paid amount of 25.47 from 2022-01-08. Billing record 3, linked to treatment event 3, shows a denied claim of 19.72 dated 2023-06-19. Each billing record references a treatment event and a patient record, creating a financial thread that runs through the clinical encounter.

Disclosure records document every instance where patient information was shared, satisfying regulatory and operational transparency requirements.

**Table `disclosure_records`**

| disclosure_id | disclosure_date | purpose | recipient | record_id | healthcare_provider_id |
|---|---|---|---|---|---|
| 195359 | 2025-08-02T19:33:00 | treatment | legacy-recipien-73 | 10449530 | 100 |
| 1250217 | 2022-01-13T02:50:00 | payment | compact-recipien-74 | 10445619 | 101 |
| 4447022 | 2023-06-24T09:07:00 | healthcare_operations | composite-recipien-75 | 9568457 | 102 |
| 1437596 | 2024-11-08T16:24:00 | research | primary-recipien-76 | 20743593 | 103 |

Each disclosure record carries a disclosure identifier, a disclosure date, and a purpose that categorizes the reason for sharing—treatment, payment, healthcare_operations, or research. The recipient field identifies the party that received the information, with values such as legacy-recipien-73 and compact-recipien-74. Disclosure 195359, dated 2025-08-02, was shared for treatment purposes with legacy-recipien-73 and is linked to patient record 10449530 and provider 100. Disclosure 1250217, dated 2022-01-13, was shared for payment purposes with compact-recipien-74 and connects to provider 101. Disclosure 1437596, dated 2024-11-08, was shared for research purposes with primary-recipien-76 and is associated with provider 103. These records ensure that every data access is traceable to a specific purpose, recipient, and provider.

The relationships between these base tables are made explicit through a series of joined views, each answering a specific operational question.

**View `v_patient_record_patient`**

```sql
CREATE VIEW v_patient_record_patient AS
SELECT a.record_id, a.patient_name, a.date_of_service, a.record_status, b.id AS patient_id, b.patient_id AS patient_patient_id, b.preferred_contact_method AS patient_preferred_contact_method
FROM patient_records a JOIN patients b ON a.patient_id = b.id;
```

| record_id | patient_name | date_of_service | record_status | patient_id | patient_patient_id | patient_preferred_contact_method |
|---|---|---|---|---|---|---|
| 10449530 | National Geographic Kids | 2024-07-09T06:30:00 | active | 1 | 8387541 | phone |
| 10445619 | Ralph Waldo Emerson | 2025-12-20T13:47:00 | archived | 2 | 10207142 | mail |
| 9568457 | Mary Alvarez | 2022-05-04T20:04:00 | restricted | 3 | 7119782 | email |
| 20743593 | Peter Montgomery | 2023-10-15T03:21:00 | active | 4 | gd_acc_160003 | phone |

This view joins patient_records with patients to answer the question of which patient details correspond to each clinical record. It reveals that patient record 10449530 (National Geographic Kids) is associated with a patient who prefers phone contact at home and has not provided consent. Record 9568457 (Mary Alvarez) links to a patient who prefers email contact at mobile and also lacks consent. The view makes it immediately clear which records involve patients who have not yet provided consent, a critical flag for compliance review.

**View `v_patient_record_billing_record`**

```sql
CREATE VIEW v_patient_record_billing_record AS
SELECT a.record_id, a.patient_name, a.date_of_service, a.record_status, b.id AS record_id, b.billing_id AS record_billing_id, b.amount AS record_amount
FROM patient_records a JOIN billing_records b ON a.billing_record_id = b.id;
```

| record_id | patient_name | date_of_service | record_status | record_id | record_billing_id | record_amount |
|---|---|---|---|---|---|---|
| 10449530 | National Geographic Kids | 2024-07-09T06:30:00 | active | 1 | 4985154 | 13.49 |
| 10445619 | Ralph Waldo Emerson | 2025-12-20T13:47:00 | archived | 2 | 9568457 | 25.47 |
| 9568457 | Mary Alvarez | 2022-05-04T20:04:00 | restricted | 3 | 8928508 | 19.72 |
| 20743593 | Peter Montgomery | 2023-10-15T03:21:00 | active | 4 | 5f927026-8fcd-11eb-924d-9cd76263cbd0 | 12.74 |

By joining patient_records with billing_records, this view surfaces the financial status of each clinical encounter. Record 10449530 is linked to billing record 1, which shows a pending payment of 13.49. Record 9568457 connects to billing record 3, which carries a denied status for 19.72. This join enables administrators to identify records where billing remains unresolved or where claims have been rejected, supporting revenue cycle management.

**View `v_patient_record_treatment_event`**

```sql
CREATE VIEW v_patient_record_treatment_event AS
SELECT a.record_id, a.patient_name, a.date_of_service, a.record_status, b.id AS event_id, b.event_id AS event_event_id, b.event_date AS event_event_date
FROM patient_records a JOIN treatment_events b ON a.treatment_event_id = b.id;
```

| record_id | patient_name | date_of_service | record_status | event_id | event_event_id | event_event_date |
|---|---|---|---|---|---|---|
| 10449530 | National Geographic Kids | 2024-07-09T06:30:00 | active | 1 | 2002007020060 | 2025-04-15T15:21:00 |
| 10445619 | Ralph Waldo Emerson | 2025-12-20T13:47:00 | archived | 2 | 168535 | 2022-09-26T22:38:00 |
| 9568457 | Mary Alvarez | 2022-05-04T20:04:00 | restricted | 3 | ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 | 2023-02-10T05:55:00 |
| 20743593 | Peter Montgomery | 2023-10-15T03:21:00 | active | 4 | 1186089 | 2024-07-21T12:12:00 |

This view connects patient_records to treatment_events, revealing the clinical activity behind each record. Record 10449530 is tied to treatment event 1, which is scheduled and carries service code 20789856. Record 10445619 (Ralph Waldo Emerson) links to treatment event 2, which is completed with service code 3990167. The view provides a direct mapping from documentation to the underlying clinical activity, useful for verifying that records accurately reflect completed or planned care.

**View `v_patient_patient_record`**

```sql
CREATE VIEW v_patient_patient_record AS
SELECT a.id, a.patient_id, a.preferred_contact_method, a.preferred_contact_location, b.record_id AS record_record_id, b.patient_name AS record_patient_name, b.date_of_service AS record_date_of_service
FROM patients a JOIN patient_records b ON a.record_id = b.record_id;
```

| id | patient_id | preferred_contact_method | preferred_contact_location | record_record_id | record_patient_name | record_date_of_service |
|---|---|---|---|---|---|---|
| 1 | 8387541 | phone | home | 10449530 | National Geographic Kids | 2024-07-09T06:30:00 |
| 2 | 10207142 | mail | work | 10445619 | Ralph Waldo Emerson | 2025-12-20T13:47:00 |
| 3 | 7119782 | email | mobile | 9568457 | Mary Alvarez | 2022-05-04T20:04:00 |
| 4 | gd_acc_160003 | phone | home | 20743593 | Peter Montgomery | 2023-10-15T03:21:00 |

Reversing the perspective, this view starts from the patients table and joins to patient_records, answering which clinical records belong to each patient. Patient 1 (identifier 8387541) is linked to record 10449530, while patient 2 (identifier 10207142) is linked to record 10445619. This orientation is useful for patient-facing reports and for verifying that each patient has an associated clinical record.

**View `v_patient_treatment_event`**

```sql
CREATE VIEW v_patient_treatment_event AS
SELECT a.id, a.patient_id, a.preferred_contact_method, a.preferred_contact_location, b.id AS event_id, b.event_id AS event_event_id, b.event_date AS event_event_date
FROM patients a JOIN treatment_events b ON a.treatment_event_id = b.id;
```

| id | patient_id | preferred_contact_method | preferred_contact_location | event_id | event_event_id | event_event_date |
|---|---|---|---|---|---|---|
| 1 | 8387541 | phone | home | 1 | 2002007020060 | 2025-04-15T15:21:00 |
| 2 | 10207142 | mail | work | 2 | 168535 | 2022-09-26T22:38:00 |
| 3 | 7119782 | email | mobile | 3 | ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 | 2023-02-10T05:55:00 |
| 4 | gd_acc_160003 | phone | home | 4 | 1186089 | 2024-07-21T12:12:00 |

This view joins patients directly to treatment_events, providing a patient-centric view of their clinical encounters. Patient 1 is associated with treatment event 1 (scheduled, service code 20789856), and patient 3 is associated with treatment event 3 (cancelled, UUID event identifier). The view is particularly useful for identifying patients with cancelled or pending encounters, which may require follow-up.

**View `v_treatment_event_patient`**

```sql
CREATE VIEW v_treatment_event_patient AS
SELECT a.id, a.event_id, a.event_date, a.service_code, b.id AS patient_id, b.patient_id AS patient_patient_id, b.preferred_contact_method AS patient_preferred_contact_method
FROM treatment_events a JOIN patients b ON a.patient_id = b.id;
```

| id | event_id | event_date | service_code | patient_id | patient_patient_id | patient_preferred_contact_method |
|---|---|---|---|---|---|---|
| 1 | 2002007020060 | 2025-04-15T15:21:00 | 20789856 | 1 | 8387541 | phone |
| 2 | 168535 | 2022-09-26T22:38:00 | 3990167 | 2 | 10207142 | mail |
| 3 | ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 | 2023-02-10T05:55:00 | 14484998 | 3 | 7119782 | email |
| 4 | 1186089 | 2024-07-21T12:12:00 | Total | 4 | gd_acc_160003 | phone |

Flipping the perspective again, this view starts from treatment_events and joins to patients, answering which patient is associated with each clinical encounter. Treatment event 1 (scheduled, 2025-04-15) is linked to patient 1, while treatment event 4 (scheduled, 2024-07-21) is linked to patient 4, who carries the GDPR-related identifier gd_acc_160003. This orientation supports clinical scheduling and encounter tracking from the provider's perspective.

**View `v_treatment_event_healthcare_provider`**

```sql
CREATE VIEW v_treatment_event_healthcare_provider AS
SELECT a.id, a.event_id, a.event_date, a.service_code, b.id AS provider_id, b.provider_id AS provider_provider_id, b.provider_name AS provider_provider_name
FROM treatment_events a JOIN healthcare_providers b ON a.healthcare_provider_id = b.id;
```

| id | event_id | event_date | service_code | provider_id | provider_provider_id | provider_provider_name |
|---|---|---|---|---|---|---|
| 1 | 2002007020060 | 2025-04-15T15:21:00 | 20789856 | 100 | 3717633 | Primary Initiative A |
| 2 | 168535 | 2022-09-26T22:38:00 | 3990167 | 101 | ChIJYRd8uPtt5kcRunQjrWb4IKs | Composite Model |
| 3 | ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 | 2023-02-10T05:55:00 | 14484998 | 102 | 8928519 | Compact Cluster |
| 4 | 1186089 | 2024-07-21T12:12:00 | Total | 103 | lu_tax_code_template_m13 | Legacy Review D |

This view joins treatment_events with healthcare_providers, revealing which provider delivered each service. Treatment event 1 is associated with provider 100 (Primary Initiative A, physician), while treatment event 2 is associated with provider 101 (Composite Model, nurse). Treatment event 4 links to provider 103 (Legacy Review D, compliance). This join is essential for attributing clinical work to specific practitioners and for auditing provider activity.

**View `v_treatment_event_billing_record`**

```sql
CREATE VIEW v_treatment_event_billing_record AS
SELECT a.id, a.event_id, a.event_date, a.service_code, b.id AS record_id, b.billing_id AS record_billing_id, b.amount AS record_amount
FROM treatment_events a JOIN billing_records b ON a.billing_record_id = b.id;
```

| id | event_id | event_date | service_code | record_id | record_billing_id | record_amount |
|---|---|---|---|---|---|---|
| 1 | 2002007020060 | 2025-04-15T15:21:00 | 20789856 | 1 | 4985154 | 13.49 |
| 2 | 168535 | 2022-09-26T22:38:00 | 3990167 | 2 | 9568457 | 25.47 |
| 3 | ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 | 2023-02-10T05:55:00 | 14484998 | 3 | 8928508 | 19.72 |
| 4 | 1186089 | 2024-07-21T12:12:00 | Total | 4 | 5f927026-8fcd-11eb-924d-9cd76263cbd0 | 12.74 |

By connecting treatment_events to billing_records, this view answers which financial record corresponds to each clinical encounter. Treatment event 1 links to billing record 1 (pending, 13.49), and treatment event 2 links to billing record 2 (paid, 25.47). Treatment event 3 connects to billing record 3 (denied, 19.72). This view is critical for reconciling clinical activity with financial outcomes and for identifying encounters where billing has not been resolved.

**View `v_healthcare_provider_treatment_event`**

```sql
CREATE VIEW v_healthcare_provider_treatment_event AS
SELECT a.id, a.provider_id, a.provider_name, a.role, b.id AS event_id, b.event_id AS event_event_id, b.event_date AS event_event_date
FROM healthcare_providers a JOIN treatment_events b ON a.treatment_event_id = b.id;
```

| id | provider_id | provider_name | role | event_id | event_event_id | event_event_date |
|---|---|---|---|---|---|---|
| 100 | 3717633 | Primary Initiative A | physician | 1 | 2002007020060 | 2025-04-15T15:21:00 |
| 101 | ChIJYRd8uPtt5kcRunQjrWb4IKs | Composite Model | nurse | 2 | 168535 | 2022-09-26T22:38:00 |
| 102 | 8928519 | Compact Cluster | admin | 3 | ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 | 2023-02-10T05:55:00 |
| 103 | lu_tax_code_template_m13 | Legacy Review D | compliance | 4 | 1186089 | 2024-07-21T12:12:00 |

This view starts from healthcare_providers and joins to treatment_events, showing which encounters each provider has been assigned. Provider 100 (Primary Initiative A) is linked to treatment event 1, and provider 102 (Compact Cluster) is linked to treatment event 3. This orientation supports workload analysis and provider scheduling.

**View `v_healthcare_provider_disclosure_record`**

```sql
CREATE VIEW v_healthcare_provider_disclosure_record AS
SELECT a.id, a.provider_id, a.provider_name, a.role, b.disclosure_id AS record_disclosure_id, b.disclosure_date AS record_disclosure_date, b.purpose AS record_purpose
FROM healthcare_providers a JOIN disclosure_records b ON a.disclosure_record_disclosure_id = b.disclosure_id;
```

| id | provider_id | provider_name | role | record_disclosure_id | record_disclosure_date | record_purpose |
|---|---|---|---|---|---|---|
| 100 | 3717633 | Primary Initiative A | physician | 195359 | 2025-08-02T19:33:00 | treatment |
| 101 | ChIJYRd8uPtt5kcRunQjrWb4IKs | Composite Model | nurse | 1250217 | 2022-01-13T02:50:00 | payment |
| 102 | 8928519 | Compact Cluster | admin | 4447022 | 2023-06-24T09:07:00 | healthcare_operations |
| 103 | lu_tax_code_template_m13 | Legacy Review D | compliance | 1437596 | 2024-11-08T16:24:00 | research |

This view joins healthcare_providers with disclosure_records, revealing which disclosures each provider is associated with. Provider 100 is linked to disclosure 195359 (treatment purpose, 2025-08-02), and provider 101 is linked to disclosure 1250217 (payment purpose, 2022-01-13). Provider 103 connects to disclosure 1437596 (research purpose, 2024-11-08). This join is vital for auditing provider-level data sharing and ensuring that disclosures are properly attributed.

**View `v_billing_record_treatment_event`**

```sql
CREATE VIEW v_billing_record_treatment_event AS
SELECT a.id, a.billing_id, a.amount, a.payment_status, b.id AS event_id, b.event_id AS event_event_id, b.event_date AS event_event_date
FROM billing_records a JOIN treatment_events b ON a.treatment_event_id = b.id;
```

| id | billing_id | amount | payment_status | event_id | event_event_id | event_event_date |
|---|---|---|---|---|---|---|
| 1 | 4985154 | 13.49 | pending | 1 | 2002007020060 | 2025-04-15T15:21:00 |
| 2 | 9568457 | 25.47 | paid | 2 | 168535 | 2022-09-26T22:38:00 |
| 3 | 8928508 | 19.72 | denied | 3 | ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 | 2023-02-10T05:55:00 |
| 4 | 5f927026-8fcd-11eb-924d-9cd76263cbd0 | 12.74 | pending | 4 | 1186089 | 2024-07-21T12:12:00 |

Reversing the treatment-to-billing direction, this view starts from billing_records and joins to treatment_events, answering which clinical encounter generated each charge. Billing record 1 (pending, 13.49) traces to treatment event 1, and billing record 4 (pending, 12.74) traces to treatment event 4. This orientation is useful for billing teams investigating outstanding charges and tracing them back to their clinical origin.

**View `v_billing_record_patient_record`**

```sql
CREATE VIEW v_billing_record_patient_record AS
SELECT a.id, a.billing_id, a.amount, a.payment_status, b.record_id AS record_record_id, b.patient_name AS record_patient_name, b.date_of_service AS record_date_of_service
FROM billing_records a JOIN patient_records b ON a.record_id = b.record_id;
```

| id | billing_id | amount | payment_status | record_record_id | record_patient_name | record_date_of_service |
|---|---|---|---|---|---|---|
| 1 | 4985154 | 13.49 | pending | 10449530 | National Geographic Kids | 2024-07-09T06:30:00 |
| 2 | 9568457 | 25.47 | paid | 10445619 | Ralph Waldo Emerson | 2025-12-20T13:47:00 |
| 3 | 8928508 | 19.72 | denied | 9568457 | Mary Alvarez | 2022-05-04T20:04:00 |
| 4 | 5f927026-8fcd-11eb-924d-9cd76263cbd0 | 12.74 | pending | 20743593 | Peter Montgomery | 2023-10-15T03:21:00 |

This view joins billing_records with patient_records, connecting financial transactions to their corresponding clinical documentation. Billing record 1 links to patient record 10449530 (National Geographic Kids, public access), and billing record 2 links to patient record 10445619 (Ralph Waldo Emerson, internal access). This join supports financial audits that require cross-referencing charges with the underlying clinical records.

**View `v_disclosure_record_patient_record`**

```sql
CREATE VIEW v_disclosure_record_patient_record AS
SELECT a.disclosure_id, a.disclosure_date, a.purpose, a.recipient, b.record_id AS record_record_id, b.patient_name AS record_patient_name, b.date_of_service AS record_date_of_service
FROM disclosure_records a JOIN patient_records b ON a.record_id = b.record_id;
```

| disclosure_id | disclosure_date | purpose | recipient | record_record_id | record_patient_name | record_date_of_service |
|---|---|---|---|---|---|---|
| 195359 | 2025-08-02T19:33:00 | treatment | legacy-recipien-73 | 10449530 | National Geographic Kids | 2024-07-09T06:30:00 |
| 1250217 | 2022-01-13T02:50:00 | payment | compact-recipien-74 | 10445619 | Ralph Waldo Emerson | 2025-12-20T13:47:00 |
| 4447022 | 2023-06-24T09:07:00 | healthcare_operations | composite-recipien-75 | 9568457 | Mary Alvarez | 2022-05-04T20:04:00 |
| 1437596 | 2024-11-08T16:24:00 | research | primary-recipien-76 | 20743593 | Peter Montgomery | 2023-10-15T03:21:00 |

This view connects disclosure_records to patient_records, revealing which clinical records were the subject of each data disclosure. Disclosure 195359 (treatment purpose) is linked to patient record 10449530, and disclosure 1250217 (payment purpose) is linked to patient record 10445619. This join is essential for compliance reporting, as it shows exactly which patient records were shared and for what purpose.

**View `v_disclosure_record_healthcare_provider`**

```sql
CREATE VIEW v_disclosure_record_healthcare_provider AS
SELECT a.disclosure_id, a.disclosure_date, a.purpose, a.recipient, b.id AS provider_id, b.provider_id AS provider_provider_id, b.provider_name AS provider_provider_name
FROM disclosure_records a JOIN healthcare_providers b ON a.healthcare_provider_id = b.id;
```

| disclosure_id | disclosure_date | purpose | recipient | provider_id | provider_provider_id | provider_provider_name |
|---|---|---|---|---|---|---|
| 195359 | 2025-08-02T19:33:00 | treatment | legacy-recipien-73 | 100 | 3717633 | Primary Initiative A |
| 1250217 | 2022-01-13T02:50:00 | payment | compact-recipien-74 | 101 | ChIJYRd8uPtt5kcRunQjrWb4IKs | Composite Model |
| 4447022 | 2023-06-24T09:07:00 | healthcare_operations | composite-recipien-75 | 102 | 8928519 | Compact Cluster |
| 1437596 | 2024-11-08T16:24:00 | research | primary-recipien-76 | 103 | lu_tax_code_template_m13 | Legacy Review D |

Finally, this view joins disclosure_records with healthcare_providers, showing which provider was associated with each disclosure. Disclosure 195359 is linked to provider 100 (Primary Initiative A), and disclosure 4447022 is linked to provider 102 (Compact Cluster). This join completes the audit trail by connecting every data disclosure to the provider who was involved, ensuring full accountability for data sharing activities.

The healthcare record ecosystem described here demonstrates how patient care, financial processing, and regulatory compliance are interwoven through shared identifiers and consistent relationships. Each base table captures a distinct dimension of the encounter—clinical, financial, personnel, or regulatory—while the joined views provide the operational lenses through which practitioners can answer specific questions about their data. Whether tracking a denied claim back to its clinical origin, verifying that a disclosure was properly attributed to a credentialed provider, or confirming that a patient's consent status aligns with their record's access level, the structure of these records and views enables precise, auditable operations. The fictional entities in the data—National Geographic Kids, Ralph Waldo Emerson, Mary Alvarez, Peter Montgomery, and the providers and recipients that surround them—illustrate the patterns that real healthcare organizations must manage at scale. Consistency across these tables is not merely a technical concern; it is the foundation of trustworthy, compliant, and efficient healthcare delivery.