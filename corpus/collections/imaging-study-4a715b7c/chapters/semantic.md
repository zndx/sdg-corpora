# Chapter: Modelling a Thoracic Imaging Registry as a Relational Schema

This chapter presents a complete ontology-grounded walkthrough of how a fictional thoracic imaging registry is modelled as a relational database. It explains which entity types exist, how their attributes and cardinality-bounded relationships become columns, foreign keys, and junction tables, and how each materialised view reconstructs a domain fact from the normalised tables. All data described herein is entirely fictional.

## 1. Entity Types and Their Attributes

The domain centres on five core entity types: **imaging studies**, **radiologists**, **hospital campuses**, **thoracic procedures**, and **post-processing software**. Each entity type is represented by a dedicated table whose columns capture the entity's intrinsic attributes.

### 1.1 Imaging Studies

The `imaging_studies` table is the central fact table of the registry. It records every diagnostic imaging event with the following columns:

- `id` — a surrogate primary key (e.g. `1`, `2`, `3`, `4`).
- `study_identifier` — a human-readable code such as `STU-2431` or `STU-2440`.
- `modality` — the imaging technique, drawn from values like `radiography`, `CT`, and `MRI`.
- `study_date` — an ISO-8601 timestamp, for example `2024-11-08T10:06:00`.
- `body_region` — a coded anatomical region such as `pilot-body-26` or `extended-body-27`.
- `status` — the lifecycle state of the study, one of `pending`, `in_progress`, `complete`, or `archived`.
- `contrast_used` — a boolean flag indicating whether contrast agent was administered.
- `campus_code` — a foreign key referencing the `hospital_campuses` table.
- `radiologist_id` — a foreign key referencing the `radiologists` table.
- `post_processing_software_id` — a foreign key referencing the `post_processing_softwares` table.

**Table `imaging_studies`**

| id | study_identifier | modality | study_date | body_region | status | contrast_used | campus_code | radiologist_id | post_processing_software_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | STU-2431 | radiography | 2024-11-08T10:06:00 | pilot-body-26 | pending | true | 6969438 | 1000 | 100 |
| 2 | STU-2434 | CT | 2025-04-19T17:23:00 | extended-body-27 | in_progress | false | 9736889 | 1001 | 101 |
| 3 | STU-2437 | MRI | 2022-09-03T00:40:00 | integrated-body-28 | complete | true | 727050 | 1002 | 102 |
| 4 | STU-2440 | radiography | 2023-02-14T07:57:00 | seasonal-body-29 | archived | false | 89008 | 1003 | 103 |

### 1.2 Radiologists

The `radiologists` table stores each physician's profile:

- `id` — surrogate primary key (e.g. `1000`, `1001`, `1002`, `1003`).
- `physician_identifier` — a unique code such as `PHY-2099` or `PHY-2105`.
- `full_name` — the physician's name, for instance `Theodore Mcgrath` or `Norma Fisher`.
- `certification_body` — the issuing authority, e.g. `integrated-certific-58`.
- `specialization` — the clinical focus area, such as `legacy-speciali-13`.
- `employment_status` — one of `full_time`, `part_time`, or `fellowship_trained`.
- `bilingual` — a boolean flag.
- `campus_code` — a foreign key to `hospital_campuses`.
- `thoracic_procedure_id` — a foreign key to `thoracic_procedures`.

**Table `radiologists`**

| id | physician_identifier | full_name | certification_body | specialization | employment_status | bilingual | campus_code | thoracic_procedure_id |
|---|---|---|---|---|---|---|---|---|
| 1000 | PHY-2099 | Theodore Mcgrath | integrated-certific-58 | legacy-speciali-13 | full_time | false | 6969438 | 100 |
| 1001 | PHY-2101 | Account Name | seasonal-certific-59 | compact-speciali-14 | part_time | true | 9736889 | 101 |
| 1002 | PHY-2103 | Saipan International Airport | regional-certific-60 | composite-speciali-15 | fellowship_trained | false | 727050 | 102 |
| 1003 | PHY-2105 | Norma Fisher | legacy-certific-61 | primary-speciali-16 | full_time | true | 89008 | 103 |

