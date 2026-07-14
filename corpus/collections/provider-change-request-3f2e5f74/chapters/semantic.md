## Normalized Modelling of the Provider Change Request Lifecycle

The provider change request domain captures the end-to-end workflow by which a client's assigned healthcare provider is reviewed, approved, or denied. At its core, a single business event—the submission of a change request—touches six distinct entity types: the request itself, the client who initiates it, the manager who adjudicates it, the provider role that defines the scope of the new assignment, the provider who is the subject of the change, and the clinic that anchors the entire arrangement. The relational schema models each of these as a base table, with foreign keys radiating from the central `provider_change_requests` table to the five supporting entities. This chapter walks through the materialization of that ontology into columns, keys, and junction views, grounding every structural claim in the actual rows that populate the system.

**Table `provider_change_requests`**

| provider_change_request_id | request_id | client_mh_number | client_name | guardian_name | contact_phone | request_date | reason_for_change | status | client_id | manager_id | provider_role_id | provider_id |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 2087732 | Walter Pratt | Mercy Helpline | Composite Model | Joe Tsai | 2025-12-24T23:45:00 | distributed-reason-30 | submitted | 1000 | 1 | 1 | 1 |
| 2 | 575213 | Moon Gun | Tasha Rodriguez | Compact Cluster A | Stephanie Collins | 2022-05-08T06:02:00 | baseline-reason-31 | under_review | 1001 | 2 | 2 | 2 |
| 3 | 103167 | Kimberly Maynard | Glen Taylor | Legacy Review | Tasha Rodriguez | 2023-10-19T13:19:00 | pilot-reason-32 | approved | 1002 | 3 | 3 | 3 |
| 4 | 611510 | Daniel Abbott | Nicole Andrews | Regional Initiative | Walter Pratt | 2024-03-03T20:36:00 | extended-reason-33 | denied | 1003 | 4 | 4 | 4 |

The `provider_change_requests` table is the fact table of the domain. Its primary key, `provider_change_request_id`, is a surrogate integer that sequences submissions; the business-visible `request_id` (for example, `2087732` or `575213`) is the human-facing identifier. The table embeds denormalized snapshot columns—`client_name`, `guardian_name`, `contact_phone`, and `request_date`—that preserve the state of the request at submission time, while the true relational links to the five supporting entities live in the foreign-key columns `client_id`, `manager_id`, `provider_role_id`, and `provider_id`. The `status` column drives the workflow through four discrete states: `submitted`, `under_review`, `approved`, and `denied`. Row 1, for instance, records a `submitted` request (`request_id` 2087732) for client Walter Pratt, reviewed by manager 1, under provider role 1, involving provider 1. Row 4 shows a `denied` request (`request_id` 611510) for Daniel Abbott, adjudicated by manager 4, under provider role 4, involving provider 4.

**Table `clients`**

| client_id | mh_number | full_name | is_minor | primary_contact_phone | assigned_clinic | provider_change_request_id | clinic_id |
|---|---|---|---|---|---|---|---|
| 1000 | MH-2064 | Theodore Mcgrath | true | Pensacola Regional Airport | baseline-assigned-91 | 1 | 1 |
| 1001 | MH-2069 | Account Name | false | Michelle Kelley | pilot-assigned-92 | 2 | 2 |
| 1002 | MH-2074 | Saipan International Airport | true | Janice Johnston | extended-assigned-93 | 3 | 3 |
| 1003 | MH-2079 | Norma Fisher | false | Alice Alvarez | integrated-assigned-94 | 4 | 4 |

The `clients` table stores the persistent identity of each person seeking a provider change. Its primary key `client_id` (values `1000` through `1003`) is a surrogate; the business key is `mh_number` (e.g., `MH-2064`). The `full_name` column carries the client's legal name, `is_minor` is a boolean flag distinguishing adult from minor clients, and `primary_contact_phone` holds the contact number. The `assigned_clinic` column is a free-text label (such as `baseline-assigned-91`) that records the clinic at the time of the request, while the structural foreign key `clinic_id` links the client to the `clinics` table. The `provider_change_request_id` column creates a many-to-one link back to the request that triggered the change. Client 1000, Theodore Mcgrath, is a minor (`is_minor = true`) assigned to clinic 1; client 1001, Account Name, is an adult (`is_minor = false`) assigned to clinic 2.

