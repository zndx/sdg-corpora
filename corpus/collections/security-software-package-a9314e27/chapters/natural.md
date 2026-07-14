## Identity Document Processing Pipelines

Modern identity verification workflows depend on tightly coupled subsystems: scanning hardware captures physical documents, optical character recognition engines decode machine-readable zones and printed fields, security software packages manage access and processing policies, and extracted data records preserve the results for downstream use. This chapter documents the architecture of such a pipeline, tracing how a physical identification document moves through capture, recognition, extraction, and archival. The data model is organized around five core entity tables and a junction table that records which software packages are authorized to process which documents. Joined views then expose the operational relationships between these entities, enabling operators to audit processing chains, verify compatibility, and diagnose failures.

## Core Entity Tables

The pipeline begins with the software layer. Security software packages define the policies and capabilities that govern document processing.

**Table `security_software_packages`**

| id | software_identifier | product_name | retail_price | supported_operating_system | currency_code | compatibility_status | hardware_scanner_device_id | optical_character_recognition_engine_id |
|---|---|---|---|---|---|---|---|---|
| 1000 | SOF-2031 | Primary Review A | 29.99 | distributed-supporte-36 | 1235 | compatible | 1000 | 100 |
| 1001 | SOF-2038 | Composite Initiative | 27.02 | baseline-supporte-37 | 10782179 | incompatible | 1001 | 101 |
| 1002 | SOF-2045 | Compact Model | 11.11 | pilot-supporte-38 | 9125631 | unknown | 1002 | 102 |
| 1003 | SOF-2052 | Legacy Cluster D | 35.45 | extended-supporte-39 | 4e386610-8fcc-11eb-924d-9cd76263cbd0 | compatible | 1003 | 103 |

Each package carries a unique identifier such as `SOF-2031` for *Primary Review A*, which retails at $29.99 and runs on a `distributed-supporte-36` operating environment. The `compatibility_status` column tracks whether a package is `compatible`, `incompatible`, or `unknown` with the surrounding infrastructure. Package `SOF-2038` (*Composite Initiative*) is marked `incompatible`, while `SOF-2052` (*Compact Model*) carries an `unknown` status. Each package is also linked to a specific hardware scanner device and OCR engine through foreign keys, establishing the processing chain at the software level.

The physical capture layer is represented by hardware scanner devices.

**Table `hardware_scanner_devices`**

| id | device_model_name | camera_resolution_megapixels | maximum_scanning_size | power_source_type | interface_type | retail_price | currency_code | has_external_button | has_barcode_scanner | security_software_package_id | official_identification_document_id |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 1000 | Baseline Protocol D | 26 | seasonal-maximum-65 | adaptive-power-77 | seasonal-interfac-77 | 29.99 | 1235 | false | 884353 | 1000 | 1 |
| 1001 | Distributed Programme | 31 | regional-maximum-66 | distributed-power-78 | regional-interfac-78 | 27.02 | 10782179 | true | 2986243 | 1001 | 2 |
| 1002 | Adaptive Standard | 36 | legacy-maximum-67 | baseline-power-79 | legacy-interfac-79 | 11.11 | 9125631 | false | 1889774 | 1002 | 3 |
| 1003 | Primary Framework A | 41 | compact-maximum-68 | pilot-power-80 | compact-interfac-80 | 35.45 | 4e386610-8fcc-11eb-924d-9cd76263cbd0 | true | 99654 | 1003 | 4 |

A device such as `Baseline Protocol D` (id `1000`) provides a `26` megapixel camera resolution and supports a `seasonal-maximum-65` scanning size. Power is supplied via `adaptive-power-77`, and the interface type is `seasonal-interfac-77`. The device has a retail price of $29.99, does not include an external button, but does include a barcode scanner (value `884353`). The `has_external_button` flag is `false` for `Baseline Protocol D` and `Adaptive Standard`, but `true` for `Distributed Programme` and `Primary Framework A`. Barcode scanner presence varies widely, with values ranging from `884353` down to `99654`. Each scanner is associated with a security software package and an official identification document, tying the physical capture step to both the software policy and the document being processed.

Official identification documents represent the physical artifacts entering the pipeline.

**Table `official_identification_documents`**

