---
chapter_id: ch_live_dempster_combines_audit_evidences_8c9b38
topic_id: 185
family: 07_long_tail
cited_terms: ['dempster_combines_audit_evidences', 'lift_with_support_count', 'directive_traces_to_requirement']
model: engine-refine
---

In evidence-based governance and operational analytics, an identifier is the durable anchor that lets heterogeneous records refer to the same object across time, lineage, and analytic passes without collapsing distinct observations into one narrative. Identifiers such as EVID-0001, COUN-0001, and REQU-0001 are not merely surrogate keys; they establish traceability so that a confidence reading, a regulatory directive, and a lift statistic can be joined, audited, and re-evaluated when source systems change. The entity completes that contract by naming what is being described: entity_id ties each typed value back to a concrete instance—COUN-0001 for a signal-amplification lift observation, REQU-0003 for an EU AI Act Article 9 trace—so that attributes remain properties of identifiable things rather than free-floating fields. Without stable identifier–entity pairing, compliance matrices and belief-state inventories cannot be reproduced; with it, every downstream assertion inherits a defensible provenance chain.

Attributes and their declared attr_type constitute the semantic contract under which values may legally inhabit the model. An attr such as confidence is not interchangeable with recorded_at or mandatory merely because both appear as columns somewhere in storage; attr_type—xsd:decimal, xsd:dateTime, xsd:boolean, xsd:integer—fixes parsing, comparison, aggregation, and validation rules before any value is ingested. In practice, the lift-with-support-count domain declares confidence as xsd:decimal while recorded_at is xsd:dateTime, and directive traces declare effective_date as xsd:date and priority as xsd:integer; values are then persisted in type-homogeneous stores so that 0.849 and 945.35 never compete with 2024-12-28T07:07:56 under a single untyped bucket. Category performs a parallel organizing function at the dimensional layer: dempster_category values such as Dempster Category 01 through Dempster Category 04 classify belief constructs for roll-up reporting, policy scoping, and cross-walk to control families without overloading the identifier itself with descriptive baggage.

**t_lift_with_support_count**

| id | lift | support_count |
| --- | --- | --- |
| COUN-0001 | signal amplification lift | 32768 |
| COUN-0002 | data pipeline lift | 2048 |
| COUN-0003 | sensor drift lift | 16384 |
| COUN-0004 | sensor drift lift | 2048 |
| COUN-0005 | fuel economy lift | 65536 |
| COUN-0006 | aerodynamic lift | 1024 |
| COUN-0007 | signal amplification lift | 32768 |
| COUN-0008 | latency reduction lift | 2048 |

**t_lift_with_support_count_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| COUN-0001 | confidence | xsd:decimal |
| COUN-0002 | dimension_kind | xsd:string |
| COUN-0003 | method | xsd:string |
| COUN-0004 | recorded_at | xsd:dateTime |
| COUN-0005 | uncertainty | xsd:decimal |
| COUN-0006 | unit | xsd:string |
| COUN-0007 | value | xsd:decimal |
| COUN-0008 | encoding | xsd:string |

Dempster, in this operational sense, denotes the evidentiary frame within which belief is allocated, combined, and challenged under Dempster–Shafer semantics rather than treated as a single frequentist probability. Each dempster_key—EVID-0007 referencing EVID-0001 and EVID-0004, EVID-0003 referencing itself—links a fact row to the dimensional label and category that give the mass assignment interpretable context, while dempster_label strings preserve human-readable identity alongside machine keys. Confidence and uncertainty are the paired quantities that make that frame auditable: a confidence of 0.728 attached to EVID-0004 signals comparatively strong support for the associated proposition, whereas 0.014 on EVID-0002 marks a fringe assignment that should not drive automated enforcement without corroboration. Uncertainty magnitudes—9.49 versus 392.06 versus 687.80—quantify residual ignorance in the same record set; high uncertainty alongside middling confidence is a familiar operational warning that the model has committed belief without exhausting alternative hypotheses, a condition that manual review queues and escalation thresholds are designed to catch.

Miscellaneous value fields—misc in the shorthand of integrators—carry the payload that attr_type alone cannot express: numeric magnitudes (520.46, 846.10), lexical encodings (Dimension Kind 01, Encoding 02), timestamps, booleans, and locale tags (es, ja). Their heterogeneity is deliberate; what unifies them is entity_id and attr_id reference integrity, not uniform typing at the fact grain. Thus REQU-0003 may simultaneously carry mandatory=true, effective_date=2025-05-18, and enforcement metadata encoded as Enforcement 02, each in its proper typed store, while COUN-0001 accumulates confidence=0.849, a dimension_kind string, method=nightly summary, and recorded_at spanning late 2024—four facets of one entity that only cohere because attr and attr_type were declared before ingestion. Operators treat misc as evidence-bearing surface area: the same field family holds lift support_count totals (32768 for signal amplification lift versus 2048 for data pipeline lift) and Dempster fact values, reminding consumers that magnitude without declared semantics is inert data.

