The credit union sector operates within a tightly regulated ecosystem where governance, personnel qualifications, and institutional credentials intersect to ensure member trust and regulatory compliance. Practitioners who manage credit union operations must track not only the structural attributes of each union—its legal identity, founding date, headquarters location, and regulatory standing—but also the individuals who steer its executive functions, the educational foundations that qualify them, and the recognitions that validate their contributions. This chapter documents the data architecture that supports such tracking, describing how credit unions, executive roles, persons, educational institutions, degree programs, awards, organizations, and scholarship funds are recorded and related within the system.

## Credit Unions and Regulatory Framework

Credit unions form the foundational entities in this domain, each registered with a unique identifier and a legal name that distinguishes it from peer institutions. The records capture operational metadata including founding dates, headquarters geography, and the eligibility criteria that define which members may participate. Regulatory status further classifies each union, indicating whether it falls under the National Credit Union Administration or the National Credit Union Regulatory Commission.

**Table `cred_credit_unions`**

| id | identifier | legal_name | founding_date | headquarters_city | headquarters_state | member_eligibility_criteria | regulatory_status | executive_role_id | award_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | IDE-2086 | Adaptive Model | 2023-06-24 | seasonal-headquar-83 | compact-headquar-74 | regional-member-66 | NCRUC | 1 | 1000 |
| 2 | IDE-2091 | Primary Cluster | 2024-11-08 | regional-headquar-84 | composite-headquar-75 | legacy-member-67 | NCUA | 2 | 1001 |
| 3 | IDE-2096 | Composite Review D | 2025-04-19 | legacy-headquar-85 | primary-headquar-76 | compact-member-68 | NCRUC | 3 | 1002 |
| 4 | IDE-2101 | Compact Initiative | 2022-09-03 | compact-headquar-86 | adaptive-headquar-77 | composite-member-69 | NCUA | 4 | 1003 |

Each credit union carries a single executive role identifier and a single award identifier, anchoring it to the governance and recognition structures described in subsequent sections. For example, the union identified as IDE-2086 and legally named Adaptive Model was founded on 2023-06-24, maintains its headquarters in a city coded as seasonal-headquar-83 within the state of compact-headquar-74, and operates under NCRUC regulation with member eligibility criteria classified as regional-member-66. Its associated executive role is numbered 1 and its award is numbered 1000. The union Primary Cluster (IDE-2091), founded more recently on 2024-11-08, holds NCUA regulatory status and links to executive role 2 and award 1001.

## Executive Roles and Governance

Executive roles document the leadership positions within credit unions, recording the title of the role, the dates of appointment and termination, the reporting chain, and the compensation band assigned to the position. A boolean flag indicates whether the role is currently active, and a reference to a previously held executive role captures career progression within the leadership pipeline.

**Table `cred_executive_roles`**

| executive_role_id | role_title | appointment_date | termination_date | reporting_to | compensation_band | is_current | person_id | credit_union_id | previously_held_executive_role_id | created_at |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | Distributed Standard | 2022-05-03 | 2022-09-11 | integrated-reportin-82 | legacy-compensa-79 | true | 1 | 1 | 1 | 2025-01-01 00:14:00 |
| 2 | Adaptive Framework D | 2023-10-14 | 2023-02-22 | seasonal-reportin-83 | compact-compensa-80 | false | 2 | 2 | 2 | 2025-02-06 03:14:00 |
| 3 | Primary Protocol | 2024-03-25 | 2024-07-06 | regional-reportin-84 | composite-compensa-81 | true | 3 | 3 | 3 | 2025-03-11 06:14:00 |
| 4 | Composite Programme | 2025-08-09 | 2025-12-17 | legacy-reportin-85 | primary-compensa-82 | false | 4 | 4 | 4 | 2025-04-16 09:14:00 |

The role titled Distributed Standard (executive_role_id 1) was appointed on 2022-05-03 and terminated on 2022-09-11, reporting to integrated-reportin-82 and compensated under the legacy-compensa-79 band. It is marked as currently active and references previously_held_executive_role_id 1, suggesting a continuity or reappointment pattern. The role Adaptive Framework D (executive_role_id 2) carries a later appointment date of 2023-10-14 but an earlier termination date of 2023-02-22, indicating a data entry anomaly or a retroactive termination; it is not currently active and reports to seasonal-reportin-83 under the compact-compensa-80 band.

## Persons and Personal Records

The persons table stores biographical and demographic information for individuals associated with the credit union ecosystem. Each record includes a first and last name, date of birth, residence geography, marital status, and the number of dependents. A reference to an executive role, an educational institution, and an award ties each person to the other domains.

