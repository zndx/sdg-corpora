In a fictional identity-processing ecosystem, organizations manage a pipeline that begins with physical identification documents, captures them through hardware scanners, extracts personal data via optical character recognition engines, and packages the results within security software products. The relational schema models this pipeline as five core entity tables linked by foreign keys and a single many-to-many junction table, with twelve materialized views that reassemble the normalized facts into domain-meaningful joins. Every table and view is described below, along with the column-level decisions that turn entity attributes into relational structure and the join logic that reconstructs each business fact.

## Base Tables and Entity Types

The schema centres on five base tables that model the principal entity types of the identity-processing pipeline. Each table stores a single entity type, with its primary key as a surrogate integer column and its attributes spread across typed columns that capture both categorical and numeric properties.

**Table `security_software_packages`**

| id | software_identifier | product_name | retail_price | supported_operating_system | currency_code | compatibility_status | hardware_scanner_device_id | optical_character_recognition_engine_id |
|---|---|---|---|---|---|---|---|---|
| 1000 | SOF-2031 | Primary Review A | 29.99 | distributed-supporte-36 | 1235 | compatible | 1000 | 100 |
| 1001 | SOF-2038 | Composite Initiative | 27.02 | baseline-supporte-37 | 10782179 | incompatible | 1001 | 101 |
| 1002 | SOF-2045 | Compact Model | 11.11 | pilot-supporte-38 | 9125631 | unknown | 1002 | 102 |
| 1003 | SOF-2052 | Legacy Cluster D | 35.45 | extended-supporte-39 | 4e386610-8fcc-11eb-924d-9cd76263cbd0 | compatible | 1003 | 103 |

The `security_software_packages` table represents the software products that bundle and distribute identity-processing capabilities. Its primary key `id` is a surrogate integer (e.g. `1000`, `1001`). The column `software_identifier` holds a human-readable code such as `SOF-2031` or `SOF-2052`. The `product_name` column carries descriptive labels like `Primary Review A` and `Compact Model`. Pricing is captured in `retail_price` (a decimal, e.g. `29.99`) alongside `currency_code` (e.g. `1235`, `10782179`). The `supported_operating_system` column stores an identifier for the target OS (e.g. `distributed-supporte-36`), while `compatibility_status` records whether the package is `compatible`, `incompatible`, or `unknown` with the surrounding hardware. Two foreign-key columns — `hardware_scanner_device_id` and `optical_character_recognition_engine_id` — link each software package to exactly one scanner device and one OCR engine, respectively. These FK columns enforce a many-to-one cardinality: many software packages could reference the same scanner or engine, but each package references at most one of each.

**Table `hardware_scanner_devices`**

| id | device_model_name | camera_resolution_megapixels | maximum_scanning_size | power_source_type | interface_type | retail_price | currency_code | has_external_button | has_barcode_scanner | security_software_package_id | official_identification_document_id |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 1000 | Baseline Protocol D | 26 | seasonal-maximum-65 | adaptive-power-77 | seasonal-interfac-77 | 29.99 | 1235 | false | 884353 | 1000 | 1 |
| 1001 | Distributed Programme | 31 | regional-maximum-66 | distributed-power-78 | regional-interfac-78 | 27.02 | 10782179 | true | 2986243 | 1001 | 2 |
| 1002 | Adaptive Standard | 36 | legacy-maximum-67 | baseline-power-79 | legacy-interfac-79 | 11.11 | 9125631 | false | 1889774 | 1002 | 3 |
| 1003 | Primary Framework A | 41 | compact-maximum-68 | pilot-power-80 | compact-interfac-80 | 35.45 | 4e386610-8fcc-11eb-924d-9cd76263cbd0 | true | 99654 | 1003 | 4 |

The `hardware_scanner_devices` table models the physical scanners used to capture identification documents. Its surrogate primary key `id` takes values such as `1000` and `1003`. The `device_model_name` column holds names like `Baseline Protocol D` and `Primary Framework A`. Numeric attributes include `camera_resolution_megapixels` (e.g. `26`, `41`) and `retail_price` (e.g. `29.99`). The `maximum_scanning_size` column stores categorical size descriptors such as `seasonal-maximum-65`. Power and connectivity are captured in `power_source_type` (e.g. `adaptive-power-77`) and `interface_type` (e.g. `seasonal-interfac-77`). Boolean flags `has_external_button` and `has_barcode_scanner` record hardware features — for instance, device `1000` has `false` for the external button but a barcode scanner with identifier `884353`. The table also carries two foreign keys: `security_software_package_id` (pointing back to `security_software_packages.id`) and `official_identification_document_id` (pointing to `official_identification_documents.official_identification_document_id`). The bidirectional FK between `security_software_packages` and `hardware_scanner_devices` means the relationship is modelled redundantly on both sides — a design choice that allows queries to start from either entity without a join.

