## The Social Media Account Registry

**Table `SocialMediaAccount`**

| accountId | platformName | accountType | creationDate | status | lastLoginDate | passwordHash | memberId | registerId | policyId |
|---|---|---|---|---|---|---|---|---|---|
| fbc33b0c-9bac-11eb-a8a2-19ed5c03f8d3 | Baseline Initiative D | staff_personal | 2022-01-13T12:24:00 | active | 2025-12-21T23:57:00 | integrated-password-76 | 1000 | 1 | 1 |
| 10207152 | Distributed Model | institutional | 2023-06-24T19:41:00 | suspended | 2022-05-05T06:14:00 | seasonal-password-77 | 1001 | 2 | 2 |
| a4afb8ee-9bad-11eb-a8a2-19ed5c03f8d3 | Adaptive Cluster | student | 2024-11-08T02:58:00 | archived | 2023-10-16T13:31:00 | regional-password-78 | 1002 | 3 | 3 |
| 3717632 | Primary Review A | staff_personal | 2025-04-19T09:15:00 | pending_approval | 2024-03-27T20:48:00 | legacy-password-79 | 1003 | 4 | 4 |

Every social media account within the educational ecosystem carries a unique identifier, a platform designation, and a lifecycle state that determines its operational validity. The platform name distinguishes between institutional channels and personal staff accounts, while the account type classifies each entry as either staff_personal, institutional, or student. Consider the account fbc33b0c-9bac-11eb-a8a2-19ed5c03f8d3, registered under the platform name "Baseline Initiative D" with type staff_personal; it was created on 2022-01-13 and remains active as of its last login on 2025-12-21. By contrast, the account 10207152, known as "Distributed Model," holds institutional type but carries a suspended status, with its last recorded login occurring on 2022-05-05. The account a4afb8ee-9bad-11eb-a8a2-19ed5c03f8d3, labeled "Adaptive Cluster," is classified as student type and has been archived, its last login dated 2023-10-16. The fourth entry, 3717632 ("Primary Review A"), is a staff_personal account in pending_approval status, created on 2025-04-19. Each account stores a password hash—integrated-password-76, seasonal-password-77, regional-password-78, and legacy-password-79 respectively—and links outward to a staff member via the memberId column, to an account register via registerId, and to a governing policy via policyId.

## Staff Members and Their Roles

**Table `StaffMember`**

| memberId | staffId | fullName | employmentStatus | role | dateOfCommencement | emailAddress | department | accountId | institutionId | codeId |
|---|---|---|---|---|---|---|---|---|---|---|
| 1000 | 937735 | Theodore Mcgrath | permanent | pilot-role-20 | 2022-01-27 | primary-email-70 | adaptive-departme-89 | fbc33b0c-9bac-11eb-a8a2-19ed5c03f8d3 | 1 | 1000 |
| 1001 | 3158139 | Account Name | temporary | extended-role-21 | 2023-06-11 | adaptive-email-71 | distributed-departme-90 | 10207152 | 2 | 1001 |
| 1002 | 8189502 | Saipan International Airport | casual | integrated-role-22 | 2024-11-22 | distributed-email-72 | baseline-departme-91 | a4afb8ee-9bad-11eb-a8a2-19ed5c03f8d3 | 3 | 1002 |
| 1003 | 69438 | Norma Fisher | fixed_term | seasonal-role-23 | 2025-04-06 | baseline-email-73 | pilot-departme-92 | 3717632 | 4 | 1003 |

Staff members form the human backbone of the registry, each identified by a numeric memberId and a distinct staffId. The fullName field carries the individual's name, while employmentStatus captures whether their engagement is permanent, temporary, casual, or fixed_term. Role assignments such as pilot-role-20, extended-role-21, integrated-role-22, and seasonal-role-23 denote functional positions within the organization. Theodore Mcgrath (memberId 1000, staffId 937735) holds a permanent status under role pilot-role-20, with employment commencing on 2022-01-27 and an email address of primary-email-70 assigned to the adaptive-departme-89 department. Account Name (memberId 1001, staffId 3158139) is a temporary staff member in extended-role-21, beginning 2023-06-11, reachable at adaptive-email-71 within distributed-departme-90. Saipan International Airport (memberId 1002, staffId 8189502) is a casual employee in integrated-role-22, starting 2024-11-22, with email distributed-email-72 in baseline-departme-91. Norma Fisher (memberId 1003, staffId 69438) is on fixed_term status under seasonal-role-23, commencing 2025-04-06, with email baseline-email-73 in pilot-departme-92. Each staff member record connects to a social media account through the accountId column, to an educational institution via institutionId, and to a teaching council code through codeId.

## Educational Institutions

**Table `EducationalInstitution`**

| institutionId | institutionName | institutionType | address | principalName | dateEstablished | registerId | policyId |
|---|---|---|---|---|---|---|---|
| 1 | Extended Corridor | school | distributed-address-72 | Composite Series | 2022-09-25 | 1 | 1 |
| 2 | Pilot Series A | institute | baseline-address-73 | Compact Assessment A | 2023-02-09 | 2 | 2 |
| 3 | Baseline Assessment | centre | pilot-address-74 | Legacy Survey | 2024-07-20 | 3 | 3 |
| 4 | Distributed Survey | office | extended-address-75 | Regional Corridor | 2025-12-04 | 4 | 4 |

Educational institutions anchor the organizational hierarchy, each assigned a numeric institutionId and a descriptive name. The institutionType field categorizes the entity as school, institute, centre, or office. The principalName records the leadership contact, while dateEstablished marks the founding date. Extended Corridor (institutionId 1) is a school established on 2022-09-25, led by Composite Series, with address distributed-address-72. Pilot Series A (institutionId 2) is an institute founded on 2023-02-09, under principal Compact Assessment A, located at baseline-address-73. Baseline Assessment (institutionId 3) is a centre established on 2024-07-20, with principal Legacy Survey and address pilot-address-74. Distributed Survey (institutionId 4) is an office founded on 2025-12-04, led by Regional Corridor, at address extended-address-75. Each institution links to an account register through registerId and to a social media policy via policyId.

## Account Registers

**Table `AccountRegister`**

