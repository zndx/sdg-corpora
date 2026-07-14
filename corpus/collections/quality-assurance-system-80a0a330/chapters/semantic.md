Quality assurance in higher education operates as a layered governance architecture: national commissions establish jurisdictional authority, quality assurance offices execute oversight, and institutional reforms along with regional qualifications frameworks define the regulatory boundaries within which universities function. Training programmes build the human capacity required for each office to operate effectively. The relational model captures this ecosystem through seven core entity tables, two many-to-many junction tables, and a suite of denormalised views that reassemble domain facts for analytical consumption. The central entity is `quality_assurance_systems`, which acts as the organisational spine—every other entity either points to it directly or reaches it through a chain of foreign keys.

## The Core Entity Tables

The table `quality_assurance_systems` anchors the entire schema. Each row represents a distinct quality assurance regime, identified by a surrogate `quality_assurance_system_id` (e.g. `1000`, `1001`, `1002`, `1003`) and a human-readable `system_id` such as `8189503` or `3717623`. The `name` column carries descriptive labels like *Extended Review*, *Pilot Initiative A*, *Baseline Model*, and *Distributed Cluster*. Temporal context is provided by `start_date` (e.g. `2022-09-05T20:24:00`), while `status` enumerates the lifecycle stage—*draft*, *consultation*, *ratified*, *implemented*. The `region` column distinguishes deployment zones such as `distributed-region-12` or `baseline-region-13`, and `framework_version` (e.g. `adaptive-framewor-53`) records the regulatory version in use. Three foreign-key columns—`institutional_reform_id`, `regional_qualifications_framework_id`, and `quality_assurance_office_id`—tie each system to exactly one reform, one regional framework, and one office, enforcing a one-to-one composition at the schema level.

**Table `quality_assurance_systems`**

| quality_assurance_system_id | system_id | name | start_date | status | region | framework_version | institutional_reform_id | regional_qualifications_framework_id | quality_assurance_office_id |
|---|---|---|---|---|---|---|---|---|---|
| 1000 | 8189503 | Extended Review | 2022-09-05T20:24:00 | draft | distributed-region-12 | adaptive-framewor-53 | 1 | 100 | 100 |
| 1001 | 3717623 | Pilot Initiative A | 2023-02-16T03:41:00 | consultation | baseline-region-13 | distributed-framewor-54 | 2 | 101 | 101 |
| 1002 | 7441161 | Baseline Model | 2024-07-27T10:58:00 | ratified | pilot-region-14 | baseline-framewor-55 | 3 | 102 | 102 |
| 1003 | 605963 | Distributed Cluster | 2025-12-11T17:15:00 | implemented | extended-region-15 | pilot-framewor-56 | 4 | 103 | 103 |

The `institutional_reforms` table captures the legislative instruments that authorise each quality assurance system. Its primary key `id` (values `1` through `4`) maps to a `reform_id` such as `state_uk_21` or the UUID `b69ce49c-8fd1-11eb-924d-9cd76263cbd0`. The `initiation_date` and `ratification_date` columns bracket the policy lifecycle, while `legal_basis` (e.g. `primary-legal-52`, `adaptive-legal-53`) classifies the statutory source. The `status` column takes values like *initiated*, *in_progress*, *completed*, *ratified*, and `mandate_scope` (e.g. `compact-mandate-80`, `composite-mandate-81`) describes the breadth of authority. The foreign key `quality_assurance_system_id` points back to `quality_assurance_systems`, establishing that each reform belongs to exactly one system.

**Table `institutional_reforms`**

| id | reform_id | initiation_date | ratification_date | legal_basis | status | mandate_scope | quality_assurance_system_id |
|---|---|---|---|---|---|---|---|
| 1 | state_uk_21 | 2025-12-09T11:57:00 | 2024-03-20 | primary-legal-52 | initiated | compact-mandate-80 | 1000 |
| 2 | 506005 | 2022-05-20T18:14:00 | 2025-08-04 | adaptive-legal-53 | in_progress | composite-mandate-81 | 1001 |
| 3 | 392505 | 2023-10-04T01:31:00 | 2022-01-15 | distributed-legal-54 | completed | primary-mandate-82 | 1002 |
| 4 | b69ce49c-8fd1-11eb-924d-9cd76263cbd0 | 2024-03-15T08:48:00 | 2023-06-26 | baseline-legal-55 | ratified | adaptive-mandate-83 | 1003 |

