---
chapter_id: ch_live_policy_effective_period_24e25d
topic_id: 128
family: 01_foundation
cited_terms: ['policy_effective_period', 'policy_enforced_by', 'policy_equiv_jurisdiction_and_scope']
model: engine-refine
---

In any relational schema governing policy compliance, the identifier serves as the immutable anchor of every entity, a stable key that survives the churn of descriptive attributes and structural refactoring alike. Within the enforcement registry, identifiers such as ENFO-0001 through ENFO-0004 uniquely distinguish the enforcement mechanisms—Personal Data Processing, Third Party Vendors, UK Information Commissioner, and NIST Zero Trust—while the period registry employs a parallel convention, PERI-0001 through PERI-0004, to tag effective periods for policies ranging from FINRA Record Retention to SOC2 Access Control. These identifiers are not merely labels; they are the foreign keys that stitch together the otherwise siloed dimensions of policy, enforcement, jurisdiction, and scope, ensuring that every relationship in the model can be traced back to a single, unambiguous record.

**t_policy_effective_period**

| id | policy | effective_during | scope | language |
| --- | --- | --- | --- | --- |
| PERI-0001 | FINRA Record Retention | ENFO-0003 | local | es |
| PERI-0002 | Massachusetts Privacy Board | ENFO-0006 | local | es |
| PERI-0003 | SOC2 Access Control | ENFO-0001 | global | fr |
| PERI-0004 | CCPA Data Deletion | ENFO-0005 | team | es |
| PERI-0005 | FDA 21 CFR 11 | ENFO-0004 | team | es |

**t_policy_enforced_by**

| id | policy |
| --- | --- |
| ENFO-0001 | Personal Data Processing |
| ENFO-0002 | Third Party Vendors |
| ENFO-0003 | UK Information Commissioner |
| ENFO-0004 | NIST Zero Trust |
| ENFO-0005 | NIST Zero Trust |
| ENFO-0006 | HIPAA |

**t_policy_enforced_by_enforced_by**

| id | enforced_by |
| --- | --- |
| ENFO-0001 | Splunk SIEM |
| ENFO-0002 | ISO Audit Board |
| ENFO-0003 | AWS Config Rules |
| ENFO-0004 | AWS Config Rules |
| ENFO-0005 | ISO Audit Board |
| ENFO-0006 | AWS Config Rules |

**t_policy_equiv_jurisdiction_and_scope**

| id | policy |
| --- | --- |
| SCOP-0001 | Basel III |
| SCOP-0002 | Massachusetts Privacy Board |
| SCOP-0003 | FINRA Record Retention |
| SCOP-0004 | GDPR Data Handling |
| SCOP-0005 | Securities Exchange Commission |
| SCOP-0006 | UK Information Commissioner |

**t_policy_equiv_jurisdiction_and_scope_jurisdiction**

| id | jurisdiction |
| --- | --- |
| SCOP-0001 | GDPR |
| SCOP-0002 | Australian Privacy Commissioner |
| SCOP-0003 | SOC2 Access Control |
| SCOP-0004 | SOC 2 Type II |
| SCOP-0005 | Australian Privacy Commissioner |
| SCOP-0006 | NIST SP 800-53 |

The cardinality note occupies a distinct position within the junction tables that mediate many-to-many relationships, explicitly declaring the constraints under which a subject entity relates to its target. In the table linking policy equivalents to the operational scopes they govern, each row carries a cardinality note—Cardinality Note 01 through Cardinality Note 04—that qualifies the nature of the association between a source policy and the scope it governs. These notes are not decorative; they encode the semantic weight of the relationship, distinguishing whether a policy contributes to a scope, observes it, or exercises reviewer authority over it. The presence of such annotations in the junction table between policies and governed scopes signals a deliberate design choice to make relationship multiplicity and intent explicit rather than implicit in the schema structure alone.

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

Role functions as the relational glue that specifies the capacity in which a subject entity engages with a target entity, transforming a bare foreign-key link into a semantically rich association. In the enforcement junction table, the same enforcement identifier ENFO-0001 appears with the role reviewer when linked to one policy and with the role owner when linked to another, demonstrating that role is not a property of the entity itself but of the relationship between entities. Similarly, in the jurisdictional equivalence table, the role column distinguishes between contributor, observer, and owner designations, allowing a single policy such as SCOP-0001 to participate in multiple jurisdictional relationships simultaneously, each with a different capacity. This role-based modeling avoids the need for redundant entity duplication and instead captures the multidimensional nature of compliance obligations.

**t_policy_enforced_by__enforced_by**

| id | policy_id | enforced_by_id | role |
| --- | --- | --- | --- |
| ENFO-0001 | ENFO-0001 | ENFO-0003 | observer |
| ENFO-0002 | ENFO-0002 | ENFO-0006 | observer |
| ENFO-0003 | ENFO-0003 | ENFO-0001 | reviewer |
| ENFO-0004 | ENFO-0006 | ENFO-0001 | owner |
| ENFO-0005 | ENFO-0002 | ENFO-0005 | reviewer |
| ENFO-0006 | ENFO-0001 | ENFO-0003 | observer |
| ENFO-0007 | ENFO-0003 | ENFO-0001 | contributor |
| ENFO-0008 | ENFO-0004 | ENFO-0006 | reviewer |

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

Scope and language operate as descriptive attributes that qualify the applicability and communicative context of policy records rather than mediating relationships between entities. The scope column in the effective period table classifies each policy period as local, global, or team, providing an immediate signal of the geographic or organizational breadth of the regulation—Massachusetts Privacy Board and FINRA Record Retention both carry a local scope, while SOC2 Access Control is marked global. Language, similarly, is an attribute of the policy period record itself, with values such as es and fr indicating the linguistic register in which the policy documentation is maintained. These attributes do not create joins; they annotate the entities they belong to, enabling filtering and aggregation without altering the relational topology of the schema.

Subject and target are the directional endpoints of every foreign-key relationship, defining the flow of reference from the entity that initiates the link to the entity it references. In the junction table connecting policies to their enforcement mechanisms, the policy_id column acts as the subject—the entity that requires enforcement—while enforced_by_id serves as the target, the mechanism through which enforcement is realized. This subject-to-target directionality is consistent across all junction tables: the policy_equiv_jurisdiction_and_scope__jurisdiction table links policy_id (subject) to jurisdiction_id (target), and the policy_equiv_jurisdiction_and_scope__governs_scope table links policy_id (subject) to governs_scope_id (target). Understanding this directional convention is essential for constructing correct queries and for reasoning about the dependency graph that underlies the entire compliance model.

**t_policy_equiv_jurisdiction_and_scope_governs_scope**

| id | governs_scope |
| --- | --- |
| SCOP-0001 | NIST 800-53 |
| SCOP-0002 | PCI-DSS Tokenization |
| SCOP-0003 | PCI DSS v4.0 |
| SCOP-0004 | Supply Chain Logistics |
| SCOP-0005 | Securities Exchange Commission |
| SCOP-0006 | Securities Exchange Commission |
| SCOP-0007 | NIST SP 800-53 |