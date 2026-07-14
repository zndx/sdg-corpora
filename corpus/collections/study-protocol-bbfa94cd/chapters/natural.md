## Clinical Imaging Registries and Study Operations

Modern neuroimaging research and clinical practice depend on coordinated workflows that span study design, patient enrollment, imaging acquisition, result interpretation, and financial reconciliation. A well-structured registry captures every step of this chain, linking research protocols to individual patients, imaging procedures to facilities and physicians, and clinical findings to reimbursement. The following chapter describes the core entities, their relationships, and the analytical views that practitioners rely on to monitor operations, audit compliance, and extract insights from the registry.

**Table `study_protocols`**

| study_protocol_id | study_identifier | study_title | target_enrollment_count | start_date | funding_source | coverage_policy | imaging_procedure_id |
|---|---|---|---|---|---|---|---|
| 1 | STU-2431 | Composite Programme | 9 | 2022-09-05T20:24:00 | baseline-funding-73 | extended-coverage-87 | 1 |
| 2 | STU-2434 | Compact Standard A | 12 | 2023-02-16T03:41:00 | pilot-funding-74 | integrated-coverage-88 | 2 |
| 3 | STU-2437 | Legacy Framework | 0 | 2024-07-27T10:58:00 | extended-funding-75 | seasonal-coverage-89 | 3 |
| 4 | STU-2440 | Regional Protocol | 13 | 2025-12-11T17:15:00 | integrated-funding-76 | regional-coverage-90 | 4 |

Study protocols form the organizational backbone of the registry. Each protocol carries a unique identifier such as `STU-2431` and a human-readable title like *Composite Programme* or *Regional Protocol*. Protocols specify a target enrollment count — ranging from zero for the *Legacy Framework* (`STU-2437`) to thirteen for the *Regional Protocol* (`STU-2440`) — and record a start date, funding source, and coverage policy. The funding sources include `baseline-funding-73`, `pilot-funding-74`, `extended-funding-75`, and `integrated-funding-76`, while coverage policies such as `extended-coverage-87` and `seasonal-coverage-89` define the financial terms under which imaging services are provided. Each protocol is also associated with a specific imaging procedure, establishing the procedural scope of the study.

**Table `patient_enrollments`**

| enrollment_id | patient_age | clinical_diagnosis | enrollment_date | referring_physician_id | medicare_beneficiary_id | imaging_procedure_id | study_protocol_id | scan_result_id |
|---|---|---|---|---|---|---|---|---|
| 4447035 | 27 | Mild Cognitive Impairment | 2022-05-11T16:00:00 | 8189502 | 23461971 | 1 | 1 | 1000 |
| gd_taxc_2121 | 38 | Dementia of Uncertain Cause | 2023-10-22T23:17:00 | 136727ba-8fcc-11eb-924d-9cd76263cbd0 | c747be34-8fcc-11eb-924d-9cd76263cbd0 | 2 | 2 | 1001 |
| id_30 | 49 | Mild Cognitive Impairment | 2024-03-06T06:34:00 | supp1 | Salangin | 3 | 3 | 1002 |
| b_VB-EC-0 | 60 | Dementia of Uncertain Cause | 2025-08-17T13:51:00 | 4985147 | lu_tax_code_template_m423 | 4 | 4 | 1003 |

Patient enrollments document the entry of individuals into study protocols. Each enrollment record contains an enrollment identifier, the patient's age at enrollment, a clinical diagnosis, and the enrollment date. Diagnoses observed in the registry include *Mild Cognitive Impairment* and *Dementia of Uncertain Cause*. The registry accommodates diverse identifier formats: numeric IDs such as `4447035`, UUID-style identifiers like `gd_taxc_2121`, and alphanumeric codes such as `id_30`. Each enrollment links to a referring physician via `referring_physician_id`, a Medicare beneficiary identifier, the imaging procedure performed, the study protocol to which the patient is enrolled, and the resulting scan result. For example, enrollment `4447035` records a 27-year-old patient diagnosed with Mild Cognitive Impairment, enrolled on 2022-05-11, referred by physician `8189502`, and associated with study protocol `STU-2431`.

**Table `imaging_procedures`**

| id | procedure_id | procedure_date | modality | anatomical_region | tracer_agent | facility_id | imaging_facility_id | physician_id | interpreted_by_physician_id | scan_result_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 790490 | 2022-05-19T04:48:00 | seasonal-modality-17 | pilot-anatomic-20 | adaptive-tracer-23 | 69447 | 1 | 100 | 100 | 1000 |
| 2 | 4060658 | 2023-10-03T11:05:00 | regional-modality-18 | extended-anatomic-21 | distributed-tracer-24 | 1040 | 2 | 101 | 101 | 1001 |
| 3 | L384 | 2024-03-14T18:22:00 | legacy-modality-19 | integrated-anatomic-22 | baseline-tracer-25 | 2986228 | 3 | 102 | 102 | 1002 |
| 4 | 3012831 | 2025-08-25T01:39:00 | compact-modality-20 | seasonal-anatomic-23 | pilot-tracer-26 | ChIJvSxSbfdv5kcRanVzI8RRu20 | 4 | 103 | 103 | 1003 |

