## Ontology-Grounded Relational Modelling of a Document Lifecycle Pipeline

The domain under examination is a document lifecycle pipeline in which physical or digital artefacts are captured via scanning processes on mobile devices, decomposed into pages of varying content types, and subsequently exported through a variety of transport methods. The ontology behind this domain recognises four principal entity types—`ApplicationDocument`, `ApplicationPage`, `ScanningProcess`, and `MobileDevice`—alongside two auxiliary entity types, `ExportProcess` and `ExportMethod`. Each entity type materialises as a relational table whose columns correspond to the entity's attributes, and whose foreign keys encode the cardinality-bounded relationships between entities. Junction tables `documents_pages` and `processes_pages` resolve many-to-many associations that the ontology expresses as navigable links rather than direct foreign keys. The following sections walk through the schema layer by layer, showing how each table's columns, keys, and representative rows reflect the underlying conceptual model, and how the twelve materialised views reconstruct domain facts from the normalised base tables.

**Table `application_documents`**

| document_id | file_name | file_size_bytes | page_count | creation_date | format | scanning_process_id |
|---|---|---|---|---|---|---|
| IVC10I | Compact Standard | 32 | 6 | 2022-01-13T12:24:00 | legacy-format-25 | 1000 |
| 605943 | Legacy Framework | 38 | 7 | 2023-06-24T19:41:00 | compact-format-26 | 1001 |
| 10449525 | Regional Protocol A | 44 | 0 | 2024-11-08T02:58:00 | composite-format-27 | 1002 |
| 5f93a090-8fcd-11eb-924d-9cd76263cbd0 | Seasonal Programme | 50 | 15 | 2025-04-19T09:15:00 | primary-format-28 | 1003 |

The `application_documents` table is the anchor of the document-centric ontology. Its primary key, `document_id`, is a natural identifier that in this dataset takes both short alphanumeric codes such as `IVC10I` and UUIDs like `5f93a090-8fcd-11eb-924d-9cd76263cbd0`. The attribute `file_name` stores human-readable labels—`Compact Standard`, `Legacy Framework`, `Regional Protocol A`, `Seasonal Programme`—while `file_size_bytes` and `page_count` capture quantitative metadata about the artefact. The `creation_date` column timestamps the document's origin (e.g. `2022-01-13T12:24:00`), and `format` classifies the encoding scheme (`legacy-format-25`, `compact-format-26`, `composite-format-27`, `primary-format-28`). The foreign key `scanning_process_id` binds each document to exactly one scanning process, enforcing the ontology constraint that a document is produced by a single capture event. In the sample data, document `IVC10I` is linked to scanning process `1000`, while `5f93a090-8fcd-11eb-924d-9cd76263cbd0` is linked to process `1003`.

**Table `application_pages`**

| application_page_id | page_number | content_type | image_resolution | is_color | orientation | document_id | scanning_process_id |
|---|---|---|---|---|---|---|---|
| 1 | 48 | form | 14.95 | Indigo | portrait | IVC10I | 1000 |
| 2 | 59 | comment_sheet | 16.90 | Red | landscape | 605943 | 1001 |
| 3 | 70 | certificate | 18.85 | Auburn | portrait | 10449525 | 1002 |
| 4 | 81 | image | 20.80 | Strawberry Blond | landscape | 5f93a090-8fcd-11eb-924d-9cd76263cbd0 | 1003 |

