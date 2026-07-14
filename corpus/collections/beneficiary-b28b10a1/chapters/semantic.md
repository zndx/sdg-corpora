The humanitarian assistance domain tracks how organizations design programs, deliver activities, allocate resources, and enroll beneficiaries—often nested within household units. A single beneficiary may belong to one household while participating in multiple activities across several programs; a program may be run by one organization but span many activities; resources are consumed during activities and assigned to beneficiaries. The relational schema below captures these relationships through six base tables and a junction table, then exposes twenty denormalized views that reconstruct domain facts for reporting.

**Table `beneficiaries`**

| beneficiary_id | full_name | age | gender | location | vulnerability_status | household_id | program_id | activity_id | belongs_household_to_household_id |
|---|---|---|---|---|---|---|---|---|---|
| 325448 | Theodore Mcgrath | 35 | male | extended-location-99 | orphan | 726044 | 1000 | 1000 | 1000 |
| 7731875 | Account Name | 40 | female | integrated-location-100 | vulnerable_child | 16605652 | 1001 | 1001 | 1001 |
| 4447008 | Saipan International Airport | 45 | other | seasonal-location-101 | youth | 8928495 | 1002 | 1002 | 1002 |
| 39800616 | Norma Fisher | 50 | male | regional-location-102 | adult | 5844284 | 1003 | 1003 | 1003 |

The `beneficiaries` table is the central person-level entity. Each row carries a surrogate primary key `beneficiary_id` (e.g. `325448` for Theodore Mcgrath), a human-readable `full_name`, demographic attributes `age` and `gender`, a `location` string such as `extended-location-99`, and a `vulnerability_status` enum (`orphan`, `vulnerable_child`, `youth`, `adult`). The columns `household_id`, `program_id`, and `activity_id` are foreign keys that anchor the beneficiary to its household, the program it is enrolled in, and the activity it attends. The column `belongs_household_to_household_id` is a self-referential pointer that allows a beneficiary to be linked to another household for kinship or dependency tracking.

**Table `programs`**

| id | program_id | program_name | start_date | end_date | status | target_population | budget | funding_source | beneficiary_id | activity_id | organization_id |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 1000 | 103176 | Extended Review | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | planning | youth | 35.45 | baseline-funding-73 | 325448 | 1000 | 1 |
| 1001 | 2986219 | Pilot Initiative A | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | active | orphans | 18.47 | pilot-funding-74 | 7731875 | 1001 | 2 |
| 1002 | 1186079 | Baseline Model | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | completed | vulnerable_children | 26.25 | extended-funding-75 | 4447008 | 1002 | 3 |
| 1003 | 1562855 | Distributed Cluster | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | suspended | community | 17.12 | integrated-funding-76 | 39800616 | 1003 | 4 |

The `programs` table defines the intervention units. Its surrogate key `id` (e.g. `1000`) is distinct from the business identifier `program_id` (e.g. `103176` for *Extended Review*). Each program has a `program_name`, a `start_date` and `end_date` (note that in the sample data the end date precedes the start date, reflecting a data-entry quirk rather than a logical constraint), a `status` (`planning`, `active`, `completed`, `suspended`), a `target_population` (`youth`, `orphans`, `vulnerable_children`, `community`), a `budget` (a decimal such as `35.45`), a `funding_source` (`baseline-funding-73`), and foreign keys `beneficiary_id`, `activity_id`, and `organization_id` that tie the program to its lead beneficiary, its primary activity, and the implementing organization.

**Table `activities`**

| activity_id | activity_name | activity_type | date | location | participants_count | status | resources_used | program_id | beneficiary_id | resource_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1000 | Composite Programme | training | 2023-02-05T13:03:00 | extended-location-99 | 25 | planned | 17.45 | 1000 | 325448 | 100 |
| 1001 | Compact Standard A | outreach | 2024-07-16T20:20:00 | integrated-location-100 | 9 | ongoing | 21.90 | 1001 | 7731875 | 101 |
| 1002 | Legacy Framework | counseling | 2025-12-27T03:37:00 | seasonal-location-101 | 27 | completed | 26.35 | 1002 | 4447008 | 102 |
| 1003 | Regional Protocol | awareness_campaign | 2022-05-11T10:54:00 | regional-location-102 | 45 | cancelled | 30.80 | 1003 | 39800616 | 103 |

