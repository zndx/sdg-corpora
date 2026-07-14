The data governance domain captures the contractual and operational relationships between organizations that collect and process personal information, the individuals whose data is at stake, and the technical artefacts—cookies, browsing sessions, devices—through which that data flows. The schema is normalised into eight base tables that separate concerns: who controls the data, who processes it on the controller's behalf, which privacy representatives are appointed, and the granular records of personal data, surfing activity, cookies, and user devices. Fourteen materialised views then rejoin these tables so that analysts can query domain facts without writing joins by hand. Every table carries a surrogate integer primary key; foreign keys bind the tables into a directed graph whose edges encode one-to-one, one-to-many, and many-to-one cardinalities.

## Base Tables and Their Attributes

The anchor of the model is the `data_controllers` table, which stores the legal entities responsible for determining why and how personal data is processed. Each row is identified by an integer `id` and carries the organisation's `legal_name`, `registration_number`, `registered_address`, `contact_email`, and `jurisdiction`. The controller also holds two foreign keys—`data_processor_id` and `privacy_representative_id`—that point into the `data_processors` and `privacy_representatives` tables respectively, enforcing a one-to-one relationship in each direction. For instance, the controller with `id` 1000, named "Adaptive Model" and registered as `REG-2136`, is located at `regional-register-36`, reachable at `Christopher Wilson`, and operates under `regional-jurisdic-30`. Its `data_processor_id` of `1` and `privacy_representative_id` of `1000` create the first links in the relationship graph. The remaining controllers follow the same pattern: "Primary Cluster" (`id` 1001, `REG-2142`), "Composite Review D" (`id` 1002, `REG-2148`), and "Compact Initiative" (`id` 1003, `REG-2154`).

**Table `data_controllers`**

| id | legal_name | registration_number | registered_address | contact_email | jurisdiction | data_processor_id | privacy_representative_id |
|---|---|---|---|---|---|---|---|
| 1000 | Adaptive Model | REG-2136 | regional-register-36 | Christopher Wilson | regional-jurisdic-30 | 1 | 1000 |
| 1001 | Primary Cluster | REG-2142 | legacy-register-37 | Charles Larsen | legacy-jurisdic-31 | 2 | 1001 |
| 1002 | Composite Review D | REG-2148 | compact-register-38 | Mary Alvarez | compact-jurisdic-32 | 3 | 1002 |
| 1003 | Compact Initiative | REG-2154 | composite-register-39 | April Snyder | composite-jurisdic-33 | 4 | 1003 |

The `data_processors` table records the organisations that process personal data on behalf of a controller. Its columns mirror the controller table's identity fields—`id`, `legal_name`, `registration_number`, `registered_address`—and add `service_type` (describing the nature of the processing service), `contract_start_date` (the date the processing agreement took effect), and two foreign keys: `data_controller_id` and `personal_data_id`. The foreign key `data_controller_id` establishes the one-to-many relationship from controller to processor, while `personal_data_id` links each processor to a specific personal data record. Processor `id` 1, "Adaptive Model", provides `composite-service-81` and began its contract on `2022-01-26` for controller `1000` and personal data record `1`.

**Table `data_processors`**

| id | legal_name | registration_number | registered_address | service_type | contract_start_date | data_controller_id | personal_data_id |
|---|---|---|---|---|---|---|---|
| 1 | Adaptive Model | REG-2136 | regional-register-36 | composite-service-81 | 2022-01-26 | 1000 | 1 |
| 2 | Primary Cluster | REG-2142 | legacy-register-37 | primary-service-82 | 2023-06-10 | 1001 | 2 |
| 3 | Composite Review D | REG-2148 | compact-register-38 | adaptive-service-83 | 2024-11-21 | 1002 | 3 |
| 4 | Compact Initiative | REG-2154 | composite-register-39 | distributed-service-84 | 2025-04-05 | 1003 | 4 |

Privacy representatives are appointed by controllers to act as points of contact for supervisory authorities and data subjects. The `privacy_representatives` table stores each representative's `id`, `name`, `contact_email`, `contact_phone`, `appointment_date`, and the `data_controller_id` they serve. The foreign key `data_controller_id` enforces a one-to-one relationship: each controller appoints exactly one privacy representative. Representative `id` 1000, "Extended Review", can be reached at `Christopher Wilson` via `Joe Tsai` and was appointed on `2022-05-03` to serve controller `1000`.

**Table `privacy_representatives`**

