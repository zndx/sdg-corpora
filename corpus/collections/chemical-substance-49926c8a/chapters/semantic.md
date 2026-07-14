The domain of carcinogenicity assessment captures the scientific evidence linking chemical substances to cancer risk through multiple lines of inquiry—human epidemiological studies, animal experiments, mechanistic biology, and pharmacokinetic profiling. Each chemical substance is evaluated by a regulatory or research body that assigns a carcinogenicity status, documents the strength of evidence, and records whether the substance is mutagenic or genotoxic. These assessments are not isolated verdicts; they are anchored to the chemical's physical properties, its behavior in biological systems, and the specific molecular mechanisms by which it may initiate or promote tumor formation. The relational schema models this ecosystem by normalizing each entity type into its own table, linking them through foreign keys that encode one-to-one and one-to-many relationships, and materializing the most common analytical joins as views.

## Entity Types and Their Attributes

The central entity is the chemical substance, stored in `chemical_substances`. Each row identifies a substance by a surrogate `chemical_substance_id` and a `cas_number` such as `CAS-2785` or `CAS-2794`. The `common_name` column carries descriptive labels like `Seasonal Review`, `Integrated Initiative`, `Extended Model D`, and `Pilot Cluster`. Physical and chemical properties are captured in `molecular_formula` (e.g. `distributed-molecula-84`), `physical_state` (one of `solid`, `liquid`, or `gas`), and solubility flags `solubility_in_water` and `solubility_in_organic_solvents` stored as booleans. The columns `melting_point` and `boiling_point` hold numeric values such as `2.20` and `18.95` for the first substance.

**Table `chemical_substances`**

| chemical_substance_id | cas_number | common_name | molecular_formula | physical_state | solubility_in_water | solubility_in_organic_solvents | melting_point | boiling_point | carcinogenicity_assessment_id | pharmacokinetic_parameter_id | has_half_life_in_rodents_pharmacokinetic_parameter_id | receptor_id |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | CAS-2785 | Seasonal Review | distributed-molecula-84 | solid | false | distributed-solubili-66 | 2.20 | 18.95 | 1 | 1 | 1 | 790471 |
| 2 | CAS-2788 | Integrated Initiative | baseline-molecula-85 | liquid | true | baseline-solubili-67 | 4.40 | 20.90 | 2 | 2 | 2 | 3001009030190 |
| 3 | CAS-2791 | Extended Model D | pilot-molecula-86 | gas | false | pilot-solubili-68 | 6.60 | 22.85 | 3 | 3 | 3 | 3717630 |
| 4 | CAS-2794 | Pilot Cluster | extended-molecula-87 | solid | true | extended-solubili-69 | 8.80 | 24.80 | 4 | 4 | 4 | 1250200 |

The `carcinogenicity_assessments` table records the formal evaluation of each substance's cancer risk. The surrogate key `carcinogenicity_assessment_id` runs from 1 to 4. The `assessment_date` column stores ISO-8601 timestamps like `2022-05-10T04:24:00`. The `carcinogenicity_status` column carries the regulatory classification—values observed include `known to be a human carcinogen`, `reasonably anticipated to be a human carcinogen`, and `not classifiable as to its carcinogenicity to humans`. The `evidence_level` column distinguishes `sufficient evidence`, `limited evidence`, and `inadequate evidence`. The `reporting_body` column identifies the organization, with values such as `IARC`, `NTP`, and `EPA`. The `report_year` column holds integers like `22`, `26`, `30`, and `34`, while `report_title` carries strings such as `Composite Protocol` and `Compact Programme A`. Boolean flags `is_mutagenic` and the categorical column `genotoxicity_findings` (with values `consistent`, `inconclusive`, and `equivocal`) round out the assessment record.

**Table `carcinogenicity_assessments`**

| carcinogenicity_assessment_id | assessment_date | carcinogenicity_status | evidence_level | reporting_body | report_year | report_title | is_mutagenic | genotoxicity_findings | chemical_substance_id | mechanism_of_carcinogenesis_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 2022-05-10T04:24:00 | known to be a human carcinogen | sufficient evidence | IARC | 22 | Composite Protocol | true | consistent | 1 | 100 |
| 2 | 2023-10-21T11:41:00 | reasonably anticipated to be a human carcinogen | limited evidence | NTP | 26 | Compact Programme A | false | inconclusive | 2 | 101 |
| 3 | 2024-03-05T18:58:00 | not classifiable as to its carcinogenicity to humans | inadequate evidence | EPA | 30 | Legacy Standard | true | equivocal | 3 | 102 |
| 4 | 2025-08-16T01:15:00 | known to be a human carcinogen | sufficient evidence | IARC | 34 | Regional Framework | false | consistent | 4 | 103 |

Human population evidence is captured in `epidemiological_studies`. The primary key `study_id` is a string column; observed values include `Karyawan`, `392491`, `9568466`, and `4985166`. The date range of each study is recorded in `study_start_date` and `study_end_date`. The `population_size` column holds integers such as `35`, `42`, `49`, and `56`. Exposure intensity is captured in `exposure_level` with values `high`, `medium`, and `low`. The `cohort_location` column stores country names like `Germany`, `Netherlands`, `United States`, and `Italy`. The `cancer_types_observed` column records outcomes such as `lung cancer`, `non-Hodgkin lymphoma`, and `all cancer combined`. The numeric column `mortality_increase` holds values like `7.20`, `9.40`, `11.60`, and `13.80`.

**Table `epidemiological_studies`**

