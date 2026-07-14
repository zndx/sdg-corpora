## Foundations of Biological Research Management

Modern biological and anthropometric research demands rigorous coordination across study designs, measurement protocols, participant populations, and data management pipelines. A research organization must track how each study design connects to specific methodologies, how individual participants are enrolled and consented, how biological measurements are collected and validated, and how all resulting datasets are stored and governed. The following reference describes the core entities and their relationships within a research management system, drawing on representative records to illustrate how the domain operates in practice.

**Table `study_designs`**

| id | design_id | design_name | design_type | start_date | end_date | status | primary_objective |
|---|---|---|---|---|---|---|---|
| 1000 | 168549 | Composite Model | biocultural | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | planned | primary-primary-58 |
| 1001 | IVC20Idet50 | Compact Cluster A | observational | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | active | adaptive-primary-59 |
| 1002 | 7731867 | Legacy Review | self-report | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | completed | distributed-primary-60 |
| 1003 | 9736894 | Regional Initiative | experimental | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | archived | baseline-primary-61 |

Study designs form the organizational backbone of any research program. Each design carries a unique identifier, a human-readable name, and a classification that indicates whether the work is observational, experimental, biocultural, or based on self-report instruments. The status field tracks the lifecycle stage—planned, active, completed, or archived—while date ranges frame the intended study window. Consider the record for the Composite Model design (identifier 168549), which is currently in the planned stage with a primary objective labeled primary-primary-58. By contrast, Compact Cluster A (identifier IVC20Idet50) has progressed to active status, its objective marked adaptive-primary-59. The Legacy Review design (7731867) is completed, and the Regional Initiative (9736894) has been archived, suggesting a deliberate curation of historical records. These statuses and objectives guide downstream decisions about which methods and populations to engage.

**Table `research_methods`**

| id | method_id | method_name | method_category | accuracy_level | bias_risk | is_standardized |
|---|---|---|---|---|---|---|
| 1 | 209228 | Pilot Assessment | anthropometry | 22.70 | low | false |
| 2 | 7441161 | Baseline Survey | biomarker | 27.40 | medium | true |
| 3 | 89447 | Distributed Corridor A | dietary | 32.10 | high | false |
| 4 | 4180941 | Adaptive Series | energy_expenditure | 36.80 | low | true |

Research methods define the instruments and procedures through which data are collected. Each method is categorized by its measurement domain—anthropometry, biomarker analysis, dietary assessment, or energy expenditure—and is assigned an accuracy level expressed as a numeric score, a bias risk classification (low, medium, or high), and a flag indicating whether the method follows a standardized protocol. The Pilot Assessment method (209228), for instance, falls under anthropometry with an accuracy level of 22.70, a low bias risk, and is not standardized. The Baseline Survey (7441161) measures biomarkers at an accuracy of 27.40, carries a medium bias risk, and is standardized. The Distributed Corridor A method (89447) addresses dietary factors with an accuracy of 32.10 and high bias risk, while the Adaptive Series (4180941) evaluates energy expenditure at 36.80 accuracy with low bias risk and standardization. These attributes determine which methods are appropriate for specific study designs and measurement objectives.

**Table `biological_measurements`**

| measurement_id | measurement_value | unit_of_measure | measurement_date | measurement_type | reference_standard | status | dataset_id | research_method_id | individual_participant_id |
|---|---|---|---|---|---|---|---|---|---|
| 2618580 | 14.45 | kg | 2024-07-01T18:54:00 | anthropometric | extended-referenc-15 | valid | 1000 | 1 | 3990185 |
| 1450664 | 17.90 | cm | 2025-12-12T01:11:00 | biomarker | integrated-referenc-16 | invalid | 1001 | 2 | 4716387 |
| 8843762 | 21.35 | kcal/day | 2022-05-23T08:28:00 | energy_expenditure | seasonal-referenc-17 | pending_review | 1002 | 3 | 69430 |
| 392481 | 24.80 | mmHg | 2023-10-07T15:45:00 | anthropometric | regional-referenc-18 | valid | 1003 | 4 | c7460a44-8fcc-11eb-924d-9cd76263cbd0 |

Biological measurements capture the actual observations recorded during research activities. Each measurement carries a unique identifier, a numeric value with its unit of measure, a timestamp, and a classification by measurement type—anthropometric, biomarker, or energy expenditure. The reference standard field links each observation to a broader validation framework, while the status field indicates whether the value is valid, invalid, or pending review. The measurement 2618580 records an anthropometric value of 14.45 kg collected on 2024-07-01, validated against extended-referenc-15 and marked as valid. Measurement 1450664, a biomarker reading of 17.90 cm from 2025-12-12, is flagged as invalid and references integrated-referenc-16. The energy expenditure measurement 8843762 (21.35 kcal/day, dated 2022-05-23) is pending review under seasonal-referenc-17. Measurement 392481 records a blood pressure reading of 24.80 mmHg from 2023-10-07, validated against regional-referenc-18. Each measurement is associated with a dataset, a research method, and an individual participant, creating a traceable chain from raw observation to analytical record.

**Table `individuals`**

| participant_id | age | sex | ethnicity | enrollment_date | consent_status |
|---|---|---|---|---|---|
| 3990185 | 35 | male | primary-ethnicit-28 | 2022-05-11T16:00:00 | consented |
| 4716387 | 40 | female | adaptive-ethnicit-29 | 2023-10-22T23:17:00 | withdrawn |
| 69430 | 45 | intersex | distributed-ethnicit-30 | 2024-03-06T06:34:00 | pending |
| c7460a44-8fcc-11eb-924d-9cd76263cbd0 | 50 | male | baseline-ethnicit-31 | 2025-08-17T13:51:00 | consented |

