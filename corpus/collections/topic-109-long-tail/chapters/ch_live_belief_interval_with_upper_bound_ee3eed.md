---
chapter_id: ch_live_belief_interval_with_upper_bound_ee3eed
topic_id: 109
family: 06_belief_structure
cited_terms: ['belief_interval_with_upper_bound', 'pignistic_transformation', 'dempster_conflict_mass']
model: engine-refine
---

Belief intervals serve as the foundational mechanism for quantifying epistemic uncertainty in evidence fusion pipelines, delimiting the range between a lower bound of belief and an upper bound of plausibility for any given proposition. Each interval is identified by a unique key—BOUN-0001 through BOUN-0004 in the operational registry—and is associated with a concrete scenario such as "Model feature shift," "Batch ingestion failure," "Sensor calibration drift," or "Storage quota warning." The plausibility upper bound of each interval is not stored as a scalar but is instead resolved through a pignistic transformation reference, meaning the upper bound itself is derived from a transformation record such as TRAN-0002, TRAN-0008, TRAN-0005, or TRAN-0003. This indirection allows the system to maintain a clean separation between the evidential state (the belief interval) and the decision-theoretic machinery (the transformation) that converts it into actionable probabilities.

**t_belief_interval_with_upper_bound**

| id | belief | plausibility_upper_bound |
| --- | --- | --- |
| BOUN-0001 | Model feature shift | TRAN-0002 |
| BOUN-0002 | Batch ingestion failure | TRAN-0008 |
| BOUN-0003 | Sensor calibration drift | TRAN-0005 |
| BOUN-0004 | Storage quota warning | TRAN-0003 |
| BOUN-0005 | Latency SLA breach | TRAN-0001 |
| BOUN-0006 | Model feature shift | TRAN-0004 |

**t_belief_interval_with_upper_bound_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| BOUN-0001 | confidence | xsd:decimal |
| BOUN-0002 | dimension_kind | xsd:string |
| BOUN-0003 | method | xsd:string |
| BOUN-0004 | recorded_at | xsd:dateTime |
| BOUN-0005 | uncertainty | xsd:decimal |
| BOUN-0006 | unit | xsd:string |
| BOUN-0007 | value | xsd:decimal |
| BOUN-0008 | encoding | xsd:string |

**t_belief_interval_with_upper_bound_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| BOUN-0001 | BOUN-0001 | BOUN-0004 | 2024-12-10T20:43:33 |
| BOUN-0002 | BOUN-0002 | BOUN-0004 | 2024-02-10T17:59:05 |
| BOUN-0003 | BOUN-0003 | BOUN-0004 | 2024-06-16T13:27:28 |
| BOUN-0004 | BOUN-0004 | BOUN-0004 | 2025-04-06T06:40:08 |
| BOUN-0005 | BOUN-0005 | BOUN-0004 | 2025-03-13T22:14:49 |
| BOUN-0006 | BOUN-0006 | BOUN-0004 | 2024-01-19T21:51:57 |

**t_belief_interval_with_upper_bound_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| BOUN-0001 | BOUN-0001 | BOUN-0001 | 0.680 |
| BOUN-0002 | BOUN-0001 | BOUN-0005 | 473.67 |
| BOUN-0003 | BOUN-0001 | BOUN-0007 | 703.38 |
| BOUN-0004 | BOUN-0002 | BOUN-0001 | 0.590 |
| BOUN-0005 | BOUN-0002 | BOUN-0005 | 382.46 |
| BOUN-0006 | BOUN-0002 | BOUN-0007 | 678.08 |
| BOUN-0007 | BOUN-0003 | BOUN-0001 | 0.348 |
| BOUN-0008 | BOUN-0003 | BOUN-0005 | 462.48 |

**t_belief_interval_with_upper_bound_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| BOUN-0001 | BOUN-0001 | BOUN-0002 | Dimension Kind 01 |
| BOUN-0002 | BOUN-0001 | BOUN-0008 | Encoding 02 |
| BOUN-0003 | BOUN-0001 | BOUN-0009 | change rationale |
| BOUN-0004 | BOUN-0001 | BOUN-0010 | de |
| BOUN-0005 | BOUN-0001 | BOUN-0003 | automated |
| BOUN-0006 | BOUN-0001 | BOUN-0006 | m/s |
| BOUN-0007 | BOUN-0002 | BOUN-0002 | Dimension Kind 07 |
| BOUN-0008 | BOUN-0002 | BOUN-0008 | Encoding 08 |

**t_pignistic_transformation**

| id | pignistic |
| --- | --- |
| TRAN-0001 | diagnostic confidence matrix |
| TRAN-0002 | telemetry belief assignment |
| TRAN-0003 | anomaly likelihood set |
| TRAN-0004 | diagnostic confidence matrix |
| TRAN-0005 | predictive uncertainty record |
| TRAN-0006 | anomaly likelihood set |
| TRAN-0007 | anomaly likelihood set |
| TRAN-0008 | telemetry belief assignment |

**t_pignistic_transformation_pignistic_transform**

