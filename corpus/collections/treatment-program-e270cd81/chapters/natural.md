# Clinical Operations and Treatment Delivery

The administration of substance-use treatment programs requires a coordinated infrastructure that links clinical services, patient populations, risk evaluations, physical facilities, and financial coverage into a single operational fabric. Each treatment program operates within a defined delivery mode—whether video-based or in-office—carries a designated risk level, and maintains a status that reflects its current operational standing. Clinical services represent the therapeutic interventions delivered to patients, ranging from individual therapy to urine screening, each scheduled with specific frequencies and durations. Patients enter the system with documented admission and discharge dates, risk categories, and demographic classifications that inform their care pathways. Risk assessments provide quantitative and qualitative evaluations of patient acuity, while facilities anchor the physical delivery of care. Payment sources determine the financial mechanisms that sustain these operations. Together, these records form the operational backbone of a treatment organization, enabling administrators to track program performance, patient outcomes, and resource allocation across a complex service landscape.

## Treatment Programs

**Table `treatment_programs`**

| id | program_id | program_name | delivery_mode | risk_level | status | accreditation_body | service_code | facility_id | payment_source_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 103176 | Extended Review | video | high | active | integrated-accredit-88 | 20789856 | 1 | 1 |
| 2 | 2986219 | Pilot Initiative A | in-office | moderate | inactive | seasonal-accredit-89 | 3990167 | 2 | 2 |
| 3 | 1186079 | Baseline Model | video | low | active | regional-accredit-90 | 14484998 | 3 | 3 |
| 4 | 1562855 | Distributed Cluster | in-office | high | inactive | legacy-accredit-91 | Total | 4 | 4 |

Treatment programs constitute the primary organizational units within the system. Each program is identified by a unique program identifier and a descriptive name, such as "Extended Review" or "Pilot Initiative A." The delivery mode specifies whether the program operates via video consultation or in-office sessions, a distinction that carries significant implications for patient access and clinical methodology. Risk levels—categorized as high, moderate, or low—reflect the acuity of the populations served. The status field indicates whether a program is currently active or inactive, enabling administrators to manage program lifecycles. Accreditation bodies, ranging from "integrated-accredit-88" to "legacy-accredit-91," provide external validation of program quality. Service codes link each program to its corresponding clinical service records, while facility and payment source identifiers establish the operational and financial context in which the program functions. Program 103176, for instance, operates as a high-risk, video-based program under the integrated-accredit-88 body, whereas program 1562855, named "Distributed Cluster," runs in-office with a high-risk designation but currently holds inactive status.

## Clinical Services

**Table `clinical_services`**

| service_code | service_name | service_type | frequency | duration | status | treatment_program_id | patient_id | risk_assessment_id |
|---|---|---|---|---|---|---|---|---|
| 20789856 | Distributed Initiative | individual_therapy | regional-frequenc-36 | 28 | scheduled | 1 | 8387541 | 1 |
| 3990167 | Adaptive Model D | family_therapy | legacy-frequenc-37 | 36 | completed | 2 | 10207142 | 2 |
| 14484998 | Primary Cluster | group_therapy | compact-frequenc-38 | 44 | cancelled | 3 | 7119782 | 3 |
| Total | Composite Review | urine_screening | composite-frequenc-39 | 52 | scheduled | 4 | gd_acc_160003 | 4 |

Clinical services represent the therapeutic interventions delivered to patients, each characterized by a service name, type, frequency, and duration. Service types span individual therapy, family therapy, group therapy, and urine screening, reflecting the breadth of clinical modalities available. The frequency field—encoded as values such as "regional-frequenc-36" or "legacy-frequenc-37"—captures the scheduling cadence of each service, while duration specifies the length of engagement in days. The status field tracks whether a service is scheduled, completed, or cancelled, providing real-time visibility into service delivery. Each clinical service is linked to a treatment program through the treatment program identifier, establishing the programmatic context for the intervention. Patient identifiers and risk assessment identifiers further anchor each service to the individuals it serves and the evaluations that informed their care plans. Service 20789856, "Distributed Initiative," is an individual therapy intervention scheduled for 28 days under program 1, while service "Total," a urine screening composite, is scheduled for 52 days under program 4.

## Patients

**Table `patients`**

| patient_id | admission_date | discharge_date | risk_category | substance_history | offense_history | priority_status | demographic_group | treatment_program_id | service_code | risk_assessment_id | payment_source_id |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 8387541 | 2023-06-22T05:39:00 | 2022-09-02T08:24:00 | high_risk | significant | significant | true | adolescent | 1 | 20789856 | 1 | 1 |
| 10207142 | 2024-11-06T12:56:00 | 2023-02-13T15:41:00 | moderate_risk | minimal | minimal | false | pregnant_woman | 2 | 3990167 | 2 | 2 |
| 7119782 | 2025-04-17T19:13:00 | 2024-07-24T22:58:00 | low_risk | none | none | true | veteran | 3 | 14484998 | 3 | 3 |
| gd_acc_160003 | 2022-09-01T02:30:00 | 2025-12-08T05:15:00 | high_risk | significant | significant | false | iv_drug_user | 4 | Total | 4 | 4 |

