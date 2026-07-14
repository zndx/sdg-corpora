## Domain Modelling and Relational Materialization

The domain under examination concerns the governance of digital communications within a district-level educational organization. At its core, the model tracks how people (district employees), organizational units (school entities), and digital artifacts (social media accounts, electronic communications, credential stores, and policy documents) interrelate. The schema is deliberately normalized: each entity type occupies its own table, and relationships are expressed through foreign keys that bind rows together. Views then reassemble these fragments into domain-relevant perspectives. The following sections walk through the base tables, their columns and cardinality-bounded relationships, and the materialized views that reconstruct domain facts from the normalized store.

### Base Tables and Entity Types

The foundation of the schema consists of six base tables, each representing a distinct entity type in the domain.

**Table `social_media_accounts`**

| id | account_identifier | platform | representing_entity | is_official | registration_date | status | district_employee_id | school_entity_id | secure_credential_store_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | ACC-2500 | Twitter | Sport | false | 2023-06-19T17:27:00 | Registered | 1000 | 100 | 1 |
| 2 | ACC-2502 | Blog | Club | true | 2024-11-03T00:44:00 | Unregistered | 1001 | 101 | 2 |
| 3 | ACC-2504 | Website | Group | false | 2025-04-14T07:01:00 | UnderReview | 1002 | 102 | 3 |
| 4 | ACC-2506 | Twitter | Program | true | 2022-09-25T14:18:00 | Registered | 1003 | 103 | 4 |

The `social_media_accounts` table captures every digital presence maintained by or on behalf of the district. Its primary key is `id`, a surrogate integer that serves as the universal row identifier. The column `account_identifier` holds human-readable codes such as `ACC-2500` and `ACC-2506`, while `platform` records the channel — `Twitter`, `Blog`, or `Website` — on which the account operates. The `representing_entity` column classifies the account's affiliation as `Sport`, `Club`, `Group`, or `Program`. Boolean flag `is_official` distinguishes official district accounts from unofficial ones, and `registration_date` timestamps the account's creation (e.g., `2023-06-19T17:27:00`). The `status` column tracks lifecycle state with values like `Registered`, `Unregistered`, and `UnderReview`. Three foreign keys — `district_employee_id`, `school_entity_id`, and `secure_credential_store_id` — bind each social media account to its owner or custodian, enabling the model to express that a single account may be associated with a person, an organizational unit, and a credential store simultaneously.

**Table `district_employees`**

| district_employee_id | employee_id | full_name | role | employment_status | contact_extension | social_media_account_id | electronic_communication_id |
|---|---|---|---|---|---|---|---|
| 1000 | Norma Fisher | Theodore Mcgrath | Teacher | Active | Michelle Kelley | 1 | 100 |
| 1001 | Tasha Rodriguez | Account Name | Staff | Inactive | Kimberly Myers | 2 | 101 |
| 1002 | Theodore Mcgrath | Saipan International Airport | PublicInformationOfficer | OnLeave | Alice Alvarez | 3 | 102 |
| 1003 | Peter Mcdowell | Norma Fisher | Teacher | Active | Norma Fisher | 4 | 103 |

The `district_employees` table models the human actors within the district. Its primary key is `district_employee_id`, an integer identifier (e.g., `1000`, `1001`). The column `employee_id` stores an internal personnel code such as `Norma Fisher` or `Tasha Rodriguez`, while `full_name` holds the employee's display name — `Theodore Mcgrath`, `Account Name`, and so on. The `role` column distinguishes functional positions like `Teacher`, `Staff`, and `PublicInformationOfficer`. Employment status is captured in `employment_status` with values `Active`, `Inactive`, and `OnLeave`. The `contact_extension` column provides a contact reference (e.g., `Michelle Kelley`, `Kimberly Myers`). Two foreign keys, `social_media_account_id` and `electronic_communication_id`, link each employee to their assigned social media account and electronic communication channel, respectively.

**Table `electronic_communications`**

