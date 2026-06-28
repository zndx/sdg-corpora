---
chapter_id: ch_live_claim_basic_15f039
topic_id: 186
family: 06_belief_structure
cited_terms: ['claim_basic', 'ebpfprogram_exactly_one_type', 'requirement_traces_to']
model: engine-refine
---

In governed technical systems, every auditable fact must be anchored to a stable identifier that survives renaming, reclassification, and cross-system exchange. Identifiers such as `CLAI-0001`, `TYPE-0003`, and `TRAC-0004` are not display labels; they are durable keys that let compliance officers, auditors, and automation reconcile the same object across attribute registries, value stores, and relationship graphs without ambiguity. When a claim about model accuracy below SLA is revisited months later, the identifier—not the prose of the claim itself—is what binds historical measurements, review notes, and traceability links into a single evidentiary thread. Operational discipline therefore treats identifier assignment as a first-class governance act: once issued, an identifier becomes the canonical handle for every downstream reference, query, and attestation.

**t_claim_basic**

| id | claim |
| --- | --- |
| CLAI-0001 | Model accuracy below SLA |
| CLAI-0002 | Schema version deprecated |
| CLAI-0003 | Model accuracy below SLA |
| CLAI-0004 | File checksum matches |
| CLAI-0005 | Compliance audit passed |
| CLAI-0006 | Compliance audit passed |

**t_claim_basic_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| CLAI-0001 | confidence | xsd:decimal |
| CLAI-0002 | dimension_kind | xsd:string |
| CLAI-0003 | method | xsd:string |
| CLAI-0004 | recorded_at | xsd:dateTime |
| CLAI-0005 | uncertainty | xsd:decimal |
| CLAI-0006 | unit | xsd:string |
| CLAI-0007 | value | xsd:decimal |
| CLAI-0008 | encoding | xsd:string |

An entity is the governed object that identifiers name and that the rest of the model describes. A claim (`CLAI-0001`) is an entity carrying a human-readable assertion, while an eBPF program entry (`TYPE-0003`, associated with `kprobe_sched_switch`) and a compliance requirement (`TRAC-0004`, a Privacy Compliance Requirement) are entities in their own domains. What distinguishes entity semantics from mere records is obligation: entities are the subjects of policy, measurement, and accountability. Attributes extend entities with structured, typed properties rather than flattening everything into opaque text. Naming an attribute—`confidence`, `dimension_kind`, `method`, `recorded_at`—declares what facet of the entity is being documented, independent of the value currently held. Attribute type (`attr_type`) then constrains interpretation and storage: `xsd:decimal` values such as `0.443` and `0.828` land in decimal stores, `xsd:string` values like `Dimension Kind 01` and `fr` in varchar stores, and `xsd:dateTime` instants including `2025-05-28T11:02:08` in datetime stores. This separation matters because compliance logic depends on comparable, machine-validated data; a confidence score and a recording timestamp are not interchangeable even when they share the same entity key, and routing values by type prevents silent coercion that would corrupt audit trails.

**t_claim_basic_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CLAI-0001 | CLAI-0001 | CLAI-0004 | 2025-05-28T11:02:08 |
| CLAI-0002 | CLAI-0002 | CLAI-0004 | 2025-04-22T09:44:09 |
| CLAI-0003 | CLAI-0003 | CLAI-0004 | 2025-01-23T06:41:57 |
| CLAI-0004 | CLAI-0004 | CLAI-0004 | 2024-03-14T10:07:11 |
| CLAI-0005 | CLAI-0005 | CLAI-0004 | 2023-08-27T20:51:04 |
| CLAI-0006 | CLAI-0006 | CLAI-0004 | 2025-04-10T08:56:25 |

**t_claim_basic_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CLAI-0001 | CLAI-0001 | CLAI-0001 | 0.443 |
| CLAI-0002 | CLAI-0001 | CLAI-0005 | 443.93 |
| CLAI-0003 | CLAI-0001 | CLAI-0007 | 257.71 |
| CLAI-0004 | CLAI-0002 | CLAI-0001 | 0.828 |
| CLAI-0005 | CLAI-0002 | CLAI-0005 | 729.35 |
| CLAI-0006 | CLAI-0002 | CLAI-0007 | 717.18 |
| CLAI-0007 | CLAI-0003 | CLAI-0001 | 0.004 |
| CLAI-0008 | CLAI-0003 | CLAI-0005 | 534.68 |

**t_claim_basic_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CLAI-0001 | CLAI-0001 | CLAI-0002 | Dimension Kind 01 |
| CLAI-0002 | CLAI-0001 | CLAI-0008 | Encoding 02 |
| CLAI-0003 | CLAI-0001 | CLAI-0009 | audit excerpt |
| CLAI-0004 | CLAI-0001 | CLAI-0010 | fr |
| CLAI-0005 | CLAI-0001 | CLAI-0003 | automated |
| CLAI-0006 | CLAI-0001 | CLAI-0006 | m/s |
| CLAI-0007 | CLAI-0002 | CLAI-0002 | Dimension Kind 07 |
| CLAI-0008 | CLAI-0002 | CLAI-0008 | Encoding 08 |

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

