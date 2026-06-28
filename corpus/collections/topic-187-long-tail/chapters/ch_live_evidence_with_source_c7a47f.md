---
chapter_id: ch_live_evidence_with_source_c7a47f
topic_id: 187
family: 06_belief_structure
cited_terms: ['evidence_with_source', 'lane_compliance_behavior', 'outlier_detection_uses_explainer']
model: engine-refine
---

Compliance and operational data management relies on a disciplined separation of behavioral records, their contextual attributes, and the evidence that substantiates them. At the core of this architecture, the identifier column serves as the primary key across all entities, ensuring unambiguous record resolution whether one is tracing a lane compliance behavior such as I-280 Express Lane or SR-520 Toll, or following an evidence source like a Q3 Compliance Audit or NIST Cybersecurity Framework back to its originating document. The identifier values—SOUR-0001 through SOUR-0004 for evidence records, BEHA-0001 through BEHA-0004 for behavioral records, and EXPL-0001 through EXPL-0004 for outlier facts—establish a consistent naming convention that permits cross-referencing without ambiguity. Each identifier anchors a row in its respective table, and through foreign-key relationships, these anchors propagate outward to connect operators, street types, and usage dimensions into a coherent relational graph.

**t_lane_compliance_behavior**

| id | lane_compliance_behavior |
| --- | --- |
| BEHA-0001 | I-280 Express Lane |
| BEHA-0002 | I-70 Eastbound |
| BEHA-0003 | SR-520 Toll |
| BEHA-0004 | Route 128 North |
| BEHA-0005 | I-70 Eastbound |
| BEHA-0006 | Highway 401 Inner |

**t_lane_compliance_behavior_involves_operator**

| id | involves_operator |
| --- | --- |
| BEHA-0001 | Heavy Haul Supervisor |
| BEHA-0002 | Delivery Van Operator |
| BEHA-0003 | Autonomous Fleet Unit |
| BEHA-0004 | RideShare Driver |
| BEHA-0005 | RideShare Driver |
| BEHA-0006 | Logistics Coordinator |
| BEHA-0007 | Autonomous Fleet Unit |

**t_lane_compliance_behavior__involves_operator**

| id | lane_id | involves_operator_id | role |
| --- | --- | --- | --- |
| BEHA-0001 | BEHA-0002 | BEHA-0005 | reviewer |
| BEHA-0002 | BEHA-0006 | BEHA-0001 | reviewer |
| BEHA-0003 | BEHA-0005 | BEHA-0005 | owner |
| BEHA-0004 | BEHA-0002 | BEHA-0003 | owner |
| BEHA-0005 | BEHA-0003 | BEHA-0006 | owner |
| BEHA-0006 | BEHA-0003 | BEHA-0007 | contributor |
| BEHA-0007 | BEHA-0003 | BEHA-0006 | contributor |
| BEHA-0008 | BEHA-0002 | BEHA-0007 | observer |

**t_lane_compliance_behavior_occurs_on_street_type**

| id | occurs_on_street_type |
| --- | --- |
| BEHA-0001 | Tunnel Approach Lane |
| BEHA-0002 | Urban Signalized Intersection |
| BEHA-0003 | Highway Work Zone |
| BEHA-0004 | Bridge Deck Section |
| BEHA-0005 | Rural Interstate Highway |
| BEHA-0006 | Urban Signalized Intersection |

The lane compliance behavior domain captures how specific traffic lanes are governed and monitored, with behaviors ranging from I-280 Express Lane to Route 128 North, each occurring on distinct street types such as Tunnel Approach Lane, Highway Work Zone, or Bridge Deck Section. The relationship between a compliance behavior and the street type on which it occurs is mediated through a junction table that carries both a role and a cardinality note, thereby encoding not merely which street type applies but the nature and multiplicity of that application. A reviewer role might attach to a cardinality note labeled Cardinality Note 01, while an owner role could be associated with Cardinality Note 03, signaling that the same behavioral record may participate in multiple street-type associations with different governance responsibilities and multiplicity constraints. Similarly, the operator involvement junction table links a lane compliance behavior to an operator—such as a Heavy Haul Supervisor, Autonomous Fleet Unit, or RideShare Driver—under a role designation of either reviewer or owner, establishing a clear accountability chain for each behavioral instance.

**t_lane_compliance_behavior__occurs_on_street_type**