Regional qualifications frameworks are stored in `regional_qualifications_frameworks`. The surrogate key `id` (values `100`–`103`) pairs with a `framework_id` such as `lu_tax_code_template_m11` or `ChIJm7V_gxFu5kcRAbqaOJHQUy0`. The `name` column mirrors the system name (e.g. *Extended Review*, *Pilot Initiative A*), while `version` (e.g. `seasonal-version-71`, `regional-version-72`) and `status` (*in_development*, *draft*, *published*, *implemented*) track the framework's maturity. The `total_levels` column records the number of qualification levels—values range from `2` to `12`—and `credit_system_type` (e.g. `composite-credit-81`, `primary-credit-82`) specifies the credit architecture. Timestamps `created_at` and `updated_at` provide audit trails. The FK `quality_assurance_system_id` links each framework to its parent system.

**Table `regional_qualifications_frameworks`**

| id | framework_id | name | version | status | total_levels | credit_system_type | quality_assurance_system_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|
| 100 | lu_tax_code_template_m11 | Extended Review | seasonal-version-71 | in_development | 2 | composite-credit-81 | 1000 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 101 | 228bd7e4-9bad-11eb-a8a2-19ed5c03f8d3 | Pilot Initiative A | regional-version-72 | draft | 12 | primary-credit-82 | 1001 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 102 | 8843756 | Baseline Model | legacy-version-73 | published | 12 | adaptive-credit-83 | 1002 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 103 | ChIJm7V_gxFu5kcRAbqaOJHQUy0 | Distributed Cluster | compact-version-74 | implemented | 4 | distributed-credit-84 | 1003 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The `quality_assurance_offices` table models the operational bodies that carry out assurance activities. Its surrogate `id` (values `100`–`103`) pairs with an `office_id` such as `5917279` or `10445641`. The `office_name` column carries labels like *Pilot Review*, *Baseline Initiative*, *Distributed Model A*, and *Adaptive Cluster*. The `establishment_date` (e.g. `2024-07-11`), `location` (e.g. `extended-location-99`, `integrated-location-100`), and `status` (*planned*, *established*, *operational*, *dissolved*) describe the office's state. The `staff_count` column (values `21`, `40`, `3`, `8`) quantifies human resources. The FK `quality_assurance_system_id` ties the office to its governing system, while `capacity_building_training_id` links it to a training programme.

**Table `quality_assurance_offices`**

| id | office_id | office_name | establishment_date | location | status | staff_count | quality_assurance_system_id | capacity_building_training_id | created_at |
|---|---|---|---|---|---|---|---|---|---|
| 100 | 5917279 | Pilot Review | 2024-07-11 | extended-location-99 | planned | 21 | 1000 | 1 | 2025-01-01 00:14:00 |
| 101 | 10445641 | Baseline Initiative | 2025-12-22 | integrated-location-100 | established | 40 | 1001 | 2 | 2025-02-06 03:14:00 |
| 102 | 12715698 | Distributed Model A | 2022-05-06 | seasonal-location-101 | operational | 3 | 1002 | 3 | 2025-03-11 06:14:00 |
| 103 | 3012823 | Adaptive Cluster | 2023-10-17 | regional-location-102 | dissolved | 8 | 1003 | 4 | 2025-04-16 09:14:00 |

Capacity-building trainings are recorded in `capacity_building_trainings`. The surrogate `capacity_building_training_id` (values `1`–`4`) pairs with a `training_id` such as `1205-0002-M` or the UUID `c746bff2-8fcc-11eb-924d-9cd76263cbd0`. The `title` column carries names like *Compact Initiative*, *Legacy Model*, *Regional Cluster A*, and *Seasonal Review*. The `start_date` and `end_date` columns bracket the training period, while `target_audience` (e.g. `legacy-target-25`, `compact-target-26`) identifies the intended participants. The `status` column takes values *planned*, *scheduled*, *in_progress*, *completed*, and `participants_count` (values `25`, `9`, `27`, `45`) records attendance. The FK `quality_assurance_office_id` links the training to its host office, and `quality_assurance_system_id` provides a direct reference to the parent system.

