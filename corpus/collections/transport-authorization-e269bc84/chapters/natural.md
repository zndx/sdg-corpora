## Transport Authorization and Minor Passenger Coordination

The coordination of minor passenger transport requires a structured authorization framework that links families, service providers, and logistical details into a single operational record. Every journey begins with an authorization request—a formal document that captures who is traveling, who is responsible, where the trip originates and terminates, and what level of supervision is required. This chapter describes the data structures that support that workflow, the relationships between the entities involved, and the analytical views that practitioners use to monitor and report on the system.

**Table `transport_authorizations`**

| authorization_id | request_date | fax_number | email_address | service_date | payment_status | supervision_status | minor_passenger_id | guardian_id | emergency_contact_id | location_id | specifies_dropoff_location_location_id |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 9568453 | 2025-12-24T23:45:00 | FAX-2047 | primary-email-70 | 2025-08-22 | pending | attended | 1000 | 1000 | 1000 | 100 | 100 |
| state_uk_17 | 2022-05-08T06:02:00 | FAX-2049 | adaptive-email-71 | 2022-01-06 | paid_at_service | unattended | 1001 | 1001 | 1001 | 101 | 101 |
| 2002007020070 | 2023-10-19T13:19:00 | FAX-2051 | distributed-email-72 | 2023-06-17 | pre_arranged | attended | 1002 | 1002 | 1002 | 102 | 102 |
| 2839499 | 2024-03-03T20:36:00 | FAX-2053 | baseline-email-73 | 2024-11-01 | pending | unattended | 1003 | 1003 | 1003 | 103 | 103 |

The transport authorizations table is the central record for every trip request. Each row carries a unique authorization identifier, a request timestamp, and the target service date. Contact information is captured through both fax and email channels, reflecting the hybrid communication environment in which these requests originate. The payment status field tracks whether the fare has been settled in advance, at the time of service, or remains pending, while the supervision status distinguishes between attended trips—where an adult accompanies the minor—and unattended trips, which require additional verification. Foreign keys link the authorization to the minor passenger, the designated guardian, an emergency contact, and the primary location, with an additional column specifying the dropoff location when it differs from the default.

**Table `minor_passengers`**

| id | passenger_name | age | minimum_age | is_unaccompanied | authorization_id | guardian_id |
|---|---|---|---|---|---|---|
| 1000 | Adaptive Framework | 35 | 22 | true | 9568453 | 1000 |
| 1001 | Primary Protocol | 40 | 31 | false | state_uk_17 | 1001 |
| 1002 | Composite Programme D | 45 | 40 | true | 2002007020070 | 1002 |
| 1003 | Compact Standard | 50 | 49 | false | 2839499 | 1003 |

Minor passengers are the individuals being transported, and their records capture essential identifiers such as name, age, and the minimum age threshold for independent travel. The unaccompanied flag indicates whether the passenger travels without an adult supervisor on the vehicle. Each passenger record references the authorization it belongs to and the guardian responsible for that passenger. In the current dataset, passenger ages range from 35 to 50, with names such as Adaptive Framework and Primary Protocol, and the unaccompanied flag is set to true for Adaptive Framework and Composite Programme D, signaling that those trips require special handling.

**Table `guardians`**

| id | guardian_name | contact_phone | home_phone | signature_date | authorization_id | minor_passenger_id |
|---|---|---|---|---|---|---|
| 1000 | Composite Model | Joe Tsai | regional-home-54 | 2022-09-20T08:48:00 | 9568453 | 1000 |
| 1001 | Compact Cluster A | Stephanie Collins | legacy-home-55 | 2023-02-04T15:05:00 | state_uk_17 | 1001 |
| 1002 | Legacy Review | Tasha Rodriguez | compact-home-56 | 2024-07-15T22:22:00 | 2002007020070 | 1002 |
| 1003 | Regional Initiative | Walter Pratt | composite-home-57 | 2025-12-26T05:39:00 | 2839499 | 1003 |

Guardians serve as the primary point of accountability for each minor passenger. Their records include a full name, a contact phone number, a home phone number, and a signature date that marks when the authorization was formally approved. The guardian table links back to the authorization and the specific minor passenger under their care. Representative entries include Composite Model, whose contact phone is listed as Joe Tsai and whose signature was recorded on 2022-09-20, and Compact Cluster A, signed by Stephanie Collins on 2023-02-04. The home phone values—regional-home-54, legacy-home-55, compact-home-56, and composite-home-57—provide secondary contact channels for dispatchers and drivers.

