## Ontology-Grounded Relational Modelling of a Clinical Service Delivery Domain

This chapter documents the relational schema that materialises a clinical service delivery ontology. The domain captures the operational topology of healthcare clinics, the professionals who staff them, the patients they serve, the therapeutic programmes that organise care, and the charting software that records clinical activity. Six base tables hold the core entities, while eight junction tables resolve many-to-many associations and self-referential links. A suite of twelve materialised views then re-assemble normalised facts into human-readable join results. Every table and column name is quoted in backticks throughout.

### Base Entity Tables

The ontology's first entity type is the clinic. The `clinics` table stores one row per physical or virtual clinic location. Its primary key is the surrogate `id` column, while the business identifier `clinic_id` carries values such as `gd_taxc_1122` and `2106713`. Descriptive columns include `clinic_name` (e.g. "Distributed Standard", "Adaptive Framework D"), `branch_of` (e.g. "legacy-branch-37"), and the geographic triplet `address`, `city`, `state` (e.g. "integrated-city-34" in "distributed-state-84"). A boolean `has_telehealth` flag distinguishes telehealth-capable sites, and two foreign keys — `program_id` and `charting_software_id` — bind each clinic to a default programme and a default charting platform. The row with `id = 1` and `clinic_id = gd_taxc_1122` references programme `103176` and charting software `1`.

**Table `clinics`**

| id | clinic_id | clinic_name | branch_of | address | city | state | has_telehealth | program_id | charting_software_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | gd_taxc_1122 | Distributed Standard | legacy-branch-37 | distributed-address-72 | integrated-city-34 | distributed-state-84 | true | 103176 | 1 |
| 2 | 2106713 | Adaptive Framework D | compact-branch-38 | baseline-address-73 | seasonal-city-35 | baseline-state-85 | false | 2986219 | 2 |
| 3 | 506004 | Primary Protocol | composite-branch-39 | pilot-address-74 | regional-city-36 | pilot-state-86 | true | 1186079 | 3 |
| 4 | 8928507 | Composite Programme | primary-branch-40 | extended-address-75 | legacy-city-37 | extended-state-87 | false | 1562855 | 4 |

The `providers` table models individual clinicians. Its primary key is `provider_id`, and the business identifier `full_name` carries values like `Theodore Mcgrath`, `Account Name`, and `Saipan International Airport`. Clinical credentials are stored in `credential` (RDN, CN), while `state_license` records the licensing jurisdiction (e.g. "legacy-state-85"). Employment metadata includes `employment_status` (Full-Time, Part-Time), `years_experience`, and `ed_experience_years`. The geographic binding `resides_in_state` (e.g. "integrated-resides-40") and two foreign keys — `clinic_id` and `program_id` — anchor each provider to a clinic and a programme. Provider `100`, Theodore Mcgrath, is a Part-Time RDN with 16 years of experience assigned to clinic `1` and programme `103176`.

**Table `providers`**

| provider_id | full_name | credential | state_license | employment_status | years_experience | ed_experience_years | resides_in_state | clinic_id | program_id |
|---|---|---|---|---|---|---|---|---|---|
| 100 | Theodore Mcgrath | RDN | legacy-state-85 | Part-Time | 16 | 44 | integrated-resides-40 | 1 | 103176 |
| 101 | Account Name | CN | compact-state-86 | Full-Time | 22 | 54 | seasonal-resides-41 | 2 | 2986219 |
| 102 | Saipan International Airport | RDN | composite-state-87 | Part-Time | 28 | 64 | regional-resides-42 | 3 | 1186079 |
| 103 | Norma Fisher | CN | primary-state-88 | Full-Time | 34 | 74 | legacy-resides-43 | 4 | 1562855 |

The `patients` table holds one row per patient. The surrogate primary key is `patient_id`, and the business identifier `full_name` carries values such as `Theodore Mcgrath` and `Account Name`. Demographic and clinical attributes include `age_group` (Child, Adolescent, Adult, Senior), `diagnosis` (Binge Eating, Restrictive Eating, Body Dysmorphia, Exercise Addiction), and `insurance_provider` (e.g. "seasonal-insuranc-11"). Boolean flags `has_caregiver` and `enrolled_in_program` capture care structure, while the foreign keys `provider_id` and `program_id` link each patient to their assigned clinician and programme. Patient `8387541` is a Child with Binge Eating diagnosis, insured by "seasonal-insuranc-11", assigned to provider `100` and programme `103176`.

**Table `patients`**

| patient_id | full_name | age_group | diagnosis | insurance_provider | has_caregiver | enrolled_in_program | provider_id | program_id |
|---|---|---|---|---|---|---|---|---|
| 8387541 | Theodore Mcgrath | Child | Binge Eating | seasonal-insuranc-11 | false | true | 100 | 103176 |
| 10207142 | Account Name | Adolescent | Restrictive Eating | regional-insuranc-12 | true | false | 101 | 2986219 |
| 7119782 | Saipan International Airport | Adult | Body Dysmorphia | legacy-insuranc-13 | false | true | 102 | 1186079 |
| gd_acc_160003 | Norma Fisher | Senior | Exercise Addiction | compact-insuranc-14 | true | false | 103 | 1562855 |