**Table `capacity_building_trainings`**

| capacity_building_training_id | training_id | title | start_date | end_date | target_audience | status | participants_count | quality_assurance_office_id | quality_assurance_system_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 1205-0002-M | Compact Initiative | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | legacy-target-25 | planned | 25 | 100 | 1000 |
| 2 | c746bff2-8fcc-11eb-924d-9cd76263cbd0 | Legacy Model | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | compact-target-26 | scheduled | 9 | 101 | 1001 |
| 3 | 34036cc6-9bad-11eb-a8a2-19ed5c03f8d3 | Regional Cluster A | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | composite-target-27 | in_progress | 27 | 102 | 1002 |
| 4 | 10207144 | Seasonal Review | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | primary-target-28 | completed | 45 | 103 | 1003 |

National commissions are stored in `national_commissions`. The surrogate `id` (values `1000`–`1003`) pairs with a `commission_id` such as `24563916` or the UUID `c747f9a8-8fcc-11eb-924d-9cd76263cbd0`. The `name` column mirrors the system labels (*Extended Review*, *Pilot Initiative A*, etc.), while `country` (e.g. `compact-country-26`, `composite-country-27`) identifies the jurisdiction. The `establishment_date` (e.g. `2024-07-11`), `status` (*active*, *inactive*, *merging*, *dissolved*), and `jurisdiction_level` (e.g. `distributed-jurisdic-48`, `baseline-jurisdic-49`) describe the commission's operational profile. The FK `quality_assurance_system_id` links the commission to its system, and `capacity_building_training_id` links it to a training programme.

**Table `national_commissions`**

| id | commission_id | name | country | establishment_date | status | jurisdiction_level | quality_assurance_system_id | capacity_building_training_id |
|---|---|---|---|---|---|---|---|---|
| 1000 | 24563916 | Extended Review | compact-country-26 | 2024-07-11 | active | distributed-jurisdic-48 | 1000 | 1 |
| 1001 | c747f9a8-8fcc-11eb-924d-9cd76263cbd0 | Pilot Initiative A | composite-country-27 | 2025-12-22 | inactive | baseline-jurisdic-49 | 1001 | 2 |
| 1002 | 8928502 | Baseline Model | primary-country-28 | 2022-05-06 | merging | pilot-jurisdic-50 | 1002 | 3 |
| 1003 | 937734 | Distributed Cluster | adaptive-country-29 | 2023-10-17 | dissolved | extended-jurisdic-51 | 1003 | 4 |

The `universities` table models higher education institutions within the quality assurance ecosystem. Each university is assigned a surrogate identifier and a `university_id` that serves as the natural key. The `name` column carries institutional labels, while `country` identifies the nation of operation. The `establishment_date` records when the institution was founded, and `status` enumerates its current state. The FK `quality_assurance_system_id` ties each university to a governing quality assurance system, and `national_commission_id` links it to the relevant national commission.

**Table `universities`**

| university_id | name | country | establishment_date | status | accreditation_status | quality_assurance_system_id | national_commission_id | capacity_building_training_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | Extended Review | compact-country-26 | 2024-07-11 | operational | regional-accredit-66 | 1000 | 1000 | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | Pilot Initiative A | composite-country-27 | 2025-12-22 | closed | legacy-accredit-67 | 1001 | 1001 | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | Baseline Model | primary-country-28 | 2022-05-06 | merging | compact-accredit-68 | 1002 | 1002 | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | Distributed Cluster | adaptive-country-29 | 2023-10-17 | accredited | composite-accredit-69 | 1003 | 1003 | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

## Many-to-Many Junction Tables

Two junction tables resolve many-to-many relationships that cannot be expressed through simple foreign keys. The `trainings_commissions` table resolves the relationship between `capacity_building_trainings` and `national_commissions`, allowing a single training programme to be associated with multiple commissions and vice versa. Its composite key comprises `training_id` and `commission_id`, each referencing the respective parent table.

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

