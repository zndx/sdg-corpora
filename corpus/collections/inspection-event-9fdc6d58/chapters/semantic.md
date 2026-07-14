The healthcare regulatory inspection domain captures a multi-layered ecosystem in which clinical services are evaluated against statutory requirements, findings are recorded against specific inspection events, and the human and material resources that deliver care are tracked in their own right. At the heart of the model sit seven base tables that store the core entities, fourteen junction tables that resolve many-to-many associations, and seventeen materialised views that reassemble the normalised facts into domain-meaningful rows. The following chapter walks through the ontology, the relational materialisation, and the view-level reconstructions that turn a set of atomic facts into actionable insight.

## The Core Entities

The inspection lifecycle begins with `inspection_events`, the table that records each regulatory visit to a clinical service. Each row carries a unique `inspection_event_id`, an `inspection_date`, an `inspection_type` (such as `announced`, `unannounced`, or `comprehensive`), and a `regulatory_basis` that identifies the statutory instrument under which the visit was conducted. Five rating columns — `overall_safety_rating`, `overall_effectiveness_rating`, `overall_caring_rating`, `overall_responsive_rating`, and `overall_well_led_rating` — capture the CQC-style domain ratings, each taking values from the set {`safe`, `unsafe`, `effective`, `ineffective`, `caring`, `uncaring`, `responsive`, `unresponsive`, `well-led`, `poorly-led`, `requires_improvement`}. The foreign key `clinical_service_id` anchors the inspection to the service under review. For example, inspection event `100` on `2025-12-03` was an announced visit under `distributed-regulato-78` that awarded every rating `safe` or better, whereas event `101` on `2022-05-14` was an unannounced baseline inspection that returned `unsafe`, `ineffective`, `uncaring`, `unresponsive`, and `poorly-led` across the board.

**Table `inspection_events`**

| inspection_event_id | inspection_date | inspection_type | regulatory_basis | overall_safety_rating | overall_effectiveness_rating | overall_caring_rating | overall_responsive_rating | overall_well_led_rating | clinical_service_id |
|---|---|---|---|---|---|---|---|---|---|
| 100 | 2025-12-03T23:09:00 | announced | distributed-regulato-78 | safe | effective | caring | responsive | well-led | 100 |
| 101 | 2022-05-14T06:26:00 | unannounced | baseline-regulato-79 | unsafe | ineffective | uncaring | unresponsive | poorly-led | 101 |
| 102 | 2023-10-25T13:43:00 | comprehensive | pilot-regulato-80 | requires_improvement | requires_improvement | requires_improvement | requires_improvement | requires_improvement | 102 |
| 103 | 2024-03-09T20:00:00 | announced | extended-regulato-81 | safe | effective | caring | responsive | well-led | 103 |

Clinical services themselves are described in `clinical_services`. The primary key `id` is a surrogate integer, while `service_id` holds a business-level identifier (often a UUID or a numeric code such as `1996925` or `e29bafe2-8fd1-11eb-924d-9cd76263cbd0`). The `service_type` column distinguishes composite, primary, adaptive, and distributed services; `operating_hours` encodes the schedule pattern; `location_address` and `location_postcode` provide the physical site; and `number_of_clinicians` and `number_of_support_staff` capture staffing scale. The `service_status` column tracks whether the service is `active`, `suspended`, or `closed`. Service `100` is an active composite service with five clinicians and thirty-four support staff, while service `102` is a closed adaptive service with thirteen clinicians and forty-two support staff.

**Table `clinical_services`**

| id | service_id | service_type | operating_hours | location_address | location_postcode | number_of_clinicians | number_of_support_staff | service_status |
|---|---|---|---|---|---|---|---|---|
| 100 | 1996925 | composite-service-81 | pilot-operatin-50 | baseline-location-61 | LOC-2383 | 5 | 34 | active |
| 101 | 3990164 | primary-service-82 | extended-operatin-51 | pilot-location-62 | LOC-2387 | 9 | 38 | suspended |
| 102 | 5844258 | adaptive-service-83 | integrated-operatin-52 | extended-location-63 | LOC-2391 | 13 | 42 | closed |
| 103 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | distributed-service-84 | seasonal-operatin-53 | integrated-location-64 | LOC-2395 | 17 | 46 | active |

Regulatory findings are the granular outcomes of inspections. The `regulatory_findings` table stores each finding with a `finding_id`, a `finding_category` (such as `safe`, `effective`, `caring`, or `responsive`), a `finding_status` (`compliant` or `non_compliant`), a free-text `finding_description`, and a `finding_date`. The `prior_finding_id` column creates a temporal chain of findings — for instance, finding `dbea2f30-8fcb-11eb-924d-9cd76263cbd0` references the prior finding `client-focus`, while finding `4793483` references `575200`. The composite foreign key (`clinical_service_id`, `inspection_event_id`, `regulatory_requirement_id`) ties each finding to the service inspected, the event that produced it, and the specific regulatory requirement evaluated.

