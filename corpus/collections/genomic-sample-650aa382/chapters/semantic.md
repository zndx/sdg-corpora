## Normalized Modelling of a Genomic Health Data Pipeline

A modern genomic health data pipeline must reconcile three distinct data domains—clinical enrollment, laboratory sequencing, and data governance—while preserving traceability from a patient's health record through to the raw genomic dataset that was produced. The relational schema achieves this by decomposing the domain into seven core entity tables, two junction tables for many-to-many associations, and a suite of materialized views that reassemble the normalized facts into queryable domain narratives. Every table carries a surrogate integer primary key alongside a business-meaningful identifier, and foreign keys encode the cardinality-bounded relationships that bind the pipeline together.

The pipeline begins with the people who consent to participate. The `individuals` table stores demographic and administrative attributes for each enrollee. Its surrogate key `id` is a sequential integer, while `individual_id` carries the domain identifier, which may be a numeric string such as `4277024` or a UUID such as `dce5fe58-8fcd-11eb-924d-9cd76263cbd0`. The `date_of_birth` column records the enrollee's birth date, `sex` stores a categorical label like `baseline-sex-49` or `pilot-sex-50`, and `enrollment_status` captures the current lifecycle state—`active`, `withdrawn`, or `deceased` in the observed data. The `insurance_provider` column holds a string such as `seasonal-insuranc-11`, and two foreign keys, `health_record_id` and `clinical_program_id`, link the individual to their clinical record and to the program they are enrolled in.

**Table `individuals`**

| id | individual_id | date_of_birth | sex | enrollment_status | insurance_provider | health_record_id | clinical_program_id |
|---|---|---|---|---|---|---|---|
| 1000 | 4277024 | 2025-04-02 | baseline-sex-49 | active | seasonal-insuranc-11 | 1 | 1000 |
| 1001 | default_chart_a_tax_code_40 | 2022-09-13 | pilot-sex-50 | withdrawn | regional-insuranc-12 | 2 | 1001 |
| 1002 | 195368 | 2023-02-24 | extended-sex-51 | deceased | legacy-insuranc-13 | 3 | 1002 |
| 1003 | dce5fe58-8fcd-11eb-924d-9cd76263cbd0 | 2024-07-08 | integrated-sex-52 | active | compact-insuranc-14 | 4 | 1003 |

The clinical dimension is captured in the `health_records` table, which stores longitudinal health information for each individual. The surrogate `id` is a small integer, while `record_id` carries a domain identifier like `10449530`. The `last_updated` timestamp tracks the most recent modification, and `completeness_score` is a numeric measure of record quality—values such as `19.20` or `31.80` appear in the data. The `record_type` column distinguishes between `clinical`, `phenotypic`, `behavioral`, and `integrated` records, while `privacy_level` constrains access to `public`, `de-identified`, or `restricted`. The foreign key `individual_id` binds each health record to exactly one person, and `genomic_dataset_id` links the record to a specific genomic dataset, establishing a direct bridge between clinical observation and molecular data.

**Table `health_records`**

| health_record_id | record_id | last_updated | completeness_score | record_type | privacy_level | individual_id | genomic_dataset_id |
|---|---|---|---|---|---|---|---|
| 1 | 10449530 | 2023-06-17T17:27:00 | 19.20 | clinical | public | 1000 | 1 |
| 2 | 10445619 | 2024-11-01T00:44:00 | 23.40 | phenotypic | de-identified | 1001 | 2 |
| 3 | 9568457 | 2025-04-12T07:01:00 | 27.60 | behavioral | restricted | 1002 | 3 |
| 4 | 20743593 | 2022-09-23T14:18:00 | 31.80 | integrated | public | 1003 | 4 |

Clinical programs organize individuals into structured study cohorts. The `clinical_programs` table stores program metadata including a surrogate `clinical_program_id`, a domain `program_id` such as `103176`, and `start_date` / `end_date` timestamps that define the program's operational window. The `program_type` column categorizes the study as `research`, `diagnostic`, or `therapeutic`, and `target_disease` identifies the clinical focus, with values like `regional-target-18` or `legacy-target-19`. The foreign key `genomic_dataset_id` associates the program with a genomic dataset, while `partner_organization_id` links it to the external organization sponsoring or collaborating on the study.

**Table `clinical_programs`**

| clinical_program_id | program_id | start_date | end_date | program_type | target_disease | genomic_dataset_id | partner_organization_id |
|---|---|---|---|---|---|---|---|
| 1000 | 103176 | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | research | regional-target-18 | 1 | 1 |
| 1001 | 2986219 | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | diagnostic | legacy-target-19 | 2 | 2 |
| 1002 | 1186079 | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | therapeutic | compact-target-20 | 3 | 3 |
| 1003 | 1562855 | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | research | composite-target-21 | 4 | 4 |

