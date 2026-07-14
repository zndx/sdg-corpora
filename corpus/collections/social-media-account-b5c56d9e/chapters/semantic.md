The school district information ecosystem revolves around a single operational question: which social media account belongs to whom, under what policy, and for what organizational purpose. Every account—whether a Twitter handle like `ACC-2500`, a blog at `ACC-2502`, or a website at `ACC-2504`—is anchored to a person, an organizational entity, and a governing board policy. The relational model captures these three anchors as separate base tables linked through foreign keys and junction tables, then reassembles them in materialized views that answer the specific investigative queries district auditors and compliance officers run day to day.

## The Core Entity Types

The domain's four principal entity types are social media accounts, district employees, school district entities, and board policies. Each entity type is represented by its own base table, and every row carries a surrogate primary key that serves as the stable record identifier across the entire schema.

**Table `social_media_accounts`**

| social_media_account_id | account_identifier | platform_type | registration_status | creation_date | last_audit_date | district_employee_id | school_district_entity_id | board_policy_id |
|---|---|---|---|---|---|---|---|---|
| 1 | ACC-2500 | Twitter | registered | 2022-01-13T12:24:00 | 2023-10-23T09:51:00 | 100 | 100 | 1 |
| 2 | ACC-2502 | Blog | unregistered | 2023-06-24T19:41:00 | 2024-03-07T16:08:00 | 101 | 101 | 2 |
| 3 | ACC-2504 | Website | registered | 2024-11-08T02:58:00 | 2025-08-18T23:25:00 | 102 | 102 | 3 |
| 4 | ACC-2506 | Twitter | unregistered | 2025-04-19T09:15:00 | 2022-01-02T06:42:00 | 103 | 103 | 4 |

The `social_media_accounts` table is the central fact table of the model. Its surrogate key, `social_media_account_id`, is an auto-incrementing integer (1 through 4 in the sample data). The business identifier `account_identifier` carries human-readable codes such as `ACC-2500` and `ACC-2502`. The `platform_type` column classifies the channel—`Twitter`, `Blog`, or `Website`—while `registration_status` records whether the account is `registered` or `unregistered`. Timestamps `creation_date` and `last_audit_date` track the account lifecycle; for instance, account `ACC-2500` was created on `2022-01-13T12:24:00` and last audited on `2023-10-23T09:51:00`.

Three foreign keys in `social_media_accounts` bind each account to its domain anchors: `district_employee_id` points to a row in `district_employees`, `school_district_entity_id` points to `school_district_entities`, and `board_policy_id` points to `board_policies`. In the sample data, account `ACC-2500` (id 1) is linked to employee 100, entity 100, and policy 1 simultaneously, illustrating the model's design that every account is triply contextualized.

**Table `district_employees`**

| district_employee_id | employee_id | full_name | role | contact_extension | employment_status | board_policy_id |
|---|---|---|---|---|---|---|
| 100 | Norma Fisher | Theodore Mcgrath | Teacher | Michelle Kelley | active | 1 |
| 101 | Tasha Rodriguez | Account Name | Staff | Kimberly Myers | inactive | 2 |
| 102 | Theodore Mcgrath | Saipan International Airport | Administrator | Alice Alvarez | active | 3 |
| 103 | Peter Mcdowell | Norma Fisher | Teacher | Norma Fisher | inactive | 4 |

The `district_employees` table stores the personnel dimension. Its surrogate key `district_employee_id` (100–103) is distinct from the business `employee_id` column, which holds values like `Norma Fisher` and `Tasha Rodriguez` in the sample. The `full_name` column carries names such as `Theodore Mcgrath` and `Saipan International Airport`, while `role` classifies the person as `Teacher`, `Staff`, or `Administrator`. The `contact_extension` and `employment_status` columns (values `active` or `inactive`) provide operational contact and HR data. A `board_policy_id` foreign key ties each employee to a governing policy.

**Table `school_district_entities`**

| school_district_entity_id | entity_id | entity_name | entity_type | affiliation_status |
|---|---|---|---|---|
| 100 | 1996912 | Regional Cluster | Sport | official |
| 101 | 57e4a9d4-8fcd-11eb-924d-9cd76263cbd0 | Seasonal Review D | Club | unofficial |
| 102 | 9736894 | Integrated Initiative | Group | official |
| 103 | 974946 | Extended Model | Program | unofficial |