**Table `official_identification_documents`**

| official_identification_document_id | document_type | issuing_country_code | document_number | m_r_z_line1 | m_r_z_line2 | m_r_z_recognition_status | extraction_timestamp | extracted_personal_data_record_id | hardware_scanner_device_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | ID card | 89511 | DOC-2409 | primary-m-40 | compact-m-56 | recognized | 2024-11-03T22:42:00 | 100 | 1000 |
| 2 | passport | 1996928 | DOC-2410 | adaptive-m-41 | composite-m-57 | failed | 2025-04-14T05:59:00 | 101 | 1001 |
| 3 | ID card | 6564382 | DOC-2411 | distributed-m-42 | primary-m-58 | partial | 2022-09-25T12:16:00 | 102 | 1002 |
| 4 | passport | lu_tax_code_template_b_VB-IC-0 | DOC-2412 | baseline-m-43 | adaptive-m-59 | recognized | 2023-02-09T19:33:00 | 103 | 1003 |

The `official_identification_documents` table stores records of scanned identification documents. Its primary key is `official_identification_document_id` (values `1` through `4`). The `document_type` column distinguishes `ID card` from `passport`. The `issuing_country_code` column holds numeric codes such as `89511` and `1996928`, while `document_number` carries identifiers like `DOC-2409`. The machine-readable zone (MRZ) lines are stored in `m_r_z_line1` and `m_r_z_line2` (e.g. `primary-m-40` and `compact-m-56`). The `m_r_z_recognition_status` column records the OCR outcome as `recognized`, `failed`, or `partial`. The `extraction_timestamp` column (e.g. `2024-11-03T22:42:00`) timestamps the extraction event. Two foreign keys link each document to downstream entities: `extracted_personal_data_record_id` points to `extracted_personal_data_records.extracted_personal_data_record_id`, and `hardware_scanner_device_id` points to `hardware_scanner_devices.id`. The one-to-one relationship between documents and extracted records is enforced by the FK, meaning each document has at most one associated personal data record.

**Table `extracted_personal_data_records`**

| extracted_personal_data_record_id | record_identifier | extraction_method | source_language_code | output_format | data_archive_status | extraction_timestamp | official_identification_document_id | optical_character_recognition_engine_id |
|---|---|---|---|---|---|---|---|---|
| 100 | REC-2601 | MRZ recognition | 10782179 | PDF | archived | 2024-11-03T22:42:00 | 1 | 100 |
| 101 | REC-2604 | OCR text recognition | 7441146 | Word | exported | 2025-04-14T05:59:00 | 2 | 101 |
| 102 | REC-2607 | MRZ recognition | 3990189 | Excel | pending | 2022-09-25T12:16:00 | 3 | 102 |
| 103 | REC-2610 | OCR text recognition | IVC4ind | PDF | archived | 2023-02-09T19:33:00 | 4 | 103 |

The `extracted_personal_data_records` table captures the personal data extracted from identification documents. Its primary key is `extracted_personal_data_record_id` (e.g. `100`, `103`). The `record_identifier` column holds codes such as `REC-2601`. The `extraction_method` column records whether the extraction used `MRZ recognition` or `OCR text recognition`. The `source_language_code` column stores language identifiers (e.g. `10782179`, `IVC4ind`), and `output_format` specifies the output type — `PDF`, `Word`, or `Excel`. The `data_archive_status` column tracks the lifecycle state as `archived`, `exported`, or `pending`. The `extraction_timestamp` column mirrors the document's extraction time. Two foreign keys link each record to its source document (`official_identification_document_id`) and to the OCR engine that performed the extraction (`optical_character_recognition_engine_id`).

**Table `optical_character_recognition_engines`**

