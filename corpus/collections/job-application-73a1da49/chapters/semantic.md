The job application ecosystem captures the full lifecycle of a candidate's interaction with a hiring organization: from the applicant's personal profile and work history, through the submission of a specific application, to the supporting documentation of references and educational credentials. The relational model normalizes this domain into eleven base tables that separate concerns—personal identity, organizational identity, application metadata, employment history, education history, and references—while junction tables resolve many-to-many associations that the core entities cannot express in isolation. Views then reassemble these normalized fragments into flat, query-ready projections that answer the practical questions recruiters and administrators actually ask.

## Entity Types and Their Attributes

The model's core entities are `applicants`, `organizations`, and `job_applications`. The `applicants` table stores the personal identity of each candidate. Its primary key is `id`, a surrogate integer that uniquely identifies the person across the system. The natural-identity columns `first_name`, `last_name`, and `middle_name` carry the applicant's name; for example, applicant `1000` is "Stephanie Collins Paul Allen Baseline Corridor D", while applicant `1003` is "Katherine Snyder Susan Wagner Primary Survey A". Contact information is split across `home_phone` and `cell_phone`, and the physical address is decomposed into `street_address`, `city`, `state`, and `zip_code`. Boolean flags such as `employment_eligibility`, `has_drivers_license`, `criminal_history`, `currently_employed`, and `previous_applicant` capture compliance and availability predicates. The column `ssn` holds a pseudo-SSN value like `legacy-ssn-43` for applicant `1000`. Audit timestamps `created_at` and `updated_at` record when the profile was first inserted and last modified.

The `organizations` table is the counterpart to applicants. Its primary key is `organization_id`, and the business name lives in `organization_name`. Address and contact columns (`street_address`, `city`, `state`, `zip_code`, `telephone`, `fax`) mirror the address structure in `applicants`. The boolean `eopo_status` indicates whether the organization holds a particular certification; for instance, `Oscar Health Inc.` (organization `2`) has `eopo_status = true`, whereas `Staples Inc.` (organization `1`) has `eopo_status = false`.

The `job_applications` table is the central transactional entity. Its surrogate primary key is `id`, and the business-facing `application_id` carries values such as `505997`, `1250196`, `124`, and `IVC20det40`. The column `submission_date` records when the application was filed (e.g., `2025-04-24T03:57:00` for application `1`). The columns `desired_position`, `desired_wage`, `availability_status`, `overtime_eligibility`, `preferred_shift`, `shift_flexibility`, and `earliest_start_date` capture the applicant's stated preferences. Foreign keys `applicant_id` and `organization_id` anchor the application to its originator and the hiring organization, respectively.

**Table `job_applications`**

| id | application_id | submission_date | desired_position | desired_wage | availability_status | overtime_eligibility | preferred_shift | shift_flexibility | earliest_start_date | applicant_id | organization_id |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 505997 | 2025-04-24T03:57:00 | extended-desired-27 | 30.51 | Full Time | true | integrated-preferre-82 | true | 2025-04-18 | 1000 | 1 |
| 2 | 1250196 | 2022-09-08T10:14:00 | integrated-desired-28 | 26.04 | Part Time | false | seasonal-preferre-83 | false | 2022-09-02 | 1001 | 2 |
| 3 | 124 | 2023-02-19T17:31:00 | seasonal-desired-29 | 33.06 | Unavailable | true | regional-preferre-84 | true | 2023-02-13 | 1002 | 3 |
| 4 | IVC20det40 | 2024-07-03T00:48:00 | regional-desired-30 | 12.74 | Full Time | false | legacy-preferre-85 | false | 2024-07-24 | 1003 | 4 |

**Table `applicants`**

