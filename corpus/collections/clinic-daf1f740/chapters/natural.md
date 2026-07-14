## Clinical Operations and Care Delivery

Healthcare delivery organizations coordinate a complex ecosystem of facilities, practitioners, patient populations, and digital tools to provide structured treatment programs. At the operational core of this ecosystem are clinics—physical or virtual sites where care is administered—staffed by licensed providers who deliver evidence-based interventions to enrolled patients. Each clinic hosts one or more programs, which define the therapeutic modality, duration, and format of care. Clinical documentation captures the ongoing record of patient encounters, while charting software provides the digital infrastructure for recording, storing, and managing those records. Understanding how these entities interrelate is essential for administrators, clinicians, and technology teams who must ensure that care delivery is both compliant and efficient.

**Table `clinics`**

| id | clinic_id | clinic_name | branch_of | address | city | state | has_telehealth | program_id | charting_software_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | gd_taxc_1122 | Distributed Standard | legacy-branch-37 | distributed-address-72 | integrated-city-34 | distributed-state-84 | true | 103176 | 1 |
| 2 | 2106713 | Adaptive Framework D | compact-branch-38 | baseline-address-73 | seasonal-city-35 | baseline-state-85 | false | 2986219 | 2 |
| 3 | 506004 | Primary Protocol | composite-branch-39 | pilot-address-74 | regional-city-36 | pilot-state-86 | true | 1186079 | 3 |
| 4 | 8928507 | Composite Programme | primary-branch-40 | extended-address-75 | legacy-city-37 | extended-state-87 | false | 1562855 | 4 |

Clinics serve as the foundational organizational units in this care delivery model. Each clinic is identified by a unique internal `id` and a human-readable `clinic_id` string, such as `gd_taxc_1122` for the Distributed Standard clinic. The `clinic_name` field provides a descriptive label—Distributed Standard, Adaptive Framework D, Primary Protocol, Composite Programme—while the `branch_of` column indicates whether the clinic operates as a primary site or as a legacy, compact, composite, or primary branch. Geographic presence is captured through `address`, `city`, and `state` fields; for instance, the Distributed Standard clinic resides at distributed-address-72 in integrated-city-34, distributed-state-84. The boolean `has_telehealth` flag distinguishes clinics that offer remote care from those requiring in-person attendance. Each clinic is associated with a single `program_id` and a `charting_software_id`, anchoring it to a specific therapeutic program and the digital tool used for documentation.

**Table `providers`**

| provider_id | full_name | credential | state_license | employment_status | years_experience | ed_experience_years | resides_in_state | clinic_id | program_id |
|---|---|---|---|---|---|---|---|---|---|
| 100 | Theodore Mcgrath | RDN | legacy-state-85 | Part-Time | 16 | 44 | integrated-resides-40 | 1 | 103176 |
| 101 | Account Name | CN | compact-state-86 | Full-Time | 22 | 54 | seasonal-resides-41 | 2 | 2986219 |
| 102 | Saipan International Airport | RDN | composite-state-87 | Part-Time | 28 | 64 | regional-resides-42 | 3 | 1186079 |
| 103 | Norma Fisher | CN | primary-state-88 | Full-Time | 34 | 74 | legacy-resides-43 | 4 | 1562855 |

Providers are the licensed professionals who deliver care within this framework. The `providers` table records each practitioner's `provider_id`, `full_name`, and professional `credential`—RDN (Registered Dietitian Nutritionist) and CN (Certified Nutritionist) appear in the data. Employment details include `employment_status` (Part-Time or Full-Time), `years_experience` in the broader field, and `ed_experience_years` specifically in eating disorder treatment, which ranges from 44 to 74 years across the sample. A provider's `state_license` and `resides_in_state` fields capture regulatory and geographic information. Each provider is assigned to a `clinic_id` and a `program_id`, establishing their primary site of practice and the program under which they operate. For example, Theodore Mcgrath (provider 100), an RDN with 16 years of general experience and 44 years of eating disorder experience, is employed part-time and assigned to clinic 1 and program 103176.

**Table `patients`**