**Table `regulatory_findings`**

| finding_id | finding_category | finding_status | finding_description | finding_date | prior_finding_id | clinical_service_id | inspection_event_id | regulatory_requirement_id |
|---|---|---|---|---|---|---|---|---|
| dbea2f30-8fcb-11eb-924d-9cd76263cbd0 | safe | compliant | Primary Framework A | 2025-08-26T19:09:00 | client-focus | 100 | 100 | 1000 |
| 4793483 | effective | non_compliant | Composite Protocol | 2022-01-10T02:26:00 | 575200 | 101 | 101 | 1001 |
| 6564384 | caring | requires_improvement | Compact Programme | 2023-06-21T09:43:00 | 9125635 | 102 | 102 | 1002 |
| 8928500 | responsive | compliant | Legacy Standard D | 2024-11-05T16:00:00 | 1186102 | 103 | 103 | 1003 |

Patients are recorded in `patients`. Each row carries a surrogate `id`, a `patient_id` (e.g., `8387541` or `gd_acc_160003`), a `patient_age` (ranging from 27 to 60 in the sample), a `patient_gender` (`male`, `female`, or `other`), a `consultation_frequency` (such as `baseline-consulta-67`), a `feedback_rating` (`positive`, `neutral`, or `negative`), and a `risk_screening_status` (`screened`, `not_screened`, or `at_risk`). The row also stores `clinical_service_id` and `finding_id` as foreign keys linking the patient to the service they receive and the regulatory finding that pertains to them.

**Table `patients`**

| id | patient_id | patient_age | patient_gender | consultation_frequency | feedback_rating | risk_screening_status | clinical_service_id | finding_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 8387541 | 27 | male | baseline-consulta-67 | positive | screened | 100 | dbea2f30-8fcb-11eb-924d-9cd76263cbd0 |
| 2 | 10207142 | 38 | female | pilot-consulta-68 | neutral | not_screened | 101 | 4793483 |
| 3 | 7119782 | 49 | other | extended-consulta-69 | negative | at_risk | 102 | 6564384 |
| 4 | gd_acc_160003 | 60 | male | integrated-consulta-70 | positive | screened | 103 | 8928500 |

Clinicians are the human resource dimension. The `clinicians` table holds a surrogate `id`, a `clinician_id`, a `clinician_name` (e.g., `Adaptive Series`, `Primary Assessment`), a `specialization`, boolean flags `training_completed` and `safeguarding_awareness`, a `supervision_status` (`supervised` or `unsupervised`), and a `clinical_service_id` foreign key. Clinician `100` (name `Adaptive Series`) has not completed training but has safeguarding awareness and is supervised; clinician `101` (name `Primary Assessment`) has completed training, lacks safeguarding awareness, and is unsupervised.

**Table `clinicians`**

| id | clinician_id | clinician_name | specialization | training_completed | safeguarding_awareness | supervision_status | clinical_service_id |
|---|---|---|---|---|---|---|---|
| 100 | 325439 | Adaptive Series | legacy-speciali-13 | false | true | supervised | 100 |
| 101 | 2986233 | Primary Assessment | compact-speciali-14 | true | false | unsupervised | 101 |
| 102 | 168567 | Composite Survey D | composite-speciali-15 | false | true | supervised | 102 |
| 103 | 884366 | Compact Corridor | primary-speciali-16 | true | false | unsupervised | 103 |

Medicines are tracked in `medicines`. Each row has a surrogate `id`, a `medicine_id`, a `medicine_name`, a `medicine_type` (`licensed` or `unlicensed`), a `prescription_status` (`active`, `discontinued`, or `pending`), a `storage_condition`, a `clinical_need_justification`, and a `clinician_id` foreign key. Medicine `100` (name `Adaptive Series`) is licensed and active, stored under `adaptive-storage-29`, while medicine `101` (name `Primary Assessment`) is unlicensed and discontinued.

**Table `medicines`**

| id | medicine_id | medicine_name | medicine_type | prescription_status | storage_condition | clinical_need_justification | clinician_id |
|---|---|---|---|---|---|---|---|
| 100 | 1437596 | Adaptive Series | licensed | active | adaptive-storage-29 | compact-clinical-14 | 100 |
| 101 | 4793466 | Primary Assessment | unlicensed | discontinued | distributed-storage-30 | composite-clinical-15 | 101 |
| 102 | gd_taxc_2121 | Composite Survey D | licensed | pending | baseline-storage-31 | primary-clinical-16 | 102 |
| 103 | 575213 | Compact Corridor | unlicensed | active | pilot-storage-32 | adaptive-clinical-17 | 103 |

Regulatory requirements define the standards against which services are assessed. The `regulatory_requirements` table stores each requirement with a `regulatory_requirement_id`, a `requirement_category`, a `requirement_description`, and a `regulatory_basis` that links back to the inspection event's statutory instrument.

**Table `regulatory_requirements`**

