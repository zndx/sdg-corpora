---
chapter_id: ch_live_subclass_to_artifact_ecd19d
topic_id: 183
family: 01_foundation
cited_terms: ['subclass_to_artifact', 'annotation_at_tier', 'kernelhook_max_one_program_attached']
model: engine-refine
---

Identifiers serve as the immutable backbone of the system, providing stable handles across every artifact, annotation, and kernel hook. Each entity receives a scoped identifier—ARTI-0001 through ARTI-0004 for artifacts, TIER-0001 through TIER-0004 for annotation tiers, and ATTA-0001 through ATTA-0006 for kernel hooks and their attachments—ensuring that references remain unambiguous regardless of how underlying data evolves. These identifiers appear as foreign keys throughout the schema, linking annotations to their parent entities, attributes to their typed values, and kernel hooks to the programs they attach. The identifier space is partitioned by domain, which prevents collisions and makes it possible to trace a value back to its originating entity without ambiguity. For example, the annotation labeled "SensorCalibration Q4" carries the identifier TIER-0001 and is itself referenced as an entity in the value tables, demonstrating how an annotation can simultaneously be a subject of metadata and a target of further annotation.

**t_annotation_at_tier**

| id | annotation | at_tier |
| --- | --- | --- |
| TIER-0001 | SensorCalibration Q4 | ATTA-0005 |
| TIER-0002 | TelemetryLabel HighLatency | ATTA-0004 |
| TIER-0003 | QualityFlag Pass | ATTA-0006 |
| TIER-0004 | DatasetVersion v3.2.1 | ATTA-0002 |
| TIER-0005 | ProvenanceSource EPA7 | ATTA-0001 |
| TIER-0006 | ProvenanceSource EPA7 | ATTA-0002 |
| TIER-0007 | ObservationNote Drift | ATTA-0001 |
| TIER-0008 | ComplianceLevel SOC2 | ATTA-0002 |

**t_annotation_at_tier_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| TIER-0001 | confidence | xsd:decimal |
| TIER-0002 | dimension_kind | xsd:string |
| TIER-0003 | method | xsd:string |
| TIER-0004 | recorded_at | xsd:dateTime |
| TIER-0005 | uncertainty | xsd:decimal |
| TIER-0006 | unit | xsd:string |
| TIER-0007 | value | xsd:decimal |
| TIER-0008 | encoding | xsd:string |

**t_annotation_at_tier_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TIER-0001 | TIER-0001 | TIER-0004 | 2023-08-28T08:07:44 |
| TIER-0002 | TIER-0002 | TIER-0004 | 2024-09-06T16:54:15 |
| TIER-0003 | TIER-0003 | TIER-0004 | 2023-05-23T23:56:22 |
| TIER-0004 | TIER-0004 | TIER-0004 | 2025-03-16T10:06:06 |
| TIER-0005 | TIER-0005 | TIER-0004 | 2023-04-25T04:15:41 |
| TIER-0006 | TIER-0006 | TIER-0004 | 2023-06-14T22:17:53 |
| TIER-0007 | TIER-0007 | TIER-0004 | 2024-03-09T22:47:27 |
| TIER-0008 | TIER-0008 | TIER-0004 | 2023-01-10T07:31:27 |

**t_annotation_at_tier_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TIER-0001 | TIER-0001 | TIER-0001 | 0.089 |
| TIER-0002 | TIER-0001 | TIER-0005 | 784.31 |
| TIER-0003 | TIER-0001 | TIER-0007 | 319.44 |
| TIER-0004 | TIER-0002 | TIER-0001 | 0.223 |
| TIER-0005 | TIER-0002 | TIER-0005 | 427.90 |
| TIER-0006 | TIER-0002 | TIER-0007 | 411.91 |
| TIER-0007 | TIER-0003 | TIER-0001 | 0.933 |
| TIER-0008 | TIER-0003 | TIER-0005 | 35.44 |

**t_annotation_at_tier_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TIER-0001 | TIER-0001 | TIER-0002 | Dimension Kind 01 |
| TIER-0002 | TIER-0001 | TIER-0008 | Encoding 02 |
| TIER-0003 | TIER-0001 | TIER-0009 | change rationale |
| TIER-0004 | TIER-0001 | TIER-0010 | es |
| TIER-0005 | TIER-0001 | TIER-0003 | hybrid |
| TIER-0006 | TIER-0001 | TIER-0006 | kg |
| TIER-0007 | TIER-0002 | TIER-0002 | Dimension Kind 07 |
| TIER-0008 | TIER-0002 | TIER-0008 | Encoding 08 |

