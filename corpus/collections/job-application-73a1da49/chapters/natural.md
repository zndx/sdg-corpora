The modern hiring ecosystem operates as a structured exchange between organizations seeking qualified personnel and applicants pursuing employment opportunities. At its core, this domain captures the full lifecycle of a job application—from the moment an organization posts a position through the aggregation of an applicant's professional credentials, educational background, and professional references. Each participant in this process leaves a traceable record, and the relationships between those records form the backbone of recruitment analytics. The system tracks organizations such as Staples Inc., Oscar Health Inc., Atlantic Richfield, and Port Loko, each maintaining distinct hiring profiles. Applicants like Stephanie Collins, Janice Johnston, Upal Saha, and Katherine Snyder submit applications that reference their employment history, educational attainment, and professional contacts. Every application ties together these entities, creating a rich tapestry of data that supports both operational hiring decisions and strategic workforce planning.

## The Organizational Landscape

Organizations serve as the foundational entities in the hiring ecosystem, each maintaining a complete profile that includes contact information, physical address, and regulatory status. The organizations table captures essential details such as organization name, street address, city, state, zip code, telephone, fax, and eopo_status, a boolean flag indicating whether the organization holds a specific employment-oriented certification.

**Table `organizations`**

| organization_id | organization_name | street_address | city | state | zip_code | telephone | fax | eopo_status |
|---|---|---|---|---|---|---|---|---|
| 1 | Staples Inc. | composite-street-15 | integrated-city-34 | distributed-state-84 | 69434 | adaptive-telephon-23 | distributed-fax-12 | false |
| 2 | Oscar Health Inc. | primary-street-16 | seasonal-city-35 | baseline-state-85 | 13589 | distributed-telephon-24 | baseline-fax-13 | true |
| 3 | Atlantic Richfield | adaptive-street-17 | regional-city-36 | pilot-state-86 | 9bb5fec0-8fcc-11eb-924d-9cd76263cbd0 | baseline-telephon-25 | pilot-fax-14 | false |
| 4 | Port Loko | distributed-street-18 | legacy-city-37 | extended-state-87 | 1250214 | pilot-telephon-26 | extended-fax-15 | true |

Staples Inc., located at composite-street-15 in integrated-city-34, operates without the eopo designation, while Oscar Health Inc. in seasonal-city-35 carries the certification flag as true. Atlantic Richfield and Port Loko follow a similar pattern, with Port Loko also holding the eopo_status as true. These organizational profiles anchor every application, employment record, and education record in the system, ensuring that each hiring event can be traced back to a specific employer entity. The organization_id field serves as the primary key, linking outward to applications, applicants, and credential records.

## Applicant Profiles and Personal Records

Applicants represent the human side of the hiring process, with each record containing a comprehensive set of personal and eligibility attributes. The applicants table stores social security numbers, full names across first, middle, and last name fields, home and cell phone numbers, and complete mailing addresses. Additional fields capture age eligibility, employment eligibility, driver's license information including license state and number, criminal history flags, current employment status, and whether the individual has previously applied.

**Table `applicants`**

