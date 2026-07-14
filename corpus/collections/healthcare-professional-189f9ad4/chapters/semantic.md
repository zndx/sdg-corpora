The healthcare domain under examination captures a tripartite ecosystem of care providers, patients, and the people connected to them, all anchored by discrete disclosure events that record how sensitive information was communicated. Five base tables encode the canonical entities, while eight materialized views reconstruct domain facts through controlled joins. The schema follows a normalized design where each entity type occupies its own table, foreign keys express cardinality-bounded relationships, and views serve as denormalized lenses that answer specific analytical questions without duplicating storage.

## The Healthcare Professional Entity

**Table `healthcare_professionals`**

| id | professional_id | full_name | specialty | clinic_id | is_primary_care | patient_id | works_at_clinic_id |
|---|---|---|---|---|---|---|---|
| 1000 | 5082965 | Theodore Mcgrath | extended-specialt-21 | gd_taxc_1122 | true | 100 | 100 |
| 1001 | 2618560 | Account Name | integrated-specialt-22 | 2106713 | false | 101 | 101 |
| 1002 | 3355767 | Saipan International Airport | seasonal-specialt-23 | 506004 | true | 102 | 102 |
| 1003 | 3355784 | Norma Fisher | regional-specialt-24 | 8928507 | false | 103 | 103 |

The `healthcare_professionals` table is the primary actor table, storing one row per care provider. Its surrogate key `id` (an auto-incrementing integer) is complemented by a business identifier `professional_id` — a six-digit code such as `5082965` for Theodore Mcgrath or `2618560` for Account Name. The `full_name` column carries the provider's display name, while `specialty` encodes the clinical domain using a controlled vocabulary: `extended-specialt-21`, `integrated-specialt-22`, `seasonal-specialt-23`, and `regional-specialt-24` appear across the four rows. The `clinic_id` column is a foreign key pointing to the `clinics` table, establishing a many-to-one relationship — multiple professionals may work at the same clinic, but each professional row references exactly one clinic. The boolean `is_primary_care` flag distinguishes primary-care providers (true for Theodore Mcgrath and Saipan International Airport) from specialists (false for Account Name and Norma Fisher). Two additional columns, `patient_id` and `works_at_clinic_id`, serve as denormalized shortcuts that shortcut the join paths used by the materialized views described later.

## The Patient Entity

**Table `patients`**

| patient_id | date_of_birth | diagnosis_date | status | is_minor | healthcare_professional_id | person_id | has_family_member_person_id | has_close_friend_person_id |
|---|---|---|---|---|---|---|---|---|
| 100 | 2025-04-02 | 2023-10-26 | regional-status-84 | true | 1000 | George Bernard Shaw | George Bernard Shaw | George Bernard Shaw |
| 101 | 2022-09-13 | 2024-03-10 | legacy-status-85 | false | 1001 | Maria Rodriguez | Maria Rodriguez | Maria Rodriguez |
| 102 | 2023-02-24 | 2025-08-21 | compact-status-86 | true | 1002 | Sarah Villanueva | Sarah Villanueva | Sarah Villanueva |
| 103 | 2024-07-08 | 2022-01-05 | composite-status-87 | false | 1003 | Susan Wagner | Susan Wagner | Susan Wagner |

The `patients` table models the care recipients. Its primary key is `patient_id`, a four-digit integer (100 through 103) that also functions as a foreign key into the `persons` and `disclosure_events` tables. The `date_of_birth` column stores dates in ISO format — for example, `2025-04-02` for George Bernard Shaw and `2022-09-13` for Maria Rodriguez. The `diagnosis_date` column records when the patient received their diagnosis, such as `2023-10-26` or `2024-03-10`. The `status` column uses a controlled vocabulary of care states: `regional-status-84`, `legacy-status-85`, `compact-status-86`, and `composite-status-87`. The boolean `is_minor` flag identifies pediatric patients (true for George Bernard Shaw and Sarah Villanueva, false for Maria Rodriguez and Susan Wagner). The `healthcare_professional_id` column is a foreign key into `healthcare_professionals.id`, enforcing a many-to-one assignment — each patient is assigned to exactly one provider. The `person_id` column, along with `has_family_member_person_id` and `has_close_friend_person_id`, are foreign keys into the `persons` table, encoding social relationships that are critical to the disclosure model.

## The Person Entity

**Table `persons`**

| person_id | full_name | relationship_to_patient | is_trusted | patient_id |
|---|---|---|---|---|
| George Bernard Shaw | Theodore Mcgrath | adaptive-relation-71 | false | 100 |
| Maria Rodriguez | Account Name | distributed-relation-72 | true | 101 |
| Sarah Villanueva | Saipan International Airport | baseline-relation-73 | false | 102 |
| Susan Wagner | Norma Fisher | pilot-relation-74 | true | 103 |

