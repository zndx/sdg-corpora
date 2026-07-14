The health data governance domain models a multi-layered compliance pipeline in which prescribed entities—programmes, initiatives, or clinical models—pass through privacy review, custodian assignment, registry registration, and compliance recommendation before their patient records are formally linked and audited. Every stage of this pipeline is captured in a normalized relational schema: seven base tables encode the entities and their attributes, while eleven materialized views reconstruct the cross-entity facts that auditors and data stewards need to answer questions like "which privacy review governs this entity?", "which custodian is responsible for this registry?", or "which patients are covered by this registry's oncology data?". The foreign keys that bind the tables together are cardinality-bounded: each prescribed entity participates in exactly one privacy review, one custodian assignment, and one registry registration, while each privacy review may spawn a single compliance recommendation and each registry may cover many patient records. The views then reassemble these normalized facts into flat, query-ready rows.

## Prescribed Entities

**Table `prescribed_entities`**

| prescribed_entity_id | entity_identifier | entity_name | prescription_date | approval_status | review_cycle | privacy_review_id | health_information_custodian_id | health_registry_id |
|---|---|---|---|---|---|---|---|---|
| 100 | ENT-2129 | Regional Cluster | 2023-02-21T01:03:00 | approved | 40 | 1 | 1000 | 1000 |
| 101 | ENT-2135 | Seasonal Review D | 2024-07-05T08:20:00 | pending | 43 | 2 | 1001 | 1001 |
| 102 | ENT-2141 | Integrated Initiative | 2025-12-16T15:37:00 | revoked | 46 | 3 | 1002 | 1002 |
| 103 | ENT-2147 | Extended Model | 2022-05-27T22:54:00 | approved | 49 | 4 | 1003 | 1003 |

The `prescribed_entities` table is the central anchor of the schema. Each row represents a governed programme or clinical model, identified by a surrogate key `prescribed_entity_id` and a human-readable `entity_identifier` such as `ENT-2129` or `ENT-2141`. The `entity_name` column carries the descriptive label—`Regional Cluster`, `Seasonal Review D`, `Integrated Initiative`, `Extended Model`—while `prescription_date` records when the entity entered the governance pipeline. The `approval_status` column constrains the lifecycle to three values (`approved`, `pending`, `revoked`), and `review_cycle` stores an integer indicating the number of review iterations the entity has undergone, ranging from 40 to 49 in the sample data. Three foreign-key columns—`privacy_review_id`, `health_information_custodian_id`, and `health_registry_id`—tie each prescribed entity to exactly one row in the `privacy_reviews`, `health_information_custodians`, and `health_registries` tables respectively, enforcing a one-to-one cardinality at the schema level.

## Privacy Reviews

**Table `privacy_reviews`**

| id | review_id | review_date | review_type | review_outcome | reviewer_name | prescribed_entity_id | compliance_recommendation_id |
|---|---|---|---|---|---|---|---|
| 1 | 3001009030040 | 2024-11-03T22:54:00 | initial | approved | Baseline Initiative D | 100 | 100 |
| 2 | a001f18c-9bac-11eb-a8a2-19ed5c03f8d3 | 2025-04-14T05:11:00 | three-year | conditional | Distributed Model | 101 | 101 |
| 3 | 3990167 | 2022-09-25T12:28:00 | initial | rejected | Adaptive Cluster | 102 | 102 |
| 4 | 2bc4a76a-8fcc-11eb-924d-9cd76263cbd0 | 2023-02-09T19:45:00 | three-year | approved | Primary Review A | 103 | 103 |

The `privacy_reviews` table captures the outcome of each privacy assessment. Its surrogate primary key `id` is a small integer, while the business-level `review_id` carries a UUID or numeric identifier such as `3001009030040` or `a001f18c-9bac-11eb-a8a2-19ed5c03f8d3`. The `review_date` and `review_type` columns (values like `initial` or `three-year`) describe when and what kind of review occurred. The `review_outcome` column constrains results to `approved`, `conditional`, or `rejected`, and `reviewer_name` attributes the assessment to a person or team—`Baseline Initiative D`, `Distributed Model`, `Adaptive Cluster`, `Primary Review A`. Two foreign keys, `prescribed_entity_id` and `compliance_recommendation_id`, link each review to its governing entity and to the compliance recommendation it may have triggered.

## Health Information Custodians

