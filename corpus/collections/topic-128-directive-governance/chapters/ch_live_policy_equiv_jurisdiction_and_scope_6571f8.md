---
chapter_id: ch_live_policy_equiv_jurisdiction_and_scope_6571f8
topic_id: 128
family: 03_directive_governance
cited_terms: ['policy_equiv_jurisdiction_and_scope', 'ebpfmap_exactly_one_type', 'institutional_vision_statement']
model: engine-refine
---

Policy equivalence frameworks establish jurisdictional boundaries and governing scopes through a tripartite linkage of policy definitions, regulatory authorities, and compliance domains. A policy such as AI Model Training or Personal Data Processing is not merely declared but situated within a jurisdictional context—FDA 21 CFR 11 for the United States Food and Drug Administration, the UK Information Commissioner for British data governance, Industrial Control Systems for operational technology, or CCPA for California consumer privacy. These policies are further bound to governing scopes including Basel III, CCPA, the Massachusetts Privacy Board, and NIST 800-53, forming a matrix of regulatory obligations. The relationships between policies and jurisdictions are mediated through a junction table that assigns a role—contributor, observer, or owner—to each pairing, thereby encoding not only which jurisdiction applies but the nature of the policy's engagement with it. Similarly, the linkage between policies and governing scopes carries both a role and a cardinality note, such as Cardinality Note 01 through Cardinality Note 04, which constrains the multiplicity of the association and ensures that a single policy does not exceed its authorized scope of influence.

**t_policy_equiv_jurisdiction_and_scope**

| id | policy |
| --- | --- |
| SCOP-0001 | AI Model Training |
| SCOP-0002 | Personal Data Processing |
| SCOP-0003 | Supply Chain Logistics |
| SCOP-0004 | Third Party Vendors |
| SCOP-0005 | Cross Border Transfers |
| SCOP-0006 | European Commission |

**t_policy_equiv_jurisdiction_and_scope_jurisdiction**

| id | jurisdiction |
| --- | --- |
| SCOP-0001 | FDA 21 CFR 11 |
| SCOP-0002 | UK Information Commissioner |
| SCOP-0003 | Industrial Control Systems |
| SCOP-0004 | CCPA |
| SCOP-0005 | UK Information Commissioner |
| SCOP-0006 | National Institute of Standards |

**t_policy_equiv_jurisdiction_and_scope__jurisdiction**

| id | policy_id | jurisdiction_id | role |
| --- | --- | --- | --- |
| SCOP-0001 | SCOP-0001 | SCOP-0002 | contributor |
| SCOP-0002 | SCOP-0001 | SCOP-0001 | observer |
| SCOP-0003 | SCOP-0001 | SCOP-0002 | observer |
| SCOP-0004 | SCOP-0002 | SCOP-0006 | owner |
| SCOP-0005 | SCOP-0003 | SCOP-0005 | contributor |
| SCOP-0006 | SCOP-0004 | SCOP-0002 | owner |
| SCOP-0007 | SCOP-0006 | SCOP-0001 | reviewer |
| SCOP-0008 | SCOP-0001 | SCOP-0006 | reviewer |

**t_policy_equiv_jurisdiction_and_scope_governs_scope**

| id | governs_scope |
| --- | --- |
| SCOP-0001 | Basel III |
| SCOP-0002 | CCPA |
| SCOP-0003 | Massachusetts Privacy Board |
| SCOP-0004 | NIST 800-53 |
| SCOP-0005 | EU AI Act |
| SCOP-0006 | EU AI Act |
| SCOP-0007 | Securities Exchange Commission |

**t_policy_equiv_jurisdiction_and_scope__governs_scope**