Imaging procedures represent the actual acquisition of diagnostic images. Each procedure carries a procedure identifier, a procedure date, a modality type, an anatomical region, and a tracer agent. Modalities in the registry include `seasonal-modality-17`, `regional-modality-18`, `legacy-modality-19`, and `compact-modality-20`. Anatomical regions follow a similar naming convention, such as `pilot-anatomic-20` and `extended-anatomic-21`. Tracer agents include `adaptive-tracer-23`, `distributed-tracer-24`, `baseline-tracer-25`, and `pilot-tracer-26`. Each procedure is assigned to an imaging facility and a physician, and produces a scan result. The procedure identifiers themselves vary in format — `790490`, `4060658`, `L384`, and `3012831` — reflecting the heterogeneous origins of imaging data within the registry.

**Table `scan_results`**

| id | result_id | amyloid_status | interpretation_text | result_date | clinical_impact | imaging_procedure_id | enrollment_id |
|---|---|---|---|---|---|---|---|
| 1000 | 338524 | Positive | composite-interpre-39 | 2022-05-20T16:12:00 | Excludes Alzheimer's | 1 | 4447035 |
| 1001 | 1562853 | Negative | primary-interpre-40 | 2023-10-04T23:29:00 | Confirms Alzheimer's | 2 | gd_taxc_2121 |
| 1002 | 5844284 | Indeterminate | adaptive-interpre-41 | 2024-03-15T06:46:00 | Guides Management | 3 | id_30 |
| 1003 | 6020 | Positive | distributed-interpre-42 | 2025-08-26T13:03:00 | Excludes Alzheimer's | 4 | b_VB-EC-0 |

Scan results capture the clinical interpretation of imaging studies. Each result includes an amyloid status — `Positive`, `Negative`, or `Indeterminate` — an interpretation text, a result date, and a clinical impact statement. Interpretation texts such as `composite-interpre-39` and `primary-interpre-40` are linked to specific clinical impacts: *Excludes Alzheimer's*, *Confirms Alzheimer's*, and *Guides Management*. The amyloid status of a scan result directly informs the clinical narrative. For instance, result `1000` shows a `Positive` amyloid status with the clinical impact *Excludes Alzheimer's*, while result `1001` shows a `Negative` status with the impact *Confirms Alzheimer's*. Each scan result is tied to a specific imaging procedure and patient enrollment, closing the loop between acquisition and clinical decision-making.

**Table `imaging_facilities`**

| imaging_facility_id | facility_id | facility_name | location | certification_status |
|---|---|---|---|---|
| 1 | 69447 | Integrated Protocol A | extended-location-99 | Approved |
| 2 | 1040 | Extended Programme | integrated-location-100 | Pending |
| 3 | 2986228 | Pilot Standard | seasonal-location-101 | Approved |
| 4 | ChIJvSxSbfdv5kcRanVzI8RRu20 | Baseline Framework D | regional-location-102 | Pending |

Imaging facilities provide the physical infrastructure for procedure acquisition. Each facility record includes a facility identifier, a facility name, a location code, and a certification status. Facility names such as *Integrated Protocol A*, *Extended Programme*, *Pilot Standard*, and *Baseline Framework D* correspond to location codes like `extended-location-99` and `integrated-location-100`. Certification statuses alternate between `Approved` and `Pending`, reflecting the regulatory oversight of imaging sites. The facility identifier `ChIJvSxSbfdv5kcRanVzI8RRu20` for *Baseline Framework D* illustrates the use of external identifier formats within the registry.

**Table `physicians`**

| physician_id | specialty | board_certified | role_in_study |
|---|---|---|---|
| 100 | Neurology | false | Referring |
| 101 | Psychiatry | true | Ordering |
| 102 | Geriatric Medicine | false | Interpreting |
| 103 | Radiology | true | Referring |

Physicians are the clinical operators who refer, order, and interpret imaging studies. Each physician record includes a specialty, a board certification status, and a role in the study. Specialties in the registry include Neurology, Psychiatry, Geriatric Medicine, and Radiology. Board certification is recorded as a boolean value — `true` for physicians `101` and `103`, and `false` for physicians `100` and `102`. Study roles include `Referring`, `Ordering`, and `Interpreting`, which define the physician's function within the imaging workflow. Physician `101`, a board-certified Psychiatrist, serves as an Ordering physician, while physician `102`, a Geriatric Medicine specialist without board certification, serves as an Interpreting physician.

**Table `reimbursement_records`**

| id | reimbursement_id | amount | payment_date | payer | policy_code | imaging_procedure_id | imaging_facility_id |
|---|---|---|---|---|---|---|---|
| 1 | 374 | 13.49 | 2024-03-24T14:54:00 | legacy-payer-91 | 195362 | 1 | 1 |
| 2 | 10238289 | 25.47 | 2025-08-08T21:11:00 | compact-payer-92 | 10445619 | 2 | 2 |
| 3 | 10782184 | 19.72 | 2022-01-19T04:28:00 | composite-payer-93 | account_pymes_6511 | 3 | 3 |
| 4 | 4447027 | 12.74 | 2023-06-03T11:45:00 | primary-payer-94 | 23205298 | 4 | 4 |

Reimbursement records track the financial transactions associated with imaging services. These records link imaging procedures to the facilities that performed them and to the study protocols that funded them, enabling financial reconciliation across the registry. Each reimbursement record captures the monetary details of a service encounter, ensuring that funding sources are properly allocated and that facilities receive appropriate compensation for approved procedures.