**Table `health_information_custodians`**

| health_information_custodian_id | custodian_id | custodian_name | custodian_type | registration_date | compliance_status | prescribed_entity_id |
|---|---|---|---|---|---|---|
| 1000 | 5082971 | Composite Review | hospital | 2023-06-19T17:27:00 | compliant | 100 |
| 1001 | ChIJB4i7Dqpt5kcRfEnfwsHulbU | Compact Initiative A | clinic | 2024-11-03T00:44:00 | non-compliant | 101 |
| 1002 | 17206951 | Legacy Model | lab | 2025-04-14T07:01:00 | pending | 102 |
| 1003 | state_uk_14 | Regional Cluster | other | 2022-09-25T14:18:00 | compliant | 103 |

Custodians are the organizations or roles responsible for managing health data on behalf of a prescribed entity. The table's primary key `health_information_custodian_id` is a surrogate integer, while the business identifier `custodian_id` carries either a numeric value like `5082971` or a UUID-like string such as `ChIJB4i7Dqpt5kcRfEnfwsHulbU`. The `custodian_name` column holds labels like `Composite Review`, `Compact Initiative A`, `Legacy Model`, and `Regional Cluster`. The `custodian_type` column is an enumeration over `hospital`, `clinic`, `lab`, and `other`, and `registration_date` records when the custodian was onboarded. The `compliance_status` column constrains the custodian to `compliant`, `non-compliant`, or `pending`. A single foreign key, `prescribed_entity_id`, binds each custodian to exactly one prescribed entity.

## Compliance Recommendations

**Table `compliance_recommendations`**

| id | recommendation_id | issue_date | priority_level | status | description | privacy_review_id | prescribed_entity_id |
|---|---|---|---|---|---|---|---|
| 100 | 3158134 | 2023-02-01T13:51:00 | high | pending | Extended Survey | 1 | 100 |
| 101 | 4649 | 2024-07-12T20:08:00 | medium | addressed | Pilot Corridor A | 2 | 101 |
| 102 | 9fff478e-9bac-11eb-a8a2-19ed5c03f8d3 | 2025-12-23T03:25:00 | low | overdue | Baseline Series | 3 | 102 |
| 103 | 89820 | 2022-05-07T10:42:00 | high | pending | Distributed Assessment | 4 | 103 |

When a privacy review identifies a gap, a compliance recommendation is generated. The table's surrogate primary key `id` is an integer, while the business-level `recommendation_id` carries a numeric or UUID identifier such as `3158134` or `9fff478e-9bac-11eb-a8a2-19ed5c03f8d3`. The `issue_date` records when the recommendation was created, `priority_level` constrains urgency to `high`, `medium`, or `low`, and `status` tracks progress through `pending`, `addressed`, or `overdue`. The `description` column provides a free-text label like `Extended Survey`, `Pilot Corridor A`, `Baseline Series`, or `Distributed Assessment`. Two foreign keys—`privacy_review_id` and `prescribed_entity_id`—tie each recommendation to its originating review and to the governing entity.

## Health Registries

**Table `health_registries`**

| health_registry_id | registry_id | registry_name | data_category | last_updated | record_count | prescribed_entity_id | patient_record_id |
|---|---|---|---|---|---|---|---|
| 1000 | 136630a8-8fcc-11eb-924d-9cd76263cbd0 | Legacy Programme D | oncology | 2023-06-17T17:27:00 | 50 | 100 | 100 |
| 1001 | 4793487 | Regional Standard | cardiology | 2024-11-01T00:44:00 | 17 | 101 | 101 |
| 1002 | 69430 | Seasonal Framework | general | 2025-04-12T07:01:00 | 19 | 102 | 102 |
| 1003 | 8250 | Integrated Protocol A | oncology | 2022-09-23T14:18:00 | 17 | 103 | 103 |

Health registries catalogue the data categories under governance. The primary key `health_registry_id` is a surrogate integer, while the business identifier `registry_id` carries a UUID or numeric value such as `136630a8-8fcc-11eb-924d-9cd76263cbd0` or `4793487`. The `registry_name` column holds labels like `Legacy Programme D`, `Regional Standard`, `Seasonal Framework`, and `Integrated Protocol A`. The `data_category` column constrains the registry to `oncology`, `cardiology`, or `general`, and `last_updated` records the most recent data refresh. The `record_count` column stores an integer indicating how many patient records the registry covers—values of 50, 17, 19, and 17 appear in the sample. Two foreign keys, `prescribed_entity_id` and `patient_record_id`, link each registry to its governing entity and to the patient records it contains.

## Patient Records

**Table `patient_records`**

| id | record_id | patient_id | diagnosis_code | treatment_date | consent_status | health_registry_id | linked_to_patient_patient_id |
|---|---|---|---|---|---|---|---|
| 100 | 10449530 | 8387541 | 10966212 | 2022-09-05T20:36:00 | consented | 1000 | 8387541 |
| 101 | 10445619 | 10207142 | 103 | 2023-02-16T03:53:00 | exempt | 1001 | 10207142 |
| 102 | 9568457 | 7119782 | 9246327 | 2024-07-27T10:10:00 | unknown | 1002 | 7119782 |
| 103 | 20743593 | gd_acc_160003 | 1996918 | 2025-12-11T17:27:00 | consented | 1003 | gd_acc_160003 |

Patient records are the leaf nodes of the data governance chain. The surrogate primary key `id` is an integer, while the business-level `record_id` carries a numeric or UUID identifier such as `10449530` or `20743593`. The `patient_id` column references the patient entity (values like `8387541`, `10207142`, `7119782`, `gd_acc_160003`), and `diagnosis_code` stores a numeric or alphanumeric code. The `treatment_date` records when the clinical encounter occurred, and `consent_status` constrains the patient's consent to `consented`, `exempt`, or `unknown`. The foreign key `health_registry_id` links the record to its governing registry, while `linked_to_patient_patient_id` provides a denormalized reference back to the patient entity for query convenience.

## Patients

**Table `patients`**

| patient_id | date_of_birth | gender | residence_code | patient_record_id | created_at |
|---|---|---|---|---|---|
| 8387541 | 2025-04-02 | male | 6564381 | 100 | 2025-01-01 00:14:00 |
| 10207142 | 2022-09-13 | female | 11a34e36-9bac-11eb-a8a2-19ed5c03f8d3 | 101 | 2025-02-06 03:14:00 |
| 7119782 | 2023-02-24 | other | 168565 | 102 | 2025-03-11 06:14:00 |
| gd_acc_160003 | 2024-07-08 | unknown | 727067 | 103 | 2025-04-16 09:14:00 |

The `patients` table stores the individual-level entity that patient records reference. Its primary key `patient_id` carries identifiers such as `8387541`, `10207142`, `7119782`, and `gd_acc_160003`. Additional columns capture demographic and clinical attributes that are not shown in the sample but are implied by the schema structure. The table is referenced by `patient_records.patient_id` and `patient_records.linked_to_patient_patient_id`, forming the patient-to-record relationship at the base of the hierarchy.

## View: v_prescribed_entity_privacy_review

**View `v_prescribed_entity_privacy_review`**

```sql
CREATE VIEW v_prescribed_entity_privacy_review AS
SELECT a.prescribed_entity_id, a.entity_identifier, a.entity_name, a.prescription_date, b.id AS review_id, b.review_id AS review_review_id, b.review_date AS review_review_date
FROM prescribed_entities a JOIN privacy_reviews b ON a.privacy_review_id = b.id;
```

| prescribed_entity_id | entity_identifier | entity_name | prescription_date | review_id | review_review_id | review_review_date |
|---|---|---|---|---|---|---|
| 100 | ENT-2129 | Regional Cluster | 2023-02-21T01:03:00 | 1 | 3001009030040 | 2024-11-03T22:54:00 |
| 101 | ENT-2135 | Seasonal Review D | 2024-07-05T08:20:00 | 2 | a001f18c-9bac-11eb-a8a2-19ed5c03f8d3 | 2025-04-14T05:11:00 |
| 102 | ENT-2141 | Integrated Initiative | 2025-12-16T15:37:00 | 3 | 3990167 | 2022-09-25T12:28:00 |
| 103 | ENT-2147 | Extended Model | 2022-05-27T22:54:00 | 4 | 2bc4a76a-8fcc-11eb-924d-9cd76263cbd0 | 2023-02-09T19:45:00 |

This view joins `prescribed_entities` to `privacy_reviews` on `prescribed_entity_id`, producing a flat row per prescribed entity that includes the entity's name, approval status, and review cycle alongside the review's date, type, outcome, and reviewer name. It answers the question "what is the current privacy review status of this prescribed entity?" For example, the row for `Regional Cluster` (`ENT-2129`) shows an `approved` entity paired with an `approved` review outcome from reviewer `Baseline Initiative D` on `2024-11-03`, while `Integrated Initiative` (`ENT-2141`) shows a `revoked` entity paired with a `rejected` review outcome from `Adaptive Cluster` on `2022-09-25`.

## View: v_prescribed_entity_health_information_custodian

**View `v_prescribed_entity_health_information_custodian`**

```sql
CREATE VIEW v_prescribed_entity_health_information_custodian AS
SELECT a.prescribed_entity_id, a.entity_identifier, a.entity_name, a.prescription_date, b.health_information_custodian_id AS custodian_health_information_custodian_id, b.custodian_id AS custodian_custodian_id, b.custodian_name AS custodian_custodian_name
FROM prescribed_entities a JOIN health_information_custodians b ON a.health_information_custodian_id = b.health_information_custodian_id;
```

| prescribed_entity_id | entity_identifier | entity_name | prescription_date | custodian_health_information_custodian_id | custodian_custodian_id | custodian_custodian_name |
|---|---|---|---|---|---|---|
| 100 | ENT-2129 | Regional Cluster | 2023-02-21T01:03:00 | 1000 | 5082971 | Composite Review |
| 101 | ENT-2135 | Seasonal Review D | 2024-07-05T08:20:00 | 1001 | ChIJB4i7Dqpt5kcRfEnfwsHulbU | Compact Initiative A |
| 102 | ENT-2141 | Integrated Initiative | 2025-12-16T15:37:00 | 1002 | 17206951 | Legacy Model |
| 103 | ENT-2147 | Extended Model | 2022-05-27T22:54:00 | 1003 | state_uk_14 | Regional Cluster |

This view joins `prescribed_entities` to `health_information_custodians` on `prescribed_entity_id`, producing a flat row that pairs each entity with its assigned custodian's name, type, registration date, and compliance status. It answers "which organization is responsible for managing health data for this entity, and is that custodian compliant?" The row for `Extended Model` (`ENT-2147`) shows custodian `Regional Cluster` of type `other`, registered on `2022-09-25`, with `compliant` status, while `Seasonal Review D` (`ENT-2135`) shows custodian `Compact Initiative A` of type `clinic` with `non-compliant` status.

## View: v_prescribed_entity_health_registry

**View `v_prescribed_entity_health_registry`**

```sql
CREATE VIEW v_prescribed_entity_health_registry AS
SELECT a.prescribed_entity_id, a.entity_identifier, a.entity_name, a.prescription_date, b.health_registry_id AS registry_health_registry_id, b.registry_id AS registry_registry_id, b.registry_name AS registry_registry_name
FROM prescribed_entities a JOIN health_registries b ON a.health_registry_id = b.health_registry_id;
```

| prescribed_entity_id | entity_identifier | entity_name | prescription_date | registry_health_registry_id | registry_registry_id | registry_registry_name |
|---|---|---|---|---|---|---|
| 100 | ENT-2129 | Regional Cluster | 2023-02-21T01:03:00 | 1000 | 136630a8-8fcc-11eb-924d-9cd76263cbd0 | Legacy Programme D |
| 101 | ENT-2135 | Seasonal Review D | 2024-07-05T08:20:00 | 1001 | 4793487 | Regional Standard |
| 102 | ENT-2141 | Integrated Initiative | 2025-12-16T15:37:00 | 1002 | 69430 | Seasonal Framework |
| 103 | ENT-2147 | Extended Model | 2022-05-27T22:54:00 | 1003 | 8250 | Integrated Protocol A |

This view joins `prescribed_entities` to `health_registries` on `prescribed_entity_id`, producing a flat row that pairs each entity with its registry's name, data category, last update timestamp, and record count. It answers "what data category does this entity's registry cover, and how many records are in it?" The row for `Regional Cluster` (`ENT-2129`) shows registry `Legacy Programme D` in the `oncology` category with 50 records last updated on `2023-06-17`, while `Seasonal Review D` (`ENT-2135`) shows registry `Regional Standard` in `cardiology` with 17 records.

## View: v_privacy_review_prescribed_entity

**View `v_privacy_review_prescribed_entity`**

```sql
CREATE VIEW v_privacy_review_prescribed_entity AS
SELECT a.id, a.review_id, a.review_date, a.review_type, b.prescribed_entity_id AS entity_prescribed_entity_id, b.entity_identifier AS entity_entity_identifier, b.entity_name AS entity_entity_name
FROM privacy_reviews a JOIN prescribed_entities b ON a.prescribed_entity_id = b.prescribed_entity_id;
```

| id | review_id | review_date | review_type | entity_prescribed_entity_id | entity_entity_identifier | entity_entity_name |
|---|---|---|---|---|---|---|
| 1 | 3001009030040 | 2024-11-03T22:54:00 | initial | 100 | ENT-2129 | Regional Cluster |
| 2 | a001f18c-9bac-11eb-a8a2-19ed5c03f8d3 | 2025-04-14T05:11:00 | three-year | 101 | ENT-2135 | Seasonal Review D |
| 3 | 3990167 | 2022-09-25T12:28:00 | initial | 102 | ENT-2141 | Integrated Initiative |
| 4 | 2bc4a76a-8fcc-11eb-924d-9cd76263cbd0 | 2023-02-09T19:45:00 | three-year | 103 | ENT-2147 | Extended Model |

This view performs the inverse join of `v_prescribed_entity_privacy_review`, joining `privacy_reviews` to `prescribed_entities` on `prescribed_entity_id`. It answers "which prescribed entity does this privacy review govern?" The row for review `3001009030040` shows it governs `Regional Cluster` (`ENT-2129`), while the row for review `a001f18c-9bac-11eb-a8a2-19ed5c03f8d3` shows it governs `Seasonal Review D` (`ENT-2135`). The view is useful when auditing from the review side rather than the entity side.

## View: v_privacy_review_compliance_recommendation

**View `v_privacy_review_compliance_recommendation`**

```sql
CREATE VIEW v_privacy_review_compliance_recommendation AS
SELECT a.id, a.review_id, a.review_date, a.review_type, b.id AS recommendation_id, b.recommendation_id AS recommendation_recommendation_id, b.issue_date AS recommendation_issue_date
FROM privacy_reviews a JOIN compliance_recommendations b ON a.compliance_recommendation_id = b.id;
```

| id | review_id | review_date | review_type | recommendation_id | recommendation_recommendation_id | recommendation_issue_date |
|---|---|---|---|---|---|---|
| 1 | 3001009030040 | 2024-11-03T22:54:00 | initial | 100 | 3158134 | 2023-02-01T13:51:00 |
| 2 | a001f18c-9bac-11eb-a8a2-19ed5c03f8d3 | 2025-04-14T05:11:00 | three-year | 101 | 4649 | 2024-07-12T20:08:00 |
| 3 | 3990167 | 2022-09-25T12:28:00 | initial | 102 | 9fff478e-9bac-11eb-a8a2-19ed5c03f8d3 | 2025-12-23T03:25:00 |
| 4 | 2bc4a76a-8fcc-11eb-924d-9cd76263cbd0 | 2023-02-09T19:45:00 | three-year | 103 | 89820 | 2022-05-07T10:42:00 |

This view joins `privacy_reviews` to `compliance_recommendations` on `privacy_review_id`, producing a flat row that pairs each review with its associated recommendation's issue date, priority, status, and description. It answers "what compliance recommendation was generated by this privacy review, and what is its current status?" The row for review `3001009030040` shows recommendation `3158134` with `high` priority, `pending` status, and description `Extended Survey`, while the row for review `a001f18c-9bac-11eb-a8a2-19ed5c03f8d3` shows recommendation `4649` with `medium` priority and `addressed` status.

## View: v_health_information_custodian_prescribed_entity

**View `v_health_information_custodian_prescribed_entity`**

```sql
CREATE VIEW v_health_information_custodian_prescribed_entity AS
SELECT a.health_information_custodian_id, a.custodian_id, a.custodian_name, a.custodian_type, b.prescribed_entity_id AS entity_prescribed_entity_id, b.entity_identifier AS entity_entity_identifier, b.entity_name AS entity_entity_name
FROM health_information_custodians a JOIN prescribed_entities b ON a.prescribed_entity_id = b.prescribed_entity_id;
```

| health_information_custodian_id | custodian_id | custodian_name | custodian_type | entity_prescribed_entity_id | entity_entity_identifier | entity_entity_name |
|---|---|---|---|---|---|---|
| 1000 | 5082971 | Composite Review | hospital | 100 | ENT-2129 | Regional Cluster |
| 1001 | ChIJB4i7Dqpt5kcRfEnfwsHulbU | Compact Initiative A | clinic | 101 | ENT-2135 | Seasonal Review D |
| 1002 | 17206951 | Legacy Model | lab | 102 | ENT-2141 | Integrated Initiative |
| 1003 | state_uk_14 | Regional Cluster | other | 103 | ENT-2147 | Extended Model |

This view performs the inverse join of `v_prescribed_entity_health_information_custodian`, joining `health_information_custodians` to `prescribed_entities` on `prescribed_entity_id`. It answers "which prescribed entity does this custodian serve?" The row for custodian `Composite Review` (`5082971`) shows it serves `Regional Cluster` (`ENT-2129`), while the row for custodian `Compact Initiative A` (`ChIJB4i7Dqpt5kcRfEnfwsHulbU`) shows it serves `Seasonal Review D` (`ENT-2135`). This orientation is useful for custodian-level audits.

## View: v_compliance_recommendation_privacy_review

**View `v_compliance_recommendation_privacy_review`**

```sql
CREATE VIEW v_compliance_recommendation_privacy_review AS
SELECT a.id, a.recommendation_id, a.issue_date, a.priority_level, b.id AS review_id, b.review_id AS review_review_id, b.review_date AS review_review_date
FROM compliance_recommendations a JOIN privacy_reviews b ON a.privacy_review_id = b.id;
```

| id | recommendation_id | issue_date | priority_level | review_id | review_review_id | review_review_date |
|---|---|---|---|---|---|---|
| 100 | 3158134 | 2023-02-01T13:51:00 | high | 1 | 3001009030040 | 2024-11-03T22:54:00 |
| 101 | 4649 | 2024-07-12T20:08:00 | medium | 2 | a001f18c-9bac-11eb-a8a2-19ed5c03f8d3 | 2025-04-14T05:11:00 |
| 102 | 9fff478e-9bac-11eb-a8a2-19ed5c03f8d3 | 2025-12-23T03:25:00 | low | 3 | 3990167 | 2022-09-25T12:28:00 |
| 103 | 89820 | 2022-05-07T10:42:00 | high | 4 | 2bc4a76a-8fcc-11eb-924d-9cd76263cbd0 | 2023-02-09T19:45:00 |

This view joins `compliance_recommendations` to `privacy_reviews` on `privacy_review_id`, producing a flat row that pairs each recommendation with its originating review's date, type, outcome, and reviewer name. It answers "which privacy review triggered this compliance recommendation?" The row for recommendation `3158134` shows it was triggered by review `3001009030040` of type `initial` with outcome `approved`, while the row for recommendation `9fff478e-9bac-11eb-a8a2-19ed5c03f8d3` shows it was triggered by review `3990167` of type `initial` with outcome `rejected`.

## View: v_compliance_recommendation_prescribed_entity

**View `v_compliance_recommendation_prescribed_entity`**

```sql
CREATE VIEW v_compliance_recommendation_prescribed_entity AS
SELECT a.id, a.recommendation_id, a.issue_date, a.priority_level, b.prescribed_entity_id AS entity_prescribed_entity_id, b.entity_identifier AS entity_entity_identifier, b.entity_name AS entity_entity_name
FROM compliance_recommendations a JOIN prescribed_entities b ON a.prescribed_entity_id = b.prescribed_entity_id;
```

| id | recommendation_id | issue_date | priority_level | entity_prescribed_entity_id | entity_entity_identifier | entity_entity_name |
|---|---|---|---|---|---|---|
| 100 | 3158134 | 2023-02-01T13:51:00 | high | 100 | ENT-2129 | Regional Cluster |
| 101 | 4649 | 2024-07-12T20:08:00 | medium | 101 | ENT-2135 | Seasonal Review D |
| 102 | 9fff478e-9bac-11eb-a8a2-19ed5c03f8d3 | 2025-12-23T03:25:00 | low | 102 | ENT-2141 | Integrated Initiative |
| 103 | 89820 | 2022-05-07T10:42:00 | high | 103 | ENT-2147 | Extended Model |

This view joins `compliance_recommendations` to `prescribed_entities` on `prescribed_entity_id`, producing a flat row that pairs each recommendation with its governing entity's name, identifier, approval status, and review cycle. It answers "which prescribed entity is this compliance recommendation associated with?" The row for recommendation `3158134` shows it is associated with `Regional Cluster` (`ENT-2129`), while the row for recommendation `89820` shows it is associated with `Extended Model` (`ENT-2147`).

## View: v_health_registry_prescribed_entity

**View `v_health_registry_prescribed_entity`**

```sql
CREATE VIEW v_health_registry_prescribed_entity AS
SELECT a.health_registry_id, a.registry_id, a.registry_name, a.data_category, b.prescribed_entity_id AS entity_prescribed_entity_id, b.entity_identifier AS entity_entity_identifier, b.entity_name AS entity_entity_name
FROM health_registries a JOIN prescribed_entities b ON a.prescribed_entity_id = b.prescribed_entity_id;
```

| health_registry_id | registry_id | registry_name | data_category | entity_prescribed_entity_id | entity_entity_identifier | entity_entity_name |
|---|---|---|---|---|---|---|
| 1000 | 136630a8-8fcc-11eb-924d-9cd76263cbd0 | Legacy Programme D | oncology | 100 | ENT-2129 | Regional Cluster |
| 1001 | 4793487 | Regional Standard | cardiology | 101 | ENT-2135 | Seasonal Review D |
| 1002 | 69430 | Seasonal Framework | general | 102 | ENT-2141 | Integrated Initiative |
| 1003 | 8250 | Integrated Protocol A | oncology | 103 | ENT-2147 | Extended Model |

This view performs the inverse join of `v_prescribed_entity_health_registry`, joining `health_registries` to `prescribed_entities` on `prescribed_entity_id`. It answers "which prescribed entity does this health registry belong to?" The row for registry `Legacy Programme D` (`136630a8-8fcc-11eb-924d-9cd76263cbd0`) shows it belongs to `Regional Cluster` (`ENT-2129`), while the row for registry `Regional Standard` (`4793487`) shows it belongs to `Seasonal Review D` (`ENT-2135`).

## View: v_health_registry_patient_record

**View `v_health_registry_patient_record`**

```sql
CREATE VIEW v_health_registry_patient_record AS
SELECT a.health_registry_id, a.registry_id, a.registry_name, a.data_category, b.id AS record_id, b.record_id AS record_record_id, b.patient_id AS record_patient_id
FROM health_registries a JOIN patient_records b ON a.patient_record_id = b.id;
```

| health_registry_id | registry_id | registry_name | data_category | record_id | record_record_id | record_patient_id |
|---|---|---|---|---|---|---|
| 1000 | 136630a8-8fcc-11eb-924d-9cd76263cbd0 | Legacy Programme D | oncology | 100 | 10449530 | 8387541 |
| 1001 | 4793487 | Regional Standard | cardiology | 101 | 10445619 | 10207142 |
| 1002 | 69430 | Seasonal Framework | general | 102 | 9568457 | 7119782 |
| 1003 | 8250 | Integrated Protocol A | oncology | 103 | 20743593 | gd_acc_160003 |

This view joins `health_registries` to `patient_records` on `health_registry_id`, producing a flat row that pairs each registry with its patient record's record ID, patient ID, diagnosis code, treatment date, and consent status. It answers "which patient records are covered by this health registry?" The row for registry `Legacy Programme D` shows patient record `10449530` for patient `8387541` with diagnosis code `10966212`, treatment date `2022-09-05`, and `consented` status, while the row for registry `Regional Standard` shows patient record `10445619` for patient `10207142` with diagnosis code `103` and `exempt` consent status.

## View: v_patient_record_health_registry

**View `v_patient_record_health_registry`**

```sql
CREATE VIEW v_patient_record_health_registry AS
SELECT a.id, a.record_id, a.patient_id, a.diagnosis_code, b.health_registry_id AS registry_health_registry_id, b.registry_id AS registry_registry_id, b.registry_name AS registry_registry_name
FROM patient_records a JOIN health_registries b ON a.health_registry_id = b.health_registry_id;
```

| id | record_id | patient_id | diagnosis_code | registry_health_registry_id | registry_registry_id | registry_registry_name |
|---|---|---|---|---|---|---|
| 100 | 10449530 | 8387541 | 10966212 | 1000 | 136630a8-8fcc-11eb-924d-9cd76263cbd0 | Legacy Programme D |
| 101 | 10445619 | 10207142 | 103 | 1001 | 4793487 | Regional Standard |
| 102 | 9568457 | 7119782 | 9246327 | 1002 | 69430 | Seasonal Framework |
| 103 | 20743593 | gd_acc_160003 | 1996918 | 1003 | 8250 | Integrated Protocol A |

This view performs the inverse join of `v_health_registry_patient_record`, joining `patient_records` to `health_registries` on `health_registry_id`. It answers "which health registry does this patient record belong to?" The row for patient record `10449530` shows it belongs to registry `Legacy Programme D` in the `oncology` category, while the row for patient record `9568457` shows it belongs to registry `Seasonal Framework` in the `general` category.

## View: v_patient_record_patient

**View `v_patient_record_patient`**

```sql
CREATE VIEW v_patient_record_patient AS
SELECT a.id, a.record_id, a.patient_id, a.diagnosis_code, b.patient_id AS patient_patient_id, b.date_of_birth AS patient_date_of_birth, b.gender AS patient_gender
FROM patient_records a JOIN patients b ON a.linked_to_patient_patient_id = b.patient_id;
```

| id | record_id | patient_id | diagnosis_code | patient_patient_id | patient_date_of_birth | patient_gender |
|---|---|---|---|---|---|---|
| 100 | 10449530 | 8387541 | 10966212 | 8387541 | 2025-04-02 | male |
| 101 | 10445619 | 10207142 | 103 | 10207142 | 2022-09-13 | female |
| 102 | 9568457 | 7119782 | 9246327 | 7119782 | 2023-02-24 | other |
| 103 | 20743593 | gd_acc_160003 | 1996918 | gd_acc_160003 | 2024-07-08 | unknown |

This view joins `patient_records` to `patients` on `patient_id`, producing a flat row that pairs each patient record with the patient's demographic and clinical attributes. It answers "which patient does this record belong to, and what is their consent status?" The row for patient record `10449530` shows patient `8387541` with `consented` status, while the row for patient record `20743593` shows patient `gd_acc_160003` with `consented` status.

## View: v_patient_patient_record

**View `v_patient_patient_record`**

```sql
CREATE VIEW v_patient_patient_record AS
SELECT a.patient_id, a.date_of_birth, a.gender, a.residence_code, b.id AS record_id, b.record_id AS record_record_id, b.patient_id AS record_patient_id
FROM patients a JOIN patient_records b ON a.patient_record_id = b.id;
```

| patient_id | date_of_birth | gender | residence_code | record_id | record_record_id | record_patient_id |
|---|---|---|---|---|---|---|
| 8387541 | 2025-04-02 | male | 6564381 | 100 | 10449530 | 8387541 |
| 10207142 | 2022-09-13 | female | 11a34e36-9bac-11eb-a8a2-19ed5c03f8d3 | 101 | 10445619 | 10207142 |
| 7119782 | 2023-02-24 | other | 168565 | 102 | 9568457 | 7119782 |
| gd_acc_160003 | 2024-07-08 | unknown | 727067 | 103 | 20743593 | gd_acc_160003 |

This view performs the inverse join of `v_patient_record_patient`, joining `patients` to `patient_records` on `patient_id`. It answers "which patient records are associated with this patient?" The row for patient `8387541` shows it is associated with patient record `10449530` in the `oncology` registry, while the row for patient `10207142` shows it is associated with patient record `10445619` in the `cardiology` registry.

## Synthesis

The schema models health data governance as a directed acyclic graph of seven base tables, with foreign keys flowing from prescribed entities outward to privacy reviews, custodians, compliance recommendations, and health registries, and then from registries to patient records and finally to patients. The eleven views materialize every pairwise join between adjacent layers, enabling auditors to query the pipeline from either direction—entity-to-review or review-to-entity, custodian-to-entity or entity-to-custodian, registry-to-record or record-to-registry. Each view reconstructs a single domain fact from the normalized tables by joining on the cardinality-bounded foreign key, producing a flat row that can be filtered, aggregated, or reported without requiring the analyst to understand the underlying join topology. The result is a schema that is both normal enough to avoid update anomalies and denormalized enough to support the flat, fact-oriented queries that compliance workflows demand.