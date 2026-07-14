# Healthcare Data Ecosystems: Organizations, Records, and Decision Support

Modern healthcare delivery relies on interconnected systems that capture patient information, analyze clinical trends, and support provider decision-making. At the center of this ecosystem sit healthcare organizations—structured entities that deploy electronic health records, analytics platforms, and clinical decision support tools to manage patient care. The data landscape is organized around five core record types: the organizations themselves, the electronic health records they maintain, the clinical data points extracted from those records, the analytics solutions that process the data, and the decision support mechanisms that translate insights into action. A junction table links clinical data points to their parent records, enabling many-to-many relationships where a single record may contain multiple data points and a single data point type may appear across multiple records. Understanding how these components relate requires examining each layer of the data stack and the views that join them into coherent narratives.

## Healthcare Organizations

**Table `healthcare_organizations`**

| id | organization_id | name | location_city | location_state | location_country | operating_margin | is_sustainable | electronic_health_record_ehr_id | healthcare_analytics_solution_id | clinical_decision_support_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1000 | Shell Oil | Extended Review | seasonal-location-23 | composite-location-93 | adaptive-location-47 | 21.70 | true | 195366 | 1 | 100 |
| 1001 | GlobalPlatform Inc. | Pilot Initiative A | regional-location-24 | primary-location-94 | distributed-location-48 | 25.40 | false | 611509 | 2 | 101 |
| 1002 | Whatsapp Inc. | Baseline Model | legacy-location-25 | adaptive-location-95 | baseline-location-49 | 29.10 | true | 884338 | 3 | 102 |
| 1003 | American Institutes for Research | Distributed Cluster | compact-location-26 | distributed-location-96 | pilot-location-50 | 32.80 | false | gd_taxc_1123 | 4 | 103 |

Healthcare organizations form the foundational layer of the data ecosystem. Each organization carries a unique identifier, a descriptive name, and geographic metadata including city, state, and country. The `organization_id` column stores the primary business identifier, while the `name` column provides a human-readable label. For example, organization 1000 is identified as "Shell Oil" with location details `seasonal-location-23`, `composite-location-93`, and `adaptive-location-47`, and operates with a margin of 21.70. Organization 1001, "GlobalPlatform Inc.," runs a "Pilot Initiative A" at `regional-location-24` with a margin of 25.40. Organization 1002, "Whatsapp Inc.," manages a "Baseline Model" at `legacy-location-25` with a margin of 29.10. Organization 1003, "American Institutes for Research," operates a "Distributed Cluster" at `compact-location-26` with a margin of 32.80.

The `operating_margin` field captures financial performance as a decimal value, ranging from 21.70 to 32.80 across the sample. The `is_sustainable` flag indicates whether the organization meets a sustainability criterion—organizations 1000 and 1002 are marked `true`, while 1001 and 1003 are marked `false`. Each organization also carries foreign-key references to its associated electronic health record (`electronic_health_record_ehr_id`), healthcare analytics solution (`healthcare_analytics_solution_id`), and clinical decision support system (`clinical_decision_support_id`), establishing the primary linkage to downstream data layers.

## Electronic Health Records

**Table `electronic_health_records`**

| ehr_id | patient_id | collection_date | data_volume | data_format | is_complete | storage_location | healthcare_organization_id |
|---|---|---|---|---|---|---|---|
| 195366 | 8387541 | 2025-12-17T11:57:00 | 9.95 | primary-data-16 | false | distributed-storage-48 | 1000 |
| 611509 | 10207142 | 2022-05-01T18:14:00 | 12.90 | adaptive-data-17 | true | baseline-storage-49 | 1001 |
| 884338 | 7119782 | 2023-10-12T01:31:00 | 15.85 | distributed-data-18 | false | pilot-storage-50 | 1002 |
| gd_taxc_1123 | gd_acc_160003 | 2024-03-23T08:48:00 | 18.80 | baseline-data-19 | true | extended-storage-51 | 1003 |

Electronic health records (EHRs) serve as the primary container for patient-level data within each organization. The `ehr_id` column uniquely identifies each record, supporting both numeric identifiers such as `195366` and `611509` and alphanumeric identifiers such as `gd_taxc_1123`. Each EHR is associated with a `patient_id`—for instance, patient `8387541` is linked to EHR `195366`, while patient `gd_acc_160003` is linked to EHR `gd_taxc_1123`. The `collection_date` records when the data was gathered, spanning from May 2022 through December 2025.

