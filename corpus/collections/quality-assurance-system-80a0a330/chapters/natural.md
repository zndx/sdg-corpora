## Governance Architecture in Higher Education Quality Assurance

Quality assurance in higher education operates through a layered ecosystem of systems, reforms, frameworks, and institutional bodies that together define how academic standards are established, monitored, and enforced. At the core of this ecosystem are quality assurance systems—structured governance mechanisms that anchor institutional reforms, regional qualifications frameworks, dedicated quality assurance offices, and capacity-building initiatives. Each system carries a unique identifier, a lifecycle status ranging from draft through implemented, and a regional classification that determines its scope of authority. The records in this domain capture the full lifecycle of these systems, from initial conception through ratification and operational deployment, providing a comprehensive audit trail of governance evolution across jurisdictions.

**Table `quality_assurance_systems`**

| quality_assurance_system_id | system_id | name | start_date | status | region | framework_version | institutional_reform_id | regional_qualifications_framework_id | quality_assurance_office_id |
|---|---|---|---|---|---|---|---|---|---|
| 1000 | 8189503 | Extended Review | 2022-09-05T20:24:00 | draft | distributed-region-12 | adaptive-framewor-53 | 1 | 100 | 100 |
| 1001 | 3717623 | Pilot Initiative A | 2023-02-16T03:41:00 | consultation | baseline-region-13 | distributed-framewor-54 | 2 | 101 | 101 |
| 1002 | 7441161 | Baseline Model | 2024-07-27T10:58:00 | ratified | pilot-region-14 | baseline-framewor-55 | 3 | 102 | 102 |
| 1003 | 605963 | Distributed Cluster | 2025-12-11T17:15:00 | implemented | extended-region-15 | pilot-framewor-56 | 4 | 103 | 103 |

The quality assurance systems table serves as the central registry for all governance mechanisms in the domain. Each system is identified by a numeric `quality_assurance_system_id` and a distinct `system_id` such as `8189503` for the Extended Review system or `3717623` for Pilot Initiative A. The `name` field provides a human-readable label, while `start_date` records when the system was initiated. The `status` column tracks the lifecycle stage—draft, consultation, ratified, or implemented—indicating how far along the system is in its adoption cycle. The `region` field classifies the operational scope, with values like `distributed-region-12` and `baseline-region-13` denoting different geographic or administrative zones. The `framework_version` column references the specific framework iteration in use, such as `adaptive-framewor-53` or `baseline-framewor-55`. Critically, each system record links to its associated institutional reform, regional qualifications framework, and quality assurance office through foreign key columns, establishing the structural backbone of the entire governance architecture.

**Table `institutional_reforms`**

| id | reform_id | initiation_date | ratification_date | legal_basis | status | mandate_scope | quality_assurance_system_id |
|---|---|---|---|---|---|---|---|
| 1 | state_uk_21 | 2025-12-09T11:57:00 | 2024-03-20 | primary-legal-52 | initiated | compact-mandate-80 | 1000 |
| 2 | 506005 | 2022-05-20T18:14:00 | 2025-08-04 | adaptive-legal-53 | in_progress | composite-mandate-81 | 1001 |
| 3 | 392505 | 2023-10-04T01:31:00 | 2022-01-15 | distributed-legal-54 | completed | primary-mandate-82 | 1002 |
| 4 | b69ce49c-8fd1-11eb-924d-9cd76263cbd0 | 2024-03-15T08:48:00 | 2023-06-26 | baseline-legal-55 | ratified | adaptive-mandate-83 | 1003 |

Institutional reforms represent the legislative and policy instruments that drive changes within quality assurance systems. The `institutional_reforms` table records each reform with a unique `id`, a `reform_id` that may take the form of a short code like `state_uk_21` or a UUID such as `b69ce49c-8fd1-11eb-924d-9cd76263cbd0`. The `initiation_date` marks when the reform process began, while `ratification_date` captures when it was formally approved—note that ratification may precede initiation in some records, reflecting retroactive or parallel processing. The `legal_basis` field specifies the statutory authority under which the reform operates, with values including `primary-legal-52`, `adaptive-legal-53`, and `distributed-legal-54`. The `status` column tracks progress through stages such as initiated, in_progress, completed, and ratified, while `mandate_scope` defines the breadth of the reform's authority, ranging from `compact-mandate-80` to `adaptive-mandate-83`. Each reform is linked to a quality assurance system via `quality_assurance_system_id`, creating a bidirectional relationship that allows navigation from reform to system and vice versa.

**Table `regional_qualifications_frameworks`**