The lift-with-support-count and directive-traces-to-requirement patterns illustrate why these primitives matter in production governance. Lift differentiates signal amplification lift from duplicate sensor drift lift rows that share a label but diverge in support_count—16384 versus 2048—so analysts do not mistake repeated instrumentation artifacts for reinforced findings; attr-level method and recorded_at further situate each count in time and procedure. On the compliance side, directives from ISO 27001:2022 through Data Classification Policy map into requirement entities whose mandatory flag, effective_date, priority integers (4 versus 453), and enforcement vocabularies determine whether a control is in force, deferred, or aspirational; only EU AI Act Article 9 registers mandatory=true in the sample corpus, a distinction that ranking and workflow engines must honor literally. Confidence on the analytic side and mandatory on the regulatory side are both attrs, yet their attr_type and downstream effect diverge—decimal belief mass versus boolean obligation—underscoring that governance quality depends on respecting type discipline as rigorously as identifier stability.

**t_directive_traces_to_requirement**

| id | directive |
| --- | --- |
| REQU-0001 | ISO 27001:2022 |
| REQU-0002 | PCI DSS v4.0 |
| REQU-0003 | EU AI Act Article 9 |
| REQU-0004 | Data Classification Policy |
| REQU-0005 | PCI DSS v4.0 |
| REQU-0006 | HIPAA Privacy Rule |

**t_directive_traces_to_requirement_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| REQU-0001 | effective_date | xsd:date |
| REQU-0002 | enforcement | xsd:string |
| REQU-0003 | mandatory | xsd:boolean |
| REQU-0004 | priority | xsd:integer |
| REQU-0005 | review_cycle_days | xsd:integer |
| REQU-0006 | scope | xsd:string |
| REQU-0007 | encoding | xsd:string |
| REQU-0008 | label_text | xsd:string |

**t_directive_traces_to_requirement_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| REQU-0001 | REQU-0001 | REQU-0003 | false |
| REQU-0002 | REQU-0002 | REQU-0003 | false |
| REQU-0003 | REQU-0003 | REQU-0003 | true |
| REQU-0004 | REQU-0004 | REQU-0003 | false |
| REQU-0005 | REQU-0005 | REQU-0003 | false |
| REQU-0006 | REQU-0006 | REQU-0003 | true |

**t_directive_traces_to_requirement_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| REQU-0001 | REQU-0001 | REQU-0001 | 2023-08-06 |
| REQU-0002 | REQU-0002 | REQU-0001 | 2023-10-19 |
| REQU-0003 | REQU-0003 | REQU-0001 | 2025-05-18 |
| REQU-0004 | REQU-0004 | REQU-0001 | 2023-12-14 |
| REQU-0005 | REQU-0005 | REQU-0001 | 2024-01-08 |
| REQU-0006 | REQU-0006 | REQU-0001 | 2024-04-02 |

**t_directive_traces_to_requirement_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| REQU-0001 | REQU-0001 | REQU-0004 | 4 |
| REQU-0002 | REQU-0001 | REQU-0005 | 132 |
| REQU-0003 | REQU-0002 | REQU-0004 | 4 |
| REQU-0004 | REQU-0002 | REQU-0005 | 453 |
| REQU-0005 | REQU-0003 | REQU-0004 | 4 |
| REQU-0006 | REQU-0003 | REQU-0005 | 497 |
| REQU-0007 | REQU-0004 | REQU-0004 | 4 |
| REQU-0008 | REQU-0004 | REQU-0005 | 899 |

**t_directive_traces_to_requirement_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| REQU-0001 | REQU-0001 | REQU-0007 | Encoding 01 |
| REQU-0002 | REQU-0001 | REQU-0002 | Enforcement 02 |
| REQU-0003 | REQU-0001 | REQU-0008 | nightly summary |
| REQU-0004 | REQU-0001 | REQU-0009 | ja |
| REQU-0005 | REQU-0001 | REQU-0006 | Scope 05 |
| REQU-0006 | REQU-0002 | REQU-0007 | Encoding 06 |
| REQU-0007 | REQU-0002 | REQU-0002 | Enforcement 07 |
| REQU-0008 | REQU-0002 | REQU-0008 | change rationale |

