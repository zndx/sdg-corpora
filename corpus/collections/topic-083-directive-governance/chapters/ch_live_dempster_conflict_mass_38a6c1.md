---
chapter_id: ch_live_dempster_conflict_mass_38a6c1
topic_id: 83
family: 07_long_tail
cited_terms: ['dempster_conflict_mass', 'belief_interval_only_unit_range', 'dempster_combinant_second']
model: engine-refine
---

Evidence within the system is anchored by immutable identifiers—`MASS-0001` through `MASS-0004` for conflict-mass records, `RANG-0001` through `RANG-0004` for belief-interval units, and `SECO-0001` through `SECO-0004` for Dempster combinants—each serving as a stable reference point across the relational graph. An entity denotes a concrete instance of evidence or a belief interval bound, and foreign-key relationships bind these instances together: a belief interval such as `RANG-0001` may carry a lower-bound reference to `SECO-0001`, while a Dempster combinant like `EvidenceCombinationBeta` (`SECO-0001`) in turn points to a belief-interval unit (`RANG-0005`). This interlocking structure ensures that every piece of evidence can be traced to its origin, its associated belief bounds, and the combiner that produced it, forming a complete provenance chain from raw observation to fused conclusion.

**fact_dempster**

| id | conflict_mass_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| MASS-0001 | MASS-0003 | 0.153 | 9.49 | 520.46 |
| MASS-0002 | MASS-0002 | 0.014 | 392.06 | 137.18 |
| MASS-0003 | MASS-0005 | 0.025 | 687.80 | 197.61 |
| MASS-0004 | MASS-0001 | 0.728 | 479.57 | 846.10 |
| MASS-0005 | MASS-0006 | 0.918 | 172.36 | 296.96 |
| MASS-0006 | MASS-0001 | 0.755 | 608.06 | 341.51 |

**t_belief_interval_only_unit_range**

| id | belief | belief_lower_bound |
| --- | --- | --- |
| RANG-0001 | throughput projection | SECO-0001 |
| RANG-0002 | throughput projection | SECO-0003 |
| RANG-0003 | packet loss guarantee | SECO-0001 |
| RANG-0004 | noise floor estimate | SECO-0001 |
| RANG-0005 | thermal drift assertion | SECO-0006 |
| RANG-0006 | packet loss guarantee | SECO-0006 |

**t_belief_interval_only_unit_range_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| RANG-0001 | confidence | xsd:decimal |
| RANG-0002 | dimension_kind | xsd:string |
| RANG-0003 | method | xsd:string |
| RANG-0004 | recorded_at | xsd:dateTime |
| RANG-0005 | uncertainty | xsd:decimal |
| RANG-0006 | unit | xsd:string |
| RANG-0007 | value | xsd:decimal |
| RANG-0008 | encoding | xsd:string |

**t_belief_interval_only_unit_range_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RANG-0001 | RANG-0001 | RANG-0004 | 2025-06-14T16:53:04 |
| RANG-0002 | RANG-0002 | RANG-0004 | 2023-08-16T07:36:41 |
| RANG-0003 | RANG-0003 | RANG-0004 | 2023-03-26T19:32:25 |
| RANG-0004 | RANG-0004 | RANG-0004 | 2025-03-17T08:26:16 |
| RANG-0005 | RANG-0005 | RANG-0004 | 2025-04-30T01:20:27 |
| RANG-0006 | RANG-0006 | RANG-0004 | 2023-02-14T23:11:05 |

**t_belief_interval_only_unit_range_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RANG-0001 | RANG-0001 | RANG-0001 | 0.727 |
| RANG-0002 | RANG-0001 | RANG-0005 | 281.42 |
| RANG-0003 | RANG-0001 | RANG-0007 | 343.70 |
| RANG-0004 | RANG-0002 | RANG-0001 | 0.788 |
| RANG-0005 | RANG-0002 | RANG-0005 | 676.76 |
| RANG-0006 | RANG-0002 | RANG-0007 | 95.73 |
| RANG-0007 | RANG-0003 | RANG-0001 | 0.294 |
| RANG-0008 | RANG-0003 | RANG-0005 | 403.37 |