**Table `managers`**

| id | manager_id | printed_name | signature | review_date | decision_text | notification_date | provider_change_request_id | clinic_id |
|---|---|---|---|---|---|---|---|---|
| 1 | id_23 | Dana Nguyen | integrated-signatur-46 | 2024-11-03T22:54:00 | pilot-decision-86 | 2024-11-11T22:06:00 | 1 | 1 |
| 2 | 10449531 | Christopher Benson | seasonal-signatur-47 | 2025-04-14T05:11:00 | extended-decision-87 | 2025-04-22T05:23:00 | 2 | 2 |
| 3 | 659 | Michelle Kelley | regional-signatur-48 | 2022-09-25T12:28:00 | integrated-decision-88 | 2022-09-06T12:40:00 | 3 | 3 |
| 4 | f208f470-8fcd-11eb-924d-9cd76263cbd0 | Tasha Rodriguez | legacy-signatur-49 | 2023-02-09T19:45:00 | seasonal-decision-89 | 2023-02-17T19:57:00 | 4 | 4 |

Managers are the adjudicators in the change-request workflow. The table's primary key `id` is a surrogate, while `manager_id` (e.g., `id_23`, `10449531`, `659`, or the UUID `f208f470-8fcd-11eb-924d-9cd76263cbd0`) serves as the business identifier. The `printed_name` column holds the human-readable name (Dana Nguyen, Christopher Benson, Michelle Kelley, Tasha Rodriguez), and `signature` is a coded label (such as `integrated-signatur-46`) used for audit trails. The workflow timeline is captured in three timestamp columns: `review_date` marks when the manager examined the request, `notification_date` records when the decision was communicated, and `decision_text` stores the outcome code (e.g., `pilot-decision-86`, `extended-decision-87`). The foreign keys `provider_change_request_id` and `clinic_id` tie the manager's action to the specific request and the clinic under review. Manager 1 (Dana Nguyen) reviewed request 1 on 2024-11-03 and notified on 2024-11-11; manager 4 (Tasha Rodriguez) reviewed request 4 on 2023-02-09.

**Table `provider_roles`**

| provider_role_id | role_code | role_name | is_clinical | provider_change_request_id | created_at |
|---|---|---|---|---|---|
| 1 | 6969430 | Seasonal Programme | false | 1 | 2025-01-01 00:14:00 |
| 2 | lu_tax_code_template_m16 | Integrated Standard | true | 2 | 2025-02-06 03:14:00 |
| 3 | 3158154 | Extended Framework D | false | 3 | 2025-03-11 06:14:00 |
| 4 | 39800616 | Pilot Protocol | true | 4 | 2025-04-16 09:14:00 |

Provider roles define the categories of care or service that a change request may involve. The primary key `provider_role_id` is a surrogate integer, while `role_code` (e.g., `6969430`, `lu_tax_code_template_m16`) and `role_name` (e.g., `Seasonal Programme`, `Integrated Standard`) provide the business-readable identifiers. The `is_clinical` boolean distinguishes clinical roles (`true` for `Integrated Standard` and `Pilot Protocol`) from non-clinical ones (`false` for `Seasonal Programme` and `Extended Framework D`). The `created_at` timestamp records when the role was instantiated, and the foreign key `provider_change_request_id` links the role to the request it serves. Role 1 (`Seasonal Programme`, non-clinical) is associated with request 1; role 4 (`Pilot Protocol`, clinical) with request 4.

**Table `providers`**