The registry employs junction tables to manage many-to-many relationships between core entities. The `protocols_enrollments` table links study protocols to patient enrollments, allowing a single protocol to encompass multiple patients and a patient to participate in multiple protocols. The `protocols_records` table connects study protocols to reimbursement records, establishing the financial chain from protocol to payment. The `facilities_procedures` table associates imaging facilities with procedures, supporting multi-site studies where the same procedure type is performed at different locations. The `physicians_enrollments` table links physicians to patient enrollments, tracking which physicians refer or manage which patients. The `physicians_procedures` table connects physicians to imaging procedures, documenting the procedural involvement of each physician. Finally, the `physicians_results` table ties physicians to scan results, recording which physicians are responsible for interpreting specific findings.

The following views synthesize these base tables into analytical perspectives that practitioners use for monitoring and reporting.

**View `v_study_protocol_patient_enrollment_detail`**

```sql
CREATE VIEW v_study_protocol_patient_enrollment_detail AS
SELECT a.study_protocol_id, a.study_identifier, a.study_title, b.enrollment_id AS enrollment_enrollment_id, b.patient_age AS enrollment_patient_age, b.clinical_diagnosis AS enrollment_clinical_diagnosis
FROM study_protocols a
  JOIN protocols_enrollments j ON j.study_protocol_id = a.study_protocol_id
  JOIN patient_enrollments b ON b.enrollment_id = j.enrollment_id;
```

| study_protocol_id | study_identifier | study_title | enrollment_enrollment_id | enrollment_patient_age | enrollment_clinical_diagnosis |
|---|---|---|---|---|---|
| 1 | STU-2431 | Composite Programme | 4447035 | 27 | Mild Cognitive Impairment |
| 1 | STU-2431 | Composite Programme | gd_taxc_2121 | 38 | Dementia of Uncertain Cause |
| 2 | STU-2434 | Compact Standard A | gd_taxc_2121 | 38 | Dementia of Uncertain Cause |
| 2 | STU-2434 | Compact Standard A | id_30 | 49 | Mild Cognitive Impairment |
| 3 | STU-2437 | Legacy Framework | id_30 | 49 | Mild Cognitive Impairment |
| 3 | STU-2437 | Legacy Framework | b_VB-EC-0 | 60 | Dementia of Uncertain Cause |
| 4 | STU-2440 | Regional Protocol | b_VB-EC-0 | 60 | Dementia of Uncertain Cause |
| 4 | STU-2440 | Regional Protocol | 4447035 | 27 | Mild Cognitive Impairment |

This view joins study protocols with patient enrollments to answer which patients are enrolled in which protocols and under what clinical circumstances. Reading the row for protocol `STU-2431` (*Composite Programme*), we see enrollment `4447035` of a 27-year-old patient with Mild Cognitive Impairment, enrolled on 2022-05-11. The second row, for protocol `STU-2434` (*Compact Standard A*), shows enrollment `gd_taxc_2121` of a 38-year-old patient with Dementia of Uncertain Cause, enrolled on 2023-10-22. This view enables program managers to assess enrollment progress against target counts and to review the clinical profile of enrolled populations.

**View `v_study_protocol_imaging_procedure`**

```sql
CREATE VIEW v_study_protocol_imaging_procedure AS
SELECT a.study_protocol_id, a.study_identifier, a.study_title, a.target_enrollment_count, b.id AS procedure_id, b.procedure_id AS procedure_procedure_id, b.procedure_date AS procedure_procedure_date
FROM study_protocols a JOIN imaging_procedures b ON a.imaging_procedure_id = b.id;
```

| study_protocol_id | study_identifier | study_title | target_enrollment_count | procedure_id | procedure_procedure_id | procedure_procedure_date |
|---|---|---|---|---|---|---|
| 1 | STU-2431 | Composite Programme | 9 | 1 | 790490 | 2022-05-19T04:48:00 |
| 2 | STU-2434 | Compact Standard A | 12 | 2 | 4060658 | 2023-10-03T11:05:00 |
| 3 | STU-2437 | Legacy Framework | 0 | 3 | L384 | 2024-03-14T18:22:00 |
| 4 | STU-2440 | Regional Protocol | 13 | 4 | 3012831 | 2025-08-25T01:39:00 |

This view links study protocols to imaging procedures, revealing which procedures are conducted under each protocol's scope. For protocol `STU-2431`, the associated imaging procedure `790490` was performed on 2022-05-19 using `seasonal-modality-17` on the `pilot-anatomic-20` region with `adaptive-tracer-23`. For protocol `STU-2434`, procedure `4060658` was conducted on 2023-10-03 using `regional-modality-18` and `distributed-tracer-24`. This view supports procedural compliance checks and helps coordinators verify that imaging activities align with protocol specifications.

**View `v_study_protocol_reimbursement_record_detail`**

```sql
CREATE VIEW v_study_protocol_reimbursement_record_detail AS
SELECT a.study_protocol_id, a.study_identifier, a.study_title, b.id AS record_id, b.reimbursement_id AS record_reimbursement_id, b.amount AS record_amount
FROM study_protocols a
  JOIN protocols_records j ON j.study_protocol_id = a.study_protocol_id
  JOIN reimbursement_records b ON b.id = j.reimbursement_record_id;
```

