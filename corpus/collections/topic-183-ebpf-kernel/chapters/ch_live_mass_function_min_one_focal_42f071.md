---
chapter_id: ch_live_mass_function_min_one_focal_42f071
topic_id: 183
family: 06_belief_structure
cited_terms: ['mass_function_min_one_focal', 'control_implements', 'synthetic_apriori_judgment']
model: engine-refine
---

In systems that model evidence-based reasoning, every assertion must be traceable to a concrete identifier and anchored within a structured attribute schema. Each focal element—such as `FOCA-0001` through `FOCA-0004`—carries a mass assignment that quantifies its evidential weight, with values like `audit_trail_eta`, `provenance_record_epsilon`, and `sensor_array_gamma` reflecting the nature of the underlying evidence. These focal elements are further characterized by typed attributes: a `confidence` measure stored as an `xsd:decimal`, a `dimension_kind` as `xsd:string`, a `method` designation as `xsd:string`, and a `recorded_at` timestamp as `xsd:dateTime`. The attribute-value pairs are materialized across dedicated value tables, ensuring type safety and query efficiency. For instance, the decimal attribute `FOCA-0001` holds values such as `0.223` and `0.161`, while the string attribute `FOCA-0002` carries `Dimension Kind 01`, and the datetime attribute `FOCA-0004` records timestamps ranging from `2023-01-26T15:54:26` to `2024-04-19T20:46:34`. This separation of attribute definitions from their typed values allows the schema to evolve independently of the data it describes.

**t_mass_function_min_one_focal**

| id | mass | focal_element |
| --- | --- | --- |
| FOCA-0001 | audit_trail_eta | IMPL-0006 |
| FOCA-0002 | audit_trail_eta | IMPL-0002 |
| FOCA-0003 | provenance_record_epsilon | IMPL-0001 |
| FOCA-0004 | sensor_array_gamma | IMPL-0007 |
| FOCA-0005 | governance_log_delta | IMPL-0002 |
| FOCA-0006 | provenance_record_epsilon | IMPL-0003 |

**t_mass_function_min_one_focal_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| FOCA-0001 | confidence | xsd:decimal |
| FOCA-0002 | dimension_kind | xsd:string |
| FOCA-0003 | method | xsd:string |
| FOCA-0004 | recorded_at | xsd:dateTime |
| FOCA-0005 | uncertainty | xsd:decimal |
| FOCA-0006 | unit | xsd:string |
| FOCA-0007 | value | xsd:decimal |
| FOCA-0008 | encoding | xsd:string |

**t_mass_function_min_one_focal_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| FOCA-0001 | FOCA-0001 | FOCA-0004 | 2023-06-19T06:37:58 |
| FOCA-0002 | FOCA-0002 | FOCA-0004 | 2023-01-26T15:54:26 |
| FOCA-0003 | FOCA-0003 | FOCA-0004 | 2024-04-19T20:46:34 |
| FOCA-0004 | FOCA-0004 | FOCA-0004 | 2023-08-08T03:21:21 |
| FOCA-0005 | FOCA-0005 | FOCA-0004 | 2023-12-10T16:04:01 |
| FOCA-0006 | FOCA-0006 | FOCA-0004 | 2024-10-11T01:06:45 |

**t_mass_function_min_one_focal_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| FOCA-0001 | FOCA-0001 | FOCA-0001 | 0.223 |
| FOCA-0002 | FOCA-0001 | FOCA-0005 | 391.04 |
| FOCA-0003 | FOCA-0001 | FOCA-0007 | 110.73 |
| FOCA-0004 | FOCA-0002 | FOCA-0001 | 0.161 |
| FOCA-0005 | FOCA-0002 | FOCA-0005 | 309.80 |
| FOCA-0006 | FOCA-0002 | FOCA-0007 | 695.08 |
| FOCA-0007 | FOCA-0003 | FOCA-0001 | 0.178 |
| FOCA-0008 | FOCA-0003 | FOCA-0005 | 14.20 |

**t_mass_function_min_one_focal_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| FOCA-0001 | FOCA-0001 | FOCA-0002 | Dimension Kind 01 |
| FOCA-0002 | FOCA-0001 | FOCA-0008 | Encoding 02 |
| FOCA-0003 | FOCA-0001 | FOCA-0009 | calibration record |
| FOCA-0004 | FOCA-0001 | FOCA-0010 | es |
| FOCA-0005 | FOCA-0001 | FOCA-0003 | hybrid |
| FOCA-0006 | FOCA-0001 | FOCA-0006 | ratio |
| FOCA-0007 | FOCA-0002 | FOCA-0002 | Dimension Kind 07 |
| FOCA-0008 | FOCA-0002 | FOCA-0008 | Encoding 08 |

