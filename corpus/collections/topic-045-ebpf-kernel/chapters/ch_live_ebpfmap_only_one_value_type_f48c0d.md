---
chapter_id: ch_live_ebpfmap_only_one_value_type_f48c0d
topic_id: 45
family: 04_ebpf_kernel
cited_terms: ['ebpfmap_only_one_value_type', 'trace_min_one_span', 'reference_within_dataset']
model: engine-refine
---

The architecture of the dataset rests upon a disciplined separation between measured quantities and their descriptive metadata, a pattern that recurs across every subject area. In the trace domain, each observation is anchored by an identifier—SPAN-0001 through SPAN-0004—and linked to a span key that references a corresponding dimension record. The fact table records three operational metrics for every trace: duration in seconds, which ranges from 1874.27 to 3940.66 across the sample; an exit code, with values such as 491, 900, 420, and 60 indicating the terminal state of the traced operation; and a retry count, where observed values of 399, 179, 396, and 459 reflect the number of recovery attempts before final resolution. The span dimension itself carries a label and a category, both stored as miscellaneous descriptive fields, enabling analysts to group traces by functional area or execution context without conflating classification with measurement.

**dim_value_type_map**

| id | value_type_map_label | value_type_map_category |
| --- | --- | --- |
| TYPE-0001 | Value Type Map Label 01 | Value Type Map Category 01 |
| TYPE-0002 | Value Type Map Label 02 | Value Type Map Category 02 |
| TYPE-0003 | Value Type Map Label 03 | Value Type Map Category 03 |
| TYPE-0004 | Value Type Map Label 04 | Value Type Map Category 04 |
| TYPE-0005 | Value Type Map Label 05 | Value Type Map Category 05 |
| TYPE-0006 | Value Type Map Label 06 | Value Type Map Category 06 |

**fact_trace**

| id | spans_key | duration_seconds | exit_code | retry_count |
| --- | --- | --- | --- | --- |
| SPAN-0001 | SPAN-0005 | 1874.27 | 491 | 399 |
| SPAN-0002 | SPAN-0002 | 2092.44 | 900 | 179 |
| SPAN-0003 | SPAN-0004 | 3940.66 | 420 | 396 |
| SPAN-0004 | SPAN-0006 | 3336.66 | 60 | 459 |

**dim_spans**

| id | spans_label | spans_category |
| --- | --- | --- |
| SPAN-0001 | Spans Label 01 | Spans Category 01 |
| SPAN-0002 | Spans Label 02 | Spans Category 02 |
| SPAN-0003 | Spans Label 03 | Spans Category 03 |
| SPAN-0004 | Spans Label 04 | Spans Category 04 |
| SPAN-0005 | Spans Label 05 | Spans Category 05 |
| SPAN-0006 | Spans Label 06 | Spans Category 06 |

**t_reference_within_dataset**

| id | reference | points_to | part_of |
| --- | --- | --- | --- |
| DATA-0001 | PROVENANCE-MAP-V4 | feature_store_metrics | ml_training_run |
| DATA-0002 | SCHEMA-REF-ALPHA | production_schema | regulatory_submission |
| DATA-0003 | PROVENANCE-MAP-V4 | model_artifact_x7 | cloud_storage_bucket |
| DATA-0004 | QC-PROTOCOL-V2 | model_artifact_x7 | enterprise_data_catalog |
| DATA-0005 | DOC-2023-04A | feature_store_metrics | compliance_audit_cycle |
| DATA-0006 | DATA-DICT-PROD | compliance_register | regulatory_submission |

A parallel structure governs the eBPF map inventory, where each map is identified by a code such as TYPE-0001 and associated with a type map key—TYPE-0002 or TYPE-0003—that points to a dimension table of value type maps. The fact table records the size of each map in bytes, with observed values spanning from 31105012 to 354373995, and a version number that tracks schema evolution across revisions 3, 6, 12, and 5. The value type map dimension supplies the human-readable label and the categorical classification for each type map entry, again using miscellaneous and category fields to preserve the distinction between what a type map is called and what class of type map it represents. This separation ensures that renaming or reclassification of a type map does not require updates to the fact table, preserving referential integrity across analytical queries.

