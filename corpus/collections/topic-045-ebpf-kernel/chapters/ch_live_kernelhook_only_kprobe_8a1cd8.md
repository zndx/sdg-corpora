---
chapter_id: ch_live_kernelhook_only_kprobe_8a1cd8
topic_id: 45
family: 04_ebpf_kernel
cited_terms: ['kernelhook_only_kprobe', 'existential_with_has_part', 'constraint_with_violation_consequence']
model: engine-refine
---

In governed technical systems, stable reference primitives—identifier, entity, attr, attr_type, subject, target, role, and misc—form the minimum vocabulary through which policies, instrumentation metadata, and compositional structure can be asserted, queried, and enforced without collapsing distinct concerns into a single undifferentiated record. An identifier is not merely a surrogate key but a durable handle that survives renaming, reclassification, and cross-table reconciliation; when a kernel-hook registration is recorded as KPRO-0001 and later associated with hook-kind semantics under the same token, downstream auditors can trace continuity even if the human-readable symbol net_rx_action or the classified mechanism kprobe_perf is revised in operational documentation. The same stability principle applies to constraint records anchored at CONS-0001 through CONS-0004 and to compositional parts labeled PART-0001 through PART-0004, where the identifier mediates between existential declarations (BatchIngestionPipeline, GlobalMetadataCatalog, AuditLogArchive, CoreControlSubsystem) and their constituent artifacts (FirewallRule, StorageVolume, WorkerProcess, TemperatureProbe) without requiring that either side be encoded as an attribute of the other.

**t_kernelhook_only_kprobe__hook_kind**

| id | kernelhook_id | hook_kind_id | role |
| --- | --- | --- | --- |
| KPRO-0001 | KPRO-0002 | KPRO-0005 | owner |
| KPRO-0002 | KPRO-0005 | KPRO-0005 | contributor |
| KPRO-0003 | KPRO-0004 | KPRO-0002 | reviewer |
| KPRO-0004 | KPRO-0006 | KPRO-0006 | contributor |
| KPRO-0005 | KPRO-0003 | KPRO-0006 | owner |
| KPRO-0006 | KPRO-0002 | KPRO-0004 | observer |
| KPRO-0007 | KPRO-0006 | KPRO-0003 | reviewer |
| KPRO-0008 | KPRO-0001 | KPRO-0006 | contributor |

**t_existential_with_has_part**

| id | existential | has_part |
| --- | --- | --- |
| PART-0001 | BatchIngestionPipeline | FirewallRule |
| PART-0002 | GlobalMetadataCatalog | StorageVolume |
| PART-0003 | AuditLogArchive | WorkerProcess |
| PART-0004 | CoreControlSubsystem | TemperatureProbe |
| PART-0005 | ComputeNodePool | BackupSnapshot |
| PART-0006 | GlobalMetadataCatalog | ChecksumAlgorithm |

Entity denotes the object of governance—the constraint, hook registration, pipeline, or catalog instance that may bear multiple orthogonal properties and participate in multiple relations simultaneously. Attr names the definitional slot through which such an entity is characterized, while attr_type constrains the legal shape of values admitted into that slot so that validation, indexing, and interchange remain interoperable across subsystems. In the constraint corpus, effective_date is typed as xsd:date, enforcement as xsd:string, mandatory as xsd:boolean, and priority as xsd:integer; this separation matters because a single entity may simultaneously carry a temporal activation boundary, a textual enforcement mode, a boolean obligation flag, and a numeric precedence rank, each governed by distinct parsers and comparators. Misc carries the instantiated value for a given entity–attr pairing and is deliberately generic at the schema level precisely because its interpretation is delegated to attr_type: the boolean misc true attached to CONS-0001 under mandatory contrasts with false on CONS-0002 through CONS-0004, encoding differential obligation without proliferating entity subclasses; likewise, effective_date misc values 2024-01-12, 2023-06-10, 2023-06-27, and 2023-12-08 establish non-uniform activation timelines, while integer misc entries 5, 21, 3, and 404 and varchar misc such as Encoding 01, Enforcement 02, calibration record, and fr supply operational parameters whose semantics are recoverable only when read through the corresponding attr and attr_type declarations.

Subject and target articulate directed associations in which the subject is the anchoring participant and the target is the referenced endpoint, a distinction that prevents symmetric relations from being misread as ownership or accountability when only linkage is intended. Kernel-hook governance illustrates the pattern: a subject kernelhook_id may point to KPRO-0002 while its target hook_kind_id resolves to KPRO-0005, indicating that a particular hook registration is classified under a hook-kind record rather than merged with it. Because identifiers on the association row (KPRO-0001 through KPRO-0004) need not equal either endpoint, the model can represent nontrivial graphs—KPRO-0003 linking subject KPRO-0004 to target KPRO-0002, or KPRO-0004 linking KPRO-0006 to KPRO-0006—without conflating registration identity with classification identity. Constraint governance extends the same directed logic when a schema validation rule constrains database schemas and a provenance audit requirement constrains user accounts, while duplicated lab safety protocol entries constrain storage volumes and cloud regions respectively; the subject names the governing instrument and the target names the scoped object class or resource family subject to its force.

**t_kernelhook_only_kprobe**

| id | kernelhook |
| --- | --- |
| KPRO-0001 | net_rx_action |
| KPRO-0002 | kfree |
| KPRO-0003 | vfs_read |
| KPRO-0004 | ext4_file_open |
| KPRO-0005 | kmalloc |
| KPRO-0006 | ip_rcv |

**t_kernelhook_only_kprobe_hook_kind**