| official_identification_document_id | document_type | issuing_country_code | document_number | m_r_z_line1 | m_r_z_line2 | m_r_z_recognition_status | extraction_timestamp | extracted_personal_data_record_id | hardware_scanner_device_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | ID card | 89511 | DOC-2409 | primary-m-40 | compact-m-56 | recognized | 2024-11-03T22:42:00 | 100 | 1000 |
| 2 | passport | 1996928 | DOC-2410 | adaptive-m-41 | composite-m-57 | failed | 2025-04-14T05:59:00 | 101 | 1001 |
| 3 | ID card | 6564382 | DOC-2411 | distributed-m-42 | primary-m-58 | partial | 2022-09-25T12:16:00 | 102 | 1002 |
| 4 | passport | lu_tax_code_template_b_VB-IC-0 | DOC-2412 | baseline-m-43 | adaptive-m-59 | recognized | 2023-02-09T19:33:00 | 103 | 1003 |

Document `DOC-2409` is an `ID card` issued under country code `89511`, with MRZ line 1 reading `primary-m-40` and MRZ line 2 reading `compact-m-56`. Its `m_r_z_recognition_status` is `recognized`, and the extraction occurred at `2024-11-03T22:42:00`. Document `DOC-2410`, a `passport` under country code `1996928`, has a `failed` MRZ recognition status, indicating a processing error. Document `DOC-2411` shows a `partial` recognition status, suggesting incomplete decoding. The issuing country codes vary from numeric codes like `89511` to structured templates such as `lu_tax_code_template_b_VB-IC-0`. Each document is linked to an extracted personal data record and a hardware scanner device, completing the capture-to-extraction chain.

Extracted personal data records store the results of the recognition process.

**Table `extracted_personal_data_records`**

| extracted_personal_data_record_id | record_identifier | extraction_method | source_language_code | output_format | data_archive_status | extraction_timestamp | official_identification_document_id | optical_character_recognition_engine_id |
|---|---|---|---|---|---|---|---|---|
| 100 | REC-2601 | MRZ recognition | 10782179 | PDF | archived | 2024-11-03T22:42:00 | 1 | 100 |
| 101 | REC-2604 | OCR text recognition | 7441146 | Word | exported | 2025-04-14T05:59:00 | 2 | 101 |
| 102 | REC-2607 | MRZ recognition | 3990189 | Excel | pending | 2022-09-25T12:16:00 | 3 | 102 |
| 103 | REC-2610 | OCR text recognition | IVC4ind | PDF | archived | 2023-02-09T19:33:00 | 4 | 103 |

Record `REC-2601` was obtained via `MRZ recognition` from source language code `10782179`, output in `PDF` format, and is currently `archived`. Record `REC-2604` used `OCR text recognition`, produced a `Word` document, and is `exported`. Record `REC-2607` is in `pending` status, still awaiting archival. Record `REC-2610` was extracted using `OCR text recognition` from source language `IVC4ind` and is `archived`. The `data_archive_status` column tracks the lifecycle stage of each record: `archived`, `exported`, or `pending`. Each record references its source official identification document and the OCR engine that performed the extraction.

Optical character recognition engines provide the decoding capability.

**Table `optical_character_recognition_engines`**

| id | engine_version | supported_language_count | recognition_accuracy | processing_speed | award_status | official_identification_document_id | extracted_personal_data_record_id |
|---|---|---|---|---|---|---|---|
| 100 | extended-engine-33 | 14 | 7.45 | 1.09 | false | 1 | 100 |
| 101 | integrated-engine-34 | 1 | 9.90 | 0.233071618973332 | true | 2 | 101 |
| 102 | seasonal-engine-35 | 3 | 12.35 | 0.99 | false | 3 | 102 |
| 103 | regional-engine-36 | 3 | 14.80 | 0.59 | true | 4 | 103 |

Engine `extended-engine-33` (id `100`) supports `14` languages, achieves a `recognition_accuracy` of `7.45`, and processes at a speed of `1.09`. It does not hold an award (`award_status: false`). Engine `integrated-engine-34` (id `101`) supports only `1` language but achieves a higher accuracy of `9.90` with a faster processing speed of `0.233`. It holds an award. Engine `seasonal-engine-35` (id `102`) supports `3` languages with an accuracy of `12.35` and speed `0.99`. Engine `regional-engine-36` (id `103`) also supports `3` languages, achieves `14.80` accuracy, and processes at `0.59` speed, with award status `true`. The accuracy values range from `7.45` to `14.80`, and processing speeds vary from `0.233` to `1.09`, reflecting trade-offs between precision and throughput.

The junction table `packages_documents` records which security software packages are authorized to process which official identification documents.

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

