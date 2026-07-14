## Social Media Governance in School District Operations

School districts maintain a complex ecosystem of public-facing communications, internal personnel, and policy frameworks that must be coordinated to ensure consistent messaging and regulatory compliance. At the center of this ecosystem are social media accounts—digital channels through which the district reaches families, staff, and the broader community. Each account carries an identifier such as ACC-2500 or ACC-2504, sits on a specific platform like Twitter, Blog, or Website, and exists in one of two states: registered or unregistered. The lifecycle of an account is tracked through a creation date and a last audit date, providing an auditable trail of when the account came into use and when it was last reviewed.

**Table `social_media_accounts`**

| social_media_account_id | account_identifier | platform_type | registration_status | creation_date | last_audit_date | district_employee_id | school_district_entity_id | board_policy_id |
|---|---|---|---|---|---|---|---|---|
| 1 | ACC-2500 | Twitter | registered | 2022-01-13T12:24:00 | 2023-10-23T09:51:00 | 100 | 100 | 1 |
| 2 | ACC-2502 | Blog | unregistered | 2023-06-24T19:41:00 | 2024-03-07T16:08:00 | 101 | 101 | 2 |
| 3 | ACC-2504 | Website | registered | 2024-11-08T02:58:00 | 2025-08-18T23:25:00 | 102 | 102 | 3 |
| 4 | ACC-2506 | Twitter | unregistered | 2025-04-19T09:15:00 | 2022-01-02T06:42:00 | 103 | 103 | 4 |

These accounts do not exist in isolation. Each one is tied to the people who manage it, the organizational entities it represents, and the board policies that govern its use. The relationships among these elements form the backbone of district communications governance, and understanding them is essential for anyone responsible for oversight, compliance, or operational continuity.

### Personnel and Account Management

District employees are the primary operators of social media channels. The district_employees table records each employee's internal identifier, their full name, their role within the district, a contact extension, and their current employment status. Employees such as Norma Fisher and Theodore Mcgrath appear as Teachers, while others hold Staff or Administrator positions. Employment status alternates between active and inactive, reflecting the dynamic nature of district staffing.

**Table `district_employees`**

| district_employee_id | employee_id | full_name | role | contact_extension | employment_status | board_policy_id |
|---|---|---|---|---|---|---|
| 100 | Norma Fisher | Theodore Mcgrath | Teacher | Michelle Kelley | active | 1 |
| 101 | Tasha Rodriguez | Account Name | Staff | Kimberly Myers | inactive | 2 |
| 102 | Theodore Mcgrath | Saipan International Airport | Administrator | Alice Alvarez | active | 3 |
| 103 | Peter Mcdowell | Norma Fisher | Teacher | Norma Fisher | inactive | 4 |

The connection between employees and accounts is captured in the employees_accounts junction table, which maps each district employee to the social media accounts they manage. This many-to-many relationship allows a single employee to oversee multiple accounts and multiple employees to share responsibility for a single account. For example, district employee 100 (Norma Fisher) is linked to accounts 1 and 2, while employee 103 (Peter Mcdowell) manages accounts 4 and 1. This cross-linking ensures that account ownership is documented and that backup coverage is possible when primary operators are unavailable.

The employees_accounts table records these pairings explicitly:

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

### Organizational Entities and Platform Presence

Beyond individual employees, school district operations involve formal entities that may represent programs, clubs, or broader organizational clusters. The school_district_entities table catalogs these organizations with an internal identifier, a human-readable name, an entity type, and an affiliation status that indicates whether the relationship with the district is official or unofficial.

**Table `school_district_entities`**

| school_district_entity_id | entity_id | entity_name | entity_type | affiliation_status |
|---|---|---|---|---|
| 100 | 1996912 | Regional Cluster | Sport | official |
| 101 | 57e4a9d4-8fcd-11eb-924d-9cd76263cbd0 | Seasonal Review D | Club | unofficial |
| 102 | 9736894 | Integrated Initiative | Group | official |
| 103 | 974946 | Extended Model | Program | unofficial |

Entity types in the data include Sport, Club, Group, and Program, reflecting the diverse nature of district-affiliated organizations. The affiliation status—official or unofficial—provides a quick signal of the level of institutional backing and oversight. For instance, the Regional Cluster (entity 100) is an official Sport entity, while the Seasonal Review D (entity 101) is an unofficial Club. These distinctions matter when determining which accounts and communications fall under direct district control versus those that operate at arm's length.

