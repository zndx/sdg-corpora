# Genomic Data Management: From Specimen to Clinical Insight

The modern genomic research enterprise operates at the intersection of biological sampling, high-throughput sequencing, data curation, and clinical translation. A single research program may process thousands of biological specimens, subject them to diverse sequencing platforms, store the resulting petabytes of data across geographically distributed repositories, and link all of this back to the individuals from whom the material was derived. This chapter describes the operational architecture of such a system, tracing the lifecycle of a genomic sample from collection through assay execution, data storage, and ultimately clinical interpretation.

## Biological Specimen Management

Every genomic investigation begins with a physical specimen. The `genomic_samples` table records each specimen as a structured entry capturing its provenance, biological characteristics, and quality metrics. A specimen is identified by a unique `sample_id` and a system-level `id`, and is timestamped with a `collection_date` that anchors it to the laboratory workflow.

**Table `genomic_samples`**

| id | sample_id | collection_date | tissue_type | sequencing_coverage | quality_score | storage_location | sequencing_assay_id | individual_id |
|---|---|---|---|---|---|---|---|---|
| 100 | 1562854 | 2025-12-17T11:57:00 | germline | 4.45 | 19.45 | distributed-storage-48 | 1 | 1 |
| 101 | 726043 | 2022-05-01T18:14:00 | tumor | 8.90 | 22.90 | baseline-storage-49 | 2 | 2 |
| 102 | 89106 | 2023-10-12T01:31:00 | somatic | 13.35 | 26.35 | pilot-storage-50 | 3 | 3 |
| 103 | 10966221 | 2024-03-23T08:48:00 | germline | 17.80 | 29.80 | extended-storage-51 | 4 | 4 |

The `tissue_type` column distinguishes between germline, tumor, and somatic specimens, each carrying different analytical implications. Germline samples like specimen 1562854 (id 100) represent constitutional DNA, while tumor samples like 726043 (id 101) capture the altered genome of malignant tissue. Somatic samples such as 89106 (id 102) represent non-hereditary mutations acquired during life. The `sequencing_coverage` and `quality_score` fields quantify the expected and measured data quality, respectively. Coverage values range from 4.45x for the germline specimen to 17.80x for specimen 10966221, while quality scores span from 19.45 to 29.80. Storage locations follow a naming convention that reflects the storage tier: `distributed-storage-48`, `baseline-storage-49`, `pilot-storage-50`, and `extended-storage-51` correspond to different archival strategies.

Each specimen is linked to a specific `sequencing_assay_id` and `individual_id`, establishing the two critical relationships that connect the physical sample to both the analytical process and the donor.

## Sequencing Assay Execution

The `sequencing_assays` table documents the laboratory experiments performed on specimens. Each assay record carries an `assay_id` that identifies the experimental protocol, an `assay_type` that specifies the sequencing strategy, and temporal boundaries defined by `start_date` and `end_date`. The `coverage_depth` parameter quantifies the sequencing intensity, while the `platform` field identifies the instrument used.

**Table `sequencing_assays`**

| sequencing_assay_id | assay_id | assay_type | start_date | end_date | coverage_depth | platform | genomic_dataset_id | genomic_sample_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 6564399 | Whole Genome | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | 0.6000001 | distributed-platform-48 | 100 | 100 |
| 2 | 9085253 | Whole Exome | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | 0.6000001 | baseline-platform-49 | 101 | 101 |
| 3 | 7645 | RNA | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | 0.6000001 | pilot-platform-50 | 102 | 102 |
| 4 | 2106692 | Whole Genome | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | 1.02669 | extended-platform-51 | 103 | 103 |

Three assay types appear in the reference data: Whole Genome sequencing (assay IDs 6564399 and 2106692), Whole Exome sequencing (assay ID 9085253), and RNA sequencing (assay ID 7645). The platforms follow a tiered naming scheme—`distributed-platform-48`, `baseline-platform-49`, `pilot-platform-50`, and `extended-platform-51`—mirroring the storage tier nomenclature and suggesting a coordinated infrastructure. Coverage depth values cluster around 0.6 for the first three assays, with the fourth assay reaching 1.02669, indicating a higher-intensity run.

Each assay is associated with a `genomic_dataset_id` and `genomic_sample_id`, creating the bridge between the wet-lab experiment and the resulting digital data product.

## Genomic Data Products

Sequencing assays produce digital data files that are catalogued in the `genomic_datasets` table. Each dataset record includes a `dataset_id`, a `creation_date`, the file `size_in_g_b`, the file `format`, a `checksum` for integrity verification, and an `access_level` that governs who may retrieve the data.

