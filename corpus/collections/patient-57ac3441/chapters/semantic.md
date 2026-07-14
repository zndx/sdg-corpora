## Modelling Dialysis Care: From Ontology to Relational Schema

The dialysis care domain captures the intersection of patient health, clinical laboratory measurements, machine learning model performance, and the physical infrastructure where treatments occur. A patient arrives at a facility for a scheduled session; their clinical profile—quantified by urea, creatinine, potassium, sodium, calcium, phosphorus, and uric acid levels—feeds into a neural network model whose architecture and accuracy are tracked over time. The relational schema below materialises this domain by normalising entities into base tables, linking them through foreign keys and a many-to-many junction, and then reassembling domain facts through views.

**Table `patients`**

| id | patient_id | age | sex | diagnosis | clinical_profile_id | session_id |
|---|---|---|---|---|---|---|
| 1 | 8387541 | 35 | male | normal | 1 | 1186087 |
| 2 | 10207142 | 40 | female | abnormal | 2 | 2087748 |
| 3 | 7119782 | 45 | male | normal | 3 | 4716414 |
| 4 | gd_acc_160003 | 50 | female | abnormal | 4 | 005588c4-9bac-11eb-a8a2-19ed5c03f8d3 |

The `patients` table anchors the patient entity. Its surrogate primary key `id` is an auto-incrementing integer, while the business identifier `patient_id` carries values such as `8387541`, `10207142`, `7119782`, and the UUID-derived `gd_acc_160003`. The demographic attributes `age` (ranging from 35 to 50 in the sample) and `sex` (male or female) describe the patient, and `diagnosis` records a categorical assessment—`normal` or `abnormal`—as seen in rows 1 and 2. The columns `clinical_profile_id` and `session_id` are foreign keys pointing to `clinical_profiles` and `dialysis_sessions` respectively, establishing the patient's clinical baseline and their most recent treatment context. For instance, patient `8387541` (id 1) has `clinical_profile_id = 1` and `session_id = 1186087`, linking them to their first clinical profile and their first dialysis session.

**Table `clinical_profiles`**

| id | profile_id | urea | creatinine | potassium | sodium | calcium | phosphorus | uric_acid | patient_id | neural_network_model_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 72623baa-9bad-11eb-a8a2-19ed5c03f8d3 | 8.95 | 21.70 | 17.95 | 4.70 | 4.95 | 16.45 | 22.45 | 1 | 1 |
| 2 | d9d925ce-8fcc-11eb-924d-9cd76263cbd0 | 11.90 | 26.40 | 19.90 | 7.40 | 8.90 | 19.90 | 25.90 | 2 | 2 |
| 3 | 10207150 | 14.85 | 31.10 | 21.85 | 10.10 | 12.85 | 23.35 | 29.35 | 3 | 3 |
| 4 | 611506 | 17.80 | 35.80 | 23.80 | 12.80 | 16.80 | 26.80 | 32.80 | 4 | 4 |

The `clinical_profiles` table stores the laboratory measurements that characterise a patient's physiological state at a point in time. Its surrogate key `id` is an integer, while `profile_id` is a UUID or numeric identifier—`72623baa-9bad-11eb-a8a2-19ed5c03f8d3`, `d9d925ce-8fcc-11eb-924d-9cd76263cbd0`, `10207150`, and `611506`—that uniquely identifies the profile record. The seven numeric columns `urea`, `creatinine`, `potassium`, `sodium`, `calcium`, `phosphorus`, and `uric_acid` hold the lab values. These values exhibit a clear upward trend across the four rows: urea increases from 8.95 to 17.80, creatinine from 21.70 to 35.80, and so on, suggesting progressively more severe clinical conditions. The foreign key `patient_id` links each profile to its patient (values 1 through 4), and `neural_network_model_id` links the profile to the model used for prediction (also 1 through 4). Profile 1, for example, records urea at 8.95 and creatinine at 21.70 for patient 1, and is associated with neural network model 1.

**Table `dialysis_sessions`**

| session_id | start_date | duration | status | patient_id | facility_id |
|---|---|---|---|---|---|
| 1186087 | 2022-09-05T20:24:00 | 4.20 | scheduled | 1 | 1000 |
| 2087748 | 2023-02-16T03:41:00 | 8.40 | in_progress | 2 | 1001 |
| 4716414 | 2024-07-27T10:58:00 | 12.60 | completed | 3 | 1002 |
| 005588c4-9bac-11eb-a8a2-19ed5c03f8d3 | 2025-12-11T17:15:00 | 16.80 | failed | 4 | 1003 |

