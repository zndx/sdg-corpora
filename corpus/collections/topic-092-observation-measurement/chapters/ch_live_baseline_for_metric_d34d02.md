---
chapter_id: ch_live_baseline_for_metric_d34d02
topic_id: 92
family: 07_long_tail
cited_terms: ['baseline_for_metric', 'backward_compatible_with', 'attribute_set_max_attrs']
model: engine-refine
---

Attributes constitute the foundational metadata layer through which system properties are catalogued, typed, and valued. Each attribute is assigned a unique identifier—ATTR-0001 through ATTR-0004 in the reference set—and a semantic name such as voltage_dc, flow_rate_lpm, humidity_percent, or particulate_um, denoting the physical or operational quantity it represents. The attribute type constrains the domain of permissible values: xsd:decimal for numeric measurements, xsd:string for categorical or textual descriptors, and xsd:dateTime for temporal stamps. This type discipline is enforced through a tripartite value storage scheme, wherein decimal-valued attributes (confidence, recorded_at) are persisted in a dedicated decimal store, string-valued attributes (dimension_kind, method) in a variable-character store, and datetime-valued attributes (recorded_at) in a time-aware store. An entity—identified by its own attribute-set key such as ATTR-0001—acquires its descriptive profile through these value associations, linking to specific attribute definitions and receiving concrete values like 0.687 for confidence, Dimension Kind 01 for dimension_kind, or 2024-07-05T18:39:47 for recorded_at.

**t_attribute_set_max_attrs**

| id | attribute |
| --- | --- |
| ATTR-0001 | voltage_dc |
| ATTR-0002 | flow_rate_lpm |
| ATTR-0003 | humidity_percent |
| ATTR-0004 | particulate_um |
| ATTR-0005 | particulate_um |
| ATTR-0006 | humidity_percent |

**t_attribute_set_max_attrs_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ATTR-0001 | confidence | xsd:decimal |
| ATTR-0002 | dimension_kind | xsd:string |
| ATTR-0003 | method | xsd:string |
| ATTR-0004 | recorded_at | xsd:dateTime |
| ATTR-0005 | uncertainty | xsd:decimal |
| ATTR-0006 | unit | xsd:string |
| ATTR-0007 | value | xsd:decimal |
| ATTR-0008 | encoding | xsd:string |

**t_attribute_set_max_attrs_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTR-0001 | ATTR-0001 | ATTR-0004 | 2024-07-05T18:39:47 |
| ATTR-0002 | ATTR-0002 | ATTR-0004 | 2024-04-21T13:05:05 |
| ATTR-0003 | ATTR-0003 | ATTR-0004 | 2023-05-25T09:01:45 |
| ATTR-0004 | ATTR-0004 | ATTR-0004 | 2025-03-29T09:43:13 |
| ATTR-0005 | ATTR-0005 | ATTR-0004 | 2024-03-07T20:41:06 |
| ATTR-0006 | ATTR-0006 | ATTR-0004 | 2024-01-09T06:52:17 |

**t_attribute_set_max_attrs_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTR-0001 | ATTR-0001 | ATTR-0001 | 0.687 |
| ATTR-0002 | ATTR-0001 | ATTR-0005 | 125.69 |
| ATTR-0003 | ATTR-0001 | ATTR-0007 | 391.05 |
| ATTR-0004 | ATTR-0002 | ATTR-0001 | 0.041 |
| ATTR-0005 | ATTR-0002 | ATTR-0005 | 165.49 |
| ATTR-0006 | ATTR-0002 | ATTR-0007 | 169.37 |
| ATTR-0007 | ATTR-0003 | ATTR-0001 | 0.232 |
| ATTR-0008 | ATTR-0003 | ATTR-0005 | 309.64 |

**t_attribute_set_max_attrs_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTR-0001 | ATTR-0001 | ATTR-0002 | Dimension Kind 01 |
| ATTR-0002 | ATTR-0001 | ATTR-0008 | Encoding 02 |
| ATTR-0003 | ATTR-0001 | ATTR-0009 | audit excerpt |
| ATTR-0004 | ATTR-0001 | ATTR-0010 | de |
| ATTR-0005 | ATTR-0001 | ATTR-0003 | hybrid |
| ATTR-0006 | ATTR-0001 | ATTR-0006 | kg |
| ATTR-0007 | ATTR-0002 | ATTR-0002 | Dimension Kind 07 |
| ATTR-0008 | ATTR-0002 | ATTR-0008 | Encoding 08 |

Baseline metrics establish the reference conditions against which system behaviour is measured and deviations are assessed. The baseline registry maps each metric identifier—METR-0001 through METR-0004—to a canonical baseline type, including Standard_Daylight_Cycle, Power_Consumption, Structural_Stress, and Steady_State_Vibration. These baselines are not isolated definitions; they participate in cross-referential relationships that express how one baseline serves as the reference point for another. For instance, the baseline associated with METR-0001 (Standard_Daylight_Cycle) is itself grounded in Data_Ingestion_Rate, while METR-0003 (Structural_Stress) references Steady_State_Vibration as its comparative anchor. This bidirectional dependency structure ensures that metric evaluation remains traceable to an auditable chain of reference conditions.

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

The relationship between baselines is mediated through a role-annotated association table that explicitly distinguishes the subject baseline from the target baseline and assigns a functional role to each pairing. In this model, a baseline such as METR-0007 may act as the owner of a relationship with METR-0004, while METR-0001 serves as an observer of METR-0005, and METR-0007 functions as a contributor to METR-0003. The role classification—owner, contributor, observer—encodes the nature of the dependency: an owner baseline defines the primary reference, a contributor baseline supplies supplementary context, and an observer baseline monitors or records the relationship without altering the reference condition. This tripartite role taxonomy enables fine-grained governance of baseline interdependencies, ensuring that changes to a contributing baseline can be evaluated for their downstream impact on dependent metrics.

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

Backward compatibility relationships follow an analogous structural pattern, linking a given system version to the versions with which it maintains interoperability. The compatibility registry records entries such as gRPC 1.50 being compatible with OpenTelemetry 1.10, Terraform v1.4 with Avro 1.9, and Kafka 2.8 with itself—a self-referential compatibility assertion that signals stable internal versioning. As with baseline relationships, these compatibility pairings are annotated with roles, predominantly observer, with isolated instances of owner designation (as in the pairing of WITH-0005 with WITH-0001). The observer role in this context indicates that the compatibility relationship is informational or monitored rather than prescriptive, whereas the owner role signifies an authoritative compatibility declaration that governs version selection and deployment constraints.

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

Collectively, these tables implement a unified relationship model in which entities, attributes, baselines, and compatibility declarations are connected through a consistent subject-target-role triad. The identifier column serves as the stable key across all relationship tables, while the subject and target columns reference the participating entities, and the role column classifies the nature of the connection. This design ensures that every relationship—whether it expresses an attribute value assignment, a baseline dependency, or a version compatibility claim—is explicitly typed, traceable, and governed by a role-based access and change-control policy. The result is a metadata fabric that supports rigorous auditability, version-aware dependency management, and attribute-level data integrity across the system.