---
chapter_id: ch_live_lift_basic_1f3e8f
topic_id: 89
family: 02_observation_measurement
cited_terms: ['lift_basic', 'lift_subclass', 'lift_with_baseline_rate']
model: engine-refine
---

The identification and classification of physical and logical entities within an asset registry demands a disciplined separation between the entity itself, the properties that describe it, and the concrete values those properties assume. An entity—whether designated as an Observatory Lift, a Freight Service Lift, or a Conveyor-Lift-42—is distinguished by a unique identifier such as LIFT-0001 or LIFT-0004. These identifiers serve as the immutable anchor for all subsequent queries, joins, and audit trails. The entity's human-readable designation, recorded in the lift column, provides operational context without introducing ambiguity into system-level references. Classification extends further through the of_attribute_set column, which assigns each entity to a functional grouping such as Maintenance-Schedules, Performance-Logs, or Telemetry-Metrics, thereby enabling role-based access, aggregation, and reporting at the set level rather than the individual entity level.

Attributes constitute the schema layer that defines what properties may be recorded for any given entity. Each attribute is identified by a name—confidence, dimension_kind, method, recorded_at—and assigned an XSD type that constrains the permissible value domain. The type system enforces data integrity at the definition level: confidence is declared as xsd:decimal, dimension_kind and method as xsd:string, and recorded_at as xsd:dateTime. This typed declaration ensures that every value stored against an attribute conforms to its expected format, eliminating the need for ad hoc validation at query time. The attribute definitions are themselves organized by entity class, so that basic lifts, subclass entities, and baseline-rate entities each maintain their own attribute registries while sharing a common structural vocabulary.

**t_lift_basic_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LIFT-0001 | LIFT-0001 | LIFT-0004 | 2024-06-13T06:43:09 |
| LIFT-0002 | LIFT-0002 | LIFT-0004 | 2024-12-03T09:28:05 |
| LIFT-0003 | LIFT-0003 | LIFT-0004 | 2024-01-28T22:31:03 |
| LIFT-0004 | LIFT-0004 | LIFT-0004 | 2024-06-11T06:27:27 |
| LIFT-0005 | LIFT-0005 | LIFT-0004 | 2023-05-13T18:59:00 |
| LIFT-0006 | LIFT-0006 | LIFT-0004 | 2023-02-07T19:19:23 |
| LIFT-0007 | LIFT-0007 | LIFT-0004 | 2023-12-22T04:56:51 |

**t_lift_basic_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LIFT-0001 | LIFT-0001 | LIFT-0001 | 0.624 |
| LIFT-0002 | LIFT-0001 | LIFT-0005 | 93.24 |
| LIFT-0003 | LIFT-0001 | LIFT-0007 | 541.29 |
| LIFT-0004 | LIFT-0002 | LIFT-0001 | 0.175 |
| LIFT-0005 | LIFT-0002 | LIFT-0005 | 180.41 |
| LIFT-0006 | LIFT-0002 | LIFT-0007 | 256.73 |
| LIFT-0007 | LIFT-0003 | LIFT-0001 | 0.866 |
| LIFT-0008 | LIFT-0003 | LIFT-0005 | 594.06 |

**t_lift_subclass_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LIFT-0001 | LIFT-0001 | LIFT-0004 | 2023-07-08T17:11:17 |
| LIFT-0002 | LIFT-0002 | LIFT-0004 | 2024-09-30T16:47:04 |
| LIFT-0003 | LIFT-0003 | LIFT-0004 | 2024-05-04T22:26:39 |
| LIFT-0004 | LIFT-0004 | LIFT-0004 | 2023-07-25T13:54:30 |
| LIFT-0005 | LIFT-0005 | LIFT-0004 | 2023-05-12T01:02:41 |
| LIFT-0006 | LIFT-0006 | LIFT-0004 | 2024-03-06T23:43:02 |

**t_lift_subclass_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LIFT-0001 | LIFT-0001 | LIFT-0001 | 0.387 |
| LIFT-0002 | LIFT-0001 | LIFT-0005 | 587.63 |
| LIFT-0003 | LIFT-0001 | LIFT-0007 | 57.65 |
| LIFT-0004 | LIFT-0002 | LIFT-0001 | 0.879 |
| LIFT-0005 | LIFT-0002 | LIFT-0005 | 736.98 |
| LIFT-0006 | LIFT-0002 | LIFT-0007 | 707.73 |
| LIFT-0007 | LIFT-0003 | LIFT-0001 | 0.901 |
| LIFT-0008 | LIFT-0003 | LIFT-0005 | 70.32 |

