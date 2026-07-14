## The Architecture of Carcinogenicity Assessment

Carcinogenicity assessment is a multidisciplinary enterprise that synthesizes chemical characterization, epidemiological observation, animal experimentation, and molecular biology into a coherent risk evaluation. Practitioners must navigate a complex web of evidence: the physical and chemical properties of a substance, its pharmacokinetic behavior in living organisms, the biological receptors it engages, the mechanisms by which it may initiate or promote cancer, and the epidemiological and animal studies that provide the empirical backbone of any regulatory decision. The records described here capture every layer of this evidence chain, from the molecular formula of a chemical through to the final classification by bodies such as the IARC, NTP, or EPA. Understanding how these records relate to one another is essential for any practitioner who must trace a regulatory conclusion back to its evidentiary roots, or who must assemble a new assessment from disparate data sources.

**Table `chemical_substances`**

| chemical_substance_id | cas_number | common_name | molecular_formula | physical_state | solubility_in_water | solubility_in_organic_solvents | melting_point | boiling_point | carcinogenicity_assessment_id | pharmacokinetic_parameter_id | has_half_life_in_rodents_pharmacokinetic_parameter_id | receptor_id |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | CAS-2785 | Seasonal Review | distributed-molecula-84 | solid | false | distributed-solubili-66 | 2.20 | 18.95 | 1 | 1 | 1 | 790471 |
| 2 | CAS-2788 | Integrated Initiative | baseline-molecula-85 | liquid | true | baseline-solubili-67 | 4.40 | 20.90 | 2 | 2 | 2 | 3001009030190 |
| 3 | CAS-2791 | Extended Model D | pilot-molecula-86 | gas | false | pilot-solubili-68 | 6.60 | 22.85 | 3 | 3 | 3 | 3717630 |
| 4 | CAS-2794 | Pilot Cluster | extended-molecula-87 | solid | true | extended-solubili-69 | 8.80 | 24.80 | 4 | 4 | 4 | 1250200 |

The foundation of the domain is the chemical substance record, which anchors every downstream assessment. Each substance is identified by a unique `chemical_substance_id` and a `cas_number`, such as CAS-2785 for the substance known as Seasonal Review or CAS-2794 for Pilot Cluster. The `common_name` field carries the working designation used in reports, while `molecular_formula` provides the compositional identifier—distributed-molecula-84 for the first entry, extended-molecula-87 for the fourth. Physical characterization is captured through `physical_state`, which distinguishes solids (Seasonal Review, Pilot Cluster) from liquids (Integrated Initiative) and gases (Extended Model D). Solubility properties are recorded as boolean flags for `solubility_in_water` and as coded descriptors for `solubility_in_organic_solvents`, ranging from distributed-solubili-66 to extended-solubili-69. Thermal properties are quantified by `melting_point` and `boiling_point`, with values spanning from 2.20 to 8.80 for melting and 18.95 to 24.80 for boiling across the four sample substances. Critically, each chemical substance record carries foreign keys linking it to its primary `carcinogenicity_assessment_id`, its `pharmacokinetic_parameter_id`, a half-life indicator (`has_half_life_in_rodents_pharmacokinetic_parameter_id`), and a `receptor_id`, establishing the substance as the central pivot of the entire evidence network.

**Table `carcinogenicity_assessments`**

| carcinogenicity_assessment_id | assessment_date | carcinogenicity_status | evidence_level | reporting_body | report_year | report_title | is_mutagenic | genotoxicity_findings | chemical_substance_id | mechanism_of_carcinogenesis_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 2022-05-10T04:24:00 | known to be a human carcinogen | sufficient evidence | IARC | 22 | Composite Protocol | true | consistent | 1 | 100 |
| 2 | 2023-10-21T11:41:00 | reasonably anticipated to be a human carcinogen | limited evidence | NTP | 26 | Compact Programme A | false | inconclusive | 2 | 101 |
| 3 | 2024-03-05T18:58:00 | not classifiable as to its carcinogenicity to humans | inadequate evidence | EPA | 30 | Legacy Standard | true | equivocal | 3 | 102 |
| 4 | 2025-08-16T01:15:00 | known to be a human carcinogen | sufficient evidence | IARC | 34 | Regional Framework | false | consistent | 4 | 103 |