Programmes are the care-delivery containers. The `programs` table's primary key is `program_id`, and its business identifier `program_name` carries values such as "Extended Review" and "Pilot Initiative A". The `program_type` column distinguishes modalities — Support Group, Outpatient Counseling, Educational Workshop, Specialty Clinic. Temporal bounds are captured by `start_date` and `end_date` (e.g. "2022-09-05" to "2022-09-01" for programme `103176`). Boolean flags `is_online` and `is_ready_made` describe delivery format, while the foreign key `clinic_id` binds each programme to its host clinic. Programme `103176`, "Extended Review", is an online, ready-made Support Group hosted at clinic `1`.

**Table `programs`**

| program_id | program_name | program_type | start_date | end_date | is_online | is_ready_made | clinic_id |
|---|---|---|---|---|---|---|---|
| 103176 | Extended Review | Support Group | 2022-09-05 | 2022-09-01 | true | true | 1 |
| 2986219 | Pilot Initiative A | Outpatient Counseling | 2023-02-16 | 2023-02-12 | false | false | 2 |
| 1186079 | Baseline Model | Educational Workshop | 2024-07-27 | 2024-07-23 | true | true | 3 |
| 1562855 | Distributed Cluster | Specialty Clinic | 2025-12-11 | 2025-12-07 | false | false | 4 |

Clinical activity is recorded in the `clinical_documentations` table. Its primary key is `clinical_documentation_id`, and the business identifier `doc_id` carries values such as `16605652` and `43197176`. The `doc_type` column distinguishes document categories — Treatment Plan, Session Note, Insurance Claim, Lab Review. Temporal and workflow metadata include `creation_date` (e.g. "2022-01-13T12:24:00"), `status` (Draft, Pending Review, Finalized, Submitted), and boolean flags `contains_supplement_review` and `is_public_facing`. Three foreign keys — `provider_id`, `patient_id`, and `charting_software_id` — bind each document to its author, its subject, and the software platform used to create it. Document `100` is a Draft Treatment Plan (`doc_id = 16605652`) created by provider `100` for patient `8387541` using charting software `1`.

**Table `clinical_documentations`**

| clinical_documentation_id | doc_id | doc_type | creation_date | status | contains_supplement_review | is_public_facing | provider_id | patient_id | charting_software_id |
|---|---|---|---|---|---|---|---|---|---|
| 100 | 16605652 | Treatment Plan | 2022-01-13T12:24:00 | Draft | false | true | 100 | 8387541 | 1 |
| 101 | 43197176 | Session Note | 2023-06-24T19:41:00 | Pending Review | true | false | 101 | 10207142 | 2 |
| 102 | 19655015 | Insurance Claim | 2024-11-08T02:58:00 | Finalized | false | true | 102 | 7119782 | 3 |
| 103 | 10207160 | Lab Review | 2025-04-19T09:15:00 | Submitted | true | false | 103 | gd_acc_160003 | 4 |

The `charting_softwares` table models the software platforms. Its surrogate primary key is `id`, and the business identifier `software_id` carries values such as `gd_taxc_2111` and `5917273`. The `software_name` column holds names like "Primary Review A" and "Composite Initiative", while `version` stores version strings (e.g. "seasonal-version-71"). Feature flags `has_billing_module`, `has_scheduling_module`, and `is_cloud_based` describe capabilities. Software `1` ("Primary Review A", version "seasonal-version-71") is cloud-based and includes a billing module but no scheduling module.

**Table `charting_softwares`**

| id | software_id | software_name | version | has_billing_module | has_scheduling_module | is_cloud_based |
|---|---|---|---|---|---|---|
| 1 | gd_taxc_2111 | Primary Review A | seasonal-version-71 | true | false | true |
| 2 | 5917273 | Composite Initiative | regional-version-72 | false | true | false |
| 3 | id_4 | Compact Model | legacy-version-73 | true | false | true |
| 4 | 8928496 | Legacy Cluster D | compact-version-74 | false | true | false |

### Junction and Association Tables

The six base tables are connected by eight junction tables that resolve many-to-many relationships and self-referential links. The `clinics_providers` table links clinics to their staffed providers, enabling a single clinic to employ multiple providers and a provider to work across multiple clinics. The `providers_patients` table captures the provider-to-patient care relationship, allowing a provider to treat many patients and a patient to be seen by multiple providers. The `providers_providers` table models self-referential relationships among providers — for example, supervisory hierarchies or peer collaboration networks. The `patients_providers` table provides an alternative or complementary linkage between patients and providers, potentially capturing secondary care relationships.

The `programs_providers` table associates providers with the programmes they deliver, supporting the scenario where a provider contributes to multiple programmes and a programme is staffed by multiple providers. The `programs_patients` table captures patient enrolment in programmes, enabling a patient to participate in multiple programmes and a programme to serve many patients. The `softwares_documentations` table links charting software platforms to the clinical documents they host, supporting the scenario where a software platform is used to create many documents and a document may be associated with multiple software instances. Finally, the `softwares_providers` table binds providers to the charting software platforms they use, enabling a provider to use multiple software tools and a software platform to be used by multiple providers.