| electronic_communication_id | communication_id | content_type | sent_date_time | is_public_record | platform_used | content_status | district_employee_id | school_entity_id |
|---|---|---|---|---|---|---|---|---|
| 100 | 209212 | Email | 2024-03-26T02:18:00 | true | primary-platform-88 | Draft | 1000 | 100 |
| 101 | 48753445 | TextMessage | 2025-08-10T09:35:00 | false | adaptive-platform-89 | Published | 1001 | 101 |
| 102 | lu_tax_code_template_m_I_4 | BlogPost | 2022-01-21T16:52:00 | true | distributed-platform-90 | Archived | 1002 | 102 |
| 103 | flexible-thinking | SocialMediaPost | 2023-06-05T23:09:00 | false | baseline-platform-91 | Draft | 1003 | 103 |

The `electronic_communications` table records every message or content artifact sent through the district's communication infrastructure. Its primary key is `electronic_communication_id` (e.g., `100`, `101`). The `communication_id` column holds a secondary identifier such as `209212` or the more descriptive `lu_tax_code_template_m_I_4`. The `content_type` column classifies the artifact as `Email`, `TextMessage`, `BlogPost`, or `SocialMediaPost`. The `sent_date_time` column timestamps delivery (e.g., `2024-03-26T02:18:00`). Boolean flag `is_public_record` indicates whether the communication is subject to public records law, while `platform_used` records the delivery channel such as `primary-platform-88` or `adaptive-platform-89`. The `content_status` column tracks the artifact's lifecycle state with values `Draft`, `Published`, and `Archived`. Foreign keys `district_employee_id` and `school_entity_id` bind each communication to its author and its associated organizational unit.

**Table `school_entities`**

| id | entity_id | entity_name | entity_type | parent_district | social_media_account_id | district_employee_id |
|---|---|---|---|---|---|---|
| 100 | 1996912 | Regional Cluster | School | extended-parent-87 | 1 | 1000 |
| 101 | 57e4a9d4-8fcd-11eb-924d-9cd76263cbd0 | Seasonal Review D | Program | integrated-parent-88 | 2 | 1001 |
| 102 | 9736894 | Integrated Initiative | Club | seasonal-parent-89 | 3 | 1002 |
| 103 | 974946 | Extended Model | Sport | regional-parent-90 | 4 | 1003 |

The `school_entities` table represents the organizational units within the district. Its primary key is `id`, an integer (e.g., `100`, `101`). The `entity_id` column stores a secondary identifier that may be numeric (`1996912`) or a UUID-like string (`57e4a9d4-8fcd-11eb-924d-9cd76263cbd0`). The `entity_name` column holds the unit's display name — `Regional Cluster`, `Seasonal Review D`, `Integrated Initiative`, `Extended Model` — while `entity_type` classifies it as `School`, `Program`, `Club`, or `Sport`. The `parent_district` column references the parent district (e.g., `extended-parent-87`, `integrated-parent-88`). Foreign keys `social_media_account_id` and `district_employee_id` link each entity to its social media presence and its responsible employee.

**Table `secure_credential_stores`**

| secure_credential_store_id | store_identifier | access_level | last_accessed | is_encrypted | social_media_account_id |
|---|---|---|---|---|---|
| 1 | STO-2552 | Restricted | 2024-11-03T10:54:00 | false | 1 |
| 2 | STO-2559 | PublicInformationOfficer | 2025-04-14T17:11:00 | true | 2 |
| 3 | STO-2566 | Restricted | 2022-09-25T00:28:00 | false | 3 |
| 4 | STO-2573 | PublicInformationOfficer | 2023-02-09T07:45:00 | true | 4 |

The `secure_credential_stores` table models the password and access management infrastructure. Its primary key is `secure_credential_store_id` (e.g., `1`, `2`). The `store_identifier` column holds human-readable codes such as `STO-2552` and `STO-2573`. The `access_level` column records the clearance tier — `Restricted` or `PublicInformationOfficer` — while `last_accessed` timestamps the most recent access (e.g., `2024-11-03T10:54:00`). Boolean flag `is_encrypted` indicates whether the store's contents are encrypted. The foreign key `social_media_account_id` binds each credential store to the social media account whose credentials it manages.

**Table `policy_documents`**

| id | policy_id | policy_number | title | effective_date | version | electronic_communication_id | social_media_account_id | created_at |
|---|---|---|---|---|---|---|---|---|
| 1 | 5844252 | POL-2302 | Compact Initiative | 2023-02-14 | seasonal-version-71 | 100 | 1 | 2025-01-01 00:14:00 |
| 2 | 10207142 | POL-2304 | Legacy Model | 2024-07-25 | regional-version-72 | 101 | 2 | 2025-02-06 03:14:00 |
| 3 | 1562847 | POL-2306 | Regional Cluster A | 2025-12-09 | legacy-version-73 | 102 | 3 | 2025-03-11 06:14:00 |
| 4 | ChIJkzsYUIBt5kcRM6_JHx26ONk | POL-2308 | Seasonal Review | 2022-05-20 | compact-version-74 | 103 | 4 | 2025-04-16 09:14:00 |

