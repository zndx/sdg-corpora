The educational ecosystem under study comprises institutions, facilities, people, programs, awards, government bodies, and policies — all interrelated through a carefully normalized relational schema. At its core, the domain models how educational organizations occupy physical buildings, run structured programs, employ or affiliate persons, receive awards from government bodies, and operate under government-issued policies. The schema separates these concerns into seven base tables, three junction tables for many-to-many relationships, and a suite of materialized views that reconstruct domain facts for reporting.

## Base Tables and Entity Types

The schema's backbone is the `educational_organizations` table, which stores one row per institution. Each row carries a surrogate primary key `educational_organization_id`, a human-readable `organization_id` such as "Shell Oil" or "GlobalPlatform Inc.", a descriptive `name` like "Extended Review" or "Pilot Initiative A", a `founding_date` (e.g. `2023-06-24`), a `legal_status` drawn from the values `nonprofit`, `state-supported`, or `independent`, a `tuition_policy` (`free`, `tuition-charging`, or `scholarship-providing`), and a boolean `is_state_supported`. Two foreign keys anchor this entity to the physical and curricular worlds: `building_id` points to a row in `buildings`, and `educational_program_id` points to a row in `educational_programs`. For instance, the organization "Shell Oil" (id 1) is a nonprofit founded on 2023-06-24 that offers free tuition, is state-supported, and is housed in building 1 while running program 1.

**Table `educational_organizations`**

| educational_organization_id | organization_id | name | founding_date | legal_status | tuition_policy | is_state_supported | building_id | educational_program_id |
|---|---|---|---|---|---|---|---|---|
| 1 | Shell Oil | Extended Review | 2023-06-24 | nonprofit | free | true | 1 | 1 |
| 2 | GlobalPlatform Inc. | Pilot Initiative A | 2024-11-08 | state-supported | tuition-charging | false | 2 | 2 |
| 3 | Whatsapp Inc. | Baseline Model | 2025-04-19 | independent | scholarship-providing | true | 3 | 3 |
| 4 | American Institutes for Research | Distributed Cluster | 2022-09-03 | nonprofit | free | false | 4 | 4 |

The `buildings` table captures facility metadata. Its primary key `id` is a surrogate integer, while `building_id` holds a distinct identifier such as `10090` or `3744019`. Physical attributes include `address` (e.g. "distributed-address-72"), `district` ("integrated-district-40"), `construction_year` (a small integer like 14 or 35), `last_renovation_date`, `lease_term_years`, `lease_start_date`, and `lease_grantor` ("adaptive-lease-41"). The foreign key `educational_organization_id` links each building to the organization that occupies it — building 1 is occupied by educational organization 1 ("Shell Oil").

**Table `buildings`**

| id | building_id | address | district | construction_year | last_renovation_date | lease_term_years | lease_start_date | lease_grantor | educational_organization_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 10090 | distributed-address-72 | integrated-district-40 | 14 | 2025-08-19 | 17 | 2024-07-24 | adaptive-lease-41 | 1 |
| 2 | 3744019 | baseline-address-73 | seasonal-district-41 | 21 | 2022-01-03 | 24 | 2025-12-08 | distributed-lease-42 | 2 |
| 3 | 3001009030150 | pilot-address-74 | regional-district-42 | 28 | 2023-06-14 | 31 | 2022-05-19 | baseline-lease-43 | 3 |
| 4 | 325468 | extended-address-75 | legacy-district-43 | 35 | 2024-11-25 | 38 | 2023-10-03 | pilot-lease-44 | 4 |

The `persons` table stores individuals with roles in the ecosystem. Its primary key is `person_id`, and each row carries `full_name` ("Theodore Mcgrath", "Account Name", "Saipan International Airport", "Norma Fisher"), `role` ("president", "lecturer", "researcher", "dean"), `affiliation`, `email`, and a boolean `is_draft_exempt`. Four foreign keys give each person multiple contextual links: `educational_organization_id` records the primary institution, `teaches_at_educational_organization_id` records where the person teaches, `government_body_id` links to a regulatory body, and `award_id` links to a recognition. Person 100, Theodore Mcgrath, is a president affiliated with organization 1, teaches at organization 1, is associated with government body 100, and holds award 1.

