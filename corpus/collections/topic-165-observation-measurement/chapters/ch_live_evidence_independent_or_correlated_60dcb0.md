---
chapter_id: ch_live_evidence_independent_or_correlated_60dcb0
topic_id: 165
family: 06_belief_structure
cited_terms: ['evidence_independent_or_correlated', 'allocation_exactly_one_run_id', 'kernel_event_with_pid']
model: engine-refine
---

In governed operational systems, stable naming is the precondition for auditability: every assertion, linkage, and measured fact must be addressable without ambiguity, and the identifier supplies that address. Records such as CORR-0001 through CORR-0004 name independent-or-correlated evidence bundles whose constituent signals—Provenance-Chain-Hash paired with Metrics-Pool-Index, Metrics-Cache-Ref aligned to Provenance-Chain-Hash, Provenance-Leaf-Node co-occurring with Telemetry-Stream-Alpha—are distinguished precisely because each bundle carries a distinct identifier that survives re-ingestion, cross-run comparison, and downstream reconciliation. The same principle extends to execution and runtime artefacts: RUN-0001–RUN-0004 label allocation runs (etl-sync-west, batch-ingest-prod, query-opt-run, replica-clone-3) bound to proc-id-4421, session-77b, job-handle-11d, and run-88f3a1, while PID-0001–PID-0004 anchor kernel events on Darwin 22.4.0, Arch 2023.11, Ubuntu 22.04, and Alpine 6.1.12 against process identifiers 128, 24576, and 8192. Without identifiers, governance cannot answer which record authorised an action, which evidence supported a decision, or which run produced a given outcome.

**t_evidence_independent_or_correlated**

| id | evidence | evidence_2 | evidence_3 |
| --- | --- | --- | --- |
| CORR-0001 | Provenance-Chain-Hash | Metrics-Pool-Index | Provenance-Node-Hash |
| CORR-0002 | Metrics-Cache-Ref | Provenance-Chain-Hash | Telemetry-Stream-Alpha |
| CORR-0003 | Provenance-Leaf-Node | Telemetry-Stream-Alpha | Telemetry-Stream-Alpha |
| CORR-0004 | Independent-Array-Trace | Quarterly-Audit-Trail | Governance-Verification-File |
| CORR-0005 | Independent-Sensor-Trace | Observation-Grid-Fourteen | Governance-Compliance-Report |
| CORR-0006 | Quarterly-Audit-Trail | Metrics-Bucket-Index | Correlation-Stream-Gamma |

**t_allocation_exactly_one_run_id**

| id | allocation |
| --- | --- |
| RUN-0001 | etl-sync-west |
| RUN-0002 | batch-ingest-prod |
| RUN-0003 | query-opt-run |
| RUN-0004 | replica-clone-3 |
| RUN-0005 | model-deploy-stg |
| RUN-0006 | cache-warm-init |

**t_allocation_exactly_one_run_id_at_run_identifier**

| id | at_run_identifier |
| --- | --- |
| RUN-0001 | proc-id-4421 |
| RUN-0002 | session-77b |
| RUN-0003 | job-handle-11d |
| RUN-0004 | run-88f3a1 |
| RUN-0005 | run-tag-alpha |
| RUN-0006 | batch-snapshot-5e |
| RUN-0007 | pipeline-run-44f |
| RUN-0008 | task-uuid-003 |

**t_kernel_event_with_pid**

| id | kernel |
| --- | --- |
| PID-0001 | Darwin 22.4.0 |
| PID-0002 | Arch 2023.11 |
| PID-0003 | Ubuntu 22.04 |
| PID-0004 | Alpine 6.1.12 |
| PID-0005 | Red Hat 8.6 |
| PID-0006 | CentOS 7.9 |

**t_kernel_event_with_pid_with_process_id**

| id | with_process_id |
| --- | --- |
| PID-0001 | 128 |
| PID-0002 | 128 |
| PID-0003 | 24576 |
| PID-0004 | 8192 |
| PID-0005 | 1024 |
| PID-0006 | 128 |