| id | framework_id | name | version | status | total_levels | credit_system_type | quality_assurance_system_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|
| 100 | lu_tax_code_template_m11 | Extended Review | seasonal-version-71 | in_development | 2 | composite-credit-81 | 1000 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 101 | 228bd7e4-9bad-11eb-a8a2-19ed5c03f8d3 | Pilot Initiative A | regional-version-72 | draft | 12 | primary-credit-82 | 1001 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 102 | 8843756 | Baseline Model | legacy-version-73 | published | 12 | adaptive-credit-83 | 1002 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 103 | ChIJm7V_gxFu5kcRAbqaOJHQUy0 | Distributed Cluster | compact-version-74 | implemented | 4 | distributed-credit-84 | 1003 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Regional qualifications frameworks define the structural architecture of academic credentials within a jurisdiction. The `regional_qualifications_frameworks` table stores each framework with an `id`, a `framework_id` (which may be a descriptive string like `lu_tax_code_template_m11` or a UUID), and a `name` that often mirrors the associated quality assurance system. The `version` field indicates the framework iteration, with values such as `seasonal-version-71` and `compact-version-74`. The `status` column tracks development stages from `in_development` through `draft`, `published`, to `implemented`. The `total_levels` field specifies the number of qualification levels in the framework, ranging from 2 levels in the Extended Review framework to 12 levels in both the Pilot Initiative A and Baseline Model frameworks. The `credit_system_type` column describes the credit accumulation mechanism, with options including `composite-credit-81`, `primary-credit-82`, `adaptive-credit-83`, and `distributed-credit-84`. Timestamps `created_at` and `updated_at` provide an audit trail of framework modifications. Each framework is linked to its parent quality assurance system through `quality_assurance_system_id`.

**Table `quality_assurance_offices`**

| id | office_id | office_name | establishment_date | location | status | staff_count | quality_assurance_system_id | capacity_building_training_id | created_at |
|---|---|---|---|---|---|---|---|---|---|
| 100 | 5917279 | Pilot Review | 2024-07-11 | extended-location-99 | planned | 21 | 1000 | 1 | 2025-01-01 00:14:00 |
| 101 | 10445641 | Baseline Initiative | 2025-12-22 | integrated-location-100 | established | 40 | 1001 | 2 | 2025-02-06 03:14:00 |
| 102 | 12715698 | Distributed Model A | 2022-05-06 | seasonal-location-101 | operational | 3 | 1002 | 3 | 2025-03-11 06:14:00 |
| 103 | 3012823 | Adaptive Cluster | 2023-10-17 | regional-location-102 | dissolved | 8 | 1003 | 4 | 2025-04-16 09:14:00 |

Quality assurance offices are the operational bodies responsible for implementing and monitoring quality assurance systems on the ground. The `quality_assurance_offices` table records each office with an `id`, an `office_id`, and an `office_name` such as Pilot Review, Baseline Initiative, Distributed Model A, and Adaptive Cluster. The `establishment_date` records when the office was formally created, while `location` specifies its geographic or administrative placement, with values like `extended-location-99` and `integrated-location-100`. The `status` column indicates the office's current operational state—planned, established, operational, or dissolved—and `staff_count` provides a headcount ranging from 3 staff in the Distributed Model A office to 40 in the Baseline Initiative office. Each office is associated with a quality assurance system via `quality_assurance_system_id` and may be linked to a capacity-building training through `capacity_building_training_id`, reflecting the office's role in organizing or delivering training programs.

**Table `capacity_building_trainings`**

| capacity_building_training_id | training_id | title | start_date | end_date | target_audience | status | participants_count | quality_assurance_office_id | quality_assurance_system_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 1205-0002-M | Compact Initiative | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | legacy-target-25 | planned | 25 | 100 | 1000 |
| 2 | c746bff2-8fcc-11eb-924d-9cd76263cbd0 | Legacy Model | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | compact-target-26 | scheduled | 9 | 101 | 1001 |
| 3 | 34036cc6-9bad-11eb-a8a2-19ed5c03f8d3 | Regional Cluster A | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | composite-target-27 | in_progress | 27 | 102 | 1002 |
| 4 | 10207144 | Seasonal Review | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | primary-target-28 | completed | 45 | 103 | 1003 |

Capacity building trainings represent the educational and professional development initiatives that strengthen the capabilities of quality assurance personnel and institutions. The `capacity_building_trainings` table stores each training with a `capacity_building_training_id`, a `training_id` (which may be a code like `1205-0002-M` or a UUID), and a `title` such as Compact Initiative, Legacy Model, Regional Cluster A, and Seasonal Review. The `start_date` and `end_date` fields define the training period, while `target_audience` specifies the intended participants, with values including `legacy-target-25`, `compact-target-26`, `composite-target-27`, and `primary-target-28`. The `status` column tracks training progress through planned, scheduled, in_progress, and completed stages. The `participants_count` field records enrollment numbers, ranging from 9 participants in the Legacy Model training to 45 in the Seasonal Review training. Each training is linked to a quality assurance office via `quality_assurance_office_id` and to a quality assurance system via `quality_assurance_system_id`, establishing a clear chain of responsibility and oversight.

**Table `national_commissions`**

