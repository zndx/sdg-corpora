---
chapter_id: ch_live_carbon_credit_transaction_c5fb17
topic_id: 54
family: 08_derived
cited_terms: ['carbon_credit_transaction', 'schemaorg_label_alignment', 'transformation_with_input_dataset']
model: engine-refine
---

Carbon credit transactions form the operational backbone of emissions-offset accounting, each transaction carrying a unique identifier and a traceable carbon credit code that anchors it to a specific registry standard. Transaction TRAN-0001, for instance, corresponds to credit CAR-2023-6677, while TRAN-0002 maps to VCS-TRX-8812 under the Verified Carbon Standard, TRAN-0003 to GS-TRX-8814 under Gold Standard, and TRAN-0004 to ACR-CC-7721 under the American Carbon Registry. These codes are not arbitrary; they encode the governing protocol and serve as the primary reference for auditors verifying that a retirement or transfer corresponds to a legitimate, registry-issued offset. The transaction-to-project derivation table establishes the provenance chain, linking each transaction to its originating project—TRAN-0001 derives from Iceland-Geothermal, TRAN-0002 from Nepal-Afforestation, TRAN-0003 from Brazil-Biochar, and TRAN-0004 from a second Nepal-Afforestation project—ensuring that every credit can be traced back to the physical activity that generated it.

**t_carbon_credit_transaction**

| id | carbon_credit_transaction |
| --- | --- |
| TRAN-0001 | CAR-2023-6677 |
| TRAN-0002 | VCS-TRX-8812 |
| TRAN-0003 | GS-TRX-8814 |
| TRAN-0004 | ACR-CC-7721 |
| TRAN-0005 | CARB-2024-3305 |
| TRAN-0006 | CARB-2024-3305 |

**t_carbon_credit_transaction_derives_from_project**

| id | derives_from_project |
| --- | --- |
| TRAN-0001 | Iceland-Geothermal |
| TRAN-0002 | Nepal-Afforestation |
| TRAN-0003 | Brazil-Biochar |
| TRAN-0004 | Nepal-Afforestation |
| TRAN-0005 | Amazonia-REDD |
| TRAN-0006 | Kerala-Mangrove |

**t_carbon_credit_transaction_transferred_to**

| id | transferred_to |
| --- | --- |
| TRAN-0001 | Norway-Wealth |
| TRAN-0002 | AFK-Environmental |
| TRAN-0003 | Orsted-NetZero |
| TRAN-0004 | Maersk-Offsetting |
| TRAN-0005 | Orsted-NetZero |
| TRAN-0006 | AFK-Environmental |

The relationship between transactions and their source projects is mediated through a junction table that captures not merely the existence of a derivation link but the nature of the association. Within this table, the subject transaction (carbon_id) and the target project (derives_from_project_id) are paired with a role attribute that distinguishes between owner and contributor designations. TRAN-0002, for example, is linked to project TRAN-0005 with the role of owner, whereas TRAN-0006, TRAN-0003, and TRAN-0001 are each linked to the same project TRAN-0005 as contributors. This role distinction is critical for governance: it clarifies which entity holds primary claim over a project's output and which entities participate in its development or verification, a distinction that becomes material in disputes over credit ownership or in the allocation of revenue from credit sales.

**t_carbon_credit_transaction__derives_from_project**

| id | carbon_id | derives_from_project_id | role |
| --- | --- | --- | --- |
| TRAN-0001 | TRAN-0002 | TRAN-0005 | owner |
| TRAN-0002 | TRAN-0006 | TRAN-0003 | contributor |
| TRAN-0003 | TRAN-0003 | TRAN-0005 | contributor |
| TRAN-0004 | TRAN-0001 | TRAN-0005 | contributor |
| TRAN-0005 | TRAN-0002 | TRAN-0002 | contributor |
| TRAN-0006 | TRAN-0004 | TRAN-0003 | contributor |
| TRAN-0007 | TRAN-0003 | TRAN-0003 | owner |
| TRAN-0008 | TRAN-0006 | TRAN-0006 | reviewer |

**t_carbon_credit_transaction__transferred_to**