The reference-within-dataset layer introduces an entity-attribute-value model that captures heterogeneous metadata about dataset objects. Each entity—identified by codes such as DATA-0001 and DATA-0002—is associated with a set of attributes defined in a schema table, where attribute names like checksum_algo, code, format, and issued_date are paired with their XSD types, including xsd:string and xsd:date. Attribute values are stored in two specialized value tables: one for variable-length strings and another for date values. In the string value table, entity DATA-0001 carries multiple attribute assignments, including the value A-01 for attribute DATA-0002 and RFC-3339 for attribute DATA-0003, while the date value table records issued_date values such as 2024-10-25 and 2023-04-24 for the same and related entities. This design accommodates schemas that evolve independently of the entities they describe, allowing new attributes to be introduced without altering the underlying table structure.

**t_reference_within_dataset_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| DATA-0001 | checksum_algo | xsd:string |
| DATA-0002 | code | xsd:string |
| DATA-0003 | format | xsd:string |
| DATA-0004 | issued_date | xsd:date |
| DATA-0005 | namespace | xsd:string |
| DATA-0006 | encoding | xsd:string |
| DATA-0007 | label_text | xsd:string |
| DATA-0008 | language | xsd:string |

**t_reference_within_dataset_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DATA-0001 | DATA-0001 | DATA-0004 | 2024-10-25 |
| DATA-0002 | DATA-0002 | DATA-0004 | 2024-06-06 |
| DATA-0003 | DATA-0003 | DATA-0004 | 2023-04-24 |
| DATA-0004 | DATA-0004 | DATA-0004 | 2023-10-13 |
| DATA-0005 | DATA-0005 | DATA-0004 | 2023-04-15 |
| DATA-0006 | DATA-0006 | DATA-0004 | 2024-06-08 |

**t_reference_within_dataset_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DATA-0001 | DATA-0001 | DATA-0001 | Checksum Algo 01 |
| DATA-0002 | DATA-0001 | DATA-0002 | A-01 |
| DATA-0003 | DATA-0001 | DATA-0006 | Encoding 03 |
| DATA-0004 | DATA-0001 | DATA-0003 | RFC-3339 |
| DATA-0005 | DATA-0001 | DATA-0007 | intake form |
| DATA-0006 | DATA-0001 | DATA-0008 | en |
| DATA-0007 | DATA-0001 | DATA-0005 | Namespace 07 |
| DATA-0008 | DATA-0002 | DATA-0001 | Checksum Algo 08 |

The consistent use of identifier columns as primary keys across all tables, combined with foreign-key relationships that connect fact tables to their respective dimensions, establishes a star-schema topology that supports both operational monitoring and analytical aggregation. The exit codes and retry counts in the trace fact table enable root-cause analysis by correlating terminal states with the number of recovery attempts, while the duration measurements provide a basis for performance benchmarking across span categories. Similarly, the size bytes and version fields in the eBPF map fact table allow capacity planning and version tracking to proceed independently of the type map classifications maintained in the dimension table. The entity-attribute-value layer, with its explicit attr and attr_type columns, provides a mechanism for storing regulatory provenance information—such as the reference PROVENANCE-MAP-V4 pointing to model_artifact_x7 within the ml_training_run context—without hardcoding attribute names into the schema, thereby supporting compliance frameworks that require flexible metadata capture alongside immutable operational telemetry.

**fact_ebpfmap**

| id | value_type_map_key | size_bytes | version |
| --- | --- | --- | --- |
| TYPE-0001 | TYPE-0002 | 208979093 | 3 |
| TYPE-0002 | TYPE-0002 | 156714508 | 6 |
| TYPE-0003 | TYPE-0002 | 31105012 | 12 |
| TYPE-0004 | TYPE-0003 | 354373995 | 5 |
| TYPE-0005 | TYPE-0002 | 866267293 | 2 |