Activities are the operational events through which programs deliver value. The `activities` table uses `activity_id` as its primary key (e.g. `1000` for *Composite Programme*) and records an `activity_name`, an `activity_type` (`training`, `outreach`, `counseling`, `awareness_campaign`), a `date`, a `location`, a `participants_count` (e.g. `25`), a `status` (`planned`, `ongoing`, `completed`, `cancelled`), a `resources_used` cost figure, and foreign keys `program_id`, `beneficiary_id`, and `resource_id` that link the activity back to its parent program, to the beneficiary it serves, and to the resource it consumes.

**Table `resources`**

| id | resource_id | resource_name | resource_type | quantity | unit_cost | total_cost | distribution_date | status | activity_id | beneficiary_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 100 | 1167 | Adaptive Corridor | clothing | 9 | 10.72 | 61.82 | 2025-12-07T23:21:00 | available | 1000 | 325448 |
| 101 | 2106708 | Primary Series | bedding | 8 | 29.99 | 89.53 | 2022-05-18T06:38:00 | distributed | 1001 | 7731875 |
| 102 | 4180945 | Composite Assessment D | food | 0 | 18.47 | 29.24 | 2023-10-02T13:55:00 | reserved | 1002 | 4447008 |
| 103 | 10238270 | Compact Survey | uniform | 12 | 43.48 | 13.94 | 2024-03-13T20:12:00 | available | 1003 | 39800616 |

The `resources` table models physical or financial inputs. Its surrogate key `id` (e.g. `100`) maps to a business `resource_id` (`1167` for *Adaptive Corridor*). Attributes include `resource_name`, `resource_type` (`clothing`, `bedding`, `food`, `uniform`), `quantity` (an integer such as `9`), `unit_cost` (`10.72`), `total_cost` (`61.82`), a `distribution_date`, a `status` (`available`, `distributed`, `reserved`), and foreign keys `activity_id` and `beneficiary_id` that record which activity consumed the resource and which beneficiary received it.

**Table `households`**

| household_id | household_head | number_of_members | location | economic_status | vulnerability_level | support_received | program_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|
| 1000 | pilot-househol-86 | 43 | extended-location-99 | low_income | low | true | 1000 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 1001 | extended-househol-87 | 52 | integrated-location-100 | middle_income | medium | false | 1001 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 1002 | integrated-househol-88 | 61 | seasonal-location-101 | high_income | high | true | 1002 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 1003 | seasonal-househol-89 | 70 | regional-location-102 | low_income | low | false | 1003 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Households group beneficiaries into family or co-residence units. The `household_id` primary key (e.g. `1000`) identifies a household whose `household_head` is named `pilot-househol-86`. The table records `number_of_members` (`43`), `location`, `economic_status` (`low_income`, `middle_income`, `high_income`), `vulnerability_level` (`low`, `medium`, `high`), a boolean `support_received`, a `program_id` foreign key, and timestamps `created_at` and `updated_at`.

**Table `organizations`**

| id | org_id | org_name | org_type | established_year | location | status | membership | program_id | beneficiary_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 790471 | Extended Review | NGO | 10 | extended-location-99 | active | distributed-membersh-24 | 1000 | 325448 |
| 2 | 1717 | Pilot Initiative A | CBO | 16 | integrated-location-100 | inactive | baseline-membersh-25 | 1001 | 7731875 |
| 3 | 69437 | Baseline Model | network | 22 | seasonal-location-101 | suspended | pilot-membersh-26 | 1002 | 4447008 |
| 4 | m16 | Distributed Cluster | NGO | 28 | regional-location-102 | active | extended-membersh-27 | 1003 | 39800616 |

