## Network Access Governance in Educational Environments

Educational institutions maintain complex digital ecosystems where students, staff, and administrators interact with shared network resources under defined policy frameworks. The records in this system track the full lifecycle of network access: from account creation through active use, policy acknowledgment, resource allocation, and incident response. Each account serves as a central pivot, linking a person—whether a student, a network administrator, or staff—to the policies they accept, the resources they consume, and the security events that may trigger remediation. Understanding how these records interlock is essential for anyone responsible for network governance, compliance auditing, or access management.

**Table `network_accounts`**

| id | account_identifier | username | password_hash | status | creation_date | last_login_timestamp | account_type | student_id | network_administrator_admin_id | network_resource_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | ACC-2500 | Pilot Review | integrated-password-76 | active | 2022-01-13T12:24:00 | 2024-11-16T10:42:00 | student | 1 | 2986232 | 1 |
| 2 | ACC-2502 | Baseline Initiative | seasonal-password-77 | suspended | 2023-06-24T19:41:00 | 2025-04-27T17:59:00 | staff | 2 | 9222f51a-9bad-11eb-a8a2-19ed5c03f8d3 | 2 |
| 3 | ACC-2504 | Distributed Model A | regional-password-78 | revoked | 2024-11-08T02:58:00 | 2022-09-11T00:16:00 | administrator | 3 | 859ac854-9bad-11eb-a8a2-19ed5c03f8d3 | 3 |
| 4 | ACC-2506 | Adaptive Cluster | legacy-password-79 | pending | 2025-04-19T09:15:00 | 2023-02-22T07:33:00 | student | 4 | 57e4c59a-8fcd-11eb-924d-9cd76263cbd0 | 4 |

Network accounts form the operational backbone of the system. Every account carries a unique identifier such as `ACC-2500` or `ACC-2504`, a human-readable username like `Pilot Review` or `Adaptive Cluster`, and a hashed password for authentication. The `status` field tracks the account's current state: `active`, `suspended`, `revoked`, or `pending`. Account type distinguishes between `student`, `staff`, and `administrator` roles, each with different privilege expectations. The `creation_date` and `last_login_timestamp` fields provide a temporal profile of each account's lifecycle. For instance, account `ACC-2500` was created on 2022-01-13 and last accessed on 2024-11-16, indicating sustained use over nearly three years. Each account references a student, a network administrator, and a network resource, establishing the foundational relationships that the system's views later make explicit.

**Table `students`**

| student_id | full_name | grade_level | school_enrollment | is_eligible_for_internet | parent_guardian_contact | network_account_id | acceptable_use_policy_id |
|---|---|---|---|---|---|---|---|
| 1 | Theodore Mcgrath | 29 | compact-school-62 | true | Bobby Flores | 1 | 1000 |
| 2 | Account Name | 33 | composite-school-63 | false | Norma Fisher | 2 | 1001 |
| 3 | Saipan International Airport | 37 | primary-school-64 | true | Aaron James | 3 | 1002 |
| 4 | Norma Fisher | 41 | adaptive-school-65 | false | Peter Mcdowell | 4 | 1003 |

Students are the primary consumers of network resources within the educational context. Each student record includes a full name, grade level, and the school they are enrolled in—`compact-school-62`, `composite-school-63`, `primary-school-64`, and `adaptive-school-65` in the current dataset. The `is_eligible_for_internet` flag determines whether a student has been granted network access at all; students with `true` values (such as Theodore Mcgrath at grade level 29) are eligible, while those with `false` (such as Account Name at grade level 33) are not. The parent or guardian contact field provides an external point of accountability. Each student record points to their assigned network account and the acceptable use policy they must acknowledge, creating a direct chain from person to policy to access.

**Table `network_administrators`**

| admin_id | full_name | role_level | appointment_date | is_authorized_to_revoke | network_account_id | acceptable_use_policy_id |
|---|---|---|---|---|---|---|
| 2986232 | Theodore Mcgrath | districtwide | 2022-05-03 | false | 1 | 1000 |
| 9222f51a-9bad-11eb-a8a2-19ed5c03f8d3 | Account Name | school | 2023-10-14 | true | 2 | 1001 |
| 859ac854-9bad-11eb-a8a2-19ed5c03f8d3 | Saipan International Airport | districtwide | 2024-03-25 | false | 3 | 1002 |
| 57e4c59a-8fcd-11eb-924d-9cd76263cbd0 | Norma Fisher | school | 2025-08-09 | true | 4 | 1003 |

