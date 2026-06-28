---
chapter_id: ch_live_policy_equiv_jurisdiction_and_scope_6cb549
topic_id: 128
family: 03_directive_governance
cited_terms: ['policy_equiv_jurisdiction_and_scope', 'syscall_with_return_type', 'log_with_resource_attribute']
model: engine-refine
---

Policy equivalence and jurisdictional scope are modelled through a tripartite structure that separates policy definitions from their regulatory mappings and the relationships that bind them. The principal policy table anchors each entry with an identifier such as SCOP-0001 through SCOP-0004 and a descriptive policy field capturing domains like AI Model Training, Personal Data Processing, Supply Chain Logistics, and Third Party Vendors. A companion jurisdiction table resolves each policy identifier to its applicable regulatory regime—FDA 21 CFR 11 for medical device software, the UK Information Commissioner for data protection, Industrial Control Systems for operational technology, and CCPA for California consumer privacy. These mappings are not mere lookups; they are mediated by a junction table that records the nature of each association through a role attribute, distinguishing between contributor, observer, and owner. For instance, SCOP-0001 appears as a contributor to jurisdiction SCOP-0002, an observer of SCOP-0001, and an observer of SCOP-0002, while SCOP-0002 assumes the role of owner over SCOP-0006, reflecting the asymmetric responsibilities that arise when a single policy intersects multiple regulatory frameworks.

**t_policy_equiv_jurisdiction_and_scope**

| id | policy |
| --- | --- |
| SCOP-0001 | AI Model Training |
| SCOP-0002 | Personal Data Processing |
| SCOP-0003 | Supply Chain Logistics |
| SCOP-0004 | Third Party Vendors |
| SCOP-0005 | Cross Border Transfers |
| SCOP-0006 | European Commission |

**t_policy_equiv_jurisdiction_and_scope_jurisdiction**

| id | jurisdiction |
| --- | --- |
| SCOP-0001 | FDA 21 CFR 11 |
| SCOP-0002 | UK Information Commissioner |
| SCOP-0003 | Industrial Control Systems |
| SCOP-0004 | CCPA |
| SCOP-0005 | UK Information Commissioner |
| SCOP-0006 | National Institute of Standards |

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

**t_policy_equiv_jurisdiction_and_scope_governs_scope**

| id | governs_scope |
| --- | --- |
| SCOP-0001 | Basel III |
| SCOP-0002 | CCPA |
| SCOP-0003 | Massachusetts Privacy Board |
| SCOP-0004 | NIST 800-53 |
| SCOP-0005 | EU AI Act |
| SCOP-0006 | EU AI Act |
| SCOP-0007 | Securities Exchange Commission |

Governing scope introduces a parallel dimension of compliance obligation, decoupled from jurisdiction but equally structured. A dedicated scope table enumerates frameworks such as Basel III, CCPA, Massachusetts Privacy Board, and NIST 800-53, each linked to policies through a second junction table that carries both a role and a cardinality_note. The cardinality notes—Cardinality Note 01 through Cardinality Note 04—serve as explicit annotations on the multiplicity of relationships, ensuring that the data model captures whether a policy governs a scope in a one-to-one, one-to-many, or many-to-many fashion. Within this structure, SCOP-0003 contributes to scope SCOP-0003, SCOP-0004 contributes to SCOP-0007, SCOP-0005 observes SCOP-0002, and SCOP-0002 reviews SCOP-0002, demonstrating that the same identifier can occupy distinct relational positions across different scope associations. The role attribute here takes on values of contributor, observer, and reviewer, each signalling a different degree of regulatory accountability.

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

System call type definitions operate under a parallel logic of classification and verification, anchoring low-level operational behaviour to deterministic metadata. The syscall table records identifiers such as TYPE-0001 through TYPE-0004 alongside the actual system call—recvfrom, openat, write, sendto—and its return type, which ranges from int64_t and long to size_t and pid_t. Each entry carries a checksum_algo field that specifies the integrity verification method, with sha1, md5, and crc32 appearing across the dataset, and a code field that provides an internal reference such as C-07 or B-12. The repetition of md5 across multiple entries and the recurrence of C-07 as a code value indicate that these are not unique per-row attributes but rather shared classification keys that enable aggregation and cross-referencing across the operational telemetry pipeline.

**t_syscall_with_return_type**

| id | syscall | return_type | checksum_algo | code |
| --- | --- | --- | --- | --- |
| TYPE-0001 | recvfrom | int64_t | sha1 | C-07 |
| TYPE-0002 | openat | long | md5 | B-12 |
| TYPE-0003 | write | size_t | crc32 | C-07 |
| TYPE-0004 | sendto | pid_t | md5 | C-07 |
| TYPE-0005 | connect | int | blake2b | C-07 |
| TYPE-0006 | mmap | size_t | sha1 | A-01 |
| TYPE-0007 | sendto | long | md5 | D-33 |
| TYPE-0008 | accept | int | crc32 | B-12 |

Resource attribute logging completes the evidentiary chain by capturing the volumetric and versioned state of tracked attributes over time. The fact_log table functions as a grain-level record, each row identified by an id such as ATTR-0001 through ATTR-0004, linked to a resource_attribute_key that itself references the dimension table, and annotated with a size_bytes value that reaches into the hundreds of millions—913386183, 303816232, 758542341, 442933768—and a version number that steps through 2, 6, and 7. The dimension table, dim_resource_attribute, provides the human-readable label and category for each attribute key, with entries like Resource Attribute Label 01 through Resource Attribute Label 04 mapped to corresponding categories from Resource Attribute Category 01 through Resource Attribute Category 04. The fact_log's resource_attribute_key column points back to the dimension's id, establishing a star-schema relationship where the fact table holds the quantitative measurements and the dimension table supplies the semantic context.

**fact_log**

| id | resource_attribute_key | size_bytes | version |
| --- | --- | --- | --- |
| ATTR-0001 | ATTR-0005 | 913386183 | 6 |
| ATTR-0002 | ATTR-0006 | 303816232 | 7 |
| ATTR-0003 | ATTR-0001 | 758542341 | 7 |
| ATTR-0004 | ATTR-0001 | 442933768 | 2 |

**dim_resource_attribute**

| id | resource_attribute_label | resource_attribute_category |
| --- | --- | --- |
| ATTR-0001 | Resource Attribute Label 01 | Resource Attribute Category 01 |
| ATTR-0002 | Resource Attribute Label 02 | Resource Attribute Category 02 |
| ATTR-0003 | Resource Attribute Label 03 | Resource Attribute Category 03 |
| ATTR-0004 | Resource Attribute Label 04 | Resource Attribute Category 04 |
| ATTR-0005 | Resource Attribute Label 05 | Resource Attribute Category 05 |
| ATTR-0006 | Resource Attribute Label 06 | Resource Attribute Category 06 |

Across all four structural clusters, the data model enforces a consistent pattern: every entity carries an identifier that serves as the primary key, relationships are expressed through explicit junction tables rather than implicit foreign keys, and the role attribute recurs as a mechanism for encoding the nature of each association—whether contributor, observer, owner, or reviewer. The cardinality_note field in the governing scope junction table adds an additional layer of metadata that captures relationship multiplicity, while the checksum_algo and size_bytes fields in the operational tables provide integrity and volumetric anchors respectively. This architecture ensures that policy equivalence, jurisdictional scope, system call behaviour, and resource attribute telemetry can all be queried, audited, and correlated within a single coherent framework.