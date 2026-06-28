---
chapter_id: ch_live_lineage_edge_via_transformation_49187f
topic_id: 86
family: 05_provo_lineage
cited_terms: ['lineage_edge_via_transformation', 'outlier_detection_produces_claim', 'requirement_traces_to']
model: engine-refine
---

Data lineage and transformation provenance are anchored by unique identifiers that serve as the primary keys across all tracking tables, enabling unambiguous reference to every edge, outlier, category, and requirement trace. In the lineage edge table, identifiers such as TRAN-0001 through TRAN-0004 designate individual transformation pathways, each connecting a source lineage—Inventory Reconciliation, Patient Cohort Extraction, or Timezone Normalization—to a downstream target system like the Genomic Variant Catalog, Clinical Trial Registry, or Financial Risk Pipeline. Similarly, outlier records carry identifiers CLAI-0001 through CLAI-0004, while requirement traces use TRAC-0001 through TRAC-0004, establishing a consistent naming convention that permits cross-table joins and auditability. These identifiers are not merely labels; they are the structural backbone that allows an analyst to trace a data product from its origin through every transformation, failure event, and compliance obligation it satisfies.

**dim_produces_category**

| id | category_name |
| --- | --- |
| CLAI-0001 | Category Name 01 |
| CLAI-0002 | Category Name 02 |
| CLAI-0003 | Category Name 03 |
| CLAI-0004 | Category Name 04 |
| CLAI-0005 | Category Name 05 |
| CLAI-0006 | Category Name 06 |

**t_requirement_traces_to**

| id | requirement |
| --- | --- |
| TRAC-0001 | Network Segmentation Rule |
| TRAC-0002 | Access Control Mandate |
| TRAC-0003 | Privacy Compliance Requirement |
| TRAC-0004 | Privacy Compliance Requirement |
| TRAC-0005 | Access Control Mandate |
| TRAC-0006 | Encryption Standard |
| TRAC-0007 | System Availability Target |

**t_requirement_traces_to_traces_to**

| id | traces_to |
| --- | --- |
| TRAC-0001 | HIPAA Security Rule |
| TRAC-0002 | Risk Assessment Matrix |
| TRAC-0003 | Compliance Audit Checklist |
| TRAC-0004 | ISO 27001 Control |
| TRAC-0005 | Penetration Test Suite |
| TRAC-0006 | NIST SP 800-53 |
| TRAC-0007 | Vulnerability Scan Config |

The reliability of any lineage edge is quantified through paired measures of confidence and uncertainty, which together capture the epistemic state of the transformation relationship. Confidence values, ranging from 0.111 for the Patient Cohort Extraction routed through the Clinical Trial Registry to 0.554 for Timezone Normalization feeding the Financial Risk Pipeline, express the degree of assurance in the edge's correctness. Uncertainty, measured in absolute units, provides the complementary dispersion metric: the same Timezone Normalization edge carries an uncertainty of 878.86, while Inventory Reconciliation to Genomic Variant Catalog registers 350.43, suggesting that higher confidence does not necessarily imply lower variance. These dual metrics are essential for governance frameworks that must distinguish between edges that are well-understood but noisy and those that are poorly understood but stable, informing risk-weighted decisions about data product deployment.

**t_lineage_edge_via_transformation**

| id | lineage | via_transformation | confidence | uncertainty |
| --- | --- | --- | --- | --- |
| TRAN-0001 | Inventory Reconciliation | Genomic Variant Catalog | 0.439 | 766.93 |
| TRAN-0002 | Patient Cohort Extraction | Clinical Trial Registry | 0.111 | 650.52 |
| TRAN-0003 | Timezone Normalization | Financial Risk Pipeline | 0.554 | 878.86 |
| TRAN-0004 | Inventory Reconciliation | Genomic Variant Catalog | 0.532 | 350.43 |
| TRAN-0005 | Schema Migration | SQL Join Aggregation | 0.034 | 365.80 |
| TRAN-0006 | Schema Migration | SQL Join Aggregation | 0.440 | 497.03 |