| id | commission_id | name | country | establishment_date | status | jurisdiction_level | quality_assurance_system_id | capacity_building_training_id |
|---|---|---|---|---|---|---|---|---|
| 1000 | 24563916 | Extended Review | compact-country-26 | 2024-07-11 | active | distributed-jurisdic-48 | 1000 | 1 |
| 1001 | c747f9a8-8fcc-11eb-924d-9cd76263cbd0 | Pilot Initiative A | composite-country-27 | 2025-12-22 | inactive | baseline-jurisdic-49 | 1001 | 2 |
| 1002 | 8928502 | Baseline Model | primary-country-28 | 2022-05-06 | merging | pilot-jurisdic-50 | 1002 | 3 |
| 1003 | 937734 | Distributed Cluster | adaptive-country-29 | 2023-10-17 | dissolved | extended-jurisdic-51 | 1003 | 4 |

National commissions serve as the authoritative bodies that oversee quality assurance activities at the national level. The `national_commissions` table records each commission with an `id`, a `commission_id`, and a `name` that aligns with the associated quality assurance system. The `country` field identifies the jurisdiction, with values such as `compact-country-26`, `composite-country-27`, `primary-country-28`, and `adaptive-country-29`. The `establishment_date` marks when the commission was formally constituted, while `status` tracks its current operational state—active, inactive, merging, or dissolved. The `jurisdiction_level` field specifies the scope of the commission's authority, with values including `distributed-jurisdic-48`, `baseline-jurisdic-49`, `pilot-jurisdic-50`, and `extended-jurisdic-51`. Each commission is linked to a quality assurance system via `quality_assurance_system_id` and to a capacity-building training via `capacity_building_training_id`, reflecting the commission's role in both governance and training oversight.

**Table `universities`**

| university_id | name | country | establishment_date | status | accreditation_status | quality_assurance_system_id | national_commission_id | capacity_building_training_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | Extended Review | compact-country-26 | 2024-07-11 | operational | regional-accredit-66 | 1000 | 1000 | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | Pilot Initiative A | composite-country-27 | 2025-12-22 | closed | legacy-accredit-67 | 1001 | 1001 | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | Baseline Model | primary-country-28 | 2022-05-06 | merging | compact-accredit-68 | 1002 | 1002 | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | Distributed Cluster | adaptive-country-29 | 2023-10-17 | accredited | composite-accredit-69 | 1003 | 1003 | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Universities represent the academic institutions subject to quality assurance oversight. The `universities` table records each institution with an `id`, a `university_id`, and a `name` that corresponds to the associated quality assurance system. The `country` field identifies the nation in which the university operates, with values such as `compact-country-26`, `composite-country-27`, `primary-country-28`, and `adaptive-country-29`. The `establishment_date` records when the university was founded, while `status` indicates its current operational state—active, inactive, merging, or dissolved. The `university_type` field classifies the institution, with values including `compact-university-34`, `composite-university-35`, `primary-university-36`, and `adaptive-university-37`. Each university is linked to a quality assurance system via `quality_assurance_system_id` and to a national commission via `national_commission_id`, establishing the chain of regulatory oversight from commission to institution.

**Table `trainings_commissions`**

| capacity_building_training_id | national_commission_id |
|---|---|
| 1 | 1000 |
| 1 | 1001 |
| 2 | 1001 |
| 2 | 1002 |
| 3 | 1002 |
| 3 | 1003 |
| 4 | 1003 |
| 4 | 1000 |

The `trainings_commissions` table captures the many-to-many relationships between capacity building trainings and national commissions, enabling a single training to be associated with multiple commissions and a single commission to oversee multiple trainings. This junction table uses `training_id` and `commission_id` as composite foreign keys, creating a flexible mapping that supports complex organizational structures where training programs span multiple jurisdictions and commissions coordinate across diverse training portfolios.

**Table `commissions_universities`**

| national_commission_id | university_id |
|---|---|
| 1000 | 1 |
| 1000 | 2 |
| 1001 | 2 |
| 1001 | 3 |
| 1002 | 3 |
| 1002 | 4 |
| 1003 | 4 |
| 1003 | 1 |

The `commissions_universities` table records the many-to-many relationships between national commissions and universities, allowing a single commission to exercise oversight over multiple institutions and a single university to be subject to multiple commission jurisdictions. This junction table uses `commission_id` and `university_id` as composite foreign keys, providing the structural flexibility needed for cross-border regulatory arrangements and shared oversight models.

### Cross-Referenced Views and Analytical Relationships

The domain's analytical power emerges through a set of pre-constructed views that join base tables to answer specific operational questions. Each view materializes a particular relationship, enabling practitioners to trace governance connections across the ecosystem.

**View `v_quality_assurance_system_institutional_reform`**

```sql
CREATE VIEW v_quality_assurance_system_institutional_reform AS
SELECT a.quality_assurance_system_id, a.system_id, a.name, a.start_date, b.id AS reform_id, b.reform_id AS reform_reform_id, b.initiation_date AS reform_initiation_date
FROM quality_assurance_systems a JOIN institutional_reforms b ON a.institutional_reform_id = b.id;
```

