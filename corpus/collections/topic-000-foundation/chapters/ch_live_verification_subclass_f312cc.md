---
chapter_id: ch_live_verification_subclass_f312cc
topic_id: 0
family: 03_directive_governance
cited_terms: ['verification_subclass', 'descriptive_either_evidence_or_claim', 'instrument_emits_signal']
model: engine-refine
---

Verification activities are catalogued as discrete subclasses, each anchored by a stable identifier such as VERI-0001 through VERI-0004, denoting compliance renewal verification, GDPR data flow review, and security posture assessment. These identifiers serve as the primary key for all downstream attribute bindings and value assignments, ensuring that every measurement, timestamp, and status code can be traced back to a specific compliance event. The attribute schema itself is defined separately from its values: attribute names like duration_seconds, end_time, exit_code, and host_name are declared alongside their corresponding XSD types—xsd:decimal, xsd:dateTime, xsd:integer, and xsd:string—creating a type-safe contract that governs how evidence is recorded. This separation of attribute definition from value storage enables the system to accommodate heterogeneous data without schema migration, as each value type is persisted in its own dedicated table.

**t_verification_subclass**

| id | verification |
| --- | --- |
| VERI-0001 | Compliance renewal verification |
| VERI-0002 | GDPR data flow review |
| VERI-0003 | GDPR data flow review |
| VERI-0004 | Security posture assessment |
| VERI-0005 | Regulatory compliance sweep |
| VERI-0006 | Traceability certification run |
| VERI-0007 | Security posture assessment |

**t_verification_subclass_attr**

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

**t_verification_subclass_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERI-0001 | VERI-0001 | VERI-0002 | 2024-10-23T14:58:17 |
| VERI-0002 | VERI-0001 | VERI-0008 | 2024-02-27T03:56:28 |
| VERI-0003 | VERI-0001 | VERI-0009 | 2024-10-31T01:53:25 |
| VERI-0004 | VERI-0002 | VERI-0002 | 2024-01-09T21:40:31 |
| VERI-0005 | VERI-0002 | VERI-0008 | 2023-01-30T12:31:57 |
| VERI-0006 | VERI-0002 | VERI-0009 | 2024-01-31T06:48:16 |
| VERI-0007 | VERI-0003 | VERI-0002 | 2024-07-16T09:25:28 |
| VERI-0008 | VERI-0003 | VERI-0008 | 2025-02-02T11:50:21 |

The value tables implement a vertical partitioning strategy, routing each attribute's data to the appropriate storage table based on its declared type. Decimal attributes such as duration_seconds carry values like 5469.69, 821.61, 4016.93, and 4484.04 across different verification subclasses, while integer attributes capture exit codes and status indicators with values ranging from 29 to 713. Temporal attributes record event timestamps in ISO 8601 format, with entries such as 2024-10-23T14:58:17 and 2024-02-27T03:56:28 anchoring compliance activities to precise moments. String-valued attributes store host identifiers like node-a01, log level designations such as Log Level 02, and operational states including review and running. Each value row is linked to its parent verification subclass through the entity_id column and to its attribute definition through attr_id, forming a three-way join that reconstructs the complete attribute-value profile for any given compliance event.

**t_verification_subclass_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERI-0001 | VERI-0001 | VERI-0001 | 5469.69 |
| VERI-0002 | VERI-0002 | VERI-0001 | 821.61 |
| VERI-0003 | VERI-0003 | VERI-0001 | 4016.93 |
| VERI-0004 | VERI-0004 | VERI-0001 | 4484.04 |
| VERI-0005 | VERI-0005 | VERI-0001 | 1841.34 |
| VERI-0006 | VERI-0006 | VERI-0001 | 4375.47 |
| VERI-0007 | VERI-0007 | VERI-0001 | 6751.14 |

**t_verification_subclass_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERI-0001 | VERI-0001 | VERI-0003 | 616 |
| VERI-0002 | VERI-0001 | VERI-0007 | 105 |
| VERI-0003 | VERI-0002 | VERI-0003 | 713 |
| VERI-0004 | VERI-0002 | VERI-0007 | 29 |
| VERI-0005 | VERI-0003 | VERI-0003 | 18 |
| VERI-0006 | VERI-0003 | VERI-0007 | 388 |
| VERI-0007 | VERI-0004 | VERI-0003 | 901 |
| VERI-0008 | VERI-0004 | VERI-0007 | 260 |

**t_verification_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERI-0001 | VERI-0001 | VERI-0004 | node-a01 |
| VERI-0002 | VERI-0001 | VERI-0005 | Log Level 02 |
| VERI-0003 | VERI-0001 | VERI-0006 | review |
| VERI-0004 | VERI-0001 | VERI-0010 | running |
| VERI-0005 | VERI-0001 | VERI-0011 | Triggered By 05 |
| VERI-0006 | VERI-0002 | VERI-0004 | ingest-21 |
| VERI-0007 | VERI-0002 | VERI-0005 | Log Level 07 |
| VERI-0008 | VERI-0002 | VERI-0006 | execution |

