---
chapter_id: ch_live_anomaly_in_metric_d93c2e
topic_id: 186
family: 07_long_tail
cited_terms: ['anomaly_in_metric', 'equiv_intersect_three', 'soc2_security_subclass']
model: engine-refine
---

Attributes, attribute types, entities, and identifiers form the backbone of a normalized data model designed to capture heterogeneous metadata without rigid schema constraints. At the center of this architecture sit entities—distinct, addressable instances such as the anomaly records identified by METR-0001 through METR-0004, each representing a concrete operational event like a Cache Eviction Storm or a DNS Resolution Timeout. These entities are anchored to specific metrics, whether Network Bandwidth Saturation, Throughput Drop, or Request Latency P99, and each identifier follows a consistent prefix-based convention that enables unambiguous cross-referencing across the model. The entity is the primary unit of analysis; everything else—attributes, values, classifications—flows outward from it.

**t_anomaly_in_metric**

| id | anomaly | anomaly_in_metric |
| --- | --- | --- |
| METR-0001 | Cache Eviction Storm | Network Bandwidth Saturation |
| METR-0002 | Memory Leak Spike | Throughput Drop |
| METR-0003 | Memory Leak Spike | Disk Write Bytes |
| METR-0004 | DNS Resolution Timeout | Request Latency P99 |
| METR-0005 | Kernel Panic | Error Rate Delta |
| METR-0006 | Memory Leak Spike | Network Bandwidth Saturation |

**t_anomaly_in_metric_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| METR-0001 | confidence | xsd:decimal |
| METR-0002 | dimension_kind | xsd:string |
| METR-0003 | method | xsd:string |
| METR-0004 | recorded_at | xsd:dateTime |
| METR-0005 | uncertainty | xsd:decimal |
| METR-0006 | unit | xsd:string |
| METR-0007 | value | xsd:decimal |
| METR-0008 | encoding | xsd:string |

**t_anomaly_in_metric_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| METR-0001 | METR-0001 | METR-0004 | 2025-04-23T06:08:33 |
| METR-0002 | METR-0002 | METR-0004 | 2025-05-24T14:06:40 |
| METR-0003 | METR-0003 | METR-0004 | 2024-05-21T09:32:53 |
| METR-0004 | METR-0004 | METR-0004 | 2024-12-09T22:35:58 |
| METR-0005 | METR-0005 | METR-0004 | 2024-11-21T20:37:39 |
| METR-0006 | METR-0006 | METR-0004 | 2024-09-07T09:05:43 |

**t_anomaly_in_metric_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| METR-0001 | METR-0001 | METR-0001 | 0.515 |
| METR-0002 | METR-0001 | METR-0005 | 505.78 |
| METR-0003 | METR-0001 | METR-0007 | 646.06 |
| METR-0004 | METR-0002 | METR-0001 | 0.337 |
| METR-0005 | METR-0002 | METR-0005 | 475.15 |
| METR-0006 | METR-0002 | METR-0007 | 359.78 |
| METR-0007 | METR-0003 | METR-0001 | 0.527 |
| METR-0008 | METR-0003 | METR-0005 | 251.95 |

**t_anomaly_in_metric_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| METR-0001 | METR-0001 | METR-0002 | Dimension Kind 01 |
| METR-0002 | METR-0001 | METR-0008 | Encoding 02 |
| METR-0003 | METR-0001 | METR-0009 | calibration record |
| METR-0004 | METR-0001 | METR-0010 | de |
| METR-0005 | METR-0001 | METR-0003 | hybrid |
| METR-0006 | METR-0001 | METR-0006 | m/s |
| METR-0007 | METR-0002 | METR-0002 | Dimension Kind 07 |
| METR-0008 | METR-0002 | METR-0008 | Encoding 08 |

Attributes define the dimensions along which an entity is described, and attribute types enforce type discipline at the schema level. In the anomaly metric domain, attributes such as confidence, dimension_kind, method, and recorded_at are declared with corresponding types drawn from the XML Schema Definition namespace: xsd:decimal for numeric precision, xsd:string for free-form text, and xsd:dateTime for temporal stamps. This separation of attribute definition from attribute value allows the model to remain extensible; new attributes can be introduced without altering the underlying table structure. The same pattern recurs in the SOC 2 security subclass domain, where attributes like effective_date, enforcement, mandatory, and priority are typed as xsd:date, xsd:string, xsd:boolean, and xsd:integer respectively, ensuring that a boolean flag and a date value are never conflated during query or validation.

**t_soc2_security_subclass**

| id | soc | for_s_o_c2_domain |
| --- | --- | --- |
| SECU-0001 | SOC2-CloudInfra | Virtual Networks |
| SECU-0002 | SOC3-Public | Microservice Mesh |
| SECU-0003 | SOC2-Fintech | Database Clusters |
| SECU-0004 | SOC2-IdentityProvider | Microservice Mesh |
| SECU-0005 | SOC2-SaaS | Data Warehouses |
| SECU-0006 | SOC2-TypeII | Database Clusters |
| SECU-0007 | SOC2-SaaS | Database Clusters |

**t_soc2_security_subclass_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| SECU-0001 | effective_date | xsd:date |
| SECU-0002 | enforcement | xsd:string |
| SECU-0003 | mandatory | xsd:boolean |
| SECU-0004 | priority | xsd:integer |
| SECU-0005 | review_cycle_days | xsd:integer |
| SECU-0006 | scope | xsd:string |
| SECU-0007 | encoding | xsd:string |
| SECU-0008 | label_text | xsd:string |

