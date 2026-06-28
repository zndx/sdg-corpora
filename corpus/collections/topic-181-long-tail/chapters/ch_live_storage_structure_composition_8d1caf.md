---
chapter_id: ch_live_storage_structure_composition_8d1caf
topic_id: 181
family: 08_derived
cited_terms: ['storage_structure_composition', 'measurement_with_unit', 'attestation_basic']
model: engine-refine
---

A controlled information environment requires that every resource, measurement, and attestation be anchored to a stable identifier and classified according to a rigorously defined type taxonomy. Identifiers such as COMP-0001, UNIT-0001, and ATTE-0001 serve as the immutable keys by which entities are referenced across all relational contexts; they appear not as human-readable labels but as machine-resolvable handles that persist through lifecycle transitions. The entity itself is the conceptual container for a discrete object of governance interest—a storage structure, a measurement definition, or an attestation record—and its identity is decoupled from the mutable attributes that describe it. This separation ensures that referential integrity is maintained even when attribute values change, when new attributes are introduced, or when the same attribute is applied across multiple entities. The attr and attr type columns formalize this distinction: attribute names such as duration_seconds, end_time, exit_code, and host_name are declared against a schema of XML Schema Datatypes—xsd:decimal, xsd:dateTime, xsd:integer, xsd:string—so that every value assigned to an attribute carries an enforceable type contract.

**t_storage_structure_composition**

| id | storage_structure_composition |
| --- | --- |
| COMP-0001 | tiered-storage-pool |
| COMP-0002 | archive-tape-library |
| COMP-0003 | tiered-storage-pool |
| COMP-0004 | san-disk-array |
| COMP-0005 | archive-tape-library |
| COMP-0006 | flash-memory-pool |

**t_measurement_with_unit**

| id | measurement |
| --- | --- |
| UNIT-0001 | Blood pressure |
| UNIT-0002 | Ozone concentration |
| UNIT-0003 | Seismic magnitude |
| UNIT-0004 | Network latency |
| UNIT-0005 | Network latency |
| UNIT-0006 | Battery voltage |
| UNIT-0007 | Network latency |
| UNIT-0008 | Blood pressure |

**t_measurement_with_unit_unit**

| id | unit |
| --- | --- |
| UNIT-0001 | milligrams per deciliter |
| UNIT-0002 | Richter scale |
| UNIT-0003 | milliseconds |
| UNIT-0004 | beats per minute |
| UNIT-0005 | milligrams per deciliter |
| UNIT-0006 | beats per minute |

**t_attestation_basic**

| id | attestation |
| --- | --- |
| ATTE-0001 | Vendor risk assessment |
| ATTE-0002 | HIPAA compliance review |
| ATTE-0003 | ML model fairness audit |
| ATTE-0004 | HIPAA compliance review |
| ATTE-0005 | SOC 2 Type II audit |
| ATTE-0006 | Vendor risk assessment |

**t_attestation_basic_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ATTE-0001 | duration_seconds | xsd:decimal |
| ATTE-0002 | end_time | xsd:dateTime |
| ATTE-0003 | exit_code | xsd:integer |
| ATTE-0004 | host_name | xsd:string |
| ATTE-0005 | log_level | xsd:string |
| ATTE-0006 | phase | xsd:string |
| ATTE-0007 | retry_count | xsd:integer |
| ATTE-0008 | scheduled_at | xsd:dateTime |

**t_attestation_basic_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTE-0001 | ATTE-0001 | ATTE-0002 | 2024-11-18T12:26:52 |
| ATTE-0002 | ATTE-0001 | ATTE-0008 | 2023-12-15T15:31:35 |
| ATTE-0003 | ATTE-0001 | ATTE-0009 | 2023-03-05T20:41:52 |
| ATTE-0004 | ATTE-0002 | ATTE-0002 | 2023-09-08T13:00:56 |
| ATTE-0005 | ATTE-0002 | ATTE-0008 | 2024-07-29T18:29:50 |
| ATTE-0006 | ATTE-0002 | ATTE-0009 | 2024-08-01T11:14:05 |
| ATTE-0007 | ATTE-0003 | ATTE-0002 | 2023-01-08T06:41:42 |
| ATTE-0008 | ATTE-0003 | ATTE-0008 | 2025-06-10T02:28:19 |

**t_attestation_basic_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTE-0001 | ATTE-0001 | ATTE-0001 | 7132.97 |
| ATTE-0002 | ATTE-0002 | ATTE-0001 | 6429.54 |
| ATTE-0003 | ATTE-0003 | ATTE-0001 | 3894.03 |
| ATTE-0004 | ATTE-0004 | ATTE-0001 | 6507.32 |
| ATTE-0005 | ATTE-0005 | ATTE-0001 | 5722.64 |
| ATTE-0006 | ATTE-0006 | ATTE-0001 | 4627.41 |

**t_attestation_basic_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTE-0001 | ATTE-0001 | ATTE-0003 | 898 |
| ATTE-0002 | ATTE-0001 | ATTE-0007 | 487 |
| ATTE-0003 | ATTE-0002 | ATTE-0003 | 71 |
| ATTE-0004 | ATTE-0002 | ATTE-0007 | 180 |
| ATTE-0005 | ATTE-0003 | ATTE-0003 | 107 |
| ATTE-0006 | ATTE-0003 | ATTE-0007 | 326 |
| ATTE-0007 | ATTE-0004 | ATTE-0003 | 620 |
| ATTE-0008 | ATTE-0004 | ATTE-0007 | 392 |

