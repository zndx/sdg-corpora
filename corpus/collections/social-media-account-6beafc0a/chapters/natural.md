## Domain Overview: Digital Operations in Educational Districts

Educational districts manage a complex ecosystem of digital presences, personnel records, and regulatory frameworks. Every social media account, employee profile, electronic communication, school entity, credential store, and policy document forms part of an interconnected operational fabric. Practitioners must track which employee controls which account, which school entity an account represents, how credentials are secured, and how policy documents reference both communications and social media channels. This chapter describes the data structures that capture these relationships and the analytical views that join them into actionable records.

**Table `social_media_accounts`**

| id | account_identifier | platform | representing_entity | is_official | registration_date | status | district_employee_id | school_entity_id | secure_credential_store_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | ACC-2500 | Twitter | Sport | false | 2023-06-19T17:27:00 | Registered | 1000 | 100 | 1 |
| 2 | ACC-2502 | Blog | Club | true | 2024-11-03T00:44:00 | Unregistered | 1001 | 101 | 2 |
| 3 | ACC-2504 | Website | Group | false | 2025-04-14T07:01:00 | UnderReview | 1002 | 102 | 3 |
| 4 | ACC-2506 | Twitter | Program | true | 2022-09-25T14:18:00 | Registered | 1003 | 103 | 4 |

Social media accounts form the central hub of digital operations. Each record captures an account identifier such as ACC-2500 or ACC-2506, the platform it inhabits (Twitter, Blog, Website), and the type of entity it represents (Sport, Club, Group, Program). The `is_official` flag distinguishes authorized institutional accounts from unofficial ones, while `registration_date` and `status` fields track lifecycle state. Accounts move through statuses such as Registered, Unregistered, and UnderReview. Every account ties to a district employee, a school entity, and a secure credential store, establishing the three primary relationships that the views below explore in detail.

**Table `district_employees`**

| district_employee_id | employee_id | full_name | role | employment_status | contact_extension | social_media_account_id | electronic_communication_id |
|---|---|---|---|---|---|---|---|
| 1000 | Norma Fisher | Theodore Mcgrath | Teacher | Active | Michelle Kelley | 1 | 100 |
| 1001 | Tasha Rodriguez | Account Name | Staff | Inactive | Kimberly Myers | 2 | 101 |
| 1002 | Theodore Mcgrath | Saipan International Airport | PublicInformationOfficer | OnLeave | Alice Alvarez | 3 | 102 |
| 1003 | Peter Mcdowell | Norma Fisher | Teacher | Active | Norma Fisher | 4 | 103 |

District employees provide the human layer of accountability. Each employee record carries a unique `district_employee_id` and an `employee_id` for internal systems, along with a `full_name` and an assigned `role`. Roles range from Teacher to Staff to PublicInformationOfficer, and `employment_status` captures Active, Inactive, and OnLeave states. Contact extensions serve as internal routing identifiers. Critically, each employee is linked to a social media account and an electronic communication, enabling practitioners to trace who controls which channels and which messages.

**Table `electronic_communications`**

| electronic_communication_id | communication_id | content_type | sent_date_time | is_public_record | platform_used | content_status | district_employee_id | school_entity_id |
|---|---|---|---|---|---|---|---|---|
| 100 | 209212 | Email | 2024-03-26T02:18:00 | true | primary-platform-88 | Draft | 1000 | 100 |
| 101 | 48753445 | TextMessage | 2025-08-10T09:35:00 | false | adaptive-platform-89 | Published | 1001 | 101 |
| 102 | lu_tax_code_template_m_I_4 | BlogPost | 2022-01-21T16:52:00 | true | distributed-platform-90 | Archived | 1002 | 102 |
| 103 | flexible-thinking | SocialMediaPost | 2023-06-05T23:09:00 | false | baseline-platform-91 | Draft | 1003 | 103 |

