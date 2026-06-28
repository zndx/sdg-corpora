---
chapter_id: ch_live_equiv_union_ice_branches_eb291a
topic_id: 168
family: 01_foundation
cited_terms: ['equiv_union_ice_branches', 'trace_with_attributes', 'provenance_agent_signs_audit']
model: engine-refine
---

Provenance tracking in distributed systems requires a disciplined separation between the metadata that describes a process and the quantitative measures that characterize its execution. The provenance dimension establishes categorical context through labels and categories—Provenance Label 01 through Provenance Label 04, each assigned to a distinct category ranging from Provenance Category 01 to Provenance Category 04—while the corresponding fact table binds these dimensions to measurable outcomes. Each provenance record carries a unique identifier such as AUDI-0001 or AUDI-0002, a foreign key referencing a parent provenance entity, and three execution metrics: duration in seconds, an exit code, and a retry count. The duration_seconds column captures elapsed time with decimal precision, as seen in values like 2601.59 seconds for AUDI-0001 and 6949.35 seconds for AUDI-0004, while exit_code and retry_count store integer outcomes—AUDI-0001 terminated with exit code 256 after 196 retries, whereas AUDI-0004 completed with exit code 985 following only 23 retries. This triad of duration, exit, and retry_count forms the operational backbone of provenance analysis, enabling post-hoc diagnosis of system behavior without requiring access to raw execution logs.

**fact_provenance**

| id | provenance_key | duration_seconds | exit_code | retry_count |
| --- | --- | --- | --- | --- |
| AUDI-0001 | AUDI-0003 | 2601.59 | 256 | 196 |
| AUDI-0002 | AUDI-0007 | 4921.58 | 728 | 304 |
| AUDI-0003 | AUDI-0008 | 2216.74 | 452 | 410 |
| AUDI-0004 | AUDI-0007 | 6949.35 | 985 | 23 |

**dim_provenance**

| id | provenance_label | provenance_category |
| --- | --- | --- |
| AUDI-0001 | Provenance Label 01 | Provenance Category 01 |
| AUDI-0002 | Provenance Label 02 | Provenance Category 02 |
| AUDI-0003 | Provenance Label 03 | Provenance Category 03 |
| AUDI-0004 | Provenance Label 04 | Provenance Category 04 |
| AUDI-0005 | Provenance Label 05 | Provenance Category 05 |
| AUDI-0006 | Provenance Label 06 | Provenance Category 06 |
| AUDI-0007 | Provenance Label 07 | Provenance Category 07 |
| AUDI-0008 | Provenance Label 08 | Provenance Category 08 |

The attribute system extends this provenance framework by associating typed key-value pairs with trace entities. Each trace—identified by an identifier such as ATTR-0001 and linked to a named execution context like batch-exec-094 or session-gamma-9—serves as the entity to which attributes attach. The attribute schema itself is defined in a separate structure that maps each attribute to a name and an XSD type: duration_seconds carries type xsd:decimal, end_time is xsd:dateTime, exit_code is xsd:integer, and host_name is xsd:string. This type declaration governs how values are stored and validated across four distinct value tables, each specialized for a single data type. The decimal value table holds measurements such as 1085.14 and 3252.57, the integer table stores codes like 445 and 567, the datetime table records timestamps including 2024-07-09T10:21:53 and 2023-03-03T12:52:58, and the varchar table preserves freeform strings such as gw-12, Log Level 02, initiation, and superseded. The entity_id column in each value table references the trace identifier, while attr_id points to the attribute definition, creating a normalized many-to-many relationship that accommodates an arbitrary number of attributes per trace without schema modification.

**t_trace_with_attributes**

| id | trace |
| --- | --- |
| ATTR-0001 | batch-exec-094 |
| ATTR-0002 | session-gamma-9 |
| ATTR-0003 | gateway-span-55 |
| ATTR-0004 | telemetry-flow-alpha |
| ATTR-0005 | pipeline-run-412 |
| ATTR-0006 | api-call-trace-12 |

**t_trace_with_attributes_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ATTR-0001 | duration_seconds | xsd:decimal |
| ATTR-0002 | end_time | xsd:dateTime |
| ATTR-0003 | exit_code | xsd:integer |
| ATTR-0004 | host_name | xsd:string |
| ATTR-0005 | log_level | xsd:string |
| ATTR-0006 | phase | xsd:string |
| ATTR-0007 | retry_count | xsd:integer |
| ATTR-0008 | scheduled_at | xsd:dateTime |