| id | provider_id | provider_name | provider_type | provider_change_request_id | clinic_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|
| 1 | 3717633 | Primary Initiative A | seasonal-provider-41 | 1 | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | ChIJYRd8uPtt5kcRunQjrWb4IKs | Composite Model | regional-provider-42 | 2 | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | 8928519 | Compact Cluster | legacy-provider-43 | 3 | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | lu_tax_code_template_m13 | Legacy Review D | compact-provider-44 | 4 | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The `providers` table holds the entities—individuals or organizations—that deliver care. Its primary key `id` is a surrogate, while `provider_id` (e.g., `3717633`, the UUID `ChIJYRd8uPtt5kcRunQjrWb4IKs`) is the business identifier. The `provider_name` column carries the display name (Primary Initiative A, Composite Model, Compact Cluster, Legacy Review D), and `provider_type` is a coded label (such as `seasonal-provider-41` or `compact-provider-44`). The `created_at` and `updated_at` timestamps track the provider's lifecycle, while the foreign keys `provider_change_request_id` and `clinic_id` link the provider to the active request and the clinic where it operates. Provider 1 (Primary Initiative A, type `seasonal-provider-41`) is linked to request 1 and clinic 1; provider 4 (Legacy Review D, type `compact-provider-44`) to request 4 and clinic 4.

**Table `clinics`**

| id | clinic_code | clinic_name | location_code | manager_id | provider_id | client_id |
|---|---|---|---|---|---|---|
| 1 | d87f6fa90b894eb8be0b031dcc4d667a | Distributed Standard | 9736909 | 1 | 1 | 1000 |
| 2 | 4447007 | Adaptive Framework D | 9125640 | 2 | 2 | 1001 |
| 3 | 9085247 | Primary Protocol | 1450633 | 3 | 3 | 1002 |
| 4 | id_10 | Composite Programme | 21005921 | 4 | 4 | 1003 |

Clinics are the organizational anchors of the domain. The primary key `id` is a surrogate, while `clinic_code` (e.g., `d87f6fa90b894eb8be0b031dcc4d667a`, `4447007`) and `clinic_name` (Distributed Standard, Adaptive Framework D, Primary Protocol, Composite Programme) provide the business identifiers. The `location_code` column (e.g., `9736909`, `9125640`) encodes the geographic or administrative location. The clinic table carries three foreign keys: `manager_id` links the overseeing manager, `provider_id` links the assigned provider, and `client_id` links the assigned client. Clinic 1 (Distributed Standard, location `9736909`) is overseen by manager 1, staffed by provider 1, and serves client 1000; clinic 4 (Composite Programme, location `21005921`) by manager 4, provider 4, and client 1003.

### One-to-Many Projections from the Request Fact

Each of the first four views materializes a one-to-many projection from `provider_change_requests` outward to a single supporting entity. These views answer the question: "For each change request, what is the associated [entity]?"

**View `v_provider_change_request_client`**

```sql
CREATE VIEW v_provider_change_request_client AS
SELECT a.provider_change_request_id, a.request_id, a.client_mh_number, a.client_name, b.client_id AS client_client_id, b.mh_number AS client_mh_number, b.full_name AS client_full_name
FROM provider_change_requests a JOIN clients b ON a.client_id = b.client_id;
```

| provider_change_request_id | request_id | client_mh_number | client_name | client_client_id | client_mh_number | client_full_name |
|---|---|---|---|---|---|---|
| 1 | 2087732 | Walter Pratt | Mercy Helpline | 1000 | MH-2064 | Theodore Mcgrath |
| 2 | 575213 | Moon Gun | Tasha Rodriguez | 1001 | MH-2069 | Account Name |
| 3 | 103167 | Kimberly Maynard | Glen Taylor | 1002 | MH-2074 | Saipan International Airport |
| 4 | 611510 | Daniel Abbott | Nicole Andrews | 1003 | MH-2079 | Norma Fisher |

The view `v_provider_change_request_client` joins `provider_change_requests` to `clients` on `client_id`, producing a denormalized row per request that carries both the request metadata and the client's full identity. Row 1 of the join shows request 2087732 for client Theodore Mcgrath (`MH-2064`), a minor (`is_minor = true`) at clinic 1. Row 3 shows request 103167 for client Saipan International Airport (`MH-2074`), also a minor, at clinic 3.

**View `v_provider_change_request_manager`**

```sql
CREATE VIEW v_provider_change_request_manager AS
SELECT a.provider_change_request_id, a.request_id, a.client_mh_number, a.client_name, b.id AS manager_id, b.manager_id AS manager_manager_id, b.printed_name AS manager_printed_name
FROM provider_change_requests a JOIN managers b ON a.manager_id = b.id;
```