Electronic communications document every message sent through district systems. Each record includes a `communication_id` that may be numeric, such as 209212, or alphanumeric, such as flexible-thinking. The `content_type` field distinguishes Email, TextMessage, BlogPost, and SocialMediaPost formats. Timestamps in `sent_date_time` record when messages were dispatched, while `is_public_record` flags communications subject to public records law. The `platform_used` column identifies the delivery infrastructure—primary-platform-88, adaptive-platform-89, distributed-platform-90, or baseline-platform-91—and `content_status` tracks whether a message is in Draft, Published, or Archived state. Each communication ties to a district employee and optionally to a school entity.

**Table `school_entities`**

| id | entity_id | entity_name | entity_type | parent_district | social_media_account_id | district_employee_id |
|---|---|---|---|---|---|---|
| 100 | 1996912 | Regional Cluster | School | extended-parent-87 | 1 | 1000 |
| 101 | 57e4a9d4-8fcd-11eb-924d-9cd76263cbd0 | Seasonal Review D | Program | integrated-parent-88 | 2 | 1001 |
| 102 | 9736894 | Integrated Initiative | Club | seasonal-parent-89 | 3 | 1002 |
| 103 | 974946 | Extended Model | Sport | regional-parent-90 | 4 | 1003 |

School entities represent the organizational units within the district. Each entity carries an `entity_id` that may be a numeric identifier like 1996912 or a UUID such as 57e4a9d4-8fcd-11eb-924d-9cd76263cbd0. The `entity_name` provides a human-readable label—Regional Cluster, Seasonal Review D, Integrated Initiative, Extended Model—while `entity_type` categorizes the unit as a School, Program, Club, or Sport. The `parent_district` field references the governing district. Each school entity maintains links to a social media account and a district employee, ensuring that every organizational unit has an assigned digital presence and responsible personnel.

**Table `secure_credential_stores`**

| secure_credential_store_id | store_identifier | access_level | last_accessed | is_encrypted | social_media_account_id |
|---|---|---|---|---|---|
| 1 | STO-2552 | Restricted | 2024-11-03T10:54:00 | false | 1 |
| 2 | STO-2559 | PublicInformationOfficer | 2025-04-14T17:11:00 | true | 2 |
| 3 | STO-2566 | Restricted | 2022-09-25T00:28:00 | false | 3 |
| 4 | STO-2573 | PublicInformationOfficer | 2023-02-09T07:45:00 | true | 4 |

Secure credential stores provide the access control layer for social media accounts. Each store carries a `store_identifier` such as STO-2552 or STO-2559, an `access_level` that may be Restricted or PublicInformationOfficer, and a `last_accessed` timestamp. The `is_encrypted` flag indicates whether the store's contents are encrypted at rest. Every credential store maps to exactly one social media account, creating a one-to-one security boundary that ensures no account operates without a defined access regime.

**Table `policy_documents`**

| id | policy_id | policy_number | title | effective_date | version | electronic_communication_id | social_media_account_id | created_at |
|---|---|---|---|---|---|---|---|---|
| 1 | 5844252 | POL-2302 | Compact Initiative | 2023-02-14 | seasonal-version-71 | 100 | 1 | 2025-01-01 00:14:00 |
| 2 | 10207142 | POL-2304 | Legacy Model | 2024-07-25 | regional-version-72 | 101 | 2 | 2025-02-06 03:14:00 |
| 3 | 1562847 | POL-2306 | Regional Cluster A | 2025-12-09 | legacy-version-73 | 102 | 3 | 2025-03-11 06:14:00 |
| 4 | ChIJkzsYUIBt5kcRM6_JHx26ONk | POL-2308 | Seasonal Review | 2022-05-20 | compact-version-74 | 103 | 4 | 2025-04-16 09:14:00 |

