The healthcare analytics domain is modelled as a normalized relational schema that captures the interplay between organizations, their clinical data pipelines, the professionals who operate them, and the software solutions that augment decision-making. At the centre of the model sit six base tables: `healthcare_organizations`, `electronic_health_records`, `clinical_data_points`, `healthcare_professionals`, `analytics_solutions`, and `clinical_decision_supports`, linked through four junction tables — `records_points`, `professionals_points`, `solutions_records`, and `supports_professionals` — that resolve many-to-many relationships into first normal form. The resulting schema supports thirteen derived views, each answering a specific analytical question by joining two or more base tables along their foreign-key edges.

## Entity types and their attributes

The domain's core entity is the healthcare organization. Each row in `healthcare_organizations` represents a distinct legal or operational entity, identified by a surrogate `id` and a human-readable `organization_id`. The table stores descriptive attributes — `name`, `location`, `established_date` — alongside operational metrics such as `operating_margin` and a boolean flag `is_sustainable`. For example, the organization `Shell Oil` (id `1000`, location `extended-location-99`) was established on `2024-03-27` and reports an operating margin of `21.70`, while `GlobalPlatform Inc.` (id `1001`, location `integrated-location-100`) has a higher margin of `25.40` but is flagged as non-sustainable.

**Table `healthcare_organizations`**

| id | organization_id | name | location | established_date | operating_margin | is_sustainable | electronic_health_record_ehr_id | healthcare_professional_id | analytics_solution_id |
|---|---|---|---|---|---|---|---|---|---|
| 1000 | Shell Oil | Extended Review | extended-location-99 | 2024-03-27 | 21.70 | true | 195366 | 1 | 100 |
| 1001 | GlobalPlatform Inc. | Pilot Initiative A | integrated-location-100 | 2025-08-11 | 25.40 | false | 611509 | 2 | 101 |
| 1002 | Whatsapp Inc. | Baseline Model | seasonal-location-101 | 2022-01-22 | 29.10 | true | 884338 | 3 | 102 |
| 1003 | American Institutes for Research | Distributed Cluster | regional-location-102 | 2023-06-06 | 32.80 | false | gd_taxc_1123 | 4 | 103 |

Electronic health records form the second primary entity. The `electronic_health_records` table stores each record under a composite `ehr_id` that may be purely numeric (e.g., `195366`) or UUID-like (e.g., `gd_taxc_1123`). Attributes include the `patient_id` (such as `8387541`), the `collection_date` timestamp, and two dimensional descriptors — `data_volume` (ranging from `9.95` to `18.80`) and `data_variety` (values like `adaptive-data-65` or `pilot-data-68`). The `status` column constrains records to one of three states: `active`, `archived`, or `incomplete`. Every EHR row carries a foreign key `healthcare_organization_id` that anchors it to its parent organization.

**Table `electronic_health_records`**

| ehr_id | patient_id | collection_date | data_volume | data_variety | status | healthcare_organization_id |
|---|---|---|---|---|---|---|
| 195366 | 8387541 | 2025-12-17T11:57:00 | 9.95 | adaptive-data-65 | active | 1000 |
| 611509 | 10207142 | 2022-05-01T18:14:00 | 12.90 | distributed-data-66 | archived | 1001 |
| 884338 | 7119782 | 2023-10-12T01:31:00 | 15.85 | baseline-data-67 | incomplete | 1002 |
| gd_taxc_1123 | gd_acc_160003 | 2024-03-23T08:48:00 | 18.80 | pilot-data-68 | active | 1003 |

Clinical data points are the finest-grained measurement entity. The `clinical_data_points` table uses a surrogate `clinical_data_point_id` alongside a business `data_point_id` that can be numeric (`726063`), short alphanumeric (`id_24`), or a full UUID (`e878ea4c-8fd1-11eb-924d-9cd76263cbd0`). Each point records a `measurement_type` (e.g., `adaptive-measurem-89`), a numeric `value` (from `19.95` to `25.80`), a `unit` (such as `distributed-unit-18`), and an `timestamp`. The boolean `is_anomalous` flag marks outliers. Two foreign keys — `electronic_health_record_ehr_id` and `healthcare_professional_id` — tie each measurement to its parent EHR and to the clinician who generated it.

