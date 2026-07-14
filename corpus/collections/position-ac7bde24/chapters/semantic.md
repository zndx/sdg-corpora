## Ontology-Grounded Relational Modelling in the Human Resources Domain

The human resources domain captures the interlocking structures of an organization: departments that house work, positions that define what work is done, employees who fill those positions, collective bargaining agreements that govern terms of employment, and performance reviews that assess outcomes. Each of these concepts exists as an entity type in the underlying ontology, and each entity type materializes as a relational table whose columns encode attributes and whose foreign keys encode cardinality-bounded relationships. The tables are normalized to eliminate redundancy; views then reassemble the normalized fragments into domain-level facts through joins. This chapter walks through the materialization step by step, quoting concrete identifiers and values from the data to ground every structural claim.

The five base tables are `positions`, `employees`, `departments`, `collective_bargaining_agreements`, and `performance_reviews`, together with the junction table `departments_positions`. Every table carries a surrogate integer primary key (`id`) and a business-level identifier (`position_id`, `employee_id`, `department_id`, `agreement_id`, or `review_id`) that serves as the stable reference across joins.

**Table `positions`**

| id | position_id | title | classification | salary_range | approval_date | status | employee_id | supervises_position_id | receives_direction_from_position_id | department_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 14477856 | Compact Initiative | extended-classifi-87 | 27.32 | 2023-10-10T21:27:00 | active | 1 | 1 | 1 | 1 |
| 2 | gd_acc_260002 | Legacy Model | integrated-classifi-88 | 38.08 | 2024-03-21T04:44:00 | vacant | 2 | 2 | 2 | 2 |
| 3 | 3e41f384-9bac-11eb-a8a2-19ed5c03f8d3 | Regional Cluster A | seasonal-classifi-89 | 43.25 | 2025-08-05T11:01:00 | abolished | 3 | 3 | 3 | 3 |
| 4 | 82871 | Seasonal Review | regional-classifi-90 | 29.99 | 2022-01-16T18:18:00 | active | 4 | 4 | 4 | 4 |

The `positions` table is the central entity in the organizational ontology. Each row describes a distinct role — a title such as `Compact Initiative` or `Regional Cluster A` — classified under a domain-specific taxonomy (`extended-classifi-87`, `integrated-classifi-88`, `seasonal-classifi-89`, `regional-classifi-90`). The `salary_range` column stores a numeric value (e.g. `27.32`, `38.08`) that anchors the compensation band for the role. The `approval_date` column records when the position was formally approved, using ISO-8601 timestamps like `2023-10-10T21:27:00`. The `status` column constrains the lifecycle state to one of three values: `active`, `vacant`, or `abolished`.

Three self-referencing foreign keys on `positions` encode the supervisory and directional hierarchy within the role graph. The column `employee_id` links the position to the employee who currently occupies it (row 1 maps to employee `1`, row 2 to employee `2`). The column `supervises_position_id` points to the position that this position supervises — a reflexive edge in the role graph. The column `receives_direction_from_position_id` captures the reverse directional dependency. Finally, `department_id` anchors the position to its home department, establishing the first cross-table foreign key.

**Table `employees`**

| id | employee_id | first_name | last_name | hire_date | termination_date | employment_status | position_id | supervises_employee_id | department_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | Norma Fisher | Stephanie Collins | Paul Allen | 2023-06-01 | 2022-09-11 | active | 1 | 1 | 1 |
| 2 | Tasha Rodriguez | Janice Johnston | Heather Beasley | 2024-11-12 | 2023-02-22 | terminated | 2 | 2 | 2 |
| 3 | Theodore Mcgrath | Upal Saha | Audrey Taylor | 2025-04-23 | 2024-07-06 | on_leave | 3 | 3 | 3 |
| 4 | Peter Mcdowell | Katherine Snyder | Susan Wagner | 2022-09-07 | 2025-12-17 | active | 4 | 4 | 4 |

The `employees` table stores the people who occupy positions. Each row carries a surrogate `id`, a business identifier `employee_id`, and two name columns: `first_name` and `last_name`. Representative names in the data include `Norma Fisher` / `Stephanie Collins`, `Tasha Rodriguez` / `Janice Johnston`, `Theodore Mcgrath` / `Upal Saha`, and `Peter Mcdowell` / `Katherine Snyder`. The `hire_date` and `termination_date` columns record the employment timeline using date values such as `2023-06-01` and `2022-09-11`. The `employment_status` column constrains the current state to `active`, `terminated`, or `on_leave`.

