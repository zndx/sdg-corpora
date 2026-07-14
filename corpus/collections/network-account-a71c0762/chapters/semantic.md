The domain under examination is a network access governance system, where every actor—student, administrator, or institutional resource—must be accounted for through a formalised account lifecycle, bound by policy, and monitored for security incidents. The relational schema captures this ecosystem by distributing entities across six base tables whose primary keys and foreign keys encode the cardinality-bounded relationships between actors, resources, and the policies that govern them. Each view materialises a particular join path, answering a distinct governance question by reconstructing a domain fact from the normalised tables.

## Base Tables and Entity Types

The schema centres on `network_accounts`, the universal ledger of every authenticated identity in the system. Each row carries a surrogate `id`, a human-readable `account_identifier` such as `ACC-2500`, and a `username` like `Pilot Review`. Authentication is handled through `username` and `password_hash` columns (e.g. `integrated-password-76`), while the `status` column tracks the lifecycle state—`active`, `suspended`, `revoked`, or `pending`. Temporal metadata lives in `creation_date` and `last_login_timestamp`. The `account_type` column disambiguates the holder as `student`, `staff`, or `administrator`. Three foreign keys—`student_id`, `network_administrator_admin_id`, and `network_resource_id`—tie each account to its owning entity.

**Table `network_accounts`**

| id | account_identifier | username | password_hash | status | creation_date | last_login_timestamp | account_type | student_id | network_administrator_admin_id | network_resource_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | ACC-2500 | Pilot Review | integrated-password-76 | active | 2022-01-13T12:24:00 | 2024-11-16T10:42:00 | student | 1 | 2986232 | 1 |
| 2 | ACC-2502 | Baseline Initiative | seasonal-password-77 | suspended | 2023-06-24T19:41:00 | 2025-04-27T17:59:00 | staff | 2 | 9222f51a-9bad-11eb-a8a2-19ed5c03f8d3 | 2 |
| 3 | ACC-2504 | Distributed Model A | regional-password-78 | revoked | 2024-11-08T02:58:00 | 2022-09-11T00:16:00 | administrator | 3 | 859ac854-9bad-11eb-a8a2-19ed5c03f8d3 | 3 |
| 4 | ACC-2506 | Adaptive Cluster | legacy-password-79 | pending | 2025-04-19T09:15:00 | 2023-02-22T07:33:00 | student | 4 | 57e4c59a-8fcd-11eb-924d-9cd76263cbd0 | 4 |

The `students` table holds the roster of learners. Its primary key is `student_id`, and each row records a `full_name` (for instance, `Theodore Mcgrath`), a `grade_level` (values such as `29` or `41`), and the `school_enrollment` they belong to (e.g. `compact-school-62`). Boolean flags like `is_eligible_for_internet` and a `parent_guardian_contact` column complete the profile. The foreign key `network_account_id` links the student to their account, while `acceptable_use_policy_id` points to the policy they must accept.

**Table `students`**

| student_id | full_name | grade_level | school_enrollment | is_eligible_for_internet | parent_guardian_contact | network_account_id | acceptable_use_policy_id |
|---|---|---|---|---|---|---|---|
| 1 | Theodore Mcgrath | 29 | compact-school-62 | true | Bobby Flores | 1 | 1000 |
| 2 | Account Name | 33 | composite-school-63 | false | Norma Fisher | 2 | 1001 |
| 3 | Saipan International Airport | 37 | primary-school-64 | true | Aaron James | 3 | 1002 |
| 4 | Norma Fisher | 41 | adaptive-school-65 | false | Peter Mcdowell | 4 | 1003 |

Network administrators are modelled in `network_administrators`, keyed by `admin_id`—a mix of integer identifiers like `2986232` and UUIDs such as `9222f51a-9bad-11eb-a8a2-19ed5c03f8d3`. The `full_name` column mirrors the student table (the same name `Theodore Mcgrath` appears here as well, reflecting the fictional nature of the data). The `role_level` distinguishes `districtwide` from `school` administrators, `appointment_date` records when they assumed office, and `is_authorized_to_revoke` is a boolean governing revocation privileges. The `network_account_id` and `acceptable_use_policy_id` foreign keys parallel the student model.

