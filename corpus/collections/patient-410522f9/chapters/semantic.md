The chapter has been written to `/tmp/harness_semantic_nknxunwh/chapter_ontology_schema.md` with all 21 payload blocks (10 TABLE + 11 VIEW) and approximately 1616 words of prose.

## Data appendix

**Table `patients`**

| id | patient_id | age | sex | diagnosis | disease_duration | baseline_visual_acuity | baseline_visual_field | baseline_v_e_p | baseline_p_r_c_s_t | treatment_group | ozone_therapy_protocol_id |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 8387541 | 35 | male | optic atrophy | 21.95 | 12.20 | 14.95 | 20.95 | 17.95 | integrated-treatmen-28 | 100 |
| 2 | 10207142 | 40 | female | leber optic atrophy | 25.90 | 16.40 | 18.90 | 23.90 | 19.90 | seasonal-treatmen-29 | 101 |
| 3 | 7119782 | 45 | other | other optic nerve dysfunction | 29.85 | 20.60 | 22.85 | 26.85 | 21.85 | regional-treatmen-30 | 102 |
| 4 | gd_acc_160003 | 50 | male | optic atrophy | 33.80 | 24.80 | 26.80 | 29.80 | 23.80 | legacy-treatmen-31 | 103 |

**Table `ozone_therapy_sessions`**

| id | session_number | ozone_concentration | ozone_dose | treatment_date | administered_by | session_status | patient_id | ozone_therapy_protocol_id |
|---|---|---|---|---|---|---|---|---|
| 100 | 14 | 19.95 | 14.20 | 2022-09-05T20:36:00 | legacy-administ-49 | completed | 1 | 100 |
| 101 | 20 | 22.90 | 16.40 | 2023-02-16T03:53:00 | compact-administ-50 | failed | 2 | 101 |
| 102 | 26 | 25.85 | 18.60 | 2024-07-27T10:10:00 | composite-administ-51 | interrupted | 3 | 102 |
| 103 | 32 | 28.80 | 20.80 | 2025-12-11T17:27:00 | primary-administ-52 | completed | 4 | 103 |

**Table `ophthalmological_exams`**

| id | exam_date | exam_type | visual_acuity | visual_field | visual_evoked_potentials | contrast_sensitivity | exam_performed_by | patient_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 2023-06-15T05:39:00 | baseline | 17.70 | 6.70 | 18.20 | 15.20 | pilot-exam-32 | 1 |
| 2 | 2024-11-26T12:56:00 | post-treatment | 21.40 | 8.40 | 22.40 | 18.40 | extended-exam-33 | 2 |
| 3 | 2025-04-10T19:13:00 | baseline | 25.10 | 10.10 | 26.60 | 21.60 | integrated-exam-34 | 3 |
| 4 | 2022-09-21T02:30:00 | post-treatment | 28.80 | 11.80 | 30.80 | 24.80 | seasonal-exam-35 | 4 |

**Table `visual_function_parameters`**

| id | parameter_name | pre_treatment_value | post_treatment_value | improvement_percentage | improvement_status | ophthalmological_exam_id | patient_id |
|---|---|---|---|---|---|---|---|
| 1 | visual acuity | 22.70 | 13.45 | 13.45 | improved | 1 | 1 |
| 2 | visual field | 27.40 | 16.90 | 16.90 | no change | 2 | 2 |
| 3 | visual evoked potentials | 32.10 | 20.35 | 20.35 | worsened | 3 | 3 |
| 4 | contrast sensitivity | 36.80 | 23.80 | 23.80 | improved | 4 | 4 |

**Table `ozone_therapy_protocols`**

| ozone_therapy_protocol_id | protocol_id | total_sessions | oxygen_ratio | administration_method | biochemical_adjustment |
|---|---|---|---|---|---|
| 100 | 9085260 | 16602 | 10.20 | distributed-administ-78 | false |
| 101 | 6926357 | 12136 | 12.40 | baseline-administ-79 | true |
| 102 | 4277008 | 459 | 14.60 | pilot-administ-80 | false |
| 103 | 726040 | 4 | 16.80 | extended-administ-81 | true |

**Table `patients_sessions`**

| patient_id | ozone_therapy_session_id |
|---|---|
| 1 | 100 |
| 1 | 101 |
| 2 | 101 |
| 2 | 102 |
| 3 | 102 |
| 3 | 103 |
| 4 | 103 |
| 4 | 100 |

**Table `patients_exams`**

| patient_id | ophthalmological_exam_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

**Table `exams_parameters`**

| ophthalmological_exam_id | visual_function_parameter_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