The `policy_documents` table captures the governance artifacts that regulate the domain. Its primary key is `id`, an integer (e.g., `1`, `2`). The `policy_id` column stores a secondary identifier that may be numeric (`5844252`) or a UUID-like string (`ChIJkzsYUIBt5kcRM6_JHx26ONk`). The `policy_number` column holds a human-readable policy code such as `POL-2302` and `POL-2308`. The `title` column names the policy — `Compact Initiative`, `Legacy Model`, `Regional Cluster A`, `Seasonal Review` — while `effective_date` records when the policy takes effect (e.g., `2023-02-14`). The `version` column tracks revisions with values like `seasonal-version-71` and `compact-version-74`. The `created_at` column timestamps document creation. Two foreign keys, `electronic_communication_id` and `social_media_account_id`, link each policy to the communication channel it governs and the social media account it references.

### Materialized Views and Domain Facts

The base tables are normalized to eliminate redundancy, but domain analysts and application code need to query relationships directly. The twelve views materialize these relationships as flat, denormalized result sets. Each view answers a specific question by joining two or more base tables.

**View `v_social_media_account_district_employee`**

```sql
CREATE VIEW v_social_media_account_district_employee AS
SELECT a.id, a.account_identifier, a.platform, a.representing_entity, b.district_employee_id AS employee_district_employee_id, b.employee_id AS employee_employee_id, b.full_name AS employee_full_name
FROM social_media_accounts a JOIN district_employees b ON a.district_employee_id = b.district_employee_id;
```

| id | account_identifier | platform | representing_entity | employee_district_employee_id | employee_employee_id | employee_full_name |
|---|---|---|---|---|---|---|
| 1 | ACC-2500 | Twitter | Sport | 1000 | Norma Fisher | Theodore Mcgrath |
| 2 | ACC-2502 | Blog | Club | 1001 | Tasha Rodriguez | Account Name |
| 3 | ACC-2504 | Website | Group | 1002 | Theodore Mcgrath | Saipan International Airport |
| 4 | ACC-2506 | Twitter | Program | 1003 | Peter Mcdowell | Norma Fisher |

This view reconstructs the relationship between a social media account and its assigned district employee. By joining `social_media_accounts` to `district_employees` on `social_media_accounts.district_employee_id = district_employees.district_employee_id`, the view answers the question: "Which employee is responsible for which social media account?" Row 1 of the result shows that account `ACC-2500` on `Twitter`, representing `Sport`, is managed by employee `1000` (display name `Theodore Mcgrath`, role `Teacher`, status `Active`). Row 4 shows that account `ACC-2506` on `Twitter`, representing `Program`, is managed by employee `1003` (display name `Norma Fisher`, role `Teacher`, status `Active`).

**View `v_social_media_account_school_entity`**

```sql
CREATE VIEW v_social_media_account_school_entity AS
SELECT a.id, a.account_identifier, a.platform, a.representing_entity, b.id AS entity_id, b.entity_id AS entity_entity_id, b.entity_name AS entity_entity_name
FROM social_media_accounts a JOIN school_entities b ON a.school_entity_id = b.id;
```

| id | account_identifier | platform | representing_entity | entity_id | entity_entity_id | entity_entity_name |
|---|---|---|---|---|---|---|
| 1 | ACC-2500 | Twitter | Sport | 100 | 1996912 | Regional Cluster |
| 2 | ACC-2502 | Blog | Club | 101 | 57e4a9d4-8fcd-11eb-924d-9cd76263cbd0 | Seasonal Review D |
| 3 | ACC-2504 | Website | Group | 102 | 9736894 | Integrated Initiative |
| 4 | ACC-2506 | Twitter | Program | 103 | 974946 | Extended Model |