| study_protocol_id | study_identifier | study_title | record_id | record_reimbursement_id | record_amount |
|---|---|---|---|---|---|
| 1 | STU-2431 | Composite Programme | 1 | 374 | 13.49 |
| 1 | STU-2431 | Composite Programme | 2 | 10238289 | 25.47 |
| 2 | STU-2434 | Compact Standard A | 2 | 10238289 | 25.47 |
| 2 | STU-2434 | Compact Standard A | 3 | 10782184 | 19.72 |
| 3 | STU-2437 | Legacy Framework | 3 | 10782184 | 19.72 |
| 3 | STU-2437 | Legacy Framework | 4 | 4447027 | 12.74 |
| 4 | STU-2440 | Regional Protocol | 4 | 4447027 | 12.74 |
| 4 | STU-2440 | Regional Protocol | 1 | 374 | 13.49 |

This view connects study protocols to reimbursement records, providing a financial lens on each protocol's activities. It answers how much funding has been allocated and disbursed per protocol, enabling fiscal oversight. The view allows administrators to compare the `baseline-funding-73` associated with `STU-2431` against actual reimbursement disbursements, ensuring that financial commitments match operational expenditures.

**View `v_patient_enrollment_imaging_procedure`**

```sql
CREATE VIEW v_patient_enrollment_imaging_procedure AS
SELECT a.enrollment_id, a.patient_age, a.clinical_diagnosis, a.enrollment_date, b.id AS procedure_id, b.procedure_id AS procedure_procedure_id, b.procedure_date AS procedure_procedure_date
FROM patient_enrollments a JOIN imaging_procedures b ON a.imaging_procedure_id = b.id;
```

| enrollment_id | patient_age | clinical_diagnosis | enrollment_date | procedure_id | procedure_procedure_id | procedure_procedure_date |
|---|---|---|---|---|---|---|
| 4447035 | 27 | Mild Cognitive Impairment | 2022-05-11T16:00:00 | 1 | 790490 | 2022-05-19T04:48:00 |
| gd_taxc_2121 | 38 | Dementia of Uncertain Cause | 2023-10-22T23:17:00 | 2 | 4060658 | 2023-10-03T11:05:00 |
| id_30 | 49 | Mild Cognitive Impairment | 2024-03-06T06:34:00 | 3 | L384 | 2024-03-14T18:22:00 |
| b_VB-EC-0 | 60 | Dementia of Uncertain Cause | 2025-08-17T13:51:00 | 4 | 3012831 | 2025-08-25T01:39:00 |

This view joins patient enrollments with imaging procedures to trace the procedural pathway of each enrolled patient. Enrollment `4447035` is linked to imaging procedure `790490`, performed on 2022-05-19. Enrollment `gd_taxc_2121` is linked to procedure `4060658`, performed on 2023-10-03. This view is essential for verifying that each enrolled patient received the imaging procedure specified by their enrollment record and for auditing the timing between enrollment and procedure.

**View `v_patient_enrollment_study_protocol`**

```sql
CREATE VIEW v_patient_enrollment_study_protocol AS
SELECT a.enrollment_id, a.patient_age, a.clinical_diagnosis, a.enrollment_date, b.study_protocol_id AS protocol_study_protocol_id, b.study_identifier AS protocol_study_identifier, b.study_title AS protocol_study_title
FROM patient_enrollments a JOIN study_protocols b ON a.study_protocol_id = b.study_protocol_id;
```

| enrollment_id | patient_age | clinical_diagnosis | enrollment_date | protocol_study_protocol_id | protocol_study_identifier | protocol_study_title |
|---|---|---|---|---|---|---|
| 4447035 | 27 | Mild Cognitive Impairment | 2022-05-11T16:00:00 | 1 | STU-2431 | Composite Programme |
| gd_taxc_2121 | 38 | Dementia of Uncertain Cause | 2023-10-22T23:17:00 | 2 | STU-2434 | Compact Standard A |
| id_30 | 49 | Mild Cognitive Impairment | 2024-03-06T06:34:00 | 3 | STU-2437 | Legacy Framework |
| b_VB-EC-0 | 60 | Dementia of Uncertain Cause | 2025-08-17T13:51:00 | 4 | STU-2440 | Regional Protocol |

This view re-establishes the enrollment-to-protocol linkage from the patient's perspective, confirming that each enrollment is correctly attributed to its parent protocol. Enrollment `4447035` maps to protocol `STU-2431` (*Composite Programme*), while enrollment `id_30` maps to protocol `STU-2437` (*Legacy Framework*). This view serves as a data integrity check, ensuring that enrollment records are properly anchored to their governing protocols.

**View `v_patient_enrollment_scan_result`**

```sql
CREATE VIEW v_patient_enrollment_scan_result AS
SELECT a.enrollment_id, a.patient_age, a.clinical_diagnosis, a.enrollment_date, b.id AS result_id, b.result_id AS result_result_id, b.amyloid_status AS result_amyloid_status
FROM patient_enrollments a JOIN scan_results b ON a.scan_result_id = b.id;
```

