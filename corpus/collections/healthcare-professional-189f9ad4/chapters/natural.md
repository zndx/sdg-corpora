# Healthcare Record Management and Disclosure Tracking

Healthcare delivery depends on precise coordination among professionals, patients, support persons, and the facilities that house care operations. This domain captures the full lifecycle of patient-professional assignments, the social networks surrounding each patient, and the sensitive disclosure events that connect all parties. The records span five core tables and twelve analytical views, each answering a distinct operational question about who provides care, who receives it, where care occurs, and how information flows between stakeholders.

## Core Entities

The foundation of the system rests on five base tables that store the raw records of people, organizations, and events.

**Table `persons`**

| person_id | full_name | relationship_to_patient | is_trusted | patient_id |
|---|---|---|---|---|
| George Bernard Shaw | Theodore Mcgrath | adaptive-relation-71 | false | 100 |
| Maria Rodriguez | Account Name | distributed-relation-72 | true | 101 |
| Sarah Villanueva | Saipan International Airport | baseline-relation-73 | false | 102 |
| Susan Wagner | Norma Fisher | pilot-relation-74 | true | 103 |

The `persons` table anchors the identity layer. Each row represents an individual connected to a patient, carrying a `full_name`, a `relationship_to_patient` classification, a trust designation via `is_trusted`, and a `patient_id` foreign key linking back to the patient record. The relationship classifications—`adaptive-relation-71`, `distributed-relation-72`, `baseline-relation-73`, and `pilot-relation-74`—categorize the nature of each person's connection to the patient. Trust status is binary: George Bernard Shaw and Sarah Villanueva are marked as untrusted, while Maria Rodriguez and Susan Wagner carry the trusted flag.

**Table `patients`**

| patient_id | date_of_birth | diagnosis_date | status | is_minor | healthcare_professional_id | person_id | has_family_member_person_id | has_close_friend_person_id |
|---|---|---|---|---|---|---|---|---|
| 100 | 2025-04-02 | 2023-10-26 | regional-status-84 | true | 1000 | George Bernard Shaw | George Bernard Shaw | George Bernard Shaw |
| 101 | 2022-09-13 | 2024-03-10 | legacy-status-85 | false | 1001 | Maria Rodriguez | Maria Rodriguez | Maria Rodriguez |
| 102 | 2023-02-24 | 2025-08-21 | compact-status-86 | true | 1002 | Sarah Villanueva | Sarah Villanueva | Sarah Villanueva |
| 103 | 2024-07-08 | 2022-01-05 | composite-status-87 | false | 1003 | Susan Wagner | Susan Wagner | Susan Wagner |

The `patients` table holds the clinical enrollment records. Each patient carries a `date_of_birth`, a `diagnosis_date` marking when their condition was formally recognized, a `status` indicating their current care phase, and an `is_minor` flag distinguishing adult from pediatric enrollment. The status values—`regional-status-84`, `legacy-status-85`, `compact-status-86`, and `composite-status-87`—reflect different stages or categories of care engagement. Each patient is assigned to a `healthcare_professional_id` and linked to a `person_id` for their primary contact, with optional `has_family_member_person_id` and `has_close_friend_person_id` fields capturing additional support network members.

**Table `healthcare_professionals`**

| id | professional_id | full_name | specialty | clinic_id | is_primary_care | patient_id | works_at_clinic_id |
|---|---|---|---|---|---|---|---|
| 1000 | 5082965 | Theodore Mcgrath | extended-specialt-21 | gd_taxc_1122 | true | 100 | 100 |
| 1001 | 2618560 | Account Name | integrated-specialt-22 | 2106713 | false | 101 | 101 |
| 1002 | 3355767 | Saipan International Airport | seasonal-specialt-23 | 506004 | true | 102 | 102 |
| 1003 | 3355784 | Norma Fisher | regional-specialt-24 | 8928507 | false | 103 | 103 |

