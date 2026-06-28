---
chapter_id: ch_live_kernelhook_with_hook_kind_29778d
topic_id: 67
family: 04_ebpf_kernel
cited_terms: ['kernelhook_with_hook_kind', 'knowledge_base_integration', 'labrun_basic']
model: engine-refine
---

Kernel hooks are captured as measurable events within a fact table keyed by a unique identifier such as `KIND-0001` through `KIND-0004`, each recording the hook's size in bytes — values ranging from 27,282,284 to 560,962,979 — and its software version, which spans from 1 to 10. The semantic classification of each hook is resolved through a dimension table that assigns a human-readable label, such as `Hook Kind Label 01`, and a categorical grouping like `Hook Kind Category 01`. The foreign-key linkage between the fact and dimension tables is established via the `hook_kind_key` column, which references the dimension's primary identifier; for instance, the hook with identifier `KIND-0002` carries a `hook_kind_key` of `KIND-0002`, pointing to its own dimension record, while `KIND-0004` appears as a repeated key across multiple fact rows, indicating that a single hook kind may be instantiated in several distinct measurements.

**fact_kernelhook**

| id | hook_kind_key | size_bytes | version |
| --- | --- | --- | --- |
| KIND-0001 | KIND-0002 | 36342735 | 3 |
| KIND-0002 | KIND-0004 | 560962979 | 1 |
| KIND-0003 | KIND-0007 | 456299832 | 10 |
| KIND-0004 | KIND-0004 | 272822846 | 1 |

**dim_hook_kind**

| id | hook_kind_label | hook_kind_category |
| --- | --- | --- |
| KIND-0001 | Hook Kind Label 01 | Hook Kind Category 01 |
| KIND-0002 | Hook Kind Label 02 | Hook Kind Category 02 |
| KIND-0003 | Hook Kind Label 03 | Hook Kind Category 03 |
| KIND-0004 | Hook Kind Label 04 | Hook Kind Category 04 |
| KIND-0005 | Hook Kind Label 05 | Hook Kind Category 05 |
| KIND-0006 | Hook Kind Label 06 | Hook Kind Category 06 |
| KIND-0007 | Hook Kind Label 07 | Hook Kind Category 07 |

**t_labrun_basic**

| id | labrun |
| --- | --- |
| LABR-0001 | Microplate_Scan_9A |
| LABR-0002 | MassSpec_Triplicate |
| LABR-0003 | ELISA_Screen_4B |
| LABR-0004 | PCR_Amplification |
| LABR-0005 | FlowCytometry_Sweep |
| LABR-0006 | WesternBlot_22 |
| LABR-0007 | WesternBlot_22 |
| LABR-0008 | FlowCytometry_Sweep |

Knowledge base integration records serve as the bridge between disparate knowledge sources, each identified by a code such as `INTE-0001` through `INTE-0004`. The integration itself is named — `SoilCarbonInventory`, `WildfireRiskMatrix`, `ClimateAdaptationFramework`, `ArcticPermafrostAtlas` — and is annotated with two parallel knowledge incorporation flags: one for indigenous knowledge bases, drawing on sources like `MāoriResourceMapping` and `YupikCoastalEcology`, and another for scientific knowledge bases, referencing repositories such as `HaidaGwaiiHeritage`, `CherokeeSeedVault`, `GenBankSequenceArchive`, and `NOAAOceanTemperature`. The encoding field distinguishes between `ascii` and `utf8` character sets across these records, while the label text column provides contextual metadata — `calibration record`, `intake form`, `audit excerpt` — that describes the nature of the integration artifact.

**t_knowledge_base_integration**

| id | knowledge_base_integration | incorporates_indigenous_knowledge | incorporates_scientific_knowledge | encoding | label_text |
| --- | --- | --- | --- | --- | --- |
| INTE-0001 | SoilCarbonInventory | MāoriResourceMapping | HaidaGwaiiHeritage | ascii | calibration record |
| INTE-0002 | WildfireRiskMatrix | YupikCoastalEcology | CherokeeSeedVault | ascii | intake form |
| INTE-0003 | ClimateAdaptationFramework | MODISVegetationIndex | GenBankSequenceArchive | ascii | calibration record |
| INTE-0004 | ArcticPermafrostAtlas | MāoriResourceMapping | NOAAOceanTemperature | utf8 | audit excerpt |
| INTE-0005 | WildfireRiskMatrix | NASAClimateReanalysis | YupikCoastalEcology | utf8 | change rationale |
| INTE-0006 | ClimateAdaptationFramework | HaidaGwaiiHeritage | NASAClimateReanalysis | utf8 | calibration record |
| INTE-0007 | SoilCarbonInventory | USFSDroughtMonitor | CherokeeSeedVault | latin1 | pre-release note |