**Table `clinical_data_points`**

| clinical_data_point_id | data_point_id | measurement_type | value | unit | timestamp | is_anomalous | electronic_health_record_ehr_id | healthcare_professional_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 726063 | adaptive-measurem-89 | 19.95 | distributed-unit-18 | 2024-07-08T18:18:00 | true | 195366 | 1 |
| 2 | id_24 | distributed-measurem-90 | 21.90 | baseline-unit-19 | 2025-12-19T01:35:00 | false | 611509 | 2 |
| 3 | e878ea4c-8fd1-11eb-924d-9cd76263cbd0 | baseline-measurem-91 | 23.85 | pilot-unit-20 | 2022-05-03T08:52:00 | true | 884338 | 3 |
| 4 | ar_001 | pilot-measurem-92 | 25.80 | extended-unit-21 | 2023-10-14T15:09:00 | false | gd_taxc_1123 | 4 |

Healthcare professionals are modelled in `healthcare_professionals`, where each row carries a surrogate `id`, a business `professional_id` (e.g., `5082965`), a `name`, a `specialty` code, a `license_number` (such as `LIC-2589`), and an `employment_status` constrained to `active`, `inactive`, or `on_leave`. The foreign key `healthcare_organization_id` assigns each professional to an organization.

**Table `healthcare_professionals`**

| id | professional_id | name | specialty | license_number | employment_status | healthcare_organization_id |
|---|---|---|---|---|---|---|
| 1 | 5082965 | Extended Review | extended-specialt-21 | LIC-2589 | active | 1000 |
| 2 | 2618560 | Pilot Initiative A | integrated-specialt-22 | LIC-2596 | inactive | 1001 |
| 3 | 3355767 | Baseline Model | seasonal-specialt-23 | LIC-2603 | on_leave | 1002 |
| 4 | 3355784 | Distributed Cluster | regional-specialt-24 | LIC-2610 | active | 1003 |

Analytics solutions are captured in `analytics_solutions`. Each row has a surrogate `id`, a business `solution_id`, a `name`, a `type` (one of `clinical`, `business`, or `big_data`), a `provider` string, a `deployment_date`, a boolean `is_web_based`, and a `created_at` timestamp. The foreign key `healthcare_organization_id` links the solution to its deploying organization.

**Table `analytics_solutions`**

| id | solution_id | name | type | provider | deployment_date | is_web_based | healthcare_organization_id | created_at |
|---|---|---|---|---|---|---|---|---|
| 100 | 4793487 | Extended Review | clinical | legacy-provider-37 | 2023-02-14 | false | 1000 | 2025-01-01 00:14:00 |
| 101 | 5844272 | Pilot Initiative A | business | compact-provider-38 | 2024-07-25 | true | 1001 | 2025-02-06 03:14:00 |
| 102 | 0470021411 | Baseline Model | big_data | composite-provider-39 | 2025-12-09 | false | 1002 | 2025-03-11 06:14:00 |
| 103 | 7021001070020 | Distributed Cluster | clinical | primary-provider-40 | 2022-05-20 | true | 1003 | 2025-04-16 09:14:00 |

Clinical decision supports represent the highest-level decision-support artefacts. The `clinical_decision_supports` table stores a UUID or string `cds_id`, a `trigger_condition`, a `recommendation` string, an `effectiveness_score` (ranging from `3.45` to `10.80`), a `last_updated` timestamp, a boolean `is_proactive`, and a foreign key `analytics_solution_id` that binds the CDS to its parent analytics solution.

**Table `clinical_decision_supports`**