| id | ssn | first_name | last_name | middle_name | home_phone | cell_phone | street_address | city | state | zip_code | age_eligible | employment_eligibility | has_drivers_license | license_state | license_number | criminal_history | currently_employed | previous_applicant | last_application_date | organization_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 1000 | legacy-ssn-43 | Stephanie Collins | Paul Allen | Baseline Corridor D | regional-home-54 | distributed-cell-72 | composite-street-15 | integrated-city-34 | distributed-state-84 | 69434 | false | false | true | compact-license-86 | LIC-2589 | extended-criminal-39 | false | true | 2023-10-06 | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 1001 | compact-ssn-44 | Janice Johnston | Heather Beasley | Distributed Series | legacy-home-55 | baseline-cell-73 | primary-street-16 | seasonal-city-35 | baseline-state-85 | 13589 | true | true | false | composite-license-87 | LIC-2596 | integrated-criminal-40 | true | false | 2024-03-17 | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 1002 | composite-ssn-45 | Upal Saha | Audrey Taylor | Adaptive Assessment | compact-home-56 | pilot-cell-74 | adaptive-street-17 | regional-city-36 | pilot-state-86 | 9bb5fec0-8fcc-11eb-924d-9cd76263cbd0 | false | false | true | primary-license-88 | LIC-2603 | seasonal-criminal-41 | false | true | 2025-08-01 | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 1003 | primary-ssn-46 | Katherine Snyder | Susan Wagner | Primary Survey A | composite-home-57 | extended-cell-75 | distributed-street-18 | legacy-city-37 | extended-state-87 | 1250214 | true | true | false | adaptive-license-89 | LIC-2610 | regional-criminal-42 | true | false | 2022-01-12 | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Stephanie Collins (applicant ID 1000) presents a profile where age_eligible is false, employment_eligibility is false, yet she holds a valid driver's license (compact-license-86) and has a criminal history record (extended-criminal-39). She is not currently employed but is flagged as a previous applicant, with her last application dated 2023-10-06. Janice Johnston (1001) contrasts this profile: age_eligible and employment_eligibility are both true, she lacks a driver's license, and she is currently employed. Upal Saha (1002) and Katherine Snyder (1003) follow similar patterns, each with distinct combinations of eligibility flags and employment status. The organization_id field on the applicants table links each person to a specific organization, establishing a preliminary association before any formal application is submitted.

## Job Applications as Central Transactions

The job_applications table sits at the center of the hiring workflow, capturing the specific terms and conditions of each application. Each application record contains a unique application_id, a submission_date, the desired_position, desired_wage, availability_status (Full Time, Part Time, or Unavailable), overtime_eligibility, preferred_shift, shift_flexibility, and earliest_start_date. The applicant_id and organization_id fields create the critical link between the person applying and the organization receiving the application.

**Table `job_applications`**

| id | application_id | submission_date | desired_position | desired_wage | availability_status | overtime_eligibility | preferred_shift | shift_flexibility | earliest_start_date | applicant_id | organization_id |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 505997 | 2025-04-24T03:57:00 | extended-desired-27 | 30.51 | Full Time | true | integrated-preferre-82 | true | 2025-04-18 | 1000 | 1 |
| 2 | 1250196 | 2022-09-08T10:14:00 | integrated-desired-28 | 26.04 | Part Time | false | seasonal-preferre-83 | false | 2022-09-02 | 1001 | 2 |
| 3 | 124 | 2023-02-19T17:31:00 | seasonal-desired-29 | 33.06 | Unavailable | true | regional-preferre-84 | true | 2023-02-13 | 1002 | 3 |
| 4 | IVC20det40 | 2024-07-03T00:48:00 | regional-desired-30 | 12.74 | Full Time | false | legacy-preferre-85 | false | 2024-07-24 | 1003 | 4 |

Application ID 505997, submitted on 2025-04-24, represents Stephanie Collins seeking the extended-desired-27 position at an organization offering a desired wage of 30.51, with Full Time availability and overtime eligibility confirmed. Application 1250196, submitted by Janice Johnston on 2022-09-08, targets the integrated-desired-28 position at a Part Time level with a wage of 26.04 and no overtime eligibility. The seasonal-desired-29 application (ID 124) from Upal Saha carries an Unavailable status, suggesting a conditional or placeholder submission. The regional-desired-30 application (IVC20det40) from Katherine Snyder offers a wage of 12.74 with Full Time availability. These application records form the transactional core that the system's analytical views later enrich with applicant and organizational context.

## Employment History and Professional Credentials

