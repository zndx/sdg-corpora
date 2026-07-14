# Healthcare Delivery Ecosystem: Organizational Structure, Service Provision, and Patient Records

Modern healthcare delivery operates as a layered ecosystem in which regulatory bodies oversee medical practices, which in turn employ professionals, offer clinical services, and maintain patient registries. Medications flow through this system under professional supervision, creating an interconnected web of accountability and care. Understanding how these entities relate requires examining both the static records that define each organization and the dynamic relationships that bind them together. The following reference documents the core entities, their attributes, and the relational structures that enable comprehensive querying across the healthcare landscape.

**Table `medical_practices`**

| medical_practice_id | practice_name | registration_number | address_line | post_code | telephone_number | website_u_r_l | last_updated_date | health_authority_id |
|---|---|---|---|---|---|---|---|---|
| 1 | Seasonal Survey | REG-2136 | baseline-address-79 | 1450652 | TEL-2173 | https://www.nature.com/articles/nphoton.2017.123 | 2025-12-20 | 1 |
| 2 | Integrated Corridor | REG-2142 | pilot-address-80 | 6564374 | TEL-2177 | https://code.google.com/p/adwhirl/ | 2022-05-04 | 2 |
| 3 | Extended Series D | REG-2148 | extended-address-81 | 727070 | TEL-2181 | http://twitter.com/annhealthcare/status/423315405965635584 | 2023-10-15 | 3 |
| 4 | Pilot Assessment | REG-2154 | integrated-address-82 | 727043 | TEL-2185 | https://en.wiktionary.org/wiki/elephant | 2024-03-26 | 4 |

Medical practices form the operational backbone of the system. Each practice carries a unique identifier, a registered name, and a registration number such as REG-2136 for Seasonal Survey or REG-2154 for Pilot Assessment. Physical presence is captured through address lines and post codes, while contactability is maintained via telephone numbers and web addresses. The last updated date tracks when records were last modified, ensuring data freshness. Crucially, every practice is assigned to a health authority through the health_authority_id column, establishing the regulatory chain of oversight. Seasonal Survey falls under authority 1, Integrated Corridor under authority 2, Extended Series D under authority 3, and Pilot Assessment under authority 4.

**Table `healthcare_professionals`**

| healthcare_professional_id | professional_name | job_title | employment_status | qualifications | medical_practice_id |
|---|---|---|---|---|---|
| 1 | Integrated Protocol A | Primary Initiative A | permanent | baseline-qualific-43 | 1 |
| 2 | Extended Programme | Composite Model | locum | pilot-qualific-44 | 2 |
| 3 | Pilot Standard | Compact Cluster | contractor | extended-qualific-45 | 3 |
| 4 | Baseline Framework D | Legacy Review D | permanent | integrated-qualific-46 | 4 |

Healthcare professionals are the human agents delivering care within practices. Each professional record includes a name, a job title, an employment status indicating whether they are permanent, locum, or contractor, and their qualifications. The medical_practice_id column anchors each professional to their employing organization. Integrated Protocol A holds the title Primary Initiative A with permanent status at practice 1, while Extended Programme works as a Composite Model on a locum basis at practice 2. Pilot Standard operates as a Compact Cluster contractor at practice 3, and Baseline Framework D serves as Legacy Review D with permanent employment at practice 4.

**Table `clinical_services`**

| clinical_service_id | service_name | service_category | requires_appointment | is_urgent_care | medical_practice_id |
|---|---|---|---|---|---|
| 1 | Distributed Initiative | diagnostic | false | true | 1 |
| 2 | Adaptive Model D | therapeutic | true | false | 2 |
| 3 | Primary Cluster | preventive | false | true | 3 |
| 4 | Composite Review | administrative | true | false | 4 |

Clinical services represent the specific categories of care that practices offer. Each service has a name, a category such as diagnostic, therapeutic, preventive, or administrative, and boolean flags indicating whether an appointment is required and whether the service constitutes urgent care. The Distributed Initiative at practice 1 is a diagnostic service that does not require an appointment but qualifies as urgent care. The Adaptive Model D at practice 2 is a therapeutic service requiring appointments and classified as non-urgent. The Primary Cluster at practice 3 provides preventive care without appointments but is designated as urgent. The Composite Review at practice 4 handles administrative functions with appointments and non-urgent classification.

**Table `patients`**

