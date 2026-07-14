## Ontology-Grounded Relational Modelling in Healthcare Records

The healthcare records domain captures the lifecycle of a patient's clinical encounter: the patient registers, receives treatment from a provider, generates a bill, and may trigger a disclosure of their record. The relational schema materialises this domain by decomposing it into six base tables whose primary keys and foreign keys encode the cardinality-bounded relationships between entities. Each table stores a single concern—identity, service delivery, financial settlement, or audit trail—so that queries can reconstruct the full picture through joins. The following sections walk through the materialisation, showing how entity types become tables, how attributes become columns, and how views stitch the normalised facts back together.

### The Patient Record as the Central Anchor

The `patient_records` table sits at the centre of the schema, acting as the temporal anchor for every encounter. Its primary key, `record_id`, is a synthetic integer that uniquely identifies each clinical document. The column `patient_name` carries the human-readable identifier, while `date_of_service` timestamps the encounter. The `record_status` column constrains the lifecycle state to values such as `active`, `archived`, or `restricted`, and `access_level` governs visibility with values like `public`, `internal`, or `confidential`. Crucially, three foreign-key columns—`patient_id`, `billing_record_id`, and `treatment_event_id`—tie the record to the patient entity, the billing entity, and the treatment event entity respectively.

**Table `patient_records`**

| record_id | patient_name | date_of_service | record_status | access_level | patient_id | billing_record_id | treatment_event_id |
|---|---|---|---|---|---|---|---|
| 10449530 | National Geographic Kids | 2024-07-09T06:30:00 | active | public | 1 | 1 | 1 |
| 10445619 | Ralph Waldo Emerson | 2025-12-20T13:47:00 | archived | internal | 2 | 2 | 2 |
| 9568457 | Mary Alvarez | 2022-05-04T20:04:00 | restricted | confidential | 3 | 3 | 3 |
| 20743593 | Peter Montgomery | 2023-10-15T03:21:00 | active | public | 4 | 4 | 4 |

Consider the first row: record `10449530` for `National Geographic Kids` on `2024-07-09T06:30:00` is `active` and `public`, linked to patient `1`, billing record `1`, and treatment event `1`. The fourth row, record `20743593` for `Peter Montgomery`, is also `active` and `public`, but its service date is `2023-10-15T03:21:00`. The third row, `9568457` for `Mary Alvarez`, carries the `restricted` status and `confidential` access level, illustrating how the schema supports varying sensitivity tiers within the same table.

### The Patient Entity and Its Contact Preferences

The `patients` table stores the canonical patient identity separate from the clinical record. Its primary key `id` is a synthetic surrogate, while `patient_id` is the business identifier that appears as a foreign key in `patient_records`. The columns `preferred_contact_method` and `preferred_contact_location` capture communication preferences, with values such as `phone` paired with `home`, or `email` paired with `mobile`. The boolean `consent_status` records whether the patient has given consent. Foreign keys `record_id` and `treatment_event_id` link the patient back to their record and their treatment event, creating a bidirectional bridge.

**Table `patients`**

| id | patient_id | preferred_contact_method | preferred_contact_location | consent_status | record_id | treatment_event_id |
|---|---|---|---|---|---|---|
| 1 | 8387541 | phone | home | false | 10449530 | 1 |
| 2 | 10207142 | mail | work | true | 10445619 | 2 |
| 3 | 7119782 | email | mobile | false | 9568457 | 3 |
| 4 | gd_acc_160003 | phone | home | true | 20743593 | 4 |

Row `1` has `patient_id` `8387541`, prefers `phone` at `home`, has `consent_status` `false`, and links to record `10449530` and treatment event `1`. Row `4` carries the `patient_id` `gd_acc_160003`, prefers `phone` at `home`, has `consent_status` `true`, and links to record `20743593` and treatment event `4`. The mix of integer and string `patient_id` values reflects the schema's tolerance for heterogeneous identifier sources.

### Treatment Events as the Service Delivery Fact

The `treatment_events` table records the actual clinical service. Its primary key `id` is a synthetic integer, while `event_id` is the business identifier, which can be a long integer (`2002007020060`), a short integer (`168535`), a UUID (`ab8e1d18-8fcd-11eb-924d-9cd76263cbd0`), or a short string (`1186089`). The `event_date` timestamps the service, `service_code` encodes the procedure (values range from numeric codes like `20789856` to descriptive strings like `Total`), and `event_status` constrains the lifecycle to `scheduled`, `completed`, or `cancelled`. Foreign keys `patient_id`, `healthcare_provider_id`, and `billing_record_id` tie the event to the patient, the provider, and the bill.