| id | engine_version | supported_language_count | recognition_accuracy | processing_speed | award_status | official_identification_document_id | extracted_personal_data_record_id |
|---|---|---|---|---|---|---|---|
| 100 | extended-engine-33 | 14 | 7.45 | 1.09 | false | 1 | 100 |
| 101 | integrated-engine-34 | 1 | 9.90 | 0.233071618973332 | true | 2 | 101 |
| 102 | seasonal-engine-35 | 3 | 12.35 | 0.99 | false | 3 | 102 |
| 103 | regional-engine-36 | 3 | 14.80 | 0.59 | true | 4 | 103 |

The `optical_character_recognition_engines` table models the OCR software engines used for text extraction. Its surrogate primary key `id` takes values `100` through `103`. The `engine_version` column holds version identifiers such as `extended-engine-33` and `regional-engine-36`. Numeric attributes include `supported_language_count` (e.g. `14`, `1`), `recognition_accuracy` (e.g. `7.45`, `14.80`), and `processing_speed` (e.g. `1.09`, `0.233071618973332`). The `award_status` column is a boolean flag (e.g. `false`, `true`). Two foreign keys — `official_identification_document_id` and `extracted_personal_data_record_id` — link each OCR engine to the document it processed and the resulting data record. Like the scanner–software relationship, this creates a bidirectional FK pattern between `optical_character_recognition_engines` and `official_identification_documents`.

## The Junction Table

**Table `packages_documents`**

| security_software_package_id | official_identification_document_id |
|---|---|
| 1000 | 1 |
| 1000 | 2 |
| 1001 | 2 |
| 1001 | 3 |
| 1002 | 3 |
| 1002 | 4 |
| 1003 | 4 |
| 1003 | 1 |

The `packages_documents` table is a pure junction (association) table that resolves a many-to-many relationship between `security_software_packages` and `official_identification_documents`. It contains two columns, `security_software_package_id` and `official_identification_document_id`, each serving as a foreign key referencing the respective base table's primary key. The data shows that each software package is associated with exactly two documents, and each document is associated with exactly two packages — a symmetric 2-to-2 mapping. For example, package `1000` is linked to documents `1` and `2`, while document `1` is linked to packages `1000` and `1003`. This table does not carry any attributes of its own; it exists solely to represent the relationship.

## Materialized Views

The twelve views materialize the normalized schema into domain-meaningful join results. Each view answers a specific question by joining two or more base tables and presenting the combined columns as a single virtual table.

### Views from the Security Software Package Perspective

**View `v_security_software_package_hardware_scanner_device`**

```sql
CREATE VIEW v_security_software_package_hardware_scanner_device AS
SELECT a.id, a.software_identifier, a.product_name, a.retail_price, b.id AS device_id, b.device_model_name AS device_device_model_name, b.camera_resolution_megapixels AS device_camera_resolution_megapixels
FROM security_software_packages a JOIN hardware_scanner_devices b ON a.hardware_scanner_device_id = b.id;
```

| id | software_identifier | product_name | retail_price | device_id | device_device_model_name | device_camera_resolution_megapixels |
|---|---|---|---|---|---|---|
| 1000 | SOF-2031 | Primary Review A | 29.99 | 1000 | Baseline Protocol D | 26 |
| 1001 | SOF-2038 | Composite Initiative | 27.02 | 1001 | Distributed Programme | 31 |
| 1002 | SOF-2045 | Compact Model | 11.11 | 1002 | Adaptive Standard | 36 |
| 1003 | SOF-2052 | Legacy Cluster D | 35.45 | 1003 | Primary Framework A | 41 |

This view joins `security_software_packages` with `hardware_scanner_devices` on the shared FK columns, answering the question: "Which hardware scanner device is associated with each security software package?" A row such as the one for package `1000` (`Primary Review A`) reveals that it is linked to scanner device `1000` (`Baseline Protocol D`), which has a `26` megapixel camera and costs `29.99`. The view presents columns from both tables side by side, allowing analysts to evaluate software–hardware compatibility at a glance.

**View `v_security_software_package_optical_character_recognition_engine`**

```sql
CREATE VIEW v_security_software_package_optical_character_recognition_engine AS
SELECT a.id, a.software_identifier, a.product_name, a.retail_price, b.id AS engine_id, b.engine_version AS engine_engine_version, b.supported_language_count AS engine_supported_language_count
FROM security_software_packages a JOIN optical_character_recognition_engines b ON a.optical_character_recognition_engine_id = b.id;
```