| id | ssn | first_name | last_name | middle_name | home_phone | cell_phone | street_address | city | state | zip_code | age_eligible | employment_eligibility | has_drivers_license | license_state | license_number | criminal_history | currently_employed | previous_applicant | last_application_date | organization_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 1000 | legacy-ssn-43 | Stephanie Collins | Paul Allen | Baseline Corridor D | regional-home-54 | distributed-cell-72 | composite-street-15 | integrated-city-34 | distributed-state-84 | 69434 | false | false | true | compact-license-86 | LIC-2589 | extended-criminal-39 | false | true | 2023-10-06 | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 1001 | compact-ssn-44 | Janice Johnston | Heather Beasley | Distributed Series | legacy-home-55 | baseline-cell-73 | primary-street-16 | seasonal-city-35 | baseline-state-85 | 13589 | true | true | false | composite-license-87 | LIC-2596 | integrated-criminal-40 | true | false | 2024-03-17 | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 1002 | composite-ssn-45 | Upal Saha | Audrey Taylor | Adaptive Assessment | compact-home-56 | pilot-cell-74 | adaptive-street-17 | regional-city-36 | pilot-state-86 | 9bb5fec0-8fcc-11eb-924d-9cd76263cbd0 | false | false | true | primary-license-88 | LIC-2603 | seasonal-criminal-41 | false | true | 2025-08-01 | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 1003 | primary-ssn-46 | Katherine Snyder | Susan Wagner | Primary Survey A | composite-home-57 | extended-cell-75 | distributed-street-18 | legacy-city-37 | extended-state-87 | 1250214 | true | true | false | adaptive-license-89 | LIC-2610 | regional-criminal-42 | true | false | 2022-01-12 | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

**Table `organizations`**

| organization_id | organization_name | street_address | city | state | zip_code | telephone | fax | eopo_status |
|---|---|---|---|---|---|---|---|---|
| 1 | Staples Inc. | composite-street-15 | integrated-city-34 | distributed-state-84 | 69434 | adaptive-telephon-23 | distributed-fax-12 | false |
| 2 | Oscar Health Inc. | primary-street-16 | seasonal-city-35 | baseline-state-85 | 13589 | distributed-telephon-24 | baseline-fax-13 | true |
| 3 | Atlantic Richfield | adaptive-street-17 | regional-city-36 | pilot-state-86 | 9bb5fec0-8fcc-11eb-924d-9cd76263cbd0 | baseline-telephon-25 | pilot-fax-14 | false |
| 4 | Port Loko | distributed-street-18 | legacy-city-37 | extended-state-87 | 1250214 | pilot-telephon-26 | extended-fax-15 | true |

## Supporting Records and Junction Tables

Beyond the core trio, the model stores detailed background information in three dedicated tables. The `employment_records` table holds one row per prior position. Its primary key is `employment_record_id`. Columns `start_date` and `end_date` delimit the employment period, while `salary` records the compensation rate (e.g., `13.94` for record `1`). The `position_title` column carries values like "Extended Model" and "Pilot Cluster A". The `reason_for_leaving`, `contact_permission`, `employer_name`, `employer_address`, and `employer_phone` fields provide additional context. Each record is linked to an applicant via `applicant_id` and to an organization via `organization_id`.

**Table `employment_records`**

| employment_record_id | start_date | end_date | salary | position_title | reason_for_leaving | contact_permission | employer_name | employer_address | employer_phone | applicant_id | organization_id | created_at |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 2022-09-05 | 2022-09-01 | 13.94 | Extended Model | compact-reason-26 | Brian Hamilton | Air Products & Chemicals Inc | National University of Singapore | Gazprom Neft | 1000 | 1 | 2025-01-01 00:14:00 |
| 2 | 2023-02-16 | 2023-02-12 | 18.47 | Pilot Cluster A | composite-reason-27 | Distribution Settings | AT&T Technologies | Continental Group | Column Name cannot be empty | 1001 | 2 | 2025-02-06 03:14:00 |
| 3 | 2024-07-27 | 2024-07-23 | 66.14 | Baseline Review | primary-reason-28 | Alexandria Pugh | Beam Global | The College-Ready Promise | Altria Group Inc | 1002 | 3 | 2025-03-11 06:14:00 |
| 4 | 2025-12-11 | 2025-12-07 | 61.82 | Distributed Initiative | adaptive-reason-29 | Sarah Villanueva | Staples Inc. | LINK Interchange Network Ltd | McDonnell Douglas | 1003 | 4 | 2025-04-16 09:14:00 |

The `education_records` table mirrors this structure for academic history. Its primary key is `education_record_id`. The columns `institution_name`, `institution_address`, and `institution_phone` identify the school. `years_attended` is a numeric value (e.g., `16.70` for record `1`), `course_of_study` stores the field of study, and `degree_or_diploma` and `education_level` classify the credential. The `education_level` column takes values such as "High School", "College", "Trade", and "Technical". Foreign keys `applicant_id` and `organization_id` tie the record to the candidate and the organization.

**Table `education_records`**