**Table `treatment_events`**

| id | event_id | event_date | service_code | event_status | patient_id | healthcare_provider_id | billing_record_id |
|---|---|---|---|---|---|---|---|
| 1 | 2002007020060 | 2025-04-15T15:21:00 | 20789856 | scheduled | 1 | 100 | 1 |
| 2 | 168535 | 2022-09-26T22:38:00 | 3990167 | completed | 2 | 101 | 2 |
| 3 | ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 | 2023-02-10T05:55:00 | 14484998 | cancelled | 3 | 102 | 3 |
| 4 | 1186089 | 2024-07-21T12:12:00 | Total | scheduled | 4 | 103 | 4 |

The first event, `2002007020060`, occurred on `2025-04-15T15:21:00` with service code `20789856`, is `scheduled`, and links to patient `1`, provider `100`, and billing record `1`. The third event, identified by UUID `ab8e1d18-8fcd-11eb-924d-9cd76263cbd0`, is `cancelled` and links to patient `3`, provider `102`, and billing record `3`. The heterogeneity of `event_id` values demonstrates that the schema does not enforce a single identifier format.

### Healthcare Providers and Their Roles

The `healthcare_providers` table stores the personnel and organisations delivering care. Its primary key `id` is a synthetic integer, while `provider_id` is the business identifier, which can be a numeric string (`3717633`), a geospatial-style ID (`ChIJYRd8uPtt5kcRunQjrWb4IKs`), or a code (`lu_tax_code_template_m13`). The `provider_name` carries the human-readable name, `role` constrains the function to `physician`, `nurse`, `admin`, or `compliance`, and `access_permission` is a boolean governing data access. The foreign key `treatment_event_id` links the provider to the event they delivered, and `disclosure_record_disclosure_id` links to the disclosure audit.

**Table `healthcare_providers`**

| id | provider_id | provider_name | role | access_permission | treatment_event_id | disclosure_record_disclosure_id |
|---|---|---|---|---|---|---|
| 100 | 3717633 | Primary Initiative A | physician | false | 1 | 195359 |
| 101 | ChIJYRd8uPtt5kcRunQjrWb4IKs | Composite Model | nurse | true | 2 | 1250217 |
| 102 | 8928519 | Compact Cluster | admin | false | 3 | 4447022 |
| 103 | lu_tax_code_template_m13 | Legacy Review D | compliance | true | 4 | 1437596 |

Provider `100`, named `Primary Initiative A`, is a `physician` with `access_permission` `false`, linked to treatment event `1` and disclosure `195359`. Provider `101`, named `Composite Model`, is a `nurse` with `access_permission` `true`, linked to treatment event `2` and disclosure `1250217`. The role column thus partitions providers into clinical and non-clinical categories.

### Billing Records and Financial Settlement

The `billing_records` table captures the financial side of each encounter. Its primary key `id` is a synthetic integer, while `billing_id` is the business identifier, which can be numeric (`4985154`, `9568457`) or a UUID (`5f927026-8fcd-11eb-924d-9cd76263cbd0`). The `amount` column stores the monetary value (e.g., `13.49`, `25.47`), `payment_status` constrains the settlement state to `pending`, `paid`, or `denied`, and `billing_date` timestamps the invoice. Foreign keys `treatment_event_id` and `record_id` tie the bill to the clinical event and the patient record.

**Table `billing_records`**

| id | billing_id | amount | payment_status | billing_date | treatment_event_id | record_id |
|---|---|---|---|---|---|---|
| 1 | 4985154 | 13.49 | pending | 2025-08-24T07:09:00 | 1 | 10449530 |
| 2 | 9568457 | 25.47 | paid | 2022-01-08T14:26:00 | 2 | 10445619 |
| 3 | 8928508 | 19.72 | denied | 2023-06-19T21:43:00 | 3 | 9568457 |
| 4 | 5f927026-8fcd-11eb-924d-9cd76263cbd0 | 12.74 | pending | 2024-11-03T04:00:00 | 4 | 20743593 |

Billing record `1` has `billing_id` `4985154`, an amount of `13.49`, status `pending`, and billing date `2025-08-24T07:09:00`, linked to treatment event `1` and record `10449530`. Billing record `2` has `billing_id` `9568457`, an amount of `25.47`, status `paid`, and billing date `2022-01-08T14:26:00`, linked to treatment event `2` and record `10445619`. The `denied` status on record `3` illustrates the schema's support for rejected claims.

