---
chapter_id: ch_live_ebpfmap_used_by_program_019d1d
topic_id: 45
family: 04_ebpf_kernel
cited_terms: ['ebpfmap_used_by_program', 'insertion_loss_specification', 'plausibility_function_for']
model: engine-refine
---

The architecture of the specification registry rests on a separation between declarative metadata and typed value storage, a pattern that enables both schema flexibility and query precision. Each specification entity—identified by a code such as SPEC-0001 or SPEC-0002—is anchored by an insertion loss specification descriptor, which in practice takes values like Connector-Loss-Baseline, Filter-Insertion-Depth, and Transceiver-Margin-Spec. These descriptors classify the nature of the specification without constraining the attributes that may be attached to it. The attribute definitions themselves live in a parallel registry where each attribute carries a name—confidence, dimension_kind, method, recorded_at—and a type drawn from the XML Schema namespace, including xsd:decimal, xsd:string, and xsd:dateTime. This type annotation is not decorative; it governs which value table receives the data, ensuring that a decimal measurement such as 0.131 or 129.10 never collides with a string value like Dimension Kind 01 or a timestamp such as 2024-12-28T03:34:41.

The value tables implement a vertical partitioning strategy that mirrors the type system. For insertion loss specifications, three distinct value tables—t_insertion_loss_specification_val_decimal, t_insertion_loss_specification_val_varchar, and t_insertion_loss_specification_val_datetime—each hold rows keyed by a surrogate identifier and linked back to the specification entity through an entity_id column and to the attribute definition through an attr_id column. A single entity, SPEC-0001, for instance, accumulates values across all three tables: a confidence of 0.131 in the decimal store, a dimension_kind of Dimension Kind 01 in the varchar store, and a recorded_at timestamp of 2024-12-28T03:34:41 in the datetime store. The attr_id references point into the attribute registry—SPEC-0001 maps to confidence, SPEC-0004 to recorded_at—creating a two-hop resolution from any value row to its semantic meaning. This design permits heterogeneous attributes to coexist on the same entity without null columns or type coercion, at the cost of requiring joins across the attribute definition table to reconstruct a complete specification profile.

**t_insertion_loss_specification**

| id | insertion_loss_specification |
| --- | --- |
| SPEC-0001 | Connector-Loss-Baseline |
| SPEC-0002 | Connector-Loss-Baseline |
| SPEC-0003 | Filter-Insertion-Depth |
| SPEC-0004 | Transceiver-Margin-Spec |
| SPEC-0005 | Antenna-Feed-Loss |
| SPEC-0006 | Optic-Coupler-Loss |

**t_insertion_loss_specification_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| SPEC-0001 | confidence | xsd:decimal |
| SPEC-0002 | dimension_kind | xsd:string |
| SPEC-0003 | method | xsd:string |
| SPEC-0004 | recorded_at | xsd:dateTime |
| SPEC-0005 | uncertainty | xsd:decimal |
| SPEC-0006 | unit | xsd:string |
| SPEC-0007 | value | xsd:decimal |
| SPEC-0008 | encoding | xsd:string |

**t_insertion_loss_specification_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SPEC-0001 | SPEC-0001 | SPEC-0004 | 2024-12-28T03:34:41 |
| SPEC-0002 | SPEC-0002 | SPEC-0004 | 2023-07-30T00:55:27 |
| SPEC-0003 | SPEC-0003 | SPEC-0004 | 2024-10-08T23:01:51 |
| SPEC-0004 | SPEC-0004 | SPEC-0004 | 2024-02-08T16:58:47 |
| SPEC-0005 | SPEC-0005 | SPEC-0004 | 2024-02-29T05:58:20 |
| SPEC-0006 | SPEC-0006 | SPEC-0004 | 2023-08-21T07:18:41 |

