## Predictive Modelling in Chronic Dialysis Care

Chronic kidney disease demands continuous monitoring of biochemical markers and regular dialysis treatments, creating a rich tapestry of clinical data that spans patients, laboratories, treatment sessions, and care facilities. In this domain, practitioners track individual patients through repeated dialysis sessions, measure their blood chemistry at each visit, and apply neural network models to predict treatment outcomes or disease progression. The data infrastructure supporting this work must capture who the patients are, what their clinical profiles look like, which neural network models have been trained on their data, where treatments occur, and how sessions are scheduled and executed. Every record in this system serves as a timestamped snapshot of a patient's physiological state or a treatment event, and the relationships between these records enable both retrospective analysis and prospective prediction.

**Table `patients`**

| id | patient_id | age | sex | diagnosis | clinical_profile_id | session_id |
|---|---|---|---|---|---|---|
| 1 | 8387541 | 35 | male | normal | 1 | 1186087 |
| 2 | 10207142 | 40 | female | abnormal | 2 | 2087748 |
| 3 | 7119782 | 45 | male | normal | 3 | 4716414 |
| 4 | gd_acc_160003 | 50 | female | abnormal | 4 | 005588c4-9bac-11eb-a8a2-19ed5c03f8d3 |

The patients table forms the foundational registry of individuals receiving dialysis care. Each row represents a unique patient identified by a patient_id, which may be a numeric identifier such as `8387541` or a structured identifier like `gd_acc_160003`. The age column records the patient's age at the time of registration, ranging from 35 to 50 in the current dataset, while the sex column distinguishes between male and female patients. The diagnosis column classifies each patient's condition as either `normal` or `abnormal`, providing a high-level clinical categorization. The clinical_profile_id column links each patient to their most recent biochemical assessment, and the session_id column records the identifier of their most recent dialysis session, which may be numeric (such as `1186087`) or a UUID-format string (`005588c4-9bac-11eb-a8a2-19ed5c03f8d3`). This table answers the fundamental question of which patients are in the care system and what their current clinical and treatment status is.

**Table `clinical_profiles`**

| id | profile_id | urea | creatinine | potassium | sodium | calcium | phosphorus | uric_acid | patient_id | neural_network_model_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 72623baa-9bad-11eb-a8a2-19ed5c03f8d3 | 8.95 | 21.70 | 17.95 | 4.70 | 4.95 | 16.45 | 22.45 | 1 | 1 |
| 2 | d9d925ce-8fcc-11eb-924d-9cd76263cbd0 | 11.90 | 26.40 | 19.90 | 7.40 | 8.90 | 19.90 | 25.90 | 2 | 2 |
| 3 | 10207150 | 14.85 | 31.10 | 21.85 | 10.10 | 12.85 | 23.35 | 29.35 | 3 | 3 |
| 4 | 611506 | 17.80 | 35.80 | 23.80 | 12.80 | 16.80 | 26.80 | 32.80 | 4 | 4 |

Clinical profiles capture the biochemical state of a patient at a specific point in time, recording seven key blood chemistry markers that are critical for dialysis management. The profile_id column provides a unique identifier for each profile, typically a UUID such as `72623baa-9bad-11eb-a8a2-19ed5c03f8d3`. The urea column measures blood urea concentration, with values ranging from 8.95 to 17.80 across the dataset. Creatinine, another waste product filtered by healthy kidneys, ranges from 21.70 to 35.80. Potassium levels span from 17.95 to 23.80, while sodium ranges from 4.70 to 12.80. Calcium values extend from 4.95 to 16.80, phosphorus from 16.45 to 26.80, and uric acid from 22.45 to 32.80. The progressive increase in these values across the four profiles reflects worsening renal function, with patient 4 exhibiting the highest concentrations across all markers. Each profile is linked to a patient via the patient_id column and to a neural network model via the neural_network_model_id column, indicating which predictive model was used or trained on that particular profile.

**Table `dialysis_sessions`**

| session_id | start_date | duration | status | patient_id | facility_id |
|---|---|---|---|---|---|
| 1186087 | 2022-09-05T20:24:00 | 4.20 | scheduled | 1 | 1000 |
| 2087748 | 2023-02-16T03:41:00 | 8.40 | in_progress | 2 | 1001 |
| 4716414 | 2024-07-27T10:58:00 | 12.60 | completed | 3 | 1002 |
| 005588c4-9bac-11eb-a8a2-19ed5c03f8d3 | 2025-12-11T17:15:00 | 16.80 | failed | 4 | 1003 |