| provider_change_request_id | request_id | client_mh_number | client_name | manager_id | manager_manager_id | manager_printed_name |
|---|---|---|---|---|---|---|
| 1 | 2087732 | Walter Pratt | Mercy Helpline | 1 | id_23 | Dana Nguyen |
| 2 | 575213 | Moon Gun | Tasha Rodriguez | 2 | 10449531 | Christopher Benson |
| 3 | 103167 | Kimberly Maynard | Glen Taylor | 3 | 659 | Michelle Kelley |
| 4 | 611510 | Daniel Abbott | Nicole Andrews | 4 | f208f470-8fcd-11eb-924d-9cd76263cbd0 | Tasha Rodriguez |

The view `v_provider_change_request_manager` joins `provider_change_requests` to `managers` on `manager_id`, attaching the adjudicator's name, signature code, and decision timeline to each request. Row 1 pairs request 2087732 with manager Dana Nguyen (`id_23`), who reviewed on 2024-11-03 and notified on 2024-11-11 with decision `pilot-decision-86`. Row 4 pairs request 611510 with manager Tasha Rodriguez (`f208f470-8fcd-11eb-924d-9cd76263cbd0`), who reviewed on 2023-02-09 and notified on 2023-02-17 with decision `seasonal-decision-89`.

**View `v_provider_change_request_provider_role`**

```sql
CREATE VIEW v_provider_change_request_provider_role AS
SELECT a.provider_change_request_id, a.request_id, a.client_mh_number, a.client_name, b.provider_role_id AS role_provider_role_id, b.role_code AS role_role_code, b.role_name AS role_role_name
FROM provider_change_requests a JOIN provider_roles b ON a.provider_role_id = b.provider_role_id;
```

| provider_change_request_id | request_id | client_mh_number | client_name | role_provider_role_id | role_role_code | role_role_name |
|---|---|---|---|---|---|---|
| 1 | 2087732 | Walter Pratt | Mercy Helpline | 1 | 6969430 | Seasonal Programme |
| 2 | 575213 | Moon Gun | Tasha Rodriguez | 2 | lu_tax_code_template_m16 | Integrated Standard |
| 3 | 103167 | Kimberly Maynard | Glen Taylor | 3 | 3158154 | Extended Framework D |
| 4 | 611510 | Daniel Abbott | Nicole Andrews | 4 | 39800616 | Pilot Protocol |

The view `v_provider_change_request_provider_role` joins `provider_change_requests` to `provider_roles` on `provider_role_id`, attaching the role's code, name, and clinical flag. Row 1 shows request 2087732 under role `Seasonal Programme` (`6969430`), which is non-clinical (`is_clinical = false`). Row 2 shows request 575213 under role `Integrated Standard` (`lu_tax_code_template_m16`), which is clinical (`is_clinical = true`).

**View `v_provider_change_request_provider`**

```sql
CREATE VIEW v_provider_change_request_provider AS
SELECT a.provider_change_request_id, a.request_id, a.client_mh_number, a.client_name, b.id AS provider_id, b.provider_id AS provider_provider_id, b.provider_name AS provider_provider_name
FROM provider_change_requests a JOIN providers b ON a.provider_id = b.id;
```

| provider_change_request_id | request_id | client_mh_number | client_name | provider_id | provider_provider_id | provider_provider_name |
|---|---|---|---|---|---|---|
| 1 | 2087732 | Walter Pratt | Mercy Helpline | 1 | 3717633 | Primary Initiative A |
| 2 | 575213 | Moon Gun | Tasha Rodriguez | 2 | ChIJYRd8uPtt5kcRunQjrWb4IKs | Composite Model |
| 3 | 103167 | Kimberly Maynard | Glen Taylor | 3 | 8928519 | Compact Cluster |
| 4 | 611510 | Daniel Abbott | Nicole Andrews | 4 | lu_tax_code_template_m13 | Legacy Review D |

The view `v_provider_change_request_provider` joins `provider_change_requests` to `providers` on `provider_id`, attaching the provider's name, type, and timestamps. Row 1 shows request 2087732 involving provider Primary Initiative A (`3717633`), type `seasonal-provider-41`, created on 2025-01-01 and updated on 2025-01-02. Row 3 shows request 103167 involving provider Compact Cluster (`8928519`), type `legacy-provider-43`, created on 2025-03-11 and updated on 2025-03-16.