Production metadata is organized through a dimensional hierarchy that separates categorical classification from descriptive labeling. The produces dimension assigns each data product a misc label—such as Produces Label 01 through Produces Label 04—and a produces_category designation like Produces Category 01 through Produces Category 04, while a foreign key to the category dimension resolves the category_id to a formal category_name, including Category Name 01 through Category Name 04. This separation of concerns allows the same category to be referenced across multiple produces records; for instance, category_id CLAI-0002 appears in both CLAI-0002 and CLAI-0004, indicating that distinct data products share a categorical classification. The produces_key column in the outlier fact table further links operational events back to these products, with records such as CLAI-0004 producing CLAI-0004 and CLAI-0001 producing CLAI-0001, establishing a self-referential chain that captures which data products are themselves sources of downstream anomalies.

**dim_produces**

| id | produces_label | produces_category | category_id |
| --- | --- | --- | --- |
| CLAI-0001 | Produces Label 01 | Produces Category 01 | CLAI-0004 |
| CLAI-0002 | Produces Label 02 | Produces Category 02 | CLAI-0002 |
| CLAI-0003 | Produces Label 03 | Produces Category 03 | CLAI-0006 |
| CLAI-0004 | Produces Label 04 | Produces Category 04 | CLAI-0002 |
| CLAI-0005 | Produces Label 05 | Produces Category 05 | CLAI-0005 |
| CLAI-0006 | Produces Label 06 | Produces Category 06 | CLAI-0001 |

Operational performance and failure behavior are captured in the outlier fact table through three interrelated metrics: duration_seconds, exit_code, and retry_count. Duration values span from 1182.39 seconds for outlier CLAI-0004 to 6466.78 seconds for CLAI-0002, reflecting the wide variance in processing times across failure modes. Exit codes—760, 4, 490, and 124—encode distinct failure classifications, while retry counts range from 101 for CLAI-0003 to 308 for CLAI-0004, revealing that some failures trigger extensive recovery attempts while others terminate quickly. The combination of these three dimensions enables root-cause analysis: a high retry count paired with a short duration and a specific exit code may indicate a transient resource contention, whereas a long duration with few retries suggests a fundamental processing bottleneck.

**fact_outlier**

| id | produces_key | duration_seconds | exit_code | retry_count |
| --- | --- | --- | --- | --- |
| CLAI-0001 | CLAI-0004 | 3360.34 | 760 | 293 |
| CLAI-0002 | CLAI-0006 | 6466.78 | 4 | 225 |
| CLAI-0003 | CLAI-0001 | 5282.09 | 490 | 101 |
| CLAI-0004 | CLAI-0001 | 1182.39 | 124 | 308 |
| CLAI-0005 | CLAI-0002 | 3041.72 | 808 | 59 |
| CLAI-0006 | CLAI-0001 | 3852.38 | 619 | 489 |
| CLAI-0007 | CLAI-0004 | 1453.07 | 682 | 1 |

Compliance obligations are modeled through a tripartite trace structure that links requirements to their implementing controls via an associative table carrying a role attribute. The requirement table defines obligations such as Network Segmentation Rule, Access Control Mandate, and Privacy Compliance Requirement, while the traces_to dimension specifies the controls to which they map—HIPAA Security Rule, Risk Assessment Matrix, Compliance Audit Checklist, and ISO 27001 Control. The junction table t_requirement_traces_to__traces_to connects these entities using subject (the requirement_id) and target (the traces_to_id) columns, with the role column assigning each linkage a governance function: owner, reviewer, or contributor. In the observed data, requirement TRAC-0004 appears as the subject in two separate traces, linking to target TRAC-0004 with roles of reviewer in both cases, while TRAC-0001 appears as both owner and contributor to the same target, illustrating how a single requirement can carry multiple governance responsibilities within the compliance framework.

**t_requirement_traces_to__traces_to**

| id | requirement_id | traces_to_id | role |
| --- | --- | --- | --- |
| TRAC-0001 | TRAC-0001 | TRAC-0004 | owner |
| TRAC-0002 | TRAC-0004 | TRAC-0004 | reviewer |
| TRAC-0003 | TRAC-0004 | TRAC-0004 | reviewer |
| TRAC-0004 | TRAC-0001 | TRAC-0004 | contributor |
| TRAC-0005 | TRAC-0007 | TRAC-0005 | contributor |
| TRAC-0006 | TRAC-0002 | TRAC-0003 | observer |
| TRAC-0007 | TRAC-0007 | TRAC-0002 | owner |
| TRAC-0008 | TRAC-0001 | TRAC-0002 | observer |