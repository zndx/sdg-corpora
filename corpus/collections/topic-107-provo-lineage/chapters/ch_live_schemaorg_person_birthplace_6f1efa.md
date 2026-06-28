---
chapter_id: ch_live_schemaorg_person_birthplace_6f1efa
topic_id: 107
family: 07_long_tail
cited_terms: ['schemaorg_person_birthplace', 'lineage_edge_basic', 'syscall_invoked_by_event']
model: engine-refine
---

Data lineage and schema provenance rest on a foundation of unique identifiers that anchor every entity, attribute, and relationship within the governance framework. Each lineage edge receives a distinct identifier—EDGE-0001 through EDGE-0004—while schemaorg entities are similarly enumerated as BIRT-0001 through BIRT-0004, and event-level records carry identifiers such as EVEN-0001. These identifiers serve as the primary keys that enable cross-table joins and ensure referential integrity across the dimensional model. The lineage edge table captures the semantic nature of each relationship through descriptive labels: Financial Reconciliation Trace, Compliance Verification Path, Data Lake Ingestion Chain, and Supply Chain Audit Trail. Such labels provide auditors and data stewards with immediate context about the operational purpose of each edge, while the underlying identifiers guarantee deterministic resolution regardless of label changes or localization.

**t_lineage_edge_basic**

| id | lineage |
| --- | --- |
| EDGE-0001 | Financial Reconciliation Trace |
| EDGE-0002 | Compliance Verification Path |
| EDGE-0003 | Data Lake Ingestion Chain |
| EDGE-0004 | Supply Chain Audit Trail |
| EDGE-0005 | Sensor Calibration Pipeline |
| EDGE-0006 | Supply Chain Audit Trail |
| EDGE-0007 | Document Revision History |
| EDGE-0008 | Genomic Variant Processing |

**t_lineage_edge_basic_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| EDGE-0001 | confidence | xsd:decimal |
| EDGE-0002 | dimension_kind | xsd:string |
| EDGE-0003 | method | xsd:string |
| EDGE-0004 | recorded_at | xsd:dateTime |
| EDGE-0005 | uncertainty | xsd:decimal |
| EDGE-0006 | unit | xsd:string |
| EDGE-0007 | value | xsd:decimal |
| EDGE-0008 | encoding | xsd:string |

**t_lineage_edge_basic_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EDGE-0001 | EDGE-0001 | EDGE-0004 | 2023-06-18T00:21:12 |
| EDGE-0002 | EDGE-0002 | EDGE-0004 | 2023-11-20T00:15:50 |
| EDGE-0003 | EDGE-0003 | EDGE-0004 | 2023-03-09T06:34:54 |
| EDGE-0004 | EDGE-0004 | EDGE-0004 | 2023-04-04T09:21:45 |
| EDGE-0005 | EDGE-0005 | EDGE-0004 | 2025-02-06T04:35:19 |
| EDGE-0006 | EDGE-0006 | EDGE-0004 | 2023-09-20T23:51:28 |
| EDGE-0007 | EDGE-0007 | EDGE-0004 | 2023-03-25T22:49:39 |
| EDGE-0008 | EDGE-0008 | EDGE-0004 | 2025-02-12T13:04:31 |

**t_lineage_edge_basic_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EDGE-0001 | EDGE-0001 | EDGE-0001 | 0.947 |
| EDGE-0002 | EDGE-0001 | EDGE-0005 | 637.72 |
| EDGE-0003 | EDGE-0001 | EDGE-0007 | 513.28 |
| EDGE-0004 | EDGE-0002 | EDGE-0001 | 0.497 |
| EDGE-0005 | EDGE-0002 | EDGE-0005 | 852.97 |
| EDGE-0006 | EDGE-0002 | EDGE-0007 | 198.62 |
| EDGE-0007 | EDGE-0003 | EDGE-0001 | 0.290 |
| EDGE-0008 | EDGE-0003 | EDGE-0005 | 468.80 |