| id | patient_i_d | full_name | date_of_birth | registration_status | has_online_access | medical_practice_id | medication_id |
|---|---|---|---|---|---|---|---|
| 1000 | PAT-2559 | Theodore Mcgrath | 2025-04-02 | active | false | 1 | 1 |
| 1001 | PAT-2563 | Account Name | 2022-09-13 | inactive | true | 2 | 2 |
| 1002 | PAT-2567 | Saipan International Airport | 2023-02-24 | pending | false | 3 | 3 |
| 1003 | PAT-2571 | Norma Fisher | 2024-07-08 | active | true | 4 | 4 |

Patient records capture the individuals receiving care. Each patient has a unique patient identifier, full name, date of birth, and a registration status that can be active, inactive, or pending. The has_online_access flag indicates whether the patient can use digital services. The medical_practice_id links the patient to their home practice, while the medication_id associates them with a specific medication record. Theodore Mcgrath (PAT-2559) is an active patient at practice 1 without online access, registered with birth date 2025-04-02. Account Name (PAT-2563) is inactive at practice 2 but has online access. Saipan International Airport (PAT-2567) has pending status at practice 3 without online access. Norma Fisher (PAT-2571) is active at practice 4 with online access.

**Table `medications`**

| medication_id | medication_name | dosage_form | prescription_status | transmission_date | healthcare_professional_id |
|---|---|---|---|---|---|
| 1 | Pilot Programme | primary-dosage-40 | pending | 2023-06-14T05:27:00 | 1 |
| 2 | Baseline Standard | adaptive-dosage-41 | transmitted | 2024-11-25T12:44:00 | 2 |
| 3 | Distributed Framework A | distributed-dosage-42 | collected | 2025-04-09T19:01:00 | 3 |
| 4 | Adaptive Protocol | baseline-dosage-43 | cancelled | 2022-09-20T02:18:00 | 4 |

Medications track pharmaceutical products dispensed within the system. Each medication has a name, a dosage form, a prescription status indicating its current state (pending, transmitted, collected, or cancelled), and a transmission date recording when the prescription was sent. The healthcare_professional_id links the medication to the prescribing professional. Pilot Programme uses primary-dosage-40 with pending status, transmitted on 2023-06-14 by professional 1. Baseline Standard uses adaptive-dosage-41 with transmitted status, sent on 2024-11-25 by professional 2. Distributed Framework A uses distributed-dosage-42 with collected status, transmitted on 2025-04-09 by professional 3. Adaptive Protocol uses baseline-dosage-43 with cancelled status, transmitted on 2022-09-20 by professional 4.

**Table `health_authorities`**

| health_authority_id | authority_name | contact_phone | contact_email | region_covered | clinical_service_id |
|---|---|---|---|---|---|
| 1 | Sean Green | Joe Tsai | Christopher Wilson | pilot-region-68 | 1 |
| 2 | Elizabeth Woods | Stephanie Collins | Charles Larsen | extended-region-69 | 2 |
| 3 | Kimberly Smith | Tasha Rodriguez | Mary Alvarez | integrated-region-70 | 3 |
| 4 | Kimberly Smith | Walter Pratt | April Snyder | seasonal-region-71 | 4 |

Health authorities serve as the regulatory and administrative bodies overseeing medical practices. Each authority record includes contact names, phone numbers, email addresses, and the region covered. The clinical_service_id column links each authority to a clinical service, creating a direct oversight relationship. Sean Green's authority covers pilot-region-68 and oversees clinical service 1. Elizabeth Woods' authority covers extended-region-69 and oversees clinical service 2. Kimberly Smith appears in two authority records: one covering integrated-region-70 overseeing service 3, and another covering seasonal-region-71 overseeing service 4.

The relational structure between entities is managed through junction tables that capture many-to-many and one-to-many relationships.

**Table `practices_professionals`**

| medical_practice_id | healthcare_professional_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

**Table `practices_patients`**

| medical_practice_id | patient_id |
|---|---|
| 1 | 1000 |
| 1 | 1001 |
| 2 | 1001 |
| 2 | 1002 |
| 3 | 1002 |
| 3 | 1003 |
| 4 | 1003 |
| 4 | 1000 |

**Table `professionals_services`**

| healthcare_professional_id | clinical_service_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

**Table `services_professionals`**

| clinical_service_id | healthcare_professional_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

**Table `services_patients`**

| clinical_service_id | patient_id |
|---|---|
| 1 | 1000 |
| 1 | 1001 |
| 2 | 1001 |
| 2 | 1002 |
| 3 | 1002 |
| 3 | 1003 |
| 4 | 1003 |
| 4 | 1000 |

