# Semantic Modelling of a Healthcare Data Platform

This chapter explains how a fictional healthcare data platform is modelled in a relational database. It walks through the entity types that constitute the domain, how their attributes and cardinality-bounded relationships become columns, foreign keys, and junction tables, and how each materialised view reconstructs a domain fact from the normalised base tables. All data described here is entirely fictional.

## 1. The Five Core Entity Types

The platform revolves around five principal entity types, each captured in its own table.

### 1.1 `healthcare_organizations`

The `healthcare_organizations` table is the organisational anchor of the schema. Each row represents a healthcare organisation and carries the columns `id` (a surrogate primary key), `organization_id` (a business identifier), `name`, `location_city`, `location_state`, and `location_country` (geographic attributes), `operating_margin` (a numeric performance indicator), and `is_sustainable` (a boolean flag). Three additional columns—`electronic_health_record_ehr_id`, `healthcare_analytics_solution_id`, and `clinical_decision_support_id`—serve as foreign keys that bind the organisation to exactly one electronic health record, one analytics solution, and one clinical decision support system, respectively. Representative rows include organisation `1000` ("Shell Oil", operating margin `21.70`, sustainable) and organisation `1003` ("American Institutes for Research", operating margin `32.80`, not sustainable).

**Table `healthcare_organizations`**

| id | organization_id | name | location_city | location_state | location_country | operating_margin | is_sustainable | electronic_health_record_ehr_id | healthcare_analytics_solution_id | clinical_decision_support_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1000 | Shell Oil | Extended Review | seasonal-location-23 | composite-location-93 | adaptive-location-47 | 21.70 | true | 195366 | 1 | 100 |
| 1001 | GlobalPlatform Inc. | Pilot Initiative A | regional-location-24 | primary-location-94 | distributed-location-48 | 25.40 | false | 611509 | 2 | 101 |
| 1002 | Whatsapp Inc. | Baseline Model | legacy-location-25 | adaptive-location-95 | baseline-location-49 | 29.10 | true | 884338 | 3 | 102 |
| 1003 | American Institutes for Research | Distributed Cluster | compact-location-26 | distributed-location-96 | pilot-location-50 | 32.80 | false | gd_taxc_1123 | 4 | 103 |

### 1.2 `electronic_health_records`

The `electronic_health_records` table stores patient-level record metadata. Its primary key is `ehr_id`, and it carries `patient_id`, `collection_date`, `data_volume`, `data_format`, `is_complete`, and `storage_location` as descriptive attributes. The column `healthcare_organization_id` is a foreign key referencing `healthcare_organizations.id`, establishing a many-to-one relationship: many electronic health records can belong to a single organisation. Sample records include `ehr_id` `195366` for patient `8387541` collected on `2025-12-17T11:57:00` with a data volume of `9.95`, and `ehr_id` `gd_taxc_1123` for patient `gd_acc_160003` collected on `2024-03-23T08:48:00` with a data volume of `18.80`.

**Table `electronic_health_records`**

| ehr_id | patient_id | collection_date | data_volume | data_format | is_complete | storage_location | healthcare_organization_id |
|---|---|---|---|---|---|---|---|
| 195366 | 8387541 | 2025-12-17T11:57:00 | 9.95 | primary-data-16 | false | distributed-storage-48 | 1000 |
| 611509 | 10207142 | 2022-05-01T18:14:00 | 12.90 | adaptive-data-17 | true | baseline-storage-49 | 1001 |
| 884338 | 7119782 | 2023-10-12T01:31:00 | 15.85 | distributed-data-18 | false | pilot-storage-50 | 1002 |
| gd_taxc_1123 | gd_acc_160003 | 2024-03-23T08:48:00 | 18.80 | baseline-data-19 | true | extended-storage-51 | 1003 |

### 1.3 `clinical_data_points`

The `clinical_data_points` table captures individual clinical measurements. Its primary key is `data_point_id`. Each row records a `metric_name`, `metric_value`, `measurement_unit`, and `timestamp`, along with a `data_quality` flag. Two foreign keys—`electronic_health_record_ehr_id` (pointing to `electronic_health_records.ehr_id`) and `healthcare_analytics_solution_id` (pointing to `healthcare_analytics_solutions.id`)—tie each data point to a specific patient record and to an analytics solution. Representative data points include `data_point_id` `726063` ("Primary Programme A", value `14.95`) and `data_point_id` `ar_001` ("Legacy Protocol D", value `26.80`).

**Table `clinical_data_points`**