Organizations are the implementing entities. The surrogate key `id` (e.g. `1`) maps to `org_id` (`790471` for *Extended Review*). Attributes include `org_name`, `org_type` (`NGO`, `CBO`, `network`), `established_year` (e.g. `10`), `location`, `status` (`active`, `inactive`, `suspended`), `membership` (`distributed-membersh-24`), and foreign keys `program_id` and `beneficiary_id` that associate the organization with a program and a beneficiary.

**Table `households_beneficiaries`**

| household_id | beneficiary_id |
|---|---|
| 1000 | 325448 |
| 1000 | 7731875 |
| 1001 | 7731875 |
| 1001 | 4447008 |
| 1002 | 4447008 |
| 1002 | 39800616 |
| 1003 | 39800616 |
| 1003 | 325448 |

The `households_beneficiaries` junction table resolves the many-to-many relationship between households and beneficiaries. A single household can contain many beneficiaries, and a beneficiary can be associated with multiple households through kinship or dependency links. The junction table stores pairs of `household_id` and `beneficiary_id`, enabling queries that enumerate all members of a household or all households a beneficiary belongs to.

With the base schema established, the views materialize domain facts by joining these tables. Each view answers a specific analytical question by denormalizing the normalized model.

**View `v_beneficiary_program`**

```sql
CREATE VIEW v_beneficiary_program AS
SELECT a.beneficiary_id, a.full_name, a.age, a.gender, b.id AS program_id, b.program_id AS program_program_id, b.program_name AS program_program_name
FROM beneficiaries a JOIN programs b ON a.program_id = b.id;
```

| beneficiary_id | full_name | age | gender | program_id | program_program_id | program_program_name |
|---|---|---|---|---|---|---|
| 325448 | Theodore Mcgrath | 35 | male | 1000 | 103176 | Extended Review |
| 7731875 | Account Name | 40 | female | 1001 | 2986219 | Pilot Initiative A |
| 4447008 | Saipan International Airport | 45 | other | 1002 | 1186079 | Baseline Model |
| 39800616 | Norma Fisher | 50 | male | 1003 | 1562855 | Distributed Cluster |

The view `v_beneficiary_program` joins `beneficiaries` to `programs` on `program_id`, producing a flat row that answers *which program is each beneficiary enrolled in?* For example, the row for beneficiary `325448` (Theodore Mcgrath) shows program `103176` (*Extended Review*) with status `planning` and target population `youth`. The row for `7731875` (Account Name) links to program `2986219` (*Pilot Initiative A*) with status `active` and target population `orphans`.

**View `v_beneficiary_activity`**

```sql
CREATE VIEW v_beneficiary_activity AS
SELECT a.beneficiary_id, a.full_name, a.age, a.gender, b.activity_id AS activity_activity_id, b.activity_name AS activity_activity_name, b.activity_type AS activity_activity_type
FROM beneficiaries a JOIN activities b ON a.activity_id = b.activity_id;
```

| beneficiary_id | full_name | age | gender | activity_activity_id | activity_activity_name | activity_activity_type |
|---|---|---|---|---|---|---|
| 325448 | Theodore Mcgrath | 35 | male | 1000 | Composite Programme | training |
| 7731875 | Account Name | 40 | female | 1001 | Compact Standard A | outreach |
| 4447008 | Saipan International Airport | 45 | other | 1002 | Legacy Framework | counseling |
| 39800616 | Norma Fisher | 50 | male | 1003 | Regional Protocol | awareness_campaign |

`v_beneficiary_activity` joins `beneficiaries` to `activities` on `activity_id`, answering *which activity does each beneficiary attend?* The row for beneficiary `325448` shows activity `1000` (*Composite Programme*), type `training`, date `2023-02-05T13:03:00`, and `25` participants. The row for `4447008` (Saipan International Airport) shows activity `1002` (*Legacy Framework*), type `counseling`, with `27` participants and status `completed`.