| id | carbon_id | transferred_to_id | role | cardinality_note |
| --- | --- | --- | --- | --- |
| TRAN-0001 | TRAN-0002 | TRAN-0001 | contributor | Cardinality Note 01 |
| TRAN-0002 | TRAN-0005 | TRAN-0003 | owner | Cardinality Note 02 |
| TRAN-0003 | TRAN-0001 | TRAN-0002 | owner | Cardinality Note 03 |
| TRAN-0004 | TRAN-0006 | TRAN-0003 | observer | Cardinality Note 04 |
| TRAN-0005 | TRAN-0004 | TRAN-0001 | reviewer | Cardinality Note 05 |
| TRAN-0006 | TRAN-0001 | TRAN-0004 | observer | Cardinality Note 06 |
| TRAN-0007 | TRAN-0002 | TRAN-0005 | owner | Cardinality Note 07 |
| TRAN-0008 | TRAN-0002 | TRAN-0006 | observer | Cardinality Note 08 |

Purchasing entities complete the transaction lifecycle by receiving the credits, and the system models this transfer through a parallel junction table that mirrors the project-derivation structure. The direct transfer table records that TRAN-0001 was transferred to Norway-Wealth, TRAN-0002 to AFK-Environmental, TRAN-0003 to Orsted-NetZero, and TRAN-0004 to Maersk-Offsetting—each a distinct corporate or sovereign buyer with its own offsetting strategy. The corresponding relationship table introduces both a role attribute and a cardinality note, adding two further dimensions of metadata. Here, roles include contributor, owner, and observer, with TRAN-0001 and TRAN-0005 each holding owner status in their respective transfers, while TRAN-0006 appears as an observer. The cardinality notes—labeled sequentially from Cardinality Note 01 through Cardinality Note 04—serve as structured annotations that constrain or describe the multiplicity of the transfer relationship, enabling the system to enforce business rules such as one-to-one versus one-to-many transfers without hard-coding constraints in application logic.

Beyond the transactional core, the schema provides a mechanism for aligning internal data labels to the Schema.org vocabulary, a practice essential for interoperability with external registries, data marketplaces, and regulatory reporting frameworks. The alignment table maps internal identifiers such as sku_code, org_id, and data_asset_name to their Schema.org equivalents, with data_asset_name appearing in two separate alignments—one to course_title and another to the Product type—reflecting the context-dependent nature of semantic mapping. Each alignment record carries typed attributes defined in a separate attribute catalog: confidence (xsd:decimal), dimension_kind (xsd:string), method (xsd:string), and recorded_at (xsd:dateTime). These attributes are stored in value tables partitioned by type, ensuring type safety at query time. The confidence attribute, for instance, holds decimal values such as 0.916 and 0.264, representing the system's assessed reliability of each alignment; dimension_kind and encoding attributes store categorical strings like Dimension Kind 01 and Encoding 02; and the recorded_at attribute captures timestamps such as 2024-11-29T12:22:57 and 2024-10-21T02:32:32, establishing when each alignment was last validated.

**t_schemaorg_label_alignment**

| id | schemaorg | aligned_to_schema_org_label |
| --- | --- | --- |
| ALIG-0001 | sku_code | sku_code |
| ALIG-0002 | org_id | sku_code |
| ALIG-0003 | data_asset_name | course_title |
| ALIG-0004 | data_asset_name | Product |
| ALIG-0005 | sku_code | sku_code |
| ALIG-0006 | work_title | Dataset |
| ALIG-0007 | subject_person | Dataset |
| ALIG-0008 | course_title | subject_person |

**t_schemaorg_label_alignment_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ALIG-0001 | confidence | xsd:decimal |
| ALIG-0002 | dimension_kind | xsd:string |
| ALIG-0003 | method | xsd:string |
| ALIG-0004 | recorded_at | xsd:dateTime |
| ALIG-0005 | uncertainty | xsd:decimal |
| ALIG-0006 | unit | xsd:string |
| ALIG-0007 | value | xsd:decimal |
| ALIG-0008 | encoding | xsd:string |

