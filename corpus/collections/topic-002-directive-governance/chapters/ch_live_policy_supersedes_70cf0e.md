---
chapter_id: ch_live_policy_supersedes_70cf0e
topic_id: 2
family: 03_directive_governance
cited_terms: ['policy_supersedes', 'policy_with_jurisdiction', 'policy_with_review_cycle']
model: engine-refine
---

In a robust governance framework, every regulatory instrument is anchored by a unique identifier, such as `SUPE-0001` or `CYCL-0001`, which serves as the immutable reference point for audit trails and compliance reporting. These identifiers govern the lifecycle of policies ranging from Federal Trade Commission directives to International Organization for Standardization standards. A critical component of this lifecycle is the review cycle, quantified in days to ensure continuous adherence. For instance, the legacy vendor checklist under the Federal Trade Commission requires a review every 262 days, whereas the International Organization for Standardization standard mandates a significantly longer 716-day interval. This temporal granularity ensures that high-risk policies are scrutinized frequently, while broader standards undergo less frequent but equally rigorous evaluation.

The operational scope of a policy is further defined by its jurisdictional mapping, which links specific regulatory instruments to their governing authorities. Through the use of an entity identifier, such as `JURI-0001`, the framework establishes a precise relationship between a policy—like the Backup Retention Policy—and its overseeing body, such as the Office of the Information Commissioner. This entity-centric approach allows for granular tracking of compliance obligations, ensuring that every policy is explicitly tied to a recognized jurisdiction, whether it be the European Union for GDPR compliance or a Privacy Impact Assessment framework. By maintaining this distinct entity linkage, organizations can rapidly isolate which policies fall under specific regulatory purviews and assess their current standing.

**t_policy_supersedes**

| id | policy | supersedes | review_cycle_days | language |
| --- | --- | --- | --- | --- |
| SUPE-0001 | Federal Trade Commission | Legacy Vendor Checklist | 262 | es |
| SUPE-0002 | California Attorney General | Legacy Data Handling | 131 | es |
| SUPE-0003 | International Organization for Standardization | Legacy Vendor Checklist | 716 | es |
| SUPE-0004 | NIST CSF | Draft Audit Logging | 336 | es |

**t_policy_with_jurisdiction**

| id | policy | jurisdiction |
| --- | --- | --- |
| JURI-0001 | Backup Retention Policy | Office of the Information Commissioner |
| JURI-0002 | Enterprise Data Classification | International Organization for Standardization |
| JURI-0003 | Incident Response Protocol | Privacy Impact Assessment |
| JURI-0004 | GDPR | European Union |
| JURI-0005 | General Data Protection Authority | PCI DSS |
| JURI-0006 | National Institute of Standards | EU Data Act |

To capture the nuanced metadata required for compliance, the system employs a flexible attribute model where each policy entity is enriched with specific attributes and their corresponding data types. Attributes such as `effective_date`, `enforcement`, `mandatory`, and `priority` are strictly typed to maintain data integrity across the governance repository. For example, an `effective_date` attribute is enforced as an `xsd:date` type, storing precise implementation milestones like `2023-11-22` or `2024-05-18`. Similarly, boolean flags for mandatory compliance are validated against the `xsd:boolean` type, recording values such as `true` or `false` to indicate whether a specific jurisdictional requirement is active. This typed attribute structure prevents data corruption and ensures that compliance reports accurately reflect the current state of regulatory enforcement.

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

Beyond dates and boolean flags, the attribute model accommodates integer and string-based miscellaneous values to provide deeper operational context. Integer attributes, validated as `xsd:integer`, are utilized to assign quantitative metrics such as priority levels or retention thresholds; for instance, a policy entity might be assigned a priority value of `326` or a retention count of `4`. String attributes, stored as `xsd:string`, capture descriptive metadata, including procedural directives like `Encoding 01` or `intake form`, as well as language codes such as `ja` or `es`. This multi-format attribute storage allows the governance framework to handle a wide spectrum of compliance data, from rigid numerical thresholds to free-text procedural instructions, all within a unified schema.

The final layer of governance is defined by the organizational scope and linguistic parameters that dictate where and how a policy is applied. The scope attribute delineates the boundary of a policy's authority, distinguishing between `local` directives, `team`-level protocols, and `regional` mandates enforced by bodies like the Department of Homeland Security. Concurrently, the language attribute ensures that policies are accessible to the appropriate workforce, with records indicating operational languages such as `fr` for French-speaking regions or `ja` for Japanese operations. By integrating scope, language, and review cycles into a single cohesive framework, the organization ensures that every policy—from annual encryption key rotations to fiscal-year enterprise data classifications—is not only compliant but also contextually relevant to the specific operational environment in which it resides.

**t_policy_with_review_cycle**

| id | policy | review_cycle | scope | language |
| --- | --- | --- | --- | --- |
| CYCL-0001 | National Institute of Standards | annual | local | ja |
| CYCL-0002 | Encryption Key Rotation | fiscal-year | team | ja |
| CYCL-0003 | Federal Trade Commission | semi-annual | regional | fr |
| CYCL-0004 | Department of Homeland Security | fiscal-year | regional | ja |
| CYCL-0005 | Data Residency Rule | quarterly | global | ja |
| CYCL-0006 | NIST CSF | continuous | global | fr |
| CYCL-0007 | Department of Homeland Security | continuous | global | ja |
| CYCL-0008 | Federal Trade Commission | monthly | local | ja |