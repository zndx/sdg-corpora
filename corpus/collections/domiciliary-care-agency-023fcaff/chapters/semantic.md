The domiciliary care sector in the United Kingdom is a tightly regulated ecosystem in which registered organisations deliver personalised home-based support to individuals who cannot independently manage daily living. The data model captures three interlocking concerns: the governance and compliance of care providers, the regulatory inspection lifecycle that evaluates those providers, and the operational delivery of care through plans, recipients, and staff. Every entity is anchored by a surrogate primary key, while business identifiers such as registration numbers, inspection codes, and plan IDs provide human-readable traceability across the system.

## Provider Governance and Regulatory Oversight

The backbone of the model is the `domiciliary_care_agencies` table, which records each care organisation as a single row. Its surrogate key `domiciliary_care_agency_id` (values 100 through 103) is the central join hub for the entire schema. Each agency carries a `registration_number` such as `REG-2136` for Adaptive Model, a `legal_name`, a `physical_address` like `pilot-physical-98`, a `telephone` field, a `website`, and an `operational_status` that takes one of three values: `active`, `suspended`, or `closed`. The row for Adaptive Model (id 100) is `active`, while Primary Cluster (id 101) is `suspended` and Composite Review D (id 102) is `closed`. Two timestamp columns, `created_at` and `updated_at`, track the lifecycle of each record.

**Table `domiciliary_care_agencies`**

| domiciliary_care_agency_id | registration_number | legal_name | physical_address | telephone | website | operational_status | registered_manager_id | regulatory_inspection_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|
| 100 | REG-2136 | Adaptive Model | pilot-physical-98 | adaptive-telephon-23 | https://bugs.launchpad.net/murano/+bug/1294080 | active | 1 | 1000 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 101 | REG-2142 | Primary Cluster | extended-physical-99 | distributed-telephon-24 | https://bugs.launchpad.net/murano/+bug/1294080 | suspended | 2 | 1001 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 102 | REG-2148 | Composite Review D | integrated-physical-100 | baseline-telephon-25 | https://www.nature.com/articles/nphoton.2008.245 | closed | 3 | 1002 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 103 | REG-2154 | Compact Initiative | seasonal-physical-101 | pilot-telephon-26 | https://bugs.launchpad.net/trove/+bug/1347114 | active | 4 | 1003 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Every agency is assigned exactly one registered manager, modelled as a foreign key `registered_manager_id` in `domiciliary_care_agencies` that references `registered_managers.registered_manager_id`. The `registered_managers` table stores the manager's internal `manager_id` (a string such as `id_23` or the UUID `f208f470-8fcd-11eb-924d-9cd76263cbd0`), their `full_name` (for example, Theodore Mcgrath or Norma Fisher), the `registration_date` of their regulatory appointment, and a `legal_responsibility_scope` column that is either `full` or `partial`. The `registered_managers` table itself holds a reverse foreign key `domiciliary_care_agency_id`, creating a one-to-one linkage between manager and agency.

**Table `registered_managers`**

| registered_manager_id | manager_id | full_name | registration_date | legal_responsibility_scope | domiciliary_care_agency_id |
|---|---|---|---|---|---|
| 1 | id_23 | Theodore Mcgrath | 2023-06-19T17:27:00 | full | 100 |
| 2 | 10449531 | Account Name | 2024-11-03T00:44:00 | partial | 101 |
| 3 | 659 | Saipan International Airport | 2025-04-14T07:01:00 | full | 102 |
| 4 | f208f470-8fcd-11eb-924d-9cd76263cbd0 | Norma Fisher | 2022-09-25T14:18:00 | partial | 103 |