Network administrators hold the authority to manage, monitor, and, when necessary, revoke network access. Their records include a full name, a role level of either `districtwide` or `school`, and an appointment date that marks when their authority began. The `is_authorized_to_revoke` flag is a critical governance control: administrators with `true` values, such as the school-level administrator `Account Name` (admin ID `9222f51a-9bad-11eb-a8a2-19ed5c03f8d3`), can initiate account revocations, while those with `false`, such as districtwide administrator `Theodore Mcgrath` (admin ID `2986232`), cannot. This distinction ensures that revocation power is distributed according to organizational hierarchy. Each administrator is linked to a network account and an acceptable use policy, mirroring the structure found in student records.

**Table `acceptable_use_policies`**

| id | policy_id | version_number | effective_date | is_legally_binding | prohibits_commercial_use | requires_ethical_behavior | network_account_id | student_id | network_administrator_admin_id |
|---|---|---|---|---|---|---|---|---|---|
| 1000 | 5844252 | VER-2245 | 2023-02-14 | true | true | true | 1 | 1 | 2986232 |
| 1001 | 10207142 | VER-2249 | 2024-07-25 | false | false | false | 2 | 2 | 9222f51a-9bad-11eb-a8a2-19ed5c03f8d3 |
| 1002 | 1562847 | VER-2253 | 2025-12-09 | true | true | true | 3 | 3 | 859ac854-9bad-11eb-a8a2-19ed5c03f8d3 |
| 1003 | ChIJkzsYUIBt5kcRM6_JHx26ONk | VER-2257 | 2022-05-20 | false | false | false | 4 | 4 | 57e4c59a-8fcd-11eb-924d-9cd76263cbd0 |

Acceptable use policies define the rules of engagement for network access. Each policy carries a unique policy ID—`5844252`, `10207142`, `1562847`, and a UUID-style identifier `ChIJkzsYUIBt5kcRM6_JHx26ONk`—along with a version number such as `VER-2245` or `VER-2257`. The `effective_date` marks when the policy became operative, ranging from 2022-05-20 to 2025-12-09 in the current data. Boolean flags indicate whether the policy is legally binding, prohibits commercial use, and requires ethical behavior. Policies `1000` and `1002` are fully restrictive: they are legally binding, prohibit commercial use, and require ethical behavior. Policies `1001` and `1003` are permissive across all three dimensions. Each policy is associated with a network account, a student, and a network administrator, ensuring that every actor is covered by a defined set of rules.

**Table `network_resources`**

| network_resource_id | resource_id | resource_name | resource_type | is_fee_based | requires_prior_approval | access_level | network_account_id | acceptable_use_policy_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 1167 | Adaptive Corridor | electronic_library | false | false | public | 1 | 1000 |
| 2 | 2106708 | Primary Series | research_database | true | true | restricted | 2 | 1001 |
| 3 | 4180945 | Composite Assessment D | collaborative_platform | false | false | internal | 3 | 1002 |
| 4 | 10238270 | Compact Survey | external_network | true | true | public | 4 | 1003 |

Network resources represent the digital assets available to account holders. Resources are categorized by type: `electronic_library`, `research_database`, `collaborative_platform`, and `external_network`. Access levels range from `public` to `internal` to `restricted`, with `Primary Series` (resource ID `2106708`) classified as restricted and `Adaptive Corridor` (resource ID `1167`) as public. Fee-based resources, such as `Primary Series` and `Compact Survey`, require payment or billing arrangements, while non-fee resources like `Adaptive Corridor` and `Composite Assessment D` are freely available. Prior approval is required for `research_database` and `external_network` resources, adding a governance layer before access is granted. Each resource is linked to a network account and an acceptable use policy, ensuring that resource consumption is always governed by policy.

**Table `security_incidents`**

