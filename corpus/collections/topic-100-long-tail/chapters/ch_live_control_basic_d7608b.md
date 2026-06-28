---
chapter_id: ch_live_control_basic_d7608b
topic_id: 100
family: 03_directive_governance
cited_terms: ['control_basic', 'outlier_claim_with_attribute_set', 'span_with_trace_id']
model: engine-refine
---

Attribute-value modeling in distributed observability and compliance frameworks relies on a disciplined separation between structural definitions and their runtime instantiations. Each entity—whether a control mandate, an outlier claim, or a span trace—is assigned a stable identifier that serves as the anchor for all downstream references. Control identifiers such as CONT-0001 through CONT-0004 enumerate governance rules including the Anomaly detection limit, the Audit logging standard, and the Data retention mandate, while trace identifiers like TRAC-0001 and TRAC-0002 anchor operational spans such as config_fetch, email_send, payment_process, and queue_consume. Outlier claim identifiers (SET-0001 through SET-0004) similarly anchor diagnostic events including checksum_mismatch, pipeline_stall, log_flooding, and latency_spike. This identifier discipline ensures that every attribute, value, and relationship can be traced back to a single authoritative source without ambiguity.

**t_outlier_claim_with_attribute_set**

| id | outlier |
| --- | --- |
| SET-0001 | checksum_mismatch |
| SET-0002 | pipeline_stall |
| SET-0003 | log_flooding |
| SET-0004 | latency_spike |
| SET-0005 | checksum_mismatch |
| SET-0006 | log_flooding |
| SET-0007 | latency_spike |

**t_outlier_claim_with_attribute_set_attribute_set**

| id | attribute_set |
| --- | --- |
| SET-0001 | tolerance_ranges |
| SET-0002 | baseline_values |
| SET-0003 | baseline_values |
| SET-0004 | calibration_constants |
| SET-0005 | tolerance_ranges |
| SET-0006 | temporal_windows |

**t_span_with_trace_id**

| id | span | trace_id |
| --- | --- | --- |
| TRAC-0001 | config_fetch | SET-0003 |
| TRAC-0002 | email_send | SET-0004 |
| TRAC-0003 | payment_process | SET-0002 |
| TRAC-0004 | queue_consume | SET-0003 |
| TRAC-0005 | payment_process | SET-0005 |
| TRAC-0006 | queue_consume | SET-0001 |

**t_span_with_trace_id_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| TRAC-0001 | duration_seconds | xsd:decimal |
| TRAC-0002 | end_time | xsd:dateTime |
| TRAC-0003 | exit_code | xsd:integer |
| TRAC-0004 | host_name | xsd:string |
| TRAC-0005 | log_level | xsd:string |
| TRAC-0006 | phase | xsd:string |
| TRAC-0007 | retry_count | xsd:integer |
| TRAC-0008 | scheduled_at | xsd:dateTime |

**t_span_with_trace_id_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TRAC-0001 | TRAC-0001 | TRAC-0002 | 2024-07-23T07:53:43 |
| TRAC-0002 | TRAC-0001 | TRAC-0008 | 2024-01-04T12:30:01 |
| TRAC-0003 | TRAC-0001 | TRAC-0009 | 2024-06-08T06:16:51 |
| TRAC-0004 | TRAC-0002 | TRAC-0002 | 2024-09-04T10:45:36 |
| TRAC-0005 | TRAC-0002 | TRAC-0008 | 2024-03-10T17:10:26 |
| TRAC-0006 | TRAC-0002 | TRAC-0009 | 2024-08-27T18:50:31 |
| TRAC-0007 | TRAC-0003 | TRAC-0002 | 2024-05-28T07:14:21 |
| TRAC-0008 | TRAC-0003 | TRAC-0008 | 2023-12-31T18:14:37 |

**t_span_with_trace_id_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TRAC-0001 | TRAC-0001 | TRAC-0001 | 5004.94 |
| TRAC-0002 | TRAC-0002 | TRAC-0001 | 6293.97 |
| TRAC-0003 | TRAC-0003 | TRAC-0001 | 683.54 |
| TRAC-0004 | TRAC-0004 | TRAC-0001 | 6162.04 |
| TRAC-0005 | TRAC-0005 | TRAC-0001 | 7049.18 |
| TRAC-0006 | TRAC-0006 | TRAC-0001 | 6047.18 |

**t_span_with_trace_id_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TRAC-0001 | TRAC-0001 | TRAC-0003 | 485 |
| TRAC-0002 | TRAC-0001 | TRAC-0007 | 203 |
| TRAC-0003 | TRAC-0002 | TRAC-0003 | 446 |
| TRAC-0004 | TRAC-0002 | TRAC-0007 | 417 |
| TRAC-0005 | TRAC-0003 | TRAC-0003 | 481 |
| TRAC-0006 | TRAC-0003 | TRAC-0007 | 210 |
| TRAC-0007 | TRAC-0004 | TRAC-0003 | 137 |
| TRAC-0008 | TRAC-0004 | TRAC-0007 | 453 |

