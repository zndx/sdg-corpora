---
chapter_id: ch_live_lineage_edge_with_confidence_8805f9
topic_id: 60
family: 05_provo_lineage
cited_terms: ['lineage_edge_with_confidence', 'lineage_edge_with_provenance', 'lineage_edge_within_dataset_only']
model: engine-refine
---

Lineage edges are captured with a precision that demands both temporal anchoring and measurement context: each edge carries an identifier such as CONF-0001 or PROV-0002, a timestamp like 2024-07-21T21:36:51 or 2023-02-17T19:37:00, and a unit of measure—deg_C, mg/L, ratio, or nm—that grounds the observation in a physical or abstract scale. The lineage field itself names the domain of the relationship, whether geospatial_raster_processing, customer_transactions_raw, ml_training_dataset_prep, patient-cohort-extraction, or compliance_audit_trail, thereby situating the edge within a recognizable operational context. Confidence is recorded not merely as a scalar but as a qualitative descriptor—partial_match, statistical_overlap, 95_percent—allowing downstream consumers to distinguish between heuristic associations and statistically grounded linkages. This dual encoding of confidence, both as a categorical assessment and as a numeric probability, reflects the reality that lineage provenance spans from approximate heuristic matching to rigorously quantified overlap, and that both forms must coexist in a single tracking substrate.

**t_lineage_edge_with_confidence**

| id | lineage | confidence | recorded_at | unit |
| --- | --- | --- | --- | --- |
| CONF-0001 | geospatial_raster_processing | partial_match | 2024-07-21T21:36:51 | deg_C |
| CONF-0002 | customer_transactions_raw | statistical_overlap | 2025-03-12T13:46:59 | mg/L |
| CONF-0003 | customer_transactions_raw | 95_percent | 2023-02-17T19:37:00 | ratio |
| CONF-0004 | compliance_audit_trail | 95_percent | 2024-01-06T01:59:57 | nm |
| CONF-0005 | etl_sales_daily | partial_match | 2025-01-27T14:57:11 | deg_C |
| CONF-0006 | inventory_reconciliation_flow | high | 2023-11-04T09:37:36 | nm |

**t_lineage_edge_with_provenance**

| id | lineage | with_provenance | encoding | label_text |
| --- | --- | --- | --- | --- |
| PROV-0001 | geospatial_raster_processing | Audit-Trail-Service | utf8 | nightly summary |
| PROV-0002 | ml_training_dataset_prep | Edge-Gateway-Router | unicode | nightly summary |
| PROV-0003 | patient-cohort-extraction | Edge-Gateway-Router | utf8 | nightly summary |
| PROV-0004 | compliance_audit_trail | Regulatory-Reporting-API | ascii | calibration record |
| PROV-0005 | inventory-sync-workflow | Regulatory-Reporting-API | ascii | audit excerpt |
| PROV-0006 | sensor_stream_ingestion | Field-Sensor-Array | unicode | audit excerpt |
| PROV-0007 | etl_sales_daily | Primary-Database-Cluster | ascii | change rationale |
| PROV-0008 | geospatial_raster_processing | AWS-S3-source-bucket | latin1 | change rationale |

Provenance information is captured alongside the lineage edge through a parallel register that records the service or gateway responsible for the observation: Audit-Trail-Service, Edge-Gateway-Router, or Regulatory-Reporting-API. The encoding field—utf8, unicode, ascii—documents the character encoding under which the associated label was stored, a detail that may appear incidental but is essential for systems that must reconstruct or migrate label_text values such as nightly summary or calibration record across heterogeneous data pipelines. The label_text column itself provides a human-readable annotation for the edge, and while values like nightly summary recur across multiple identifiers, the combination of identifier, provenance service, encoding, and label_text forms a composite key that is unique within the provenance register. This design acknowledges that the same descriptive label may apply to distinct lineage edges, and that disambiguation requires the full set of contextual attributes rather than the label alone.

Within-dataset relationships are modeled through a dimension table that assigns each dataset a category and a human-readable label—Within Dataset Category 01 through 04 paired with Within Dataset Label 01 through 04—while a fact table records the quantitative properties of those relationships. The fact table links each observation to a within_dataset_key, such as ONLY-0003 or ONLY-0006, and provides a confidence score expressed as a continuous probability—0.645, 0.071, 0.404, 0.779—alongside an uncertainty value measured in the same abstract units as the associated misc value, which itself takes on magnitudes ranging from 259.55 to 903.86. The inverse relationship between confidence and uncertainty is evident in the data: the observation with confidence 0.071 carries an uncertainty of 133.03, while the observation with confidence 0.779 carries an uncertainty of 708.23, suggesting that the uncertainty metric captures a different dimension of imprecision—perhaps systematic rather than stochastic—and that both must be reported to enable proper risk assessment.

**fact_lineage**

| id | within_dataset_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| ONLY-0001 | ONLY-0003 | 0.645 | 612.22 | 903.86 |
| ONLY-0002 | ONLY-0004 | 0.071 | 133.03 | 832.18 |
| ONLY-0003 | ONLY-0005 | 0.404 | 76.69 | 862.00 |
| ONLY-0004 | ONLY-0006 | 0.779 | 708.23 | 259.55 |
| ONLY-0005 | ONLY-0001 | 0.376 | 801.99 | 986.33 |
| ONLY-0006 | ONLY-0004 | 0.744 | 956.79 | 34.40 |

**dim_within_dataset**

| id | within_dataset_label | within_dataset_category |
| --- | --- | --- |
| ONLY-0001 | Within Dataset Label 01 | Within Dataset Category 01 |
| ONLY-0002 | Within Dataset Label 02 | Within Dataset Category 02 |
| ONLY-0003 | Within Dataset Label 03 | Within Dataset Category 03 |
| ONLY-0004 | Within Dataset Label 04 | Within Dataset Category 04 |
| ONLY-0005 | Within Dataset Label 05 | Within Dataset Category 05 |
| ONLY-0006 | Within Dataset Label 06 | Within Dataset Category 06 |

The interplay between these tables forms a coherent provenance model in which identifiers serve as the primary linkage mechanism across registers. A lineage edge identified as CONF-0001 in the confidence register may correspond to PROV-0002 in the provenance register, and both may relate to the same underlying dataset relationship captured in the fact and dimension tables under keys such as ONLY-0001 or ONLY-0004. The within_dataset_key in the fact table references entries in the dimension table, creating a foreign-key chain that allows any quantitative observation to be resolved to its categorical classification and label. This structure supports queries that traverse from a numeric confidence score through its dataset category to the provenance service and encoding that produced it, enabling auditors and data engineers to reconstruct the full chain of custody for any lineage assertion. The design reflects a pragmatic understanding that provenance data is inherently multi-faceted: no single table can capture the temporal, categorical, quantitative, and service-level attributes that together constitute a complete lineage record.