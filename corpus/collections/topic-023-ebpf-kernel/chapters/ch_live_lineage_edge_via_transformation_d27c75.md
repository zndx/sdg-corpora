---
chapter_id: ch_live_lineage_edge_via_transformation_d27c75
topic_id: 23
family: 05_provo_lineage
cited_terms: ['lineage_edge_via_transformation', 'syscall_audited_by', 'frozen_artifact_governed_by']
model: engine-refine
---

Governance and lineage systems treat stable identifiers as the non-negotiable substrate on which auditability rests: every assertion—whether a transformation edge, a syscall record, or a frozen artifact under policy—must resolve to a durable key that survives re-indexing, federation, and downstream replay. Identifiers such as TRAN-0001 through TRAN-0004, AUDI-0001 through AUDI-0004, and GOVE-0001 through GOVE-0004 function not merely as surrogate integers but as cross-referential anchors that permit joins across heterogeneous stores without collapsing distinct operational contexts into a single undifferentiated namespace. In practice, an identifier’s value is proven only when it consistently denotes the same logical object across time and subsystem boundaries; a lineage edge keyed TRAN-0002 must remain TRAN-0002 whether the consuming process is reconciling inventory, extracting patient cohorts, or normalizing time zones, and the same discipline applies when syscall audits reference AUDI-0002 for an execve invocation or when governance records bind GOVE-0003 to the Q3-2023-Snapshot artifact.

Entities occupy the semantic layer above identifiers: they are the governed objects whose lifecycle, immutability, and compliance posture the framework is designed to enforce. A frozen artifact—Log-Archive-23Q4, Model-Prod-v4, Q3-2023-Snapshot, or Compliance-09—constitutes an entity in the operational sense because policy, retention, and evidentiary weight attach to the artifact as a whole rather than to any single scalar field. Entity identifiers in value stores (entity_id referencing GOVE-0001, GOVE-0002, and so forth) express this many-to-one binding explicitly: multiple attribute assertions may accrue to the same entity without duplicating the entity’s identity, and conversely a single entity may participate in several governance dimensions simultaneously, as when GOVE-0001 carries both an effective_date assertion and a priority integer alongside varchar-encoded enforcement metadata. The architectural consequence is that entity resolution precedes attribute interpretation; mis-identifying the entity corrupts every downstream compliance judgment regardless of how rigorously individual fields are typed.

**t_frozen_artifact_governed_by**

| id | frozen |
| --- | --- |
| GOVE-0001 | Log-Archive-23Q4 |
| GOVE-0002 | Model-Prod-v4 |
| GOVE-0003 | Q3-2023-Snapshot |
| GOVE-0004 | Compliance-09 |
| GOVE-0005 | Audit-Baseline-2024 |
| GOVE-0006 | Log-Archive-23Q4 |

**t_frozen_artifact_governed_by_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| GOVE-0001 | effective_date | xsd:date |
| GOVE-0002 | enforcement | xsd:string |
| GOVE-0003 | mandatory | xsd:boolean |
| GOVE-0004 | priority | xsd:integer |
| GOVE-0005 | review_cycle_days | xsd:integer |
| GOVE-0006 | scope | xsd:string |
| GOVE-0007 | encoding | xsd:string |
| GOVE-0008 | label_text | xsd:string |

**t_frozen_artifact_governed_by_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| GOVE-0001 | GOVE-0001 | GOVE-0003 | false |
| GOVE-0002 | GOVE-0002 | GOVE-0003 | true |
| GOVE-0003 | GOVE-0003 | GOVE-0003 | false |
| GOVE-0004 | GOVE-0004 | GOVE-0003 | true |
| GOVE-0005 | GOVE-0005 | GOVE-0003 | false |
| GOVE-0006 | GOVE-0006 | GOVE-0003 | false |

**t_frozen_artifact_governed_by_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| GOVE-0001 | GOVE-0001 | GOVE-0001 | 2025-04-28 |
| GOVE-0002 | GOVE-0002 | GOVE-0001 | 2024-02-08 |
| GOVE-0003 | GOVE-0003 | GOVE-0001 | 2024-10-20 |
| GOVE-0004 | GOVE-0004 | GOVE-0001 | 2024-01-16 |
| GOVE-0005 | GOVE-0005 | GOVE-0001 | 2024-06-17 |
| GOVE-0006 | GOVE-0006 | GOVE-0001 | 2024-04-05 |

**t_frozen_artifact_governed_by_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| GOVE-0001 | GOVE-0001 | GOVE-0004 | 1 |
| GOVE-0002 | GOVE-0001 | GOVE-0005 | 718 |
| GOVE-0003 | GOVE-0002 | GOVE-0004 | 5 |
| GOVE-0004 | GOVE-0002 | GOVE-0005 | 330 |
| GOVE-0005 | GOVE-0003 | GOVE-0004 | 4 |
| GOVE-0006 | GOVE-0003 | GOVE-0005 | 316 |
| GOVE-0007 | GOVE-0004 | GOVE-0004 | 5 |
| GOVE-0008 | GOVE-0004 | GOVE-0005 | 796 |

**t_frozen_artifact_governed_by_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| GOVE-0001 | GOVE-0001 | GOVE-0007 | Encoding 01 |
| GOVE-0002 | GOVE-0001 | GOVE-0002 | Enforcement 02 |
| GOVE-0003 | GOVE-0001 | GOVE-0008 | calibration record |
| GOVE-0004 | GOVE-0001 | GOVE-0009 | es |
| GOVE-0005 | GOVE-0001 | GOVE-0006 | Scope 05 |
| GOVE-0006 | GOVE-0002 | GOVE-0007 | Encoding 06 |
| GOVE-0007 | GOVE-0002 | GOVE-0002 | Enforcement 07 |
| GOVE-0008 | GOVE-0002 | GOVE-0008 | nightly summary |