| id | policy_id | governs_scope_id | role | cardinality_note |
| --- | --- | --- | --- | --- |
| SCOP-0001 | SCOP-0003 | SCOP-0003 | contributor | Cardinality Note 01 |
| SCOP-0002 | SCOP-0004 | SCOP-0007 | contributor | Cardinality Note 02 |
| SCOP-0003 | SCOP-0005 | SCOP-0002 | observer | Cardinality Note 03 |
| SCOP-0004 | SCOP-0002 | SCOP-0002 | reviewer | Cardinality Note 04 |
| SCOP-0005 | SCOP-0002 | SCOP-0002 | owner | Cardinality Note 05 |
| SCOP-0006 | SCOP-0005 | SCOP-0001 | observer | Cardinality Note 06 |
| SCOP-0007 | SCOP-0003 | SCOP-0007 | observer | Cardinality Note 07 |
| SCOP-0008 | SCOP-0006 | SCOP-0006 | contributor | Cardinality Note 08 |

The same relational pattern recurs in the eBPF map type taxonomy, where concrete map instances like cgroup_sock_map, tcp_conn_map, perf_event_array, and dns_query_cache are classified by their underlying map_type—queue, devmap, hash, or ringbuf. Each map instance is uniquely identified by an identifier such as TYPE-0001 or TYPE-0002, and the association between a specific map and its type is governed by a role that designates whether the map serves as an observer, owner, contributor, or reviewer within the type hierarchy. This structure permits a single map type to be referenced by multiple map instances and, conversely, allows a map instance to be associated with a type through a relationship that is itself typed and qualified.

**t_ebpfmap_exactly_one_type**

| id | ebpfmap |
| --- | --- |
| TYPE-0001 | cgroup_sock_map |
| TYPE-0002 | tcp_conn_map |
| TYPE-0003 | perf_event_array |
| TYPE-0004 | dns_query_cache |
| TYPE-0005 | tcp_conn_map |
| TYPE-0006 | skb_drop_reason_map |
| TYPE-0007 | skb_drop_reason_map |

**t_ebpfmap_exactly_one_type_map_type**

| id | map_type |
| --- | --- |
| TYPE-0001 | queue |
| TYPE-0002 | devmap |
| TYPE-0003 | hash |
| TYPE-0004 | ringbuf |
| TYPE-0005 | queue |
| TYPE-0006 | cgroup_storage |
| TYPE-0007 | lru_hash |
| TYPE-0008 | cpumap |

**t_ebpfmap_exactly_one_type__map_type**

| id | ebpfmap_id | map_type_id | role |
| --- | --- | --- | --- |
| TYPE-0001 | TYPE-0007 | TYPE-0007 | observer |
| TYPE-0002 | TYPE-0002 | TYPE-0005 | owner |
| TYPE-0003 | TYPE-0002 | TYPE-0001 | contributor |
| TYPE-0004 | TYPE-0001 | TYPE-0005 | reviewer |
| TYPE-0005 | TYPE-0004 | TYPE-0008 | reviewer |
| TYPE-0006 | TYPE-0006 | TYPE-0005 | contributor |
| TYPE-0007 | TYPE-0007 | TYPE-0001 | observer |
| TYPE-0008 | TYPE-0005 | TYPE-0005 | contributor |

Institutional vision statements operate under a parallel architecture of identification, goal alignment, and stakeholder targeting. A vision statement such as Community Impact Vision, Future-First Learning, Global Excellence Framework, or Campus 2030 Blueprint is anchored to an educational goal—Student Retention Improvement, Faculty Development Program, Curriculum Modernization, or Alumni Engagement Metric—and directed at a stakeholder group including Research Faculty, Accrediting Bodies, Alumni Network, or Local Community. Each vision statement carries a unique identifier like STAT-0001 or STAT-0002, and the triad of vision, goal, and stakeholder forms a governance triplet that specifies not only what the institution aspires to achieve but for whom and toward which measurable outcome.

**t_institutional_vision_statement**

| id | institutional_vision_statement | targets_goal | addresses_stakeholder |
| --- | --- | --- | --- |
| STAT-0001 | Community Impact Vision | Student Retention Improvement | Research Faculty |
| STAT-0002 | Future-First Learning | Faculty Development Program | Accrediting Bodies |
| STAT-0003 | Global Excellence Framework | Curriculum Modernization | Alumni Network |
| STAT-0004 | Campus 2030 Blueprint | Alumni Engagement Metric | Local Community |
| STAT-0005 | Open Access Roadmap | Research Output Expansion | Undergraduate Cohort |
| STAT-0006 | Global Excellence Framework | Curriculum Modernization | Administrative Staff |
| STAT-0007 | Next-Gen Research Mandate | Inclusive Access Expansion | K-12 Pipeline |

