---
chapter_id: ch_live_requirement_traces_to_46dbbb
topic_id: 26
family: 03_directive_governance
cited_terms: ['requirement_traces_to', 'cardinality_min_two_generic', 'entity_match_link']
model: engine-refine
---

In compliance and governance systems, every auditable fact must be anchored to something that can be found again, compared across time, and defended under scrutiny. Identifiers serve that function: they are stable, system-assigned keys that do not themselves carry business meaning but bind meaning across structures. When a Network Segmentation Rule is recorded as TRAC-0001 and later appears as both a requirement and a participant in a trace relationship, the identifier is what lets auditors confirm they are discussing the same obligation—not a similarly named control from another framework. The same stability applies to operational artifacts: Lab instrument SN-4491, Sample batch SB-2214, Dataset v4.2.1, and Governance policy DOC-992 are entities—concrete things in the governed environment that enter the model as first-class participants rather than as free text in a narrative. Entities matter because compliance is rarely about abstract policies alone; it is about whether specific instruments, datasets, batches, and documents actually satisfy, evidence, or inherit obligations.

**t_requirement_traces_to**

| id | requirement |
| --- | --- |
| TRAC-0001 | Network Segmentation Rule |
| TRAC-0002 | Access Control Mandate |
| TRAC-0003 | Privacy Compliance Requirement |
| TRAC-0004 | Privacy Compliance Requirement |
| TRAC-0005 | Access Control Mandate |
| TRAC-0006 | Encryption Standard |
| TRAC-0007 | System Availability Target |

**t_requirement_traces_to_traces_to**

| id | traces_to |
| --- | --- |
| TRAC-0001 | HIPAA Security Rule |
| TRAC-0002 | Risk Assessment Matrix |
| TRAC-0003 | Compliance Audit Checklist |
| TRAC-0004 | ISO 27001 Control |
| TRAC-0005 | Penetration Test Suite |
| TRAC-0006 | NIST SP 800-53 |
| TRAC-0007 | Vulnerability Scan Config |

Traceability extends entities and identifiers into directed relationships through the paired notions of subject and target. A subject is the record that initiates or owns the linkage; a target is what the subject is connected to. In practice, a requirement such as TRAC-0001 may trace to TRAC-0004—here, ISO 27001 Control—while TRAC-0004 (a Privacy Compliance Requirement) may simultaneously trace to the same control. That asymmetry is intentional: the subject side preserves which internal obligation is being mapped, while the target side names the external or canonical artifact that satisfies, implements, or evidences it. HIPAA Security Rule, Risk Assessment Matrix, Compliance Audit Checklist, and ISO 27001 Control are not interchangeable labels in this model; each target represents a distinct evidentiary or normative endpoint. Without explicit subject–target binding, organizations collapse “we comply with privacy” into undifferentiated checkbox logic and lose the ability to show which internal mandate maps to which external standard.

Role qualifies how a subject participates toward a target, and that qualification is often what separates governance theater from operational accountability. The same requirement-to-control pairing can mean different things depending on whether the subject acts as owner, reviewer, or contributor. TRAC-0001 toward TRAC-0004 as owner establishes custodial responsibility for the mapping itself; the same control may appear again with TRAC-0004 as reviewer when a Privacy Compliance Requirement is under secondary validation, or with TRAC-0001 as contributor when segmentation work feeds privacy controls without owning the full attestation. Roles matter in audits because they answer who may assert, who must validate, and who merely supplies input—distinctions that generic “related to” edges cannot preserve. Cardinality constraints such as AtLeastTwo and MinTwoRequired reinforce that relationships are governed, not merely permitted: a trace or association that must involve at least two related records cannot be satisfied by a singleton link, which prevents under-specified mappings from passing as complete coverage.

**t_cardinality_min_two_generic**

| id | cardinality | related |
| --- | --- | --- |
| GENE-0001 | AtLeastTwo | TRAC-0006 |
| GENE-0002 | MinTwoRequired | TRAC-0007 |
| GENE-0003 | AtLeastTwo | TRAC-0004 |
| GENE-0004 | AtLeastTwo | TRAC-0001 |
| GENE-0005 | DualAssociation | TRAC-0003 |
| GENE-0006 | TwinConstraint | TRAC-0002 |

Attributes and attribute types supply the typed metadata layer that makes entity links measurable, comparable, and machine-validatable. An attribute is a named property—confidence, dimension_kind, method, recorded_at—while attr type declares the semantic and syntactic contract under which values must be interpreted: xsd:decimal for numeric scores, xsd:string for categorical or lexical descriptors, xsd:dateTime for temporal provenance. Separating name from type is a governance decision: confidence is not merely “a number” but a decimal-scored assertion whose arithmetic and threshold comparisons are well defined, whereas method as xsd:string admits values like audit excerpt or es without forcing false precision. Entity match links illustrate why this layer exists: when Lab instrument SN-4491 is matched to TRAC-0005, or Dataset v4.2.1 and Governance policy DOC-992 both match TRAC-0004 and TRAC-0003 respectively, the link itself becomes an auditable object whose evidentiary strength depends on recorded properties, not on the mere fact of association.

**t_entity_match_link**

