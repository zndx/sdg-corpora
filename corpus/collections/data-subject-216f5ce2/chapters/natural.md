## Data Processing and Consent Management

Organizations that handle personal information must maintain rigorous records of who the individuals are, which entities control the processing, what processing activities occur, through which channels communication flows, and whether valid consent underpins each activity. This chapter documents the data structures that support such governance, drawing on concrete records from a fictional data protection management system. The system tracks data subjects, data controllers, processing activities, communication channels, consent states, and business partners, while junction tables and materialized views provide the relational glue that turns isolated records into actionable compliance evidence.

**Table `data_subjects`**

| id | subject_identifier | given_name | family_name | email_address | ip_address | cookie_id |
|---|---|---|---|---|---|---|
| 1000 | SUB-2370 | Dana Nguyen | Primary Corridor A | primary-email-70 | extended-ip-15 | 392479 |
| 1001 | SUB-2374 | Susan Levy | Composite Series | adaptive-email-71 | integrated-ip-16 | 6983 |
| 1002 | SUB-2378 | Elizabeth Woods | Compact Assessment | distributed-email-72 | seasonal-ip-17 | 19609505 |
| 1003 | SUB-2382 | Cheryl Bradley | Legacy Survey D | baseline-email-73 | regional-ip-18 | 2106722 |

The `data_subjects` table anchors the entire system. Each row represents an individual whose personal data is processed, identified by a surrogate `id` and a human-readable `subject_identifier` such as `SUB-2370`. The table captures the subject's given name and family name—for instance, Dana Nguyen (SUB-2370) and Susan Levy (SUB-2374)—alongside contact and device identifiers. The `email_address` column holds values like `primary-email-70` and `adaptive-email-71`, while `ip_address` stores network identifiers such as `extended-ip-15` and `integrated-ip-16`. A `cookie_id` column, holding numeric values like `392479` and `6983`, tracks browser-based identifiers. These fields collectively enable an organization to map processing activities back to the specific individuals affected.

**Table `data_controllers`**

| id | legal_name | registration_number | registered_office | court_registry | website_url | created_at | updated_at |
|---|---|---|---|---|---|---|---|
| 1000 | Adaptive Model | REG-2136 | pilot-register-20 | extended-court-39 | https://github.com/chiphuyen/lazynlp | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 1001 | Primary Cluster | REG-2142 | extended-register-21 | integrated-court-40 | https://bugs.launchpad.net/ironic/+bug/1346406 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 1002 | Composite Review D | REG-2148 | integrated-register-22 | seasonal-court-41 | http://en.wikipedia.org/wiki/Hyla_femoralis | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 1003 | Compact Initiative | REG-2154 | seasonal-register-23 | regional-court-42 | https://www.nature.com/articles/nphoton.2014.41 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

At the organizational level, `data_controllers` records the legal entities that determine the purposes and means of processing. Each controller carries a `legal_name`—Adaptive Model, Primary Cluster, Composite Review D, and Compact Initiative—alongside a `registration_number` such as `REG-2136` and `REG-2142`. The `registered_office` and `court_registry` columns store administrative addresses like `pilot-register-20` and `extended-court-39`, while `website_url` provides a web presence, ranging from `https://github.com/chiphuyen/lazynlp` to `http://en.wikipedia.org/wiki/Hyla_femoralis`. Timestamps `created_at` and `updated_at` track the lifecycle of each registration record, with entries dated from January through April 2025.

**Table `data_processing_records`**

| data_processing_record_id | processing_purpose | legal_ground | data_extent | processing_period_start | processing_period_end | is_objection_allowed | data_controller_id |
|---|---|---|---|---|---|---|---|
| 1 | website_improvement | legitimate_interest | behavioral_data | 2024-11-09T22:30:00 | 2023-02-07T01:51:00 | false | 1000 |
| 2 | customer_communication | consent | contact_details | 2025-04-20T05:47:00 | 2024-07-18T08:08:00 | true | 1001 |
| 3 | commercial_offers | legitimate_interest | communication_history | 2022-09-04T12:04:00 | 2025-12-02T15:25:00 | false | 1002 |
| 4 | partner_offers | consent | behavioral_data | 2023-02-15T19:21:00 | 2022-05-13T22:42:00 | true | 1003 |