This view joins `social_media_accounts` to `school_entities` on `social_media_accounts.school_entity_id = school_entities.id`, answering: "Which organizational unit does each social media account represent?" Row 1 reveals that account `ACC-2500` is associated with entity `100` (`Regional Cluster`, type `School`, parent `extended-parent-87`). Row 2 shows that account `ACC-2502` corresponds to entity `101` (`Seasonal Review D`, type `Program`, parent `integrated-parent-88`).

**View `v_social_media_account_secure_credential_store`**

```sql
CREATE VIEW v_social_media_account_secure_credential_store AS
SELECT a.id, a.account_identifier, a.platform, a.representing_entity, b.secure_credential_store_id AS store_secure_credential_store_id, b.store_identifier AS store_store_identifier, b.access_level AS store_access_level
FROM social_media_accounts a JOIN secure_credential_stores b ON a.secure_credential_store_id = b.secure_credential_store_id;
```

| id | account_identifier | platform | representing_entity | store_secure_credential_store_id | store_store_identifier | store_access_level |
|---|---|---|---|---|---|---|
| 1 | ACC-2500 | Twitter | Sport | 1 | STO-2552 | Restricted |
| 2 | ACC-2502 | Blog | Club | 2 | STO-2559 | PublicInformationOfficer |
| 3 | ACC-2504 | Website | Group | 3 | STO-2566 | Restricted |
| 4 | ACC-2506 | Twitter | Program | 4 | STO-2573 | PublicInformationOfficer |

This view joins `social_media_accounts` to `secure_credential_stores` on `social_media_accounts.secure_credential_store_id = secure_credential_stores.secure_credential_store_id`, answering: "Which credential store secures each social media account?" Row 1 shows that account `ACC-2500` is secured by store `STO-2552` with access level `Restricted` and encryption disabled (`is_encrypted = false`). Row 2 shows that account `ACC-2502` is secured by store `STO-2559` with access level `PublicInformationOfficer` and encryption enabled (`is_encrypted = true`).

**View `v_district_employee_social_media_account`**

```sql
CREATE VIEW v_district_employee_social_media_account AS
SELECT a.district_employee_id, a.employee_id, a.full_name, a.role, b.id AS account_id, b.account_identifier AS account_account_identifier, b.platform AS account_platform
FROM district_employees a JOIN social_media_accounts b ON a.social_media_account_id = b.id;
```

| district_employee_id | employee_id | full_name | role | account_id | account_account_identifier | account_platform |
|---|---|---|---|---|---|---|
| 1000 | Norma Fisher | Theodore Mcgrath | Teacher | 1 | ACC-2500 | Twitter |
| 1001 | Tasha Rodriguez | Account Name | Staff | 2 | ACC-2502 | Blog |
| 1002 | Theodore Mcgrath | Saipan International Airport | PublicInformationOfficer | 3 | ACC-2504 | Website |
| 1003 | Peter Mcdowell | Norma Fisher | Teacher | 4 | ACC-2506 | Twitter |

This view performs the inverse join of `v_social_media_account_district_employee`: it starts from `district_employees` and joins to `social_media_accounts` on `district_employees.social_media_account_id = social_media_accounts.id`. It answers: "Which social media account is assigned to each employee?" Row 1 shows that employee `1000` (display name `Theodore Mcgrath`, role `Teacher`, status `Active`) is assigned account `ACC-2500` on `Twitter`. Row 3 shows that employee `1002` (display name `Saipan International Airport`, role `PublicInformationOfficer`, status `OnLeave`) is assigned account `ACC-2504` on `Website`.

**View `v_district_employee_electronic_communication`**

```sql
CREATE VIEW v_district_employee_electronic_communication AS
SELECT a.district_employee_id, a.employee_id, a.full_name, a.role, b.electronic_communication_id AS communication_electronic_communication_id, b.communication_id AS communication_communication_id, b.content_type AS communication_content_type
FROM district_employees a JOIN electronic_communications b ON a.electronic_communication_id = b.electronic_communication_id;
```

| district_employee_id | employee_id | full_name | role | communication_electronic_communication_id | communication_communication_id | communication_content_type |
|---|---|---|---|---|---|---|
| 1000 | Norma Fisher | Theodore Mcgrath | Teacher | 100 | 209212 | Email |
| 1001 | Tasha Rodriguez | Account Name | Staff | 101 | 48753445 | TextMessage |
| 1002 | Theodore Mcgrath | Saipan International Airport | PublicInformationOfficer | 102 | lu_tax_code_template_m_I_4 | BlogPost |
| 1003 | Peter Mcdowell | Norma Fisher | Teacher | 103 | flexible-thinking | SocialMediaPost |

