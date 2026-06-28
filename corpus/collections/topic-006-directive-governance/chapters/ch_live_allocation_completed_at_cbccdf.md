---
chapter_id: ch_live_allocation_completed_at_cbccdf
topic_id: 6
family: 05_provo_lineage
cited_terms: ['allocation_completed_at', 'client_data_record', 'verification_produces_evidence']
model: engine-refine
---

Category, contains, event count, exit code, identifier, misc, role, status, subject, and target constitute the fundamental vocabulary of a structured audit and allocation ledger, where every operational artifact is rendered traceable through a disciplined nomenclature. The identifier serves as the immutable anchor—COMP-0001, RECO-0002, EVID-0004—binding together disparate dimensions of resource assignment, client telemetry, and verification outcome into a single referential universe. An allocation such as data-lake-partition or k8s-pod-quota is never encountered in isolation; it is always resolved through its identifier to a completion timestamp, a subject entity, a target entity, and a role that declares whether the party acts as observer, owner, or contributor. This tripartite linkage—subject pointing to the originating allocation, target pointing to the completion event, role declaring the relationship—ensures that every handoff in the pipeline carries its own provenance, and that the question of who did what to whom can be answered without recourse to external documentation.

**t_allocation_completed_at**

| id | allocation |
| --- | --- |
| COMP-0001 | data-lake-partition |
| COMP-0002 | storage-tier-archival |
| COMP-0003 | data-lake-partition |
| COMP-0004 | k8s-pod-quota |
| COMP-0005 | telemetry-ingest-pipe |
| COMP-0006 | k8s-pod-quota |

**t_allocation_completed_at_completed_at**

| id | completed_at |
| --- | --- |
| COMP-0001 | 2023-10-25T22:48:55Z |
| COMP-0002 | 2024-06-30T15:05:33Z |
| COMP-0003 | 2024-04-12T09:11:08Z |
| COMP-0004 | 2023-10-25T22:48:55Z |
| COMP-0005 | 2023-08-09T19:33:47Z |
| COMP-0006 | 2023-08-09T19:33:47Z |

**t_allocation_completed_at__completed_at**

| id | allocation_id | completed_at_id | role |
| --- | --- | --- | --- |
| COMP-0001 | COMP-0005 | COMP-0003 | observer |
| COMP-0002 | COMP-0006 | COMP-0003 | observer |
| COMP-0003 | COMP-0002 | COMP-0005 | owner |
| COMP-0004 | COMP-0001 | COMP-0002 | contributor |
| COMP-0005 | COMP-0004 | COMP-0004 | owner |
| COMP-0006 | COMP-0001 | COMP-0005 | owner |
| COMP-0007 | COMP-0003 | COMP-0003 | reviewer |
| COMP-0008 | COMP-0004 | COMP-0006 | observer |

**fact_client**

| id | contains_key | event_count |
| --- | --- | --- |
| RECO-0001 | RECO-0006 | 225 |
| RECO-0002 | RECO-0005 | 129 |
| RECO-0003 | RECO-0002 | 282 |
| RECO-0004 | RECO-0002 | 42 |
| RECO-0005 | RECO-0003 | 486 |
| RECO-0006 | RECO-0004 | 89 |

**dim_contains**

| id | contains_label | contains_category |
| --- | --- | --- |
| RECO-0001 | Contains Label 01 | Contains Category 01 |
| RECO-0002 | Contains Label 02 | Contains Category 02 |
| RECO-0003 | Contains Label 03 | Contains Category 03 |
| RECO-0004 | Contains Label 04 | Contains Category 04 |
| RECO-0005 | Contains Label 05 | Contains Category 05 |
| RECO-0006 | Contains Label 06 | Contains Category 06 |

The contains dimension introduces a categorical taxonomy that classifies every contained entity by a human-readable label and a machine-stable category. Contains Label 01 through Contains Label 04 map to Contains Category 01 through Contains Category 04, and each is addressable by its own identifier, RECO-0001 through RECO-0004. The fact_client table then records, for each client record, which contains key it references—RECO-0006, RECO-0005, RECO-0002—and how many events it has generated, with counts ranging from 42 to 282. This structure permits aggregation by category, drill-down by label, and anomaly detection by event count, all while preserving the referential integrity of the contains hierarchy. A client with 282 events and a contains_key of RECO-0002 is immediately distinguishable from one with 42 events and the same key, and the category field provides the semantic grouping that makes such distinctions actionable.

Exit code and status complete the verification record, transforming a binary pass-fail outcome into a graded, auditable signal. The verification table records that Compliance audit Q3 produced either a Validation result or a TLS certificate, each associated with an exit code—568, 821, 938, 88—and a status of complete, failed, or pending. The exit code is not a generic success indicator; it is a numeric artifact that encodes the specific failure mode or completion condition, and when paired with the status field it allows downstream systems to distinguish between a hard failure (status: failed, exit_code: 938) and a soft failure awaiting remediation (status: pending, exit_code: 88). The verification itself is a named process—Compliance audit Q3—repeated across multiple evidence types, which means that the same audit can yield divergent outcomes depending on the evidence class under review, and the exit code captures that divergence in a form suitable for sorting, thresholding, and alerting.

Together, these constructs form a relational fabric in which identifier is the thread, category and contains provide the classification structure, event count supplies the volume metric, exit code and status convey the outcome, and subject and target with their role attribute encode the directional relationships between entities. An allocation identified as COMP-0001, carrying the type data-lake-partition, is linked through a junction record to a completion event COMP-0002 with the role owner, and that same allocation may appear as a subject in a different junction record pointing to a target with the role observer. The contains dimension, independently keyed by RECO-0001 through RECO-0004, is referenced by fact_client records whose event counts range from 42 to 282, and whose contains_key values may or may not correspond to the primary contains identifiers, introducing a layer of indirection that supports both direct and cross-referenced classification. The verification table, keyed by EVID-0001 through EVID-0004, sits orthogonal to this structure, recording outcomes of named audits against evidence types, each outcome quantified by an exit code and qualified by a status, thereby closing the loop between allocation, classification, event volume, and verification.

**t_verification_produces_evidence**

| id | verification | produces_evidence | exit_code | status |
| --- | --- | --- | --- | --- |
| EVID-0001 | Compliance audit Q3 | Validation result | 568 | complete |
| EVID-0002 | Compliance audit Q3 | TLS certificate | 821 | failed |
| EVID-0003 | Compliance audit Q3 | Validation result | 938 | failed |
| EVID-0004 | Compliance audit Q3 | TLS certificate | 88 | pending |
| EVID-0005 | Compliance audit Q3 | Risk score | 761 | pending |