| id | name | contact_email | contact_phone | appointment_date | data_controller_id |
|---|---|---|---|---|---|
| 1000 | Extended Review | Christopher Wilson | Joe Tsai | 2022-05-03 | 1000 |
| 1001 | Pilot Initiative A | Charles Larsen | Stephanie Collins | 2023-10-14 | 1001 |
| 1002 | Baseline Model | Mary Alvarez | Tasha Rodriguez | 2024-03-25 | 1002 |
| 1003 | Distributed Cluster | April Snyder | Walter Pratt | 2025-08-09 | 1003 |

Surfing activity is captured in the `surfing_datas` table, which logs individual browsing sessions. Columns include `id`, `ip_address`, `domain_name`, `operating_system`, `visit_timestamp`, `session_duration`, `is_anonymous`, and the foreign key `data_controller_id`. Each row represents a single visit, and the foreign key ties the session to the controller whose website was visited. Session `id` 1 records an anonymous visit (`is_anonymous` = `true`) from `extended-ip-15` to `Regional Protocol` on a `distributed-operatin-66` operating system, lasting `12.45` seconds and timestamped `2025-12-25T23:21:00`, attributed to controller `1000`.

**Table `surfing_datas`**

| id | ip_address | domain_name | operating_system | visit_timestamp | session_duration | is_anonymous | data_controller_id |
|---|---|---|---|---|---|---|---|
| 1 | extended-ip-15 | Regional Protocol | distributed-operatin-66 | 2025-12-25T23:21:00 | 12.45 | true | 1000 |
| 2 | integrated-ip-16 | Seasonal Programme D | baseline-operatin-67 | 2022-05-09T06:38:00 | 16.90 | false | 1001 |
| 3 | seasonal-ip-17 | Integrated Standard | pilot-operatin-68 | 2023-10-20T13:55:00 | 21.35 | true | 1002 |
| 4 | regional-ip-18 | Extended Framework | extended-operatin-69 | 2024-03-04T20:12:00 | 25.80 | false | 1003 |

Personal data records are stored in the `personal_datas` table, which describes the categories and handling rules for data processed about individuals. Columns include `id`, `data_category`, `consent_status`, `collection_purpose`, `retention_period`, `is_sensitive`, `data_controller_id`, and `data_subject_id`. The foreign key `data_controller_id` links the record to the responsible controller, while `data_subject_id` links it to the individual whose data it is. Record `id` 1, categorised as `legacy-data-97`, has `consent_status` of `pilot-consent-32`, a `collection_purpose` of `distributed-collecti-42`, a `retention_period` of `baseline-retentio-91`, is marked `is_sensitive` = `false`, and belongs to controller `1000` and data subject `1`.

**Table `personal_datas`**

| id | data_category | consent_status | collection_purpose | retention_period | is_sensitive | data_controller_id | data_subject_id |
|---|---|---|---|---|---|---|---|
| 1 | legacy-data-97 | pilot-consent-32 | distributed-collecti-42 | baseline-retentio-91 | false | 1000 | 1 |
| 2 | compact-data-98 | extended-consent-33 | baseline-collecti-43 | pilot-retentio-92 | true | 1001 | 2 |
| 3 | composite-data-99 | integrated-consent-34 | pilot-collecti-44 | extended-retentio-93 | false | 1002 | 3 |
| 4 | primary-data-100 | seasonal-consent-35 | extended-collecti-45 | integrated-retentio-94 | true | 1003 | 4 |

The `data_subjects` table stores the individuals whose personal data is processed. Columns include `id`, `subject_identifier`, `consent_given`, `contact_method`, `data_controller_id`, and `data_processor_id`. The two foreign keys create a many-to-one relationship to both the controller and the processor that handles the subject's data. Subject `id` 1, identified as `SUB-2370`, has `consent_given` = `false`, uses `Peter Fleming` as the `contact_method`, and is associated with controller `1000` and processor `1`.

**Table `data_subjects`**

| id | subject_identifier | consent_given | contact_method | data_controller_id | data_processor_id |
|---|---|---|---|---|---|
| 1 | SUB-2370 | false | Peter Fleming | 1000 | 1 |
| 2 | SUB-2374 | true | Kristen Austin | 1001 | 2 |
| 3 | SUB-2378 | false | Darrell Rodriguez | 1002 | 3 |
| 4 | SUB-2382 | true | Lorraine Garcia | 1003 | 4 |