External collaboration is tracked in the `partner_organizations` table, which stores the institutional entities that participate in clinical programs. Each organization is identified by a surrogate key and a domain identifier, and the foreign key relationships from `clinical_programs.partner_organization_id` ensure that every program's sponsoring organization is explicitly recorded.

**Table `partner_organizations`**

| id | org_id | org_name | sector | contract_start_date | contract_end_date | clinical_program_id | genomic_dataset_id |
|---|---|---|---|---|---|---|---|
| 1 | 790471 | Extended Review | pharmaceutical | 2022-01-26T12:36:00 | 2025-12-07T23:09:00 | 1000 | 1 |
| 2 | 1717 | Pilot Initiative A | biotechnology | 2023-06-10T19:53:00 | 2022-05-18T06:26:00 | 1001 | 2 |
| 3 | 69437 | Baseline Model | insurance | 2024-11-21T02:10:00 | 2023-10-02T13:43:00 | 1002 | 3 |
| 4 | m16 | Distributed Cluster | academic | 2025-04-05T09:27:00 | 2024-03-13T20:00:00 | 1003 | 4 |

The laboratory dimension of the pipeline is anchored by the `genomic_samples` table, which records each biological specimen collected from an individual. The surrogate `id` is a sequential integer, while `sample_id` carries a domain identifier such as `1562854` or `726043`. The `collection_date` timestamp records when the specimen was obtained, `tissue_type` stores a categorical label like `pilot-tissue-44` or `extended-tissue-45`, and `sequencing_coverage` is a numeric measurement of the sample's sequencing depth—values such as `4.45`, `8.90`, `13.35`, and `17.80` appear in the data. The `sample_status` column tracks the lifecycle state of the sample, with observed values of `collected`, `processed`, `sequenced`, and `archived`. Two foreign keys, `sequencing_assay_id` and `individual_id`, bind the sample to its corresponding assay and to the person from whom it was derived.

**Table `genomic_samples`**

| id | sample_id | collection_date | tissue_type | sequencing_coverage | sample_status | sequencing_assay_id | individual_id |
|---|---|---|---|---|---|---|---|
| 1000 | 1562854 | 2025-12-17T11:57:00 | pilot-tissue-44 | 4.45 | collected | 100 | 1000 |
| 1001 | 726043 | 2022-05-01T18:14:00 | extended-tissue-45 | 8.90 | processed | 101 | 1001 |
| 1002 | 89106 | 2023-10-12T01:31:00 | integrated-tissue-46 | 13.35 | sequenced | 102 | 1002 |
| 1003 | 10966221 | 2024-03-23T08:48:00 | seasonal-tissue-47 | 17.80 | archived | 103 | 1003 |

The `sequencing_assays` table captures the laboratory procedures applied to each genomic sample. Its surrogate primary key `sequencing_assay_id` is a sequential integer, while `assay_id` carries a domain identifier such as `6564399` or `9085253`. The `assay_type` column distinguishes between `whole_genome`, `exome`, and `targeted` sequencing strategies. The `coverage_depth` column records the sequencing depth achieved—values of `37`, `44`, `51`, and `58` appear in the data. The `platform` column identifies the sequencing instrument used, with labels like `distributed-platform-48` or `baseline-platform-49`. The `result_status` column tracks the assay outcome, with observed values of `pending`, `running`, `complete`, and `failed`. The `created_at` timestamp records when the assay record was created. Foreign keys `genomic_sample_id` and `genomic_dataset_id` link the assay to its source sample and to the resulting dataset.

**Table `sequencing_assays`**

| sequencing_assay_id | assay_id | assay_type | coverage_depth | platform | result_status | genomic_sample_id | genomic_dataset_id | created_at |
|---|---|---|---|---|---|---|---|---|
| 100 | 6564399 | whole_genome | 37 | distributed-platform-48 | pending | 1000 | 1 | 2025-01-01 00:14:00 |
| 101 | 9085253 | exome | 44 | baseline-platform-49 | running | 1001 | 2 | 2025-02-06 03:14:00 |
| 102 | 7645 | targeted | 51 | pilot-platform-50 | complete | 1002 | 3 | 2025-03-11 06:14:00 |
| 103 | 2106692 | whole_genome | 58 | extended-platform-51 | failed | 1003 | 4 | 2025-04-16 09:14:00 |