**Table `clinics_providers`**

| clinic_id | provider_id |
|---|---|
| 1 | 100 |
| 1 | 101 |
| 2 | 101 |
| 2 | 102 |
| 3 | 102 |
| 3 | 103 |
| 4 | 103 |
| 4 | 100 |
**Table `providers_patients`**

| provider_id | patient_id |
|---|---|
| 100 | 8387541 |
| 100 | 10207142 |
| 101 | 10207142 |
| 101 | 7119782 |
| 102 | 7119782 |
| 102 | gd_acc_160003 |
| 103 | gd_acc_160003 |
| 103 | 8387541 |
**Table `providers_providers`**

| provider_id | collaborates_with_provider_id |
|---|---|
| 100 | 100 |
| 100 | 101 |
| 101 | 101 |
| 101 | 102 |
| 102 | 102 |
| 102 | 103 |
| 103 | 103 |
| 103 | 100 |
**Table `patients_providers`**

| patient_id | provider_id |
|---|---|
| 8387541 | 100 |
| 8387541 | 101 |
| 10207142 | 101 |
| 10207142 | 102 |
| 7119782 | 102 |
| 7119782 | 103 |
| gd_acc_160003 | 103 |
| gd_acc_160003 | 100 |
**Table `programs_providers`**

| program_id | provider_id |
|---|---|
| 103176 | 100 |
| 103176 | 101 |
| 2986219 | 101 |
| 2986219 | 102 |
| 1186079 | 102 |
| 1186079 | 103 |
| 1562855 | 103 |
| 1562855 | 100 |
**Table `programs_patients`**

| program_id | patient_id |
|---|---|
| 103176 | 8387541 |
| 103176 | 10207142 |
| 2986219 | 10207142 |
| 2986219 | 7119782 |
| 1186079 | 7119782 |
| 1186079 | gd_acc_160003 |
| 1562855 | gd_acc_160003 |
| 1562855 | 8387541 |
**Table `softwares_documentations`**

| charting_software_id | clinical_documentation_id |
|---|---|
| 1 | 100 |
| 1 | 101 |
| 2 | 101 |
| 2 | 102 |
| 3 | 102 |
| 3 | 103 |
| 4 | 103 |
| 4 | 100 |
**Table `softwares_providers`**

| charting_software_id | provider_id |
|---|---|
| 1 | 100 |
| 1 | 101 |
| 2 | 101 |
| 2 | 102 |
| 3 | 102 |
| 3 | 103 |
| 4 | 103 |
| 4 | 100 |

### View-Based Fact Reconstruction

Materialised views reassemble normalised tables through joins, each answering a specific domain question.

The view `vw_clinic_provider_detail` joins `clinics` with `clinics_providers` and `providers` to answer: "Which providers are staffed at which clinics?" It reconstructs the clinic-provider staffing fact by combining clinic identifiers (`gd_taxc_1122`, `2106713`) with provider names (`Theodore Mcgrath`, `Account Name`) and their credentials.

**View `vw_clinic_provider_detail`**

```sql
CREATE VIEW vw_clinic_provider_detail AS
SELECT a.id, a.clinic_id, a.clinic_name, b.provider_id AS provider_provider_id, b.full_name AS provider_full_name, b.credential AS provider_credential
FROM clinics a
  JOIN clinics_providers j ON j.clinic_id = a.id
  JOIN providers b ON b.provider_id = j.provider_id;
```

| id | clinic_id | clinic_name | provider_provider_id | provider_full_name | provider_credential |
|---|---|---|---|---|---|
| 1 | gd_taxc_1122 | Distributed Standard | 100 | Theodore Mcgrath | RDN |
| 1 | gd_taxc_1122 | Distributed Standard | 101 | Account Name | CN |
| 2 | 2106713 | Adaptive Framework D | 101 | Account Name | CN |
| 2 | 2106713 | Adaptive Framework D | 102 | Saipan International Airport | RDN |
| 3 | 506004 | Primary Protocol | 102 | Saipan International Airport | RDN |
| 3 | 506004 | Primary Protocol | 103 | Norma Fisher | CN |
| 4 | 8928507 | Composite Programme | 103 | Norma Fisher | CN |
| 4 | 8928507 | Composite Programme | 100 | Theodore Mcgrath | RDN |

The view `vw_clinic_program` joins `clinics` with `programs` to answer: "Which programmes are hosted at which clinics?" It reconstructs the clinic-programme hosting fact, showing that clinic `gd_taxc_1122` hosts programme "Extended Review" (a Support Group) and clinic `2106713` hosts "Pilot Initiative A" (Outpatient Counseling).

**View `vw_clinic_program`**

```sql
CREATE VIEW vw_clinic_program AS
SELECT a.id, a.clinic_id, a.clinic_name, a.branch_of, b.program_id AS program_program_id, b.program_name AS program_program_name, b.program_type AS program_program_type
FROM clinics a JOIN programs b ON a.program_id = b.program_id;
```