| id | requirement_id | requirement_category | requirement_description | legal_basis | compliance_status | clinical_service_id | finding_id |
|---|---|---|---|---|---|---|---|
| 1000 | 778568 | safeguarding | Extended Model | primary-legal-52 | met | 100 | dbea2f30-8fcb-11eb-924d-9cd76263cbd0 |
| 1001 | lu_tax_code_template_b_VB-EC-0 | infection_control | Pilot Cluster A | adaptive-legal-53 | not_met | 101 | 4793483 |
| 1002 | 99901 | fire_safety | Baseline Review | distributed-legal-54 | in_progress | 102 | 6564384 |
| 1003 | 5917277 | recruitment | Distributed Initiative | baseline-legal-55 | met | 103 | 8928500 |

## Junction Tables and Many-to-Many Relationships

Several domain relationships are inherently many-to-many and are resolved through junction tables. The `events_findings` junction links inspection events to regulatory findings, allowing a single inspection to produce multiple findings and a finding to be referenced across inspections. The `services_clinicians` junction associates clinicians with clinical services, supporting the case where a clinician works across multiple services or a service employs clinicians from different specialisations. The `services_patients` junction connects patients to clinical services, enabling a patient to receive care from multiple services over time.

The `patients_clinicians` junction captures the direct patient-clinician relationship, independent of the service layer. The `clinicians_medicines` junction records which clinicians are authorised to prescribe or handle which medicines, and the `clinicians_patients` junction tracks direct clinician-patient assignments. Finally, the `medicines_patients` junction links patients to the medicines they receive, completing the clinical care triad of clinician–medicine–patient.

**Table `events_findings`**

| inspection_event_id | finding_id |
|---|---|
| 100 | dbea2f30-8fcb-11eb-924d-9cd76263cbd0 |
| 100 | 4793483 |
| 101 | 4793483 |
| 101 | 6564384 |
| 102 | 6564384 |
| 102 | 8928500 |
| 103 | 8928500 |
| 103 | dbea2f30-8fcb-11eb-924d-9cd76263cbd0 |
**Table `services_clinicians`**

| clinical_service_id | clinician_id |
|---|---|
| 100 | 100 |
| 100 | 101 |
| 101 | 101 |
| 101 | 102 |
| 102 | 102 |
| 102 | 103 |
| 103 | 103 |
| 103 | 100 |
**Table `services_patients`**

| clinical_service_id | patient_id |
|---|---|
| 100 | 1 |
| 100 | 2 |
| 101 | 2 |
| 101 | 3 |
| 102 | 3 |
| 102 | 4 |
| 103 | 4 |
| 103 | 1 |
**Table `patients_clinicians`**

| patient_id | clinician_id |
|---|---|
| 1 | 100 |
| 1 | 101 |
| 2 | 101 |
| 2 | 102 |
| 3 | 102 |
| 3 | 103 |
| 4 | 103 |
| 4 | 100 |
**Table `clinicians_medicines`**

| clinician_id | medicine_id |
|---|---|
| 100 | 100 |
| 100 | 101 |
| 101 | 101 |
| 101 | 102 |
| 102 | 102 |
| 102 | 103 |
| 103 | 103 |
| 103 | 100 |
**Table `clinicians_patients`**

| clinician_id | patient_id |
|---|---|
| 100 | 1 |
| 100 | 2 |
| 101 | 2 |
| 101 | 3 |
| 102 | 3 |
| 102 | 4 |
| 103 | 4 |
| 103 | 1 |
**Table `medicines_patients`**

| medicine_id | patient_id |
|---|---|
| 100 | 1 |
| 100 | 2 |
| 101 | 2 |
| 101 | 3 |
| 102 | 3 |
| 102 | 4 |
| 103 | 4 |
| 103 | 1 |

## View-Level Reconstructions

The materialised views reassemble the normalised tables into domain-meaningful rows. Each view answers a specific analytical question by joining the relevant base and junction tables.

The view `v_inspection_event_clinical_service` joins `inspection_events` to `clinical_services` on `clinical_service_id`, producing a single row per inspection that includes both the inspection ratings and the service metadata. Inspection `100` on service `100` (a composite service, `pilot-operatin-50`, with five clinicians) appears with all five overall ratings at `safe`/`effective`/`caring`/`responsive`/`well-led`.

**View `v_inspection_event_clinical_service`**

```sql
CREATE VIEW v_inspection_event_clinical_service AS
SELECT a.inspection_event_id, a.inspection_date, a.inspection_type, a.regulatory_basis, b.id AS service_id, b.service_id AS service_service_id, b.service_type AS service_service_type
FROM inspection_events a JOIN clinical_services b ON a.clinical_service_id = b.id;
```

| inspection_event_id | inspection_date | inspection_type | regulatory_basis | service_id | service_service_id | service_service_type |
|---|---|---|---|---|---|---|
| 100 | 2025-12-03T23:09:00 | announced | distributed-regulato-78 | 100 | 1996925 | composite-service-81 |
| 101 | 2022-05-14T06:26:00 | unannounced | baseline-regulato-79 | 101 | 3990164 | primary-service-82 |
| 102 | 2023-10-25T13:43:00 | comprehensive | pilot-regulato-80 | 102 | 5844258 | adaptive-service-83 |
| 103 | 2024-03-09T20:00:00 | announced | extended-regulato-81 | 103 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | distributed-service-84 |

