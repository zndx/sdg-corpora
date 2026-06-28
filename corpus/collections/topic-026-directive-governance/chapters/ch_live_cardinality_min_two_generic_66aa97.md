---
chapter_id: ch_live_cardinality_min_two_generic_66aa97
topic_id: 26
family: 01_foundation
cited_terms: ['cardinality_min_two_generic', 'agent_with_role', 'transformation_generates_entity']
model: engine-refine
---

Agent role classification forms the backbone of operational governance, where each agent is assigned a distinct role identifier that anchors its behavior within a broader ecosystem. The identifier serves as the immutable reference point across all tracking systems, appearing in agent role dimension records such as ROLE-0001 through ROLE-0004, and simultaneously linking to factual records that capture runtime characteristics. An agent role is not merely a label; it carries a category designation that groups agents by functional responsibility, with categories ranging from Agent Role Category 01 through Agent Role Category 04, each representing a distinct operational domain. The misc field, stored as the agent role label, provides human-readable context—Agent Role Label 01, for instance—allowing operators to quickly identify the purpose of a given role without consulting technical documentation. This layered classification scheme ensures that governance policies can be applied at the category level while individual agents are tracked by their unique identifiers.

**dim_agent_role**

| id | agent_role_label | agent_role_category |
| --- | --- | --- |
| ROLE-0001 | Agent Role Label 01 | Agent Role Category 01 |
| ROLE-0002 | Agent Role Label 02 | Agent Role Category 02 |
| ROLE-0003 | Agent Role Label 03 | Agent Role Category 03 |
| ROLE-0004 | Agent Role Label 04 | Agent Role Category 04 |
| ROLE-0005 | Agent Role Label 05 | Agent Role Category 05 |
| ROLE-0006 | Agent Role Label 06 | Agent Role Category 06 |
| ROLE-0007 | Agent Role Label 07 | Agent Role Category 07 |

The size and version attributes of agents provide critical telemetry for capacity planning and lifecycle management. Agent facts record the byte footprint of each agent instance, with values spanning from approximately 20.9 megabytes for ROLE-0004 up to 548.9 megabytes for ROLE-0003, reflecting the diverse computational requirements of different role assignments. These size measurements are essential for resource allocation, particularly in environments where agents are deployed across constrained infrastructure. Version numbers, ranging from 1 to 12 across the observed dataset, enable operators to track agent evolution and ensure compatibility with the transformations and entities they interact with. The agent role key in the fact table creates a many-to-one relationship with the dimension table, allowing multiple agent instances to share a single role definition while maintaining independent size and version tracking.

**fact_agent**

| id | agent_role_key | size_bytes | version |
| --- | --- | --- | --- |
| ROLE-0001 | ROLE-0005 | 211345771 | 7 |
| ROLE-0002 | ROLE-0006 | 458577289 | 1 |
| ROLE-0003 | ROLE-0006 | 548859900 | 1 |
| ROLE-0004 | ROLE-0005 | 20883723 | 12 |
| ROLE-0005 | ROLE-0003 | 490849751 | 11 |

Transformation pipelines that generate operational entities are governed by duration and phase metadata, which together define the temporal characteristics of data processing workflows. Each transformation—whether a schema migration routine, batch ingestion pipeline, archival compression job, or feature engineering step—produces a specific entity such as calibrated sensor readings, a feature matrix, or a cleaned telemetry dataset. The duration of these transformations varies considerably, from 2,309.83 seconds for a batch ingestion pipeline to 6,875.45 seconds for a feature engineering step, with all observed transformations operating within the execution phase. These duration measurements are vital for SLA compliance and bottleneck identification, as they reveal which transformations consume disproportionate resources and may require optimization.

**t_transformation_generates_entity**

| id | transformation | generates_entity | duration_seconds | phase |
| --- | --- | --- | --- | --- |
| ENTI-0001 | schema migration routine | calibrated sensor readings | 5649.07 | execution |
| ENTI-0002 | batch ingestion pipeline | feature matrix | 2309.83 | execution |
| ENTI-0003 | archival compression job | feature matrix | 2913.69 | execution |
| ENTI-0004 | feature engineering step | cleaned telemetry dataset | 6875.45 | execution |
| ENTI-0005 | telemetry aggregation task | feature matrix | 2931.10 | closeout |
| ENTI-0006 | batch ingestion pipeline | reconciliation report | 4817.44 | review |

Cardinality constraints enforce data integrity across relational boundaries, ensuring that critical relationships meet minimum participation requirements. The cardinality rules, expressed as AtLeastTwo or MinTwoRequired, mandate that entities maintain connections to at least two related components. For example, the entity GENE-0001 enforces an AtLeastTwo cardinality constraint on its relationship with PrimaryCache, while GENE-0003 applies the same constraint to its connection with TargetSystem. These constraints prevent single points of failure and ensure that critical system components—such as PrimaryCache, TargetSystem, and ReplicaNode—maintain redundant or distributed associations. The identifier field in the cardinality table serves as the primary key for each constraint definition, enabling precise policy enforcement across the data model.

**t_cardinality_min_two_generic**

| id | cardinality | related |
| --- | --- | --- |
| GENE-0001 | AtLeastTwo | PrimaryCache |
| GENE-0002 | MinTwoRequired | PrimaryCache |
| GENE-0003 | AtLeastTwo | TargetSystem |
| GENE-0004 | AtLeastTwo | ReplicaNode |
| GENE-0005 | DualAssociation | MasterNode |
| GENE-0006 | TwinConstraint | GatewayHub |