Patients are the central subjects of the treatment system, each record capturing their admission and discharge dates, risk category, substance and offense history, and priority status. The risk category—high risk, moderate risk, or low risk—provides a summary of the patient's clinical acuity, while substance history and offense history fields document the severity of contributing factors, ranging from "none" to "significant." Priority status indicates whether the patient requires expedited or elevated attention. Demographic group classifications, including adolescent, pregnant woman, veteran, and IV drug user, enable targeted service matching and resource planning. Each patient record references a treatment program, a clinical service, a risk assessment, and a payment source, establishing the full operational context of their care. Patient 8387541, an adolescent classified as high risk with significant substance and offense history, is enrolled in program 1 and receives service 20789856. Patient gd_acc_160003, an IV drug user also classified as high risk, is associated with program 4 and the composite service "Total."

## Risk Assessments

**Table `risk_assessments`**

| id | assessment_id | assessment_date | risk_score | assessment_type | result | assessor_id | patient_id | treatment_program_id | service_code |
|---|---|---|---|---|---|---|---|---|---|
| 1 | template_ivacode_pagata_20det40ind | 2022-05-10T04:24:00 | 19.70 | initial | high_risk | 5f901eb6-8fcd-11eb-924d-9cd76263cbd0 | 8387541 | 1 | 20789856 |
| 2 | 19508914 | 2023-10-21T11:41:00 | 22.40 | follow_up | moderate_risk | 4060646 | 10207142 | 2 | 3990167 |
| 3 | 506000 | 2024-03-05T18:58:00 | 25.10 | discharge | low_risk | eff24a44-8fcb-11eb-924d-9cd76263cbd0 | 7119782 | 3 | 14484998 |
| 4 | 1204-0009-M | 2025-08-16T01:15:00 | 27.80 | initial | high_risk | 2933475 | gd_acc_160003 | 4 | Total |

Risk assessments provide structured evaluations of patient acuity, each record containing an assessment date, a numeric risk score, an assessment type, and a result classification. Risk scores range from 19.70 to 27.80 in the current dataset, with higher values indicating greater clinical concern. Assessment types—initial, follow-up, and discharge—correspond to different stages of the patient journey, with initial assessments conducted at intake, follow-ups during treatment, and discharge assessments at program completion. The result field translates the numeric score into a categorical classification: high risk, moderate risk, or low risk. Assessors are identified by unique identifiers, some formatted as UUIDs and others as numeric codes, reflecting the diverse personnel who conduct evaluations. Each assessment is linked to a patient, a treatment program, and a clinical service, ensuring that risk evaluations are contextualized within the patient's care pathway. Assessment template_ivacode_pagata_20det40ind, conducted on 2022-05-10, yielded a risk score of 19.70 and a high-risk result for patient 8387541, while assessment 1204-0009-M, dated 2025-08-16, produced a score of 27.80 and a high-risk result for patient gd_acc_160003.

## Facilities

**Table `facilities`**

| facility_id | facility_name | street_address | city | state | zip_code | bus_accessible | evening_hours | admissions_hours | treatment_program_id | service_code |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | Integrated Protocol A | composite-street-15 | integrated-city-34 | distributed-state-84 | 69434 | true | false | 24/7 | 1 | 20789856 |
| 2 | Extended Programme | primary-street-16 | seasonal-city-35 | baseline-state-85 | 13589 | false | true | business_hours | 2 | 3990167 |
| 3 | Pilot Standard | adaptive-street-17 | regional-city-36 | pilot-state-86 | 9bb5fec0-8fcc-11eb-924d-9cd76263cbd0 | true | false | 24/7 | 3 | 14484998 |
| 4 | Baseline Framework D | distributed-street-18 | legacy-city-37 | extended-state-87 | 1250214 | false | true | business_hours | 4 | Total |

Facilities represent the physical locations where treatment services are delivered, each record containing the facility name, street address, city, state, and zip code. Accessibility features are captured through the bus accessible and evening hours fields, which indicate whether the facility accommodates patients with transportation needs or those requiring after-hours services. Admissions hours specify the operational window for new patient intake, with values such as "24/7" and "business_hours" reflecting different levels of availability. Each facility is linked to a treatment program and a clinical service, establishing the operational context for service delivery at that location. Facility 1, "Integrated Protocol A," located in integrated-city-34, offers 24/7 admissions and bus accessibility, serving program 1 and service 20789856. Facility 2, "Extended Programme," in seasonal-city-35, operates during business hours with evening availability but no bus access, supporting program 2 and service 3990167.

## Payment Sources

**Table `payment_sources`**

| id | source_id | source_name | source_type | coverage_status | effective_date | patient_id | service_code |
|---|---|---|---|---|---|---|---|
| 1 | 3e9b5c70-8fcd-11eb-924d-9cd76263cbd0 | Composite Model | private_insurance | accepted | 2023-02-14 | 8387541 | 20789856 |
| 2 | 7021001070050 | Compact Cluster A | medical_assistance | not_accepted | 2024-07-25 | 10207142 | 3990167 |
| 3 | achat | Legacy Review | county_funding | accepted | 2025-12-09 | 7119782 | 14484998 |
| 4 | template_impcode_pagata_10det50 | Regional Initiative | private_insurance | not_accepted | 2022-05-20 | gd_acc_160003 | Total |