**t_belief_interval_only_unit_range_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RANG-0001 | RANG-0001 | RANG-0002 | Dimension Kind 01 |
| RANG-0002 | RANG-0001 | RANG-0008 | Encoding 02 |
| RANG-0003 | RANG-0001 | RANG-0009 | change rationale |
| RANG-0004 | RANG-0001 | RANG-0010 | fr |
| RANG-0005 | RANG-0001 | RANG-0003 | hybrid |
| RANG-0006 | RANG-0001 | RANG-0006 | ms |
| RANG-0007 | RANG-0002 | RANG-0002 | Dimension Kind 07 |
| RANG-0008 | RANG-0002 | RANG-0008 | Encoding 08 |

**t_dempster_combinant_second**

| id | dempster | second_combinant |
| --- | --- | --- |
| SECO-0001 | EvidenceCombinationBeta | RANG-0005 |
| SECO-0002 | AnomalyFusionEngine | RANG-0001 |
| SECO-0003 | LabDataCombinerNode | RANG-0006 |
| SECO-0004 | GovernanceEvidenceModel | RANG-0004 |
| SECO-0005 | GovernanceEvidenceModel | RANG-0006 |
| SECO-0006 | GovernanceEvidenceModel | RANG-0002 |
| SECO-0007 | CrossDomainEvidenceRule | RANG-0005 |

**t_dempster_combinant_second_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| SECO-0001 | confidence | xsd:decimal |
| SECO-0002 | dimension_kind | xsd:string |
| SECO-0003 | method | xsd:string |
| SECO-0004 | recorded_at | xsd:dateTime |
| SECO-0005 | uncertainty | xsd:decimal |
| SECO-0006 | unit | xsd:string |
| SECO-0007 | value | xsd:decimal |
| SECO-0008 | encoding | xsd:string |

**t_dempster_combinant_second_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SECO-0001 | SECO-0001 | SECO-0004 | 2024-10-02T15:13:46 |
| SECO-0002 | SECO-0002 | SECO-0004 | 2024-09-30T23:04:21 |
| SECO-0003 | SECO-0003 | SECO-0004 | 2023-05-15T03:36:40 |
| SECO-0004 | SECO-0004 | SECO-0004 | 2023-03-27T03:16:31 |
| SECO-0005 | SECO-0005 | SECO-0004 | 2024-02-17T20:31:55 |
| SECO-0006 | SECO-0006 | SECO-0004 | 2025-02-25T15:10:20 |
| SECO-0007 | SECO-0007 | SECO-0004 | 2023-11-24T02:27:20 |

**t_dempster_combinant_second_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SECO-0001 | SECO-0001 | SECO-0001 | 0.328 |
| SECO-0002 | SECO-0001 | SECO-0005 | 597.98 |
| SECO-0003 | SECO-0001 | SECO-0007 | 738.09 |
| SECO-0004 | SECO-0002 | SECO-0001 | 0.558 |
| SECO-0005 | SECO-0002 | SECO-0005 | 817.82 |
| SECO-0006 | SECO-0002 | SECO-0007 | 989.70 |
| SECO-0007 | SECO-0003 | SECO-0001 | 0.241 |
| SECO-0008 | SECO-0003 | SECO-0005 | 869.27 |

**t_dempster_combinant_second_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SECO-0001 | SECO-0001 | SECO-0002 | Dimension Kind 01 |
| SECO-0002 | SECO-0001 | SECO-0008 | Encoding 02 |
| SECO-0003 | SECO-0001 | SECO-0009 | nightly summary |
| SECO-0004 | SECO-0001 | SECO-0010 | en |
| SECO-0005 | SECO-0001 | SECO-0003 | manual |
| SECO-0006 | SECO-0001 | SECO-0006 | deg_C |
| SECO-0007 | SECO-0002 | SECO-0002 | Dimension Kind 07 |
| SECO-0008 | SECO-0002 | SECO-0008 | Encoding 08 |