The view `v_inspection_event_regulatory_finding_detail` joins `inspection_events` to `regulatory_findings` on `inspection_event_id`, surfacing each finding alongside its parent inspection. Finding `dbea2f30-8fcb-11eb-924d-9cd76263cbd0` (category `safe`, status `compliant`, description `Primary Framework A`) is paired with inspection `100` (announced, `distributed-regulato-78`).

**View `v_inspection_event_regulatory_finding_detail`**

```sql
CREATE VIEW v_inspection_event_regulatory_finding_detail AS
SELECT a.inspection_event_id, a.inspection_date, a.inspection_type, b.finding_id AS finding_finding_id, b.finding_category AS finding_finding_category, b.finding_status AS finding_finding_status
FROM inspection_events a
  JOIN events_findings j ON j.inspection_event_id = a.inspection_event_id
  JOIN regulatory_findings b ON b.finding_id = j.finding_id;
```

| inspection_event_id | inspection_date | inspection_type | finding_finding_id | finding_finding_category | finding_finding_status |
|---|---|---|---|---|---|
| 100 | 2025-12-03T23:09:00 | announced | dbea2f30-8fcb-11eb-924d-9cd76263cbd0 | safe | compliant |
| 100 | 2025-12-03T23:09:00 | announced | 4793483 | effective | non_compliant |
| 101 | 2022-05-14T06:26:00 | unannounced | 4793483 | effective | non_compliant |
| 101 | 2022-05-14T06:26:00 | unannounced | 6564384 | caring | requires_improvement |
| 102 | 2023-10-25T13:43:00 | comprehensive | 6564384 | caring | requires_improvement |
| 102 | 2023-10-25T13:43:00 | comprehensive | 8928500 | responsive | compliant |
| 103 | 2024-03-09T20:00:00 | announced | 8928500 | responsive | compliant |
| 103 | 2024-03-09T20:00:00 | announced | dbea2f30-8fcb-11eb-924d-9cd76263cbd0 | safe | compliant |

The view `v_clinical_service_clinician_detail` joins `clinical_services` to `clinicians` on `clinical_service_id`, revealing which clinicians work at which service. Clinician `100` (name `Adaptive Series`, specialisation `legacy-speciali-13`, supervised, training not completed) is associated with service `100` (composite, active, five clinicians, thirty-four support staff).

**View `v_clinical_service_clinician_detail`**

```sql
CREATE VIEW v_clinical_service_clinician_detail AS
SELECT a.id, a.service_id, a.service_type, b.id AS clinician_id, b.clinician_id AS clinician_clinician_id, b.clinician_name AS clinician_clinician_name
FROM clinical_services a
  JOIN services_clinicians j ON j.clinical_service_id = a.id
  JOIN clinicians b ON b.id = j.clinician_id;
```

| id | service_id | service_type | clinician_id | clinician_clinician_id | clinician_clinician_name |
|---|---|---|---|---|---|
| 100 | 1996925 | composite-service-81 | 100 | 325439 | Adaptive Series |
| 100 | 1996925 | composite-service-81 | 101 | 2986233 | Primary Assessment |
| 101 | 3990164 | primary-service-82 | 101 | 2986233 | Primary Assessment |
| 101 | 3990164 | primary-service-82 | 102 | 168567 | Composite Survey D |
| 102 | 5844258 | adaptive-service-83 | 102 | 168567 | Composite Survey D |
| 102 | 5844258 | adaptive-service-83 | 103 | 884366 | Compact Corridor |
| 103 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | distributed-service-84 | 103 | 884366 | Compact Corridor |
| 103 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | distributed-service-84 | 100 | 325439 | Adaptive Series |

The view `v_clinical_service_patient_detail` joins `clinical_services` to `patients` on `clinical_service_id`, showing which patients receive care at which service. Patient `1` (age 27, male, feedback `positive`, risk `screened`) is linked to service `100` (composite, active).

**View `v_clinical_service_patient_detail`**

```sql
CREATE VIEW v_clinical_service_patient_detail AS
SELECT a.id, a.service_id, a.service_type, b.id AS patient_id, b.patient_id AS patient_patient_id, b.patient_age AS patient_patient_age
FROM clinical_services a
  JOIN services_patients j ON j.clinical_service_id = a.id
  JOIN patients b ON b.id = j.patient_id;
```