This view joins `district_employees` to `electronic_communications` on `district_employees.electronic_communication_id = electronic_communications.electronic_communication_id`, answering: "Which electronic communication channel is assigned to each employee?" Row 1 shows that employee `1000` is linked to communication `100` (content type `Email`, sent `2024-03-26T02:18:00`, status `Draft`, platform `primary-platform-88`). Row 2 shows that employee `1001` is linked to communication `101` (content type `TextMessage`, sent `2025-08-10T09:35:00`, status `Published`, platform `adaptive-platform-89`).

**View `v_electronic_communication_district_employee`**

```sql
CREATE VIEW v_electronic_communication_district_employee AS
SELECT a.electronic_communication_id, a.communication_id, a.content_type, a.sent_date_time, b.district_employee_id AS employee_district_employee_id, b.employee_id AS employee_employee_id, b.full_name AS employee_full_name
FROM electronic_communications a JOIN district_employees b ON a.district_employee_id = b.district_employee_id;
```

| electronic_communication_id | communication_id | content_type | sent_date_time | employee_district_employee_id | employee_employee_id | employee_full_name |
|---|---|---|---|---|---|---|
| 100 | 209212 | Email | 2024-03-26T02:18:00 | 1000 | Norma Fisher | Theodore Mcgrath |
| 101 | 48753445 | TextMessage | 2025-08-10T09:35:00 | 1001 | Tasha Rodriguez | Account Name |
| 102 | lu_tax_code_template_m_I_4 | BlogPost | 2022-01-21T16:52:00 | 1002 | Theodore Mcgrath | Saipan International Airport |
| 103 | flexible-thinking | SocialMediaPost | 2023-06-05T23:09:00 | 1003 | Peter Mcdowell | Norma Fisher |

This view performs the inverse join of `v_district_employee_electronic_communication`: it starts from `electronic_communications` and joins to `district_employees` on `electronic_communications.district_employee_id = district_employees.district_employee_id`. It answers: "Which employee authored or owns each electronic communication?" Row 1 shows that communication `100` (content type `Email`, identifier `209212`, status `Draft`) was authored by employee `1000` (display name `Theodore Mcgrath`, role `Teacher`). Row 3 shows that communication `102` (content type `BlogPost`, identifier `lu_tax_code_template_m_I_4`, status `Archived`) was authored by employee `1002` (display name `Saipan International Airport`, role `PublicInformationOfficer`).

**View `v_electronic_communication_school_entity`**

```sql
CREATE VIEW v_electronic_communication_school_entity AS
SELECT a.electronic_communication_id, a.communication_id, a.content_type, a.sent_date_time, b.id AS entity_id, b.entity_id AS entity_entity_id, b.entity_name AS entity_entity_name
FROM electronic_communications a JOIN school_entities b ON a.school_entity_id = b.id;
```

| electronic_communication_id | communication_id | content_type | sent_date_time | entity_id | entity_entity_id | entity_entity_name |
|---|---|---|---|---|---|---|
| 100 | 209212 | Email | 2024-03-26T02:18:00 | 100 | 1996912 | Regional Cluster |
| 101 | 48753445 | TextMessage | 2025-08-10T09:35:00 | 101 | 57e4a9d4-8fcd-11eb-924d-9cd76263cbd0 | Seasonal Review D |
| 102 | lu_tax_code_template_m_I_4 | BlogPost | 2022-01-21T16:52:00 | 102 | 9736894 | Integrated Initiative |
| 103 | flexible-thinking | SocialMediaPost | 2023-06-05T23:09:00 | 103 | 974946 | Extended Model |

This view joins `electronic_communications` to `school_entities` on `electronic_communications.school_entity_id = school_entities.id`, answering: "Which organizational unit is associated with each electronic communication?" Row 1 shows that communication `100` (content type `Email`, sent `2024-03-26T02:18:00`) is associated with entity `100` (`Regional Cluster`, type `School`). Row 4 shows that communication `103` (content type `SocialMediaPost`, identifier `flexible-thinking`, status `Draft`) is associated with entity `103` (`Extended Model`, type `Sport`).

**View `v_school_entity_social_media_account`**

