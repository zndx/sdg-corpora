---
chapter_id: ch_live_descriptive_not_retracted_c7eabe
topic_id: 191
family: 07_long_tail
cited_terms: ['descriptive_not_retracted', 'audit_targets_data_artifact', 'attestation_min_one_signer']
model: engine-refine
---

ATTRIBUTES, ATTRIBUTE TYPES, ENTITIES, IDENTIFIERS, AND MISC

Every governed artifact is decomposed into a tripartite structure of entity, attribute, and value, where the entity serves as the stable referent, the attribute defines the property being measured or recorded, and the value carries the actual datum. In the descriptive-not-retracted domain, entities such as RETR-0001 through RETR-0004 represent discrete records—Sensor Drift Note, Anomaly Flag Sheet, Metadata Index Card—each carrying a descriptive label and a secondary classification like Metadata Extension Record or Calibration Reference Sheet. The audit-targets-data-artifact domain mirrors this pattern with identifiers ARTI-0001 through ARTI-0004, referencing concrete audit artifacts such as Cloud-Bucket-Encryption, SOC2-Q3-2023, API-Auth-Token-Rotation, and Vendor-Access-Assessment. Similarly, the attestation-min-one-signer domain uses identifiers SIGN-0001 through SIGN-0004 to anchor attestations including Chain of Custody Review, Security Baseline Validation, and SOC 2 Type II Audit. Across all three domains, the identifier column functions as the primary key and the universal join handle, ensuring that every attribute definition and every value instance can be traced back to its originating entity without ambiguity.

**t_descriptive_not_retracted**

| id | descriptive | descriptive_2 |
| --- | --- | --- |
| RETR-0001 | Sensor Drift Note | Metadata Extension Record |
| RETR-0002 | Anomaly Flag Sheet | Batch Processing Note |
| RETR-0003 | Sensor Drift Note | Calibration Reference Sheet |
| RETR-0004 | Metadata Index Card | Anomaly Classification Code |
| RETR-0005 | Data Quality Memo | Data Quality Metric Card |
| RETR-0006 | Observation Summary | Anomaly Classification Code |

**t_descriptive_not_retracted_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| RETR-0001 | confidence | xsd:decimal |
| RETR-0002 | dimension_kind | xsd:string |
| RETR-0003 | method | xsd:string |
| RETR-0004 | recorded_at | xsd:dateTime |
| RETR-0005 | uncertainty | xsd:decimal |
| RETR-0006 | unit | xsd:string |
| RETR-0007 | value | xsd:decimal |
| RETR-0008 | encoding | xsd:string |

**t_descriptive_not_retracted_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RETR-0001 | RETR-0001 | RETR-0004 | 2024-02-12T07:34:36 |
| RETR-0002 | RETR-0002 | RETR-0004 | 2024-08-04T13:26:29 |
| RETR-0003 | RETR-0003 | RETR-0004 | 2024-08-02T08:30:25 |
| RETR-0004 | RETR-0004 | RETR-0004 | 2025-01-21T18:04:20 |
| RETR-0005 | RETR-0005 | RETR-0004 | 2024-03-11T23:18:32 |
| RETR-0006 | RETR-0006 | RETR-0004 | 2024-12-14T04:10:36 |

**t_descriptive_not_retracted_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RETR-0001 | RETR-0001 | RETR-0001 | 0.736 |
| RETR-0002 | RETR-0001 | RETR-0005 | 273.61 |
| RETR-0003 | RETR-0001 | RETR-0007 | 449.86 |
| RETR-0004 | RETR-0002 | RETR-0001 | 0.217 |
| RETR-0005 | RETR-0002 | RETR-0005 | 724.88 |
| RETR-0006 | RETR-0002 | RETR-0007 | 500.73 |
| RETR-0007 | RETR-0003 | RETR-0001 | 0.920 |
| RETR-0008 | RETR-0003 | RETR-0005 | 966.69 |

**t_descriptive_not_retracted_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RETR-0001 | RETR-0001 | RETR-0002 | Dimension Kind 01 |
| RETR-0002 | RETR-0001 | RETR-0008 | Encoding 02 |
| RETR-0003 | RETR-0001 | RETR-0009 | intake form |
| RETR-0004 | RETR-0001 | RETR-0010 | es |
| RETR-0005 | RETR-0001 | RETR-0003 | manual |
| RETR-0006 | RETR-0001 | RETR-0006 | ratio |
| RETR-0007 | RETR-0002 | RETR-0002 | Dimension Kind 07 |
| RETR-0008 | RETR-0002 | RETR-0008 | Encoding 08 |

**t_audit_targets_data_artifact**

| id | audit |
| --- | --- |
| ARTI-0001 | Cloud-Bucket-Encryption |
| ARTI-0002 | SOC2-Q3-2023 |
| ARTI-0003 | API-Auth-Token-Rotation |
| ARTI-0004 | Vendor-Access-Assessment |
| ARTI-0005 | Cloud-Bucket-Encryption |
| ARTI-0006 | Model-Pipeline-Validation |

