## Ontology-Grounded Relational Modelling of Municipal Employment and Compliance

The municipal employment ecosystem encompasses a layered governance structure in which elected and appointed officials oversee councils, manage staff, administer payroll, and enforce Fair Labor Standards Act (FLSA) compliance. At the conceptual level, the domain distinguishes four principal entity types—employment appointments, municipal employees, municipal officials, and municipal councils—supplemented by two operational entities, payroll records and FLSA compliance issues, that capture financial and regulatory dimensions of the workforce. Each entity type materialises as a relational table whose columns encode attributes and whose foreign keys encode cardinality-bounded relationships. Views then reassemble these normalised tables into denormalised projections that answer concrete governance questions.

**Table `employment_appointments`**

| id | appointment_id | position_title | appointee_name | term_start_date | term_end_date | nomination_date | approval_status | reappointment_count | municipal_official_id | municipal_council_id | municipal_employee_id |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 2087748 | Extended Model | Regional Initiative | 2022-05-26 | 2025-08-24 | 2025-04-13T15:45:00 | approved | 0 | 100 | 100 | 1 |
| 2 | ChIJJ60m-q5t5kcRMZ9MdM8fVm4 | Pilot Cluster A | Seasonal Model D | 2023-10-10 | 2022-01-08 | 2022-09-24T22:02:00 | rejected | 11 | 101 | 101 | 2 |
| 3 | 2087740 | Baseline Review | Integrated Cluster | 2024-03-21 | 2023-06-19 | 2023-02-08T05:19:00 | pending | 22 | 102 | 102 | 3 |
| 4 | 1250223 | Distributed Initiative | Extended Review | 2025-08-05 | 2024-11-03 | 2024-07-19T12:36:00 | approved | 2 | 103 | 103 | 4 |

The `employment_appointments` table is the central appointment ledger. Its surrogate primary key `id` is an auto-incrementing integer, while `appointment_id` carries a business identifier that may be numeric (e.g. `2087748`) or a Google Place-style string such as `ChIJJ60m-q5t5kcRMZ9MdM8fVm4`. The column `position_title` stores descriptive labels like *Extended Model* or *Pilot Cluster A*, and `appointee_name` names the individual appointed—*Regional Initiative*, *Seasonal Model D*, and so on. Temporal attributes `term_start_date` and `term_end_date` bound the appointment window (e.g. `2022-05-26` through `2025-08-24`), while `nomination_date` records the nomination timestamp in ISO-8601 format (`2025-04-13T15:45:00`). The `approval_status` column is a categorical flag taking values `approved`, `rejected`, or `pending`, and `reappointment_count` is an integer tally of prior reappointments, ranging from `0` to `22` in the sample. Three foreign keys anchor the appointment to the governance hierarchy: `municipal_official_id` references `municipal_officials(official_id)`, `municipal_council_id` references `municipal_councils(municipal_council_id)`, and `municipal_employee_id` references `municipal_employees(id)`. Each appointment is thus a ternary fact linking an official, a council, and an employee.

**Table `municipal_employees`**

| id | employee_id | full_name | department | job_title | years_of_service | employment_status | hire_date | municipal_official_id | reports_to_municipal_official_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | Norma Fisher | Theodore Mcgrath | adaptive-departme-89 | Primary Initiative A | 30 | active | 2023-06-01 | 100 | 100 |
| 2 | Tasha Rodriguez | Account Name | distributed-departme-90 | Composite Model | 40 | terminated | 2024-11-12 | 101 | 101 |
| 3 | Theodore Mcgrath | Saipan International Airport | baseline-departme-91 | Compact Cluster | 50 | on_leave | 2025-04-23 | 102 | 102 |
| 4 | Peter Mcdowell | Norma Fisher | pilot-departme-92 | Legacy Review D | 60 | active | 2022-09-07 | 103 | 103 |

