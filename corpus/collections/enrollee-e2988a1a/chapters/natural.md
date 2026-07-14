## Healthcare Prescription Management and Enrollee Coordination

The healthcare prescription management system tracks the full lifecycle of medication dispensing, from enrollee enrollment through plan transitions, provider authorization, and reminder letter dispatch. At its core, the system maintains a network of interrelated records: people enrolled in health plans, the medications they receive, the providers who prescribe them, and the administrative correspondence that keeps the process on track. Each record carries identifiers that link it to others, forming a coherent picture of who is taking what, from whom, and under which plan conditions.

**Table `enrollees`**

| id | enrollee_id | enrollment_date | plan_name | status | reminder_letter_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|
| 1000 | 6564388 | 2022-05-11 | Regional Cluster | active | 100 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 1001 | 3744022 | 2023-10-22 | Seasonal Review D | transitioning | 101 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 1002 | 97e76936-9bad-11eb-a8a2-19ed5c03f8d3 | 2024-03-06 | Integrated Initiative | lapsed | 102 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 1003 | 10207169 | 2025-08-17 | Extended Model | active | 103 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Enrollees represent the individuals at the center of the system. Each enrollee record carries a unique surrogate `id`, a business-level `enrollee_id` that may be numeric or UUID-formatted, and an `enrollment_date` marking when they joined their plan. The `plan_name` column describes the coverage model—values such as "Regional Cluster," "Seasonal Review D," "Integrated Initiative," and "Extended Model" appear across the dataset. The `status` field tracks whether an enrollee is `active`, `transitioning`, or `lapsed`. A `reminder_letter_id` foreign key ties each enrollee to their most recent administrative correspondence, and `created_at`/`updated_at` timestamps record when the system last touched the record. For example, enrollee 1000 (business ID 6564388) joined the Regional Cluster plan on 2022-05-11 and remains active, while enrollee 1002 (UUID 97e76936-9bad-11eb-a8a2-19ed5c03f8d3) holds an Integrated Initiative plan but has a lapsed status.

**Table `prescriptions`**

| id | prescription_id | fill_date | quantity | dosage | requires_prior_authorization | is_non_formulary | schedule | provider_id | medication_id | enrollee_id | reminder_letter_id |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | ChIJJWXQs_tt5kcRsRRUVT8pPXo | 2022-09-05T20:36:00 | 9 | seasonal-dosage-83 | false | true | Schedule II | 1 | 100 | 1000 | 100 |
| 2 | 1336175 | 2023-02-16T03:53:00 | 8 | regional-dosage-84 | true | false | Schedule III | 2 | 101 | 1001 | 101 |
| 3 | 2618572 | 2024-07-27T10:10:00 | 0 | legacy-dosage-85 | false | true | Schedule IV | 3 | 102 | 1002 | 102 |
| 4 | 3717621 | 2025-12-11T17:27:00 | 12 | compact-dosage-86 | true | false | Schedule V | 4 | 103 | 1003 | 103 |

Prescriptions are the operational heart of the system. Each prescription carries a surrogate `id`, a business `prescription_id` (often a base-64 string), a `fill_date` with full timestamp precision, and a `quantity` of units dispensed. The `dosage` field uses descriptive labels such as "seasonal-dosage-83" or "compact-dosage-86." Boolean flags `requires_prior_authorization` and `is_non_formulary` indicate administrative and formulary constraints, while the `schedule` column classifies the medication under Schedule II through Schedule V controlled-substance categories. Foreign keys `provider_id`, `medication_id`, `enrollee_id`, and `reminder_letter_id` connect each prescription to its source provider, the medication prescribed, the enrollee receiving it, and the associated reminder letter. Prescription 1, for instance, was filled on 2022-09-05, has a quantity of 9, carries a Schedule II classification, requires no prior authorization but is non-formulary, and links to provider 1, medication 100, enrollee 1000, and reminder letter 100.

**Table `medications`**

| medication_id | brand_name | generic_name | is_formulary | mme_limit | controlled_substance_schedule |
|---|---|---|---|---|---|
| 100 | The College-Ready Promise | Distributed Review | true | 20.45 | Schedule I |
| 101 | General Foods | Adaptive Initiative D | false | 22.90 | Schedule II |
| 102 | Navistar International | Primary Model | true | 25.35 | Schedule III |
| 103 | Root Inc. | Composite Cluster | false | 27.80 | Schedule IV |

The medications table catalogs the drugs themselves. Each entry has a `medication_id`, a `brand_name`, and a `generic_name`. The `is_formulary` flag indicates whether the drug is covered under the standard formulary. The `mme_limit` column stores a morphine milligram equivalent threshold—values such as 20.45, 22.90, 25.35, and 27.80 appear in the data. The `controlled_substance_schedule` column classifies each medication under Schedule I through Schedule IV. Medication 100, branded as "The College-Ready Promise" with generic name "Distributed Review," is formulary-covered with an MME limit of 20.45 and is classified as Schedule I. Medication 103, branded as "Root Inc." with generic name "Composite Cluster," is non-formulary with an MME limit of 27.80 and falls under Schedule IV.

