---
chapter_id: ch_live_span_within_trace_d67df1
topic_id: 40
family: 02_observation_measurement
cited_terms: ['span_within_trace', 'claim_not_disconfirmed', 'evidence_with_mass_function']
model: engine-refine
---

Distributed observability and evidentiary governance rest on a small set of relational primitives whose semantics must be fixed before any audit, reconciliation, or compliance workflow can be trusted. At the centre stands the identifier: an immutable, system-issued key that binds a record to every downstream reference without ambiguity. Trace composition records carry identifiers such as TRAC-0001 through TRAC-0004; claim registers use DISC-0001 through DISC-0004; mass-function evidence entries use FUNC-0001 through FUNC-0004. The identifier does not describe behaviour—it only certifies identity. Once assigned, it becomes the anchor through which entities, attributes, subjects, and targets are joined across tables, time zones, and revision cycles. Operational practice therefore treats identifier assignment as non-reversible: a span renamed from lambda-process-image to another operation retains TRAC-0001; renaming the operation does not mint a new key.

An entity is the governed object that may bear one or more attributes. In the claim domain, each not-disconfirmed assertion—redundancy failover successful, secondary sensor aligned, firmware version outdated, thermal monitoring active—is materialised as an entity keyed by its DISC identifier. Entities do not embed their descriptive payload inline; they delegate characterization to attribute bindings. That separation matters for compliance because the same entity can accumulate heterogeneous evidence over time—confidence scores, dimension classifications, acquisition methods, timestamps—without collapsing distinct evidentiary facts into a single undifferentiated field. Auditors trace lineage from entity to attribute to typed value, not from entity to an opaque document blob.

**t_claim_not_disconfirmed**

| id | claim | claim_2 |
| --- | --- | --- |
| DISC-0001 | redundancy failover successful | data pipeline stalled |
| DISC-0002 | secondary sensor aligned | latency under SLA bounds |
| DISC-0003 | firmware version outdated | threshold limits expanded |
| DISC-0004 | thermal monitoring active | secondary sensor aligned |
| DISC-0005 | firmware version outdated | network latency spike unexplained |
| DISC-0006 | temperature sensor offline | redundancy failover successful |
| DISC-0007 | latency under SLA bounds | network latency spike unexplained |

**t_claim_not_disconfirmed_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| DISC-0001 | confidence | xsd:decimal |
| DISC-0002 | dimension_kind | xsd:string |
| DISC-0003 | method | xsd:string |
| DISC-0004 | recorded_at | xsd:dateTime |
| DISC-0005 | uncertainty | xsd:decimal |
| DISC-0006 | unit | xsd:string |
| DISC-0007 | value | xsd:decimal |
| DISC-0008 | encoding | xsd:string |

**t_claim_not_disconfirmed_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DISC-0001 | DISC-0001 | DISC-0004 | 2023-08-09T14:45:08 |
| DISC-0002 | DISC-0002 | DISC-0004 | 2023-07-14T01:11:42 |
| DISC-0003 | DISC-0003 | DISC-0004 | 2023-07-27T10:01:23 |
| DISC-0004 | DISC-0004 | DISC-0004 | 2024-07-11T23:49:48 |
| DISC-0005 | DISC-0005 | DISC-0004 | 2024-06-18T23:43:54 |
| DISC-0006 | DISC-0006 | DISC-0004 | 2023-11-25T07:03:11 |
| DISC-0007 | DISC-0007 | DISC-0004 | 2025-06-11T19:52:01 |

**t_claim_not_disconfirmed_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DISC-0001 | DISC-0001 | DISC-0002 | Dimension Kind 01 |
| DISC-0002 | DISC-0001 | DISC-0008 | Encoding 02 |
| DISC-0003 | DISC-0001 | DISC-0009 | intake form |
| DISC-0004 | DISC-0001 | DISC-0010 | ja |
| DISC-0005 | DISC-0001 | DISC-0003 | hybrid |
| DISC-0006 | DISC-0001 | DISC-0006 | mg/L |
| DISC-0007 | DISC-0002 | DISC-0002 | Dimension Kind 07 |
| DISC-0008 | DISC-0002 | DISC-0008 | Encoding 08 |

