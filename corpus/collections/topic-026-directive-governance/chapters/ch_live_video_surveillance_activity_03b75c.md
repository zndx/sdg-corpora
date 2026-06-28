---
chapter_id: ch_live_video_surveillance_activity_03b75c
topic_id: 26
family: 08_derived
cited_terms: ['video_surveillance_activity', 'belief_interval_equiv_bel_and_pl', 'evidence_basic']
model: engine-refine
---

In institutional surveillance governance, every monitored zone is catalogued as a discrete activity with a precise operational scope. A video surveillance activity such as EastWing_Patrol or ParkingLotA designates a specific security function, and each activity is bound to the physical environment it oversees—Courtyard, MainEntrance_Day, Gymnasium, or ParkingLot_Dusk_Rec—while simultaneously declaring which hardware it employs, from a Fixed_Lens_Camera to a Thermal_Array_Sensor or Multi_Sensor_Array. This triad of activity, environment, and device forms the foundational registry that auditors and operators consult to verify that every monitored space has an authorized camera, an assigned patrol pattern, and a documented chain of custody for the footage it generates.

**t_video_surveillance_activity**

| id | video_surveillance_activity | monitors | employs_device |
| --- | --- | --- | --- |
| ACTI-0001 | AdminOffice | Courtyard | Fixed_Lens_Camera |
| ACTI-0002 | EastWing_Patrol | MainEntrance_Day | IP_Overwatch_Node |
| ACTI-0003 | Gymnasium | Gymnasium | Multi_Sensor_Array |
| ACTI-0004 | ParkingLotA | ParkingLot_Dusk_Rec | Thermal_Array_Sensor |
| ACTI-0005 | Lobby_Morning_Clip | Playground_Activity | PTZ_Network_Cam |
| ACTI-0006 | Hallway_B2_Feed | Cafeteria_Lunch | Dome_IR_Unit |

Evidence collected through these surveillance channels is itself structured as first-class records. Each evidence item carries a dimension kind that classifies the nature of the measurement—temperature, count, or pressure—and an encoding that specifies the character set used to store the evidence payload, whether ascii, latin1, or utf8. A compliance checklist and a latency benchmark result may share the identifier EVID-0001 and EVID-0002 respectively, yet their dimension kinds diverge, reflecting that the same evidentiary category can encompass fundamentally different physical or operational quantities. The encoding field ensures that downstream systems can correctly parse and compare evidence records regardless of the originating sensor or data pipeline.

**t_evidence_basic**

| id | evidence | dimension_kind | encoding |
| --- | --- | --- | --- |
| EVID-0001 | Compliance checklist | temperature | ascii |
| EVID-0002 | Latency benchmark result | count | latin1 |
| EVID-0003 | Incident postmortem | temperature | utf8 |
| EVID-0004 | Compliance checklist | pressure | utf8 |
| EVID-0005 | Temperature spike alert | length | utf8 |

Beyond raw evidence, the system supports a belief-interval framework for reasoning about uncertain or incomplete information. Each belief record—identified by a code such as BEL-0001—captures a central belief value like signal_attenuation or thermal_runaway, along with a belief_lower_bound (extended_telemetry, non_contradictory_set) and a plausibility_upper_bound (ground_truth_marker, direct_observation_7). This structure allows analysts to express not just what they believe to be true, but the range of scenarios that remain plausible given the available data. The interval between belief and plausibility quantifies the epistemic uncertainty inherent in any surveillance-derived inference.

**t_belief_interval_equiv_bel_and_pl**

| id | belief | belief_lower_bound | plausibility_upper_bound |
| --- | --- | --- | --- |
| BEL-0001 | signal_attenuation | extended_telemetry | ground_truth_marker |
| BEL-0002 | thermal_runaway | non_contradictory_set | non_contradictory_set |
| BEL-0003 | latency_spike | potential_scenario_4 | direct_observation_7 |
| BEL-0004 | sensor_drift | indirect_indicator_beta | secondary_sensor_read |
| BEL-0005 | thermal_runaway | candidate_hypothesis | ground_truth_marker |
| BEL-0006 | calibration_failure | baseline_reference | extended_telemetry |
| BEL-0007 | data_corruption | potential_scenario_4 | secondary_sensor_read |
| BEL-0008 | packet_loss | primary_sensor_read | tentative_marker |

Attributes attach typed metadata to these belief records, enabling fine-grained provenance and quality tracking. The attribute schema defines names such as confidence, dimension_kind, method, and recorded_at, each bound to an XML Schema type—xsd:decimal for numeric confidence scores, xsd:string for categorical labels like Dimension Kind 01 or Encoding 02, and xsd:dateTime for timestamps such as 2025-01-05T17:59:26. Values are stored in type-specific tables: decimal values like 0.034 or 388.43 in the decimal store, string values like intake form or es in the varchar store, and datetime values in the datetime store. This normalization by type ensures that queries on confidence thresholds, dimension classifications, or recording timestamps each use the appropriate comparison semantics without cross-type coercion errors.

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

The identifier column serves as the universal key across all tables, linking surveillance activities to their environments and devices, binding evidence items to their dimension and encoding metadata, and anchoring belief records to their typed attribute values. An identifier such as ACTI-0001 or BEL-0001 is not merely a row handle; it is the referent that allows an auditor to trace a thermal_runaway belief back through its confidence score and recording timestamp, through the evidence items that support it, and ultimately to the specific surveillance activity and camera hardware that generated the underlying data. This traceability is the operational backbone of any compliance framework governing institutional surveillance.

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