| study_id | study_start_date | study_end_date | population_size | exposure_level | cohort_location | cancer_types_observed | mortality_increase | chemical_substance_id | carcinogenicity_assessment_id |
|---|---|---|---|---|---|---|---|---|---|
| Karyawan | 2023-02-12 | 2024-11-10 | 35 | high | Germany | lung cancer | 7.20 | 1 | 1 |
| 392491 | 2024-07-23 | 2025-04-21 | 42 | medium | Netherlands | non-Hodgkin lymphoma | 9.40 | 2 | 2 |
| 9568466 | 2025-12-07 | 2022-09-05 | 49 | low | United States | all cancer combined | 11.60 | 3 | 3 |
| 4985166 | 2022-05-18 | 2023-02-16 | 56 | high | Italy | lung cancer | 13.80 | 4 | 4 |

Animal experiments are stored in `animal_carcinogenicity_studies`. The surrogate key `id` runs from 100 to 103. The `study_id` column mirrors the epidemiological table's string identifiers. Date columns `study_start_date` and `study_end_date` record the experimental period. The `animal_species` column takes values `rat`, `mouse`, and `hamster`. The `exposure_route` column carries values such as `oral`, `dermal`, and `intraperitoneal`. The `tissue_sites_affected` column records anatomical targets like `liver`, `thyroid gland`, `lymphatic system`, and `respiratory tract`. The boolean `dose_dependent` indicates whether tumor incidence scales with dose, and `tumor_incidence` holds numeric values such as `15.70`, `17.40`, `19.10`, and `20.80`. Audit columns `created_at` and `updated_at` store timestamps like `2025-01-01 00:14:00`.

**Table `animal_carcinogenicity_studies`**

| id | study_id | study_start_date | study_end_date | animal_species | exposure_route | tissue_sites_affected | dose_dependent | tumor_incidence | chemical_substance_id | carcinogenicity_assessment_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 100 | Karyawan | 2023-02-12 | 2024-11-10 | rat | oral | liver | true | 15.70 | 1 | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 101 | 392491 | 2024-07-23 | 2025-04-21 | mouse | dermal | thyroid gland | false | 17.40 | 2 | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 102 | 9568466 | 2025-12-07 | 2022-09-05 | hamster | intraperitoneal | lymphatic system | true | 19.10 | 3 | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 103 | 4985166 | 2022-05-18 | 2023-02-16 | rat | oral | respiratory tract | false | 20.80 | 4 | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Mechanistic biology is captured in `mechanism_of_carcinogenesises`. The surrogate key `id` runs from 100 to 103. The `mechanism_id` column holds integers such as `2106718`, `9085252`, `2935`, and the string `TERIMA`. The `mechanism_name` column carries descriptive labels like `Ah receptor binding`, `gene expression changes`, `altered metabolism`, and `altered cell growth`. Boolean columns `is_necessary_step` and `is_sufficient_step` encode logical properties of each mechanism. The `observed_in_species` column stores `human` or `rodent`. The `biological_response` column holds free-text descriptions such as `changes in gene expression`, `altered metabolism`, `altered cell growth and differentiation`, and `disruption of steroid-hormone and growth-factor signal-transduction pathways`.

**Table `mechanism_of_carcinogenesises`**

| id | mechanism_id | mechanism_name | is_necessary_step | is_sufficient_step | observed_in_species | biological_response | chemical_substance_id | receptor_id | carcinogenicity_assessment_id |
|---|---|---|---|---|---|---|---|---|---|
| 100 | 2106718 | Ah receptor binding | false | false | human | changes in gene expression | 1 | 790471 | 1 |
| 101 | 9085252 | gene expression changes | true | true | rodent | altered metabolism | 2 | 3001009030190 | 2 |
| 102 | 2935 | altered metabolism | false | false | human | altered cell growth and differentiation | 3 | 3717630 | 3 |
| 103 | TERIMA | altered cell growth | true | true | rodent | disruption of steroid-hormone and growth-factor signal-transduction pathways | 4 | 1250200 | 4 |

Biological receptors are stored in `biological_receptors`. The surrogate key `receptor_id` holds values such as `790471`, `3001009030190`, `3717630`, and `1250200`. The `receptor_name` column carries values like `Ah receptor` and `aromatic hydrocarbon receptor`. The boolean `ubiquitous_in_vertebrates` indicates whether the receptor is broadly distributed. The `affinity_for_t_c_d_d` column stores categorical values `high`, `medium`, and `low`. The `function` column describes the receptor's role, with values such as `signal transducer` and `activator for gene transcription`.

**Table `biological_receptors`**

| receptor_id | receptor_name | ubiquitous_in_vertebrates | affinity_for_t_c_d_d | function | chemical_substance_id | mechanism_of_carcinogenesis_id |
|---|---|---|---|---|---|---|
| 790471 | Ah receptor | true | high | signal transducer | 1 | 100 |
| 3001009030190 | aromatic hydrocarbon receptor | false | medium | activator for gene transcription | 2 | 101 |
| 3717630 | Ah receptor | true | low | signal transducer | 3 | 102 |
| 1250200 | aromatic hydrocarbon receptor | false | high | activator for gene transcription | 4 | 103 |

Pharmacokinetic parameters are stored in `pharmacokinetic_parameters`. Each row is identified by a surrogate `pharmacokinetic_parameter_id` running from 1 to 4. The table captures quantitative descriptors of how a chemical is absorbed, distributed, metabolized, and excreted.

**Table `pharmacokinetic_parameters`**

