---
chapter_id: ch_live_audit_subclass_e5393d
topic_id: 26
family: 03_directive_governance
cited_terms: ['audit_subclass', 'mass_function_equiv_frame_and_assignment', 'aggregation_over_time_window']
model: engine-refine
---

Attributes, their types, and the entities to which they are bound constitute the fundamental scaffolding of any structured knowledge representation system. An attribute defines a dimension of description—duration_seconds, end_time, exit_code, host_name—each carrying a declared type such as xsd:decimal, xsd:dateTime, xsd:integer, or xsd:string that constrains the domain of permissible values. The attribute type is not merely metadata; it governs storage layout, validation semantics, and the machinery by which heterogeneous data is routed to the correct value store. In practice, this type discipline manifests as a family of value tables, each specialized for a single XML Schema type. Decimal-valued attributes like duration_seconds receive values such as 6622.09, 3520.06, 6281.16, and 5487.90 in one store; integer-valued attributes such as exit_code are recorded as 943, 337, 718, 453 in another; datetime attributes like end_time carry ISO 8601 timestamps including 2023-11-27T16:16:19 and 2024-01-27T14:20:44; and string-valued attributes such as host_name hold values like node-b14, Log Level 02, execution, and running. This separation by type eliminates ambiguity at query time and ensures that a value of 0.002 is never conflated with the string "0.002" or the integer 0.

Entities serve as the anchor points to which attributes are affixed. Each entity is identified by a stable, opaque key—AUDI-0001, ASSI-0001, WIND-0001—that functions as the foreign key in every value table. The entity identifier does not encode meaning; it merely guarantees referential integrity across the distributed value stores. A single entity, AUDI-0001, for instance, may carry a decimal value of 6622.09 for attribute AUDI-0001, a datetime value of 2023-11-27T16:16:19 for attribute AUDI-0002, an integer value of 943 for attribute AUDI-0003, and a string value of node-b14 for attribute AUDI-0004. The entity is the tuple that binds these disparate typed values into a coherent record. Without the entity identifier, the value tables would be an unstructured collection of isolated measurements with no mechanism for reconstruction.

The attribute definitions themselves are catalogued in a schema table that maps each attribute identifier to its name and type. The attribute AUDI-0001 corresponds to duration_seconds of type xsd:decimal; AUDI-0002 to end_time of type xsd:dateTime; AUDI-0003 to exit_code of type xsd:integer; and AUDI-0004 to host_name of type xsd:string. This mapping is the lookup table that resolves a raw attr_id in a value row to a human-readable attribute name and, crucially, to the correct value table. When a query arrives for the duration_seconds of entity AUDI-0001, the system first consults the attribute schema to determine that AUDI-0001 is xsd:decimal, then routes the lookup to the decimal value store, where the value 6622.09 is retrieved. The same attr_id appearing in a different value table would be a referential integrity violation, and the schema enforces this invariant.

The pattern repeats across distinct subject domains, each with its own namespace of identifiers but an identical structural grammar. In the mass function domain, identifiers ASSI-0001 through ASSI-0004 anchor assignments such as corrosion_rate_measurement, optical_transmittance_run, magnetic_offset_calibration, and vibration_profile_test, each mapped over a frame of discernment and assigned to a target concept like fault_or_failure, land_or_sea_only, or degraded_state_only. The attributes for these assignments—confidence, dimension_kind, method, recorded_at—follow the same type discipline: confidence is xsd:decimal with values 0.002 and 0.018; dimension_kind and method are xsd:string with values Dimension Kind 01, Encoding 02, pre-release note, and fr; recorded_at is xsd:dateTime with values 2025-06-10T14:56:29 and 2024-06-25T12:59:02. In the aggregation domain, identifiers WIND-0001 through WIND-0004 anchor aggregations such as RealTimeClusterLoad, MonthlyThroughputMetric, and AnnualCapacityForecast over time windows including MonthlySettlement, TrailingSevenDays, and BusinessHours, with attributes of identical names and types and values such as 0.781, 86.18, 786.35, 0.307 for decimal, and en, Dimension Kind 01, Encoding 02, pre-release note for string. The uniformity of structure across domains is the design's principal strength: the same query engine, the same join logic, the same type routing, regardless of whether the subject is an audit subclass or a mass function assignment or a time-windowed aggregation.