| enrollment_id | patient_age | clinical_diagnosis | enrollment_date | result_id | result_result_id | result_amyloid_status |
|---|---|---|---|---|---|---|
| 4447035 | 27 | Mild Cognitive Impairment | 2022-05-11T16:00:00 | 1000 | 338524 | Positive |
| gd_taxc_2121 | 38 | Dementia of Uncertain Cause | 2023-10-22T23:17:00 | 1001 | 1562853 | Negative |
| id_30 | 49 | Mild Cognitive Impairment | 2024-03-06T06:34:00 | 1002 | 5844284 | Indeterminate |
| b_VB-EC-0 | 60 | Dementia of Uncertain Cause | 2025-08-17T13:51:00 | 1003 | 6020 | Positive |

This view connects patient enrollments to their corresponding scan results, closing the clinical loop from enrollment through imaging to interpretation. Enrollment `4447035` is associated with scan result `1000`, which carries a `Positive` amyloid status and the clinical impact *Excludes Alzheimer's*. Enrollment `gd_taxc_2121` is associated with scan result `1001`, which carries a `Negative` amyloid status and the impact *Confirms Alzheimer's*. This view enables clinicians and researchers to review the diagnostic outcomes of enrolled patients and to correlate enrollment characteristics with clinical findings.

**View `v_imaging_procedure_imaging_facility`**

```sql
CREATE VIEW v_imaging_procedure_imaging_facility AS
SELECT a.id, a.procedure_id, a.procedure_date, a.modality, b.imaging_facility_id AS facility_imaging_facility_id, b.facility_id AS facility_facility_id, b.facility_name AS facility_facility_name
FROM imaging_procedures a JOIN imaging_facilities b ON a.imaging_facility_id = b.imaging_facility_id;
```

| id | procedure_id | procedure_date | modality | facility_imaging_facility_id | facility_facility_id | facility_facility_name |
|---|---|---|---|---|---|---|
| 1 | 790490 | 2022-05-19T04:48:00 | seasonal-modality-17 | 1 | 69447 | Integrated Protocol A |
| 2 | 4060658 | 2023-10-03T11:05:00 | regional-modality-18 | 2 | 1040 | Extended Programme |
| 3 | L384 | 2024-03-14T18:22:00 | legacy-modality-19 | 3 | 2986228 | Pilot Standard |
| 4 | 3012831 | 2025-08-25T01:39:00 | compact-modality-20 | 4 | ChIJvSxSbfdv5kcRanVzI8RRu20 | Baseline Framework D |

This view joins imaging procedures with their hosting facilities, answering where each procedure was performed. Procedure `790490` was conducted at *Integrated Protocol A* (`imaging_facility_id` 1), which holds `Approved` certification status. Procedure `4060658` was conducted at *Extended Programme* (`imaging_facility_id` 2), which holds `Pending` certification status. This view supports facility utilization analysis and certification compliance monitoring.

**View `v_imaging_procedure_physician`**

```sql
CREATE VIEW v_imaging_procedure_physician AS
SELECT a.id, a.procedure_id, a.procedure_date, a.modality, b.physician_id AS physician_physician_id, b.specialty AS physician_specialty, b.board_certified AS physician_board_certified
FROM imaging_procedures a JOIN physicians b ON a.physician_id = b.physician_id;
```

| id | procedure_id | procedure_date | modality | physician_physician_id | physician_specialty | physician_board_certified |
|---|---|---|---|---|---|---|
| 1 | 790490 | 2022-05-19T04:48:00 | seasonal-modality-17 | 100 | Neurology | false |
| 2 | 4060658 | 2023-10-03T11:05:00 | regional-modality-18 | 101 | Psychiatry | true |
| 3 | L384 | 2024-03-14T18:22:00 | legacy-modality-19 | 102 | Geriatric Medicine | false |
| 4 | 3012831 | 2025-08-25T01:39:00 | compact-modality-20 | 103 | Radiology | true |

This view links imaging procedures to the physicians who performed or supervised them, documenting the clinical personnel involved in each procedure. Procedure `790490` is associated with physician `100`, a Neurologist serving as a Referring physician. Procedure `4060658` is associated with physician `101`, a board-certified Psychiatrist serving as an Ordering physician. This view enables workload distribution analysis and physician performance tracking.

**View `v_imaging_procedure_scan_result`**

```sql
CREATE VIEW v_imaging_procedure_scan_result AS
SELECT a.id, a.procedure_id, a.procedure_date, a.modality, b.id AS result_id, b.result_id AS result_result_id, b.amyloid_status AS result_amyloid_status
FROM imaging_procedures a JOIN scan_results b ON a.scan_result_id = b.id;
```

| id | procedure_id | procedure_date | modality | result_id | result_result_id | result_amyloid_status |
|---|---|---|---|---|---|---|
| 1 | 790490 | 2022-05-19T04:48:00 | seasonal-modality-17 | 1000 | 338524 | Positive |
| 2 | 4060658 | 2023-10-03T11:05:00 | regional-modality-18 | 1001 | 1562853 | Negative |
| 3 | L384 | 2024-03-14T18:22:00 | legacy-modality-19 | 1002 | 5844284 | Indeterminate |
| 4 | 3012831 | 2025-08-25T01:39:00 | compact-modality-20 | 1003 | 6020 | Positive |

This view connects imaging procedures to their resulting scan results, establishing the direct output of each procedure. Procedure `790490` produced scan result `1000` with a `Positive` amyloid status and interpretation text `composite-interpre-39`. Procedure `4060658` produced scan result `1001` with a `Negative` amyloid status and interpretation text `primary-interpre-40`. This view is critical for quality assurance, allowing reviewers to verify that every procedure has a corresponding result and that results are generated within expected timeframes.

