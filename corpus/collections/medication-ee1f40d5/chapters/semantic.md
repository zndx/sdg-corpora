The domain under examination is a hospital information system that tracks the lifecycle of medications from their clinical documentation through patient administration and patient-reported satisfaction. Five base tables capture the core entities—medications, their fact sheets, patients, display endpoints, and HCAHPS survey metrics—while twelve materialized views reconstruct the multi-table relationships that the normalized schema deliberately separates. The model reflects a realistic healthcare data warehouse: each medication carries a brand name, a generic name, a dosage form, a strength, an administration route, and a timestamp; each fact sheet records a title, a last-updated date, a source system, a language, and a readability level; each patient record stores an admission date, a discharge date, a room number, a bed number, and an aggregate HCAHPS score; each display endpoint describes a device type, an IP address, a status, and a location room; and each HCAHPS metric captures a survey date, a category, a score, a benchmark, and a trend. The foreign keys that bind these tables together are explicit in the column names—`medication_fact_sheet_id`, `patient_id`, and `display_endpoint_id` appear as both columns in the base tables and as join conditions in the views.

## Base Tables and Their Attributes

The `medications` table is the central entity for pharmaceutical products. Its primary key is the surrogate column `id`, an auto-incrementing integer, while the business key `medication_id` carries values such as `4716397` and `1c87986a-8fcd-11eb-924d-9cd76263cbd0`. The descriptive columns `brand_name` and `generic_name` hold entries like "The College-Ready Promise" and "Distributed Review" in the first row, and "Root Inc." and "Composite Cluster" in the fourth. The dosage characteristics are stored in `dosage_form` (e.g., `primary-dosage-40`, `adaptive-dosage-41`), `strength` (e.g., `seasonal-strength-95`, `compact-strength-98`), and `administration_route` (e.g., `primary-administ-22`, `baseline-administ-25`). The table also carries two foreign keys: `medication_fact_sheet_id` references `medication_fact_sheets.id`, and `patient_id` references `patients.patient_id`. The `created_at` column records insertion timestamps such as `2025-01-01 00:14:00`.

**Table `medications`**

| id | medication_id | brand_name | generic_name | dosage_form | strength | administration_route | medication_fact_sheet_id | patient_id | created_at |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 4716397 | The College-Ready Promise | Distributed Review | primary-dosage-40 | seasonal-strength-95 | primary-administ-22 | 1 | 8387541 | 2025-01-01 00:14:00 |
| 2 | 1c87986a-8fcd-11eb-924d-9cd76263cbd0 | General Foods | Adaptive Initiative D | adaptive-dosage-41 | regional-strength-96 | adaptive-administ-23 | 2 | 10207142 | 2025-02-06 03:14:00 |
| 3 | 1562853 | Navistar International | Primary Model | distributed-dosage-42 | legacy-strength-97 | distributed-administ-24 | 3 | 7119782 | 2025-03-11 06:14:00 |
| 4 | e02275d4-8fd1-11eb-924d-9cd76263cbd0 | Root Inc. | Composite Cluster | baseline-dosage-43 | compact-strength-98 | baseline-administ-25 | 4 | gd_acc_160003 | 2025-04-16 09:14:00 |

The `medication_fact_sheets` table stores the clinical documentation associated with each medication. Its surrogate key is `id`, and the business key is `fact_sheet_id`, which takes values like `7441140` and `11330`. The `title` column contains human-readable labels such as "Compact Initiative" and "Seasonal Review". Temporal and provenance metadata are captured in `last_updated` (e.g., `2023-06-17T17:27:00`), `source_system` (e.g., `composite-source-39`), `language` (e.g., `composite-language-45`), and `readability_level` (e.g., `integrated-readabil-64`). Two foreign keys anchor this table to the rest of the schema: `medication_id` references `medications.id`, and `display_endpoint_id` references `display_endpoints.id`.

**Table `medication_fact_sheets`**

