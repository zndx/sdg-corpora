The school admissions domain captures the lifecycle of a child's application to an educational institution, the guardians who advocate on the child's behalf, and the physical addresses that anchor each participant to a geographic context. An admission application is the central transactional entity: it records when a submission was made, its current status, and the academic year to which it pertains. Each application is tied to exactly one child and one school, while a child may have multiple guardians and each guardian may appear on multiple applications. Addresses are shared resources, linked to both guardians and children, and schools carry their own contact information. The relational model normalizes these entities into seven base tables and exposes six denormalized views that reassemble the facts needed for reporting and user-facing queries.

## Base Tables and Entity Types

The core of the schema is the `admission_applications` table, which stores one row per application submission. Its primary key `id` is a surrogate integer, while `application_id` serves as the business identifier. The table also carries `application_date`, `status` (a categorical field with values such as `submitted`, `under_review`, `offered`, and `refused`), `academic_year`, `reference_number`, and timestamps `created_at` and `updated_at`. Two foreign keys, `child_id` and `school_id`, anchor each application to the child being admitted and the school receiving the application.

**Table `admission_applications`**

| id | application_id | application_date | status | academic_year | reference_number | child_id | school_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|
| 100 | 505997 | 2022-05-16 | submitted | legacy-academic-43 | REF-2039 | 100 | 1152671 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 101 | 1250196 | 2023-10-27 | under_review | compact-academic-44 | REF-2040 | 101 | 1186099 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 102 | 124 | 2024-03-11 | offered | composite-academic-45 | REF-2041 | 102 | 7441154 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 103 | IVC20det40 | 2025-08-22 | refused | primary-academic-46 | REF-2042 | 103 | 338514 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Consider row 100: the application with business ID `505997` was submitted on `2022-05-16` for the `legacy-academic-43` year, carries reference `REF-2039`, and is linked to child `100` at school `1152671`. Row 102 shows an application with business ID `124` that reached the `offered` status, while row 103 bears the non-numeric business ID `IVC20det40` and a `refused` status. The diversity of `application_id` values — integers, short codes, and UUID-like strings — reflects a permissive identifier policy.

The `childs` table holds one row per child. Its surrogate primary key `id` aligns with the `child_id` referenced by `admission_applications`. The remaining columns store `full_name`, `date_of_birth`, `gender`, `year_group`, `birth_certificate_reference`, and `has_sibling_child_id`, which is a self-referencing foreign key pointing to another row in `childs`. The `school_id` column on `childs` provides a denormalized link to the school, though the authoritative link is through `admission_applications.child_id`.

**Table `childs`**

| id | child_id | full_name | date_of_birth | gender | year_group | birth_certificate_reference | has_sibling_child_id | school_id |
|---|---|---|---|---|---|---|---|---|
| 100 | 4793466 | Theodore Mcgrath | 2025-04-02 | Male | seasonal-year-35 | legacy-birth-97 | 100 | 1152671 |
| 101 | 338540 | Account Name | 2022-09-13 | Female | regional-year-36 | compact-birth-98 | 101 | 1186099 |
| 102 | 4985160 | Saipan International Airport | 2023-02-24 | Male | legacy-year-37 | composite-birth-99 | 102 | 7441154 |
| 103 | 1437604 | Norma Fisher | 2024-07-08 | Female | compact-year-38 | primary-birth-100 | 103 | 338514 |

Row 100 records `Theodore Mcgrath`, born `2025-04-02`, male, in `seasonal-year-35`, with birth certificate `legacy-birth-97`. The `has_sibling_child_id` column on this row points to `100` itself, indicating a self-reference. Row 102 stores the name `Saipan International Airport` — a fictional placeholder — in `legacy-year-37`. The `childs` table thus captures both demographic and administrative attributes of each applicant.