Carcinogenicity assessments represent the regulatory conclusions drawn about each substance. The `carcinogenicity_assessment_id` serves as the primary key, with records dated by `assessment_date`—for instance, 2022-05-10 for the first assessment and 2025-08-16 for the most recent. The `carcinogenicity_status` field carries the formal classification: known to be a human carcinogen, reasonably anticipated to be a human carcinogen, or not classifiable as to its carcinogenicity to humans. The `evidence_level` qualifies the strength of the underlying data, ranging from sufficient evidence to limited evidence to inadequate evidence. The `reporting_body` identifies the organization responsible for the assessment—IARC, NTP, or EPA—while `report_year` and `report_title` provide the publication context, such as the 2022 report titled Composite Protocol or the 2025 report titled Regional Framework. Molecular hazard indicators include `is_mutagenic`, a boolean flag, and `genotoxicity_findings`, which takes values such as consistent, inconclusive, or equivocal. Each assessment is linked to its `chemical_substance_id` and to a `mechanism_of_carcinogenesis_id`, tying the regulatory conclusion to both the substance under review and the biological mechanism invoked.

**Table `epidemiological_studies`**

| study_id | study_start_date | study_end_date | population_size | exposure_level | cohort_location | cancer_types_observed | mortality_increase | chemical_substance_id | carcinogenicity_assessment_id |
|---|---|---|---|---|---|---|---|---|---|
| Karyawan | 2023-02-12 | 2024-11-10 | 35 | high | Germany | lung cancer | 7.20 | 1 | 1 |
| 392491 | 2024-07-23 | 2025-04-21 | 42 | medium | Netherlands | non-Hodgkin lymphoma | 9.40 | 2 | 2 |
| 9568466 | 2025-12-07 | 2022-09-05 | 49 | low | United States | all cancer combined | 11.60 | 3 | 3 |
| 4985166 | 2022-05-18 | 2023-02-16 | 56 | high | Italy | lung cancer | 13.80 | 4 | 4 |

Epidemiological studies provide the human population evidence that supports or challenges regulatory classifications. The `study_id` field carries identifiers that may be alphanumeric, such as Karyawan, 392491, 9568466, or 4985166. Temporal scope is defined by `study_start_date` and `study_end_date`, with study durations spanning from approximately one to two years in the sample data. The `population_size` quantifies the cohort, ranging from 35 to 56 individuals in the four records shown. Exposure characterization includes `exposure_level` (high, medium, or low) and `cohort_location`, which identifies the geographic setting—Germany, Netherlands, United States, or Italy. The `cancer_types_observed` field records the specific malignancies detected, including lung cancer, non-Hodgkin lymphoma, and all cancer combined. The `mortality_increase` field quantifies the observed excess mortality, with values of 7.20, 9.40, 11.60, and 13.80 across the sample. Each study is linked to its `chemical_substance_id` and `carcinogenicity_assessment_id`, anchoring the human evidence to both the substance and the regulatory assessment it informs.

**Table `animal_carcinogenicity_studies`**

| id | study_id | study_start_date | study_end_date | animal_species | exposure_route | tissue_sites_affected | dose_dependent | tumor_incidence | chemical_substance_id | carcinogenicity_assessment_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 100 | Karyawan | 2023-02-12 | 2024-11-10 | rat | oral | liver | true | 15.70 | 1 | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 101 | 392491 | 2024-07-23 | 2025-04-21 | mouse | dermal | thyroid gland | false | 17.40 | 2 | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 102 | 9568466 | 2025-12-07 | 2022-09-05 | hamster | intraperitoneal | lymphatic system | true | 19.10 | 3 | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 103 | 4985166 | 2022-05-18 | 2023-02-16 | rat | oral | respiratory tract | false | 20.80 | 4 | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Animal carcinogenicity studies complement human epidemiological data with controlled experimental evidence. The primary key `id` distinguishes records such as 100, 101, 102, and 103, while the `study_id` field mirrors the epidemiological study identifiers, creating a natural pairing between human and animal evidence for each substance. Study dates follow the same temporal pattern as the epidemiological records. The `animal_species` field specifies the test organism—rat, mouse, or hamster—while `exposure_route` describes the administration method, including oral, dermal, and intraperitoneal routes. The `tissue_sites_affected` field identifies the anatomical locations where tumors were observed: liver, thyroid gland, lymphatic system, and respiratory tract. The `dose_dependent` boolean indicates whether tumor incidence correlated with dose, and `tumor_incidence` quantifies the percentage of affected animals, ranging from 15.70 to 20.80. Timestamps `created_at` and `updated_at` record the data management lifecycle. Each study links to its `chemical_substance_id` and `carcinogenicity_assessment_id`, maintaining the evidentiary chain.