The `position_id` column is a foreign key into `positions`, binding each employee to the role they fill. Two self-referencing columns — `supervises_employee_id` and `department_id` — encode the employee-level supervisory chain and the departmental assignment, respectively. The `supervises_employee_id` column creates a reflexive edge in the employee graph, while `department_id` links the employee to their home department.

**Table `departments`**

| id | department_id | name | code | established_date | status | employee_id | reports_to_department_id |
|---|---|---|---|---|---|---|---|
| 1 | 2087755 | Extended Review | lu_tax_code_template_m_I_4 | 2024-03-27 | active | 1 | 1 |
| 2 | 790483 | Pilot Initiative A | 2986219 | 2025-08-11 | inactive | 2 | 2 |
| 3 | 505978 | Baseline Model | 8928520 | 2022-01-22 | merger_pending | 3 | 3 |
| 4 | id_6 | Distributed Cluster | 195369 | 2023-06-06 | active | 4 | 4 |

The `departments` table models the organizational units. Each row has a surrogate `id`, a business identifier `department_id`, a human-readable `name` (e.g. `Extended Review`, `Pilot Initiative A`, `Baseline Model`, `Distributed Cluster`), and a `code` column that stores an organizational code such as `lu_tax_code_template_m_I_4` or `2986219`. The `established_date` column records when the department was created, and the `status` column constrains the lifecycle to `active`, `inactive`, `merger_pending`, or similar states.

The `employee_id` column links a department to a responsible or representative employee, while `reports_to_department_id` creates a reflexive hierarchy edge in the department graph, allowing departments to report to parent departments.

**Table `collective_bargaining_agreements`**

| id | agreement_id | effective_date | expiration_date | union_name | status | employee_id | position_id | administered_by_employee_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 348c2b52-8fcc-11eb-924d-9cd76263cbd0 | 2023-02-14 | 2025-08-18 | Seasonal Programme | active | 1 | 1 | 1 |
| 2 | 4716391 | 2024-07-25 | 2022-01-02 | Integrated Standard | expired | 2 | 2 | 2 |
| 3 | 3001009030180 | 2025-12-09 | 2023-06-13 | Extended Framework D | under_negotiation | 3 | 3 | 3 |
| 4 | d9d925ce-8fcc-11eb-924d-9cd76263cbd0 | 2022-05-20 | 2024-11-24 | Pilot Protocol | active | 4 | 4 | 4 |

The `collective_bargaining_agreements` table captures the legal frameworks governing employment terms. Each row carries a surrogate `id`, a business identifier `agreement_id`, and date columns `effective_date` and `expiration_date` (e.g. `2023-02-14` through `2025-08-18`). The `union_name` column names the union party — `Seasonal Programme`, `Integrated Standard`, `Extended Framework D`, `Pilot Protocol` — and the `status` column constrains the lifecycle to `active`, `expired`, or `under_negotiation`.

Two foreign keys anchor the agreement to the organizational graph: `employee_id` links the agreement to an employee, and `position_id` links it to a position. The `administered_by_employee_id` column creates a reflexive edge pointing to the employee who administers the agreement.

**Table `performance_reviews`**

| review_id | review_date | rating | status | comments | employee_id | conducted_by_employee_id | position_id | collective_bargaining_agreement_id |
|---|---|---|---|---|---|---|---|---|
| 3001009030040 | 2024-11-03T22:54:00 | 24 | scheduled | primary-comments-52 | 1 | 1 | 1 | 1 |
| a001f18c-9bac-11eb-a8a2-19ed5c03f8d3 | 2025-04-14T05:11:00 | 29 | in_progress | adaptive-comments-53 | 2 | 2 | 2 | 2 |
| 3990167 | 2022-09-25T12:28:00 | 34 | completed | distributed-comments-54 | 3 | 3 | 3 | 3 |
| 2bc4a76a-8fcc-11eb-924d-9cd76263cbd0 | 2023-02-09T19:45:00 | 39 | disputed | baseline-comments-55 | 4 | 4 | 4 | 4 |

The `performance_reviews` table records evaluation events. Each row carries a business identifier `review_id`, a timestamp `review_date` (e.g. `2024-11-03T22:54:00`), a numeric `rating` (values such as `24`, `29`, `34`, `39`), a `status` column constrained to `scheduled`, `in_progress`, `completed`, or `disputed`, and a free-text `comments` column (e.g. `primary-comments-52`, `adaptive-comments-53`).

