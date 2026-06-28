---
chapter_id: ch_live_provenance_agent_signs_audit_87c6a5
topic_id: 168
family: 07_long_tail
cited_terms: ['provenance_agent_signs_audit', 'control_min_one_owner', 'dataset_snapshot_subclass']
model: engine-refine
---

Operational provenance and dataset lineage form the evidentiary backbone of governance systems that must defend control posture under audit. Provenance records capture not merely that a check ran, but how it behaved under load: elapsed wall-clock time in duration_seconds, terminal disposition through exit codes, and resilience through retry_count. A run keyed AUDI-0003 that consumed 2216.74 seconds before terminating with exit 452 after 410 retries tells a materially different reliability story than AUDI-0004 at 6949.35 seconds, exit 985, and only 23 retries—the former suggests persistent transient failure absorbed by retry policy, the latter a long-running job that failed decisively. Provenance keys such as AUDI-0007 appearing across multiple fact rows further bind disparate executions to a shared upstream source or orchestration context, while dimension labels and categories (Provenance Label 03 under Provenance Category 03, for example) supply human-readable taxonomy without collapsing the stable identifier space on which joins and audit trails depend.

**fact_provenance**

| id | provenance_key | duration_seconds | exit_code | retry_count |
| --- | --- | --- | --- | --- |
| AUDI-0001 | AUDI-0003 | 2601.59 | 256 | 196 |
| AUDI-0002 | AUDI-0007 | 4921.58 | 728 | 304 |
| AUDI-0003 | AUDI-0008 | 2216.74 | 452 | 410 |
| AUDI-0004 | AUDI-0007 | 6949.35 | 985 | 23 |

**t_control_min_one_owner**

| id | control |
| --- | --- |
| OWNE-0001 | Rate Limit Threshold |
| OWNE-0002 | Encryption At Rest |
| OWNE-0003 | RBAC Assignment Policy |
| OWNE-0004 | Backup Retention Directive |
| OWNE-0005 | MFA Enforcement |
| OWNE-0006 | Change Approval Workflow |
| OWNE-0007 | Change Approval Workflow |

Identifier discipline threads through every layer of this model and is what makes cross-table reasoning legally and operationally defensible. Stable keys—AUDI-0001 through AUDI-0004 for audit facts, OWNE-0001 through OWNE-0004 for control entities, SNAP-0001 through SNAP-0004 for dataset artifacts—function as immutable handles across fact and dimension relations. Category and misc fields partition meaning at different granularities: category assigns records to governed families (Provenance Category 02, Snapshot Of Category 04), while misc carries the variable payload that categories alone cannot express—provenance labels, snapshot-of labels, typed literal values, and short free-text fragments such as audit excerpts or encoding descriptors. Treating misc as semantically overloaded but context-bound avoids schema sprawl while preserving the evidentiary specificity auditors expect when they ask not what class a record belongs to, but what it actually said at capture time.

**dim_provenance**

| id | provenance_label | provenance_category |
| --- | --- | --- |
| AUDI-0001 | Provenance Label 01 | Provenance Category 01 |
| AUDI-0002 | Provenance Label 02 | Provenance Category 02 |
| AUDI-0003 | Provenance Label 03 | Provenance Category 03 |
| AUDI-0004 | Provenance Label 04 | Provenance Category 04 |
| AUDI-0005 | Provenance Label 05 | Provenance Category 05 |
| AUDI-0006 | Provenance Label 06 | Provenance Category 06 |
| AUDI-0007 | Provenance Label 07 | Provenance Category 07 |
| AUDI-0008 | Provenance Label 08 | Provenance Category 08 |

**dim_snapshot_of**

| id | snapshot_of_label | snapshot_of_category |
| --- | --- | --- |
| SNAP-0001 | Snapshot Of Label 01 | Snapshot Of Category 01 |
| SNAP-0002 | Snapshot Of Label 02 | Snapshot Of Category 02 |
| SNAP-0003 | Snapshot Of Label 03 | Snapshot Of Category 03 |
| SNAP-0004 | Snapshot Of Label 04 | Snapshot Of Category 04 |
| SNAP-0005 | Snapshot Of Label 05 | Snapshot Of Category 05 |
| SNAP-0006 | Snapshot Of Label 06 | Snapshot Of Category 06 |
| SNAP-0007 | Snapshot Of Label 07 | Snapshot Of Category 07 |

Control governance in this framework expresses policy as entities bearing typed attributes rather than as opaque prose. Each entity—Rate Limit Threshold, Encryption At Rest, RBAC Assignment Policy, Backup Retention Directive—maps to a definitional row, while attr and attr_type pairs declare the contract under which values may be stored and validated. Declaring effective_date as xsd:date, enforcement as xsd:string, mandatory as xsd:boolean, and priority as xsd:integer enforces parseability at ingestion and comparability at review: a mandatory flag stored as true for OWNE-0003 but false elsewhere is not interpretive opinion but a machine-checkable obligation signal, and effective dates ranging from 2023-12-25 through 2025-01-07 establish temporal jurisdiction over when a control bite applies. Entity–attribute–value decomposition is the practical mechanism by which “one owner, minimum one attribute” constraints are satisfied without duplicating control definitions every time a parameter changes.

**t_control_min_one_owner_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| OWNE-0001 | effective_date | xsd:date |
| OWNE-0002 | enforcement | xsd:string |
| OWNE-0003 | mandatory | xsd:boolean |
| OWNE-0004 | priority | xsd:integer |
| OWNE-0005 | review_cycle_days | xsd:integer |
| OWNE-0006 | scope | xsd:string |
| OWNE-0007 | encoding | xsd:string |
| OWNE-0008 | label_text | xsd:string |