The heart of the compliance framework lies in `data_processing_records`. Each record documents a distinct processing activity, identified by a numeric `data_processing_record_id`. The `processing_purpose` column describes the reason for processing—values include `website_improvement`, `customer_communication`, `commercial_offers`, and `partner_offers`. The `legal_ground` column specifies the lawful basis, alternating between `legitimate_interest` and `consent`. The `data_extent` field indicates the category of data processed, with entries such as `behavioral_data`, `contact_details`, and `communication_history`. Processing periods are captured by `processing_period_start` and `processing_period_end`, which hold ISO 8601 timestamps; for example, record 1 spans from `2024-11-09T22:30:00` to `2023-02-07T01:51:00`. A boolean `is_objection_allowed` flag indicates whether the data subject may object to the processing. Each record references a `data_controller_id` linking it to the responsible organization.

**Table `communication_channels`**

| id | channel_type | url | is_active |
|---|---|---|---|
| 1000 | website | https://www.nature.com/articles/nphoton.2017.123 | true |
| 1001 | email | http://www.mdpi.com/2073-445X/8/3/43/pdf | false |
| 1002 | chat | https://www.deshaw.com/recruit/UnivListing.html | true |
| 1003 | social_network | https://www.nature.com/articles/nphoton.2015.276 | false |

Communication with data subjects occurs through `communication_channels`, which catalog the mediums an organization uses. The `channel_type` column distinguishes between `website`, `email`, `chat`, and `social_network`. Each channel carries a `url`—for example, `https://www.nature.com/articles/nphoton.2017.123` for the website channel and `http://www.mdpi.com/2073-445X/8/3/43/pdf` for email—and an `is_active` flag indicating whether the channel is currently operational. In the sample data, channels 1000 (website) and 1002 (chat) are active, while channels 1001 (email) and 1003 (social_network) are inactive.

**Table `consent_records`**

| id | consent_timestamp | consent_status | consent_scope | withdrawal_timestamp | data_subject_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|
| 1 | 2024-07-25T18:06:00 | granted | website_improvement | 2022-09-04T20:36:00 | 1000 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | 2025-12-09T01:23:00 | withdrawn | commercial_offers | 2023-02-15T03:53:00 | 1001 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | 2022-05-20T08:40:00 | pending | partner_offers | 2024-07-26T10:10:00 | 1002 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | 2023-10-04T15:57:00 | granted | website_improvement | 2025-12-10T17:27:00 | 1003 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Consent management is captured in `consent_records`, which tie individual subjects to specific processing scopes. Each record holds a `consent_timestamp` indicating when consent was given, a `consent_status` of `granted`, `withdrawn`, or `pending`, and a `consent_scope` that mirrors a processing purpose such as `website_improvement` or `commercial_offers`. The `withdrawal_timestamp` records when consent was revoked, if applicable. A `data_subject_id` foreign key links the consent to the individual, and `created_at`/`updated_at` timestamps track the record's lifecycle. Record 1, for instance, shows subject 1000 granting consent for `website_improvement` on `2024-07-25T18:06:00`, with a withdrawal recorded at `2022-09-04T20:36:00`.

**Table `business_partners`**

| id | partner_name | partner_type | data_sharing_agreement_id | data_controller_id |
|---|---|---|---|---|
| 1 | Composite Review | product_provider | 884359 | 1000 |
| 2 | Compact Initiative A | service_provider | state_et_11 | 1001 |
| 3 | Legacy Model | product_provider | gd_taxc_1211 | 1002 |
| 4 | Regional Cluster | service_provider | 4060639 | 1003 |

When processing involves external entities, `business_partners` records the relationship. Each partner has a `partner_name`—Composite Review, Compact Initiative A, Legacy Model, Regional Cluster—and a `partner_type` of either `product_provider` or `service_provider`. A `data_sharing_agreement_id` such as `884359` or `state_et_11` references the governing agreement, while `data_controller_id` links the partner to the controller that engages it.

The system employs several junction tables to support many-to-many relationships that arise when a single processing record involves multiple subjects, controllers, or channels, and when a single subject or controller participates in multiple processing activities.

**Table `subjects_records`**