The `persons` table captures individuals who are not patients but are connected to them — family members, friends, or trusted contacts. Its primary key is `person_id`, which doubles as a natural name identifier: `George Bernard Shaw`, `Maria Rodriguez`, `Sarah Villanueva`, and `Susan Wagner` appear as both person identifiers and names in the sample data. The `full_name` column stores the same name value, creating a self-referential identity pattern. The `relationship_to_patient` column uses a controlled vocabulary — `adaptive-relation-71`, `distributed-relation-72`, `baseline-relation-73`, and `pilot-relation-74` — to classify the nature of the connection. The boolean `is_trusted` flag indicates whether the person is authorized to receive sensitive information (true for Maria Rodriguez and Susan Wagner, false for George Bernard Shaw and Sarah Villanueva). The `patient_id` column is a foreign key into `patients.patient_id`, enforcing a many-to-one relationship: each person is associated with exactly one patient, but a patient may have multiple persons linked through the various relationship columns in the `patients` table.

## The Disclosure Event Entity

**Table `disclosure_events`**

| id | event_id | disclosure_date | method | is_successful | is_nerve_wracking | patient_id | person_id | healthcare_professional_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 2002007020060 | 2025-08-02T19:33:00 | seasonal-method-77 | true | false | 100 | George Bernard Shaw | 1000 |
| 2 | 168535 | 2022-01-13T02:50:00 | regional-method-78 | false | true | 101 | Maria Rodriguez | 1001 |
| 3 | ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 | 2023-06-24T09:07:00 | legacy-method-79 | true | false | 102 | Sarah Villanueva | 1002 |
| 4 | 1186089 | 2024-11-08T16:24:00 | compact-method-80 | false | true | 103 | Susan Wagner | 1003 |

The `disclosure_events` table is the transactional core of the schema, recording each instance where sensitive health information was communicated. Its surrogate key `id` is a small integer (1 through 4), while `event_id` is a business identifier that varies in format — it can be a long numeric string like `2002007020060`, a shorter number like `168535`, or a UUID such as `ab8e1d18-8fcd-11eb-924d-9cd76263cbd0`. The `disclosure_date` column stores timestamps in ISO 8601 format, for example `2025-08-02T19:33:00` or `2022-01-13T02:50:00`. The `method` column uses a controlled vocabulary of communication channels: `seasonal-method-77`, `regional-method-78`, `legacy-method-79`, and `compact-method-80`. Two boolean flags capture the outcome and emotional impact: `is_successful` indicates whether the disclosure achieved its purpose (true for events 1 and 3, false for events 2 and 4), and `is_nerve_wracking` indicates the stress level of the disclosure (false for events 1 and 3, true for events 2 and 4). The table has three foreign key columns — `patient_id`, `person_id`, and `healthcare_professional_id` — each pointing to the respective entity table, forming a ternary relationship that captures who disclosed to whom, through which provider, and under what circumstances.

## The Clinic Entity

**Table `clinics`**

| clinic_id | clinic_name | location | has_workshops | healthcare_professional_id |
|---|---|---|---|---|
| 100 | Distributed Standard | extended-location-99 | false | 1000 |
| 101 | Adaptive Framework D | integrated-location-100 | true | 1001 |
| 102 | Primary Protocol | seasonal-location-101 | false | 1002 |
| 103 | Composite Programme | regional-location-102 | true | 1003 |

The `clinics` table stores the physical or organizational locations where healthcare professionals practice. Its primary key is `clinic_id`, a four-digit integer (100 through 103) that also appears as `clinic_id` in the `healthcare_professionals` table and as `works_at_clinic_id`. The `clinic_name` column carries human-readable names such as `Distributed Standard`, `Adaptive Framework D`, `Primary Protocol`, and `Composite Programme`. The `location` column uses a controlled vocabulary of location descriptors: `extended-location-99`, `integrated-location-100`, `seasonal-location-101`, and `regional-location-102`. The boolean `has_workshops` flag indicates whether the clinic offers educational programs (true for Adaptive Framework D and Composite Programme, false for Distributed Standard and Primary Protocol). The `healthcare_professional_id` column is a foreign key into `healthcare_professionals.id`, establishing a one-to-one or one-to-many relationship depending on the business rules — in the sample data, each clinic row references a different professional, but the schema supports multiple professionals per clinic through the `clinic_id` column in the `healthcare_professionals` table.

## Materialized Views

The schema provides eight materialized views that join base tables to answer specific analytical questions. Each view is a stored query that denormalizes the normalized schema into a flat, query-ready structure.

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

The `healthcare_professional_patient_view` joins `healthcare_professionals` with `patients` on the `patient_id` column, answering the question: "Which patient is associated with each healthcare professional?" The join condition `a.patient_id = b.patient_id` links provider rows to patient rows. The result includes the provider's `id`, `professional_id`, `full_name`, and `specialty`, alongside the patient's `patient_id`, `date_of_birth`, and `diagnosis_date`. For example, the first row shows that Theodore Mcgrath (id 1000, specialty `extended-specialt-21`) is linked to patient 100, who was born on `2025-04-02` and diagnosed on `2023-10-26`. This view collapses the provider-patient relationship into a single flat row, eliminating the need for a runtime join when reporting on provider-patient pairings.

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