**Table `patients_services`**

| patient_id | clinical_service_id |
|---|---|
| 1000 | 1 |
| 1000 | 2 |
| 1001 | 2 |
| 1001 | 3 |
| 1002 | 3 |
| 1002 | 4 |
| 1003 | 4 |
| 1003 | 1 |

**Table `medications_patients`**

| medication_id | patient_id |
|---|---|
| 1 | 1000 |
| 1 | 1001 |
| 2 | 1001 |
| 2 | 1002 |
| 3 | 1002 |
| 3 | 1003 |
| 4 | 1003 |
| 4 | 1000 |

**Table `authorities_practices`**

| health_authority_id | medical_practice_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

These junction tables enable flexible querying across the healthcare ecosystem. The practices_professionals table links medical practices to their employed professionals, while practices_patients connects practices to their registered patients. The professionals_services and services_professionals tables capture which professionals deliver which services, and the services_patients and patients_services tables record patient engagement with specific clinical services. The medications_patients table ties patients to their prescribed medications, and authorities_practices establishes which health authority regulates which medical practice.

## Practice-Level Analytical Views

The first set of views provides comprehensive profiles of medical practices by joining their associated entities.

**View `v_medical_practice_healthcare_professional_detail`**

```sql
CREATE VIEW v_medical_practice_healthcare_professional_detail AS
SELECT a.medical_practice_id, a.practice_name, a.registration_number, b.healthcare_professional_id AS professional_healthcare_professional_id, b.professional_name AS professional_professional_name, b.job_title AS professional_job_title
FROM medical_practices a
  JOIN practices_professionals j ON j.medical_practice_id = a.medical_practice_id
  JOIN healthcare_professionals b ON b.healthcare_professional_id = j.healthcare_professional_id;
```

| medical_practice_id | practice_name | registration_number | professional_healthcare_professional_id | professional_professional_name | professional_job_title |
|---|---|---|---|---|---|
| 1 | Seasonal Survey | REG-2136 | 1 | Integrated Protocol A | Primary Initiative A |
| 1 | Seasonal Survey | REG-2136 | 2 | Extended Programme | Composite Model |
| 2 | Integrated Corridor | REG-2142 | 2 | Extended Programme | Composite Model |
| 2 | Integrated Corridor | REG-2142 | 3 | Pilot Standard | Compact Cluster |
| 3 | Extended Series D | REG-2148 | 3 | Pilot Standard | Compact Cluster |
| 3 | Extended Series D | REG-2148 | 4 | Baseline Framework D | Legacy Review D |
| 4 | Pilot Assessment | REG-2154 | 4 | Baseline Framework D | Legacy Review D |
| 4 | Pilot Assessment | REG-2154 | 1 | Integrated Protocol A | Primary Initiative A |

This view answers the question: which professionals work at which practices, and what are their employment characteristics? It joins medical_practices with healthcare_professionals on medical_practice_id. A row from this view would show Seasonal Survey (REG-2136) with Integrated Protocol A holding the title Primary Initiative A and permanent employment status, confirming that practice 1 employs professional 1 directly.

**View `v_medical_practice_patient_detail`**

```sql
CREATE VIEW v_medical_practice_patient_detail AS
SELECT a.medical_practice_id, a.practice_name, a.registration_number, b.id AS patient_id, b.patient_i_d AS patient_patient_i_d, b.full_name AS patient_full_name
FROM medical_practices a
  JOIN practices_patients j ON j.medical_practice_id = a.medical_practice_id
  JOIN patients b ON b.id = j.patient_id;
```

| medical_practice_id | practice_name | registration_number | patient_id | patient_patient_i_d | patient_full_name |
|---|---|---|---|---|---|
| 1 | Seasonal Survey | REG-2136 | 1000 | PAT-2559 | Theodore Mcgrath |
| 1 | Seasonal Survey | REG-2136 | 1001 | PAT-2563 | Account Name |
| 2 | Integrated Corridor | REG-2142 | 1001 | PAT-2563 | Account Name |
| 2 | Integrated Corridor | REG-2142 | 1002 | PAT-2567 | Saipan International Airport |
| 3 | Extended Series D | REG-2148 | 1002 | PAT-2567 | Saipan International Airport |
| 3 | Extended Series D | REG-2148 | 1003 | PAT-2571 | Norma Fisher |
| 4 | Pilot Assessment | REG-2154 | 1003 | PAT-2571 | Norma Fisher |
| 4 | Pilot Assessment | REG-2154 | 1000 | PAT-2559 | Theodore Mcgrath |