The `healthcare_professionals` table records the providers who deliver care. Each professional has a unique `id`, a `professional_id` for external system identification, a `full_name`, a `specialty` classification, and a `clinic_id` indicating their home facility. The `is_primary_care` flag distinguishes general practitioners from specialists. The specialty values—`extended-specialt-21`, `integrated-specialt-22`, `seasonal-specialt-23`, and `regional-specialt-24`—denote different practice domains. Notably, the `patient_id` and `works_at_clinic_id` columns create direct associations between providers and the patients or clinics they serve.

**Table `clinics`**

| clinic_id | clinic_name | location | has_workshops | healthcare_professional_id |
|---|---|---|---|---|
| 100 | Distributed Standard | extended-location-99 | false | 1000 |
| 101 | Adaptive Framework D | integrated-location-100 | true | 1001 |
| 102 | Primary Protocol | seasonal-location-101 | false | 1002 |
| 103 | Composite Programme | regional-location-102 | true | 1003 |

The `clinics` table catalogs the facilities where care is delivered. Each clinic has a `clinic_id`, a `clinic_name`, a `location` descriptor, a `has_workshops` flag indicating whether the facility offers educational programming, and a `healthcare_professional_id` linking to the primary provider. The clinic names—`Distributed Standard`, `Adaptive Framework D`, `Primary Protocol`, and `Composite Programme`—along with their location codes, provide geographic and organizational context for care delivery.

**Table `disclosure_events`**

| id | event_id | disclosure_date | method | is_successful | is_nerve_wracking | patient_id | person_id | healthcare_professional_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 2002007020060 | 2025-08-02T19:33:00 | seasonal-method-77 | true | false | 100 | George Bernard Shaw | 1000 |
| 2 | 168535 | 2022-01-13T02:50:00 | regional-method-78 | false | true | 101 | Maria Rodriguez | 1001 |
| 3 | ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 | 2023-06-24T09:07:00 | legacy-method-79 | true | false | 102 | Sarah Villanueva | 1002 |
| 4 | 1186089 | 2024-11-08T16:24:00 | compact-method-80 | false | true | 103 | Susan Wagner | 1003 |

The `disclosure_events` table captures the sensitive interactions through which information is shared among stakeholders. Each event has a unique `id`, an `event_id` for external tracking, a `disclosure_date` with full timestamp precision, a `method` classification, and two boolean flags: `is_successful` indicating whether the disclosure was completed, and `is_nerve_wracking` capturing the emotional difficulty of the interaction. Each event links to a `patient_id`, a `person_id`, and a `healthcare_professional_id`, forming a triad that identifies who disclosed information, to whom, and under whose professional supervision. The method values—`seasonal-method-77`, `regional-method-78`, `legacy-method-79`, and `compact-method-80`—describe the channel or protocol used for the disclosure.

## Professional-Patient Assignments

The relationship between providers and their assigned patients is captured through direct joins that pair professional records with patient enrollment data.

**View `healthcare_professional_patient_view`**

```sql
CREATE VIEW healthcare_professional_patient_view AS
SELECT a.id, a.professional_id, a.full_name, a.specialty, b.patient_id AS patient_patient_id, b.date_of_birth AS patient_date_of_birth, b.diagnosis_date AS patient_diagnosis_date
FROM healthcare_professionals a JOIN patients b ON a.patient_id = b.patient_id;
```

| id | professional_id | full_name | specialty | patient_patient_id | patient_date_of_birth | patient_diagnosis_date |
|---|---|---|---|---|---|---|
| 1000 | 5082965 | Theodore Mcgrath | extended-specialt-21 | 100 | 2025-04-02 | 2023-10-26 |
| 1001 | 2618560 | Account Name | integrated-specialt-22 | 101 | 2022-09-13 | 2024-03-10 |
| 1002 | 3355767 | Saipan International Airport | seasonal-specialt-23 | 102 | 2023-02-24 | 2025-08-21 |
| 1003 | 3355784 | Norma Fisher | regional-specialt-24 | 103 | 2024-07-08 | 2022-01-05 |

