---
chapter_id: ch_live_belief_interval_exactly_two_bounds_70b1d0
topic_id: 80
family: 06_belief_structure
cited_terms: ['belief_interval_exactly_two_bounds', 'lineage_edge_describes_column_flow', 'measurement_observed_at']
model: engine-refine
---

Within any provenance-aware data architecture, the identifier serves as the immutable anchor for every fact, attribute, and relationship. Each record—whether a belief interval such as BOUN-0001, a lineage trace such as FLOW-0001, or an observation such as OBSE-0001—carries a stable key that survives across joins, audits, and temporal revisions. The identifier is not merely a row handle; it is the referent that allows a downstream consumer to reconstruct the full provenance graph. When a measurement of temperature gradient recorded at Monitoring Station Bravo (OBSE-0001) is linked to its confidence value of 0.528, the linkage is mediated through the entity column, which carries the same identifier OBSE-0001, and the attr column, which carries OBSE-0001, pointing to the attribute definition that declares confidence as an xsd:decimal. The identifier, the entity, and the attr together form the minimal triple that binds a value to its semantic context.

**t_belief_interval_exactly_two_bounds**

| id | belief |
| --- | --- |
| BOUN-0001 | battery charge decay |
| BOUN-0002 | turbine vibration threshold |
| BOUN-0003 | blood glucose trend |
| BOUN-0004 | reactor core temperature estimate |
| BOUN-0005 | filter clog probability |
| BOUN-0006 | turbine vibration threshold |

**t_measurement_observed_at**

| id | measurement | observed_at |
| --- | --- | --- |
| OBSE-0001 | temperature gradient | Monitoring Station Bravo |
| OBSE-0002 | packet loss | Observatory Dome 2 |
| OBSE-0003 | wind shear | Lab Bench 7B |
| OBSE-0004 | network latency | Weather Mast Delta |
| OBSE-0005 | pH level | Telemetry Gateway Alpha |
| OBSE-0006 | pH level | Calibration Rack 9 |

**t_measurement_observed_at_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| OBSE-0001 | confidence | xsd:decimal |
| OBSE-0002 | dimension_kind | xsd:string |
| OBSE-0003 | method | xsd:string |
| OBSE-0004 | recorded_at | xsd:dateTime |
| OBSE-0005 | uncertainty | xsd:decimal |
| OBSE-0006 | unit | xsd:string |
| OBSE-0007 | value | xsd:decimal |
| OBSE-0008 | encoding | xsd:string |

**t_measurement_observed_at_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OBSE-0001 | OBSE-0001 | OBSE-0001 | 0.528 |
| OBSE-0002 | OBSE-0001 | OBSE-0005 | 280.63 |
| OBSE-0003 | OBSE-0001 | OBSE-0007 | 384.95 |
| OBSE-0004 | OBSE-0002 | OBSE-0001 | 0.215 |
| OBSE-0005 | OBSE-0002 | OBSE-0005 | 900.19 |
| OBSE-0006 | OBSE-0002 | OBSE-0007 | 524.13 |
| OBSE-0007 | OBSE-0003 | OBSE-0001 | 0.738 |
| OBSE-0008 | OBSE-0003 | OBSE-0005 | 695.46 |

Attributes are the named properties that qualify an entity, and each attribute carries a type that constrains the shape of admissible values. The attribute registry distinguishes confidence as xsd:decimal, dimension_kind and method as xsd:string, and recorded_at as xsd:dateTime. This type discipline is not decorative; it governs how values are stored, compared, and aggregated. A recorded_at value such as 2023-12-12T12:05:13 is semantically distinct from a confidence value of 0.528, and the attr_type column enforces that distinction at the schema level. The attribute name—attr_name—provides the human-readable label, while the type—attr_type—provides the machine-readable contract. Together they form the attr construct, which is the bridge between a conceptual property and its concrete representation in a value table.

The value tables themselves are partitioned by type: decimal values for confidence and numeric measurements, datetime values for timestamps, and varchar values for categorical labels and free-text annotations. An entity such as OBSE-0001 may carry multiple attributes simultaneously—confidence at 0.528, dimension_kind as Dimension Kind 01, recorded_at as 2023-12-12T12:05:13—and each value resides in the table corresponding to its attr_type. This vertical partitioning is a deliberate design choice that avoids nullable columns and type coercion at query time. The entity column in each value table is the foreign key back to the entity's primary record, and the attr column is the foreign key to the attribute definition. The value column, labeled misc in the schema, holds the actual data. The misc label is a misnomer; the values are neither miscellaneous nor unstructured. They are typed, versioned, and traceable.

**t_measurement_observed_at_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OBSE-0001 | OBSE-0001 | OBSE-0004 | 2023-12-12T12:05:13 |
| OBSE-0002 | OBSE-0002 | OBSE-0004 | 2024-12-09T20:37:11 |
| OBSE-0003 | OBSE-0003 | OBSE-0004 | 2023-09-12T00:10:32 |
| OBSE-0004 | OBSE-0004 | OBSE-0004 | 2024-08-27T19:17:19 |
| OBSE-0005 | OBSE-0005 | OBSE-0004 | 2025-06-14T14:45:22 |
| OBSE-0006 | OBSE-0006 | OBSE-0004 | 2023-03-29T14:19:26 |

