---
chapter_id: ch_live_outlier_claim_subclass_067342
topic_id: 102
family: 02_observation_measurement
cited_terms: ['outlier_claim_subclass', 'kernel_event_with_comm', 'aggregation_over_time_window']
model: engine-refine
---

In operational telemetry and anomaly-resolution frameworks, every observation is anchored by a unique identifier that serves as the immutable reference point across all downstream analyses. Outlier claims such as CLAI-0001 through CLAI-0004 carry distinct anomaly signatures—Network_Bandwidth_Spike, Patient_Vital_Anomaly, Log_Flood_Event—each of which must be traced to the operational context it explains. The claim CLAI-0001, for instance, is associated with a Network_Bandwidth_Spike that is subsequently mapped to the Automotive_Test_Drive environment, while CLAI-0003, bearing the same anomaly type, is explained within the Power_Grid_Substation context. This separation of anomaly classification from contextual explanation is intentional: the same signal type can originate in one domain and be investigated in another, and the relational structure preserves that distinction without conflating cause with venue.

**t_outlier_claim_subclass**

| id | outlier |
| --- | --- |
| CLAI-0001 | Network_Bandwidth_Spike |
| CLAI-0002 | Patient_Vital_Anomaly |
| CLAI-0003 | Network_Bandwidth_Spike |
| CLAI-0004 | Log_Flood_Event |
| CLAI-0005 | Patient_Vital_Anomaly |
| CLAI-0006 | Elevator_Vibration_Spike |
| CLAI-0007 | Reactor_Core_Temp_Peak |

**t_outlier_claim_subclass_explains_anomaly_in**

| id | explains_anomaly_in |
| --- | --- |
| CLAI-0001 | Automotive_Test_Drive |
| CLAI-0002 | Automotive_Test_Drive |
| CLAI-0003 | Power_Grid_Substation |
| CLAI-0004 | Financial_Trading_Queue |
| CLAI-0005 | US_East_Data_Center |
| CLAI-0006 | Financial_Trading_Queue |

The explanatory linkage between outlier claims and their target contexts is mediated through a junction construct that encodes not merely which claim explains which context, but the nature of that relationship. In the mapping table, CLAI-0001 appears as the subject explaining CLAI-0005 and CLAI-0006 with roles of reviewer and observer respectively, while CLAI-0005 and CLAI-0006 themselves serve as subjects explaining CLAI-0002 with roles of reviewer and owner. The role attribute—reviewer, owner, observer—functions as a relationship qualifier that determines downstream workflow routing: an owner bears accountability for remediation, a reviewer validates the explanation, and an observer receives notification without action authority. This tripartite role model ensures that every cross-entity linkage carries an explicit governance posture.

**t_outlier_claim_subclass__explains_anomaly_in**

| id | outlier_id | explains_anomaly_in_id | role |
| --- | --- | --- | --- |
| CLAI-0001 | CLAI-0005 | CLAI-0002 | reviewer |
| CLAI-0002 | CLAI-0006 | CLAI-0002 | owner |
| CLAI-0003 | CLAI-0001 | CLAI-0005 | reviewer |
| CLAI-0004 | CLAI-0001 | CLAI-0006 | observer |
| CLAI-0005 | CLAI-0007 | CLAI-0002 | owner |
| CLAI-0006 | CLAI-0005 | CLAI-0004 | observer |
| CLAI-0007 | CLAI-0003 | CLAI-0005 | owner |
| CLAI-0008 | CLAI-0002 | CLAI-0001 | owner |

Process communication facts are captured in a kernel fact table where each record is identified by a communication key such as COMM-0001 through COMM-0004 and linked to a parent process via the with_process_comm_key column, which itself references entries like COMM-0007 and COMM-0004. The duration_seconds column records elapsed time with sub-second precision—5315.83 seconds for COMM-0001, 6644.30 for COMM-0002, 4698.54 for COMM-0003, and 3561.41 for COMM-0004—enabling latency profiling across process hierarchies. Exit codes (769, 229, 332, 253) encode termination status, while retry_count values (436, 251, 190, 14) quantify resilience behavior; a retry count of 436 accompanying exit code 769 suggests a persistent failure mode that warrants investigation, whereas 14 retries with exit code 253 may indicate a transient condition that resolved.

**fact_kernel**

| id | with_process_comm_key | duration_seconds | exit_code | retry_count |
| --- | --- | --- | --- | --- |
| COMM-0001 | COMM-0007 | 5315.83 | 769 | 436 |
| COMM-0002 | COMM-0004 | 6644.30 | 229 | 251 |
| COMM-0003 | COMM-0008 | 4698.54 | 332 | 190 |
| COMM-0004 | COMM-0004 | 3561.41 | 253 | 14 |
| COMM-0005 | COMM-0001 | 6092.67 | 910 | 352 |
| COMM-0006 | COMM-0002 | 6729.90 | 888 | 269 |
| COMM-0007 | COMM-0006 | 814.76 | 674 | 214 |
| COMM-0008 | COMM-0008 | 2447.90 | 247 | 434 |

