---
chapter_id: ch_live_attestation_signed_by_e2b9b7
topic_id: 125
family: 03_directive_governance
cited_terms: ['attestation_signed_by', 'evidence_basic', 'rollback_relation']
model: engine-refine
---

An identifier serves as the immutable anchor of any attestation or evidence record, a stable reference that survives the volatility of its associated metadata. In the attestation domain, identifiers such as SIGN-0001 through SIGN-0004 uniquely distinguish individual review events—Incident Response Verification, SOC2 Compliance Review, System Access Certification—each of which may carry a heterogeneous set of properties. Similarly, evidence records are keyed by identifiers like EVID-0001 through EVID-0004, anchoring artifacts such as Data Lineage Certification, Compliance checklist, and Provenance manifest. Rollback relations follow the same convention, with identifiers RELA-0001 through RELA-0004 tying named operations like release-tag-v3.2 and telemetry-archive-oct to the evidence they reference. The identifier is the sole invariant across the entire data model; every attribute, every value, every foreign-key linkage ultimately resolves back to it.

**t_attestation_signed_by**

| id | attestation |
| --- | --- |
| SIGN-0001 | Incident Response Verification |
| SIGN-0002 | SOC2 Compliance Review |
| SIGN-0003 | System Access Certification |
| SIGN-0004 | Incident Response Verification |
| SIGN-0005 | SOC2 Compliance Review |
| SIGN-0006 | Model Performance Signoff |

**t_attestation_signed_by_attr**

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

**t_attestation_signed_by_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SIGN-0001 | SIGN-0001 | SIGN-0003 | 407 |
| SIGN-0002 | SIGN-0001 | SIGN-0007 | 30 |
| SIGN-0003 | SIGN-0002 | SIGN-0003 | 633 |
| SIGN-0004 | SIGN-0002 | SIGN-0007 | 373 |
| SIGN-0005 | SIGN-0003 | SIGN-0003 | 166 |
| SIGN-0006 | SIGN-0003 | SIGN-0007 | 260 |
| SIGN-0007 | SIGN-0004 | SIGN-0003 | 596 |
| SIGN-0008 | SIGN-0004 | SIGN-0007 | 36 |

**t_attestation_signed_by_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SIGN-0001 | SIGN-0001 | SIGN-0004 | gw-12 |
| SIGN-0002 | SIGN-0001 | SIGN-0005 | Log Level 02 |
| SIGN-0003 | SIGN-0001 | SIGN-0006 | closeout |
| SIGN-0004 | SIGN-0001 | SIGN-0010 | pending |
| SIGN-0005 | SIGN-0001 | SIGN-0011 | Triggered By 05 |
| SIGN-0006 | SIGN-0002 | SIGN-0004 | worker-07 |
| SIGN-0007 | SIGN-0002 | SIGN-0005 | Log Level 07 |
| SIGN-0008 | SIGN-0002 | SIGN-0006 | review |

**t_evidence_basic**

| id | evidence | dimension_kind | encoding |
| --- | --- | --- | --- |
| EVID-0001 | Data Lineage Certification | temperature | ascii |
| EVID-0002 | Compliance checklist | count | latin1 |
| EVID-0003 | Provenance manifest | temperature | utf8 |
| EVID-0004 | Data lineage graph | pressure | utf8 |
| EVID-0005 | Algorithmic Fairness Check | length | utf8 |
| EVID-0006 | Training Data Validation | temperature | ascii |

**t_rollback_relation**

| id | rollback | rolls_back_to |
| --- | --- | --- |
| RELA-0001 | release-tag-v3.2 | EVID-0003 |
| RELA-0002 | telemetry-archive-oct | EVID-0001 |
| RELA-0003 | nightly-sync-rollback | EVID-0003 |
| RELA-0004 | config-deploy-fail | EVID-0003 |
| RELA-0005 | model-checkpoint-88 | EVID-0003 |
| RELA-0006 | batch-processing-halt | EVID-0002 |

**t_rollback_relation_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| RELA-0001 | confidence | xsd:decimal |
| RELA-0002 | dimension_kind | xsd:string |
| RELA-0003 | method | xsd:string |
| RELA-0004 | recorded_at | xsd:dateTime |
| RELA-0005 | uncertainty | xsd:decimal |
| RELA-0006 | unit | xsd:string |
| RELA-0007 | value | xsd:decimal |
| RELA-0008 | encoding | xsd:string |

An attribute defines the shape of metadata that may be attached to an entity, decoupling the schema from the data. The attribute definition table enumerates property names—duration_seconds, end_time, exit_code, host_name for attestations; confidence, dimension_kind, method, recorded_at for rollback relations—alongside their corresponding attribute types, which are expressed as XML Schema Datatypes: xsd:decimal, xsd:dateTime, xsd:integer, xsd:string. This separation of attribute definition from attribute value is deliberate. It permits the same entity to carry an arbitrary number of properties without requiring schema migration, and it centralizes type information so that validation and serialization logic need not be duplicated across value tables.

