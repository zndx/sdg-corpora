## Ontology-Grounded Relational Modelling in Clinical Treatment Services

The clinical treatment services domain captures the full lifecycle of a patient's engagement with a rehabilitation or recovery programme: from initial risk assessment, through service delivery, to discharge and payment reconciliation. At the conceptual level, the ontology distinguishes six entity types—`treatment_programs`, `clinical_services`, `patients`, `risk_assessments`, `facilities`, and `payment_sources`—each materialised as a base table whose columns correspond to the ontology's attributes and whose primary keys serve as the stable record identifiers. Relationships between these entities are expressed through foreign keys that enforce cardinality constraints, and a suite of view definitions materialises the most common join patterns so that analysts can query domain facts without writing joins by hand.

**Table `treatment_programs`**

| id | program_id | program_name | delivery_mode | risk_level | status | accreditation_body | service_code | facility_id | payment_source_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 103176 | Extended Review | video | high | active | integrated-accredit-88 | 20789856 | 1 | 1 |
| 2 | 2986219 | Pilot Initiative A | in-office | moderate | inactive | seasonal-accredit-89 | 3990167 | 2 | 2 |
| 3 | 1186079 | Baseline Model | video | low | active | regional-accredit-90 | 14484998 | 3 | 3 |
| 4 | 1562855 | Distributed Cluster | in-office | high | inactive | legacy-accredit-91 | Total | 4 | 4 |

The `treatment_programs` table is the central hub of the domain model. Each row represents a distinct programme offered by the organisation, identified by a surrogate `id` and a human-readable `program_id` (for example, `103176` for *Extended Review*). The `program_name` column carries the display label, while `delivery_mode` constrains the programme to one of a small set of modalities—`video` or `in-office` in the sample data. The `risk_level` attribute (`high`, `moderate`, `low`) is a categorical classification that propagates downstream to filter which patients may be enrolled. The `status` column (`active` or `inactive`) controls visibility in operational dashboards. Accreditation metadata is captured in `accreditation_body` (e.g., `integrated-accredit-88`) and `service_code` (e.g., `20789856`), while the foreign keys `facility_id` and `payment_source_id` anchor the programme to a physical location and a billing entity respectively. Row 4 illustrates a programme whose `service_code` is the literal string `Total`, a sentinel value that signals an aggregate or summary programme rather than a discrete clinical offering.

**Table `clinical_services`**

| service_code | service_name | service_type | frequency | duration | status | treatment_program_id | patient_id | risk_assessment_id |
|---|---|---|---|---|---|---|---|---|
| 20789856 | Distributed Initiative | individual_therapy | regional-frequenc-36 | 28 | scheduled | 1 | 8387541 | 1 |
| 3990167 | Adaptive Model D | family_therapy | legacy-frequenc-37 | 36 | completed | 2 | 10207142 | 2 |
| 14484998 | Primary Cluster | group_therapy | compact-frequenc-38 | 44 | cancelled | 3 | 7119782 | 3 |
| Total | Composite Review | urine_screening | composite-frequenc-39 | 52 | scheduled | 4 | gd_acc_160003 | 4 |

The `clinical_services` table models the actual therapeutic or screening interventions delivered to patients. Its primary key is `service_code`, which doubles as a domain-level identifier (e.g., `20789856` for *Distributed Initiative*). The `service_name` column provides a human-readable label, while `service_type` classifies the intervention as `individual_therapy`, `family_therapy`, `group_therapy`, or `urine_screening`. The `frequency` column encodes scheduling cadence using coded values such as `regional-frequenc-36`, and `duration` stores an integer representing the length of the service episode. The `status` column (`scheduled`, `completed`, `cancelled`) tracks the lifecycle of each service instance. Three foreign keys—`treatment_program_id`, `patient_id`, and `risk_assessment_id`—tie each service to its parent programme, the enrolled patient, and the assessment that justified its delivery. The sentinel `service_code` value `Total` appears again in row 4, this time paired with the service name *Composite Review* and type `urine_screening`, reinforcing its role as an aggregate placeholder.

