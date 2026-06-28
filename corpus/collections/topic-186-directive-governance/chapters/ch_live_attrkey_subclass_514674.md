---
chapter_id: ch_live_attrkey_subclass_514674
topic_id: 186
family: 01_foundation
cited_terms: ['attrkey_subclass', 'transformation_subclass', 'constraint_with_severity_classification']
model: engine-refine
---

Format, identifier, language, namespace, phase, priority, and status are not decorative metadata tags; they are the control plane through which a distributed compliance and operations program keeps heterogeneous artifacts mutually intelligible, auditable, and enforceable. An identifier supplies the durable handle that survives renaming, rehosting, and version churn. When a voltage-reading attribute is keyed as ATTR-0004 and an access-control policy is keyed as CLAS-0001, downstream systems can bind them without parsing natural-language labels or inferring identity from column names like `voltage_read`. The same principle governs transformation records: TRAN-0002 (Provenance Hash Computation) and TRAN-0003 (Log Pattern Extraction) remain traceable even when their implementation paths change, because governance workflows, incident reviews, and dependency graphs reference the stable id rather than the mutable transformation title.

**t_attrkey_subclass**

| id | attrkey | describes_property | format | namespace |
| --- | --- | --- | --- | --- |
| ATTR-0001 | lot_number | CLAS-0006 | CSV | governance |
| ATTR-0002 | batch_id | CLAS-0002 | UUID | governance |
| ATTR-0003 | operator_code | CLAS-0006 | UUID | telemetry |
| ATTR-0004 | voltage_read | CLAS-0001 | E.164 | telemetry |
| ATTR-0005 | flow_rate | CLAS-0003 | E.164 | governance |
| ATTR-0006 | lot_number | CLAS-0005 | CSV | governance |
| ATTR-0007 | ambient_temp | CLAS-0006 | JSON | catalog |

**t_transformation_subclass**

| id | transformation | uses_entity | phase | status |
| --- | --- | --- | --- | --- |
| TRAN-0001 | Signal Bandpass Filtering | REST API Response Bodies | review | failed |
| TRAN-0002 | Provenance Hash Computation | Reagent Batch Alpha | execution | complete |
| TRAN-0003 | Log Pattern Extraction | PCAP Archive Files | execution | pending |
| TRAN-0004 | Telemetry Aggregation Rollup | PostgreSQL Schema Definitions | execution | complete |

Format specifies the syntactic contract an attribute must satisfy before it can participate in validation, interchange, or automated enforcement. A lot number governed under CSV implies delimiter-based batch interchange and parser expectations distinct from a batch identifier constrained to UUID, which signals opaque, globally unique identity suitable for lineage graphs. Operator codes under UUID and voltage readings under E.164 further show that format is chosen per semantic role: personnel or device identity versus telephony-normalized numeric telemetry. Format does not replace business meaning, but it prevents silent corruption—an E.164 constraint on voltage_read (ATTR-0004, tied to CLAS-0001) encodes the expectation that ingestion pipelines will reject values that cannot be normalized, rather than coercing them into noncompliant storage.

Namespace partitions the attribute catalog so policies, retention rules, and operational owners do not collide across domains. Attributes scoped to governance—lot_number and batch_id—carry identifiers and formats aligned with procedural controls such as batch provenance and encryption mandates, while telemetry-scoped attributes like operator_code and voltage_read sit closer to observability and instrument data paths. That separation allows a PII encryption mandate (CLAS-0002, priority 5) to target governance identifiers without rewriting telemetry ingestion rules, and it allows sensor- and log-related constraints to reference telemetry namespaced keys without inheriting unrelated access-control semantics. Namespace is therefore a boundary for applicability: the same format string in two namespaces may invoke different validators, audit trails, and escalation routes.

Language, priority, phase, and status together govern how human obligations are expressed, ordered, and executed over time. Language records the authoritative articulation locale for a constraint—Spanish for access control and calibration interval rules, English for the PII encryption mandate, French for log retention—so localized policy text, auditor correspondence, and operator runbooks remain aligned with the machine-readable classification rather than with ad hoc translations. Priority ranks constraints when conflicts arise: the encryption mandate at priority 5 outranks the access-control, calibration, and retention rules at priority 3, establishing a deterministic precedence during exception handling or emergency change windows. Phase situates automated work in a lifecycle: Signal Bandpass Filtering remains in review while peer transformations have advanced to execution, reflecting a deliberate gate before operational side effects. Status closes the loop on execution truth—Provenance Hash Computation and Telemetry Aggregation Rollup are complete, Log Pattern Extraction is pending, and the bandpass filter transformation has failed—giving operators a ground-truth ledger that complements phase by reporting outcome rather than intent.

**t_constraint_with_severity_classification**

| id | constraint | severity | priority | language |
| --- | --- | --- | --- | --- |
| CLAS-0001 | Access control policy | ATTR-0004 | 3 | es |
| CLAS-0002 | PII encryption mandate | ATTR-0003 | 5 | en |
| CLAS-0003 | Sensor calibration interval | ATTR-0006 | 3 | es |
| CLAS-0004 | Log retention period | ATTR-0003 | 3 | fr |
| CLAS-0005 | Lab containment level | ATTR-0001 | 3 | ja |
| CLAS-0006 | Lab containment level | ATTR-0005 | 2 | fr |

In practice these dimensions compose into traceable chains rather than isolated fields. A constraint’s severity pointer to an attribute key (for example, CLAS-0001 referencing ATTR-0004, or CLAS-0002 referencing ATTR-0003) ties regulatory language and priority to a concrete data element governed by format and namespace. Transformations declare which entities they consume—REST API response bodies, reagent batches, PCAP archives, database schema definitions—while phase and status report where that consumption stands in the pipeline. An operator debugging a failed review-stage filter can follow identifiers backward to the attributes and constraints that shaped acceptable inputs, forward to pending extractions still blocking downstream analytics, and sideways across namespaces to see whether a governance UUID on batch_id or a telemetry E.164 reading triggered the breach. That composability is why organizations invest in normalized identifiers and explicit dimensions instead of embedding format, locale, lifecycle, and precedence inside free-text descriptions: the handbook’s operational value emerges when every artifact can be located, validated, ranked, localized, staged, and verified through a shared vocabulary that survives the specifics of any single table or deployment.