## Office Operations and Personnel Management

Every mid-sized organization maintains a complex web of personnel assignments, procedural workflows, document lifecycles, and logistical arrangements. The records captured in this system describe how staff members are assigned to roles, how those roles interface with operational processes, how documents are created and tracked through copy requests, and how travel is authorized and documented. Understanding these relationships is essential for auditing, compliance, and day-to-day operational oversight.

The foundation of the system rests on eight core tables that store the raw records of office activity. Staff assignments are tracked in the roles table, which records each position's title, location, contact details, and authorization level.

**Table `office_staff_roles`**

| office_staff_role_id | role_title | office_location | phone_extension | is_authorized_operator | has_emergency_authority | person_id | office_process_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|
| 1 | Distributed Standard | composite-office-99 | integrated-phone-82 | true | false | 1 | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | Adaptive Framework D | primary-office-100 | seasonal-phone-83 | false | true | 2 | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | Primary Protocol | adaptive-office-101 | regional-phone-84 | true | false | 3 | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | Composite Programme | distributed-office-102 | legacy-phone-85 | false | true | 4 | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Each role carries a boolean flag indicating whether the holder is an authorized operator and whether they possess emergency authority. The role at index 1, titled "Distributed Standard," is located at composite-office-99 with phone extension integrated-phone-82, and its holder is an authorized operator without emergency authority. By contrast, the role at index 2, "Adaptive Framework D," located at primary-office-100, carries emergency authority but lacks operator authorization. These distinctions matter when determining who can approve sensitive actions.

Personnel records are maintained separately, linking each individual to a role and, where applicable, to a travel request.

**Table `persons`**

| id | full_name | employee_id | email_address | department_affiliation | has_university_car_access | office_staff_role_id | travel_request_id |
|---|---|---|---|---|---|---|---|
| 1 | Theodore Mcgrath | Norma Fisher | primary-email-70 | adaptive-departme-53 | false | 1 | 100 |
| 2 | Account Name | Tasha Rodriguez | adaptive-email-71 | distributed-departme-54 | true | 2 | 101 |
| 3 | Saipan International Airport | Theodore Mcgrath | distributed-email-72 | baseline-departme-55 | false | 3 | 102 |
| 4 | Norma Fisher | Peter Mcdowell | baseline-email-73 | pilot-departme-56 | true | 4 | 103 |

The person record for Theodore Mcgrath carries employee identifier Norma Fisher and is affiliated with adaptive-departme-53. This individual does not have university car access but is associated with travel request 100. Account Name, affiliated with distributed-departme-54, does hold university car access and is linked to travel request 101. The naming conventions in this dataset are intentionally fictional, but the structural relationships are operationally significant: every person record points to exactly one office staff role and, when travel is involved, to one travel request.

Office processes define the operational windows within which work occurs.

**Table `office_processes`**

| id | process_type | operating_hours_start | operating_hours_end | is_lunch_break_included | lunch_break_start | lunch_break_end | semester_restriction | office_staff_role_id | document_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | distributed-process-36 | 2025-12-25T11:21:00 | 2023-02-03T01:15:00 | true | 2023-06-23T05:15:00 | 2023-10-10T21:39:00 | regional-semester-42 | 1 | 1 |
| 2 | baseline-process-37 | 2022-05-09T18:38:00 | 2024-07-14T08:32:00 | false | 2024-11-07T12:32:00 | 2024-03-21T04:56:00 | legacy-semester-43 | 2 | 2 |
| 3 | pilot-process-38 | 2023-10-20T01:55:00 | 2025-12-25T15:49:00 | true | 2025-04-18T19:49:00 | 2025-08-05T11:13:00 | compact-semester-44 | 3 | 3 |
| 4 | extended-process-39 | 2024-03-04T08:12:00 | 2022-05-09T22:06:00 | false | 2022-09-02T02:06:00 | 2022-01-16T18:30:00 | composite-semester-45 | 4 | 4 |

Each process has a type designation, operating hours, and a lunch break configuration. The process at index 1, a distributed-process-36, runs from 2025-12-25T11:21:00 through 2023-02-03T01:15:00 and includes a lunch break spanning from 2023-06-23T05:15:00 to 2023-10-10T21:39:00. The semester restriction for this process is regional-semester-42. The process at index 3, a pilot-process-38, operates from 2023-10-20T01:55:00 to 2025-12-25T15:49:00 with a lunch break from 2025-04-18T19:49:00 to 2025-08-05T11:13:00, under the compact-semester-44 restriction. Each process is tied to a specific office staff role and a specific document, creating a chain of accountability.