The `genomic_datasets` table stores the final molecular data products produced by sequencing assays. The surrogate `id` is a sequential integer, while `dataset_id` carries a domain identifier such as `325443` or `4716402`. The `format` column identifies the file format, with values like `legacy-format-25` or `compact-format-26`. The `size_g_b` column records the dataset size in gigabytes—values such as `0.74`, `0.73`, `0.286487255225401`, and `0.6000001` appear in the data. The `upload_date` timestamp records when the dataset was uploaded, and `access_level` constrains access to `open`, `restricted`, or `controlled`. The foreign key `sequencing_assay_id` links the dataset to the assay that produced it, and the `created_at` and `updated_at` timestamps track the dataset's lifecycle.

**Table `genomic_datasets`**

| id | dataset_id | format | size_g_b | upload_date | access_level | sequencing_assay_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|
| 1 | 325443 | legacy-format-25 | 0.74 | 2022-05-23T04:36:00 | open | 100 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | 4716402 | compact-format-26 | 0.73 | 2023-10-07T11:53:00 | restricted | 101 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | 14202 | composite-format-27 | 0.286487255225401 | 2024-03-18T18:10:00 | controlled | 102 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | 1186088 | primary-format-28 | 0.6000001 | 2025-08-02T01:27:00 | open | 103 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Many-to-many relationships between individuals and samples, and between clinical programs and individuals, are resolved through junction tables. The `individuals_samples` table links individuals to their genomic samples, allowing a single person to contribute multiple samples and a sample record to reference multiple individuals where appropriate. The `programs_individuals` table links clinical programs to enrolled individuals, enabling a program to enroll many people and a person to participate in multiple programs. These junction tables ensure that the normalized schema can express the full complexity of the domain without introducing redundant data.

**Table `individuals_samples`**

| individual_id | genomic_sample_id |
|---|---|
| 1000 | 1000 |
| 1000 | 1001 |
| 1001 | 1001 |
| 1001 | 1002 |
| 1002 | 1002 |
| 1002 | 1003 |
| 1003 | 1003 |
| 1003 | 1000 |

**Table `programs_individuals`**

| clinical_program_id | individual_id |
|---|---|
| 1000 | 1000 |
| 1000 | 1001 |
| 1001 | 1001 |
| 1001 | 1002 |
| 1002 | 1002 |
| 1002 | 1003 |
| 1003 | 1003 |
| 1003 | 1000 |

The foreign key topology of the schema forms a directed graph that traces the lineage of a genomic fact from person through sample, assay, and dataset, while also connecting clinical and programmatic context. The `genomic_samples.sequencing_assay_id` references `sequencing_assays.sequencing_assay_id`, and `genomic_samples.individual_id` references `individuals.id`. The `sequencing_assays.genomic_sample_id` references `genomic_samples.id`, and `sequencing_assays.genomic_dataset_id` references `genomic_datasets.id`. The `genomic_datasets.sequencing_assay_id` references `sequencing_assays.sequencing_assay_id`. The `health_records.individual_id` references `individuals.id`, and `health_records.genomic_dataset_id` references `genomic_datasets.id`. The `clinical_programs.genomic_dataset_id` references `genomic_datasets.id`, and `clinical_programs.partner_organization_id` references `partner_organizations.id`. The `individuals.health_record_id` references `health_records.health_record_id`, and `individuals.clinical_program_id` references `clinical_programs.clinical_program_id`. This web of references ensures that every piece of data can be traced back to its origin.

The materialized views reassemble the normalized tables into domain-level narratives that answer specific analytical questions. Each view is a join across two or more base tables, projecting the relevant columns into a flat structure that can be queried without manual join logic.

The view `vw_genomic_sample_sequencing_assay` joins `genomic_samples` to `sequencing_assays` on the sample-to-assay relationship, producing a flat record that pairs each sample with its laboratory procedure. For the row with sample `1562854` and assay `6564399`, the view reveals that a `pilot-tissue-44` sample with coverage `4.45` was processed by a `whole_genome` assay on `distributed-platform-48` with depth `37` and status `pending`. This view answers the question: "What assay was performed on each genomic sample?"

**View `vw_genomic_sample_sequencing_assay`**

```sql
CREATE VIEW vw_genomic_sample_sequencing_assay AS
SELECT a.id, a.sample_id, a.collection_date, a.tissue_type, b.sequencing_assay_id AS assay_sequencing_assay_id, b.assay_id AS assay_assay_id, b.assay_type AS assay_assay_type
FROM genomic_samples a JOIN sequencing_assays b ON a.sequencing_assay_id = b.sequencing_assay_id;
```