### 1.3 Hospital Campuses

The `hospital_campuses` table captures each physical site:

- `campus_code` — the primary key, a numeric code such as `6969438` or `89008`.
- `campus_name` — a descriptive label like `Integrated Assessment A` or `Baseline Series D`.
- `bed_capacity` — an integer (e.g. `23`, `35`).
- `trauma_level` — an integer classification (e.g. `23`, `47`).
- `location` — a coded location string such as `extended-location-99`.
- `imaging_study_id` — a foreign key to `imaging_studies`.
- `radiologist_id` — a foreign key to `radiologists`.
- `thoracic_procedure_id` — a foreign key to `thoracic_procedures`.

**Table `hospital_campuses`**

| campus_code | campus_name | bed_capacity | trauma_level | location | imaging_study_id | radiologist_id | thoracic_procedure_id |
|---|---|---|---|---|---|---|---|
| 6969438 | Integrated Assessment A | 23 | 23 | extended-location-99 | 1 | 1000 | 100 |
| 9736889 | Extended Survey | 27 | 31 | integrated-location-100 | 2 | 1001 | 101 |
| 727050 | Pilot Corridor | 31 | 39 | seasonal-location-101 | 3 | 1002 | 102 |
| 89008 | Baseline Series D | 35 | 47 | regional-location-102 | 4 | 1003 | 103 |

### 1.4 Thoracic Procedures

The `thoracic_procedures` table records each interventional procedure:

- `thoracic_procedure_id` — the primary key (e.g. `100`, `103`).
- `procedure_code` — a code such as `3990183` or a UUID-like string `1c87986a-8fcd-11eb-924d-9cd76263cbd0`.
- `procedure_name` — a label like `Integrated Protocol A` or `Baseline Framework D`.
- `procedure_date` — an ISO-8601 timestamp, e.g. `2022-05-19T04:48:00`.
- `invasiveness_level` — one of `minimally_invasive`, `non_invasive`, `surgical`, or `cancelled`.
- `status` — the procedural status, e.g. `scheduled` or `completed`.
- `radiologist_id` — a foreign key to `radiologists`.
- `campus_code` — a foreign key to `hospital_campuses`.
- `imaging_study_id` — a foreign key to `imaging_studies`.

**Table `thoracic_procedures`**

| thoracic_procedure_id | procedure_code | procedure_name | procedure_date | invasiveness_level | status | radiologist_id | campus_code | imaging_study_id |
|---|---|---|---|---|---|---|---|---|
| 100 | 3990183 | Integrated Protocol A | 2022-05-19T04:48:00 | minimally_invasive | scheduled | 1000 | 6969438 | 1 |
| 101 | 10782181 | Extended Programme | 2023-10-03T11:05:00 | non_invasive | completed | 1001 | 9736889 | 2 |
| 102 | account_pymes_663 | Pilot Standard | 2024-03-14T18:22:00 | surgical | cancelled | 1002 | 727050 | 3 |
| 103 | 1c87986a-8fcd-11eb-924d-9cd76263cbd0 | Baseline Framework D | 2025-08-25T01:39:00 | minimally_invasive | scheduled | 1003 | 89008 | 4 |

### 1.5 Post-Processing Software

The `post_processing_softwares` table tracks the software tools used for image analysis:

- `post_processing_software_id` — the primary key (e.g. `100`, `103`).
- `software_name` — a name such as `Primary Review A` or `Legacy Cluster D`.
- `version` — a version string like `seasonal-version-71`.
- `vendor` — the vendor name, e.g. `Feedback Ratings` or `Whatsapp Inc.`.
- `license_status` — one of `active`, `expired`, or `trial`.
- `imaging_study_id` — a foreign key to `imaging_studies`.

**Table `post_processing_softwares`**

| post_processing_software_id | software_name | version | vendor | license_status | imaging_study_id |
|---|---|---|---|---|---|
| 100 | Primary Review A | seasonal-version-71 | Feedback Ratings | active | 1 |
| 101 | Composite Initiative | regional-version-72 | Abbott Laboratories | expired | 2 |
| 102 | Compact Model | legacy-version-73 | American Express | trial | 3 |
| 103 | Legacy Cluster D | compact-version-74 | Whatsapp Inc. | active | 4 |