Dialysis sessions represent the actual treatment events where patients receive renal replacement therapy. Each session is identified by a session_id, which may be numeric (such as `1186087` or `4716414`) or a UUID (`005588c4-9bac-11eb-a8a2-19ed5c03f8d3`). The start_date column records when the session began, using ISO 8601 format with timestamps spanning from September 2022 through December 2025. Duration measures the length of the treatment in hours, ranging from 4.20 hours for the first session to 16.80 hours for the fourth, suggesting that treatment intensity varies considerably between patients or clinical situations. The status column tracks the current state of each session, with values including `scheduled`, `in_progress`, `completed`, and `failed`, providing real-time operational visibility. Each session is associated with a specific patient through the patient_id column and with a treatment facility through the facility_id column, creating the link between clinical care and the physical infrastructure where it occurs.

**Table `neural_network_models`**

| id | model_id | architecture_type | accuracy | training_date | clinical_profile_id |
|---|---|---|---|---|---|
| 1 | 1562845 | feed_forward_back_propagation | 17.20 | 2025-12-24 | 1 |
| 2 | 10039 | cascade_forward_back_propagation | 21.40 | 2022-05-08 | 2 |
| 3 | d3c3d00e-8fb2-11eb-924d-9cd76263cbd0 | feed_forward_back_propagation | 25.60 | 2023-10-19 | 3 |
| 4 | gd_taxr_3 | cascade_forward_back_propagation | 29.80 | 2024-03-03 | 4 |

Neural network models represent the computational tools applied to clinical data for prediction and analysis. Each model is identified by an id and a model_id, where model_id may be numeric (such as `1562845` or `10039`) or structured (`d3c3d00e-8fb2-11eb-924d-9cd76263cbd0`). The architecture_type column specifies the model's neural network architecture, with two types appearing in the dataset: `feed_forward_back_propagation` and `cascade_forward_back_propagation`. Accuracy values range from 17.20 to 29.80, with the cascade forward architecture generally achieving higher accuracy than the feed forward variant. The training_date column records when each model was last trained, spanning from May 2022 to December 2025, and the clinical_profile_id column links each model to the specific clinical profile on which it was trained or validated. These models serve as the analytical engine of the system, transforming raw biochemical measurements into actionable predictions.

**Table `facilities`**

| id | facility_id | name | type | location | session_id | created_at |
|---|---|---|---|---|---|---|
| 1000 | 69447 | Extended Review | hospital | extended-location-99 | 1186087 | 2025-01-01 00:14:00 |
| 1001 | 1040 | Pilot Initiative A | hemodialysis_center | integrated-location-100 | 2087748 | 2025-02-06 03:14:00 |
| 1002 | 2986228 | Baseline Model | hospital | seasonal-location-101 | 4716414 | 2025-03-11 06:14:00 |
| 1003 | ChIJvSxSbfdv5kcRanVzI8RRu20 | Distributed Cluster | hemodialysis_center | regional-location-102 | 005588c4-9bac-11eb-a8a2-19ed5c03f8d3 | 2025-04-16 09:14:00 |

Facilities represent the physical locations where dialysis treatments are delivered. Each facility is identified by an id and a facility_id, where facility_id may be numeric (such as `69447` or `1040`) or a Google Places-style identifier (`ChIJvSxSbfdv5kcRanVzI8RRu20`). The name column provides a descriptive label for each facility, with names such as `Extended Review`, `Pilot Initiative A`, `Baseline Model`, and `Distributed Cluster`. The type column distinguishes between `hospital` and `hemodialysis_center`, indicating the institutional setting of care. The location column provides a categorical location descriptor such as `extended-location-99` or `regional-location-102`, while the session_id column links each facility record to a specific dialysis session, and the created_at column records when the facility record was established, with dates ranging from January 2025 to April 2025.

**Table `models_patients`**

| neural_network_model_id | patient_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

