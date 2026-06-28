---
chapter_id: ch_live_ebpfprogram_subclass_e27eb3
topic_id: 2
family: 04_ebpf_kernel
cited_terms: ['ebpfprogram_subclass', 'descriptive_only_about_artifact', 'policy_with_jurisdiction']
model: engine-refine
---

The architecture of the reference corpus rests upon a disciplined separation between entities, their attributes, and the factual assertions that describe them, each anchored by a unique identifier. At the core of this design, identifiers serve as the immutable keys that bind disparate records across the system: an eBPF program subclass such as `EBPF-0001` carries the label `kprobe_tcp_connect`, while a policy-jurisdiction pair like `JURI-0001` couples the `Financial Conduct Authority` with the `European Data Protection Board`. These identifiers do not merely label; they establish the referential integrity that permits the system to express relationships between subjects and targets. In the attachment graph, for instance, the program `EBPF-0001` is linked to the hook `EBPF-0001` with the role of `reviewer`, whereas `EBPF-0003` assumes the role of `observer` against the same target, demonstrating how a single foreign-key column—`role`—modulates the semantic character of an otherwise uniform relationship.

**t_ebpfprogram_subclass**

| id | ebpfprogram |
| --- | --- |
| EBPF-0001 | kprobe_tcp_connect |
| EBPF-0002 | kprobe_tcp_connect |
| EBPF-0003 | kprobe_tcp_connect |
| EBPF-0004 | tracepoint_sched_switch |
| EBPF-0005 | sockops_monitor |
| EBPF-0006 | cgroup_sock_bind |

**t_ebpfprogram_subclass_attaches_to_hook**

| id | attaches_to_hook |
| --- | --- |
| EBPF-0001 | cgroup/sock_create |
| EBPF-0002 | xdp/eth0 |
| EBPF-0003 | netfilter/ingress |
| EBPF-0004 | sk_skb/stream_parser |
| EBPF-0005 | tracepoint/sched/sched_switch |
| EBPF-0006 | cgroup/sock_create |

**t_ebpfprogram_subclass__attaches_to_hook**

| id | ebpfprogram_id | attaches_to_hook_id | role |
| --- | --- | --- | --- |
| EBPF-0001 | EBPF-0005 | EBPF-0003 | reviewer |
| EBPF-0002 | EBPF-0006 | EBPF-0006 | reviewer |
| EBPF-0003 | EBPF-0001 | EBPF-0001 | reviewer |
| EBPF-0004 | EBPF-0003 | EBPF-0002 | observer |
| EBPF-0005 | EBPF-0005 | EBPF-0004 | contributor |
| EBPF-0006 | EBPF-0002 | EBPF-0005 | observer |
| EBPF-0007 | EBPF-0005 | EBPF-0003 | owner |
| EBPF-0008 | EBPF-0001 | EBPF-0005 | contributor |

**t_policy_with_jurisdiction**

| id | policy | jurisdiction |
| --- | --- | --- |
| JURI-0001 | Financial Conduct Authority | European Data Protection Board |
| JURI-0002 | European Union | CCPA |
| JURI-0003 | European Union | European Union |
| JURI-0004 | FISMA | Basel III |
| JURI-0005 | California Attorney General | EU Data Act |
| JURI-0006 | Federal Trade Commission | National Institute of Standards |

**t_policy_with_jurisdiction_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| JURI-0001 | effective_date | xsd:date |
| JURI-0002 | enforcement | xsd:string |
| JURI-0003 | mandatory | xsd:boolean |
| JURI-0004 | priority | xsd:integer |
| JURI-0005 | review_cycle_days | xsd:integer |
| JURI-0006 | scope | xsd:string |
| JURI-0007 | encoding | xsd:string |
| JURI-0008 | label_text | xsd:string |

**t_policy_with_jurisdiction_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| JURI-0001 | JURI-0001 | JURI-0003 | false |
| JURI-0002 | JURI-0002 | JURI-0003 | false |
| JURI-0003 | JURI-0003 | JURI-0003 | true |
| JURI-0004 | JURI-0004 | JURI-0003 | false |
| JURI-0005 | JURI-0005 | JURI-0003 | false |
| JURI-0006 | JURI-0006 | JURI-0003 | true |

**t_policy_with_jurisdiction_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| JURI-0001 | JURI-0001 | JURI-0001 | 2023-11-22 |
| JURI-0002 | JURI-0002 | JURI-0001 | 2024-05-18 |
| JURI-0003 | JURI-0003 | JURI-0001 | 2025-06-18 |
| JURI-0004 | JURI-0004 | JURI-0001 | 2023-05-18 |
| JURI-0005 | JURI-0005 | JURI-0001 | 2025-03-17 |
| JURI-0006 | JURI-0006 | JURI-0001 | 2024-10-08 |

**t_policy_with_jurisdiction_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| JURI-0001 | JURI-0001 | JURI-0004 | 4 |
| JURI-0002 | JURI-0001 | JURI-0005 | 326 |
| JURI-0003 | JURI-0002 | JURI-0004 | 1 |
| JURI-0004 | JURI-0002 | JURI-0005 | 210 |
| JURI-0005 | JURI-0003 | JURI-0004 | 2 |
| JURI-0006 | JURI-0003 | JURI-0005 | 496 |
| JURI-0007 | JURI-0004 | JURI-0004 | 2 |
| JURI-0008 | JURI-0004 | JURI-0005 | 607 |

