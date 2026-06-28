---
chapter_id: ch_live_reference_subclass_bbcb02
topic_id: 7
family: 01_foundation
cited_terms: ['reference_subclass', 'belief_interval_equiv_bel_and_pl', 'column_lineage_for_table_column']
model: engine-refine
---

The governance of evidentiary assertions rests upon a structured taxonomy of identifiers, namespaces, and temporal markers that anchor every proposition to its origin. Each reference carries a unique identifier—REFE-0001 through REFE-0004—paired with a human-readable label such as Reference 01 or Reference 02, and is issued on a specific date, ranging from 2023-09-26 to 2025-05-30. These references are classified within a namespace—provenance, lineage, or governance—that determines the regulatory context under which the assertion operates. A reference does not exist in isolation; it points to a belief entity, as when REFE-0001 is linked to BEL-0002 or REFE-0004 to BEL-0005, thereby establishing a traceable chain from the cited source to the claim it supports. This linkage is the foundational mechanism by which audit trails are constructed and by which any assertion can be traced back to its originating document or observation.

**t_reference_subclass**

| id | reference | points_to | issued_date | namespace |
| --- | --- | --- | --- | --- |
| REFE-0001 | Reference 01 | BEL-0002 | 2024-02-21 | provenance |
| REFE-0002 | Reference 02 | BEL-0005 | 2024-12-07 | lineage |
| REFE-0003 | Reference 03 | BEL-0006 | 2025-05-30 | governance |
| REFE-0004 | Reference 04 | BEL-0001 | 2023-09-26 | lineage |
| REFE-0005 | Reference 05 | BEL-0006 | 2024-10-25 | provenance |
| REFE-0006 | Reference 06 | BEL-0007 | 2023-04-21 | catalog |

**t_belief_interval_equiv_bel_and_pl**

| id | belief | belief_lower_bound | plausibility_upper_bound |
| --- | --- | --- | --- |
| BEL-0001 | signal_attenuation | REFE-0005 | ground_truth_marker |
| BEL-0002 | thermal_runaway | REFE-0004 | non_contradictory_set |
| BEL-0003 | latency_spike | REFE-0002 | direct_observation_7 |
| BEL-0004 | sensor_drift | REFE-0001 | secondary_sensor_read |
| BEL-0005 | thermal_runaway | REFE-0001 | ground_truth_marker |
| BEL-0006 | calibration_failure | REFE-0001 | extended_telemetry |
| BEL-0007 | data_corruption | REFE-0006 | secondary_sensor_read |
| BEL-0008 | packet_loss | REFE-0006 | tentative_marker |

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

Belief entities themselves are parameterized through attributes and their associated types, forming a schema that distinguishes between quantifiable measures and categorical descriptors. An attribute such as confidence is typed as xsd:decimal, permitting precise numerical evaluation, while dimension_kind and method are typed as xsd:string, accommodating textual classification, and recorded_at is typed as xsd:dateTime, anchoring the observation to a specific moment—2025-01-05T17:59:26, for instance. The belief entity BEL-0001, associated with the phenomenon signal_attenuation, carries a confidence value of 0.034 and a plausibility upper bound grounded in a ground_truth_marker, whereas BEL-0002, representing thermal_runaway, holds a confidence of 0.503 and is bounded by a non_contradictory_set. These attribute-value pairs are stored in type-specific tables—decimal values such as 388.43 and 756.27, string values such as Dimension Kind 01 and intake form, and datetime values—ensuring that each property is validated against its declared type before acceptance into the knowledge base.

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

The confidence and uncertainty dimensions provide the quantitative backbone for assessing the reliability of each assertion. In the fact_column structure, a column identified as COLU-0002 is assigned a confidence of 0.354 and an uncertainty of 404.01, with an associated value of 131.25, while COLU-0001 carries a confidence of 0.164 and a substantially higher uncertainty of 560.21. These metrics are not arbitrary; they reflect the degree of epistemic certainty attached to each measurement and the magnitude of variance that must be accounted for in downstream analysis. A confidence of 0.068 on COLU-0004, paired with an uncertainty of 744.10, signals a proposition that is weakly supported and highly volatile, demanding caution in any compliance or operational decision derived from it.

**fact_column**

| id | column_2_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| COLU-0001 | COLU-0003 | 0.164 | 560.21 | 257.80 |
| COLU-0002 | COLU-0004 | 0.068 | 744.10 | 571.55 |
| COLU-0003 | COLU-0006 | 0.107 | 984.09 | 140.18 |
| COLU-0004 | COLU-0002 | 0.354 | 404.01 | 131.27 |
| COLU-0005 | COLU-0003 | 0.790 | 109.97 | 235.19 |
| COLU-0006 | COLU-0003 | 0.934 | 653.09 | 813.74 |
| COLU-0007 | COLU-0005 | 0.938 | 827.04 | 409.13 |
| COLU-0008 | COLU-0003 | 0.734 | 419.22 | 492.32 |

Categorization and labeling provide the organizational scaffolding that makes these assertions navigable at scale. Each column is assigned a label—Column 2 Label 01 through Column 2 Label 04—and a category—Column 2 Category 01 through Column 2 Category 04—that groups related assertions into coherent domains. The fact_column table further cross-references columns to one another, with COLU-0001 pointing to COLU-0003, COLU-0002 pointing to COLU-0004, and COLU-0003 pointing to COLU-0006, creating a relational map that reveals dependencies and redundancies across the knowledge base. This categorical and relational structure ensures that an auditor can traverse from a high-level category down to the specific belief entity, its supporting references, and the confidence-uncertainty profile that qualifies its admissibility.

**dim_column_2**

| id | column_2_label | column_2_category |
| --- | --- | --- |
| COLU-0001 | Column 2 Label 01 | Column 2 Category 01 |
| COLU-0002 | Column 2 Label 02 | Column 2 Category 02 |
| COLU-0003 | Column 2 Label 03 | Column 2 Category 03 |
| COLU-0004 | Column 2 Label 04 | Column 2 Category 04 |
| COLU-0005 | Column 2 Label 05 | Column 2 Category 05 |
| COLU-0006 | Column 2 Label 06 | Column 2 Category 06 |
| COLU-0007 | Column 2 Label 07 | Column 2 Category 07 |
| COLU-0008 | Column 2 Label 08 | Column 2 Category 08 |