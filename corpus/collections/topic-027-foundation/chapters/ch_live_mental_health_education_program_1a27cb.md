---
chapter_id: ch_live_mental_health_education_program_1a27cb
topic_id: 27
family: 08_derived
cited_terms: ['mental_health_education_program', 'metric_emission_subclass', 'metric_observed_by_event']
model: engine-refine
---

The governance of mental health education programs rests upon a structured registry in which each initiative is anchored by a unique identifier—PROG-0001 through PROG-0004—and classified by its substantive content. The table t_mental_health_education_program serves as the authoritative catalogue, recording the program name (Youth Wellness Initiative, Sources of Strength), the specific educational presentation delivered (Coping Skills Session, Understanding Anxiety Workshop, Recognizing Depression Workshop, Emotional Intelligence Talk), and the youth demographic targeted (Immigrant Adolescents, Foster Care Youths, Athlete Communities, College Freshmen). This tripartite structure—identifier, program, presentation, demographic—ensures that every intervention can be traced to a defined audience and a defined pedagogical modality, a prerequisite for accountability in publicly funded youth services.

**t_mental_health_education_program**

| id | mental_health_education_program | delivered_presentation | targets_demographic |
| --- | --- | --- | --- |
| PROG-0001 | Youth Wellness Initiative | Coping Skills Session | Immigrant Adolescents |
| PROG-0002 | Youth Wellness Initiative | Understanding Anxiety Workshop | Foster Care Youths |
| PROG-0003 | Sources of Strength | Recognizing Depression Workshop | Athlete Communities |
| PROG-0004 | Youth Wellness Initiative | Emotional Intelligence Talk | College Freshmen |
| PROG-0005 | Sources of Strength | Understanding Anxiety Workshop | College Freshmen |
| PROG-0006 | Sources of Strength | Mental Health Awareness Brief | High School Students |
| PROG-0007 | Teen Resilience Project | Stress Management Seminar | First Nations Youth |

Beyond the program registry, the system employs a generic attribute-value model to capture the operational and observational metadata that accompanies each entity. An attribute, or attr, is a named property such as duration_seconds, end_time, exit_code, or host_name, each declared with a precise attr_type drawn from the XML Schema definition space: xsd:decimal, xsd:dateTime, xsd:integer, xsd:string. The table t_metric_emission_subclass_attr enumerates these attribute definitions, while the entity column in the value tables—t_metric_emission_subclass_val_datetime, t_metric_emission_subclass_val_decimal, t_metric_emission_subclass_val_int, t_metric_emission_subclass_val_varchar—links each measured value back to its originating entity via the entity_id foreign key. Thus the identifier EMIS-0001, for instance, resolves to a cluster of heterogeneous observations: a duration of 1381.85 seconds (xsd:decimal), a timestamp of 2023-10-31T14:37:44 (xsd:dateTime), an exit code of 204 (xsd:integer), and a host name of node-a01 (xsd:string).

**t_metric_emission_subclass**

| id | metric | emits_metric |
| --- | --- | --- |
| EMIS-0001 | garbage_collection_pause | prometheus_agent |
| EMIS-0002 | memory_utilization | istio_sidecar |
| EMIS-0003 | Queue depth | nginx_worker |
| EMIS-0004 | disk_io_wait | postgres_main |
| EMIS-0005 | Garbage collection pause | etl_pipeline |
| EMIS-0006 | Queue depth | etl_pipeline |
| EMIS-0007 | CPU utilization | etl_pipeline |

**t_metric_emission_subclass_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| EMIS-0001 | duration_seconds | xsd:decimal |
| EMIS-0002 | end_time | xsd:dateTime |
| EMIS-0003 | exit_code | xsd:integer |
| EMIS-0004 | host_name | xsd:string |
| EMIS-0005 | log_level | xsd:string |
| EMIS-0006 | phase | xsd:string |
| EMIS-0007 | retry_count | xsd:integer |
| EMIS-0008 | scheduled_at | xsd:dateTime |