Employment records document an applicant's professional past, providing organizations with evidence of prior work experience. The employment_records table captures start_date, end_date, salary, position_title, reason_for_leaving, contact_permission, employer_name, employer_address, and employer_phone. Each record is tied to an applicant through applicant_id and to an organization through organization_id.

**Table `employment_records`**

| employment_record_id | start_date | end_date | salary | position_title | reason_for_leaving | contact_permission | employer_name | employer_address | employer_phone | applicant_id | organization_id | created_at |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 2022-09-05 | 2022-09-01 | 13.94 | Extended Model | compact-reason-26 | Brian Hamilton | Air Products & Chemicals Inc | National University of Singapore | Gazprom Neft | 1000 | 1 | 2025-01-01 00:14:00 |
| 2 | 2023-02-16 | 2023-02-12 | 18.47 | Pilot Cluster A | composite-reason-27 | Distribution Settings | AT&T Technologies | Continental Group | Column Name cannot be empty | 1001 | 2 | 2025-02-06 03:14:00 |
| 3 | 2024-07-27 | 2024-07-23 | 66.14 | Baseline Review | primary-reason-28 | Alexandria Pugh | Beam Global | The College-Ready Promise | Altria Group Inc | 1002 | 3 | 2025-03-11 06:14:00 |
| 4 | 2025-12-11 | 2025-12-07 | 61.82 | Distributed Initiative | adaptive-reason-29 | Sarah Villanueva | Staples Inc. | LINK Interchange Network Ltd | McDonnell Douglas | 1003 | 4 | 2025-04-16 09:14:00 |

Stephanie Collins's employment record (ID 1) shows a position titled Extended Model with a salary of 13.94, employed at Air Products & Chemicals Inc. The contact_permission field stores a name—Brian Hamilton—rather than a simple boolean, suggesting a named contact for verification. Janice Johnston's record (ID 2) lists a Pilot Cluster A position at 18.47 salary with AT&T Technologies as the employer. Upal Saha's record (ID 3) documents a Baseline Review role at 66.14 salary with Beam Global. Katherine Snyder's record (ID 4) captures a Distributed Initiative position at 61.82 salary with Staples Inc. as the employer. These records provide the professional depth that organizations evaluate when reviewing applications.

## Educational Background and Academic Credentials

Education records complement employment history by documenting an applicant's academic qualifications. The education_records table stores institution_name, institution_address, institution_phone, years_attended, course_of_study, degree_or_diploma, and education_level. The education_level field categorizes attainment into High School, College, Trade, or Technical levels.

**Table `education_records`**

| education_record_id | institution_name | institution_address | institution_phone | years_attended | course_of_study | degree_or_diploma | education_level | applicant_id | organization_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | Extended Corridor | extended-institut-99 | adaptive-institut-23 | 16.70 | composite-course-75 | extended-degree-15 | High School | 1000 | 1 |
| 2 | Pilot Series A | integrated-institut-100 | distributed-institut-24 | 19.40 | primary-course-76 | integrated-degree-16 | College | 1001 | 2 |
| 3 | Baseline Assessment | seasonal-institut-101 | baseline-institut-25 | 22.10 | adaptive-course-77 | seasonal-degree-17 | Trade | 1002 | 3 |
| 4 | Distributed Survey | regional-institut-102 | pilot-institut-26 | 24.80 | distributed-course-78 | regional-degree-18 | Technical | 1003 | 4 |

Stephanie Collins attended Extended Corridor for 16.70 years, studying composite-course-75 and earning an extended-degree-15 at the High School level. Janice Johnston's record shows 19.40 years at Pilot Series A, with an integrated-degree-16 in primary-course-76 at the College level. Upal Saha completed 22.10 years at Baseline Assessment, earning a seasonal-degree-17 in adaptive-course-77 at the Trade level. Katherine Snyder's education spans 24.80 years at Distributed Survey, with a regional-degree-18 in distributed-course-78 at the Technical level. The increasing years_attended values across these records suggest varying depths of educational investment, each contributing to the applicant's overall profile.

