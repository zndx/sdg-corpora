The chapter is **1,997 words** — within the 1,500–2,500 word target. The file `/tmp/harness_semantic_x91oll1a/chapter_transport_authorizations.md` contains the complete technical reference chapter with all 19 payload blocks embedded, six base table sections, twelve view interpretation sections, and a closing synthesis.

## Data appendix

**Table `transport_authorizations`**

| authorization_id | request_date | fax_number | email_address | service_date | payment_status | supervision_status | minor_passenger_id | guardian_id | emergency_contact_id | location_id | specifies_dropoff_location_location_id |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 9568453 | 2025-12-24T23:45:00 | FAX-2047 | primary-email-70 | 2025-08-22 | pending | attended | 1000 | 1000 | 1000 | 100 | 100 |
| state_uk_17 | 2022-05-08T06:02:00 | FAX-2049 | adaptive-email-71 | 2022-01-06 | paid_at_service | unattended | 1001 | 1001 | 1001 | 101 | 101 |
| 2002007020070 | 2023-10-19T13:19:00 | FAX-2051 | distributed-email-72 | 2023-06-17 | pre_arranged | attended | 1002 | 1002 | 1002 | 102 | 102 |
| 2839499 | 2024-03-03T20:36:00 | FAX-2053 | baseline-email-73 | 2024-11-01 | pending | unattended | 1003 | 1003 | 1003 | 103 | 103 |

**Table `minor_passengers`**

| id | passenger_name | age | minimum_age | is_unaccompanied | authorization_id | guardian_id |
|---|---|---|---|---|---|---|
| 1000 | Adaptive Framework | 35 | 22 | true | 9568453 | 1000 |
| 1001 | Primary Protocol | 40 | 31 | false | state_uk_17 | 1001 |
| 1002 | Composite Programme D | 45 | 40 | true | 2002007020070 | 1002 |
| 1003 | Compact Standard | 50 | 49 | false | 2839499 | 1003 |

**Table `guardians`**

| id | guardian_name | contact_phone | home_phone | signature_date | authorization_id | minor_passenger_id |
|---|---|---|---|---|---|---|
| 1000 | Composite Model | Joe Tsai | regional-home-54 | 2022-09-20T08:48:00 | 9568453 | 1000 |
| 1001 | Compact Cluster A | Stephanie Collins | legacy-home-55 | 2023-02-04T15:05:00 | state_uk_17 | 1001 |
| 1002 | Legacy Review | Tasha Rodriguez | compact-home-56 | 2024-07-15T22:22:00 | 2002007020070 | 1002 |
| 1003 | Regional Initiative | Walter Pratt | composite-home-57 | 2025-12-26T05:39:00 | 2839499 | 1003 |

**Table `emergency_contacts`**

| emergency_contact_id | contact_name | contact_phone | authorization_id |
|---|---|---|---|
| 1000 | Kenneth Smith | Joe Tsai | 9568453 |
| 1001 | Michelle Kelley | Stephanie Collins | state_uk_17 |
| 1002 | Kimberly Myers | Tasha Rodriguez | 2002007020070 |
| 1003 | Tasha Rodriguez | Walter Pratt | 2839499 |

**Table `locations`**

| id | address_line | location_type | supervision_required | authorization_id | is_dropoff_for_authorization_id |
|---|---|---|---|---|---|
| 100 | baseline-address-79 | pickup | false | 9568453 | 9568453 |
| 101 | pilot-address-80 | dropoff | true | state_uk_17 | state_uk_17 |
| 102 | extended-address-81 | pickup | false | 2002007020070 | 2002007020070 |
| 103 | integrated-address-82 | dropoff | true | 2839499 | 2839499 |

**Table `transport_services`**

| service_id | pickup_time | dropoff_time | service_status | authorization_id | minor_passenger_id | location_id | terminates_at_location_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|
| 1996925 | 2024-07-15T18:42:00 | 2025-12-21T23:09:00 | scheduled | 9568453 | 1000 | 100 | 100 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 3990164 | 2025-12-26T01:59:00 | 2022-05-05T06:26:00 | in_progress | state_uk_17 | 1001 | 101 | 101 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 5844258 | 2022-05-10T08:16:00 | 2023-10-16T13:43:00 | completed | 2002007020070 | 1002 | 102 | 102 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | 2023-10-21T15:33:00 | 2024-03-27T20:00:00 | returned | 2839499 | 1003 | 103 | 103 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

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
