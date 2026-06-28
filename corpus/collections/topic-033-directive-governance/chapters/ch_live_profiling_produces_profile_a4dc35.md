---
chapter_id: ch_live_profiling_produces_profile_a4dc35
topic_id: 33
family: 02_observation_measurement
cited_terms: ['profiling_produces_profile', 'measurement_observed_at', 'verification_traces_requirement']
model: engine-refine
---

The attribute framework establishes a typed, entity-centric model for recording observational metadata and verification outcomes across heterogeneous measurement systems. Each attribute is defined by a name and a corresponding type drawn from the XML Schema Definition namespace—`xsd:decimal` for numeric quantities such as confidence scores (0.528, 0.215), `xsd:string` for categorical descriptors like dimension kind and encoding labels, and `xsd:dateTime` for temporal markers including recorded-at timestamps such as 2023-12-12T12:05:13 and 2025-01-18T10:03:30. This type discipline ensures that every value stored against an attribute conforms to a predictable schema, enabling consistent validation, cross-system interoperability, and reliable aggregation. The attribute registry itself—exemplified by entries for confidence, dimension_kind, method, and recorded_at—serves as the canonical vocabulary against which all observed values are interpreted, decoupling semantic definition from the physical storage of values.

**t_measurement_observed_at**

| id | measurement | observed_at |
| --- | --- | --- |
| OBSE-0001 | temperature gradient | Monitoring Station Bravo |
| OBSE-0002 | packet loss | Observatory Dome 2 |
| OBSE-0003 | wind shear | Lab Bench 7B |
| OBSE-0004 | network latency | Weather Mast Delta |
| OBSE-0005 | pH level | Telemetry Gateway Alpha |
| OBSE-0006 | pH level | Calibration Rack 9 |

**t_measurement_observed_at_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| OBSE-0001 | confidence | xsd:decimal |
| OBSE-0002 | dimension_kind | xsd:string |
| OBSE-0003 | method | xsd:string |
| OBSE-0004 | recorded_at | xsd:dateTime |
| OBSE-0005 | uncertainty | xsd:decimal |
| OBSE-0006 | unit | xsd:string |
| OBSE-0007 | value | xsd:decimal |
| OBSE-0008 | encoding | xsd:string |

**t_measurement_observed_at_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OBSE-0001 | OBSE-0001 | OBSE-0004 | 2023-12-12T12:05:13 |
| OBSE-0002 | OBSE-0002 | OBSE-0004 | 2024-12-09T20:37:11 |
| OBSE-0003 | OBSE-0003 | OBSE-0004 | 2023-09-12T00:10:32 |
| OBSE-0004 | OBSE-0004 | OBSE-0004 | 2024-08-27T19:17:19 |
| OBSE-0005 | OBSE-0005 | OBSE-0004 | 2025-06-14T14:45:22 |
| OBSE-0006 | OBSE-0006 | OBSE-0004 | 2023-03-29T14:19:26 |

**t_measurement_observed_at_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OBSE-0001 | OBSE-0001 | OBSE-0001 | 0.528 |
| OBSE-0002 | OBSE-0001 | OBSE-0005 | 280.63 |
| OBSE-0003 | OBSE-0001 | OBSE-0007 | 384.95 |
| OBSE-0004 | OBSE-0002 | OBSE-0001 | 0.215 |
| OBSE-0005 | OBSE-0002 | OBSE-0005 | 900.19 |
| OBSE-0006 | OBSE-0002 | OBSE-0007 | 524.13 |
| OBSE-0007 | OBSE-0003 | OBSE-0001 | 0.738 |
| OBSE-0008 | OBSE-0003 | OBSE-0005 | 695.46 |

**t_measurement_observed_at_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OBSE-0001 | OBSE-0001 | OBSE-0002 | Dimension Kind 01 |
| OBSE-0002 | OBSE-0001 | OBSE-0008 | Encoding 02 |
| OBSE-0003 | OBSE-0001 | OBSE-0009 | calibration record |
| OBSE-0004 | OBSE-0001 | OBSE-0010 | de |
| OBSE-0005 | OBSE-0001 | OBSE-0003 | hybrid |
| OBSE-0006 | OBSE-0001 | OBSE-0006 | nm |
| OBSE-0007 | OBSE-0002 | OBSE-0002 | Dimension Kind 07 |
| OBSE-0008 | OBSE-0002 | OBSE-0008 | Encoding 08 |

