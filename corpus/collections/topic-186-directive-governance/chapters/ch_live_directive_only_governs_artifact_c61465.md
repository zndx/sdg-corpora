---
chapter_id: ch_live_directive_only_governs_artifact_c61465
topic_id: 186
family: 07_long_tail
cited_terms: ['directive_only_governs_artifact', 'ebpf_event_subclass', 'lineage_edge_to_target']
model: engine-refine
---

In compliance and data governance architectures, every artifact, event, or lineage edge must be uniquely identifiable and richly described through a structured attribute system. Identifiers such as ARTI-0001 and EVEN-0004 serve as stable keys that anchor each entity within the broader framework, enabling unambiguous cross-referencing across directives, events, and data products. An artifact like ARTI-0001, which governs the event EVEN-0004 under the ISO 27001 Security Policy, is not merely a label but a governance node that carries typed metadata and links to downstream telemetry. Similarly, event subclasses such as nginx_handle_request (EVEN-0004) and tcp_sendmsg (EVEN-0003) are captured by specific artifacts, establishing a traceable chain from raw system behavior to compliance enforcement. This identifier-driven model ensures that every data point can be traced back to its governing directive and forward to its consuming target, whether that target is an executive dashboard, a feature store table, or a risk prediction model.

**t_directive_only_governs_artifact**

| id | directive | governs |
| --- | --- | --- |
| ARTI-0001 | ISO 27001 Security Policy | EVEN-0004 |
| ARTI-0002 | SOC 2 Type II Standard | EVEN-0005 |
| ARTI-0003 | GDPR Compliance Mandate | EVEN-0002 |
| ARTI-0004 | PCI DSS v4.0 Compliance | EVEN-0003 |
| ARTI-0005 | FISMA Moderate Baseline | EVEN-0002 |
| ARTI-0006 | OWASP Top Ten Control | EVEN-0001 |
| ARTI-0007 | NIST Cybersecurity Framework | EVEN-0003 |

**t_directive_only_governs_artifact_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ARTI-0001 | effective_date | xsd:date |
| ARTI-0002 | enforcement | xsd:string |
| ARTI-0003 | mandatory | xsd:boolean |
| ARTI-0004 | priority | xsd:integer |
| ARTI-0005 | review_cycle_days | xsd:integer |
| ARTI-0006 | scope | xsd:string |
| ARTI-0007 | encoding | xsd:string |
| ARTI-0008 | label_text | xsd:string |

**t_directive_only_governs_artifact_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0003 | true |
| ARTI-0002 | ARTI-0002 | ARTI-0003 | true |
| ARTI-0003 | ARTI-0003 | ARTI-0003 | true |
| ARTI-0004 | ARTI-0004 | ARTI-0003 | false |
| ARTI-0005 | ARTI-0005 | ARTI-0003 | false |
| ARTI-0006 | ARTI-0006 | ARTI-0003 | true |
| ARTI-0007 | ARTI-0007 | ARTI-0003 | false |

**t_directive_only_governs_artifact_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0001 | 2023-09-27 |
| ARTI-0002 | ARTI-0002 | ARTI-0001 | 2025-04-15 |
| ARTI-0003 | ARTI-0003 | ARTI-0001 | 2024-03-21 |
| ARTI-0004 | ARTI-0004 | ARTI-0001 | 2024-02-09 |
| ARTI-0005 | ARTI-0005 | ARTI-0001 | 2023-02-02 |
| ARTI-0006 | ARTI-0006 | ARTI-0001 | 2024-08-24 |
| ARTI-0007 | ARTI-0007 | ARTI-0001 | 2023-05-03 |

**t_directive_only_governs_artifact_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0004 | 5 |
| ARTI-0002 | ARTI-0001 | ARTI-0005 | 959 |
| ARTI-0003 | ARTI-0002 | ARTI-0004 | 4 |
| ARTI-0004 | ARTI-0002 | ARTI-0005 | 97 |
| ARTI-0005 | ARTI-0003 | ARTI-0004 | 5 |
| ARTI-0006 | ARTI-0003 | ARTI-0005 | 179 |
| ARTI-0007 | ARTI-0004 | ARTI-0004 | 4 |
| ARTI-0008 | ARTI-0004 | ARTI-0005 | 356 |

