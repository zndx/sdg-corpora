## Governance Architecture and Administrative Operations

Every institution that manages people, services, and stakeholder relationships must maintain a clear picture of how its organizational units are structured, who holds authority within them, and which service functions are delivered to whom. The records in this domain capture exactly that architecture: administrative units form the backbone of the organization, administrative roles assign authority and accountability, persons carry out the work, service functions define what the organization produces, and stakeholder groups represent the populations those functions serve. Together they form a governance model that can be queried, audited, and understood at every level of detail.

**Table `administrative_units`**

| id | unit_id | unit_name | unit_type | established_date | is_shared_service | jurisdiction_scope | role_id | stakeholder_group_id | administrative_unit_id |
|---|---|---|---|---|---|---|---|---|---|
| 100 | 39800614 | Compact Series | department | 2024-03-27T14:30:00 | true | campus_wide | 2933463 | 1 | 100 |
| 101 | 611523 | Legacy Assessment | office | 2025-08-11T21:47:00 | false | institution_specific | id_3 | 2 | 101 |
| 102 | 57dbb53c-8fcc-11eb-924d-9cd76263cbd0 | Regional Survey A | service_center | 2022-01-22T04:04:00 | true | multi_institution | gd_taxc_2111 | 3 | 102 |
| 103 | account_pymes_1040 | Seasonal Corridor | division | 2023-06-06T11:21:00 | false | campus_wide | 994a4fa0-9bad-11eb-a8a2-19ed5c03f8d3 | 4 | 103 |

The administrative_units table is the organizational ledger. Each row represents a distinct unit within the institution, identified by a numeric or UUID-style unit_id and a human-readable unit_name. The unit_type column classifies the unit as a department, office, service_center, or division. For example, unit 39800614, named "Compact Series," is classified as a department and was established on 2024-03-27. It operates as a shared service across the entire campus. By contrast, unit 611523, "Legacy Assessment," is an office with institution-specific scope and is not a shared service. The established_date field records when each unit came into existence, ranging from January 2022 for "Regional Survey A" to August 2025 for "Legacy Assessment." The jurisdiction_scope column distinguishes between campus_wide, institution_specific, and multi_institution reach. The is_shared_service flag indicates whether the unit's output is consumed by other units rather than operating in isolation.

**Table `administrative_roles`**

| role_id | role_title | role_level | appointment_date | is_chief_of_staff | is_chief_resilience_officer | person_id | administrative_unit_id | oversees_administrative_unit_id |
|---|---|---|---|---|---|---|---|---|
| 2933463 | Distributed Standard | vice_president | 2022-05-03T16:12:00 | false | false | George Bernard Shaw | 100 | 100 |
| id_3 | Adaptive Framework D | associate_vice_president | 2023-10-14T23:29:00 | true | true | Maria Rodriguez | 101 | 101 |
| gd_taxc_2111 | Primary Protocol | director | 2024-03-25T06:46:00 | false | false | Sarah Villanueva | 102 | 102 |
| 994a4fa0-9bad-11eb-a8a2-19ed5c03f8d3 | Composite Programme | officer | 2025-08-09T13:03:00 | true | true | Susan Wagner | 103 | 103 |

Administrative roles define the authority structure within and across units. Each role carries a role_title such as "Distributed Standard" or "Adaptive Framework D," a role_level that places it in the hierarchy (vice_president, associate_vice_president, director, officer), and an appointment_date. Two boolean flags— is_chief_of_staff and is_chief_resilience_officer—mark roles with special executive responsibilities. The role at level associate_vice_president titled "Adaptive Framework D" (role_id id_3) holds both flags as true, indicating a dual executive mandate. The role at officer level titled "Composite Programme" (role_id 994a4fa0-9bad-11eb-a8a2-19ed5c03f8d3) also carries both flags. These flags are useful for identifying which roles bear cross-cutting accountability beyond their primary unit.

**Table `persons`**