**t_soc2_security_subclass_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SECU-0001 | SECU-0001 | SECU-0003 | true |
| SECU-0002 | SECU-0002 | SECU-0003 | false |
| SECU-0003 | SECU-0003 | SECU-0003 | true |
| SECU-0004 | SECU-0004 | SECU-0003 | false |
| SECU-0005 | SECU-0005 | SECU-0003 | false |
| SECU-0006 | SECU-0006 | SECU-0003 | false |
| SECU-0007 | SECU-0007 | SECU-0003 | false |

**t_soc2_security_subclass_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SECU-0001 | SECU-0001 | SECU-0001 | 2023-08-15 |
| SECU-0002 | SECU-0002 | SECU-0001 | 2024-04-12 |
| SECU-0003 | SECU-0003 | SECU-0001 | 2024-01-26 |
| SECU-0004 | SECU-0004 | SECU-0001 | 2025-05-01 |
| SECU-0005 | SECU-0005 | SECU-0001 | 2023-05-03 |
| SECU-0006 | SECU-0006 | SECU-0001 | 2025-05-11 |
| SECU-0007 | SECU-0007 | SECU-0001 | 2024-10-21 |

**t_soc2_security_subclass_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SECU-0001 | SECU-0001 | SECU-0004 | 5 |
| SECU-0002 | SECU-0001 | SECU-0005 | 926 |
| SECU-0003 | SECU-0002 | SECU-0004 | 1 |
| SECU-0004 | SECU-0002 | SECU-0005 | 849 |
| SECU-0005 | SECU-0003 | SECU-0004 | 2 |
| SECU-0006 | SECU-0003 | SECU-0005 | 409 |
| SECU-0007 | SECU-0004 | SECU-0004 | 5 |
| SECU-0008 | SECU-0004 | SECU-0005 | 551 |

Values are stored in type-specialized tables that link back to both the entity and the attribute through foreign keys, creating a three-way join that reconstructs the full attribute-value pair at query time. For anomaly metrics, decimal values such as 0.515 and 505.78 reside in the value_decimal table, datetime stamps like 2025-04-23T06:08:33 in the value_datetime table, and string payloads such as Dimension Kind 01, Encoding 02, and calibration record in the value_varchar table. The SOC 2 security subclass follows an identical pattern: boolean values (true, false) are stored in a dedicated boolean table, integer priorities (5, 926, 1, 849) in an integer table, date values (2023-08-15, 2024-04-12, 2025-05-01) in a date table, and textual data (Encoding 01, Enforcement 02, audit excerpt) in a varchar table. This type-partitioned value storage eliminates null columns, enforces type safety at the storage layer, and allows each value table to be indexed and optimized for its specific data type.

**t_soc2_security_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SECU-0001 | SECU-0001 | SECU-0007 | Encoding 01 |
| SECU-0002 | SECU-0001 | SECU-0002 | Enforcement 02 |
| SECU-0003 | SECU-0001 | SECU-0008 | audit excerpt |
| SECU-0004 | SECU-0001 | SECU-0009 | de |
| SECU-0005 | SECU-0001 | SECU-0006 | Scope 05 |
| SECU-0006 | SECU-0002 | SECU-0007 | Encoding 06 |
| SECU-0007 | SECU-0002 | SECU-0002 | Enforcement 07 |
| SECU-0008 | SECU-0002 | SECU-0008 | audit excerpt |

The entity-attribute-value relationship is further enriched by cross-domain equivalence mappings that capture semantic relationships between disparate data assets. The equivalence intersection table encodes four-way associations—for instance, linking lab_sample_registry with orc_table, crosswalk_rule, and dev_sandbox in a single tuple, or connecting governance_policy_alpha with orc_table, lineage_node, and hot_cache in another. These mappings serve as a semantic layer, enabling queries that traverse from a governance policy to its underlying data format, its lineage position, and its deployment environment in a single join. Similarly, the SOC 2 security subclass table itself acts as a classification entity, associating security frameworks such as SOC2-CloudInfra, SOC3-Public, and SOC2-IdentityProvider with infrastructure domains like Virtual Networks, Microservice Mesh, and Database Clusters, thereby grounding abstract compliance requirements in concrete technical contexts.

Together, this structure supports a governance model where every observable—whether an anomaly, a security control, or a data asset—can be described through a flexible set of typed attributes, traced to its source through equivalence mappings, and queried with type-safe precision. The identifier convention (METR- for metrics, SECU- for security, THRE- for equivalence intersections) provides a naming discipline that makes the data self-documenting, while the separation of attribute definitions from their values ensures that schema evolution does not require migration scripts or downtime. In practice, this means that a compliance auditor can reconstruct the full profile of a single entity—its anomalies, its security posture, its data lineage—by following a consistent join pattern across a small, well-defined set of tables, regardless of how many attributes or value types are involved.

**t_equiv_intersect_three**

| id | equiv | equiv_2 | equiv_3 | equiv_4 |
| --- | --- | --- | --- | --- |
| THRE-0001 | lab_sample_registry | orc_table | crosswalk_rule | dev_sandbox |
| THRE-0002 | governance_policy_alpha | orc_table | lineage_node | hot_cache |
| THRE-0003 | governance_policy_alpha | csv_archive | standard_mapping | air_gapped |
| THRE-0004 | sensor_array_gamma | hdf5_archive | crosswalk_rule | staging_zone |
| THRE-0005 | telemetry_stream_alpha | netcdf_file | retention_policy | dev_sandbox |
| THRE-0006 | lab_sample_registry | parquet_dataset | schema_binding | edge_node |