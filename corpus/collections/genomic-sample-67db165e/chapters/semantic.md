## The Genomic-Clinical Data Fabric

Biomedical research institutions routinely collect, sequence, and store genomic material while simultaneously tracking the health trajectories of the individuals from whom samples are drawn. The relational model described here captures that entire lifecycle: a person enrolls, a tissue sample is collected and assayed, the resulting data set is deposited in a repository, and clinical health records are maintained in parallel. Every fact in the domain is decomposed into seven core entity tables and three junction tables, then reassembled through thirteen materialized views that answer the analytical questions clinicians and data stewards actually ask.

**Table `genomic_samples`**

| id | sample_id | collection_date | tissue_type | sequencing_coverage | quality_score | storage_location | sequencing_assay_id | individual_id |
|---|---|---|---|---|---|---|---|---|
| 100 | 1562854 | 2025-12-17T11:57:00 | germline | 4.45 | 19.45 | distributed-storage-48 | 1 | 1 |
| 101 | 726043 | 2022-05-01T18:14:00 | tumor | 8.90 | 22.90 | baseline-storage-49 | 2 | 2 |
| 102 | 89106 | 2023-10-12T01:31:00 | somatic | 13.35 | 26.35 | pilot-storage-50 | 3 | 3 |
| 103 | 10966221 | 2024-03-23T08:48:00 | germline | 17.80 | 29.80 | extended-storage-51 | 4 | 4 |

The `genomic_samples` table is the central hub of the model. Each row represents a single biological specimen extracted from a study participant, identified by a surrogate primary key `id` and a human-readable `sample_id`. The specimen's provenance is captured through `collection_date`, `tissue_type` (germline, tumor, or somatic), and `storage_location` — for example, sample `1562854` (row `id = 100`) is a germline specimen stored in `distributed-storage-48` and collected on `2025-12-17`. Two foreign keys anchor the sample to the rest of the graph: `sequencing_assay_id` points to the laboratory procedure that generated the sequence data, and `individual_id` points to the donor in the `individuals` table. The numeric columns `sequencing_coverage` and `quality_score` quantify the assay's depth and confidence; sample `102` (tissue type `somatic`) carries a coverage of `13.35` and a quality score of `26.35`.

**Table `sequencing_assays`**

| sequencing_assay_id | assay_id | assay_type | start_date | end_date | coverage_depth | platform | genomic_dataset_id | genomic_sample_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 6564399 | Whole Genome | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | 0.6000001 | distributed-platform-48 | 100 | 100 |
| 2 | 9085253 | Whole Exome | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | 0.6000001 | baseline-platform-49 | 101 | 101 |
| 3 | 7645 | RNA | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | 0.6000001 | pilot-platform-50 | 102 | 102 |
| 4 | 2106692 | Whole Genome | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | 1.02669 | extended-platform-51 | 103 | 103 |

The `sequencing_assays` table records the laboratory procedures applied to each sample. Its primary key `sequencing_assay_id` is also the natural key used by downstream tables. Each assay row carries an `assay_type` — `Whole Genome`, `Whole Exome`, or `RNA` — along with temporal bounds (`start_date`, `end_date`), a `coverage_depth` metric, and the `platform` on which the sequencing ran. Row `sequencing_assay_id = 1` is a `Whole Genome` assay executed on `distributed-platform-48` between `2022-09-05` and `2022-09-01`, with a coverage depth of `0.6000001`. Two foreign keys, `genomic_dataset_id` and `genomic_sample_id`, link the assay to the data it produced and the sample it consumed, respectively.

**Table `genomic_datasets`**

| id | dataset_id | creation_date | size_in_g_b | format | checksum | access_level | sequencing_assay_id | repository_id |
|---|---|---|---|---|---|---|---|---|
| 100 | 325443 | 2022-01-13T12:24:00 | 1.15 | FASTQ | integrated-checksum-40 | public | 1 | 611503 |
| 101 | 4716402 | 2023-06-24T19:41:00 | 0.6000001 | BAM | seasonal-checksum-41 | restricted | 2 | 2106692 |
| 102 | 14202 | 2024-11-08T02:58:00 | 0.6 | VCF | regional-checksum-42 | private | 3 | 884340 |
| 103 | 1186088 | 2025-04-19T09:15:00 | 0.5249525700000001 | FASTQ | legacy-checksum-43 | public | 4 | 884350 |