Laboratory run entities are enumerated by identifiers like `LABR-0001` through `LABR-0004`, each associated with a descriptive run name such as `Microplate_Scan_9A`, `MassSpec_Triplicate`, `ELISA_Screen_4B`, and `PCR_Amplification`. Attribute definitions for these runs are stored separately, with each attribute identified by a name — `duration_seconds`, `end_time`, `exit_code`, `host_name` — and typed according to an XML Schema Datatype convention: `xsd:decimal`, `xsd:dateTime`, `xsd:integer`, and `xsd:string`. This separation of attribute schema from attribute values enables a flexible entity-attribute-value model where a single lab run entity can carry heterogeneous typed values without requiring a fixed column structure.

**t_labrun_basic_attr**

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

**t_labrun_basic_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LABR-0001 | LABR-0001 | LABR-0002 | 2025-01-01T00:58:28 |
| LABR-0002 | LABR-0001 | LABR-0008 | 2023-02-28T02:17:46 |
| LABR-0003 | LABR-0001 | LABR-0009 | 2024-11-14T14:13:50 |
| LABR-0004 | LABR-0002 | LABR-0002 | 2025-05-09T16:03:58 |
| LABR-0005 | LABR-0002 | LABR-0008 | 2023-08-07T03:38:58 |
| LABR-0006 | LABR-0002 | LABR-0009 | 2023-11-05T10:47:29 |
| LABR-0007 | LABR-0003 | LABR-0002 | 2024-07-22T03:34:20 |
| LABR-0008 | LABR-0003 | LABR-0008 | 2023-11-18T18:40:00 |

**t_labrun_basic_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LABR-0001 | LABR-0001 | LABR-0001 | 1438.98 |
| LABR-0002 | LABR-0002 | LABR-0001 | 6523.97 |
| LABR-0003 | LABR-0003 | LABR-0001 | 7176.32 |
| LABR-0004 | LABR-0004 | LABR-0001 | 6375.34 |
| LABR-0005 | LABR-0005 | LABR-0001 | 876.07 |
| LABR-0006 | LABR-0006 | LABR-0001 | 5075.37 |
| LABR-0007 | LABR-0007 | LABR-0001 | 485.96 |
| LABR-0008 | LABR-0008 | LABR-0001 | 1443.01 |

**t_labrun_basic_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LABR-0001 | LABR-0001 | LABR-0003 | 918 |
| LABR-0002 | LABR-0001 | LABR-0007 | 57 |
| LABR-0003 | LABR-0002 | LABR-0003 | 674 |
| LABR-0004 | LABR-0002 | LABR-0007 | 220 |
| LABR-0005 | LABR-0003 | LABR-0003 | 637 |
| LABR-0006 | LABR-0003 | LABR-0007 | 406 |
| LABR-0007 | LABR-0004 | LABR-0003 | 597 |
| LABR-0008 | LABR-0004 | LABR-0007 | 367 |

**t_labrun_basic_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LABR-0001 | LABR-0001 | LABR-0004 | edge-03 |
| LABR-0002 | LABR-0001 | LABR-0005 | Log Level 02 |
| LABR-0003 | LABR-0001 | LABR-0006 | execution |
| LABR-0004 | LABR-0001 | LABR-0010 | complete |
| LABR-0005 | LABR-0001 | LABR-0011 | Triggered By 05 |
| LABR-0006 | LABR-0002 | LABR-0004 | ingest-21 |
| LABR-0007 | LABR-0002 | LABR-0005 | Log Level 07 |
| LABR-0008 | LABR-0002 | LABR-0006 | initiation |

The value tables materialize the entity-attribute-value pattern across four datatype-specific tables, each linking back to the lab run entity through an `entity_id` foreign key and to the attribute definition through an `attr_id` foreign key. Decimal values — for example, `1438.98`, `6523.97`, `7176.32`, `6375.34` — are stored in the decimal value table, all referencing attribute `LABR-0001` (which corresponds to `duration_seconds`). Datetime values such as `2025-01-01T00:58:28` and `2023-02-28T02:17:46` populate the datetime table, associated with attributes like `LABR-0002` (`end_time`). Integer values — `918`, `57`, `674`, `220` — reside in the integer table under attributes `LABR-0003` (`exit_code`) and `LABR-0007`, while varchar values including `edge-03`, `Log Level 02`, `execution`, and `complete` fill the string table under attributes `LABR-0004` (`host_name`), `LABR-0005`, `LABR-0006`, and `LABR-0010`. This partitioning by datatype ensures type safety at query time while preserving the extensibility of the attribute model.