| quality_assurance_system_id | system_id | name | start_date | reform_id | reform_reform_id | reform_initiation_date |
|---|---|---|---|---|---|---|
| 1000 | 8189503 | Extended Review | 2022-09-05T20:24:00 | 1 | state_uk_21 | 2025-12-09T11:57:00 |
| 1001 | 3717623 | Pilot Initiative A | 2023-02-16T03:41:00 | 2 | 506005 | 2022-05-20T18:14:00 |
| 1002 | 7441161 | Baseline Model | 2024-07-27T10:58:00 | 3 | 392505 | 2023-10-04T01:31:00 |
| 1003 | 605963 | Distributed Cluster | 2025-12-11T17:15:00 | 4 | b69ce49c-8fd1-11eb-924d-9cd76263cbd0 | 2024-03-15T08:48:00 |

This view joins quality assurance systems with their associated institutional reforms, answering the question of which reforms underpin each governance mechanism. A representative row would show the Extended Review system (id 1000) linked to the reform `state_uk_21`, which was initiated on 2025-12-09 under the legal basis `primary-legal-52` and carries a `compact-mandate-80` scope. This join enables auditors to verify that every quality assurance system has a corresponding legislative foundation and to assess whether reform statuses align with system statuses.

**View `v_quality_assurance_system_regional_qualifications_framework`**

```sql
CREATE VIEW v_quality_assurance_system_regional_qualifications_framework AS
SELECT a.quality_assurance_system_id, a.system_id, a.name, a.start_date, b.id AS framework_id, b.framework_id AS framework_framework_id, b.name AS framework_name
FROM quality_assurance_systems a JOIN regional_qualifications_frameworks b ON a.regional_qualifications_framework_id = b.id;
```

| quality_assurance_system_id | system_id | name | start_date | framework_id | framework_framework_id | framework_name |
|---|---|---|---|---|---|---|
| 1000 | 8189503 | Extended Review | 2022-09-05T20:24:00 | 100 | lu_tax_code_template_m11 | Extended Review |
| 1001 | 3717623 | Pilot Initiative A | 2023-02-16T03:41:00 | 101 | 228bd7e4-9bad-11eb-a8a2-19ed5c03f8d3 | Pilot Initiative A |
| 1002 | 7441161 | Baseline Model | 2024-07-27T10:58:00 | 102 | 8843756 | Baseline Model |
| 1003 | 605963 | Distributed Cluster | 2025-12-11T17:15:00 | 103 | ChIJm7V_gxFu5kcRAbqaOJHQUy0 | Distributed Cluster |

This view connects quality assurance systems to their regional qualifications frameworks, revealing the credential architecture that each system governs. For instance, the Baseline Model system (id 1002) is associated with framework id 102, which has 12 total levels and uses the `adaptive-credit-83` credit system. The view exposes the `version` and `status` of each framework, allowing practitioners to verify that framework development stages are consistent with the operational status of the parent system.

**View `v_quality_assurance_system_quality_assurance_office`**

```sql
CREATE VIEW v_quality_assurance_system_quality_assurance_office AS
SELECT a.quality_assurance_system_id, a.system_id, a.name, a.start_date, b.id AS office_id, b.office_id AS office_office_id, b.office_name AS office_office_name
FROM quality_assurance_systems a JOIN quality_assurance_offices b ON a.quality_assurance_office_id = b.id;
```

| quality_assurance_system_id | system_id | name | start_date | office_id | office_office_id | office_office_name |
|---|---|---|---|---|---|---|
| 1000 | 8189503 | Extended Review | 2022-09-05T20:24:00 | 100 | 5917279 | Pilot Review |
| 1001 | 3717623 | Pilot Initiative A | 2023-02-16T03:41:00 | 101 | 10445641 | Baseline Initiative |
| 1002 | 7441161 | Baseline Model | 2024-07-27T10:58:00 | 102 | 12715698 | Distributed Model A |
| 1003 | 605963 | Distributed Cluster | 2025-12-11T17:15:00 | 103 | 3012823 | Adaptive Cluster |

This view links quality assurance systems to their operational offices, providing a clear picture of which office implements which system. The Distributed Model A office (id 102) is linked to the Baseline Model system (id 1002), has 3 staff members, and holds an `operational` status. This relationship is critical for resource allocation and accountability, as it identifies the specific office responsible for executing each system's quality assurance mandate.

**View `v_institutional_reform_quality_assurance_system`**

```sql
CREATE VIEW v_institutional_reform_quality_assurance_system AS
SELECT a.id, a.reform_id, a.initiation_date, a.ratification_date, b.quality_assurance_system_id AS system_quality_assurance_system_id, b.system_id AS system_system_id, b.name AS system_name
FROM institutional_reforms a JOIN quality_assurance_systems b ON a.quality_assurance_system_id = b.quality_assurance_system_id;
```

| id | reform_id | initiation_date | ratification_date | system_quality_assurance_system_id | system_system_id | system_name |
|---|---|---|---|---|---|---|
| 1 | state_uk_21 | 2025-12-09T11:57:00 | 2024-03-20 | 1000 | 8189503 | Extended Review |
| 2 | 506005 | 2022-05-20T18:14:00 | 2025-08-04 | 1001 | 3717623 | Pilot Initiative A |
| 3 | 392505 | 2023-10-04T01:31:00 | 2022-01-15 | 1002 | 7441161 | Baseline Model |
| 4 | b69ce49c-8fd1-11eb-924d-9cd76263cbd0 | 2024-03-15T08:48:00 | 2023-06-26 | 1003 | 605963 | Distributed Cluster |