| cds_id | trigger_condition | recommendation | effectiveness_score | last_updated | is_proactive | analytics_solution_id |
|---|---|---|---|---|---|---|
| 784e2c06-8fb2-11eb-924d-9cd76263cbd0 | legacy-trigger-49 | pilot-recommen-38 | 3.45 | 2023-06-17T17:27:00 | false | 100 |
| 9568460 | compact-trigger-50 | extended-recommen-39 | 5.90 | 2024-11-01T00:44:00 | true | 101 |
| Invoices | composite-trigger-51 | integrated-recommen-40 | 8.35 | 2025-04-12T07:01:00 | false | 102 |
| Tanggal | primary-trigger-52 | seasonal-recommen-41 | 10.80 | 2022-09-23T14:18:00 | true | 103 |

## Junction tables and many-to-many relationships

Four junction tables resolve relationships that cannot be expressed through a single foreign key. The table `records_points` connects electronic health records to clinical data points, allowing a single EHR to be associated with multiple measurements and vice versa. Similarly, `professionals_points` links healthcare professionals to clinical data points, enabling a clinician to be credited with multiple measurements across different EHRs.

**Table `records_points`**

| electronic_health_record_ehr_id | clinical_data_point_id |
|---|---|
| 195366 | 1 |
| 195366 | 2 |
| 611509 | 2 |
| 611509 | 3 |
| 884338 | 3 |
| 884338 | 4 |
| gd_taxc_1123 | 4 |
| gd_taxc_1123 | 1 |

**Table `professionals_points`**

| healthcare_professional_id | clinical_data_point_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

The junction table `solutions_records` associates analytics solutions with electronic health records, supporting scenarios where a single solution is applied across multiple EHRs or a single EHR is analysed by multiple solutions. The final junction, `supports_professionals`, connects clinical decision supports to healthcare professionals, allowing a CDS rule to be assigned to multiple clinicians and a clinician to be associated with multiple CDS rules.

**Table `solutions_records`**

| analytics_solution_id | electronic_health_record_ehr_id |
|---|---|
| 100 | 195366 |
| 100 | 611509 |
| 101 | 611509 |
| 101 | 884338 |
| 102 | 884338 |
| 102 | gd_taxc_1123 |
| 103 | gd_taxc_1123 |
| 103 | 195366 |

**Table `supports_professionals`**

| clinical_decision_support_cds_id | healthcare_professional_id |
|---|---|
| 784e2c06-8fb2-11eb-924d-9cd76263cbd0 | 1 |
| 784e2c06-8fb2-11eb-924d-9cd76263cbd0 | 2 |
| 9568460 | 2 |
| 9568460 | 3 |
| Invoices | 3 |
| Invoices | 4 |
| Tanggal | 4 |
| Tanggal | 1 |

## Materialization through views

Each view materializes a specific analytical question by joining two base tables along their foreign-key relationship. The view `healthcare_organization_electronic_health_record_view` reconstructs the fact that a given organization owns a set of EHRs. Reading a concrete row, one sees that organization `Shell Oil` (id `1000`) is linked to EHR `195366` (patient `8387541`, status `active`), confirming the one-to-many cardinality from organization to EHR.

**View `healthcare_organization_electronic_health_record_view`**

```sql
CREATE VIEW healthcare_organization_electronic_health_record_view AS
SELECT a.id, a.organization_id, a.name, a.location, b.ehr_id AS record_ehr_id, b.patient_id AS record_patient_id, b.collection_date AS record_collection_date
FROM healthcare_organizations a JOIN electronic_health_records b ON a.electronic_health_record_ehr_id = b.ehr_id;
```

| id | organization_id | name | location | record_ehr_id | record_patient_id | record_collection_date |
|---|---|---|---|---|---|---|
| 1000 | Shell Oil | Extended Review | extended-location-99 | 195366 | 8387541 | 2025-12-17T11:57:00 |
| 1001 | GlobalPlatform Inc. | Pilot Initiative A | integrated-location-100 | 611509 | 10207142 | 2022-05-01T18:14:00 |
| 1002 | Whatsapp Inc. | Baseline Model | seasonal-location-101 | 884338 | 7119782 | 2023-10-12T01:31:00 |
| 1003 | American Institutes for Research | Distributed Cluster | regional-location-102 | gd_taxc_1123 | gd_acc_160003 | 2024-03-23T08:48:00 |

