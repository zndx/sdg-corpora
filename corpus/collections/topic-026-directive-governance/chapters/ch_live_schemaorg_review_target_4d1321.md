---
chapter_id: ch_live_schemaorg_review_target_4d1321
topic_id: 26
family: 07_long_tail
cited_terms: ['schemaorg_review_target', 'school_security_policy', 'settlement_financing_activity']
model: engine-refine
---

In complex governance and operational frameworks, every distinct object—whether a security policy, a financial transaction, or a software target—must be uniquely identified and strictly typed. An `identifier` serves as the immutable anchor for an `entity`, ensuring that records such as `TARG-0001` or `POLI-0001` can be referenced unambiguously across systems. These entities are categorized by their functional nature; for instance, a `schoolsecuritypolicy` might govern an institution like Cedar Ridge Preparatory or Westfield Middle School, while a `settlementfinancingactivity` tracks operational movements like `T-PLUS-ONE-CLEAR` or `INTERBANK-SETTLE`. By enforcing rigid typing, the system distinguishes between a `SoftwareApplication` target and a `Service` target, or separates a `Person` entity from a `PostgreSQLTable`, thereby establishing a clear semantic boundary for downstream processing and compliance auditing.

**t_school_security_policy_attr**

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

To capture the nuanced properties of these diverse entities without resorting to rigid, monolithic schemas, the framework employs a flexible attribute modeling approach. Each `entity` is associated with an `attr` (attribute), which is defined by an `attr_name` and constrained by an `attr_type`. For example, a school security policy might require an `effective_date` typed as `xsd:date`, a `mandatory` flag typed as `xsd:boolean`, or a `priority` level typed as `xsd:integer`. This separation of metadata from values allows the system to store heterogeneous data efficiently. Boolean attributes resolve to discrete `true` or `false` states, date attributes capture precise timestamps like `2023-05-09`, and integer attributes quantify metrics such as a priority score of `982` or a threshold of `312`. String-based attributes, stored as `misc` values, accommodate free-form text like `intake form` or localized codes such as `ja`, ensuring that the data model remains extensible as new policy requirements emerge.

**t_school_security_policy_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0003 | true |
| POLI-0002 | POLI-0002 | POLI-0003 | false |
| POLI-0003 | POLI-0003 | POLI-0003 | false |
| POLI-0004 | POLI-0004 | POLI-0003 | false |
| POLI-0005 | POLI-0005 | POLI-0003 | true |
| POLI-0006 | POLI-0006 | POLI-0003 | true |
| POLI-0007 | POLI-0007 | POLI-0003 | true |
| POLI-0008 | POLI-0008 | POLI-0003 | false |

**t_school_security_policy_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0001 | 2023-05-09 |
| POLI-0002 | POLI-0002 | POLI-0001 | 2024-07-27 |
| POLI-0003 | POLI-0003 | POLI-0001 | 2023-12-11 |
| POLI-0004 | POLI-0004 | POLI-0001 | 2024-08-29 |
| POLI-0005 | POLI-0005 | POLI-0001 | 2024-05-03 |
| POLI-0006 | POLI-0006 | POLI-0001 | 2024-09-29 |
| POLI-0007 | POLI-0007 | POLI-0001 | 2024-11-04 |
| POLI-0008 | POLI-0008 | POLI-0001 | 2024-06-30 |

**t_school_security_policy_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0004 | 2 |
| POLI-0002 | POLI-0001 | POLI-0005 | 982 |
| POLI-0003 | POLI-0002 | POLI-0004 | 2 |
| POLI-0004 | POLI-0002 | POLI-0005 | 312 |
| POLI-0005 | POLI-0003 | POLI-0004 | 2 |
| POLI-0006 | POLI-0003 | POLI-0005 | 809 |
| POLI-0007 | POLI-0004 | POLI-0004 | 4 |
| POLI-0008 | POLI-0004 | POLI-0005 | 270 |

**t_school_security_policy_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0007 | Encoding 01 |
| POLI-0002 | POLI-0001 | POLI-0002 | Enforcement 02 |
| POLI-0003 | POLI-0001 | POLI-0008 | intake form |
| POLI-0004 | POLI-0001 | POLI-0009 | ja |
| POLI-0005 | POLI-0001 | POLI-0006 | Scope 05 |
| POLI-0006 | POLI-0002 | POLI-0007 | Encoding 06 |
| POLI-0007 | POLI-0002 | POLI-0002 | Enforcement 07 |
| POLI-0008 | POLI-0002 | POLI-0008 | pre-release note |

Operational entities do not exist in isolation; they are bound by specific safety objectives and constitutional constraints that dictate their permissible scope. A `schoolsecuritypolicy` is explicitly designed to achieve a `safetyobjective`, such as `Network intrusion detection` or `Cyber threat intelligence`, while simultaneously adhering to a `constitutionalconstraint` like `OSHA workplace safety`, the `No lethal force rule`, or `ADA accessibility standards`. These constraints act as non-negotiable boundaries, ensuring that the implementation of a policy at an institution like Lincoln High School or Sunrise International School remains legally and ethically compliant. By explicitly linking an entity to its required objectives and constraints, the framework provides a transparent audit trail, demonstrating exactly why a particular security measure was implemented and what regulatory standards it satisfies.