| id | parameter_id | parameter_name | value | unit | species | source_reference | chemical_substance_id |
|---|---|---|---|---|---|---|---|
| 1 | 348c2b52-8fcc-11eb-924d-9cd76263cbd0 | Extended Model | 19.95 | years | human | integrated-source-58 | 1 |
| 2 | 7441144 | Pilot Cluster A | 21.90 | days | rodent | seasonal-source-59 | 2 |
| 3 | 3717628 | Baseline Review | 23.85 | years | human | regional-source-60 | 3 |
| 4 | 3001009030280 | Distributed Initiative | 25.80 | days | rodent | legacy-source-61 | 4 |

## Foreign Keys and Cardinality

The schema encodes cardinality through foreign key columns embedded in the base tables. The `chemical_substances` table carries a `carcinogenicity_assessment_id` column that references `carcinogenicity_assessments.carcinogenicity_assessment_id`, establishing a one-to-one relationship: each chemical substance has exactly one carcinogenicity assessment. The same table also holds `pharmacokinetic_parameter_id` and `has_half_life_in_rodents_pharmacokinetic_parameter_id`, both referencing `pharmacokinetic_parameters`, and a `receptor_id` column referencing `biological_receptors.receptor_id`.

The `carcinogenicity_assessments` table carries a `chemical_substance_id` column referencing `chemical_substances.chemical_substance_id`, forming the inverse of the one-to-one link, and a `mechanism_of_carcinogenesis_id` column referencing `mechanism_of_carcinogenesises.id`.

The `epidemiological_studies` table carries both a `chemical_substance_id` and a `carcinogenicity_assessment_id` column, each referencing the respective base table. This design allows a single chemical substance to be associated with multiple epidemiological studies while also linking each study to its parent assessment.

The `animal_carcinogenicity_studies` table similarly carries `chemical_substance_id` and `carcinogenicity_assessment_id` foreign keys, enabling one-to-many relationships from both the chemical and the assessment to animal studies.

The `mechanism_of_carcinogenesises` table carries `chemical_substance_id`, `receptor_id`, and `carcinogenicity_assessment_id` foreign keys, allowing a single mechanism to be associated with a chemical, a receptor, and an assessment.

The `biological_receptors` table carries `chemical_substance_id` and `mechanism_of_carcinogenesis_id` foreign keys, linking each receptor to a chemical substance and a mechanism.

The `pharmacokinetic_parameters` table carries a `chemical_substance_id` foreign key, linking each parameter set to a chemical substance.

## The Junction Table

The `assessments_studies` table serves as a junction table that decouples many-to-many relationships between carcinogenicity assessments and the various study types. By storing pairs of `carcinogenicity_assessment_id` and `study_id` (where `study_id` references the appropriate study table), this table allows an assessment to be linked to multiple studies and a study to be referenced by multiple assessments without duplicating data.

**Table `assessments_studies`**

| carcinogenicity_assessment_id | study_id |
|---|---|
| 1 | Karyawan |
| 1 | 392491 |
| 2 | 392491 |
| 2 | 9568466 |
| 3 | 9568466 |
| 3 | 4985166 |
| 4 | 4985166 |
| 4 | Karyawan |

## Materialized Views

The schema materializes the most common analytical joins as views, each answering a specific domain question by denormalizing the normalized tables.

The view `vw_chemical_substance_carcinogenicity_assessment` joins `chemical_substances` with `carcinogenicity_assessments` to present each chemical alongside its formal cancer risk classification. A row from this view might show `CAS-2785` with `carcinogenicity_status` of `known to be a human carcinogen` and `evidence_level` of `sufficient evidence`, reported by `IARC`.

**View `vw_chemical_substance_carcinogenicity_assessment`**

```sql
CREATE VIEW vw_chemical_substance_carcinogenicity_assessment AS
SELECT a.chemical_substance_id, a.cas_number, a.common_name, a.molecular_formula, b.carcinogenicity_assessment_id AS assessment_carcinogenicity_assessment_id, b.assessment_date AS assessment_assessment_date, b.carcinogenicity_status AS assessment_carcinogenicity_status
FROM chemical_substances a JOIN carcinogenicity_assessments b ON a.carcinogenicity_assessment_id = b.carcinogenicity_assessment_id;
```

| chemical_substance_id | cas_number | common_name | molecular_formula | assessment_carcinogenicity_assessment_id | assessment_assessment_date | assessment_carcinogenicity_status |
|---|---|---|---|---|---|---|
| 1 | CAS-2785 | Seasonal Review | distributed-molecula-84 | 1 | 2022-05-10T04:24:00 | known to be a human carcinogen |
| 2 | CAS-2788 | Integrated Initiative | baseline-molecula-85 | 2 | 2023-10-21T11:41:00 | reasonably anticipated to be a human carcinogen |
| 3 | CAS-2791 | Extended Model D | pilot-molecula-86 | 3 | 2024-03-05T18:58:00 | not classifiable as to its carcinogenicity to humans |
| 4 | CAS-2794 | Pilot Cluster | extended-molecula-87 | 4 | 2025-08-16T01:15:00 | known to be a human carcinogen |

The view `vw_chemical_substance_pharmacokinetic_parameter` joins `chemical_substances` with `pharmacokinetic_parameters` to present each chemical alongside its quantitative absorption, distribution, metabolism, and excretion descriptors.

**View `vw_chemical_substance_pharmacokinetic_parameter`**

```sql
CREATE VIEW vw_chemical_substance_pharmacokinetic_parameter AS
SELECT a.chemical_substance_id, a.cas_number, a.common_name, a.molecular_formula, b.id AS parameter_id, b.parameter_id AS parameter_parameter_id, b.parameter_name AS parameter_parameter_name
FROM chemical_substances a JOIN pharmacokinetic_parameters b ON a.pharmacokinetic_parameter_id = b.id;
```