**t_verification_traces_requirement_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| REQU-0001 | duration_seconds | xsd:decimal |
| REQU-0002 | end_time | xsd:dateTime |
| REQU-0003 | exit_code | xsd:integer |
| REQU-0004 | host_name | xsd:string |
| REQU-0005 | log_level | xsd:string |
| REQU-0006 | phase | xsd:string |
| REQU-0007 | retry_count | xsd:integer |
| REQU-0008 | scheduled_at | xsd:dateTime |

Entities function as the primary anchoring construct, binding attributes to their measured values through a foreign-key relationship that preserves referential integrity across the value tables. An entity such as OBSE-0001, representing a specific measurement observation, may carry multiple attribute-value pairs distributed across type-specialized tables: a decimal value of 280.63 for one attribute, a string value of Dimension Kind 01 for another, and a datetime value of 2023-12-12T12:05:13 for yet another. This normalization strategy avoids wide, sparse rows and instead models each attribute as an independent fact, allowing attributes to be added, deprecated, or re-typed without schema migration. The same pattern applies to verification entities—REQU-0001 through REQU-0004, corresponding to assessments such as Functional Safety Assessment, Type Certification Review, ISO 9001 Compliance Audit, and FAT Factory Acceptance—each of which carries its own set of typed attributes including duration_seconds (5386.82, 3098.08, 4624.20, 6273.82), exit_code (954, 329, 641, 69), and host_name (gw-12).

The identifier namespace provides a stable, scoped key for every entity and attribute in the system. Observation identifiers follow the pattern OBSE-NNNN, verification identifiers follow REQU-NNNN, and profiling identifiers follow PROF-NNNN, each prefix delineating a distinct conceptual domain while preserving a uniform addressing scheme. Within the profiling domain, identifiers such as PROF-0001 through PROF-0004 serve as both primary keys in the fact table and foreign keys in the produces dimension, enabling a many-to-many relationship between profiling runs and their associated outputs. The produces dimension itself—captured in the dim_produces table—associates each identifier with a human-readable label (Produces Label 01 through Produces Label 04) and a category classification (Produces Category 01 through Produces Category 04), thereby providing the misc metadata that supports filtering, grouping, and reporting without embedding free-text directly into the fact table.

**dim_produces**

| id | produces_label | produces_category |
| --- | --- | --- |
| PROF-0001 | Produces Label 01 | Produces Category 01 |
| PROF-0002 | Produces Label 02 | Produces Category 02 |
| PROF-0003 | Produces Label 03 | Produces Category 03 |
| PROF-0004 | Produces Label 04 | Produces Category 04 |
| PROF-0005 | Produces Label 05 | Produces Category 05 |
| PROF-0006 | Produces Label 06 | Produces Category 06 |

**t_verification_traces_requirement**

| id | verification |
| --- | --- |
| REQU-0001 | Functional Safety Assessment |
| REQU-0002 | Type Certification Review |
| REQU-0003 | ISO 9001 Compliance Audit |
| REQU-0004 | FAT Factory Acceptance |
| REQU-0005 | Type Certification Review |
| REQU-0006 | Type Certification Review |

**t_verification_traces_requirement_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| REQU-0001 | REQU-0001 | REQU-0002 | 2025-01-18T10:03:30 |
| REQU-0002 | REQU-0001 | REQU-0008 | 2023-06-09T08:44:28 |
| REQU-0003 | REQU-0001 | REQU-0009 | 2025-02-02T23:23:29 |
| REQU-0004 | REQU-0002 | REQU-0002 | 2024-03-08T07:44:16 |
| REQU-0005 | REQU-0002 | REQU-0008 | 2024-10-17T04:41:38 |
| REQU-0006 | REQU-0002 | REQU-0009 | 2024-09-18T04:36:09 |
| REQU-0007 | REQU-0003 | REQU-0002 | 2025-05-20T16:00:41 |
| REQU-0008 | REQU-0003 | REQU-0008 | 2025-05-09T00:47:08 |

