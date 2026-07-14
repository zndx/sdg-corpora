## Data Governance and Privacy Compliance: Organizational Relationships and Processing Records

Modern data protection frameworks require organizations to maintain rigorous documentation of who controls personal information, who processes it on their behalf, and how individuals' data flows through digital systems. This chapter examines the architecture of data governance as manifested in operational records: the legal entities responsible for data handling, the service providers executing processing activities, the privacy officers appointed to oversee compliance, and the granular records of individual data subjects, their consent preferences, and the technical artifacts—cookies, devices, browsing sessions—that capture personal information in digital environments. The interconnections between these records form a traceable chain of accountability, from organizational registration through to individual consent and technical implementation.

## Data Controllers and Organizational Registration

At the foundation of any data governance framework are the data controllers—the legal entities that determine the purposes and means of processing personal information. Each controller is registered with a unique identifier, a formal legal name, a registration number, a registered address, and a designated contact email within a specific jurisdiction.

**Table `data_controllers`**

| id | legal_name | registration_number | registered_address | contact_email | jurisdiction | data_processor_id | privacy_representative_id |
|---|---|---|---|---|---|---|---|
| 1000 | Adaptive Model | REG-2136 | regional-register-36 | Christopher Wilson | regional-jurisdic-30 | 1 | 1000 |
| 1001 | Primary Cluster | REG-2142 | legacy-register-37 | Charles Larsen | legacy-jurisdic-31 | 2 | 1001 |
| 1002 | Composite Review D | REG-2148 | compact-register-38 | Mary Alvarez | compact-jurisdic-32 | 3 | 1002 |
| 1003 | Compact Initiative | REG-2154 | composite-register-39 | April Snyder | composite-jurisdic-33 | 4 | 1003 |

The registry contains four distinct controllers, each operating under a different jurisdictional regime. Adaptive Model (REG-2136) is registered under regional-jurisdic-30 and can be reached through Christopher Wilson at its regional-register-36 address. Primary Cluster (REG-2142) operates under legacy-jurisdic-31, with Charles Larsen as the point of contact. Composite Review D (REG-2148) falls under compact-jurisdic-32, managed by Mary Alvarez. Compact Initiative (REG-2154) is the fourth entity, registered under composite-jurisdic-33, with April Snyder listed as the contact. Each controller carries forward references to both a data processor and a privacy representative, establishing the primary relationships that structure the remainder of the governance framework.

The relationship between controllers and their appointed processors is captured in a dedicated view that pairs each controller with the processor it engages.

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

This view reveals a one-to-one mapping: Adaptive Model engages processor 1, Primary Cluster engages processor 2, Composite Review D engages processor 3, and Compact Initiative engages processor 4. The alignment suggests a structured engagement model where each controller maintains a single primary processing relationship. The reverse perspective—examining processors and the controllers they serve—confirms this symmetry.

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

Processor 1 serves Adaptive Model, processor 2 serves Primary Cluster, and so on through processor 4 serving Compact Initiative. The bidirectional view confirms that the processor-to-controller linkage is reciprocal and unambiguous, with no processor serving multiple controllers and no controller engaging multiple processors in this dataset.

## Data Processors and Service Contracts

Data processors operate under formal service agreements with their controllers, and each processor record captures the nature of the service provided, the date the contractual relationship commenced, and the categories of personal data it handles.

**Table `data_processors`**

| id | legal_name | registration_number | registered_address | service_type | contract_start_date | data_controller_id | personal_data_id |
|---|---|---|---|---|---|---|---|
| 1 | Adaptive Model | REG-2136 | regional-register-36 | composite-service-81 | 2022-01-26 | 1000 | 1 |
| 2 | Primary Cluster | REG-2142 | legacy-register-37 | primary-service-82 | 2023-06-10 | 1001 | 2 |
| 3 | Composite Review D | REG-2148 | compact-register-38 | adaptive-service-83 | 2024-11-21 | 1002 | 3 |
| 4 | Compact Initiative | REG-2154 | composite-register-39 | distributed-service-84 | 2025-04-05 | 1003 | 4 |

