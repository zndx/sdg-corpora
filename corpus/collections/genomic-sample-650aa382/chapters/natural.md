## Genomic Data Management in Clinical Research Programs

Modern clinical genomics relies on the systematic collection, processing, and analysis of biological specimens from enrolled participants. A research program tracks individuals through enrollment, collects tissue samples, subjects those samples to sequencing assays, and stores the resulting genomic datasets alongside health records and program metadata. The data model captures this pipeline end-to-end: from the moment a participant consents into a clinical program, through sample collection and laboratory processing, to the generation of analyzable datasets that feed back into health records and program reporting. Understanding how each stage connects to the next is essential for anyone managing genomic data at scale.

## Specimen Collection and Participant Enrollment

The foundation of any genomic study begins with the individual participant. The `individuals` table records demographic and administrative information for each enrolled person, including a unique `individual_id`, `date_of_birth`, `sex`, `enrollment_status`, and the `insurance_provider` covering their care. Statuses range from `active` to `withdrawn` and `deceased`, reflecting the dynamic nature of long-running studies. Each individual is also linked to a `health_record_id` and a `clinical_program_id`, anchoring them to both their medical history and the specific research initiative they joined.

**Table `individuals`**

| id | individual_id | date_of_birth | sex | enrollment_status | insurance_provider | health_record_id | clinical_program_id |
|---|---|---|---|---|---|---|---|
| 1000 | 4277024 | 2025-04-02 | baseline-sex-49 | active | seasonal-insuranc-11 | 1 | 1000 |
| 1001 | default_chart_a_tax_code_40 | 2022-09-13 | pilot-sex-50 | withdrawn | regional-insuranc-12 | 2 | 1001 |
| 1002 | 195368 | 2023-02-24 | extended-sex-51 | deceased | legacy-insuranc-13 | 3 | 1002 |
| 1003 | dce5fe58-8fcd-11eb-924d-9cd76263cbd0 | 2024-07-08 | integrated-sex-52 | active | compact-insuranc-14 | 4 | 1003 |

For example, individual `4277024` (record id `1000`) was born on `2025-04-02`, has an `active` enrollment status, and is covered by `seasonal-insuranc-11`. They are enrolled in clinical program `1000` and have health record `1`. In contrast, individual `default_chart_a_tax_code_40` (record id `1001`) has a `withdrawn` status and is associated with `regional-insuranc-12`, illustrating how the system accommodates participants who leave the study.

Participants contribute biological material through the `individuals_samples` linkage table, which maps individuals to the specific tissue samples they donate. This many-to-many relationship supports scenarios where a single individual provides multiple samples over time or across different collection events.

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

The `genomic_samples` table then holds the detailed specimen records themselves. Each sample carries a `sample_id`, a `collection_date` with full timestamp precision, a `tissue_type` describing the biological source, a `sequencing_coverage` value indicating the depth of coverage achieved, and a `sample_status` reflecting its current stage in the pipeline — `collected`, `processed`, `sequenced`, or `archived`.

**Table `genomic_samples`**

| id | sample_id | collection_date | tissue_type | sequencing_coverage | sample_status | sequencing_assay_id | individual_id |
|---|---|---|---|---|---|---|---|
| 1000 | 1562854 | 2025-12-17T11:57:00 | pilot-tissue-44 | 4.45 | collected | 100 | 1000 |
| 1001 | 726043 | 2022-05-01T18:14:00 | extended-tissue-45 | 8.90 | processed | 101 | 1001 |
| 1002 | 89106 | 2023-10-12T01:31:00 | integrated-tissue-46 | 13.35 | sequenced | 102 | 1002 |
| 1003 | 10966221 | 2024-03-23T08:48:00 | seasonal-tissue-47 | 17.80 | archived | 103 | 1003 |