| id | service_id | service_type | patient_id | patient_patient_id | patient_patient_age |
|---|---|---|---|---|---|
| 100 | 1996925 | composite-service-81 | 1 | 8387541 | 27 |
| 100 | 1996925 | composite-service-81 | 2 | 10207142 | 38 |
| 101 | 3990164 | primary-service-82 | 2 | 10207142 | 38 |
| 101 | 3990164 | primary-service-82 | 3 | 7119782 | 49 |
| 102 | 5844258 | adaptive-service-83 | 3 | 7119782 | 49 |
| 102 | 5844258 | adaptive-service-83 | 4 | gd_acc_160003 | 60 |
| 103 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | distributed-service-84 | 4 | gd_acc_160003 | 60 |
| 103 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | distributed-service-84 | 1 | 8387541 | 27 |

The view `v_regulatory_finding_clinical_service` joins `regulatory_findings` to `clinical_services` on `clinical_service_id`, connecting each finding to the service it pertains to. Finding `4793483` (category `effective`, status `non_compliant`, description `Composite Protocol`) is associated with service `101` (primary, suspended, nine clinicians, thirty-eight support staff).

**View `v_regulatory_finding_clinical_service`**

```sql
CREATE VIEW v_regulatory_finding_clinical_service AS
SELECT a.finding_id, a.finding_category, a.finding_status, a.finding_description, b.id AS service_id, b.service_id AS service_service_id, b.service_type AS service_service_type
FROM regulatory_findings a JOIN clinical_services b ON a.clinical_service_id = b.id;
```

| finding_id | finding_category | finding_status | finding_description | service_id | service_service_id | service_service_type |
|---|---|---|---|---|---|---|
| dbea2f30-8fcb-11eb-924d-9cd76263cbd0 | safe | compliant | Primary Framework A | 100 | 1996925 | composite-service-81 |
| 4793483 | effective | non_compliant | Composite Protocol | 101 | 3990164 | primary-service-82 |
| 6564384 | caring | requires_improvement | Compact Programme | 102 | 5844258 | adaptive-service-83 |
| 8928500 | responsive | compliant | Legacy Standard D | 103 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | distributed-service-84 |

The view `v_regulatory_finding_inspection_event` joins `regulatory_findings` to `inspection_events` on `inspection_event_id`, tracing each finding back to the inspection that produced it. Finding `6564384` (category `caring`, status `requires_improvement`, description `Compact Programme`) originates from inspection `102` (comprehensive, `pilot-regulato-80`, all ratings `requires_improvement`).

**View `v_regulatory_finding_inspection_event`**

```sql
CREATE VIEW v_regulatory_finding_inspection_event AS
SELECT a.finding_id, a.finding_category, a.finding_status, a.finding_description, b.inspection_event_id AS event_inspection_event_id, b.inspection_date AS event_inspection_date, b.inspection_type AS event_inspection_type
FROM regulatory_findings a JOIN inspection_events b ON a.inspection_event_id = b.inspection_event_id;
```

| finding_id | finding_category | finding_status | finding_description | event_inspection_event_id | event_inspection_date | event_inspection_type |
|---|---|---|---|---|---|---|
| dbea2f30-8fcb-11eb-924d-9cd76263cbd0 | safe | compliant | Primary Framework A | 100 | 2025-12-03T23:09:00 | announced |
| 4793483 | effective | non_compliant | Composite Protocol | 101 | 2022-05-14T06:26:00 | unannounced |
| 6564384 | caring | requires_improvement | Compact Programme | 102 | 2023-10-25T13:43:00 | comprehensive |
| 8928500 | responsive | compliant | Legacy Standard D | 103 | 2024-03-09T20:00:00 | announced |

The view `v_regulatory_finding_regulatory_requirement` joins `regulatory_findings` to `regulatory_requirements` on `regulatory_requirement_id`, linking each finding to the specific requirement evaluated. Finding `8928500` (category `responsive`, status `compliant`, description `Legacy Standard D`) is tied to requirement `1003`.

**View `v_regulatory_finding_regulatory_requirement`**

```sql
CREATE VIEW v_regulatory_finding_regulatory_requirement AS
SELECT a.finding_id, a.finding_category, a.finding_status, a.finding_description, b.id AS requirement_id, b.requirement_id AS requirement_requirement_id, b.requirement_category AS requirement_requirement_category
FROM regulatory_findings a JOIN regulatory_requirements b ON a.regulatory_requirement_id = b.id;
```

| finding_id | finding_category | finding_status | finding_description | requirement_id | requirement_requirement_id | requirement_requirement_category |
|---|---|---|---|---|---|---|
| dbea2f30-8fcb-11eb-924d-9cd76263cbd0 | safe | compliant | Primary Framework A | 1000 | 778568 | safeguarding |
| 4793483 | effective | non_compliant | Composite Protocol | 1001 | lu_tax_code_template_b_VB-EC-0 | infection_control |
| 6564384 | caring | requires_improvement | Compact Programme | 1002 | 99901 | fire_safety |
| 8928500 | responsive | compliant | Legacy Standard D | 1003 | 5917277 | recruitment |

The view `v_patient_clinical_service` joins `patients` to `clinical_services` on `clinical_service_id`, providing a patient-to-service mapping. Patient `3` (age 49, gender `other`, feedback `negative`, risk `at_risk`) is linked to service `102` (adaptive, closed, thirteen clinicians, forty-two support staff).