| data_subject_id | data_processing_record_id |
|---|---|
| 1000 | 1 |
| 1000 | 2 |
| 1001 | 2 |
| 1001 | 3 |
| 1002 | 3 |
| 1002 | 4 |
| 1003 | 4 |
| 1003 | 1 |

The `subjects_records` table maps data subjects to processing records, enabling an organization to determine which individuals are affected by each processing activity.

**Table `controllers_records`**

| data_controller_id | data_processing_record_id |
|---|---|
| 1000 | 1 |
| 1000 | 2 |
| 1001 | 2 |
| 1001 | 3 |
| 1002 | 3 |
| 1002 | 4 |
| 1003 | 4 |
| 1003 | 1 |

Conversely, `controllers_records` links data controllers to processing records, supporting scenarios where multiple controllers jointly determine the purposes of a single processing operation.

**Table `records_subjects`**

| data_processing_record_id | data_subject_id |
|---|---|
| 1 | 1000 |
| 1 | 1001 |
| 2 | 1001 |
| 2 | 1002 |
| 3 | 1002 |
| 3 | 1003 |
| 4 | 1003 |
| 4 | 1000 |

The `records_subjects` table provides an alternative orientation of the subject-to-processing relationship, facilitating queries that start from a processing record and enumerate its affected subjects.

**Table `records_channels`**

| data_processing_record_id | communication_channel_id |
|---|---|
| 1 | 1000 |
| 1 | 1001 |
| 2 | 1001 |
| 2 | 1002 |
| 3 | 1002 |
| 3 | 1003 |
| 4 | 1003 |
| 4 | 1000 |

`records_channels` associates processing records with communication channels, documenting which channels are used to notify subjects about or collect consent for a given processing activity.

**Table `channels_records`**

| communication_channel_id | data_processing_record_id |
|---|---|
| 1000 | 1 |
| 1000 | 2 |
| 1001 | 2 |
| 1001 | 3 |
| 1002 | 3 |
| 1002 | 4 |
| 1003 | 4 |
| 1003 | 1 |

The `channels_records` table reverses the association, allowing queries that begin with a communication channel and identify all processing records that rely on it.

**Table `records_records`**

| consent_record_id | data_processing_record_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

The `records_records` table captures relationships between processing records themselves, supporting scenarios where one processing activity depends on or references another.

**Table `partners_subjects`**

| business_partner_id | data_subject_id |
|---|---|
| 1 | 1000 |
| 1 | 1001 |
| 2 | 1001 |
| 2 | 1002 |
| 3 | 1002 |
| 3 | 1003 |
| 4 | 1003 |
| 4 | 1000 |

Finally, `partners_subjects` links business partners to data subjects, documenting which individuals are affected by processing activities involving external partners.

These junction tables feed into a suite of materialized views that present joined, analysis-ready results. Each view answers a specific compliance question by combining data from multiple base tables.

**View `v_data_subject_data_processing_record_detail`**

```sql
CREATE VIEW v_data_subject_data_processing_record_detail AS
SELECT a.id, a.subject_identifier, a.given_name, b.data_processing_record_id AS record_data_processing_record_id, b.processing_purpose AS record_processing_purpose, b.legal_ground AS record_legal_ground
FROM data_subjects a
  JOIN subjects_records j ON j.data_subject_id = a.id
  JOIN data_processing_records b ON b.data_processing_record_id = j.data_processing_record_id;
```

| id | subject_identifier | given_name | record_data_processing_record_id | record_processing_purpose | record_legal_ground |
|---|---|---|---|---|---|
| 1000 | SUB-2370 | Dana Nguyen | 1 | website_improvement | legitimate_interest |
| 1000 | SUB-2370 | Dana Nguyen | 2 | customer_communication | consent |
| 1001 | SUB-2374 | Susan Levy | 2 | customer_communication | consent |
| 1001 | SUB-2374 | Susan Levy | 3 | commercial_offers | legitimate_interest |
| 1002 | SUB-2378 | Elizabeth Woods | 3 | commercial_offers | legitimate_interest |
| 1002 | SUB-2378 | Elizabeth Woods | 4 | partner_offers | consent |
| 1003 | SUB-2382 | Cheryl Bradley | 4 | partner_offers | consent |
| 1003 | SUB-2382 | Cheryl Bradley | 1 | website_improvement | legitimate_interest |

