---
chapter_id: ch_live_requirement_under_standard_906ce3
topic_id: 186
family: 03_directive_governance
cited_terms: ['requirement_under_standard', 'gdpr_article_subclass', 'trace_basic']
model: engine-refine
---

An identifier serves as the immutable handle by which every governed object is addressed across the framework. Standards such as STAN-0001 and STAN-0004, regulatory articles like ARTI-0002 and ARTI-0006, and operational traces including TRAC-0001 and TRAC-0003 each carry a unique identifier that anchors all downstream references. An entity, by contrast, denotes a specific instance of a governed object to which attributes are attached or through which relationships are expressed. The entity column in value tables always points back to an identifier, establishing that the value belongs to a particular record rather than to the class of records as a whole. For example, the effective date 2024-02-08 is attached to entity STAN-0001, while the same attribute applied to entity STAN-0004 carries the date 2023-09-30, demonstrating that attribute values are scoped to individual entities within the same identifier namespace.

**t_gdpr_article_subclass**

| id | gdpr |
| --- | --- |
| ARTI-0001 | Brazilian LGPD |
| ARTI-0002 | Canadian PIPEDA |
| ARTI-0003 | Brazilian LGPD |
| ARTI-0004 | Canadian PIPEDA |
| ARTI-0005 | Canadian PIPEDA |
| ARTI-0006 | General Data Protection Regulation |
| ARTI-0007 | Article 6 |
| ARTI-0008 | Swiss FADP |

**t_gdpr_article_subclass_gdpr_article**

| id | gdpr_article |
| --- | --- |
| ARTI-0001 | Australian Privacy Act |
| ARTI-0002 | Japanese APPI |
| ARTI-0003 | Brazilian LGPD |
| ARTI-0004 | Article 9 |
| ARTI-0005 | ePrivacy Directive |
| ARTI-0006 | Canadian PIPEDA |

**t_trace_basic**

| id | trace | observed_at |
| --- | --- | --- |
| TRAC-0001 | load-balancer-routing | ARTI-0003 |
| TRAC-0002 | frontend-render-loop | ARTI-0007 |
| TRAC-0003 | message-broker-poll | ARTI-0008 |
| TRAC-0004 | worker-task-execution | ARTI-0001 |
| TRAC-0005 | cache-hit-miss-run | ARTI-0002 |
| TRAC-0006 | message-broker-poll | ARTI-0001 |

**t_trace_basic_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TRAC-0001 | TRAC-0001 | TRAC-0002 | 2023-04-16T02:44:01 |
| TRAC-0002 | TRAC-0001 | TRAC-0008 | 2024-07-31T11:49:14 |
| TRAC-0003 | TRAC-0001 | TRAC-0009 | 2025-04-08T10:42:35 |
| TRAC-0004 | TRAC-0002 | TRAC-0002 | 2023-05-20T09:49:51 |
| TRAC-0005 | TRAC-0002 | TRAC-0008 | 2023-07-22T09:50:59 |
| TRAC-0006 | TRAC-0002 | TRAC-0009 | 2023-11-29T05:54:22 |
| TRAC-0007 | TRAC-0003 | TRAC-0002 | 2023-07-03T21:45:54 |
| TRAC-0008 | TRAC-0003 | TRAC-0008 | 2023-03-31T15:28:51 |

**t_trace_basic_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TRAC-0001 | TRAC-0001 | TRAC-0001 | 1505.64 |
| TRAC-0002 | TRAC-0002 | TRAC-0001 | 5061.29 |
| TRAC-0003 | TRAC-0003 | TRAC-0001 | 4957.42 |
| TRAC-0004 | TRAC-0004 | TRAC-0001 | 1589.98 |
| TRAC-0005 | TRAC-0005 | TRAC-0001 | 2846.09 |
| TRAC-0006 | TRAC-0006 | TRAC-0001 | 1626.04 |