Four foreign keys connect the review to the organizational graph. The `employee_id` column identifies the employee being reviewed. The `conducted_by_employee_id` column identifies the reviewer, creating a reflexive edge in the employee graph. The `position_id` column links the review to the position under evaluation, and the `collective_bargaining_agreement_id` column links it to the governing collective bargaining agreement.

**Table `departments_positions`**

| department_id | position_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

The `departments_positions` table is a junction table that resolves the many-to-many relationship between departments and positions. It contains two columns, `department_id` and `position_id`, each serving as a foreign key into the respective base table. The data shows that department `1` hosts positions `1` and `2`, department `2` hosts positions `2` and `3`, department `3` hosts positions `3` and `4`, and department `4` hosts positions `4` and `1`. This many-to-many structure is necessary because a single position can be shared across departments, and a department can contain multiple positions.

The base tables together form a normalized schema where each entity type is stored once, and relationships are expressed through foreign keys and the junction table. The following views materialize domain-level facts by joining these normalized fragments back together.

**View `vw_position_employee`**

```sql
CREATE VIEW vw_position_employee AS
SELECT a.id, a.position_id, a.title, a.classification, b.id AS employee_id, b.employee_id AS employee_employee_id, b.first_name AS employee_first_name
FROM positions a JOIN employees b ON a.employee_id = b.id;
```

| id | position_id | title | classification | employee_id | employee_employee_id | employee_first_name |
|---|---|---|---|---|---|---|
| 1 | 14477856 | Compact Initiative | extended-classifi-87 | 1 | Norma Fisher | Stephanie Collins |
| 2 | gd_acc_260002 | Legacy Model | integrated-classifi-88 | 2 | Tasha Rodriguez | Janice Johnston |
| 3 | 3e41f384-9bac-11eb-a8a2-19ed5c03f8d3 | Regional Cluster A | seasonal-classifi-89 | 3 | Theodore Mcgrath | Upal Saha |
| 4 | 82871 | Seasonal Review | regional-classifi-90 | 4 | Peter Mcdowell | Katherine Snyder |

The view `vw_position_employee` joins `positions` to `employees` on the `employee_id` column, reconstructing the fact of which employee occupies which position. A row from this view answers the question: "Who holds this role?" Reading row 1 as evidence, the view would show position `14477856` (`Compact Initiative`) occupied by employee `1` (Norma Fisher), with the position classified as `extended-classifi-87` and the employee in `active` status. Row 2 would show position `gd_acc_260002` (`Legacy Model`) occupied by employee `2` (Tasha Rodriguez), classified as `integrated-classifi-88` and in `terminated` status — a fact that signals a mismatch between position occupancy and employment state.

**View `vw_position_position`**

```sql
CREATE VIEW vw_position_position AS
SELECT a.id, a.position_id, a.title, a.classification, b.id AS position_id, b.position_id AS position_position_id, b.title AS position_title
FROM positions a JOIN positions b ON a.supervises_position_id = b.id;
```

| id | position_id | title | classification | position_id | position_position_id | position_title |
|---|---|---|---|---|---|---|
| 1 | 14477856 | Compact Initiative | extended-classifi-87 | 1 | 14477856 | Compact Initiative |
| 2 | gd_acc_260002 | Legacy Model | integrated-classifi-88 | 2 | gd_acc_260002 | Legacy Model |
| 3 | 3e41f384-9bac-11eb-a8a2-19ed5c03f8d3 | Regional Cluster A | seasonal-classifi-89 | 3 | 3e41f384-9bac-11eb-a8a2-19ed5c03f8d3 | Regional Cluster A |
| 4 | 82871 | Seasonal Review | regional-classifi-90 | 4 | 82871 | Seasonal Review |

The view `vw_position_position` performs a self-join on `positions`, linking each position to the position it supervises via `supervises_position_id` and to the position that directs it via `receives_direction_from_position_id`. This view reconstructs the role hierarchy. Row 1 would show position `14477856` supervising position `14477856` (a self-loop) and receiving direction from position `14477856` (also a self-loop), indicating a top-level or isolated role. Row 3 would show position `3e41f384-9bac-11eb-a8a2-19ed5c03f8d3` (`Regional Cluster A`) in a similar self-referential structure, suggesting that the supervisory graph in the sample data is not yet fully populated with cross-role edges.