## 2. Cardinality-Bounded Relationships and the Junction Table

Most relationships in this schema are cardinality-bounded: each imaging study is associated with exactly one campus, one radiologist, and one post-processing software, as encoded by the foreign-key columns `campus_code`, `radiologist_id`, and `post_processing_software_id` within `imaging_studies`. Similarly, each hospital campus, thoracic procedure, and radiologist row carries foreign keys pointing to the other entity tables.

However, the relationship between radiologists and imaging studies is many-to-many: a single radiologist may be assigned to multiple studies, and a single study may involve multiple radiologists. This relationship is materialised by the junction table `radiologists_studies`, which contains only two columns:

- `radiologist_id` — a foreign key to `radiologists`.
- `imaging_study_id` — a foreign key to `imaging_studies`.

**Table `radiologists_studies`**

| radiologist_id | imaging_study_id |
|---|---|
| 1000 | 1 |
| 1000 | 2 |
| 1001 | 2 |
| 1001 | 3 |
| 1002 | 3 |
| 1002 | 4 |
| 1003 | 4 |
| 1003 | 1 |

The `radiologists_studies` table breaks the many-to-many relationship into two one-to-many relationships: one radiologist can appear in multiple rows (e.g. radiologist `1000` is linked to studies `1` and `2`), and one study can appear in multiple rows (e.g. study `1` is linked to radiologists `1000` and `1003`). This normalisation avoids data redundancy and enforces referential integrity.

## 3. Foreign-Key Topology

The foreign-key graph of the schema can be summarised as follows:

- `imaging_studies.campus_code` → `hospital_campuses.campus_code`
- `imaging_studies.radiologist_id` → `radiologists.id`
- `imaging_studies.post_processing_software_id` → `post_processing_softwares.post_processing_software_id`
- `hospital_campuses.imaging_study_id` → `imaging_studies.id`
- `hospital_campuses.radiologist_id` → `radiologists.id`
- `hospital_campuses.thoracic_procedure_id` → `thoracic_procedures.thoracic_procedure_id`
- `radiologists.campus_code` → `hospital_campuses.campus_code`
- `radiologists.thoracic_procedure_id` → `thoracic_procedures.thoracic_procedure_id`
- `thoracic_procedures.radiologist_id` → `radiologists.id`
- `thoracic_procedures.campus_code` → `hospital_campuses.campus_code`
- `thoracic_procedures.imaging_study_id` → `imaging_studies.id`
- `post_processing_softwares.imaging_study_id` → `imaging_studies.id`
- `radiologists_studies.radiologist_id` → `radiologists.id`
- `radiologists_studies.imaging_study_id` → `imaging_studies.id`

Every foreign key is cardinality-bounded: each referencing row points to at most one target row. The junction table `radiologists_studies` is the sole exception, providing the many-to-many link between radiologists and imaging studies.

## 4. Materialised Views: Reconstructing Domain Facts

The schema provides twelve materialised views, each of which joins two or three tables to reconstruct a specific domain fact. Every view uses a simple `JOIN` on the appropriate foreign-key columns. The views are described below in logical groupings.

### 4.1 Views Originating from Imaging Studies

The view `imaging_study_hospital_campus_view` joins `imaging_studies` to `hospital_campuses` on `campus_code`, producing columns `id`, `study_identifier`, `modality`, `study_date`, `campus_campus_code`, `campus_campus_name`, and `campus_bed_capacity`. For example, study `STU-2431` (modality `radiography`) is linked to campus `6969438` (`Integrated Assessment A`, `23` beds).

**View `imaging_study_hospital_campus_view`**

```sql
CREATE VIEW imaging_study_hospital_campus_view AS
SELECT a.id, a.study_identifier, a.modality, a.study_date, b.campus_code AS campus_campus_code, b.campus_name AS campus_campus_name, b.bed_capacity AS campus_bed_capacity
FROM imaging_studies a JOIN hospital_campuses b ON a.campus_code = b.campus_code;
```