| data_point_id | metric_name | metric_value | measurement_unit | timestamp | data_quality | electronic_health_record_ehr_id | healthcare_analytics_solution_id |
|---|---|---|---|---|---|---|---|
| 726063 | Primary Programme A | 14.95 | extended-measurem-87 | 2024-07-08T18:18:00 | primary-data-82 | 195366 | 1 |
| id_24 | Composite Standard | 18.90 | integrated-measurem-88 | 2025-12-19T01:35:00 | adaptive-data-83 | 611509 | 2 |
| e878ea4c-8fd1-11eb-924d-9cd76263cbd0 | Compact Framework | 22.85 | seasonal-measurem-89 | 2022-05-03T08:52:00 | distributed-data-84 | 884338 | 3 |
| ar_001 | Legacy Protocol D | 26.80 | regional-measurem-90 | 2023-10-14T15:09:00 | baseline-data-85 | gd_taxc_1123 | 4 |

### 1.4 `healthcare_analytics_solutions`

The `healthcare_analytics_solutions` table describes analytics platforms deployed across the organisations. Its primary key is `id`, supplemented by `solution_id` (a business identifier), `solution_name`, `solution_type`, `vendor`, `is_web_based`, `supports_big_data`, and `deployment_date`. Foreign keys `healthcare_organization_id`, `electronic_health_record_ehr_id`, and `clinical_decision_support_id` bind each solution to exactly one organisation, one EHR, and one clinical decision support system. Example solutions include `id` `1` ("Primary Review A", vendor "Feedback Ratings", web-based `false`, big-data capable `true`) and `id` `4` ("Legacy Cluster D", vendor "Whatsapp Inc.", web-based `true`, big-data capable `false`).

**Table `healthcare_analytics_solutions`**

| id | solution_id | solution_name | solution_type | vendor | is_web_based | supports_big_data | deployment_date | healthcare_organization_id | electronic_health_record_ehr_id | clinical_decision_support_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 4793487 | Primary Review A | regional-solution-60 | Feedback Ratings | false | true | 2023-02-14 | 1000 | 195366 | 100 |
| 2 | 5844272 | Composite Initiative | legacy-solution-61 | Abbott Laboratories | true | false | 2024-07-25 | 1001 | 611509 | 101 |
| 3 | 0470021411 | Compact Model | compact-solution-62 | American Express | false | true | 2025-12-09 | 1002 | 884338 | 102 |
| 4 | 7021001070020 | Legacy Cluster D | composite-solution-63 | Whatsapp Inc. | true | false | 2022-05-20 | 1003 | gd_taxc_1123 | 103 |

### 1.5 `clinical_decision_supports`

The `clinical_decision_supports` table models clinical decision support (CDS) systems. Its primary key is `id`, with `cds_id` as a business identifier, `cds_name`, `cds_type`, `effectiveness` (a numeric score), `is_proactive`, and `is_predictive` as boolean flags. Foreign keys `healthcare_analytics_solution_id`, `electronic_health_record_ehr_id`, and `healthcare_organization_id` link each CDS system to one analytics solution, one EHR, and one organisation. Representative entries include `id` `100` ("Baseline Protocol D", effectiveness `16.45`, not proactive, not predictive) and `id` `103` ("Primary Framework A", effectiveness `26.80`, proactive, predictive).

**Table `clinical_decision_supports`**

| id | cds_id | cds_name | cds_type | effectiveness | is_proactive | is_predictive | healthcare_analytics_solution_id | electronic_health_record_ehr_id | healthcare_organization_id |
|---|---|---|---|---|---|---|---|---|---|
| 100 | 784e2c06-8fb2-11eb-924d-9cd76263cbd0 | Baseline Protocol D | primary-cds-10 | 16.45 | false | false | 1 | 195366 | 1000 |
| 101 | 9568460 | Distributed Programme | adaptive-cds-11 | 19.90 | true | true | 2 | 611509 | 1001 |
| 102 | Invoices | Adaptive Standard | distributed-cds-12 | 23.35 | false | false | 3 | 884338 | 1002 |
| 103 | Tanggal | Primary Framework A | baseline-cds-13 | 26.80 | true | true | 4 | gd_taxc_1123 | 1003 |

## 2. The Junction Table: `records_points`

The `records_points` table is a pure junction (associative) table that resolves a many-to-many relationship between `electronic_health_records` and `clinical_data_points`. Its two columns, `electronic_health_record_ehr_id` and `data_point_id`, are both foreign keys referencing the respective primary keys of the parent tables. The sample data shows that `ehr_id` `195366` is associated with data points `726063` and `id_24`, while `ehr_id` `gd_taxc_1123` is associated with `ar_001` and `726063`. This table enables the platform to express that a single EHR can carry multiple clinical data points and that a data point can be referenced by multiple EHRs.

**Table `records_points`**