**View `v_patient_clinical_service`**

```sql
CREATE VIEW v_patient_clinical_service AS
SELECT a.id, a.patient_id, a.patient_age, a.patient_gender, b.id AS service_id, b.service_id AS service_service_id, b.service_type AS service_service_type
FROM patients a JOIN clinical_services b ON a.clinical_service_id = b.id;
```

| id | patient_id | patient_age | patient_gender | service_id | service_service_id | service_service_type |
|---|---|---|---|---|---|---|
| 1 | 8387541 | 27 | male | 100 | 1996925 | composite-service-81 |
| 2 | 10207142 | 38 | female | 101 | 3990164 | primary-service-82 |
| 3 | 7119782 | 49 | other | 102 | 5844258 | adaptive-service-83 |
| 4 | gd_acc_160003 | 60 | male | 103 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | distributed-service-84 |

The view `v_patient_clinician_detail` joins `patients` to `clinicians` through the `patients_clinicians` junction, revealing which clinicians are directly associated with which patients. Patient `4` (age 60, male, feedback `positive`, risk `screened`) is linked to clinician `103` (name `Compact Corridor`, specialisation `primary-speciali-16`, supervised, training completed).

**View `v_patient_clinician_detail`**

```sql
CREATE VIEW v_patient_clinician_detail AS
SELECT a.id, a.patient_id, a.patient_age, b.id AS clinician_id, b.clinician_id AS clinician_clinician_id, b.clinician_name AS clinician_clinician_name
FROM patients a
  JOIN patients_clinicians j ON j.patient_id = a.id
  JOIN clinicians b ON b.id = j.clinician_id;
```

| id | patient_id | patient_age | clinician_id | clinician_clinician_id | clinician_clinician_name |
|---|---|---|---|---|---|
| 1 | 8387541 | 27 | 100 | 325439 | Adaptive Series |
| 1 | 8387541 | 27 | 101 | 2986233 | Primary Assessment |
| 2 | 10207142 | 38 | 101 | 2986233 | Primary Assessment |
| 2 | 10207142 | 38 | 102 | 168567 | Composite Survey D |
| 3 | 7119782 | 49 | 102 | 168567 | Composite Survey D |
| 3 | 7119782 | 49 | 103 | 884366 | Compact Corridor |
| 4 | gd_acc_160003 | 60 | 103 | 884366 | Compact Corridor |
| 4 | gd_acc_160003 | 60 | 100 | 325439 | Adaptive Series |

The view `v_patient_regulatory_finding` joins `patients` to `regulatory_findings` on `finding_id`, connecting patients to the findings that pertain to their service. Patient `2` (age 38, female, feedback `neutral`, risk `not_screened`) is linked to finding `4793483` (category `effective`, status `non_compliant`, description `Composite Protocol`).

**View `v_patient_regulatory_finding`**

```sql
CREATE VIEW v_patient_regulatory_finding AS
SELECT a.id, a.patient_id, a.patient_age, a.patient_gender, b.finding_id AS finding_finding_id, b.finding_category AS finding_finding_category, b.finding_status AS finding_finding_status
FROM patients a JOIN regulatory_findings b ON a.finding_id = b.finding_id;
```

| id | patient_id | patient_age | patient_gender | finding_finding_id | finding_finding_category | finding_finding_status |
|---|---|---|---|---|---|---|
| 1 | 8387541 | 27 | male | dbea2f30-8fcb-11eb-924d-9cd76263cbd0 | safe | compliant |
| 2 | 10207142 | 38 | female | 4793483 | effective | non_compliant |
| 3 | 7119782 | 49 | other | 6564384 | caring | requires_improvement |
| 4 | gd_acc_160003 | 60 | male | 8928500 | responsive | compliant |

The view `v_clinician_clinical_service` joins `clinicians` to `clinical_services` on `clinical_service_id`, showing which clinicians are assigned to which services. Clinician `102` (name `Composite Survey D`, specialisation `composite-speciali-15`, supervised, training not completed) is associated with service `102` (adaptive, closed, thirteen clinicians, forty-two support staff).

**View `v_clinician_clinical_service`**

```sql
CREATE VIEW v_clinician_clinical_service AS
SELECT a.id, a.clinician_id, a.clinician_name, a.specialization, b.id AS service_id, b.service_id AS service_service_id, b.service_type AS service_service_type
FROM clinicians a JOIN clinical_services b ON a.clinical_service_id = b.id;
```

| id | clinician_id | clinician_name | specialization | service_id | service_service_id | service_service_type |
|---|---|---|---|---|---|---|
| 100 | 325439 | Adaptive Series | legacy-speciali-13 | 100 | 1996925 | composite-service-81 |
| 101 | 2986233 | Primary Assessment | compact-speciali-14 | 101 | 3990164 | primary-service-82 |
| 102 | 168567 | Composite Survey D | composite-speciali-15 | 102 | 5844258 | adaptive-service-83 |
| 103 | 884366 | Compact Corridor | primary-speciali-16 | 103 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | distributed-service-84 |

