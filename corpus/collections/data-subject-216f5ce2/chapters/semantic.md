## Ontology-Grounded Relational Modelling of a Data-Privacy Compliance Domain

The domain under examination captures the regulatory anatomy of personal data processing: who the data subjects are, which organisations act as controllers, what processing activities occur, through which communication channels they are reached, how consent is recorded and withdrawn, and which business partners participate in data-sharing arrangements. The ontology treats each of these concepts as a distinct class with typed attributes, and the relational schema materialises those classes as base tables whose primary keys are referenced by junction tables that encode many-to-many relationships. Views then reassemble the normalised facts into domain-level narratives—answering questions such as "which processing records belong to a given subject?" or "what is the consent posture of a controller's activities?" The following sections walk through the entity types, their attributes, the cardinality-bounded relationships that become foreign keys and junction tables, and finally the views that reconstruct the original domain facts.

### Data Subjects and Controllers

The two principal actor classes are `data_subjects` and `data_controllers`. A data subject represents a natural person whose personal data is processed; a data controller represents the legal entity that determines the purposes and means of that processing.

**Table `data_subjects`**

| id | subject_identifier | given_name | family_name | email_address | ip_address | cookie_id |
|---|---|---|---|---|---|---|
| 1000 | SUB-2370 | Dana Nguyen | Primary Corridor A | primary-email-70 | extended-ip-15 | 392479 |
| 1001 | SUB-2374 | Susan Levy | Composite Series | adaptive-email-71 | integrated-ip-16 | 6983 |
| 1002 | SUB-2378 | Elizabeth Woods | Compact Assessment | distributed-email-72 | seasonal-ip-17 | 19609505 |
| 1003 | SUB-2382 | Cheryl Bradley | Legacy Survey D | baseline-email-73 | regional-ip-18 | 2106722 |

The `data_subjects` table stores a surrogate integer `id` alongside a business-level `subject_identifier` (for example, `SUB-2370`), the person's `given_name` and `family_name` (such as `Dana Nguyen` and `Susan Levy`), and three distinct pseudonymisation tokens: `email_address` (`primary-email-70`, `adaptive-email-71`), `ip_address` (`extended-ip-15`, `integrated-ip-16`), and `cookie_id` (`392479`, `6983`). The surrogate key `id` is the natural anchor for all foreign-key references from downstream tables.

**Table `data_controllers`**

| id | legal_name | registration_number | registered_office | court_registry | website_url | created_at | updated_at |
|---|---|---|---|---|---|---|---|
| 1000 | Adaptive Model | REG-2136 | pilot-register-20 | extended-court-39 | https://github.com/chiphuyen/lazynlp | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 1001 | Primary Cluster | REG-2142 | extended-register-21 | integrated-court-40 | https://bugs.launchpad.net/ironic/+bug/1346406 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 1002 | Composite Review D | REG-2148 | integrated-register-22 | seasonal-court-41 | http://en.wikipedia.org/wiki/Hyla_femoralis | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 1003 | Compact Initiative | REG-2154 | seasonal-register-23 | regional-court-42 | https://www.nature.com/articles/nphoton.2014.41 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The `data_controllers` table mirrors this structure with a surrogate `id`, a `legal_name` (`Adaptive Model`, `Primary Cluster`, `Composite Review D`, `Compact Initiative`), a `registration_number` (`REG-2136` through `REG-2154`), a `registered_office`, a `court_registry`, a `website_url`, and audit timestamps `created_at` and `updated_at`. The controller's `id` is referenced by `data_processing_records` (column `data_controller_id`) and by `business_partners` (column `data_controller_id`), establishing a one-to-many relationship: each controller can be associated with multiple processing records and multiple partner entries.

### Processing Records and Communication Channels

The central activity class is `data_processing_records`, which captures individual processing operations.

**Table `data_processing_records`**