| id | sample_id | collection_date | tissue_type | assay_sequencing_assay_id | assay_assay_id | assay_assay_type |
|---|---|---|---|---|---|---|
| 1000 | 1562854 | 2025-12-17T11:57:00 | pilot-tissue-44 | 100 | 6564399 | whole_genome |
| 1001 | 726043 | 2022-05-01T18:14:00 | extended-tissue-45 | 101 | 9085253 | exome |
| 1002 | 89106 | 2023-10-12T01:31:00 | integrated-tissue-46 | 102 | 7645 | targeted |
| 1003 | 10966221 | 2024-03-23T08:48:00 | seasonal-tissue-47 | 103 | 2106692 | whole_genome |

The view `vw_genomic_sample_individual` joins `genomic_samples` to `individuals`, producing a flat record that pairs each sample with its source person. For the row with sample `1562854` and individual `4277024`, the view reveals that the sample was collected on `2025-12-17` from a person with birth date `2025-04-02` who is `active` in the program. This view answers the question: "Which individual does each sample belong to?"

**View `vw_genomic_sample_individual`**

```sql
CREATE VIEW vw_genomic_sample_individual AS
SELECT a.id, a.sample_id, a.collection_date, a.tissue_type, b.id AS individual_id, b.individual_id AS individual_individual_id, b.date_of_birth AS individual_date_of_birth
FROM genomic_samples a JOIN individuals b ON a.individual_id = b.id;
```

| id | sample_id | collection_date | tissue_type | individual_id | individual_individual_id | individual_date_of_birth |
|---|---|---|---|---|---|---|
| 1000 | 1562854 | 2025-12-17T11:57:00 | pilot-tissue-44 | 1000 | 4277024 | 2025-04-02 |
| 1001 | 726043 | 2022-05-01T18:14:00 | extended-tissue-45 | 1001 | default_chart_a_tax_code_40 | 2022-09-13 |
| 1002 | 89106 | 2023-10-12T01:31:00 | integrated-tissue-46 | 1002 | 195368 | 2023-02-24 |
| 1003 | 10966221 | 2024-03-23T08:48:00 | seasonal-tissue-47 | 1003 | dce5fe58-8fcd-11eb-924d-9cd76263cbd0 | 2024-07-08 |

The view `vw_individual_genomic_sample_detail` joins `individuals` to `genomic_samples`, producing a comprehensive record that combines demographic and sample-level information. For the row with individual `4277024` and sample `1562854`, the view presents the person's `baseline-sex-49` classification, `seasonal-insuranc-11` insurance provider, and the sample's `pilot-tissue-44` tissue type with coverage `4.45` in `collected` status. This view answers the question: "What are the full details of each individual's samples?"

**View `vw_individual_genomic_sample_detail`**

```sql
CREATE VIEW vw_individual_genomic_sample_detail AS
SELECT a.id, a.individual_id, a.date_of_birth, b.id AS sample_id, b.sample_id AS sample_sample_id, b.collection_date AS sample_collection_date
FROM individuals a
  JOIN individuals_samples j ON j.individual_id = a.id
  JOIN genomic_samples b ON b.id = j.genomic_sample_id;
```

| id | individual_id | date_of_birth | sample_id | sample_sample_id | sample_collection_date |
|---|---|---|---|---|---|
| 1000 | 4277024 | 2025-04-02 | 1000 | 1562854 | 2025-12-17T11:57:00 |
| 1000 | 4277024 | 2025-04-02 | 1001 | 726043 | 2022-05-01T18:14:00 |
| 1001 | default_chart_a_tax_code_40 | 2022-09-13 | 1001 | 726043 | 2022-05-01T18:14:00 |
| 1001 | default_chart_a_tax_code_40 | 2022-09-13 | 1002 | 89106 | 2023-10-12T01:31:00 |
| 1002 | 195368 | 2023-02-24 | 1002 | 89106 | 2023-10-12T01:31:00 |
| 1002 | 195368 | 2023-02-24 | 1003 | 10966221 | 2024-03-23T08:48:00 |
| 1003 | dce5fe58-8fcd-11eb-924d-9cd76263cbd0 | 2024-07-08 | 1003 | 10966221 | 2024-03-23T08:48:00 |
| 1003 | dce5fe58-8fcd-11eb-924d-9cd76263cbd0 | 2024-07-08 | 1000 | 1562854 | 2025-12-17T11:57:00 |

The view `vw_individual_health_record` joins `individuals` to `health_records`, producing a flat record that pairs each person with their clinical record. For the row with individual `4277024` and record `10449530`, the view reveals that the person's `clinical` record has a completeness score of `19.20` and is marked `public`. This view answers the question: "What health record is associated with each individual?"