| id | hook_kind |
| --- | --- |
| KPRO-0001 | kprobe_perf |
| KPRO-0002 | entry_kprobe |
| KPRO-0003 | kprobe_trace |
| KPRO-0004 | kprobe_trace |
| KPRO-0005 | bpf_kprobe |
| KPRO-0006 | multi_kprobe |
| KPRO-0007 | kprobe_fs |

Role qualifies how a subject bears toward a target within an association, supplying the governance nuance that a bare directed edge cannot express. Where hook-kind linkage assigns owner to one association, contributor to others, and reviewer to another, authorization and change-control workflows can require owner approval for reclassification, permit contributor updates to trace parameters, and mandate reviewer attestation before promotion—distinctions that would be lost if all edges were treated as equivalent membership. Role is orthogonal to attr: attrs describe intrinsic or administratively assigned properties of an entity (mandatory, priority, effective_date), whereas role describes relational posture (owner, contributor, reviewer) that may vary per target even for a single subject entity.

Operational consequence completes the entity–attr–relation triangle by binding declarative structure to enforceable outcomes. When on_violation is specified as experiment halt for schema validation breach, access revocation for provenance audit failure, rate throttling for lab safety violation over storage volumes, or pipeline termination for the same protocol applied to cloud regions, the misc values and attr typing upstream acquire procedural meaning: a false mandatory flag on CONS-0002 does not merely record metadata but signals that provenance audit requirements may be advisory rather than blocking, while priority integers and enforcement strings tune how aggressively the named consequence is applied. Instrumentation practice mirrors this separation of concerns: hook symbols such as kfree, vfs_read, and ext4_file_open remain entities characterized by hook_kind classifications (entry_kprobe, kprobe_trace, kprobe_perf), and existential composition asserts that CoreControlSubsystem has_part TemperatureProbe without encoding probe calibration in the part relation itself—that calibration record appears instead as varchar misc on the constraint entity, demonstrating how attrs hold descriptive state, subjects and targets hold relational structure, roles hold accountability, identifiers hold persistence, and misc holds the evidence-valued particulars on which compliance automation ultimately depends.

**t_constraint_with_violation_consequence**

| id | constraint | constrains | on_violation |
| --- | --- | --- | --- |
| CONS-0001 | Schema validation rule | Database schemas | Experiment halt |
| CONS-0002 | Provenance audit requirement | User accounts | Access revocation |
| CONS-0003 | Lab safety protocol | Storage volumes | Rate throttling |
| CONS-0004 | Lab safety protocol | Cloud regions | Pipeline termination |
| CONS-0005 | Access control matrix | Telemetry agents | Network partitioning |
| CONS-0006 | Encryption standard | Telemetry agents | Compliance flagging |

**t_constraint_with_violation_consequence_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| CONS-0001 | effective_date | xsd:date |
| CONS-0002 | enforcement | xsd:string |
| CONS-0003 | mandatory | xsd:boolean |
| CONS-0004 | priority | xsd:integer |
| CONS-0005 | review_cycle_days | xsd:integer |
| CONS-0006 | scope | xsd:string |
| CONS-0007 | encoding | xsd:string |
| CONS-0008 | label_text | xsd:string |

**t_constraint_with_violation_consequence_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONS-0001 | CONS-0001 | CONS-0003 | true |
| CONS-0002 | CONS-0002 | CONS-0003 | false |
| CONS-0003 | CONS-0003 | CONS-0003 | false |
| CONS-0004 | CONS-0004 | CONS-0003 | false |
| CONS-0005 | CONS-0005 | CONS-0003 | false |
| CONS-0006 | CONS-0006 | CONS-0003 | false |

**t_constraint_with_violation_consequence_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONS-0001 | CONS-0001 | CONS-0001 | 2024-01-12 |
| CONS-0002 | CONS-0002 | CONS-0001 | 2023-06-10 |
| CONS-0003 | CONS-0003 | CONS-0001 | 2023-06-27 |
| CONS-0004 | CONS-0004 | CONS-0001 | 2023-12-08 |
| CONS-0005 | CONS-0005 | CONS-0001 | 2024-04-22 |
| CONS-0006 | CONS-0006 | CONS-0001 | 2025-05-17 |

**t_constraint_with_violation_consequence_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONS-0001 | CONS-0001 | CONS-0004 | 5 |
| CONS-0002 | CONS-0001 | CONS-0005 | 21 |
| CONS-0003 | CONS-0002 | CONS-0004 | 3 |
| CONS-0004 | CONS-0002 | CONS-0005 | 404 |
| CONS-0005 | CONS-0003 | CONS-0004 | 1 |
| CONS-0006 | CONS-0003 | CONS-0005 | 896 |
| CONS-0007 | CONS-0004 | CONS-0004 | 5 |
| CONS-0008 | CONS-0004 | CONS-0005 | 236 |

**t_constraint_with_violation_consequence_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONS-0001 | CONS-0001 | CONS-0007 | Encoding 01 |
| CONS-0002 | CONS-0001 | CONS-0002 | Enforcement 02 |
| CONS-0003 | CONS-0001 | CONS-0008 | calibration record |
| CONS-0004 | CONS-0001 | CONS-0009 | fr |
| CONS-0005 | CONS-0001 | CONS-0006 | Scope 05 |
| CONS-0006 | CONS-0002 | CONS-0007 | Encoding 06 |
| CONS-0007 | CONS-0002 | CONS-0002 | Enforcement 07 |
| CONS-0008 | CONS-0002 | CONS-0008 | change rationale |