**t_metric_emission_subclass_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EMIS-0001 | EMIS-0001 | EMIS-0002 | 2023-10-31T14:37:44 |
| EMIS-0002 | EMIS-0001 | EMIS-0008 | 2024-08-14T22:51:22 |
| EMIS-0003 | EMIS-0001 | EMIS-0009 | 2023-09-21T19:46:28 |
| EMIS-0004 | EMIS-0002 | EMIS-0002 | 2024-10-02T07:51:18 |
| EMIS-0005 | EMIS-0002 | EMIS-0008 | 2023-02-02T08:38:58 |
| EMIS-0006 | EMIS-0002 | EMIS-0009 | 2024-11-30T14:13:18 |
| EMIS-0007 | EMIS-0003 | EMIS-0002 | 2023-11-21T22:47:51 |
| EMIS-0008 | EMIS-0003 | EMIS-0008 | 2023-01-18T00:53:02 |

**t_metric_emission_subclass_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EMIS-0001 | EMIS-0001 | EMIS-0001 | 1381.85 |
| EMIS-0002 | EMIS-0002 | EMIS-0001 | 954.50 |
| EMIS-0003 | EMIS-0003 | EMIS-0001 | 5476.70 |
| EMIS-0004 | EMIS-0004 | EMIS-0001 | 3136.71 |
| EMIS-0005 | EMIS-0005 | EMIS-0001 | 6003.14 |
| EMIS-0006 | EMIS-0006 | EMIS-0001 | 3720.68 |
| EMIS-0007 | EMIS-0007 | EMIS-0001 | 2471.19 |

**t_metric_emission_subclass_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EMIS-0001 | EMIS-0001 | EMIS-0003 | 204 |
| EMIS-0002 | EMIS-0001 | EMIS-0007 | 449 |
| EMIS-0003 | EMIS-0002 | EMIS-0003 | 526 |
| EMIS-0004 | EMIS-0002 | EMIS-0007 | 447 |
| EMIS-0005 | EMIS-0003 | EMIS-0003 | 729 |
| EMIS-0006 | EMIS-0003 | EMIS-0007 | 20 |
| EMIS-0007 | EMIS-0004 | EMIS-0003 | 636 |
| EMIS-0008 | EMIS-0004 | EMIS-0007 | 481 |

**t_metric_emission_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EMIS-0001 | EMIS-0001 | EMIS-0004 | node-a01 |
| EMIS-0002 | EMIS-0001 | EMIS-0005 | Log Level 02 |
| EMIS-0003 | EMIS-0001 | EMIS-0006 | execution |
| EMIS-0004 | EMIS-0001 | EMIS-0010 | complete |
| EMIS-0005 | EMIS-0001 | EMIS-0011 | Triggered By 05 |
| EMIS-0006 | EMIS-0002 | EMIS-0004 | worker-07 |
| EMIS-0007 | EMIS-0002 | EMIS-0005 | Log Level 07 |
| EMIS-0008 | EMIS-0002 | EMIS-0006 | execution |

The same attribute-value architecture is replicated for event-based observations in the t_metric_observed_by_event family of tables. Here, the metric column records what was observed—Queue depth, Garbage collection pause, memory_utilization, Error rate—while the attribute definitions in t_metric_observed_by_event_attr specify properties such as confidence (xsd:decimal), dimension_kind (xsd:string), method (xsd:string), and recorded_at (xsd:dateTime). Values are stored in type-specialized tables: t_metric_observed_by_event_val_decimal holds confidence scores like 0.221 and 0.669, t_metric_observed_by_event_val_datetime records timestamps such as 2023-03-01T06:18:02 and 2025-03-12T18:54:27, and t_metric_observed_by_event_val_varchar captures free-text annotations including Dimension Kind 01, Encoding 02, calibration record, and es. This separation of attribute definitions from their typed values enforces schema discipline while permitting extensibility.

**t_metric_observed_by_event**

| id | metric |
| --- | --- |
| EVEN-0001 | Queue depth |
| EVEN-0002 | Garbage collection pause |
| EVEN-0003 | memory_utilization |
| EVEN-0004 | Error rate |
| EVEN-0005 | CPU utilization |
| EVEN-0006 | memory_utilization |

