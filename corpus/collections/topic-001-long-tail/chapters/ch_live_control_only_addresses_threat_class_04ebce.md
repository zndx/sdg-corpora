---
chapter_id: ch_live_control_only_addresses_threat_class_04ebce
topic_id: 1
family: 03_directive_governance
cited_terms: ['control_only_addresses_threat_class', 'dempster_combination_subclass', 'labrun_min_one_sample']
model: engine-refine
---

The attribute model partitions descriptive properties into two distinct layers: the schema layer, which declares attribute names and their XML Schema types, and the value layer, which materializes those declarations against concrete entities. An attribute such as `effective_date` carries the type `xsd:date`, while `enforcement` is typed as `xsd:string`, `mandatory` as `xsd:boolean`, and `priority` as `xsd:integer`. The laboratory domain mirrors this structure with attributes like `duration_seconds` (`xsd:decimal`), `end_time` (`xsd:dateTime`), `exit_code` (`xsd:integer`), and `host_name` (`xsd:string`). Each typed value is stored in a dedicated table—boolean, date, integer, decimal, datetime, or varchar—so that the value of `mandatory` for entity `THRE-0001` is `true`, whereas for entity `THRE-0002` it is `false`; similarly, the `effective_date` for `THRE-0001` is `2024-12-09` and for `THRE-0003` is `2025-01-04`. This normalization by type ensures that type coercion never occurs at query time and that each value table carries only the columns it requires: `id`, `entity_id`, `attr_id`, and `value`.

**t_labrun_min_one_sample_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SAMP-0001 | SAMP-0001 | SAMP-0002 | 2024-08-01T16:02:07 |
| SAMP-0002 | SAMP-0001 | SAMP-0008 | 2024-02-12T19:03:44 |
| SAMP-0003 | SAMP-0001 | SAMP-0009 | 2023-01-19T08:28:14 |
| SAMP-0004 | SAMP-0002 | SAMP-0002 | 2024-05-12T21:48:01 |
| SAMP-0005 | SAMP-0002 | SAMP-0008 | 2023-12-29T06:52:07 |
| SAMP-0006 | SAMP-0002 | SAMP-0009 | 2023-05-30T11:26:58 |
| SAMP-0007 | SAMP-0003 | SAMP-0002 | 2023-02-24T06:29:16 |
| SAMP-0008 | SAMP-0003 | SAMP-0008 | 2025-01-26T00:06:38 |

The entity-attr relationship is the connective tissue of the model. Every value row references an `entity_id` and an `attr_id`, both of which are foreign keys into the entity and attribute namespaces respectively. Entity `THRE-0001`—which corresponds to the control "Multi-Factor Authentication" addressing the risk "Data Exfiltration"—carries a date value of `2024-12-09` on attribute `THRE-0001` (`effective_date`), a boolean value of `true` on attribute `THRE-0003` (`mandatory`), and a varchar value of `Encoding 01` on attribute `THRE-0007`. The same entity also holds integer values of `5` and `99` on attributes `THRE-0004` and `THRE-0005`. In the laboratory domain, entity `SAMP-0001`—associated with lab run `SEQ-EXP-99` and input sample `RNA-POOL-22`—has a decimal value of `2021.10` on attribute `SAMP-0001` (`duration_seconds`), an integer value of `230` on attribute `SAMP-0003` (`exit_code`), and a varchar value of `edge-03` on attribute `SAMP-0004` (`host_name`). The foreign-key constraints on `entity_id` and `attr_id` guarantee referential integrity across all value tables, regardless of type.

**t_labrun_min_one_sample_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| SAMP-0001 | duration_seconds | xsd:decimal |
| SAMP-0002 | end_time | xsd:dateTime |
| SAMP-0003 | exit_code | xsd:integer |
| SAMP-0004 | host_name | xsd:string |
| SAMP-0005 | log_level | xsd:string |
| SAMP-0006 | phase | xsd:string |
| SAMP-0007 | retry_count | xsd:integer |
| SAMP-0008 | scheduled_at | xsd:dateTime |

**t_labrun_min_one_sample_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SAMP-0001 | SAMP-0001 | SAMP-0001 | 2021.10 |
| SAMP-0002 | SAMP-0002 | SAMP-0001 | 4946.17 |
| SAMP-0003 | SAMP-0003 | SAMP-0001 | 5150.87 |
| SAMP-0004 | SAMP-0004 | SAMP-0001 | 3275.26 |
| SAMP-0005 | SAMP-0005 | SAMP-0001 | 3679.38 |
| SAMP-0006 | SAMP-0006 | SAMP-0001 | 2520.77 |