**Table `persons`**

| person_id | full_name | role | affiliation | email | is_draft_exempt | educational_organization_id | teaches_at_educational_organization_id | government_body_id | award_id |
|---|---|---|---|---|---|---|---|---|---|
| 100 | Theodore Mcgrath | president | baseline-affiliat-55 | seasonal-email-11 | true | 1 | 1 | 100 | 1 |
| 101 | Account Name | lecturer | pilot-affiliat-56 | regional-email-12 | false | 2 | 2 | 101 | 2 |
| 102 | Saipan International Airport | researcher | extended-affiliat-57 | legacy-email-13 | true | 3 | 3 | 102 | 3 |
| 103 | Norma Fisher | dean | integrated-affiliat-58 | compact-email-14 | false | 4 | 4 | 103 | 4 |

The `educational_programs` table describes structured learning offerings. Its primary key `id` is a surrogate, while `program_id` holds a distinct identifier (e.g. `103176`, `2986219`). Attributes include `program_name` ("Extended Review", "Pilot Initiative A", "Baseline Model", "Distributed Cluster"), `program_type` (values like `college`, `curriculum`, `teacher-training`, `math-contest`), `target_audience` ("high-school", "undergraduate", "graduate", "teachers"), `is_draft_exempt`, and `enrollment_count` (ranging from 1 to 33). Two foreign keys connect the program to its parent organization (`educational_organization_id`) and its physical location (`building_id`). Program 1, "Extended Review", is a college-level program targeting high-school students with 26 enrollments, run by organization 1 and housed in building 1.

**Table `educational_programs`**

| id | program_id | program_name | program_type | target_audience | is_draft_exempt | enrollment_count | educational_organization_id | building_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 103176 | Extended Review | college | high-school | true | 26 | 1 | 1 |
| 2 | 2986219 | Pilot Initiative A | curriculum | undergraduate | false | 1 | 2 | 2 |
| 3 | 1186079 | Baseline Model | teacher-training | graduate | true | 33 | 3 | 3 |
| 4 | 1562855 | Distributed Cluster | math-contest | teachers | false | 15 | 4 | 4 |

The `awards` table records recognitions and grants. Its primary key is `award_id`, and each row carries `award_name` ("Primary Review A", "Composite Initiative", "Compact Model", "Legacy Cluster D"), `granting_authority` ("integrated-granting-40", "seasonal-granting-41", etc.), `award_date`, `monetary_value` (ranging from 11.45 to 21.80), a foreign key `government_body_id` pointing to the awarding body, and `created_at` (a timestamp such as `2025-01-01 00:14:00`). Award 1, "Primary Review A", was granted on 2025-12-01 by authority "integrated-granting-40" with a monetary value of 11.45, and is associated with government body 100.

**Table `awards`**

| award_id | award_name | granting_authority | award_date | monetary_value | government_body_id | created_at |
|---|---|---|---|---|---|---|
| 1 | Primary Review A | integrated-granting-40 | 2025-12-01 | 11.45 | 100 | 2025-01-01 00:14:00 |
| 2 | Composite Initiative | seasonal-granting-41 | 2022-05-12 | 14.90 | 101 | 2025-02-06 03:14:00 |
| 3 | Compact Model | regional-granting-42 | 2023-10-23 | 18.35 | 102 | 2025-03-11 06:14:00 |
| 4 | Legacy Cluster D | legacy-granting-43 | 2024-03-07 | 21.80 | 103 | 2025-04-16 09:14:00 |

The `government_bodies` table stores regulatory entities. Its primary key `id` is a surrogate integer, while `body_id` holds a distinct identifier (e.g. `6564383`, `168556`, `strategic`, `195361`). Attributes include `body_name` ("Regional Corridor", "Seasonal Series D", "Integrated Assessment", "Extended Survey"), `jurisdiction_level` ("municipal", "regional", "national"), `head_official`, and three foreign keys: `educational_organization_id` links the body to an organization it oversees, `award_id` links to an award it administers, and `policy_id` links to a policy it issues. Body 100, "Regional Corridor", operates at the municipal level with head official "primary-head-22", oversees organization 1, administers award 1, and issues policy 100.