Sample `1562854` (record id `1000`) was collected on `2025-12-17T11:57:00` as `pilot-tissue-44` with a sequencing coverage of `4.45` and is currently in `collected` status. Sample `89106` (record id `1002`) reached `sequenced` status with a coverage of `13.35`, demonstrating the progression through the pipeline. Each sample is linked to both an `individual_id` and a `sequencing_assay_id`, connecting the biological material to the participant and the laboratory procedure applied to it.

## Sequencing Assays and Data Generation

Once a sample is prepared, it undergoes a sequencing assay. The `sequencing_assays` table documents each laboratory run, recording an `assay_id`, the `assay_type` (such as `whole_genome`, `exome`, or `targeted`), the `coverage_depth` achieved, the `platform` used for sequencing, and the `result_status` — `pending`, `running`, `complete`, or `failed`. Each assay is tied to a specific `genomic_sample_id` and produces a `genomic_dataset_id`.

**Table `sequencing_assays`**

| sequencing_assay_id | assay_id | assay_type | coverage_depth | platform | result_status | genomic_sample_id | genomic_dataset_id | created_at |
|---|---|---|---|---|---|---|---|---|
| 100 | 6564399 | whole_genome | 37 | distributed-platform-48 | pending | 1000 | 1 | 2025-01-01 00:14:00 |
| 101 | 9085253 | exome | 44 | baseline-platform-49 | running | 1001 | 2 | 2025-02-06 03:14:00 |
| 102 | 7645 | targeted | 51 | pilot-platform-50 | complete | 1002 | 3 | 2025-03-11 06:14:00 |
| 103 | 2106692 | whole_genome | 58 | extended-platform-51 | failed | 1003 | 4 | 2025-04-16 09:14:00 |

Assay `6564399` (record id `100`) is a `whole_genome` run performed on `distributed-platform-48` with a coverage depth of `37`. Its result status is `pending`, indicating the assay has been initiated but not yet finalized. Assay `7645` (record id `102`) is a `targeted` assay with coverage depth `51` that has reached `complete` status, showing a successfully finished run.

The output of each assay is stored as a genomic dataset. The `genomic_datasets` table captures the `dataset_id`, `format` of the stored data, `size_g_b` in gigabytes, `upload_date`, `access_level` (such as `open`, `restricted`, or `controlled`), and timestamps for when the dataset was created and last updated.

**Table `genomic_datasets`**

| id | dataset_id | format | size_g_b | upload_date | access_level | sequencing_assay_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|
| 1 | 325443 | legacy-format-25 | 0.74 | 2022-05-23T04:36:00 | open | 100 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | 4716402 | compact-format-26 | 0.73 | 2023-10-07T11:53:00 | restricted | 101 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | 14202 | composite-format-27 | 0.286487255225401 | 2024-03-18T18:10:00 | controlled | 102 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | 1186088 | primary-format-28 | 0.6000001 | 2025-08-02T01:27:00 | open | 103 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Dataset `325443` (record id `1`) uses `legacy-format-25`, is `0.74` GB in size, has an `open` access level, and was uploaded on `2022-05-23T04:36:00`. Dataset `14202` (record id `3`) is smaller at `0.286` GB, uses `composite-format-27`, and carries a `controlled` access level, reflecting the varying sensitivity and regulatory requirements across different datasets.

## Health Records and Clinical Programs

Genomic data does not exist in isolation; it is contextualized by the health records of the individuals who contributed samples. The `health_records` table stores `record_id`, `last_updated` timestamps, a `completeness_score` quantifying how thoroughly the record has been populated, `record_type` (such as `clinical`, `phenotypic`, `behavioral`, or `integrated`), and a `privacy_level` (such as `public`, `de-identified`, or `restricted`). Each record is linked to an `individual_id` and a `genomic_dataset_id`, creating a direct bridge between clinical observations and genomic findings.

**Table `health_records`**