Individuals represent the human participants enrolled in research programs. Each record captures a participant identifier, age, sex, ethnicity classification, enrollment date, and consent status. The participant 3990185 is a 35-year-old male of primary-ethnicit-28, enrolled on 2022-05-11 with consented status. Participant 4716387 is a 40-year-old female of adaptive-ethnicit-29, enrolled on 2023-10-22 but with withdrawn consent. Participant 69430 is a 45-year-old intersex individual of distributed-ethnicit-30, enrolled on 2024-03-06 with pending consent. Participant c7460a44-8fcc-11eb-924d-9cd76263cbd0 is a 50-year-old male of baseline-ethnicit-31, enrolled on 2025-08-17 and consented. Consent status is critical for compliance: withdrawn or pending participants may have their measurements excluded from analysis, and their data handling must follow ethical protocol requirements.

**Table `populations`**

| population_id | population_name | geographic_region | sample_size | inclusion_criteria | monitoring_status | created_at |
|---|---|---|---|---|---|---|
| 1 | Distributed Review | pilot-geograph-14 | 31 | legacy-inclusio-49 | active | 2025-01-01 00:14:00 |
| 2 | Adaptive Initiative D | extended-geograph-15 | 38 | compact-inclusio-50 | inactive | 2025-02-06 03:14:00 |
| 3 | Primary Model | integrated-geograph-16 | 45 | composite-inclusio-51 | historical | 2025-03-11 06:14:00 |
| 4 | Composite Cluster | seasonal-geograph-17 | 52 | primary-inclusio-52 | active | 2025-04-16 09:14:00 |

Populations define the broader groups from which participants are drawn or to which study results may be generalized. Each population record includes a population identifier, a descriptive name, a geographic region classification, a target sample size, inclusion criteria, and a monitoring status. The Distributed Review population (identifier 1) targets 31 individuals in the pilot-geograph-14 region with legacy-inclusio-49 criteria and is currently active. The Adaptive Initiative D population (identifier 2) targets 38 individuals in extended-geograph-15 with compact-inclusio-50 criteria and is inactive. The Primary Model population (identifier 3) targets 45 individuals in integrated-geograph-16 with composite-inclusio-51 criteria and holds historical status. The Composite Cluster population (identifier 4) targets 52 individuals in seasonal-geograph-17 with primary-inclusio-52 criteria and is active. Monitoring status determines whether a population is currently being recruited or is maintained for reference.

**Table `datasets`**

| id | dataset_id | dataset_name | format | creation_date | record_count | data_quality_score | storage_location | research_method_id | study_design_id |
|---|---|---|---|---|---|---|---|---|---|
| 1000 | 325443 | Composite Protocol | csv | 2022-01-13T12:24:00 | 50 | 8.70 | distributed-storage-48 | 1 | 1000 |
| 1001 | 4716402 | Compact Programme A | json | 2023-06-24T19:41:00 | 17 | 10.40 | baseline-storage-49 | 2 | 1001 |
| 1002 | 14202 | Legacy Standard | xml | 2024-11-08T02:58:00 | 19 | 12.10 | pilot-storage-50 | 3 | 1002 |
| 1003 | 1186088 | Regional Framework | sql_dump | 2025-04-19T09:15:00 | 17 | 13.80 | extended-storage-51 | 4 | 1003 |

Datasets are the structured collections of research data produced by study activities. Each dataset carries a unique identifier, a descriptive name, a file format (csv, json, xml, or sql_dump), a creation date, a record count, a data quality score, and a storage location. The Composite Protocol dataset (325443) is stored in csv format with 50 records, a quality score of 8.70, and resides in distributed-storage-48. The Compact Programme A dataset (4716402) uses json format with 17 records, a quality score of 10.40, and is stored in baseline-storage-49. The Legacy Standard dataset (14202) is in xml format with 19 records and a quality score of 12.10, located in pilot-storage-50. The Regional Framework dataset (1186088) is stored as a sql_dump with 17 records, a quality score of 13.80, and resides in extended-storage-51. Each dataset is linked to a specific research method and study design, ensuring provenance is preserved.

**Table `ethical_protocols`**

| id | protocol_id | protocol_name | approval_date | reviewing_body | principles | status | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|
| 100 | 9085260 | Baseline Initiative D | 2023-10-10T21:27:00 | compact-reviewin-62 | respect_for_persons | approved | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 101 | 6926357 | Distributed Model | 2024-03-21T04:44:00 | composite-reviewin-63 | beneficence | pending_review | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 102 | 4277008 | Adaptive Cluster | 2025-08-05T11:01:00 | primary-reviewin-64 | justice | revoked | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 103 | 726040 | Primary Review A | 2022-01-16T18:18:00 | adaptive-reviewin-65 | respect_for_persons | approved | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Ethical protocols establish the governance framework under which research involving human participants is conducted. These protocols define consent requirements, data handling rules, and compliance obligations. While the specific protocol records are not enumerated here, the system tracks which protocols apply to which study designs, which individuals are covered, and which datasets are governed. This tripartite linkage ensures that every measurement, every participant interaction, and every data artifact exists within a documented ethical boundary.

The relational architecture of the system is expressed through a network of junction tables that connect the core entities. The designs_methods table links study designs to the research methods they employ, enabling a single design to incorporate multiple methodological approaches. The designs_populations table associates study designs with the target populations they address, ensuring that recruitment targets are explicitly tied to study objectives. The designs_datasets table connects study designs to the datasets they produce, creating a direct lineage from plan to output.

**Table `designs_methods`**

| study_design_id | research_method_id |
|---|---|
| 1000 | 1 |
| 1000 | 2 |
| 1001 | 2 |
| 1001 | 3 |
| 1002 | 3 |
| 1002 | 4 |
| 1003 | 4 |
| 1003 | 1 |