| registerId | institutionId | lastAuditDate | totalActiveAccounts | complianceStatus | recordFormat | maintainedByInstitutionId | memberId |
|---|---|---|---|---|---|---|---|
| 1 | 9424913 | 2023-10-23T09:51:00 | 257 | compliant | extended-record-93 | 1 | 1000 |
| 2 | 8189481 | 2024-03-07T16:08:00 | 5596 | non_compliant | integrated-record-94 | 2 | 1001 |
| 3 | 1437604 | 2025-08-18T23:25:00 | 107 | under_review | seasonal-record-95 | 3 | 1002 |
| 4 | 884346 | 2022-01-02T06:42:00 | 106 | compliant | regional-record-96 | 4 | 1003 |

Account registers serve as the compliance ledger for each institution, tracking audit dates, active account counts, and regulatory standing. The registerId provides the primary key, while institutionId ties the register to its parent organization. The lastAuditDate records the most recent compliance review, and totalActiveAccounts quantifies the number of active social media accounts under that register. The complianceStatus field indicates whether the institution is compliant, non_compliant, or under_review. Record format is captured in the recordFormat column, and maintainedByInstitutionId identifies the institution responsible for maintaining the register. Register 1, linked to institution 9424913, was last audited on 2023-10-23, holds 257 active accounts, and is compliant, using extended-record-93 format, maintained by institution 1 and overseen by member 1000. Register 2, tied to institution 8189481, was audited on 2024-03-07, contains 5596 active accounts, is non_compliant, uses integrated-record-94 format, maintained by institution 2 under member 1001. Register 3, associated with institution 1437604, was audited on 2025-08-18, has 107 active accounts, is under_review, uses seasonal-record-95 format, maintained by institution 3 under member 1002. Register 4, linked to institution 884346, was audited on 2022-01-02, holds 106 active accounts, is compliant, uses regional-record-96 format, maintained by institution 4 under member 1003.

## Social Media Policies

**Table `SocialMediaPolicy`**

| policyId | title | adoptionDate | version | issuingAuthority | scope | codeId |
|---|---|---|---|---|---|---|
| 1 | Compact Initiative | 2025-08-12 | seasonal-version-71 | extended-issuing-33 | integrated-scope-52 | 1000 |
| 2 | Legacy Model | 2022-01-23 | regional-version-72 | integrated-issuing-34 | seasonal-scope-53 | 1001 |
| 3 | Regional Cluster A | 2023-06-07 | legacy-version-73 | seasonal-issuing-35 | regional-scope-54 | 1002 |
| 4 | Seasonal Review | 2024-11-18 | compact-version-74 | regional-issuing-36 | legacy-scope-55 | 1003 |

Social media policies define the governance framework for account usage across the educational network. Each policy carries a policyId, a title, an adoptionDate, a version identifier, an issuingAuthority, and a scope designation. The codeId column links the policy to its corresponding teaching council code. Compact Initiative (policyId 1) was adopted on 2025-08-12, version seasonal-version-71, issued by extended-issuing-33, with integrated-scope-52 scope, and linked to code 1000. Legacy Model (policyId 2) was adopted on 2022-01-23, version regional-version-72, issued by integrated-issuing-34, with seasonal-scope-53 scope, and linked to code 1001. Regional Cluster A (policyId 3) was adopted on 2023-06-07, version legacy-version-73, issued by seasonal-issuing-35, with regional-scope-54 scope, and linked to code 1002. Seasonal Review (policyId 4) was adopted on 2024-11-18, version compact-version-74, issued by regional-issuing-36, with legacy-scope-55 scope, and linked to code 1003.

## Teaching Council Codes

**Table `TeachingCouncilCode`**

| id | codeId | codeTitle | issuingBody | effectiveDate | sectionNumber | policyId |
|---|---|---|---|---|---|---|
| 1000 | levels | 3744018 | baseline-issuing-13 | 2023-02-14 | SEC-2472 | 1 |
| 1001 | 5082964 | 4463644 | pilot-issuing-14 | 2024-07-25 | SEC-2477 | 2 |
| 1002 | b75be5bc-8fcd-11eb-924d-9cd76263cbd0 | 8350031 | extended-issuing-15 | 2025-12-09 | SEC-2482 | 3 |
| 1003 | eff24a44-8fcb-11eb-924d-9cd76263cbd0 | 1250224 | integrated-issuing-16 | 2022-05-20 | SEC-2487 | 4 |

Teaching council codes provide the regulatory backbone for social media governance. Each code is identified by a numeric id and a codeId, with a codeTitle describing the regulation. The issuingBody field names the authority, effectiveDate marks when the code took effect, and sectionNumber identifies the specific regulatory section. The policyId column links the code to its parent social media policy. Code 1000 (codeId levels, title 3744018) was issued by baseline-issuing-13, effective 2023-02-14, under section SEC-2472, and linked to policy 1. Code 1001 (codeId 5082964, title 4463644) was issued by pilot-issuing-14, effective 2024-07-25, under section SEC-2477, and linked to policy 2. Code 1002 (codeId b75be5bc-8fcd-11eb-924d-9cd76263cbd0, title 8350031) was issued by extended-issuing-15, effective 2025-12-09, under section SEC-2482, and linked to policy 3. Code 1003 (codeId eff24a44-8fcb-11eb-924d-9cd76263cbd0, title 1250224) was issued by integrated-issuing-16, effective 2022-05-20, under section SEC-2487, and linked to policy 4.

## Cross-Reference Tables

**Table `EducationalInstitutionStaffMember`**

| institutionId | memberId |
|---|---|
| 1 | 1000 |
| 1 | 1001 |
| 2 | 1001 |
| 2 | 1002 |
| 3 | 1002 |
| 3 | 1003 |
| 4 | 1003 |
| 4 | 1000 |

**Table `AccountRegisterSocialMediaAccount`**

| registerId | accountId |
|---|---|
| 1 | fbc33b0c-9bac-11eb-a8a2-19ed5c03f8d3 |
| 1 | 10207152 |
| 2 | 10207152 |
| 2 | a4afb8ee-9bad-11eb-a8a2-19ed5c03f8d3 |
| 3 | a4afb8ee-9bad-11eb-a8a2-19ed5c03f8d3 |
| 3 | 3717632 |
| 4 | 3717632 |
| 4 | fbc33b0c-9bac-11eb-a8a2-19ed5c03f8d3 |

**Table `SocialMediaPolicyStaffMember`**

| policyId | memberId |
|---|---|
| 1 | 1000 |
| 1 | 1001 |
| 2 | 1001 |
| 2 | 1002 |
| 3 | 1002 |
| 3 | 1003 |
| 4 | 1003 |
| 4 | 1000 |