Entity denotes the thing being described—the unit to which attributes attach and from which typed values are read. In the evidence domain, entity_id aligns with CORR-0001, CORR-0002, CORR-0003, and CORR-0004 so that confidence scores, dimension classifications, intake metadata, and temporal stamps all refer back to a single evidentiary object rather than to free-floating literals. The pattern is deliberately normalised: one entity may accumulate many attribute bindings, as when CORR-0001 simultaneously carries a decimal confidence of 0.175, varchar values Dimension Kind 01 and Encoding 02, the method label intake form, and the locale token en, while CORR-0002 receives its own confidence of 0.415 under a separate entity key. Separating entity from value prevents conflation of identity with measurement and allows reviewers to trace provenance at the object level even when individual fields change across audit cycles.

Attr and attr_type jointly define what may be said about an entity and how it must be represented. The attribute name—confidence, dimension_kind, method, recorded_at—states the semantic role of a field within the compliance vocabulary, while attr_type constrains its legal shape: xsd:decimal for numeric assurance, xsd:string for categorical or lexical tokens, xsd:dateTime for instants suitable for retention schedules and sequencing proofs. Typed value stores honour that contract: decimals land in the decimal store (0.175, 667.59, 420.06, 0.415), strings in the varchar store (Dimension Kind 01, Encoding 02, intake form, en), and datetimes as ISO-8601 misc values (2024-06-09T05:47:42 through 2024-01-18T01:21:21). attr_type is therefore not decorative metadata; it is the enforcement gate that keeps a governance query from summing a locale code or comparing a hash to a timestamp.

Misc names the stored payload itself—the concrete assertion materialised once entity and attr have fixed the address and meaning. A misc value is always interpreted in the context of its attr_type and attr_id binding: 0.175 is a confidence ratio, not a currency; en is a language tag, not a run handle; 2024-06-09T05:47:42 is an acquisition instant tied to recorded_at on CORR-0001, not an allocation timestamp. Partitioning misc across type-aligned stores preserves index efficiency, validation rules, and evidentiary weighting without sacrificing a uniform logical model. Operators who treat misc as opaque strings lose the ability to apply schema-aware controls; those who respect the attr linkage retain machine-checkable trails suitable for quarterly audit review against artefacts such as Governance-Verification-File and Quarterly-Audit-Trail.

Subject and target articulate directed relationships between independently identified participants, with role qualifying the nature of the bond. In allocation governance, subject (allocation_id) and target (at_run_identifier_id) pair RUN-0002 with RUN-0006 as contributor, RUN-0004 with RUN-0002 as owner, and RUN-0003 with RUN-0003 as observer—each edge explicit enough to reconstruct who executed under which session or job handle without collapsing allocation and run identity into a single column. The kernel–process pattern repeats the grammar: kernel_id PID-0002 linked to with_process_id_id PID-0005 under role owner, PID-0003 to PID-0002 as owner, PID-0005 and PID-0006 both to PID-0005 as observer. Role prevents symmetric graphs from misrepresenting authority: contributor and owner carry different accountability in run orchestration, as owner and observer do when the same process identifier 128 appears on multiple hosts yet must not be read as equivalent custody.

**t_allocation_exactly_one_run_id__at_run_identifier**

| id | allocation_id | at_run_identifier_id | role |
| --- | --- | --- | --- |
| RUN-0001 | RUN-0002 | RUN-0006 | contributor |
| RUN-0002 | RUN-0004 | RUN-0002 | contributor |
| RUN-0003 | RUN-0003 | RUN-0003 | observer |
| RUN-0004 | RUN-0005 | RUN-0002 | owner |
| RUN-0005 | RUN-0001 | RUN-0007 | contributor |
| RUN-0006 | RUN-0003 | RUN-0007 | observer |
| RUN-0007 | RUN-0004 | RUN-0007 | owner |
| RUN-0008 | RUN-0003 | RUN-0003 | contributor |

