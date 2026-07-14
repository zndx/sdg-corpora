The administration of school admissions rests on a network of interlocking records: applications submitted by families, profiles of the children they represent, the guardians who act on their behalf, the addresses that anchor those families to a geography, and the schools that receive and evaluate each submission. Every application carries a status, a reference number, and a timestamp; every child carries a name, a date of birth, and a year group; every guardian carries contact channels and a declared relationship. The junction tables `applications_guardians` and `childs_guardians` capture the reality that a single application may involve multiple guardians and a single child may be associated with multiple guardians across different applications. The views that follow distill these base tables into focused lenses, each answering a specific operational question about the admissions lifecycle.

## The Core Records

**Table `admission_applications`**

| id | application_id | application_date | status | academic_year | reference_number | child_id | school_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|
| 100 | 505997 | 2022-05-16 | submitted | legacy-academic-43 | REF-2039 | 100 | 1152671 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 101 | 1250196 | 2023-10-27 | under_review | compact-academic-44 | REF-2040 | 101 | 1186099 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 102 | 124 | 2024-03-11 | offered | composite-academic-45 | REF-2041 | 102 | 7441154 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 103 | IVC20det40 | 2025-08-22 | refused | primary-academic-46 | REF-2042 | 103 | 338514 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The `admission_applications` table is the central ledger of the admissions process. Each row represents a single submission, identified by both a surrogate `id` and a human-readable `application_id`. The `status` column tracks the lifecycle stage—values observed include `submitted`, `under_review`, `offered`, and `refused`. An `academic_year` field (e.g., `legacy-academic-43`, `compact-academic-44`) groups applications into cohorts, while `reference_number` (such as `REF-2039`) provides an external-facing identifier. The `child_id` and `school_id` columns anchor the application to the relevant child and the target school. Timestamps `created_at` and `updated_at` record when the application was first logged and when it was last modified.

**Table `childs`**

| id | child_id | full_name | date_of_birth | gender | year_group | birth_certificate_reference | has_sibling_child_id | school_id |
|---|---|---|---|---|---|---|---|---|
| 100 | 4793466 | Theodore Mcgrath | 2025-04-02 | Male | seasonal-year-35 | legacy-birth-97 | 100 | 1152671 |
| 101 | 338540 | Account Name | 2022-09-13 | Female | regional-year-36 | compact-birth-98 | 101 | 1186099 |
| 102 | 4985160 | Saipan International Airport | 2023-02-24 | Male | legacy-year-37 | composite-birth-99 | 102 | 7441154 |
| 103 | 1437604 | Norma Fisher | 2024-07-08 | Female | compact-year-38 | primary-birth-100 | 103 | 338514 |

The `childs` table holds the demographic and administrative profile of each applicant. The `full_name` column stores the child's name—`Theodore Mcgrath`, `Account Name`, `Saipan International Airport`, and `Norma Fisher` appear in the data. The `date_of_birth` and `gender` fields provide basic biographical information, while `year_group` (e.g., `seasonal-year-35`, `regional-year-36`) indicates the child's intended placement level. A `birth_certificate_reference` (such as `legacy-birth-97`) serves as an external verification key, and `has_sibling_child_id` links to another child record when a sibling relationship exists. The `school_id` column on this table indicates the school the child is currently associated with.

**Table `guardians`**

| guardian_id | full_name | relationship | home_phone | mobile_phone | work_phone | email | admission_application_id | address_id | child_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | Theodore Mcgrath | Mother | regional-home-54 | distributed-mobile-84 | adaptive-work-71 | seasonal-email-11 | 100 | 727063 | 100 |
| 2 | Account Name | Father | legacy-home-55 | baseline-mobile-85 | distributed-work-72 | regional-email-12 | 101 | 89419 | 101 |
| 3 | Saipan International Airport | Other | compact-home-56 | pilot-mobile-86 | baseline-work-73 | legacy-email-13 | 102 | 1450665 | 102 |
| 4 | Norma Fisher | Mother | composite-home-57 | extended-mobile-87 | pilot-work-74 | compact-email-14 | 103 | 48bea25f-2061-4754-9819-a957dd3d28fb | 103 |