| id | clinic_id | clinic_name | branch_of | program_program_id | program_program_name | program_program_type |
|---|---|---|---|---|---|---|
| 1 | gd_taxc_1122 | Distributed Standard | legacy-branch-37 | 103176 | Extended Review | Support Group |
| 2 | 2106713 | Adaptive Framework D | compact-branch-38 | 2986219 | Pilot Initiative A | Outpatient Counseling |
| 3 | 506004 | Primary Protocol | composite-branch-39 | 1186079 | Baseline Model | Educational Workshop |
| 4 | 8928507 | Composite Programme | primary-branch-40 | 1562855 | Distributed Cluster | Specialty Clinic |

The view `vw_clinic_charting_software` joins `clinics` with `charting_softwares` to answer: "Which charting software is assigned to which clinics?" It reconstructs the clinic-software assignment fact, showing that clinic `gd_taxc_1122` uses "Primary Review A" (cloud-based with billing) while clinic `2106713` uses "Composite Initiative" (on-premise with scheduling).

**View `vw_clinic_charting_software`**

```sql
CREATE VIEW vw_clinic_charting_software AS
SELECT a.id, a.clinic_id, a.clinic_name, a.branch_of, b.id AS software_id, b.software_id AS software_software_id, b.software_name AS software_software_name
FROM clinics a JOIN charting_softwares b ON a.charting_software_id = b.id;
```

| id | clinic_id | clinic_name | branch_of | software_id | software_software_id | software_software_name |
|---|---|---|---|---|---|---|
| 1 | gd_taxc_1122 | Distributed Standard | legacy-branch-37 | 1 | gd_taxc_2111 | Primary Review A |
| 2 | 2106713 | Adaptive Framework D | compact-branch-38 | 2 | 5917273 | Composite Initiative |
| 3 | 506004 | Primary Protocol | composite-branch-39 | 3 | id_4 | Compact Model |
| 4 | 8928507 | Composite Programme | primary-branch-40 | 4 | 8928496 | Legacy Cluster D |

The view `vw_provider_clinic` joins `providers` with `clinics` to answer: "Which clinic does each provider belong to?" It reconstructs the provider-clinic affiliation fact, showing that provider `100` (Theodore Mcgrath) is affiliated with clinic `gd_taxc_1122` and provider `101` (Account Name) with clinic `2106713`.

**View `vw_provider_clinic`**

```sql
CREATE VIEW vw_provider_clinic AS
SELECT a.provider_id, a.full_name, a.credential, a.state_license, b.id AS clinic_id, b.clinic_id AS clinic_clinic_id, b.clinic_name AS clinic_clinic_name
FROM providers a JOIN clinics b ON a.clinic_id = b.id;
```

| provider_id | full_name | credential | state_license | clinic_id | clinic_clinic_id | clinic_clinic_name |
|---|---|---|---|---|---|---|
| 100 | Theodore Mcgrath | RDN | legacy-state-85 | 1 | gd_taxc_1122 | Distributed Standard |
| 101 | Account Name | CN | compact-state-86 | 2 | 2106713 | Adaptive Framework D |
| 102 | Saipan International Airport | RDN | composite-state-87 | 3 | 506004 | Primary Protocol |
| 103 | Norma Fisher | CN | primary-state-88 | 4 | 8928507 | Composite Programme |

The view `vw_provider_patient_detail` joins `providers` with `providers_patients` and `patients` to answer: "Which patients are treated by which providers?" It reconstructs the provider-patient care fact, showing that provider `100` treats patient `8387541` (a Child with Binge Eating diagnosis) and provider `101` treats patient `10207142` (an Adolescent with Restrictive Eating).

**View `vw_provider_patient_detail`**

```sql
CREATE VIEW vw_provider_patient_detail AS
SELECT a.provider_id, a.full_name, a.credential, b.patient_id AS patient_patient_id, b.full_name AS patient_full_name, b.age_group AS patient_age_group
FROM providers a
  JOIN providers_patients j ON j.provider_id = a.provider_id
  JOIN patients b ON b.patient_id = j.patient_id;
```

| provider_id | full_name | credential | patient_patient_id | patient_full_name | patient_age_group |
|---|---|---|---|---|---|
| 100 | Theodore Mcgrath | RDN | 8387541 | Theodore Mcgrath | Child |
| 100 | Theodore Mcgrath | RDN | 10207142 | Account Name | Adolescent |
| 101 | Account Name | CN | 10207142 | Account Name | Adolescent |
| 101 | Account Name | CN | 7119782 | Saipan International Airport | Adult |
| 102 | Saipan International Airport | RDN | 7119782 | Saipan International Airport | Adult |
| 102 | Saipan International Airport | RDN | gd_acc_160003 | Norma Fisher | Senior |
| 103 | Norma Fisher | CN | gd_acc_160003 | Norma Fisher | Senior |
| 103 | Norma Fisher | CN | 8387541 | Theodore Mcgrath | Child |