**Table `government_bodies`**

| id | body_id | body_name | jurisdiction_level | head_official | educational_organization_id | award_id | policy_id |
|---|---|---|---|---|---|---|---|
| 100 | 6564383 | Regional Corridor | municipal | primary-head-22 | 1 | 1 | 100 |
| 101 | 168556 | Seasonal Series D | regional | adaptive-head-23 | 2 | 2 | 101 |
| 102 | strategic | Integrated Assessment | national | distributed-head-24 | 3 | 3 | 102 |
| 103 | 195361 | Extended Survey | municipal | baseline-head-25 | 4 | 4 | 103 |

The `policies` table captures governance rules. Its primary key is `policy_id`, and each row carries `policy_name`, `policy_type`, `effective_date`, and a foreign key `government_body_id` pointing to the issuing body. Policies are the terminal entity in the government-body hierarchy — they are issued by, but do not issue, other entities.

**Table `policies`**

| policy_id | policy_title | effective_date | status | affects_draft_exemption | government_body_id | educational_program_id |
|---|---|---|---|---|---|---|
| 100 | Baseline Initiative D | 2023-02-14 | active | true | 100 | 1 |
| 101 | Distributed Model | 2024-07-25 | pending | false | 101 | 2 |
| 102 | Adaptive Cluster | 2025-12-09 | repealed | true | 102 | 3 |
| 103 | Primary Review A | 2022-05-20 | active | false | 103 | 4 |

## Junction Tables for Many-to-Many Relationships

Three junction tables resolve many-to-many relationships that cannot be expressed through single foreign keys. The `organizations_persons` table links `educational_organizations` to `persons` via `organization_id` and `person_id` columns, allowing a person to hold multiple organizational affiliations and an organization to employ multiple persons. The `programs_persons` table similarly links `educational_programs` to `persons` through `program_id` and `person_id`, supporting scenarios where a person teaches or enrolls in multiple programs and a program has multiple participants. The `awards_persons` table connects `awards` to `persons` via `award_id` and `person_id`, enabling an award to be shared among multiple recipients and a person to receive multiple awards.

**Table `organizations_persons`**

| educational_organization_id | person_id |
|---|---|
| 1 | 100 |
| 1 | 101 |
| 2 | 101 |
| 2 | 102 |
| 3 | 102 |
| 3 | 103 |
| 4 | 103 |
| 4 | 100 |
**Table `programs_persons`**

| educational_program_id | person_id |
|---|---|
| 1 | 100 |
| 1 | 101 |
| 2 | 101 |
| 2 | 102 |
| 3 | 102 |
| 3 | 103 |
| 4 | 103 |
| 4 | 100 |
**Table `awards_persons`**

| award_id | person_id |
|---|---|
| 1 | 100 |
| 1 | 101 |
| 2 | 101 |
| 2 | 102 |
| 3 | 102 |
| 3 | 103 |
| 4 | 103 |
| 4 | 100 |

## Materialized Views

The schema provides twelve materialized views that join normalized tables to answer common domain questions. Each view reconstructs a composite fact from its constituent tables.

The view `v_educational_organization_building` joins `educational_organizations` with `buildings` on the `building_id` foreign key, producing a row per organization-building pair. It answers the question "which building houses which organization?" — for example, organization 1 ("Shell Oil") is housed in building 1 ("distributed-address-72").

**View `v_educational_organization_building`**

```sql
CREATE VIEW v_educational_organization_building AS
SELECT a.educational_organization_id, a.organization_id, a.name, a.founding_date, b.id AS building_id, b.building_id AS building_building_id, b.address AS building_address
FROM educational_organizations a JOIN buildings b ON a.building_id = b.id;
```

| educational_organization_id | organization_id | name | founding_date | building_id | building_building_id | building_address |
|---|---|---|---|---|---|---|
| 1 | Shell Oil | Extended Review | 2023-06-24 | 1 | 10090 | distributed-address-72 |
| 2 | GlobalPlatform Inc. | Pilot Initiative A | 2024-11-08 | 2 | 3744019 | baseline-address-73 |
| 3 | Whatsapp Inc. | Baseline Model | 2025-04-19 | 3 | 3001009030150 | pilot-address-74 |
| 4 | American Institutes for Research | Distributed Cluster | 2022-09-03 | 4 | 325468 | extended-address-75 |