### Reverse Projections from Supporting Entities

The next four views invert the join direction, projecting from each supporting entity back to the request. These answer: "Which change request is associated with this [entity]?"

**View `v_client_provider_change_request`**

```sql
CREATE VIEW v_client_provider_change_request AS
SELECT a.client_id, a.mh_number, a.full_name, a.is_minor, b.provider_change_request_id AS request_provider_change_request_id, b.request_id AS request_request_id, b.client_mh_number AS request_client_mh_number
FROM clients a JOIN provider_change_requests b ON a.provider_change_request_id = b.provider_change_request_id;
```

| client_id | mh_number | full_name | is_minor | request_provider_change_request_id | request_request_id | request_client_mh_number |
|---|---|---|---|---|---|---|
| 1000 | MH-2064 | Theodore Mcgrath | true | 1 | 2087732 | Walter Pratt |
| 1001 | MH-2069 | Account Name | false | 2 | 575213 | Moon Gun |
| 1002 | MH-2074 | Saipan International Airport | true | 3 | 103167 | Kimberly Maynard |
| 1003 | MH-2079 | Norma Fisher | false | 4 | 611510 | Daniel Abbott |

The view `v_client_provider_change_request` joins `clients` to `provider_change_requests` on `client_id`, producing a row per client that carries the full request context. Client 1000 (Theodore Mcgrath, `MH-2064`) is linked to request 2087732, status `submitted`, with reason `distributed-reason-30`. Client 1003 (Norma Fisher, `MH-2079`) is linked to request 611510, status `denied`, with reason `extended-reason-33`.

**View `v_manager_provider_change_request`**

```sql
CREATE VIEW v_manager_provider_change_request AS
SELECT a.id, a.manager_id, a.printed_name, a.signature, b.provider_change_request_id AS request_provider_change_request_id, b.request_id AS request_request_id, b.client_mh_number AS request_client_mh_number
FROM managers a JOIN provider_change_requests b ON a.provider_change_request_id = b.provider_change_request_id;
```

| id | manager_id | printed_name | signature | request_provider_change_request_id | request_request_id | request_client_mh_number |
|---|---|---|---|---|---|---|
| 1 | id_23 | Dana Nguyen | integrated-signatur-46 | 1 | 2087732 | Walter Pratt |
| 2 | 10449531 | Christopher Benson | seasonal-signatur-47 | 2 | 575213 | Moon Gun |
| 3 | 659 | Michelle Kelley | regional-signatur-48 | 3 | 103167 | Kimberly Maynard |
| 4 | f208f470-8fcd-11eb-924d-9cd76263cbd0 | Tasha Rodriguez | legacy-signatur-49 | 4 | 611510 | Daniel Abbott |

The view `v_manager_provider_change_request` joins `managers` to `provider_change_requests` on `manager_id`, attaching the request's status and reason to the manager's record. Manager Dana Nguyen (`id_23`) is linked to request 2087732, status `submitted`, reason `distributed-reason-30`. Manager Tasha Rodriguez (`f208f470-8fcd-11eb-924d-9cd76263cbd0`) is linked to request 611510, status `denied`, reason `extended-reason-33`.

**View `v_provider_role_provider_change_request`**

```sql
CREATE VIEW v_provider_role_provider_change_request AS
SELECT a.provider_role_id, a.role_code, a.role_name, a.is_clinical, b.provider_change_request_id AS request_provider_change_request_id, b.request_id AS request_request_id, b.client_mh_number AS request_client_mh_number
FROM provider_roles a JOIN provider_change_requests b ON a.provider_change_request_id = b.provider_change_request_id;
```

| provider_role_id | role_code | role_name | is_clinical | request_provider_change_request_id | request_request_id | request_client_mh_number |
|---|---|---|---|---|---|---|
| 1 | 6969430 | Seasonal Programme | false | 1 | 2087732 | Walter Pratt |
| 2 | lu_tax_code_template_m16 | Integrated Standard | true | 2 | 575213 | Moon Gun |
| 3 | 3158154 | Extended Framework D | false | 3 | 103167 | Kimberly Maynard |
| 4 | 39800616 | Pilot Protocol | true | 4 | 611510 | Daniel Abbott |