**Table `cred_persons`**

| id | first_name | last_name | date_of_birth | residence_city | residence_state | marital_status | number_of_dependents | executive_role_id | educational_institution_id | award_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | Stephanie Collins | Paul Allen | 2025-04-02 | seasonal-residenc-65 | integrated-residenc-94 | seasonal-marital-83 | 14 | 1 | 1 | 1000 |
| 2 | Janice Johnston | Heather Beasley | 2022-09-13 | regional-residenc-66 | seasonal-residenc-95 | regional-marital-84 | 20 | 2 | 2 | 1001 |
| 3 | Upal Saha | Audrey Taylor | 2023-02-24 | legacy-residenc-67 | regional-residenc-96 | legacy-marital-85 | 26 | 3 | 3 | 1002 |
| 4 | Katherine Snyder | Susan Wagner | 2024-07-08 | compact-residenc-68 | legacy-residenc-97 | compact-marital-86 | 32 | 4 | 4 | 1003 |

Stephanie Collins Paul Allen (id 1) was born on 2025-04-02, resides in seasonal-residenc-65 within integrated-residenc-94, has a marital status of seasonal-marital-83, and reports 14 dependents. This person holds executive role 1, is associated with educational institution 1, and received award 1000. Janice Johnston Heather Beasley (id 2) carries 20 dependents, resides in regional-residenc-66, and links to executive role 2, educational institution 2, and award 1001. The remaining persons follow the same structural pattern, with Upal Saha Audrey Taylor (id 3) reporting 26 dependents and Katherine Snyder Susan Wagner (id 4) reporting 32 dependents.

## Educational Institutions and Accreditation

Educational institutions provide the academic backdrop for personnel qualifications. Each institution record includes its name, location geography, accreditation status, and founding year. A person reference and a degree program reference connect the institution to the individuals and programs described elsewhere.

**Table `cred_educational_institutions`**

| educational_institution_id | institution_name | location_city | location_state | accreditation_status | founding_year | person_id | degree_program_id |
|---|---|---|---|---|---|---|---|
| 1 | Extended Corridor | seasonal-location-23 | composite-location-93 | regional-accredit-66 | 43 | 1 | 1 |
| 2 | Pilot Series A | regional-location-24 | primary-location-94 | legacy-accredit-67 | 48 | 2 | 2 |
| 3 | Baseline Assessment | legacy-location-25 | adaptive-location-95 | compact-accredit-68 | 53 | 3 | 3 |
| 4 | Distributed Survey | compact-location-26 | distributed-location-96 | composite-accredit-69 | 58 | 4 | 4 |

Extended Corridor (educational_institution_id 1) is located in seasonal-location-23 within composite-location-93, holds regional-accredit-66 accreditation, and was founded in year 43. It is associated with person 1 and degree program 1. Pilot Series A (id 2) resides in regional-location-24, carries legacy-accredit-67 status, and dates to year 48, linking to person 2 and degree program 2. Baseline Assessment (id 3) and Distributed Survey (id 4) follow the same pattern, with accreditation statuses of compact-accredit-68 and composite-accredit-69 respectively.

## Degree Programs and Academic Structure

Degree programs define the academic offerings available at each institution. Records capture the program name, degree type, duration in years, and field of study. Each program is anchored to a specific educational institution and a specific person, creating a direct link between academic credentials and individual qualifications.

**Table `cred_degree_programs`**

| degree_program_id | program_name | degree_type | duration_years | field_of_study | educational_institution_id | person_id |
|---|---|---|---|---|---|---|
| 1 | Extended Review | compact-degree-62 | 14 | legacy-field-25 | 1 | 1 |
| 2 | Pilot Initiative A | composite-degree-63 | 18 | compact-field-26 | 2 | 2 |
| 3 | Baseline Model | primary-degree-64 | 22 | composite-field-27 | 3 | 3 |
| 4 | Distributed Cluster | adaptive-degree-65 | 26 | primary-field-28 | 4 | 4 |

The program Extended Review (degree_program_id 1) is classified as compact-degree-62, spans 14 years, and belongs to the field of study legacy-field-25. It is offered at educational institution 1 and is associated with person 1. Pilot Initiative A (id 2) carries the degree type composite-degree-63, lasts 18 years, and falls under compact-field-26 at institution 2. Baseline Model (id 3) and Distributed Cluster (id 4) extend the duration to 22 and 26 years respectively, with fields of study composite-field-27 and primary-field-28.

## Awards and Recognition