| id | software_identifier | product_name | retail_price | engine_id | engine_engine_version | engine_supported_language_count |
|---|---|---|---|---|---|---|
| 1000 | SOF-2031 | Primary Review A | 29.99 | 100 | extended-engine-33 | 14 |
| 1001 | SOF-2038 | Composite Initiative | 27.02 | 101 | integrated-engine-34 | 1 |
| 1002 | SOF-2045 | Compact Model | 11.11 | 102 | seasonal-engine-35 | 3 |
| 1003 | SOF-2052 | Legacy Cluster D | 35.45 | 103 | regional-engine-36 | 3 |

This view joins `security_software_packages` with `optical_character_recognition_engines`, answering: "Which OCR engine is associated with each security software package?" For package `1000` (`Primary Review A`), the view shows that it is linked to OCR engine `100` (`extended-engine-33`), which supports `14` languages, achieves a recognition accuracy of `7.45`, and processes at a speed of `1.09`. The `award_status` column indicates whether the engine has received an award (`false` for engine `100`).

**View `v_security_software_package_official_identification_document_detail`**

```sql
CREATE VIEW v_security_software_package_official_identification_document_detail AS
SELECT a.id, a.software_identifier, a.product_name, b.official_identification_document_id AS document_official_identification_document_id, b.document_type AS document_document_type, b.issuing_country_code AS document_issuing_country_code
FROM security_software_packages a
  JOIN packages_documents j ON j.security_software_package_id = a.id
  JOIN official_identification_documents b ON b.official_identification_document_id = j.official_identification_document_id;
```

| id | software_identifier | product_name | document_official_identification_document_id | document_document_type | document_issuing_country_code |
|---|---|---|---|---|---|
| 1000 | SOF-2031 | Primary Review A | 1 | ID card | 89511 |
| 1000 | SOF-2031 | Primary Review A | 2 | passport | 1996928 |
| 1001 | SOF-2038 | Composite Initiative | 2 | passport | 1996928 |
| 1001 | SOF-2038 | Composite Initiative | 3 | ID card | 6564382 |
| 1002 | SOF-2045 | Compact Model | 3 | ID card | 6564382 |
| 1002 | SOF-2045 | Compact Model | 4 | passport | lu_tax_code_template_b_VB-IC-0 |
| 1003 | SOF-2052 | Legacy Cluster D | 4 | passport | lu_tax_code_template_b_VB-IC-0 |
| 1003 | SOF-2052 | Legacy Cluster D | 1 | ID card | 89511 |

This view joins `security_software_packages` with `official_identification_documents`, answering: "Which official identification documents are associated with each security software package?" Because the relationship is many-to-many (mediated by `packages_documents`), the join produces multiple rows per package. Package `1000` (`Primary Review A`) is linked to document `1` (`ID card`, `DOC-2409`, issued under country code `89511`) and document `2` (`passport`, `DOC-2410`). The view presents the document's `document_type`, `m_r_z_recognition_status`, and `extraction_timestamp` alongside the software package's attributes, enabling analysts to assess which documents each software product can process.

### Views from the Hardware Scanner Device Perspective

**View `v_hardware_scanner_device_security_software_package`**

```sql
CREATE VIEW v_hardware_scanner_device_security_software_package AS
SELECT a.id, a.device_model_name, a.camera_resolution_megapixels, a.maximum_scanning_size, b.id AS package_id, b.software_identifier AS package_software_identifier, b.product_name AS package_product_name
FROM hardware_scanner_devices a JOIN security_software_packages b ON a.security_software_package_id = b.id;
```

| id | device_model_name | camera_resolution_megapixels | maximum_scanning_size | package_id | package_software_identifier | package_product_name |
|---|---|---|---|---|---|---|
| 1000 | Baseline Protocol D | 26 | seasonal-maximum-65 | 1000 | SOF-2031 | Primary Review A |
| 1001 | Distributed Programme | 31 | regional-maximum-66 | 1001 | SOF-2038 | Composite Initiative |
| 1002 | Adaptive Standard | 36 | legacy-maximum-67 | 1002 | SOF-2045 | Compact Model |
| 1003 | Primary Framework A | 41 | compact-maximum-68 | 1003 | SOF-2052 | Legacy Cluster D |

