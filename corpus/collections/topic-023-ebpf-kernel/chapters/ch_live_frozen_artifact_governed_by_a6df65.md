---
chapter_id: ch_live_frozen_artifact_governed_by_a6df65
topic_id: 23
family: 07_long_tail
cited_terms: ['frozen_artifact_governed_by', 'span_with_parent', 'profile_of_dataset']
model: engine-refine
---

Governance of frozen artifacts rests on a separation between the thing governed, the schema that constrains what may be said about it, and the typed assertions that populate that schema at runtime. Each governed artifact—Log-Archive-23Q4, Model-Prod-v4, Q3-2023-Snapshot, Compliance-09—receives a durable identifier (GOVE-0001 through GOVE-0004) that survives renaming, redeployment, and archival rotation; the identifier is not the artifact’s display name but the stable handle by which auditors, retention jobs, and policy engines refer to the same immutable object across systems. The entity, in this framing, is the governed record itself: every attribute value is anchored to an entity_id that must resolve to exactly one such artifact, so that effective_date 2025-04-28 for GOVE-0001 cannot be mistaken for the 2024-02-08 bound to GOVE-0002. That binding is what makes compliance arguments reconstructible—who was mandatory, when enforcement took effect, which snapshot carried which priority—without collapsing distinct artifacts into a single undifferentiated blob.

**t_frozen_artifact_governed_by**

| id | frozen |
| --- | --- |
| GOVE-0001 | Log-Archive-23Q4 |
| GOVE-0002 | Model-Prod-v4 |
| GOVE-0003 | Q3-2023-Snapshot |
| GOVE-0004 | Compliance-09 |
| GOVE-0005 | Audit-Baseline-2024 |
| GOVE-0006 | Log-Archive-23Q4 |

**t_frozen_artifact_governed_by_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| GOVE-0001 | effective_date | xsd:date |
| GOVE-0002 | enforcement | xsd:string |
| GOVE-0003 | mandatory | xsd:boolean |
| GOVE-0004 | priority | xsd:integer |
| GOVE-0005 | review_cycle_days | xsd:integer |
| GOVE-0006 | scope | xsd:string |
| GOVE-0007 | encoding | xsd:string |
| GOVE-0008 | label_text | xsd:string |

**t_frozen_artifact_governed_by_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| GOVE-0001 | GOVE-0001 | GOVE-0003 | false |
| GOVE-0002 | GOVE-0002 | GOVE-0003 | true |
| GOVE-0003 | GOVE-0003 | GOVE-0003 | false |
| GOVE-0004 | GOVE-0004 | GOVE-0003 | true |
| GOVE-0005 | GOVE-0005 | GOVE-0003 | false |
| GOVE-0006 | GOVE-0006 | GOVE-0003 | false |

**t_frozen_artifact_governed_by_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| GOVE-0001 | GOVE-0001 | GOVE-0001 | 2025-04-28 |
| GOVE-0002 | GOVE-0002 | GOVE-0001 | 2024-02-08 |
| GOVE-0003 | GOVE-0003 | GOVE-0001 | 2024-10-20 |
| GOVE-0004 | GOVE-0004 | GOVE-0001 | 2024-01-16 |
| GOVE-0005 | GOVE-0005 | GOVE-0001 | 2024-06-17 |
| GOVE-0006 | GOVE-0006 | GOVE-0001 | 2024-04-05 |

**t_frozen_artifact_governed_by_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| GOVE-0001 | GOVE-0001 | GOVE-0004 | 1 |
| GOVE-0002 | GOVE-0001 | GOVE-0005 | 718 |
| GOVE-0003 | GOVE-0002 | GOVE-0004 | 5 |
| GOVE-0004 | GOVE-0002 | GOVE-0005 | 330 |
| GOVE-0005 | GOVE-0003 | GOVE-0004 | 4 |
| GOVE-0006 | GOVE-0003 | GOVE-0005 | 316 |
| GOVE-0007 | GOVE-0004 | GOVE-0004 | 5 |
| GOVE-0008 | GOVE-0004 | GOVE-0005 | 796 |

