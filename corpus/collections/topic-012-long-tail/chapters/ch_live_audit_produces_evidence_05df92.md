---
chapter_id: ch_live_audit_produces_evidence_05df92
topic_id: 12
family: 07_long_tail
cited_terms: ['audit_produces_evidence', 'audit_subclass', 'audit_targets_data_artifact']
model: engine-refine
---

An audit evidence record is anchored by a stable identifier—EVID-0001 through EVID-0004, for instance—that uniquely distinguishes one piece of evidentiary material from another within a given audit scope. These identifiers serve as the primary key for the evidence registry, where each record is associated with a specific audit engagement such as PII-Flow-Review, Vendor-Access-Assessment, Third Party Risk Assessment, or SOC2 Type II Review. The identifier is not merely a label; it is the referent by which all subsequent attribute definitions and value assignments are resolved. When an auditor references EVID-0001, they are pointing to a concrete artifact whose provenance, type, and metadata are fully traceable through the relational structure that binds identifiers to attributes and attributes to typed values.

**t_audit_produces_evidence**

| id | audit |
| --- | --- |
| EVID-0001 | PII-Flow-Review |
| EVID-0002 | Vendor-Access-Assessment |
| EVID-0003 | Third Party Risk Assessment |
| EVID-0004 | SOC2 Type II Review |
| EVID-0005 | Cloud-Bucket-Encryption |
| EVID-0006 | PII-Flow-Review |

**t_audit_produces_evidence_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| EVID-0001 | confidence | xsd:decimal |
| EVID-0002 | dimension_kind | xsd:string |
| EVID-0003 | method | xsd:string |
| EVID-0004 | recorded_at | xsd:dateTime |
| EVID-0005 | uncertainty | xsd:decimal |
| EVID-0006 | unit | xsd:string |
| EVID-0007 | value | xsd:decimal |
| EVID-0008 | encoding | xsd:string |

**t_audit_subclass_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| AUDI-0001 | duration_seconds | xsd:decimal |
| AUDI-0002 | end_time | xsd:dateTime |
| AUDI-0003 | exit_code | xsd:integer |
| AUDI-0004 | host_name | xsd:string |
| AUDI-0005 | log_level | xsd:string |
| AUDI-0006 | phase | xsd:string |
| AUDI-0007 | retry_count | xsd:integer |
| AUDI-0008 | scheduled_at | xsd:dateTime |

**t_audit_targets_data_artifact**

| id | audit |
| --- | --- |
| ARTI-0001 | HIPAA Security Audit |
| ARTI-0002 | Vendor-Access-Assessment |
| ARTI-0003 | 21 CFR Part 11 Audit |
| ARTI-0004 | FedRAMP Authorization |
| ARTI-0005 | ISO 9001 Quality Audit |
| ARTI-0006 | Vendor-Access-Assessment |

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

Attributes define the dimensions along which evidence is characterized, and each attribute carries a declared type that constrains the shape of permissible values. The attribute registry for evidence records includes fields such as confidence, dimension_kind, method, and recorded_at, each typed to xsd:decimal, xsd:string, xsd:string, and xsd:dateTime respectively. This type discipline is not decorative; it governs how values are stored, validated, and queried across the system. A confidence score of 0.658 or 0.814 is stored as a decimal and can be subjected to arithmetic aggregation, while a dimension_kind value like "Dimension Kind 01" or an encoding designation such as "Encoding 02" is preserved as a string, immune to numeric coercion. The recorded_at attribute, typed as xsd:dateTime, anchors evidence to a precise moment—2025-03-28T10:19:21 or 2023-02-07T18:23:26—enabling temporal reasoning about when evidence was captured relative to the audit lifecycle.

The entity column in the value tables establishes the linkage between an attribute definition and its concrete instantiation. An entity is the specific record instance to which an attribute value is assigned, and the entity_id column in each value table points back to the evidence or audit subclass record that owns that value. For example, the decimal value 291.89 is associated with entity EVID-0001 and attribute EVID-0005, meaning that the evidence record identified as EVID-0001 carries an attribute whose definition is captured under EVID-0005 in the attribute registry. This indirection—where the entity_id and attr_id columns together form a composite foreign key into the attribute definition table—allows a single evidence record to carry dozens of attributes without denormalizing the schema. The same pattern holds across audit subclasses, where identifiers such as AUDI-0001 through AUDI-0004 reference engagements like GDPR Data Flow Assessment, HIPAA Security Audit, COBIT Governance Review, and Supply Chain Traceability Review, each with their own attribute set including duration_seconds, end_time, exit_code, and host_name.

**t_audit_produces_evidence_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVID-0001 | EVID-0001 | EVID-0004 | 2025-03-28T10:19:21 |
| EVID-0002 | EVID-0002 | EVID-0004 | 2023-02-07T18:23:26 |
| EVID-0003 | EVID-0003 | EVID-0004 | 2025-03-19T12:10:16 |
| EVID-0004 | EVID-0004 | EVID-0004 | 2023-11-17T00:14:22 |
| EVID-0005 | EVID-0005 | EVID-0004 | 2023-04-23T17:18:39 |
| EVID-0006 | EVID-0006 | EVID-0004 | 2024-01-14T13:39:09 |

**t_audit_produces_evidence_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVID-0001 | EVID-0001 | EVID-0001 | 0.658 |
| EVID-0002 | EVID-0001 | EVID-0005 | 291.89 |
| EVID-0003 | EVID-0001 | EVID-0007 | 838.98 |
| EVID-0004 | EVID-0002 | EVID-0001 | 0.814 |
| EVID-0005 | EVID-0002 | EVID-0005 | 409.44 |
| EVID-0006 | EVID-0002 | EVID-0007 | 534.69 |
| EVID-0007 | EVID-0003 | EVID-0001 | 0.935 |
| EVID-0008 | EVID-0003 | EVID-0005 | 954.22 |

