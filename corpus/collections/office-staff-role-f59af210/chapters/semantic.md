# Ontology-Grounded Relational Modelling in the Office Operations Domain

The office operations domain captures the interplay between personnel, roles, administrative processes, and the documentary artifacts that flow through them. At its core, the domain models a set of staff members who hold specific roles within office locations, those roles which are assigned to operational processes, and the documents that those processes produce or govern. Travel logistics and copy-request workflows sit as parallel tracks, each tethered to the same cast of persons and roles. The ontology behind this domain distinguishes several entity types—Person, OfficeStaffRole, OfficeProcess, Document, CopyRequestForm, TravelRequest, TravelVoucher, and PostalAddress—and relates them through cardinality-bounded associations that the relational schema materialises as columns, foreign keys, and junction tables. The following sections walk through the base tables, the derived views, and the domain facts each join reconstructs.

## Base Tables and Their Ontological Mapping

The schema begins with eight base tables that correspond directly to the ontology's entity types. Each table stores a set of attributes as columns, and foreign-key columns encode the relationships between entities.

**Table `office_staff_roles`**

| office_staff_role_id | role_title | office_location | phone_extension | is_authorized_operator | has_emergency_authority | person_id | office_process_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|
| 1 | Distributed Standard | composite-office-99 | integrated-phone-82 | true | false | 1 | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | Adaptive Framework D | primary-office-100 | seasonal-phone-83 | false | true | 2 | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | Primary Protocol | adaptive-office-101 | regional-phone-84 | true | false | 3 | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | Composite Programme | distributed-office-102 | legacy-phone-85 | false | true | 4 | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The `office_staff_roles` table is the central hub for role assignments. Its primary key is `office_staff_role_id`, and the column `role_title` carries human-readable identifiers such as `Distributed Standard`, `Adaptive Framework D`, `Primary Protocol`, and `Composite Programme`. The `office_location` column stores location codes like `composite-office-99` and `primary-office-100`, while `phone_extension` holds values such as `integrated-phone-82` and `seasonal-phone-83`. Two boolean flags, `is_authorized_operator` and `has_emergency_authority`, capture the permission profile of each role: row 1 has `is_authorized_operator = true` and `has_emergency_authority = false`, whereas row 2 flips the pattern with `has_emergency_authority = true`. The foreign-key columns `person_id` and `office_process_id` bind each role to exactly one person and one process, respectively. Timestamps `created_at` and `updated_at` record the lifecycle of the assignment. In the ontology, this table materialises the `OfficeStaffRole` entity and the two binary associations `hasPerson` and `hasProcess`.

**Table `persons`**

| id | full_name | employee_id | email_address | department_affiliation | has_university_car_access | office_staff_role_id | travel_request_id |
|---|---|---|---|---|---|---|---|
| 1 | Theodore Mcgrath | Norma Fisher | primary-email-70 | adaptive-departme-53 | false | 1 | 100 |
| 2 | Account Name | Tasha Rodriguez | adaptive-email-71 | distributed-departme-54 | true | 2 | 101 |
| 3 | Saipan International Airport | Theodore Mcgrath | distributed-email-72 | baseline-departme-55 | false | 3 | 102 |
| 4 | Norma Fisher | Peter Mcdowell | baseline-email-73 | pilot-departme-56 | true | 4 | 103 |

The `persons` table stores the individual actors. Its primary key is `id`, and the `full_name` column holds values ranging from `Theodore Mcgrath` to `Account Name` and `Saipan International Airport`. The `employee_id` column carries identifiers like `Norma Fisher` and `Tasha Rodriguez`, while `email_address` stores addresses such as `primary-email-70` and `adaptive-email-71`. The `department_affiliation` column groups persons into departments like `adaptive-departme-53` and `pilot-departme-56`. A boolean `has_university_car_access` indicates vehicle access privileges. The foreign-key column `office_staff_role_id` links each person to their role, and `travel_request_id` connects them to a travel request. In the ontology, this table represents the `Person` entity with associations to `OfficeStaffRole` and `TravelRequest`.

**Table `office_processes`**

| id | process_type | operating_hours_start | operating_hours_end | is_lunch_break_included | lunch_break_start | lunch_break_end | semester_restriction | office_staff_role_id | document_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | distributed-process-36 | 2025-12-25T11:21:00 | 2023-02-03T01:15:00 | true | 2023-06-23T05:15:00 | 2023-10-10T21:39:00 | regional-semester-42 | 1 | 1 |
| 2 | baseline-process-37 | 2022-05-09T18:38:00 | 2024-07-14T08:32:00 | false | 2024-11-07T12:32:00 | 2024-03-21T04:56:00 | legacy-semester-43 | 2 | 2 |
| 3 | pilot-process-38 | 2023-10-20T01:55:00 | 2025-12-25T15:49:00 | true | 2025-04-18T19:49:00 | 2025-08-05T11:13:00 | compact-semester-44 | 3 | 3 |
| 4 | extended-process-39 | 2024-03-04T08:12:00 | 2022-05-09T22:06:00 | false | 2022-09-02T02:06:00 | 2022-01-16T18:30:00 | composite-semester-45 | 4 | 4 |

