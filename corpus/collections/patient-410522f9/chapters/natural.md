## Clinical Ozone Therapy for Ophthalmological Disorders: A Data-Driven Reference

The management of optic nerve disorders through ozone therapy demands rigorous tracking of patient characteristics, treatment protocols, session outcomes, and visual function measurements. This chapter documents the operational data model used to record and analyze the intersection of ozone-based interventions with ophthalmological assessment. The system captures individual patient profiles—including diagnoses such as optic atrophy, Leber optic atrophy, and other optic nerve dysfunction—alongside their baseline visual metrics, then follows each patient through structured ozone therapy protocols and serial ophthalmological examinations. Visual function parameters are measured before and after treatment, yielding improvement percentages and status classifications that feed directly into clinical decision-making. The following sections describe the core records, their relationships, and the analytical views that synthesize them into actionable clinical intelligence.

**Table `patients`**

| id | patient_id | age | sex | diagnosis | disease_duration | baseline_visual_acuity | baseline_visual_field | baseline_v_e_p | baseline_p_r_c_s_t | treatment_group | ozone_therapy_protocol_id |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 8387541 | 35 | male | optic atrophy | 21.95 | 12.20 | 14.95 | 20.95 | 17.95 | integrated-treatmen-28 | 100 |
| 2 | 10207142 | 40 | female | leber optic atrophy | 25.90 | 16.40 | 18.90 | 23.90 | 19.90 | seasonal-treatmen-29 | 101 |
| 3 | 7119782 | 45 | other | other optic nerve dysfunction | 29.85 | 20.60 | 22.85 | 26.85 | 21.85 | regional-treatmen-30 | 102 |
| 4 | gd_acc_160003 | 50 | male | optic atrophy | 33.80 | 24.80 | 26.80 | 29.80 | 23.80 | legacy-treatmen-31 | 103 |

The patients table anchors the entire clinical dataset. Each row represents a single individual enrolled in an ozone therapy program, identified by a unique patient_id such as 8387541 or gd_acc_160003. The age field spans from 35 to 50 years in the recorded cohort, while sex captures male, female, and other categories. Diagnoses include optic atrophy, leber optic atrophy, and other optic nerve dysfunction. Disease duration ranges from 21.95 to 33.80 years, reflecting chronic conditions that have persisted well into adulthood. Baseline visual metrics—baseline_visual_acuity, baseline_visual_field, baseline_v_e_p, and baseline_p_r_c_s_t—provide pre-treatment reference points for each patient. For example, patient 8387541 presents with a baseline visual acuity of 12.20 and a baseline visual field of 14.95, while patient gd_acc_160003 shows a baseline visual acuity of 24.80 and a baseline visual field of 26.80. The treatment_group column assigns each patient to a regimen such as integrated-treatmen-28 or seasonal-treatmen-29, and the ozone_therapy_protocol_id links the patient to a specific protocol definition.

**Table `ozone_therapy_protocols`**

| ozone_therapy_protocol_id | protocol_id | total_sessions | oxygen_ratio | administration_method | biochemical_adjustment |
|---|---|---|---|---|---|
| 100 | 9085260 | 16602 | 10.20 | distributed-administ-78 | false |
| 101 | 6926357 | 12136 | 12.40 | baseline-administ-79 | true |
| 102 | 4277008 | 459 | 14.60 | pilot-administ-80 | false |
| 103 | 726040 | 4 | 16.80 | extended-administ-81 | true |

Ozone therapy protocols define the structural parameters of each treatment course. The protocol_id column contains identifiers such as 9085260 and 726040, while total_sessions records the planned number of sessions—ranging from a modest 4 sessions under protocol 726040 to an extensive 16,602 sessions under protocol 9085260. The oxygen_ratio, measured between 10.20 and 16.80, specifies the concentration parameter of the ozone-oxygen mixture. The administration_method field uses coded values like distributed-administ-78 and extended-administ-81 to indicate the delivery approach. The biochemical_adjustment boolean indicates whether biochemical monitoring is required alongside the ozone administration; protocols 101 and 103 have this flag set to true, while protocols 100 and 102 do not.

**Table `ozone_therapy_sessions`**