**Table `designs_populations`**

| study_design_id | population_id |
|---|---|
| 1000 | 1 |
| 1000 | 2 |
| 1001 | 2 |
| 1001 | 3 |
| 1002 | 3 |
| 1002 | 4 |
| 1003 | 4 |
| 1003 | 1 |

**Table `designs_datasets`**

| study_design_id | dataset_id |
|---|---|
| 1000 | 1000 |
| 1000 | 1001 |
| 1001 | 1001 |
| 1001 | 1002 |
| 1002 | 1002 |
| 1002 | 1003 |
| 1003 | 1003 |
| 1003 | 1000 |

On the method side, the methods_designs table provides the reverse linkage from research methods back to the study designs that use them, supporting queries about which designs rely on a given method. The methods_measurements table links research methods to the biological measurements they generate, establishing the procedural origin of each observation. The methods_datasets table connects research methods to the datasets they produce, reinforcing the method-to-output chain.

**Table `methods_designs`**

| research_method_id | study_design_id |
|---|---|
| 1 | 1000 |
| 1 | 1001 |
| 2 | 1001 |
| 2 | 1002 |
| 3 | 1002 |
| 3 | 1003 |
| 4 | 1003 |
| 4 | 1000 |

**Table `methods_measurements`**

| research_method_id | measurement_id |
|---|---|
| 1 | 2618580 |
| 1 | 1450664 |
| 2 | 1450664 |
| 2 | 8843762 |
| 3 | 8843762 |
| 3 | 392481 |
| 4 | 392481 |
| 4 | 2618580 |

**Table `methods_datasets`**

| research_method_id | dataset_id |
|---|---|
| 1 | 1000 |
| 1 | 1001 |
| 2 | 1001 |
| 2 | 1002 |
| 3 | 1002 |
| 3 | 1003 |
| 4 | 1003 |
| 4 | 1000 |

Participant relationships are captured through the individuals_designs table, which records which individuals are enrolled in which study designs, and the individuals_measurements table, which links individual participants to the biological measurements they contributed. The individuals_populations table associates individuals with the populations they belong to, enabling demographic analysis and recruitment tracking.

**Table `individuals_designs`**

| individual_participant_id | study_design_id |
|---|---|
| 3990185 | 1000 |
| 3990185 | 1001 |
| 4716387 | 1001 |
| 4716387 | 1002 |
| 69430 | 1002 |
| 69430 | 1003 |
| c7460a44-8fcc-11eb-924d-9cd76263cbd0 | 1003 |
| c7460a44-8fcc-11eb-924d-9cd76263cbd0 | 1000 |

**Table `individuals_measurements`**

| individual_participant_id | measurement_id |
|---|---|
| 3990185 | 2618580 |
| 3990185 | 1450664 |
| 4716387 | 1450664 |
| 4716387 | 8843762 |
| 69430 | 8843762 |
| 69430 | 392481 |
| c7460a44-8fcc-11eb-924d-9cd76263cbd0 | 392481 |
| c7460a44-8fcc-11eb-924d-9cd76263cbd0 | 2618580 |

**Table `individuals_populations`**

| individual_participant_id | population_id |
|---|---|
| 3990185 | 1 |
| 3990185 | 2 |
| 4716387 | 2 |
| 4716387 | 3 |
| 69430 | 3 |
| 69430 | 4 |
| c7460a44-8fcc-11eb-924d-9cd76263cbd0 | 4 |
| c7460a44-8fcc-11eb-924d-9cd76263cbd0 | 1 |

Population relationships are expressed through the populations_individuals table, which maps populations to their enrolled individuals, and the populations_designs table, which links populations to the study designs that target them. These junctions support queries about population coverage, recruitment progress, and demographic representation across studies.

**Table `populations_individuals`**

| population_id | individual_participant_id |
|---|---|
| 1 | 3990185 |
| 1 | 4716387 |
| 2 | 4716387 |
| 2 | 69430 |
| 3 | 69430 |
| 3 | c7460a44-8fcc-11eb-924d-9cd76263cbd0 |
| 4 | c7460a44-8fcc-11eb-924d-9cd76263cbd0 |
| 4 | 3990185 |

**Table `populations_designs`**

| population_id | study_design_id |
|---|---|
| 1 | 1000 |
| 1 | 1001 |
| 2 | 1001 |
| 2 | 1002 |
| 3 | 1002 |
| 3 | 1003 |
| 4 | 1003 |
| 4 | 1000 |

Dataset relationships are captured through the datasets_measurements table, which links datasets to the biological measurements they contain, completing the provenance chain from individual observation to stored dataset.

**Table `datasets_measurements`**

| dataset_id | measurement_id |
|---|---|
| 1000 | 2618580 |
| 1000 | 1450664 |
| 1001 | 1450664 |
| 1001 | 8843762 |
| 1002 | 8843762 |
| 1002 | 392481 |
| 1003 | 392481 |
| 1003 | 2618580 |

Ethical governance is enforced through the protocols_designs table, which associates ethical protocols with the study designs they govern; the protocols_individuals table, which links protocols to the individuals they cover; and the protocols_datasets table, which ties protocols to the datasets they regulate. Together, these three junction tables ensure that every element of the research lifecycle is covered by an applicable ethical framework.

**Table `protocols_designs`**

| ethical_protocol_id | study_design_id |
|---|---|
| 100 | 1000 |
| 100 | 1001 |
| 101 | 1001 |
| 101 | 1002 |
| 102 | 1002 |
| 102 | 1003 |
| 103 | 1003 |
| 103 | 1000 |

**Table `protocols_individuals`**