| health_record_id | record_id | last_updated | completeness_score | record_type | privacy_level | individual_id | genomic_dataset_id |
|---|---|---|---|---|---|---|---|
| 1 | 10449530 | 2023-06-17T17:27:00 | 19.20 | clinical | public | 1000 | 1 |
| 2 | 10445619 | 2024-11-01T00:44:00 | 23.40 | phenotypic | de-identified | 1001 | 2 |
| 3 | 9568457 | 2025-04-12T07:01:00 | 27.60 | behavioral | restricted | 1002 | 3 |
| 4 | 20743593 | 2022-09-23T14:18:00 | 31.80 | integrated | public | 1003 | 4 |

Health record `10449530` (record id `1`) is of `clinical` type, has a `completeness_score` of `19.20`, is marked `public`, and is associated with individual `1000` and genomic dataset `1`. Health record `9568457` (record id `3`) is `behavioral` in type, has a higher `completeness_score` of `27.60`, and carries a `restricted` privacy level, illustrating how different record types carry different sensitivity classifications.

All of this activity is organized under `clinical_programs`. Each program has a `program_id`, defined `start_date` and `end_date`, a `program_type` (such as `research`, `diagnostic`, or `therapeutic`), a `target_disease` specification, and links to both a `genomic_dataset_id` and a `partner_organization_id`.

**Table `clinical_programs`**

| clinical_program_id | program_id | start_date | end_date | program_type | target_disease | genomic_dataset_id | partner_organization_id |
|---|---|---|---|---|---|---|---|
| 1000 | 103176 | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | research | regional-target-18 | 1 | 1 |
| 1001 | 2986219 | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | diagnostic | legacy-target-19 | 2 | 2 |
| 1002 | 1186079 | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | therapeutic | compact-target-20 | 3 | 3 |
| 1003 | 1562855 | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | research | composite-target-21 | 4 | 4 |

Program `103176` (record id `1000`) is a `research` program targeting `regional-target-18`, running from `2022-09-05T20:24:00` to `2022-09-01T08:00:00`, and is associated with genomic dataset `1` and partner organization `1`. Program `1186079` (record id `1002`) is a `therapeutic` program targeting `compact-target-20`, demonstrating the range of program types within the system.

The `partner_organizations` table records the external institutions collaborating on these programs. Each organization has an `organization_id`, `name`, `type`, `country`, and `contact_email`.

**Table `partner_organizations`**

| id | org_id | org_name | sector | contract_start_date | contract_end_date | clinical_program_id | genomic_dataset_id |
|---|---|---|---|---|---|---|---|
| 1 | 790471 | Extended Review | pharmaceutical | 2022-01-26T12:36:00 | 2025-12-07T23:09:00 | 1000 | 1 |
| 2 | 1717 | Pilot Initiative A | biotechnology | 2023-06-10T19:53:00 | 2022-05-18T06:26:00 | 1001 | 2 |
| 3 | 69437 | Baseline Model | insurance | 2024-11-21T02:10:00 | 2023-10-02T13:43:00 | 1002 | 3 |
| 4 | m16 | Distributed Cluster | academic | 2025-04-05T09:27:00 | 2024-03-13T20:00:00 | 1003 | 4 |

The `programs_individuals` table links individuals to the clinical programs they participate in, supporting the many-to-many relationship between participants and programs.

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

## View-Based Data Integration

The base tables capture discrete entities, but the operational questions of genomic research require joined perspectives. The views synthesize these entities into actionable records.

The view `vw_genomic_sample_sequencing_assay` joins genomic samples with their corresponding sequencing assays, answering which laboratory procedures were applied to which specimens.

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

In this view, sample `1562854` appears alongside assay `6564399` (a `whole_genome` run with coverage depth `37` on `distributed-platform-48`), showing the direct mapping from biological material to laboratory procedure.

The view `vw_genomic_sample_individual` connects samples back to the individuals who donated them, answering which participant contributed which specimen.

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

Sample `1562854` links to individual `4277024` with `active` enrollment status, providing immediate traceability from specimen to donor.