This view answers: which patients are registered at which practices, and what are their registration and access characteristics? It joins medical_practices with patients on medical_practice_id. A representative row would show Integrated Corridor (REG-2142) with patient Account Name (PAT-2563) having inactive registration status and online access enabled, indicating that practice 2 carries this patient in its registry despite the patient's inactive status.

**View `v_medical_practice_health_authority`**

```sql
CREATE VIEW v_medical_practice_health_authority AS
SELECT a.medical_practice_id, a.practice_name, a.registration_number, a.address_line, b.health_authority_id AS authority_health_authority_id, b.authority_name AS authority_authority_name, b.contact_phone AS authority_contact_phone
FROM medical_practices a JOIN health_authorities b ON a.health_authority_id = b.health_authority_id;
```

| medical_practice_id | practice_name | registration_number | address_line | authority_health_authority_id | authority_authority_name | authority_contact_phone |
|---|---|---|---|---|---|---|
| 1 | Seasonal Survey | REG-2136 | baseline-address-79 | 1 | Sean Green | Joe Tsai |
| 2 | Integrated Corridor | REG-2142 | pilot-address-80 | 2 | Elizabeth Woods | Stephanie Collins |
| 3 | Extended Series D | REG-2148 | extended-address-81 | 3 | Kimberly Smith | Tasha Rodriguez |
| 4 | Pilot Assessment | REG-2154 | integrated-address-82 | 4 | Kimberly Smith | Walter Pratt |

This view answers: which health authority regulates which medical practice, and what are the authority's contact details? It joins medical_practices with health_authorities on health_authority_id. A row from this view would show Extended Series D (REG-2148) under Kimberly Smith's authority covering integrated-region-70, with contact email Mary Alvarez, establishing the regulatory chain for practice 3.

## Professional-Centric Views

These views pivot the analysis around healthcare professionals, revealing their practice affiliations and service responsibilities.

**View `v_healthcare_professional_medical_practice`**

```sql
CREATE VIEW v_healthcare_professional_medical_practice AS
SELECT a.healthcare_professional_id, a.professional_name, a.job_title, a.employment_status, b.medical_practice_id AS practice_medical_practice_id, b.practice_name AS practice_practice_name, b.registration_number AS practice_registration_number
FROM healthcare_professionals a JOIN medical_practices b ON a.medical_practice_id = b.medical_practice_id;
```

| healthcare_professional_id | professional_name | job_title | employment_status | practice_medical_practice_id | practice_practice_name | practice_registration_number |
|---|---|---|---|---|---|---|
| 1 | Integrated Protocol A | Primary Initiative A | permanent | 1 | Seasonal Survey | REG-2136 |
| 2 | Extended Programme | Composite Model | locum | 2 | Integrated Corridor | REG-2142 |
| 3 | Pilot Standard | Compact Cluster | contractor | 3 | Extended Series D | REG-2148 |
| 4 | Baseline Framework D | Legacy Review D | permanent | 4 | Pilot Assessment | REG-2154 |

This view answers: which practice employs each professional, and what is the practice's contact information? It joins healthcare_professionals with medical_practices on medical_practice_id. A row would show Baseline Framework D (Legacy Review D, permanent) employed at Pilot Assessment (REG-2154) with post code 727043, providing the professional's organizational context.

**View `v_healthcare_professional_clinical_service_detail`**

```sql
CREATE VIEW v_healthcare_professional_clinical_service_detail AS
SELECT a.healthcare_professional_id, a.professional_name, a.job_title, b.clinical_service_id AS service_clinical_service_id, b.service_name AS service_service_name, b.service_category AS service_service_category
FROM healthcare_professionals a
  JOIN professionals_services j ON j.healthcare_professional_id = a.healthcare_professional_id
  JOIN clinical_services b ON b.clinical_service_id = j.clinical_service_id;
```

| healthcare_professional_id | professional_name | job_title | service_clinical_service_id | service_service_name | service_service_category |
|---|---|---|---|---|---|
| 1 | Integrated Protocol A | Primary Initiative A | 1 | Distributed Initiative | diagnostic |
| 1 | Integrated Protocol A | Primary Initiative A | 2 | Adaptive Model D | therapeutic |
| 2 | Extended Programme | Composite Model | 2 | Adaptive Model D | therapeutic |
| 2 | Extended Programme | Composite Model | 3 | Primary Cluster | preventive |
| 3 | Pilot Standard | Compact Cluster | 3 | Primary Cluster | preventive |
| 3 | Pilot Standard | Compact Cluster | 4 | Composite Review | administrative |
| 4 | Baseline Framework D | Legacy Review D | 4 | Composite Review | administrative |
| 4 | Baseline Framework D | Legacy Review D | 1 | Distributed Initiative | diagnostic |