| education_record_id | institution_name | institution_address | institution_phone | years_attended | course_of_study | degree_or_diploma | education_level | applicant_id | organization_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | Extended Corridor | extended-institut-99 | adaptive-institut-23 | 16.70 | composite-course-75 | extended-degree-15 | High School | 1000 | 1 |
| 2 | Pilot Series A | integrated-institut-100 | distributed-institut-24 | 19.40 | primary-course-76 | integrated-degree-16 | College | 1001 | 2 |
| 3 | Baseline Assessment | seasonal-institut-101 | baseline-institut-25 | 22.10 | adaptive-course-77 | seasonal-degree-17 | Trade | 1002 | 3 |
| 4 | Distributed Survey | regional-institut-102 | pilot-institut-26 | 24.80 | distributed-course-78 | regional-degree-18 | Technical | 1003 | 4 |

The `references` table stores professional or personal references. Its primary key is `reference_id`. The columns `full_name`, `address`, and `phone` identify the reference, while `relationship_type` (e.g., "Supervisor", "Manager", "Owner", "Personal") and the boolean `is_relative` describe the nature of the relationship. The foreign key `applicant_id` links the reference to the candidate.

**Table `references`**

| reference_id | full_name | address | phone | relationship_type | is_relative | applicant_id |
|---|---|---|---|---|---|---|
| 1 | Theodore Mcgrath | distributed-address-72 | compact-phone-26 | Supervisor | false | 1000 |
| 2 | Account Name | baseline-address-73 | composite-phone-27 | Manager | true | 1001 |
| 3 | Saipan International Airport | pilot-address-74 | primary-phone-28 | Owner | false | 1002 |
| 4 | Norma Fisher | extended-address-75 | adaptive-phone-29 | Personal | true | 1003 |

Several junction tables resolve many-to-many relationships that the core entities cannot express alone. The table `applications_references` links job applications to references, enabling a single application to cite multiple references and a single reference to support multiple applications. The table `applications_records` links job applications to employment or education records, allowing an application to reference multiple background records. The table `applicants_applications` provides an explicit association between applicants and their applications, which is useful when the direct foreign key in `job_applications` is insufficient for audit or archival purposes. The table `organizations_applications` links organizations to the applications they receive, and the table `organizations_applicants` links organizations to the applicants who have interacted with them. These junction tables ensure that the model remains normalized while preserving the full connectivity of the domain.

**Table `applications_references`**

| job_application_id | reference_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

**Table `applications_records`**

| job_application_id | employment_record_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

**Table `applicants_applications`**

| applicant_id | job_application_id |
|---|---|
| 1000 | 1 |
| 1000 | 2 |
| 1001 | 2 |
| 1001 | 3 |
| 1002 | 3 |
| 1002 | 4 |
| 1003 | 4 |
| 1003 | 1 |

**Table `organizations_applications`**

| organization_id | job_application_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

**Table `organizations_applicants`**

| organization_id | applicant_id |
|---|---|
| 1 | 1000 |
| 1 | 1001 |
| 2 | 1001 |
| 2 | 1002 |
| 3 | 1002 |
| 3 | 1003 |
| 4 | 1003 |
| 4 | 1000 |

## View Projections and Domain Facts

The views materialize the normalized schema into flat, queryable surfaces. Each view performs a join that reconstructs a domain fact from two or more base tables.

The view `v_job_application_applicant` joins `job_applications` to `applicants` on `applicant_id`, producing a single row per application that combines the application's metadata with the applicant's personal profile. For application `1` (application_id `505997`), the view yields the desired position "extended-desired-27", the desired wage `30.51`, and the applicant's name "Stephanie Collins Paul Allen Baseline Corridor D" alongside the home phone and address. This view answers the question: "What did this applicant request, and who are they?"

**View `v_job_application_applicant`**

```sql
CREATE VIEW v_job_application_applicant AS
SELECT a.id, a.application_id, a.submission_date, a.desired_position, b.id AS applicant_id, b.ssn AS applicant_ssn, b.first_name AS applicant_first_name
FROM job_applications a JOIN applicants b ON a.applicant_id = b.id;
```

| id | application_id | submission_date | desired_position | applicant_id | applicant_ssn | applicant_first_name |
|---|---|---|---|---|---|---|
| 1 | 505997 | 2025-04-24T03:57:00 | extended-desired-27 | 1000 | legacy-ssn-43 | Stephanie Collins |
| 2 | 1250196 | 2022-09-08T10:14:00 | integrated-desired-28 | 1001 | compact-ssn-44 | Janice Johnston |
| 3 | 124 | 2023-02-19T17:31:00 | seasonal-desired-29 | 1002 | composite-ssn-45 | Upal Saha |
| 4 | IVC20det40 | 2024-07-03T00:48:00 | regional-desired-30 | 1003 | primary-ssn-46 | Katherine Snyder |