Attributes and attribute types jointly define the interpretive contract under which metadata may be stored, validated, and compared. An attr such as effective_date, enforcement, mandatory, or priority names a governed facet of policy or provenance, while attr_type—xsd:date, xsd:string, xsd:boolean, xsd:integer—prescribes the syntactic and semantic domain in which values must live. Typed partitioning is not an implementation convenience but a governance requirement: boolean enforcement flags (false for GOVE-0001 and GOVE-0003, true for GOVE-0002 and GOVE-0004 on attr_id GOVE-0003) cannot be coerced into dates or free text without voiding machine-checkable invariants, and effective_date values ranging from 2024-01-16 through 2025-04-28 acquire legal and operational force only when validated as xsd:date rather than as unparsed strings. Attribute typing also governs cardinality and conflict resolution: integer priorities of 1 and 718 on GOVE-0001, or 5 and 330 on GOVE-0002, admit ordering and threshold rules that varchar payloads such as Encoding 01 or calibration record do not; attr_type therefore determines which algorithms—comparison, aggregation, temporal windowing—may lawfully be applied.

The misc designation captures value payloads whose concrete representation varies by storage partition while remaining semantically bound through entity_id and attr_id foreign keys. Whether the misc field holds a calendar date, a boolean, an integer, or a language-tagged string, its meaning is never intrinsic to the column label alone but emerges from the triple (entity, attr, attr_type). Thus es stored against GOVE-0001 with attr_id GOVE-0009 is legible only when the governing attr_type and attr_name are known; likewise Enforcement 02 and Encoding 01 on the same entity illustrate how heterogeneous misc values coexist on one frozen artifact without collapsing into a single untyped bag of strings. Operational guides treat misc not as “miscellaneous” in the colloquial sense but as the typed value slot in an entity–attribute–value pattern, where physical table choice (boolean, date, int, varchar) enforces attr_type at insert time and prevents silent widening of the value domain.

Confidence and uncertainty quantify complementary aspects of epistemic status on lineage assertions linking operational processes to transformation pipelines. A lineage edge asserting Inventory Reconciliation via Genomic Variant Catalog at confidence 0.532 (TRAN-0004) communicates substantively different trust posture than Patient Cohort Extraction via Clinical Trial Registry at 0.111 (TRAN-0002), even when both edges are structurally valid; low confidence does not invalidate the edge but signals that downstream consumers should require corroboration, restrict automated propagation, or elevate human review. Uncertainty magnitudes—766.93 for TRAN-0001, 350.43 for TRAN-0004, 878.86 for TRAN-0003—provide a second axis, often reflecting propagated error budgets, missing evidence, or model disagreement rather than a simple complement of confidence. In reconciliation practice, operators weight actions by joint consideration: Timezone Normalization through Financial Risk Pipeline at 0.554 confidence paired with 878.86 uncertainty may warrant different escalation than Inventory Reconciliation at 0.439/766.93, because high nominal confidence does not extinguish large uncertainty when transformation semantics are brittle or source heterogeneity is high.

**t_lineage_edge_via_transformation**

| id | lineage | via_transformation | confidence | uncertainty |
| --- | --- | --- | --- | --- |
| TRAN-0001 | Inventory Reconciliation | Genomic Variant Catalog | 0.439 | 766.93 |
| TRAN-0002 | Patient Cohort Extraction | Clinical Trial Registry | 0.111 | 650.52 |
| TRAN-0003 | Timezone Normalization | Financial Risk Pipeline | 0.554 | 878.86 |
| TRAN-0004 | Inventory Reconciliation | Genomic Variant Catalog | 0.532 | 350.43 |
| TRAN-0005 | Schema Migration | SQL Join Aggregation | 0.034 | 365.80 |
| TRAN-0006 | Schema Migration | SQL Join Aggregation | 0.440 | 497.03 |

Format and language complete the interoperability envelope for audited, cross-border operations. Format—JSON, UUID, CSV—fixes the serialization contract under which syscall observations (unlinkat, execve, epoll_ctl, clone) and their audit envelopes are exchanged, parsed, and retained; mixing formats within a single audit stream without explicit conversion metadata breaks hash chains and invalidates temporal ordering assumptions. Language tags (fr, en, ja) localize human-readable facets and error surfaces without altering the syscall identity itself: AUDI-0001’s French context and AUDI-0003’s Japanese context may govern how investigators interpret ancillary narrative fields while the underlying AUDI-0003 epoll_ctl event remains comparable to AUDI-0004’s clone record under UUID format and en locale. Together, identifier stability, entity-centric governance, typed attributes with partitioned misc values, confidence–uncertainty lineage scoring, and format–language interchange rules form a closed evidentiary loop: each dimension constrains how the others may be read, and omission or misclassification at any layer propagates as a compliance defect rather than a recoverable formatting inconsistency.

**t_syscall_audited_by**

| id | syscall | format | language |
| --- | --- | --- | --- |
| AUDI-0001 | unlinkat | JSON | fr |
| AUDI-0002 | execve | UUID | en |
| AUDI-0003 | epoll_ctl | CSV | ja |
| AUDI-0004 | clone | UUID | en |