Package `1000` is authorized for documents `1` and `2`. Package `1001` covers documents `2` and `3`. Package `1002` handles documents `3` and `4`. Package `1003` processes documents `4` and `1`. This many-to-many relationship allows a single document to be processed by multiple software packages and a single package to handle multiple documents, providing flexibility in the processing pipeline.

## Joined Views and Operational Relationships

The base tables alone do not reveal the full processing chain. Joined views combine entities to answer specific operational questions about the pipeline.

The view `v_security_software_package_hardware_scanner_device` answers which hardware scanner each security software package is paired with.

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

In this view, software package `SOF-2031` (*Primary Review A*) is joined with hardware scanner `Baseline Protocol D` (id `1000`), confirming that the compatible package is paired with a device that has a 26-megapixel camera. Package `SOF-2038` (*Composite Initiative*), marked `incompatible`, is paired with `Distributed Programme` (id `1001`), a 31-megapixel device with an external button and barcode scanner. The incompatibility status of the software package may correlate with the complexity of the hardware it is paired with.

The view `v_security_software_package_optical_character_recognition_engine` reveals the OCR engine assigned to each software package.

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

Package `SOF-2031` is linked to engine `extended-engine-33`, which supports 14 languages but has the lowest accuracy at `7.45`. Package `SOF-2038` is linked to `integrated-engine-34`, a single-language engine with the highest accuracy at `9.90` and the fastest processing speed. The `incompatible` status of package `SOF-2038` may reflect the mismatch between its high-accuracy, low-language-count engine and the documents it is expected to process. Package `SOF-2052` is paired with `seasonal-engine-35`, while `SOF-2052` (*Compact Model*) with `unknown` compatibility is paired with `seasonal-engine-35`.

The view `v_security_software_package_official_identification_document_detail` connects software packages to the documents they process through the junction table.

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

Software package `1000` processes document `1` (`DOC-2409`, an ID card with `recognized` MRZ status) and document `2` (`DOC-2410`, a passport with `failed` MRZ status). This pairing is notable: the same package handles both a successfully recognized ID card and a failed passport, suggesting that the `incompatible` status of package `1001` (which also processes document `2`) may be the more relevant factor in the failure. Package `1003` processes document `4` and document `1`, demonstrating the many-to-many relationship in action.

The view `v_hardware_scanner_device_security_software_package` inverts the software-to-hardware relationship, showing which software package each scanner is associated with.

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

Scanner `Baseline Protocol D` (id `1000`) is associated with software package `1000` (*Primary Review A*), which is `compatible`. Scanner `Distributed Programme` (id `1001`) is associated with package `1001` (*Composite Initiative*), which is `incompatible`. Scanner `Adaptive Standard` (id `1002`) is paired with package `1002` (*Compact Model*), which has `unknown` compatibility. Scanner `Primary Framework A` (id `1003`) is paired with package `1003` (*Legacy Cluster D*), which is `compatible`. The correlation between hardware and software compatibility suggests that scanner selection is a factor in the overall compatibility assessment.

The view `v_hardware_scanner_device_official_identification_document` links each scanner to the document it captured.

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

Scanner `Baseline Protocol D` captured document `1` (`DOC-2409`, ID card, `recognized`). Scanner `Distributed Programme` captured document `2` (`DOC-2410`, passport, `failed`). Scanner `Adaptive Standard` captured document `3` (`DOC-2411`, ID card, `partial`). Scanner `Primary Framework A` captured document `4` (`DOC-2412`, passport, `recognized`). The `failed` status of document `2` is particularly notable: it was captured by a 31-megapixel scanner with barcode scanning capability, yet the MRZ recognition still failed. This suggests that the failure may lie in the OCR engine or software package rather than the capture hardware.

The view `v_official_identification_document_extracted_personal_data_record` connects each document to its extracted data record.

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

Document `1` produced record `REC-2601` via `MRZ recognition`, output as `PDF`, and the record is `archived`. Document `2` produced record `REC-2604` via `OCR text recognition`, output as `Word`, and the record is `exported`. Document `3` produced record `REC-2607` via `MRZ recognition`, output as `Excel`, and the record is `pending`. Document `4` produced record `REC-2610` via `OCR text recognition`, output as `PDF`, and the record is `archived`. The extraction method varies: `MRZ recognition` was used for documents `1` and `3`, while `OCR text recognition` was used for documents `2` and `4`. The output formats also vary, with `PDF` appearing twice, and `Word` and `Excel` each appearing once.