The `commissions_universities` table resolves the relationship between `national_commissions` and `universities`. Its composite key of `commission_id` and `university_id` permits a commission to oversee multiple universities and a university to fall under multiple commissions, reflecting the complex regulatory realities of higher education governance.

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

## View-Based Reassembly of Domain Facts

The denormalised views reconstruct multi-table domain facts by joining the normalised base tables. Each view answers a specific analytical question by materialising the relationships that would otherwise require explicit joins at query time.

The view `v_quality_assurance_system_institutional_reform` joins `quality_assurance_systems` with `institutional_reforms` on `quality_assurance_systems.institutional_reform_id = institutional_reforms.id`. It answers the question: *Which institutional reform authorises each quality assurance system?* A representative row shows system `1000` (*Extended Review*, status *draft*, region `distributed-region-12`) linked to reform `1` (`state_uk_21`, legal basis `primary-legal-52`, status *initiated*, mandate scope `compact-mandate-80`).

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

The view `v_quality_assurance_system_regional_qualifications_framework` joins `quality_assurance_systems` with `regional_qualifications_frameworks` on `quality_assurance_systems.regional_qualifications_framework_id = regional_qualifications_frameworks.id`. It answers: *Which regional qualifications framework applies to each quality assurance system?* A row shows system `1000` (*Extended Review*) linked to framework `100` (`lu_tax_code_template_m11`, version `seasonal-version-71`, status *in_development*, `total_levels = 2`, credit system `composite-credit-81`).

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

The view `v_quality_assurance_system_quality_assurance_office` joins `quality_assurance_systems` with `quality_assurance_offices` on `quality_assurance_systems.quality_assurance_office_id = quality_assurance_offices.id`. It answers: *Which office executes assurance for each system?* A row shows system `1000` (*Extended Review*) linked to office `100` (*Pilot Review*, location `extended-location-99`, status *planned*, staff count `21`).

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

The view `v_institutional_reform_quality_assurance_system` reverses the perspective, joining `institutional_reforms` with `quality_assurance_systems` on `institutional_reforms.quality_assurance_system_id = quality_assurance_systems.quality_assurance_system_id`. It answers: *Which quality assurance system is authorised by each institutional reform?* A row shows reform `1` (`state_uk_21`, status *initiated*, mandate `compact-mandate-80`) linked to system `1000` (*Extended Review*, status *draft*, region `distributed-region-12`).

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

The view `v_regional_qualifications_framework_quality_assurance_system` joins `regional_qualifications_frameworks` with `quality_assurance_systems` on `regional_qualifications_frameworks.quality_assurance_system_id = quality_assurance_systems.quality_assurance_system_id`. It answers: *Which quality assurance system does each regional framework support?* A row shows framework `100` (*Extended Review*, version `seasonal-version-71`, `total_levels = 2`) linked to system `1000` (*Extended Review*, status *draft*).

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

The view `v_quality_assurance_office_quality_assurance_system` joins `quality_assurance_offices` with `quality_assurance_systems` on `quality_assurance_offices.quality_assurance_system_id = quality_assurance_systems.quality_assurance_system_id`. It answers: *Which quality assurance system does each office serve?* A row shows office `100` (*Pilot Review*, staff count `21`) linked to system `1000` (*Extended Review*, region `distributed-region-12`).

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

The view `v_quality_assurance_office_capacity_building_training` joins `quality_assurance_offices` with `capacity_building_trainings` on `quality_assurance_offices.capacity_building_training_id = capacity_building_trainings.capacity_building_training_id`. It answers: *Which training programme is associated with each quality assurance office?* A row shows office `100` (*Pilot Review*, status *planned*) linked to training `1` (*Compact Initiative*, title `1205-0002-M`, status *planned*, participants `25`).

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

The view `v_capacity_building_training_quality_assurance_office` reverses the perspective, joining `capacity_building_trainings` with `quality_assurance_offices` on `capacity_building_trainings.quality_assurance_office_id = quality_assurance_offices.id`. It answers: *Which office hosts each training programme?* A row shows training `1` (*Compact Initiative*, target audience `legacy-target-25`) linked to office `100` (*Pilot Review*, location `extended-location-99`).

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

