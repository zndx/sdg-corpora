---
chapter_id: ch_live_dataset_was_attributed_to_cde2b1
topic_id: 142
family: 05_provo_lineage
cited_terms: ['dataset_was_attributed_to', 'lineage_edge_via_transformation', 'descriptive_either_evidence_or_claim']
model: engine-refine
---

The provenance of any dataset rests upon a chain of attribution that must be both traceable and verifiable. Each dataset record carries an identifier—ATTR-0001 through ATTR-0004 in the observed corpus—and is linked via a foreign key to a dimension table that resolves the attribution into a human-readable label and a categorical classification. The labels, such as "Was Attributed To Label 01" through "Was Attributed To Label 04," are paired with corresponding categories—"Was Attributed To Category 01" through "Was Attributed To Category 04"—providing a two-tier taxonomy that separates the named source from its organizational or functional grouping. This separation allows downstream systems to query by category for governance purposes while preserving the specific attribution for audit trails. The datasets themselves vary considerably in scale, ranging from 31,504,133 bytes to 676,110,880 bytes, and are versioned from 2 through 10, indicating that the same attribution may apply to multiple revisions of a dataset over its lifecycle.

**fact_dataset**

| id | was_attributed_to_key | size_bytes | version |
| --- | --- | --- | --- |
| ATTR-0001 | ATTR-0004 | 350697080 | 10 |
| ATTR-0002 | ATTR-0003 | 501391865 | 2 |
| ATTR-0003 | ATTR-0006 | 31504133 | 5 |
| ATTR-0004 | ATTR-0003 | 676110880 | 5 |
| ATTR-0005 | ATTR-0005 | 632357991 | 7 |
| ATTR-0006 | ATTR-0002 | 81640033 | 1 |
| ATTR-0007 | ATTR-0005 | 351254327 | 12 |
| ATTR-0008 | ATTR-0001 | 94866870 | 11 |

**dim_was_attributed_to**

| id | was_attributed_to_label | was_attributed_to_category |
| --- | --- | --- |
| ATTR-0001 | Was Attributed To Label 01 | Was Attributed To Category 01 |
| ATTR-0002 | Was Attributed To Label 02 | Was Attributed To Category 02 |
| ATTR-0003 | Was Attributed To Label 03 | Was Attributed To Category 03 |
| ATTR-0004 | Was Attributed To Label 04 | Was Attributed To Category 04 |
| ATTR-0005 | Was Attributed To Label 05 | Was Attributed To Category 05 |
| ATTR-0006 | Was Attributed To Label 06 | Was Attributed To Category 06 |
| ATTR-0007 | Was Attributed To Label 07 | Was Attributed To Category 07 |
| ATTR-0008 | Was Attributed To Label 08 | Was Attributed To Category 08 |

Attribution alone is insufficient without a mechanism for quantifying the reliability of the lineage that produced a given artifact. The lineage edge table captures this through paired measures of confidence and uncertainty, where confidence values such as 0.439, 0.111, 0.554, and 0.532 express the degree of assurance that a transformation—whether a Genomic Variant Catalog, a Clinical Trial Registry, or a Financial Risk Pipeline—correctly produced the downstream entity. These confidence scores are inversely accompanied by uncertainty magnitudes ranging from 350.43 to 878.86, providing a complementary metric that captures the absolute dispersion or error bound associated with the transformation. The lineage itself is labeled with operational descriptions such as "Inventory Reconciliation" and "Patient Cohort Extraction," anchoring the abstract confidence-uncertainty pair to a concrete data engineering activity.

**t_lineage_edge_via_transformation**

| id | lineage | via_transformation | confidence | uncertainty |
| --- | --- | --- | --- | --- |
| TRAN-0001 | Inventory Reconciliation | Genomic Variant Catalog | 0.439 | 766.93 |
| TRAN-0002 | Patient Cohort Extraction | Clinical Trial Registry | 0.111 | 650.52 |
| TRAN-0003 | Timezone Normalization | Financial Risk Pipeline | 0.554 | 878.86 |
| TRAN-0004 | Inventory Reconciliation | Genomic Variant Catalog | 0.532 | 350.43 |
| TRAN-0005 | Schema Migration | SQL Join Aggregation | 0.034 | 365.80 |
| TRAN-0006 | Schema Migration | SQL Join Aggregation | 0.440 | 497.03 |