**Table `mechanism_of_carcinogenesises`**

| id | mechanism_id | mechanism_name | is_necessary_step | is_sufficient_step | observed_in_species | biological_response | chemical_substance_id | receptor_id | carcinogenicity_assessment_id |
|---|---|---|---|---|---|---|---|---|---|
| 100 | 2106718 | Ah receptor binding | false | false | human | changes in gene expression | 1 | 790471 | 1 |
| 101 | 9085252 | gene expression changes | true | true | rodent | altered metabolism | 2 | 3001009030190 | 2 |
| 102 | 2935 | altered metabolism | false | false | human | altered cell growth and differentiation | 3 | 3717630 | 3 |
| 103 | TERIMA | altered cell growth | true | true | rodent | disruption of steroid-hormone and growth-factor signal-transduction pathways | 4 | 1250200 | 4 |

The mechanisms of carcinogenesis table captures the molecular and cellular pathways by which substances may initiate or promote cancer. The `id` field serves as the primary key, with values such as 100, 101, 102, and 103. The `mechanism_id` provides an additional identifier—2106718, 9085252, 2935, or TERIMA—while `mechanism_name` describes the biological process, including Ah receptor binding, gene expression changes, altered metabolism, and altered cell growth. The fields `is_necessary_step` and `is_sufficient_step` are boolean flags that characterize the logical role of each mechanism in the carcinogenic cascade; for example, gene expression changes and altered cell growth are marked as both necessary and sufficient in the sample data. The `observed_in_species` field specifies the taxonomic context—human or rodent—while `biological_response` describes the downstream cellular effect, ranging from changes in gene expression to disruption of steroid-hormone and growth-factor signal-transduction pathways. Each mechanism links to its `chemical_substance_id`, a `receptor_id`, and a `carcinogenicity_assessment_id`, embedding the mechanistic evidence within the broader assessment framework.

**Table `biological_receptors`**

| receptor_id | receptor_name | ubiquitous_in_vertebrates | affinity_for_t_c_d_d | function | chemical_substance_id | mechanism_of_carcinogenesis_id |
|---|---|---|---|---|---|---|
| 790471 | Ah receptor | true | high | signal transducer | 1 | 100 |
| 3001009030190 | aromatic hydrocarbon receptor | false | medium | activator for gene transcription | 2 | 101 |
| 3717630 | Ah receptor | true | low | signal transducer | 3 | 102 |
| 1250200 | aromatic hydrocarbon receptor | false | high | activator for gene transcription | 4 | 103 |

Biological receptors are the molecular targets through which chemical substances exert their carcinogenic effects. The `receptor_id` is the primary key, with values such as 790471, 3001009030190, 3717630, and 1250200. The `receptor_name` field identifies the receptor type, with entries including Ah receptor and aromatic hydrocarbon receptor. The `ubiquitous_in_vertebrates` boolean indicates whether the receptor is broadly distributed across vertebrate species. The `affinity_for_t_c_d_d` field characterizes binding affinity, taking values of high, medium, or low. The `function` field describes the receptor's biological role, such as signal transducer or activator for gene transcription. Each receptor record links to its `chemical_substance_id` and `mechanism_of_carcinogenesis_id`, establishing the receptor as the bridge between chemical exposure and mechanistic response.

**Table `pharmacokinetic_parameters`**

