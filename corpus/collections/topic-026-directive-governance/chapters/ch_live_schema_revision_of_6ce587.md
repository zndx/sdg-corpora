---
chapter_id: ch_live_schema_revision_of_6ce587
topic_id: 26
family: 07_long_tail
cited_terms: ['schema_revision_of', 'tc_classifier_subclass', 'measurement_with_unit']
model: engine-refine
---

Schema governance and data classification rest on a small set of interoperable metadata primitives that let organizations name entities unambiguously, describe how they relate, and enforce accountability across evolving information assets. At the center sits the **identifier**: a durable, system-neutral key that survives renames, migrations, and cross-system reconciliation. Identifiers such as `REVI-0001` or `CLAS-0003` are not merely surrogate database keys; in compliance and operational contexts they function as audit anchors—citation handles that investigators, data stewards, and automated policy engines can reference when tracing lineage, proving who approved what, or correlating a classifier rule with the artifact it governed. Without stable identifiers, governance collapses into brittle string matching on display names that drift over time.

**Subject** and **target** encode directed relationships between governed entities. A subject is the entity whose membership, attribution, or dependency is being asserted; a target is the entity to which that assertion points. In schema-revision governance, a subject revision `REVI-0001` may be linked to a target revision `REVI-0006`, expressing that a contemporary network-flow schema derives from or supersedes a particular predecessor. The same pattern appears when measurements are bound to units: a subject measurement identifier points at a target unit identifier, establishing semantic validity—whether latency is expressed in milliseconds or blood pressure in beats per minute. Directionality matters because compliance queries are rarely symmetric: auditors ask “what does this schema revise?” or “which unit owns this measurement?” not merely “are these two records associated?”

**t_schema_revision_of**

| id | schema |
| --- | --- |
| REVI-0001 | network_flow_record |
| REVI-0002 | product_inventory_catalog |
| REVI-0003 | network_flow_record |
| REVI-0004 | clinical_trial_protocol |
| REVI-0005 | financial_ledger_format |
| REVI-0006 | network_flow_record |
| REVI-0007 | api_gateway_routing |
| REVI-0008 | compliance_audit_log |

**t_schema_revision_of_schema_revision_of**

| id | schema_revision_of |
| --- | --- |
| REVI-0001 | legacy_compliance_log |
| REVI-0002 | legacy_compliance_log |
| REVI-0003 | legacy_compliance_log |
| REVI-0004 | legacy_network_record |
| REVI-0005 | legacy_api_gateway |
| REVI-0006 | legacy_api_gateway |

**Role** qualifies those associations with accountable participation types—reviewer, contributor, owner, observer—so that governance is not reduced to existence of a link but to the nature of obligation attached to it. When `REVI-0002` connects to `REVI-0001` under role contributor, the organization records not only lineage but also that a specific party had authoring responsibility rather than final approval authority; an owner on a measurement–unit pairing signals custodial accountability for unit correctness, while reviewer and observer roles separate attestation from passive visibility. Roles operationalize segregation-of-duties controls: the same identifier graph can support access reviews, sign-off workflows, and evidence bundles that show separation between those who changed a schema and those who certified it.

**t_measurement_with_unit**

| id | measurement |
| --- | --- |
| UNIT-0001 | Blood pressure |
| UNIT-0002 | Ozone concentration |
| UNIT-0003 | Seismic magnitude |
| UNIT-0004 | Network latency |
| UNIT-0005 | Network latency |
| UNIT-0006 | Battery voltage |
| UNIT-0007 | Network latency |
| UNIT-0008 | Blood pressure |

**t_measurement_with_unit_unit**

| id | unit |
| --- | --- |
| UNIT-0001 | milligrams per deciliter |
| UNIT-0002 | Richter scale |
| UNIT-0003 | milliseconds |
| UNIT-0004 | beats per minute |
| UNIT-0005 | milligrams per deciliter |
| UNIT-0006 | beats per minute |

Classifier facts extend the model into operational telemetry about governed artifacts. **Version** captures intentional evolution of a classifier or policy artifact—`CLAS-0004` at version 9 versus peers at version 1 or 2 signals a long-lived rule that has undergone repeated amendment, whereas a low version may indicate a newly introduced control still under stabilization. **Size bytes** quantifies the material footprint the classifier applies to—values on the order of hundreds of millions of bytes illustrate that classification decisions are often tied to bulk data estates where storage tiering, retention schedules, and cross-border transfer rules must be enforced at scale. Size is not decorative metadata; it informs risk prioritization, capacity planning, and whether a given control’s blast radius warrants enhanced monitoring.