| person_id | first_name | last_name | email_address | employment_status | hire_date | role_id | reports_to_person_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|
| George Bernard Shaw | Stephanie Collins | Paul Allen | primary-email-70 | active | 2023-06-01 | 2933463 | George Bernard Shaw | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| Maria Rodriguez | Janice Johnston | Heather Beasley | adaptive-email-71 | inactive | 2024-11-12 | id_3 | Maria Rodriguez | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| Sarah Villanueva | Upal Saha | Audrey Taylor | distributed-email-72 | on_leave | 2025-04-23 | gd_taxc_2111 | Sarah Villanueva | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| Susan Wagner | Katherine Snyder | Susan Wagner | baseline-email-73 | active | 2022-09-07 | 994a4fa0-9bad-11eb-a8a2-19ed5c03f8d3 | Susan Wagner | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Persons are the individuals who occupy positions within this governance structure. Each person record includes a first_name, last_name, and email_address, along with an employment_status that can be active, inactive, or on_leave. The hire_date records when the person joined the institution, and the role_id links them to an administrative role. The reports_to_person_id field establishes reporting lines within the organization. In the current data, each person reports to themselves, which may indicate that these are the top-level incumbents or that the reporting structure is still being populated. Stephanie Collins, employed under the email primary-email-70, holds an active status and was hired on 2023-06-01. Janice Johnston, associated with adaptive-email-71, is currently inactive. Upal Saha, reachable at distributed-email-72, is on leave as of the most recent record update.

**Table `service_functions`**

| id | function_id | function_name | function_category | is_core_function | service_level | administrative_unit_id | stakeholder_group_id |
|---|---|---|---|---|---|---|---|
| 1 | lu_tax_code_template_b_VB-TR-6 | Integrated Protocol A | financial | false | essential | 100 | 1 |
| 2 | state_uk_5 | Extended Programme | human_resources | true | support | 101 | 2 |
| 3 | IVCN | Pilot Standard | facilities | false | optional | 102 | 3 |
| 4 | 884367 | Baseline Framework D | safety | true | essential | 103 | 4 |

Service functions describe what the organization actually does—its operational outputs. Each function has a function_name, a function_category (financial, human_resources, facilities, or safety), and a service_level (essential, support, or optional). The is_core_function flag distinguishes functions that are central to the institution's mission from those that are ancillary. "Integrated Protocol A," categorized as financial, is marked as non-core and essential in service level. "Extended Programme," in the human_resources category, is both core and at support level. "Baseline Framework D," a safety function, is core and essential. The administrative_unit_id and stakeholder_group_id columns tie each function to the unit that delivers it and the group that receives it.

**Table `stakeholder_groups`**

| id | group_code | group_name | group_type | is_eligible_for_services | service_function_id | administrative_unit_id |
|---|---|---|---|---|---|---|
| 1 | 168543 | Julian Brown | students | true | 1 | 100 |
| 2 | 2087746 | Devin Wise | faculty | false | 2 | 101 |
| 3 | bc908e7a-8fcd-11eb-924d-9cd76263cbd0 | Terry Pratchett | staff | true | 3 | 102 |
| 4 | 7021001070080 | Joshua Harris | external_institutions | false | 4 | 103 |

Stakeholder groups represent the populations served by the organization's functions. Each group has a group_code, group_name, and group_type, which can be students, faculty, staff, or external_institutions. The is_eligible_for_services flag indicates whether the group qualifies for the services defined in the system. Julian Brown's group (code 168543), classified as students, is eligible for services. Devin Wise's group (code 2087746), classified as faculty, is not eligible. The service_function_id and administrative_unit_id columns link each group to the functions and units relevant to them.

### Administrative Unit and Role Alignment

The relationship between organizational units and the roles that govern them is captured in the view that joins administrative_units to administrative_roles on the role_id field. This join answers the question: which administrative role is associated with each unit, and what is the level of authority at that unit?

**View `vw_administrative_unit_administrative_role`**

```sql
CREATE VIEW vw_administrative_unit_administrative_role AS
SELECT a.id, a.unit_id, a.unit_name, a.unit_type, b.role_id AS role_role_id, b.role_title AS role_role_title, b.role_level AS role_role_level
FROM administrative_units a JOIN administrative_roles b ON a.role_id = b.role_id;
```