This view is the inverse of `v_security_software_package_hardware_scanner_device`: it joins `hardware_scanner_devices` with `security_software_packages`, answering: "Which security software package is associated with each hardware scanner device?" For scanner device `1000` (`Baseline Protocol D`), the view shows it is linked to software package `1000` (`Primary Review A`) with a `retail_price` of `29.99` and `compatibility_status` of `compatible`. The view presents the scanner's `device_model_name`, `camera_resolution_megapixels`, and `has_barcode_scanner` alongside the software package's `product_name` and `supported_operating_system`.

**View `v_hardware_scanner_device_official_identification_document`**

```sql
CREATE VIEW v_hardware_scanner_device_official_identification_document AS
SELECT a.id, a.device_model_name, a.camera_resolution_megapixels, a.maximum_scanning_size, b.official_identification_document_id AS document_official_identification_document_id, b.document_type AS document_document_type, b.issuing_country_code AS document_issuing_country_code
FROM hardware_scanner_devices a JOIN official_identification_documents b ON a.official_identification_document_id = b.official_identification_document_id;
```

| id | device_model_name | camera_resolution_megapixels | maximum_scanning_size | document_official_identification_document_id | document_document_type | document_issuing_country_code |
|---|---|---|---|---|---|---|
| 1000 | Baseline Protocol D | 26 | seasonal-maximum-65 | 1 | ID card | 89511 |
| 1001 | Distributed Programme | 31 | regional-maximum-66 | 2 | passport | 1996928 |
| 1002 | Adaptive Standard | 36 | legacy-maximum-67 | 3 | ID card | 6564382 |
| 1003 | Primary Framework A | 41 | compact-maximum-68 | 4 | passport | lu_tax_code_template_b_VB-IC-0 |

This view joins `hardware_scanner_devices` with `official_identification_documents`, answering: "Which official identification documents were scanned by each hardware scanner device?" For scanner device `1000` (`Baseline Protocol D`), the view shows it scanned document `1` (`ID card`, `DOC-2409`, with MRZ status `recognized`). The view presents the document's `document_type`, `issuing_country_code`, and `m_r_z_line1` alongside the scanner's `device_model_name` and `camera_resolution_megapixels`, enabling analysts to evaluate scanner performance across document types.

### Views from the Official Identification Document Perspective

**View `v_official_identification_document_extracted_personal_data_record`**

```sql
CREATE VIEW v_official_identification_document_extracted_personal_data_record AS
SELECT a.official_identification_document_id, a.document_type, a.issuing_country_code, a.document_number, b.extracted_personal_data_record_id AS record_extracted_personal_data_record_id, b.record_identifier AS record_record_identifier, b.extraction_method AS record_extraction_method
FROM official_identification_documents a JOIN extracted_personal_data_records b ON a.extracted_personal_data_record_id = b.extracted_personal_data_record_id;
```

| official_identification_document_id | document_type | issuing_country_code | document_number | record_extracted_personal_data_record_id | record_record_identifier | record_extraction_method |
|---|---|---|---|---|---|---|
| 1 | ID card | 89511 | DOC-2409 | 100 | REC-2601 | MRZ recognition |
| 2 | passport | 1996928 | DOC-2410 | 101 | REC-2604 | OCR text recognition |
| 3 | ID card | 6564382 | DOC-2411 | 102 | REC-2607 | MRZ recognition |
| 4 | passport | lu_tax_code_template_b_VB-IC-0 | DOC-2412 | 103 | REC-2610 | OCR text recognition |

This view joins `official_identification_documents` with `extracted_personal_data_records`, answering: "Which extracted personal data record corresponds to each official identification document?" For document `1` (`ID card`, `DOC-2409`), the view shows it produced personal data record `100` (`REC-2601`), extracted via `MRZ recognition` into `PDF` format with `archived` status. The view presents the record's `extraction_method`, `source_language_code`, and `data_archive_status` alongside the document's `document_type` and `m_r_z_recognition_status`.

**View `v_official_identification_document_hardware_scanner_device`**

```sql
CREATE VIEW v_official_identification_document_hardware_scanner_device AS
SELECT a.official_identification_document_id, a.document_type, a.issuing_country_code, a.document_number, b.id AS device_id, b.device_model_name AS device_device_model_name, b.camera_resolution_megapixels AS device_camera_resolution_megapixels
FROM official_identification_documents a JOIN hardware_scanner_devices b ON a.hardware_scanner_device_id = b.id;
```