| id | study_identifier | modality | study_date | campus_campus_code | campus_campus_name | campus_bed_capacity |
|---|---|---|---|---|---|---|
| 1 | STU-2431 | radiography | 2024-11-08T10:06:00 | 6969438 | Integrated Assessment A | 23 |
| 2 | STU-2434 | CT | 2025-04-19T17:23:00 | 9736889 | Extended Survey | 27 |
| 3 | STU-2437 | MRI | 2022-09-03T00:40:00 | 727050 | Pilot Corridor | 31 |
| 4 | STU-2440 | radiography | 2023-02-14T07:57:00 | 89008 | Baseline Series D | 35 |

The view `imaging_study_radiologist_view` joins `imaging_studies` to `radiologists` on `radiologist_id`, yielding `id`, `study_identifier`, `modality`, `study_date`, `radiologist_id`, `radiologist_physician_identifier`, and `radiologist_full_name`. Study `STU-2431` is associated with radiologist `1000` (`PHY-2099`, `Theodore Mcgrath`).

**View `imaging_study_radiologist_view`**

```sql
CREATE VIEW imaging_study_radiologist_view AS
SELECT a.id, a.study_identifier, a.modality, a.study_date, b.id AS radiologist_id, b.physician_identifier AS radiologist_physician_identifier, b.full_name AS radiologist_full_name
FROM imaging_studies a JOIN radiologists b ON a.radiologist_id = b.id;
```

| id | study_identifier | modality | study_date | radiologist_id | radiologist_physician_identifier | radiologist_full_name |
|---|---|---|---|---|---|---|
| 1 | STU-2431 | radiography | 2024-11-08T10:06:00 | 1000 | PHY-2099 | Theodore Mcgrath |
| 2 | STU-2434 | CT | 2025-04-19T17:23:00 | 1001 | PHY-2101 | Account Name |
| 3 | STU-2437 | MRI | 2022-09-03T00:40:00 | 1002 | PHY-2103 | Saipan International Airport |
| 4 | STU-2440 | radiography | 2023-02-14T07:57:00 | 1003 | PHY-2105 | Norma Fisher |

The view `imaging_study_post_processing_software_view` joins `imaging_studies` to `post_processing_softwares` on `post_processing_software_id`, producing `id`, `study_identifier`, `modality`, `study_date`, `software_post_processing_software_id`, `software_software_name`, and `software_version`. Study `STU-2431` uses software `100` (`Primary Review A`, version `seasonal-version-71`).

**View `imaging_study_post_processing_software_view`**

```sql
CREATE VIEW imaging_study_post_processing_software_view AS
SELECT a.id, a.study_identifier, a.modality, a.study_date, b.post_processing_software_id AS software_post_processing_software_id, b.software_name AS software_software_name, b.version AS software_version
FROM imaging_studies a JOIN post_processing_softwares b ON a.post_processing_software_id = b.post_processing_software_id;
```

| id | study_identifier | modality | study_date | software_post_processing_software_id | software_software_name | software_version |
|---|---|---|---|---|---|---|
| 1 | STU-2431 | radiography | 2024-11-08T10:06:00 | 100 | Primary Review A | seasonal-version-71 |
| 2 | STU-2434 | CT | 2025-04-19T17:23:00 | 101 | Composite Initiative | regional-version-72 |
| 3 | STU-2437 | MRI | 2022-09-03T00:40:00 | 102 | Compact Model | legacy-version-73 |
| 4 | STU-2440 | radiography | 2023-02-14T07:57:00 | 103 | Legacy Cluster D | compact-version-74 |

### 4.2 Views Originating from Radiologists

The view `radiologist_hospital_campus_view` joins `radiologists` to `hospital_campuses` on `campus_code`, returning `id`, `physician_identifier`, `full_name`, `certification_body`, `campus_campus_code`, `campus_campus_name`, and `campus_bed_capacity`. Radiologist `1000` (`Theodore Mcgrath`, `integrated-certific-58`) is assigned to campus `6969438` (`Integrated Assessment A`).