**Table `SocialMediaPolicySocialMediaAccount`**

| policyId | accountId |
|---|---|
| 1 | fbc33b0c-9bac-11eb-a8a2-19ed5c03f8d3 |
| 1 | 10207152 |
| 2 | 10207152 |
| 2 | a4afb8ee-9bad-11eb-a8a2-19ed5c03f8d3 |
| 3 | a4afb8ee-9bad-11eb-a8a2-19ed5c03f8d3 |
| 3 | 3717632 |
| 4 | 3717632 |
| 4 | fbc33b0c-9bac-11eb-a8a2-19ed5c03f8d3 |

**Table `TeachingCouncilCodeStaffMember`**

| codeId | memberId |
|---|---|
| 1000 | 1000 |
| 1000 | 1001 |
| 1001 | 1001 |
| 1001 | 1002 |
| 1002 | 1002 |
| 1002 | 1003 |
| 1003 | 1003 |
| 1003 | 1000 |

The relational integrity of the registry depends on cross-reference tables that establish many-to-many and one-to-many associations between the core entities. EducationalInstitutionStaffMember links institutions to their staff members, enabling an institution to employ multiple staff and a staff member to be associated with multiple institutional contexts. AccountRegisterSocialMediaAccount connects account registers to the social media accounts they govern, ensuring every active account is traceable to its compliance ledger. SocialMediaPolicyStaffMember ties policies to the staff members bound by them, while SocialMediaPolicySocialMediaAccount links policies directly to the accounts they regulate. TeachingCouncilCodeStaffMember associates teaching council codes with the staff members subject to those codes. These junction tables form the connective tissue that allows the system to answer complex queries about accountability, governance, and compliance.

## View: Social Media Account to Staff Member

**View `social_media_account_staff_member_view`**

```sql
CREATE VIEW social_media_account_staff_member_view AS
SELECT a.accountId, a.platformName, a.accountType, a.creationDate, b.memberId AS member_memberId, b.staffId AS member_staffId, b.fullName AS member_fullName
FROM SocialMediaAccount a JOIN StaffMember b ON a.memberId = b.memberId;
```

| accountId | platformName | accountType | creationDate | member_memberId | member_staffId | member_fullName |
|---|---|---|---|---|---|---|
| fbc33b0c-9bac-11eb-a8a2-19ed5c03f8d3 | Baseline Initiative D | staff_personal | 2022-01-13T12:24:00 | 1000 | 937735 | Theodore Mcgrath |
| 10207152 | Distributed Model | institutional | 2023-06-24T19:41:00 | 1001 | 3158139 | Account Name |
| a4afb8ee-9bad-11eb-a8a2-19ed5c03f8d3 | Adaptive Cluster | student | 2024-11-08T02:58:00 | 1002 | 8189502 | Saipan International Airport |
| 3717632 | Primary Review A | staff_personal | 2025-04-19T09:15:00 | 1003 | 69438 | Norma Fisher |

This view joins the SocialMediaAccount table with the StaffMember table, answering the question: which staff member owns or manages each social media account? The result surfaces the account's platform name, type, and status alongside the staff member's full name, employment status, role, and department. For instance, the account fbc33b0c-9bac-11eb-a8a2-19ed5c03f8d3 ("Baseline Initiative D", staff_personal, active) is managed by Theodore Mcgrath, a permanent staff member in pilot-role-20 within adaptive-departme-89. The suspended institutional account 10207152 ("Distributed Model") is linked to Account Name, a temporary staff member in extended-role-21. This view is essential for accountability audits, as it directly maps each account to its responsible individual.

## View: Social Media Account to Account Register

**View `social_media_account_account_register_view`**

```sql
CREATE VIEW social_media_account_account_register_view AS
SELECT a.accountId, a.platformName, a.accountType, a.creationDate, b.registerId AS register_registerId, b.institutionId AS register_institutionId, b.lastAuditDate AS register_lastAuditDate
FROM SocialMediaAccount a JOIN AccountRegister b ON a.registerId = b.registerId;
```

| accountId | platformName | accountType | creationDate | register_registerId | register_institutionId | register_lastAuditDate |
|---|---|---|---|---|---|---|
| fbc33b0c-9bac-11eb-a8a2-19ed5c03f8d3 | Baseline Initiative D | staff_personal | 2022-01-13T12:24:00 | 1 | 9424913 | 2023-10-23T09:51:00 |
| 10207152 | Distributed Model | institutional | 2023-06-24T19:41:00 | 2 | 8189481 | 2024-03-07T16:08:00 |
| a4afb8ee-9bad-11eb-a8a2-19ed5c03f8d3 | Adaptive Cluster | student | 2024-11-08T02:58:00 | 3 | 1437604 | 2025-08-18T23:25:00 |
| 3717632 | Primary Review A | staff_personal | 2025-04-19T09:15:00 | 4 | 884346 | 2022-01-02T06:42:00 |

This view joins SocialMediaAccount with AccountRegister, answering: which compliance register governs each social media account? The result presents the account's platform and status alongside the register's audit date, active account count, compliance status, and record format. Account fbc33b0c-9bac-11eb-a8a2-19ed5c03f8d3 falls under register 1, which was last audited on 2023-10-23, holds 257 active accounts, and is compliant with extended-record-93 format. Account 10207152 is governed by register 2, audited on 2024-03-07, with 5596 active accounts, non_compliant status, and integrated-record-94 format. This view enables compliance officers to assess whether an account's governing register is in good standing.

## View: Social Media Account to Social Media Policy

**View `social_media_account_social_media_policy_view`**

```sql
CREATE VIEW social_media_account_social_media_policy_view AS
SELECT a.accountId, a.platformName, a.accountType, a.creationDate, b.policyId AS policy_policyId, b.title AS policy_title, b.adoptionDate AS policy_adoptionDate
FROM SocialMediaAccount a JOIN SocialMediaPolicy b ON a.policyId = b.policyId;
```

