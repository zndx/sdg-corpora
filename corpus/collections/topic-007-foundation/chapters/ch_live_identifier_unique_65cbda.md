---
chapter_id: ch_live_identifier_unique_65cbda
topic_id: 7
family: 01_foundation
cited_terms: ['identifier_unique', 'labrun_with_protocol', 'profiling_targets_dataset']
model: engine-refine
---

Identifier systems serve as the foundational addressing layer across distributed research infrastructures, where each entity receives a globally scoped handle that may encode both format and provenance. The identifier column carries values such as `10.1038/s41586-023-06123` for a Nature-indexed publication, `W3C-DOI:10.1002/anie.202112345` for a Wiley chemistry article, `PDB-7XYZ-A` for a Protein Data Bank structure, and `FDA 510(k) Database` for a regulatory submission. Each identifier is paired with a `checksum_algo` value—`md5`, `sha1`, or `blake2b`—that governs integrity verification of the associated resource, and a `language` designation such as `ja`, `en`, or `es` that records the linguistic context of the source. The surrogate key `id` column, bearing values like `UNIQ-0001` through `UNIQ-0004`, provides an internal namespace for referential operations while the `identifies` column names the target resource, ranging from `OSMnx Graph Library` to `CERN Telemetry Stream`. This separation between the internal surrogate and the external identifier enables cross-referencing without coupling the system to any single naming authority.

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

Laboratory run protocols are tracked through a relational structure that binds a run identifier to a named protocol, with the `labrun` column recording execution names such as `MassSpec_LC_MS` and `Nanopore_FC_Nine`, and the `follows_protocol` column specifying the procedural template, including `Microbiome_QIIME2_Pipe`, `SingleCell_Gelbead10x`, `MassSpec_QTOF_Cal`, and `FlowCytometry_Panel7`. The attribute schema for these runs is defined in a metadata table where `attr_name` enumerates properties like `duration_seconds`, `end_time`, `exit_code`, and `host_name`, each paired with an `attr_type` drawn from the XSD type vocabulary: `xsd:decimal`, `xsd:dateTime`, `xsd:integer`, and `xsd:string`. This type annotation is critical because it determines how values are stored, validated, and queried across the value tables that follow an entity-attribute-value pattern.

**t_labrun_with_protocol**

| id | labrun | follows_protocol |
| --- | --- | --- |
| PROT-0001 | MassSpec_LC_MS | Microbiome_QIIME2_Pipe |
| PROT-0002 | Nanopore_FC_Nine | SingleCell_Gelbead10x |
| PROT-0003 | Nanopore_FC_Nine | MassSpec_QTOF_Cal |
| PROT-0004 | MassSpec_LC_MS | FlowCytometry_Panel7 |
| PROT-0005 | Microbiome_16S_Seq | Nanopore_Basecall_v2 |
| PROT-0006 | Proteomics_ICP_MS | PCR_ColdStart |

**t_labrun_with_protocol_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| PROT-0001 | duration_seconds | xsd:decimal |
| PROT-0002 | end_time | xsd:dateTime |
| PROT-0003 | exit_code | xsd:integer |
| PROT-0004 | host_name | xsd:string |
| PROT-0005 | log_level | xsd:string |
| PROT-0006 | phase | xsd:string |
| PROT-0007 | retry_count | xsd:integer |
| PROT-0008 | scheduled_at | xsd:dateTime |

**t_labrun_with_protocol_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PROT-0001 | PROT-0001 | PROT-0002 | 2023-11-19T15:13:31 |
| PROT-0002 | PROT-0001 | PROT-0008 | 2023-04-19T03:43:36 |
| PROT-0003 | PROT-0001 | PROT-0009 | 2023-06-05T09:50:58 |
| PROT-0004 | PROT-0002 | PROT-0002 | 2023-12-21T19:08:32 |
| PROT-0005 | PROT-0002 | PROT-0008 | 2023-06-26T20:13:34 |
| PROT-0006 | PROT-0002 | PROT-0009 | 2023-11-18T07:40:33 |
| PROT-0007 | PROT-0003 | PROT-0002 | 2024-09-05T03:02:45 |
| PROT-0008 | PROT-0003 | PROT-0008 | 2024-06-07T02:35:38 |

**t_labrun_with_protocol_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PROT-0001 | PROT-0001 | PROT-0001 | 301.25 |
| PROT-0002 | PROT-0002 | PROT-0001 | 4042.33 |
| PROT-0003 | PROT-0003 | PROT-0001 | 6125.88 |
| PROT-0004 | PROT-0004 | PROT-0001 | 1565.69 |
| PROT-0005 | PROT-0005 | PROT-0001 | 1033.06 |
| PROT-0006 | PROT-0006 | PROT-0001 | 3134.56 |

