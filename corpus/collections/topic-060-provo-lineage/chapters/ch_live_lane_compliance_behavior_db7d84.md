---
chapter_id: ch_live_lane_compliance_behavior_db7d84
topic_id: 60
family: 08_derived
cited_terms: ['lane_compliance_behavior', 'lineage_edge_within_dataset_only', 'trace_originates_from']
model: engine-refine
---

Lane compliance behavior records anchor a relational model that captures how specific roadway segments are governed, monitored, and attributed across operational roles. Each behavior is identified by a unique key such as BEHA-0001 through BEHA-0004 and carries a descriptive lane_compliance_behavior value—examples include I-280 Express Lane, I-70 Eastbound, SR-520 Toll, and Route 128 North. These identifiers serve as the primary join keys through which compliance events are connected to the operators who oversee them and the street traffic configurations on which they occur. The operator dimension distinguishes between Heavy Haul Supervisor, Delivery Van Operator, Autonomous Fleet Unit, and RideShare Driver, while the street traffic configuration dimension classifies environments as Tunnel Approach Lane, Urban Signalized Intersection, Highway Work Zone, or Bridge Deck Section. The separation of these descriptive dimensions from the behavioral facts enables independent evolution of operator classifications and roadway typologies without altering the compliance event records themselves.

**t_lane_compliance_behavior**

| id | lane_compliance_behavior |
| --- | --- |
| BEHA-0001 | I-280 Express Lane |
| BEHA-0002 | I-70 Eastbound |
| BEHA-0003 | SR-520 Toll |
| BEHA-0004 | Route 128 North |
| BEHA-0005 | I-70 Eastbound |
| BEHA-0006 | Highway 401 Inner |

**t_lane_compliance_behavior_involves_operator**

| id | involves_operator |
| --- | --- |
| BEHA-0001 | Heavy Haul Supervisor |
| BEHA-0002 | Delivery Van Operator |
| BEHA-0003 | Autonomous Fleet Unit |
| BEHA-0004 | RideShare Driver |
| BEHA-0005 | RideShare Driver |
| BEHA-0006 | Logistics Coordinator |
| BEHA-0007 | Autonomous Fleet Unit |

**t_lane_compliance_behavior__involves_operator**

| id | lane_id | involves_operator_id | role |
| --- | --- | --- | --- |
| BEHA-0001 | BEHA-0002 | BEHA-0005 | reviewer |
| BEHA-0002 | BEHA-0006 | BEHA-0001 | reviewer |
| BEHA-0003 | BEHA-0005 | BEHA-0005 | owner |
| BEHA-0004 | BEHA-0002 | BEHA-0003 | owner |
| BEHA-0005 | BEHA-0003 | BEHA-0006 | owner |
| BEHA-0006 | BEHA-0003 | BEHA-0007 | contributor |
| BEHA-0007 | BEHA-0003 | BEHA-0006 | contributor |
| BEHA-0008 | BEHA-0002 | BEHA-0007 | observer |

**t_lane_compliance_behavior_occurs_on_street_type**

| id | occurs_on_street_type |
| --- | --- |
| BEHA-0001 | Tunnel Approach Lane |
| BEHA-0002 | Urban Signalized Intersection |
| BEHA-0003 | Highway Work Zone |
| BEHA-0004 | Bridge Deck Section |
| BEHA-0005 | Rural Interstate Highway |
| BEHA-0006 | Urban Signalized Intersection |

The junction tables that bind lane compliance behaviors to operators and to street traffic configurations introduce a role attribute that encodes the nature of each association. In the operator linkage, a single behavior such as BEHA-0002 may be connected to multiple operators with divergent roles—reviewer for one pairing and owner for another—reflecting the reality that a single toll lane event can be simultaneously audited by a Heavy Haul Supervisor and managed by a RideShare Driver. The street traffic configuration junction table similarly employs the role field, assigning observer or reviewer designations to pairs like BEHA-0003 linked to BEHA-0006 or BEHA-0001 linked to BEHA-0005. Each of these junction records also carries a cardinality_note—Cardinality Note 01 through Cardinality Note 04—which documents the multiplicity constraints governing the relationship, ensuring that downstream query engines and data consumers understand whether a given lane behavior may appear on multiple street types or whether an operator may be assigned to multiple compliance events.

**t_lane_compliance_behavior__occurs_on_street_type**

| id | lane_id | occurs_on_street_type_id | role | cardinality_note |
| --- | --- | --- | --- | --- |
| BEHA-0001 | BEHA-0003 | BEHA-0006 | observer | Cardinality Note 01 |
| BEHA-0002 | BEHA-0004 | BEHA-0002 | observer | Cardinality Note 02 |
| BEHA-0003 | BEHA-0002 | BEHA-0001 | owner | Cardinality Note 03 |
| BEHA-0004 | BEHA-0001 | BEHA-0005 | reviewer | Cardinality Note 04 |
| BEHA-0005 | BEHA-0001 | BEHA-0006 | observer | Cardinality Note 05 |
| BEHA-0006 | BEHA-0001 | BEHA-0003 | contributor | Cardinality Note 06 |
| BEHA-0007 | BEHA-0004 | BEHA-0006 | contributor | Cardinality Note 07 |
| BEHA-0008 | BEHA-0006 | BEHA-0004 | observer | Cardinality Note 08 |