| accountId | platformName | accountType | creationDate | policy_policyId | policy_title | policy_adoptionDate |
|---|---|---|---|---|---|---|
| fbc33b0c-9bac-11eb-a8a2-19ed5c03f8d3 | Baseline Initiative D | staff_personal | 2022-01-13T12:24:00 | 1 | Compact Initiative | 2025-08-12 |
| 10207152 | Distributed Model | institutional | 2023-06-24T19:41:00 | 2 | Legacy Model | 2022-01-23 |
| a4afb8ee-9bad-11eb-a8a2-19ed5c03f8d3 | Adaptive Cluster | student | 2024-11-08T02:58:00 | 3 | Regional Cluster A | 2023-06-07 |
| 3717632 | Primary Review A | staff_personal | 2025-04-19T09:15:00 | 4 | Seasonal Review | 2024-11-18 |

This view joins SocialMediaAccount with SocialMediaPolicy, answering: which social media policy governs each account? The result displays the account's platform name and type alongside the policy's title, adoption date, version, issuing authority, and scope. Account fbc33b0c-9bac-11eb-a8a2-19ed5c03f8d3 is governed by Compact Initiative (policyId 1), adopted on 2025-08-12, version seasonal-version-71, issued by extended-issuing-33, with integrated-scope-52. Account 10207152 falls under Legacy Model (policyId 2), adopted on 2022-01-23, version regional-version-72, issued by integrated-issuing-34, with seasonal-scope-53. This view is critical for policy compliance verification, ensuring each account is subject to the correct regulatory framework.

## View: Staff Member to Social Media Account

**View `staff_member_social_media_account_view`**

```sql
CREATE VIEW staff_member_social_media_account_view AS
SELECT a.memberId, a.staffId, a.fullName, a.employmentStatus, b.accountId AS account_accountId, b.platformName AS account_platformName, b.accountType AS account_accountType
FROM StaffMember a JOIN SocialMediaAccount b ON a.accountId = b.accountId;
```

| memberId | staffId | fullName | employmentStatus | account_accountId | account_platformName | account_accountType |
|---|---|---|---|---|---|---|
| 1000 | 937735 | Theodore Mcgrath | permanent | fbc33b0c-9bac-11eb-a8a2-19ed5c03f8d3 | Baseline Initiative D | staff_personal |
| 1001 | 3158139 | Account Name | temporary | 10207152 | Distributed Model | institutional |
| 1002 | 8189502 | Saipan International Airport | casual | a4afb8ee-9bad-11eb-a8a2-19ed5c03f8d3 | Adaptive Cluster | student |
| 1003 | 69438 | Norma Fisher | fixed_term | 3717632 | Primary Review A | staff_personal |

This view joins StaffMember with SocialMediaAccount, answering: which social media accounts are associated with each staff member? The result presents the staff member's full name, employment status, role, and department alongside the account's platform name, type, status, and creation date. Theodore Mcgrath (permanent, pilot-role-20, adaptive-departme-89) is associated with account fbc33b0c-9bac-11eb-a8a2-19ed5c03f8d3 ("Baseline Initiative D", staff_personal, active, created 2022-01-13). Account Name (temporary, extended-role-21, distributed-departme-90) is associated with account 10207152 ("Distributed Model", institutional, suspended, created 2023-06-24). This view supports workload and account management reviews, showing the breadth of each staff member's social media responsibilities.

## View: Staff Member to Educational Institution

**View `staff_member_educational_institution_view`**

```sql
CREATE VIEW staff_member_educational_institution_view AS
SELECT a.memberId, a.staffId, a.fullName, a.employmentStatus, b.institutionId AS institution_institutionId, b.institutionName AS institution_institutionName, b.institutionType AS institution_institutionType
FROM StaffMember a JOIN EducationalInstitution b ON a.institutionId = b.institutionId;
```

| memberId | staffId | fullName | employmentStatus | institution_institutionId | institution_institutionName | institution_institutionType |
|---|---|---|---|---|---|---|
| 1000 | 937735 | Theodore Mcgrath | permanent | 1 | Extended Corridor | school |
| 1001 | 3158139 | Account Name | temporary | 2 | Pilot Series A | institute |
| 1002 | 8189502 | Saipan International Airport | casual | 3 | Baseline Assessment | centre |
| 1003 | 69438 | Norma Fisher | fixed_term | 4 | Distributed Survey | office |

This view joins StaffMember with EducationalInstitution, answering: which educational institution is each staff member affiliated with? The result surfaces the staff member's name, role, and department alongside the institution's name, type, principal, and establishment date. Theodore Mcgrath is affiliated with institution 1 (Extended Corridor, school, principal Composite Series, established 2022-09-25). Account Name is affiliated with institution 2 (Pilot Series A, institute, principal Compact Assessment A, established 2023-02-09). Saipan International Airport is affiliated with institution 3 (Baseline Assessment, centre, principal Legacy Survey, established 2024-07-20). Norma Fisher is affiliated with institution 4 (Distributed Survey, office, principal Regional Corridor, established 2025-12-04). This view is essential for organizational reporting and institutional accountability.

## View: Staff Member to Teaching Council Code

**View `staff_member_teaching_council_code_view`**

```sql
CREATE VIEW staff_member_teaching_council_code_view AS
SELECT a.memberId, a.staffId, a.fullName, a.employmentStatus, b.id AS code_id, b.codeId AS code_codeId, b.codeTitle AS code_codeTitle
FROM StaffMember a JOIN TeachingCouncilCode b ON a.codeId = b.id;
```

| memberId | staffId | fullName | employmentStatus | code_id | code_codeId | code_codeTitle |
|---|---|---|---|---|---|---|
| 1000 | 937735 | Theodore Mcgrath | permanent | 1000 | levels | 3744018 |
| 1001 | 3158139 | Account Name | temporary | 1001 | 5082964 | 4463644 |
| 1002 | 8189502 | Saipan International Airport | casual | 1002 | b75be5bc-8fcd-11eb-924d-9cd76263cbd0 | 8350031 |
| 1003 | 69438 | Norma Fisher | fixed_term | 1003 | eff24a44-8fcb-11eb-924d-9cd76263cbd0 | 1250224 |

This view joins StaffMember with TeachingCouncilCode, answering: which teaching council code regulates each staff member? The result presents the staff member's name and role alongside the code's title, issuing body, effective date, and section number. Theodore Mcgrath is regulated by code 1000 (title 3744018, issued by baseline-issuing-13, effective 2023-02-14, section SEC-2472). Account Name is regulated by code 1001 (title 4463644, issued by pilot-issuing-14, effective 2024-07-25, section SEC-2477). Saipan International Airport is regulated by code 1002 (title 8350031, issued by extended-issuing-15, effective 2025-12-09, section SEC-2482). Norma Fisher is regulated by code 1003 (title 1250224, issued by integrated-issuing-16, effective 2022-05-20, section SEC-2487). This view ensures regulatory compliance by mapping each staff member to their applicable code.

