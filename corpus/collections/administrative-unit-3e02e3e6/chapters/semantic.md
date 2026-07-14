## Ontology-Grounded Relational Modelling of an Administrative Enterprise

The domain under examination is an administrative enterprise in which organizational units, personnel, service functions, and stakeholder groups are interwoven through a network of roles and reporting relationships. At the conceptual level, the ontology distinguishes five principal entity types: administrative units (the structural containers of authority), administrative roles (the positions of responsibility that inhabit those containers), persons (the human agents who occupy roles), service functions (the operational capabilities delivered to beneficiaries), and stakeholder groups (the classes of beneficiaries to whom services are extended). The relational schema materializes this ontology by decomposing each entity into a base table, encoding attributes as columns, and expressing cardinality-bounded relationships as foreign keys, self-referential links, and derived views that reconstruct domain facts through joins. The following sections walk through the base tables, the views, and the join logic that binds them together.

### Base Tables and Their Ontological Mapping

The foundation of the schema rests on five base tables, each corresponding to an ontology class.

**Table `administrative_units`**

| id | unit_id | unit_name | unit_type | established_date | is_shared_service | jurisdiction_scope | role_id | stakeholder_group_id | administrative_unit_id |
|---|---|---|---|---|---|---|---|---|---|
| 100 | 39800614 | Compact Series | department | 2024-03-27T14:30:00 | true | campus_wide | 2933463 | 1 | 100 |
| 101 | 611523 | Legacy Assessment | office | 2025-08-11T21:47:00 | false | institution_specific | id_3 | 2 | 101 |
| 102 | 57dbb53c-8fcc-11eb-924d-9cd76263cbd0 | Regional Survey A | service_center | 2022-01-22T04:04:00 | true | multi_institution | gd_taxc_2111 | 3 | 102 |
| 103 | account_pymes_1040 | Seasonal Corridor | division | 2023-06-06T11:21:00 | false | campus_wide | 994a4fa0-9bad-11eb-a8a2-19ed5c03f8d3 | 4 | 103 |

The `administrative_units` table captures the organizational skeleton. Its primary key is `id`, a surrogate integer (values such as `100`, `101`, `102`, `103`), while `unit_id` serves as a business identifier that varies in type — integer (`39800614`), string (`id_3`), UUID (`57dbb53c-8fcc-11eb-924d-9cd76263cbd0`), or alphanumeric (`account_pymes_1040`). The `unit_name` column carries human-readable labels like "Compact Series" and "Legacy Assessment", and `unit_type` classifies each unit as `department`, `office`, `service_center`, or `division`. The boolean `is_shared_service` flag distinguishes shared-capability units (e.g., `true` for "Compact Series") from standalone ones. `jurisdiction_scope` constrains the geographic or institutional reach to `campus_wide`, `institution_specific`, or `multi_institution`. Three foreign keys anchor this table to the rest of the model: `role_id` references `administrative_roles.role_id`, `stakeholder_group_id` references `stakeholder_groups.id`, and `administrative_unit_id` is a self-referential link that enables hierarchical nesting of units (each row's `administrative_unit_id` points to its parent unit's `id`).

**Table `administrative_roles`**

| role_id | role_title | role_level | appointment_date | is_chief_of_staff | is_chief_resilience_officer | person_id | administrative_unit_id | oversees_administrative_unit_id |
|---|---|---|---|---|---|---|---|---|
| 2933463 | Distributed Standard | vice_president | 2022-05-03T16:12:00 | false | false | George Bernard Shaw | 100 | 100 |
| id_3 | Adaptive Framework D | associate_vice_president | 2023-10-14T23:29:00 | true | true | Maria Rodriguez | 101 | 101 |
| gd_taxc_2111 | Primary Protocol | director | 2024-03-25T06:46:00 | false | false | Sarah Villanueva | 102 | 102 |
| 994a4fa0-9bad-11eb-a8a2-19ed5c03f8d3 | Composite Programme | officer | 2025-08-09T13:03:00 | true | true | Susan Wagner | 103 | 103 |