**Table `network_administrators`**

| admin_id | full_name | role_level | appointment_date | is_authorized_to_revoke | network_account_id | acceptable_use_policy_id |
|---|---|---|---|---|---|---|
| 2986232 | Theodore Mcgrath | districtwide | 2022-05-03 | false | 1 | 1000 |
| 9222f51a-9bad-11eb-a8a2-19ed5c03f8d3 | Account Name | school | 2023-10-14 | true | 2 | 1001 |
| 859ac854-9bad-11eb-a8a2-19ed5c03f8d3 | Saipan International Airport | districtwide | 2024-03-25 | false | 3 | 1002 |
| 57e4c59a-8fcd-11eb-924d-9cd76263cbd0 | Norma Fisher | school | 2025-08-09 | true | 4 | 1003 |

Policy governance is captured in `acceptable_use_policies`. The primary key `id` (values like `1000`, `1001`) is distinct from the human-readable `policy_id` (e.g. `5844252` or the UUID-like `ChIJkzsYUIBt5kcRM6_JHx26ONk`). Each policy has a `version_number` (`VER-2245`, `VER-2249`), an `effective_date`, and a suite of boolean constraints: `is_legally_binding`, `prohibits_commercial_use`, and `requires_ethical_behavior`. The table also carries three foreign keys—`network_account_id`, `student_id`, and `network_administrator_admin_id`—which create a many-to-many bridge between policies and every actor type.

**Table `acceptable_use_policies`**

| id | policy_id | version_number | effective_date | is_legally_binding | prohibits_commercial_use | requires_ethical_behavior | network_account_id | student_id | network_administrator_admin_id |
|---|---|---|---|---|---|---|---|---|---|
| 1000 | 5844252 | VER-2245 | 2023-02-14 | true | true | true | 1 | 1 | 2986232 |
| 1001 | 10207142 | VER-2249 | 2024-07-25 | false | false | false | 2 | 2 | 9222f51a-9bad-11eb-a8a2-19ed5c03f8d3 |
| 1002 | 1562847 | VER-2253 | 2025-12-09 | true | true | true | 3 | 3 | 859ac854-9bad-11eb-a8a2-19ed5c03f8d3 |
| 1003 | ChIJkzsYUIBt5kcRM6_JHx26ONk | VER-2257 | 2022-05-20 | false | false | false | 4 | 4 | 57e4c59a-8fcd-11eb-924d-9cd76263cbd0 |

Network resources are catalogued in `network_resources`. The surrogate `network_resource_id` (values `1` through `4`) is the primary key, while `resource_id` provides an external identifier (`1167`, `2106708`). The `resource_name` column holds descriptive labels such as `Adaptive Corridor` or `Primary Series`, and `resource_type` classifies the resource as `electronic_library`, `research_database`, `collaborative_platform`, or `external_network`. Boolean flags `is_fee_based` and `requires_prior_approval` govern access economics, while `access_level` (values `public`, `restricted`, `internal`) encodes the security tier. Foreign keys `network_account_id` and `acceptable_use_policy_id` tie each resource to its owner and governing policy.

**Table `network_resources`**

| network_resource_id | resource_id | resource_name | resource_type | is_fee_based | requires_prior_approval | access_level | network_account_id | acceptable_use_policy_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 1167 | Adaptive Corridor | electronic_library | false | false | public | 1 | 1000 |
| 2 | 2106708 | Primary Series | research_database | true | true | restricted | 2 | 1001 |
| 3 | 4180945 | Composite Assessment D | collaborative_platform | false | false | internal | 3 | 1002 |
| 4 | 10238270 | Compact Survey | external_network | true | true | public | 4 | 1003 |

Security incidents are recorded in `security_incidents`. The `incident_id` (e.g. `1336174` or the string `state_uk_4`) is the primary key. The `incident_type` column categorises events as `vandalism`, `security_risk`, `unauthorized_access`, or `policy_violation`. A numeric `severity_level` (values ranging from `29` to `62`) quantifies seriousness, `reported_date` timestamps the event, and `is_resolved` tracks resolution status. The `resulting_action` column records the outcome—`warning`, `suspension`, `revocation`, or `no_action`. Three foreign keys link each incident to the affected `network_account_id`, the overseeing `network_administrator_admin_id`, and the relevant `acceptable_use_policy_id`.