The `data_volume` field quantifies the size of each record in a unitless measure, ranging from 9.95 for EHR `195366` to 18.80 for EHR `gd_taxc_1123`. The `data_format` column classifies the structural encoding—values include `primary-data-16`, `adaptive-data-17`, `distributed-data-18`, and `baseline-data-19`. The `is_complete` flag indicates whether the record has been fully populated: EHRs `611509` and `gd_taxc_1123` are complete, while `195366` and `884338` are not. The `storage_location` field identifies where the record is physically or logically stored, with values such as `distributed-storage-48` and `baseline-storage-49`. Each EHR references its parent organization through `healthcare_organization_id`, tying the patient data back to the organizational layer.

## Clinical Data Points

**Table `clinical_data_points`**

| data_point_id | metric_name | metric_value | measurement_unit | timestamp | data_quality | electronic_health_record_ehr_id | healthcare_analytics_solution_id |
|---|---|---|---|---|---|---|---|
| 726063 | Primary Programme A | 14.95 | extended-measurem-87 | 2024-07-08T18:18:00 | primary-data-82 | 195366 | 1 |
| id_24 | Composite Standard | 18.90 | integrated-measurem-88 | 2025-12-19T01:35:00 | adaptive-data-83 | 611509 | 2 |
| e878ea4c-8fd1-11eb-924d-9cd76263cbd0 | Compact Framework | 22.85 | seasonal-measurem-89 | 2022-05-03T08:52:00 | distributed-data-84 | 884338 | 3 |
| ar_001 | Legacy Protocol D | 26.80 | regional-measurem-90 | 2023-10-14T15:09:00 | baseline-data-85 | gd_taxc_1123 | 4 |

Clinical data points represent the granular measurements extracted from electronic health records. Each point carries a `data_point_id` that may be numeric (`726063`), alphanumeric (`id_24`), a UUID (`e878ea4c-8fd1-11eb-924d-9cd76263cbd0`), or a short code (`ar_001`). The `metric_name` column describes what is being measured—examples include "Primary Programme A," "Composite Standard," "Compact Framework," and "Legacy Protocol D." The `metric_value` records the numeric result of the measurement, ranging from 14.95 to 26.80.

The `measurement_unit` column specifies the unit of measure for each metric, with values such as `extended-measurem-87`, `integrated-measurem-88`, `seasonal-measurem-89`, and `regional-measurem-90`. The `timestamp` records when the measurement was taken, and `data_quality` classifies the quality tier of the measurement, with values like `primary-data-82`, `adaptive-data-83`, `distributed-data-84`, and `baseline-data-85`. Each data point references its parent EHR through `electronic_health_record_ehr_id` and its associated analytics solution through `healthcare_analytics_solution_id`, creating a bridge between raw measurements and the systems that process them.

## Healthcare Analytics Solutions

**Table `healthcare_analytics_solutions`**

| id | solution_id | solution_name | solution_type | vendor | is_web_based | supports_big_data | deployment_date | healthcare_organization_id | electronic_health_record_ehr_id | clinical_decision_support_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 4793487 | Primary Review A | regional-solution-60 | Feedback Ratings | false | true | 2023-02-14 | 1000 | 195366 | 100 |
| 2 | 5844272 | Composite Initiative | legacy-solution-61 | Abbott Laboratories | true | false | 2024-07-25 | 1001 | 611509 | 101 |
| 3 | 0470021411 | Compact Model | compact-solution-62 | American Express | false | true | 2025-12-09 | 1002 | 884338 | 102 |
| 4 | 7021001070020 | Legacy Cluster D | composite-solution-63 | Whatsapp Inc. | true | false | 2022-05-20 | 1003 | gd_taxc_1123 | 103 |

Healthcare analytics solutions provide the computational infrastructure for processing clinical data. Each solution has a unique `id`, a `solution_id` (which may be numeric or long-form, such as `7021001070020`), and a `solution_name` like "Primary Review A" or "Legacy Cluster D." The `solution_type` classifies the deployment model—values include `regional-solution-60`, `legacy-solution-61`, `compact-solution-62`, and `composite-solution-63`. The `vendor` column identifies the provider, with entries such as "Feedback Ratings," "Abbott Laboratories," "American Express," and "Whatsapp Inc."

The `is_web_based` flag indicates whether the solution is accessible through a web interface, and `supports_big_data` indicates whether it can handle large-scale data processing. Deployment dates range from May 2022 to December 2025. Each solution references its parent organization (`healthcare_organization_id`), its associated EHR (`electronic_health_record_ehr_id`), and its linked clinical decision support system (`clinical_decision_support_id`), forming a hub that connects organizational resources to analytical capabilities.

## Clinical Decision Supports