**t_lift_with_baseline_rate_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RATE-0001 | RATE-0001 | RATE-0004 | 2024-01-14T18:32:00 |
| RATE-0002 | RATE-0002 | RATE-0004 | 2023-02-02T03:32:58 |
| RATE-0003 | RATE-0003 | RATE-0004 | 2024-08-11T22:28:18 |
| RATE-0004 | RATE-0004 | RATE-0004 | 2024-10-19T09:19:40 |
| RATE-0005 | RATE-0005 | RATE-0004 | 2023-07-24T08:45:17 |
| RATE-0006 | RATE-0006 | RATE-0004 | 2025-03-24T11:20:59 |

**t_lift_with_baseline_rate_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RATE-0001 | RATE-0001 | RATE-0001 | 0.799 |
| RATE-0002 | RATE-0001 | RATE-0005 | 559.38 |
| RATE-0003 | RATE-0001 | RATE-0007 | 634.64 |
| RATE-0004 | RATE-0002 | RATE-0001 | 0.522 |
| RATE-0005 | RATE-0002 | RATE-0005 | 254.23 |
| RATE-0006 | RATE-0002 | RATE-0007 | 594.57 |
| RATE-0007 | RATE-0003 | RATE-0001 | 0.290 |
| RATE-0008 | RATE-0003 | RATE-0005 | 361.02 |

The value storage architecture employs a vertical partitioning strategy in which attribute values are distributed across type-specific tables rather than consolidated into a single heterogeneous column. Decimal values such as 0.624, 93.24, and 541.29 reside in the decimal value table; string values such as Dimension Kind 01, Encoding 02, and change rationale occupy the varchar value table; and temporal values such as 2024-06-13T06:43:09 and 2023-07-08T17:11:17 are stored in the datetime value table. Each value row is linked to its owning entity through the entity_id foreign key and to its defining attribute through the attr_id foreign key, forming a normalized EAV (Entity-Attribute-Value) triad. This design permits type-safe indexing, efficient range queries on numeric and temporal columns, and the addition of new attribute types without schema migration of existing value tables.

The same structural pattern recurs across entity subclasses and baseline-rate entities, demonstrating the model's capacity for horizontal scaling. Subclass entities such as Elevator-Controller-22 and Data-Migration-7B carry their own identifiers (LIFT-0001 through LIFT-0004) and attribute definitions that mirror the basic entity schema, yet their values are stored in separate subclass-specific value tables. Baseline-rate entities—Conversion Gain, Latency Peak Reduction, Click Through Uplift, Model v2 Accuracy Lift—introduce an additional baseline_rate column whose values (Control Group Mean, Previous Release Metric, Historical Median) provide the reference point against which lift measurements are evaluated. The attribute definitions for these entities follow the identical attr_name/attr_type pattern, and their values are partitioned across the same type-specific tables, ensuring that query patterns remain uniform regardless of entity class.

**t_lift_basic**

| id | lift |
| --- | --- |
| LIFT-0001 | Observatory Lift |
| LIFT-0002 | Freight Service Lift |
| LIFT-0003 | Freight Service Lift |
| LIFT-0004 | Observatory Lift |
| LIFT-0005 | Observatory Lift |
| LIFT-0006 | Cargo Bay Lift |
| LIFT-0007 | Cargo Bay Lift |

**t_lift_basic_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| LIFT-0001 | confidence | xsd:decimal |
| LIFT-0002 | dimension_kind | xsd:string |
| LIFT-0003 | method | xsd:string |
| LIFT-0004 | recorded_at | xsd:dateTime |
| LIFT-0005 | uncertainty | xsd:decimal |
| LIFT-0006 | unit | xsd:string |
| LIFT-0007 | value | xsd:decimal |
| LIFT-0008 | encoding | xsd:string |