Regulatory oversight is captured through the `regulatory_inspections` table, which is linked to `domiciliary_care_agencies` via the `regulatory_inspection_id` foreign key stored in the agencies table. Each inspection row carries an `inspection_id` (such as `BJanecke` or `575199`), an `inspection_date`, a `publication_date`, a `notice_period` expressed as an integer (9, 13, 17, or 21 days), an `inspection_type` of either `announced` or `unannounced`, and an `overall_compliance_status` that is `compliant`, `non-compliant`, or `partially compliant`. The inspection for Adaptive Model (id 1000) was announced with a notice period of 9 days and resulted in a compliant status, whereas the inspection for Primary Cluster (id 1001) was unannounced with a 13-day notice and yielded non-compliant.

**Table `regulatory_inspections`**

| regulatory_inspection_id | inspection_id | inspection_date | publication_date | notice_period | inspection_type | overall_compliance_status | domiciliary_care_agency_id | service_rating_id |
|---|---|---|---|---|---|---|---|---|
| 1000 | BJanecke | 2025-12-03T23:09:00 | 2025-12-01 | 9 | announced | compliant | 100 | 1000 |
| 1001 | 575199 | 2022-05-14T06:26:00 | 2022-05-12 | 13 | unannounced | non-compliant | 101 | 1001 |
| 1002 | state_uk_4 | 2023-10-25T13:43:00 | 2023-10-23 | 17 | announced | partially compliant | 102 | 1002 |
| 1003 | 8350011 | 2024-03-09T20:00:00 | 2024-03-07 | 21 | unannounced | compliant | 103 | 1003 |

The outcome of each inspection is further decomposed into five dimension ratings stored in `service_ratings`. The `service_ratings` table is referenced by `regulatory_inspections.service_rating_id`, forming a one-to-one relationship: every inspection has exactly one service rating row. The five rating columns — `safety_rating`, `effectiveness_rating`, `caring_rating`, `responsiveness_rating`, and `well_led_rating` — each take one of three ordinal values: `Good`, `Requires Improvement`, or `Inadequate`. For inspection 1000, all five ratings are `Good`; for inspection 1002 (Composite Review D), all five are `Inadequate`; and for inspection 1001 (Primary Cluster), all five are `Requires Improvement`.

**Table `service_ratings`**

| service_rating_id | rating_id | safety_rating | effectiveness_rating | caring_rating | responsiveness_rating | well_led_rating | regulatory_inspection_id |
|---|---|---|---|---|---|---|---|
| 1000 | 1450640 | Good | Good | Good | Good | Good | 1000 |
| 1001 | 338540 | Requires Improvement | Requires Improvement | Requires Improvement | Requires Improvement | Requires Improvement | 1001 |
| 1002 | 10445621 | Inadequate | Inadequate | Inadequate | Inadequate | Inadequate | 1002 |
| 1003 | 9568460 | Good | Good | Good | Good | Good | 1003 |

## Care Delivery: Plans, Recipients, and Staff

The operational side of the model centres on three tables: `care_plans`, `care_recipients`, and `care_staffs`. A care plan is the primary artefact of service delivery. The `care_plans` table uses a surrogate `id` (1000–1003) as its primary key and stores a human-readable `plan_id` (such as `505977` or `1290`), a `last_review_date`, `dietary_requirements` (e.g., `legacy-dietary-97`), a `medication_regimen` (e.g., `pilot-medicati-68`), and a `risk_assessment_status` that is `current`, `expired`, or `pending`. Each plan is assigned to exactly one care recipient via the foreign key `care_recipient_id`.

**Table `care_plans`**

| id | plan_id | last_review_date | dietary_requirements | medication_regimen | risk_assessment_status | care_recipient_id |
|---|---|---|---|---|---|---|
| 1000 | 505977 | 2022-09-03T08:24:00 | legacy-dietary-97 | pilot-medicati-68 | current | 100 |
| 1001 | 727038 | 2023-02-14T15:41:00 | compact-dietary-98 | extended-medicati-69 | expired | 101 |
| 1002 | 937726 | 2024-07-25T22:58:00 | composite-dietary-99 | integrated-medicati-70 | pending | 102 |
| 1003 | 1290 | 2025-12-09T05:15:00 | primary-dietary-100 | seasonal-medicati-71 | current | 103 |

