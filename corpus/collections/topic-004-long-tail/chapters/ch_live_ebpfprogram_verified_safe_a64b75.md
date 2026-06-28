---
chapter_id: ch_live_ebpfprogram_verified_safe_a64b75
topic_id: 4
family: 04_ebpf_kernel
cited_terms: ['ebpfprogram_verified_safe', 'subclass_to_information_content_entity', 'artifact_not_deprecated']
model: engine-refine
---

Artifact governance rests on the disciplined classification of discrete deliverables through a triad of identifier, category, and label. Each artifact receives a stable identifier—DEPR-0001 through DEPR-0004 in the reference corpus—that anchors all downstream references, while the category field (Artifact Category 01 through Artifact Category 04) establishes the structural grouping that determines retention, review, and audit requirements. The label, stored as a human-readable misc field (Artifact Label 01, Artifact Label 02), provides the operational nomenclature used by engineering and compliance teams during intake and disposition. Together, these three attributes form the immutable identity of the artifact, ensuring that every reference, regardless of context, resolves to the same canonical entity.

**dim_artifact**

| id | artifact_label | artifact_category |
| --- | --- | --- |
| DEPR-0001 | Artifact Label 01 | Artifact Category 01 |
| DEPR-0002 | Artifact Label 02 | Artifact Category 02 |
| DEPR-0003 | Artifact Label 03 | Artifact Category 03 |
| DEPR-0004 | Artifact Label 04 | Artifact Category 04 |
| DEPR-0005 | Artifact Label 05 | Artifact Category 05 |
| DEPR-0006 | Artifact Label 06 | Artifact Category 06 |

Beyond identity, artifacts carry quantitative and temporal metadata that govern their lifecycle. The size_bytes column records the byte footprint of each deliverable—123,155,790 bytes for DEPR-0001, 429,788,044 for DEPR-0002, 996,080,316 for DEPR-0003, and 597,369,362 for DEPR-0004—information critical to storage allocation, transfer scheduling, and integrity verification. The version column (values 5, 6, and 10 observed across the corpus) tracks revision state, enabling auditors to reconstruct the evolution of any artifact and confirm that the version in production matches the version approved during the compliance gate. The artifact_key column serves as a cross-reference pointer, with DEPR-0004 and DEPR-0005 appearing as keys across multiple records, indicating that artifacts may be associated with parent deliverables or sibling artifacts in a dependency graph.

Verification of eBPF programs introduces a role-based relationship model that distinguishes between the subject program and the target verifier. The table t_ebpfprogram_verified_safe assigns identifiers such as SAFE-0001 through SAFE-0004 to programs like lsm_file_open, sock_ops_connect, perf_event_trace, and tc_police_ingress, each of which has been certified safe for kernel execution. The verification itself is attributed to tools including libbpf, Kani_bpf, and Z3_solver, recorded in the verified_safe_by column. The junction table t_ebpfprogram_verified_safe__verified_safe_by formalizes the relationship between subject (ebpfprogram_id) and target (verified_safe_by_id) through a role attribute, which takes values such as contributor, reviewer, and owner. For instance, SAFE-0004 appears as a subject linked to targets SAFE-0002 and SAFE-0004 with roles of contributor and reviewer, while SAFE-0003 and SAFE-0002 each carry the owner role, establishing a clear chain of accountability for each verification decision.

**t_ebpfprogram_verified_safe**

| id | ebpfprogram |
| --- | --- |
| SAFE-0001 | lsm_file_open |
| SAFE-0002 | sock_ops_connect |
| SAFE-0003 | perf_event_trace |
| SAFE-0004 | tc_police_ingress |
| SAFE-0005 | xdp_router |
| SAFE-0006 | cgroup_skb_ingress |

**t_ebpfprogram_verified_safe_verified_safe_by**

| id | verified_safe_by |
| --- | --- |
| SAFE-0001 | libbpf |
| SAFE-0002 | Kani_bpf |
| SAFE-0003 | Z3_solver |
| SAFE-0004 | Kani_bpf |
| SAFE-0005 | veristat |
| SAFE-0006 | FramaC_bpf |

**t_ebpfprogram_verified_safe__verified_safe_by**

| id | ebpfprogram_id | verified_safe_by_id | role |
| --- | --- | --- | --- |
| SAFE-0001 | SAFE-0004 | SAFE-0002 | contributor |
| SAFE-0002 | SAFE-0004 | SAFE-0004 | reviewer |
| SAFE-0003 | SAFE-0003 | SAFE-0005 | owner |
| SAFE-0004 | SAFE-0002 | SAFE-0003 | owner |
| SAFE-0005 | SAFE-0001 | SAFE-0003 | contributor |
| SAFE-0006 | SAFE-0003 | SAFE-0006 | contributor |
| SAFE-0007 | SAFE-0001 | SAFE-0005 | owner |
| SAFE-0008 | SAFE-0001 | SAFE-0002 | owner |

Information content entities extend the governance model beyond binary artifacts to encompass documentation, telemetry, and registry records. The table t_subclass_to_information_content_entity assigns identifiers ENTI-0001 through ENTI-0004 to entries such as schema_registry, telemetry_stream, compliance_audit, and data_catalog_entry, each annotated with a label_text (nightly summary, pre-release note, intake form, change rationale) and a language code (en, ja, es). This multilingual labeling ensures that compliance documentation reaches the appropriate audience regardless of geographic location, while the information type field enables routing to the correct review workflow—telemetry streams to engineering leads, compliance audits to the governance office, and data catalog entries to data stewards.

**t_subclass_to_information_content_entity**

| id | information | label_text | language |
| --- | --- | --- | --- |
| ENTI-0001 | schema_registry | nightly summary | en |
| ENTI-0002 | telemetry_stream | pre-release note | ja |
| ENTI-0003 | compliance_audit | intake form | ja |
| ENTI-0004 | data_catalog_entry | change rationale | es |
| ENTI-0005 | model_weights | nightly summary | en |
| ENTI-0006 | deployment_manifest | pre-release note | en |

The interplay between these structures creates a verifiable audit trail: an artifact identified by DEPR-0001, categorized as Artifact Category 01, labeled Artifact Label 01, sized at 123,155,790 bytes, and versioned at 6, can be traced through its associated information entities (ENTI-0001, ENTI-0002, etc.) to the specific label text and language used in its documentation, while any eBPF programs it depends on (SAFE-0001 through SAFE-0004) carry their own verification records with named contributors, reviewers, and owners. This layered model—where identifiers anchor categories, categories inform roles, roles bind subjects to targets, and targets carry multilingual labels—ensures that every claim of compliance can be independently verified against a chain of evidence that is both machine-readable and human-auditable.

**fact_artifact**

| id | artifact_key | size_bytes | version |
| --- | --- | --- | --- |
| DEPR-0001 | DEPR-0004 | 123155790 | 6 |
| DEPR-0002 | DEPR-0005 | 42978804 | 5 |
| DEPR-0003 | DEPR-0004 | 996080316 | 5 |
| DEPR-0004 | DEPR-0005 | 597369362 | 10 |
| DEPR-0005 | DEPR-0006 | 12061913 | 9 |
| DEPR-0006 | DEPR-0001 | 792675668 | 5 |