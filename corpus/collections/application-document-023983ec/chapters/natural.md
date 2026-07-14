## Document Lifecycle and Export Workflows

Organizations that manage large volumes of paper-based records must track every step from initial capture through final distribution. The system described here records the full lifecycle of scanned documents: how they are created, which pages they contain, the scanning processes that produce them, the mobile devices and applications involved, and the export operations that move finished files to their destinations. Each stage is captured as a discrete record, linked to the others by shared identifiers so that auditors, operators, and analysts can reconstruct the complete provenance of any document.

**Table `application_documents`**

| document_id | file_name | file_size_bytes | page_count | creation_date | format | scanning_process_id |
|---|---|---|---|---|---|---|
| IVC10I | Compact Standard | 32 | 6 | 2022-01-13T12:24:00 | legacy-format-25 | 1000 |
| 605943 | Legacy Framework | 38 | 7 | 2023-06-24T19:41:00 | compact-format-26 | 1001 |
| 10449525 | Regional Protocol A | 44 | 0 | 2024-11-08T02:58:00 | composite-format-27 | 1002 |
| 5f93a090-8fcd-11eb-924d-9cd76263cbd0 | Seasonal Programme | 50 | 15 | 2025-04-19T09:15:00 | primary-format-28 | 1003 |

The `application_documents` table is the central registry of every scanned file entering the system. Each row represents a single document identified by a `document_id` such as `IVC10I` or the UUID `5f93a090-8fcd-11eb-924d-9cd76263cbd0`. The `file_name` column carries human-readable labels — "Compact Standard", "Seasonal Programme" — while `file_size_bytes` and `page_count` quantify the file's footprint and scope. The `creation_date` timestamps the moment the document record was opened, and `format` classifies the encoding scheme, ranging from `legacy-format-25` to `primary-format-28`. Every document is associated with a `scanning_process_id`, establishing the first link in the provenance chain. For instance, document `IVC10I` was produced under scanning process `1000`, and its six pages were captured in the `legacy-format-25` encoding on 13 January 2022.

**Table `application_pages`**

| application_page_id | page_number | content_type | image_resolution | is_color | orientation | document_id | scanning_process_id |
|---|---|---|---|---|---|---|---|
| 1 | 48 | form | 14.95 | Indigo | portrait | IVC10I | 1000 |
| 2 | 59 | comment_sheet | 16.90 | Red | landscape | 605943 | 1001 |
| 3 | 70 | certificate | 18.85 | Auburn | portrait | 10449525 | 1002 |
| 4 | 81 | image | 20.80 | Strawberry Blond | landscape | 5f93a090-8fcd-11eb-924d-9cd76263cbd0 | 1003 |

Documents are decomposed into individual pages, each recorded in `application_pages`. The `application_page_id` provides a unique key for every page, while `page_number` indicates its position within the parent document. The `content_type` field distinguishes between structural categories such as `form`, `comment_sheet`, `certificate`, and `image`. Imaging metadata — `image_resolution` measured in an unspecified unit, `is_color` for the palette designation, and `orientation` for portrait or landscape — is captured per page. The foreign keys `document_id` and `scanning_process_id` tie each page back to its parent document and the scanning process that produced it. Page `1` of document `IVC10I` is a `form` at resolution `14.95` in `Indigo` color, oriented `portrait`, scanned under process `1000`.

**Table `scanning_processes`**

| id | process_id | start_date | end_date | device_type | app_used | status | document_id | mobile_device_id | created_at |
|---|---|---|---|---|---|---|---|---|---|
| 1000 | template_ivacode_pagata_art15 | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | iPhone | Notes | pending | IVC10I | 1 | 2025-01-01 00:14:00 |
| 1001 | 27cebc1c-9bad-11eb-a8a2-19ed5c03f8d3 | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | Android | Genius Scan | in_progress | 605943 | 2 | 2025-02-06 03:14:00 |
| 1002 | 57e52fbc-8fcd-11eb-924d-9cd76263cbd0 | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | Scanner | Notes | complete | 10449525 | 3 | 2025-03-11 06:14:00 |
| 1003 | 1205-0002-XL | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | iPhone | Genius Scan | failed | 5f93a090-8fcd-11eb-924d-9cd76263cbd0 | 4 | 2025-04-16 09:14:00 |

