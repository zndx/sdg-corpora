---
chapter_id: ch_live_process_min_one_input_d9019f
topic_id: 188
family: 07_long_tail
cited_terms: ['process_min_one_input', 'schemaorg_person_affiliation', 'nist80053_control_subclass']
model: engine-refine
---

Affiliation anchors organizational and semantic provenance within governed data estates: each affiliation record receives a stable identifier (AFFI-0001 through AFFI-0004) and is classified by category so that downstream consumers can reason about lineage, access scope, and retention without re-deriving context from free text. In practice, affiliation functions as the join key between descriptive dimensions and factual measurements; for example, fact records keyed AFFI-0001, AFFI-0002, AFFI-0003, and AFFI-0004 each carry an affiliation_key that resolves to a human-readable label (Affiliation Label 01–04) and a categorical bucket (Affiliation Category 01–04). Category therefore operationalizes taxonomy—turning otherwise interchangeable identifiers into policy-relevant groupings—while affiliation itself remains the durable handle by which schema snapshots, control mappings, and process attestations are attributed to a responsible organizational unit or data domain.

Identifier discipline underpins the entire model. Surrogate keys such as INPU-0001–INPU-0004 for process inputs and CONT-0001–CONT-0004 for NIST control subclasses are assigned independently of display names so that renaming, reclassification, or schema evolution does not fracture historical references. Entity, in turn, denotes the instance to which a measured or asserted value applies: a decimal duration of 2164.83 seconds binds to entity INPU-0001 (real-time stream processing over Parquet partition files), whereas 7108.77 seconds binds to INPU-0004 (feature engineering over sensor telemetry packets). The separation of identifier from entity is not cosmetic; it permits one logical process to accumulate multiple observations across attributes and time without collapsing distinct events into a single undifferentiated row.

**t_process_min_one_input**

| id | process | input |
| --- | --- | --- |
| INPU-0001 | Real-time stream processing | Parquet partition files |
| INPU-0002 | Batch data ingestion | Labeled training datasets |
| INPU-0003 | ETL transformation step | Labeled training datasets |
| INPU-0004 | Feature engineering workflow | Sensor telemetry packets |
| INPU-0005 | Real-time stream processing | System log archives |
| INPU-0006 | Audit trail generation | Labeled training datasets |

**t_nist80053_control_subclass**

| id | nist | nist80053_control |
| --- | --- | --- |
| CONT-0001 | NIST SP 800-53 Rev 5 | AC-3 |
| CONT-0002 | NIST SP 800-171 | CM-3 |
| CONT-0003 | NIST CSF 2.0 | SI-4 |
| CONT-0004 | NIST SP 800-207 | SA-4 |
| CONT-0005 | FIPS 140-3 | SR-1 |
| CONT-0006 | NIST SP 800-171 | AU-6 |

Attributes (attr) name the measurable or declarative facets attached to an entity, and attr type constrains how those facets may be stored, validated, and compared. Process inputs declare attr_name values including duration_seconds, end_time, exit_code, and host_name, each typed as xsd:decimal, xsd:dateTime, xsd:integer, or xsd:string respectively; control subclasses declare effective_date (xsd:date), enforcement (xsd:string), mandatory (xsd:boolean), and priority (xsd:integer). Typed value tables then enforce representation: datetime values such as 2023-04-22T11:20:36 and 2024-10-27T08:51:57 attach to entity INPU-0001 under distinct attr identifiers, while varchar miscellany—ingest-21, Log Level 02, review, complete—captures operational semantics that resist numeric encoding. The attr/attr_type pairing is the contract layer: without it, a misc field could not be interpreted as a compliance deadline, an exit code, or a host designation.

**t_process_min_one_input_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| INPU-0001 | duration_seconds | xsd:decimal |
| INPU-0002 | end_time | xsd:dateTime |
| INPU-0003 | exit_code | xsd:integer |
| INPU-0004 | host_name | xsd:string |
| INPU-0005 | log_level | xsd:string |
| INPU-0006 | phase | xsd:string |
| INPU-0007 | retry_count | xsd:integer |
| INPU-0008 | scheduled_at | xsd:dateTime |

