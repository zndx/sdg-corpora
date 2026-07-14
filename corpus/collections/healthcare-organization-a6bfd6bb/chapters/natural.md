The modern healthcare enterprise operates as a network of interlocking systems: organizations that employ clinicians, clinicians who generate clinical observations, observations that populate electronic health records, and analytics platforms that transform those records into decision support. Every operational question—how much data a facility processes, which clinician contributed a measurement, whether a decision support rule is active—resolves to relationships between these entities. The following chapter documents the structure of that ecosystem, using the actual records maintained by a representative set of fictional organizations to ground each concept in concrete data.

## The Organizational Layer

Healthcare organizations form the foundational layer of the ecosystem. Each organization carries an internal identifier, a human-readable name, a geographic location, and an establishment date. Financial health is tracked through an operating margin and a sustainability flag.

**Table `healthcare_organizations`**

| id | organization_id | name | location | established_date | operating_margin | is_sustainable | electronic_health_record_ehr_id | healthcare_professional_id | analytics_solution_id |
|---|---|---|---|---|---|---|---|---|---|
| 1000 | Shell Oil | Extended Review | extended-location-99 | 2024-03-27 | 21.70 | true | 195366 | 1 | 100 |
| 1001 | GlobalPlatform Inc. | Pilot Initiative A | integrated-location-100 | 2025-08-11 | 25.40 | false | 611509 | 2 | 101 |
| 1002 | Whatsapp Inc. | Baseline Model | seasonal-location-101 | 2022-01-22 | 29.10 | true | 884338 | 3 | 102 |
| 1003 | American Institutes for Research | Distributed Cluster | regional-location-102 | 2023-06-06 | 32.80 | false | gd_taxc_1123 | 4 | 103 |

Consider the first row: organization `1000`, named "Shell Oil," located at `extended-location-99`, established on `2024-03-27`, with an operating margin of `21.70` and a sustainability flag set to `true`. This organization holds electronic health record `195366`, employs healthcare professional `1`, and runs analytics solution `100`. The second row, organization `1001` ("GlobalPlatform Inc."), shows an operating margin of `25.40` but a sustainability flag of `false`, indicating that profitability alone does not guarantee long-term viability. The fourth row, organization `1003` ("American Institutes for Research"), uses a non-numeric EHR identifier (`gd_taxc_1123`), demonstrating that record identifiers are not constrained to integers.

## Electronic Health Records

Electronic health records (EHRs) are the primary data containers within each organization. Each EHR is identified by an `ehr_id`, linked to a `patient_id`, and stamped with a `collection_date`. The `data_volume` field quantifies the size of the record, while `data_variety` describes its structural diversity. A `status` field tracks whether the record is `active`, `archived`, or `incomplete`.

**Table `electronic_health_records`**

| ehr_id | patient_id | collection_date | data_volume | data_variety | status | healthcare_organization_id |
|---|---|---|---|---|---|---|
| 195366 | 8387541 | 2025-12-17T11:57:00 | 9.95 | adaptive-data-65 | active | 1000 |
| 611509 | 10207142 | 2022-05-01T18:14:00 | 12.90 | distributed-data-66 | archived | 1001 |
| 884338 | 7119782 | 2023-10-12T01:31:00 | 15.85 | baseline-data-67 | incomplete | 1002 |
| gd_taxc_1123 | gd_acc_160003 | 2024-03-23T08:48:00 | 18.80 | pilot-data-68 | active | 1003 |

EHR `195366` belongs to patient `8387541`, was collected on `2025-12-17T11:57:00`, has a data volume of `9.95`, and carries the variety label `adaptive-data-65`. Its status is `active` and it is associated with organization `1000`. EHR `gd_taxc_1123`, by contrast, has a data volume of `18.80` and a variety of `pilot-data-68`, suggesting a more complex or experimental data structure. The `archived` status of EHR `611509` indicates that not all records remain in active circulation.

## Clinical Data Points

Clinical data points are the granular measurements extracted from or associated with EHRs. Each point carries a `clinical_data_point_id`, a `data_point_id`, a `measurement_type`, a numeric `value`, a `unit`, and a `timestamp`. The `is_anomalous` flag signals whether the measurement falls outside expected ranges.

**Table `clinical_data_points`**

| clinical_data_point_id | data_point_id | measurement_type | value | unit | timestamp | is_anomalous | electronic_health_record_ehr_id | healthcare_professional_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 726063 | adaptive-measurem-89 | 19.95 | distributed-unit-18 | 2024-07-08T18:18:00 | true | 195366 | 1 |
| 2 | id_24 | distributed-measurem-90 | 21.90 | baseline-unit-19 | 2025-12-19T01:35:00 | false | 611509 | 2 |
| 3 | e878ea4c-8fd1-11eb-924d-9cd76263cbd0 | baseline-measurem-91 | 23.85 | pilot-unit-20 | 2022-05-03T08:52:00 | true | 884338 | 3 |
| 4 | ar_001 | pilot-measurem-92 | 25.80 | extended-unit-21 | 2023-10-14T15:09:00 | false | gd_taxc_1123 | 4 |