### Disclosure Records and Audit Trails

The `disclosure_records` table provides the audit trail for record access. Its primary key `disclosure_id` is a synthetic integer, while `disclosure_date` timestamps the disclosure event. The `purpose` column constrains the reason to `treatment`, `payment`, `healthcare_operations`, or `research`, and `recipient` identifies the receiving party (e.g., `legacy-recipien-73`, `compact-recipien-74`). Foreign keys `record_id` and `healthcare_provider_id` tie the disclosure to the patient record and the provider who accessed it.

**Table `disclosure_records`**

| disclosure_id | disclosure_date | purpose | recipient | record_id | healthcare_provider_id |
|---|---|---|---|---|---|
| 195359 | 2025-08-02T19:33:00 | treatment | legacy-recipien-73 | 10449530 | 100 |
| 1250217 | 2022-01-13T02:50:00 | payment | compact-recipien-74 | 10445619 | 101 |
| 4447022 | 2023-06-24T09:07:00 | healthcare_operations | composite-recipien-75 | 9568457 | 102 |
| 1437596 | 2024-11-08T16:24:00 | research | primary-recipien-76 | 20743593 | 103 |

Disclosure `195359` occurred on `2025-08-02T19:33:00` for `treatment` purposes, was sent to `legacy-recipien-73`, links to record `10449530` and provider `100`. Disclosure `1437596` occurred on `2024-11-08T16:24:00` for `research` purposes, was sent to `primary-recipien-76`, links to record `20743593` and provider `103`. The purpose column thus supports compliance reporting across multiple regulatory categories.

### Reconstructing Domain Facts Through Views

The views materialise the most common join patterns as virtual tables, each answering a specific domain question by combining two base tables.

#### The Patient–Record Bridge

The view `v_patient_record_patient` joins `patient_records` with `patients` on the patient identifier, answering the question: "Which patient is associated with each clinical record?" The joined result pairs `record_id` with `patient_id`, `preferred_contact_method`, and `consent_status`. Reading the first row, record `10449530` is linked to patient `8387541` who prefers `phone` at `home` and has `consent_status` `false`. The second row pairs record `10445619` with patient `10207142` who prefers `mail` at `work` and has `consent_status` `true`.

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

The view `v_patient_patient_record` performs the same join from the opposite direction, answering: "Which clinical record belongs to each patient?" It pairs `patients.id` with `patient_records.record_id`, `patient_name`, and `record_status`. The first row shows patient `1` with record `10449530` named `National Geographic Kids` in `active` status. The third row shows patient `3` with record `9568457` named `Mary Alvarez` in `restricted` status.

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

#### The Treatment–Patient Bridge

The view `v_patient_treatment_event` joins `patients` with `treatment_events`, answering: "Which treatment event is associated with each patient?" The result pairs `patients.id` with `treatment_events.event_id`, `event_date`, and `event_status`. The first row shows patient `1` with event `2002007020060` on `2025-04-15T15:21:00` in `scheduled` status. The third row shows patient `3` with event `ab8e1d18-8fcd-11eb-924d-9cd76263cbd0` on `2023-02-10T05:55:00` in `cancelled` status.

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

The view `v_treatment_event_patient` performs the same join from the opposite direction, answering: "Which patient received each treatment event?" It pairs `treatment_events.id` with `patients.patient_id`, `preferred_contact_method`, and `consent_status`. The first row shows treatment event `1` linked to patient `8387541` who prefers `phone` at `home`. The fourth row shows treatment event `4` linked to patient `gd_acc_160003` who prefers `phone` at `home` and has `consent_status` `true`.

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

#### The Treatment–Provider Bridge

The view `v_treatment_event_healthcare_provider` joins `treatment_events` with `healthcare_providers`, answering: "Which provider delivered each treatment event?" The result pairs `treatment_events.id` with `healthcare_providers.provider_id`, `provider_name`, and `role`. The first row shows treatment event `1` delivered by provider `3717633` named `Primary Initiative A` with role `physician`. The fourth row shows treatment event `4` delivered by provider `lu_tax_code_template_m13` named `Legacy Review D` with role `compliance`.

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

The view `v_healthcare_provider_treatment_event` performs the same join from the opposite direction, answering: "Which treatment events did each provider deliver?" It pairs `healthcare_providers.id` with `treatment_events.event_id`, `event_date`, and `event_status`. The first row shows provider `100` delivering event `2002007020060` on `2025-04-15T15:21:00` in `scheduled` status. The third row shows provider `102` delivering event `ab8e1d18-8fcd-11eb-924d-9cd76263cbd0` on `2023-02-10T05:55:00` in `cancelled` status.

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