| id | unit_id | unit_name | unit_type | role_role_id | role_role_title | role_role_level |
|---|---|---|---|---|---|---|
| 100 | 39800614 | Compact Series | department | 2933463 | Distributed Standard | vice_president |
| 101 | 611523 | Legacy Assessment | office | id_3 | Adaptive Framework D | associate_vice_president |
| 102 | 57dbb53c-8fcc-11eb-924d-9cd76263cbd0 | Regional Survey A | service_center | gd_taxc_2111 | Primary Protocol | director |
| 103 | account_pymes_1040 | Seasonal Corridor | division | 994a4fa0-9bad-11eb-a8a2-19ed5c03f8d3 | Composite Programme | officer |

The view presents each unit alongside its associated role's identifier, title, and level. Unit 100, "Compact Series," is paired with role 2933463, "Distributed Standard," at the vice_president level. Unit 101, "Legacy Assessment," carries role id_3, "Adaptive Framework D," at associate_vice_president level. Unit 102, "Regional Survey A," is governed by role gd_taxc_2111, "Primary Protocol," at director level. Unit 103, "Seasonal Corridor," has role 994a4fa0-9bad-11eb-a8a2-19ed5c03f8d3, "Composite Programme," at officer level. The hierarchy is clear: vice_president sits at the top, followed by associate_vice_president, director, and officer. This alignment allows auditors and managers to verify that each unit has a designated authority and to compare the distribution of seniority across the organization.

### Stakeholder Group and Unit Coverage

Understanding which stakeholder groups are served by which administrative units is essential for service planning and resource allocation. The view joining administrative_units to stakeholder_groups on the stakeholder_group_id field reveals these pairings.

**View `vw_administrative_unit_stakeholder_group`**

```sql
CREATE VIEW vw_administrative_unit_stakeholder_group AS
SELECT a.id, a.unit_id, a.unit_name, a.unit_type, b.id AS group_id, b.group_code AS group_group_code, b.group_name AS group_group_name
FROM administrative_units a JOIN stakeholder_groups b ON a.stakeholder_group_id = b.id;
```

| id | unit_id | unit_name | unit_type | group_id | group_group_code | group_group_name |
|---|---|---|---|---|---|---|
| 100 | 39800614 | Compact Series | department | 1 | 168543 | Julian Brown |
| 101 | 611523 | Legacy Assessment | office | 2 | 2087746 | Devin Wise |
| 102 | 57dbb53c-8fcc-11eb-924d-9cd76263cbd0 | Regional Survey A | service_center | 3 | bc908e7a-8fcd-11eb-924d-9cd76263cbd0 | Terry Pratchett |
| 103 | account_pymes_1040 | Seasonal Corridor | division | 4 | 7021001070080 | Joshua Harris |

Each row in this view connects a unit to the stakeholder group it serves. Unit 100 ("Compact Series") serves stakeholder group 1, which corresponds to the students group. Unit 101 ("Legacy Assessment") serves group 2, the faculty group. Unit 102 ("Regional Survey A") serves group 3, the staff group. Unit 103 ("Seasonal Corridor") serves group 4, the external_institutions group. This one-to-one mapping in the current data suggests a clean assignment of units to populations, though the underlying schema supports more complex many-to-many relationships through the join mechanism.

### Unit-to-Unit Relationships

Organizations often contain nested or peer relationships between units. The view vw_administrative_unit_administrative_unit captures self-referential or cross-unit relationships by joining administrative_units to itself.

**View `vw_administrative_unit_administrative_unit`**

```sql
CREATE VIEW vw_administrative_unit_administrative_unit AS
SELECT a.id, a.unit_id, a.unit_name, a.unit_type, b.id AS unit_id, b.unit_id AS unit_unit_id, b.unit_name AS unit_unit_name
FROM administrative_units a JOIN administrative_units b ON a.administrative_unit_id = b.id;
```

