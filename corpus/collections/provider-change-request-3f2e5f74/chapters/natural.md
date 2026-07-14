## The Provider Change Request Lifecycle

Healthcare organizations that coordinate mental health services across multiple clinics must maintain rigorous oversight when a client's assigned provider changes. The provider change request system captures every stage of this transition—from initial submission through managerial review to final approval or denial. Each request ties together a client, a guardian, a reviewing manager, a provider role, an incoming provider, and the clinic where services are delivered. The records below form the backbone of this workflow, and the analytical views synthesize them into actionable reports for administrators, case managers, and compliance officers.

**Table `provider_change_requests`**

| provider_change_request_id | request_id | client_mh_number | client_name | guardian_name | contact_phone | request_date | reason_for_change | status | client_id | manager_id | provider_role_id | provider_id |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 2087732 | Walter Pratt | Mercy Helpline | Composite Model | Joe Tsai | 2025-12-24T23:45:00 | distributed-reason-30 | submitted | 1000 | 1 | 1 | 1 |
| 2 | 575213 | Moon Gun | Tasha Rodriguez | Compact Cluster A | Stephanie Collins | 2022-05-08T06:02:00 | baseline-reason-31 | under_review | 1001 | 2 | 2 | 2 |
| 3 | 103167 | Kimberly Maynard | Glen Taylor | Legacy Review | Tasha Rodriguez | 2023-10-19T13:19:00 | pilot-reason-32 | approved | 1002 | 3 | 3 | 3 |
| 4 | 611510 | Daniel Abbott | Nicole Andrews | Regional Initiative | Walter Pratt | 2024-03-03T20:36:00 | extended-reason-33 | denied | 1003 | 4 | 4 | 4 |

A provider change request is the central event in the system. The `provider_change_request_id` serves as the primary key, while the `request_id` provides an external tracking number—for example, request 2087732 corresponds to client Walter Pratt, whose guardian is Mercy Helpline. The `client_mh_number` and `client_name` fields identify the service recipient, and `guardian_name` captures the responsible party. Contact information is stored in `contact_phone`, and `request_date` timestamps the submission. The `reason_for_change` column encodes the justification category, such as `distributed-reason-30` or `baseline-reason-31`. The `status` field tracks the lifecycle stage: `submitted`, `under_review`, `approved`, or `denied`. Foreign keys `client_id`, `manager_id`, `provider_role_id`, and `provider_id` link the request to the relevant entities in the system.

**Table `clients`**

| client_id | mh_number | full_name | is_minor | primary_contact_phone | assigned_clinic | provider_change_request_id | clinic_id |
|---|---|---|---|---|---|---|---|
| 1000 | MH-2064 | Theodore Mcgrath | true | Pensacola Regional Airport | baseline-assigned-91 | 1 | 1 |
| 1001 | MH-2069 | Account Name | false | Michelle Kelley | pilot-assigned-92 | 2 | 2 |
| 1002 | MH-2074 | Saipan International Airport | true | Janice Johnston | extended-assigned-93 | 3 | 3 |
| 1003 | MH-2079 | Norma Fisher | false | Alice Alvarez | integrated-assigned-94 | 4 | 4 |

Clients are the individuals receiving mental health services. The `client_id` uniquely identifies each person, while `mh_number` provides a medical health identifier such as MH-2064 for Theodore Mcgrath. The `full_name` field stores the client's legal name, and `is_minor` indicates whether the client is under the age of majority—a boolean flag that determines whether a guardian's consent is required. The `primary_contact_phone` field holds the client's main phone number, though in the sample data these values reference locations such as Pensacola Regional Airport, reflecting the fictional nature of the dataset. The `assigned_clinic` column names the clinic where the client is currently enrolled, using descriptive labels like `baseline-assigned-91`. The `provider_change_request_id` links the client to their most recent change request, and `clinic_id` provides the numeric foreign key to the clinics table.

**Table `managers`**

| id | manager_id | printed_name | signature | review_date | decision_text | notification_date | provider_change_request_id | clinic_id |
|---|---|---|---|---|---|---|---|---|
| 1 | id_23 | Dana Nguyen | integrated-signatur-46 | 2024-11-03T22:54:00 | pilot-decision-86 | 2024-11-11T22:06:00 | 1 | 1 |
| 2 | 10449531 | Christopher Benson | seasonal-signatur-47 | 2025-04-14T05:11:00 | extended-decision-87 | 2025-04-22T05:23:00 | 2 | 2 |
| 3 | 659 | Michelle Kelley | regional-signatur-48 | 2022-09-25T12:28:00 | integrated-decision-88 | 2022-09-06T12:40:00 | 3 | 3 |
| 4 | f208f470-8fcd-11eb-924d-9cd76263cbd0 | Tasha Rodriguez | legacy-signatur-49 | 2023-02-09T19:45:00 | seasonal-decision-89 | 2023-02-17T19:57:00 | 4 | 4 |