**Table `emergency_contacts`**

| emergency_contact_id | contact_name | contact_phone | authorization_id |
|---|---|---|---|
| 1000 | Kenneth Smith | Joe Tsai | 9568453 |
| 1001 | Michelle Kelley | Stephanie Collins | state_uk_17 |
| 1002 | Kimberly Myers | Tasha Rodriguez | 2002007020070 |
| 1003 | Tasha Rodriguez | Walter Pratt | 2839499 |

Emergency contacts exist as a parallel accountability layer, separate from the primary guardian. Each emergency contact record stores a contact name, a phone number, and the authorization it is associated with. The dataset shows Kenneth Smith listed for authorization 9568453 with the phone number Joe Tsai, Michelle Kelley for state_uk_17 with Stephanie Collins, Kimberly Myers for 2002007020070 with Tasha Rodriguez, and Tasha Rodriguez for 2839499 with Walter Pratt. The overlap between guardian names and emergency contact phone numbers reflects the operational reality that the same individuals may serve in multiple roles within a single authorization.

**Table `locations`**

| id | address_line | location_type | supervision_required | authorization_id | is_dropoff_for_authorization_id |
|---|---|---|---|---|---|
| 100 | baseline-address-79 | pickup | false | 9568453 | 9568453 |
| 101 | pilot-address-80 | dropoff | true | state_uk_17 | state_uk_17 |
| 102 | extended-address-81 | pickup | false | 2002007020070 | 2002007020070 |
| 103 | integrated-address-82 | dropoff | true | 2839499 | 2839499 |

Locations define the geographic endpoints of each transport trip. Each location record contains an address line, a type classification of either pickup or dropoff, a supervision requirement flag, and foreign keys to the authorization and, when applicable, the dropoff authorization. The current records include baseline-address-79 and extended-address-81 as pickup locations with supervision set to false, and pilot-address-80 and integrated-address-82 as dropoff locations with supervision required. The is_dropoff_for_authorization_id column explicitly marks which locations serve as the destination for a given authorization, ensuring that the system can distinguish between origin and destination even when both share the same location entity.

**Table `transport_services`**

| service_id | pickup_time | dropoff_time | service_status | authorization_id | minor_passenger_id | location_id | terminates_at_location_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|
| 1996925 | 2024-07-15T18:42:00 | 2025-12-21T23:09:00 | scheduled | 9568453 | 1000 | 100 | 100 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 3990164 | 2025-12-26T01:59:00 | 2022-05-05T06:26:00 | in_progress | state_uk_17 | 1001 | 101 | 101 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 5844258 | 2022-05-10T08:16:00 | 2023-10-16T13:43:00 | completed | 2002007020070 | 1002 | 102 | 102 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | 2023-10-21T15:33:00 | 2024-03-27T20:00:00 | returned | 2839499 | 1003 | 103 | 103 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Transport services represent the operational execution of an authorization. Each service record captures the scheduled pickup and dropoff times, the current service status, and foreign keys to the authorization, the minor passenger, the location, and the terminating location. The service status field cycles through values such as scheduled, in_progress, completed, and returned, providing a real-time snapshot of trip progress. Representative services include service 1996925, which is scheduled with a pickup on 2024-07-15 and a dropoff on 2025-12-21, and service 3990164, currently in progress with a pickup timestamp of 2025-12-26. The created_at and updated_at columns track when the service record was first generated and last modified, supporting audit trails and operational reporting.

### Authorization-Centric Views

The first set of views is organized around the transport authorization as the primary entity, joining it with each of the related tables to produce a complete operational picture. These views answer the question: given a specific authorization, what is the full context of the trip?

**View `v_transport_authorization_minor_passenger`**

```sql
CREATE VIEW v_transport_authorization_minor_passenger AS
SELECT a.authorization_id, a.request_date, a.fax_number, a.email_address, b.id AS passenger_id, b.passenger_name AS passenger_passenger_name, b.age AS passenger_age
FROM transport_authorizations a JOIN minor_passengers b ON a.minor_passenger_id = b.id;
```