**View `vw_individual_health_record`**

```sql
CREATE VIEW vw_individual_health_record AS
SELECT a.id, a.individual_id, a.date_of_birth, a.sex, b.health_record_id AS record_health_record_id, b.record_id AS record_record_id, b.last_updated AS record_last_updated
FROM individuals a JOIN health_records b ON a.health_record_id = b.health_record_id;
```

| id | individual_id | date_of_birth | sex | record_health_record_id | record_record_id | record_last_updated |
|---|---|---|---|---|---|---|
| 1000 | 4277024 | 2025-04-02 | baseline-sex-49 | 1 | 10449530 | 2023-06-17T17:27:00 |
| 1001 | default_chart_a_tax_code_40 | 2022-09-13 | pilot-sex-50 | 2 | 10445619 | 2024-11-01T00:44:00 |
| 1002 | 195368 | 2023-02-24 | extended-sex-51 | 3 | 9568457 | 2025-04-12T07:01:00 |
| 1003 | dce5fe58-8fcd-11eb-924d-9cd76263cbd0 | 2024-07-08 | integrated-sex-52 | 4 | 20743593 | 2022-09-23T14:18:00 |

The view `vw_individual_clinical_program` joins `individuals` to `clinical_programs`, producing a flat record that pairs each person with their enrolled program. For the row with individual `4277024` and program `103176`, the view reveals that the person is enrolled in a `research` program targeting `regional-target-18` that ran from `2022-09-05` to `2022-09-01`. This view answers the question: "Which clinical program is each individual enrolled in?"

**View `vw_individual_clinical_program`**

```sql
CREATE VIEW vw_individual_clinical_program AS
SELECT a.id, a.individual_id, a.date_of_birth, a.sex, b.clinical_program_id AS program_clinical_program_id, b.program_id AS program_program_id, b.start_date AS program_start_date
FROM individuals a JOIN clinical_programs b ON a.clinical_program_id = b.clinical_program_id;
```

| id | individual_id | date_of_birth | sex | program_clinical_program_id | program_program_id | program_start_date |
|---|---|---|---|---|---|---|
| 1000 | 4277024 | 2025-04-02 | baseline-sex-49 | 1000 | 103176 | 2022-09-05T20:24:00 |
| 1001 | default_chart_a_tax_code_40 | 2022-09-13 | pilot-sex-50 | 1001 | 2986219 | 2023-02-16T03:41:00 |
| 1002 | 195368 | 2023-02-24 | extended-sex-51 | 1002 | 1186079 | 2024-07-27T10:58:00 |
| 1003 | dce5fe58-8fcd-11eb-924d-9cd76263cbd0 | 2024-07-08 | integrated-sex-52 | 1003 | 1562855 | 2025-12-11T17:15:00 |

The view `vw_sequencing_assay_genomic_sample` joins `sequencing_assays` to `genomic_samples`, producing a flat record that pairs each assay with its source sample. For the row with assay `6564399` and sample `1562854`, the view reveals that the `whole_genome` assay on `distributed-platform-48` with depth `37` was performed on a `pilot-tissue-44` sample collected on `2025-12-17`. This view answers the question: "Which sample was used for each sequencing assay?"

**View `vw_sequencing_assay_genomic_sample`**

```sql
CREATE VIEW vw_sequencing_assay_genomic_sample AS
SELECT a.sequencing_assay_id, a.assay_id, a.assay_type, a.coverage_depth, b.id AS sample_id, b.sample_id AS sample_sample_id, b.collection_date AS sample_collection_date
FROM sequencing_assays a JOIN genomic_samples b ON a.genomic_sample_id = b.id;
```

| sequencing_assay_id | assay_id | assay_type | coverage_depth | sample_id | sample_sample_id | sample_collection_date |
|---|---|---|---|---|---|---|
| 100 | 6564399 | whole_genome | 37 | 1000 | 1562854 | 2025-12-17T11:57:00 |
| 101 | 9085253 | exome | 44 | 1001 | 726043 | 2022-05-01T18:14:00 |
| 102 | 7645 | targeted | 51 | 1002 | 89106 | 2023-10-12T01:31:00 |
| 103 | 2106692 | whole_genome | 58 | 1003 | 10966221 | 2024-03-23T08:48:00 |

The view `vw_sequencing_assay_genomic_dataset` joins `sequencing_assays` to `genomic_datasets`, producing a flat record that pairs each assay with its resulting dataset. For the row with assay `6564399` and dataset `325443`, the view reveals that the `whole_genome` assay produced a `legacy-format-25` dataset of size `0.74` GB with `open` access. This view answers the question: "Which dataset was produced by each sequencing assay?"