Guardians are the individuals who submit or support applications on behalf of children. The `guardians` table stores their `full_name`, their declared `relationship` to the child (values include `Mother`, `Father`, and `Other`), and a comprehensive set of contact channels: `home_phone`, `mobile_phone`, `work_phone`, and `email`. The `admission_application_id` column ties a guardian directly to a specific application, while `address_id` and `child_id` link the guardian to a physical address and to the child they support.

**Table `addresses`**

| address_id | street | city | county | post_code | address_type | guardian_id | child_id |
|---|---|---|---|---|---|---|---|
| 727063 | compact-street-32 | integrated-city-34 | primary-county-52 | 1450652 | Permanent | 1 | 100 |
| 89419 | composite-street-33 | seasonal-city-35 | adaptive-county-53 | 6564374 | Temporary | 2 | 101 |
| 1450665 | primary-street-34 | regional-city-36 | distributed-county-54 | 727070 | School | 3 | 102 |
| 48bea25f-2061-4754-9819-a957dd3d28fb | adaptive-street-35 | legacy-city-37 | baseline-county-55 | 727043 | Permanent | 4 | 103 |

The `addresses` table records physical locations relevant to the admissions process. Each row contains a `street`, `city`, `county`, and `post_code`. The `address_type` column classifies the address as `Permanent`, `Temporary`, or `School`. The `guardian_id` and `child_id` columns associate the address with a specific guardian and/or child, enabling the system to track where a family resides and where a child is enrolled.

**Table `schools`**

| school_id | school_name | street_address | post_code | telephone | website | child_id | address_id |
|---|---|---|---|---|---|---|---|
| 1152671 | Seasonal Standard | composite-street-15 | 1450652 | adaptive-telephon-23 | https://bugs.launchpad.net/murano/+bug/1294080 | 100 | 727063 |
| 1186099 | Integrated Framework | primary-street-16 | 6564374 | distributed-telephon-24 | https://bugs.launchpad.net/murano/+bug/1294080 | 101 | 89419 |
| 7441154 | Extended Protocol D | adaptive-street-17 | 727070 | baseline-telephon-25 | https://www.nature.com/articles/nphoton.2008.245 | 102 | 1450665 |
| 338514 | Pilot Programme | distributed-street-18 | 727043 | pilot-telephon-26 | https://bugs.launchpad.net/trove/+bug/1347114 | 103 | 48bea25f-2061-4754-9819-a957dd3d28fb |

The `schools` table catalogs the receiving institutions. Each school has a `school_name` (such as `Seasonal Standard`, `Integrated Framework`, `Extended Protocol D`, and `Pilot Programme`), a `street_address`, a `post_code`, a `telephone` number, and a `website` URL. The `child_id` and `address_id` columns on this table link the school record to the children and addresses associated with it.

**Table `applications_guardians`**

| admission_application_id | guardian_id |
|---|---|
| 100 | 1 |
| 100 | 2 |
| 101 | 2 |
| 101 | 3 |
| 102 | 3 |
| 102 | 4 |
| 103 | 4 |
| 103 | 1 |

The `applications_guardians` table is a many-to-many junction that links applications to guardians. A single application can involve multiple guardians, and a single guardian can appear on multiple applications. For example, application `100` is associated with both guardian `1` and guardian `2`, while guardian `1` appears on both application `100` and application `103`. This table captures the collaborative nature of family-based applications.

**Table `childs_guardians`**

| child_id | guardian_id |
|---|---|
| 100 | 1 |
| 100 | 2 |
| 101 | 2 |
| 101 | 3 |
| 102 | 3 |
| 102 | 4 |
| 103 | 4 |
| 103 | 1 |

The `childs_guardians` table similarly serves as a many-to-many junction between children and guardians. It records which guardians are associated with which children, supporting the reality that a child may have multiple guardians and a guardian may be associated with multiple children.

## Admission Application Views

**View `v_admission_application_child`**

```sql
CREATE VIEW v_admission_application_child AS
SELECT a.id, a.application_id, a.application_date, a.status, b.id AS child_id, b.child_id AS child_child_id, b.full_name AS child_full_name
FROM admission_applications a JOIN childs b ON a.child_id = b.id;
```

