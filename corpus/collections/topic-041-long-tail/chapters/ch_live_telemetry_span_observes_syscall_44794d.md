---
chapter_id: ch_live_telemetry_span_observes_syscall_44794d
topic_id: 41
family: 07_long_tail
cited_terms: ['telemetry_span_observes_syscall', 'breaking_change_subclass', 'subclass_not_basic']
model: engine-refine
---

An attribute-value architecture decouples the definition of properties from their instantiation, enabling systems to accommodate heterogeneous metadata without rigid schema constraints. Within this paradigm, an identifier serves as the stable anchor for every entity—whether a telemetry span observed to invoke a system call, designated by identifiers such as SYSC-0001 through SYSC-0004, or a breaking change subclass, each bearing a distinct handle like CHAN-0001 or NOT-0001. The identifier is not merely a label; it is the join key that binds together the entity's core record, its attribute definitions, and the value rows that populate those attributes at a given point in time. In practice, the identifier SYSC-0001, for instance, resolves to a telemetry span associated with Prometheus, while CHAN-0001 identifies a breaking change described as "Telemetry schema evolution" affecting a device telemetry collector. The separation of identity from content permits the same attribute vocabulary to be applied across disparate entity types, and conversely, permits a single entity to carry an unbounded set of attributes without requiring structural migration.

**t_telemetry_span_observes_syscall**

| id | telemetry |
| --- | --- |
| SYSC-0001 | Prometheus |
| SYSC-0002 | SignalFx Stream Processor |
| SYSC-0003 | Dynatrace OneAgent |
| SYSC-0004 | Prometheus |
| SYSC-0005 | OpenTelemetry Collector |
| SYSC-0006 | Honeycomb Collector |

**t_telemetry_span_observes_syscall_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| SYSC-0001 | checksum_algo | xsd:string |
| SYSC-0002 | code | xsd:string |
| SYSC-0003 | format | xsd:string |
| SYSC-0004 | issued_date | xsd:date |
| SYSC-0005 | namespace | xsd:string |
| SYSC-0006 | encoding | xsd:string |
| SYSC-0007 | label_text | xsd:string |
| SYSC-0008 | language | xsd:string |

**t_breaking_change_subclass**

| id | breaking | breaking_change_for |
| --- | --- | --- |
| CHAN-0001 | Telemetry schema evolution | device telemetry collector |
| CHAN-0002 | Telemetry schema evolution | inventory management API |
| CHAN-0003 | Provenance graph migration | legacy mobile app |
| CHAN-0004 | OAuth2 token rotation | real-time event stream |
| CHAN-0005 | Schema field removal | internal microservice mesh |
| CHAN-0006 | Sensor sampling rate drop | customer dashboard frontend |
| CHAN-0007 | Provenance graph migration | compliance audit logger |
| CHAN-0008 | TLS 1.3 enforcement | third-party analytics SDK |

**t_breaking_change_subclass_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| CHAN-0001 | confidence | xsd:decimal |
| CHAN-0002 | dimension_kind | xsd:string |
| CHAN-0003 | method | xsd:string |
| CHAN-0004 | recorded_at | xsd:dateTime |
| CHAN-0005 | uncertainty | xsd:decimal |
| CHAN-0006 | unit | xsd:string |
| CHAN-0007 | value | xsd:decimal |
| CHAN-0008 | encoding | xsd:string |

**t_breaking_change_subclass_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CHAN-0001 | CHAN-0001 | CHAN-0004 | 2023-07-26T14:07:49 |
| CHAN-0002 | CHAN-0002 | CHAN-0004 | 2025-01-03T20:08:42 |
| CHAN-0003 | CHAN-0003 | CHAN-0004 | 2024-04-10T03:15:13 |
| CHAN-0004 | CHAN-0004 | CHAN-0004 | 2023-07-21T06:41:40 |
| CHAN-0005 | CHAN-0005 | CHAN-0004 | 2023-07-01T02:58:50 |
| CHAN-0006 | CHAN-0006 | CHAN-0004 | 2024-07-07T11:26:39 |
| CHAN-0007 | CHAN-0007 | CHAN-0004 | 2024-07-12T18:30:29 |
| CHAN-0008 | CHAN-0008 | CHAN-0004 | 2024-11-14T05:00:21 |

**t_breaking_change_subclass_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CHAN-0001 | CHAN-0001 | CHAN-0001 | 0.203 |
| CHAN-0002 | CHAN-0001 | CHAN-0005 | 700.59 |
| CHAN-0003 | CHAN-0001 | CHAN-0007 | 64.61 |
| CHAN-0004 | CHAN-0002 | CHAN-0001 | 0.645 |
| CHAN-0005 | CHAN-0002 | CHAN-0005 | 584.78 |
| CHAN-0006 | CHAN-0002 | CHAN-0007 | 672.81 |
| CHAN-0007 | CHAN-0003 | CHAN-0001 | 0.769 |
| CHAN-0008 | CHAN-0003 | CHAN-0005 | 136.48 |

**t_breaking_change_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CHAN-0001 | CHAN-0001 | CHAN-0002 | Dimension Kind 01 |
| CHAN-0002 | CHAN-0001 | CHAN-0008 | Encoding 02 |
| CHAN-0003 | CHAN-0001 | CHAN-0009 | calibration record |
| CHAN-0004 | CHAN-0001 | CHAN-0010 | en |
| CHAN-0005 | CHAN-0001 | CHAN-0003 | hybrid |
| CHAN-0006 | CHAN-0001 | CHAN-0006 | deg_C |
| CHAN-0007 | CHAN-0002 | CHAN-0002 | Dimension Kind 07 |
| CHAN-0008 | CHAN-0002 | CHAN-0008 | Encoding 08 |