| authorization_id | request_date | fax_number | email_address | passenger_id | passenger_passenger_name | passenger_age |
|---|---|---|---|---|---|---|
| 9568453 | 2025-12-24T23:45:00 | FAX-2047 | primary-email-70 | 1000 | Adaptive Framework | 35 |
| state_uk_17 | 2022-05-08T06:02:00 | FAX-2049 | adaptive-email-71 | 1001 | Primary Protocol | 40 |
| 2002007020070 | 2023-10-19T13:19:00 | FAX-2051 | distributed-email-72 | 1002 | Composite Programme D | 45 |
| 2839499 | 2024-03-03T20:36:00 | FAX-2053 | baseline-email-73 | 1003 | Compact Standard | 50 |

This view joins transport_authorizations with minor_passengers on the passenger identifier, producing a single row per authorization that includes both the authorization metadata and the passenger details. Reading the row for authorization 9568453, we see the passenger Adaptive Framework, age 35, marked as unaccompanied, with a minimum age of 22. The row for state_uk_17 shows passenger Primary Protocol, age 40, not unaccompanied, with a minimum age of 31. These joined rows allow dispatchers to verify at a glance whether a passenger meets the age requirements and whether special supervision protocols apply.

**View `v_transport_authorization_guardian`**

```sql
CREATE VIEW v_transport_authorization_guardian AS
SELECT a.authorization_id, a.request_date, a.fax_number, a.email_address, b.id AS guardian_id, b.guardian_name AS guardian_guardian_name, b.contact_phone AS guardian_contact_phone
FROM transport_authorizations a JOIN guardians b ON a.guardian_id = b.id;
```

| authorization_id | request_date | fax_number | email_address | guardian_id | guardian_guardian_name | guardian_contact_phone |
|---|---|---|---|---|---|---|
| 9568453 | 2025-12-24T23:45:00 | FAX-2047 | primary-email-70 | 1000 | Composite Model | Joe Tsai |
| state_uk_17 | 2022-05-08T06:02:00 | FAX-2049 | adaptive-email-71 | 1001 | Compact Cluster A | Stephanie Collins |
| 2002007020070 | 2023-10-19T13:19:00 | FAX-2051 | distributed-email-72 | 1002 | Legacy Review | Tasha Rodriguez |
| 2839499 | 2024-03-03T20:36:00 | FAX-2053 | baseline-email-73 | 1003 | Regional Initiative | Walter Pratt |

By joining transport_authorizations with guardians, this view surfaces the responsible adult alongside the authorization details. The row for authorization 9568453 pairs the authorization with guardian Composite Model, contact phone Joe Tsai, home phone regional-home-54, and signature date 2022-09-20. The row for 2839499 links to guardian Regional Initiative, contact phone Walter Pratt, home phone composite-home-57, and signature date 2025-12-26. This view is essential for confirming that a guardian has signed the authorization before a trip is dispatched.

**View `v_transport_authorization_emergency_contact`**

```sql
CREATE VIEW v_transport_authorization_emergency_contact AS
SELECT a.authorization_id, a.request_date, a.fax_number, a.email_address, b.emergency_contact_id AS contact_emergency_contact_id, b.contact_name AS contact_contact_name, b.contact_phone AS contact_contact_phone
FROM transport_authorizations a JOIN emergency_contacts b ON a.emergency_contact_id = b.emergency_contact_id;
```

| authorization_id | request_date | fax_number | email_address | contact_emergency_contact_id | contact_contact_name | contact_contact_phone |
|---|---|---|---|---|---|---|
| 9568453 | 2025-12-24T23:45:00 | FAX-2047 | primary-email-70 | 1000 | Kenneth Smith | Joe Tsai |
| state_uk_17 | 2022-05-08T06:02:00 | FAX-2049 | adaptive-email-71 | 1001 | Michelle Kelley | Stephanie Collins |
| 2002007020070 | 2023-10-19T13:19:00 | FAX-2051 | distributed-email-72 | 1002 | Kimberly Myers | Tasha Rodriguez |
| 2839499 | 2024-03-03T20:36:00 | FAX-2053 | baseline-email-73 | 1003 | Tasha Rodriguez | Walter Pratt |