**T/C direction**—transfer and control direction—situates classifiers within a directional taxonomy of how data may move or how control authority flows. Classifier records reference direction keys that resolve through a dimension carrying human-readable **misc** labels and higher-level **category** groupings. A label such as “T C Direction Label 01” under category “T C Direction Category 01” gives operators a controlled vocabulary for stating whether traffic is inbound, outbound, under third-party custody, or subject to jurisdictional constraints—without embedding fragile free text in every fact row. Categories aggregate many labeled directions for policy authoring (“all Category 03 flows require encryption attestations”), while misc labels preserve operational nuance inside the category. The fact-to-dimension join ensures that when `CLAS-0001` references a direction key, reporting layers can roll up to category for executive dashboards and drill down to label for incident response.

Taken together, these primitives implement a layered evidence model suitable for compliance handbooks and operational guides. Schema-revision chains show how contemporary structures—`network_flow_record`, `product_inventory_catalog`, `clinical_trial_protocol`—inherit obligations from legacy artifacts like `legacy_compliance_log` and `legacy_network_record`, making migration audits traceable rather than narrative. Measurement–unit bindings with explicit roles prevent silent unit drift that would invalidate scientific or safety thresholds. Classifiers anchored by identifier, version, size, and T/C direction supply measurable controls over data in motion and at rest. The architecture’s practical value is that each concept answers a distinct audit question: what thing (identifier), what relationship (subject/target), who is accountable (role), how it is grouped and described (category/misc), how it changes (version), how much is affected (size bytes), and under what directional policy it operates (t_c direction)—woven into a single coherent governance fabric rather than a flat inventory of fields.

**t_schema_revision_of__schema_revision_of**

| id | schema_id | schema_revision_of_id | role |
| --- | --- | --- | --- |
| REVI-0001 | REVI-0001 | REVI-0006 | reviewer |
| REVI-0002 | REVI-0001 | REVI-0001 | contributor |
| REVI-0003 | REVI-0001 | REVI-0003 | reviewer |
| REVI-0004 | REVI-0007 | REVI-0003 | owner |
| REVI-0005 | REVI-0006 | REVI-0001 | contributor |
| REVI-0006 | REVI-0005 | REVI-0001 | observer |
| REVI-0007 | REVI-0006 | REVI-0004 | owner |
| REVI-0008 | REVI-0007 | REVI-0004 | reviewer |

**fact_classifier**

| id | t_c_direction_key | size_bytes | version |
| --- | --- | --- | --- |
| CLAS-0001 | CLAS-0001 | 643947353 | 2 |
| CLAS-0002 | CLAS-0004 | 883422563 | 1 |
| CLAS-0003 | CLAS-0001 | 772730446 | 1 |
| CLAS-0004 | CLAS-0006 | 623892633 | 9 |
| CLAS-0005 | CLAS-0002 | 61512113 | 4 |
| CLAS-0006 | CLAS-0007 | 798328963 | 5 |
| CLAS-0007 | CLAS-0002 | 968248258 | 9 |

**dim_t_c_direction**

| id | t_c_direction_label | t_c_direction_category |
| --- | --- | --- |
| CLAS-0001 | T C Direction Label 01 | T C Direction Category 01 |
| CLAS-0002 | T C Direction Label 02 | T C Direction Category 02 |
| CLAS-0003 | T C Direction Label 03 | T C Direction Category 03 |
| CLAS-0004 | T C Direction Label 04 | T C Direction Category 04 |
| CLAS-0005 | T C Direction Label 05 | T C Direction Category 05 |
| CLAS-0006 | T C Direction Label 06 | T C Direction Category 06 |
| CLAS-0007 | T C Direction Label 07 | T C Direction Category 07 |

**t_measurement_with_unit__unit**

| id | measurement_id | unit_id | role |
| --- | --- | --- | --- |
| UNIT-0001 | UNIT-0004 | UNIT-0001 | owner |
| UNIT-0002 | UNIT-0002 | UNIT-0002 | reviewer |
| UNIT-0003 | UNIT-0008 | UNIT-0005 | observer |
| UNIT-0004 | UNIT-0005 | UNIT-0006 | reviewer |
| UNIT-0005 | UNIT-0007 | UNIT-0003 | contributor |
| UNIT-0006 | UNIT-0003 | UNIT-0002 | contributor |
| UNIT-0007 | UNIT-0005 | UNIT-0006 | contributor |
| UNIT-0008 | UNIT-0006 | UNIT-0004 | contributor |