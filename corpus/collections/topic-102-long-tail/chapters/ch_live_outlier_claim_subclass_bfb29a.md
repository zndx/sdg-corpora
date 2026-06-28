---
chapter_id: ch_live_outlier_claim_subclass_bfb29a
topic_id: 102
family: 02_observation_measurement
cited_terms: ['outlier_claim_subclass', 'trace_with_service_name', 'annotation_classifies_class']
model: engine-refine
---

Classification frameworks in operational telemetry rely on a disciplined separation between the entities being classified and the attributes assigned to them. At the core of this architecture, the classification dimension provides a categorical taxonomy—each entry carrying a label and a category designation that together establish the semantic universe within which observations are interpreted. An annotation record then binds a classification key to a measured value while simultaneously expressing both the confidence with which that classification applies and the uncertainty surrounding the measurement itself. A confidence of 0.845 paired with an uncertainty of 690.59 and a value of 979.94 signals a high-certainty assessment of a substantial magnitude, whereas a confidence of 0.236 against an uncertainty of 593.98 and a value of 370.63 reflects a tentative classification of moderate scale. The inverse relationship between confidence and uncertainty is not mechanical—confidence of 0.271 with uncertainty 104.01 and value 360.27 demonstrates that low confidence can coexist with relatively tight uncertainty bounds, a pattern that warrants investigation in its own right.

**dim_classifies**

| id | classifies_label | classifies_category |
| --- | --- | --- |
| CLAS-0001 | Classifies Label 01 | Classifies Category 01 |
| CLAS-0002 | Classifies Label 02 | Classifies Category 02 |
| CLAS-0003 | Classifies Label 03 | Classifies Category 03 |
| CLAS-0004 | Classifies Label 04 | Classifies Category 04 |
| CLAS-0005 | Classifies Label 05 | Classifies Category 05 |
| CLAS-0006 | Classifies Label 06 | Classifies Category 06 |

The identifier serves as the immutable anchor across all these relationships, a stable reference that persists regardless of how classifications shift or how roles evolve. Outlier claims such as CLAI-0001, CLAI-0002, CLAI-0003, and CLAI-0004 each carry distinct anomaly signatures—Network_Bandwidth_Spike, Patient_Vital_Anomaly, Network_Bandwidth_Spike, and Log_Flood_Event respectively—yet their identifiers remain the constant through which every downstream association is resolved. Similarly, trace identifiers like NAME-0001 through NAME-0004 anchor operational artifacts such as notif-send-8876, inventory-sync-2290, payment-proc-4451, and api-gateway-991 to their corresponding service names, which include inventory-db, order-processor, metrics-collector, and search-engine. This identifier discipline ensures that no matter how many classification layers or relationship mappings are applied, the provenance of each datum remains traceable.

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

**t_trace_with_service_name**

| id | trace |
| --- | --- |
| NAME-0001 | notif-send-8876 |
| NAME-0002 | inventory-sync-2290 |
| NAME-0003 | payment-proc-4451 |
| NAME-0004 | api-gateway-991 |
| NAME-0005 | cache-warm-5502 |
| NAME-0006 | payment-proc-4451 |

**t_trace_with_service_name_service_name**

| id | service_name |
| --- | --- |
| NAME-0001 | inventory-db |
| NAME-0002 | order-processor |
| NAME-0003 | metrics-collector |
| NAME-0004 | search-engine |
| NAME-0005 | logging-agent |
| NAME-0006 | logging-agent |
| NAME-0007 | config-server |
| NAME-0008 | inventory-db |

Subject and target form the fundamental dyad of relational semantics, appearing in junction tables that model how one entity acts upon or relates to another. In the outlier domain, an outlier claim identified as CLAI-0005 may serve as the subject that explains an anomaly in the target CLAI-0002, while CLAI-0001 may explain anomalies in both CLAI-0005 and CLAI-0006. In the trace domain, trace NAME-0001 acts as subject toward service NAME-0005, and trace NAME-0004 acts as subject toward service NAME-0007. The subject-target pairing is never arbitrary; it encodes a directional dependency that can be further qualified by a role attribute, which specifies the nature of the relationship from the subject's perspective.

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

**t_trace_with_service_name__service_name**

| id | trace_id | service_name_id | role |
| --- | --- | --- | --- |
| NAME-0001 | NAME-0001 | NAME-0005 | observer |
| NAME-0002 | NAME-0005 | NAME-0007 | observer |
| NAME-0003 | NAME-0004 | NAME-0007 | owner |
| NAME-0004 | NAME-0001 | NAME-0006 | reviewer |
| NAME-0005 | NAME-0002 | NAME-0004 | observer |
| NAME-0006 | NAME-0003 | NAME-0008 | observer |
| NAME-0007 | NAME-0006 | NAME-0002 | contributor |
| NAME-0008 | NAME-0003 | NAME-0008 | reviewer |

The role attribute—taking values such as reviewer, owner, and observer—adds a layer of governance semantics to the subject-target relationship. When CLAI-0001 assumes the role of reviewer over CLAI-0005, the relationship carries different operational implications than when CLAI-0001 assumes the role of observer over CLAI-0006. In the trace-to-service mapping, the same pattern holds: NAME-0001 appears as observer of NAME-0005, as reviewer of NAME-0006, and NAME-0004 appears as owner of NAME-0007. These role distinctions are critical for access control, audit trails, and incident response workflows, as they determine who is accountable for a given relationship and who is merely monitoring it.

The misc column in the annotation table captures residual or auxiliary data that does not fit neatly into the structured classification schema. The value field, holding measurements such as 979.94, 370.63, 360.27, and 284.47, represents the quantitative substance of each annotation—the actual signal that the classification framework is attempting to interpret. Together with confidence and uncertainty, these values form a triad that any operational analyst must weigh when determining whether an anomaly warrants escalation. A classification with high confidence but extreme uncertainty, or one with moderate confidence and moderate uncertainty, demands different response strategies, and the misc value provides the contextual magnitude that makes such distinctions actionable.

**fact_annotation**

| id | classifies_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| CLAS-0001 | CLAS-0001 | 0.845 | 690.59 | 979.94 |
| CLAS-0002 | CLAS-0006 | 0.236 | 593.98 | 370.63 |
| CLAS-0003 | CLAS-0001 | 0.271 | 104.01 | 360.27 |
| CLAS-0004 | CLAS-0002 | 0.303 | 22.02 | 284.47 |
| CLAS-0005 | CLAS-0005 | 0.002 | 328.54 | 25.47 |