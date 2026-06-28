---
chapter_id: ch_live_audit_subclass_2555c7
topic_id: 26
family: 03_directive_governance
cited_terms: ['audit_subclass', 'classification_assigns_tier', 'nist80053_control_subclass']
model: engine-refine
---

Within governance registries and compliance frameworks, identifiers serve as the immutable anchors that bind audit evidence, control mappings, and classification assignments into a coherent traceability chain. An identifier such as AUDI-0001 denotes a specific audit subclass—here, a SOC2 Type II Review—while CONT-0001 and TIER-0001 reference, respectively, a NIST SP 800-53 Rev 5 control and a Governance Registry tier assignment. These identifiers are not merely labels; they are the join keys that permit an attribute definition to be resolved against a concrete entity, and an entity to be resolved against its stored values. The identifier space is partitioned by domain: AUDI-prefixed keys govern audit subclass records, CONT-prefixed keys govern NIST control subclass records, and TIER-prefixed keys govern classification-to-tier assignments, each namespace carrying its own attribute schema and value semantics.

**t_audit_subclass**

| id | audit |
| --- | --- |
| AUDI-0001 | SOC2 Type II Review |
| AUDI-0002 | PCI DSS Certification |
| AUDI-0003 | GDPR Data Flow Assessment |
| AUDI-0004 | HIPAA Security Audit |
| AUDI-0005 | HIPAA Security Audit |
| AUDI-0006 | 21 CFR Part 11 Audit |

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

**t_classification_assigns_tier**

| id | classification | assigns_tier | log_level | retry_count |
| --- | --- | --- | --- | --- |
| TIER-0001 | Governance Registry | CONT-0005 | info | 379 |
| TIER-0002 | Security Baseline | CONT-0002 | error | 176 |
| TIER-0003 | Data Classification Scheme | CONT-0006 | debug | 195 |
| TIER-0004 | Data Lineage Map | CONT-0006 | debug | 460 |
| TIER-0005 | Metadata Schema | CONT-0002 | critical | 23 |

**t_nist80053_control_subclass**

| id | nist | nist80053_control |
| --- | --- | --- |
| CONT-0001 | NIST SP 800-53 Rev 5 | AUDI-0002 |
| CONT-0002 | NIST SP 800-171 | AUDI-0006 |
| CONT-0003 | NIST CSF 2.0 | AUDI-0005 |
| CONT-0004 | NIST SP 800-207 | AUDI-0004 |
| CONT-0005 | FIPS 140-3 | AUDI-0006 |
| CONT-0006 | NIST SP 800-171 | AUDI-0006 |

**t_nist80053_control_subclass_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| CONT-0001 | effective_date | xsd:date |
| CONT-0002 | enforcement | xsd:string |
| CONT-0003 | mandatory | xsd:boolean |
| CONT-0004 | priority | xsd:integer |
| CONT-0005 | review_cycle_days | xsd:integer |
| CONT-0006 | scope | xsd:string |
| CONT-0007 | encoding | xsd:string |
| CONT-0008 | label_text | xsd:string |

**t_nist80053_control_subclass_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONT-0001 | CONT-0001 | CONT-0004 | 3 |
| CONT-0002 | CONT-0001 | CONT-0005 | 776 |
| CONT-0003 | CONT-0002 | CONT-0004 | 4 |
| CONT-0004 | CONT-0002 | CONT-0005 | 46 |
| CONT-0005 | CONT-0003 | CONT-0004 | 1 |
| CONT-0006 | CONT-0003 | CONT-0005 | 151 |
| CONT-0007 | CONT-0004 | CONT-0004 | 4 |
| CONT-0008 | CONT-0004 | CONT-0005 | 507 |

Attributes and their types constitute the schema layer that gives structure to otherwise heterogeneous compliance data. An attribute name—duration_seconds, end_time, exit_code, host_name, effective_date, enforcement, mandatory, or priority—declares a property of interest, while the attribute type—xsd:decimal, xsd:dateTime, xsd:integer, xsd:string, xsd:date, or xsd:boolean—constrains the shape of permissible values. This separation of attribute definition from attribute value is deliberate: it permits a single audit subclass such as the PCI DSS Certification (AUDI-0002) to carry a duration of 3520.06 decimal seconds and an exit code of 718 integer, while a NIST control such as CONT-0002 carries a mandatory flag of true and a priority of 4. The type system enforces data integrity at the point of storage, ensuring that a timestamp like 2024-01-27T14:20:44 is never conflated with a host name like node-b14, even though both are stored as values against attributes of the same entity.

