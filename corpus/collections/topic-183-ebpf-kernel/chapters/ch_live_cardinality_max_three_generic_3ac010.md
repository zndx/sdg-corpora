---
chapter_id: ch_live_cardinality_max_three_generic_3ac010
topic_id: 183
family: 01_foundation
cited_terms: ['cardinality_max_three_generic', 'syscall_subclass', 'lane_compliance_behavior']
model: engine-refine
---

The syscall subsystem forms a dimensional backbone for tracking system call activity, where each subsystem entry carries a human-readable label and a categorical classification. Entries such as In Syscall Subsystem Label 01 through Label 04 are each assigned to corresponding categories—In Syscall Subsystem Category 01 through Category 04—providing a structured taxonomy that supports aggregation and filtering. Fact records reference these dimension entries through a foreign key, and each fact carries an event count that quantifies the volume of activity observed. For instance, one subsystem reference records 382 events while another captures only 52, reflecting the wide variance in syscall frequency across different subsystem contexts. The identifier SYSC-0001 through SYSC-0004 serves as the primary key for the dimension table, while the fact table uses its own identifier space (also SYSC-0001 through SYSC-0004 in the sample) to link back to the dimension via the in_syscall_subsystem foreign key.

**fact_syscall**

| id | in_syscall_subsystem_key | event_count |
| --- | --- | --- |
| SYSC-0001 | SYSC-0004 | 238 |
| SYSC-0002 | SYSC-0002 | 52 |
| SYSC-0003 | SYSC-0003 | 198 |
| SYSC-0004 | SYSC-0005 | 382 |
| SYSC-0005 | SYSC-0002 | 283 |
| SYSC-0006 | SYSC-0001 | 288 |

**dim_in_syscall_subsystem**

| id | in_syscall_subsystem_label | in_syscall_subsystem_category |
| --- | --- | --- |
| SYSC-0001 | In Syscall Subsystem Label 01 | In Syscall Subsystem Category 01 |
| SYSC-0002 | In Syscall Subsystem Label 02 | In Syscall Subsystem Category 02 |
| SYSC-0003 | In Syscall Subsystem Label 03 | In Syscall Subsystem Category 03 |
| SYSC-0004 | In Syscall Subsystem Label 04 | In Syscall Subsystem Category 04 |
| SYSC-0005 | In Syscall Subsystem Label 05 | In Syscall Subsystem Category 05 |
| SYSC-0006 | In Syscall Subsystem Label 06 | In Syscall Subsystem Category 06 |

Lane compliance behavior introduces a parallel domain focused on traffic enforcement and operational accountability. Each behavior record is identified by a code such as BEHA-0001 and describes a specific lane context—examples include I-280 Express Lane, I-70 Eastbound, SR-520 Toll, and Route 128 North. These behaviors do not exist in isolation; they are associated with the street types on which they occur. A behavior may be observed on a Tunnel Approach Lane, an Urban Signalized Intersection, a Highway Work Zone, or a Bridge Deck Section, each configuration representing a distinct traffic environment with its own compliance challenges. The street traffic configuration dimension provides a standardized vocabulary for these environments, enabling consistent reporting across jurisdictions and roadway types.

The relationship between lane compliance behaviors and the personnel or entities responsible for them is modeled through a junction table that captures both the operator and the role. Vehicle operators such as Heavy Haul Supervisor, Delivery Van Operator, Autonomous Fleet Unit, and RideShare Driver are linked to behaviors, and the junction table assigns each pairing a role—typically owner or reviewer. In one configuration, BEHA-0002 is linked to BEHA-0005 with the role of owner, while BEHA-0001 connects to BEHA-0003 under the same role designation. A separate junction table handles the association between behaviors and street traffic configurations, where roles expand to include observer alongside owner and reviewer. Here, BEHA-0003 is paired with BEHA-0006 under the observer role, and BEHA-0001 connects to BEHA-0005 as a reviewer, establishing a clear audit trail of who monitors, who owns, and who reviews each compliance event.

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

Cardinality constraints govern the multiplicity of relationships across the model, ensuring that data integrity is maintained at the schema level. The cardinality_note column in the junction table between lane compliance behaviors and street traffic configurations explicitly documents these constraints—Cardinality Note 01 through Cardinality Note 04 in the sample data. A separate cardinality reference table reinforces this discipline, defining constraint types such as capped-pair, bounded-triplet, single-bound, and max-three, all of which are applied to telemetry-stream relationships. These cardinality rules prevent over-association and enforce business logic about how many operators can be assigned to a behavior, how many street types a behavior can occur on, and how many telemetry streams can be linked to a given cardinality entry. The identifier GENE-0001 through GENE-0004 serves as the primary key for this cardinality reference, providing a stable anchor for constraint definitions.

**t_cardinality_max_three_generic**

| id | cardinality | related |
| --- | --- | --- |
| GENE-0001 | capped-pair | telemetry-stream |
| GENE-0002 | bounded-triplet | telemetry-stream |
| GENE-0003 | single-bound | telemetry-stream |
| GENE-0004 | max-three | telemetry-stream |
| GENE-0005 | limited-association | batch-job |
| GENE-0006 | triple-cap | telemetry-stream |
| GENE-0007 | fixed-triple | batch-job |
| GENE-0008 | capped-pair | stream-processor |

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

**t_lane_compliance_behavior_occurs_on_street_type**

| id | occurs_on_street_type |
| --- | --- |
| BEHA-0001 | Tunnel Approach Lane |
| BEHA-0002 | Urban Signalized Intersection |
| BEHA-0003 | Highway Work Zone |
| BEHA-0004 | Bridge Deck Section |
| BEHA-0005 | Rural Interstate Highway |
| BEHA-0006 | Urban Signalized Intersection |

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