---
chapter_id: ch_live_ebpfmap_with_max_entries_8fff55
topic_id: 186
family: 04_ebpf_kernel
cited_terms: ['ebpfmap_with_max_entries', 'internal_communication_requirement', 'mass_function_only_assigns_subsets']
model: engine-refine
---

An attribute system serves as the structural backbone for tracking metadata across organizational artifacts, where each attribute carries a name and a type that constrains the values it can hold. Attributes such as confidence, dimension_kind, method, and recorded_at are declared with precise types—xsd:decimal for numeric precision, xsd:string for categorical labels, and xsd:dateTime for temporal markers—ensuring that downstream data respects semantic boundaries. When values are assigned to entities, they flow through type-specific channels: decimal attributes capture measurements like 0.589 or 503.17, string attributes store descriptors such as "Dimension Kind 01" or "Encoding 02," and datetime attributes anchor records to specific moments like 2024-10-19T15:01:03. This typed discipline prevents data corruption at the point of entry and enables automated validation across the governance pipeline.

Entities are the primary subjects of governance, each identified by a unique identifier that serves as the stable reference point for all relationships and attribute assignments. An identifier such as ENTR-0001 or SUBS-0001 does not merely label a record; it anchors a web of associations that span across tables and domains. In one context, ENTR-0001 identifies an eBPF map of type devmap with a maximum entry capacity of 1,048,576; in another, SUBS-0001 identifies an entity to which the mass function data_quality is assigned, carrying a confidence value of 0.589 and a recorded_at timestamp. The identifier is the invariant key that allows auditors, operators, and automated systems to trace an artifact from its definition through its attributes, its relationships, and its lifecycle events without ambiguity.

**t_ebpfmap_with_max_entries**

| id | ebpfmap |
| --- | --- |
| ENTR-0001 | devmap |
| ENTR-0002 | cgroup_storage |
| ENTR-0003 | queue |
| ENTR-0004 | stack_trace |
| ENTR-0005 | sockhash |
| ENTR-0006 | queue |

**t_ebpfmap_with_max_entries_max_entries**

| id | max_entries |
| --- | --- |
| ENTR-0001 | 1048576 |
| ENTR-0002 | 262144 |
| ENTR-0003 | 16384 |
| ENTR-0004 | 16384 |
| ENTR-0005 | 32768 |
| ENTR-0006 | 1048576 |
| ENTR-0007 | 524288 |

**t_mass_function_only_assigns_subsets**

| id | mass | assigns_mass_to |
| --- | --- | --- |
| SUBS-0001 | data_quality | network_congestion |
| SUBS-0002 | edge_node | thermal_overload |
| SUBS-0003 | thermal_fusion | sensor_offline |
| SUBS-0004 | telemetry_confidence | data_corruption |
| SUBS-0005 | signal_integrity | packet_loss |
| SUBS-0006 | edge_node | thermal_overload |

**t_mass_function_only_assigns_subsets_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| SUBS-0001 | confidence | xsd:decimal |
| SUBS-0002 | dimension_kind | xsd:string |
| SUBS-0003 | method | xsd:string |
| SUBS-0004 | recorded_at | xsd:dateTime |
| SUBS-0005 | uncertainty | xsd:decimal |
| SUBS-0006 | unit | xsd:string |
| SUBS-0007 | value | xsd:decimal |
| SUBS-0008 | encoding | xsd:string |

**t_mass_function_only_assigns_subsets_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SUBS-0001 | SUBS-0001 | SUBS-0004 | 2024-10-19T15:01:03 |
| SUBS-0002 | SUBS-0002 | SUBS-0004 | 2023-10-05T14:35:44 |
| SUBS-0003 | SUBS-0003 | SUBS-0004 | 2024-02-24T01:03:34 |
| SUBS-0004 | SUBS-0004 | SUBS-0004 | 2024-04-26T17:49:00 |
| SUBS-0005 | SUBS-0005 | SUBS-0004 | 2024-01-29T11:02:31 |
| SUBS-0006 | SUBS-0006 | SUBS-0004 | 2023-11-16T17:14:50 |