The models_patients table establishes the many-to-many relationships between neural network models and patients, indicating which models have been applied to which patients' data. This junction table contains pairs of neural_network_model_id and patient_id, revealing that individual models may serve multiple patients and individual patients may be served by multiple models. For example, model 1 is associated with both patient 1 and patient 2, while patient 2 is served by both model 1 and model 2. Patient 4 is associated with model 4, and notably, model 4 is also linked to patient 1, creating cross-patient model sharing. This structure enables flexible model deployment where a single trained model can be applied across a patient population, and individual patients can benefit from multiple predictive models.

## Clinical Profile Analysis

The view v_patient_clinical_profile joins patient demographic information with their biochemical measurements, answering the question of how individual patient characteristics correlate with their clinical laboratory values. This join produces records that combine the patient's age, sex, and diagnosis with the full set of seven biochemical markers from their clinical profile. For instance, a patient aged 35 with a normal diagnosis would have urea at 8.95, creatinine at 21.70, and potassium at 17.95, while a patient aged 50 with an abnormal diagnosis would show urea at 17.80, creatinine at 35.80, and potassium at 23.80. The view provides a unified record for clinical review, allowing practitioners to assess whether demographic factors such as age or sex correlate with biochemical marker levels.

The view v_patient_dialysis_session connects patient records with their dialysis treatment sessions, enabling analysis of how patient characteristics relate to treatment parameters. This join produces records that include the patient's age, sex, and diagnosis alongside the session's start date, duration, status, and facility identifier. A 40-year-old female patient with an abnormal diagnosis might have a session scheduled for February 2023 with a duration of 8.40 hours and a status of in_progress, while a 50-year-old female with an abnormal diagnosis might have a session that failed, recorded with a UUID-format session identifier. This view supports operational oversight by allowing practitioners to see which patients are due for treatment, which sessions are currently active, and which have encountered problems.

## Facility and Session Operations

The view v_dialysis_session_facility joins dialysis session records with facility information, answering the question of which treatments are delivered at which locations and under what conditions. This join produces records that combine the session's start date, duration, and status with the facility's name, type, and location descriptor. For example, a session with a duration of 4.20 hours and status of scheduled might be associated with a facility named `Extended Review` of type hospital located at `extended-location-99`, while a session with a duration of 16.80 hours and status of failed might be linked to a facility named `Distributed Cluster` of type hemodialysis_center at `regional-location-102`. This view supports facility-level reporting and resource allocation by showing which facilities are handling which sessions and their outcomes.

The view v_facility_dialysis_session provides the inverse perspective, organizing sessions by facility to give a facility-centric view of treatment activity. This join allows practitioners to see all sessions associated with a particular facility, enabling assessment of facility workload, treatment success rates, and scheduling patterns. A facility named `Pilot Initiative A` of type hemodialysis_center might have a session with a duration of 8.40 hours and status of in_progress, while a facility named `Baseline Model` of type hospital might have a session with a duration of 12.60 hours and status of completed. This view is particularly useful for administrative reporting and for identifying facilities that may need additional resources or attention.

## Neural Network Model Relationships

The view v_clinical_profile_neural_network_model joins clinical profiles with the neural network models trained on them, answering the question of which models correspond to which biochemical measurements and how model accuracy varies across profiles. This join produces records that combine the seven biochemical markers from the clinical profile with the model's architecture type, accuracy, and training date. A clinical profile with urea at 8.95 and creatinine at 21.70 might be linked to a feed forward back propagation model with an accuracy of 17.20 trained on December 2025, while a profile with urea at 17.80 and creatinine at 35.80 might be linked to a cascade forward back propagation model with an accuracy of 29.80 trained on March 2024. This view supports model evaluation by allowing practitioners to compare accuracy across different architectures and training dates, and to assess whether model performance correlates with the severity of the clinical profile.

The view v_neural_network_model_clinical_profile provides the inverse perspective, organizing clinical profiles by neural network model to give a model-centric view of the data on which each model was trained. This join allows practitioners to see all clinical profiles associated with a particular model, enabling assessment of model generalization and the range of clinical conditions the model has encountered. A model with architecture type cascade forward back propagation and accuracy of 21.40 might be associated with a clinical profile showing urea at 11.90 and creatinine at 26.40, while a model with architecture type feed forward back propagation and accuracy of 25.60 might be associated with a profile showing urea at 14.85 and creatinine at 31.10. This view supports model lifecycle management by showing the breadth of training data for each model.