Payment sources define the financial mechanisms that enable treatment delivery, each record containing a source name, type, coverage status, and effective date. Source types include private insurance, medical assistance, and county funding, reflecting the diversity of financing options available to patients. The coverage status field—accepted or not_accepted—indicates whether the source is currently recognized for the associated service, a critical determinant of patient access. Effective dates specify when the coverage arrangement became active, enabling temporal tracking of financial arrangements. Each payment source is linked to a patient and a clinical service, establishing the financial context for individual care episodes. Source 3e9b5c70-8fcd-11eb-924d-9cd76263cbd0, a private insurance plan named "Composite Model," is accepted and effective from 2023-02-14, covering patient 8387541 for service 20789856. Source achat, a county funding arrangement named "Legacy Review," is accepted and effective from 2025-12-09, supporting patient 7119782 and service 14484998.

## Program-Service and Program-Facility Relationships

**View `v_treatment_program_clinical_service`**

```sql
CREATE VIEW v_treatment_program_clinical_service AS
SELECT a.id, a.program_id, a.program_name, a.delivery_mode, b.service_code AS service_service_code, b.service_name AS service_service_name, b.service_type AS service_service_type
FROM treatment_programs a JOIN clinical_services b ON a.service_code = b.service_code;
```

| id | program_id | program_name | delivery_mode | service_service_code | service_service_name | service_service_type |
|---|---|---|---|---|---|---|
| 1 | 103176 | Extended Review | video | 20789856 | Distributed Initiative | individual_therapy |
| 2 | 2986219 | Pilot Initiative A | in-office | 3990167 | Adaptive Model D | family_therapy |
| 3 | 1186079 | Baseline Model | video | 14484998 | Primary Cluster | group_therapy |
| 4 | 1562855 | Distributed Cluster | in-office | Total | Composite Review | urine_screening |

This view resolves the relationship between treatment programs and the clinical services they deliver, answering the question of which services are available within each program. The joined result reveals that program 103176 ("Extended Review") is associated with service 20789856 ("Distributed Initiative"), an individual therapy intervention scheduled for 28 days. Program 2986219 ("Pilot Initiative A") corresponds to service 3990167 ("Adaptive Model D"), a family therapy service with a 36-day duration that has been completed. Program 1186079 ("Baseline Model") links to service 14484998 ("Primary Cluster"), a group therapy service scheduled for 44 days but currently in cancelled status. Program 1562855 ("Distributed Cluster") is paired with the composite service "Total," a urine screening intervention with a 52-day duration that remains scheduled.

**View `v_treatment_program_facility`**

```sql
CREATE VIEW v_treatment_program_facility AS
SELECT a.id, a.program_id, a.program_name, a.delivery_mode, b.facility_id AS facility_facility_id, b.facility_name AS facility_facility_name, b.street_address AS facility_street_address
FROM treatment_programs a JOIN facilities b ON a.facility_id = b.facility_id;
```

| id | program_id | program_name | delivery_mode | facility_facility_id | facility_facility_name | facility_street_address |
|---|---|---|---|---|---|---|
| 1 | 103176 | Extended Review | video | 1 | Integrated Protocol A | composite-street-15 |
| 2 | 2986219 | Pilot Initiative A | in-office | 2 | Extended Programme | primary-street-16 |
| 3 | 1186079 | Baseline Model | video | 3 | Pilot Standard | adaptive-street-17 |
| 4 | 1562855 | Distributed Cluster | in-office | 4 | Baseline Framework D | distributed-street-18 |

This view maps treatment programs to the facilities where their services are delivered, clarifying the physical infrastructure supporting each program. Program 103176 ("Extended Review") operates through facility 1 ("Integrated Protocol A"), a 24/7 admissions facility in integrated-city-34 with bus accessibility. Program 2986219 ("Pilot Initiative A") is delivered at facility 2 ("Extended Programme"), which offers evening hours but no bus accessibility and operates during business hours for admissions. Program 1186079 ("Baseline Model") is associated with facility 3 ("Pilot Standard"), a 24/7 admissions facility in regional-city-36 with bus accessibility. Program 1562855 ("Distributed Cluster") operates through facility 4 ("Baseline Framework D"), a business-hours facility in legacy-city-37 without bus accessibility.

**View `v_treatment_program_payment_source`**

```sql
CREATE VIEW v_treatment_program_payment_source AS
SELECT a.id, a.program_id, a.program_name, a.delivery_mode, b.id AS source_id, b.source_id AS source_source_id, b.source_name AS source_source_name
FROM treatment_programs a JOIN payment_sources b ON a.payment_source_id = b.id;
```

| id | program_id | program_name | delivery_mode | source_id | source_source_id | source_source_name |
|---|---|---|---|---|---|---|
| 1 | 103176 | Extended Review | video | 1 | 3e9b5c70-8fcd-11eb-924d-9cd76263cbd0 | Composite Model |
| 2 | 2986219 | Pilot Initiative A | in-office | 2 | 7021001070050 | Compact Cluster A |
| 3 | 1186079 | Baseline Model | video | 3 | achat | Legacy Review |
| 4 | 1562855 | Distributed Cluster | in-office | 4 | template_impcode_pagata_10det50 | Regional Initiative |