**t_lineage_edge_basic_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EDGE-0001 | EDGE-0001 | EDGE-0002 | Dimension Kind 01 |
| EDGE-0002 | EDGE-0001 | EDGE-0008 | Encoding 02 |
| EDGE-0003 | EDGE-0001 | EDGE-0009 | change rationale |
| EDGE-0004 | EDGE-0001 | EDGE-0010 | de |
| EDGE-0005 | EDGE-0001 | EDGE-0003 | manual |
| EDGE-0006 | EDGE-0001 | EDGE-0006 | count |
| EDGE-0007 | EDGE-0002 | EDGE-0002 | Dimension Kind 07 |
| EDGE-0008 | EDGE-0002 | EDGE-0008 | Encoding 08 |

Birthplace and category dimensions supply the provenance classification layer that contextualizes where schema entities originate and how they are organized. The birthplace dimension table assigns each entity a birthplace label—Birthplace Label 01 through Birthplace Label 04—alongside a corresponding category such as Birthplace Category 01 or Birthplace Category 02. These categorical assignments enable aggregation and filtering by provenance type, supporting governance queries that ask which schema entities derive from which source systems or data domains. The fact table references birthplace keys—BIRT-0006, BIRT-0002, BIRT-0001, BIRT-0005—creating a many-to-one relationship that allows multiple schema entities to share a common birthplace classification while preserving the ability to trace each entity back to its origin point.

**dim_birthplace**

| id | birthplace_label | birthplace_category |
| --- | --- | --- |
| BIRT-0001 | Birthplace Label 01 | Birthplace Category 01 |
| BIRT-0002 | Birthplace Label 02 | Birthplace Category 02 |
| BIRT-0003 | Birthplace Label 03 | Birthplace Category 03 |
| BIRT-0004 | Birthplace Label 04 | Birthplace Category 04 |
| BIRT-0005 | Birthplace Label 05 | Birthplace Category 05 |
| BIRT-0006 | Birthplace Label 06 | Birthplace Category 06 |

Attribute definitions and their typed values form the metadata backbone that captures the quantitative and qualitative properties of lineage edges. The attribute definition table declares attribute names such as confidence, dimension_kind, method, and recorded_at, each bound to a specific XML Schema datatype: xsd:decimal, xsd:string, or xsd:dateTime. This type discipline ensures that value storage tables remain homogeneous and query-optimized. Decimal attributes—such as confidence scores of 0.947 and 0.497, or dimensional measures of 637.72 and 513.28—are persisted in the decimal value table, while string attributes like Dimension Kind 01 and Encoding 02 reside in the varchar value table, and timestamped observations such as 2023-06-18T00:21:12 and 2023-11-20T00:15:50 are stored in the datetime value table. The entity column in each value table references the lineage edge to which the attribute belongs, and the attr_id column resolves to the corresponding attribute definition, creating a normalized entity-attribute-value pattern that scales to an arbitrary number of attributes per edge without schema modification.

Size, version, and encoding metadata provide the operational controls necessary for data lifecycle management and integrity verification. Schemaorg entities carry size measurements in bytes—895265030, 114301972, 338701831, and 998785819—which inform capacity planning and storage cost allocation. Version numbers ranging from 3 to 8 enable change tracking and rollback capabilities, ensuring that data stewards can reconstruct prior states of any schema entity. Encoding specifications—utf8, unicode, and latin1—govern character representation across event records, while checksum algorithms including md5, sha256, crc32, and sha1 provide integrity verification mechanisms for syscall invocations triggered by events such as disk_read and api_callback. The combination of these operational attributes ensures that every data asset can be sized, versioned, encoded, and verified against tampering or corruption.

**fact_schemaorg**

| id | birthplace_key | size_bytes | version |
| --- | --- | --- | --- |
| BIRT-0001 | BIRT-0006 | 895265030 | 3 |
| BIRT-0002 | BIRT-0002 | 114301972 | 5 |
| BIRT-0003 | BIRT-0001 | 338701831 | 4 |
| BIRT-0004 | BIRT-0005 | 998785819 | 8 |

**t_syscall_invoked_by_event**

| id | syscall | invoked_by_event | checksum_algo | encoding |
| --- | --- | --- | --- | --- |
| EVEN-0001 | socket | disk_read | md5 | utf8 |
| EVEN-0002 | futex | disk_read | sha256 | unicode |
| EVEN-0003 | mmap | api_callback | crc32 | utf8 |
| EVEN-0004 | close | disk_read | sha1 | latin1 |
| EVEN-0005 | read | api_callback | sha256 | utf8 |
| EVEN-0006 | socket | memory_fault | md5 | unicode |