The `care_recipients` table records the individuals receiving care. Its surrogate `id` (100–103) is the primary key, and it carries a `recipient_id` (such as `b_VB-EC-15` or the long hash `5789a9197ed7473eb37814ca09efb2c8`), a `date_of_birth`, a `mental_capacity_status` of `capable`, `incapable`, or `assessing`, and a `primary_language` field (e.g., `primary-primary-10`). Two foreign keys anchor the recipient to the wider model: `domiciliary_care_agency_id` links the recipient to the agency providing care, and `care_plan_id` links the recipient to their assigned care plan.

**Table `care_recipients`**

| id | recipient_id | date_of_birth | mental_capacity_status | primary_language | domiciliary_care_agency_id | care_plan_id |
|---|---|---|---|---|---|---|
| 100 | b_VB-EC-15 | 2025-04-02 | capable | primary-primary-10 | 100 | 1000 |
| 101 | 1889791 | 2022-09-13 | incapable | adaptive-primary-11 | 101 | 1001 |
| 102 | 4180946 | 2023-02-24 | assessing | distributed-primary-12 | 102 | 1002 |
| 103 | 5789a9197ed7473eb37814ca09efb2c8 | 2024-07-08 | capable | baseline-primary-13 | 103 | 1003 |

The `care_staffs` table stores individual care workers. Its structure mirrors the recipient table with a surrogate `id`, a `staff_id`, a `full_name`, a `role`, and a `domiciliary_care_agency_id` foreign key that associates the staff member with a specific agency.

**Table `care_staffs`**

| care_staff_id | staff_id | security_clearance_status | training_completion_date | employment_status | domiciliary_care_agency_id |
|---|---|---|---|---|---|
| 1 | 937735 | cleared | 2024-11-27 | active | 100 |
| 2 | 3158139 | pending | 2025-04-11 | on_leave | 101 |
| 3 | 8189502 | expired | 2022-09-22 | terminated | 102 |
| 4 | 69438 | cleared | 2023-02-06 | active | 103 |

## Junction Tables and Many-to-Many Relationships

Not all domain relationships are one-to-one. A single care plan may be delivered by multiple staff members, and a single staff member may serve multiple recipients. These many-to-many relationships are resolved through two junction tables.

The `plans_staffs` table breaks the plan-to-staff relationship into pairs of foreign keys: `plan_id` referencing `care_plans.id` and `staff_id` referencing `care_staffs.id`. Each row asserts that a particular staff member is assigned to deliver a particular care plan.

**Table `plans_staffs`**

| care_plan_id | care_staff_id |
|---|---|
| 1000 | 1 |
| 1000 | 2 |
| 1001 | 2 |
| 1001 | 3 |
| 1002 | 3 |
| 1002 | 4 |
| 1003 | 4 |
| 1003 | 1 |

Similarly, the `staffs_recipients` table breaks the staff-to-recipient relationship into pairs of foreign keys: `staff_id` referencing `care_staffs.id` and `recipient_id` referencing `care_recipients.id`. Each row records that a specific care worker is actively serving a specific care recipient.

**Table `staffs_recipients`**

| care_staff_id | care_recipient_id |
|---|---|
| 1 | 100 |
| 1 | 101 |
| 2 | 101 |
| 2 | 102 |
| 3 | 102 |
| 3 | 103 |
| 4 | 103 |
| 4 | 100 |

## Reconstructing Domain Facts Through Views

The normalized schema above is the source of truth, but operational users and downstream applications consume denormalised views that reassemble the facts they need. Each view is a `SELECT` with explicit `JOIN` clauses that trace foreign-key paths back to the base tables.

### Agency–Manager Views

The view `v_domiciliary_care_agency_registered_manager` joins `domiciliary_care_agencies` to `registered_managers` on `domiciliary_care_agencies.registered_manager_id = registered_managers.registered_manager_id`. It answers the question: "Which registered manager is responsible for each agency, and what is their scope of legal responsibility?" A row from this view might show Adaptive Model (registration number `REG-2136`) paired with manager Theodore Mcgrath, whose `legal_responsibility_scope` is `full`.