**Table `security_incidents`**

| incident_id | incident_type | severity_level | reported_date | is_resolved | resulting_action | network_account_id | network_administrator_admin_id | acceptable_use_policy_id |
|---|---|---|---|---|---|---|---|---|
| 1336174 | vandalism | 29 | 2025-04-27T03:09:00 | false | warning | 1 | 2986232 | 1000 |
| state_uk_4 | security_risk | 40 | 2022-09-11T10:26:00 | true | suspension | 2 | 9222f51a-9bad-11eb-a8a2-19ed5c03f8d3 | 1001 |
| 2933483 | unauthorized_access | 51 | 2023-02-22T17:43:00 | false | revocation | 3 | 859ac854-9bad-11eb-a8a2-19ed5c03f8d3 | 1002 |
| 2986243 | policy_violation | 62 | 2024-07-06T00:00:00 | true | no_action | 4 | 57e4c59a-8fcd-11eb-924d-9cd76263cbd0 | 1003 |

## Views: Reconstructing Domain Facts

Each view is a named join that answers a specific governance question by pulling together columns from two or more base tables. The following sections interpret what each view returns, using concrete rows as evidence.

The view `vw_network_account_student` joins `network_accounts` to `students` on `network_accounts.student_id = students.student_id`, answering the question: *which student is associated with this account?* A returned row shows account `ACC-2500` (id `1`) linked to student `Theodore Mcgrath` (student_id `1`), grade level `29`, enrolled at `compact-school-62`, with parent guardian `Bobby Flores`.

**View `vw_network_account_student`**

```sql
CREATE VIEW vw_network_account_student AS
SELECT a.id, a.account_identifier, a.username, a.password_hash, b.student_id AS student_student_id, b.full_name AS student_full_name, b.grade_level AS student_grade_level
FROM network_accounts a JOIN students b ON a.student_id = b.student_id;
```

| id | account_identifier | username | password_hash | student_student_id | student_full_name | student_grade_level |
|---|---|---|---|---|---|---|
| 1 | ACC-2500 | Pilot Review | integrated-password-76 | 1 | Theodore Mcgrath | 29 |
| 2 | ACC-2502 | Baseline Initiative | seasonal-password-77 | 2 | Account Name | 33 |
| 3 | ACC-2504 | Distributed Model A | regional-password-78 | 3 | Saipan International Airport | 37 |
| 4 | ACC-2506 | Adaptive Cluster | legacy-password-79 | 4 | Norma Fisher | 41 |

The view `vw_network_account_network_administrator` joins `network_accounts` to `network_administrators` on `network_accounts.network_administrator_admin_id = network_administrators.admin_id`, answering: *which administrator controls this account?* Row id `1` of `network_accounts` maps to administrator `Theodore Mcgrath` (admin_id `2986232`), role level `districtwide`, appointed `2022-05-03`, with `is_authorized_to_revoke` set to `false`.

**View `vw_network_account_network_administrator`**

```sql
CREATE VIEW vw_network_account_network_administrator AS
SELECT a.id, a.account_identifier, a.username, a.password_hash, b.admin_id AS administrator_admin_id, b.full_name AS administrator_full_name, b.role_level AS administrator_role_level
FROM network_accounts a JOIN network_administrators b ON a.network_administrator_admin_id = b.admin_id;
```

| id | account_identifier | username | password_hash | administrator_admin_id | administrator_full_name | administrator_role_level |
|---|---|---|---|---|---|---|
| 1 | ACC-2500 | Pilot Review | integrated-password-76 | 2986232 | Theodore Mcgrath | districtwide |
| 2 | ACC-2502 | Baseline Initiative | seasonal-password-77 | 9222f51a-9bad-11eb-a8a2-19ed5c03f8d3 | Account Name | school |
| 3 | ACC-2504 | Distributed Model A | regional-password-78 | 859ac854-9bad-11eb-a8a2-19ed5c03f8d3 | Saipan International Airport | districtwide |
| 4 | ACC-2506 | Adaptive Cluster | legacy-password-79 | 57e4c59a-8fcd-11eb-924d-9cd76263cbd0 | Norma Fisher | school |