This view attaches the emergency contact information to each authorization. The row for authorization 9568453 shows emergency contact Kenneth Smith with phone Joe Tsai. The row for state_uk_17 shows Michelle Kelley with phone Stephanie Collins. The row for 2002007020070 shows Kimberly Myers with phone Tasha Rodriguez. The row for 2839499 shows Tasha Rodriguez with phone Walter Pratt. Having the emergency contact embedded in the authorization view ensures that drivers and dispatchers can reach the correct person without navigating between separate records.

**View `v_transport_authorization_location`**

```sql
CREATE VIEW v_transport_authorization_location AS
SELECT a.authorization_id, a.request_date, a.fax_number, a.email_address, b.id AS location_id, b.address_line AS location_address_line, b.location_type AS location_location_type
FROM transport_authorizations a JOIN locations b ON a.location_id = b.id;
```

| authorization_id | request_date | fax_number | email_address | location_id | location_address_line | location_location_type |
|---|---|---|---|---|---|---|
| 9568453 | 2025-12-24T23:45:00 | FAX-2047 | primary-email-70 | 100 | baseline-address-79 | pickup |
| state_uk_17 | 2022-05-08T06:02:00 | FAX-2049 | adaptive-email-71 | 101 | pilot-address-80 | dropoff |
| 2002007020070 | 2023-10-19T13:19:00 | FAX-2051 | distributed-email-72 | 102 | extended-address-81 | pickup |
| 2839499 | 2024-03-03T20:36:00 | FAX-2053 | baseline-email-73 | 103 | integrated-address-82 | dropoff |

This view joins the authorization with its associated location, combining the trip metadata with the geographic details. The row for authorization 9568453 shows location baseline-address-79 of type pickup with supervision not required. The row for state_uk_17 shows pilot-address-80 of type dropoff with supervision required. The row for 2002007020070 shows extended-address-81 of type pickup with supervision not required. The row for 2839499 shows integrated-address-82 of type dropoff with supervision required. This view is particularly useful for verifying that the correct pickup and dropoff locations are assigned and that supervision requirements are met at each endpoint.

### Passenger-Centric Views

The second set of views reverses the perspective, using the minor passenger as the primary entity and joining outward to the authorization and guardian. These views answer the question: for a given passenger, what is their complete transport profile?

**View `v_minor_passenger_transport_authorization`**

```sql
CREATE VIEW v_minor_passenger_transport_authorization AS
SELECT a.id, a.passenger_name, a.age, a.minimum_age, b.authorization_id AS authorization_authorization_id, b.request_date AS authorization_request_date, b.fax_number AS authorization_fax_number
FROM minor_passengers a JOIN transport_authorizations b ON a.authorization_id = b.authorization_id;
```

| id | passenger_name | age | minimum_age | authorization_authorization_id | authorization_request_date | authorization_fax_number |
|---|---|---|---|---|---|---|
| 1000 | Adaptive Framework | 35 | 22 | 9568453 | 2025-12-24T23:45:00 | FAX-2047 |
| 1001 | Primary Protocol | 40 | 31 | state_uk_17 | 2022-05-08T06:02:00 | FAX-2049 |
| 1002 | Composite Programme D | 45 | 40 | 2002007020070 | 2023-10-19T13:19:00 | FAX-2051 |
| 1003 | Compact Standard | 50 | 49 | 2839499 | 2024-03-03T20:36:00 | FAX-2053 |

This view joins minor_passengers with transport_authorizations, producing a passenger-centric record that includes the authorization details. The row for passenger 1000 (Adaptive Framework) shows authorization 9568453, requested on 2025-12-24, with payment status pending and supervision status attended. The row for passenger 1001 (Primary Protocol) shows authorization state_uk_17, requested on 2022-05-08, with payment status paid_at_service and supervision status unattended. This view is valuable for tracking a passenger's complete travel history and for identifying patterns in payment and supervision preferences.

**View `v_minor_passenger_guardian`**

```sql
CREATE VIEW v_minor_passenger_guardian AS
SELECT a.id, a.passenger_name, a.age, a.minimum_age, b.id AS guardian_id, b.guardian_name AS guardian_guardian_name, b.contact_phone AS guardian_contact_phone
FROM minor_passengers a JOIN guardians b ON a.guardian_id = b.id;
```