`school_district_entities` captures the organizational dimension. The surrogate key `school_district_entity_id` (100–103) is separate from the business `entity_id`, which in the sample data mixes integer identifiers like `1996912` with UUIDs such as `57e4a9d4-8fcd-11eb-924d-9cd76263cbd0`. The `entity_name` column holds labels like `Regional Cluster` and `Seasonal Review D`, while `entity_type` classifies the organization as `Sport`, `Club`, `Group`, or `Program`. The `affiliation_status` column records whether the relationship is `official` or `unofficial`.

**Table `board_policies`**

| id | policy_number | policy_title | effective_date | policy_status |
|---|---|---|---|---|
| 1 | POL-2302 | Baseline Initiative D | 2023-02-14 | active |
| 2 | POL-2304 | Distributed Model | 2024-07-25 | superseded |
| 3 | POL-2306 | Adaptive Cluster | 2025-12-09 | active |
| 4 | POL-2308 | Primary Review A | 2022-05-20 | superseded |

`board_policies` is the governance dimension. Its surrogate key `id` (1–4) maps to the business `policy_number` (`POL-2302`, `POL-2304`, etc.). The `policy_title` column carries descriptive names such as `Baseline Initiative D` and `Distributed Model`. The `effective_date` and `policy_status` columns (`active` or `superseded`) track the policy lifecycle.

**Table `public_information_officers`**

| id | officer_id | full_name | contact_extension | access_level | board_policy_id |
|---|---|---|---|---|---|
| 1 | 103165 | Theodore Mcgrath | Michelle Kelley | full | 1 |
| 2 | 2933464 | Account Name | Kimberly Myers | restricted | 2 |
| 3 | 10445622 | Saipan International Airport | Alice Alvarez | full | 3 |
| 4 | 7441150 | Norma Fisher | Norma Fisher | restricted | 4 |

The `public_information_officers` table is a parallel personnel table that mirrors the structure of `district_employees` but serves a distinct compliance role. Its surrogate key `id` (1–4) maps to the business `officer_id` (e.g., `103165`, `2933464`). The `full_name` and `contact_extension` columns carry the same types of values as in `district_employees`, while `access_level` records `full` or `restricted` permissions. A `board_policy_id` foreign key links each officer to a policy.

## Junction Tables and Many-to-Many Relationships

The model uses five junction tables to resolve many-to-many relationships between the core entities. These tables contain only pairs of foreign keys, each referencing a surrogate primary key from one of the base tables.

**Table `employees_accounts`**

| district_employee_id | social_media_account_id |
|---|---|
| 100 | 1 |
| 100 | 2 |
| 101 | 2 |
| 101 | 3 |
| 102 | 3 |
| 102 | 4 |
| 103 | 4 |
| 103 | 1 |

The `employees_accounts` junction table resolves the many-to-many relationship between `district_employees` and `social_media_accounts`. In the sample data, employee 100 is linked to accounts 1 and 2, employee 101 to accounts 2 and 3, employee 102 to accounts 3 and 4, and employee 103 to accounts 4 and 1. This pattern shows that each employee can manage multiple accounts and each account can be managed by multiple employees.

The remaining junction tables—`entities_accounts`, `policies_accounts`, `policies_employees`, and `officers_accounts`—follow the same structural pattern, each resolving a many-to-many relationship between two base entity types. While their sample data is not displayed, their existence confirms that the model supports flexible, unbounded associations between any pair of core entities.

## Materialized Views: Reconstructing Domain Facts

The normalized base tables and junction tables are reassembled through materialized views. Each view performs a specific join that answers a concrete investigative question. The views fall into two categories: simple two-table joins that pair a social media account with one of its three anchors, and detail views that enrich a base entity with its full account or policy context.

### Account-to-Anchor Views

The first three views each join `social_media_accounts` to exactly one anchor table, producing a flat row that answers "which employee, entity, or policy is associated with this account?"

**View `v_social_media_account_district_employee`**

```sql
CREATE VIEW v_social_media_account_district_employee AS
SELECT a.social_media_account_id, a.account_identifier, a.platform_type, a.registration_status, b.district_employee_id AS employee_district_employee_id, b.employee_id AS employee_employee_id, b.full_name AS employee_full_name
FROM social_media_accounts a JOIN district_employees b ON a.district_employee_id = b.district_employee_id;
```

