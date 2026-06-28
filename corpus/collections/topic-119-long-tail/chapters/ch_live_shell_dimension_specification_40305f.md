---
chapter_id: ch_live_shell_dimension_specification_40305f
topic_id: 119
family: 08_derived
cited_terms: ['shell_dimension_specification', 'lineage_edge_with_confidence', 'video_surveillance_activity']
model: engine-refine
---

Shell dimension specifications constitute governed measurement artifacts whose identity is fixed by durable identifiers such as SPEC-0001 through SPEC-0004, each naming a taxonomically and environmentally scoped subject—Venus_venerupis_Mediterranean, Cypraea_tigris_Asian, Littorina_obtusa_Urban, Strombus_gigas_Tropical—rather than a transient observation. In operational practice, a shelldimensionspecification record is not self-describing: its evidentiary content is decomposed across attribute definitions and typed value stores so that confidence, dimension_kind, method, and recorded_at may be asserted independently, validated against declared attr_type constraints (xsd:decimal, xsd:string, xsd:dateTime), and revised without reissuing the entity identifier. The entity key binds each assertion to exactly one specification instance; attr keys route assertions to semantically named slots; and the misc field carries the instantiated payload—0.130 and 0.624 as decimal confidence, Dimension Kind 01 and Encoding 02 as categorical descriptors, nightly summary and ja as procedural or locale annotations, and 2024-08-09T04:20:11 through 2025-04-30T10:31:45 as recorded_at timestamps that establish when the underlying measurement or encoding event was committed to the registry.

**t_shell_dimension_specification**

| id | shell_dimension_specification |
| --- | --- |
| SPEC-0001 | Venus_venerupis_Mediterranean |
| SPEC-0002 | Cypraea_tigris_Asian |
| SPEC-0003 | Littorina_obtusa_Urban |
| SPEC-0004 | Strombus_gigas_Tropical |
| SPEC-0005 | Ostrea_gigas_Brittany |
| SPEC-0006 | Nassa_pertenuis_Coast |
| SPEC-0007 | Strongylocentrotus_pacificus_Puget |

**t_shell_dimension_specification_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| SPEC-0001 | confidence | xsd:decimal |
| SPEC-0002 | dimension_kind | xsd:string |
| SPEC-0003 | method | xsd:string |
| SPEC-0004 | recorded_at | xsd:dateTime |
| SPEC-0005 | uncertainty | xsd:decimal |
| SPEC-0006 | unit | xsd:string |
| SPEC-0007 | value | xsd:decimal |
| SPEC-0008 | encoding | xsd:string |

**t_shell_dimension_specification_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SPEC-0001 | SPEC-0001 | SPEC-0004 | 2024-08-09T04:20:11 |
| SPEC-0002 | SPEC-0002 | SPEC-0004 | 2023-01-11T02:33:00 |
| SPEC-0003 | SPEC-0003 | SPEC-0004 | 2025-04-11T22:51:28 |
| SPEC-0004 | SPEC-0004 | SPEC-0004 | 2025-04-30T10:31:45 |
| SPEC-0005 | SPEC-0005 | SPEC-0004 | 2023-04-03T22:35:38 |
| SPEC-0006 | SPEC-0006 | SPEC-0004 | 2023-08-11T07:42:35 |
| SPEC-0007 | SPEC-0007 | SPEC-0004 | 2025-04-06T02:27:44 |

**t_shell_dimension_specification_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SPEC-0001 | SPEC-0001 | SPEC-0001 | 0.130 |
| SPEC-0002 | SPEC-0001 | SPEC-0005 | 733.39 |
| SPEC-0003 | SPEC-0001 | SPEC-0007 | 125.34 |
| SPEC-0004 | SPEC-0002 | SPEC-0001 | 0.624 |
| SPEC-0005 | SPEC-0002 | SPEC-0005 | 68.87 |
| SPEC-0006 | SPEC-0002 | SPEC-0007 | 303.82 |
| SPEC-0007 | SPEC-0003 | SPEC-0001 | 0.168 |
| SPEC-0008 | SPEC-0003 | SPEC-0005 | 203.41 |

**t_shell_dimension_specification_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SPEC-0001 | SPEC-0001 | SPEC-0002 | Dimension Kind 01 |
| SPEC-0002 | SPEC-0001 | SPEC-0008 | Encoding 02 |
| SPEC-0003 | SPEC-0001 | SPEC-0009 | nightly summary |
| SPEC-0004 | SPEC-0001 | SPEC-0010 | ja |
| SPEC-0005 | SPEC-0001 | SPEC-0003 | manual |
| SPEC-0006 | SPEC-0001 | SPEC-0006 | nm |
| SPEC-0007 | SPEC-0002 | SPEC-0002 | Dimension Kind 07 |
| SPEC-0008 | SPEC-0002 | SPEC-0008 | Encoding 08 |

