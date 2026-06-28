---
chapter_id: ch_live_mass_function_equiv_frame_and_assignment_ef7751
topic_id: 42
family: 06_belief_structure
cited_terms: ['mass_function_equiv_frame_and_assignment', 'trace_min_one_span', 'transformation_not_recoverable']
model: engine-refine
---

The identifier column anchors every record in the evidence framework, providing a stable reference point across all operational tables. Identifiers such as ASSI-0001 through ASSI-0004 and SPAN-0001 through SPAN-0004 serve as the primary keys that enable cross-referencing between mass function assignments, attribute values, trace facts, and transformation records. The identifier ASSI-0001, for instance, links a corrosion rate measurement assigned over the terrain type catalog frame to a fault or failure target, while simultaneously connecting to decimal values like 0.002 and 724.48, a recorded timestamp of 2025-06-10T14:56:29, and string attributes including Dimension Kind 01 and Encoding 02. This single identifier thus binds together the mass assignment, its typed attributes, and their concrete values into a coherent evidence unit.

**t_mass_function_equiv_frame_and_assignment**

| id | mass | over_frame_of_discernment | assigns_mass_to |
| --- | --- | --- | --- |
| ASSI-0001 | corrosion_rate_measurement | terrain_type_catalog | fault_or_failure |
| ASSI-0002 | optical_transmittance_run | temperature_range | land_or_sea_only |
| ASSI-0003 | magnetic_offset_calibration | geographic_zone_map | degraded_state_only |
| ASSI-0004 | vibration_profile_test | temperature_range | degraded_state_only |
| ASSI-0005 | pressure_deviation_check | terrain_type_catalog | high_or_extreme_only |
| ASSI-0006 | vibration_profile_test | material_phase_index | degraded_state_only |

**t_mass_function_equiv_frame_and_assignment_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ASSI-0001 | confidence | xsd:decimal |
| ASSI-0002 | dimension_kind | xsd:string |
| ASSI-0003 | method | xsd:string |
| ASSI-0004 | recorded_at | xsd:dateTime |
| ASSI-0005 | uncertainty | xsd:decimal |
| ASSI-0006 | unit | xsd:string |
| ASSI-0007 | value | xsd:decimal |
| ASSI-0008 | encoding | xsd:string |

**t_mass_function_equiv_frame_and_assignment_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ASSI-0001 | ASSI-0001 | ASSI-0004 | 2025-06-10T14:56:29 |
| ASSI-0002 | ASSI-0002 | ASSI-0004 | 2024-06-25T12:59:02 |
| ASSI-0003 | ASSI-0003 | ASSI-0004 | 2024-03-24T16:20:19 |
| ASSI-0004 | ASSI-0004 | ASSI-0004 | 2025-03-04T17:25:44 |
| ASSI-0005 | ASSI-0005 | ASSI-0004 | 2024-07-15T05:15:18 |
| ASSI-0006 | ASSI-0006 | ASSI-0004 | 2023-09-16T23:06:46 |

**t_mass_function_equiv_frame_and_assignment_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ASSI-0001 | ASSI-0001 | ASSI-0001 | 0.002 |
| ASSI-0002 | ASSI-0001 | ASSI-0005 | 724.48 |
| ASSI-0003 | ASSI-0001 | ASSI-0007 | 469.73 |
| ASSI-0004 | ASSI-0002 | ASSI-0001 | 0.018 |
| ASSI-0005 | ASSI-0002 | ASSI-0005 | 449.10 |
| ASSI-0006 | ASSI-0002 | ASSI-0007 | 350.09 |
| ASSI-0007 | ASSI-0003 | ASSI-0001 | 0.405 |
| ASSI-0008 | ASSI-0003 | ASSI-0005 | 839.88 |

**t_mass_function_equiv_frame_and_assignment_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ASSI-0001 | ASSI-0001 | ASSI-0002 | Dimension Kind 01 |
| ASSI-0002 | ASSI-0001 | ASSI-0008 | Encoding 02 |
| ASSI-0003 | ASSI-0001 | ASSI-0009 | pre-release note |
| ASSI-0004 | ASSI-0001 | ASSI-0010 | fr |
| ASSI-0005 | ASSI-0001 | ASSI-0003 | manual |
| ASSI-0006 | ASSI-0001 | ASSI-0006 | kg |
| ASSI-0007 | ASSI-0002 | ASSI-0002 | Dimension Kind 07 |
| ASSI-0008 | ASSI-0002 | ASSI-0008 | Encoding 08 |

