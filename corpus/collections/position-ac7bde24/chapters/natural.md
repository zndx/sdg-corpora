## Organizational Governance and Workforce Administration

Every mid-to-large enterprise maintains a living record of its structural anatomy: who holds which role, which department claims ownership, what contractual frameworks govern compensation, and how performance is measured against those frameworks. The dataset under examination captures this ecosystem across six base tables and fourteen derived views, forming a complete picture of position management, employee lifecycle tracking, departmental hierarchy, collective bargaining coverage, and performance evaluation. The records span fictional organizations whose identifiers range from short numeric codes like `14477856` to UUIDs such as `3e41f384-9bac-11eb-a8a2-19ed5c03f8d3`, reflecting a system that accommodates both legacy and modern identifier schemes.

**Table `positions`**

| id | position_id | title | classification | salary_range | approval_date | status | employee_id | supervises_position_id | receives_direction_from_position_id | department_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 14477856 | Compact Initiative | extended-classifi-87 | 27.32 | 2023-10-10T21:27:00 | active | 1 | 1 | 1 | 1 |
| 2 | gd_acc_260002 | Legacy Model | integrated-classifi-88 | 38.08 | 2024-03-21T04:44:00 | vacant | 2 | 2 | 2 | 2 |
| 3 | 3e41f384-9bac-11eb-a8a2-19ed5c03f8d3 | Regional Cluster A | seasonal-classifi-89 | 43.25 | 2025-08-05T11:01:00 | abolished | 3 | 3 | 3 | 3 |
| 4 | 82871 | Seasonal Review | regional-classifi-90 | 29.99 | 2022-01-16T18:18:00 | active | 4 | 4 | 4 | 4 |

The positions table constitutes the central spine of the organizational model. Each row defines a discrete role within the enterprise, identified by a composite of `id` and `position_id`. Titles such as "Compact Initiative" and "Regional Cluster A" describe the functional nature of the role, while the `classification` column assigns a categorical label—`extended-classifi-87`, `integrated-classifi-88`, `seasonal-classifi-89`, and `regional-classifi-90`—that likely drives reporting and compensation logic. The `salary_range` column stores a numeric value, with observed figures of `27.32`, `38.08`, `43.25`, and `29.99`, representing either hourly rates or scaled compensation bands. The `approval_date` field records when the position received formal authorization, ranging from `2022-01-16T18:18:00` to `2025-08-05T11:01:00`. The `status` column tracks the current lifecycle state of the position, with values of `active`, `vacant`, and `abolished` indicating whether the role is filled, open to candidates, or no longer in use. Self-referential relationships are encoded through `employee_id`, which links the position to its incumbent; `supervises_position_id`, which points to subordinate roles; and `receives_direction_from_position_id`, which identifies the supervisory position above. The `department_id` column anchors the position to its home department.

**Table `employees`**

| id | employee_id | first_name | last_name | hire_date | termination_date | employment_status | position_id | supervises_employee_id | department_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | Norma Fisher | Stephanie Collins | Paul Allen | 2023-06-01 | 2022-09-11 | active | 1 | 1 | 1 |
| 2 | Tasha Rodriguez | Janice Johnston | Heather Beasley | 2024-11-12 | 2023-02-22 | terminated | 2 | 2 | 2 |
| 3 | Theodore Mcgrath | Upal Saha | Audrey Taylor | 2025-04-23 | 2024-07-06 | on_leave | 3 | 3 | 3 |
| 4 | Peter Mcdowell | Katherine Snyder | Susan Wagner | 2022-09-07 | 2025-12-17 | active | 4 | 4 | 4 |

The employees table records the human capital that fills these positions. Each row captures an individual through `employee_id`, `first_name`, and `last_name`, with names such as "Norma Fisher," "Tasha Rodriguez," "Theodore Mcgrath," and "Peter Mcdowell" populating the workforce roster. The `hire_date` and `termination_date` fields establish the employment timeline; for instance, Norma Fisher was hired on `2023-06-01` with a recorded termination date of `2022-09-11`, suggesting a data entry anomaly or a retroactive adjustment. The `employment_status` column distinguishes between `active`, `terminated`, and `on_leave` states, providing a quick filter for current versus former staff. The `position_id` column links each employee to their assigned role, while `supervises_employee_id` creates a peer-to-peer reporting hierarchy. The `department_id` column associates the employee with their organizational unit.

**Table `departments`**

| id | department_id | name | code | established_date | status | employee_id | reports_to_department_id |
|---|---|---|---|---|---|---|---|
| 1 | 2087755 | Extended Review | lu_tax_code_template_m_I_4 | 2024-03-27 | active | 1 | 1 |
| 2 | 790483 | Pilot Initiative A | 2986219 | 2025-08-11 | inactive | 2 | 2 |
| 3 | 505978 | Baseline Model | 8928520 | 2022-01-22 | merger_pending | 3 | 3 |
| 4 | id_6 | Distributed Cluster | 195369 | 2023-06-06 | active | 4 | 4 |