**t_audit_subclass**

| id | audit |
| --- | --- |
| AUDI-0001 | SOC2 Type II Review |
| AUDI-0002 | PCI DSS Certification |
| AUDI-0003 | GDPR Data Flow Assessment |
| AUDI-0004 | HIPAA Security Audit |
| AUDI-0005 | HIPAA Security Audit |
| AUDI-0006 | 21 CFR Part 11 Audit |

**t_audit_subclass_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| AUDI-0001 | duration_seconds | xsd:decimal |
| AUDI-0002 | end_time | xsd:dateTime |
| AUDI-0003 | exit_code | xsd:integer |
| AUDI-0004 | host_name | xsd:string |
| AUDI-0005 | log_level | xsd:string |
| AUDI-0006 | phase | xsd:string |
| AUDI-0007 | retry_count | xsd:integer |
| AUDI-0008 | scheduled_at | xsd:dateTime |

**t_audit_subclass_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AUDI-0001 | AUDI-0001 | AUDI-0002 | 2023-11-27T16:16:19 |
| AUDI-0002 | AUDI-0001 | AUDI-0008 | 2024-01-27T14:20:44 |
| AUDI-0003 | AUDI-0001 | AUDI-0009 | 2024-07-11T22:06:19 |
| AUDI-0004 | AUDI-0002 | AUDI-0002 | 2023-02-20T00:46:50 |
| AUDI-0005 | AUDI-0002 | AUDI-0008 | 2024-05-24T19:51:15 |
| AUDI-0006 | AUDI-0002 | AUDI-0009 | 2024-12-09T14:14:21 |
| AUDI-0007 | AUDI-0003 | AUDI-0002 | 2024-03-22T08:33:34 |
| AUDI-0008 | AUDI-0003 | AUDI-0008 | 2024-07-04T21:25:06 |

**t_mass_function_equiv_frame_and_assignment**

| id | mass | over_frame_of_discernment | assigns_mass_to |
| --- | --- | --- | --- |
| ASSI-0001 | corrosion_rate_measurement | AUDI-0001 | fault_or_failure |
| ASSI-0002 | optical_transmittance_run | AUDI-0005 | land_or_sea_only |
| ASSI-0003 | magnetic_offset_calibration | AUDI-0003 | degraded_state_only |
| ASSI-0004 | vibration_profile_test | AUDI-0001 | degraded_state_only |
| ASSI-0005 | pressure_deviation_check | AUDI-0003 | high_or_extreme_only |
| ASSI-0006 | vibration_profile_test | AUDI-0003 | degraded_state_only |

**t_mass_function_equiv_frame_and_assignment_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ASSI-0001 | confidence | xsd:decimal |
| ASSI-0002 | dimension_kind | xsd:string |
| ASSI-0003 | method | xsd:string |
| ASSI-0004 | recorded_at | xsd:dateTime |
| ASSI-0005 | uncertainty | xsd:decimal |
| ASSI-0006 | unit | xsd:string |
| ASSI-0007 | value | xsd:decimal |
| ASSI-0008 | encoding | xsd:string |

**t_mass_function_equiv_frame_and_assignment_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ASSI-0001 | ASSI-0001 | ASSI-0004 | 2025-06-10T14:56:29 |
| ASSI-0002 | ASSI-0002 | ASSI-0004 | 2024-06-25T12:59:02 |
| ASSI-0003 | ASSI-0003 | ASSI-0004 | 2024-03-24T16:20:19 |
| ASSI-0004 | ASSI-0004 | ASSI-0004 | 2025-03-04T17:25:44 |
| ASSI-0005 | ASSI-0005 | ASSI-0004 | 2024-07-15T05:15:18 |
| ASSI-0006 | ASSI-0006 | ASSI-0004 | 2023-09-16T23:06:46 |