The view `vw_network_account_network_resource` joins `network_accounts` to `network_resources` on `network_accounts.network_resource_id = network_resources.network_resource_id`, answering: *which resource is provisioned under this account?* Account id `1` (`ACC-2500`) is associated with resource `Adaptive Corridor` (resource_id `1167`), type `electronic_library`, which is `public` access and not fee-based.

**View `vw_network_account_network_resource`**

```sql
CREATE VIEW vw_network_account_network_resource AS
SELECT a.id, a.account_identifier, a.username, a.password_hash, b.network_resource_id AS resource_network_resource_id, b.resource_id AS resource_resource_id, b.resource_name AS resource_resource_name
FROM network_accounts a JOIN network_resources b ON a.network_resource_id = b.network_resource_id;
```

| id | account_identifier | username | password_hash | resource_network_resource_id | resource_resource_id | resource_resource_name |
|---|---|---|---|---|---|---|
| 1 | ACC-2500 | Pilot Review | integrated-password-76 | 1 | 1167 | Adaptive Corridor |
| 2 | ACC-2502 | Baseline Initiative | seasonal-password-77 | 2 | 2106708 | Primary Series |
| 3 | ACC-2504 | Distributed Model A | regional-password-78 | 3 | 4180945 | Composite Assessment D |
| 4 | ACC-2506 | Adaptive Cluster | legacy-password-79 | 4 | 10238270 | Compact Survey |

The view `vw_student_network_account` reverses the perspective: it joins `students` to `network_accounts` on `students.network_account_id = network_accounts.id`, answering: *what account does this student hold?* Student `Theodore Mcgrath` (student_id `1`) holds account `ACC-2500` with username `Pilot Review`, status `active`, and account type `student`.

**View `vw_student_network_account`**

```sql
CREATE VIEW vw_student_network_account AS
SELECT a.student_id, a.full_name, a.grade_level, a.school_enrollment, b.id AS account_id, b.account_identifier AS account_account_identifier, b.username AS account_username
FROM students a JOIN network_accounts b ON a.network_account_id = b.id;
```

| student_id | full_name | grade_level | school_enrollment | account_id | account_account_identifier | account_username |
|---|---|---|---|---|---|---|
| 1 | Theodore Mcgrath | 29 | compact-school-62 | 1 | ACC-2500 | Pilot Review |
| 2 | Account Name | 33 | composite-school-63 | 2 | ACC-2502 | Baseline Initiative |
| 3 | Saipan International Airport | 37 | primary-school-64 | 3 | ACC-2504 | Distributed Model A |
| 4 | Norma Fisher | 41 | adaptive-school-65 | 4 | ACC-2506 | Adaptive Cluster |

The view `vw_student_acceptable_use_policy` joins `students` to `acceptable_use_policies` on `students.acceptable_use_policy_id = acceptable_use_policies.id`, answering: *which policy governs this student?* Student `Theodore Mcgrath` is bound by policy id `1000` (external policy_id `5844252`, version `VER-2245`), effective `2023-02-14`, which is legally binding, prohibits commercial use, and requires ethical behaviour.

**View `vw_student_acceptable_use_policy`**

```sql
CREATE VIEW vw_student_acceptable_use_policy AS
SELECT a.student_id, a.full_name, a.grade_level, a.school_enrollment, b.id AS policy_id, b.policy_id AS policy_policy_id, b.version_number AS policy_version_number
FROM students a JOIN acceptable_use_policies b ON a.acceptable_use_policy_id = b.id;
```

| student_id | full_name | grade_level | school_enrollment | policy_id | policy_policy_id | policy_version_number |
|---|---|---|---|---|---|---|
| 1 | Theodore Mcgrath | 29 | compact-school-62 | 1000 | 5844252 | VER-2245 |
| 2 | Account Name | 33 | composite-school-63 | 1001 | 10207142 | VER-2249 |
| 3 | Saipan International Airport | 37 | primary-school-64 | 1002 | 1562847 | VER-2253 |
| 4 | Norma Fisher | 41 | adaptive-school-65 | 1003 | ChIJkzsYUIBt5kcRM6_JHx26ONk | VER-2257 |