**Table `patients`**

| patient_id | admission_date | discharge_date | risk_category | substance_history | offense_history | priority_status | demographic_group | treatment_program_id | service_code | risk_assessment_id | payment_source_id |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 8387541 | 2023-06-22T05:39:00 | 2022-09-02T08:24:00 | high_risk | significant | significant | true | adolescent | 1 | 20789856 | 1 | 1 |
| 10207142 | 2024-11-06T12:56:00 | 2023-02-13T15:41:00 | moderate_risk | minimal | minimal | false | pregnant_woman | 2 | 3990167 | 2 | 2 |
| 7119782 | 2025-04-17T19:13:00 | 2024-07-24T22:58:00 | low_risk | none | none | true | veteran | 3 | 14484998 | 3 | 3 |
| gd_acc_160003 | 2022-09-01T02:30:00 | 2025-12-08T05:15:00 | high_risk | significant | significant | false | iv_drug_user | 4 | Total | 4 | 4 |

The `patients` table stores the demographic and clinical profile of each enrollee. The primary key `patient_id` is a composite of a numeric prefix and an optional suffix (e.g., `8387541` or the alphanumeric `gd_acc_160003`). Admission and discharge dates are stored as ISO-8601 timestamps in `admission_date` and `discharge_date`; notably, the discharge date may precede the admission date in the sample data (row 1 shows `2023-06-22` for admission and `2022-09-02` for discharge), a data-quality artefact that the ontology does not constrain at the schema level. The `risk_category` column (`high_risk`, `moderate_risk`, `low_risk`) mirrors the programme-level `risk_level` but is patient-specific. Substance and offence histories are captured as categorical strings (`significant`, `minimal`, `none`), while `priority_status` is a boolean flag. The `demographic_group` column supports equity reporting with values such as `adolescent`, `pregnant_woman`, `veteran`, and `iv_drug_user`. Four foreign keys—`treatment_program_id`, `service_code`, `risk_assessment_id`, and `payment_source_id`—link the patient to their programme, service, assessment, and payer.

**Table `risk_assessments`**

| id | assessment_id | assessment_date | risk_score | assessment_type | result | assessor_id | patient_id | treatment_program_id | service_code |
|---|---|---|---|---|---|---|---|---|---|
| 1 | template_ivacode_pagata_20det40ind | 2022-05-10T04:24:00 | 19.70 | initial | high_risk | 5f901eb6-8fcd-11eb-924d-9cd76263cbd0 | 8387541 | 1 | 20789856 |
| 2 | 19508914 | 2023-10-21T11:41:00 | 22.40 | follow_up | moderate_risk | 4060646 | 10207142 | 2 | 3990167 |
| 3 | 506000 | 2024-03-05T18:58:00 | 25.10 | discharge | low_risk | eff24a44-8fcb-11eb-924d-9cd76263cbd0 | 7119782 | 3 | 14484998 |
| 4 | 1204-0009-M | 2025-08-16T01:15:00 | 27.80 | initial | high_risk | 2933475 | gd_acc_160003 | 4 | Total |

Risk assessments are the clinical decision records that justify service delivery. The surrogate primary key `id` is an integer, while `assessment_id` carries a domain-level identifier that may be a UUID fragment (e.g., `template_ivacode_pagata_20det40ind`), a plain integer (`19508914`), or an alphanumeric code (`1204-0009-M`). The `assessment_date` is an ISO-8601 timestamp, and `risk_score` is a floating-point value ranging from `19.70` to `27.80` in the sample data. The `assessment_type` column distinguishes `initial`, `follow_up`, and `discharge` assessments, while `result` records the qualitative outcome (`high_risk`, `moderate_risk`, `low_risk`). The `assessor_id` is a UUID identifying the clinician who performed the assessment. Foreign keys `patient_id`, `treatment_program_id`, and `service_code` tie the assessment to the patient, programme, and service respectively.

**Table `facilities`**