**t_lift_basic_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LIFT-0001 | LIFT-0001 | LIFT-0002 | Dimension Kind 01 |
| LIFT-0002 | LIFT-0001 | LIFT-0008 | Encoding 02 |
| LIFT-0003 | LIFT-0001 | LIFT-0009 | change rationale |
| LIFT-0004 | LIFT-0001 | LIFT-0010 | de |
| LIFT-0005 | LIFT-0001 | LIFT-0003 | manual |
| LIFT-0006 | LIFT-0001 | LIFT-0006 | m/s |
| LIFT-0007 | LIFT-0002 | LIFT-0002 | Dimension Kind 07 |
| LIFT-0008 | LIFT-0002 | LIFT-0008 | Encoding 08 |

**t_lift_subclass**

| id | lift | of_attribute_set |
| --- | --- | --- |
| LIFT-0001 | Elevator-Controller-22 | Maintenance-Schedules |
| LIFT-0002 | Data-Migration-7B | Maintenance-Schedules |
| LIFT-0003 | Sample-Handler-14 | Performance-Logs |
| LIFT-0004 | Conveyor-Lift-42 | Telemetry-Metrics |
| LIFT-0005 | Telemetry-Relay-8F | Maintenance-Schedules |
| LIFT-0006 | Elevator-Controller-22 | Network-Topologies |

**t_lift_subclass_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| LIFT-0001 | confidence | xsd:decimal |
| LIFT-0002 | dimension_kind | xsd:string |
| LIFT-0003 | method | xsd:string |
| LIFT-0004 | recorded_at | xsd:dateTime |
| LIFT-0005 | uncertainty | xsd:decimal |
| LIFT-0006 | unit | xsd:string |
| LIFT-0007 | value | xsd:decimal |
| LIFT-0008 | encoding | xsd:string |

**t_lift_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LIFT-0001 | LIFT-0001 | LIFT-0002 | Dimension Kind 01 |
| LIFT-0002 | LIFT-0001 | LIFT-0008 | Encoding 02 |
| LIFT-0003 | LIFT-0001 | LIFT-0009 | intake form |
| LIFT-0004 | LIFT-0001 | LIFT-0010 | en |
| LIFT-0005 | LIFT-0001 | LIFT-0003 | manual |
| LIFT-0006 | LIFT-0001 | LIFT-0006 | m/s |
| LIFT-0007 | LIFT-0002 | LIFT-0002 | Dimension Kind 07 |
| LIFT-0008 | LIFT-0002 | LIFT-0008 | Encoding 08 |

**t_lift_with_baseline_rate**

| id | lift | baseline_rate |
| --- | --- | --- |
| RATE-0001 | Conversion Gain | Control Group Mean |
| RATE-0002 | Latency Peak Reduction | Previous Release Metric |
| RATE-0003 | Click Through Uplift | Historical Median |
| RATE-0004 | Model v2 Accuracy Lift | Historical Median |
| RATE-0005 | Latency Peak Reduction | 72 Hour Average |
| RATE-0006 | Ad Improvement | Previous Release Metric |

**t_lift_with_baseline_rate_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| RATE-0001 | confidence | xsd:decimal |
| RATE-0002 | dimension_kind | xsd:string |
| RATE-0003 | method | xsd:string |
| RATE-0004 | recorded_at | xsd:dateTime |
| RATE-0005 | uncertainty | xsd:decimal |
| RATE-0006 | unit | xsd:string |
| RATE-0007 | value | xsd:decimal |
| RATE-0008 | encoding | xsd:string |

**t_lift_with_baseline_rate_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RATE-0001 | RATE-0001 | RATE-0002 | Dimension Kind 01 |
| RATE-0002 | RATE-0001 | RATE-0008 | Encoding 02 |
| RATE-0003 | RATE-0001 | RATE-0009 | pre-release note |
| RATE-0004 | RATE-0001 | RATE-0010 | de |
| RATE-0005 | RATE-0001 | RATE-0003 | automated |
| RATE-0006 | RATE-0001 | RATE-0006 | ratio |
| RATE-0007 | RATE-0002 | RATE-0002 | Dimension Kind 07 |
| RATE-0008 | RATE-0002 | RATE-0008 | Encoding 08 |

This architecture achieves a balance between flexibility and rigor. The EAV model accommodates entities with differing attribute profiles without requiring schema changes, while the XSD-typed value partitioning preserves the performance and correctness guarantees of a relational system. Identifiers provide stable join keys across all tables; attributes define the semantic vocabulary; values carry the operational data; and attribute sets enable organizational grouping. The result is a registry that can grow organically—new entity types, new attributes, new value types—without compromising the integrity of existing data or the efficiency of existing queries.