---
chapter_id: ch_live_agent_basic_f6c4b6
topic_id: 35
family: 05_provo_lineage
cited_terms: ['agent_basic', 'verification_targets_artifact', 'evidence_for_audit']
model: engine-refine
---

An agent is a discrete, versioned entity whose identity is anchored by a stable identifier such as AGEN-0001 through AGEN-0004, each carrying a distinct footprint measured in size bytes—ranging from 20,883,723 bytes for AGEN-0004 to 548,859,900 bytes for AGEN-0003—and a version number that tracks its evolution across releases, from version 1 for the earliest instances to version 12 for the most recent iteration of AGEN-0004. The agent key serves as a secondary reference that may point to a different agent within the same family, as when AGEN-0001's key resolves to AGEN-0005 or AGEN-0003's key collapses back onto AGEN-0003 itself, establishing a web of inter-agent relationships that transcend simple linear identification. A parallel dimension table enriches each agent with a human-readable label—Agent Label 01 through Agent Label 04—and a category designation—Agent Category 01 through Agent Category 04—that groups agents by functional or organizational purpose, enabling queries that operate at the level of classification rather than individual identity.

**fact_agent**

| id | agent_key | size_bytes | version |
| --- | --- | --- | --- |
| AGEN-0001 | AGEN-0005 | 211345771 | 7 |
| AGEN-0002 | AGEN-0003 | 458577289 | 1 |
| AGEN-0003 | AGEN-0004 | 548859900 | 1 |
| AGEN-0004 | AGEN-0004 | 20883723 | 12 |
| AGEN-0005 | AGEN-0006 | 490849751 | 11 |

**dim_agent**

| id | agent_label | agent_category |
| --- | --- | --- |
| AGEN-0001 | Agent Label 01 | Agent Category 01 |
| AGEN-0002 | Agent Label 02 | Agent Category 02 |
| AGEN-0003 | Agent Label 03 | Agent Category 03 |
| AGEN-0004 | Agent Label 04 | Agent Category 04 |
| AGEN-0005 | Agent Label 05 | Agent Category 05 |
| AGEN-0006 | Agent Label 06 | Agent Category 06 |

Verification targets form a second structural layer, where each artifact record carries a verification type such as Compliance review cycle or Data lineage audit, and points to a concrete target artifact like Sensor calibration matrix or Source code branch. The linkage between verification and target is mediated by a junction table that assigns a role—reviewer, owner, or contributor—to each pairing, thereby encoding not merely that a verification applies to a target, but the nature of the relationship between them. For instance, the verification identified as ARTI-0002 assumes the role of reviewer against target ARTI-0002, while ARTI-0005 is associated with two distinct targets, ARTI-0001, under the roles of reviewer and contributor respectively, demonstrating that a single verification event may carry multiple stakeholder assignments.

**t_verification_targets_artifact**

| id | verification |
| --- | --- |
| ARTI-0001 | Compliance review cycle |
| ARTI-0002 | Compliance review cycle |
| ARTI-0003 | Data lineage audit |
| ARTI-0004 | Compliance review cycle |
| ARTI-0005 | Test suite execution |
| ARTI-0006 | Governance policy scan |

**t_verification_targets_artifact_targets_artifact**

| id | targets_artifact |
| --- | --- |
| ARTI-0001 | Sensor calibration matrix |
| ARTI-0002 | Source code branch |
| ARTI-0003 | Sensor calibration matrix |
| ARTI-0004 | Sensor calibration matrix |
| ARTI-0005 | Ingestion manifest |
| ARTI-0006 | Ingestion manifest |

**t_verification_targets_artifact__targets_artifact**

| id | verification_id | targets_artifact_id | role |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0002 | ARTI-0002 | reviewer |
| ARTI-0002 | ARTI-0004 | ARTI-0003 | owner |
| ARTI-0003 | ARTI-0005 | ARTI-0001 | reviewer |
| ARTI-0004 | ARTI-0005 | ARTI-0001 | contributor |
| ARTI-0005 | ARTI-0002 | ARTI-0005 | reviewer |
| ARTI-0006 | ARTI-0005 | ARTI-0006 | owner |
| ARTI-0007 | ARTI-0006 | ARTI-0004 | owner |
| ARTI-0008 | ARTI-0006 | ARTI-0002 | reviewer |

