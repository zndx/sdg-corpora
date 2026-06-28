---
chapter_id: ch_live_directory_query_service_ecb31c
topic_id: 4
family: 08_derived
cited_terms: ['directory_query_service', 'ebpfprogram_verified_safe', 'requirement_only_satisfied_by']
model: engine-refine
---

**Identifier**

Every entity within the compliance framework is assigned a unique identifier—a string token that serves as the sole point of resolution across all tables and relationships. Identifiers follow a structured prefix convention: SERV- for service-related records, SAFE- for eBPF program verification records, and SATI for requirement satisfaction records. The identifier is the primary key of every dimension and fact table, and it is the mechanism by which cross-table joins are performed without ambiguity. For example, the service record identified as SERV-0001 is distinct from SAFE-0001, even though both share a numeric suffix; the prefix disambiguates the entity class. Identifiers are never reused, never null, and never derived from business content—they are system-assigned, immutable handles.

**t_ebpfprogram_verified_safe**

| id | ebpfprogram |
| --- | --- |
| SAFE-0001 | lsm_file_open |
| SAFE-0002 | sock_ops_connect |
| SAFE-0003 | perf_event_trace |
| SAFE-0004 | tc_police_ingress |
| SAFE-0005 | xdp_router |
| SAFE-0006 | cgroup_skb_ingress |

**t_ebpfprogram_verified_safe_verified_safe_by**

| id | verified_safe_by |
| --- | --- |
| SAFE-0001 | libbpf |
| SAFE-0002 | Kani_bpf |
| SAFE-0003 | Z3_solver |
| SAFE-0004 | Kani_bpf |
| SAFE-0005 | veristat |
| SAFE-0006 | FramaC_bpf |

**Category and Misc**

Dimension tables attach two layers of metadata to each identifier: a category and a misc label. The category column provides a coarse-grained classification that groups entities into logical families. In the targets_user dimension, categories such as Targets User Category 01 and Targets User Category 02 partition service consumers by operational domain. In the generates_response dimension, categories like Generates Response Category 01 through Generates Response Category 04 classify the type of response a service emits. The misc column—formally named targets_user_label or generates_response_label—carries a human-readable descriptor that supplements the category with operational context. Examples include Targets User Label 01, which maps to the identifier SERV-0001, and Generates Response Label 02, which corresponds to SERV-0002. The category and misc fields are independent: two records may share a category but differ in misc, or share a misc label while belonging to different categories.

**dim_targets_user**

| id | targets_user_label | targets_user_category |
| --- | --- | --- |
| SERV-0001 | Targets User Label 01 | Targets User Category 01 |
| SERV-0002 | Targets User Label 02 | Targets User Category 02 |
| SERV-0003 | Targets User Label 03 | Targets User Category 03 |
| SERV-0004 | Targets User Label 04 | Targets User Category 04 |
| SERV-0005 | Targets User Label 05 | Targets User Category 05 |
| SERV-0006 | Targets User Label 06 | Targets User Category 06 |

**dim_generates_response**

| id | generates_response_label | generates_response_category |
| --- | --- | --- |
| SERV-0001 | Generates Response Label 01 | Generates Response Category 01 |
| SERV-0002 | Generates Response Label 02 | Generates Response Category 02 |
| SERV-0003 | Generates Response Label 03 | Generates Response Category 03 |
| SERV-0004 | Generates Response Label 04 | Generates Response Category 04 |
| SERV-0005 | Generates Response Label 05 | Generates Response Category 05 |
| SERV-0006 | Generates Response Label 06 | Generates Response Category 06 |
| SERV-0007 | Generates Response Label 07 | Generates Response Category 07 |
| SERV-0008 | Generates Response Label 08 | Generates Response Category 08 |

**Event Count**

The fact table fact_directory quantifies service activity through the event_count column, which records the number of discrete events associated with a given service record. Event counts are integer values that vary widely in magnitude: SERV-0001 has an event count of 315, SERV-0002 has 259, SERV-0003 has 81, and SERV-0004 has 397. These values are not derived from other tables; they are ingested or aggregated from upstream telemetry sources and stored as the authoritative measure for the fact. Event count is the only numeric column in fact_directory and serves as the primary grain-defining attribute—each row in the fact table represents one service record and its associated event volume.

**Generates Response and Targets User**