**t_mass_function_only_assigns_subsets_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SUBS-0001 | SUBS-0001 | SUBS-0001 | 0.589 |
| SUBS-0002 | SUBS-0001 | SUBS-0005 | 503.17 |
| SUBS-0003 | SUBS-0001 | SUBS-0007 | 721.15 |
| SUBS-0004 | SUBS-0002 | SUBS-0001 | 0.512 |
| SUBS-0005 | SUBS-0002 | SUBS-0005 | 595.07 |
| SUBS-0006 | SUBS-0002 | SUBS-0007 | 721.26 |
| SUBS-0007 | SUBS-0003 | SUBS-0001 | 0.645 |
| SUBS-0008 | SUBS-0003 | SUBS-0005 | 722.55 |

**t_mass_function_only_assigns_subsets_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SUBS-0001 | SUBS-0001 | SUBS-0002 | Dimension Kind 01 |
| SUBS-0002 | SUBS-0001 | SUBS-0008 | Encoding 02 |
| SUBS-0003 | SUBS-0001 | SUBS-0009 | nightly summary |
| SUBS-0004 | SUBS-0001 | SUBS-0010 | de |
| SUBS-0005 | SUBS-0001 | SUBS-0003 | manual |
| SUBS-0006 | SUBS-0001 | SUBS-0006 | mg/L |
| SUBS-0007 | SUBS-0002 | SUBS-0002 | Dimension Kind 07 |
| SUBS-0008 | SUBS-0002 | SUBS-0008 | Encoding 08 |

Internal communication requirements form a distinct governance domain, where each requirement is tied to a specific enterprise social media platform, an organizational communication goal, a review cycle, and a language. The requirement Remote Work Policy Update, for instance, is published on Yammer, targets Safety Protocol Awareness, and must be reviewed every 750 days in English. The Employee Feedback Loop Mandate appears on both Discord Internal and Chatter, serving different goals—Change Management Adoption and Regulatory Compliance respectively—with review cycles of 478 and 606 days, the latter rendered in Japanese. The Incident Response Notification Rule, also on Yammer, enforces Regulatory Compliance with a much tighter 186-day review cycle. These parameters collectively define the compliance posture of organizational communications, ensuring that every policy reaches the right audience on the right platform and is refreshed on a schedule commensurate with its risk profile.

**t_internal_communication_requirement**

| id | internal_communication_requirement | specifies_platform | targets_goal | review_cycle_days | language |
| --- | --- | --- | --- | --- | --- |
| REQU-0001 | Remote Work Policy Update | Yammer | Safety Protocol Awareness | 750 | en |
| REQU-0002 | Employee Feedback Loop Mandate | Discord Internal | Change Management Adoption | 478 | en |
| REQU-0003 | Employee Feedback Loop Mandate | Chatter | Regulatory Compliance | 606 | ja |
| REQU-0004 | Incident Response Notification Rule | Yammer | Regulatory Compliance | 186 | en |
| REQU-0005 | Q3 Transparency Directive | Yammer | Regulatory Compliance | 572 | en |
| REQU-0006 | Internal Knowledge Sharing Standard | Mattermost | Culture Reinforcement | 940 | ja |

Relationships between entities are mediated through role-based associations that encode the nature of the connection. In the mapping between eBPF maps and their maximum entry configurations, the role column distinguishes whether an entity acts as reviewer, owner, or observer—ENTR-0004 appears as reviewer when linked to one max_entries record and as owner in another, reflecting the context-dependent nature of governance responsibilities. This role taxonomy is not merely descriptive; it determines access, approval authority, and audit trails. An owner can modify a configuration, a reviewer must validate changes, and an observer maintains visibility without edit rights. The subject column in these relationship tables identifies the source entity in the association, while the target column identifies the entity being related to, creating a directed graph of governance dependencies that can be traversed for impact analysis or compliance verification.

**t_ebpfmap_with_max_entries__max_entries**

| id | ebpfmap_id | max_entries_id | role |
| --- | --- | --- | --- |
| ENTR-0001 | ENTR-0004 | ENTR-0002 | reviewer |
| ENTR-0002 | ENTR-0001 | ENTR-0001 | owner |
| ENTR-0003 | ENTR-0004 | ENTR-0006 | reviewer |
| ENTR-0004 | ENTR-0002 | ENTR-0004 | observer |
| ENTR-0005 | ENTR-0006 | ENTR-0002 | observer |
| ENTR-0006 | ENTR-0006 | ENTR-0006 | owner |
| ENTR-0007 | ENTR-0004 | ENTR-0005 | owner |
| ENTR-0008 | ENTR-0006 | ENTR-0004 | observer |