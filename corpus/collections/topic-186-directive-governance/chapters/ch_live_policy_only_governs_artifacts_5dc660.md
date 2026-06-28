---
chapter_id: ch_live_policy_only_governs_artifacts_5dc660
topic_id: 186
family: 03_directive_governance
cited_terms: ['policy_only_governs_artifacts', 'policy_subclass', 'policy_subclass_governs']
model: engine-refine
---

Policy attributes serve as the definitional backbone of a governance framework, capturing the specific characteristics that distinguish one policy from another. Each attribute carries a name and a typed value, ensuring that metadata remains both machine-readable and semantically precise. Attributes such as `effective_date`, `enforcement`, `mandatory`, and `priority` are declared with explicit types—`xsd:date`, `xsd:string`, `xsd:boolean`, and `xsd:integer` respectively—so that the system can validate and reason about policy properties without ambiguity. A boolean attribute like `mandatory` might resolve to `true` for one policy entity and `false` for another, while a date attribute such as `effective_date` anchors a policy to a concrete point in time, with values ranging from `2023-01-31` to `2024-06-17` across the policy corpus.

**t_policy_subclass_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0003 | false |
| POLI-0002 | POLI-0002 | POLI-0003 | true |
| POLI-0003 | POLI-0003 | POLI-0003 | true |
| POLI-0004 | POLI-0004 | POLI-0003 | false |
| POLI-0005 | POLI-0005 | POLI-0003 | true |
| POLI-0006 | POLI-0006 | POLI-0003 | false |

**t_policy_subclass_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0001 | 2023-01-31 |
| POLI-0002 | POLI-0002 | POLI-0001 | 2024-06-17 |
| POLI-0003 | POLI-0003 | POLI-0001 | 2023-06-01 |
| POLI-0004 | POLI-0004 | POLI-0001 | 2024-01-12 |
| POLI-0005 | POLI-0005 | POLI-0001 | 2024-07-01 |
| POLI-0006 | POLI-0006 | POLI-0001 | 2023-07-28 |

Enforcement level determines the operational weight of a policy when it encounters a target artifact. Policies are classified as `blocking`, `advisory`, or `deprecated`, each conveying a distinct directive to the systems that enforce them. A blocking policy, for instance, prevents the associated artifact from proceeding until compliance is achieved, whereas an advisory policy merely flags a concern for human review. The `Data Classification Scheme` (ARTI-0003) carries a `deprecated` enforcement status, signaling that the policy is no longer active, while the `Provenance Directive` (ARTI-0001) enforces a `blocking` posture, reflecting its critical role in supply-chain integrity.

Priority and review cycle days provide the temporal and ordinal scaffolding for governance operations. Priority is a numeric ranking—values such as `1`, `2`, `4`, and `5` appear across the artifact and governance tables—that determines which policies take precedence when conflicts arise or when resources for remediation are constrained. The `Data Classification Scheme` (ARTI-0003) holds the highest priority at `1`, while the `Financial Audit Trails` policy (ARTI-0004) sits at the lowest with a priority of `5`. Review cycle days govern how frequently a governance relationship must be re-evaluated, with values spanning from `277` days for `Metadata Governance` to `799` days for `Data Classification Scheme`. These intervals ensure that policies do not become stale and that the governance posture evolves alongside the organization's risk landscape.

Entities and identifiers form the connective tissue that binds policies to the artifacts and scopes they govern. Each policy, artifact, and governance rule receives a unique identifier—`POLI-0001` through `POLI-0004` for policies, `ARTI-0001` through `ARTI-0004` for artifacts, and `GOVE-0001` through `GOVE-0004` for governance mappings—that enables precise referencing across the framework. A policy such as `Privacy Compliance Policy` (POLI-0001) may govern the artifact `ARTI-0002`, while another policy, `Artifact Scope Policy` (POLI-0004), governs `ARTI-0001`. Governance rules further extend this mapping by linking a policy to a scope entity; the `Edge Telemetry Nodes` policy (GOVE-0002) governs `POLI-0004` with a priority of `5` and a review cycle of `632` days, while `Production Databases` (GOVE-0003) governs `POLI-0003` with the highest priority of `1` and a review cycle of `507` days.

