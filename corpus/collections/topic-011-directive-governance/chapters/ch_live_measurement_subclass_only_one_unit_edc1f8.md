---
chapter_id: ch_live_measurement_subclass_only_one_unit_edc1f8
topic_id: 11
family: 02_observation_measurement
cited_terms: ['measurement_subclass_only_one_unit', 'requirement_equiv_specifies_target', 'requirement_has_priority']
model: engine-refine
---

Attributes and their typed definitions constitute the foundational vocabulary through which domain properties are declared, validated, and consumed across measurement and requirement registries. Each attribute is identified by a human-readable name—`confidence`, `dimension_kind`, `method`, `recorded_at` in the measurement subclass, and `effective_date`, `enforcement`, `mandatory`, `priority` within the priority extension—and bound to an XSD type that governs its permissible value space. The type registry distinguishes `xsd:decimal` for numeric precision, `xsd:string` for free-form text, `xsd:dateTime` and `xsd:date` for temporal markers, `xsd:boolean` for binary flags, and `xsd:integer` for whole-number quantities. This separation of attribute declaration from value assignment enables a single attribute definition to be referenced by multiple entity instances without duplication: the `recorded_at` attribute, typed as `xsd:dateTime`, receives values such as `2024-07-02T10:17:22` and `2025-05-17T18:10:32` across different measurement records, while the `mandatory` attribute, typed as `xsd:boolean`, uniformly resolves to `false` across all four priority entries, signaling a consistent policy state.

**t_measurement_subclass_only_one_unit_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| UNIT-0001 | confidence | xsd:decimal |
| UNIT-0002 | dimension_kind | xsd:string |
| UNIT-0003 | method | xsd:string |
| UNIT-0004 | recorded_at | xsd:dateTime |
| UNIT-0005 | uncertainty | xsd:decimal |
| UNIT-0006 | unit | xsd:string |
| UNIT-0007 | value | xsd:decimal |
| UNIT-0008 | encoding | xsd:string |

**t_measurement_subclass_only_one_unit_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| UNIT-0001 | UNIT-0001 | UNIT-0004 | 2024-07-02T10:17:22 |
| UNIT-0002 | UNIT-0002 | UNIT-0004 | 2025-05-17T18:10:32 |
| UNIT-0003 | UNIT-0003 | UNIT-0004 | 2023-09-23T07:34:54 |
| UNIT-0004 | UNIT-0004 | UNIT-0004 | 2023-07-03T17:50:57 |
| UNIT-0005 | UNIT-0005 | UNIT-0004 | 2025-03-23T11:32:54 |
| UNIT-0006 | UNIT-0006 | UNIT-0004 | 2024-10-11T18:39:44 |

**t_requirement_has_priority**

| id | requirement | priority |
| --- | --- | --- |
| PRIO-0001 | Latency threshold | Trivial |
| PRIO-0002 | Backup interval | Medium |
| PRIO-0003 | Throughput minimum | Critical |
| PRIO-0004 | Audit log frequency | Critical |
| PRIO-0005 | Throughput minimum | Minor |
| PRIO-0006 | Encryption standard | Trivial |
| PRIO-0007 | Throughput minimum | Major |
| PRIO-0008 | Fault tolerance level | Essential |

**t_requirement_has_priority_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| PRIO-0001 | effective_date | xsd:date |
| PRIO-0002 | enforcement | xsd:string |
| PRIO-0003 | mandatory | xsd:boolean |
| PRIO-0004 | priority | xsd:integer |
| PRIO-0005 | review_cycle_days | xsd:integer |
| PRIO-0006 | scope | xsd:string |
| PRIO-0007 | encoding | xsd:string |
| PRIO-0008 | label_text | xsd:string |

**t_requirement_has_priority_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PRIO-0001 | PRIO-0001 | PRIO-0003 | false |
| PRIO-0002 | PRIO-0002 | PRIO-0003 | false |
| PRIO-0003 | PRIO-0003 | PRIO-0003 | false |
| PRIO-0004 | PRIO-0004 | PRIO-0003 | false |
| PRIO-0005 | PRIO-0005 | PRIO-0003 | true |
| PRIO-0006 | PRIO-0006 | PRIO-0003 | false |
| PRIO-0007 | PRIO-0007 | PRIO-0003 | false |
| PRIO-0008 | PRIO-0008 | PRIO-0003 | true |

**t_requirement_has_priority_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PRIO-0001 | PRIO-0001 | PRIO-0001 | 2023-09-07 |
| PRIO-0002 | PRIO-0002 | PRIO-0001 | 2024-08-03 |
| PRIO-0003 | PRIO-0003 | PRIO-0001 | 2024-06-06 |
| PRIO-0004 | PRIO-0004 | PRIO-0001 | 2023-04-21 |
| PRIO-0005 | PRIO-0005 | PRIO-0001 | 2025-04-04 |
| PRIO-0006 | PRIO-0006 | PRIO-0001 | 2024-12-07 |
| PRIO-0007 | PRIO-0007 | PRIO-0001 | 2025-04-01 |
| PRIO-0008 | PRIO-0008 | PRIO-0001 | 2024-09-28 |