The view `vw_individual_genomic_sample_detail` enriches the individual-sample link with full sample metadata, answering what the complete profile of a participant's samples looks like.

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

Individual `4277024` is shown with sample `1562854` of type `pilot-tissue-44`, collected on `2025-12-17T11:57:00` with coverage `4.45` and `collected` status, giving a complete picture of that participant's contribution.

The view `vw_individual_health_record` joins individuals with their health records, answering what clinical data exists for each participant.

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

Individual `4277024` is linked to health record `10449530` of `clinical` type with a `completeness_score` of `19.20` and `public` privacy level, connecting the person to their medical documentation.

The view `vw_individual_clinical_program` links individuals to the clinical programs they are enrolled in, answering which research initiatives each participant is part of.

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

Individual `4277024` is enrolled in program `103176`, a `research` program targeting `regional-target-18`, showing the programmatic context of their participation.

The view `vw_sequencing_assay_genomic_sample` presents the assay-centric perspective, answering which samples were processed by each sequencing run.

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

Assay `6564399` is shown with sample `1562854` of type `pilot-tissue-44`, providing the laboratory's view of specimen processing.

The view `vw_sequencing_assay_genomic_dataset` connects assays to their resulting datasets, answering which data products each laboratory run generated.

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

Assay `6564399` produced dataset `325443` in `legacy-format-25` format, sized at `0.74` GB with `open` access, showing the output of the sequencing procedure.

The view `vw_genomic_dataset_sequencing_assay` reverses this relationship, answering which assay produced each dataset.

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

Dataset `325443` is traced back to assay `6564399`, a `whole_genome` run with coverage depth `37`, providing provenance for the data product.

The view `vw_health_record_individual` presents the health record-centric perspective, answering which individual each clinical record belongs to.

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

Health record `10449530` is linked to individual `4277024` with `active` status, connecting clinical documentation to the participant.

The view `vw_health_record_genomic_dataset` joins health records with their associated genomic datasets, answering which genomic data is linked to each clinical record.

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

Health record `10449530` is associated with genomic dataset `325443` in `legacy-format-25` format, showing the integration point between clinical and genomic data.

The view `vw_clinical_program_individual_detail` provides a detailed view of individuals within each clinical program, answering who participates in which initiative with full context.

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

Program `103176` includes individual `4277024` with `active` enrollment, linking the participant's status to the program's scope.

The view `vw_clinical_program_genomic_dataset` connects clinical programs to their associated genomic datasets, answering which data products each program relies on.

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

Program `103176` is linked to dataset `325443` with `open` access level, showing the data resources supporting each research initiative.

The view `vw_clinical_program_partner_organization` links clinical programs to their partner organizations, answering which institutions collaborate on each program.

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

Program `103176` is associated with partner organization `1`, establishing the institutional partnerships behind the research.

The view `vw_partner_organization_clinical_program` presents the organization-centric perspective, answering which programs each partner institution supports.

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

Partner organization `1` supports program `103176`, a `research` program targeting `regional-target-18`, showing the institutional involvement.

The view `vw_partner_organization_genomic_dataset` connects partner organizations to the genomic datasets produced under their programs, answering which data products are associated with each partner.

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

Partner organization `1` is linked to dataset `325443` in `legacy-format-25` format, completing the chain from institutional partner through program to data product.

## Synthesis

The genomic data management system described here captures the full lifecycle of a clinical genomics study. Individuals enroll in clinical programs run in partnership with external organizations. They contribute tissue samples that are collected, processed, and sequenced under defined assays. The resulting datasets are stored with metadata about format, size, and access controls, and are linked back to both the health records of the contributing individuals and the programs that generated them. The base tables record each entity in isolation, while the views provide the joined perspectives needed for operational questions — which samples belong to which participants, which assays produced which datasets, which programs rely on which data, and which organizations support which initiatives. Together, these records form a coherent, traceable pipeline from consent to data product, enabling researchers and administrators to navigate the complex relationships that define modern genomic research.