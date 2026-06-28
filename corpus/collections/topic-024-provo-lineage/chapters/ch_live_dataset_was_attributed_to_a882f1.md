---
chapter_id: ch_live_dataset_was_attributed_to_a882f1
topic_id: 24
family: 05_provo_lineage
cited_terms: ['dataset_was_attributed_to', 'dataset_was_derived_from', 'dataset_was_generated_by']
model: engine-refine
---

In the architecture of data provenance, the primary identifier serves as the immutable anchor for every asset, much as the attribution key ATTR-0001 establishes a definitive lineage for a specific dataset instance. These identifiers, ranging from the attribution sequences such as ATTR-0002 and ATTR-0003 to the derivation codes FROM-0001 and the generation markers GENE-0001, form the foundational registry of the enterprise. Alongside these keys, the physical and logical state of the data is meticulously cataloged; a dataset may occupy a substantial footprint, quantified precisely at 676,110,880 bytes, while simultaneously bearing a version stamp of 10, indicating a mature iteration distinct from earlier releases such as version 2 or version 5. This triad of identifier, size bytes, and version ensures that every asset is not only locatable but also traceable through its lifecycle, providing the necessary granularity for compliance audits and operational oversight.

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

**t_dataset_was_derived_from**

| id | dataset |
| --- | --- |
| FROM-0001 | weather_satellite_raw |
| FROM-0002 | satellite-imagery-stack |
| FROM-0003 | financial-trades-db |
| FROM-0004 | satellite-imagery-stack |
| FROM-0005 | gene_expression_panel |
| FROM-0006 | transaction_ledger_q4 |

**t_dataset_was_derived_from_was_derived_from**

| id | was_derived_from |
| --- | --- |
| FROM-0001 | edge-compute-node |
| FROM-0002 | laboratory_specimen_data |
| FROM-0003 | data-lake-loader |
| FROM-0004 | data-lake-loader |
| FROM-0005 | spark-etl-pipeline |
| FROM-0006 | data-lake-loader |
| FROM-0007 | spark-etl-pipeline |
| FROM-0008 | external_credit_bureau |

**t_dataset_was_generated_by**

| id | dataset |
| --- | --- |
| GENE-0001 | network_traffic_capture |
| GENE-0002 | supply-chain-manifest |
| GENE-0003 | weather_satellite_raw |
| GENE-0004 | lab-culture-growth |
| GENE-0005 | weather_satellite_raw |
| GENE-0006 | market_index_history |
| GENE-0007 | customer_churn_v2 |
| GENE-0008 | iot_edge_logs |

**t_dataset_was_generated_by_was_generated_by**

| id | was_generated_by |
| --- | --- |
| GENE-0001 | regulatory_filing_pdf |
| GENE-0002 | ml-training-runner |
| GENE-0003 | spark-etl-pipeline |
| GENE-0004 | batch_ingest_2022 |
| GENE-0005 | observatory_feed |
| GENE-0006 | legacy_mysql_dump |

The attribution framework operates through a dimensional mapping that classifies the origin and context of each record. The column `was attributed to` links the factual dataset to its broader categorical and miscellaneous descriptors, ensuring that an entry keyed as ATTR-0004 is not merely a numerical reference but is semantically bound to its corresponding label and category. For instance, the attribution key ATTR-0003 may resolve to a specific miscellaneous label, such as "Was Attributed To Label 03," nested within the structural hierarchy of "Was Attributed To Category 03." This relational binding prevents orphaned records and guarantees that every attribution is grounded in a standardized taxonomy, allowing governance bodies to trace data back to its originating category with absolute precision.

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

The lineage of data transformation is captured through the rigorous definition of subject and target relationships within the derivation junction tables. Here, the subject column identifies the originating dataset—such as the record FROM-0002, which represents the `weather_satellite_raw` asset—while the target column designates the downstream entity, in this case, FROM-0004, corresponding to the `edge-compute-node`. The nature of this transformation is further qualified by the role attribute, which explicitly defines the operational relationship; a record may assume the role of "contributor" when linking FROM-0002 to FROM-0004, or the role of "owner" when establishing the lineage of FROM-0001 to FROM-0002. This explicit role assignment ensures that the provenance graph accurately reflects not just the flow of data, but the specific functional capacity of each node within the derivation chain.

**t_dataset_was_derived_from__was_derived_from**

| id | dataset_id | was_derived_from_id | role |
| --- | --- | --- | --- |
| FROM-0001 | FROM-0002 | FROM-0004 | contributor |
| FROM-0002 | FROM-0001 | FROM-0001 | contributor |
| FROM-0003 | FROM-0005 | FROM-0006 | contributor |
| FROM-0004 | FROM-0001 | FROM-0002 | owner |
| FROM-0005 | FROM-0006 | FROM-0006 | owner |
| FROM-0006 | FROM-0003 | FROM-0008 | owner |
| FROM-0007 | FROM-0006 | FROM-0005 | reviewer |
| FROM-0008 | FROM-0004 | FROM-0005 | contributor |

**t_dataset_was_generated_by__was_generated_by**

| id | dataset_id | was_generated_by_id | role |
| --- | --- | --- | --- |
| GENE-0001 | GENE-0003 | GENE-0002 | observer |
| GENE-0002 | GENE-0001 | GENE-0002 | contributor |
| GENE-0003 | GENE-0003 | GENE-0003 | contributor |
| GENE-0004 | GENE-0005 | GENE-0001 | contributor |
| GENE-0005 | GENE-0004 | GENE-0003 | observer |
| GENE-0006 | GENE-0005 | GENE-0004 | reviewer |
| GENE-0007 | GENE-0002 | GENE-0002 | reviewer |
| GENE-0008 | GENE-0007 | GENE-0006 | observer |

Similarly, the generation framework documents the immediate creation events that bring datasets into existence, utilizing the same structural rigor of subject and target mapping. A dataset identified as GENE-0003, representing the `network_traffic_capture`, is linked via the subject column to its generation target, GENE-0002, which corresponds to the `regulatory_filing_pdf` generator. The role column in this context delineates the interaction, assigning the status of "observer" or "contributor" to the respective entities. Whether the target is the `spark-etl-pipeline` associated with GENE-0003 or the `batch_ingest_2022` process linked to GENE-0004, the explicit declaration of roles such as "contributor" or "observer" provides an auditable trail of accountability, ensuring that every generation event is fully documented and its participants clearly defined within the governance framework.