| data_processing_record_id | processing_purpose | legal_ground | data_extent | processing_period_start | processing_period_end | is_objection_allowed | data_controller_id |
|---|---|---|---|---|---|---|---|
| 1 | website_improvement | legitimate_interest | behavioral_data | 2024-11-09T22:30:00 | 2023-02-07T01:51:00 | false | 1000 |
| 2 | customer_communication | consent | contact_details | 2025-04-20T05:47:00 | 2024-07-18T08:08:00 | true | 1001 |
| 3 | commercial_offers | legitimate_interest | communication_history | 2022-09-04T12:04:00 | 2025-12-02T15:25:00 | false | 1002 |
| 4 | partner_offers | consent | behavioral_data | 2023-02-15T19:21:00 | 2022-05-13T22:42:00 | true | 1003 |

Each row carries a `data_processing_record_id` (1 through 4), a `processing_purpose` (`website_improvement`, `customer_communication`, `commercial_offers`, `partner_offers`), a `legal_ground` (`legitimate_interest` or `consent`), a `data_extent` (`behavioral_data`, `contact_details`, `communication_history`), a processing window defined by `processing_period_start` and `processing_period_end`, a boolean `is_objection_allowed`, and a foreign key `data_controller_id` pointing to `data_controllers.id`. The foreign key enforces the constraint that every processing record is attributable to exactly one controller.

**Table `communication_channels`**

| id | channel_type | url | is_active |
|---|---|---|---|
| 1000 | website | https://www.nature.com/articles/nphoton.2017.123 | true |
| 1001 | email | http://www.mdpi.com/2073-445X/8/3/43/pdf | false |
| 1002 | chat | https://www.deshaw.com/recruit/UnivListing.html | true |
| 1003 | social_network | https://www.nature.com/articles/nphoton.2015.276 | false |

Communication channels are modelled as a separate entity class with surrogate `id`, a `channel_type` (`website`, `email`, `chat`, `social_network`), a `url`, and an `is_active` flag. Channels participate in many-to-many relationships with processing records through the junction tables `records_channels` and `channels_records`, which are discussed below.

### Consent Records

Consent is a first-class entity in this ontology, captured in `consent_records`.

**Table `consent_records`**

| id | consent_timestamp | consent_status | consent_scope | withdrawal_timestamp | data_subject_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|
| 1 | 2024-07-25T18:06:00 | granted | website_improvement | 2022-09-04T20:36:00 | 1000 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | 2025-12-09T01:23:00 | withdrawn | commercial_offers | 2023-02-15T03:53:00 | 1001 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | 2022-05-20T08:40:00 | pending | partner_offers | 2024-07-26T10:10:00 | 1002 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | 2023-10-04T15:57:00 | granted | website_improvement | 2025-12-10T17:27:00 | 1003 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Each consent record has a surrogate `id`, a `consent_timestamp`, a `consent_status` (`granted`, `withdrawn`, `pending`), a `consent_scope` that aligns with a processing purpose (`website_improvement`, `commercial_offers`, `partner_offers`), a `withdrawal_timestamp`, a foreign key `data_subject_id` referencing `data_subjects.id`, and audit timestamps. The `data_subject_id` foreign key binds the consent to exactly one subject, while the `consent_scope` column semantically links the consent to a processing purpose without requiring a direct foreign key to `data_processing_records`.

### Business Partners

The `business_partners` table captures third-party organisations involved in data-sharing.

**Table `business_partners`**

| id | partner_name | partner_type | data_sharing_agreement_id | data_controller_id |
|---|---|---|---|---|
| 1 | Composite Review | product_provider | 884359 | 1000 |
| 2 | Compact Initiative A | service_provider | state_et_11 | 1001 |
| 3 | Legacy Model | product_provider | gd_taxc_1211 | 1002 |
| 4 | Regional Cluster | service_provider | 4060639 | 1003 |