This view joins `healthcare_professionals` with `patients` on the `patient_id` column, producing a consolidated record that pairs each provider with their assigned patient's demographic and clinical information. The view answers the question: which patient is assigned to which professional, and what are that patient's birth and diagnosis dates?

Consider the first row: professional Theodore Mcgrath (id 1000, professional_id 5082965) with specialty `extended-specialt-21` is assigned to patient 100, who was born on 2025-04-02 and received a diagnosis on 2023-10-26. The second row shows Account Name (id 1001, professional_id 2618560) with specialty `integrated-specialt-22` assigned to patient 101, born 2022-09-13 and diagnosed 2024-03-10. The third row pairs Saipan International Airport (id 1002, professional_id 3355767) with specialty `seasonal-specialt-23` to patient 102, born 2023-02-24 and diagnosed 2025-08-21. The final row links Norma Fisher (id 1003, professional_id 3355784) with specialty `regional-specialt-24` to patient 103, born 2024-07-08 and diagnosed 2022-01-05. This view enables administrators to quickly assess patient-professional pairings and review the temporal relationship between patient birth and diagnosis dates.

## Clinic Affiliations

Understanding which professionals operate at which facilities is essential for resource allocation and care coordination.

**View `healthcare_professional_clinic_view`**

```sql
CREATE VIEW healthcare_professional_clinic_view AS
SELECT a.id, a.professional_id, a.full_name, a.specialty, b.clinic_id AS clinic_clinic_id, b.clinic_name AS clinic_clinic_name, b.location AS clinic_location
FROM healthcare_professionals a JOIN clinics b ON a.works_at_clinic_id = b.clinic_id;
```

| id | professional_id | full_name | specialty | clinic_clinic_id | clinic_clinic_name | clinic_location |
|---|---|---|---|---|---|---|
| 1000 | 5082965 | Theodore Mcgrath | extended-specialt-21 | 100 | Distributed Standard | extended-location-99 |
| 1001 | 2618560 | Account Name | integrated-specialt-22 | 101 | Adaptive Framework D | integrated-location-100 |
| 1002 | 3355767 | Saipan International Airport | seasonal-specialt-23 | 102 | Primary Protocol | seasonal-location-101 |
| 1003 | 3355784 | Norma Fisher | regional-specialt-24 | 103 | Composite Programme | regional-location-102 |

This view joins `healthcare_professionals` with `clinics` to produce a roster of professionals and their affiliated facilities. It answers: which clinic does each professional work at, and what are the clinic's characteristics?

The joined data shows Theodore Mcgrath operating at Distributed Standard, Account Name at Adaptive Framework D, Saipan International Airport at Primary Protocol, and Norma Fisher at Composite Programme. The `has_workshops` flag indicates whether each facility offers educational programming—Adaptive Framework D and Composite Programme both have workshops available, while Distributed Standard and Primary Protocol do not. This view supports operational planning by revealing the distribution of professional expertise across facilities and identifying which clinics provide supplementary educational resources.

## Patient-Caregiver Networks

Patients do not exist in isolation; each is connected to a healthcare professional and, through the disclosure system, to support persons.

**View `patient_healthcare_professional_view`**

```sql
CREATE VIEW patient_healthcare_professional_view AS
SELECT a.patient_id, a.date_of_birth, a.diagnosis_date, a.status, b.id AS professional_id, b.professional_id AS professional_professional_id, b.full_name AS professional_full_name
FROM patients a JOIN healthcare_professionals b ON a.healthcare_professional_id = b.id;
```

| patient_id | date_of_birth | diagnosis_date | status | professional_id | professional_professional_id | professional_full_name |
|---|---|---|---|---|---|---|
| 100 | 2025-04-02 | 2023-10-26 | regional-status-84 | 1000 | 5082965 | Theodore Mcgrath |
| 101 | 2022-09-13 | 2024-03-10 | legacy-status-85 | 1001 | 2618560 | Account Name |
| 102 | 2023-02-24 | 2025-08-21 | compact-status-86 | 1002 | 3355767 | Saipan International Airport |
| 103 | 2024-07-08 | 2022-01-05 | composite-status-87 | 1003 | 3355784 | Norma Fisher |

