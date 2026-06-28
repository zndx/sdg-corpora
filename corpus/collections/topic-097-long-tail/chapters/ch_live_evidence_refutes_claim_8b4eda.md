---
chapter_id: ch_live_evidence_refutes_claim_8b4eda
topic_id: 97
family: 06_belief_structure
cited_terms: ['evidence_refutes_claim', 'functional_dependency_lhs', 'requirement_applies_to_system']
model: engine-refine
---

Requirements in operational systems are not monolithic assertions but structured propositions, each carrying a suite of attributes that govern applicability, timing, and enforcement posture. A requirement such as *latency under 50ms* or *audit logging enabled* is not merely a statement of obligation; it is an entity to which metadata is affixed through a typed attribute system. The attribute catalogue—encompassing properties like `effective_date`, `enforcement`, `mandatory`, and `priority`—is itself schema-constrained: dates resolve to `xsd:date` types, booleans to `xsd:boolean`, integers to `xsd:integer`, and free-form descriptors to `xsd:string`. This type discipline ensures that the value assigned to an attribute—whether the boolean `true` indicating mandatory enforcement, the date `2025-05-21` marking an effective implementation window, or the integer `391` denoting a priority ranking—is semantically coherent with the attribute's declared type. The entity to which the attribute binds is itself identified by a stable reference such as `SYST-0001`, and the attribute is referenced by its own identifier, creating a tripartite relationship among entity, attribute, and value that is materialized across type-specific value tables. This normalization by data type is not an artifact of implementation convenience; it is a governance mechanism that prevents type confusion at the point of compliance evaluation, ensuring that a boolean enforcement flag cannot be conflated with a date-based applicability constraint.

**t_requirement_applies_to_system**

| id | requirement |
| --- | --- |
| SYST-0001 | latency under 50ms |
| SYST-0002 | audit logging enabled |
| SYST-0003 | encryption at rest |
| SYST-0004 | backup frequency daily |
| SYST-0005 | network segmentation mandatory |
| SYST-0006 | network segmentation mandatory |

**t_requirement_applies_to_system_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| SYST-0001 | effective_date | xsd:date |
| SYST-0002 | enforcement | xsd:string |
| SYST-0003 | mandatory | xsd:boolean |
| SYST-0004 | priority | xsd:integer |
| SYST-0005 | review_cycle_days | xsd:integer |
| SYST-0006 | scope | xsd:string |
| SYST-0007 | encoding | xsd:string |
| SYST-0008 | label_text | xsd:string |

**t_requirement_applies_to_system_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SYST-0001 | SYST-0001 | SYST-0003 | false |
| SYST-0002 | SYST-0002 | SYST-0003 | true |
| SYST-0003 | SYST-0003 | SYST-0003 | true |
| SYST-0004 | SYST-0004 | SYST-0003 | false |
| SYST-0005 | SYST-0005 | SYST-0003 | true |
| SYST-0006 | SYST-0006 | SYST-0003 | false |

**t_requirement_applies_to_system_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SYST-0001 | SYST-0001 | SYST-0001 | 2025-05-21 |
| SYST-0002 | SYST-0002 | SYST-0001 | 2024-02-21 |
| SYST-0003 | SYST-0003 | SYST-0001 | 2023-05-13 |
| SYST-0004 | SYST-0004 | SYST-0001 | 2023-08-26 |
| SYST-0005 | SYST-0005 | SYST-0001 | 2025-01-01 |
| SYST-0006 | SYST-0006 | SYST-0001 | 2023-04-22 |

**t_requirement_applies_to_system_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SYST-0001 | SYST-0001 | SYST-0004 | 1 |
| SYST-0002 | SYST-0001 | SYST-0005 | 391 |
| SYST-0003 | SYST-0002 | SYST-0004 | 5 |
| SYST-0004 | SYST-0002 | SYST-0005 | 295 |
| SYST-0005 | SYST-0003 | SYST-0004 | 2 |
| SYST-0006 | SYST-0003 | SYST-0005 | 418 |
| SYST-0007 | SYST-0004 | SYST-0004 | 4 |
| SYST-0008 | SYST-0004 | SYST-0005 | 590 |

**t_requirement_applies_to_system_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SYST-0001 | SYST-0001 | SYST-0007 | Encoding 01 |
| SYST-0002 | SYST-0001 | SYST-0002 | Enforcement 02 |
| SYST-0003 | SYST-0001 | SYST-0008 | audit excerpt |
| SYST-0004 | SYST-0001 | SYST-0009 | fr |
| SYST-0005 | SYST-0001 | SYST-0006 | Scope 05 |
| SYST-0006 | SYST-0002 | SYST-0007 | Encoding 06 |
| SYST-0007 | SYST-0002 | SYST-0002 | Enforcement 07 |
| SYST-0008 | SYST-0002 | SYST-0008 | intake form |