This view presents the inverse perspective of the system-to-reform relationship, starting from the reform and tracing to its parent system. It answers the question of which quality assurance system a given reform supports. For example, the reform `506005`, initiated on 2022-05-20 with `adaptive-legal-53` as its legal basis, supports the Pilot Initiative A system (id 1001). This view is particularly useful for reform tracking and for assessing whether all reforms have been properly integrated into active quality assurance systems.

**View `v_regional_qualifications_framework_quality_assurance_system`**

```sql
CREATE VIEW v_regional_qualifications_framework_quality_assurance_system AS
SELECT a.id, a.framework_id, a.name, a.version, b.quality_assurance_system_id AS system_quality_assurance_system_id, b.system_id AS system_system_id, b.name AS system_name
FROM regional_qualifications_frameworks a JOIN quality_assurance_systems b ON a.quality_assurance_system_id = b.quality_assurance_system_id;
```

| id | framework_id | name | version | system_quality_assurance_system_id | system_system_id | system_name |
|---|---|---|---|---|---|---|
| 100 | lu_tax_code_template_m11 | Extended Review | seasonal-version-71 | 1000 | 8189503 | Extended Review |
| 101 | 228bd7e4-9bad-11eb-a8a2-19ed5c03f8d3 | Pilot Initiative A | regional-version-72 | 1001 | 3717623 | Pilot Initiative A |
| 102 | 8843756 | Baseline Model | legacy-version-73 | 1002 | 7441161 | Baseline Model |
| 103 | ChIJm7V_gxFu5kcRAbqaOJHQUy0 | Distributed Cluster | compact-version-74 | 1003 | 605963 | Distributed Cluster |

This view presents the inverse perspective of the framework-to-system relationship, starting from the qualifications framework and tracing to its governing system. It enables practitioners to verify that each framework has an active quality assurance system overseeing its implementation. The Distributed Cluster framework (id 103), with `compact-version-74` and 4 total levels, is governed by the Distributed Cluster system (id 1003), which holds an `implemented` status.

**View `v_quality_assurance_office_quality_assurance_system`**

```sql
CREATE VIEW v_quality_assurance_office_quality_assurance_system AS
SELECT a.id, a.office_id, a.office_name, a.establishment_date, b.quality_assurance_system_id AS system_quality_assurance_system_id, b.system_id AS system_system_id, b.name AS system_name
FROM quality_assurance_offices a JOIN quality_assurance_systems b ON a.quality_assurance_system_id = b.quality_assurance_system_id;
```

| id | office_id | office_name | establishment_date | system_quality_assurance_system_id | system_system_id | system_name |
|---|---|---|---|---|---|---|
| 100 | 5917279 | Pilot Review | 2024-07-11 | 1000 | 8189503 | Extended Review |
| 101 | 10445641 | Baseline Initiative | 2025-12-22 | 1001 | 3717623 | Pilot Initiative A |
| 102 | 12715698 | Distributed Model A | 2022-05-06 | 1002 | 7441161 | Baseline Model |
| 103 | 3012823 | Adaptive Cluster | 2023-10-17 | 1003 | 605963 | Distributed Cluster |

This view presents the inverse perspective of the office-to-system relationship, starting from the quality assurance office and tracing to its parent system. It answers the question of which system each office implements. The Adaptive Cluster office (id 103), with 8 staff members and a `dissolved` status, implements the Distributed Cluster system (id 1003). This view is essential for understanding the operational capacity of dissolved or planned offices relative to their assigned systems.

**View `v_quality_assurance_office_capacity_building_training`**

```sql
CREATE VIEW v_quality_assurance_office_capacity_building_training AS
SELECT a.id, a.office_id, a.office_name, a.establishment_date, b.capacity_building_training_id AS training_capacity_building_training_id, b.training_id AS training_training_id, b.title AS training_title
FROM quality_assurance_offices a JOIN capacity_building_trainings b ON a.capacity_building_training_id = b.capacity_building_training_id;
```

| id | office_id | office_name | establishment_date | training_capacity_building_training_id | training_training_id | training_title |
|---|---|---|---|---|---|---|
| 100 | 5917279 | Pilot Review | 2024-07-11 | 1 | 1205-0002-M | Compact Initiative |
| 101 | 10445641 | Baseline Initiative | 2025-12-22 | 2 | c746bff2-8fcc-11eb-924d-9cd76263cbd0 | Legacy Model |
| 102 | 12715698 | Distributed Model A | 2022-05-06 | 3 | 34036cc6-9bad-11eb-a8a2-19ed5c03f8d3 | Regional Cluster A |
| 103 | 3012823 | Adaptive Cluster | 2023-10-17 | 4 | 10207144 | Seasonal Review |

This view links quality assurance offices to their associated capacity building trainings, revealing which office organizes or delivers each training program. The Pilot Review office (id 100) is associated with the Compact Initiative training (id 1), which has 25 participants and a `planned` status. This relationship is critical for understanding the training delivery infrastructure and for ensuring that offices have the capacity to support their assigned training portfolios.