The `scanning_processes` table documents the operational events during which documents and pages are captured. Each process carries a numeric `id` and a `process_id` that may be a short code like `template_ivacode_pagata_art15` or a UUID. The `start_date` and `end_date` fields bracket the capture window, though in some records the end date precedes the start date, suggesting retrospective logging or scheduling anomalies. The `device_type` column records the hardware class — `iPhone`, `Android`, or `Scanner` — while `app_used` identifies the scanning application, typically `Notes` or `Genius Scan`. The `status` field tracks completion state with values such as `pending`, `in_progress`, `complete`, and `failed`. Each process references a `document_id` and a `mobile_device_id`, anchoring the event to both the output document and the hardware used. Process `1000`, for example, ran on an `iPhone` using `Notes`, produced document `IVC10I`, and remains in `pending` status.

**Table `mobile_devices`**

| id | device_id | manufacturer | model | os_version | camera_resolution | scanning_process_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|
| 1 | 3744015 | Standard Chartered | composite-model-81 | integrated-os-46 | 10.70 | 1000 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | 392495 | General Motors | primary-model-82 | seasonal-os-47 | 12.40 | 1001 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | 209205 | Column Name cannot be empty | adaptive-model-83 | regional-os-48 | 14.10 | 1002 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | 22106999 | Financial Information Service Co. Ltd. | distributed-model-84 | legacy-os-49 | 15.80 | 1003 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Hardware is catalogued in `mobile_devices`, where each row describes a specific device used in scanning operations. The `device_id` is a numeric identifier — `3744015` for the first entry — while `manufacturer` names the producer, from `Standard Chartered` to `Financial Information Service Co. Ltd.`. The `model` column holds designations such as `composite-model-81`, and `os_version` records the operating system release, e.g. `integrated-os-46`. The `camera_resolution` field quantifies the imaging sensor capability. The `scanning_process_id` foreign key links each device to the scanning process that employed it. Device `1` (identifier `3744015`, manufactured by `Standard Chartered`, model `composite-model-81` running `integrated-os-46` with a `10.70` camera resolution) was used in scanning process `1000`.

**Table `export_processes`**

| export_id | export_date | method | target_file_size_m_b | status | document_id | export_method_id |
|---|---|---|---|---|---|---|
| 4985161 | 2024-03-10T14:18:00 | AirDrop | 0.83 | pending | IVC10I | 1000 |
| 10238289 | 2025-08-21T21:35:00 | Email | 0.6000001 | complete | 605943 | 1001 |
| 8881 | 2022-01-05T04:52:00 | AirDrop | 0.331550802139037 | failed | 10449525 | 1002 |
| d6136806-8fc1-11eb-924d-9cd76263cbd0 | 2023-06-16T11:09:00 | Email | 0.38254625 | pending | 5f93a090-8fcd-11eb-924d-9cd76263cbd0 | 1003 |

Once documents are scanned, they may be distributed through `export_processes`. Each export record carries an `export_id`, an `export_date`, and a `method` indicating the transport mechanism — `AirDrop` or `Email` in the sample data. The `target_file_size_m_b` column specifies the intended output size in megabytes, and `status` records whether the export is `pending`, `complete`, or `failed`. The `document_id` foreign key identifies the source document, and `export_method_id` links to the method definition. Export `4985161` moved document `IVC10I` via `AirDrop` on 10 March 2024 with a target size of `0.83` MB, and remains `pending`.

**Table `export_methods`**

| id | method_id | method_name | supports_compression | max_file_size_g_b | export_process_export_id |
|---|---|---|---|---|---|
| 1000 | 209228 | AirDrop | false | 1.05 | 4985161 |
| 1001 | 7441161 | Email | true | 0.5465680900000001 | 10238289 |
| 1002 | 89447 | AirDrop | false | 2.272937506868936 | 8881 |
| 1003 | 4180941 | Email | true | 0.1232532 | d6136806-8fc1-11eb-924d-9cd76263cbd0 |