Attributes name what is being said about an entity; attr_type declares how it may legally be said. The attribute registry records attr_name entries—confidence, dimension_kind, method, recorded_at—each paired with an attr_type drawn from a controlled vocabulary: xsd:decimal for numeric scores, xsd:string for lexical descriptors, xsd:dateTime for temporal stamps. The type is not decorative metadata. It routes persistence to the correct value store, enforces validation at ingest, and prevents category errors in reporting. A confidence figure stored as 0.145 or 0.678 must resolve through the decimal value plane; recorded_at must resolve as 2023-08-09T14:45:08 or 2024-07-11T23:49:48 in the datetime plane. Misc, in this architecture, denotes the concrete typed payload—the value instance—held in those planes and keyed back to entity and attr. Thus misc is not miscellaneous data; it is the evidentiary cell whose interpretation is fully determined by the attr–attr_type contract under which it was recorded.

Dimensional classification and acquisition method sit at the boundary between raw instrumentation and interpretable evidence. Dimensionkind partitions observations by the physical or analytical quantity they measure: pressure, temperature, or mass, as registered against FUNC-0001 through FUNC-0004 alongside mass functions such as Gaussian distribution, calibration curve, or normalized weight vector. Method records how that evidence was produced—automated ingestion from a provenance trace log, inferred derivation from a telemetry dump, or hybrid combination as applied to signal capture data. Together, dimensionkind and method answer audit questions that identifiers alone cannot: not merely what was observed, but under which metrological frame and through which epistemic pathway. A calibration certificate mapped to mass with an automated method carries a different compliance posture than a normalized weight vector inferred from the same dimensionkind.

**t_evidence_with_mass_function**

| id | evidence | mass_function | dimension_kind | method |
| --- | --- | --- | --- | --- |
| FUNC-0001 | provenance trace log | Gaussian distribution | pressure | automated |
| FUNC-0002 | calibration certificate | calibration curve | temperature | automated |
| FUNC-0003 | telemetry dump | normalized weight vector | mass | inferred |
| FUNC-0004 | signal capture data | Gaussian distribution | mass | hybrid |
| FUNC-0005 | system event record | posterior distribution | length | automated |

Relational structure among trace artefacts is expressed through subject, target, and role. A subject is the participating node whose affiliation is being asserted; a target is the aggregate or container to which that affiliation applies. In span-within-trace composition, span identifiers such as TRAC-0006 and TRAC-0007 appear as subjects linked to part_of targets including data-ingest-job, auth-flow, checkout-session, and api-request—themselves keyed as TRAC-0001, TRAC-0006, and peers. Role qualifies the nature of participation without redefining identity: contributor marks spans that materially advance a parent workflow (http-get-users within auth-flow, lambda-process-image within data-ingest-job), whereas observer marks spans whose presence is recorded but not treated as causal input (auth-validate-token observing api-request). This tripartite pattern—subject, target, role—generalises beyond tracing into any governance graph where membership must be stated precisely and asymmetrically.

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

In practice, these primitives interlock to support claims that remain open until disconfirmation. A claim entity pairs primary and secondary assertions—redundancy failover successful against data pipeline stalled; thermal monitoring active against secondary sensor aligned—while attribute bindings supply confidence decimals, dimension labels such as Dimension Kind 01, method strings including intake form, and recorded_at timestamps shared across entities where the same attr_id applies. Evidence with mass function entries upstream supply the metrological and methodological context within which those claims acquire weight. Reviewers therefore work from identifier to entity, from entity through attr and attr_type to misc, and from relational subject–target–role links to dimensionkind and method—a closed chain in which every evidentiary statement is locatable, typed, role-qualified, and dimensionally grounded. Failure at any link—untyped misc, orphaned subject, missing method—does not merely degrade reporting; it breaks the defensibility of the record under scrutiny.

**t_claim_not_disconfirmed_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DISC-0001 | DISC-0001 | DISC-0001 | 0.145 |
| DISC-0002 | DISC-0001 | DISC-0005 | 669.01 |
| DISC-0003 | DISC-0001 | DISC-0007 | 65.74 |
| DISC-0004 | DISC-0002 | DISC-0001 | 0.678 |
| DISC-0005 | DISC-0002 | DISC-0005 | 525.06 |
| DISC-0006 | DISC-0002 | DISC-0007 | 361.13 |
| DISC-0007 | DISC-0003 | DISC-0001 | 0.813 |
| DISC-0008 | DISC-0003 | DISC-0005 | 578.57 |