**View `v_capacity_building_training_quality_assurance_office`**

```sql
CREATE VIEW v_capacity_building_training_quality_assurance_office AS
SELECT a.capacity_building_training_id, a.training_id, a.title, a.start_date, b.id AS office_id, b.office_id AS office_office_id, b.office_name AS office_office_name
FROM capacity_building_trainings a JOIN quality_assurance_offices b ON a.quality_assurance_office_id = b.id;
```

| capacity_building_training_id | training_id | title | start_date | office_id | office_office_id | office_office_name |
|---|---|---|---|---|---|---|
| 1 | 1205-0002-M | Compact Initiative | 2022-09-05T20:24:00 | 100 | 5917279 | Pilot Review |
| 2 | c746bff2-8fcc-11eb-924d-9cd76263cbd0 | Legacy Model | 2023-02-16T03:41:00 | 101 | 10445641 | Baseline Initiative |
| 3 | 34036cc6-9bad-11eb-a8a2-19ed5c03f8d3 | Regional Cluster A | 2024-07-27T10:58:00 | 102 | 12715698 | Distributed Model A |
| 4 | 10207144 | Seasonal Review | 2025-12-11T17:15:00 | 103 | 3012823 | Adaptive Cluster |

This view presents the inverse perspective of the training-to-office relationship, starting from the training and tracing to its parent office. It answers the question of which office is responsible for each training. The Legacy Model training (id 2), with 9 participants and a `scheduled` status, is managed by the Baseline Initiative office (id 101), which has 40 staff members and an `established` status. This view supports training accountability and resource planning.

**View `v_capacity_building_training_national_commission_detail`**

```sql
CREATE VIEW v_capacity_building_training_national_commission_detail AS
SELECT a.capacity_building_training_id, a.training_id, a.title, b.id AS commission_id, b.commission_id AS commission_commission_id, b.name AS commission_name
FROM capacity_building_trainings a
  JOIN trainings_commissions j ON j.capacity_building_training_id = a.capacity_building_training_id
  JOIN national_commissions b ON b.id = j.national_commission_id;
```

| capacity_building_training_id | training_id | title | commission_id | commission_commission_id | commission_name |
|---|---|---|---|---|---|
| 1 | 1205-0002-M | Compact Initiative | 1000 | 24563916 | Extended Review |
| 1 | 1205-0002-M | Compact Initiative | 1001 | c747f9a8-8fcc-11eb-924d-9cd76263cbd0 | Pilot Initiative A |
| 2 | c746bff2-8fcc-11eb-924d-9cd76263cbd0 | Legacy Model | 1001 | c747f9a8-8fcc-11eb-924d-9cd76263cbd0 | Pilot Initiative A |
| 2 | c746bff2-8fcc-11eb-924d-9cd76263cbd0 | Legacy Model | 1002 | 8928502 | Baseline Model |
| 3 | 34036cc6-9bad-11eb-a8a2-19ed5c03f8d3 | Regional Cluster A | 1002 | 8928502 | Baseline Model |
| 3 | 34036cc6-9bad-11eb-a8a2-19ed5c03f8d3 | Regional Cluster A | 1003 | 937734 | Distributed Cluster |
| 4 | 10207144 | Seasonal Review | 1003 | 937734 | Distributed Cluster |
| 4 | 10207144 | Seasonal Review | 1000 | 24563916 | Extended Review |

This view joins capacity building trainings with national commissions, revealing which commission oversees each training program. The Compact Initiative training (id 1) is overseen by the Extended Review commission (id 1000), which is active and operates under `distributed-jurisdic-48` jurisdiction. This view enables practitioners to verify that all training programs have appropriate commission oversight and to assess whether commission jurisdictions align with training target audiences.

**View `v_capacity_building_training_quality_assurance_system`**

```sql
CREATE VIEW v_capacity_building_training_quality_assurance_system AS
SELECT a.capacity_building_training_id, a.training_id, a.title, a.start_date, b.quality_assurance_system_id AS system_quality_assurance_system_id, b.system_id AS system_system_id, b.name AS system_name
FROM capacity_building_trainings a JOIN quality_assurance_systems b ON a.quality_assurance_system_id = b.quality_assurance_system_id;
```

| capacity_building_training_id | training_id | title | start_date | system_quality_assurance_system_id | system_system_id | system_name |
|---|---|---|---|---|---|---|
| 1 | 1205-0002-M | Compact Initiative | 2022-09-05T20:24:00 | 1000 | 8189503 | Extended Review |
| 2 | c746bff2-8fcc-11eb-924d-9cd76263cbd0 | Legacy Model | 2023-02-16T03:41:00 | 1001 | 3717623 | Pilot Initiative A |
| 3 | 34036cc6-9bad-11eb-a8a2-19ed5c03f8d3 | Regional Cluster A | 2024-07-27T10:58:00 | 1002 | 7441161 | Baseline Model |
| 4 | 10207144 | Seasonal Review | 2025-12-11T17:15:00 | 1003 | 605963 | Distributed Cluster |