The `office_processes` table models the operational procedures. Its primary key is `id`, and `process_type` carries values such as `distributed-process-36` and `baseline-process-37`. The `operating_hours_start` and `operating_hours_end` columns store timestamps like `2025-12-25T11:21:00` and `2023-02-03T01:15:00`. A boolean `is_lunch_break_included` and the pair `lunch_break_start` / `lunch_break_end` define break windows. The `semester_restriction` column holds values like `regional-semester-42` and `compact-semester-44`. The foreign-key `office_staff_role_id` binds the process to a role, and `document_id` links it to a document. This table materialises the `OfficeProcess` entity with associations to `OfficeStaffRole` and `Document`.

**Table `documents`**

| id | document_type | creation_date | is_copyrighted | has_original_pages | has_copy_count | is_emergency | drop_box_location | person_id | office_process_id | copy_request_form_id | postal_address_id |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | distributed-document-96 | 2022-01-13 | false | 35 | 12 | true | seasonal-drop-65 | 1 | 1 | 1 | 100 |
| 2 | baseline-document-97 | 2023-06-24 | true | 44 | 21 | false | regional-drop-66 | 2 | 2 | 2 | 101 |
| 3 | pilot-document-98 | 2024-11-08 | false | 53 | 30 | true | legacy-drop-67 | 3 | 3 | 3 | 102 |
| 4 | extended-document-99 | 2025-04-19 | true | 62 | 39 | false | compact-drop-68 | 4 | 4 | 4 | 103 |

The `documents` table captures the documentary artifacts. Its primary key is `id`, and `document_type` carries values such as `distributed-document-96` and `baseline-document-97`. The `creation_date` column stores dates like `2022-01-13` and `2025-04-19`. Boolean flags `is_copyrighted`, `has_original_pages`, `has_copy_count`, and `is_emergency` encode document properties. The `has_original_pages` and `has_copy_count` columns store integer counts: row 1 has 35 original pages and 12 copies, while row 4 has 62 original pages and 39 copies. The `drop_box_location` column holds values like `seasonal-drop-65` and `compact-drop-68`. Foreign-key columns `person_id`, `office_process_id`, `copy_request_form_id`, and `postal_address_id` link the document to its creator, governing process, associated copy request, and mailing address. This table materialises the `Document` entity with four associations.

**Table `copy_request_forms`**

| id | form_id | copyright_info | original_page_count | copy_count | is_properly_filled | location_in_office | document_id | person_id |
|---|---|---|---|---|---|---|---|---|
| 1 | template_impcode_pagata_20det10 | composite-copyrigh-15 | 23 | 37 | true | compact-location-14 | 1 | 1 |
| 2 | 937744 | primary-copyrigh-16 | 26 | 12 | false | composite-location-15 | 2 | 2 |
| 3 | 1250195 | adaptive-copyrigh-17 | 1 | 49 | true | primary-location-16 | 3 | 3 |
| 4 | 3355762 | distributed-copyrigh-18 | 82 | 10 | false | adaptive-location-17 | 4 | 4 |

The `copy_request_forms` table records copy-order requests. Its primary key is `id`, and `form_id` carries identifiers such as `template_impcode_pagata_20det10` and `937744`. The `copyright_info` column stores values like `composite-copyrigh-15` and `adaptive-copyrigh-17`. Integer columns `original_page_count` and `copy_count` hold values ranging from 1 to 82 and 10 to 49 respectively. A boolean `is_properly_filled` indicates form completeness, and `location_in_office` stores values like `compact-location-14` and `adaptive-location-17`. Foreign-key columns `document_id` and `person_id` link the form to its document and requester. This table materialises the `CopyRequestForm` entity.

**Table `travel_requests`**

| travel_request_id | request_id | submission_date | meeting_name | requires_absence_authorization | requires_university_car | is_submitted_early | person_id | office_staff_role_id | voucher_id |
|---|---|---|---|---|---|---|---|---|---|
| 100 | 2087732 | 2025-04-24 | Regional Initiative | false | true | true | 1 | 1 | 2986224 |
| 101 | 575213 | 2022-09-08 | Seasonal Model D | true | false | false | 2 | 2 | 5917292 |
| 102 | 103167 | 2023-02-19 | Integrated Cluster | false | true | true | 3 | 3 | 5006456 |
| 103 | 611510 | 2024-07-03 | Extended Review | true | false | false | 4 | 4 | 974947 |

