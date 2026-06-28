---
chapter_id: ch_live_audit_with_findings_04b021
topic_id: 14
family: 03_directive_governance
cited_terms: ['audit_with_findings', 'backward_compatible_with', 'baseline_for_metric']
model: engine-refine
---

The governance of technical assessments relies upon a structured taxonomy of identifiers that anchor every finding, compatibility claim, and baseline measurement to a verifiable record. Each audit engagement produces a discrete finding—FIND-0001 through FIND-0004—each of which is associated with a specific assessment type, such as the HIPAA Security Assessment, the Data Lake Governance Review, the SOC 2 Type II Review, or the ISO 27001 Certification. These identifiers are not merely labels; they serve as the primary key through which all downstream relationships are resolved. A single finding may reference one or more backward compatibility claims (WITH-0001 through WITH-0004), and each compatibility claim, in turn, declares both a source version—gRPC 1.50, Terraform v1.4, Kafka 2.8, Rust 1.50—and a target version to which it remains compatible, such as OpenTelemetry 1.10 or Avro 1.9. The same pattern holds for metric baselines: identifiers METR-0001 through METR-0004 link baseline standards like Standard_Daylight_Cycle, Power_Consumption, Structural_Stress, and Steady_State_Vibration to the metrics they govern, including Data_Ingestion_Rate, Steady_State_Vibration, and Power_Consumption.

**t_backward_compatible_with**

| id | backward |
| --- | --- |
| WITH-0001 | gRPC 1.50 |
| WITH-0002 | Terraform v1.4 |
| WITH-0003 | Kafka 2.8 |
| WITH-0004 | Rust 1.50 |
| WITH-0005 | gRPC 1.50 |
| WITH-0006 | gRPC 1.27 |
| WITH-0007 | Parquet 2.0 |
| WITH-0008 | OAuth 1.0 |

**t_backward_compatible_with_backward_compatible_with**

| id | backward_compatible_with |
| --- | --- |
| WITH-0001 | OpenTelemetry 1.10 |
| WITH-0002 | Avro 1.9 |
| WITH-0003 | Kafka 2.8 |
| WITH-0004 | Avro 1.9 |
| WITH-0005 | Parquet 2.0 |
| WITH-0006 | Parquet 2.0 |
| WITH-0007 | Terraform v0.13 |

**t_backward_compatible_with__backward_compatible_with**

| id | backward_id | backward_compatible_with_id | role |
| --- | --- | --- | --- |
| WITH-0001 | WITH-0001 | WITH-0005 | observer |
| WITH-0002 | WITH-0007 | WITH-0007 | observer |
| WITH-0003 | WITH-0005 | WITH-0001 | owner |
| WITH-0004 | WITH-0008 | WITH-0005 | observer |
| WITH-0005 | WITH-0002 | WITH-0002 | reviewer |
| WITH-0006 | WITH-0008 | WITH-0006 | reviewer |
| WITH-0007 | WITH-0004 | WITH-0004 | owner |
| WITH-0008 | WITH-0008 | WITH-0001 | observer |

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

The subject and target columns formalize the directionality of every relationship in the system. In the backward compatibility registry, a subject such as WITH-0001 points to a target like WITH-0005, establishing that the source artifact is compatible with the target artifact. Similarly, in the baseline-to-metric mapping, a subject baseline (METR-0007, METR-0002, METR-0001) is declared as governing a target metric (METR-0004, METR-0005, METR-0003). This subject-to-target orientation is critical for traceability: it allows an auditor to follow a finding backward through its compatibility claims to the underlying version constraints, or forward through its baseline references to the operational metrics it constrains. The directionality is not assumed; it is explicitly encoded in the schema, ensuring that every dependency can be queried in both directions without ambiguity.

The role column further qualifies the relationship between subject and target, distinguishing between owner, contributor, and observer designations. In the backward compatibility graph, the role observer appears in three of four recorded relationships (WITH-0001, WITH-0002, WITH-0004), indicating that the subject artifact passively references the target without asserting ownership over it. The role owner appears once (WITH-0003), signifying a direct governance relationship where the subject baseline actively defines the target metric. This distinction matters in compliance contexts: an owner relationship implies accountability for the target's correctness, whereas an observer relationship implies awareness without responsibility. The same role taxonomy applies across both the compatibility and baseline registries, providing a consistent vocabulary for assigning accountability across heterogeneous relationship types.

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

Execution context for audit findings is captured through two operational dimensions: duration and host. The duration_seconds field records the elapsed time of each assessment in seconds, ranging from 1140.43 seconds for the Data Lake Governance Review (FIND-0002) to 7105.34 seconds for the SOC 2 Type II Review (FIND-0003). These values are not uniform; they reflect the scope and complexity of each engagement, with the HIPAA Security Assessment (FIND-0001) requiring 5564.74 seconds and the ISO 27001 Certification (FIND-0004) requiring 2350.00 seconds. The host_name field identifies the compute node on which the assessment was executed—worker-07, node-a01, node-b14, edge-03—providing an audit trail for reproducibility and incident response. Together, duration and host ground the abstract identifiers in physical execution, enabling operators to correlate assessment results with infrastructure performance and resource utilization.

**t_audit_with_findings**

| id | audit | findings | duration_seconds | host_name |
| --- | --- | --- | --- | --- |
| FIND-0001 | HIPAA Security Assessment | WITH-0002 | 5564.74 | worker-07 |
| FIND-0002 | Data Lake Governance Review | WITH-0002 | 1140.43 | node-a01 |
| FIND-0003 | SOC 2 Type II Review | WITH-0004 | 7105.34 | node-b14 |
| FIND-0004 | ISO 27001 Certification | WITH-0004 | 2350.00 | edge-03 |
| FIND-0005 | Third-Party Vendor Review | WITH-0006 | 2041.65 | worker-07 |
| FIND-0006 | Data Lake Governance Review | WITH-0001 | 3303.91 | ingest-21 |
| FIND-0007 | ML Model Drift Audit | WITH-0003 | 5489.56 | ingest-21 |