## View: Educational Institution to Account Register

**View `educational_institution_account_register_view`**

```sql
CREATE VIEW educational_institution_account_register_view AS
SELECT a.institutionId, a.institutionName, a.institutionType, a.address, b.registerId AS register_registerId, b.institutionId AS register_institutionId, b.lastAuditDate AS register_lastAuditDate
FROM EducationalInstitution a JOIN AccountRegister b ON a.registerId = b.registerId;
```

| institutionId | institutionName | institutionType | address | register_registerId | register_institutionId | register_lastAuditDate |
|---|---|---|---|---|---|---|
| 1 | Extended Corridor | school | distributed-address-72 | 1 | 9424913 | 2023-10-23T09:51:00 |
| 2 | Pilot Series A | institute | baseline-address-73 | 2 | 8189481 | 2024-03-07T16:08:00 |
| 3 | Baseline Assessment | centre | pilot-address-74 | 3 | 1437604 | 2025-08-18T23:25:00 |
| 4 | Distributed Survey | office | extended-address-75 | 4 | 884346 | 2022-01-02T06:42:00 |

This view joins EducationalInstitution with AccountRegister, answering: which account register is associated with each educational institution? The result displays the institution's name, type, and principal alongside the register's audit date, active account count, compliance status, and record format. Extended Corridor (school, principal Composite Series) is linked to register 1, audited 2023-10-23, with 257 active accounts, compliant status, and extended-record-93 format. Pilot Series A (institute, principal Compact Assessment A) is linked to register 2, audited 2024-03-07, with 5596 active accounts, non_compliant status, and integrated-record-94 format. Baseline Assessment (centre, principal Legacy Survey) is linked to register 3, audited 2025-08-18, with 107 active accounts, under_review status, and seasonal-record-95 format. Distributed Survey (office, principal Regional Corridor) is linked to register 4, audited 2022-01-02, with 106 active accounts, compliant status, and regional-record-96 format. This view is vital for institutional compliance oversight.

## View: Educational Institution Staff Member Detail

**View `educational_institution_staff_member_detail_view`**

```sql
CREATE VIEW educational_institution_staff_member_detail_view AS
SELECT a.institutionId, a.institutionName, a.institutionType, b.memberId AS member_memberId, b.staffId AS member_staffId, b.fullName AS member_fullName
FROM EducationalInstitution a
  JOIN EducationalInstitutionStaffMember j ON j.institutionId = a.institutionId
  JOIN StaffMember b ON b.memberId = j.memberId;
```

| institutionId | institutionName | institutionType | member_memberId | member_staffId | member_fullName |
|---|---|---|---|---|---|
| 1 | Extended Corridor | school | 1000 | 937735 | Theodore Mcgrath |
| 1 | Extended Corridor | school | 1001 | 3158139 | Account Name |
| 2 | Pilot Series A | institute | 1001 | 3158139 | Account Name |
| 2 | Pilot Series A | institute | 1002 | 8189502 | Saipan International Airport |
| 3 | Baseline Assessment | centre | 1002 | 8189502 | Saipan International Airport |
| 3 | Baseline Assessment | centre | 1003 | 69438 | Norma Fisher |
| 4 | Distributed Survey | office | 1003 | 69438 | Norma Fisher |
| 4 | Distributed Survey | office | 1000 | 937735 | Theodore Mcgrath |

This view joins EducationalInstitution with StaffMember, answering: which staff members belong to each educational institution? The result presents the institution's name and type alongside the staff member's full name, employment status, role, and department. Extended Corridor employs Theodore Mcgrath (permanent, pilot-role-20, adaptive-departme-89). Pilot Series A employs Account Name (temporary, extended-role-21, distributed-departme-90). Baseline Assessment employs Saipan International Airport (casual, integrated-role-22, baseline-departme-91). Distributed Survey employs Norma Fisher (fixed_term, seasonal-role-23, pilot-departme-92). This view supports staffing analysis and institutional resource planning.

## View: Educational Institution to Social Media Policy

**View `educational_institution_social_media_policy_view`**

```sql
CREATE VIEW educational_institution_social_media_policy_view AS
SELECT a.institutionId, a.institutionName, a.institutionType, a.address, b.policyId AS policy_policyId, b.title AS policy_title, b.adoptionDate AS policy_adoptionDate
FROM EducationalInstitution a JOIN SocialMediaPolicy b ON a.policyId = b.policyId;
```

| institutionId | institutionName | institutionType | address | policy_policyId | policy_title | policy_adoptionDate |
|---|---|---|---|---|---|---|
| 1 | Extended Corridor | school | distributed-address-72 | 1 | Compact Initiative | 2025-08-12 |
| 2 | Pilot Series A | institute | baseline-address-73 | 2 | Legacy Model | 2022-01-23 |
| 3 | Baseline Assessment | centre | pilot-address-74 | 3 | Regional Cluster A | 2023-06-07 |
| 4 | Distributed Survey | office | extended-address-75 | 4 | Seasonal Review | 2024-11-18 |

This view joins EducationalInstitution with SocialMediaPolicy, answering: which social media policy applies to each educational institution? The result displays the institution's name and type alongside the policy's title, adoption date, version, issuing authority, and scope. Extended Corridor is governed by Compact Initiative (adopted 2025-08-12, version seasonal-version-71, issued by extended-issuing-33, scope integrated-scope-52). Pilot Series A is governed by Legacy Model (adopted 2022-01-23, version regional-version-72, issued by integrated-issuing-34, scope seasonal-scope-53). Baseline Assessment is governed by Regional Cluster A (adopted 2023-06-07, version legacy-version-73, issued by seasonal-issuing-35, scope regional-scope-54). Distributed Survey is governed by Seasonal Review (adopted 2024-11-18, version compact-version-74, issued by regional-issuing-36, scope legacy-scope-55). This view ensures that each institution operates under the correct policy framework.

## View: Account Register to Social Media Account Detail

**View `account_register_social_media_account_detail_view`**