| id | unit_id | unit_name | unit_type | unit_id | unit_unit_id | unit_unit_name |
|---|---|---|---|---|---|---|
| 100 | 39800614 | Compact Series | department | 100 | 39800614 | Compact Series |
| 101 | 611523 | Legacy Assessment | office | 101 | 611523 | Legacy Assessment |
| 102 | 57dbb53c-8fcc-11eb-924d-9cd76263cbd0 | Regional Survey A | service_center | 102 | 57dbb53c-8fcc-11eb-924d-9cd76263cbd0 | Regional Survey A |
| 103 | account_pymes_1040 | Seasonal Corridor | division | 103 | account_pymes_1040 | Seasonal Corridor |

In the current dataset, each unit appears to reference itself, indicating that the self-referential administrative_unit_id field may be used to denote parent-child relationships or peer associations. The fact that unit 100 references unit 100, unit 101 references unit 101, and so on, suggests that the relationship structure is either not yet populated with cross-unit links or that each unit currently operates as an independent entity. As the organization matures, this view will reveal supervisory chains, shared-service dependencies, and federated structures.

### Role-to-Person Assignment

The view vw_administrative_role_person links administrative roles to the persons who hold them, answering the question: who is appointed to which role?

**View `vw_administrative_role_person`**

```sql
CREATE VIEW vw_administrative_role_person AS
SELECT a.role_id, a.role_title, a.role_level, a.appointment_date, b.person_id AS person_person_id, b.first_name AS person_first_name, b.last_name AS person_last_name
FROM administrative_roles a JOIN persons b ON a.person_id = b.person_id;
```

| role_id | role_title | role_level | appointment_date | person_person_id | person_first_name | person_last_name |
|---|---|---|---|---|---|---|
| 2933463 | Distributed Standard | vice_president | 2022-05-03T16:12:00 | George Bernard Shaw | Stephanie Collins | Paul Allen |
| id_3 | Adaptive Framework D | associate_vice_president | 2023-10-14T23:29:00 | Maria Rodriguez | Janice Johnston | Heather Beasley |
| gd_taxc_2111 | Primary Protocol | director | 2024-03-25T06:46:00 | Sarah Villanueva | Upal Saha | Audrey Taylor |
| 994a4fa0-9bad-11eb-a8a2-19ed5c03f8d3 | Composite Programme | officer | 2025-08-09T13:03:00 | Susan Wagner | Katherine Snyder | Susan Wagner |

The view shows that role 2933463 ("Distributed Standard") is held by George Bernard Shaw. Role id_3 ("Adaptive Framework D") is held by Maria Rodriguez. Role gd_taxc_2111 ("Primary Protocol") is held by Sarah Villanueva. Role 994a4fa0-9bad-11eb-a8a2-19ed5c03f8d3 ("Composite Programme") is held by Susan Wagner. This mapping is critical for accountability: it connects the abstract authority structure defined by roles to the actual individuals who exercise that authority. The employment status of each person—active, inactive, or on_leave—adds a layer of operational awareness, indicating whether the role is currently being fulfilled.

### Role-to-Unit Assignment

While the administrative_units table contains a role_id that links units to roles, the view vw_administrative_role_administrative_unit provides a complementary perspective by joining from the role side to the unit side.

**View `vw_administrative_role_administrative_unit`**

```sql
CREATE VIEW vw_administrative_role_administrative_unit AS
SELECT a.role_id, a.role_title, a.role_level, a.appointment_date, b.id AS unit_id, b.unit_id AS unit_unit_id, b.unit_name AS unit_unit_name
FROM administrative_roles a JOIN administrative_units b ON a.administrative_unit_id = b.id;
```

