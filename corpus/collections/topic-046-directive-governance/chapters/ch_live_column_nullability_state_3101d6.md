---
chapter_id: ch_live_column_nullability_state_3101d6
topic_id: 46
family: 07_long_tail
cited_terms: ['column_nullability_state', 'knowledge_base_integration', 'mass_function_only_assigns_subsets']
model: engine-refine
---

Knowledge base integration operates as a structured mechanism for fusing distinct epistemic traditions into unified analytical frameworks. The integration table captures each composite system by a unique identifier—such as `SoilCarbonInventory`, `WildfireRiskMatrix`, `ClimateAdaptationFramework`, and `ArcticPermafrostAtlas`—and records which indigenous knowledge sources and scientific knowledge sources it incorporates. Indigenous knowledge contributions include `MāoriResourceMapping`, `YupikCoastalEcology`, and `MODISVegetationIndex`, while scientific knowledge counterparts span `HaidaGwaiiHeritage`, `CherokeeSeedVault`, `GenBankSequenceArchive`, and `NOAAOceanTemperature`. This dual-incorporation model ensures that both place-based and empirically derived knowledge are explicitly attributed within each integration, enabling traceability from derived outputs back to their epistemic origins. The encoding field—`ascii` for most integrations and `utf8` for `ArcticPermafrostAtlas`—reflects the character set requirements of the source materials, while the label text field (`calibration record`, `intake form`, `audit excerpt`) provides a human-readable descriptor of the integration's primary documentation artifact.

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

Attributes and their types form the schema layer that governs how data within each integration is structured and validated. The attribute registry defines named properties such as `confidence`, `dimension_kind`, `method`, and `recorded_at`, each bound to an XSD type: `xsd:decimal` for numeric measures, `xsd:string` for categorical labels, and `xsd:dateTime` for temporal stamps. This type discipline ensures that values stored across the value tables conform to a consistent schema. For instance, the `recorded_at` attribute, typed as `xsd:dateTime`, receives values like `2024-12-29T19:38:29` and `2023-05-04T12:31:25`, while `confidence` (typed `xsd:decimal`) holds numeric assessments such as `0.294` and `0.734`. The `dimension_kind` and `method` attributes, both `xsd:string`, carry descriptive values like `Dimension Kind 01`, `Encoding 02`, `intake form`, and `fr`, demonstrating how the same attribute schema can accommodate both technical metadata and free-text annotations.

Entity identifiers serve as the connective tissue linking attributes to their concrete values. Each entity—identified by codes such as `STAT-0001` through `STAT-0004`—acts as a row-level anchor, and the value tables store attribute-value pairs keyed to both the entity and the attribute. The decimal value table, for example, records that entity `STAT-0001` carries a `confidence` of `0.294` (via attribute `STAT-0001`) and a secondary measure of `568.73` (via attribute `STAT-0005`), while entity `STAT-0002` has a `confidence` of `0.734`. Similarly, the varchar value table associates entity `STAT-0001` with `dimension_kind` values like `Dimension Kind 01` and `Encoding 02`, and with `method` values such as `intake form` and `fr`. This entity-attribute-value triad enables a flexible, schema-on-read model where different entities can carry different attribute subsets without requiring a rigid columnar structure.

Mass functions assign subsets of data quality and provenance metadata to specific entities, providing a secondary layer of governance over the primary attribute-value store. The mass assignment table maps identifiers like `SUBS-0001` through `SUBS-0004` to mass categories—`data_quality`, `edge_node`, `thermal_fusion`, and `telemetry_confidence`—and specifies which entities receive each mass assignment. For instance, `data_quality` (identifier `SUBS-0001`) is assigned to entity `STAT-0001`, while `edge_node` (`SUBS-0002`) and `telemetry_confidence` (`SUBS-0004`) both target `STAT-0003`, illustrating how a single entity can carry multiple mass assignments. The mass function's own attribute registry mirrors the primary schema, with the same four attributes (`confidence`, `dimension_kind`, `method`, `recorded_at`) and their corresponding XSD types, ensuring that mass assignments themselves are subject to the same type discipline as the base data.

**t_mass_function_only_assigns_subsets**

| id | mass | assigns_mass_to |
| --- | --- | --- |
| SUBS-0001 | data_quality | STAT-0001 |
| SUBS-0002 | edge_node | STAT-0003 |
| SUBS-0003 | thermal_fusion | STAT-0004 |
| SUBS-0004 | telemetry_confidence | STAT-0003 |
| SUBS-0005 | signal_integrity | STAT-0003 |
| SUBS-0006 | edge_node | STAT-0006 |

**t_mass_function_only_assigns_subsets_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| SUBS-0001 | confidence | xsd:decimal |
| SUBS-0002 | dimension_kind | xsd:string |
| SUBS-0003 | method | xsd:string |
| SUBS-0004 | recorded_at | xsd:dateTime |
| SUBS-0005 | uncertainty | xsd:decimal |
| SUBS-0006 | unit | xsd:string |
| SUBS-0007 | value | xsd:decimal |
| SUBS-0008 | encoding | xsd:string |

**t_mass_function_only_assigns_subsets_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SUBS-0001 | SUBS-0001 | SUBS-0004 | 2024-10-19T15:01:03 |
| SUBS-0002 | SUBS-0002 | SUBS-0004 | 2023-10-05T14:35:44 |
| SUBS-0003 | SUBS-0003 | SUBS-0004 | 2024-02-24T01:03:34 |
| SUBS-0004 | SUBS-0004 | SUBS-0004 | 2024-04-26T17:49:00 |
| SUBS-0005 | SUBS-0005 | SUBS-0004 | 2024-01-29T11:02:31 |
| SUBS-0006 | SUBS-0006 | SUBS-0004 | 2023-11-16T17:14:50 |