**t_labrun_with_protocol_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PROT-0001 | PROT-0001 | PROT-0003 | 497 |
| PROT-0002 | PROT-0001 | PROT-0007 | 434 |
| PROT-0003 | PROT-0002 | PROT-0003 | 538 |
| PROT-0004 | PROT-0002 | PROT-0007 | 309 |
| PROT-0005 | PROT-0003 | PROT-0003 | 513 |
| PROT-0006 | PROT-0003 | PROT-0007 | 375 |
| PROT-0007 | PROT-0004 | PROT-0003 | 355 |
| PROT-0008 | PROT-0004 | PROT-0007 | 171 |

**t_labrun_with_protocol_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PROT-0001 | PROT-0001 | PROT-0004 | node-b14 |
| PROT-0002 | PROT-0001 | PROT-0005 | Log Level 02 |
| PROT-0003 | PROT-0001 | PROT-0006 | closeout |
| PROT-0004 | PROT-0001 | PROT-0010 | running |
| PROT-0005 | PROT-0001 | PROT-0011 | Triggered By 05 |
| PROT-0006 | PROT-0002 | PROT-0004 | worker-07 |
| PROT-0007 | PROT-0002 | PROT-0005 | Log Level 07 |
| PROT-0008 | PROT-0002 | PROT-0006 | review |

The value tables implement a type-disaggregated EAV design, with separate tables for datetime, decimal, integer, and varchar values. Each value row carries an `entity_id` that references the protocol run, an `attr_id` that references the attribute definition, and a `value` column holding the actual data. Decimal attributes such as `duration_seconds` store measurements like `301.25`, `4042.33`, `6125.88`, and `1565.69` seconds across runs identified by `PROT-0001` through `PROT-0004`. Integer attributes capture exit codes and host identifiers with values such as `497`, `434`, `538`, and `309`. Datetime attributes record timestamps including `2023-11-19T15:13:31`, `2023-04-19T03:43:36`, `2023-06-05T09:50:58`, and `2023-12-21T19:08:32`. Varchar attributes hold free-form strings like `node-b14`, `Log Level 02`, `closeout`, and `running`. The `entity_id` column in each value table establishes the foreign-key relationship back to the protocol run, while the `attr_id` column resolves to the attribute definition, creating a three-way join that reconstructs the full attribute set for any given run.

Profiling data is modeled as a star schema with a fact table and a dimension table. The fact table `fact_profiling` records quantitative metrics for each profiling session, including `duration_seconds` values such as `6716.87`, `1113.38`, `2546.61`, and `2074.93`, `exit_code` values like `725`, `809`, `348`, and `827`, and `retry_count` values of `209`, `186`, `303`, and `264`. The `profiling_key` column links each fact row to the dimension table, where `profiling_label` provides human-readable names such as `Profiling Label 01` through `Profiling Label 04`, and `profiling_category` assigns categorical groupings like `Profiling Category 01` through `Profiling Category 04`. This separation of measures from dimensions enables aggregation across categories and supports time-series analysis of profiling performance without denormalizing the metric data. The `exit` code and `retry_count` fields together form a reliability signal: high retry counts paired with non-zero exit codes indicate systemic failures that warrant investigation, while low retry counts with zero exit codes suggest stable execution.

**fact_profiling**

| id | profiling_key | duration_seconds | exit_code | retry_count |
| --- | --- | --- | --- | --- |
| DATA-0001 | DATA-0003 | 6716.87 | 725 | 209 |
| DATA-0002 | DATA-0006 | 1113.38 | 809 | 186 |
| DATA-0003 | DATA-0006 | 2546.61 | 348 | 303 |
| DATA-0004 | DATA-0006 | 2074.93 | 827 | 264 |

**dim_profiling**

| id | profiling_label | profiling_category |
| --- | --- | --- |
| DATA-0001 | Profiling Label 01 | Profiling Category 01 |
| DATA-0002 | Profiling Label 02 | Profiling Category 02 |
| DATA-0003 | Profiling Label 03 | Profiling Category 03 |
| DATA-0004 | Profiling Label 04 | Profiling Category 04 |
| DATA-0005 | Profiling Label 05 | Profiling Category 05 |
| DATA-0006 | Profiling Label 06 | Profiling Category 06 |