| role_id | role_title | role_level | appointment_date | unit_id | unit_unit_id | unit_unit_name |
|---|---|---|---|---|---|---|
| 2933463 | Distributed Standard | vice_president | 2022-05-03T16:12:00 | 100 | 39800614 | Compact Series |
| id_3 | Adaptive Framework D | associate_vice_president | 2023-10-14T23:29:00 | 101 | 611523 | Legacy Assessment |
| gd_taxc_2111 | Primary Protocol | director | 2024-03-25T06:46:00 | 102 | 57dbb53c-8fcc-11eb-924d-9cd76263cbd0 | Regional Survey A |
| 994a4fa0-9bad-11eb-a8a2-19ed5c03f8d3 | Composite Programme | officer | 2025-08-09T13:03:00 | 103 | account_pymes_1040 | Seasonal Corridor |

This view confirms the same pairings seen from the unit perspective: role 2933463 is associated with unit 100, role id_3 with unit 101, role gd_taxc_2111 with unit 102, and role 994a4fa0-9bad-11eb-a8a2-19ed5c03f8d3 with unit 103. The dual perspective—unit-to-role and role-to-unit—is useful for different query patterns. When investigating a role, the role-to-unit view immediately shows the organizational home. When investigating a unit, the unit-to-role view shows the governing authority.

### Person-to-Role Assignment

The view vw_person_administrative_role connects persons to their assigned roles, providing a personnel roster organized by role.

**View `vw_person_administrative_role`**

```sql
CREATE VIEW vw_person_administrative_role AS
SELECT a.person_id, a.first_name, a.last_name, a.email_address, b.role_id AS role_role_id, b.role_title AS role_role_title, b.role_level AS role_role_level
FROM persons a JOIN administrative_roles b ON a.role_id = b.role_id;
```

| person_id | first_name | last_name | email_address | role_role_id | role_role_title | role_role_level |
|---|---|---|---|---|---|---|
| George Bernard Shaw | Stephanie Collins | Paul Allen | primary-email-70 | 2933463 | Distributed Standard | vice_president |
| Maria Rodriguez | Janice Johnston | Heather Beasley | adaptive-email-71 | id_3 | Adaptive Framework D | associate_vice_president |
| Sarah Villanueva | Upal Saha | Audrey Taylor | distributed-email-72 | gd_taxc_2111 | Primary Protocol | director |
| Susan Wagner | Katherine Snyder | Susan Wagner | baseline-email-73 | 994a4fa0-9bad-11eb-a8a2-19ed5c03f8d3 | Composite Programme | officer |

Stephanie Collins is assigned to role 2933463 ("Distributed Standard"). Janice Johnston is assigned to role id_3 ("Adaptive Framework D"). Upal Saha is assigned to role gd_taxc_2111 ("Primary Protocol"). Katherine Snyder is assigned to role 994a4fa0-9bad-11eb-a8a2-19ed5c03f8d3 ("Composite Programme"). This view is particularly useful for human resources operations, as it allows managers to see all personnel under a given role and to filter by employment status. For instance, filtering for active persons under role 2933463 would return Stephanie Collins, while filtering for inactive persons under role id_3 would return Janice Johnston.

### Person-to-Person Relationships

The view vw_person_person captures reporting relationships and other interpersonal connections within the organization by joining the persons table to itself.

**View `vw_person_person`**

```sql
CREATE VIEW vw_person_person AS
SELECT a.person_id, a.first_name, a.last_name, a.email_address, b.person_id AS person_person_id, b.first_name AS person_first_name, b.last_name AS person_last_name
FROM persons a JOIN persons b ON a.reports_to_person_id = b.person_id;
```

| person_id | first_name | last_name | email_address | person_person_id | person_first_name | person_last_name |
|---|---|---|---|---|---|---|
| George Bernard Shaw | Stephanie Collins | Paul Allen | primary-email-70 | George Bernard Shaw | Stephanie Collins | Paul Allen |
| Maria Rodriguez | Janice Johnston | Heather Beasley | adaptive-email-71 | Maria Rodriguez | Janice Johnston | Heather Beasley |
| Sarah Villanueva | Upal Saha | Audrey Taylor | distributed-email-72 | Sarah Villanueva | Upal Saha | Audrey Taylor |
| Susan Wagner | Katherine Snyder | Susan Wagner | baseline-email-73 | Susan Wagner | Katherine Snyder | Susan Wagner |