**t_trace_with_attributes_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTR-0001 | ATTR-0001 | ATTR-0002 | 2024-07-09T10:21:53 |
| ATTR-0002 | ATTR-0001 | ATTR-0008 | 2024-10-26T05:28:10 |
| ATTR-0003 | ATTR-0001 | ATTR-0009 | 2024-01-16T11:34:50 |
| ATTR-0004 | ATTR-0002 | ATTR-0002 | 2023-03-03T12:52:58 |
| ATTR-0005 | ATTR-0002 | ATTR-0008 | 2023-12-16T04:33:56 |
| ATTR-0006 | ATTR-0002 | ATTR-0009 | 2024-09-15T16:03:36 |
| ATTR-0007 | ATTR-0003 | ATTR-0002 | 2024-12-20T02:32:40 |
| ATTR-0008 | ATTR-0003 | ATTR-0008 | 2024-08-26T04:55:34 |

**t_trace_with_attributes_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTR-0001 | ATTR-0001 | ATTR-0001 | 1085.14 |
| ATTR-0002 | ATTR-0002 | ATTR-0001 | 3252.57 |
| ATTR-0003 | ATTR-0003 | ATTR-0001 | 401.17 |
| ATTR-0004 | ATTR-0004 | ATTR-0001 | 3242.47 |
| ATTR-0005 | ATTR-0005 | ATTR-0001 | 4250.01 |
| ATTR-0006 | ATTR-0006 | ATTR-0001 | 3788.41 |

**t_trace_with_attributes_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTR-0001 | ATTR-0001 | ATTR-0003 | 445 |
| ATTR-0002 | ATTR-0001 | ATTR-0007 | 106 |
| ATTR-0003 | ATTR-0002 | ATTR-0003 | 567 |
| ATTR-0004 | ATTR-0002 | ATTR-0007 | 380 |
| ATTR-0005 | ATTR-0003 | ATTR-0003 | 276 |
| ATTR-0006 | ATTR-0003 | ATTR-0007 | 188 |
| ATTR-0007 | ATTR-0004 | ATTR-0003 | 89 |
| ATTR-0008 | ATTR-0004 | ATTR-0007 | 391 |

**t_trace_with_attributes_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTR-0001 | ATTR-0001 | ATTR-0004 | gw-12 |
| ATTR-0002 | ATTR-0001 | ATTR-0005 | Log Level 02 |
| ATTR-0003 | ATTR-0001 | ATTR-0006 | initiation |
| ATTR-0004 | ATTR-0001 | ATTR-0010 | superseded |
| ATTR-0005 | ATTR-0001 | ATTR-0011 | Triggered By 05 |
| ATTR-0006 | ATTR-0002 | ATTR-0004 | node-b14 |
| ATTR-0007 | ATTR-0002 | ATTR-0005 | Log Level 07 |
| ATTR-0008 | ATTR-0002 | ATTR-0006 | execution |

The misc column, appearing across the value tables, functions as a generic value container whose semantics are determined by the associated attribute type rather than by the column name itself. In the datetime table, misc holds ISO 8601 timestamps; in the decimal table, it carries numeric measurements; in the integer table, it stores exit codes and counters; and in the varchar table, it preserves human-readable labels and status indicators. This design reflects a common pattern in analytical data models where type-specific value tables replace a single polymorphic column, thereby preserving type safety and enabling efficient range queries on numeric and temporal attributes. The identifier column in each table serves as a surrogate primary key, while the entity and attr foreign keys establish the logical relationship between traces and their associated metadata.

Beyond trace-level attributes, the system maintains a parallel structure for equivalence branches, where each branch carries an identifier such as BRAN-0001, a semantic label like Calibration_Offset or Equipment_Model, a human-readable label_text including calibration record and change rationale, and a language code specifying the localization—fr, es, or de. This multilingual labeling scheme supports internationalized documentation and ensures that provenance-related metadata can be presented in the appropriate language for each operational context. The equivalence relationship between branches, captured by the equiv column, enables the system to track alternative representations of the same conceptual entity, a capability essential for versioned or multi-region deployments where the same calibration record or quality score may be expressed differently across locales.

**t_equiv_union_ice_branches**

| id | equiv | label_text | language |
| --- | --- | --- | --- |
| BRAN-0001 | Calibration_Offset | calibration record | fr |
| BRAN-0002 | Equipment_Model | change rationale | es |
| BRAN-0003 | Data_Retention_Policy | calibration record | es |
| BRAN-0004 | Quality_Score | intake form | de |
| BRAN-0005 | Quality_Score | change rationale | de |
| BRAN-0006 | Observation_Code | nightly summary | es |
| BRAN-0007 | Safety_Protocol | nightly summary | es |
| BRAN-0008 | Quality_Score | pre-release note | fr |

Together, these structures form a cohesive provenance and attribute management layer that separates identity, categorization, measurement, and localization into distinct but interrelated concerns. The provenance fact and dimension tables provide the temporal and categorical scaffolding for execution records, the attribute system supplies extensible metadata for individual traces, and the equivalence branch table manages multilingual labeling across distributed entities. Each component relies on explicit foreign-key relationships—provenance_key linking fact to dimension, entity_id and attr_id linking value tables to their definitions, and identifier columns serving as the universal reference point—ensuring that every measurement, label, and status indicator can be traced back to its source without ambiguity.