| electronic_health_record_ehr_id | data_point_id |
|---|---|
| 195366 | 726063 |
| 195366 | id_24 |
| 611509 | id_24 |
| 611509 | e878ea4c-8fd1-11eb-924d-9cd76263cbd0 |
| 884338 | e878ea4c-8fd1-11eb-924d-9cd76263cbd0 |
| 884338 | ar_001 |
| gd_taxc_1123 | ar_001 |
| gd_taxc_1123 | 726063 |

## 3. Foreign-Key Topology and Cardinality

The schema exhibits a tightly coupled, star-like topology centred on `healthcare_organizations`. Each organisation row carries three foreign keys—`electronic_health_record_ehr_id`, `healthcare_analytics_solution_id`, and `clinical_decision_support_id`—that enforce a one-to-one relationship with the corresponding entity in each of the other four core tables. In other words, every organisation is paired with exactly one EHR, one analytics solution, and one CDS system.

The `electronic_health_records` table introduces a many-to-one relationship back to `healthcare_organizations` through `healthcare_organization_id`, meaning an organisation can own multiple EHRs. Similarly, `clinical_data_points` references `electronic_health_records` via `electronic_health_record_ehr_id` (many data points per EHR) and `healthcare_analytics_solutions` via `healthcare_analytics_solution_id` (many data points per analytics solution).

The `healthcare_analytics_solutions` table mirrors the organisation's three foreign keys: `healthcare_organization_id`, `electronic_health_record_ehr_id`, and `clinical_decision_support_id`, each enforcing a one-to-one binding. The `clinical_decision_supports` table does the same with `healthcare_analytics_solution_id`, `electronic_health_record_ehr_id`, and `healthcare_organization_id`.

The junction table `records_points` is the sole mechanism for the many-to-many relationship between EHRs and clinical data points, breaking what would otherwise be an ambiguous bidirectional dependency.

## 4. Materialised Views: Reconstructing Domain Facts

Each view in the schema is a declarative join that reconstructs a specific domain fact from the normalised base tables. The following subsections describe every view, the tables it joins, and the join predicate that materialises the relationship.

### 4.1 Organisation-to-EHR Views

The view `vw_healthcare_organization_electronic_health_record` joins `healthcare_organizations` to `electronic_health_records` on `healthcare_organizations.electronic_health_record_ehr_id = electronic_health_records.ehr_id`. It projects organisation attributes (`id`, `organization_id`, `name`, `location_city`) alongside the EHR's `ehr_id`, `patient_id`, and `collection_date` (renamed with the `record_` prefix). This view answers the question: "Which patient record is associated with each organisation?" Representative output includes organisation `1000` ("Shell Oil") linked to `ehr_id` `195366` (patient `8387541`, collected `2025-12-17T11:57:00`).

**View `vw_healthcare_organization_electronic_health_record`**

```sql
CREATE VIEW vw_healthcare_organization_electronic_health_record AS
SELECT a.id, a.organization_id, a.name, a.location_city, b.ehr_id AS record_ehr_id, b.patient_id AS record_patient_id, b.collection_date AS record_collection_date
FROM healthcare_organizations a JOIN electronic_health_records b ON a.electronic_health_record_ehr_id = b.ehr_id;
```

| id | organization_id | name | location_city | record_ehr_id | record_patient_id | record_collection_date |
|---|---|---|---|---|---|---|
| 1000 | Shell Oil | Extended Review | seasonal-location-23 | 195366 | 8387541 | 2025-12-17T11:57:00 |
| 1001 | GlobalPlatform Inc. | Pilot Initiative A | regional-location-24 | 611509 | 10207142 | 2022-05-01T18:14:00 |
| 1002 | Whatsapp Inc. | Baseline Model | legacy-location-25 | 884338 | 7119782 | 2023-10-12T01:31:00 |
| 1003 | American Institutes for Research | Distributed Cluster | compact-location-26 | gd_taxc_1123 | gd_acc_160003 | 2024-03-23T08:48:00 |

Conversely, `vw_electronic_health_record_healthcare_organization` performs the same join in the opposite direction: it starts from `electronic_health_records` and joins to `healthcare_organizations` on `electronic_health_records.healthcare_organization_id = healthcare_organizations.id`. It projects the EHR's native columns (`ehr_id`, `patient_id`, `collection_date`, `data_volume`) alongside the organisation's `id`, `organization_id`, and `name` (renamed with the `organization_` prefix). This view answers: "Which organisation owns this patient record?" Representative output includes `ehr_id` `195366` (patient `8387541`, data volume `9.95`) belonging to organisation `1000` ("Shell Oil").

**View `vw_electronic_health_record_healthcare_organization`**

```sql
CREATE VIEW vw_electronic_health_record_healthcare_organization AS
SELECT a.ehr_id, a.patient_id, a.collection_date, a.data_volume, b.id AS organization_id, b.organization_id AS organization_organization_id, b.name AS organization_name
FROM electronic_health_records a JOIN healthcare_organizations b ON a.healthcare_organization_id = b.id;
```