**t_mass_function_only_assigns_subsets_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SUBS-0001 | SUBS-0001 | SUBS-0001 | 0.589 |
| SUBS-0002 | SUBS-0001 | SUBS-0005 | 503.17 |
| SUBS-0003 | SUBS-0001 | SUBS-0007 | 721.15 |
| SUBS-0004 | SUBS-0002 | SUBS-0001 | 0.512 |
| SUBS-0005 | SUBS-0002 | SUBS-0005 | 595.07 |
| SUBS-0006 | SUBS-0002 | SUBS-0007 | 721.26 |
| SUBS-0007 | SUBS-0003 | SUBS-0001 | 0.645 |
| SUBS-0008 | SUBS-0003 | SUBS-0005 | 722.55 |

**t_mass_function_only_assigns_subsets_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SUBS-0001 | SUBS-0001 | SUBS-0002 | Dimension Kind 01 |
| SUBS-0002 | SUBS-0001 | SUBS-0008 | Encoding 02 |
| SUBS-0003 | SUBS-0001 | SUBS-0009 | nightly summary |
| SUBS-0004 | SUBS-0001 | SUBS-0010 | de |
| SUBS-0005 | SUBS-0001 | SUBS-0003 | manual |
| SUBS-0006 | SUBS-0001 | SUBS-0006 | mg/L |
| SUBS-0007 | SUBS-0002 | SUBS-0002 | Dimension Kind 07 |
| SUBS-0008 | SUBS-0002 | SUBS-0008 | Encoding 08 |

The value tables for mass functions follow the same entity-attribute-value pattern, storing typed values that qualify the mass assignments. Decimal values such as `0.589` and `503.17` record quantitative assessments for entities like `SUBS-0001`, while datetime values like `2024-10-19T15:01:03` and `2023-10-05T14:35:44` timestamp the `recorded_at` attribute across mass function entities. Varchar values include `Dimension Kind 01`, `Encoding 02`, `nightly summary`, and `de`, demonstrating that mass function metadata can carry both structured codes and free-text annotations. The nullability state table further refines governance by mapping columns to states (`SUBS-0003`, `SUBS-0004`), indicating whether fields like `timestamp_utc`, `checksum_sha256`, and `latency_ms` permit null values—a critical detail for data quality enforcement in knowledge integration pipelines.

**t_column_nullability_state**

| id | column | nullability_state |
| --- | --- | --- |
| STAT-0001 | timestamp_utc | SUBS-0003 |
| STAT-0002 | checksum_sha256 | SUBS-0004 |
| STAT-0003 | latency_ms | SUBS-0004 |
| STAT-0004 | timestamp_utc | SUBS-0003 |
| STAT-0005 | timestamp_utc | SUBS-0005 |
| STAT-0006 | checksum_sha256 | SUBS-0004 |

**t_column_nullability_state_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| STAT-0001 | confidence | xsd:decimal |
| STAT-0002 | dimension_kind | xsd:string |
| STAT-0003 | method | xsd:string |
| STAT-0004 | recorded_at | xsd:dateTime |
| STAT-0005 | uncertainty | xsd:decimal |
| STAT-0006 | unit | xsd:string |
| STAT-0007 | value | xsd:decimal |
| STAT-0008 | encoding | xsd:string |

**t_column_nullability_state_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| STAT-0001 | STAT-0001 | STAT-0004 | 2024-12-29T19:38:29 |
| STAT-0002 | STAT-0002 | STAT-0004 | 2023-05-04T12:31:25 |
| STAT-0003 | STAT-0003 | STAT-0004 | 2023-11-12T04:10:53 |
| STAT-0004 | STAT-0004 | STAT-0004 | 2024-08-13T21:58:19 |
| STAT-0005 | STAT-0005 | STAT-0004 | 2023-08-07T04:27:45 |
| STAT-0006 | STAT-0006 | STAT-0004 | 2025-03-15T00:17:24 |

**t_column_nullability_state_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| STAT-0001 | STAT-0001 | STAT-0001 | 0.294 |
| STAT-0002 | STAT-0001 | STAT-0005 | 568.73 |
| STAT-0003 | STAT-0001 | STAT-0007 | 519.24 |
| STAT-0004 | STAT-0002 | STAT-0001 | 0.734 |
| STAT-0005 | STAT-0002 | STAT-0005 | 854.57 |
| STAT-0006 | STAT-0002 | STAT-0007 | 958.56 |
| STAT-0007 | STAT-0003 | STAT-0001 | 0.295 |
| STAT-0008 | STAT-0003 | STAT-0005 | 90.08 |

**t_column_nullability_state_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| STAT-0001 | STAT-0001 | STAT-0002 | Dimension Kind 01 |
| STAT-0002 | STAT-0001 | STAT-0008 | Encoding 02 |
| STAT-0003 | STAT-0001 | STAT-0009 | intake form |
| STAT-0004 | STAT-0001 | STAT-0010 | fr |
| STAT-0005 | STAT-0001 | STAT-0003 | automated |
| STAT-0006 | STAT-0001 | STAT-0006 | ratio |
| STAT-0007 | STAT-0002 | STAT-0002 | Dimension Kind 07 |
| STAT-0008 | STAT-0002 | STAT-0008 | Encoding 08 |