The `export_methods` table defines the available distribution mechanisms. Each method has an `id`, a `method_id` code, and a `method_name` such as `AirDrop` or `Email`. The `supports_compression` flag indicates whether the method can compress output, and `max_file_size_g_b` sets the upper bound on file size in gigabytes. The `export_process_export_id` foreign key connects the method definition to the specific export process that invoked it. Method `1000` is named `AirDrop`, does not support compression (`false`), and permits a maximum file size of `1.05` GB.

### Junction Records

Two additional tables capture many-to-many relationships between documents, pages, and processes.

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

The `documents_pages` table records which pages belong to which documents, serving as an explicit mapping layer that complements the `document_id` foreign key already present in `application_pages`. This separation allows pages to be referenced independently and supports scenarios where a page might be associated with multiple documents or where the relationship is managed separately from the page's own metadata.

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

The `processes_pages` table links scanning processes to the individual pages they produced. Like `documents_pages`, this provides an explicit join table that can carry additional relationship metadata beyond what the direct foreign keys in `application_pages` capture. It enables queries that trace which pages were captured during a specific scanning process window, independent of the document they ultimately belong to.

### View: Application Document and Application Page Detail

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

This view joins `application_documents` with `application_pages` to present each page alongside its parent document's metadata. The resulting rows answer the question: "What are the imaging characteristics of each page within a given document?" A representative row would show document `IVC10I` (a six-page `legacy-format-25` file) alongside page `1`, which is a `form` at resolution `14.95` in `Indigo` color. Another row would pair document `5f93a090-8fcd-11eb-924d-9cd76263cbd0` ("Seasonal Programme", fifteen pages, `primary-format-28`) with page `4`, an `image` at resolution `20.80` in `Strawberry Blond` color, oriented `landscape`. This view is the primary tool for quality assurance, allowing operators to verify that page-level imaging parameters are consistent within a document.

### View: Application Document and Scanning Process

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

By joining `application_documents` with `scanning_processes`, this view correlates each document with the scanning event that produced it. The key question addressed is: "Which scanning process generated this document, and what was its status?" A row for document `IVC10I` would show scanning process `1000` with `device_type` `iPhone`, `app_used` `Notes`, and `status` `pending`. Document `10449525` ("Regional Protocol A") would be linked to process `1002`, which ran on a `Scanner` using `Notes` and reached `complete` status. This view supports operational dashboards that track scanning throughput and identify documents whose capture processes have not yet finished.

### View: Application Page and Application Document

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

This view presents each page from `application_pages` alongside its parent document's details from `application_documents`. It is the inverse perspective of the previous view, answering: "Which document does this page belong to, and what are that document's properties?" A row would show page `2` (a `comment_sheet` at resolution `16.90`, `Red` color, `landscape` orientation) belonging to document `605943` ("Legacy Framework", seven pages, `compact-format-26`). This view is useful for page-level reporting, where operators need to understand the context of an individual page within its document family.

### View: Application Page and Scanning Process

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

This view joins `application_pages` with `scanning_processes` to connect each page directly to the scanning process that captured it. The question it answers is: "Under what scanning conditions was this specific page produced?" A row for page `3` (a `certificate` at resolution `18.85`, `Auburn` color, `portrait` orientation) would show scanning process `1002`, which used a `Scanner` and the `Notes` application, with `status` `complete`. This view is particularly valuable for tracing imaging quality issues back to the specific device and application configuration used during capture.

### View: Scanning Process and Application Document

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

This view reverses the join direction from `vw_application_document_scanning_process`, presenting each scanning process alongside the document it produced. It answers: "What document did this scanning process generate, and what are the document's attributes?" A row for scanning process `1003` would show document `5f93a090-8fcd-11eb-924d-9cd76263cbd0` ("Seasonal Programme", fifteen pages, `primary-format-28`), with the process itself running on an `iPhone` using `Genius Scan` and ending in `failed` status. This perspective is useful for process-level analysis, where the focus is on the scanning operation rather than the document.

### View: Scanning Process and Application Page Detail

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

