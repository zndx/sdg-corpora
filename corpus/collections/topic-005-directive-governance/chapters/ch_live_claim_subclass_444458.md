---
chapter_id: ch_live_claim_subclass_444458
topic_id: 5
family: 06_belief_structure
cited_terms: ['claim_subclass', 'trace_has_resource', 'outlier_claim_basic']
model: engine-refine
---

Operational observability and compliance frameworks rely on a disciplined separation between the identification of anomalous events, the resources implicated in those events, and the granular attributes that characterize both. Claims serve as the primary unit of concern: identifiers such as CLAI-0001 through CLAI-0004 anchor discrete assertions about system behavior, whether the subject is a lab centrifuge unit-7, a failed QC sample, a packet loss SLA breach, or an authentication microservice. Each claim carries a method designation—automated, hybrid, or inferred—that documents how the assertion was derived, and a label_text field that points to the originating artifact, whether an audit excerpt, intake form, pre-release note, or calibration record. The claim_about column further specifies the target of the assertion, referencing entities ranging from a Kafka cluster node-3 to an IoT temperature sensor-42 to an API gateway prod, thereby establishing a clear chain of accountability from observation to affected component.

**t_claim_subclass**

| id | claim | claim_about | method | label_text |
| --- | --- | --- | --- | --- |
| CLAI-0001 | Lab centrifuge unit-7 | Packet loss SLA breach | automated | audit excerpt |
| CLAI-0002 | QC sample failed | Kafka cluster node-3 | hybrid | intake form |
| CLAI-0003 | Packet loss SLA breach | IoT temperature sensor-42 | hybrid | pre-release note |
| CLAI-0004 | Authentication microservice | API gateway prod | inferred | calibration record |

The resource layer translates these claims into concrete infrastructure and process contexts through a trace-to-resource association model. Traces such as batch-etl-nightly, lab-assay-protocol-2b, and governance-audit-cycle-9 are linked to resources including s3-data-lake-warehouse, postgresql-primary-db, and network-bandwidth-10g, with each association receiving its own identifier (RESO-0001 through RESO-0004) and a rich set of typed attributes. The attribute schema itself is defined in a dedicated table where attr_name columns enumerate properties like duration_seconds, end_time, exit_code, and host_name, while attr_type columns enforce semantic discipline through XSD types—xsd:decimal for numeric measures, xsd:dateTime for temporal markers, xsd:integer for discrete counts, and xsd:string for categorical labels. This decoupling of attribute definition from attribute value permits the schema to evolve without restructuring the value storage layer.

**t_trace_has_resource**

| id | trace | resource |
| --- | --- | --- |
| RESO-0001 | batch-etl-nightly | s3-data-lake-warehouse |
| RESO-0002 | lab-assay-protocol-2b | postgresql-primary-db |
| RESO-0003 | governance-audit-cycle-9 | network-bandwidth-10g |
| RESO-0004 | lab-assay-protocol-2b | s3-data-lake-warehouse |
| RESO-0005 | ml-training-run-aurora | iot-sensor-bus-7 |
| RESO-0006 | governance-audit-cycle-9 | gpu-cluster-node-04 |
| RESO-0007 | lab-assay-protocol-2b | gpu-cluster-node-04 |
| RESO-0008 | api-gateway-chain-alpha | compute-node-vm-128 |

**t_trace_has_resource_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| RESO-0001 | duration_seconds | xsd:decimal |
| RESO-0002 | end_time | xsd:dateTime |
| RESO-0003 | exit_code | xsd:integer |
| RESO-0004 | host_name | xsd:string |
| RESO-0005 | log_level | xsd:string |
| RESO-0006 | phase | xsd:string |
| RESO-0007 | retry_count | xsd:integer |
| RESO-0008 | scheduled_at | xsd:dateTime |

**t_trace_has_resource_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RESO-0001 | RESO-0001 | RESO-0002 | 2024-06-04T06:37:56 |
| RESO-0002 | RESO-0001 | RESO-0008 | 2024-12-02T12:01:14 |
| RESO-0003 | RESO-0001 | RESO-0009 | 2023-01-28T15:18:51 |
| RESO-0004 | RESO-0002 | RESO-0002 | 2024-10-26T21:48:09 |
| RESO-0005 | RESO-0002 | RESO-0008 | 2023-05-28T23:57:13 |
| RESO-0006 | RESO-0002 | RESO-0009 | 2024-11-25T19:57:56 |
| RESO-0007 | RESO-0003 | RESO-0002 | 2025-04-19T16:24:22 |
| RESO-0008 | RESO-0003 | RESO-0008 | 2023-04-30T19:04:21 |

**t_trace_has_resource_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RESO-0001 | RESO-0001 | RESO-0001 | 6459.38 |
| RESO-0002 | RESO-0002 | RESO-0001 | 3107.88 |
| RESO-0003 | RESO-0003 | RESO-0001 | 4594.49 |
| RESO-0004 | RESO-0004 | RESO-0001 | 2602.26 |
| RESO-0005 | RESO-0005 | RESO-0001 | 5003.83 |
| RESO-0006 | RESO-0006 | RESO-0001 | 252.98 |
| RESO-0007 | RESO-0007 | RESO-0001 | 239.70 |
| RESO-0008 | RESO-0008 | RESO-0001 | 3334.43 |

**t_trace_has_resource_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RESO-0001 | RESO-0001 | RESO-0003 | 866 |
| RESO-0002 | RESO-0001 | RESO-0007 | 141 |
| RESO-0003 | RESO-0002 | RESO-0003 | 185 |
| RESO-0004 | RESO-0002 | RESO-0007 | 294 |
| RESO-0005 | RESO-0003 | RESO-0003 | 284 |
| RESO-0006 | RESO-0003 | RESO-0007 | 200 |
| RESO-0007 | RESO-0004 | RESO-0003 | 838 |
| RESO-0008 | RESO-0004 | RESO-0007 | 136 |