| ethical_protocol_id | individual_participant_id |
|---|---|
| 100 | 3990185 |
| 100 | 4716387 |
| 101 | 4716387 |
| 101 | 69430 |
| 102 | 69430 |
| 102 | c7460a44-8fcc-11eb-924d-9cd76263cbd0 |
| 103 | c7460a44-8fcc-11eb-924d-9cd76263cbd0 |
| 103 | 3990185 |

**Table `protocols_datasets`**

| ethical_protocol_id | dataset_id |
|---|---|
| 100 | 1000 |
| 100 | 1001 |
| 101 | 1001 |
| 101 | 1002 |
| 102 | 1002 |
| 102 | 1003 |
| 103 | 1003 |
| 103 | 1000 |

The system provides a set of detail views that join these entities to answer specific analytical questions. The study_design_research_method_detail_view reveals which research methods are associated with each study design, answering the question of methodological composition. The study_design_population_detail_view shows which populations are targeted by each study design, supporting recruitment planning. The study_design_dataset_detail_view displays which datasets are produced by each study design, enabling output tracking.

**View `study_design_research_method_detail_view`**

```sql
CREATE VIEW study_design_research_method_detail_view AS
SELECT a.id, a.design_id, a.design_name, b.id AS method_id, b.method_id AS method_method_id, b.method_name AS method_method_name
FROM study_designs a
  JOIN designs_methods j ON j.study_design_id = a.id
  JOIN research_methods b ON b.id = j.research_method_id;
```

| id | design_id | design_name | method_id | method_method_id | method_method_name |
|---|---|---|---|---|---|
| 1000 | 168549 | Composite Model | 1 | 209228 | Pilot Assessment |
| 1000 | 168549 | Composite Model | 2 | 7441161 | Baseline Survey |
| 1001 | IVC20Idet50 | Compact Cluster A | 2 | 7441161 | Baseline Survey |
| 1001 | IVC20Idet50 | Compact Cluster A | 3 | 89447 | Distributed Corridor A |
| 1002 | 7731867 | Legacy Review | 3 | 89447 | Distributed Corridor A |
| 1002 | 7731867 | Legacy Review | 4 | 4180941 | Adaptive Series |
| 1003 | 9736894 | Regional Initiative | 4 | 4180941 | Adaptive Series |
| 1003 | 9736894 | Regional Initiative | 1 | 209228 | Pilot Assessment |

**View `study_design_population_detail_view`**

```sql
CREATE VIEW study_design_population_detail_view AS
SELECT a.id, a.design_id, a.design_name, b.population_id AS population_population_id, b.population_name AS population_population_name, b.geographic_region AS population_geographic_region
FROM study_designs a
  JOIN designs_populations j ON j.study_design_id = a.id
  JOIN populations b ON b.population_id = j.population_id;
```

| id | design_id | design_name | population_population_id | population_population_name | population_geographic_region |
|---|---|---|---|---|---|
| 1000 | 168549 | Composite Model | 1 | Distributed Review | pilot-geograph-14 |
| 1000 | 168549 | Composite Model | 2 | Adaptive Initiative D | extended-geograph-15 |
| 1001 | IVC20Idet50 | Compact Cluster A | 2 | Adaptive Initiative D | extended-geograph-15 |
| 1001 | IVC20Idet50 | Compact Cluster A | 3 | Primary Model | integrated-geograph-16 |
| 1002 | 7731867 | Legacy Review | 3 | Primary Model | integrated-geograph-16 |
| 1002 | 7731867 | Legacy Review | 4 | Composite Cluster | seasonal-geograph-17 |
| 1003 | 9736894 | Regional Initiative | 4 | Composite Cluster | seasonal-geograph-17 |
| 1003 | 9736894 | Regional Initiative | 1 | Distributed Review | pilot-geograph-14 |

**View `study_design_dataset_detail_view`**

```sql
CREATE VIEW study_design_dataset_detail_view AS
SELECT a.id, a.design_id, a.design_name, b.id AS dataset_id, b.dataset_id AS dataset_dataset_id, b.dataset_name AS dataset_dataset_name
FROM study_designs a
  JOIN designs_datasets j ON j.study_design_id = a.id
  JOIN datasets b ON b.id = j.dataset_id;
```

| id | design_id | design_name | dataset_id | dataset_dataset_id | dataset_dataset_name |
|---|---|---|---|---|---|
| 1000 | 168549 | Composite Model | 1000 | 325443 | Composite Protocol |
| 1000 | 168549 | Composite Model | 1001 | 4716402 | Compact Programme A |
| 1001 | IVC20Idet50 | Compact Cluster A | 1001 | 4716402 | Compact Programme A |
| 1001 | IVC20Idet50 | Compact Cluster A | 1002 | 14202 | Legacy Standard |
| 1002 | 7731867 | Legacy Review | 1002 | 14202 | Legacy Standard |
| 1002 | 7731867 | Legacy Review | 1003 | 1186088 | Regional Framework |
| 1003 | 9736894 | Regional Initiative | 1003 | 1186088 | Regional Framework |
| 1003 | 9736894 | Regional Initiative | 1000 | 325443 | Composite Protocol |

The research_method_study_design_detail_view provides the reverse perspective, showing which study designs use a given research method. The research_method_biological_measurement_detail_view reveals which biological measurements were collected using a specific method, supporting quality assessment. The research_method_dataset_detail_view shows which datasets were produced by a given method, completing the method-centric view.

**View `research_method_study_design_detail_view`**

```sql
CREATE VIEW research_method_study_design_detail_view AS
SELECT a.id, a.method_id, a.method_name, b.id AS design_id, b.design_id AS design_design_id, b.design_name AS design_design_name
FROM research_methods a
  JOIN methods_designs j ON j.research_method_id = a.id
  JOIN study_designs b ON b.id = j.study_design_id;
```