**View `v_beneficiary_household`**

```sql
CREATE VIEW v_beneficiary_household AS
SELECT a.beneficiary_id, a.full_name, a.age, a.gender, b.household_id AS household_household_id, b.household_head AS household_household_head, b.number_of_members AS household_number_of_members
FROM beneficiaries a JOIN households b ON a.belongs_household_to_household_id = b.household_id;
```

| beneficiary_id | full_name | age | gender | household_household_id | household_household_head | household_number_of_members |
|---|---|---|---|---|---|---|
| 325448 | Theodore Mcgrath | 35 | male | 1000 | pilot-househol-86 | 43 |
| 7731875 | Account Name | 40 | female | 1001 | extended-househol-87 | 52 |
| 4447008 | Saipan International Airport | 45 | other | 1002 | integrated-househol-88 | 61 |
| 39800616 | Norma Fisher | 50 | male | 1003 | seasonal-househol-89 | 70 |

`v_beneficiary_household` joins `beneficiaries` to `households` on `household_id`, answering *which household does each beneficiary belong to?* The row for beneficiary `325448` shows household `1000` (`pilot-househol-86`), with `43` members, `low_income` economic status, and `support_received` set to `true`. The row for `39800616` (Norma Fisher) links to household `1003` (`seasonal-househol-89`), with `70` members, `low_income` status, and `support_received` set to `false`.

**View `v_program_beneficiary`**

```sql
CREATE VIEW v_program_beneficiary AS
SELECT a.id, a.program_id, a.program_name, a.start_date, b.beneficiary_id AS beneficiary_beneficiary_id, b.full_name AS beneficiary_full_name, b.age AS beneficiary_age
FROM programs a JOIN beneficiaries b ON a.beneficiary_id = b.beneficiary_id;
```

| id | program_id | program_name | start_date | beneficiary_beneficiary_id | beneficiary_full_name | beneficiary_age |
|---|---|---|---|---|---|---|
| 1000 | 103176 | Extended Review | 2022-09-05T20:24:00 | 325448 | Theodore Mcgrath | 35 |
| 1001 | 2986219 | Pilot Initiative A | 2023-02-16T03:41:00 | 7731875 | Account Name | 40 |
| 1002 | 1186079 | Baseline Model | 2024-07-27T10:58:00 | 4447008 | Saipan International Airport | 45 |
| 1003 | 1562855 | Distributed Cluster | 2025-12-11T17:15:00 | 39800616 | Norma Fisher | 50 |

`v_program_beneficiary` is the inverse of `v_beneficiary_program`: it joins `programs` to `beneficiaries` on `beneficiary_id`, answering *which beneficiary is associated with each program?* The row for program `103176` (*Extended Review*) shows beneficiary `325448` (Theodore Mcgrath), age `35`, gender `male`, vulnerability `orphan`. The row for program `1562855` (*Distributed Cluster*) shows beneficiary `39800616` (Norma Fisher), age `50`, gender `male`, vulnerability `adult`.

**View `v_program_activity`**

```sql
CREATE VIEW v_program_activity AS
SELECT a.id, a.program_id, a.program_name, a.start_date, b.activity_id AS activity_activity_id, b.activity_name AS activity_activity_name, b.activity_type AS activity_activity_type
FROM programs a JOIN activities b ON a.activity_id = b.activity_id;
```

| id | program_id | program_name | start_date | activity_activity_id | activity_activity_name | activity_activity_type |
|---|---|---|---|---|---|---|
| 1000 | 103176 | Extended Review | 2022-09-05T20:24:00 | 1000 | Composite Programme | training |
| 1001 | 2986219 | Pilot Initiative A | 2023-02-16T03:41:00 | 1001 | Compact Standard A | outreach |
| 1002 | 1186079 | Baseline Model | 2024-07-27T10:58:00 | 1002 | Legacy Framework | counseling |
| 1003 | 1562855 | Distributed Cluster | 2025-12-11T17:15:00 | 1003 | Regional Protocol | awareness_campaign |