**t_attestation_basic_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTE-0001 | ATTE-0001 | ATTE-0004 | ingest-21 |
| ATTE-0002 | ATTE-0001 | ATTE-0005 | Log Level 02 |
| ATTE-0003 | ATTE-0001 | ATTE-0006 | initiation |
| ATTE-0004 | ATTE-0001 | ATTE-0010 | superseded |
| ATTE-0005 | ATTE-0001 | ATTE-0011 | Triggered By 05 |
| ATTE-0006 | ATTE-0002 | ATTE-0004 | gw-12 |
| ATTE-0007 | ATTE-0002 | ATTE-0005 | Log Level 07 |
| ATTE-0008 | ATTE-0002 | ATTE-0006 | execution |

Storage structure composition provides a concrete instantiation of how entities are organized into hierarchical compositions. A storage structure such as tiered-storage-pool or san-disk-array is not an atomic resource but a composite entity that comprises subordinate database containers. The container dev-mongo-shard, for example, is a constituent of a storage structure, and the relationship between the two is captured through a dedicated composition table that records not merely the structural link but the role assumed by each participant in the composition. Roles such as observer and reviewer appear in the relationship table t_storage_structure_composition__comprises, where storage_id and comprises_id columns establish a subject-to-target linkage. In one instance, storage COMP-0003 relates to comprises COMP-0006 with the role observer, while in another, COMP-0003 relates to COMP-0006 with the role reviewer—demonstrating that the same pair of entities can participate in multiple relationship instances distinguished solely by their role assignment. This role-based relationship model generalizes beyond storage hierarchies to all composite structures in the domain.

**t_storage_structure_composition_comprises**

| id | comprises |
| --- | --- |
| COMP-0001 | dev-mongo-shard |
| COMP-0002 | staging-redis-cluster |
| COMP-0003 | s3-logs-bucket |
| COMP-0004 | cassandra-data-node |
| COMP-0005 | oracle-tablespace-main |
| COMP-0006 | neo4j-graph-store |

**t_storage_structure_composition__comprises**

| id | storage_id | comprises_id | role |
| --- | --- | --- | --- |
| COMP-0001 | COMP-0003 | COMP-0006 | observer |
| COMP-0002 | COMP-0002 | COMP-0004 | reviewer |
| COMP-0003 | COMP-0006 | COMP-0001 | observer |
| COMP-0004 | COMP-0003 | COMP-0006 | reviewer |
| COMP-0005 | COMP-0002 | COMP-0002 | contributor |
| COMP-0006 | COMP-0001 | COMP-0006 | reviewer |
| COMP-0007 | COMP-0006 | COMP-0003 | owner |
| COMP-0008 | COMP-0002 | COMP-0006 | reviewer |

The measurement-with-unit pattern illustrates how quantitative observations are decomposed into a measurement definition and its associated unit of measure, linked through a subject-target relationship governed by a role. The measurement Blood pressure is associated with the unit milligrams per deciliter, while Ozone concentration is paired with the Richter scale, Seismic magnitude with milliseconds, and Network latency with beats per minute. The relationship table t_measurement_with_unit__unit records the measurement_id as the subject, the unit_id as the target, and assigns a role—owner or reviewer—that specifies the nature of the association. This tripartite structure (subject, target, role) is the canonical relationship form across the entire data model: it appears identically in the storage composition relationships and in the attestation attribute-value relationships, providing a uniform mechanism for expressing how entities relate to one another regardless of domain.

**t_measurement_with_unit__unit**

| id | measurement_id | unit_id | role |
| --- | --- | --- | --- |
| UNIT-0001 | UNIT-0004 | UNIT-0001 | owner |
| UNIT-0002 | UNIT-0002 | UNIT-0002 | reviewer |
| UNIT-0003 | UNIT-0008 | UNIT-0005 | observer |
| UNIT-0004 | UNIT-0005 | UNIT-0006 | reviewer |
| UNIT-0005 | UNIT-0007 | UNIT-0003 | contributor |
| UNIT-0006 | UNIT-0003 | UNIT-0002 | contributor |
| UNIT-0007 | UNIT-0005 | UNIT-0006 | contributor |
| UNIT-0008 | UNIT-0006 | UNIT-0004 | contributor |

Attestation records represent the governance layer of the model, capturing compliance reviews, risk assessments, and audit outcomes. An attestation such as Vendor risk assessment or HIPAA compliance review is an entity that carries typed attributes, and those attributes are resolved to concrete values through a set of value tables partitioned by data type. The attribute duration_seconds, declared as xsd:decimal, resolves to values such as 7132.97 or 6429.54 in the decimal value table; the attribute end_time, declared as xsd:dateTime, resolves to values such as 2024-11-18T12:26:52 or 2023-12-15T15:31:35 in the datetime value table; the attribute exit_code, declared as xsd:integer, resolves to values such as 898 or 487 in the integer value table; and the attribute host_name, declared as xsd:string, resolves to values such as ingest-21 or Log Level 02 in the varchar value table. The entity_id column in each value table binds the resolved value back to its attestation entity, while the attr_id column binds it to its attribute definition, forming a subject-target relationship that is itself mediated by a role in the generic relationship table.

The misc column, appearing as the value carrier in the attribute-value tables, is the generic container for resolved attribute data. It holds heterogeneous types—datetime strings, decimal numbers, integers, and variable-length character strings—within a single column, with the actual type enforced by the attr_type declaration in the attribute definition table and by the partitioning of values across type-specific tables. This design avoids the need for a single polymorphic column while maintaining a uniform access pattern: any attribute value is resolved by joining the entity, the attribute definition, and the appropriate value table. The role column, present in every relationship table, provides the semantic glue that distinguishes between different kinds of associations between the same pair of entities. Whether a database container is an observer of a storage structure or a reviewer of it, whether a unit is an owner of a measurement or a reviewer of it, the role column encodes the governance semantics of the relationship in a machine-readable form that supports policy evaluation, access control, and audit trail generation.