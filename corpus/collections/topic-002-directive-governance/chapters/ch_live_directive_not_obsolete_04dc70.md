---
chapter_id: ch_live_directive_not_obsolete_04dc70
topic_id: 2
family: 03_directive_governance
cited_terms: ['directive_not_obsolete', 'span_within_trace', 'constraint_evaluated_during']
model: engine-refine
---

In governance frameworks that track directive compliance and constraint evaluation, every record is anchored by a unique identifier that serves as the immutable reference point across all relational joins. Identifiers such as OBSO-0001 through OBSO-0004 for directive records, TRAC-0001 through TRAC-0004 for trace spans, and DURI-0001 through DURI-0004 for constraint evaluations provide the stable keys that bind attribute definitions, typed values, and relationship mappings into a coherent entity. The directive identified as OBSO-0001, for instance, corresponds to the CIS Critical Security Controls and is cross-referenced against the IHE Patient Identity Cross standard; its identifier persists unchanged across every value table, attribute definition, and relationship record that references it, ensuring that auditors and automated systems can unambiguously resolve all metadata to a single governing directive.

**t_directive_not_obsolete**

| id | directive | directive_2 |
| --- | --- | --- |
| OBSO-0001 | CIS Critical Security Controls | IHE Patient Identity Cross |
| OBSO-0002 | OGC API Features Standard | HL7 FHIR Implementation Guide |
| OBSO-0003 | IEEE 802.11ax Standard | HIPAA Security Rule |
| OBSO-0004 | CIS Benchmark Distribution 8 | OWASP Testing Guide v4 |
| OBSO-0005 | OWASP Application Security Guide | NIST CSF v2 Profile |
| OBSO-0006 | OWASP Application Security Guide | CIS Critical Security Controls |
| OBSO-0007 | MITRE ATT&CK Framework | OWASP Testing Guide v4 |

**t_directive_not_obsolete_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| OBSO-0001 | effective_date | xsd:date |
| OBSO-0002 | enforcement | xsd:string |
| OBSO-0003 | mandatory | xsd:boolean |
| OBSO-0004 | priority | xsd:integer |
| OBSO-0005 | review_cycle_days | xsd:integer |
| OBSO-0006 | scope | xsd:string |
| OBSO-0007 | encoding | xsd:string |
| OBSO-0008 | label_text | xsd:string |

**t_directive_not_obsolete_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OBSO-0001 | OBSO-0001 | OBSO-0004 | 5 |
| OBSO-0002 | OBSO-0001 | OBSO-0005 | 703 |
| OBSO-0003 | OBSO-0002 | OBSO-0004 | 4 |
| OBSO-0004 | OBSO-0002 | OBSO-0005 | 418 |
| OBSO-0005 | OBSO-0003 | OBSO-0004 | 2 |
| OBSO-0006 | OBSO-0003 | OBSO-0005 | 865 |
| OBSO-0007 | OBSO-0004 | OBSO-0004 | 5 |
| OBSO-0008 | OBSO-0004 | OBSO-0005 | 415 |

Attributes and their associated types form the schema layer that describes what properties each entity may carry, decoupling structural definition from stored values. The attribute registry assigns names such as effective_date, enforcement, mandatory, and priority to each entity, while the attr_type column enforces a strict typing discipline using XML Schema datatypes—xsd:date for temporal fields, xsd:string for free-form text, xsd:boolean for binary flags, and xsd:integer for numeric measures. This separation of attribute metadata from value storage enables heterogeneous value types to be persisted in dedicated typed tables without compromising referential integrity. A directive like OBSO-0002, which maps to the OGC API Features Standard and the HL7 FHIR Implementation Guide, carries an effective_date typed as xsd:date with the concrete value 2024-03-22, while its mandatory flag is stored as xsd:boolean with the value false, each residing in its appropriately typed value table and linked back to the entity through the entity_id foreign key.

The entity column within each typed value table functions as the foreign key that binds a specific attribute value to its parent record, creating a normalized structure where boolean, date, integer, and varchar values are segregated into distinct tables—t_directive_not_obsolete_val_boolean, t_directive_not_obsolete_val_date, t_directive_not_obsolete_val_int, and t_directive_not_obsolete_val_varchar—yet remain traceable to their originating entity. This design ensures that a single entity such as DURI-0001, representing the Field Length Constraint evaluated during the Quality Check Phase, can simultaneously hold a date value of 2024-01-04 in its date table, a boolean value of false in its boolean table, an integer value of 2 in its integer table, and a varchar value of Encoding 01 in its varchar table, all while maintaining a clean type boundary that prevents cross-contamination of data formats. The attr_id column within each value table further refines this linkage by pointing to the specific attribute definition, so that the integer value 590 stored against entity DURI-0001 is unambiguously associated with attribute DURI-0005 rather than any other property the entity may possess.

