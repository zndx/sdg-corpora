---
chapter_id: ch_live_claim_governed_by_directive_725475
topic_id: 83
family: 06_belief_structure
cited_terms: ['claim_governed_by_directive', 'belief_interval_equiv_bel_and_pl', 'dempster_conflict_mass']
model: engine-refine
---

Governance claims—statements such as "Latency within bounds," "Sensor calibration valid," or "data_corruption"—are anchored to stable identifiers like DIRE-0001 through DIRE-0004, each of which carries a structured set of attributes that describe not only the claim itself but the conditions under which it was assessed. These attributes, named for instance confidence, dimension_kind, method, and recorded_at, are typed to enforce semantic discipline: xsd:decimal for numeric measures, xsd:string for categorical or textual descriptors, and xsd:dateTime for temporal stamps. The type system ensures that a confidence value of 0.133 is never conflated with a dimension_kind of "Dimension Kind 01," nor with a recorded_at timestamp of 2025-05-26T03:20:10. This separation of concerns—between what is being asserted, how it is measured, and when the measurement occurred—forms the backbone of auditable claim management.

**t_claim_governed_by_directive_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| DIRE-0001 | confidence | xsd:decimal |
| DIRE-0002 | dimension_kind | xsd:string |
| DIRE-0003 | method | xsd:string |
| DIRE-0004 | recorded_at | xsd:dateTime |
| DIRE-0005 | uncertainty | xsd:decimal |
| DIRE-0006 | unit | xsd:string |
| DIRE-0007 | value | xsd:decimal |
| DIRE-0008 | encoding | xsd:string |

The attribute values are stored in type-specific tables, each keyed by an identifier and linked to an entity through an entity_id column. A single entity, such as DIRE-0001, may carry a decimal confidence of 0.133 alongside a string encoding of "Encoding 02," a textual note of "audit excerpt," and a datetime stamp of 2025-05-26T03:20:10, all referencing the same underlying claim. The entity_id serves as the join point across these value tables, allowing a complete attribute profile to be reconstructed by matching entity_id and attr_id pairs. This denormalized storage pattern—splitting values by type rather than by attribute name—optimizes for query performance on typed predicates while preserving the ability to trace every value back to its originating entity.

**t_claim_governed_by_directive_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DIRE-0001 | DIRE-0001 | DIRE-0004 | 2025-05-26T03:20:10 |
| DIRE-0002 | DIRE-0002 | DIRE-0004 | 2024-09-09T11:00:31 |
| DIRE-0003 | DIRE-0003 | DIRE-0004 | 2023-10-05T17:19:44 |
| DIRE-0004 | DIRE-0004 | DIRE-0004 | 2023-08-28T07:17:18 |
| DIRE-0005 | DIRE-0005 | DIRE-0004 | 2023-09-24T23:34:03 |
| DIRE-0006 | DIRE-0006 | DIRE-0004 | 2025-02-15T08:57:16 |
| DIRE-0007 | DIRE-0007 | DIRE-0004 | 2025-03-19T03:02:46 |
| DIRE-0008 | DIRE-0008 | DIRE-0004 | 2023-07-28T10:43:49 |

**t_claim_governed_by_directive_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DIRE-0001 | DIRE-0001 | DIRE-0001 | 0.133 |
| DIRE-0002 | DIRE-0001 | DIRE-0005 | 628.22 |
| DIRE-0003 | DIRE-0001 | DIRE-0007 | 405.89 |
| DIRE-0004 | DIRE-0002 | DIRE-0001 | 0.222 |
| DIRE-0005 | DIRE-0002 | DIRE-0005 | 369.68 |
| DIRE-0006 | DIRE-0002 | DIRE-0007 | 150.76 |
| DIRE-0007 | DIRE-0003 | DIRE-0001 | 0.686 |
| DIRE-0008 | DIRE-0003 | DIRE-0005 | 548.91 |

**t_claim_governed_by_directive_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DIRE-0001 | DIRE-0001 | DIRE-0002 | Dimension Kind 01 |
| DIRE-0002 | DIRE-0001 | DIRE-0008 | Encoding 02 |
| DIRE-0003 | DIRE-0001 | DIRE-0009 | audit excerpt |
| DIRE-0004 | DIRE-0001 | DIRE-0010 | en |
| DIRE-0005 | DIRE-0001 | DIRE-0003 | manual |
| DIRE-0006 | DIRE-0001 | DIRE-0006 | mg/L |
| DIRE-0007 | DIRE-0002 | DIRE-0002 | Dimension Kind 07 |
| DIRE-0008 | DIRE-0002 | DIRE-0008 | Encoding 08 |

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