The view `vw_provider_provider_detail` joins `providers` with `providers_providers` to answer: "How are providers related to each other?" It reconstructs the provider-to-provider relationship fact, enabling queries about supervisory chains, peer networks, or collaborative care teams within the provider population.

**View `vw_provider_provider_detail`**

```sql
CREATE VIEW vw_provider_provider_detail AS
SELECT a.provider_id, a.full_name, a.credential, b.provider_id AS provider_provider_id, b.full_name AS provider_full_name, b.credential AS provider_credential
FROM providers a
  JOIN providers_providers j ON j.provider_id = a.provider_id
  JOIN providers b ON b.provider_id = j.collaborates_with_provider_id;
```

| provider_id | full_name | credential | provider_provider_id | provider_full_name | provider_credential |
|---|---|---|---|---|---|
| 100 | Theodore Mcgrath | RDN | 100 | Theodore Mcgrath | RDN |
| 100 | Theodore Mcgrath | RDN | 101 | Account Name | CN |
| 101 | Account Name | CN | 101 | Account Name | CN |
| 101 | Account Name | CN | 102 | Saipan International Airport | RDN |
| 102 | Saipan International Airport | RDN | 102 | Saipan International Airport | RDN |
| 102 | Saipan International Airport | RDN | 103 | Norma Fisher | CN |
| 103 | Norma Fisher | CN | 103 | Norma Fisher | CN |
| 103 | Norma Fisher | CN | 100 | Theodore Mcgrath | RDN |

The view `vw_provider_program` joins `providers` with `programs_providers` and `programs` to answer: "Which programmes does each provider deliver?" It reconstructs the provider-programme delivery fact, showing that provider `100` delivers programme "Extended Review" (Support Group) and provider `101` delivers "Pilot Initiative A" (Outpatient Counseling).

**View `vw_provider_program`**

```sql
CREATE VIEW vw_provider_program AS
SELECT a.provider_id, a.full_name, a.credential, a.state_license, b.program_id AS program_program_id, b.program_name AS program_program_name, b.program_type AS program_program_type
FROM providers a JOIN programs b ON a.program_id = b.program_id;
```

| provider_id | full_name | credential | state_license | program_program_id | program_program_name | program_program_type |
|---|---|---|---|---|---|---|
| 100 | Theodore Mcgrath | RDN | legacy-state-85 | 103176 | Extended Review | Support Group |
| 101 | Account Name | CN | compact-state-86 | 2986219 | Pilot Initiative A | Outpatient Counseling |
| 102 | Saipan International Airport | RDN | composite-state-87 | 1186079 | Baseline Model | Educational Workshop |
| 103 | Norma Fisher | CN | primary-state-88 | 1562855 | Distributed Cluster | Specialty Clinic |

The view `vw_patient_provider_detail` joins `patients` with `patients_providers` and `providers` to answer: "Which providers are assigned to each patient?" It reconstructs the patient-provider assignment fact from the patient side, showing that patient `8387541` is assigned to provider `100` (Theodore Mcgrath, RDN) and patient `10207142` to provider `101` (Account Name, CN).

**View `vw_patient_provider_detail`**

```sql
CREATE VIEW vw_patient_provider_detail AS
SELECT a.patient_id, a.full_name, a.age_group, b.provider_id AS provider_provider_id, b.full_name AS provider_full_name, b.credential AS provider_credential
FROM patients a
  JOIN patients_providers j ON j.patient_id = a.patient_id
  JOIN providers b ON b.provider_id = j.provider_id;
```

| patient_id | full_name | age_group | provider_provider_id | provider_full_name | provider_credential |
|---|---|---|---|---|---|
| 8387541 | Theodore Mcgrath | Child | 100 | Theodore Mcgrath | RDN |
| 8387541 | Theodore Mcgrath | Child | 101 | Account Name | CN |
| 10207142 | Account Name | Adolescent | 101 | Account Name | CN |
| 10207142 | Account Name | Adolescent | 102 | Saipan International Airport | RDN |
| 7119782 | Saipan International Airport | Adult | 102 | Saipan International Airport | RDN |
| 7119782 | Saipan International Airport | Adult | 103 | Norma Fisher | CN |
| gd_acc_160003 | Norma Fisher | Senior | 103 | Norma Fisher | CN |
| gd_acc_160003 | Norma Fisher | Senior | 100 | Theodore Mcgrath | RDN |

The view `vw_patient_provider` joins `patients` with `patients_providers` and `providers` to answer: "Which providers serve each patient?" This view provides a streamlined patient-to-provider mapping, showing the direct assignment relationships without additional detail columns.

**View `vw_patient_provider`**

```sql
CREATE VIEW vw_patient_provider AS
SELECT a.patient_id, a.full_name, a.age_group, a.diagnosis, b.provider_id AS provider_provider_id, b.full_name AS provider_full_name, b.credential AS provider_credential
FROM patients a JOIN providers b ON a.provider_id = b.provider_id;
```