The view `v_provider_role_provider_change_request` joins `provider_roles` to `provider_change_requests` on `provider_role_id`, attaching the request's status and client information to the role. Role `Seasonal Programme` (`6969430`, non-clinical) is linked to request 2087732, status `submitted`. Role `Pilot Protocol` (`39800616`, clinical) is linked to request 611510, status `denied`.

**View `v_provider_provider_change_request`**

```sql
CREATE VIEW v_provider_provider_change_request AS
SELECT a.id, a.provider_id, a.provider_name, a.provider_type, b.provider_change_request_id AS request_provider_change_request_id, b.request_id AS request_request_id, b.client_mh_number AS request_client_mh_number
FROM providers a JOIN provider_change_requests b ON a.provider_change_request_id = b.provider_change_request_id;
```

| id | provider_id | provider_name | provider_type | request_provider_change_request_id | request_request_id | request_client_mh_number |
|---|---|---|---|---|---|---|
| 1 | 3717633 | Primary Initiative A | seasonal-provider-41 | 1 | 2087732 | Walter Pratt |
| 2 | ChIJYRd8uPtt5kcRunQjrWb4IKs | Composite Model | regional-provider-42 | 2 | 575213 | Moon Gun |
| 3 | 8928519 | Compact Cluster | legacy-provider-43 | 3 | 103167 | Kimberly Maynard |
| 4 | lu_tax_code_template_m13 | Legacy Review D | compact-provider-44 | 4 | 611510 | Daniel Abbott |

The view `v_provider_provider_change_request` joins `providers` to `provider_change_requests` on `provider_id`, attaching the request's status and client information to the provider. Provider Primary Initiative A (`3717633`, type `seasonal-provider-41`) is linked to request 2087732, status `submitted`. Provider Legacy Review D (`lu_tax_code_template_m13`, type `compact-provider-44`) is linked to request 611510, status `denied`.

### Clinic-Centric Junction Views

The clinic table sits at the intersection of all other entities. The four clinic-centric views each answer a different question by joining `clinics` to one of the other base tables.

**View `v_client_clinic`**

```sql
CREATE VIEW v_client_clinic AS
SELECT a.client_id, a.mh_number, a.full_name, a.is_minor, b.id AS clinic_id, b.clinic_code AS clinic_clinic_code, b.clinic_name AS clinic_clinic_name
FROM clients a JOIN clinics b ON a.clinic_id = b.id;
```

| client_id | mh_number | full_name | is_minor | clinic_id | clinic_clinic_code | clinic_clinic_name |
|---|---|---|---|---|---|---|
| 1000 | MH-2064 | Theodore Mcgrath | true | 1 | d87f6fa90b894eb8be0b031dcc4d667a | Distributed Standard |
| 1001 | MH-2069 | Account Name | false | 2 | 4447007 | Adaptive Framework D |
| 1002 | MH-2074 | Saipan International Airport | true | 3 | 9085247 | Primary Protocol |
| 1003 | MH-2079 | Norma Fisher | false | 4 | id_10 | Composite Programme |

The view `v_client_clinic` joins `clients` to `clinics` on `clinic_id`, answering "Which clinic serves this client?" Client 1000 (Theodore Mcgrath) is served by clinic Distributed Standard (`d87f6fa90b894eb8be0b031dcc4d667a`), location `9736909`. Client 1003 (Norma Fisher) is served by clinic Composite Programme (`id_10`), location `21005921`.

**View `v_manager_clinic`**

```sql
CREATE VIEW v_manager_clinic AS
SELECT a.id, a.manager_id, a.printed_name, a.signature, b.id AS clinic_id, b.clinic_code AS clinic_clinic_code, b.clinic_name AS clinic_clinic_name
FROM managers a JOIN clinics b ON a.clinic_id = b.id;
```