```sql
CREATE VIEW v_school_entity_social_media_account AS
SELECT a.id, a.entity_id, a.entity_name, a.entity_type, b.id AS account_id, b.account_identifier AS account_account_identifier, b.platform AS account_platform
FROM school_entities a JOIN social_media_accounts b ON a.social_media_account_id = b.id;
```

| id | entity_id | entity_name | entity_type | account_id | account_account_identifier | account_platform |
|---|---|---|---|---|---|---|
| 100 | 1996912 | Regional Cluster | School | 1 | ACC-2500 | Twitter |
| 101 | 57e4a9d4-8fcd-11eb-924d-9cd76263cbd0 | Seasonal Review D | Program | 2 | ACC-2502 | Blog |
| 102 | 9736894 | Integrated Initiative | Club | 3 | ACC-2504 | Website |
| 103 | 974946 | Extended Model | Sport | 4 | ACC-2506 | Twitter |

This view joins `school_entities` to `social_media_accounts` on `school_entities.social_media_account_id = social_media_accounts.id`, answering: "Which social media account does each organizational unit maintain?" Row 1 shows that entity `100` (`Regional Cluster`, type `School`) maintains account `ACC-2500` on `Twitter`, representing `Sport`, with status `Registered`. Row 3 shows that entity `102` (`Integrated Initiative`, type `Club`) maintains account `ACC-2504` on `Website`, representing `Group`, with status `UnderReview`.

**View `v_school_entity_district_employee`**

```sql
CREATE VIEW v_school_entity_district_employee AS
SELECT a.id, a.entity_id, a.entity_name, a.entity_type, b.district_employee_id AS employee_district_employee_id, b.employee_id AS employee_employee_id, b.full_name AS employee_full_name
FROM school_entities a JOIN district_employees b ON a.district_employee_id = b.district_employee_id;
```

| id | entity_id | entity_name | entity_type | employee_district_employee_id | employee_employee_id | employee_full_name |
|---|---|---|---|---|---|---|
| 100 | 1996912 | Regional Cluster | School | 1000 | Norma Fisher | Theodore Mcgrath |
| 101 | 57e4a9d4-8fcd-11eb-924d-9cd76263cbd0 | Seasonal Review D | Program | 1001 | Tasha Rodriguez | Account Name |
| 102 | 9736894 | Integrated Initiative | Club | 1002 | Theodore Mcgrath | Saipan International Airport |
| 103 | 974946 | Extended Model | Sport | 1003 | Peter Mcdowell | Norma Fisher |

This view joins `school_entities` to `district_employees` on `school_entities.district_employee_id = district_employees.district_employee_id`, answering: "Which employee is responsible for each organizational unit?" Row 1 shows that entity `100` (`Regional Cluster`, type `School`) is managed by employee `1000` (display name `Theodore Mcgrath`, role `Teacher`, status `Active`). Row 4 shows that entity `103` (`Extended Model`, type `Sport`) is managed by employee `1003` (display name `Norma Fisher`, role `Teacher`, status `Active`).

**View `v_secure_credential_store_social_media_account`**

```sql
CREATE VIEW v_secure_credential_store_social_media_account AS
SELECT a.secure_credential_store_id, a.store_identifier, a.access_level, a.last_accessed, b.id AS account_id, b.account_identifier AS account_account_identifier, b.platform AS account_platform
FROM secure_credential_stores a JOIN social_media_accounts b ON a.social_media_account_id = b.id;
```

| secure_credential_store_id | store_identifier | access_level | last_accessed | account_id | account_account_identifier | account_platform |
|---|---|---|---|---|---|---|
| 1 | STO-2552 | Restricted | 2024-11-03T10:54:00 | 1 | ACC-2500 | Twitter |
| 2 | STO-2559 | PublicInformationOfficer | 2025-04-14T17:11:00 | 2 | ACC-2502 | Blog |
| 3 | STO-2566 | Restricted | 2022-09-25T00:28:00 | 3 | ACC-2504 | Website |
| 4 | STO-2573 | PublicInformationOfficer | 2023-02-09T07:45:00 | 4 | ACC-2506 | Twitter |