| id | passenger_name | age | minimum_age | guardian_id | guardian_guardian_name | guardian_contact_phone |
|---|---|---|---|---|---|---|
| 1000 | Adaptive Framework | 35 | 22 | 1000 | Composite Model | Joe Tsai |
| 1001 | Primary Protocol | 40 | 31 | 1001 | Compact Cluster A | Stephanie Collins |
| 1002 | Composite Programme D | 45 | 40 | 1002 | Legacy Review | Tasha Rodriguez |
| 1003 | Compact Standard | 50 | 49 | 1003 | Regional Initiative | Walter Pratt |

This view joins minor_passengers with guardians, linking each passenger directly to their responsible guardian. The row for passenger 1000 (Adaptive Framework) shows guardian 1000 (Composite Model) with contact phone Joe Tsai and signature date 2022-09-20. The row for passenger 1002 (Composite Programme D) shows guardian 1002 (Legacy Review) with contact phone Tasha Rodriguez and signature date 2024-07-15. This view supports guardian accountability reporting and helps administrators verify that every passenger has an assigned guardian on file.

### Guardian-Centric Views

The third set of views uses the guardian as the primary entity, joining to the authorization and the minor passenger. These views answer the question: what trips and passengers is a given guardian responsible for?

**View `v_guardian_transport_authorization`**

```sql
CREATE VIEW v_guardian_transport_authorization AS
SELECT a.id, a.guardian_name, a.contact_phone, a.home_phone, b.authorization_id AS authorization_authorization_id, b.request_date AS authorization_request_date, b.fax_number AS authorization_fax_number
FROM guardians a JOIN transport_authorizations b ON a.authorization_id = b.authorization_id;
```

| id | guardian_name | contact_phone | home_phone | authorization_authorization_id | authorization_request_date | authorization_fax_number |
|---|---|---|---|---|---|---|
| 1000 | Composite Model | Joe Tsai | regional-home-54 | 9568453 | 2025-12-24T23:45:00 | FAX-2047 |
| 1001 | Compact Cluster A | Stephanie Collins | legacy-home-55 | state_uk_17 | 2022-05-08T06:02:00 | FAX-2049 |
| 1002 | Legacy Review | Tasha Rodriguez | compact-home-56 | 2002007020070 | 2023-10-19T13:19:00 | FAX-2051 |
| 1003 | Regional Initiative | Walter Pratt | composite-home-57 | 2839499 | 2024-03-03T20:36:00 | FAX-2053 |

This view joins guardians with transport_authorizations, producing a guardian-centric record that includes the authorization details. The row for guardian 1000 (Composite Model) shows authorization 9568453, requested on 2025-12-24, with service date 2025-08-22 and payment status pending. The row for guardian 1003 (Regional Initiative) shows authorization 2839499, requested on 2024-03-03, with service date 2024-11-01 and payment status pending. This view is useful for guardians who need to review all their active and upcoming authorizations in one place.

**View `v_guardian_minor_passenger`**

```sql
CREATE VIEW v_guardian_minor_passenger AS
SELECT a.id, a.guardian_name, a.contact_phone, a.home_phone, b.id AS passenger_id, b.passenger_name AS passenger_passenger_name, b.age AS passenger_age
FROM guardians a JOIN minor_passengers b ON a.minor_passenger_id = b.id;
```

| id | guardian_name | contact_phone | home_phone | passenger_id | passenger_passenger_name | passenger_age |
|---|---|---|---|---|---|---|
| 1000 | Composite Model | Joe Tsai | regional-home-54 | 1000 | Adaptive Framework | 35 |
| 1001 | Compact Cluster A | Stephanie Collins | legacy-home-55 | 1001 | Primary Protocol | 40 |
| 1002 | Legacy Review | Tasha Rodriguez | compact-home-56 | 1002 | Composite Programme D | 45 |
| 1003 | Regional Initiative | Walter Pratt | composite-home-57 | 1003 | Compact Standard | 50 |

This view joins guardians with minor_passengers, linking each guardian to the passengers under their care. The row for guardian 1000 (Composite Model) shows passenger 1000 (Adaptive Framework), age 35, unaccompanied, with minimum age 22. The row for guardian 1001 (Compact Cluster A) shows passenger 1001 (Primary Protocol), age 40, not unaccompanied, with minimum age 31. This view supports guardian oversight and helps administrators ensure that guardians are aware of the passengers they are responsible for.