| id | method_id | method_name | design_id | design_design_id | design_design_name |
|---|---|---|---|---|---|
| 1 | 209228 | Pilot Assessment | 1000 | 168549 | Composite Model |
| 1 | 209228 | Pilot Assessment | 1001 | IVC20Idet50 | Compact Cluster A |
| 2 | 7441161 | Baseline Survey | 1001 | IVC20Idet50 | Compact Cluster A |
| 2 | 7441161 | Baseline Survey | 1002 | 7731867 | Legacy Review |
| 3 | 89447 | Distributed Corridor A | 1002 | 7731867 | Legacy Review |
| 3 | 89447 | Distributed Corridor A | 1003 | 9736894 | Regional Initiative |
| 4 | 4180941 | Adaptive Series | 1003 | 9736894 | Regional Initiative |
| 4 | 4180941 | Adaptive Series | 1000 | 168549 | Composite Model |

**View `research_method_biological_measurement_detail_view`**

```sql
CREATE VIEW research_method_biological_measurement_detail_view AS
SELECT a.id, a.method_id, a.method_name, b.measurement_id AS measurement_measurement_id, b.measurement_value AS measurement_measurement_value, b.unit_of_measure AS measurement_unit_of_measure
FROM research_methods a
  JOIN methods_measurements j ON j.research_method_id = a.id
  JOIN biological_measurements b ON b.measurement_id = j.measurement_id;
```

| id | method_id | method_name | measurement_measurement_id | measurement_measurement_value | measurement_unit_of_measure |
|---|---|---|---|---|---|
| 1 | 209228 | Pilot Assessment | 2618580 | 14.45 | kg |
| 1 | 209228 | Pilot Assessment | 1450664 | 17.90 | cm |
| 2 | 7441161 | Baseline Survey | 1450664 | 17.90 | cm |
| 2 | 7441161 | Baseline Survey | 8843762 | 21.35 | kcal/day |
| 3 | 89447 | Distributed Corridor A | 8843762 | 21.35 | kcal/day |
| 3 | 89447 | Distributed Corridor A | 392481 | 24.80 | mmHg |
| 4 | 4180941 | Adaptive Series | 392481 | 24.80 | mmHg |
| 4 | 4180941 | Adaptive Series | 2618580 | 14.45 | kg |

**View `research_method_dataset_detail_view`**

```sql
CREATE VIEW research_method_dataset_detail_view AS
SELECT a.id, a.method_id, a.method_name, b.id AS dataset_id, b.dataset_id AS dataset_dataset_id, b.dataset_name AS dataset_dataset_name
FROM research_methods a
  JOIN methods_datasets j ON j.research_method_id = a.id
  JOIN datasets b ON b.id = j.dataset_id;
```

| id | method_id | method_name | dataset_id | dataset_dataset_id | dataset_dataset_name |
|---|---|---|---|---|---|
| 1 | 209228 | Pilot Assessment | 1000 | 325443 | Composite Protocol |
| 1 | 209228 | Pilot Assessment | 1001 | 4716402 | Compact Programme A |
| 2 | 7441161 | Baseline Survey | 1001 | 4716402 | Compact Programme A |
| 2 | 7441161 | Baseline Survey | 1002 | 14202 | Legacy Standard |
| 3 | 89447 | Distributed Corridor A | 1002 | 14202 | Legacy Standard |
| 3 | 89447 | Distributed Corridor A | 1003 | 1186088 | Regional Framework |
| 4 | 4180941 | Adaptive Series | 1003 | 1186088 | Regional Framework |
| 4 | 4180941 | Adaptive Series | 1000 | 325443 | Composite Protocol |

The biological_measurement_dataset_view links measurements to their containing datasets, the biological_measurement_research_method_view links measurements to the methods that generated them, and the biological_measurement_individual_view links measurements to the participants who provided them. These views enable traceability from any measurement back to its procedural, data, and human origins.

**View `biological_measurement_dataset_view`**

```sql
CREATE VIEW biological_measurement_dataset_view AS
SELECT a.measurement_id, a.measurement_value, a.unit_of_measure, a.measurement_date, b.id AS dataset_id, b.dataset_id AS dataset_dataset_id, b.dataset_name AS dataset_dataset_name
FROM biological_measurements a JOIN datasets b ON a.dataset_id = b.id;
```

| measurement_id | measurement_value | unit_of_measure | measurement_date | dataset_id | dataset_dataset_id | dataset_dataset_name |
|---|---|---|---|---|---|---|
| 2618580 | 14.45 | kg | 2024-07-01T18:54:00 | 1000 | 325443 | Composite Protocol |
| 1450664 | 17.90 | cm | 2025-12-12T01:11:00 | 1001 | 4716402 | Compact Programme A |
| 8843762 | 21.35 | kcal/day | 2022-05-23T08:28:00 | 1002 | 14202 | Legacy Standard |
| 392481 | 24.80 | mmHg | 2023-10-07T15:45:00 | 1003 | 1186088 | Regional Framework |

**View `biological_measurement_research_method_view`**

```sql
CREATE VIEW biological_measurement_research_method_view AS
SELECT a.measurement_id, a.measurement_value, a.unit_of_measure, a.measurement_date, b.id AS method_id, b.method_id AS method_method_id, b.method_name AS method_method_name
FROM biological_measurements a JOIN research_methods b ON a.research_method_id = b.id;
```