In the current data, each person appears to reference themselves in the reporting relationship, consistent with the self-referential pattern seen in the administrative_units table. George Bernard Shaw reports to George Bernard Shaw, Maria Rodriguez to Maria Rodriguez, and so on. This may indicate that the reporting hierarchy is not yet fully populated or that these individuals are at the top of the chain with no superiors recorded. As the organization's structure evolves, this view will reveal the full reporting tree, enabling org-chart generation and cascade analysis.

### Service Function and Unit Delivery

The view vw_service_function_administrative_unit links service functions to the administrative units that deliver them, answering the question: which unit produces which function?

**View `vw_service_function_administrative_unit`**

```sql
CREATE VIEW vw_service_function_administrative_unit AS
SELECT a.id, a.function_id, a.function_name, a.function_category, b.id AS unit_id, b.unit_id AS unit_unit_id, b.unit_name AS unit_unit_name
FROM service_functions a JOIN administrative_units b ON a.administrative_unit_id = b.id;
```

| id | function_id | function_name | function_category | unit_id | unit_unit_id | unit_unit_name |
|---|---|---|---|---|---|---|
| 1 | lu_tax_code_template_b_VB-TR-6 | Integrated Protocol A | financial | 100 | 39800614 | Compact Series |
| 2 | state_uk_5 | Extended Programme | human_resources | 101 | 611523 | Legacy Assessment |
| 3 | IVCN | Pilot Standard | facilities | 102 | 57dbb53c-8fcc-11eb-924d-9cd76263cbd0 | Regional Survey A |
| 4 | 884367 | Baseline Framework D | safety | 103 | account_pymes_1040 | Seasonal Corridor |

Unit 100 ("Compact Series") delivers function lu_tax_code_template_b_VB-TR-6 ("Integrated Protocol A"), a financial function at essential service level. Unit 101 ("Legacy Assessment") delivers function state_uk_5 ("Extended Programme"), a human_resources function at support level. Unit 102 ("Regional Survey A") delivers function IVCN ("Pilot Standard"), a facilities function at optional level. Unit 103 ("Seasonal Corridor") delivers function 884367 ("Baseline Framework D"), a safety function at essential level. This view is essential for capacity planning: it shows which units are responsible for which functions and allows managers to assess whether the right units are handling the right work.

### Service Function and Stakeholder Coverage

The view vw_service_function_stakeholder_group connects service functions to the stakeholder groups they serve, answering the question: which groups benefit from which functions?

**View `vw_service_function_stakeholder_group`**

```sql
CREATE VIEW vw_service_function_stakeholder_group AS
SELECT a.id, a.function_id, a.function_name, a.function_category, b.id AS group_id, b.group_code AS group_group_code, b.group_name AS group_group_name
FROM service_functions a JOIN stakeholder_groups b ON a.stakeholder_group_id = b.id;
```

| id | function_id | function_name | function_category | group_id | group_group_code | group_group_name |
|---|---|---|---|---|---|---|
| 1 | lu_tax_code_template_b_VB-TR-6 | Integrated Protocol A | financial | 1 | 168543 | Julian Brown |
| 2 | state_uk_5 | Extended Programme | human_resources | 2 | 2087746 | Devin Wise |
| 3 | IVCN | Pilot Standard | facilities | 3 | bc908e7a-8fcd-11eb-924d-9cd76263cbd0 | Terry Pratchett |
| 4 | 884367 | Baseline Framework D | safety | 4 | 7021001070080 | Joshua Harris |

Function lu_tax_code_template_b_VB-TR-6 ("Integrated Protocol A") serves stakeholder group 1 (students). Function state_uk_5 ("Extended Programme") serves group 2 (faculty). Function IVCN ("Pilot Standard") serves group 3 (staff). Function 884367 ("Baseline Framework D") serves group 4 (external_institutions). This mapping is critical for service-level management: it ensures that essential functions like "Integrated Protocol A" and "Baseline Framework D" are reaching their intended audiences and that the eligibility flags on stakeholder groups are being respected.

### Stakeholder Group and Service Function

