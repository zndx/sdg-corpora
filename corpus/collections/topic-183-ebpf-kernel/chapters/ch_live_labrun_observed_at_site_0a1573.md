---
chapter_id: ch_live_labrun_observed_at_site_0a1573
topic_id: 183
family: 02_observation_measurement
cited_terms: ['labrun_observed_at_site', 'patient_insurance_record', 'host_connection_process']
model: engine-refine
---

The entity-attribute-value (EAV) pattern provides a flexible mechanism for modeling heterogeneous data where the set of properties varies across instances. In this framework, an entity represents a distinct real-world object—such as a laboratory run observed at a site, identified by codes like SITE-0001 through SITE-0004 and associated with concrete lab runs such as PCR-ALPHA, RUN-2023-A4, WET-LAB-44, and PLATE-A12. Each entity is observed at a specific location, whether FIELD-STATION-9, CLEAN-ROOM-A, SECURE-VAULT-3, or BUILDING-C, establishing a spatial context for the data. The attributes themselves—duration_seconds, end_time, exit_code, and host_name—are defined independently of any particular entity, allowing the schema to evolve without structural migration. Each attribute carries a type annotation drawn from the XML Schema Datatypes namespace: xsd:decimal for numeric measurements, xsd:dateTime for temporal markers, xsd:integer for discrete counts, and xsd:string for free-form text. This type discipline ensures that values are validated at ingestion and that downstream consumers can interpret them correctly without schema introspection.

**t_labrun_observed_at_site**

| id | labrun | occurs_in |
| --- | --- | --- |
| SITE-0001 | PCR-ALPHA | FIELD-STATION-9 |
| SITE-0002 | RUN-2023-A4 | CLEAN-ROOM-A |
| SITE-0003 | WET-LAB-44 | SECURE-VAULT-3 |
| SITE-0004 | PLATE-A12 | BUILDING-C |
| SITE-0005 | BATCH-8812 | LAB-WING-D |
| SITE-0006 | NEXTRA-GEN-03 | BENCH-12 |
| SITE-0007 | BATCH-8812 | CORE-FACILITY |

**t_labrun_observed_at_site_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| SITE-0001 | duration_seconds | xsd:decimal |
| SITE-0002 | end_time | xsd:dateTime |
| SITE-0003 | exit_code | xsd:integer |
| SITE-0004 | host_name | xsd:string |
| SITE-0005 | log_level | xsd:string |
| SITE-0006 | phase | xsd:string |
| SITE-0007 | retry_count | xsd:integer |
| SITE-0008 | scheduled_at | xsd:dateTime |

**t_labrun_observed_at_site_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SITE-0001 | SITE-0001 | SITE-0002 | 2024-11-18T14:57:47 |
| SITE-0002 | SITE-0001 | SITE-0008 | 2025-06-11T00:43:59 |
| SITE-0003 | SITE-0001 | SITE-0009 | 2024-11-24T23:41:09 |
| SITE-0004 | SITE-0002 | SITE-0002 | 2024-09-03T12:28:15 |
| SITE-0005 | SITE-0002 | SITE-0008 | 2024-01-21T14:36:33 |
| SITE-0006 | SITE-0002 | SITE-0009 | 2024-08-02T20:19:39 |
| SITE-0007 | SITE-0003 | SITE-0002 | 2023-08-18T18:21:00 |
| SITE-0008 | SITE-0003 | SITE-0008 | 2023-03-15T08:25:39 |

**t_labrun_observed_at_site_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SITE-0001 | SITE-0001 | SITE-0001 | 3858.44 |
| SITE-0002 | SITE-0002 | SITE-0001 | 2622.63 |
| SITE-0003 | SITE-0003 | SITE-0001 | 5434.21 |
| SITE-0004 | SITE-0004 | SITE-0001 | 3308.67 |
| SITE-0005 | SITE-0005 | SITE-0001 | 138.03 |
| SITE-0006 | SITE-0006 | SITE-0001 | 5237.38 |
| SITE-0007 | SITE-0007 | SITE-0001 | 3257.93 |

**t_labrun_observed_at_site_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SITE-0001 | SITE-0001 | SITE-0003 | 263 |
| SITE-0002 | SITE-0001 | SITE-0007 | 199 |
| SITE-0003 | SITE-0002 | SITE-0003 | 302 |
| SITE-0004 | SITE-0002 | SITE-0007 | 29 |
| SITE-0005 | SITE-0003 | SITE-0003 | 93 |
| SITE-0006 | SITE-0003 | SITE-0007 | 209 |
| SITE-0007 | SITE-0004 | SITE-0003 | 703 |
| SITE-0008 | SITE-0004 | SITE-0007 | 313 |

**t_labrun_observed_at_site_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SITE-0001 | SITE-0001 | SITE-0004 | ingest-21 |
| SITE-0002 | SITE-0001 | SITE-0005 | Log Level 02 |
| SITE-0003 | SITE-0001 | SITE-0006 | closeout |
| SITE-0004 | SITE-0001 | SITE-0010 | failed |
| SITE-0005 | SITE-0001 | SITE-0011 | Triggered By 05 |
| SITE-0006 | SITE-0002 | SITE-0004 | gw-12 |
| SITE-0007 | SITE-0002 | SITE-0005 | Log Level 07 |
| SITE-0008 | SITE-0002 | SITE-0006 | initiation |