The view `v_educational_organization_person_detail` joins `educational_organizations` with `persons` on `educational_organization_id`, yielding one row per person-organization pairing. It answers "which persons belong to which organization?" — person 100 (Theodore Mcgrath, president) is affiliated with organization 1 ("Shell Oil").

**View `v_educational_organization_person_detail`**

```sql
CREATE VIEW v_educational_organization_person_detail AS
SELECT a.educational_organization_id, a.organization_id, a.name, b.person_id AS person_person_id, b.full_name AS person_full_name, b.role AS person_role
FROM educational_organizations a
  JOIN organizations_persons j ON j.educational_organization_id = a.educational_organization_id
  JOIN persons b ON b.person_id = j.person_id;
```

| educational_organization_id | organization_id | name | person_person_id | person_full_name | person_role |
|---|---|---|---|---|---|
| 1 | Shell Oil | Extended Review | 100 | Theodore Mcgrath | president |
| 1 | Shell Oil | Extended Review | 101 | Account Name | lecturer |
| 2 | GlobalPlatform Inc. | Pilot Initiative A | 101 | Account Name | lecturer |
| 2 | GlobalPlatform Inc. | Pilot Initiative A | 102 | Saipan International Airport | researcher |
| 3 | Whatsapp Inc. | Baseline Model | 102 | Saipan International Airport | researcher |
| 3 | Whatsapp Inc. | Baseline Model | 103 | Norma Fisher | dean |
| 4 | American Institutes for Research | Distributed Cluster | 103 | Norma Fisher | dean |
| 4 | American Institutes for Research | Distributed Cluster | 100 | Theodore Mcgrath | president |

The view `v_educational_organization_educational_program` joins `educational_organizations` with `educational_programs` on `educational_program_id`, answering "which programs does each organization run?" — organization 1 runs program 1 ("Extended Review"), a college-level offering.

**View `v_educational_organization_educational_program`**

```sql
CREATE VIEW v_educational_organization_educational_program AS
SELECT a.educational_organization_id, a.organization_id, a.name, a.founding_date, b.id AS program_id, b.program_id AS program_program_id, b.program_name AS program_program_name
FROM educational_organizations a JOIN educational_programs b ON a.educational_program_id = b.id;
```

| educational_organization_id | organization_id | name | founding_date | program_id | program_program_id | program_program_name |
|---|---|---|---|---|---|---|
| 1 | Shell Oil | Extended Review | 2023-06-24 | 1 | 103176 | Extended Review |
| 2 | GlobalPlatform Inc. | Pilot Initiative A | 2024-11-08 | 2 | 2986219 | Pilot Initiative A |
| 3 | Whatsapp Inc. | Baseline Model | 2025-04-19 | 3 | 1186079 | Baseline Model |
| 4 | American Institutes for Research | Distributed Cluster | 2022-09-03 | 4 | 1562855 | Distributed Cluster |

The view `v_building_educational_organization` performs the inverse join of the building-to-organization direction, answering "which organization occupies which building?" — building 1 ("distributed-address-72") is occupied by organization 1 ("Shell Oil").

**View `v_building_educational_organization`**

```sql
CREATE VIEW v_building_educational_organization AS
SELECT a.id, a.building_id, a.address, a.district, b.educational_organization_id AS organization_educational_organization_id, b.organization_id AS organization_organization_id, b.name AS organization_name
FROM buildings a JOIN educational_organizations b ON a.educational_organization_id = b.educational_organization_id;
```

| id | building_id | address | district | organization_educational_organization_id | organization_organization_id | organization_name |
|---|---|---|---|---|---|---|
| 1 | 10090 | distributed-address-72 | integrated-district-40 | 1 | Shell Oil | Extended Review |
| 2 | 3744019 | baseline-address-73 | seasonal-district-41 | 2 | GlobalPlatform Inc. | Pilot Initiative A |
| 3 | 3001009030150 | pilot-address-74 | regional-district-42 | 3 | Whatsapp Inc. | Baseline Model |
| 4 | 325468 | extended-address-75 | legacy-district-43 | 4 | American Institutes for Research | Distributed Cluster |