**t_trace_basic_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TRAC-0001 | TRAC-0001 | TRAC-0003 | 376 |
| TRAC-0002 | TRAC-0001 | TRAC-0007 | 314 |
| TRAC-0003 | TRAC-0002 | TRAC-0003 | 88 |
| TRAC-0004 | TRAC-0002 | TRAC-0007 | 293 |
| TRAC-0005 | TRAC-0003 | TRAC-0003 | 468 |
| TRAC-0006 | TRAC-0003 | TRAC-0007 | 480 |
| TRAC-0007 | TRAC-0004 | TRAC-0003 | 297 |
| TRAC-0008 | TRAC-0004 | TRAC-0007 | 77 |

**t_trace_basic_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TRAC-0001 | TRAC-0001 | TRAC-0004 | node-b14 |
| TRAC-0002 | TRAC-0001 | TRAC-0005 | Log Level 02 |
| TRAC-0003 | TRAC-0001 | TRAC-0006 | initiation |
| TRAC-0004 | TRAC-0001 | TRAC-0010 | complete |
| TRAC-0005 | TRAC-0001 | TRAC-0011 | Triggered By 05 |
| TRAC-0006 | TRAC-0002 | TRAC-0004 | ingest-21 |
| TRAC-0007 | TRAC-0002 | TRAC-0005 | Log Level 07 |
| TRAC-0008 | TRAC-0002 | TRAC-0006 | initiation |

Attributes define the properties that can be measured, configured, or recorded for any governed object, and each attribute is declared with an explicit type that constrains the shape of its values. The attribute name—such as effective_date, enforcement, mandatory, or priority—provides a human-readable label, while the attribute type—drawn from the XML Schema vocabulary including xsd:date, xsd:string, xsd:boolean, xsd:integer, xsd:decimal, and xsd:dateTime—enforces type safety at the schema level. A trace record identified as TRAC-0001 might carry a duration_seconds attribute typed as xsd:decimal, a host_name attribute typed as xsd:string, and an exit_code attribute typed as xsd:integer, ensuring that the value 1505.64, the value node-b14, and the value 376 are each validated against their declared types. This separation of attribute definition from attribute value allows the same attribute to be reused across different entity types while preserving type discipline.

Values are stored in type-specific value tables, each holding the misc column that contains the actual data. Boolean attributes such as mandatory resolve to true or false for a given entity, as seen when entity STAN-0001 and entity STAN-0002 both carry a true value for attribute STAN-0003, while entity STAN-0004 carries false. Integer attributes such as priority hold numeric magnitudes like 3, 224, 4, and 622, each associated with a particular entity-attribute pair. String attributes capture free-form or enumerated content—Encoding 01, Enforcement 02, audit excerpt, de—while datetime attributes record precise moments such as 2023-04-16T02:44:01 or 2025-04-08T10:42:35. This type-partitioned storage model ensures that queries and validations can target the correct value domain without runtime coercion.

Subject, target, and role together model the relationships between governed objects, forming a directed graph of regulatory and operational dependencies. A subject identifies the source entity in a relationship, a target identifies the destination entity, and a role describes the nature of the connection from subject to target. In the mapping between regulatory frameworks, ARTI-0005 acts as a subject linked to target ARTI-0005 with the role observer, while ARTI-0007 serves as a subject linked to target ARTI-0005 with the role contributor, and ARTI-0004 acts as a subject linked to target ARTI-0006 with the role owner. These roles—observer, contributor, owner—convey the capacity in which the subject engages with the target, enabling the framework to distinguish between entities that merely monitor a standard and those that own or contribute to it.

**t_gdpr_article_subclass__gdpr_article**

| id | gdpr_id | gdpr_article_id | role |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0005 | ARTI-0005 | observer |
| ARTI-0002 | ARTI-0007 | ARTI-0005 | contributor |
| ARTI-0003 | ARTI-0007 | ARTI-0005 | observer |
| ARTI-0004 | ARTI-0004 | ARTI-0006 | owner |
| ARTI-0005 | ARTI-0001 | ARTI-0002 | owner |
| ARTI-0006 | ARTI-0004 | ARTI-0003 | reviewer |
| ARTI-0007 | ARTI-0006 | ARTI-0002 | observer |
| ARTI-0008 | ARTI-0005 | ARTI-0006 | contributor |