| id | lane_id | occurs_on_street_type_id | role | cardinality_note |
| --- | --- | --- | --- | --- |
| BEHA-0001 | BEHA-0003 | BEHA-0006 | observer | Cardinality Note 01 |
| BEHA-0002 | BEHA-0004 | BEHA-0002 | observer | Cardinality Note 02 |
| BEHA-0003 | BEHA-0002 | BEHA-0001 | owner | Cardinality Note 03 |
| BEHA-0004 | BEHA-0001 | BEHA-0005 | reviewer | Cardinality Note 04 |
| BEHA-0005 | BEHA-0001 | BEHA-0006 | observer | Cardinality Note 05 |
| BEHA-0006 | BEHA-0001 | BEHA-0003 | contributor | Cardinality Note 06 |
| BEHA-0007 | BEHA-0004 | BEHA-0006 | contributor | Cardinality Note 07 |
| BEHA-0008 | BEHA-0006 | BEHA-0004 | observer | Cardinality Note 08 |

Evidence records provide the documentary foundation for compliance assertions, with each record containing an evidence field that might hold OpenTelemetry Collector, GitHub Actions Workflow, or Phase II Clinical Summary, alongside an evidence_source field referencing the originating document such as a Lab Batch Validation Report or Q3 Compliance Audit. The label_text column—intake form, calibration record—classifies the type of documentary artifact, while the language column (fr, ja, en) captures the linguistic context of the source material. These evidence records are not merely archival; they form the evidentiary basis against which lane compliance behaviors are evaluated, and their identifiers are referenced through foreign keys in downstream analytical tables to maintain traceability from observation to source.

**t_evidence_with_source**

| id | evidence | evidence_source | label_text | language |
| --- | --- | --- | --- | --- |
| SOUR-0001 | OpenTelemetry Collector | Q3 Compliance Audit | intake form | fr |
| SOUR-0002 | GitHub Actions Workflow | Lab Batch Validation Report | intake form | ja |
| SOUR-0003 | Network Latency Benchmark | NIST Cybersecurity Framework | calibration record | en |
| SOUR-0004 | Phase II Clinical Summary | Lab Batch Validation Report | intake form | fr |
| SOUR-0005 | Data Pipeline Integrity Check | Infrastructure Capacity Forecast | calibration record | es |
| SOUR-0006 | Incident Root Cause Analysis | SOC 2 Audit Report | calibration record | en |

Operational outlier tracking introduces a fact table that records anomalous execution events, each identified by an identifier such as EXPL-0001 and linked to a usage dimension through a uses_key foreign key. The fact_outlier table captures three quantitative dimensions of each outlier event: duration_seconds, which ranges from 1182.39 seconds for EXPL-0004 to 6466.78 seconds for EXPL-0002; exit_code, with values including 760, 4, 490, and 124 indicating distinct failure modalities; and retry_count, spanning from 101 retries for EXPL-0003 to 308 retries for EXPL-0004. The uses_key column references the dim_uses dimension table, which supplies a misc label (Uses Label 01 through Uses Label 04) and a category (Uses Category 01 through Uses Category 04) for each usage type, thereby enriching the outlier record with semantic context about what resource or service was involved in the anomalous execution. This dimensional join enables analysts to aggregate outlier statistics not only by duration and retry frequency but also by the categorical classification of the affected resource, supporting root-cause analysis that distinguishes between systemic failures and isolated incidents.

**fact_outlier**

| id | uses_key | duration_seconds | exit_code | retry_count |
| --- | --- | --- | --- | --- |
| EXPL-0001 | EXPL-0003 | 3360.34 | 760 | 293 |
| EXPL-0002 | EXPL-0003 | 6466.78 | 4 | 225 |
| EXPL-0003 | EXPL-0002 | 5282.09 | 490 | 101 |
| EXPL-0004 | EXPL-0005 | 1182.39 | 124 | 308 |
| EXPL-0005 | EXPL-0002 | 3041.72 | 808 | 59 |
| EXPL-0006 | EXPL-0004 | 3852.38 | 619 | 489 |
| EXPL-0007 | EXPL-0002 | 1453.07 | 682 | 1 |

**dim_uses**

| id | uses_label | uses_category |
| --- | --- | --- |
| EXPL-0001 | Uses Label 01 | Uses Category 01 |
| EXPL-0002 | Uses Label 02 | Uses Category 02 |
| EXPL-0003 | Uses Label 03 | Uses Category 03 |
| EXPL-0004 | Uses Label 04 | Uses Category 04 |
| EXPL-0005 | Uses Label 05 | Uses Category 05 |
| EXPL-0006 | Uses Label 06 | Uses Category 06 |