**t_span_with_trace_id_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TRAC-0001 | TRAC-0001 | TRAC-0004 | gw-12 |
| TRAC-0002 | TRAC-0001 | TRAC-0005 | Log Level 02 |
| TRAC-0003 | TRAC-0001 | TRAC-0006 | initiation |
| TRAC-0004 | TRAC-0001 | TRAC-0010 | running |
| TRAC-0005 | TRAC-0001 | TRAC-0011 | Triggered By 05 |
| TRAC-0006 | TRAC-0002 | TRAC-0004 | gw-12 |
| TRAC-0007 | TRAC-0002 | TRAC-0005 | Log Level 07 |
| TRAC-0008 | TRAC-0002 | TRAC-0006 | initiation |

Attributes themselves are declared with a name and a type, establishing a schema that governs what values may be stored. The attribute name column—attr_name—captures semantic labels such as duration_seconds, end_time, exit_code, and host_name, while the attr_type column enforces data integrity through XML Schema types: xsd:decimal for numeric measurements, xsd:dateTime for temporal markers, xsd:integer for discrete counts, and xsd:string for free-form text. This type discipline is critical because it allows the system to store heterogeneous values in separate typed value tables without sacrificing type safety. A duration of 5004.94 or 6293.97 is stored in the decimal value table, a timestamp like 2024-07-23T07:53:43 or 2024-01-04T12:30:01 in the datetime table, an exit code such as 485 or 203 in the integer table, and a host identifier like gw-12 or a status string such as initiation or running in the varchar table. The misc column in each value table holds the actual payload, while the attr_id column resolves back to the attribute definition and the entity_id column resolves back to the entity being described.

The entity-attribute-value pattern extends beyond simple key-value pairs by introducing a role-based relationship model that governs how outlier claims connect to attribute sets. In this model, the subject column identifies the source entity in a relationship—such as SET-0003 or SET-0001—while the target column identifies the destination, for example SET-0005 or SET-0004. The role column then classifies the nature of the connection, distinguishing between contributor and owner relationships. An outlier claim identified as SET-0003 may contribute its tolerance_ranges attribute set to a broader diagnostic context, while SET-0001 may own its baseline_values set, establishing a clear hierarchy of responsibility. This triad of subject, target, and role enables fine-grained provenance tracking, allowing auditors to determine not merely which attribute sets are associated with which outlier claims, but in what capacity.

**t_outlier_claim_with_attribute_set__attribute_set**

| id | outlier_id | attribute_set_id | role |
| --- | --- | --- | --- |
| SET-0001 | SET-0003 | SET-0005 | contributor |
| SET-0002 | SET-0001 | SET-0004 | owner |
| SET-0003 | SET-0004 | SET-0001 | contributor |
| SET-0004 | SET-0007 | SET-0002 | contributor |
| SET-0005 | SET-0004 | SET-0005 | contributor |
| SET-0006 | SET-0006 | SET-0006 | contributor |
| SET-0007 | SET-0004 | SET-0002 | owner |
| SET-0008 | SET-0001 | SET-0006 | owner |

Governance controls are themselves subject to temporal and mandatory constraints that are tracked alongside their definitions. The effectivedate column records when a control becomes operative, with dates ranging from 2024-12-05 for the Data retention mandate through 2025-05-27 for the Anomaly detection limit, ensuring that compliance evaluations can be performed against the correct version of the rule set at any point in time. The ismandatory column distinguishes between discretionary and required controls, with entries such as the Data retention mandate marked as true and the Anomaly detection limit appearing in both mandatory and non-mandatory variants depending on the specific control identifier. This dual-axis governance model—combining temporal validity with mandatory status—allows organizations to enforce compliance policies that evolve over time while maintaining a clear audit trail of which rules were in force during any given operational period.

**t_control_basic**

| id | control | effective_date | mandatory |
| --- | --- | --- | --- |
| CONT-0001 | Anomaly detection limit | 2025-01-22 | false |
| CONT-0002 | Audit logging standard | 2025-04-27 | false |
| CONT-0003 | Data retention mandate | 2024-12-05 | true |
| CONT-0004 | Anomaly detection limit | 2025-05-27 | true |
| CONT-0005 | PII masking policy | 2025-02-05 | false |
| CONT-0006 | Rate limiting rule | 2023-06-05 | false |
| CONT-0007 | Checksum verification rule | 2024-10-11 | false |