## Professional References and Verification Networks

References provide third-party validation of an applicant's qualifications and character. The references table captures full_name, address, phone, relationship_type, is_relative, and applicant_id. Relationship types include Supervisor, Manager, Owner, and Personal, while the is_relative flag distinguishes familial from professional contacts.

**Table `references`**

| reference_id | full_name | address | phone | relationship_type | is_relative | applicant_id |
|---|---|---|---|---|---|---|
| 1 | Theodore Mcgrath | distributed-address-72 | compact-phone-26 | Supervisor | false | 1000 |
| 2 | Account Name | baseline-address-73 | composite-phone-27 | Manager | true | 1001 |
| 3 | Saipan International Airport | pilot-address-74 | primary-phone-28 | Owner | false | 1002 |
| 4 | Norma Fisher | extended-address-75 | adaptive-phone-29 | Personal | true | 1003 |

Stephanie Collins's reference (ID 1) is Theodore Mcgrath, listed as a Supervisor with is_relative set to false, indicating a professional relationship. Janice Johnston's reference (ID 2) is Account Name, a Manager who is marked as a relative (is_relative true), suggesting a familial professional connection. Upal Saha's reference (ID 3) is Saipan International Airport, listed as an Owner with no familial relationship. Katherine Snyder's reference (ID 4) is Norma Fisher, a Personal reference who is also a relative. These reference records add a layer of verifiability to the application process, though the system's design allows for both professional and personal contacts.

## Cross-Cutting Association Tables

The hiring ecosystem employs several association tables to manage many-to-many relationships and organizational hierarchies. The applications_references table links job applications to their associated references, enabling organizations to see which references are tied to specific application submissions rather than to applicants in general.

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

The applications_records table connects job applications to employment records, allowing organizations to evaluate which specific employment history entries support a given application. This linkage ensures that an applicant's most relevant work experience can be surfaced alongside their application.

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

The applicants_applications table manages the relationship between applicants and their applications, supporting scenarios where an applicant may submit multiple applications to the same or different organizations over time.

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

The organizations_applications table tracks which organizations have received which applications, providing an organizational perspective on application volume and distribution.

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

The organizations_applicants table establishes direct associations between organizations and applicants, potentially representing pre-screened candidates, internal referrals, or applicants who have expressed interest in specific employers before submitting a formal application.

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

## Analytical Views and Joined Perspectives

The system provides a suite of analytical views that join base tables to answer specific operational questions. Each view consolidates data from multiple sources, enabling stakeholders to examine the hiring ecosystem from different angles.

The v_job_application_applicant view answers the question of which applicant submitted which application, joining job_applications with applicants to present a unified record.

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

For application 505997, this view reveals that Stephanie Collins applied for the extended-desired-27 position with a desired wage of 30.51 and Full Time availability. Application 1250196 shows Janice Johnston targeting integrated-desired-28 at 26.04 per hour with Part Time status. These joined records allow hiring managers to evaluate applications with full applicant context in a single view.

The v_job_application_organization view joins applications with their receiving organizations, answering which organization received which application and under what terms.

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

Application 505997 was received by Staples Inc., while application 1250196 went to Oscar Health Inc. This perspective is essential for organizations tracking their application pipeline and for understanding the distribution of applications across the employer network.

The v_job_application_reference_detail view enriches applications with their associated reference information, answering which references support a given application.

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

This view connects application-level references to the broader applicant reference pool, enabling organizations to verify that the references cited in an application match the applicant's registered contacts.

The v_job_application_employment_record_detail view links applications to the employment records that support them, answering which work experience entries back a specific application.

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

For application 505997, this view surfaces Stephanie Collins's employment at Air Products & Chemicals Inc. with a salary of 13.94 and position title Extended Model. This linkage ensures that employment history is evaluated in the context of specific applications rather than as a generic resume.

