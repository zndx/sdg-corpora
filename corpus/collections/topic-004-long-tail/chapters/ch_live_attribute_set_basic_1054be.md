---
chapter_id: ch_live_attribute_set_basic_1054be
topic_id: 4
family: 02_observation_measurement
cited_terms: ['attribute_set_basic', 'descriptive_not_retracted', 'log_within_span_context']
model: engine-refine
---

In a robust data governance framework, the integrity of metadata relies on a strict schema where every attribute is formally defined by its name and its corresponding data type. Identifiers serve as the immutable anchors for these definitions, ensuring that attributes like `confidence` or `dimension_kind` are consistently recognized across the system. For instance, an attribute designated as `confidence` is rigorously bound to the `xsd:decimal` type, while `dimension_kind` is constrained to `xsd:string`, establishing a clear boundary for data validation. These definitions are cataloged under unique identifiers—such as `SET-0001` or `RETR-0001`—which act as the primary keys for the attribute registry, allowing the system to distinguish between a decimal measurement and a textual classification without ambiguity.

**t_attribute_set_basic**

| id | attribute |
| --- | --- |
| SET-0001 | Sensor ID |
| SET-0002 | Sensor ID |
| SET-0003 | Sensor ID |
| SET-0004 | Data Source |
| SET-0005 | Sample Mass |
| SET-0006 | Quality Flag |

**t_attribute_set_basic_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| SET-0001 | confidence | xsd:decimal |
| SET-0002 | dimension_kind | xsd:string |
| SET-0003 | method | xsd:string |
| SET-0004 | recorded_at | xsd:dateTime |
| SET-0005 | uncertainty | xsd:decimal |
| SET-0006 | unit | xsd:string |
| SET-0007 | value | xsd:decimal |
| SET-0008 | encoding | xsd:string |

Once an attribute is defined, it must be instantiated against a specific entity to capture real-world data. The entity serves as the focal point where abstract definitions meet concrete values, which are stored in a miscellaneous (`misc`) format tailored to the attribute's type. For example, an entity might be assigned a `recorded_at` value of `2025-04-11T14:14:38` to track temporal precision, or a `confidence` score of `0.501` to quantify measurement certainty. These values are not merely stored in isolation; they are explicitly linked to their parent entity and attribute, ensuring that a value like `Dimension Kind 01` is correctly associated with its corresponding `xsd:string` attribute definition. This separation of definition from instantiation allows the system to handle diverse data types—ranging from `xsd:dateTime` to `xsd:decimal`—within a unified, type-safe architecture.

**t_attribute_set_basic_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SET-0001 | SET-0001 | SET-0004 | 2025-04-11T14:14:38 |
| SET-0002 | SET-0002 | SET-0004 | 2024-10-27T12:43:31 |
| SET-0003 | SET-0003 | SET-0004 | 2023-07-18T04:02:37 |
| SET-0004 | SET-0004 | SET-0004 | 2025-04-28T09:26:57 |
| SET-0005 | SET-0005 | SET-0004 | 2023-08-28T23:05:03 |
| SET-0006 | SET-0006 | SET-0004 | 2024-02-14T11:29:41 |

**t_attribute_set_basic_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SET-0001 | SET-0001 | SET-0001 | 0.501 |
| SET-0002 | SET-0001 | SET-0005 | 613.30 |
| SET-0003 | SET-0001 | SET-0007 | 863.60 |
| SET-0004 | SET-0002 | SET-0001 | 0.946 |
| SET-0005 | SET-0002 | SET-0005 | 609.02 |
| SET-0006 | SET-0002 | SET-0007 | 173.62 |
| SET-0007 | SET-0003 | SET-0001 | 0.926 |
| SET-0008 | SET-0003 | SET-0005 | 843.81 |

**t_attribute_set_basic_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SET-0001 | SET-0001 | SET-0002 | Dimension Kind 01 |
| SET-0002 | SET-0001 | SET-0008 | Encoding 02 |
| SET-0003 | SET-0001 | SET-0009 | audit excerpt |
| SET-0004 | SET-0001 | SET-0010 | fr |
| SET-0005 | SET-0001 | SET-0003 | hybrid |
| SET-0006 | SET-0001 | SET-0006 | ratio |
| SET-0007 | SET-0002 | SET-0002 | Dimension Kind 07 |
| SET-0008 | SET-0002 | SET-0008 | Encoding 08 |

**t_descriptive_not_retracted_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RETR-0001 | RETR-0001 | RETR-0004 | 2024-02-12T07:34:36 |
| RETR-0002 | RETR-0002 | RETR-0004 | 2024-08-04T13:26:29 |
| RETR-0003 | RETR-0003 | RETR-0004 | 2024-08-02T08:30:25 |
| RETR-0004 | RETR-0004 | RETR-0004 | 2025-01-21T18:04:20 |
| RETR-0005 | RETR-0005 | RETR-0004 | 2024-03-11T23:18:32 |
| RETR-0006 | RETR-0006 | RETR-0004 | 2024-12-14T04:10:36 |

**t_descriptive_not_retracted_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RETR-0001 | RETR-0001 | RETR-0001 | 0.736 |
| RETR-0002 | RETR-0001 | RETR-0005 | 273.61 |
| RETR-0003 | RETR-0001 | RETR-0007 | 449.86 |
| RETR-0004 | RETR-0002 | RETR-0001 | 0.217 |
| RETR-0005 | RETR-0002 | RETR-0005 | 724.88 |
| RETR-0006 | RETR-0002 | RETR-0007 | 500.73 |
| RETR-0007 | RETR-0003 | RETR-0001 | 0.920 |
| RETR-0008 | RETR-0003 | RETR-0005 | 966.69 |