| id | parameter_id | parameter_name | value | unit | species | source_reference | chemical_substance_id |
|---|---|---|---|---|---|---|---|
| 1 | 348c2b52-8fcc-11eb-924d-9cd76263cbd0 | Extended Model | 19.95 | years | human | integrated-source-58 | 1 |
| 2 | 7441144 | Pilot Cluster A | 21.90 | days | rodent | seasonal-source-59 | 2 |
| 3 | 3717628 | Baseline Review | 23.85 | years | human | regional-source-60 | 3 |
| 4 | 3001009030280 | Distributed Initiative | 25.80 | days | rodent | legacy-source-61 | 4 |

Pharmacokinetic parameters quantify how chemical substances are absorbed, distributed, metabolized, and excreted in living organisms. The table captures the kinetic behavior that determines the internal dose at target tissues, which in turn influences the observed carcinogenic response. Parameters such as half-life in rodents are referenced by the `has_half_life_in_rodents_pharmacokinetic_parameter_id` field in the chemical substances table, creating a direct link between the substance record and its kinetic profile. These parameters are essential for extrapolating doses across species and for understanding the temporal dynamics of carcinogen exposure.

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

The assessments_studies table serves as the linkage layer that connects carcinogenicity assessments to the individual studies—both epidemiological and animal—that provide the evidentiary foundation for each regulatory conclusion. This junction table enables many-to-many relationships, allowing a single assessment to draw on multiple studies and a single study to inform multiple assessments. It is the structural backbone that makes the view-based queries possible, translating the relational design into interpretable evidence summaries.

### Cross-Referenced Evidence Views

The power of the domain model lies in its joined views, which synthesize records from multiple tables into interpretable evidence summaries. Each view answers a specific analytical question by combining data from the base tables through foreign-key relationships.

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

This view joins chemical substances with their primary carcinogenicity assessments, answering the question: what is the regulatory classification of each substance? A row for Seasonal Review (CAS-2785) would show the known-to-be-a-human-carcinogen status assessed by IARC with sufficient evidence, while Integrated Initiative (CAS-2788) would show the reasonably-anticipated classification by NTP with limited evidence.

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

This view links chemical substances to their pharmacokinetic parameters, answering: what are the absorption and elimination characteristics of each substance? For Pilot Cluster (CAS-2794), the view would surface the kinetic parameters that determine how long the substance persists in biological systems, including the half-life indicator referenced from the substance record.

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

This view connects chemical substances to the biological receptors they engage, answering: which molecular targets does each substance interact with? Seasonal Review (CAS-2785) would be linked to the Ah receptor (receptor_id 790471), which functions as a signal transducer with high affinity for T.C.D.D and is ubiquitous in vertebrates.

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

This view presents the assessment-centric perspective, answering: what substance is the subject of each assessment? For the assessment dated 2024-03-05 with status not classifiable as to its carcinogenicity to humans, the view would surface Extended Model D (CAS-2791) assessed by the EPA with inadequate evidence and equivocal genotoxicity findings.

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

This view joins assessments with their supporting epidemiological studies, answering: what human population evidence underpins each regulatory conclusion? The assessment for Seasonal Review (assessment_id 1) would be linked to the Karyawan study conducted in Germany, which observed lung cancer in a cohort of 35 individuals with high exposure and a mortality increase of 7.20.

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

This view connects assessments with their supporting animal studies, answering: what experimental animal evidence supports each assessment? The assessment for Integrated Initiative (assessment_id 2) would be linked to the study with id 101, conducted on mice via dermal exposure, affecting the thyroid gland, with a tumor incidence of 17.40 and a non-dose-dependent pattern.

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

This view links assessments to the mechanisms of carcinogenesis they invoke, answering: what biological pathway is cited as the basis for each assessment? The assessment for Extended Model D (assessment_id 3) would be linked to the mechanism of altered metabolism (mechanism_id 2935), which is neither necessary nor sufficient, observed in humans, with the biological response of altered cell growth and differentiation.

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

This view presents the study-centric perspective, answering: which chemical substance is the subject of each epidemiological investigation? The Karyawan study would surface Seasonal Review (CAS-2785), a solid substance with a melting point of 2.20 and boiling point of 18.95, confirming the substance identity behind the human population evidence.

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