| patient_id | full_name | age_group | diagnosis | provider_provider_id | provider_full_name | provider_credential |
|---|---|---|---|---|---|---|
| 8387541 | Theodore Mcgrath | Child | Binge Eating | 100 | Theodore Mcgrath | RDN |
| 10207142 | Account Name | Adolescent | Restrictive Eating | 101 | Account Name | CN |
| 7119782 | Saipan International Airport | Adult | Body Dysmorphia | 102 | Saipan International Airport | RDN |
| gd_acc_160003 | Norma Fisher | Senior | Exercise Addiction | 103 | Norma Fisher | CN |

The view `vw_patient_program` joins `patients` with `programs_patients` and `programs` to answer: "Which programmes is each patient enrolled in?" It reconstructs the patient-programme enrolment fact, showing that patient `8387541` is enrolled in programme "Extended Review" (Support Group) while patient `10207142` is not currently enrolled in any programme.

**View `vw_patient_program`**

```sql
CREATE VIEW vw_patient_program AS
SELECT a.patient_id, a.full_name, a.age_group, a.diagnosis, b.program_id AS program_program_id, b.program_name AS program_program_name, b.program_type AS program_program_type
FROM patients a JOIN programs b ON a.program_id = b.program_id;
```

| patient_id | full_name | age_group | diagnosis | program_program_id | program_program_name | program_program_type |
|---|---|---|---|---|---|---|
| 8387541 | Theodore Mcgrath | Child | Binge Eating | 103176 | Extended Review | Support Group |
| 10207142 | Account Name | Adolescent | Restrictive Eating | 2986219 | Pilot Initiative A | Outpatient Counseling |
| 7119782 | Saipan International Airport | Adult | Body Dysmorphia | 1186079 | Baseline Model | Educational Workshop |
| gd_acc_160003 | Norma Fisher | Senior | Exercise Addiction | 1562855 | Distributed Cluster | Specialty Clinic |

The view `vw_program_provider_detail` joins `programs` with `programs_providers` and `providers` to answer: "Which providers deliver each programme?" It reconstructs the programme-provider staffing fact from the programme side, showing that programme "Extended Review" is delivered by provider `100` (Theodore Mcgrath) and programme "Pilot Initiative A" by provider `101` (Account Name).

**View `vw_program_provider_detail`**

```sql
CREATE VIEW vw_program_provider_detail AS
SELECT a.program_id, a.program_name, a.program_type, b.provider_id AS provider_provider_id, b.full_name AS provider_full_name, b.credential AS provider_credential
FROM programs a
  JOIN programs_providers j ON j.program_id = a.program_id
  JOIN providers b ON b.provider_id = j.provider_id;
```

| program_id | program_name | program_type | provider_provider_id | provider_full_name | provider_credential |
|---|---|---|---|---|---|
| 103176 | Extended Review | Support Group | 100 | Theodore Mcgrath | RDN |
| 103176 | Extended Review | Support Group | 101 | Account Name | CN |
| 2986219 | Pilot Initiative A | Outpatient Counseling | 101 | Account Name | CN |
| 2986219 | Pilot Initiative A | Outpatient Counseling | 102 | Saipan International Airport | RDN |
| 1186079 | Baseline Model | Educational Workshop | 102 | Saipan International Airport | RDN |
| 1186079 | Baseline Model | Educational Workshop | 103 | Norma Fisher | CN |
| 1562855 | Distributed Cluster | Specialty Clinic | 103 | Norma Fisher | CN |
| 1562855 | Distributed Cluster | Specialty Clinic | 100 | Theodore Mcgrath | RDN |

The view `vw_program_patient_detail` joins `programs` with `programs_patients` and `patients` to answer: "Which patients are enrolled in each programme?" It reconstructs the programme-patient enrolment fact from the programme side, showing that programme "Extended Review" serves patient `8387541` (Child, Binge Eating) and programme "Pilot Initiative A" serves patient `10207142` (Adolescent, Restrictive Eating).

**View `vw_program_patient_detail`**

```sql
CREATE VIEW vw_program_patient_detail AS
SELECT a.program_id, a.program_name, a.program_type, b.patient_id AS patient_patient_id, b.full_name AS patient_full_name, b.age_group AS patient_age_group
FROM programs a
  JOIN programs_patients j ON j.program_id = a.program_id
  JOIN patients b ON b.patient_id = j.patient_id;
```

| program_id | program_name | program_type | patient_patient_id | patient_full_name | patient_age_group |
|---|---|---|---|---|---|
| 103176 | Extended Review | Support Group | 8387541 | Theodore Mcgrath | Child |
| 103176 | Extended Review | Support Group | 10207142 | Account Name | Adolescent |
| 2986219 | Pilot Initiative A | Outpatient Counseling | 10207142 | Account Name | Adolescent |
| 2986219 | Pilot Initiative A | Outpatient Counseling | 7119782 | Saipan International Airport | Adult |
| 1186079 | Baseline Model | Educational Workshop | 7119782 | Saipan International Airport | Adult |
| 1186079 | Baseline Model | Educational Workshop | gd_acc_160003 | Norma Fisher | Senior |
| 1562855 | Distributed Cluster | Specialty Clinic | gd_acc_160003 | Norma Fisher | Senior |
| 1562855 | Distributed Cluster | Specialty Clinic | 8387541 | Theodore Mcgrath | Child |

