---
chapter_id: ch_live_perf_buffer_map_subclass_c16a52
topic_id: 186
family: 07_long_tail
cited_terms: ['perf_buffer_map_subclass', 'attribute_set_supports_outlier_claim', 'subclass_to_artifact']
model: engine-refine
---

In data governance and compliance frameworks, identifiers serve as the immutable anchors that bind together disparate pieces of evidence about a system's components. Each entity—whether a performance buffer mapping such as MAP-0001 or MAP-0002, or an artifact like ARTI-0001 through ARTI-0004—receives a unique identifier that enables unambiguous reference across the entire dataset. These identifiers are not merely labels; they are the foreign keys that stitch together the relational fabric, allowing a single performance benchmark such as cassandra-perf or tpch-10gb to be traced back through its configuration, its attributes, and its associated artifacts. The identifier space is partitioned by prefix to signal provenance: MAP- prefixed entries denote performance buffer mappings, while ARTI- prefixed entries identify artifacts, and CLAI- prefixed entries reference attribute sets that support outlier claims.

**t_perf_buffer_map_subclass**

| id | perf | perf_buffer_config |
| --- | --- | --- |
| MAP-0001 | cassandra-perf | CLAI-0002 |
| MAP-0002 | netperf-tcp | CLAI-0001 |
| MAP-0003 | iperf3-stream | CLAI-0004 |
| MAP-0004 | tpch-10gb | CLAI-0005 |
| MAP-0005 | spec-jbb2015 | CLAI-0003 |
| MAP-0006 | pgbench-default | CLAI-0001 |
| MAP-0007 | spark-stress | CLAI-0004 |

**t_perf_buffer_map_subclass_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| MAP-0001 | MAP-0001 | MAP-0002 | 2023-01-21 |
| MAP-0002 | MAP-0002 | MAP-0002 | 2023-09-17 |
| MAP-0003 | MAP-0003 | MAP-0002 | 2023-07-22 |
| MAP-0004 | MAP-0004 | MAP-0002 | 2024-09-18 |
| MAP-0005 | MAP-0005 | MAP-0002 | 2025-02-25 |
| MAP-0006 | MAP-0006 | MAP-0002 | 2024-02-08 |
| MAP-0007 | MAP-0007 | MAP-0002 | 2024-05-18 |

**t_perf_buffer_map_subclass_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| MAP-0001 | MAP-0001 | MAP-0006 | 60 |
| MAP-0002 | MAP-0001 | MAP-0008 | 11 |
| MAP-0003 | MAP-0002 | MAP-0006 | 123 |
| MAP-0004 | MAP-0002 | MAP-0008 | 12 |
| MAP-0005 | MAP-0003 | MAP-0006 | 190 |
| MAP-0006 | MAP-0003 | MAP-0008 | 10 |
| MAP-0007 | MAP-0004 | MAP-0006 | 100 |
| MAP-0008 | MAP-0004 | MAP-0008 | 1 |

**t_attribute_set_supports_outlier_claim**

| id | attribute |
| --- | --- |
| CLAI-0001 | source system ID |
| CLAI-0002 | validation rule |
| CLAI-0003 | geolocation accuracy |
| CLAI-0004 | sensor calibration |
| CLAI-0005 | source system ID |
| CLAI-0006 | validation rule |

**t_attribute_set_supports_outlier_claim_supports**

| id | supports |
| --- | --- |
| CLAI-0001 | API gateway |
| CLAI-0002 | PostgreSQL instance |
| CLAI-0003 | Ontology registry |
| CLAI-0004 | Ontology registry |
| CLAI-0005 | Storage volume |
| CLAI-0006 | Storage volume |

Attributes and their types form the schema of metadata that can be attached to any entity. An attribute such as checksum, created_date, identifier, or license is declared once with a precise type—xsd:string for free-form text, xsd:date for calendar dates, or cco:DesignativeICE for designative identifiers—and then instantiated across multiple entities. This separation of attribute definition from attribute value is critical: it ensures that the same property, like the license CC-BY-4.0 or the identifier a3f9c21e, is stored consistently and can be queried uniformly regardless of which entity it describes. The type system enforces data integrity at the schema level, so that a date value such as 2023-01-21 or 2024-09-18 is always validated against the xsd:date constraint, while an integer value like 60 or 123 conforms to its numeric type.

The value storage strategy reflects a common pattern in compliance-oriented data models: attribute values are materialized in type-specific tables rather than a single generic column. Date values—created_date entries like 2023-09-17 or 2023-07-22—reside in the value_date table, integer values such as 60 or 123 in the value_int table, and string values including the license CC-BY-4.0, the geolocation ap-south-2, and the identifier gid://svc/77 in the value_varchar table. Each value row is linked to its entity through entity_id and to its attribute through attr_id, creating a normalized structure where the same attribute can hold different values across different entities. For instance, the attribute referenced by attr_id MAP-0002 carries distinct date values for each entity, while the attribute MAP-0001 holds the string a3f9c21e and the attribute MAP-0009 holds ap-south-2, all within the same varchar value table.