| ehr_id | patient_id | collection_date | data_volume | organization_id | organization_organization_id | organization_name |
|---|---|---|---|---|---|---|
| 195366 | 8387541 | 2025-12-17T11:57:00 | 9.95 | 1000 | Shell Oil | Extended Review |
| 611509 | 10207142 | 2022-05-01T18:14:00 | 12.90 | 1001 | GlobalPlatform Inc. | Pilot Initiative A |
| 884338 | 7119782 | 2023-10-12T01:31:00 | 15.85 | 1002 | Whatsapp Inc. | Baseline Model |
| gd_taxc_1123 | gd_acc_160003 | 2024-03-23T08:48:00 | 18.80 | 1003 | American Institutes for Research | Distributed Cluster |

### 4.2 Organisation-to-Analytics Views

The view `vw_healthcare_organization_healthcare_analytics_solution` joins `healthcare_organizations` to `healthcare_analytics_solutions` on `healthcare_organizations.healthcare_analytics_solution_id = healthcare_analytics_solutions.id`. It projects organisation attributes alongside the analytics solution's `id`, `solution_id`, and `solution_name` (renamed with the `solution_` prefix). This view answers: "Which analytics solution is deployed for each organisation?" Representative output includes organisation `1000` ("Shell Oil") linked to solution `1` ("Primary Review A", solution identifier `4793487`).

**View `vw_healthcare_organization_healthcare_analytics_solution`**

```sql
CREATE VIEW vw_healthcare_organization_healthcare_analytics_solution AS
SELECT a.id, a.organization_id, a.name, a.location_city, b.id AS solution_id, b.solution_id AS solution_solution_id, b.solution_name AS solution_solution_name
FROM healthcare_organizations a JOIN healthcare_analytics_solutions b ON a.healthcare_analytics_solution_id = b.id;
```

| id | organization_id | name | location_city | solution_id | solution_solution_id | solution_solution_name |
|---|---|---|---|---|---|---|
| 1000 | Shell Oil | Extended Review | seasonal-location-23 | 1 | 4793487 | Primary Review A |
| 1001 | GlobalPlatform Inc. | Pilot Initiative A | regional-location-24 | 2 | 5844272 | Composite Initiative |
| 1002 | Whatsapp Inc. | Baseline Model | legacy-location-25 | 3 | 0470021411 | Compact Model |
| 1003 | American Institutes for Research | Distributed Cluster | compact-location-26 | 4 | 7021001070020 | Legacy Cluster D |

The reverse-direction view `vw_healthcare_analytics_solution_healthcare_organization` joins `healthcare_analytics_solutions` to `healthcare_organizations` on `healthcare_analytics_solutions.healthcare_organization_id = healthcare_organizations.id`. It projects the solution's native columns (`id`, `solution_id`, `solution_name`, `solution_type`) alongside the organisation's `id`, `organization_id`, and `name` (renamed with the `organization_` prefix). This view answers: "Which organisation hosts this analytics solution?" Representative output includes solution `1` ("Primary Review A", type `regional-solution-60`) hosted by organisation `1000` ("Shell Oil").

**View `vw_healthcare_analytics_solution_healthcare_organization`**

```sql
CREATE VIEW vw_healthcare_analytics_solution_healthcare_organization AS
SELECT a.id, a.solution_id, a.solution_name, a.solution_type, b.id AS organization_id, b.organization_id AS organization_organization_id, b.name AS organization_name
FROM healthcare_analytics_solutions a JOIN healthcare_organizations b ON a.healthcare_organization_id = b.id;
```

| id | solution_id | solution_name | solution_type | organization_id | organization_organization_id | organization_name |
|---|---|---|---|---|---|---|
| 1 | 4793487 | Primary Review A | regional-solution-60 | 1000 | Shell Oil | Extended Review |
| 2 | 5844272 | Composite Initiative | legacy-solution-61 | 1001 | GlobalPlatform Inc. | Pilot Initiative A |
| 3 | 0470021411 | Compact Model | compact-solution-62 | 1002 | Whatsapp Inc. | Baseline Model |
| 4 | 7021001070020 | Legacy Cluster D | composite-solution-63 | 1003 | American Institutes for Research | Distributed Cluster |

### 4.3 Organisation-to-CDS Views

The view `vw_healthcare_organization_clinical_decision_support` joins `healthcare_organizations` to `clinical_decision_supports` on `healthcare_organizations.clinical_decision_support_id = clinical_decision_supports.id`. It projects organisation attributes alongside the CDS system's `id`, `cds_id`, and `cds_name` (renamed with the `support_` prefix). This view answers: "Which CDS system is associated with each organisation?" Representative output includes organisation `1000` ("Shell Oil") linked to CDS `100` ("Baseline Protocol D", CDS identifier `784e2c06-8fb2-11eb-924d-9cd76263cbd0`).