The `travel_requests` table models travel authorisation requests. Its primary key is `travel_request_id`, and `request_id` carries values such as `2087732` and `575213`. The `submission_date` column stores dates like `2025-04-24` and `2022-09-08`. The `meeting_name` column holds values like `Regional Initiative` and `Seasonal Model D`. Boolean flags `requires_absence_authorization`, `requires_university_car`, and `is_submitted_early` capture request properties. Foreign-key columns `person_id`, `office_staff_role_id`, and `voucher_id` link the request to the traveller, their role, and the reimbursement voucher. This table materialises the `TravelRequest` entity.

**Table `travel_vouchers`**

| voucher_id | submission_date | total_amount | has_all_receipts | missing_receipts_count | is_notarized | travel_request_id | person_id |
|---|---|---|---|---|---|---|---|
| 2986224 | 2025-04-24 | 112.11 | true | 0 | true | 100 | 1 |
| 5917292 | 2022-09-08 | 1,979 | false | 9 | false | 101 | 2 |
| 5006456 | 2023-02-19 | 15,418 | true | 4 | true | 102 | 3 |
| 974947 | 2024-07-03 | 12,579 | false | 1 | false | 103 | 4 |

The `travel_vouchers` table stores reimbursement vouchers. Its primary key is `voucher_id`, and `request_id` carries values such as `2986224` and `5917292`. The `person_id` and `office_staff_role_id` foreign keys link the voucher to the traveller and their role. This table materialises the `TravelVoucher` entity.

**Table `postal_addresses`**

| id | building_code | room_number | street_address | is_mail_pickup_location | mail_sort_deadline | document_id |
|---|---|---|---|---|---|---|
| 100 | 3990162 | ROO-2106 | composite-street-15 | true | 2023-10-10T21:51:00 | 1 |
| 101 | 5082972 | ROO-2113 | primary-street-16 | false | 2024-03-21T04:08:00 | 2 |
| 102 | 9125624 | ROO-2120 | adaptive-street-17 | true | 2025-08-05T11:25:00 | 3 |
| 103 | 10445626 | ROO-2127 | distributed-street-18 | false | 2022-01-16T18:42:00 | 4 |

The `postal_addresses` table stores mailing addresses. Its primary key is `address_id`, and `person_id` and `document_id` foreign keys link the address to a person and a document. This table materialises the `PostalAddress` entity.

## Views and Reconstructed Domain Facts

The views layer joins the normalised base tables to answer concrete domain questions. Each view reconstructs a fact that spans multiple entity types.

**View `vw_office_staff_role_person`**

```sql
CREATE VIEW vw_office_staff_role_person AS
SELECT a.office_staff_role_id, a.role_title, a.office_location, a.phone_extension, b.id AS person_id, b.full_name AS person_full_name, b.employee_id AS person_employee_id
FROM office_staff_roles a JOIN persons b ON a.person_id = b.id;
```

| office_staff_role_id | role_title | office_location | phone_extension | person_id | person_full_name | person_employee_id |
|---|---|---|---|---|---|---|
| 1 | Distributed Standard | composite-office-99 | integrated-phone-82 | 1 | Theodore Mcgrath | Norma Fisher |
| 2 | Adaptive Framework D | primary-office-100 | seasonal-phone-83 | 2 | Account Name | Tasha Rodriguez |
| 3 | Primary Protocol | adaptive-office-101 | regional-phone-84 | 3 | Saipan International Airport | Theodore Mcgrath |
| 4 | Composite Programme | distributed-office-102 | legacy-phone-85 | 4 | Norma Fisher | Peter Mcdowell |

This view joins `office_staff_roles` to `persons` on `office_staff_role_id = office_staff_role_id`, answering the question: "Which person holds which office staff role?" Row 1 reveals that the person with `full_name = Theodore Mcgrath` and `employee_id = Norma Fisher` holds the role titled `Distributed Standard` at `composite-office-99`. Row 2 shows `Account Name` (employee `Tasha Rodriguez`) in the role `Adaptive Framework D` at `primary-office-100`. The join confirms the one-to-one binding between a person and their role assignment.

**View `vw_office_staff_role_office_process`**

```sql
CREATE VIEW vw_office_staff_role_office_process AS
SELECT a.office_staff_role_id, a.role_title, a.office_location, a.phone_extension, b.id AS process_id, b.process_type AS process_process_type, b.operating_hours_start AS process_operating_hours_start
FROM office_staff_roles a JOIN office_processes b ON a.office_process_id = b.id;
```

| office_staff_role_id | role_title | office_location | phone_extension | process_id | process_process_type | process_operating_hours_start |
|---|---|---|---|---|---|---|
| 1 | Distributed Standard | composite-office-99 | integrated-phone-82 | 1 | distributed-process-36 | 2025-12-25T11:21:00 |
| 2 | Adaptive Framework D | primary-office-100 | seasonal-phone-83 | 2 | baseline-process-37 | 2022-05-09T18:38:00 |
| 3 | Primary Protocol | adaptive-office-101 | regional-phone-84 | 3 | pilot-process-38 | 2023-10-20T01:55:00 |
| 4 | Composite Programme | distributed-office-102 | legacy-phone-85 | 4 | extended-process-39 | 2024-03-04T08:12:00 |

