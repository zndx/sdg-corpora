---
chapter_id: ch_live_lineage_edge_to_target_bf1002
topic_id: 1
family: 05_provo_lineage
cited_terms: ['lineage_edge_to_target', 'hipaa_safeguard_technical', 'labrun_subclass']
model: engine-refine
---

An identifier is the immutable handle by which any governed asset is referenced across the data fabric. In the lineage graph, identifiers such as TARG-0001 through TARG-0004 anchor edges that connect a source lineage—ml_model_checkpoint, knowledge_base_dump, raw_telemetry_feed—to a downstream consumer like executive_dashboard, feature_store_table, or risk_prediction_model. Within the HIPAA safeguard registry, identifiers TECH-0001 through TECH-0004 serve the same anchoring function, each mapping a named rule (Transaction Rule, Data Backup, Enforcement Rule, Breach Notification Rule) to a safeguard reference such as LABR-0005 or LABR-0002. The labrun_subclass table extends the pattern: identifiers LABR-0001 through LABR-0004 label concrete experiments (CellCulture-Exp12, FlowCyt-Panel9, ELISA-Plate88, PCR-Run-Alpha7) and tie them to input samples referenced by TECH-0004, TECH-0001, or TECH-0005. In every case the identifier is the stable key that permits cross-table joins without ambiguity.

**t_hipaa_safeguard_technical**

| id | hipaa | hipaa_safeguard |
| --- | --- | --- |
| TECH-0001 | Transaction Rule | LABR-0005 |
| TECH-0002 | Data Backup | LABR-0002 |
| TECH-0003 | Enforcement Rule | LABR-0006 |
| TECH-0004 | Breach Notification Rule | LABR-0005 |
| TECH-0005 | Breach Notification Rule | LABR-0008 |
| TECH-0006 | Access Control | LABR-0004 |

**t_labrun_subclass**

| id | labrun | input_sample |
| --- | --- | --- |
| LABR-0001 | CellCulture-Exp12 | TECH-0004 |
| LABR-0002 | FlowCyt-Panel9 | TECH-0001 |
| LABR-0003 | ELISA-Plate88 | TECH-0005 |
| LABR-0004 | PCR-Run-Alpha7 | TECH-0005 |
| LABR-0005 | MassSpec-MS19 | TECH-0006 |
| LABR-0006 | NMR-Stand-04A | TECH-0004 |
| LABR-0007 | FlowCyt-Panel9 | TECH-0002 |
| LABR-0008 | RNASeq-Lib15 | TECH-0006 |

An attribute is a named property of an entity, and its type constrains the shape of permissible values. The hipaa_safeguard_technical_attr table declares attributes such as effective_date (xsd:date), enforcement (xsd:string), mandatory (xsd:boolean), and priority (xsd:integer), each bound to a specific safeguard entity. The labrun_subclass_attr table similarly defines duration_seconds (xsd:decimal), end_time (xsd:dateTime), exit_code (xsd:integer), and host_name (xsd:string) for each lab run. The attr_type column is not decorative; it dictates which value table receives the data. A boolean attribute routes to t_hipaa_safeguard_technical_val_boolean, a date attribute to t_hipaa_safeguard_technical_val_date, an integer to t_hipaa_safeguard_technical_val_int, and a string to t_hipaa_safeguard_technical_val_varchar. The same discipline applies to lab runs, where decimal, datetime, integer, and varchar value tables are populated according to the declared attr_type.

**t_hipaa_safeguard_technical_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| TECH-0001 | effective_date | xsd:date |
| TECH-0002 | enforcement | xsd:string |
| TECH-0003 | mandatory | xsd:boolean |
| TECH-0004 | priority | xsd:integer |
| TECH-0005 | review_cycle_days | xsd:integer |
| TECH-0006 | scope | xsd:string |
| TECH-0007 | encoding | xsd:string |
| TECH-0008 | label_text | xsd:string |

**t_hipaa_safeguard_technical_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TECH-0001 | TECH-0001 | TECH-0003 | true |
| TECH-0002 | TECH-0002 | TECH-0003 | true |
| TECH-0003 | TECH-0003 | TECH-0003 | false |
| TECH-0004 | TECH-0004 | TECH-0003 | false |
| TECH-0005 | TECH-0005 | TECH-0003 | true |
| TECH-0006 | TECH-0006 | TECH-0003 | true |