```sql
CREATE VIEW account_register_social_media_account_detail_view AS
SELECT a.registerId, a.institutionId, a.lastAuditDate, b.accountId AS account_accountId, b.platformName AS account_platformName, b.accountType AS account_accountType
FROM AccountRegister a
  JOIN AccountRegisterSocialMediaAccount j ON j.registerId = a.registerId
  JOIN SocialMediaAccount b ON b.accountId = j.accountId;
```

| registerId | institutionId | lastAuditDate | account_accountId | account_platformName | account_accountType |
|---|---|---|---|---|---|
| 1 | 9424913 | 2023-10-23T09:51:00 | fbc33b0c-9bac-11eb-a8a2-19ed5c03f8d3 | Baseline Initiative D | staff_personal |
| 1 | 9424913 | 2023-10-23T09:51:00 | 10207152 | Distributed Model | institutional |
| 2 | 8189481 | 2024-03-07T16:08:00 | 10207152 | Distributed Model | institutional |
| 2 | 8189481 | 2024-03-07T16:08:00 | a4afb8ee-9bad-11eb-a8a2-19ed5c03f8d3 | Adaptive Cluster | student |
| 3 | 1437604 | 2025-08-18T23:25:00 | a4afb8ee-9bad-11eb-a8a2-19ed5c03f8d3 | Adaptive Cluster | student |
| 3 | 1437604 | 2025-08-18T23:25:00 | 3717632 | Primary Review A | staff_personal |
| 4 | 884346 | 2022-01-02T06:42:00 | 3717632 | Primary Review A | staff_personal |
| 4 | 884346 | 2022-01-02T06:42:00 | fbc33b0c-9bac-11eb-a8a2-19ed5c03f8d3 | Baseline Initiative D | staff_personal |

This view joins AccountRegister with SocialMediaAccount, answering: which social media accounts are governed by each account register? The result presents the register's audit date, active account count, and compliance status alongside the account's platform name, type, status, and creation date. Register 1 (audited 2023-10-23, 257 active accounts, compliant) governs account fbc33b0c-9bac-11eb-a8a2-19ed5c03f8d3 ("Baseline Initiative D", staff_personal, active, created 2022-01-13). Register 2 (audited 2024-03-07, 5596 active accounts, non_compliant) governs account 10207152 ("Distributed Model", institutional, suspended, created 2023-06-24). Register 3 (audited 2025-08-18, 107 active accounts, under_review) governs account a4afb8ee-9bad-11eb-a8a2-19ed5c03f8d3 ("Adaptive Cluster", student, archived, created 2024-11-08). Register 4 (audited 2022-01-02, 106 active accounts, compliant) governs account 3717632 ("Primary Review A", staff_personal, pending_approval, created 2025-04-19). This view is essential for compliance audits and account lifecycle management.

## View: Account Register to Educational Institution

**View `account_register_educational_institution_view`**

```sql
CREATE VIEW account_register_educational_institution_view AS
SELECT a.registerId, a.institutionId, a.lastAuditDate, a.totalActiveAccounts, b.institutionId AS institution_institutionId, b.institutionName AS institution_institutionName, b.institutionType AS institution_institutionType
FROM AccountRegister a JOIN EducationalInstitution b ON a.maintainedByInstitutionId = b.institutionId;
```

| registerId | institutionId | lastAuditDate | totalActiveAccounts | institution_institutionId | institution_institutionName | institution_institutionType |
|---|---|---|---|---|---|---|
| 1 | 9424913 | 2023-10-23T09:51:00 | 257 | 1 | Extended Corridor | school |
| 2 | 8189481 | 2024-03-07T16:08:00 | 5596 | 2 | Pilot Series A | institute |
| 3 | 1437604 | 2025-08-18T23:25:00 | 107 | 3 | Baseline Assessment | centre |
| 4 | 884346 | 2022-01-02T06:42:00 | 106 | 4 | Distributed Survey | office |

This view joins AccountRegister with EducationalInstitution, answering: which educational institution is associated with each account register? The result displays the register's audit date, active account count, and compliance status alongside the institution's name, type, principal, and establishment date. Register 1 (audited 2023-10-23, 257 active accounts, compliant) is associated with Extended Corridor (school, principal Composite Series, established 2022-09-25). Register 2 (audited 2024-03-07, 5596 active accounts, non_compliant) is associated with Pilot Series A (institute, principal Compact Assessment A, established 2023-02-09). Register 3 (audited 2025-08-18, 107 active accounts, under_review) is associated with Baseline Assessment (centre, principal Legacy Survey, established 2024-07-20). Register 4 (audited 2022-01-02, 106 active accounts, compliant) is associated with Distributed Survey (office, principal Regional Corridor, established 2025-12-04). This view supports institutional compliance reporting.

## View: Account Register to Staff Member

**View `account_register_staff_member_view`**

```sql
CREATE VIEW account_register_staff_member_view AS
SELECT a.registerId, a.institutionId, a.lastAuditDate, a.totalActiveAccounts, b.memberId AS member_memberId, b.staffId AS member_staffId, b.fullName AS member_fullName
FROM AccountRegister a JOIN StaffMember b ON a.memberId = b.memberId;
```

| registerId | institutionId | lastAuditDate | totalActiveAccounts | member_memberId | member_staffId | member_fullName |
|---|---|---|---|---|---|---|
| 1 | 9424913 | 2023-10-23T09:51:00 | 257 | 1000 | 937735 | Theodore Mcgrath |
| 2 | 8189481 | 2024-03-07T16:08:00 | 5596 | 1001 | 3158139 | Account Name |
| 3 | 1437604 | 2025-08-18T23:25:00 | 107 | 1002 | 8189502 | Saipan International Airport |
| 4 | 884346 | 2022-01-02T06:42:00 | 106 | 1003 | 69438 | Norma Fisher |

This view joins AccountRegister with StaffMember, answering: which staff member maintains each account register? The result presents the register's audit date, active account count, and compliance status alongside the staff member's full name, employment status, role, and department. Register 1 (audited 2023-10-23, 257 active accounts, compliant) is maintained by Theodore Mcgrath (permanent, pilot-role-20, adaptive-departme-89). Register 2 (audited 2024-03-07, 5596 active accounts, non_compliant) is maintained by Account Name (temporary, extended-role-21, distributed-departme-90). Register 3 (audited 2025-08-18, 107 active accounts, under_review) is maintained by Saipan International Airport (casual, integrated-role-22, baseline-departme-91). Register 4 (audited 2022-01-02, 106 active accounts, compliant) is maintained by Norma Fisher (fixed_term, seasonal-role-23, pilot-departme-92). This view clarifies accountability for register maintenance.