This view joins `office_staff_roles` to `office_processes` on `office_staff_role_id`, answering: "Which office process is assigned to which staff role?" Row 1 links the role `Distributed Standard` to the process `distributed-process-36` with operating hours starting at `2025-12-25T11:21:00`. Row 2 connects `Adaptive Framework D` to `baseline-process-37`, which does not include a lunch break (`is_lunch_break_included = false`). The view materialises the role-to-process association.

**View `vw_person_office_staff_role`**

```sql
CREATE VIEW vw_person_office_staff_role AS
SELECT a.id, a.full_name, a.employee_id, a.email_address, b.office_staff_role_id AS role_office_staff_role_id, b.role_title AS role_role_title, b.office_location AS role_office_location
FROM persons a JOIN office_staff_roles b ON a.office_staff_role_id = b.office_staff_role_id;
```

| id | full_name | employee_id | email_address | role_office_staff_role_id | role_role_title | role_office_location |
|---|---|---|---|---|---|---|
| 1 | Theodore Mcgrath | Norma Fisher | primary-email-70 | 1 | Distributed Standard | composite-office-99 |
| 2 | Account Name | Tasha Rodriguez | adaptive-email-71 | 2 | Adaptive Framework D | primary-office-100 |
| 3 | Saipan International Airport | Theodore Mcgrath | distributed-email-72 | 3 | Primary Protocol | adaptive-office-101 |
| 4 | Norma Fisher | Peter Mcdowell | baseline-email-73 | 4 | Composite Programme | distributed-office-102 |

This view joins `persons` to `office_staff_roles` on `id = office_staff_role_id`, answering: "What role does a given person hold?" Row 1 shows `Theodore Mcgrath` holding role `Distributed Standard` with `is_authorized_operator = true`. Row 2 shows `Account Name` in role `Adaptive Framework D` with `has_emergency_authority = true`. The view inverts the perspective from the role table, presenting the person as the anchor.

**View `vw_person_travel_request`**

```sql
CREATE VIEW vw_person_travel_request AS
SELECT a.id, a.full_name, a.employee_id, a.email_address, b.travel_request_id AS request_travel_request_id, b.request_id AS request_request_id, b.submission_date AS request_submission_date
FROM persons a JOIN travel_requests b ON a.travel_request_id = b.travel_request_id;
```

| id | full_name | employee_id | email_address | request_travel_request_id | request_request_id | request_submission_date |
|---|---|---|---|---|---|---|
| 1 | Theodore Mcgrath | Norma Fisher | primary-email-70 | 100 | 2087732 | 2025-04-24 |
| 2 | Account Name | Tasha Rodriguez | adaptive-email-71 | 101 | 575213 | 2022-09-08 |
| 3 | Saipan International Airport | Theodore Mcgrath | distributed-email-72 | 102 | 103167 | 2023-02-19 |
| 4 | Norma Fisher | Peter Mcdowell | baseline-email-73 | 103 | 611510 | 2024-07-03 |

This view joins `persons` to `travel_requests` on `id = travel_request_id`, answering: "Which travel request is associated with a given person?" Row 1 links `Theodore Mcgrath` to travel request `2087732` for the meeting `Regional Initiative`, submitted on `2025-04-24`, which `requires_university_car = true` and `is_submitted_early = true`. Row 2 connects `Account Name` to request `575213` for `Seasonal Model D`, which `requires_absence_authorization = true`. The view reconstructs the person-to-travel-request association.

**View `vw_office_process_office_staff_role`**

```sql
CREATE VIEW vw_office_process_office_staff_role AS
SELECT a.id, a.process_type, a.operating_hours_start, a.operating_hours_end, b.office_staff_role_id AS role_office_staff_role_id, b.role_title AS role_role_title, b.office_location AS role_office_location
FROM office_processes a JOIN office_staff_roles b ON a.office_staff_role_id = b.office_staff_role_id;
```

| id | process_type | operating_hours_start | operating_hours_end | role_office_staff_role_id | role_role_title | role_office_location |
|---|---|---|---|---|---|---|
| 1 | distributed-process-36 | 2025-12-25T11:21:00 | 2023-02-03T01:15:00 | 1 | Distributed Standard | composite-office-99 |
| 2 | baseline-process-37 | 2022-05-09T18:38:00 | 2024-07-14T08:32:00 | 2 | Adaptive Framework D | primary-office-100 |
| 3 | pilot-process-38 | 2023-10-20T01:55:00 | 2025-12-25T15:49:00 | 3 | Primary Protocol | adaptive-office-101 |
| 4 | extended-process-39 | 2024-03-04T08:12:00 | 2022-05-09T22:06:00 | 4 | Composite Programme | distributed-office-102 |