The view `healthcare_organization_healthcare_professional_view` answers the question of which professionals are employed by which organization. A row showing `GlobalPlatform Inc.` (id `1001`) paired with professional `Pilot Initiative A` (license `LIC-2596`, status `inactive`) illustrates that the employment relationship is preserved even for non-active staff.

**View `healthcare_organization_healthcare_professional_view`**

```sql
CREATE VIEW healthcare_organization_healthcare_professional_view AS
SELECT a.id, a.organization_id, a.name, a.location, b.id AS professional_id, b.professional_id AS professional_professional_id, b.name AS professional_name
FROM healthcare_organizations a JOIN healthcare_professionals b ON a.healthcare_professional_id = b.id;
```

| id | organization_id | name | location | professional_id | professional_professional_id | professional_name |
|---|---|---|---|---|---|---|
| 1000 | Shell Oil | Extended Review | extended-location-99 | 1 | 5082965 | Extended Review |
| 1001 | GlobalPlatform Inc. | Pilot Initiative A | integrated-location-100 | 2 | 2618560 | Pilot Initiative A |
| 1002 | Whatsapp Inc. | Baseline Model | seasonal-location-101 | 3 | 3355767 | Baseline Model |
| 1003 | American Institutes for Research | Distributed Cluster | regional-location-102 | 4 | 3355784 | Distributed Cluster |

The view `healthcare_organization_analytics_solution_view` maps organizations to their deployed analytics solutions. For instance, `Whatsapp Inc.` (id `1002`) is associated with the solution `Baseline Model` (id `102`, type `big_data`, provider `composite-provider-39`), demonstrating the organization-to-solution linkage.

**View `healthcare_organization_analytics_solution_view`**

```sql
CREATE VIEW healthcare_organization_analytics_solution_view AS
SELECT a.id, a.organization_id, a.name, a.location, b.id AS solution_id, b.solution_id AS solution_solution_id, b.name AS solution_name
FROM healthcare_organizations a JOIN analytics_solutions b ON a.analytics_solution_id = b.id;
```

| id | organization_id | name | location | solution_id | solution_solution_id | solution_name |
|---|---|---|---|---|---|---|
| 1000 | Shell Oil | Extended Review | extended-location-99 | 100 | 4793487 | Extended Review |
| 1001 | GlobalPlatform Inc. | Pilot Initiative A | integrated-location-100 | 101 | 5844272 | Pilot Initiative A |
| 1002 | Whatsapp Inc. | Baseline Model | seasonal-location-101 | 102 | 0470021411 | Baseline Model |
| 1003 | American Institutes for Research | Distributed Cluster | regional-location-102 | 103 | 7021001070020 | Distributed Cluster |

The view `electronic_health_record_healthcare_organization_view` inverts the perspective, answering which organization owns a given EHR. A row pairing EHR `884338` (patient `7119782`, status `incomplete`) with organization `Whatsapp Inc.` (id `1002`) confirms the same relationship from the EHR's side.

**View `electronic_health_record_healthcare_organization_view`**

```sql
CREATE VIEW electronic_health_record_healthcare_organization_view AS
SELECT a.ehr_id, a.patient_id, a.collection_date, a.data_volume, b.id AS organization_id, b.organization_id AS organization_organization_id, b.name AS organization_name
FROM electronic_health_records a JOIN healthcare_organizations b ON a.healthcare_organization_id = b.id;
```

| ehr_id | patient_id | collection_date | data_volume | organization_id | organization_organization_id | organization_name |
|---|---|---|---|---|---|---|
| 195366 | 8387541 | 2025-12-17T11:57:00 | 9.95 | 1000 | Shell Oil | Extended Review |
| 611509 | 10207142 | 2022-05-01T18:14:00 | 12.90 | 1001 | GlobalPlatform Inc. | Pilot Initiative A |
| 884338 | 7119782 | 2023-10-12T01:31:00 | 15.85 | 1002 | Whatsapp Inc. | Baseline Model |
| gd_taxc_1123 | gd_acc_160003 | 2024-03-23T08:48:00 | 18.80 | 1003 | American Institutes for Research | Distributed Cluster |