The four processors mirror the controllers in name and registration detail, reflecting their operational alignment. Adaptive Model (processor 1) provides composite-service-81, with a contract beginning on 2022-01-26, and handles personal data record 1. Primary Cluster (processor 2) delivers primary-service-82 under a contract dated 2023-06-10, processing personal data record 2. Composite Review D (processor 3) offers adaptive-service-83 starting 2024-11-21, managing personal data record 3. Compact Initiative (processor 4) provides distributed-service-84 with a contract effective 2025-04-05, handling personal data record 4.

The linkage between processors and the personal data they handle is explicit in the joined view.

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

Processor 1 (Adaptive Model) processes legacy-data-97 for controller 1000. Processor 2 (Primary Cluster) processes compact-data-98 for controller 1001. Processor 3 (Composite Review D) processes composite-data-99 for controller 1002. Processor 4 (Compact Initiative) processes primary-data-100 for controller 1003. Each processor is assigned exactly one personal data category, reinforcing the tightly coupled structure of this governance model.

## Privacy Representatives and Oversight

Data protection regulations typically require controllers to appoint a privacy representative or data protection officer who serves as the point of contact for regulatory authorities and data subjects. The privacy representatives table records these appointments with full contact details and the date each representative was formally designated.

**Table `privacy_representatives`**

| id | name | contact_email | contact_phone | appointment_date | data_controller_id |
|---|---|---|---|---|---|
| 1000 | Extended Review | Christopher Wilson | Joe Tsai | 2022-05-03 | 1000 |
| 1001 | Pilot Initiative A | Charles Larsen | Stephanie Collins | 2023-10-14 | 1001 |
| 1002 | Baseline Model | Mary Alvarez | Tasha Rodriguez | 2024-03-25 | 1002 |
| 1003 | Distributed Cluster | April Snyder | Walter Pratt | 2025-08-09 | 1003 |

Extended Review (ID 1000) was appointed on 2022-05-03 and can be contacted through Christopher Wilson at the phone number Joe Tsai, overseeing controller 1000 (Adaptive Model). Pilot Initiative A (ID 1001), appointed 2023-10-14, is reachable via Charles Larsen at Stephanie Collins, serving controller 1001 (Primary Cluster). Baseline Model (ID 1002), appointed 2024-03-25, contacts Mary Alvarez at Tasha Rodriguez, responsible for controller 1002 (Composite Review D). Distributed Cluster (ID 1003), appointed 2025-08-09, is reachable through April Snyder at Walter Pratt, overseeing controller 1003 (Compact Initiative).

The controller-to-representative relationship is directly queryable.

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

Adaptive Model (1000) is represented by Extended Review (1000), Primary Cluster (1001) by Pilot Initiative A (1001), Composite Review D (1002) by Baseline Model (1002), and Compact Initiative (1003) by Distributed Cluster (1003). The reverse view confirms the same mapping from the representative's perspective.

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

Representative 1000 serves controller 1000, representative 1001 serves controller 1001, and so forth. The one-to-one correspondence between controllers and privacy representatives ensures clear lines of accountability and regulatory contact.

## Data Subjects and Consent Management

The individuals whose personal information is processed—the data subjects—are recorded with unique identifiers, consent status, and preferred contact methods. Each subject is associated with a specific controller and processor, establishing the chain of responsibility for their data.

**Table `data_subjects`**

| id | subject_identifier | consent_given | contact_method | data_controller_id | data_processor_id |
|---|---|---|---|---|---|
| 1 | SUB-2370 | false | Peter Fleming | 1000 | 1 |
| 2 | SUB-2374 | true | Kristen Austin | 1001 | 2 |
| 3 | SUB-2378 | false | Darrell Rodriguez | 1002 | 3 |
| 4 | SUB-2382 | true | Lorraine Garcia | 1003 | 4 |

Subject SUB-2370 (ID 1) has not given consent (consent_given is false) and is contacted through Peter Fleming. This subject is associated with controller 1000 (Adaptive Model) and processor 1. Subject SUB-2374 (ID 2) has given consent and is reachable via Kristen Austin, linked to controller 1001 (Primary Cluster) and processor 2. Subject SUB-2378 (ID 3) has not given consent, with Darrell Rodriguez as the contact, associated with controller 1002 (Composite Review D) and processor 3. Subject SUB-2382 (ID 4) has given consent, contacted through Lorraine Garcia, linked to controller 1003 (Compact Initiative) and processor 4.

