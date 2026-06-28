---
chapter_id: ch_live_ebpfmap_used_by_program_1f26aa
topic_id: 45
family: 04_ebpf_kernel
cited_terms: ['ebpfmap_used_by_program', 'evidence_basic', 'column_pair_subject']
model: engine-refine
---

The integrity of any compliance evidence repository depends upon a disciplined separation between identifiers, attributes, and their typed values. Each record is anchored by a surrogate key—`id`—that serves as the immutable reference point across all fact and dimension tables. In the evidence fact table, identifiers such as `PROG-0001` through `PROG-0004` uniquely distinguish individual eBPF map records, while the evidence table employs the parallel scheme `EVID-0001` through `EVID-0004` to tag discrete compliance artifacts. The subject-pair tables extend this convention with identifiers like `SUBJ-0001` through `SUBJ-0004`, establishing a consistent addressing scheme that enables cross-referencing between the structural metadata and the attribute values themselves. This uniform identification strategy ensures that every datum, whether it is a compliance checklist entry or a latency benchmark result, can be traced to its origin without ambiguity.

**t_evidence_basic**

| id | evidence | dimension_kind | encoding |
| --- | --- | --- | --- |
| EVID-0001 | Compliance checklist | temperature | ascii |
| EVID-0002 | Latency benchmark result | count | latin1 |
| EVID-0003 | Incident postmortem | temperature | utf8 |
| EVID-0004 | Compliance checklist | pressure | utf8 |
| EVID-0005 | Temperature spike alert | length | utf8 |
| EVID-0006 | Metric threshold breach | temperature | ascii |

**t_column_pair_subject_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| SUBJ-0001 | confidence | xsd:decimal |
| SUBJ-0002 | dimension_kind | xsd:string |
| SUBJ-0003 | method | xsd:string |
| SUBJ-0004 | recorded_at | xsd:dateTime |
| SUBJ-0005 | uncertainty | xsd:decimal |
| SUBJ-0006 | unit | xsd:string |
| SUBJ-0007 | value | xsd:decimal |
| SUBJ-0008 | encoding | xsd:string |

**t_column_pair_subject_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SUBJ-0001 | SUBJ-0001 | SUBJ-0004 | 2023-03-08T01:00:53 |
| SUBJ-0002 | SUBJ-0002 | SUBJ-0004 | 2023-09-25T09:20:34 |
| SUBJ-0003 | SUBJ-0003 | SUBJ-0004 | 2025-01-28T08:00:28 |
| SUBJ-0004 | SUBJ-0004 | SUBJ-0004 | 2023-08-23T03:35:02 |
| SUBJ-0005 | SUBJ-0005 | SUBJ-0004 | 2024-12-26T07:43:51 |
| SUBJ-0006 | SUBJ-0006 | SUBJ-0004 | 2025-02-08T03:11:44 |
| SUBJ-0007 | SUBJ-0007 | SUBJ-0004 | 2024-12-23T16:25:42 |

**t_column_pair_subject_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SUBJ-0001 | SUBJ-0001 | SUBJ-0001 | 0.167 |
| SUBJ-0002 | SUBJ-0001 | SUBJ-0005 | 866.89 |
| SUBJ-0003 | SUBJ-0001 | SUBJ-0007 | 939.39 |
| SUBJ-0004 | SUBJ-0002 | SUBJ-0001 | 0.312 |
| SUBJ-0005 | SUBJ-0002 | SUBJ-0005 | 788.04 |
| SUBJ-0006 | SUBJ-0002 | SUBJ-0007 | 1.19 |
| SUBJ-0007 | SUBJ-0003 | SUBJ-0001 | 0.974 |
| SUBJ-0008 | SUBJ-0003 | SUBJ-0005 | 706.00 |

**t_column_pair_subject_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SUBJ-0001 | SUBJ-0001 | SUBJ-0002 | Dimension Kind 01 |
| SUBJ-0002 | SUBJ-0001 | SUBJ-0008 | Encoding 02 |
| SUBJ-0003 | SUBJ-0001 | SUBJ-0009 | audit excerpt |
| SUBJ-0004 | SUBJ-0001 | SUBJ-0010 | ja |
| SUBJ-0005 | SUBJ-0001 | SUBJ-0003 | manual |
| SUBJ-0006 | SUBJ-0001 | SUBJ-0006 | ms |
| SUBJ-0007 | SUBJ-0002 | SUBJ-0002 | Dimension Kind 07 |
| SUBJ-0008 | SUBJ-0002 | SUBJ-0008 | Encoding 08 |