**View `vw_sequencing_assay_genomic_dataset`**

```sql
CREATE VIEW vw_sequencing_assay_genomic_dataset AS
SELECT a.sequencing_assay_id, a.assay_id, a.assay_type, a.coverage_depth, b.id AS dataset_id, b.dataset_id AS dataset_dataset_id, b.format AS dataset_format
FROM sequencing_assays a JOIN genomic_datasets b ON a.genomic_dataset_id = b.id;
```

| sequencing_assay_id | assay_id | assay_type | coverage_depth | dataset_id | dataset_dataset_id | dataset_format |
|---|---|---|---|---|---|---|
| 100 | 6564399 | whole_genome | 37 | 1 | 325443 | legacy-format-25 |
| 101 | 9085253 | exome | 44 | 2 | 4716402 | compact-format-26 |
| 102 | 7645 | targeted | 51 | 3 | 14202 | composite-format-27 |
| 103 | 2106692 | whole_genome | 58 | 4 | 1186088 | primary-format-28 |

The view `vw_genomic_dataset_sequencing_assay` joins `genomic_datasets` to `sequencing_assays`, producing a flat record that pairs each dataset with the assay that produced it. For the row with dataset `325443` and assay `6564399`, the view reveals that the `legacy-format-25` dataset of `0.74` GB was produced by a `whole_genome` assay with depth `37` and status `pending`. This view answers the question: "Which assay produced each genomic dataset?"

**View `vw_genomic_dataset_sequencing_assay`**

```sql
CREATE VIEW vw_genomic_dataset_sequencing_assay AS
SELECT a.id, a.dataset_id, a.format, a.size_g_b, b.sequencing_assay_id AS assay_sequencing_assay_id, b.assay_id AS assay_assay_id, b.assay_type AS assay_assay_type
FROM genomic_datasets a JOIN sequencing_assays b ON a.sequencing_assay_id = b.sequencing_assay_id;
```

| id | dataset_id | format | size_g_b | assay_sequencing_assay_id | assay_assay_id | assay_assay_type |
|---|---|---|---|---|---|---|
| 1 | 325443 | legacy-format-25 | 0.74 | 100 | 6564399 | whole_genome |
| 2 | 4716402 | compact-format-26 | 0.73 | 101 | 9085253 | exome |
| 3 | 14202 | composite-format-27 | 0.286487255225401 | 102 | 7645 | targeted |
| 4 | 1186088 | primary-format-28 | 0.6000001 | 103 | 2106692 | whole_genome |

The view `vw_health_record_individual` joins `health_records` to `individuals`, producing a flat record that pairs each clinical record with its associated person. For the row with record `10449530` and individual `4277024`, the view reveals that the `clinical` record with completeness `19.20` and `public` privacy level belongs to a person with birth date `2025-04-02` who is `active`. This view answers the question: "Which individual is associated with each health record?"

**View `vw_health_record_individual`**

```sql
CREATE VIEW vw_health_record_individual AS
SELECT a.health_record_id, a.record_id, a.last_updated, a.completeness_score, b.id AS individual_id, b.individual_id AS individual_individual_id, b.date_of_birth AS individual_date_of_birth
FROM health_records a JOIN individuals b ON a.individual_id = b.id;
```

| health_record_id | record_id | last_updated | completeness_score | individual_id | individual_individual_id | individual_date_of_birth |
|---|---|---|---|---|---|---|
| 1 | 10449530 | 2023-06-17T17:27:00 | 19.20 | 1000 | 4277024 | 2025-04-02 |
| 2 | 10445619 | 2024-11-01T00:44:00 | 23.40 | 1001 | default_chart_a_tax_code_40 | 2022-09-13 |
| 3 | 9568457 | 2025-04-12T07:01:00 | 27.60 | 1002 | 195368 | 2023-02-24 |
| 4 | 20743593 | 2022-09-23T14:18:00 | 31.80 | 1003 | dce5fe58-8fcd-11eb-924d-9cd76263cbd0 | 2024-07-08 |

The view `vw_health_record_genomic_dataset` joins `health_records` to `genomic_datasets`, producing a flat record that pairs each clinical record with its linked genomic dataset. For the row with record `10449530` and dataset `325443`, the view reveals that the `clinical` record with completeness `19.20` is linked to a `legacy-format-25` dataset of `0.74` GB with `open` access. This view answers the question: "Which genomic dataset is linked to each health record?"