| id | session_number | ozone_concentration | ozone_dose | treatment_date | administered_by | session_status | patient_id | ozone_therapy_protocol_id |
|---|---|---|---|---|---|---|---|---|
| 100 | 14 | 19.95 | 14.20 | 2022-09-05T20:36:00 | legacy-administ-49 | completed | 1 | 100 |
| 101 | 20 | 22.90 | 16.40 | 2023-02-16T03:53:00 | compact-administ-50 | failed | 2 | 101 |
| 102 | 26 | 25.85 | 18.60 | 2024-07-27T10:10:00 | composite-administ-51 | interrupted | 3 | 102 |
| 103 | 32 | 28.80 | 20.80 | 2025-12-11T17:27:00 | primary-administ-52 | completed | 4 | 103 |

Individual ozone therapy sessions are recorded in the ozone_therapy_sessions table, each representing a discrete treatment event. The session_number increments within a protocol, with values such as 14, 20, 26, and 32 appearing in the sample data. The ozone_concentration ranges from 19.95 to 28.80, and the ozone_dose ranges from 14.20 to 20.80, reflecting the administered quantity per session. Treatment dates span from 2022-09-05 to 2025-12-11, capturing sessions across multiple years. The administered_by field records the responsible practitioner or system, with values like legacy-administ-49 and primary-administ-52. The session_status column tracks the outcome of each session as completed, failed, or interrupted; notably, session 101 under protocol 101 is marked as failed, while session 102 is marked as interrupted. Each session is linked to a patient via patient_id and to a protocol via ozone_therapy_protocol_id.

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

The patients_sessions table establishes the many-to-many relationship between patients and ozone therapy sessions. This junction table records which sessions each patient has undergone. Patient 1 (patient_id 8387541) is associated with sessions 100 and 101, while patient 2 (patient_id 10207142) is linked to sessions 101 and 102. Patient 3 (patient_id 7119782) has sessions 102 and 103, and patient 4 (patient_id gd_acc_160003) is connected to sessions 103 and 100. This cross-referencing enables the system to track individual treatment histories and to aggregate session-level data per patient.

**Table `ophthalmological_exams`**

| id | exam_date | exam_type | visual_acuity | visual_field | visual_evoked_potentials | contrast_sensitivity | exam_performed_by | patient_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 2023-06-15T05:39:00 | baseline | 17.70 | 6.70 | 18.20 | 15.20 | pilot-exam-32 | 1 |
| 2 | 2024-11-26T12:56:00 | post-treatment | 21.40 | 8.40 | 22.40 | 18.40 | extended-exam-33 | 2 |
| 3 | 2025-04-10T19:13:00 | baseline | 25.10 | 10.10 | 26.60 | 21.60 | integrated-exam-34 | 3 |
| 4 | 2022-09-21T02:30:00 | post-treatment | 28.80 | 11.80 | 30.80 | 24.80 | seasonal-exam-35 | 4 |

Ophthalmological examinations document the clinical assessment of visual function at specific points in time. The exam_date field records when each examination was performed, with dates ranging from 2022-09-21 to 2025-04-10. The exam_type distinguishes between baseline examinations and post-treatment evaluations; for instance, exam 1 is a baseline exam while exam 2 is a post-treatment exam. The visual_acuity, visual_field, visual_evoked_potentials, and contrast_sensitivity columns capture the measured values for each examination. Exam 1, performed on 2023-06-15, recorded a visual acuity of 17.70 and a visual field of 6.70. Exam 4, a post-treatment assessment on 2022-09-21, showed a visual acuity of 28.80 and a visual field of 11.80. The exam_performed_by field identifies the examiner, with values such as pilot-exam-32 and seasonal-exam-35. Each exam is associated with a specific patient through the patient_id column.

**Table `visual_function_parameters`**

| id | parameter_name | pre_treatment_value | post_treatment_value | improvement_percentage | improvement_status | ophthalmological_exam_id | patient_id |
|---|---|---|---|---|---|---|---|
| 1 | visual acuity | 22.70 | 13.45 | 13.45 | improved | 1 | 1 |
| 2 | visual field | 27.40 | 16.90 | 16.90 | no change | 2 | 2 |
| 3 | visual evoked potentials | 32.10 | 20.35 | 20.35 | worsened | 3 | 3 |
| 4 | contrast sensitivity | 36.80 | 23.80 | 23.80 | improved | 4 | 4 |