This view connects treatment programs to the payment sources that finance their services, revealing the financial architecture underlying each program. Program 103176 ("Extended Review") is supported by payment source 3e9b5c70-8fcd-11eb-924d-9cd76263cbd0 ("Composite Model"), a private insurance plan with accepted coverage status effective from 2023-02-14. Program 2986219 ("Pilot Initiative A") is linked to source 7021001070050 ("Compact Cluster A"), a medical assistance plan with not_accepted status effective from 2024-07-25. Program 1186079 ("Baseline Model") is associated with source achat ("Legacy Review"), a county funding arrangement with accepted status effective from 2025-12-09. Program 1562855 ("Distributed Cluster") is supported by source template_impcode_pagata_10det50 ("Regional Initiative"), a private insurance plan with not_accepted status effective from 2022-05-20.

## Service-Centric Relationships

**View `v_clinical_service_treatment_program`**

```sql
CREATE VIEW v_clinical_service_treatment_program AS
SELECT a.service_code, a.service_name, a.service_type, a.frequency, b.id AS program_id, b.program_id AS program_program_id, b.program_name AS program_program_name
FROM clinical_services a JOIN treatment_programs b ON a.treatment_program_id = b.id;
```

| service_code | service_name | service_type | frequency | program_id | program_program_id | program_program_name |
|---|---|---|---|---|---|---|
| 20789856 | Distributed Initiative | individual_therapy | regional-frequenc-36 | 1 | 103176 | Extended Review |
| 3990167 | Adaptive Model D | family_therapy | legacy-frequenc-37 | 2 | 2986219 | Pilot Initiative A |
| 14484998 | Primary Cluster | group_therapy | compact-frequenc-38 | 3 | 1186079 | Baseline Model |
| Total | Composite Review | urine_screening | composite-frequenc-39 | 4 | 1562855 | Distributed Cluster |

This view inverts the program-service relationship, presenting each clinical service alongside its parent program to answer which program governs a given service. Service 20789856 ("Distributed Initiative") is governed by program 103176 ("Extended Review"), a high-risk, video-based program with active status. Service 3990167 ("Adaptive Model D") falls under program 2986219 ("Pilot Initiative A"), an inactive, in-office program with moderate risk designation. Service 14484998 ("Primary Cluster") is administered by program 1186079 ("Baseline Model"), an active, video-based program with low risk designation. Service "Total" ("Composite Review") is managed by program 1562855 ("Distributed Cluster"), an inactive, in-office program with high risk designation.

**View `v_clinical_service_patient`**

```sql
CREATE VIEW v_clinical_service_patient AS
SELECT a.service_code, a.service_name, a.service_type, a.frequency, b.patient_id AS patient_patient_id, b.admission_date AS patient_admission_date, b.discharge_date AS patient_discharge_date
FROM clinical_services a JOIN patients b ON a.patient_id = b.patient_id;
```

| service_code | service_name | service_type | frequency | patient_patient_id | patient_admission_date | patient_discharge_date |
|---|---|---|---|---|---|---|
| 20789856 | Distributed Initiative | individual_therapy | regional-frequenc-36 | 8387541 | 2023-06-22T05:39:00 | 2022-09-02T08:24:00 |
| 3990167 | Adaptive Model D | family_therapy | legacy-frequenc-37 | 10207142 | 2024-11-06T12:56:00 | 2023-02-13T15:41:00 |
| 14484998 | Primary Cluster | group_therapy | compact-frequenc-38 | 7119782 | 2025-04-17T19:13:00 | 2024-07-24T22:58:00 |
| Total | Composite Review | urine_screening | composite-frequenc-39 | gd_acc_160003 | 2022-09-01T02:30:00 | 2025-12-08T05:15:00 |

This view links clinical services to the patients who receive them, answering which patients are enrolled in each service. Service 20789856 ("Distributed Initiative") serves patient 8387541, an adolescent classified as high risk with significant substance and offense history. Service 3990167 ("Adaptive Model D") serves patient 10207142, a pregnant woman classified as moderate risk with minimal substance and offense history. Service 14484998 ("Primary Cluster") serves patient 7119782, a veteran classified as low risk with no substance or offense history. Service "Total" ("Composite Review") serves patient gd_acc_160003, an IV drug user classified as high risk with significant substance and offense history.

**View `v_clinical_service_risk_assessment`**

```sql
CREATE VIEW v_clinical_service_risk_assessment AS
SELECT a.service_code, a.service_name, a.service_type, a.frequency, b.id AS assessment_id, b.assessment_id AS assessment_assessment_id, b.assessment_date AS assessment_assessment_date
FROM clinical_services a JOIN risk_assessments b ON a.risk_assessment_id = b.id;
```

| service_code | service_name | service_type | frequency | assessment_id | assessment_assessment_id | assessment_assessment_date |
|---|---|---|---|---|---|---|
| 20789856 | Distributed Initiative | individual_therapy | regional-frequenc-36 | 1 | template_ivacode_pagata_20det40ind | 2022-05-10T04:24:00 |
| 3990167 | Adaptive Model D | family_therapy | legacy-frequenc-37 | 2 | 19508914 | 2023-10-21T11:41:00 |
| 14484998 | Primary Cluster | group_therapy | compact-frequenc-38 | 3 | 506000 | 2024-03-05T18:58:00 |
| Total | Composite Review | urine_screening | composite-frequenc-39 | 4 | 1204-0009-M | 2025-08-16T01:15:00 |