| id | manager_id | printed_name | signature | clinic_id | clinic_clinic_code | clinic_clinic_name |
|---|---|---|---|---|---|---|
| 1 | id_23 | Dana Nguyen | integrated-signatur-46 | 1 | d87f6fa90b894eb8be0b031dcc4d667a | Distributed Standard |
| 2 | 10449531 | Christopher Benson | seasonal-signatur-47 | 2 | 4447007 | Adaptive Framework D |
| 3 | 659 | Michelle Kelley | regional-signatur-48 | 3 | 9085247 | Primary Protocol |
| 4 | f208f470-8fcd-11eb-924d-9cd76263cbd0 | Tasha Rodriguez | legacy-signatur-49 | 4 | id_10 | Composite Programme |

The view `v_manager_clinic` joins `managers` to `clinics` on `clinic_id`, answering "Which clinic does this manager oversee?" Manager Dana Nguyen (`id_23`) oversees clinic Distributed Standard (`d87f6fa90b894eb8be0b031dcc4d667a`). Manager Tasha Rodriguez (`f208f470-8fcd-11eb-924d-9cd76263cbd0`) oversees clinic Composite Programme (`id_10`).

**View `v_provider_clinic`**

```sql
CREATE VIEW v_provider_clinic AS
SELECT a.id, a.provider_id, a.provider_name, a.provider_type, b.id AS clinic_id, b.clinic_code AS clinic_clinic_code, b.clinic_name AS clinic_clinic_name
FROM providers a JOIN clinics b ON a.clinic_id = b.id;
```

| id | provider_id | provider_name | provider_type | clinic_id | clinic_clinic_code | clinic_clinic_name |
|---|---|---|---|---|---|---|
| 1 | 3717633 | Primary Initiative A | seasonal-provider-41 | 1 | d87f6fa90b894eb8be0b031dcc4d667a | Distributed Standard |
| 2 | ChIJYRd8uPtt5kcRunQjrWb4IKs | Composite Model | regional-provider-42 | 2 | 4447007 | Adaptive Framework D |
| 3 | 8928519 | Compact Cluster | legacy-provider-43 | 3 | 9085247 | Primary Protocol |
| 4 | lu_tax_code_template_m13 | Legacy Review D | compact-provider-44 | 4 | id_10 | Composite Programme |

The view `v_provider_clinic` joins `providers` to `clinics` on `clinic_id`, answering "Which clinic employs this provider?" Provider Primary Initiative A (`3717633`) is assigned to clinic Distributed Standard (`d87f6fa90b894eb8be0b031dcc4d667a`). Provider Legacy Review D (`lu_tax_code_template_m13`) is assigned to clinic Composite Programme (`id_10`).

**View `v_clinic_client`**

```sql
CREATE VIEW v_clinic_client AS
SELECT a.id, a.clinic_code, a.clinic_name, a.location_code, b.client_id AS client_client_id, b.mh_number AS client_mh_number, b.full_name AS client_full_name
FROM clinics a JOIN clients b ON a.client_id = b.client_id;
```

| id | clinic_code | clinic_name | location_code | client_client_id | client_mh_number | client_full_name |
|---|---|---|---|---|---|---|
| 1 | d87f6fa90b894eb8be0b031dcc4d667a | Distributed Standard | 9736909 | 1000 | MH-2064 | Theodore Mcgrath |
| 2 | 4447007 | Adaptive Framework D | 9125640 | 1001 | MH-2069 | Account Name |
| 3 | 9085247 | Primary Protocol | 1450633 | 1002 | MH-2074 | Saipan International Airport |
| 4 | id_10 | Composite Programme | 21005921 | 1003 | MH-2079 | Norma Fisher |

The view `v_clinic_client` joins `clinics` to `clients` on `client_id`, answering "Which client is assigned to this clinic?" Clinic Distributed Standard (`d87f6fa90b894eb8be0b031dcc4d667a`) serves client Theodore Mcgrath (`MH-2064`), a minor. Clinic Composite Programme (`id_10`) serves client Norma Fisher (`MH-2079`), an adult.

### Cross-Entity Synthesis Views

The final three views join pairs of supporting entities (excluding the request fact table) to answer questions about the relationships between the domain's organizational and operational entities.

**View `v_clinic_manager`**