The view `electronic_health_record_clinical_data_point_detail_view` joins EHRs to their clinical data points, answering which measurements belong to which record. A row showing EHR `195366` linked to clinical data point `1` (measurement type `adaptive-measurem-89`, value `19.95`, anomalous `true`) illustrates the EHR-to-measurement cascade.

**View `electronic_health_record_clinical_data_point_detail_view`**

```sql
CREATE VIEW electronic_health_record_clinical_data_point_detail_view AS
SELECT a.ehr_id, a.patient_id, a.collection_date, b.clinical_data_point_id AS point_clinical_data_point_id, b.data_point_id AS point_data_point_id, b.measurement_type AS point_measurement_type
FROM electronic_health_records a
  JOIN records_points j ON j.electronic_health_record_ehr_id = a.ehr_id
  JOIN clinical_data_points b ON b.clinical_data_point_id = j.clinical_data_point_id;
```

| ehr_id | patient_id | collection_date | point_clinical_data_point_id | point_data_point_id | point_measurement_type |
|---|---|---|---|---|---|
| 195366 | 8387541 | 2025-12-17T11:57:00 | 1 | 726063 | adaptive-measurem-89 |
| 195366 | 8387541 | 2025-12-17T11:57:00 | 2 | id_24 | distributed-measurem-90 |
| 611509 | 10207142 | 2022-05-01T18:14:00 | 2 | id_24 | distributed-measurem-90 |
| 611509 | 10207142 | 2022-05-01T18:14:00 | 3 | e878ea4c-8fd1-11eb-924d-9cd76263cbd0 | baseline-measurem-91 |
| 884338 | 7119782 | 2023-10-12T01:31:00 | 3 | e878ea4c-8fd1-11eb-924d-9cd76263cbd0 | baseline-measurem-91 |
| 884338 | 7119782 | 2023-10-12T01:31:00 | 4 | ar_001 | pilot-measurem-92 |
| gd_taxc_1123 | gd_acc_160003 | 2024-03-23T08:48:00 | 4 | ar_001 | pilot-measurem-92 |
| gd_taxc_1123 | gd_acc_160003 | 2024-03-23T08:48:00 | 1 | 726063 | adaptive-measurem-89 |

The view `clinical_data_point_electronic_health_record_view` reverses this direction, answering which EHR a given clinical data point belongs to. A row pairing clinical data point `2` (value `21.90`, unit `baseline-unit-19`) with EHR `611509` (patient `10207142`, status `archived`) confirms the same foreign-key edge from the measurement's perspective.

**View `clinical_data_point_electronic_health_record_view`**

```sql
CREATE VIEW clinical_data_point_electronic_health_record_view AS
SELECT a.clinical_data_point_id, a.data_point_id, a.measurement_type, a.value, b.ehr_id AS record_ehr_id, b.patient_id AS record_patient_id, b.collection_date AS record_collection_date
FROM clinical_data_points a JOIN electronic_health_records b ON a.electronic_health_record_ehr_id = b.ehr_id;
```

| clinical_data_point_id | data_point_id | measurement_type | value | record_ehr_id | record_patient_id | record_collection_date |
|---|---|---|---|---|---|---|
| 1 | 726063 | adaptive-measurem-89 | 19.95 | 195366 | 8387541 | 2025-12-17T11:57:00 |
| 2 | id_24 | distributed-measurem-90 | 21.90 | 611509 | 10207142 | 2022-05-01T18:14:00 |
| 3 | e878ea4c-8fd1-11eb-924d-9cd76263cbd0 | baseline-measurem-91 | 23.85 | 884338 | 7119782 | 2023-10-12T01:31:00 |
| 4 | ar_001 | pilot-measurem-92 | 25.80 | gd_taxc_1123 | gd_acc_160003 | 2024-03-23T08:48:00 |

The view `clinical_data_point_healthcare_professional_view` links clinical data points to the professionals who generated them. A row showing clinical data point `3` (measurement type `baseline-measurem-91`, value `23.85`, anomalous `true`) associated with professional `Baseline Model` (license `LIC-2603`, status `on_leave`) demonstrates the clinician-to-measurement relationship.