Awards document the recognitions bestowed upon individuals within the credit union community. Each award record includes the award name, the year it was presented, the presenting entity, a citation text, and a flag indicating whether it constitutes a lifetime achievement honor. References to a person and an organization connect the award to its recipient and its sponsor.

**Table `cred_awards`**

| id | award_name | award_year | presented_by | citation_text | is_lifetime_achievement | person_id | organization_id |
|---|---|---|---|---|---|---|---|
| 1000 | Primary Review A | 36 | baseline-presente-13 | pilot-citation-80 | false | 1 | 1 |
| 1001 | Composite Initiative | 43 | pilot-presente-14 | extended-citation-81 | true | 2 | 2 |
| 1002 | Compact Model | 50 | extended-presente-15 | integrated-citation-82 | false | 3 | 3 |
| 1003 | Legacy Cluster D | 57 | integrated-presente-16 | seasonal-citation-83 | true | 4 | 4 |

Primary Review A (id 1000) was presented in year 36 by baseline-presente-13, carries the citation pilot-citation-80, and is not designated as a lifetime achievement award. It was given to person 1 and is sponsored by organization 1. Composite Initiative (id 1001), presented in year 43 by pilot-presente-14 with citation extended-citation-81, is marked as a lifetime achievement award and links to person 2 and organization 2. Compact Model (id 1002) and Legacy Cluster D (id 1003) follow the same structure, with the latter also carrying lifetime achievement designation.

## Organizations and Scholarship Funds

Organizations serve as the sponsoring entities for awards and the administering bodies for scholarship funds. The organizations table records their identity and links them to the awards they present and the scholarship funds they manage. Scholarship funds, in turn, are tied to their sponsoring organizations and to the persons who benefit from them.

**Table `cred_organizations`**

| organization_id | organization_name | organization_type | founding_year | headquarters_location | award_id | scholarship_fund_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|
| 1 | Staples Inc. | Gulf Oil | 43 | composite-headquar-63 | 1000 | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | Oscar Health Inc. | FSG Social Impact Advisors | 48 | primary-headquar-64 | 1001 | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | Atlantic Richfield | McDonnell Douglas | 53 | adaptive-headquar-65 | 1002 | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | Port Loko | Alliant Energy Corp | 58 | distributed-headquar-66 | 1003 | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

**Table `cred_scholarship_funds`**

| id | fund_name | established_year | target_beneficiaries | funding_source | organization_id | person_id | awarded_to_person_id |
|---|---|---|---|---|---|---|---|
| 1 | Seasonal Programme | 10 | integrated-target-76 | baseline-funding-73 | 1 | 1 | 1 |
| 2 | Integrated Standard | 16 | seasonal-target-77 | pilot-funding-74 | 2 | 2 | 2 |
| 3 | Extended Framework D | 22 | regional-target-78 | extended-funding-75 | 3 | 3 | 3 |
| 4 | Pilot Protocol | 28 | legacy-target-79 | integrated-funding-76 | 4 | 4 | 4 |

## Executive Role Relationships

The view v_credit_union_executive_role joins credit union records with their associated executive roles, answering the question of which leadership position is assigned to each union. Reading the row for IDE-2086 (Adaptive Model), the join reveals executive role 1, titled Distributed Standard, appointed on 2022-05-03 and currently active. The row for IDE-2091 (Primary Cluster) shows executive role 2, Adaptive Framework D, which is not currently active.

**View `v_credit_union_executive_role`**

```sql
CREATE VIEW v_credit_union_executive_role AS
SELECT a.id, a.identifier, a.legal_name, a.founding_date, b.executive_role_id AS role_executive_role_id, b.role_title AS role_role_title, b.appointment_date AS role_appointment_date
FROM cred_credit_unions a JOIN cred_executive_roles b ON a.executive_role_id = b.executive_role_id;
```

| id | identifier | legal_name | founding_date | role_executive_role_id | role_role_title | role_appointment_date |
|---|---|---|---|---|---|---|
| 1 | IDE-2086 | Adaptive Model | 2023-06-24 | 1 | Distributed Standard | 2022-05-03 |
| 2 | IDE-2091 | Primary Cluster | 2024-11-08 | 2 | Adaptive Framework D | 2023-10-14 |
| 3 | IDE-2096 | Composite Review D | 2025-04-19 | 3 | Primary Protocol | 2024-03-25 |
| 4 | IDE-2101 | Compact Initiative | 2022-09-03 | 4 | Composite Programme | 2025-08-09 |

The view v_credit_union_award links credit unions to their associated awards, clarifying which recognition is tied to each institution. The row for IDE-2086 connects to award 1000, Primary Review A, presented in year 36. The row for IDE-2091 connects to award 1001, Composite Initiative, a lifetime achievement award presented in year 43.