| id | fact_sheet_id | title | last_updated | source_system | language | readability_level | medication_id | display_endpoint_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 7441140 | Compact Initiative | 2023-06-17T17:27:00 | composite-source-39 | composite-language-45 | integrated-readabil-64 | 1 | 100 |
| 2 | 103191 | Legacy Model | 2024-11-01T00:44:00 | primary-source-40 | primary-language-46 | seasonal-readabil-65 | 2 | 101 |
| 3 | 884338 | Regional Cluster A | 2025-04-12T07:01:00 | adaptive-source-41 | adaptive-language-47 | regional-readabil-66 | 3 | 102 |
| 4 | 11330 | Seasonal Review | 2022-09-23T14:18:00 | distributed-source-42 | distributed-language-48 | legacy-readabil-67 | 4 | 103 |

The `patients` table uses `patient_id` as its primary key, a column that mixes integer identifiers like `8387541` with alphanumeric strings such as `gd_acc_160003`. The clinical encounter is described by `admission_date` and `discharge_date`—notably, the first row shows an admission of `2023-06-22` and a discharge of `2022-09-02`, indicating a back-dated or retrospective record. The physical location is captured by `room_number` (e.g., `ROO-2106`) and `bed_number` (e.g., `BED-2363`). The aggregate `hcahps_score` column holds decimal values ranging from `12.70` to `20.80`. Three foreign keys link patients to the rest of the model: `medication_id` references `medications.id`, `medication_fact_sheet_id` references `medication_fact_sheets.id`, and `display_endpoint_id` references `display_endpoints.id`.

**Table `patients`**

| patient_id | admission_date | discharge_date | room_number | bed_number | hcahps_score | medication_id | medication_fact_sheet_id | display_endpoint_id |
|---|---|---|---|---|---|---|---|---|
| 8387541 | 2023-06-22 | 2022-09-02 | ROO-2106 | BED-2363 | 12.70 | 1 | 1 | 100 |
| 10207142 | 2024-11-06 | 2023-02-13 | ROO-2113 | BED-2369 | 15.40 | 2 | 2 | 101 |
| 7119782 | 2025-04-17 | 2024-07-24 | ROO-2120 | BED-2375 | 18.10 | 3 | 3 | 102 |
| gd_acc_160003 | 2022-09-01 | 2025-12-08 | ROO-2127 | BED-2381 | 20.80 | 4 | 4 | 103 |

The `display_endpoints` table models the hardware through which medication information is delivered to patients. Its surrogate key is `id` (values `100` through `103`), and the business key `endpoint_id` carries UUIDs like `57da7384-8fcc-11eb-924d-9cd76263cbd0`. The `device_type` column enumerates types such as `bedsideTV`, `mobileDevice`, `computer`, and `digitalWhiteboard`. Network identity is stored in `ip_address` (e.g., `extended-ip-15`), operational state in `status` (values `active`, `inactive`, `maintenance`), and physical placement in `location_room` (e.g., `baseline-location-97`). The `last_heartbeat` column records the most recent device ping, such as `2022-09-07T20:36:00`. Two foreign keys connect this table outward: `medication_fact_sheet_id` references `medication_fact_sheets.id`, and `patient_id` references `patients.patient_id`.

**Table `display_endpoints`**

| id | endpoint_id | device_type | ip_address | status | location_room | last_heartbeat | medication_fact_sheet_id | patient_id |
|---|---|---|---|---|---|---|---|---|
| 100 | 57da7384-8fcc-11eb-924d-9cd76263cbd0 | bedsideTV | extended-ip-15 | active | baseline-location-97 | 2022-09-07T20:36:00 | 1 | 8387541 |
| 101 | 48753442 | mobileDevice | integrated-ip-16 | inactive | pilot-location-98 | 2023-02-18T03:53:00 | 2 | 10207142 |
| 102 | 2bc4116a-8fcc-11eb-924d-9cd76263cbd0 | computer | seasonal-ip-17 | maintenance | extended-location-99 | 2024-07-02T10:10:00 | 3 | 7119782 |
| 103 | 10238272 | digitalWhiteboard | regional-ip-18 | active | integrated-location-100 | 2025-12-13T17:27:00 | 4 | gd_acc_160003 |