Governance controls operationalize these evidential structures by mapping abstract controls to concrete implementations with defined priority and scope. The control `Change Advisory Board` implements focal element `FOCA-0006` at priority level `5` within a `regional` scope, while `Data Retention Schedule` appears twice—once implementing `FOCA-0005` at priority `3` with `global` scope, and again implementing `FOCA-0003` at the same priority but scoped to `team`. The `Access Review Cycle` control, assigned the highest priority of `1`, implements `FOCA-0003` at the `team` level. This dual-axis classification—priority as a numeric ordering from `1` (highest) to `5` (lowest), and scope as a categorical boundary of `regional`, `global`, or `team`—enables operators to reason about which controls take precedence when implementations overlap and across which organizational boundaries they apply.

**t_control_implements**

| id | control | implements | priority | scope |
| --- | --- | --- | --- | --- |
| IMPL-0001 | Change Advisory Board | FOCA-0006 | 5 | regional |
| IMPL-0002 | Data Retention Schedule | FOCA-0005 | 3 | global |
| IMPL-0003 | Access Review Cycle | FOCA-0003 | 1 | team |
| IMPL-0004 | Data Retention Schedule | FOCA-0003 | 3 | team |
| IMPL-0005 | GDPR Data Minimization | FOCA-0005 | 1 | global |
| IMPL-0006 | Incident Response Protocol | FOCA-0006 | 1 | global |
| IMPL-0007 | NIST SP 800-53 | FOCA-0005 | 2 | local |

At the epistemic layer, synthetic a priori judgments synthesize domain knowledge with empirical grounding to produce inferences that extend beyond their premises. A judgment such as `NetworkTopologyInference` relies on the intuitive foundation `FieldExperienceLog` and exhibits ampliative content through `MetadataExpansionSet`, carrying an uncertainty of `4.78` and a computed value of `520.09`. Similarly, `LatencyThresholdRule` draws on `SchemaExtensionRule` as its intuitive foundation, produces `InferenceGraphEdge` as its ampliative content, registers an uncertainty of `573.40`, and yields a value of `428.93`. The `DataQualityHeuristic` judgment, grounded in `VisualAnomalyCue` and expanding via `DataAugmentationRule`, exhibits the highest uncertainty at `661.11` with a value of `700.04`, while `CalibrationOffsetTag`—also relying on `VisualAnomalyCue` and producing `MetadataExpansionSet`—carries an uncertainty of `940.95` and a value of `207.45`. The uncertainty metric, ranging from `4.78` to `940.95` across the observed judgments, quantifies the degree of epistemic risk inherent in each inference, while the misc value column captures the derived or computed outcome of the judgment process.

**t_synthetic_apriori_judgment**

| id | synthetic_apriori_judgment | relies_on_intuition | exhibits_ampliation | uncertainty | value |
| --- | --- | --- | --- | --- | --- |
| JUDG-0001 | NetworkTopologyInference | FieldExperienceLog | MetadataExpansionSet | 4.78 | 520.09 |
| JUDG-0002 | LatencyThresholdRule | SchemaExtensionRule | InferenceGraphEdge | 573.40 | 428.93 |
| JUDG-0003 | DataQualityHeuristic | VisualAnomalyCue | DataAugmentationRule | 661.11 | 700.04 |
| JUDG-0004 | CalibrationOffsetTag | VisualAnomalyCue | MetadataExpansionSet | 940.95 | 207.45 |
| JUDG-0005 | FaultPropagationMap | ObservationExtensionTag | VisualAnomalyCue | 577.05 | 829.13 |
| JUDG-0006 | LatencyThresholdRule | timestamp_utc | timestamp_utc | 856.34 | 868.32 |
| JUDG-0007 | FaultPropagationMap | CrossDomainMapping | CrossDomainMapping | 29.46 | 167.85 |

The relationship between intuitive foundations and ampliative content reveals the generative mechanism of these judgments. Intuitive foundations—`FieldExperienceLog`, `SchemaExtensionRule`, and `VisualAnomalyCue`—represent the experiential or heuristic bedrock upon which each judgment rests. Ampliative content—`MetadataExpansionSet`, `InferenceGraphEdge`, and `DataAugmentationRule`—captures what new information the judgment produces beyond its premises. The fact that `VisualAnomalyCue` serves as the foundation for two distinct judgments (`DataQualityHeuristic` and `CalibrationOffsetTag`), each yielding different ampliative content and uncertainty profiles, demonstrates that the same intuitive basis can support multiple inferential pathways with divergent risk characteristics. This architecture enables auditors and operators to trace any synthetic a priori judgment back to its experiential roots and forward to its epistemic consequences, maintaining full transparency across the reasoning chain.