The v_job_application_education_record_detail view connects applications to educational records, answering which academic credentials support a given application.

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

Stephanie Collins's application 505997 is supported by her High School education at Extended Corridor with 16.70 years attended. This view enables organizations to assess educational qualifications alongside employment history for each application.

The v_applicant_job_application_detail view provides an applicant-centric perspective, joining applicants with all their applications to show the full application history of each individual.

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

For applicant 1000 (Stephanie Collins), this view consolidates her application 505997 with her personal details including SSN legacy-ssn-43 and her last application date of 2023-10-06. This perspective is valuable for tracking applicant engagement over time and for identifying repeat applicants.

The v_applicant_organization view joins applicants with their associated organizations, answering which organizations each applicant has a relationship with.

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

Stephanie Collins (1000) is associated with organization ID 1 (Staples Inc.), while Janice Johnston (1001) connects to organization ID 2 (Oscar Health Inc.). This view reveals the organizational affiliations that exist independently of formal applications.

The v_organization_job_application_detail view provides an organization-centric view of all applications received, joining organizations with their applications.

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

Staples Inc. (organization ID 1) received application 505997 from Stephanie Collins for the extended-desired-27 position. Oscar Health Inc. (organization ID 2) received application 1250196 from Janice Johnston. This perspective supports organizational analytics on application volume, wage expectations, and availability patterns.

The v_organization_applicant_detail view joins organizations with their associated applicants, answering which applicants are linked to each organization.

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

Staples Inc. is associated with applicant Stephanie Collins (1000), while Oscar Health Inc. connects to Janice Johnston (1001). This view supports talent pipeline management by showing which applicants have established relationships with which employers.

The v_employment_record_applicant view joins employment records with their associated applicants, answering which applicant each employment record belongs to.

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

Employment record 1 belongs to applicant Stephanie Collins (1000), documenting her Extended Model position at Air Products & Chemicals Inc. This view enables organizations to evaluate employment history in the context of the applicant's broader profile.

The v_employment_record_organization view joins employment records with organizations, answering which organization each employment record is associated with.

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

Employment record 1 is associated with organization ID 1 (Staples Inc.), while employment record 2 connects to organization ID 2 (Oscar Health Inc.). This perspective supports organizational analysis of the employment backgrounds of applicants in their pipeline.

The v_education_record_applicant view joins education records with applicants, answering which applicant each education record belongs to.

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

Education record 1 belongs to applicant Stephanie Collins (1000), documenting her High School education at Extended Corridor. This view enables evaluation of educational attainment alongside other applicant credentials.

The v_education_record_organization view joins education records with organizations, answering which organization each education record is associated with.

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

Education record 1 is associated with organization ID 1 (Staples Inc.), while education record 2 connects to organization ID 2 (Oscar Health Inc.). This perspective supports organizational analysis of the educational backgrounds of their applicant pool.

The v_reference_applicant view joins references with their associated applicants, answering which applicant each reference belongs to.

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

Reference 1 (Theodore Mcgrath, Supervisor) belongs to applicant Stephanie Collins (1000), while reference 2 (Account Name, Manager) belongs to Janice Johnston (1001). This view enables organizations to verify that references are correctly attributed to applicants and to assess the quality of the reference network for each candidate.

## Synthesis

The hiring ecosystem captured by these tables and views forms a comprehensive record of the employment application process. Organizations post positions, applicants submit applications with supporting credentials, and the system tracks every relationship between these entities. The base tables capture the raw data—personal information, organizational profiles, application terms, employment history, educational attainment, and professional references—while the association tables manage the complex many-to-many relationships that arise when applicants apply to multiple organizations and organizations receive applications from multiple candidates. The analytical views then synthesize these records into actionable perspectives, answering questions from the applicant's viewpoint, the organization's viewpoint, and the application's viewpoint. Together, these components create a structured foundation for recruitment analytics, workforce planning, and hiring decision support.