**t_frozen_artifact_governed_by_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| GOVE-0001 | GOVE-0001 | GOVE-0007 | Encoding 01 |
| GOVE-0002 | GOVE-0001 | GOVE-0002 | Enforcement 02 |
| GOVE-0003 | GOVE-0001 | GOVE-0008 | calibration record |
| GOVE-0004 | GOVE-0001 | GOVE-0009 | es |
| GOVE-0005 | GOVE-0001 | GOVE-0006 | Scope 05 |
| GOVE-0006 | GOVE-0002 | GOVE-0007 | Encoding 06 |
| GOVE-0007 | GOVE-0002 | GOVE-0002 | Enforcement 07 |
| GOVE-0008 | GOVE-0002 | GOVE-0008 | nightly summary |

Attributes and their types constitute the contract under which governance metadata may be recorded. An attr names the semantic slot—effective_date, enforcement, mandatory, priority—while attr_type declares the legal inhabitants of that slot: xsd:date, xsd:string, xsd:boolean, xsd:integer. Typed separation matters in practice because a boolean mandatory flag and an integer priority do not share storage or validation rules; GOVE-0003’s mandatory=false and GOVE-0002’s mandatory=true live in boolean-valued assertions, whereas priority 1 and 718 occupy integer channels keyed to attr_id GOVE-0004 and GOVE-0005. Enforcement prose—“Enforcement 02,” “calibration record,” the locale tag es—lands in varchar misc fields, illustrating that misc is not “unimportant data” but payload whose interpretation is delegated to the attr that names it: the same misc column carries encoding labels, enforcement citations, and human-readable audit fragments depending on attr_id. Schema designers therefore treat attr and attr_type as normative, and misc as the evidence surface whose meaning is always attr-relative.

Hierarchical observability introduces a second family of relations in which subject and target name directed endpoints and role qualifies the edge between them. A span such as orchestrator job or gateway auth check denotes a bounded unit of work; parent_span situates that unit inside a larger trace—cache lookup session upstream of the orchestrator, service mesh proxy bracketing both api gateway route and gateway auth check. The subject/target pairing in parent-span linkage is deliberately asymmetric: span_id is the subject whose lineage is being asserted, parent_span_id is the target against which that lineage is measured, and role—owner, observer, reviewer—states whether the subject originates the dependency, passively witnesses it, or holds review authority over it. When PARE-0004 (gateway auth check) lists PARE-0002 (api gateway route) as parent with role owner, the graph encodes operational accountability rather than mere temporal adjacency; a reviewer role on a mesh-proxy edge signals that the relationship is subject to human or policy gate, not only to packet flow. These roles are how distributed systems export governance semantics into telemetry that compliance teams can read without re-deriving intent from raw timestamps.

**t_span_with_parent**

| id | span |
| --- | --- |
| PARE-0001 | orchestrator job |
| PARE-0002 | api gateway route |
| PARE-0003 | request router |
| PARE-0004 | gateway auth check |
| PARE-0005 | kafka consumer process |
| PARE-0006 | gateway auth check |
| PARE-0007 | orchestrator job |
| PARE-0008 | service mesh proxy |

**t_span_with_parent_parent_span**

| id | parent_span |
| --- | --- |
| PARE-0001 | cache lookup session |
| PARE-0002 | service mesh proxy |
| PARE-0003 | load balancer forward |
| PARE-0004 | service mesh proxy |
| PARE-0005 | kafka consumer process |
| PARE-0006 | kafka consumer process |

**t_span_with_parent__parent_span**

| id | span_id | parent_span_id | role |
| --- | --- | --- | --- |
| PARE-0001 | PARE-0004 | PARE-0002 | owner |
| PARE-0002 | PARE-0002 | PARE-0005 | observer |
| PARE-0003 | PARE-0003 | PARE-0001 | owner |
| PARE-0004 | PARE-0005 | PARE-0005 | reviewer |
| PARE-0005 | PARE-0005 | PARE-0003 | owner |
| PARE-0006 | PARE-0005 | PARE-0002 | observer |
| PARE-0007 | PARE-0004 | PARE-0002 | observer |
| PARE-0008 | PARE-0006 | PARE-0005 | contributor |

