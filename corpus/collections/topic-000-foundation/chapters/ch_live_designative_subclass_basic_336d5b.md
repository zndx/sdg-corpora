---
chapter_id: ch_live_designative_subclass_basic_336d5b
topic_id: 0
family: 01_foundation
cited_terms: ['designative_subclass_basic', 'profiling_only_targets_datasets', 'dempster_combinant_second']
model: engine-refine
---

In governed data environments, **attr**, **attr_type**, **entity**, **identifier**, **language**, and **misc** form the minimal vocabulary by which records are named, classified, localized, and bound to observable facts. An **identifier** is a durable surrogate key that survives renaming, reclassification, and cross-system reconciliation; it is not the human-readable label but the canonical handle under which all dependent assertions are registered. Thus DESI-0001 and DESI-0004 may both carry the designative token event_tag_crash and the auxiliary code D-33, yet remain distinct registry entries because their identifiers partition what would otherwise collapse into ambiguous synonymy. Likewise, profiling workloads resolve through DATA-0001–DATA-0004, and evidence-combination nodes through SECO-0001–SECO-0004, so that lineage, cardinality sweeps, and Dempster-style fusion can be cited without conflating the operational artifact with its descriptive surface form.

**t_designative_subclass_basic**

| id | designative | code | language |
| --- | --- | --- | --- |
| DESI-0001 | event_tag_crash | D-33 | fr |
| DESI-0002 | plate_A04 | B-12 | es |
| DESI-0003 | barcode_8842X | E-21 | fr |
| DESI-0004 | event_tag_crash | D-33 | es |
| DESI-0005 | reagent_Lot_B22 | B-12 | es |
| DESI-0006 | registry_ISO9001 | C-07 | fr |
| DESI-0007 | event_tag_crash | A-01 | es |

The **entity** denotes the subject of assertion: the object whose state or measured properties are being recorded. In typed value stores, entity_id anchors each fact to a single bearer—DATA-0001 accumulates multiple datetime, decimal, integer, and varchar observations (including end_time at 2025-02-03T06:32:48 and duration_seconds at 30.48), while DATA-0002 receives a distinct end_time (2024-11-09T19:11:07) and its own decimal profile (6189.13). The pattern generalizes to combinant-second evidence nodes, where SECO-0001 holds confidence 0.328 alongside dimension_kind “Dimension Kind 01” and recorded_at 2024-10-02T15:13:46, and SECO-0002 records a separate confidence draw (0.558) under the same attr_name but a different entity_id. Entity therefore functions as the compositional unit of governance: auditors trace “what was said about what,” not merely “what string appeared in a row.”

**Attr** names the slot or semantic role within an entity’s profile—duration_seconds, exit_code, host_name, confidence, method—while **attr_type** fixes the interpretive contract under which values may legally be stored and compared. Declaring xsd:decimal for duration_seconds and xsd:dateTime for end_time prevents categorical leakage across physical tables: decimals land in val_decimal (30.48, 6189.13, 4326.04, 4636.52), integers in val_int (255, 337, 67, 59), datetimes in val_datetime (2024-10-18T20:19:23 through 2023-03-27T03:16:31), and strings in val_varchar (gw-12, closeout, failed, en). The attr_id foreign key couples each stored value to its declared role—DATA-0001 paired with attr_id DATA-0002 for end_time, SECO-0004 with attr_id SECO-0004 for recorded_at—so that schema evolution can add attributes without widening every entity table and so that validation rules remain type-local rather than inferred from column names alone.

**Language** governs locale-specific presentation of designative material without mutating the underlying identifier or code. DESI-0001 and DESI-0002 share French (fr) while DESI-0003 and DESI-0004 are registered under Spanish (es), even where designative strings repeat (event_tag_crash) or codes echo (D-33). This separation matters for compliance handbooks and operational guides that must render labels to jurisdictional audiences while preserving a single authoritative key for automation, matching, and evidence combination. A barcode_8842X or plate_A04 token displayed in fr or es remains traceable to E-21 or B-12 through the misc-coded auxiliary field, not through orthographic coincidence in the designative column.

**Misc** absorbs values and codes that are neither primary identifiers nor fully typed measurements yet remain evidentially material: subclass codes (D-33, B-12, E-21), profiling descriptors (null rate analysis, hash integrity check), and the literal payloads slotted into entity–attribute intersections. In varchar misc stores, exit_code failed, host_name gw-12, and method nightly summary sit alongside language-tagged fragments such as en, illustrating how misc carries both operational residue and semi-structured annotation. Across the profiling and Dempster-combinant subgraphs—where AnomalyFusionEngine links to DATA-0001 and GovernanceEvidenceModel to DATA-0004—the same six-term ontology recurs: identifier for registry stability, entity for assertion scope, attr and attr_type for semantic and syntactic discipline, language for localized designation, misc for everything else that must be preserved without forcing premature normalization.

**t_dempster_combinant_second**