This view connects epidemiological studies to their corresponding assessments, answering: what regulatory conclusion does each study support? The study 4985166, conducted in Italy with 56 individuals and high exposure, would be linked to the assessment for Pilot Cluster (assessment_id 4), classified as known to be a human carcinogen by IARC with sufficient evidence.

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

This view presents the animal study-centric perspective, answering: which substance was tested in each animal experiment? The animal study with id 102, conducted on hamsters via intraperitoneal exposure affecting the lymphatic system, would surface Extended Model D (CAS-2791), a gaseous substance with pilot molecular formula and pilot solubility characteristics.

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

This view links animal studies to their corresponding assessments, answering: what regulatory conclusion is informed by each animal experiment? The animal study 103, conducted on rats via oral exposure affecting the respiratory tract with a tumor incidence of 20.80, would be linked to the assessment for Pilot Cluster (assessment_id 4), which carries the IARC classification of known to be a human carcinogen.

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

This view connects mechanisms to the substances they describe, answering: which substance is associated with each proposed carcinogenic mechanism? The mechanism of Ah receptor binding (mechanism_id 2106718) would be linked to Seasonal Review (CAS-2785), indicating that this substance's carcinogenicity is attributed to Ah receptor engagement with the observed biological response of changes in gene expression.

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

This view links mechanisms to the biological receptors involved, answering: which receptor mediates each proposed mechanism? The mechanism of altered cell growth (mechanism_id TERIMA), which is both necessary and sufficient and observed in rodents, would be linked to the aromatic hydrocarbon receptor (receptor_id 1250200), which functions as an activator for gene transcription with high affinity for T.C.D.D.

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

This view connects mechanisms to the assessments that cite them, answering: which assessment invokes each mechanism? The mechanism of gene expression changes (mechanism_id 9085252), marked as both necessary and sufficient and observed in rodents, would be linked to the assessment for Integrated Initiative (assessment_id 2), which carries the NTP classification of reasonably anticipated to be a human carcinogen with limited evidence.

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

This view presents the receptor-centric perspective, answering: which substance interacts with each biological receptor? The aromatic hydrocarbon receptor (receptor_id 3001009030190), which is not ubiquitous in vertebrates and has medium affinity for T.C.D.D, would be linked to Integrated Initiative (CAS-2788), a liquid substance with baseline molecular formula and baseline solubility characteristics.

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

This view links biological receptors to the mechanisms they mediate, answering: which mechanism is associated with each receptor? The Ah receptor (receptor_id 3717630), which is ubiquitous in vertebrates with low affinity for T.C.D.D, would be linked to the mechanism of altered metabolism (mechanism_id 2935), which is neither necessary nor sufficient and produces the biological response of altered cell growth and differentiation.

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

This view connects pharmacokinetic parameters to the substances they characterize, answering: which substance has which kinetic profile? The pharmacokinetic parameters linked to Extended Model D (CAS-2791) would include the half-life data referenced by has_half_life_in_rodents_pharmacokinetic_parameter_id 3, providing the kinetic foundation for understanding how this gaseous substance behaves in biological systems over time.

### Synthesis

The domain of carcinogenicity assessment is defined by a network of interlocking records that span from molecular properties to regulatory conclusions. Chemical substances serve as the central entities, each linked to its pharmacokinetic profile, its biological receptor targets, and its primary carcinogenicity assessment. Assessments, in turn, are supported by epidemiological studies and animal carcinogenicity studies, while invoking specific mechanisms of carcinogenesis that are mediated by biological receptors. The views synthesized from these base tables provide the practitioner with multiple analytical lenses: substance-centric, assessment-centric, study-centric, mechanism-centric, and receptor-centric. Each lens answers a distinct question about the evidence landscape, and together they form a comprehensive framework for understanding, evaluating, and communicating the basis of carcinogenicity classifications. The integrity of this framework depends on the consistency of the foreign-key relationships that bind the records together, ensuring that every regulatory conclusion can be traced back through mechanisms and receptors to the underlying chemical and kinetic properties, and forward through the epidemiological and animal studies that provide the empirical validation.