This view joins `patients` with `healthcare_professionals` to reveal the professional assigned to each patient. It answers: which professional is responsible for each patient's care?

The data shows patient 100 assigned to professional id 1000 (Theodore Mcgrath), patient 101 to professional id 1001 (Account Name), patient 102 to professional id 1002 (Saipan International Airport), and patient 103 to professional id 1003 (Norma Fisher). Each patient-professional pair forms the primary care relationship that anchors the entire disclosure and support network.

**View `patient_person_view`**

```sql
CREATE VIEW patient_person_view AS
SELECT a.patient_id, a.date_of_birth, a.diagnosis_date, a.status, b.person_id AS person_person_id, b.full_name AS person_full_name, b.relationship_to_patient AS person_relationship_to_patient
FROM patients a JOIN persons b ON a.person_id = b.person_id;
```

| patient_id | date_of_birth | diagnosis_date | status | person_person_id | person_full_name | person_relationship_to_patient |
|---|---|---|---|---|---|---|
| 100 | 2025-04-02 | 2023-10-26 | regional-status-84 | George Bernard Shaw | Theodore Mcgrath | adaptive-relation-71 |
| 101 | 2022-09-13 | 2024-03-10 | legacy-status-85 | Maria Rodriguez | Account Name | distributed-relation-72 |
| 102 | 2023-02-24 | 2025-08-21 | compact-status-86 | Sarah Villanueva | Saipan International Airport | baseline-relation-73 |
| 103 | 2024-07-08 | 2022-01-05 | composite-status-87 | Susan Wagner | Norma Fisher | pilot-relation-74 |

This view joins `patients` with `persons` to surface the support persons associated with each patient. It answers: which individuals are linked to each patient as family members or close friends?

The joined records show George Bernard Shaw linked to patient 100, Maria Rodriguez to patient 101, Sarah Villanueva to patient 102, and Susan Wagner to patient 103. These person-patient linkages form the social support layer that the disclosure system references when tracking information sharing events.

## Person-Patient Linkages

The reverse perspective—starting from the person and tracing to their associated patient—provides a different operational lens.

**View `person_patient_view`**

```sql
CREATE VIEW person_patient_view AS
SELECT a.person_id, a.full_name, a.relationship_to_patient, a.is_trusted, b.patient_id AS patient_patient_id, b.date_of_birth AS patient_date_of_birth, b.diagnosis_date AS patient_diagnosis_date
FROM persons a JOIN patients b ON a.patient_id = b.patient_id;
```

| person_id | full_name | relationship_to_patient | is_trusted | patient_patient_id | patient_date_of_birth | patient_diagnosis_date |
|---|---|---|---|---|---|---|
| George Bernard Shaw | Theodore Mcgrath | adaptive-relation-71 | false | 100 | 2025-04-02 | 2023-10-26 |
| Maria Rodriguez | Account Name | distributed-relation-72 | true | 101 | 2022-09-13 | 2024-03-10 |
| Sarah Villanueva | Saipan International Airport | baseline-relation-73 | false | 102 | 2023-02-24 | 2025-08-21 |
| Susan Wagner | Norma Fisher | pilot-relation-74 | true | 103 | 2024-07-08 | 2022-01-05 |

This view joins `persons` with `patients` to answer: which patient is each support person connected to? The data mirrors the forward relationship: George Bernard Shaw connects to patient 100, Maria Rodriguez to patient 101, Sarah Villanueva to patient 102, and Susan Wagner to patient 103. This bidirectional mapping ensures that queries can efficiently traverse the relationship in either direction without requiring separate lookup tables.

## Disclosure Event Tracking

