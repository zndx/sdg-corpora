---
chapter_id: ch_live_outlier_claim_subclass_570bc7
topic_id: 92
family: 02_observation_measurement
cited_terms: ['outlier_claim_subclass', 'artifact_min_one_id', 'baseline_for_metric']
model: engine-refine
---

Outlier attribution, baseline calibration, and artifact stewardship in distributed monitoring environments depend on a compact set of relational primitives—identifier, license, location, role, subject, and target—that together establish what an entity is, where it may be used, who may act upon it, and how asserted relationships are directed. An identifier furnishes the durable handle by which records remain addressable across ingestion pipelines, audit logs, and cross-domain reconciliation without conflating semantically distinct assertions that share surface wording. In outlier-claim governance, identifiers such as CLAI-0001 through CLAI-0004 distinguish Network_Bandwidth_Spike, Patient_Vital_Anomaly, and Log_Flood_Event classifications even when two claims reference the same anomaly pattern; in metric baselining, METR-0001 through METR-0004 similarly separate Standard_Daylight_Cycle from Steady_State_Vibration so that downstream policy can bind obligations to specific records rather than to ambiguous labels.

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

**t_artifact_min_one_id**

| id | artifact | license | location |
| --- | --- | --- | --- |
| ONE-0001 | sensor-log-2023-10 | CC-BY-4.0 | us-east-1 |
| ONE-0002 | manifest-v1 | proprietary | eu-west-3 |
| ONE-0003 | manifest-v1 | CC-BY-4.0 | rack-7 |
| ONE-0004 | manifest-v1 | MIT | ap-south-2 |

**t_baseline_for_metric**

| id | baseline |
| --- | --- |
| METR-0001 | Standard_Daylight_Cycle |
| METR-0002 | Power_Consumption |
| METR-0003 | Structural_Stress |
| METR-0004 | Steady_State_Vibration |
| METR-0005 | Factory_A_NightShift |
| METR-0006 | Battery_Capacity |
| METR-0007 | Standard_Daylight_Cycle |

**t_baseline_for_metric_baseline_for**

| id | baseline_for |
| --- | --- |
| METR-0001 | Data_Ingestion_Rate |
| METR-0002 | Data_Ingestion_Rate |
| METR-0003 | Steady_State_Vibration |
| METR-0004 | Power_Consumption |
| METR-0005 | Battery_Capacity |
| METR-0006 | Steady_State_Vibration |

**t_baseline_for_metric__baseline_for**

| id | baseline_id | baseline_for_id | role |
| --- | --- | --- | --- |
| METR-0001 | METR-0007 | METR-0004 | owner |
| METR-0002 | METR-0002 | METR-0005 | contributor |
| METR-0003 | METR-0001 | METR-0005 | observer |
| METR-0004 | METR-0007 | METR-0003 | contributor |
| METR-0005 | METR-0007 | METR-0004 | contributor |
| METR-0006 | METR-0001 | METR-0002 | reviewer |
| METR-0007 | METR-0004 | METR-0006 | reviewer |
| METR-0008 | METR-0007 | METR-0002 | reviewer |

License and location attach compliance and operational constraints to material artifacts whose reuse, redistribution, and jurisdictional treatment must be explicit before automated systems may ingest or propagate them. License governs the legal and contractual envelope within which an artifact may be copied, transformed, or combined with other datasets; a sensor-log-2023-10 record released under CC-BY-4.0 permits attribution-bound reuse, whereas a manifest-v1 instance marked proprietary restricts derivative processing irrespective of technical accessibility. Location specifies the physical or regional placement that determines data-residency rules, latency envelopes, and failover behaviour: the same manifest-v1 may reside at eu-west-3 under CC-BY-4.0, at rack-7 under a different entitlement posture, or at ap-south-2 under MIT, demonstrating that identity of content does not imply identity of governance context and that compliance review must evaluate license and location jointly rather than inferring one from the other.