**View `vw_position_department`**

```sql
CREATE VIEW vw_position_department AS
SELECT a.id, a.position_id, a.title, a.classification, b.id AS department_id, b.department_id AS department_department_id, b.name AS department_name
FROM positions a JOIN departments b ON a.department_id = b.id;
```

| id | position_id | title | classification | department_id | department_department_id | department_name |
|---|---|---|---|---|---|---|
| 1 | 14477856 | Compact Initiative | extended-classifi-87 | 1 | 2087755 | Extended Review |
| 2 | gd_acc_260002 | Legacy Model | integrated-classifi-88 | 2 | 790483 | Pilot Initiative A |
| 3 | 3e41f384-9bac-11eb-a8a2-19ed5c03f8d3 | Regional Cluster A | seasonal-classifi-89 | 3 | 505978 | Baseline Model |
| 4 | 82871 | Seasonal Review | regional-classifi-90 | 4 | id_6 | Distributed Cluster |

The view `vw_position_department` joins `positions` to `departments` on `department_id`, answering the question: "Which department houses this position?" Row 1 would show position `14477856` (`Compact Initiative`) housed in department `2087755` (`Extended Review`), classified as `extended-classifi-87` and in `active` status. Row 4 would show position `82871` (`Seasonal Review`) housed in department `id_6` (`Distributed Cluster`), classified as `regional-classifi-90` and in `active` status. This view is essential for organizational reporting, as it maps every role to its home unit.

**View `vw_employee_position`**

```sql
CREATE VIEW vw_employee_position AS
SELECT a.id, a.employee_id, a.first_name, a.last_name, b.id AS position_id, b.position_id AS position_position_id, b.title AS position_title
FROM employees a JOIN positions b ON a.position_id = b.id;
```

| id | employee_id | first_name | last_name | position_id | position_position_id | position_title |
|---|---|---|---|---|---|---|
| 1 | Norma Fisher | Stephanie Collins | Paul Allen | 1 | 14477856 | Compact Initiative |
| 2 | Tasha Rodriguez | Janice Johnston | Heather Beasley | 2 | gd_acc_260002 | Legacy Model |
| 3 | Theodore Mcgrath | Upal Saha | Audrey Taylor | 3 | 3e41f384-9bac-11eb-a8a2-19ed5c03f8d3 | Regional Cluster A |
| 4 | Peter Mcdowell | Katherine Snyder | Susan Wagner | 4 | 82871 | Seasonal Review |

The view `vw_employee_position` joins `employees` to `positions` on `position_id`, answering the question: "What role does this employee fill?" Row 1 would show employee `1` (Norma Fisher), hired on `2023-06-01` and in `active` status, occupying position `14477856` (`Compact Initiative`) with a salary range of `27.32`. Row 3 would show employee `3` (Theodore Mcgrath), hired on `2025-04-23` and in `on_leave` status, occupying position `3e41f384-9bac-11eb-a8a2-19ed5c03f8d3` (`Regional Cluster A`) with a salary range of `43.25`. This view is the primary lens for workforce planning, as it combines personal and role attributes in a single row.

**View `vw_employee_employee`**

```sql
CREATE VIEW vw_employee_employee AS
SELECT a.id, a.employee_id, a.first_name, a.last_name, b.id AS employee_id, b.employee_id AS employee_employee_id, b.first_name AS employee_first_name
FROM employees a JOIN employees b ON a.supervises_employee_id = b.id;
```

| id | employee_id | first_name | last_name | employee_id | employee_employee_id | employee_first_name |
|---|---|---|---|---|---|---|
| 1 | Norma Fisher | Stephanie Collins | Paul Allen | 1 | Norma Fisher | Stephanie Collins |
| 2 | Tasha Rodriguez | Janice Johnston | Heather Beasley | 2 | Tasha Rodriguez | Janice Johnston |
| 3 | Theodore Mcgrath | Upal Saha | Audrey Taylor | 3 | Theodore Mcgrath | Upal Saha |
| 4 | Peter Mcdowell | Katherine Snyder | Susan Wagner | 4 | Peter Mcdowell | Katherine Snyder |