#### The Treatment–Billing Bridge

The view `v_treatment_event_billing_record` joins `treatment_events` with `billing_records`, answering: "Which billing record corresponds to each treatment event?" The result pairs `treatment_events.id` with `billing_records.billing_id`, `amount`, and `payment_status`. The first row shows treatment event `1` linked to billing record with `billing_id` `4985154`, amount `13.49`, and status `pending`. The second row shows treatment event `2` linked to billing record with `billing_id` `9568457`, amount `25.47`, and status `paid`.

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

The view `v_billing_record_treatment_event` performs the same join from the opposite direction, answering: "Which treatment event generated each billing record?" It pairs `billing_records.id` with `treatment_events.event_id`, `event_date`, and `event_status`. The first row shows billing record `1` generated by event `2002007020060` on `2025-04-15T15:21:00` in `scheduled` status. The third row shows billing record `3` generated by event `ab8e1d18-8fcd-11eb-924d-9cd76263cbd0` on `2023-02-10T05:55:00` in `cancelled` status.

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

#### The Record–Billing Bridge

The view `v_patient_record_billing_record` joins `patient_records` with `billing_records`, answering: "Which billing record is associated with each patient record?" The result pairs `patient_records.record_id` with `billing_records.billing_id`, `amount`, and `payment_status`. The first row pairs record `10449530` with billing record `4985154`, amount `13.49`, status `pending`. The second row pairs record `10445619` with billing record `9568457`, amount `25.47`, status `paid`.

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

The view `v_billing_record_patient_record` performs the same join from the opposite direction, answering: "Which patient record does each billing record belong to?" It pairs `billing_records.id` with `patient_records.record_id`, `patient_name`, and `record_status`. The first row shows billing record `1` belonging to record `10449530` named `National Geographic Kids` in `active` status. The third row shows billing record `3` belonging to record `9568457` named `Mary Alvarez` in `restricted` status.

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

#### The Record–Treatment Bridge

The view `v_patient_record_treatment_event` joins `patient_records` with `treatment_events`, answering: "Which treatment event is associated with each patient record?" The result pairs `patient_records.record_id` with `treatment_events.event_id`, `event_date`, and `event_status`. The first row pairs record `10449530` with event `2002007020060` on `2025-04-15T15:21:00` in `scheduled` status. The third row pairs record `9568457` with event `ab8e1d18-8fcd-11eb-924d-9cd76263cbd0` on `2023-02-10T05:55:00` in `cancelled` status.

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

#### The Disclosure–Record Bridge

The view `v_disclosure_record_patient_record` joins `disclosure_records` with `patient_records`, answering: "Which patient record was disclosed in each audit entry?" The result pairs `disclosure_records.disclosure_id` with `patient_records.record_id`, `patient_name`, and `record_status`. The first row shows disclosure `195359` linked to record `10449530` named `National Geographic Kids` in `active` status. The fourth row shows disclosure `1437596` linked to record `20743593` named `Peter Montgomery` in `active` status.

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

#### The Disclosure–Provider Bridge

The view `v_disclosure_record_healthcare_provider` joins `disclosure_records` with `healthcare_providers`, answering: "Which provider accessed each disclosed record?" The result pairs `disclosure_records.disclosure_id` with `healthcare_providers.provider_id`, `provider_name`, and `role`. The first row shows disclosure `195359` involving provider `3717633` named `Primary Initiative A` with role `physician`. The fourth row shows disclosure `1437596` involving provider `lu_tax_code_template_m13` named `Legacy Review D` with role `compliance`.

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

### Synthesis

The schema decomposes the healthcare encounter into six normalised tables, each capturing a single concern: the clinical record, the patient identity, the treatment event, the provider, the billing, and the disclosure audit. Foreign keys encode the cardinality-bounded relationships—each record references one patient, one billing record, and one treatment event; each treatment event references one patient, one provider, and one billing record; each disclosure references one record and one provider. The fourteen views materialise the most common two-table join patterns, allowing analysts to reconstruct domain facts without writing explicit joins. The heterogeneity of identifier types (integers, UUIDs, strings) across `patient_id`, `event_id`, `billing_id`, and `provider_id` reflects a schema designed for integration with heterogeneous source systems. Together, the base tables and views provide a complete, queryable representation of the healthcare records domain.

## Data appendix

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