| id | application_id | application_date | status | child_id | child_child_id | child_full_name |
|---|---|---|---|---|---|---|
| 100 | 505997 | 2022-05-16 | submitted | 100 | 4793466 | Theodore Mcgrath |
| 101 | 1250196 | 2023-10-27 | under_review | 101 | 338540 | Account Name |
| 102 | 124 | 2024-03-11 | offered | 102 | 4985160 | Saipan International Airport |
| 103 | IVC20det40 | 2025-08-22 | refused | 103 | 1437604 | Norma Fisher |

This view joins `admission_applications` with `childs`, answering the question: *what child does this application belong to, and what are that child's details?* Each row in the result combines the application's metadata with the child's profile. For instance, application `505997` (status `submitted`, academic year `legacy-academic-43`) is linked to child `Theodore Mcgrath`, born `2025-04-02`, in year group `seasonal-year-35`. Another row shows application `124` (status `offered`) for child `Saipan International Airport`, born `2023-02-24`, in year group `legacy-year-37`. This view is the primary tool for admissions officers who need to see the applicant and the child in a single record.

**View `v_admission_application_guardian_detail`**

```sql
CREATE VIEW v_admission_application_guardian_detail AS
SELECT a.id, a.application_id, a.application_date, b.guardian_id AS guardian_guardian_id, b.full_name AS guardian_full_name, b.relationship AS guardian_relationship
FROM admission_applications a
  JOIN applications_guardians j ON j.admission_application_id = a.id
  JOIN guardians b ON b.guardian_id = j.guardian_id;
```

| id | application_id | application_date | guardian_guardian_id | guardian_full_name | guardian_relationship |
|---|---|---|---|---|---|
| 100 | 505997 | 2022-05-16 | 1 | Theodore Mcgrath | Mother |
| 100 | 505997 | 2022-05-16 | 2 | Account Name | Father |
| 101 | 1250196 | 2023-10-27 | 2 | Account Name | Father |
| 101 | 1250196 | 2023-10-27 | 3 | Saipan International Airport | Other |
| 102 | 124 | 2024-03-11 | 3 | Saipan International Airport | Other |
| 102 | 124 | 2024-03-11 | 4 | Norma Fisher | Mother |
| 103 | IVC20det40 | 2025-08-22 | 4 | Norma Fisher | Mother |
| 103 | IVC20det40 | 2025-08-22 | 1 | Theodore Mcgrath | Mother |

This view joins `admission_applications` with `guardians`, answering: *which guardian(s) are associated with this application, and how can they be contacted?* Each row pairs an application with a guardian's full name, relationship, and contact details. Application `100` (status `submitted`) appears alongside guardian `Theodore Mcgrath`, who is listed as `Mother` and can be reached at `seasonal-email-11`. Application `101` (status `under_review`) is linked to guardian `Account Name`, listed as `Father`, with email `regional-email-12`. Because the junction table `applications_guardians` allows multiple guardians per application, this view may produce multiple rows for a single application, each representing a different guardian's involvement.

**View `v_admission_application_school`**

```sql
CREATE VIEW v_admission_application_school AS
SELECT a.id, a.application_id, a.application_date, a.status, b.school_id AS school_school_id, b.school_name AS school_school_name, b.street_address AS school_street_address
FROM admission_applications a JOIN schools b ON a.school_id = b.school_id;
```

| id | application_id | application_date | status | school_school_id | school_school_name | school_street_address |
|---|---|---|---|---|---|---|
| 100 | 505997 | 2022-05-16 | submitted | 1152671 | Seasonal Standard | composite-street-15 |
| 101 | 1250196 | 2023-10-27 | under_review | 1186099 | Integrated Framework | primary-street-16 |
| 102 | 124 | 2024-03-11 | offered | 7441154 | Extended Protocol D | adaptive-street-17 |
| 103 | IVC20det40 | 2025-08-22 | refused | 338514 | Pilot Programme | distributed-street-18 |

This view joins `admission_applications` with `schools`, answering: *which school is this application directed to, and what are that school's details?* Each row combines the application's status and reference number with the school's name and contact information. Application `505997` (status `submitted`, reference `REF-2039`) is directed to `Seasonal Standard`, reachable at `adaptive-telephon-23` and online at `https://bugs.launchpad.net/murano/+bug/1294080`. Application `124` (status `offered`, reference `REF-2041`) is directed to `Extended Protocol D`, with telephone `baseline-telephon-25` and website `https://www.nature.com/articles/nphoton.2008.245`. This view is essential for routing communications and for understanding the distribution of applications across schools.