**View `v_credit_union_award`**

```sql
CREATE VIEW v_credit_union_award AS
SELECT a.id, a.identifier, a.legal_name, a.founding_date, b.id AS award_id, b.award_name AS award_award_name, b.award_year AS award_award_year
FROM cred_credit_unions a JOIN cred_awards b ON a.award_id = b.id;
```

| id | identifier | legal_name | founding_date | award_id | award_award_name | award_award_year |
|---|---|---|---|---|---|---|
| 1 | IDE-2086 | Adaptive Model | 2023-06-24 | 1000 | Primary Review A | 36 |
| 2 | IDE-2091 | Primary Cluster | 2024-11-08 | 1001 | Composite Initiative | 43 |
| 3 | IDE-2096 | Composite Review D | 2025-04-19 | 1002 | Compact Model | 50 |
| 4 | IDE-2101 | Compact Initiative | 2022-09-03 | 1003 | Legacy Cluster D | 57 |

The view v_executive_role_person connects executive roles to the persons who hold them, answering which individual occupies each leadership position. The row for executive role 1 (Distributed Standard) maps to person 1, Stephanie Collins Paul Allen. The row for executive role 2 (Adaptive Framework D) maps to person 2, Janice Johnston Heather Beasley.

**View `v_executive_role_person`**

```sql
CREATE VIEW v_executive_role_person AS
SELECT a.executive_role_id, a.role_title, a.appointment_date, a.termination_date, b.id AS person_id, b.first_name AS person_first_name, b.last_name AS person_last_name
FROM cred_executive_roles a JOIN cred_persons b ON a.person_id = b.id;
```

| executive_role_id | role_title | appointment_date | termination_date | person_id | person_first_name | person_last_name |
|---|---|---|---|---|---|---|
| 1 | Distributed Standard | 2022-05-03 | 2022-09-11 | 1 | Stephanie Collins | Paul Allen |
| 2 | Adaptive Framework D | 2023-10-14 | 2023-02-22 | 2 | Janice Johnston | Heather Beasley |
| 3 | Primary Protocol | 2024-03-25 | 2024-07-06 | 3 | Upal Saha | Audrey Taylor |
| 4 | Composite Programme | 2025-08-09 | 2025-12-17 | 4 | Katherine Snyder | Susan Wagner |

The view v_executive_role_credit_union provides the reverse linkage, connecting each executive role back to its parent credit union. Executive role 1 is associated with credit union IDE-2086 (Adaptive Model), while executive role 2 is associated with IDE-2091 (Primary Cluster).

**View `v_executive_role_credit_union`**

```sql
CREATE VIEW v_executive_role_credit_union AS
SELECT a.executive_role_id, a.role_title, a.appointment_date, a.termination_date, b.id AS union_id, b.identifier AS union_identifier, b.legal_name AS union_legal_name
FROM cred_executive_roles a JOIN cred_credit_unions b ON a.credit_union_id = b.id;
```

| executive_role_id | role_title | appointment_date | termination_date | union_id | union_identifier | union_legal_name |
|---|---|---|---|---|---|---|
| 1 | Distributed Standard | 2022-05-03 | 2022-09-11 | 1 | IDE-2086 | Adaptive Model |
| 2 | Adaptive Framework D | 2023-10-14 | 2023-02-22 | 2 | IDE-2091 | Primary Cluster |
| 3 | Primary Protocol | 2024-03-25 | 2024-07-06 | 3 | IDE-2096 | Composite Review D |
| 4 | Composite Programme | 2025-08-09 | 2025-12-17 | 4 | IDE-2101 | Compact Initiative |

The view v_executive_role_executive_role captures the self-referential career progression within executive roles, linking each role to a previously held executive role. Executive role 1 references previously held role 1, suggesting a reappointment or continuation. Executive role 2 references previously held role 2, following the same pattern.

**View `v_executive_role_executive_role`**

```sql
CREATE VIEW v_executive_role_executive_role AS
SELECT a.executive_role_id, a.role_title, a.appointment_date, a.termination_date, b.executive_role_id AS role_executive_role_id, b.role_title AS role_role_title, b.appointment_date AS role_appointment_date
FROM cred_executive_roles a JOIN cred_executive_roles b ON a.previously_held_executive_role_id = b.executive_role_id;
```

