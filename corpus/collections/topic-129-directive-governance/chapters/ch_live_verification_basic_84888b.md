---
chapter_id: ch_live_verification_basic_84888b
topic_id: 129
family: 03_directive_governance
cited_terms: ['verification_basic', 'verification_concludes_with', 'verification_min_one_evidence']
model: engine-refine
---

ATTRIBUTES, ATTRIBUTE TYPES, ENTITIES, AND IDENTIFIERS constitute the foundational constructs of a normalized data architecture, enabling the separation of structural definitions from instance values and thereby supporting flexible, type-safe storage of heterogeneous metadata. An identifier serves as the immutable key by which a record is referenced across the system; in the verification domain, identifiers such as VERI-0001, VERI-0002, and VERI-0003 anchor distinct verification activities—ranging from a Compliance snapshot test to a Calibration certificate review to a Pipeline integrity check—while parallel identifier namespaces (WITH-0001 through WITH-0004 for conclusion records, EVID-0001 through EVID-0004 for evidence records) maintain namespace isolation across related but semantically distinct entity families. The identifier is not merely a surrogate key but a stable reference point that persists across joins, ensuring that a value stored in a type-specific value table can be unambiguously resolved to its originating entity and attribute definition.

**t_verification_min_one_evidence**

| id | verification | produces_evidence |
| --- | --- | --- |
| EVID-0001 | ISO27001 Compliance Audit | Calibration Certificate |
| EVID-0002 | Data Lineage Trace | Calibration Certificate |
| EVID-0003 | Cryptographic Signature Check | Calibration Certificate |
| EVID-0004 | Schema Migration Validation | Reconciliation Ledger |
| EVID-0005 | Data Lineage Trace | SHA256 Manifest |
| EVID-0006 | Schema Migration Validation | Health Check CSV |

**t_verification_min_one_evidence_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| EVID-0001 | duration_seconds | xsd:decimal |
| EVID-0002 | end_time | xsd:dateTime |
| EVID-0003 | exit_code | xsd:integer |
| EVID-0004 | host_name | xsd:string |
| EVID-0005 | log_level | xsd:string |
| EVID-0006 | phase | xsd:string |
| EVID-0007 | retry_count | xsd:integer |
| EVID-0008 | scheduled_at | xsd:dateTime |

**t_verification_min_one_evidence_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVID-0001 | EVID-0001 | EVID-0002 | 2023-07-04T07:08:55 |
| EVID-0002 | EVID-0001 | EVID-0008 | 2025-01-31T12:45:17 |
| EVID-0003 | EVID-0001 | EVID-0009 | 2025-03-23T07:51:24 |
| EVID-0004 | EVID-0002 | EVID-0002 | 2023-01-29T08:52:43 |
| EVID-0005 | EVID-0002 | EVID-0008 | 2025-02-10T17:00:11 |
| EVID-0006 | EVID-0002 | EVID-0009 | 2023-01-05T10:52:26 |
| EVID-0007 | EVID-0003 | EVID-0002 | 2023-12-08T22:39:20 |
| EVID-0008 | EVID-0003 | EVID-0008 | 2023-06-23T05:07:56 |

**t_verification_min_one_evidence_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVID-0001 | EVID-0001 | EVID-0003 | 414 |
| EVID-0002 | EVID-0001 | EVID-0007 | 360 |
| EVID-0003 | EVID-0002 | EVID-0003 | 47 |
| EVID-0004 | EVID-0002 | EVID-0007 | 492 |
| EVID-0005 | EVID-0003 | EVID-0003 | 443 |
| EVID-0006 | EVID-0003 | EVID-0007 | 122 |
| EVID-0007 | EVID-0004 | EVID-0003 | 839 |
| EVID-0008 | EVID-0004 | EVID-0007 | 199 |