**View `vw_healthcare_organization_clinical_decision_support`**

```sql
CREATE VIEW vw_healthcare_organization_clinical_decision_support AS
SELECT a.id, a.organization_id, a.name, a.location_city, b.id AS support_id, b.cds_id AS support_cds_id, b.cds_name AS support_cds_name
FROM healthcare_organizations a JOIN clinical_decision_supports b ON a.clinical_decision_support_id = b.id;
```

| id | organization_id | name | location_city | support_id | support_cds_id | support_cds_name |
|---|---|---|---|---|---|---|
| 1000 | Shell Oil | Extended Review | seasonal-location-23 | 100 | 784e2c06-8fb2-11eb-924d-9cd76263cbd0 | Baseline Protocol D |
| 1001 | GlobalPlatform Inc. | Pilot Initiative A | regional-location-24 | 101 | 9568460 | Distributed Programme |
| 1002 | Whatsapp Inc. | Baseline Model | legacy-location-25 | 102 | Invoices | Adaptive Standard |
| 1003 | American Institutes for Research | Distributed Cluster | compact-location-26 | 103 | Tanggal | Primary Framework A |

The reverse-direction view `vw_clinical_decision_support_healthcare_organization` joins `clinical_decision_supports` to `healthcare_organizations` on `clinical_decision_supports.healthcare_organization_id = healthcare_organizations.id`. It projects the CDS's native columns (`id`, `cds_id`, `cds_name`, `cds_type`) alongside the organisation's `id`, `organization_id`, and `name` (renamed with the `organization_` prefix). This view answers: "Which organisation is this CDS system deployed for?" Representative output includes CDS `100` ("Baseline Protocol D", type `primary-cds-10`) deployed for organisation `1000` ("Shell Oil").

**View `vw_clinical_decision_support_healthcare_organization`**

```sql
CREATE VIEW vw_clinical_decision_support_healthcare_organization AS
SELECT a.id, a.cds_id, a.cds_name, a.cds_type, b.id AS organization_id, b.organization_id AS organization_organization_id, b.name AS organization_name
FROM clinical_decision_supports a JOIN healthcare_organizations b ON a.healthcare_organization_id = b.id;
```

| id | cds_id | cds_name | cds_type | organization_id | organization_organization_id | organization_name |
|---|---|---|---|---|---|---|
| 100 | 784e2c06-8fb2-11eb-924d-9cd76263cbd0 | Baseline Protocol D | primary-cds-10 | 1000 | Shell Oil | Extended Review |
| 101 | 9568460 | Distributed Programme | adaptive-cds-11 | 1001 | GlobalPlatform Inc. | Pilot Initiative A |
| 102 | Invoices | Adaptive Standard | distributed-cds-12 | 1002 | Whatsapp Inc. | Baseline Model |
| 103 | Tanggal | Primary Framework A | baseline-cds-13 | 1003 | American Institutes for Research | Distributed Cluster |

### 4.4 EHR-to-Clinical-Data-Point Views

The view `vw_electronic_health_record_clinical_data_point_detail` performs a three-table join: it starts from `electronic_health_records`, joins to `records_points` on `records_points.electronic_health_record_ehr_id = electronic_health_records.ehr_id`, and then joins to `clinical_data_points` on `clinical_data_points.data_point_id = records_points.data_point_id`. This join reconstructs the many-to-many relationship between EHRs and clinical data points. It projects the EHR's `ehr_id`, `patient_id`, and `collection_date` alongside the data point's `data_point_id`, `metric_name`, and `metric_value` (all renamed with the `point_` prefix). Because of the junction table, a single EHR can produce multiple rows—one per associated data point. Representative output includes `ehr_id` `195366` (patient `8387541`) linked to two data points: `726063` ("Primary Programme A", value `14.95`) and `id_24` ("Composite Standard", value `18.90`).

**View `vw_electronic_health_record_clinical_data_point_detail`**

```sql
CREATE VIEW vw_electronic_health_record_clinical_data_point_detail AS
SELECT a.ehr_id, a.patient_id, a.collection_date, b.data_point_id AS point_data_point_id, b.metric_name AS point_metric_name, b.metric_value AS point_metric_value
FROM electronic_health_records a
  JOIN records_points j ON j.electronic_health_record_ehr_id = a.ehr_id
  JOIN clinical_data_points b ON b.data_point_id = j.data_point_id;
```

