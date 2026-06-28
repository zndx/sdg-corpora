---
chapter_id: ch_live_labrun_with_protocol_ca61d2
topic_id: 12
family: 02_observation_measurement
cited_terms: ['labrun_with_protocol', 'provenance_agent_signs_audit', 'lineage_describes_transformation']
model: engine-refine
---

In governed laboratory and analytical pipelines, every observable fact must be bound to a durable identifier so that downstream audit, reconciliation, and scientific review can retrieve the same record unambiguously across systems and time. Identifiers such as PROT-0001 and AUDI-0003 function as stable handles: they do not themselves describe biology or chemistry, but they anchor a lab run, a provenance assertion, or a lineage edge to a single canonical row. The entity reference that accompanies each measured value—entity_id PROT-0001 on a duration_seconds observation, or PROT-0002 on an end_time stamp—states which subject the measurement belongs to, separating *what was measured* from *what it was measured on*. Without that binding, typed values would float as anonymous literals; with it, a Nanopore_FC_Nine execution and a MassSpec_LC_MS calibration can each carry distinct attribute sets while sharing a common modeling pattern.

**t_labrun_with_protocol**

| id | labrun | follows_protocol |
| --- | --- | --- |
| PROT-0001 | MassSpec_LC_MS | Microbiome_QIIME2_Pipe |
| PROT-0002 | Nanopore_FC_Nine | SingleCell_Gelbead10x |
| PROT-0003 | Nanopore_FC_Nine | MassSpec_QTOF_Cal |
| PROT-0004 | MassSpec_LC_MS | FlowCytometry_Panel7 |
| PROT-0005 | Microbiome_16S_Seq | Nanopore_Basecall_v2 |
| PROT-0006 | Proteomics_ICP_MS | PCR_ColdStart |

**t_labrun_with_protocol_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| PROT-0001 | duration_seconds | xsd:decimal |
| PROT-0002 | end_time | xsd:dateTime |
| PROT-0003 | exit_code | xsd:integer |
| PROT-0004 | host_name | xsd:string |
| PROT-0005 | log_level | xsd:string |
| PROT-0006 | phase | xsd:string |
| PROT-0007 | retry_count | xsd:integer |
| PROT-0008 | scheduled_at | xsd:dateTime |

An attr names the dimension along which a fact is expressed—duration_seconds, end_time, exit_code, host_name—while attr_type declares the syntactic and semantic contract under which the value must be interpreted. Assignment to xsd:decimal, xsd:dateTime, xsd:integer, or xsd:string is not cosmetic labeling: it governs validation, aggregation, and lawful comparison. A duration_seconds value of 301.25 seconds for PROT-0001 belongs in decimal storage; an end_time of 2023-11-19T15:13:31 belongs in datetime storage; exit_code 497 and retry-adjacent integer facts belong with integers; host_name node-b14 and operational states such as closeout or running belong with strings. Partitioning values by type prevents category errors—treating a timestamp as a number, or a hostname as a duration—and enables policy engines to apply the correct tolerances, units, and retention rules per attribute.

The misc field, in this architecture, carries the payload once typing and linkage are resolved: the literal 6125.88, the label Provenance Label 03, or the lineage scalar 903.86. Misc is deliberately generic at the storage layer because governance metadata is heterogeneous; discipline is imposed upstream through attr, attr_type, and the entity–attr pairing. Duration_seconds merits explicit treatment because it appears both as a first-class lab-run attribute (4042.33 on PROT-0002, 1565.69 on PROT-0004) and as a provenance fact (2601.59 under AUDI-0001, 6949.35 under AUDI-0007), illustrating how the same conceptual measure can serve operational telemetry and audit analytics. Exit codes—256, 728, 452, 985 in the provenance fact set, and 497 or 434 at the protocol-attribute layer—encode process termination semantics; they matter because compliance review often hinges on whether a pipeline completed cleanly, failed deterministically, or exited with a code requiring human triage before results enter a regulated dossier.

**t_labrun_with_protocol_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PROT-0001 | PROT-0001 | PROT-0002 | 2023-11-19T15:13:31 |
| PROT-0002 | PROT-0001 | PROT-0008 | 2023-04-19T03:43:36 |
| PROT-0003 | PROT-0001 | PROT-0009 | 2023-06-05T09:50:58 |
| PROT-0004 | PROT-0002 | PROT-0002 | 2023-12-21T19:08:32 |
| PROT-0005 | PROT-0002 | PROT-0008 | 2023-06-26T20:13:34 |
| PROT-0006 | PROT-0002 | PROT-0009 | 2023-11-18T07:40:33 |
| PROT-0007 | PROT-0003 | PROT-0002 | 2024-09-05T03:02:45 |
| PROT-0008 | PROT-0003 | PROT-0008 | 2024-06-07T02:35:38 |

**t_labrun_with_protocol_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PROT-0001 | PROT-0001 | PROT-0001 | 301.25 |
| PROT-0002 | PROT-0002 | PROT-0001 | 4042.33 |
| PROT-0003 | PROT-0003 | PROT-0001 | 6125.88 |
| PROT-0004 | PROT-0004 | PROT-0001 | 1565.69 |
| PROT-0005 | PROT-0005 | PROT-0001 | 1033.06 |
| PROT-0006 | PROT-0006 | PROT-0001 | 3134.56 |

