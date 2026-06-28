---
chapter_id: ch_live_transformation_min_one_output_c95352
topic_id: 42
family: 05_provo_lineage
cited_terms: ['transformation_min_one_output', 'lru_hash_map_subclass', 'kernelhook_basic']
model: engine-refine
---

In systems that model heterogeneous resources through a normalized schema, the identifier serves as the immutable anchor for every entity, while attributes and their types provide the descriptive fabric that distinguishes one entity from another. The `t_kernelhook_basic` table establishes kernel hook entities such as `Tracepoint-block-io`, `BPF-co-re-syscall`, `Kprobes-schedule`, and `Fentry-kernel-init`, each bearing a unique identifier like `KERN-0001` through `KERN-0004`. The schema then separates attribute metadata into `t_kernelhook_basic_attr`, where attribute names such as `checksum`, `created_date`, `identifier`, and `license` are paired with their corresponding types—`xsd:string`, `xsd:date`, `cco:DesignativeICE`, and `xsd:string` respectively. This separation of attribute definitions from their runtime values enables the system to support extensible, schema-on-read semantics without sacrificing type safety.

**t_kernelhook_basic**

| id | kernelhook |
| --- | --- |
| KERN-0001 | Tracepoint-block-io |
| KERN-0002 | BPF-co-re-syscall |
| KERN-0003 | Kprobes-schedule |
| KERN-0004 | Fentry-kernel-init |
| KERN-0005 | Kprobes-schedule |
| KERN-0006 | Kretprobe-exit |

**t_kernelhook_basic_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| KERN-0001 | checksum | xsd:string |
| KERN-0002 | created_date | xsd:date |
| KERN-0003 | identifier | cco:DesignativeICE |
| KERN-0004 | license | xsd:string |
| KERN-0005 | mime_type | xsd:string |
| KERN-0006 | size_bytes | xsd:long |
| KERN-0007 | uri | xsd:string |
| KERN-0008 | version | xsd:integer |

**t_kernelhook_basic_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| KERN-0001 | KERN-0001 | KERN-0002 | 2023-02-05 |
| KERN-0002 | KERN-0002 | KERN-0002 | 2024-05-21 |
| KERN-0003 | KERN-0003 | KERN-0002 | 2024-01-08 |
| KERN-0004 | KERN-0004 | KERN-0002 | 2025-01-30 |
| KERN-0005 | KERN-0005 | KERN-0002 | 2023-03-23 |
| KERN-0006 | KERN-0006 | KERN-0002 | 2024-01-11 |

**t_kernelhook_basic_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| KERN-0001 | KERN-0001 | KERN-0006 | 323 |
| KERN-0002 | KERN-0001 | KERN-0008 | 12 |
| KERN-0003 | KERN-0002 | KERN-0006 | 186 |
| KERN-0004 | KERN-0002 | KERN-0008 | 2 |
| KERN-0005 | KERN-0003 | KERN-0006 | 276 |
| KERN-0006 | KERN-0003 | KERN-0008 | 4 |
| KERN-0007 | KERN-0004 | KERN-0006 | 346 |
| KERN-0008 | KERN-0004 | KERN-0008 | 11 |

Attribute values are materialized across three distinct value tables, each typed to its domain: `t_kernelhook_basic_val_date` stores temporal values such as `2023-02-05`, `2024-05-21`, `2024-01-08`, and `2025-01-30`; `t_kernelhook_basic_val_int` holds numeric values including `323`, `12`, `186`, and `2`; and `t_kernelhook_basic_val_varchar` captures free-form strings like `a3f9c21e`, `gid://svc/77`, `Apache-2.0`, and `eu-west-3`. Each value row references its owning entity through `entity_id` and its attribute definition through `attr_id`, forming a classic entity-attribute-value pattern where the `misc` column carries the actual value. This tripartite value storage ensures that date comparisons, integer arithmetic, and string operations each proceed against appropriately typed data without requiring runtime coercion.

**t_kernelhook_basic_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| KERN-0001 | KERN-0001 | KERN-0001 | a3f9c21e |
| KERN-0002 | KERN-0001 | KERN-0003 | gid://svc/77 |
| KERN-0003 | KERN-0001 | KERN-0004 | Apache-2.0 |
| KERN-0004 | KERN-0001 | KERN-0009 | eu-west-3 |
| KERN-0005 | KERN-0001 | KERN-0005 | text/plain |
| KERN-0006 | KERN-0001 | KERN-0010 | Name 06 |
| KERN-0007 | KERN-0001 | KERN-0011 | governance |
| KERN-0008 | KERN-0001 | KERN-0012 | Tags 08 |

Beyond attribute-value pairs, the schema employs a subject-target-role pattern to model binary relationships between entities. In the transformation domain, `t_transformation_min_one_output` defines transformation operations such as `data normalization` and `format conversion`, while `t_transformation_min_one_output_output_dataset` enumerates output datasets including `parsed access logs`, `curated events table`, and `standardized inventory index`. The junction table `t_transformation_min_one_output__output_dataset` links them: transformation `OUTP-0006` produces dataset `OUTP-0003` with the role `contributor`, while the same transformation produces dataset `OUTP-0005` with the role `reviewer`. The role column is the critical discriminator—it captures not merely that a relationship exists, but the nature of the relationship, allowing a single subject to participate in multiple distinct relationships with different targets.

**t_transformation_min_one_output**

| id | transformation |
| --- | --- |
| OUTP-0001 | data normalization |
| OUTP-0002 | data normalization |
| OUTP-0003 | format conversion |
| OUTP-0004 | format conversion |
| OUTP-0005 | record deduplication |
| OUTP-0006 | feature engineering |

**t_transformation_min_one_output_output_dataset**

| id | output_dataset |
| --- | --- |
| OUTP-0001 | parsed access logs |
| OUTP-0002 | curated events table |
| OUTP-0003 | curated events table |
| OUTP-0004 | standardized inventory index |
| OUTP-0005 | curated events table |
| OUTP-0006 | normalized feature set |

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

The same subject-target-role pattern recurs in the caching layer, where `t_lru_hash_map_subclass` defines LRU cache instances such as `primary-db-cache`, `stream-event-cache`, `global-rate-limiter`, and `prod-session-cache`, and `t_lru_hash_map_subclass_l_r_u_hash_config` enumerates hash configurations including `siphash-2-4`, `xxhash64`, `robin-hood`, and `sparse-block-map`. The linking table `t_lru_hash_map_subclass__l_r_u_hash_config` connects cache instance `MAP-0007` to hash config `MAP-0004` as a `reviewer`, while cache instance `MAP-0004` connects to hash config `MAP-0002` as a `contributor`. The roles `reviewer`, `contributor`, and `observer` recur across both domains, establishing a shared vocabulary for relationship semantics that transcends any single entity type.

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

The practical significance of this design lies in its ability to model both structural metadata (what attributes an entity possesses and what types they hold) and behavioral relationships (which entities produce, review, or observe other entities) within a single coherent framework. Identifiers provide the stable keys that bind everything together; attributes and their types define the descriptive vocabulary; entities are the resources being described; values carry the actual data; and the subject-target-role triad captures the relational topology. This separation of concerns—metadata from data, relationships from entities—enables the system to evolve its schema without schema migrations, to query across heterogeneous entity types using a uniform interface, and to audit relationships through their role assignments.