| executive_role_id | role_title | appointment_date | termination_date | role_executive_role_id | role_role_title | role_appointment_date |
|---|---|---|---|---|---|---|
| 1 | Distributed Standard | 2022-05-03 | 2022-09-11 | 1 | Distributed Standard | 2022-05-03 |
| 2 | Adaptive Framework D | 2023-10-14 | 2023-02-22 | 2 | Adaptive Framework D | 2023-10-14 |
| 3 | Primary Protocol | 2024-03-25 | 2024-07-06 | 3 | Primary Protocol | 2024-03-25 |
| 4 | Composite Programme | 2025-08-09 | 2025-12-17 | 4 | Composite Programme | 2025-08-09 |

## Person-Centric Relationships

The view v_person_executive_role joins person records with their executive roles, providing a consolidated view of each individual's leadership position. The row for person 1 (Stephanie Collins Paul Allen) shows executive role 1, Distributed Standard, appointed on 2022-05-03. The row for person 2 (Janice Johnston Heather Beasley) shows executive role 2, Adaptive Framework D, appointed on 2023-10-14.

**View `v_person_executive_role`**

```sql
CREATE VIEW v_person_executive_role AS
SELECT a.id, a.first_name, a.last_name, a.date_of_birth, b.executive_role_id AS role_executive_role_id, b.role_title AS role_role_title, b.appointment_date AS role_appointment_date
FROM cred_persons a JOIN cred_executive_roles b ON a.executive_role_id = b.executive_role_id;
```

| id | first_name | last_name | date_of_birth | role_executive_role_id | role_role_title | role_appointment_date |
|---|---|---|---|---|---|---|
| 1 | Stephanie Collins | Paul Allen | 2025-04-02 | 1 | Distributed Standard | 2022-05-03 |
| 2 | Janice Johnston | Heather Beasley | 2022-09-13 | 2 | Adaptive Framework D | 2023-10-14 |
| 3 | Upal Saha | Audrey Taylor | 2023-02-24 | 3 | Primary Protocol | 2024-03-25 |
| 4 | Katherine Snyder | Susan Wagner | 2024-07-08 | 4 | Composite Programme | 2025-08-09 |

The view v_person_educational_institution connects persons to their associated educational institutions, answering which institution is linked to each individual. Person 1 is associated with Extended Corridor (institution id 1), located in seasonal-location-23. Person 2 is associated with Pilot Series A (institution id 2), located in regional-location-24.

**View `v_person_educational_institution`**

```sql
CREATE VIEW v_person_educational_institution AS
SELECT a.id, a.first_name, a.last_name, a.date_of_birth, b.educational_institution_id AS institution_educational_institution_id, b.institution_name AS institution_institution_name, b.location_city AS institution_location_city
FROM cred_persons a JOIN cred_educational_institutions b ON a.educational_institution_id = b.educational_institution_id;
```

| id | first_name | last_name | date_of_birth | institution_educational_institution_id | institution_institution_name | institution_location_city |
|---|---|---|---|---|---|---|
| 1 | Stephanie Collins | Paul Allen | 2025-04-02 | 1 | Extended Corridor | seasonal-location-23 |
| 2 | Janice Johnston | Heather Beasley | 2022-09-13 | 2 | Pilot Series A | regional-location-24 |
| 3 | Upal Saha | Audrey Taylor | 2023-02-24 | 3 | Baseline Assessment | legacy-location-25 |
| 4 | Katherine Snyder | Susan Wagner | 2024-07-08 | 4 | Distributed Survey | compact-location-26 |

The view v_person_award joins persons with their awards, clarifying which recognition each individual has received. Person 1 received award 1000, Primary Review A, presented in year 36. Person 2 received award 1001, Composite Initiative, a lifetime achievement award presented in year 43.

**View `v_person_award`**

```sql
CREATE VIEW v_person_award AS
SELECT a.id, a.first_name, a.last_name, a.date_of_birth, b.id AS award_id, b.award_name AS award_award_name, b.award_year AS award_award_year
FROM cred_persons a JOIN cred_awards b ON a.award_id = b.id;
```

| id | first_name | last_name | date_of_birth | award_id | award_award_name | award_award_year |
|---|---|---|---|---|---|---|
| 1 | Stephanie Collins | Paul Allen | 2025-04-02 | 1000 | Primary Review A | 36 |
| 2 | Janice Johnston | Heather Beasley | 2022-09-13 | 1001 | Composite Initiative | 43 |
| 3 | Upal Saha | Audrey Taylor | 2023-02-24 | 1002 | Compact Model | 50 |
| 4 | Katherine Snyder | Susan Wagner | 2024-07-08 | 1003 | Legacy Cluster D | 57 |

## Educational Institution Relationships