The view `v_capacity_building_training_national_commission_detail` joins `capacity_building_trainings` with `national_commissions` on `capacity_building_trainings.quality_assurance_system_id = national_commissions.quality_assurance_system_id`. It answers: *Which national commission is associated with each training through their shared quality assurance system?* A row shows training `1` (*Compact Initiative*, participants `25`) linked to commission `1000` (*Extended Review*, country `compact-country-26`, status *active*).

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

The view `v_capacity_building_training_quality_assurance_system` joins `capacity_building_trainings` with `quality_assurance_systems` on `capacity_building_trainings.quality_assurance_system_id = quality_assurance_systems.quality_assurance_system_id`. It answers: *Which quality assurance system does each training programme support?* A row shows training `1` (*Compact Initiative*, status *planned*) linked to system `1000` (*Extended Review*, status *draft*, region `distributed-region-12`).

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

The view `v_national_commission_quality_assurance_system` joins `national_commissions` with `quality_assurance_systems` on `national_commissions.quality_assurance_system_id = quality_assurance_systems.quality_assurance_system_id`. It answers: *Which quality assurance system does each national commission govern?* A row shows commission `1000` (*Extended Review*, country `compact-country-26`, status *active*) linked to system `1000` (*Extended Review*, status *draft*, region `distributed-region-12`).

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

The view `v_national_commission_capacity_building_training` joins `national_commissions` with `capacity_building_trainings` on `national_commissions.capacity_building_training_id = capacity_building_trainings.capacity_building_training_id`. It answers: *Which training programme is associated with each national commission?* A row shows commission `1000` (*Extended Review*, jurisdiction `distributed-jurisdic-48`) linked to training `1` (*Compact Initiative*, participants `25`).

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

The view `v_national_commission_university_detail` joins `national_commissions` with `universities` through the junction table `commissions_universities`, linking `national_commissions.id = commissions_universities.commission_id` and `commissions_universities.university_id = universities.id`. It answers: *Which universities fall under the jurisdiction of each national commission?* A row shows commission `1000` (*Extended Review*, status *active*) linked to a university within the same country `compact-country-26`.

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

The view `v_university_quality_assurance_system` joins `universities` with `quality_assurance_systems` on `universities.quality_assurance_system_id = quality_assurance_systems.quality_assurance_system_id`. It answers: *Which quality assurance system governs each university?* A row shows a university linked to system `1000` (*Extended Review*, status *draft*, region `distributed-region-12`).

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

The view `v_university_national_commission` joins `universities` with `national_commissions` through the junction table `commissions_universities`, linking `universities.id = commissions_universities.university_id` and `commissions_universities.commission_id = national_commissions.id`. It answers: *Which national commission oversees each university?* A row shows a university linked to commission `1000` (*Extended Review*, country `compact-country-26`, status *active*).

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

The view `v_university_capacity_building_training` joins `universities` with `capacity_building_trainings` through the chain `universities.quality_assurance_system_id = quality_assurance_systems.quality_assurance_system_id` and `quality_assurance_systems.quality_assurance_office_id = quality_assurance_offices.id` and `quality_assurance_offices.capacity_building_training_id = capacity_building_trainings.capacity_building_training_id`. It answers: *Which training programmes are available to each university through their quality assurance office?* A row shows a university linked to training `1` (*Compact Initiative*, participants `25`).

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

## Synthesis

The relational schema models quality assurance in higher education as a hub-and-spoke architecture centred on `quality_assurance_systems`. Each system composes exactly one institutional reform, one regional qualifications framework, and one quality assurance office, while capacity-building trainings, national commissions, and universities attach through direct foreign keys or through the junction tables `trainings_commissions` and `commissions_universities`. The twenty denormalised views provide bidirectional navigability across this graph, allowing analysts to query from any entity's perspective and reconstruct the full chain of governance relationships in a single result set. The design balances normalisation—minimising redundancy across seven core tables and two junctions—with analytical convenience through pre-joined views that materialise the domain facts most commonly required in policy and operational reporting.