Departments represent the structural containers within which positions and employees reside. The `name` column holds descriptive labels such as "Extended Review," "Pilot Initiative A," "Baseline Model," and "Distributed Cluster," while the `code` column provides a machine-readable identifier—`lu_tax_code_template_m_I_4`, `2986219`, `8928520`, and `195369`—for integration with external systems. The `established_date` records when each department was created, with dates spanning from `2022-01-22` to `2025-08-11`. The `status` column tracks departmental health, with values of `active`, `inactive`, and `merger_pending` indicating operational state. The `employee_id` column designates a lead or point of contact, and `reports_to_department_id` establishes a parent-child hierarchy among departments, enabling multi-level organizational charts.

**Table `collective_bargaining_agreements`**

| id | agreement_id | effective_date | expiration_date | union_name | status | employee_id | position_id | administered_by_employee_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 348c2b52-8fcc-11eb-924d-9cd76263cbd0 | 2023-02-14 | 2025-08-18 | Seasonal Programme | active | 1 | 1 | 1 |
| 2 | 4716391 | 2024-07-25 | 2022-01-02 | Integrated Standard | expired | 2 | 2 | 2 |
| 3 | 3001009030180 | 2025-12-09 | 2023-06-13 | Extended Framework D | under_negotiation | 3 | 3 | 3 |
| 4 | d9d925ce-8fcc-11eb-924d-9cd76263cbd0 | 2022-05-20 | 2024-11-24 | Pilot Protocol | active | 4 | 4 | 4 |

Collective bargaining agreements (CBAs) define the contractual frameworks governing compensation, benefits, and working conditions for unionized employees. Each agreement is identified by `agreement_id`, with values ranging from UUIDs like `348c2b52-8fcc-11eb-924d-9cd76263cbd0` to numeric codes such as `4716391` and `3001009030180`. The `effective_date` and `expiration_date` fields establish the validity window of each agreement; for example, the "Seasonal Programme" agreement took effect on `2023-02-14` and expires on `2025-08-18`, while the "Integrated Standard" agreement expired on `2022-01-02`, well before its effective date of `2024-07-25`, indicating a data inconsistency or a retroactive renewal. The `union_name` column identifies the labor organization—`Seasonal Programme`, `Integrated Standard`, `Extended Framework D`, and `Pilot Protocol`—and the `status` column tracks the agreement's lifecycle with values of `active`, `expired`, and `under_negotiation`. The `employee_id` and `position_id` columns link the agreement to covered individuals and roles, while `administered_by_employee_id` designates the union representative or HR administrator responsible for enforcement.

**Table `performance_reviews`**

| review_id | review_date | rating | status | comments | employee_id | conducted_by_employee_id | position_id | collective_bargaining_agreement_id |
|---|---|---|---|---|---|---|---|---|
| 3001009030040 | 2024-11-03T22:54:00 | 24 | scheduled | primary-comments-52 | 1 | 1 | 1 | 1 |
| a001f18c-9bac-11eb-a8a2-19ed5c03f8d3 | 2025-04-14T05:11:00 | 29 | in_progress | adaptive-comments-53 | 2 | 2 | 2 | 2 |
| 3990167 | 2022-09-25T12:28:00 | 34 | completed | distributed-comments-54 | 3 | 3 | 3 | 3 |
| 2bc4a76a-8fcc-11eb-924d-9cd76263cbd0 | 2023-02-09T19:45:00 | 39 | disputed | baseline-comments-55 | 4 | 4 | 4 | 4 |

Performance reviews capture the evaluation of individual employees against their role expectations. Each review is identified by `review_id`, with values including `3001009030040`, `a001f18c-9bac-11eb-a8a2-19ed5c03f8d3`, `3990167`, and `2bc4a76a-8fcc-11eb-924d-9cd76263cbd0`. The `review_date` records when the evaluation occurred, with timestamps such as `2024-11-03T22:54:00` and `2025-04-14T05:11:00`. The `rating` column stores a numeric score—`24`, `29`, `34`, and `39`—which likely maps to a standardized scale used by the organization. The `status` column tracks the review's progression through `scheduled`, `in_progress`, `completed`, and `disputed` states, with the "baseline-comments-55" review marked as disputed, suggesting a formal challenge to the evaluation. The `comments` column contains free-text feedback, with entries like `primary-comments-52` and `adaptive-comments-53`. The `employee_id` column identifies the subject of the review, `conducted_by_employee_id` names the evaluator, `position_id` links the review to the relevant role, and `collective_bargaining_agreement_id` ties the evaluation to the applicable contractual framework.

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

The departments_positions table serves as a junction table that decouples departments from positions, enabling many-to-many relationships. Each row pairs a `department_id` with a `position_id`, and the observed data reveals that positions can belong to multiple departments. For instance, position `1` appears in both department `1` and department `4`, while position `2` spans departments `1` and `2`. This design supports matrix organizational structures where roles may report to multiple managers or serve cross-functional teams.