Aggregation metrics over time windows introduce a multi-typed attribute model where each aggregation—RealTimeClusterLoad, MonthlyThroughputMetric, AnnualCapacityForecast—is associated with a time window such as MonthlySettlement, TrailingSevenDays, or BusinessHours. The attribute definitions table assigns typed descriptors to each aggregation: confidence carries the type xsd:decimal, dimension_kind and method are xsd:string, and recorded_at is xsd:dateTime. This type discipline is enforced through value tables partitioned by data type. Decimal values like 0.781, 86.18, and 786.35 populate the decimal value table, datetime values such as 2023-08-23T11:54:15 and 2025-01-03T19:33:06 populate the datetime table, and string values including Dimension Kind 01, Encoding 02, pre-release note, and en populate the varchar table. Each value row references an entity_id and an attr_id, establishing that the entity is the measured resource and the attribute is the measured property.

**t_aggregation_over_time_window**

| id | aggregation | over_time_window |
| --- | --- | --- |
| WIND-0001 | RealTimeClusterLoad | MonthlySettlement |
| WIND-0002 | MonthlyThroughputMetric | MonthlySettlement |
| WIND-0003 | AnnualCapacityForecast | TrailingSevenDays |
| WIND-0004 | AnnualCapacityForecast | BusinessHours |
| WIND-0005 | RealTimeClusterLoad | BusinessHours |
| WIND-0006 | AnnualCapacityForecast | Sliding24Hour |

**t_aggregation_over_time_window_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| WIND-0001 | confidence | xsd:decimal |
| WIND-0002 | dimension_kind | xsd:string |
| WIND-0003 | method | xsd:string |
| WIND-0004 | recorded_at | xsd:dateTime |
| WIND-0005 | uncertainty | xsd:decimal |
| WIND-0006 | unit | xsd:string |
| WIND-0007 | value | xsd:decimal |
| WIND-0008 | encoding | xsd:string |

**t_aggregation_over_time_window_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| WIND-0001 | WIND-0001 | WIND-0004 | 2023-08-23T11:54:15 |
| WIND-0002 | WIND-0002 | WIND-0004 | 2023-06-25T19:59:38 |
| WIND-0003 | WIND-0003 | WIND-0004 | 2025-01-03T19:33:06 |
| WIND-0004 | WIND-0004 | WIND-0004 | 2023-03-02T05:31:47 |
| WIND-0005 | WIND-0005 | WIND-0004 | 2023-12-24T17:32:49 |
| WIND-0006 | WIND-0006 | WIND-0004 | 2023-09-12T03:58:46 |

**t_aggregation_over_time_window_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| WIND-0001 | WIND-0001 | WIND-0001 | 0.781 |
| WIND-0002 | WIND-0001 | WIND-0005 | 86.18 |
| WIND-0003 | WIND-0001 | WIND-0007 | 786.35 |
| WIND-0004 | WIND-0002 | WIND-0001 | 0.307 |
| WIND-0005 | WIND-0002 | WIND-0005 | 190.14 |
| WIND-0006 | WIND-0002 | WIND-0007 | 820.39 |
| WIND-0007 | WIND-0003 | WIND-0001 | 0.604 |
| WIND-0008 | WIND-0003 | WIND-0005 | 847.59 |

**t_aggregation_over_time_window_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| WIND-0001 | WIND-0001 | WIND-0002 | Dimension Kind 01 |
| WIND-0002 | WIND-0001 | WIND-0008 | Encoding 02 |
| WIND-0003 | WIND-0001 | WIND-0009 | pre-release note |
| WIND-0004 | WIND-0001 | WIND-0010 | en |
| WIND-0005 | WIND-0001 | WIND-0003 | manual |
| WIND-0006 | WIND-0001 | WIND-0006 | kg |
| WIND-0007 | WIND-0002 | WIND-0002 | Dimension Kind 07 |
| WIND-0008 | WIND-0002 | WIND-0008 | Encoding 08 |

The entity column in the value tables serves as the foreign key back to the aggregation-over-time-window dimension, ensuring that every decimal, datetime, or varchar measurement can be traced to a specific aggregation and time window. The misc column in the value tables holds the actual measurement value, while the dim_with_process_comm dimension table provides categorical labels—With Process Comm Category 01 through 04—and descriptive labels—With Process Comm Label 01 through 04—that classify process communications independently of their factual duration and exit behavior. This separation of classification from measurement allows the same category to be applied across multiple process communications without duplicating metadata, and enables category-level rollups that aggregate duration_seconds and retry_count across all communications sharing a given category.

**dim_with_process_comm**

| id | with_process_comm_label | with_process_comm_category |
| --- | --- | --- |
| COMM-0001 | With Process Comm Label 01 | With Process Comm Category 01 |
| COMM-0002 | With Process Comm Label 02 | With Process Comm Category 02 |
| COMM-0003 | With Process Comm Label 03 | With Process Comm Category 03 |
| COMM-0004 | With Process Comm Label 04 | With Process Comm Category 04 |
| COMM-0005 | With Process Comm Label 05 | With Process Comm Category 05 |
| COMM-0006 | With Process Comm Label 06 | With Process Comm Category 06 |
| COMM-0007 | With Process Comm Label 07 | With Process Comm Category 07 |
| COMM-0008 | With Process Comm Label 08 | With Process Comm Category 08 |