The view `v_job_application_organization` joins `job_applications` to `organizations` on `organization_id`, producing a row that pairs the application's preferences with the hiring organization's identity. For application `2` (application_id `1250196`), the view shows the desired position "integrated-desired-28", the desired wage `26.04`, and the organization name "Oscar Health Inc." along with its `eopo_status` of `true`. This view answers: "Which organization received this application, and what are the application's terms?"

**View `v_job_application_organization`**

```sql
CREATE VIEW v_job_application_organization AS
SELECT a.id, a.application_id, a.submission_date, a.desired_position, b.organization_id AS organization_organization_id, b.organization_name AS organization_organization_name, b.street_address AS organization_street_address
FROM job_applications a JOIN organizations b ON a.organization_id = b.organization_id;
```

| id | application_id | submission_date | desired_position | organization_organization_id | organization_organization_name | organization_street_address |
|---|---|---|---|---|---|---|
| 1 | 505997 | 2025-04-24T03:57:00 | extended-desired-27 | 1 | Staples Inc. | composite-street-15 |
| 2 | 1250196 | 2022-09-08T10:14:00 | integrated-desired-28 | 2 | Oscar Health Inc. | primary-street-16 |
| 3 | 124 | 2023-02-19T17:31:00 | seasonal-desired-29 | 3 | Atlantic Richfield | adaptive-street-17 |
| 4 | IVC20det40 | 2024-07-03T00:48:00 | regional-desired-30 | 4 | Port Loko | distributed-street-18 |

The view `v_job_application_reference_detail` joins `job_applications` to `references` through the junction table `applications_references`, producing a row per application-reference pair. For application `1`, the view surfaces the reference "Theodore Mcgrath" with relationship type "Supervisor" and `is_relative = false`. This view answers: "Which references back this specific application, and what is their relationship to the applicant?"

**View `v_job_application_reference_detail`**

```sql
CREATE VIEW v_job_application_reference_detail AS
SELECT a.id, a.application_id, a.submission_date, b.reference_id AS reference_reference_id, b.full_name AS reference_full_name, b.address AS reference_address
FROM job_applications a
  JOIN applications_references j ON j.job_application_id = a.id
  JOIN references b ON b.reference_id = j.reference_id;
```

| id | application_id | submission_date | reference_reference_id | reference_full_name | reference_address |
|---|---|---|---|---|---|
| 1 | 505997 | 2025-04-24T03:57:00 | 1 | Theodore Mcgrath | distributed-address-72 |
| 1 | 505997 | 2025-04-24T03:57:00 | 2 | Account Name | baseline-address-73 |
| 2 | 1250196 | 2022-09-08T10:14:00 | 2 | Account Name | baseline-address-73 |
| 2 | 1250196 | 2022-09-08T10:14:00 | 3 | Saipan International Airport | pilot-address-74 |
| 3 | 124 | 2023-02-19T17:31:00 | 3 | Saipan International Airport | pilot-address-74 |
| 3 | 124 | 2023-02-19T17:31:00 | 4 | Norma Fisher | extended-address-75 |
| 4 | IVC20det40 | 2024-07-03T00:48:00 | 4 | Norma Fisher | extended-address-75 |
| 4 | IVC20det40 | 2024-07-03T00:48:00 | 1 | Theodore Mcgrath | distributed-address-72 |

The view `v_job_application_employment_record_detail` joins `job_applications` to `employment_records` through the junction table `applications_records`, producing a row per application-employment-record pair. For application `1`, the view yields the employment record with position title "Extended Model", salary `13.94`, and employer "Air Products & Chemicals Inc". This view answers: "Which employment records are cited in this application?"

**View `v_job_application_employment_record_detail`**

```sql
CREATE VIEW v_job_application_employment_record_detail AS
SELECT a.id, a.application_id, a.submission_date, b.employment_record_id AS record_employment_record_id, b.start_date AS record_start_date, b.end_date AS record_end_date
FROM job_applications a
  JOIN applications_records j ON j.job_application_id = a.id
  JOIN employment_records b ON b.employment_record_id = j.employment_record_id;
```