The view `v_data_subject_data_processing_record_detail` answers the question: "Which processing activities affect a given data subject, and what are the details of those activities?" It joins `data_subjects` with `data_processing_records` through the junction tables, producing rows that pair a subject's identifier and name with the processing purpose, legal ground, and data extent. For subject SUB-2370 (Dana Nguyen), the view would surface any processing records linked to her `id` of 1000, showing whether the processing is grounded in `legitimate_interest` or `consent` and whether objection is permitted.

**View `v_data_subject_consent_record_detail`**

```sql
CREATE VIEW v_data_subject_consent_record_detail AS
SELECT a.id, a.subject_identifier, a.given_name, b.id AS record_id, b.consent_timestamp AS record_consent_timestamp, b.consent_status AS record_consent_status
FROM data_subjects a
  JOIN subjects_records j ON j.data_subject_id = a.id
  JOIN consent_records b ON b.id = j.consent_record_id;
```

| id | subject_identifier | given_name | record_id | record_consent_timestamp | record_consent_status |
|---|---|---|---|---|---|
| 1000 | SUB-2370 | Dana Nguyen | 1 | 2024-07-25T18:06:00 | granted |
| 1000 | SUB-2370 | Dana Nguyen | 2 | 2025-12-09T01:23:00 | withdrawn |
| 1001 | SUB-2374 | Susan Levy | 2 | 2025-12-09T01:23:00 | withdrawn |
| 1001 | SUB-2374 | Susan Levy | 3 | 2022-05-20T08:40:00 | pending |
| 1002 | SUB-2378 | Elizabeth Woods | 3 | 2022-05-20T08:40:00 | pending |
| 1002 | SUB-2378 | Elizabeth Woods | 4 | 2023-10-04T15:57:00 | granted |
| 1003 | SUB-2382 | Cheryl Bradley | 4 | 2023-10-04T15:57:00 | granted |
| 1003 | SUB-2382 | Cheryl Bradley | 1 | 2024-07-25T18:06:00 | granted |

The view `v_data_subject_consent_record_detail` addresses: "What is the consent status of a given data subject for each processing scope?" By joining `data_subjects` with `consent_records`, it presents each subject alongside their consent timestamp, status, scope, and any withdrawal timestamp. Subject 1001 (Susan Levy), for example, has a consent record showing a `withdrawn` status for the `commercial_offers` scope, with the consent originally given on `2025-12-09T01:23:00` and withdrawn at `2023-02-15T03:53:00`.

**View `v_data_controller_data_processing_record_detail`**

```sql
CREATE VIEW v_data_controller_data_processing_record_detail AS
SELECT a.id, a.legal_name, a.registration_number, b.data_processing_record_id AS record_data_processing_record_id, b.processing_purpose AS record_processing_purpose, b.legal_ground AS record_legal_ground
FROM data_controllers a
  JOIN controllers_records j ON j.data_controller_id = a.id
  JOIN data_processing_records b ON b.data_processing_record_id = j.data_processing_record_id;
```

| id | legal_name | registration_number | record_data_processing_record_id | record_processing_purpose | record_legal_ground |
|---|---|---|---|---|---|
| 1000 | Adaptive Model | REG-2136 | 1 | website_improvement | legitimate_interest |
| 1000 | Adaptive Model | REG-2136 | 2 | customer_communication | consent |
| 1001 | Primary Cluster | REG-2142 | 2 | customer_communication | consent |
| 1001 | Primary Cluster | REG-2142 | 3 | commercial_offers | legitimate_interest |
| 1002 | Composite Review D | REG-2148 | 3 | commercial_offers | legitimate_interest |
| 1002 | Composite Review D | REG-2148 | 4 | partner_offers | consent |
| 1003 | Compact Initiative | REG-2154 | 4 | partner_offers | consent |
| 1003 | Compact Initiative | REG-2154 | 1 | website_improvement | legitimate_interest |