**t_measurement_observed_at_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OBSE-0001 | OBSE-0001 | OBSE-0002 | Dimension Kind 01 |
| OBSE-0002 | OBSE-0001 | OBSE-0008 | Encoding 02 |
| OBSE-0003 | OBSE-0001 | OBSE-0009 | calibration record |
| OBSE-0004 | OBSE-0001 | OBSE-0010 | de |
| OBSE-0005 | OBSE-0001 | OBSE-0003 | hybrid |
| OBSE-0006 | OBSE-0001 | OBSE-0006 | nm |
| OBSE-0007 | OBSE-0002 | OBSE-0002 | Dimension Kind 07 |
| OBSE-0008 | OBSE-0002 | OBSE-0008 | Encoding 08 |

Beyond the entity-attribute-value triad, the data model introduces role, subject, and target to express relationships between entities. In the belief interval lower-bound table, a belief_id acts as the subject, a belief_lower_bound_id acts as the target, and the role column assigns a function—observer, reviewer, or contributor—to the relationship. BOUN-0001, for instance, links belief BOUN-0003 (turbine vibration threshold) to lower bound BOUN-0004 (15.0 kPa) with the role of contributor, while BOUN-0002 links belief BOUN-0002 (blood glucose trend) to the same lower bound with the role of reviewer. The role is not a property of either endpoint; it is a property of the edge. This edge-centric modeling allows a single lower bound to participate in multiple relationships with different semantic functions, and it allows a single belief to reference multiple bounds through different roles.

**t_belief_interval_exactly_two_bounds_belief_lower_bound**

| id | belief_lower_bound |
| --- | --- |
| BOUN-0001 | 78.9 pct |
| BOUN-0002 | 22.4 dBm |
| BOUN-0003 | 0.001 |
| BOUN-0004 | 15.0 kPa |
| BOUN-0005 | 78.9 pct |
| BOUN-0006 | 78.9 pct |

**t_belief_interval_exactly_two_bounds__belief_lower_bound**

| id | belief_id | belief_lower_bound_id | role |
| --- | --- | --- | --- |
| BOUN-0001 | BOUN-0006 | BOUN-0004 | observer |
| BOUN-0002 | BOUN-0003 | BOUN-0001 | reviewer |
| BOUN-0003 | BOUN-0002 | BOUN-0004 | reviewer |
| BOUN-0004 | BOUN-0001 | BOUN-0002 | contributor |
| BOUN-0005 | BOUN-0001 | BOUN-0001 | reviewer |
| BOUN-0006 | BOUN-0003 | BOUN-0004 | observer |
| BOUN-0007 | BOUN-0001 | BOUN-0004 | reviewer |
| BOUN-0008 | BOUN-0005 | BOUN-0002 | observer |

Confidence and uncertainty are the quantitative measures that accompany a fact, and they are stored as first-class columns in the lineage fact table. A lineage record such as FLOW-0001 carries a confidence of 0.645 and an uncertainty of 612.22 alongside a value of 903.86. Another record, FLOW-0004, carries a higher confidence of 0.779 but a correspondingly larger uncertainty of 708.23. The inverse relationship between confidence and uncertainty is not enforced by constraint; it is a domain convention that consumers are expected to honor. Confidence is a scalar in the range [0, 1], while uncertainty is an absolute magnitude that may carry units depending on the domain. Both are essential for risk-aware decision making: a measurement with high confidence but high uncertainty may still be unreliable for safety-critical thresholds.

The describes_column_flow construct ties lineage facts to a dimensional catalog that classifies each flow by label and category. The dimension table dim_describes_column_flow assigns labels such as Describes Column Flow Label 01 and categories such as Describes Column Flow Category 01 to identifiers FLOW-0001 through FLOW-0004. The fact_lineage table references these identifiers through the describes_column_flow_key column, creating a many-to-one relationship between facts and their categorical classification. This classification is not metadata for metadata's sake; it enables aggregation and filtering at the category level. A governance auditor can ask, for example, how many lineage facts fall under Describes Column Flow Category 03, or what the average confidence is for facts classified under Describes Column Flow Category 02. The category and label columns provide the human-readable taxonomy, while the identifier provides the machine-readable key. Together, they form the describes_column_flow construct, which is the bridge between raw lineage data and structured governance reporting.

**fact_lineage**

| id | describes_column_flow_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| FLOW-0001 | FLOW-0006 | 0.645 | 612.22 | 903.86 |
| FLOW-0002 | FLOW-0005 | 0.071 | 133.03 | 832.18 |
| FLOW-0003 | FLOW-0004 | 0.404 | 76.69 | 862.00 |
| FLOW-0004 | FLOW-0005 | 0.779 | 708.23 | 259.55 |
| FLOW-0005 | FLOW-0002 | 0.376 | 801.99 | 986.33 |
| FLOW-0006 | FLOW-0003 | 0.744 | 956.79 | 34.40 |

**dim_describes_column_flow**

| id | describes_column_flow_label | describes_column_flow_category |
| --- | --- | --- |
| FLOW-0001 | Describes Column Flow Label 01 | Describes Column Flow Category 01 |
| FLOW-0002 | Describes Column Flow Label 02 | Describes Column Flow Category 02 |
| FLOW-0003 | Describes Column Flow Label 03 | Describes Column Flow Category 03 |
| FLOW-0004 | Describes Column Flow Label 04 | Describes Column Flow Category 04 |
| FLOW-0005 | Describes Column Flow Label 05 | Describes Column Flow Category 05 |
| FLOW-0006 | Describes Column Flow Label 06 | Describes Column Flow Category 06 |
| FLOW-0007 | Describes Column Flow Label 07 | Describes Column Flow Category 07 |