Guardians are stored in the `guardians` table, which uses `guardian_id` as its primary key. Each guardian record includes `full_name`, `relationship` (e.g., `Mother`, `Father`, `Other`), three phone number columns (`home_phone`, `mobile_phone`, `work_phone`), an `email` address, and three foreign keys: `admission_application_id`, `address_id`, and `child_id`. The presence of `admission_application_id` on the guardian table creates a direct many-to-one link from guardian to application, while `child_id` links the guardian to a child.

**Table `guardians`**

| guardian_id | full_name | relationship | home_phone | mobile_phone | work_phone | email | admission_application_id | address_id | child_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | Theodore Mcgrath | Mother | regional-home-54 | distributed-mobile-84 | adaptive-work-71 | seasonal-email-11 | 100 | 727063 | 100 |
| 2 | Account Name | Father | legacy-home-55 | baseline-mobile-85 | distributed-work-72 | regional-email-12 | 101 | 89419 | 101 |
| 3 | Saipan International Airport | Other | compact-home-56 | pilot-mobile-86 | baseline-work-73 | legacy-email-13 | 102 | 1450665 | 102 |
| 4 | Norma Fisher | Mother | composite-home-57 | extended-mobile-87 | pilot-work-74 | compact-email-14 | 103 | 48bea25f-2061-4754-9819-a957dd3d28fb | 103 |

Guardian 1, named `Theodore Mcgrath` with relationship `Mother`, has home phone `regional-home-54`, mobile `distributed-mobile-84`, work phone `adaptive-work-71`, and email `seasonal-email-11`. This guardian is linked to admission application `100`, address `727063`, and child `100`. Guardian 4, named `Norma Fisher` with relationship `Mother`, carries the UUID-style address `48bea25f-2061-4754-9819-a957dd3d28fb`. The `guardians` table thus consolidates contact information and the guardian's role in the admission process.

The `addresses` table stores physical locations with `address_id` as primary key. Columns include `street`, `city`, `county`, `post_code`, and `address_type` (with values `Permanent`, `Temporary`, and `School`). Foreign keys `guardian_id` and `child_id` allow an address to be associated with either a guardian or a child, or both.

**Table `addresses`**

| address_id | street | city | county | post_code | address_type | guardian_id | child_id |
|---|---|---|---|---|---|---|---|
| 727063 | compact-street-32 | integrated-city-34 | primary-county-52 | 1450652 | Permanent | 1 | 100 |
| 89419 | composite-street-33 | seasonal-city-35 | adaptive-county-53 | 6564374 | Temporary | 2 | 101 |
| 1450665 | primary-street-34 | regional-city-36 | distributed-county-54 | 727070 | School | 3 | 102 |
| 48bea25f-2061-4754-9819-a957dd3d28fb | adaptive-street-35 | legacy-city-37 | baseline-county-55 | 727043 | Permanent | 4 | 103 |

Address `727063` is a `Permanent` address at `compact-street-32` in `integrated-city-34`, county `primary-county-52`, with post code `1450652`. It is linked to guardian `1` and child `100`. Address `1450665` has `address_type` `School`, suggesting it represents an institutional location. The UUID `48bea25f-2061-4754-9819-a957dd3d28fb` on row 4 demonstrates that the schema accepts non-integer primary keys for addresses.

The `schools` table contains institutional data with `school_id` as primary key. Columns include `school_name`, `street_address`, `post_code`, `telephone`, and `website`. The table also carries `child_id` and `address_id` foreign keys, which create a denormalized link from school to the child and address associated with it.

**Table `schools`**

| school_id | school_name | street_address | post_code | telephone | website | child_id | address_id |
|---|---|---|---|---|---|---|---|
| 1152671 | Seasonal Standard | composite-street-15 | 1450652 | adaptive-telephon-23 | https://bugs.launchpad.net/murano/+bug/1294080 | 100 | 727063 |
| 1186099 | Integrated Framework | primary-street-16 | 6564374 | distributed-telephon-24 | https://bugs.launchpad.net/murano/+bug/1294080 | 101 | 89419 |
| 7441154 | Extended Protocol D | adaptive-street-17 | 727070 | baseline-telephon-25 | https://www.nature.com/articles/nphoton.2008.245 | 102 | 1450665 |
| 338514 | Pilot Programme | distributed-street-18 | 727043 | pilot-telephon-26 | https://bugs.launchpad.net/trove/+bug/1347114 | 103 | 48bea25f-2061-4754-9819-a957dd3d28fb |