**View `v_scan_result_imaging_procedure`**

```sql
CREATE VIEW v_scan_result_imaging_procedure AS
SELECT a.id, a.result_id, a.amyloid_status, a.interpretation_text, b.id AS procedure_id, b.procedure_id AS procedure_procedure_id, b.procedure_date AS procedure_procedure_date
FROM scan_results a JOIN imaging_procedures b ON a.imaging_procedure_id = b.id;
```

| id | result_id | amyloid_status | interpretation_text | procedure_id | procedure_procedure_id | procedure_procedure_date |
|---|---|---|---|---|---|---|
| 1000 | 338524 | Positive | composite-interpre-39 | 1 | 790490 | 2022-05-19T04:48:00 |
| 1001 | 1562853 | Negative | primary-interpre-40 | 2 | 4060658 | 2023-10-03T11:05:00 |
| 1002 | 5844284 | Indeterminate | adaptive-interpre-41 | 3 | L384 | 2024-03-14T18:22:00 |
| 1003 | 6020 | Positive | distributed-interpre-42 | 4 | 3012831 | 2025-08-25T01:39:00 |

This view presents the scan result perspective, linking each result back to its originating imaging procedure. Result `1000` traces to procedure `790490`, performed on 2022-05-19. Result `1002` traces to procedure `L384`, performed on 2024-03-14, and carries an `Indeterminate` amyloid status with the clinical impact *Guides Management*. This view supports result-centric queries, such as identifying all results with a specific amyloid status or filtering results by interpretation text patterns.

**View `v_scan_result_patient_enrollment`**

```sql
CREATE VIEW v_scan_result_patient_enrollment AS
SELECT a.id, a.result_id, a.amyloid_status, a.interpretation_text, b.enrollment_id AS enrollment_enrollment_id, b.patient_age AS enrollment_patient_age, b.clinical_diagnosis AS enrollment_clinical_diagnosis
FROM scan_results a JOIN patient_enrollments b ON a.enrollment_id = b.enrollment_id;
```

| id | result_id | amyloid_status | interpretation_text | enrollment_enrollment_id | enrollment_patient_age | enrollment_clinical_diagnosis |
|---|---|---|---|---|---|---|
| 1000 | 338524 | Positive | composite-interpre-39 | 4447035 | 27 | Mild Cognitive Impairment |
| 1001 | 1562853 | Negative | primary-interpre-40 | gd_taxc_2121 | 38 | Dementia of Uncertain Cause |
| 1002 | 5844284 | Indeterminate | adaptive-interpre-41 | id_30 | 49 | Mild Cognitive Impairment |
| 1003 | 6020 | Positive | distributed-interpre-42 | b_VB-EC-0 | 60 | Dementia of Uncertain Cause |

This view connects scan results to the patient enrollments from which they originated, providing a patient-centric view of diagnostic outcomes. Result `1000` is linked to enrollment `4447035`, a 27-year-old patient with Mild Cognitive Impairment. Result `1003` is linked to enrollment `b_VB-EC-0`, a 60-year-old patient with Dementia of Uncertain Cause, and carries a `Positive` amyloid status with the impact *Excludes Alzheimer's*. This view is valuable for longitudinal patient tracking and for correlating enrollment demographics with scan outcomes.

**View `v_imaging_facility_imaging_procedure_detail`**

```sql
CREATE VIEW v_imaging_facility_imaging_procedure_detail AS
SELECT a.imaging_facility_id, a.facility_id, a.facility_name, b.id AS procedure_id, b.procedure_id AS procedure_procedure_id, b.procedure_date AS procedure_procedure_date
FROM imaging_facilities a
  JOIN facilities_procedures j ON j.imaging_facility_id = a.imaging_facility_id
  JOIN imaging_procedures b ON b.id = j.imaging_procedure_id;
```

| imaging_facility_id | facility_id | facility_name | procedure_id | procedure_procedure_id | procedure_procedure_date |
|---|---|---|---|---|---|
| 1 | 69447 | Integrated Protocol A | 1 | 790490 | 2022-05-19T04:48:00 |
| 1 | 69447 | Integrated Protocol A | 2 | 4060658 | 2023-10-03T11:05:00 |
| 2 | 1040 | Extended Programme | 2 | 4060658 | 2023-10-03T11:05:00 |
| 2 | 1040 | Extended Programme | 3 | L384 | 2024-03-14T18:22:00 |
| 3 | 2986228 | Pilot Standard | 3 | L384 | 2024-03-14T18:22:00 |
| 3 | 2986228 | Pilot Standard | 4 | 3012831 | 2025-08-25T01:39:00 |
| 4 | ChIJvSxSbfdv5kcRanVzI8RRu20 | Baseline Framework D | 4 | 3012831 | 2025-08-25T01:39:00 |
| 4 | ChIJvSxSbfdv5kcRanVzI8RRu20 | Baseline Framework D | 1 | 790490 | 2022-05-19T04:48:00 |

This view provides a facility-centric summary of all procedures conducted at each imaging facility. Facility *Integrated Protocol A* (`imaging_facility_id` 1) hosted procedure `790490` on 2022-05-19 using `seasonal-modality-17`. Facility *Baseline Framework D* (`imaging_facility_id` 4) hosted procedure `3012831` on 2025-08-25 using `compact-modality-20` and `pilot-tracer-26`. This view supports facility-level reporting, capacity planning, and the identification of high-volume or underutilized sites.