Pages are modelled as a separate entity type because they carry attributes that are not shared by the document as a whole. The `application_pages` table's primary key is `application_page_id`, and its attributes—`page_number`, `content_type`, `image_resolution`, `is_color`, and `orientation`—describe the visual and semantic properties of each page. The `content_type` column distinguishes between `form`, `comment_sheet`, `certificate`, and `image`, while `is_color` stores colour descriptors such as `Indigo`, `Red`, `Auburn`, and `Strawberry Blond`. The `image_resolution` column holds floating-point values (e.g. `14.95`, `16.90`, `18.85`, `20.80`), and `orientation` is an enumerated attribute (`portrait` or `landscape`). Two foreign keys anchor the page to its parent document (`document_id`) and to the scanning process that produced it (`scanning_process_id`). This dual foreign-key design reflects the ontology's recognition that a page belongs to a document *and* is a product of a specific scanning process. Page `1` (page number `48`, content type `form`, resolution `14.95`, colour `Indigo`, orientation `portrait`) belongs to document `IVC10I` and was captured by process `1000`.

**Table `scanning_processes`**

| id | process_id | start_date | end_date | device_type | app_used | status | document_id | mobile_device_id | created_at |
|---|---|---|---|---|---|---|---|---|---|
| 1000 | template_ivacode_pagata_art15 | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | iPhone | Notes | pending | IVC10I | 1 | 2025-01-01 00:14:00 |
| 1001 | 27cebc1c-9bad-11eb-a8a2-19ed5c03f8d3 | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | Android | Genius Scan | in_progress | 605943 | 2 | 2025-02-06 03:14:00 |
| 1002 | 57e52fbc-8fcd-11eb-924d-9cd76263cbd0 | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | Scanner | Notes | complete | 10449525 | 3 | 2025-03-11 06:14:00 |
| 1003 | 1205-0002-XL | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | iPhone | Genius Scan | failed | 5f93a090-8fcd-11eb-924d-9cd76263cbd0 | 4 | 2025-04-16 09:14:00 |

The `scanning_processes` table captures the temporal and instrumental dimensions of document capture. Its primary key `id` is a surrogate integer (values `1000` through `1003`), while `process_id` carries a business-level identifier that may be a string such as `template_ivacode_pagata_art15` or a UUID. The `start_date` and `end_date` columns record the capture window; notably, in the sample data the end date precedes the start date (e.g. `2022-09-05T20:24:00` to `2022-09-01T08:00:00`), which may indicate a data-entry convention or a back-dated correction. The `device_type` column classifies the capture hardware (`iPhone`, `Android`, `Scanner`), and `app_used` records the software application (`Notes`, `Genius Scan`). The `status` column enumerates the lifecycle state (`pending`, `in_progress`, `complete`, `failed`), and `created_at` timestamps the record's insertion. Foreign keys `document_id` and `mobile_device_id` link the process to its output document and the hardware device used. Process `1000` used an `iPhone` running `Notes`, had status `pending`, and produced document `IVC10I` on device `1`.

**Table `mobile_devices`**

| id | device_id | manufacturer | model | os_version | camera_resolution | scanning_process_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|
| 1 | 3744015 | Standard Chartered | composite-model-81 | integrated-os-46 | 10.70 | 1000 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | 392495 | General Motors | primary-model-82 | seasonal-os-47 | 12.40 | 1001 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | 209205 | Column Name cannot be empty | adaptive-model-83 | regional-os-48 | 14.10 | 1002 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | 22106999 | Financial Information Service Co. Ltd. | distributed-model-84 | legacy-os-49 | 15.80 | 1003 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Mobile devices are modelled as a distinct entity because the same device may participate in multiple scanning processes over its lifetime. The `mobile_devices` table's primary key `id` is a surrogate integer, and `device_id` is a business identifier (e.g. `3744015`, `392495`, `209205`, `22106999`). The `manufacturer` column stores organisational names such as `Standard Chartered`, `General Motors`, `Column Name cannot be empty`, and `Financial Information Service Co. Ltd.`—all fictional. The `model` column holds model identifiers (`composite-model-81`, `primary-model-82`, `adaptive-model-83`, `distributed-model-84`), while `os_version` records the operating system (`integrated-os-46`, `seasonal-os-47`, `regional-os-48`, `legacy-os-49`). The `camera_resolution` column stores a floating-point value (e.g. `10.70`, `12.40`, `14.10`, `15.80`). The foreign key `scanning_process_id` creates a one-to-one link from device to process in this dataset, though the ontology allows a device to be reused. Timestamps `created_at` and `updated_at` track the device record's lifecycle. Device `1` (manufacturer `Standard Chartered`, model `composite-model-81`, OS `integrated-os-46`, camera resolution `10.70`) is linked to scanning process `1000`.