The view vw_stakeholder_group_service_function provides the reverse perspective, joining stakeholder_groups to service_functions to show which functions are available to each group.

**View `vw_stakeholder_group_service_function`**

```sql
CREATE VIEW vw_stakeholder_group_service_function AS
SELECT a.id, a.group_code, a.group_name, a.group_type, b.id AS function_id, b.function_id AS function_function_id, b.function_name AS function_function_name
FROM stakeholder_groups a JOIN service_functions b ON a.service_function_id = b.id;
```

| id | group_code | group_name | group_type | function_id | function_function_id | function_function_name |
|---|---|---|---|---|---|---|
| 1 | 168543 | Julian Brown | students | 1 | lu_tax_code_template_b_VB-TR-6 | Integrated Protocol A |
| 2 | 2087746 | Devin Wise | faculty | 2 | state_uk_5 | Extended Programme |
| 3 | bc908e7a-8fcd-11eb-924d-9cd76263cbd0 | Terry Pratchett | staff | 3 | IVCN | Pilot Standard |
| 4 | 7021001070080 | Joshua Harris | external_institutions | 4 | 884367 | Baseline Framework D |

Group 1 (students) is associated with function lu_tax_code_template_b_VB-TR-6 ("Integrated Protocol A"). Group 2 (faculty) is associated with function state_uk_5 ("Extended Programme"). Group 3 (staff) is associated with function IVCN ("Pilot Standard"). Group 4 (external_institutions) is associated with function 884367 ("Baseline Framework D"). This view is useful for stakeholder communication: it allows the organization to generate service catalogs tailored to each group, showing exactly which functions are available and at what service level.

### Stakeholder Group and Unit Assignment

The view vw_stakeholder_group_administrative_unit links stakeholder groups to the administrative units that serve them, completing the picture of how units, roles, persons, functions, and groups interlock.

**View `vw_stakeholder_group_administrative_unit`**

```sql
CREATE VIEW vw_stakeholder_group_administrative_unit AS
SELECT a.id, a.group_code, a.group_name, a.group_type, b.id AS unit_id, b.unit_id AS unit_unit_id, b.unit_name AS unit_unit_name
FROM stakeholder_groups a JOIN administrative_units b ON a.administrative_unit_id = b.id;
```

| id | group_code | group_name | group_type | unit_id | unit_unit_id | unit_unit_name |
|---|---|---|---|---|---|---|
| 1 | 168543 | Julian Brown | students | 100 | 39800614 | Compact Series |
| 2 | 2087746 | Devin Wise | faculty | 101 | 611523 | Legacy Assessment |
| 3 | bc908e7a-8fcd-11eb-924d-9cd76263cbd0 | Terry Pratchett | staff | 102 | 57dbb53c-8fcc-11eb-924d-9cd76263cbd0 | Regional Survey A |
| 4 | 7021001070080 | Joshua Harris | external_institutions | 103 | account_pymes_1040 | Seasonal Corridor |

Group 1 (students) is served by unit 100 ("Compact Series"). Group 2 (faculty) is served by unit 101 ("Legacy Assessment"). Group 3 (staff) is served by unit 102 ("Regional Survey A"). Group 4 (external_institutions) is served by unit 103 ("Seasonal Corridor"). This view is the operational map: it shows the end-to-end chain from organizational unit through stakeholder group, enabling managers to trace service delivery from the unit that produces it to the group that receives it.

### Synthesis

The five base tables and twelve views together form a comprehensive governance model. Administrative units define the organizational structure. Administrative roles assign authority and executive responsibility. Persons fill the roles and report through a hierarchy. Service functions describe the operational output. Stakeholder groups represent the populations served. The views join these tables in every meaningful combination, enabling queries that answer questions about authority, accountability, service delivery, and stakeholder coverage. The data—while currently showing simple one-to-one mappings—supports the complexity of real institutions, where units nest, roles are shared, persons hold multiple positions, functions are delivered to multiple groups, and stakeholder eligibility changes over time. This model provides the foundation for auditing, planning, and managing the institution's governance architecture.