The `healthcare_professional_clinic_view` joins `healthcare_professionals` with `clinics` on the `works_at_clinic_id` column, answering: "Which clinic does each healthcare professional work at?" The join reconstructs the provider's full professional profile alongside their clinic's details. Each row pairs a provider's identity and specialty with their clinic's name, location, and workshop availability. This view is particularly useful for organizational reporting, such as identifying which clinics offer workshops and which professionals are assigned to them.

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

The `patient_healthcare_professional_view` joins `patients` with `healthcare_professionals` on the `healthcare_professional_id` column, answering: "Which healthcare professional is assigned to each patient?" This is the inverse of the `healthcare_professional_patient_view` and provides the patient-centric perspective on the same relationship. The join uses the `healthcare_professional_id` foreign key in the `patients` table, which enforces the many-to-one cardinality constraint that each patient has exactly one assigned provider.

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

The `patient_person_view` joins `patients` with `persons` on the `person_id` column, answering: "Which persons are associated with each patient?" This view reconstructs the social network of each patient by linking the `person_id` foreign key in the `patients` table to the `persons` table. The result includes the patient's demographic and clinical data alongside the person's name, relationship type, and trust status. For instance, George Bernard Shaw (person_id) is linked to patient 100 with relationship `adaptive-relation-71` and trust status `false`.

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

The `person_patient_view` joins `persons` with `patients` on the `patient_id` column, answering: "Which patient is each person connected to?" This is the inverse of the `patient_person_view` and provides the person-centric perspective. The join uses the `patient_id` foreign key in the `persons` table, which enforces the constraint that each person is associated with exactly one patient. This view is useful for answering questions like "Who are all the people connected to patient 100?" by filtering on the `patient_id` column.

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

The `disclosure_event_patient_view` joins `disclosure_events` with `patients` on the `patient_id` column, answering: "Which patient was involved in each disclosure event?" This view reconstructs the patient context for every disclosure transaction. The result includes the event's identifier, date, method, and outcome flags alongside the patient's date of birth, diagnosis date, and status. For example, event `2002007020060` on `2025-08-02T19:33:00` using `seasonal-method-77` was successful and involved patient 100, who has status `regional-status-84`.

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

The `disclosure_event_person_view` joins `disclosure_events` with `persons` on the `person_id` column, answering: "Which person was the recipient or subject of each disclosure event?" This view reconstructs the person context for every disclosure. The result pairs the event's details with the person's name, relationship to the patient, and trust status. For instance, event `168535` on `2022-01-13T02:50:00` using `regional-method-78` was not successful and involved Maria Rodriguez, who has relationship `distributed-relation-72` and trust status `true`.

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

The `disclosure_event_healthcare_professional_view` joins `disclosure_events` with `healthcare_professionals` on the `healthcare_professional_id` column, answering: "Which healthcare professional was involved in each disclosure event?" This view reconstructs the provider context for every disclosure transaction. The result includes the event's details alongside the provider's name, specialty, and primary-care status. For example, event `ab8e1d18-8fcd-11eb-924d-9cd76263cbd0` on `2023-06-24T09:07:00` using `legacy-method-79` was successful and involved Theodore Mcgrath (specialty `extended-specialt-21`, primary care `true`).

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

The `clinic_healthcare_professional_view` joins `clinics` with `healthcare_professionals` on the `healthcare_professional_id` column, answering: "Which healthcare professional is associated with each clinic?" This view reconstructs the clinic-provider relationship from the clinic side, pairing each clinic's name, location, and workshop status with the professional's identity and specialty. For instance, Distributed Standard (clinic 100, location `extended-location-99`, no workshops) is linked to Theodore Mcgrath (specialty `extended-specialt-21`, primary care `true`).

## Synthesis

The schema models the healthcare domain as five interconnected entity tables with a clean separation of concerns: providers, patients, connected persons, disclosure transactions, and clinic locations. Foreign keys enforce cardinality-bounded relationships — many patients to one provider, many persons to one patient, and many disclosure events to one patient, person, and provider. The eight materialized views serve as denormalized lenses that reconstruct domain facts by joining the appropriate base tables, eliminating the need for ad-hoc joins in analytical queries. Each view answers a specific question about the relationships between entities, and together they provide comprehensive coverage of the domain's relational structure. The controlled vocabulary columns (`specialty`, `status`, `relationship_to_patient`, `method`, `location`) ensure data consistency, while the boolean flags (`is_primary_care`, `is_minor`, `is_trusted`, `is_successful`, `is_nerve_wracking`, `has_workshops`) capture binary attributes that are frequently queried. This design balances normalization for data integrity with denormalization for query performance, a pattern that scales well as the domain grows.