Attribute typing is the compliance gate through which misc values enter authoritative use. A value presented as xsd:decimal must resolve to a numeric store; xsd:string to lexical stores; xsd:dateTime to temporal stores—partitioning that prevents silent coercion and preserves audit defensibility when downstream analytics, export controls, or cross-system reconciliation depend on homogeneous representations. Where multiple attributes attach to a single entity, as when SPEC-0001 simultaneously carries confidence (SPEC-0001), orthogonal decimal measures (SPEC-0005 at 733.39, SPEC-0007 at 125.34), and varchar encodings (SPEC-0002 through SPEC-0010), the framework treats each tuple as an independent claim whose validity is evaluated against its attr_type, not against the entity label alone. Reviewers therefore examine coverage and consistency at the attribute level: whether every mandatory attr is populated, whether recorded_at is contemporaneous with the measurement window implied by method and dimension_kind, and whether confidence magnitudes are commensurate with the encoding and summarization practices declared alongside them.

Lineage edges extend the same identifier–entity–attribute discipline into provenance governance, where each CONF-0001 through CONF-0004 assertion documents how a downstream artifact relates to an upstream lineage stage—ml_training_dataset_prep or repeated data_lake_warehouse_sync—and attaches a confidence qualification whose interpretation depends explicitly on unit. Partial_match and statistical_overlap are categorical confidence states; 95_percent is a ratio-scaled assertion (unit ratio); and quantitative edges may bind environmental or instrumental measures in deg_C, mg/L, or nm, requiring consumers to normalize or reject joins that commingle incompatible unit semantics. The recordedat field on each edge—2024-07-21T21:36:51, 2025-03-12T13:46:59, 2023-02-17T19:37:00, 2024-01-06T01:59:57—does not merely timestamp ingestion; it fixes the evidentiary epoch in which the confidence judgment was recorded, which governs supersession, retention, and the permissible use of stale lineage in regulated reporting. Operations that treat lineage confidence as unit-agnostic or undated inherit reconciliation risk: a 95_percent ratio edge recorded in 2023 does not automatically validate a 2025 warehouse sync absent explicit policy for temporal decay or re-certification.

Video surveillance activity records translate the entity–attribute–identifier pattern from specimen metrology into environmental and device governance within school operations. Each videosurveillanceactivity—AdminOffice, EastWing_Patrol, Gymnasium, ParkingLotA—is an identifiable operational program (ACTI-0001 through ACTI-0004) whose compliance posture is defined by what schoolenvironment it monitors and what surveillancedevice it employs. Courtyard, MainEntrance_Day, Gymnasium, and ParkingLot_Dusk_Rec are not decorative labels; they delimit lawful scope of observation, duty cycles, and privacy boundaries that auditors map to policy tiers. Employed devices—Fixed_Lens_Camera, IP_Overwatch_Node, Multi_Sensor_Array, Thermal_Array_Sensor—materialize the technical means by which monitoring is performed and determine data categories captured, retention triggers, and access controls. A patrol activity that monitors Gymnasium with a Multi_Sensor_Array implicates different notice, minimization, and incident-response obligations than an AdminOffice program using a Fixed_Lens_Camera, even when both share the same identifier scheme.

**t_video_surveillance_activity**

| id | video_surveillance_activity | monitors | employs_device |
| --- | --- | --- | --- |
| ACTI-0001 | AdminOffice | Courtyard | Fixed_Lens_Camera |
| ACTI-0002 | EastWing_Patrol | MainEntrance_Day | IP_Overwatch_Node |
| ACTI-0003 | Gymnasium | Gymnasium | Multi_Sensor_Array |
| ACTI-0004 | ParkingLotA | ParkingLot_Dusk_Rec | Thermal_Array_Sensor |
| ACTI-0005 | Lobby_Morning_Clip | Playground_Activity | PTZ_Network_Cam |
| ACTI-0006 | Hallway_B2_Feed | Cafeteria_Lunch | Dome_IR_Unit |

Across domains, identifier stability, typed attributes, entity-scoped misc values, unit-qualified measurements, and recorded temporal anchors form a single governance grammar. Shell dimension specifications demand traceable measurement metadata and typed evidentiary decomposition; lineage edges demand unit-aware confidence and dated provenance; surveillance activities demand explicit pairing of environment scope and device capability. Practitioners who maintain registries in this form can demonstrate, under review, not only what was asserted—Venus_venerupis at 0.130 confidence with Dimension Kind 01, or ParkingLotA under Thermal_Array_Sensor—but when it was recorded, under what typing rules it was admitted, and through which lineage or operational chain it remains authoritative. That composability is why attr, attr_type, entity, identifier, misc, recordedat, unit, shelldimensionspecification, schoolenvironment, surveillancedevice, and videosurveillanceactivity are maintained as first-class governance primitives rather than incidental columns: they encode the minimum structure required for evidence to survive export, dispute, and long-horizon reuse without collapsing into undifferentiated text.

**t_lineage_edge_with_confidence**

| id | lineage | confidence | recorded_at | unit |
| --- | --- | --- | --- | --- |
| CONF-0001 | ml_training_dataset_prep | partial_match | 2024-07-21T21:36:51 | deg_C |
| CONF-0002 | data_lake_warehouse_sync | statistical_overlap | 2025-03-12T13:46:59 | mg/L |
| CONF-0003 | data_lake_warehouse_sync | 95_percent | 2023-02-17T19:37:00 | ratio |
| CONF-0004 | data_lake_warehouse_sync | 95_percent | 2024-01-06T01:59:57 | nm |
| CONF-0005 | api_log_aggregation | partial_match | 2025-01-27T14:57:11 | deg_C |
| CONF-0006 | geospatial_raster_processing | high | 2023-11-04T09:37:36 | nm |