This view performs the inverse join of `v_social_media_account_secure_credential_store`: it starts from `secure_credential_stores` and joins to `social_media_accounts` on `secure_credential_stores.social_media_account_id = social_media_accounts.id`. It answers: "Which social media account does each credential store secure?" Row 1 shows that store `STO-2552` (access level `Restricted`, last accessed `2024-11-03T10:54:00`, unencrypted) secures account `ACC-2500` on `Twitter`. Row 2 shows that store `STO-2559` (access level `PublicInformationOfficer`, last accessed `2025-04-14T17:11:00`, encrypted) secures account `ACC-2502` on `Blog`.

**View `v_policy_document_electronic_communication`**

```sql
CREATE VIEW v_policy_document_electronic_communication AS
SELECT a.id, a.policy_id, a.policy_number, a.title, b.electronic_communication_id AS communication_electronic_communication_id, b.communication_id AS communication_communication_id, b.content_type AS communication_content_type
FROM policy_documents a JOIN electronic_communications b ON a.electronic_communication_id = b.electronic_communication_id;
```

| id | policy_id | policy_number | title | communication_electronic_communication_id | communication_communication_id | communication_content_type |
|---|---|---|---|---|---|---|
| 1 | 5844252 | POL-2302 | Compact Initiative | 100 | 209212 | Email |
| 2 | 10207142 | POL-2304 | Legacy Model | 101 | 48753445 | TextMessage |
| 3 | 1562847 | POL-2306 | Regional Cluster A | 102 | lu_tax_code_template_m_I_4 | BlogPost |
| 4 | ChIJkzsYUIBt5kcRM6_JHx26ONk | POL-2308 | Seasonal Review | 103 | flexible-thinking | SocialMediaPost |

This view joins `policy_documents` to `electronic_communications` on `policy_documents.electronic_communication_id = electronic_communications.electronic_communication_id`, answering: "Which electronic communication channel does each policy document regulate?" Row 1 shows that policy `POL-2302` (`Compact Initiative`, effective `2023-02-14`, version `seasonal-version-71`) governs communication `100` (content type `Email`, platform `primary-platform-88`, status `Draft`). Row 3 shows that policy `POL-2306` (`Regional Cluster A`, effective `2025-12-09`, version `legacy-version-73`) governs communication `102` (content type `BlogPost`, platform `distributed-platform-90`, status `Archived`).

**View `v_policy_document_social_media_account`**

```sql
CREATE VIEW v_policy_document_social_media_account AS
SELECT a.id, a.policy_id, a.policy_number, a.title, b.id AS account_id, b.account_identifier AS account_account_identifier, b.platform AS account_platform
FROM policy_documents a JOIN social_media_accounts b ON a.social_media_account_id = b.id;
```

| id | policy_id | policy_number | title | account_id | account_account_identifier | account_platform |
|---|---|---|---|---|---|---|
| 1 | 5844252 | POL-2302 | Compact Initiative | 1 | ACC-2500 | Twitter |
| 2 | 10207142 | POL-2304 | Legacy Model | 2 | ACC-2502 | Blog |
| 3 | 1562847 | POL-2306 | Regional Cluster A | 3 | ACC-2504 | Website |
| 4 | ChIJkzsYUIBt5kcRM6_JHx26ONk | POL-2308 | Seasonal Review | 4 | ACC-2506 | Twitter |

This view joins `policy_documents` to `social_media_accounts` on `policy_documents.social_media_account_id = social_media_accounts.id`, answering: "Which social media account does each policy document reference?" Row 1 shows that policy `POL-2302` (`Compact Initiative`, version `seasonal-version-71`) references account `ACC-2500` on `Twitter`, representing `Sport`, with status `Registered`. Row 4 shows that policy `POL-2308` (`Seasonal Review`, version `compact-version-74`) references account `ACC-2506` on `Twitter`, representing `Program`, with status `Registered`.

### Synthesis

The schema models a district's digital communication ecosystem as a set of six normalized base tables, each capturing a distinct entity type with its own attributes and lifecycle state. Foreign keys express cardinality-bounded relationships: a social media account is owned by at most one district employee, one school entity, and one credential store; an electronic communication is authored by at most one district employee and associated with at most one school entity; a policy document references at most one electronic communication and one social media account. The twelve views materialize these relationships as flat, queryable result sets, each answering a specific domain question by joining two base tables along their shared foreign key. Together, the base tables and views provide a complete, denormalized view of the domain's facts — from which employee manages which account, to which policy governs which communication channel — while preserving the normalized structure that prevents update anomalies at the storage layer.