This view links capacity building trainings directly to their parent quality assurance systems, providing a high-level view of which systems are supported by which training programs. The Regional Cluster A training (id 3), with 27 participants and an `in_progress` status, supports the Baseline Model system (id 1002), which holds a `ratified` status. This view is useful for assessing the alignment between training activities and system maturity levels.

**View `v_national_commission_quality_assurance_system`**

```sql
CREATE VIEW v_national_commission_quality_assurance_system AS
SELECT a.id, a.commission_id, a.name, a.country, b.quality_assurance_system_id AS system_quality_assurance_system_id, b.system_id AS system_system_id, b.name AS system_name
FROM national_commissions a JOIN quality_assurance_systems b ON a.quality_assurance_system_id = b.quality_assurance_system_id;
```

| id | commission_id | name | country | system_quality_assurance_system_id | system_system_id | system_name |
|---|---|---|---|---|---|---|
| 1000 | 24563916 | Extended Review | compact-country-26 | 1000 | 8189503 | Extended Review |
| 1001 | c747f9a8-8fcc-11eb-924d-9cd76263cbd0 | Pilot Initiative A | composite-country-27 | 1001 | 3717623 | Pilot Initiative A |
| 1002 | 8928502 | Baseline Model | primary-country-28 | 1002 | 7441161 | Baseline Model |
| 1003 | 937734 | Distributed Cluster | adaptive-country-29 | 1003 | 605963 | Distributed Cluster |

This view connects national commissions to their parent quality assurance systems, answering the question of which system each commission governs. The Baseline Model commission (id 1002) is in a `merging` status and operates under `pilot-jurisdic-50` jurisdiction, governing the Baseline Model system (id 1002). This view is essential for understanding the governance hierarchy and for identifying commissions that may require attention due to their operational status.

**View `v_national_commission_capacity_building_training`**

```sql
CREATE VIEW v_national_commission_capacity_building_training AS
SELECT a.id, a.commission_id, a.name, a.country, b.capacity_building_training_id AS training_capacity_building_training_id, b.training_id AS training_training_id, b.title AS training_title
FROM national_commissions a JOIN capacity_building_trainings b ON a.capacity_building_training_id = b.capacity_building_training_id;
```

| id | commission_id | name | country | training_capacity_building_training_id | training_training_id | training_title |
|---|---|---|---|---|---|---|
| 1000 | 24563916 | Extended Review | compact-country-26 | 1 | 1205-0002-M | Compact Initiative |
| 1001 | c747f9a8-8fcc-11eb-924d-9cd76263cbd0 | Pilot Initiative A | composite-country-27 | 2 | c746bff2-8fcc-11eb-924d-9cd76263cbd0 | Legacy Model |
| 1002 | 8928502 | Baseline Model | primary-country-28 | 3 | 34036cc6-9bad-11eb-a8a2-19ed5c03f8d3 | Regional Cluster A |
| 1003 | 937734 | Distributed Cluster | adaptive-country-29 | 4 | 10207144 | Seasonal Review |

This view links national commissions to the capacity building trainings they oversee, providing a comprehensive view of each commission's training portfolio. The Pilot Initiative A commission (id 1001), which is `inactive`, oversees the Legacy Model training (id 2) with 9 participants. This view supports resource planning and helps identify whether inactive commissions still have active training programs that require attention.

**View `v_national_commission_university_detail`**

```sql
CREATE VIEW v_national_commission_university_detail AS
SELECT a.id, a.commission_id, a.name, b.university_id AS university_university_id, b.name AS university_name, b.country AS university_country
FROM national_commissions a
  JOIN commissions_universities j ON j.national_commission_id = a.id
  JOIN universities b ON b.university_id = j.university_id;
```

| id | commission_id | name | university_university_id | university_name | university_country |
|---|---|---|---|---|---|
| 1000 | 24563916 | Extended Review | 1 | Extended Review | compact-country-26 |
| 1000 | 24563916 | Extended Review | 2 | Pilot Initiative A | composite-country-27 |
| 1001 | c747f9a8-8fcc-11eb-924d-9cd76263cbd0 | Pilot Initiative A | 2 | Pilot Initiative A | composite-country-27 |
| 1001 | c747f9a8-8fcc-11eb-924d-9cd76263cbd0 | Pilot Initiative A | 3 | Baseline Model | primary-country-28 |
| 1002 | 8928502 | Baseline Model | 3 | Baseline Model | primary-country-28 |
| 1002 | 8928502 | Baseline Model | 4 | Distributed Cluster | adaptive-country-29 |
| 1003 | 937734 | Distributed Cluster | 4 | Distributed Cluster | adaptive-country-29 |
| 1003 | 937734 | Distributed Cluster | 1 | Extended Review | compact-country-26 |

This view joins national commissions with the universities under their oversight, revealing the institutional reach of each commission. The Extended Review commission (id 1000), which is `active`, oversees the Extended Review university (id 1000) in `compact-country-26`. This view enables practitioners to assess the breadth of each commission's regulatory reach and to identify any gaps in institutional coverage.

