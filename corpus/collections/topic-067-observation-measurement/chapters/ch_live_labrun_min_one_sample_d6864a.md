---
chapter_id: ch_live_labrun_min_one_sample_d6864a
topic_id: 67
family: 02_observation_measurement
cited_terms: ['labrun_min_one_sample', 'mass_function_with_normalization', 'radicalization_process']
model: engine-refine
---

**Laboratory Sample Run Registry**

Each laboratory sample run is assigned a unique identifier—SAMP-0001 through SAMP-0004 in the current dataset—serving as the primary key for the `t_labrun_min_one_sample` table. The `labrun` column records the execution sequence or protocol designation, such as SEQ-EXP-99, PROTOCOL-V3, or CEL-SEQR-112, while `input_sample` identifies the biological or chemical material introduced into the run, including RNA-POOL-22, CELL-LINE-Hela, BLOOD-DRAW-A1, and REACTANT-SOL-4. This triad of identifier, execution reference, and input material establishes the provenance chain required for auditability and chain-of-custody compliance.

**t_labrun_min_one_sample**

| id | labrun | input_sample |
| --- | --- | --- |
| SAMP-0001 | SEQ-EXP-99 | RNA-POOL-22 |
| SAMP-0002 | PROTOCOL-V3 | CELL-LINE-Hela |
| SAMP-0003 | CEL-SEQR-112 | BLOOD-DRAW-A1 |
| SAMP-0004 | CEL-SEQR-112 | REACTANT-SOL-4 |
| SAMP-0005 | PCR-CYCLE-44 | DNA-EXTRACT-77 |
| SAMP-0006 | METAB-ASSAY-Q2 | SOIL-SUB-09 |

**Attribute Schema and Typed Values**

The attribute definitions for each sample run are catalogued in `t_labrun_min_one_sample_attr`, where `attr_name` specifies the property—duration_seconds, end_time, exit_code, host_name—and `attr_type` declares its semantic type using XML Schema datatypes: xsd:decimal, xsd:dateTime, xsd:integer, and xsd:string respectively. Values are stored in a type-disaggregated schema across four dedicated value tables. Decimal attributes such as duration_seconds hold measurements like 2021.10, 4946.17, 5150.87, and 3275.26; datetime attributes record timestamps including 2024-08-01T16:02:07, 2024-02-12T19:03:44, 2023-01-19T08:28:14, and 2024-05-12T21:48:01; integer attributes capture exit codes or status indicators such as 230, 435, 670, and 129; and varchar attributes store free-text descriptors like edge-03, Log Level 02, closeout, and complete. The `entity_id` column in each value table links the stored value back to the originating sample run, while `attr_id` references the corresponding attribute definition, forming a normalized entity-attribute-value relationship that enforces type safety at query time.

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

**Mass Function Normalization Registry**

A parallel registry, `t_mass_function_with_normalization`, governs calibration and normalization constants applied to laboratory measurements. Each entry carries an identifier (NORM-0001 through NORM-0004), a `mass` designation identifying the physical component or batch—Rotor-Assembly-M, Batch-7721, Core-Segment-12, Dust-Collection-1—and a `normalization_constant` specifying the correction factor, such as Offset-0.02 or 0.982-scaling. The attribute schema (`t_mass_function_with_normalization_attr`) defines properties including confidence, dimension_kind, method, and recorded_at, typed as xsd:decimal, xsd:string, xsd:string, and xsd:dateTime. Normalization values are similarly disaggregated: decimal confidence scores include 0.715, 279.33, 243.08, and 0.608; datetime records capture measurement timestamps like 2024-12-04T17:58:43, 2023-02-03T12:29:30, 2024-03-08T15:41:30, and 2023-01-16T04:53:31; and varchar attributes encode dimension kinds (Dimension Kind 01), encoding schemes (Encoding 02), report types (nightly summary), and locale codes (ja).

**t_mass_function_with_normalization**