Taken together, identifier, entity, attr, attr_type, category, dempster, confidence, uncertainty, and misc form an evidence lattice in which nothing is asserted without a typed slot, nothing is typed without an entity, and nothing is combined across domains without an explicit dempster or categorical bridge. High-confidence, lower-uncertainty rows such as EVID-0004 (0.728, 479.57) may justify automated promotion; low-confidence, high-uncertainty rows such as EVID-0002 (0.014, 392.06) should remain quarantined until additional mass is allocated or support_count corroboration arrives from an independent lift. Category and dempster_label layers keep belief and compliance artifacts legible to humans; attr_type keeps them computable to machines; misc carries the measured world into both. That separation of concerns—identity, semantics, belief, obligation, and raw value—is what allows a single handbook to govern forensic replay, regulatory traceability, and analytic fusion without collapsing distinct epistemic standards into one undifferentiated table of facts.

**fact_dempster**

| id | dempster_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| EVID-0001 | EVID-0007 | 0.153 | 9.49 | 520.46 |
| EVID-0002 | EVID-0003 | 0.014 | 392.06 | 137.18 |
| EVID-0003 | EVID-0004 | 0.025 | 687.80 | 197.61 |
| EVID-0004 | EVID-0007 | 0.728 | 479.57 | 846.10 |
| EVID-0005 | EVID-0005 | 0.918 | 172.36 | 296.96 |
| EVID-0006 | EVID-0006 | 0.755 | 608.06 | 341.51 |

**dim_dempster**

| id | dempster_label | dempster_category |
| --- | --- | --- |
| EVID-0001 | Dempster Label 01 | Dempster Category 01 |
| EVID-0002 | Dempster Label 02 | Dempster Category 02 |
| EVID-0003 | Dempster Label 03 | Dempster Category 03 |
| EVID-0004 | Dempster Label 04 | Dempster Category 04 |
| EVID-0005 | Dempster Label 05 | Dempster Category 05 |
| EVID-0006 | Dempster Label 06 | Dempster Category 06 |
| EVID-0007 | Dempster Label 07 | Dempster Category 07 |
| EVID-0008 | Dempster Label 08 | Dempster Category 08 |

**t_lift_with_support_count_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| COUN-0001 | COUN-0001 | COUN-0004 | 2024-12-28T07:07:56 |
| COUN-0002 | COUN-0002 | COUN-0004 | 2023-08-28T07:06:53 |
| COUN-0003 | COUN-0003 | COUN-0004 | 2023-06-25T23:08:52 |
| COUN-0004 | COUN-0004 | COUN-0004 | 2024-05-16T16:03:55 |
| COUN-0005 | COUN-0005 | COUN-0004 | 2024-10-22T12:30:05 |
| COUN-0006 | COUN-0006 | COUN-0004 | 2023-09-08T00:35:07 |
| COUN-0007 | COUN-0007 | COUN-0004 | 2025-05-03T04:02:17 |
| COUN-0008 | COUN-0008 | COUN-0004 | 2024-04-02T09:45:25 |

**t_lift_with_support_count_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| COUN-0001 | COUN-0001 | COUN-0001 | 0.849 |
| COUN-0002 | COUN-0001 | COUN-0005 | 945.35 |
| COUN-0003 | COUN-0001 | COUN-0007 | 331.44 |
| COUN-0004 | COUN-0002 | COUN-0001 | 0.258 |
| COUN-0005 | COUN-0002 | COUN-0005 | 675.58 |
| COUN-0006 | COUN-0002 | COUN-0007 | 197.74 |
| COUN-0007 | COUN-0003 | COUN-0001 | 0.111 |
| COUN-0008 | COUN-0003 | COUN-0005 | 368.51 |

**t_lift_with_support_count_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| COUN-0001 | COUN-0001 | COUN-0002 | Dimension Kind 01 |
| COUN-0002 | COUN-0001 | COUN-0008 | Encoding 02 |
| COUN-0003 | COUN-0001 | COUN-0009 | nightly summary |
| COUN-0004 | COUN-0001 | COUN-0010 | es |
| COUN-0005 | COUN-0001 | COUN-0003 | hybrid |
| COUN-0006 | COUN-0001 | COUN-0006 | ratio |
| COUN-0007 | COUN-0002 | COUN-0002 | Dimension Kind 07 |
| COUN-0008 | COUN-0002 | COUN-0008 | Encoding 08 |