This view answers: which clinical services does each professional provide, and what are the service characteristics? It joins healthcare_professionals with clinical_services through the professional-service relationship. A representative row would link professional 1 (Integrated Protocol A) with the Distributed Initiative service, a diagnostic, non-appointment-required, urgent care service at practice 1.

## Clinical Service-Centric Views

These views examine clinical services from the perspective of their providers, patients, and overseeing organizations.

**View `v_clinical_service_healthcare_professional_detail`**

```sql
CREATE VIEW v_clinical_service_healthcare_professional_detail AS
SELECT a.clinical_service_id, a.service_name, a.service_category, b.healthcare_professional_id AS professional_healthcare_professional_id, b.professional_name AS professional_professional_name, b.job_title AS professional_job_title
FROM clinical_services a
  JOIN services_professionals j ON j.clinical_service_id = a.clinical_service_id
  JOIN healthcare_professionals b ON b.healthcare_professional_id = j.healthcare_professional_id;
```

| clinical_service_id | service_name | service_category | professional_healthcare_professional_id | professional_professional_name | professional_job_title |
|---|---|---|---|---|---|
| 1 | Distributed Initiative | diagnostic | 1 | Integrated Protocol A | Primary Initiative A |
| 1 | Distributed Initiative | diagnostic | 2 | Extended Programme | Composite Model |
| 2 | Adaptive Model D | therapeutic | 2 | Extended Programme | Composite Model |
| 2 | Adaptive Model D | therapeutic | 3 | Pilot Standard | Compact Cluster |
| 3 | Primary Cluster | preventive | 3 | Pilot Standard | Compact Cluster |
| 3 | Primary Cluster | preventive | 4 | Baseline Framework D | Legacy Review D |
| 4 | Composite Review | administrative | 4 | Baseline Framework D | Legacy Review D |
| 4 | Composite Review | administrative | 1 | Integrated Protocol A | Primary Initiative A |

This view answers: which professionals deliver each clinical service, and what are their qualifications? It joins clinical_services with healthcare_professionals through the service-professional relationship. A row would show the Adaptive Model D (therapeutic, appointment-required, non-urgent) delivered by professional 2 (Extended Programme, Composite Model, locum status), revealing the staffing configuration for practice 2's therapeutic offerings.

**View `v_clinical_service_patient_detail`**

```sql
CREATE VIEW v_clinical_service_patient_detail AS
SELECT a.clinical_service_id, a.service_name, a.service_category, b.id AS patient_id, b.patient_i_d AS patient_patient_i_d, b.full_name AS patient_full_name
FROM clinical_services a
  JOIN services_patients j ON j.clinical_service_id = a.clinical_service_id
  JOIN patients b ON b.id = j.patient_id;
```

| clinical_service_id | service_name | service_category | patient_id | patient_patient_i_d | patient_full_name |
|---|---|---|---|---|---|
| 1 | Distributed Initiative | diagnostic | 1000 | PAT-2559 | Theodore Mcgrath |
| 1 | Distributed Initiative | diagnostic | 1001 | PAT-2563 | Account Name |
| 2 | Adaptive Model D | therapeutic | 1001 | PAT-2563 | Account Name |
| 2 | Adaptive Model D | therapeutic | 1002 | PAT-2567 | Saipan International Airport |
| 3 | Primary Cluster | preventive | 1002 | PAT-2567 | Saipan International Airport |
| 3 | Primary Cluster | preventive | 1003 | PAT-2571 | Norma Fisher |
| 4 | Composite Review | administrative | 1003 | PAT-2571 | Norma Fisher |
| 4 | Composite Review | administrative | 1000 | PAT-2559 | Theodore Mcgrath |

This view answers: which patients engage with each clinical service? It joins clinical_services with patients through the service-patient relationship. A representative row would connect the Primary Cluster (preventive, urgent care) at practice 3 with patient Saipan International Airport (PAT-2567, pending status), showing how patients interact with specific service categories.

**View `v_clinical_service_medical_practice`**