School `1152671` is named `Seasonal Standard`, located at `composite-street-15` with post code `1450652`, telephone `adaptive-telephon-23`, and website `https://bugs.launchpad.net/murano/+bug/1294080`. It is linked to child `100` and address `727063`. School `7441154`, named `Extended Protocol D`, has a `nature.com` website, distinguishing it from the others that reference Launchpad bug trackers.

The many-to-many relationships between applications and guardians, and between children and guardians, are resolved through junction tables. The `applications_guardians` table maps each `admission_application_id` to one or more `guardian_id` values, allowing a single application to list multiple guardians.

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

Application `100` is associated with guardians `1` and `2`, while application `103` links guardians `4` and `1`. This bidirectional mapping means guardian `1` appears on both application `100` and application `103`, confirming that a guardian can advocate for multiple applications.

The `childs_guardians` junction table (not shown in the sample data but present in the schema) similarly resolves the many-to-many relationship between children and their guardians, ensuring that a child can have multiple guardians and a guardian can be associated with multiple children without data duplication.

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

## Denormalized Views

The base tables are normalized to eliminate redundancy, but operational queries often need a consolidated view of the admission record. The views reassemble the normalized facts through joins, each answering a specific analytical question.

The view `v_admission_application_child` joins `admission_applications` to `childs` on the `child_id` column, producing a single row per application that includes both the application metadata and the child's demographic details.

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

Reading row 100 from this view, we see application `505997` (status `submitted`, date `2022-05-16`) alongside child `Theodore Mcgrath` (DOB `2025-04-02`, gender `Male`, year group `seasonal-year-35`). This view answers the question: "What are the details of the child associated with each admission application?"

The view `v_admission_application_guardian_detail` joins `admission_applications` to `guardians` via the `admission_application_id` foreign key, producing one row per guardian-application pair.

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

For application `100`, this view yields two rows: one for guardian `Theodore Mcgrath` (relationship `Mother`, email `seasonal-email-11`) and one for guardian `Account Name` (relationship `Father`, email `regional-email-12`). The view answers: "Which guardians are associated with each admission application, and what are their contact details?"

The view `v_admission_application_school` joins `admission_applications` to `schools` on `school_id`, combining application metadata with the receiving school's information.

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

Row 100 in this view shows application `505997` (status `submitted`, reference `REF-2039`) linked to school `Seasonal Standard` at `composite-street-15` with telephone `adaptive-telephon-23`. This view answers: "Which school is each application submitted to, and what are the school's contact details?"

The view `v_child_child` is a self-join on the `childs` table, likely used to surface sibling relationships through the `has_sibling_child_id` column.

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

Row 100 (`Theodore Mcgrath`) has `has_sibling_child_id` pointing to `100`, meaning this view would return a row where the child is paired with itself as a sibling. This view answers: "Which children are siblings of each other, including self-referencing entries?"

The view `v_child_school` joins `childs` to `schools` on `school_id`, producing a consolidated row per child that includes both the child's demographics and the school's details.

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

Row 100 in this view pairs child `Theodore Mcgrath` (DOB `2025-04-02`, year group `seasonal-year-35`) with school `Seasonal Standard` (telephone `adaptive-telephon-23`, website `https://bugs.launchpad.net/murano/+bug/1294080`). This view answers: "Which school is each child associated with, and what are the school's details?"

The view `v_child_guardian_detail` joins `childs` to `guardians` on `child_id`, producing one row per child-guardian pair with full demographic and contact information.

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