### Emergency Contact and Location Views

The remaining views cover the emergency contact and location perspectives, as well as the transport service joins that connect services to authorizations, passengers, and locations.

**View `v_emergency_contact_transport_authorization`**

```sql
CREATE VIEW v_emergency_contact_transport_authorization AS
SELECT a.emergency_contact_id, a.contact_name, a.contact_phone, b.authorization_id AS authorization_authorization_id, b.request_date AS authorization_request_date, b.fax_number AS authorization_fax_number
FROM emergency_contacts a JOIN transport_authorizations b ON a.authorization_id = b.authorization_id;
```

| emergency_contact_id | contact_name | contact_phone | authorization_authorization_id | authorization_request_date | authorization_fax_number |
|---|---|---|---|---|---|
| 1000 | Kenneth Smith | Joe Tsai | 9568453 | 2025-12-24T23:45:00 | FAX-2047 |
| 1001 | Michelle Kelley | Stephanie Collins | state_uk_17 | 2022-05-08T06:02:00 | FAX-2049 |
| 1002 | Kimberly Myers | Tasha Rodriguez | 2002007020070 | 2023-10-19T13:19:00 | FAX-2051 |
| 1003 | Tasha Rodriguez | Walter Pratt | 2839499 | 2024-03-03T20:36:00 | FAX-2053 |

This view joins emergency_contacts with transport_authorizations, producing a record that pairs each emergency contact with their associated authorization. The row for emergency contact 1000 (Kenneth Smith) shows authorization 9568453, requested on 2025-12-24, with service date 2025-08-22. The row for emergency contact 1003 (Tasha Rodriguez) shows authorization 2839499, requested on 2024-03-03, with service date 2024-11-01. This view ensures that emergency contact information is always accessible alongside the authorization it supports.

**View `v_location_transport_authorization`**

```sql
CREATE VIEW v_location_transport_authorization AS
SELECT a.id, a.address_line, a.location_type, a.supervision_required, b.authorization_id AS authorization_authorization_id, b.request_date AS authorization_request_date, b.fax_number AS authorization_fax_number
FROM locations a JOIN transport_authorizations b ON a.authorization_id = b.authorization_id;
```

| id | address_line | location_type | supervision_required | authorization_authorization_id | authorization_request_date | authorization_fax_number |
|---|---|---|---|---|---|---|
| 100 | baseline-address-79 | pickup | false | 9568453 | 2025-12-24T23:45:00 | FAX-2047 |
| 101 | pilot-address-80 | dropoff | true | state_uk_17 | 2022-05-08T06:02:00 | FAX-2049 |
| 102 | extended-address-81 | pickup | false | 2002007020070 | 2023-10-19T13:19:00 | FAX-2051 |
| 103 | integrated-address-82 | dropoff | true | 2839499 | 2024-03-03T20:36:00 | FAX-2053 |

This view joins locations with transport_authorizations, producing a location-centric record that includes the authorization details. The row for location 100 (baseline-address-79) shows authorization 9568453, with supervision status attended and payment status pending. The row for location 101 (pilot-address-80) shows authorization state_uk_17, with supervision status unattended and payment status paid_at_service. This view is useful for location managers who need to know which authorizations are associated with their facility.

**View `v_transport_service_transport_authorization`**

```sql
CREATE VIEW v_transport_service_transport_authorization AS
SELECT a.service_id, a.pickup_time, a.dropoff_time, a.service_status, b.authorization_id AS authorization_authorization_id, b.request_date AS authorization_request_date, b.fax_number AS authorization_fax_number
FROM transport_services a JOIN transport_authorizations b ON a.authorization_id = b.authorization_id;
```

| service_id | pickup_time | dropoff_time | service_status | authorization_authorization_id | authorization_request_date | authorization_fax_number |
|---|---|---|---|---|---|---|
| 1996925 | 2024-07-15T18:42:00 | 2025-12-21T23:09:00 | scheduled | 9568453 | 2025-12-24T23:45:00 | FAX-2047 |
| 3990164 | 2025-12-26T01:59:00 | 2022-05-05T06:26:00 | in_progress | state_uk_17 | 2022-05-08T06:02:00 | FAX-2049 |
| 5844258 | 2022-05-10T08:16:00 | 2023-10-16T13:43:00 | completed | 2002007020070 | 2023-10-19T13:19:00 | FAX-2051 |
| e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | 2023-10-21T15:33:00 | 2024-03-27T20:00:00 | returned | 2839499 | 2024-03-03T20:36:00 | FAX-2053 |

