---
chapter_id: ch_live_state_of_system_block_581879
topic_id: 26
family: 02_observation_measurement
cited_terms: ['state_of_system_block', 'trace_subclass', 'evidence_for_audit']
model: engine-refine
---

Operational telemetry and audit evidence in governed environments rest on a small set of interoperable concepts—identifier, entity, state, spans, category, confidence, and typed attributes—that together make assertions about system behavior defensible under scrutiny. An identifier is the durable handle that binds a fact to its dimensions and to downstream evidence: a block such as BLOC-0001 or a trace such as TRAC-0003 remains the same key whether the record is interpreted as a measured outcome, a classified condition, or an auditable artifact. Entities extend that binding into multi-valued descriptions. An audit entity like AUDI-0001 can carry several attributes at once—confidence scored as 0.978, a dimension kind of “Dimension Kind 01,” an intake method recorded as “intake form,” and a timestamp anchored at 2024-10-15T21:07:57—each value stored according to its declared type rather than collapsed into an untyped blob. That separation matters because compliance reviews rarely ask only “what was recorded,” but whether the recording was typed, attributable, and retrievable in the form regulators and internal control frameworks expect.

**dim_state_category**

| id | category_name |
| --- | --- |
| BLOC-0001 | Category Name 01 |
| BLOC-0002 | Category Name 02 |
| BLOC-0003 | Category Name 03 |
| BLOC-0004 | Category Name 04 |
| BLOC-0005 | Category Name 05 |
| BLOC-0006 | Category Name 06 |

**dim_state**

| id | state_label | state_category | category_id |
| --- | --- | --- | --- |
| BLOC-0001 | State Label 01 | State Category 01 | BLOC-0001 |
| BLOC-0002 | State Label 02 | State Category 02 | BLOC-0003 |
| BLOC-0003 | State Label 03 | State Category 03 | BLOC-0004 |
| BLOC-0004 | State Label 04 | State Category 04 | BLOC-0003 |
| BLOC-0005 | State Label 05 | State Category 05 | BLOC-0006 |
| BLOC-0006 | State Label 06 | State Category 06 | BLOC-0006 |
| BLOC-0007 | State Label 07 | State Category 07 | BLOC-0002 |
| BLOC-0008 | State Label 08 | State Category 08 | BLOC-0003 |

**dim_spans_category**

| id | category_name |
| --- | --- |
| TRAC-0001 | Category Name 01 |
| TRAC-0002 | Category Name 02 |
| TRAC-0003 | Category Name 03 |
| TRAC-0004 | Category Name 04 |
| TRAC-0005 | Category Name 05 |
| TRAC-0006 | Category Name 06 |

**dim_spans**

| id | spans_label | spans_category | category_id |
| --- | --- | --- | --- |
| TRAC-0001 | Spans Label 01 | Spans Category 01 | TRAC-0001 |
| TRAC-0002 | Spans Label 02 | Spans Category 02 | TRAC-0006 |
| TRAC-0003 | Spans Label 03 | Spans Category 03 | TRAC-0006 |
| TRAC-0004 | Spans Label 04 | Spans Category 04 | TRAC-0003 |
| TRAC-0005 | Spans Label 05 | Spans Category 05 | TRAC-0003 |
| TRAC-0006 | Spans Label 06 | Spans Category 06 | TRAC-0006 |

**t_evidence_for_audit**

| id | evidence |
| --- | --- |
| AUDI-0001 | AuditTrail_20231015 |
| AUDI-0002 | ChainOfCustody_Batch44 |
| AUDI-0003 | ChainOfCustody_Batch44 |
| AUDI-0004 | SignatureBlock_99A1 |
| AUDI-0005 | NetworkPacketCapture_0xFF |
| AUDI-0006 | AuditTrail_20231015 |

**t_evidence_for_audit_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| AUDI-0001 | confidence | xsd:decimal |
| AUDI-0002 | dimension_kind | xsd:string |
| AUDI-0003 | method | xsd:string |
| AUDI-0004 | recorded_at | xsd:dateTime |
| AUDI-0005 | uncertainty | xsd:decimal |
| AUDI-0006 | unit | xsd:string |
| AUDI-0007 | value | xsd:decimal |
| AUDI-0008 | encoding | xsd:string |

State expresses what the system believes to be true about a condition at a point in time, and confidence quantifies how strongly that belief is held. In practice, state is never merely a label: it is a keyed assertion whose strength varies materially across the population. One block may register confidence of 0.523 alongside an associated numeric value of 619.50, while another registers 0.012 with value 143.04—a spread wide enough to force tiered handling rather than uniform treatment. Categories supply the semantic scaffold that prevents raw states from being compared across incompatible contexts. When “State Label 03” rolls up under “State Category 03” and resolves through category_id to a named taxonomy entry, reviewers can aggregate, escalate, and report by class instead of by opaque code. The miscellaneous numeric fields that ride alongside state—uncertainty in the hundreds, auxiliary values in the hundreds or thousands—are not decorative; they are the quantitative residue of models, sensors, or human judgment that explain why two states with similar labels may nonetheless warrant different control responses.