The `administrative_roles` table models the positions of authority. Its primary key is `role_id`, which uses the same heterogeneous identifier space as `administrative_units.unit_id` (e.g., `2933463`, `id_3`, `gd_taxc_2111`, `994a4fa0-9bad-11eb-a8a2-19ed5c03f8d3`). The `role_title` column holds descriptive names such as "Distributed Standard" and "Adaptive Framework D", while `role_level` encodes the organizational tier as `vice_president`, `associate_vice_president`, `director`, or `officer`. The `appointment_date` records when the role was filled. Two boolean flags — `is_chief_of_staff` and `is_chief_resilience_officer` — mark roles with special executive mandates (e.g., `id_3` has both flags set to `true`). Foreign keys `person_id` and `administrative_unit_id` link the role to the person who holds it and the unit in which it resides, respectively. The column `oversees_administrative_unit_id` is a self-referential foreign key that expresses supervisory relationships between units.

**Table `persons`**

| person_id | first_name | last_name | email_address | employment_status | hire_date | role_id | reports_to_person_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|
| George Bernard Shaw | Stephanie Collins | Paul Allen | primary-email-70 | active | 2023-06-01 | 2933463 | George Bernard Shaw | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| Maria Rodriguez | Janice Johnston | Heather Beasley | adaptive-email-71 | inactive | 2024-11-12 | id_3 | Maria Rodriguez | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| Sarah Villanueva | Upal Saha | Audrey Taylor | distributed-email-72 | on_leave | 2025-04-23 | gd_taxc_2111 | Sarah Villanueva | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| Susan Wagner | Katherine Snyder | Susan Wagner | baseline-email-73 | active | 2022-09-07 | 994a4fa0-9bad-11eb-a8a2-19ed5c03f8d3 | Susan Wagner | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The `persons` table stores the human agents. Its primary key is `person_id`, which in the sample data coincides with the person's full name (e.g., "George Bernard Shaw", "Maria Rodriguez", "Sarah Villanueva", "Susan Wagner"). The columns `first_name` and `last_name` decompose the name into components (e.g., "Stephanie Collins" and "Paul Allen" for the person identified as "George Bernard Shaw"). The `email_address` column carries identifiers like `primary-email-70` and `adaptive-email-71`. The `employment_status` column is an enumerated attribute with values `active`, `inactive`, and `on_leave`. The `hire_date` records the start of employment. The foreign key `role_id` links each person to the administrative role they occupy, and `reports_to_person_id` is a self-referential foreign key that establishes the reporting chain (in the sample data, each person reports to themselves, indicating a flat or self-referential reporting structure). The timestamp columns `created_at` and `updated_at` track the lifecycle of the person record.

**Table `service_functions`**

| id | function_id | function_name | function_category | is_core_function | service_level | administrative_unit_id | stakeholder_group_id |
|---|---|---|---|---|---|---|---|
| 1 | lu_tax_code_template_b_VB-TR-6 | Integrated Protocol A | financial | false | essential | 100 | 1 |
| 2 | state_uk_5 | Extended Programme | human_resources | true | support | 101 | 2 |
| 3 | IVCN | Pilot Standard | facilities | false | optional | 102 | 3 |
| 4 | 884367 | Baseline Framework D | safety | true | essential | 103 | 4 |

The `service_functions` table encodes the operational capabilities of the enterprise. Its primary key is `id` (integer values `1` through `4`), while `function_id` is a business identifier that varies in format (e.g., `lu_tax_code_template_b_VB-TR-6`, `state_uk_5`, `IVCN`, `884367`). The `function_name` column carries descriptive labels such as "Integrated Protocol A" and "Extended Programme". The `function_category` column classifies functions into `financial`, `human_resources`, `facilities`, and `safety`. The boolean `is_core_function` flag distinguishes core capabilities (e.g., `true` for "Extended Programme" and "Baseline Framework D") from supplementary ones. The `service_level` column is an enumerated attribute with values `essential`, `support`, and `optional`. Foreign keys `administrative_unit_id` and `stakeholder_group_id` link each service function to the unit that delivers it and the stakeholder group that benefits from it.

**Table `stakeholder_groups`**

| id | group_code | group_name | group_type | is_eligible_for_services | service_function_id | administrative_unit_id |
|---|---|---|---|---|---|---|
| 1 | 168543 | Julian Brown | students | true | 1 | 100 |
| 2 | 2087746 | Devin Wise | faculty | false | 2 | 101 |
| 3 | bc908e7a-8fcd-11eb-924d-9cd76263cbd0 | Terry Pratchett | staff | true | 3 | 102 |
| 4 | 7021001070080 | Joshua Harris | external_institutions | false | 4 | 103 |