This view associates clinical services with the risk assessments that informed their care plans, answering which assessment underpins each service delivery. Service 20789856 ("Distributed Initiative") is associated with assessment template_ivacode_pagata_20det40ind, an initial assessment dated 2022-05-10 with a risk score of 19.70 and a high-risk result. Service 3990167 ("Adaptive Model D") is linked to assessment 19508914, a follow-up assessment dated 2023-10-21 with a risk score of 22.40 and a moderate-risk result. Service 14484998 ("Primary Cluster") corresponds to assessment 506000, a discharge assessment dated 2024-03-05 with a risk score of 25.10 and a low-risk result. Service "Total" ("Composite Review") is associated with assessment 1204-0009-M, an initial assessment dated 2025-08-16 with a risk score of 27.80 and a high-risk result.

## Patient-Centric Relationships

**View `v_patient_treatment_program`**

```sql
CREATE VIEW v_patient_treatment_program AS
SELECT a.patient_id, a.admission_date, a.discharge_date, a.risk_category, b.id AS program_id, b.program_id AS program_program_id, b.program_name AS program_program_name
FROM patients a JOIN treatment_programs b ON a.treatment_program_id = b.id;
```

| patient_id | admission_date | discharge_date | risk_category | program_id | program_program_id | program_program_name |
|---|---|---|---|---|---|---|
| 8387541 | 2023-06-22T05:39:00 | 2022-09-02T08:24:00 | high_risk | 1 | 103176 | Extended Review |
| 10207142 | 2024-11-06T12:56:00 | 2023-02-13T15:41:00 | moderate_risk | 2 | 2986219 | Pilot Initiative A |
| 7119782 | 2025-04-17T19:13:00 | 2024-07-24T22:58:00 | low_risk | 3 | 1186079 | Baseline Model |
| gd_acc_160003 | 2022-09-01T02:30:00 | 2025-12-08T05:15:00 | high_risk | 4 | 1562855 | Distributed Cluster |

This view maps patients to the treatment programs they are enrolled in, answering which program each patient is receiving. Patient 8387541 is enrolled in program 103176 ("Extended Review"), a high-risk, video-based program with active status. Patient 10207142 is enrolled in program 2986219 ("Pilot Initiative A"), an inactive, in-office program with moderate risk designation. Patient 7119782 is enrolled in program 1186079 ("Baseline Model"), an active, video-based program with low risk designation. Patient gd_acc_160003 is enrolled in program 1562855 ("Distributed Cluster"), an inactive, in-office program with high risk designation.

**View `v_patient_clinical_service`**

```sql
CREATE VIEW v_patient_clinical_service AS
SELECT a.patient_id, a.admission_date, a.discharge_date, a.risk_category, b.service_code AS service_service_code, b.service_name AS service_service_name, b.service_type AS service_service_type
FROM patients a JOIN clinical_services b ON a.service_code = b.service_code;
```

| patient_id | admission_date | discharge_date | risk_category | service_service_code | service_service_name | service_service_type |
|---|---|---|---|---|---|---|
| 8387541 | 2023-06-22T05:39:00 | 2022-09-02T08:24:00 | high_risk | 20789856 | Distributed Initiative | individual_therapy |
| 10207142 | 2024-11-06T12:56:00 | 2023-02-13T15:41:00 | moderate_risk | 3990167 | Adaptive Model D | family_therapy |
| 7119782 | 2025-04-17T19:13:00 | 2024-07-24T22:58:00 | low_risk | 14484998 | Primary Cluster | group_therapy |
| gd_acc_160003 | 2022-09-01T02:30:00 | 2025-12-08T05:15:00 | high_risk | Total | Composite Review | urine_screening |

This view links patients to the clinical services they receive, answering which service each patient is currently engaged with. Patient 8387541 receives service 20789856 ("Distributed Initiative"), an individual therapy intervention scheduled for 28 days. Patient 10207142 receives service 3990167 ("Adaptive Model D"), a family therapy service with a 36-day duration that has been completed. Patient 7119782 receives service 14484998 ("Primary Cluster"), a group therapy service scheduled for 44 days but currently in cancelled status. Patient gd_acc_160003 receives service "Total" ("Composite Review"), a urine screening intervention with a 52-day duration that remains scheduled.

**View `v_patient_risk_assessment`**

```sql
CREATE VIEW v_patient_risk_assessment AS
SELECT a.patient_id, a.admission_date, a.discharge_date, a.risk_category, b.id AS assessment_id, b.assessment_id AS assessment_assessment_id, b.assessment_date AS assessment_assessment_date
FROM patients a JOIN risk_assessments b ON a.risk_assessment_id = b.id;
```