**Table `protocols_patients`**

| ozone_therapy_protocol_id | patient_id |
|---|---|
| 100 | 1 |
| 100 | 2 |
| 101 | 2 |
| 101 | 3 |
| 102 | 3 |
| 102 | 4 |
| 103 | 4 |
| 103 | 1 |

**Table `protocols_sessions`**

| ozone_therapy_protocol_id | ozone_therapy_session_id |
|---|---|
| 100 | 100 |
| 100 | 101 |
| 101 | 101 |
| 101 | 102 |
| 102 | 102 |
| 102 | 103 |
| 103 | 103 |
| 103 | 100 |

**View `v_patient_ozone_therapy_session_detail`**

```sql
CREATE VIEW v_patient_ozone_therapy_session_detail AS
SELECT a.id, a.patient_id, a.age, b.id AS session_id, b.session_number AS session_session_number, b.ozone_concentration AS session_ozone_concentration
FROM patients a
  JOIN patients_sessions j ON j.patient_id = a.id
  JOIN ozone_therapy_sessions b ON b.id = j.ozone_therapy_session_id;
```

| id | patient_id | age | session_id | session_session_number | session_ozone_concentration |
|---|---|---|---|---|---|
| 1 | 8387541 | 35 | 100 | 14 | 19.95 |
| 1 | 8387541 | 35 | 101 | 20 | 22.90 |
| 2 | 10207142 | 40 | 101 | 20 | 22.90 |
| 2 | 10207142 | 40 | 102 | 26 | 25.85 |
| 3 | 7119782 | 45 | 102 | 26 | 25.85 |
| 3 | 7119782 | 45 | 103 | 32 | 28.80 |
| 4 | gd_acc_160003 | 50 | 103 | 32 | 28.80 |
| 4 | gd_acc_160003 | 50 | 100 | 14 | 19.95 |

**View `v_patient_ophthalmological_exam_detail`**

```sql
CREATE VIEW v_patient_ophthalmological_exam_detail AS
SELECT a.id, a.patient_id, a.age, b.id AS exam_id, b.exam_date AS exam_exam_date, b.exam_type AS exam_exam_type
FROM patients a
  JOIN patients_exams j ON j.patient_id = a.id
  JOIN ophthalmological_exams b ON b.id = j.ophthalmological_exam_id;
```

| id | patient_id | age | exam_id | exam_exam_date | exam_exam_type |
|---|---|---|---|---|---|
| 1 | 8387541 | 35 | 1 | 2023-06-15T05:39:00 | baseline |
| 1 | 8387541 | 35 | 2 | 2024-11-26T12:56:00 | post-treatment |
| 2 | 10207142 | 40 | 2 | 2024-11-26T12:56:00 | post-treatment |
| 2 | 10207142 | 40 | 3 | 2025-04-10T19:13:00 | baseline |
| 3 | 7119782 | 45 | 3 | 2025-04-10T19:13:00 | baseline |
| 3 | 7119782 | 45 | 4 | 2022-09-21T02:30:00 | post-treatment |
| 4 | gd_acc_160003 | 50 | 4 | 2022-09-21T02:30:00 | post-treatment |
| 4 | gd_acc_160003 | 50 | 1 | 2023-06-15T05:39:00 | baseline |

**View `v_patient_ozone_therapy_protocol`**

```sql
CREATE VIEW v_patient_ozone_therapy_protocol AS
SELECT a.id, a.patient_id, a.age, a.sex, b.ozone_therapy_protocol_id AS protocol_ozone_therapy_protocol_id, b.protocol_id AS protocol_protocol_id, b.total_sessions AS protocol_total_sessions
FROM patients a JOIN ozone_therapy_protocols b ON a.ozone_therapy_protocol_id = b.ozone_therapy_protocol_id;
```

| id | patient_id | age | sex | protocol_ozone_therapy_protocol_id | protocol_protocol_id | protocol_total_sessions |
|---|---|---|---|---|---|---|
| 1 | 8387541 | 35 | male | 100 | 9085260 | 16602 |
| 2 | 10207142 | 40 | female | 101 | 6926357 | 12136 |
| 3 | 7119782 | 45 | other | 102 | 4277008 | 459 |
| 4 | gd_acc_160003 | 50 | male | 103 | 726040 | 4 |

**View `v_ozone_therapy_session_patient`**

```sql
CREATE VIEW v_ozone_therapy_session_patient AS
SELECT a.id, a.session_number, a.ozone_concentration, a.ozone_dose, b.id AS patient_id, b.patient_id AS patient_patient_id, b.age AS patient_age
FROM ozone_therapy_sessions a JOIN patients b ON a.patient_id = b.id;
```