| facility_id | facility_name | street_address | city | state | zip_code | bus_accessible | evening_hours | admissions_hours | treatment_program_id | service_code |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | Integrated Protocol A | composite-street-15 | integrated-city-34 | distributed-state-84 | 69434 | true | false | 24/7 | 1 | 20789856 |
| 2 | Extended Programme | primary-street-16 | seasonal-city-35 | baseline-state-85 | 13589 | false | true | business_hours | 2 | 3990167 |
| 3 | Pilot Standard | adaptive-street-17 | regional-city-36 | pilot-state-86 | 9bb5fec0-8fcc-11eb-924d-9cd76263cbd0 | true | false | 24/7 | 3 | 14484998 |
| 4 | Baseline Framework D | distributed-street-18 | legacy-city-37 | extended-state-87 | 1250214 | false | true | business_hours | 4 | Total |

The `facilities` table models the physical locations where services are delivered. The primary key `facility_id` is an integer, and `facility_name` provides the display label (e.g., *Integrated Protocol A*). Address fields include `street_address`, `city`, `state`, and `zip_code`. Accessibility is captured through `bus_accessible` (boolean) and `evening_hours` (boolean), while `admissions_hours` constrains intake to `24/7` or `business_hours`. Two foreign keys—`treatment_program_id` and `service_code`—link each facility to the programmes and services it hosts.

**Table `payment_sources`**

| id | source_id | source_name | source_type | coverage_status | effective_date | patient_id | service_code |
|---|---|---|---|---|---|---|---|
| 1 | 3e9b5c70-8fcd-11eb-924d-9cd76263cbd0 | Composite Model | private_insurance | accepted | 2023-02-14 | 8387541 | 20789856 |
| 2 | 7021001070050 | Compact Cluster A | medical_assistance | not_accepted | 2024-07-25 | 10207142 | 3990167 |
| 3 | achat | Legacy Review | county_funding | accepted | 2025-12-09 | 7119782 | 14484998 |
| 4 | template_impcode_pagata_10det50 | Regional Initiative | private_insurance | not_accepted | 2022-05-20 | gd_acc_160003 | Total |

The `payment_sources` table captures billing and insurance information. The surrogate primary key `id` is an integer, while `source_id` carries a domain-level identifier that may be a UUID (`3e9b5c70-8fcd-11eb-924d-9cd76263cbd0`), a numeric string (`7021001070050`), or a short code (`achat`). The `source_name` column provides a human-readable label (e.g., *Composite Model*), and `source_type` classifies the payer as `private_insurance`, `medical_assistance`, or `county_funding`. The `coverage_status` column (`accepted` or `not_accepted`) indicates whether the payer is currently in-network. The `effective_date` records when the coverage became active. A single foreign key `patient_id` links the payment source to the enrollee.

The foreign-key topology of the schema is highly interconnected. The `treatment_programs` table sits at the centre: its `facility_id` references `facilities.facility_id`, and its `payment_source_id` references `payment_sources.id`. The `clinical_services` table references `treatment_programs.id`, `patients.patient_id`, and `risk_assessments.id`. The `patients` table references `treatment_programs.id`, `clinical_services.service_code`, `risk_assessments.id`, and `payment_sources.id`. The `risk_assessments` table references `patients.patient_id`, `treatment_programs.id`, and `clinical_services.service_code`. The `facilities` table references `treatment_programs.id` and `clinical_services.service_code`. The `payment_sources` table references `patients.patient_id` and `clinical_services.service_code`. This dense web of references means that any single domain fact—such as "which payment source covers which patient for which clinical service at which facility"—requires a multi-table join, which is precisely what the view layer abstracts away.

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

The view `v_treatment_program_clinical_service` joins `treatment_programs` to `clinical_services` on `treatment_program_id`, answering the question: *which clinical services are delivered under which treatment programme?* Row 1 shows that programme `103176` (*Extended Review*) hosts service `20789856` (*Distributed Initiative*), an `individual_therapy` intervention. Row 4 reveals that the aggregate programme `1562855` (*Distributed Cluster*) is linked to the sentinel service `Total` (*Composite Review*), confirming that aggregate programmes can host summary-level services.

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