The `stakeholder_groups` table models the beneficiary classes. Its primary key is `id` (integer values `1` through `4`), while `group_code` is a business identifier that varies in type (e.g., `168543`, `2087746`, `bc908e7a-8fcd-11eb-924d-9cd76263cbd0`, `7021001070080`). The `group_name` column carries names such as "Julian Brown" and "Devin Wise", and `group_type` classifies the group as `students`, `faculty`, `staff`, or `external_institutions`. The boolean `is_eligible_for_services` indicates whether the group qualifies for services (e.g., `true` for "Julian Brown" and `false` for "Devin Wise"). The foreign key `service_function_id` links the group to the service function it receives, and `administrative_unit_id` links it to the unit that manages it.

### Views: Reconstructing Domain Facts Through Joins

The base tables are normalized to eliminate redundancy and enforce referential integrity. Views then reconstruct higher-level domain facts by joining these tables. Each view answers a specific analytical question about the relationships between entities.

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

This view answers the question: "Which administrative role is associated with each administrative unit?" It joins `administrative_units` to `administrative_roles` on the condition `administrative_units.role_id = administrative_roles.role_id`. The result pairs each unit with its role's identifier, title, and level. For example, the unit "Compact Series" (id `100`, type `department`) is associated with the role "Distributed Standard" (role_id `2933463`, level `vice_president`). Similarly, "Legacy Assessment" (id `101`, type `office`) maps to "Adaptive Framework D" (role_id `id_3`, level `associate_vice_president`). The view effectively materializes the unit-to-role assignment that is stored as the `role_id` foreign key in `administrative_units`.

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

This view answers: "Which stakeholder group is served by each administrative unit?" It joins `administrative_units` to `stakeholder_groups` on `administrative_units.stakeholder_group_id = stakeholder_groups.id`. The result pairs each unit with its stakeholder group's identifier, code, name, and type. For instance, unit "Compact Series" (id `100`) serves stakeholder group "Julian Brown" (id `1`, code `168543`, type `students`), while unit "Legacy Assessment" (id `101`) serves "Devin Wise" (id `2`, code `2087746`, type `faculty`). This view materializes the unit-to-stakeholder assignment stored as the `stakeholder_group_id` foreign key in `administrative_units`.

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

This view answers: "How are administrative units hierarchically related to one another?" It performs a self-join on `administrative_units` where `administrative_units.administrative_unit_id = parent.id`. The result reveals the parent-child structure of the organizational hierarchy. In the sample data, each unit's `administrative_unit_id` points to itself (e.g., unit `100` has `administrative_unit_id = 100`), indicating that the units are currently at the top level of the hierarchy with no parent units. This view would become more informative as the hierarchy deepens, with child units referencing their parent unit's `id`.

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

This view answers: "Which person holds each administrative role?" It joins `administrative_roles` to `persons` on `administrative_roles.person_id = persons.person_id`. The result pairs each role with the person who occupies it. For example, the role "Distributed Standard" (role_id `2933463`, level `vice_president`) is held by "George Bernard Shaw" (email `primary-email-70`, status `active`). The role "Adaptive Framework D" (role_id `id_3`, level `associate_vice_president`) is held by "Maria Rodriguez" (email `adaptive-email-71`, status `inactive`). This view materializes the role-to-person assignment stored as the `person_id` foreign key in `administrative_roles`.

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

This view answers: "In which administrative unit does each role reside?" It joins `administrative_roles` to `administrative_units` on `administrative_roles.administrative_unit_id = administrative_units.id`. The result pairs each role with its host unit's identifier, name, and type. For instance, the role "Distributed Standard" (role_id `2933463`) resides in unit "Compact Series" (id `100`, type `department`), and the role "Adaptive Framework D" (role_id `id_3`) resides in unit "Legacy Assessment" (id `101`, type `office`). This view materializes the role-to-unit assignment stored as the `administrative_unit_id` foreign key in `administrative_roles`.

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

