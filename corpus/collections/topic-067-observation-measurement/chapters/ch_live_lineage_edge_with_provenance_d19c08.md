---
chapter_id: ch_live_lineage_edge_with_provenance_d19c08
topic_id: 67
family: 05_provo_lineage
cited_terms: ['lineage_edge_with_provenance', 'labrun_min_one_sample', 'outlier_claim_supported_by']
model: engine-refine
---

Within the provenance and lineage tracking architecture, each data asset is anchored by a unique identifier—such as PROV-0001 or SAMP-0001—that serves as the immutable reference point across all relational tables. These identifiers propagate through the lineage edge graph, where each edge records a transformation or handoff between systems; the edge identified as PROV-0001, for instance, documents a log-rotation-archival process routed through the Audit-Trail-Service, while PROV-0003 captures a sensor-calibration-pipeline mediated by the Edge-Gateway-Router. The label text associated with these edges—nightly summary for the first three edges, calibration record for the fourth—provides human-readable context for automated lineage records, enabling operators to correlate machine-tracked data flows with operational intent. The supported-by dimension further enriches this provenance model: each outlier fact references a supporting entity through a foreign key (SUPP-0006, SUPP-0002, SUPP-0001, SUPP-0003) that resolves to a category and label in the supporting dimension table, where categories range from Supported By Category 01 through Supported By Category 04 and labels follow the pattern Supported By Label 01 through Supported By Label 04.

**t_lineage_edge_with_provenance**

| id | lineage | with_provenance | encoding | label_text |
| --- | --- | --- | --- | --- |
| PROV-0001 | log-rotation-archival | Audit-Trail-Service | utf8 | nightly summary |
| PROV-0002 | climate-model-updates | Edge-Gateway-Router | unicode | nightly summary |
| PROV-0003 | sensor-calibration-pipeline | Edge-Gateway-Router | utf8 | nightly summary |
| PROV-0004 | financial-reconciliation-run | Regulatory-Reporting-API | ascii | calibration record |
| PROV-0005 | batch-ingestion-v4 | Regulatory-Reporting-API | ascii | audit excerpt |
| PROV-0006 | telemetry-aggregation-flow | Field-Sensor-Array | unicode | audit excerpt |
| PROV-0007 | climate-model-updates | Primary-Database-Cluster | ascii | change rationale |
| PROV-0008 | log-rotation-archival | AWS-S3-source-bucket | latin1 | change rationale |

**dim_supported_by**

| id | supported_by_label | supported_by_category |
| --- | --- | --- |
| SUPP-0001 | Supported By Label 01 | Supported By Category 01 |
| SUPP-0002 | Supported By Label 02 | Supported By Category 02 |
| SUPP-0003 | Supported By Label 03 | Supported By Category 03 |
| SUPP-0004 | Supported By Label 04 | Supported By Category 04 |
| SUPP-0005 | Supported By Label 05 | Supported By Category 05 |
| SUPP-0006 | Supported By Label 06 | Supported By Category 06 |

Attribute metadata is formalized through a two-tier schema that separates attribute definitions from their typed values. The attribute definition table enumerates property names—duration_seconds, end_time, exit_code, host_name—each bound to an XSD type (xsd:decimal, xsd:dateTime, xsd:integer, xsd:string) that constrains the permissible value domain. This type discipline is enforced at the storage layer by partitioning values into four value tables keyed by their XSD type: datetime values such as 2024-08-01T16:02:07 and 2024-02-12T19:03:44 reside in the datetime table, decimal values including 2021.10, 4946.17, 5150.87, and 3275.26 in the decimal table, integer values like 230, 435, 670, and 129 in the integer table, and string values such as edge-03, Log Level 02, closeout, and complete in the varchar table. Each value row carries an entity identifier (SAMP-0001, SAMP-0002) and an attribute identifier (SAMP-001 through SAMP-0010) that together form the composite foreign key linking back to the attribute definition, ensuring that every stored value is semantically typed and entity-scoped.

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

The encoding dimension governs character representation across the lineage edge table, where values of utf8, unicode, utf8, and ascii are recorded for the four edges respectively, reflecting the character set requirements of the originating systems—Audit-Trail-Service, Edge-Gateway-Router, and Regulatory-Reporting-API. This encoding metadata is critical for downstream interoperability, as it signals how label text and other string-valued provenance fields should be interpreted when consumed by heterogeneous systems. The labrun-to-sample association table bridges experimental workflows to their input materials, mapping laboratory run identifiers such as SEQ-EXP-99, PROTOCOL-V3, and CEL-SEQR-112 to input samples including RNA-POOL-22, CELL-LINE-Hela, BLOOD-DRAW-A1, and REACTANT-SOL-4, thereby establishing the material provenance chain that underpins reproducibility in experimental science.

**t_labrun_min_one_sample**

| id | labrun | input_sample |
| --- | --- | --- |
| SAMP-0001 | SEQ-EXP-99 | RNA-POOL-22 |
| SAMP-0002 | PROTOCOL-V3 | CELL-LINE-Hela |
| SAMP-0003 | CEL-SEQR-112 | BLOOD-DRAW-A1 |
| SAMP-0004 | CEL-SEQR-112 | REACTANT-SOL-4 |
| SAMP-0005 | PCR-CYCLE-44 | DNA-EXTRACT-77 |
| SAMP-0006 | METAB-ASSAY-Q2 | SOIL-SUB-09 |

Confidence and uncertainty form a paired quality metric in the outlier fact table, where each fact carries a confidence score—0.877, 0.147, 0.792, 0.479—and a corresponding uncertainty magnitude—516.58, 368.22, 10.24, 719.33—alongside a measured value (453.93, 510.05, 369.89, 757.32). The inverse relationship between confidence and uncertainty is evident: the fact with the highest confidence (0.877) exhibits moderate uncertainty (516.58), while the fact with the lowest confidence (0.147) shows substantial uncertainty (368.22), and the fact with the smallest uncertainty (10.24) achieves a confidence of 0.792. These metrics are anchored to the supported-by dimension through the supported_by_key foreign key, meaning that the evidentiary basis for each outlier assessment is itself categorized and labeled, creating a traceable chain from raw measurement through confidence scoring to the supporting evidence category.

**fact_outlier**

| id | supported_by_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| SUPP-0001 | SUPP-0006 | 0.877 | 516.58 | 453.93 |
| SUPP-0002 | SUPP-0002 | 0.147 | 368.22 | 510.05 |
| SUPP-0003 | SUPP-0001 | 0.792 | 10.24 | 369.89 |
| SUPP-0004 | SUPP-0003 | 0.479 | 719.33 | 757.32 |
| SUPP-0005 | SUPP-0003 | 0.986 | 245.64 | 972.07 |
| SUPP-0006 | SUPP-0004 | 0.386 | 5.02 | 16.62 |
| SUPP-0007 | SUPP-0003 | 0.047 | 979.09 | 828.93 |