The view `v_person_educational_organization` joins `persons` with `educational_organizations` on the person's primary `educational_organization_id`, answering "which organization is each person primarily affiliated with?" — person 100 (Theodore Mcgrath) is primarily affiliated with organization 1.

**View `v_person_educational_organization`**

```sql
CREATE VIEW v_person_educational_organization AS
SELECT a.person_id, a.full_name, a.role, a.affiliation, b.educational_organization_id AS organization_educational_organization_id, b.organization_id AS organization_organization_id, b.name AS organization_name
FROM persons a JOIN educational_organizations b ON a.educational_organization_id = b.educational_organization_id;
```

| person_id | full_name | role | affiliation | organization_educational_organization_id | organization_organization_id | organization_name |
|---|---|---|---|---|---|---|
| 100 | Theodore Mcgrath | president | baseline-affiliat-55 | 1 | Shell Oil | Extended Review |
| 101 | Account Name | lecturer | pilot-affiliat-56 | 2 | GlobalPlatform Inc. | Pilot Initiative A |
| 102 | Saipan International Airport | researcher | extended-affiliat-57 | 3 | Whatsapp Inc. | Baseline Model |
| 103 | Norma Fisher | dean | integrated-affiliat-58 | 4 | American Institutes for Research | Distributed Cluster |

The view `v_person_government_body` joins `persons` with `government_bodies` on `government_body_id`, answering "which government body is each person associated with?" — person 100 (Theodore Mcgrath) is associated with government body 100 ("Regional Corridor").

**View `v_person_government_body`**

```sql
CREATE VIEW v_person_government_body AS
SELECT a.person_id, a.full_name, a.role, a.affiliation, b.id AS body_id, b.body_id AS body_body_id, b.body_name AS body_body_name
FROM persons a JOIN government_bodies b ON a.government_body_id = b.id;
```

| person_id | full_name | role | affiliation | body_id | body_body_id | body_body_name |
|---|---|---|---|---|---|---|
| 100 | Theodore Mcgrath | president | baseline-affiliat-55 | 100 | 6564383 | Regional Corridor |
| 101 | Account Name | lecturer | pilot-affiliat-56 | 101 | 168556 | Seasonal Series D |
| 102 | Saipan International Airport | researcher | extended-affiliat-57 | 102 | strategic | Integrated Assessment |
| 103 | Norma Fisher | dean | integrated-affiliat-58 | 103 | 195361 | Extended Survey |

The view `v_person_award` joins `persons` with `awards` on `award_id`, answering "which award does each person hold?" — person 100 (Theodore Mcgrath) holds award 1 ("Primary Review A").

**View `v_person_award`**

```sql
CREATE VIEW v_person_award AS
SELECT a.person_id, a.full_name, a.role, a.affiliation, b.award_id AS award_award_id, b.award_name AS award_award_name, b.granting_authority AS award_granting_authority
FROM persons a JOIN awards b ON a.award_id = b.award_id;
```

| person_id | full_name | role | affiliation | award_award_id | award_award_name | award_granting_authority |
|---|---|---|---|---|---|---|
| 100 | Theodore Mcgrath | president | baseline-affiliat-55 | 1 | Primary Review A | integrated-granting-40 |
| 101 | Account Name | lecturer | pilot-affiliat-56 | 2 | Composite Initiative | seasonal-granting-41 |
| 102 | Saipan International Airport | researcher | extended-affiliat-57 | 3 | Compact Model | regional-granting-42 |
| 103 | Norma Fisher | dean | integrated-affiliat-58 | 4 | Legacy Cluster D | legacy-granting-43 |

The view `v_educational_program_educational_organization` joins `educational_programs` with `educational_organizations` on `educational_organization_id`, answering "which organization runs each program?" — program 1 ("Extended Review") is run by organization 1 ("Shell Oil").

**View `v_educational_program_educational_organization`**