This view joins `office_processes` to `office_staff_roles` on `id = office_staff_role_id`, answering: "Which staff role governs a given office process?" Row 1 shows that process `distributed-process-36` is governed by the role `Distributed Standard` at location `composite-office-99`. Row 2 links `baseline-process-37` to role `Adaptive Framework D`. The view presents the process as the anchor of the role-process association.

**View `vw_office_process_document`**

```sql
CREATE VIEW vw_office_process_document AS
SELECT a.id, a.process_type, a.operating_hours_start, a.operating_hours_end, b.id AS document_id, b.document_type AS document_document_type, b.creation_date AS document_creation_date
FROM office_processes a JOIN documents b ON a.document_id = b.id;
```

| id | process_type | operating_hours_start | operating_hours_end | document_id | document_document_type | document_creation_date |
|---|---|---|---|---|---|---|
| 1 | distributed-process-36 | 2025-12-25T11:21:00 | 2023-02-03T01:15:00 | 1 | distributed-document-96 | 2022-01-13 |
| 2 | baseline-process-37 | 2022-05-09T18:38:00 | 2024-07-14T08:32:00 | 2 | baseline-document-97 | 2023-06-24 |
| 3 | pilot-process-38 | 2023-10-20T01:55:00 | 2025-12-25T15:49:00 | 3 | pilot-document-98 | 2024-11-08 |
| 4 | extended-process-39 | 2024-03-04T08:12:00 | 2022-05-09T22:06:00 | 4 | extended-document-99 | 2025-04-19 |

This view joins `office_processes` to `documents` on `id = document_id`, answering: "Which document is governed by a given office process?" Row 1 connects process `distributed-process-36` to document `distributed-document-96`, created on `2022-01-13`, which is marked `is_emergency = true` and has 35 original pages. Row 2 links `baseline-process-37` to `baseline-document-97`, which `is_copyrighted = true` and has 44 original pages. The view materialises the process-to-document association.

**View `vw_document_person`**

```sql
CREATE VIEW vw_document_person AS
SELECT a.id, a.document_type, a.creation_date, a.is_copyrighted, b.id AS person_id, b.full_name AS person_full_name, b.employee_id AS person_employee_id
FROM documents a JOIN persons b ON a.person_id = b.id;
```

| id | document_type | creation_date | is_copyrighted | person_id | person_full_name | person_employee_id |
|---|---|---|---|---|---|---|
| 1 | distributed-document-96 | 2022-01-13 | false | 1 | Theodore Mcgrath | Norma Fisher |
| 2 | baseline-document-97 | 2023-06-24 | true | 2 | Account Name | Tasha Rodriguez |
| 3 | pilot-document-98 | 2024-11-08 | false | 3 | Saipan International Airport | Theodore Mcgrath |
| 4 | extended-document-99 | 2025-04-19 | true | 4 | Norma Fisher | Peter Mcdowell |

This view joins `documents` to `persons` on `id = person_id`, answering: "Who created or is associated with a given document?" Row 1 shows that document `distributed-document-96` is associated with person `Theodore Mcgrath` (employee `Norma Fisher`). Row 2 links `baseline-document-97` to `Account Name` (employee `Tasha Rodriguez`). The view reconstructs the document-to-person creator association.

**View `vw_document_office_process`**

```sql
CREATE VIEW vw_document_office_process AS
SELECT a.id, a.document_type, a.creation_date, a.is_copyrighted, b.id AS process_id, b.process_type AS process_process_type, b.operating_hours_start AS process_operating_hours_start
FROM documents a JOIN office_processes b ON a.office_process_id = b.id;
```

| id | document_type | creation_date | is_copyrighted | process_id | process_process_type | process_operating_hours_start |
|---|---|---|---|---|---|---|
| 1 | distributed-document-96 | 2022-01-13 | false | 1 | distributed-process-36 | 2025-12-25T11:21:00 |
| 2 | baseline-document-97 | 2023-06-24 | true | 2 | baseline-process-37 | 2022-05-09T18:38:00 |
| 3 | pilot-document-98 | 2024-11-08 | false | 3 | pilot-process-38 | 2023-10-20T01:55:00 |
| 4 | extended-document-99 | 2025-04-19 | true | 4 | extended-process-39 | 2024-03-04T08:12:00 |

This view joins `documents` to `office_processes` on `id = office_process_id`, answering: "Which office process governs a given document?" Row 1 shows document `distributed-document-96` is governed by process `distributed-process-36` with operating hours from `2025-12-25T11:21:00` to `2023-02-03T01:15:00`. Row 2 links `baseline-document-97` to process `baseline-process-37`. The view presents the document as the anchor of the process-document association.

**View `vw_document_copy_request_form`**

```sql
CREATE VIEW vw_document_copy_request_form AS
SELECT a.id, a.document_type, a.creation_date, a.is_copyrighted, b.id AS form_id, b.form_id AS form_form_id, b.copyright_info AS form_copyright_info
FROM documents a JOIN copy_request_forms b ON a.copy_request_form_id = b.id;
```