## View: Social Media Policy to Staff Member Detail

**View `social_media_policy_staff_member_detail_view`**

```sql
CREATE VIEW social_media_policy_staff_member_detail_view AS
SELECT a.policyId, a.title, a.adoptionDate, b.memberId AS member_memberId, b.staffId AS member_staffId, b.fullName AS member_fullName
FROM SocialMediaPolicy a
  JOIN SocialMediaPolicyStaffMember j ON j.policyId = a.policyId
  JOIN StaffMember b ON b.memberId = j.memberId;
```

| policyId | title | adoptionDate | member_memberId | member_staffId | member_fullName |
|---|---|---|---|---|---|
| 1 | Compact Initiative | 2025-08-12 | 1000 | 937735 | Theodore Mcgrath |
| 1 | Compact Initiative | 2025-08-12 | 1001 | 3158139 | Account Name |
| 2 | Legacy Model | 2022-01-23 | 1001 | 3158139 | Account Name |
| 2 | Legacy Model | 2022-01-23 | 1002 | 8189502 | Saipan International Airport |
| 3 | Regional Cluster A | 2023-06-07 | 1002 | 8189502 | Saipan International Airport |
| 3 | Regional Cluster A | 2023-06-07 | 1003 | 69438 | Norma Fisher |
| 4 | Seasonal Review | 2024-11-18 | 1003 | 69438 | Norma Fisher |
| 4 | Seasonal Review | 2024-11-18 | 1000 | 937735 | Theodore Mcgrath |

This view joins SocialMediaPolicy with StaffMember, answering: which staff members are subject to each social media policy? The result displays the policy's title, adoption date, and version alongside the staff member's full name, employment status, role, and department. Compact Initiative (adopted 2025-08-12, version seasonal-version-71) applies to Theodore Mcgrath (permanent, pilot-role-20, adaptive-departme-89). Legacy Model (adopted 2022-01-23, version regional-version-72) applies to Account Name (temporary, extended-role-21, distributed-departme-90). Regional Cluster A (adopted 2023-06-07, version legacy-version-73) applies to Saipan International Airport (casual, integrated-role-22, baseline-departme-91). Seasonal Review (adopted 2024-11-18, version compact-version-74) applies to Norma Fisher (fixed_term, seasonal-role-23, pilot-departme-92). This view supports policy dissemination and staff training tracking.

## View: Social Media Policy to Social Media Account Detail

**View `social_media_policy_social_media_account_detail_view`**

```sql
CREATE VIEW social_media_policy_social_media_account_detail_view AS
SELECT a.policyId, a.title, a.adoptionDate, b.accountId AS account_accountId, b.platformName AS account_platformName, b.accountType AS account_accountType
FROM SocialMediaPolicy a
  JOIN SocialMediaPolicySocialMediaAccount j ON j.policyId = a.policyId
  JOIN SocialMediaAccount b ON b.accountId = j.accountId;
```

| policyId | title | adoptionDate | account_accountId | account_platformName | account_accountType |
|---|---|---|---|---|---|
| 1 | Compact Initiative | 2025-08-12 | fbc33b0c-9bac-11eb-a8a2-19ed5c03f8d3 | Baseline Initiative D | staff_personal |
| 1 | Compact Initiative | 2025-08-12 | 10207152 | Distributed Model | institutional |
| 2 | Legacy Model | 2022-01-23 | 10207152 | Distributed Model | institutional |
| 2 | Legacy Model | 2022-01-23 | a4afb8ee-9bad-11eb-a8a2-19ed5c03f8d3 | Adaptive Cluster | student |
| 3 | Regional Cluster A | 2023-06-07 | a4afb8ee-9bad-11eb-a8a2-19ed5c03f8d3 | Adaptive Cluster | student |
| 3 | Regional Cluster A | 2023-06-07 | 3717632 | Primary Review A | staff_personal |
| 4 | Seasonal Review | 2024-11-18 | 3717632 | Primary Review A | staff_personal |
| 4 | Seasonal Review | 2024-11-18 | fbc33b0c-9bac-11eb-a8a2-19ed5c03f8d3 | Baseline Initiative D | staff_personal |

This view joins SocialMediaPolicy with SocialMediaAccount, answering: which social media accounts are governed by each policy? The result presents the policy's title and version alongside the account's platform name, type, status, and creation date. Compact Initiative (version seasonal-version-71) governs account fbc33b0c-9bac-11eb-a8a2-19ed5c03f8d3 ("Baseline Initiative D", staff_personal, active, created 2022-01-13). Legacy Model (version regional-version-72) governs account 10207152 ("Distributed Model", institutional, suspended, created 2023-06-24). Regional Cluster A (version legacy-version-73) governs account a4afb8ee-9bad-11eb-a8a2-19ed5c03f8d3 ("Adaptive Cluster", student, archived, created 2024-11-08). Seasonal Review (version compact-version-74) governs account 3717632 ("Primary Review A", staff_personal, pending_approval, created 2025-04-19). This view is essential for policy compliance verification at the account level.

## View: Social Media Policy to Teaching Council Code

**View `social_media_policy_teaching_council_code_view`**

```sql
CREATE VIEW social_media_policy_teaching_council_code_view AS
SELECT a.policyId, a.title, a.adoptionDate, a.version, b.id AS code_id, b.codeId AS code_codeId, b.codeTitle AS code_codeTitle
FROM SocialMediaPolicy a JOIN TeachingCouncilCode b ON a.codeId = b.id;
```

| policyId | title | adoptionDate | version | code_id | code_codeId | code_codeTitle |
|---|---|---|---|---|---|---|
| 1 | Compact Initiative | 2025-08-12 | seasonal-version-71 | 1000 | levels | 3744018 |
| 2 | Legacy Model | 2022-01-23 | regional-version-72 | 1001 | 5082964 | 4463644 |
| 3 | Regional Cluster A | 2023-06-07 | legacy-version-73 | 1002 | b75be5bc-8fcd-11eb-924d-9cd76263cbd0 | 8350031 |
| 4 | Seasonal Review | 2024-11-18 | compact-version-74 | 1003 | eff24a44-8fcb-11eb-924d-9cd76263cbd0 | 1250224 |

