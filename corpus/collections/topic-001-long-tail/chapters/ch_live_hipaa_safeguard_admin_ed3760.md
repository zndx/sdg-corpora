---
chapter_id: ch_live_hipaa_safeguard_admin_ed3760
topic_id: 1
family: 07_long_tail
cited_terms: ['hipaa_safeguard_admin', 'dempster_combinant_second', 'equiv_intersect_with_restriction']
model: engine-refine
---

In governed data architectures, the distinction between an entity and its attributes is not merely organizational but structural, enforcing a separation between what an object is and what properties it carries. An entity—whether a HIPAA safeguard designation such as the Privacy Rule or Security Rule, a Dempster-Shafer combinant like EvidenceCombinationBeta or AnomalyFusionEngine, or an equivalence restriction pairing sensor_array_gamma with stream_processor_8—receives a stable, opaque identifier: ADMI-0001 through ADMI-0004 for safeguard records, SECO-0001 through SECO-0004 for combinant records, REST-0001 through REST-0004 for restriction records. These identifiers serve as the immutable anchor points across all subsequent value tables, ensuring that attribute assignments can be traced, audited, and versioned without ambiguity. The identifier column is the sole primary key in each entity table, and its value—ADMI-0001, SECO-0001, REST-0001—becomes the foreign key that binds every attribute value back to its owning entity.

**t_hipaa_safeguard_admin**

| id | hipaa | hipaa_safeguard |
| --- | --- | --- |
| ADMI-0001 | Privacy Rule | Audit Controls |
| ADMI-0002 | Security Rule | Omnibus Modification |
| ADMI-0003 | Transactions Rule | e-Signature Rule |
| ADMI-0004 | Contingency Plan | Security Policy |
| ADMI-0005 | Audit Controls | Access Control |
| ADMI-0006 | Unique ID Rule | Unique ID Rule |
| ADMI-0007 | HITECH Amendment | Incident Response |

**t_hipaa_safeguard_admin_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ADMI-0001 | ADMI-0001 | ADMI-0004 | 1 |
| ADMI-0002 | ADMI-0001 | ADMI-0005 | 309 |
| ADMI-0003 | ADMI-0002 | ADMI-0004 | 1 |
| ADMI-0004 | ADMI-0002 | ADMI-0005 | 623 |
| ADMI-0005 | ADMI-0003 | ADMI-0004 | 3 |
| ADMI-0006 | ADMI-0003 | ADMI-0005 | 849 |
| ADMI-0007 | ADMI-0004 | ADMI-0004 | 5 |
| ADMI-0008 | ADMI-0004 | ADMI-0005 | 665 |

**t_dempster_combinant_second**

| id | dempster | second_combinant |
| --- | --- | --- |
| SECO-0001 | EvidenceCombinationBeta | SourceMetadataRegistry |
| SECO-0002 | AnomalyFusionEngine | GPSPositionLog |
| SECO-0003 | LabDataCombinerNode | BaselineTelemetryTrace |
| SECO-0004 | GovernanceEvidenceModel | ThermalImagingFeed |
| SECO-0005 | GovernanceEvidenceModel | ThermalImagingFeed |
| SECO-0006 | GovernanceEvidenceModel | SpectralAnalysisOutput |
| SECO-0007 | CrossDomainEvidenceRule | PressureSensorArray |

**t_equiv_intersect_with_restriction**

| id | equiv | equiv_2 | related |
| --- | --- | --- | --- |
| REST-0001 | sensor_array_gamma | stream_processor_8 | s3_export_bucket |
| REST-0002 | event_bus_core | sensor_bridge_delta | snowflake_warehouse_prod |
| REST-0003 | kafka_stream_primary | batch_mirror_main | s3_export_bucket |
| REST-0004 | telemetry_broker_alpha | vector_cache_prod | prometheus_scrape_target |