Clinical data point `1` has measurement type `adaptive-measurem-89`, a value of `19.95` in unit `distributed-unit-18`, recorded at `2024-07-08T18:18:00`. It is flagged as `true` for anomalous status and is linked to EHR `195366` and healthcare professional `1`. Clinical data point `4` carries the data point identifier `ar_001`, a value of `25.80` in unit `extended-unit-21`, and is associated with EHR `gd_taxc_1123` and professional `4`. The UUID-style identifier `e878ea4c-8fd1-11eb-924d-9cd76263cbd0` on point `3` illustrates that data point identifiers may use various formats.

## Healthcare Professionals

Healthcare professionals are the human actors who generate clinical data. Each professional has an `id`, a `professional_id`, a `name`, a `specialty`, a `license_number`, and an `employment_status` that can be `active`, `inactive`, or `on_leave`.

**Table `healthcare_professionals`**

| id | professional_id | name | specialty | license_number | employment_status | healthcare_organization_id |
|---|---|---|---|---|---|---|
| 1 | 5082965 | Extended Review | extended-specialt-21 | LIC-2589 | active | 1000 |
| 2 | 2618560 | Pilot Initiative A | integrated-specialt-22 | LIC-2596 | inactive | 1001 |
| 3 | 3355767 | Baseline Model | seasonal-specialt-23 | LIC-2603 | on_leave | 1002 |
| 4 | 3355784 | Distributed Cluster | regional-specialt-24 | LIC-2610 | active | 1003 |

Professional `1`, named "Extended Review," holds specialty `extended-specialt-21`, license `LIC-2589`, and is `active` within organization `1000`. Professional `2` ("Pilot Initiative A") has license `LIC-2596` and is `inactive`, while professional `3` ("Baseline Model") is `on_leave`. Professional `4` ("Distributed Cluster") is `active` and works within organization `1003`. The naming convention across professionals mirrors that of organizations, reinforcing the fictional but internally consistent nature of the dataset.

## Analytics Solutions

Analytics solutions are the software platforms that process EHR data and feed into clinical decision support. Each solution has an `id`, a `solution_id`, a `name`, a `type` (such as `clinical`, `business`, or `big_data`), a `provider`, a `deployment_date`, a boolean `is_web_based` flag, and an association to a `healthcare_organization_id`.

**Table `analytics_solutions`**

| id | solution_id | name | type | provider | deployment_date | is_web_based | healthcare_organization_id | created_at |
|---|---|---|---|---|---|---|---|---|
| 100 | 4793487 | Extended Review | clinical | legacy-provider-37 | 2023-02-14 | false | 1000 | 2025-01-01 00:14:00 |
| 101 | 5844272 | Pilot Initiative A | business | compact-provider-38 | 2024-07-25 | true | 1001 | 2025-02-06 03:14:00 |
| 102 | 0470021411 | Baseline Model | big_data | composite-provider-39 | 2025-12-09 | false | 1002 | 2025-03-11 06:14:00 |
| 103 | 7021001070020 | Distributed Cluster | clinical | primary-provider-40 | 2022-05-20 | true | 1003 | 2025-04-16 09:14:00 |

Solution `100` ("Extended Review") is of type `clinical`, provided by `legacy-provider-37`, deployed on `2023-02-14`, and is not web-based. It belongs to organization `1000`. Solution `101` ("Pilot Initiative A") is of type `business`, provided by `compact-provider-38`, deployed on `2024-07-25`, and is web-based, belonging to organization `1001`. Solution `103` ("Distributed Cluster") is of type `clinical`, provided by `primary-provider-40`, and is web-based, belonging to organization `1003`. The `created_at` timestamps show a sequential pattern, with each solution created approximately one month apart.

## Clinical Decision Supports

Clinical decision supports (CDS) are the rules and recommendations generated by analytics solutions. Each CDS has a `cds_id`, a `trigger_condition`, a `recommendation`, an `effectiveness_score`, a `last_updated` timestamp, an `is_proactive` flag, and a link to an `analytics_solution_id`.

**Table `clinical_decision_supports`**

| cds_id | trigger_condition | recommendation | effectiveness_score | last_updated | is_proactive | analytics_solution_id |
|---|---|---|---|---|---|---|
| 784e2c06-8fb2-11eb-924d-9cd76263cbd0 | legacy-trigger-49 | pilot-recommen-38 | 3.45 | 2023-06-17T17:27:00 | false | 100 |
| 9568460 | compact-trigger-50 | extended-recommen-39 | 5.90 | 2024-11-01T00:44:00 | true | 101 |
| Invoices | composite-trigger-51 | integrated-recommen-40 | 8.35 | 2025-04-12T07:01:00 | false | 102 |
| Tanggal | primary-trigger-52 | seasonal-recommen-41 | 10.80 | 2022-09-23T14:18:00 | true | 103 |

