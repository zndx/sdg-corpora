---
chapter_id: ch_live_annotation_basic_c6f199
topic_id: 26
family: 02_observation_measurement
cited_terms: ['annotation_basic', 'profile_of_dataset', 'video_surveillance_activity']
model: engine-refine
---

Surveillance operations generate structured records that capture both the activities being monitored and the metadata necessary to assess their reliability. Each surveillance event—whether an AdminOffice observation, an EastWing_Patrol patrol, a Gymnasium sweep, or a ParkingLotA check—is documented with a descriptive annotation such as a Lab sample preservation log, a Dataset quality flag, an Observation confidence score, or a Model versioning record. These annotations serve as the foundational identifiers for every recorded event, enabling downstream systems to trace back from a high-level activity to the precise data points that support it. The annotation framework ensures that every surveillance action carries its own provenance, making it possible to audit not just what was observed but how the observation was classified and what quality signals accompany it.

**t_annotation_basic**

| id | annotation |
| --- | --- |
| ANNO-0001 | Lab sample preservation log |
| ANNO-0002 | Dataset quality flag |
| ANNO-0003 | Observation confidence score |
| ANNO-0004 | Model versioning record |
| ANNO-0005 | Lab sample preservation log |
| ANNO-0006 | Temperature sensor calibration |
| ANNO-0007 | Observation confidence score |
| ANNO-0008 | Telemetry schema update |

**t_annotation_basic_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ANNO-0001 | ANNO-0001 | ANNO-0002 | Dimension Kind 01 |
| ANNO-0002 | ANNO-0001 | ANNO-0008 | Encoding 02 |
| ANNO-0003 | ANNO-0001 | ANNO-0009 | intake form |
| ANNO-0004 | ANNO-0001 | ANNO-0010 | fr |
| ANNO-0005 | ANNO-0001 | ANNO-0003 | automated |
| ANNO-0006 | ANNO-0001 | ANNO-0006 | ms |
| ANNO-0007 | ANNO-0002 | ANNO-0002 | Dimension Kind 07 |
| ANNO-0008 | ANNO-0002 | ANNO-0008 | Encoding 08 |

**t_video_surveillance_activity**

| id | video_surveillance_activity | monitors | employs_device |
| --- | --- | --- | --- |
| ACTI-0001 | AdminOffice | Courtyard | Fixed_Lens_Camera |
| ACTI-0002 | EastWing_Patrol | MainEntrance_Day | IP_Overwatch_Node |
| ACTI-0003 | Gymnasium | Gymnasium | Multi_Sensor_Array |
| ACTI-0004 | ParkingLotA | ParkingLot_Dusk_Rec | Thermal_Array_Sensor |
| ACTI-0005 | Lobby_Morning_Clip | Playground_Activity | PTZ_Network_Cam |
| ACTI-0006 | Hallway_B2_Feed | Cafeteria_Lunch | Dome_IR_Unit |

The attributes attached to each annotation provide the quantitative and categorical scaffolding that turns a raw record into an analyzable datum. An annotation like ANNO-0001, for instance, carries a confidence attribute typed as xsd:decimal with a measured value of 0.902, alongside a dimension_kind attribute recorded as Dimension Kind 01 and an encoding attribute set to Encoding 02. Other annotations store methodological metadata—intake form as a procedural descriptor, fr as a language or format code—and temporal markers such as 2023-10-01T01:18:56 or 2024-08-04T06:45:48, which anchor each record to a precise moment in the surveillance timeline. By separating attribute definitions from their values and further distinguishing value types into decimal, string, and dateTime buckets, the system supports heterogeneous data without sacrificing type safety or query efficiency.

**t_annotation_basic_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ANNO-0001 | confidence | xsd:decimal |
| ANNO-0002 | dimension_kind | xsd:string |
| ANNO-0003 | method | xsd:string |
| ANNO-0004 | recorded_at | xsd:dateTime |
| ANNO-0005 | uncertainty | xsd:decimal |
| ANNO-0006 | unit | xsd:string |
| ANNO-0007 | value | xsd:decimal |
| ANNO-0008 | encoding | xsd:string |