**View `vw_health_record_genomic_dataset`**

```sql
CREATE VIEW vw_health_record_genomic_dataset AS
SELECT a.health_record_id, a.record_id, a.last_updated, a.completeness_score, b.id AS dataset_id, b.dataset_id AS dataset_dataset_id, b.format AS dataset_format
FROM health_records a JOIN genomic_datasets b ON a.genomic_dataset_id = b.id;
```

| health_record_id | record_id | last_updated | completeness_score | dataset_id | dataset_dataset_id | dataset_format |
|---|---|---|---|---|---|---|
| 1 | 10449530 | 2023-06-17T17:27:00 | 19.20 | 1 | 325443 | legacy-format-25 |
| 2 | 10445619 | 2024-11-01T00:44:00 | 23.40 | 2 | 4716402 | compact-format-26 |
| 3 | 9568457 | 2025-04-12T07:01:00 | 27.60 | 3 | 14202 | composite-format-27 |
| 4 | 20743593 | 2022-09-23T14:18:00 | 31.80 | 4 | 1186088 | primary-format-28 |

The view `vw_clinical_program_individual_detail` joins `clinical_programs` to `individuals`, producing a comprehensive record that combines program and individual information. For the row with program `103176` and individual `4277024`, the view presents the `research` program targeting `regional-target-18` alongside the person's `baseline-sex-49` classification, `active` enrollment status, and `seasonal-insuranc-11` insurance provider. This view answers the question: "What are the full details of each individual's clinical program enrollment?"

**View `vw_clinical_program_individual_detail`**

```sql
CREATE VIEW vw_clinical_program_individual_detail AS
SELECT a.clinical_program_id, a.program_id, a.start_date, b.id AS individual_id, b.individual_id AS individual_individual_id, b.date_of_birth AS individual_date_of_birth
FROM clinical_programs a
  JOIN programs_individuals j ON j.clinical_program_id = a.clinical_program_id
  JOIN individuals b ON b.id = j.individual_id;
```

| clinical_program_id | program_id | start_date | individual_id | individual_individual_id | individual_date_of_birth |
|---|---|---|---|---|---|
| 1000 | 103176 | 2022-09-05T20:24:00 | 1000 | 4277024 | 2025-04-02 |
| 1000 | 103176 | 2022-09-05T20:24:00 | 1001 | default_chart_a_tax_code_40 | 2022-09-13 |
| 1001 | 2986219 | 2023-02-16T03:41:00 | 1001 | default_chart_a_tax_code_40 | 2022-09-13 |
| 1001 | 2986219 | 2023-02-16T03:41:00 | 1002 | 195368 | 2023-02-24 |
| 1002 | 1186079 | 2024-07-27T10:58:00 | 1002 | 195368 | 2023-02-24 |
| 1002 | 1186079 | 2024-07-27T10:58:00 | 1003 | dce5fe58-8fcd-11eb-924d-9cd76263cbd0 | 2024-07-08 |
| 1003 | 1562855 | 2025-12-11T17:15:00 | 1003 | dce5fe58-8fcd-11eb-924d-9cd76263cbd0 | 2024-07-08 |
| 1003 | 1562855 | 2025-12-11T17:15:00 | 1000 | 4277024 | 2025-04-02 |

The view `vw_clinical_program_genomic_dataset` joins `clinical_programs` to `genomic_datasets`, producing a flat record that pairs each program with its linked genomic dataset. For the row with program `103176` and dataset `325443`, the view reveals that the `research` program targeting `regional-target-18` is linked to a `legacy-format-25` dataset of `0.74` GB with `open` access. This view answers the question: "Which genomic dataset is associated with each clinical program?"

**View `vw_clinical_program_genomic_dataset`**

```sql
CREATE VIEW vw_clinical_program_genomic_dataset AS
SELECT a.clinical_program_id, a.program_id, a.start_date, a.end_date, b.id AS dataset_id, b.dataset_id AS dataset_dataset_id, b.format AS dataset_format
FROM clinical_programs a JOIN genomic_datasets b ON a.genomic_dataset_id = b.id;
```

| clinical_program_id | program_id | start_date | end_date | dataset_id | dataset_dataset_id | dataset_format |
|---|---|---|---|---|---|---|
| 1000 | 103176 | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | 1 | 325443 | legacy-format-25 |
| 1001 | 2986219 | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | 2 | 4716402 | compact-format-26 |
| 1002 | 1186079 | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | 3 | 14202 | composite-format-27 |
| 1003 | 1562855 | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | 4 | 1186088 | primary-format-28 |

