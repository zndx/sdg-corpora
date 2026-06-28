---
chapter_id: ch_live_directive_traces_to_requirement_e83621
topic_id: 180
family: 03_directive_governance
cited_terms: ['directive_traces_to_requirement', 'lru_hash_map_subclass', 'policy_basic']
model: engine-refine
---

In governance and compliance systems, every auditable object must be addressable without ambiguity, and that addressability begins with the identifier. An identifier is not merely a surrogate key in storage; it is the durable handle by which policies, requirements, cache configurations, and their relationships survive renaming, republication, and cross-framework traceability. When the Encryption Standard Policy carries REQU-0001, when PCI DSS v4.0 is recorded as POLI-0001, and when the primary-db-cache subclass is keyed MAP-0001, each token establishes a stable referent that downstream assertions can cite without re-deriving identity from human-readable labels. Identifiers propagate: the same REQU-0003 that names EU AI Act Article 9 in the requirement registry reappears as entity_id in boolean value rows, so mandatory-status queries need not parse directive titles or reconcile homonyms across regulatory corpora.

**t_directive_traces_to_requirement**

| id | directive |
| --- | --- |
| REQU-0001 | Encryption Standard Policy |
| REQU-0002 | Security Baseline Policy |
| REQU-0003 | EU AI Act Article 9 |
| REQU-0004 | FedRAMP High Baseline |
| REQU-0005 | Encryption Standard AES-256 |
| REQU-0006 | Audit Logging Policy |

**t_lru_hash_map_subclass_l_r_u_hash_config**

| id | l_r_u_hash_config |
| --- | --- |
| MAP-0001 | siphash-2-4 |
| MAP-0002 | xxhash64 |
| MAP-0003 | robin-hood |
| MAP-0004 | sparse-block-map |
| MAP-0005 | murmur3-128 |
| MAP-0006 | murmur3-128 |

**t_policy_basic**

| id | policy |
| --- | --- |
| POLI-0001 | PCI DSS v4.0 |
| POLI-0002 | Backup Recovery Policy |
| POLI-0003 | Security Baseline Policy |
| POLI-0004 | Access Control Policy |
| POLI-0005 | Acceptable Use Policy |
| POLI-0006 | FedRAMP High Baseline |
| POLI-0007 | Encryption Standard AES-256 |

The entity is the governed object those identifiers denote—the policy, the traced requirement, the LRU hash-map subclass—not the metadata row that describes one of its properties. Entity_id in a value record therefore answers a precise question: which object owns this assertion? POLI-0002’s effective_date of 2023-08-24 attaches to the Backup Recovery Policy as a whole; REQU-0004’s priority integers attach to FedRAMP High Baseline through entity_id REQU-0004 even when the attribute definition itself is shared. Separating entity from attr prevents the common failure mode in which compliance spreadsheets collapse “what is being governed” into “what is being said about it,” obscuring cardinality when one framework object carries many typed facts or when the same attribute name applies uniformly across a population of entities.

**t_directive_traces_to_requirement_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| REQU-0001 | effective_date | xsd:date |
| REQU-0002 | enforcement | xsd:string |
| REQU-0003 | mandatory | xsd:boolean |
| REQU-0004 | priority | xsd:integer |
| REQU-0005 | review_cycle_days | xsd:integer |
| REQU-0006 | scope | xsd:string |
| REQU-0007 | encoding | xsd:string |
| REQU-0008 | label_text | xsd:string |

**t_directive_traces_to_requirement_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| REQU-0001 | REQU-0001 | REQU-0001 | 2023-08-06 |
| REQU-0002 | REQU-0002 | REQU-0001 | 2023-10-19 |
| REQU-0003 | REQU-0003 | REQU-0001 | 2025-05-18 |
| REQU-0004 | REQU-0004 | REQU-0001 | 2023-12-14 |
| REQU-0005 | REQU-0005 | REQU-0001 | 2024-01-08 |
| REQU-0006 | REQU-0006 | REQU-0001 | 2024-04-02 |

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

