---
chapter_id: ch_live_labrun_produces_measurement_def4d9
topic_id: 12
family: 02_observation_measurement
cited_terms: ['labrun_produces_measurement', 'labrun_subclass', 'labrun_uses_instrument']
model: engine-refine
---

Laboratory execution is governed by a structured registry of runs, each anchored to a unique identifier that serves as the immutable reference point for downstream audit and reproducibility. A labrun represents a discrete experimental or analytical cycle, catalogued under a descriptive misc label and assigned to a broader category that dictates its procedural constraints and reporting lineage. For instance, a run designated MEAS-0001 is classified under Labrun Category 01 and carries the descriptive misc label Labrun Label 01, establishing a clear hierarchical mapping between operational intent and administrative classification. This categorical framework extends to specialized subclasses, where distinct experimental modalities such as CellCulture-Exp12 or FlowCyt-Panel9 are explicitly bound to their respective input samples, including PlasmaCitrate-Lot4 and HumanSerum-A7, thereby preserving chain-of-custody and sample provenance within the execution ledger.

**dim_labrun**

| id | labrun_label | labrun_category |
| --- | --- | --- |
| MEAS-0001 | Labrun Label 01 | Labrun Category 01 |
| MEAS-0002 | Labrun Label 02 | Labrun Category 02 |
| MEAS-0003 | Labrun Label 03 | Labrun Category 03 |
| MEAS-0004 | Labrun Label 04 | Labrun Category 04 |
| MEAS-0005 | Labrun Label 05 | Labrun Category 05 |
| MEAS-0006 | Labrun Label 06 | Labrun Category 06 |

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

Operational fidelity is quantified through a triad of telemetry fields that capture execution duration, termination state, and recovery attempts. The duration seconds metric records the precise elapsed time for each cycle, with measured intervals ranging from 4308.22 seconds to 5155.73 seconds, providing a baseline for throughput analysis and resource allocation. Termination is codified via the exit field, which logs non-zero status codes such as 122, 691, and 566 to signal abnormal completions, while exit code 3 denotes a controlled or expected conclusion. When failures occur, the retry count field tracks the number of automatic or manual re-executions, with observed values of 265, 244, 106, and 12 reflecting the system’s tolerance thresholds and the frequency of transient faults requiring intervention.

To accommodate the heterogeneity of experimental metadata, the framework employs an extensible attribute registry where each attr is formally declared alongside its attr type, ensuring type safety and consistent parsing across heterogeneous data sources. Attributes such as duration_seconds, end_time, exit_code, and host_name are registered with strict schema constraints—xsd:decimal for floating-point measurements, xsd:dateTime for temporal markers, xsd:integer for discrete counters, and xsd:string for textual descriptors. This typed attribute model is decoupled from the core execution records and resolved through an entity reference, which acts as the foreign key linking a specific run instance to its associated property definitions. Consequently, a single entity can accumulate a diverse set of properties without altering the underlying relational structure, supporting both standardized telemetry and domain-specific annotations.

Attribute values are materialized in type-specific storage tables, each keyed to an entity and an attr identifier, guaranteeing that temporal, numeric, integer, and textual data are persisted in their native formats. Temporal attributes resolve to precise ISO 8601 timestamps such as 2023-06-03T03:48:13 or 2024-12-03T15:21:58, while decimal measurements capture granular performance deltas like 7187.70 or 3249.87. Integer counters and varchar descriptors store operational states including node identifiers (node-b14), log severity levels (Log Level 02), and lifecycle statuses (closeout, pending, execution, superseded). This value-resolution pattern extends to instrumentation telemetry, where runs are explicitly linked to hardware assets—ThermoFisher Q-Exactive, Hitachi S-4800, Bruker Avance III, Olympus BX63—and each instrument association inherits the same attribute taxonomy, enabling parallel tracking of equipment utilization, host assignments, and execution outcomes.

**t_labrun_uses_instrument**

| id | labrun | uses |
| --- | --- | --- |
| INST-0001 | RUN-2024-A7 | ThermoFisher Q-Exactive |
| INST-0002 | PROT-XRAY-03 | Hitachi S-4800 |
| INST-0003 | CYTO-20241022 | Bruker Avance III |
| INST-0004 | GENOME-READ-04 | Olympus BX63 |
| INST-0005 | FIELD-MAP-09 | Shimadzu GCMS-TQ8050 |
| INST-0006 | ASSAY-Q3-24 | Waters Xevo TQ-S |