**t_audit_subclass**

| id | audit |
| --- | --- |
| AUDI-0001 | GDPR Data Flow Assessment |
| AUDI-0002 | HIPAA Security Audit |
| AUDI-0003 | COBIT Governance Review |
| AUDI-0004 | Supply Chain Traceability Review |
| AUDI-0005 | Incident Response Simulation |
| AUDI-0006 | Vendor-Access-Assessment |

**t_audit_subclass_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AUDI-0001 | AUDI-0001 | AUDI-0002 | 2023-11-27T16:16:19 |
| AUDI-0002 | AUDI-0001 | AUDI-0008 | 2024-01-27T14:20:44 |
| AUDI-0003 | AUDI-0001 | AUDI-0009 | 2024-07-11T22:06:19 |
| AUDI-0004 | AUDI-0002 | AUDI-0002 | 2023-02-20T00:46:50 |
| AUDI-0005 | AUDI-0002 | AUDI-0008 | 2024-05-24T19:51:15 |
| AUDI-0006 | AUDI-0002 | AUDI-0009 | 2024-12-09T14:14:21 |
| AUDI-0007 | AUDI-0003 | AUDI-0002 | 2024-03-22T08:33:34 |
| AUDI-0008 | AUDI-0003 | AUDI-0008 | 2024-07-04T21:25:06 |

**t_audit_subclass_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AUDI-0001 | AUDI-0001 | AUDI-0001 | 6622.09 |
| AUDI-0002 | AUDI-0002 | AUDI-0001 | 3520.06 |
| AUDI-0003 | AUDI-0003 | AUDI-0001 | 6281.16 |
| AUDI-0004 | AUDI-0004 | AUDI-0001 | 5487.90 |
| AUDI-0005 | AUDI-0005 | AUDI-0001 | 1334.65 |
| AUDI-0006 | AUDI-0006 | AUDI-0001 | 3072.32 |

**t_audit_subclass_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AUDI-0001 | AUDI-0001 | AUDI-0003 | 943 |
| AUDI-0002 | AUDI-0001 | AUDI-0007 | 337 |
| AUDI-0003 | AUDI-0002 | AUDI-0003 | 718 |
| AUDI-0004 | AUDI-0002 | AUDI-0007 | 453 |
| AUDI-0005 | AUDI-0003 | AUDI-0003 | 258 |
| AUDI-0006 | AUDI-0003 | AUDI-0007 | 371 |
| AUDI-0007 | AUDI-0004 | AUDI-0003 | 509 |
| AUDI-0008 | AUDI-0004 | AUDI-0007 | 469 |

Value tables are partitioned by type to enforce the constraints declared in the attribute registry. Decimal values—6622.09 for a GDPR assessment's duration, 3520.06 for a HIPAA audit, 4704.44 for a FedRAMP artifact—reside in dedicated decimal value tables, while integer values such as exit codes 943, 337, 718, and 453 occupy their own integer tables. String values like host names node-b14 and node-a01, log levels "Log Level 02", execution states "execution" and "running", and language codes "en" are stored in varchar value tables. This type-partitioned design ensures that a decimal comparison on duration_seconds does not accidentally collide with a string comparison on host_name, and it permits each value table to be indexed and queried according to the access patterns appropriate for its data type. The misc column, which holds the actual value, is the terminal node in the identifier-attribute-entity-value chain; it is where the abstract attribute definition becomes a concrete, queryable datum.

**t_audit_produces_evidence_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVID-0001 | EVID-0001 | EVID-0002 | Dimension Kind 01 |
| EVID-0002 | EVID-0001 | EVID-0008 | Encoding 02 |
| EVID-0003 | EVID-0001 | EVID-0009 | calibration record |
| EVID-0004 | EVID-0001 | EVID-0010 | en |
| EVID-0005 | EVID-0001 | EVID-0003 | manual |
| EVID-0006 | EVID-0001 | EVID-0006 | deg_C |
| EVID-0007 | EVID-0002 | EVID-0002 | Dimension Kind 07 |
| EVID-0008 | EVID-0002 | EVID-0008 | Encoding 08 |

**t_audit_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AUDI-0001 | AUDI-0001 | AUDI-0004 | node-b14 |
| AUDI-0002 | AUDI-0001 | AUDI-0005 | Log Level 02 |
| AUDI-0003 | AUDI-0001 | AUDI-0006 | execution |
| AUDI-0004 | AUDI-0001 | AUDI-0010 | running |
| AUDI-0005 | AUDI-0001 | AUDI-0011 | Triggered By 05 |
| AUDI-0006 | AUDI-0002 | AUDI-0004 | worker-07 |
| AUDI-0007 | AUDI-0002 | AUDI-0005 | Log Level 07 |
| AUDI-0008 | AUDI-0002 | AUDI-0006 | execution |

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

The artifact-targeting tables extend this same pattern to audit artifacts—concrete deliverables such as those produced during a 21 CFR Part 11 Audit or a FedRAMP Authorization. Artifact identifiers ARTI-0001 through ARTI-0004 reference specific audit engagements, and their attributes mirror those of audit subclasses (duration_seconds, end_time, exit_code, host_name), suggesting a shared attribute vocabulary across audit domains. Decimal durations of 460.93 and 4764.85, integer exit codes of 803 and 1, and string values like "node-a01" and "running" demonstrate that the same attribute definitions can be reused across different audit contexts without modification. This reuse is made possible by the separation of attribute definitions from their value assignments: the attribute registry declares what can be measured, while the value tables record what was actually measured, and the entity column ties each measurement back to the specific artifact or audit record that produced it.