Documents serve as the central artifacts of the system, linking personnel, processes, copy requests, and postal addresses.

**Table `documents`**

| id | document_type | creation_date | is_copyrighted | has_original_pages | has_copy_count | is_emergency | drop_box_location | person_id | office_process_id | copy_request_form_id | postal_address_id |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | distributed-document-96 | 2022-01-13 | false | 35 | 12 | true | seasonal-drop-65 | 1 | 1 | 1 | 100 |
| 2 | baseline-document-97 | 2023-06-24 | true | 44 | 21 | false | regional-drop-66 | 2 | 2 | 2 | 101 |
| 3 | pilot-document-98 | 2024-11-08 | false | 53 | 30 | true | legacy-drop-67 | 3 | 3 | 3 | 102 |
| 4 | extended-document-99 | 2025-04-19 | true | 62 | 39 | false | compact-drop-68 | 4 | 4 | 4 | 103 |

The document at index 1, a distributed-document-96 created on 2022-01-13, is not copyrighted but carries 35 original pages and 12 copies. It is flagged as an emergency document and is routed to seasonal-drop-65. The person associated with this document is the individual at index 1, and the document is tied to office process 1 and copy request form 1. The document at index 3, a pilot-document-98 created on 2024-11-08, similarly carries 53 original pages and 30 copies, is copyrighted, and is also marked as an emergency document routed to legacy-drop-67.

Copy request forms capture the specifics of duplication work.

**Table `copy_request_forms`**

| id | form_id | copyright_info | original_page_count | copy_count | is_properly_filled | location_in_office | document_id | person_id |
|---|---|---|---|---|---|---|---|---|
| 1 | template_impcode_pagata_20det10 | composite-copyrigh-15 | 23 | 37 | true | compact-location-14 | 1 | 1 |
| 2 | 937744 | primary-copyrigh-16 | 26 | 12 | false | composite-location-15 | 2 | 2 |
| 3 | 1250195 | adaptive-copyrigh-17 | 1 | 49 | true | primary-location-16 | 3 | 3 |
| 4 | 3355762 | distributed-copyrigh-18 | 82 | 10 | false | adaptive-location-17 | 4 | 4 |

The form at index 1, identified by template_impcode_pagata_20det10, references composite-copyrigh-15 for copyright information, specifies 23 original pages and 37 copies, and is marked as properly filled. It is located at compact-location-14 in the office. The form at index 4, identified by 3355762, references distributed-copyrigh-18, specifies 82 original pages and 10 copies, and is marked as improperly filled, located at adaptive-location-17. The is_properly_filled flag is critical for quality assurance audits.

Travel requests document the authorization chain for business travel.

**Table `travel_requests`**

| travel_request_id | request_id | submission_date | meeting_name | requires_absence_authorization | requires_university_car | is_submitted_early | person_id | office_staff_role_id | voucher_id |
|---|---|---|---|---|---|---|---|---|---|
| 100 | 2087732 | 2025-04-24 | Regional Initiative | false | true | true | 1 | 1 | 2986224 |
| 101 | 575213 | 2022-09-08 | Seasonal Model D | true | false | false | 2 | 2 | 5917292 |
| 102 | 103167 | 2023-02-19 | Integrated Cluster | false | true | true | 3 | 3 | 5006456 |
| 103 | 611510 | 2024-07-03 | Extended Review | true | false | false | 4 | 4 | 974947 |

Travel request 100, submitted on 2025-04-24 for the Regional Initiative meeting, does not require absence authorization but does require a university car and was submitted early. It is associated with person 1 and office staff role 1, with voucher 2986224. Travel request 101, submitted on 2022-09-08 for the Seasonal Model D meeting, requires both absence authorization and does not require a university car, and was not submitted early. It is associated with person 2 and office staff role 2, with voucher 5917292.

Travel vouchers provide the financial and administrative closure for travel requests.

**Table `travel_vouchers`**