`v_program_activity` joins `programs` to `activities` on `program_id`, answering *which activity is linked to each program?* The row for program `103176` (*Extended Review*) shows activity `1000` (*Composite Programme*), type `training`, date `2023-02-05T13:03:00`, status `planned`. The row for program `1562855` (*Distributed Cluster*) shows activity `1003` (*Regional Protocol*), type `awareness_campaign`, date `2022-05-11T10:54:00`, status `cancelled`.

**View `v_program_organization`**

```sql
CREATE VIEW v_program_organization AS
SELECT a.id, a.program_id, a.program_name, a.start_date, b.id AS organization_id, b.org_id AS organization_org_id, b.org_name AS organization_org_name
FROM programs a JOIN organizations b ON a.organization_id = b.id;
```

| id | program_id | program_name | start_date | organization_id | organization_org_id | organization_org_name |
|---|---|---|---|---|---|---|
| 1000 | 103176 | Extended Review | 2022-09-05T20:24:00 | 1 | 790471 | Extended Review |
| 1001 | 2986219 | Pilot Initiative A | 2023-02-16T03:41:00 | 2 | 1717 | Pilot Initiative A |
| 1002 | 1186079 | Baseline Model | 2024-07-27T10:58:00 | 3 | 69437 | Baseline Model |
| 1003 | 1562855 | Distributed Cluster | 2025-12-11T17:15:00 | 4 | m16 | Distributed Cluster |

`v_program_organization` joins `programs` to `organizations` on `organization_id`, answering *which organization implements each program?* The row for program `103176` (*Extended Review*) shows organization `790471` (*Extended Review*), type `NGO`, established year `10`, status `active`. The row for program `2986219` (*Pilot Initiative A*) shows organization `1717` (*Pilot Initiative A*), type `CBO`, established year `16`, status `inactive`.

**View `v_activity_program`**

```sql
CREATE VIEW v_activity_program AS
SELECT a.activity_id, a.activity_name, a.activity_type, a.date, b.id AS program_id, b.program_id AS program_program_id, b.program_name AS program_program_name
FROM activities a JOIN programs b ON a.program_id = b.id;
```

| activity_id | activity_name | activity_type | date | program_id | program_program_id | program_program_name |
|---|---|---|---|---|---|---|
| 1000 | Composite Programme | training | 2023-02-05T13:03:00 | 1000 | 103176 | Extended Review |
| 1001 | Compact Standard A | outreach | 2024-07-16T20:20:00 | 1001 | 2986219 | Pilot Initiative A |
| 1002 | Legacy Framework | counseling | 2025-12-27T03:37:00 | 1002 | 1186079 | Baseline Model |
| 1003 | Regional Protocol | awareness_campaign | 2022-05-11T10:54:00 | 1003 | 1562855 | Distributed Cluster |

`v_activity_program` joins `activities` to `programs` on `program_id`, answering *which program does each activity belong to?* The row for activity `1000` (*Composite Programme*) shows program `103176` (*Extended Review*), status `planning`, budget `35.45`, funding `baseline-funding-73`. The row for activity `1003` (*Regional Protocol*) shows program `1562855` (*Distributed Cluster*), status `suspended`, budget `17.12`, funding `integrated-funding-76`.

**View `v_activity_beneficiary`**

```sql
CREATE VIEW v_activity_beneficiary AS
SELECT a.activity_id, a.activity_name, a.activity_type, a.date, b.beneficiary_id AS beneficiary_beneficiary_id, b.full_name AS beneficiary_full_name, b.age AS beneficiary_age
FROM activities a JOIN beneficiaries b ON a.beneficiary_id = b.beneficiary_id;
```

