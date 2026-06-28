---
chapter_id: ch_live_requirement_traces_to_85d433
topic_id: 23
family: 03_directive_governance
cited_terms: ['requirement_traces_to', 'column_tag_from_annotator', 'ebpf_program_governed_by_directive']
model: engine-refine
---

Within governance and compliance architectures, the distinction between an entity and its attributes forms the backbone of traceability and auditability. An entity—whether a column tagged by an annotator, an eBPF program subject to a directive, or a requirement traced to a control—carries a unique identifier that anchors it across the system: TRAC-0001 for a Network Segmentation Rule, ANNO-0001 for a column-level annotation on ingestion_latency, or DIRE-0001 for a tracepoint_sched program governed by a directive. These identifiers are not merely keys; they are the stable reference points that permit cross-referencing between requirements, annotations, and enforcement policies. A single entity may accumulate multiple attributes, each typed to constrain the domain of permissible values. The attribute definition itself—capturing a name such as confidence, dimension_kind, effective_date, or mandatory—declares its type through an XML Schema datatype: xsd:decimal for numerical precision, xsd:string for categorical labels, xsd:dateTime for temporal stamps, xsd:boolean for binary enforcement flags, and xsd:integer for ordinal priorities. This separation of attribute schema from attribute value ensures that the same attribute definition can be instantiated across heterogeneous entities without type ambiguity.

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

**t_column_tag_from_annotator**

| id | column | by_annotator |
| --- | --- | --- |
| ANNO-0001 | ingestion_latency | TRAC-0001 |
| ANNO-0002 | compliance_flag | TRAC-0007 |
| ANNO-0003 | api_version | TRAC-0004 |
| ANNO-0004 | api_version | TRAC-0007 |
| ANNO-0005 | compliance_flag | TRAC-0001 |
| ANNO-0006 | event_timestamp | TRAC-0007 |

**t_column_tag_from_annotator_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ANNO-0001 | confidence | xsd:decimal |
| ANNO-0002 | dimension_kind | xsd:string |
| ANNO-0003 | method | xsd:string |
| ANNO-0004 | recorded_at | xsd:dateTime |
| ANNO-0005 | uncertainty | xsd:decimal |
| ANNO-0006 | unit | xsd:string |
| ANNO-0007 | value | xsd:decimal |
| ANNO-0008 | encoding | xsd:string |

**t_ebpf_program_governed_by_directive**

| id | ebpf |
| --- | --- |
| DIRE-0001 | tracepoint_sched |
| DIRE-0002 | xdp_fwd |
| DIRE-0003 | tc_egress |
| DIRE-0004 | xdp_fwd |
| DIRE-0005 | tracepoint_sched |
| DIRE-0006 | tc_egress |

**t_ebpf_program_governed_by_directive_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| DIRE-0001 | effective_date | xsd:date |
| DIRE-0002 | enforcement | xsd:string |
| DIRE-0003 | mandatory | xsd:boolean |
| DIRE-0004 | priority | xsd:integer |
| DIRE-0005 | review_cycle_days | xsd:integer |
| DIRE-0006 | scope | xsd:string |
| DIRE-0007 | encoding | xsd:string |
| DIRE-0008 | label_text | xsd:string |

**t_ebpf_program_governed_by_directive_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DIRE-0001 | DIRE-0001 | DIRE-0003 | false |
| DIRE-0002 | DIRE-0002 | DIRE-0003 | true |
| DIRE-0003 | DIRE-0003 | DIRE-0003 | true |
| DIRE-0004 | DIRE-0004 | DIRE-0003 | true |
| DIRE-0005 | DIRE-0005 | DIRE-0003 | false |
| DIRE-0006 | DIRE-0006 | DIRE-0003 | false |

**t_ebpf_program_governed_by_directive_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DIRE-0001 | DIRE-0001 | DIRE-0001 | 2024-06-04 |
| DIRE-0002 | DIRE-0002 | DIRE-0001 | 2025-03-23 |
| DIRE-0003 | DIRE-0003 | DIRE-0001 | 2025-01-20 |
| DIRE-0004 | DIRE-0004 | DIRE-0001 | 2024-06-12 |
| DIRE-0005 | DIRE-0005 | DIRE-0001 | 2025-03-15 |
| DIRE-0006 | DIRE-0006 | DIRE-0001 | 2024-12-23 |

**t_ebpf_program_governed_by_directive_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DIRE-0001 | DIRE-0001 | DIRE-0004 | 5 |
| DIRE-0002 | DIRE-0001 | DIRE-0005 | 280 |
| DIRE-0003 | DIRE-0002 | DIRE-0004 | 3 |
| DIRE-0004 | DIRE-0002 | DIRE-0005 | 996 |
| DIRE-0005 | DIRE-0003 | DIRE-0004 | 5 |
| DIRE-0006 | DIRE-0003 | DIRE-0005 | 471 |
| DIRE-0007 | DIRE-0004 | DIRE-0004 | 1 |
| DIRE-0008 | DIRE-0004 | DIRE-0005 | 105 |

**t_ebpf_program_governed_by_directive_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DIRE-0001 | DIRE-0001 | DIRE-0007 | Encoding 01 |
| DIRE-0002 | DIRE-0001 | DIRE-0002 | Enforcement 02 |
| DIRE-0003 | DIRE-0001 | DIRE-0008 | audit excerpt |
| DIRE-0004 | DIRE-0001 | DIRE-0009 | en |
| DIRE-0005 | DIRE-0001 | DIRE-0006 | Scope 05 |
| DIRE-0006 | DIRE-0002 | DIRE-0007 | Encoding 06 |
| DIRE-0007 | DIRE-0002 | DIRE-0002 | Enforcement 07 |
| DIRE-0008 | DIRE-0002 | DIRE-0008 | audit excerpt |