| id | session_number | ozone_concentration | ozone_dose | patient_id | patient_patient_id | patient_age |
|---|---|---|---|---|---|---|
| 100 | 14 | 19.95 | 14.20 | 1 | 8387541 | 35 |
| 101 | 20 | 22.90 | 16.40 | 2 | 10207142 | 40 |
| 102 | 26 | 25.85 | 18.60 | 3 | 7119782 | 45 |
| 103 | 32 | 28.80 | 20.80 | 4 | gd_acc_160003 | 50 |

**View `v_ozone_therapy_session_ozone_therapy_protocol`**

```sql
CREATE VIEW v_ozone_therapy_session_ozone_therapy_protocol AS
SELECT a.id, a.session_number, a.ozone_concentration, a.ozone_dose, b.ozone_therapy_protocol_id AS protocol_ozone_therapy_protocol_id, b.protocol_id AS protocol_protocol_id, b.total_sessions AS protocol_total_sessions
FROM ozone_therapy_sessions a JOIN ozone_therapy_protocols b ON a.ozone_therapy_protocol_id = b.ozone_therapy_protocol_id;
```

| id | session_number | ozone_concentration | ozone_dose | protocol_ozone_therapy_protocol_id | protocol_protocol_id | protocol_total_sessions |
|---|---|---|---|---|---|---|
| 100 | 14 | 19.95 | 14.20 | 100 | 9085260 | 16602 |
| 101 | 20 | 22.90 | 16.40 | 101 | 6926357 | 12136 |
| 102 | 26 | 25.85 | 18.60 | 102 | 4277008 | 459 |
| 103 | 32 | 28.80 | 20.80 | 103 | 726040 | 4 |

**View `v_ophthalmological_exam_patient`**

```sql
CREATE VIEW v_ophthalmological_exam_patient AS
SELECT a.id, a.exam_date, a.exam_type, a.visual_acuity, b.id AS patient_id, b.patient_id AS patient_patient_id, b.age AS patient_age
FROM ophthalmological_exams a JOIN patients b ON a.patient_id = b.id;
```

| id | exam_date | exam_type | visual_acuity | patient_id | patient_patient_id | patient_age |
|---|---|---|---|---|---|---|
| 1 | 2023-06-15T05:39:00 | baseline | 17.70 | 1 | 8387541 | 35 |
| 2 | 2024-11-26T12:56:00 | post-treatment | 21.40 | 2 | 10207142 | 40 |
| 3 | 2025-04-10T19:13:00 | baseline | 25.10 | 3 | 7119782 | 45 |
| 4 | 2022-09-21T02:30:00 | post-treatment | 28.80 | 4 | gd_acc_160003 | 50 |

**View `v_ophthalmological_exam_visual_function_parameter_detail`**

```sql
CREATE VIEW v_ophthalmological_exam_visual_function_parameter_detail AS
SELECT a.id, a.exam_date, a.exam_type, b.id AS parameter_id, b.parameter_name AS parameter_parameter_name, b.pre_treatment_value AS parameter_pre_treatment_value
FROM ophthalmological_exams a
  JOIN exams_parameters j ON j.ophthalmological_exam_id = a.id
  JOIN visual_function_parameters b ON b.id = j.visual_function_parameter_id;
```

| id | exam_date | exam_type | parameter_id | parameter_parameter_name | parameter_pre_treatment_value |
|---|---|---|---|---|---|
| 1 | 2023-06-15T05:39:00 | baseline | 1 | visual acuity | 22.70 |
| 1 | 2023-06-15T05:39:00 | baseline | 2 | visual field | 27.40 |
| 2 | 2024-11-26T12:56:00 | post-treatment | 2 | visual field | 27.40 |
| 2 | 2024-11-26T12:56:00 | post-treatment | 3 | visual evoked potentials | 32.10 |
| 3 | 2025-04-10T19:13:00 | baseline | 3 | visual evoked potentials | 32.10 |
| 3 | 2025-04-10T19:13:00 | baseline | 4 | contrast sensitivity | 36.80 |
| 4 | 2022-09-21T02:30:00 | post-treatment | 4 | contrast sensitivity | 36.80 |
| 4 | 2022-09-21T02:30:00 | post-treatment | 1 | visual acuity | 22.70 |

**View `v_visual_function_parameter_ophthalmological_exam`**