**t_directive_only_governs_artifact_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0007 | Encoding 01 |
| ARTI-0002 | ARTI-0001 | ARTI-0002 | Enforcement 02 |
| ARTI-0003 | ARTI-0001 | ARTI-0008 | nightly summary |
| ARTI-0004 | ARTI-0001 | ARTI-0009 | en |
| ARTI-0005 | ARTI-0001 | ARTI-0006 | Scope 05 |
| ARTI-0006 | ARTI-0002 | ARTI-0007 | Encoding 06 |
| ARTI-0007 | ARTI-0002 | ARTI-0002 | Enforcement 07 |
| ARTI-0008 | ARTI-0002 | ARTI-0008 | pre-release note |

**t_ebpf_event_subclass_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVEN-0001 | EVEN-0001 | EVEN-0003 | 850 |
| EVEN-0002 | EVEN-0001 | EVEN-0007 | 82 |
| EVEN-0003 | EVEN-0002 | EVEN-0003 | 274 |
| EVEN-0004 | EVEN-0002 | EVEN-0007 | 150 |
| EVEN-0005 | EVEN-0003 | EVEN-0003 | 331 |
| EVEN-0006 | EVEN-0003 | EVEN-0007 | 359 |
| EVEN-0007 | EVEN-0004 | EVEN-0003 | 62 |
| EVEN-0008 | EVEN-0004 | EVEN-0007 | 407 |

Attributes and their types form the semantic backbone of this model, defining what properties each entity can express and in what format. The attribute schema separates concerns by declaring names such as effective_date, enforcement, mandatory, and priority alongside their corresponding XML Schema types—xsd:date, xsd:string, xsd:boolean, and xsd:integer—so that validation and processing logic can be applied uniformly. For ebpf event subclasses, attributes like duration_seconds (xsd:decimal), end_time (xsd:dateTime), exit_code (xsd:integer), and host_name (xsd:string) capture the operational characteristics of network and socket telemetry. This type discipline is critical: it guarantees that a date value such as 2023-09-27 is never conflated with a boolean true, or that a decimal measurement like 2720.22 seconds is stored with the precision required for performance analysis.

**t_ebpf_event_subclass_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVEN-0001 | EVEN-0001 | EVEN-0002 | 2023-12-16T10:45:28 |
| EVEN-0002 | EVEN-0001 | EVEN-0008 | 2024-10-14T13:06:33 |
| EVEN-0003 | EVEN-0001 | EVEN-0009 | 2023-04-24T00:44:09 |
| EVEN-0004 | EVEN-0002 | EVEN-0002 | 2025-02-16T07:35:15 |
| EVEN-0005 | EVEN-0002 | EVEN-0008 | 2025-04-20T08:07:57 |
| EVEN-0006 | EVEN-0002 | EVEN-0009 | 2024-07-28T17:18:43 |
| EVEN-0007 | EVEN-0003 | EVEN-0002 | 2023-11-26T07:43:04 |
| EVEN-0008 | EVEN-0003 | EVEN-0008 | 2024-06-08T03:25:45 |

**t_ebpf_event_subclass_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVEN-0001 | EVEN-0001 | EVEN-0001 | 2720.22 |
| EVEN-0002 | EVEN-0002 | EVEN-0001 | 5609.93 |
| EVEN-0003 | EVEN-0003 | EVEN-0001 | 2196.86 |
| EVEN-0004 | EVEN-0004 | EVEN-0001 | 3453.77 |
| EVEN-0005 | EVEN-0005 | EVEN-0001 | 849.28 |
| EVEN-0006 | EVEN-0006 | EVEN-0001 | 5507.03 |

Entity values are materialized through a value-store pattern that partitions data by type, ensuring that each attribute's value is stored in the column family best suited to its schema. Boolean attributes for artifacts resolve to true or false across entities ARTI-0001 through ARTI-0004, with the mandatory flag being true for the first three artifacts and false for ARTI-0004, indicating a graduated enforcement posture. Date attributes carry effective dates ranging from 2023-09-27 to 2025-04-15, reflecting the temporal scope of compliance obligations. Integer attributes encode priority levels and other numeric measures—values such as 5 and 4 for priority, or 959 and 97 for other integer-valued properties—while varchar attributes hold freeform text like Encoding 01, nightly summary, and en. For ebpf events, datetime values such as 2023-12-16T10:45:28 and 2025-02-16T07:35:15 anchor telemetry to precise moments, decimal values like 2720.22 and 5609.93 quantify duration, and integer values such as 850 and 274 represent exit codes or counters. String attributes capture host identifiers like ingest-21, log levels such as Log Level 02, and status indicators including closeout and superseded. This value partitioning by type is not an implementation detail but a design principle that enforces data integrity at the storage layer.