**View `clinical_data_point_healthcare_professional_view`**

```sql
CREATE VIEW clinical_data_point_healthcare_professional_view AS
SELECT a.clinical_data_point_id, a.data_point_id, a.measurement_type, a.value, b.id AS professional_id, b.professional_id AS professional_professional_id, b.name AS professional_name
FROM clinical_data_points a JOIN healthcare_professionals b ON a.healthcare_professional_id = b.id;
```

| clinical_data_point_id | data_point_id | measurement_type | value | professional_id | professional_professional_id | professional_name |
|---|---|---|---|---|---|---|
| 1 | 726063 | adaptive-measurem-89 | 19.95 | 1 | 5082965 | Extended Review |
| 2 | id_24 | distributed-measurem-90 | 21.90 | 2 | 2618560 | Pilot Initiative A |
| 3 | e878ea4c-8fd1-11eb-924d-9cd76263cbd0 | baseline-measurem-91 | 23.85 | 3 | 3355767 | Baseline Model |
| 4 | ar_001 | pilot-measurem-92 | 25.80 | 4 | 3355784 | Distributed Cluster |

The view `healthcare_professional_healthcare_organization_view` answers which organization employs a given professional. A row pairing professional `Distributed Cluster` (id `4`, license `LIC-2610`, status `active`) with organization `American Institutes for Research` (id `1003`) confirms the employment assignment.

**View `healthcare_professional_healthcare_organization_view`**

```sql
CREATE VIEW healthcare_professional_healthcare_organization_view AS
SELECT a.id, a.professional_id, a.name, a.specialty, b.id AS organization_id, b.organization_id AS organization_organization_id, b.name AS organization_name
FROM healthcare_professionals a JOIN healthcare_organizations b ON a.healthcare_organization_id = b.id;
```

| id | professional_id | name | specialty | organization_id | organization_organization_id | organization_name |
|---|---|---|---|---|---|---|
| 1 | 5082965 | Extended Review | extended-specialt-21 | 1000 | Shell Oil | Extended Review |
| 2 | 2618560 | Pilot Initiative A | integrated-specialt-22 | 1001 | GlobalPlatform Inc. | Pilot Initiative A |
| 3 | 3355767 | Baseline Model | seasonal-specialt-23 | 1002 | Whatsapp Inc. | Baseline Model |
| 4 | 3355784 | Distributed Cluster | regional-specialt-24 | 1003 | American Institutes for Research | Distributed Cluster |

The view `healthcare_professional_clinical_data_point_detail_view` inverts the previous relationship, answering which measurements a given professional has produced. A row showing professional `Extended Review` (id `1`, license `LIC-2589`, status `active`) linked to clinical data point `1` (value `19.95`, anomalous `true`) illustrates the clinician's measurement output.

**View `healthcare_professional_clinical_data_point_detail_view`**

```sql
CREATE VIEW healthcare_professional_clinical_data_point_detail_view AS
SELECT a.id, a.professional_id, a.name, b.clinical_data_point_id AS point_clinical_data_point_id, b.data_point_id AS point_data_point_id, b.measurement_type AS point_measurement_type
FROM healthcare_professionals a
  JOIN professionals_points j ON j.healthcare_professional_id = a.id
  JOIN clinical_data_points b ON b.clinical_data_point_id = j.clinical_data_point_id;
```

| id | professional_id | name | point_clinical_data_point_id | point_data_point_id | point_measurement_type |
|---|---|---|---|---|---|
| 1 | 5082965 | Extended Review | 1 | 726063 | adaptive-measurem-89 |
| 1 | 5082965 | Extended Review | 2 | id_24 | distributed-measurem-90 |
| 2 | 2618560 | Pilot Initiative A | 2 | id_24 | distributed-measurem-90 |
| 2 | 2618560 | Pilot Initiative A | 3 | e878ea4c-8fd1-11eb-924d-9cd76263cbd0 | baseline-measurem-91 |
| 3 | 3355767 | Baseline Model | 3 | e878ea4c-8fd1-11eb-924d-9cd76263cbd0 | baseline-measurem-91 |
| 3 | 3355767 | Baseline Model | 4 | ar_001 | pilot-measurem-92 |
| 4 | 3355784 | Distributed Cluster | 4 | ar_001 | pilot-measurem-92 |
| 4 | 3355784 | Distributed Cluster | 1 | 726063 | adaptive-measurem-89 |