**View `radiologist_hospital_campus_view`**

```sql
CREATE VIEW radiologist_hospital_campus_view AS
SELECT a.id, a.physician_identifier, a.full_name, a.certification_body, b.campus_code AS campus_campus_code, b.campus_name AS campus_campus_name, b.bed_capacity AS campus_bed_capacity
FROM radiologists a JOIN hospital_campuses b ON a.campus_code = b.campus_code;
```

| id | physician_identifier | full_name | certification_body | campus_campus_code | campus_campus_name | campus_bed_capacity |
|---|---|---|---|---|---|---|
| 1000 | PHY-2099 | Theodore Mcgrath | integrated-certific-58 | 6969438 | Integrated Assessment A | 23 |
| 1001 | PHY-2101 | Account Name | seasonal-certific-59 | 9736889 | Extended Survey | 27 |
| 1002 | PHY-2103 | Saipan International Airport | regional-certific-60 | 727050 | Pilot Corridor | 31 |
| 1003 | PHY-2105 | Norma Fisher | legacy-certific-61 | 89008 | Baseline Series D | 35 |

The view `radiologist_imaging_study_detail_view` is a three-table join: `radiologists` → `radiologists_studies` → `imaging_studies`. It reconstructs the full assignment matrix between radiologists and studies, producing `id`, `physician_identifier`, `full_name`, `study_id`, `study_study_identifier`, and `study_modality`. Radiologist `1000` (`Theodore Mcgrath`) is assigned to studies `1` (`STU-2431`, `radiography`) and `2` (`STU-2434`, `CT`).

**View `radiologist_imaging_study_detail_view`**

```sql
CREATE VIEW radiologist_imaging_study_detail_view AS
SELECT a.id, a.physician_identifier, a.full_name, b.id AS study_id, b.study_identifier AS study_study_identifier, b.modality AS study_modality
FROM radiologists a
  JOIN radiologists_studies j ON j.radiologist_id = a.id
  JOIN imaging_studies b ON b.id = j.imaging_study_id;
```

| id | physician_identifier | full_name | study_id | study_study_identifier | study_modality |
|---|---|---|---|---|---|
| 1000 | PHY-2099 | Theodore Mcgrath | 1 | STU-2431 | radiography |
| 1000 | PHY-2099 | Theodore Mcgrath | 2 | STU-2434 | CT |
| 1001 | PHY-2101 | Account Name | 2 | STU-2434 | CT |
| 1001 | PHY-2101 | Account Name | 3 | STU-2437 | MRI |
| 1002 | PHY-2103 | Saipan International Airport | 3 | STU-2437 | MRI |
| 1002 | PHY-2103 | Saipan International Airport | 4 | STU-2440 | radiography |
| 1003 | PHY-2105 | Norma Fisher | 4 | STU-2440 | radiography |
| 1003 | PHY-2105 | Norma Fisher | 1 | STU-2431 | radiography |

The view `radiologist_thoracic_procedure_view` joins `radiologists` to `thoracic_procedures` on `thoracic_procedure_id`, yielding `id`, `physician_identifier`, `full_name`, `certification_body`, `procedure_thoracic_procedure_id`, `procedure_procedure_code`, and `procedure_procedure_name`. Radiologist `1000` is linked to procedure `100` (`3990183`, `Integrated Protocol A`).

**View `radiologist_thoracic_procedure_view`**

```sql
CREATE VIEW radiologist_thoracic_procedure_view AS
SELECT a.id, a.physician_identifier, a.full_name, a.certification_body, b.thoracic_procedure_id AS procedure_thoracic_procedure_id, b.procedure_code AS procedure_procedure_code, b.procedure_name AS procedure_procedure_name
FROM radiologists a JOIN thoracic_procedures b ON a.thoracic_procedure_id = b.thoracic_procedure_id;
```