**Table `export_processes`**

| export_id | export_date | method | target_file_size_m_b | status | document_id | export_method_id |
|---|---|---|---|---|---|---|
| 4985161 | 2024-03-10T14:18:00 | AirDrop | 0.83 | pending | IVC10I | 1000 |
| 10238289 | 2025-08-21T21:35:00 | Email | 0.6000001 | complete | 605943 | 1001 |
| 8881 | 2022-01-05T04:52:00 | AirDrop | 0.331550802139037 | failed | 10449525 | 1002 |
| d6136806-8fc1-11eb-924d-9cd76263cbd0 | 2023-06-16T11:09:00 | Email | 0.38254625 | pending | 5f93a090-8fcd-11eb-924d-9cd76263cbd0 | 1003 |

Export processes represent the downstream phase of the document lifecycle. The `export_processes` table's primary key `export_id` uses the same mixed identifier style as `application_documents` (short codes and UUIDs). The `export_date` column timestamps the export event, and `method` stores the transport mechanism (`AirDrop`, `Email`). The `target_file_size_m_b` column holds a floating-point size estimate (e.g. `0.83`, `0.6000001`, `0.331550802139037`, `0.38254625`), and `status` records the outcome (`pending`, `complete`, `failed`). Foreign keys `document_id` and `export_method_id` link the export to its source document and to the detailed export method configuration. Export `4985161` used `AirDrop` on `2024-03-10T14:18:00`, targeted `0.83` MB, had status `pending`, and exported document `IVC10I` via method `1000`.

**Table `export_methods`**

| id | method_id | method_name | supports_compression | max_file_size_g_b | export_process_export_id |
|---|---|---|---|---|---|
| 1000 | 209228 | AirDrop | false | 1.05 | 4985161 |
| 1001 | 7441161 | Email | true | 0.5465680900000001 | 10238289 |
| 1002 | 89447 | AirDrop | false | 2.272937506868936 | 8881 |
| 1003 | 4180941 | Email | true | 0.1232532 | d6136806-8fc1-11eb-924d-9cd76263cbd0 |

The `export_methods` table provides a configuration-level view of export transport mechanisms. Its primary key `id` is a surrogate integer, and `method_id` is a business identifier (e.g. `209228`, `7441161`, `89447`, `4180941`). The `method_name` column repeats the transport name (`AirDrop`, `Email`), while `supports_compression` is a boolean flag (`false` for AirDrop, `true` for Email). The `max_file_size_g_b` column stores the maximum supported file size in gigabytes (e.g. `1.05`, `0.5465680900000001`, `2.272937506868936`, `0.1232532`). The foreign key `export_process_export_id` links the method configuration to a specific export process, creating a one-to-one relationship in this dataset. Method `1000` (method name `AirDrop`, no compression support, max size `1.05` GB) is linked to export process `4985161`.

**Table `documents_pages`**

| document_id | application_page_id |
|---|---|
| IVC10I | 1 |
| IVC10I | 2 |
| 605943 | 2 |
| 605943 | 3 |
| 10449525 | 3 |
| 10449525 | 4 |
| 5f93a090-8fcd-11eb-924d-9cd76263cbd0 | 4 |
| 5f93a090-8fcd-11eb-924d-9cd76263cbd0 | 1 |