**t_attestation_signed_by_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SIGN-0001 | SIGN-0001 | SIGN-0002 | 2023-11-18T17:18:55 |
| SIGN-0002 | SIGN-0001 | SIGN-0008 | 2024-04-18T06:27:25 |
| SIGN-0003 | SIGN-0001 | SIGN-0009 | 2023-01-19T17:50:39 |
| SIGN-0004 | SIGN-0002 | SIGN-0002 | 2025-06-04T16:32:01 |
| SIGN-0005 | SIGN-0002 | SIGN-0008 | 2025-04-02T11:15:56 |
| SIGN-0006 | SIGN-0002 | SIGN-0009 | 2023-07-13T05:58:46 |
| SIGN-0007 | SIGN-0003 | SIGN-0002 | 2023-10-19T08:02:32 |
| SIGN-0008 | SIGN-0003 | SIGN-0008 | 2025-01-01T00:25:23 |

**t_attestation_signed_by_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SIGN-0001 | SIGN-0001 | SIGN-0001 | 2368.11 |
| SIGN-0002 | SIGN-0002 | SIGN-0001 | 5757.34 |
| SIGN-0003 | SIGN-0003 | SIGN-0001 | 785.50 |
| SIGN-0004 | SIGN-0004 | SIGN-0001 | 5676.02 |
| SIGN-0005 | SIGN-0005 | SIGN-0001 | 992.24 |
| SIGN-0006 | SIGN-0006 | SIGN-0001 | 815.51 |

**t_rollback_relation_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RELA-0001 | RELA-0001 | RELA-0004 | 2024-05-22T12:01:29 |
| RELA-0002 | RELA-0002 | RELA-0004 | 2024-03-03T15:52:05 |
| RELA-0003 | RELA-0003 | RELA-0004 | 2024-01-11T10:28:20 |
| RELA-0004 | RELA-0004 | RELA-0004 | 2025-05-09T21:44:43 |
| RELA-0005 | RELA-0005 | RELA-0004 | 2023-08-15T18:37:49 |
| RELA-0006 | RELA-0006 | RELA-0004 | 2023-12-04T10:02:30 |

**t_rollback_relation_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RELA-0001 | RELA-0001 | RELA-0001 | 0.023 |
| RELA-0002 | RELA-0001 | RELA-0005 | 717.59 |
| RELA-0003 | RELA-0001 | RELA-0007 | 918.13 |
| RELA-0004 | RELA-0002 | RELA-0001 | 0.999 |
| RELA-0005 | RELA-0002 | RELA-0005 | 360.64 |
| RELA-0006 | RELA-0002 | RELA-0007 | 735.68 |
| RELA-0007 | RELA-0003 | RELA-0001 | 0.137 |
| RELA-0008 | RELA-0003 | RELA-0005 | 883.40 |

An entity is the concrete instance to which attribute values are bound. In the value tables, the entity_id column establishes this binding, pointing back to the primary key of the entity's defining table. For example, the decimal value 2368.11 is bound to entity SIGN-0001 via attribute SIGN-0001, while the datetime value 2023-11-18T17:18:55 is bound to the same entity via attribute SIGN-0002. The entity_id thus functions as a foreign key into the entity table, creating a many-to-one relationship: a single entity may accumulate dozens of attribute values across multiple type-specific value tables, yet each value traces unambiguously to one entity and one attribute.

The value itself—labeled misc in the schema—is the terminal data point, and its physical representation is determined by the attribute type. Decimal values such as 0.023, 717.59, 918.13, and 5757.34 reside in the decimal value table; datetime values like 2024-05-22T12:01:29 and 2025-06-04T16:32:01 in the datetime table; integer values such as 407, 633, and 373 in the integer table; and string values including gw-12, Log Level 02, closeout, and pending in the varchar table. This type-disaggregated storage avoids the cost of NULL columns and enforces type safety at the storage layer, at the expense of requiring the application to route reads and writes to the correct value table based on the attribute's declared type.

Dimension kind and encoding are domain-specific attributes that classify the nature of evidence. Dimension kind values such as temperature, count, and pressure describe the physical or logical category of the underlying data, while encoding values—ascii, latin1, utf8—specify the character encoding of textual evidence artifacts. These attributes are themselves defined in the attribute definition table and stored as varchar values in the corresponding value tables, meaning they participate in the same entity-attribute-value binding as any other property. A rollback relation, for instance, may carry a dimension_kind attribute with value Dimension Kind 01 and a recorded_at attribute with value 2024-05-22T12:01:29, both bound to the same entity RELA-0001.

**t_rollback_relation_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RELA-0001 | RELA-0001 | RELA-0002 | Dimension Kind 01 |
| RELA-0002 | RELA-0001 | RELA-0008 | Encoding 02 |
| RELA-0003 | RELA-0001 | RELA-0009 | pre-release note |
| RELA-0004 | RELA-0001 | RELA-0010 | de |
| RELA-0005 | RELA-0001 | RELA-0003 | automated |
| RELA-0006 | RELA-0001 | RELA-0006 | kg |
| RELA-0007 | RELA-0002 | RELA-0002 | Dimension Kind 07 |
| RELA-0008 | RELA-0002 | RELA-0008 | Encoding 08 |

The foreign-key architecture of the model creates a layered reference structure. The value tables reference their entities via entity_id and their attributes via attr_id, both of which are foreign keys into the entity and attribute definition tables respectively. The rollback relation table introduces an additional foreign key—rolls_back_to—which points into the evidence table, establishing a cross-domain linkage between rollback operations and the evidence they revert. This design permits attestations, evidence, and rollback relations to share a common attribute-value infrastructure while maintaining their distinct identity tables, a pattern that scales cleanly as new entity types are introduced without requiring changes to the attribute or value infrastructure.