Value storage follows a type-dispatch pattern: datetime, decimal, integer, and varchar values are persisted in separate tables, each keyed by a composite of entity_id and attr_id that references the association and attribute definitions above. A single trace-resource association, identified as RESO-0001, for instance, carries a duration of 6459.38 seconds, an end_time of 2024-06-04T06:37:56, an exit_code of 866, and a host_name of node-b14, with each value residing in its appropriately typed table. The entity_id column in each value table points back to the association record, ensuring that all measurements remain bound to their originating trace-resource context. This normalization eliminates redundancy while preserving the ability to query across types—for example, joining decimal duration values with varchar status labels to reconstruct a complete operational snapshot of a given trace.

**t_trace_has_resource_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RESO-0001 | RESO-0001 | RESO-0004 | node-b14 |
| RESO-0002 | RESO-0001 | RESO-0005 | Log Level 02 |
| RESO-0003 | RESO-0001 | RESO-0006 | closeout |
| RESO-0004 | RESO-0001 | RESO-0010 | running |
| RESO-0005 | RESO-0001 | RESO-0011 | Triggered By 05 |
| RESO-0006 | RESO-0002 | RESO-0004 | worker-07 |
| RESO-0007 | RESO-0002 | RESO-0005 | Log Level 07 |
| RESO-0008 | RESO-0002 | RESO-0006 | review |

Outlier claims extend the claims model with a parallel attribute-value architecture tailored to anomaly detection metadata. The t_outlier_claim_basic table records outlier identifiers such as latency_spike_alpha, cpu_throttle_event, and schema_drift_v2, each linked to a claim through the shared CLAI-0001 through CLAI-0004 identifier space. Attributes specific to outlier analysis—including confidence scores, dimension_kind classifications, method provenance, and recorded_at timestamps—are defined in t_outlier_claim_basic_attr with the same XSD-typed discipline, and their values are stored in dedicated decimal, varchar, and datetime tables. A confidence value of 0.504 or 0.093, a dimension_kind of Dimension Kind 01, or a recorded_at timestamp of 2024-03-15T03:40:40 are all stored as typed values that reference their entity and attribute identifiers, maintaining referential integrity across the anomaly detection pipeline. The method column in the base claims table and the corresponding method attribute in the outlier claims table together provide a dual-layer provenance record: one documenting the claim's derivation, the other the outlier detection mechanism that flagged it.

**t_outlier_claim_basic**

| id | outlier |
| --- | --- |
| CLAI-0001 | latency_spike_alpha |
| CLAI-0002 | cpu_throttle_event |
| CLAI-0003 | schema_drift_v2 |
| CLAI-0004 | latency_spike_alpha |
| CLAI-0005 | null_partition_42 |
| CLAI-0006 | cpu_throttle_event |

**t_outlier_claim_basic_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| CLAI-0001 | confidence | xsd:decimal |
| CLAI-0002 | dimension_kind | xsd:string |
| CLAI-0003 | method | xsd:string |
| CLAI-0004 | recorded_at | xsd:dateTime |
| CLAI-0005 | uncertainty | xsd:decimal |
| CLAI-0006 | unit | xsd:string |
| CLAI-0007 | value | xsd:decimal |
| CLAI-0008 | encoding | xsd:string |

**t_outlier_claim_basic_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CLAI-0001 | CLAI-0001 | CLAI-0004 | 2024-03-15T03:40:40 |
| CLAI-0002 | CLAI-0002 | CLAI-0004 | 2024-01-06T03:41:39 |
| CLAI-0003 | CLAI-0003 | CLAI-0004 | 2024-07-22T19:11:00 |
| CLAI-0004 | CLAI-0004 | CLAI-0004 | 2024-01-05T19:13:32 |
| CLAI-0005 | CLAI-0005 | CLAI-0004 | 2024-05-18T14:20:48 |
| CLAI-0006 | CLAI-0006 | CLAI-0004 | 2024-11-02T05:08:03 |

**t_outlier_claim_basic_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CLAI-0001 | CLAI-0001 | CLAI-0001 | 0.504 |
| CLAI-0002 | CLAI-0001 | CLAI-0005 | 834.64 |
| CLAI-0003 | CLAI-0001 | CLAI-0007 | 880.81 |
| CLAI-0004 | CLAI-0002 | CLAI-0001 | 0.093 |
| CLAI-0005 | CLAI-0002 | CLAI-0005 | 347.65 |
| CLAI-0006 | CLAI-0002 | CLAI-0007 | 472.12 |
| CLAI-0007 | CLAI-0003 | CLAI-0001 | 0.859 |
| CLAI-0008 | CLAI-0003 | CLAI-0005 | 734.07 |

**t_outlier_claim_basic_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CLAI-0001 | CLAI-0001 | CLAI-0002 | Dimension Kind 01 |
| CLAI-0002 | CLAI-0001 | CLAI-0008 | Encoding 02 |
| CLAI-0003 | CLAI-0001 | CLAI-0009 | change rationale |
| CLAI-0004 | CLAI-0001 | CLAI-0010 | en |
| CLAI-0005 | CLAI-0001 | CLAI-0003 | manual |
| CLAI-0006 | CLAI-0001 | CLAI-0006 | mg/L |
| CLAI-0007 | CLAI-0002 | CLAI-0002 | Dimension Kind 07 |
| CLAI-0008 | CLAI-0002 | CLAI-0008 | Encoding 08 |