**t_ebpf_event_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVEN-0001 | EVEN-0001 | EVEN-0004 | ingest-21 |
| EVEN-0002 | EVEN-0001 | EVEN-0005 | Log Level 02 |
| EVEN-0003 | EVEN-0001 | EVEN-0006 | closeout |
| EVEN-0004 | EVEN-0001 | EVEN-0010 | superseded |
| EVEN-0005 | EVEN-0001 | EVEN-0011 | Triggered By 05 |
| EVEN-0006 | EVEN-0002 | EVEN-0004 | gw-12 |
| EVEN-0007 | EVEN-0002 | EVEN-0005 | Log Level 07 |
| EVEN-0008 | EVEN-0002 | EVEN-0006 | initiation |

The misc column, which holds the actual value content across all value tables, and the unit column, which appears in lineage edge records, complete the dimensional picture by providing the quantitative and categorical context for measurements. In the lineage layer, edges connect source artifacts to target systems with explicit units—nanometers (nm) for ml_model_checkpoint flowing to executive_dashboard, ratios (ratio) for knowledge_base_dump to feature_store_table, counts (count) for ml_model_checkpoint to executive_dashboard, and kilograms (kg) for raw_telemetry_feed to risk_prediction_model—alongside numeric values such as 555.98, 967.34, 771.21, and 171.35. These units are not decorative; they are essential for downstream consumers to interpret data volumes, model weights, and telemetry aggregates correctly. Without explicit unit metadata, a value of 171.35 could represent anything from data mass to model confidence, leading to misinterpretation in governance reporting or model operations.

**t_lineage_edge_to_target**

| id | lineage | to_target | unit | value |
| --- | --- | --- | --- | --- |
| TARG-0001 | ml_model_checkpoint | executive_dashboard | nm | 555.98 |
| TARG-0002 | knowledge_base_dump | feature_store_table | ratio | 967.34 |
| TARG-0003 | ml_model_checkpoint | executive_dashboard | count | 771.21 |
| TARG-0004 | raw_telemetry_feed | risk_prediction_model | kg | 171.35 |
| TARG-0005 | lab_sample_manifest | analytics_warehouse | count | 934.12 |
| TARG-0006 | quality_validation_suite | backup_snapshot | count | 626.71 |

Together, these constructs—identifiers, attributes, attribute types, entities, values, and units—form a coherent data governance fabric. An artifact governed by the SOC 2 Type II Standard carries attributes with typed values that describe when it takes effect, whether it is mandatory, and what priority it holds. An ebpf event subclass captured by that artifact carries its own attributes—duration, exit code, host name—with values that describe the observed behavior. Lineage edges then connect these artifacts to downstream targets with units and quantities that quantify the data flowing through the pipeline. This layered model ensures that every piece of data, from a boolean enforcement flag to a decimal duration measurement, is traceable to its source directive, typed for correctness, and contextualized with units for interpretation.

**t_ebpf_event_subclass**

| id | ebpf | captured_by |
| --- | --- | --- |
| EVEN-0001 | net_cls | ARTI-0005 |
| EVEN-0002 | sockops | ARTI-0005 |
| EVEN-0003 | tcp_sendmsg | ARTI-0004 |
| EVEN-0004 | nginx_handle_request | ARTI-0007 |
| EVEN-0005 | nginx_handle_request | ARTI-0007 |
| EVEN-0006 | net_cls | ARTI-0002 |

**t_ebpf_event_subclass_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| EVEN-0001 | duration_seconds | xsd:decimal |
| EVEN-0002 | end_time | xsd:dateTime |
| EVEN-0003 | exit_code | xsd:integer |
| EVEN-0004 | host_name | xsd:string |
| EVEN-0005 | log_level | xsd:string |
| EVEN-0006 | phase | xsd:string |
| EVEN-0007 | retry_count | xsd:integer |
| EVEN-0008 | scheduled_at | xsd:dateTime |