The subject-to-controller linkage is captured in the joined view.

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

Subject SUB-2370 is under the control of Adaptive Model (1000), SUB-2374 under Primary Cluster (1001), SUB-2378 under Composite Review D (1002), and SUB-2382 under Compact Initiative (1003). Each subject maps to exactly one controller, and the consent status varies: two subjects have given consent (SUB-2374 and SUB-2382), while two have not (SUB-2370 and SUB-2378).

The subject-to-processor relationship is equally direct.

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

SUB-2370 is processed by processor 1 (Adaptive Model), SUB-2374 by processor 2 (Primary Cluster), SUB-2378 by processor 3 (Composite Review D), and SUB-2382 by processor 4 (Compact Initiative). The alignment between controller, processor, and subject creates a complete accountability chain for each individual's data.

## Personal Data Categories and Handling Rules

Personal data records define what categories of information are collected, the purpose of collection, the retention period, whether the data is classified as sensitive, and the consent status governing its processing.

**Table `personal_datas`**

| id | data_category | consent_status | collection_purpose | retention_period | is_sensitive | data_controller_id | data_subject_id |
|---|---|---|---|---|---|---|---|
| 1 | legacy-data-97 | pilot-consent-32 | distributed-collecti-42 | baseline-retentio-91 | false | 1000 | 1 |
| 2 | compact-data-98 | extended-consent-33 | baseline-collecti-43 | pilot-retentio-92 | true | 1001 | 2 |
| 3 | composite-data-99 | integrated-consent-34 | pilot-collecti-44 | extended-retentio-93 | false | 1002 | 3 |
| 4 | primary-data-100 | seasonal-consent-35 | extended-collecti-45 | integrated-retentio-94 | true | 1003 | 4 |

Personal data record 1 falls under the legacy-data-97 category, was collected under pilot-consent-32 for distributed-collecti-42 purposes, has a retention period of baseline-retentio-91, is not classified as sensitive, and is associated with controller 1000 and data subject 1. Record 2 is compact-data-98, collected under extended-consent-33 for baseline-collecti-43 purposes, retained under pilot-retentio-92, classified as sensitive, linked to controller 1001 and subject 2. Record 3 is composite-data-99, collected under integrated-consent-34 for pilot-collecti-44 purposes, retained under extended-retentio-93, not sensitive, associated with controller 1002 and subject 3. Record 4 is primary-data-100, collected under seasonal-consent-35 for extended-collecti-45 purposes, retained under integrated-retentio-94, classified as sensitive, linked to controller 1003 and subject 4.

The controller-to-personal-data relationship is explicit.

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

Controller 1000 (Adaptive Model) manages legacy-data-97, controller 1001 (Primary Cluster) manages compact-data-98, controller 1002 (Composite Review D) manages composite-data-99, and controller 1003 (Compact Initiative) manages primary-data-100. Each controller is responsible for exactly one personal data category in this dataset.

The subject-to-personal-data linkage completes the individual-level picture.

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

Data subject 1 is associated with legacy-data-97, subject 2 with compact-data-98, subject 3 with composite-data-99, and subject 4 with primary-data-100. The one-to-one mapping between subjects and personal data records means each individual's data is governed by a single set of handling rules, retention periods, and sensitivity classifications.

## Surfing Data and Digital Footprints

Beyond structured personal data records, organizations capture technical browsing information through surfing data records. These records document IP addresses, domain names visited, operating systems, timestamps, session durations, and whether the visit was anonymous.

**Table `surfing_datas`**

| id | ip_address | domain_name | operating_system | visit_timestamp | session_duration | is_anonymous | data_controller_id |
|---|---|---|---|---|---|---|---|
| 1 | extended-ip-15 | Regional Protocol | distributed-operatin-66 | 2025-12-25T23:21:00 | 12.45 | true | 1000 |
| 2 | integrated-ip-16 | Seasonal Programme D | baseline-operatin-67 | 2022-05-09T06:38:00 | 16.90 | false | 1001 |
| 3 | seasonal-ip-17 | Integrated Standard | pilot-operatin-68 | 2023-10-20T13:55:00 | 21.35 | true | 1002 |
| 4 | regional-ip-18 | Extended Framework | extended-operatin-69 | 2024-03-04T20:12:00 | 25.80 | false | 1003 |