| id | application_id | submission_date | record_employment_record_id | record_start_date | record_end_date |
|---|---|---|---|---|---|
| 1 | 505997 | 2025-04-24T03:57:00 | 1 | 2022-09-05 | 2022-09-01 |
| 1 | 505997 | 2025-04-24T03:57:00 | 2 | 2023-02-16 | 2023-02-12 |
| 2 | 1250196 | 2022-09-08T10:14:00 | 2 | 2023-02-16 | 2023-02-12 |
| 2 | 1250196 | 2022-09-08T10:14:00 | 3 | 2024-07-27 | 2024-07-23 |
| 3 | 124 | 2023-02-19T17:31:00 | 3 | 2024-07-27 | 2024-07-23 |
| 3 | 124 | 2023-02-19T17:31:00 | 4 | 2025-12-11 | 2025-12-07 |
| 4 | IVC20det40 | 2024-07-03T00:48:00 | 4 | 2025-12-11 | 2025-12-07 |
| 4 | IVC20det40 | 2024-07-03T00:48:00 | 1 | 2022-09-05 | 2022-09-01 |

The view `v_job_application_education_record_detail` joins `job_applications` to `education_records` through the junction table `applications_records`, producing a row per application-education-record pair. For application `1`, the view surfaces the education record from institution "Extended Corridor" with education level "High School" and `years_attended = 16.70`. This view answers: "Which education records are cited in this application?"

**View `v_job_application_education_record_detail`**

```sql
CREATE VIEW v_job_application_education_record_detail AS
SELECT a.id, a.application_id, a.submission_date, b.education_record_id AS record_education_record_id, b.institution_name AS record_institution_name, b.institution_address AS record_institution_address
FROM job_applications a
  JOIN applications_records j ON j.job_application_id = a.id
  JOIN education_records b ON b.education_record_id = j.education_record_id;
```

| id | application_id | submission_date | record_education_record_id | record_institution_name | record_institution_address |
|---|---|---|---|---|---|
| 1 | 505997 | 2025-04-24T03:57:00 | 1 | Extended Corridor | extended-institut-99 |
| 1 | 505997 | 2025-04-24T03:57:00 | 2 | Pilot Series A | integrated-institut-100 |
| 2 | 1250196 | 2022-09-08T10:14:00 | 2 | Pilot Series A | integrated-institut-100 |
| 2 | 1250196 | 2022-09-08T10:14:00 | 3 | Baseline Assessment | seasonal-institut-101 |
| 3 | 124 | 2023-02-19T17:31:00 | 3 | Baseline Assessment | seasonal-institut-101 |
| 3 | 124 | 2023-02-19T17:31:00 | 4 | Distributed Survey | regional-institut-102 |
| 4 | IVC20det40 | 2024-07-03T00:48:00 | 4 | Distributed Survey | regional-institut-102 |
| 4 | IVC20det40 | 2024-07-03T00:48:00 | 1 | Extended Corridor | extended-institut-99 |

The view `v_applicant_job_application_detail` joins `applicants` to `job_applications` on `applicant_id`, producing a row per application that includes the applicant's full profile alongside the application's metadata. For applicant `1001` (Janice Johnston), the view shows the application with desired position "integrated-desired-28", desired wage `26.04`, and availability status "Part Time". This view answers: "What applications has this applicant submitted, and what were their terms?"

**View `v_applicant_job_application_detail`**

```sql
CREATE VIEW v_applicant_job_application_detail AS
SELECT a.id, a.ssn, a.first_name, b.id AS application_id, b.application_id AS application_application_id, b.submission_date AS application_submission_date
FROM applicants a
  JOIN applicants_applications j ON j.applicant_id = a.id
  JOIN job_applications b ON b.id = j.job_application_id;
```

| id | ssn | first_name | application_id | application_application_id | application_submission_date |
|---|---|---|---|---|---|
| 1000 | legacy-ssn-43 | Stephanie Collins | 1 | 505997 | 2025-04-24T03:57:00 |
| 1000 | legacy-ssn-43 | Stephanie Collins | 2 | 1250196 | 2022-09-08T10:14:00 |
| 1001 | compact-ssn-44 | Janice Johnston | 2 | 1250196 | 2022-09-08T10:14:00 |
| 1001 | compact-ssn-44 | Janice Johnston | 3 | 124 | 2023-02-19T17:31:00 |
| 1002 | composite-ssn-45 | Upal Saha | 3 | 124 | 2023-02-19T17:31:00 |
| 1002 | composite-ssn-45 | Upal Saha | 4 | IVC20det40 | 2024-07-03T00:48:00 |
| 1003 | primary-ssn-46 | Katherine Snyder | 4 | IVC20det40 | 2024-07-03T00:48:00 |
| 1003 | primary-ssn-46 | Katherine Snyder | 1 | 505997 | 2025-04-24T03:57:00 |