**t_insertion_loss_specification_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SPEC-0001 | SPEC-0001 | SPEC-0001 | 0.131 |
| SPEC-0002 | SPEC-0001 | SPEC-0005 | 129.10 |
| SPEC-0003 | SPEC-0001 | SPEC-0007 | 470.08 |
| SPEC-0004 | SPEC-0002 | SPEC-0001 | 0.111 |
| SPEC-0005 | SPEC-0002 | SPEC-0005 | 499.91 |
| SPEC-0006 | SPEC-0002 | SPEC-0007 | 156.27 |
| SPEC-0007 | SPEC-0003 | SPEC-0001 | 0.125 |
| SPEC-0008 | SPEC-0003 | SPEC-0005 | 625.08 |

**t_insertion_loss_specification_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SPEC-0001 | SPEC-0001 | SPEC-0002 | Dimension Kind 01 |
| SPEC-0002 | SPEC-0001 | SPEC-0008 | Encoding 02 |
| SPEC-0003 | SPEC-0001 | SPEC-0009 | intake form |
| SPEC-0004 | SPEC-0001 | SPEC-0010 | fr |
| SPEC-0005 | SPEC-0001 | SPEC-0003 | automated |
| SPEC-0006 | SPEC-0001 | SPEC-0006 | ratio |
| SPEC-0007 | SPEC-0002 | SPEC-0002 | Dimension Kind 07 |
| SPEC-0008 | SPEC-0002 | SPEC-0008 | Encoding 08 |

**t_plausibility_function_for_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| FUNC-0001 | FUNC-0001 | FUNC-0002 | Dimension Kind 01 |
| FUNC-0002 | FUNC-0001 | FUNC-0008 | Encoding 02 |
| FUNC-0003 | FUNC-0001 | FUNC-0009 | pre-release note |
| FUNC-0004 | FUNC-0001 | FUNC-0010 | en |
| FUNC-0005 | FUNC-0001 | FUNC-0003 | manual |
| FUNC-0006 | FUNC-0001 | FUNC-0006 | kg |
| FUNC-0007 | FUNC-0002 | FUNC-0002 | Dimension Kind 07 |
| FUNC-0008 | FUNC-0002 | FUNC-0008 | Encoding 08 |

The plausibility function registry mirrors this architecture with structural fidelity. The t_plausibility_function_for table defines functions by a plausibility label—firmware_version_mismatch, disputed_rating, weak_indication, model_convergence_failure—and a plausibility_for_claim target such as temperature_threshold_exceeded or packet_loss_rate_high. Its attribute and value tables follow the same three-way split: t_plausibility_function_for_attr declares that FUNC-0001 carries a confidence attribute of type xsd:decimal and a recorded_at attribute of type xsd:dateTime, while the corresponding value tables store 0.286 and 2023-05-06T07:18:55 respectively for entity FUNC-0001. The parallelism between the insertion loss and plausibility registries is intentional; it establishes a reusable pattern where any domain entity can be enriched with typed attributes without schema migration.

**t_plausibility_function_for**

| id | plausibility | plausibility_for_claim |
| --- | --- | --- |
| FUNC-0001 | firmware_version_mismatch | temperature_threshold_exceeded |
| FUNC-0002 | disputed_rating | weak_indication |
| FUNC-0003 | weak_indication | disk_io_saturation |
| FUNC-0004 | model_convergence_failure | packet_loss_rate_high |
| FUNC-0005 | network_latency_spike | divergent_metric |
| FUNC-0006 | authentication_token_expired | high_confidence |
| FUNC-0007 | packet_loss_rate_high | model_convergence_failure |

**t_plausibility_function_for_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| FUNC-0001 | confidence | xsd:decimal |
| FUNC-0002 | dimension_kind | xsd:string |
| FUNC-0003 | method | xsd:string |
| FUNC-0004 | recorded_at | xsd:dateTime |
| FUNC-0005 | uncertainty | xsd:decimal |
| FUNC-0006 | unit | xsd:string |
| FUNC-0007 | value | xsd:decimal |
| FUNC-0008 | encoding | xsd:string |