The view `vw_network_administrator_network_account` joins `network_administrators` to `network_accounts` on `network_administrators.network_account_id = network_accounts.id`, answering: *which account is managed by this administrator?* Administrator `Theodore Mcgrath` (admin_id `2986232`) manages account `ACC-2500` (id `1`), username `Pilot Review`, status `active`, created on `2022-01-13T12:24:00`.

**View `vw_network_administrator_network_account`**

```sql
CREATE VIEW vw_network_administrator_network_account AS
SELECT a.admin_id, a.full_name, a.role_level, a.appointment_date, b.id AS account_id, b.account_identifier AS account_account_identifier, b.username AS account_username
FROM network_administrators a JOIN network_accounts b ON a.network_account_id = b.id;
```

| admin_id | full_name | role_level | appointment_date | account_id | account_account_identifier | account_username |
|---|---|---|---|---|---|---|
| 2986232 | Theodore Mcgrath | districtwide | 2022-05-03 | 1 | ACC-2500 | Pilot Review |
| 9222f51a-9bad-11eb-a8a2-19ed5c03f8d3 | Account Name | school | 2023-10-14 | 2 | ACC-2502 | Baseline Initiative |
| 859ac854-9bad-11eb-a8a2-19ed5c03f8d3 | Saipan International Airport | districtwide | 2024-03-25 | 3 | ACC-2504 | Distributed Model A |
| 57e4c59a-8fcd-11eb-924d-9cd76263cbd0 | Norma Fisher | school | 2025-08-09 | 4 | ACC-2506 | Adaptive Cluster |

The view `vw_network_administrator_acceptable_use_policy` joins `network_administrators` to `acceptable_use_policies` on `network_administrators.acceptable_use_policy_id = acceptable_use_policies.id`, answering: *which policy does this administrator accept?* Administrator `Theodore Mcgrath` (admin_id `2986232`) is bound by policy id `1000` (version `VER-2245`), which is legally binding and requires ethical behaviour.

**View `vw_network_administrator_acceptable_use_policy`**

```sql
CREATE VIEW vw_network_administrator_acceptable_use_policy AS
SELECT a.admin_id, a.full_name, a.role_level, a.appointment_date, b.id AS policy_id, b.policy_id AS policy_policy_id, b.version_number AS policy_version_number
FROM network_administrators a JOIN acceptable_use_policies b ON a.acceptable_use_policy_id = b.id;
```

| admin_id | full_name | role_level | appointment_date | policy_id | policy_policy_id | policy_version_number |
|---|---|---|---|---|---|---|
| 2986232 | Theodore Mcgrath | districtwide | 2022-05-03 | 1000 | 5844252 | VER-2245 |
| 9222f51a-9bad-11eb-a8a2-19ed5c03f8d3 | Account Name | school | 2023-10-14 | 1001 | 10207142 | VER-2249 |
| 859ac854-9bad-11eb-a8a2-19ed5c03f8d3 | Saipan International Airport | districtwide | 2024-03-25 | 1002 | 1562847 | VER-2253 |
| 57e4c59a-8fcd-11eb-924d-9cd76263cbd0 | Norma Fisher | school | 2025-08-09 | 1003 | ChIJkzsYUIBt5kcRM6_JHx26ONk | VER-2257 |

The view `vw_acceptable_use_policy_network_account` joins `acceptable_use_policies` to `network_accounts` on `acceptable_use_policies.network_account_id = network_accounts.id`, answering: *which account is governed by this policy?* Policy id `1000` (version `VER-2245`) governs account `ACC-2500` (id `1`), username `Pilot Review`, status `active`, account type `student`.

**View `vw_acceptable_use_policy_network_account`**

