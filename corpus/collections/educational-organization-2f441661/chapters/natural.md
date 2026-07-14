# Educational Governance and Institutional Infrastructure

The administration of educational institutions operates within a layered ecosystem of physical facilities, academic programming, personnel, and regulatory oversight. Each institution occupies a building, delivers programs to defined audiences, employs or affiliates persons in specific roles, and interacts with government bodies that grant awards and enforce policies. Understanding how these entities relate requires examining the records that capture their attributes and the joined views that answer operational questions—such as which organization occupies which building, which persons hold which roles, and which government bodies oversee which programs.

**Table `educational_organizations`**

| educational_organization_id | organization_id | name | founding_date | legal_status | tuition_policy | is_state_supported | building_id | educational_program_id |
|---|---|---|---|---|---|---|---|---|
| 1 | Shell Oil | Extended Review | 2023-06-24 | nonprofit | free | true | 1 | 1 |
| 2 | GlobalPlatform Inc. | Pilot Initiative A | 2024-11-08 | state-supported | tuition-charging | false | 2 | 2 |
| 3 | Whatsapp Inc. | Baseline Model | 2025-04-19 | independent | scholarship-providing | true | 3 | 3 |
| 4 | American Institutes for Research | Distributed Cluster | 2022-09-03 | nonprofit | free | false | 4 | 4 |

The `educational_organizations` table anchors the domain. Each row identifies an institution by a surrogate key, an external `organization_id`, and a human-readable `name`. Founding dates range from 2022 to 2025, and legal statuses include `nonprofit`, `state-supported`, and `independent`. Tuition policies vary between `free`, `tuition-charging`, and `scholarship-providing`. The `is_state_supported` flag indicates whether the institution receives public funding. For example, Shell Oil (ID 1) is a nonprofit founded on 2023-06-24 with a free tuition policy and state support, whereas GlobalPlatform Inc. (ID 2) is state-supported but charges tuition. Each organization row also carries a `building_id` and an `educational_program_id`, establishing direct foreign-key links to the facilities and academic offerings described below.

**Table `buildings`**

| id | building_id | address | district | construction_year | last_renovation_date | lease_term_years | lease_start_date | lease_grantor | educational_organization_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 10090 | distributed-address-72 | integrated-district-40 | 14 | 2025-08-19 | 17 | 2024-07-24 | adaptive-lease-41 | 1 |
| 2 | 3744019 | baseline-address-73 | seasonal-district-41 | 21 | 2022-01-03 | 24 | 2025-12-08 | distributed-lease-42 | 2 |
| 3 | 3001009030150 | pilot-address-74 | regional-district-42 | 28 | 2023-06-14 | 31 | 2022-05-19 | baseline-lease-43 | 3 |
| 4 | 325468 | extended-address-75 | legacy-district-43 | 35 | 2024-11-25 | 38 | 2023-10-03 | pilot-lease-44 | 4 |

Physical infrastructure is captured in the `buildings` table. Every building has a unique `id`, a `building_id` code, a street `address`, and a `district` classification such as `integrated-district-40` or `seasonal-district-41`. Construction years are recorded as integers—14, 21, 28, and 35 in the sample data—while `last_renovation_date` records the most recent upgrade. Lease terms (`lease_term_years`) range from 17 to 38 years, with `lease_start_date` and `lease_grantor` fields describing the contractual arrangement. The `educational_organization_id` column ties each building to the institution that occupies it. Building 10090, for instance, is located in `integrated-district-40`, was constructed 14 years ago, and is leased under `adaptive-lease-41` starting 2024-07-24 by Shell Oil.

**Table `persons`**

| person_id | full_name | role | affiliation | email | is_draft_exempt | educational_organization_id | teaches_at_educational_organization_id | government_body_id | award_id |
|---|---|---|---|---|---|---|---|---|---|
| 100 | Theodore Mcgrath | president | baseline-affiliat-55 | seasonal-email-11 | true | 1 | 1 | 100 | 1 |
| 101 | Account Name | lecturer | pilot-affiliat-56 | regional-email-12 | false | 2 | 2 | 101 | 2 |
| 102 | Saipan International Airport | researcher | extended-affiliat-57 | legacy-email-13 | true | 3 | 3 | 102 | 3 |
| 103 | Norma Fisher | dean | integrated-affiliat-58 | compact-email-14 | false | 4 | 4 | 103 | 4 |