**t_labrun_min_one_sample_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SAMP-0001 | SAMP-0001 | SAMP-0003 | 230 |
| SAMP-0002 | SAMP-0001 | SAMP-0007 | 435 |
| SAMP-0003 | SAMP-0002 | SAMP-0003 | 670 |
| SAMP-0004 | SAMP-0002 | SAMP-0007 | 129 |
| SAMP-0005 | SAMP-0003 | SAMP-0003 | 152 |
| SAMP-0006 | SAMP-0003 | SAMP-0007 | 382 |
| SAMP-0007 | SAMP-0004 | SAMP-0003 | 442 |
| SAMP-0008 | SAMP-0004 | SAMP-0007 | 477 |

**t_labrun_min_one_sample_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SAMP-0001 | SAMP-0001 | SAMP-0004 | edge-03 |
| SAMP-0002 | SAMP-0001 | SAMP-0005 | Log Level 02 |
| SAMP-0003 | SAMP-0001 | SAMP-0006 | closeout |
| SAMP-0004 | SAMP-0001 | SAMP-0010 | complete |
| SAMP-0005 | SAMP-0001 | SAMP-0011 | Triggered By 05 |
| SAMP-0006 | SAMP-0002 | SAMP-0004 | gw-12 |
| SAMP-0007 | SAMP-0002 | SAMP-0005 | Log Level 07 |
| SAMP-0008 | SAMP-0002 | SAMP-0006 | execution |

The identifier namespace provides the stable key that threads through every layer. Threat-class identifiers such as `THRE-0001` through `THRE-0004` anchor both the control records and their associated attribute definitions and values. Sample identifiers such as `SAMP-0001` through `SAMP-0004` serve the same purpose in the laboratory domain. Dempster-combination identifiers such as `COMB-0001` through `COMB-0004` anchor the evidence-aggregation facts. The identifier is never human-readable by design; it is a surrogate key that decouples the logical model from any display-level label, which is stored separately in the dimension tables.

**t_control_only_addresses_threat_class**

| id | control | addresses_risk |
| --- | --- | --- |
| THRE-0001 | Multi-Factor Authentication | Data Exfiltration |
| THRE-0002 | Incident Response Plan | System Downtime |
| THRE-0003 | Incident Response Plan | Configuration Drift |
| THRE-0004 | Access Review Policy | System Downtime |
| THRE-0005 | Backup Retention Schedule | Configuration Drift |
| THRE-0006 | Backup Retention Schedule | Configuration Drift |
| THRE-0007 | Access Review Policy | Credential Theft |
| THRE-0008 | Incident Response Plan | Supply Chain Compromise |

**t_control_only_addresses_threat_class_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| THRE-0001 | effective_date | xsd:date |
| THRE-0002 | enforcement | xsd:string |
| THRE-0003 | mandatory | xsd:boolean |
| THRE-0004 | priority | xsd:integer |
| THRE-0005 | review_cycle_days | xsd:integer |
| THRE-0006 | scope | xsd:string |
| THRE-0007 | encoding | xsd:string |
| THRE-0008 | label_text | xsd:string |

**t_control_only_addresses_threat_class_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| THRE-0001 | THRE-0001 | THRE-0003 | true |
| THRE-0002 | THRE-0002 | THRE-0003 | false |
| THRE-0003 | THRE-0003 | THRE-0003 | false |
| THRE-0004 | THRE-0004 | THRE-0003 | true |
| THRE-0005 | THRE-0005 | THRE-0003 | true |
| THRE-0006 | THRE-0006 | THRE-0003 | false |
| THRE-0007 | THRE-0007 | THRE-0003 | true |
| THRE-0008 | THRE-0008 | THRE-0003 | true |

**t_control_only_addresses_threat_class_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| THRE-0001 | THRE-0001 | THRE-0001 | 2024-12-09 |
| THRE-0002 | THRE-0002 | THRE-0001 | 2024-12-21 |
| THRE-0003 | THRE-0003 | THRE-0001 | 2025-01-04 |
| THRE-0004 | THRE-0004 | THRE-0001 | 2023-01-13 |
| THRE-0005 | THRE-0005 | THRE-0001 | 2023-09-02 |
| THRE-0006 | THRE-0006 | THRE-0001 | 2023-12-08 |
| THRE-0007 | THRE-0007 | THRE-0001 | 2025-01-04 |
| THRE-0008 | THRE-0008 | THRE-0001 | 2024-03-28 |

**t_control_only_addresses_threat_class_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| THRE-0001 | THRE-0001 | THRE-0004 | 5 |
| THRE-0002 | THRE-0001 | THRE-0005 | 99 |
| THRE-0003 | THRE-0002 | THRE-0004 | 5 |
| THRE-0004 | THRE-0002 | THRE-0005 | 926 |
| THRE-0005 | THRE-0003 | THRE-0004 | 1 |
| THRE-0006 | THRE-0003 | THRE-0005 | 740 |
| THRE-0007 | THRE-0004 | THRE-0004 | 4 |
| THRE-0008 | THRE-0004 | THRE-0005 | 301 |