**t_mass_function_equiv_frame_and_assignment_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ASSI-0001 | ASSI-0001 | ASSI-0001 | 0.002 |
| ASSI-0002 | ASSI-0001 | ASSI-0005 | 724.48 |
| ASSI-0003 | ASSI-0001 | ASSI-0007 | 469.73 |
| ASSI-0004 | ASSI-0002 | ASSI-0001 | 0.018 |
| ASSI-0005 | ASSI-0002 | ASSI-0005 | 449.10 |
| ASSI-0006 | ASSI-0002 | ASSI-0007 | 350.09 |
| ASSI-0007 | ASSI-0003 | ASSI-0001 | 0.405 |
| ASSI-0008 | ASSI-0003 | ASSI-0005 | 839.88 |

**t_mass_function_equiv_frame_and_assignment_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ASSI-0001 | ASSI-0001 | ASSI-0002 | Dimension Kind 01 |
| ASSI-0002 | ASSI-0001 | ASSI-0008 | Encoding 02 |
| ASSI-0003 | ASSI-0001 | ASSI-0009 | pre-release note |
| ASSI-0004 | ASSI-0001 | ASSI-0010 | fr |
| ASSI-0005 | ASSI-0001 | ASSI-0003 | manual |
| ASSI-0006 | ASSI-0001 | ASSI-0006 | kg |
| ASSI-0007 | ASSI-0002 | ASSI-0002 | Dimension Kind 07 |
| ASSI-0008 | ASSI-0002 | ASSI-0008 | Encoding 08 |

**t_aggregation_over_time_window**

| id | aggregation | over_time_window |
| --- | --- | --- |
| WIND-0001 | RealTimeClusterLoad | MonthlySettlement |
| WIND-0002 | MonthlyThroughputMetric | MonthlySettlement |
| WIND-0003 | AnnualCapacityForecast | TrailingSevenDays |
| WIND-0004 | AnnualCapacityForecast | BusinessHours |
| WIND-0005 | RealTimeClusterLoad | BusinessHours |
| WIND-0006 | AnnualCapacityForecast | Sliding24Hour |

**t_aggregation_over_time_window_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| WIND-0001 | confidence | xsd:decimal |
| WIND-0002 | dimension_kind | xsd:string |
| WIND-0003 | method | xsd:string |
| WIND-0004 | recorded_at | xsd:dateTime |
| WIND-0005 | uncertainty | xsd:decimal |
| WIND-0006 | unit | xsd:string |
| WIND-0007 | value | xsd:decimal |
| WIND-0008 | encoding | xsd:string |

**t_aggregation_over_time_window_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| WIND-0001 | WIND-0001 | WIND-0004 | 2023-08-23T11:54:15 |
| WIND-0002 | WIND-0002 | WIND-0004 | 2023-06-25T19:59:38 |
| WIND-0003 | WIND-0003 | WIND-0004 | 2025-01-03T19:33:06 |
| WIND-0004 | WIND-0004 | WIND-0004 | 2023-03-02T05:31:47 |
| WIND-0005 | WIND-0005 | WIND-0004 | 2023-12-24T17:32:49 |
| WIND-0006 | WIND-0006 | WIND-0004 | 2023-09-12T03:58:46 |

**t_aggregation_over_time_window_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| WIND-0001 | WIND-0001 | WIND-0001 | 0.781 |
| WIND-0002 | WIND-0001 | WIND-0005 | 86.18 |
| WIND-0003 | WIND-0001 | WIND-0007 | 786.35 |
| WIND-0004 | WIND-0002 | WIND-0001 | 0.307 |
| WIND-0005 | WIND-0002 | WIND-0005 | 190.14 |
| WIND-0006 | WIND-0002 | WIND-0007 | 820.39 |
| WIND-0007 | WIND-0003 | WIND-0001 | 0.604 |
| WIND-0008 | WIND-0003 | WIND-0005 | 847.59 |