| ehr_id | patient_id | collection_date | point_data_point_id | point_metric_name | point_metric_value |
|---|---|---|---|---|---|
| 195366 | 8387541 | 2025-12-17T11:57:00 | 726063 | Primary Programme A | 14.95 |
| 195366 | 8387541 | 2025-12-17T11:57:00 | id_24 | Composite Standard | 18.90 |
| 611509 | 10207142 | 2022-05-01T18:14:00 | id_24 | Composite Standard | 18.90 |
| 611509 | 10207142 | 2022-05-01T18:14:00 | e878ea4c-8fd1-11eb-924d-9cd76263cbd0 | Compact Framework | 22.85 |
| 884338 | 7119782 | 2023-10-12T01:31:00 | e878ea4c-8fd1-11eb-924d-9cd76263cbd0 | Compact Framework | 22.85 |
| 884338 | 7119782 | 2023-10-12T01:31:00 | ar_001 | Legacy Protocol D | 26.80 |
| gd_taxc_1123 | gd_acc_160003 | 2024-03-23T08:48:00 | ar_001 | Legacy Protocol D | 26.80 |
| gd_taxc_1123 | gd_acc_160003 | 2024-03-23T08:48:00 | 726063 | Primary Programme A | 14.95 |

The view `vw_clinical_data_point_electronic_health_record` takes a different approach: it joins `clinical_data_points` directly to `electronic_health_records` on `clinical_data_points.electronic_health_record_ehr_id = electronic_health_records.ehr_id`. This is a many-to-one join (each data point references exactly one EHR via its foreign key), so it produces one row per data point. It projects the data point's `data_point_id`, `metric_name`, `metric_value`, and `measurement_unit` alongside the EHR's `ehr_id`, `patient_id`, and `collection_date` (renamed with the `record_` prefix). This view answers: "Which patient record does this clinical data point belong to?" Representative output includes data point `726063` ("Primary Programme A", value `14.95`, unit `extended-measurem-87`) belonging to `ehr_id` `195366` (patient `8387541`, collected `2025-12-17T11:57:00`).

**View `vw_clinical_data_point_electronic_health_record`**

```sql
CREATE VIEW vw_clinical_data_point_electronic_health_record AS
SELECT a.data_point_id, a.metric_name, a.metric_value, a.measurement_unit, b.ehr_id AS record_ehr_id, b.patient_id AS record_patient_id, b.collection_date AS record_collection_date
FROM clinical_data_points a JOIN electronic_health_records b ON a.electronic_health_record_ehr_id = b.ehr_id;
```

| data_point_id | metric_name | metric_value | measurement_unit | record_ehr_id | record_patient_id | record_collection_date |
|---|---|---|---|---|---|---|
| 726063 | Primary Programme A | 14.95 | extended-measurem-87 | 195366 | 8387541 | 2025-12-17T11:57:00 |
| id_24 | Composite Standard | 18.90 | integrated-measurem-88 | 611509 | 10207142 | 2022-05-01T18:14:00 |
| e878ea4c-8fd1-11eb-924d-9cd76263cbd0 | Compact Framework | 22.85 | seasonal-measurem-89 | 884338 | 7119782 | 2023-10-12T01:31:00 |
| ar_001 | Legacy Protocol D | 26.80 | regional-measurem-90 | gd_taxc_1123 | gd_acc_160003 | 2024-03-23T08:48:00 |

### 4.5 Clinical-Data-Point-to-Analytics Views

The view `vw_clinical_data_point_healthcare_analytics_solution` joins `clinical_data_points` to `healthcare_analytics_solutions` on `clinical_data_points.healthcare_analytics_solution_id = healthcare_analytics_solutions.id`. This is a many-to-one join (each data point references exactly one analytics solution). It projects the data point's `data_point_id`, `metric_name`, `metric_value`, and `measurement_unit` alongside the solution's `id`, `solution_id`, and `solution_name` (renamed with the `solution_` prefix). This view answers: "Which analytics solution is responsible for this clinical data point?" Representative output includes data point `726063` ("Primary Programme A", value `14.95`) associated with solution `1` ("Primary Review A", solution identifier `4793487`).

**View `vw_clinical_data_point_healthcare_analytics_solution`**

```sql
CREATE VIEW vw_clinical_data_point_healthcare_analytics_solution AS
SELECT a.data_point_id, a.metric_name, a.metric_value, a.measurement_unit, b.id AS solution_id, b.solution_id AS solution_solution_id, b.solution_name AS solution_solution_name
FROM clinical_data_points a JOIN healthcare_analytics_solutions b ON a.healthcare_analytics_solution_id = b.id;
```

| data_point_id | metric_name | metric_value | measurement_unit | solution_id | solution_solution_id | solution_solution_name |
|---|---|---|---|---|---|---|
| 726063 | Primary Programme A | 14.95 | extended-measurem-87 | 1 | 4793487 | Primary Review A |
| id_24 | Composite Standard | 18.90 | integrated-measurem-88 | 2 | 5844272 | Composite Initiative |
| e878ea4c-8fd1-11eb-924d-9cd76263cbd0 | Compact Framework | 22.85 | seasonal-measurem-89 | 3 | 0470021411 | Compact Model |
| ar_001 | Legacy Protocol D | 26.80 | regional-measurem-90 | 4 | 7021001070020 | Legacy Cluster D |