**Table `genomic_datasets`**

| id | dataset_id | creation_date | size_in_g_b | format | checksum | access_level | sequencing_assay_id | repository_id |
|---|---|---|---|---|---|---|---|---|
| 100 | 325443 | 2022-01-13T12:24:00 | 1.15 | FASTQ | integrated-checksum-40 | public | 1 | 611503 |
| 101 | 4716402 | 2023-06-24T19:41:00 | 0.6000001 | BAM | seasonal-checksum-41 | restricted | 2 | 2106692 |
| 102 | 14202 | 2024-11-08T02:58:00 | 0.6 | VCF | regional-checksum-42 | private | 3 | 884340 |
| 103 | 1186088 | 2025-04-19T09:15:00 | 0.5249525700000001 | FASTQ | legacy-checksum-43 | public | 4 | 884350 |

Four file formats appear across the reference data: FASTQ (raw reads), BAM (aligned reads), and VCF (variant calls). Dataset sizes range from 0.52 GB to 1.15 GB, reflecting the varying complexity of the underlying assays. Access levels are stratified into public, restricted, and private tiers, with the public datasets (IDs 325443 and 1186088) being freely accessible, while the restricted dataset (ID 4716402) and private dataset (ID 14202) require authorization. Checksums such as `integrated-checksum-40` and `seasonal-checksum-41` provide cryptographic verification of data integrity.

Each dataset is linked to its originating `sequencing_assay_id` and stored within a `repository_id`, completing the chain from specimen to stored data.

## Data Repository Infrastructure

The `data_repositories` table manages the physical and logical storage infrastructure. Each repository is identified by a `repository_id` and a human-readable `repository_name`, located at a specific `location`, and characterized by its `capacity_t_b` in terabytes. The `last_updated` timestamp tracks the most recent maintenance event, and the `access_protocol` specifies the network protocol used for data transfer.

**Table `data_repositories`**

| repository_id | repository_name | location | capacity_t_b | last_updated | access_protocol |
|---|---|---|---|---|---|
| 611503 | Baseline Series D | extended-location-99 | 15.45 | 2023-06-17T17:27:00 | HTTPS |
| 2106692 | Distributed Assessment | integrated-location-100 | 17.90 | 2024-11-01T00:44:00 | SFTP |
| 884340 | Adaptive Survey | seasonal-location-101 | 20.35 | 2025-04-12T07:01:00 | HTTPS |
| 884350 | Primary Corridor A | regional-location-102 | 22.80 | 2022-09-23T14:18:00 | SFTP |

Four repositories are catalogued: Baseline Series D (15.45 TB, HTTPS), Distributed Assessment (17.90 TB, SFTP), Adaptive Survey (20.35 TB, HTTPS), and Primary Corridor A (22.80 TB, SFTP). Capacity ranges from 15.45 to 22.80 terabytes, and access protocols alternate between HTTPS and SFTP, reflecting different security and throughput requirements. The last updated dates span from 2022 to 2025, indicating an actively maintained infrastructure.

## Individual Donor Records

The `individuals` table maintains the demographic and enrollment records for all study participants. Each individual is identified by an `individual_id` (which may be a numeric identifier, a descriptive label, or a UUID), a `date_of_birth`, `sex`, and `ethnicity`. The `enrollment_date` marks when the individual entered the study, `status` reflects their current participation state, and `record_id` links to their clinical record.

**Table `individuals`**

| id | individual_id | date_of_birth | sex | ethnicity | enrollment_date | status | record_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 4277024 | 2025-04-02 | male | primary-ethnicit-28 | 2022-05-11T16:00:00 | active | 10449530 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | default_chart_a_tax_code_40 | 2022-09-13 | female | adaptive-ethnicit-29 | 2023-10-22T23:17:00 | inactive | 10445619 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | 195368 | 2023-02-24 | other | distributed-ethnicit-30 | 2024-03-06T06:34:00 | deceased | 9568457 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | dce5fe58-8fcd-11eb-924d-9cd76263cbd0 | 2024-07-08 | male | baseline-ethnicit-31 | 2025-08-17T13:51:00 | active | 20743593 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The reference data includes individuals with diverse identifiers: numeric IDs like 4277024, descriptive labels like `default_chart_a_tax_code_40`, and UUIDs like `dce5fe58-8fcd-11eb-924d-9cd76263cbd0`. Sex categories include male, female, and other. Enrollment dates span from 2022 to 2025, and statuses range from active to inactive to deceased, reflecting the longitudinal nature of the study. Each individual carries a `record_id` that connects to their health record.