**t_aggregation_over_time_window_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| WIND-0001 | WIND-0001 | WIND-0002 | Dimension Kind 01 |
| WIND-0002 | WIND-0001 | WIND-0008 | Encoding 02 |
| WIND-0003 | WIND-0001 | WIND-0009 | pre-release note |
| WIND-0004 | WIND-0001 | WIND-0010 | en |
| WIND-0005 | WIND-0001 | WIND-0003 | manual |
| WIND-0006 | WIND-0001 | WIND-0006 | kg |
| WIND-0007 | WIND-0002 | WIND-0002 | Dimension Kind 07 |
| WIND-0008 | WIND-0002 | WIND-0008 | Encoding 08 |

The foreign-key relationships that bind these tables form a directed acyclic graph. The entity identifier in every value table references the primary key of the domain's classification table—AUDI-0001 in t_audit_subclass_val_decimal references AUDI-0001 in t_audit_subclass, which in turn identifies the audit subclass SOC2 Type II Review. The attr_id in every value table references the primary key of the domain's attribute schema table—AUDI-0001 in t_audit_subclass_val_decimal references AUDI-0001 in t_audit_subclass_attr, which declares the attribute name duration_seconds and type xsd:decimal. These two foreign keys, entity_id and attr_id, together form the composite key that uniquely identifies a single typed value within a domain. The identifier column in each value table serves as a surrogate primary key for row-level operations but carries no semantic weight beyond uniqueness. The meaningful identity of a datum is entirely a function of its entity_id and attr_id pair, resolved through the schema to a name and type, and retrieved from the appropriate type-specific store.

**t_audit_subclass_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AUDI-0001 | AUDI-0001 | AUDI-0001 | 6622.09 |
| AUDI-0002 | AUDI-0002 | AUDI-0001 | 3520.06 |
| AUDI-0003 | AUDI-0003 | AUDI-0001 | 6281.16 |
| AUDI-0004 | AUDI-0004 | AUDI-0001 | 5487.90 |
| AUDI-0005 | AUDI-0005 | AUDI-0001 | 1334.65 |
| AUDI-0006 | AUDI-0006 | AUDI-0001 | 3072.32 |

**t_audit_subclass_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AUDI-0001 | AUDI-0001 | AUDI-0003 | 943 |
| AUDI-0002 | AUDI-0001 | AUDI-0007 | 337 |
| AUDI-0003 | AUDI-0002 | AUDI-0003 | 718 |
| AUDI-0004 | AUDI-0002 | AUDI-0007 | 453 |
| AUDI-0005 | AUDI-0003 | AUDI-0003 | 258 |
| AUDI-0006 | AUDI-0003 | AUDI-0007 | 371 |
| AUDI-0007 | AUDI-0004 | AUDI-0003 | 509 |
| AUDI-0008 | AUDI-0004 | AUDI-0007 | 469 |

**t_audit_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AUDI-0001 | AUDI-0001 | AUDI-0004 | node-b14 |
| AUDI-0002 | AUDI-0001 | AUDI-0005 | Log Level 02 |
| AUDI-0003 | AUDI-0001 | AUDI-0006 | execution |
| AUDI-0004 | AUDI-0001 | AUDI-0010 | running |
| AUDI-0005 | AUDI-0001 | AUDI-0011 | Triggered By 05 |
| AUDI-0006 | AUDI-0002 | AUDI-0004 | worker-07 |
| AUDI-0007 | AUDI-0002 | AUDI-0005 | Log Level 07 |
| AUDI-0008 | AUDI-0002 | AUDI-0006 | execution |