The `h_c_a_h_p_s_metrics` table records individual HCAHPS survey responses. Its surrogate key is `h_c_a_h_p_s_metric_id`, and the business key is `metric_id`, which includes values like `3744010` and `136630a8-8fcc-11eb-924d-9cd76263cbd0`. The `survey_date` column stores dates such as `2024-07-23`. The `category` column classifies the survey item into one of three domains: `medicationCommunication`, `painManagement`, or `dischargeInformation`. The `score` column holds the patient's rating (e.g., `9.20`, `21.80`), the `benchmark` column stores the target value (e.g., `15.45`, `25.80`), and the `trend` column indicates whether performance is `improving`, `stable`, or `declining`. Two foreign keys tie metrics to entities: `patient_id` references `patients.patient_id`, and `medication_fact_sheet_id` references `medication_fact_sheets.id`.

**Table `h_c_a_h_p_s_metrics`**

| h_c_a_h_p_s_metric_id | metric_id | survey_date | category | score | benchmark | trend | patient_id | medication_fact_sheet_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 3744010 | 2024-07-23 | medicationCommunication | 9.20 | 15.45 | improving | 8387541 | 1 |
| 2 | 136630a8-8fcc-11eb-924d-9cd76263cbd0 | 2025-12-07 | painManagement | 13.40 | 18.90 | stable | 10207142 | 2 |
| 3 | 2986226 | 2022-05-18 | dischargeInformation | 17.60 | 22.35 | declining | 7119782 | 3 |
| 4 | 2002007020010 | 2023-10-02 | medicationCommunication | 21.80 | 25.80 | improving | gd_acc_160003 | 4 |

## Foreign-Key Relationships and Cardinality

The schema enforces a many-to-one relationship between `medications` and `medication_fact_sheets` through the `medication_fact_sheet_id` column in `medications` and the `id` column in `medication_fact_sheets`. Each medication row points to exactly one fact sheet, while a fact sheet may be referenced by multiple medications. The `medication_fact_sheets` table itself carries a `medication_id` column that creates a reciprocal link back to `medications`, forming a bidirectional association that the views exploit from both directions.

The `patients` table participates in three foreign-key relationships. Its `medication_id` column links each patient to a medication, its `medication_fact_sheet_id` column links each patient to a fact sheet, and its `display_endpoint_id` column links each patient to a display endpoint. Similarly, `display_endpoints` references both `medication_fact_sheets` and `patients` through its own `medication_fact_sheet_id` and `patient_id` columns. The `h_c_a_h_p_s_metrics` table anchors survey data to patients and fact sheets via `patient_id` and `medication_fact_sheet_id`.

These foreign keys are not junction tables in the traditional sense; rather, the base tables themselves carry the foreign-key columns directly, which means the cardinality is expressed as a simple `JOIN` condition in the views. The schema avoids a dedicated association table because each medication, fact sheet, patient, and endpoint is assumed to have a single primary relationship to the other entities in the model.

## Materialized Views

The twelve views each answer a specific analytical question by joining two base tables on their shared foreign-key column. They do not introduce new data; they merely project the relevant columns and rename them to avoid ambiguity.

The view `v_medication_medication_fact_sheet` joins `medications` to `medication_fact_sheets` on `medications.medication_fact_sheet_id = medication_fact_sheets.id`. It projects the medication's `id`, `medication_id`, `brand_name`, and `generic_name` alongside the fact sheet's `id` (aliased as `sheet_id`), `fact_sheet_id` (aliased as `sheet_fact_sheet_id`), and `title` (aliased as `sheet_title`). The first row reads: medication `4716397` ("The College-Ready Promise") is linked to fact sheet `7441140` ("Compact Initiative"). This view answers the question "Which fact sheet documents each medication?"

**View `v_medication_medication_fact_sheet`**

```sql
CREATE VIEW v_medication_medication_fact_sheet AS
SELECT a.id, a.medication_id, a.brand_name, a.generic_name, b.id AS sheet_id, b.fact_sheet_id AS sheet_fact_sheet_id, b.title AS sheet_title
FROM medications a JOIN medication_fact_sheets b ON a.medication_fact_sheet_id = b.id;
```