**t_requirement_has_priority_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PRIO-0001 | PRIO-0001 | PRIO-0004 | 3 |
| PRIO-0002 | PRIO-0001 | PRIO-0005 | 56 |
| PRIO-0003 | PRIO-0002 | PRIO-0004 | 2 |
| PRIO-0004 | PRIO-0002 | PRIO-0005 | 806 |
| PRIO-0005 | PRIO-0003 | PRIO-0004 | 5 |
| PRIO-0006 | PRIO-0003 | PRIO-0005 | 944 |
| PRIO-0007 | PRIO-0004 | PRIO-0004 | 4 |
| PRIO-0008 | PRIO-0004 | PRIO-0005 | 343 |

Every entity in the system is anchored by a composite key that combines a domain-specific prefix with a zero-padded sequence number, yielding identifiers such as `UNIT-0001`, `TARG-0002`, and `PRIO-0003`. These identifiers serve dual purposes: they uniquely address individual records within their respective tables, and they function as foreign keys that establish referential links across the attribute-value and relationship layers. A measurement record with identifier `UNIT-0001` describes a `temperature gradient` expressed in `newton meters`, and its associated attribute values are resolved by joining the entity identifier to the `entity_id` column of the value tables, where the same identifier `UNIT-0001` appears as the subject of multiple attribute assignments—`0.584` for attribute `UNIT-0001`, `680.89` for `UNIT-0005`, and `977.36` for `UNIT-0007` in the decimal value store, or `Dimension Kind 01` and `Encoding 02` in the varchar store. This pattern of identifier-driven resolution ensures that attribute values remain decoupled from the entity definition while remaining unambiguously attributable.

**t_measurement_subclass_only_one_unit**

| id | measurement | unit |
| --- | --- | --- |
| UNIT-0001 | temperature gradient | newton meters |
| UNIT-0002 | soil pH | decibels |
| UNIT-0003 | soil moisture | lumens |
| UNIT-0004 | torque | degrees celsius |
| UNIT-0005 | heart rate | lumens |
| UNIT-0006 | packet loss | percent |

**t_measurement_subclass_only_one_unit_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| UNIT-0001 | UNIT-0001 | UNIT-0001 | 0.584 |
| UNIT-0002 | UNIT-0001 | UNIT-0005 | 680.89 |
| UNIT-0003 | UNIT-0001 | UNIT-0007 | 977.36 |
| UNIT-0004 | UNIT-0002 | UNIT-0001 | 0.929 |
| UNIT-0005 | UNIT-0002 | UNIT-0005 | 548.84 |
| UNIT-0006 | UNIT-0002 | UNIT-0007 | 51.31 |
| UNIT-0007 | UNIT-0003 | UNIT-0001 | 0.964 |
| UNIT-0008 | UNIT-0003 | UNIT-0005 | 305.75 |

**t_measurement_subclass_only_one_unit_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| UNIT-0001 | UNIT-0001 | UNIT-0002 | Dimension Kind 01 |
| UNIT-0002 | UNIT-0001 | UNIT-0008 | Encoding 02 |
| UNIT-0003 | UNIT-0001 | UNIT-0009 | change rationale |
| UNIT-0004 | UNIT-0001 | UNIT-0010 | fr |
| UNIT-0005 | UNIT-0001 | UNIT-0003 | hybrid |
| UNIT-0006 | UNIT-0001 | UNIT-0006 | nm |
| UNIT-0007 | UNIT-0002 | UNIT-0002 | Dimension Kind 07 |
| UNIT-0008 | UNIT-0002 | UNIT-0008 | Encoding 08 |

Subject-target relationships model the directional associations between requirements and the specifications or targets they govern, with the relationship itself carrying metadata that qualifies its nature. The junction table `t_requirement_equiv_specifies_target__specifies` links a `requirement_id` (the subject) to a `specifies_id` (the target) through a `role` that describes the subject's function in that association: `reviewer`, `owner`, `contributor`, or the same role repeated across multiple links. For instance, requirement `TARG-0004` assumes the `reviewer` role when linked to specification `TARG-002`, while requirement `TARG-0002` holds the `owner` role in its connection to the same target, and `TARG-0004` also appears as a `contributor` to target `TARG-0007`. The same structural pattern applies to the `applies_to` relationship, where requirement `TARG-0001` acts as a `contributor` to target `TARG-0001` under the label `Cardinality Note 01`, and requirement `TARG-0002` serves as a `reviewer` of target `TARG-0004` under `Cardinality Note 04`. The role column thus captures the semantic posture of the subject within each relationship, enabling a single requirement to participate in multiple associations with distinct responsibilities.

