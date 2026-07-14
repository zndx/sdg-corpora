A pharmacy benefits management system must track the full lifecycle of a prescription—from the moment an enrollee enrolls in a health plan, through the provider's order, the medication's dispensing, and any follow-up correspondence such as prior-authorization reminders or transition-period notifications. The relational schema models this lifecycle by separating entities into six base tables, four junction tables that resolve many-to-many relationships, and twelve materialized views that reassemble normalized rows into domain-level facts. Every table carries a surrogate primary key (`id` or `_id` suffixed) alongside a business identifier, and foreign keys bind prescriptions to enrollees, providers, medications, and reminder letters. The following sections walk through each entity, its attributes, the cardinality-bounded relationships that become columns and junction tables, and the views that reconstruct the original business questions.

## Entity Types and Their Attributes

The enrollee entity captures who is covered under a health plan. The `enrollees` table stores a surrogate key `id`, a business `enrollee_id` that may be numeric or UUID, the `enrollment_date`, the `plan_name` (for example, *Regional Cluster* or *Seasonal Review D*), a `status` column with values such as `active`, `transitioning`, or `lapsed`, a foreign key `reminder_letter_id` pointing to the `reminder_letters` table, and audit timestamps `created_at` and `updated_at`. Row 1000, for instance, represents enrollee `6564388` who joined the *Regional Cluster* plan on 2022-05-11 and remains `active`.

**Table `enrollees`**

| id | enrollee_id | enrollment_date | plan_name | status | reminder_letter_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|
| 1000 | 6564388 | 2022-05-11 | Regional Cluster | active | 100 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 1001 | 3744022 | 2023-10-22 | Seasonal Review D | transitioning | 101 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 1002 | 97e76936-9bad-11eb-a8a2-19ed5c03f8d3 | 2024-03-06 | Integrated Initiative | lapsed | 102 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 1003 | 10207169 | 2025-08-17 | Extended Model | active | 103 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The prescription entity is the central fact table. The `prescriptions` table holds a surrogate `id`, a business `prescription_id` (a long alphanumeric string such as `ChIJJWXQs_tt5kcRsRRUVT8pPXo`), the `fill_date` as an ISO timestamp, `quantity` (an integer like 9 or 0), a `dosage` descriptor (e.g., *seasonal-dosage-83*), boolean flags `requires_prior_authorization` and `is_non_formulary`, a `schedule` column with controlled-substance values ranging from Schedule II through Schedule V, and three foreign keys: `provider_id`, `medication_id`, and `enrollee_id`, each referencing their respective base tables. A fourth foreign key, `reminder_letter_id`, links the prescription to a follow-up letter.

**Table `prescriptions`**

| id | prescription_id | fill_date | quantity | dosage | requires_prior_authorization | is_non_formulary | schedule | provider_id | medication_id | enrollee_id | reminder_letter_id |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | ChIJJWXQs_tt5kcRsRRUVT8pPXo | 2022-09-05T20:36:00 | 9 | seasonal-dosage-83 | false | true | Schedule II | 1 | 100 | 1000 | 100 |
| 2 | 1336175 | 2023-02-16T03:53:00 | 8 | regional-dosage-84 | true | false | Schedule III | 2 | 101 | 1001 | 101 |
| 3 | 2618572 | 2024-07-27T10:10:00 | 0 | legacy-dosage-85 | false | true | Schedule IV | 3 | 102 | 1002 | 102 |
| 4 | 3717621 | 2025-12-11T17:27:00 | 12 | compact-dosage-86 | true | false | Schedule V | 4 | 103 | 1003 | 103 |

The medication entity describes the pharmaceutical product. The `medications` table uses `medication_id` as its primary key, stores the `brand_name` (such as *The College-Ready Promise* or *Navistar International*), the `generic_name` (e.g., *Distributed Review* or *Primary Model*), a boolean `is_formulary` flag, a numeric `mme_limit` (morphine milligram equivalent ceiling, ranging from 20.45 to 27.80 in the sample data), and the `controlled_substance_schedule` (Schedule I through IV).

