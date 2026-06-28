---
chapter_id: ch_live_policy_min_one_enforcer_570559
topic_id: 42
family: 03_directive_governance
cited_terms: ['policy_min_one_enforcer', 'transformation_min_one_input', 'cardinality_min_two_generic']
model: engine-refine
---

An identifier is a stable, machine-readable token that anchors a row within a relational table and enables unambiguous reference across tables. In the enforcement domain, identifiers such as ENFO-0001 through ENFO-0004 serve as primary keys for the policy catalogue and for the enforcement entities themselves; in the transformation domain, identifiers INPU-0001 through INPU-0004 and INPU-0005 similarly anchor transformation definitions and input datasets. The cardinality table extends this convention with identifiers GENE-0001 through GENE-0004, each encoding a constraint on how many related entities must participate. Identifiers are not merely labels — they are the join keys that make referential integrity possible, allowing a row in one table to point to a row in another without ambiguity.

**t_policy_min_one_enforcer**

| id | policy |
| --- | --- |
| ENFO-0001 | SOC 2 Type II Controls |
| ENFO-0002 | ISO 13485 QMS |
| ENFO-0003 | GDPR Compliance Framework |
| ENFO-0004 | EU AI Act Risk Management |
| ENFO-0005 | ISO 13485 QMS |
| ENFO-0006 | ISO 13485 QMS |

**t_policy_min_one_enforcer_enforced_by**

| id | enforced_by |
| --- | --- |
| ENFO-0001 | Regulatory Affairs Division |
| ENFO-0002 | Compliance Audit Board |
| ENFO-0003 | Privacy Officer |
| ENFO-0004 | Data Stewardship Council |
| ENFO-0005 | Automated Policy Engine |
| ENFO-0006 | Risk Management Committee |

**t_transformation_min_one_input**

| id | transformation |
| --- | --- |
| INPU-0001 | DataMasking |
| INPU-0002 | TimestampAlign |
| INPU-0003 | FieldEncryption |
| INPU-0004 | FieldEncryption |
| INPU-0005 | RowFiltering |
| INPU-0006 | DuplicateRemoval |

**t_transformation_min_one_input_input_dataset**

| id | input_dataset |
| --- | --- |
| INPU-0001 | NetworkTrafficLog |
| INPU-0002 | CustomerTransactions |
| INPU-0003 | NetworkTrafficLog |
| INPU-0004 | PatientRecords |
| INPU-0005 | SupplyChainEvents |
| INPU-0006 | NetworkTrafficLog |

**t_cardinality_min_two_generic**

| id | cardinality | related |
| --- | --- | --- |
| GENE-0001 | AtLeastTwo | ENFO-0003 |
| GENE-0002 | MinTwoRequired | ENFO-0001 |
| GENE-0003 | AtLeastTwo | ENFO-0002 |
| GENE-0004 | AtLeastTwo | ENFO-0004 |
| GENE-0005 | DualAssociation | ENFO-0006 |
| GENE-0006 | TwinConstraint | ENFO-0004 |

A subject is the entity that initiates or owns a relationship; it is the "from" side of a foreign-key link. In the policy-enforcement junction table, the policy_id column designates the subject of each enforcement relationship, and its values — ENFO-0005 appearing three times and ENFO-0004 once — indicate that a single policy can be enforced through multiple relationships. In the transformation-input junction table, the transformation_id column plays the same role, with values INPU-0006, INPU-0004, INPU-0003, and INPU-0001 each pointing to a specific transformation definition. The subject is always the entity whose lifecycle or definition is being extended by the relationship.

A target is the entity that receives or is referenced by the relationship; it is the "to" side of the foreign-key link. In the policy-enforcement junction, the enforced_by_id column identifies the target — the enforcement entity responsible for carrying out the policy — with values ENFO-0002, ENFO-0004, and ENFO-0003 appearing across four rows. These targets correspond to named entities in the enforcement catalogue: Regulatory Affairs Division, Compliance Audit Board, Privacy Officer, and Data Stewardship Council. In the transformation-input junction, the input_dataset_id column identifies the target dataset, with values INPU-0005, INPU-0001, and INPU-0002 referencing datasets such as NetworkTrafficLog, CustomerTransactions, and PatientRecords. The target is the entity being consumed, governed, or transformed by the subject.

A role is a semantic qualifier attached to a relationship row that describes the nature of the subject's interaction with the target. In the policy-enforcement junction, roles include contributor, observer, and owner — for example, ENFO-0001 links policy ENFO-0005 to enforcement entity ENFO-0002 with the role contributor, while ENFO-0003 links the same policy to ENFO-0004 with the role owner. This distinction matters because it captures whether an entity merely participates in enforcement, passively monitors it, or holds primary accountability. In the transformation-input junction, every row carries the role observer, indicating that each transformation treats its input dataset as a passive source rather than an active participant. The role column is what transforms a bare foreign-key link into a semantically rich relationship.

**t_transformation_min_one_input__input_dataset**

| id | transformation_id | input_dataset_id | role |
| --- | --- | --- | --- |
| INPU-0001 | INPU-0006 | INPU-0005 | observer |
| INPU-0002 | INPU-0004 | INPU-0001 | observer |
| INPU-0003 | INPU-0003 | INPU-0002 | observer |
| INPU-0004 | INPU-0001 | INPU-0004 | observer |
| INPU-0005 | INPU-0006 | INPU-0003 | reviewer |
| INPU-0006 | INPU-0003 | INPU-0001 | contributor |
| INPU-0007 | INPU-0005 | INPU-0005 | contributor |
| INPU-0008 | INPU-0003 | INPU-0005 | contributor |

Cardinality constraints govern how many targets a subject must relate to, or how many subjects must relate to a given target. The cardinality table encodes these constraints with values such as AtLeastTwo and MinTwoRequired, each tied to a specific enforcement entity through the related column. For instance, GENE-0001 asserts that ENFO-0003 (Privacy Officer) must participate in at least two relationships, while GENE-0002 asserts that ENFO-0001 (Regulatory Affairs Division) requires a minimum of two. These constraints are enforced at the application or database level and ensure that no critical entity is left with insufficient coverage. Together, identifiers, subjects, targets, roles, and cardinality form the structural vocabulary of relational data — each concept serving a distinct purpose in making relationships explicit, queryable, and semantically meaningful.

**t_policy_min_one_enforcer__enforced_by**

| id | policy_id | enforced_by_id | role |
| --- | --- | --- | --- |
| ENFO-0001 | ENFO-0005 | ENFO-0002 | contributor |
| ENFO-0002 | ENFO-0004 | ENFO-0002 | observer |
| ENFO-0003 | ENFO-0005 | ENFO-0004 | owner |
| ENFO-0004 | ENFO-0005 | ENFO-0003 | contributor |
| ENFO-0005 | ENFO-0003 | ENFO-0001 | contributor |
| ENFO-0006 | ENFO-0002 | ENFO-0004 | reviewer |
| ENFO-0007 | ENFO-0004 | ENFO-0003 | owner |
| ENFO-0008 | ENFO-0001 | ENFO-0002 | reviewer |