**t_verification_traces_requirement_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| REQU-0001 | REQU-0001 | REQU-0001 | 5386.82 |
| REQU-0002 | REQU-0002 | REQU-0001 | 3098.08 |
| REQU-0003 | REQU-0003 | REQU-0001 | 4624.20 |
| REQU-0004 | REQU-0004 | REQU-0001 | 6273.82 |
| REQU-0005 | REQU-0005 | REQU-0001 | 833.29 |
| REQU-0006 | REQU-0006 | REQU-0001 | 3490.28 |

**t_verification_traces_requirement_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| REQU-0001 | REQU-0001 | REQU-0003 | 954 |
| REQU-0002 | REQU-0001 | REQU-0007 | 329 |
| REQU-0003 | REQU-0002 | REQU-0003 | 641 |
| REQU-0004 | REQU-0002 | REQU-0007 | 69 |
| REQU-0005 | REQU-0003 | REQU-0003 | 829 |
| REQU-0006 | REQU-0003 | REQU-0007 | 87 |
| REQU-0007 | REQU-0004 | REQU-0003 | 46 |
| REQU-0008 | REQU-0004 | REQU-0007 | 237 |

**t_verification_traces_requirement_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| REQU-0001 | REQU-0001 | REQU-0004 | gw-12 |
| REQU-0002 | REQU-0001 | REQU-0005 | Log Level 02 |
| REQU-0003 | REQU-0001 | REQU-0006 | execution |
| REQU-0004 | REQU-0001 | REQU-0010 | complete |
| REQU-0005 | REQU-0001 | REQU-0011 | Triggered By 05 |
| REQU-0006 | REQU-0002 | REQU-0004 | ingest-21 |
| REQU-0007 | REQU-0002 | REQU-0005 | Log Level 07 |
| REQU-0008 | REQU-0002 | REQU-0006 | execution |

Duration and exit metrics constitute the core performance indicators within the profiling fact table, where each profiling run is characterized by its elapsed time in seconds (ranging from 1113.38 to 6716.87), its exit code (values such as 725, 809, 348, and 827 indicating termination status), and its retry count (ranging from 186 to 303, reflecting the number of recovery attempts before final resolution). These three columns—duration_seconds, exit_code, and retry_count—form a triad of operational telemetry that, when joined with the produces dimension via the produces_key foreign key, enables root-cause analysis of profiling failures, capacity planning based on duration distributions, and reliability assessment through retry frequency. The exit codes, in particular, serve as machine-readable signals that can be mapped to semantic categories (success, timeout, resource exhaustion) without requiring human interpretation of raw numeric values.

**fact_profiling**

| id | produces_key | duration_seconds | exit_code | retry_count |
| --- | --- | --- | --- | --- |
| PROF-0001 | PROF-0001 | 6716.87 | 725 | 209 |
| PROF-0002 | PROF-0004 | 1113.38 | 809 | 186 |
| PROF-0003 | PROF-0004 | 2546.61 | 348 | 303 |
| PROF-0004 | PROF-0006 | 2074.93 | 827 | 264 |

The measurement domain extends this attribute-entity-value model to physical and network observations, where attributes such as confidence and method are recorded against entities representing measurements like temperature gradient, packet loss, wind shear, and network latency. These measurements are themselves associated with observed-at locations—Monitoring Station Bravo, Observatory Dome 2, Lab Bench 7B, Weather Mast Delta—providing the spatial and temporal context necessary for reproducibility. The separation of attribute definitions from their values, and of entities from their measurements, creates a flexible ontology that can accommodate new attribute types and measurement modalities without restructuring the underlying schema, while the typed value tables ensure that every recorded datum carries its semantic type explicitly, eliminating ambiguity in downstream analytics and compliance reporting.