Beyond the attribute layer, the system models belief intervals through an equivalence structure that pairs a belief statement with its lower and upper bounds. A belief such as "Access policy enforced" is associated with a lower bound of "extended_telemetry" and an upper bound of "ground_truth_marker," establishing a range within which the claim's validity is considered plausible. The same structure applies to operational claims: "Latency within bounds" maps to a lower bound of "non_contradictory_set" and an upper bound of "non_contradictory_set," while "latency_spike" pairs "potential_scenario_4" with "direct_observation_7." These bounds are not arbitrary; they represent the extremal conditions under which the belief remains defensible, and the attributes attached to each belief interval—confidence, dimension_kind, method, recorded_at—mirror the structure used for directive-governed claims, ensuring consistency across the evidence model.

**t_claim_governed_by_directive**

| id | claim |
| --- | --- |
| DIRE-0001 | Latency within bounds |
| DIRE-0002 | latency_spike |
| DIRE-0003 | Sensor calibration valid |
| DIRE-0004 | data_corruption |
| DIRE-0005 | network_partition |
| DIRE-0006 | packet_loss |
| DIRE-0007 | Certificate chain valid |
| DIRE-0008 | Data lineage verified |

**t_belief_interval_equiv_bel_and_pl**

| id | belief | belief_lower_bound | plausibility_upper_bound |
| --- | --- | --- | --- |
| BEL-0001 | Access policy enforced | extended_telemetry | ground_truth_marker |
| BEL-0002 | Latency within bounds | non_contradictory_set | non_contradictory_set |
| BEL-0003 | latency_spike | potential_scenario_4 | direct_observation_7 |
| BEL-0004 | Sensor calibration valid | indirect_indicator_beta | secondary_sensor_read |
| BEL-0005 | Emission limits met | candidate_hypothesis | ground_truth_marker |
| BEL-0006 | sensor_drift | baseline_reference | extended_telemetry |
| BEL-0007 | contamination_event | potential_scenario_4 | secondary_sensor_read |
| BEL-0008 | firmware_mismatch | primary_sensor_read | tentative_marker |

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

At the core of the evidential reasoning framework lies the concept of conflict mass, which quantifies the degree of disagreement between competing pieces of evidence. Each conflict mass entry, identified by keys such as MASS-0001 through MASS-0004, carries a label and a category that classify the nature of the conflict. The fact_dempster table records the numerical manifestation of these conflicts: a confidence of 0.728 paired with an uncertainty of 479.57 and a value of 846.10, or conversely, a confidence of 0.014 with an uncertainty of 392.06 and a value of 137.18. The conflict_mass_key column links each fact to its dimensional definition, enabling aggregation and filtering by category. This separation between the categorical definition of a conflict and its numerical instantiation allows the system to reason about evidence quality independently of the specific claims being evaluated.

**dim_conflict_mass**

| id | conflict_mass_label | conflict_mass_category |
| --- | --- | --- |
| MASS-0001 | Conflict Mass Label 01 | Conflict Mass Category 01 |
| MASS-0002 | Conflict Mass Label 02 | Conflict Mass Category 02 |
| MASS-0003 | Conflict Mass Label 03 | Conflict Mass Category 03 |
| MASS-0004 | Conflict Mass Label 04 | Conflict Mass Category 04 |
| MASS-0005 | Conflict Mass Label 05 | Conflict Mass Category 05 |
| MASS-0006 | Conflict Mass Label 06 | Conflict Mass Category 06 |

The misc column, appearing across multiple value tables, serves as a catch-all for values that do not fit the primary typed categories. It holds the actual numeric values in fact_dempster, the categorical labels in dim_conflict_mass, and the string values in varchar-based attribute tables. While the name suggests imprecision, the misc column is in fact a deliberate design choice: it allows heterogeneous data to coexist within a unified schema without requiring an unbounded number of type-specific tables. The confidence and uncertainty columns in fact_dempster, meanwhile, provide the quantitative measures that drive Dempster-Shafer combination rules, where confidence reflects the degree of support for a proposition and uncertainty captures the residual ignorance that remains after all available evidence has been accounted for.

**fact_dempster**

| id | conflict_mass_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| MASS-0001 | MASS-0003 | 0.153 | 9.49 | 520.46 |
| MASS-0002 | MASS-0002 | 0.014 | 392.06 | 137.18 |
| MASS-0003 | MASS-0005 | 0.025 | 687.80 | 197.61 |
| MASS-0004 | MASS-0001 | 0.728 | 479.57 | 846.10 |
| MASS-0005 | MASS-0006 | 0.918 | 172.36 | 296.96 |
| MASS-0006 | MASS-0001 | 0.755 | 608.06 | 341.51 |