The view `v_official_identification_document_hardware_scanner_device` provides a document-centric view of the capture hardware.

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

Document `1` was captured by scanner `Baseline Protocol D` (26 megapixels, no external button, barcode scanner present). Document `2` was captured by `Distributed Programme` (31 megapixels, external button present, barcode scanner present). Document `3` was captured by `Adaptive Standard` (36 megapixels, no external button, barcode scanner present). Document `4` was captured by `Primary Framework A` (41 megapixels, external button present, barcode scanner present). The camera resolution increases from `26` to `41` megapixels across the four documents, yet the MRZ recognition status does not follow a simple improvement pattern: document `2` with the second-highest resolution still shows `failed` status.

The view `v_extracted_personal_data_record_official_identification_document` inverts the document-to-record relationship.

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

Record `REC-2601` corresponds to document `1` (`DOC-2409`, ID card, `recognized`). Record `REC-2604` corresponds to document `2` (`DOC-2410`, passport, `failed`). Record `REC-2607` corresponds to document `3` (`DOC-2411`, ID card, `partial`). Record `REC-2610` corresponds to document `4` (`DOC-2412`, passport, `recognized`). The record identifiers follow a sequential pattern (`REC-2601`, `REC-2604`, `REC-2607`, `REC-2610`), incrementing by three, which may indicate batch processing or reserved slots.

The view `v_extracted_personal_data_record_optical_character_recognition_engine` links each extracted record to the OCR engine that produced it.

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

Record `REC-2601` was produced by engine `extended-engine-33` (accuracy `7.45`, speed `1.09`, no award). Record `REC-2604` was produced by `integrated-engine-34` (accuracy `9.90`, speed `0.233`, award holder). Record `REC-2607` was produced by `seasonal-engine-35` (accuracy `12.35`, speed `0.99`, no award). Record `REC-2610` was produced by `regional-engine-36` (accuracy `14.80`, speed `0.59`, award holder). The engine with the highest accuracy (`14.80`) produced a `recognized` document, while the engine with the lowest accuracy (`7.45`) also produced a `recognized` document. This suggests that accuracy ratings alone do not determine recognition outcomes; the document type, MRZ condition, and extraction method all play roles.

The view `v_optical_character_recognition_engine_official_identification_document` connects each OCR engine to the document it processed.

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

Engine `extended-engine-33` processed document `1` (ID card, `recognized`). Engine `integrated-engine-34` processed document `2` (passport, `failed`). Engine `seasonal-engine-35` processed document `3` (ID card, `partial`). Engine `regional-engine-36` processed document `4` (passport, `recognized`). The `failed` result from the award-winning `integrated-engine-34` is a notable outlier. This engine has the highest accuracy rating (`9.90`) and the fastest processing speed (`0.233`), yet it failed to recognize the MRZ of document `2`. This may indicate that the passport format or the MRZ condition of document `2` was particularly challenging, or that the software package (`1001`, marked `incompatible`) introduced a processing error.

The view `v_optical_character_recognition_engine_extracted_personal_data_record` links each OCR engine to the data record it produced.

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

Engine `extended-engine-33` produced record `REC-2601` (`archived`, `PDF`). Engine `integrated-engine-34` produced record `REC-2604` (`exported`, `Word`). Engine `seasonal-engine-35` produced record `REC-2607` (`pending`, `Excel`). Engine `regional-engine-36` produced record `REC-2610` (`archived`, `PDF`). The output format distribution shows `PDF` as the most common format, used by both the highest-accuracy and lowest-accuracy engines. The `pending` status of record `REC-2607` is the only record not yet archived or exported, indicating an incomplete processing pipeline for that record.

## Synthesis

The identity document processing pipeline is a multi-stage system where hardware capture, OCR decoding, software policy, and data extraction are tightly interwoven. The base tables define the entities: security software packages with their compatibility statuses, hardware scanners with their specifications, official identification documents with their MRZ recognition outcomes, extracted personal data records with their archival states, and OCR engines with their accuracy and speed metrics. The junction table `packages_documents` enables flexible many-to-many relationships between software packages and documents. The joined views expose the operational chains, revealing that compatibility issues, recognition failures, and processing delays can be traced through the relationships between these entities. Operators can use these views to diagnose why a document was not recognized, which engine produced a given record, or whether a software package is properly paired with its scanner and OCR engine. The data, while fictional, illustrates the complexity of real-world identity verification systems and the importance of maintaining clear records across all stages of the processing pipeline.