The `municipal_employees` table stores the staff roster. Its surrogate key `id` is an integer, while `employee_id` is a business identifier that coincides with `full_name` in the sample data (e.g. *Norma Fisher*, *Tasha Rodriguez*). The `department` column holds synthetic department codes such as `adaptive-departme-89` and `distributed-departme-90`. The `job_title` column carries role descriptors like *Primary Initiative A* and *Composite Model*. `years_of_service` is an integer (values `30`, `40`, `50`, `60`), `employment_status` is a categorical flag (`active`, `terminated`, `on_leave`), and `hire_date` records the start date. Two foreign keys are present: `municipal_official_id` references `municipal_officials(official_id)`, establishing which official supervises the employee, and `reports_to_municipal_official_id` also references `municipal_officials(official_id)`, capturing the reporting chain. In the sample data both foreign keys point to the same official, indicating a direct supervisory relationship.

**Table `municipal_officials`**

| id | official_id | full_name | office_title | term_start_date | term_end_date | party_affiliation | contact_email | municipal_employee_id |
|---|---|---|---|---|---|---|---|---|
| 100 | template_ivacode_pagata_20det50ind | Theodore Mcgrath | Baseline Framework D | 2022-05-26 | 2025-08-24 | primary-party-40 | Christopher Wilson | 1 |
| 101 | ChIJn_8lvThu5kcRAqnJZyb12qA | Account Name | Distributed Protocol | 2023-10-10 | 2022-01-08 | adaptive-party-41 | Charles Larsen | 2 |
| 102 | 9424922 | Saipan International Airport | Adaptive Programme | 2024-03-21 | 2023-06-19 | distributed-party-42 | Mary Alvarez | 3 |
| 103 | 8189502 | Norma Fisher | Primary Standard A | 2025-08-05 | 2024-11-03 | baseline-party-43 | April Snyder | 4 |

The `municipal_officials` table is the authority registry. Its surrogate key `id` is an integer, while `official_id` is the business identifier, which may be a template-style string (`template_ivacode_pagata_20det50ind`), a Google Place ID (`ChIJn_8lvThu5kcRAqnJZyb12qA`), or a numeric code (`9424922`). The `full_name` column stores the official's name (e.g. *Theodore Mcgrath*, *Account Name*), and `office_title` carries the formal title such as *Baseline Framework D* or *Distributed Protocol*. Temporal columns `term_start_date` and `term_end_date` bound the official's term. `party_affiliation` is a categorical string (`primary-party-40`, `adaptive-party-41`, etc.), and `contact_email` stores an email address (e.g. *Christopher Wilson*, *Charles Larsen*). The foreign key `municipal_employee_id` references `municipal_employees(id)`, linking each official to their primary staff liaison.

**Table `municipal_councils`**

| municipal_council_id | council_id | municipality_name | meeting_date | quorum_present | session_type | agenda_items_count |
|---|---|---|---|---|---|---|
| 100 | ae409270-8fcd-11eb-924d-9cd76263cbd0 | Compact Model | 2023-10-23T21:39:00 | true | public | 7 |
| 101 | Bjornfant | Legacy Cluster | 2024-03-07T04:56:00 | false | executive | 1 |
| 102 | 726041 | Regional Review A | 2025-08-18T11:13:00 | true | public | 19 |
| 103 | 2a540c6d30d447058e7e4de6c68c2d6d | Seasonal Initiative | 2022-01-02T18:30:00 | false | executive | 88 |

The `municipal_councils` table records council sessions. Its primary key `municipal_council_id` is an integer that doubles as a foreign key back to `employment_appointments(municipal_council_id)`. The `council_id` column carries a UUID or synthetic identifier (e.g. `ae409270-8fcd-11eb-924d-9cd76263cbd0` or `Bjornfant`). `municipality_name` names the jurisdiction (*Compact Model*, *Legacy Cluster*), and `meeting_date` records the session timestamp. `quorum_present` is a boolean flag, `session_type` is categorical (`public`, `executive`), and `agenda_items_count` is an integer tally of agenda items, ranging from `1` to `88`.

**Table `payroll_records`**