**t_process_min_one_input_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| INPU-0001 | INPU-0001 | INPU-0002 | 2023-04-22T11:20:36 |
| INPU-0002 | INPU-0001 | INPU-0008 | 2024-10-27T08:51:57 |
| INPU-0003 | INPU-0001 | INPU-0009 | 2024-06-22T04:25:17 |
| INPU-0004 | INPU-0002 | INPU-0002 | 2023-12-06T11:11:06 |
| INPU-0005 | INPU-0002 | INPU-0008 | 2025-02-03T11:35:55 |
| INPU-0006 | INPU-0002 | INPU-0009 | 2024-12-06T22:47:35 |
| INPU-0007 | INPU-0003 | INPU-0002 | 2023-08-23T16:52:39 |
| INPU-0008 | INPU-0003 | INPU-0008 | 2024-05-09T10:22:43 |

**t_process_min_one_input_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| INPU-0001 | INPU-0001 | INPU-0001 | 2164.83 |
| INPU-0002 | INPU-0002 | INPU-0001 | 4485.78 |
| INPU-0003 | INPU-0003 | INPU-0001 | 2430.62 |
| INPU-0004 | INPU-0004 | INPU-0001 | 7108.77 |
| INPU-0005 | INPU-0005 | INPU-0001 | 1824.80 |
| INPU-0006 | INPU-0006 | INPU-0001 | 4795.57 |

**t_process_min_one_input_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| INPU-0001 | INPU-0001 | INPU-0003 | 682 |
| INPU-0002 | INPU-0001 | INPU-0007 | 200 |
| INPU-0003 | INPU-0002 | INPU-0003 | 365 |
| INPU-0004 | INPU-0002 | INPU-0007 | 357 |
| INPU-0005 | INPU-0003 | INPU-0003 | 339 |
| INPU-0006 | INPU-0003 | INPU-0007 | 252 |
| INPU-0007 | INPU-0004 | INPU-0003 | 834 |
| INPU-0008 | INPU-0004 | INPU-0007 | 166 |

**t_process_min_one_input_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| INPU-0001 | INPU-0001 | INPU-0004 | ingest-21 |
| INPU-0002 | INPU-0001 | INPU-0005 | Log Level 02 |
| INPU-0003 | INPU-0001 | INPU-0006 | review |
| INPU-0004 | INPU-0001 | INPU-0010 | complete |
| INPU-0005 | INPU-0001 | INPU-0011 | Triggered By 05 |
| INPU-0006 | INPU-0002 | INPU-0004 | node-b14 |
| INPU-0007 | INPU-0002 | INPU-0005 | Log Level 07 |
| INPU-0008 | INPU-0002 | INPU-0006 | review |

**t_nist80053_control_subclass_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONT-0001 | CONT-0001 | CONT-0003 | true |
| CONT-0002 | CONT-0002 | CONT-0003 | true |
| CONT-0003 | CONT-0003 | CONT-0003 | true |
| CONT-0004 | CONT-0004 | CONT-0003 | false |
| CONT-0005 | CONT-0005 | CONT-0003 | true |
| CONT-0006 | CONT-0006 | CONT-0003 | true |

**t_nist80053_control_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONT-0001 | CONT-0001 | CONT-0007 | Encoding 01 |
| CONT-0002 | CONT-0001 | CONT-0002 | Enforcement 02 |
| CONT-0003 | CONT-0001 | CONT-0008 | calibration record |
| CONT-0004 | CONT-0001 | CONT-0009 | es |
| CONT-0005 | CONT-0001 | CONT-0006 | Scope 05 |
| CONT-0006 | CONT-0002 | CONT-0007 | Encoding 06 |
| CONT-0007 | CONT-0002 | CONT-0002 | Enforcement 07 |
| CONT-0008 | CONT-0002 | CONT-0008 | audit excerpt |

