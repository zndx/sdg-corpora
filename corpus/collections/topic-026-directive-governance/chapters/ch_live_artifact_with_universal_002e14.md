---
chapter_id: ch_live_artifact_with_universal_002e14
topic_id: 26
family: 01_foundation
cited_terms: ['artifact_with_universal', 'client_data_record', 'dempster_combination_subclass']
model: engine-refine
---

Within operational governance frameworks, every tracked entity requires a stable identifier that anchors its lifecycle from creation through decommissioning. An identifier such as UNIV-0001 or RECO-0001 functions as the immutable primary key across all fact and dimension tables, ensuring referential integrity when artifacts are cross-referenced against client records and analytical results. The temporal dimension is captured through the createddate field, which records when an artifact entered the system—Audit_Reporter was registered on 2024-12-09, while Feature_Vector_Store predates it by nearly two months at 2024-11-04. This chronological ordering enables auditors to reconstruct the sequence of system changes and establish chain-of-custody for compliance artifacts. Geographic provenance is equally critical; the location column distinguishes between cloud-hosted resources in us-east-1 and on-premises infrastructure such as on-prem-dc1, a distinction that directly affects regulatory applicability and data-residency requirements.

**t_artifact_with_universal**

| id | artifact | related | created_date | location |
| --- | --- | --- | --- | --- |
| UNIV-0001 | Audit_Reporter | GPU_Compute_Pool | 2024-12-09 | us-east-1 |
| UNIV-0002 | Feature_Vector_Store | Metadata_Registry | 2024-11-04 | us-east-1 |
| UNIV-0003 | Schema_Definition | GPU_Compute_Pool | 2024-10-11 | on-prem-dc1 |
| UNIV-0004 | Container_Image_Release | Compliance_Audit_Log | 2024-10-15 | us-east-1 |
| UNIV-0005 | Data_Pipeline_Export | Metadata_Registry | 2023-07-24 | eu-west-3 |
| UNIV-0006 | Feature_Vector_Store | Metrics_Stream_Prometheus | 2025-04-25 | ap-south-2 |
| UNIV-0007 | Workflow_Scheduler | GPU_Compute_Pool | 2023-11-17 | on-prem-dc1 |

The contains relationship structures how client-level facts are classified and labeled for reporting purposes. Each client record carries a contains_key that references a dimensional entry, which in turn provides both a human-readable label and a categorical classification. For instance, client RECO-0001 is associated with Contains Label 01 under Contains Category 01, while RECO-0002 maps to Contains Label 02 and Contains Category 02. This two-tier classification scheme—combining a descriptive misc label with a structural category—allows downstream consumers to aggregate events by business domain while preserving granular identification. The event_count column quantifies the volume of activity attributable to each client; RECO-0003 generated 282 events, the highest observed count, whereas RECO-0004 recorded only 42, signaling a markedly lighter operational footprint.

**fact_client**

| id | contains_key | event_count |
| --- | --- | --- |
| RECO-0001 | RECO-0006 | 225 |
| RECO-0002 | RECO-0005 | 129 |
| RECO-0003 | RECO-0002 | 282 |
| RECO-0004 | RECO-0002 | 42 |
| RECO-0005 | RECO-0003 | 486 |
| RECO-0006 | RECO-0004 | 89 |

**dim_contains**

| id | contains_label | contains_category |
| --- | --- | --- |
| RECO-0001 | Contains Label 01 | Contains Category 01 |
| RECO-0002 | Contains Label 02 | Contains Category 02 |
| RECO-0003 | Contains Label 03 | Contains Category 03 |
| RECO-0004 | Contains Label 04 | Contains Category 04 |
| RECO-0005 | Contains Label 05 | Contains Category 05 |
| RECO-0006 | Contains Label 06 | Contains Category 06 |

Evidence fusion through Dempster-Shafer theory introduces a probabilistic layer to the governance model, where confidence and uncertainty values quantify the reliability of combined analytical results. The fact_dempster table records each fusion event with a unique identifier—COMB-0001 through COMB-0004—and links it to a parent combination via the combines_via_dempster_key column, which itself references another entry in the same table. Confidence values span a wide range: COMB-0004 exhibits a high confidence of 0.728, suggesting strong evidentiary support, while COMB-0002 registers a minimal 0.014, indicating near-total uncertainty. The corresponding uncertainty metric, measured in absolute units, mirrors this inverse relationship—COMB-0002 carries an uncertainty of 392.06 and COMB-0003 reaches 687.80, the highest observed, whereas COMB-0001 maintains a comparatively low uncertainty of 9.49 alongside its modest confidence of 0.153.

**fact_dempster**

| id | combines_via_dempster_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| COMB-0001 | COMB-0004 | 0.153 | 9.49 | 520.46 |
| COMB-0002 | COMB-0006 | 0.014 | 392.06 | 137.18 |
| COMB-0003 | COMB-0003 | 0.025 | 687.80 | 197.61 |
| COMB-0004 | COMB-0004 | 0.728 | 479.57 | 846.10 |
| COMB-0005 | COMB-0005 | 0.918 | 172.36 | 296.96 |
| COMB-0006 | COMB-0001 | 0.755 | 608.06 | 341.51 |

The dimensional tables for combines_via_dempster and contains provide the categorical scaffolding that gives these numerical values operational meaning. Each combination record is annotated with a misc label and a category classification—Combines Via Dempster Label 01 under Combines Via Dempster Category 01, for example—enabling analysts to filter and aggregate fusion results by analytical method or evidence type. Similarly, the misc column in fact_dempster captures auxiliary values such as 520.46 or 846.10, which may represent the magnitude of the fused evidence or a derived metric. Together, these categorical and miscellaneous attributes transform raw confidence-uncertainty pairs into actionable governance signals, allowing compliance officers to distinguish between high-certainty findings that warrant immediate remediation and low-confidence results that require additional data collection before triggering any operational response.

**dim_combines_via_dempster**

| id | combines_via_dempster_label | combines_via_dempster_category |
| --- | --- | --- |
| COMB-0001 | Combines Via Dempster Label 01 | Combines Via Dempster Category 01 |
| COMB-0002 | Combines Via Dempster Label 02 | Combines Via Dempster Category 02 |
| COMB-0003 | Combines Via Dempster Label 03 | Combines Via Dempster Category 03 |
| COMB-0004 | Combines Via Dempster Label 04 | Combines Via Dempster Category 04 |
| COMB-0005 | Combines Via Dempster Label 05 | Combines Via Dempster Category 05 |
| COMB-0006 | Combines Via Dempster Label 06 | Combines Via Dempster Category 06 |
| COMB-0007 | Combines Via Dempster Label 07 | Combines Via Dempster Category 07 |