**Table `clinical_decision_supports`**

| id | cds_id | cds_name | cds_type | effectiveness | is_proactive | is_predictive | healthcare_analytics_solution_id | electronic_health_record_ehr_id | healthcare_organization_id |
|---|---|---|---|---|---|---|---|---|---|
| 100 | 784e2c06-8fb2-11eb-924d-9cd76263cbd0 | Baseline Protocol D | primary-cds-10 | 16.45 | false | false | 1 | 195366 | 1000 |
| 101 | 9568460 | Distributed Programme | adaptive-cds-11 | 19.90 | true | true | 2 | 611509 | 1001 |
| 102 | Invoices | Adaptive Standard | distributed-cds-12 | 23.35 | false | false | 3 | 884338 | 1002 |
| 103 | Tanggal | Primary Framework A | baseline-cds-13 | 26.80 | true | true | 4 | gd_taxc_1123 | 1003 |

Clinical decision support (CDS) systems provide automated guidance to healthcare providers. Each CDS record carries an `id`, a `cds_id` (which may be a UUID, a short code, or a word such as "Invoices" or "Tanggal"), and a `cds_name` such as "Baseline Protocol D" or "Primary Framework A." The `cds_type` classifies the system—values include `primary-cds-10`, `adaptive-cds-11`, `distributed-cds-12`, and `baseline-cds-13`. The `effectiveness` field quantifies performance as a decimal value, ranging from 16.45 to 26.80.

The `is_proactive` and `is_predictive` flags indicate whether the system initiates guidance without a trigger and whether it forecasts outcomes, respectively. CDS systems 101 and 103 are both proactive and predictive, while 100 and 102 are neither. Each CDS references its associated analytics solution (`healthcare_analytics_solution_id`), its parent EHR (`electronic_health_record_ehr_id`), and its parent organization (`healthcare_organization_id`), completing the chain from raw data to actionable insight.

## Records Points

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

The `records_points` table serves as a junction between electronic health records and clinical data points, enabling many-to-many relationships. Each row pairs an `electronic_health_record_ehr_id` with a `data_point_id`. EHR `195366` is linked to two data points (`726063` and `id_24`), EHR `611509` is linked to two data points (`id_24` and `e878ea4c-8fd1-11eb-924d-9cd76263cbd0`), EHR `884338` is linked to two data points (`e878ea4c-8fd1-11eb-924d-9cd76263cbd0` and `ar_001`), and EHR `gd_taxc_1123` is linked to two data points (`ar_001` and `726063`). This structure allows a single data point type to appear across multiple records and a single record to contain multiple distinct measurements, reflecting the complexity of real-world clinical data collection.

## Organization-to-Record Views

The view `vw_healthcare_organization_electronic_health_record` joins healthcare organizations with their associated electronic health records, answering the question of which patient records belong to which organization. For example, organization 1000 ("Shell Oil") is linked to EHR `195366`, which contains data for patient `8387541` with a volume of 9.95. Organization 1003 ("American Institutes for Research") is linked to EHR `gd_taxc_1123`, containing data for patient `gd_acc_160003` with a volume of 18.80. This view provides a clear organizational inventory of patient data holdings.

The view `vw_electronic_health_record_healthcare_organization` reverses this perspective, starting from the EHR and identifying its parent organization. EHR `195366` resolves to organization 1000 ("Shell Oil"), while EHR `gd_taxc_1123` resolves to organization 1003 ("American Institutes for Research"). This orientation is useful when auditing a specific record and needing to determine which organization is responsible for it.

## Organization-to-Analytics Views

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

The view `vw_healthcare_organization_healthcare_analytics_solution` links organizations to their deployed analytics platforms. Organization 1000 ("Shell Oil") is associated with analytics solution 1 ("Primary Review A"), a regional solution from "Feedback Ratings" that supports big data but is not web-based. Organization 1001 ("GlobalPlatform Inc.") is associated with solution 2 ("Composite Initiative"), a legacy solution from "Abbott Laboratories" that is web-based but does not support big data. This view reveals the analytical capabilities available to each organization.

The view `vw_healthcare_analytics_solution_healthcare_organization` inverts the relationship, starting from the analytics solution and identifying its parent organization. Solution 1 ("Primary Review A") traces back to organization 1000, while solution 4 ("Legacy Cluster D") traces back to organization 1003. This orientation supports vendor and capability audits by showing which organizations have adopted which analytical tools.

## Organization-to-Decision-Support Views

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