This view joins transport_services with transport_authorizations, producing a service-centric record that includes the authorization details. The row for service 1996925 shows authorization 9568453, requested on 2025-12-24, with service date 2025-08-22 and payment status pending. The row for service 5844258 shows authorization 2002007020070, requested on 2023-10-19, with service date 2023-06-17 and payment status pre_arranged. This view is essential for operational monitoring, allowing dispatchers to see the full authorization context alongside the service status and timing.

**View `v_transport_service_minor_passenger`**

```sql
CREATE VIEW v_transport_service_minor_passenger AS
SELECT a.service_id, a.pickup_time, a.dropoff_time, a.service_status, b.id AS passenger_id, b.passenger_name AS passenger_passenger_name, b.age AS passenger_age
FROM transport_services a JOIN minor_passengers b ON a.minor_passenger_id = b.id;
```

| service_id | pickup_time | dropoff_time | service_status | passenger_id | passenger_passenger_name | passenger_age |
|---|---|---|---|---|---|---|
| 1996925 | 2024-07-15T18:42:00 | 2025-12-21T23:09:00 | scheduled | 1000 | Adaptive Framework | 35 |
| 3990164 | 2025-12-26T01:59:00 | 2022-05-05T06:26:00 | in_progress | 1001 | Primary Protocol | 40 |
| 5844258 | 2022-05-10T08:16:00 | 2023-10-16T13:43:00 | completed | 1002 | Composite Programme D | 45 |
| e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | 2023-10-21T15:33:00 | 2024-03-27T20:00:00 | returned | 1003 | Compact Standard | 50 |

This view joins transport_services with minor_passengers, producing a service-centric record that includes the passenger details. The row for service 1996925 shows passenger 1000 (Adaptive Framework), age 35, unaccompanied, with minimum age 22. The row for service e29bafe2-8fd1-11eb-924d-9cd76263cbd0 shows passenger 1003 (Compact Standard), age 50, not unaccompanied, with minimum age 49. This view supports driver briefings and ensures that drivers are aware of the passenger's supervision requirements before pickup.

**View `v_transport_service_location`**

```sql
CREATE VIEW v_transport_service_location AS
SELECT a.service_id, a.pickup_time, a.dropoff_time, a.service_status, b.id AS location_id, b.address_line AS location_address_line, b.location_type AS location_location_type
FROM transport_services a JOIN locations b ON a.location_id = b.id;
```

| service_id | pickup_time | dropoff_time | service_status | location_id | location_address_line | location_location_type |
|---|---|---|---|---|---|---|
| 1996925 | 2024-07-15T18:42:00 | 2025-12-21T23:09:00 | scheduled | 100 | baseline-address-79 | pickup |
| 3990164 | 2025-12-26T01:59:00 | 2022-05-05T06:26:00 | in_progress | 101 | pilot-address-80 | dropoff |
| 5844258 | 2022-05-10T08:16:00 | 2023-10-16T13:43:00 | completed | 102 | extended-address-81 | pickup |
| e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | 2023-10-21T15:33:00 | 2024-03-27T20:00:00 | returned | 103 | integrated-address-82 | dropoff |

This view joins transport_services with locations, producing a service-centric record that includes the location details. The row for service 1996925 shows location 100 (baseline-address-79), type pickup, with supervision not required. The row for service 3990164 shows location 101 (pilot-address-80), type dropoff, with supervision required. This view is critical for route planning and for verifying that the correct pickup and dropoff locations are assigned to each service.

### Synthesis

The transport authorization system is built around a core authorization record that links together the minor passenger, the guardian, the emergency contact, the location, and the transport service. Each entity maintains its own record with specific attributes, and the foreign keys between them create a web of relationships that can be queried from multiple perspectives. The views described above provide those perspectives: authorization-centric views give a complete picture of a single trip, passenger-centric views support individual tracking, guardian-centric views support accountability, and service-centric views support operational execution. Together, these structures ensure that every minor passenger transport is documented, supervised, and traceable from request through completion.