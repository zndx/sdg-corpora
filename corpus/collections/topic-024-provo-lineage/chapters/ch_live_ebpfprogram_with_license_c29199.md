---
chapter_id: ch_live_ebpfprogram_with_license_c29199
topic_id: 24
family: 04_ebpf_kernel
cited_terms: ['ebpfprogram_with_license', 'dataset_was_derived_from', 'audit_for_period']
model: engine-refine
---

In governance-oriented knowledge representations, the four primitives—identifier, role, subject, and target—constitute the minimum vocabulary required to assert durable facts about who or what stands in relation to whom, and under what capacity. An identifier is not merely a surrogate key for storage convenience; it is the stable handle by which an entity survives renaming, reclassification, and cross-system reconciliation. When an eBPF program such as `cgroup_sock_release` is registered under `LICE-0002`, or when a dataset lineage node for `patient_demographics_clean` is anchored at `FROM-0002`, the identifier persists even when the human-readable label changes, when the artifact migrates between repositories, or when downstream consumers reference the same object through an entirely different interface. Prefix conventions—`LICE-`, `FROM-`, `PERI-`—signal domain membership at a glance, but the deeper function of the identifier is ontological: it fixes identity so that subsequent assertions, audits, and policy evaluations can attach to a single, unambiguous referent.

The subject and target pair expresses directed relational structure: the subject is the entity from which the relationship is asserted, and the target is the entity toward which that assertion points. In licensing governance, the subject is the program (`ebpfprogram_id` resolving to entities such as `LICE-0002` for `cgroup_sock_release` or `LICE-0006` elsewhere in the corpus) and the target is the license instrument (`license_id` resolving to `LICE-0004` for ISC, `LICE-0001` for MPL-2.0, or `LICE-0002` for EUPL-1.2). In data provenance, the subject is the derived dataset (`dataset_id` such as `FROM-0002` for `patient_demographics_clean`) and the target is the upstream source (`was_derived_from_id` such as `FROM-0001` for `warehouse_staging_area` or `FROM-0004` for `archival_tape_restore`). In audit scheduling, the subject is the audit activity (`audit_id` pointing to `PERI-0001` for a Data Privacy Impact Assessment) and the target is the governing period or framework (`for_audit_period_id` pointing to `PERI-0003` for a HIPAA Security Audit). This asymmetry is load-bearing: reversing subject and target inverts the semantic direction of the claim, transforming "Program X is licensed under Y" into an incoherent or false proposition.

Role qualifies the subject–target edge, supplying the governance nuance that a bare binary link cannot convey. The same subject may relate to multiple targets, and the role disambiguates obligations, permissions, and evidentiary weight. Where `LICE-0002` (`cgroup_sock_release`) connects to `LICE-0004` (ISC), the role is `contributor`, signalling active participation in the licensed artifact's lifecycle; where the same program connects to `LICE-0002` (EUPL-1.2) under a different assertion, the role is `reviewer`, indicating evaluative rather than authoring responsibility, and a third edge to the same license may carry `observer`, denoting visibility without decision authority. Provenance exhibits a parallel distinction: `patient_demographics_clean` (`FROM-0002`) may be a `contributor` to a lineage chain sourced from `warehouse_staging_area` (`FROM-0001`), while a separate assertion assigns `owner` to the relationship between `FROM-0001` and `FROM-0002`, elevating accountability above mere derivation. In audit contexts, a Data Privacy Impact Assessment may appear as `observer` relative to a HIPAA Security Audit period in one filing and as `reviewer` in another, even when the subject and target identifiers (`PERI-0001` and `PERI-0003`) recur—demonstrating that role, not identity repetition, governs the operative duty.

**t_ebpfprogram_with_license**

| id | ebpfprogram |
| --- | --- |
| LICE-0001 | uprobe_syscall |
| LICE-0002 | cgroup_sock_release |
| LICE-0003 | socket_filter |
| LICE-0004 | lsm_bpf |
| LICE-0005 | xdp_router |
| LICE-0006 | cgroup_sock_release |

**t_ebpfprogram_with_license_license**

| id | license |
| --- | --- |
| LICE-0001 | MPL-2.0 |
| LICE-0002 | EUPL-1.2 |
| LICE-0003 | Unlicense |
| LICE-0004 | ISC |
| LICE-0005 | Apache-2.0 |
| LICE-0006 | LGPL-2.1 |
| LICE-0007 | Zlib |

**t_ebpfprogram_with_license__license**

| id | ebpfprogram_id | license_id | role |
| --- | --- | --- | --- |
| LICE-0001 | LICE-0002 | LICE-0004 | contributor |
| LICE-0002 | LICE-0006 | LICE-0002 | reviewer |
| LICE-0003 | LICE-0002 | LICE-0001 | observer |
| LICE-0004 | LICE-0002 | LICE-0006 | contributor |
| LICE-0005 | LICE-0003 | LICE-0004 | reviewer |
| LICE-0006 | LICE-0005 | LICE-0003 | contributor |
| LICE-0007 | LICE-0005 | LICE-0005 | reviewer |
| LICE-0008 | LICE-0006 | LICE-0003 | contributor |

**t_audit_for_period**

| id | audit |
| --- | --- |
| PERI-0001 | Data Privacy Impact Assessment |
| PERI-0002 | Data Privacy Impact Assessment |
| PERI-0003 | Annual-2022 |
| PERI-0004 | GDPR Compliance Review |
| PERI-0005 | FINRA Rule 4511 Examination |
| PERI-0006 | Q4-2023 |
| PERI-0007 | FINRA Rule 4511 Examination |
| PERI-0008 | ISO 27001 Certification |