Managers are the officials who review and adjudicate provider change requests. Each manager record contains an `id` (the primary key), a `manager_id` for external identification, and a `printed_name` such as Dana Nguyen or Christopher Benson. The `signature` field stores a reference to the manager's digital or procedural signature, for instance `integrated-signatur-46`. The `review_date` records when the manager completed their assessment, and `decision_text` captures the outcome category—`pilot-decision-86` or `extended-decision-87` in the sample data. The `notification_date` indicates when the decision was communicated to the relevant parties. The `provider_change_request_id` and `clinic_id` foreign keys tie the manager's action to the specific request and the clinic under review.

**Table `provider_roles`**

| provider_role_id | role_code | role_name | is_clinical | provider_change_request_id | created_at |
|---|---|---|---|---|---|
| 1 | 6969430 | Seasonal Programme | false | 1 | 2025-01-01 00:14:00 |
| 2 | lu_tax_code_template_m16 | Integrated Standard | true | 2 | 2025-02-06 03:14:00 |
| 3 | 3158154 | Extended Framework D | false | 3 | 2025-03-11 06:14:00 |
| 4 | 39800616 | Pilot Protocol | true | 4 | 2025-04-16 09:14:00 |

Provider roles define the categories of service a provider is authorized to deliver. The `provider_role_id` is the primary key, and `role_code` provides a machine-readable identifier such as `6969430` or `lu_tax_code_template_m16`. The `role_name` column gives the human-readable designation—`Seasonal Programme`, `Integrated Standard`, `Extended Framework D`, and `Pilot Protocol` in the sample data. The `is_clinical` boolean distinguishes clinical roles from administrative or support roles; `Integrated Standard` and `Pilot Protocol` are marked as clinical, while `Seasonal Programme` and `Extended Framework D` are not. The `provider_change_request_id` links the role to the specific change request, and `created_at` records when the role was established in the system.

**Table `providers`**

| id | provider_id | provider_name | provider_type | provider_change_request_id | clinic_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|
| 1 | 3717633 | Primary Initiative A | seasonal-provider-41 | 1 | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | ChIJYRd8uPtt5kcRunQjrWb4IKs | Composite Model | regional-provider-42 | 2 | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | 8928519 | Compact Cluster | legacy-provider-43 | 3 | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | lu_tax_code_template_m13 | Legacy Review D | compact-provider-44 | 4 | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Providers are the individuals or entities delivering services to clients. The `id` field is the primary key, while `provider_id` serves as the external identifier—values range from numeric codes like `3717633` to UUIDs such as `ChIJYRd8uPtt5kcRunQjrWb4IKs`. The `provider_name` gives the display name, for example `Primary Initiative A` or `Composite Model`. The `provider_type` categorizes the provider, with values like `seasonal-provider-41`, `regional-provider-42`, `legacy-provider-43`, and `compact-provider-44`. The `provider_change_request_id` and `clinic_id` foreign keys associate the provider with the relevant change request and the clinic where they operate. Timestamps `created_at` and `updated_at` track the provider's record lifecycle.

**Table `clinics`**

| id | clinic_code | clinic_name | location_code | manager_id | provider_id | client_id |
|---|---|---|---|---|---|---|
| 1 | d87f6fa90b894eb8be0b031dcc4d667a | Distributed Standard | 9736909 | 1 | 1 | 1000 |
| 2 | 4447007 | Adaptive Framework D | 9125640 | 2 | 2 | 1001 |
| 3 | 9085247 | Primary Protocol | 1450633 | 3 | 3 | 1002 |
| 4 | id_10 | Composite Programme | 21005921 | 4 | 4 | 1003 |

Clinics are the physical or organizational units where services are delivered. The `id` field is the primary key, and `clinic_code` provides a unique alphanumeric code such as `d87f6fa90b894eb8be0b031dcc4d667a` for the Distributed Standard clinic. The `clinic_name` column stores the human-readable name, and `location_code` identifies the geographic or logical location. The `manager_id`, `provider_id`, and `client_id` foreign keys link each clinic to its overseeing manager, its assigned provider, and its enrolled client. This three-way linkage ensures that every clinic record reflects the complete operational triad of management, service delivery, and client enrollment.

### Cross-Entity Views for Operational Reporting

The system provides a suite of analytical views that join the base tables into focused reports. Each view answers a specific operational question by assembling the relevant entities into a single, queryable result set.

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