```sql
CREATE VIEW v_educational_program_educational_organization AS
SELECT a.id, a.program_id, a.program_name, a.program_type, b.educational_organization_id AS organization_educational_organization_id, b.organization_id AS organization_organization_id, b.name AS organization_name
FROM educational_programs a JOIN educational_organizations b ON a.educational_organization_id = b.educational_organization_id;
```

| id | program_id | program_name | program_type | organization_educational_organization_id | organization_organization_id | organization_name |
|---|---|---|---|---|---|---|
| 1 | 103176 | Extended Review | college | 1 | Shell Oil | Extended Review |
| 2 | 2986219 | Pilot Initiative A | curriculum | 2 | GlobalPlatform Inc. | Pilot Initiative A |
| 3 | 1186079 | Baseline Model | teacher-training | 3 | Whatsapp Inc. | Baseline Model |
| 4 | 1562855 | Distributed Cluster | math-contest | 4 | American Institutes for Research | Distributed Cluster |

The view `v_educational_program_building` joins `educational_programs` with `buildings` on `building_id`, answering "which building hosts each program?" — program 1 ("Extended Review") is hosted in building 1 ("distributed-address-72").

**View `v_educational_program_building`**

```sql
CREATE VIEW v_educational_program_building AS
SELECT a.id, a.program_id, a.program_name, a.program_type, b.id AS building_id, b.building_id AS building_building_id, b.address AS building_address
FROM educational_programs a JOIN buildings b ON a.building_id = b.id;
```

| id | program_id | program_name | program_type | building_id | building_building_id | building_address |
|---|---|---|---|---|---|---|
| 1 | 103176 | Extended Review | college | 1 | 10090 | distributed-address-72 |
| 2 | 2986219 | Pilot Initiative A | curriculum | 2 | 3744019 | baseline-address-73 |
| 3 | 1186079 | Baseline Model | teacher-training | 3 | 3001009030150 | pilot-address-74 |
| 4 | 1562855 | Distributed Cluster | math-contest | 4 | 325468 | extended-address-75 |

The view `v_educational_program_person_detail` joins `educational_programs` with `persons` through the `programs_persons` junction table, answering "which persons participate in each program?" — program 1 ("Extended Review") includes person 100 (Theodore Mcgrath).

**View `v_educational_program_person_detail`**

```sql
CREATE VIEW v_educational_program_person_detail AS
SELECT a.id, a.program_id, a.program_name, b.person_id AS person_person_id, b.full_name AS person_full_name, b.role AS person_role
FROM educational_programs a
  JOIN programs_persons j ON j.educational_program_id = a.id
  JOIN persons b ON b.person_id = j.person_id;
```

| id | program_id | program_name | person_person_id | person_full_name | person_role |
|---|---|---|---|---|---|
| 1 | 103176 | Extended Review | 100 | Theodore Mcgrath | president |
| 1 | 103176 | Extended Review | 101 | Account Name | lecturer |
| 2 | 2986219 | Pilot Initiative A | 101 | Account Name | lecturer |
| 2 | 2986219 | Pilot Initiative A | 102 | Saipan International Airport | researcher |
| 3 | 1186079 | Baseline Model | 102 | Saipan International Airport | researcher |
| 3 | 1186079 | Baseline Model | 103 | Norma Fisher | dean |
| 4 | 1562855 | Distributed Cluster | 103 | Norma Fisher | dean |
| 4 | 1562855 | Distributed Cluster | 100 | Theodore Mcgrath | president |

The view `v_award_person_detail` joins `awards` with `persons` through the `awards_persons` junction table, answering "which persons hold each award?" — award 1 ("Primary Review A") is held by person 100 (Theodore Mcgrath).

**View `v_award_person_detail`**

```sql
CREATE VIEW v_award_person_detail AS
SELECT a.award_id, a.award_name, a.granting_authority, b.person_id AS person_person_id, b.full_name AS person_full_name, b.role AS person_role
FROM awards a
  JOIN awards_persons j ON j.award_id = a.award_id
  JOIN persons b ON b.person_id = j.person_id;
```