The fact_directory table links each service record to two dimension tables through foreign keys: targets_user_key and generates_response_key. The targets_user_key column references the identifier in dim_targets_user, establishing which user or consumer group a service is directed toward. For instance, SERV-0001 has a targets_user_key of SERV-0006, SERV-0002 has SERV-0002, and both SERV-0003 and SERV-0004 reference SERV-0001 and SERV-0002 respectively. The generates_response_key column references the identifier in dim_generates_response, establishing which response type a service produces. SERV-0001 generates a response keyed as SERV-0007, SERV-0002 generates SERV-0002, SERV-0003 generates SERV-0006, and SERV-0004 generates SERV-0005. These two foreign keys form the analytical axes of the fact table: any query on service activity can be filtered or grouped by the category and misc attributes of the associated targets_user or generates_response dimension records.

**fact_directory**

| id | targets_user_key | generates_response_key | event_count |
| --- | --- | --- | --- |
| SERV-0001 | SERV-0006 | SERV-0007 | 315 |
| SERV-0002 | SERV-0002 | SERV-0002 | 259 |
| SERV-0003 | SERV-0001 | SERV-0006 | 81 |
| SERV-0004 | SERV-0002 | SERV-0005 | 397 |

**Subject, Target, and Role**

Junction tables encode many-to-many relationships between entities using three columns: subject, target, and role. The subject column holds the identifier of the initiating entity; the target column holds the identifier of the receiving entity; and the role column specifies the nature of the relationship from the subject's perspective. In the eBPF program verification junction table, SAFE-0004 appears as the subject in two rows, linked to targets SAFE-0002 and SAFE-0004 with roles contributor and owner respectively. In the requirement satisfaction junction table, SATI-0003 appears as the subject in two rows, linked to targets SATI-0002 and SATI-0003 with the role reviewer in both cases. The role values are drawn from a controlled vocabulary: contributor, reviewer, owner, and observer. A single subject-target pair may appear at most once; duplicate relationships are not permitted. The role column is the only attribute that varies across rows sharing the same subject and target, ensuring that the relationship semantics are fully captured.

**t_ebpfprogram_verified_safe__verified_safe_by**

| id | ebpfprogram_id | verified_safe_by_id | role |
| --- | --- | --- | --- |
| SAFE-0001 | SAFE-0004 | SAFE-0002 | contributor |
| SAFE-0002 | SAFE-0004 | SAFE-0004 | reviewer |
| SAFE-0003 | SAFE-0003 | SAFE-0005 | owner |
| SAFE-0004 | SAFE-0002 | SAFE-0003 | owner |
| SAFE-0005 | SAFE-0001 | SAFE-0003 | contributor |
| SAFE-0006 | SAFE-0003 | SAFE-0006 | contributor |
| SAFE-0007 | SAFE-0001 | SAFE-0005 | owner |
| SAFE-0008 | SAFE-0001 | SAFE-0002 | owner |

**t_requirement_only_satisfied_by**

| id | requirement |
| --- | --- |
| SATI-0001 | OWASP authentication flow |
| SATI-0002 | IEEE 802.1Q tagging |
| SATI-0003 | IEEE 802.1Q tagging |
| SATI-0004 | TLS 1.3 cipher suite |
| SATI-0005 | NIST 800-53 audit logging |
| SATI-0006 | GDPR data residency |

**t_requirement_only_satisfied_by_satisfied_by**

| id | satisfied_by |
| --- | --- |
| SATI-0001 | Let's Encrypt |
| SATI-0002 | OpenSSL 3.0 |
| SATI-0003 | FIPS 140-3 module |
| SATI-0004 | Zstd library |
| SATI-0005 | AWS KMS |
| SATI-0006 | AWS KMS |
| SATI-0007 | Zstd library |

**t_requirement_only_satisfied_by__satisfied_by**

| id | requirement_id | satisfied_by_id | role |
| --- | --- | --- | --- |
| SATI-0001 | SATI-0001 | SATI-0004 | reviewer |
| SATI-0002 | SATI-0003 | SATI-0005 | observer |
| SATI-0003 | SATI-0002 | SATI-0002 | reviewer |
| SATI-0004 | SATI-0003 | SATI-0003 | reviewer |
| SATI-0005 | SATI-0006 | SATI-0002 | observer |
| SATI-0006 | SATI-0001 | SATI-0003 | contributor |
| SATI-0007 | SATI-0003 | SATI-0004 | observer |
| SATI-0008 | SATI-0005 | SATI-0001 | owner |