| chemical_substance_id | cas_number | common_name | molecular_formula | parameter_id | parameter_parameter_id | parameter_parameter_name |
|---|---|---|---|---|---|---|
| 1 | CAS-2785 | Seasonal Review | distributed-molecula-84 | 1 | 348c2b52-8fcc-11eb-924d-9cd76263cbd0 | Extended Model |
| 2 | CAS-2788 | Integrated Initiative | baseline-molecula-85 | 2 | 7441144 | Pilot Cluster A |
| 3 | CAS-2791 | Extended Model D | pilot-molecula-86 | 3 | 3717628 | Baseline Review |
| 4 | CAS-2794 | Pilot Cluster | extended-molecula-87 | 4 | 3001009030280 | Distributed Initiative |

The view `vw_chemical_substance_biological_receptor` joins `chemical_substances` with `biological_receptors` to present each chemical alongside the receptor proteins it interacts with, including receptor names like `Ah receptor` and affinity levels such as `high`.

**View `vw_chemical_substance_biological_receptor`**

```sql
CREATE VIEW vw_chemical_substance_biological_receptor AS
SELECT a.chemical_substance_id, a.cas_number, a.common_name, a.molecular_formula, b.receptor_id AS receptor_receptor_id, b.receptor_name AS receptor_receptor_name, b.ubiquitous_in_vertebrates AS receptor_ubiquitous_in_vertebrates
FROM chemical_substances a JOIN biological_receptors b ON a.receptor_id = b.receptor_id;
```

| chemical_substance_id | cas_number | common_name | molecular_formula | receptor_receptor_id | receptor_receptor_name | receptor_ubiquitous_in_vertebrates |
|---|---|---|---|---|---|---|
| 1 | CAS-2785 | Seasonal Review | distributed-molecula-84 | 790471 | Ah receptor | true |
| 2 | CAS-2788 | Integrated Initiative | baseline-molecula-85 | 3001009030190 | aromatic hydrocarbon receptor | false |
| 3 | CAS-2791 | Extended Model D | pilot-molecula-86 | 3717630 | Ah receptor | true |
| 4 | CAS-2794 | Pilot Cluster | extended-molecula-87 | 1250200 | aromatic hydrocarbon receptor | false |

The view `vw_carcinogenicity_assessment_chemical_substance` presents the inverse perspective: starting from a carcinogenicity assessment and joining to the associated chemical substance. A row might show the assessment dated `2023-10-21T11:41:00` with `carcinogenicity_status` of `reasonably anticipated to be a human carcinogen` alongside the chemical identified by `CAS-2788` and `common_name` of `Integrated Initiative`.

**View `vw_carcinogenicity_assessment_chemical_substance`**

```sql
CREATE VIEW vw_carcinogenicity_assessment_chemical_substance AS
SELECT a.carcinogenicity_assessment_id, a.assessment_date, a.carcinogenicity_status, a.evidence_level, b.chemical_substance_id AS substance_chemical_substance_id, b.cas_number AS substance_cas_number, b.common_name AS substance_common_name
FROM carcinogenicity_assessments a JOIN chemical_substances b ON a.chemical_substance_id = b.chemical_substance_id;
```

| carcinogenicity_assessment_id | assessment_date | carcinogenicity_status | evidence_level | substance_chemical_substance_id | substance_cas_number | substance_common_name |
|---|---|---|---|---|---|---|
| 1 | 2022-05-10T04:24:00 | known to be a human carcinogen | sufficient evidence | 1 | CAS-2785 | Seasonal Review |
| 2 | 2023-10-21T11:41:00 | reasonably anticipated to be a human carcinogen | limited evidence | 2 | CAS-2788 | Integrated Initiative |
| 3 | 2024-03-05T18:58:00 | not classifiable as to its carcinogenicity to humans | inadequate evidence | 3 | CAS-2791 | Extended Model D |
| 4 | 2025-08-16T01:15:00 | known to be a human carcinogen | sufficient evidence | 4 | CAS-2794 | Pilot Cluster |

The view `vw_carcinogenicity_assessment_epidemiological_study_detail` joins `carcinogenicity_assessments` with `epidemiological_studies` to present each assessment alongside its supporting human population evidence. A row might show the assessment with `report_title` of `Composite Protocol` alongside an epidemiological study with `study_id` of `Karyawan`, `population_size` of `35`, `exposure_level` of `high`, and `mortality_increase` of `7.20`.

**View `vw_carcinogenicity_assessment_epidemiological_study_detail`**

```sql
CREATE VIEW vw_carcinogenicity_assessment_epidemiological_study_detail AS
SELECT a.carcinogenicity_assessment_id, a.assessment_date, a.carcinogenicity_status, b.study_id AS study_study_id, b.study_start_date AS study_study_start_date, b.study_end_date AS study_study_end_date
FROM carcinogenicity_assessments a
  JOIN assessments_studies j ON j.carcinogenicity_assessment_id = a.carcinogenicity_assessment_id
  JOIN epidemiological_studies b ON b.study_id = j.study_id;
```