| id | medication_id | brand_name | generic_name | sheet_id | sheet_fact_sheet_id | sheet_title |
|---|---|---|---|---|---|---|
| 1 | 4716397 | The College-Ready Promise | Distributed Review | 1 | 7441140 | Compact Initiative |
| 2 | 1c87986a-8fcd-11eb-924d-9cd76263cbd0 | General Foods | Adaptive Initiative D | 2 | 103191 | Legacy Model |
| 3 | 1562853 | Navistar International | Primary Model | 3 | 884338 | Regional Cluster A |
| 4 | e02275d4-8fd1-11eb-924d-9cd76263cbd0 | Root Inc. | Composite Cluster | 4 | 11330 | Seasonal Review |

The view `v_medication_patient` joins `medications` to `patients` on `medications.patient_id = patients.patient_id`. It reconstructs the medication-to-patient assignment, answering "Which patient is associated with each medication?"

**View `v_medication_patient`**

```sql
CREATE VIEW v_medication_patient AS
SELECT a.id, a.medication_id, a.brand_name, a.generic_name, b.patient_id AS patient_patient_id, b.admission_date AS patient_admission_date, b.discharge_date AS patient_discharge_date
FROM medications a JOIN patients b ON a.patient_id = b.patient_id;
```

| id | medication_id | brand_name | generic_name | patient_patient_id | patient_admission_date | patient_discharge_date |
|---|---|---|---|---|---|---|
| 1 | 4716397 | The College-Ready Promise | Distributed Review | 8387541 | 2023-06-22 | 2022-09-02 |
| 2 | 1c87986a-8fcd-11eb-924d-9cd76263cbd0 | General Foods | Adaptive Initiative D | 10207142 | 2024-11-06 | 2023-02-13 |
| 3 | 1562853 | Navistar International | Primary Model | 7119782 | 2025-04-17 | 2024-07-24 |
| 4 | e02275d4-8fd1-11eb-924d-9cd76263cbd0 | Root Inc. | Composite Cluster | gd_acc_160003 | 2022-09-01 | 2025-12-08 |

The view `v_medication_fact_sheet_medication` performs the reverse join of `v_medication_medication_fact_sheet`, starting from `medication_fact_sheets` and joining to `medications`. It answers "Which medication is documented by each fact sheet?"

**View `v_medication_fact_sheet_medication`**

```sql
CREATE VIEW v_medication_fact_sheet_medication AS
SELECT a.id, a.fact_sheet_id, a.title, a.last_updated, b.id AS medication_id, b.medication_id AS medication_medication_id, b.brand_name AS medication_brand_name
FROM medication_fact_sheets a JOIN medications b ON a.medication_id = b.id;
```

| id | fact_sheet_id | title | last_updated | medication_id | medication_medication_id | medication_brand_name |
|---|---|---|---|---|---|---|
| 1 | 7441140 | Compact Initiative | 2023-06-17T17:27:00 | 1 | 4716397 | The College-Ready Promise |
| 2 | 103191 | Legacy Model | 2024-11-01T00:44:00 | 2 | 1c87986a-8fcd-11eb-924d-9cd76263cbd0 | General Foods |
| 3 | 884338 | Regional Cluster A | 2025-04-12T07:01:00 | 3 | 1562853 | Navistar International |
| 4 | 11330 | Seasonal Review | 2022-09-23T14:18:00 | 4 | e02275d4-8fd1-11eb-924d-9cd76263cbd0 | Root Inc. |

The view `v_medication_fact_sheet_display_endpoint` joins `medication_fact_sheets` to `display_endpoints` on `medication_fact_sheets.display_endpoint_id = display_endpoints.id`. It answers "Through which display endpoint is each fact sheet delivered?"

**View `v_medication_fact_sheet_display_endpoint`**

```sql
CREATE VIEW v_medication_fact_sheet_display_endpoint AS
SELECT a.id, a.fact_sheet_id, a.title, a.last_updated, b.id AS endpoint_id, b.endpoint_id AS endpoint_endpoint_id, b.device_type AS endpoint_device_type
FROM medication_fact_sheets a JOIN display_endpoints b ON a.display_endpoint_id = b.id;
```