| record_id | pay_period_start | pay_period_end | employee_id | base_salary | overtime_hours | overtime_rate | total_gross_pay | compliance_status | municipal_employee_id | audited_by_municipal_employee_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 10449530 | 2022-01-23 | 2022-09-20 | Norma Fisher | 11.94 | 7.95 | 8.45 | 1,326 | compliant | 1 | 1 |
| 10445619 | 2023-06-07 | 2023-02-04 | Tasha Rodriguez | 29.24 | 10.90 | 12.90 | 763.46 | non_compliant | 2 | 2 |
| 9568457 | 2024-11-18 | 2024-07-15 | Theodore Mcgrath | 19.72 | 13.85 | 17.35 | 0.11 | under_review | 3 | 3 |
| 20743593 | 2025-04-02 | 2025-12-26 | Peter Mcdowell | 25.47 | 16.80 | 21.80 | 1,234 | compliant | 4 | 4 |

The `payroll_records` table captures compensation data. Its surrogate key `record_id` is an integer (e.g. `10449530`, `10445619`). The columns `pay_period_start` and `pay_period_end` define the pay window. `employee_id` stores the employee's name, while `base_salary` is a decimal (e.g. `11.94`, `29.24`). `overtime_hours` and `overtime_rate` are decimals, and `total_gross_pay` is a formatted currency string (`1,326`, `763.46`). The `compliance_status` column is categorical (`compliant`, `non_compliant`, `under_review`). Two foreign keys are present: `municipal_employee_id` references `municipal_employees(id)`, and `audited_by_municipal_employee_id` also references `municipal_employees(id)`, indicating which employee performed the audit.

**Table `f_l_s_a_compliance_issues`**

| id | issue_id | issue_description | discovery_date | resolution_date | affected_department | violation_type | severity_level | municipal_employee_id | municipal_official_id | record_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 5082978 | Baseline Series D | 2024-03-23 | 2024-07-05 | distributed-affected-84 | overtime_calculation | 29 | 1 | 100 | 10449530 |
| 2 | 2bc3c87c-8fcc-11eb-924d-9cd76263cbd0 | Distributed Assessment | 2025-08-07 | 2025-12-16 | baseline-affected-85 | leave_inclusion | 40 | 2 | 101 | 10445619 |
| 3 | 506004 | Adaptive Survey | 2022-01-18 | 2022-05-27 | pilot-affected-86 | pay_rate_error | 51 | 3 | 102 | 9568457 |
| 4 | 57e52fbc-8fcd-11eb-924d-9cd76263cbd0 | Primary Corridor A | 2023-06-02 | 2023-10-11 | extended-affected-87 | overtime_calculation | 62 | 4 | 103 | 20743593 |

The `f_l_s_a_compliance_issues` table logs regulatory violations. Its surrogate key `id` is an integer, and `issue_id` is a business identifier that may be numeric (`5082978`) or a UUID (`2bc3c87c-8fcc-11eb-924d-9cd76263cbd0`). The `issue_description` column stores a label such as *Baseline Series D* or *Distributed Assessment*. `discovery_date` and `resolution_date` are dates marking the issue lifecycle. `affected_department` is a synthetic department code (`distributed-affected-84`), `violation_type` is categorical (`overtime_calculation`, `leave_inclusion`, `pay_rate_error`), and `severity_level` is an integer (`29`, `40`, `51`, `62`). Three foreign keys anchor the issue: `municipal_employee_id` references `municipal_employees(id)`, `municipal_official_id` references `municipal_officials(official_id)`, and `record_id` references `payroll_records(record_id)`, creating a tripartite link between the employee, the overseeing official, and the payroll record in question.

### View Projections

Each view materialises a specific governance question by joining the normalised tables. The following sections interpret the joined result of every view, reading concrete rows as evidence.

**View `v_employment_appointment_municipal_official`**

```sql
CREATE VIEW v_employment_appointment_municipal_official AS
SELECT a.id, a.appointment_id, a.position_title, a.appointee_name, b.id AS official_id, b.official_id AS official_official_id, b.full_name AS official_full_name
FROM employment_appointments a JOIN municipal_officials b ON a.municipal_official_id = b.id;
```