**t_labrun_uses_instrument_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| INST-0001 | duration_seconds | xsd:decimal |
| INST-0002 | end_time | xsd:dateTime |
| INST-0003 | exit_code | xsd:integer |
| INST-0004 | host_name | xsd:string |
| INST-0005 | log_level | xsd:string |
| INST-0006 | phase | xsd:string |
| INST-0007 | retry_count | xsd:integer |
| INST-0008 | scheduled_at | xsd:dateTime |

**t_labrun_uses_instrument_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| INST-0001 | INST-0001 | INST-0002 | 2023-07-28T22:24:46 |
| INST-0002 | INST-0001 | INST-0008 | 2024-09-04T14:41:30 |
| INST-0003 | INST-0001 | INST-0009 | 2025-06-09T20:56:36 |
| INST-0004 | INST-0002 | INST-0002 | 2024-06-06T14:47:39 |
| INST-0005 | INST-0002 | INST-0008 | 2025-04-06T19:57:44 |
| INST-0006 | INST-0002 | INST-0009 | 2023-06-18T12:50:38 |
| INST-0007 | INST-0003 | INST-0002 | 2023-05-25T22:41:33 |
| INST-0008 | INST-0003 | INST-0008 | 2023-09-07T05:37:31 |

**t_labrun_uses_instrument_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| INST-0001 | INST-0001 | INST-0001 | 397.40 |
| INST-0002 | INST-0002 | INST-0001 | 2693.73 |
| INST-0003 | INST-0003 | INST-0001 | 4636.55 |
| INST-0004 | INST-0004 | INST-0001 | 1173.52 |
| INST-0005 | INST-0005 | INST-0001 | 1814.21 |
| INST-0006 | INST-0006 | INST-0001 | 5265.62 |

**t_labrun_uses_instrument_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| INST-0001 | INST-0001 | INST-0003 | 889 |
| INST-0002 | INST-0001 | INST-0007 | 321 |
| INST-0003 | INST-0002 | INST-0003 | 608 |
| INST-0004 | INST-0002 | INST-0007 | 248 |
| INST-0005 | INST-0003 | INST-0003 | 589 |
| INST-0006 | INST-0003 | INST-0007 | 121 |
| INST-0007 | INST-0004 | INST-0003 | 16 |
| INST-0008 | INST-0004 | INST-0007 | 442 |

**t_labrun_uses_instrument_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| INST-0001 | INST-0001 | INST-0004 | ingest-21 |
| INST-0002 | INST-0001 | INST-0005 | Log Level 02 |
| INST-0003 | INST-0001 | INST-0006 | execution |
| INST-0004 | INST-0001 | INST-0010 | superseded |
| INST-0005 | INST-0001 | INST-0011 | Triggered By 05 |
| INST-0006 | INST-0002 | INST-0004 | worker-07 |
| INST-0007 | INST-0002 | INST-0005 | Log Level 07 |
| INST-0008 | INST-0002 | INST-0006 | review |

The architectural separation of identifiers, categorical metadata, performance telemetry, and typed attribute values establishes a compliance-ready audit trail that satisfies rigorous reproducibility and data governance standards. By normalizing labrun execution into discrete, queryable dimensions and fact tables, the system isolates procedural classification from runtime metrics, allowing auditors to reconstruct the exact sequence of sample processing, instrument allocation, and failure recovery without schema drift. The explicit typing of attr and the strict binding of entity to value tables prevent data corruption across heterogeneous inputs, while the retry count and exit fields provide immediate visibility into system stability and operator intervention points. Ultimately, this structured telemetry framework transforms ephemeral laboratory activity into a persistent, verifiable record suitable for regulatory review, quality assurance, and cross-institutional data exchange.

**fact_labrun**

| id | labrun_key | duration_seconds | exit_code | retry_count |
| --- | --- | --- | --- | --- |
| MEAS-0001 | MEAS-0002 | 4856.18 | 122 | 265 |
| MEAS-0002 | MEAS-0006 | 4308.22 | 691 | 244 |
| MEAS-0003 | MEAS-0002 | 4764.89 | 566 | 106 |
| MEAS-0004 | MEAS-0005 | 5155.73 | 3 | 12 |
| MEAS-0005 | MEAS-0002 | 385.91 | 81 | 197 |

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