The view `v_clinician_medicine_detail` joins `clinicians` to `medicines` on `clinician_id`, revealing which medicines each clinician is authorised to handle. Clinician `101` (name `Primary Assessment`, specialisation `compact-speciali-14`, unsupervised, training completed) is linked to medicine `101` (name `Primary Assessment`, unlicensed, discontinued, stored under `distributed-storage-30`).

**View `v_clinician_medicine_detail`**

```sql
CREATE VIEW v_clinician_medicine_detail AS
SELECT a.id, a.clinician_id, a.clinician_name, b.id AS medicine_id, b.medicine_id AS medicine_medicine_id, b.medicine_name AS medicine_medicine_name
FROM clinicians a
  JOIN clinicians_medicines j ON j.clinician_id = a.id
  JOIN medicines b ON b.id = j.medicine_id;
```

| id | clinician_id | clinician_name | medicine_id | medicine_medicine_id | medicine_medicine_name |
|---|---|---|---|---|---|
| 100 | 325439 | Adaptive Series | 100 | 1437596 | Adaptive Series |
| 100 | 325439 | Adaptive Series | 101 | 4793466 | Primary Assessment |
| 101 | 2986233 | Primary Assessment | 101 | 4793466 | Primary Assessment |
| 101 | 2986233 | Primary Assessment | 102 | gd_taxc_2121 | Composite Survey D |
| 102 | 168567 | Composite Survey D | 102 | gd_taxc_2121 | Composite Survey D |
| 102 | 168567 | Composite Survey D | 103 | 575213 | Compact Corridor |
| 103 | 884366 | Compact Corridor | 103 | 575213 | Compact Corridor |
| 103 | 884366 | Compact Corridor | 100 | 1437596 | Adaptive Series |

The view `v_clinician_patient_detail` joins `clinicians` to `patients` through the `clinicians_patients` junction, showing direct clinician-to-patient assignments. Clinician `103` (name `Compact Corridor`, specialisation `primary-speciali-16`, supervised, training completed) is linked to patient `4` (age 60, male, feedback `positive`, risk `screened`).

**View `v_clinician_patient_detail`**

```sql
CREATE VIEW v_clinician_patient_detail AS
SELECT a.id, a.clinician_id, a.clinician_name, b.id AS patient_id, b.patient_id AS patient_patient_id, b.patient_age AS patient_patient_age
FROM clinicians a
  JOIN clinicians_patients j ON j.clinician_id = a.id
  JOIN patients b ON b.id = j.patient_id;
```

| id | clinician_id | clinician_name | patient_id | patient_patient_id | patient_patient_age |
|---|---|---|---|---|---|
| 100 | 325439 | Adaptive Series | 1 | 8387541 | 27 |
| 100 | 325439 | Adaptive Series | 2 | 10207142 | 38 |
| 101 | 2986233 | Primary Assessment | 2 | 10207142 | 38 |
| 101 | 2986233 | Primary Assessment | 3 | 7119782 | 49 |
| 102 | 168567 | Composite Survey D | 3 | 7119782 | 49 |
| 102 | 168567 | Composite Survey D | 4 | gd_acc_160003 | 60 |
| 103 | 884366 | Compact Corridor | 4 | gd_acc_160003 | 60 |
| 103 | 884366 | Compact Corridor | 1 | 8387541 | 27 |

The view `v_medicine_patient_detail` joins `medicines` to `patients` through the `medicines_patients` junction, revealing which patients receive which medicines. Medicine `102` (name `Composite Survey D`, licensed, pending, stored under `baseline-storage-31`) is linked to patient `3` (age 49, gender `other`, feedback `negative`, risk `at_risk`).

**View `v_medicine_patient_detail`**

```sql
CREATE VIEW v_medicine_patient_detail AS
SELECT a.id, a.medicine_id, a.medicine_name, b.id AS patient_id, b.patient_id AS patient_patient_id, b.patient_age AS patient_patient_age
FROM medicines a
  JOIN medicines_patients j ON j.medicine_id = a.id
  JOIN patients b ON b.id = j.patient_id;
```

| id | medicine_id | medicine_name | patient_id | patient_patient_id | patient_patient_age |
|---|---|---|---|---|---|
| 100 | 1437596 | Adaptive Series | 1 | 8387541 | 27 |
| 100 | 1437596 | Adaptive Series | 2 | 10207142 | 38 |
| 101 | 4793466 | Primary Assessment | 2 | 10207142 | 38 |
| 101 | 4793466 | Primary Assessment | 3 | 7119782 | 49 |
| 102 | gd_taxc_2121 | Composite Survey D | 3 | 7119782 | 49 |
| 102 | gd_taxc_2121 | Composite Survey D | 4 | gd_acc_160003 | 60 |
| 103 | 575213 | Compact Corridor | 4 | gd_acc_160003 | 60 |
| 103 | 575213 | Compact Corridor | 1 | 8387541 | 27 |