| voucher_id | submission_date | total_amount | has_all_receipts | missing_receipts_count | is_notarized | travel_request_id | person_id |
|---|---|---|---|---|---|---|---|
| 2986224 | 2025-04-24 | 112.11 | true | 0 | true | 100 | 1 |
| 5917292 | 2022-09-08 | 1,979 | false | 9 | false | 101 | 2 |
| 5006456 | 2023-02-19 | 15,418 | true | 4 | true | 102 | 3 |
| 974947 | 2024-07-03 | 12,579 | false | 1 | false | 103 | 4 |

Postal addresses store the mailing and delivery locations for documents and personnel.

**Table `postal_addresses`**

| id | building_code | room_number | street_address | is_mail_pickup_location | mail_sort_deadline | document_id |
|---|---|---|---|---|---|---|
| 100 | 3990162 | ROO-2106 | composite-street-15 | true | 2023-10-10T21:51:00 | 1 |
| 101 | 5082972 | ROO-2113 | primary-street-16 | false | 2024-03-21T04:08:00 | 2 |
| 102 | 9125624 | ROO-2120 | adaptive-street-17 | true | 2025-08-05T11:25:00 | 3 |
| 103 | 10445626 | ROO-2127 | distributed-street-18 | false | 2022-01-16T18:42:00 | 4 |

With the base tables established, the system provides a series of joined views that answer specific operational questions by combining records across tables. Each view represents a particular analytical lens on the data.

The view vw_office_staff_role_person connects staff roles to the individuals who hold them.

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

This view answers the question of which person occupies which role. Reading the first row, we see that the role titled "Distributed Standard" at composite-office-99 is held by Theodore Mcgrath (employee ID Norma Fisher) of adaptive-departme-53. The second row shows that "Adaptive Framework D" at primary-office-100 is held by Account Name (employee ID Tasha Rodriguez) of distributed-departme-54. This join is the primary lookup for determining personnel assignments.

The view vw_office_staff_role_office_process links roles to the operational processes they support.

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

This view reveals which process each role is responsible for. The first row shows that the "Distributed Standard" role supports distributed-process-36, which operates under the regional-semester-42 restriction. The third row shows that the "Primary Protocol" role supports pilot-process-38 under the compact-semester-44 restriction. This relationship is essential for understanding workload distribution and process coverage.

The view vw_person_office_staff_role presents the same relationship from the person's perspective, showing each individual's role assignment.

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

The first row confirms that Theodore Mcgrath holds the "Distributed Standard" role at composite-office-99 with phone extension integrated-phone-82. The fourth row shows that Norma Fisher holds the "Composite Programme" role at distributed-office-102 with phone extension legacy-phone-85. This view is useful for personnel directories and contact lookup.

The view vw_person_travel_request connects individuals to their travel authorizations.

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

Reading the first row, Theodore Mcgrath is associated with travel request 100 for the Regional Initiative meeting, submitted on 2025-04-24, which requires a university car but not absence authorization. The second row shows Account Name is associated with travel request 101 for the Seasonal Model D meeting, submitted on 2022-09-08, which requires absence authorization but not a university car. This view is critical for travel compliance audits.

The view vw_office_process_office_staff_role presents the process-to-role relationship from the process side.

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

The first row shows that distributed-process-36 is supported by the "Distributed Standard" role at composite-office-99. The second row shows that baseline-process-37 is supported by "Adaptive Framework D" at primary-office-100. This view is useful for process managers who need to identify the staff responsible for each operational window.

The view vw_office_process_document links processes to their associated documents.

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

The first row reveals that distributed-process-36 is associated with distributed-document-96, created on 2022-01-13, which is an emergency document with 35 original pages. The third row shows that pilot-process-38 is associated with pilot-document-98, created on 2024-11-08, also an emergency document with 53 original pages. This view helps trace which documents are produced or managed under each process.

The view vw_document_person connects documents to the individuals responsible for them.

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

The first row shows that distributed-document-96 is associated with Theodore Mcgrath (employee ID Norma Fisher) of adaptive-departme-53. The fourth row shows that extended-document-99 is associated with Norma Fisher (employee ID Peter Mcdowell) of pilot-departme-56. This view is essential for document accountability and ownership tracking.

The view vw_document_office_process presents the document-to-process relationship from the document side.

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