The visual_function_parameters table quantifies the change in specific visual metrics between pre-treatment and post-treatment states. Each row corresponds to a particular parameter measured during an ophthalmological exam, identified by ophthalmological_exam_id. The parameter_name column lists the measured attribute: visual acuity, visual field, visual evoked potentials, and contrast sensitivity. The pre_treatment_value and post_treatment_value columns record the measurements before and after the intervention. For visual acuity under exam 1, the pre-treatment value was 22.70 and the post-treatment value was 13.45, yielding an improvement_percentage of 13.45 and an improvement_status of improved. In contrast, visual evoked potentials under exam 3 showed a pre-treatment value of 32.10 and a post-treatment value of 20.35, with an improvement_status of worsened. The improvement_status field categorizes outcomes as improved, no change, or worsened, providing a quick clinical summary of treatment effectiveness.

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

The patients_exams junction table links patients to their ophthalmological examinations, enabling the tracking of examination histories per individual. This relationship ensures that each exam can be traced back to the patient it assessed, supporting longitudinal analysis of visual function changes over the course of treatment.

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

The exams_parameters table connects ophthalmological exams to their corresponding visual function parameters, structuring the relationship between an examination event and the specific metrics recorded within it. This linkage allows the system to retrieve all parameters measured during a given exam or to trace a specific parameter back to its parent examination.

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

The protocols_patients table establishes the association between ozone therapy protocols and the patients assigned to them. This junction table supports the many-to-many relationship between protocols and patients, enabling flexible assignment of patients to multiple protocols over time and facilitating the aggregation of patient-level outcomes by protocol.

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

The protocols_sessions table links ozone therapy protocols to their constituent sessions. This relationship enables the system to determine which sessions belong to which protocol, supporting the calculation of protocol-level statistics such as total sessions completed, average ozone concentration, and session success rates.

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

The view v_patient_ozone_therapy_session_detail joins patient demographic and clinical data with their ozone therapy session records, answering the question: what are the individual treatment sessions for each patient, and how do they relate to the patient's baseline profile? Reading the row for patient 8387541, we see a patient diagnosed with optic atrophy, aged 35, who underwent session 100 with an ozone concentration of 19.95 and a dose of 14.20 on 2022-09-05. The session was completed and administered by legacy-administ-49 under protocol 100. This view consolidates patient context with session-level detail, enabling clinicians to review treatment history alongside baseline metrics in a single record.

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

The view v_patient_ophthalmological_exam_detail combines patient information with ophthalmological examination results, answering: what visual function measurements were recorded for each patient, and under what examination conditions? For patient 10207142, a 40-year-old female with leber optic atrophy, the view reveals exam 2, a post-treatment examination performed on 2024-11-26 by extended-exam-33. The recorded visual acuity was 21.40, the visual field was 8.40, visual evoked potentials measured 22.40, and contrast sensitivity was 18.40. This view supports clinical review by presenting examination findings in the context of the patient's diagnosis and treatment group.

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

The view v_patient_ozone_therapy_protocol links patient records to their assigned ozone therapy protocols, answering: which protocol governs each patient's treatment, and what are the protocol's structural parameters? For patient 7119782, a 45-year-old patient with other optic nerve dysfunction, the view shows assignment to protocol 102, which has a protocol_id of 4277008, a total of 459 planned sessions, an oxygen_ratio of 14.60, and uses pilot-administ-80 as the administration method. Biochemical adjustment is not required for this protocol. This view enables protocol-level analysis of patient outcomes and treatment adherence.

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

The view v_ozone_therapy_session_patient joins ozone therapy sessions with patient records, answering: which patient underwent each session, and what are the patient's diagnostic and demographic characteristics? Session 103, with an ozone concentration of 28.80 and a dose of 20.80, was administered to patient gd_acc_160003, a 50-year-old male with optic atrophy and a disease duration of 33.80 years. The session was completed on 2025-12-11 and administered by primary-administ-52 under protocol 103. This view is particularly useful for session-level reporting that requires patient context.

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

The view v_ozone_therapy_session_ozone_therapy_protocol connects individual sessions to their governing protocols, answering: which protocol does each session belong to, and what are the protocol's defining parameters? Session 100, with an ozone concentration of 19.95, belongs to protocol 100, which has a protocol_id of 9085260, 16,602 total sessions, an oxygen_ratio of 10.20, and uses distributed-administ-78 as the administration method. Biochemical adjustment is not enabled for this protocol. This view supports protocol compliance analysis and session-to-protocol traceability.

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