**t_directive_not_obsolete_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OBSO-0001 | OBSO-0001 | OBSO-0003 | true |
| OBSO-0002 | OBSO-0002 | OBSO-0003 | false |
| OBSO-0003 | OBSO-0003 | OBSO-0003 | false |
| OBSO-0004 | OBSO-0004 | OBSO-0003 | false |
| OBSO-0005 | OBSO-0005 | OBSO-0003 | true |
| OBSO-0006 | OBSO-0006 | OBSO-0003 | true |
| OBSO-0007 | OBSO-0007 | OBSO-0003 | true |

**t_directive_not_obsolete_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OBSO-0001 | OBSO-0001 | OBSO-0001 | 2024-10-21 |
| OBSO-0002 | OBSO-0002 | OBSO-0001 | 2024-03-22 |
| OBSO-0003 | OBSO-0003 | OBSO-0001 | 2024-07-16 |
| OBSO-0004 | OBSO-0004 | OBSO-0001 | 2024-10-21 |
| OBSO-0005 | OBSO-0005 | OBSO-0001 | 2023-05-26 |
| OBSO-0006 | OBSO-0006 | OBSO-0001 | 2023-06-12 |
| OBSO-0007 | OBSO-0007 | OBSO-0001 | 2025-06-10 |

**t_directive_not_obsolete_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OBSO-0001 | OBSO-0001 | OBSO-0007 | Encoding 01 |
| OBSO-0002 | OBSO-0001 | OBSO-0002 | Enforcement 02 |
| OBSO-0003 | OBSO-0001 | OBSO-0008 | intake form |
| OBSO-0004 | OBSO-0001 | OBSO-0009 | en |
| OBSO-0005 | OBSO-0001 | OBSO-0006 | Scope 05 |
| OBSO-0006 | OBSO-0002 | OBSO-0007 | Encoding 06 |
| OBSO-0007 | OBSO-0002 | OBSO-0002 | Enforcement 07 |
| OBSO-0008 | OBSO-0002 | OBSO-0008 | nightly summary |

Within the trace and span relationship model, the subject and target columns define the directional relationship between two entities, while the role column qualifies the nature of that relationship. The junction table t_span_within_trace__part_of maps span identifiers—such as TRAC-0006 representing the lambda-process-image or TRAC-0002 representing the http-get-users operation—to their parent trace contexts, with the subject column identifying the child span and the target column identifying the enclosing trace. The role column distinguishes between a contributor role, as seen when TRAC-0006 acts as a contributor to TRAC-0006, and an observer role, as when TRAC-0002 and TRAC-0003 are marked as observers of TRAC-0006, thereby capturing not merely the structural containment of one trace span within another but also the functional semantics of that containment. This tripartite relationship—subject, target, and role—enables governance systems to reconstruct execution hierarchies such as the auth-flow containing the auth-validate-token span or the checkout-session containing the http-get-users span, while simultaneously recording whether each contained span actively contributed to the parent or merely observed its execution.

**t_span_within_trace**

| id | span |
| --- | --- |
| TRAC-0001 | lambda-process-image |
| TRAC-0002 | http-get-users |
| TRAC-0003 | http-get-users |
| TRAC-0004 | auth-validate-token |
| TRAC-0005 | kafka-produce-metrics |
| TRAC-0006 | http-get-users |
| TRAC-0007 | batch-ingest-logs |
| TRAC-0008 | cache-lookup-session |

**t_span_within_trace_part_of**

| id | part_of |
| --- | --- |
| TRAC-0001 | data-ingest-job |
| TRAC-0002 | auth-flow |
| TRAC-0003 | checkout-session |
| TRAC-0004 | api-request |
| TRAC-0005 | payment-route |
| TRAC-0006 | auth-flow |

**t_span_within_trace__part_of**

| id | span_id | part_of_id | role |
| --- | --- | --- | --- |
| TRAC-0001 | TRAC-0006 | TRAC-0006 | contributor |
| TRAC-0002 | TRAC-0007 | TRAC-0001 | contributor |
| TRAC-0003 | TRAC-0002 | TRAC-0006 | observer |
| TRAC-0004 | TRAC-0003 | TRAC-0006 | observer |
| TRAC-0005 | TRAC-0007 | TRAC-0003 | owner |
| TRAC-0006 | TRAC-0008 | TRAC-0006 | owner |
| TRAC-0007 | TRAC-0001 | TRAC-0006 | contributor |
| TRAC-0008 | TRAC-0007 | TRAC-0003 | owner |