**View `v_domiciliary_care_agency_registered_manager`**

```sql
CREATE VIEW v_domiciliary_care_agency_registered_manager AS
SELECT a.domiciliary_care_agency_id, a.registration_number, a.legal_name, a.physical_address, b.registered_manager_id AS manager_registered_manager_id, b.manager_id AS manager_manager_id, b.full_name AS manager_full_name
FROM domiciliary_care_agencies a JOIN registered_managers b ON a.registered_manager_id = b.registered_manager_id;
```

| domiciliary_care_agency_id | registration_number | legal_name | physical_address | manager_registered_manager_id | manager_manager_id | manager_full_name |
|---|---|---|---|---|---|---|
| 100 | REG-2136 | Adaptive Model | pilot-physical-98 | 1 | id_23 | Theodore Mcgrath |
| 101 | REG-2142 | Primary Cluster | extended-physical-99 | 2 | 10449531 | Account Name |
| 102 | REG-2148 | Composite Review D | integrated-physical-100 | 3 | 659 | Saipan International Airport |
| 103 | REG-2154 | Compact Initiative | seasonal-physical-101 | 4 | f208f470-8fcd-11eb-924d-9cd76263cbd0 | Norma Fisher |

The inverse view `v_registered_manager_domiciliary_care_agency` performs the same join but presents the data from the manager's perspective, listing each manager alongside the agency they oversee.

**View `v_registered_manager_domiciliary_care_agency`**

```sql
CREATE VIEW v_registered_manager_domiciliary_care_agency AS
SELECT a.registered_manager_id, a.manager_id, a.full_name, a.registration_date, b.domiciliary_care_agency_id AS agency_domiciliary_care_agency_id, b.registration_number AS agency_registration_number, b.legal_name AS agency_legal_name
FROM registered_managers a JOIN domiciliary_care_agencies b ON a.domiciliary_care_agency_id = b.domiciliary_care_agency_id;
```

| registered_manager_id | manager_id | full_name | registration_date | agency_domiciliary_care_agency_id | agency_registration_number | agency_legal_name |
|---|---|---|---|---|---|---|
| 1 | id_23 | Theodore Mcgrath | 2023-06-19T17:27:00 | 100 | REG-2136 | Adaptive Model |
| 2 | 10449531 | Account Name | 2024-11-03T00:44:00 | 101 | REG-2142 | Primary Cluster |
| 3 | 659 | Saipan International Airport | 2025-04-14T07:01:00 | 102 | REG-2148 | Composite Review D |
| 4 | f208f470-8fcd-11eb-924d-9cd76263cbd0 | Norma Fisher | 2022-09-25T14:18:00 | 103 | REG-2154 | Compact Initiative |

### Agency–Inspection Views

The view `v_domiciliary_care_agency_regulatory_inspection` joins `domiciliary_care_agencies` to `regulatory_inspections` on `domiciliary_care_agencies.regulatory_inspection_id = regulatory_inspections.regulatory_inspection_id`. It reconstructs the compliance snapshot for each agency: the inspection date, whether it was announced or unannounced, the notice period, and the overall compliance status. For example, the row for Compact Initiative (id 103) shows inspection `8350011` on `2024-03-09`, unannounced, with a 21-day notice period and a compliant outcome.

**View `v_domiciliary_care_agency_regulatory_inspection`**

```sql
CREATE VIEW v_domiciliary_care_agency_regulatory_inspection AS
SELECT a.domiciliary_care_agency_id, a.registration_number, a.legal_name, a.physical_address, b.regulatory_inspection_id AS inspection_regulatory_inspection_id, b.inspection_id AS inspection_inspection_id, b.inspection_date AS inspection_inspection_date
FROM domiciliary_care_agencies a JOIN regulatory_inspections b ON a.regulatory_inspection_id = b.regulatory_inspection_id;
```

