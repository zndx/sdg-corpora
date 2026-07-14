The healthcare ecosystem described in this dataset models a multi-layered administrative and clinical infrastructure in which medical practices, healthcare professionals, clinical services, patients, medications, and health authorities interact through a carefully normalized relational schema. The domain captures not only the static attributes of each entity — names, identifiers, contact details, and categorical flags — but also the many-to-many relationships that bind them: which professionals belong to which practices, which services each practice offers, which patients are registered where, which medications are prescribed by whom, and which health authorities exercise jurisdiction over which practices and services. The schema achieves this through six core entity tables, eight junction tables that resolve cardinality-bounded relationships, and fourteen materialized views that reconstruct domain facts from the normalized tables via joins.

## Core Entity Tables

The foundation of the schema consists of six entity tables, each representing a distinct concept in the healthcare domain. The `medical_practices` table stores organizational records for clinics and practices. Its primary key, `medical_practice_id`, is an integer surrogate; the business identifier is `registration_number`, which carries a `REG-` prefix (for example, `REG-2136` for the practice named *Seasonal Survey*). Other columns capture the practice's `practice_name`, `address_line`, `post_code`, `telephone_number`, `website_u_r_l`, and `last_updated_date`. A foreign key column, `health_authority_id`, links each practice to its overseeing authority. The four rows in the data illustrate the range of practice names — *Seasonal Survey*, *Integrated Corridor*, *Extended Series D*, and *Pilot Assessment* — each associated with a distinct `health_authority_id` value of 1 through 4.

**Table `medical_practices`**

| medical_practice_id | practice_name | registration_number | address_line | post_code | telephone_number | website_u_r_l | last_updated_date | health_authority_id |
|---|---|---|---|---|---|---|---|---|
| 1 | Seasonal Survey | REG-2136 | baseline-address-79 | 1450652 | TEL-2173 | https://www.nature.com/articles/nphoton.2017.123 | 2025-12-20 | 1 |
| 2 | Integrated Corridor | REG-2142 | pilot-address-80 | 6564374 | TEL-2177 | https://code.google.com/p/adwhirl/ | 2022-05-04 | 2 |
| 3 | Extended Series D | REG-2148 | extended-address-81 | 727070 | TEL-2181 | http://twitter.com/annhealthcare/status/423315405965635584 | 2023-10-15 | 3 |
| 4 | Pilot Assessment | REG-2154 | integrated-address-82 | 727043 | TEL-2185 | https://en.wiktionary.org/wiki/elephant | 2024-03-26 | 4 |

The `healthcare_professionals` table models individual practitioners. Its primary key is `healthcare_professional_id`, and the columns `professional_name`, `job_title`, `employment_status`, and `qualifications` describe the person's role and credentials. The `employment_status` column takes values such as `permanent`, `locum`, and `contractor`, while `qualifications` carries a descriptive string like `baseline-qualific-43`. A foreign key, `medical_practice_id`, assigns each professional to a practice. In the sample data, *Integrated Protocol A* holds the job title *Primary Initiative A* and is permanently employed by practice 1, whereas *Extended Programme* works as a locum at practice 2.

**Table `healthcare_professionals`**

| healthcare_professional_id | professional_name | job_title | employment_status | qualifications | medical_practice_id |
|---|---|---|---|---|---|
| 1 | Integrated Protocol A | Primary Initiative A | permanent | baseline-qualific-43 | 1 |
| 2 | Extended Programme | Composite Model | locum | pilot-qualific-44 | 2 |
| 3 | Pilot Standard | Compact Cluster | contractor | extended-qualific-45 | 3 |
| 4 | Baseline Framework D | Legacy Review D | permanent | integrated-qualific-46 | 4 |

The `clinical_services` table enumerates the types of care or administrative functions a practice provides. Its primary key is `clinical_service_id`. The `service_name` column holds values such as *Distributed Initiative* and *Adaptive Model D*, while `service_category` classifies the service as `diagnostic`, `therapeutic`, `preventive`, or `administrative`. Boolean columns `requires_appointment` and `is_urgent_care` capture scheduling and triage properties. The foreign key `medical_practice_id` ties each service to the practice that delivers it.

**Table `clinical_services`**

