---
chapter_id: ch_live_control_with_owner_b1797f
topic_id: 129
family: 03_directive_governance
cited_terms: ['control_with_owner', 'policy_with_review_cycle', 'verification_with_method']
model: engine-refine
---

In governance frameworks that track compliance obligations, the identifier serves as the immutable primary key for every entity under management—whether that entity is a control such as a Vendor Risk Assessment or a Data Retention Policy, a verification method like Certificate chain verification or Static code analysis, or a policy instrument including FedRAMP, NIST SP 800-53, CCPA, and SOC 2 Type II. These identifiers, formatted as OWNE-0001 through OWNE-0004 for controls, CYCL-0001 through CYCL-0004 for policy review cycles, and METH-0001 through METH-0006 for verification relationships, provide the structural backbone against which all attribute values and cross-references are anchored. The control table itself establishes the baseline registry of governance artifacts, each row representing a discrete compliance requirement that must be evaluated, monitored, and reported upon.

**t_control_with_owner**

| id | control |
| --- | --- |
| OWNE-0001 | Vendor Risk Assessment |
| OWNE-0002 | Data Retention Policy |
| OWNE-0003 | Vendor Risk Assessment |
| OWNE-0004 | Data Retention Policy |
| OWNE-0005 | Password Complexity Policy |
| OWNE-0006 | MFA Enforcement |
| OWNE-0007 | Data Retention Policy |

**t_control_with_owner_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| OWNE-0001 | effective_date | xsd:date |
| OWNE-0002 | enforcement | xsd:string |
| OWNE-0003 | mandatory | xsd:boolean |
| OWNE-0004 | priority | xsd:integer |
| OWNE-0005 | review_cycle_days | xsd:integer |
| OWNE-0006 | scope | xsd:string |
| OWNE-0007 | encoding | xsd:string |
| OWNE-0008 | label_text | xsd:string |

**t_control_with_owner_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OWNE-0001 | OWNE-0001 | OWNE-0003 | true |
| OWNE-0002 | OWNE-0002 | OWNE-0003 | true |
| OWNE-0003 | OWNE-0003 | OWNE-0003 | false |
| OWNE-0004 | OWNE-0004 | OWNE-0003 | true |
| OWNE-0005 | OWNE-0005 | OWNE-0003 | true |
| OWNE-0006 | OWNE-0006 | OWNE-0003 | true |
| OWNE-0007 | OWNE-0007 | OWNE-0003 | true |

**t_control_with_owner_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OWNE-0001 | OWNE-0001 | OWNE-0001 | 2024-04-04 |
| OWNE-0002 | OWNE-0002 | OWNE-0001 | 2025-04-01 |
| OWNE-0003 | OWNE-0003 | OWNE-0001 | 2025-05-22 |
| OWNE-0004 | OWNE-0004 | OWNE-0001 | 2024-09-08 |
| OWNE-0005 | OWNE-0005 | OWNE-0001 | 2023-05-30 |
| OWNE-0006 | OWNE-0006 | OWNE-0001 | 2023-06-07 |
| OWNE-0007 | OWNE-0007 | OWNE-0001 | 2025-03-19 |

**t_control_with_owner_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OWNE-0001 | OWNE-0001 | OWNE-0004 | 4 |
| OWNE-0002 | OWNE-0001 | OWNE-0005 | 806 |
| OWNE-0003 | OWNE-0002 | OWNE-0004 | 5 |
| OWNE-0004 | OWNE-0002 | OWNE-0005 | 150 |
| OWNE-0005 | OWNE-0003 | OWNE-0004 | 1 |
| OWNE-0006 | OWNE-0003 | OWNE-0005 | 596 |
| OWNE-0007 | OWNE-0004 | OWNE-0004 | 2 |
| OWNE-0008 | OWNE-0004 | OWNE-0005 | 663 |

**t_control_with_owner_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OWNE-0001 | OWNE-0001 | OWNE-0007 | Encoding 01 |
| OWNE-0002 | OWNE-0001 | OWNE-0002 | Enforcement 02 |
| OWNE-0003 | OWNE-0001 | OWNE-0008 | change rationale |
| OWNE-0004 | OWNE-0001 | OWNE-0009 | es |
| OWNE-0005 | OWNE-0001 | OWNE-0006 | Scope 05 |
| OWNE-0006 | OWNE-0002 | OWNE-0007 | Encoding 06 |
| OWNE-0007 | OWNE-0002 | OWNE-0002 | Enforcement 07 |
| OWNE-0008 | OWNE-0002 | OWNE-0008 | intake form |