The view `v_treatment_program_facility` joins `treatment_programs` to `facilities` on `treatment_program_id`, answering: *at which facility is each programme delivered?* Row 1 shows that programme `103176` is hosted at facility `1` (*Integrated Protocol A*), which is bus-accessible and offers 24/7 admissions. Row 2 places programme `2986219` (*Pilot Initiative A*) at facility `2` (*Extended Programme*), which operates only during business hours but offers evening hours.

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

The view `v_treatment_program_payment_source` joins `treatment_programs` to `payment_sources` on `payment_source_id`, answering: *which payment sources are associated with each treatment programme?* Row 1 links programme `103176` to payment source `3e9b5c70-8fcd-11eb-924d-9cd76263cbd0` (*Composite Model*, `private_insurance`, `accepted`). Row 2 links programme `2986219` to source `7021001070050` (*Compact Cluster A*, `medical_assistance`, `not_accepted`), illustrating a programme whose payer is currently out-of-network.

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

The view `v_clinical_service_treatment_program` joins `clinical_services` to `treatment_programs` on `treatment_program_id`, answering: *which treatment programme owns each clinical service?* This is the inverse perspective of `v_treatment_program_clinical_service`. Row 1 shows that service `20789856` (*Distributed Initiative*) belongs to programme `103176` (*Extended Review*). Row 4 shows that the sentinel service `Total` (*Composite Review*) belongs to programme `1562855` (*Distributed Cluster*).

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

The view `v_clinical_service_patient` joins `clinical_services` to `patients` on `patient_id`, answering: *which patient is receiving each clinical service?* Row 1 shows that service `20789856` is delivered to patient `8387541`, an `adolescent` classified as `high_risk`. Row 4 shows that the sentinel service `Total` is delivered to patient `gd_acc_160003`, an `iv_drug_user` also classified as `high_risk`.

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

The view `v_clinical_service_risk_assessment` joins `clinical_services` to `risk_assessments` on `risk_assessment_id`, answering: *which risk assessment justified each clinical service?* Row 1 shows that service `20789856` is justified by assessment `1` with a risk score of `19.70` and result `high_risk`. Row 4 shows that service `Total` is justified by assessment `4` with a risk score of `27.80` and result `high_risk`, the highest score in the dataset.

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

The view `v_patient_treatment_program` joins `patients` to `treatment_programs` on `treatment_program_id`, answering: *which treatment programme is each patient enrolled in?* Row 1 shows that patient `8387541` is enrolled in programme `103176` (*Extended Review*), a `video`-delivered `high`-risk programme. Row 3 shows that patient `7119782` is enrolled in programme `1186079` (*Baseline Model*), a `video`-delivered `low`-risk programme.

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

The view `v_patient_clinical_service` joins `patients` to `clinical_services` on `service_code`, answering: *which clinical service is each patient receiving?* Row 1 shows that patient `8387541` is receiving service `20789856` (*Distributed Initiative*), an `individual_therapy` with duration `28`. Row 4 shows that patient `gd_acc_160003` is receiving service `Total` (*Composite Review*), a `urine_screening` with duration `52`.

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

The view `v_patient_risk_assessment` joins `patients` to `risk_assessments` on `patient_id`, answering: *which risk assessment is associated with each patient?* Row 1 shows that patient `8387541` has assessment `1` (type `initial`, score `19.70`, result `high_risk`). Row 4 shows that patient `gd_acc_160003` has assessment `4` (type `initial`, score `27.80`, result `high_risk`), the most severe assessment in the dataset.

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

The view `v_patient_payment_source` joins `patients` to `payment_sources` on `payment_source_id`, answering: *which payment source covers each patient?* Row 1 shows that patient `8387541` is covered by source `3e9b5c70-8fcd-11eb-924d-9cd76263cbd0` (*Composite Model*, `private_insurance`, `accepted`). Row 2 shows that patient `10207142` is covered by source `7021001070050` (*Compact Cluster A*, `medical_assistance`, `not_accepted`), a payer that is currently not accepted.

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