**View `v_university_quality_assurance_system`**

```sql
CREATE VIEW v_university_quality_assurance_system AS
SELECT a.university_id, a.name, a.country, a.establishment_date, b.quality_assurance_system_id AS system_quality_assurance_system_id, b.system_id AS system_system_id, b.name AS system_name
FROM universities a JOIN quality_assurance_systems b ON a.quality_assurance_system_id = b.quality_assurance_system_id;
```

| university_id | name | country | establishment_date | system_quality_assurance_system_id | system_system_id | system_name |
|---|---|---|---|---|---|---|
| 1 | Extended Review | compact-country-26 | 2024-07-11 | 1000 | 8189503 | Extended Review |
| 2 | Pilot Initiative A | composite-country-27 | 2025-12-22 | 1001 | 3717623 | Pilot Initiative A |
| 3 | Baseline Model | primary-country-28 | 2022-05-06 | 1002 | 7441161 | Baseline Model |
| 4 | Distributed Cluster | adaptive-country-29 | 2023-10-17 | 1003 | 605963 | Distributed Cluster |

This view links universities to their parent quality assurance systems, providing a clear picture of which system governs each institution. The Distributed Cluster university (id 1003), which is `dissolved`, is governed by the Distributed Cluster system (id 1003), which holds an `implemented` status. This view is critical for understanding the governance coverage of the quality assurance ecosystem and for identifying institutions that may lack active system oversight.

**View `v_university_national_commission`**

```sql
CREATE VIEW v_university_national_commission AS
SELECT a.university_id, a.name, a.country, a.establishment_date, b.id AS commission_id, b.commission_id AS commission_commission_id, b.name AS commission_name
FROM universities a JOIN national_commissions b ON a.national_commission_id = b.id;
```

| university_id | name | country | establishment_date | commission_id | commission_commission_id | commission_name |
|---|---|---|---|---|---|---|
| 1 | Extended Review | compact-country-26 | 2024-07-11 | 1000 | 24563916 | Extended Review |
| 2 | Pilot Initiative A | composite-country-27 | 2025-12-22 | 1001 | c747f9a8-8fcc-11eb-924d-9cd76263cbd0 | Pilot Initiative A |
| 3 | Baseline Model | primary-country-28 | 2022-05-06 | 1002 | 8928502 | Baseline Model |
| 4 | Distributed Cluster | adaptive-country-29 | 2023-10-17 | 1003 | 937734 | Distributed Cluster |

This view connects universities to their overseeing national commissions, revealing the regulatory chain from institution to commission. The Baseline Model university (id 1002), which is `merging`, is overseen by the Baseline Model commission (id 1002), which is also in a `merging` status. This view supports regulatory compliance monitoring and helps identify institutions whose oversight commissions may be undergoing structural changes.

**View `v_university_capacity_building_training`**

```sql
CREATE VIEW v_university_capacity_building_training AS
SELECT a.university_id, a.name, a.country, a.establishment_date, b.capacity_building_training_id AS training_capacity_building_training_id, b.training_id AS training_training_id, b.title AS training_title
FROM universities a JOIN capacity_building_trainings b ON a.capacity_building_training_id = b.capacity_building_training_id;
```

| university_id | name | country | establishment_date | training_capacity_building_training_id | training_training_id | training_title |
|---|---|---|---|---|---|---|
| 1 | Extended Review | compact-country-26 | 2024-07-11 | 1 | 1205-0002-M | Compact Initiative |
| 2 | Pilot Initiative A | composite-country-27 | 2025-12-22 | 2 | c746bff2-8fcc-11eb-924d-9cd76263cbd0 | Legacy Model |
| 3 | Baseline Model | primary-country-28 | 2022-05-06 | 3 | 34036cc6-9bad-11eb-a8a2-19ed5c03f8d3 | Regional Cluster A |
| 4 | Distributed Cluster | adaptive-country-29 | 2023-10-17 | 4 | 10207144 | Seasonal Review |

This view links universities to capacity building trainings, revealing which institutions participate in or benefit from each training program. The Extended Review university (id 1000) is associated with the Compact Initiative training (id 1), which has 25 participants and a `planned` status. This view enables practitioners to assess training participation patterns across institutions and to identify universities that may need additional capacity-building support.

### Synthesis

The quality assurance governance ecosystem operates as an interconnected network of systems, reforms, frameworks, offices, trainings, commissions, and universities. Each entity carries its own lifecycle status and operational attributes, while foreign key relationships create a web of dependencies that can be traversed in multiple directions. The base tables provide the authoritative records for each entity type, while the analytical views enable practitioners to answer specific operational questions by joining related tables. Understanding these relationships is essential for auditing compliance, planning resource allocation, and ensuring that every institution has appropriate oversight through an active quality assurance system, a corresponding national commission, and access to relevant capacity-building trainings. The data model supports both hierarchical navigation—from system to reform to framework to office to training—and lateral analysis across jurisdictions, enabling comprehensive governance oversight across diverse institutional landscapes.