Value storage is partitioned by type, with dedicated tables for datetime, decimal, integer, and varchar data. A datetime value such as 2024-11-18T14:57:47 or 2025-06-11T00:43:59 is stored in the datetime value table, while a decimal measurement like 3858.44, 2622.63, 5434.21, or 3308.67 resides in the decimal table. Integer exit codes—263, 199, 302, 29—are held in the integer table, and string attributes such as ingest-21, Log Level 02, closeout, and failed are stored in the varchar table. Each value row references its entity through an entity_id and its attribute through an attr_id, creating a sparse but queryable mapping between entities and their properties. The identifier column on each value table serves as a unique key for the value row itself, while the attr_id column on the attribute definition table provides a stable reference that does not change even as attribute names evolve. This separation of attribute definition from attribute value is what enables the model to accommodate new properties without altering the database schema.

The same EAV architecture extends beyond laboratory operations into clinical and biological domains. Patient insurance records, identified by codes such as RECO-0001 through RECO-0004, encapsulate enrollment data including ENROLL-7742, POL-8821-AX, SSN-4821, and DOB-19850312. These records contain structured data elements—coverage_start_date, provider_npi, deductible_limit, and premium_amount—that are themselves modeled as entities with their own identifiers. The relationship between a patient and their insurance data elements is mediated through a junction table that captures not only which data element belongs to which patient but also the role the patient plays in relation to that element: contributor, owner, or observer. This role annotation transforms a simple many-to-many relationship into a semantically rich association, enabling audit trails and access control policies that depend on the nature of the relationship rather than merely its existence.

**t_patient_insurance_record**

| id | patient_insurance_record |
| --- | --- |
| RECO-0001 | ENROLL-7742 |
| RECO-0002 | POL-8821-AX |
| RECO-0003 | SSN-4821 |
| RECO-0004 | DOB-19850312 |
| RECO-0005 | MRN-4829103 |
| RECO-0006 | SSN-4821 |
| RECO-0007 | POL-8821-AX |
| RECO-0008 | ENROLL-7742 |

**t_patient_insurance_record_contains_data_element**

| id | contains_data_element |
| --- | --- |
| RECO-0001 | coverage_start_date |
| RECO-0002 | provider_npi |
| RECO-0003 | deductible_limit |
| RECO-0004 | premium_amount |
| RECO-0005 | copay_rate |
| RECO-0006 | coverage_start_date |

**t_patient_insurance_record__contains_data_element**

| id | patient_id | contains_data_element_id | role |
| --- | --- | --- | --- |
| RECO-0001 | RECO-0005 | RECO-0003 | contributor |
| RECO-0002 | RECO-0003 | RECO-0006 | contributor |
| RECO-0003 | RECO-0008 | RECO-0006 | owner |
| RECO-0004 | RECO-0007 | RECO-0002 | observer |
| RECO-0005 | RECO-0001 | RECO-0002 | owner |
| RECO-0006 | RECO-0005 | RECO-0002 | observer |
| RECO-0007 | RECO-0003 | RECO-0002 | contributor |
| RECO-0008 | RECO-0008 | RECO-0001 | owner |

Biological process modeling follows an analogous structure. Host connection processes—such as those involving Zea mays B73, Helianthus annuus, Hordeum vulgare, and Quercus robur—are identified by codes like PROC-0001 through PROC-0004 and participate in relationships with biological components including Haustorium and Cortical cells. The junction table linking hosts to participants similarly employs a role column, with values such as observer, owner, and reviewer indicating the nature of the participation. A single host process (PROC-0007 in the observed data) can relate to multiple participants through multiple role assignments, and the same participant can appear in different roles across different host processes. This design supports complex biological ontologies where the same anatomical structure may serve different functional roles depending on the host context.

**t_host_connection_process**

| id | host_connection_process |
| --- | --- |
| PROC-0001 | Zea mays B73 |
| PROC-0002 | Helianthus annuus |
| PROC-0003 | Hordeum vulgare |
| PROC-0004 | Quercus robur |
| PROC-0005 | Helianthus annuus |
| PROC-0006 | Populus trichocarpa |
| PROC-0007 | Gossypium hirsutum |

**t_host_connection_process_has_participant**

| id | has_participant |
| --- | --- |
| PROC-0001 | Haustorium |
| PROC-0002 | Cortical cells |
| PROC-0003 | Haustorium |
| PROC-0004 | Cortical cells |
| PROC-0005 | Parasite root tip |
| PROC-0006 | Sieve tube element |
| PROC-0007 | Vascular cambium |
| PROC-0008 | Root xylem |

**t_host_connection_process__has_participant**

| id | host_id | has_participant_id | role |
| --- | --- | --- | --- |
| PROC-0001 | PROC-0007 | PROC-0003 | observer |
| PROC-0002 | PROC-0007 | PROC-0007 | observer |
| PROC-0003 | PROC-0007 | PROC-0004 | owner |
| PROC-0004 | PROC-0007 | PROC-0003 | reviewer |
| PROC-0005 | PROC-0005 | PROC-0005 | contributor |
| PROC-0006 | PROC-0001 | PROC-0008 | contributor |
| PROC-0007 | PROC-0003 | PROC-0002 | contributor |
| PROC-0008 | PROC-0004 | PROC-0004 | owner |

Across all domains, the consistent use of identifier, subject, target, and role as conceptual primitives creates a unified modeling vocabulary. The identifier column provides a stable, system-generated key for every entity, attribute, and value row. The subject and target columns in junction tables distinguish the two ends of a relationship, while the role column captures the semantic directionality of that relationship. This pattern—entity, attribute, typed value, and role-mediated relationship—forms a general-purpose data model that can represent laboratory metadata, clinical insurance records, and biological process annotations within a single architectural framework. The practical advantage is that new data types and relationship patterns can be introduced by adding rows to existing tables rather than by altering the schema, making the system adaptable to evolving domain requirements without downtime or data migration.