The framework extends beyond simple data values to encompass descriptive metadata that tracks the provenance and classification of the data itself. Descriptive records, such as a "Sensor Drift Note" or an "Anomaly Flag Sheet," are treated as first-class entities with their own set of attributes and values. These records are indexed by unique identifiers like `RETR-0001` and are enriched with metadata such as a `method` of type `xsd:string` or a `recorded_at` timestamp of `2024-02-12T07:34:36`. By applying the same rigorous attribute typing to descriptive records, the system ensures that critical context—such as a "Calibration Reference Sheet" or an "intake form"—is stored with the same structural integrity as the operational data it describes, preventing data loss and ensuring that all non-retracted information remains fully auditable.

**t_descriptive_not_retracted**

| id | descriptive | descriptive_2 |
| --- | --- | --- |
| RETR-0001 | Sensor Drift Note | Metadata Extension Record |
| RETR-0002 | Anomaly Flag Sheet | Batch Processing Note |
| RETR-0003 | Sensor Drift Note | Calibration Reference Sheet |
| RETR-0004 | Metadata Index Card | Anomaly Classification Code |
| RETR-0005 | Data Quality Memo | Data Quality Metric Card |
| RETR-0006 | Observation Summary | Anomaly Classification Code |

**t_descriptive_not_retracted_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| RETR-0001 | confidence | xsd:decimal |
| RETR-0002 | dimension_kind | xsd:string |
| RETR-0003 | method | xsd:string |
| RETR-0004 | recorded_at | xsd:dateTime |
| RETR-0005 | uncertainty | xsd:decimal |
| RETR-0006 | unit | xsd:string |
| RETR-0007 | value | xsd:decimal |
| RETR-0008 | encoding | xsd:string |

**t_descriptive_not_retracted_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RETR-0001 | RETR-0001 | RETR-0002 | Dimension Kind 01 |
| RETR-0002 | RETR-0001 | RETR-0008 | Encoding 02 |
| RETR-0003 | RETR-0001 | RETR-0009 | intake form |
| RETR-0004 | RETR-0001 | RETR-0010 | es |
| RETR-0005 | RETR-0001 | RETR-0003 | manual |
| RETR-0006 | RETR-0001 | RETR-0006 | ratio |
| RETR-0007 | RETR-0002 | RETR-0002 | Dimension Kind 07 |
| RETR-0008 | RETR-0002 | RETR-0008 | Encoding 08 |

To maintain accountability and traceability, the system employs a span context model that maps the relationships between logs, sessions, and operational runs. In this model, a `subject` (such as a `batch-scheduler.log` or `disk-io.trace`) is linked to a `target` (such as a `user-session-4492` or `us-east-1-cluster`) through a specific `role` that defines the nature of the interaction. For example, a log entry might be associated with a cluster context under the role of `contributor`, indicating that the log actively generated data within that span, whereas another entry might assume the role of `observer` or `reviewer`, signifying a passive or auditing relationship. This triad of subject, target, and role provides a granular view of system activity, allowing operators to reconstruct the exact sequence of events and understand how different components interacted within a specific operational window.

**t_log_within_span_context**

| id | log |
| --- | --- |
| CONT-0001 | cache-eviction.out |
| CONT-0002 | batch-scheduler.log |
| CONT-0003 | disk-io.trace |
| CONT-0004 | disk-io.trace |
| CONT-0005 | disk-io.trace |
| CONT-0006 | auth-service.warn |

**t_log_within_span_context_within_span_context**

| id | within_span_context |
| --- | --- |
| CONT-0001 | user-session-4492 |
| CONT-0002 | us-east-1-cluster |
| CONT-0003 | ml-inference-run |
| CONT-0004 | warehouse-replication |
| CONT-0005 | warehouse-replication |
| CONT-0006 | us-east-1-cluster |
| CONT-0007 | warehouse-replication |

**t_log_within_span_context__within_span_context**

| id | log_id | within_span_context_id | role |
| --- | --- | --- | --- |
| CONT-0001 | CONT-0006 | CONT-0003 | reviewer |
| CONT-0002 | CONT-0005 | CONT-0004 | observer |
| CONT-0003 | CONT-0004 | CONT-0004 | contributor |
| CONT-0004 | CONT-0004 | CONT-0004 | contributor |
| CONT-0005 | CONT-0005 | CONT-0003 | observer |
| CONT-0006 | CONT-0004 | CONT-0006 | contributor |
| CONT-0007 | CONT-0004 | CONT-0005 | observer |
| CONT-0008 | CONT-0002 | CONT-0005 | reviewer |

Ultimately, the interplay between identifiers, attributes, entities, and contextual roles forms the backbone of a compliant and observable data environment. By decoupling the definition of an attribute from its instantiation in an entity, and by explicitly mapping the roles that subjects play within target contexts, the framework eliminates ambiguity in data lineage and access control. Whether tracking a decimal value like `613.30` or auditing a log within a `ml-inference-run`, every piece of information is anchored to a unique identifier and governed by strict type constraints. This structured approach ensures that data remains not only accurate and accessible but also fully traceable to its source, its classification, and the operational context in which it was created.