```sql
CREATE VIEW v_clinical_service_medical_practice AS
SELECT a.clinical_service_id, a.service_name, a.service_category, a.requires_appointment, b.medical_practice_id AS practice_medical_practice_id, b.practice_name AS practice_practice_name, b.registration_number AS practice_registration_number
FROM clinical_services a JOIN medical_practices b ON a.medical_practice_id = b.medical_practice_id;
```

| clinical_service_id | service_name | service_category | requires_appointment | practice_medical_practice_id | practice_practice_name | practice_registration_number |
|---|---|---|---|---|---|---|
| 1 | Distributed Initiative | diagnostic | false | 1 | Seasonal Survey | REG-2136 |
| 2 | Adaptive Model D | therapeutic | true | 2 | Integrated Corridor | REG-2142 |
| 3 | Primary Cluster | preventive | false | 3 | Extended Series D | REG-2148 |
| 4 | Composite Review | administrative | true | 4 | Pilot Assessment | REG-2154 |

This view answers: which practice offers each clinical service, and what are the practice's identifying details? It joins clinical_services with medical_practices on medical_practice_id. A row would show Composite Review (administrative, appointment-required, non-urgent) offered by Pilot Assessment (REG-2154) with website https://en.wiktionary.org/wiki/elephant, providing the practice context for service 4.

## Patient-Centric Views

These views provide comprehensive profiles of patients, linking them to their practices, services, and medications.

**View `v_patient_medical_practice`**

```sql
CREATE VIEW v_patient_medical_practice AS
SELECT a.id, a.patient_i_d, a.full_name, a.date_of_birth, b.medical_practice_id AS practice_medical_practice_id, b.practice_name AS practice_practice_name, b.registration_number AS practice_registration_number
FROM patients a JOIN medical_practices b ON a.medical_practice_id = b.medical_practice_id;
```

| id | patient_i_d | full_name | date_of_birth | practice_medical_practice_id | practice_practice_name | practice_registration_number |
|---|---|---|---|---|---|---|
| 1000 | PAT-2559 | Theodore Mcgrath | 2025-04-02 | 1 | Seasonal Survey | REG-2136 |
| 1001 | PAT-2563 | Account Name | 2022-09-13 | 2 | Integrated Corridor | REG-2142 |
| 1002 | PAT-2567 | Saipan International Airport | 2023-02-24 | 3 | Extended Series D | REG-2148 |
| 1003 | PAT-2571 | Norma Fisher | 2024-07-08 | 4 | Pilot Assessment | REG-2154 |

This view answers: which practice is each patient registered with, and what are the practice's details? It joins patients with medical_practices on medical_practice_id. A row would show Norma Fisher (PAT-2571, active, online access enabled) registered at Pilot Assessment (REG-2154) with telephone TEL-2185, giving the patient's practice affiliation.

**View `v_patient_clinical_service_detail`**

```sql
CREATE VIEW v_patient_clinical_service_detail AS
SELECT a.id, a.patient_i_d, a.full_name, b.clinical_service_id AS service_clinical_service_id, b.service_name AS service_service_name, b.service_category AS service_service_category
FROM patients a
  JOIN patients_services j ON j.patient_id = a.id
  JOIN clinical_services b ON b.clinical_service_id = j.clinical_service_id;
```

| id | patient_i_d | full_name | service_clinical_service_id | service_service_name | service_service_category |
|---|---|---|---|---|---|
| 1000 | PAT-2559 | Theodore Mcgrath | 1 | Distributed Initiative | diagnostic |
| 1000 | PAT-2559 | Theodore Mcgrath | 2 | Adaptive Model D | therapeutic |
| 1001 | PAT-2563 | Account Name | 2 | Adaptive Model D | therapeutic |
| 1001 | PAT-2563 | Account Name | 3 | Primary Cluster | preventive |
| 1002 | PAT-2567 | Saipan International Airport | 3 | Primary Cluster | preventive |
| 1002 | PAT-2567 | Saipan International Airport | 4 | Composite Review | administrative |
| 1003 | PAT-2571 | Norma Fisher | 4 | Composite Review | administrative |
| 1003 | PAT-2571 | Norma Fisher | 1 | Distributed Initiative | diagnostic |

This view answers: which clinical services does each patient engage with? It joins patients with clinical_services through the patient-service relationship. A representative row would link patient Theodore Mcgrath (PAT-2559, active) with the Distributed Initiative (diagnostic, urgent care) at practice 1, showing the service-patient connection.

**View `v_patient_medication`**