| measurement_id | measurement_value | unit_of_measure | measurement_date | method_id | method_method_id | method_method_name |
|---|---|---|---|---|---|---|
| 2618580 | 14.45 | kg | 2024-07-01T18:54:00 | 1 | 209228 | Pilot Assessment |
| 1450664 | 17.90 | cm | 2025-12-12T01:11:00 | 2 | 7441161 | Baseline Survey |
| 8843762 | 21.35 | kcal/day | 2022-05-23T08:28:00 | 3 | 89447 | Distributed Corridor A |
| 392481 | 24.80 | mmHg | 2023-10-07T15:45:00 | 4 | 4180941 | Adaptive Series |

**View `biological_measurement_individual_view`**

```sql
CREATE VIEW biological_measurement_individual_view AS
SELECT a.measurement_id, a.measurement_value, a.unit_of_measure, a.measurement_date, b.participant_id AS individual_participant_id, b.age AS individual_age, b.sex AS individual_sex
FROM biological_measurements a JOIN individuals b ON a.individual_participant_id = b.participant_id;
```

| measurement_id | measurement_value | unit_of_measure | measurement_date | individual_participant_id | individual_age | individual_sex |
|---|---|---|---|---|---|---|
| 2618580 | 14.45 | kg | 2024-07-01T18:54:00 | 3990185 | 35 | male |
| 1450664 | 17.90 | cm | 2025-12-12T01:11:00 | 4716387 | 40 | female |
| 8843762 | 21.35 | kcal/day | 2022-05-23T08:28:00 | 69430 | 45 | intersex |
| 392481 | 24.80 | mmHg | 2023-10-07T15:45:00 | c7460a44-8fcc-11eb-924d-9cd76263cbd0 | 50 | male |

The individual_study_design_detail_view shows which study designs a given participant is enrolled in, the individual_biological_measurement_detail_view displays the measurements contributed by a specific participant, and the individual_population_detail_view identifies which population a participant belongs to. These views support participant-centric queries about enrollment, contribution, and demographic affiliation.

**View `individual_study_design_detail_view`**

```sql
CREATE VIEW individual_study_design_detail_view AS
SELECT a.participant_id, a.age, a.sex, b.id AS design_id, b.design_id AS design_design_id, b.design_name AS design_design_name
FROM individuals a
  JOIN individuals_designs j ON j.individual_participant_id = a.participant_id
  JOIN study_designs b ON b.id = j.study_design_id;
```

| participant_id | age | sex | design_id | design_design_id | design_design_name |
|---|---|---|---|---|---|
| 3990185 | 35 | male | 1000 | 168549 | Composite Model |
| 3990185 | 35 | male | 1001 | IVC20Idet50 | Compact Cluster A |
| 4716387 | 40 | female | 1001 | IVC20Idet50 | Compact Cluster A |
| 4716387 | 40 | female | 1002 | 7731867 | Legacy Review |
| 69430 | 45 | intersex | 1002 | 7731867 | Legacy Review |
| 69430 | 45 | intersex | 1003 | 9736894 | Regional Initiative |
| c7460a44-8fcc-11eb-924d-9cd76263cbd0 | 50 | male | 1003 | 9736894 | Regional Initiative |
| c7460a44-8fcc-11eb-924d-9cd76263cbd0 | 50 | male | 1000 | 168549 | Composite Model |

**View `individual_biological_measurement_detail_view`**

```sql
CREATE VIEW individual_biological_measurement_detail_view AS
SELECT a.participant_id, a.age, a.sex, b.measurement_id AS measurement_measurement_id, b.measurement_value AS measurement_measurement_value, b.unit_of_measure AS measurement_unit_of_measure
FROM individuals a
  JOIN individuals_measurements j ON j.individual_participant_id = a.participant_id
  JOIN biological_measurements b ON b.measurement_id = j.measurement_id;
```

| participant_id | age | sex | measurement_measurement_id | measurement_measurement_value | measurement_unit_of_measure |
|---|---|---|---|---|---|
| 3990185 | 35 | male | 2618580 | 14.45 | kg |
| 3990185 | 35 | male | 1450664 | 17.90 | cm |
| 4716387 | 40 | female | 1450664 | 17.90 | cm |
| 4716387 | 40 | female | 8843762 | 21.35 | kcal/day |
| 69430 | 45 | intersex | 8843762 | 21.35 | kcal/day |
| 69430 | 45 | intersex | 392481 | 24.80 | mmHg |
| c7460a44-8fcc-11eb-924d-9cd76263cbd0 | 50 | male | 392481 | 24.80 | mmHg |
| c7460a44-8fcc-11eb-924d-9cd76263cbd0 | 50 | male | 2618580 | 14.45 | kg |

**View `individual_population_detail_view`**

```sql
CREATE VIEW individual_population_detail_view AS
SELECT a.participant_id, a.age, a.sex, b.population_id AS population_population_id, b.population_name AS population_population_name, b.geographic_region AS population_geographic_region
FROM individuals a
  JOIN individuals_populations j ON j.individual_participant_id = a.participant_id
  JOIN populations b ON b.population_id = j.population_id;
```

| participant_id | age | sex | population_population_id | population_population_name | population_geographic_region |
|---|---|---|---|---|---|
| 3990185 | 35 | male | 1 | Distributed Review | pilot-geograph-14 |
| 3990185 | 35 | male | 2 | Adaptive Initiative D | extended-geograph-15 |
| 4716387 | 40 | female | 2 | Adaptive Initiative D | extended-geograph-15 |
| 4716387 | 40 | female | 3 | Primary Model | integrated-geograph-16 |
| 69430 | 45 | intersex | 3 | Primary Model | integrated-geograph-16 |
| 69430 | 45 | intersex | 4 | Composite Cluster | seasonal-geograph-17 |
| c7460a44-8fcc-11eb-924d-9cd76263cbd0 | 50 | male | 4 | Composite Cluster | seasonal-geograph-17 |
| c7460a44-8fcc-11eb-924d-9cd76263cbd0 | 50 | male | 1 | Distributed Review | pilot-geograph-14 |