**t_annotation_basic_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ANNO-0001 | ANNO-0001 | ANNO-0004 | 2023-10-01T01:18:56 |
| ANNO-0002 | ANNO-0002 | ANNO-0004 | 2024-08-04T06:45:48 |
| ANNO-0003 | ANNO-0003 | ANNO-0004 | 2023-05-30T04:23:33 |
| ANNO-0004 | ANNO-0004 | ANNO-0004 | 2023-12-22T16:10:44 |
| ANNO-0005 | ANNO-0005 | ANNO-0004 | 2024-08-02T10:45:55 |
| ANNO-0006 | ANNO-0006 | ANNO-0004 | 2023-08-09T11:38:40 |
| ANNO-0007 | ANNO-0007 | ANNO-0004 | 2023-04-18T06:49:25 |
| ANNO-0008 | ANNO-0008 | ANNO-0004 | 2024-10-12T21:41:16 |

**t_annotation_basic_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ANNO-0001 | ANNO-0001 | ANNO-0001 | 0.902 |
| ANNO-0002 | ANNO-0001 | ANNO-0005 | 146.86 |
| ANNO-0003 | ANNO-0001 | ANNO-0007 | 292.49 |
| ANNO-0004 | ANNO-0002 | ANNO-0001 | 0.818 |
| ANNO-0005 | ANNO-0002 | ANNO-0005 | 591.53 |
| ANNO-0006 | ANNO-0002 | ANNO-0007 | 955.64 |
| ANNO-0007 | ANNO-0003 | ANNO-0001 | 0.553 |
| ANNO-0008 | ANNO-0003 | ANNO-0005 | 336.91 |

Profile records synthesize these granular annotations into higher-level assessments, each carrying a confidence score and an associated uncertainty measure that together quantify the reliability of the underlying data. A profile keyed as DATA-0005 might report a confidence of 0.994 paired with an uncertainty of 557.92 and a measured value of 380.57, while another profile under the same key could show a markedly lower confidence of 0.299 with uncertainty of 284.36 and a value of 728.94. This divergence within the same profile key illustrates how confidence and uncertainty operate independently: a high confidence score does not necessarily imply low uncertainty, and vice versa. Profiles are organized into categories—Profile Category 01 through 04, each with its own label such as Profile Label 01—that provide a taxonomic structure for grouping related assessments and enabling category-level rollups.

**fact_profile**

| id | profile_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| DATA-0001 | DATA-0005 | 0.299 | 284.36 | 728.94 |
| DATA-0002 | DATA-0005 | 0.994 | 557.92 | 380.57 |
| DATA-0003 | DATA-0003 | 0.773 | 622.09 | 607.36 |
| DATA-0004 | DATA-0006 | 0.226 | 488.10 | 448.09 |

**dim_profile_category**

| id | category_name |
| --- | --- |
| DATA-0001 | Category Name 01 |
| DATA-0002 | Category Name 02 |
| DATA-0003 | Category Name 03 |
| DATA-0004 | Category Name 04 |
| DATA-0005 | Category Name 05 |
| DATA-0006 | Category Name 06 |

**dim_profile**

| id | profile_label | profile_category | category_id |
| --- | --- | --- | --- |
| DATA-0001 | Profile Label 01 | Profile Category 01 | DATA-0004 |
| DATA-0002 | Profile Label 02 | Profile Category 02 | DATA-0006 |
| DATA-0003 | Profile Label 03 | Profile Category 03 | DATA-0005 |
| DATA-0004 | Profile Label 04 | Profile Category 04 | DATA-0001 |
| DATA-0005 | Profile Label 05 | Profile Category 05 | DATA-0002 |
| DATA-0006 | Profile Label 06 | Profile Category 06 | DATA-0004 |
| DATA-0007 | Profile Label 07 | Profile Category 07 | DATA-0002 |

The surveillance infrastructure itself is modeled through the relationship between activities, monitoring locations, and the devices that enable them. An EastWing_Patrol activity monitors the Courtyard and employs a Fixed_Lens_Camera, while a ParkingLotA activity targets the ParkingLot_Dusk_Rec zone using a Thermal_Array_Sensor. More sophisticated deployments pair a Gymnasium activity with a Multi_Sensor_Array, and an IP_Overwatch_Node supports the MainEntrance_Day monitoring function. This triad of activity, location, and device creates a traceable chain from operational intent to hardware implementation, ensuring that every surveillance action can be audited for both its procedural correctness and its technical adequacy. The combination of annotation-level confidence scores, profile-level uncertainty metrics, and device-level capability data forms a comprehensive quality assurance framework that supports both real-time operational decisions and post-hoc compliance reviews.