Evidence records constitute the third pillar, each identified by a code such as AUDI-0001 through AUDI-0004 and described by a free-text evidence field containing values like AuditTrail_20231015, ChainOfCustody_Batch44, or SignatureBlock_99A1. The attributes of these evidence records are themselves first-class entities, defined by an attribute name—confidence, dimension_kind, method, recorded_at—and an attribute type drawn from an XML Schema vocabulary, including xsd:decimal, xsd:string, and xsd:dateTime. This separation of attribute definition from attribute value permits a single evidence record to carry heterogeneous properties without schema rigidity, as the type system governs validation while the name field governs semantics.

**t_evidence_for_audit**

| id | evidence |
| --- | --- |
| AUDI-0001 | AuditTrail_20231015 |
| AUDI-0002 | ChainOfCustody_Batch44 |
| AUDI-0003 | ChainOfCustody_Batch44 |
| AUDI-0004 | SignatureBlock_99A1 |
| AUDI-0005 | NetworkPacketCapture_0xFF |
| AUDI-0006 | AuditTrail_20231015 |

**t_evidence_for_audit_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| AUDI-0001 | confidence | xsd:decimal |
| AUDI-0002 | dimension_kind | xsd:string |
| AUDI-0003 | method | xsd:string |
| AUDI-0004 | recorded_at | xsd:dateTime |
| AUDI-0005 | uncertainty | xsd:decimal |
| AUDI-0006 | unit | xsd:string |
| AUDI-0007 | value | xsd:decimal |
| AUDI-0008 | encoding | xsd:string |

Attribute values are materialized in three type-specific tables, each binding an entity identifier and an attribute identifier to a concrete value. Decimal attributes such as confidence hold numeric values like 0.978 and 0.546, with secondary measures reaching 590.71 and 212.01; string attributes capture categorical descriptors such as Dimension Kind 01, Encoding 02, intake form, and the fragment fr; and datetime attributes record precise timestamps including 2024-10-15T21:07:57, 2024-11-22T11:38:19, 2023-06-03T22:32:06, and 2024-07-15T05:43:09. The entity identifier in these value tables references the evidence record to which the attribute belongs, while the attribute identifier points into the attribute definition table, creating a normalized triple of entity, attribute, and value that supports arbitrary attribute expansion without table modification.

**t_evidence_for_audit_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AUDI-0001 | AUDI-0001 | AUDI-0004 | 2024-10-15T21:07:57 |
| AUDI-0002 | AUDI-0002 | AUDI-0004 | 2024-11-22T11:38:19 |
| AUDI-0003 | AUDI-0003 | AUDI-0004 | 2023-06-03T22:32:06 |
| AUDI-0004 | AUDI-0004 | AUDI-0004 | 2024-07-15T05:43:09 |
| AUDI-0005 | AUDI-0005 | AUDI-0004 | 2024-03-30T03:15:54 |
| AUDI-0006 | AUDI-0006 | AUDI-0004 | 2024-06-18T04:52:41 |

**t_evidence_for_audit_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AUDI-0001 | AUDI-0001 | AUDI-0001 | 0.978 |
| AUDI-0002 | AUDI-0001 | AUDI-0005 | 590.71 |
| AUDI-0003 | AUDI-0001 | AUDI-0007 | 212.01 |
| AUDI-0004 | AUDI-0002 | AUDI-0001 | 0.546 |
| AUDI-0005 | AUDI-0002 | AUDI-0005 | 882.77 |
| AUDI-0006 | AUDI-0002 | AUDI-0007 | 90.06 |
| AUDI-0007 | AUDI-0003 | AUDI-0001 | 0.051 |
| AUDI-0008 | AUDI-0003 | AUDI-0005 | 692.35 |

**t_evidence_for_audit_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AUDI-0001 | AUDI-0001 | AUDI-0002 | Dimension Kind 01 |
| AUDI-0002 | AUDI-0001 | AUDI-0008 | Encoding 02 |
| AUDI-0003 | AUDI-0001 | AUDI-0009 | intake form |
| AUDI-0004 | AUDI-0001 | AUDI-0010 | fr |
| AUDI-0005 | AUDI-0001 | AUDI-0003 | automated |
| AUDI-0006 | AUDI-0001 | AUDI-0006 | count |
| AUDI-0007 | AUDI-0002 | AUDI-0002 | Dimension Kind 07 |
| AUDI-0008 | AUDI-0002 | AUDI-0008 | Encoding 08 |