The first row confirms that distributed-document-96 falls under distributed-process-36, which operates from 2025-12-25T11:21:00 to 2023-02-03T01:15:00 with a lunch break included. The second row shows that baseline-document-97 falls under baseline-process-37, which operates without a lunch break. This view is useful for understanding the operational context of each document.

The view vw_document_copy_request_form links documents to their associated copy request forms.

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

The first row shows that distributed-document-96 is linked to copy request form template_impcode_pagata_20det10, which specifies 23 original pages and 37 copies and is properly filled. The third row shows that pilot-document-98 is linked to form 1250195, which specifies 1 original page and 49 copies and is properly filled. This view is critical for copy request auditing and quality control.

The view vw_document_postal_address connects documents to their delivery locations.

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

The first row shows that distributed-document-96 is associated with postal address 100, and the drop box location is seasonal-drop-65. The fourth row shows that extended-document-99 is associated with postal address 103, with drop box compact-drop-68. This view ensures documents are routed to the correct physical locations.

The view vw_copy_request_form_document presents the copy request to document relationship from the form side.

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

The first row shows that form template_impcode_pagata_20det10, located at compact-location-14, requests 37 copies of distributed-document-96. The second row shows that form 937744, located at composite-location-15, requests 12 copies of baseline-document-97 and is marked as improperly filled. This view is useful for copy request management and quality audits.

The view vw_copy_request_form_person links copy request forms to the individuals who submitted them.

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

The first row shows that form template_impcode_pagata_20det10 was submitted by Theodore Mcgrath (employee ID Norma Fisher) of adaptive-departme-53. The fourth row shows that form 3355762 was submitted by Norma Fisher (employee ID Peter Mcdowell) of pilot-departme-56. This view supports accountability for copy requests.

The view vw_travel_request_person connects travel requests to the individuals who made them.

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

The first row shows that travel request 100 for the Regional Initiative meeting was submitted by Theodore Mcgrath (employee ID Norma Fisher) of adaptive-departme-53. The third row shows that travel request 102 for the Integrated Cluster meeting was submitted by Saipan International Airport (employee ID Theodore Mcgrath) of baseline-departme-55. This view is essential for travel tracking and approval workflows.

The view vw_travel_request_office_staff_role links travel requests to the staff roles of the requesters.

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

The first row shows that travel request 100 was submitted by the holder of the "Distributed Standard" role at composite-office-99. The second row shows that travel request 101 was submitted by the holder of "Adaptive Framework D" at primary-office-100. This view helps management understand travel patterns by role and location.

The view vw_travel_request_travel_voucher connects travel requests to their financial vouchers.

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

The first row shows that travel request 100 is associated with voucher 2986224. The fourth row shows that travel request 103 is associated with voucher 974947. This view is critical for financial reconciliation and travel expense tracking.

The view vw_travel_voucher_travel_request presents the voucher-to-request relationship from the voucher side.

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

The first row confirms that voucher 2986224 corresponds to travel request 100 for the Regional Initiative meeting, submitted on 2025-04-24. The second row shows that voucher 5917292 corresponds to travel request 101 for the Seasonal Model D meeting, submitted on 2022-09-08. This view supports financial auditing from the voucher perspective.

The view vw_travel_voucher_person links vouchers to the individuals who traveled.

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

The first row shows that voucher 2986224 is associated with Theodore Mcgrath (employee ID Norma Fisher) of adaptive-departme-53. The third row shows that voucher 5006456 is associated with Saipan International Airport (employee ID Theodore Mcgrath) of baseline-departme-55. This view is essential for expense reporting and reimbursement processing.

The view vw_postal_address_document presents the address-to-document relationship from the address side.

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

The first row shows that postal address 100 is associated with distributed-document-96, an emergency document with 35 original pages routed to seasonal-drop-65. The fourth row shows that postal address 103 is associated with extended-document-99, a non-emergency document with 62 original pages routed to compact-drop-68. This view supports logistics and delivery management.

The system described here integrates personnel management, operational processes, document control, copy request processing, and travel authorization into a single coherent framework. Each table captures a distinct aspect of office operations, and the views provide the analytical lenses needed to understand how these aspects interconnect. Staff roles anchor the organizational structure, processes define the operational context, documents serve as the central artifacts, copy requests manage duplication workflows, and travel records handle logistical authorizations. Together, these records enable comprehensive oversight of office activities, from daily operations to compliance auditing.