## Clinical Health Records

Health records are maintained in the `health_records` table, which links clinical observations to both the individual donor and the genomic dataset that informed the assessment. Each record carries a `record_id`, a `compilation_date`, a `risk_score` quantifying the individual's clinical risk, `diagnosis_codes` and `medication_list` describing their medical status, and a `last_review_date`.

**Table `health_records`**

| record_id | compilation_date | risk_score | diagnosis_codes | medication_list | last_review_date | individual_id | genomic_dataset_id |
|---|---|---|---|---|---|---|---|
| 10449530 | 2025-08-05T19:57:00 | 19.70 | distributed-diagnosi-90 | integrated-medicati-46 | 2022-09-03T08:24:00 | 1 | 100 |
| 10445619 | 2022-01-16T02:14:00 | 22.40 | baseline-diagnosi-91 | seasonal-medicati-47 | 2023-02-14T15:41:00 | 2 | 101 |
| 9568457 | 2023-06-27T09:31:00 | 25.10 | pilot-diagnosi-92 | regional-medicati-48 | 2024-07-25T22:58:00 | 3 | 102 |
| 20743593 | 2024-11-11T16:48:00 | 27.80 | extended-diagnosi-93 | legacy-medicati-49 | 2025-12-09T05:15:00 | 4 | 103 |

Risk scores in the reference data range from 19.70 to 27.80, with higher scores indicating greater clinical risk. Diagnosis codes follow a descriptive naming convention (e.g., `distributed-diagnosi-90`, `baseline-diagnosi-91`), and medication lists are similarly categorized (e.g., `integrated-medicati-46`, `seasonal-medicati-47`). Each health record is associated with an `individual_id` and a `genomic_dataset_id`, creating the critical link between clinical assessment and genomic data.

## Clinical Trial Enrollment

Clinical trials are tracked in the `clinical_trials` table, which records trial-level information and links enrolled participants to their outcomes. The `clinical_trials` table establishes the framework for interventional studies, while the `trials_individuals` junction table records which individuals participated in which trials.

**Table `clinical_trials`**

| id | trial_id | phase | start_date | end_date | status | primary_outcome | genomic_dataset_id |
|---|---|---|---|---|---|---|---|
| 1 | 4716418 | I | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | recruiting | extended-primary-63 | 100 |
| 2 | 2618555 | II | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | active | integrated-primary-64 | 101 |
| 3 | ad481f3a-8fb6-11eb-924d-9cd76263cbd0 | III | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | completed | seasonal-primary-65 | 102 |
| 4 | default_chart_a_tax_code_29 | IV | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | terminated | regional-primary-66 | 103 |

## Repository-Data Relationships

The `repositories_datasets` table serves as a junction table that explicitly records which genomic datasets are stored in which repositories. This many-to-many relationship allows datasets to be replicated across multiple repositories for redundancy and geographic distribution.

**Table `repositories_datasets`**

| repository_id | genomic_dataset_id |
|---|---|
| 611503 | 100 |
| 611503 | 101 |
| 2106692 | 101 |
| 2106692 | 102 |
| 884340 | 102 |
| 884340 | 103 |
| 884350 | 103 |
| 884350 | 100 |

## Individual-Sample Relationships

The `individuals_samples` table links individuals to their submitted specimens, supporting scenarios where a single donor contributes multiple samples across different time points or tissue types.

**Table `individuals_samples`**

| individual_id | genomic_sample_id |
|---|---|
| 1 | 100 |
| 1 | 101 |
| 2 | 101 |
| 2 | 102 |
| 3 | 102 |
| 3 | 103 |
| 4 | 103 |
| 4 | 100 |

## Analytical Views

The system provides a suite of analytical views that join base tables to answer specific operational questions. Each view presents a curated perspective on the underlying data.

### Sample-Assay Relationship View

The `v_genomic_sample_sequencing_assay` view joins genomic samples with their corresponding sequencing assays, answering the question: "What assay was performed on each specimen?" This view reveals that specimen 1562854 (id 100) was processed by assay 6564399 (Whole Genome), while specimen 726043 (id 101) underwent assay 9085253 (Whole Exome). The view preserves all specimen metadata alongside assay details, enabling quality assessment at the specimen-assay level.

**View `v_genomic_sample_sequencing_assay`**

