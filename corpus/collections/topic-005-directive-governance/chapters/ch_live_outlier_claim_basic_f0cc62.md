---
chapter_id: ch_live_outlier_claim_basic_f0cc62
topic_id: 5
family: 02_observation_measurement
cited_terms: ['outlier_claim_basic', 'equiv_intersect_three', 'schema_migration_subclass']
model: engine-refine
---

An identifier serves as the immutable anchor for every entity within the data fabric, a persistent key that survives schema evolution and cross-system reconciliation. Outlier claims bear identifiers such as CLAI-0001 through CLAI-0004, each designating a discrete anomaly event—latency_spike_alpha, cpu_throttle_event, schema_drift_v2—while migration subclasses carry their own namespace, MIGR-0001 through MIGR-0004, mapping to operational domains like compliance_audit, inventory_snapshot, sensor_telemetry, and transaction_ledger. Equivalence intersections follow a parallel convention with identifiers like THRE-0001, anchoring multi-dimensional relationships that bind a data source (lab_sample_registry, governance_policy_alpha, sensor_array_gamma) to a storage format (orc_table, csv_archive, hdf5_archive), a governance construct (crosswalk_rule, lineage_node, standard_mapping), and an infrastructure zone (dev_sandbox, hot_cache, air_gapped, staging_zone). The identifier is not merely a row handle; it is the stable reference point across all attribute-value bindings and migration mappings, ensuring that a decimal measurement of 0.504 or a timestamp of 2024-03-15T03:40:40 can always be traced back to the entity and attribute it describes.

**t_outlier_claim_basic**

| id | outlier |
| --- | --- |
| CLAI-0001 | latency_spike_alpha |
| CLAI-0002 | cpu_throttle_event |
| CLAI-0003 | schema_drift_v2 |
| CLAI-0004 | latency_spike_alpha |
| CLAI-0005 | null_partition_42 |
| CLAI-0006 | cpu_throttle_event |

**t_outlier_claim_basic_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| CLAI-0001 | confidence | xsd:decimal |
| CLAI-0002 | dimension_kind | xsd:string |
| CLAI-0003 | method | xsd:string |
| CLAI-0004 | recorded_at | xsd:dateTime |
| CLAI-0005 | uncertainty | xsd:decimal |
| CLAI-0006 | unit | xsd:string |
| CLAI-0007 | value | xsd:decimal |
| CLAI-0008 | encoding | xsd:string |

**t_outlier_claim_basic_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CLAI-0001 | CLAI-0001 | CLAI-0004 | 2024-03-15T03:40:40 |
| CLAI-0002 | CLAI-0002 | CLAI-0004 | 2024-01-06T03:41:39 |
| CLAI-0003 | CLAI-0003 | CLAI-0004 | 2024-07-22T19:11:00 |
| CLAI-0004 | CLAI-0004 | CLAI-0004 | 2024-01-05T19:13:32 |
| CLAI-0005 | CLAI-0005 | CLAI-0004 | 2024-05-18T14:20:48 |
| CLAI-0006 | CLAI-0006 | CLAI-0004 | 2024-11-02T05:08:03 |

**t_outlier_claim_basic_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CLAI-0001 | CLAI-0001 | CLAI-0001 | 0.504 |
| CLAI-0002 | CLAI-0001 | CLAI-0005 | 834.64 |
| CLAI-0003 | CLAI-0001 | CLAI-0007 | 880.81 |
| CLAI-0004 | CLAI-0002 | CLAI-0001 | 0.093 |
| CLAI-0005 | CLAI-0002 | CLAI-0005 | 347.65 |
| CLAI-0006 | CLAI-0002 | CLAI-0007 | 472.12 |
| CLAI-0007 | CLAI-0003 | CLAI-0001 | 0.859 |
| CLAI-0008 | CLAI-0003 | CLAI-0005 | 734.07 |

**t_outlier_claim_basic_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CLAI-0001 | CLAI-0001 | CLAI-0002 | Dimension Kind 01 |
| CLAI-0002 | CLAI-0001 | CLAI-0008 | Encoding 02 |
| CLAI-0003 | CLAI-0001 | CLAI-0009 | change rationale |
| CLAI-0004 | CLAI-0001 | CLAI-0010 | en |
| CLAI-0005 | CLAI-0001 | CLAI-0003 | manual |
| CLAI-0006 | CLAI-0001 | CLAI-0006 | mg/L |
| CLAI-0007 | CLAI-0002 | CLAI-0002 | Dimension Kind 07 |
| CLAI-0008 | CLAI-0002 | CLAI-0008 | Encoding 08 |

**t_equiv_intersect_three**