## Child-Centric Views

**View `v_child_child`**

```sql
CREATE VIEW v_child_child AS
SELECT a.id, a.child_id, a.full_name, a.date_of_birth, b.id AS child_id, b.child_id AS child_child_id, b.full_name AS child_full_name
FROM childs a JOIN childs b ON a.has_sibling_child_id = b.id;
```

| id | child_id | full_name | date_of_birth | child_id | child_child_id | child_full_name |
|---|---|---|---|---|---|---|
| 100 | 4793466 | Theodore Mcgrath | 2025-04-02 | 100 | 4793466 | Theodore Mcgrath |
| 101 | 338540 | Account Name | 2022-09-13 | 101 | 338540 | Account Name |
| 102 | 4985160 | Saipan International Airport | 2023-02-24 | 102 | 4985160 | Saipan International Airport |
| 103 | 1437604 | Norma Fisher | 2024-07-08 | 103 | 1437604 | Norma Fisher |

This view operates on the `childs` table, potentially joining a child record with related child data (such as sibling links via `has_sibling_child_id`). It answers: *what is the full profile of this child, and are there related children in the system?* For example, child `Theodore Mcgrath` (id `100`, year group `seasonal-year-35`) has `has_sibling_child_id` set to `100`, indicating a self-referential or sibling-linked relationship. Child `Account Name` (id `101`, year group `regional-year-36`) similarly has `has_sibling_child_id` set to `101`. This view supports queries about sibling groups and family clusters within the admissions data.

**View `v_child_school`**

```sql
CREATE VIEW v_child_school AS
SELECT a.id, a.child_id, a.full_name, a.date_of_birth, b.school_id AS school_school_id, b.school_name AS school_school_name, b.street_address AS school_street_address
FROM childs a JOIN schools b ON a.school_id = b.school_id;
```

| id | child_id | full_name | date_of_birth | school_school_id | school_school_name | school_street_address |
|---|---|---|---|---|---|---|
| 100 | 4793466 | Theodore Mcgrath | 2025-04-02 | 1152671 | Seasonal Standard | composite-street-15 |
| 101 | 338540 | Account Name | 2022-09-13 | 1186099 | Integrated Framework | primary-street-16 |
| 102 | 4985160 | Saipan International Airport | 2023-02-24 | 7441154 | Extended Protocol D | adaptive-street-17 |
| 103 | 1437604 | Norma Fisher | 2024-07-08 | 338514 | Pilot Programme | distributed-street-18 |

This view joins `childs` with `schools`, answering: *which school is associated with this child, and what are that school's details?* Each row pairs a child's name and year group with the school's name and contact information. Child `Theodore Mcgrath` (year group `seasonal-year-35`) is associated with `Seasonal Standard`, located at `composite-street-15` with post code `1450652`. Child `Norma Fisher` (year group `compact-year-38`) is associated with `Pilot Programme`, located at `distributed-street-18` with post code `727043`. This view is useful for understanding the school-to-child mapping and for generating reports on enrollment distribution.

**View `v_child_guardian_detail`**

```sql
CREATE VIEW v_child_guardian_detail AS
SELECT a.id, a.child_id, a.full_name, b.guardian_id AS guardian_guardian_id, b.full_name AS guardian_full_name, b.relationship AS guardian_relationship
FROM childs a
  JOIN childs_guardians j ON j.child_id = a.id
  JOIN guardians b ON b.guardian_id = j.guardian_id;
```

| id | child_id | full_name | guardian_guardian_id | guardian_full_name | guardian_relationship |
|---|---|---|---|---|---|
| 100 | 4793466 | Theodore Mcgrath | 1 | Theodore Mcgrath | Mother |
| 100 | 4793466 | Theodore Mcgrath | 2 | Account Name | Father |
| 101 | 338540 | Account Name | 2 | Account Name | Father |
| 101 | 338540 | Account Name | 3 | Saipan International Airport | Other |
| 102 | 4985160 | Saipan International Airport | 3 | Saipan International Airport | Other |
| 102 | 4985160 | Saipan International Airport | 4 | Norma Fisher | Mother |
| 103 | 1437604 | Norma Fisher | 4 | Norma Fisher | Mother |
| 103 | 1437604 | Norma Fisher | 1 | Theodore Mcgrath | Mother |