| domiciliary_care_agency_id | registration_number | legal_name | physical_address | inspection_regulatory_inspection_id | inspection_inspection_id | inspection_inspection_date |
|---|---|---|---|---|---|---|
| 100 | REG-2136 | Adaptive Model | pilot-physical-98 | 1000 | BJanecke | 2025-12-03T23:09:00 |
| 101 | REG-2142 | Primary Cluster | extended-physical-99 | 1001 | 575199 | 2022-05-14T06:26:00 |
| 102 | REG-2148 | Composite Review D | integrated-physical-100 | 1002 | state_uk_4 | 2023-10-25T13:43:00 |
| 103 | REG-2154 | Compact Initiative | seasonal-physical-101 | 1003 | 8350011 | 2024-03-09T20:00:00 |

The reverse view `v_regulatory_inspection_domiciliary_care_agency` presents the same join from the inspection's perspective, listing each inspection alongside the agency it evaluated.

**View `v_regulatory_inspection_domiciliary_care_agency`**

```sql
CREATE VIEW v_regulatory_inspection_domiciliary_care_agency AS
SELECT a.regulatory_inspection_id, a.inspection_id, a.inspection_date, a.publication_date, b.domiciliary_care_agency_id AS agency_domiciliary_care_agency_id, b.registration_number AS agency_registration_number, b.legal_name AS agency_legal_name
FROM regulatory_inspections a JOIN domiciliary_care_agencies b ON a.domiciliary_care_agency_id = b.domiciliary_care_agency_id;
```

| regulatory_inspection_id | inspection_id | inspection_date | publication_date | agency_domiciliary_care_agency_id | agency_registration_number | agency_legal_name |
|---|---|---|---|---|---|---|
| 1000 | BJanecke | 2025-12-03T23:09:00 | 2025-12-01 | 100 | REG-2136 | Adaptive Model |
| 1001 | 575199 | 2022-05-14T06:26:00 | 2022-05-12 | 101 | REG-2142 | Primary Cluster |
| 1002 | state_uk_4 | 2023-10-25T13:43:00 | 2023-10-23 | 102 | REG-2148 | Composite Review D |
| 1003 | 8350011 | 2024-03-09T20:00:00 | 2024-03-07 | 103 | REG-2154 | Compact Initiative |

### Inspection–Rating Views

The view `v_regulatory_inspection_service_rating` joins `regulatory_inspections` to `service_ratings` on `regulatory_inspections.service_rating_id = service_ratings.service_rating_id`. It answers: "What were the five-dimensional ratings for a given inspection?" A row might show inspection `BJanecke` (overall compliant) with all five ratings — safety, effectiveness, caring, responsiveness, and well-led — all at `Good`.

**View `v_regulatory_inspection_service_rating`**

```sql
CREATE VIEW v_regulatory_inspection_service_rating AS
SELECT a.regulatory_inspection_id, a.inspection_id, a.inspection_date, a.publication_date, b.service_rating_id AS rating_service_rating_id, b.rating_id AS rating_rating_id, b.safety_rating AS rating_safety_rating
FROM regulatory_inspections a JOIN service_ratings b ON a.service_rating_id = b.service_rating_id;
```

| regulatory_inspection_id | inspection_id | inspection_date | publication_date | rating_service_rating_id | rating_rating_id | rating_safety_rating |
|---|---|---|---|---|---|---|
| 1000 | BJanecke | 2025-12-03T23:09:00 | 2025-12-01 | 1000 | 1450640 | Good |
| 1001 | 575199 | 2022-05-14T06:26:00 | 2022-05-12 | 1001 | 338540 | Requires Improvement |
| 1002 | state_uk_4 | 2023-10-25T13:43:00 | 2023-10-23 | 1002 | 10445621 | Inadequate |
| 1003 | 8350011 | 2024-03-09T20:00:00 | 2024-03-07 | 1003 | 9568460 | Good |