The view `v_applicant_organization` joins `applicants` to `organizations` on `organization_id`, producing a row that pairs the applicant's identity with the organization they are associated with. For applicant `1000`, the view yields organization "Staples Inc." with `eopo_status = false`. This view answers: "Which organization is this applicant linked to?"

**View `v_applicant_organization`**

```sql
CREATE VIEW v_applicant_organization AS
SELECT a.id, a.ssn, a.first_name, a.last_name, b.organization_id AS organization_organization_id, b.organization_name AS organization_organization_name, b.street_address AS organization_street_address
FROM applicants a JOIN organizations b ON a.organization_id = b.organization_id;
```

| id | ssn | first_name | last_name | organization_organization_id | organization_organization_name | organization_street_address |
|---|---|---|---|---|---|---|
| 1000 | legacy-ssn-43 | Stephanie Collins | Paul Allen | 1 | Staples Inc. | composite-street-15 |
| 1001 | compact-ssn-44 | Janice Johnston | Heather Beasley | 2 | Oscar Health Inc. | primary-street-16 |
| 1002 | composite-ssn-45 | Upal Saha | Audrey Taylor | 3 | Atlantic Richfield | adaptive-street-17 |
| 1003 | primary-ssn-46 | Katherine Snyder | Susan Wagner | 4 | Port Loko | distributed-street-18 |

The view `v_organization_job_application_detail` joins `organizations` to `job_applications` on `organization_id`, producing a row per application that includes the organization's identity alongside the application's metadata. For organization `1` (Staples Inc.), the view shows application `1` with desired position "extended-desired-27" and desired wage `30.51`. This view answers: "Which applications has this organization received, and what were their terms?"

**View `v_organization_job_application_detail`**

```sql
CREATE VIEW v_organization_job_application_detail AS
SELECT a.organization_id, a.organization_name, a.street_address, b.id AS application_id, b.application_id AS application_application_id, b.submission_date AS application_submission_date
FROM organizations a
  JOIN organizations_applications j ON j.organization_id = a.organization_id
  JOIN job_applications b ON b.id = j.job_application_id;
```

| organization_id | organization_name | street_address | application_id | application_application_id | application_submission_date |
|---|---|---|---|---|---|
| 1 | Staples Inc. | composite-street-15 | 1 | 505997 | 2025-04-24T03:57:00 |
| 1 | Staples Inc. | composite-street-15 | 2 | 1250196 | 2022-09-08T10:14:00 |
| 2 | Oscar Health Inc. | primary-street-16 | 2 | 1250196 | 2022-09-08T10:14:00 |
| 2 | Oscar Health Inc. | primary-street-16 | 3 | 124 | 2023-02-19T17:31:00 |
| 3 | Atlantic Richfield | adaptive-street-17 | 3 | 124 | 2023-02-19T17:31:00 |
| 3 | Atlantic Richfield | adaptive-street-17 | 4 | IVC20det40 | 2024-07-03T00:48:00 |
| 4 | Port Loko | distributed-street-18 | 4 | IVC20det40 | 2024-07-03T00:48:00 |
| 4 | Port Loko | distributed-street-18 | 1 | 505997 | 2025-04-24T03:57:00 |

The view `v_organization_applicant_detail` joins `organizations` to `applicants` on `organization_id`, producing a row that pairs the organization's identity with the applicant's profile. For organization `2` (Oscar Health Inc.), the view yields applicant `1001` (Janice Johnston) with `employment_eligibility = true` and `has_drivers_license = false`. This view answers: "Which applicants are associated with this organization?"

**View `v_organization_applicant_detail`**

```sql
CREATE VIEW v_organization_applicant_detail AS
SELECT a.organization_id, a.organization_name, a.street_address, b.id AS applicant_id, b.ssn AS applicant_ssn, b.first_name AS applicant_first_name
FROM organizations a
  JOIN organizations_applicants j ON j.organization_id = a.organization_id
  JOIN applicants b ON b.id = j.applicant_id;
```