| id | appointment_id | position_title | appointee_name | official_id | official_official_id | official_full_name |
|---|---|---|---|---|---|---|
| 1 | 2087748 | Extended Model | Regional Initiative | 100 | template_ivacode_pagata_20det50ind | Theodore Mcgrath |
| 2 | ChIJJ60m-q5t5kcRMZ9MdM8fVm4 | Pilot Cluster A | Seasonal Model D | 101 | ChIJn_8lvThu5kcRAqnJZyb12qA | Account Name |
| 3 | 2087740 | Baseline Review | Integrated Cluster | 102 | 9424922 | Saipan International Airport |
| 4 | 1250223 | Distributed Initiative | Extended Review | 103 | 8189502 | Norma Fisher |

The view `v_employment_appointment_municipal_official` joins `employment_appointments` to `municipal_officials` on `employment_appointments.municipal_official_id = municipal_officials.official_id`. It answers the question: *Which official is associated with each employment appointment, and what are the appointment's temporal and approval attributes?* A sample row shows appointment `2087748` (position *Extended Model*, appointee *Regional Initiative*, status `approved`) linked to official `template_ivacode_pagata_20det50ind` (Theodore Mcgrath, office title *Baseline Framework D*, party `primary-party-40`). This projection is useful for audit trails that need to trace an appointment back to the overseeing official in a single read.

**View `v_employment_appointment_municipal_council`**

```sql
CREATE VIEW v_employment_appointment_municipal_council AS
SELECT a.id, a.appointment_id, a.position_title, a.appointee_name, b.municipal_council_id AS council_municipal_council_id, b.council_id AS council_council_id, b.municipality_name AS council_municipality_name
FROM employment_appointments a JOIN municipal_councils b ON a.municipal_council_id = b.municipal_council_id;
```

| id | appointment_id | position_title | appointee_name | council_municipal_council_id | council_council_id | council_municipality_name |
|---|---|---|---|---|---|---|
| 1 | 2087748 | Extended Model | Regional Initiative | 100 | ae409270-8fcd-11eb-924d-9cd76263cbd0 | Compact Model |
| 2 | ChIJJ60m-q5t5kcRMZ9MdM8fVm4 | Pilot Cluster A | Seasonal Model D | 101 | Bjornfant | Legacy Cluster |
| 3 | 2087740 | Baseline Review | Integrated Cluster | 102 | 726041 | Regional Review A |
| 4 | 1250223 | Distributed Initiative | Extended Review | 103 | 2a540c6d30d447058e7e4de6c68c2d6d | Seasonal Initiative |

The view `v_employment_appointment_municipal_council` joins `employment_appointments` to `municipal_councils` on `employment_appointments.municipal_council_id = municipal_councils.municipal_council_id`. It answers: *Which council session is tied to each appointment, and what were the session's logistical details?* A sample row pairs appointment `2087748` with council `ae409270-8fcd-11eb-924d-9cd76263cbd0` (municipality *Compact Model*, meeting `2023-10-23T21:39:00`, quorum `true`, session type `public`, `7` agenda items). This view supports governance reporting that correlates appointments with council activity.

**View `v_employment_appointment_municipal_employee`**

```sql
CREATE VIEW v_employment_appointment_municipal_employee AS
SELECT a.id, a.appointment_id, a.position_title, a.appointee_name, b.id AS employee_id, b.employee_id AS employee_employee_id, b.full_name AS employee_full_name
FROM employment_appointments a JOIN municipal_employees b ON a.municipal_employee_id = b.id;
```

| id | appointment_id | position_title | appointee_name | employee_id | employee_employee_id | employee_full_name |
|---|---|---|---|---|---|---|
| 1 | 2087748 | Extended Model | Regional Initiative | 1 | Norma Fisher | Theodore Mcgrath |
| 2 | ChIJJ60m-q5t5kcRMZ9MdM8fVm4 | Pilot Cluster A | Seasonal Model D | 2 | Tasha Rodriguez | Account Name |
| 3 | 2087740 | Baseline Review | Integrated Cluster | 3 | Theodore Mcgrath | Saipan International Airport |
| 4 | 1250223 | Distributed Initiative | Extended Review | 4 | Peter Mcdowell | Norma Fisher |