| activity_id | activity_name | activity_type | date | beneficiary_beneficiary_id | beneficiary_full_name | beneficiary_age |
|---|---|---|---|---|---|---|
| 1000 | Composite Programme | training | 2023-02-05T13:03:00 | 325448 | Theodore Mcgrath | 35 |
| 1001 | Compact Standard A | outreach | 2024-07-16T20:20:00 | 7731875 | Account Name | 40 |
| 1002 | Legacy Framework | counseling | 2025-12-27T03:37:00 | 4447008 | Saipan International Airport | 45 |
| 1003 | Regional Protocol | awareness_campaign | 2022-05-11T10:54:00 | 39800616 | Norma Fisher | 50 |

`v_activity_beneficiary` joins `activities` to `beneficiaries` on `beneficiary_id`, answering *which beneficiary is served by each activity?* The row for activity `1000` (*Composite Programme*) shows beneficiary `325448` (Theodore Mcgrath), age `35`, gender `male`, vulnerability `orphan`. The row for activity `1002` (*Legacy Framework*) shows beneficiary `4447008` (Saipan International Airport), age `45`, gender `other`, vulnerability `youth`.

**View `v_activity_resource`**

```sql
CREATE VIEW v_activity_resource AS
SELECT a.activity_id, a.activity_name, a.activity_type, a.date, b.id AS resource_id, b.resource_id AS resource_resource_id, b.resource_name AS resource_resource_name
FROM activities a JOIN resources b ON a.resource_id = b.id;
```

| activity_id | activity_name | activity_type | date | resource_id | resource_resource_id | resource_resource_name |
|---|---|---|---|---|---|---|
| 1000 | Composite Programme | training | 2023-02-05T13:03:00 | 100 | 1167 | Adaptive Corridor |
| 1001 | Compact Standard A | outreach | 2024-07-16T20:20:00 | 101 | 2106708 | Primary Series |
| 1002 | Legacy Framework | counseling | 2025-12-27T03:37:00 | 102 | 4180945 | Composite Assessment D |
| 1003 | Regional Protocol | awareness_campaign | 2022-05-11T10:54:00 | 103 | 10238270 | Compact Survey |

`v_activity_resource` joins `activities` to `resources` on `resource_id`, answering *which resource is consumed by each activity?* The row for activity `1000` (*Composite Programme*) shows resource `1167` (*Adaptive Corridor*), type `clothing`, quantity `9`, unit cost `10.72`, total cost `61.82`, status `available`. The row for activity `1001` (*Compact Standard A*) shows resource `2106708` (*Primary Series*), type `bedding`, quantity `8`, unit cost `29.99`, total cost `89.53`, status `distributed`.

**View `v_resource_activity`**

```sql
CREATE VIEW v_resource_activity AS
SELECT a.id, a.resource_id, a.resource_name, a.resource_type, b.activity_id AS activity_activity_id, b.activity_name AS activity_activity_name, b.activity_type AS activity_activity_type
FROM resources a JOIN activities b ON a.activity_id = b.activity_id;
```

| id | resource_id | resource_name | resource_type | activity_activity_id | activity_activity_name | activity_activity_type |
|---|---|---|---|---|---|---|
| 100 | 1167 | Adaptive Corridor | clothing | 1000 | Composite Programme | training |
| 101 | 2106708 | Primary Series | bedding | 1001 | Compact Standard A | outreach |
| 102 | 4180945 | Composite Assessment D | food | 1002 | Legacy Framework | counseling |
| 103 | 10238270 | Compact Survey | uniform | 1003 | Regional Protocol | awareness_campaign |

`v_resource_activity` is the inverse of `v_activity_resource`: it joins `resources` to `activities` on `activity_id`, answering *which activity consumes each resource?* The row for resource `1167` (*Adaptive Corridor*) shows activity `1000` (*Composite Programme*), type `training`, date `2023-02-05T13:03:00`, participants `25`. The row for resource `10238270` (*Compact Survey*) shows activity `1003` (*Regional Protocol*), type `awareness_campaign`, date `2022-05-11T10:54:00`, participants `45`.

**View `v_resource_beneficiary`**