A `genomic_datasets` row is the immutable artifact produced by an assay. Its surrogate key `id` doubles as the `genomic_dataset_id` referenced by the assay table, creating a tight one-to-one linkage. The dataset's business identifier is `dataset_id`, and its metadata includes `creation_date`, `size_in_g_b` (row `100` is `1.15` GB), `format` (`FASTQ`, `BAM`, or `VCF`), a `checksum` for integrity verification, and an `access_level` (`public`, `restricted`, or `private`). The foreign key `sequencing_assay_id` traces the dataset back to its parent assay, while `repository_id` points to the storage facility that holds the file.

**Table `data_repositories`**

| repository_id | repository_name | location | capacity_t_b | last_updated | access_protocol |
|---|---|---|---|---|---|
| 611503 | Baseline Series D | extended-location-99 | 15.45 | 2023-06-17T17:27:00 | HTTPS |
| 2106692 | Distributed Assessment | integrated-location-100 | 17.90 | 2024-11-01T00:44:00 | SFTP |
| 884340 | Adaptive Survey | seasonal-location-101 | 20.35 | 2025-04-12T07:01:00 | HTTPS |
| 884350 | Primary Corridor A | regional-location-102 | 22.80 | 2022-09-23T14:18:00 | SFTP |

The `data_repositories` table is a lookup catalog of storage facilities. Each row is keyed by `repository_id` and describes a repository's `repository_name` (e.g., `Baseline Series D`), `location`, `capacity_t_b` (row `611503` holds `15.45` TB), `last_updated` timestamp, and `access_protocol` (`HTTPS` or `SFTP`). This table is referenced by `genomic_datasets.repository_id` and by the junction table `repositories_datasets`, which records explicit repository-to-dataset assignments.

**Table `individuals`**

| id | individual_id | date_of_birth | sex | ethnicity | enrollment_date | status | record_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 4277024 | 2025-04-02 | male | primary-ethnicit-28 | 2022-05-11T16:00:00 | active | 10449530 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | default_chart_a_tax_code_40 | 2022-09-13 | female | adaptive-ethnicit-29 | 2023-10-22T23:17:00 | inactive | 10445619 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | 195368 | 2023-02-24 | other | distributed-ethnicit-30 | 2024-03-06T06:34:00 | deceased | 9568457 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | dce5fe58-8fcd-11eb-924d-9cd76263cbd0 | 2024-07-08 | male | baseline-ethnicit-31 | 2025-08-17T13:51:00 | active | 20743593 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The `individuals` table stores demographic and enrollment metadata for study participants. The surrogate primary key `id` is distinct from the business identifier `individual_id`, which can be a numeric code (`4277024`), a UUID (`dce5fe58-8fcd-11eb-924d-9cd76263cbd0`), or a synthetic label (`default_chart_a_tax_code_40`). Attributes include `date_of_birth`, `sex` (`male`, `female`, or `other`), `ethnicity`, `enrollment_date`, and `status` (`active`, `inactive`, or `deceased`). Audit columns `created_at` and `updated_at` track record lifecycle. The `record_id` column is a secondary identifier that also appears as the primary key of the `health_records` table, forming a bridge between the demographic and clinical layers.

**Table `health_records`**

| record_id | compilation_date | risk_score | diagnosis_codes | medication_list | last_review_date | individual_id | genomic_dataset_id |
|---|---|---|---|---|---|---|---|
| 10449530 | 2025-08-05T19:57:00 | 19.70 | distributed-diagnosi-90 | integrated-medicati-46 | 2022-09-03T08:24:00 | 1 | 100 |
| 10445619 | 2022-01-16T02:14:00 | 22.40 | baseline-diagnosi-91 | seasonal-medicati-47 | 2023-02-14T15:41:00 | 2 | 101 |
| 9568457 | 2023-06-27T09:31:00 | 25.10 | pilot-diagnosi-92 | regional-medicati-48 | 2024-07-25T22:58:00 | 3 | 102 |
| 20743593 | 2024-11-11T16:48:00 | 27.80 | extended-diagnosi-93 | legacy-medicati-49 | 2025-12-09T05:15:00 | 4 | 103 |