The `documents_pages` table is a junction table that resolves the many-to-many relationship between `application_documents` and `application_pages`. In a strict ontology, a page belongs to exactly one document, but the junction table allows for scenarios where pages are shared across documents (e.g. template pages or reusable content blocks). The table's composite key consists of `document_id` and `application_page_id`, both of which are foreign keys referencing their respective parent tables. This design preserves referential integrity while allowing flexible page-to-document mappings.

**Table `processes_pages`**

| scanning_process_id | application_page_id |
|---|---|
| 1000 | 1 |
| 1000 | 2 |
| 1001 | 2 |
| 1001 | 3 |
| 1002 | 3 |
| 1002 | 4 |
| 1003 | 4 |
| 1003 | 1 |

Similarly, `processes_pages` is a junction table that resolves the many-to-many relationship between `scanning_processes` and `application_pages`. While the `application_pages` table already carries a `scanning_process_id` foreign key, the junction table provides an additional layer of flexibility, allowing a page to be associated with multiple scanning processes (e.g. re-scanning or versioning scenarios). The composite key consists of `scanning_process_id` and `application_page_id`.

With the base tables established, the twelve views materialise domain facts by joining these tables. Each view answers a specific analytical question by reconstructing a denormalised fact from the normalised schema.

**View `vw_application_document_application_page_detail`**

```sql
CREATE VIEW vw_application_document_application_page_detail AS
SELECT a.document_id, a.file_name, a.file_size_bytes, b.application_page_id AS page_application_page_id, b.page_number AS page_page_number, b.content_type AS page_content_type
FROM application_documents a
  JOIN documents_pages j ON j.document_id = a.document_id
  JOIN application_pages b ON b.application_page_id = j.application_page_id;
```

| document_id | file_name | file_size_bytes | page_application_page_id | page_page_number | page_content_type |
|---|---|---|---|---|---|
| IVC10I | Compact Standard | 32 | 1 | 48 | form |
| IVC10I | Compact Standard | 32 | 2 | 59 | comment_sheet |
| 605943 | Legacy Framework | 38 | 2 | 59 | comment_sheet |
| 605943 | Legacy Framework | 38 | 3 | 70 | certificate |
| 10449525 | Regional Protocol A | 44 | 3 | 70 | certificate |
| 10449525 | Regional Protocol A | 44 | 4 | 81 | image |
| 5f93a090-8fcd-11eb-924d-9cd76263cbd0 | Seasonal Programme | 50 | 4 | 81 | image |
| 5f93a090-8fcd-11eb-924d-9cd76263cbd0 | Seasonal Programme | 50 | 1 | 48 | form |

This view joins `application_documents` to `application_pages` on `document_id`, answering the question: "What pages belong to each document, and what are their properties?" A row from this view might show document `IVC10I` (file name `Compact Standard`, format `legacy-format-25`) with page `1` (page number `48`, content type `form`, resolution `14.95`, colour `Indigo`, orientation `portrait`). This join reconstructs the document-to-page composition fact, allowing analysts to inspect the page-level detail of any document without navigating the junction table.

**View `vw_application_document_scanning_process`**

```sql
CREATE VIEW vw_application_document_scanning_process AS
SELECT a.document_id, a.file_name, a.file_size_bytes, a.page_count, b.id AS process_id, b.process_id AS process_process_id, b.start_date AS process_start_date
FROM application_documents a JOIN scanning_processes b ON a.scanning_process_id = b.id;
```

| document_id | file_name | file_size_bytes | page_count | process_id | process_process_id | process_start_date |
|---|---|---|---|---|---|---|
| IVC10I | Compact Standard | 32 | 6 | 1000 | template_ivacode_pagata_art15 | 2022-09-05T20:24:00 |
| 605943 | Legacy Framework | 38 | 7 | 1001 | 27cebc1c-9bad-11eb-a8a2-19ed5c03f8d3 | 2023-02-16T03:41:00 |
| 10449525 | Regional Protocol A | 44 | 0 | 1002 | 57e52fbc-8fcd-11eb-924d-9cd76263cbd0 | 2024-07-27T10:58:00 |
| 5f93a090-8fcd-11eb-924d-9cd76263cbd0 | Seasonal Programme | 50 | 15 | 1003 | 1205-0002-XL | 2025-12-11T17:15:00 |

