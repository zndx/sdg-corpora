---
chapter_id: ch_live_identifier_unique_08fd57
topic_id: 7
family: 01_foundation
cited_terms: ['identifier_unique', 'allocation_completed_at', 'transformation_basic']
model: engine-refine
---

Identifier resolution, attribute typing, and role-based association form the structural backbone of a metadata governance framework designed to track data transformations, resource allocations, and provenance across distributed systems. Each transformation—whether a currency conversion, a customer deduplication routine, feature scaling, or a JSON-to-Parquet conversion—is assigned a unique identifier such as `TRAN-0001` or `TRAN-0002`, and each identifier is bound to a semantic entity that carries typed attributes. The attribute schema itself is declarative: `duration_seconds` is declared as `xsd:decimal`, `end_time` as `xsd:dateTime`, `exit_code` as `xsd:integer`, and `host_name` as `xsd:string`, establishing a rigid type contract that governs how values are stored, validated, and queried. Concrete values populate this schema across dedicated type-specific tables—`795.94` and `7139.05` for decimal attributes, `133` and `142` for integer attributes, ISO-8601 timestamps such as `2025-05-04T13:03:22` for datetime attributes, and free-form strings like `edge-03`, `Log Level 02`, `review`, and `complete` for variable-length character attributes—ensuring that type safety is enforced at the storage layer rather than deferred to application logic.

**t_allocation_completed_at**

| id | allocation |
| --- | --- |
| COMP-0001 | data-lake-partition |
| COMP-0002 | storage-tier-archival |
| COMP-0003 | data-lake-partition |
| COMP-0004 | k8s-pod-quota |
| COMP-0005 | telemetry-ingest-pipe |
| COMP-0006 | k8s-pod-quota |

**t_allocation_completed_at_completed_at**

| id | completed_at |
| --- | --- |
| COMP-0001 | 2023-10-25T22:48:55Z |
| COMP-0002 | 2024-06-30T15:05:33Z |
| COMP-0003 | 2024-04-12T09:11:08Z |
| COMP-0004 | 2023-10-25T22:48:55Z |
| COMP-0005 | 2023-08-09T19:33:47Z |
| COMP-0006 | 2023-08-09T19:33:47Z |

**t_transformation_basic**

| id | transformation |
| --- | --- |
| TRAN-0001 | Currency conversion |
| TRAN-0002 | Customer deduplication |
| TRAN-0003 | Feature scaling |
| TRAN-0004 | JSON to Parquet conversion |
| TRAN-0005 | Currency conversion |
| TRAN-0006 | Schema evolution migration |

**t_transformation_basic_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| TRAN-0001 | duration_seconds | xsd:decimal |
| TRAN-0002 | end_time | xsd:dateTime |
| TRAN-0003 | exit_code | xsd:integer |
| TRAN-0004 | host_name | xsd:string |
| TRAN-0005 | log_level | xsd:string |
| TRAN-0006 | phase | xsd:string |
| TRAN-0007 | retry_count | xsd:integer |
| TRAN-0008 | scheduled_at | xsd:dateTime |

**t_transformation_basic_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TRAN-0001 | TRAN-0001 | TRAN-0002 | 2025-05-04T13:03:22 |
| TRAN-0002 | TRAN-0001 | TRAN-0008 | 2023-11-24T00:59:19 |
| TRAN-0003 | TRAN-0001 | TRAN-0009 | 2024-10-31T22:10:22 |
| TRAN-0004 | TRAN-0002 | TRAN-0002 | 2024-05-26T15:20:00 |
| TRAN-0005 | TRAN-0002 | TRAN-0008 | 2024-04-05T04:09:32 |
| TRAN-0006 | TRAN-0002 | TRAN-0009 | 2025-06-07T09:12:29 |
| TRAN-0007 | TRAN-0003 | TRAN-0002 | 2023-11-14T02:28:35 |
| TRAN-0008 | TRAN-0003 | TRAN-0008 | 2023-01-21T02:20:55 |

**t_transformation_basic_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TRAN-0001 | TRAN-0001 | TRAN-0001 | 795.94 |
| TRAN-0002 | TRAN-0002 | TRAN-0001 | 7139.05 |
| TRAN-0003 | TRAN-0003 | TRAN-0001 | 5074.97 |
| TRAN-0004 | TRAN-0004 | TRAN-0001 | 6971.76 |
| TRAN-0005 | TRAN-0005 | TRAN-0001 | 5283.27 |
| TRAN-0006 | TRAN-0006 | TRAN-0001 | 1285.62 |

**t_transformation_basic_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TRAN-0001 | TRAN-0001 | TRAN-0003 | 133 |
| TRAN-0002 | TRAN-0001 | TRAN-0007 | 93 |
| TRAN-0003 | TRAN-0002 | TRAN-0003 | 142 |
| TRAN-0004 | TRAN-0002 | TRAN-0007 | 123 |
| TRAN-0005 | TRAN-0003 | TRAN-0003 | 502 |
| TRAN-0006 | TRAN-0003 | TRAN-0007 | 13 |
| TRAN-0007 | TRAN-0004 | TRAN-0003 | 896 |
| TRAN-0008 | TRAN-0004 | TRAN-0007 | 153 |