| id | pignistic_transform |
| --- | --- |
| TRAN-0001 | pignistic probability distribution |
| TRAN-0002 | transformed belief state |
| TRAN-0003 | transformed belief state |
| TRAN-0004 | betting probability set |
| TRAN-0005 | risk probability assignment |
| TRAN-0006 | decision support distribution |
| TRAN-0007 | betting probability set |
| TRAN-0008 | transformed belief state |

The attributes of belief intervals are themselves typed and versioned, ensuring that every metadata field carries an unambiguous semantic contract. The attribute registry distinguishes between confidence values of type xsd:decimal, dimension descriptors of type xsd:string, procedural method identifiers of type xsd:string, and temporal stamps of type xsd:dateTime. Concrete values populate these attributes across the interval instances: confidence scores such as 0.680 and 0.590 quantify the degree of belief assigned to specific propositions, while auxiliary measurements like 473.67 and 703.38 may represent derived quantities such as dimension magnitudes or aggregation weights. String-valued attributes carry labels including "Dimension Kind 01," "Encoding 02," "change rationale," and the two-character code "de," each anchoring the interval to a particular classification or provenance context. Temporal metadata—recorded_at values such as 2024-12-10T20:43:33, 2024-02-10T17:59:05, 2024-06-16T13:27:28, and 2025-04-06T06:40:08—provides an audit trail for when each interval was instantiated or last revised.

Pignistic transformations constitute the bridge between belief functions and decision-theoretic probability distributions, a step required whenever an agent must commit to an action under uncertainty. The transformation catalog includes entries such as "diagnostic confidence matrix," "telemetry belief assignment," and "anomaly likelihood set," each identified by a key from TRAN-0001 through TRAN-0008. Every transformation yields a pignistic transform output—described as a "pignistic probability distribution," a "transformed belief state," or a "betting probability set"—and the relationship between a transformation and its output is mediated by a role attribute that designates whether the output serves as a "reviewer" or a "contributor" in downstream fusion operations. This role-based linkage enables the system to track which transformed belief states are being consulted for validation versus which are being actively combined into a consensus estimate.

**t_pignistic_transformation__pignistic_transform**

| id | pignistic_id | pignistic_transform_id | role |
| --- | --- | --- | --- |
| TRAN-0001 | TRAN-0008 | TRAN-0005 | reviewer |
| TRAN-0002 | TRAN-0006 | TRAN-0003 | reviewer |
| TRAN-0003 | TRAN-0005 | TRAN-0006 | contributor |
| TRAN-0004 | TRAN-0005 | TRAN-0002 | reviewer |
| TRAN-0005 | TRAN-0006 | TRAN-0002 | owner |
| TRAN-0006 | TRAN-0003 | TRAN-0008 | reviewer |
| TRAN-0007 | TRAN-0007 | TRAN-0005 | observer |
| TRAN-0008 | TRAN-0008 | TRAN-0008 | reviewer |

Conflict mass quantification, grounded in Dempster's rule of combination, captures the degree of contradiction between distinct bodies of evidence and is essential for diagnosing when fusion results become unreliable. Each conflict mass record—identified by keys such as MASS-0001 through MASS-0004—carries a confidence value ranging from 0.014 to 0.728, an uncertainty magnitude spanning from 9.49 to 687.80, and a numeric value representing the combined evidence weight, such as 520.46, 137.18, 197.61, or 846.10. The conflict mass itself is referenced through a key (MASS-0001 through MASS-0005) that points into a dimension table where each mass is labeled (e.g., "Conflict Mass Label 01") and categorized (e.g., "Conflict Mass Category 01"). Low confidence values paired with high uncertainty—such as a confidence of 0.014 alongside an uncertainty of 392.06—signal severe evidence conflict, whereas higher confidence with moderate uncertainty, as seen in the record with confidence 0.728 and uncertainty 479.57, indicates a more stable fusion outcome despite the presence of some contradictory signal.

**fact_dempster**

| id | conflict_mass_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| MASS-0001 | MASS-0003 | 0.153 | 9.49 | 520.46 |
| MASS-0002 | MASS-0002 | 0.014 | 392.06 | 137.18 |
| MASS-0003 | MASS-0005 | 0.025 | 687.80 | 197.61 |
| MASS-0004 | MASS-0001 | 0.728 | 479.57 | 846.10 |
| MASS-0005 | MASS-0006 | 0.918 | 172.36 | 296.96 |
| MASS-0006 | MASS-0001 | 0.755 | 608.06 | 341.51 |

**dim_conflict_mass**

| id | conflict_mass_label | conflict_mass_category |
| --- | --- | --- |
| MASS-0001 | Conflict Mass Label 01 | Conflict Mass Category 01 |
| MASS-0002 | Conflict Mass Label 02 | Conflict Mass Category 02 |
| MASS-0003 | Conflict Mass Label 03 | Conflict Mass Category 03 |
| MASS-0004 | Conflict Mass Label 04 | Conflict Mass Category 04 |
| MASS-0005 | Conflict Mass Label 05 | Conflict Mass Category 05 |
| MASS-0006 | Conflict Mass Label 06 | Conflict Mass Category 06 |