The view `v_risk_assessment_patient` joins `risk_assessments` to `patients` on `patient_id`, answering: *which patient does each risk assessment belong to?* This is the inverse perspective of `v_patient_risk_assessment`. Row 1 shows that assessment `1` (score `19.70`, type `initial`) belongs to patient `8387541`. Row 3 shows that assessment `3` (score `25.10`, type `discharge`) belongs to patient `7119782`, a `veteran` with `low_risk` classification.

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

The view `v_risk_assessment_treatment_program` joins `risk_assessments` to `treatment_programs` on `treatment_program_id`, answering: *which treatment programme is each risk assessment associated with?* Row 1 shows that assessment `1` is associated with programme `103176` (*Extended Review*). Row 4 shows that assessment `4` is associated with programme `1562855` (*Distributed Cluster*), an `in-office` programme with `high` risk level.

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

The view `v_risk_assessment_clinical_service` joins `risk_assessments` to `clinical_services` on `service_code`, answering: *which clinical service is linked to each risk assessment?* Row 1 shows that assessment `1` is linked to service `20789856` (*Distributed Initiative*). Row 4 shows that assessment `4` is linked to service `Total` (*Composite Review*), confirming that the sentinel service code propagates through the assessment-to-service relationship.

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

The view `v_facility_treatment_program` joins `facilities` to `treatment_programs` on `treatment_program_id`, answering: *which treatment programmes are delivered at each facility?* Row 1 shows that facility `1` (*Integrated Protocol A*) hosts programme `103176` (*Extended Review*). Row 4 shows that facility `4` (*Baseline Framework D*) hosts programme `1562855` (*Distributed Cluster*), an `in-office` programme with `high` risk level.

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

The view `v_facility_clinical_service` joins `facilities` to `clinical_services` on `service_code`, answering: *which clinical services are delivered at each facility?* Row 1 shows that facility `1` (*Integrated Protocol A*) delivers service `20789856` (*Distributed Initiative*). Row 4 shows that facility `4` (*Baseline Framework D*) delivers service `Total` (*Composite Review*), a `urine_screening` with duration `52`.

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

The view `v_payment_source_patient` joins `payment_sources` to `patients` on `patient_id`, answering: *which patient is covered by each payment source?* This is the inverse perspective of `v_patient_payment_source`. Row 1 shows that source `3e9b5c70-8fcd-11eb-924d-9cd76263cbd0` (*Composite Model*) covers patient `8387541`. Row 3 shows that source `achat` (*Legacy Review*, `county_funding`, `accepted`) covers patient `7119782`, a `veteran` with `low_risk` classification.

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

The view `v_payment_source_clinical_service` joins `payment_sources` to `clinical_services` on `service_code`, answering: *which clinical service is billed through each payment source?* Row 1 shows that source `3e9b5c70-8fcd-11eb-924d-9cd76263cbd0` (*Composite Model*) bills for service `20789856` (*Distributed Initiative*). Row 4 shows that source `template_impcode_pagata_10det50` (*Regional Initiative*, `private_insurance`, `not_accepted`) bills for service `Total` (*Composite Review*), a `urine_screening`.

The view layer transforms the normalised base tables into a set of denormalised, query-ready perspectives. Each view answers a specific analytical question by joining exactly two base tables along a single foreign-key relationship, ensuring that the join predicate is always a primary-key-to-foreign-key match. This design avoids the complexity of multi-hop joins in everyday queries while preserving the normalised integrity of the base schema. The sentinel value `Total` that appears in `service_code` columns across multiple tables serves as a consistent marker for aggregate or summary records, allowing analysts to filter or group by this value to isolate summary-level data from discrete clinical records. Together, the six base tables and seventeen views form a complete, ontology-grounded relational model of the clinical treatment services domain, where every column maps to a concept in the domain ontology and every join reconstructs a meaningful domain fact from the normalised tables.