Spans name the bounded units of work through which state and outcome are actually produced, and they are where operational governance meets runtime behavior. A span is the traceable segment whose label and category (“Spans Label 02” under “Spans Category 02,” for example) tell operators what kind of activity completed, while execution facts tell them how it completed. Duration in seconds turns latency into an auditable quantity: runs lasting 1874.27, 2092.44, or nearly 3940.66 seconds are not interchangeable performance anecdotes; they are evidence of load, contention, or procedural drag that may explain downstream state quality. Exit codes translate process termination into a control vocabulary—491, 900, 420, and 60 are not interchangeable success markers, and pairing them with retry counts in the hundreds (179 through 459 in the sample) reveals systems that may be nominally completing work only after extensive resubmission. In mature operations, spans are reviewed as first-class objects: their categories align to service boundaries, their exits feed error-budget and incident logic, and their retries become leading indicators of fragility long before confidence on related states collapses.

Attributes and attribute types complete the chain from runtime fact to audit-ready proof. An attribute is a named, schema-bound property—confidence, dimension_kind, method, recorded_at—whose attr_type declares the legal representation: xsd:decimal for measurements, xsd:string for categorical or textual descriptors, xsd:dateTime for temporal anchoring. That typing is a control, not a convenience; it prevents a timestamp from being stored where a decimal belongs and ensures validators, retention rules, and disclosure packages can be applied mechanically. Evidence objects then ground abstract telemetry in custody narratives: AuditTrail_20231015, duplicated ChainOfCustody_Batch44 references, and SignatureBlock_99A1 are the kinds of artifacts that make a numeric confidence or a span exit code admissible in an audit conversation. The entity identifier is the join surface across those layers—the same AUDI-0002 that owns a decimal confidence of 0.546 may also own the datetime value recorded under the shared recorded_at attribute definition—so investigators can reconstruct who knew what, when, and under which classification, without re-deriving lineage from logs alone.

**t_evidence_for_audit_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AUDI-0001 | AUDI-0001 | AUDI-0004 | 2024-10-15T21:07:57 |
| AUDI-0002 | AUDI-0002 | AUDI-0004 | 2024-11-22T11:38:19 |
| AUDI-0003 | AUDI-0003 | AUDI-0004 | 2023-06-03T22:32:06 |
| AUDI-0004 | AUDI-0004 | AUDI-0004 | 2024-07-15T05:43:09 |
| AUDI-0005 | AUDI-0005 | AUDI-0004 | 2024-03-30T03:15:54 |
| AUDI-0006 | AUDI-0006 | AUDI-0004 | 2024-06-18T04:52:41 |

**t_evidence_for_audit_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AUDI-0001 | AUDI-0001 | AUDI-0001 | 0.978 |
| AUDI-0002 | AUDI-0001 | AUDI-0005 | 590.71 |
| AUDI-0003 | AUDI-0001 | AUDI-0007 | 212.01 |
| AUDI-0004 | AUDI-0002 | AUDI-0001 | 0.546 |
| AUDI-0005 | AUDI-0002 | AUDI-0005 | 882.77 |
| AUDI-0006 | AUDI-0002 | AUDI-0007 | 90.06 |
| AUDI-0007 | AUDI-0003 | AUDI-0001 | 0.051 |
| AUDI-0008 | AUDI-0003 | AUDI-0005 | 692.35 |

Taken together, these concepts implement a closed loop that compliance and engineering organizations both depend on. Identifiers stabilize reference; categories enforce comparability; state and confidence express belief with explicit strength; spans and duration_seconds expose how belief was generated; exit and retry_count expose whether generation succeeded cleanly or only after strain; entity, attr, and attr_type package the result for audit; and misc-valued fields carry the residual detail that pure taxonomies omit. A reviewer seeing low confidence of 0.012 on one block, high retries on a related trace, and a chain-of-custody artifact with a precisely typed recorded_at can reason across layers instead of treating each table as an isolated report. That is the practical objective: not to catalog fields, but to ensure that every consequential assertion about system behavior is keyed, classified, measured, time-stamped, typed, and tethered to evidence strong enough to survive governance challenge.

**fact_state**

| id | state_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| BLOC-0001 | BLOC-0001 | 0.422 | 951.90 | 195.86 |
| BLOC-0002 | BLOC-0004 | 0.012 | 416.12 | 143.04 |
| BLOC-0003 | BLOC-0005 | 0.075 | 421.79 | 237.15 |
| BLOC-0004 | BLOC-0003 | 0.523 | 366.30 | 619.50 |

**fact_trace**

| id | spans_key | duration_seconds | exit_code | retry_count |
| --- | --- | --- | --- | --- |
| TRAC-0001 | TRAC-0005 | 1874.27 | 491 | 399 |
| TRAC-0002 | TRAC-0002 | 2092.44 | 900 | 179 |
| TRAC-0003 | TRAC-0004 | 3940.66 | 420 | 396 |
| TRAC-0004 | TRAC-0006 | 3336.66 | 60 | 459 |

**t_evidence_for_audit_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AUDI-0001 | AUDI-0001 | AUDI-0002 | Dimension Kind 01 |
| AUDI-0002 | AUDI-0001 | AUDI-0008 | Encoding 02 |
| AUDI-0003 | AUDI-0001 | AUDI-0009 | intake form |
| AUDI-0004 | AUDI-0001 | AUDI-0010 | fr |
| AUDI-0005 | AUDI-0001 | AUDI-0003 | automated |
| AUDI-0006 | AUDI-0001 | AUDI-0006 | count |
| AUDI-0007 | AUDI-0002 | AUDI-0002 | Dimension Kind 07 |
| AUDI-0008 | AUDI-0002 | AUDI-0008 | Encoding 08 |