```sql
CREATE VIEW v_resource_beneficiary AS
SELECT a.id, a.resource_id, a.resource_name, a.resource_type, b.beneficiary_id AS beneficiary_beneficiary_id, b.full_name AS beneficiary_full_name, b.age AS beneficiary_age
FROM resources a JOIN beneficiaries b ON a.beneficiary_id = b.beneficiary_id;
```

| id | resource_id | resource_name | resource_type | beneficiary_beneficiary_id | beneficiary_full_name | beneficiary_age |
|---|---|---|---|---|---|---|
| 100 | 1167 | Adaptive Corridor | clothing | 325448 | Theodore Mcgrath | 35 |
| 101 | 2106708 | Primary Series | bedding | 7731875 | Account Name | 40 |
| 102 | 4180945 | Composite Assessment D | food | 4447008 | Saipan International Airport | 45 |
| 103 | 10238270 | Compact Survey | uniform | 39800616 | Norma Fisher | 50 |

`v_resource_beneficiary` joins `resources` to `beneficiaries` on `beneficiary_id`, answering *which beneficiary receives each resource?* The row for resource `1167` (*Adaptive Corridor*) shows beneficiary `325448` (Theodore Mcgrath), age `35`, gender `male`, vulnerability `orphan`. The row for resource `4180945` (*Composite Assessment D*) shows beneficiary `4447008` (Saipan International Airport), age `45`, gender `other`, vulnerability `youth`.

**View `v_household_beneficiary_detail`**

```sql
CREATE VIEW v_household_beneficiary_detail AS
SELECT a.household_id, a.household_head, a.number_of_members, b.beneficiary_id AS beneficiary_beneficiary_id, b.full_name AS beneficiary_full_name, b.age AS beneficiary_age
FROM households a
  JOIN households_beneficiaries j ON j.household_id = a.household_id
  JOIN beneficiaries b ON b.beneficiary_id = j.beneficiary_id;
```

| household_id | household_head | number_of_members | beneficiary_beneficiary_id | beneficiary_full_name | beneficiary_age |
|---|---|---|---|---|---|
| 1000 | pilot-househol-86 | 43 | 325448 | Theodore Mcgrath | 35 |
| 1000 | pilot-househol-86 | 43 | 7731875 | Account Name | 40 |
| 1001 | extended-househol-87 | 52 | 7731875 | Account Name | 40 |
| 1001 | extended-househol-87 | 52 | 4447008 | Saipan International Airport | 45 |
| 1002 | integrated-househol-88 | 61 | 4447008 | Saipan International Airport | 45 |
| 1002 | integrated-househol-88 | 61 | 39800616 | Norma Fisher | 50 |
| 1003 | seasonal-househol-89 | 70 | 39800616 | Norma Fisher | 50 |
| 1003 | seasonal-househol-89 | 70 | 325448 | Theodore Mcgrath | 35 |

`v_household_beneficiary_detail` joins `households` to `beneficiaries` on `household_id`, answering *which beneficiaries belong to each household?* The row for household `1000` (`pilot-househol-86`) shows beneficiary `325448` (Theodore Mcgrath), age `35`, gender `male`, vulnerability `orphan`. The row for household `1002` (`integrated-househol-88`) shows beneficiary `4447008` (Saipan International Airport), age `45`, gender `other`, vulnerability `youth`.

**View `v_household_program`**

```sql
CREATE VIEW v_household_program AS
SELECT a.household_id, a.household_head, a.number_of_members, a.location, b.id AS program_id, b.program_id AS program_program_id, b.program_name AS program_program_name
FROM households a JOIN programs b ON a.program_id = b.id;
```

| household_id | household_head | number_of_members | location | program_id | program_program_id | program_program_name |
|---|---|---|---|---|---|---|
| 1000 | pilot-househol-86 | 43 | extended-location-99 | 1000 | 103176 | Extended Review |
| 1001 | extended-househol-87 | 52 | integrated-location-100 | 1001 | 2986219 | Pilot Initiative A |
| 1002 | integrated-househol-88 | 61 | seasonal-location-101 | 1002 | 1186079 | Baseline Model |
| 1003 | seasonal-househol-89 | 70 | regional-location-102 | 1003 | 1562855 | Distributed Cluster |