Checksums and licenses are first-class attributes that carry particular weight in compliance and provenance tracking. The artifact table t_subclass_to_artifact stores checksums such as c0ffee42 and 5e8f3c91 alongside artifact names like checksum-manifest-v4, batch-processor-logs, and genomic-sequence-17, with licenses including BSD-3-Clause, MIT, and CC-BY-4.0. The checksum 5e8f3c91 appears for both batch-processor-logs and sensor-calibration-v2, indicating that these artifacts share an identical integrity hash—a signal that may warrant investigation or confirm a shared build lineage. The license CC-BY-4.0 appears both in the artifact table and as a varchar value in the performance buffer mapping, demonstrating how licensing information propagates across entity types and must be reconciled consistently.

**t_perf_buffer_map_subclass_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| MAP-0001 | checksum | xsd:string |
| MAP-0002 | created_date | xsd:date |
| MAP-0003 | identifier | cco:DesignativeICE |
| MAP-0004 | license | xsd:string |
| MAP-0005 | mime_type | xsd:string |
| MAP-0006 | size_bytes | xsd:long |
| MAP-0007 | uri | xsd:string |
| MAP-0008 | version | xsd:integer |

**t_perf_buffer_map_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| MAP-0001 | MAP-0001 | MAP-0001 | a3f9c21e |
| MAP-0002 | MAP-0001 | MAP-0003 | gid://svc/77 |
| MAP-0003 | MAP-0001 | MAP-0004 | CC-BY-4.0 |
| MAP-0004 | MAP-0001 | MAP-0009 | ap-south-2 |
| MAP-0005 | MAP-0001 | MAP-0005 | application/xml |
| MAP-0006 | MAP-0001 | MAP-0010 | Name 06 |
| MAP-0007 | MAP-0001 | MAP-0011 | governance |
| MAP-0008 | MAP-0001 | MAP-0012 | Tags 08 |

**t_subclass_to_artifact**

| id | artifact | checksum | license |
| --- | --- | --- | --- |
| ARTI-0001 | checksum-manifest-v4 | c0ffee42 | BSD-3-Clause |
| ARTI-0002 | batch-processor-logs | 5e8f3c91 | CC-BY-4.0 |
| ARTI-0003 | genomic-sequence-17 | 1a4b6c2d | MIT |
| ARTI-0004 | sensor-calibration-v2 | 5e8f3c91 | CC-BY-4.0 |
| ARTI-0005 | model-weights-resnet50 | 5e8f3c91 | proprietary |
| ARTI-0006 | pipeline-output-stage3 | 9d2b7a16 | Apache-2.0 |
| ARTI-0007 | lab-reagent-batch-A7 | 7b14de08 | Apache-2.0 |
| ARTI-0008 | batch-processor-logs | 1a4b6c2d | BSD-3-Clause |

The relationship between attributes and their supporting systems is modeled through a tripartite structure involving subject, target, and role. The attribute table t_attribute_set_supports_outlier_claim defines what is being validated—source system ID, validation rule, geolocation accuracy, sensor calibration—while the supports table t_attribute_set_supports_outlier_claim_supports identifies the infrastructure that backs these claims: API gateway, PostgreSQL instance, and Ontology registry. The join table t_attribute_set_supports_outlier_claim__supports connects them with a role that specifies the nature of the relationship. The same support system, such as the Ontology registry, can serve multiple attributes (CLAI-0003 and CLAI-0005) and can hold different roles—owner for CLAI-0003 and contributor for CLAI-0005—while the API gateway serves as a contributor to CLAI-0001 and the PostgreSQL instance supports CLAI-0002. This role-based relationship model enables fine-grained accountability: auditors can trace which system is responsible for which attribute claim and in what capacity, providing an auditable chain of custody for compliance evidence.

**t_attribute_set_supports_outlier_claim__supports**

| id | attribute_id | supports_id | role |
| --- | --- | --- | --- |
| CLAI-0001 | CLAI-0001 | CLAI-0001 | contributor |
| CLAI-0002 | CLAI-0005 | CLAI-0002 | contributor |
| CLAI-0003 | CLAI-0003 | CLAI-0005 | owner |
| CLAI-0004 | CLAI-0005 | CLAI-0005 | contributor |
| CLAI-0005 | CLAI-0006 | CLAI-0001 | owner |
| CLAI-0006 | CLAI-0004 | CLAI-0002 | contributor |
| CLAI-0007 | CLAI-0001 | CLAI-0004 | reviewer |
| CLAI-0008 | CLAI-0001 | CLAI-0002 | contributor |