Role, subject, and target formalise directed accountability within relationship assertions where a simple pairwise link would be insufficient to record how an entity participates in an explanation or calibration chain. The subject denotes the entity that originates or bears responsibility for the assertion; the target denotes the domain, metric, or operational context to which that assertion applies; and role qualifies the nature of participation—whether ownership, review, contribution, or observation—so that workflow routing, escalation, and evidentiary weight can be assigned without re-deriving intent from unstructured narrative. Where an outlier claim states that Network_Bandwidth_Spike explains an anomaly observed in Automotive_Test_Drive, or that Power_Grid_Substation and Financial_Trading_Queue contexts receive distinct explanatory bindings, the subject–target pairing encodes directionality: the claim is not merely associated with a context but is asserted to explain anomaly behaviour within that context, a distinction material to root-cause analysis and to the defensibility of automated triage outcomes.

Junction-level subject, target, and role records refine entity-level statements when multiple participants interact across the same logical relationship type, preventing collapse of distinct governance postures into an undifferentiated graph edge. A claim identified as CLAI-0001 may participate as reviewer linking outlier CLAI-0005 to explains_anomaly_in CLAI-0002, while another record assigns the same claim identifier as observer over a different target pairing; conversely, CLAI-0003 and CLAI-0001 may both carry reviewer responsibility yet bind different outlier subjects to different anomaly contexts, illustrating that role is not an attribute of the claim label alone but of the directed triple in which the claim is embedded. Parallel structure appears in baseline governance: METR-0002 may contribute as subject toward baseline_for METR-0005 while METR-0007 contributes toward METR-0003, and METR-0001 holds owner responsibility over METR-0004 even when the underlying baseline vocabulary—Standard_Daylight_Cycle, Power_Consumption, Structural_Stress—overlaps across metrics such as Data_Ingestion_Rate and Steady_State_Vibration.

**t_outlier_claim_subclass_explains_anomaly_in**

| id | explains_anomaly_in |
| --- | --- |
| CLAI-0001 | Automotive_Test_Drive |
| CLAI-0002 | Automotive_Test_Drive |
| CLAI-0003 | Power_Grid_Substation |
| CLAI-0004 | Financial_Trading_Queue |
| CLAI-0005 | US_East_Data_Center |
| CLAI-0006 | Financial_Trading_Queue |

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

In operational practice, these primitives interoperate through separation of stable identity from mutable or contextual attributes, enabling systems to version explanatory claims and baselines without breaking referential integrity in downstream consumers. Identifiers anchor joins between entity tables and relationship tables; license and location gate whether artifacts referenced during anomaly investigation may cross organisational boundaries; and role-qualified subject–target edges supply the provenance granularity required for segregation of duties, whereby an owner may authorise baseline adoption, a contributor may supply calibration evidence, a reviewer may attest explanatory adequacy, and an observer may record concurrence without assuming liability for the underlying assertion. Failure to preserve any one primitive—reusing identifiers for distinct semantic objects, omitting license on outward-bound manifests, treating location as decorative metadata, or collapsing role into an undirected association—introduces compliance exposure and weakens the evidential chain on which automated outlier classification and metric normalisation depend.

Accordingly, identifier, license, location, role, subject, and target should be treated not as incidental schema labels but as the minimum governance vocabulary for attributable, auditable knowledge graphs in regulated and safety-critical monitoring domains. Their combined effect is to ensure that when a Log_Flood_Event claim is distinguished from repeated Network_Bandwidth_Spike assertions, when manifest-v1 is deployed under heterogeneous licenses across regions, or when Power_Consumption baselines are applied to Data_Ingestion_Rate versus Steady_State_Vibration with distinct contributor and owner roles, every automated inference remains traceable to a specific record, a specific entitlement, a specific placement, and a specific directed participation—conditions necessary for policy enforcement, for reproducible anomaly review, and for defensible operational decision-making under scrutiny.