The view v_neural_network_model_patient_detail joins neural network models with patient information through the models_patients junction table, answering the question of which patients are served by which predictive models. This join produces records that combine the patient's age, sex, and diagnosis with the model's architecture type, accuracy, and training date. A 35-year-old male patient with a normal diagnosis might be served by a feed forward back propagation model with an accuracy of 17.20, while a 50-year-old female patient with an abnormal diagnosis might be served by a cascade forward back propagation model with an accuracy of 29.80. This view supports personalized care planning by showing which predictive models are being applied to each patient's data, enabling practitioners to understand the analytical basis for treatment recommendations.

## Cross-Domain Integration

The view v_clinical_profile_patient joins clinical profiles with patient records, providing a comprehensive view that combines biochemical measurements with demographic and diagnostic information. This join produces records that include the patient's age, sex, and diagnosis alongside the full set of biochemical markers and the associated neural network model identifier. A patient aged 45 with a normal diagnosis might have a clinical profile with urea at 14.85, creatinine at 31.10, and potassium at 21.85, linked to neural network model 3. This view serves as a clinical dashboard, bringing together the patient's identity, their current biochemical state, and the predictive model that has been applied to their data.

The view v_dialysis_session_patient joins dialysis sessions with patient records, providing a treatment-centric view that connects session details with patient demographics. This join produces records that include the patient's age, sex, and diagnosis alongside the session's start date, duration, status, and facility identifier. A 40-year-old female patient with an abnormal diagnosis might have a dialysis session scheduled for February 2023 with a duration of 8.40 hours at facility 1001. This view supports patient-level treatment tracking, allowing practitioners to see the complete history of a patient's dialysis sessions alongside their demographic and diagnostic information.

## Synthesis

The data infrastructure described here supports a comprehensive approach to chronic dialysis care, integrating patient demographics, biochemical measurements, treatment sessions, predictive models, and care facilities into a unified system. The patients table anchors the registry, while clinical profiles capture the physiological state that drives treatment decisions. Dialysis sessions record the actual delivery of care, and facilities provide the physical context in which treatments occur. Neural network models represent the analytical layer that transforms raw biochemical data into predictions, and the models_patients junction table enables flexible model deployment across the patient population. The various views provide different perspectives on this integrated data, from patient-centric clinical reviews to facility-level operational reports, each answering specific questions that practitioners need to address in their daily work. Together, these tables and views form the data foundation upon which clinical decisions, treatment planning, and predictive analytics are built, supporting the complex operational requirements of chronic dialysis care delivery.

## Data appendix

**View `v_patient_clinical_profile`**

```sql
CREATE VIEW v_patient_clinical_profile AS
SELECT a.id, a.patient_id, a.age, a.sex, b.id AS profile_id, b.profile_id AS profile_profile_id, b.urea AS profile_urea
FROM patients a JOIN clinical_profiles b ON a.clinical_profile_id = b.id;
```

| id | patient_id | age | sex | profile_id | profile_profile_id | profile_urea |
|---|---|---|---|---|---|---|
| 1 | 8387541 | 35 | male | 1 | 72623baa-9bad-11eb-a8a2-19ed5c03f8d3 | 8.95 |
| 2 | 10207142 | 40 | female | 2 | d9d925ce-8fcc-11eb-924d-9cd76263cbd0 | 11.90 |
| 3 | 7119782 | 45 | male | 3 | 10207150 | 14.85 |
| 4 | gd_acc_160003 | 50 | female | 4 | 611506 | 17.80 |

**View `v_patient_dialysis_session`**

```sql
CREATE VIEW v_patient_dialysis_session AS
SELECT a.id, a.patient_id, a.age, a.sex, b.session_id AS session_session_id, b.start_date AS session_start_date, b.duration AS session_duration
FROM patients a JOIN dialysis_sessions b ON a.session_id = b.session_id;
```