This view joins `application_documents` to `scanning_processes` on `document_id`, answering: "Which scanning process produced each document, and what were the capture conditions?" A representative row links document `IVC10I` to process `1000` (process ID `template_ivacode_pagata_art15`, device type `iPhone`, app `Notes`, status `pending`, start date `2022-09-05T20:24:00`). This view materialises the document-capture relationship, enabling queries about which devices or applications were used for specific documents.

**View `vw_application_page_application_document`**

```sql
CREATE VIEW vw_application_page_application_document AS
SELECT a.application_page_id, a.page_number, a.content_type, a.image_resolution, b.document_id AS document_document_id, b.file_name AS document_file_name, b.file_size_bytes AS document_file_size_bytes
FROM application_pages a JOIN application_documents b ON a.document_id = b.document_id;
```

| application_page_id | page_number | content_type | image_resolution | document_document_id | document_file_name | document_file_size_bytes |
|---|---|---|---|---|---|---|
| 1 | 48 | form | 14.95 | IVC10I | Compact Standard | 32 |
| 2 | 59 | comment_sheet | 16.90 | 605943 | Legacy Framework | 38 |
| 3 | 70 | certificate | 18.85 | 10449525 | Regional Protocol A | 44 |
| 4 | 81 | image | 20.80 | 5f93a090-8fcd-11eb-924d-9cd76263cbd0 | Seasonal Programme | 50 |

This view is the inverse of `vw_application_document_application_page_detail`, joining `application_pages` to `application_documents` on `document_id`. It answers: "To which document does each page belong?" A row might show page `1` (content type `form`, resolution `14.95`, colour `Indigo`) belonging to document `IVC10I` (file name `Compact Standard`, page count `6`). This perspective is useful when the analyst starts from a page and needs to discover its parent document.

**View `vw_application_page_scanning_process`**

```sql
CREATE VIEW vw_application_page_scanning_process AS
SELECT a.application_page_id, a.page_number, a.content_type, a.image_resolution, b.id AS process_id, b.process_id AS process_process_id, b.start_date AS process_start_date
FROM application_pages a JOIN scanning_processes b ON a.scanning_process_id = b.id;
```

| application_page_id | page_number | content_type | image_resolution | process_id | process_process_id | process_start_date |
|---|---|---|---|---|---|---|
| 1 | 48 | form | 14.95 | 1000 | template_ivacode_pagata_art15 | 2022-09-05T20:24:00 |
| 2 | 59 | comment_sheet | 16.90 | 1001 | 27cebc1c-9bad-11eb-a8a2-19ed5c03f8d3 | 2023-02-16T03:41:00 |
| 3 | 70 | certificate | 18.85 | 1002 | 57e52fbc-8fcd-11eb-924d-9cd76263cbd0 | 2024-07-27T10:58:00 |
| 4 | 81 | image | 20.80 | 1003 | 1205-0002-XL | 2025-12-11T17:15:00 |

This view joins `application_pages` to `scanning_processes` on `scanning_process_id`, answering: "Which scanning process produced each page?" A row might show page `1` (page number `48`, content type `form`) produced by process `1000` (device type `iPhone`, app `Notes`, status `pending`). This view materialises the page-capture relationship, which is redundant with the `scanning_process_id` column in `application_pages` but provides a denormalised view for analytical convenience.

**View `vw_scanning_process_application_document`**

```sql
CREATE VIEW vw_scanning_process_application_document AS
SELECT a.id, a.process_id, a.start_date, a.end_date, b.document_id AS document_document_id, b.file_name AS document_file_name, b.file_size_bytes AS document_file_size_bytes
FROM scanning_processes a JOIN application_documents b ON a.document_id = b.document_id;
```

