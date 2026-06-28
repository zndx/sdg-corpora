---
chapter_id: ch_live_schemaorg_label_alignment_9e51bc
topic_id: 45
family: 07_long_tail
cited_terms: ['schemaorg_label_alignment', 'cgroup_skb_subclass', 'ebpfmap_used_by_program']
model: engine-refine
---

The alignment of semantic labels to canonical schema.org vocabularies requires both a mapping layer and a typed attribute store to capture the provenance and quality of each alignment decision. A label alignment record—identified by a code such as ALIG-0001—associates a source schema.org property like sku_code or data_asset_name with its target label, which may be an identical term, a domain-specific synonym such as course_title, or a broader schema.org class like Product. Each alignment carries a set of metadata attributes whose names and data types are declared in a companion registry: confidence is stored as xsd:decimal, while dimension_kind, method, and recorded_at are xsd:string and xsd:dateTime respectively. The actual attribute values are materialized in type-specific value tables, a design that preserves schema integrity while allowing heterogeneous data to coexist under a single entity. A decimal attribute might hold a confidence score of 0.916 or a magnitude of 747.18, a string attribute might encode a dimension kind as Dimension Kind 01 or a language tag as fr, and a datetime attribute might record the alignment timestamp as 2024-11-29T12:22:57. The entity_id column in each value table binds these measurements back to the alignment record they qualify, ensuring that every numeric, textual, or temporal datum can be traced to its semantic context.

**t_schemaorg_label_alignment**

| id | schemaorg | aligned_to_schema_org_label |
| --- | --- | --- |
| ALIG-0001 | sku_code | sku_code |
| ALIG-0002 | org_id | sku_code |
| ALIG-0003 | data_asset_name | course_title |
| ALIG-0004 | data_asset_name | Product |
| ALIG-0005 | sku_code | sku_code |
| ALIG-0006 | work_title | Dataset |
| ALIG-0007 | subject_person | Dataset |
| ALIG-0008 | course_title | subject_person |

**t_schemaorg_label_alignment_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ALIG-0001 | confidence | xsd:decimal |
| ALIG-0002 | dimension_kind | xsd:string |
| ALIG-0003 | method | xsd:string |
| ALIG-0004 | recorded_at | xsd:dateTime |
| ALIG-0005 | uncertainty | xsd:decimal |
| ALIG-0006 | unit | xsd:string |
| ALIG-0007 | value | xsd:decimal |
| ALIG-0008 | encoding | xsd:string |

**t_schemaorg_label_alignment_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ALIG-0001 | ALIG-0001 | ALIG-0004 | 2024-11-29T12:22:57 |
| ALIG-0002 | ALIG-0002 | ALIG-0004 | 2024-10-21T02:32:32 |
| ALIG-0003 | ALIG-0003 | ALIG-0004 | 2024-04-16T22:29:51 |
| ALIG-0004 | ALIG-0004 | ALIG-0004 | 2024-04-08T02:25:07 |
| ALIG-0005 | ALIG-0005 | ALIG-0004 | 2024-04-01T00:20:16 |
| ALIG-0006 | ALIG-0006 | ALIG-0004 | 2024-06-23T20:04:43 |
| ALIG-0007 | ALIG-0007 | ALIG-0004 | 2025-03-29T09:58:30 |
| ALIG-0008 | ALIG-0008 | ALIG-0004 | 2024-10-23T02:04:00 |

**t_schemaorg_label_alignment_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ALIG-0001 | ALIG-0001 | ALIG-0001 | 0.916 |
| ALIG-0002 | ALIG-0001 | ALIG-0005 | 747.18 |
| ALIG-0003 | ALIG-0001 | ALIG-0007 | 963.37 |
| ALIG-0004 | ALIG-0002 | ALIG-0001 | 0.264 |
| ALIG-0005 | ALIG-0002 | ALIG-0005 | 721.79 |
| ALIG-0006 | ALIG-0002 | ALIG-0007 | 736.70 |
| ALIG-0007 | ALIG-0003 | ALIG-0001 | 0.758 |
| ALIG-0008 | ALIG-0003 | ALIG-0005 | 440.87 |

**t_schemaorg_label_alignment_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ALIG-0001 | ALIG-0001 | ALIG-0002 | Dimension Kind 01 |
| ALIG-0002 | ALIG-0001 | ALIG-0008 | Encoding 02 |
| ALIG-0003 | ALIG-0001 | ALIG-0009 | nightly summary |
| ALIG-0004 | ALIG-0001 | ALIG-0010 | fr |
| ALIG-0005 | ALIG-0001 | ALIG-0003 | automated |
| ALIG-0006 | ALIG-0001 | ALIG-0006 | count |
| ALIG-0007 | ALIG-0002 | ALIG-0002 | Dimension Kind 07 |
| ALIG-0008 | ALIG-0002 | ALIG-0008 | Encoding 08 |