The misc column across all typed value tables serves as the generic value carrier, storing the actual data payload—whether true, false, 2024-10-21, 703, or intake form—in a column whose type is determined by the attr_type registered in the attribute definition table. This pattern of type-dispatched storage ensures that the database schema remains extensible: new attribute types can be introduced by adding new value tables and registering their attr_type in the attribute registry, without requiring schema migrations to the entity tables themselves. A constraint evaluation such as DURI-0003, which represents the Audit Log Requirement evaluated during System Startup, carries a mandatory flag of false and an effective_date of 2023-10-02, while its priority is recorded as the integer 2 and its enforcement note as the varchar Enforcement 02, each value independently typed yet collectively forming a complete compliance profile for the constraint. The identifier column within each value table provides a secondary key for the value record itself, enabling individual attribute values to be referenced, updated, or audited independently of their parent entity.

**t_constraint_evaluated_during**

| id | constraint | evaluated_during |
| --- | --- | --- |
| DURI-0001 | Field Length Constraint | Quality Check Phase |
| DURI-0002 | Data Retention Policy | Deployment Phase |
| DURI-0003 | Audit Log Requirement | System Startup |
| DURI-0004 | Null Value Limit | User Authentication |
| DURI-0005 | Data Retention Policy | System Startup |
| DURI-0006 | Data Retention Policy | Data Export |

**t_constraint_evaluated_during_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| DURI-0001 | effective_date | xsd:date |
| DURI-0002 | enforcement | xsd:string |
| DURI-0003 | mandatory | xsd:boolean |
| DURI-0004 | priority | xsd:integer |
| DURI-0005 | review_cycle_days | xsd:integer |
| DURI-0006 | scope | xsd:string |
| DURI-0007 | encoding | xsd:string |
| DURI-0008 | label_text | xsd:string |

**t_constraint_evaluated_during_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DURI-0001 | DURI-0001 | DURI-0003 | false |
| DURI-0002 | DURI-0002 | DURI-0003 | false |
| DURI-0003 | DURI-0003 | DURI-0003 | false |
| DURI-0004 | DURI-0004 | DURI-0003 | true |
| DURI-0005 | DURI-0005 | DURI-0003 | true |
| DURI-0006 | DURI-0006 | DURI-0003 | true |

**t_constraint_evaluated_during_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DURI-0001 | DURI-0001 | DURI-0001 | 2024-01-04 |
| DURI-0002 | DURI-0002 | DURI-0001 | 2025-03-02 |
| DURI-0003 | DURI-0003 | DURI-0001 | 2023-10-02 |
| DURI-0004 | DURI-0004 | DURI-0001 | 2023-03-04 |
| DURI-0005 | DURI-0005 | DURI-0001 | 2023-08-27 |
| DURI-0006 | DURI-0006 | DURI-0001 | 2023-09-26 |

**t_constraint_evaluated_during_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DURI-0001 | DURI-0001 | DURI-0004 | 2 |
| DURI-0002 | DURI-0001 | DURI-0005 | 590 |
| DURI-0003 | DURI-0002 | DURI-0004 | 2 |
| DURI-0004 | DURI-0002 | DURI-0005 | 52 |
| DURI-0005 | DURI-0003 | DURI-0004 | 1 |
| DURI-0006 | DURI-0003 | DURI-0005 | 88 |
| DURI-0007 | DURI-0004 | DURI-0004 | 5 |
| DURI-0008 | DURI-0004 | DURI-0005 | 829 |

**t_constraint_evaluated_during_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DURI-0001 | DURI-0001 | DURI-0007 | Encoding 01 |
| DURI-0002 | DURI-0001 | DURI-0002 | Enforcement 02 |
| DURI-0003 | DURI-0001 | DURI-0008 | pre-release note |
| DURI-0004 | DURI-0001 | DURI-0009 | en |
| DURI-0005 | DURI-0001 | DURI-0006 | Scope 05 |
| DURI-0006 | DURI-0002 | DURI-0007 | Encoding 06 |
| DURI-0007 | DURI-0002 | DURI-0002 | Enforcement 07 |
| DURI-0008 | DURI-0002 | DURI-0008 | audit excerpt |