| id | patient_id | age | sex | session_session_id | session_start_date | session_duration |
|---|---|---|---|---|---|---|
| 1 | 8387541 | 35 | male | 1186087 | 2022-09-05T20:24:00 | 4.20 |
| 2 | 10207142 | 40 | female | 2087748 | 2023-02-16T03:41:00 | 8.40 |
| 3 | 7119782 | 45 | male | 4716414 | 2024-07-27T10:58:00 | 12.60 |
| 4 | gd_acc_160003 | 50 | female | 005588c4-9bac-11eb-a8a2-19ed5c03f8d3 | 2025-12-11T17:15:00 | 16.80 |

**View `v_clinical_profile_patient`**

```sql
CREATE VIEW v_clinical_profile_patient AS
SELECT a.id, a.profile_id, a.urea, a.creatinine, b.id AS patient_id, b.patient_id AS patient_patient_id, b.age AS patient_age
FROM clinical_profiles a JOIN patients b ON a.patient_id = b.id;
```

| id | profile_id | urea | creatinine | patient_id | patient_patient_id | patient_age |
|---|---|---|---|---|---|---|
| 1 | 72623baa-9bad-11eb-a8a2-19ed5c03f8d3 | 8.95 | 21.70 | 1 | 8387541 | 35 |
| 2 | d9d925ce-8fcc-11eb-924d-9cd76263cbd0 | 11.90 | 26.40 | 2 | 10207142 | 40 |
| 3 | 10207150 | 14.85 | 31.10 | 3 | 7119782 | 45 |
| 4 | 611506 | 17.80 | 35.80 | 4 | gd_acc_160003 | 50 |

**View `v_clinical_profile_neural_network_model`**

```sql
CREATE VIEW v_clinical_profile_neural_network_model AS
SELECT a.id, a.profile_id, a.urea, a.creatinine, b.id AS model_id, b.model_id AS model_model_id, b.architecture_type AS model_architecture_type
FROM clinical_profiles a JOIN neural_network_models b ON a.neural_network_model_id = b.id;
```

| id | profile_id | urea | creatinine | model_id | model_model_id | model_architecture_type |
|---|---|---|---|---|---|---|
| 1 | 72623baa-9bad-11eb-a8a2-19ed5c03f8d3 | 8.95 | 21.70 | 1 | 1562845 | feed_forward_back_propagation |
| 2 | d9d925ce-8fcc-11eb-924d-9cd76263cbd0 | 11.90 | 26.40 | 2 | 10039 | cascade_forward_back_propagation |
| 3 | 10207150 | 14.85 | 31.10 | 3 | d3c3d00e-8fb2-11eb-924d-9cd76263cbd0 | feed_forward_back_propagation |
| 4 | 611506 | 17.80 | 35.80 | 4 | gd_taxr_3 | cascade_forward_back_propagation |

**View `v_dialysis_session_patient`**

```sql
CREATE VIEW v_dialysis_session_patient AS
SELECT a.session_id, a.start_date, a.duration, a.status, b.id AS patient_id, b.patient_id AS patient_patient_id, b.age AS patient_age
FROM dialysis_sessions a JOIN patients b ON a.patient_id = b.id;
```

| session_id | start_date | duration | status | patient_id | patient_patient_id | patient_age |
|---|---|---|---|---|---|---|
| 1186087 | 2022-09-05T20:24:00 | 4.20 | scheduled | 1 | 8387541 | 35 |
| 2087748 | 2023-02-16T03:41:00 | 8.40 | in_progress | 2 | 10207142 | 40 |
| 4716414 | 2024-07-27T10:58:00 | 12.60 | completed | 3 | 7119782 | 45 |
| 005588c4-9bac-11eb-a8a2-19ed5c03f8d3 | 2025-12-11T17:15:00 | 16.80 | failed | 4 | gd_acc_160003 | 50 |

**View `v_dialysis_session_facility`**

```sql
CREATE VIEW v_dialysis_session_facility AS
SELECT a.session_id, a.start_date, a.duration, a.status, b.id AS facility_id, b.facility_id AS facility_facility_id, b.name AS facility_name
FROM dialysis_sessions a JOIN facilities b ON a.facility_id = b.id;
```