Typed value stores operationalize attr_type at persistence boundaries. Boolean, date, integer, and varchar tables exist because commingling literals under a single untyped column would destroy type safety and invite silent coercion errors during compliance scoring. Integer priorities of 5 versus 705 on related entities establish ordering semantics for remediation queues; varchar enforcement strings such as Enforcement 02 and Encoding 01 capture enumerated or lexical policy modes that resist boolean reduction; boolean mandatory values uniformly keyed to attr_id OWNE-0003 demonstrate how a single attribute definition fans out across entities while remaining joinable on entity_id. The pattern matters in practice because assessors routinely correlate exit disposition from provenance facts with whether the failing control was mandatory and in force on the failure date—relationships that hold only when entity, attr, and misc value resolve through shared identifiers.

**t_control_min_one_owner_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OWNE-0001 | OWNE-0001 | OWNE-0003 | false |
| OWNE-0002 | OWNE-0002 | OWNE-0003 | false |
| OWNE-0003 | OWNE-0003 | OWNE-0003 | true |
| OWNE-0004 | OWNE-0004 | OWNE-0003 | false |
| OWNE-0005 | OWNE-0005 | OWNE-0003 | true |
| OWNE-0006 | OWNE-0006 | OWNE-0003 | true |
| OWNE-0007 | OWNE-0007 | OWNE-0003 | true |

**t_control_min_one_owner_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OWNE-0001 | OWNE-0001 | OWNE-0001 | 2023-12-25 |
| OWNE-0002 | OWNE-0002 | OWNE-0001 | 2023-01-26 |
| OWNE-0003 | OWNE-0003 | OWNE-0001 | 2024-02-04 |
| OWNE-0004 | OWNE-0004 | OWNE-0001 | 2025-01-07 |
| OWNE-0005 | OWNE-0005 | OWNE-0001 | 2023-09-08 |
| OWNE-0006 | OWNE-0006 | OWNE-0001 | 2023-04-04 |
| OWNE-0007 | OWNE-0007 | OWNE-0001 | 2024-01-22 |

**t_control_min_one_owner_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OWNE-0001 | OWNE-0001 | OWNE-0004 | 5 |
| OWNE-0002 | OWNE-0001 | OWNE-0005 | 245 |
| OWNE-0003 | OWNE-0002 | OWNE-0004 | 1 |
| OWNE-0004 | OWNE-0002 | OWNE-0005 | 705 |
| OWNE-0005 | OWNE-0003 | OWNE-0004 | 3 |
| OWNE-0006 | OWNE-0003 | OWNE-0005 | 899 |
| OWNE-0007 | OWNE-0004 | OWNE-0004 | 2 |
| OWNE-0008 | OWNE-0004 | OWNE-0005 | 438 |

**t_control_min_one_owner_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OWNE-0001 | OWNE-0001 | OWNE-0007 | Encoding 01 |
| OWNE-0002 | OWNE-0001 | OWNE-0002 | Enforcement 02 |
| OWNE-0003 | OWNE-0001 | OWNE-0008 | audit excerpt |
| OWNE-0004 | OWNE-0001 | OWNE-0009 | de |
| OWNE-0005 | OWNE-0001 | OWNE-0006 | Scope 05 |
| OWNE-0006 | OWNE-0002 | OWNE-0007 | Encoding 06 |
| OWNE-0007 | OWNE-0002 | OWNE-0002 | Enforcement 07 |
| OWNE-0008 | OWNE-0002 | OWNE-0008 | pre-release note |

Snapshot_of completes the lineage picture by recording what a captured dataset instantiates at a point in time, together with material scale and version. Fact rows tie SNAP-0001 to snapshot_of_key SNAP-0004 at 350697080 bytes and version 10, while SNAP-0004 itself references SNAP-0003 at 676110880 bytes—encoding a directed graph of derivations rather than a flat file inventory. Size_bytes quantifies retention cost, transfer risk, and evidentiary completeness; version disambiguates concurrent captures of the same logical target, as when SNAP-0003 and SNAP-0004 both sit at version 5 yet differ sharply in footprint (31504133 versus 676110880 bytes), signaling schema expansion, scope change, or compression regime shift rather than mere re-run. Dimension labels (Snapshot Of Label 02, Snapshot Of Category 02) anchor those keys to business objects auditors recognize, while the snapshot_of foreign key preserves the mechanical chain from child artifact back to parent definition.

**fact_dataset**

| id | snapshot_of_key | size_bytes | version |
| --- | --- | --- | --- |
| SNAP-0001 | SNAP-0004 | 350697080 | 10 |
| SNAP-0002 | SNAP-0003 | 501391865 | 2 |
| SNAP-0003 | SNAP-0002 | 31504133 | 5 |
| SNAP-0004 | SNAP-0003 | 676110880 | 5 |
| SNAP-0005 | SNAP-0002 | 632357991 | 7 |
| SNAP-0006 | SNAP-0001 | 81640033 | 1 |
| SNAP-0007 | SNAP-0007 | 351254327 | 12 |
| SNAP-0008 | SNAP-0001 | 94866870 | 11 |

Taken together, duration_seconds, exit, retry_count, provenance, category, identifier, entity, attr, attr_type, misc, snapshot_of, and size_bytes constitute a closed vocabulary for reconstructing how controls were defined, whether they were in force, what evidence was produced, and how that evidence relates to prior captures. Governance programs that neglect any leg of this structure routinely fail under scrutiny: untyped values undermine automated attestation, missing provenance severs causality between policy and outcome, and snapshot graphs without version and byte-scale metadata cannot explain why two ostensibly equivalent exports support different conclusions. Dense, evidence-anchored modeling of this kind is therefore not administrative overhead but the minimum apparatus required for repeatable compliance operations at enterprise scale.