**View `v_physician_patient_enrollment_detail`**

```sql
CREATE VIEW v_physician_patient_enrollment_detail AS
SELECT a.physician_id, a.specialty, a.board_certified, b.enrollment_id AS enrollment_enrollment_id, b.patient_age AS enrollment_patient_age, b.clinical_diagnosis AS enrollment_clinical_diagnosis
FROM physicians a
  JOIN physicians_enrollments j ON j.physician_id = a.physician_id
  JOIN patient_enrollments b ON b.enrollment_id = j.enrollment_id;
```

| physician_id | specialty | board_certified | enrollment_enrollment_id | enrollment_patient_age | enrollment_clinical_diagnosis |
|---|---|---|---|---|---|
| 100 | Neurology | false | 4447035 | 27 | Mild Cognitive Impairment |
| 100 | Neurology | false | gd_taxc_2121 | 38 | Dementia of Uncertain Cause |
| 101 | Psychiatry | true | gd_taxc_2121 | 38 | Dementia of Uncertain Cause |
| 101 | Psychiatry | true | id_30 | 49 | Mild Cognitive Impairment |
| 102 | Geriatric Medicine | false | id_30 | 49 | Mild Cognitive Impairment |
| 102 | Geriatric Medicine | false | b_VB-EC-0 | 60 | Dementia of Uncertain Cause |
| 103 | Radiology | true | b_VB-EC-0 | 60 | Dementia of Uncertain Cause |
| 103 | Radiology | true | 4447035 | 27 | Mild Cognitive Impairment |

This view links physicians to the patient enrollments they are associated with, documenting the referral and management relationships between physicians and enrolled patients. Physician `100` is linked to enrollment `4447035`, while physician `101` is linked to enrollment `gd_taxc_2121`. This view enables the analysis of physician referral patterns and the assessment of physician workload across the enrollment population.

**View `v_physician_imaging_procedure_detail`**

```sql
CREATE VIEW v_physician_imaging_procedure_detail AS
SELECT a.physician_id, a.specialty, a.board_certified, b.id AS procedure_id, b.procedure_id AS procedure_procedure_id, b.procedure_date AS procedure_procedure_date
FROM physicians a
  JOIN physicians_procedures j ON j.physician_id = a.physician_id
  JOIN imaging_procedures b ON b.id = j.imaging_procedure_id;
```

| physician_id | specialty | board_certified | procedure_id | procedure_procedure_id | procedure_procedure_date |
|---|---|---|---|---|---|
| 100 | Neurology | false | 1 | 790490 | 2022-05-19T04:48:00 |
| 100 | Neurology | false | 2 | 4060658 | 2023-10-03T11:05:00 |
| 101 | Psychiatry | true | 2 | 4060658 | 2023-10-03T11:05:00 |
| 101 | Psychiatry | true | 3 | L384 | 2024-03-14T18:22:00 |
| 102 | Geriatric Medicine | false | 3 | L384 | 2024-03-14T18:22:00 |
| 102 | Geriatric Medicine | false | 4 | 3012831 | 2025-08-25T01:39:00 |
| 103 | Radiology | true | 4 | 3012831 | 2025-08-25T01:39:00 |
| 103 | Radiology | true | 1 | 790490 | 2022-05-19T04:48:00 |

This view connects physicians to the imaging procedures they conducted or supervised, providing a procedural workload view. Physician `100` is associated with procedure `790490`, performed on 2022-05-19. Physician `103`, a board-certified Radiologist serving as a Referring physician, is associated with procedure `3012831`, performed on 2025-08-25. This view supports credentialing reviews, procedural competency assessments, and the identification of physicians with specialized expertise in particular modalities or anatomical regions.

**View `v_physician_scan_result_detail`**

```sql
CREATE VIEW v_physician_scan_result_detail AS
SELECT a.physician_id, a.specialty, a.board_certified, b.id AS result_id, b.result_id AS result_result_id, b.amyloid_status AS result_amyloid_status
FROM physicians a
  JOIN physicians_results j ON j.physician_id = a.physician_id
  JOIN scan_results b ON b.id = j.scan_result_id;
```

| physician_id | specialty | board_certified | result_id | result_result_id | result_amyloid_status |
|---|---|---|---|---|---|
| 100 | Neurology | false | 1000 | 338524 | Positive |
| 100 | Neurology | false | 1001 | 1562853 | Negative |
| 101 | Psychiatry | true | 1001 | 1562853 | Negative |
| 101 | Psychiatry | true | 1002 | 5844284 | Indeterminate |
| 102 | Geriatric Medicine | false | 1002 | 5844284 | Indeterminate |
| 102 | Geriatric Medicine | false | 1003 | 6020 | Positive |
| 103 | Radiology | true | 1003 | 6020 | Positive |
| 103 | Radiology | true | 1000 | 338524 | Positive |

This view ties physicians to the scan results they interpreted, documenting the interpretive responsibility for each clinical finding. Physician `100` is linked to result `1000`, which carries a `Positive` amyloid status. Physician `102`, a Geriatric Medicine specialist serving as an Interpreting physician, is linked to result `1002`, which carries an `Indeterminate` amyloid status. This view is essential for tracking interpreter workload, assessing inter-rater reliability, and maintaining audit trails for clinical decisions.