**t_schemaorg_label_alignment_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ALIG-0001 | ALIG-0001 | ALIG-0004 | 2024-11-29T12:22:57 |
| ALIG-0002 | ALIG-0002 | ALIG-0004 | 2024-10-21T02:32:32 |
| ALIG-0003 | ALIG-0003 | ALIG-0004 | 2024-04-16T22:29:51 |
| ALIG-0004 | ALIG-0004 | ALIG-0004 | 2024-04-08T02:25:07 |
| ALIG-0005 | ALIG-0005 | ALIG-0004 | 2024-04-01T00:20:16 |
| ALIG-0006 | ALIG-0006 | ALIG-0004 | 2024-06-23T20:04:43 |
| ALIG-0007 | ALIG-0007 | ALIG-0004 | 2025-03-29T09:58:30 |
| ALIG-0008 | ALIG-0008 | ALIG-0004 | 2024-10-23T02:04:00 |

**t_schemaorg_label_alignment_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ALIG-0001 | ALIG-0001 | ALIG-0001 | 0.916 |
| ALIG-0002 | ALIG-0001 | ALIG-0005 | 747.18 |
| ALIG-0003 | ALIG-0001 | ALIG-0007 | 963.37 |
| ALIG-0004 | ALIG-0002 | ALIG-0001 | 0.264 |
| ALIG-0005 | ALIG-0002 | ALIG-0005 | 721.79 |
| ALIG-0006 | ALIG-0002 | ALIG-0007 | 736.70 |
| ALIG-0007 | ALIG-0003 | ALIG-0001 | 0.758 |
| ALIG-0008 | ALIG-0003 | ALIG-0005 | 440.87 |

**t_schemaorg_label_alignment_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ALIG-0001 | ALIG-0001 | ALIG-0002 | Dimension Kind 01 |
| ALIG-0002 | ALIG-0001 | ALIG-0008 | Encoding 02 |
| ALIG-0003 | ALIG-0001 | ALIG-0009 | nightly summary |
| ALIG-0004 | ALIG-0001 | ALIG-0010 | fr |
| ALIG-0005 | ALIG-0001 | ALIG-0003 | automated |
| ALIG-0006 | ALIG-0001 | ALIG-0006 | count |
| ALIG-0007 | ALIG-0002 | ALIG-0002 | Dimension Kind 07 |
| ALIG-0008 | ALIG-0002 | ALIG-0008 | Encoding 08 |

Data transformation pipelines are tracked through a separate table that records the operational characteristics of each transformation job, including its type, input dataset, execution duration, and retry history. Transformations range from log aggregation and feature extraction to data masking and ETL pipeline processing, each operating on distinct input datasets: patient vitals, network traffic capture, financial trade records, and genomic sequencing reads. The duration_seconds column captures execution time with sub-second precision—7022.59 seconds for log aggregation, 3575.88 for feature extraction, 722.03 for data masking, and 6380.45 for the ETL pipeline—providing a basis for performance benchmarking and capacity planning. The retry_count column, with values ranging from 276 to 418 across the four records, quantifies the resilience of each pipeline; high retry counts may indicate unstable input sources, transient infrastructure failures, or data quality issues that trigger automatic reprocessing. Together, these metrics form an operational telemetry layer that complements the transactional and semantic data, enabling operators to correlate data quality with transformation reliability and to audit the end-to-end provenance of carbon credit data from raw input through semantic alignment to final transaction recording.

**t_transformation_with_input_dataset**

| id | transformation | input_dataset | duration_seconds | retry_count |
| --- | --- | --- | --- | --- |
| DATA-0001 | log aggregation | patient vitals | 7022.59 | 337 |
| DATA-0002 | feature extraction | network traffic capture | 3575.88 | 418 |
| DATA-0003 | data masking | financial trade records | 722.03 | 276 |
| DATA-0004 | ETL pipeline | genomic sequencing reads | 6380.45 | 352 |
| DATA-0005 | metadata enrichment | raw sensor logs | 5901.31 | 65 |
| DATA-0006 | ETL pipeline | genomic sequencing reads | 1979.98 | 431 |
| DATA-0007 | ETL pipeline | field survey records | 6357.24 | 452 |