**Table `providers`**

| provider_id | specialty | contact_number | created_at |
|---|---|---|---|
| 1 | extended-specialt-21 | Peter Mcdowell | 2025-01-01 00:14:00 |
| 2 | integrated-specialt-22 | Sophia Meyer | 2025-02-06 03:14:00 |
| 3 | seasonal-specialt-23 | Carol Gaines | 2025-03-11 06:14:00 |
| 4 | regional-specialt-24 | April Snyder | 2025-04-16 09:14:00 |

Providers represent the prescribing clinicians or organizations. Each provider record includes a `provider_id`, a `specialty` code, a `contact_number` (which in this dataset holds the provider's name), and `created_at`/`updated_at` timestamps. Provider 1 has specialty code "extended-specialt-21" and contact name "Peter Mcdowell." Provider 2, "Sophia Meyer," carries specialty "integrated-specialt-22." Provider 3, "Carol Gaines," is coded "seasonal-specialt-23," and Provider 4, "April Snyder," is "regional-specialt-24."

**Table `reminder_letters`**

| reminder_letter_id | letter_id | sent_date | reminder_type | enrollee_id | prescription_id |
|---|---|---|---|---|---|
| 100 | 6564385 | 2024-03-12T14:06:00 | prior_authorization | 1000 | 1 |
| 101 | 69428 | 2025-08-23T21:23:00 | transition_period | 1001 | 2 |
| 102 | de_CH | 2022-01-07T04:40:00 | prior_authorization | 1002 | 3 |
| 103 | 4447016 | 2023-06-18T11:57:00 | transition_period | 1003 | 4 |

Reminder letters are administrative notices dispatched to enrollees or providers. Each letter has a `reminder_letter_id`, a business `letter_id`, a `sent_date`, and a `reminder_type` that is either "prior_authorization" or "transition_period." The `enrollee_id` and `prescription_id` columns link the letter to the relevant enrollee and prescription. Letter 100 (business ID 6564385) was sent on 2024-03-12 as a prior_authorization notice for enrollee 1000 and prescription 1. Letter 101 (business ID 69428) was sent on 2025-08-23 as a transition_period notice for enrollee 1001 and prescription 2.

**Table `transition_periods`**

| transition_period_id | period_id | start_date | end_date | duration_days | status | enrollee_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|
| 1 | 8928510 | 2022-09-05 | 2022-09-01 | 38 | active | 1000 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | 11a34e36-9bac-11eb-a8a2-19ed5c03f8d3 | 2023-02-16 | 2023-02-12 | 49 | expired | 1001 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | 3001009030020 | 2024-07-27 | 2024-07-23 | 60 | active | 1002 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | 195350 | 2025-12-11 | 2025-12-07 | 71 | expired | 1003 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Transition periods define time windows during which an enrollee's plan or coverage is changing. Each period has a `transition_period_id`, a business `period_id`, `start_date` and `end_date` fields, a `duration_days` count, a `status` of either "active" or "expired," and an `enrollee_id` foreign key. Period 1 (business ID 8928510) spans from 2022-09-05 to 2022-09-01 with a duration of 38 days and is currently active for enrollee 1000. Period 2 (UUID 11a34e36-9bac-11eb-a8a2-19ed5c03f8d3) spans 2023-02-16 to 2023-02-12 with 49 days and is expired for enrollee 1001.

The system uses junction tables to manage many-to-many relationships between core entities. The `enrollees_prescriptions` table links enrollees to their prescriptions, `medications_prescriptions` links medications to prescriptions, `providers_prescriptions` links providers to prescriptions, and `periods_prescriptions` links transition periods to prescriptions. These junction tables ensure that a single enrollee can hold multiple prescriptions, a single medication can appear across many prescriptions, and a single provider can prescribe many different medications.

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

## Detailed Prescription Views

The system provides a set of materialized views that join the base tables into comprehensive records. Each view answers a specific operational question by combining data from multiple sources.

The `enrollee_prescription_detail_view` joins the enrollees table with the prescriptions table to produce a complete record of each enrollee's prescriptions, including plan name, status, fill date, quantity, dosage, authorization flags, and schedule. Reading the row for enrollee 1000, the view shows an active Regional Cluster enrollee who received a Schedule II prescription with quantity 9, non-formulary status, and no prior authorization requirement. The row for enrollee 1001 shows a transitioning Seasonal Review D enrollee with a Schedule III prescription, quantity 8, requiring prior authorization.

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

The `enrollee_reminder_letter_view` joins enrollees with reminder letters, producing a record that shows each enrollee's plan details alongside the correspondence sent to them. For enrollee 1000, the view displays the Regional Cluster plan, active status, and the prior_authorization letter (ID 6564385) sent on 2024-03-12. For enrollee 1003, the view shows the Extended Model plan, active status, and the transition_period letter (ID 4447016) sent on 2023-06-18.

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

The `prescription_provider_view` joins prescriptions with providers, answering the question of which provider prescribed which medication to which enrollee. The row for prescription 1 shows provider Peter Mcdowell (specialty extended-specialt-21) prescribing to enrollee 1000 on 2022-09-05. The row for prescription 3 shows provider Carol Gaines (specialty seasonal-specialt-23) prescribing to enrollee 1002 on 2024-07-27.

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

The `prescription_medication_view` joins prescriptions with medications, providing a combined view of the prescription details alongside the drug's brand name, generic name, formulary status, MME limit, and controlled substance schedule. The row for prescription 1 shows medication "The College-Ready Promise" (generic: "Distributed Review"), formulary-covered, MME limit 20.45, Schedule I. The row for prescription 4 shows medication "Root Inc." (generic: "Composite Cluster"), non-formulary, MME limit 27.80, Schedule IV.

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

The `prescription_enrollee_view` joins prescriptions with enrollees, presenting each prescription alongside the enrollee's plan name, enrollment date, and current status. The row for prescription 2 shows enrollee 1001 on the Seasonal Review D plan, enrolled 2023-10-22, with transitioning status. The row for prescription 3 shows enrollee 1002 on the Integrated Initiative plan, enrolled 2024-03-06, with lapsed status.

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

The `prescription_reminder_letter_view` joins prescriptions with reminder letters, showing each prescription alongside the administrative letter associated with it. The row for prescription 1 pairs with letter 6564385 (prior_authorization, sent 2024-03-12). The row for prescription 4 pairs with letter 4447016 (transition_period, sent 2023-06-18).

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

## Medication and Provider Detail Views

The `medication_prescription_detail_view` joins the medications table with the prescriptions table, producing a comprehensive record of each medication alongside its prescription details. The row for medication 100 shows the brand "The College-Ready Promise," generic "Distributed Review," formulary true, MME limit 20.45, Schedule I, linked to prescription 1 filled on 2022-09-05 with quantity 9 and dosage "seasonal-dosage-83." The row for medication 102 shows the brand "Navistar International," generic "Primary Model," formulary true, MME limit 25.35, Schedule III, linked to prescription 3 filled on 2024-07-27 with quantity 0 and dosage "legacy-dosage-85."

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

The `provider_prescription_detail_view` joins the providers table with the prescriptions table, producing a record that shows each provider alongside their prescription activity. The row for provider Peter Mcdowell (specialty extended-specialt-21) shows prescription 1 filled on 2022-09-05, quantity 9, Schedule II, non-formulary. The row for provider Sophia Meyer (specialty integrated-specialt-22) shows prescription 2 filled on 2023-02-16, quantity 8, Schedule III, requiring prior authorization.

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

## Reminder Letter and Transition Period Views

The `reminder_letter_enrollee_view` joins reminder letters with enrollees, producing a record that shows each letter alongside the enrollee's plan and status. The row for letter 6564385 (prior_authorization, sent 2024-03-12) is linked to enrollee 1000 on the Regional Cluster plan with active status. The row for letter de_CH (prior_authorization, sent 2022-01-07) is linked to enrollee 1002 on the Integrated Initiative plan with lapsed status.

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

The `reminder_letter_prescription_view` joins reminder letters with prescriptions, producing a record that shows each letter alongside the prescription it references. The row for letter 69428 (transition_period, sent 2025-08-23) is linked to prescription 2, filled on 2023-02-16, quantity 8, Schedule III. The row for letter 4447016 (transition_period, sent 2023-06-18) is linked to prescription 4, filled on 2025-12-11, quantity 12, Schedule V.

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

The `transition_period_enrollee_view` joins transition periods with enrollees, producing a record that shows each transition period alongside the enrollee's plan and status. The row for period 8928510 (active, 38 days, 2022-09-05 to 2022-09-01) is linked to enrollee 1000 on the Regional Cluster plan. The row for period 3001009030020 (active, 60 days, 2024-07-27 to 2024-07-23) is linked to enrollee 1002 on the Integrated Initiative plan.

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

The `transition_period_prescription_detail_view` joins transition periods with prescriptions, producing a record that shows each transition period alongside the prescription it is associated with. The row for period 8928510 (active, 38 days) is linked to prescription 1, filled on 2022-09-05, quantity 9, Schedule II, non-formulary. The row for period 11a34e36-9bac-11eb-a8a2-19ed5c03f8d3 (expired, 49 days) is linked to prescription 2, filled on 2023-02-16, quantity 8, Schedule III, requiring prior authorization.

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

The prescription management system organizes healthcare data around five core entities—enrollees, prescriptions, medications, providers, and reminder letters—supplemented by transition periods and four junction tables that resolve many-to-many relationships. The twelve detail views combine these tables into operational records that answer specific questions: which prescriptions does an enrollee hold, which provider prescribed a given medication, which reminder letter corresponds to a prescription, and how transition periods align with enrollee status. The data reflects a structured, auditable workflow where every prescription is traceable to its enrollee, its medication, its prescribing provider, and its administrative correspondence, with timestamps and status flags providing a complete history of each record's lifecycle.