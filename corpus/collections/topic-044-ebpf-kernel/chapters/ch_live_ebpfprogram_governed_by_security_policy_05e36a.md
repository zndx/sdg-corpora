---
chapter_id: ch_live_ebpfprogram_governed_by_security_policy_05e36a
topic_id: 44
family: 04_ebpf_kernel
cited_terms: ['ebpfprogram_governed_by_security_policy', 'table_topic_tag', 'measurement_of_artifact']
model: engine-refine
---

In observability and compliance-oriented telemetry governance, an **entity** denotes the object under measurement or policy control—a concrete artifact instance such as ARTI-0001 through ARTI-0004, each bound to a named measurement channel (for example `latency_p99_ms` on ARTI-0001 and ARTI-0003, `yield_stress_test` on ARTI-0002, `pressure_transducer` on ARTI-0004). Entities do not carry their descriptive payload inline; instead they anchor a typed attribute lattice in which every observed datum is attributed to both an entity and an **attr** definition. That separation is what permits heterogeneous measurements—decimal confidence scores, string-encoded dimension kinds, and ISO-8601 timestamps—to coexist under one governance model without schema churn.

**t_measurement_of_artifact_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ARTI-0001 | confidence | xsd:decimal |
| ARTI-0002 | dimension_kind | xsd:string |
| ARTI-0003 | method | xsd:string |
| ARTI-0004 | recorded_at | xsd:dateTime |
| ARTI-0005 | uncertainty | xsd:decimal |
| ARTI-0006 | unit | xsd:string |
| ARTI-0007 | value | xsd:decimal |
| ARTI-0008 | encoding | xsd:string |

An **attr** is the semantic name of a measurable or reportable property (`confidence`, `dimension_kind`, `method`, `recorded_at`), while **attr_type** fixes its syntactic and validation contract through XSD-aligned declarations (`xsd:decimal`, `xsd:string`, `xsd:dateTime`). Typed value stores then enforce those contracts at persistence: decimal observations such as 0.670 and 361.86 land only where `xsd:decimal` is declared, varchar payloads such as `Dimension Kind 01` and `intake form` respect string typing, and datetime values (`2023-05-19T07:46:35` through `2024-05-29T07:18:18`) populate the temporal slot defined by `recorded_at`. In practice, attr and attr_type jointly implement an entity–attribute–value discipline that scales when new observables appear faster than relational redesign cycles can absorb them.

Stable cross-referencing depends on the **identifier**, a surrogate key that must remain immutable for the life of a governed record. Identifiers such as POLI-0001, TAG-0001, and ARTI-0001 function as join keys across fact and dimension relations and as foreign keys in multi-table attribute bindings (entity_id paired with attr_id). Where the same logical program or topic recurs in fact grains—as when POLI-0003 appears twice in program deployment facts, or TAG-0001 anchors three separate table-topic observations—the identifier preserves lineage while permitting multiple quantitative realizations. Governance reviews therefore treat identifier integrity as a prerequisite for audit reconstruction, not merely a database convenience.

**Category** supplies the controlled vocabulary that collapses fine-grained labels into policy-relevant groupings. Dimension rows assign each ebpfprogram and table_topic to a category (`Ebpfprogram Category 01` through `04`, `Table Topic Category 01` through `04`), enabling rollups, exception routing, and scope filters without rewriting fact tables. **Misc** fields carry the human-readable or payload-specific content that categories intentionally abstract: program labels, topic labels, measured values (608.50, 639.23), and categorical strings (`Encoding 02`, `fr`). The misc designation signals that the column is semantically rich but not itself a join key—appropriate for display text, encoded enumerations, and raw measurements that downstream rules interpret through attr_type and category context.

**dim_ebpfprogram**

| id | ebpfprogram_label | ebpfprogram_category |
| --- | --- | --- |
| POLI-0001 | Ebpfprogram Label 01 | Ebpfprogram Category 01 |
| POLI-0002 | Ebpfprogram Label 02 | Ebpfprogram Category 02 |
| POLI-0003 | Ebpfprogram Label 03 | Ebpfprogram Category 03 |
| POLI-0004 | Ebpfprogram Label 04 | Ebpfprogram Category 04 |
| POLI-0005 | Ebpfprogram Label 05 | Ebpfprogram Category 05 |
| POLI-0006 | Ebpfprogram Label 06 | Ebpfprogram Category 06 |
| POLI-0007 | Ebpfprogram Label 07 | Ebpfprogram Category 07 |
| POLI-0008 | Ebpfprogram Label 08 | Ebpfprogram Category 08 |

**dim_table_topic**

| id | table_topic_label | table_topic_category |
| --- | --- | --- |
| TAG-0001 | Table Topic Label 01 | Table Topic Category 01 |
| TAG-0002 | Table Topic Label 02 | Table Topic Category 02 |
| TAG-0003 | Table Topic Label 03 | Table Topic Category 03 |
| TAG-0004 | Table Topic Label 04 | Table Topic Category 04 |
| TAG-0005 | Table Topic Label 05 | Table Topic Category 05 |
| TAG-0006 | Table Topic Label 06 | Table Topic Category 06 |