The `persons` table records individuals associated with the educational ecosystem. Each person has a `person_id`, a `full_name`, a `role` (such as `president`, `lecturer`, `researcher`, or `dean`), an `affiliation`, and an `email`. The `is_draft_exempt` flag indicates whether the person's record is exempt from draft-mode operations. Foreign keys connect persons to organizations (`educational_organization_id`, `teaches_at_educational_organization_id`), to government bodies (`government_body_id`), and to awards (`award_id`). Theodore Mcgrath (ID 100), for example, serves as president of the organization at ID 1, teaches at the same institution, holds government body 100, and received award 1.

**Table `educational_programs`**

| id | program_id | program_name | program_type | target_audience | is_draft_exempt | enrollment_count | educational_organization_id | building_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 103176 | Extended Review | college | high-school | true | 26 | 1 | 1 |
| 2 | 2986219 | Pilot Initiative A | curriculum | undergraduate | false | 1 | 2 | 2 |
| 3 | 1186079 | Baseline Model | teacher-training | graduate | true | 33 | 3 | 3 |
| 4 | 1562855 | Distributed Cluster | math-contest | teachers | false | 15 | 4 | 4 |

Academic offerings are stored in `educational_programs`. Each program has an `id`, a `program_id` code, a `program_name`, a `program_type` (e.g., `college`, `curriculum`, `teacher-training`, `math-contest`), and a `target_audience` such as `high-school`, `undergraduate`, `graduate`, or `teachers`. The `is_draft_exempt` flag and `enrollment_count` provide operational metadata. The `educational_organization_id` and `building_id` columns link each program to its sponsoring institution and physical location. The Extended Review program (ID 1) is a college-level offering targeting high-school students with 26 enrollments, while the Distributed Cluster program (ID 4) is a math-contest program for teachers with 15 enrollments.

**Table `awards`**

| award_id | award_name | granting_authority | award_date | monetary_value | government_body_id | created_at |
|---|---|---|---|---|---|---|
| 1 | Primary Review A | integrated-granting-40 | 2025-12-01 | 11.45 | 100 | 2025-01-01 00:14:00 |
| 2 | Composite Initiative | seasonal-granting-41 | 2022-05-12 | 14.90 | 101 | 2025-02-06 03:14:00 |
| 3 | Compact Model | regional-granting-42 | 2023-10-23 | 18.35 | 102 | 2025-03-11 06:14:00 |
| 4 | Legacy Cluster D | legacy-granting-43 | 2024-03-07 | 21.80 | 103 | 2025-04-16 09:14:00 |

Recognition and financial incentives are tracked in the `awards` table. Each award has an `award_id`, an `award_name`, a `granting_authority`, an `award_date`, a `monetary_value` (ranging from 11.45 to 21.80 in the sample), and a `government_body_id` identifying the body that conferred the award. The `created_at` timestamp records when the award record was entered. Primary Review A (ID 1) was granted on 2025-12-01 by `integrated-granting-40` with a monetary value of 11.45, while Legacy Cluster D (ID 4) carries the highest value at 21.80.

**Table `government_bodies`**

| id | body_id | body_name | jurisdiction_level | head_official | educational_organization_id | award_id | policy_id |
|---|---|---|---|---|---|---|---|
| 100 | 6564383 | Regional Corridor | municipal | primary-head-22 | 1 | 1 | 100 |
| 101 | 168556 | Seasonal Series D | regional | adaptive-head-23 | 2 | 2 | 101 |
| 102 | strategic | Integrated Assessment | national | distributed-head-24 | 3 | 3 | 102 |
| 103 | 195361 | Extended Survey | municipal | baseline-head-25 | 4 | 4 | 103 |

