---
chapter_id: ch_live_foreign_key_relation_90fe3c
topic_id: 125
family: 07_long_tail
cited_terms: ['foreign_key_relation', 'constraint_basic', 'ebpfprogram_loaded_in_kernel']
model: engine-refine
---

The governance of system components relies on a layered constraint model where rules are defined, labeled, and enforced across operational contexts. Each constraint carries a unique identifier—such as CONS-0001 through CONS-0004—and specifies a policy like ENCRYPTION_AES256, UNIQUE_EMAIL, PACKET_SIZE_MAX_1500, or MAX_LENGTH_255. These policies are classified by their enforcement posture, with most operating in blocking mode to prevent non-compliant actions, while PACKET_SIZE_MAX_1500 is designated as mandatory. Every constraint is also tagged with a label_text that situates it within a business process: nightly summary, intake form, or pre-release note, making it possible to trace which operational workflow a rule governs and to audit compliance at the point of execution.

**t_constraint_basic**

| id | constraint | enforcement | label_text |
| --- | --- | --- | --- |
| CONS-0001 | ENCRYPTION_AES256 | blocking | nightly summary |
| CONS-0002 | UNIQUE_EMAIL | blocking | intake form |
| CONS-0003 | PACKET_SIZE_MAX_1500 | mandatory | intake form |
| CONS-0004 | MAX_LENGTH_255 | blocking | pre-release note |
| CONS-0005 | MAX_LENGTH_255 | advisory | calibration record |
| CONS-0006 | CHECK_AGE_POSITIVE | advisory | change rationale |
| CONS-0007 | NOT_NULL | mandatory | change rationale |

Foreign key relationships are tracked through a tripartite structure that captures not only which entities reference one another but also the nature of those dependencies. The t_foreign_key_relation table assigns identifiers like RELA-0001 through RELA-0004 to named relations such as batch_workflows, config_snapshots, metric_snapshots, and schema_versions. A companion table, t_foreign_key_relation_foreign_key_to, maps each relation to its target—system_clocks, schema_definitions, data_lake_catalog, or core_products—establishing the direction of the dependency. The bridge table t_foreign_key_relation__foreign_key_to then resolves the actual referential links, pairing a subject (the referencing entity, identified by foreign_id) with a target (the referenced entity, identified by foreign_key_to_id) and assigning a role that describes the relationship: owner or contributor. This role distinction is critical for understanding ownership semantics, as owner relationships imply direct control while contributor relationships indicate shared or derived dependencies.

**t_foreign_key_relation**

| id | foreign |
| --- | --- |
| RELA-0001 | batch_workflows |
| RELA-0002 | config_snapshots |
| RELA-0003 | metric_snapshots |
| RELA-0004 | schema_versions |
| RELA-0005 | query_executions |
| RELA-0006 | batch_workflows |
| RELA-0007 | data_ingestion_jobs |
| RELA-0008 | metric_snapshots |

**t_foreign_key_relation_foreign_key_to**

| id | foreign_key_to |
| --- | --- |
| RELA-0001 | system_clocks |
| RELA-0002 | schema_definitions |
| RELA-0003 | data_lake_catalog |
| RELA-0004 | core_products |
| RELA-0005 | identity_provider |
| RELA-0006 | data_lake_catalog |

**t_foreign_key_relation__foreign_key_to**

| id | foreign_id | foreign_key_to_id | role |
| --- | --- | --- | --- |
| RELA-0001 | RELA-0003 | RELA-0005 | owner |
| RELA-0002 | RELA-0003 | RELA-0006 | owner |
| RELA-0003 | RELA-0007 | RELA-0006 | contributor |
| RELA-0004 | RELA-0006 | RELA-0002 | contributor |
| RELA-0005 | RELA-0008 | RELA-0004 | owner |
| RELA-0006 | RELA-0007 | RELA-0003 | owner |
| RELA-0007 | RELA-0004 | RELA-0002 | owner |
| RELA-0008 | RELA-0005 | RELA-0001 | owner |

System-level artifacts, specifically eBPF programs, are cataloged in a fact table that records their runtime characteristics and version history. Each program is identified by a kernel-level key such as KERN-0001 through KERN-0004 and carries a size_bytes metric that reflects its compiled footprint—values range from approximately 113 MB for KERN-0003 to over 784 MB for KERN-0001. The version column tracks the program's revision number, with observed values of 9, 11, and 12, enabling operators to audit which program versions are deployed and to correlate version changes with behavioral or performance shifts. The loaded_in_key column indicates the module or subsystem into which each program was loaded, creating a direct link to the dimension table that classifies these load targets.

**fact_ebpfprogram**

| id | loaded_in_key | size_bytes | version |
| --- | --- | --- | --- |
| KERN-0001 | KERN-0003 | 784335640 | 12 |
| KERN-0002 | KERN-0002 | 641704069 | 9 |
| KERN-0003 | KERN-0006 | 113209263 | 11 |
| KERN-0004 | KERN-0004 | 161013093 | 12 |
| KERN-0005 | KERN-0004 | 352203820 | 12 |
| KERN-0006 | KERN-0001 | 167519051 | 1 |

The dimension table for loaded_in provides categorical context for where eBPF programs are deployed. Each load target—identified by keys like KERN-0001 through KERN-0004—has an associated loaded_in_label (e.g., Loaded In Label 01 through Loaded In Label 04) and a loaded_in_category (e.g., Loaded In Category 01 through Loaded In Category 04). These labels and categories serve as organizational metadata, allowing operators to group programs by their deployment domain and to apply governance rules at the category level rather than at the individual program level. This abstraction is particularly useful when constraints or foreign key policies need to be applied broadly across all programs loaded into a given subsystem.

**dim_loaded_in**

| id | loaded_in_label | loaded_in_category |
| --- | --- | --- |
| KERN-0001 | Loaded In Label 01 | Loaded In Category 01 |
| KERN-0002 | Loaded In Label 02 | Loaded In Category 02 |
| KERN-0003 | Loaded In Label 03 | Loaded In Category 03 |
| KERN-0004 | Loaded In Label 04 | Loaded In Category 04 |
| KERN-0005 | Loaded In Label 05 | Loaded In Category 05 |
| KERN-0006 | Loaded In Label 06 | Loaded In Category 06 |

Together, these tables form a cohesive governance framework that connects policy definitions to their enforcement mechanisms, maps dependency relationships with role semantics, and classifies runtime artifacts by their deployment context. The constraint table establishes what rules exist and how strictly they are applied; the foreign key tables document how system components depend on one another and who owns those dependencies; and the eBPF program tables record what is actually running, where it is loaded, and how large and versioned each artifact is. By cross-referencing these tables through their shared identifiers, operators can answer questions about compliance coverage, dependency impact, and artifact lifecycle—all from a single, consistent data model.