The view `v_data_controller_data_processing_record_detail` answers: "Which processing activities does a data controller oversee, and what are their characteristics?" Joining `data_controllers` with `data_processing_records`, it surfaces each controller's legal name and registration number alongside the processing purpose, legal ground, and data extent. Controller 1000 (Adaptive Model, REG-2136) would appear alongside processing record 1, which covers `website_improvement` under `legitimate_interest` and processes `behavioral_data`.

**View `v_data_controller_consent_record_detail`**

```sql
CREATE VIEW v_data_controller_consent_record_detail AS
SELECT a.id, a.legal_name, a.registration_number, b.id AS record_id, b.consent_timestamp AS record_consent_timestamp, b.consent_status AS record_consent_status
FROM data_controllers a
  JOIN controllers_records j ON j.data_controller_id = a.id
  JOIN consent_records b ON b.id = j.consent_record_id;
```

| id | legal_name | registration_number | record_id | record_consent_timestamp | record_consent_status |
|---|---|---|---|---|---|
| 1000 | Adaptive Model | REG-2136 | 1 | 2024-07-25T18:06:00 | granted |
| 1000 | Adaptive Model | REG-2136 | 2 | 2025-12-09T01:23:00 | withdrawn |
| 1001 | Primary Cluster | REG-2142 | 2 | 2025-12-09T01:23:00 | withdrawn |
| 1001 | Primary Cluster | REG-2142 | 3 | 2022-05-20T08:40:00 | pending |
| 1002 | Composite Review D | REG-2148 | 3 | 2022-05-20T08:40:00 | pending |
| 1002 | Composite Review D | REG-2148 | 4 | 2023-10-04T15:57:00 | granted |
| 1003 | Compact Initiative | REG-2154 | 4 | 2023-10-04T15:57:00 | granted |
| 1003 | Compact Initiative | REG-2154 | 1 | 2024-07-25T18:06:00 | granted |

The view `v_data_controller_consent_record_detail` addresses a more nuanced question: "For which subjects has a data controller obtained consent, and what is the current status?" This view joins `data_controllers` with `consent_records` and `data_subjects`, producing rows that pair the controller's identity with the subject's name and the consent details. It enables auditors to verify that every processing activity grounded in consent has a corresponding, valid consent record tied to the responsible controller.

**View `v_data_processing_record_data_controller`**

```sql
CREATE VIEW v_data_processing_record_data_controller AS
SELECT a.data_processing_record_id, a.processing_purpose, a.legal_ground, a.data_extent, b.id AS controller_id, b.legal_name AS controller_legal_name, b.registration_number AS controller_registration_number
FROM data_processing_records a JOIN data_controllers b ON a.data_controller_id = b.id;
```

| data_processing_record_id | processing_purpose | legal_ground | data_extent | controller_id | controller_legal_name | controller_registration_number |
|---|---|---|---|---|---|---|
| 1 | website_improvement | legitimate_interest | behavioral_data | 1000 | Adaptive Model | REG-2136 |
| 2 | customer_communication | consent | contact_details | 1001 | Primary Cluster | REG-2142 |
| 3 | commercial_offers | legitimate_interest | communication_history | 1002 | Composite Review D | REG-2148 |
| 4 | partner_offers | consent | behavioral_data | 1003 | Compact Initiative | REG-2154 |

The view `v_data_processing_record_data_controller` answers the straightforward question: "Which data controller is responsible for each processing record?" By joining `data_processing_records` with `data_controllers`, it produces rows that pair a processing purpose and legal ground with the controller's legal name, registration number, and registered office. Processing record 3 (commercial_offers, legitimate_interest) would be paired with controller 1002 (Composite Review D, REG-2148, integrated-register-22).

**View `v_data_processing_record_data_subject_detail`**

```sql
CREATE VIEW v_data_processing_record_data_subject_detail AS
SELECT a.data_processing_record_id, a.processing_purpose, a.legal_ground, b.id AS subject_id, b.subject_identifier AS subject_subject_identifier, b.given_name AS subject_given_name
FROM data_processing_records a
  JOIN records_subjects j ON j.data_processing_record_id = a.data_processing_record_id
  JOIN data_subjects b ON b.id = j.data_subject_id;
```