| official_identification_document_id | document_type | issuing_country_code | document_number | device_id | device_device_model_name | device_camera_resolution_megapixels |
|---|---|---|---|---|---|---|
| 1 | ID card | 89511 | DOC-2409 | 1000 | Baseline Protocol D | 26 |
| 2 | passport | 1996928 | DOC-2410 | 1001 | Distributed Programme | 31 |
| 3 | ID card | 6564382 | DOC-2411 | 1002 | Adaptive Standard | 36 |
| 4 | passport | lu_tax_code_template_b_VB-IC-0 | DOC-2412 | 1003 | Primary Framework A | 41 |

This view joins `official_identification_documents` with `hardware_scanner_devices`, answering: "Which hardware scanner device was used to scan each official identification document?" For document `1` (`ID card`, `DOC-2409`), the view shows it was scanned by device `1000` (`Baseline Protocol D`), a `26` megapixel scanner with `adaptive-power-77` power source. The view presents the scanner's `device_model_name`, `interface_type`, and `has_external_button` alongside the document's `document_number` and `extraction_timestamp`.

### Views from the Extracted Personal Data Record Perspective

**View `v_extracted_personal_data_record_official_identification_document`**

```sql
CREATE VIEW v_extracted_personal_data_record_official_identification_document AS
SELECT a.extracted_personal_data_record_id, a.record_identifier, a.extraction_method, a.source_language_code, b.official_identification_document_id AS document_official_identification_document_id, b.document_type AS document_document_type, b.issuing_country_code AS document_issuing_country_code
FROM extracted_personal_data_records a JOIN official_identification_documents b ON a.official_identification_document_id = b.official_identification_document_id;
```

| extracted_personal_data_record_id | record_identifier | extraction_method | source_language_code | document_official_identification_document_id | document_document_type | document_issuing_country_code |
|---|---|---|---|---|---|---|
| 100 | REC-2601 | MRZ recognition | 10782179 | 1 | ID card | 89511 |
| 101 | REC-2604 | OCR text recognition | 7441146 | 2 | passport | 1996928 |
| 102 | REC-2607 | MRZ recognition | 3990189 | 3 | ID card | 6564382 |
| 103 | REC-2610 | OCR text recognition | IVC4ind | 4 | passport | lu_tax_code_template_b_VB-IC-0 |

This view is the inverse of `v_official_identification_document_extracted_personal_data_record`: it joins `extracted_personal_data_records` with `official_identification_documents`, answering: "Which official identification document produced each extracted personal data record?" For record `100` (`REC-2601`), the view shows it was extracted from document `1` (`ID card`, `DOC-2409`, issued under country code `89511`). The view presents the document's `document_type`, `m_r_z_line1`, and `m_r_z_recognition_status` alongside the record's `extraction_method` and `output_format`.

**View `v_extracted_personal_data_record_optical_character_recognition_engine`**

```sql
CREATE VIEW v_extracted_personal_data_record_optical_character_recognition_engine AS
SELECT a.extracted_personal_data_record_id, a.record_identifier, a.extraction_method, a.source_language_code, b.id AS engine_id, b.engine_version AS engine_engine_version, b.supported_language_count AS engine_supported_language_count
FROM extracted_personal_data_records a JOIN optical_character_recognition_engines b ON a.optical_character_recognition_engine_id = b.id;
```

| extracted_personal_data_record_id | record_identifier | extraction_method | source_language_code | engine_id | engine_engine_version | engine_supported_language_count |
|---|---|---|---|---|---|---|
| 100 | REC-2601 | MRZ recognition | 10782179 | 100 | extended-engine-33 | 14 |
| 101 | REC-2604 | OCR text recognition | 7441146 | 101 | integrated-engine-34 | 1 |
| 102 | REC-2607 | MRZ recognition | 3990189 | 102 | seasonal-engine-35 | 3 |
| 103 | REC-2610 | OCR text recognition | IVC4ind | 103 | regional-engine-36 | 3 |