### 4.6 Analytics-to-CDS Views

The view `vw_healthcare_analytics_solution_clinical_decision_support` joins `healthcare_analytics_solutions` to `clinical_decision_supports` on `healthcare_analytics_solutions.clinical_decision_support_id = clinical_decision_supports.id`. This is a one-to-one join enforced by the foreign key in the analytics solutions table. It projects the solution's `id`, `solution_id`, `solution_name`, and `solution_type` alongside the CDS's `id`, `cds_id`, and `cds_name` (renamed with the `support_` prefix). This view answers: "Which CDS system is paired with each analytics solution?" Representative output includes solution `1` ("Primary Review A", type `regional-solution-60`) paired with CDS `100` ("Baseline Protocol D", CDS identifier `784e2c06-8fb2-11eb-924d-9cd76263cbd0`).

**View `vw_healthcare_analytics_solution_clinical_decision_support`**

```sql
CREATE VIEW vw_healthcare_analytics_solution_clinical_decision_support AS
SELECT a.id, a.solution_id, a.solution_name, a.solution_type, b.id AS support_id, b.cds_id AS support_cds_id, b.cds_name AS support_cds_name
FROM healthcare_analytics_solutions a JOIN clinical_decision_supports b ON a.clinical_decision_support_id = b.id;
```

| id | solution_id | solution_name | solution_type | support_id | support_cds_id | support_cds_name |
|---|---|---|---|---|---|---|
| 1 | 4793487 | Primary Review A | regional-solution-60 | 100 | 784e2c06-8fb2-11eb-924d-9cd76263cbd0 | Baseline Protocol D |
| 2 | 5844272 | Composite Initiative | legacy-solution-61 | 101 | 9568460 | Distributed Programme |
| 3 | 0470021411 | Compact Model | compact-solution-62 | 102 | Invoices | Adaptive Standard |
| 4 | 7021001070020 | Legacy Cluster D | composite-solution-63 | 103 | Tanggal | Primary Framework A |

The reverse-direction view `vw_clinical_decision_support_healthcare_analytics_solution` joins `clinical_decision_supports` to `healthcare_analytics_solutions` on `clinical_decision_supports.healthcare_analytics_solution_id = healthcare_analytics_solutions.id`. It projects the CDS's `id`, `cds_id`, `cds_name`, and `cds_type` alongside the solution's `id`, `solution_id`, and `solution_name` (renamed with the `solution_` prefix). This view answers: "Which analytics solution is this CDS system linked to?" Representative output includes CDS `100` ("Baseline Protocol D", type `primary-cds-10`) linked to solution `1` ("Primary Review A", solution identifier `4793487`).

**View `vw_clinical_decision_support_healthcare_analytics_solution`**

```sql
CREATE VIEW vw_clinical_decision_support_healthcare_analytics_solution AS
SELECT a.id, a.cds_id, a.cds_name, a.cds_type, b.id AS solution_id, b.solution_id AS solution_solution_id, b.solution_name AS solution_solution_name
FROM clinical_decision_supports a JOIN healthcare_analytics_solutions b ON a.healthcare_analytics_solution_id = b.id;
```

| id | cds_id | cds_name | cds_type | solution_id | solution_solution_id | solution_solution_name |
|---|---|---|---|---|---|---|
| 100 | 784e2c06-8fb2-11eb-924d-9cd76263cbd0 | Baseline Protocol D | primary-cds-10 | 1 | 4793487 | Primary Review A |
| 101 | 9568460 | Distributed Programme | adaptive-cds-11 | 2 | 5844272 | Composite Initiative |
| 102 | Invoices | Adaptive Standard | distributed-cds-12 | 3 | 0470021411 | Compact Model |
| 103 | Tanggal | Primary Framework A | baseline-cds-13 | 4 | 7021001070020 | Legacy Cluster D |

### 4.7 Analytics-to-EHR Views

The view `vw_healthcare_analytics_solution_electronic_health_record` joins `healthcare_analytics_solutions` to `electronic_health_records` on `healthcare_analytics_solutions.electronic_health_record_ehr_id = electronic_health_records.ehr_id`. This is a one-to-one join enforced by the foreign key in the analytics solutions table. It projects the solution's `id`, `solution_id`, `solution_name`, and `solution_type` alongside the EHR's `ehr_id`, `patient_id`, and `collection_date` (renamed with the `record_` prefix). This view answers: "Which patient record is associated with each analytics solution?" Representative output includes solution `1` ("Primary Review A", type `regional-solution-60`) associated with `ehr_id` `195366` (patient `8387541`, collected `2025-12-17T11:57:00`).

