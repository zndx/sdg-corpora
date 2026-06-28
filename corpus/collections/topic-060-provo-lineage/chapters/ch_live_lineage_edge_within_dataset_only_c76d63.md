---
chapter_id: ch_live_lineage_edge_within_dataset_only_c76d63
topic_id: 60
family: 05_provo_lineage
cited_terms: ['lineage_edge_within_dataset_only', 'video_surveillance_activity', 'observation_precedes_other']
model: engine-refine
---

Within the dataset, provenance and lineage information is captured through a fact table that records confidence and uncertainty metrics alongside numeric values for each lineage entry. Identifiers such as `ONLY-0001` through `ONLY-0004` anchor individual records, while the `within_dataset_key` column—bearing values like `ONLY-0003` and `ONLY-0006`—links each fact to a corresponding dimension record. Confidence scores span a wide range, from a low of `0.071` to a high of `0.779`, reflecting the variable reliability of lineage assertions; uncertainty values, measured in the hundreds, further quantify this imprecision, with entries reaching as high as `708.23`. The associated numeric values—`903.86`, `832.18`, `862.00`, `259.55`—serve as the quantitative substance of each lineage claim. The dimension table resolves these keys into human-readable labels and categories, pairing `Within Dataset Label 01` with `Within Dataset Category 01` and continuing through four such pairings, thereby providing the semantic grounding that the fact table alone cannot supply.

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

Temporal relationships between observations are modeled through a precedence table that asserts one event precedes another, with identifiers such as `OTHE-0001` and `OTHE-0002` designating individual ordering assertions. The observation column records events like `server_disk_full` and `packet_drop_event`, while the precedes column identifies subsequent events including `firmware_update_init`, `system_boot_sequence`, and `power_stabilization`. Notably, the same observation—`server_disk_full`—appears across three distinct precedence records (`OTHE-0001`, `OTHE-0002`, `OTHE-0003`), each linking to a different succeeding event, which indicates that a single triggering condition can initiate multiple downstream sequences. This structure supports causal reasoning about system behavior, where the temporal ordering of events is as critical as the events themselves.

**t_observation_precedes_other**

| id | observation | precedes |
| --- | --- | --- |
| OTHE-0001 | server_disk_full | firmware_update_init |
| OTHE-0002 | server_disk_full | firmware_update_init |
| OTHE-0003 | server_disk_full | system_boot_sequence |
| OTHE-0004 | packet_drop_event | power_stabilization |
| OTHE-0005 | sensor_calibration_cycle | sensor_warmup_phase |
| OTHE-0006 | sensor_calibration_cycle | data_buffer_reset |
| OTHE-0007 | server_disk_full | config_load_event |

**t_observation_precedes_other_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| OTHE-0001 | duration_seconds | xsd:decimal |
| OTHE-0002 | end_time | xsd:dateTime |
| OTHE-0003 | exit_code | xsd:integer |
| OTHE-0004 | host_name | xsd:string |
| OTHE-0005 | log_level | xsd:string |
| OTHE-0006 | phase | xsd:string |
| OTHE-0007 | retry_count | xsd:integer |
| OTHE-0008 | scheduled_at | xsd:dateTime |

**t_observation_precedes_other_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OTHE-0001 | OTHE-0001 | OTHE-0002 | 2023-06-01T02:07:24 |
| OTHE-0002 | OTHE-0001 | OTHE-0008 | 2024-03-08T22:48:06 |
| OTHE-0003 | OTHE-0001 | OTHE-0009 | 2024-11-20T05:59:50 |
| OTHE-0004 | OTHE-0002 | OTHE-0002 | 2024-10-01T01:54:05 |
| OTHE-0005 | OTHE-0002 | OTHE-0008 | 2023-05-04T16:55:24 |
| OTHE-0006 | OTHE-0002 | OTHE-0009 | 2025-04-07T12:49:05 |
| OTHE-0007 | OTHE-0003 | OTHE-0002 | 2025-01-06T09:52:42 |
| OTHE-0008 | OTHE-0003 | OTHE-0008 | 2024-04-17T14:38:04 |