Dialysis sessions are recorded in `dialysis_sessions`, where `session_id` serves as the primary key. Session identifiers mix integers (`1186087`, `2087748`, `4716414`) with a UUID (`005588c4-9bac-11eb-a8a2-19ed5c03f8d3`). The `start_date` column stores ISO-8601 timestamps spanning from September 2022 to December 2025. The `duration` column records treatment length in hours—4.20, 8.40, 12.60, and 16.80—showing a doubling pattern across the four rows. The `status` column is categorical, taking values `scheduled`, `in_progress`, `completed`, and `failed`, which reflects the lifecycle of a session. Foreign keys `patient_id` (1–4) and `facility_id` (1000–1003) connect each session to the patient receiving treatment and the facility where it occurs. Session `1186087` started on 2022-09-05, lasted 4.20 hours, was `scheduled`, and took place at facility 1000.

**Table `neural_network_models`**

| id | model_id | architecture_type | accuracy | training_date | clinical_profile_id |
|---|---|---|---|---|---|
| 1 | 1562845 | feed_forward_back_propagation | 17.20 | 2025-12-24 | 1 |
| 2 | 10039 | cascade_forward_back_propagation | 21.40 | 2022-05-08 | 2 |
| 3 | d3c3d00e-8fb2-11eb-924d-9cd76263cbd0 | feed_forward_back_propagation | 25.60 | 2023-10-19 | 3 |
| 4 | gd_taxr_3 | cascade_forward_back_propagation | 29.80 | 2024-03-03 | 4 |

The `neural_network_models` table tracks the predictive models applied to clinical data. Its surrogate key `id` is an integer, while `model_id` carries business identifiers such as `1562845`, `10039`, `d3c3d00e-8fb2-11eb-924d-9cd76263cbd0`, and `gd_taxr_3`. The `architecture_type` column distinguishes between `feed_forward_back_propagation` and `cascade_forward_back_propagation`—two neural network architectures. The `accuracy` column records a numeric score (17.20, 21.40, 25.60, 29.80), which increases across the four rows, suggesting model improvement over time. The `training_date` column stores the date the model was trained, ranging from 2022-05-08 to 2025-12-24. The foreign key `clinical_profile_id` (1–4) links each model to the clinical profile it was trained on or validated against. Model `1562845` (id 1) uses a feed-forward back-propagation architecture, achieved 17.20 accuracy, and was trained on 2025-12-24 against clinical profile 1.

**Table `facilities`**

| id | facility_id | name | type | location | session_id | created_at |
|---|---|---|---|---|---|---|
| 1000 | 69447 | Extended Review | hospital | extended-location-99 | 1186087 | 2025-01-01 00:14:00 |
| 1001 | 1040 | Pilot Initiative A | hemodialysis_center | integrated-location-100 | 2087748 | 2025-02-06 03:14:00 |
| 1002 | 2986228 | Baseline Model | hospital | seasonal-location-101 | 4716414 | 2025-03-11 06:14:00 |
| 1003 | ChIJvSxSbfdv5kcRanVzI8RRu20 | Distributed Cluster | hemodialysis_center | regional-location-102 | 005588c4-9bac-11eb-a8a2-19ed5c03f8d3 | 2025-04-16 09:14:00 |

Facilities represent the physical locations where dialysis treatments are delivered. The surrogate primary key `id` is an integer (1000–1003), while `facility_id` is the business identifier—`69447`, `1040`, `2986228`, and the Google Places ID `ChIJvSxSbfdv5kcRanVzI8RRu20`. The `name` column holds descriptive labels such as `Extended Review`, `Pilot Initiative A`, `Baseline Model`, and `Distributed Cluster`. The `type` column classifies the facility as either `hospital` or `hemodialysis_center`. The `location` column stores a location code like `extended-location-99` or `regional-location-102`. The foreign key `session_id` links the facility to a dialysis session, and `created_at` records when the facility record was inserted (e.g., `2025-01-01 00:14:00` for facility 1000). Facility 1000, named `Extended Review`, is a hospital at `extended-location-99` and was created on 2025-01-01.

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

The `models_patients` table is a junction (associative) table that resolves the many-to-many relationship between `neural_network_models` and `patients`. It contains two columns: `neural_network_model_id` and `patient_id`, both foreign keys. The eight rows encode the following associations: model 1 serves patients 1 and 2; model 2 serves patients 2 and 3; model 3 serves patients 3 and 4; and model 4 serves patients 4 and 1. This structure allows any model to be applied to multiple patients and any patient to be evaluated by multiple models, reflecting the real-world scenario where a single predictive model is deployed across a patient population and a patient's clinical profile may be re-evaluated by successive model versions.

The foreign-key topology of the schema can be summarised as follows. `patients.clinical_profile_id` references `clinical_profiles.id`; `patients.session_id` references `dialysis_sessions.session_id`; `clinical_profiles.patient_id` references `patients.id`; `clinical_profiles.neural_network_model_id` references `neural_network_models.id`; `dialysis_sessions.patient_id` references `patients.id`; `dialysis_sessions.facility_id` references `facilities.id`; `neural_network_models.clinical_profile_id` references `clinical_profiles.id`; and `models_patients.neural_network_model_id` and `models_patients.patient_id` reference `neural_network_models.id` and `patients.id` respectively. This web of constraints ensures referential integrity across the five core entities and the junction table.