| award_id | award_name | granting_authority | person_person_id | person_full_name | person_role |
|---|---|---|---|---|---|
| 1 | Primary Review A | integrated-granting-40 | 100 | Theodore Mcgrath | president |
| 1 | Primary Review A | integrated-granting-40 | 101 | Account Name | lecturer |
| 2 | Composite Initiative | seasonal-granting-41 | 101 | Account Name | lecturer |
| 2 | Composite Initiative | seasonal-granting-41 | 102 | Saipan International Airport | researcher |
| 3 | Compact Model | regional-granting-42 | 102 | Saipan International Airport | researcher |
| 3 | Compact Model | regional-granting-42 | 103 | Norma Fisher | dean |
| 4 | Legacy Cluster D | legacy-granting-43 | 103 | Norma Fisher | dean |
| 4 | Legacy Cluster D | legacy-granting-43 | 100 | Theodore Mcgrath | president |

The view `v_award_government_body` joins `awards` with `government_bodies` on `government_body_id`, answering "which government body administers each award?" — award 1 ("Primary Review A") is administered by government body 100 ("Regional Corridor").

**View `v_award_government_body`**

```sql
CREATE VIEW v_award_government_body AS
SELECT a.award_id, a.award_name, a.granting_authority, a.award_date, b.id AS body_id, b.body_id AS body_body_id, b.body_name AS body_body_name
FROM awards a JOIN government_bodies b ON a.government_body_id = b.id;
```

| award_id | award_name | granting_authority | award_date | body_id | body_body_id | body_body_name |
|---|---|---|---|---|---|---|
| 1 | Primary Review A | integrated-granting-40 | 2025-12-01 | 100 | 6564383 | Regional Corridor |
| 2 | Composite Initiative | seasonal-granting-41 | 2022-05-12 | 101 | 168556 | Seasonal Series D |
| 3 | Compact Model | regional-granting-42 | 2023-10-23 | 102 | strategic | Integrated Assessment |
| 4 | Legacy Cluster D | legacy-granting-43 | 2024-03-07 | 103 | 195361 | Extended Survey |

The view `v_government_body_educational_organization` joins `government_bodies` with `educational_organizations` on `educational_organization_id`, answering "which organizations does each government body oversee?" — government body 100 ("Regional Corridor") oversees organization 1 ("Shell Oil").

**View `v_government_body_educational_organization`**

```sql
CREATE VIEW v_government_body_educational_organization AS
SELECT a.id, a.body_id, a.body_name, a.jurisdiction_level, b.educational_organization_id AS organization_educational_organization_id, b.organization_id AS organization_organization_id, b.name AS organization_name
FROM government_bodies a JOIN educational_organizations b ON a.educational_organization_id = b.educational_organization_id;
```

| id | body_id | body_name | jurisdiction_level | organization_educational_organization_id | organization_organization_id | organization_name |
|---|---|---|---|---|---|---|
| 100 | 6564383 | Regional Corridor | municipal | 1 | Shell Oil | Extended Review |
| 101 | 168556 | Seasonal Series D | regional | 2 | GlobalPlatform Inc. | Pilot Initiative A |
| 102 | strategic | Integrated Assessment | national | 3 | Whatsapp Inc. | Baseline Model |
| 103 | 195361 | Extended Survey | municipal | 4 | American Institutes for Research | Distributed Cluster |

The view `v_government_body_award` joins `government_bodies` with `awards` on `award_id`, answering "which awards does each government body administer?" — government body 100 ("Regional Corridor") administers award 1 ("Primary Review A").

**View `v_government_body_award`**

```sql
CREATE VIEW v_government_body_award AS
SELECT a.id, a.body_id, a.body_name, a.jurisdiction_level, b.award_id AS award_award_id, b.award_name AS award_award_name, b.granting_authority AS award_granting_authority
FROM government_bodies a JOIN awards b ON a.award_id = b.award_id;
```

| id | body_id | body_name | jurisdiction_level | award_award_id | award_award_name | award_granting_authority |
|---|---|---|---|---|---|---|
| 100 | 6564383 | Regional Corridor | municipal | 1 | Primary Review A | integrated-granting-40 |
| 101 | 168556 | Seasonal Series D | regional | 2 | Composite Initiative | seasonal-granting-41 |
| 102 | strategic | Integrated Assessment | national | 3 | Compact Model | regional-granting-42 |
| 103 | 195361 | Extended Survey | municipal | 4 | Legacy Cluster D | legacy-granting-43 |