| id | physician_identifier | full_name | certification_body | procedure_thoracic_procedure_id | procedure_procedure_code | procedure_procedure_name |
|---|---|---|---|---|---|---|
| 1000 | PHY-2099 | Theodore Mcgrath | integrated-certific-58 | 100 | 3990183 | Integrated Protocol A |
| 1001 | PHY-2101 | Account Name | seasonal-certific-59 | 101 | 10782181 | Extended Programme |
| 1002 | PHY-2103 | Saipan International Airport | regional-certific-60 | 102 | account_pymes_663 | Pilot Standard |
| 1003 | PHY-2105 | Norma Fisher | legacy-certific-61 | 103 | 1c87986a-8fcd-11eb-924d-9cd76263cbd0 | Baseline Framework D |

### 4.3 Views Originating from Hospital Campuses

The view `hospital_campus_imaging_study_view` joins `hospital_campuses` to `imaging_studies` on `imaging_study_id`, producing `campus_code`, `campus_name`, `bed_capacity`, `trauma_level`, `study_id`, `study_study_identifier`, and `study_modality`. Campus `6969438` (`Integrated Assessment A`, `23` beds, trauma level `23`) is linked to study `1` (`STU-2431`, `radiography`).

**View `hospital_campus_imaging_study_view`**

```sql
CREATE VIEW hospital_campus_imaging_study_view AS
SELECT a.campus_code, a.campus_name, a.bed_capacity, a.trauma_level, b.id AS study_id, b.study_identifier AS study_study_identifier, b.modality AS study_modality
FROM hospital_campuses a JOIN imaging_studies b ON a.imaging_study_id = b.id;
```

| campus_code | campus_name | bed_capacity | trauma_level | study_id | study_study_identifier | study_modality |
|---|---|---|---|---|---|---|
| 6969438 | Integrated Assessment A | 23 | 23 | 1 | STU-2431 | radiography |
| 9736889 | Extended Survey | 27 | 31 | 2 | STU-2434 | CT |
| 727050 | Pilot Corridor | 31 | 39 | 3 | STU-2437 | MRI |
| 89008 | Baseline Series D | 35 | 47 | 4 | STU-2440 | radiography |

The view `hospital_campus_radiologist_view` joins `hospital_campuses` to `radiologists` on `radiologist_id`, returning `campus_code`, `campus_name`, `bed_capacity`, `trauma_level`, `radiologist_id`, `radiologist_physician_identifier`, and `radiologist_full_name`. Campus `6969438` is associated with radiologist `1000` (`PHY-2099`, `Theodore Mcgrath`).

**View `hospital_campus_radiologist_view`**

```sql
CREATE VIEW hospital_campus_radiologist_view AS
SELECT a.campus_code, a.campus_name, a.bed_capacity, a.trauma_level, b.id AS radiologist_id, b.physician_identifier AS radiologist_physician_identifier, b.full_name AS radiologist_full_name
FROM hospital_campuses a JOIN radiologists b ON a.radiologist_id = b.id;
```

| campus_code | campus_name | bed_capacity | trauma_level | radiologist_id | radiologist_physician_identifier | radiologist_full_name |
|---|---|---|---|---|---|---|
| 6969438 | Integrated Assessment A | 23 | 23 | 1000 | PHY-2099 | Theodore Mcgrath |
| 9736889 | Extended Survey | 27 | 31 | 1001 | PHY-2101 | Account Name |
| 727050 | Pilot Corridor | 31 | 39 | 1002 | PHY-2103 | Saipan International Airport |
| 89008 | Baseline Series D | 35 | 47 | 1003 | PHY-2105 | Norma Fisher |

The view `hospital_campus_thoracic_procedure_view` joins `hospital_campuses` to `thoracic_procedures` on `thoracic_procedure_id`, yielding `campus_code`, `campus_name`, `bed_capacity`, `trauma_level`, `procedure_thoracic_procedure_id`, `procedure_procedure_code`, and `procedure_procedure_name`. Campus `6969438` is linked to procedure `100` (`3990183`, `Integrated Protocol A`).

**View `hospital_campus_thoracic_procedure_view`**

```sql
CREATE VIEW hospital_campus_thoracic_procedure_view AS
SELECT a.campus_code, a.campus_name, a.bed_capacity, a.trauma_level, b.thoracic_procedure_id AS procedure_thoracic_procedure_id, b.procedure_code AS procedure_procedure_code, b.procedure_name AS procedure_procedure_name
FROM hospital_campuses a JOIN thoracic_procedures b ON a.thoracic_procedure_id = b.thoracic_procedure_id;
```