| id | equiv | equiv_2 | equiv_3 | equiv_4 |
| --- | --- | --- | --- | --- |
| THRE-0001 | lab_sample_registry | orc_table | crosswalk_rule | dev_sandbox |
| THRE-0002 | governance_policy_alpha | orc_table | lineage_node | hot_cache |
| THRE-0003 | governance_policy_alpha | csv_archive | standard_mapping | air_gapped |
| THRE-0004 | sensor_array_gamma | hdf5_archive | crosswalk_rule | staging_zone |
| THRE-0005 | telemetry_stream_alpha | netcdf_file | retention_policy | dev_sandbox |
| THRE-0006 | lab_sample_registry | parquet_dataset | schema_binding | edge_node |

**t_schema_migration_subclass**

| id | schema |
| --- | --- |
| MIGR-0001 | compliance_audit |
| MIGR-0002 | inventory_snapshot |
| MIGR-0003 | sensor_telemetry |
| MIGR-0004 | transaction_ledger |
| MIGR-0005 | compliance_audit |
| MIGR-0006 | inventory_snapshot |

Attributes define the dimensions along which entities are characterized, each attribute carrying a name and a type that governs how its values are stored and validated. The attribute registry records names such as confidence, dimension_kind, method, and recorded_at, each bound to an XSD type—xsd:decimal, xsd:string, xsd:dateTime—that constrains the shape of permissible values. This type discipline is enforced through a value partitioning strategy: decimal attributes resolve to a dedicated value table where measurements like 834.64 and 880.81 are stored alongside their entity and attribute references; string attributes land in a varchar table carrying values such as Dimension Kind 01, Encoding 02, change rationale, and en; datetime attributes are isolated in their own table, preserving temporal precision in ISO 8601 form. The separation is not an implementation artifact but a governance mechanism—type safety is maintained at query time, and the schema can evolve one attribute family at a time without destabilizing the others.

Entities are the subjects of these attribute bindings, the things that possess properties and participate in relationships. An entity identifier appears in every value row, linking a specific measurement or annotation back to the claim or object it qualifies. In the decimal value table, entity CLAI-0001 carries three distinct attributes (CLAI-0001, CLAI-0005, CLAI-0007) with values spanning 0.504 to 880.81, while entity CLAI-0002 holds a single decimal attribute (CLAI-0001) with value 0.093. The same entity appears in the varchar table, where CLAI-0001 is associated with four string attributes (CLAI-0002, CLAI-0008, CLAI-0009, CLAI-0010) carrying descriptive metadata. This many-to-many relationship between entity and attribute is the core of the model: an entity is not a fixed row with predetermined columns but a graph node whose properties are assembled dynamically from value rows keyed by entity and attribute identifiers.

The subject-target-role construct formalizes relationships between entities, particularly in the context of schema migrations and cross-system mappings. A migration subclass does not simply point to a destination; it declares a role that the source schema plays vis-à-vis the target. The relationship table t_schema_migration_subclass__migrates_schema_to encodes this triad: a schema identifier (subject), a destination identifier (target), and a role (owner, observer, reviewer) that specifies the nature of the dependency. For instance, schema MIGR-0004 assumes the role of owner against target MIGR-0001, while the same source appears as observer against MIGR-0007 and reviewer against MIGR-0004. This role-based relationship model allows a single migration to participate in multiple downstream dependencies with different governance postures, and it enables auditors to reconstruct the lineage of a schema as it moves from compliance_audit through PostgreSQL_14 to ClickHouse_v20, DeltaLake_v1, or BigQuery_warehouse, with each hop annotated by the role the source schema plays in the destination's architecture.

**t_schema_migration_subclass_migrates_schema_to**

| id | migrates_schema_to |
| --- | --- |
| MIGR-0001 | PostgreSQL_14 |
| MIGR-0002 | ClickHouse_v20 |
| MIGR-0003 | DeltaLake_v1 |
| MIGR-0004 | BigQuery_warehouse |
| MIGR-0005 | Avro_registry |
| MIGR-0006 | GraphQL_resolvers |
| MIGR-0007 | Kafka_schemas |
| MIGR-0008 | Kafka_schemas |

**t_schema_migration_subclass__migrates_schema_to**

| id | schema_id | migrates_schema_to_id | role |
| --- | --- | --- | --- |
| MIGR-0001 | MIGR-0004 | MIGR-0001 | owner |
| MIGR-0002 | MIGR-0004 | MIGR-0007 | observer |
| MIGR-0003 | MIGR-0004 | MIGR-0007 | reviewer |
| MIGR-0004 | MIGR-0002 | MIGR-0004 | observer |
| MIGR-0005 | MIGR-0001 | MIGR-0001 | reviewer |
| MIGR-0006 | MIGR-0001 | MIGR-0008 | owner |
| MIGR-0007 | MIGR-0004 | MIGR-0002 | contributor |
| MIGR-0008 | MIGR-0001 | MIGR-0002 | owner |