**t_verification_min_one_evidence_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVID-0001 | EVID-0001 | EVID-0004 | node-a01 |
| EVID-0002 | EVID-0001 | EVID-0005 | Log Level 02 |
| EVID-0003 | EVID-0001 | EVID-0006 | review |
| EVID-0004 | EVID-0001 | EVID-0010 | failed |
| EVID-0005 | EVID-0001 | EVID-0011 | Triggered By 05 |
| EVID-0006 | EVID-0002 | EVID-0004 | edge-03 |
| EVID-0007 | EVID-0002 | EVID-0005 | Log Level 07 |
| EVID-0008 | EVID-0002 | EVID-0006 | closeout |

An attribute defines the semantic dimension along which an entity is measured or described, and its type constrains the domain of permissible values. The attribute catalog for verifications enumerates properties such as duration_seconds, end_time, exit_code, and host_name, each bound to an XML Schema Definition type—xsd:decimal, xsd:dateTime, xsd:integer, and xsd:string respectively—that governs both storage semantics and validation rules. This type discipline is enforced not at the attribute definition level alone but through a deliberate partitioning of value storage: decimal quantities like 500.97, 4488.38, 4833.98, and 3565.06 reside in a dedicated decimal value table; integer measurements such as 182, 65, 828, and 38 in an integer value table; temporal stamps including 2023-02-01T08:41:13, 2023-06-06T17:03:25, and 2025-05-09T15:15:58 in a datetime value table; and free-form strings like ingest-21, Log Level 02, execution, and complete in a varchar value table. The same typological partitioning recurs across the conclusion and evidence entity families, where attributes of identical names and types (duration_seconds as xsd:decimal, end_time as xsd:dateTime, exit_code as xsd:integer, host_name as xsd:string) are defined in parallel attribute tables and populated through corresponding value tables, ensuring structural consistency without requiring a monolithic value column.

An entity represents a concrete instance of an entity type—a specific verification, a specific conclusion, or a specific piece of evidence—and is linked to its attribute values through a composite foreign key consisting of entity_id and attr_id. The entity_id references the primary key of the entity's defining table (for example, VERI-0001 in t_verification_basic), while attr_id references the primary key of the attribute definition within the corresponding attribute catalog (such as VERI-0001 for duration_seconds or VERI-0002 for end_time). This two-part linkage permits a single entity to carry multiple attribute values of different types, each resolved through its appropriate value table. For instance, the entity VERI-0001 carries a decimal value of 500.97 for its duration_seconds attribute (VERI-0001), a datetime value of 2023-02-01T08:41:13 for its end_time attribute (VERI-0002), an integer value of 182 for its exit_code attribute (VERI-0003), and a varchar value of ingest-21 for its host_name attribute (VERI-0004), with each value independently addressable and type-constrained.

**t_verification_basic_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERI-0001 | VERI-0001 | VERI-0002 | 2023-02-01T08:41:13 |
| VERI-0002 | VERI-0001 | VERI-0008 | 2023-06-06T17:03:25 |
| VERI-0003 | VERI-0001 | VERI-0009 | 2025-05-09T15:15:58 |
| VERI-0004 | VERI-0002 | VERI-0002 | 2023-06-08T16:52:03 |
| VERI-0005 | VERI-0002 | VERI-0008 | 2025-05-17T22:11:58 |
| VERI-0006 | VERI-0002 | VERI-0009 | 2024-06-13T13:20:10 |
| VERI-0007 | VERI-0003 | VERI-0002 | 2023-04-20T09:43:00 |
| VERI-0008 | VERI-0003 | VERI-0008 | 2023-10-14T11:07:55 |

**t_verification_basic_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERI-0001 | VERI-0001 | VERI-0004 | ingest-21 |
| VERI-0002 | VERI-0001 | VERI-0005 | Log Level 02 |
| VERI-0003 | VERI-0001 | VERI-0006 | execution |
| VERI-0004 | VERI-0001 | VERI-0010 | complete |
| VERI-0005 | VERI-0001 | VERI-0011 | Triggered By 05 |
| VERI-0006 | VERI-0002 | VERI-0004 | edge-03 |
| VERI-0007 | VERI-0002 | VERI-0005 | Log Level 07 |
| VERI-0008 | VERI-0002 | VERI-0006 | initiation |