| id | process_id | start_date | end_date | document_document_id | document_file_name | document_file_size_bytes |
|---|---|---|---|---|---|---|
| 1000 | template_ivacode_pagata_art15 | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | IVC10I | Compact Standard | 32 |
| 1001 | 27cebc1c-9bad-11eb-a8a2-19ed5c03f8d3 | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | 605943 | Legacy Framework | 38 |
| 1002 | 57e52fbc-8fcd-11eb-924d-9cd76263cbd0 | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | 10449525 | Regional Protocol A | 44 |
| 1003 | 1205-0002-XL | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | 5f93a090-8fcd-11eb-924d-9cd76263cbd0 | Seasonal Programme | 50 |

This view joins `scanning_processes` to `application_documents` on `document_id`, answering: "Which document was produced by each scanning process?" A row might show process `1000` (process ID `template_ivacode_pagata_art15`, device type `iPhone`, status `pending`) producing document `IVC10I` (file name `Compact Standard`, format `legacy-format-25`, page count `6`). This is the inverse of `vw_application_document_scanning_process` and is useful when the analyst starts from a scanning process and needs to discover its output.

**View `vw_scanning_process_application_page_detail`**

```sql
CREATE VIEW vw_scanning_process_application_page_detail AS
SELECT a.id, a.process_id, a.start_date, b.application_page_id AS page_application_page_id, b.page_number AS page_page_number, b.content_type AS page_content_type
FROM scanning_processes a
  JOIN processes_pages j ON j.scanning_process_id = a.id
  JOIN application_pages b ON b.application_page_id = j.application_page_id;
```

| id | process_id | start_date | page_application_page_id | page_page_number | page_content_type |
|---|---|---|---|---|---|
| 1000 | template_ivacode_pagata_art15 | 2022-09-05T20:24:00 | 1 | 48 | form |
| 1000 | template_ivacode_pagata_art15 | 2022-09-05T20:24:00 | 2 | 59 | comment_sheet |
| 1001 | 27cebc1c-9bad-11eb-a8a2-19ed5c03f8d3 | 2023-02-16T03:41:00 | 2 | 59 | comment_sheet |
| 1001 | 27cebc1c-9bad-11eb-a8a2-19ed5c03f8d3 | 2023-02-16T03:41:00 | 3 | 70 | certificate |
| 1002 | 57e52fbc-8fcd-11eb-924d-9cd76263cbd0 | 2024-07-27T10:58:00 | 3 | 70 | certificate |
| 1002 | 57e52fbc-8fcd-11eb-924d-9cd76263cbd0 | 2024-07-27T10:58:00 | 4 | 81 | image |
| 1003 | 1205-0002-XL | 2025-12-11T17:15:00 | 4 | 81 | image |
| 1003 | 1205-0002-XL | 2025-12-11T17:15:00 | 1 | 48 | form |

This view joins `scanning_processes` to `application_pages` on `scanning_process_id`, answering: "What pages were produced by each scanning process, and what are their properties?" A row might show process `1000` (device type `iPhone`, app `Notes`, status `pending`) producing page `1` (page number `48`, content type `form`, resolution `14.95`, colour `Indigo`, orientation `portrait`). This view materialises the process-to-page composition fact, enabling analysts to inspect the page-level output of any scanning process.

**View `vw_scanning_process_mobile_device`**

```sql
CREATE VIEW vw_scanning_process_mobile_device AS
SELECT a.id, a.process_id, a.start_date, a.end_date, b.id AS device_id, b.device_id AS device_device_id, b.manufacturer AS device_manufacturer
FROM scanning_processes a JOIN mobile_devices b ON a.mobile_device_id = b.id;
```

