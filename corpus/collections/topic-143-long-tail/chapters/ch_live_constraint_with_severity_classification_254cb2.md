---
chapter_id: ch_live_constraint_with_severity_classification_254cb2
topic_id: 143
family: 03_directive_governance
cited_terms: ['constraint_with_severity_classification', 'ebpfprogram_equiv_typed_with_hook', 'belief_interval_equiv_bel_and_pl']
model: engine-refine
---

In kernel observability and enforcement architectures, eBPF programs constitute deployable policy artifacts whose operational meaning depends on stable identifiers, typed attachment points, and versioned binaries whose footprint is measurable in bytes. Each program instance is keyed by a surrogate identifier such as HOOK-0001 through HOOK-0004 and carries a program type reference that resolves through a dimensional taxonomy into human-readable labels and categories—Program Type Label 01 under Program Type Category 01, for example—so that auditors can reason about capability class without inspecting raw bytecode. The attaches-to-hook dimension performs the same stabilizing function for kernel integration: a program keyed HOOK-0003 may declare attachment to HOOK-0001 while another binds twice to HOOK-0006, and those hook keys in turn map to Attaches To Hook Label 03 within Attaches To Hook Category 03, preserving a separation between the canonical hook identity used in facts and the categorical vocabulary used in governance reporting. Size in bytes and version number complete the operational profile: binaries ranging from roughly 113 million to 784 million bytes, at versions 9 through 12, establish whether a deployed artifact matches an approved release baseline and whether its memory and verification cost remain within organizational tolerance.

**fact_ebpfprogram**

| id | program_type_key | attaches_to_hook_key | size_bytes | version |
| --- | --- | --- | --- | --- |
| HOOK-0001 | HOOK-0007 | HOOK-0006 | 784335640 | 12 |
| HOOK-0002 | HOOK-0006 | HOOK-0006 | 641704069 | 9 |
| HOOK-0003 | HOOK-0005 | HOOK-0001 | 113209263 | 11 |
| HOOK-0004 | HOOK-0001 | HOOK-0002 | 161013093 | 12 |
| HOOK-0005 | HOOK-0003 | HOOK-0002 | 352203820 | 12 |
| HOOK-0006 | HOOK-0007 | HOOK-0006 | 167519051 | 1 |

Identifiers anchor every downstream relationship in the framework. Constraint classifications keyed CLAS-0001 through CLAS-0004 name enforceable obligations—Access control policy, PII encryption mandate, Sensor calibration interval, Log retention period—and each classification record points to a severity belief interval (BEL-0001, BEL-0007, BEL-0003, BEL-0002) while carrying a priority integer that governs adjudication order when multiple constraints compete. Priority 5 on the PII encryption mandate outranks the priority-3 entries attached to access control, calibration, and retention rules, ensuring that confidentiality obligations surface before operational convenience in automated triage. Language codes—es for Spanish-language constraint text on access control and calibration, en for the encryption mandate, fr for log retention—signal which localized policy corpus applies at review time, so that the same identifier-backed rule can be presented to regional compliance officers without ambiguity about jurisdictional wording.

**t_constraint_with_severity_classification**

| id | constraint | severity | priority | language |
| --- | --- | --- | --- | --- |
| CLAS-0001 | Access control policy | BEL-0001 | 3 | es |
| CLAS-0002 | PII encryption mandate | BEL-0007 | 5 | en |
| CLAS-0003 | Sensor calibration interval | BEL-0003 | 3 | es |
| CLAS-0004 | Log retention period | BEL-0002 | 3 | fr |
| CLAS-0005 | Lab containment level | BEL-0002 | 3 | ja |
| CLAS-0006 | Lab containment level | BEL-0008 | 2 | fr |

**t_belief_interval_equiv_bel_and_pl**

| id | belief | belief_lower_bound | plausibility_upper_bound |
| --- | --- | --- | --- |
| BEL-0001 | signal_attenuation | CLAS-0005 | ground_truth_marker |
| BEL-0002 | thermal_runaway | CLAS-0004 | non_contradictory_set |
| BEL-0003 | latency_spike | CLAS-0002 | direct_observation_7 |
| BEL-0004 | sensor_drift | CLAS-0001 | secondary_sensor_read |
| BEL-0005 | thermal_runaway | CLAS-0001 | ground_truth_marker |
| BEL-0006 | calibration_failure | CLAS-0001 | extended_telemetry |
| BEL-0007 | data_corruption | CLAS-0006 | secondary_sensor_read |
| BEL-0008 | packet_loss | CLAS-0006 | tentative_marker |

Belief intervals supply the evidential substrate on which severity classifications rest. Each belief entity, identified BEL-0001 through BEL-0004, names a concrete failure or anomaly hypothesis—signal_attenuation, thermal_runaway, latency_spike, sensor_drift—and binds that hypothesis to a lower-bound classification reference and an upper-bound plausibility marker such as ground_truth_marker or direct_observation_7. The entity identifier therefore denotes not merely a row in a catalog but a governed evidentiary object whose truth claims are decomposed into typed attributes. Attribute names (confidence, dimension_kind, method, recorded_at) are declared once with machine-checkable types—xsd:decimal for numeric confidence, xsd:string for categorical descriptors, xsd:dateTime for temporal provenance—so that validators reject structurally invalid submissions before they enter the compliance record.

**t_belief_interval_equiv_bel_and_pl_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| BEL-0001 | confidence | xsd:decimal |
| BEL-0002 | dimension_kind | xsd:string |
| BEL-0003 | method | xsd:string |
| BEL-0004 | recorded_at | xsd:dateTime |
| BEL-0005 | uncertainty | xsd:decimal |
| BEL-0006 | unit | xsd:string |
| BEL-0007 | value | xsd:decimal |
| BEL-0008 | encoding | xsd:string |