`v_household_program` joins `households` to `programs` on `program_id`, answering *which program is associated with each household?* The row for household `1000` (`pilot-househol-86`) shows program `103176` (*Extended Review*), status `planning`, target population `youth`, budget `35.45`. The row for household `1003` (`seasonal-househol-89`) shows program `1562855` (*Distributed Cluster*), status `suspended`, target population `community`, budget `17.12`.

**View `v_organization_program`**

```sql
CREATE VIEW v_organization_program AS
SELECT a.id, a.org_id, a.org_name, a.org_type, b.id AS program_id, b.program_id AS program_program_id, b.program_name AS program_program_name
FROM organizations a JOIN programs b ON a.program_id = b.id;
```

| id | org_id | org_name | org_type | program_id | program_program_id | program_program_name |
|---|---|---|---|---|---|---|
| 1 | 790471 | Extended Review | NGO | 1000 | 103176 | Extended Review |
| 2 | 1717 | Pilot Initiative A | CBO | 1001 | 2986219 | Pilot Initiative A |
| 3 | 69437 | Baseline Model | network | 1002 | 1186079 | Baseline Model |
| 4 | m16 | Distributed Cluster | NGO | 1003 | 1562855 | Distributed Cluster |

`v_organization_program` joins `organizations` to `programs` on `program_id`, answering *which program does each organization implement?* The row for organization `790471` (*Extended Review*) shows program `103176` (*Extended Review*), status `planning`, budget `35.45`, funding `baseline-funding-73`. The row for organization `69437` (*Baseline Model*) shows program `1186079` (*Baseline Model*), status `completed`, budget `26.25`, funding `extended-funding-75`.

**View `v_organization_beneficiary`**

```sql
CREATE VIEW v_organization_beneficiary AS
SELECT a.id, a.org_id, a.org_name, a.org_type, b.beneficiary_id AS beneficiary_beneficiary_id, b.full_name AS beneficiary_full_name, b.age AS beneficiary_age
FROM organizations a JOIN beneficiaries b ON a.beneficiary_id = b.beneficiary_id;
```

| id | org_id | org_name | org_type | beneficiary_beneficiary_id | beneficiary_full_name | beneficiary_age |
|---|---|---|---|---|---|---|
| 1 | 790471 | Extended Review | NGO | 325448 | Theodore Mcgrath | 35 |
| 2 | 1717 | Pilot Initiative A | CBO | 7731875 | Account Name | 40 |
| 3 | 69437 | Baseline Model | network | 4447008 | Saipan International Airport | 45 |
| 4 | m16 | Distributed Cluster | NGO | 39800616 | Norma Fisher | 50 |

`v_organization_beneficiary` joins `organizations` to `beneficiaries` on `beneficiary_id`, answering *which beneficiary is served by each organization?* The row for organization `790471` (*Extended Review*) shows beneficiary `325448` (Theodore Mcgrath), age `35`, gender `male`, vulnerability `orphan`. The row for organization `m16` (*Distributed Cluster*) shows beneficiary `39800616` (Norma Fisher), age `50`, gender `male`, vulnerability `adult`.

The schema models the humanitarian assistance domain as a star-like graph centered on `beneficiaries`, with `programs`, `activities`, `resources`, `households`, and `organizations` as satellite entities. Foreign keys on `program_id`, `activity_id`, `household_id`, `resource_id`, and `organization_id` propagate relationships across tables, while the `households_beneficiaries` junction table resolves the many-to-many link between households and beneficiaries. The twenty views each perform a single join to reconstruct a domain fact—enrollment, delivery, consumption, or association—into a flat, report-ready shape. This separation of normalized storage from denormalized access keeps the base schema stable while allowing flexible querying across every axis of the domain.