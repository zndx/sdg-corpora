---
chapter_id: ch_live_artifact_either_internal_or_external_13e6ee
topic_id: 140
family: 07_long_tail
cited_terms: ['artifact_either_internal_or_external', 'lineage_edge_via_transformation', 'universal_combined_with_existential']
model: engine-refine
---

Artifact identification and classification form the bedrock of any data governance framework, where each entity must be unambiguously distinguished, categorized, and versioned to support auditability and reproducibility. The artifact dimension assigns descriptive labels and categorical groupings to discrete entities—Artifact Label 01 through Artifact Label 04, each residing within its own designated category from Artifact Category 01 through Artifact Category 04—thereby establishing a semantic scaffold upon which operational processes can reliably reference their inputs. These labels and categories are not merely administrative conveniences; they enable downstream systems to filter, aggregate, and trace artifacts according to business-relevant groupings without requiring knowledge of internal identifiers. The artifact fact table extends this foundation by recording the temporal and volumetric properties of each artifact instance: an artifact identified as EXTE-0001 may carry a size of 123,155,790 bytes at version 6, while another instance, EXTE-0003, reaches 996,080,316 bytes at version 5, illustrating how artifact size and version evolve independently across the lifecycle. The artifact_key column further introduces a layer of grouping, wherein distinct artifact identifiers such as EXTE-0001 and EXTE-0003 both reference the same underlying artifact key EXTE-0004, suggesting that multiple physical instances or revisions can be logically consolidated under a single artifact identity.

**fact_artifact**

| id | artifact_key | size_bytes | version |
| --- | --- | --- | --- |
| EXTE-0001 | EXTE-0004 | 123155790 | 6 |
| EXTE-0002 | EXTE-0005 | 42978804 | 5 |
| EXTE-0003 | EXTE-0004 | 996080316 | 5 |
| EXTE-0004 | EXTE-0005 | 597369362 | 10 |
| EXTE-0005 | EXTE-0006 | 12061913 | 9 |
| EXTE-0006 | EXTE-0001 | 792675668 | 5 |

**dim_artifact**

| id | artifact_label | artifact_category |
| --- | --- | --- |
| EXTE-0001 | Artifact Label 01 | Artifact Category 01 |
| EXTE-0002 | Artifact Label 02 | Artifact Category 02 |
| EXTE-0003 | Artifact Label 03 | Artifact Category 03 |
| EXTE-0004 | Artifact Label 04 | Artifact Category 04 |
| EXTE-0005 | Artifact Label 05 | Artifact Category 05 |
| EXTE-0006 | Artifact Label 06 | Artifact Category 06 |

Versioning and sizing are not peripheral metadata but central determinants of storage provisioning, transfer scheduling, and compliance with retention policies. The version numbers—ranging from 5 to 10 across the observed instances—encode the evolution of each artifact, enabling systems to detect when a newer revision supersedes an older one and to enforce policies such as "retain only the latest two versions." The byte counts, spanning from approximately 43 megabytes (42,978,804 bytes for EXTE-0002) to nearly 1 gigabyte (996,080,316 bytes for EXTE-0003), directly inform capacity planning and cost allocation, particularly in environments where storage is metered or where data transfer between environments incurs measurable latency and expense. An artifact such as EXTE-0004, at 597,369,362 bytes and version 10, represents a substantial revision that may have accumulated significant changes since its predecessor EXTE-0003, despite the latter's larger footprint at a lower version number.

Data lineage tracking introduces a probabilistic dimension to governance, where the certainty of a transformation's provenance is quantified rather than assumed. The lineage edge table records transformation events—such as Inventory Reconciliation, Patient Cohort Extraction, and Timezone Normalization—each attributed to a source system like the Genomic Variant Catalog, the Clinical Trial Registry, or the Financial Risk Pipeline. Critically, each edge carries a confidence score and an uncertainty value, transforming lineage from a binary assertion into a graded claim: the transformation from Genomic Variant Catalog to Inventory Reconciliation (TRAN-0001) holds a confidence of 0.439 against an uncertainty of 766.93, while the Timezone Normalization edge (TRAN-0003) achieves a higher confidence of 0.554 with an uncertainty of 878.86. These metrics enable risk-aware data quality assessments, allowing downstream consumers to weight the reliability of derived datasets according to the provenance strength of their upstream transformations. The recurrence of Inventory Reconciliation across two distinct lineage edges (TRAN-0001 and TRAN-0004), with confidence values of 0.439 and 0.532 respectively, further illustrates that the same transformation process may exhibit different confidence characteristics depending on its context or the data sources involved.

**t_lineage_edge_via_transformation**

| id | lineage | via_transformation | confidence | uncertainty |
| --- | --- | --- | --- | --- |
| TRAN-0001 | Inventory Reconciliation | Genomic Variant Catalog | 0.439 | 766.93 |
| TRAN-0002 | Patient Cohort Extraction | Clinical Trial Registry | 0.111 | 650.52 |
| TRAN-0003 | Timezone Normalization | Financial Risk Pipeline | 0.554 | 878.86 |
| TRAN-0004 | Inventory Reconciliation | Genomic Variant Catalog | 0.532 | 350.43 |
| TRAN-0005 | Schema Migration | SQL Join Aggregation | 0.034 | 365.80 |
| TRAN-0006 | Schema Migration | SQL Join Aggregation | 0.440 | 497.03 |

Cross-domain entity relationships, as captured in the universal-existential association table, extend governance beyond artifact-centric concerns into the realm of semantic interoperability and regulatory mapping. The universal column identifies entities of broad operational significance—Lab_Centrifuge_Rotor, Supply_Chain_Shipment, GDPR_Consent_Record, Database_Backup_Volume—while the related column links them to associated entities such as Atmospheric_Moisture, Personal_Information, and Tissue_Sample. These pairings encode domain-specific dependencies that are essential for impact analysis and compliance auditing: a GDPR_Consent_Record is explicitly tied to Personal_Information, establishing a traceable link between a regulatory artifact and the data subject it governs, while a Database_Backup_Volume's association with Personal_Information signals that backup operations must respect the same privacy constraints as primary data stores. The relationship between Supply_Chain_Shipment and Personal_Information, though less immediately obvious, may reflect logistics data that incidentally captures recipient information, thereby triggering privacy obligations that would otherwise go unnoticed in a purely technical inventory.

**t_universal_combined_with_existential**

| id | universal | related |
| --- | --- | --- |
| EXIS-0001 | Lab_Centrifuge_Rotor | Atmospheric_Moisture |
| EXIS-0002 | Supply_Chain_Shipment | Personal_Information |
| EXIS-0003 | GDPR_Consent_Record | Tissue_Sample |
| EXIS-0004 | Database_Backup_Volume | Personal_Information |
| EXIS-0005 | GDPR_Consent_Record | Serum_Glucose |
| EXIS-0006 | Spectral_Analyzer_Module | Light_Wavelength |
| EXIS-0007 | GDPR_Consent_Record | Light_Wavelength |
| EXIS-0008 | Blood_Glucose_Assay | Tissue_Sample |