| patient_id | full_name | age_group | diagnosis | insurance_provider | has_caregiver | enrolled_in_program | provider_id | program_id |
|---|---|---|---|---|---|---|---|---|
| 8387541 | Theodore Mcgrath | Child | Binge Eating | seasonal-insuranc-11 | false | true | 100 | 103176 |
| 10207142 | Account Name | Adolescent | Restrictive Eating | regional-insuranc-12 | true | false | 101 | 2986219 |
| 7119782 | Saipan International Airport | Adult | Body Dysmorphia | legacy-insuranc-13 | false | true | 102 | 1186079 |
| gd_acc_160003 | Norma Fisher | Senior | Exercise Addiction | compact-insuranc-14 | true | false | 103 | 1562855 |

Patients represent the individuals receiving care. The `patients` table captures each patient's `patient_id`, `full_name`, `age_group` (Child, Adolescent, Adult, or Senior), and primary `diagnosis`. Diagnoses in the dataset include Binge Eating, Restrictive Eating, Body Dysmorphia, and Exercise Addiction. Administrative details such as `insurance_provider`, `has_caregiver` (a boolean indicating whether the patient has a support person), and `enrolled_in_program` status are recorded. Each patient is linked to a `provider_id` and a `program_id`, establishing the clinical relationship. Patient 8387541, a Child diagnosed with Binge Eating, is insured by seasonal-insuranc-11, does not have a caregiver, and is enrolled in program 103176 under provider 100.

**Table `programs`**

| program_id | program_name | program_type | start_date | end_date | is_online | is_ready_made | clinic_id |
|---|---|---|---|---|---|---|---|
| 103176 | Extended Review | Support Group | 2022-09-05 | 2022-09-01 | true | true | 1 |
| 2986219 | Pilot Initiative A | Outpatient Counseling | 2023-02-16 | 2023-02-12 | false | false | 2 |
| 1186079 | Baseline Model | Educational Workshop | 2024-07-27 | 2024-07-23 | true | true | 3 |
| 1562855 | Distributed Cluster | Specialty Clinic | 2025-12-11 | 2025-12-07 | false | false | 4 |

Programs define the structured therapeutic interventions offered by the organization. Each program has a `program_id`, `program_name`, and `program_type`—Support Group, Outpatient Counseling, Educational Workshop, and Specialty Clinic appear in the data. Programs have a defined `start_date` and `end_date`, though in the sample data the end dates precede the start dates, suggesting these may represent planned or projected timelines. The `is_online` flag indicates whether the program is delivered remotely, while `is_ready_made` signals whether the program curriculum is pre-built or customized. Program 103176, Extended Review, is a Support Group that is both online and ready-made, running from 2022-09-05 to 2022-09-01 under clinic 1.

**Table `clinical_documentations`**

| clinical_documentation_id | doc_id | doc_type | creation_date | status | contains_supplement_review | is_public_facing | provider_id | patient_id | charting_software_id |
|---|---|---|---|---|---|---|---|---|---|
| 100 | 16605652 | Treatment Plan | 2022-01-13T12:24:00 | Draft | false | true | 100 | 8387541 | 1 |
| 101 | 43197176 | Session Note | 2023-06-24T19:41:00 | Pending Review | true | false | 101 | 10207142 | 2 |
| 102 | 19655015 | Insurance Claim | 2024-11-08T02:58:00 | Finalized | false | true | 102 | 7119782 | 3 |
| 103 | 10207160 | Lab Review | 2025-04-19T09:15:00 | Submitted | true | false | 103 | gd_acc_160003 | 4 |

Clinical documentation is the formal record of patient care activities. The `clinical_documentations` table stores each document with a `clinical_documentation_id`, a secondary `doc_id`, and a `doc_type`—Treatment Plan, Session Note, Insurance Claim, and Lab Review are represented. Documents have a `creation_date` with full timestamp precision, a `status` (Draft, Pending Review, Finalized, Submitted), and flags for `contains_supplement_review` and `is_public_facing`. Each document is authored by a `provider_id`, pertains to a `patient_id`, and is stored within a specific `charting_software_id`. Document 100, a Treatment Plan created on 2022-01-13 by provider 100 for patient 8387541, is in Draft status, is public-facing, and was created using charting software 1.

**Table `charting_softwares`**

| id | software_id | software_name | version | has_billing_module | has_scheduling_module | is_cloud_based |
|---|---|---|---|---|---|---|
| 1 | gd_taxc_2111 | Primary Review A | seasonal-version-71 | true | false | true |
| 2 | 5917273 | Composite Initiative | regional-version-72 | false | true | false |
| 3 | id_4 | Compact Model | legacy-version-73 | true | false | true |
| 4 | 8928496 | Legacy Cluster D | compact-version-74 | false | true | false |