The following views synthesize these base tables into analytical lenses, each answering a specific operational question.

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

This view joins positions with their incumbent employees, answering the question: "Who currently occupies each role?" A representative row would pair the "Compact Initiative" position (`position_id` `14477856`) with employee `1`, Norma Fisher, whose employment status is `active`. This join enables headcount reporting by position and supports workforce planning by revealing which roles are filled versus vacant.

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

By self-joining the positions table, this view exposes the supervisory hierarchy embedded within the role structure. It answers: "Which positions report to which other positions?" The row for position `14477856` (Compact Initiative) would show that it supervises position `14477856` and receives direction from position `14477856`, indicating a self-referential or top-level role. This view is essential for mapping organizational charts and identifying reporting chains.

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

This view links positions to their home departments, answering: "Which department owns each position?" The "Compact Initiative" position (`14477856`) would appear alongside the "Extended Review" department (`2087755`), establishing the organizational home for the role. This join supports budget allocation, resource planning, and departmental headcount calculations.

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

The inverse of the position-to-employee view, this join answers: "What role does each employee hold?" Employee Norma Fisher (`employee_id` `1`) would be linked to the "Compact Initiative" position (`14477856`), providing a clear mapping from person to responsibility. This view is foundational for access control, role-based permissions, and skills inventory.

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

This self-join on the employees table reveals the peer-to-peer reporting structure. It answers: "Which employees supervise which other employees?" Employee `1`, Norma Fisher, would appear as supervising employee `1`, suggesting a self-reporting or single-employee unit. This view supports org chart generation and workload distribution analysis.

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

By joining employees with their departments, this view answers: "Which department does each employee belong to?" Employee Norma Fisher (`employee_id` `1`) would be associated with the "Extended Review" department (`2087755`), providing a direct link from individual to organizational unit. This join is critical for departmental staffing reports and cost center allocation.

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

This view enriches department records with their associated positions, answering: "What positions exist within each department?" The "Extended Review" department (`2087755`) would list positions `14477856` (Compact Initiative) and `gd_acc_260002` (Legacy Model), reflecting the many-to-many relationship captured in the departments_positions junction table. This view supports departmental capacity planning and role coverage analysis.

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

This join connects departments to their employees, answering: "Which employees work in each department?" The "Extended Review" department (`2087755`) would include employee `1`, Norma Fisher, providing a roster for each organizational unit. This view is essential for team management, communication routing, and departmental performance tracking.

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

The self-join on departments reveals the parent-child hierarchy among organizational units. It answers: "Which departments report to which other departments?" The "Extended Review" department (`2087755`) would show a reporting relationship to department `2087755`, indicating a top-level or standalone unit. This view enables multi-level organizational visualization and consolidated reporting.

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

This view links CBAs to the employees they cover, answering: "Which employees are governed by which collective bargaining agreement?" The "Seasonal Programme" agreement (`348c2b52-8fcc-11eb-924d-9cd76263cbd0`) would be associated with employee `1`, Norma Fisher, establishing the contractual framework for that individual's compensation and working conditions. This view is critical for compliance auditing and benefits administration.

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

By joining CBAs with positions, this view answers: "Which positions fall under which collective bargaining agreement?" The "Seasonal Programme" agreement would cover position `14477856` (Compact Initiative), enabling organizations to verify that all unionized roles have appropriate contractual coverage. This view supports labor relations management and contract compliance.

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

This view connects performance reviews to their subjects, answering: "What evaluations has each employee received?" Employee `1`, Norma Fisher, would be linked to review `3001009030040`, rated `24`, with a status of `scheduled` and comments `primary-comments-52`. This join supports talent management, promotion decisions, and performance trend analysis.

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

By linking reviews to positions, this view answers: "How are specific roles being evaluated?" Review `3001009030040` would be associated with position `14477856` (Compact Initiative), enabling organizations to assess whether certain roles consistently receive high or low ratings. This view supports role benchmarking and position-level performance tracking.

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

This final view ties performance reviews to the collective bargaining agreements that govern them, answering: "How do evaluations align with contractual frameworks?" Review `3001009030040` would be linked to the "Seasonal Programme" agreement (`348c2b52-8fcc-11eb-924d-9cd76263cbd0`), ensuring that performance metrics are evaluated within the appropriate contractual context. This view is essential for labor relations, grievance resolution, and contract compliance verification.

The dataset presents a comprehensive model of organizational governance, where positions serve as the structural anchor, employees provide the human element, departments define the organizational containers, collective bargaining agreements establish the contractual boundaries, and performance reviews measure outcomes against expectations. The junction table and derived views enable flexible querying across these dimensions, supporting everything from headcount reporting to compliance auditing. The presence of self-referential relationships in positions, employees, and departments allows for hierarchical modeling without requiring additional tables, while the many-to-many relationship between departments and positions accommodates matrix organizational structures. Together, these records form a coherent picture of how modern enterprises manage their workforce, structure their operations, and measure their success.