Trace records operationalize the provenance of each compliance observation through a fact table that references a dimension of origin points. The fact_trace table stores an identifier such as FROM-0001 through FROM-0004, an originates_from_key that points to a row in the dim_originates_from dimension, a duration_seconds measurement ranging from 1874.27 to 3940.66 seconds, an exit_code indicating the termination state of the trace (values observed include 491, 900, 420, and 60), and a retry_count that quantifies how many times the system attempted to complete the observation before reaching its final state—values span from 179 to 459 retries. The dimension table dim_originates_from provides human-readable labels like Originates From Label 01 through Originates From Label 04 and a category attribute (Originates From Category 01 through 04) that groups origin points into logical families, enabling aggregation of trace metrics by source type rather than by individual identifier.

**fact_trace**

| id | originates_from_key | duration_seconds | exit_code | retry_count |
| --- | --- | --- | --- | --- |
| FROM-0001 | FROM-0002 | 1874.27 | 491 | 399 |
| FROM-0002 | FROM-0001 | 2092.44 | 900 | 179 |
| FROM-0003 | FROM-0005 | 3940.66 | 420 | 396 |
| FROM-0004 | FROM-0004 | 3336.66 | 60 | 459 |

**dim_originates_from**

| id | originates_from_label | originates_from_category |
| --- | --- | --- |
| FROM-0001 | Originates From Label 01 | Originates From Category 01 |
| FROM-0002 | Originates From Label 02 | Originates From Category 02 |
| FROM-0003 | Originates From Label 03 | Originates From Category 03 |
| FROM-0004 | Originates From Label 04 | Originates From Category 04 |
| FROM-0005 | Originates From Label 05 | Originates From Category 05 |
| FROM-0006 | Originates From Label 06 | Originates From Category 06 |
| FROM-0007 | Originates From Label 07 | Originates From Category 07 |

A parallel lineage tracking structure mirrors this pattern for dataset-level provenance. The fact_lineage table records an identifier such as ONLY-0001 through ONLY-0004, a within_dataset_key that references the dim_within_dataset dimension, a confidence score ranging from 0.071 to 0.779, an uncertainty value spanning 76.69 to 708.23, and a misc value that holds a numeric measurement—903.86, 832.18, 862.00, or 259.55 in the observed data. The dimension table dim_within_dataset supplies a within_dataset_label (Within Dataset Label 01 through 04) and a within_dataset_category (Within Dataset Category 01 through 04) that classify the dataset context. The confidence and uncertainty fields together quantify the reliability of each lineage assertion, with the confidence score representing the probability that the stated relationship holds and the uncertainty value expressing the absolute margin of error in the associated measurement.

**fact_lineage**

| id | within_dataset_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| ONLY-0001 | ONLY-0003 | 0.645 | 612.22 | 903.86 |
| ONLY-0002 | ONLY-0004 | 0.071 | 133.03 | 832.18 |
| ONLY-0003 | ONLY-0005 | 0.404 | 76.69 | 862.00 |
| ONLY-0004 | ONLY-0006 | 0.779 | 708.23 | 259.55 |
| ONLY-0005 | ONLY-0001 | 0.376 | 801.99 | 986.33 |
| ONLY-0006 | ONLY-0004 | 0.744 | 956.79 | 34.40 |

**dim_within_dataset**

| id | within_dataset_label | within_dataset_category |
| --- | --- | --- |
| ONLY-0001 | Within Dataset Label 01 | Within Dataset Category 01 |
| ONLY-0002 | Within Dataset Label 02 | Within Dataset Category 02 |
| ONLY-0003 | Within Dataset Label 03 | Within Dataset Category 03 |
| ONLY-0004 | Within Dataset Label 04 | Within Dataset Category 04 |
| ONLY-0005 | Within Dataset Label 05 | Within Dataset Category 05 |
| ONLY-0006 | Within Dataset Label 06 | Within Dataset Category 06 |

The category attribute appears consistently across both the dim_originates_from and dim_within_dataset dimensions, serving as the primary grouping mechanism for provenance records. This attribute enables roll-up queries that summarize trace durations, exit codes, and retry counts by origin category, or that aggregate lineage confidence and uncertainty by dataset category, without requiring joins to the detailed label columns. The misc field, present in both fact_lineage and the dimension tables as a label carrier, provides a free-form text slot that can hold supplementary metadata—whether a numeric measurement in the fact table or a human-readable description in the dimension—without imposing a rigid schema on ancillary information that does not fit the structured columns.