| id | process_id | start_date | end_date | device_id | device_device_id | device_manufacturer |
|---|---|---|---|---|---|---|
| 1000 | template_ivacode_pagata_art15 | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | 1 | 3744015 | Standard Chartered |
| 1001 | 27cebc1c-9bad-11eb-a8a2-19ed5c03f8d3 | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | 2 | 392495 | General Motors |
| 1002 | 57e52fbc-8fcd-11eb-924d-9cd76263cbd0 | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | 3 | 209205 | Column Name cannot be empty |
| 1003 | 1205-0002-XL | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | 4 | 22106999 | Financial Information Service Co. Ltd. |

This view joins `scanning_processes` to `mobile_devices` on `mobile_device_id`, answering: "Which mobile device was used for each scanning process?" A row might show process `1000` (device type `iPhone`, app `Notes`, status `pending`) using device `1` (manufacturer `Standard Chartered`, model `composite-model-81`, OS `integrated-os-46`, camera resolution `10.70`). This view materialises the process-device relationship, enabling queries about which devices were used for specific capture operations.

**View `vw_mobile_device_scanning_process`**

```sql
CREATE VIEW vw_mobile_device_scanning_process AS
SELECT a.id, a.device_id, a.manufacturer, a.model, b.id AS process_id, b.process_id AS process_process_id, b.start_date AS process_start_date
FROM mobile_devices a JOIN scanning_processes b ON a.scanning_process_id = b.id;
```

| id | device_id | manufacturer | model | process_id | process_process_id | process_start_date |
|---|---|---|---|---|---|---|
| 1 | 3744015 | Standard Chartered | composite-model-81 | 1000 | template_ivacode_pagata_art15 | 2022-09-05T20:24:00 |
| 2 | 392495 | General Motors | primary-model-82 | 1001 | 27cebc1c-9bad-11eb-a8a2-19ed5c03f8d3 | 2023-02-16T03:41:00 |
| 3 | 209205 | Column Name cannot be empty | adaptive-model-83 | 1002 | 57e52fbc-8fcd-11eb-924d-9cd76263cbd0 | 2024-07-27T10:58:00 |
| 4 | 22106999 | Financial Information Service Co. Ltd. | distributed-model-84 | 1003 | 1205-0002-XL | 2025-12-11T17:15:00 |

This view is the inverse of `vw_scanning_process_mobile_device`, joining `mobile_devices` to `scanning_processes` on `scanning_process_id`. It answers: "Which scanning processes used each mobile device?" A row might show device `1` (manufacturer `Standard Chartered`, model `composite-model-81`, OS `integrated-os-46`) used in process `1000` (process ID `template_ivacode_pagata_art15`, device type `iPhone`, status `pending`). This perspective is useful when the analyst starts from a device and needs to discover its capture history.

**View `vw_export_process_application_document`**

```sql
CREATE VIEW vw_export_process_application_document AS
SELECT a.export_id, a.export_date, a.method, a.target_file_size_m_b, b.document_id AS document_document_id, b.file_name AS document_file_name, b.file_size_bytes AS document_file_size_bytes
FROM export_processes a JOIN application_documents b ON a.document_id = b.document_id;
```

| export_id | export_date | method | target_file_size_m_b | document_document_id | document_file_name | document_file_size_bytes |
|---|---|---|---|---|---|---|
| 4985161 | 2024-03-10T14:18:00 | AirDrop | 0.83 | IVC10I | Compact Standard | 32 |
| 10238289 | 2025-08-21T21:35:00 | Email | 0.6000001 | 605943 | Legacy Framework | 38 |
| 8881 | 2022-01-05T04:52:00 | AirDrop | 0.331550802139037 | 10449525 | Regional Protocol A | 44 |
| d6136806-8fc1-11eb-924d-9cd76263cbd0 | 2023-06-16T11:09:00 | Email | 0.38254625 | 5f93a090-8fcd-11eb-924d-9cd76263cbd0 | Seasonal Programme | 50 |