The misc designation marks payload fields whose semantics are context-dependent rather than fixed by column name alone. Affiliation labels, enforcement strings (Enforcement 02), calibration records, and locale codes (es) all land in misc because their meaning is supplied by the surrounding entity–attribute frame. Integer misc values illustrate the pattern equally: exit codes 682 and 200 for INPU-0001 and INPU-0002, or priority integers 3 and 776 for CONT-0001 and CONT-0002, are unambiguous only when entity_id and attr_id disambiguate whether the integer denotes process termination status or control prioritization. Boolean misc for mandatory—true for AC-3, CM-3, and SI-4 but false for SA-4—further shows how the same attribute name across entities yields auditable, comparable policy facts rather than ad hoc annotations.

Version and size_bytes quantify the material footprint and temporal generation of affiliated schema artifacts. Affiliation AFFI-0001 at version 3 occupies 895265030 bytes, whereas AFFI-0004 at version 8 reaches 998785819 bytes; intermediate affiliations at versions 4 and 5 report 338701831 and 114301972 bytes respectively. These measures matter for capacity planning, incremental sync, and evidentiary completeness: a control subclass effective_date of 2025-03-12 for SA-4 under NIST SP 800-207 must be evaluated against the schema version and byte extent of the affiliation that published it. Together, affiliation and category situate who owns the data; identifier and entity stabilize what is being described; attr and attr_type govern how assertions are shaped; misc carries the asserted content; and version with size_bytes record how large and how current the governing artifact remains—forming the minimal vocabulary by which process inputs from batch ingestion through ETL transformation, and security controls from AC-3 through SA-4, can be referenced, validated, and reproduced in operational compliance workflows.

**fact_schemaorg**

| id | affiliation_key | size_bytes | version |
| --- | --- | --- | --- |
| AFFI-0001 | AFFI-0001 | 895265030 | 3 |
| AFFI-0002 | AFFI-0004 | 114301972 | 5 |
| AFFI-0003 | AFFI-0002 | 338701831 | 4 |
| AFFI-0004 | AFFI-0003 | 998785819 | 8 |

**dim_affiliation**

| id | affiliation_label | affiliation_category |
| --- | --- | --- |
| AFFI-0001 | Affiliation Label 01 | Affiliation Category 01 |
| AFFI-0002 | Affiliation Label 02 | Affiliation Category 02 |
| AFFI-0003 | Affiliation Label 03 | Affiliation Category 03 |
| AFFI-0004 | Affiliation Label 04 | Affiliation Category 04 |
| AFFI-0005 | Affiliation Label 05 | Affiliation Category 05 |
| AFFI-0006 | Affiliation Label 06 | Affiliation Category 06 |

**t_nist80053_control_subclass_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| CONT-0001 | effective_date | xsd:date |
| CONT-0002 | enforcement | xsd:string |
| CONT-0003 | mandatory | xsd:boolean |
| CONT-0004 | priority | xsd:integer |
| CONT-0005 | review_cycle_days | xsd:integer |
| CONT-0006 | scope | xsd:string |
| CONT-0007 | encoding | xsd:string |
| CONT-0008 | label_text | xsd:string |

**t_nist80053_control_subclass_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONT-0001 | CONT-0001 | CONT-0001 | 2023-01-02 |
| CONT-0002 | CONT-0002 | CONT-0001 | 2024-11-29 |
| CONT-0003 | CONT-0003 | CONT-0001 | 2024-03-23 |
| CONT-0004 | CONT-0004 | CONT-0001 | 2025-03-12 |
| CONT-0005 | CONT-0005 | CONT-0001 | 2024-03-19 |
| CONT-0006 | CONT-0006 | CONT-0001 | 2023-10-15 |

**t_nist80053_control_subclass_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONT-0001 | CONT-0001 | CONT-0004 | 3 |
| CONT-0002 | CONT-0001 | CONT-0005 | 776 |
| CONT-0003 | CONT-0002 | CONT-0004 | 4 |
| CONT-0004 | CONT-0002 | CONT-0005 | 46 |
| CONT-0005 | CONT-0003 | CONT-0004 | 1 |
| CONT-0006 | CONT-0003 | CONT-0005 | 151 |
| CONT-0007 | CONT-0004 | CONT-0004 | 4 |
| CONT-0008 | CONT-0004 | CONT-0005 | 507 |