The disclosure system is the most complex component, tracking information-sharing events that connect patients, support persons, and healthcare professionals simultaneously.

**View `disclosure_event_patient_view`**

```sql
CREATE VIEW disclosure_event_patient_view AS
SELECT a.id, a.event_id, a.disclosure_date, a.method, b.patient_id AS patient_patient_id, b.date_of_birth AS patient_date_of_birth, b.diagnosis_date AS patient_diagnosis_date
FROM disclosure_events a JOIN patients b ON a.patient_id = b.patient_id;
```

| id | event_id | disclosure_date | method | patient_patient_id | patient_date_of_birth | patient_diagnosis_date |
|---|---|---|---|---|---|---|
| 1 | 2002007020060 | 2025-08-02T19:33:00 | seasonal-method-77 | 100 | 2025-04-02 | 2023-10-26 |
| 2 | 168535 | 2022-01-13T02:50:00 | regional-method-78 | 101 | 2022-09-13 | 2024-03-10 |
| 3 | ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 | 2023-06-24T09:07:00 | legacy-method-79 | 102 | 2023-02-24 | 2025-08-21 |
| 4 | 1186089 | 2024-11-08T16:24:00 | compact-method-80 | 103 | 2024-07-08 | 2022-01-05 |

This view joins `disclosure_events` with `patients` to answer: which patient was involved in each disclosure event, and what are their demographic details?

The joined data reveals that event id 1 (event_id 2002007020060) occurred on 2025-08-02 using `seasonal-method-77`, was successful, was not nerve-wracking, and involved patient 100. Event id 2 (event_id 168535) occurred on 2022-01-13 using `regional-method-78`, was unsuccessful, was nerve-wracking, and involved patient 101. Event id 3 (event_id ab8e1d18-8fcd-11eb-924d-9cd76263cbd0) occurred on 2023-06-24 using `legacy-method-79`, was successful, was not nerve-wracking, and involved patient 102. Event id 4 (event_id 1186089) occurred on 2024-11-08 using `compact-method-80`, was unsuccessful, was nerve-wracking, and involved patient 103. The pattern shows alternating success and difficulty levels across events, suggesting varying levels of challenge in the disclosure process.

**View `disclosure_event_person_view`**

```sql
CREATE VIEW disclosure_event_person_view AS
SELECT a.id, a.event_id, a.disclosure_date, a.method, b.person_id AS person_person_id, b.full_name AS person_full_name, b.relationship_to_patient AS person_relationship_to_patient
FROM disclosure_events a JOIN persons b ON a.person_id = b.person_id;
```

| id | event_id | disclosure_date | method | person_person_id | person_full_name | person_relationship_to_patient |
|---|---|---|---|---|---|---|
| 1 | 2002007020060 | 2025-08-02T19:33:00 | seasonal-method-77 | George Bernard Shaw | Theodore Mcgrath | adaptive-relation-71 |
| 2 | 168535 | 2022-01-13T02:50:00 | regional-method-78 | Maria Rodriguez | Account Name | distributed-relation-72 |
| 3 | ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 | 2023-06-24T09:07:00 | legacy-method-79 | Sarah Villanueva | Saipan International Airport | baseline-relation-73 |
| 4 | 1186089 | 2024-11-08T16:24:00 | compact-method-80 | Susan Wagner | Norma Fisher | pilot-relation-74 |

This view joins `disclosure_events` with `persons` to answer: which support person was involved in each disclosure event?

The data shows that George Bernard Shaw participated in event id 1, Maria Rodriguez in event id 2, Sarah Villanueva in event id 3, and Susan Wagner in event id 4. Each person appears in exactly one disclosure event, and the event's method, success status, and difficulty level are preserved alongside the person's identity and relationship classification. This view enables auditors to trace which support persons were involved in which types of disclosures and under what conditions.

**View `disclosure_event_healthcare_professional_view`**