The view `analytics_solution_healthcare_organization_view` maps analytics solutions back to their deploying organizations. A row pairing solution `Extended Review` (id `100`, type `clinical`, provider `legacy-provider-37`) with organization `Shell Oil` (id `1000`) confirms the solution deployment relationship.

**View `analytics_solution_healthcare_organization_view`**

```sql
CREATE VIEW analytics_solution_healthcare_organization_view AS
SELECT a.id, a.solution_id, a.name, a.type, b.id AS organization_id, b.organization_id AS organization_organization_id, b.name AS organization_name
FROM analytics_solutions a JOIN healthcare_organizations b ON a.healthcare_organization_id = b.id;
```

| id | solution_id | name | type | organization_id | organization_organization_id | organization_name |
|---|---|---|---|---|---|---|
| 100 | 4793487 | Extended Review | clinical | 1000 | Shell Oil | Extended Review |
| 101 | 5844272 | Pilot Initiative A | business | 1001 | GlobalPlatform Inc. | Pilot Initiative A |
| 102 | 0470021411 | Baseline Model | big_data | 1002 | Whatsapp Inc. | Baseline Model |
| 103 | 7021001070020 | Distributed Cluster | clinical | 1003 | American Institutes for Research | Distributed Cluster |

The view `analytics_solution_electronic_health_record_detail_view` joins analytics solutions to the EHRs they analyse. A row showing solution `Pilot Initiative A` (id `101`, type `business`, provider `compact-provider-38`) linked to EHR `611509` (patient `10207142`, status `archived`) illustrates the solution-to-record analytical linkage.

**View `analytics_solution_electronic_health_record_detail_view`**

```sql
CREATE VIEW analytics_solution_electronic_health_record_detail_view AS
SELECT a.id, a.solution_id, a.name, b.ehr_id AS record_ehr_id, b.patient_id AS record_patient_id, b.collection_date AS record_collection_date
FROM analytics_solutions a
  JOIN solutions_records j ON j.analytics_solution_id = a.id
  JOIN electronic_health_records b ON b.ehr_id = j.electronic_health_record_ehr_id;
```

| id | solution_id | name | record_ehr_id | record_patient_id | record_collection_date |
|---|---|---|---|---|---|
| 100 | 4793487 | Extended Review | 195366 | 8387541 | 2025-12-17T11:57:00 |
| 100 | 4793487 | Extended Review | 611509 | 10207142 | 2022-05-01T18:14:00 |
| 101 | 5844272 | Pilot Initiative A | 611509 | 10207142 | 2022-05-01T18:14:00 |
| 101 | 5844272 | Pilot Initiative A | 884338 | 7119782 | 2023-10-12T01:31:00 |
| 102 | 0470021411 | Baseline Model | 884338 | 7119782 | 2023-10-12T01:31:00 |
| 102 | 0470021411 | Baseline Model | gd_taxc_1123 | gd_acc_160003 | 2024-03-23T08:48:00 |
| 103 | 7021001070020 | Distributed Cluster | gd_taxc_1123 | gd_acc_160003 | 2024-03-23T08:48:00 |
| 103 | 7021001070020 | Distributed Cluster | 195366 | 8387541 | 2025-12-17T11:57:00 |

The view `clinical_decision_support_analytics_solution_view` answers which analytics solution a given CDS rule is derived from. A row pairing CDS `9568460` (trigger `compact-trigger-50`, recommendation `extended-recommen-39`, effectiveness `5.90`, proactive `true`) with analytics solution `Pilot Initiative A` (id `101`) confirms the CDS-to-solution dependency.

**View `clinical_decision_support_analytics_solution_view`**