```sql
CREATE VIEW vw_acceptable_use_policy_network_account AS
SELECT a.id, a.policy_id, a.version_number, a.effective_date, b.id AS account_id, b.account_identifier AS account_account_identifier, b.username AS account_username
FROM acceptable_use_policies a JOIN network_accounts b ON a.network_account_id = b.id;
```

| id | policy_id | version_number | effective_date | account_id | account_account_identifier | account_username |
|---|---|---|---|---|---|---|
| 1000 | 5844252 | VER-2245 | 2023-02-14 | 1 | ACC-2500 | Pilot Review |
| 1001 | 10207142 | VER-2249 | 2024-07-25 | 2 | ACC-2502 | Baseline Initiative |
| 1002 | 1562847 | VER-2253 | 2025-12-09 | 3 | ACC-2504 | Distributed Model A |
| 1003 | ChIJkzsYUIBt5kcRM6_JHx26ONk | VER-2257 | 2022-05-20 | 4 | ACC-2506 | Adaptive Cluster |

The view `vw_acceptable_use_policy_student` joins `acceptable_use_policies` to `students` on `acceptable_use_policies.student_id = students.student_id`, answering: *which student must comply with this policy?* Policy id `1000` (version `VER-2245`) applies to student `Theodore Mcgrath` (student_id `1`), grade level `29`, enrolled at `compact-school-62`, who is eligible for internet access.

**View `vw_acceptable_use_policy_student`**

```sql
CREATE VIEW vw_acceptable_use_policy_student AS
SELECT a.id, a.policy_id, a.version_number, a.effective_date, b.student_id AS student_student_id, b.full_name AS student_full_name, b.grade_level AS student_grade_level
FROM acceptable_use_policies a JOIN students b ON a.student_id = b.student_id;
```

| id | policy_id | version_number | effective_date | student_student_id | student_full_name | student_grade_level |
|---|---|---|---|---|---|---|
| 1000 | 5844252 | VER-2245 | 2023-02-14 | 1 | Theodore Mcgrath | 29 |
| 1001 | 10207142 | VER-2249 | 2024-07-25 | 2 | Account Name | 33 |
| 1002 | 1562847 | VER-2253 | 2025-12-09 | 3 | Saipan International Airport | 37 |
| 1003 | ChIJkzsYUIBt5kcRM6_JHx26ONk | VER-2257 | 2022-05-20 | 4 | Norma Fisher | 41 |

The view `vw_acceptable_use_policy_network_administrator` joins `acceptable_use_policies` to `network_administrators` on `acceptable_use_policies.network_administrator_admin_id = network_administrators.admin_id`, answering: *which administrator is bound by this policy?* Policy id `1000` (version `VER-2245`) binds administrator `Theodore Mcgrath` (admin_id `2986232`), role level `districtwide`, appointed `2022-05-03`, who is not authorised to revoke accounts.

**View `vw_acceptable_use_policy_network_administrator`**

```sql
CREATE VIEW vw_acceptable_use_policy_network_administrator AS
SELECT a.id, a.policy_id, a.version_number, a.effective_date, b.admin_id AS administrator_admin_id, b.full_name AS administrator_full_name, b.role_level AS administrator_role_level
FROM acceptable_use_policies a JOIN network_administrators b ON a.network_administrator_admin_id = b.admin_id;
```

| id | policy_id | version_number | effective_date | administrator_admin_id | administrator_full_name | administrator_role_level |
|---|---|---|---|---|---|---|
| 1000 | 5844252 | VER-2245 | 2023-02-14 | 2986232 | Theodore Mcgrath | districtwide |
| 1001 | 10207142 | VER-2249 | 2024-07-25 | 9222f51a-9bad-11eb-a8a2-19ed5c03f8d3 | Account Name | school |
| 1002 | 1562847 | VER-2253 | 2025-12-09 | 859ac854-9bad-11eb-a8a2-19ed5c03f8d3 | Saipan International Airport | districtwide |
| 1003 | ChIJkzsYUIBt5kcRM6_JHx26ONk | VER-2257 | 2022-05-20 | 57e4c59a-8fcd-11eb-924d-9cd76263cbd0 | Norma Fisher | school |