Surfing data record 1 originates from extended-ip-15, visited Regional Protocol on distributed-operatin-66 at 2025-12-25T23:21:00, with a session duration of 12.45 minutes, marked as anonymous, and attributed to controller 1000. Record 2 comes from integrated-ip-16, visited Seasonal Programme D on baseline-operatin-67 at 2022-05-09T06:38:00, lasting 16.90 minutes, not anonymous, linked to controller 1001. Record 3 originates from seasonal-ip-17, visited Integrated Standard on pilot-operatin-68 at 2023-10-20T13:55:00, lasting 21.35 minutes, marked anonymous, associated with controller 1002. Record 4 comes from regional-ip-18, visited Extended Framework on extended-operatin-69 at 2024-03-04T20:12:00, lasting 25.80 minutes, not anonymous, linked to controller 1003.

The controller attribution for surfing data is captured in the joined view.

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

Controller 1000 (Adaptive Model) is associated with the anonymous visit from extended-ip-15 to Regional Protocol. Controller 1001 (Primary Cluster) is associated with the non-anonymous visit from integrated-ip-16 to Seasonal Programme D. Controller 1002 (Composite Review D) is associated with the anonymous visit from seasonal-ip-17 to Integrated Standard. Controller 1003 (Compact Initiative) is associated with the non-anonymous visit from regional-ip-18 to Extended Framework. The alternating pattern of anonymous and non-anonymous visits may reflect different privacy configurations or user preferences across the controllers' domains.

## Cookies and User Devices

The technical infrastructure supporting data collection includes cookies and user devices, which serve as the mechanisms through which browsing sessions are tracked and attributed to individuals.

**Table `cookies`**

| cookie_id | purpose | expiration_date | is_essential | third_party_provider | data_controller_id | user_device_id |
|---|---|---|---|---|---|---|
| 392479 | adaptive-purpose-11 | 2025-08-18 | false | integrated-third-22 | 1000 | 1 |
| 6983 | distributed-purpose-12 | 2022-01-02 | true | seasonal-third-23 | 1001 | 2 |
| 19609505 | baseline-purpose-13 | 2023-06-13 | false | regional-third-24 | 1002 | 3 |
| 2106722 | pilot-purpose-14 | 2024-11-24 | true | legacy-third-25 | 1003 | 4 |

**Table `user_devices`**

| id | device_id | device_type | operating_system | browser_version | data_subject_id | cookie_id |
|---|---|---|---|---|---|---|
| 1 | 3744015 | pilot-device-38 | distributed-operatin-66 | adaptive-browser-83 | 1 | 392479 |
| 2 | 392495 | extended-device-39 | baseline-operatin-67 | distributed-browser-84 | 2 | 6983 |
| 3 | 209205 | integrated-device-40 | pilot-operatin-68 | baseline-browser-85 | 3 | 19609505 |
| 4 | 22106999 | seasonal-device-41 | extended-operatin-69 | pilot-browser-86 | 4 | 2106722 |

The cookie-to-device relationship reveals how tracking mechanisms are deployed across hardware.

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

The user-device-to-subject linkage connects technical artifacts to the individuals they represent.

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

The device-to-cookie relationship completes the technical attribution chain.

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

The records examined in this chapter form an integrated governance structure. Data controllers register as legal entities within defined jurisdictions, appoint privacy representatives for regulatory oversight, and engage data processors under formal service contracts. Each processor handles specific categories of personal data, which are classified by sensitivity, retention period, and consent status. Data subjects provide—or withhold—consent, and their personal information is tracked through technical artifacts including cookies, user devices, and browsing session records. The one-to-one mappings observed across most relationships suggest a tightly controlled, minimally complex governance model where each entity has a single counterpart in its primary operational relationship. This structure simplifies accountability tracing: from controller to processor to personal data category to data subject, with privacy representatives providing an independent oversight layer and surfing data capturing the technical footprint of each interaction. Practitioners managing data protection programs should ensure that their own records maintain this level of traceability, as regulatory compliance depends on the ability to demonstrate, for any individual's data, exactly which controller determined its processing, which processor executed it, what safeguards apply, and what consent governs its use.

## Data appendix

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