Regulatory and administrative oversight is captured in `government_bodies`. Each body has an `id`, a `body_id`, a `body_name`, a `jurisdiction_level` (such as `municipal`, `regional`, or `national`), and a `head_official`. Foreign keys link each body to an `educational_organization_id`, an `award_id`, and a `policy_id`, reflecting the multi-directional relationships between regulators, institutions, awards, and policy instruments. Regional Corridor (ID 100) operates at the municipal level with head official `primary-head-22`, while Integrated Assessment (ID 102) functions at the national level.

**Table `policies`**

| policy_id | policy_title | effective_date | status | affects_draft_exemption | government_body_id | educational_program_id |
|---|---|---|---|---|---|---|
| 100 | Baseline Initiative D | 2023-02-14 | active | true | 100 | 1 |
| 101 | Distributed Model | 2024-07-25 | pending | false | 101 | 2 |
| 102 | Adaptive Cluster | 2025-12-09 | repealed | true | 102 | 3 |
| 103 | Primary Review A | 2022-05-20 | active | false | 103 | 4 |

Policy instruments govern the rules and standards under which institutions operate. The `policies` table records policy identifiers, names, and their relationship to government bodies through the `government_body_id` foreign key. Policies serve as the regulatory backbone that government bodies enforce and that educational organizations must comply with.

The relational structure extends beyond these base tables through junction tables that resolve many-to-many relationships. The `organizations_persons` table links persons to the organizations they are affiliated with, `programs_persons` connects persons to the programs they participate in, and `awards_persons` records which persons received which awards. These junction tables enable flexible associations where a single person may hold multiple roles across organizations, programs, or award recipients.

## Institutional Facility Mapping

The relationship between educational organizations and their physical buildings is captured in both the base tables and the derived views. The `v_educational_organization_building` view joins `educational_organizations` with `buildings` to answer the question: which institution occupies which facility, and what are the facility's characteristics?

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

Reading a row from this view, one can see that Shell Oil (organization ID 1) occupies building 10090 in `integrated-district-40`, a structure constructed 14 years ago with a 17-year lease term. The view surfaces the organization's name alongside the building's address, district, construction year, and lease details, providing a complete picture of the physical footprint of each institution.

The inverse perspective is provided by `v_building_educational_organization`, which starts from the building side and lists the organizations associated with each facility.

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

This view answers the complementary question: which educational organizations are associated with a given building? A row might show that building 10090 is linked to Shell Oil, whose founding date is 2023-06-24 and whose legal status is `nonprofit`. This orientation is useful for facility managers who need to know which institutions occupy their properties.

## Personnel and Organizational Affiliation

Personnel records are enriched through joins that connect individuals to their organizational contexts. The `v_educational_organization_person_detail` view merges `educational_organizations` with `persons` to produce a comprehensive profile of each person within their institutional setting.

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

In this view, Theodore Mcgrath appears with his role as `president`, his affiliation `baseline-affiliat-55`, and his email `seasonal-email-11`, alongside the organization name Shell Oil and its founding date. The view also includes the `teaches_at_educational_organization_id` field, showing that Theodore teaches at organization ID 1. Similarly, Norma Fisher (ID 103) is listed as a `dean` at the organization Distributed Cluster, with affiliation `integrated-affiliat-58` and email `compact-email-14`.

The `v_person_educational_organization` view reverses this relationship, starting from the person and showing their organizational affiliation.

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

This view answers: for a given person, which educational organization are they affiliated with, and what are that organization's attributes? A row might show Account Name (ID 101), a `lecturer` at GlobalPlatform Inc., with the organization's legal status listed as `state-supported` and its tuition policy as `tuition-charging`.

## Academic Programs and Their Context

Educational programs are contextualized through joins that link them to their sponsoring organizations, physical buildings, and participating persons. The `v_educational_organization_educational_program` view connects organizations to their programs.

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

This view answers: which programs does each educational organization deliver? A row shows that Shell Oil offers the Extended Review program, a college-level offering targeting high-school students with 26 enrollments. GlobalPlatform Inc. offers Pilot Initiative A, a curriculum-type program for undergraduates with only 1 enrollment.