The `cookies` table records cookie artefacts deployed across the controller's digital properties. Its structure captures cookie identifiers, types, and the technical context in which they are set.

**Table `cookies`**

| cookie_id | purpose | expiration_date | is_essential | third_party_provider | data_controller_id | user_device_id |
|---|---|---|---|---|---|---|
| 392479 | adaptive-purpose-11 | 2025-08-18 | false | integrated-third-22 | 1000 | 1 |
| 6983 | distributed-purpose-12 | 2022-01-02 | true | seasonal-third-23 | 1001 | 2 |
| 19609505 | baseline-purpose-13 | 2023-06-13 | false | regional-third-24 | 1002 | 3 |
| 2106722 | pilot-purpose-14 | 2024-11-24 | true | legacy-third-25 | 1003 | 4 |

The `user_devices` table stores the hardware and software configurations of end-users, linking devices to subjects and the cookies they accept.

**Table `user_devices`**

| id | device_id | device_type | operating_system | browser_version | data_subject_id | cookie_id |
|---|---|---|---|---|---|---|
| 1 | 3744015 | pilot-device-38 | distributed-operatin-66 | adaptive-browser-83 | 1 | 392479 |
| 2 | 392495 | extended-device-39 | baseline-operatin-67 | distributed-browser-84 | 2 | 6983 |
| 3 | 209205 | integrated-device-40 | pilot-operatin-68 | baseline-browser-85 | 3 | 19609505 |
| 4 | 22106999 | seasonal-device-41 | extended-operatin-69 | pilot-browser-86 | 4 | 2106722 |

## Views as Reconstructed Domain Facts

Each view materialises a specific join across the base tables, answering a single analytical question by reassembling normalised rows into a flat, queryable result.

The view `vw_data_controller_data_processor` joins `data_controllers` to `data_processors` on the controller's `data_processor_id` matching the processor's `id`. It answers the question: "Which processor serves which controller?" The row for controller "Adaptive Model" (`id` 1000) shows processor "Adaptive Model" (`id` 1) providing `composite-service-81` under a contract starting `2022-01-26`.

**View `vw_data_controller_data_processor`**

```sql
CREATE VIEW vw_data_controller_data_processor AS
SELECT a.id, a.legal_name, a.registration_number, a.registered_address, b.id AS processor_id, b.legal_name AS processor_legal_name, b.registration_number AS processor_registration_number
FROM data_controllers a JOIN data_processors b ON a.data_processor_id = b.id;
```

| id | legal_name | registration_number | registered_address | processor_id | processor_legal_name | processor_registration_number |
|---|---|---|---|---|---|---|
| 1000 | Adaptive Model | REG-2136 | regional-register-36 | 1 | Adaptive Model | REG-2136 |
| 1001 | Primary Cluster | REG-2142 | legacy-register-37 | 2 | Primary Cluster | REG-2142 |
| 1002 | Composite Review D | REG-2148 | compact-register-38 | 3 | Composite Review D | REG-2148 |
| 1003 | Compact Initiative | REG-2154 | composite-register-39 | 4 | Compact Initiative | REG-2154 |

The view `vw_data_controller_privacy_representative` joins `data_controllers` to `privacy_representatives` on `data_controllers.privacy_representative_id` = `privacy_representatives.id`. It answers: "Which privacy representative is appointed to which controller?" Controller "Adaptive Model" (`id` 1000) is served by representative "Extended Review" (`id` 1000), contactable at `Christopher Wilson` and `Joe Tsai`, appointed on `2022-05-03`.

**View `vw_data_controller_privacy_representative`**

```sql
CREATE VIEW vw_data_controller_privacy_representative AS
SELECT a.id, a.legal_name, a.registration_number, a.registered_address, b.id AS representative_id, b.name AS representative_name, b.contact_email AS representative_contact_email
FROM data_controllers a JOIN privacy_representatives b ON a.privacy_representative_id = b.id;
```

| id | legal_name | registration_number | registered_address | representative_id | representative_name | representative_contact_email |
|---|---|---|---|---|---|---|
| 1000 | Adaptive Model | REG-2136 | regional-register-36 | 1000 | Extended Review | Christopher Wilson |
| 1001 | Primary Cluster | REG-2142 | legacy-register-37 | 1001 | Pilot Initiative A | Charles Larsen |
| 1002 | Composite Review D | REG-2148 | compact-register-38 | 1002 | Baseline Model | Mary Alvarez |
| 1003 | Compact Initiative | REG-2154 | composite-register-39 | 1003 | Distributed Cluster | April Snyder |