Profiles and categories organize factual assertions that are not tied to a single artifact’s attribute schema but to analytic or evidentiary keys shared across the estate. A profile—Profile Label 01 through Profile Label 04—is a labeled container for interpretable quantities; category and category_id classify that container so that Profile Category 01 and Category Name 04 type the same fact differently depending on whether the question is regulatory taxonomy or operational grouping. fact_profile rows attach measurements to profile_key references (DATA-0005, DATA-0003, DATA-0006), storing misc values 728.94, 607.36, 448.09 alongside epistemic metadata. Here profile is both join key and semantic scope: two rows sharing profile_key DATA-0005 carry distinct confidence and uncertainty envelopes (0.299 versus 0.994; uncertainty 284.36 versus 557.92), showing that identical profiling context can host competing or successive measurements whose trustworthiness must be stated explicitly rather than inferred from repetition.

Confidence and uncertainty quantify the defensibility of those profile-bound misc values and therefore govern whether a downstream control may treat them as binding. Confidence 0.994 on value 380.57 signals near-certainty suitable for automated enforcement; confidence 0.226 paired with uncertainty 488.10 on value 448.09 marks an assertion that should trigger human review or wider confidence intervals in risk models. High uncertainty (622.09 on value 607.36 at confidence 0.773) is not a data error but an admission that the evidentiary chain—sampling window, sensor calibration visible in varchar misc such as “calibration record,” parent-span reviewer roles—does not fully collapse variance. Operational guides mandate reporting both metrics because confidence alone can overstate precision when sample depth is thin, and uncertainty alone can obscure whether the estimate is biased or merely noisy.

Taken together, identifier stability, entity-scoped attrs with typed misc payloads, directed subject–target relations annotated by role, and profile/category fact planes with explicit confidence and uncertainty form the spine of a governance framework that remains legible under audit. Frozen artifacts inherit temporal and enforcement metadata through typed attributes; traces inherit accountability through role-qualified lineage; analytic profiles inherit epistemic honesty through dual uncertainty reporting. Systems that conflate these layers—storing enforcement strings in integer tables, or promoting low-confidence profile values into mandatory flags—produce artifacts that look complete yet fail reconstruction under scrutiny. The design discipline is therefore to keep each construct in its lane while weaving them at query time: entity-bound governance for immutability commitments, span graphs for operational provenance, and profile facts for measured belief, each cited by identifier, none substitutable for the others.

**fact_profile**

| id | profile_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| DATA-0001 | DATA-0005 | 0.299 | 284.36 | 728.94 |
| DATA-0002 | DATA-0005 | 0.994 | 557.92 | 380.57 |
| DATA-0003 | DATA-0003 | 0.773 | 622.09 | 607.36 |
| DATA-0004 | DATA-0006 | 0.226 | 488.10 | 448.09 |

**dim_profile_category**

| id | category_name |
| --- | --- |
| DATA-0001 | Category Name 01 |
| DATA-0002 | Category Name 02 |
| DATA-0003 | Category Name 03 |
| DATA-0004 | Category Name 04 |
| DATA-0005 | Category Name 05 |
| DATA-0006 | Category Name 06 |

**dim_profile**

| id | profile_label | profile_category | category_id |
| --- | --- | --- | --- |
| DATA-0001 | Profile Label 01 | Profile Category 01 | DATA-0004 |
| DATA-0002 | Profile Label 02 | Profile Category 02 | DATA-0006 |
| DATA-0003 | Profile Label 03 | Profile Category 03 | DATA-0005 |
| DATA-0004 | Profile Label 04 | Profile Category 04 | DATA-0001 |
| DATA-0005 | Profile Label 05 | Profile Category 05 | DATA-0002 |
| DATA-0006 | Profile Label 06 | Profile Category 06 | DATA-0004 |
| DATA-0007 | Profile Label 07 | Profile Category 07 | DATA-0002 |