The view `vw_employee_employee` performs a self-join on `employees`, linking each employee to the employee they supervise via `supervises_employee_id` and to their department via `department_id`. This view reconstructs the employee-level supervisory chain. Row 1 would show employee `1` (Norma Fisher) supervising employee `1` (a self-loop) and belonging to department `1`. Row 4 would show employee `4` (Peter Mcdowell), hired on `2022-09-07` and in `active` status, supervising employee `4` (self-loop) and belonging to department `4`. The self-referential pattern in the sample data suggests the supervisory edges are not yet populated with cross-employee relationships.

**View `vw_employee_department`**

```sql
CREATE VIEW vw_employee_department AS
SELECT a.id, a.employee_id, a.first_name, a.last_name, b.id AS department_id, b.department_id AS department_department_id, b.name AS department_name
FROM employees a JOIN departments b ON a.department_id = b.id;
```

| id | employee_id | first_name | last_name | department_id | department_department_id | department_name |
|---|---|---|---|---|---|---|
| 1 | Norma Fisher | Stephanie Collins | Paul Allen | 1 | 2087755 | Extended Review |
| 2 | Tasha Rodriguez | Janice Johnston | Heather Beasley | 2 | 790483 | Pilot Initiative A |
| 3 | Theodore Mcgrath | Upal Saha | Audrey Taylor | 3 | 505978 | Baseline Model |
| 4 | Peter Mcdowell | Katherine Snyder | Susan Wagner | 4 | id_6 | Distributed Cluster |

The view `vw_employee_department` joins `employees` to `departments` on `department_id`, answering the question: "Which department does this employee belong to?" Row 1 would show employee `1` (Norma Fisher) in department `2087755` (`Extended Review`), classified as `active` with code `lu_tax_code_template_m_I_4`. Row 2 would show employee `2` (Tasha Rodriguez), in `terminated` status, in department `790483` (`Pilot Initiative A`), which itself is in `inactive` status. This view is useful for headcount reporting and departmental composition analysis.

**View `vw_department_position_detail`**

```sql
CREATE VIEW vw_department_position_detail AS
SELECT a.id, a.department_id, a.name, b.id AS position_id, b.position_id AS position_position_id, b.title AS position_title
FROM departments a
  JOIN departments_positions j ON j.department_id = a.id
  JOIN positions b ON b.id = j.position_id;
```

| id | department_id | name | position_id | position_position_id | position_title |
|---|---|---|---|---|---|
| 1 | 2087755 | Extended Review | 1 | 14477856 | Compact Initiative |
| 1 | 2087755 | Extended Review | 2 | gd_acc_260002 | Legacy Model |
| 2 | 790483 | Pilot Initiative A | 2 | gd_acc_260002 | Legacy Model |
| 2 | 790483 | Pilot Initiative A | 3 | 3e41f384-9bac-11eb-a8a2-19ed5c03f8d3 | Regional Cluster A |
| 3 | 505978 | Baseline Model | 3 | 3e41f384-9bac-11eb-a8a2-19ed5c03f8d3 | Regional Cluster A |
| 3 | 505978 | Baseline Model | 4 | 82871 | Seasonal Review |
| 4 | id_6 | Distributed Cluster | 4 | 82871 | Seasonal Review |
| 4 | id_6 | Distributed Cluster | 1 | 14477856 | Compact Initiative |

The view `vw_department_position_detail` joins `departments` to `positions` through the junction table `departments_positions`, answering the question: "Which positions are housed in this department?" This is the most structurally complex view because it traverses the many-to-many relationship. Row 1 would show department `2087755` (`Extended Review`) hosting position `14477856` (`Compact Initiative`, classified as `extended-classifi-87`, salary range `27.32`, status `active`) and position `gd_acc_260002` (`Legacy Model`, classified as `integrated-classifi-88`, salary range `38.08`, status `vacant`). Row 4 would show department `id_6` (`Distributed Cluster`) hosting position `82871` (`Seasonal Review`) and position `14477856` (`Compact Initiative`), demonstrating that positions can span multiple departments.

**View `vw_department_employee`**

```sql
CREATE VIEW vw_department_employee AS
SELECT a.id, a.department_id, a.name, a.code, b.id AS employee_id, b.employee_id AS employee_employee_id, b.first_name AS employee_first_name
FROM departments a JOIN employees b ON a.employee_id = b.id;
```

