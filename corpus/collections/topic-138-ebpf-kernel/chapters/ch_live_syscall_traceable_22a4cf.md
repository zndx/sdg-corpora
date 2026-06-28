---
chapter_id: ch_live_syscall_traceable_22a4cf
topic_id: 138
family: 04_ebpf_kernel
cited_terms: ['syscall_traceable', 'nist80053_control_subclass', 'span_within_trace']
model: engine-refine
---

In compliance and operational governance, traceability is the property that lets an auditor, engineer, or automated assessor follow a control obligation from its authoritative definition through to observable runtime behavior without ambiguity. The model rests on stable identifiers—such as TRAC-0001 through TRAC-0004 for traceability dimensions and CONT-0001 through CONT-0004 for control subclasses—that function as durable keys across fact tables, dimension tables, and typed value stores. An identifier is not merely a surrogate key; it is the contract by which evidence, metadata, and lineage references remain joinable when frameworks evolve, when telemetry volumes shift, and when multiple NIST publications must be reconciled in a single assessment scope. Where CONT-0001 maps to NIST SP 800-53 Rev 5 and CONT-0002 to NIST SP 800-171, the identifier preserves semantic continuity even as the governing standard and its control family differ.

**t_nist80053_control_subclass**

| id | nist | nist80053_control |
| --- | --- | --- |
| CONT-0001 | NIST SP 800-53 Rev 5 | TRAC-0004 |
| CONT-0002 | NIST SP 800-171 | TRAC-0004 |
| CONT-0003 | NIST CSF 2.0 | TRAC-0007 |
| CONT-0004 | NIST SP 800-207 | TRAC-0006 |
| CONT-0005 | FIPS 140-3 | TRAC-0008 |
| CONT-0006 | NIST SP 800-171 | TRAC-0008 |

Entities are the governed objects to which attributes attach, and attributes declare what may be said about them. In practice, a control subclass entity such as CONT-0003 carries a mandatory attribute (attr) whose attr_type is xsd:boolean, while CONT-0001 carries effective_date typed as xsd:date and priority as xsd:integer. Separating attr from attr_type is a governance necessity: the name states the semantic obligation—enforcement, mandatory, priority—while the type constrains admissible evidence and validation rules. Typed value partitions then hold the misc payloads appropriate to each type: boolean rows record true or false for mandatory on CONT-0001 through CONT-0004; date rows anchor effective dates from 2023-01-02 through 2025-03-12; integer rows store priority values including 3, 776, 4, and 46; varchar rows retain human-readable enforcement strings such as Enforcement 02 and operational tokens such as calibration record. This pattern prevents type coercion errors in audit queries and ensures that assessors interpret each value within its declared semantic and syntactic contract.

**t_nist80053_control_subclass_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONT-0001 | CONT-0001 | CONT-0003 | true |
| CONT-0002 | CONT-0002 | CONT-0003 | true |
| CONT-0003 | CONT-0003 | CONT-0003 | true |
| CONT-0004 | CONT-0004 | CONT-0003 | false |
| CONT-0005 | CONT-0005 | CONT-0003 | true |
| CONT-0006 | CONT-0006 | CONT-0003 | true |

**t_nist80053_control_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONT-0001 | CONT-0001 | CONT-0007 | Encoding 01 |
| CONT-0002 | CONT-0001 | CONT-0002 | Enforcement 02 |
| CONT-0003 | CONT-0001 | CONT-0008 | calibration record |
| CONT-0004 | CONT-0001 | CONT-0009 | es |
| CONT-0005 | CONT-0001 | CONT-0006 | Scope 05 |
| CONT-0006 | CONT-0002 | CONT-0007 | Encoding 06 |
| CONT-0007 | CONT-0002 | CONT-0002 | Enforcement 07 |
| CONT-0008 | CONT-0002 | CONT-0008 | audit excerpt |

Traceable_by names the mechanism or dimension through which an activity, span, or control assertion can be followed back to evidentiary sources. Dimension records pair each traceable_by identifier with a misc label—Traceable By Label 01 through Traceable By Label 04—and a category that classifies the tracing modality under Traceable By Category 01 through Traceable By Category 04. Fact-level syscall telemetry then binds to these dimensions: TRAC-0001 accumulates 238 events, TRAC-0002 fifty-two, TRAC-0003 one hundred ninety-eight, and TRAC-0004 three hundred eighty-two, with traceable_by_key references such as TRAC-0003 pointing at TRAC-0003 and TRAC-0004 pointing at TRAC-0004. Event_count thus operationalizes traceability as measurable observability rather than declarative intent; high counts do not imply compliance, but they establish that the tracing channel is active and that downstream attestation can cite quantified activity rather than anecdote.

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