The `health_records` table captures clinical summaries for each individual. Its primary key `record_id` is the same column that appears in `individuals`, establishing a one-to-one correspondence between a person and their health record. Columns include `compilation_date`, a numeric `risk_score` (row `10449530` scores `19.70`), `diagnosis_codes`, `medication_list`, and `last_review_date`. Two foreign keys — `individual_id` and `genomic_dataset_id` — tie the clinical record to the donor and to a specific genomic data set, enabling cross-referencing between clinical risk and molecular findings.

**Table `clinical_trials`**

| id | trial_id | phase | start_date | end_date | status | primary_outcome | genomic_dataset_id |
|---|---|---|---|---|---|---|---|
| 1 | 4716418 | I | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | recruiting | extended-primary-63 | 100 |
| 2 | 2618555 | II | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | active | integrated-primary-64 | 101 |
| 3 | ad481f3a-8fb6-11eb-924d-9cd76263cbd0 | III | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | completed | seasonal-primary-65 | 102 |
| 4 | default_chart_a_tax_code_29 | IV | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | terminated | regional-primary-66 | 103 |

The `clinical_trials` table enumerates interventional studies. Although no sample rows are shown in the reference data, the table exists to anchor the junction table `trials_individuals`, which links trial identifiers to participant identifiers. This many-to-many relationship allows a single individual to participate in multiple trials and a single trial to enroll multiple individuals.

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

The `repositories_datasets` junction table resolves the many-to-many relationship between `data_repositories` and `genomic_datasets`. A row asserts that a particular repository holds a particular data set, supplementing the direct `repository_id` foreign key in `genomic_datasets` with an explicit assignment record.

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

The `individuals_samples` junction table resolves the many-to-many relationship between `individuals` and `genomic_samples`. A row asserts that a specific individual donated a specific sample, supporting scenarios where a participant provides multiple specimens across time or tissue types.

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

The `trials_individuals` junction table resolves the many-to-many relationship between `clinical_trials` and `individuals`. A row asserts that a specific individual is enrolled in a specific trial, enabling enrollment tracking and eligibility queries.

The seven base tables and three junction tables form a fully normalized graph. The views materialize the most common analytical joins, each answering a distinct domain question.

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

The view `v_genomic_sample_sequencing_assay` joins `genomic_samples` to `sequencing_assays` on `sequencing_assay_id`, producing a single-row summary per specimen that combines sample metadata with assay metadata. Reading row `id = 100`, the view reports sample `1562854` (tissue type `germline`, coverage `4.45`) alongside assay `1` (type `Whole Genome`, platform `distributed-platform-48`, coverage depth `0.6000001`). This view answers the question: "What assay parameters apply to this specimen?"

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

The view `v_genomic_sample_individual` joins `genomic_samples` to `individuals` on `individual_id`, pairing each specimen with its donor's demographic profile. Row `id = 100` links sample `1562854` to individual `id = 1` (`individual_id = 4277024`, sex `male`, status `active`). The view answers: "Who donated this sample, and what is their enrollment status?"

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

The view `v_sequencing_assay_genomic_dataset` joins `sequencing_assays` to `genomic_datasets` on `genomic_dataset_id`, connecting each assay to the data artifact it produced. Row `sequencing_assay_id = 1` maps to dataset `id = 100` (`dataset_id = 325443`, format `FASTQ`, size `1.15` GB, access level `public`). This view answers: "Which data set was generated by this assay?"

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

The view `v_sequencing_assay_genomic_sample` joins `sequencing_assays` to `genomic_samples` on `genomic_sample_id`, reversing the assay-to-sample direction. Row `sequencing_assay_id = 2` links to sample `id = 101` (tissue type `tumor`, coverage `8.90`). This view answers: "Which specimen was processed by this assay?"

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