| id | document_type | creation_date | is_copyrighted | form_id | form_form_id | form_copyright_info |
|---|---|---|---|---|---|---|
| 1 | distributed-document-96 | 2022-01-13 | false | 1 | template_impcode_pagata_20det10 | composite-copyrigh-15 |
| 2 | baseline-document-97 | 2023-06-24 | true | 2 | 937744 | primary-copyrigh-16 |
| 3 | pilot-document-98 | 2024-11-08 | false | 3 | 1250195 | adaptive-copyrigh-17 |
| 4 | extended-document-99 | 2025-04-19 | true | 4 | 3355762 | distributed-copyrigh-18 |

This view joins `documents` to `copy_request_forms` on `id = copy_request_form_id`, answering: "Which copy request form is associated with a given document?" Row 1 links document `distributed-document-96` to copy request form `template_impcode_pagata_20det10`, which has `original_page_count = 23` and `copy_count = 37`, and is `is_properly_filled = true`. Row 2 connects `baseline-document-97` to form `937744` with `original_page_count = 26` and `copy_count = 12`, which is `is_properly_filled = false`. The view reconstructs the document-to-copy-request association.

**View `vw_document_postal_address`**

```sql
CREATE VIEW vw_document_postal_address AS
SELECT a.id, a.document_type, a.creation_date, a.is_copyrighted, b.id AS address_id, b.building_code AS address_building_code, b.room_number AS address_room_number
FROM documents a JOIN postal_addresses b ON a.postal_address_id = b.id;
```

| id | document_type | creation_date | is_copyrighted | address_id | address_building_code | address_room_number |
|---|---|---|---|---|---|---|
| 1 | distributed-document-96 | 2022-01-13 | false | 100 | 3990162 | ROO-2106 |
| 2 | baseline-document-97 | 2023-06-24 | true | 101 | 5082972 | ROO-2113 |
| 3 | pilot-document-98 | 2024-11-08 | false | 102 | 9125624 | ROO-2120 |
| 4 | extended-document-99 | 2025-04-19 | true | 103 | 10445626 | ROO-2127 |

This view joins `documents` to `postal_addresses` on `id = postal_address_id`, answering: "Which postal address is associated with a given document?" Row 1 links document `distributed-document-96` to postal address `100`, and Row 2 links `baseline-document-97` to address `101`. The view materialises the document-to-address association.

**View `vw_copy_request_form_document`**

```sql
CREATE VIEW vw_copy_request_form_document AS
SELECT a.id, a.form_id, a.copyright_info, a.original_page_count, b.id AS document_id, b.document_type AS document_document_type, b.creation_date AS document_creation_date
FROM copy_request_forms a JOIN documents b ON a.document_id = b.id;
```

| id | form_id | copyright_info | original_page_count | document_id | document_document_type | document_creation_date |
|---|---|---|---|---|---|---|
| 1 | template_impcode_pagata_20det10 | composite-copyrigh-15 | 23 | 1 | distributed-document-96 | 2022-01-13 |
| 2 | 937744 | primary-copyrigh-16 | 26 | 2 | baseline-document-97 | 2023-06-24 |
| 3 | 1250195 | adaptive-copyrigh-17 | 1 | 3 | pilot-document-98 | 2024-11-08 |
| 4 | 3355762 | distributed-copyrigh-18 | 82 | 4 | extended-document-99 | 2025-04-19 |

This view joins `copy_request_forms` to `documents` on `id = document_id`, answering: "Which document does a given copy request form pertain to?" Row 1 shows form `template_impcode_pagata_20det10` pertains to document `distributed-document-96`, which is `is_emergency = true` and has 35 original pages. Row 2 links form `937744` to `baseline-document-97`, which `is_copyrighted = true`. The view inverts the perspective, presenting the copy request form as the anchor.

**View `vw_copy_request_form_person`**

```sql
CREATE VIEW vw_copy_request_form_person AS
SELECT a.id, a.form_id, a.copyright_info, a.original_page_count, b.id AS person_id, b.full_name AS person_full_name, b.employee_id AS person_employee_id
FROM copy_request_forms a JOIN persons b ON a.person_id = b.id;
```

| id | form_id | copyright_info | original_page_count | person_id | person_full_name | person_employee_id |
|---|---|---|---|---|---|---|
| 1 | template_impcode_pagata_20det10 | composite-copyrigh-15 | 23 | 1 | Theodore Mcgrath | Norma Fisher |
| 2 | 937744 | primary-copyrigh-16 | 26 | 2 | Account Name | Tasha Rodriguez |
| 3 | 1250195 | adaptive-copyrigh-17 | 1 | 3 | Saipan International Airport | Theodore Mcgrath |
| 4 | 3355762 | distributed-copyrigh-18 | 82 | 4 | Norma Fisher | Peter Mcdowell |