This view joins `childs` with `guardians`, answering: *who are the guardians associated with this child, and what is their relationship and contact information?* Each row pairs a child's profile with a guardian's details. Child `Theodore Mcgrath` is linked to guardian `Theodore Mcgrath`, listed as `Mother`, with mobile `distributed-mobile-84` and email `seasonal-email-11`. Child `Account Name` is linked to guardian `Account Name`, listed as `Father`, with mobile `baseline-mobile-85` and email `regional-email-12`. This view is critical for guardianship verification and for ensuring that the correct contact person is reached for each child.

## Guardian-Centric Views

**View `v_guardian_admission_application`**

```sql
CREATE VIEW v_guardian_admission_application AS
SELECT a.guardian_id, a.full_name, a.relationship, a.home_phone, b.id AS application_id, b.application_id AS application_application_id, b.application_date AS application_application_date
FROM guardians a JOIN admission_applications b ON a.admission_application_id = b.id;
```

| guardian_id | full_name | relationship | home_phone | application_id | application_application_id | application_application_date |
|---|---|---|---|---|---|---|
| 1 | Theodore Mcgrath | Mother | regional-home-54 | 100 | 505997 | 2022-05-16 |
| 2 | Account Name | Father | legacy-home-55 | 101 | 1250196 | 2023-10-27 |
| 3 | Saipan International Airport | Other | compact-home-56 | 102 | 124 | 2024-03-11 |
| 4 | Norma Fisher | Mother | composite-home-57 | 103 | IVC20det40 | 2025-08-22 |

This view joins `guardians` with `admission_applications`, answering: *which applications is this guardian involved with, and what is the status of each?* Each row pairs a guardian's name and relationship with the application's status and reference number. Guardian `Theodore Mcgrath` (relationship `Mother`) is associated with application `100` (status `submitted`, reference `REF-2039`). Guardian `Norma Fisher` (relationship `Mother`) is associated with application `103` (status `refused`, reference `REF-2042`). Because a guardian can appear on multiple applications via the `applications_guardians` junction table, this view may produce multiple rows per guardian, reflecting their full involvement across the admissions pipeline.

**View `v_guardian_address`**

```sql
CREATE VIEW v_guardian_address AS
SELECT a.guardian_id, a.full_name, a.relationship, a.home_phone, b.address_id AS address_address_id, b.street AS address_street, b.city AS address_city
FROM guardians a JOIN addresses b ON a.address_id = b.address_id;
```

| guardian_id | full_name | relationship | home_phone | address_address_id | address_street | address_city |
|---|---|---|---|---|---|---|
| 1 | Theodore Mcgrath | Mother | regional-home-54 | 727063 | compact-street-32 | integrated-city-34 |
| 2 | Account Name | Father | legacy-home-55 | 89419 | composite-street-33 | seasonal-city-35 |
| 3 | Saipan International Airport | Other | compact-home-56 | 1450665 | primary-street-34 | regional-city-36 |
| 4 | Norma Fisher | Mother | composite-home-57 | 48bea25f-2061-4754-9819-a957dd3d28fb | adaptive-street-35 | legacy-city-37 |

This view joins `guardians` with `addresses`, answering: *where does this guardian reside, and what type of address is recorded?* Each row pairs a guardian's name and contact details with their address information. Guardian `Theodore Mcgrath` (mobile `distributed-mobile-84`) is associated with address `compact-street-32` in `integrated-city-34`, classified as `Permanent`, with post code `1450652`. Guardian `Account Name` (mobile `baseline-mobile-85`) is associated with address `composite-street-33` in `seasonal-city-35`, classified as `Temporary`, with post code `6564374`. This view supports address verification, correspondence routing, and geographic analysis of the guardian population.

**View `v_guardian_child`**

```sql
CREATE VIEW v_guardian_child AS
SELECT a.guardian_id, a.full_name, a.relationship, a.home_phone, b.id AS child_id, b.child_id AS child_child_id, b.full_name AS child_full_name
FROM guardians a JOIN childs b ON a.child_id = b.id;
```