The view `v_medicine_clinician` joins `medicines` to `clinicians` on `clinician_id`, showing which clinicians are authorised to prescribe or handle which medicines. Medicine `103` (name `Compact Corridor`, unlicensed, active, stored under `pilot-storage-32`) is linked to clinician `103` (name `Compact Corridor`, specialisation `primary-speciali-16`, supervised, training completed).

**View `v_medicine_clinician`**

```sql
CREATE VIEW v_medicine_clinician AS
SELECT a.id, a.medicine_id, a.medicine_name, a.medicine_type, b.id AS clinician_id, b.clinician_id AS clinician_clinician_id, b.clinician_name AS clinician_clinician_name
FROM medicines a JOIN clinicians b ON a.clinician_id = b.id;
```

| id | medicine_id | medicine_name | medicine_type | clinician_id | clinician_clinician_id | clinician_clinician_name |
|---|---|---|---|---|---|---|
| 100 | 1437596 | Adaptive Series | licensed | 100 | 325439 | Adaptive Series |
| 101 | 4793466 | Primary Assessment | unlicensed | 101 | 2986233 | Primary Assessment |
| 102 | gd_taxc_2121 | Composite Survey D | licensed | 102 | 168567 | Composite Survey D |
| 103 | 575213 | Compact Corridor | unlicensed | 103 | 884366 | Compact Corridor |

The view `v_regulatory_requirement_clinical_service` joins `regulatory_requirements` to `clinical_services` through `regulatory_findings`, connecting each regulatory requirement to the services it governs. Requirement `1000` is linked to service `100` (composite, active, five clinicians, thirty-four support staff).

**View `v_regulatory_requirement_clinical_service`**

```sql
CREATE VIEW v_regulatory_requirement_clinical_service AS
SELECT a.id, a.requirement_id, a.requirement_category, a.requirement_description, b.id AS service_id, b.service_id AS service_service_id, b.service_type AS service_service_type
FROM regulatory_requirements a JOIN clinical_services b ON a.clinical_service_id = b.id;
```

| id | requirement_id | requirement_category | requirement_description | service_id | service_service_id | service_service_type |
|---|---|---|---|---|---|---|
| 1000 | 778568 | safeguarding | Extended Model | 100 | 1996925 | composite-service-81 |
| 1001 | lu_tax_code_template_b_VB-EC-0 | infection_control | Pilot Cluster A | 101 | 3990164 | primary-service-82 |
| 1002 | 99901 | fire_safety | Baseline Review | 102 | 5844258 | adaptive-service-83 |
| 1003 | 5917277 | recruitment | Distributed Initiative | 103 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | distributed-service-84 |

The view `v_regulatory_requirement_regulatory_finding` joins `regulatory_requirements` to `regulatory_findings` on `regulatory_requirement_id`, showing which findings were produced against which requirements. Requirement `1001` is linked to finding `4793483` (category `effective`, status `non_compliant`, description `Composite Protocol`).

**View `v_regulatory_requirement_regulatory_finding`**

```sql
CREATE VIEW v_regulatory_requirement_regulatory_finding AS
SELECT a.id, a.requirement_id, a.requirement_category, a.requirement_description, b.finding_id AS finding_finding_id, b.finding_category AS finding_finding_category, b.finding_status AS finding_finding_status
FROM regulatory_requirements a JOIN regulatory_findings b ON a.finding_id = b.finding_id;
```

| id | requirement_id | requirement_category | requirement_description | finding_finding_id | finding_finding_category | finding_finding_status |
|---|---|---|---|---|---|---|
| 1000 | 778568 | safeguarding | Extended Model | dbea2f30-8fcb-11eb-924d-9cd76263cbd0 | safe | compliant |
| 1001 | lu_tax_code_template_b_VB-EC-0 | infection_control | Pilot Cluster A | 4793483 | effective | non_compliant |
| 1002 | 99901 | fire_safety | Baseline Review | 6564384 | caring | requires_improvement |
| 1003 | 5917277 | recruitment | Distributed Initiative | 8928500 | responsive | compliant |

## Synthesis

The domain model separates concerns along three axes: the inspection process (captured in `inspection_events` and `regulatory_findings`), the service delivery infrastructure (captured in `clinical_services`, `clinicians`, and `medicines`), and the patient population (captured in `patients`). Junction tables resolve the many-to-many relationships that arise when clinicians work across services, patients receive care from multiple services, and medicines are prescribed by multiple clinicians. The seventeen materialised views reassemble these normalised facts into domain-meaningful rows — each view answering a specific analytical question by joining the relevant tables. For instance, `v_inspection_event_regulatory_finding_detail` answers "what findings were produced by each inspection?" while `v_clinician_medicine_detail` answers "which medicines is each clinician authorised to handle?" The schema thus preserves the full granularity of the ontology while providing efficient, pre-joined access patterns for the most common analytical queries.