This view answers: "What administrative role does each person occupy?" It joins `persons` to `administrative_roles` on `persons.role_id = administrative_roles.role_id`. The result pairs each person with their role's identifier, title, and level. For example, "George Bernard Shaw" (status `active`, hired `2023-06-01`) holds the role "Distributed Standard" (role_id `2933463`, level `vice_president`). "Maria Rodriguez" (status `inactive`, hired `2024-11-12`) holds the role "Adaptive Framework D" (role_id `id_3`, level `associate_vice_president`). This view materializes the person-to-role assignment stored as the `role_id` foreign key in `persons`.

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

This view answers: "How do persons report to one another?" It performs a self-join on `persons` where `persons.reports_to_person_id = supervisor.person_id`. The result reveals the reporting chain among personnel. In the sample data, each person's `reports_to_person_id` points to themselves (e.g., "George Bernard Shaw" reports to "George Bernard Shaw"), indicating a flat reporting structure where no person reports to another. This view would become more informative as the reporting hierarchy deepens, with subordinate persons referencing their supervisor's `person_id`.

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

This view answers: "Which administrative unit delivers each service function?" It joins `service_functions` to `administrative_units` on `service_functions.administrative_unit_id = administrative_units.id`. The result pairs each service function with its delivering unit's identifier, name, and type. For example, the function "Integrated Protocol A" (category `financial`, level `essential`) is delivered by unit "Compact Series" (id `100`, type `department`). The function "Extended Programme" (category `human_resources`, level `support`) is delivered by unit "Legacy Assessment" (id `101`, type `office`). This view materializes the service-function-to-unit assignment stored as the `administrative_unit_id` foreign key in `service_functions`.

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

This view answers: "Which stakeholder group benefits from each service function?" It joins `service_functions` to `stakeholder_groups` on `service_functions.stakeholder_group_id = stakeholder_groups.id`. The result pairs each service function with its beneficiary group's identifier, code, name, and type. For instance, the function "Integrated Protocol A" serves stakeholder group "Julian Brown" (id `1`, code `168543`, type `students`), and the function "Extended Programme" serves "Devin Wise" (id `2`, code `2087746`, type `faculty`). This view materializes the service-function-to-stakeholder assignment stored as the `stakeholder_group_id` foreign key in `service_functions`.

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

This view answers: "What service function does each stakeholder group receive?" It joins `stakeholder_groups` to `service_functions` on `stakeholder_groups.service_function_id = service_functions.id`. The result pairs each stakeholder group with its service function's identifier, name, and category. For example, stakeholder group "Julian Brown" (type `students`, eligible `true`) receives the function "Integrated Protocol A" (category `financial`, level `essential`). Stakeholder group "Devin Wise" (type `faculty`, eligible `false`) receives "Extended Programme" (category `human_resources`, level `support`). This view materializes the stakeholder-to-service assignment stored as the `service_function_id` foreign key in `stakeholder_groups`.

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

This view answers: "Which administrative unit manages each stakeholder group?" It joins `stakeholder_groups` to `administrative_units` on `stakeholder_groups.administrative_unit_id = administrative_units.id`. The result pairs each stakeholder group with its managing unit's identifier, name, and type. For instance, stakeholder group "Julian Brown" (id `1`) is managed by unit "Compact Series" (id `100`, type `department`), and stakeholder group "Devin Wise" (id `2`) is managed by unit "Legacy Assessment" (id `101`, type `office`). This view materializes the stakeholder-to-unit assignment stored as the `administrative_unit_id` foreign key in `stakeholder_groups`.

### Synthesis

The relational schema presented here is a direct materialization of an ontology that distinguishes five entity types — administrative units, administrative roles, persons, service functions, and stakeholder groups — and the relationships between them. Each entity type is represented by a base table whose columns encode the entity's attributes, with surrogate or business identifiers serving as primary keys and foreign keys encoding the cardinality-bounded relationships. Self-referential foreign keys in `administrative_units`, `administrative_roles`, and `persons` enable hierarchical and reporting structures that can grow beyond the flat configuration visible in the sample data. The twelve views reconstruct domain facts by joining these normalized tables, each view answering a specific analytical question about the relationships between entities. The join conditions are straightforward equality predicates on the foreign key columns, and the resulting views provide a denormalized, query-ready representation of the domain without duplicating data. This architecture — base tables for persistence and integrity, views for analytical access — is a standard and well-understood pattern in relational database design, and it faithfully reflects the structure of the underlying ontology.