The practical effect of this design is a governance model in which every object is addressable by identifier, every object's properties are typed and scoped to specific entities, and every inter-object relationship is explicitly labeled with a role. A compliance officer can trace that requirement Minimum sampling rate (STAN-0001) falls under standard ARTI-0006, carries an effective_date of 2024-02-08, and has a mandatory attribute set to true, while simultaneously understanding that ARTI-0006 itself is linked to Article 9 through a relationship where ARTI-0004 plays the role of owner. This structure supports auditability, cross-referencing, and policy enforcement without requiring ad hoc joins or implicit conventions.

**t_requirement_under_standard**

| id | requirement | under_standard |
| --- | --- | --- |
| STAN-0001 | Minimum sampling rate | ARTI-0006 |
| STAN-0002 | Quality threshold | ARTI-0002 |
| STAN-0003 | Provenance tracking | ARTI-0006 |
| STAN-0004 | Access control policy | ARTI-0002 |
| STAN-0005 | Provenance tracking | ARTI-0006 |
| STAN-0006 | Access control policy | ARTI-0007 |

**t_requirement_under_standard_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| STAN-0001 | effective_date | xsd:date |
| STAN-0002 | enforcement | xsd:string |
| STAN-0003 | mandatory | xsd:boolean |
| STAN-0004 | priority | xsd:integer |
| STAN-0005 | review_cycle_days | xsd:integer |
| STAN-0006 | scope | xsd:string |
| STAN-0007 | encoding | xsd:string |
| STAN-0008 | label_text | xsd:string |

**t_requirement_under_standard_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| STAN-0001 | STAN-0001 | STAN-0003 | true |
| STAN-0002 | STAN-0002 | STAN-0003 | true |
| STAN-0003 | STAN-0003 | STAN-0003 | true |
| STAN-0004 | STAN-0004 | STAN-0003 | false |
| STAN-0005 | STAN-0005 | STAN-0003 | false |
| STAN-0006 | STAN-0006 | STAN-0003 | true |

**t_requirement_under_standard_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| STAN-0001 | STAN-0001 | STAN-0001 | 2024-02-08 |
| STAN-0002 | STAN-0002 | STAN-0001 | 2024-03-15 |
| STAN-0003 | STAN-0003 | STAN-0001 | 2024-09-13 |
| STAN-0004 | STAN-0004 | STAN-0001 | 2023-09-30 |
| STAN-0005 | STAN-0005 | STAN-0001 | 2025-02-13 |
| STAN-0006 | STAN-0006 | STAN-0001 | 2025-01-10 |

**t_requirement_under_standard_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| STAN-0001 | STAN-0001 | STAN-0004 | 3 |
| STAN-0002 | STAN-0001 | STAN-0005 | 224 |
| STAN-0003 | STAN-0002 | STAN-0004 | 4 |
| STAN-0004 | STAN-0002 | STAN-0005 | 622 |
| STAN-0005 | STAN-0003 | STAN-0004 | 1 |
| STAN-0006 | STAN-0003 | STAN-0005 | 177 |
| STAN-0007 | STAN-0004 | STAN-0004 | 5 |
| STAN-0008 | STAN-0004 | STAN-0005 | 817 |

**t_requirement_under_standard_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| STAN-0001 | STAN-0001 | STAN-0007 | Encoding 01 |
| STAN-0002 | STAN-0001 | STAN-0002 | Enforcement 02 |
| STAN-0003 | STAN-0001 | STAN-0008 | audit excerpt |
| STAN-0004 | STAN-0001 | STAN-0009 | de |
| STAN-0005 | STAN-0001 | STAN-0006 | Scope 05 |
| STAN-0006 | STAN-0002 | STAN-0007 | Encoding 06 |
| STAN-0007 | STAN-0002 | STAN-0002 | Enforcement 07 |
| STAN-0008 | STAN-0002 | STAN-0008 | nightly summary |

**t_trace_basic_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| TRAC-0001 | duration_seconds | xsd:decimal |
| TRAC-0002 | end_time | xsd:dateTime |
| TRAC-0003 | exit_code | xsd:integer |
| TRAC-0004 | host_name | xsd:string |
| TRAC-0005 | log_level | xsd:string |
| TRAC-0006 | phase | xsd:string |
| TRAC-0007 | retry_count | xsd:integer |
| TRAC-0008 | scheduled_at | xsd:dateTime |