Attributes themselves are declared in dedicated schema tables that decouple the definition of a property from its runtime values. In the HIPAA safeguard domain, the attribute catalog includes effective_date typed as xsd:date, enforcement as xsd:string, mandatory as xsd:boolean, and priority as xsd:integer. In the Dempster combinant domain, the attribute set comprises confidence as xsd:decimal, dimension_kind as xsd:string, method as xsd:string, and recorded_at as xsd:dateTime. Each attribute receives its own identifier—ADMI-0001 through ADMI-0009 in the safeguard set, SECO-0001 through SECO-0009 in the combinant set—which functions as the foreign key in every value table. The attr_type column enforces type discipline at the schema level, ensuring that the value tables store only data conforming to the declared XSD type. This two-level declaration—entity definition followed by attribute definition—creates a metamodel that can be extended without schema migration.

**t_hipaa_safeguard_admin_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ADMI-0001 | effective_date | xsd:date |
| ADMI-0002 | enforcement | xsd:string |
| ADMI-0003 | mandatory | xsd:boolean |
| ADMI-0004 | priority | xsd:integer |
| ADMI-0005 | review_cycle_days | xsd:integer |
| ADMI-0006 | scope | xsd:string |
| ADMI-0007 | encoding | xsd:string |
| ADMI-0008 | label_text | xsd:string |

**t_hipaa_safeguard_admin_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ADMI-0001 | ADMI-0001 | ADMI-0003 | true |
| ADMI-0002 | ADMI-0002 | ADMI-0003 | false |
| ADMI-0003 | ADMI-0003 | ADMI-0003 | true |
| ADMI-0004 | ADMI-0004 | ADMI-0003 | false |
| ADMI-0005 | ADMI-0005 | ADMI-0003 | true |
| ADMI-0006 | ADMI-0006 | ADMI-0003 | false |
| ADMI-0007 | ADMI-0007 | ADMI-0003 | false |

**t_hipaa_safeguard_admin_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ADMI-0001 | ADMI-0001 | ADMI-0001 | 2024-01-07 |
| ADMI-0002 | ADMI-0002 | ADMI-0001 | 2023-01-18 |
| ADMI-0003 | ADMI-0003 | ADMI-0001 | 2025-04-08 |
| ADMI-0004 | ADMI-0004 | ADMI-0001 | 2024-08-23 |
| ADMI-0005 | ADMI-0005 | ADMI-0001 | 2023-10-19 |
| ADMI-0006 | ADMI-0006 | ADMI-0001 | 2024-11-12 |
| ADMI-0007 | ADMI-0007 | ADMI-0001 | 2023-08-20 |

**t_dempster_combinant_second_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| SECO-0001 | confidence | xsd:decimal |
| SECO-0002 | dimension_kind | xsd:string |
| SECO-0003 | method | xsd:string |
| SECO-0004 | recorded_at | xsd:dateTime |
| SECO-0005 | uncertainty | xsd:decimal |
| SECO-0006 | unit | xsd:string |
| SECO-0007 | value | xsd:decimal |
| SECO-0008 | encoding | xsd:string |

**t_dempster_combinant_second_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SECO-0001 | SECO-0001 | SECO-0004 | 2024-10-02T15:13:46 |
| SECO-0002 | SECO-0002 | SECO-0004 | 2024-09-30T23:04:21 |
| SECO-0003 | SECO-0003 | SECO-0004 | 2023-05-15T03:36:40 |
| SECO-0004 | SECO-0004 | SECO-0004 | 2023-03-27T03:16:31 |
| SECO-0005 | SECO-0005 | SECO-0004 | 2024-02-17T20:31:55 |
| SECO-0006 | SECO-0006 | SECO-0004 | 2025-02-25T15:10:20 |
| SECO-0007 | SECO-0007 | SECO-0004 | 2023-11-24T02:27:20 |

**t_dempster_combinant_second_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SECO-0001 | SECO-0001 | SECO-0001 | 0.328 |
| SECO-0002 | SECO-0001 | SECO-0005 | 597.98 |
| SECO-0003 | SECO-0001 | SECO-0007 | 738.09 |
| SECO-0004 | SECO-0002 | SECO-0001 | 0.558 |
| SECO-0005 | SECO-0002 | SECO-0005 | 817.82 |
| SECO-0006 | SECO-0002 | SECO-0007 | 989.70 |
| SECO-0007 | SECO-0003 | SECO-0001 | 0.241 |
| SECO-0008 | SECO-0003 | SECO-0005 | 869.27 |