The inverse view `v_service_rating_regulatory_inspection` presents the same data from the rating's perspective.

**View `v_service_rating_regulatory_inspection`**

```sql
CREATE VIEW v_service_rating_regulatory_inspection AS
SELECT a.service_rating_id, a.rating_id, a.safety_rating, a.effectiveness_rating, b.regulatory_inspection_id AS inspection_regulatory_inspection_id, b.inspection_id AS inspection_inspection_id, b.inspection_date AS inspection_inspection_date
FROM service_ratings a JOIN regulatory_inspections b ON a.regulatory_inspection_id = b.regulatory_inspection_id;
```

| service_rating_id | rating_id | safety_rating | effectiveness_rating | inspection_regulatory_inspection_id | inspection_inspection_id | inspection_inspection_date |
|---|---|---|---|---|---|---|
| 1000 | 1450640 | Good | Good | 1000 | BJanecke | 2025-12-03T23:09:00 |
| 1001 | 338540 | Requires Improvement | Requires Improvement | 1001 | 575199 | 2022-05-14T06:26:00 |
| 1002 | 10445621 | Inadequate | Inadequate | 1002 | state_uk_4 | 2023-10-25T13:43:00 |
| 1003 | 9568460 | Good | Good | 1003 | 8350011 | 2024-03-09T20:00:00 |

### Care Plan–Recipient Views

The view `v_care_plan_care_recipient` joins `care_plans` to `care_recipients` on `care_plans.care_recipient_id = care_recipients.id`. It reconstructs the plan-to-recipient assignment, surfacing the recipient's date of birth, mental capacity status, and primary language alongside the plan's dietary requirements and medication regimen. A row might show plan `505977` with dietary requirement `legacy-dietary-97` assigned to recipient `b_VB-EC-15`, who is `capable` and speaks `primary-primary-10`.

**View `v_care_plan_care_recipient`**

```sql
CREATE VIEW v_care_plan_care_recipient AS
SELECT a.id, a.plan_id, a.last_review_date, a.dietary_requirements, b.id AS recipient_id, b.recipient_id AS recipient_recipient_id, b.date_of_birth AS recipient_date_of_birth
FROM care_plans a JOIN care_recipients b ON a.care_recipient_id = b.id;
```

| id | plan_id | last_review_date | dietary_requirements | recipient_id | recipient_recipient_id | recipient_date_of_birth |
|---|---|---|---|---|---|---|
| 1000 | 505977 | 2022-09-03T08:24:00 | legacy-dietary-97 | 100 | b_VB-EC-15 | 2025-04-02 |
| 1001 | 727038 | 2023-02-14T15:41:00 | compact-dietary-98 | 101 | 1889791 | 2022-09-13 |
| 1002 | 937726 | 2024-07-25T22:58:00 | composite-dietary-99 | 102 | 4180946 | 2023-02-24 |
| 1003 | 1290 | 2025-12-09T05:15:00 | primary-dietary-100 | 103 | 5789a9197ed7473eb37814ca09efb2c8 | 2024-07-08 |

The inverse view `v_care_recipient_care_plan` presents the same join from the recipient's perspective.

**View `v_care_recipient_care_plan`**

```sql
CREATE VIEW v_care_recipient_care_plan AS
SELECT a.id, a.recipient_id, a.date_of_birth, a.mental_capacity_status, b.id AS plan_id, b.plan_id AS plan_plan_id, b.last_review_date AS plan_last_review_date
FROM care_recipients a JOIN care_plans b ON a.care_plan_id = b.id;
```

| id | recipient_id | date_of_birth | mental_capacity_status | plan_id | plan_plan_id | plan_last_review_date |
|---|---|---|---|---|---|---|
| 100 | b_VB-EC-15 | 2025-04-02 | capable | 1000 | 505977 | 2022-09-03T08:24:00 |
| 101 | 1889791 | 2022-09-13 | incapable | 1001 | 727038 | 2023-02-14T15:41:00 |
| 102 | 4180946 | 2023-02-24 | assessing | 1002 | 937726 | 2024-07-25T22:58:00 |
| 103 | 5789a9197ed7473eb37814ca09efb2c8 | 2024-07-08 | capable | 1003 | 1290 | 2025-12-09T05:15:00 |