| clinical_service_id | service_name | service_category | requires_appointment | is_urgent_care | medical_practice_id |
|---|---|---|---|---|---|
| 1 | Distributed Initiative | diagnostic | false | true | 1 |
| 2 | Adaptive Model D | therapeutic | true | false | 2 |
| 3 | Primary Cluster | preventive | false | true | 3 |
| 4 | Composite Review | administrative | true | false | 4 |

The `patients` table stores registered individuals. Its primary key is `id`, an integer, and the business identifier `patient_i_d` carries a `PAT-` prefix (e.g., `PAT-2559` for *Theodore Mcgrath*). Columns include `full_name`, `date_of_birth`, `registration_status` (taking values `active`, `inactive`, or `pending`), and `has_online_access` (a boolean). The foreign key `medical_practice_id` assigns each patient to a practice. Notably, the table also contains a `medication_id` column, which directly links a patient to a medication record — a denormalized shortcut that coexists with the dedicated junction table `medications_patients` described later.

**Table `patients`**

| id | patient_i_d | full_name | date_of_birth | registration_status | has_online_access | medical_practice_id | medication_id |
|---|---|---|---|---|---|---|---|
| 1000 | PAT-2559 | Theodore Mcgrath | 2025-04-02 | active | false | 1 | 1 |
| 1001 | PAT-2563 | Account Name | 2022-09-13 | inactive | true | 2 | 2 |
| 1002 | PAT-2567 | Saipan International Airport | 2023-02-24 | pending | false | 3 | 3 |
| 1003 | PAT-2571 | Norma Fisher | 2024-07-08 | active | true | 4 | 4 |

The `medications` table catalogs pharmaceutical products. Its primary key is `medication_id`. The `medication_name` column holds values like *Pilot Programme* and *Baseline Standard*, while `dosage_form` carries descriptive strings such as `primary-dosage-40`. The `prescription_status` column takes values `pending`, `transmitted`, `collected`, or `cancelled`, and `transmission_date` records a timestamp (e.g., `2023-06-14T05:27:00`). A foreign key, `healthcare_professional_id`, attributes each medication to the prescribing professional.

**Table `medications`**

| medication_id | medication_name | dosage_form | prescription_status | transmission_date | healthcare_professional_id |
|---|---|---|---|---|---|
| 1 | Pilot Programme | primary-dosage-40 | pending | 2023-06-14T05:27:00 | 1 |
| 2 | Baseline Standard | adaptive-dosage-41 | transmitted | 2024-11-25T12:44:00 | 2 |
| 3 | Distributed Framework A | distributed-dosage-42 | collected | 2025-04-09T19:01:00 | 3 |
| 4 | Adaptive Protocol | baseline-dosage-43 | cancelled | 2022-09-20T02:18:00 | 4 |

The `health_authorities` table represents regulatory or oversight bodies. Its primary key is `health_authority_id`. The `authority_name` column stores names such as *Sean Green* and *Elizabeth Woods*, while `contact_phone` and `contact_email` provide reachability information. The `region_covered` column carries a descriptive string like `pilot-region-68`. Unusually, the table also contains a `clinical_service_id` foreign key, linking each authority to a specific clinical service — a design choice that suggests a one-to-one or one-to-few mapping between authorities and services in this domain model.

**Table `health_authorities`**

| health_authority_id | authority_name | contact_phone | contact_email | region_covered | clinical_service_id |
|---|---|---|---|---|---|
| 1 | Sean Green | Joe Tsai | Christopher Wilson | pilot-region-68 | 1 |
| 2 | Elizabeth Woods | Stephanie Collins | Charles Larsen | extended-region-69 | 2 |
| 3 | Kimberly Smith | Tasha Rodriguez | Mary Alvarez | integrated-region-70 | 3 |
| 4 | Kimberly Smith | Walter Pratt | April Snyder | seasonal-region-71 | 4 |

## Junction Tables and Relationship Resolution

The six entity tables above capture attributes but not the full topology of relationships. The healthcare domain requires many-to-many associations — a practice employs multiple professionals, a professional may serve multiple practices, a service may be delivered by multiple professionals, and a patient may receive multiple services. The schema resolves these through eight junction (association) tables, each containing at least two foreign keys that reference the participating entity tables.

The `practices_professionals` table resolves the many-to-many relationship between `medical_practices` and `healthcare_professionals`. Its foreign keys reference `medical_practice_id` and `healthcare_professional_id`, enabling a professional to be associated with multiple practices and vice versa.