The left-hand side of functional assertions—those measurable or observable quantities that serve as the subject of compliance checks—follows a parallel structuring. Each left-hand side is identified by a stable key such as `LHS-0001` and classified within a categorical taxonomy, with labels like *F D Left Hand Side Label 01* and categories such as *F D Left Hand Side Category 01* providing the semantic scaffolding for downstream analysis. The functional fact associated with a left-hand side carries not only a measured value—`163.64`, `234.79`, `896.76`—but also two critical epistemic dimensions: confidence and uncertainty. Confidence values range from `0.117` to `0.950`, reflecting the degree of assurance in the measurement, while uncertainty is quantified in absolute terms, with values spanning from `187.13` to `994.01`. These are not decorative statistics; they are the quantitative expression of measurement fidelity, and they determine whether a given left-hand side value can be meaningfully compared against a requirement threshold. A confidence of `0.950` paired with an uncertainty of `187.13` conveys a materially different compliance posture than a confidence of `0.117` with uncertainty of `994.01`, even if the raw values are comparable. The system does not collapse these dimensions into a single score; it preserves them as first-class properties, enabling auditors and automated evaluators to reason about the reliability of the evidence before drawing conclusions about compliance.

**dim_f_d_left_hand_side**

| id | f_d_left_hand_side_label | f_d_left_hand_side_category |
| --- | --- | --- |
| LHS-0001 | F D Left Hand Side Label 01 | F D Left Hand Side Category 01 |
| LHS-0002 | F D Left Hand Side Label 02 | F D Left Hand Side Category 02 |
| LHS-0003 | F D Left Hand Side Label 03 | F D Left Hand Side Category 03 |
| LHS-0004 | F D Left Hand Side Label 04 | F D Left Hand Side Category 04 |
| LHS-0005 | F D Left Hand Side Label 05 | F D Left Hand Side Category 05 |
| LHS-0006 | F D Left Hand Side Label 06 | F D Left Hand Side Category 06 |

Evidence, in this framework, is the bridge between abstract requirements and observable facts. The evidence repository records how a claim is refuted or supported, linking an evidence item—*Benchmark result v2.1*, *Audit report FY2023*, *Sensor drift calibration*, *Data lineage snapshot*—to the specific claim it addresses, identified by references such as `SYST-0004` or `SYST-0002`. The method by which the evidence was collected or generated is itself recorded: `manual` review, `hybrid` assessment, or `automated` instrumentation. This methodological provenance is critical because it determines the evidentiary weight that can be assigned in compliance decisions. The label text associated with each evidence item—*calibration record*, *audit excerpt*, *intake form*, *pre-release note*—provides a human-readable pointer to the underlying artifact, while the evidence identifier, such as `CLAI-0001`, serves as the machine-resolvable key. The relationship between evidence and claim is directional: evidence refutes claims, establishing a negative assertion that can be queried, aggregated, and traced. This is not a simple log of findings; it is a structured argumentation graph where each node carries provenance, method, and semantic label.

**t_evidence_refutes_claim**

| id | evidence | refutes_claim | method | label_text |
| --- | --- | --- | --- | --- |
| CLAI-0001 | Benchmark result v2.1 | SYST-0004 | manual | calibration record |
| CLAI-0002 | Audit report FY2023 | SYST-0004 | hybrid | audit excerpt |
| CLAI-0003 | Sensor drift calibration | SYST-0002 | automated | intake form |
| CLAI-0004 | Data lineage snapshot | SYST-0006 | hybrid | pre-release note |
| CLAI-0005 | Audit report FY2023 | SYST-0005 | hybrid | calibration record |
| CLAI-0006 | Compliance checklist 7.4 | SYST-0003 | automated | change rationale |
| CLAI-0007 | Incident summary Aug | SYST-0006 | inferred | intake form |

The interplay between these components—attributes, entities, left-hand sides, confidence, uncertainty, evidence, and method—forms a coherent governance architecture. A requirement entity such as `SYST-0004`, carrying the obligation *backup frequency daily*, is bound to attributes that define its enforcement posture and priority. A functional fact with identifier `LHS-0001` measures a quantity with high confidence (`0.950`) and low uncertainty (`187.13`), and this measurement can be evaluated against the requirement. If the measurement fails to satisfy the requirement, evidence such as `CLAI-0001`—a *Benchmark result v2.1* collected via `manual` method and labeled as a *calibration record*—documents the refutation. The system does not require a single monolithic table to capture this complexity; instead, it distributes the information across normalized structures that enforce type safety, preserve provenance, and maintain the distinction between the claim, the evidence, the measurement, and the attribute metadata. This distribution is not a weakness of the design; it is the mechanism by which the system achieves auditability, allowing each dimension of a compliance decision to be inspected, challenged, and traced independently.

**fact_functional**

| id | f_d_left_hand_side_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| LHS-0001 | LHS-0006 | 0.516 | 249.67 | 163.64 |
| LHS-0002 | LHS-0002 | 0.130 | 197.20 | 234.79 |
| LHS-0003 | LHS-0006 | 0.117 | 994.01 | 139.46 |
| LHS-0004 | LHS-0001 | 0.950 | 187.13 | 896.76 |
| LHS-0005 | LHS-0003 | 0.902 | 938.45 | 27.14 |
| LHS-0006 | LHS-0002 | 0.388 | 256.27 | 476.93 |
| LHS-0007 | LHS-0001 | 0.665 | 479.74 | 169.53 |