Attributes and their declared types provide the schema for how evidence is described. Each entity carries a set of named attributes—`confidence`, `dimension_kind`, `method`, `recorded_at`—whose semantics are governed by an `attr_type` column that enforces data integrity through XML Schema definitions: `xsd:decimal` for numeric measures, `xsd:string` for categorical or free-text labels, and `xsd:dateTime` for temporal stamps. The value of a given attribute is stored in a type-specific fact table, so that `recorded_at` values such as `2025-06-14T16:53:04` or `2023-08-16T07:36:41` coexist alongside decimal measures like `0.727` and string descriptors such as `Dimension Kind 01` or `change rationale`, all linked back to their parent entity through a shared `entity_id` and `attr_id` pair. This normalization by type avoids the pitfalls of a single heterogeneous value column while preserving a uniform access pattern.

Confidence and uncertainty constitute the dual axes along which evidence quality is assessed. Confidence, expressed as a decimal between zero and one, quantifies the degree of belief assigned to a proposition; values such as `0.728` indicate strong conviction, whereas `0.014` signals near-total skepticism. Uncertainty, measured on a broader numeric scale, captures the dispersion or ambiguity surrounding that belief—figures like `9.49` suggest a tightly constrained estimate, while `687.80` and `479.57` reflect substantial indeterminacy. In the Dempster-Shafer framework that underpins this architecture, confidence and uncertainty are not interchangeable: confidence reflects the mass assigned to a hypothesis, while uncertainty accounts for the residual mass that cannot be committed to any specific proposition. The coexistence of these two measures enables downstream reasoning engines to distinguish between evidence that is confidently low (a belief of `0.014` with uncertainty of `392.06`) and evidence that is confidently high (a belief of `0.728` with uncertainty of `479.57`), each carrying distinct implications for decision-making.

Conflict mass and its associated category classify the nature and severity of contradictions that arise when multiple sources of evidence are combined. Each conflict-mass record is identified by a key such as `MASS-0003` and linked to a descriptive label (`Conflict Mass Label 03`) and a category (`Conflict Mass Category 03`) that situates the conflict within a broader taxonomy. The `value` column—here functioning as a miscellaneous measure—stores the quantitative magnitude of the conflict, with figures like `846.10` and `520.46` representing the degree of disagreement between fused sources. When a combiner such as `AnomalyFusionEngine` (`SECO-0002`) processes evidence, the resulting conflict mass determines whether the combined belief is reliable or whether the sources are so divergent that the fusion should be flagged for review.

**dim_conflict_mass**

| id | conflict_mass_label | conflict_mass_category |
| --- | --- | --- |
| MASS-0001 | Conflict Mass Label 01 | Conflict Mass Category 01 |
| MASS-0002 | Conflict Mass Label 02 | Conflict Mass Category 02 |
| MASS-0003 | Conflict Mass Label 03 | Conflict Mass Category 03 |
| MASS-0004 | Conflict Mass Label 04 | Conflict Mass Category 04 |
| MASS-0005 | Conflict Mass Label 05 | Conflict Mass Category 05 |
| MASS-0006 | Conflict Mass Label 06 | Conflict Mass Category 06 |

The `misc` column, appearing across multiple fact tables, serves as a catch-all for heterogeneous values that do not fit the primary typed attributes. In the belief-interval tables, it holds the actual numeric or textual measure associated with an entity-attribute pair—throughput projections, packet loss guarantees, noise floor estimates—while in the Dempster tables it captures the fused result of evidence combination. This design allows the system to accommodate evolving evidence types without schema migration: a new attribute can be declared in the attribute dictionary, its type registered, and its values stored in the corresponding type-specific fact table, all without altering the core evidence model. The result is a system that is both rigorously typed and pragmatically extensible, capable of tracking evidence from its initial measurement through every stage of fusion and conflict resolution.