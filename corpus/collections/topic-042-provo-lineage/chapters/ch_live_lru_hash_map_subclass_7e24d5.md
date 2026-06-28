---
chapter_id: ch_live_lru_hash_map_subclass_7e24d5
topic_id: 42
family: 07_long_tail
cited_terms: ['lru_hash_map_subclass', 'transformation_min_one_output', 'subclass_to_process']
model: engine-refine
---

In governed metadata systems, every record that must be referenced, audited, or joined across operational boundaries depends on a stable identifier. Identifiers such as MAP-0001, OUTP-0006, and PROC-0002 are not incidental labels; they are the durable handles by which configuration, lineage, and runtime evidence remain traceable when names change, deployments multiply, or compliance reviews span months. An identifier anchors a row within its declaring scope—whether that row names an LRU-backed cache implementation, a transformation step, or a process subclass—and permits foreign-key resolution without ambiguity. Where the same token appears in multiple contexts, as when MAP-0004 denotes both an LRU hash-map subclass and a hash-configuration record, the identifier’s meaning is fixed by the table and relationship in which it participates, not by the string alone.

**t_lru_hash_map_subclass**

| id | lru |
| --- | --- |
| MAP-0001 | primary-db-cache |
| MAP-0002 | stream-event-cache |
| MAP-0003 | global-rate-limiter |
| MAP-0004 | prod-session-cache |
| MAP-0005 | primary-db-cache |
| MAP-0006 | stream-event-cache |
| MAP-0007 | prod-session-cache |

**t_lru_hash_map_subclass_l_r_u_hash_config**

| id | l_r_u_hash_config |
| --- | --- |
| MAP-0001 | siphash-2-4 |
| MAP-0002 | xxhash64 |
| MAP-0003 | robin-hood |
| MAP-0004 | sparse-block-map |
| MAP-0005 | murmur3-128 |
| MAP-0006 | murmur3-128 |

**t_transformation_min_one_output**

| id | transformation |
| --- | --- |
| OUTP-0001 | data normalization |
| OUTP-0002 | data normalization |
| OUTP-0003 | format conversion |
| OUTP-0004 | format conversion |
| OUTP-0005 | record deduplication |
| OUTP-0006 | feature engineering |

**t_subclass_to_process**

| id | process |
| --- | --- |
| PROC-0001 | incident response |
| PROC-0002 | data validation |
| PROC-0003 | telemetry aggregation |
| PROC-0004 | batch ingestion |
| PROC-0005 | data validation |
| PROC-0006 | stream processing |

An entity is the thing about which facts are asserted: the incident-response process PROC-0001, the data-validation process PROC-0002, or any other subclass instance that accumulates observable state over time. Entities do not embed their properties inline; instead, attribute definitions declare what may be said about them, and separate value stores record what was actually observed. The attribute name—duration_seconds, end_time, exit_code, host_name—names the semantic slot; the attribute type—xsd:decimal, xsd:dateTime, xsd:integer, xsd:string—declares the validation and storage contract that governs admissible values. Typed separation is not cosmetic: a duration recorded as 5106.96 belongs in decimal storage, exit codes such as 684 and 195 in integer storage, timestamps including 2024-02-25T00:58:35 in datetime storage, and host identifiers like worker-07 in varchar storage. attr and attr_type together form the schema of permissible statements; entity plus attr_id selects which statement is being made about which subject of record.

**t_subclass_to_process_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| PROC-0001 | duration_seconds | xsd:decimal |
| PROC-0002 | end_time | xsd:dateTime |
| PROC-0003 | exit_code | xsd:integer |
| PROC-0004 | host_name | xsd:string |
| PROC-0005 | log_level | xsd:string |
| PROC-0006 | phase | xsd:string |
| PROC-0007 | retry_count | xsd:integer |
| PROC-0008 | scheduled_at | xsd:dateTime |

**t_subclass_to_process_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PROC-0001 | PROC-0001 | PROC-0002 | 2024-02-25T00:58:35 |
| PROC-0002 | PROC-0001 | PROC-0008 | 2025-01-11T16:52:13 |
| PROC-0003 | PROC-0001 | PROC-0009 | 2024-01-24T01:55:59 |
| PROC-0004 | PROC-0002 | PROC-0002 | 2024-06-21T23:54:50 |
| PROC-0005 | PROC-0002 | PROC-0008 | 2023-12-17T03:43:06 |
| PROC-0006 | PROC-0002 | PROC-0009 | 2023-12-07T20:42:12 |
| PROC-0007 | PROC-0003 | PROC-0002 | 2024-06-16T15:41:50 |
| PROC-0008 | PROC-0003 | PROC-0008 | 2025-01-20T06:41:15 |

**t_subclass_to_process_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PROC-0001 | PROC-0001 | PROC-0001 | 5106.96 |
| PROC-0002 | PROC-0002 | PROC-0001 | 6532.76 |
| PROC-0003 | PROC-0003 | PROC-0001 | 6219.83 |
| PROC-0004 | PROC-0004 | PROC-0001 | 2715.88 |
| PROC-0005 | PROC-0005 | PROC-0001 | 3614.44 |
| PROC-0006 | PROC-0006 | PROC-0001 | 6690.61 |

**t_subclass_to_process_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PROC-0001 | PROC-0001 | PROC-0003 | 684 |
| PROC-0002 | PROC-0001 | PROC-0007 | 195 |
| PROC-0003 | PROC-0002 | PROC-0003 | 63 |
| PROC-0004 | PROC-0002 | PROC-0007 | 361 |
| PROC-0005 | PROC-0003 | PROC-0003 | 107 |
| PROC-0006 | PROC-0003 | PROC-0007 | 1 |
| PROC-0007 | PROC-0004 | PROC-0003 | 32 |
| PROC-0008 | PROC-0004 | PROC-0007 | 2 |