**t_hipaa_safeguard_technical_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TECH-0001 | TECH-0001 | TECH-0001 | 2025-01-15 |
| TECH-0002 | TECH-0002 | TECH-0001 | 2025-02-09 |
| TECH-0003 | TECH-0003 | TECH-0001 | 2023-08-04 |
| TECH-0004 | TECH-0004 | TECH-0001 | 2024-09-26 |
| TECH-0005 | TECH-0005 | TECH-0001 | 2025-05-30 |
| TECH-0006 | TECH-0006 | TECH-0001 | 2024-11-22 |

**t_hipaa_safeguard_technical_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TECH-0001 | TECH-0001 | TECH-0004 | 2 |
| TECH-0002 | TECH-0001 | TECH-0005 | 620 |
| TECH-0003 | TECH-0002 | TECH-0004 | 3 |
| TECH-0004 | TECH-0002 | TECH-0005 | 784 |
| TECH-0005 | TECH-0003 | TECH-0004 | 3 |
| TECH-0006 | TECH-0003 | TECH-0005 | 568 |
| TECH-0007 | TECH-0004 | TECH-0004 | 1 |
| TECH-0008 | TECH-0004 | TECH-0005 | 831 |

**t_hipaa_safeguard_technical_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TECH-0001 | TECH-0001 | TECH-0007 | Encoding 01 |
| TECH-0002 | TECH-0001 | TECH-0002 | Enforcement 02 |
| TECH-0003 | TECH-0001 | TECH-0008 | change rationale |
| TECH-0004 | TECH-0001 | TECH-0009 | fr |
| TECH-0005 | TECH-0001 | TECH-0006 | Scope 05 |
| TECH-0006 | TECH-0002 | TECH-0007 | Encoding 06 |
| TECH-0007 | TECH-0002 | TECH-0002 | Enforcement 07 |
| TECH-0008 | TECH-0002 | TECH-0008 | intake form |

**t_labrun_subclass_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| LABR-0001 | duration_seconds | xsd:decimal |
| LABR-0002 | end_time | xsd:dateTime |
| LABR-0003 | exit_code | xsd:integer |
| LABR-0004 | host_name | xsd:string |
| LABR-0005 | log_level | xsd:string |
| LABR-0006 | phase | xsd:string |
| LABR-0007 | retry_count | xsd:integer |
| LABR-0008 | scheduled_at | xsd:dateTime |

**t_labrun_subclass_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LABR-0001 | LABR-0001 | LABR-0002 | 2023-06-03T03:48:13 |
| LABR-0002 | LABR-0001 | LABR-0008 | 2024-12-03T15:21:58 |
| LABR-0003 | LABR-0001 | LABR-0009 | 2023-08-16T05:52:21 |
| LABR-0004 | LABR-0002 | LABR-0002 | 2024-08-31T23:33:13 |
| LABR-0005 | LABR-0002 | LABR-0008 | 2025-02-13T01:21:55 |
| LABR-0006 | LABR-0002 | LABR-0009 | 2023-04-09T20:59:10 |
| LABR-0007 | LABR-0003 | LABR-0002 | 2024-04-14T13:26:56 |
| LABR-0008 | LABR-0003 | LABR-0008 | 2024-07-04T01:41:44 |

**t_labrun_subclass_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LABR-0001 | LABR-0001 | LABR-0001 | 7187.70 |
| LABR-0002 | LABR-0002 | LABR-0001 | 5360.85 |
| LABR-0003 | LABR-0003 | LABR-0001 | 3249.87 |
| LABR-0004 | LABR-0004 | LABR-0001 | 649.77 |
| LABR-0005 | LABR-0005 | LABR-0001 | 3590.34 |
| LABR-0006 | LABR-0006 | LABR-0001 | 456.45 |
| LABR-0007 | LABR-0007 | LABR-0001 | 5720.89 |
| LABR-0008 | LABR-0008 | LABR-0001 | 7012.99 |