| incident_id | incident_type | severity_level | reported_date | is_resolved | resulting_action | network_account_id | network_administrator_admin_id | acceptable_use_policy_id |
|---|---|---|---|---|---|---|---|---|
| 1336174 | vandalism | 29 | 2025-04-27T03:09:00 | false | warning | 1 | 2986232 | 1000 |
| state_uk_4 | security_risk | 40 | 2022-09-11T10:26:00 | true | suspension | 2 | 9222f51a-9bad-11eb-a8a2-19ed5c03f8d3 | 1001 |
| 2933483 | unauthorized_access | 51 | 2023-02-22T17:43:00 | false | revocation | 3 | 859ac854-9bad-11eb-a8a2-19ed5c03f8d3 | 1002 |
| 2986243 | policy_violation | 62 | 2024-07-06T00:00:00 | true | no_action | 4 | 57e4c59a-8fcd-11eb-924d-9cd76263cbd0 | 1003 |

Security incidents capture events that compromise or challenge the integrity of network access. Incident types include `vandalism`, `security_risk`, `unauthorized_access`, and `policy_violation`, each with a severity level ranging from 29 to 62 in the current dataset. The `reported_date` records when the incident was logged, and `is_resolved` indicates whether remediation is complete. Resulting actions range from `warning` and `no_action` to `suspension` and `revocation`, reflecting the severity of the event. Incident `1336174`, a vandalism event with severity 29, resulted in a warning and remains unresolved. Incident `2933483`, an unauthorized access event with severity 51, led to revocation and is also unresolved. Each incident is tied to a network account, a network administrator responsible for handling it, and an acceptable use policy that defines the violated rules.

## Cross-Referential Views

The system's views synthesize the base tables into readable relationships that answer specific operational questions. Each view joins a primary entity with related records, producing a consolidated record that can be queried for auditing, reporting, or investigation.

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

This view answers the question: which students are associated with each network account? It joins `network_accounts` with `students` on the account and student identifiers. Row 1 shows account `ACC-2500` linked to student Theodore Mcgrath at grade level 29, enrolled at compact-school-62, who is eligible for internet access. Row 3 shows account `ACC-2504` linked to Saipan International Airport at grade level 37, enrolled at primary-school-64, also eligible for internet access. This view is essential for verifying that every active student account has a corresponding student record and that eligibility flags are consistent.

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

This view maps each network account to its responsible administrator. Row 1 pairs account `ACC-2500` with administrator Theodore Mcgrath (admin ID `2986232`), who holds a districtwide role but is not authorized to revoke accounts. Row 2 pairs account `ACC-2502` with administrator Account Name (admin ID `9222f51a-9bad-11eb-a8a2-19ed5c03f8d3`), a school-level administrator who is authorized to revoke. This view is critical for accountability: it identifies who has the authority to act on each account and who does not.

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

This view links each network account to the resources it can access. Row 1 shows account `ACC-2500` accessing `Adaptive Corridor`, an electronic library that is public and non-fee-based. Row 2 shows account `ACC-2502` accessing `Primary Series`, a research database that is restricted, fee-based, and requires prior approval. This view enables resource auditing: administrators can verify that accounts only access resources appropriate to their role and that fee-based resources are properly billed.

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

This view inverts the perspective, starting from the student and showing their assigned account. Row 1 shows Theodore Mcgrath with account `ACC-2500` (username `Pilot Review`, status `active`, type `student`). Row 4 shows Norma Fisher with account `ACC-2506` (username `Adaptive Cluster`, status `pending`, type `student`). This view is useful for onboarding checks: it confirms that every student has an account and that the account status reflects their current access state.

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

This view connects students to the policies they must follow. Row 1 shows Theodore Mcgrath bound by policy `1000` (policy ID `5844252`, version `VER-2245`, effective 2023-02-14), which is legally binding, prohibits commercial use, and requires ethical behavior. Row 2 shows Account Name bound by policy `1001` (policy ID `10207142`, version `VER-2249`, effective 2024-07-25), which is permissive across all dimensions. This view is essential for compliance audits: it ensures every student is covered by a policy and that the policy's restrictions match institutional requirements.

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

This view maps administrators to the accounts they manage. Row 1 shows administrator Theodore Mcgrath (districtwide, not authorized to revoke) managing account `ACC-2500`. Row 3 shows administrator Saipan International Airport (districtwide, not authorized to revoke) managing account `ACC-2504`. This view supports workload analysis: it shows how many accounts each administrator manages and whether the distribution aligns with their authorization level.

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