| social_media_account_id | account_identifier | platform_type | registration_status | employee_district_employee_id | employee_employee_id | employee_full_name |
|---|---|---|---|---|---|---|
| 1 | ACC-2500 | Twitter | registered | 100 | Norma Fisher | Theodore Mcgrath |
| 2 | ACC-2502 | Blog | unregistered | 101 | Tasha Rodriguez | Account Name |
| 3 | ACC-2504 | Website | registered | 102 | Theodore Mcgrath | Saipan International Airport |
| 4 | ACC-2506 | Twitter | unregistered | 103 | Peter Mcdowell | Norma Fisher |

The view `v_social_media_account_district_employee` joins `social_media_accounts` to `district_employees` on `district_employee_id`. A sample row would show account `ACC-2500` (platform `Twitter`, status `registered`) alongside employee `Theodore Mcgrath` (role `Teacher`, status `active`). This view answers the question: "Which district employee manages which social media account?"

**View `v_social_media_account_school_district_entity`**

```sql
CREATE VIEW v_social_media_account_school_district_entity AS
SELECT a.social_media_account_id, a.account_identifier, a.platform_type, a.registration_status, b.school_district_entity_id AS entity_school_district_entity_id, b.entity_id AS entity_entity_id, b.entity_name AS entity_entity_name
FROM social_media_accounts a JOIN school_district_entities b ON a.school_district_entity_id = b.school_district_entity_id;
```

| social_media_account_id | account_identifier | platform_type | registration_status | entity_school_district_entity_id | entity_entity_id | entity_entity_name |
|---|---|---|---|---|---|---|
| 1 | ACC-2500 | Twitter | registered | 100 | 1996912 | Regional Cluster |
| 2 | ACC-2502 | Blog | unregistered | 101 | 57e4a9d4-8fcd-11eb-924d-9cd76263cbd0 | Seasonal Review D |
| 3 | ACC-2504 | Website | registered | 102 | 9736894 | Integrated Initiative |
| 4 | ACC-2506 | Twitter | unregistered | 103 | 974946 | Extended Model |

The view `v_social_media_account_school_district_entity` joins `social_media_accounts` to `school_district_entities` on `school_district_entity_id`. A sample row would pair account `ACC-2502` (platform `Blog`, status `unregistered`) with entity `Seasonal Review D` (type `Club`, affiliation `unofficial`). This view answers: "Which organizational entity is associated with which social media account?"

**View `v_social_media_account_board_policy`**

```sql
CREATE VIEW v_social_media_account_board_policy AS
SELECT a.social_media_account_id, a.account_identifier, a.platform_type, a.registration_status, b.id AS policy_id, b.policy_number AS policy_policy_number, b.policy_title AS policy_policy_title
FROM social_media_accounts a JOIN board_policies b ON a.board_policy_id = b.id;
```

| social_media_account_id | account_identifier | platform_type | registration_status | policy_id | policy_policy_number | policy_policy_title |
|---|---|---|---|---|---|---|
| 1 | ACC-2500 | Twitter | registered | 1 | POL-2302 | Baseline Initiative D |
| 2 | ACC-2502 | Blog | unregistered | 2 | POL-2304 | Distributed Model |
| 3 | ACC-2504 | Website | registered | 3 | POL-2306 | Adaptive Cluster |
| 4 | ACC-2506 | Twitter | unregistered | 4 | POL-2308 | Primary Review A |

The view `v_social_media_account_board_policy` joins `social_media_accounts` to `board_policies` on `board_policy_id`. A sample row would link account `ACC-2504` (platform `Website`, status `registered`) to policy `POL-2306` (`Adaptive Cluster`, status `active`). This view answers: "Under which board policy is each social media account governed?"

### Detail Views: Enriching Entities with Account and Policy Context

The remaining views enrich each base entity type with its associated accounts, policies, or both. These views are the primary investigative tools for auditors who need to see the full picture for a given employee, entity, policy, or officer.

**View `v_district_employee_social_media_account_detail`**

```sql
CREATE VIEW v_district_employee_social_media_account_detail AS
SELECT a.district_employee_id, a.employee_id, a.full_name, b.social_media_account_id AS account_social_media_account_id, b.account_identifier AS account_account_identifier, b.platform_type AS account_platform_type
FROM district_employees a
  JOIN employees_accounts j ON j.district_employee_id = a.district_employee_id
  JOIN social_media_accounts b ON b.social_media_account_id = j.social_media_account_id;
```