This view joins provider change requests with their associated client records, answering the question: which clients have active change requests, and what are their identifying details? The result combines the request's metadata with the client's medical health number, full name, minority status, and contact information. For instance, a row would show request 2087732 alongside client MH-2064 (Theodore Mcgrath), indicating that this minor client has a submitted change request.

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

This view links change requests to the managers who reviewed them, answering: which manager handled which request, and what was the outcome? The joined result includes the manager's printed name, signature reference, review date, decision text, and notification date. A representative row might show request 575213 reviewed by Christopher Benson on 2025-04-14, with decision `extended-decision-87` and notification on 2025-04-22.

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

This view connects change requests to the provider roles involved, answering: what type of provider role is being requested or changed? The result includes the role code, role name, clinical designation, and creation timestamp. For example, request 103167 is associated with role code `3158154` (Extended Framework D), a non-clinical role created on 2025-03-11.

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

This view ties change requests to the providers being assigned, answering: which provider is being brought in or moved, and under what clinic? The joined result includes the provider's external ID, display name, type classification, and the clinic where they will operate. A sample row might show request 611510 linked to provider `lu_tax_code_template_m13` (Legacy Review D), a compact-provider type assigned to clinic 4.

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

This view presents the client-centric perspective: for each client, what is their current change request status and associated metadata? The result combines the client's medical health number, full name, minority flag, and contact details with the request's reason, status, and timestamps. This view is particularly useful for case managers who need to track all pending or completed transitions for their assigned clients.

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

This view maps clients to their assigned clinics, answering: which clients are enrolled at which clinic, and who is their assigned provider? The joined result includes the client's identifying information alongside the clinic's code, name, location code, and the provider and manager responsible for that clinic. For example, client MH-2064 (Theodore Mcgrath) is enrolled at clinic `d87f6fa90b894eb8be0b031dcc4d667a` (Distributed Standard), located at code 9736909.

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

This view provides the manager's operational dashboard: which requests has each manager reviewed, and what were the outcomes? The result includes the manager's name and signature alongside the request's client name, reason for change, status, and dates. This view supports workload analysis and performance tracking for the management team.

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

This view links managers to the clinics they oversee, answering: which manager is responsible for which clinic? The joined result includes the manager's printed name, signature, review and notification dates, alongside the clinic's code, name, and location code. For instance, manager Dana Nguyen (signature `integrated-signatur-46`) is linked to clinic `d87f6fa90b894eb8be0b031dcc4d667a` (Distributed Standard).

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

This view presents the provider role perspective: for each role, which change requests reference it, and what is the status of those requests? The result includes the role code, role name, clinical designation, and the associated request's reason, status, and dates. This view is useful for auditing which roles are most frequently involved in change requests.

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

This view connects providers to their change requests, answering: which providers are involved in active or completed transitions? The joined result includes the provider's external ID, name, type, and timestamps alongside the request's client name, reason, and status. For example, provider `3717633` (Primary Initiative A), a seasonal-provider type, is linked to request 2087732 with status `submitted`.

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

This view maps providers to their assigned clinics, answering: which provider operates at which clinic, and who is the managing official? The result includes the provider's name and type alongside the clinic's code, name, location code, and the manager's name. A representative row might show provider `ChIJYRd8uPtt5kcRunQjrWb4IKs` (Composite Model) operating at clinic `4447007` (Adaptive Framework D) under manager Christopher Benson.

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

This view presents the clinic's management structure: for each clinic, who is the overseeing manager, and what is the manager's review history? The joined result includes the clinic's code, name, and location alongside the manager's name, signature, review date, decision text, and notification date. This view supports organizational accountability by clearly linking each clinic to its responsible manager.

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

This view maps clinics to their assigned providers, answering: which provider delivers services at which clinic? The result includes the clinic's identifying information alongside the provider's external ID, name, type, and creation timestamp. For example, clinic `9085247` (Primary Protocol) is served by provider `8928519` (Compact Cluster), a legacy-provider type created on 2025-03-11.

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

This view links clinics to their enrolled clients, answering: which clients are served by which clinic? The joined result includes the clinic's code, name, and location alongside the client's medical health number, full name, minority status, and contact phone. A sample row might show clinic `id_10` (Composite Programme) serving client MH-2079 (Norma Fisher), a non-minor client.

### Synthesis

The provider change request system forms a tightly integrated network of entities, each contributing essential information to the lifecycle of a service transition. The base tables capture the raw records—requests, clients, managers, roles, providers, and clinics—while the analytical views assemble these records into focused reports that answer specific operational questions. Together, they enable healthcare organizations to track every change from submission through approval, ensuring that clients receive continuous, properly authorized care. The fictional data in this reference illustrates the structure and relationships; in practice, the same patterns apply to real-world mental health service coordination across distributed clinic networks.