The view `v_employment_appointment_municipal_employee` joins `employment_appointments` to `municipal_employees` on `employment_appointments.municipal_employee_id = municipal_employees.id`. It answers: *Which employee is linked to each appointment, and what is the employee's departmental and status context?* A sample row links appointment `2087748` to employee `Norma Fisher` (department `adaptive-departme-89`, job title *Primary Initiative A*, `30` years of service, status `active`, hired `2023-06-01`). This view is the operational bridge between appointment records and the HR system.

**View `v_municipal_employee_municipal_official`**

```sql
CREATE VIEW v_municipal_employee_municipal_official AS
SELECT a.id, a.employee_id, a.full_name, a.department, b.id AS official_id, b.official_id AS official_official_id, b.full_name AS official_full_name
FROM municipal_employees a JOIN municipal_officials b ON a.municipal_official_id = b.id;
```

| id | employee_id | full_name | department | official_id | official_official_id | official_full_name |
|---|---|---|---|---|---|---|
| 1 | Norma Fisher | Theodore Mcgrath | adaptive-departme-89 | 100 | template_ivacode_pagata_20det50ind | Theodore Mcgrath |
| 2 | Tasha Rodriguez | Account Name | distributed-departme-90 | 101 | ChIJn_8lvThu5kcRAqnJZyb12qA | Account Name |
| 3 | Theodore Mcgrath | Saipan International Airport | baseline-departme-91 | 102 | 9424922 | Saipan International Airport |
| 4 | Peter Mcdowell | Norma Fisher | pilot-departme-92 | 103 | 8189502 | Norma Fisher |

The view `v_municipal_employee_municipal_official` joins `municipal_employees` to `municipal_officials` on `municipal_employees.municipal_official_id = municipal_officials.official_id`. It answers: *Which official supervises each employee, and what are the official's term and party details?* A sample row shows employee `Norma Fisher` (department `adaptive-departme-89`, job title *Primary Initiative A*) supervised by official `template_ivacode_pagata_20det50ind` (Theodore Mcgrath, office title *Baseline Framework D*, party `primary-party-40`, term `2022-05-26` to `2025-08-24`). This view supports org-chart queries and supervisory accountability reports.

**View `v_municipal_official_municipal_employee`**

```sql
CREATE VIEW v_municipal_official_municipal_employee AS
SELECT a.id, a.official_id, a.full_name, a.office_title, b.id AS employee_id, b.employee_id AS employee_employee_id, b.full_name AS employee_full_name
FROM municipal_officials a JOIN municipal_employees b ON a.municipal_employee_id = b.id;
```

| id | official_id | full_name | office_title | employee_id | employee_employee_id | employee_full_name |
|---|---|---|---|---|---|---|
| 100 | template_ivacode_pagata_20det50ind | Theodore Mcgrath | Baseline Framework D | 1 | Norma Fisher | Theodore Mcgrath |
| 101 | ChIJn_8lvThu5kcRAqnJZyb12qA | Account Name | Distributed Protocol | 2 | Tasha Rodriguez | Account Name |
| 102 | 9424922 | Saipan International Airport | Adaptive Programme | 3 | Theodore Mcgrath | Saipan International Airport |
| 103 | 8189502 | Norma Fisher | Primary Standard A | 4 | Peter Mcdowell | Norma Fisher |