| district_employee_id | employee_id | full_name | account_social_media_account_id | account_account_identifier | account_platform_type |
|---|---|---|---|---|---|
| 100 | Norma Fisher | Theodore Mcgrath | 1 | ACC-2500 | Twitter |
| 100 | Norma Fisher | Theodore Mcgrath | 2 | ACC-2502 | Blog |
| 101 | Tasha Rodriguez | Account Name | 2 | ACC-2502 | Blog |
| 101 | Tasha Rodriguez | Account Name | 3 | ACC-2504 | Website |
| 102 | Theodore Mcgrath | Saipan International Airport | 3 | ACC-2504 | Website |
| 102 | Theodore Mcgrath | Saipan International Airport | 4 | ACC-2506 | Twitter |
| 103 | Peter Mcdowell | Norma Fisher | 4 | ACC-2506 | Twitter |
| 103 | Peter Mcdowell | Norma Fisher | 1 | ACC-2500 | Twitter |

The view `v_district_employee_social_media_account_detail` joins `district_employees` to `social_media_accounts` (likely through the `employees_accounts` junction table) to produce a row per employee-account pair. A sample row would show employee `Norma Fisher` (id 100, role `Teacher`, status `active`) alongside account `ACC-2500` (platform `Twitter`, status `registered`, created `2022-01-13T12:24:00`). This view answers: "What social media accounts does each district employee manage, and what are the details of those accounts?"

**View `v_district_employee_board_policy`**

```sql
CREATE VIEW v_district_employee_board_policy AS
SELECT a.district_employee_id, a.employee_id, a.full_name, a.role, b.id AS policy_id, b.policy_number AS policy_policy_number, b.policy_title AS policy_policy_title
FROM district_employees a JOIN board_policies b ON a.board_policy_id = b.id;
```

| district_employee_id | employee_id | full_name | role | policy_id | policy_policy_number | policy_policy_title |
|---|---|---|---|---|---|---|
| 100 | Norma Fisher | Theodore Mcgrath | Teacher | 1 | POL-2302 | Baseline Initiative D |
| 101 | Tasha Rodriguez | Account Name | Staff | 2 | POL-2304 | Distributed Model |
| 102 | Theodore Mcgrath | Saipan International Airport | Administrator | 3 | POL-2306 | Adaptive Cluster |
| 103 | Peter Mcdowell | Norma Fisher | Teacher | 4 | POL-2308 | Primary Review A |

The view `v_district_employee_board_policy` joins `district_employees` to `board_policies` on `board_policy_id`. A sample row would pair employee `Tasha Rodriguez` (id 101, role `Staff`, status `inactive`) with policy `POL-2304` (`Distributed Model`, status `superseded`, effective `2024-07-25`). This view answers: "Which board policy governs each district employee?"

**View `v_school_district_entity_social_media_account_detail`**

```sql
CREATE VIEW v_school_district_entity_social_media_account_detail AS
SELECT a.school_district_entity_id, a.entity_id, a.entity_name, b.social_media_account_id AS account_social_media_account_id, b.account_identifier AS account_account_identifier, b.platform_type AS account_platform_type
FROM school_district_entities a
  JOIN entities_accounts j ON j.school_district_entity_id = a.school_district_entity_id
  JOIN social_media_accounts b ON b.social_media_account_id = j.social_media_account_id;
```

| school_district_entity_id | entity_id | entity_name | account_social_media_account_id | account_account_identifier | account_platform_type |
|---|---|---|---|---|---|
| 100 | 1996912 | Regional Cluster | 1 | ACC-2500 | Twitter |
| 100 | 1996912 | Regional Cluster | 2 | ACC-2502 | Blog |
| 101 | 57e4a9d4-8fcd-11eb-924d-9cd76263cbd0 | Seasonal Review D | 2 | ACC-2502 | Blog |
| 101 | 57e4a9d4-8fcd-11eb-924d-9cd76263cbd0 | Seasonal Review D | 3 | ACC-2504 | Website |
| 102 | 9736894 | Integrated Initiative | 3 | ACC-2504 | Website |
| 102 | 9736894 | Integrated Initiative | 4 | ACC-2506 | Twitter |
| 103 | 974946 | Extended Model | 4 | ACC-2506 | Twitter |
| 103 | 974946 | Extended Model | 1 | ACC-2500 | Twitter |