```sql
CREATE VIEW disclosure_event_healthcare_professional_view AS
SELECT a.id, a.event_id, a.disclosure_date, a.method, b.id AS professional_id, b.professional_id AS professional_professional_id, b.full_name AS professional_full_name
FROM disclosure_events a JOIN healthcare_professionals b ON a.healthcare_professional_id = b.id;
```

| id | event_id | disclosure_date | method | professional_id | professional_professional_id | professional_full_name |
|---|---|---|---|---|---|---|
| 1 | 2002007020060 | 2025-08-02T19:33:00 | seasonal-method-77 | 1000 | 5082965 | Theodore Mcgrath |
| 2 | 168535 | 2022-01-13T02:50:00 | regional-method-78 | 1001 | 2618560 | Account Name |
| 3 | ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 | 2023-06-24T09:07:00 | legacy-method-79 | 1002 | 3355767 | Saipan International Airport |
| 4 | 1186089 | 2024-11-08T16:24:00 | compact-method-80 | 1003 | 3355784 | Norma Fisher |

This view joins `disclosure_events` with `healthcare_professionals` to answer: which professional supervised or participated in each disclosure event?

The joined records show that professional id 1000 (Theodore Mcgrath) supervised event id 1, professional id 1001 (Account Name) supervised event id 2, professional id 1002 (Saipan International Airport) supervised event id 3, and professional id 1003 (Norma Fisher) supervised event id 4. Each professional is associated with exactly one disclosure event, and the event's timestamp, method, and outcome flags are available alongside the professional's name and specialty. This view supports quality assurance by linking disclosure outcomes to the professionals responsible for overseeing them.

## Clinic-Professional Rosters

The final view provides a facility-centric perspective on professional assignments.

**View `clinic_healthcare_professional_view`**

```sql
CREATE VIEW clinic_healthcare_professional_view AS
SELECT a.clinic_id, a.clinic_name, a.location, a.has_workshops, b.id AS professional_id, b.professional_id AS professional_professional_id, b.full_name AS professional_full_name
FROM clinics a JOIN healthcare_professionals b ON a.healthcare_professional_id = b.id;
```

| clinic_id | clinic_name | location | has_workshops | professional_id | professional_professional_id | professional_full_name |
|---|---|---|---|---|---|---|
| 100 | Distributed Standard | extended-location-99 | false | 1000 | 5082965 | Theodore Mcgrath |
| 101 | Adaptive Framework D | integrated-location-100 | true | 1001 | 2618560 | Account Name |
| 102 | Primary Protocol | seasonal-location-101 | false | 1002 | 3355767 | Saipan International Airport |
| 103 | Composite Programme | regional-location-102 | true | 1003 | 3355784 | Norma Fisher |

This view joins `clinics` with `healthcare_professionals` to answer: which professional is associated with each clinic, and what are the clinic's operational characteristics?

The data shows that Distributed Standard is associated with professional id 1000 (Theodore Mcgrath), Adaptive Framework D with professional id 1001 (Account Name), Primary Protocol with professional id 1002 (Saipan International Airport), and Composite Programme with professional id 1003 (Norma Fisher). The `has_workshops` flag from the clinic table is preserved, indicating that Adaptive Framework D and Composite Programme offer educational programming while Distributed Standard and Primary Protocol do not. This view supports facility-level reporting and resource planning by presenting the professional-clinic relationship alongside operational attributes.

## Synthesis

The five base tables and twelve views together form a comprehensive record of healthcare delivery operations. The `persons` and `patients` tables establish the identity and clinical enrollment layers. The `healthcare_professionals` and `clinics` tables capture the provider and facility infrastructure. The `disclosure_events` table records the sensitive interactions that connect all parties. The twelve views provide analytical lenses that answer specific operational questions: which professional serves which patient, which clinic hosts which professional, which person supports which patient, and which stakeholders participated in each disclosure event. Together, these records enable administrators, clinicians, and auditors to trace care relationships, assess disclosure outcomes, and plan resource allocation across the healthcare network.