| data_processing_record_id | processing_purpose | legal_ground | subject_id | subject_subject_identifier | subject_given_name |
|---|---|---|---|---|---|
| 1 | website_improvement | legitimate_interest | 1000 | SUB-2370 | Dana Nguyen |
| 1 | website_improvement | legitimate_interest | 1001 | SUB-2374 | Susan Levy |
| 2 | customer_communication | consent | 1001 | SUB-2374 | Susan Levy |
| 2 | customer_communication | consent | 1002 | SUB-2378 | Elizabeth Woods |
| 3 | commercial_offers | legitimate_interest | 1002 | SUB-2378 | Elizabeth Woods |
| 3 | commercial_offers | legitimate_interest | 1003 | SUB-2382 | Cheryl Bradley |
| 4 | partner_offers | consent | 1003 | SUB-2382 | Cheryl Bradley |
| 4 | partner_offers | consent | 1000 | SUB-2370 | Dana Nguyen |

The view `v_data_processing_record_data_subject_detail` addresses: "Which data subjects are affected by each processing record?" Joining `data_processing_records` with `data_subjects` through the junction tables, it produces rows that pair a processing purpose and data extent with the subject's identifier, name, and contact details. This view is essential for conducting data protection impact assessments, as it surfaces the full set of individuals impacted by a given processing activity.

**View `v_data_processing_record_communication_channel_detail`**

```sql
CREATE VIEW v_data_processing_record_communication_channel_detail AS
SELECT a.data_processing_record_id, a.processing_purpose, a.legal_ground, b.id AS channel_id, b.channel_type AS channel_channel_type, b.url AS channel_url
FROM data_processing_records a
  JOIN records_channels j ON j.data_processing_record_id = a.data_processing_record_id
  JOIN communication_channels b ON b.id = j.communication_channel_id;
```

| data_processing_record_id | processing_purpose | legal_ground | channel_id | channel_channel_type | channel_url |
|---|---|---|---|---|---|
| 1 | website_improvement | legitimate_interest | 1000 | website | https://www.nature.com/articles/nphoton.2017.123 |
| 1 | website_improvement | legitimate_interest | 1001 | email | http://www.mdpi.com/2073-445X/8/3/43/pdf |
| 2 | customer_communication | consent | 1001 | email | http://www.mdpi.com/2073-445X/8/3/43/pdf |
| 2 | customer_communication | consent | 1002 | chat | https://www.deshaw.com/recruit/UnivListing.html |
| 3 | commercial_offers | legitimate_interest | 1002 | chat | https://www.deshaw.com/recruit/UnivListing.html |
| 3 | commercial_offers | legitimate_interest | 1003 | social_network | https://www.nature.com/articles/nphoton.2015.276 |
| 4 | partner_offers | consent | 1003 | social_network | https://www.nature.com/articles/nphoton.2015.276 |
| 4 | partner_offers | consent | 1000 | website | https://www.nature.com/articles/nphoton.2017.123 |

The view `v_data_processing_record_communication_channel_detail` answers: "Through which communication channels is each processing activity communicated to data subjects?" By joining `data_processing_records` with `communication_channels`, it pairs a processing purpose with the channel type and URL. Processing record 2 (customer_communication) might be linked to the email channel at `http://www.mdpi.com/2073-445X/8/3/43/pdf`, indicating the medium through which subjects are notified or asked for consent.

**View `v_communication_channel_data_processing_record_detail`**

```sql
CREATE VIEW v_communication_channel_data_processing_record_detail AS
SELECT a.id, a.channel_type, a.url, b.data_processing_record_id AS record_data_processing_record_id, b.processing_purpose AS record_processing_purpose, b.legal_ground AS record_legal_ground
FROM communication_channels a
  JOIN channels_records j ON j.communication_channel_id = a.id
  JOIN data_processing_records b ON b.data_processing_record_id = j.data_processing_record_id;
```