The `practices_patients` table resolves the many-to-many relationship between `medical_practices` and `patients`. Its foreign keys reference `medical_practice_id` and the patient identifier, allowing patients to be registered across multiple practices.

The `professionals_services` and `services_professionals` tables both resolve the relationship between `healthcare_professionals` and `clinical_services`. The presence of two distinct junction tables — `professionals_services` and `services_professionals` — suggests that the model captures the relationship from two complementary perspectives, perhaps with different metadata or audit columns in each direction. Both tables contain foreign keys referencing `healthcare_professional_id` and `clinical_service_id`.

Similarly, the `services_patients` and `patients_services` tables both resolve the relationship between `clinical_services` and `patients`. Like the professional-service pair, these two junction tables provide dual perspectives on which patients receive which services, with foreign keys referencing `clinical_service_id` and the patient identifier.

The `medications_patients` table resolves the many-to-many relationship between `medications` and `patients`. Its foreign keys reference `medication_id` and the patient identifier, allowing a medication to be prescribed to multiple patients and a patient to receive multiple medications. This junction table coexists with the `medication_id` column in the `patients` table, providing both a denormalized shortcut and a normalized many-to-many resolution.

Finally, the `authorities_practices` table resolves the relationship between `health_authorities` and `medical_practices`. Its foreign keys reference `health_authority_id` and `medical_practice_id`, enabling a health authority to oversee multiple practices and a practice to be subject to multiple authorities.

## Materialized Views

The schema includes fourteen views that materialize common analytical queries by joining the normalized tables. Each view answers a specific domain question by reconstructing a fact from the underlying tables.

The view `v_medical_practice_healthcare_professional_detail` joins `medical_practices` with `healthcare_professionals` (and potentially `practices_professionals`) to produce a detailed record of each professional within their practice context. Reading the first row as evidence: the professional *Integrated Protocol A* (job title *Primary Initiative A*, employment status `permanent`) is associated with the practice *Seasonal Survey* (registration number `REG-2136`, telephone `TEL-2173`). This view answers the question: "Which professionals work at which practices, and what are their employment details?"

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

The view `v_medical_practice_patient_detail` joins `medical_practices` with `patients` to produce a detailed record of each patient within their practice context. The first row shows patient *Theodore Mcgrath* (ID `PAT-2559`, date of birth `2025-04-02`, registration status `active`) registered at the practice *Seasonal Survey* (registration number `REG-2136`). This view answers: "Which patients are registered at which practices, and what are their registration details?"

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

The view `v_medical_practice_health_authority` joins `medical_practices` with `health_authorities` to reveal the oversight relationship. The first row links the practice *Seasonal Survey* (registration number `REG-2136`) to the health authority *Sean Green* (region `pilot-region-68`). This view answers: "Which health authority oversees which medical practice?"

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

The view `v_healthcare_professional_medical_practice` joins `healthcare_professionals` with `medical_practices` to present each professional alongside their practice's full details. The first row pairs professional *Integrated Protocol A* (job title *Primary Initiative A*) with practice *Seasonal Survey* (registration number `REG-2136`, address `baseline-address-79`, post code `1450652`). This view answers: "What are the full practice details for each healthcare professional's employing organization?"

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

The view `v_healthcare_professional_clinical_service_detail` joins `healthcare_professionals` with `clinical_services` (via the junction tables `professionals_services` or `services_professionals`) to show which services each professional is associated with. The first row pairs professional *Integrated Protocol A* with the service *Distributed Initiative* (category `diagnostic`, urgent care `true`). This view answers: "Which clinical services is each healthcare professional involved in delivering?"

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

The view `v_clinical_service_healthcare_professional_detail` joins `clinical_services` with `healthcare_professionals` to present each service alongside the professionals who deliver it. The first row shows the service *Distributed Initiative* (category `diagnostic`, requires appointment `false`, urgent care `true`) delivered by professional *Integrated Protocol A* (job title *Primary Initiative A*, employment status `permanent`). This view answers: "Which professionals deliver each clinical service, and what are their employment details?"

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