This view joins `copy_request_forms` to `persons` on `id = person_id`, answering: "Which person submitted a given copy request form?" Row 1 shows form `template_impcode_pagata_20det10` was submitted by `Theodore Mcgrath` (employee `Norma Fisher`). Row 2 links form `937744` to `Account Name` (employee `Tasha Rodriguez`). The view reconstructs the form-to-person requester association.

**View `vw_travel_request_person`**

```sql
CREATE VIEW vw_travel_request_person AS
SELECT a.travel_request_id, a.request_id, a.submission_date, a.meeting_name, b.id AS person_id, b.full_name AS person_full_name, b.employee_id AS person_employee_id
FROM travel_requests a JOIN persons b ON a.person_id = b.id;
```

| travel_request_id | request_id | submission_date | meeting_name | person_id | person_full_name | person_employee_id |
|---|---|---|---|---|---|---|
| 100 | 2087732 | 2025-04-24 | Regional Initiative | 1 | Theodore Mcgrath | Norma Fisher |
| 101 | 575213 | 2022-09-08 | Seasonal Model D | 2 | Account Name | Tasha Rodriguez |
| 102 | 103167 | 2023-02-19 | Integrated Cluster | 3 | Saipan International Airport | Theodore Mcgrath |
| 103 | 611510 | 2024-07-03 | Extended Review | 4 | Norma Fisher | Peter Mcdowell |

This view joins `travel_requests` to `persons` on `id = person_id`, answering: "Which person made a given travel request?" Row 1 shows travel request `2087732` was made by `Theodore Mcgrath` for the meeting `Regional Initiative`, requiring university car access. Row 2 links request `575213` to `Account Name` for `Seasonal Model D`, which requires absence authorization. The view presents the travel request as the anchor.

**View `vw_travel_request_office_staff_role`**

```sql
CREATE VIEW vw_travel_request_office_staff_role AS
SELECT a.travel_request_id, a.request_id, a.submission_date, a.meeting_name, b.office_staff_role_id AS role_office_staff_role_id, b.role_title AS role_role_title, b.office_location AS role_office_location
FROM travel_requests a JOIN office_staff_roles b ON a.office_staff_role_id = b.office_staff_role_id;
```

| travel_request_id | request_id | submission_date | meeting_name | role_office_staff_role_id | role_role_title | role_office_location |
|---|---|---|---|---|---|---|
| 100 | 2087732 | 2025-04-24 | Regional Initiative | 1 | Distributed Standard | composite-office-99 |
| 101 | 575213 | 2022-09-08 | Seasonal Model D | 2 | Adaptive Framework D | primary-office-100 |
| 102 | 103167 | 2023-02-19 | Integrated Cluster | 3 | Primary Protocol | adaptive-office-101 |
| 103 | 611510 | 2024-07-03 | Extended Review | 4 | Composite Programme | distributed-office-102 |

This view joins `travel_requests` to `office_staff_roles` on `id = office_staff_role_id`, answering: "Which office staff role is associated with a given travel request?" Row 1 links travel request `2087732` to role `Distributed Standard` at `composite-office-99`. Row 2 connects request `575213` to role `Adaptive Framework D` at `primary-office-100`. The view reconstructs the travel-request-to-role association.

**View `vw_travel_request_travel_voucher`**

```sql
CREATE VIEW vw_travel_request_travel_voucher AS
SELECT a.travel_request_id, a.request_id, a.submission_date, a.meeting_name, b.voucher_id AS voucher_voucher_id, b.submission_date AS voucher_submission_date, b.total_amount AS voucher_total_amount
FROM travel_requests a JOIN travel_vouchers b ON a.voucher_id = b.voucher_id;
```

| travel_request_id | request_id | submission_date | meeting_name | voucher_voucher_id | voucher_submission_date | voucher_total_amount |
|---|---|---|---|---|---|---|
| 100 | 2087732 | 2025-04-24 | Regional Initiative | 2986224 | 2025-04-24 | 112.11 |
| 101 | 575213 | 2022-09-08 | Seasonal Model D | 5917292 | 2022-09-08 | 1,979 |
| 102 | 103167 | 2023-02-19 | Integrated Cluster | 5006456 | 2023-02-19 | 15,418 |
| 103 | 611510 | 2024-07-03 | Extended Review | 974947 | 2024-07-03 | 12,579 |

This view joins `travel_requests` to `travel_vouchers` on `id = voucher_id`, answering: "Which travel voucher corresponds to a given travel request?" Row 1 links travel request `2087732` to voucher `2986224`, and Row 2 connects request `575213` to voucher `5917292`. The view materialises the request-to-voucher reimbursement association.

**View `vw_travel_voucher_travel_request`**