**Table `medications`**

| medication_id | brand_name | generic_name | is_formulary | mme_limit | controlled_substance_schedule |
|---|---|---|---|---|---|
| 100 | The College-Ready Promise | Distributed Review | true | 20.45 | Schedule I |
| 101 | General Foods | Adaptive Initiative D | false | 22.90 | Schedule II |
| 102 | Navistar International | Primary Model | true | 25.35 | Schedule III |
| 103 | Root Inc. | Composite Cluster | false | 27.80 | Schedule IV |

The provider entity represents the prescribing clinician or facility. The `providers` table uses `provider_id` as its primary key, stores a `specialty` code (such as *extended-specialt-21* or *regional-specialt-24*), a `contact_number` (the clinician's name, e.g., *Peter Mcdowell* or *Sophia Meyer*), and a `created_at` timestamp.

**Table `providers`**

| provider_id | specialty | contact_number | created_at |
|---|---|---|---|
| 1 | extended-specialt-21 | Peter Mcdowell | 2025-01-01 00:14:00 |
| 2 | integrated-specialt-22 | Sophia Meyer | 2025-02-06 03:14:00 |
| 3 | seasonal-specialt-23 | Carol Gaines | 2025-03-11 06:14:00 |
| 4 | regional-specialt-24 | April Snyder | 2025-04-16 09:14:00 |

The reminder letter entity captures outbound correspondence. The `reminder_letters` table uses `reminder_letter_id` as its primary key, stores a business `letter_id` (which may be numeric like `6564385` or a locale-tagged string like `de_CH`), the `sent_date` as an ISO timestamp, a `reminder_type` column with values `prior_authorization` or `transition_period`, and two foreign keys: `enrollee_id` and `prescription_id`, linking the letter to the recipient and the associated prescription.

**Table `reminder_letters`**

| reminder_letter_id | letter_id | sent_date | reminder_type | enrollee_id | prescription_id |
|---|---|---|---|---|---|
| 100 | 6564385 | 2024-03-12T14:06:00 | prior_authorization | 1000 | 1 |
| 101 | 69428 | 2025-08-23T21:23:00 | transition_period | 1001 | 2 |
| 102 | de_CH | 2022-01-07T04:40:00 | prior_authorization | 1002 | 3 |
| 103 | 4447016 | 2023-06-18T11:57:00 | transition_period | 1003 | 4 |

The transition period entity models a time window during which an enrollee's plan or coverage changes. The `transition_periods` table uses `transition_period_id` as its primary key, stores a business `period_id` (numeric or UUID), `start_date` and `end_date` columns, a `duration_days` integer (38 through 71 in the sample), a `status` column with values `active` or `expired`, a foreign key `enrollee_id`, and audit timestamps `created_at` and `updated_at`.

**Table `transition_periods`**

| transition_period_id | period_id | start_date | end_date | duration_days | status | enrollee_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|
| 1 | 8928510 | 2022-09-05 | 2022-09-01 | 38 | active | 1000 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | 11a34e36-9bac-11eb-a8a2-19ed5c03f8d3 | 2023-02-16 | 2023-02-12 | 49 | expired | 1001 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | 3001009030020 | 2024-07-27 | 2024-07-23 | 60 | active | 1002 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | 195350 | 2025-12-11 | 2025-12-07 | 71 | expired | 1003 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

## Junction Tables and Many-to-Many Relationships

Four junction tables resolve many-to-many relationships that cannot be expressed through simple foreign keys. The `enrollees_prescriptions` junction table links enrollees to prescriptions, allowing a single enrollee to hold multiple prescriptions and a single prescription record to be associated with multiple enrollee entries. The `medications_prescriptions` junction table similarly decouples medications from prescriptions, supporting scenarios where a medication appears across many prescriptions or a prescription references multiple medication entries. The `providers_prescriptions` junction table enables a provider to be associated with multiple prescriptions and a prescription to reference multiple providers (e.g., co-signing). The `periods_prescriptions` junction table links transition periods to prescriptions, allowing a single transition window to cover multiple prescriptions and a single prescription to span multiple transition periods.

**Table `enrollees_prescriptions`**

| enrollee_id | prescription_id |
|---|---|
| 1000 | 1 |
| 1000 | 2 |
| 1001 | 2 |
| 1001 | 3 |
| 1002 | 3 |
| 1002 | 4 |
| 1003 | 4 |
| 1003 | 1 |

**Table `medications_prescriptions`**

| medication_id | prescription_id |
|---|---|
| 100 | 1 |
| 100 | 2 |
| 101 | 2 |
| 101 | 3 |
| 102 | 3 |
| 102 | 4 |
| 103 | 4 |
| 103 | 1 |

**Table `providers_prescriptions`**

| provider_id | prescription_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

**Table `periods_prescriptions`**

| transition_period_id | prescription_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

In addition to these junction tables, the base tables themselves carry foreign keys that enforce one-to-many or many-to-one cardinality. The `prescriptions` table holds `provider_id`, `medication_id`, `enrollee_id`, and `reminder_letter_id` as foreign keys, each pointing to the primary key of the referenced table. The `enrollees` table carries a `reminder_letter_id` foreign key, and the `reminder_letters` table carries both `enrollee_id` and `prescription_id` foreign keys. These keys ensure referential integrity: every prescription must reference a valid provider, medication, enrollee, and reminder letter; every enrollee must reference a valid reminder letter; and every reminder letter must reference a valid enrollee and prescription.

## Views: Reconstructing Domain Facts

Materialized views join the normalized tables back together so that analysts and applications can query domain-level facts without writing multi-table joins repeatedly. Each view answers a specific question about the data.

The `enrollee_prescription_detail_view` joins `enrollees` to `prescriptions` on `enrollee_id`, producing one row per prescription with the enrollee's plan name, status, and enrollment date alongside the prescription's fill date, quantity, dosage, schedule, and authorization flags. A row from this view might show enrollee `6564388` on the *Regional Cluster* plan with an `active` status, paired with prescription `ChIJJWXQs_tt5kcRsRRUVT8pPXo` filled on 2022-09-05, quantity 9, Schedule II, non-formulary, and requiring no prior authorization.

**View `enrollee_prescription_detail_view`**

```sql
CREATE VIEW enrollee_prescription_detail_view AS
SELECT a.id, a.enrollee_id, a.enrollment_date, b.id AS prescription_id, b.prescription_id AS prescription_prescription_id, b.fill_date AS prescription_fill_date
FROM enrollees a
  JOIN enrollees_prescriptions j ON j.enrollee_id = a.id
  JOIN prescriptions b ON b.id = j.prescription_id;
```

| id | enrollee_id | enrollment_date | prescription_id | prescription_prescription_id | prescription_fill_date |
|---|---|---|---|---|---|
| 1000 | 6564388 | 2022-05-11 | 1 | ChIJJWXQs_tt5kcRsRRUVT8pPXo | 2022-09-05T20:36:00 |
| 1000 | 6564388 | 2022-05-11 | 2 | 1336175 | 2023-02-16T03:53:00 |
| 1001 | 3744022 | 2023-10-22 | 2 | 1336175 | 2023-02-16T03:53:00 |
| 1001 | 3744022 | 2023-10-22 | 3 | 2618572 | 2024-07-27T10:10:00 |
| 1002 | 97e76936-9bad-11eb-a8a2-19ed5c03f8d3 | 2024-03-06 | 3 | 2618572 | 2024-07-27T10:10:00 |
| 1002 | 97e76936-9bad-11eb-a8a2-19ed5c03f8d3 | 2024-03-06 | 4 | 3717621 | 2025-12-11T17:27:00 |
| 1003 | 10207169 | 2025-08-17 | 4 | 3717621 | 2025-12-11T17:27:00 |
| 1003 | 10207169 | 2025-08-17 | 1 | ChIJJWXQs_tt5kcRsRRUVT8pPXo | 2022-09-05T20:36:00 |

The `enrollee_reminder_letter_view` joins `enrollees` to `reminder_letters` on `enrollee_id`, answering which reminder letters were sent to which enrollees and when. A row might show enrollee `3744022` receiving a `transition_period` letter (ID `69428`) sent on 2025-08-23.

**View `enrollee_reminder_letter_view`**

```sql
CREATE VIEW enrollee_reminder_letter_view AS
SELECT a.id, a.enrollee_id, a.enrollment_date, a.plan_name, b.reminder_letter_id AS letter_reminder_letter_id, b.letter_id AS letter_letter_id, b.sent_date AS letter_sent_date
FROM enrollees a JOIN reminder_letters b ON a.reminder_letter_id = b.reminder_letter_id;
```

| id | enrollee_id | enrollment_date | plan_name | letter_reminder_letter_id | letter_letter_id | letter_sent_date |
|---|---|---|---|---|---|---|
| 1000 | 6564388 | 2022-05-11 | Regional Cluster | 100 | 6564385 | 2024-03-12T14:06:00 |
| 1001 | 3744022 | 2023-10-22 | Seasonal Review D | 101 | 69428 | 2025-08-23T21:23:00 |
| 1002 | 97e76936-9bad-11eb-a8a2-19ed5c03f8d3 | 2024-03-06 | Integrated Initiative | 102 | de_CH | 2022-01-07T04:40:00 |
| 1003 | 10207169 | 2025-08-17 | Extended Model | 103 | 4447016 | 2023-06-18T11:57:00 |

The `prescription_provider_view` joins `prescriptions` to `providers` on `provider_id`, revealing which provider prescribed which medication and when. A row might show prescription `1336175` filled on 2023-02-16, prescribed by provider `2` (specialty *integrated-specialt-22*, contact *Sophia Meyer*), with quantity 8 and Schedule III classification.

**View `prescription_provider_view`**

```sql
CREATE VIEW prescription_provider_view AS
SELECT a.id, a.prescription_id, a.fill_date, a.quantity, b.provider_id AS provider_provider_id, b.specialty AS provider_specialty, b.contact_number AS provider_contact_number
FROM prescriptions a JOIN providers b ON a.provider_id = b.provider_id;
```

| id | prescription_id | fill_date | quantity | provider_provider_id | provider_specialty | provider_contact_number |
|---|---|---|---|---|---|---|
| 1 | ChIJJWXQs_tt5kcRsRRUVT8pPXo | 2022-09-05T20:36:00 | 9 | 1 | extended-specialt-21 | Peter Mcdowell |
| 2 | 1336175 | 2023-02-16T03:53:00 | 8 | 2 | integrated-specialt-22 | Sophia Meyer |
| 3 | 2618572 | 2024-07-27T10:10:00 | 0 | 3 | seasonal-specialt-23 | Carol Gaines |
| 4 | 3717621 | 2025-12-11T17:27:00 | 12 | 4 | regional-specialt-24 | April Snyder |

The `prescription_medication_view` joins `prescriptions` to `medications` on `medication_id`, answering which medication was dispensed in each prescription and whether it is formulary. A row might show prescription `2618572` filled on 2024-07-27, dispensing medication `102` (*Navistar International* / *Primary Model*), which is formulary with an MME limit of 25.35 and Schedule III classification.

**View `prescription_medication_view`**

```sql
CREATE VIEW prescription_medication_view AS
SELECT a.id, a.prescription_id, a.fill_date, a.quantity, b.medication_id AS medication_medication_id, b.brand_name AS medication_brand_name, b.generic_name AS medication_generic_name
FROM prescriptions a JOIN medications b ON a.medication_id = b.medication_id;
```

| id | prescription_id | fill_date | quantity | medication_medication_id | medication_brand_name | medication_generic_name |
|---|---|---|---|---|---|---|
| 1 | ChIJJWXQs_tt5kcRsRRUVT8pPXo | 2022-09-05T20:36:00 | 9 | 100 | The College-Ready Promise | Distributed Review |
| 2 | 1336175 | 2023-02-16T03:53:00 | 8 | 101 | General Foods | Adaptive Initiative D |
| 3 | 2618572 | 2024-07-27T10:10:00 | 0 | 102 | Navistar International | Primary Model |
| 4 | 3717621 | 2025-12-11T17:27:00 | 12 | 103 | Root Inc. | Composite Cluster |

The `prescription_enrollee_view` joins `prescriptions` to `enrollees` on `enrollee_id`, providing a prescription-centric view of the enrollee's plan details. A row might show prescription `3717621` filled on 2025-12-11, prescribed to enrollee `10207169` on the *Extended Model* plan with `active` status, quantity 12, Schedule V, requiring prior authorization, and non-formulary.

**View `prescription_enrollee_view`**

```sql
CREATE VIEW prescription_enrollee_view AS
SELECT a.id, a.prescription_id, a.fill_date, a.quantity, b.id AS enrollee_id, b.enrollee_id AS enrollee_enrollee_id, b.enrollment_date AS enrollee_enrollment_date
FROM prescriptions a JOIN enrollees b ON a.enrollee_id = b.id;
```

| id | prescription_id | fill_date | quantity | enrollee_id | enrollee_enrollee_id | enrollee_enrollment_date |
|---|---|---|---|---|---|---|
| 1 | ChIJJWXQs_tt5kcRsRRUVT8pPXo | 2022-09-05T20:36:00 | 9 | 1000 | 6564388 | 2022-05-11 |
| 2 | 1336175 | 2023-02-16T03:53:00 | 8 | 1001 | 3744022 | 2023-10-22 |
| 3 | 2618572 | 2024-07-27T10:10:00 | 0 | 1002 | 97e76936-9bad-11eb-a8a2-19ed5c03f8d3 | 2024-03-06 |
| 4 | 3717621 | 2025-12-11T17:27:00 | 12 | 1003 | 10207169 | 2025-08-17 |

The `prescription_reminder_letter_view` joins `prescriptions` to `reminder_letters` on `reminder_letter_id`, answering which reminder letters are associated with which prescriptions. A row might show prescription `1` linked to reminder letter `100` (letter ID `6564385`), a `prior_authorization` type sent on 2024-03-12.

**View `prescription_reminder_letter_view`**

```sql
CREATE VIEW prescription_reminder_letter_view AS
SELECT a.id, a.prescription_id, a.fill_date, a.quantity, b.reminder_letter_id AS letter_reminder_letter_id, b.letter_id AS letter_letter_id, b.sent_date AS letter_sent_date
FROM prescriptions a JOIN reminder_letters b ON a.reminder_letter_id = b.reminder_letter_id;
```

| id | prescription_id | fill_date | quantity | letter_reminder_letter_id | letter_letter_id | letter_sent_date |
|---|---|---|---|---|---|---|
| 1 | ChIJJWXQs_tt5kcRsRRUVT8pPXo | 2022-09-05T20:36:00 | 9 | 100 | 6564385 | 2024-03-12T14:06:00 |
| 2 | 1336175 | 2023-02-16T03:53:00 | 8 | 101 | 69428 | 2025-08-23T21:23:00 |
| 3 | 2618572 | 2024-07-27T10:10:00 | 0 | 102 | de_CH | 2022-01-07T04:40:00 |
| 4 | 3717621 | 2025-12-11T17:27:00 | 12 | 103 | 4447016 | 2023-06-18T11:57:00 |

The `medication_prescription_detail_view` joins `medications` to `prescriptions` on `medication_id`, producing a medication-centric detail view. A row might show medication `100` (*The College-Ready Promise* / *Distributed Review*, formulary, Schedule I, MME limit 20.45) paired with prescription `1` (fill date 2022-09-05, quantity 9, Schedule II, non-formulary, requiring no prior authorization).

**View `medication_prescription_detail_view`**

```sql
CREATE VIEW medication_prescription_detail_view AS
SELECT a.medication_id, a.brand_name, a.generic_name, b.id AS prescription_id, b.prescription_id AS prescription_prescription_id, b.fill_date AS prescription_fill_date
FROM medications a
  JOIN medications_prescriptions j ON j.medication_id = a.medication_id
  JOIN prescriptions b ON b.id = j.prescription_id;
```

| medication_id | brand_name | generic_name | prescription_id | prescription_prescription_id | prescription_fill_date |
|---|---|---|---|---|---|
| 100 | The College-Ready Promise | Distributed Review | 1 | ChIJJWXQs_tt5kcRsRRUVT8pPXo | 2022-09-05T20:36:00 |
| 100 | The College-Ready Promise | Distributed Review | 2 | 1336175 | 2023-02-16T03:53:00 |
| 101 | General Foods | Adaptive Initiative D | 2 | 1336175 | 2023-02-16T03:53:00 |
| 101 | General Foods | Adaptive Initiative D | 3 | 2618572 | 2024-07-27T10:10:00 |
| 102 | Navistar International | Primary Model | 3 | 2618572 | 2024-07-27T10:10:00 |
| 102 | Navistar International | Primary Model | 4 | 3717621 | 2025-12-11T17:27:00 |
| 103 | Root Inc. | Composite Cluster | 4 | 3717621 | 2025-12-11T17:27:00 |
| 103 | Root Inc. | Composite Cluster | 1 | ChIJJWXQs_tt5kcRsRRUVT8pPXo | 2022-09-05T20:36:00 |

The `provider_prescription_detail_view` joins `providers` to `prescriptions` on `provider_id`, answering which prescriptions each provider has written. A row might show provider `3` (specialty *seasonal-specialt-23*, contact *Carol Gaines*) with prescription `2618572` filled on 2024-07-27, quantity 0, Schedule IV, formulary, requiring no prior authorization.

**View `provider_prescription_detail_view`**

```sql
CREATE VIEW provider_prescription_detail_view AS
SELECT a.provider_id, a.specialty, a.contact_number, b.id AS prescription_id, b.prescription_id AS prescription_prescription_id, b.fill_date AS prescription_fill_date
FROM providers a
  JOIN providers_prescriptions j ON j.provider_id = a.provider_id
  JOIN prescriptions b ON b.id = j.prescription_id;
```

| provider_id | specialty | contact_number | prescription_id | prescription_prescription_id | prescription_fill_date |
|---|---|---|---|---|---|
| 1 | extended-specialt-21 | Peter Mcdowell | 1 | ChIJJWXQs_tt5kcRsRRUVT8pPXo | 2022-09-05T20:36:00 |
| 1 | extended-specialt-21 | Peter Mcdowell | 2 | 1336175 | 2023-02-16T03:53:00 |
| 2 | integrated-specialt-22 | Sophia Meyer | 2 | 1336175 | 2023-02-16T03:53:00 |
| 2 | integrated-specialt-22 | Sophia Meyer | 3 | 2618572 | 2024-07-27T10:10:00 |
| 3 | seasonal-specialt-23 | Carol Gaines | 3 | 2618572 | 2024-07-27T10:10:00 |
| 3 | seasonal-specialt-23 | Carol Gaines | 4 | 3717621 | 2025-12-11T17:27:00 |
| 4 | regional-specialt-24 | April Snyder | 4 | 3717621 | 2025-12-11T17:27:00 |
| 4 | regional-specialt-24 | April Snyder | 1 | ChIJJWXQs_tt5kcRsRRUVT8pPXo | 2022-09-05T20:36:00 |

The `reminder_letter_enrollee_view` joins `reminder_letters` to `enrollees` on `enrollee_id`, answering which enrollees received which reminder letters. A row might show reminder letter `102` (letter ID `de_CH`, `prior_authorization` type, sent 2022-01-07) addressed to enrollee `97e76936-9bad-11eb-a8a2-19ed5c03f8d3` on the *Integrated Initiative* plan with `lapsed` status.

**View `reminder_letter_enrollee_view`**

```sql
CREATE VIEW reminder_letter_enrollee_view AS
SELECT a.reminder_letter_id, a.letter_id, a.sent_date, a.reminder_type, b.id AS enrollee_id, b.enrollee_id AS enrollee_enrollee_id, b.enrollment_date AS enrollee_enrollment_date
FROM reminder_letters a JOIN enrollees b ON a.enrollee_id = b.id;
```

| reminder_letter_id | letter_id | sent_date | reminder_type | enrollee_id | enrollee_enrollee_id | enrollee_enrollment_date |
|---|---|---|---|---|---|---|
| 100 | 6564385 | 2024-03-12T14:06:00 | prior_authorization | 1000 | 6564388 | 2022-05-11 |
| 101 | 69428 | 2025-08-23T21:23:00 | transition_period | 1001 | 3744022 | 2023-10-22 |
| 102 | de_CH | 2022-01-07T04:40:00 | prior_authorization | 1002 | 97e76936-9bad-11eb-a8a2-19ed5c03f8d3 | 2024-03-06 |
| 103 | 4447016 | 2023-06-18T11:57:00 | transition_period | 1003 | 10207169 | 2025-08-17 |

The `reminder_letter_prescription_view` joins `reminder_letters` to `prescriptions` on `prescription_id`, answering which prescriptions triggered which reminder letters. A row might show reminder letter `103` (letter ID `4447016`, `transition_period` type, sent 2023-06-18) associated with prescription `4` (fill date 2025-12-11, quantity 12, Schedule V, requiring prior authorization, non-formulary).

**View `reminder_letter_prescription_view`**

```sql
CREATE VIEW reminder_letter_prescription_view AS
SELECT a.reminder_letter_id, a.letter_id, a.sent_date, a.reminder_type, b.id AS prescription_id, b.prescription_id AS prescription_prescription_id, b.fill_date AS prescription_fill_date
FROM reminder_letters a JOIN prescriptions b ON a.prescription_id = b.id;
```

| reminder_letter_id | letter_id | sent_date | reminder_type | prescription_id | prescription_prescription_id | prescription_fill_date |
|---|---|---|---|---|---|---|
| 100 | 6564385 | 2024-03-12T14:06:00 | prior_authorization | 1 | ChIJJWXQs_tt5kcRsRRUVT8pPXo | 2022-09-05T20:36:00 |
| 101 | 69428 | 2025-08-23T21:23:00 | transition_period | 2 | 1336175 | 2023-02-16T03:53:00 |
| 102 | de_CH | 2022-01-07T04:40:00 | prior_authorization | 3 | 2618572 | 2024-07-27T10:10:00 |
| 103 | 4447016 | 2023-06-18T11:57:00 | transition_period | 4 | 3717621 | 2025-12-11T17:27:00 |

The `transition_period_enrollee_view` joins `transition_periods` to `enrollees` on `enrollee_id`, answering which enrollees are affected by which transition periods. A row might show transition period `1` (period ID `8928510`, active, 38 days, running from 2022-09-05 to 2022-09-01) affecting enrollee `6564388` on the *Regional Cluster* plan.

**View `transition_period_enrollee_view`**

```sql
CREATE VIEW transition_period_enrollee_view AS
SELECT a.transition_period_id, a.period_id, a.start_date, a.end_date, b.id AS enrollee_id, b.enrollee_id AS enrollee_enrollee_id, b.enrollment_date AS enrollee_enrollment_date
FROM transition_periods a JOIN enrollees b ON a.enrollee_id = b.id;
```

| transition_period_id | period_id | start_date | end_date | enrollee_id | enrollee_enrollee_id | enrollee_enrollment_date |
|---|---|---|---|---|---|---|
| 1 | 8928510 | 2022-09-05 | 2022-09-01 | 1000 | 6564388 | 2022-05-11 |
| 2 | 11a34e36-9bac-11eb-a8a2-19ed5c03f8d3 | 2023-02-16 | 2023-02-12 | 1001 | 3744022 | 2023-10-22 |
| 3 | 3001009030020 | 2024-07-27 | 2024-07-23 | 1002 | 97e76936-9bad-11eb-a8a2-19ed5c03f8d3 | 2024-03-06 |
| 4 | 195350 | 2025-12-11 | 2025-12-07 | 1003 | 10207169 | 2025-08-17 |

The `transition_period_prescription_detail_view` joins `transition_periods` to `prescriptions` through the `periods_prescriptions` junction table, answering which prescriptions fall within which transition periods. A row might show transition period `2` (period ID `11a34e36-9bac-11eb-a8a2-19ed5c03f8d3`, expired, 49 days, running from 2023-02-16 to 2023-02-12) covering prescription `1336175` filled on 2023-02-16, quantity 8, Schedule III, requiring prior authorization, formulary.

**View `transition_period_prescription_detail_view`**

```sql
CREATE VIEW transition_period_prescription_detail_view AS
SELECT a.transition_period_id, a.period_id, a.start_date, b.id AS prescription_id, b.prescription_id AS prescription_prescription_id, b.fill_date AS prescription_fill_date
FROM transition_periods a
  JOIN periods_prescriptions j ON j.transition_period_id = a.transition_period_id
  JOIN prescriptions b ON b.id = j.prescription_id;
```

| transition_period_id | period_id | start_date | prescription_id | prescription_prescription_id | prescription_fill_date |
|---|---|---|---|---|---|
| 1 | 8928510 | 2022-09-05 | 1 | ChIJJWXQs_tt5kcRsRRUVT8pPXo | 2022-09-05T20:36:00 |
| 1 | 8928510 | 2022-09-05 | 2 | 1336175 | 2023-02-16T03:53:00 |
| 2 | 11a34e36-9bac-11eb-a8a2-19ed5c03f8d3 | 2023-02-16 | 2 | 1336175 | 2023-02-16T03:53:00 |
| 2 | 11a34e36-9bac-11eb-a8a2-19ed5c03f8d3 | 2023-02-16 | 3 | 2618572 | 2024-07-27T10:10:00 |
| 3 | 3001009030020 | 2024-07-27 | 3 | 2618572 | 2024-07-27T10:10:00 |
| 3 | 3001009030020 | 2024-07-27 | 4 | 3717621 | 2025-12-11T17:27:00 |
| 4 | 195350 | 2025-12-11 | 4 | 3717621 | 2025-12-11T17:27:00 |
| 4 | 195350 | 2025-12-11 | 1 | ChIJJWXQs_tt5kcRsRRUVT8pPXo | 2022-09-05T20:36:00 |

## Synthesis

The schema models a pharmacy benefits domain through a star-like core centered on `prescriptions`, with six base tables providing entity attributes, four junction tables resolving many-to-many relationships, and twelve views materializing the most common analytical joins. Foreign keys enforce referential integrity at the column level: `prescriptions.provider_id` → `providers.provider_id`, `prescriptions.medication_id` → `medications.medication_id`, `prescriptions.enrollee_id` → `enrollees.id`, and `prescriptions.reminder_letter_id` → `reminder_letters.reminder_letter_id`. The `enrollees.reminder_letter_id` and `reminder_letters.enrollee_id` / `reminder_letters.prescription_id` keys create a bidirectional linkage between enrollees, prescriptions, and their associated correspondence. The junction tables (`enrollees_prescriptions`, `medications_prescriptions`, `providers_prescriptions`, `periods_prescriptions`) allow the same prescription to be associated with multiple enrollees, medications, providers, or transition periods without data duplication. The twelve views then reassemble these normalized pieces into readable, domain-level facts—answering questions about which enrollees received which letters, which providers prescribed which medications, and which prescriptions fall within which transition windows—without requiring the consumer to write the underlying joins.