Entity identifiers in the value tables resolve the many-to-many relationship between attributes and the records they describe. An entity_id of AUDI-0001 in the datetime value table indicates that the timestamp 2023-11-27T16:16:19 belongs to the SOC2 Type II Review audit, while the same entity_id in the decimal value table associates the duration 6622.09 with that identical audit. This design permits a single entity to accumulate values across multiple type-specific tables—decimal, integer, datetime, varchar, and boolean—each table handling the serialization and validation appropriate to its type. The entity thus becomes a composite record assembled at query time from its scattered value fragments, a pattern that accommodates the wide variation in attribute shapes across audit subclasses and NIST controls without requiring a rigid, monolithic schema.

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

**t_nist80053_control_subclass_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONT-0001 | CONT-0001 | CONT-0003 | true |
| CONT-0002 | CONT-0002 | CONT-0003 | true |
| CONT-0003 | CONT-0003 | CONT-0003 | true |
| CONT-0004 | CONT-0004 | CONT-0003 | false |
| CONT-0005 | CONT-0005 | CONT-0003 | true |
| CONT-0006 | CONT-0006 | CONT-0003 | true |

**t_nist80053_control_subclass_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONT-0001 | CONT-0001 | CONT-0001 | 2023-01-02 |
| CONT-0002 | CONT-0002 | CONT-0001 | 2024-11-29 |
| CONT-0003 | CONT-0003 | CONT-0001 | 2024-03-23 |
| CONT-0004 | CONT-0004 | CONT-0001 | 2025-03-12 |
| CONT-0005 | CONT-0005 | CONT-0001 | 2024-03-19 |
| CONT-0006 | CONT-0006 | CONT-0001 | 2023-10-15 |

**t_nist80053_control_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONT-0001 | CONT-0001 | CONT-0007 | Encoding 01 |
| CONT-0002 | CONT-0001 | CONT-0002 | Enforcement 02 |
| CONT-0003 | CONT-0001 | CONT-0008 | calibration record |
| CONT-0004 | CONT-0001 | CONT-0009 | es |
| CONT-0005 | CONT-0001 | CONT-0006 | Scope 05 |
| CONT-0006 | CONT-0002 | CONT-0007 | Encoding 06 |
| CONT-0007 | CONT-0002 | CONT-0002 | Enforcement 07 |
| CONT-0008 | CONT-0002 | CONT-0008 | audit excerpt |

Log level and retry count operate as operational metadata on classification tier assignments, capturing the runtime behavior and severity posture of governance controls. A classification such as Security Baseline (TIER-0002) is assigned to control CONT-0002 with a log level of error and a retry count of 176, signaling that failures in this control's enforcement path are treated as critical events and that the system has attempted 176 retries before exhausting its backoff strategy. By contrast, the Data Lineage Map (TIER-0004) carries a log level of debug and a retry count of 460, indicating a lower-severity posture with a substantially higher tolerance for transient failures. The log level—info, error, or debug—provides an immediate signal of operational criticality, while the retry count quantifies the resilience budget allocated to each classification tier, together forming a lightweight observability layer atop the compliance data model.

The misc value column, as the catch-all carrier for actual data, is where the abstract attribute definitions materialize into concrete evidence. A varchar value of execution or running describes the state of an audit process; a boolean true or false encodes whether a NIST control is mandatory; a date value of 2025-03-12 marks the effective date of a control's enforcement window. These values, though diverse in type, share a common storage pattern: each is anchored by an identifier, linked to an entity through entity_id, and typed through attr_id, forming a triad that makes every piece of stored data independently queryable and auditable. The result is a data model that scales across compliance domains—SOC2, PCI DSS, GDPR, HIPAA, and NIST frameworks—without requiring schema changes, because the entity-attribute-value structure absorbs new attribute definitions and value types as they emerge, while the identifier and log level/retry count layers preserve the traceability and operational context that governance frameworks demand.