| carcinogenicity_assessment_id | assessment_date | carcinogenicity_status | study_study_id | study_study_start_date | study_study_end_date |
|---|---|---|---|---|---|
| 1 | 2022-05-10T04:24:00 | known to be a human carcinogen | Karyawan | 2023-02-12 | 2024-11-10 |
| 1 | 2022-05-10T04:24:00 | known to be a human carcinogen | 392491 | 2024-07-23 | 2025-04-21 |
| 2 | 2023-10-21T11:41:00 | reasonably anticipated to be a human carcinogen | 392491 | 2024-07-23 | 2025-04-21 |
| 2 | 2023-10-21T11:41:00 | reasonably anticipated to be a human carcinogen | 9568466 | 2025-12-07 | 2022-09-05 |
| 3 | 2024-03-05T18:58:00 | not classifiable as to its carcinogenicity to humans | 9568466 | 2025-12-07 | 2022-09-05 |
| 3 | 2024-03-05T18:58:00 | not classifiable as to its carcinogenicity to humans | 4985166 | 2022-05-18 | 2023-02-16 |
| 4 | 2025-08-16T01:15:00 | known to be a human carcinogen | 4985166 | 2022-05-18 | 2023-02-16 |
| 4 | 2025-08-16T01:15:00 | known to be a human carcinogen | Karyawan | 2023-02-12 | 2024-11-10 |

The view `vw_carcinogenicity_assessment_animal_carcinogenicity_study_detail` joins `carcinogenicity_assessments` with `animal_carcinogenicity_studies` to present each assessment alongside its supporting animal experiment evidence. A row might show the assessment with `report_title` of `Composite Protocol` alongside an animal study with `animal_species` of `rat`, `exposure_route` of `oral`, `tissue_sites_affected` of `liver`, and `tumor_incidence` of `15.70`.

**View `vw_carcinogenicity_assessment_animal_carcinogenicity_study_detail`**

```sql
CREATE VIEW vw_carcinogenicity_assessment_animal_carcinogenicity_study_detail AS
SELECT a.carcinogenicity_assessment_id, a.assessment_date, a.carcinogenicity_status, b.id AS study_id, b.study_id AS study_study_id, b.study_start_date AS study_study_start_date
FROM carcinogenicity_assessments a
  JOIN assessments_studies j ON j.carcinogenicity_assessment_id = a.carcinogenicity_assessment_id
  JOIN animal_carcinogenicity_studies b ON b.id = j.animal_carcinogenicity_study_id;
```

| carcinogenicity_assessment_id | assessment_date | carcinogenicity_status | study_id | study_study_id | study_study_start_date |
|---|---|---|---|---|---|
| 1 | 2022-05-10T04:24:00 | known to be a human carcinogen | 100 | Karyawan | 2023-02-12 |
| 1 | 2022-05-10T04:24:00 | known to be a human carcinogen | 101 | 392491 | 2024-07-23 |
| 2 | 2023-10-21T11:41:00 | reasonably anticipated to be a human carcinogen | 101 | 392491 | 2024-07-23 |
| 2 | 2023-10-21T11:41:00 | reasonably anticipated to be a human carcinogen | 102 | 9568466 | 2025-12-07 |
| 3 | 2024-03-05T18:58:00 | not classifiable as to its carcinogenicity to humans | 102 | 9568466 | 2025-12-07 |
| 3 | 2024-03-05T18:58:00 | not classifiable as to its carcinogenicity to humans | 103 | 4985166 | 2022-05-18 |
| 4 | 2025-08-16T01:15:00 | known to be a human carcinogen | 103 | 4985166 | 2022-05-18 |
| 4 | 2025-08-16T01:15:00 | known to be a human carcinogen | 100 | Karyawan | 2023-02-12 |

The view `vw_carcinogenicity_assessment_mechanism_of_carcinogenesis` joins `carcinogenicity_assessments` with `mechanism_of_carcinogenesises` to present each assessment alongside the biological mechanisms implicated in the substance's carcinogenicity. A row might show the assessment with `carcinogenicity_status` of `known to be a human carcinogen` alongside a mechanism with `mechanism_name` of `Ah receptor binding` and `biological_response` of `changes in gene expression`.

**View `vw_carcinogenicity_assessment_mechanism_of_carcinogenesis`**

```sql
CREATE VIEW vw_carcinogenicity_assessment_mechanism_of_carcinogenesis AS
SELECT a.carcinogenicity_assessment_id, a.assessment_date, a.carcinogenicity_status, a.evidence_level, b.id AS carcinogenesis_id, b.mechanism_id AS carcinogenesis_mechanism_id, b.mechanism_name AS carcinogenesis_mechanism_name
FROM carcinogenicity_assessments a JOIN mechanism_of_carcinogenesises b ON a.mechanism_of_carcinogenesis_id = b.id;
```

| carcinogenicity_assessment_id | assessment_date | carcinogenicity_status | evidence_level | carcinogenesis_id | carcinogenesis_mechanism_id | carcinogenesis_mechanism_name |
|---|---|---|---|---|---|---|
| 1 | 2022-05-10T04:24:00 | known to be a human carcinogen | sufficient evidence | 100 | 2106718 | Ah receptor binding |
| 2 | 2023-10-21T11:41:00 | reasonably anticipated to be a human carcinogen | limited evidence | 101 | 9085252 | gene expression changes |
| 3 | 2024-03-05T18:58:00 | not classifiable as to its carcinogenicity to humans | inadequate evidence | 102 | 2935 | altered metabolism |
| 4 | 2025-08-16T01:15:00 | known to be a human carcinogen | sufficient evidence | 103 | TERIMA | altered cell growth |

The view `vw_epidemiological_study_chemical_substance` joins `epidemiological_studies` with `chemical_substances` to present each human study alongside the chemical it investigated. A row might show the study with `study_id` of `392491`, `cohort_location` of `Netherlands`, and `cancer_types_observed` of `non-Hodgkin lymphoma` alongside the chemical identified by `CAS-2788`.