| patient_id | admission_date | discharge_date | risk_category | assessment_id | assessment_assessment_id | assessment_assessment_date |
|---|---|---|---|---|---|---|
| 8387541 | 2023-06-22T05:39:00 | 2022-09-02T08:24:00 | high_risk | 1 | template_ivacode_pagata_20det40ind | 2022-05-10T04:24:00 |
| 10207142 | 2024-11-06T12:56:00 | 2023-02-13T15:41:00 | moderate_risk | 2 | 19508914 | 2023-10-21T11:41:00 |
| 7119782 | 2025-04-17T19:13:00 | 2024-07-24T22:58:00 | low_risk | 3 | 506000 | 2024-03-05T18:58:00 |
| gd_acc_160003 | 2022-09-01T02:30:00 | 2025-12-08T05:15:00 | high_risk | 4 | 1204-0009-M | 2025-08-16T01:15:00 |

This view connects patients to their risk assessments, answering which assessment documents each patient's clinical acuity. Patient 8387541 is documented by assessment template_ivacode_pagata_20det40ind, an initial assessment with a risk score of 19.70 and a high-risk result. Patient 10207142 is documented by assessment 19508914, a follow-up assessment with a risk score of 22.40 and a moderate-risk result. Patient 7119782 is documented by assessment 506000, a discharge assessment with a risk score of 25.10 and a low-risk result. Patient gd_acc_160003 is documented by assessment 1204-0009-M, an initial assessment with a risk score of 27.80 and a high-risk result.

**View `v_patient_payment_source`**

```sql
CREATE VIEW v_patient_payment_source AS
SELECT a.patient_id, a.admission_date, a.discharge_date, a.risk_category, b.id AS source_id, b.source_id AS source_source_id, b.source_name AS source_source_name
FROM patients a JOIN payment_sources b ON a.payment_source_id = b.id;
```

| patient_id | admission_date | discharge_date | risk_category | source_id | source_source_id | source_source_name |
|---|---|---|---|---|---|---|
| 8387541 | 2023-06-22T05:39:00 | 2022-09-02T08:24:00 | high_risk | 1 | 3e9b5c70-8fcd-11eb-924d-9cd76263cbd0 | Composite Model |
| 10207142 | 2024-11-06T12:56:00 | 2023-02-13T15:41:00 | moderate_risk | 2 | 7021001070050 | Compact Cluster A |
| 7119782 | 2025-04-17T19:13:00 | 2024-07-24T22:58:00 | low_risk | 3 | achat | Legacy Review |
| gd_acc_160003 | 2022-09-01T02:30:00 | 2025-12-08T05:15:00 | high_risk | 4 | template_impcode_pagata_10det50 | Regional Initiative |

This view links patients to their payment sources, answering which financial mechanism covers each patient's treatment. Patient 8387541 is covered by source 3e9b5c70-8fcd-11eb-924d-9cd76263cbd0 ("Composite Model"), a private insurance plan with accepted coverage. Patient 10207142 is covered by source 7021001070050 ("Compact Cluster A"), a medical assistance plan with not_accepted coverage. Patient 7119782 is covered by source achat ("Legacy Review"), a county funding arrangement with accepted coverage. Patient gd_acc_160003 is covered by source template_impcode_pagata_10det50 ("Regional Initiative"), a private insurance plan with not_accepted coverage.

## Assessment-Centric Relationships

**View `v_risk_assessment_patient`**

```sql
CREATE VIEW v_risk_assessment_patient AS
SELECT a.id, a.assessment_id, a.assessment_date, a.risk_score, b.patient_id AS patient_patient_id, b.admission_date AS patient_admission_date, b.discharge_date AS patient_discharge_date
FROM risk_assessments a JOIN patients b ON a.patient_id = b.patient_id;
```

| id | assessment_id | assessment_date | risk_score | patient_patient_id | patient_admission_date | patient_discharge_date |
|---|---|---|---|---|---|---|
| 1 | template_ivacode_pagata_20det40ind | 2022-05-10T04:24:00 | 19.70 | 8387541 | 2023-06-22T05:39:00 | 2022-09-02T08:24:00 |
| 2 | 19508914 | 2023-10-21T11:41:00 | 22.40 | 10207142 | 2024-11-06T12:56:00 | 2023-02-13T15:41:00 |
| 3 | 506000 | 2024-03-05T18:58:00 | 25.10 | 7119782 | 2025-04-17T19:13:00 | 2024-07-24T22:58:00 |
| 4 | 1204-0009-M | 2025-08-16T01:15:00 | 27.80 | gd_acc_160003 | 2022-09-01T02:30:00 | 2025-12-08T05:15:00 |

This view presents each risk assessment alongside the patient it evaluates, answering which patient each assessment pertains to. Assessment template_ivacode_pagata_20det40ind evaluates patient 8387541, an adolescent with significant substance and offense history. Assessment 19508914 evaluates patient 10207142, a pregnant woman with minimal substance and offense history. Assessment 506000 evaluates patient 7119782, a veteran with no substance or offense history. Assessment 1204-0009-M evaluates patient gd_acc_160003, an IV drug user with significant substance and offense history.

**View `v_risk_assessment_treatment_program`**

```sql
CREATE VIEW v_risk_assessment_treatment_program AS
SELECT a.id, a.assessment_id, a.assessment_date, a.risk_score, b.id AS program_id, b.program_id AS program_program_id, b.program_name AS program_program_name
FROM risk_assessments a JOIN treatment_programs b ON a.treatment_program_id = b.id;
```