Beyond label alignment, the system models resource isolation and traffic classification through cgroup subclass hierarchies that describe how network packets are associated with control groups. A cgroup subclass record identifies a classification rule and references a cgroup path—user.slice/user-1001.scope for a user session, system.slice/postgresql.service for a database daemon, or kubepods/pod1234567890ab for a Kubernetes pod. The relationship between a subclass and the cgroup it attaches to is captured in a separate association table, where the target cgroup might be system.slice/nginx.service or docker/7d8e9f0a1b2c, reflecting the dynamic nature of containerized workloads. This association is further qualified by a role column that specifies the nature of the attachment: observer, contributor, owner, or reviewer. The role determines what permissions or visibility the subclass has within the target cgroup, and the subject-target pairing—where the subject is the cgroup being acted upon and the target is the cgroup receiving the attachment—creates a directed graph of resource relationships that can be queried for policy enforcement or audit purposes.

**t_cgroup_skb_subclass**

| id | cgroup |
| --- | --- |
| SKB-0001 | user.slice/user-1001.scope |
| SKB-0002 | user.slice/user-1000.scope |
| SKB-0003 | system.slice/postgresql.service |
| SKB-0004 | kubepods/pod1234567890ab |
| SKB-0005 | docker/4a2b3c1d5e6f |
| SKB-0006 | system.slice/nginx.service |

**t_cgroup_skb_subclass_attaches_to_cgroup**

| id | attaches_to_cgroup |
| --- | --- |
| SKB-0001 | system.slice/nginx.service |
| SKB-0002 | user.slice/user-1001.scope |
| SKB-0003 | user.slice/user-1001.scope |
| SKB-0004 | docker/7d8e9f0a1b2c |
| SKB-0005 | system.slice/docker.service |
| SKB-0006 | kubepods/burstable/pod8f9a0b1c |

**t_cgroup_skb_subclass__attaches_to_cgroup**

| id | cgroup_id | attaches_to_cgroup_id | role |
| --- | --- | --- | --- |
| SKB-0001 | SKB-0005 | SKB-0001 | observer |
| SKB-0002 | SKB-0006 | SKB-0002 | contributor |
| SKB-0003 | SKB-0001 | SKB-0005 | owner |
| SKB-0004 | SKB-0006 | SKB-0005 | reviewer |
| SKB-0005 | SKB-0002 | SKB-0004 | owner |
| SKB-0006 | SKB-0003 | SKB-0005 | owner |
| SKB-0007 | SKB-0001 | SKB-0001 | reviewer |
| SKB-0008 | SKB-0003 | SKB-0003 | observer |

Program-level resource consumption is tracked through a fact table that records the size and version of eBPF maps used by various programs. Each fact row carries an identifier, a foreign key pointing to a program dimension, the map size in bytes, and the map version. Sizes range from approximately 31 megabytes to 354 megabytes, reflecting the wide variance in eBPF map usage across different workloads. The program dimension itself provides human-readable labels and categorical groupings—Used By Program Label 01 through 04, each assigned to a corresponding category—enabling aggregation and filtering by program type or function. The version column, taking integer values from 3 to 12, supports lifecycle management and rollback decisions when map schemas evolve. Together, the fact and dimension tables form a star schema that supports analytical queries on resource utilization patterns, version distribution, and program categorization.

**fact_ebpfmap**

| id | used_by_program_key | size_bytes | version |
| --- | --- | --- | --- |
| PROG-0001 | PROG-0005 | 208979093 | 3 |
| PROG-0002 | PROG-0004 | 156714508 | 6 |
| PROG-0003 | PROG-0005 | 31105012 | 12 |
| PROG-0004 | PROG-0002 | 354373995 | 5 |
| PROG-0005 | PROG-0004 | 866267293 | 2 |

**dim_used_by_program**

| id | used_by_program_label | used_by_program_category |
| --- | --- | --- |
| PROG-0001 | Used By Program Label 01 | Used By Program Category 01 |
| PROG-0002 | Used By Program Label 02 | Used By Program Category 02 |
| PROG-0003 | Used By Program Label 03 | Used By Program Category 03 |
| PROG-0004 | Used By Program Label 04 | Used By Program Category 04 |
| PROG-0005 | Used By Program Label 05 | Used By Program Category 05 |
| PROG-0006 | Used By Program Label 06 | Used By Program Category 06 |