The view `v_government_body_policy` joins `government_bodies` with `policies` on `policy_id`, answering "which policies does each government body issue?" — government body 100 ("Regional Corridor") issues policy 100.

**View `v_government_body_policy`**

```sql
CREATE VIEW v_government_body_policy AS
SELECT a.id, a.body_id, a.body_name, a.jurisdiction_level, b.policy_id AS policy_policy_id, b.policy_title AS policy_policy_title, b.effective_date AS policy_effective_date
FROM government_bodies a JOIN policies b ON a.policy_id = b.policy_id;
```

| id | body_id | body_name | jurisdiction_level | policy_policy_id | policy_policy_title | policy_effective_date |
|---|---|---|---|---|---|---|
| 100 | 6564383 | Regional Corridor | municipal | 100 | Baseline Initiative D | 2023-02-14 |
| 101 | 168556 | Seasonal Series D | regional | 101 | Distributed Model | 2024-07-25 |
| 102 | strategic | Integrated Assessment | national | 102 | Adaptive Cluster | 2025-12-09 |
| 103 | 195361 | Extended Survey | municipal | 103 | Primary Review A | 2022-05-20 |

The view `v_policy_government_body` performs the inverse join, answering "which government body issued each policy?" — policy 100 was issued by government body 100 ("Regional Corridor").

**View `v_policy_government_body`**

```sql
CREATE VIEW v_policy_government_body AS
SELECT a.policy_id, a.policy_title, a.effective_date, a.status, b.id AS body_id, b.body_id AS body_body_id, b.body_name AS body_body_name
FROM policies a JOIN government_bodies b ON a.government_body_id = b.id;
```

| policy_id | policy_title | effective_date | status | body_id | body_body_id | body_body_name |
|---|---|---|---|---|---|---|
| 100 | Baseline Initiative D | 2023-02-14 | active | 100 | 6564383 | Regional Corridor |
| 101 | Distributed Model | 2024-07-25 | pending | 101 | 168556 | Seasonal Series D |
| 102 | Adaptive Cluster | 2025-12-09 | repealed | 102 | strategic | Integrated Assessment |
| 103 | Primary Review A | 2022-05-20 | active | 103 | 195361 | Extended Survey |

The view `v_policy_educational_program` joins `policies` with `educational_programs` through the government-body intermediary, answering "which programs are subject to which policies?" — program 1 ("Extended Review") is subject to policy 100, which was issued by government body 100 ("Regional Corridor").

**View `v_policy_educational_program`**

```sql
CREATE VIEW v_policy_educational_program AS
SELECT a.policy_id, a.policy_title, a.effective_date, a.status, b.id AS program_id, b.program_id AS program_program_id, b.program_name AS program_program_name
FROM policies a JOIN educational_programs b ON a.educational_program_id = b.id;
```

| policy_id | policy_title | effective_date | status | program_id | program_program_id | program_program_name |
|---|---|---|---|---|---|---|
| 100 | Baseline Initiative D | 2023-02-14 | active | 1 | 103176 | Extended Review |
| 101 | Distributed Model | 2024-07-25 | pending | 2 | 2986219 | Pilot Initiative A |
| 102 | Adaptive Cluster | 2025-12-09 | repealed | 3 | 1186079 | Baseline Model |
| 103 | Primary Review A | 2022-05-20 | active | 4 | 1562855 | Distributed Cluster |

## Synthesis

The schema models the educational ecosystem as a network of seven entity types connected by foreign keys and junction tables. Organizations anchor the model, occupying buildings, running programs, employing persons, and receiving awards from government bodies that issue policies. The materialized views materialize the most common join paths, allowing analysts to ask questions about organization-building assignments, person-organization affiliations, program enrollments, award recipients, and policy coverage without writing joins from scratch. The normalization — separating organizations, buildings, programs, persons, awards, government bodies, and policies into distinct tables — eliminates redundancy and enforces referential integrity, while the junction tables preserve the flexibility of many-to-many relationships that the real world demands.