**View `v_reimbursement_record_imaging_procedure`**

```sql
CREATE VIEW v_reimbursement_record_imaging_procedure AS
SELECT a.id, a.reimbursement_id, a.amount, a.payment_date, b.id AS procedure_id, b.procedure_id AS procedure_procedure_id, b.procedure_date AS procedure_procedure_date
FROM reimbursement_records a JOIN imaging_procedures b ON a.imaging_procedure_id = b.id;
```

| id | reimbursement_id | amount | payment_date | procedure_id | procedure_procedure_id | procedure_procedure_date |
|---|---|---|---|---|---|---|
| 1 | 374 | 13.49 | 2024-03-24T14:54:00 | 1 | 790490 | 2022-05-19T04:48:00 |
| 2 | 10238289 | 25.47 | 2025-08-08T21:11:00 | 2 | 4060658 | 2023-10-03T11:05:00 |
| 3 | 10782184 | 19.72 | 2022-01-19T04:28:00 | 3 | L384 | 2024-03-14T18:22:00 |
| 4 | 4447027 | 12.74 | 2023-06-03T11:45:00 | 4 | 3012831 | 2025-08-25T01:39:00 |

This view links reimbursement records to the imaging procedures they compensate, providing a procedure-level financial view. It answers which procedures have been reimbursed, by how much, and under which funding terms. This view enables the reconciliation of procedure volumes with payment volumes and the identification of procedures that may be under- or over-reimbursed relative to protocol budgets.

**View `v_reimbursement_record_imaging_facility`**

```sql
CREATE VIEW v_reimbursement_record_imaging_facility AS
SELECT a.id, a.reimbursement_id, a.amount, a.payment_date, b.imaging_facility_id AS facility_imaging_facility_id, b.facility_id AS facility_facility_id, b.facility_name AS facility_facility_name
FROM reimbursement_records a JOIN imaging_facilities b ON a.imaging_facility_id = b.imaging_facility_id;
```

| id | reimbursement_id | amount | payment_date | facility_imaging_facility_id | facility_facility_id | facility_facility_name |
|---|---|---|---|---|---|---|
| 1 | 374 | 13.49 | 2024-03-24T14:54:00 | 1 | 69447 | Integrated Protocol A |
| 2 | 10238289 | 25.47 | 2025-08-08T21:11:00 | 2 | 1040 | Extended Programme |
| 3 | 10782184 | 19.72 | 2022-01-19T04:28:00 | 3 | 2986228 | Pilot Standard |
| 4 | 4447027 | 12.74 | 2023-06-03T11:45:00 | 4 | ChIJvSxSbfdv5kcRanVzI8RRu20 | Baseline Framework D |

This view connects reimbursement records to the imaging facilities that performed the reimbursed procedures, providing a facility-level financial view. It answers which facilities have received payments, from which protocols, and in what amounts. This view supports facility financial reporting, contract compliance verification, and the identification of facilities with reimbursement discrepancies.

The registry described here integrates clinical, operational, and financial data into a coherent structure that supports the full lifecycle of neuroimaging studies. Study protocols define the research and clinical scope; patient enrollments capture the human subjects; imaging procedures document the acquisition of diagnostic data; scan results deliver the clinical interpretations; imaging facilities provide the infrastructure; physicians supply the clinical expertise; and reimbursement records ensure financial accountability. The junction tables and analytical views weave these entities into a navigable whole, enabling practitioners to monitor enrollment progress, audit procedural compliance, track clinical outcomes, and reconcile financial transactions. Together, these components form the operational backbone of modern imaging registries, ensuring that every step from study design to clinical insight is recorded, traceable, and actionable.

## Data appendix

**Table `protocols_enrollments`**

| study_protocol_id | enrollment_id |
|---|---|
| 1 | 4447035 |
| 1 | gd_taxc_2121 |
| 2 | gd_taxc_2121 |
| 2 | id_30 |
| 3 | id_30 |
| 3 | b_VB-EC-0 |
| 4 | b_VB-EC-0 |
| 4 | 4447035 |

**Table `protocols_records`**

| study_protocol_id | reimbursement_record_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

**Table `facilities_procedures`**

| imaging_facility_id | imaging_procedure_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

**Table `physicians_enrollments`**

| physician_id | enrollment_id |
|---|---|
| 100 | 4447035 |
| 100 | gd_taxc_2121 |
| 101 | gd_taxc_2121 |
| 101 | id_30 |
| 102 | id_30 |
| 102 | b_VB-EC-0 |
| 103 | b_VB-EC-0 |
| 103 | 4447035 |

**Table `physicians_procedures`**

| physician_id | imaging_procedure_id |
|---|---|
| 100 | 1 |
| 100 | 2 |
| 101 | 2 |
| 101 | 3 |
| 102 | 3 |
| 102 | 4 |
| 103 | 4 |
| 103 | 1 |

**Table `physicians_results`**

| physician_id | scan_result_id |
|---|---|
| 100 | 1000 |
| 100 | 1001 |
| 101 | 1001 |
| 101 | 1002 |
| 102 | 1002 |
| 102 | 1003 |
| 103 | 1003 |
| 103 | 1000 |