Attribute values are stored per entity and per attribute through the entity–attr pairing, with the misc field holding the literal payload appropriate to each attr_type. Decimal-valued confidence scores such as 0.034 and 0.503 attach to BEL-0001 and BEL-0002 under the confidence attribute; varchar misc values carry dimension_kind encodings (Dimension Kind 01, Encoding 02), intake-form provenance, and even locale markers such as es; datetime misc values stamp recorded_at with ISO-8601 instants spanning 2023-03-22 through 2025-01-05, establishing evidentiary freshness across the belief set. Category and misc thus operate at different semantic layers: category groups dimension members for rollup reporting (Program Type Category 02, Attaches To Hook Category 04), whereas misc captures instance-specific facts that cannot be normalized without loss of audit detail.

In practice, curators and platform engineers traverse these fields as a closed loop. A fact record for an eBPF program combines identifier, program type, attaches-to-hook key, size_bytes, and version; dimensional lookups translate type and hook keys into category-qualified labels suitable for policy dashboards; constraint classifications link obligations to belief-interval severities ranked by priority and presented in the correct language; and belief entities expose attr-typed evidence whose entity-bound misc values substantiate why a given severity was assigned. When HOOK-0001 at version 12 attaches to HOOK-0006 under program type HOOK-0007, reviewers cross-check the binary size against approved thresholds, confirm the hook category aligns with the intended enforcement surface, and trace any triggered CLAS record back through its BEL severity to decimal confidence, varchar method metadata, and datetime recorded_at—demonstrating that governance metadata, kernel placement, and quantified belief are not parallel vocabularies but mutually reinforcing coordinates within a single compliance architecture.

**dim_program_type**

| id | program_type_label | program_type_category |
| --- | --- | --- |
| HOOK-0001 | Program Type Label 01 | Program Type Category 01 |
| HOOK-0002 | Program Type Label 02 | Program Type Category 02 |
| HOOK-0003 | Program Type Label 03 | Program Type Category 03 |
| HOOK-0004 | Program Type Label 04 | Program Type Category 04 |
| HOOK-0005 | Program Type Label 05 | Program Type Category 05 |
| HOOK-0006 | Program Type Label 06 | Program Type Category 06 |
| HOOK-0007 | Program Type Label 07 | Program Type Category 07 |
| HOOK-0008 | Program Type Label 08 | Program Type Category 08 |

**dim_attaches_to_hook**

| id | attaches_to_hook_label | attaches_to_hook_category |
| --- | --- | --- |
| HOOK-0001 | Attaches To Hook Label 01 | Attaches To Hook Category 01 |
| HOOK-0002 | Attaches To Hook Label 02 | Attaches To Hook Category 02 |
| HOOK-0003 | Attaches To Hook Label 03 | Attaches To Hook Category 03 |
| HOOK-0004 | Attaches To Hook Label 04 | Attaches To Hook Category 04 |
| HOOK-0005 | Attaches To Hook Label 05 | Attaches To Hook Category 05 |
| HOOK-0006 | Attaches To Hook Label 06 | Attaches To Hook Category 06 |

**t_belief_interval_equiv_bel_and_pl_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| BEL-0001 | BEL-0001 | BEL-0004 | 2025-01-05T17:59:26 |
| BEL-0002 | BEL-0002 | BEL-0004 | 2024-10-14T22:53:55 |
| BEL-0003 | BEL-0003 | BEL-0004 | 2023-07-18T12:12:54 |
| BEL-0004 | BEL-0004 | BEL-0004 | 2023-03-22T01:52:23 |
| BEL-0005 | BEL-0005 | BEL-0004 | 2025-03-12T03:35:20 |
| BEL-0006 | BEL-0006 | BEL-0004 | 2025-06-14T01:50:46 |
| BEL-0007 | BEL-0007 | BEL-0004 | 2023-03-18T15:47:07 |
| BEL-0008 | BEL-0008 | BEL-0004 | 2023-02-26T17:53:54 |

**t_belief_interval_equiv_bel_and_pl_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| BEL-0001 | BEL-0001 | BEL-0001 | 0.034 |
| BEL-0002 | BEL-0001 | BEL-0005 | 388.43 |
| BEL-0003 | BEL-0001 | BEL-0007 | 756.27 |
| BEL-0004 | BEL-0002 | BEL-0001 | 0.503 |
| BEL-0005 | BEL-0002 | BEL-0005 | 930.65 |
| BEL-0006 | BEL-0002 | BEL-0007 | 513.67 |
| BEL-0007 | BEL-0003 | BEL-0001 | 0.478 |
| BEL-0008 | BEL-0003 | BEL-0005 | 619.21 |

**t_belief_interval_equiv_bel_and_pl_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| BEL-0001 | BEL-0001 | BEL-0002 | Dimension Kind 01 |
| BEL-0002 | BEL-0001 | BEL-0008 | Encoding 02 |
| BEL-0003 | BEL-0001 | BEL-0009 | intake form |
| BEL-0004 | BEL-0001 | BEL-0010 | es |
| BEL-0005 | BEL-0001 | BEL-0003 | hybrid |
| BEL-0006 | BEL-0001 | BEL-0006 | deg_C |
| BEL-0007 | BEL-0002 | BEL-0002 | Dimension Kind 07 |
| BEL-0008 | BEL-0002 | BEL-0008 | Encoding 08 |