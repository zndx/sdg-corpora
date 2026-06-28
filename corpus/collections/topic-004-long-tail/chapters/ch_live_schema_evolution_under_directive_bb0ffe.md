---
chapter_id: ch_live_schema_evolution_under_directive_bb0ffe
topic_id: 4
family: 07_long_tail
cited_terms: ['schema_evolution_under_directive', 'labrun_subclass', 'labrun_has_operator']
model: engine-refine
---

Identifiers serve as the universal anchor across the data model, providing stable, human-readable keys that distinguish every entity regardless of its domain. Schema records carry identifiers such as DIRE-0001 through DIRE-0004, operator records use OPER-0001 through OPER-0004, and lab-run subclass entries are keyed by LABR-0001 through LABR-0004. These identifiers appear not only as primary keys in their respective dimension and fact tables but also as foreign keys that stitch related records together—for instance, the operator_key column in the operational fact table references an operator dimension record, while the schema_key column in the schema fact table points to a schema definition. The identifier convention is consistent and prefix-based, making it straightforward to trace a record from its originating dimension into any fact table that consumes it.

Schemas and operators are each described through a pair of tables: a fact table that captures quantitative measurements and a dimension table that supplies human-readable labels and categorical groupings. The schema fact table records a confidence score alongside an uncertainty value and a numeric measure for each schema identifier; confidence values range from 0.128 for DIRE-0002 to 0.559 for DIRE-0004, reflecting varying degrees of assurance in the underlying data. The corresponding schema dimension table assigns each identifier a label such as "Schema Label 01" and a category like "Schema Category 01," enabling downstream queries to aggregate or filter by category rather than by opaque identifier. The same pattern applies to operators: the operator fact table stores duration_seconds (4856.18, 4308.22, 4764.89, 5155.73), exit codes (122, 691, 566, 3), and retry counts (265, 244, 106, 12), while the operator dimension table provides the operator_label and operator_category fields that give these codes operational context.

**fact_schema**

| id | schema_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| DIRE-0001 | DIRE-0007 | 0.346 | 496.72 | 934.63 |
| DIRE-0002 | DIRE-0004 | 0.128 | 36.42 | 722.91 |
| DIRE-0003 | DIRE-0007 | 0.279 | 132.28 | 890.32 |
| DIRE-0004 | DIRE-0007 | 0.559 | 435.16 | 628.85 |
| DIRE-0005 | DIRE-0002 | 0.314 | 996.56 | 660.34 |
| DIRE-0006 | DIRE-0003 | 0.661 | 71.96 | 765.11 |
| DIRE-0007 | DIRE-0005 | 0.981 | 108.29 | 904.01 |

**dim_schema**

| id | schema_label | schema_category |
| --- | --- | --- |
| DIRE-0001 | Schema Label 01 | Schema Category 01 |
| DIRE-0002 | Schema Label 02 | Schema Category 02 |
| DIRE-0003 | Schema Label 03 | Schema Category 03 |
| DIRE-0004 | Schema Label 04 | Schema Category 04 |
| DIRE-0005 | Schema Label 05 | Schema Category 05 |
| DIRE-0006 | Schema Label 06 | Schema Category 06 |
| DIRE-0007 | Schema Label 07 | Schema Category 07 |

**fact_labrun**

| id | operator_key | duration_seconds | exit_code | retry_count |
| --- | --- | --- | --- | --- |
| OPER-0001 | OPER-0007 | 4856.18 | 122 | 265 |
| OPER-0002 | OPER-0005 | 4308.22 | 691 | 244 |
| OPER-0003 | OPER-0002 | 4764.89 | 566 | 106 |
| OPER-0004 | OPER-0007 | 5155.73 | 3 | 12 |
| OPER-0005 | OPER-0001 | 385.91 | 81 | 197 |

**dim_operator**

| id | operator_label | operator_category |
| --- | --- | --- |
| OPER-0001 | Operator Label 01 | Operator Category 01 |
| OPER-0002 | Operator Label 02 | Operator Category 02 |
| OPER-0003 | Operator Label 03 | Operator Category 03 |
| OPER-0004 | Operator Label 04 | Operator Category 04 |
| OPER-0005 | Operator Label 05 | Operator Category 05 |
| OPER-0006 | Operator Label 06 | Operator Category 06 |
| OPER-0007 | Operator Label 07 | Operator Category 07 |

The attribute system decouples the definition of a property from the storage of its value, using a type-dispatch pattern that routes data into the appropriate value table based on the attribute's declared type. The attribute definition table assigns each attribute a name—duration_seconds, end_time, exit_code, host_name—and an attr_type drawn from the XSD namespace: xsd:decimal, xsd:dateTime, xsd:integer, and xsd:string respectively. Value tables then store the actual data, partitioned by type. Decimal attributes such as duration_seconds hold values like 7187.70 and 5360.85; integer attributes capture counts such as 241 and 688; datetime attributes record timestamps like 2023-06-03T03:48:13 and 2024-12-03T15:21:58; and varchar attributes store free-text entries including node-b14, Log Level 02, closeout, and pending. This separation ensures type safety at query time while keeping each value table narrow and indexable.

Entity identifiers bind attribute values back to their source records, creating a many-to-many relationship between attributes and the lab-run subclasses they describe. The entity_id column in each value table references a specific lab-run subclass—LABR-0001, for example, appears as the entity for multiple attribute values spanning decimal, integer, datetime, and varchar types—while the attr_id column points to the attribute definition that specifies the value's type and semantics. This design allows a single lab-run subclass to carry an arbitrary set of attributes without requiring schema changes to the underlying tables. The lab-run subclass table itself provides the operational context, linking each identifier to a descriptive labrun name such as CellCulture-Exp12 or PCR-Run-Alpha7 and an input_sample like PlasmaCitrate-Lot4 or RNAExtract-Brain, thereby grounding the abstract attribute-value pairs in concrete experimental records.

**t_labrun_subclass**

| id | labrun | input_sample |
| --- | --- | --- |
| LABR-0001 | CellCulture-Exp12 | PlasmaCitrate-Lot4 |
| LABR-0002 | FlowCyt-Panel9 | HumanSerum-A7 |
| LABR-0003 | ELISA-Plate88 | RNAExtract-Brain |
| LABR-0004 | PCR-Run-Alpha7 | PlantRoot-Extract |
| LABR-0005 | MassSpec-MS19 | DNAFragment-450bp |
| LABR-0006 | NMR-Stand-04A | RNAExtract-Brain |
| LABR-0007 | FlowCyt-Panel9 | DNAFragment-450bp |
| LABR-0008 | RNASeq-Lib15 | HumanSerum-A7 |

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