The relational model extends beyond single-entity attribute storage to capture inter-entity relationships through junction tables that encode many-to-many associations. The verification-conclusion relationship, stored in t_verification_concludes_with, links verifications such as Compliance Gateway Scan, Telemetry Sync Verify, Data Lineage Trace, and Artifact Hash Check to their respective outcomes—Failure Manifest, Pass Certificate, Audit Trail Log, and Access Grant—using identifiers WITH-0001 through WITH-0004 that serve as both primary keys and foreign keys into the conclusion attribute and value tables. Similarly, the verification-evidence relationship in t_verification_min_one_evidence associates verifications including ISO27001 Compliance Audit, Data Lineage Trace, Cryptographic Signature Check, and Schema Migration Validation with their produced evidence artifacts—Calibration Certificate (repeated across multiple verifications) and Reconciliation Ledger—using identifiers EVID-0001 through EVID-0004 that anchor parallel attribute definitions and type-partitioned value tables. In each case, the junction table's identifier functions as a bridge: it is the entity_id in the corresponding conclusion or evidence attribute and value tables, and it carries its own set of typed attributes (duration_seconds, end_time, exit_code, host_name) whose values are stored in the same type-partitioned value tables, thereby allowing the relationship itself to be described and measured.

**t_verification_concludes_with**

| id | verification | concludes_with |
| --- | --- | --- |
| WITH-0001 | Compliance Gateway Scan | Failure Manifest |
| WITH-0002 | Telemetry Sync Verify | Pass Certificate |
| WITH-0003 | Data Lineage Trace | Audit Trail Log |
| WITH-0004 | Artifact Hash Check | Access Grant |
| WITH-0005 | Model Drift Assessment | Sync Receipt |
| WITH-0006 | Artifact Hash Check | Pass Certificate |

**t_verification_concludes_with_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| WITH-0001 | duration_seconds | xsd:decimal |
| WITH-0002 | end_time | xsd:dateTime |
| WITH-0003 | exit_code | xsd:integer |
| WITH-0004 | host_name | xsd:string |
| WITH-0005 | log_level | xsd:string |
| WITH-0006 | phase | xsd:string |
| WITH-0007 | retry_count | xsd:integer |
| WITH-0008 | scheduled_at | xsd:dateTime |

**t_verification_concludes_with_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| WITH-0001 | WITH-0001 | WITH-0002 | 2023-03-17T15:14:20 |
| WITH-0002 | WITH-0001 | WITH-0008 | 2023-03-29T16:58:23 |
| WITH-0003 | WITH-0001 | WITH-0009 | 2023-05-17T22:59:07 |
| WITH-0004 | WITH-0002 | WITH-0002 | 2023-10-18T10:06:06 |
| WITH-0005 | WITH-0002 | WITH-0008 | 2023-06-18T21:36:06 |
| WITH-0006 | WITH-0002 | WITH-0009 | 2025-01-08T20:27:31 |
| WITH-0007 | WITH-0003 | WITH-0002 | 2025-05-26T17:08:43 |
| WITH-0008 | WITH-0003 | WITH-0008 | 2023-08-15T17:46:49 |

**t_verification_concludes_with_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| WITH-0001 | WITH-0001 | WITH-0001 | 5022.45 |
| WITH-0002 | WITH-0002 | WITH-0001 | 4498.56 |
| WITH-0003 | WITH-0003 | WITH-0001 | 4177.56 |
| WITH-0004 | WITH-0004 | WITH-0001 | 216.79 |
| WITH-0005 | WITH-0005 | WITH-0001 | 4466.82 |
| WITH-0006 | WITH-0006 | WITH-0001 | 6044.91 |

**t_verification_concludes_with_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| WITH-0001 | WITH-0001 | WITH-0003 | 299 |
| WITH-0002 | WITH-0001 | WITH-0007 | 242 |
| WITH-0003 | WITH-0002 | WITH-0003 | 130 |
| WITH-0004 | WITH-0002 | WITH-0007 | 120 |
| WITH-0005 | WITH-0003 | WITH-0003 | 587 |
| WITH-0006 | WITH-0003 | WITH-0007 | 195 |
| WITH-0007 | WITH-0004 | WITH-0003 | 700 |
| WITH-0008 | WITH-0004 | WITH-0007 | 420 |