| id | entity | matches_entity |
| --- | --- | --- |
| LINK-0001 | Lab instrument SN-4491 | TRAC-0005 |
| LINK-0002 | Sample batch SB-2214 | TRAC-0004 |
| LINK-0003 | Dataset v4.2.1 | TRAC-0004 |
| LINK-0004 | Governance policy DOC-992 | TRAC-0003 |
| LINK-0005 | Governance policy DOC-992 | TRAC-0006 |
| LINK-0006 | Provenance log PR-7741 | TRAC-0006 |

**t_entity_match_link_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| LINK-0001 | confidence | xsd:decimal |
| LINK-0002 | dimension_kind | xsd:string |
| LINK-0003 | method | xsd:string |
| LINK-0004 | recorded_at | xsd:dateTime |
| LINK-0005 | uncertainty | xsd:decimal |
| LINK-0006 | unit | xsd:string |
| LINK-0007 | value | xsd:decimal |
| LINK-0008 | encoding | xsd:string |

Misc, in this architecture, denotes the concrete value payload stored against an attribute for a specific entity instance—the fact as recorded, not the schema that permits it. A confidence of 0.249 on LINK-0001 quantifies match strength; 0.772 on a separate decimal row shows that another link or attribute instance carries a different evidentiary weight. String misc values such as Dimension Kind 01, Encoding 02, and audit excerpt capture qualitative classification and provenance text without corrupting numeric or temporal columns. Datetime misc—2025-02-02T03:38:54 through 2025-05-20T07:58:08 on recorded_at—establishes when assertions were captured, which is essential for replaying compliance state as-of an audit period. Partitioning misc by type rather than coercing all values into a single untyped field preserves validation, indexing, and downstream analytics: auditors can filter stale mappings, engineers can enforce ranges on decimals, and governance teams can require timestamps on every published link.

**t_entity_match_link_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LINK-0001 | LINK-0001 | LINK-0004 | 2025-02-02T03:38:54 |
| LINK-0002 | LINK-0002 | LINK-0004 | 2024-07-01T04:17:43 |
| LINK-0003 | LINK-0003 | LINK-0004 | 2023-10-04T15:34:58 |
| LINK-0004 | LINK-0004 | LINK-0004 | 2025-05-20T07:58:08 |
| LINK-0005 | LINK-0005 | LINK-0004 | 2023-04-10T04:16:09 |
| LINK-0006 | LINK-0006 | LINK-0004 | 2023-09-16T03:40:04 |

**t_entity_match_link_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LINK-0001 | LINK-0001 | LINK-0001 | 0.249 |
| LINK-0002 | LINK-0001 | LINK-0005 | 448.20 |
| LINK-0003 | LINK-0001 | LINK-0007 | 699.43 |
| LINK-0004 | LINK-0002 | LINK-0001 | 0.772 |
| LINK-0005 | LINK-0002 | LINK-0005 | 156.67 |
| LINK-0006 | LINK-0002 | LINK-0007 | 439.51 |
| LINK-0007 | LINK-0003 | LINK-0001 | 0.389 |
| LINK-0008 | LINK-0003 | LINK-0005 | 388.52 |

**t_entity_match_link_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LINK-0001 | LINK-0001 | LINK-0002 | Dimension Kind 01 |
| LINK-0002 | LINK-0001 | LINK-0008 | Encoding 02 |
| LINK-0003 | LINK-0001 | LINK-0009 | audit excerpt |
| LINK-0004 | LINK-0001 | LINK-0010 | es |
| LINK-0005 | LINK-0001 | LINK-0003 | manual |
| LINK-0006 | LINK-0001 | LINK-0006 | count |
| LINK-0007 | LINK-0002 | LINK-0002 | Dimension Kind 07 |
| LINK-0008 | LINK-0002 | LINK-0008 | Encoding 08 |

Taken together, identifier, entity, subject, target, role, attr, attr_type, and misc form a closed evidentiary grammar. Identifiers knit records; entities ground the model in real assets and obligations; subject–target edges express traceability; roles assign accountability within those edges; attributes and types declare what may be said about a link; misc records what was actually said, when, and with what measured confidence. A reviewer examining why Privacy Compliance Requirement TRAC-0004 maps to ISO 27001 Control TRAC-0004 with reviewer responsibility, while Network Segmentation Rule TRAC-0001 contributes to the same control, is not reading a flat table of names but reconstructing a governed chain: internal mandates, external controls, accountable parties, cardinality-enforced completeness, and typed evidence that can be validated independently of the narrative that surrounds it. That composability is why these primitives appear in operational guides rather than as implementation detail—they are the minimum vocabulary for making compliance claims durable, queryable, and defensible.

**t_requirement_traces_to__traces_to**

| id | requirement_id | traces_to_id | role |
| --- | --- | --- | --- |
| TRAC-0001 | TRAC-0001 | TRAC-0004 | owner |
| TRAC-0002 | TRAC-0004 | TRAC-0004 | reviewer |
| TRAC-0003 | TRAC-0004 | TRAC-0004 | reviewer |
| TRAC-0004 | TRAC-0001 | TRAC-0004 | contributor |
| TRAC-0005 | TRAC-0007 | TRAC-0005 | contributor |
| TRAC-0006 | TRAC-0002 | TRAC-0003 | observer |
| TRAC-0007 | TRAC-0007 | TRAC-0002 | owner |
| TRAC-0008 | TRAC-0001 | TRAC-0002 | observer |