Program inventory governance centers on **ebpfprogram** as a first-class deployable artifact whose operational footprint is captured by **size_bytes** and whose revision history is tracked through **version**. Observed sizes span roughly 113 MB to 784 MB across POLI-0001–POLI-0004, with versions 9, 11, and 12 coexisting in the same population—evidence that bytecode or object-store payloads evolve independently of categorical placement. A fact row may reference an ebpfprogram_key (POLI-0005) whose dimension row is absent from the current slice, which is precisely the condition compliance workflows must detect: deployed artifacts referenced in telemetry or policy facts but not yet registered in the authoritative dimension. Size and version together support capacity planning, change-control attestations, and diff analysis when kernel-attached programs are promoted across environments.

**fact_ebpfprogram**

| id | ebpfprogram_key | size_bytes | version |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | 784335640 | 12 |
| POLI-0002 | POLI-0003 | 641704069 | 9 |
| POLI-0003 | POLI-0003 | 113209263 | 11 |
| POLI-0004 | POLI-0005 | 161013093 | 12 |
| POLI-0005 | POLI-0004 | 352203820 | 12 |
| POLI-0006 | POLI-0003 | 167519051 | 1 |

Analytic assertions over curated topics pair a **table_topic** subject with **confidence** and **uncertainty** as complementary quality signals. Three observations tied to TAG-0001 exhibit confidence from 0.140 to 0.609 against uncertainties of 648.78–899.39, while TAG-0005 shows higher confidence (0.874) with markedly lower uncertainty (289.58)—a pattern auditors read as improved estimator stability rather than mere magnitude shift. Confidence encodes belief in the stated value; uncertainty quantifies dispersion or bounds around that belief. Used together with the reported values themselves, they determine whether a metric may enter a compliance dashboard, trigger an exception, or require corroboration from independent measurement_of_artifact attributes such as the decimal confidence 0.670 recorded on ARTI-0001. The domain therefore treats table_topic facts as scored propositions, ebpfprogram facts as versioned binary assets, and entity-bound attributes as the ground-truth observation layer—three grains, one identifier discipline, and a single evidentiary chain from raw measurement through categorized, confidence-weighted reporting.

**fact_table**

| id | table_topic_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| TAG-0001 | TAG-0001 | 0.274 | 648.78 | 608.50 |
| TAG-0002 | TAG-0001 | 0.140 | 899.39 | 639.23 |
| TAG-0003 | TAG-0001 | 0.609 | 885.54 | 470.53 |
| TAG-0004 | TAG-0005 | 0.874 | 289.58 | 720.41 |

**t_measurement_of_artifact**

| id | measurement |
| --- | --- |
| ARTI-0001 | latency_p99_ms |
| ARTI-0002 | yield_stress_test |
| ARTI-0003 | latency_p99_ms |
| ARTI-0004 | pressure_transducer |
| ARTI-0005 | humidity_dew_point |
| ARTI-0006 | ambient_temp_22C |

**t_measurement_of_artifact_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0004 | 2023-05-19T07:46:35 |
| ARTI-0002 | ARTI-0002 | ARTI-0004 | 2023-01-19T07:45:29 |
| ARTI-0003 | ARTI-0003 | ARTI-0004 | 2023-07-23T03:47:45 |
| ARTI-0004 | ARTI-0004 | ARTI-0004 | 2024-05-29T07:18:18 |
| ARTI-0005 | ARTI-0005 | ARTI-0004 | 2025-04-05T23:37:46 |
| ARTI-0006 | ARTI-0006 | ARTI-0004 | 2025-01-30T06:20:58 |

**t_measurement_of_artifact_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0001 | 0.670 |
| ARTI-0002 | ARTI-0001 | ARTI-0005 | 226.14 |
| ARTI-0003 | ARTI-0001 | ARTI-0007 | 361.86 |
| ARTI-0004 | ARTI-0002 | ARTI-0001 | 0.088 |
| ARTI-0005 | ARTI-0002 | ARTI-0005 | 798.78 |
| ARTI-0006 | ARTI-0002 | ARTI-0007 | 163.07 |
| ARTI-0007 | ARTI-0003 | ARTI-0001 | 0.775 |
| ARTI-0008 | ARTI-0003 | ARTI-0005 | 896.63 |

**t_measurement_of_artifact_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0002 | Dimension Kind 01 |
| ARTI-0002 | ARTI-0001 | ARTI-0008 | Encoding 02 |
| ARTI-0003 | ARTI-0001 | ARTI-0009 | intake form |
| ARTI-0004 | ARTI-0001 | ARTI-0010 | fr |
| ARTI-0005 | ARTI-0001 | ARTI-0003 | manual |
| ARTI-0006 | ARTI-0001 | ARTI-0006 | ratio |
| ARTI-0007 | ARTI-0002 | ARTI-0002 | Dimension Kind 07 |
| ARTI-0008 | ARTI-0002 | ARTI-0008 | Encoding 08 |