Descriptive evidence and claims are modeled through a separate entity-attribute-value structure that decouples the metadata schema from the data values themselves. The attribute definition table assigns each attribute a name—confidence, dimension_kind, method, recorded_at—and an associated XML Schema Definition type, including xsd:decimal, xsd:string, and xsd:dateTime. This type annotation determines which value table receives the actual data: decimal values such as 0.015, 195.73, and 92.51 are stored in the decimal value table, string values like "Dimension Kind 01," "Encoding 02," and "change rationale" reside in the varchar value table, and timestamped observations such as 2023-12-14T23:50:57 and 2024-02-16T02:04:00 are persisted in the datetime value table. The entity column in each value table references the claim or evidence record, while the attribute column points back to the attribute definition, forming a normalized triple that supports arbitrary attribute expansion without schema modification.

**t_descriptive_either_evidence_or_claim**

| id | descriptive | descriptive_2 | descriptive_3 |
| --- | --- | --- | --- |
| CLAI-0001 | pipeline run log | checksum mismatch alert | validation rule set |
| CLAI-0002 | compliance audit trail | field condition note | validation rule set |
| CLAI-0003 | network latency trace | calibration certificate | chain of custody tag |
| CLAI-0004 | pipeline run log | data quality flag | sampling interval ms |
| CLAI-0005 | data ingestion manifest | retention policy label | retention expiry date |
| CLAI-0006 | compliance audit trail | data quality flag | hash algorithm ID |

**t_descriptive_either_evidence_or_claim_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| CLAI-0001 | confidence | xsd:decimal |
| CLAI-0002 | dimension_kind | xsd:string |
| CLAI-0003 | method | xsd:string |
| CLAI-0004 | recorded_at | xsd:dateTime |
| CLAI-0005 | uncertainty | xsd:decimal |
| CLAI-0006 | unit | xsd:string |
| CLAI-0007 | value | xsd:decimal |
| CLAI-0008 | encoding | xsd:string |

**t_descriptive_either_evidence_or_claim_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CLAI-0001 | CLAI-0001 | CLAI-0004 | 2023-12-14T23:50:57 |
| CLAI-0002 | CLAI-0002 | CLAI-0004 | 2024-02-16T02:04:00 |
| CLAI-0003 | CLAI-0003 | CLAI-0004 | 2024-04-20T14:09:40 |
| CLAI-0004 | CLAI-0004 | CLAI-0004 | 2025-04-28T22:05:41 |
| CLAI-0005 | CLAI-0005 | CLAI-0004 | 2023-01-08T15:26:20 |
| CLAI-0006 | CLAI-0006 | CLAI-0004 | 2023-08-14T20:31:38 |

**t_descriptive_either_evidence_or_claim_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CLAI-0001 | CLAI-0001 | CLAI-0001 | 0.015 |
| CLAI-0002 | CLAI-0001 | CLAI-0005 | 195.73 |
| CLAI-0003 | CLAI-0001 | CLAI-0007 | 92.51 |
| CLAI-0004 | CLAI-0002 | CLAI-0001 | 0.355 |
| CLAI-0005 | CLAI-0002 | CLAI-0005 | 482.72 |
| CLAI-0006 | CLAI-0002 | CLAI-0007 | 420.42 |
| CLAI-0007 | CLAI-0003 | CLAI-0001 | 0.827 |
| CLAI-0008 | CLAI-0003 | CLAI-0005 | 514.52 |

**t_descriptive_either_evidence_or_claim_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CLAI-0001 | CLAI-0001 | CLAI-0002 | Dimension Kind 01 |
| CLAI-0002 | CLAI-0001 | CLAI-0008 | Encoding 02 |
| CLAI-0003 | CLAI-0001 | CLAI-0009 | change rationale |
| CLAI-0004 | CLAI-0001 | CLAI-0010 | es |
| CLAI-0005 | CLAI-0001 | CLAI-0003 | manual |
| CLAI-0006 | CLAI-0001 | CLAI-0006 | deg_C |
| CLAI-0007 | CLAI-0002 | CLAI-0002 | Dimension Kind 07 |
| CLAI-0008 | CLAI-0002 | CLAI-0008 | Encoding 08 |

The descriptive records themselves carry contextual metadata that situates each claim within its operational environment. A single claim identifier may be associated with a pipeline run log, a compliance audit trail, or a network latency trace, and each is further characterized by secondary descriptors such as a checksum mismatch alert, a field condition note, or a calibration certificate. Tertiary attributes add procedural context—a validation rule set, a chain of custody tag, or a sampling interval expressed in milliseconds—creating a multi-dimensional provenance record that captures not only what was observed but under what conditions and with what procedural safeguards. This layered descriptive model ensures that every data point can be traced back through its attribute definitions, its value type, its confidence and uncertainty bounds, and its chain of attribution, forming a complete and auditable provenance graph.