Each partner row stores a surrogate `id`, a `partner_name` (`Composite Review`, `Compact Initiative A`, `Legacy Model`, `Regional Cluster`), a `partner_type` (`product_provider` or `service_provider`), a `data_sharing_agreement_id`, and a foreign key `data_controller_id` referencing the controller that engages the partner. This establishes a one-to-many relationship from controller to partners.

### Junction Tables and Many-to-Many Relationships

The ontology's many-to-many relationships are materialised through dedicated junction tables. Each junction table contains two foreign-key columns that reference the primary keys of the participating entity tables, thereby enforcing referential integrity while allowing any number of associations.

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

The `subjects_records` table links data subjects to processing records. Its two foreign-key columns reference `data_subjects.id` and `data_processing_records.data_processing_record_id`, respectively. A row in this table asserts that a particular subject is involved in a particular processing activity.

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

The `controllers_records` table provides an alternative linkage between `data_controllers.id` and `data_processing_records.data_processing_record_id`. While `data_processing_records` already carries a `data_controller_id` foreign key, this junction table allows a processing record to be associated with multiple controllers (e.g., joint controllership), extending the one-to-many relationship into a many-to-many one.

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

The `records_subjects` table is the inverse of `subjects_records`: it references `data_processing_records.data_processing_record_id` first and `data_subjects.id` second. The presence of both `subjects_records` and `records_subjects` reflects an ontology design choice to model the relationship from both perspectives, which simplifies certain view definitions and query patterns.

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

The `records_channels` table links `data_processing_records.data_processing_record_id` to `communication_channels.id`, enabling a processing record to be associated with multiple channels and vice versa.

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

The `channels_records` table is the inverse of `records_channels`, referencing `communication_channels.id` first and `data_processing_records.data_processing_record_id` second. Again, the bidirectional junction tables support symmetric query patterns.

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

The `records_records` table is a self-referencing junction that links `data_processing_records.data_processing_record_id` to itself. This supports modelling of relationships between processing records—such as dependency, sequencing, or grouping—without requiring additional attributes on the base table.

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

The `partners_subjects` table links `business_partners.id` to `data_subjects.id`, capturing which data subjects are affected by which business partners. This completes the partner-subject axis of the ontology.

### View Definitions and Domain Interpretations

Views in this schema are derived relations that join base tables and junction tables to reconstruct domain-level facts. Each view answers a specific analytical question by denormalising the normalised schema.

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

This view joins `data_subjects` to `data_processing_records` through the `subjects_records` junction table, producing a denormalised row per subject-processing association. It answers the question: "Which processing records involve a given data subject?" For example, a row might show `SUB-2370` (Dana Nguyen) alongside the `website_improvement` processing purpose with legal ground `legitimate_interest`, allowing a compliance officer to trace a subject's exposure to specific processing activities.

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

This view joins `data_subjects` to `consent_records` on `data_subjects.id = consent_records.data_subject_id`, producing one row per consent held by a subject. It answers: "What is the consent posture of a given data subject?" A row for `SUB-2374` (Susan Levy) might show a `consent_status` of `withdrawn` with `consent_scope` `commercial_offers` and a `withdrawal_timestamp` of `2023-02-15T03:53:00`, providing an auditable trail of consent lifecycle events.

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

This view joins `data_controllers` to `data_processing_records` via `controllers_records`, producing a denormalised view of each controller's processing activities. It answers: "What processing does a given controller perform?" A row for `Adaptive Model` (controller id 1000) might show the `website_improvement` purpose with `data_extent` `behavioral_data` and `is_objection_allowed` set to `false`, giving a controller-level summary of processing obligations.

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

This view joins `data_controllers` to `consent_records` through `data_processing_records` (linking controller to records, then records to subjects, then subjects to consent), producing a consolidated view of consent held by subjects whose data is processed by a given controller. It answers: "What consents are relevant to a controller's processing?" A row might associate `Primary Cluster` (id 1001) with a `withdrawn` consent for `commercial_offers`, enabling the controller to assess whether processing on that legal ground remains valid.

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