**t_transformation_basic_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TRAN-0001 | TRAN-0001 | TRAN-0004 | edge-03 |
| TRAN-0002 | TRAN-0001 | TRAN-0005 | Log Level 02 |
| TRAN-0003 | TRAN-0001 | TRAN-0006 | review |
| TRAN-0004 | TRAN-0001 | TRAN-0010 | complete |
| TRAN-0005 | TRAN-0001 | TRAN-0011 | Triggered By 05 |
| TRAN-0006 | TRAN-0002 | TRAN-0004 | edge-03 |
| TRAN-0007 | TRAN-0002 | TRAN-0005 | Log Level 07 |
| TRAN-0008 | TRAN-0002 | TRAN-0006 | initiation |

Identifier uniqueness extends beyond transformation metadata into the broader provenance ecosystem, where external identifiers such as `10.1038/s41586-023-06123` and `W3C-DOI:10.1002/anie.202112345` are registered alongside their target referents—the FDA 510(k) Database, the OSMnx Graph Library, RefSeq Genome Assembly, and CERN Telemetry Stream—and annotated with integrity and localization metadata. Each external identifier is paired with a checksum algorithm, ranging from `md5` and `sha1` to `blake2b`, enabling cryptographic verification of the referenced resource's integrity, while a language field such as `ja`, `en`, or `es` captures the linguistic context of the identifier's registration. This triad of identifier, checksum algorithm, and language creates a verifiable provenance chain: an identifier points to a target, the checksum algorithm guarantees the target has not been altered since registration, and the language field disambiguates multilingual contexts where the same identifier might resolve differently.

**t_identifier_unique**

| id | identifier | identifies | checksum_algo | language |
| --- | --- | --- | --- | --- |
| UNIQ-0001 | 10.1038/s41586-023-06123 | FDA 510(k) Database | md5 | ja |
| UNIQ-0002 | W3C-DOI:10.1002/anie.202112345 | OSMnx Graph Library | sha1 | en |
| UNIQ-0003 | PDB-7XYZ-A | RefSeq Genome Assembly | md5 | ja |
| UNIQ-0004 | W3C-DOI:10.1002/anie.202112345 | CERN Telemetry Stream | blake2b | es |
| UNIQ-0005 | PDB-7XYZ-A | RefSeq Genome Assembly | blake2b | de |
| UNIQ-0006 | ORCID-0000-0002-1825-0097 | CERN Telemetry Stream | md5 | es |
| UNIQ-0007 | W3C-DOI:10.1002/anie.202112345 | WHO ICD-11 Code | blake2b | fr |
| UNIQ-0008 | SNOMED-123456008 | CERN Telemetry Stream | blake2b | ja |

Resource allocation lifecycle management is modeled through a parallel structure of allocation records, completion timestamps, and role-based associations. Allocations such as `data-lake-partition`, `storage-tier-archival`, and `k8s-pod-quota` are assigned completion timestamps like `2023-10-25T22:48:55Z` and `2024-06-30T15:05:33Z`, establishing a temporal audit trail for when resources were provisioned or released. The association between allocations and their completion records is not implicit but explicitly mediated through a junction table that assigns roles—`observer`, `owner`, `contributor`—to each subject-target pairing. In this model, the subject is the allocation record, the target is the completion record, and the role defines the relationship between them: an `owner` bears responsibility for the allocation's lifecycle, a `contributor` participates in its execution, and an `observer` maintains visibility without operational authority. This role-based association pattern ensures that accountability is traceable and that access control decisions can be derived from the relationship graph rather than from opaque application-level permissions.

**t_allocation_completed_at__completed_at**

| id | allocation_id | completed_at_id | role |
| --- | --- | --- | --- |
| COMP-0001 | COMP-0005 | COMP-0003 | observer |
| COMP-0002 | COMP-0006 | COMP-0003 | observer |
| COMP-0003 | COMP-0002 | COMP-0005 | owner |
| COMP-0004 | COMP-0001 | COMP-0002 | contributor |
| COMP-0005 | COMP-0004 | COMP-0004 | owner |
| COMP-0006 | COMP-0001 | COMP-0005 | owner |
| COMP-0007 | COMP-0003 | COMP-0003 | reviewer |
| COMP-0008 | COMP-0004 | COMP-0006 | observer |

The distinction between entity, subject, and target reflects a layered ontology of metadata relationships. An entity is a concrete instance of a transformation or allocation—a specific execution of `Customer deduplication` or a particular `data-lake-partition`—that carries attribute values and participates in associations. A subject and a target are relational roles within an association: the subject is the entity that initiates or owns the relationship, while the target is the entity that is related to or affected by it. In the allocation-completion association, for example, allocation `COMP-0005` serves as the subject linked to completion `COMP-0003` with the role of `observer`, while allocation `COMP-0002` serves as the subject linked to completion `COMP-0005` with the role of `owner`. This separation of entity from relationship role enables the same entity to participate in multiple associations with different roles, supporting complex governance scenarios where a single resource may be owned by one team, contributed to by another, and observed by a third.

Attribute values are stored in type-disaggregated tables—decimal, integer, datetime, and variable-character—each linking an entity to an attribute through a foreign key and storing the value in a column labeled `misc` to reflect its heterogeneous nature. This design choice acknowledges that while attribute types are declared and enforced, the actual values are semantically diverse: a `duration_seconds` attribute holds a numeric measurement, a `host_name` attribute holds a machine identifier, and an `exit_code` attribute holds an integer status. The `misc` label is not a concession to schemalessness but a deliberate acknowledgment that the values, though typed, belong to different semantic domains and should not be conflated in queries or reports. By separating values by type at the storage level, the framework ensures that aggregation, filtering, and validation operations operate on homogeneous data, reducing the risk of type coercion errors and improving query performance through partitioned access patterns.