The view `vw_data_processor_data_controller` performs the inverse join: it starts from `data_processors` and links to `data_controllers` via `data_processors.data_controller_id`. It answers: "Which controller engages which processor?" Processor `id` 1 ("Adaptive Model") is engaged by controller `1000` ("Adaptive Model") for `composite-service-81`.

**View `vw_data_processor_data_controller`**

```sql
CREATE VIEW vw_data_processor_data_controller AS
SELECT a.id, a.legal_name, a.registration_number, a.registered_address, b.id AS controller_id, b.legal_name AS controller_legal_name, b.registration_number AS controller_registration_number
FROM data_processors a JOIN data_controllers b ON a.data_controller_id = b.id;
```

| id | legal_name | registration_number | registered_address | controller_id | controller_legal_name | controller_registration_number |
|---|---|---|---|---|---|---|
| 1 | Adaptive Model | REG-2136 | regional-register-36 | 1000 | Adaptive Model | REG-2136 |
| 2 | Primary Cluster | REG-2142 | legacy-register-37 | 1001 | Primary Cluster | REG-2142 |
| 3 | Composite Review D | REG-2148 | compact-register-38 | 1002 | Composite Review D | REG-2148 |
| 4 | Compact Initiative | REG-2154 | composite-register-39 | 1003 | Compact Initiative | REG-2154 |

The view `vw_data_processor_personal_data` joins `data_processors` to `personal_datas` on `data_processors.personal_data_id` = `personal_datas.id`. It answers: "Which personal data records does a processor handle?" Processor `id` 1 handles personal data record `id` 1, categorised as `legacy-data-97`, with `consent_status` `pilot-consent-32` and `is_sensitive` = `false`.

**View `vw_data_processor_personal_data`**

```sql
CREATE VIEW vw_data_processor_personal_data AS
SELECT a.id, a.legal_name, a.registration_number, a.registered_address, b.id AS data_id, b.data_category AS data_data_category, b.consent_status AS data_consent_status
FROM data_processors a JOIN personal_datas b ON a.personal_data_id = b.id;
```

| id | legal_name | registration_number | registered_address | data_id | data_data_category | data_consent_status |
|---|---|---|---|---|---|---|
| 1 | Adaptive Model | REG-2136 | regional-register-36 | 1 | legacy-data-97 | pilot-consent-32 |
| 2 | Primary Cluster | REG-2142 | legacy-register-37 | 2 | compact-data-98 | extended-consent-33 |
| 3 | Composite Review D | REG-2148 | compact-register-38 | 3 | composite-data-99 | integrated-consent-34 |
| 4 | Compact Initiative | REG-2154 | composite-register-39 | 4 | primary-data-100 | seasonal-consent-35 |

The view `vw_privacy_representative_data_controller` joins `privacy_representatives` to `data_controllers` on `privacy_representatives.data_controller_id` = `data_controllers.id`. It answers: "Which controller does a privacy representative serve?" Representative "Extended Review" (`id` 1000) serves controller `1000` ("Adaptive Model"), registered as `REG-2136`.

**View `vw_privacy_representative_data_controller`**

```sql
CREATE VIEW vw_privacy_representative_data_controller AS
SELECT a.id, a.name, a.contact_email, a.contact_phone, b.id AS controller_id, b.legal_name AS controller_legal_name, b.registration_number AS controller_registration_number
FROM privacy_representatives a JOIN data_controllers b ON a.data_controller_id = b.id;
```

| id | name | contact_email | contact_phone | controller_id | controller_legal_name | controller_registration_number |
|---|---|---|---|---|---|---|
| 1000 | Extended Review | Christopher Wilson | Joe Tsai | 1000 | Adaptive Model | REG-2136 |
| 1001 | Pilot Initiative A | Charles Larsen | Stephanie Collins | 1001 | Primary Cluster | REG-2142 |
| 1002 | Baseline Model | Mary Alvarez | Tasha Rodriguez | 1002 | Composite Review D | REG-2148 |
| 1003 | Distributed Cluster | April Snyder | Walter Pratt | 1003 | Compact Initiative | REG-2154 |