| campus_code | campus_name | bed_capacity | trauma_level | procedure_thoracic_procedure_id | procedure_procedure_code | procedure_procedure_name |
|---|---|---|---|---|---|---|
| 6969438 | Integrated Assessment A | 23 | 23 | 100 | 3990183 | Integrated Protocol A |
| 9736889 | Extended Survey | 27 | 31 | 101 | 10782181 | Extended Programme |
| 727050 | Pilot Corridor | 31 | 39 | 102 | account_pymes_663 | Pilot Standard |
| 89008 | Baseline Series D | 35 | 47 | 103 | 1c87986a-8fcd-11eb-924d-9cd76263cbd0 | Baseline Framework D |

### 4.4 Views Originating from Thoracic Procedures

The view `thoracic_procedure_radiologist_view` joins `thoracic_procedures` to `radiologists` on `radiologist_id`, producing `thoracic_procedure_id`, `procedure_code`, `procedure_name`, `procedure_date`, `radiologist_id`, `radiologist_physician_identifier`, and `radiologist_full_name`. Procedure `100` (`3990183`, `Integrated Protocol A`, dated `2022-05-19T04:48:00`) is performed by radiologist `1000` (`Theodore Mcgrath`).

**View `thoracic_procedure_radiologist_view`**

```sql
CREATE VIEW thoracic_procedure_radiologist_view AS
SELECT a.thoracic_procedure_id, a.procedure_code, a.procedure_name, a.procedure_date, b.id AS radiologist_id, b.physician_identifier AS radiologist_physician_identifier, b.full_name AS radiologist_full_name
FROM thoracic_procedures a JOIN radiologists b ON a.radiologist_id = b.id;
```

| thoracic_procedure_id | procedure_code | procedure_name | procedure_date | radiologist_id | radiologist_physician_identifier | radiologist_full_name |
|---|---|---|---|---|---|---|
| 100 | 3990183 | Integrated Protocol A | 2022-05-19T04:48:00 | 1000 | PHY-2099 | Theodore Mcgrath |
| 101 | 10782181 | Extended Programme | 2023-10-03T11:05:00 | 1001 | PHY-2101 | Account Name |
| 102 | account_pymes_663 | Pilot Standard | 2024-03-14T18:22:00 | 1002 | PHY-2103 | Saipan International Airport |
| 103 | 1c87986a-8fcd-11eb-924d-9cd76263cbd0 | Baseline Framework D | 2025-08-25T01:39:00 | 1003 | PHY-2105 | Norma Fisher |

The view `thoracic_procedure_hospital_campus_view` joins `thoracic_procedures` to `hospital_campuses` on `campus_code`, returning `thoracic_procedure_id`, `procedure_code`, `procedure_name`, `procedure_date`, `campus_campus_code`, `campus_campus_name`, and `campus_bed_capacity`. Procedure `100` is associated with campus `6969438` (`Integrated Assessment A`, `23` beds).

**View `thoracic_procedure_hospital_campus_view`**

```sql
CREATE VIEW thoracic_procedure_hospital_campus_view AS
SELECT a.thoracic_procedure_id, a.procedure_code, a.procedure_name, a.procedure_date, b.campus_code AS campus_campus_code, b.campus_name AS campus_campus_name, b.bed_capacity AS campus_bed_capacity
FROM thoracic_procedures a JOIN hospital_campuses b ON a.campus_code = b.campus_code;
```

| thoracic_procedure_id | procedure_code | procedure_name | procedure_date | campus_campus_code | campus_campus_name | campus_bed_capacity |
|---|---|---|---|---|---|---|
| 100 | 3990183 | Integrated Protocol A | 2022-05-19T04:48:00 | 6969438 | Integrated Assessment A | 23 |
| 101 | 10782181 | Extended Programme | 2023-10-03T11:05:00 | 9736889 | Extended Survey | 27 |
| 102 | account_pymes_663 | Pilot Standard | 2024-03-14T18:22:00 | 727050 | Pilot Corridor | 31 |
| 103 | 1c87986a-8fcd-11eb-924d-9cd76263cbd0 | Baseline Framework D | 2025-08-25T01:39:00 | 89008 | Baseline Series D | 35 |