**t_school_security_policy**

| id | school_security_policy | targets | must_satisfy |
| --- | --- | --- | --- |
| POLI-0001 | Cedar Ridge Preparatory | Network intrusion detection | OSHA workplace safety |
| POLI-0002 | Westfield Middle School | Unauthorized access prevention | No lethal force rule |
| POLI-0003 | Lincoln High School | Cyber threat intelligence | ADA accessibility standards |
| POLI-0004 | Sunrise International School | Cyber threat intelligence | State education statutes |
| POLI-0005 | Northview Technical Institute | Emergency evacuation protocols | State education statutes |
| POLI-0006 | Cedar Ridge Preparatory | Visitor management compliance | ISO 27001 framework |
| POLI-0007 | Sunrise International School | Structural integrity monitoring | ADA accessibility standards |
| POLI-0008 | Jefferson STEM Academy | Network intrusion detection | No lethal force rule |

In the financial domain, the relationships between entities become equally critical for tracking the flow of capital and the execution of settlement projects. A `settlementfinancingactivity` acts as the operational bridge connecting a `financialinstitution` to a `settlementproject`. For example, the activity `SEC-SETTLE-8812` facilitates the `Cross-Border Rail` project through the financial backing of `Deutsche Bank AG`, while `CASH-SETTLE-99` supports the `SWIFT GPI Rollout` via `HSBC Holdings`. Similarly, `Goldman Sachs` underpins the `Regional Clearing Hub` through the `INTERBANK-SETTLE` activity. This structured linkage ensures that every financial movement is traceable to its source institution and its ultimate beneficiary project, providing granular visibility into how capital is deployed across complex international infrastructure and payment initiatives.

**t_settlement_financing_activity**

| id | settlement_financing_activity | funds | benefits |
| --- | --- | --- | --- |
| ACTI-0001 | T-PLUS-ONE-CLEAR | HSBC Holdings | SWIFT GPI Rollout |
| ACTI-0002 | INTERBANK-SETTLE | Goldman Sachs | Regional Clearing Hub |
| ACTI-0003 | CASH-SETTLE-99 | Deutsche Bank AG | SWIFT GPI Rollout |
| ACTI-0004 | SEC-SETTLE-8812 | Deutsche Bank AG | Cross-Border Rail |
| ACTI-0005 | CASH-SETTLE-99 | Deutsche Bank AG | Cross-Border Rail |

Beyond financial flows, the framework also defines how different system components interact through defined `role` assignments. When a `schemaorg` entity, such as a `GraphQLEndpoint` or an `AzureBlobStorage` resource, is evaluated or reviewed, it assumes a specific `role` relative to the target. An entity might act as the `owner` of a `Service` target, bearing full responsibility for its configuration, or it might serve as a `contributor` to a `SoftwareApplication`, providing specific data or functionality without assuming primary control. This role-based relationship model, exemplified by targets like `TARG-0003` or `TARG-0004`, clarifies accountability and access rights within the system. By explicitly documenting whether a component is an owner or a contributor, the framework prevents ambiguity in system governance and ensures that every interaction between software applications, services, and data endpoints is properly authorized and tracked.

**t_schemaorg_review_target**

| id | schemaorg |
| --- | --- |
| TARG-0001 | SoftwareApplication |
| TARG-0002 | Person |
| TARG-0003 | Service |
| TARG-0004 | Service |
| TARG-0005 | Service |
| TARG-0006 | Person |

**t_schemaorg_review_target_reviews_item**

| id | reviews_item |
| --- | --- |
| TARG-0001 | GraphQLEndpoint |
| TARG-0002 | AzureBlobStorage |
| TARG-0003 | AzureBlobStorage |
| TARG-0004 | PostgreSQLTable |
| TARG-0005 | AzureBlobStorage |
| TARG-0006 | GraphQLEndpoint |

**t_schemaorg_review_target__reviews_item**

| id | schemaorg_id | reviews_item_id | role |
| --- | --- | --- | --- |
| TARG-0001 | TARG-0003 | TARG-0003 | owner |
| TARG-0002 | TARG-0004 | TARG-0003 | contributor |
| TARG-0003 | TARG-0006 | TARG-0006 | contributor |
| TARG-0004 | TARG-0005 | TARG-0001 | owner |
| TARG-0005 | TARG-0005 | TARG-0005 | owner |
| TARG-0006 | TARG-0001 | TARG-0005 | observer |
| TARG-0007 | TARG-0005 | TARG-0004 | observer |
| TARG-0008 | TARG-0005 | TARG-0001 | contributor |