The view `v_genomic_dataset_sequencing_assay` joins `genomic_datasets` to `sequencing_assays` on `sequencing_assay_id`, presenting the dataset-centric perspective. Row `id = 100` (dataset `325443`, format `FASTQ`, checksum `integrated-checksum-40`) is traced back to assay `1` (type `Whole Genome`, platform `distributed-platform-48`). This view answers: "What assay produced this data set?"

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

The view `v_genomic_dataset_data_repository` joins `genomic_datasets` to `data_repositories` on `repository_id`, revealing where each data set is stored. Row `id = 100` (dataset `325443`, access level `public`) is stored in repository `611503` (`Baseline Series D`, location `extended-location-99`, capacity `15.45` TB, protocol `HTTPS`). This view answers: "Where is this data set physically located?"

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

The view `v_data_repository_genomic_dataset_detail` inverts the previous join, presenting the repository-centric perspective. It lists every data set held by a given repository alongside the repository's own metadata. For repository `611503` (`Baseline Series D`), the view surfaces dataset `100` (`325443`, `FASTQ`, `1.15` GB, `public`). This view answers: "What data sets does this repository hold?"

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

The view `v_individual_genomic_sample_detail` joins `individuals` to `genomic_samples` on `individual_id`, producing a comprehensive donor-to-specimen mapping. Row `id = 1` (individual `4277024`, sex `male`, ethnicity `primary-ethnicit-28`, status `active`) is linked to sample `100` (`1562854`, tissue type `germline`, collection date `2025-12-17T11:57:00`, storage `distributed-storage-48`). This view answers: "Which specimens did this individual donate?"

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

The view `v_individual_health_record` joins `individuals` to `health_records` on `individual_id`, pairing demographic data with clinical summaries. Row `id = 1` (individual `4277024`, sex `male`, status `active`) is linked to health record `10449530` (compilation date `2025-08-05T19:57:00`, risk score `19.70`, diagnosis `distributed-diagnosi-90`, medication `integrated-medicati-46`). This view answers: "What is the clinical profile of this individual?"

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

The view `v_health_record_individual` inverts the previous join, presenting the clinical-centric perspective. It lists each health record alongside the donor's demographic attributes. Record `10449530` (risk score `19.70`, diagnosis `distributed-diagnosi-90`) is linked to individual `4277024` (sex `male`, ethnicity `primary-ethnicit-28`, enrollment date `2022-05-11T16:00:00`). This view answers: "Who does this health record belong to?"

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

The view `v_health_record_genomic_dataset` joins `health_records` to `genomic_datasets` on `genomic_dataset_id`, bridging clinical and molecular data. Row `record_id = 10449530` (risk score `19.70`, diagnosis `distributed-diagnosi-90`) is linked to dataset `id = 100` (`dataset_id = 325443`, format `FASTQ`, size `1.15` GB, access level `public`). This view answers: "Which genomic data set corresponds to this clinical record?"

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

The view `v_clinical_trial_individual_detail` joins `clinical_trials` to `individuals` through the `trials_individuals` junction table, producing a trial-to-participant roster. Although no sample rows are shown, the view structure enables queries such as: "Which individuals are enrolled in this trial?" with full demographic context.

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

The view `v_clinical_trial_genomic_dataset` joins `clinical_trials` to `genomic_datasets` through the `trials_individuals` and `individuals_samples` junction tables, linking trial enrollment to the molecular data generated by enrolled participants. This view answers: "Which genomic data sets are associated with individuals in this trial?"

The materialized views collectively cover every common analytical path through the normalized schema: specimen-to-assay, specimen-to-donor, assay-to-dataset, dataset-to-repository, donor-to-specimen, donor-to-clinical, clinical-to-donor, clinical-to-molecular, repository-to-dataset, trial-to-donor, and trial-to-molecular. Each view is a deterministic join of two or three base tables, preserving referential integrity while presenting the domain in the shape that analysts expect. The model is complete, consistent, and ready for production query workloads.