```sql
CREATE VIEW v_genomic_sample_sequencing_assay AS
SELECT a.id, a.sample_id, a.collection_date, a.tissue_type, b.sequencing_assay_id AS assay_sequencing_assay_id, b.assay_id AS assay_assay_id, b.assay_type AS assay_assay_type
FROM genomic_samples a JOIN sequencing_assays b ON a.sequencing_assay_id = b.sequencing_assay_id;
```

| id | sample_id | collection_date | tissue_type | assay_sequencing_assay_id | assay_assay_id | assay_assay_type |
|---|---|---|---|---|---|---|
| 100 | 1562854 | 2025-12-17T11:57:00 | germline | 1 | 6564399 | Whole Genome |
| 101 | 726043 | 2022-05-01T18:14:00 | tumor | 2 | 9085253 | Whole Exome |
| 102 | 89106 | 2023-10-12T01:31:00 | somatic | 3 | 7645 | RNA |
| 103 | 10966221 | 2024-03-23T08:48:00 | germline | 4 | 2106692 | Whole Genome |

### Sample-Individual Relationship View

The `v_genomic_sample_individual` view connects specimens to their donor individuals, answering: "Which individual contributed this sample?" This view shows that specimen 1562854 was contributed by individual 4277024, a male enrolled on 2022-05-11 with active status. Specimen 726043 traces to individual `default_chart_a_tax_code_40`, a female with inactive status. The view merges specimen collection dates with individual enrollment dates, enabling temporal analysis of the sampling timeline relative to study entry.

**View `v_genomic_sample_individual`**

```sql
CREATE VIEW v_genomic_sample_individual AS
SELECT a.id, a.sample_id, a.collection_date, a.tissue_type, b.id AS individual_id, b.individual_id AS individual_individual_id, b.date_of_birth AS individual_date_of_birth
FROM genomic_samples a JOIN individuals b ON a.individual_id = b.id;
```

| id | sample_id | collection_date | tissue_type | individual_id | individual_individual_id | individual_date_of_birth |
|---|---|---|---|---|---|---|
| 100 | 1562854 | 2025-12-17T11:57:00 | germline | 1 | 4277024 | 2025-04-02 |
| 101 | 726043 | 2022-05-01T18:14:00 | tumor | 2 | default_chart_a_tax_code_40 | 2022-09-13 |
| 102 | 89106 | 2023-10-12T01:31:00 | somatic | 3 | 195368 | 2023-02-24 |
| 103 | 10966221 | 2024-03-23T08:48:00 | germline | 4 | dce5fe58-8fcd-11eb-924d-9cd76263cbd0 | 2024-07-08 |

### Assay-Dataset Relationship View

The `v_sequencing_assay_genomic_dataset` view links sequencing assays to their resulting data products, answering: "What dataset was produced by this assay?" Assay 6564399 produced dataset 325443 in FASTQ format (1.15 GB, public access), while assay 9085253 produced dataset 4716402 in BAM format (0.6 GB, restricted access). This view is essential for tracking data lineage from experiment to file.

**View `v_sequencing_assay_genomic_dataset`**

```sql
CREATE VIEW v_sequencing_assay_genomic_dataset AS
SELECT a.sequencing_assay_id, a.assay_id, a.assay_type, a.start_date, b.id AS dataset_id, b.dataset_id AS dataset_dataset_id, b.creation_date AS dataset_creation_date
FROM sequencing_assays a JOIN genomic_datasets b ON a.genomic_dataset_id = b.id;
```

| sequencing_assay_id | assay_id | assay_type | start_date | dataset_id | dataset_dataset_id | dataset_creation_date |
|---|---|---|---|---|---|---|
| 1 | 6564399 | Whole Genome | 2022-09-05T20:24:00 | 100 | 325443 | 2022-01-13T12:24:00 |
| 2 | 9085253 | Whole Exome | 2023-02-16T03:41:00 | 101 | 4716402 | 2023-06-24T19:41:00 |
| 3 | 7645 | RNA | 2024-07-27T10:58:00 | 102 | 14202 | 2024-11-08T02:58:00 |
| 4 | 2106692 | Whole Genome | 2025-12-11T17:15:00 | 103 | 1186088 | 2025-04-19T09:15:00 |

### Assay-Sample Relationship View

The `v_sequencing_assay_genomic_sample` view presents the reverse perspective of the sample-assay view, answering: "Which specimen was processed by this assay?" This view confirms that assay 6564399 processed specimen 1562854 (germline tissue, 4.45x coverage, quality score 19.45), and assay 7645 processed specimen 89106 (somatic tissue, 13.35x coverage, quality score 26.35). The view is particularly useful for quality control, as it places assay parameters alongside specimen quality metrics.