**t_audit_targets_data_artifact_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ARTI-0001 | duration_seconds | xsd:decimal |
| ARTI-0002 | end_time | xsd:dateTime |
| ARTI-0003 | exit_code | xsd:integer |
| ARTI-0004 | host_name | xsd:string |
| ARTI-0005 | log_level | xsd:string |
| ARTI-0006 | phase | xsd:string |
| ARTI-0007 | retry_count | xsd:integer |
| ARTI-0008 | scheduled_at | xsd:dateTime |

**t_audit_targets_data_artifact_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0002 | 2024-12-01T01:08:20 |
| ARTI-0002 | ARTI-0001 | ARTI-0008 | 2025-04-11T08:34:59 |
| ARTI-0003 | ARTI-0001 | ARTI-0009 | 2024-01-10T01:48:17 |
| ARTI-0004 | ARTI-0002 | ARTI-0002 | 2023-12-13T07:58:05 |
| ARTI-0005 | ARTI-0002 | ARTI-0008 | 2024-04-04T16:02:49 |
| ARTI-0006 | ARTI-0002 | ARTI-0009 | 2023-03-02T22:50:55 |
| ARTI-0007 | ARTI-0003 | ARTI-0002 | 2025-03-24T22:59:49 |
| ARTI-0008 | ARTI-0003 | ARTI-0008 | 2024-12-31T14:33:38 |

**t_audit_targets_data_artifact_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0001 | 4704.44 |
| ARTI-0002 | ARTI-0002 | ARTI-0001 | 2823.51 |
| ARTI-0003 | ARTI-0003 | ARTI-0001 | 460.93 |
| ARTI-0004 | ARTI-0004 | ARTI-0001 | 4764.85 |
| ARTI-0005 | ARTI-0005 | ARTI-0001 | 3458.42 |
| ARTI-0006 | ARTI-0006 | ARTI-0001 | 1214.20 |

**t_audit_targets_data_artifact_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0003 | 102 |
| ARTI-0002 | ARTI-0001 | ARTI-0007 | 288 |
| ARTI-0003 | ARTI-0002 | ARTI-0003 | 803 |
| ARTI-0004 | ARTI-0002 | ARTI-0007 | 1 |
| ARTI-0005 | ARTI-0003 | ARTI-0003 | 425 |
| ARTI-0006 | ARTI-0003 | ARTI-0007 | 187 |
| ARTI-0007 | ARTI-0004 | ARTI-0003 | 75 |
| ARTI-0008 | ARTI-0004 | ARTI-0007 | 345 |

**t_audit_targets_data_artifact_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0004 | node-a01 |
| ARTI-0002 | ARTI-0001 | ARTI-0005 | Log Level 02 |
| ARTI-0003 | ARTI-0001 | ARTI-0006 | execution |
| ARTI-0004 | ARTI-0001 | ARTI-0010 | running |
| ARTI-0005 | ARTI-0001 | ARTI-0011 | Triggered By 05 |
| ARTI-0006 | ARTI-0002 | ARTI-0004 | node-a01 |
| ARTI-0007 | ARTI-0002 | ARTI-0005 | Log Level 07 |
| ARTI-0008 | ARTI-0002 | ARTI-0006 | closeout |

**t_attestation_min_one_signer**

| id | attestation |
| --- | --- |
| SIGN-0001 | Chain of Custody Review |
| SIGN-0002 | Security Baseline Validation |
| SIGN-0003 | Chain of Custody Review |
| SIGN-0004 | SOC 2 Type II Audit |
| SIGN-0005 | HIPAA Compliance Verification |
| SIGN-0006 | Data Residency Certification |

**t_attestation_min_one_signer_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| SIGN-0001 | duration_seconds | xsd:decimal |
| SIGN-0002 | end_time | xsd:dateTime |
| SIGN-0003 | exit_code | xsd:integer |
| SIGN-0004 | host_name | xsd:string |
| SIGN-0005 | log_level | xsd:string |
| SIGN-0006 | phase | xsd:string |
| SIGN-0007 | retry_count | xsd:integer |
| SIGN-0008 | scheduled_at | xsd:dateTime |

**t_attestation_min_one_signer_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SIGN-0001 | SIGN-0001 | SIGN-0002 | 2023-01-30T09:27:18 |
| SIGN-0002 | SIGN-0001 | SIGN-0008 | 2023-11-17T23:13:16 |
| SIGN-0003 | SIGN-0001 | SIGN-0009 | 2024-10-31T01:25:16 |
| SIGN-0004 | SIGN-0002 | SIGN-0002 | 2024-07-02T14:51:27 |
| SIGN-0005 | SIGN-0002 | SIGN-0008 | 2025-02-15T22:43:11 |
| SIGN-0006 | SIGN-0002 | SIGN-0009 | 2025-01-24T22:56:47 |
| SIGN-0007 | SIGN-0003 | SIGN-0002 | 2024-08-04T06:50:35 |
| SIGN-0008 | SIGN-0003 | SIGN-0008 | 2024-10-17T00:50:44 |