**View `vw_healthcare_analytics_solution_electronic_health_record`**

```sql
CREATE VIEW vw_healthcare_analytics_solution_electronic_health_record AS
SELECT a.id, a.solution_id, a.solution_name, a.solution_type, b.ehr_id AS record_ehr_id, b.patient_id AS record_patient_id, b.collection_date AS record_collection_date
FROM healthcare_analytics_solutions a JOIN electronic_health_records b ON a.electronic_health_record_ehr_id = b.ehr_id;
```

| id | solution_id | solution_name | solution_type | record_ehr_id | record_patient_id | record_collection_date |
|---|---|---|---|---|---|---|
| 1 | 4793487 | Primary Review A | regional-solution-60 | 195366 | 8387541 | 2025-12-17T11:57:00 |
| 2 | 5844272 | Composite Initiative | legacy-solution-61 | 611509 | 10207142 | 2022-05-01T18:14:00 |
| 3 | 0470021411 | Compact Model | compact-solution-62 | 884338 | 7119782 | 2023-10-12T01:31:00 |
| 4 | 7021001070020 | Legacy Cluster D | composite-solution-63 | gd_taxc_1123 | gd_acc_160003 | 2024-03-23T08:48:00 |

### 4.8 CDS-to-EHR Views

The view `vw_clinical_decision_support_electronic_health_record` joins `clinical_decision_supports` to `electronic_health_records` on `clinical_decision_supports.electronic_health_record_ehr_id = electronic_health_records.ehr_id`. This is a one-to-one join enforced by the foreign key in the CDS table. It projects the CDS's `id`, `cds_id`, `cds_name`, and `cds_type` alongside the EHR's `ehr_id`, `patient_id`, and `collection_date` (renamed with the `record_` prefix). This view answers: "Which patient record is associated with each CDS system?" Representative output includes CDS `100` ("Baseline Protocol D", type `primary-cds-10`) associated with `ehr_id` `195366` (patient `8387541`, collected `2025-12-17T11:57:00`).

**View `vw_clinical_decision_support_electronic_health_record`**

```sql
CREATE VIEW vw_clinical_decision_support_electronic_health_record AS
SELECT a.id, a.cds_id, a.cds_name, a.cds_type, b.ehr_id AS record_ehr_id, b.patient_id AS record_patient_id, b.collection_date AS record_collection_date
FROM clinical_decision_supports a JOIN electronic_health_records b ON a.electronic_health_record_ehr_id = b.ehr_id;
```

| id | cds_id | cds_name | cds_type | record_ehr_id | record_patient_id | record_collection_date |
|---|---|---|---|---|---|---|
| 100 | 784e2c06-8fb2-11eb-924d-9cd76263cbd0 | Baseline Protocol D | primary-cds-10 | 195366 | 8387541 | 2025-12-17T11:57:00 |
| 101 | 9568460 | Distributed Programme | adaptive-cds-11 | 611509 | 10207142 | 2022-05-01T18:14:00 |
| 102 | Invoices | Adaptive Standard | distributed-cds-12 | 884338 | 7119782 | 2023-10-12T01:31:00 |
| 103 | Tanggal | Primary Framework A | baseline-cds-13 | gd_taxc_1123 | gd_acc_160003 | 2024-03-23T08:48:00 |

## 5. Summary of the Relational Model

The healthcare data platform is modelled as a set of five core tables and one junction table, interconnected through a dense web of foreign-key relationships. The `healthcare_organizations` table serves as the central hub, with each organisation row carrying foreign keys to exactly one EHR, one analytics solution, and one CDS system. The `electronic_health_records` table introduces a many-to-one relationship back to organisations via `healthcare_organization_id`, allowing an organisation to own multiple patient records. The `clinical_data_points` table references both an EHR and an analytics solution, capturing clinical measurements in the context of a patient record and an analytics platform. The `healthcare_analytics_solutions` and `clinical_decision_supports` tables each carry three foreign keys that bind them to an organisation, an EHR, and a peer entity, creating a tightly coupled star topology.

The junction table `records_points` is the sole mechanism for the many-to-many relationship between EHRs and clinical data points, enabling the view `vw_electronic_health_record_clinical_data_point_detail` to reconstruct the full set of data points associated with each patient record.

All twelve views are simple inner joins between two or three tables, each reconstructing a specific domain fact from the normalised base tables. The naming convention follows a consistent pattern: `vw_<entity_a>_<entity_b>`, and the join predicate always uses the foreign key column in the referencing table matched against the primary key column in the referenced table. Column renaming with prefixes (`record_`, `solution_`, `support_`, `organization_`, `point_`) disambiguates columns with identical names across the joined tables.