The view `vw_surfing_data_data_controller` joins `surfing_datas` to `data_controllers` on `surfing_datas.data_controller_id` = `data_controllers.id`. It answers: "Which controller's website was visited in this session?" Session `id` 1, an anonymous visit (`is_anonymous` = `true`) from `extended-ip-15` to `Regional Protocol` lasting `12.45` seconds, is attributed to controller "Adaptive Model" (`id` 1000).

**View `vw_surfing_data_data_controller`**

```sql
CREATE VIEW vw_surfing_data_data_controller AS
SELECT a.id, a.ip_address, a.domain_name, a.operating_system, b.id AS controller_id, b.legal_name AS controller_legal_name, b.registration_number AS controller_registration_number
FROM surfing_datas a JOIN data_controllers b ON a.data_controller_id = b.id;
```

| id | ip_address | domain_name | operating_system | controller_id | controller_legal_name | controller_registration_number |
|---|---|---|---|---|---|---|
| 1 | extended-ip-15 | Regional Protocol | distributed-operatin-66 | 1000 | Adaptive Model | REG-2136 |
| 2 | integrated-ip-16 | Seasonal Programme D | baseline-operatin-67 | 1001 | Primary Cluster | REG-2142 |
| 3 | seasonal-ip-17 | Integrated Standard | pilot-operatin-68 | 1002 | Composite Review D | REG-2148 |
| 4 | regional-ip-18 | Extended Framework | extended-operatin-69 | 1003 | Compact Initiative | REG-2154 |

The view `vw_personal_data_data_controller` joins `personal_datas` to `data_controllers` on `personal_datas.data_controller_id` = `data_controllers.id`. It answers: "Which controller is responsible for this personal data record?" Personal data record `id` 1 (`legacy-data-97`, `pilot-consent-32`, `is_sensitive` = `false`) is the responsibility of controller "Adaptive Model" (`id` 1000).

**View `vw_personal_data_data_controller`**

```sql
CREATE VIEW vw_personal_data_data_controller AS
SELECT a.id, a.data_category, a.consent_status, a.collection_purpose, b.id AS controller_id, b.legal_name AS controller_legal_name, b.registration_number AS controller_registration_number
FROM personal_datas a JOIN data_controllers b ON a.data_controller_id = b.id;
```

| id | data_category | consent_status | collection_purpose | controller_id | controller_legal_name | controller_registration_number |
|---|---|---|---|---|---|---|
| 1 | legacy-data-97 | pilot-consent-32 | distributed-collecti-42 | 1000 | Adaptive Model | REG-2136 |
| 2 | compact-data-98 | extended-consent-33 | baseline-collecti-43 | 1001 | Primary Cluster | REG-2142 |
| 3 | composite-data-99 | integrated-consent-34 | pilot-collecti-44 | 1002 | Composite Review D | REG-2148 |
| 4 | primary-data-100 | seasonal-consent-35 | extended-collecti-45 | 1003 | Compact Initiative | REG-2154 |

The view `vw_personal_data_data_subject` joins `personal_datas` to `data_subjects` on `personal_datas.data_subject_id` = `data_subjects.id`. It answers: "Which data subject does this personal data record belong to?" Record `id` 1 (`legacy-data-97`) belongs to subject `SUB-2370` (`id` 1), who has `consent_given` = `false` and uses `Peter Fleming` as the `contact_method`.

**View `vw_personal_data_data_subject`**

```sql
CREATE VIEW vw_personal_data_data_subject AS
SELECT a.id, a.data_category, a.consent_status, a.collection_purpose, b.id AS subject_id, b.subject_identifier AS subject_subject_identifier, b.consent_given AS subject_consent_given
FROM personal_datas a JOIN data_subjects b ON a.data_subject_id = b.id;
```

| id | data_category | consent_status | collection_purpose | subject_id | subject_subject_identifier | subject_consent_given |
|---|---|---|---|---|---|---|
| 1 | legacy-data-97 | pilot-consent-32 | distributed-collecti-42 | 1 | SUB-2370 | false |
| 2 | compact-data-98 | extended-consent-33 | baseline-collecti-43 | 2 | SUB-2374 | true |
| 3 | composite-data-99 | integrated-consent-34 | pilot-collecti-44 | 3 | SUB-2378 | false |
| 4 | primary-data-100 | seasonal-consent-35 | extended-collecti-45 | 4 | SUB-2382 | true |