Policy documents establish the regulatory framework governing digital operations. Each policy carries a `policy_id` that may be numeric, such as 5844252, or a Google Places-style identifier like ChIJkzsYUIBt5kcRM6_JHx26ONk. The `policy_number` (POL-2302, POL-2304, POL-2306, POL-2308) provides a human-readable reference, while the `title` field names the policy—Compact Initiative, Legacy Model, Regional Cluster A, Seasonal Review. The `effective_date` and `version` fields track when policies take effect and their revision history, with version strings such as seasonal-version-71 or compact-version-74. Each policy document references an electronic communication and a social media account, anchoring regulatory requirements to specific operational records.

## Cross-Referencing Accounts and Employees

The view `v_social_media_account_district_employee` answers the question: which employee is responsible for which social media account, and what is the current status of that account? This join pairs every social media account with its assigned district employee, producing records that combine account identifiers, platform names, and employee details.

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

Reading the first row reveals that account ACC-2500 on Twitter, representing a Sport entity and marked as unofficial, is managed by employee ID Norma Fisher (full name Theodore Mcgrath), who holds the role of Teacher with Active status. The second row shows ACC-2502, a Blog account for a Club marked as official, assigned to employee ID Tasha Rodriguez (full name Account Name) with Staff role and Inactive status. These pairings enable administrators to quickly identify account ownership and verify that active accounts are managed by active employees.

## Linking Accounts to School Entities

The view `v_social_media_account_school_entity` connects social media accounts to the school entities they represent. This join answers which organizational unit each account serves and whether the account's registration status aligns with the entity's operational needs.

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

The first row demonstrates that account ACC-2500 on Twitter represents the Regional Cluster entity (entity ID 1996912, type School) within parent district extended-parent-87. The account is registered and unofficial. The third row shows ACC-2504, a Website account for the Integrated Initiative club (entity ID 9736894), currently under review. These associations allow district leaders to audit whether every school entity has an appropriate digital presence and whether that presence is properly registered.

## Associating Accounts with Credential Stores

The view `v_social_media_account_secure_credential_store` maps each social media account to its credential store, revealing the security posture of every digital channel. This join answers whether accounts have defined access controls and whether their credentials are encrypted.

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

The first row shows that account ACC-2500 is secured by store STO-2552 with Restricted access level, but the store is not encrypted. The second row reveals that ACC-2502 uses store STO-2559 with PublicInformationOfficer access level and encryption enabled. The fourth row shows ACC-2506 paired with store STO-2573, also with PublicInformationOfficer access and encryption. These records enable security audits to identify accounts whose credentials lack encryption or whose access levels may be misaligned with the account's official status.

## Employee-Centric Account Views

The view `v_district_employee_social_media_account` inverts the perspective, presenting all accounts managed by each employee. This join answers the operational question: what digital channels does a given employee control?

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

The first row shows that employee Norma Fisher (ID 1000, role Teacher, Active status) manages account ACC-2500 on Twitter, which represents a Sport entity and is marked unofficial. The third row reveals that employee Theodore Mcgrath (ID 1002, role PublicInformationOfficer, OnLeave status) manages ACC-2504, a Website account for a Group entity currently under review. This employee-centric view is essential for workload balancing and for identifying accounts that may need reassignment when employees change status or leave their roles.

## Employee Communication Records

The view `v_district_employee_electronic_communication` links employees to the electronic communications they have sent or authored. This join answers which messages are attributable to which employee and provides context about content type, platform, and public records status.

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

The first row shows that employee Norma Fisher (ID 1000, Teacher, Active) sent communication 209212, an Email in Draft status on primary-platform-88, marked as a public record. The third row reveals that employee Theodore Mcgrath (ID 1002, PublicInformationOfficer, OnLeave) authored communication lu_tax_code_template_m_I_4, a BlogPost in Archived status on distributed-platform-90, also designated as a public record. These records support compliance audits by tracing communications back to their authors and verifying public records designations.

## Communication-to-Employee Relationships

The view `v_electronic_communication_district_employee` presents communications as the primary entity, with employee details joined as attributes. This join answers: for a given communication, who authored it and what is that employee's current status?

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