| id | department_id | name | code | employee_id | employee_employee_id | employee_first_name |
|---|---|---|---|---|---|---|
| 1 | 2087755 | Extended Review | lu_tax_code_template_m_I_4 | 1 | Norma Fisher | Stephanie Collins |
| 2 | 790483 | Pilot Initiative A | 2986219 | 2 | Tasha Rodriguez | Janice Johnston |
| 3 | 505978 | Baseline Model | 8928520 | 3 | Theodore Mcgrath | Upal Saha |
| 4 | id_6 | Distributed Cluster | 195369 | 4 | Peter Mcdowell | Katherine Snyder |

The view `vw_department_employee` joins `departments` to `employees` on `department_id`, answering the question: "Which employees belong to this department?" Row 1 would show department `2087755` (`Extended Review`) containing employee `1` (Norma Fisher, `active`, hired `2023-06-01`). Row 3 would show department `505978` (`Baseline Model`), which is in `merger_pending` status, containing employee `3` (Theodore Mcgrath, `on_leave`, hired `2025-04-23`). This view supports departmental staffing reports and is a direct counterpart to `vw_employee_department`.

**View `vw_department_department`**

```sql
CREATE VIEW vw_department_department AS
SELECT a.id, a.department_id, a.name, a.code, b.id AS department_id, b.department_id AS department_department_id, b.name AS department_name
FROM departments a JOIN departments b ON a.reports_to_department_id = b.id;
```

| id | department_id | name | code | department_id | department_department_id | department_name |
|---|---|---|---|---|---|---|
| 1 | 2087755 | Extended Review | lu_tax_code_template_m_I_4 | 1 | 2087755 | Extended Review |
| 2 | 790483 | Pilot Initiative A | 2986219 | 2 | 790483 | Pilot Initiative A |
| 3 | 505978 | Baseline Model | 8928520 | 3 | 505978 | Baseline Model |
| 4 | id_6 | Distributed Cluster | 195369 | 4 | id_6 | Distributed Cluster |

The view `vw_department_department` performs a self-join on `departments`, linking each department to the department it reports to via `reports_to_department_id`. This view reconstructs the departmental hierarchy. Row 1 would show department `2087755` (`Extended Review`) reporting to department `2087755` (a self-loop), and Row 4 would show department `id_6` (`Distributed Cluster`) reporting to department `id_6` (also a self-loop). The self-referential pattern in the sample data indicates that the departmental reporting hierarchy is not yet populated with cross-department edges.

**View `vw_collective_bargaining_agreement_employee`**

```sql
CREATE VIEW vw_collective_bargaining_agreement_employee AS
SELECT a.id, a.agreement_id, a.effective_date, a.expiration_date, b.id AS employee_id, b.employee_id AS employee_employee_id, b.first_name AS employee_first_name
FROM collective_bargaining_agreements a JOIN employees b ON a.employee_id = b.id;
```

| id | agreement_id | effective_date | expiration_date | employee_id | employee_employee_id | employee_first_name |
|---|---|---|---|---|---|---|
| 1 | 348c2b52-8fcc-11eb-924d-9cd76263cbd0 | 2023-02-14 | 2025-08-18 | 1 | Norma Fisher | Stephanie Collins |
| 2 | 4716391 | 2024-07-25 | 2022-01-02 | 2 | Tasha Rodriguez | Janice Johnston |
| 3 | 3001009030180 | 2025-12-09 | 2023-06-13 | 3 | Theodore Mcgrath | Upal Saha |
| 4 | d9d925ce-8fcc-11eb-924d-9cd76263cbd0 | 2022-05-20 | 2024-11-24 | 4 | Peter Mcdowell | Katherine Snyder |

The view `vw_collective_bargaining_agreement_employee` joins `collective_bargaining_agreements` to `employees` on `employee_id`, answering the question: "Which employee is covered by this agreement?" Row 1 would show agreement `348c2b52-8fcc-11eb-924d-9cd76263cbd0` (`Seasonal Programme`, `active`, effective `2023-02-14` through `2025-08-18`) covering employee `1` (Norma Fisher). Row 4 would show agreement `d9d925ce-8fcc-11eb-924d-9cd76263cbd0` (`Pilot Protocol`, `active`, effective `2022-05-20` through `2024-11-24`) covering employee `4` (Peter Mcdowell). This view is essential for compliance reporting, as it maps each agreement to its covered workforce.

**View `vw_collective_bargaining_agreement_position`**

```sql
CREATE VIEW vw_collective_bargaining_agreement_position AS
SELECT a.id, a.agreement_id, a.effective_date, a.expiration_date, b.id AS position_id, b.position_id AS position_position_id, b.title AS position_title
FROM collective_bargaining_agreements a JOIN positions b ON a.position_id = b.id;
```