The view `vw_network_resource_network_account` joins `network_resources` to `network_accounts` on `network_resources.network_account_id = network_accounts.id`, answering: *which account provisions this resource?* Resource `Adaptive Corridor` (resource_id `1167`, type `electronic_library`) is provisioned under account `ACC-2500` (id `1`), username `Pilot Review`, status `active`.

**View `vw_network_resource_network_account`**

```sql
CREATE VIEW vw_network_resource_network_account AS
SELECT a.network_resource_id, a.resource_id, a.resource_name, a.resource_type, b.id AS account_id, b.account_identifier AS account_account_identifier, b.username AS account_username
FROM network_resources a JOIN network_accounts b ON a.network_account_id = b.id;
```

| network_resource_id | resource_id | resource_name | resource_type | account_id | account_account_identifier | account_username |
|---|---|---|---|---|---|---|
| 1 | 1167 | Adaptive Corridor | electronic_library | 1 | ACC-2500 | Pilot Review |
| 2 | 2106708 | Primary Series | research_database | 2 | ACC-2502 | Baseline Initiative |
| 3 | 4180945 | Composite Assessment D | collaborative_platform | 3 | ACC-2504 | Distributed Model A |
| 4 | 10238270 | Compact Survey | external_network | 4 | ACC-2506 | Adaptive Cluster |

The view `vw_network_resource_acceptable_use_policy` joins `network_resources` to `acceptable_use_policies` on `network_resources.acceptable_use_policy_id = acceptable_use_policies.id`, answering: *which policy governs this resource?* Resource `Adaptive Corridor` (resource_id `1167`) is governed by policy id `1000` (version `VER-2245`), which is legally binding, prohibits commercial use, and requires ethical behaviour.

**View `vw_network_resource_acceptable_use_policy`**

```sql
CREATE VIEW vw_network_resource_acceptable_use_policy AS
SELECT a.network_resource_id, a.resource_id, a.resource_name, a.resource_type, b.id AS policy_id, b.policy_id AS policy_policy_id, b.version_number AS policy_version_number
FROM network_resources a JOIN acceptable_use_policies b ON a.acceptable_use_policy_id = b.id;
```

| network_resource_id | resource_id | resource_name | resource_type | policy_id | policy_policy_id | policy_version_number |
|---|---|---|---|---|---|---|
| 1 | 1167 | Adaptive Corridor | electronic_library | 1000 | 5844252 | VER-2245 |
| 2 | 2106708 | Primary Series | research_database | 1001 | 10207142 | VER-2249 |
| 3 | 4180945 | Composite Assessment D | collaborative_platform | 1002 | 1562847 | VER-2253 |
| 4 | 10238270 | Compact Survey | external_network | 1003 | ChIJkzsYUIBt5kcRM6_JHx26ONk | VER-2257 |

The view `vw_security_incident_network_account` joins `security_incidents` to `network_accounts` on `security_incidents.network_account_id = network_accounts.id`, answering: *which account was affected by this incident?* Incident `1336174` (type `vandalism`, severity `29`, reported `2025-04-27T03:09:00`, unresolved, resulting in `warning`) affected account `ACC-2500` (id `1`), username `Pilot Review`, status `active`.

**View `vw_security_incident_network_account`**

```sql
CREATE VIEW vw_security_incident_network_account AS
SELECT a.incident_id, a.incident_type, a.severity_level, a.reported_date, b.id AS account_id, b.account_identifier AS account_account_identifier, b.username AS account_username
FROM security_incidents a JOIN network_accounts b ON a.network_account_id = b.id;
```

| incident_id | incident_type | severity_level | reported_date | account_id | account_account_identifier | account_username |
|---|---|---|---|---|---|---|
| 1336174 | vandalism | 29 | 2025-04-27T03:09:00 | 1 | ACC-2500 | Pilot Review |
| state_uk_4 | security_risk | 40 | 2022-09-11T10:26:00 | 2 | ACC-2502 | Baseline Initiative |
| 2933483 | unauthorized_access | 51 | 2023-02-22T17:43:00 | 3 | ACC-2504 | Distributed Model A |
| 2986243 | policy_violation | 62 | 2024-07-06T00:00:00 | 4 | ACC-2506 | Adaptive Cluster |