**t_observation_precedes_other_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OTHE-0001 | OTHE-0001 | OTHE-0001 | 1684.40 |
| OTHE-0002 | OTHE-0002 | OTHE-0001 | 6255.67 |
| OTHE-0003 | OTHE-0003 | OTHE-0001 | 601.58 |
| OTHE-0004 | OTHE-0004 | OTHE-0001 | 5555.66 |
| OTHE-0005 | OTHE-0005 | OTHE-0001 | 2575.99 |
| OTHE-0006 | OTHE-0006 | OTHE-0001 | 3246.85 |
| OTHE-0007 | OTHE-0007 | OTHE-0001 | 663.52 |

**t_observation_precedes_other_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OTHE-0001 | OTHE-0001 | OTHE-0003 | 701 |
| OTHE-0002 | OTHE-0001 | OTHE-0007 | 352 |
| OTHE-0003 | OTHE-0002 | OTHE-0003 | 884 |
| OTHE-0004 | OTHE-0002 | OTHE-0007 | 291 |
| OTHE-0005 | OTHE-0003 | OTHE-0003 | 330 |
| OTHE-0006 | OTHE-0003 | OTHE-0007 | 402 |
| OTHE-0007 | OTHE-0004 | OTHE-0003 | 564 |
| OTHE-0008 | OTHE-0004 | OTHE-0007 | 418 |

**t_observation_precedes_other_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OTHE-0001 | OTHE-0001 | OTHE-0004 | node-a01 |
| OTHE-0002 | OTHE-0001 | OTHE-0005 | Log Level 02 |
| OTHE-0003 | OTHE-0001 | OTHE-0006 | execution |
| OTHE-0004 | OTHE-0001 | OTHE-0010 | pending |
| OTHE-0005 | OTHE-0001 | OTHE-0011 | Triggered By 05 |
| OTHE-0006 | OTHE-0002 | OTHE-0004 | worker-07 |
| OTHE-0007 | OTHE-0002 | OTHE-0005 | Log Level 07 |
| OTHE-0008 | OTHE-0002 | OTHE-0006 | execution |

Attribute metadata for these precedence relationships is defined in a separate attribute table that assigns a name and an XML Schema Definition type to each attribute. The attribute `duration_seconds` carries the type `xsd:decimal`, `end_time` is typed as `xsd:dateTime`, `exit_code` as `xsd:integer`, and `host_name` as `xsd:string`. This type discipline is enforced through four distinct value tables, each dedicated to a specific data type and linked back to the precedence records via an `entity_id` foreign key and an `attr_id` foreign key. The decimal value table stores measurements such as `1684.40` and `6255.67`; the integer value table holds codes like `701`, `352`, `884`, and `291`; the varchar value table contains identifiers and status strings including `node-a01`, `Log Level 02`, `execution`, and `pending`; and the datetime value table records timestamps such as `2023-06-01T02:07:24` and `2024-11-20T05:59:50`. This normalization by type ensures that each attribute value conforms to its declared schema, while the shared `entity_id` column ties all attribute values back to the same precedence assertion.

A parallel domain within the dataset concerns video surveillance in school environments. The surveillance activity table records operational activities—`AdminOffice`, `EastWing_Patrol`, `Gymnasium`, `ParkingLotA`—each identified by an `ACTI-` prefixed identifier. Every activity specifies a monitored location, such as `Courtyard`, `MainEntrance_Day`, `Gymnasium`, or `ParkingLot_Dusk_Rec`, and the surveillance device employed, ranging from `Fixed_Lens_Camera` and `IP_Overwatch_Node` to `Multi_Sensor_Array` and `Thermal_Array_Sensor`. The presence of `Gymnasium` in both the activity and monitoring columns suggests that certain locations support multiple surveillance operations, while the diversity of device types—from simple fixed-lens optics to thermal arrays—reflects the varying security requirements across different areas of the school environment.

**t_video_surveillance_activity**

| id | video_surveillance_activity | monitors | employs_device |
| --- | --- | --- | --- |
| ACTI-0001 | AdminOffice | Courtyard | Fixed_Lens_Camera |
| ACTI-0002 | EastWing_Patrol | MainEntrance_Day | IP_Overwatch_Node |
| ACTI-0003 | Gymnasium | Gymnasium | Multi_Sensor_Array |
| ACTI-0004 | ParkingLotA | ParkingLot_Dusk_Rec | Thermal_Array_Sensor |
| ACTI-0005 | Lobby_Morning_Clip | Playground_Activity | PTZ_Network_Cam |
| ACTI-0006 | Hallway_B2_Feed | Cafeteria_Lunch | Dome_IR_Unit |