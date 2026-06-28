---
chapter_id: ch_live_requirement_only_satisfied_by_78c466
topic_id: 25
family: 03_directive_governance
cited_terms: ['requirement_only_satisfied_by', 'xdp_action_redirect', 'lru_hash_map_subclass']
model: engine-refine
---

The governance of distributed data pipelines rests upon a taxonomy of categorical labels that partition operational actions into coherent domains. Within the X D P action framework, each execution is classified under a category—X D P Action Category 01 through X D P Action Category 04—providing the structural scaffolding by which audit trails, compliance checks, and resource allocation policies are applied. These categories are not merely descriptive; they determine downstream enforcement rules, including which reviewers must approve a given action and which size thresholds trigger escalation. An action labeled X D P Action Label 01, for instance, belongs to Category 01 and carries with it a distinct set of procedural obligations that differ from those attached to X D P Action Label 03 under Category 03. The categorical distinction is therefore the primary axis along which accountability is assigned and risk is assessed.

Every entity within the pipeline is anchored by a unique identifier, a string such as SATI-0001, REDI-0001, or MAP-0001 that serves as the immutable reference point across all relational joins and audit logs. Identifiers are not arbitrary; they encode provenance and domain. The SATI prefix denotes satisfaction requirements—claims that a particular security control, such as TLS 1.3 cipher suite or IEEE 802.1Q tagging, is met by a specific implementation artifact like FIPS 140-3 module or OpenSSL 3.0. The REDI prefix identifies X D P action records, while MAP designates cache subsystem configurations. This naming discipline ensures that a requirement reference in one table can be unambiguously resolved to its satisfaction evidence in another, and that the join keys governing these relationships remain consistent across the entire data model.

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

The concept of subject and target captures the directional nature of dependency relationships. In the satisfaction matrix, a requirement such as OWASP authentication flow (SATI-0001) is linked to a satisfaction artifact—Let's Encrypt—through a subject-to-target mapping where SATI-0001 serves as the subject and SATI-0004 as the target. Similarly, in the cache subsystem, the LRU hashmap subclass prod-session-cache (MAP-0004) is mapped to the hash configuration xxhash64 (MAP-0002), with MAP-0004 as subject and MAP-0002 as target. These subject-target pairs are not symmetric; the directionality encodes which entity depends upon which, and the relationship is further qualified by a role that specifies the nature of the linkage.

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

Role is the attribute that assigns human or procedural significance to a relationship. A subject-target pair may carry the role reviewer, indicating that the target entity must be examined and approved by the subject entity before the relationship is considered valid. The role observer denotes a passive monitoring relationship, where the subject entity tracks the target without authority to modify it. In the satisfaction records, SATI-0001 appears as a reviewer against SATI-0004, while SATI-0003 assumes the observer role against SATI-0003 in a self-referential configuration. In the cache subsystem, MAP-0001 and MAP-0004 both carry the reviewer role, whereas MAP-0003 carries the observer role. These role assignments are critical for audit completeness: every relationship must have at least one reviewer, and the distribution of observer roles ensures that monitoring coverage is not conflated with approval authority.

Size bytes and version provide the quantitative dimensions of X D P action records. Each action carries a size measurement—263642012 bytes for REDI-0001, 113807155 for REDI-0002, 185269640 for REDI-0003, and 206478920 for REDI-0004—that determines storage allocation, transfer scheduling, and compliance with data residency policies. The version field, ranging from 4 to 9 across the observed records, tracks the iteration of the action definition and is essential for rollback procedures and reproducibility guarantees. Together, size and version form the operational metadata that distinguishes a live, auditable action from a historical artifact.

**fact_xdp**

| id | x_d_p_action_key | size_bytes | version |
| --- | --- | --- | --- |
| REDI-0001 | REDI-0005 | 263642012 | 9 |
| REDI-0002 | REDI-0005 | 113807155 | 4 |
| REDI-0003 | REDI-0003 | 185269640 | 5 |
| REDI-0004 | REDI-0006 | 206478920 | 6 |

The misc column, exemplified by the x_d_p_action_label field, provides human-readable annotations that complement the machine-oriented category and identifier fields. Labels such as X D P Action Label 01 through X D P Action Label 04 are designed for display in dashboards, incident reports, and executive summaries, where the raw category codes would be insufficient for stakeholder comprehension. This separation of machine-readable classification from human-readable annotation is a deliberate design choice that supports both automated enforcement and manual review workflows.

**dim_x_d_p_action**

| id | x_d_p_action_label | x_d_p_action_category |
| --- | --- | --- |
| REDI-0001 | X D P Action Label 01 | X D P Action Category 01 |
| REDI-0002 | X D P Action Label 02 | X D P Action Category 02 |
| REDI-0003 | X D P Action Label 03 | X D P Action Category 03 |
| REDI-0004 | X D P Action Label 04 | X D P Action Category 04 |
| REDI-0005 | X D P Action Label 05 | X D P Action Category 05 |
| REDI-0006 | X D P Action Label 06 | X D P Action Category 06 |
| REDI-0007 | X D P Action Label 07 | X D P Action Category 07 |