The entities_accounts junction table links school district entities to the social media accounts they operate, ensuring that organizational ownership of digital channels is traceable.

### Policy Framework and Compliance

Board policies establish the rules under which social media accounts are created, managed, and audited. The board_policies table stores each policy's unique number (such as POL-2302 or POL-2308), its title, the date it became effective, and its current status—either active or superseded.

**Table `board_policies`**

| id | policy_number | policy_title | effective_date | policy_status |
|---|---|---|---|---|
| 1 | POL-2302 | Baseline Initiative D | 2023-02-14 | active |
| 2 | POL-2304 | Distributed Model | 2024-07-25 | superseded |
| 3 | POL-2306 | Adaptive Cluster | 2025-12-09 | active |
| 4 | POL-2308 | Primary Review A | 2022-05-20 | superseded |

Active policies like POL-2302 (Baseline Initiative D) and POL-2306 (Adaptive Cluster) represent the current governing rules, while superseded policies such as POL-2304 (Distributed Model) and POL-2308 (Primary Review A) document the historical evolution of district communications standards. Each social media account references a board_policy_id, anchoring it to a specific policy framework. This linkage ensures that every account can be traced back to the policy that authorized its creation and that governs its ongoing operation.

The policies_accounts junction table formalizes the relationship between policies and accounts, while the policies_employees table connects employees to the policies they are responsible for implementing or adhering to.

### Public Information Officers and Access Control

Public information officers serve as a specialized subset of personnel with designated authority over district communications. The public_information_officers table records each officer's internal ID, full name, contact extension, and access level, which is either full or restricted.

**Table `public_information_officers`**

| id | officer_id | full_name | contact_extension | access_level | board_policy_id |
|---|---|---|---|---|---|
| 1 | 103165 | Theodore Mcgrath | Michelle Kelley | full | 1 |
| 2 | 2933464 | Account Name | Kimberly Myers | restricted | 2 |
| 3 | 10445622 | Saipan International Airport | Alice Alvarez | full | 3 |
| 4 | 7441150 | Norma Fisher | Norma Fisher | restricted | 4 |

Access level is a critical differentiator. Officers with full access, such as Theodore Mcgrath (officer 1) and Saipan International Airport (officer 3), have broad authority over communications content and account management. Officers with restricted access, such as Account Name (officer 2) and Norma Fisher (officer 4), operate within defined boundaries. Each officer is also linked to a board policy, ensuring that their authority is grounded in the same policy framework that governs all district communications.

The officers_accounts junction table maps officers to the social media accounts they oversee, completing the chain of accountability from policy to person to platform.

### Operational Views and Cross-Referenced Reporting

The district's data model provides a set of views that join these base tables to answer specific operational questions. Each view assembles information from multiple sources into a single, queryable result that supports decision-making and compliance reporting.

The view v_social_media_account_district_employee answers the question: which employee is associated with which social media account? It joins the social media accounts table with the district employees table on the district_employee_id field. Reading row 1 of this view reveals that account ACC-2500 on Twitter is associated with district employee 100 (Norma Fisher), while row 4 shows that account ACC-2506 on Twitter is linked to employee 103 (Peter Mcdowell). This view is essential for determining individual accountability for each account.

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

The view v_social_media_account_school_district_entity addresses a parallel question: which organizational entity is associated with which social media account? By joining social media accounts with school district entities on school_district_entity_id, it reveals that account ACC-2500 is tied to entity 100 (Regional Cluster), and account ACC-2502 is tied to entity 101 (Seasonal Review D). This view supports audits of organizational presence across platforms.

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

The view v_social_media_account_board_policy connects each account to its governing policy. Joining social media accounts with board policies on board_policy_id shows that account ACC-2500 operates under policy POL-2302 (Baseline Initiative D), while account ACC-2502 operates under POL-2304 (Distributed Model). This view is the primary tool for verifying that every account has a current, active policy backing it.

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