The views materialise domain facts by joining these normalised tables. Each view answers a specific analytical question by denormalising selected columns into a single result set.

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

The view `v_patient_clinical_profile` joins `patients` with `clinical_profiles` on the patient identifier, producing a denormalised row that pairs each patient's demographic and diagnostic information with their clinical lab values. For patient `8387541` (id 1), the view would return age 35, sex `male`, diagnosis `normal`, alongside urea 8.95, creatinine 21.70, and the full suite of lab measurements from clinical profile 1. This view answers the question: "What are the clinical lab values for a given patient?"

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

The view `v_patient_dialysis_session` joins `patients` with `dialysis_sessions` on the patient identifier, combining demographic data with session metadata. For patient `10207142` (id 2), the view yields age 40, sex `female`, diagnosis `abnormal`, session start date `2023-02-16T03:41:00`, duration 8.40 hours, and status `in_progress`. This view answers: "What dialysis session details correspond to a given patient?"

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

The view `v_clinical_profile_patient` joins `clinical_profiles` with `patients` in the reverse direction, presenting clinical data alongside patient demographics. For clinical profile `72623baa-9bad-11eb-a8a2-19ed5c03f8d3` (id 1), the view returns urea 8.95, creatinine 21.70, potassium 17.95, and the patient's age 35, sex `male`, and diagnosis `normal`. This view answers: "Which patient does a given clinical profile belong to, and what are their demographics?"

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

The view `v_clinical_profile_neural_network_model` joins `clinical_profiles` with `neural_network_models` on the shared model identifier, linking lab measurements to the predictive model that was trained on or validated against that profile. For clinical profile id 3 (urea 14.85, creatinine 31.10), the view returns the associated model `d3c3d00e-8fb2-11eb-924d-9cd76263cbd0`, architecture type `feed_forward_back_propagation`, accuracy 25.60, and training date 2023-10-19. This view answers: "Which neural network model is associated with a given clinical profile, and what is its performance?"

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

The view `v_dialysis_session_patient` joins `dialysis_sessions` with `patients` to present session-level data enriched with patient demographics. For session `4716414`, the view returns start date `2024-07-27T10:58:00`, duration 12.60 hours, status `completed`, alongside the patient's age 45, sex `male`, and diagnosis `normal`. This view answers: "What patient information is associated with a given dialysis session?"

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

The view `v_dialysis_session_facility` joins `dialysis_sessions` with `facilities` on the facility identifier, connecting treatment sessions to their physical locations. For session `005588c4-9bac-11eb-a8a2-19ed5c03f8d3`, the view returns start date `2025-12-11T17:15:00`, duration 16.80 hours, status `failed`, alongside the facility name `Distributed Cluster`, type `hemodialysis_center`, and location `regional-location-102`. This view answers: "At which facility did a given dialysis session take place, and what are the session details?"

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

The view `v_neural_network_model_clinical_profile` joins `neural_network_models` with `clinical_profiles` in the reverse direction, presenting model metadata alongside the clinical lab values used for training or validation. For model `10039` (id 2), architecture `cascade_forward_back_propagation`, accuracy 21.40, and training date 2022-05-08, the view returns the associated clinical profile's urea 11.90, creatinine 26.40, potassium 19.90, and the full set of seven lab measurements. This view answers: "What clinical data was used with a given neural network model?"

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

The view `v_neural_network_model_patient_detail` joins `neural_network_models` with `patients` through the `models_patients` junction table, producing a denormalised row that connects model performance directly to patient demographics. For model `gd_taxr_3` (id 4), architecture `cascade_forward_back_propagation`, accuracy 29.80, and training date 2024-03-03, the view returns patient `gd_acc_160003` (id 4) with age 50, sex `female`, and diagnosis `abnormal`. This view answers: "Which patients are served by a given neural network model, and what are their demographic details?"

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

The view `v_facility_dialysis_session` joins `facilities` with `dialysis_sessions` to present facility information alongside the sessions conducted there. For facility `69447` (id 1000), name `Extended Review`, type `hospital`, and location `extended-location-99`, the view returns the associated session `1186087` with start date `2022-09-05T20:24:00`, duration 4.20 hours, and status `scheduled`. This view answers: "What dialysis sessions were conducted at a given facility?"

The schema design reflects a deliberate normalisation strategy. Patient demographics are isolated in `patients`, clinical measurements in `clinical_profiles`, session logistics in `dialysis_sessions`, model metadata in `neural_network_models`, and infrastructure in `facilities`. The junction table `models_patients` decouples the many-to-many relationship between models and patients, preventing data duplication and enabling flexible model-to-patient mappings. The foreign keys create a directed graph of dependencies: patients reference clinical profiles and sessions; clinical profiles reference patients and models; sessions reference patients and facilities; models reference clinical profiles. The views then traverse this graph in both directions, denormalising the data to answer specific analytical questions without requiring the application layer to construct joins manually. This separation of concerns—normalised storage for integrity, denormalised views for query convenience—is a standard relational pattern that scales well as the domain grows.