Charting software provides the digital platform for clinical documentation. The `charting_softwares` table lists each software product with an `id`, `software_id`, `software_name`, and `version`. Feature flags indicate whether the software includes a `has_billing_module`, a `has_scheduling_module`, and whether it is `is_cloud_based`. Software 1, Primary Review A (version seasonal-version-71), is cloud-based and includes a billing module but no scheduling module. Software 2, Composite Initiative, is on-premise and includes scheduling but not billing. The pattern alternates across the four products, suggesting a deliberate feature differentiation strategy.

The relationships between these core entities are captured through junction tables that model many-to-many associations.

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

The `clinics_providers` junction table records which providers are affiliated with which clinics, supporting the possibility that a provider may work across multiple clinic locations. This table bridges the `clinics` and `providers` tables, enabling administrators to understand staffing distribution across the organization's physical and virtual sites.

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

The `providers_patients` table establishes the direct clinical relationship between providers and the patients they treat. This association is critical for care coordination, ensuring that each patient's records are attributable to the correct treating clinician and that provider caseloads can be monitored.

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

The `providers_providers` table captures peer-to-peer relationships among providers, which may represent supervisory relationships, collaborative care arrangements, or team-based assignments. This self-referential structure allows the organization to model hierarchies and partnerships within the clinical staff.

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

The `patients_providers` table provides an additional layer of patient-provider association, potentially capturing secondary care relationships, referrals, or co-treatment arrangements beyond the primary assignment recorded in the `patients` table.

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

The `programs_providers` table links providers to the programs they deliver, enabling the organization to track which clinicians are qualified for or assigned to specific therapeutic modalities. This supports workforce planning and ensures that program staffing aligns with provider credentials and experience.

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

The `programs_patients` table records patient enrollment in specific programs, providing a detailed view of program participation that complements the `enrolled_in_program` flag in the `patients` table. This allows for tracking of multi-program enrollment and program transitions.

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

The `softwares_documentations` table associates charting software with clinical documents, documenting which software platform was used to create each record. This supports audit trails, software usage analytics, and compliance reporting.

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

The `softwares_providers` table records which providers are authorized to use which charting software products. This access control information is essential for security management and training planning.

Beyond the base tables, a set of analytical views synthesizes the data to answer specific operational questions.

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

The `vw_clinic_provider_detail` view joins clinic and provider records to answer which practitioners are stationed at each clinic location. Reading the first row reveals that clinic 1 (Distributed Standard) is staffed by provider 100 (Theodore Mcgrath, RDN), providing administrators with a clear staffing roster. The second row shows clinic 2 (Adaptive Framework D) with provider 101 (Account Name, CN), confirming a one-to-one provider-to-clinic assignment in this dataset.

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

The `vw_clinic_program` view links clinics to their associated programs, answering which therapeutic interventions are available at each site. The first row connects clinic 1 to program 103176 (Extended Review, a Support Group), while the second row links clinic 2 to program 2986219 (Pilot Initiative A, Outpatient Counseling). This view is essential for patients and referral sources seeking to understand program availability by location.

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

The `vw_clinic_charting_software` view maps clinics to the charting software they use, answering which digital tools are deployed at each site. Clinic 1 uses software 1 (Primary Review A), which is cloud-based with billing capabilities. Clinic 2 uses software 2 (Composite Initiative), which is on-premise with scheduling but no billing module. This view supports IT planning and software licensing management.

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

The `vw_provider_clinic` view presents the provider-to-clinic relationship from the practitioner's perspective, answering which clinic each provider is assigned to. Provider 100 (Theodore Mcgrath) is assigned to clinic 1 (Distributed Standard), and provider 103 (Norma Fisher) is assigned to clinic 4 (Composite Programme). This view is useful for provider onboarding and scheduling.

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

The `vw_provider_patient_detail` view joins provider and patient records to answer which patients are under each provider's care. The first row shows provider 100 (Theodore Mcgrath) treating patient 8387541 (a Child with Binge Eating), while the second row shows provider 101 (Account Name) treating patient 10207142 (an Adolescent with Restrictive Eating). This view supports caseload management and care coordination.

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

The `vw_provider_provider_detail` view presents provider-to-provider relationships, answering which practitioners are linked to one another. This view is critical for understanding supervisory chains, collaborative care teams, and peer consultation networks within the organization.

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