The `v_educational_program_educational_organization` view provides the inverse, starting from the program and showing its sponsoring organization.

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

This orientation is useful for program administrators who need to know which organization sponsors a given program. A row might show that the Baseline Model program (ID 3) is offered by Whatsapp Inc., an independent institution founded on 2025-04-19.

Programs are also linked to buildings through `v_educational_program_building`.

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

This view answers: in which building is each educational program delivered? A row shows that the Extended Review program is delivered in building 10090, located in `integrated-district-40`, constructed 14 years ago. The Distributed Cluster program (ID 4) is delivered in building 325468, a structure built 35 years ago in `legacy-district-43`.

The `v_educational_program_person_detail` view connects programs to the persons involved.

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

This view answers: which persons are associated with each educational program, and what are their roles and organizational affiliations? A row might show that Theodore Mcgrath, a `president`, is linked to the Extended Review program, with his organization listed as Shell Oil.

## Awards, Government Oversight, and Policy

Awards are distributed through government bodies and received by persons, creating a network of recognition and financial support. The `v_award_person_detail` view joins awards with the persons who received them.

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

This view answers: which persons received which awards, and what are the award details? A row shows that Theodore Mcgrath received Primary Review A, an award granted by `integrated-granting-40` on 2025-12-01 with a monetary value of 11.45. Account Name received Composite Initiative, awarded on 2022-05-12 with a value of 14.90.

The `v_award_government_body` view links awards to the government bodies that granted them.

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

This view answers: which government body granted each award? A row shows that Primary Review A was granted by Regional Corridor (ID 100), a municipal-level body with head official `primary-head-22`. Composite Initiative was granted by Seasonal Series D (ID 101), which operates at the regional level.

Government bodies themselves are connected to educational organizations through `v_government_body_educational_organization`.

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

This view answers: which educational organizations are overseen by each government body? A row shows that Regional Corridor (ID 100) is associated with Shell Oil, an organization founded on 2023-06-24 with a free tuition policy. Seasonal Series D (ID 101) is associated with GlobalPlatform Inc., which charges tuition.

The `v_government_body_award` view provides the inverse, starting from the government body and listing the awards it has granted.

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

This view answers: which awards has each government body conferred? A row might show that Regional Corridor granted Primary Review A with a monetary value of 11.45, while Integrated Assessment (ID 102) granted Compact Model with a value of 18.35.

Government bodies are also linked to policies through `v_government_body_policy`.

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

This view answers: which policies are enforced by each government body? A row shows that Regional Corridor enforces a policy associated with its regulatory jurisdiction, while Integrated Assessment, operating at the national level, enforces a different policy instrument. The view surfaces the body's name, jurisdiction level, and head official alongside the policy details.

The `v_policy_government_body` view reverses this relationship, starting from the policy and showing the government body responsible for its enforcement.

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

This orientation is useful for compliance officers who need to know which government body is responsible for enforcing a given policy. A row might show that a particular policy is enforced by Regional Corridor, a municipal-level body headed by `primary-head-22`.

Policies are also connected to educational programs through `v_policy_educational_program`.

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

This view answers: which educational programs are subject to each policy? A row shows that a policy enforced by Regional Corridor applies to the Extended Review program, a college-level offering with 26 enrollments. This linkage ensures that program administrators can identify the regulatory requirements that govern their offerings.

## Synthesis

The educational governance domain is characterized by a dense web of relationships between institutions, facilities, personnel, programs, awards, government bodies, and policies. Each base table captures a distinct facet of this ecosystem, while the junction tables and views provide the joined perspectives necessary for operational decision-making. The `v_educational_organization_building` view reveals the physical footprint of institutions; `v_educational_organization_person_detail` surfaces the personnel within their organizational context; `v_educational_organization_educational_program` maps academic offerings to their sponsors; and the award- and policy-related views trace the regulatory and financial flows that govern the system. Together, these records and their joins form a comprehensive reference for understanding how educational organizations operate within their physical, academic, and regulatory environments.

## Data appendix

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