The view `v_municipal_official_municipal_employee` joins `municipal_officials` to `municipal_employees` on `municipal_officials.municipal_employee_id = municipal_employees.id`. It answers the inverse question: *Which employee serves as the primary liaison for each official?* A sample row shows official `template_ivacode_pagata_20det50ind` (Theodore Mcgrath, office title *Baseline Framework D*) linked to employee `Norma Fisher` (department `adaptive-departme-89`, job title *Primary Initiative A`, `30` years of service). This view is useful for workload balancing and liaison assignment audits.

**View `v_payroll_record_municipal_employee`**

```sql
CREATE VIEW v_payroll_record_municipal_employee AS
SELECT a.record_id, a.pay_period_start, a.pay_period_end, a.employee_id, b.id AS employee_id, b.employee_id AS employee_employee_id, b.full_name AS employee_full_name
FROM payroll_records a JOIN municipal_employees b ON a.municipal_employee_id = b.id;
```

| record_id | pay_period_start | pay_period_end | employee_id | employee_id | employee_employee_id | employee_full_name |
|---|---|---|---|---|---|---|
| 10449530 | 2022-01-23 | 2022-09-20 | Norma Fisher | 1 | Norma Fisher | Theodore Mcgrath |
| 10445619 | 2023-06-07 | 2023-02-04 | Tasha Rodriguez | 2 | Tasha Rodriguez | Account Name |
| 9568457 | 2024-11-18 | 2024-07-15 | Theodore Mcgrath | 3 | Theodore Mcgrath | Saipan International Airport |
| 20743593 | 2025-04-02 | 2025-12-26 | Peter Mcdowell | 4 | Peter Mcdowell | Norma Fisher |

The view `v_payroll_record_municipal_employee` joins `payroll_records` to `municipal_employees` on `payroll_records.municipal_employee_id = municipal_employees.id`. It answers: *What is the compensation and compliance status of each employee, and who audited their record?* A sample row shows payroll record `10449530` (pay period `2022-01-23` to `2022-09-20`, base salary `11.94`, overtime `7.95` hours at rate `8.45`, total gross pay `1,326`, status `compliant`) for employee `Norma Fisher` (department `adaptive-departme-89`, job title *Primary Initiative A*), audited by employee `Norma Fisher` (id `1`). This view is the primary payroll reconciliation interface.

**View `v_f_l_s_a_compliance_issue_municipal_employee`**

```sql
CREATE VIEW v_f_l_s_a_compliance_issue_municipal_employee AS
SELECT a.id, a.issue_id, a.issue_description, a.discovery_date, b.id AS employee_id, b.employee_id AS employee_employee_id, b.full_name AS employee_full_name
FROM f_l_s_a_compliance_issues a JOIN municipal_employees b ON a.municipal_employee_id = b.id;
```

| id | issue_id | issue_description | discovery_date | employee_id | employee_employee_id | employee_full_name |
|---|---|---|---|---|---|---|
| 1 | 5082978 | Baseline Series D | 2024-03-23 | 1 | Norma Fisher | Theodore Mcgrath |
| 2 | 2bc3c87c-8fcc-11eb-924d-9cd76263cbd0 | Distributed Assessment | 2025-08-07 | 2 | Tasha Rodriguez | Account Name |
| 3 | 506004 | Adaptive Survey | 2022-01-18 | 3 | Theodore Mcgrath | Saipan International Airport |
| 4 | 57e52fbc-8fcd-11eb-924d-9cd76263cbd0 | Primary Corridor A | 2023-06-02 | 4 | Peter Mcdowell | Norma Fisher |

The view `v_f_l_s_a_compliance_issue_municipal_employee` joins `f_l_s_a_compliance_issues` to `municipal_employees` on `f_l_s_a_compliance_issues.municipal_employee_id = municipal_employees.id`. It answers: *Which employee is affected by each compliance issue, and what are the issue's violation and severity details?* A sample row shows issue `5082978` (description *Baseline Series D*, discovery `2024-03-23`, resolution `2024-07-05`, violation type `overtime_calculation`, severity `29`) affecting employee `Norma Fisher` (department `adaptive-departme-89`, job title *Primary Initiative A*, `30` years of service, status `active`). This view supports department-level compliance dashboards.

**View `v_f_l_s_a_compliance_issue_municipal_official`**

```sql
CREATE VIEW v_f_l_s_a_compliance_issue_municipal_official AS
SELECT a.id, a.issue_id, a.issue_description, a.discovery_date, b.id AS official_id, b.official_id AS official_official_id, b.full_name AS official_full_name
FROM f_l_s_a_compliance_issues a JOIN municipal_officials b ON a.municipal_official_id = b.id;
```

| id | issue_id | issue_description | discovery_date | official_id | official_official_id | official_full_name |
|---|---|---|---|---|---|---|
| 1 | 5082978 | Baseline Series D | 2024-03-23 | 100 | template_ivacode_pagata_20det50ind | Theodore Mcgrath |
| 2 | 2bc3c87c-8fcc-11eb-924d-9cd76263cbd0 | Distributed Assessment | 2025-08-07 | 101 | ChIJn_8lvThu5kcRAqnJZyb12qA | Account Name |
| 3 | 506004 | Adaptive Survey | 2022-01-18 | 102 | 9424922 | Saipan International Airport |
| 4 | 57e52fbc-8fcd-11eb-924d-9cd76263cbd0 | Primary Corridor A | 2023-06-02 | 103 | 8189502 | Norma Fisher |

The view `v_f_l_s_a_compliance_issue_municipal_official` joins `f_l_s_a_compliance_issues` to `municipal_officials` on `f_l_s_a_compliance_issues.municipal_official_id = municipal_officials.official_id`. It answers: *Which official is responsible for overseeing each compliance issue?* A sample row links issue `5082978` (violation type `overtime_calculation`, severity `29`) to official `template_ivacode_pagata_20det50ind` (Theodore Mcgrath, office title *Baseline Framework D*, party `primary-party-40`). This view enables accountability reporting that traces violations back to the responsible official.

**View `v_f_l_s_a_compliance_issue_payroll_record`**

```sql
CREATE VIEW v_f_l_s_a_compliance_issue_payroll_record AS
SELECT a.id, a.issue_id, a.issue_description, a.discovery_date, b.record_id AS record_record_id, b.pay_period_start AS record_pay_period_start, b.pay_period_end AS record_pay_period_end
FROM f_l_s_a_compliance_issues a JOIN payroll_records b ON a.record_id = b.record_id;
```

| id | issue_id | issue_description | discovery_date | record_record_id | record_pay_period_start | record_pay_period_end |
|---|---|---|---|---|---|---|
| 1 | 5082978 | Baseline Series D | 2024-03-23 | 10449530 | 2022-01-23 | 2022-09-20 |
| 2 | 2bc3c87c-8fcc-11eb-924d-9cd76263cbd0 | Distributed Assessment | 2025-08-07 | 10445619 | 2023-06-07 | 2023-02-04 |
| 3 | 506004 | Adaptive Survey | 2022-01-18 | 9568457 | 2024-11-18 | 2024-07-15 |
| 4 | 57e52fbc-8fcd-11eb-924d-9cd76263cbd0 | Primary Corridor A | 2023-06-02 | 20743593 | 2025-04-02 | 2025-12-26 |

The view `v_f_l_s_a_compliance_issue_payroll_record` joins `f_l_s_a_compliance_issues` to `payroll_records` on `f_l_s_a_compliance_issues.record_id = payroll_records.record_id`. It answers: *Which payroll record is implicated by each compliance issue, and what are the financial details?* A sample row connects issue `5082978` (violation type `overtime_calculation`, severity `29`) to payroll record `10449530` (pay period `2022-01-23` to `2022-09-20`, base salary `11.94`, overtime `7.95` hours, total gross pay `1,326`, compliance status `compliant`). This view is critical for financial remediation, as it directly ties regulatory findings to compensation data.

### Synthesis

The schema models municipal employment as a set of six base tables whose foreign keys encode a governance hierarchy: appointments link officials, councils, and employees; employees report to officials; officials have staff liaisons; payroll records compensate employees and are audited by employees; and FLSA compliance issues tie employees, officials, and payroll records together in a tripartite regulatory fact. The seven views reassemble these normalised tables into denormalised projections that answer specific governance questions—linking appointments to officials, councils, and employees; connecting employees to their supervisors and liaisons; and correlating payroll and compliance data with personnel records. This design separates concerns at the storage layer while providing read-optimised views that reconstruct domain facts from the normalised tables, ensuring both data integrity and query efficiency.