The population_individual_detail_view lists all individuals enrolled in a given population, and the population_study_design_detail_view shows which study designs target a given population. These views support population-level analysis of recruitment and study coverage.

**View `population_individual_detail_view`**

```sql
CREATE VIEW population_individual_detail_view AS
SELECT a.population_id, a.population_name, a.geographic_region, b.participant_id AS individual_participant_id, b.age AS individual_age, b.sex AS individual_sex
FROM populations a
  JOIN populations_individuals j ON j.population_id = a.population_id
  JOIN individuals b ON b.participant_id = j.individual_participant_id;
```

| population_id | population_name | geographic_region | individual_participant_id | individual_age | individual_sex |
|---|---|---|---|---|---|
| 1 | Distributed Review | pilot-geograph-14 | 3990185 | 35 | male |
| 1 | Distributed Review | pilot-geograph-14 | 4716387 | 40 | female |
| 2 | Adaptive Initiative D | extended-geograph-15 | 4716387 | 40 | female |
| 2 | Adaptive Initiative D | extended-geograph-15 | 69430 | 45 | intersex |
| 3 | Primary Model | integrated-geograph-16 | 69430 | 45 | intersex |
| 3 | Primary Model | integrated-geograph-16 | c7460a44-8fcc-11eb-924d-9cd76263cbd0 | 50 | male |
| 4 | Composite Cluster | seasonal-geograph-17 | c7460a44-8fcc-11eb-924d-9cd76263cbd0 | 50 | male |
| 4 | Composite Cluster | seasonal-geograph-17 | 3990185 | 35 | male |

**View `population_study_design_detail_view`**

```sql
CREATE VIEW population_study_design_detail_view AS
SELECT a.population_id, a.population_name, a.geographic_region, b.id AS design_id, b.design_id AS design_design_id, b.design_name AS design_design_name
FROM populations a
  JOIN populations_designs j ON j.population_id = a.population_id
  JOIN study_designs b ON b.id = j.study_design_id;
```

| population_id | population_name | geographic_region | design_id | design_design_id | design_design_name |
|---|---|---|---|---|---|
| 1 | Distributed Review | pilot-geograph-14 | 1000 | 168549 | Composite Model |
| 1 | Distributed Review | pilot-geograph-14 | 1001 | IVC20Idet50 | Compact Cluster A |
| 2 | Adaptive Initiative D | extended-geograph-15 | 1001 | IVC20Idet50 | Compact Cluster A |
| 2 | Adaptive Initiative D | extended-geograph-15 | 1002 | 7731867 | Legacy Review |
| 3 | Primary Model | integrated-geograph-16 | 1002 | 7731867 | Legacy Review |
| 3 | Primary Model | integrated-geograph-16 | 1003 | 9736894 | Regional Initiative |
| 4 | Composite Cluster | seasonal-geograph-17 | 1003 | 9736894 | Regional Initiative |
| 4 | Composite Cluster | seasonal-geograph-17 | 1000 | 168549 | Composite Model |

The dataset_research_method_view links datasets to the research methods that produced them, the dataset_biological_measurement_detail_view shows which measurements are contained within a dataset, and the dataset_study_design_view connects datasets to the study designs that generated them. These views enable dataset-centric provenance queries.

**View `dataset_research_method_view`**

```sql
CREATE VIEW dataset_research_method_view AS
SELECT a.id, a.dataset_id, a.dataset_name, a.format, b.id AS method_id, b.method_id AS method_method_id, b.method_name AS method_method_name
FROM datasets a JOIN research_methods b ON a.research_method_id = b.id;
```

| id | dataset_id | dataset_name | format | method_id | method_method_id | method_method_name |
|---|---|---|---|---|---|---|
| 1000 | 325443 | Composite Protocol | csv | 1 | 209228 | Pilot Assessment |
| 1001 | 4716402 | Compact Programme A | json | 2 | 7441161 | Baseline Survey |
| 1002 | 14202 | Legacy Standard | xml | 3 | 89447 | Distributed Corridor A |
| 1003 | 1186088 | Regional Framework | sql_dump | 4 | 4180941 | Adaptive Series |

**View `dataset_biological_measurement_detail_view`**

```sql
CREATE VIEW dataset_biological_measurement_detail_view AS
SELECT a.id, a.dataset_id, a.dataset_name, b.measurement_id AS measurement_measurement_id, b.measurement_value AS measurement_measurement_value, b.unit_of_measure AS measurement_unit_of_measure
FROM datasets a
  JOIN datasets_measurements j ON j.dataset_id = a.id
  JOIN biological_measurements b ON b.measurement_id = j.measurement_id;
```

| id | dataset_id | dataset_name | measurement_measurement_id | measurement_measurement_value | measurement_unit_of_measure |
|---|---|---|---|---|---|
| 1000 | 325443 | Composite Protocol | 2618580 | 14.45 | kg |
| 1000 | 325443 | Composite Protocol | 1450664 | 17.90 | cm |
| 1001 | 4716402 | Compact Programme A | 1450664 | 17.90 | cm |
| 1001 | 4716402 | Compact Programme A | 8843762 | 21.35 | kcal/day |
| 1002 | 14202 | Legacy Standard | 8843762 | 21.35 | kcal/day |
| 1002 | 14202 | Legacy Standard | 392481 | 24.80 | mmHg |
| 1003 | 1186088 | Regional Framework | 392481 | 24.80 | mmHg |
| 1003 | 1186088 | Regional Framework | 2618580 | 14.45 | kg |

**View `dataset_study_design_view`**