| id | fact_sheet_id | title | last_updated | endpoint_id | endpoint_endpoint_id | endpoint_device_type |
|---|---|---|---|---|---|---|
| 1 | 7441140 | Compact Initiative | 2023-06-17T17:27:00 | 100 | 57da7384-8fcc-11eb-924d-9cd76263cbd0 | bedsideTV |
| 2 | 103191 | Legacy Model | 2024-11-01T00:44:00 | 101 | 48753442 | mobileDevice |
| 3 | 884338 | Regional Cluster A | 2025-04-12T07:01:00 | 102 | 2bc4116a-8fcc-11eb-924d-9cd76263cbd0 | computer |
| 4 | 11330 | Seasonal Review | 2022-09-23T14:18:00 | 103 | 10238272 | digitalWhiteboard |

The view `v_patient_medication` joins `patients` to `medications` on `patients.medication_id = medications.id`. It answers "Which medication is assigned to each patient?"

**View `v_patient_medication`**

```sql
CREATE VIEW v_patient_medication AS
SELECT a.patient_id, a.admission_date, a.discharge_date, a.room_number, b.id AS medication_id, b.medication_id AS medication_medication_id, b.brand_name AS medication_brand_name
FROM patients a JOIN medications b ON a.medication_id = b.id;
```

| patient_id | admission_date | discharge_date | room_number | medication_id | medication_medication_id | medication_brand_name |
|---|---|---|---|---|---|---|
| 8387541 | 2023-06-22 | 2022-09-02 | ROO-2106 | 1 | 4716397 | The College-Ready Promise |
| 10207142 | 2024-11-06 | 2023-02-13 | ROO-2113 | 2 | 1c87986a-8fcd-11eb-924d-9cd76263cbd0 | General Foods |
| 7119782 | 2025-04-17 | 2024-07-24 | ROO-2120 | 3 | 1562853 | Navistar International |
| gd_acc_160003 | 2022-09-01 | 2025-12-08 | ROO-2127 | 4 | e02275d4-8fd1-11eb-924d-9cd76263cbd0 | Root Inc. |

The view `v_patient_medication_fact_sheet` joins `patients` to `medication_fact_sheets` on `patients.medication_fact_sheet_id = medication_fact_sheets.id`. It answers "Which fact sheet is associated with each patient?"

**View `v_patient_medication_fact_sheet`**

```sql
CREATE VIEW v_patient_medication_fact_sheet AS
SELECT a.patient_id, a.admission_date, a.discharge_date, a.room_number, b.id AS sheet_id, b.fact_sheet_id AS sheet_fact_sheet_id, b.title AS sheet_title
FROM patients a JOIN medication_fact_sheets b ON a.medication_fact_sheet_id = b.id;
```

| patient_id | admission_date | discharge_date | room_number | sheet_id | sheet_fact_sheet_id | sheet_title |
|---|---|---|---|---|---|---|
| 8387541 | 2023-06-22 | 2022-09-02 | ROO-2106 | 1 | 7441140 | Compact Initiative |
| 10207142 | 2024-11-06 | 2023-02-13 | ROO-2113 | 2 | 103191 | Legacy Model |
| 7119782 | 2025-04-17 | 2024-07-24 | ROO-2120 | 3 | 884338 | Regional Cluster A |
| gd_acc_160003 | 2022-09-01 | 2025-12-08 | ROO-2127 | 4 | 11330 | Seasonal Review |

The view `v_patient_display_endpoint` joins `patients` to `display_endpoints` on `patients.display_endpoint_id = display_endpoints.id`. It answers "Which display endpoint is assigned to each patient?"

**View `v_patient_display_endpoint`**

```sql
CREATE VIEW v_patient_display_endpoint AS
SELECT a.patient_id, a.admission_date, a.discharge_date, a.room_number, b.id AS endpoint_id, b.endpoint_id AS endpoint_endpoint_id, b.device_type AS endpoint_device_type
FROM patients a JOIN display_endpoints b ON a.display_endpoint_id = b.id;
```