The view `vw_healthcare_organization_clinical_decision_support` connects organizations to their clinical decision support systems. Organization 1000 ("Shell Oil") is linked to CDS 100 ("Baseline Protocol D"), which has an effectiveness score of 16.45 and is neither proactive nor predictive. Organization 1001 ("GlobalPlatform Inc.") is linked to CDS 101 ("Distributed Programme"), which has an effectiveness score of 19.90 and is both proactive and predictive. This view enables comparison of decision support capabilities across organizations.

The view `vw_clinical_decision_support_healthcare_organization` reverses the perspective, starting from the CDS and identifying its parent organization. CDS 100 ("Baseline Protocol D") traces to organization 1000, while CDS 103 ("Primary Framework A") traces to organization 1003. This orientation is useful when evaluating a specific decision support tool and determining which organization has deployed it.

## Record-to-Data-Point Views



The view `vw_electronic_health_record_clinical_data_point_detail` joins EHRs with their clinical data points, answering which measurements are contained within each record. EHR `195366` contains data points `726063` ("Primary Programme A," value 14.95) and `id_24` ("Composite Standard," value 18.90). EHR `gd_taxc_1123` contains data points `ar_001` ("Legacy Protocol D," value 26.80) and `726063` ("Primary Programme A," value 14.95). This view provides a detailed inventory of the measurements available within each electronic health record.

The view `vw_clinical_data_point_electronic_health_record` inverts this relationship, starting from a data point and identifying its parent EHR. Data point `726063` ("Primary Programme A") is found in EHR `195366`, while data point `ar_001` ("Legacy Protocol D") is found in EHR `gd_taxc_1123`. This orientation supports traceability, allowing analysts to determine the source record for any given measurement.

## Analytics-to-Data-Point Views

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

The view `vw_clinical_data_point_healthcare_analytics_solution` links clinical data points to the analytics solutions that process them. Data point `726063` ("Primary Programme A") is processed by analytics solution 1 ("Primary Review A"), while data point `ar_001` ("Legacy Protocol D") is processed by solution 4 ("Legacy Cluster D"). This view reveals the analytical pipeline through which raw measurements flow.

The view `vw_healthcare_analytics_solution_electronic_health_record` connects analytics solutions to their associated EHRs. Solution 1 ("Primary Review A") is associated with EHR `195366`, while solution 4 ("Legacy Cluster D") is associated with EHR `gd_taxc_1123`. This view helps identify which records are being analyzed by which platforms.

## Analytics-to-Decision-Support Views

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

The view `vw_healthcare_analytics_solution_clinical_decision_support` links analytics solutions to their associated clinical decision support systems. Solution 1 ("Primary Review A") is linked to CDS 100 ("Baseline Protocol D"), while solution 4 ("Legacy Cluster D") is linked to CDS 103 ("Primary Framework A"). This view reveals how analytical outputs feed into decision support mechanisms.

The view `vw_clinical_decision_support_healthcare_analytics_solution` inverts the relationship, starting from the CDS and identifying its associated analytics solution. CDS 100 ("Baseline Protocol D") traces to solution 1, while CDS 103 ("Primary Framework A") traces to solution 4. This orientation is useful when evaluating a decision support tool and determining which analytical platform provides its underlying data.

## Decision-Support-to-Record Views

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

The view `vw_clinical_decision_support_electronic_health_record` connects clinical decision support systems to their associated EHRs. CDS 100 ("Baseline Protocol D") is linked to EHR `195366`, while CDS 103 ("Primary Framework A") is linked to EHR `gd_taxc_1123`. This view shows which patient records inform each decision support system.

The view `vw_clinical_decision_support_healthcare_organization` links CDS systems directly to their parent organizations, bypassing intermediate layers. CDS 100 ("Baseline Protocol D") belongs to organization 1000 ("Shell Oil"), while CDS 103 ("Primary Framework A") belongs to organization 1003 ("American Institutes for Research"). This view provides a high-level inventory of decision support capabilities across the organizational landscape.

## Closing Synthesis

The healthcare data ecosystem described here is built on five interlocking record types and a junction table that enables flexible many-to-many relationships between records and measurements. Healthcare organizations serve as the anchor, each associated with an electronic health record, an analytics solution, and a clinical decision support system. Electronic health records contain patient data with varying volumes, formats, and completeness. Clinical data points represent the granular measurements extracted from those records, linked through the `records_points` junction table. Analytics solutions provide the computational infrastructure, and clinical decision support systems translate analytical outputs into actionable guidance. The twelve views presented above offer multiple entry points into this ecosystem, allowing practitioners to navigate from organizations to records, from records to measurements, and from analytics to decision support, depending on the analytical question at hand.

## Data appendix

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