This view joins `export_processes` to `application_documents` on `document_id`, answering: "Which document was exported by each export process?" A row might show export `4985161` (export date `2024-03-10T14:18:00`, method `AirDrop`, status `pending`) exporting document `IVC10I` (file name `Compact Standard`, format `legacy-format-25`, page count `6`). This view materialises the export-document relationship, enabling analysts to track which documents were exported and when.

**View `vw_export_process_export_method`**

```sql
CREATE VIEW vw_export_process_export_method AS
SELECT a.export_id, a.export_date, a.method, a.target_file_size_m_b, b.id AS method_id, b.method_id AS method_method_id, b.method_name AS method_method_name
FROM export_processes a JOIN export_methods b ON a.export_method_id = b.id;
```

| export_id | export_date | method | target_file_size_m_b | method_id | method_method_id | method_method_name |
|---|---|---|---|---|---|---|
| 4985161 | 2024-03-10T14:18:00 | AirDrop | 0.83 | 1000 | 209228 | AirDrop |
| 10238289 | 2025-08-21T21:35:00 | Email | 0.6000001 | 1001 | 7441161 | Email |
| 8881 | 2022-01-05T04:52:00 | AirDrop | 0.331550802139037 | 1002 | 89447 | AirDrop |
| d6136806-8fc1-11eb-924d-9cd76263cbd0 | 2023-06-16T11:09:00 | Email | 0.38254625 | 1003 | 4180941 | Email |

This view joins `export_processes` to `export_methods` on `export_method_id`, answering: "Which export method configuration was used for each export process?" A row might show export `4985161` (export date `2024-03-10T14:18:00`, method `AirDrop`, status `pending`) using method `1000` (method name `AirDrop`, no compression support, max file size `1.05` GB). This view materialises the export-method relationship, enabling analysts to inspect the configuration details of each export operation.

**View `vw_export_method_export_process`**

```sql
CREATE VIEW vw_export_method_export_process AS
SELECT a.id, a.method_id, a.method_name, a.supports_compression, b.export_id AS process_export_id, b.export_date AS process_export_date, b.method AS process_method
FROM export_methods a JOIN export_processes b ON a.export_process_export_id = b.export_id;
```

| id | method_id | method_name | supports_compression | process_export_id | process_export_date | process_method |
|---|---|---|---|---|---|---|
| 1000 | 209228 | AirDrop | false | 4985161 | 2024-03-10T14:18:00 | AirDrop |
| 1001 | 7441161 | Email | true | 10238289 | 2025-08-21T21:35:00 | Email |
| 1002 | 89447 | AirDrop | false | 8881 | 2022-01-05T04:52:00 | AirDrop |
| 1003 | 4180941 | Email | true | d6136806-8fc1-11eb-924d-9cd76263cbd0 | 2023-06-16T11:09:00 | Email |

This view is the inverse of `vw_export_process_export_method`, joining `export_methods` to `export_processes` on `export_process_export_id`. It answers: "Which export processes used each export method configuration?" A row might show method `1000` (method name `AirDrop`, no compression support, max file size `1.05` GB) used in export `4985161` (export date `2024-03-10T14:18:00`, method `AirDrop`, status `pending`). This perspective is useful when the analyst starts from an export method and needs to discover which export operations used it.

The schema as a whole reflects a disciplined normalisation strategy: each entity type is captured in its own table with attributes mapped to columns, primary keys provide stable identifiers, and foreign keys encode the cardinality-bounded relationships that the ontology defines. Junction tables `documents_pages` and `processes_pages` add flexibility for many-to-many associations that the ontology permits but does not mandate. The twelve views materialise the most common analytical queries by joining the appropriate tables, allowing analysts to reconstruct domain facts—such as "which pages belong to which document" or "which device was used for which scan"—without writing explicit joins. This design balances the relational model's strength in data integrity with the analytical convenience of pre-joined views, ensuring that both operational and analytical workloads can access the data in a form that matches the underlying ontology.