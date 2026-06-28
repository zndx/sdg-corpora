---
chapter_id: ch_live_identifier_subclass_425448
topic_id: 146
family: 01_foundation
cited_terms: ['identifier_subclass', 'allocation_with_output_facets', 'policy_only_governs_artifacts']
model: engine-refine
---

Identifier systems serve as the foundational mechanism by which discrete entities—artifacts, resources, records—are rendered addressable across distributed environments. Each identifier carries a structured code, whether in the form of HANDLE-1234/5678, SEQ-NF2024, SN-8842XJ, or ACCN-GSM7829104, and is bound to one or more target entities such as ARTI-0002, ARTI-0005, or ARTI-0006. The binding is not merely symbolic; it is governed by a schema of attributes that define the identifier's operational properties. Attributes such as checksum_algo, code, format, and issued_date are declared with explicit types—xsd:string for textual descriptors like Checksum Algo 01, B-12, Encoding 03, and JSON, and xsd:date for temporal metadata including 2023-11-13, 2024-05-25, 2024-09-11, and 2025-05-27. This typed attribute framework ensures that identifier metadata is machine-readable, versionable, and enforceable across system boundaries.

**t_identifier_subclass**

| id | identifier | identifies |
| --- | --- | --- |
| IDEN-0001 | HANDLE-1234/5678 | ARTI-0002 |
| IDEN-0002 | SEQ-NF2024 | ARTI-0006 |
| IDEN-0003 | SN-8842XJ | ARTI-0005 |
| IDEN-0004 | ACCN-GSM7829104 | ARTI-0002 |
| IDEN-0005 | RUN-20231105 | ARTI-0003 |
| IDEN-0006 | GUID-f47ac10b | ARTI-0001 |
| IDEN-0007 | DOI-10.1234/abc | ARTI-0003 |

**t_identifier_subclass_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| IDEN-0001 | checksum_algo | xsd:string |
| IDEN-0002 | code | xsd:string |
| IDEN-0003 | format | xsd:string |
| IDEN-0004 | issued_date | xsd:date |
| IDEN-0005 | namespace | xsd:string |
| IDEN-0006 | encoding | xsd:string |
| IDEN-0007 | label_text | xsd:string |
| IDEN-0008 | language | xsd:string |

The attribute values are stored in a normalized, entity-attribute-value pattern that decouples the definition of what an attribute is from the actual value it holds. Date-valued attributes such as issued_date are persisted in a dedicated value table keyed by the identifier, the entity to which the attribute belongs, and the attribute definition itself. String-valued attributes follow the same structural discipline, allowing a single identifier to carry multiple heterogeneous properties without schema drift. This design supports extensibility: new attribute types can be introduced without altering existing tables, and values can be audited, versioned, or revoked independently of the identifier to which they are attached.

**t_identifier_subclass_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| IDEN-0001 | IDEN-0001 | IDEN-0004 | 2023-11-13 |
| IDEN-0002 | IDEN-0002 | IDEN-0004 | 2024-05-25 |
| IDEN-0003 | IDEN-0003 | IDEN-0004 | 2024-09-11 |
| IDEN-0004 | IDEN-0004 | IDEN-0004 | 2025-05-27 |
| IDEN-0005 | IDEN-0005 | IDEN-0004 | 2023-08-09 |
| IDEN-0006 | IDEN-0006 | IDEN-0004 | 2023-03-27 |
| IDEN-0007 | IDEN-0007 | IDEN-0004 | 2023-01-25 |

**t_identifier_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| IDEN-0001 | IDEN-0001 | IDEN-0001 | Checksum Algo 01 |
| IDEN-0002 | IDEN-0001 | IDEN-0002 | B-12 |
| IDEN-0003 | IDEN-0001 | IDEN-0006 | Encoding 03 |
| IDEN-0004 | IDEN-0001 | IDEN-0003 | JSON |
| IDEN-0005 | IDEN-0001 | IDEN-0007 | pre-release note |
| IDEN-0006 | IDEN-0001 | IDEN-0008 | es |
| IDEN-0007 | IDEN-0001 | IDEN-0005 | Namespace 07 |
| IDEN-0008 | IDEN-0002 | IDEN-0001 | Checksum Algo 08 |

Beyond identification, the system governs how resources are allocated and where they execute. Allocation records bind a named allocation—Telemetry buffer lease, Cloud VM instance pool, Kubernetes pod allocation, API rate limit tier—to an output facet, which describes the observable output or metric produced: Storage usage metric, Data quality score, Telemetry timestamp stream, Lab sample ID registry. Each allocation is pinned to a specific hostname, such as node-a01 or node-b14, establishing a deterministic mapping between logical resource claims and physical or virtual execution targets. The status field—running or pending—provides a real-time signal of allocation state, enabling orchestration systems to track readiness, detect stalled assignments, and trigger remediation workflows.

**t_allocation_with_output_facets**

| id | allocation | output_facet | host_name | status |
| --- | --- | --- | --- | --- |
| FACE-0001 | Telemetry buffer lease | Storage usage metric | node-a01 | running |
| FACE-0002 | Cloud VM instance pool | Data quality score | node-b14 | pending |
| FACE-0003 | Kubernetes pod allocation | Telemetry timestamp stream | node-a01 | running |
| FACE-0004 | API rate limit tier | Lab sample ID registry | node-a01 | pending |
| FACE-0005 | Batch ingest pipeline | Lab sample ID registry | edge-03 | failed |
| FACE-0006 | Cloud VM instance pool | API response latency | gw-12 | pending |
| FACE-0007 | Data lake partition write | Network throughput counter | gw-12 | failed |

Governance over these identifiers and allocations is enforced through a policy framework that assigns each artifact a policy, an enforcement mode, and a priority level. Policies such as Data Retention Policy, Access Control Policy, Privacy Compliance Policy, and Immutable Audit Policy are applied with varying degrees of strictness: blocking enforcement prevents non-compliant operations outright, advisory enforcement logs violations without halting execution, and deprecated enforcement signals that a policy is being phased out. Priority values ranging from 1 to 5 determine resolution order when multiple policies apply to the same artifact, ensuring that the most critical constraints—such as Privacy Compliance Policy at priority 1—take precedence over lower-priority directives. This layered enforcement model allows organizations to maintain granular control over identifier lifecycle and resource allocation while preserving the flexibility to adapt policies as regulatory or operational requirements evolve.

**t_policy_only_governs_artifacts**

| id | policy | enforcement | priority |
| --- | --- | --- | --- |
| ARTI-0001 | Data Retention Policy | blocking | 2 |
| ARTI-0002 | Access Control Policy | advisory | 4 |
| ARTI-0003 | Privacy Compliance Policy | deprecated | 1 |
| ARTI-0004 | Immutable Audit Policy | advisory | 5 |
| ARTI-0005 | Provenance Tracking Policy | deprecated | 5 |
| ARTI-0006 | Access Control Policy | mandatory | 1 |