The view v_ophthalmological_exam_patient joins ophthalmological examinations with patient records, answering: which patient received each examination, and what are the patient's baseline visual metrics? Exam 3, a baseline examination performed on 2025-04-10 by integrated-exam-34, was conducted on patient 7119782. The patient's baseline visual acuity was 20.60, baseline visual field was 22.85, baseline v_e_p was 26.85, and baseline p_r_c_s_t was 21.85. The exam itself recorded a visual acuity of 25.10, a visual field of 10.10, visual evoked potentials of 26.60, and contrast sensitivity of 21.60. This view facilitates comparison between baseline and examination measurements within a unified record.

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

The view v_ophthalmological_exam_visual_function_parameter_detail links ophthalmological examinations to their visual function parameters, answering: what specific parameter changes were recorded for each examination? Exam 1, a baseline examination, is associated with the visual acuity parameter, which showed a pre-treatment value of 22.70 and a post-treatment value of 13.45, resulting in an improvement_percentage of 13.45 and an improvement_status of improved. Exam 2 is linked to the visual field parameter, with a pre-treatment value of 27.40 and a post-treatment value of 16.90, but the improvement_status is recorded as no change. This view provides a granular view of parameter-level outcomes within each examination.

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

The view v_visual_function_parameter_ophthalmological_exam reverses the perspective, starting from visual function parameters and joining to their parent ophthalmological examinations, answering: which examination recorded each parameter measurement, and what were the examination's overall findings? The visual acuity parameter (pre-treatment: 22.70, post-treatment: 13.45, status: improved) is associated with exam 1, which was a baseline examination performed on 2023-06-15 by pilot-exam-32. The exam recorded a visual acuity of 17.70, a visual field of 6.70, visual evoked potentials of 18.20, and contrast sensitivity of 15.20. This view supports parameter-centric analysis, enabling clinicians to trace individual metric changes back to their examination context.

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

The view v_visual_function_parameter_patient connects visual function parameters to their associated patients, answering: which patient experienced each parameter change, and what are the patient's diagnostic characteristics? The visual evoked potentials parameter, with a pre-treatment value of 32.10 and a post-treatment value of 20.35, is associated with patient 7119782, a 45-year-old patient with other optic nerve dysfunction and a disease duration of 29.85 years. The improvement_status for this parameter is worsened, indicating a negative outcome for this specific metric. This view enables patient-level aggregation of parameter outcomes across all examinations.

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

The view v_ozone_therapy_protocol_patient_detail joins ozone therapy protocols with patient records, answering: which patients are assigned to each protocol, and what are their clinical profiles? Protocol 101, with protocol_id 6926357, 12,136 total sessions, an oxygen_ratio of 12.40, and baseline-administ-79 as the administration method, is assigned to patient 10207142. This patient is a 40-year-old female with leber optic atrophy, a disease duration of 25.90 years, and a treatment group of seasonal-treatmen-29. Biochemical adjustment is enabled for this protocol. This view supports protocol-level patient cohort analysis.

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

The view v_ozone_therapy_protocol_ozone_therapy_session_detail links ozone therapy protocols to their individual sessions, answering: which sessions belong to each protocol, and what are the session-level treatment details? Protocol 102, with protocol_id 4277008, an oxygen_ratio of 14.60, and pilot-administ-80 as the administration method, includes session 102. This session, with session_number 26, an ozone concentration of 25.85, and an ozone dose of 18.60, was administered on 2024-07-27 by composite-administ-51 and has a status of interrupted. This view enables protocol-level session analysis, including tracking of session outcomes and treatment adherence within each protocol.

The clinical data model described in this chapter provides a comprehensive framework for tracking ozone therapy interventions in ophthalmological practice. By linking patient demographics and baseline metrics to structured treatment protocols, discrete session records, and serial ophthalmological examinations, the system captures the full trajectory of patient care. Visual function parameters quantify the impact of treatment on specific visual metrics, while the analytical views synthesize these records into clinically actionable formats. The relationships between patients, sessions, exams, protocols, and parameters enable both granular review of individual treatment events and aggregated analysis of protocol effectiveness. This structured approach supports evidence-based clinical decision-making and facilitates the identification of treatment patterns that correlate with improved visual outcomes.