Attributes and their associated types form the semantic backbone of the evidence model. The attribute definition table enumerates property names—`confidence`, `dimension_kind`, `method`, `recorded_at`—each bound to a precise XML Schema datatype: `xsd:decimal` for numeric confidence scores, `xsd:string` for categorical descriptors, and `xsd:dateTime` for temporal stamps. This type discipline is enforced at the value level through three dedicated value tables, each specialized for a single data type. Decimal attributes such as `0.167` and `866.89` reside in the decimal value table, datetime attributes like `2023-03-08T01:00:53` and `2025-01-28T08:00:28` in the datetime table, and free-form text such as `Dimension Kind 01`, `audit excerpt`, and `ja` in the varchar table. The entity and attribute foreign keys in each value table—`entity_id` and `attr_id`—tie these typed values back to their defining attribute and the subject entity they describe, creating a normalized star schema where type safety is maintained through table partitioning rather than runtime type checking.

Dimensional categorization provides the analytical axes along which evidence is organized and aggregated. The program dimension table supplies both a human-readable label—`Used By Program Label 01` through `Used By Program Label 04`—and a structural category—`Used By Program Category 01` through `Used By Program Category 04`—for each program reference. The fact table links to this dimension via the `used_by_program_key` column, with values such as `PROG-0005` and `PROG-0002` resolving to their corresponding dimensional records. Beyond program categorization, the evidence table itself carries a `dimension_kind` attribute that classifies each record along physical or logical measurement axes: `temperature`, `count`, and `pressure` appear as distinct dimension kinds, enabling downstream filtering and aggregation by measurement domain. Similarly, the `encoding` column—taking values `ascii`, `latin1`, and `utf8`—documents the character encoding of the underlying evidence text, a critical provenance detail for compliance artifacts that may originate from heterogeneous systems.

**dim_used_by_program**

| id | used_by_program_label | used_by_program_category |
| --- | --- | --- |
| PROG-0001 | Used By Program Label 01 | Used By Program Category 01 |
| PROG-0002 | Used By Program Label 02 | Used By Program Category 02 |
| PROG-0003 | Used By Program Label 03 | Used By Program Category 03 |
| PROG-0004 | Used By Program Label 04 | Used By Program Category 04 |
| PROG-0005 | Used By Program Label 05 | Used By Program Category 05 |
| PROG-0006 | Used By Program Label 06 | Used By Program Category 06 |

The fact table captures the quantitative footprint of each eBPF map instance, recording `size_bytes` values that range from approximately 31 million bytes (`31105012`) to 354 million bytes (`354373995`), alongside a `version` number that tracks schema or content revisions. These version identifiers—`3`, `5`, `6`, and `12`—allow auditors to reconstruct the evolution of a map over time and to correlate size changes with version transitions. The column-pair subject table introduces a relational layer that maps operational columns—`log_level`, `batch_token`, `transaction_id`, `timestamp_utc`—to evidence records through the `subject_column` foreign key, which references evidence identifiers such as `EVID-0004` and `EVID-0005`. This linkage bridges the gap between raw system telemetry and the structured evidence repository, ensuring that every compliance artifact can be traced back to the specific log fields, transaction contexts, and temporal markers from which it was derived.

**fact_ebpfmap**

| id | used_by_program_key | size_bytes | version |
| --- | --- | --- | --- |
| PROG-0001 | PROG-0005 | 208979093 | 3 |
| PROG-0002 | PROG-0004 | 156714508 | 6 |
| PROG-0003 | PROG-0005 | 31105012 | 12 |
| PROG-0004 | PROG-0002 | 354373995 | 5 |
| PROG-0005 | PROG-0004 | 866267293 | 2 |

**t_column_pair_subject**

| id | column | subject_column |
| --- | --- | --- |
| SUBJ-0001 | log_level | EVID-0004 |
| SUBJ-0002 | batch_token | EVID-0005 |
| SUBJ-0003 | transaction_id | EVID-0005 |
| SUBJ-0004 | timestamp_utc | EVID-0004 |
| SUBJ-0005 | patient_id | EVID-0001 |
| SUBJ-0006 | transaction_id | EVID-0001 |
| SUBJ-0007 | batch_token | EVID-0003 |