**t_metric_observed_by_event_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| EVEN-0001 | confidence | xsd:decimal |
| EVEN-0002 | dimension_kind | xsd:string |
| EVEN-0003 | method | xsd:string |
| EVEN-0004 | recorded_at | xsd:dateTime |
| EVEN-0005 | uncertainty | xsd:decimal |
| EVEN-0006 | unit | xsd:string |
| EVEN-0007 | value | xsd:decimal |
| EVEN-0008 | encoding | xsd:string |

The metric emission subsystem further connects abstract metrics to concrete emitting components through the t_metric_emission_subclass table, where the metric column (garbage_collection_pause, memory_utilization, Queue depth, disk_io_wait) is associated with the emits_metric column (prometheus_agent, istio_sidecar, nginx_worker, postgres_main). This linkage establishes provenance: a garbage_collection_pause measurement originates from a prometheus_agent, a Queue depth reading from an nginx_worker, and so forth. The attr_id foreign key in each value table then resolves to the attribute definition in t_metric_emission_subclass_attr, completing the chain from metric → emitter → attribute → typed value.

Within this architecture, the identifier functions as the universal join key across all tables. Whether referencing a mental health program (PROG-0001), a metric emission record (EMIS-0001), or an event observation (EVEN-0001), the identifier provides a stable reference point that enables cross-domain queries. The entity column in value tables mirrors this identifier, ensuring that every measured quantity—whether a decimal duration of 5476.70, a datetime of 2024-08-14T22:51:22, or an integer exit code of 526—can be unambiguously attributed to its source. The misc column, serving as the generic value container across all type-specialized tables, holds the actual observations without imposing type constraints at the schema level, deferring type enforcement to the attr_type declarations and the physical separation of value tables by xsd type.

**t_metric_observed_by_event_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVEN-0001 | EVEN-0001 | EVEN-0004 | 2023-03-01T06:18:02 |
| EVEN-0002 | EVEN-0002 | EVEN-0004 | 2025-03-12T18:54:27 |
| EVEN-0003 | EVEN-0003 | EVEN-0004 | 2023-04-23T18:00:40 |
| EVEN-0004 | EVEN-0004 | EVEN-0004 | 2023-07-24T13:02:38 |
| EVEN-0005 | EVEN-0005 | EVEN-0004 | 2025-03-15T05:43:19 |
| EVEN-0006 | EVEN-0006 | EVEN-0004 | 2024-11-18T14:01:50 |

**t_metric_observed_by_event_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVEN-0001 | EVEN-0001 | EVEN-0001 | 0.221 |
| EVEN-0002 | EVEN-0001 | EVEN-0005 | 966.79 |
| EVEN-0003 | EVEN-0001 | EVEN-0007 | 495.10 |
| EVEN-0004 | EVEN-0002 | EVEN-0001 | 0.669 |
| EVEN-0005 | EVEN-0002 | EVEN-0005 | 143.93 |
| EVEN-0006 | EVEN-0002 | EVEN-0007 | 270.10 |
| EVEN-0007 | EVEN-0003 | EVEN-0001 | 0.103 |
| EVEN-0008 | EVEN-0003 | EVEN-0005 | 271.02 |

**t_metric_observed_by_event_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVEN-0001 | EVEN-0001 | EVEN-0002 | Dimension Kind 01 |
| EVEN-0002 | EVEN-0001 | EVEN-0008 | Encoding 02 |
| EVEN-0003 | EVEN-0001 | EVEN-0009 | calibration record |
| EVEN-0004 | EVEN-0001 | EVEN-0010 | es |
| EVEN-0005 | EVEN-0001 | EVEN-0003 | manual |
| EVEN-0006 | EVEN-0001 | EVEN-0006 | mg/L |
| EVEN-0007 | EVEN-0002 | EVEN-0002 | Dimension Kind 07 |
| EVEN-0008 | EVEN-0002 | EVEN-0008 | Encoding 08 |