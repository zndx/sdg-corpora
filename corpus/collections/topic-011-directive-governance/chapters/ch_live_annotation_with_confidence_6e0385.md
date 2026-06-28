---
chapter_id: ch_live_annotation_with_confidence_6e0385
topic_id: 11
family: 02_observation_measurement
cited_terms: ['annotation_with_confidence', 'audit_conducted_by', 'transformation_not_recoverable']
model: engine-refine
---

Data provenance in governed environments rests upon a disciplined separation between the identity of a record and the properties ascribed to it. Every audit, annotation, and transformation is anchored by a unique identifier—`CONF-0001`, `COND-0001`, `RECO-0001`—that serves as the immutable reference point across all downstream queries and compliance reports. These identifiers do not merely label rows; they establish a chain of custody. An audit such as the "Cloud Infrastructure Review" or the "SOC2 Compliance Review" is distinguished from every other engagement by its identifier, and every attribute value, confidence score, and scheduling directive is traced back to that anchor. Without this rigid identification layer, the audit trail fractures, and regulatory assertions become ungrounded.

**t_annotation_with_confidence**

| id | annotation |
| --- | --- |
| CONF-0001 | Telemetry Stream US East |
| CONF-0002 | Lab Assay Plate 12B |
| CONF-0003 | Lab Assay Plate 12B |
| CONF-0004 | Lab Assay Plate 12B |
| CONF-0005 | Gene Expression Run X42 |
| CONF-0006 | Telemetry Stream US East |
| CONF-0007 | Clinical Trial Arm C |

**t_annotation_with_confidence_confidence**

| id | confidence |
| --- | --- |
| CONF-0001 | 95 Percent Confidence |
| CONF-0002 | Cross Referenced |
| CONF-0003 | Ensemble Agreement |
| CONF-0004 | Expert Verified |
| CONF-0005 | P Value 0.01 |
| CONF-0006 | Expert Verified |

**t_audit_conducted_by**

| id | audit |
| --- | --- |
| COND-0001 | Cloud Infrastructure Review |
| COND-0002 | SOC2 Compliance Review |
| COND-0003 | Lab Safety Inspection |
| COND-0004 | Data Retention Policy |
| COND-0005 | Legacy Migration Check |
| COND-0006 | SOC2 Compliance Review |

**t_audit_conducted_by_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| COND-0001 | duration_seconds | xsd:decimal |
| COND-0002 | end_time | xsd:dateTime |
| COND-0003 | exit_code | xsd:integer |
| COND-0004 | host_name | xsd:string |
| COND-0005 | log_level | xsd:string |
| COND-0006 | phase | xsd:string |
| COND-0007 | retry_count | xsd:integer |
| COND-0008 | scheduled_at | xsd:dateTime |

**t_audit_conducted_by_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| COND-0001 | COND-0001 | COND-0002 | 2023-06-07T00:47:02 |
| COND-0002 | COND-0001 | COND-0008 | 2025-06-08T04:54:48 |
| COND-0003 | COND-0001 | COND-0009 | 2023-02-14T08:05:22 |
| COND-0004 | COND-0002 | COND-0002 | 2023-03-04T06:34:44 |
| COND-0005 | COND-0002 | COND-0008 | 2025-02-11T04:03:38 |
| COND-0006 | COND-0002 | COND-0009 | 2024-11-06T16:59:35 |
| COND-0007 | COND-0003 | COND-0002 | 2024-02-26T03:59:36 |
| COND-0008 | COND-0003 | COND-0008 | 2023-10-26T01:36:07 |

**t_audit_conducted_by_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| COND-0001 | COND-0001 | COND-0001 | 1980.42 |
| COND-0002 | COND-0002 | COND-0001 | 6184.62 |
| COND-0003 | COND-0003 | COND-0001 | 3332.18 |
| COND-0004 | COND-0004 | COND-0001 | 5867.45 |
| COND-0005 | COND-0005 | COND-0001 | 1263.06 |
| COND-0006 | COND-0006 | COND-0001 | 5705.65 |

**t_audit_conducted_by_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| COND-0001 | COND-0001 | COND-0003 | 395 |
| COND-0002 | COND-0001 | COND-0007 | 293 |
| COND-0003 | COND-0002 | COND-0003 | 558 |
| COND-0004 | COND-0002 | COND-0007 | 143 |
| COND-0005 | COND-0003 | COND-0003 | 950 |
| COND-0006 | COND-0003 | COND-0007 | 140 |
| COND-0007 | COND-0004 | COND-0003 | 458 |
| COND-0008 | COND-0004 | COND-0007 | 234 |