The view v_educational_institution_person links educational institutions to the persons associated with them, answering which individual is connected to each institution. Extended Corridor (institution id 1) is linked to person 1, Stephanie Collins Paul Allen. Pilot Series A (institution id 2) is linked to person 2, Janice Johnston Heather Beasley.

**View `v_educational_institution_person`**

```sql
CREATE VIEW v_educational_institution_person AS
SELECT a.educational_institution_id, a.institution_name, a.location_city, a.location_state, b.id AS person_id, b.first_name AS person_first_name, b.last_name AS person_last_name
FROM cred_educational_institutions a JOIN cred_persons b ON a.person_id = b.id;
```

| educational_institution_id | institution_name | location_city | location_state | person_id | person_first_name | person_last_name |
|---|---|---|---|---|---|---|
| 1 | Extended Corridor | seasonal-location-23 | composite-location-93 | 1 | Stephanie Collins | Paul Allen |
| 2 | Pilot Series A | regional-location-24 | primary-location-94 | 2 | Janice Johnston | Heather Beasley |
| 3 | Baseline Assessment | legacy-location-25 | adaptive-location-95 | 3 | Upal Saha | Audrey Taylor |
| 4 | Distributed Survey | compact-location-26 | distributed-location-96 | 4 | Katherine Snyder | Susan Wagner |

The view v_educational_institution_degree_program connects educational institutions to their degree programs, answering which academic programs are offered at each institution. Institution 1 (Extended Corridor) offers degree program 1, Extended Review, a compact-degree-62 program lasting 14 years. Institution 2 (Pilot Series A) offers degree program 2, Pilot Initiative A, a composite-degree-63 program lasting 18 years.

**View `v_educational_institution_degree_program`**

```sql
CREATE VIEW v_educational_institution_degree_program AS
SELECT a.educational_institution_id, a.institution_name, a.location_city, a.location_state, b.degree_program_id AS program_degree_program_id, b.program_name AS program_program_name, b.degree_type AS program_degree_type
FROM cred_educational_institutions a JOIN cred_degree_programs b ON a.degree_program_id = b.degree_program_id;
```

| educational_institution_id | institution_name | location_city | location_state | program_degree_program_id | program_program_name | program_degree_type |
|---|---|---|---|---|---|---|
| 1 | Extended Corridor | seasonal-location-23 | composite-location-93 | 1 | Extended Review | compact-degree-62 |
| 2 | Pilot Series A | regional-location-24 | primary-location-94 | 2 | Pilot Initiative A | composite-degree-63 |
| 3 | Baseline Assessment | legacy-location-25 | adaptive-location-95 | 3 | Baseline Model | primary-degree-64 |
| 4 | Distributed Survey | compact-location-26 | distributed-location-96 | 4 | Distributed Cluster | adaptive-degree-65 |

The view v_degree_program_educational_institution provides the reverse linkage, connecting each degree program back to its parent institution. Degree program 1 (Extended Review) is offered at institution 1 (Extended Corridor). Degree program 2 (Pilot Initiative A) is offered at institution 2 (Pilot Series A).

**View `v_degree_program_educational_institution`**

```sql
CREATE VIEW v_degree_program_educational_institution AS
SELECT a.degree_program_id, a.program_name, a.degree_type, a.duration_years, b.educational_institution_id AS institution_educational_institution_id, b.institution_name AS institution_institution_name, b.location_city AS institution_location_city
FROM cred_degree_programs a JOIN cred_educational_institutions b ON a.educational_institution_id = b.educational_institution_id;
```

| degree_program_id | program_name | degree_type | duration_years | institution_educational_institution_id | institution_institution_name | institution_location_city |
|---|---|---|---|---|---|---|
| 1 | Extended Review | compact-degree-62 | 14 | 1 | Extended Corridor | seasonal-location-23 |
| 2 | Pilot Initiative A | composite-degree-63 | 18 | 2 | Pilot Series A | regional-location-24 |
| 3 | Baseline Model | primary-degree-64 | 22 | 3 | Baseline Assessment | legacy-location-25 |
| 4 | Distributed Cluster | adaptive-degree-65 | 26 | 4 | Distributed Survey | compact-location-26 |

The view v_degree_program_person links degree programs to the persons associated with them, answering which individual is connected to each program. Degree program 1 is associated with person 1, Stephanie Collins Paul Allen. Degree program 2 is associated with person 2, Janice Johnston Heather Beasley.

**View `v_degree_program_person`**