**t_institutional_vision_statement_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| STAT-0001 | effective_date | xsd:date |
| STAT-0002 | enforcement | xsd:string |
| STAT-0003 | mandatory | xsd:boolean |
| STAT-0004 | priority | xsd:integer |
| STAT-0005 | review_cycle_days | xsd:integer |
| STAT-0006 | scope | xsd:string |
| STAT-0007 | encoding | xsd:string |
| STAT-0008 | label_text | xsd:string |

The attribute system extends this structure by decoupling metadata from the vision statement entities themselves. An attr_name—effective_date, enforcement, mandatory, or priority—is declared with an attr_type drawn from the XSD namespace: xsd:date for temporal values, xsd:string for textual descriptors, xsd:boolean for binary flags, and xsd:integer for numeric measures. These attribute definitions are then instantiated against an entity, which in this context is a specific vision statement identified by its entity_id. The resulting value, stored in a misc column, carries the actual data: a date such as 2023-09-09 or 2023-10-19, a boolean true or false indicating whether a provision is mandatory, an integer like 5 or 753 denoting priority level, or a varchar string such as Encoding 01, Enforcement 02, nightly summary, or ja. This separation of attribute schema from attribute values permits the same attribute definition to be reused across multiple entities while preserving type safety and enabling heterogeneous value storage within a unified relational model.

**t_institutional_vision_statement_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| STAT-0001 | STAT-0001 | STAT-0003 | true |
| STAT-0002 | STAT-0002 | STAT-0003 | true |
| STAT-0003 | STAT-0003 | STAT-0003 | false |
| STAT-0004 | STAT-0004 | STAT-0003 | false |
| STAT-0005 | STAT-0005 | STAT-0003 | true |
| STAT-0006 | STAT-0006 | STAT-0003 | false |
| STAT-0007 | STAT-0007 | STAT-0003 | false |

**t_institutional_vision_statement_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| STAT-0001 | STAT-0001 | STAT-0001 | 2023-09-09 |
| STAT-0002 | STAT-0002 | STAT-0001 | 2023-09-20 |
| STAT-0003 | STAT-0003 | STAT-0001 | 2023-06-25 |
| STAT-0004 | STAT-0004 | STAT-0001 | 2023-10-19 |
| STAT-0005 | STAT-0005 | STAT-0001 | 2024-08-06 |
| STAT-0006 | STAT-0006 | STAT-0001 | 2024-01-23 |
| STAT-0007 | STAT-0007 | STAT-0001 | 2025-03-30 |

**t_institutional_vision_statement_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| STAT-0001 | STAT-0001 | STAT-0004 | 5 |
| STAT-0002 | STAT-0001 | STAT-0005 | 753 |
| STAT-0003 | STAT-0002 | STAT-0004 | 2 |
| STAT-0004 | STAT-0002 | STAT-0005 | 439 |
| STAT-0005 | STAT-0003 | STAT-0004 | 5 |
| STAT-0006 | STAT-0003 | STAT-0005 | 277 |
| STAT-0007 | STAT-0004 | STAT-0004 | 5 |
| STAT-0008 | STAT-0004 | STAT-0005 | 639 |

**t_institutional_vision_statement_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| STAT-0001 | STAT-0001 | STAT-0007 | Encoding 01 |
| STAT-0002 | STAT-0001 | STAT-0002 | Enforcement 02 |
| STAT-0003 | STAT-0001 | STAT-0008 | nightly summary |
| STAT-0004 | STAT-0001 | STAT-0009 | ja |
| STAT-0005 | STAT-0001 | STAT-0006 | Scope 05 |
| STAT-0006 | STAT-0002 | STAT-0007 | Encoding 06 |
| STAT-0007 | STAT-0002 | STAT-0002 | Enforcement 07 |
| STAT-0008 | STAT-0002 | STAT-0008 | nightly summary |