| organization_id | organization_name | street_address | applicant_id | applicant_ssn | applicant_first_name |
|---|---|---|---|---|---|
| 1 | Staples Inc. | composite-street-15 | 1000 | legacy-ssn-43 | Stephanie Collins |
| 1 | Staples Inc. | composite-street-15 | 1001 | compact-ssn-44 | Janice Johnston |
| 2 | Oscar Health Inc. | primary-street-16 | 1001 | compact-ssn-44 | Janice Johnston |
| 2 | Oscar Health Inc. | primary-street-16 | 1002 | composite-ssn-45 | Upal Saha |
| 3 | Atlantic Richfield | adaptive-street-17 | 1002 | composite-ssn-45 | Upal Saha |
| 3 | Atlantic Richfield | adaptive-street-17 | 1003 | primary-ssn-46 | Katherine Snyder |
| 4 | Port Loko | distributed-street-18 | 1003 | primary-ssn-46 | Katherine Snyder |
| 4 | Port Loko | distributed-street-18 | 1000 | legacy-ssn-43 | Stephanie Collins |

The view `v_employment_record_applicant` joins `employment_records` to `applicants` on `applicant_id`, producing a row per employment record that includes the applicant's identity. For employment record `1`, the view yields applicant `1000` (Stephanie Collins) with the position title "Extended Model" and salary `13.94`. This view answers: "Which applicant submitted this employment record?"

**View `v_employment_record_applicant`**

```sql
CREATE VIEW v_employment_record_applicant AS
SELECT a.employment_record_id, a.start_date, a.end_date, a.salary, b.id AS applicant_id, b.ssn AS applicant_ssn, b.first_name AS applicant_first_name
FROM employment_records a JOIN applicants b ON a.applicant_id = b.id;
```

| employment_record_id | start_date | end_date | salary | applicant_id | applicant_ssn | applicant_first_name |
|---|---|---|---|---|---|---|
| 1 | 2022-09-05 | 2022-09-01 | 13.94 | 1000 | legacy-ssn-43 | Stephanie Collins |
| 2 | 2023-02-16 | 2023-02-12 | 18.47 | 1001 | compact-ssn-44 | Janice Johnston |
| 3 | 2024-07-27 | 2024-07-23 | 66.14 | 1002 | composite-ssn-45 | Upal Saha |
| 4 | 2025-12-11 | 2025-12-07 | 61.82 | 1003 | primary-ssn-46 | Katherine Snyder |

The view `v_employment_record_organization` joins `employment_records` to `organizations` on `organization_id`, producing a row per employment record that includes the organization's identity. For employment record `1`, the view yields organization `1` (Staples Inc.) with `eopo_status = false`. This view answers: "Which organization is associated with this employment record?"

**View `v_employment_record_organization`**

```sql
CREATE VIEW v_employment_record_organization AS
SELECT a.employment_record_id, a.start_date, a.end_date, a.salary, b.organization_id AS organization_organization_id, b.organization_name AS organization_organization_name, b.street_address AS organization_street_address
FROM employment_records a JOIN organizations b ON a.organization_id = b.organization_id;
```

| employment_record_id | start_date | end_date | salary | organization_organization_id | organization_organization_name | organization_street_address |
|---|---|---|---|---|---|---|
| 1 | 2022-09-05 | 2022-09-01 | 13.94 | 1 | Staples Inc. | composite-street-15 |
| 2 | 2023-02-16 | 2023-02-12 | 18.47 | 2 | Oscar Health Inc. | primary-street-16 |
| 3 | 2024-07-27 | 2024-07-23 | 66.14 | 3 | Atlantic Richfield | adaptive-street-17 |
| 4 | 2025-12-11 | 2025-12-07 | 61.82 | 4 | Port Loko | distributed-street-18 |

The view `v_education_record_applicant` joins `education_records` to `applicants` on `applicant_id`, producing a row per education record that includes the applicant's identity. For education record `1`, the view yields applicant `1000` (Stephanie Collins) with institution "Extended Corridor" and education level "High School". This view answers: "Which applicant submitted this education record?"

**View `v_education_record_applicant`**

```sql
CREATE VIEW v_education_record_applicant AS
SELECT a.education_record_id, a.institution_name, a.institution_address, a.institution_phone, b.id AS applicant_id, b.ssn AS applicant_ssn, b.first_name AS applicant_first_name
FROM education_records a JOIN applicants b ON a.applicant_id = b.id;
```