| id | channel_type | url | record_data_processing_record_id | record_processing_purpose | record_legal_ground |
|---|---|---|---|---|---|
| 1000 | website | https://www.nature.com/articles/nphoton.2017.123 | 1 | website_improvement | legitimate_interest |
| 1000 | website | https://www.nature.com/articles/nphoton.2017.123 | 2 | customer_communication | consent |
| 1001 | email | http://www.mdpi.com/2073-445X/8/3/43/pdf | 2 | customer_communication | consent |
| 1001 | email | http://www.mdpi.com/2073-445X/8/3/43/pdf | 3 | commercial_offers | legitimate_interest |
| 1002 | chat | https://www.deshaw.com/recruit/UnivListing.html | 3 | commercial_offers | legitimate_interest |
| 1002 | chat | https://www.deshaw.com/recruit/UnivListing.html | 4 | partner_offers | consent |
| 1003 | social_network | https://www.nature.com/articles/nphoton.2015.276 | 4 | partner_offers | consent |
| 1003 | social_network | https://www.nature.com/articles/nphoton.2015.276 | 1 | website_improvement | legitimate_interest |

The view `v_communication_channel_data_processing_record_detail` reverses the perspective: "Which processing activities rely on a given communication channel?" Joining `communication_channels` with `data_processing_records`, it surfaces each channel's type and URL alongside the processing purposes it supports. This view helps organizations audit whether inactive channels (such as the social_network channel at `https://www.nature.com/articles/nphoton.2015.276`) are still referenced by active processing records.

**View `v_consent_record_data_subject`**

```sql
CREATE VIEW v_consent_record_data_subject AS
SELECT a.id, a.consent_timestamp, a.consent_status, a.consent_scope, b.id AS subject_id, b.subject_identifier AS subject_subject_identifier, b.given_name AS subject_given_name
FROM consent_records a JOIN data_subjects b ON a.data_subject_id = b.id;
```

| id | consent_timestamp | consent_status | consent_scope | subject_id | subject_subject_identifier | subject_given_name |
|---|---|---|---|---|---|---|
| 1 | 2024-07-25T18:06:00 | granted | website_improvement | 1000 | SUB-2370 | Dana Nguyen |
| 2 | 2025-12-09T01:23:00 | withdrawn | commercial_offers | 1001 | SUB-2374 | Susan Levy |
| 3 | 2022-05-20T08:40:00 | pending | partner_offers | 1002 | SUB-2378 | Elizabeth Woods |
| 4 | 2023-10-04T15:57:00 | granted | website_improvement | 1003 | SUB-2382 | Cheryl Bradley |

The view `v_consent_record_data_subject` answers: "Which data subject provided consent for a given consent record?" Joining `consent_records` with `data_subjects`, it pairs the consent timestamp, status, and scope with the subject's name and email address. Consent record 3, for instance, shows subject 1002 (Elizabeth Woods) with a `pending` status for the `partner_offers` scope, indicating that consent has neither been granted nor withdrawn.

**View `v_consent_record_data_processing_record_detail`**

```sql
CREATE VIEW v_consent_record_data_processing_record_detail AS
SELECT a.id, a.consent_timestamp, a.consent_status, b.data_processing_record_id AS record_data_processing_record_id, b.processing_purpose AS record_processing_purpose, b.legal_ground AS record_legal_ground
FROM consent_records a
  JOIN records_records j ON j.consent_record_id = a.id
  JOIN data_processing_records b ON b.data_processing_record_id = j.data_processing_record_id;
```

| id | consent_timestamp | consent_status | record_data_processing_record_id | record_processing_purpose | record_legal_ground |
|---|---|---|---|---|---|
| 1 | 2024-07-25T18:06:00 | granted | 1 | website_improvement | legitimate_interest |
| 1 | 2024-07-25T18:06:00 | granted | 2 | customer_communication | consent |
| 2 | 2025-12-09T01:23:00 | withdrawn | 2 | customer_communication | consent |
| 2 | 2025-12-09T01:23:00 | withdrawn | 3 | commercial_offers | legitimate_interest |
| 3 | 2022-05-20T08:40:00 | pending | 3 | commercial_offers | legitimate_interest |
| 3 | 2022-05-20T08:40:00 | pending | 4 | partner_offers | consent |
| 4 | 2023-10-04T15:57:00 | granted | 4 | partner_offers | consent |
| 4 | 2023-10-04T15:57:00 | granted | 1 | website_improvement | legitimate_interest |