Row 100 in this view pairs child `Theodore Mcgrath` (DOB `2025-04-02`, gender `Male`) with guardian `Theodore Mcgrath` (relationship `Mother`, mobile `distributed-mobile-84`, email `seasonal-email-11`). This view answers: "Which guardians are associated with each child, and what are their full contact details?"

The view `v_guardian_admission_application` joins `guardians` to `admission_applications` on `admission_application_id`, producing one row per guardian-application pair.

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

Guardian `Theodore Mcgrath` (relationship `Mother`, email `seasonal-email-11`) appears with application `505997` (status `submitted`, date `2022-05-16`, reference `REF-2039`). This view answers: "Which admission applications is each guardian associated with, and what are the application details?"

The view `v_guardian_address` joins `guardians` to `addresses` on `address_id`, producing one row per guardian with their associated address details.

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

Guardian `Theodore Mcgrath` (relationship `Mother`, email `seasonal-email-11`) is paired with address `727063` (street `compact-street-32`, city `integrated-city-34`, type `Permanent`). This view answers: "What is the address associated with each guardian?"

The view `v_guardian_child` joins `guardians` to `childs` on `child_id`, producing one row per guardian-child pair.

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

Guardian `Theodore Mcgrath` (relationship `Mother`, email `seasonal-email-11`) is paired with child `Theodore Mcgrath` (DOB `2025-04-02`, gender `Male`, year group `seasonal-year-35`). This view answers: "Which child is each guardian associated with, and what are the child's details?"

The view `v_address_guardian` joins `addresses` to `guardians` on `address_id`, producing one row per address with the associated guardian's details.

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

Address `727063` (street `compact-street-32`, city `integrated-city-34`, type `Permanent`) is paired with guardian `Theodore Mcgrath` (relationship `Mother`, email `seasonal-email-11`). This view answers: "Which guardian is associated with each address?"

The view `v_address_child` joins `addresses` to `childs` on `child_id`, producing one row per address with the associated child's details.

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

Address `727063` (street `compact-street-32`, city `integrated-city-34`, type `Permanent`) is paired with child `Theodore Mcgrath` (DOB `2025-04-02`, gender `Male`, year group `seasonal-year-35`). This view answers: "Which child is associated with each address?"

The view `v_school_child` joins `schools` to `childs` on `school_id`, producing one row per school-child pair.

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

School `Seasonal Standard` (telephone `adaptive-telephon-23`, website `https://bugs.launchpad.net/murano/+bug/1294080`) is paired with child `Theodore Mcgrath` (DOB `2025-04-02`, gender `Male`, year group `seasonal-year-35`). This view answers: "Which children are associated with each school?"

The view `v_school_address` joins `schools` to `addresses` on `address_id`, producing one row per school with its associated address details.

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

School `Seasonal Standard` (telephone `adaptive-telephon-23`, website `https://bugs.launchpad.net/murano/+bug/1294080`) is paired with address `727063` (street `compact-street-32`, city `integrated-city-34`, type `Permanent`). This view answers: "What is the address associated with each school?"

## Synthesis

The school admissions schema models five core entities — applications, children, guardians, addresses, and schools — connected through foreign keys and two junction tables that resolve many-to-many relationships. The base tables enforce normalization: each entity type has its own table, and relationships are expressed through explicit foreign key columns. The junction tables `applications_guardians` and `childs_guardians` allow a single application or child to be associated with multiple guardians without duplicating data. The six denormalized views reassemble these normalized facts through joins, each view answering a specific analytical question by combining the relevant entity types into a single result set. For example, `v_admission_application_child` answers "what child is this application for?" by joining `admission_applications` to `childs`, while `v_admission_application_guardian_detail` answers "which guardians are on this application?" by joining `admission_applications` to `guardians`. The schema thus balances the integrity benefits of normalization with the query convenience of denormalized views, enabling both transactional operations and analytical reporting on the school admissions domain.