**t_kernel_event_with_pid__with_process_id**

| id | kernel_id | with_process_id_id | role |
| --- | --- | --- | --- |
| PID-0001 | PID-0002 | PID-0005 | owner |
| PID-0002 | PID-0003 | PID-0002 | owner |
| PID-0003 | PID-0005 | PID-0005 | observer |
| PID-0004 | PID-0006 | PID-0005 | observer |
| PID-0005 | PID-0001 | PID-0005 | observer |
| PID-0006 | PID-0005 | PID-0001 | owner |
| PID-0007 | PID-0003 | PID-0001 | reviewer |
| PID-0008 | PID-0003 | PID-0004 | observer |

Taken together, identifier, entity, attr, attr_type, misc, subject, target, and role form a layered reference architecture for evidence-backed operations. Identifiers stabilise reference; entities collect attributable facts; attr and attr_type govern vocabulary and validation; misc carries the verifiable content; subject–target–role triples express operational topology with explicit accountability. A reviewer tracing CORR-0001 from Provenance-Chain-Hash through confidence 0.175 and recorded_at 2024-06-09T05:47:42, then outward to RUN-0002’s contributor linkage on batch-ingest-prod and PID-0003’s observer stance on Ubuntu 22.04, is not navigating incidental schema layout but following a deliberate governance grammar—one in which every edge and every typed value remains evidence-anchored, queryable, and defensible under independent or correlated audit regimes alike.

**t_evidence_independent_or_correlated_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| CORR-0001 | confidence | xsd:decimal |
| CORR-0002 | dimension_kind | xsd:string |
| CORR-0003 | method | xsd:string |
| CORR-0004 | recorded_at | xsd:dateTime |
| CORR-0005 | uncertainty | xsd:decimal |
| CORR-0006 | unit | xsd:string |
| CORR-0007 | value | xsd:decimal |
| CORR-0008 | encoding | xsd:string |

**t_evidence_independent_or_correlated_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CORR-0001 | CORR-0001 | CORR-0004 | 2024-06-09T05:47:42 |
| CORR-0002 | CORR-0002 | CORR-0004 | 2023-11-11T17:14:05 |
| CORR-0003 | CORR-0003 | CORR-0004 | 2023-01-17T16:04:18 |
| CORR-0004 | CORR-0004 | CORR-0004 | 2024-01-18T01:21:21 |
| CORR-0005 | CORR-0005 | CORR-0004 | 2025-02-19T18:21:28 |
| CORR-0006 | CORR-0006 | CORR-0004 | 2023-04-21T22:33:15 |

**t_evidence_independent_or_correlated_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CORR-0001 | CORR-0001 | CORR-0001 | 0.175 |
| CORR-0002 | CORR-0001 | CORR-0005 | 667.59 |
| CORR-0003 | CORR-0001 | CORR-0007 | 420.06 |
| CORR-0004 | CORR-0002 | CORR-0001 | 0.415 |
| CORR-0005 | CORR-0002 | CORR-0005 | 386.38 |
| CORR-0006 | CORR-0002 | CORR-0007 | 519.11 |
| CORR-0007 | CORR-0003 | CORR-0001 | 0.685 |
| CORR-0008 | CORR-0003 | CORR-0005 | 275.29 |

**t_evidence_independent_or_correlated_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CORR-0001 | CORR-0001 | CORR-0002 | Dimension Kind 01 |
| CORR-0002 | CORR-0001 | CORR-0008 | Encoding 02 |
| CORR-0003 | CORR-0001 | CORR-0009 | intake form |
| CORR-0004 | CORR-0001 | CORR-0010 | en |
| CORR-0005 | CORR-0001 | CORR-0003 | hybrid |
| CORR-0006 | CORR-0001 | CORR-0006 | kg |
| CORR-0007 | CORR-0002 | CORR-0002 | Dimension Kind 07 |
| CORR-0008 | CORR-0002 | CORR-0008 | Encoding 08 |