| id | agreement_id | effective_date | expiration_date | position_id | position_position_id | position_title |
|---|---|---|---|---|---|---|
| 1 | 348c2b52-8fcc-11eb-924d-9cd76263cbd0 | 2023-02-14 | 2025-08-18 | 1 | 14477856 | Compact Initiative |
| 2 | 4716391 | 2024-07-25 | 2022-01-02 | 2 | gd_acc_260002 | Legacy Model |
| 3 | 3001009030180 | 2025-12-09 | 2023-06-13 | 3 | 3e41f384-9bac-11eb-a8a2-19ed5c03f8d3 | Regional Cluster A |
| 4 | d9d925ce-8fcc-11eb-924d-9cd76263cbd0 | 2022-05-20 | 2024-11-24 | 4 | 82871 | Seasonal Review |

The view `vw_collective_bargaining_agreement_position` joins `collective_bargaining_agreements` to `positions` on `position_id`, answering the question: "Which position is governed by this agreement?" Row 1 would show agreement `348c2b52-8fcc-11eb-924d-9cd76263cbd0` (`Seasonal Programme`) governing position `14477856` (`Compact Initiative`, classified as `extended-classifi-87`, salary range `27.32`). Row 3 would show agreement `3001009030180` (`Extended Framework D`, `under_negotiation`, effective `2025-12-09` through `2023-06-13`) governing position `3e41f384-9bac-11eb-a8a2-19ed5c03f8d3` (`Regional Cluster A`, classified as `seasonal-classifi-89`, salary range `43.25`). This view is critical for labor relations, as it links legal frameworks to the roles they regulate.

**View `vw_performance_review_employee`**

```sql
CREATE VIEW vw_performance_review_employee AS
SELECT a.review_id, a.review_date, a.rating, a.status, b.id AS employee_id, b.employee_id AS employee_employee_id, b.first_name AS employee_first_name
FROM performance_reviews a JOIN employees b ON a.employee_id = b.id;
```

| review_id | review_date | rating | status | employee_id | employee_employee_id | employee_first_name |
|---|---|---|---|---|---|---|
| 3001009030040 | 2024-11-03T22:54:00 | 24 | scheduled | 1 | Norma Fisher | Stephanie Collins |
| a001f18c-9bac-11eb-a8a2-19ed5c03f8d3 | 2025-04-14T05:11:00 | 29 | in_progress | 2 | Tasha Rodriguez | Janice Johnston |
| 3990167 | 2022-09-25T12:28:00 | 34 | completed | 3 | Theodore Mcgrath | Upal Saha |
| 2bc4a76a-8fcc-11eb-924d-9cd76263cbd0 | 2023-02-09T19:45:00 | 39 | disputed | 4 | Peter Mcdowell | Katherine Snyder |

The view `vw_performance_review_employee` joins `performance_reviews` to `employees` on `employee_id`, answering the question: "Which employee received this review?" Row 1 would show review `3001009030040` (rating `24`, status `scheduled`, date `2024-11-03T22:54:00`, comments `primary-comments-52`) for employee `1` (Norma Fisher). Row 4 would show review `2bc4a76a-8fcc-11eb-924d-9cd76263cbd0` (rating `39`, status `disputed`, date `2023-02-09T19:45:00`, comments `baseline-comments-55`) for employee `4` (Peter Mcdowell). This view is the primary lens for performance analytics, as it combines evaluation data with employee identity.

**View `vw_performance_review_position`**

```sql
CREATE VIEW vw_performance_review_position AS
SELECT a.review_id, a.review_date, a.rating, a.status, b.id AS position_id, b.position_id AS position_position_id, b.title AS position_title
FROM performance_reviews a JOIN positions b ON a.position_id = b.id;
```

| review_id | review_date | rating | status | position_id | position_position_id | position_title |
|---|---|---|---|---|---|---|
| 3001009030040 | 2024-11-03T22:54:00 | 24 | scheduled | 1 | 14477856 | Compact Initiative |
| a001f18c-9bac-11eb-a8a2-19ed5c03f8d3 | 2025-04-14T05:11:00 | 29 | in_progress | 2 | gd_acc_260002 | Legacy Model |
| 3990167 | 2022-09-25T12:28:00 | 34 | completed | 3 | 3e41f384-9bac-11eb-a8a2-19ed5c03f8d3 | Regional Cluster A |
| 2bc4a76a-8fcc-11eb-924d-9cd76263cbd0 | 2023-02-09T19:45:00 | 39 | disputed | 4 | 82871 | Seasonal Review |