### Agency–Recipient Views

The view `v_care_recipient_domiciliary_care_agency` joins `care_recipients` to `domiciliary_care_agencies` on `care_recipients.domiciliary_care_agency_id = domiciliary_care_agencies.domiciliary_care_agency_id`. It answers: "Which agency is responsible for each care recipient?" A row might show recipient `1889791` (mental capacity: `incapable`) served by Primary Cluster (registration number `REG-2142`, status: `suspended`).

**View `v_care_recipient_domiciliary_care_agency`**

```sql
CREATE VIEW v_care_recipient_domiciliary_care_agency AS
SELECT a.id, a.recipient_id, a.date_of_birth, a.mental_capacity_status, b.domiciliary_care_agency_id AS agency_domiciliary_care_agency_id, b.registration_number AS agency_registration_number, b.legal_name AS agency_legal_name
FROM care_recipients a JOIN domiciliary_care_agencies b ON a.domiciliary_care_agency_id = b.domiciliary_care_agency_id;
```

| id | recipient_id | date_of_birth | mental_capacity_status | agency_domiciliary_care_agency_id | agency_registration_number | agency_legal_name |
|---|---|---|---|---|---|---|
| 100 | b_VB-EC-15 | 2025-04-02 | capable | 100 | REG-2136 | Adaptive Model |
| 101 | 1889791 | 2022-09-13 | incapable | 101 | REG-2142 | Primary Cluster |
| 102 | 4180946 | 2023-02-24 | assessing | 102 | REG-2148 | Composite Review D |
| 103 | 5789a9197ed7473eb37814ca09efb2c8 | 2024-07-08 | capable | 103 | REG-2154 | Compact Initiative |

### Staff–Agency Views

The view `v_care_staff_domiciliary_care_agency` joins `care_staffs` to `domiciliary_care_agencies` on `care_staffs.domiciliary_care_agency_id = domiciliary_care_agencies.domiciliary_care_agency_id`. It reconstructs the staff-to-agency assignment, answering: "Which agency employs each care worker?"

**View `v_care_staff_domiciliary_care_agency`**

```sql
CREATE VIEW v_care_staff_domiciliary_care_agency AS
SELECT a.care_staff_id, a.staff_id, a.security_clearance_status, a.training_completion_date, b.domiciliary_care_agency_id AS agency_domiciliary_care_agency_id, b.registration_number AS agency_registration_number, b.legal_name AS agency_legal_name
FROM care_staffs a JOIN domiciliary_care_agencies b ON a.domiciliary_care_agency_id = b.domiciliary_care_agency_id;
```

| care_staff_id | staff_id | security_clearance_status | training_completion_date | agency_domiciliary_care_agency_id | agency_registration_number | agency_legal_name |
|---|---|---|---|---|---|---|
| 1 | 937735 | cleared | 2024-11-27 | 100 | REG-2136 | Adaptive Model |
| 2 | 3158139 | pending | 2025-04-11 | 101 | REG-2142 | Primary Cluster |
| 3 | 8189502 | expired | 2022-09-22 | 102 | REG-2148 | Composite Review D |
| 4 | 69438 | cleared | 2023-02-06 | 103 | REG-2154 | Compact Initiative |

### Plan–Staff Detail View

The view `v_care_plan_care_staff_detail` joins `care_plans` to `care_staffs` through the `plans_staffs` junction table, using `care_plans.id = plans_staffs.plan_id` and `care_staffs.id = plans_staffs.staff_id`. It answers: "Which staff members are assigned to deliver each care plan?" This view materialises the many-to-many relationship as a flat list of plan–staff pairs, enabling operational queries such as "list all staff assigned to plan `505977`."