The value tables implement a type-partitioned EAV pattern, where each XSD type has its own storage table. Boolean attribute values for HIPAA safeguards reside in t_hipaa_safeguard_admin_val_boolean, with rows linking entity_id ADMI-0001 through ADMI-0004 to attr_id ADMI-0003 and storing value true or false. Date values occupy t_hipaa_safeguard_admin_val_date, where entity_id ADMI-0001 maps to value 2024-01-07, entity_id ADMI-0002 to 2023-01-18, entity_id ADMI-0003 to 2025-04-08, and entity_id ADMI-0004 to 2024-08-23, all under attr_id ADMI-0001. Integer values are stored in t_hipaa_safeguard_admin_val_int, with entity_id ADMI-0001 paired to attr_id ADMI-0004 holding value 1 and to attr_id ADMI-0005 holding value 309, while entity_id ADMI-0002 pairs to attr_id ADMI-0004 with value 1 and to attr_id ADMI-0005 with value 623. String values live in t_hipaa_safeguard_admin_val_varchar, where entity_id ADMI-0001 connects to attr_id ADMI-0007 with value Encoding 01, to attr_id ADMI-0002 with value Enforcement 02, to attr_id ADMI-0008 with value change rationale, and to attr_id ADMI-0009 with value fr. The same partitioning applies to the Dempster domain: t_dempster_combinant_second_val_datetime stores recorded_at values such as 2024-10-02T15:13:46 for entity SECO-0001 and 2023-03-27T03:16:31 for entity SECO-0004; t_dempster_combinant_second_val_decimal stores confidence values including 0.328 for entity SECO-0001 under attr SECO-0001, 597.98 under attr SECO-0005, and 738.09 under attr SECO-0007; and t_dempster_combinant_second_val_varchar stores dimension_kind values like Dimension Kind 01 and Encoding 02 for entity SECO-0001.

**t_hipaa_safeguard_admin_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ADMI-0001 | ADMI-0001 | ADMI-0007 | Encoding 01 |
| ADMI-0002 | ADMI-0001 | ADMI-0002 | Enforcement 02 |
| ADMI-0003 | ADMI-0001 | ADMI-0008 | change rationale |
| ADMI-0004 | ADMI-0001 | ADMI-0009 | fr |
| ADMI-0005 | ADMI-0001 | ADMI-0006 | Scope 05 |
| ADMI-0006 | ADMI-0002 | ADMI-0007 | Encoding 06 |
| ADMI-0007 | ADMI-0002 | ADMI-0002 | Enforcement 07 |
| ADMI-0008 | ADMI-0002 | ADMI-0008 | audit excerpt |

**t_dempster_combinant_second_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SECO-0001 | SECO-0001 | SECO-0002 | Dimension Kind 01 |
| SECO-0002 | SECO-0001 | SECO-0008 | Encoding 02 |
| SECO-0003 | SECO-0001 | SECO-0009 | nightly summary |
| SECO-0004 | SECO-0001 | SECO-0010 | en |
| SECO-0005 | SECO-0001 | SECO-0003 | manual |
| SECO-0006 | SECO-0001 | SECO-0006 | deg_C |
| SECO-0007 | SECO-0002 | SECO-0002 | Dimension Kind 07 |
| SECO-0008 | SECO-0002 | SECO-0008 | Encoding 08 |

This partitioned value architecture yields several operational advantages. Type safety is enforced at the storage layer—no boolean value can leak into a decimal table, no date can be stored in a varchar column—because each value table has a single value column typed to match its attr_type declaration. Query performance improves because predicates on a known type can scan only the relevant value table rather than performing union operations across all type partitions. Auditability is enhanced because the entity_id and attr_id foreign keys create a complete trace from identifier through attribute definition to stored value; one can reconstruct the full attribute profile of entity ADMI-0001 by joining across all five HIPAA value tables, or of entity SECO-0001 across all three Dempster value tables. The identifier scheme itself—ADMI- prefixed for HIPAA safeguards, SECO- prefixed for Dempster combinants, REST- prefixed for equivalence restrictions—provides immediate domain disambiguation without requiring a separate domain lookup table.