**t_policy_basic_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| POLI-0001 | effective_date | xsd:date |
| POLI-0002 | enforcement | xsd:string |
| POLI-0003 | mandatory | xsd:boolean |
| POLI-0004 | priority | xsd:integer |
| POLI-0005 | review_cycle_days | xsd:integer |
| POLI-0006 | scope | xsd:string |
| POLI-0007 | encoding | xsd:string |
| POLI-0008 | label_text | xsd:string |

**t_policy_basic_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0001 | 2025-05-22 |
| POLI-0002 | POLI-0002 | POLI-0001 | 2023-08-24 |
| POLI-0003 | POLI-0003 | POLI-0001 | 2025-01-30 |
| POLI-0004 | POLI-0004 | POLI-0001 | 2025-06-16 |
| POLI-0005 | POLI-0005 | POLI-0001 | 2023-11-15 |
| POLI-0006 | POLI-0006 | POLI-0001 | 2023-07-13 |
| POLI-0007 | POLI-0007 | POLI-0001 | 2023-02-02 |

An attr names the dimension along which an entity may be characterized, and attr_type constrains how that dimension may legally be populated. effective_date, enforcement, mandatory, and priority recur across both policy and requirement registries because they encode operational primitives—temporal validity, enforcement posture, obligation strength, and precedence—that auditors expect to compare across corpora. The type declaration is load-bearing: xsd:date routes assertions into date-valued stores (2025-05-18 for REQU-0003, 2025-06-16 for POLI-0004), xsd:boolean into boolean stores where mandatory is true only for REQU-0003 and false elsewhere, xsd:integer into priority lattices ranging from 2 through 453, and xsd:string into varchar stores holding enforcement labels such as Enforcement 02 or locale markers such as en and ja. attr_type is thus the contract that governs validation, indexing, and join strategy; misc is the payload that satisfies it—the miscellaneous column label acknowledging that concrete values resist a single universal representation.

**t_directive_traces_to_requirement_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| REQU-0001 | REQU-0001 | REQU-0007 | Encoding 01 |
| REQU-0002 | REQU-0001 | REQU-0002 | Enforcement 02 |
| REQU-0003 | REQU-0001 | REQU-0008 | nightly summary |
| REQU-0004 | REQU-0001 | REQU-0009 | ja |
| REQU-0005 | REQU-0001 | REQU-0006 | Scope 05 |
| REQU-0006 | REQU-0002 | REQU-0007 | Encoding 06 |
| REQU-0007 | REQU-0002 | REQU-0002 | Enforcement 07 |
| REQU-0008 | REQU-0002 | REQU-0008 | change rationale |

**t_policy_basic_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0007 | Encoding 01 |
| POLI-0002 | POLI-0001 | POLI-0002 | Enforcement 02 |
| POLI-0003 | POLI-0001 | POLI-0008 | calibration record |
| POLI-0004 | POLI-0001 | POLI-0009 | en |
| POLI-0005 | POLI-0001 | POLI-0006 | Scope 05 |
| POLI-0006 | POLI-0002 | POLI-0007 | Encoding 06 |
| POLI-0007 | POLI-0002 | POLI-0002 | Enforcement 07 |
| POLI-0008 | POLI-0002 | POLI-0008 | intake form |

misc values are evidence, not decoration. A boolean false on mandatory for REQU-0001, REQU-0002, and REQU-0004 alongside true for REQU-0003 distinguishes optional baseline postures from binding AI Act obligations without altering the attribute definition. Integer misc entries—4 and 132 on REQU-0001, 4 and 453 on REQU-0002, 3 and 74 on POLI-0002—support tiered prioritization where the same entity may carry multiple priority-scoped assertions keyed through distinct attr_id references. Varchar misc carries human- and machine-facing tokens that do not reduce cleanly to scalars: Encoding 01 on POLI-0001, nightly summary on REQU-0001, calibration record on POLI-0003. In practice, misc is what examiners quote, what dashboards render, and what diff engines compare when a policy republication changes enforcement text or effective horizon.