**View `v_sequencing_assay_genomic_sample`**

```sql
CREATE VIEW v_sequencing_assay_genomic_sample AS
SELECT a.sequencing_assay_id, a.assay_id, a.assay_type, a.start_date, b.id AS sample_id, b.sample_id AS sample_sample_id, b.collection_date AS sample_collection_date
FROM sequencing_assays a JOIN genomic_samples b ON a.genomic_sample_id = b.id;
```

| sequencing_assay_id | assay_id | assay_type | start_date | sample_id | sample_sample_id | sample_collection_date |
|---|---|---|---|---|---|---|
| 1 | 6564399 | Whole Genome | 2022-09-05T20:24:00 | 100 | 1562854 | 2025-12-17T11:57:00 |
| 2 | 9085253 | Whole Exome | 2023-02-16T03:41:00 | 101 | 726043 | 2022-05-01T18:14:00 |
| 3 | 7645 | RNA | 2024-07-27T10:58:00 | 102 | 89106 | 2023-10-12T01:31:00 |
| 4 | 2106692 | Whole Genome | 2025-12-11T17:15:00 | 103 | 10966221 | 2024-03-23T08:48:00 |

### Dataset-Assay Relationship View

The `v_genomic_dataset_sequencing_assay` view presents the dataset-centric perspective, answering: "Which assay generated this dataset?" Dataset 325443 (FASTQ, 1.15 GB, public) was generated by assay 6564399 (Whole Genome, distributed-platform-48), while dataset 14202 (VCF, 0.6 GB, private) was generated by assay 7645 (RNA, pilot-platform-50). This view supports data governance by pairing file-level metadata with assay provenance.

**View `v_genomic_dataset_sequencing_assay`**

```sql
CREATE VIEW v_genomic_dataset_sequencing_assay AS
SELECT a.id, a.dataset_id, a.creation_date, a.size_in_g_b, b.sequencing_assay_id AS assay_sequencing_assay_id, b.assay_id AS assay_assay_id, b.assay_type AS assay_assay_type
FROM genomic_datasets a JOIN sequencing_assays b ON a.sequencing_assay_id = b.sequencing_assay_id;
```

| id | dataset_id | creation_date | size_in_g_b | assay_sequencing_assay_id | assay_assay_id | assay_assay_type |
|---|---|---|---|---|---|---|
| 100 | 325443 | 2022-01-13T12:24:00 | 1.15 | 1 | 6564399 | Whole Genome |
| 101 | 4716402 | 2023-06-24T19:41:00 | 0.6000001 | 2 | 9085253 | Whole Exome |
| 102 | 14202 | 2024-11-08T02:58:00 | 0.6 | 3 | 7645 | RNA |
| 103 | 1186088 | 2025-04-19T09:15:00 | 0.5249525700000001 | 4 | 2106692 | Whole Genome |

### Dataset-Repository Relationship View

The `v_genomic_dataset_data_repository` view answers: "Where is this dataset stored?" Dataset 325443 is stored in Baseline Series D (repository 611503, 15.45 TB capacity, HTTPS protocol), while dataset 4716402 resides in Distributed Assessment (repository 2106692, 17.90 TB, SFTP). This view is critical for data retrieval operations and capacity planning.

**View `v_genomic_dataset_data_repository`**

```sql
CREATE VIEW v_genomic_dataset_data_repository AS
SELECT a.id, a.dataset_id, a.creation_date, a.size_in_g_b, b.repository_id AS repository_repository_id, b.repository_name AS repository_repository_name, b.location AS repository_location
FROM genomic_datasets a JOIN data_repositories b ON a.repository_id = b.repository_id;
```

| id | dataset_id | creation_date | size_in_g_b | repository_repository_id | repository_repository_name | repository_location |
|---|---|---|---|---|---|---|
| 100 | 325443 | 2022-01-13T12:24:00 | 1.15 | 611503 | Baseline Series D | extended-location-99 |
| 101 | 4716402 | 2023-06-24T19:41:00 | 0.6000001 | 2106692 | Distributed Assessment | integrated-location-100 |
| 102 | 14202 | 2024-11-08T02:58:00 | 0.6 | 884340 | Adaptive Survey | seasonal-location-101 |
| 103 | 1186088 | 2025-04-19T09:15:00 | 0.5249525700000001 | 884350 | Primary Corridor A | regional-location-102 |