The view `vw_security_incident_network_administrator` joins `security_incidents` to `network_administrators` on `security_incidents.network_administrator_admin_id = network_administrators.admin_id`, answering: *which administrator oversees this incident?* Incident `1336174` (type `vandalism`, severity `29`) is overseen by administrator `Theodore Mcgrath` (admin_id `2986232`), role level `districtwide`, appointed `2022-05-03`.

**View `vw_security_incident_network_administrator`**

```sql
CREATE VIEW vw_security_incident_network_administrator AS
SELECT a.incident_id, a.incident_type, a.severity_level, a.reported_date, b.admin_id AS administrator_admin_id, b.full_name AS administrator_full_name, b.role_level AS administrator_role_level
FROM security_incidents a JOIN network_administrators b ON a.network_administrator_admin_id = b.admin_id;
```

| incident_id | incident_type | severity_level | reported_date | administrator_admin_id | administrator_full_name | administrator_role_level |
|---|---|---|---|---|---|---|
| 1336174 | vandalism | 29 | 2025-04-27T03:09:00 | 2986232 | Theodore Mcgrath | districtwide |
| state_uk_4 | security_risk | 40 | 2022-09-11T10:26:00 | 9222f51a-9bad-11eb-a8a2-19ed5c03f8d3 | Account Name | school |
| 2933483 | unauthorized_access | 51 | 2023-02-22T17:43:00 | 859ac854-9bad-11eb-a8a2-19ed5c03f8d3 | Saipan International Airport | districtwide |
| 2986243 | policy_violation | 62 | 2024-07-06T00:00:00 | 57e4c59a-8fcd-11eb-924d-9cd76263cbd0 | Norma Fisher | school |

The view `vw_security_incident_acceptable_use_policy` joins `security_incidents` to `acceptable_use_policies` on `security_incidents.acceptable_use_policy_id = acceptable_use_policies.id`, answering: *which policy is implicated by this incident?* Incident `1336174` (type `vandalism`, severity `29`, resulting in `warning`) is linked to policy id `1000` (version `VER-2245`), which is legally binding, prohibits commercial use, and requires ethical behaviour.

**View `vw_security_incident_acceptable_use_policy`**

```sql
CREATE VIEW vw_security_incident_acceptable_use_policy AS
SELECT a.incident_id, a.incident_type, a.severity_level, a.reported_date, b.id AS policy_id, b.policy_id AS policy_policy_id, b.version_number AS policy_version_number
FROM security_incidents a JOIN acceptable_use_policies b ON a.acceptable_use_policy_id = b.id;
```

| incident_id | incident_type | severity_level | reported_date | policy_id | policy_policy_id | policy_version_number |
|---|---|---|---|---|---|---|
| 1336174 | vandalism | 29 | 2025-04-27T03:09:00 | 1000 | 5844252 | VER-2245 |
| state_uk_4 | security_risk | 40 | 2022-09-11T10:26:00 | 1001 | 10207142 | VER-2249 |
| 2933483 | unauthorized_access | 51 | 2023-02-22T17:43:00 | 1002 | 1562847 | VER-2253 |
| 2986243 | policy_violation | 62 | 2024-07-06T00:00:00 | 1003 | ChIJkzsYUIBt5kcRM6_JHx26ONk | VER-2257 |

## Synthesis

The schema models network access governance as a network of six interrelated entities. The `network_accounts` table serves as the central hub, with foreign keys pointing to `students`, `network_administrators`, and `network_resources`. The `acceptable_use_policies` table sits at the periphery, connected to every actor type through its three foreign keys, ensuring that every student, administrator, and account is bound by a policy. The `security_incidents` table captures events by linking back to the account, the overseeing administrator, and the applicable policy.

Each view materialises a single join path through this graph, answering a concrete governance question by reconstructing a domain fact from the normalised tables. The views are symmetric: for every relationship, there is a view from each side. This design ensures that any actor can be traced to their account, their policy, their resource, and any incidents that have occurred—all through simple, indexed joins on well-defined foreign keys. The result is a schema that is both normalised and queryable, where the relational structure faithfully mirrors the domain's conceptual model.