The view `v_consent_record_data_processing_record_detail` addresses: "How does each consent record relate to the corresponding processing record?" By joining `consent_records` with `data_processing_records`, it pairs the consent scope, status, and timestamps with the processing purpose, legal ground, and data extent. This view is critical for verifying that consent records align with the processing activities they are meant to justify—for example, confirming that a consent record with scope `website_improvement` corresponds to a processing record with the same purpose and a `consent` legal ground.

**View `v_business_partner_data_controller`**

```sql
CREATE VIEW v_business_partner_data_controller AS
SELECT a.id, a.partner_name, a.partner_type, a.data_sharing_agreement_id, b.id AS controller_id, b.legal_name AS controller_legal_name, b.registration_number AS controller_registration_number
FROM business_partners a JOIN data_controllers b ON a.data_controller_id = b.id;
```

| id | partner_name | partner_type | data_sharing_agreement_id | controller_id | controller_legal_name | controller_registration_number |
|---|---|---|---|---|---|---|
| 1 | Composite Review | product_provider | 884359 | 1000 | Adaptive Model | REG-2136 |
| 2 | Compact Initiative A | service_provider | state_et_11 | 1001 | Primary Cluster | REG-2142 |
| 3 | Legacy Model | product_provider | gd_taxc_1211 | 1002 | Composite Review D | REG-2148 |
| 4 | Regional Cluster | service_provider | 4060639 | 1003 | Compact Initiative | REG-2154 |

The view `v_business_partner_data_controller` answers: "Which data controller engages each business partner, and under what agreement?" Joining `business_partners` with `data_controllers`, it pairs the partner name and type with the controller's legal name and registration number. Partner 1 (Composite Review, product_provider) is engaged by controller 1000 (Adaptive Model) under data sharing agreement `884359`.

**View `v_business_partner_data_subject_detail`**

```sql
CREATE VIEW v_business_partner_data_subject_detail AS
SELECT a.id, a.partner_name, a.partner_type, b.id AS subject_id, b.subject_identifier AS subject_subject_identifier, b.given_name AS subject_given_name
FROM business_partners a
  JOIN partners_subjects j ON j.business_partner_id = a.id
  JOIN data_subjects b ON b.id = j.data_subject_id;
```

| id | partner_name | partner_type | subject_id | subject_subject_identifier | subject_given_name |
|---|---|---|---|---|---|
| 1 | Composite Review | product_provider | 1000 | SUB-2370 | Dana Nguyen |
| 1 | Composite Review | product_provider | 1001 | SUB-2374 | Susan Levy |
| 2 | Compact Initiative A | service_provider | 1001 | SUB-2374 | Susan Levy |
| 2 | Compact Initiative A | service_provider | 1002 | SUB-2378 | Elizabeth Woods |
| 3 | Legacy Model | product_provider | 1002 | SUB-2378 | Elizabeth Woods |
| 3 | Legacy Model | product_provider | 1003 | SUB-2382 | Cheryl Bradley |
| 4 | Regional Cluster | service_provider | 1003 | SUB-2382 | Cheryl Bradley |
| 4 | Regional Cluster | service_provider | 1000 | SUB-2370 | Dana Nguyen |

The view `v_business_partner_data_subject_detail` addresses the most comprehensive question: "Which data subjects are affected by processing activities involving a given business partner?" By joining `business_partners` with `data_subjects` through the junction tables, it produces rows that pair the partner's name and type with the subject's identifier, name, and contact details. This view supports partner impact assessments, enabling organizations to determine the scope of individuals affected when a business partner processes personal data on their behalf.

## Synthesis

The data protection management system described here organizes personal data governance around six core entities—data subjects, data controllers, processing records, communication channels, consent records, and business partners—connected through junction tables and materialized views. The base tables store the raw facts: who the individuals are, which organizations control processing, what activities occur, through which channels communication flows, what consent states exist, and which partners are involved. The junction tables resolve the many-to-many relationships that arise in practice, where a single processing activity may affect multiple subjects, involve multiple controllers, or rely on multiple channels. The materialized views synthesize these relationships into analysis-ready formats, each answering a specific compliance question—from identifying all subjects affected by a processing activity to verifying that consent records align with the legal grounds claimed for processing. Together, these structures form the backbone of an organization's ability to demonstrate accountability, respond to subject rights requests, and maintain an auditable record of its data processing operations.