Attributes and their types form a schema layer that decouples metadata definitions from their stored values. The attr column captures the semantic name of each property—confidence, dimension_kind, method, recorded_at—while the attr_type column specifies the data type using XML Schema definitions such as xsd:decimal, xsd:string, and xsd:dateTime. This separation allows the system to store attribute values in dedicated type-specific tables: decimal values like 0.002 and 469.73 in the decimal store, timestamps such as 2024-06-25T12:59:02 and 2025-03-04T17:25:44 in the datetime store, and free-form strings like pre-release note and fr in the varchar store. The entity column in each value table references the identifier of the mass assignment record to which the attribute belongs, while the attr column points to the attribute definition, creating a normalized three-table structure that supports type-safe storage without schema migrations.

The category and spans columns organize operational trace data into meaningful groupings. The dim_spans dimension table assigns each span a label and a category—Spans Label 01 through Spans Label 04 mapped to Spans Category 01 through Spans Category 04—providing a classification layer that the fact_trace table references through its spans_key column. A trace record with identifier SPAN-0001 links to span SPAN-0005, while SPAN-0003 links to SPAN-0004, establishing a many-to-many relationship between trace events and their dimensional categories. This design enables aggregation and filtering of trace data by category without duplicating classification metadata within each trace record.

**dim_spans**

| id | spans_label | spans_category |
| --- | --- | --- |
| SPAN-0001 | Spans Label 01 | Spans Category 01 |
| SPAN-0002 | Spans Label 02 | Spans Category 02 |
| SPAN-0003 | Spans Label 03 | Spans Category 03 |
| SPAN-0004 | Spans Label 04 | Spans Category 04 |
| SPAN-0005 | Spans Label 05 | Spans Category 05 |
| SPAN-0006 | Spans Label 06 | Spans Category 06 |

Duration seconds, exit codes, and retry counts capture the execution characteristics of each trace event. Duration values range from 1874.27 seconds for SPAN-0001 to 3940.66 seconds for SPAN-0003, reflecting the variable computational load across different operations. Exit codes—491, 900, 420, and 60—indicate the termination status of each trace, with non-zero values signaling abnormal completion. Retry counts are notably high, with SPAN-0004 recording 459 retries and SPAN-0001 recording 399, suggesting that the underlying operations frequently require re-execution before reaching a terminal state. These three columns together provide a quantitative profile of operational reliability and performance.

**fact_trace**

| id | spans_key | duration_seconds | exit_code | retry_count |
| --- | --- | --- | --- | --- |
| SPAN-0001 | SPAN-0005 | 1874.27 | 491 | 399 |
| SPAN-0002 | SPAN-0002 | 2092.44 | 900 | 179 |
| SPAN-0003 | SPAN-0004 | 3940.66 | 420 | 396 |
| SPAN-0004 | SPAN-0006 | 3336.66 | 60 | 459 |

Scheduledat and triggeredby columns govern the lifecycle of non-recoverable transformations. The scheduledat column records when each transformation was planned—2023-05-27T08:30:46 for partition compaction with checksum verification, 2024-07-23T05:41:48 for log rotation with index defragmentation—while the triggeredby column identifies the initiation mechanism: event, manual, schedule, or api. Transformation pairs such as batch compaction with record purging and format conversion with index rebuild represent compound operations that cannot be undone, making the audit trail of scheduling and triggering essential for compliance and operational recovery. The transformation identifiers RECO-0001 through RECO-0004 provide stable references for tracking these irreversible operations across the system.

**t_transformation_not_recoverable**

| id | transformation | transformation_2 | scheduled_at | triggered_by |
| --- | --- | --- | --- | --- |
| RECO-0001 | partition compaction | checksum verification | 2023-05-27T08:30:46 | event |
| RECO-0002 | log rotation | index defragmentation | 2024-07-23T05:41:48 | manual |
| RECO-0003 | batch compaction | record purging | 2025-03-09T11:37:12 | schedule |
| RECO-0004 | format conversion | index rebuild | 2023-08-05T01:48:14 | api |
| RECO-0005 | format conversion | feature scaling | 2023-09-25T17:59:19 | manual |
| RECO-0006 | batch compaction | telemetry filtering | 2024-03-31T12:21:12 | event |
| RECO-0007 | snapshot commit | batch compaction | 2023-07-05T00:36:15 | schedule |
| RECO-0008 | index defragmentation | index defragmentation | 2025-04-13T18:22:12 | schedule |