### Repository-Dataset Detail View

The `v_data_repository_genomic_dataset_detail` view provides a repository-centric summary, answering: "What datasets does this repository hold?" Baseline Series D hosts dataset 325443 (FASTQ, 1.15 GB, public), while Distributed Assessment holds dataset 4716402 (BAM, 0.6 GB, restricted). This view supports repository management by aggregating dataset metadata under each storage location.

**View `v_data_repository_genomic_dataset_detail`**

```sql
CREATE VIEW v_data_repository_genomic_dataset_detail AS
SELECT a.repository_id, a.repository_name, a.location, b.id AS dataset_id, b.dataset_id AS dataset_dataset_id, b.creation_date AS dataset_creation_date
FROM data_repositories a
  JOIN repositories_datasets j ON j.repository_id = a.repository_id
  JOIN genomic_datasets b ON b.id = j.genomic_dataset_id;
```

| repository_id | repository_name | location | dataset_id | dataset_dataset_id | dataset_creation_date |
|---|---|---|---|---|---|
| 611503 | Baseline Series D | extended-location-99 | 100 | 325443 | 2022-01-13T12:24:00 |
| 611503 | Baseline Series D | extended-location-99 | 101 | 4716402 | 2023-06-24T19:41:00 |
| 2106692 | Distributed Assessment | integrated-location-100 | 101 | 4716402 | 2023-06-24T19:41:00 |
| 2106692 | Distributed Assessment | integrated-location-100 | 102 | 14202 | 2024-11-08T02:58:00 |
| 884340 | Adaptive Survey | seasonal-location-101 | 102 | 14202 | 2024-11-08T02:58:00 |
| 884340 | Adaptive Survey | seasonal-location-101 | 103 | 1186088 | 2025-04-19T09:15:00 |
| 884350 | Primary Corridor A | regional-location-102 | 103 | 1186088 | 2025-04-19T09:15:00 |
| 884350 | Primary Corridor A | regional-location-102 | 100 | 325443 | 2022-01-13T12:24:00 |

### Individual-Sample Detail View

The `v_individual_genomic_sample_detail` view provides a comprehensive donor-centric record, answering: "What samples has this individual contributed?" Individual 4277024 (male, primary-ethnicit-28, enrolled 2022-05-11, active) contributed specimen 1562854 (germline, collected 2025-12-17, 4.45x coverage, stored at distributed-storage-48). Individual `dce5fe58-8fcd-11eb-924d-9cd76263cbd0` (male, baseline-ethnicit-31, enrolled 2025-08-17, active) contributed specimen 10966221 (germline, collected 2024-03-23, 17.80x coverage, stored at extended-storage-51). This view is essential for donor management and longitudinal study design.

**View `v_individual_genomic_sample_detail`**

```sql
CREATE VIEW v_individual_genomic_sample_detail AS
SELECT a.id, a.individual_id, a.date_of_birth, b.id AS sample_id, b.sample_id AS sample_sample_id, b.collection_date AS sample_collection_date
FROM individuals a
  JOIN individuals_samples j ON j.individual_id = a.id
  JOIN genomic_samples b ON b.id = j.genomic_sample_id;
```

| id | individual_id | date_of_birth | sample_id | sample_sample_id | sample_collection_date |
|---|---|---|---|---|---|
| 1 | 4277024 | 2025-04-02 | 100 | 1562854 | 2025-12-17T11:57:00 |
| 1 | 4277024 | 2025-04-02 | 101 | 726043 | 2022-05-01T18:14:00 |
| 2 | default_chart_a_tax_code_40 | 2022-09-13 | 101 | 726043 | 2022-05-01T18:14:00 |
| 2 | default_chart_a_tax_code_40 | 2022-09-13 | 102 | 89106 | 2023-10-12T01:31:00 |
| 3 | 195368 | 2023-02-24 | 102 | 89106 | 2023-10-12T01:31:00 |
| 3 | 195368 | 2023-02-24 | 103 | 10966221 | 2024-03-23T08:48:00 |
| 4 | dce5fe58-8fcd-11eb-924d-9cd76263cbd0 | 2024-07-08 | 103 | 10966221 | 2024-03-23T08:48:00 |
| 4 | dce5fe58-8fcd-11eb-924d-9cd76263cbd0 | 2024-07-08 | 100 | 1562854 | 2025-12-17T11:57:00 |

### Individual-Health Record View