The view `vw_data_subject_data_controller` joins `data_subjects` to `data_controllers` on `data_subjects.data_controller_id` = `data_controllers.id`. It answers: "Which controller collects data from this subject?" Subject `SUB-2370` (`id` 1, `consent_given` = `false`) is collected by controller "Adaptive Model" (`id` 1000).

**View `vw_data_subject_data_controller`**

```sql
CREATE VIEW vw_data_subject_data_controller AS
SELECT a.id, a.subject_identifier, a.consent_given, a.contact_method, b.id AS controller_id, b.legal_name AS controller_legal_name, b.registration_number AS controller_registration_number
FROM data_subjects a JOIN data_controllers b ON a.data_controller_id = b.id;
```

| id | subject_identifier | consent_given | contact_method | controller_id | controller_legal_name | controller_registration_number |
|---|---|---|---|---|---|---|
| 1 | SUB-2370 | false | Peter Fleming | 1000 | Adaptive Model | REG-2136 |
| 2 | SUB-2374 | true | Kristen Austin | 1001 | Primary Cluster | REG-2142 |
| 3 | SUB-2378 | false | Darrell Rodriguez | 1002 | Composite Review D | REG-2148 |
| 4 | SUB-2382 | true | Lorraine Garcia | 1003 | Compact Initiative | REG-2154 |

The view `vw_data_subject_data_processor` joins `data_subjects` to `data_processors` on `data_subjects.data_processor_id` = `data_processors.id`. It answers: "Which processor handles data for this subject?" Subject `SUB-2370` (`id` 1) has their data processed by processor `id` 1 ("Adaptive Model"), which provides `composite-service-81`.

**View `vw_data_subject_data_processor`**

```sql
CREATE VIEW vw_data_subject_data_processor AS
SELECT a.id, a.subject_identifier, a.consent_given, a.contact_method, b.id AS processor_id, b.legal_name AS processor_legal_name, b.registration_number AS processor_registration_number
FROM data_subjects a JOIN data_processors b ON a.data_processor_id = b.id;
```

| id | subject_identifier | consent_given | contact_method | processor_id | processor_legal_name | processor_registration_number |
|---|---|---|---|---|---|---|
| 1 | SUB-2370 | false | Peter Fleming | 1 | Adaptive Model | REG-2136 |
| 2 | SUB-2374 | true | Kristen Austin | 2 | Primary Cluster | REG-2142 |
| 3 | SUB-2378 | false | Darrell Rodriguez | 3 | Composite Review D | REG-2148 |
| 4 | SUB-2382 | true | Lorraine Garcia | 4 | Compact Initiative | REG-2154 |

The view `vw_cookie_data_controller` joins `cookies` to `data_controllers` on `cookies.data_controller_id` = `data_controllers.id`. It answers: "Which controller deploys this cookie?" The join reconstructs the controller's identity alongside each cookie's technical attributes.

**View `vw_cookie_data_controller`**

```sql
CREATE VIEW vw_cookie_data_controller AS
SELECT a.cookie_id, a.purpose, a.expiration_date, a.is_essential, b.id AS controller_id, b.legal_name AS controller_legal_name, b.registration_number AS controller_registration_number
FROM cookies a JOIN data_controllers b ON a.data_controller_id = b.id;
```

| cookie_id | purpose | expiration_date | is_essential | controller_id | controller_legal_name | controller_registration_number |
|---|---|---|---|---|---|---|
| 392479 | adaptive-purpose-11 | 2025-08-18 | false | 1000 | Adaptive Model | REG-2136 |
| 6983 | distributed-purpose-12 | 2022-01-02 | true | 1001 | Primary Cluster | REG-2142 |
| 19609505 | baseline-purpose-13 | 2023-06-13 | false | 1002 | Composite Review D | REG-2148 |
| 2106722 | pilot-purpose-14 | 2024-11-24 | true | 1003 | Compact Initiative | REG-2154 |

The view `vw_cookie_user_device` joins `cookies` to `user_devices` on `cookies.user_device_id` = `user_devices.id`. It answers: "Which user device accepts this cookie?" The join pairs cookie identifiers with the operating system and device fingerprint of the accepting user.

**View `vw_cookie_user_device`**

```sql
CREATE VIEW vw_cookie_user_device AS
SELECT a.cookie_id, a.purpose, a.expiration_date, a.is_essential, b.id AS device_id, b.device_id AS device_device_id, b.device_type AS device_device_type
FROM cookies a JOIN user_devices b ON a.user_device_id = b.id;
```