```sql
CREATE VIEW v_patient_medication AS
SELECT a.id, a.patient_i_d, a.full_name, a.date_of_birth, b.medication_id AS medication_medication_id, b.medication_name AS medication_medication_name, b.dosage_form AS medication_dosage_form
FROM patients a JOIN medications b ON a.medication_id = b.medication_id;
```

| id | patient_i_d | full_name | date_of_birth | medication_medication_id | medication_medication_name | medication_dosage_form |
|---|---|---|---|---|---|---|
| 1000 | PAT-2559 | Theodore Mcgrath | 2025-04-02 | 1 | Pilot Programme | primary-dosage-40 |
| 1001 | PAT-2563 | Account Name | 2022-09-13 | 2 | Baseline Standard | adaptive-dosage-41 |
| 1002 | PAT-2567 | Saipan International Airport | 2023-02-24 | 3 | Distributed Framework A | distributed-dosage-42 |
| 1003 | PAT-2571 | Norma Fisher | 2024-07-08 | 4 | Adaptive Protocol | baseline-dosage-43 |

This view answers: which medication is each patient associated with, and what are the medication details? It joins patients with medications on medication_id. A row would show Account Name (PAT-2563, inactive) associated with Baseline Standard (adaptive-dosage-41, transmitted status, transmitted 2024-11-25), providing the medication context for patient 1001.

## Medication-Centric Views

These views examine medications from the perspective of their patients and prescribing professionals.

**View `v_medication_patient_detail`**

```sql
CREATE VIEW v_medication_patient_detail AS
SELECT a.medication_id, a.medication_name, a.dosage_form, b.id AS patient_id, b.patient_i_d AS patient_patient_i_d, b.full_name AS patient_full_name
FROM medications a
  JOIN medications_patients j ON j.medication_id = a.medication_id
  JOIN patients b ON b.id = j.patient_id;
```

| medication_id | medication_name | dosage_form | patient_id | patient_patient_i_d | patient_full_name |
|---|---|---|---|---|---|
| 1 | Pilot Programme | primary-dosage-40 | 1000 | PAT-2559 | Theodore Mcgrath |
| 1 | Pilot Programme | primary-dosage-40 | 1001 | PAT-2563 | Account Name |
| 2 | Baseline Standard | adaptive-dosage-41 | 1001 | PAT-2563 | Account Name |
| 2 | Baseline Standard | adaptive-dosage-41 | 1002 | PAT-2567 | Saipan International Airport |
| 3 | Distributed Framework A | distributed-dosage-42 | 1002 | PAT-2567 | Saipan International Airport |
| 3 | Distributed Framework A | distributed-dosage-42 | 1003 | PAT-2571 | Norma Fisher |
| 4 | Adaptive Protocol | baseline-dosage-43 | 1003 | PAT-2571 | Norma Fisher |
| 4 | Adaptive Protocol | baseline-dosage-43 | 1000 | PAT-2559 | Theodore Mcgrath |

This view answers: which patients receive each medication, and what are the patient characteristics? It joins medications with patients through the medications_patients relationship. A row would show Distributed Framework A (distributed-dosage-42, collected status) prescribed to patient Saipan International Airport (PAT-2567, pending status, no online access), revealing the medication-patient linkage.

**View `v_medication_healthcare_professional`**

```sql
CREATE VIEW v_medication_healthcare_professional AS
SELECT a.medication_id, a.medication_name, a.dosage_form, a.prescription_status, b.healthcare_professional_id AS professional_healthcare_professional_id, b.professional_name AS professional_professional_name, b.job_title AS professional_job_title
FROM medications a JOIN healthcare_professionals b ON a.healthcare_professional_id = b.healthcare_professional_id;
```

| medication_id | medication_name | dosage_form | prescription_status | professional_healthcare_professional_id | professional_professional_name | professional_job_title |
|---|---|---|---|---|---|---|
| 1 | Pilot Programme | primary-dosage-40 | pending | 1 | Integrated Protocol A | Primary Initiative A |
| 2 | Baseline Standard | adaptive-dosage-41 | transmitted | 2 | Extended Programme | Composite Model |
| 3 | Distributed Framework A | distributed-dosage-42 | collected | 3 | Pilot Standard | Compact Cluster |
| 4 | Adaptive Protocol | baseline-dosage-43 | cancelled | 4 | Baseline Framework D | Legacy Review D |

