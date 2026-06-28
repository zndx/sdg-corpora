---
chapter_id: ch_live_entity_match_link_089e2a
topic_id: 3
family: 07_long_tail
cited_terms: ['entity_match_link', 'dataset_with_record_count', 'storage_structure_composition']
model: engine-refine
---

Entity linkage serves as the foundational mechanism for establishing provenance and traceability across heterogeneous data assets, with each match relationship recorded as a discrete link between a source entity and its reference counterpart. The linkage table captures associations such as the laboratory instrument SN-4491 connected to reference standard RS-004, or the sample batch SB-2214 paired with validation suite VS-605, while governance policy DOC-992 is mapped to standard template ST-099. These identifiers—LINK-0001 through LINK-0004—function as the stable keys through which all attribute metadata and typed values are resolved, ensuring that every quality dimension, methodological note, and temporal stamp remains anchored to a specific match relationship rather than floating as unstructured annotation.

**t_entity_match_link**

| id | entity | matches_entity |
| --- | --- | --- |
| LINK-0001 | Lab instrument SN-4491 | Reference standard RS-004 |
| LINK-0002 | Sample batch SB-2214 | Validation suite VS-605 |
| LINK-0003 | Dataset v4.2.1 | Validation suite VS-605 |
| LINK-0004 | Governance policy DOC-992 | Standard template ST-099 |
| LINK-0005 | Governance policy DOC-992 | Matched registry MR-881 |
| LINK-0006 | Provenance log PR-7741 | Validation suite VS-605 |

**t_entity_match_link_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| LINK-0001 | confidence | xsd:decimal |
| LINK-0002 | dimension_kind | xsd:string |
| LINK-0003 | method | xsd:string |
| LINK-0004 | recorded_at | xsd:dateTime |
| LINK-0005 | uncertainty | xsd:decimal |
| LINK-0006 | unit | xsd:string |
| LINK-0007 | value | xsd:decimal |
| LINK-0008 | encoding | xsd:string |

**t_entity_match_link_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LINK-0001 | LINK-0001 | LINK-0004 | 2025-02-02T03:38:54 |
| LINK-0002 | LINK-0002 | LINK-0004 | 2024-07-01T04:17:43 |
| LINK-0003 | LINK-0003 | LINK-0004 | 2023-10-04T15:34:58 |
| LINK-0004 | LINK-0004 | LINK-0004 | 2025-05-20T07:58:08 |
| LINK-0005 | LINK-0005 | LINK-0004 | 2023-04-10T04:16:09 |
| LINK-0006 | LINK-0006 | LINK-0004 | 2023-09-16T03:40:04 |

**t_entity_match_link_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LINK-0001 | LINK-0001 | LINK-0001 | 0.249 |
| LINK-0002 | LINK-0001 | LINK-0005 | 448.20 |
| LINK-0003 | LINK-0001 | LINK-0007 | 699.43 |
| LINK-0004 | LINK-0002 | LINK-0001 | 0.772 |
| LINK-0005 | LINK-0002 | LINK-0005 | 156.67 |
| LINK-0006 | LINK-0002 | LINK-0007 | 439.51 |
| LINK-0007 | LINK-0003 | LINK-0001 | 0.389 |
| LINK-0008 | LINK-0003 | LINK-0005 | 388.52 |

**t_entity_match_link_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LINK-0001 | LINK-0001 | LINK-0002 | Dimension Kind 01 |
| LINK-0002 | LINK-0001 | LINK-0008 | Encoding 02 |
| LINK-0003 | LINK-0001 | LINK-0009 | audit excerpt |
| LINK-0004 | LINK-0001 | LINK-0010 | es |
| LINK-0005 | LINK-0001 | LINK-0003 | manual |
| LINK-0006 | LINK-0001 | LINK-0006 | count |
| LINK-0007 | LINK-0002 | LINK-0002 | Dimension Kind 07 |
| LINK-0008 | LINK-0002 | LINK-0008 | Encoding 08 |

**t_dataset_with_record_count**

| id | dataset | record | size_bytes | version |
| --- | --- | --- | --- | --- |
| COUN-0001 | customer_profile_db | sensor_telemetry | 177784075 | 3 |
| COUN-0002 | network_packet_capture | ingestion_batch | 723832596 | 8 |
| COUN-0003 | financial_transactions_q3 | satellite_image | 973314714 | 3 |
| COUN-0004 | financial_transactions_q3 | sensor_telemetry | 658168246 | 12 |
| COUN-0005 | compliance_audit_trail | compliance_audit | 780581245 | 4 |
| COUN-0006 | clinical_trials_arm_b | satellite_image | 519122574 | 10 |
| COUN-0007 | user_session_logs | financial_transaction | 692732003 | 3 |

The attribute-value architecture employs a typed entity-attribute-value pattern that separates schema definition from value storage, with each attribute declared by name and constrained to an XML Schema datatype in the attribute registry. Confidence scores are stored as `xsd:decimal` values ranging from 0.249 to 0.772 across match links, while categorical descriptors such as dimension kind and encoding scheme are persisted as `xsd:string` values including "Dimension Kind 01" and "Encoding 02". Temporal metadata—recorded timestamps such as 2025-02-02T03:38:54 and 2023-10-04T15:34:58—resides in the dedicated datetime value table, and auxiliary text such as "audit excerpt" and language codes like "es" are held in the varchar value table. This type-disaggregated design ensures that numeric comparisons, date-range queries, and string searches each operate on appropriately typed storage without implicit coercion overhead.

Dataset cataloging operates as a parallel tracking layer, recording the physical and logical properties of stored data collections independently of match relationships. The dataset registry associates each collection with its record type—sensor telemetry, ingestion batch, or satellite image—and tracks version progression across revisions, as evidenced by financial transactions q3 appearing at both version 3 and version 12, and customer profile database at version 3 alongside network packet capture at version 8. Storage footprint is quantified in bytes, with individual datasets ranging from approximately 178 MB for the customer profile database to nearly 973 MB for the financial transactions q3 dataset at version 3, providing the capacity planning data necessary for tiered storage allocation and retention policy enforcement.

Storage infrastructure is modeled through a composition hierarchy that decomposes abstract storage structures into their constituent database containers, with each structural element—whether a tiered storage pool, archive tape library, or SAN disk array—linked to specific runtime components such as dev-mongo-shard, staging-redis-cluster, s3-logs-bucket, and cassandra-data-node. The composition relationship is further qualified by a role attribute that distinguishes between observer and reviewer responsibilities, establishing a governance layer over the physical topology. In the observed data, the tiered storage pool COMP-0003 assumes both observer and reviewer roles across different composition links, while the archive tape library COMP-0002 is associated with a reviewer role, reflecting the differentiated access controls and audit obligations that apply to cold storage versus active data tiers.

**t_storage_structure_composition**

| id | storage_structure_composition |
| --- | --- |
| COMP-0001 | tiered-storage-pool |
| COMP-0002 | archive-tape-library |
| COMP-0003 | tiered-storage-pool |
| COMP-0004 | san-disk-array |
| COMP-0005 | archive-tape-library |
| COMP-0006 | flash-memory-pool |

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