**t_labrun_with_protocol_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PROT-0001 | PROT-0001 | PROT-0003 | 497 |
| PROT-0002 | PROT-0001 | PROT-0007 | 434 |
| PROT-0003 | PROT-0002 | PROT-0003 | 538 |
| PROT-0004 | PROT-0002 | PROT-0007 | 309 |
| PROT-0005 | PROT-0003 | PROT-0003 | 513 |
| PROT-0006 | PROT-0003 | PROT-0007 | 375 |
| PROT-0007 | PROT-0004 | PROT-0003 | 355 |
| PROT-0008 | PROT-0004 | PROT-0007 | 171 |

**t_labrun_with_protocol_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PROT-0001 | PROT-0001 | PROT-0004 | node-b14 |
| PROT-0002 | PROT-0001 | PROT-0005 | Log Level 02 |
| PROT-0003 | PROT-0001 | PROT-0006 | closeout |
| PROT-0004 | PROT-0001 | PROT-0010 | running |
| PROT-0005 | PROT-0001 | PROT-0011 | Triggered By 05 |
| PROT-0006 | PROT-0002 | PROT-0004 | worker-07 |
| PROT-0007 | PROT-0002 | PROT-0005 | Log Level 07 |
| PROT-0008 | PROT-0002 | PROT-0006 | review |

Provenance records where a fact originated, through which instrument or workflow pass it was produced, and under what controlled conditions it may be cited. Provenance_key AUDI-0007 appears on more than one fact row, showing that a single provenance dimension can classify multiple executions while dim_provenance supplies human-readable misc labels and category taxonomies—Provenance Category 01 through Provenance Category 04—that roll detailed events into reportable groupings for quality management and external disclosure. Retry_count (196, 304, 410, 23) extends that story: high retry counts signal instability, resource contention, or parameter drift that must be disclosed alongside the final exit and duration, because a nominally successful run that required hundreds of retries is not equivalent, for risk purposes, to one that completed on the first attempt.

Lineage addresses a complementary question—not *where* a value was captured, but *how* it was derived, transformed, or propagated across steps. Lineage_key TRAN-0003 recurs across fact_lineage rows with different confidence scores (0.071 versus 0.779), demonstrating that lineage is an asserted relationship whose strength varies by evidence. Confidence quantifies belief in the linkage; paired uncertainty (133.03, 708.23) and misc values (832.18, 259.55) allow reviewers to distinguish high-trust derivations from weak inferences before those derivations feed regulated conclusions. Dim_lineage categories (Lineage Category 01–04) provide the same classificatory function provenance categories provide for origin: they organize transformation types—merges, normalizations, instrument cross-walks—into structures auditors can sample and executives can summarize.

**fact_lineage**

| id | lineage_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| TRAN-0001 | TRAN-0001 | 0.645 | 612.22 | 903.86 |
| TRAN-0002 | TRAN-0003 | 0.071 | 133.03 | 832.18 |
| TRAN-0003 | TRAN-0005 | 0.404 | 76.69 | 862.00 |
| TRAN-0004 | TRAN-0003 | 0.779 | 708.23 | 259.55 |
| TRAN-0005 | TRAN-0003 | 0.376 | 801.99 | 986.33 |
| TRAN-0006 | TRAN-0008 | 0.744 | 956.79 | 34.40 |

Category, taken together with identifier, entity, attr, and attr_type, completes the governance lattice: identifiers stabilize rows, entities attach values to runs or assets, attributes and types define measurable contracts, misc holds the evidence, provenance and lineage supply causal graphs, duration_seconds and exit encode operational outcome, retry_count exposes process fragility, and confidence calibrates trust in derived links. A Microbiome_QIIME2_Pipe execution on MassSpec_LC_MS infrastructure and a FlowCytometry_Panel7 closeout on node-b14 thus become not isolated log lines but interoperable facts—each typed, each tied to PROT-0001 or PROT-0002, each classifiable under provenance and lineage dimensions—suitable for handbook enforcement, deviation investigation, and reproducibility demonstration under formal quality systems.

**fact_provenance**

| id | provenance_key | duration_seconds | exit_code | retry_count |
| --- | --- | --- | --- | --- |
| AUDI-0001 | AUDI-0003 | 2601.59 | 256 | 196 |
| AUDI-0002 | AUDI-0007 | 4921.58 | 728 | 304 |
| AUDI-0003 | AUDI-0008 | 2216.74 | 452 | 410 |
| AUDI-0004 | AUDI-0007 | 6949.35 | 985 | 23 |

**dim_provenance**

| id | provenance_label | provenance_category |
| --- | --- | --- |
| AUDI-0001 | Provenance Label 01 | Provenance Category 01 |
| AUDI-0002 | Provenance Label 02 | Provenance Category 02 |
| AUDI-0003 | Provenance Label 03 | Provenance Category 03 |
| AUDI-0004 | Provenance Label 04 | Provenance Category 04 |
| AUDI-0005 | Provenance Label 05 | Provenance Category 05 |
| AUDI-0006 | Provenance Label 06 | Provenance Category 06 |
| AUDI-0007 | Provenance Label 07 | Provenance Category 07 |
| AUDI-0008 | Provenance Label 08 | Provenance Category 08 |

**dim_lineage**

| id | lineage_label | lineage_category |
| --- | --- | --- |
| TRAN-0001 | Lineage Label 01 | Lineage Category 01 |
| TRAN-0002 | Lineage Label 02 | Lineage Category 02 |
| TRAN-0003 | Lineage Label 03 | Lineage Category 03 |
| TRAN-0004 | Lineage Label 04 | Lineage Category 04 |
| TRAN-0005 | Lineage Label 05 | Lineage Category 05 |
| TRAN-0006 | Lineage Label 06 | Lineage Category 06 |
| TRAN-0007 | Lineage Label 07 | Lineage Category 07 |
| TRAN-0008 | Lineage Label 08 | Lineage Category 08 |