The view `v_school_district_entity_social_media_account_detail` joins `school_district_entities` to `social_media_accounts` (likely through the `entities_accounts` junction table) to produce a row per entity-account pair. A sample row would show entity `Regional Cluster` (id 100, type `Sport`, affiliation `official`) alongside account `ACC-2500` (platform `Twitter`, status `registered`). This view answers: "What social media accounts are associated with each school district entity?"

**View `v_board_policy_social_media_account_detail`**

```sql
CREATE VIEW v_board_policy_social_media_account_detail AS
SELECT a.id, a.policy_number, a.policy_title, b.social_media_account_id AS account_social_media_account_id, b.account_identifier AS account_account_identifier, b.platform_type AS account_platform_type
FROM board_policies a
  JOIN policies_accounts j ON j.board_policy_id = a.id
  JOIN social_media_accounts b ON b.social_media_account_id = j.social_media_account_id;
```

| id | policy_number | policy_title | account_social_media_account_id | account_account_identifier | account_platform_type |
|---|---|---|---|---|---|
| 1 | POL-2302 | Baseline Initiative D | 1 | ACC-2500 | Twitter |
| 1 | POL-2302 | Baseline Initiative D | 2 | ACC-2502 | Blog |
| 2 | POL-2304 | Distributed Model | 2 | ACC-2502 | Blog |
| 2 | POL-2304 | Distributed Model | 3 | ACC-2504 | Website |
| 3 | POL-2306 | Adaptive Cluster | 3 | ACC-2504 | Website |
| 3 | POL-2306 | Adaptive Cluster | 4 | ACC-2506 | Twitter |
| 4 | POL-2308 | Primary Review A | 4 | ACC-2506 | Twitter |
| 4 | POL-2308 | Primary Review A | 1 | ACC-2500 | Twitter |

The view `v_board_policy_social_media_account_detail` joins `board_policies` to `social_media_accounts` (likely through the `policies_accounts` junction table) to produce a row per policy-account pair. A sample row would link policy `POL-2302` (`Baseline Initiative D`, status `active`, effective `2023-02-14`) to account `ACC-2500` (platform `Twitter`, status `registered`). This view answers: "Which social media accounts fall under each board policy?"

**View `v_board_policy_district_employee_detail`**

```sql
CREATE VIEW v_board_policy_district_employee_detail AS
SELECT a.id, a.policy_number, a.policy_title, b.district_employee_id AS employee_district_employee_id, b.employee_id AS employee_employee_id, b.full_name AS employee_full_name
FROM board_policies a
  JOIN policies_employees j ON j.board_policy_id = a.id
  JOIN district_employees b ON b.district_employee_id = j.district_employee_id;
```

| id | policy_number | policy_title | employee_district_employee_id | employee_employee_id | employee_full_name |
|---|---|---|---|---|---|
| 1 | POL-2302 | Baseline Initiative D | 100 | Norma Fisher | Theodore Mcgrath |
| 1 | POL-2302 | Baseline Initiative D | 101 | Tasha Rodriguez | Account Name |
| 2 | POL-2304 | Distributed Model | 101 | Tasha Rodriguez | Account Name |
| 2 | POL-2304 | Distributed Model | 102 | Theodore Mcgrath | Saipan International Airport |
| 3 | POL-2306 | Adaptive Cluster | 102 | Theodore Mcgrath | Saipan International Airport |
| 3 | POL-2306 | Adaptive Cluster | 103 | Peter Mcdowell | Norma Fisher |
| 4 | POL-2308 | Primary Review A | 103 | Peter Mcdowell | Norma Fisher |
| 4 | POL-2308 | Primary Review A | 100 | Norma Fisher | Theodore Mcgrath |

The view `v_board_policy_district_employee_detail` joins `board_policies` to `district_employees` (likely through the `policies_employees` junction table) to produce a row per policy-employee pair. A sample row would pair policy `POL-2306` (`Adaptive Cluster`, status `active`, effective `2025-12-09`) with employee `Theodore Mcgrath` (id 102, role `Administrator`, status `active`). This view answers: "Which district employees are governed by each board policy?"

**View `v_public_information_officer_social_media_account_detail`**

```sql
CREATE VIEW v_public_information_officer_social_media_account_detail AS
SELECT a.id, a.officer_id, a.full_name, b.social_media_account_id AS account_social_media_account_id, b.account_identifier AS account_account_identifier, b.platform_type AS account_platform_type
FROM public_information_officers a
  JOIN officers_accounts j ON j.public_information_officer_id = a.id
  JOIN social_media_accounts b ON b.social_media_account_id = j.social_media_account_id;
```