Attributes and their types form the extensible metadata layer that allows any entity to carry structured information without schema changes. An attribute is defined by a name and a type—confidence as xsd:decimal, dimension_kind as xsd:string, method as xsd:string, and recorded_at as xsd:dateTime—and the system stores attribute values in type-specific tables rather than a single generic column. This separation ensures type safety at query time: decimal values such as 0.089 and 784.31 reside in the decimal value table, string values like "Dimension Kind 01" and "change rationale" in the varchar table, and timestamps such as 2023-08-28T08:07:44 and 2025-03-16T10:06:06 in the datetime table. Each value row references both the entity it annotates and the attribute it fills, creating a triple (entity, attribute, value) that can be queried across types while preserving the schema-less flexibility of key-value stores. The attribute definition table acts as the single source of truth for what metadata fields exist and what types they expect, enabling validation before values are written.

Checksums and licenses provide the integrity and provenance guarantees required for compliance auditing. Every artifact carries a checksum—c0ffee42 for checksum-manifest-v4, 5e8f3c91 for both batch-processor-logs and sensor-calibration-v2—that serves as a content fingerprint for detecting unauthorized modification or corruption. Licenses are attached at the artifact level, with BSD-3-Clause, CC-BY-4.0, and MIT appearing across the artifact set, and the same license can apply to multiple artifacts, as CC-BY-4.0 does for both batch-processor-logs and genomic-sequence-17. This design means that license compliance checks can be performed at the artifact level without traversing downstream annotations, while the checksum enables integrity verification independent of licensing concerns. In practice, an auditor can confirm that a given artifact's checksum matches the recorded value and that its license permits the intended use, with both checks grounded in the same identifier.

**t_subclass_to_artifact**

| id | artifact | checksum | license |
| --- | --- | --- | --- |
| ARTI-0001 | checksum-manifest-v4 | c0ffee42 | BSD-3-Clause |
| ARTI-0002 | batch-processor-logs | 5e8f3c91 | CC-BY-4.0 |
| ARTI-0003 | genomic-sequence-17 | 1a4b6c2d | MIT |
| ARTI-0004 | sensor-calibration-v2 | 5e8f3c91 | CC-BY-4.0 |
| ARTI-0005 | model-weights-resnet50 | 5e8f3c91 | proprietary |
| ARTI-0006 | pipeline-output-stage3 | 9d2b7a16 | Apache-2.0 |
| ARTI-0007 | lab-reagent-batch-A7 | 7b14de08 | Apache-2.0 |
| ARTI-0008 | batch-processor-logs | 1a4b6c2d | BSD-3-Clause |

The relationship between kernel hooks and attached programs is modeled through a junction table that captures not only which program attaches to which hook but also the role each party plays in that attachment. A kernel hook such as netfilter_hook, kprobe_trace, sys_read, or ext4_write can be associated with an attached program like apparmor_module, bpftrace_script, eBPF_loader, or auditd_agent, and the relationship row carries a role—owner or reviewer—that describes the nature of the association. The subject column references the kernel hook and the target column references the attached program, making the direction of the relationship explicit and queryable. This role-based modeling allows governance policies to distinguish between a program that owns a hook attachment and one that merely reviews it, which is critical for access control and audit trails in security-sensitive environments. The same identifier ATTA-0005 appears both as a kernel hook and as an attached program, illustrating how the identifier space supports entities that can play multiple roles across different relationships.

**t_kernelhook_max_one_program_attached**

| id | kernelhook |
| --- | --- |
| ATTA-0001 | netfilter_hook |
| ATTA-0002 | kprobe_trace |
| ATTA-0003 | sys_read |
| ATTA-0004 | ext4_write |
| ATTA-0005 | sys_read |
| ATTA-0006 | kprobe_trace |

**t_kernelhook_max_one_program_attached_attached_program**

| id | attached_program |
| --- | --- |
| ATTA-0001 | apparmor_module |
| ATTA-0002 | bpftrace_script |
| ATTA-0003 | eBPF_loader |
| ATTA-0004 | auditd_agent |
| ATTA-0005 | perf_event |
| ATTA-0006 | bpftrace_script |

**t_kernelhook_max_one_program_attached__attached_program**

| id | kernelhook_id | attached_program_id | role |
| --- | --- | --- | --- |
| ATTA-0001 | ATTA-0002 | ATTA-0006 | owner |
| ATTA-0002 | ATTA-0005 | ATTA-0005 | owner |
| ATTA-0003 | ATTA-0003 | ATTA-0003 | reviewer |
| ATTA-0004 | ATTA-0004 | ATTA-0004 | owner |
| ATTA-0005 | ATTA-0005 | ATTA-0003 | reviewer |
| ATTA-0006 | ATTA-0002 | ATTA-0005 | observer |
| ATTA-0007 | ATTA-0003 | ATTA-0006 | reviewer |
| ATTA-0008 | ATTA-0001 | ATTA-0003 | contributor |