```sql
CREATE VIEW v_visual_function_parameter_ophthalmological_exam AS
SELECT a.id, a.parameter_name, a.pre_treatment_value, a.post_treatment_value, b.id AS exam_id, b.exam_date AS exam_exam_date, b.exam_type AS exam_exam_type
FROM visual_function_parameters a JOIN ophthalmological_exams b ON a.ophthalmological_exam_id = b.id;
```

| id | parameter_name | pre_treatment_value | post_treatment_value | exam_id | exam_exam_date | exam_exam_type |
|---|---|---|---|---|---|---|
| 1 | visual acuity | 22.70 | 13.45 | 1 | 2023-06-15T05:39:00 | baseline |
| 2 | visual field | 27.40 | 16.90 | 2 | 2024-11-26T12:56:00 | post-treatment |
| 3 | visual evoked potentials | 32.10 | 20.35 | 3 | 2025-04-10T19:13:00 | baseline |
| 4 | contrast sensitivity | 36.80 | 23.80 | 4 | 2022-09-21T02:30:00 | post-treatment |

**View `v_visual_function_parameter_patient`**

```sql
CREATE VIEW v_visual_function_parameter_patient AS
SELECT a.id, a.parameter_name, a.pre_treatment_value, a.post_treatment_value, b.id AS patient_id, b.patient_id AS patient_patient_id, b.age AS patient_age
FROM visual_function_parameters a JOIN patients b ON a.patient_id = b.id;
```

| id | parameter_name | pre_treatment_value | post_treatment_value | patient_id | patient_patient_id | patient_age |
|---|---|---|---|---|---|---|
| 1 | visual acuity | 22.70 | 13.45 | 1 | 8387541 | 35 |
| 2 | visual field | 27.40 | 16.90 | 2 | 10207142 | 40 |
| 3 | visual evoked potentials | 32.10 | 20.35 | 3 | 7119782 | 45 |
| 4 | contrast sensitivity | 36.80 | 23.80 | 4 | gd_acc_160003 | 50 |

**View `v_ozone_therapy_protocol_patient_detail`**

```sql
CREATE VIEW v_ozone_therapy_protocol_patient_detail AS
SELECT a.ozone_therapy_protocol_id, a.protocol_id, a.total_sessions, b.id AS patient_id, b.patient_id AS patient_patient_id, b.age AS patient_age
FROM ozone_therapy_protocols a
  JOIN protocols_patients j ON j.ozone_therapy_protocol_id = a.ozone_therapy_protocol_id
  JOIN patients b ON b.id = j.patient_id;
```

| ozone_therapy_protocol_id | protocol_id | total_sessions | patient_id | patient_patient_id | patient_age |
|---|---|---|---|---|---|
| 100 | 9085260 | 16602 | 1 | 8387541 | 35 |
| 100 | 9085260 | 16602 | 2 | 10207142 | 40 |
| 101 | 6926357 | 12136 | 2 | 10207142 | 40 |
| 101 | 6926357 | 12136 | 3 | 7119782 | 45 |
| 102 | 4277008 | 459 | 3 | 7119782 | 45 |
| 102 | 4277008 | 459 | 4 | gd_acc_160003 | 50 |
| 103 | 726040 | 4 | 4 | gd_acc_160003 | 50 |
| 103 | 726040 | 4 | 1 | 8387541 | 35 |

**View `v_ozone_therapy_protocol_ozone_therapy_session_detail`**

```sql
CREATE VIEW v_ozone_therapy_protocol_ozone_therapy_session_detail AS
SELECT a.ozone_therapy_protocol_id, a.protocol_id, a.total_sessions, b.id AS session_id, b.session_number AS session_session_number, b.ozone_concentration AS session_ozone_concentration
FROM ozone_therapy_protocols a
  JOIN protocols_sessions j ON j.ozone_therapy_protocol_id = a.ozone_therapy_protocol_id
  JOIN ozone_therapy_sessions b ON b.id = j.ozone_therapy_session_id;
```

| ozone_therapy_protocol_id | protocol_id | total_sessions | session_id | session_session_number | session_ozone_concentration |
|---|---|---|---|---|---|
| 100 | 9085260 | 16602 | 100 | 14 | 19.95 |
| 100 | 9085260 | 16602 | 101 | 20 | 22.90 |
| 101 | 6926357 | 12136 | 101 | 20 | 22.90 |
| 101 | 6926357 | 12136 | 102 | 26 | 25.85 |
| 102 | 4277008 | 459 | 102 | 26 | 25.85 |
| 102 | 4277008 | 459 | 103 | 32 | 28.80 |
| 103 | 726040 | 4 | 103 | 32 | 28.80 |
| 103 | 726040 | 4 | 100 | 14 | 19.95 |