| id | officer_id | full_name | account_social_media_account_id | account_account_identifier | account_platform_type |
|---|---|---|---|---|---|
| 1 | 103165 | Theodore Mcgrath | 1 | ACC-2500 | Twitter |
| 1 | 103165 | Theodore Mcgrath | 2 | ACC-2502 | Blog |
| 2 | 2933464 | Account Name | 2 | ACC-2502 | Blog |
| 2 | 2933464 | Account Name | 3 | ACC-2504 | Website |
| 3 | 10445622 | Saipan International Airport | 3 | ACC-2504 | Website |
| 3 | 10445622 | Saipan International Airport | 4 | ACC-2506 | Twitter |
| 4 | 7441150 | Norma Fisher | 4 | ACC-2506 | Twitter |
| 4 | 7441150 | Norma Fisher | 1 | ACC-2500 | Twitter |

The view `v_public_information_officer_social_media_account_detail` joins `public_information_officers` to `social_media_accounts` (likely through the `officers_accounts` junction table) to produce a row per officer-account pair. A sample row would show officer `Theodore Mcgrath` (id 1, officer_id `103165`, access_level `full`) alongside account `ACC-2500` (platform `Twitter`, status `registered`). This view answers: "Which social media accounts does each public information officer oversee, and what is their access level?"

**View `v_public_information_officer_board_policy`**

```sql
CREATE VIEW v_public_information_officer_board_policy AS
SELECT a.id, a.officer_id, a.full_name, a.contact_extension, b.id AS policy_id, b.policy_number AS policy_policy_number, b.policy_title AS policy_policy_title
FROM public_information_officers a JOIN board_policies b ON a.board_policy_id = b.id;
```

| id | officer_id | full_name | contact_extension | policy_id | policy_policy_number | policy_policy_title |
|---|---|---|---|---|---|---|
| 1 | 103165 | Theodore Mcgrath | Michelle Kelley | 1 | POL-2302 | Baseline Initiative D |
| 2 | 2933464 | Account Name | Kimberly Myers | 2 | POL-2304 | Distributed Model |
| 3 | 10445622 | Saipan International Airport | Alice Alvarez | 3 | POL-2306 | Adaptive Cluster |
| 4 | 7441150 | Norma Fisher | Norma Fisher | 4 | POL-2308 | Primary Review A |

The view `v_public_information_officer_board_policy` joins `public_information_officers` to `board_policies` on `board_policy_id`. A sample row would pair officer `Account Name` (id 2, officer_id `2933464`, access_level `restricted`) with policy `POL-2304` (`Distributed Model`, status `superseded`, effective `2024-07-25`). This view answers: "Which board policy does each public information officer govern?"

## Synthesis

The schema models the school district information ecosystem as a set of four core entity types—social media accounts, district employees, school district entities, and board policies—each stored in its own normalized base table with a surrogate primary key. The `social_media_accounts` table serves as the central fact table, carrying foreign keys to all three anchor tables and recording the account's business identifier, platform type, registration status, and audit timestamps. Five junction tables (`employees_accounts`, `entities_accounts`, `policies_accounts`, `policies_employees`, `officers_accounts`) resolve many-to-many relationships between the core entities, enabling flexible unbounded associations. Ten materialized views reassemble the normalized data into flat, query-ready rows that answer specific investigative questions: which employee manages which account, which policy governs which entity, and what is the full account or policy context for any given person or organization. The model's design ensures that every domain fact—every association between a person, an account, an entity, and a policy—can be reconstructed from the normalized tables through well-defined join paths, while the views provide the denormalized surfaces that auditors and compliance officers actually query.

## Data appendix

**Table `entities_accounts`**

| school_district_entity_id | social_media_account_id |
|---|---|
| 100 | 1 |
| 100 | 2 |
| 101 | 2 |
| 101 | 3 |
| 102 | 3 |
| 102 | 4 |
| 103 | 4 |
| 103 | 1 |

**Table `policies_accounts`**

| board_policy_id | social_media_account_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

**Table `policies_employees`**

| board_policy_id | district_employee_id |
|---|---|
| 1 | 100 |
| 1 | 101 |
| 2 | 101 |
| 2 | 102 |
| 3 | 102 |
| 3 | 103 |
| 4 | 103 |
| 4 | 100 |

**Table `officers_accounts`**

| public_information_officer_id | social_media_account_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |
