## Health Information Governance and Compliance Tracking

Health information ecosystems depend on structured oversight mechanisms that connect clinical programs, privacy assessments, custodial organizations, and patient registries into a coherent governance framework. Each prescribed entity—whether a regional cluster, a seasonal review initiative, or an integrated health program—serves as the central anchor around which privacy reviews, custodian assignments, compliance recommendations, and registry enrollments are organized. The records in this system capture the full lifecycle of a health program from its initial prescription through ongoing compliance monitoring and patient-level data management.

**Table `prescribed_entities`**

| prescribed_entity_id | entity_identifier | entity_name | prescription_date | approval_status | review_cycle | privacy_review_id | health_information_custodian_id | health_registry_id |
|---|---|---|---|---|---|---|---|---|
| 100 | ENT-2129 | Regional Cluster | 2023-02-21T01:03:00 | approved | 40 | 1 | 1000 | 1000 |
| 101 | ENT-2135 | Seasonal Review D | 2024-07-05T08:20:00 | pending | 43 | 2 | 1001 | 1001 |
| 102 | ENT-2141 | Integrated Initiative | 2025-12-16T15:37:00 | revoked | 46 | 3 | 1002 | 1002 |
| 103 | ENT-2147 | Extended Model | 2022-05-27T22:54:00 | approved | 49 | 4 | 1003 | 1003 |

A prescribed entity represents a formally established health program or operational initiative. Each entity carries a unique identifier such as `ENT-2129` for the Regional Cluster or `ENT-2135` for the Seasonal Review D, along with a prescription date that marks when the program was formally instituted. The approval status—ranging from `approved` to `pending` to `revoked`—indicates the current standing of the program within the governance hierarchy. The review cycle field, with values like `40`, `43`, `46`, and `49`, denotes the number of review iterations the entity has undergone. Every prescribed entity is linked to a privacy review, a health information custodian, and a health registry, forming the backbone of the compliance tracking architecture.

**Table `privacy_reviews`**

| id | review_id | review_date | review_type | review_outcome | reviewer_name | prescribed_entity_id | compliance_recommendation_id |
|---|---|---|---|---|---|---|---|
| 1 | 3001009030040 | 2024-11-03T22:54:00 | initial | approved | Baseline Initiative D | 100 | 100 |
| 2 | a001f18c-9bac-11eb-a8a2-19ed5c03f8d3 | 2025-04-14T05:11:00 | three-year | conditional | Distributed Model | 101 | 101 |
| 3 | 3990167 | 2022-09-25T12:28:00 | initial | rejected | Adaptive Cluster | 102 | 102 |
| 4 | 2bc4a76a-8fcc-11eb-924d-9cd76263cbd0 | 2023-02-09T19:45:00 | three-year | approved | Primary Review A | 103 | 103 |

Privacy reviews document the formal assessment of each prescribed entity against applicable data protection standards. The review identifier, which may be a numeric string like `3001009030040` or a UUID such as `a001f18c-9bac-11eb-a8a2-19ed5c03f8d3`, provides a globally unique reference for audit trails. Review dates span from `2022-09-25` through `2025-04-14`, reflecting the temporal spread of assessments across the program portfolio. Review types distinguish between `initial` assessments conducted at program inception and `three-year` reviews required for ongoing compliance. The review outcome—`approved`, `conditional`, or `rejected`—determines whether the entity meets privacy requirements. Each review is attributed to a reviewer, such as `Baseline Initiative D` or `Adaptive Cluster`, and is explicitly tied to its parent prescribed entity and any associated compliance recommendation.

**Table `health_information_custodians`**

| health_information_custodian_id | custodian_id | custodian_name | custodian_type | registration_date | compliance_status | prescribed_entity_id |
|---|---|---|---|---|---|---|
| 1000 | 5082971 | Composite Review | hospital | 2023-06-19T17:27:00 | compliant | 100 |
| 1001 | ChIJB4i7Dqpt5kcRfEnfwsHulbU | Compact Initiative A | clinic | 2024-11-03T00:44:00 | non-compliant | 101 |
| 1002 | 17206951 | Legacy Model | lab | 2025-04-14T07:01:00 | pending | 102 |
| 1003 | state_uk_14 | Regional Cluster | other | 2022-09-25T14:18:00 | compliant | 103 |

Health information custodians are the organizations or facilities responsible for managing patient data within the scope of a prescribed entity. The custodian type categorizes the institution as a `hospital`, `clinic`, `lab`, or `other`, with names like `Composite Review` and `Compact Initiative A` identifying specific entities. Registration dates, such as `2023-06-19T17:27:00` for the Composite Review hospital, mark when the custodian entered the governance framework. The compliance status—`compliant`, `non-compliant`, or `pending`—reflects the custodian's adherence to data handling obligations. Each custodian record is linked to a prescribed entity, establishing which programs fall under its data stewardship.

**Table `compliance_recommendations`**

| id | recommendation_id | issue_date | priority_level | status | description | privacy_review_id | prescribed_entity_id |
|---|---|---|---|---|---|---|---|
| 100 | 3158134 | 2023-02-01T13:51:00 | high | pending | Extended Survey | 1 | 100 |
| 101 | 4649 | 2024-07-12T20:08:00 | medium | addressed | Pilot Corridor A | 2 | 101 |
| 102 | 9fff478e-9bac-11eb-a8a2-19ed5c03f8d3 | 2025-12-23T03:25:00 | low | overdue | Baseline Series | 3 | 102 |
| 103 | 89820 | 2022-05-07T10:42:00 | high | pending | Distributed Assessment | 4 | 103 |

Compliance recommendations capture the corrective actions and advisory measures issued in response to privacy reviews or program assessments. Each recommendation carries a unique identifier, ranging from numeric codes like `3158134` to UUIDs such as `9fff478e-9bac-11eb-a8a2-19ed5c03f8d3`. The issue date, priority level, and status fields track the lifecycle of each recommendation from issuance through resolution. Priority levels span `high`, `medium`, and `low`, with statuses including `pending`, `addressed`, and `overdue`. Descriptions such as `Extended Survey`, `Pilot Corridor A`, and `Baseline Series` provide context for the nature of the recommended action. Every recommendation is associated with a specific privacy review and prescribed entity, creating a traceable chain from assessment finding to corrective measure.

**Table `health_registries`**

| health_registry_id | registry_id | registry_name | data_category | last_updated | record_count | prescribed_entity_id | patient_record_id |
|---|---|---|---|---|---|---|---|
| 1000 | 136630a8-8fcc-11eb-924d-9cd76263cbd0 | Legacy Programme D | oncology | 2023-06-17T17:27:00 | 50 | 100 | 100 |
| 1001 | 4793487 | Regional Standard | cardiology | 2024-11-01T00:44:00 | 17 | 101 | 101 |
| 1002 | 69430 | Seasonal Framework | general | 2025-04-12T07:01:00 | 19 | 102 | 102 |
| 1003 | 8250 | Integrated Protocol A | oncology | 2022-09-23T14:18:00 | 17 | 103 | 103 |

Health registries serve as the data repositories that collect and maintain clinical information for specific disease areas or program purposes. Registry identifiers, which include UUIDs like `136630a8-8fcc-11eb-924d-9cd76263cbd0` and numeric codes such as `4793487`, uniquely identify each registry. Registry names like `Legacy Programme D` and `Regional Standard` describe the scope of data collection. The data category field classifies registries by clinical domain, with `oncology`, `cardiology`, and `general` appearing in the current dataset. The record count indicates the volume of patient records enrolled, ranging from `17` to `50` in the observed data. Each registry is linked to a prescribed entity and a patient record, connecting the data repository to both the governing program and the individual patient it serves.

**Table `patient_records`**

| id | record_id | patient_id | diagnosis_code | treatment_date | consent_status | health_registry_id | linked_to_patient_patient_id |
|---|---|---|---|---|---|---|---|
| 100 | 10449530 | 8387541 | 10966212 | 2022-09-05T20:36:00 | consented | 1000 | 8387541 |
| 101 | 10445619 | 10207142 | 103 | 2023-02-16T03:53:00 | exempt | 1001 | 10207142 |
| 102 | 9568457 | 7119782 | 9246327 | 2024-07-27T10:10:00 | unknown | 1002 | 7119782 |
| 103 | 20743593 | gd_acc_160003 | 1996918 | 2025-12-11T17:27:00 | consented | 1003 | gd_acc_160003 |

Patient records represent the individual clinical entries maintained within health registries. Each record carries a numeric identifier such as `10449530` or `9568457`, alongside a patient identifier that may be numeric like `8387541` or formatted as `gd_acc_160003`. The diagnosis code, treatment date, and consent status fields capture the clinical and legal dimensions of each entry. Consent statuses include `consented`, `exempt`, and `unknown`, reflecting the patient's authorization state for data processing. Each patient record is associated with a health registry and a linked patient, ensuring that clinical data is properly contextualized within both the programmatic and individual frameworks.

**Table `patients`**

| patient_id | date_of_birth | gender | residence_code | patient_record_id | created_at |
|---|---|---|---|---|---|
| 8387541 | 2025-04-02 | male | 6564381 | 100 | 2025-01-01 00:14:00 |
| 10207142 | 2022-09-13 | female | 11a34e36-9bac-11eb-a8a2-19ed5c03f8d3 | 101 | 2025-02-06 03:14:00 |
| 7119782 | 2023-02-24 | other | 168565 | 102 | 2025-03-11 06:14:00 |
| gd_acc_160003 | 2024-07-08 | unknown | 727067 | 103 | 2025-04-16 09:14:00 |

The patient table stores the foundational demographic and identification records for individuals enrolled in health programs. Patient identifiers follow varied formats, including numeric codes like `8387541` and `10207142`, as well as structured identifiers such as `gd_acc_160003` and `7119782`. These identifiers serve as the primary keys for linking patient records, registry enrollments, and program participation across the entire governance system.

The following views synthesize the base tables into analytical perspectives that answer specific operational questions.

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

This view joins prescribed entities with their associated privacy reviews, answering the question of which programs have undergone assessment and what the outcomes were. A row linking entity `ENT-2129` (Regional Cluster) to review `3001009030040` with outcome `approved` demonstrates a program that has successfully cleared its privacy assessment. Conversely, a row connecting entity `ENT-2141` (Integrated Initiative) to review `3990167` with outcome `rejected` reveals a program that failed to meet privacy standards, warranting further investigation or remediation.

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

By joining prescribed entities with their assigned health information custodians, this view clarifies the organizational accountability structure. A row pairing entity `ENT-2129` with custodian `Composite Review` (type `hospital`, status `compliant`) shows a well-aligned program-custodian relationship where the data steward meets compliance requirements. In contrast, a row linking entity `ENT-2135` with custodian `Compact Initiative A` (type `clinic`, status `non-compliant`) highlights a governance gap that requires attention, as the custodian responsible for the program's data has not met its obligations.

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

This view connects prescribed entities to their associated health registries, revealing the data infrastructure supporting each program. A row connecting entity `ENT-2129` to registry `Legacy Programme D` (category `oncology`, record count `50`) illustrates a mature registry with substantial enrollment in a specialized clinical domain. A row linking entity `ENT-2141` to registry `Seasonal Framework` (category `general`, record count `19`) shows a broader-scope registry with more modest enrollment, reflecting the program's current stage or scope.

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

This view presents the privacy review perspective, joining reviews back to their parent prescribed entities to provide a review-centric operational view. A row showing review `3001009030040` (type `initial`, outcome `approved`, reviewer `Baseline Initiative D`) linked to entity `ENT-2129` (status `approved`, review cycle `40`) confirms that a program with extensive review history has maintained its compliance standing. A row connecting review `2bc4a76a-8fcc-11eb-924d-9cd76263cbd0` (type `three-year`, outcome `approved`, reviewer `Primary Review A`) to entity `ENT-2147` (status `approved`, review cycle `49`) demonstrates that even programs with the highest review cycle counts can achieve positive outcomes.

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

This view links privacy reviews to their resulting compliance recommendations, answering the question of what corrective actions follow from each assessment. A row connecting review `3001009030040` to recommendation `3158134` (priority `high`, status `pending`, description `Extended Survey`) indicates that an approved review still generated a high-priority recommendation requiring follow-up. A row linking review `a001f18c-9bac-11eb-a8a2-19ed5c03f8d3` to recommendation `4649` (priority `medium`, status `addressed`, description `Pilot Corridor A`) shows that even conditional outcomes can produce recommendations that have been successfully resolved.

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

Presenting the custodian perspective, this view joins health information custodians to their assigned prescribed entities. A row showing custodian `Composite Review` (type `hospital`, registration date `2023-06-19`, status `compliant`) linked to entity `ENT-2129` (status `approved`, review cycle `40`) illustrates a stable, long-standing governance relationship. A row connecting custodian `Regional Cluster` (type `other`, registration date `2022-09-25`, status `compliant`) to entity `ENT-2147` (status `approved`, review cycle `49`) demonstrates that custodians of varied types can maintain compliance across programs with extensive review histories.

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

This view presents the compliance recommendation perspective, joining recommendations back to their originating privacy reviews. A row showing recommendation `3158134` (issue date `2023-02-01`, priority `high`, status `pending`, description `Extended Survey`) linked to review `3001009030040` (outcome `approved`, reviewer `Baseline Initiative D`) reveals that even approved reviews can generate outstanding high-priority actions. A row connecting recommendation `89820` (issue date `2022-05-07`, priority `high`, status `pending`, description `Distributed Assessment`) to review `2bc4a76a-8fcc-11eb-924d-9cd76263cbd0` (outcome `approved`, reviewer `Primary Review A`) shows that high-priority recommendations can persist for extended periods even after favorable review outcomes.

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

This view links compliance recommendations to their associated prescribed entities, providing a program-centric view of outstanding compliance actions. A row connecting recommendation `3158134` (priority `high`, status `pending`) to entity `ENT-2129` (status `approved`, review cycle `40`) indicates that an approved program still carries unresolved compliance obligations. A row linking recommendation `9fff478e-9bac-11eb-a8a2-19ed5c03f8d3` (priority `low`, status `overdue`, description `Baseline Series`) to entity `ENT-2141` (status `revoked`, review cycle `46`) reveals that a revoked program may still carry overdue recommendations that require administrative closure.

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

This view connects health registries to their governing prescribed entities, answering which programs are supported by which data repositories. A row showing registry `Legacy Programme D` (category `oncology`, record count `50`, last updated `2023-06-17`) linked to entity `ENT-2129` (status `approved`, review cycle `40`) demonstrates a well-established oncology registry supporting a mature program. A row connecting registry `Regional Standard` (category `cardiology`, record count `17`, last updated `2024-11-01`) to entity `ENT-2135` (status `pending`, review cycle `43`) shows a cardiology registry associated with a program still awaiting final approval.

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

This view links health registries to the patient records they contain, revealing the patient-level data flow from individual records to programmatic registries. A row connecting registry `Legacy Programme D` (category `oncology`, record count `50`) to patient record `10449530` (diagnosis code `10966212`, consent status `consented`) demonstrates a consented patient enrolled in an oncology registry with substantial enrollment. A row linking registry `Seasonal Framework` (category `general`, record count `19`) to patient record `9568457` (diagnosis code `9246327`, consent status `unknown`) highlights a general registry entry where the consent status remains undetermined, flagging a potential compliance concern.

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

Presenting the patient record perspective, this view joins patient records back to their parent health registries. A row showing patient record `10449530` (patient ID `8387541`, treatment date `2022-09-05`, consent status `consented`) linked to registry `Legacy Programme D` (category `oncology`, record count `50`) provides a complete picture of a consented patient's clinical entry within a specialized registry. A row connecting patient record `20743593` (patient ID `gd_acc_160003`, treatment date `2025-12-11`, consent status `consented`) to registry `Integrated Protocol A` (category `oncology`, record count `17`) illustrates a more recently treated patient in a smaller oncology registry.

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

This view links patient records to their corresponding patient entries, completing the chain from individual to clinical record. A row showing patient record `10449530` (diagnosis code `10966212`, treatment date `2022-09-05`, consent status `consented`) linked to patient `8387541` confirms the identity and consent state of the individual behind a clinical entry. A row connecting patient record `10445619` (diagnosis code `103`, treatment date `2023-02-16`, consent status `exempt`) to patient `10207142` reveals a patient whose data is processed under an exemption rather than explicit consent, a distinction that carries legal and operational significance.

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

This view presents the patient perspective, joining patients to their associated records to provide an individual-centric operational view. A row showing patient `8387541` linked to record `10449530` (diagnosis code `10966212`, consent status `consented`) demonstrates a patient with a single, consented clinical entry. A row connecting patient `gd_acc_160003` to record `20743593` (diagnosis code `1996918`, consent status `consented`, treatment date `2025-12-11`) illustrates a patient with a more recent clinical encounter, reflecting the ongoing nature of health program participation and data generation.

The governance framework described here operates as an integrated system where prescribed entities anchor the organizational structure, privacy reviews provide the assessment mechanism, custodians assume data stewardship responsibilities, compliance recommendations drive corrective action, health registries collect clinical data, and patient records capture individual encounters. Each layer depends on the others: a revoked prescribed entity may still carry overdue compliance recommendations; a non-compliant custodian creates risk for its assigned program; a patient record with unknown consent status requires investigation regardless of registry enrollment. The views synthesized from these base tables enable operators to navigate this complexity from multiple angles—program-centric, review-centric, custodian-centric, recommendation-centric, registry-centric, record-centric, and patient-centric—ensuring that no single perspective obscures the operational reality of the health information ecosystem.