This view joins `scanning_processes` with `application_pages`, providing a detailed page-level view of each scanning process. It answers: "Which pages were captured during this scanning process, and what are their imaging characteristics?" A row for process `1001` would show page `2` (a `comment_sheet` at resolution `16.90`, `Red` color, `landscape` orientation), with the process itself using an `Android` device and `Genius Scan` application, status `in_progress`. This view supports granular quality audits and helps operators identify whether specific pages within a process have anomalous imaging parameters.

### View: Scanning Process and Mobile Device

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

This view connects `scanning_processes` with `mobile_devices`, revealing the hardware used for each scanning operation. The question it addresses is: "Which device was used for this scanning process, and what are its specifications?" A row for process `1000` would show device `1` (identifier `3744015`, manufacturer `Standard Chartered`, model `composite-model-81`, OS `integrated-os-46`, camera resolution `10.70`). Process `1003` would link to device `4` (identifier `22106999`, manufacturer `Financial Information Service Co. Ltd.`, model `distributed-model-84`, OS `legacy-os-49`, camera resolution `15.80`). This view is essential for correlating device capabilities with scanning outcomes, helping identify whether certain hardware or software configurations are associated with higher failure rates.

### View: Mobile Device and Scanning Process

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

This view presents each mobile device alongside the scanning processes it was used for, reversing the perspective of the previous view. It answers: "What scanning operations has this device been involved in?" A row for device `2` (identifier `392495`, manufacturer `General Motors`, model `primary-model-82`, OS `seasonal-os-47`, camera resolution `12.40`) would show scanning process `1001`, which produced document `605943` ("Legacy Framework") using `Genius Scan` on an `Android` device, with status `in_progress`. This view supports device lifecycle management, enabling operators to track usage patterns and plan hardware refreshes.

### View: Export Process and Application Document

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

This view joins `export_processes` with `application_documents`, linking each export operation to its source document. It answers: "Which document was exported in this operation, and what are the export details?" A row for export `4985161` would show document `IVC10I` ("Compact Standard", six pages, `legacy-format-25`), with the export using `AirDrop` on 10 March 2024, targeting `0.83` MB, and remaining `pending`. Export `10238289` would show document `605943` ("Legacy Framework") exported via `Email` on 21 August 2025 with a target of `0.60` MB and status `complete`. This view supports distribution tracking and helps identify documents that have not yet been successfully exported.

### View: Export Process and Export Method

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

This view connects `export_processes` with `export_methods`, revealing the method configuration used for each export operation. The question it addresses is: "What method settings were applied to this export?" A row for export `4985161` would show method `1000` (named `AirDrop`, no compression support, maximum file size `1.05` GB). Export `10238289` would show method `1001` (named `Email`, compression supported, maximum file size `0.5465680900000001` GB). This view is useful for auditing export configurations and ensuring that method constraints are compatible with the documents being distributed.

### View: Export Method and Export Process

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

This view presents each export method alongside the processes that invoked it, reversing the perspective of the previous view. It answers: "Which export operations have used this method, and what were their outcomes?" A row for method `1000` (`AirDrop`, no compression, max `1.05` GB) would show export `4985161` targeting document `IVC10I` with status `pending`. Method `1001` (`Email`, compression supported, max `0.5465680900000001` GB) would show export `10238289` targeting document `605943` with status `complete`. This view supports method-level analysis, helping operators understand which distribution mechanisms are most frequently used and which are associated with failures.

### Synthesis

The records described above form a coherent picture of a document scanning and export ecosystem. Documents are created and assigned to scanning processes, which are executed on specific mobile devices using particular applications. Each process produces pages with distinct imaging characteristics, and completed documents may be distributed through export operations that invoke defined methods with specific constraints. The junction tables and views provide multiple entry points for querying this data, whether the analyst's focus is on individual pages, entire documents, scanning operations, device performance, or export outcomes. Together, these tables and their relationships enable end-to-end traceability: from the moment a document is first captured on an `iPhone` running `Notes`, through its page-level imaging metadata, to its eventual export via `AirDrop` or `Email`.