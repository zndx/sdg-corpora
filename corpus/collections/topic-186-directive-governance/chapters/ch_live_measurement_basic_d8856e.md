---
chapter_id: ch_live_measurement_basic_d8856e
topic_id: 186
family: 02_observation_measurement
cited_terms: ['measurement_basic', 'ice_with_existential', 'outlier_claim_with_attribute_set']
model: engine-refine
---

In metadata-intensive systems, every observable phenomenon is captured as an entity—a discrete unit of information that can be described, related, and queried. An entity is distinguished by a stable identifier, such as `MEAS-0001` for an Air Quality Index measurement or `EXIS-0001` for a Batch Processing Rule, which serves as the immutable anchor for all subsequent associations. These identifiers follow a consistent naming convention that encodes the entity's domain, enabling systems to route queries and enforce referential integrity without ambiguity. The entity itself carries a human-readable label—`Water pH Level`, `Provenance Trace Identifier`, `checksum_mismatch`—that provides immediate context, while the identifier guarantees that the same entity can be referenced unambiguously across tables, subsystems, and time.

**t_measurement_basic**

| id | measurement |
| --- | --- |
| MEAS-0001 | Air Quality Index |
| MEAS-0002 | Disk Throughput |
| MEAS-0003 | Water pH Level |
| MEAS-0004 | Air Quality Index |
| MEAS-0005 | Network Latency |
| MEAS-0006 | Air Quality Index |
| MEAS-0007 | Disk Throughput |

**t_ice_with_existential**

| id | ice | related |
| --- | --- | --- |
| EXIS-0001 | Batch Processing Rule | Laboratory Zone B |
| EXIS-0002 | Metadata Schema Version | Hydraulic Pressure Range |
| EXIS-0003 | Provenance Trace Identifier | Network Latency Budget |
| EXIS-0004 | Sampling Frequency Specification | Laboratory Zone B |
| EXIS-0005 | Provenance Trace Identifier | Field Sampling Site |
| EXIS-0006 | Quality Control Checkpoint | Laboratory Zone B |
| EXIS-0007 | Instrument Serial Registry | Ambient Air Temperature |
| EXIS-0008 | Provenance Trace Identifier | ISO 8601 Timestamp |

Attributes are the descriptive properties that give entities their semantic richness. An attribute is defined by a name and a type: `confidence` is typed as `xsd:decimal`, `recorded_at` as `xsd:dateTime`, and `dimension_kind` as `xsd:string`. This separation of attribute definition from attribute value is critical—it allows the schema to evolve independently of the data, and it enables type-safe validation at ingestion time. The attribute type constrains what values are admissible, ensuring that a decimal field like `0.231` or `407.80` is never confused with a string such as `Encoding 01` or `calibration record`. When an attribute is attached to an entity, the system records not just the value but the provenance of that attachment: which entity owns which attribute, and in what context.

The actual values stored for attributes—what the data model calls `misc`—are partitioned by type into dedicated value tables, each optimized for its data domain. Decimal measurements such as `947.91` or `0.117` reside in a decimal value table, timestamped observations like `2024-05-15T18:00:29` in a datetime table, and free-form text such as `audit excerpt` or `es` in a varchar table. This type-disaggregated design avoids the pitfalls of a single wide-value column and allows each value store to enforce its own constraints, indexing strategies, and serialization formats. Every value record is linked back to its entity and attribute through foreign keys, forming a triad of entity, attribute, and value that can be queried as a coherent fact.

**t_measurement_basic_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| MEAS-0001 | MEAS-0001 | MEAS-0004 | 2024-05-15T18:00:29 |
| MEAS-0002 | MEAS-0002 | MEAS-0004 | 2024-04-18T18:40:50 |
| MEAS-0003 | MEAS-0003 | MEAS-0004 | 2023-06-19T08:04:37 |
| MEAS-0004 | MEAS-0004 | MEAS-0004 | 2024-12-12T18:49:55 |
| MEAS-0005 | MEAS-0005 | MEAS-0004 | 2024-07-10T05:51:16 |
| MEAS-0006 | MEAS-0006 | MEAS-0004 | 2023-05-22T02:44:37 |
| MEAS-0007 | MEAS-0007 | MEAS-0004 | 2023-01-22T19:04:55 |

**t_measurement_basic_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| MEAS-0001 | MEAS-0001 | MEAS-0001 | 0.231 |
| MEAS-0002 | MEAS-0001 | MEAS-0005 | 407.80 |
| MEAS-0003 | MEAS-0001 | MEAS-0007 | 947.91 |
| MEAS-0004 | MEAS-0002 | MEAS-0001 | 0.117 |
| MEAS-0005 | MEAS-0002 | MEAS-0005 | 521.52 |
| MEAS-0006 | MEAS-0002 | MEAS-0007 | 399.99 |
| MEAS-0007 | MEAS-0003 | MEAS-0001 | 0.530 |
| MEAS-0008 | MEAS-0003 | MEAS-0005 | 792.36 |