This view joins SocialMediaPolicy with TeachingCouncilCode, answering: which teaching council code is associated with each social media policy? The result displays the policy's title and adoption date alongside the code's title, issuing body, effective date, and section number. Compact Initiative (adopted 2025-08-12) is associated with code 1000 (title 3744018, issued by baseline-issuing-13, effective 2023-02-14, section SEC-2472). Legacy Model (adopted 2022-01-23) is associated with code 1001 (title 4463644, issued by pilot-issuing-14, effective 2024-07-25, section SEC-2477). Regional Cluster A (adopted 2023-06-07) is associated with code 1002 (title 8350031, issued by extended-issuing-15, effective 2025-12-09, section SEC-2482). Seasonal Review (adopted 2024-11-18) is associated with code 1003 (title 1250224, issued by integrated-issuing-16, effective 2022-05-20, section SEC-2487). This view ensures that policy and code alignment is maintained across the governance framework.

## View: Teaching Council Code to Staff Member Detail

**View `teaching_council_code_staff_member_detail_view`**

```sql
CREATE VIEW teaching_council_code_staff_member_detail_view AS
SELECT a.id, a.codeId, a.codeTitle, b.memberId AS member_memberId, b.staffId AS member_staffId, b.fullName AS member_fullName
FROM TeachingCouncilCode a
  JOIN TeachingCouncilCodeStaffMember j ON j.codeId = a.id
  JOIN StaffMember b ON b.memberId = j.memberId;
```

| id | codeId | codeTitle | member_memberId | member_staffId | member_fullName |
|---|---|---|---|---|---|
| 1000 | levels | 3744018 | 1000 | 937735 | Theodore Mcgrath |
| 1000 | levels | 3744018 | 1001 | 3158139 | Account Name |
| 1001 | 5082964 | 4463644 | 1001 | 3158139 | Account Name |
| 1001 | 5082964 | 4463644 | 1002 | 8189502 | Saipan International Airport |
| 1002 | b75be5bc-8fcd-11eb-924d-9cd76263cbd0 | 8350031 | 1002 | 8189502 | Saipan International Airport |
| 1002 | b75be5bc-8fcd-11eb-924d-9cd76263cbd0 | 8350031 | 1003 | 69438 | Norma Fisher |
| 1003 | eff24a44-8fcb-11eb-924d-9cd76263cbd0 | 1250224 | 1003 | 69438 | Norma Fisher |
| 1003 | eff24a44-8fcb-11eb-924d-9cd76263cbd0 | 1250224 | 1000 | 937735 | Theodore Mcgrath |

This view joins TeachingCouncilCode with StaffMember, answering: which staff members are regulated by each teaching council code? The result presents the code's title, issuing body, and effective date alongside the staff member's full name, employment status, role, and department. Code 1000 (title 3744018, issued by baseline-issuing-13, effective 2023-02-14) regulates Theodore Mcgrath (permanent, pilot-role-20, adaptive-departme-89). Code 1001 (title 4463644, issued by pilot-issuing-14, effective 2024-07-25) regulates Account Name (temporary, extended-role-21, distributed-departme-90). Code 1002 (title 8350031, issued by extended-issuing-15, effective 2025-12-09) regulates Saipan International Airport (casual, integrated-role-22, baseline-departme-91). Code 1003 (title 1250224, issued by integrated-issuing-16, effective 2022-05-20) regulates Norma Fisher (fixed_term, seasonal-role-23, pilot-departme-92). This view supports regulatory compliance audits and staff accountability tracking.

## View: Teaching Council Code to Social Media Policy

**View `teaching_council_code_social_media_policy_view`**

```sql
CREATE VIEW teaching_council_code_social_media_policy_view AS
SELECT a.id, a.codeId, a.codeTitle, a.issuingBody, b.policyId AS policy_policyId, b.title AS policy_title, b.adoptionDate AS policy_adoptionDate
FROM TeachingCouncilCode a JOIN SocialMediaPolicy b ON a.policyId = b.policyId;
```

| id | codeId | codeTitle | issuingBody | policy_policyId | policy_title | policy_adoptionDate |
|---|---|---|---|---|---|---|
| 1000 | levels | 3744018 | baseline-issuing-13 | 1 | Compact Initiative | 2025-08-12 |
| 1001 | 5082964 | 4463644 | pilot-issuing-14 | 2 | Legacy Model | 2022-01-23 |
| 1002 | b75be5bc-8fcd-11eb-924d-9cd76263cbd0 | 8350031 | extended-issuing-15 | 3 | Regional Cluster A | 2023-06-07 |
| 1003 | eff24a44-8fcb-11eb-924d-9cd76263cbd0 | 1250224 | integrated-issuing-16 | 4 | Seasonal Review | 2024-11-18 |

This view joins TeachingCouncilCode with SocialMediaPolicy, answering: which social media policy is associated with each teaching council code? The result displays the code's title and effective date alongside the policy's title, adoption date, version, issuing authority, and scope. Code 1000 (title 3744018, effective 2023-02-14) is associated with Compact Initiative (adopted 2025-08-12, version seasonal-version-71, issued by extended-issuing-33, scope integrated-scope-52). Code 1001 (title 4463644, effective 2024-07-25) is associated with Legacy Model (adopted 2022-01-23, version regional-version-72, issued by integrated-issuing-34, scope seasonal-scope-53). Code 1002 (title 8350031, effective 2025-12-09) is associated with Regional Cluster A (adopted 2023-06-07, version legacy-version-73, issued by seasonal-issuing-35, scope regional-scope-54). Code 1003 (title 1250224, effective 2022-05-20) is associated with Seasonal Review (adopted 2024-11-18, version compact-version-74, issued by regional-issuing-36, scope legacy-scope-55). This view ensures that the regulatory code and policy layers remain synchronized.

## Synthesis

The social media governance ecosystem described here interlocks six core entities—social media accounts, staff members, educational institutions, account registers, social media policies, and teaching council codes—through a network of foreign-key relationships and cross-reference tables. Each account is owned by a staff member, governed by a policy, and tracked in a compliance register. Each staff member is employed by an institution and regulated by a teaching council code. Each institution maintains a register and operates under a policy. The twenty-one views derived from these tables provide every necessary lens for auditing, compliance verification, staffing analysis, and policy enforcement. Together, they form a coherent framework for managing social media presence across an educational organization, ensuring that every account, every person, and every institution can be traced to its governing authority and regulatory obligation.