**t_audit_conducted_by_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| COND-0001 | COND-0001 | COND-0004 | node-a01 |
| COND-0002 | COND-0001 | COND-0005 | Log Level 02 |
| COND-0003 | COND-0001 | COND-0006 | review |
| COND-0004 | COND-0001 | COND-0010 | superseded |
| COND-0005 | COND-0001 | COND-0011 | Triggered By 05 |
| COND-0006 | COND-0002 | COND-0004 | worker-07 |
| COND-0007 | COND-0002 | COND-0005 | Log Level 07 |
| COND-0008 | COND-0002 | COND-0006 | review |

**t_transformation_not_recoverable**

| id | transformation | transformation_2 | scheduled_at | triggered_by |
| --- | --- | --- | --- | --- |
| RECO-0001 | partition compaction | checksum verification | 2023-05-27T08:30:46 | event |
| RECO-0002 | log rotation | index defragmentation | 2024-07-23T05:41:48 | manual |
| RECO-0003 | batch compaction | record purging | 2025-03-09T11:37:12 | schedule |
| RECO-0004 | format conversion | index rebuild | 2023-08-05T01:48:14 | api |
| RECO-0005 | format conversion | feature scaling | 2023-09-25T17:59:19 | manual |
| RECO-0006 | batch compaction | telemetry filtering | 2024-03-31T12:21:12 | event |
| RECO-0007 | snapshot commit | batch compaction | 2023-07-05T00:36:15 | schedule |
| RECO-0008 | index defragmentation | index defragmentation | 2025-04-13T18:22:12 | schedule |

The attribute model itself enforces a strict schema between the name of a property, its type, and the value it carries. The attribute name—`duration_seconds`, `end_time`, `exit_code`, `host_name`—is declared once in the metadata table and then referenced by value rows through foreign keys. The attribute type—`xsd:decimal`, `xsd:dateTime`, `xsd:integer`, `xsd:string`—constrains the domain of admissible values and determines which value table holds the actual data. A duration such as `1980.42` or `6184.62` resides in the decimal value store; a timestamp like `2023-06-07T00:47:02` or `2025-06-08T04:54:48` in the datetime store; an integer such as `395` or `558` in the integer store; and a string like `node-a01` or `review` in the varchar store. This type-dispatched value architecture ensures that every misc value is both semantically and syntactically validated against its declared attr_type before it enters the audit record.

The entity column binds each value row to the specific audit or annotation to which it belongs. An entity such as `COND-0001` may accumulate multiple attribute values across different type stores, each row representing a distinct facet of the same underlying record. This design permits an audit to carry heterogeneous metadata—numeric durations, ISO-8601 timestamps, exit codes, hostnames—without requiring a monolithic schema. The entity acts as the logical container; the attribute columns act as the typed slots; and the value columns hold the evidence. Compliance auditors can reconstruct the full attribute profile of any entity by joining across the value tables, confident that every value is type-safe and traceable to its declaration.

Relationships between annotations and their confidence scores are mediated through a junction table that carries its own identifier and a role column. The subject column points to the annotation—`CONF-0001` or `CONF-0002`—while the target column points to the confidence definition—`CONF-0004`, `CONF-0005`, or `CONF-0001`. The role column, taking values such as `contributor`, `observer`, or `reviewer`, assigns a functional posture to the relationship. An annotation may be linked to multiple confidence scores, each with a different role, reflecting the fact that a single telemetry stream like "Telemetry Stream US East" or a lab artifact like "Lab Assay Plate 12B" can be assessed through multiple lenses—expert verified, ensemble agreement, cross referenced, or carrying 95 percent confidence. The role disambiguates these perspectives and supports downstream governance queries that filter by function rather than by score alone.

**t_annotation_with_confidence__confidence**

| id | annotation_id | confidence_id | role |
| --- | --- | --- | --- |
| CONF-0001 | CONF-0007 | CONF-0006 | contributor |
| CONF-0002 | CONF-0001 | CONF-0004 | observer |
| CONF-0003 | CONF-0001 | CONF-0005 | contributor |
| CONF-0004 | CONF-0002 | CONF-0001 | reviewer |
| CONF-0005 | CONF-0006 | CONF-0005 | observer |
| CONF-0006 | CONF-0001 | CONF-0001 | owner |
| CONF-0007 | CONF-0004 | CONF-0005 | owner |
| CONF-0008 | CONF-0006 | CONF-0002 | contributor |

Scheduled transformations are governed by a parallel model that captures not only what is being transformed but when and why. The transformation column names the operation—`partition compaction`, `log rotation`, `batch compaction`, `format conversion`—while the secondary transformation column names the companion action, such as `checksum verification`, `index defragmentation`, `record purging`, or `index rebuild`. The scheduled_at column records the planned execution time, for example `2023-05-27T08:30:46` or `2025-03-09T11:37:12`, and the triggered_by column records the initiation mechanism: `event`, `manual`, `schedule`, or `api`. Together, these fields form an executable audit trail that links a transformation to its temporal context and its origin, enabling operators to reconstruct not only what ran but what prompted it and when it was due.