**t_audit_for_period_for_audit_period**

| id | for_audit_period |
| --- | --- |
| PERI-0001 | HIPAA Security Audit |
| PERI-0002 | SOC2 Type II |
| PERI-0003 | HIPAA Security Audit |
| PERI-0004 | ITIL Service Audit |
| PERI-0005 | HIPAA Security Audit |
| PERI-0006 | Q4-2023 |

**t_audit_for_period__for_audit_period**

| id | audit_id | for_audit_period_id | role |
| --- | --- | --- | --- |
| PERI-0001 | PERI-0001 | PERI-0003 | observer |
| PERI-0002 | PERI-0002 | PERI-0005 | reviewer |
| PERI-0003 | PERI-0001 | PERI-0003 | observer |
| PERI-0004 | PERI-0005 | PERI-0003 | reviewer |
| PERI-0005 | PERI-0007 | PERI-0004 | reviewer |
| PERI-0006 | PERI-0001 | PERI-0001 | owner |
| PERI-0007 | PERI-0003 | PERI-0001 | reviewer |
| PERI-0008 | PERI-0008 | PERI-0002 | observer |

Identifiers on the subject and target sides need not coincide with the identifier of the linking assertion itself. The junction record `LICE-0001` may assert that subject `LICE-0002` bears role `contributor` toward target `LICE-0004`, while a sibling record `LICE-0003` asserts a different subject (`LICE-0006`) toward a different target (`LICE-0001`, MPL-2.0) under the same role label. This three-tier pattern—entity identifiers, relationship identifier, and role annotation—permits graphs of arbitrary complexity without collapsing distinct edges into undifferentiated adjacency. Where `patient_demographics_clean` appears twice in the dataset inventory (`FROM-0002` and `FROM-0004`), each instance maintains its own identifier and may participate in separate lineage assertions: one as subject of a `contributor` edge from `warehouse_staging_area`, another as subject of an `owner` edge from `archival_tape_restore`. Compliance officers rely on this separation to answer not only "what was derived from what" but "under whose authority, and with what standing."

**t_dataset_was_derived_from**

| id | dataset |
| --- | --- |
| FROM-0001 | iot_edge_logs |
| FROM-0002 | patient_demographics_clean |
| FROM-0003 | market_index_history |
| FROM-0004 | patient_demographics_clean |
| FROM-0005 | sensor_readings_2023 |
| FROM-0006 | sensor_readings_2023 |

**t_dataset_was_derived_from_was_derived_from**

| id | was_derived_from |
| --- | --- |
| FROM-0001 | raw_sensor_stream |
| FROM-0002 | warehouse_staging_area |
| FROM-0003 | regulatory_filing_pdf |
| FROM-0004 | archival_tape_restore |
| FROM-0005 | external_credit_bureau |
| FROM-0006 | archival_tape_restore |
| FROM-0007 | external_credit_bureau |
| FROM-0008 | external_credit_bureau |

**t_dataset_was_derived_from__was_derived_from**

| id | dataset_id | was_derived_from_id | role |
| --- | --- | --- | --- |
| FROM-0001 | FROM-0002 | FROM-0004 | contributor |
| FROM-0002 | FROM-0001 | FROM-0001 | contributor |
| FROM-0003 | FROM-0005 | FROM-0006 | contributor |
| FROM-0004 | FROM-0001 | FROM-0002 | owner |
| FROM-0005 | FROM-0006 | FROM-0006 | owner |
| FROM-0006 | FROM-0003 | FROM-0008 | owner |
| FROM-0007 | FROM-0006 | FROM-0005 | reviewer |
| FROM-0008 | FROM-0004 | FROM-0005 | contributor |

In operational practice, these primitives interoperate across heterogeneous compliance domains without requiring a unified ontology of entity types. An eBPF licensing graph (`uprobe_syscall` under MPL-2.0, `socket_filter` under Unlicense, `lsm_bpf` under ISC) can be queried with the same subject–target–role algebra applied to audit calendars mapping `Annual-2022` or `GDPR Compliance Review` to `SOC2 Type II` and `ITIL Service Audit` periods. The identifier supplies persistence; the subject and target supply directionality; the role supplies normative content. Together they support evidence chains that withstand scrutiny: when an auditor asks whether `cgroup_sock_release` was evaluated under EUPL-1.2 by a party holding `reviewer` status, the answer reduces to a single edge lookup rather than an interpretive reconstruction from free text. Conversely, absence of a qualified edge—no `owner` role on a provenance link, no `reviewer` on an audit mapping—constitutes a governance gap that automated policy engines can surface before human review.

The architectural implication is that identifier, role, subject, and target are not columns to be catalogued but compositional operators for accountable knowledge. Systems that treat relationships as undirected pairs, or that encode role implicitly in entity type, sacrifice the precision required for multi-stakeholder environments where the same program, dataset, or audit may simultaneously be contributed to, reviewed under, and observed within distinct regulatory frames. The evidence embedded across licensing, lineage, and audit-period registries converges on a single design principle: identity must be stable, direction must be explicit, and capacity must be named. Where those three conditions hold, governance assertions become machine-verifiable, historically traceable, and legible to counsel, engineers, and auditors alike—without any one constituency needing to internalize the full schema of another's domain.