**t_verification_with_method**

| id | verification |
| --- | --- |
| METH-0001 | Certificate chain verification |
| METH-0002 | Model accuracy assessment |
| METH-0003 | Test suite execution |
| METH-0004 | Static code analysis |
| METH-0005 | Data quality audit |
| METH-0006 | Certificate chain verification |

**t_verification_with_method_via_verification_method**

| id | via_verification_method |
| --- | --- |
| METH-0001 | SHA-256 hashing |
| METH-0002 | ISO 27001 audit |
| METH-0003 | PCI DSS compliance scan |
| METH-0004 | Kubernetes liveness probe |
| METH-0005 | SHA-256 hashing |
| METH-0006 | JSON Schema validation |

Attributes and their types form the dimensional layer that gives these entities operational meaning. The attribute registry defines properties such as effective_date, enforcement, mandatory, and priority, each bound to a specific data type—xsd:date for temporal constraints, xsd:string for free-form text, xsd:boolean for binary flags, and xsd:integer for numeric rankings. This type discipline is enforced through a value-normalization pattern: boolean values like true and false are stored in a dedicated type-specific table, date values such as 2024-04-04, 2025-04-01, 2025-05-22, and 2024-09-08 in another, integer values including 4, 806, 5, and 150 in a third, and string values like Encoding 01, Enforcement 02, change rationale, and es in a fourth. The entity_id column in each value table binds the attribute value back to the governing entity, creating an entity-attribute-value model that supports an open-ended set of properties without requiring schema changes as new compliance dimensions are introduced.

Scope and language operate as classification dimensions that qualify the applicability and linguistic context of policy instruments. The scope attribute distinguishes between local, team, and regional tiers of governance coverage, indicating whether a policy such as FedRAMP with its annual review cycle applies at the organizational perimeter, within a specific team's domain, or across a regional jurisdiction. Similarly, the language attribute records the operative language of the policy document—ja for Japanese-language policies governing FedRAMP and NIST SP 800-53 implementations, fr for French-language documentation associated with CCPA compliance—ensuring that the correct version is referenced during audits and that multilingual organizations can maintain parallel policy registries without ambiguity.

**t_policy_with_review_cycle**

| id | policy | review_cycle | scope | language |
| --- | --- | --- | --- | --- |
| CYCL-0001 | FedRAMP | annual | local | ja |
| CYCL-0002 | NIST SP 800-53 | fiscal-year | team | ja |
| CYCL-0003 | CCPA | semi-annual | regional | fr |
| CYCL-0004 | SOC 2 Type II | fiscal-year | regional | ja |
| CYCL-0005 | GDPR | quarterly | global | ja |
| CYCL-0006 | FedRAMP | continuous | global | fr |
| CYCL-0007 | SOC 2 Type II | continuous | global | ja |
| CYCL-0008 | CCPA | monthly | local | ja |

The relationship between verification methods and their supporting techniques is modeled through a subject-target-role triad that captures not merely which verification method connects to which technique, but the nature of that connection. The subject column identifies the verification method being performed—METH-0005, METH-0004, METH-0003, METH-0006—while the target column identifies the via_verification_method that enables it, such as SHA-256 hashing, ISO 27001 audit, PCI DSS compliance scan, or Kubernetes liveness probe. The role column then qualifies the relationship, assigning each participant a function such as reviewer, contributor, owner, or observer. This three-column junction table thus encodes a directed graph of verification dependencies where the same technique can serve multiple verification methods in different capacities, and the same verification method can employ multiple techniques, each with its own assigned role.

**t_verification_with_method__via_verification_method**

| id | verification_id | via_verification_method_id | role |
| --- | --- | --- | --- |
| METH-0001 | METH-0005 | METH-0004 | reviewer |
| METH-0002 | METH-0004 | METH-0006 | contributor |
| METH-0003 | METH-0003 | METH-0002 | owner |
| METH-0004 | METH-0006 | METH-0006 | observer |
| METH-0005 | METH-0004 | METH-0004 | contributor |
| METH-0006 | METH-0002 | METH-0002 | owner |
| METH-0007 | METH-0001 | METH-0003 | contributor |
| METH-0008 | METH-0003 | METH-0005 | observer |