The view `vw_program_clinic` joins `programs` with `clinics` to answer: "Which clinic hosts each programme?" It reconstructs the programme-clinic hosting fact, showing that programme "Extended Review" is hosted at clinic `gd_taxc_1122` ("Distributed Standard") and programme "Pilot Initiative A" at clinic `2106713` ("Adaptive Framework D").

**View `vw_program_clinic`**

```sql
CREATE VIEW vw_program_clinic AS
SELECT a.program_id, a.program_name, a.program_type, a.start_date, b.id AS clinic_id, b.clinic_id AS clinic_clinic_id, b.clinic_name AS clinic_clinic_name
FROM programs a JOIN clinics b ON a.clinic_id = b.id;
```

| program_id | program_name | program_type | start_date | clinic_id | clinic_clinic_id | clinic_clinic_name |
|---|---|---|---|---|---|---|
| 103176 | Extended Review | Support Group | 2022-09-05 | 1 | gd_taxc_1122 | Distributed Standard |
| 2986219 | Pilot Initiative A | Outpatient Counseling | 2023-02-16 | 2 | 2106713 | Adaptive Framework D |
| 1186079 | Baseline Model | Educational Workshop | 2024-07-27 | 3 | 506004 | Primary Protocol |
| 1562855 | Distributed Cluster | Specialty Clinic | 2025-12-11 | 4 | 8928507 | Composite Programme |

The view `vw_clinical_documentation_provider` joins `clinical_documentations` with `providers` to answer: "Which provider authored each clinical document?" It reconstructs the document-provider authorship fact, showing that document `16605652` (a Treatment Plan) was authored by provider `100` (Theodore Mcgrath) and document `43197176` (a Session Note) by provider `101` (Account Name).

**View `vw_clinical_documentation_provider`**

```sql
CREATE VIEW vw_clinical_documentation_provider AS
SELECT a.clinical_documentation_id, a.doc_id, a.doc_type, a.creation_date, b.provider_id AS provider_provider_id, b.full_name AS provider_full_name, b.credential AS provider_credential
FROM clinical_documentations a JOIN providers b ON a.provider_id = b.provider_id;
```

| clinical_documentation_id | doc_id | doc_type | creation_date | provider_provider_id | provider_full_name | provider_credential |
|---|---|---|---|---|---|---|
| 100 | 16605652 | Treatment Plan | 2022-01-13T12:24:00 | 100 | Theodore Mcgrath | RDN |
| 101 | 43197176 | Session Note | 2023-06-24T19:41:00 | 101 | Account Name | CN |
| 102 | 19655015 | Insurance Claim | 2024-11-08T02:58:00 | 102 | Saipan International Airport | RDN |
| 103 | 10207160 | Lab Review | 2025-04-19T09:15:00 | 103 | Norma Fisher | CN |

The view `vw_clinical_documentation_patient` joins `clinical_documentations` with `patients` to answer: "Which patient is each clinical document about?" It reconstructs the document-patient subject fact, showing that document `16605652` concerns patient `8387541` (Theodore Mcgrath, Child, Binge Eating) and document `43197176` concerns patient `10207142` (Account Name, Adolescent, Restrictive Eating).

**View `vw_clinical_documentation_patient`**

```sql
CREATE VIEW vw_clinical_documentation_patient AS
SELECT a.clinical_documentation_id, a.doc_id, a.doc_type, a.creation_date, b.patient_id AS patient_patient_id, b.full_name AS patient_full_name, b.age_group AS patient_age_group
FROM clinical_documentations a JOIN patients b ON a.patient_id = b.patient_id;
```

| clinical_documentation_id | doc_id | doc_type | creation_date | patient_patient_id | patient_full_name | patient_age_group |
|---|---|---|---|---|---|---|
| 100 | 16605652 | Treatment Plan | 2022-01-13T12:24:00 | 8387541 | Theodore Mcgrath | Child |
| 101 | 43197176 | Session Note | 2023-06-24T19:41:00 | 10207142 | Account Name | Adolescent |
| 102 | 19655015 | Insurance Claim | 2024-11-08T02:58:00 | 7119782 | Saipan International Airport | Adult |
| 103 | 10207160 | Lab Review | 2025-04-19T09:15:00 | gd_acc_160003 | Norma Fisher | Senior |

The view `vw_clinical_documentation_charting_software` joins `clinical_documentations` with `charting_softwares` to answer: "Which charting software was used to create each document?" It reconstructs the document-software creation fact, showing that document `16605652` was created using "Primary Review A" (software `1`) and document `43197176` using "Composite Initiative" (software `2`).

**View `vw_clinical_documentation_charting_software`**

```sql
CREATE VIEW vw_clinical_documentation_charting_software AS
SELECT a.clinical_documentation_id, a.doc_id, a.doc_type, a.creation_date, b.id AS software_id, b.software_id AS software_software_id, b.software_name AS software_software_name
FROM clinical_documentations a JOIN charting_softwares b ON a.charting_software_id = b.id;
```

