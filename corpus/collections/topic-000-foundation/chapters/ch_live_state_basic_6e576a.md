---
chapter_id: ch_live_state_basic_6e576a
topic_id: 0
family: 02_observation_measurement
cited_terms: ['state_basic', 'instrument_only_emits_type', 'equiv_intersect_three']
model: engine-refine
---

State observability in distributed telemetry architectures rests upon a disciplined separation of measured values from their categorical context, a pattern instantiated by the fact-state and dimension-state tables. The fact table anchors each observation with a unique identifier—STAT-0001 through STAT-0004—and records a numeric value alongside two complementary quality indicators: confidence, which quantifies the analyst's assurance in the measurement, and uncertainty, which expresses the associated error bound in absolute units. A reading of 195.86 carries a confidence of 0.422 and an uncertainty of 951.90, whereas a value of 619.50 achieves a substantially higher confidence of 0.523 with a tighter uncertainty of 366.30; the lowest-confidence observation, 0.012, corresponds to a value of 237.15 and an uncertainty of 421.79. The fact table's state_key column functions as a foreign key into the dimension table, where each identifier resolves to a human-readable state_label such as State Label 01 and a state_category such as State Category 01, thereby enabling aggregation and filtering by semantic classification without denormalizing the fact data.

**fact_state**

| id | state_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| STAT-0001 | STAT-0001 | 0.422 | 951.90 | 195.86 |
| STAT-0002 | STAT-0004 | 0.012 | 416.12 | 143.04 |
| STAT-0003 | STAT-0005 | 0.075 | 421.79 | 237.15 |
| STAT-0004 | STAT-0003 | 0.523 | 366.30 | 619.50 |

**dim_state**

| id | state_label | state_category |
| --- | --- | --- |
| STAT-0001 | State Label 01 | State Category 01 |
| STAT-0002 | State Label 02 | State Category 02 |
| STAT-0003 | State Label 03 | State Category 03 |
| STAT-0004 | State Label 04 | State Category 04 |
| STAT-0005 | State Label 05 | State Category 05 |
| STAT-0006 | State Label 06 | State Category 06 |
| STAT-0007 | State Label 07 | State Category 07 |
| STAT-0008 | State Label 08 | State Category 08 |

The identifier column constitutes the universal primary key across all four tables, enforcing referential integrity and enabling cross-table joins that correlate measurement quality with instrument provenance and data lineage. In the fact and dimension state tables, identifiers follow the prefix STAT-0001 through STAT-0004; in the instrument type table, they adopt the prefix TYPE-0001 through TYPE-0004; and in the equivalence intersection table, they use the prefix THRE-0001 through THRE-0004. This consistent scoping strategy ensures that a single observation can be traced from its measured value through its categorical classification, the instrument that generated it, and the data governance rules that govern its storage and access. The instrument type table records the device model—Seismograph, Ion chamber, or Acoustic transducer—along with the signal modality it emits, ranging from Acoustic echo to Telemetry stream, and associates each instrument with a created_date timestamp and a size_bytes metric that quantifies the volume of data it produces. A Seismograph deployed on 2024-12-01 generates 370,347,470 bytes of output, while an Ion chamber configured on 2023-12-08 produces 631,989,835 bytes, illustrating the substantial storage implications of instrument selection and deployment timing.

The created_date column provides a temporal anchor for instrument lifecycle management, enabling operators to correlate measurement quality with instrument age and firmware version. Dates span from 2023-01-25 for an Acoustic transducer emitting Infrared radiation to 2024-12-01 for a Seismograph, with intermediate deployments on 2023-12-08 and 2024-07-30 both involving Ion chambers. The size_bytes column, which stores values ranging from 370,347,470 to 631,989,835 bytes, serves as a capacity planning metric and a cost attribution key, allowing data engineers to forecast storage requirements and allocate compute resources proportionally to instrument output volume. These two columns—created_date and size_bytes—form a lightweight provenance record that, while not formally foreign-keyed to the fact table, is implicitly linked through the shared identifier namespace and the operational assumption that each instrument's measurements populate the fact_state table.

The equivalence intersection table introduces a governance layer that maps data assets to their storage formats, lineage rules, and access environments. Each record, identified by THRE-0001 through THRE-0004, associates a data asset such as lab_sample_registry or governance_policy_alpha with a file format—orc_table, csv_archive, or hdf5_archive—a lineage directive such as crosswalk_rule or lineage_node, and an access tier ranging from dev_sandbox and hot_cache to air_gapped and staging_zone. The governance_policy_alpha asset appears in two records (THRE-0002 and THRE-0003) with distinct format and lineage assignments, reflecting the reality that a single logical asset may be materialized in multiple formats for different consumption patterns. The access tier column, which takes values including dev_sandbox, hot_cache, air_gapped, and staging_zone, enforces data classification policies by constraining where sensitive or regulated data may reside, and its presence in this intersection table signals that access control is treated as a first-class attribute of data governance rather than an afterthought applied at the infrastructure layer.

Confidence and uncertainty, as recorded in the fact table, constitute the quantitative backbone of measurement quality assurance. Confidence values span a narrow band from 0.012 to 0.523, suggesting that the system operates in a regime where absolute certainty is neither expected nor required; instead, operators reason about relative quality by comparing confidence ratios and uncertainty magnitudes. The inverse relationship between confidence and uncertainty is not strictly monotonic—a confidence of 0.422 corresponds to an uncertainty of 951.90, while a confidence of 0.523 corresponds to 366.30—but the general pattern holds that higher-confidence observations exhibit tighter error bounds. These metrics enable automated alerting thresholds, where observations falling below a confidence floor or exceeding an uncertainty ceiling can be flagged for manual review or excluded from downstream analytics. The misc column, which stores the primary numeric value of each observation, completes the fact record by providing the actual measurement that operators act upon, whether that value is 143.04, 195.86, 237.15, or 619.50.

The interplay between these tables—fact_state, dim_state, t_instrument_only_emits_type, and t_equiv_intersect_three—demonstrates a modular approach to data governance where measurement quality, categorical classification, instrument provenance, and access control are maintained as independent but joinable concerns. The identifier column serves as the connective tissue, enabling analysts to construct queries that simultaneously evaluate measurement confidence, instrument deployment date, data format, and access tier. This modularity supports regulatory compliance by allowing auditors to trace any observed value back through its instrument, its storage format, and its governance classification, while also enabling operational teams to optimize storage costs by analyzing the relationship between instrument size_bytes and measurement confidence. The state_category and state_label columns in the dimension table provide the semantic layer that translates numeric identifiers into human-understandable classifications, ensuring that automated systems and human operators share a common vocabulary when discussing measurement quality and instrument status.

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

**t_equiv_intersect_three**

| id | equiv | equiv_2 | equiv_3 | equiv_4 |
| --- | --- | --- | --- | --- |
| THRE-0001 | lab_sample_registry | orc_table | crosswalk_rule | dev_sandbox |
| THRE-0002 | governance_policy_alpha | orc_table | lineage_node | hot_cache |
| THRE-0003 | governance_policy_alpha | csv_archive | standard_mapping | air_gapped |
| THRE-0004 | sensor_array_gamma | hdf5_archive | crosswalk_rule | staging_zone |
| THRE-0005 | telemetry_stream_alpha | netcdf_file | retention_policy | dev_sandbox |
| THRE-0006 | lab_sample_registry | parquet_dataset | schema_binding | edge_node |