**t_control_only_addresses_threat_class_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| THRE-0001 | THRE-0001 | THRE-0007 | Encoding 01 |
| THRE-0002 | THRE-0001 | THRE-0002 | Enforcement 02 |
| THRE-0003 | THRE-0001 | THRE-0008 | change rationale |
| THRE-0004 | THRE-0001 | THRE-0009 | fr |
| THRE-0005 | THRE-0001 | THRE-0006 | Scope 05 |
| THRE-0006 | THRE-0002 | THRE-0007 | Encoding 06 |
| THRE-0007 | THRE-0002 | THRE-0002 | Enforcement 07 |
| THRE-0008 | THRE-0002 | THRE-0008 | nightly summary |

**t_labrun_min_one_sample**

| id | labrun | input_sample |
| --- | --- | --- |
| SAMP-0001 | SEQ-EXP-99 | RNA-POOL-22 |
| SAMP-0002 | PROTOCOL-V3 | CELL-LINE-Hela |
| SAMP-0003 | CEL-SEQR-112 | BLOOD-DRAW-A1 |
| SAMP-0004 | CEL-SEQR-112 | REACTANT-SOL-4 |
| SAMP-0005 | PCR-CYCLE-44 | DNA-EXTRACT-77 |
| SAMP-0006 | METAB-ASSAY-Q2 | SOIL-SUB-09 |

The Dempster-Shafer evidence-aggregation layer operates independently of the attribute-value model but shares the same identifier discipline. The fact table `fact_dempster` records each combination result with columns for `id`, `combines_via_dempster_key`, `confidence`, `uncertainty`, and `value`. A single row—`COMB-0001`—carries a confidence of `0.153`, an uncertainty of `9.49`, and a value of `520.46`, while `COMB-0004` carries a confidence of `0.728`, an uncertainty of `479.57`, and a value of `846.10`. The `combines_via_dempster_key` column is a self-referencing foreign key that links one combination result to another, enabling recursive aggregation chains; `COMB-0001` references `COMB-0004`, and `COMB-0004` references itself. The dimension table `dim_combines_via_dempster` supplies human-readable labels—`Combines Via Dempster Label 01` through `04`—and categories—`Combines Via Dempster Category 01` through `04`—that classify each combination without altering the numeric evidence.

**fact_dempster**

| id | combines_via_dempster_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| COMB-0001 | COMB-0004 | 0.153 | 9.49 | 520.46 |
| COMB-0002 | COMB-0006 | 0.014 | 392.06 | 137.18 |
| COMB-0003 | COMB-0003 | 0.025 | 687.80 | 197.61 |
| COMB-0004 | COMB-0004 | 0.728 | 479.57 | 846.10 |
| COMB-0005 | COMB-0005 | 0.918 | 172.36 | 296.96 |
| COMB-0006 | COMB-0001 | 0.755 | 608.06 | 341.51 |

**dim_combines_via_dempster**

| id | combines_via_dempster_label | combines_via_dempster_category |
| --- | --- | --- |
| COMB-0001 | Combines Via Dempster Label 01 | Combines Via Dempster Category 01 |
| COMB-0002 | Combines Via Dempster Label 02 | Combines Via Dempster Category 02 |
| COMB-0003 | Combines Via Dempster Label 03 | Combines Via Dempster Category 03 |
| COMB-0004 | Combines Via Dempster Label 04 | Combines Via Dempster Category 04 |
| COMB-0005 | Combines Via Dempster Label 05 | Combines Via Dempster Category 05 |
| COMB-0006 | Combines Via Dempster Label 06 | Combines Via Dempster Category 06 |
| COMB-0007 | Combines Via Dempster Label 07 | Combines Via Dempster Category 07 |

The category column in the Dempster dimension provides a coarse-grained classification that is orthogonal to the fine-grained attribute typing in the value tables. Where `attr_type` distinguishes `xsd:date` from `xsd:boolean` from `xsd:integer`, `combines_via_dempster_category` distinguishes `Combines Via Dempster Category 01` from `Combines Via Dempster Category 02` and so forth. This separation of concerns—typed attribute values on one side, classified evidence combinations on the other—allows the model to support both granular policy enforcement (e.g., verifying that `mandatory` is `true` for a given control) and aggregate risk scoring (e.g., combining confidence and uncertainty across multiple evidence sources). The misc column, which holds free-form varchar values such as `change rationale`, `fr`, `closeout`, and `complete`, serves as the catch-all for metadata that does not fit the typed schema, ensuring that the model remains extensible without requiring schema migrations.