| clinical_documentation_id | doc_id | doc_type | creation_date | software_id | software_software_id | software_software_name |
|---|---|---|---|---|---|---|
| 100 | 16605652 | Treatment Plan | 2022-01-13T12:24:00 | 1 | gd_taxc_2111 | Primary Review A |
| 101 | 43197176 | Session Note | 2023-06-24T19:41:00 | 2 | 5917273 | Composite Initiative |
| 102 | 19655015 | Insurance Claim | 2024-11-08T02:58:00 | 3 | id_4 | Compact Model |
| 103 | 10207160 | Lab Review | 2025-04-19T09:15:00 | 4 | 8928496 | Legacy Cluster D |

The view `vw_charting_software_clinical_documentation_detail` joins `charting_softwares` with `softwares_documentations` and `clinical_documentations` to answer: "Which clinical documents were created using each charting software?" It reconstructs the software-document creation fact from the software side, showing that "Primary Review A" (software `1`) was used to create document `16605652` (Treatment Plan, Draft status) and "Composite Initiative" (software `2`) was used for document `43197176` (Session Note, Pending Review).

**View `vw_charting_software_clinical_documentation_detail`**

```sql
CREATE VIEW vw_charting_software_clinical_documentation_detail AS
SELECT a.id, a.software_id, a.software_name, b.clinical_documentation_id AS documentation_clinical_documentation_id, b.doc_id AS documentation_doc_id, b.doc_type AS documentation_doc_type
FROM charting_softwares a
  JOIN softwares_documentations j ON j.charting_software_id = a.id
  JOIN clinical_documentations b ON b.clinical_documentation_id = j.clinical_documentation_id;
```

| id | software_id | software_name | documentation_clinical_documentation_id | documentation_doc_id | documentation_doc_type |
|---|---|---|---|---|---|
| 1 | gd_taxc_2111 | Primary Review A | 100 | 16605652 | Treatment Plan |
| 1 | gd_taxc_2111 | Primary Review A | 101 | 43197176 | Session Note |
| 2 | 5917273 | Composite Initiative | 101 | 43197176 | Session Note |
| 2 | 5917273 | Composite Initiative | 102 | 19655015 | Insurance Claim |
| 3 | id_4 | Compact Model | 102 | 19655015 | Insurance Claim |
| 3 | id_4 | Compact Model | 103 | 10207160 | Lab Review |
| 4 | 8928496 | Legacy Cluster D | 103 | 10207160 | Lab Review |
| 4 | 8928496 | Legacy Cluster D | 100 | 16605652 | Treatment Plan |

The view `vw_charting_software_provider_detail` joins `charting_softwares` with `softwares_providers` and `providers` to answer: "Which providers use each charting software?" It reconstructs the software-provider usage fact, showing that "Primary Review A" (software `1`) is used by provider `100` (Theodore Mcgrath, RDN) and "Composite Initiative" (software `2`) by provider `101` (Account Name, CN).

**View `vw_charting_software_provider_detail`**

```sql
CREATE VIEW vw_charting_software_provider_detail AS
SELECT a.id, a.software_id, a.software_name, b.provider_id AS provider_provider_id, b.full_name AS provider_full_name, b.credential AS provider_credential
FROM charting_softwares a
  JOIN softwares_providers j ON j.charting_software_id = a.id
  JOIN providers b ON b.provider_id = j.provider_id;
```

| id | software_id | software_name | provider_provider_id | provider_full_name | provider_credential |
|---|---|---|---|---|---|
| 1 | gd_taxc_2111 | Primary Review A | 100 | Theodore Mcgrath | RDN |
| 1 | gd_taxc_2111 | Primary Review A | 101 | Account Name | CN |
| 2 | 5917273 | Composite Initiative | 101 | Account Name | CN |
| 2 | 5917273 | Composite Initiative | 102 | Saipan International Airport | RDN |
| 3 | id_4 | Compact Model | 102 | Saipan International Airport | RDN |
| 3 | id_4 | Compact Model | 103 | Norma Fisher | CN |
| 4 | 8928496 | Legacy Cluster D | 103 | Norma Fisher | CN |
| 4 | 8928496 | Legacy Cluster D | 100 | Theodore Mcgrath | RDN |

### Closing Synthesis

The schema models a clinical service delivery domain through six entity tables and eight junction tables, forming a normalised relational structure that captures clinics, providers, patients, programmes, clinical documents, and charting software along with their many-to-many associations. Foreign keys in `clinics`, `providers`, `patients`, `programs`, and `clinical_documentations` bind entities to their organisational and operational contexts, while the junction tables resolve the complex web of relationships that cannot be expressed through simple foreign key columns alone. The twelve materialised views then reassemble these normalised facts into domain-readable join results, each answering a specific operational question — from "which providers staff which clinics" to "which software was used to create each clinical document." The concrete values in the data — clinic `gd_taxc_1122` hosting programme "Extended Review", provider `100` (Theodore Mcgrath, RDN) treating patient `8387541` (Child, Binge Eating), and document `16605652` (Treatment Plan, Draft) created in "Primary Review A" — ground the abstract schema in the operational reality of clinical service delivery.