The view `vw_performance_review_position` joins `performance_reviews` to `positions` on `position_id`, answering the question: "Which position was evaluated in this review?" Row 1 would show review `3001009030040` (rating `24`, status `scheduled`) for position `14477856` (`Compact Initiative`, classified as `extended-classifi-87`, salary range `27.32`). Row 3 would show review `3990167` (rating `34`, status `completed`, date `2022-09-25T12:28:00`) for position `3e41f384-9bac-11eb-a8a2-19ed5c03f8d3` (`Regional Cluster A`, classified as `seasonal-classifi-89`, salary range `43.25`). This view supports position-level performance benchmarking.

**View `vw_performance_review_collective_bargaining_agreement`**

```sql
CREATE VIEW vw_performance_review_collective_bargaining_agreement AS
SELECT a.review_id, a.review_date, a.rating, a.status, b.id AS agreement_id, b.agreement_id AS agreement_agreement_id, b.effective_date AS agreement_effective_date
FROM performance_reviews a JOIN collective_bargaining_agreements b ON a.collective_bargaining_agreement_id = b.id;
```

| review_id | review_date | rating | status | agreement_id | agreement_agreement_id | agreement_effective_date |
|---|---|---|---|---|---|---|
| 3001009030040 | 2024-11-03T22:54:00 | 24 | scheduled | 1 | 348c2b52-8fcc-11eb-924d-9cd76263cbd0 | 2023-02-14 |
| a001f18c-9bac-11eb-a8a2-19ed5c03f8d3 | 2025-04-14T05:11:00 | 29 | in_progress | 2 | 4716391 | 2024-07-25 |
| 3990167 | 2022-09-25T12:28:00 | 34 | completed | 3 | 3001009030180 | 2025-12-09 |
| 2bc4a76a-8fcc-11eb-924d-9cd76263cbd0 | 2023-02-09T19:45:00 | 39 | disputed | 4 | d9d925ce-8fcc-11eb-924d-9cd76263cbd0 | 2022-05-20 |

The view `vw_performance_review_collective_bargaining_agreement` joins `performance_reviews` to `collective_bargaining_agreements` on `collective_bargaining_agreement_id`, answering the question: "Under which collective bargaining agreement was this review conducted?" Row 1 would show review `3001009030040` (rating `24`, status `scheduled`) conducted under agreement `348c2b52-8fcc-11eb-924d-9cd76263cbd0` (`Seasonal Programme`, `active`, effective `2023-02-14` through `2025-08-18`). Row 4 would show review `2bc4a76a-8fcc-11eb-924d-9cd76263cbd0` (rating `39`, status `disputed`) conducted under agreement `d9d925ce-8fcc-11eb-924d-9cd76263cbd0` (`Pilot Protocol`, `active`, effective `2022-05-20` through `2024-11-24`). This view is essential for compliance auditing, as it links evaluation outcomes to the legal frameworks that govern them.

## Synthesis

The relational schema materializes the human resources ontology through a disciplined separation of concerns: each entity type occupies its own table, attributes become columns, and relationships become foreign keys or junction tables. The `positions` table sits at the center of the graph, connected to `employees` (occupancy), `departments` (housing), `collective_bargaining_agreements` (governance), and `performance_reviews` (evaluation). The `departments_positions` junction table resolves the many-to-many relationship between departments and positions, while self-referencing foreign keys on `positions`, `employees`, `departments`, `collective_bargaining_agreements`, and `performance_reviews` encode supervisory and hierarchical edges within each entity type.

The views reassemble these normalized fragments into domain-level facts. Each view answers a specific question by joining the relevant tables: `vw_position_employee` maps roles to occupants, `vw_department_position_detail` maps departments to their positions through the junction table, `vw_performance_review_collective_bargaining_agreement` links evaluations to their governing agreements, and so on. The concrete identifiers and values in the data — position `14477856` (`Compact Initiative`), employee `1` (Norma Fisher), department `2087755` (`Extended Review`), agreement `348c2b52-8fcc-11eb-924d-9cd76263cbd0` (`Seasonal Programme`) — are not arbitrary; they are the stable references that allow the joins to reconstruct the organizational reality from its normalized components.