A parallel evidence model captures descriptive claims and audit artifacts through a similar attribute-value architecture, using identifiers prefixed CLAI-0001 through CLAI-0004 to distinguish evidence types such as pipeline run log, compliance audit trail, network latency trace, and their associated metadata fields. Confidence scores recorded as decimal values—0.015 and 0.355 among the observed entries—quantify the reliability of each claim, while method and dimension_kind attributes classify the provenance of evidence using coded strings like Encoding 02 and Dimension Kind 01. The recorded_at timestamp column provides temporal grounding for each evidence item, with values spanning from 2023-12-14T23:50:57 through 2025-04-28T22:05:41, establishing a chronological audit trail that supports retrospective compliance review.

**t_descriptive_either_evidence_or_claim**

| id | descriptive | descriptive_2 | descriptive_3 |
| --- | --- | --- | --- |
| CLAI-0001 | pipeline run log | checksum mismatch alert | validation rule set |
| CLAI-0002 | compliance audit trail | field condition note | validation rule set |
| CLAI-0003 | network latency trace | calibration certificate | chain of custody tag |
| CLAI-0004 | pipeline run log | data quality flag | sampling interval ms |
| CLAI-0005 | data ingestion manifest | retention policy label | retention expiry date |
| CLAI-0006 | compliance audit trail | data quality flag | hash algorithm ID |

**t_descriptive_either_evidence_or_claim_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| CLAI-0001 | confidence | xsd:decimal |
| CLAI-0002 | dimension_kind | xsd:string |
| CLAI-0003 | method | xsd:string |
| CLAI-0004 | recorded_at | xsd:dateTime |
| CLAI-0005 | uncertainty | xsd:decimal |
| CLAI-0006 | unit | xsd:string |
| CLAI-0007 | value | xsd:decimal |
| CLAI-0008 | encoding | xsd:string |

**t_descriptive_either_evidence_or_claim_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CLAI-0001 | CLAI-0001 | CLAI-0004 | 2023-12-14T23:50:57 |
| CLAI-0002 | CLAI-0002 | CLAI-0004 | 2024-02-16T02:04:00 |
| CLAI-0003 | CLAI-0003 | CLAI-0004 | 2024-04-20T14:09:40 |
| CLAI-0004 | CLAI-0004 | CLAI-0004 | 2025-04-28T22:05:41 |
| CLAI-0005 | CLAI-0005 | CLAI-0004 | 2023-01-08T15:26:20 |
| CLAI-0006 | CLAI-0006 | CLAI-0004 | 2023-08-14T20:31:38 |

**t_descriptive_either_evidence_or_claim_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CLAI-0001 | CLAI-0001 | CLAI-0001 | 0.015 |
| CLAI-0002 | CLAI-0001 | CLAI-0005 | 195.73 |
| CLAI-0003 | CLAI-0001 | CLAI-0007 | 92.51 |
| CLAI-0004 | CLAI-0002 | CLAI-0001 | 0.355 |
| CLAI-0005 | CLAI-0002 | CLAI-0005 | 482.72 |
| CLAI-0006 | CLAI-0002 | CLAI-0007 | 420.42 |
| CLAI-0007 | CLAI-0003 | CLAI-0001 | 0.827 |
| CLAI-0008 | CLAI-0003 | CLAI-0005 | 514.52 |

**t_descriptive_either_evidence_or_claim_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CLAI-0001 | CLAI-0001 | CLAI-0002 | Dimension Kind 01 |
| CLAI-0002 | CLAI-0001 | CLAI-0008 | Encoding 02 |
| CLAI-0003 | CLAI-0001 | CLAI-0009 | change rationale |
| CLAI-0004 | CLAI-0001 | CLAI-0010 | es |
| CLAI-0005 | CLAI-0001 | CLAI-0003 | manual |
| CLAI-0006 | CLAI-0001 | CLAI-0006 | deg_C |
| CLAI-0007 | CLAI-0002 | CLAI-0002 | Dimension Kind 07 |
| CLAI-0008 | CLAI-0002 | CLAI-0008 | Encoding 08 |

Instrument-signal relationships introduce a third dimension to the data model, mapping physical measurement devices to the verification subclasses they feed. A LiDAR array emits signals bound to VERI-0002 with an associated data volume of 193,789,751 bytes stored at s3://lake/raw, while a seismometer contributes to the same verification subclass with 556,171,171 bytes routed to abfss://prod/silver. Mass spectrometer and radiometer outputs follow analogous patterns, with signal sizes of 279,461,908 and 579,891,201 bytes respectively, and URIs pointing to s3://lake/curated and gs://warehouse/gold storage tiers. The size_bytes column quantifies the data footprint of each instrument's output, enabling capacity planning and cost attribution, while the uri column provides the immutable location reference necessary for data lineage and reproducibility. Together, these three columns—instrument, emits_signal, size_bytes, and uri—form a compact provenance record that links physical instrumentation to compliance evidence through a single identifier row.

**t_instrument_emits_signal**

| id | instrument | emits_signal | size_bytes | uri |
| --- | --- | --- | --- | --- |
| SIGN-0001 | LiDAR array | VERI-0002 | 193789751 | s3://lake/raw |
| SIGN-0002 | Seismometer | VERI-0002 | 556171171 | abfss://prod/silver |
| SIGN-0003 | Mass spectrometer | VERI-0007 | 279461908 | s3://lake/curated |
| SIGN-0004 | Radiometer | VERI-0006 | 579891201 | gs://warehouse/gold |
| SIGN-0005 | Mass spectrometer | VERI-0001 | 371526447 | abfss://prod/silver |