The view `v_clinical_service_patient_detail` joins `clinical_services` with `patients` (via the junction tables `services_patients` or `patients_services`) to show which patients receive which services. The first row links the service *Distributed Initiative* (category `diagnostic`) to patient *Theodore Mcgrath* (ID `PAT-2559`, registration status `active`). This view answers: "Which patients receive which clinical services?"

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

The view `v_clinical_service_medical_practice` joins `clinical_services` with `medical_practices` to show which practice delivers which service. The first row links the service *Distributed Initiative* (category `diagnostic`, urgent care `true`) to the practice *Seasonal Survey* (registration number `REG-2136`, telephone `TEL-2173`). This view answers: "Which medical practice delivers each clinical service?"

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

The view `v_patient_medical_practice` joins `patients` with `medical_practices` to present each patient alongside their practice's full details. The first row shows patient *Theodore Mcgrath* (ID `PAT-2559`, date of birth `2025-04-02`, registration status `active`, online access `false`) registered at the practice *Seasonal Survey* (registration number `REG-2136`, address `baseline-address-79`, post code `1450652`, telephone `TEL-2173`). This view answers: "What are the full practice details for each patient's registered organization?"

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

The view `v_patient_clinical_service_detail` joins `patients` with `clinical_services` (via the junction tables) to show which services each patient receives. The first row links patient *Theodore Mcgrath* (ID `PAT-2559`, registration status `active`) to the service *Distributed Initiative* (category `diagnostic`, urgent care `true`). This view answers: "Which clinical services does each patient receive?"

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

The view `v_patient_medication` joins `patients` with `medications` to show which medications each patient receives. The first row links patient *Theodore Mcgrath* (ID `PAT-2559`, registration status `active`) to the medication *Pilot Programme* (dosage form `primary-dosage-40`, prescription status `pending`, transmitted on `2023-06-14T05:27:00`). This view answers: "Which medications are associated with each patient?"

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

The view `v_medication_patient_detail` joins `medications` with `patients` to present each medication alongside the patient's full details. The first row shows medication *Pilot Programme* (dosage form `primary-dosage-40`, prescription status `pending`, transmitted on `2023-06-14T05:27:00`) associated with patient *Theodore Mcgrath* (ID `PAT-2559`, date of birth `2025-04-02`, registration status `active`). This view answers: "Which patient receives each medication, and what are the patient's registration details?"

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

The view `v_medication_healthcare_professional` joins `medications` with `healthcare_professionals` to show which professional prescribes which medication. The first row links medication *Pilot Programme* (dosage form `primary-dosage-40`, prescription status `pending`) to professional *Integrated Protocol A* (job title *Primary Initiative A*, employment status `permanent`). This view answers: "Which healthcare professional prescribes each medication?"

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

The view `v_health_authority_medical_practice_detail` joins `health_authorities` with `medical_practices` to present each authority alongside the practices under its oversight. The first row shows health authority *Sean Green* (contact phone `Joe Tsai`, contact email `Christopher Wilson`, region `pilot-region-68`) overseeing the practice *Seasonal Survey* (registration number `REG-2136`, address `baseline-address-79`, post code `1450652`, telephone `TEL-2173`). This view answers: "Which medical practices fall under each health authority's jurisdiction?"

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

The view `v_health_authority_clinical_service` joins `health_authorities` with `clinical_services` (potentially via `medical_practices` as an intermediary) to show which services fall under each authority's oversight. The first row links health authority *Sean Green* (region `pilot-region-68`) to the service *Distributed Initiative* (category `diagnostic`, urgent care `true`). This view answers: "Which clinical services are overseen by each health authority?"

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

## Synthesis

The schema models a healthcare domain with six core entity tables, eight junction tables, and fourteen materialized views. The entity tables capture the static attributes of practices, professionals, services, patients, medications, and authorities. The junction tables resolve the many-to-many relationships that bind these entities — a practice employs multiple professionals, a professional delivers multiple services, a patient receives multiple services and medications, and an authority oversees multiple practices. The views materialize common analytical queries by joining the normalized tables, each answering a specific domain question: which professionals work at which practices, which patients are registered where, which services each practice delivers, which medications each patient receives, and which authority oversees which practice or service. The schema's design reflects a balance between normalization (reducing redundancy through junction tables) and accessibility (providing pre-joined views for common queries), a pattern that is characteristic of healthcare data warehouses where both data integrity and analytical convenience are essential.

## Data appendix

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