| id | mass | normalization_constant |
| --- | --- | --- |
| NORM-0001 | Rotor-Assembly-M | Offset-0.02 |
| NORM-0002 | Batch-7721 | 0.982-scaling |
| NORM-0003 | Core-Segment-12 | 0.982-scaling |
| NORM-0004 | Dust-Collection-1 | Offset-0.02 |
| NORM-0005 | Powder-Grade-B | Baseline-0.75 |
| NORM-0006 | Rotor-Assembly-M | 0.982-scaling |

**t_mass_function_with_normalization_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| NORM-0001 | confidence | xsd:decimal |
| NORM-0002 | dimension_kind | xsd:string |
| NORM-0003 | method | xsd:string |
| NORM-0004 | recorded_at | xsd:dateTime |
| NORM-0005 | uncertainty | xsd:decimal |
| NORM-0006 | unit | xsd:string |
| NORM-0007 | value | xsd:decimal |
| NORM-0008 | encoding | xsd:string |

**t_mass_function_with_normalization_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| NORM-0001 | NORM-0001 | NORM-0004 | 2024-12-04T17:58:43 |
| NORM-0002 | NORM-0002 | NORM-0004 | 2023-02-03T12:29:30 |
| NORM-0003 | NORM-0003 | NORM-0004 | 2024-03-08T15:41:30 |
| NORM-0004 | NORM-0004 | NORM-0004 | 2023-01-16T04:53:31 |
| NORM-0005 | NORM-0005 | NORM-0004 | 2023-05-04T19:41:54 |
| NORM-0006 | NORM-0006 | NORM-0004 | 2025-01-09T01:34:48 |

**t_mass_function_with_normalization_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| NORM-0001 | NORM-0001 | NORM-0001 | 0.715 |
| NORM-0002 | NORM-0001 | NORM-0005 | 279.33 |
| NORM-0003 | NORM-0001 | NORM-0007 | 243.08 |
| NORM-0004 | NORM-0002 | NORM-0001 | 0.608 |
| NORM-0005 | NORM-0002 | NORM-0005 | 643.66 |
| NORM-0006 | NORM-0002 | NORM-0007 | 319.15 |
| NORM-0007 | NORM-0003 | NORM-0001 | 0.596 |
| NORM-0008 | NORM-0003 | NORM-0005 | 676.31 |

**t_mass_function_with_normalization_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| NORM-0001 | NORM-0001 | NORM-0002 | Dimension Kind 01 |
| NORM-0002 | NORM-0001 | NORM-0008 | Encoding 02 |
| NORM-0003 | NORM-0001 | NORM-0009 | nightly summary |
| NORM-0004 | NORM-0001 | NORM-0010 | ja |
| NORM-0005 | NORM-0001 | NORM-0003 | manual |
| NORM-0006 | NORM-0001 | NORM-0006 | count |
| NORM-0007 | NORM-0002 | NORM-0002 | Dimension Kind 07 |
| NORM-0008 | NORM-0002 | NORM-0008 | Encoding 08 |

**Radicalization Process and Affiliated Organization Tracking**

The `t_radicalization_process` table documents structured radicalization processes and their associated participating organizations. Each process record carries an identifier (PROC-0001 through PROC-0004), a `radicalization_process` name describing the phase or vector—Militia Formation Phase, Network Recruit Wave, Radicalization Vector Delta—and a `has_participant` field identifying the affiliated organization involved, including Sympathizer Network Alpha, Al-Shabaab Recruitment Cell, and Regional Coordination Cell. The same entity-attribute-value pattern applies: attributes are defined with typed schemas, and their values are stored across type-specific tables linked by `entity_id` and `attr_id`, ensuring that organizational participation records maintain the same audit trail rigor as laboratory sample and normalization data.

**t_radicalization_process**

| id | radicalization_process | has_participant |
| --- | --- | --- |
| PROC-0001 | Militia Formation Phase | Sympathizer Network Alpha |
| PROC-0002 | Network Recruit Wave | Al-Shabaab Recruitment Cell |
| PROC-0003 | Radicalization Vector Delta | Regional Coordination Cell |
| PROC-0004 | Network Recruit Wave | Sympathizer Network Alpha |
| PROC-0005 | Ideological Shift Cycle | Militia Training Outpost |
| PROC-0006 | Radicalization Vector Delta | Ideological Mentorship Program |