The value of an attribute is stored in a misc column within a typed value table, where the actual data—0.302 for a confidence score, 639.96 for a latency metric, "Dimension Kind 01" for a categorical dimension, or "2025-01-07T23:20:10" for a recorded timestamp—resides independently of the attribute's structural definition. This design permits a single entity to hold multiple attribute values of different types without requiring a monolithic row structure. Entity ANNO-0001, for instance, carries a confidence value of 0.302, a dimension_kind of "Dimension Kind 01", an encoding label of "Encoding 02", and a recorded_at timestamp of "2025-01-07T23:20:10", each drawn from a distinct typed value table but unified under the same entity identifier. The attr column in these value tables serves as the foreign key back to the attribute definition, binding the misc value to its declared attr_type. This pattern recurs across domains: entity DIRE-0001 holds an effective_date of "2024-06-04", an enforcement classification of "Enforcement 02", a mandatory flag of false, and a priority of 5, each value typed and traceable to its attribute definition.

Relationships between entities are expressed through subject-target-role triples, where a subject entity is linked to a target entity under a role that qualifies the nature of the connection. In requirement tracing, requirement TRAC-0001 (Network Segmentation Rule) appears as the subject linked to target TRAC-0004 (Privacy Compliance Requirement) under the role of owner, while the same subject-target pair is also connected under the role of contributor, indicating that a single relationship can carry multiple semantic qualifications. The traces_to column in the linkage table—values such as HIPAA Security Rule, Risk Assessment Matrix, Compliance Audit Checklist, and ISO 27001 Control—provides the human-readable label for the target, while the requirement column—Network Segmentation Rule, Access Control Mandate, Privacy Compliance Requirement—identifies the originating obligation. This tripartite structure (subject, target, role) enables fine-grained provenance: one can distinguish whether a requirement is owned, reviewed, or contributed to, and trace each linkage back to its source entity.

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

The attr_type system enforces semantic discipline across all attribute values, ensuring that temporal data carries xsd:dateTime or xsd:date types (as seen in recorded_at values like "2024-03-06T18:58:36" and effective_date values like "2025-03-23"), that numerical metrics use xsd:decimal (0.302, 639.96, 206.06) or xsd:integer (5, 280, 3, 996), and that categorical or textual data uses xsd:string. The by_annotator column in the annotation linkage table—values such as TRAC-0001, TRAC-0007, TRAC-0004—further demonstrates how identifiers from one domain (requirements) can serve as annotators in another (column tagging), creating a cross-domain provenance chain. The value column in varchar value tables holds strings like "nightly summary", "en", "audit excerpt", and "Encoding 01", each representing a misc value whose interpretation is entirely dependent on its associated attr_name and attr_type. This typed-value architecture, combined with subject-target-role relationships and stable entity identifiers, provides a foundation for audit trails that are both machine-verifiable and human-interpretable, supporting compliance frameworks that demand precise attribution of requirements, annotations, and enforcement directives.

**t_column_tag_from_annotator_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ANNO-0001 | ANNO-0001 | ANNO-0004 | 2025-01-07T23:20:10 |
| ANNO-0002 | ANNO-0002 | ANNO-0004 | 2024-03-06T18:58:36 |
| ANNO-0003 | ANNO-0003 | ANNO-0004 | 2024-05-08T12:18:31 |
| ANNO-0004 | ANNO-0004 | ANNO-0004 | 2023-05-11T14:25:42 |
| ANNO-0005 | ANNO-0005 | ANNO-0004 | 2023-11-26T14:31:09 |
| ANNO-0006 | ANNO-0006 | ANNO-0004 | 2024-05-18T09:15:26 |

**t_column_tag_from_annotator_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ANNO-0001 | ANNO-0001 | ANNO-0001 | 0.302 |
| ANNO-0002 | ANNO-0001 | ANNO-0005 | 639.96 |
| ANNO-0003 | ANNO-0001 | ANNO-0007 | 206.06 |
| ANNO-0004 | ANNO-0002 | ANNO-0001 | 0.049 |
| ANNO-0005 | ANNO-0002 | ANNO-0005 | 98.50 |
| ANNO-0006 | ANNO-0002 | ANNO-0007 | 895.36 |
| ANNO-0007 | ANNO-0003 | ANNO-0001 | 0.609 |
| ANNO-0008 | ANNO-0003 | ANNO-0005 | 158.17 |

**t_column_tag_from_annotator_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ANNO-0001 | ANNO-0001 | ANNO-0002 | Dimension Kind 01 |
| ANNO-0002 | ANNO-0001 | ANNO-0008 | Encoding 02 |
| ANNO-0003 | ANNO-0001 | ANNO-0009 | nightly summary |
| ANNO-0004 | ANNO-0001 | ANNO-0010 | en |
| ANNO-0005 | ANNO-0001 | ANNO-0003 | hybrid |
| ANNO-0006 | ANNO-0001 | ANNO-0006 | kg |
| ANNO-0007 | ANNO-0002 | ANNO-0002 | Dimension Kind 07 |
| ANNO-0008 | ANNO-0002 | ANNO-0008 | Encoding 08 |