| id | assessment_id | assessment_date | risk_score | program_id | program_program_id | program_program_name |
|---|---|---|---|---|---|---|
| 1 | template_ivacode_pagata_20det40ind | 2022-05-10T04:24:00 | 19.70 | 1 | 103176 | Extended Review |
| 2 | 19508914 | 2023-10-21T11:41:00 | 22.40 | 2 | 2986219 | Pilot Initiative A |
| 3 | 506000 | 2024-03-05T18:58:00 | 25.10 | 3 | 1186079 | Baseline Model |
| 4 | 1204-0009-M | 2025-08-16T01:15:00 | 27.80 | 4 | 1562855 | Distributed Cluster |

This view connects risk assessments to the treatment programs in which the assessed patients are enrolled, answering which program context each assessment operates within. Assessment template_ivacode_pagata_20det40ind operates within program 103176 ("Extended Review"), a high-risk, video-based program. Assessment 19508914 operates within program 2986219 ("Pilot Initiative A"), an inactive, in-office program. Assessment 506000 operates within program 1186079 ("Baseline Model"), an active, video-based program. Assessment 1204-0009-M operates within program 1562855 ("Distributed Cluster"), an inactive, in-office program.

**View `v_risk_assessment_clinical_service`**

```sql
CREATE VIEW v_risk_assessment_clinical_service AS
SELECT a.id, a.assessment_id, a.assessment_date, a.risk_score, b.service_code AS service_service_code, b.service_name AS service_service_name, b.service_type AS service_service_type
FROM risk_assessments a JOIN clinical_services b ON a.service_code = b.service_code;
```

| id | assessment_id | assessment_date | risk_score | service_service_code | service_service_name | service_service_type |
|---|---|---|---|---|---|---|
| 1 | template_ivacode_pagata_20det40ind | 2022-05-10T04:24:00 | 19.70 | 20789856 | Distributed Initiative | individual_therapy |
| 2 | 19508914 | 2023-10-21T11:41:00 | 22.40 | 3990167 | Adaptive Model D | family_therapy |
| 3 | 506000 | 2024-03-05T18:58:00 | 25.10 | 14484998 | Primary Cluster | group_therapy |
| 4 | 1204-0009-M | 2025-08-16T01:15:00 | 27.80 | Total | Composite Review | urine_screening |

This view links risk assessments to the clinical services associated with the assessed patients, answering which service each assessment supports. Assessment template_ivacode_pagata_20det40ind supports service 20789856 ("Distributed Initiative"), an individual therapy intervention. Assessment 19508914 supports service 3990167 ("Adaptive Model D"), a family therapy service. Assessment 506000 supports service 14484998 ("Primary Cluster"), a group therapy service. Assessment 1204-0009-M supports service "Total" ("Composite Review"), a urine screening intervention.

## Facility and Payment Source Perspectives

**View `v_facility_treatment_program`**

```sql
CREATE VIEW v_facility_treatment_program AS
SELECT a.facility_id, a.facility_name, a.street_address, a.city, b.id AS program_id, b.program_id AS program_program_id, b.program_name AS program_program_name
FROM facilities a JOIN treatment_programs b ON a.treatment_program_id = b.id;
```

| facility_id | facility_name | street_address | city | program_id | program_program_id | program_program_name |
|---|---|---|---|---|---|---|
| 1 | Integrated Protocol A | composite-street-15 | integrated-city-34 | 1 | 103176 | Extended Review |
| 2 | Extended Programme | primary-street-16 | seasonal-city-35 | 2 | 2986219 | Pilot Initiative A |
| 3 | Pilot Standard | adaptive-street-17 | regional-city-36 | 3 | 1186079 | Baseline Model |
| 4 | Baseline Framework D | distributed-street-18 | legacy-city-37 | 4 | 1562855 | Distributed Cluster |

This view presents each facility alongside the treatment programs it supports, answering which programs operate from each location. Facility 1 ("Integrated Protocol A") supports program 103176 ("Extended Review"), a high-risk, video-based program. Facility 2 ("Extended Programme") supports program 2986219 ("Pilot Initiative A"), an inactive, in-office program. Facility 3 ("Pilot Standard") supports program 1186079 ("Baseline Model"), an active, video-based program. Facility 4 ("Baseline Framework D") supports program 1562855 ("Distributed Cluster"), an inactive, in-office program.

**View `v_facility_clinical_service`**

```sql
CREATE VIEW v_facility_clinical_service AS
SELECT a.facility_id, a.facility_name, a.street_address, a.city, b.service_code AS service_service_code, b.service_name AS service_service_name, b.service_type AS service_service_type
FROM facilities a JOIN clinical_services b ON a.service_code = b.service_code;
```

| facility_id | facility_name | street_address | city | service_service_code | service_service_name | service_service_type |
|---|---|---|---|---|---|---|
| 1 | Integrated Protocol A | composite-street-15 | integrated-city-34 | 20789856 | Distributed Initiative | individual_therapy |
| 2 | Extended Programme | primary-street-16 | seasonal-city-35 | 3990167 | Adaptive Model D | family_therapy |
| 3 | Pilot Standard | adaptive-street-17 | regional-city-36 | 14484998 | Primary Cluster | group_therapy |
| 4 | Baseline Framework D | distributed-street-18 | legacy-city-37 | Total | Composite Review | urine_screening |