The attribute definition itself comprises two components: a human-readable name and a machine-enforceable type. Attribute names such as checksum_algo, code, format, and issued_date appear in the context of telemetry spans, while confidence, dimension_kind, method, and recorded_at serve breaking change records. Each name is paired with an XSD type—xsd:string, xsd:date, xsd:dateTime, xsd:decimal—that governs the shape of permissible values. This type discipline is not decorative; it is the mechanism by which the system enforces data integrity across value tables that are physically partitioned by type. A value for issued_date, typed as xsd:date, is stored in a dedicated date-valued table with entries such as 2024-08-07 or 2023-04-29, whereas a value for code, typed as xsd:string, resides in a varchar-valued table alongside entries like D-33 or E.164. The type-based partitioning ensures that queries targeting a specific attribute can be routed to the correct value store without runtime casting or ambiguity.

Entity resolution proceeds through a three-hop join: the entity identifier maps to its attribute definitions, which in turn reference value rows through an attribute foreign key. Consider the telemetry span SYSC-0001, which carries four distinct attribute assignments. The attribute checksum_algo (xsd:string) resolves to the value "Checksum Algo 01" in the varchar value table; the attribute code (xsd:string) resolves to "D-33"; the attribute format (xsd:string) resolves to "Encoding 03"; and the attribute issued_date (xsd:date) resolves to 2024-08-07 in the date value table. Each value row carries its own surrogate identifier—SYSC-0001 in the case of the first value row—and a foreign key attr_id pointing back to the attribute definition, here SYSC-0004 for the issued_date attribute. This structure permits a single entity to reference multiple attributes of the same type without duplication, and allows attribute definitions to be shared across entities.

The breaking change subclass follows an identical structural pattern but demonstrates the breadth of supported value types. The breaking change CHAN-0001, which describes "Telemetry schema evolution" as a breaking change for a device telemetry collector, carries a confidence value of 0.203 stored in the decimal value table, a dimension_kind value of "Dimension Kind 01" in the varchar table, and a recorded_at timestamp of 2023-07-26T14:07:49 in the datetime table. The decimal value 0.203 is one of several confidence scores—others include 700.59 and 64.61—each associated with the same entity CHAN-0001 but referencing different attribute definitions (CHAN-0001, CHAN-0005, CHAN-0007). This multiplicity of values per entity is not anomalous; it is the expected outcome of an attribute model where a single entity can accumulate an arbitrary number of typed properties, each independently versioned and independently queryable.

The misc category of values—varchar, date, datetime, decimal—forms the physical substrate of the attribute-value model. Each misc table is a homogeneous container for a single XSD type, and the foreign key relationships between entity, attribute, and value tables ensure that every value can be traced back to its definitional source and its owning entity. The identifier SYSC-0001, for example, appears not only as the primary key of the telemetry span record but also as the entity_id in four value rows and as the attr_id in the issued_date value row, demonstrating the bidirectional navigability of the model. This navigability is essential for compliance and governance workflows, where an auditor must be able to traverse from a high-level entity description—such as "OAuth2 token rotation" affecting a real-time event stream—down to the precise attribute values that document its parameters, including the timestamp 2023-07-21T06:41:40 recorded for the associated attribute.

**t_telemetry_span_observes_syscall_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SYSC-0001 | SYSC-0001 | SYSC-0004 | 2024-08-07 |
| SYSC-0002 | SYSC-0002 | SYSC-0004 | 2023-04-29 |
| SYSC-0003 | SYSC-0003 | SYSC-0004 | 2024-09-27 |
| SYSC-0004 | SYSC-0004 | SYSC-0004 | 2023-06-07 |
| SYSC-0005 | SYSC-0005 | SYSC-0004 | 2025-01-16 |
| SYSC-0006 | SYSC-0006 | SYSC-0004 | 2023-10-29 |

**t_telemetry_span_observes_syscall_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SYSC-0001 | SYSC-0001 | SYSC-0001 | Checksum Algo 01 |
| SYSC-0002 | SYSC-0001 | SYSC-0002 | D-33 |
| SYSC-0003 | SYSC-0001 | SYSC-0006 | Encoding 03 |
| SYSC-0004 | SYSC-0001 | SYSC-0003 | E.164 |
| SYSC-0005 | SYSC-0001 | SYSC-0007 | nightly summary |
| SYSC-0006 | SYSC-0001 | SYSC-0008 | fr |
| SYSC-0007 | SYSC-0001 | SYSC-0005 | Namespace 07 |
| SYSC-0008 | SYSC-0002 | SYSC-0001 | Checksum Algo 08 |

The subclass-not-basic relationship, exemplified by identifiers NOT-0001 through NOT-0004 and their associated not and not_2 columns, extends the model to capture negative or exclusionary metadata. Here, Not 01 maps to Not 2 01, Not 02 to Not 2 02, and so forth, providing a mechanism for recording what an entity is not, or what constraints do not apply. This negative metadata is structurally identical to positive attribute-value pairs but serves a distinct governance purpose: it documents exclusions, exemptions, and boundary conditions that are as critical to compliance as the positive assertions. The uniformity of the identifier-attribute-value pattern across both positive and negative metadata ensures that query engines, audit tools, and governance frameworks can operate on a single data model without special-casing the representation of negative information.

**t_subclass_not_basic**

| id | not | not_2 |
| --- | --- | --- |
| NOT-0001 | Not 01 | Not 2 01 |
| NOT-0002 | Not 02 | Not 2 02 |
| NOT-0003 | Not 03 | Not 2 03 |
| NOT-0004 | Not 04 | Not 2 04 |
| NOT-0005 | Not 05 | Not 2 05 |
| NOT-0006 | Not 06 | Not 2 06 |