Distributed trace composition extends the same governance logic into runtime topology through subject–target–role triples. A span such as lambda-process-image or auth-validate-token participates in a larger part_of context—data-ingest-job, auth-flow, checkout-session, or api-request—while relationship rows assign role as contributor or observer. When TRAC-0002’s span http-get-users is linked with role observer to a part_of target TRAC-0006, and TRAC-0003’s http-get-users span assumes contributor against the same target class, the model distinguishes participation modes that a flat parent-child hierarchy would collapse. Subject and target are directional: the span_id names the subject of the assertion, the part_of_id names the aggregate or enclosing target, and role qualifies how the subject’s telemetry should be weighted in compliance narratives—whether it materially advances the traced workflow or merely witnesses it.

Cross-framework alignment completes the picture by wiring control metadata to traceability keys. Subclass rows associate NIST SP 800-53 Rev 5, NIST SP 800-171, NIST CSF 2.0, and NIST SP 800-207 with nist80053_control references including TRAC-0004 and TRAC-0006, so a single traceability dimension can satisfy multiple bibliographic anchors without duplicating observability pipelines. Category and misc labels supply human-auditable gloss; attr and attr_type supply machine-validated obligations; event_count supplies volume evidence; subject, target, and role supply structural context within traces. Taken together, these elements implement a governance architecture in which identifiers stabilize reference, entities and typed attributes encode policy state, traceable_by and event_count bind policy to telemetry, and relational roles explain how individual spans contribute to attestable wholes—precisely the chain an assessor must reconstruct when determining whether a control is defined, enforced, observed, and evidenced in practice.

**t_nist80053_control_subclass_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| CONT-0001 | effective_date | xsd:date |
| CONT-0002 | enforcement | xsd:string |
| CONT-0003 | mandatory | xsd:boolean |
| CONT-0004 | priority | xsd:integer |
| CONT-0005 | review_cycle_days | xsd:integer |
| CONT-0006 | scope | xsd:string |
| CONT-0007 | encoding | xsd:string |
| CONT-0008 | label_text | xsd:string |

**t_nist80053_control_subclass_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONT-0001 | CONT-0001 | CONT-0001 | 2023-01-02 |
| CONT-0002 | CONT-0002 | CONT-0001 | 2024-11-29 |
| CONT-0003 | CONT-0003 | CONT-0001 | 2024-03-23 |
| CONT-0004 | CONT-0004 | CONT-0001 | 2025-03-12 |
| CONT-0005 | CONT-0005 | CONT-0001 | 2024-03-19 |
| CONT-0006 | CONT-0006 | CONT-0001 | 2023-10-15 |

**t_nist80053_control_subclass_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONT-0001 | CONT-0001 | CONT-0004 | 3 |
| CONT-0002 | CONT-0001 | CONT-0005 | 776 |
| CONT-0003 | CONT-0002 | CONT-0004 | 4 |
| CONT-0004 | CONT-0002 | CONT-0005 | 46 |
| CONT-0005 | CONT-0003 | CONT-0004 | 1 |
| CONT-0006 | CONT-0003 | CONT-0005 | 151 |
| CONT-0007 | CONT-0004 | CONT-0004 | 4 |
| CONT-0008 | CONT-0004 | CONT-0005 | 507 |

**t_span_within_trace**

| id | span |
| --- | --- |
| TRAC-0001 | lambda-process-image |
| TRAC-0002 | http-get-users |
| TRAC-0003 | http-get-users |
| TRAC-0004 | auth-validate-token |
| TRAC-0005 | kafka-produce-metrics |
| TRAC-0006 | http-get-users |
| TRAC-0007 | batch-ingest-logs |
| TRAC-0008 | cache-lookup-session |

**t_span_within_trace_part_of**

| id | part_of |
| --- | --- |
| TRAC-0001 | data-ingest-job |
| TRAC-0002 | auth-flow |
| TRAC-0003 | checkout-session |
| TRAC-0004 | api-request |
| TRAC-0005 | payment-route |
| TRAC-0006 | auth-flow |

**t_span_within_trace__part_of**

| id | span_id | part_of_id | role |
| --- | --- | --- | --- |
| TRAC-0001 | TRAC-0006 | TRAC-0006 | contributor |
| TRAC-0002 | TRAC-0007 | TRAC-0001 | contributor |
| TRAC-0003 | TRAC-0002 | TRAC-0006 | observer |
| TRAC-0004 | TRAC-0003 | TRAC-0006 | observer |
| TRAC-0005 | TRAC-0007 | TRAC-0003 | owner |
| TRAC-0006 | TRAC-0008 | TRAC-0006 | owner |
| TRAC-0007 | TRAC-0001 | TRAC-0006 | contributor |
| TRAC-0008 | TRAC-0007 | TRAC-0003 | owner |