**t_policy_with_jurisdiction_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| JURI-0001 | JURI-0001 | JURI-0007 | Encoding 01 |
| JURI-0002 | JURI-0001 | JURI-0002 | Enforcement 02 |
| JURI-0003 | JURI-0001 | JURI-0008 | intake form |
| JURI-0004 | JURI-0001 | JURI-0009 | ja |
| JURI-0005 | JURI-0001 | JURI-0006 | Scope 05 |
| JURI-0006 | JURI-0002 | JURI-0007 | Encoding 06 |
| JURI-0007 | JURI-0002 | JURI-0002 | Enforcement 07 |
| JURI-0008 | JURI-0002 | JURI-0008 | change rationale |

Attributes are defined independently of their values, a design choice that enforces type discipline across a heterogeneous value space. The attribute schema declares names such as `effective_date`, `enforcement`, `mandatory`, and `priority`, each bound to an XML Schema type: `xsd:date`, `xsd:string`, `xsd:boolean`, and `xsd:integer` respectively. This separation of attribute definition from attribute instantiation means that the boolean attribute `JURI-0003` carries the value `false` for entities `JURI-0001` and `JURI-0002` but `true` for `JURI-0003`, while the date attribute `JURI-0001` records distinct effective dates—`2023-11-22`, `2024-05-18`, `2025-06-18`, `2023-05-18`—across the same set of entities. Integer attributes such as `JURI-0004` and `JURI-0005` hold values ranging from `1` to `326`, and varchar attributes capture free-form text like `Encoding 01`, `Enforcement 02`, `intake form`, and `ja`. The entity column in each value table serves as the foreign key that binds a typed value back to its governing policy-jurisdiction record, ensuring that every datum is traceable to its regulatory provenance.

Factual assertions about entities are captured in a dedicated fact table that explicitly models both confidence and uncertainty, two dimensions that are frequently conflated in analytical systems. Each fact record carries an `about_key` that references a descriptive entity—`ARTI-0005`, `ARTI-0002`, `ARTI-0004`—alongside a confidence score ranging from `0.209` to `0.854` and an uncertainty magnitude spanning `452.69` to `846.52`. The associated value, stored in the misc column, represents the measured or estimated quantity: `646.43`, `408.39`, `850.50`, `110.19`. The deliberate pairing of confidence and uncertainty is not redundant; a fact with confidence `0.854` and uncertainty `452.69` conveys a different epistemic posture than one with confidence `0.209` and uncertainty `846.52`, and the system preserves both because high confidence in a measurement does not necessarily imply low variance, nor does low confidence guarantee high uncertainty.

**fact_descriptive**

| id | about_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| ARTI-0001 | ARTI-0005 | 0.854 | 452.69 | 646.43 |
| ARTI-0002 | ARTI-0002 | 0.209 | 846.52 | 408.39 |
| ARTI-0003 | ARTI-0002 | 0.761 | 532.60 | 850.50 |
| ARTI-0004 | ARTI-0004 | 0.480 | 663.65 | 110.19 |
| ARTI-0005 | ARTI-0006 | 0.697 | 535.73 | 322.53 |
| ARTI-0006 | ARTI-0003 | 0.238 | 734.71 | 457.41 |

**dim_about**

| id | about_label | about_category |
| --- | --- | --- |
| ARTI-0001 | About Label 01 | About Category 01 |
| ARTI-0002 | About Label 02 | About Category 02 |
| ARTI-0003 | About Label 03 | About Category 03 |
| ARTI-0004 | About Label 04 | About Category 04 |
| ARTI-0005 | About Label 05 | About Category 05 |
| ARTI-0006 | About Label 06 | About Category 06 |

The `about` dimension provides the categorical scaffolding that gives factual assertions their interpretive context. Each about entity—`ARTI-0001` through `ARTI-0004`—carries a label such as `About Label 01` and a category such as `About Category 01`, and these categories serve as the grouping mechanism that permits aggregation and filtering of facts at a semantic level. The fact table's `about_key` column points to these entities, creating a many-to-one relationship between facts and their categorical anchors. This design permits the same factual value to be interpreted differently depending on its categorical context, and it ensures that the system can reason about facts not merely as isolated measurements but as members of a structured knowledge hierarchy.

The eBPF program subclass tables illustrate how the same relational patterns scale to operational telemetry. Programs like `kprobe_tcp_connect` and `tracepoint_sched_switch` are linked to attachment hooks—`cgroup/sock_create`, `xdp/eth0`, `netfilter/ingress`, `sk_skb/stream_parser`—through a junction table that encodes not only the subject-to-target relationship but also the functional role of each attachment. The role column, populated with values such as `reviewer` and `observer`, transforms what would otherwise be a simple foreign-key pair into a semantically rich relationship that can be queried, filtered, and audited. This pattern—subject, target, role—recurs throughout the corpus and reflects a general principle: relationships in governance and operational systems are not binary but carry attributes that describe their nature, scope, and authority.