The second row shows communication 48753445, a TextMessage in Published status sent on adaptive-platform-89, authored by employee Tasha Rodriguez (ID 1001, Staff, Inactive). The fact that an inactive employee authored a published message may warrant review. The fourth row presents communication flexible-thinking, a SocialMediaPost in Draft status on baseline-platform-91, authored by Peter Mcdowell (ID 1003, Teacher, Active). This communication-centric view is useful for compliance teams investigating specific messages and verifying authorship.

## Communication and School Entity Links

The view `v_electronic_communication_school_entity` connects electronic communications to the school entities they relate to. This join answers which organizational unit a communication pertains to, supporting content governance and entity-level reporting.

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

The first row links communication 209212 (Email, Draft, public record) to the Regional Cluster school entity (ID 1996912). The third row connects communication lu_tax_code_template_m_I_4 (BlogPost, Archived, public record) to the Integrated Initiative club entity (ID 9736894). These associations enable district administrators to audit communications by organizational unit and ensure that entity-level messaging complies with applicable policies.

## School Entity Social Media Presence

The view `v_school_entity_social_media_account` presents school entities as the primary entity, with their associated social media accounts joined as attributes. This join answers: what digital presence does each school entity maintain, and is that presence properly registered?

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

The first row shows that the Regional Cluster school entity (ID 1996912) maintains account ACC-2500 on Twitter, which is registered but unofficial. The second row reveals that the Seasonal Review D program entity (ID 57e4a9d4-8fcd-11eb-924d-9cd76263cbd0) operates account ACC-2502 on Blog, which is official but unregistered. These records help administrators ensure that every school entity has a clearly defined and properly classified digital presence.

## School Entity Employee Assignments

The view `v_school_entity_district_employee` links school entities to the district employees assigned to them. This join answers: which employee is responsible for which school entity, and what is that employee's current employment status?

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

The first row shows that the Regional Cluster school entity (ID 1996912) is managed by employee Norma Fisher (ID 1000, Teacher, Active). The third row reveals that the Integrated Initiative club entity (ID 9736894) is managed by employee Theodore Mcgrath (ID 1002, PublicInformationOfficer, OnLeave). The OnLeave status of the employee managing an active club entity may signal a need for temporary reassignment. These records support organizational oversight and ensure that every entity has an accountable owner.

## Policy Document Communication References

The view `v_policy_document_electronic_communication` connects policy documents to the electronic communications they reference. This join answers: which communications are governed by which policies, and do those communications meet the policy's requirements?

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

The first row shows that policy POL-2302 (Compact Initiative, effective 2023-02-14, version seasonal-version-71) references communication 209212, an Email in Draft status. The third row reveals that policy POL-2306 (Regional Cluster A, effective 2025-12-09, version legacy-version-73) references communication lu_tax_code_template_m_I_4, a BlogPost in Archived status. These associations enable compliance officers to verify that referenced communications align with their governing policies.

## Policy Document Social Media References

The view `v_policy_document_social_media_account` links policy documents to the social media accounts they govern. This join answers: which social media channels fall under which policies, and are those accounts compliant with their regulatory framework?

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

The first row shows that policy POL-2302 (Compact Initiative) governs account ACC-2500 on Twitter, an unofficial account representing a Sport entity. The fourth row reveals that policy POL-2308 (Seasonal Review) governs account ACC-2506 on Twitter, an official account representing a Program entity. These mappings ensure that every social media account has a clearly defined policy framework and that policy coverage is comprehensive across all digital channels.

## Synthesis

The data structures described in this chapter form a coherent operational model for educational district digital management. Social media accounts serve as the central nexus, connecting employees, school entities, and credential stores into a unified framework. Electronic communications provide the message-level audit trail, while policy documents establish the regulatory boundaries within which all digital activity occurs. The views presented here transform these individual records into analytical lenses—employee-centric, entity-centric, communication-centric, and policy-centric—each answering distinct operational questions. Together, they enable district practitioners to maintain accountability, ensure compliance, and manage the complex web of digital relationships that define modern educational administration.

## Data appendix

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