| cookie_id | purpose | expiration_date | is_essential | device_id | device_device_id | device_device_type |
|---|---|---|---|---|---|---|
| 392479 | adaptive-purpose-11 | 2025-08-18 | false | 1 | 3744015 | pilot-device-38 |
| 6983 | distributed-purpose-12 | 2022-01-02 | true | 2 | 392495 | extended-device-39 |
| 19609505 | baseline-purpose-13 | 2023-06-13 | false | 3 | 209205 | integrated-device-40 |
| 2106722 | pilot-purpose-14 | 2024-11-24 | true | 4 | 22106999 | seasonal-device-41 |

The view `vw_user_device_data_subject` joins `user_devices` to `data_subjects` on `user_devices.data_subject_id` = `data_subjects.id`. It answers: "Which data subject owns this device?" The join links device hardware identifiers to the subject's `subject_identifier` and `consent_given` status.

**View `vw_user_device_data_subject`**

```sql
CREATE VIEW vw_user_device_data_subject AS
SELECT a.id, a.device_id, a.device_type, a.operating_system, b.id AS subject_id, b.subject_identifier AS subject_subject_identifier, b.consent_given AS subject_consent_given
FROM user_devices a JOIN data_subjects b ON a.data_subject_id = b.id;
```

| id | device_id | device_type | operating_system | subject_id | subject_subject_identifier | subject_consent_given |
|---|---|---|---|---|---|---|
| 1 | 3744015 | pilot-device-38 | distributed-operatin-66 | 1 | SUB-2370 | false |
| 2 | 392495 | extended-device-39 | baseline-operatin-67 | 2 | SUB-2374 | true |
| 3 | 209205 | integrated-device-40 | pilot-operatin-68 | 3 | SUB-2378 | false |
| 4 | 22106999 | seasonal-device-41 | extended-operatin-69 | 4 | SUB-2382 | true |

The view `vw_user_device_cookie` joins `user_devices` to `cookies` on `user_devices.id` = `cookies.user_device_id`. It answers: "Which cookies are installed on this device?" The join reconstructs the device's cookie inventory, pairing device fingerprints with cookie types and lifetimes.

**View `vw_user_device_cookie`**

```sql
CREATE VIEW vw_user_device_cookie AS
SELECT a.id, a.device_id, a.device_type, a.operating_system, b.cookie_id AS cookie_cookie_id, b.purpose AS cookie_purpose, b.expiration_date AS cookie_expiration_date
FROM user_devices a JOIN cookies b ON a.cookie_id = b.cookie_id;
```

| id | device_id | device_type | operating_system | cookie_cookie_id | cookie_purpose | cookie_expiration_date |
|---|---|---|---|---|---|---|
| 1 | 3744015 | pilot-device-38 | distributed-operatin-66 | 392479 | adaptive-purpose-11 | 2025-08-18 |
| 2 | 392495 | extended-device-39 | baseline-operatin-67 | 6983 | distributed-purpose-12 | 2022-01-02 |
| 3 | 209205 | integrated-device-40 | pilot-operatin-68 | 19609505 | baseline-purpose-13 | 2023-06-13 |
| 4 | 22106999 | seasonal-device-41 | extended-operatin-69 | 2106722 | pilot-purpose-14 | 2024-11-24 |

## Synthesis

The schema models a data governance ecosystem in which controllers sit at the centre, each appointing a privacy representative, engaging a processor, and collecting data from subjects whose browsing sessions, devices, and cookies are logged separately. The normalised base tables enforce referential integrity through foreign keys: `data_controllers.data_processor_id` → `data_processors.id`, `data_controllers.privacy_representative_id` → `privacy_representatives.id`, `data_processors.data_controller_id` → `data_controllers.id`, `data_processors.personal_data_id` → `personal_datas.id`, `privacy_representatives.data_controller_id` → `data_controllers.id`, `surfing_datas.data_controller_id` → `data_controllers.id`, `personal_datas.data_controller_id` → `data_controllers.id`, `personal_datas.data_subject_id` → `data_subjects.id`, and `data_subjects.data_controller_id` → `data_controllers.id` alongside `data_subjects.data_processor_id` → `data_processors.id`. The fourteen views materialise the most common join paths, allowing analysts to ask questions about controller-processor contracts, subject-consent status, browsing attribution, and device-cookie relationships without writing SQL joins. The result is a schema that is both normalised enough to avoid update anomalies and rich enough in its view layer to support operational reporting on data protection compliance.