| patient_id | admission_date | discharge_date | room_number | endpoint_id | endpoint_endpoint_id | endpoint_device_type |
|---|---|---|---|---|---|---|
| 8387541 | 2023-06-22 | 2022-09-02 | ROO-2106 | 100 | 57da7384-8fcc-11eb-924d-9cd76263cbd0 | bedsideTV |
| 10207142 | 2024-11-06 | 2023-02-13 | ROO-2113 | 101 | 48753442 | mobileDevice |
| 7119782 | 2025-04-17 | 2024-07-24 | ROO-2120 | 102 | 2bc4116a-8fcc-11eb-924d-9cd76263cbd0 | computer |
| gd_acc_160003 | 2022-09-01 | 2025-12-08 | ROO-2127 | 103 | 10238272 | digitalWhiteboard |

The view `v_display_endpoint_medication_fact_sheet` joins `display_endpoints` to `medication_fact_sheets` on `display_endpoints.medication_fact_sheet_id = medication_fact_sheets.id`. It answers "Which fact sheet is served by each display endpoint?"

**View `v_display_endpoint_medication_fact_sheet`**

```sql
CREATE VIEW v_display_endpoint_medication_fact_sheet AS
SELECT a.id, a.endpoint_id, a.device_type, a.ip_address, b.id AS sheet_id, b.fact_sheet_id AS sheet_fact_sheet_id, b.title AS sheet_title
FROM display_endpoints a JOIN medication_fact_sheets b ON a.medication_fact_sheet_id = b.id;
```

| id | endpoint_id | device_type | ip_address | sheet_id | sheet_fact_sheet_id | sheet_title |
|---|---|---|---|---|---|---|
| 100 | 57da7384-8fcc-11eb-924d-9cd76263cbd0 | bedsideTV | extended-ip-15 | 1 | 7441140 | Compact Initiative |
| 101 | 48753442 | mobileDevice | integrated-ip-16 | 2 | 103191 | Legacy Model |
| 102 | 2bc4116a-8fcc-11eb-924d-9cd76263cbd0 | computer | seasonal-ip-17 | 3 | 884338 | Regional Cluster A |
| 103 | 10238272 | digitalWhiteboard | regional-ip-18 | 4 | 11330 | Seasonal Review |

The view `v_display_endpoint_patient` joins `display_endpoints` to `patients` on `display_endpoints.patient_id = patients.patient_id`. It answers "Which patient is served by each display endpoint?"

**View `v_display_endpoint_patient`**

```sql
CREATE VIEW v_display_endpoint_patient AS
SELECT a.id, a.endpoint_id, a.device_type, a.ip_address, b.patient_id AS patient_patient_id, b.admission_date AS patient_admission_date, b.discharge_date AS patient_discharge_date
FROM display_endpoints a JOIN patients b ON a.patient_id = b.patient_id;
```

| id | endpoint_id | device_type | ip_address | patient_patient_id | patient_admission_date | patient_discharge_date |
|---|---|---|---|---|---|---|
| 100 | 57da7384-8fcc-11eb-924d-9cd76263cbd0 | bedsideTV | extended-ip-15 | 8387541 | 2023-06-22 | 2022-09-02 |
| 101 | 48753442 | mobileDevice | integrated-ip-16 | 10207142 | 2024-11-06 | 2023-02-13 |
| 102 | 2bc4116a-8fcc-11eb-924d-9cd76263cbd0 | computer | seasonal-ip-17 | 7119782 | 2025-04-17 | 2024-07-24 |
| 103 | 10238272 | digitalWhiteboard | regional-ip-18 | gd_acc_160003 | 2022-09-01 | 2025-12-08 |

The view `v_h_c_a_h_p_s_metric_patient` joins `h_c_a_h_p_s_metrics` to `patients` on `h_c_a_h_p_s_metrics.patient_id = patients.patient_id`. It answers "Which patient submitted each HCAHPS survey response?" The first row shows that patient `8387541` submitted a `medicationCommunication` survey on `2024-07-23` with a score of `9.20` against a benchmark of `15.45`, trending `improving`.