This view links facilities to the clinical services delivered at each location, answering which services are provided at each facility. Facility 1 ("Integrated Protocol A") delivers service 20789856 ("Distributed Initiative"), an individual therapy intervention. Facility 2 ("Extended Programme") delivers service 3990167 ("Adaptive Model D"), a family therapy service. Facility 3 ("Pilot Standard") delivers service 14484998 ("Primary Cluster"), a group therapy service. Facility 4 ("Baseline Framework D") delivers service "Total" ("Composite Review"), a urine screening intervention.

**View `v_payment_source_patient`**

```sql
CREATE VIEW v_payment_source_patient AS
SELECT a.id, a.source_id, a.source_name, a.source_type, b.patient_id AS patient_patient_id, b.admission_date AS patient_admission_date, b.discharge_date AS patient_discharge_date
FROM payment_sources a JOIN patients b ON a.patient_id = b.patient_id;
```

| id | source_id | source_name | source_type | patient_patient_id | patient_admission_date | patient_discharge_date |
|---|---|---|---|---|---|---|
| 1 | 3e9b5c70-8fcd-11eb-924d-9cd76263cbd0 | Composite Model | private_insurance | 8387541 | 2023-06-22T05:39:00 | 2022-09-02T08:24:00 |
| 2 | 7021001070050 | Compact Cluster A | medical_assistance | 10207142 | 2024-11-06T12:56:00 | 2023-02-13T15:41:00 |
| 3 | achat | Legacy Review | county_funding | 7119782 | 2025-04-17T19:13:00 | 2024-07-24T22:58:00 |
| 4 | template_impcode_pagata_10det50 | Regional Initiative | private_insurance | gd_acc_160003 | 2022-09-01T02:30:00 | 2025-12-08T05:15:00 |

This view presents each payment source alongside the patients it covers, answering which patients benefit from each financial arrangement. Source 3e9b5c70-8fcd-11eb-924d-9cd76263cbd0 ("Composite Model") covers patient 8387541, an adolescent classified as high risk. Source 7021001070050 ("Compact Cluster A") covers patient 10207142, a pregnant woman classified as moderate risk. Source achat ("Legacy Review") covers patient 7119782, a veteran classified as low risk. Source template_impcode_pagata_10det50 ("Regional Initiative") covers patient gd_acc_160003, an IV drug user classified as high risk.

**View `v_payment_source_clinical_service`**

```sql
CREATE VIEW v_payment_source_clinical_service AS
SELECT a.id, a.source_id, a.source_name, a.source_type, b.service_code AS service_service_code, b.service_name AS service_service_name, b.service_type AS service_service_type
FROM payment_sources a JOIN clinical_services b ON a.service_code = b.service_code;
```

| id | source_id | source_name | source_type | service_service_code | service_service_name | service_service_type |
|---|---|---|---|---|---|---|
| 1 | 3e9b5c70-8fcd-11eb-924d-9cd76263cbd0 | Composite Model | private_insurance | 20789856 | Distributed Initiative | individual_therapy |
| 2 | 7021001070050 | Compact Cluster A | medical_assistance | 3990167 | Adaptive Model D | family_therapy |
| 3 | achat | Legacy Review | county_funding | 14484998 | Primary Cluster | group_therapy |
| 4 | template_impcode_pagata_10det50 | Regional Initiative | private_insurance | Total | Composite Review | urine_screening |

This view links payment sources to the clinical services their covered patients receive, answering which services are financially supported by each source. Source 3e9b5c70-8fcd-11eb-924d-9cd76263cbd0 ("Composite Model") supports service 20789856 ("Distributed Initiative"), an individual therapy intervention. Source 7021001070050 ("Compact Cluster A") supports service 3990167 ("Adaptive Model D"), a family therapy service. Source achat ("Legacy Review") supports service 14484998 ("Primary Cluster"), a group therapy service. Source template_impcode_pagata_10det50 ("Regional Initiative") supports service "Total" ("Composite Review"), a urine screening intervention.

## Synthesis

The treatment delivery ecosystem described by these records operates as an integrated network of interdependent components. Treatment programs define the organizational structure, clinical services specify the therapeutic interventions, patients represent the individuals receiving care, risk assessments document clinical acuity, facilities provide the physical infrastructure, and payment sources enable financial access. Each entity is connected to the others through explicit relationships that allow administrators to trace a patient's journey from admission through assessment, service delivery, and financial coverage. The data reveals patterns worth noting: high-risk patients such as 8387541 and gd_acc_160003 are enrolled in programs with active and inactive statuses respectively, suggesting that risk level does not strictly determine program availability. Similarly, payment sources with not_accepted status—such as Compact Cluster A and Regional Initiative—indicate coverage gaps that may require administrative attention. The operational relationships captured in these records provide the foundation for monitoring program effectiveness, optimizing resource allocation, and ensuring that patients receive the services they need within the constraints of their financial and clinical circumstances.