```sql
CREATE VIEW vw_travel_voucher_travel_request AS
SELECT a.voucher_id, a.submission_date, a.total_amount, a.has_all_receipts, b.travel_request_id AS request_travel_request_id, b.request_id AS request_request_id, b.submission_date AS request_submission_date
FROM travel_vouchers a JOIN travel_requests b ON a.travel_request_id = b.travel_request_id;
```

| voucher_id | submission_date | total_amount | has_all_receipts | request_travel_request_id | request_request_id | request_submission_date |
|---|---|---|---|---|---|---|
| 2986224 | 2025-04-24 | 112.11 | true | 100 | 2087732 | 2025-04-24 |
| 5917292 | 2022-09-08 | 1,979 | false | 101 | 575213 | 2022-09-08 |
| 5006456 | 2023-02-19 | 15,418 | true | 102 | 103167 | 2023-02-19 |
| 974947 | 2024-07-03 | 12,579 | false | 103 | 611510 | 2024-07-03 |

This view joins `travel_vouchers` to `travel_requests` on `id = travel_request_id`, answering: "Which travel request does a given voucher reimburse?" Row 1 shows voucher `2986224` reimburses travel request `2087732` for the meeting `Regional Initiative`. Row 2 links voucher `5917292` to request `575213` for `Seasonal Model D`. The view inverts the perspective, presenting the voucher as the anchor.

**View `vw_travel_voucher_person`**

```sql
CREATE VIEW vw_travel_voucher_person AS
SELECT a.voucher_id, a.submission_date, a.total_amount, a.has_all_receipts, b.id AS person_id, b.full_name AS person_full_name, b.employee_id AS person_employee_id
FROM travel_vouchers a JOIN persons b ON a.person_id = b.id;
```

| voucher_id | submission_date | total_amount | has_all_receipts | person_id | person_full_name | person_employee_id |
|---|---|---|---|---|---|---|
| 2986224 | 2025-04-24 | 112.11 | true | 1 | Theodore Mcgrath | Norma Fisher |
| 5917292 | 2022-09-08 | 1,979 | false | 2 | Account Name | Tasha Rodriguez |
| 5006456 | 2023-02-19 | 15,418 | true | 3 | Saipan International Airport | Theodore Mcgrath |
| 974947 | 2024-07-03 | 12,579 | false | 4 | Norma Fisher | Peter Mcdowell |

This view joins `travel_vouchers` to `persons` on `id = person_id`, answering: "Which person is reimbursed by a given travel voucher?" Row 1 shows voucher `2986224` reimburses person `Theodore Mcgrath` (employee `Norma Fisher`). Row 2 links voucher `5917292` to `Account Name` (employee `Tasha Rodriguez`). The view reconstructs the voucher-to-person reimbursement association.

**View `vw_postal_address_document`**

```sql
CREATE VIEW vw_postal_address_document AS
SELECT a.id, a.building_code, a.room_number, a.street_address, b.id AS document_id, b.document_type AS document_document_type, b.creation_date AS document_creation_date
FROM postal_addresses a JOIN documents b ON a.document_id = b.id;
```

| id | building_code | room_number | street_address | document_id | document_document_type | document_creation_date |
|---|---|---|---|---|---|---|
| 100 | 3990162 | ROO-2106 | composite-street-15 | 1 | distributed-document-96 | 2022-01-13 |
| 101 | 5082972 | ROO-2113 | primary-street-16 | 2 | baseline-document-97 | 2023-06-24 |
| 102 | 9125624 | ROO-2120 | adaptive-street-17 | 3 | pilot-document-98 | 2024-11-08 |
| 103 | 10445626 | ROO-2127 | distributed-street-18 | 4 | extended-document-99 | 2025-04-19 |

This view joins `postal_addresses` to `documents` on `id = document_id`, answering: "Which document is associated with a given postal address?" Row 1 links postal address `100` to document `distributed-document-96`, which is `is_emergency = true` and has 35 original pages. Row 2 connects address `101` to `baseline-document-97`, which `is_copyrighted = true`. The view presents the postal address as the anchor of the address-document association.

## Synthesis

The office operations domain is modelled as a set of eight entity types whose associations are materialised as foreign-key columns in the base tables. The `office_staff_roles` table serves as the central junction, binding persons to processes and carrying permission flags. The `documents` table is the most connected entity, with foreign keys to persons, processes, copy request forms, and postal addresses. The travel domain branches off through `travel_requests` and `travel_vouchers`, each linked back to persons and roles. The twelve views reconstruct the domain facts by joining these normalised tables, each view answering a specific question from a different entity's perspective. For instance, the fact that `Theodore Mcgrath` holds the `Distributed Standard` role, which governs process `distributed-process-36`, which produces document `distributed-document-96`, which is associated with copy request form `template_impcode_pagata_20det10` and postal address `100`, is spread across five tables and can be recovered through the appropriate view joins. This normalised structure ensures data integrity through foreign-key constraints while the views provide the denormalised perspectives needed for operational queries.