**View `v_h_c_a_h_p_s_metric_patient`**

```sql
CREATE VIEW v_h_c_a_h_p_s_metric_patient AS
SELECT a.h_c_a_h_p_s_metric_id, a.metric_id, a.survey_date, a.category, b.patient_id AS patient_patient_id, b.admission_date AS patient_admission_date, b.discharge_date AS patient_discharge_date
FROM h_c_a_h_p_s_metrics a JOIN patients b ON a.patient_id = b.patient_id;
```

| h_c_a_h_p_s_metric_id | metric_id | survey_date | category | patient_patient_id | patient_admission_date | patient_discharge_date |
|---|---|---|---|---|---|---|
| 1 | 3744010 | 2024-07-23 | medicationCommunication | 8387541 | 2023-06-22 | 2022-09-02 |
| 2 | 136630a8-8fcc-11eb-924d-9cd76263cbd0 | 2025-12-07 | painManagement | 10207142 | 2024-11-06 | 2023-02-13 |
| 3 | 2986226 | 2022-05-18 | dischargeInformation | 7119782 | 2025-04-17 | 2024-07-24 |
| 4 | 2002007020010 | 2023-10-02 | medicationCommunication | gd_acc_160003 | 2022-09-01 | 2025-12-08 |

The view `v_h_c_a_h_p_s_metric_medication_fact_sheet` joins `h_c_a_h_p_s_metrics` to `medication_fact_sheets` on `h_c_a_h_p_s_metrics.medication_fact_sheet_id = medication_fact_sheets.id`. It answers "Which fact sheet is associated with each HCAHPS survey response?" The fourth row shows that fact sheet `11330` ("Seasonal Review") is linked to a `medicationCommunication` survey with a score of `21.80` trending `improving`.

**View `v_h_c_a_h_p_s_metric_medication_fact_sheet`**

```sql
CREATE VIEW v_h_c_a_h_p_s_metric_medication_fact_sheet AS
SELECT a.h_c_a_h_p_s_metric_id, a.metric_id, a.survey_date, a.category, b.id AS sheet_id, b.fact_sheet_id AS sheet_fact_sheet_id, b.title AS sheet_title
FROM h_c_a_h_p_s_metrics a JOIN medication_fact_sheets b ON a.medication_fact_sheet_id = b.id;
```

| h_c_a_h_p_s_metric_id | metric_id | survey_date | category | sheet_id | sheet_fact_sheet_id | sheet_title |
|---|---|---|---|---|---|---|
| 1 | 3744010 | 2024-07-23 | medicationCommunication | 1 | 7441140 | Compact Initiative |
| 2 | 136630a8-8fcc-11eb-924d-9cd76263cbd0 | 2025-12-07 | painManagement | 2 | 103191 | Legacy Model |
| 3 | 2986226 | 2022-05-18 | dischargeInformation | 3 | 884338 | Regional Cluster A |
| 4 | 2002007020010 | 2023-10-02 | medicationCommunication | 4 | 11330 | Seasonal Review |

## Closing Synthesis

The schema models a healthcare information ecosystem in which medications, their clinical documentation, patients, delivery hardware, and satisfaction surveys are all first-class entities. The five base tables are normalized so that each entity type has its own table with a dedicated primary key and a set of descriptive columns. Foreign-key columns in each table establish the relationships: `medications` links to `medication_fact_sheets` and `patients`; `medication_fact_sheets` links to `medications` and `display_endpoints`; `patients` links to `medications`, `medication_fact_sheets`, and `display_endpoints`; `display_endpoints` links to `medication_fact_sheets` and `patients`; and `h_c_a_h_p_s_metrics` links to `patients` and `medication_fact_sheets`. The twelve views materialize these relationships as simple two-table joins, each projecting a subset of columns and aliasing them to produce a flat, query-ready result. The result is a schema that is both normalized at the storage layer and denormalized at the access layer, a pattern that supports both data integrity and analytical convenience.