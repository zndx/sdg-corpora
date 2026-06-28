---
chapter_id: ch_live_policy_with_review_cycle_5c9e71
topic_id: 42
family: 03_directive_governance
cited_terms: ['policy_with_review_cycle', 'transformation_not_recoverable', 'claim_basic']
model: engine-refine
---

The governance framework relies on a structured attribute-value model to capture, classify, and enforce policy compliance across heterogeneous operational contexts. At its core, each claim—such as "Model accuracy below SLA" or "File checksum matches"—serves as an entity that can be annotated with typed attributes. These attributes, identified by names like confidence, dimension_kind, method, and recorded_at, are themselves classified by schema type: xsd:decimal for numeric precision, xsd:string for categorical labels, and xsd:dateTime for temporal records. This type discipline ensures that values are stored in dedicated value tables—decimal values such as 0.443 and 443.93 in one table, string values like "Dimension Kind 01" and "fr" in another, and datetime values such as 2025-05-28T11:02:08 in a third—preserving type integrity while supporting flexible, schema-on-read querying.

Identifiers anchor every entity and attribute within the system, providing stable, machine-readable references that enable cross-referencing across policy definitions, transformation workflows, and claim evaluations. A claim identifier such as CLAI-0001 may appear as the entity_id in multiple value rows, each capturing a different attribute of that same claim, while also being referenced by a review cycle identifier like CLAI-0002 in the policy table. This bidirectional linking means that a policy such as FedRAMP, scoped to the local boundary and defined in Japanese (ja), can be tied to a specific review cycle whose identifier points back to a claim whose attributes and values are fully enumerated. Similarly, a policy like SOC 2 Type II, scoped regionally and expressed in Japanese, references review cycle CLAI-0005, which in turn resolves to a claim whose metadata is stored across the attribute-value tables.

**t_transformation_not_recoverable**

| id | transformation | transformation_2 | scheduled_at | triggered_by |
| --- | --- | --- | --- | --- |
| RECO-0001 | partition compaction | checksum verification | 2023-05-27T08:30:46 | event |
| RECO-0002 | log rotation | index defragmentation | 2024-07-23T05:41:48 | manual |
| RECO-0003 | batch compaction | record purging | 2025-03-09T11:37:12 | schedule |
| RECO-0004 | format conversion | index rebuild | 2023-08-05T01:48:14 | api |
| RECO-0005 | format conversion | feature scaling | 2023-09-25T17:59:19 | manual |
| RECO-0006 | batch compaction | telemetry filtering | 2024-03-31T12:21:12 | event |
| RECO-0007 | snapshot commit | batch compaction | 2023-07-05T00:36:15 | schedule |
| RECO-0008 | index defragmentation | index defragmentation | 2025-04-13T18:22:12 | schedule |

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

The scope attribute delineates the operational boundary within which a policy or claim applies, distinguishing between local, team, and regional jurisdictions. This distinction is not merely administrative; it determines enforcement granularity and audit traceability. A FedRAMP policy scoped to local operations carries different compliance obligations than a CCPA policy scoped to regional coverage, and the framework records this distinction explicitly so that downstream systems can filter, aggregate, and report by jurisdictional level. Language, similarly, is a first-class attribute that captures the human-readable representation of policy content—whether in Japanese (ja) or French (fr)—ensuring that multilingual compliance documentation remains traceable to its governing policy identifier.

Irreversible data transformations are governed through a parallel tracking mechanism that records not only what transformation occurred—partition compaction, log rotation, batch compaction, or format conversion—but also the secondary transformation applied in conjunction, such as checksum verification or index defragmentation. Each transformation record carries a scheduled_at timestamp, anchoring the event in time with precision to the second (2023-05-27T08:30:46, 2024-07-23T05:41:48, 2025-03-09T11:37:12), and a triggered_by field that captures the origin of the action: event-driven automation, manual operator intervention, scheduled cron execution, or API invocation. This four-way trigger taxonomy ensures that every irreversible transformation is attributable to a specific operational mode, supporting both audit compliance and post-incident forensics.

The interplay between these structures—claims with typed attributes, policies with scoped review cycles, and transformations with temporal and causal metadata—forms a cohesive governance fabric. A single claim identifier can appear as the entity in decimal, string, and datetime value tables simultaneously, each row capturing a different facet of the same entity. That same identifier can be referenced by a review cycle in a policy table, which itself carries scope and language attributes that contextualize the compliance obligation. Meanwhile, transformation records operate independently but share the same identifier discipline, ensuring that every operational action can be correlated back to the policies and claims it affects. The result is a system where compliance is not a static declaration but a dynamically tracked, fully attributable, and type-safe construct.

**t_policy_with_review_cycle**

| id | policy | review_cycle | scope | language |
| --- | --- | --- | --- | --- |
| CYCL-0001 | FedRAMP | CLAI-0002 | local | ja |
| CYCL-0002 | NIST SP 800-53 | CLAI-0005 | team | ja |
| CYCL-0003 | CCPA | CLAI-0004 | regional | fr |
| CYCL-0004 | SOC 2 Type II | CLAI-0005 | regional | ja |
| CYCL-0005 | GDPR | CLAI-0002 | global | ja |
| CYCL-0006 | FedRAMP | CLAI-0005 | global | fr |
| CYCL-0007 | SOC 2 Type II | CLAI-0001 | global | ja |
| CYCL-0008 | CCPA | CLAI-0004 | local | ja |

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