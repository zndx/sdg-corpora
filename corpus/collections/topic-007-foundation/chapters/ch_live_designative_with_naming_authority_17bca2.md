---
chapter_id: ch_live_designative_with_naming_authority_17bca2
topic_id: 7
family: 01_foundation
cited_terms: ['designative_with_naming_authority', 'subclass_not_basic', 'kernelhook_only_kprobe']
model: engine-refine
---

In systems that govern the allocation and integrity of designative identifiers, a naming authority registry establishes the provenance and verification mechanisms for each assigned designation. The registry assigns a unique identifier—AUTH-0001 through AUTH-0004—to each entry, pairing it with a designative such as OGC-API-Feat, DCAT-AP-3.0, HAN-0092, or RFC-7578. The authority responsible for the assignment is recorded in the assigned_by column, with IANA appearing as the assigning body for OGC-API-Feat, HAN-0092, and RFC-7578, while Crossref is recorded for DCAT-AP-3.0. Each designation is further classified under a code—C-07, E-21, or D-33—and secured through a checksum algorithm specified in the checksum_algo column: md5 for OGC-API-Feat and DCAT-AP-3.0, blake2b for HAN-0092, and sha1 for RFC-7578. This structure ensures that every designative can be traced to its source, categorized by its administrative class, and verified through a documented cryptographic method.

**t_designative_with_naming_authority**

| id | designative | assigned_by | checksum_algo | code |
| --- | --- | --- | --- | --- |
| AUTH-0001 | OGC-API-Feat | IANA | md5 | C-07 |
| AUTH-0002 | DCAT-AP-3.0 | Crossref | md5 | E-21 |
| AUTH-0003 | HAN-0092 | IANA | blake2b | C-07 |
| AUTH-0004 | RFC-7578 | IANA | sha1 | D-33 |

The checksum algorithm selection is not arbitrary; it reflects the security posture and operational requirements of each naming domain. The prevalence of md5 among entries assigned by IANA—used for both OGC-API-Feat and DCAT-AP-3.0—suggests a baseline integrity mechanism sufficient for widely distributed, publicly referenced designations. HAN-0092, also assigned by IANA but classified under code C-07, deploys blake2b, indicating a higher assurance tier where collision resistance is prioritized. RFC-7578, carrying code D-33, relies on sha1, a legacy algorithm that may persist due to backward compatibility constraints within its governing specification. The code column itself—C-07, E-21, D-33—serves as a secondary classification key, potentially mapping to regulatory categories, publication series, or administrative workflows external to the registry.

Parallel to the identifier governance domain, a kernel hook classification system manages the registration and role-based assignment of kernel-level instrumentation points. The kernel hook registry enumerates individual hooks—net_rx_action, kfree, vfs_read, and ext4_file_open—each identified by a unique key such as KPRO-0001 through KPRO-0004. These hooks represent entry points into kernel execution paths: net_rx_action intercepts network packet reception, kfree manages memory deallocation, vfs_read captures virtual file system read operations, and ext4_file_open monitors file access on the ext4 filesystem. The hook_kind column further categorizes each hook by its instrumentation type, distinguishing between kprobe_perf for performance-oriented probes, entry_kprobe for function-entry tracing, and kprobe_trace for general-purpose trace hooks.

**t_kernelhook_only_kprobe**

| id | kernelhook |
| --- | --- |
| KPRO-0001 | net_rx_action |
| KPRO-0002 | kfree |
| KPRO-0003 | vfs_read |
| KPRO-0004 | ext4_file_open |
| KPRO-0005 | kmalloc |
| KPRO-0006 | ip_rcv |

**t_kernelhook_only_kprobe_hook_kind**

| id | hook_kind |
| --- | --- |
| KPRO-0001 | kprobe_perf |
| KPRO-0002 | entry_kprobe |
| KPRO-0003 | kprobe_trace |
| KPRO-0004 | kprobe_trace |
| KPRO-0005 | bpf_kprobe |
| KPRO-0006 | multi_kprobe |
| KPRO-0007 | kprobe_fs |

**t_kernelhook_only_kprobe__hook_kind**

| id | kernelhook_id | hook_kind_id | role |
| --- | --- | --- | --- |
| KPRO-0001 | KPRO-0002 | KPRO-0005 | owner |
| KPRO-0002 | KPRO-0005 | KPRO-0005 | contributor |
| KPRO-0003 | KPRO-0004 | KPRO-0002 | reviewer |
| KPRO-0004 | KPRO-0006 | KPRO-0006 | contributor |
| KPRO-0005 | KPRO-0003 | KPRO-0006 | owner |
| KPRO-0006 | KPRO-0002 | KPRO-0004 | observer |
| KPRO-0007 | KPRO-0006 | KPRO-0003 | reviewer |
| KPRO-0008 | KPRO-0001 | KPRO-0006 | contributor |

The relationship between kernel hooks and hook kinds is mediated through a junction table that encodes the role each entity plays in the association. This role column—owner, contributor, or reviewer—defines the governance relationship between a kernel hook and a hook kind, establishing accountability for the instrumentation point. For instance, the hook identified as KPRO-0002 assumes the role of owner when associated with hook kind KPRO-0005, while KPRO-0004 acts as a contributor to hook kind KPRO-0002. The role of reviewer appears in the association between KPRO-0003 and hook kind KPRO-0004, indicating a supervisory or audit function over that particular hook-kind pairing. This tripartite role structure—owner, contributor, reviewer—mirrors standard governance models where creation, participation, and oversight are separated to prevent unilateral modification of instrumentation points.

A supplementary classification table, t_subclass_not_basic, provides an additional layer of categorization that does not map directly to the primary identifier or hook registries. Its entries—NOT-0001 through NOT-0004—pair a primary classification label (Not 01 through Not 04) with a secondary descriptor (Not 2 01 through Not 2 04), forming a two-tier taxonomy that can be applied across domains. While its direct foreign-key relationships to the designative or kernel hook tables are not explicit in the schema, its existence suggests a cross-cutting classification mechanism that may be used to tag entries in either registry with supplementary attributes, such as compliance status, operational criticality, or deprecation state. The uniform naming pattern across its columns indicates a generic classification scaffold rather than a domain-specific taxonomy.

**t_subclass_not_basic**

| id | not | not_2 |
| --- | --- | --- |
| NOT-0001 | Not 01 | Not 2 01 |
| NOT-0002 | Not 02 | Not 2 02 |
| NOT-0003 | Not 03 | Not 2 03 |
| NOT-0004 | Not 04 | Not 2 04 |
| NOT-0005 | Not 05 | Not 2 05 |
| NOT-0006 | Not 06 | Not 2 06 |