```sql
CREATE VIEW v_degree_program_person AS
SELECT a.degree_program_id, a.program_name, a.degree_type, a.duration_years, b.id AS person_id, b.first_name AS person_first_name, b.last_name AS person_last_name
FROM cred_degree_programs a JOIN cred_persons b ON a.person_id = b.id;
```

| degree_program_id | program_name | degree_type | duration_years | person_id | person_first_name | person_last_name |
|---|---|---|---|---|---|---|
| 1 | Extended Review | compact-degree-62 | 14 | 1 | Stephanie Collins | Paul Allen |
| 2 | Pilot Initiative A | composite-degree-63 | 18 | 2 | Janice Johnston | Heather Beasley |
| 3 | Baseline Model | primary-degree-64 | 22 | 3 | Upal Saha | Audrey Taylor |
| 4 | Distributed Cluster | adaptive-degree-65 | 26 | 4 | Katherine Snyder | Susan Wagner |

## Award Relationships

The view v_award_person joins awards with the persons who received them, answering which individual earned each recognition. Award 1000 (Primary Review A) was received by person 1, Stephanie Collins Paul Allen. Award 1001 (Composite Initiative) was received by person 2, Janice Johnston Heather Beasley.

**View `v_award_person`**

```sql
CREATE VIEW v_award_person AS
SELECT a.id, a.award_name, a.award_year, a.presented_by, b.id AS person_id, b.first_name AS person_first_name, b.last_name AS person_last_name
FROM cred_awards a JOIN cred_persons b ON a.person_id = b.id;
```

| id | award_name | award_year | presented_by | person_id | person_first_name | person_last_name |
|---|---|---|---|---|---|---|
| 1000 | Primary Review A | 36 | baseline-presente-13 | 1 | Stephanie Collins | Paul Allen |
| 1001 | Composite Initiative | 43 | pilot-presente-14 | 2 | Janice Johnston | Heather Beasley |
| 1002 | Compact Model | 50 | extended-presente-15 | 3 | Upal Saha | Audrey Taylor |
| 1003 | Legacy Cluster D | 57 | integrated-presente-16 | 4 | Katherine Snyder | Susan Wagner |

The view v_award_organization links awards to the organizations that presented them, answering which entity sponsored each recognition. Award 1000 was presented by organization 1. Award 1001 was presented by organization 2.

**View `v_award_organization`**

```sql
CREATE VIEW v_award_organization AS
SELECT a.id, a.award_name, a.award_year, a.presented_by, b.organization_id AS organization_organization_id, b.organization_name AS organization_organization_name, b.organization_type AS organization_organization_type
FROM cred_awards a JOIN cred_organizations b ON a.organization_id = b.organization_id;
```

| id | award_name | award_year | presented_by | organization_organization_id | organization_organization_name | organization_organization_type |
|---|---|---|---|---|---|---|
| 1000 | Primary Review A | 36 | baseline-presente-13 | 1 | Staples Inc. | Gulf Oil |
| 1001 | Composite Initiative | 43 | pilot-presente-14 | 2 | Oscar Health Inc. | FSG Social Impact Advisors |
| 1002 | Compact Model | 50 | extended-presente-15 | 3 | Atlantic Richfield | McDonnell Douglas |
| 1003 | Legacy Cluster D | 57 | integrated-presente-16 | 4 | Port Loko | Alliant Energy Corp |

The view v_organization_award provides the reverse linkage, connecting each organization to the awards it has presented. Organization 1 is associated with award 1000, Primary Review A. Organization 2 is associated with award 1001, Composite Initiative.

**View `v_organization_award`**

```sql
CREATE VIEW v_organization_award AS
SELECT a.organization_id, a.organization_name, a.organization_type, a.founding_year, b.id AS award_id, b.award_name AS award_award_name, b.award_year AS award_award_year
FROM cred_organizations a JOIN cred_awards b ON a.award_id = b.id;
```

| organization_id | organization_name | organization_type | founding_year | award_id | award_award_name | award_award_year |
|---|---|---|---|---|---|---|
| 1 | Staples Inc. | Gulf Oil | 43 | 1000 | Primary Review A | 36 |
| 2 | Oscar Health Inc. | FSG Social Impact Advisors | 48 | 1001 | Composite Initiative | 43 |
| 3 | Atlantic Richfield | McDonnell Douglas | 53 | 1002 | Compact Model | 50 |
| 4 | Port Loko | Alliant Energy Corp | 58 | 1003 | Legacy Cluster D | 57 |

The view v_organization_scholarship_fund links organizations to the scholarship funds they administer, answering which fund is managed by each organization. Organization 1 administers scholarship fund 1. Organization 2 administers scholarship fund 2.

