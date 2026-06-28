---
chapter_id: ch_live_claim_basic_49b665
topic_id: 4
family: 06_belief_structure
cited_terms: ['claim_basic', 'cgroup_skb_subclass', 'requirement_satisfies']
model: engine-refine
---

Effective compliance tracking begins with a standardized method for capturing and classifying operational claims. Every assertion—such as a report noting that model accuracy fell below a service-level agreement or that a schema version has been deprecated—is assigned a unique identifier to ensure unambiguous reference across audits and reporting cycles. These identifiers anchor the data model, linking each claim to a broader entity that represents the underlying system, process, or artifact being evaluated. To enrich these entities, the framework employs an attribute-based architecture where each attr is explicitly assigned an attr type to guarantee data integrity. For instance, a confidence metric might be stored as a decimal, while a dimension classification or a timestamp is preserved as a string or datetime value. This strict typing prevents format drift and ensures that downstream analytics and compliance checks operate against consistently structured data.

**t_claim_basic**

| id | claim |
| --- | --- |
| CLAI-0001 | Model accuracy below SLA |
| CLAI-0002 | Schema version deprecated |
| CLAI-0003 | Model accuracy below SLA |
| CLAI-0004 | File checksum matches |
| CLAI-0005 | Compliance audit passed |
| CLAI-0006 | Compliance audit passed |

**t_claim_basic_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| CLAI-0001 | confidence | xsd:decimal |
| CLAI-0002 | dimension_kind | xsd:string |
| CLAI-0003 | method | xsd:string |
| CLAI-0004 | recorded_at | xsd:dateTime |
| CLAI-0005 | uncertainty | xsd:decimal |
| CLAI-0006 | unit | xsd:string |
| CLAI-0007 | value | xsd:decimal |
| CLAI-0008 | encoding | xsd:string |

**t_claim_basic_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CLAI-0001 | CLAI-0001 | CLAI-0004 | 2025-05-28T11:02:08 |
| CLAI-0002 | CLAI-0002 | CLAI-0004 | 2025-04-22T09:44:09 |
| CLAI-0003 | CLAI-0003 | CLAI-0004 | 2025-01-23T06:41:57 |
| CLAI-0004 | CLAI-0004 | CLAI-0004 | 2024-03-14T10:07:11 |
| CLAI-0005 | CLAI-0005 | CLAI-0004 | 2023-08-27T20:51:04 |
| CLAI-0006 | CLAI-0006 | CLAI-0004 | 2025-04-10T08:56:25 |

**t_claim_basic_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CLAI-0001 | CLAI-0001 | CLAI-0001 | 0.443 |
| CLAI-0002 | CLAI-0001 | CLAI-0005 | 443.93 |
| CLAI-0003 | CLAI-0001 | CLAI-0007 | 257.71 |
| CLAI-0004 | CLAI-0002 | CLAI-0001 | 0.828 |
| CLAI-0005 | CLAI-0002 | CLAI-0005 | 729.35 |
| CLAI-0006 | CLAI-0002 | CLAI-0007 | 717.18 |
| CLAI-0007 | CLAI-0003 | CLAI-0001 | 0.004 |
| CLAI-0008 | CLAI-0003 | CLAI-0005 | 534.68 |

**t_claim_basic_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CLAI-0001 | CLAI-0001 | CLAI-0002 | Dimension Kind 01 |
| CLAI-0002 | CLAI-0001 | CLAI-0008 | Encoding 02 |
| CLAI-0003 | CLAI-0001 | CLAI-0009 | audit excerpt |
| CLAI-0004 | CLAI-0001 | CLAI-0010 | fr |
| CLAI-0005 | CLAI-0001 | CLAI-0003 | automated |
| CLAI-0006 | CLAI-0001 | CLAI-0006 | m/s |
| CLAI-0007 | CLAI-0002 | CLAI-0002 | Dimension Kind 07 |
| CLAI-0008 | CLAI-0002 | CLAI-0008 | Encoding 08 |

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

The actual measurements and observations attached to these attributes are stored as discrete values, often categorized under a generic misc type to accommodate heterogeneous data without sacrificing schema stability. Whether recording a precise decimal measurement like 0.443 for a performance threshold, capturing a categorical label such as Dimension Kind 01, or logging an audit excerpt in French, each value is bound to a specific entity and attribute pair. Temporal precision is maintained through dedicated datetime storage, allowing auditors to trace exactly when a measurement was recorded, down to the second. This decoupled value storage pattern enables the system to scale across diverse compliance domains without requiring rigid, pre-defined columns for every possible metric, while still preserving the exact semantics of the original observation.

Beyond isolated claims, compliance frameworks must model how components interact and assume responsibility within a larger ecosystem. The architecture captures these dynamics through explicit relationship mappings that define a subject and a target, linked by a specific role that dictates the nature of their interaction. For example, a network traffic classifier or a resource controller might act as an observer, contributor, owner, or reviewer relative to a target cgroup or service slice. By formalizing these connections, the system can enforce least-privilege access, track lineage, and validate that every component operates within its authorized boundary. This role-based relationship model transforms static inventory data into a dynamic map of operational dependencies, making it straightforward to audit cross-component interactions and isolate failure domains.

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

The final layer of the framework translates raw operational data into actionable governance directives. Each claim or artifact is evaluated against formal requirements—such as an Audit Trail Mandate, a Data Retention Policy, or an Encryption Standard AES-256—and mapped to demonstrate compliance. These mappings are not treated uniformly; they are assigned a priority level and a scope to guide resource allocation and enforcement. A critical regional encryption requirement might carry the highest priority, while a team-level data retention check could be deprioritized or scoped to a specific operational unit. This structured prioritization ensures that compliance officers and engineering leads can triage remediation efforts effectively, focusing first on high-impact, broadly scoped mandates while maintaining visibility into localized, lower-priority adjustments.

**t_requirement_satisfies**

| id | requirement | satisfies | priority | scope |
| --- | --- | --- | --- | --- |
| SATI-0001 | Audit Trail Mandate | CLAI-0004 | 5 | team |
| SATI-0002 | Data Retention Policy | CLAI-0006 | 2 | team |
| SATI-0003 | Encryption Standard AES-256 | CLAI-0004 | 1 | regional |
| SATI-0004 | ISO 27001 Annex A | CLAI-0006 | 5 | team |
| SATI-0005 | Protocol TLS 1.3 | CLAI-0004 | 2 | team |
| SATI-0006 | Data Retention Policy | CLAI-0006 | 1 | local |

Together, these components form a cohesive compliance architecture that balances granular data capture with strategic oversight. By anchoring every observation to a stable identifier, enforcing strict attribute typing, and storing heterogeneous values in a unified pattern, the system maintains a single source of truth for operational claims. The explicit modeling of subject-target relationships under defined roles provides the necessary context for accountability, while the requirement-satisfaction layer overlays governance priorities and scopes to drive execution. This integrated approach ensures that compliance is not merely a retrospective checklist, but a continuously observable, prioritized, and role-aware operational discipline.