The view `thoracic_procedure_imaging_study_view` joins `thoracic_procedures` to `imaging_studies` on `imaging_study_id`, yielding `thoracic_procedure_id`, `procedure_code`, `procedure_name`, `procedure_date`, `study_id`, `study_study_identifier`, and `study_modality`. Procedure `100` is linked to study `1` (`STU-2431`, `radiography`).

**View `thoracic_procedure_imaging_study_view`**

```sql
CREATE VIEW thoracic_procedure_imaging_study_view AS
SELECT a.thoracic_procedure_id, a.procedure_code, a.procedure_name, a.procedure_date, b.id AS study_id, b.study_identifier AS study_study_identifier, b.modality AS study_modality
FROM thoracic_procedures a JOIN imaging_studies b ON a.imaging_study_id = b.id;
```

| thoracic_procedure_id | procedure_code | procedure_name | procedure_date | study_id | study_study_identifier | study_modality |
|---|---|---|---|---|---|---|
| 100 | 3990183 | Integrated Protocol A | 2022-05-19T04:48:00 | 1 | STU-2431 | radiography |
| 101 | 10782181 | Extended Programme | 2023-10-03T11:05:00 | 2 | STU-2434 | CT |
| 102 | account_pymes_663 | Pilot Standard | 2024-03-14T18:22:00 | 3 | STU-2437 | MRI |
| 103 | 1c87986a-8fcd-11eb-924d-9cd76263cbd0 | Baseline Framework D | 2025-08-25T01:39:00 | 4 | STU-2440 | radiography |

### 4.5 Views Originating from Post-Processing Software

The view `post_processing_software_imaging_study_view` joins `post_processing_softwares` to `imaging_studies` on `imaging_study_id`, producing `post_processing_software_id`, `software_name`, `version`, `vendor`, `study_id`, `study_study_identifier`, and `study_modality`. Software `100` (`Primary Review A`, version `seasonal-version-71`, vendor `Feedback Ratings`) is used for study `1` (`STU-2431`, `radiography`).

**View `post_processing_software_imaging_study_view`**

```sql
CREATE VIEW post_processing_software_imaging_study_view AS
SELECT a.post_processing_software_id, a.software_name, a.version, a.vendor, b.id AS study_id, b.study_identifier AS study_study_identifier, b.modality AS study_modality
FROM post_processing_softwares a JOIN imaging_studies b ON a.imaging_study_id = b.id;
```

| post_processing_software_id | software_name | version | vendor | study_id | study_study_identifier | study_modality |
|---|---|---|---|---|---|---|
| 100 | Primary Review A | seasonal-version-71 | Feedback Ratings | 1 | STU-2431 | radiography |
| 101 | Composite Initiative | regional-version-72 | Abbott Laboratories | 2 | STU-2434 | CT |
| 102 | Compact Model | legacy-version-73 | American Express | 3 | STU-2437 | MRI |
| 103 | Legacy Cluster D | compact-version-74 | Whatsapp Inc. | 4 | STU-2440 | radiography |

## 5. Summary

This chapter has described a relational schema for a thoracic imaging registry comprising five entity tables and one junction table, linked by a network of cardinality-bounded foreign keys. The junction table `radiologists_studies` is the sole many-to-many bridge, connecting radiologists to imaging studies through a pair of one-to-many relationships. Twelve materialised views each reconstruct a specific domain fact by joining two (or, in the case of `radiologist_imaging_study_detail_view`, three) tables along their foreign-key edges. Every view name, table name, and column name is quoted in backticks throughout this chapter, and every payload block has been embedded at its designated location. The schema demonstrates how a domain ontology — with entities for studies, physicians, campuses, procedures, and software — maps cleanly onto a normalised relational model where foreign keys encode cardinality-bounded associations and a single junction table resolves the lone many-to-many relationship.