This view joins `extracted_personal_data_records` with `optical_character_recognition_engines`, answering: "Which OCR engine was used to extract each personal data record?" For record `100` (`REC-2601`), the view shows it was extracted by engine `100` (`extended-engine-33`), which has a recognition accuracy of `7.45` and a processing speed of `1.09`. The view presents the engine's `engine_version`, `supported_language_count`, and `award_status` alongside the record's `extraction_method` and `data_archive_status`.

### Views from the OCR Engine Perspective

**View `v_optical_character_recognition_engine_official_identification_document`**

```sql
CREATE VIEW v_optical_character_recognition_engine_official_identification_document AS
SELECT a.id, a.engine_version, a.supported_language_count, a.recognition_accuracy, b.official_identification_document_id AS document_official_identification_document_id, b.document_type AS document_document_type, b.issuing_country_code AS document_issuing_country_code
FROM optical_character_recognition_engines a JOIN official_identification_documents b ON a.official_identification_document_id = b.official_identification_document_id;
```

| id | engine_version | supported_language_count | recognition_accuracy | document_official_identification_document_id | document_document_type | document_issuing_country_code |
|---|---|---|---|---|---|---|
| 100 | extended-engine-33 | 14 | 7.45 | 1 | ID card | 89511 |
| 101 | integrated-engine-34 | 1 | 9.90 | 2 | passport | 1996928 |
| 102 | seasonal-engine-35 | 3 | 12.35 | 3 | ID card | 6564382 |
| 103 | regional-engine-36 | 3 | 14.80 | 4 | passport | lu_tax_code_template_b_VB-IC-0 |

This view joins `optical_character_recognition_engines` with `official_identification_documents`, answering: "Which official identification document was processed by each OCR engine?" For engine `100` (`extended-engine-33`), the view shows it processed document `1` (`ID card`, `DOC-2409`, with MRZ status `recognized`). The view presents the document's `document_type`, `issuing_country_code`, and `m_r_z_line2` alongside the engine's `recognition_accuracy` and `processing_speed`.

**View `v_optical_character_recognition_engine_extracted_personal_data_record`**

```sql
CREATE VIEW v_optical_character_recognition_engine_extracted_personal_data_record AS
SELECT a.id, a.engine_version, a.supported_language_count, a.recognition_accuracy, b.extracted_personal_data_record_id AS record_extracted_personal_data_record_id, b.record_identifier AS record_record_identifier, b.extraction_method AS record_extraction_method
FROM optical_character_recognition_engines a JOIN extracted_personal_data_records b ON a.extracted_personal_data_record_id = b.extracted_personal_data_record_id;
```

| id | engine_version | supported_language_count | recognition_accuracy | record_extracted_personal_data_record_id | record_record_identifier | record_extraction_method |
|---|---|---|---|---|---|---|
| 100 | extended-engine-33 | 14 | 7.45 | 100 | REC-2601 | MRZ recognition |
| 101 | integrated-engine-34 | 1 | 9.90 | 101 | REC-2604 | OCR text recognition |
| 102 | seasonal-engine-35 | 3 | 12.35 | 102 | REC-2607 | MRZ recognition |
| 103 | regional-engine-36 | 3 | 14.80 | 103 | REC-2610 | OCR text recognition |

This view joins `optical_character_recognition_engines` with `extracted_personal_data_records`, answering: "Which extracted personal data record was produced by each OCR engine?" For engine `100` (`extended-engine-33`), the view shows it produced record `100` (`REC-2601`), extracted via `MRZ recognition` into `PDF` format. The view presents the record's `record_identifier`, `source_language_code`, and `extraction_timestamp` alongside the engine's `engine_version` and `award_status`.

## Closing Synthesis

The schema models the identity-processing pipeline as a set of five entity tables connected by foreign keys and a single many-to-many junction table. The base tables capture the core entities — software packages, scanner devices, identification documents, extracted data records, and OCR engines — with their attributes materialized as typed columns. Foreign keys enforce referential integrity and cardinality constraints: each software package references one scanner and one OCR engine; each document references one scanner and one extracted record; each extracted record references one document and one OCR engine. The `packages_documents` junction table resolves the many-to-many relationship between software packages and identification documents. The twelve views materialize the normalized schema into domain-meaningful join results, each answering a specific question by presenting columns from two related tables side by side. Together, the base tables and views provide a complete relational representation of the identity-processing pipeline, from physical document capture through OCR extraction to software packaging and distribution.