| session_id | start_date | duration | status | facility_id | facility_facility_id | facility_name |
|---|---|---|---|---|---|---|
| 1186087 | 2022-09-05T20:24:00 | 4.20 | scheduled | 1000 | 69447 | Extended Review |
| 2087748 | 2023-02-16T03:41:00 | 8.40 | in_progress | 1001 | 1040 | Pilot Initiative A |
| 4716414 | 2024-07-27T10:58:00 | 12.60 | completed | 1002 | 2986228 | Baseline Model |
| 005588c4-9bac-11eb-a8a2-19ed5c03f8d3 | 2025-12-11T17:15:00 | 16.80 | failed | 1003 | ChIJvSxSbfdv5kcRanVzI8RRu20 | Distributed Cluster |

**View `v_neural_network_model_clinical_profile`**

```sql
CREATE VIEW v_neural_network_model_clinical_profile AS
SELECT a.id, a.model_id, a.architecture_type, a.accuracy, b.id AS profile_id, b.profile_id AS profile_profile_id, b.urea AS profile_urea
FROM neural_network_models a JOIN clinical_profiles b ON a.clinical_profile_id = b.id;
```

| id | model_id | architecture_type | accuracy | profile_id | profile_profile_id | profile_urea |
|---|---|---|---|---|---|---|
| 1 | 1562845 | feed_forward_back_propagation | 17.20 | 1 | 72623baa-9bad-11eb-a8a2-19ed5c03f8d3 | 8.95 |
| 2 | 10039 | cascade_forward_back_propagation | 21.40 | 2 | d9d925ce-8fcc-11eb-924d-9cd76263cbd0 | 11.90 |
| 3 | d3c3d00e-8fb2-11eb-924d-9cd76263cbd0 | feed_forward_back_propagation | 25.60 | 3 | 10207150 | 14.85 |
| 4 | gd_taxr_3 | cascade_forward_back_propagation | 29.80 | 4 | 611506 | 17.80 |

**View `v_neural_network_model_patient_detail`**

```sql
CREATE VIEW v_neural_network_model_patient_detail AS
SELECT a.id, a.model_id, a.architecture_type, b.id AS patient_id, b.patient_id AS patient_patient_id, b.age AS patient_age
FROM neural_network_models a
  JOIN models_patients j ON j.neural_network_model_id = a.id
  JOIN patients b ON b.id = j.patient_id;
```

| id | model_id | architecture_type | patient_id | patient_patient_id | patient_age |
|---|---|---|---|---|---|
| 1 | 1562845 | feed_forward_back_propagation | 1 | 8387541 | 35 |
| 1 | 1562845 | feed_forward_back_propagation | 2 | 10207142 | 40 |
| 2 | 10039 | cascade_forward_back_propagation | 2 | 10207142 | 40 |
| 2 | 10039 | cascade_forward_back_propagation | 3 | 7119782 | 45 |
| 3 | d3c3d00e-8fb2-11eb-924d-9cd76263cbd0 | feed_forward_back_propagation | 3 | 7119782 | 45 |
| 3 | d3c3d00e-8fb2-11eb-924d-9cd76263cbd0 | feed_forward_back_propagation | 4 | gd_acc_160003 | 50 |
| 4 | gd_taxr_3 | cascade_forward_back_propagation | 4 | gd_acc_160003 | 50 |
| 4 | gd_taxr_3 | cascade_forward_back_propagation | 1 | 8387541 | 35 |

**View `v_facility_dialysis_session`**

```sql
CREATE VIEW v_facility_dialysis_session AS
SELECT a.id, a.facility_id, a.name, a.type, b.session_id AS session_session_id, b.start_date AS session_start_date, b.duration AS session_duration
FROM facilities a JOIN dialysis_sessions b ON a.session_id = b.session_id;
```

| id | facility_id | name | type | session_session_id | session_start_date | session_duration |
|---|---|---|---|---|---|---|
| 1000 | 69447 | Extended Review | hospital | 1186087 | 2022-09-05T20:24:00 | 4.20 |
| 1001 | 1040 | Pilot Initiative A | hemodialysis_center | 2087748 | 2023-02-16T03:41:00 | 8.40 |
| 1002 | 2986228 | Baseline Model | hospital | 4716414 | 2024-07-27T10:58:00 | 12.60 |
| 1003 | ChIJvSxSbfdv5kcRanVzI8RRu20 | Distributed Cluster | hemodialysis_center | 005588c4-9bac-11eb-a8a2-19ed5c03f8d3 | 2025-12-11T17:15:00 | 16.80 |