This view joins `data_processing_records` to `data_controllers` on `data_processing_records.data_controller_id = data_controllers.id`, producing a simple one-row-per-record view that enriches each processing record with the controller's full legal identity. It answers: "Which controller is responsible for a given processing record?" A row for processing record 1 would show `Adaptive Model` with registration number `REG-2136` and website `https://github.com/chiphuyen/lazynlp`, providing the regulatory attribution needed for data protection impact assessments.

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

This view joins `data_processing_records` to `data_subjects` through `records_subjects`, producing a denormalised row per subject-record association. It answers: "Which subjects are affected by a given processing record?" A row for processing record 2 (`customer_communication`, legal ground `consent`) might show subject `SUB-2378` (Elizabeth Woods) with email `distributed-email-72`, enabling targeted subject-access requests.

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

This view joins `data_processing_records` to `communication_channels` through `records_channels`, producing a row per record-channel association. It answers: "Through which channels does a processing record reach data subjects?" A row for processing record 3 (`commercial_offers`) might show the `chat` channel at `https://www.deshaw.com/recruit/UnivListing.html` with `is_active` set to `true`, allowing the organisation to verify that active channels align with declared processing purposes.

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

This view is the inverse of the previous one: it joins `communication_channels` to `data_processing_records` through `channels_records`, producing a row per channel-record association. It answers: "Which processing records are associated with a given communication channel?" A row for the `website` channel (`https://www.nature.com/articles/nphoton.2017.123`) might show processing record 1 (`website_improvement`), enabling channel-level compliance audits.

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

This view joins `consent_records` to `data_subjects` on `consent_records.data_subject_id = data_subjects.id`, producing a row per consent enriched with the subject's identity. It answers: "Who gave this consent?" A row for consent id 1 might show `SUB-2370` (Dana Nguyen) with `consent_status` `granted` for `website_improvement`, providing a clear audit trail linking consent to the individual.

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

This view joins `consent_records` to `data_processing_records` by matching `consent_records.consent_scope` to `data_processing_records.processing_purpose`, producing a row per consent-processing pairing. It answers: "Which processing activity does this consent cover?" A row for consent id 2 (`withdrawn`, `commercial_offers`) might match processing record 3 (`commercial_offers`, `legitimate_interest`), revealing a potential mismatch where the consent scope does not align with the declared legal ground—a finding critical for regulatory remediation.

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

This view joins `business_partners` to `data_controllers` on `business_partners.data_controller_id = data_controllers.id`, producing a row per partner-controller association. It answers: "Which controller engages which business partner?" A row might show `Composite Review` (partner id 1, `product_provider`) engaged by `Adaptive Model` (controller id 1000) under data-sharing agreement `884359`, enabling the organisation to map its partner ecosystem.

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

This view joins `business_partners` to `data_subjects` through `partners_subjects`, producing a row per partner-subject association. It answers: "Which data subjects are affected by a given business partner?" A row might link `Compact Initiative A` (partner id 2, `service_provider`) to subject `SUB-2374` (Susan Levy), supporting partner-level data-protection impact assessments and subject-rights fulfilment.

### Closing Synthesis

The relational schema presented here is a direct materialisation of an ontology in which data subjects, data controllers, processing records, communication channels, consent records, and business partners are first-class entity types. Primary keys in base tables become foreign keys in dependent tables and junction tables, enforcing the cardinality constraints of the domain model. Junction tables such as `subjects_records`, `controllers_records`, `records_channels`, and `partners_subjects` extend one-to-many relationships into many-to-many relationships, faithfully representing the combinatorial nature of real-world data-processing ecosystems. Views then denormalise these normalised facts into domain-level narratives, each answering a specific regulatory question by joining the appropriate tables and presenting concrete rows—such as `SUB-2370`'s exposure to `website_improvement` processing or `Adaptive Model`'s engagement of `Composite Review` as a product provider. Together, the base tables, junction tables, and views form a coherent, queryable representation of the data-privacy compliance domain.