This view answers: which professional prescribed each medication? It joins medications with healthcare_professionals on healthcare_professional_id. A representative row would show Adaptive Protocol (baseline-dosage-43, cancelled status) prescribed by Baseline Framework D (Legacy Review D, permanent) at practice 4, establishing the prescriber-patient-medication chain.

## Health Authority-Centric Views

These views provide oversight perspectives, linking health authorities to the practices and services they regulate.

**View `v_health_authority_medical_practice_detail`**

```sql
CREATE VIEW v_health_authority_medical_practice_detail AS
SELECT a.health_authority_id, a.authority_name, a.contact_phone, b.medical_practice_id AS practice_medical_practice_id, b.practice_name AS practice_practice_name, b.registration_number AS practice_registration_number
FROM health_authorities a
  JOIN authorities_practices j ON j.health_authority_id = a.health_authority_id
  JOIN medical_practices b ON b.medical_practice_id = j.medical_practice_id;
```

| health_authority_id | authority_name | contact_phone | practice_medical_practice_id | practice_practice_name | practice_registration_number |
|---|---|---|---|---|---|
| 1 | Sean Green | Joe Tsai | 1 | Seasonal Survey | REG-2136 |
| 1 | Sean Green | Joe Tsai | 2 | Integrated Corridor | REG-2142 |
| 2 | Elizabeth Woods | Stephanie Collins | 2 | Integrated Corridor | REG-2142 |
| 2 | Elizabeth Woods | Stephanie Collins | 3 | Extended Series D | REG-2148 |
| 3 | Kimberly Smith | Tasha Rodriguez | 3 | Extended Series D | REG-2148 |
| 3 | Kimberly Smith | Tasha Rodriguez | 4 | Pilot Assessment | REG-2154 |
| 4 | Kimberly Smith | Walter Pratt | 4 | Pilot Assessment | REG-2154 |
| 4 | Kimberly Smith | Walter Pratt | 1 | Seasonal Survey | REG-2136 |

This view answers: which medical practices fall under each health authority's jurisdiction, and what are their operational details? It joins health_authorities with medical_practices on health_authority_id. A row would show Elizabeth Woods' authority (covering extended-region-69, contact Stephanie Collins, email Charles Larsen) regulating Integrated Corridor (REG-2142, post code 6564374, website https://code.google.com/p/adwhirl/), providing the regulatory oversight context for practice 2.

**View `v_health_authority_clinical_service`**

```sql
CREATE VIEW v_health_authority_clinical_service AS
SELECT a.health_authority_id, a.authority_name, a.contact_phone, a.contact_email, b.clinical_service_id AS service_clinical_service_id, b.service_name AS service_service_name, b.service_category AS service_service_category
FROM health_authorities a JOIN clinical_services b ON a.clinical_service_id = b.clinical_service_id;
```

| health_authority_id | authority_name | contact_phone | contact_email | service_clinical_service_id | service_service_name | service_service_category |
|---|---|---|---|---|---|---|
| 1 | Sean Green | Joe Tsai | Christopher Wilson | 1 | Distributed Initiative | diagnostic |
| 2 | Elizabeth Woods | Stephanie Collins | Charles Larsen | 2 | Adaptive Model D | therapeutic |
| 3 | Kimberly Smith | Tasha Rodriguez | Mary Alvarez | 3 | Primary Cluster | preventive |
| 4 | Kimberly Smith | Walter Pratt | April Snyder | 4 | Composite Review | administrative |

This view answers: which clinical services operate under each health authority's regulatory scope? It joins health_authorities with clinical_services through the authority-practice-service chain. A representative row would connect Kimberly Smith's authority (covering seasonal-region-71, contact Walter Pratt, email April Snyder) with the Composite Review service (administrative, appointment-required, non-urgent) at practice 4, showing how regulatory oversight extends to specific service categories.

## Synthesis

The healthcare delivery ecosystem described here comprises six core entity types—medical practices, healthcare professionals, clinical services, patients, medications, and health authorities—interconnected through a network of relationship tables and analytical views. Medical practices serve as the organizational anchor, employing professionals, offering services, registering patients, and falling under health authority regulation. Healthcare professionals deliver clinical services within their employing practices. Patients engage with practices, services, and medications. Health authorities provide regulatory oversight across practices and services. The fourteen analytical views enable practitioners to query this ecosystem from any entity's perspective, answering questions about practice staffing, patient registries, service offerings, medication tracking, and regulatory compliance. Together, these records and relationships form the operational foundation for healthcare management, reporting, and decision-making.