The `vw_provider_program` view links providers to the programs they deliver, answering which therapeutic modalities each practitioner is involved in. Provider 100 is associated with program 103176 (Extended Review, Support Group), and provider 103 is associated with program 1562855 (Distributed Cluster, Specialty Clinic). This view supports credentialing and program staffing analysis.

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

The `vw_patient_provider_detail` view presents the patient-to-provider relationship from the patient's perspective, answering which clinician each patient is assigned to. Patient 8387541 is assigned to provider 100 (Theodore Mcgrath), and patient gd_acc_160003 (a Senior with Exercise Addiction) is assigned to provider 103 (Norma Fisher). This view is useful for patient-facing communications and care navigation.

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

The `vw_patient_provider` view provides a streamlined patient-to-provider mapping, answering the fundamental question of care assignment. This view is used for referral tracking, billing attribution, and quality measurement.

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

The `vw_patient_program` view links patients to the programs they are enrolled in, answering which therapeutic interventions each patient is receiving. Patient 8387541 is enrolled in program 103176 (Extended Review), while patient 10207142 is associated with program 2986219 (Pilot Initiative A). This view supports program utilization reporting and outcome tracking.

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

The `vw_program_provider_detail` view joins program and provider records to answer which practitioners deliver each program. Program 103176 (Extended Review) is delivered by provider 100 (Theodore Mcgrath), and program 1562855 (Distributed Cluster) is delivered by provider 103 (Norma Fisher). This view is essential for program management and capacity planning.

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

The `vw_program_patient_detail` view links programs to their enrolled patients, answering which individuals are participating in each therapeutic intervention. Program 103176 includes patient 8387541 (Child, Binge Eating), and program 2986219 includes patient 10207142 (Adolescent, Restrictive Eating). This view supports program enrollment monitoring and outcome analysis.

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

The `vw_program_clinic` view connects programs to their host clinics, answering which site delivers each therapeutic intervention. Program 103176 (Extended Review) is hosted at clinic 1 (Distributed Standard), and program 1562855 (Distributed Cluster) is hosted at clinic 4 (Composite Programme). This view is used for facility utilization and program scheduling.

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

The `vw_clinical_documentation_provider` view joins clinical documents with provider records to answer which clinician authored each document. Document 100 (Treatment Plan) was authored by provider 100 (Theodore Mcgrath), and document 101 (Session Note) was authored by provider 101 (Account Name). This view supports documentation accountability and provider productivity metrics.

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

The `vw_clinical_documentation_patient` view links clinical documents to their corresponding patients, answering which patient each record pertains to. Document 100 (Treatment Plan) pertains to patient 8387541, and document 102 (Insurance Claim) pertains to patient 7119782. This view is essential for patient record management and regulatory compliance.

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

The `vw_clinical_documentation_charting_software` view connects clinical documents to the charting software used to create them, answering which digital platform was used for each record. Document 100 was created in software 1 (Primary Review A), and document 103 was created in software 4 (Legacy Cluster D). This view supports software usage analytics and data migration planning.

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

The `vw_charting_software_clinical_documentation_detail` view presents the charting software-to-document relationship from the software's perspective, answering which documents were created within each platform. Software 1 (Primary Review A) contains document 100 (Treatment Plan), and software 4 (Legacy Cluster D) contains document 103 (Lab Review). This view is used for software performance monitoring and feature adoption analysis.

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

The `vw_charting_software_provider_detail` view links charting software to the providers authorized to use it, answering which practitioners have access to each platform. This view supports access management, training scheduling, and security auditing.

## Synthesis

The clinical operations domain described here encompasses six core entity types—clinics, providers, patients, programs, clinical documents, and charting software—interconnected through fourteen relational tables and twenty analytical views. Clinics anchor the physical and virtual infrastructure, providers deliver care under defined credentials and employment terms, patients receive structured interventions, programs define the therapeutic approach, documents capture the care record, and software enables digital documentation. The junction tables model the many-to-many relationships that arise when practitioners work across sites, patients participate in multiple programs, and documents are created within specific software platforms. The views synthesize these relationships into actionable perspectives: staffing rosters, program availability by location, caseload assignments, software deployment maps, and documentation accountability. Together, this data architecture supports the operational needs of a healthcare delivery organization seeking to coordinate care across multiple sites, modalities, and digital tools while maintaining clear audit trails and compliance records.