The `v_individual_health_record` view links individuals to their clinical records, answering: "What is the health status of this individual?" Individual 4277024 has health record 10449530 with a risk score of 19.70, diagnosis code `distributed-diagnosi-90`, and medication list `integrated-medicati-46`. Individual 195368 (deceased status) has health record 9568457 with the highest risk score of 25.10 and diagnosis code `pilot-diagnosi-92`. This view supports clinical monitoring and risk stratification.

**View `v_individual_health_record`**

```sql
CREATE VIEW v_individual_health_record AS
SELECT a.id, a.individual_id, a.date_of_birth, a.sex, b.record_id AS record_record_id, b.compilation_date AS record_compilation_date, b.risk_score AS record_risk_score
FROM individuals a JOIN health_records b ON a.record_id = b.record_id;
```

| id | individual_id | date_of_birth | sex | record_record_id | record_compilation_date | record_risk_score |
|---|---|---|---|---|---|---|
| 1 | 4277024 | 2025-04-02 | male | 10449530 | 2025-08-05T19:57:00 | 19.70 |
| 2 | default_chart_a_tax_code_40 | 2022-09-13 | female | 10445619 | 2022-01-16T02:14:00 | 22.40 |
| 3 | 195368 | 2023-02-24 | other | 9568457 | 2023-06-27T09:31:00 | 25.10 |
| 4 | dce5fe58-8fcd-11eb-924d-9cd76263cbd0 | 2024-07-08 | male | 20743593 | 2024-11-11T16:48:00 | 27.80 |

### Health Record-Individual View

The `v_health_record_individual` view presents the clinical record-centric perspective, answering: "Which individual does this health record belong to?" Record 10449530 (compilation date 2025-08-05, risk score 19.70) belongs to individual 4277024 (male, primary-ethnicit-28, active). Record 20743593 (risk score 27.80, the highest in the dataset) belongs to individual `dce5fe58-8fcd-11eb-924d-9cd76263cbd0` (male, baseline-ethnicit-31, active). This view is useful for clinical audits and record retrieval.

**View `v_health_record_individual`**

```sql
CREATE VIEW v_health_record_individual AS
SELECT a.record_id, a.compilation_date, a.risk_score, a.diagnosis_codes, b.id AS individual_id, b.individual_id AS individual_individual_id, b.date_of_birth AS individual_date_of_birth
FROM health_records a JOIN individuals b ON a.individual_id = b.id;
```

| record_id | compilation_date | risk_score | diagnosis_codes | individual_id | individual_individual_id | individual_date_of_birth |
|---|---|---|---|---|---|---|
| 10449530 | 2025-08-05T19:57:00 | 19.70 | distributed-diagnosi-90 | 1 | 4277024 | 2025-04-02 |
| 10445619 | 2022-01-16T02:14:00 | 22.40 | baseline-diagnosi-91 | 2 | default_chart_a_tax_code_40 | 2022-09-13 |
| 9568457 | 2023-06-27T09:31:00 | 25.10 | pilot-diagnosi-92 | 3 | 195368 | 2023-02-24 |
| 20743593 | 2024-11-11T16:48:00 | 27.80 | extended-diagnosi-93 | 4 | dce5fe58-8fcd-11eb-924d-9cd76263cbd0 | 2024-07-08 |

### Health Record-Genomic Dataset View

The `v_health_record_genomic_dataset` view connects clinical assessments to the genomic data that informed them, answering: "Which genomic dataset underlies this health record?" Health record 10449530 (risk score 19.70) is associated with genomic dataset 325443 (FASTQ, 1.15 GB, public). Health record 20743593 (risk score 27.80) is associated with dataset 1186088 (FASTQ, 0.52 GB, public). This view is fundamental for evidence-based clinical decision support, linking diagnostic conclusions to their genomic data sources.

**View `v_health_record_genomic_dataset`**

```sql
CREATE VIEW v_health_record_genomic_dataset AS
SELECT a.record_id, a.compilation_date, a.risk_score, a.diagnosis_codes, b.id AS dataset_id, b.dataset_id AS dataset_dataset_id, b.creation_date AS dataset_creation_date
FROM health_records a JOIN genomic_datasets b ON a.genomic_dataset_id = b.id;
```