**t_attestation_min_one_signer_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SIGN-0001 | SIGN-0001 | SIGN-0001 | 1355.00 |
| SIGN-0002 | SIGN-0002 | SIGN-0001 | 2257.11 |
| SIGN-0003 | SIGN-0003 | SIGN-0001 | 6713.34 |
| SIGN-0004 | SIGN-0004 | SIGN-0001 | 6673.35 |
| SIGN-0005 | SIGN-0005 | SIGN-0001 | 1063.66 |
| SIGN-0006 | SIGN-0006 | SIGN-0001 | 1.74 |

**t_attestation_min_one_signer_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SIGN-0001 | SIGN-0001 | SIGN-0003 | 392 |
| SIGN-0002 | SIGN-0001 | SIGN-0007 | 373 |
| SIGN-0003 | SIGN-0002 | SIGN-0003 | 567 |
| SIGN-0004 | SIGN-0002 | SIGN-0007 | 384 |
| SIGN-0005 | SIGN-0003 | SIGN-0003 | 347 |
| SIGN-0006 | SIGN-0003 | SIGN-0007 | 188 |
| SIGN-0007 | SIGN-0004 | SIGN-0003 | 103 |
| SIGN-0008 | SIGN-0004 | SIGN-0007 | 410 |

**t_attestation_min_one_signer_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SIGN-0001 | SIGN-0001 | SIGN-0004 | node-b14 |
| SIGN-0002 | SIGN-0001 | SIGN-0005 | Log Level 02 |
| SIGN-0003 | SIGN-0001 | SIGN-0006 | review |
| SIGN-0004 | SIGN-0001 | SIGN-0010 | complete |
| SIGN-0005 | SIGN-0001 | SIGN-0011 | Triggered By 05 |
| SIGN-0006 | SIGN-0002 | SIGN-0004 | ingest-21 |
| SIGN-0007 | SIGN-0002 | SIGN-0005 | Log Level 07 |
| SIGN-0008 | SIGN-0002 | SIGN-0006 | execution |

Attribute definitions establish the schema of observability for each entity, specifying both the semantic name and the enforced data type. The attribute table for each domain declares properties such as confidence, dimension_kind, method, and recorded_at in the descriptive domain; duration_seconds, end_time, exit_code, and host_name in both the audit and attestation domains. Each attribute is assigned an XSD type—xsd:decimal for numeric measures, xsd:string for categorical or textual labels, xsd:dateTime for temporal markers, and xsd:integer for whole-number codes—thereby constraining the value tables to type-safe storage. For instance, the attribute recorded_at (attr_id RETR-0004) carries the type xsd:dateTime and is populated with values such as 2024-02-12T07:34:36, 2024-08-04T13:26:29, 2024-08-02T08:30:25, and 2025-01-21T18:04:20 across the descriptive entities, while the attribute duration_seconds (attr_id ARTI-0001) of type xsd:decimal holds values like 4704.44, 2823.51, 460.93, and 4764.85 for audit artifacts. This type discipline ensures that a value stored in t_descriptive_not_retracted_val_decimal can never be confused with one in t_descriptive_not_retracted_val_varchar, and that the database engine itself enforces type correctness at insert time.

The value tables implement a type-partitioned entity-attribute-value model, where each data type occupies its own table to avoid the null-sparsity and type-coercion penalties of a single generic value column. The decimal values table for the descriptive domain links entity RETR-0001 to attributes RETR-0001, RETR-0005, and RETR-0007 with numeric values 0.736, 273.61, and 449.86 respectively, while entity RETR-0002 carries a value of 0.217 against attribute RETR-0001. The varchar values table for the same domain associates entity RETR-0001 with attributes RETR-0002, RETR-0008, RETR-0009, and RETR-0010, yielding values Dimension Kind 01, Encoding 02, intake form, and es. In the audit domain, the varchar values table maps entity ARTI-0001 to attributes ARTI-0004, ARTI-0005, ARTI-0006, and ARTI-0010 with values node-a01, Log Level 02, execution, and running; the integer values table records exit codes 102 and 288 for entity ARTI-0001 against attributes ARTI-0003 and ARTI-0007, and exit codes 803 and 1 for entity ARTI-0002. The attestation domain follows identically, with entity SIGN-0001 carrying decimal duration values of 1355.00, varchar host_name node-b14, integer exit_code 392, and varchar status complete.

This normalization strategy—entities in a master table, attributes in a definition table, and values distributed across type-specific tables—provides both structural rigor and query efficiency. The entity_id column in every value table serves as the foreign key back to the entity's identifier, while the attr_id column references the attribute's identifier, creating a two-hop join path from any value to its entity and attribute definition. The id column in each value table provides a unique row-level identifier for auditing and versioning purposes. The misc designation on the value column reflects its role as the carrier of heterogeneous data: a single entity like RETR-0001 may simultaneously hold a decimal confidence score of 0.736, a varchar dimension_kind of Dimension Kind 01, and a datetime recorded_at of 2024-02-12T07:34:36, each residing in its own type table but unified through the shared entity_id. This design supports extensibility—new attributes can be declared without schema migration—and enforces that every datum is typed, traceable, and attributable to a specific entity within a specific governance domain.