The miscellaneous value field—`misc` in operational parlance—is where typed payload meets entity-attribute binding. Each value row ties an `entity_id` to an `attr_id` and records the literal held at a point in time: `CLAI-0001` carries decimal confidence `0.443`, varchar dimension kind `Dimension Kind 01`, and a shared `recorded_at` timestamp across multiple claims via `attr_id` `CLAI-0004`. Misc is deliberately generic at the schema level because the attribute definition and attr_type supply meaning; the value table supplies integrity. In practice, reviewers use these bindings to answer evidentiary questions—when was the SLA breach noted, with what measured confidence, under which methodological label—without parsing unstructured narrative. Where several decimal measurements attach to one entity (`443.93`, `257.71` alongside `0.443` for `CLAI-0001`), the model encodes multi-faceted instrumentation rather than a single scalar truth, which is essential when controls require both point estimates and supporting quantities.

Relationships introduce direction and responsibility through subject, target, and role. A subject is the governed item initiating or owning an association; a target is the item referenced, satisfied, classified, or traced. Role qualifies how the subject participates—`owner`, `observer`, `reviewer`, or `contributor`—so identical endpoints can carry different compliance weight. In program-type governance, `TYPE-0003` (`kprobe_sched_switch`) links to program type targets with role `owner` in one association and `observer` in another, distinguishing authoritative classification from non-owning visibility. The same pattern appears in requirements traceability: `TRAC-0001` (Network Segmentation Rule) traces to `TRAC-0004` (ISO 27001 Control) as `owner`, while `TRAC-0004` (Privacy Compliance Requirement) traces to the same control as `reviewer`, and another privacy requirement does so as `contributor`. Multiple requirements converging on one target is normal in frameworks where a single control satisfies overlapping mandates; roles prevent the false impression of undifferentiated duplication by recording who bears primary accountability versus who reviews or supplements the link.

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

Identifiers, entities, typed attributes, misc values, and subject–target–role triples compose a layered evidence model rather than a flat document store. Claims illustrate the vertical stack: identifier `CLAI-0001` names the entity, attributes declare measurable dimensions, typed misc values capture observations including temporal provenance (`recorded_at`), and separate trace or classification graphs connect entities to external standards or technical taxonomies. eBPF program typing demonstrates horizontal constraint—each program should bear exactly one authoritative type relationship, with observers recorded distinctly. Requirements tracing demonstrates outward accountability from internal rules to external frameworks such as HIPAA Security Rule, Risk Assessment Matrix, or Compliance Audit Checklist. Together, these constructs let operators prove not only what was asserted (`File checksum matches` versus `Schema version deprecated`) but how it was measured, when it was recorded, and under which governance roles it links to controls and classifications.

**t_ebpfprogram_exactly_one_type**

| id | ebpfprogram |
| --- | --- |
| TYPE-0001 | fentry_do_fork |
| TYPE-0002 | kprobe_sched_switch |
| TYPE-0003 | kprobe_sched_switch |
| TYPE-0004 | fentry_do_fork |
| TYPE-0005 | tc_ingress_filter |
| TYPE-0006 | tc_ingress_filter |

**t_ebpfprogram_exactly_one_type_program_type**

| id | program_type |
| --- | --- |
| TYPE-0001 | kprobe |
| TYPE-0002 | kprobe |
| TYPE-0003 | kprobe |
| TYPE-0004 | socket_filter |
| TYPE-0005 | lsm |
| TYPE-0006 | kprobe |

**t_ebpfprogram_exactly_one_type__program_type**

| id | ebpfprogram_id | program_type_id | role |
| --- | --- | --- | --- |
| TYPE-0001 | TYPE-0003 | TYPE-0005 | owner |
| TYPE-0002 | TYPE-0005 | TYPE-0004 | observer |
| TYPE-0003 | TYPE-0004 | TYPE-0006 | owner |
| TYPE-0004 | TYPE-0003 | TYPE-0002 | owner |
| TYPE-0005 | TYPE-0006 | TYPE-0003 | owner |
| TYPE-0006 | TYPE-0006 | TYPE-0002 | reviewer |
| TYPE-0007 | TYPE-0004 | TYPE-0003 | owner |
| TYPE-0008 | TYPE-0005 | TYPE-0001 | observer |

Mastery of this domain reduces audit friction and automation risk. Reviewers query by identifier to reconstruct full entity state across typed value partitions; policy engines evaluate attr_type before accepting misc submissions; relationship traversals filter on role to assemble owner-only chains for sign-off or contributor-enriched views for impact analysis. When attr_type and storage diverge—submitting a datetime string into a decimal attribute—validation fails early instead of polluting compliance reports. When roles are omitted, trace graphs collapse into misleading many-to-many clutter, obscuring who must remediate a failed control mapping. Treating attr, attr_type, entity, identifier, misc, role, subject, and target as interoperating primitives—not as incidental column names—establishes a reproducible vocabulary for evidence capture, cross-domain linkage, and defensible attestation across ML operations, kernel instrumentation policy, and regulatory traceability alike.