**View `vw_epidemiological_study_chemical_substance`**

```sql
CREATE VIEW vw_epidemiological_study_chemical_substance AS
SELECT a.study_id, a.study_start_date, a.study_end_date, a.population_size, b.chemical_substance_id AS substance_chemical_substance_id, b.cas_number AS substance_cas_number, b.common_name AS substance_common_name
FROM epidemiological_studies a JOIN chemical_substances b ON a.chemical_substance_id = b.chemical_substance_id;
```

| study_id | study_start_date | study_end_date | population_size | substance_chemical_substance_id | substance_cas_number | substance_common_name |
|---|---|---|---|---|---|---|
| Karyawan | 2023-02-12 | 2024-11-10 | 35 | 1 | CAS-2785 | Seasonal Review |
| 392491 | 2024-07-23 | 2025-04-21 | 42 | 2 | CAS-2788 | Integrated Initiative |
| 9568466 | 2025-12-07 | 2022-09-05 | 49 | 3 | CAS-2791 | Extended Model D |
| 4985166 | 2022-05-18 | 2023-02-16 | 56 | 4 | CAS-2794 | Pilot Cluster |

The view `vw_epidemiological_study_carcinogenicity_assessment` joins `epidemiological_studies` with `carcinogenicity_assessments` to present each human study alongside its parent assessment. A row might show the study with `mortality_increase` of `11.60` and `exposure_level` of `low` alongside the assessment with `evidence_level` of `inadequate evidence` and `reporting_body` of `EPA`.

**View `vw_epidemiological_study_carcinogenicity_assessment`**

```sql
CREATE VIEW vw_epidemiological_study_carcinogenicity_assessment AS
SELECT a.study_id, a.study_start_date, a.study_end_date, a.population_size, b.carcinogenicity_assessment_id AS assessment_carcinogenicity_assessment_id, b.assessment_date AS assessment_assessment_date, b.carcinogenicity_status AS assessment_carcinogenicity_status
FROM epidemiological_studies a JOIN carcinogenicity_assessments b ON a.carcinogenicity_assessment_id = b.carcinogenicity_assessment_id;
```

| study_id | study_start_date | study_end_date | population_size | assessment_carcinogenicity_assessment_id | assessment_assessment_date | assessment_carcinogenicity_status |
|---|---|---|---|---|---|---|
| Karyawan | 2023-02-12 | 2024-11-10 | 35 | 1 | 2022-05-10T04:24:00 | known to be a human carcinogen |
| 392491 | 2024-07-23 | 2025-04-21 | 42 | 2 | 2023-10-21T11:41:00 | reasonably anticipated to be a human carcinogen |
| 9568466 | 2025-12-07 | 2022-09-05 | 49 | 3 | 2024-03-05T18:58:00 | not classifiable as to its carcinogenicity to humans |
| 4985166 | 2022-05-18 | 2023-02-16 | 56 | 4 | 2025-08-16T01:15:00 | known to be a human carcinogen |

The view `vw_animal_carcinogenicity_study_chemical_substance` joins `animal_carcinogenicity_studies` with `chemical_substances` to present each animal experiment alongside the chemical it investigated. A row might show the study with `animal_species` of `mouse`, `exposure_route` of `dermal`, and `tissue_sites_affected` of `thyroid gland` alongside the chemical identified by `CAS-2788`.

**View `vw_animal_carcinogenicity_study_chemical_substance`**

```sql
CREATE VIEW vw_animal_carcinogenicity_study_chemical_substance AS
SELECT a.id, a.study_id, a.study_start_date, a.study_end_date, b.chemical_substance_id AS substance_chemical_substance_id, b.cas_number AS substance_cas_number, b.common_name AS substance_common_name
FROM animal_carcinogenicity_studies a JOIN chemical_substances b ON a.chemical_substance_id = b.chemical_substance_id;
```

| id | study_id | study_start_date | study_end_date | substance_chemical_substance_id | substance_cas_number | substance_common_name |
|---|---|---|---|---|---|---|
| 100 | Karyawan | 2023-02-12 | 2024-11-10 | 1 | CAS-2785 | Seasonal Review |
| 101 | 392491 | 2024-07-23 | 2025-04-21 | 2 | CAS-2788 | Integrated Initiative |
| 102 | 9568466 | 2025-12-07 | 2022-09-05 | 3 | CAS-2791 | Extended Model D |
| 103 | 4985166 | 2022-05-18 | 2023-02-16 | 4 | CAS-2794 | Pilot Cluster |

The view `vw_animal_carcinogenicity_study_carcinogenicity_assessment` joins `animal_carcinogenicity_studies` with `carcinogenicity_assessments` to present each animal experiment alongside its parent assessment. A row might show the study with `tumor_incidence` of `17.40` and `dose_dependent` of `false` alongside the assessment with `carcinogenicity_status` of `reasonably anticipated to be a human carcinogen`.

**View `vw_animal_carcinogenicity_study_carcinogenicity_assessment`**

```sql
CREATE VIEW vw_animal_carcinogenicity_study_carcinogenicity_assessment AS
SELECT a.id, a.study_id, a.study_start_date, a.study_end_date, b.carcinogenicity_assessment_id AS assessment_carcinogenicity_assessment_id, b.assessment_date AS assessment_assessment_date, b.carcinogenicity_status AS assessment_carcinogenicity_status
FROM animal_carcinogenicity_studies a JOIN carcinogenicity_assessments b ON a.carcinogenicity_assessment_id = b.carcinogenicity_assessment_id;
```