**t_measurement_basic_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| MEAS-0001 | MEAS-0001 | MEAS-0002 | Dimension Kind 01 |
| MEAS-0002 | MEAS-0001 | MEAS-0008 | Encoding 02 |
| MEAS-0003 | MEAS-0001 | MEAS-0009 | calibration record |
| MEAS-0004 | MEAS-0001 | MEAS-0010 | es |
| MEAS-0005 | MEAS-0001 | MEAS-0003 | automated |
| MEAS-0006 | MEAS-0001 | MEAS-0006 | ms |
| MEAS-0007 | MEAS-0002 | MEAS-0002 | Dimension Kind 07 |
| MEAS-0008 | MEAS-0002 | MEAS-0008 | Encoding 08 |

**t_ice_with_existential_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EXIS-0001 | EXIS-0001 | EXIS-0001 | Encoding 01 |
| EXIS-0002 | EXIS-0001 | EXIS-0002 | audit excerpt |
| EXIS-0003 | EXIS-0001 | EXIS-0003 | de |
| EXIS-0004 | EXIS-0002 | EXIS-0001 | Encoding 04 |
| EXIS-0005 | EXIS-0002 | EXIS-0002 | change rationale |
| EXIS-0006 | EXIS-0002 | EXIS-0003 | de |
| EXIS-0007 | EXIS-0003 | EXIS-0001 | Encoding 07 |
| EXIS-0008 | EXIS-0003 | EXIS-0002 | pre-release note |

Relationships between entities are mediated through a subject–target–role pattern that captures not just that two entities are connected, but how they are connected. In the outlier-attribute-set association, for instance, the `subject` column identifies the outlier claim (`SET-0003` for `log_flooding`), the `target` column identifies the attribute set (`SET-0005` for `tolerance_ranges`), and the `role` column specifies the nature of the link—`contributor` or `owner`. This three-way relationship model is more expressive than a simple many-to-many join: it allows the same pair of entities to participate in multiple relationships with different roles, and it makes the semantics of the connection queryable. An outlier can contribute to a baseline configuration while another outlier owns a different calibration set, and the distinction is preserved in the data.

**t_outlier_claim_with_attribute_set**

| id | outlier |
| --- | --- |
| SET-0001 | checksum_mismatch |
| SET-0002 | pipeline_stall |
| SET-0003 | log_flooding |
| SET-0004 | latency_spike |
| SET-0005 | checksum_mismatch |
| SET-0006 | log_flooding |
| SET-0007 | latency_spike |

**t_outlier_claim_with_attribute_set_attribute_set**

| id | attribute_set |
| --- | --- |
| SET-0001 | tolerance_ranges |
| SET-0002 | baseline_values |
| SET-0003 | baseline_values |
| SET-0004 | calibration_constants |
| SET-0005 | tolerance_ranges |
| SET-0006 | temporal_windows |

**t_outlier_claim_with_attribute_set__attribute_set**

| id | outlier_id | attribute_set_id | role |
| --- | --- | --- | --- |
| SET-0001 | SET-0003 | SET-0005 | contributor |
| SET-0002 | SET-0001 | SET-0004 | owner |
| SET-0003 | SET-0004 | SET-0001 | contributor |
| SET-0004 | SET-0007 | SET-0002 | contributor |
| SET-0005 | SET-0004 | SET-0005 | contributor |
| SET-0006 | SET-0006 | SET-0006 | contributor |
| SET-0007 | SET-0004 | SET-0002 | owner |
| SET-0008 | SET-0001 | SET-0006 | owner |

Existential constraints—rules that govern when and how entities must exist—follow a parallel structure. A constraint such as `Sampling Frequency Specification` is linked to a related entity like `Laboratory Zone B`, and its own attributes (an `encoding` of `Encoding 01`, a `label_text` of `audit excerpt`, a `language` of `de`) are stored in the same value-disaggregated pattern. This uniformity across entity types—measurements, outlier claims, existential constraints—means that the same query patterns, validation logic, and access controls apply regardless of what kind of entity is being described. The result is a metadata architecture where identifiers provide stability, attributes provide description, values provide evidence, and roles provide relational semantics, all held together by a consistent foreign-key fabric.

**t_measurement_basic_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| MEAS-0001 | confidence | xsd:decimal |
| MEAS-0002 | dimension_kind | xsd:string |
| MEAS-0003 | method | xsd:string |
| MEAS-0004 | recorded_at | xsd:dateTime |
| MEAS-0005 | uncertainty | xsd:decimal |
| MEAS-0006 | unit | xsd:string |
| MEAS-0007 | value | xsd:decimal |
| MEAS-0008 | encoding | xsd:string |

**t_ice_with_existential_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| EXIS-0001 | encoding | xsd:string |
| EXIS-0002 | label_text | xsd:string |
| EXIS-0003 | language | xsd:string |