| record_id | compilation_date | risk_score | diagnosis_codes | dataset_id | dataset_dataset_id | dataset_creation_date |
|---|---|---|---|---|---|---|
| 10449530 | 2025-08-05T19:57:00 | 19.70 | distributed-diagnosi-90 | 100 | 325443 | 2022-01-13T12:24:00 |
| 10445619 | 2022-01-16T02:14:00 | 22.40 | baseline-diagnosi-91 | 101 | 4716402 | 2023-06-24T19:41:00 |
| 9568457 | 2023-06-27T09:31:00 | 25.10 | pilot-diagnosi-92 | 102 | 14202 | 2024-11-08T02:58:00 |
| 20743593 | 2024-11-11T16:48:00 | 27.80 | extended-diagnosi-93 | 103 | 1186088 | 2025-04-19T09:15:00 |

### Clinical Trial-Individual Detail View

The `v_clinical_trial_individual_detail` view links clinical trials to enrolled participants, answering: "Which individuals are enrolled in this trial?" This view merges trial-level information with individual demographics and health status, enabling trial management and participant monitoring.

**View `v_clinical_trial_individual_detail`**

```sql
CREATE VIEW v_clinical_trial_individual_detail AS
SELECT a.id, a.trial_id, a.phase, b.id AS individual_id, b.individual_id AS individual_individual_id, b.date_of_birth AS individual_date_of_birth
FROM clinical_trials a
  JOIN trials_individuals j ON j.clinical_trial_id = a.id
  JOIN individuals b ON b.id = j.individual_id;
```

| id | trial_id | phase | individual_id | individual_individual_id | individual_date_of_birth |
|---|---|---|---|---|---|
| 1 | 4716418 | I | 1 | 4277024 | 2025-04-02 |
| 1 | 4716418 | I | 2 | default_chart_a_tax_code_40 | 2022-09-13 |
| 2 | 2618555 | II | 2 | default_chart_a_tax_code_40 | 2022-09-13 |
| 2 | 2618555 | II | 3 | 195368 | 2023-02-24 |
| 3 | ad481f3a-8fb6-11eb-924d-9cd76263cbd0 | III | 3 | 195368 | 2023-02-24 |
| 3 | ad481f3a-8fb6-11eb-924d-9cd76263cbd0 | III | 4 | dce5fe58-8fcd-11eb-924d-9cd76263cbd0 | 2024-07-08 |
| 4 | default_chart_a_tax_code_29 | IV | 4 | dce5fe58-8fcd-11eb-924d-9cd76263cbd0 | 2024-07-08 |
| 4 | default_chart_a_tax_code_29 | IV | 1 | 4277024 | 2025-04-02 |

### Clinical Trial-Genomic Dataset View

The `v_clinical_trial_genomic_dataset` view connects clinical trials to the genomic datasets that support trial outcomes, answering: "Which genomic datasets are associated with this trial?" This view supports trial reporting by linking interventional data with the underlying genomic evidence.

**View `v_clinical_trial_genomic_dataset`**

```sql
CREATE VIEW v_clinical_trial_genomic_dataset AS
SELECT a.id, a.trial_id, a.phase, a.start_date, b.id AS dataset_id, b.dataset_id AS dataset_dataset_id, b.creation_date AS dataset_creation_date
FROM clinical_trials a JOIN genomic_datasets b ON a.genomic_dataset_id = b.id;
```

| id | trial_id | phase | start_date | dataset_id | dataset_dataset_id | dataset_creation_date |
|---|---|---|---|---|---|---|
| 1 | 4716418 | I | 2022-09-05T20:24:00 | 100 | 325443 | 2022-01-13T12:24:00 |
| 2 | 2618555 | II | 2023-02-16T03:41:00 | 101 | 4716402 | 2023-06-24T19:41:00 |
| 3 | ad481f3a-8fb6-11eb-924d-9cd76263cbd0 | III | 2024-07-27T10:58:00 | 102 | 14202 | 2024-11-08T02:58:00 |
| 4 | default_chart_a_tax_code_29 | IV | 2025-12-11T17:15:00 | 103 | 1186088 | 2025-04-19T09:15:00 |

## Synthesis

The genomic data management system described here implements a coherent pipeline from biological specimen through clinical interpretation. Specimens are collected, characterized by tissue type and quality metrics, and linked to their donors. Sequencing assays transform physical samples into digital datasets, which are stored in distributed repositories with defined access controls. Health records integrate clinical risk assessments with the genomic data that informed them, while clinical trials provide the interventional framework for translating genomic findings into therapeutic action. The analytical views presented above provide the operational lenses through which researchers, clinicians, and data managers navigate this complex ecosystem, each view answering a specific question about the relationships between specimens, assays, datasets, repositories, individuals, and clinical outcomes.

## Data appendix

**Table `trials_individuals`**

| clinical_trial_id | individual_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |
