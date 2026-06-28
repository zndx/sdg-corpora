---
chapter_id: ch_live_baseline_for_metric_6ce0f9
topic_id: 0
family: 07_long_tail
cited_terms: ['baseline_for_metric', 'apolitical_islam', 'instrument_only_emits_type']
model: engine-refine
---

The governance of doctrinal classification systems rests on a separation between entity definitions, attribute schemas, and their runtime values—a pattern that ensures structural integrity while permitting flexible enrichment. At the core of this architecture, the entity table `t_apolitical_islam` anchors each record with a stable identifier such as `ISLA-0001` or `ISLA-0004`, alongside three substantive columns: `apolitical_islam`, which captures the governing model (for instance, the Turkish Diyanet model or Iranian Hawza quietism); `doctrinal_narrative`, which encodes the interpretive posture, ranging from Hadith preservation focus to ascetic withdrawal practice; and `political_islam_stance`, which records the corresponding political orientation, whether theocratic state proposal, militant jihadism, or political enjoinment doctrine. These columns together form a composite key of ideological positioning, yet the system deliberately decouples additional metadata from this core definition. Attribute enrichment flows through a dedicated schema table, `t_apolitical_islam_attr`, which declares extensible properties by name and type—`encoding`, `label_text`, and `language` are all registered with the `xsd:string` type, establishing a typed namespace for supplementary descriptors. The actual values populate a third table, `t_apolitical_islam_val_varchar`, which implements an entity-attribute-value pattern: each row binds an `entity_id` (e.g., `ISLA-0001`) to an `attr_id` (e.g., `ISLA-0001` for the encoding attribute) and stores the value itself, such as `Encoding 01` or `fr`. This three-table decomposition isolates the stable doctrinal record from volatile metadata, allowing new attributes to be introduced without schema migration.

**t_apolitical_islam**

| id | apolitical_islam | doctrinal_narrative | political_islam_stance |
| --- | --- | --- | --- |
| ISLA-0001 | Turkish Diyanet model | Hadith preservation focus | Theocratic state proposal |
| ISLA-0002 | Turkish Diyanet model | Ascetic withdrawal practice | Militant jihadism |
| ISLA-0003 | Turkish Diyanet model | Hadith preservation focus | Political enjoinment doctrine |
| ISLA-0004 | Iranian Hawza quietism | Worldly detachment concept | Islamist governance theory |
| ISLA-0005 | Sunni quietism | Hadith preservation focus | Theocratic state proposal |
| ISLA-0006 | Ahl-e Hadith | Community stability tenet | Islamist constitutionalism |
| ISLA-0007 | Deobandi quietism | Taqlid adherence tradition | Revolutionary vanguard model |

**t_apolitical_islam_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ISLA-0001 | encoding | xsd:string |
| ISLA-0002 | label_text | xsd:string |
| ISLA-0003 | language | xsd:string |

**t_apolitical_islam_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ISLA-0001 | ISLA-0001 | ISLA-0001 | Encoding 01 |
| ISLA-0002 | ISLA-0001 | ISLA-0002 | change rationale |
| ISLA-0003 | ISLA-0001 | ISLA-0003 | fr |
| ISLA-0004 | ISLA-0002 | ISLA-0001 | Encoding 04 |
| ISLA-0005 | ISLA-0002 | ISLA-0002 | audit excerpt |
| ISLA-0006 | ISLA-0002 | ISLA-0003 | fr |
| ISLA-0007 | ISLA-0003 | ISLA-0001 | Encoding 07 |
| ISLA-0008 | ISLA-0003 | ISLA-0002 | pre-release note |

A parallel structural principle governs the baseline registry, where metric definitions and their interdependencies are tracked through a distinct set of tables. The `t_baseline_for_metric` table establishes each baseline with a unique identifier—`METR-0001` through `METR-0004`—and a descriptive label such as `Standard_Daylight_Cycle`, `Power_Consumption`, `Structural_Stress`, or `Steady_State_Vibration`. These baselines do not exist in isolation; their relationships to other metrics are captured in the junction table `t_baseline_for_metric__baseline_for`, which records directed edges between a `baseline_id` and a `baseline_for_id` alongside a `role` that qualifies the nature of the dependency. For example, the baseline `METR-0007` assumes the role of `owner` with respect to `METR-0004`, while `METR-0002` and `METR-0007` both serve as `contributor` to `METR-0005`, and `METR-0001` functions as an `observer` of `METR-0005`. A secondary mapping table, `t_baseline_for_metric_baseline_for`, provides an additional layer of resolution by linking each baseline identifier to its target metric name—`Data_Ingestion_Rate` or `Power_Consumption`—thereby bridging the abstract identifier space with human-readable metric designations. This dual-layer relationship model supports both programmatic traversal and operational interpretation of baseline dependencies.

**t_baseline_for_metric**

| id | baseline |
| --- | --- |
| METR-0001 | Standard_Daylight_Cycle |
| METR-0002 | Power_Consumption |
| METR-0003 | Structural_Stress |
| METR-0004 | Steady_State_Vibration |
| METR-0005 | Factory_A_NightShift |
| METR-0006 | Battery_Capacity |
| METR-0007 | Standard_Daylight_Cycle |

**t_baseline_for_metric_baseline_for**

| id | baseline_for |
| --- | --- |
| METR-0001 | Data_Ingestion_Rate |
| METR-0002 | Data_Ingestion_Rate |
| METR-0003 | Steady_State_Vibration |
| METR-0004 | Power_Consumption |
| METR-0005 | Battery_Capacity |
| METR-0006 | Steady_State_Vibration |

**t_baseline_for_metric__baseline_for**

| id | baseline_id | baseline_for_id | role |
| --- | --- | --- | --- |
| METR-0001 | METR-0007 | METR-0004 | owner |
| METR-0002 | METR-0002 | METR-0005 | contributor |
| METR-0003 | METR-0001 | METR-0005 | observer |
| METR-0004 | METR-0007 | METR-0003 | contributor |
| METR-0005 | METR-0007 | METR-0004 | contributor |
| METR-0006 | METR-0001 | METR-0002 | reviewer |
| METR-0007 | METR-0004 | METR-0006 | reviewer |
| METR-0008 | METR-0007 | METR-0002 | reviewer |

The instrument catalog, housed in `t_instrument_only_emits_type`, introduces a third dimensional entity type characterized by physical properties and temporal provenance. Each record carries an identifier such as `TYPE-0001` through `TYPE-0004`, an `instrument` designation (Seismograph, Ion chamber, Acoustic transducer), and an `emits_signal` column that specifies the output modality—Acoustic echo, Ultrasound pulse, Infrared radiation, or Telemetry stream. Two additional columns, `created_date` and `size_bytes`, anchor each instrument in time and storage footprint: the Seismograph was registered on `2024-12-01` with a payload of 370,347,470 bytes, while the Ion chamber entries span from `2023-12-08` (631,989,835 bytes) to `2024-07-30` (541,950,157 bytes). These fields enable auditability and capacity planning, ensuring that the provenance and resource consumption of each instrument type are traceable.

**t_instrument_only_emits_type**

| id | instrument | emits_signal | created_date | size_bytes |
| --- | --- | --- | --- | --- |
| TYPE-0001 | Seismograph | Acoustic echo | 2024-12-01 | 370347470 |
| TYPE-0002 | Ion chamber | Ultrasound pulse | 2023-12-08 | 631989835 |
| TYPE-0003 | Acoustic transducer | Infrared radiation | 2023-01-25 | 565520223 |
| TYPE-0004 | Ion chamber | Telemetry stream | 2024-07-30 | 541950157 |
| TYPE-0005 | Spectrometer | RF pulse | 2024-06-22 | 83957422 |
| TYPE-0006 | Magnetometer | Acoustic echo | 2024-05-04 | 105995168 |
| TYPE-0007 | Particle detector | Ultrasound pulse | 2024-10-26 | 587447986 |

Across all three entity families—the doctrinal classifications, the baseline metrics, and the instrument registry—the design consistently applies a pattern of stable identifiers paired with descriptive columns, supplemented by relationship tables and, where applicable, an EAV-based attribute store. The foreign-key chains are explicit: `t_apolitical_islam_val_varchar.entity_id` references `t_apolitical_islam.id`, and `t_apolitical_islam_val_varchar.attr_id` references `t_apolitical_islam_attr.id`; similarly, `t_baseline_for_metric__baseline_for.baseline_id` and `baseline_for_id` reference `t_baseline_for_metric.id`, creating a directed graph of metric dependencies. This architecture permits heterogeneous enrichment—doctrinal entities accept typed string attributes, while baseline entities participate in role-qualified dependency edges and instrument entities carry temporal and volumetric metadata—without requiring a monolithic schema. The result is a governance framework in which classification, dependency, and provenance are each managed by their own structural layer, yet unified through a common identifier discipline.