More detailed views combine additional context to support deeper analysis. The view v_district_employee_social_media_account_detail enriches the employee-account relationship by including platform type, registration status, and audit dates alongside employee name and role. For example, one row shows that employee 100 (Norma Fisher, Teacher) manages account ACC-2500 on Twitter, which is registered and was last audited on 2023-10-23. Another row reveals that employee 101 (Tasha Rodriguez, Staff) manages account ACC-2502 on Blog, which is unregistered and was last audited on 2024-03-07. This level of detail is critical for compliance reviews and for identifying accounts that may need attention.

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

The view v_district_employee_board_policy links employees directly to the board policies they are associated with, joining district_employees with board_policies on board_policy_id. One row shows that employee 100 (Norma Fisher) is linked to policy POL-2302 (Baseline Initiative D), while another shows that employee 101 (Tasha Rodriguez) is linked to POL-2304 (Distributed Model). This view supports training and onboarding by clarifying which policies each employee must follow.

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

The view v_school_district_entity_social_media_account_detail provides a comprehensive picture of each entity's social media presence by joining school_district_entities with social_media_accounts. One row reveals that entity 100 (Regional Cluster, type Sport, official affiliation) operates account ACC-2500 on Twitter, which is registered and was last audited on 2023-10-23. Another row shows that entity 101 (Seasonal Review D, type Club, unofficial affiliation) operates account ACC-2502 on Blog, which is unregistered and was last audited on 2024-03-07. This view is particularly useful for assessing the consistency of official versus unofficial entity communications.

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

The view v_board_policy_social_media_account_detail connects each board policy to the accounts it governs, joining board_policies with social_media_accounts on board_policy_id. One row shows that policy POL-2302 (Baseline Initiative D, active since 2023-02-14) governs account ACC-2500 on Twitter. Another row shows that policy POL-2304 (Distributed Model, superseded since 2024-07-25) governs account ACC-2502 on Blog. This view is essential for identifying accounts that may be operating under superseded policies and require policy updates.

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

The view v_board_policy_district_employee_detail links board policies to the employees associated with them, joining board_policies with district_employees on board_policy_id. One row shows that policy POL-2302 (Baseline Initiative D) is associated with employee 100 (Norma Fisher, Teacher, active), while another shows that policy POL-2304 (Distributed Model) is associated with employee 101 (Tasha Rodriguez, Staff, inactive). This view supports workforce planning by revealing which employees are tied to which policies and whether those employees are currently active.

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

The view v_public_information_officer_social_media_account_detail provides a detailed mapping of public information officers to the social media accounts they oversee, joining public_information_officers with social_media_accounts. One row shows that officer 1 (Theodore Mcgrath, full access) is linked to account ACC-2500 on Twitter, which is registered and was last audited on 2023-10-23. Another row shows that officer 4 (Norma Fisher, restricted access) is linked to account ACC-2506 on Twitter, which is unregistered and was last audited on 2022-01-02. This view is critical for ensuring that access levels are appropriate and that all accounts have designated officer oversight.

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

Finally, the view v_public_information_officer_board_policy connects public information officers to the board policies that define their authority, joining public_information_officers with board_policies on board_policy_id. One row shows that officer 1 (Theodore Mcgrath, full access) operates under policy POL-2302 (Baseline Initiative D, active), while another shows that officer 2 (Account Name, restricted access) operates under POL-2304 (Distributed Model, superseded). This view ensures that officer authority is aligned with current, active policies and flags cases where officers may be governed by superseded frameworks.

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

### Synthesis

The social media governance model for school districts integrates five core domains—accounts, employees, entities, policies, and public information officers—into a coherent framework of accountability. Each social media account is anchored to a person, an organization, and a policy, creating multiple layers of traceability. The junction tables (employees_accounts, entities_accounts, policies_accounts, officers_accounts, and policies_employees) provide the flexible many-to-many relationships that reflect real-world operations, where individuals and organizations share responsibilities and policies govern broad categories of activity.

The views transform these relational structures into actionable intelligence. They answer the questions that compliance officers, district administrators, and public information officers need to address daily: Who manages this account? Which policy governs it? Is the account registered and up to date? Is the responsible employee still active? By presenting joined results that combine identifiers, statuses, dates, and access levels, the views turn raw relational data into a practical tool for governance. The fictional entities, employees, and policies in the data illustrate the model's structure without implying any real-world organization; the relationships and patterns, however, reflect the operational realities of any district that maintains a public digital presence.

## Data appendix

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