```sql
CREATE VIEW clinical_decision_support_analytics_solution_view AS
SELECT a.cds_id, a.trigger_condition, a.recommendation, a.effectiveness_score, b.id AS solution_id, b.solution_id AS solution_solution_id, b.name AS solution_name
FROM clinical_decision_supports a JOIN analytics_solutions b ON a.analytics_solution_id = b.id;
```

| cds_id | trigger_condition | recommendation | effectiveness_score | solution_id | solution_solution_id | solution_name |
|---|---|---|---|---|---|---|
| 784e2c06-8fb2-11eb-924d-9cd76263cbd0 | legacy-trigger-49 | pilot-recommen-38 | 3.45 | 100 | 4793487 | Extended Review |
| 9568460 | compact-trigger-50 | extended-recommen-39 | 5.90 | 101 | 5844272 | Pilot Initiative A |
| Invoices | composite-trigger-51 | integrated-recommen-40 | 8.35 | 102 | 0470021411 | Baseline Model |
| Tanggal | primary-trigger-52 | seasonal-recommen-41 | 10.80 | 103 | 7021001070020 | Distributed Cluster |

The view `clinical_decision_support_healthcare_professional_detail_view` links CDS rules to the professionals who use them. A row showing CDS `784e2c06-8fb2-11eb-924d-9cd76263cbd0` (trigger `legacy-trigger-49`, recommendation `pilot-recommen-38`, effectiveness `3.45`, proactive `false`) associated with professional `Extended Review` (id `1`, license `LIC-2589`, status `active`) demonstrates the CDS-to-clinician assignment.

**View `clinical_decision_support_healthcare_professional_detail_view`**

```sql
CREATE VIEW clinical_decision_support_healthcare_professional_detail_view AS
SELECT a.cds_id, a.trigger_condition, a.recommendation, b.id AS professional_id, b.professional_id AS professional_professional_id, b.name AS professional_name
FROM clinical_decision_supports a
  JOIN supports_professionals j ON j.clinical_decision_support_cds_id = a.cds_id
  JOIN healthcare_professionals b ON b.id = j.healthcare_professional_id;
```

| cds_id | trigger_condition | recommendation | professional_id | professional_professional_id | professional_name |
|---|---|---|---|---|---|
| 784e2c06-8fb2-11eb-924d-9cd76263cbd0 | legacy-trigger-49 | pilot-recommen-38 | 1 | 5082965 | Extended Review |
| 784e2c06-8fb2-11eb-924d-9cd76263cbd0 | legacy-trigger-49 | pilot-recommen-38 | 2 | 2618560 | Pilot Initiative A |
| 9568460 | compact-trigger-50 | extended-recommen-39 | 2 | 2618560 | Pilot Initiative A |
| 9568460 | compact-trigger-50 | extended-recommen-39 | 3 | 3355767 | Baseline Model |
| Invoices | composite-trigger-51 | integrated-recommen-40 | 3 | 3355767 | Baseline Model |
| Invoices | composite-trigger-51 | integrated-recommen-40 | 4 | 3355784 | Distributed Cluster |
| Tanggal | primary-trigger-52 | seasonal-recommen-41 | 4 | 3355784 | Distributed Cluster |
| Tanggal | primary-trigger-52 | seasonal-recommen-41 | 1 | 5082965 | Extended Review |

## Synthesis

The schema models a healthcare analytics domain as a layered graph of entities: organizations sit at the top, each owning EHRs, employing professionals, and deploying analytics solutions. Clinical data points nest beneath EHRs and are attributed to professionals, while clinical decision supports sit atop analytics solutions and are assigned to professionals. The four junction tables — `records_points`, `professionals_points`, `solutions_records`, and `supports_professionals` — ensure that many-to-many relationships are preserved in first normal form without data duplication. The thirteen views each answer a single analytical question by joining two base tables along their foreign-key edges, reconstructing domain facts such as "which EHRs does organization `1000` own" or "which CDS rules is professional `1` assigned to." Together, the base tables, junction tables, and views form a complete, queryable representation of the healthcare analytics domain, grounded in the concrete records and relationships observed in the data.