**t_requirement_equiv_specifies_target**

| id | requirement |
| --- | --- |
| TARG-0001 | LatencyThreshold |
| TARG-0002 | DataLineageTrace |
| TARG-0003 | LatencyThreshold |
| TARG-0004 | AuditLogFormat |
| TARG-0005 | TelemetrySamplingRate |
| TARG-0006 | LatencyThreshold |

**t_requirement_equiv_specifies_target_specifies**

| id | specifies |
| --- | --- |
| TARG-0001 | KafkaProtocol |
| TARG-0002 | GDPRArticle |
| TARG-0003 | KafkaProtocol |
| TARG-0004 | JSONSchema |
| TARG-0005 | JSONSchema |
| TARG-0006 | OpenTelemetry |
| TARG-0007 | JSONSchema |

**t_requirement_equiv_specifies_target__specifies**

| id | requirement_id | specifies_id | role |
| --- | --- | --- | --- |
| TARG-0001 | TARG-0004 | TARG-0002 | reviewer |
| TARG-0002 | TARG-0002 | TARG-0002 | owner |
| TARG-0003 | TARG-0004 | TARG-0007 | contributor |
| TARG-0004 | TARG-0002 | TARG-0004 | owner |
| TARG-0005 | TARG-0002 | TARG-0004 | observer |
| TARG-0006 | TARG-0006 | TARG-0007 | contributor |
| TARG-0007 | TARG-0005 | TARG-0006 | reviewer |
| TARG-0008 | TARG-0001 | TARG-0007 | reviewer |

**t_requirement_equiv_specifies_target_applies_to**

| id | applies_to |
| --- | --- |
| TARG-0001 | CloudStorage |
| TARG-0002 | EUDataCenter |
| TARG-0003 | DataLake |
| TARG-0004 | DataLake |
| TARG-0005 | EUDataCenter |
| TARG-0006 | CustomerTable |

**t_requirement_equiv_specifies_target__applies_to**

| id | requirement_id | applies_to_id | role | cardinality_note |
| --- | --- | --- | --- | --- |
| TARG-0001 | TARG-0001 | TARG-0001 | contributor | Cardinality Note 01 |
| TARG-0002 | TARG-0005 | TARG-0002 | contributor | Cardinality Note 02 |
| TARG-0003 | TARG-0006 | TARG-0003 | observer | Cardinality Note 03 |
| TARG-0004 | TARG-0002 | TARG-0004 | reviewer | Cardinality Note 04 |
| TARG-0005 | TARG-0001 | TARG-0006 | reviewer | Cardinality Note 05 |
| TARG-0006 | TARG-0004 | TARG-0003 | observer | Cardinality Note 06 |
| TARG-0007 | TARG-0003 | TARG-0001 | observer | Cardinality Note 07 |
| TARG-0008 | TARG-0005 | TARG-0002 | reviewer | Cardinality Note 08 |

Cardinality notes and value-type segregation complete the relational model by constraining how many targets a subject may reference and by ensuring type safety across heterogeneous value stores. The cardinality note—`Cardinality Note 01` through `Cardinality Note 04`—accompanies each subject-target link in the `applies_to` junction table, providing a human-readable annotation that documents the multiplicity constraints governing the association. Meanwhile, attribute values are partitioned into type-specific tables: decimal values such as `0.584` and `680.89` reside in the decimal store, date values like `2023-09-07` and `2024-08-03` in the date store, integer values including `3` and `56` in the integer store, and string values such as `change rationale`, `fr`, `intake form`, and `ja` in the varchar store. This type-dispatch architecture prevents type coercion errors at query time and allows the attribute type registry to serve as a single source of truth for validation, while the value tables remain lightweight containers that carry only the entity identifier, the attribute reference, and the raw value. The practical effect is a schema that scales to an arbitrary number of attribute types without requiring schema migrations, and that supports requirements with priorities ranging from `Trivial` to `Critical`, enforcement statuses encoded as `Enforcement 02`, and temporal scopes defined by dates such as `2023-04-21` and `2024-06-06`, all within a unified referential framework.

**t_requirement_has_priority_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PRIO-0001 | PRIO-0001 | PRIO-0007 | Encoding 01 |
| PRIO-0002 | PRIO-0001 | PRIO-0002 | Enforcement 02 |
| PRIO-0003 | PRIO-0001 | PRIO-0008 | intake form |
| PRIO-0004 | PRIO-0001 | PRIO-0009 | ja |
| PRIO-0005 | PRIO-0001 | PRIO-0006 | Scope 05 |
| PRIO-0006 | PRIO-0002 | PRIO-0007 | Encoding 06 |
| PRIO-0007 | PRIO-0002 | PRIO-0002 | Enforcement 07 |
| PRIO-0008 | PRIO-0002 | PRIO-0008 | intake form |