**t_labrun_subclass_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LABR-0001 | LABR-0001 | LABR-0003 | 241 |
| LABR-0002 | LABR-0001 | LABR-0007 | 320 |
| LABR-0003 | LABR-0002 | LABR-0003 | 688 |
| LABR-0004 | LABR-0002 | LABR-0007 | 479 |
| LABR-0005 | LABR-0003 | LABR-0003 | 481 |
| LABR-0006 | LABR-0003 | LABR-0007 | 200 |
| LABR-0007 | LABR-0004 | LABR-0003 | 208 |
| LABR-0008 | LABR-0004 | LABR-0007 | 121 |

**t_labrun_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LABR-0001 | LABR-0001 | LABR-0004 | node-b14 |
| LABR-0002 | LABR-0001 | LABR-0005 | Log Level 02 |
| LABR-0003 | LABR-0001 | LABR-0006 | closeout |
| LABR-0004 | LABR-0001 | LABR-0010 | pending |
| LABR-0005 | LABR-0001 | LABR-0011 | Triggered By 05 |
| LABR-0006 | LABR-0002 | LABR-0004 | ingest-21 |
| LABR-0007 | LABR-0002 | LABR-0005 | Log Level 07 |
| LABR-0008 | LABR-0002 | LABR-0006 | closeout |

The entity is the thing being described—the safeguard, the lab run, the lineage edge—and it is the foreign key that binds attribute values back to their owner. In the HIPAA value tables, the entity_id column carries identifiers like TECH-0001 or TECH-0002, pointing to the safeguard row whose attribute is being instantiated. The attr_id column then points to the attribute definition (TECH-0003 for mandatory, TECH-0001 for effective_date, TECH-0004 and TECH-0005 for priority-level attributes), and the value column holds the actual datum: true or false for mandatory flags; dates such as 2025-01-15, 2025-02-09, 2023-08-04, 2024-09-26 for effective_date; integers like 2, 620, 3, 784 for priority; and strings such as Encoding 01, Enforcement 02, change rationale, fr for free-form attributes. The labrun value tables follow the identical pattern, with entity_id referencing LABR-0001 or LABR-0002, attr_id pointing to the corresponding attribute definition, and values ranging from 7187.70 and 5360.85 (duration_seconds as decimal) through 2023-06-03T03:48:13 and 2024-12-03T15:21:58 (end_time as datetime) to 241, 320, 688, 479 (exit_code as integer) and node-b14, Log Level 02, closeout, pending (host_name and status as varchar).

The unit column on the lineage edge table provides the measurement context for the value field, which is otherwise a bare numeric. A value of 555.98 paired with unit nm describes a wavelength-scale measurement on the edge from ml_model_checkpoint to executive_dashboard; 967.34 with ratio indicates a dimensionless proportion on the knowledge_base_dump to feature_store_table edge; 771.21 with count signals a discrete tally on the second ml_model_checkpoint to executive_dashboard edge; and 171.35 with kg attaches a mass measurement to the raw_telemetry_feed to risk_prediction_model edge. The unit is essential because the value alone is semantically incomplete—555.98 nm is not the same quantity as 555.98 kg, and the schema encodes that distinction at the edge level rather than in the value column.

This separation of identifier, attribute definition, attribute type, entity binding, and unit creates a model that is both rigidly typed and structurally flexible. New attributes can be declared in the attr table without altering any value table schema; new value types can be added as new tables without touching existing ones; and the entity_id foreign key ensures that every value, regardless of type, traces back to exactly one owner. The result is a compliance-grade data model where provenance (lineage edges with units), regulatory mapping (HIPAA rules to safeguards), and experimental metadata (lab run attributes) coexist under a single, queryable vocabulary.

**t_lineage_edge_to_target**

| id | lineage | to_target | unit | value |
| --- | --- | --- | --- | --- |
| TARG-0001 | ml_model_checkpoint | executive_dashboard | nm | 555.98 |
| TARG-0002 | knowledge_base_dump | feature_store_table | ratio | 967.34 |
| TARG-0003 | ml_model_checkpoint | executive_dashboard | count | 771.21 |
| TARG-0004 | raw_telemetry_feed | risk_prediction_model | kg | 171.35 |
| TARG-0005 | lab_sample_manifest | analytics_warehouse | count | 934.12 |
| TARG-0006 | quality_validation_suite | backup_snapshot | count | 626.71 |