| guardian_id | full_name | relationship | home_phone | child_id | child_child_id | child_full_name |
|---|---|---|---|---|---|---|
| 1 | Theodore Mcgrath | Mother | regional-home-54 | 100 | 4793466 | Theodore Mcgrath |
| 2 | Account Name | Father | legacy-home-55 | 101 | 338540 | Account Name |
| 3 | Saipan International Airport | Other | compact-home-56 | 102 | 4985160 | Saipan International Airport |
| 4 | Norma Fisher | Mother | composite-home-57 | 103 | 1437604 | Norma Fisher |

This view joins `guardians` with `childs`, answering: *which child is this guardian associated with, and what are that child's details?* Each row pairs a guardian's name and relationship with the child's name, date of birth, and year group. Guardian `Theodore Mcgrath` (relationship `Mother`) is linked to child `Theodore Mcgrath`, born `2025-04-02`, in year group `seasonal-year-35`. Guardian `Norma Fisher` (relationship `Mother`) is linked to child `Norma Fisher`, born `2024-07-08`, in year group `compact-year-38`. This view is the primary tool for verifying guardianship relationships and for generating family-level reports.

## Address-Centric Views

**View `v_address_guardian`**

```sql
CREATE VIEW v_address_guardian AS
SELECT a.address_id, a.street, a.city, a.county, b.guardian_id AS guardian_guardian_id, b.full_name AS guardian_full_name, b.relationship AS guardian_relationship
FROM addresses a JOIN guardians b ON a.guardian_id = b.guardian_id;
```

| address_id | street | city | county | guardian_guardian_id | guardian_full_name | guardian_relationship |
|---|---|---|---|---|---|---|
| 727063 | compact-street-32 | integrated-city-34 | primary-county-52 | 1 | Theodore Mcgrath | Mother |
| 89419 | composite-street-33 | seasonal-city-35 | adaptive-county-53 | 2 | Account Name | Father |
| 1450665 | primary-street-34 | regional-city-36 | distributed-county-54 | 3 | Saipan International Airport | Other |
| 48bea25f-2061-4754-9819-a957dd3d28fb | adaptive-street-35 | legacy-city-37 | baseline-county-55 | 4 | Norma Fisher | Mother |

This view joins `addresses` with `guardians`, answering: *which guardian is associated with this address, and what are that guardian's details?* Each row pairs an address's street, city, and type with the guardian's name and contact information. Address `compact-street-32` in `integrated-city-34` (type `Permanent`, post code `1450652`) is associated with guardian `Theodore Mcgrath` (mobile `distributed-mobile-84`, email `seasonal-email-11`). Address `adaptive-street-35` in `legacy-city-37` (type `Permanent`, post code `727043`) is associated with guardian `Norma Fisher` (mobile `extended-mobile-87`, email `compact-email-14`). This view supports geographic queries and address-based reporting on the guardian population.

**View `v_address_child`**

```sql
CREATE VIEW v_address_child AS
SELECT a.address_id, a.street, a.city, a.county, b.id AS child_id, b.child_id AS child_child_id, b.full_name AS child_full_name
FROM addresses a JOIN childs b ON a.child_id = b.id;
```

| address_id | street | city | county | child_id | child_child_id | child_full_name |
|---|---|---|---|---|---|---|
| 727063 | compact-street-32 | integrated-city-34 | primary-county-52 | 100 | 4793466 | Theodore Mcgrath |
| 89419 | composite-street-33 | seasonal-city-35 | adaptive-county-53 | 101 | 338540 | Account Name |
| 1450665 | primary-street-34 | regional-city-36 | distributed-county-54 | 102 | 4985160 | Saipan International Airport |
| 48bea25f-2061-4754-9819-a957dd3d28fb | adaptive-street-35 | legacy-city-37 | baseline-county-55 | 103 | 1437604 | Norma Fisher |

This view joins `addresses` with `childs`, answering: *which child is associated with this address, and what are that child's details?* Each row pairs an address's location and type with the child's name and year group. Address `compact-street-32` in `integrated-city-34` (type `Permanent`) is associated with child `Theodore Mcgrath` (year group `seasonal-year-35`). Address `adaptive-street-35` in `legacy-city-37` (type `Permanent`) is associated with child `Norma Fisher` (year group `compact-year-38`). This view is useful for understanding the geographic distribution of children and for linking residential locations to school catchment analysis.