**t_verification_concludes_with_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| WITH-0001 | WITH-0001 | WITH-0004 | ingest-21 |
| WITH-0002 | WITH-0001 | WITH-0005 | Log Level 02 |
| WITH-0003 | WITH-0001 | WITH-0006 | review |
| WITH-0004 | WITH-0001 | WITH-0010 | complete |
| WITH-0005 | WITH-0001 | WITH-0011 | Triggered By 05 |
| WITH-0006 | WITH-0002 | WITH-0004 | gw-12 |
| WITH-0007 | WITH-0002 | WITH-0005 | Log Level 07 |
| WITH-0008 | WITH-0002 | WITH-0006 | execution |

This architecture—where identifiers provide stable references, attributes define semantic dimensions with typed constraints, entities instantiate those dimensions, and junction tables encode relationships that are themselves fully attributed—enables a compliance and governance system to capture the full provenance of verification activities without sacrificing type safety or query efficiency. The repetition of attribute schemas across entity families (basic verifications, conclusions, and evidence) reflects a deliberate design choice: each relationship type carries the same operational metadata (duration, end time, exit code, host), enabling uniform reporting and cross-entity aggregation, while the type-partitioned value tables ensure that decimal arithmetic, temporal comparison, integer filtering, and string matching each operate on optimally typed storage without the overhead of generic value columns or runtime type coercion.

**t_verification_basic**

| id | verification |
| --- | --- |
| VERI-0001 | Compliance snapshot test |
| VERI-0002 | Calibration certificate review |
| VERI-0003 | Pipeline integrity check |
| VERI-0004 | Sensor drift assessment |
| VERI-0005 | Access control audit |
| VERI-0006 | Metadata reconciliation |

**t_verification_basic_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| VERI-0001 | duration_seconds | xsd:decimal |
| VERI-0002 | end_time | xsd:dateTime |
| VERI-0003 | exit_code | xsd:integer |
| VERI-0004 | host_name | xsd:string |
| VERI-0005 | log_level | xsd:string |
| VERI-0006 | phase | xsd:string |
| VERI-0007 | retry_count | xsd:integer |
| VERI-0008 | scheduled_at | xsd:dateTime |

**t_verification_basic_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERI-0001 | VERI-0001 | VERI-0001 | 500.97 |
| VERI-0002 | VERI-0002 | VERI-0001 | 4488.38 |
| VERI-0003 | VERI-0003 | VERI-0001 | 4833.98 |
| VERI-0004 | VERI-0004 | VERI-0001 | 3565.06 |
| VERI-0005 | VERI-0005 | VERI-0001 | 2509.98 |
| VERI-0006 | VERI-0006 | VERI-0001 | 2611.50 |

**t_verification_basic_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERI-0001 | VERI-0001 | VERI-0003 | 182 |
| VERI-0002 | VERI-0001 | VERI-0007 | 65 |
| VERI-0003 | VERI-0002 | VERI-0003 | 828 |
| VERI-0004 | VERI-0002 | VERI-0007 | 38 |
| VERI-0005 | VERI-0003 | VERI-0003 | 137 |
| VERI-0006 | VERI-0003 | VERI-0007 | 337 |
| VERI-0007 | VERI-0004 | VERI-0003 | 858 |
| VERI-0008 | VERI-0004 | VERI-0007 | 112 |

**t_verification_min_one_evidence_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVID-0001 | EVID-0001 | EVID-0001 | 2280.75 |
| EVID-0002 | EVID-0002 | EVID-0001 | 2844.65 |
| EVID-0003 | EVID-0003 | EVID-0001 | 2804.04 |
| EVID-0004 | EVID-0004 | EVID-0001 | 5144.39 |
| EVID-0005 | EVID-0005 | EVID-0001 | 1607.16 |
| EVID-0006 | EVID-0006 | EVID-0001 | 959.65 |