Where entities and typed attributes describe intrinsic state, subject, target, and role describe extrinsic structure—who or what participates in a relationship, to what end, and under what capacity. In the LRU configuration graph, subject (lru_id) identifies the participating cache subclass—MAP-0007, MAP-0004, MAP-0003, MAP-0005—while target (l_r_u_hash_config_id) identifies the hash strategy bound to that participant: siphash-2-4 and sparse-block-map surface as MAP-0004 targets, xxhash64 and robin-hood as MAP-0002. role qualifies the binding: reviewer on MAP-0001 and MAP-0004 associations, contributor on MAP-0002, observer on MAP-0003. That triad generalizes beyond caching: subject is the governed or originating party, target is the resource or standard applied, and role is the normative stance—approval, contribution, observation—that permission models and segregation-of-duties rules must enforce.

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

Operational maturity depends on keeping these primitives orthogonal. Identifiers stabilize reference; entities anchor ownership; attrs and attr_types define the measurable surface; misc supplies the verifiable fact; subject–target–role tuples externalize configuration and accountability graphs that scalar attributes cannot express. A control assessment that asks whether FedRAMP High Baseline is mandatory traverses entity REQU-0004, attr mandatory typed xsd:boolean, and misc false—not the directive string alone. A capacity review that asks which caches adopt robin-hood hashing traverses subject MAP-0003, target MAP-0002, role observer. Dense registries earn their keep when every linkage is typed, keyed, and role-qualified sufficiently that traceability from PCI DSS v4.0 through Security Baseline Policy to stream-event-cache hashing strategy requires no ad hoc interpretation—only disciplined resolution along the identifier–entity–attr–misc and subject–target–role axes that constitute the domain’s working grammar.

**t_directive_traces_to_requirement_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| REQU-0001 | REQU-0001 | REQU-0003 | false |
| REQU-0002 | REQU-0002 | REQU-0003 | false |
| REQU-0003 | REQU-0003 | REQU-0003 | true |
| REQU-0004 | REQU-0004 | REQU-0003 | false |
| REQU-0005 | REQU-0005 | REQU-0003 | false |
| REQU-0006 | REQU-0006 | REQU-0003 | true |

**t_directive_traces_to_requirement_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| REQU-0001 | REQU-0001 | REQU-0004 | 4 |
| REQU-0002 | REQU-0001 | REQU-0005 | 132 |
| REQU-0003 | REQU-0002 | REQU-0004 | 4 |
| REQU-0004 | REQU-0002 | REQU-0005 | 453 |
| REQU-0005 | REQU-0003 | REQU-0004 | 4 |
| REQU-0006 | REQU-0003 | REQU-0005 | 497 |
| REQU-0007 | REQU-0004 | REQU-0004 | 4 |
| REQU-0008 | REQU-0004 | REQU-0005 | 899 |

**t_policy_basic_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0003 | false |
| POLI-0002 | POLI-0002 | POLI-0003 | true |
| POLI-0003 | POLI-0003 | POLI-0003 | false |
| POLI-0004 | POLI-0004 | POLI-0003 | false |
| POLI-0005 | POLI-0005 | POLI-0003 | true |
| POLI-0006 | POLI-0006 | POLI-0003 | true |
| POLI-0007 | POLI-0007 | POLI-0003 | false |

**t_policy_basic_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0004 | 2 |
| POLI-0002 | POLI-0001 | POLI-0005 | 409 |
| POLI-0003 | POLI-0002 | POLI-0004 | 3 |
| POLI-0004 | POLI-0002 | POLI-0005 | 74 |
| POLI-0005 | POLI-0003 | POLI-0004 | 3 |
| POLI-0006 | POLI-0003 | POLI-0005 | 787 |
| POLI-0007 | POLI-0004 | POLI-0004 | 3 |
| POLI-0008 | POLI-0004 | POLI-0005 | 65 |