**View `v_care_plan_care_staff_detail`**

```sql
CREATE VIEW v_care_plan_care_staff_detail AS
SELECT a.id, a.plan_id, a.last_review_date, b.care_staff_id AS staff_care_staff_id, b.staff_id AS staff_staff_id, b.security_clearance_status AS staff_security_clearance_status
FROM care_plans a
  JOIN plans_staffs j ON j.care_plan_id = a.id
  JOIN care_staffs b ON b.care_staff_id = j.care_staff_id;
```

| id | plan_id | last_review_date | staff_care_staff_id | staff_staff_id | staff_security_clearance_status |
|---|---|---|---|---|---|
| 1000 | 505977 | 2022-09-03T08:24:00 | 1 | 937735 | cleared |
| 1000 | 505977 | 2022-09-03T08:24:00 | 2 | 3158139 | pending |
| 1001 | 727038 | 2023-02-14T15:41:00 | 2 | 3158139 | pending |
| 1001 | 727038 | 2023-02-14T15:41:00 | 3 | 8189502 | expired |
| 1002 | 937726 | 2024-07-25T22:58:00 | 3 | 8189502 | expired |
| 1002 | 937726 | 2024-07-25T22:58:00 | 4 | 69438 | cleared |
| 1003 | 1290 | 2025-12-09T05:15:00 | 4 | 69438 | cleared |
| 1003 | 1290 | 2025-12-09T05:15:00 | 1 | 937735 | cleared |

### Staff–Recipient Detail View

The view `v_care_staff_care_recipient_detail` joins `care_staffs` to `care_recipients` through the `staffs_recipients` junction table, using `care_staffs.id = staffs_recipients.staff_id` and `care_recipients.id = staffs_recipients.recipient_id`. It answers: "Which care recipients is each staff member actively serving?" This view materialises the staff-to-recipient many-to-many relationship as a flat list of staff–recipient pairs.

**View `v_care_staff_care_recipient_detail`**

```sql
CREATE VIEW v_care_staff_care_recipient_detail AS
SELECT a.care_staff_id, a.staff_id, a.security_clearance_status, b.id AS recipient_id, b.recipient_id AS recipient_recipient_id, b.date_of_birth AS recipient_date_of_birth
FROM care_staffs a
  JOIN staffs_recipients j ON j.care_staff_id = a.care_staff_id
  JOIN care_recipients b ON b.id = j.care_recipient_id;
```

| care_staff_id | staff_id | security_clearance_status | recipient_id | recipient_recipient_id | recipient_date_of_birth |
|---|---|---|---|---|---|
| 1 | 937735 | cleared | 100 | b_VB-EC-15 | 2025-04-02 |
| 1 | 937735 | cleared | 101 | 1889791 | 2022-09-13 |
| 2 | 3158139 | pending | 101 | 1889791 | 2022-09-13 |
| 2 | 3158139 | pending | 102 | 4180946 | 2023-02-24 |
| 3 | 8189502 | expired | 102 | 4180946 | 2023-02-24 |
| 3 | 8189502 | expired | 103 | 5789a9197ed7473eb37814ca09efb2c8 | 2024-07-08 |
| 4 | 69438 | cleared | 103 | 5789a9197ed7473eb37814ca09efb2c8 | 2024-07-08 |
| 4 | 69438 | cleared | 100 | b_VB-EC-15 | 2025-04-02 |

## Synthesis

The schema models the domiciliary care domain as a set of core entities — agencies, managers, inspections, ratings, care plans, recipients, and staff — connected by foreign keys that encode one-to-one and one-to-many relationships, and by two junction tables (`plans_staffs` and `staffs_recipients`) that resolve many-to-many associations. Every view is a deterministic reconstruction of a domain fact: it traces the foreign-key path from one entity to another and projects the relevant columns into a single denormalised row. The result is a schema that is both normalised at rest — minimising redundancy and update anomalies — and readily consumable through views that answer the operational questions care regulators and providers actually ask.