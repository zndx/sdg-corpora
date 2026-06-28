---
chapter_id: ch_live_attestation_with_supporting_evidence_cff77c
topic_id: 6
family: 03_directive_governance
cited_terms: ['attestation_with_supporting_evidence', 'verification_produces_evidence', 'syscall_traceable']
model: engine-refine
---

In compliance and governance frameworks, the provenance of every attestation must be traceable from its origin through execution to final disposition. An attestation record—whether a SOC2 Compliance Review, a Data Provenance Statement, or a Patient Consent Declaration—carries with it a chain of supporting evidence, a lifecycle phase, and a trigger mechanism. The identifier assigned to each record, such as EVID-0001 or EVID-0002, serves as the immutable anchor across all downstream artifacts. Supporting evidence takes concrete form: an Encryption Key Manifest, a TLS Certificate Bundle, a Digital Signature Block, or a SHA256 Checksum Hash. Each attestation enters the system through one of two trigger pathways—an event, which denotes an external or asynchronous stimulus, or an API invocation, which signals a programmatic request. The phase field records where the attestation resides within its lifecycle, progressing through initiation, execution, review, and closeout, thereby providing auditors with a temporal map of compliance activity.

**t_attestation_with_supporting_evidence**

| id | attestation | with_supporting_evidence | phase | triggered_by |
| --- | --- | --- | --- | --- |
| EVID-0001 | SOC2 Compliance Review | Encryption Key Manifest | initiation | event |
| EVID-0002 | Data Provenance Statement | TLS Certificate Bundle | execution | event |
| EVID-0003 | Patient Consent Declaration | Digital Signature Block | review | api |
| EVID-0004 | Data Provenance Statement | SHA256 Checksum Hash | closeout | api |

Verification outcomes are recorded independently of the attestation itself, yet they share the same identifier namespace, enabling cross-referencing between the attestation and its verification result. A single verification, such as Compliance audit Q3, may produce multiple evidence artifacts—Validation result, TLS certificate—and each pairing carries its own exit code and status. Exit codes function as machine-readable disposition markers: the value 568, for instance, accompanies a complete status, whereas 821 and 938 both correspond to failed outcomes, and 88 signals a pending state. This separation of exit code from status allows systems to distinguish between a definitive failure and a transient condition awaiting resolution, while the verification label itself provides the human-readable context necessary for audit trails and remediation workflows.

**t_verification_produces_evidence**

| id | verification | produces_evidence | exit_code | status |
| --- | --- | --- | --- | --- |
| EVID-0001 | Compliance audit Q3 | Validation result | 568 | complete |
| EVID-0002 | Compliance audit Q3 | TLS certificate | 821 | failed |
| EVID-0003 | Compliance audit Q3 | Validation result | 938 | failed |
| EVID-0004 | Compliance audit Q3 | TLS certificate | 88 | pending |
| EVID-0005 | Compliance audit Q3 | Risk score | 761 | pending |

Traceability extends beyond attestation and verification into the operational layer, where system calls are catalogued with event counts that quantify their frequency and scope. Each syscall record carries an identifier—TRAC-0001 through TRAC-0004—and a traceable_by key that references a dimension table, establishing a directed graph of accountability. The event count associated with each record, ranging from 52 to 382, provides a measure of operational intensity that can be correlated with compliance events. A record with 382 events, for example, may indicate a high-throughput subsystem whose audit trail requires more granular scrutiny than one registering only 52 events. The traceable_by key creates a pointer to a classification dimension, ensuring that every syscall can be attributed to a specific category and labeled for reporting purposes.

**fact_syscall**

| id | traceable_by_key | event_count |
| --- | --- | --- |
| TRAC-0001 | TRAC-0003 | 238 |
| TRAC-0002 | TRAC-0003 | 52 |
| TRAC-0003 | TRAC-0001 | 198 |
| TRAC-0004 | TRAC-0004 | 382 |
| TRAC-0005 | TRAC-0004 | 283 |
| TRAC-0006 | TRAC-0005 | 288 |

**dim_traceable_by**

| id | traceable_by_label | traceable_by_category |
| --- | --- | --- |
| TRAC-0001 | Traceable By Label 01 | Traceable By Category 01 |
| TRAC-0002 | Traceable By Label 02 | Traceable By Category 02 |
| TRAC-0003 | Traceable By Label 03 | Traceable By Category 03 |
| TRAC-0004 | Traceable By Label 04 | Traceable By Category 04 |
| TRAC-0005 | Traceable By Label 05 | Traceable By Category 05 |
| TRAC-0006 | Traceable By Label 06 | Traceable By Category 06 |

The dimension table for traceable-by entities resolves the foreign keys from the syscall fact table into human-interpretable metadata. Each identifier—TRAC-0001, TRAC-0002, TRAC-0003, TRAC-0004—maps to a label such as Traceable By Label 01 and a category such as Traceable By Category 01. These categorical assignments enable aggregation and filtering at the governance layer: auditors can group syscalls by category to assess compliance coverage across subsystems, or by label to trace individual operational threads. The category field, in particular, serves as the primary grouping mechanism for compliance dashboards, while the label provides the descriptive context required by non-technical stakeholders reviewing audit summaries.

Together, these constructs form a layered accountability model. The attestation layer captures what was declared and under what conditions; the verification layer records whether the declaration held under scrutiny; the syscall layer quantifies the operational activity that underpins both; and the traceable-by dimension provides the categorical taxonomy that makes aggregation possible. The identifier serves as the cross-cutting key that binds these layers together, ensuring that an auditor can start from a single attestation—EVID-0001, for instance, a SOC2 Compliance Review triggered by an event during the initiation phase—and follow the chain through its verification outcome, its supporting evidence, and the syscalls that executed the underlying processes. This architecture transforms compliance from a static declaration into a traceable, quantifiable, and auditable operational reality.