## School-Centric Views

**View `v_school_child`**

```sql
CREATE VIEW v_school_child AS
SELECT a.school_id, a.school_name, a.street_address, a.post_code, b.id AS child_id, b.child_id AS child_child_id, b.full_name AS child_full_name
FROM schools a JOIN childs b ON a.child_id = b.id;
```

| school_id | school_name | street_address | post_code | child_id | child_child_id | child_full_name |
|---|---|---|---|---|---|---|
| 1152671 | Seasonal Standard | composite-street-15 | 1450652 | 100 | 4793466 | Theodore Mcgrath |
| 1186099 | Integrated Framework | primary-street-16 | 6564374 | 101 | 338540 | Account Name |
| 7441154 | Extended Protocol D | adaptive-street-17 | 727070 | 102 | 4985160 | Saipan International Airport |
| 338514 | Pilot Programme | distributed-street-18 | 727043 | 103 | 1437604 | Norma Fisher |

This view joins `schools` with `childs`, answering: *which children are associated with this school, and what are their profiles?* Each row pairs a school's name and contact information with a child's name and year group. `Seasonal Standard` (telephone `adaptive-telephon-23`, website `https://bugs.launchpad.net/murano/+bug/1294080`) is associated with child `Theodore Mcgrath` (year group `seasonal-year-35`). `Pilot Programme` (telephone `pilot-telephon-26`, website `https://bugs.launchpad.net/trove/+bug/1347114`) is associated with child `Norma Fisher` (year group `compact-year-38`). This view supports enrollment reporting and helps administrators understand the composition of each school's applicant pool.

**View `v_school_address`**

```sql
CREATE VIEW v_school_address AS
SELECT a.school_id, a.school_name, a.street_address, a.post_code, b.address_id AS address_address_id, b.street AS address_street, b.city AS address_city
FROM schools a JOIN addresses b ON a.address_id = b.address_id;
```

| school_id | school_name | street_address | post_code | address_address_id | address_street | address_city |
|---|---|---|---|---|---|---|
| 1152671 | Seasonal Standard | composite-street-15 | 1450652 | 727063 | compact-street-32 | integrated-city-34 |
| 1186099 | Integrated Framework | primary-street-16 | 6564374 | 89419 | composite-street-33 | seasonal-city-35 |
| 7441154 | Extended Protocol D | adaptive-street-17 | 727070 | 1450665 | primary-street-34 | regional-city-36 |
| 338514 | Pilot Programme | distributed-street-18 | 727043 | 48bea25f-2061-4754-9819-a957dd3d28fb | adaptive-street-35 | legacy-city-37 |

This view joins `schools` with `addresses`, answering: *which address is associated with this school, and what are the address details?* Each row pairs a school's name and contact information with an address's street, city, and type. `Seasonal Standard` is associated with address `composite-street-15` in the post code `1450652`. `Pilot Programme` is associated with address `distributed-street-18` in the post code `727043`. This view supports facility management, geographic mapping of school locations, and correspondence routing to school premises.

## Closing Synthesis

The admissions domain is structured around five base entities—applications, children, guardians, addresses, and schools—connected through direct foreign-key columns and two many-to-many junction tables. The junction tables `applications_guardians` and `childs_guardians` capture the complexity of real-world family structures, where a single application may involve multiple guardians and a single child may be associated with multiple guardians. The twelve views distill these base tables into focused lenses: application-centric views (`v_admission_application_child`, `v_admission_application_guardian_detail`, `v_admission_application_school`) answer questions about the application and its participants; child-centric views (`v_child_child`, `v_child_school`, `v_child_guardian_detail`) answer questions about the applicant and their connections; guardian-centric views (`v_guardian_admission_application`, `v_guardian_address`, `v_guardian_child`) answer questions about the supporting adults; address-centric views (`v_address_guardian`, `v_address_child`) answer questions about geography; and school-centric views (`v_school_child`, `v_school_address`) answer questions about the receiving institutions. Together, these records and views form a coherent operational picture of the school admissions process, from initial submission through to final placement.