| education_record_id | institution_name | institution_address | institution_phone | applicant_id | applicant_ssn | applicant_first_name |
|---|---|---|---|---|---|---|
| 1 | Extended Corridor | extended-institut-99 | adaptive-institut-23 | 1000 | legacy-ssn-43 | Stephanie Collins |
| 2 | Pilot Series A | integrated-institut-100 | distributed-institut-24 | 1001 | compact-ssn-44 | Janice Johnston |
| 3 | Baseline Assessment | seasonal-institut-101 | baseline-institut-25 | 1002 | composite-ssn-45 | Upal Saha |
| 4 | Distributed Survey | regional-institut-102 | pilot-institut-26 | 1003 | primary-ssn-46 | Katherine Snyder |

The view `v_education_record_organization` joins `education_records` to `organizations` on `organization_id`, producing a row per education record that includes the organization's identity. For education record `1`, the view yields organization `1` (Staples Inc.) with `eopo_status = false`. This view answers: "Which organization is associated with this education record?"

**View `v_education_record_organization`**

```sql
CREATE VIEW v_education_record_organization AS
SELECT a.education_record_id, a.institution_name, a.institution_address, a.institution_phone, b.organization_id AS organization_organization_id, b.organization_name AS organization_organization_name, b.street_address AS organization_street_address
FROM education_records a JOIN organizations b ON a.organization_id = b.organization_id;
```

| education_record_id | institution_name | institution_address | institution_phone | organization_organization_id | organization_organization_name | organization_street_address |
|---|---|---|---|---|---|---|
| 1 | Extended Corridor | extended-institut-99 | adaptive-institut-23 | 1 | Staples Inc. | composite-street-15 |
| 2 | Pilot Series A | integrated-institut-100 | distributed-institut-24 | 2 | Oscar Health Inc. | primary-street-16 |
| 3 | Baseline Assessment | seasonal-institut-101 | baseline-institut-25 | 3 | Atlantic Richfield | adaptive-street-17 |
| 4 | Distributed Survey | regional-institut-102 | pilot-institut-26 | 4 | Port Loko | distributed-street-18 |

The view `v_reference_applicant` joins `references` to `applicants` on `applicant_id`, producing a row per reference that includes the applicant's identity. For reference `1`, the view yields applicant `1000` (Stephanie Collins) with reference name "Theodore Mcgrath" and relationship type "Supervisor". This view answers: "Which applicant does this reference belong to?"

**View `v_reference_applicant`**

```sql
CREATE VIEW v_reference_applicant AS
SELECT a.reference_id, a.full_name, a.address, a.phone, b.id AS applicant_id, b.ssn AS applicant_ssn, b.first_name AS applicant_first_name
FROM references a JOIN applicants b ON a.applicant_id = b.id;
```

| reference_id | full_name | address | phone | applicant_id | applicant_ssn | applicant_first_name |
|---|---|---|---|---|---|---|
| 1 | Theodore Mcgrath | distributed-address-72 | compact-phone-26 | 1000 | legacy-ssn-43 | Stephanie Collins |
| 2 | Account Name | baseline-address-73 | composite-phone-27 | 1001 | compact-ssn-44 | Janice Johnston |
| 3 | Saipan International Airport | pilot-address-74 | primary-phone-28 | 1002 | composite-ssn-45 | Upal Saha |
| 4 | Norma Fisher | extended-address-75 | adaptive-phone-29 | 1003 | primary-ssn-46 | Katherine Snyder |

## Synthesis

The relational schema models the job application domain by separating identity (applicants, organizations), transactional intent (job_applications), and supporting evidence (employment_records, education_records, references) into distinct tables. Foreign keys from `job_applications`, `employment_records`, `education_records`, and `references` back to `applicants` and `organizations` enforce referential integrity and enable the views to reconstruct the full context of any domain fact. Junction tables (`applications_references`, `applications_records`, `applicants_applications`, `organizations_applications`, `organizations_applicants`) resolve the many-to-many associations that arise when a single applicant submits multiple applications, a single application cites multiple records, or a single organization interacts with multiple applicants. The twelve views materialize these joins into flat projections that answer the practical questions of the domain: who applied where, what were their terms, what background records support them, and which references vouch for them. Together, the base tables and views form a complete, normalized representation of the job application ecosystem.