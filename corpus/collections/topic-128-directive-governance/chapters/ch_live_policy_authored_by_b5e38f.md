---
chapter_id: ch_live_policy_authored_by_b5e38f
topic_id: 128
family: 01_foundation
cited_terms: ['policy_authored_by', 'ebpfmap_with_value_type', 'policy_equiv_jurisdiction_and_scope']
model: engine-refine
---

The architecture of policy governance rests upon a disciplined taxonomy of identifiers, type maps, and relationship metadata that together enforce structural integrity across jurisdictional and regulatory boundaries. Every entity—whether a policy such as "AI Model Training" or "GDPR Data Processing," a scope like "Swiss Data Protection" or "NIST 800-53," or a governing framework including "SOX," "Basel III," and "Supply Chain Logistics"—is anchored by a unique identifier, the AUTH-0001 through AUTH-0004 series for authored policies and the SCOP-0001 through SCOP-0006 series for scopes and jurisdictions. These identifiers serve as the immutable keys through which all cross-referencing occurs, ensuring that the linkage between a policy and its authoring scope, or between a jurisdiction and its governing scope, can be resolved without ambiguity. The type map system extends this discipline: records such as TYPE-0001 through TYPE-0004 carry a `value_type_map_key` that classifies them into categories—TYPE-0002 appearing as the dominant classification across multiple records, while TYPE-0003 marks a distinct subclass—each further enriched by a human-readable label and a categorical designation, the Value Type Map Category 01 through 04 series providing the semantic grouping necessary for downstream filtering and aggregation.

**t_policy_authored_by**

| id | policy | authored_by | mandatory | encoding |
| --- | --- | --- | --- | --- |
| AUTH-0001 | AI Model Training | SCOP-0004 | false | latin1 |
| AUTH-0002 | GDPR Data Processing | SCOP-0003 | false | latin1 |
| AUTH-0003 | Third Party Vendors | SCOP-0004 | true | ascii |
| AUTH-0004 | PCI DSS Access Standards | SCOP-0006 | true | latin1 |
| AUTH-0005 | GDPR | SCOP-0003 | false | latin1 |
| AUTH-0006 | HIPAA | SCOP-0003 | false | ascii |
| AUTH-0007 | GDPR Data Processing | SCOP-0003 | true | unicode |
| AUTH-0008 | European Commission | SCOP-0003 | false | unicode |

**dim_value_type_map**

| id | value_type_map_label | value_type_map_category |
| --- | --- | --- |
| TYPE-0001 | Value Type Map Label 01 | Value Type Map Category 01 |
| TYPE-0002 | Value Type Map Label 02 | Value Type Map Category 02 |
| TYPE-0003 | Value Type Map Label 03 | Value Type Map Category 03 |
| TYPE-0004 | Value Type Map Label 04 | Value Type Map Category 04 |
| TYPE-0005 | Value Type Map Label 05 | Value Type Map Category 05 |
| TYPE-0006 | Value Type Map Label 06 | Value Type Map Category 06 |

**t_policy_equiv_jurisdiction_and_scope**

| id | policy |
| --- | --- |
| SCOP-0001 | Swiss Data Protection |
| SCOP-0002 | NIST 800-53 |
| SCOP-0003 | Securities Exchange Commission |
| SCOP-0004 | UK Information Commissioner |
| SCOP-0005 | SOX |
| SCOP-0006 | Supply Chain Logistics |

**t_policy_equiv_jurisdiction_and_scope_jurisdiction**

| id | jurisdiction |
| --- | --- |
| SCOP-0001 | CCPA Consumer Rights |
| SCOP-0002 | Medical Devices |
| SCOP-0003 | UK Information Commissioner |
| SCOP-0004 | EU AI Risk Framework |
| SCOP-0005 | Medical Devices |
| SCOP-0006 | Australian Privacy Commissioner |

**t_policy_equiv_jurisdiction_and_scope_governs_scope**

| id | governs_scope |
| --- | --- |
| SCOP-0001 | SOX |
| SCOP-0002 | Basel III |
| SCOP-0003 | Supply Chain Logistics |
| SCOP-0004 | New York Financial Services |
| SCOP-0005 | Cross Border Transfers |
| SCOP-0006 | Cross Border Transfers |
| SCOP-0007 | Medical Devices |

The relationship layer between policies and jurisdictions is mediated through a junction structure that captures not merely connectivity but the nature and direction of each association. A subject column identifies the originating policy entity—SCOP-0001, for instance, appearing repeatedly as the subject of multiple jurisdictional links—while the target column identifies the receiving jurisdiction, such as SCOP-0002 or SCOP-0006. The role attribute assigns a functional designation to each link: contributor, observer, or owner in the jurisdictional context, and contributor, observer, or reviewer in the governing-scope context. This role-based encoding of relationships means that the same policy entity can participate in multiple relationships with different functional postures; SCOP-0001, for example, assumes the role of contributor toward one jurisdiction and observer toward another, reflecting the multi-faceted nature of regulatory participation. The cardinality note column further qualifies these associations, with entries such as Cardinality Note 01 through Cardinality Note 04 providing explicit constraints on the permissible number of relationships, thereby preventing unbounded proliferation of links and enforcing data governance at the schema level.

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

Metadata attributes attached to individual records provide the operational parameters that govern how data is stored, interpreted, and versioned. The encoding attribute—latin1 and ascii in the policy authorship table—specifies the character set used for text fields, a consideration of practical importance when policies reference multilingual regulatory text such as "CCPA Consumer Rights" or "UK Information Commissioner." The ismandatory flag, taking boolean values of true or false, distinguishes between policies whose authorship is obligatory—Third Party Vendors and PCI DSS Access Standards, both marked true—and those that are not, namely AI Model Training and GDPR Data Processing, both false. This distinction carries direct compliance implications: a mandatory authorship relationship cannot be left unresolved without violating the data model's integrity constraints. The size_bytes column in the fact table records the byte footprint of type map entries, ranging from approximately 31 million bytes for TYPE-0003 to 354 million bytes for TYPE-0004, a metric relevant to storage planning and performance optimization in large-scale policy registries.

**fact_ebpfmap**

| id | value_type_map_key | size_bytes | version |
| --- | --- | --- | --- |
| TYPE-0001 | TYPE-0002 | 208979093 | 3 |
| TYPE-0002 | TYPE-0002 | 156714508 | 6 |
| TYPE-0003 | TYPE-0002 | 31105012 | 12 |
| TYPE-0004 | TYPE-0003 | 354373995 | 5 |
| TYPE-0005 | TYPE-0002 | 866267293 | 2 |

Versioning and categorization provide the temporal and semantic axes along which the policy corpus evolves. The version column in the fact table takes integer values from 3 through 12, indicating that type map records undergo iterative revision, with TYPE-0003 reaching version 12 and TYPE-0004 reaching version 5, suggesting divergent update cadences across type classifications. The dimension table for value type maps supplies the categorical scaffolding: each type map identifier maps to a label and a category, the Value Type Map Category 01 through 04 series forming a classification hierarchy that supports both analytical queries and regulatory reporting. Together, these attributes—identifier, type map, category, version, size, encoding, mandatory status, cardinality note, role, subject, target—constitute a self-describing data model in which the structure of the relationships is as rigorously defined as the data they connect, ensuring that the governance framework remains auditable, extensible, and internally consistent across all regulatory domains it encompasses.