**t_subclass_to_process_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PROC-0001 | PROC-0001 | PROC-0004 | worker-07 |
| PROC-0002 | PROC-0001 | PROC-0005 | Log Level 02 |
| PROC-0003 | PROC-0001 | PROC-0006 | closeout |
| PROC-0004 | PROC-0001 | PROC-0010 | pending |
| PROC-0005 | PROC-0001 | PROC-0011 | Triggered By 05 |
| PROC-0006 | PROC-0002 | PROC-0004 | worker-07 |
| PROC-0007 | PROC-0002 | PROC-0005 | Log Level 07 |
| PROC-0008 | PROC-0002 | PROC-0006 | closeout |

The misc dimension—carried in value fields across typed valuation tables—holds the instantiated fact once entity and attribute have been resolved. misc is deliberately generic at the column level because the concrete semantics are carried by attr_type: the same logical role of “stored observation” is fulfilled by 6532.76, by 2024-06-21T23:54:50, by 63, and by the string closeout, each admissible only within its declared type. Operational integrity therefore depends on tripartite linkage: entity_id identifies who the fact concerns, attr_id identifies which property is populated, and misc supplies the evidence. A single entity may assert many attributes simultaneously—PROC-0001 carries decimal durations, datetime boundaries, integer exit codes, and varchar host names in parallel—demonstrating that governance models must tolerate heterogeneous property bags without collapsing type discipline.

Where entities describe what exists, subject and target describe how distinct governed objects relate. In association records, subject denotes the originating or owning participant—an LRU instance referenced as MAP-0007 relating to a configuration, or transformation OUTP-0006 relating to an output dataset—while target denotes the counterpart resource that subject is bound to, such as hash configuration MAP-0004 or output dataset OUTP-0003. These terms orient directed relationships: subject is the node from which the edge is asserted; target is the node at which the edge arrives. Multiple subjects may converge on a shared target, as when both MAP-0001 and MAP-0004 associate to configuration MAP-0004, or when several transformation rows reference output dataset OUTP-0003; conversely, one subject may fan out across targets. The pattern generalizes beyond any single domain: LRU caches bind to hash algorithms, transformations bind to datasets, and the same structural vocabulary applies wherever catalogued components must be linked under policy.

**t_transformation_min_one_output_output_dataset**

| id | output_dataset |
| --- | --- |
| OUTP-0001 | parsed access logs |
| OUTP-0002 | curated events table |
| OUTP-0003 | curated events table |
| OUTP-0004 | standardized inventory index |
| OUTP-0005 | curated events table |
| OUTP-0006 | normalized feature set |

Role qualifies those associations by prescribing how the subject may interact with the target relative to governance expectations. A reviewer role on an LRU-to-configuration link or on a transformation-to-dataset link implies oversight authority—distinct from contributor, which signals participatory obligation, and from observer, which permits visibility without modification rights. Roles do not redefine subject or target; they annotate the edge. Thus MAP-0001 may relate to MAP-0004 as reviewer while MAP-0002 relates to MAP-0002 as contributor, and OUTP-0004 may stand as observer to OUTP-0003 even where OUTP-0001 and OUTP-0002 act as contributor to sibling datasets. Enforcement layers—access control, workflow routing, audit classification—consume role alongside identifier resolution to determine permissible action.

**t_transformation_min_one_output__output_dataset**

| id | transformation_id | output_dataset_id | role |
| --- | --- | --- | --- |
| OUTP-0001 | OUTP-0006 | OUTP-0003 | reviewer |
| OUTP-0002 | OUTP-0006 | OUTP-0005 | contributor |
| OUTP-0003 | OUTP-0006 | OUTP-0001 | contributor |
| OUTP-0004 | OUTP-0003 | OUTP-0003 | observer |
| OUTP-0005 | OUTP-0001 | OUTP-0004 | contributor |
| OUTP-0006 | OUTP-0002 | OUTP-0006 | observer |
| OUTP-0007 | OUTP-0004 | OUTP-0001 | owner |
| OUTP-0008 | OUTP-0005 | OUTP-0002 | contributor |

Taken together, identifier, entity, attr, attr_type, misc, subject, target, and role constitute a layered vocabulary for compliant description of operational systems. Identifiers and entities establish what is in scope; attributes and types declare what may be recorded; misc captures what was recorded; subject, target, and role express how configured artifacts and processes connect under differentiated authority. A practitioner who masters this separation can read a production footprint—primary-db-cache governed by siphash-2-4, stream-event-cache under xxhash64, batch ingestion durations near 2715.88, curated events tables produced under contributor roles—without conflating naming, typing, valuation, and permission. That separation is the practical foundation on which traceability, validation, and access policy rest.

**t_lru_hash_map_subclass__l_r_u_hash_config**

| id | lru_id | l_r_u_hash_config_id | role |
| --- | --- | --- | --- |
| MAP-0001 | MAP-0007 | MAP-0004 | reviewer |
| MAP-0002 | MAP-0004 | MAP-0002 | contributor |
| MAP-0003 | MAP-0003 | MAP-0002 | observer |
| MAP-0004 | MAP-0005 | MAP-0004 | reviewer |
| MAP-0005 | MAP-0004 | MAP-0005 | owner |
| MAP-0006 | MAP-0001 | MAP-0003 | contributor |
| MAP-0007 | MAP-0005 | MAP-0005 | reviewer |
| MAP-0008 | MAP-0007 | MAP-0002 | observer |