The view `vw_clinical_program_partner_organization` joins `clinical_programs` to `partner_organizations`, producing a flat record that pairs each program with its sponsoring organization. For the row with program `103176` and organization `1`, the view reveals that the `research` program targeting `regional-target-18` is sponsored by the partner organization identified by `1`. This view answers the question: "Which organization sponsors each clinical program?"

**View `vw_clinical_program_partner_organization`**

```sql
CREATE VIEW vw_clinical_program_partner_organization AS
SELECT a.clinical_program_id, a.program_id, a.start_date, a.end_date, b.id AS organization_id, b.org_id AS organization_org_id, b.org_name AS organization_org_name
FROM clinical_programs a JOIN partner_organizations b ON a.partner_organization_id = b.id;
```

| clinical_program_id | program_id | start_date | end_date | organization_id | organization_org_id | organization_org_name |
|---|---|---|---|---|---|---|
| 1000 | 103176 | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | 1 | 790471 | Extended Review |
| 1001 | 2986219 | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | 2 | 1717 | Pilot Initiative A |
| 1002 | 1186079 | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | 3 | 69437 | Baseline Model |
| 1003 | 1562855 | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | 4 | m16 | Distributed Cluster |

The view `vw_partner_organization_clinical_program` joins `partner_organizations` to `clinical_programs`, producing a flat record that pairs each organization with its associated programs. For the row with organization `1` and program `103176`, the view reveals that the partner organization is associated with a `research` program targeting `regional-target-18` that ran from `2022-09-05` to `2022-09-01`. This view answers the question: "Which clinical programs is each partner organization involved in?"

**View `vw_partner_organization_clinical_program`**

```sql
CREATE VIEW vw_partner_organization_clinical_program AS
SELECT a.id, a.org_id, a.org_name, a.sector, b.clinical_program_id AS program_clinical_program_id, b.program_id AS program_program_id, b.start_date AS program_start_date
FROM partner_organizations a JOIN clinical_programs b ON a.clinical_program_id = b.clinical_program_id;
```

| id | org_id | org_name | sector | program_clinical_program_id | program_program_id | program_start_date |
|---|---|---|---|---|---|---|
| 1 | 790471 | Extended Review | pharmaceutical | 1000 | 103176 | 2022-09-05T20:24:00 |
| 2 | 1717 | Pilot Initiative A | biotechnology | 1001 | 2986219 | 2023-02-16T03:41:00 |
| 3 | 69437 | Baseline Model | insurance | 1002 | 1186079 | 2024-07-27T10:58:00 |
| 4 | m16 | Distributed Cluster | academic | 1003 | 1562855 | 2025-12-11T17:15:00 |

The view `vw_partner_organization_genomic_dataset` joins `partner_organizations` to `genomic_datasets` through the clinical program intermediary, producing a flat record that pairs each organization with the genomic datasets associated with its programs. For the row with organization `1` and dataset `325443`, the view reveals that the partner organization is associated with a `legacy-format-25` dataset of `0.74` GB with `open` access, produced by a `whole_genome` assay. This view answers the question: "Which genomic datasets are associated with each partner organization?"

**View `vw_partner_organization_genomic_dataset`**

```sql
CREATE VIEW vw_partner_organization_genomic_dataset AS
SELECT a.id, a.org_id, a.org_name, a.sector, b.id AS dataset_id, b.dataset_id AS dataset_dataset_id, b.format AS dataset_format
FROM partner_organizations a JOIN genomic_datasets b ON a.genomic_dataset_id = b.id;
```

| id | org_id | org_name | sector | dataset_id | dataset_dataset_id | dataset_format |
|---|---|---|---|---|---|---|
| 1 | 790471 | Extended Review | pharmaceutical | 1 | 325443 | legacy-format-25 |
| 2 | 1717 | Pilot Initiative A | biotechnology | 2 | 4716402 | compact-format-26 |
| 3 | 69437 | Baseline Model | insurance | 3 | 14202 | composite-format-27 |
| 4 | m16 | Distributed Cluster | academic | 4 | 1186088 | primary-format-28 |

The schema design reflects a deliberate trade-off between normalization and query convenience. The seven base tables enforce data integrity through foreign key constraints and eliminate redundancy by storing each entity's attributes in a single location. The two junction tables resolve many-to-many relationships without introducing denormalization. The twenty materialized views provide denormalized projections that answer common analytical questions without requiring users to write join logic. Each view is a deterministic reconstruction of domain facts from the normalized tables, and the join conditions encode the same foreign key relationships that the base tables enforce. This architecture ensures that the schema is both a reliable store of truth and a practical interface for downstream analysis.