**t_policy_only_governs_artifacts**

| id | policy | enforcement | priority |
| --- | --- | --- | --- |
| ARTI-0001 | Provenance Directive | blocking | 2 |
| ARTI-0002 | Data Classification Policy | advisory | 4 |
| ARTI-0003 | Data Classification Scheme | deprecated | 1 |
| ARTI-0004 | Financial Audit Trails | advisory | 5 |
| ARTI-0005 | Access Control Policy | deprecated | 5 |
| ARTI-0006 | Data Classification Policy | mandatory | 1 |

**t_policy_subclass**

| id | policy | governs |
| --- | --- | --- |
| POLI-0001 | Privacy Compliance Policy | ARTI-0002 |
| POLI-0002 | Audit Trail Requirement | ARTI-0004 |
| POLI-0003 | Access Control Policy | ARTI-0001 |
| POLI-0004 | Artifact Scope Policy | ARTI-0001 |
| POLI-0005 | Privacy Compliance Policy | ARTI-0006 |
| POLI-0006 | Audit Trail Requirement | ARTI-0005 |

**t_policy_subclass_governs**

| id | policy | governs_scope | priority | review_cycle_days |
| --- | --- | --- | --- | --- |
| GOVE-0001 | Data Classification Scheme | POLI-0001 | 4 | 799 |
| GOVE-0002 | Edge Telemetry Nodes | POLI-0004 | 5 | 632 |
| GOVE-0003 | Production Databases | POLI-0003 | 1 | 507 |
| GOVE-0004 | Metadata Governance | POLI-0006 | 4 | 277 |
| GOVE-0005 | Lab Safety Protocol | POLI-0002 | 3 | 143 |
| GOVE-0006 | Network Segmentation Policy | POLI-0006 | 5 | 666 |

Beyond structured attributes, policies carry miscellaneous string values that capture operational metadata not covered by typed attributes. Values such as `Encoding 01`, `Enforcement 02`, `nightly summary`, and the locale code `fr` appear as free-form strings attached to policy entities, providing additional context for automation pipelines, reporting tools, and localization workflows. These miscellaneous values complement the typed attributes by allowing the framework to store heterogeneous data without requiring a new attribute definition for every new kind of metadata. Together, the typed attributes, enforcement levels, priorities, review cycles, identifiers, and miscellaneous values form a cohesive governance model that is both expressive enough to capture organizational nuance and structured enough to support automated compliance checking and auditability.

**t_policy_subclass_attr**

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

**t_policy_subclass_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0004 | 1 |
| POLI-0002 | POLI-0001 | POLI-0005 | 740 |
| POLI-0003 | POLI-0002 | POLI-0004 | 3 |
| POLI-0004 | POLI-0002 | POLI-0005 | 958 |
| POLI-0005 | POLI-0003 | POLI-0004 | 5 |
| POLI-0006 | POLI-0003 | POLI-0005 | 462 |
| POLI-0007 | POLI-0004 | POLI-0004 | 5 |
| POLI-0008 | POLI-0004 | POLI-0005 | 496 |

**t_policy_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0007 | Encoding 01 |
| POLI-0002 | POLI-0001 | POLI-0002 | Enforcement 02 |
| POLI-0003 | POLI-0001 | POLI-0008 | nightly summary |
| POLI-0004 | POLI-0001 | POLI-0009 | fr |
| POLI-0005 | POLI-0001 | POLI-0006 | Scope 05 |
| POLI-0006 | POLI-0002 | POLI-0007 | Encoding 06 |
| POLI-0007 | POLI-0002 | POLI-0002 | Enforcement 07 |
| POLI-0008 | POLI-0002 | POLI-0008 | audit excerpt |