```sql
CREATE VIEW dataset_study_design_view AS
SELECT a.id, a.dataset_id, a.dataset_name, a.format, b.id AS design_id, b.design_id AS design_design_id, b.design_name AS design_design_name
FROM datasets a JOIN study_designs b ON a.study_design_id = b.id;
```

| id | dataset_id | dataset_name | format | design_id | design_design_id | design_design_name |
|---|---|---|---|---|---|---|
| 1000 | 325443 | Composite Protocol | csv | 1000 | 168549 | Composite Model |
| 1001 | 4716402 | Compact Programme A | json | 1001 | IVC20Idet50 | Compact Cluster A |
| 1002 | 14202 | Legacy Standard | xml | 1002 | 7731867 | Legacy Review |
| 1003 | 1186088 | Regional Framework | sql_dump | 1003 | 9736894 | Regional Initiative |

Finally, the ethical_protocol_study_design_detail_view shows which study designs are governed by a given ethical protocol, the ethical_protocol_individual_detail_view lists the individuals covered by a protocol, and the ethical_protocol_dataset_detail_view identifies the datasets regulated by a protocol. These views ensure that compliance can be verified at every level of the research lifecycle.

**View `ethical_protocol_study_design_detail_view`**

```sql
CREATE VIEW ethical_protocol_study_design_detail_view AS
SELECT a.id, a.protocol_id, a.protocol_name, b.id AS design_id, b.design_id AS design_design_id, b.design_name AS design_design_name
FROM ethical_protocols a
  JOIN protocols_designs j ON j.ethical_protocol_id = a.id
  JOIN study_designs b ON b.id = j.study_design_id;
```

| id | protocol_id | protocol_name | design_id | design_design_id | design_design_name |
|---|---|---|---|---|---|
| 100 | 9085260 | Baseline Initiative D | 1000 | 168549 | Composite Model |
| 100 | 9085260 | Baseline Initiative D | 1001 | IVC20Idet50 | Compact Cluster A |
| 101 | 6926357 | Distributed Model | 1001 | IVC20Idet50 | Compact Cluster A |
| 101 | 6926357 | Distributed Model | 1002 | 7731867 | Legacy Review |
| 102 | 4277008 | Adaptive Cluster | 1002 | 7731867 | Legacy Review |
| 102 | 4277008 | Adaptive Cluster | 1003 | 9736894 | Regional Initiative |
| 103 | 726040 | Primary Review A | 1003 | 9736894 | Regional Initiative |
| 103 | 726040 | Primary Review A | 1000 | 168549 | Composite Model |

**View `ethical_protocol_individual_detail_view`**

```sql
CREATE VIEW ethical_protocol_individual_detail_view AS
SELECT a.id, a.protocol_id, a.protocol_name, b.participant_id AS individual_participant_id, b.age AS individual_age, b.sex AS individual_sex
FROM ethical_protocols a
  JOIN protocols_individuals j ON j.ethical_protocol_id = a.id
  JOIN individuals b ON b.participant_id = j.individual_participant_id;
```

| id | protocol_id | protocol_name | individual_participant_id | individual_age | individual_sex |
|---|---|---|---|---|---|
| 100 | 9085260 | Baseline Initiative D | 3990185 | 35 | male |
| 100 | 9085260 | Baseline Initiative D | 4716387 | 40 | female |
| 101 | 6926357 | Distributed Model | 4716387 | 40 | female |
| 101 | 6926357 | Distributed Model | 69430 | 45 | intersex |
| 102 | 4277008 | Adaptive Cluster | 69430 | 45 | intersex |
| 102 | 4277008 | Adaptive Cluster | c7460a44-8fcc-11eb-924d-9cd76263cbd0 | 50 | male |
| 103 | 726040 | Primary Review A | c7460a44-8fcc-11eb-924d-9cd76263cbd0 | 50 | male |
| 103 | 726040 | Primary Review A | 3990185 | 35 | male |

**View `ethical_protocol_dataset_detail_view`**

```sql
CREATE VIEW ethical_protocol_dataset_detail_view AS
SELECT a.id, a.protocol_id, a.protocol_name, b.id AS dataset_id, b.dataset_id AS dataset_dataset_id, b.dataset_name AS dataset_dataset_name
FROM ethical_protocols a
  JOIN protocols_datasets j ON j.ethical_protocol_id = a.id
  JOIN datasets b ON b.id = j.dataset_id;
```

| id | protocol_id | protocol_name | dataset_id | dataset_dataset_id | dataset_dataset_name |
|---|---|---|---|---|---|
| 100 | 9085260 | Baseline Initiative D | 1000 | 325443 | Composite Protocol |
| 100 | 9085260 | Baseline Initiative D | 1001 | 4716402 | Compact Programme A |
| 101 | 6926357 | Distributed Model | 1001 | 4716402 | Compact Programme A |
| 101 | 6926357 | Distributed Model | 1002 | 14202 | Legacy Standard |
| 102 | 4277008 | Adaptive Cluster | 1002 | 14202 | Legacy Standard |
| 102 | 4277008 | Adaptive Cluster | 1003 | 1186088 | Regional Framework |
| 103 | 726040 | Primary Review A | 1003 | 1186088 | Regional Framework |
| 103 | 726040 | Primary Review A | 1000 | 325443 | Composite Protocol |

The research management system described here provides a comprehensive framework for coordinating biological and anthropometric studies from design through data storage. Study designs establish the objectives and lifecycle stages, research methods define the measurement procedures, biological measurements capture the observations, individuals provide the human subjects, populations define the target groups, datasets store the results, and ethical protocols govern the entire process. The junction tables and detail views weave these entities into a coherent relational structure that supports provenance tracking, compliance verification, and analytical querying. By maintaining explicit links between every measurement, method, participant, and dataset, the system ensures that research outputs are traceable, auditable, and ethically grounded.