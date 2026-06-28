---
chapter_id: ch_live_video_surveillance_activity_bcd903
topic_id: 26
family: 08_derived
cited_terms: ['video_surveillance_activity', 'equiv_intersect_with_two_restrictions', 'agent_with_role']
model: engine-refine
---

In governed operational environments—particularly those where automated agents intersect with physical security—the first layer of accountability is the agent role. Each role carries a stable identifier that anchors every downstream policy decision, audit trail, and cross-system reference. Roles are not monolithic; they are classified into categories that express functional scope and compliance posture, while human-readable labels (miscellaneous descriptors in the governance lexicon) translate opaque keys into operational language operators can act on. A role such as one keyed to `ROLE-0005` may appear across multiple fact records, signaling that the same governance template governs distinct deployed instances, whereas categories like "Agent Role Category 01" through "Agent Role Category 04" partition the agent population so that retention rules, access boundaries, and escalation paths can differ by function without conflating unrelated workloads.

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

Version and size_bytes complete the agent role as a living artifact rather than a static permission string. Version increments record the evolution of role definitions—whether through policy amendments, capability expansions, or remediation after an incident—and auditors treat mismatches between declared version and runtime behavior as first-class compliance findings. The footprint measured in size_bytes captures the material scope of what a role encapsulates: configuration bundles, embedded models, telemetry schemas, or historical decision logs bound to that role. Observed magnitudes ranging from roughly 21 megabytes to nearly 549 megabytes illustrate that roles are not uniformly lightweight; a 548,859,900-byte instance at version 1 may denote a freshly provisioned but data-rich agent package, while a 20,883,723-byte role at version 12 suggests a long-refined, compact operational profile. Together, identifier, category, misc label, version, and size_bytes form the evidentiary spine that proves which agent acted, under which governance generation, and with what operational mass.

**fact_agent**

| id | agent_role_key | size_bytes | version |
| --- | --- | --- | --- |
| ROLE-0001 | ROLE-0005 | 211345771 | 7 |
| ROLE-0002 | ROLE-0006 | 458577289 | 1 |
| ROLE-0003 | ROLE-0006 | 548859900 | 1 |
| ROLE-0004 | ROLE-0005 | 20883723 | 12 |
| ROLE-0005 | ROLE-0003 | 490849751 | 11 |

Video surveillance activity names the governed practice of observing school environments for safety, access control, and incident response. Each activity is a defined operational pattern—patrol, fixed monitoring, or zone-specific watch—not merely a camera feed. Activities such as AdminOffice, EastWing_Patrol, Gymnasium, and ParkingLotA express intent: administrative oversight, mobile corridor coverage, assembly-space monitoring, and perimeter surveillance at a designated lot. Because activities are first-class entities with their own identifiers (for example ACTI-0001 through ACTI-0004), compliance frameworks can attach retention schedules, lawful-basis documentation, and data-subject rights workflows to the activity rather than to raw hardware, which may be repurposed or replaced without changing the underlying governance obligation.

**t_video_surveillance_activity**

| id | video_surveillance_activity | monitors | employs_device |
| --- | --- | --- | --- |
| ACTI-0001 | AdminOffice | Courtyard | Fixed_Lens_Camera |
| ACTI-0002 | EastWing_Patrol | MainEntrance_Day | IP_Overwatch_Node |
| ACTI-0003 | Gymnasium | Gymnasium | Multi_Sensor_Array |
| ACTI-0004 | ParkingLotA | ParkingLot_Dusk_Rec | Thermal_Array_Sensor |
| ACTI-0005 | Lobby_Morning_Clip | Playground_Activity | PTZ_Network_Cam |
| ACTI-0006 | Hallway_B2_Feed | Cafeteria_Lunch | Dome_IR_Unit |

The school environment—the physical or temporal zone an activity is authorized to monitor—must be explicitly bound to each surveillance activity so that scope creep is detectable and deniable. Monitors values such as Courtyard, MainEntrance_Day, Gymnasium, and ParkingLot_Dusk_Rec encode both place and condition: a gymnasium watch differs from a dusk-and-recreation parking configuration, and a main-entrance profile qualified as "Day" signals time-bounded authorization that may trigger automatic de-escalation or masking rules after hours. Pairing Gymnasium as both activity and monitored environment is coherent when a single sanctioned program governs that space end-to-end; pairing ParkingLotA activity with ParkingLot_Dusk_Rec environment shows how granular environmental qualifiers prevent a daytime parking policy from silently authorizing night-time recording. Surveillance device assignments close the loop between abstract activity and deployed sensor capability. Employs_device selections—Fixed_Lens_Camera, IP_Overwatch_Node, Multi_Sensor_Array, Thermal_Array_Sensor—document which hardware class executes the activity, supporting vendor accountability, calibration schedules, and privacy impact assessments that differ markedly between visible-spectrum fixed cameras and thermal arrays.

Governance over agents and surveillance does not operate in isolation; restriction intersections model where equivalency classes and related assets must jointly satisfy two independent controls before processing is permitted. Identifiers REST-0001 through REST-0004 mark intersection points where paired equivalencies (for instance telemetry_stream_alpha with ml_model_checkpoint, or sensor_node_array appearing in multiple restriction rows) must align with related artifacts such as storage_volume, encryption_key, or pressure_transducer before data may flow. In practice, this pattern prevents an agent role from ingesting a telemetry stream unless both the stream's governance class and its paired model checkpoint pass policy; similarly, sensor arrays tied to ml_model_checkpoint equivalencies cannot write to backup_volume or inference_dataset paths without satisfying centrifuge_tube or ingestion_connector constraints where laboratory or industrial adjacency applies. These intersections are the enforcement grammar that connects abstract role/version metadata to concrete allow-or-deny decisions at runtime.

**t_equiv_intersect_with_two_restrictions**

| id | equiv | equiv_2 | related | related_2 |
| --- | --- | --- | --- | --- |
| REST-0001 | telemetry_stream_alpha | ml_model_checkpoint | storage_volume | inference_dataset |
| REST-0002 | governance_policy_set | sensor_node_array | encryption_key | backup_volume |
| REST-0003 | ml_feature_vector | sensor_node_array | centrifuge_tube | pressure_transducer |
| REST-0004 | lab_assay_batch | ml_model_checkpoint | ingestion_connector | pressure_transducer |
| REST-0005 | edge_gateway_unit | validation_schema | protocol_adapter | incubator_chamber |
| REST-0006 | batch_pipeline_gamma | sensor_node_array | schema_registry | catalog_entry |
| REST-0007 | telemetry_stream_alpha | ml_model_checkpoint | centrifuge_tube | inference_dataset |

Operational teams implement this domain by maintaining referential integrity across role dimensions and surveillance facts, versioning role packages before deployment, and validating that each video surveillance activity's authorized school environment and surveillance device triple remains current after physical campus changes. When an incident occurs, investigators reconstruct the chain from activity identifier through monitors and employs_device to the agent role category and version that processed or retained associated evidence, using size_bytes as a sanity check against expected payloads. Restriction intersections then confirm whether cross-domain data handling—model inference on surveillance-derived features, telemetry fusion, or archival to encrypted volumes—was permitted at the moment of action. That end-to-end traceability is why these attributes matter: they transform compliance from narrative policy into testable, auditable state that survives personnel turnover, vendor migration, and the evolving layout of the school environment itself.