CDS `784e2c06-8fb2-11eb-924d-9cd76263cbd0` is triggered by `legacy-trigger-49`, produces recommendation `pilot-recommen-38`, has an effectiveness score of `3.45`, was last updated on `2023-06-17T17:27:00`, is not proactive, and is linked to analytics solution `100`. CDS `9568460` has a higher effectiveness score of `5.90`, is proactive, and is linked to solution `101`. The CDS with identifier `Invoices` has an effectiveness score of `8.35` and is linked to solution `102`, while the CDS identified as `Tanggal` achieves the highest score of `10.80`, is proactive, and is linked to solution `103`.

## Cross-Reference Tables

The ecosystem includes four cross-reference tables that capture additional associations between the primary entities. These tables do not introduce new entities but rather record relationships that may not be directly expressible through single foreign keys.

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

These cross-reference tables enable many-to-many relationships and support complex queries that span multiple entity types. For instance, a single clinical data point may be associated with multiple records, a single professional may be linked to multiple data points, and a single analytics solution may serve multiple records.

## Organization-to-Record Relationships

The first set of views connects organizations to their electronic health records, healthcare professionals, and analytics solutions. These views answer the question: what assets does a given organization manage?

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

The organization-to-EHR view reveals that organization `1000` manages EHR `195366`, which belongs to patient `8387541` and has a data volume of `9.95`. Organization `1003` manages EHR `gd_taxc_1123`, which has the highest data volume (`18.80`) among all records. The organization-to-professional view shows that organization `1000` employs professional `1` ("Extended Review"), who is `active` and holds license `LIC-2589`. Organization `1002` employs professional `3` ("Baseline Model"), who is currently `on_leave`. The organization-to-analytics view demonstrates that organization `1001` runs analytics solution `101` ("Pilot Initiative A"), a web-based `business`-type solution provided by `compact-provider-38`.

## Record-to-Organization and Record-to-Data Relationships

These views invert the perspective, starting from the EHR and tracing back to the owning organization and forward to the clinical data points contained within or associated with the record.

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

The EHR-to-organization view confirms that EHR `195366` is owned by organization `1000` ("Shell Oil"), while EHR `611509` is owned by organization `1001` ("GlobalPlatform Inc."). The EHR-to-clinical-data-point view shows that EHR `195366` contains clinical data point `1`, which has measurement type `adaptive-measurem-89` and value `19.95`. The clinical data point-to-EHR view provides the reverse mapping: clinical data point `2` (with value `21.90` and measurement type `distributed-measurem-90`) is associated with EHR `611509`, which has status `archived`.

## Professional-to-Organization and Professional-to-Data Relationships

These views connect healthcare professionals to their employing organizations and to the clinical data points they have generated.

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

The professional-to-organization view shows that professional `1` ("Extended Review") is employed by organization `1000` and is `active`. Professional `2` ("Pilot Initiative A") is employed by organization `1001` and is `inactive`. The professional-to-clinical-data-point view reveals that professional `1` generated clinical data point `1`, which is flagged as anomalous. Professional `4` ("Distributed Cluster") generated clinical data point `4`, which has a value of `25.80` and is not anomalous. The clinical data point-to-professional view confirms that clinical data point `3` (with value `23.85` and measurement type `baseline-measurem-91`) was generated by professional `3`, who is currently `on_leave`.

## Analytics and Decision Support Relationships

The final set of views connects analytics solutions to their parent organizations and to the EHRs they process, and links clinical decision supports to their source analytics solutions and to the professionals they serve.

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

The analytics solution-to-organization view shows that solution `100` ("Extended Review") belongs to organization `1000` and is of type `clinical`. Solution `102` ("Baseline Model") belongs to organization `1002` and is of type `big_data`. The analytics solution-to-EHR view demonstrates that solution `100` processes EHR `195366`, which has a data volume of `9.95` and status `active`. The CDS-to-analytics solution view reveals that CDS `9568460` is powered by analytics solution `101` and has an effectiveness score of `5.90`. The CDS-to-professional view shows that CDS `Tanggal` (with effectiveness score `10.80`) is associated with professional `4` ("Distributed Cluster"), who is `active` within organization `1003`.

## Synthesis

The healthcare ecosystem documented here is a tightly coupled network of organizations, records, professionals, analytics platforms, and decision support rules. Organizations employ professionals and run analytics solutions. Professionals generate clinical data points, which are stored within electronic health records. Analytics solutions process those records and produce clinical decision supports, which in turn inform the professionals who generated the underlying data. The cross-reference tables and the various joined views provide multiple entry points into this network, allowing practitioners to trace relationships from any entity to all connected entities. Whether the question is financial (which organizations are sustainable), operational (which professionals are active), analytical (which solutions process the most data), or clinical (which decision supports are most effective), the data model supports direct, traceable answers.