| id | dempster | second_combinant |
| --- | --- | --- |
| SECO-0001 | EvidenceCombinationBeta | DATA-0005 |
| SECO-0002 | AnomalyFusionEngine | DATA-0001 |
| SECO-0003 | LabDataCombinerNode | DATA-0006 |
| SECO-0004 | GovernanceEvidenceModel | DATA-0004 |
| SECO-0005 | GovernanceEvidenceModel | DATA-0006 |
| SECO-0006 | GovernanceEvidenceModel | DATA-0002 |
| SECO-0007 | CrossDomainEvidenceRule | DATA-0005 |

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

Taken together, these terms implement a disciplined Entity–Attribute–Value discipline suited to heterogeneous observability and evidence-fusion pipelines. Profiling-only targets name their analytical intent in the profiling column while delegating measurable structure to attr definitions and type-partitioned value relations; combinant-second nodes inherit that pattern so confidence, dimension_kind, and recorded_at can be audited per SECO identifier even when second_combinant pointers crosswalk into external datasets (DATA-0005, DATA-0006). Practitioners who treat identifier as immutable, entity as the locus of truth, attr/attr_type as the validation envelope, language as presentation scope, and misc as the controlled overflow for codes and literals obtain traceable, locale-aware, type-safe registries—precisely the substrate required when crash-tagged designatives, hash-integrity sweeps, and fractional confidence masses must be combined under governance without semantic collapse.

**t_profiling_only_targets_datasets**

| id | profiling |
| --- | --- |
| DATA-0001 | null rate analysis |
| DATA-0002 | cardinality profiling |
| DATA-0003 | data lineage sweep |
| DATA-0004 | hash integrity check |
| DATA-0005 | null rate analysis |
| DATA-0006 | field distribution scan |

**t_profiling_only_targets_datasets_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| DATA-0001 | duration_seconds | xsd:decimal |
| DATA-0002 | end_time | xsd:dateTime |
| DATA-0003 | exit_code | xsd:integer |
| DATA-0004 | host_name | xsd:string |
| DATA-0005 | log_level | xsd:string |
| DATA-0006 | phase | xsd:string |
| DATA-0007 | retry_count | xsd:integer |
| DATA-0008 | scheduled_at | xsd:dateTime |

**t_profiling_only_targets_datasets_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DATA-0001 | DATA-0001 | DATA-0002 | 2024-10-18T20:19:23 |
| DATA-0002 | DATA-0001 | DATA-0008 | 2025-02-03T06:32:48 |
| DATA-0003 | DATA-0001 | DATA-0009 | 2023-04-17T19:14:01 |
| DATA-0004 | DATA-0002 | DATA-0002 | 2024-11-09T19:11:07 |
| DATA-0005 | DATA-0002 | DATA-0008 | 2025-06-11T19:41:26 |
| DATA-0006 | DATA-0002 | DATA-0009 | 2023-12-25T21:51:31 |
| DATA-0007 | DATA-0003 | DATA-0002 | 2024-07-30T10:10:32 |
| DATA-0008 | DATA-0003 | DATA-0008 | 2025-03-13T05:29:50 |

**t_profiling_only_targets_datasets_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DATA-0001 | DATA-0001 | DATA-0001 | 30.48 |
| DATA-0002 | DATA-0002 | DATA-0001 | 6189.13 |
| DATA-0003 | DATA-0003 | DATA-0001 | 4326.04 |
| DATA-0004 | DATA-0004 | DATA-0001 | 4636.52 |
| DATA-0005 | DATA-0005 | DATA-0001 | 5515.53 |
| DATA-0006 | DATA-0006 | DATA-0001 | 6410.37 |

**t_profiling_only_targets_datasets_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DATA-0001 | DATA-0001 | DATA-0003 | 255 |
| DATA-0002 | DATA-0001 | DATA-0007 | 337 |
| DATA-0003 | DATA-0002 | DATA-0003 | 67 |
| DATA-0004 | DATA-0002 | DATA-0007 | 59 |
| DATA-0005 | DATA-0003 | DATA-0003 | 29 |
| DATA-0006 | DATA-0003 | DATA-0007 | 312 |
| DATA-0007 | DATA-0004 | DATA-0003 | 538 |
| DATA-0008 | DATA-0004 | DATA-0007 | 235 |

**t_profiling_only_targets_datasets_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DATA-0001 | DATA-0001 | DATA-0004 | gw-12 |
| DATA-0002 | DATA-0001 | DATA-0005 | Log Level 02 |
| DATA-0003 | DATA-0001 | DATA-0006 | closeout |
| DATA-0004 | DATA-0001 | DATA-0010 | failed |
| DATA-0005 | DATA-0001 | DATA-0011 | Triggered By 05 |
| DATA-0006 | DATA-0002 | DATA-0004 | node-b14 |
| DATA-0007 | DATA-0002 | DATA-0005 | Log Level 07 |
| DATA-0008 | DATA-0002 | DATA-0006 | closeout |