This view links administrators to the policies they are bound by. Row 1 shows administrator Theodore Mcgrath bound by policy `1000`, which is fully restrictive. Row 4 shows administrator Norma Fisher bound by policy `1003`, which is fully permissive. This view ensures that administrators themselves are subject to policy constraints, preventing a governance gap where those with authority operate outside the rules.

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

This view inverts the policy perspective, showing which accounts are governed by each policy. Row 1 shows policy `1000` governing account `ACC-2500`, a student account of type `student` with status `active`. Row 3 shows policy `1002` governing account `ACC-2504`, an administrator account with status `revoked`. This view is useful for policy impact analysis: it shows how many accounts each policy covers and whether revoked or suspended accounts are still associated with active policies.

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

This view connects policies to the students they govern. Row 1 shows policy `1000` governing student Theodore Mcgrath, who is eligible for internet access and enrolled at compact-school-62. Row 4 shows policy `1003` governing student Norma Fisher, who is not eligible for internet access and enrolled at adaptive-school-65. This view supports policy compliance reporting: it identifies which students are covered by restrictive versus permissive policies and cross-references eligibility status.

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

This view links policies to the administrators they govern. Row 1 shows policy `1000` governing administrator Theodore Mcgrath, a districtwide administrator not authorized to revoke. Row 2 shows policy `1001` governing administrator Account Name, a school-level administrator authorized to revoke. This view ensures that policy coverage extends to all roles and that authorization levels are documented alongside policy constraints.

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

This view maps resources to the accounts that access them. Row 1 shows resource `Adaptive Corridor` (electronic library, public, non-fee-based) accessed by account `ACC-2500`. Row 2 shows resource `Primary Series` (research database, restricted, fee-based, requires approval) accessed by account `ACC-2502`. This view supports resource utilization analysis: it identifies which accounts consume which resources and whether access levels match the account's role.

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

This view connects resources to the policies that govern their use. Row 1 shows resource `Adaptive Corridor` governed by policy `1000`, a fully restrictive policy. Row 4 shows resource `Compact Survey` (external network, public, fee-based, requires approval) governed by policy `1003`, a fully permissive policy. This view is essential for risk assessment: it reveals whether high-risk resources (restricted, fee-based, requiring approval) are governed by restrictive policies or if there is a mismatch.

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

This view links security incidents to the accounts they affect. Row 1 shows incident `1336174` (vandalism, severity 29, unresolved, resulting in warning) affecting account `ACC-2500`. Row 3 shows incident `2933483` (unauthorized access, severity 51, unresolved, resulting in revocation) affecting account `ACC-2504`. This view is critical for incident response: it identifies which accounts have been compromised or misused and whether the resulting actions have been implemented.

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

This view connects incidents to the administrators responsible for handling them. Row 1 shows incident `1336174` handled by administrator Theodore Mcgrath (districtwide, not authorized to revoke). Row 4 shows incident `2986243` (policy_violation, severity 62, resolved, no_action) handled by administrator Norma Fisher (school, authorized to revoke). This view supports accountability tracking: it shows which administrators are managing incidents and whether the severity of the incident matches the administrator's authorization level.

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

This view links incidents to the policies that were violated. Row 1 shows incident `1336174` (vandalism) violating policy `1000`, a fully restrictive policy. Row 4 shows incident `2986243` (policy_violation) violating policy `1003`, a fully permissive policy. This view is essential for policy refinement: it reveals which policies are most frequently violated and whether the severity of incidents correlates with the restrictiveness of the governing policy.

## Synthesis

The records in this system form a tightly interwoven governance fabric. Network accounts serve as the central pivot, each linking a person to a policy, a resource, and potentially a security incident. Students and administrators occupy parallel roles: both have accounts, both are bound by policies, and both can be the subject of security incidents. The acceptable use policies provide the rule set, ranging from fully restrictive to fully permissive, and every account, student, administrator, resource, and incident is anchored to one. The views synthesize these relationships into actionable formats, enabling administrators to audit access, investigate incidents, and verify compliance. In practice, this structure supports a complete lifecycle: an account is created, a student or administrator is assigned, a policy is acknowledged, a resource is allocated, and any incident is logged and resolved. The integrity of the entire system depends on the consistency of these links, making regular cross-referential audits a necessary operational discipline.