**View `v_organization_scholarship_fund`**

```sql
CREATE VIEW v_organization_scholarship_fund AS
SELECT a.organization_id, a.organization_name, a.organization_type, a.founding_year, b.id AS fund_id, b.fund_name AS fund_fund_name, b.established_year AS fund_established_year
FROM cred_organizations a JOIN cred_scholarship_funds b ON a.scholarship_fund_id = b.id;
```

| organization_id | organization_name | organization_type | founding_year | fund_id | fund_fund_name | fund_established_year |
|---|---|---|---|---|---|---|
| 1 | Staples Inc. | Gulf Oil | 43 | 1 | Seasonal Programme | 10 |
| 2 | Oscar Health Inc. | FSG Social Impact Advisors | 48 | 2 | Integrated Standard | 16 |
| 3 | Atlantic Richfield | McDonnell Douglas | 53 | 3 | Extended Framework D | 22 |
| 4 | Port Loko | Alliant Energy Corp | 58 | 4 | Pilot Protocol | 28 |

## Scholarship Fund Relationships

The view v_scholarship_fund_organization connects scholarship funds to their sponsoring organizations, answering which organization manages each fund. Scholarship fund 1 is administered by organization 1. Scholarship fund 2 is administered by organization 2.

**View `v_scholarship_fund_organization`**

```sql
CREATE VIEW v_scholarship_fund_organization AS
SELECT a.id, a.fund_name, a.established_year, a.target_beneficiaries, b.organization_id AS organization_organization_id, b.organization_name AS organization_organization_name, b.organization_type AS organization_organization_type
FROM cred_scholarship_funds a JOIN cred_organizations b ON a.organization_id = b.organization_id;
```

| id | fund_name | established_year | target_beneficiaries | organization_organization_id | organization_organization_name | organization_organization_type |
|---|---|---|---|---|---|---|
| 1 | Seasonal Programme | 10 | integrated-target-76 | 1 | Staples Inc. | Gulf Oil |
| 2 | Integrated Standard | 16 | seasonal-target-77 | 2 | Oscar Health Inc. | FSG Social Impact Advisors |
| 3 | Extended Framework D | 22 | regional-target-78 | 3 | Atlantic Richfield | McDonnell Douglas |
| 4 | Pilot Protocol | 28 | legacy-target-79 | 4 | Port Loko | Alliant Energy Corp |

The view v_scholarship_fund_person links scholarship funds to the persons who benefit from them, answering which individual receives support from each fund. Scholarship fund 1 is associated with person 1, Stephanie Collins Paul Allen. Scholarship fund 2 is associated with person 2, Janice Johnston Heather Beasley.

**View `v_scholarship_fund_person`**

```sql
CREATE VIEW v_scholarship_fund_person AS
SELECT a.id, a.fund_name, a.established_year, a.target_beneficiaries, b.id AS person_id, b.first_name AS person_first_name, b.last_name AS person_last_name
FROM cred_scholarship_funds a JOIN cred_persons b ON a.person_id = b.id;
```

| id | fund_name | established_year | target_beneficiaries | person_id | person_first_name | person_last_name |
|---|---|---|---|---|---|---|
| 1 | Seasonal Programme | 10 | integrated-target-76 | 1 | Stephanie Collins | Paul Allen |
| 2 | Integrated Standard | 16 | seasonal-target-77 | 2 | Janice Johnston | Heather Beasley |
| 3 | Extended Framework D | 22 | regional-target-78 | 3 | Upal Saha | Audrey Taylor |
| 4 | Pilot Protocol | 28 | legacy-target-79 | 4 | Katherine Snyder | Susan Wagner |

## Synthesis

The credit union domain integrates eight core record types—credit unions, executive roles, persons, educational institutions, degree programs, awards, organizations, and scholarship funds—into a coherent structure that supports governance tracking, personnel qualification verification, and recognition management. Credit unions anchor the system with their regulatory and operational attributes, while executive roles provide the leadership layer that connects each union to the individuals who manage it. Persons serve as the central nexus, linking to executive roles, educational institutions, degree programs, and awards, thereby creating a unified profile of each individual's professional and academic trajectory. Educational institutions and their degree programs document the academic credentials that underpin personnel qualifications, while awards and their sponsoring organizations capture the recognitions that validate contributions to the sector. Scholarship funds, administered by organizations and distributed to persons, complete the ecosystem by supporting the financial development of individuals within the credit union community. The views described above synthesize these relationships into readable joins, enabling practitioners to answer specific operational questions about which executive leads which union, which person holds which role, which institution offers which program, and which organization sponsors which award or fund.