```sql
CREATE VIEW v_clinic_manager AS
SELECT a.id, a.clinic_code, a.clinic_name, a.location_code, b.id AS manager_id, b.manager_id AS manager_manager_id, b.printed_name AS manager_printed_name
FROM clinics a JOIN managers b ON a.manager_id = b.id;
```

| id | clinic_code | clinic_name | location_code | manager_id | manager_manager_id | manager_printed_name |
|---|---|---|---|---|---|---|
| 1 | d87f6fa90b894eb8be0b031dcc4d667a | Distributed Standard | 9736909 | 1 | id_23 | Dana Nguyen |
| 2 | 4447007 | Adaptive Framework D | 9125640 | 2 | 10449531 | Christopher Benson |
| 3 | 9085247 | Primary Protocol | 1450633 | 3 | 659 | Michelle Kelley |
| 4 | id_10 | Composite Programme | 21005921 | 4 | f208f470-8fcd-11eb-924d-9cd76263cbd0 | Tasha Rodriguez |

The view `v_clinic_manager` joins `clinics` to `managers` on `manager_id`, answering "Which manager oversees this clinic?" Clinic Distributed Standard (`d87f6fa90b894eb8be0b031dcc4d667a`) is overseen by manager Dana Nguyen (`id_23`), who reviewed request 1 on 2024-11-03. Clinic Composite Programme (`id_10`) is overseen by manager Tasha Rodriguez (`f208f470-8fcd-11eb-924d-9cd76263cbd0`), who reviewed request 4 on 2023-02-09.

**View `v_clinic_provider`**

```sql
CREATE VIEW v_clinic_provider AS
SELECT a.id, a.clinic_code, a.clinic_name, a.location_code, b.id AS provider_id, b.provider_id AS provider_provider_id, b.provider_name AS provider_provider_name
FROM clinics a JOIN providers b ON a.provider_id = b.id;
```

| id | clinic_code | clinic_name | location_code | provider_id | provider_provider_id | provider_provider_name |
|---|---|---|---|---|---|---|
| 1 | d87f6fa90b894eb8be0b031dcc4d667a | Distributed Standard | 9736909 | 1 | 3717633 | Primary Initiative A |
| 2 | 4447007 | Adaptive Framework D | 9125640 | 2 | ChIJYRd8uPtt5kcRunQjrWb4IKs | Composite Model |
| 3 | 9085247 | Primary Protocol | 1450633 | 3 | 8928519 | Compact Cluster |
| 4 | id_10 | Composite Programme | 21005921 | 4 | lu_tax_code_template_m13 | Legacy Review D |

The view `v_clinic_provider` joins `clinics` to `providers` on `provider_id`, answering "Which provider is assigned to this clinic?" Clinic Distributed Standard (`d87f6fa90b894eb8be0b031dcc4d667a`) is staffed by provider Primary Initiative A (`3717633`), type `seasonal-provider-41`. Clinic Composite Programme (`id_10`) is staffed by provider Legacy Review D (`lu_tax_code_template_m13`), type `compact-provider-44`.



The view `v_clinic_client` joins `clinics` to `clients` on `client_id`, answering "Which client is assigned to this clinic?" Clinic Distributed Standard (`d87f6fa90b894eb8be0b031dcc4d667a`) serves client Theodore Mcgrath (`MH-2064`), a minor with contact at Pensacola Regional Airport. Clinic Composite Programme (`id_10`) serves client Norma Fisher (`MH-2079`), an adult with contact Alice Alvarez.

### Synthesis

The schema models the provider change request domain as a star-like structure with `provider_change_requests` at the center, radiating foreign keys to `clients`, `managers`, `provider_roles`, `providers`, and `clinics`. The clinic table itself carries three foreign keys, making it a secondary hub that connects managers, providers, and clients in a triad of organizational relationships. The fourteen views materialize every pairwise join between the request fact and its five supporting entities, plus every pairwise join among the supporting entities themselves, ensuring that any domain question—whether about a request's client, a manager's clinic, or a provider's role—can be answered by a single view lookup rather than a multi-table join. The design preserves normalization at the base-table level while offering denormalized convenience through the view layer, a pattern that balances storage efficiency with query simplicity in a workflow-driven domain.