| id | study_id | study_start_date | study_end_date | assessment_carcinogenicity_assessment_id | assessment_assessment_date | assessment_carcinogenicity_status |
|---|---|---|---|---|---|---|
| 100 | Karyawan | 2023-02-12 | 2024-11-10 | 1 | 2022-05-10T04:24:00 | known to be a human carcinogen |
| 101 | 392491 | 2024-07-23 | 2025-04-21 | 2 | 2023-10-21T11:41:00 | reasonably anticipated to be a human carcinogen |
| 102 | 9568466 | 2025-12-07 | 2022-09-05 | 3 | 2024-03-05T18:58:00 | not classifiable as to its carcinogenicity to humans |
| 103 | 4985166 | 2022-05-18 | 2023-02-16 | 4 | 2025-08-16T01:15:00 | known to be a human carcinogen |

The view `vw_mechanism_of_carcinogenesis_chemical_substance` joins `mechanism_of_carcinogenesises` with `chemical_substances` to present each mechanism alongside the chemical it is associated with. A row might show the mechanism with `mechanism_name` of `gene expression changes` and `observed_in_species` of `rodent` alongside the chemical identified by `CAS-2788`.

**View `vw_mechanism_of_carcinogenesis_chemical_substance`**

```sql
CREATE VIEW vw_mechanism_of_carcinogenesis_chemical_substance AS
SELECT a.id, a.mechanism_id, a.mechanism_name, a.is_necessary_step, b.chemical_substance_id AS substance_chemical_substance_id, b.cas_number AS substance_cas_number, b.common_name AS substance_common_name
FROM mechanism_of_carcinogenesises a JOIN chemical_substances b ON a.chemical_substance_id = b.chemical_substance_id;
```

| id | mechanism_id | mechanism_name | is_necessary_step | substance_chemical_substance_id | substance_cas_number | substance_common_name |
|---|---|---|---|---|---|---|
| 100 | 2106718 | Ah receptor binding | false | 1 | CAS-2785 | Seasonal Review |
| 101 | 9085252 | gene expression changes | true | 2 | CAS-2788 | Integrated Initiative |
| 102 | 2935 | altered metabolism | false | 3 | CAS-2791 | Extended Model D |
| 103 | TERIMA | altered cell growth | true | 4 | CAS-2794 | Pilot Cluster |

The view `vw_mechanism_of_carcinogenesis_biological_receptor` joins `mechanism_of_carcinogenesises` with `biological_receptors` to present each mechanism alongside the receptor protein it involves. A row might show the mechanism with `mechanism_name` of `Ah receptor binding` alongside the receptor with `receptor_name` of `Ah receptor` and `affinity_for_t_c_d_d` of `high`.

**View `vw_mechanism_of_carcinogenesis_biological_receptor`**

```sql
CREATE VIEW vw_mechanism_of_carcinogenesis_biological_receptor AS
SELECT a.id, a.mechanism_id, a.mechanism_name, a.is_necessary_step, b.receptor_id AS receptor_receptor_id, b.receptor_name AS receptor_receptor_name, b.ubiquitous_in_vertebrates AS receptor_ubiquitous_in_vertebrates
FROM mechanism_of_carcinogenesises a JOIN biological_receptors b ON a.receptor_id = b.receptor_id;
```

| id | mechanism_id | mechanism_name | is_necessary_step | receptor_receptor_id | receptor_receptor_name | receptor_ubiquitous_in_vertebrates |
|---|---|---|---|---|---|---|
| 100 | 2106718 | Ah receptor binding | false | 790471 | Ah receptor | true |
| 101 | 9085252 | gene expression changes | true | 3001009030190 | aromatic hydrocarbon receptor | false |
| 102 | 2935 | altered metabolism | false | 3717630 | Ah receptor | true |
| 103 | TERIMA | altered cell growth | true | 1250200 | aromatic hydrocarbon receptor | false |

The view `vw_mechanism_of_carcinogenesis_carcinogenicity_assessment` joins `mechanism_of_carcinogenesises` with `carcinogenicity_assessments` to present each mechanism alongside the assessment that implicated it. A row might show the mechanism with `is_necessary_step` of `true` and `is_sufficient_step` of `true` alongside the assessment with `carcinogenicity_status` of `not classifiable as to its carcinogenicity to humans`.

**View `vw_mechanism_of_carcinogenesis_carcinogenicity_assessment`**

```sql
CREATE VIEW vw_mechanism_of_carcinogenesis_carcinogenicity_assessment AS
SELECT a.id, a.mechanism_id, a.mechanism_name, a.is_necessary_step, b.carcinogenicity_assessment_id AS assessment_carcinogenicity_assessment_id, b.assessment_date AS assessment_assessment_date, b.carcinogenicity_status AS assessment_carcinogenicity_status
FROM mechanism_of_carcinogenesises a JOIN carcinogenicity_assessments b ON a.carcinogenicity_assessment_id = b.carcinogenicity_assessment_id;
```

| id | mechanism_id | mechanism_name | is_necessary_step | assessment_carcinogenicity_assessment_id | assessment_assessment_date | assessment_carcinogenicity_status |
|---|---|---|---|---|---|---|
| 100 | 2106718 | Ah receptor binding | false | 1 | 2022-05-10T04:24:00 | known to be a human carcinogen |
| 101 | 9085252 | gene expression changes | true | 2 | 2023-10-21T11:41:00 | reasonably anticipated to be a human carcinogen |
| 102 | 2935 | altered metabolism | false | 3 | 2024-03-05T18:58:00 | not classifiable as to its carcinogenicity to humans |
| 103 | TERIMA | altered cell growth | true | 4 | 2025-08-16T01:15:00 | known to be a human carcinogen |