**t_plausibility_function_for_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| FUNC-0001 | FUNC-0001 | FUNC-0004 | 2023-05-06T07:18:55 |
| FUNC-0002 | FUNC-0002 | FUNC-0004 | 2023-03-14T16:18:20 |
| FUNC-0003 | FUNC-0003 | FUNC-0004 | 2024-05-13T15:52:44 |
| FUNC-0004 | FUNC-0004 | FUNC-0004 | 2025-06-06T01:40:51 |
| FUNC-0005 | FUNC-0005 | FUNC-0004 | 2023-05-21T17:57:56 |
| FUNC-0006 | FUNC-0006 | FUNC-0004 | 2024-10-18T22:54:00 |
| FUNC-0007 | FUNC-0007 | FUNC-0004 | 2023-11-29T06:24:08 |

**t_plausibility_function_for_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| FUNC-0001 | FUNC-0001 | FUNC-0001 | 0.286 |
| FUNC-0002 | FUNC-0001 | FUNC-0005 | 84.30 |
| FUNC-0003 | FUNC-0001 | FUNC-0007 | 878.30 |
| FUNC-0004 | FUNC-0002 | FUNC-0001 | 0.033 |
| FUNC-0005 | FUNC-0002 | FUNC-0005 | 492.02 |
| FUNC-0006 | FUNC-0002 | FUNC-0007 | 356.58 |
| FUNC-0007 | FUNC-0003 | FUNC-0001 | 0.482 |
| FUNC-0008 | FUNC-0003 | FUNC-0005 | 926.97 |

Program-level metadata occupies a complementary dimension of the model. The fact_ebpfmap table records program artifacts with identifiers PROG-0001 through PROG-0004, each associated with a used_by_program foreign key that resolves to the dim_used_by_program dimension. That dimension table provides the human-readable label—Used By Program Label 01, Used By Program Label 02—and a category assignment, Used By Program Category 01 through Used By Program Category 04. The fact table itself carries a size_bytes column that quantifies the artifact, with values ranging from 31105012 bytes for PROG-0003 to 354373995 bytes for PROG-0004, and a version column that tracks revisions, taking values 3, 5, 6, and 12 across the four records. The used_by_program_key column in the fact table creates the join to the dimension, enabling aggregation by category or label while preserving the granular size and version information at the fact level.

**fact_ebpfmap**

| id | used_by_program_key | size_bytes | version |
| --- | --- | --- | --- |
| PROG-0001 | PROG-0005 | 208979093 | 3 |
| PROG-0002 | PROG-0004 | 156714508 | 6 |
| PROG-0003 | PROG-0005 | 31105012 | 12 |
| PROG-0004 | PROG-0002 | 354373995 | 5 |
| PROG-0005 | PROG-0004 | 866267293 | 2 |

**dim_used_by_program**

| id | used_by_program_label | used_by_program_category |
| --- | --- | --- |
| PROG-0001 | Used By Program Label 01 | Used By Program Category 01 |
| PROG-0002 | Used By Program Label 02 | Used By Program Category 02 |
| PROG-0003 | Used By Program Label 03 | Used By Program Category 03 |
| PROG-0004 | Used By Program Label 04 | Used By Program Category 04 |
| PROG-0005 | Used By Program Label 05 | Used By Program Category 05 |
| PROG-0006 | Used By Program Label 06 | Used By Program Category 06 |

The interplay between these registries supports traceability across specification, plausibility, and program domains. An insertion loss specification identified by SPEC-0001 carries a recorded_at value of 2024-12-28T03:34:41, establishing temporal provenance for the measurement. A plausibility function identified by FUNC-0001 records its own timestamp at 2023-05-06T07:18:55, and its confidence attribute registers 0.286, a value that sits below the 0.131 confidence recorded for the insertion loss entity SPEC-0001. These cross-entity comparisons are enabled by the shared attribute type system: because both entities store confidence as xsd:decimal in their respective value tables, the values are directly comparable despite originating from different registries. The category and label dimensions on the program side provide an orthogonal classification layer, allowing the same size_bytes and version attributes to be aggregated under Used By Program Category 01 or Used By Program Category 02 without altering the underlying fact data. This layered approach—typed attributes for measurement, categorical dimensions for classification, and versioned facts for provenance—forms the backbone of a specification governance framework that scales without sacrificing query performance or data integrity.