The view `vw_biological_receptor_chemical_substance` joins `biological_receptors` with `chemical_substances` to present each receptor alongside the chemical it interacts with. A row might show the receptor with `receptor_name` of `Ah receptor` and `function` of `signal transducer` alongside the chemical identified by `CAS-2785`.

**View `vw_biological_receptor_chemical_substance`**

```sql
CREATE VIEW vw_biological_receptor_chemical_substance AS
SELECT a.receptor_id, a.receptor_name, a.ubiquitous_in_vertebrates, a.affinity_for_t_c_d_d, b.chemical_substance_id AS substance_chemical_substance_id, b.cas_number AS substance_cas_number, b.common_name AS substance_common_name
FROM biological_receptors a JOIN chemical_substances b ON a.chemical_substance_id = b.chemical_substance_id;
```

| receptor_id | receptor_name | ubiquitous_in_vertebrates | affinity_for_t_c_d_d | substance_chemical_substance_id | substance_cas_number | substance_common_name |
|---|---|---|---|---|---|---|
| 790471 | Ah receptor | true | high | 1 | CAS-2785 | Seasonal Review |
| 3001009030190 | aromatic hydrocarbon receptor | false | medium | 2 | CAS-2788 | Integrated Initiative |
| 3717630 | Ah receptor | true | low | 3 | CAS-2791 | Extended Model D |
| 1250200 | aromatic hydrocarbon receptor | false | high | 4 | CAS-2794 | Pilot Cluster |

The view `vw_biological_receptor_mechanism_of_carcinogenesis` joins `biological_receptors` with `mechanism_of_carcinogenesises` to present each receptor alongside the mechanisms it participates in. A row might show the receptor with `receptor_name` of `aromatic hydrocarbon receptor` and `function` of `activator for gene transcription` alongside the mechanism with `mechanism_name` of `altered cell growth`.

**View `vw_biological_receptor_mechanism_of_carcinogenesis`**

```sql
CREATE VIEW vw_biological_receptor_mechanism_of_carcinogenesis AS
SELECT a.receptor_id, a.receptor_name, a.ubiquitous_in_vertebrates, a.affinity_for_t_c_d_d, b.id AS carcinogenesis_id, b.mechanism_id AS carcinogenesis_mechanism_id, b.mechanism_name AS carcinogenesis_mechanism_name
FROM biological_receptors a JOIN mechanism_of_carcinogenesises b ON a.mechanism_of_carcinogenesis_id = b.id;
```

| receptor_id | receptor_name | ubiquitous_in_vertebrates | affinity_for_t_c_d_d | carcinogenesis_id | carcinogenesis_mechanism_id | carcinogenesis_mechanism_name |
|---|---|---|---|---|---|---|
| 790471 | Ah receptor | true | high | 100 | 2106718 | Ah receptor binding |
| 3001009030190 | aromatic hydrocarbon receptor | false | medium | 101 | 9085252 | gene expression changes |
| 3717630 | Ah receptor | true | low | 102 | 2935 | altered metabolism |
| 1250200 | aromatic hydrocarbon receptor | false | high | 103 | TERIMA | altered cell growth |

The view `vw_pharmacokinetic_parameter_chemical_substance` joins `pharmacokinetic_parameters` with `chemical_substances` to present each parameter set alongside the chemical it describes.

**View `vw_pharmacokinetic_parameter_chemical_substance`**

```sql
CREATE VIEW vw_pharmacokinetic_parameter_chemical_substance AS
SELECT a.id, a.parameter_id, a.parameter_name, a.value, b.chemical_substance_id AS substance_chemical_substance_id, b.cas_number AS substance_cas_number, b.common_name AS substance_common_name
FROM pharmacokinetic_parameters a JOIN chemical_substances b ON a.chemical_substance_id = b.chemical_substance_id;
```

| id | parameter_id | parameter_name | value | substance_chemical_substance_id | substance_cas_number | substance_common_name |
|---|---|---|---|---|---|---|
| 1 | 348c2b52-8fcc-11eb-924d-9cd76263cbd0 | Extended Model | 19.95 | 1 | CAS-2785 | Seasonal Review |
| 2 | 7441144 | Pilot Cluster A | 21.90 | 2 | CAS-2788 | Integrated Initiative |
| 3 | 3717628 | Baseline Review | 23.85 | 3 | CAS-2791 | Extended Model D |
| 4 | 3001009030280 | Distributed Initiative | 25.80 | 4 | CAS-2794 | Pilot Cluster |

## Synthesis

The relational schema for the carcinogenicity assessment domain achieves a balance between normalization and analytical convenience. Each entity type—chemical substances, assessments, epidemiological studies, animal studies, mechanisms, receptors, and pharmacokinetic parameters—is stored in its own table with a surrogate primary key. Foreign key columns embedded in the base tables encode one-to-one relationships (chemical to assessment) and one-to-many relationships (assessment to studies, chemical to mechanisms). The junction table `assessments_studies` decouples many-to-many associations where they arise. The seventeen materialized views denormalize these normalized tables along the most common analytical axes, allowing analysts to query domain facts—such as which chemicals have sufficient evidence for carcinogenicity, which animal studies support a given assessment, or which receptors are implicated in a mechanism—without writing explicit joins. The schema thus mirrors the scientific workflow: a chemical substance is evaluated, the evaluation is supported by human and animal evidence and grounded in molecular mechanisms, and all of these elements are linked through a network of foreign keys that can be traversed through the views.