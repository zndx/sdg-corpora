## Modelling Administrative Operations as a Normalised Relational Schema

This chapter documents the relational schema that materialises an administrative operations domain. The domain tracks people who hold roles within an organisation, the physical rooms and equipment they occupy, the travel they undertake and the vouchers and receipts that substantiate expenses, and the office service requests they submit. Every entity type is captured in a base table; every many-to-one or many-to-many relationship is expressed as a foreign key or a junction table; and every view is a join that reconstructs a domain fact from the normalised tables.

**Table `administrative_staff_members`**

| id | staff_id | full_name | office_location | phone_number | role_title | department | administrative_role_id | office_room_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 937735 | Theodore Mcgrath | composite-office-99 | PHO-2092 | Distributed Standard | adaptive-departme-89 | 1000 | 1 |
| 2 | 3158139 | Account Name | primary-office-100 | PHO-2093 | Adaptive Framework D | distributed-departme-90 | 1001 | 2 |
| 3 | 8189502 | Saipan International Airport | adaptive-office-101 | PHO-2094 | Primary Protocol | baseline-departme-91 | 1002 | 3 |
| 4 | 69438 | Norma Fisher | distributed-office-102 | PHO-2095 | Composite Programme | pilot-departme-92 | 1003 | 4 |

The `administrative_staff_members` table is the central person entity. Its surrogate primary key `id` (values 1–4) is distinct from the business identifier `staff_id` (e.g. `937735`, `3158139`, `8189502`, `69438`). The column `full_name` carries human-readable identifiers such as `Theodore Mcgrath` and `Account Name`, while `office_location` stores a location code like `composite-office-99`. Contact information is in `phone_number` (`PHO-2092` through `PHO-2095`), and the `department` column holds codes such as `adaptive-departme-89`. The columns `role_title` and `role_category` are denormalised convenience fields that echo the canonical role data stored in the `administrative_roles` table. Two foreign keys anchor this table to the physical and organisational context: `administrative_role_id` references `administrative_roles.administrative_role_id`, and `office_room_id` references `office_rooms.office_room_id`. Row 1, for instance, links staff member `937735` (Theodore Mcgrath) to role `1000` and room `1`.

**Table `administrative_roles`**

| administrative_role_id | role_name | role_category | is_supervisory | reporting_line | administrative_staff_member_id |
|---|---|---|---|---|---|
| 1000 | Seasonal Programme | adaptive-role-83 | true | pilot-reportin-32 | 1 |
| 1001 | Integrated Standard | distributed-role-84 | false | extended-reportin-33 | 2 |
| 1002 | Extended Framework D | baseline-role-85 | true | integrated-reportin-34 | 3 |
| 1003 | Pilot Protocol | pilot-role-86 | false | seasonal-reportin-35 | 4 |

The `administrative_roles` table defines the role entity independently of any single person. Its primary key `administrative_role_id` (1000–1003) is a business key, while `role_name` stores values like `Seasonal Programme` and `Integrated Standard`. The boolean column `is_supervisory` distinguishes supervisory roles (`true` for `Seasonal Programme` and `Extended Framework D`) from non-supervisory ones (`false` for `Integrated Standard` and `Pilot Protocol`). The `reporting_line` column carries codes such as `pilot-reportin-32`. Crucially, the foreign key `administrative_staff_member_id` creates a back-reference to `administrative_staff_members.id`, establishing a bidirectional association: each staff member holds one role, and each role is held by one staff member in this dataset.

**Table `office_rooms`**

| office_room_id | room_number | building_name | floor_number | room_type | is_locked | office_equipment_id | administrative_staff_member_id |
|---|---|---|---|---|---|---|---|
| 1 | ROO-2106 | Compact Initiative | 10 | legacy-room-25 | true | 1 | 1 |
| 2 | ROO-2113 | Legacy Model | 14 | compact-room-26 | false | 2 | 2 |
| 3 | ROO-2120 | Regional Cluster A | 18 | composite-room-27 | true | 3 | 3 |
| 4 | ROO-2127 | Seasonal Review | 22 | primary-room-28 | false | 4 | 4 |

Office rooms are modelled in `office_rooms`. The surrogate key `office_room_id` (1–4) maps to the business identifier `room_number` (`ROO-2106` through `ROO-2127`). The `building_name` column stores values like `Compact Initiative` and `Legacy Model`, while `floor_number` ranges from 10 to 22. The `room_type` column carries codes such as `legacy-room-25`, and `is_locked` is a boolean flag. Two foreign keys are present: `office_equipment_id` references `office_equipments.id`, and `administrative_staff_member_id` references `administrative_staff_members.id`. Room `1` (ROO-2106) is locked, assigned to staff member `1`, and linked to equipment `1`.

**Table `office_equipments`**

| id | equipment_id | equipment_type | location_room | is_restricted | maintenance_status | office_room_id | administrative_staff_member_id |
|---|---|---|---|---|---|---|---|
| 1 | 128 | integrated-equipmen-58 | baseline-location-97 | false | extended-maintena-33 | 1 | 1 |
| 2 | lu_tax_code_template_m_I_2 | seasonal-equipmen-59 | pilot-location-98 | true | integrated-maintena-34 | 2 | 2 |
| 3 | 1336190 | regional-equipmen-60 | extended-location-99 | false | seasonal-maintena-35 | 3 | 3 |
| 4 | 611514 | legacy-equipmen-61 | integrated-location-100 | true | regional-maintena-36 | 4 | 4 |

The `office_equipments` table captures physical assets. Its surrogate primary key `id` (1–4) is distinct from the business identifier `equipment_id` (e.g. `128`, `lu_tax_code_template_m_I_2`, `1336190`, `611514`). The `equipment_type` column holds codes like `integrated-equipmen-58` and `seasonal-equipmen-59`. The `location_room` column stores location codes such as `baseline-location-97`, while `is_restricted` is a boolean flag. The `maintenance_status` column carries codes like `extended-maintena-33`. Foreign keys `office_room_id` and `administrative_staff_member_id` anchor each equipment item to a room and a person. Equipment `1` (ID `128`) is located in room `1` and assigned to staff member `1`.

**Table `travel_requests`**

| id | request_id | submission_date | travel_purpose | destination | funding_source | approval_status | is_emergency | administrative_staff_member_id | processed_by_administrative_staff_member_id | travel_voucher_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 2087732 | 2025-04-24T03:57:00 | legacy-travel-43 | seasonal-destinat-53 | baseline-funding-73 | adaptive-approval-65 | true | 1 | 1 | 1000 |
| 2 | 575213 | 2022-09-08T10:14:00 | compact-travel-44 | regional-destinat-54 | pilot-funding-74 | distributed-approval-66 | false | 2 | 2 | 1001 |
| 3 | 103167 | 2023-02-19T17:31:00 | composite-travel-45 | legacy-destinat-55 | extended-funding-75 | baseline-approval-67 | true | 3 | 3 | 1002 |
| 4 | 611510 | 2024-07-03T00:48:00 | primary-travel-46 | compact-destinat-56 | integrated-funding-76 | pilot-approval-68 | false | 4 | 4 | 1003 |

Travel requests are captured in `travel_requests`. The surrogate key `id` (1–4) is distinct from the business identifier `request_id` (e.g. `2087732`, `575213`, `103167`, `611510`). The `submission_date` column stores ISO timestamps such as `2025-04-24T03:57:00`. The `travel_purpose` column carries codes like `legacy-travel-43`, and `destination` stores codes such as `seasonal-destinat-53`. The `funding_source` column holds codes like `baseline-funding-73`, while `approval_status` carries codes such as `adaptive-approval-65`. The boolean `is_emergency` flag is `true` for requests 1 and 3, and `false` for requests 2 and 4. Three foreign keys are present: `administrative_staff_member_id` references the requester, `processed_by_administrative_staff_member_id` references the approver (in this dataset both point to the same staff member), and `travel_voucher_id` references `travel_vouchers.id`. Request 1 (ID `2087732`) was submitted on `2025-04-24`, is marked as emergency travel to `seasonal-destinat-53`, and is linked to voucher `1000`.

**Table `travel_vouchers`**

| id | voucher_id | submission_date | total_amount | currency | is_notarized | receipt_count | administrative_staff_member_id | travel_request_id | created_at |
|---|---|---|---|---|---|---|---|---|---|
| 1000 | 2986224 | 2025-04-24T03:57:00 | 112.11 | seasonal-currency-71 | true | 28 | 1 | 1 | 2025-01-01 00:14:00 |
| 1001 | 5917292 | 2022-09-08T10:14:00 | 1,979 | regional-currency-72 | false | 10 | 2 | 2 | 2025-02-06 03:14:00 |
| 1002 | 5006456 | 2023-02-19T17:31:00 | 15,418 | legacy-currency-73 | true | 65 | 3 | 3 | 2025-03-11 06:14:00 |
| 1003 | 974947 | 2024-07-03T00:48:00 | 12,579 | compact-currency-74 | false | 83 | 4 | 4 | 2025-04-16 09:14:00 |

The `travel_vouchers` table records the financial substantiation of travel. Its surrogate key `id` (1000–1003) is the business identifier `voucher_id` (e.g. `2986224`, `5917292`, `5006456`, `974947`). The `submission_date` column stores timestamps, and `total_amount` carries monetary values such as `112.11`, `1,979`, `15,418`, and `12,579`. The `currency` column holds codes like `seasonal-currency-71`. The boolean `is_notarized` is `true` for vouchers 1000 and 1002, and `false` for 1001 and 1003. The integer `receipt_count` records the number of receipts (28, 10, 65, 83). The `created_at` column stores timestamps like `2025-01-01 00:14:00`. Two foreign keys anchor the voucher: `administrative_staff_member_id` references the claimant, and `travel_request_id` references the originating request. Voucher `1000` (ID `2986224`) has a total of `112.11`, is notarized, and contains 28 receipts.

**Table `receipts`**

| receipt_id | issue_date | vendor_name | expense_amount | expense_category | is_original | travel_voucher_id |
|---|---|---|---|---|---|---|
| 21087064 | 2023-02-01 | Microsoft Corporation | 215,884 | integrated-expense-16 | false | 1000 |
| 32824 | 2024-07-12 | PureCycle Technologies. | 42,370 | seasonal-expense-17 | true | 1001 |
| 1366db3e-8fcc-11eb-924d-9cd76263cbd0 | 2025-12-23 | American International Group | 2,126 | regional-expense-18 | false | 1002 |
| 605943 | 2022-05-07 | American Airlines Group | 1,862 | legacy-expense-19 | true | 1003 |

Individual receipts are stored in `receipts`. The surrogate key `id` (1–4) is distinct from the business identifier `receipt_id` (e.g. `2087732`, `575213`, `103167`, `611510`). The `receipt_date` column stores dates such as `2025-04-24`. The `amount` column carries monetary values like `112.11`, `1,979`, `15,418`, and `12,579`. The `category` column holds codes such as `seasonal-category-77`, and `description` stores free-text like `Seasonal Expense` and `Regional Expense`. The foreign key `travel_voucher_id` links each receipt to its parent voucher. Receipt 1 (ID `2087732`) is dated `2025-04-24`, amounts to `112.11`, and belongs to voucher `1000`.

**Table `office_service_requests`**

| id | request_id | submission_date | service_type | page_count | is_copyrighted | estimated_completion_time | is_emergency | administrative_staff_member_id | processed_by_administrative_staff_member_id | form_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1000 | 2087732 | 2025-04-24T03:57:00 | composite-service-81 | 6 | false | composite-estimate-57 | true | 1 | 1 | template_impcode_pagata_20det10 |
| 1001 | 575213 | 2022-09-08T10:14:00 | primary-service-82 | 7 | true | primary-estimate-58 | false | 2 | 2 | 937744 |
| 1002 | 103167 | 2023-02-19T17:31:00 | adaptive-service-83 | 0 | false | adaptive-estimate-59 | true | 3 | 3 | 1250195 |
| 1003 | 611510 | 2024-07-03T00:48:00 | distributed-service-84 | 15 | true | distributed-estimate-60 | false | 4 | 4 | 3355762 |

Office service requests are captured in `office_service_requests`. The surrogate key `id` (1–4) is distinct from the business identifier `service_request_id` (e.g. `2087732`, `575213`, `103167`, `611510`). The `request_date` column stores dates such as `2025-04-24`. The `service_type` column carries codes like `seasonal-service-83`, and `priority` holds codes such as `seasonal-priority-84`. The `status` column stores codes like `adaptive-status-85`. The foreign key `administrative_staff_member_id` references the requester. Service request 1 (ID `2087732`) is of type `seasonal-service-83`, has priority `seasonal-priority-84`, and is submitted by staff member `1`.

**Table `request_forms`**

| form_id | form_type | is_complete | copyright_info_provided | location_in_office | office_service_request_id |
|---|---|---|---|---|---|
| template_impcode_pagata_20det10 | legacy-form-61 | false | false | compact-location-14 | 1000 |
| 937744 | compact-form-62 | true | true | composite-location-15 | 1001 |
| 1250195 | composite-form-63 | false | false | primary-location-16 | 1002 |
| 3355762 | primary-form-64 | true | true | adaptive-location-17 | 1003 |

Request forms are stored in `request_forms`. The surrogate key `id` (1–4) is distinct from the business identifier `form_id` (e.g. `2087732`, `575213`, `103167`, `611510`). The `form_type` column holds codes like `seasonal-form-89`, and `submission_date` stores dates such as `2025-04-24`. The `status` column carries codes such as `adaptive-status-85`. The foreign key `office_service_request_id` links each form to its parent service request. Form 1 (ID `2087732`) is of type `seasonal-form-89`, was submitted on `2025-04-24`, and is linked to service request `1`.

**Table `vouchers_receipts`**

| travel_voucher_id | receipt_id |
|---|---|
| 1000 | 21087064 |
| 1000 | 32824 |
| 1001 | 32824 |
| 1001 | 1366db3e-8fcc-11eb-924d-9cd76263cbd0 |
| 1002 | 1366db3e-8fcc-11eb-924d-9cd76263cbd0 |
| 1002 | 605943 |
| 1003 | 605943 |
| 1003 | 21087064 |

The `vouchers_receipts` table is a junction table that resolves the many-to-many relationship between `travel_vouchers` and `receipts`. It contains two foreign keys: `voucher_id` references `travel_vouchers.id`, and `receipt_id` references `receipts.id`. In this dataset, voucher `1000` is associated with receipt `1`, voucher `1001` with receipt `2`, and so on. This table enables the reconstruction of which receipts substantiate which vouchers, a fact that cannot be expressed through a single foreign key alone.

### Views as Reconstructed Domain Facts

Each view is a `SELECT` join that materialises a domain fact from the normalised tables. The following sections interpret what question each view answers and read concrete rows as evidence.

**View `v_administrative_staff_member_administrative_role`**

```sql
CREATE VIEW v_administrative_staff_member_administrative_role AS
SELECT a.id, a.staff_id, a.full_name, a.office_location, b.administrative_role_id AS role_administrative_role_id, b.role_name AS role_role_name, b.role_category AS role_role_category
FROM administrative_staff_members a JOIN administrative_roles b ON a.administrative_role_id = b.administrative_role_id;
```

| id | staff_id | full_name | office_location | role_administrative_role_id | role_role_name | role_role_category |
|---|---|---|---|---|---|---|
| 1 | 937735 | Theodore Mcgrath | composite-office-99 | 1000 | Seasonal Programme | adaptive-role-83 |
| 2 | 3158139 | Account Name | primary-office-100 | 1001 | Integrated Standard | distributed-role-84 |
| 3 | 8189502 | Saipan International Airport | adaptive-office-101 | 1002 | Extended Framework D | baseline-role-85 |
| 4 | 69438 | Norma Fisher | distributed-office-102 | 1003 | Pilot Protocol | pilot-role-86 |

This view joins `administrative_staff_members` to `administrative_roles` on `administrative_staff_members.administrative_role_id = administrative_roles.administrative_role_id`. It answers the question: "What role does each staff member hold?" Row 1 shows staff member `937735` (Theodore Mcgrath) holding role `1000` (`Seasonal Programme`), which is a supervisory role in the `pilot-reportin-32` reporting line.

**View `v_administrative_staff_member_office_room`**

```sql
CREATE VIEW v_administrative_staff_member_office_room AS
SELECT a.id, a.staff_id, a.full_name, a.office_location, b.office_room_id AS room_office_room_id, b.room_number AS room_room_number, b.building_name AS room_building_name
FROM administrative_staff_members a JOIN office_rooms b ON a.office_room_id = b.office_room_id;
```

| id | staff_id | full_name | office_location | room_office_room_id | room_room_number | room_building_name |
|---|---|---|---|---|---|---|
| 1 | 937735 | Theodore Mcgrath | composite-office-99 | 1 | ROO-2106 | Compact Initiative |
| 2 | 3158139 | Account Name | primary-office-100 | 2 | ROO-2113 | Legacy Model |
| 3 | 8189502 | Saipan International Airport | adaptive-office-101 | 3 | ROO-2120 | Regional Cluster A |
| 4 | 69438 | Norma Fisher | distributed-office-102 | 4 | ROO-2127 | Seasonal Review |

This view joins `administrative_staff_members` to `office_rooms` on `administrative_staff_members.office_room_id = office_rooms.office_room_id`. It answers: "Which office room is assigned to each staff member?" Row 1 shows staff member `937735` assigned to room `ROO-2106` in building `Compact Initiative` on floor `10`, which is locked.

**View `v_administrative_role_administrative_staff_member`**

```sql
CREATE VIEW v_administrative_role_administrative_staff_member AS
SELECT a.administrative_role_id, a.role_name, a.role_category, a.is_supervisory, b.id AS member_id, b.staff_id AS member_staff_id, b.full_name AS member_full_name
FROM administrative_roles a JOIN administrative_staff_members b ON a.administrative_staff_member_id = b.id;
```

| administrative_role_id | role_name | role_category | is_supervisory | member_id | member_staff_id | member_full_name |
|---|---|---|---|---|---|---|
| 1000 | Seasonal Programme | adaptive-role-83 | true | 1 | 937735 | Theodore Mcgrath |
| 1001 | Integrated Standard | distributed-role-84 | false | 2 | 3158139 | Account Name |
| 1002 | Extended Framework D | baseline-role-85 | true | 3 | 8189502 | Saipan International Airport |
| 1003 | Pilot Protocol | pilot-role-86 | false | 4 | 69438 | Norma Fisher |

This view joins `administrative_roles` to `administrative_staff_members` on `administrative_roles.administrative_staff_member_id = administrative_staff_members.id`. It answers the inverse question: "Which staff member holds each role?" Row 1 shows role `1000` (`Seasonal Programme`) is held by staff member `937735` (Theodore Mcgrath).

**View `v_office_room_office_equipment`**

```sql
CREATE VIEW v_office_room_office_equipment AS
SELECT a.office_room_id, a.room_number, a.building_name, a.floor_number, b.id AS equipment_id, b.equipment_id AS equipment_equipment_id, b.equipment_type AS equipment_equipment_type
FROM office_rooms a JOIN office_equipments b ON a.office_equipment_id = b.id;
```

| office_room_id | room_number | building_name | floor_number | equipment_id | equipment_equipment_id | equipment_equipment_type |
|---|---|---|---|---|---|---|
| 1 | ROO-2106 | Compact Initiative | 10 | 1 | 128 | integrated-equipmen-58 |
| 2 | ROO-2113 | Legacy Model | 14 | 2 | lu_tax_code_template_m_I_2 | seasonal-equipmen-59 |
| 3 | ROO-2120 | Regional Cluster A | 18 | 3 | 1336190 | regional-equipmen-60 |
| 4 | ROO-2127 | Seasonal Review | 22 | 4 | 611514 | legacy-equipmen-61 |

This view joins `office_rooms` to `office_equipments` on `office_rooms.office_equipment_id = office_equipments.id`. It answers: "What equipment is located in each office room?" Row 1 shows room `ROO-2106` contains equipment `128` (`integrated-equipmen-58`), which is not restricted and has maintenance status `extended-maintena-33`.

**View `v_office_room_administrative_staff_member`**

```sql
CREATE VIEW v_office_room_administrative_staff_member AS
SELECT a.office_room_id, a.room_number, a.building_name, a.floor_number, b.id AS member_id, b.staff_id AS member_staff_id, b.full_name AS member_full_name
FROM office_rooms a JOIN administrative_staff_members b ON a.administrative_staff_member_id = b.id;
```

| office_room_id | room_number | building_name | floor_number | member_id | member_staff_id | member_full_name |
|---|---|---|---|---|---|---|
| 1 | ROO-2106 | Compact Initiative | 10 | 1 | 937735 | Theodore Mcgrath |
| 2 | ROO-2113 | Legacy Model | 14 | 2 | 3158139 | Account Name |
| 3 | ROO-2120 | Regional Cluster A | 18 | 3 | 8189502 | Saipan International Airport |
| 4 | ROO-2127 | Seasonal Review | 22 | 4 | 69438 | Norma Fisher |

This view joins `office_rooms` to `administrative_staff_members` on `office_rooms.administrative_staff_member_id = administrative_staff_members.id`. It answers: "Which staff member is assigned to each office room?" Row 1 shows room `ROO-2106` is assigned to staff member `937735` (Theodore Mcgrath).

**View `v_office_equipment_office_room`**

```sql
CREATE VIEW v_office_equipment_office_room AS
SELECT a.id, a.equipment_id, a.equipment_type, a.location_room, b.office_room_id AS room_office_room_id, b.room_number AS room_room_number, b.building_name AS room_building_name
FROM office_equipments a JOIN office_rooms b ON a.office_room_id = b.office_room_id;
```

| id | equipment_id | equipment_type | location_room | room_office_room_id | room_room_number | room_building_name |
|---|---|---|---|---|---|---|
| 1 | 128 | integrated-equipmen-58 | baseline-location-97 | 1 | ROO-2106 | Compact Initiative |
| 2 | lu_tax_code_template_m_I_2 | seasonal-equipmen-59 | pilot-location-98 | 2 | ROO-2113 | Legacy Model |
| 3 | 1336190 | regional-equipmen-60 | extended-location-99 | 3 | ROO-2120 | Regional Cluster A |
| 4 | 611514 | legacy-equipmen-61 | integrated-location-100 | 4 | ROO-2127 | Seasonal Review |

This view joins `office_equipments` to `office_rooms` on `office_equipments.office_room_id = office_rooms.office_room_id`. It answers the inverse: "Which room contains each equipment item?" Row 1 shows equipment `128` is located in room `ROO-2106`.

**View `v_office_equipment_administrative_staff_member`**

```sql
CREATE VIEW v_office_equipment_administrative_staff_member AS
SELECT a.id, a.equipment_id, a.equipment_type, a.location_room, b.id AS member_id, b.staff_id AS member_staff_id, b.full_name AS member_full_name
FROM office_equipments a JOIN administrative_staff_members b ON a.administrative_staff_member_id = b.id;
```

| id | equipment_id | equipment_type | location_room | member_id | member_staff_id | member_full_name |
|---|---|---|---|---|---|---|
| 1 | 128 | integrated-equipmen-58 | baseline-location-97 | 1 | 937735 | Theodore Mcgrath |
| 2 | lu_tax_code_template_m_I_2 | seasonal-equipmen-59 | pilot-location-98 | 2 | 3158139 | Account Name |
| 3 | 1336190 | regional-equipmen-60 | extended-location-99 | 3 | 8189502 | Saipan International Airport |
| 4 | 611514 | legacy-equipmen-61 | integrated-location-100 | 4 | 69438 | Norma Fisher |

This view joins `office_equipments` to `administrative_staff_members` on `office_equipments.administrative_staff_member_id = administrative_staff_members.id`. It answers: "Which staff member is responsible for each equipment item?" Row 1 shows equipment `128` is assigned to staff member `937735`.

**View `v_travel_request_administrative_staff_member`**

```sql
CREATE VIEW v_travel_request_administrative_staff_member AS
SELECT a.id, a.request_id, a.submission_date, a.travel_purpose, b.id AS member_id, b.staff_id AS member_staff_id, b.full_name AS member_full_name
FROM travel_requests a JOIN administrative_staff_members b ON a.administrative_staff_member_id = b.id;
```

| id | request_id | submission_date | travel_purpose | member_id | member_staff_id | member_full_name |
|---|---|---|---|---|---|---|
| 1 | 2087732 | 2025-04-24T03:57:00 | legacy-travel-43 | 1 | 937735 | Theodore Mcgrath |
| 2 | 575213 | 2022-09-08T10:14:00 | compact-travel-44 | 2 | 3158139 | Account Name |
| 3 | 103167 | 2023-02-19T17:31:00 | composite-travel-45 | 3 | 8189502 | Saipan International Airport |
| 4 | 611510 | 2024-07-03T00:48:00 | primary-travel-46 | 4 | 69438 | Norma Fisher |

This view joins `travel_requests` to `administrative_staff_members` on `travel_requests.administrative_staff_member_id = administrative_staff_members.id`. It answers: "Who submitted each travel request?" Row 1 shows request `2087732` was submitted by staff member `937735` (Theodore Mcgrath) on `2025-04-24` for emergency travel to `seasonal-destinat-53`.

**View `v_travel_request_travel_voucher`**

```sql
CREATE VIEW v_travel_request_travel_voucher AS
SELECT a.id, a.request_id, a.submission_date, a.travel_purpose, b.id AS voucher_id, b.voucher_id AS voucher_voucher_id, b.submission_date AS voucher_submission_date
FROM travel_requests a JOIN travel_vouchers b ON a.travel_voucher_id = b.id;
```

| id | request_id | submission_date | travel_purpose | voucher_id | voucher_voucher_id | voucher_submission_date |
|---|---|---|---|---|---|---|
| 1 | 2087732 | 2025-04-24T03:57:00 | legacy-travel-43 | 1000 | 2986224 | 2025-04-24T03:57:00 |
| 2 | 575213 | 2022-09-08T10:14:00 | compact-travel-44 | 1001 | 5917292 | 2022-09-08T10:14:00 |
| 3 | 103167 | 2023-02-19T17:31:00 | composite-travel-45 | 1002 | 5006456 | 2023-02-19T17:31:00 |
| 4 | 611510 | 2024-07-03T00:48:00 | primary-travel-46 | 1003 | 974947 | 2024-07-03T00:48:00 |

This view joins `travel_requests` to `travel_vouchers` on `travel_requests.travel_voucher_id = travel_vouchers.id`. It answers: "Which voucher substantiates each travel request?" Row 1 shows request `2087732` is substantiated by voucher `2986224` with a total amount of `112.11` and 28 receipts.

**View `v_travel_voucher_administrative_staff_member`**

```sql
CREATE VIEW v_travel_voucher_administrative_staff_member AS
SELECT a.id, a.voucher_id, a.submission_date, a.total_amount, b.id AS member_id, b.staff_id AS member_staff_id, b.full_name AS member_full_name
FROM travel_vouchers a JOIN administrative_staff_members b ON a.administrative_staff_member_id = b.id;
```

| id | voucher_id | submission_date | total_amount | member_id | member_staff_id | member_full_name |
|---|---|---|---|---|---|---|
| 1000 | 2986224 | 2025-04-24T03:57:00 | 112.11 | 1 | 937735 | Theodore Mcgrath |
| 1001 | 5917292 | 2022-09-08T10:14:00 | 1,979 | 2 | 3158139 | Account Name |
| 1002 | 5006456 | 2023-02-19T17:31:00 | 15,418 | 3 | 8189502 | Saipan International Airport |
| 1003 | 974947 | 2024-07-03T00:48:00 | 12,579 | 4 | 69438 | Norma Fisher |

This view joins `travel_vouchers` to `administrative_staff_members` on `travel_vouchers.administrative_staff_member_id = administrative_staff_members.id`. It answers: "Which staff member filed each travel voucher?" Row 1 shows voucher `2986224` was filed by staff member `937735` (Theodore Mcgrath).

**View `v_travel_voucher_travel_request`**

```sql
CREATE VIEW v_travel_voucher_travel_request AS
SELECT a.id, a.voucher_id, a.submission_date, a.total_amount, b.id AS request_id, b.request_id AS request_request_id, b.submission_date AS request_submission_date
FROM travel_vouchers a JOIN travel_requests b ON a.travel_request_id = b.id;
```

| id | voucher_id | submission_date | total_amount | request_id | request_request_id | request_submission_date |
|---|---|---|---|---|---|---|
| 1000 | 2986224 | 2025-04-24T03:57:00 | 112.11 | 1 | 2087732 | 2025-04-24T03:57:00 |
| 1001 | 5917292 | 2022-09-08T10:14:00 | 1,979 | 2 | 575213 | 2022-09-08T10:14:00 |
| 1002 | 5006456 | 2023-02-19T17:31:00 | 15,418 | 3 | 103167 | 2023-02-19T17:31:00 |
| 1003 | 974947 | 2024-07-03T00:48:00 | 12,579 | 4 | 611510 | 2024-07-03T00:48:00 |

This view joins `travel_vouchers` to `travel_requests` on `travel_vouchers.travel_request_id = travel_requests.id`. It answers the inverse: "Which travel request generated each voucher?" Row 1 shows voucher `2986224` was generated by request `2087732`.

**View `v_travel_voucher_receipt_detail`**

```sql
CREATE VIEW v_travel_voucher_receipt_detail AS
SELECT a.id, a.voucher_id, a.submission_date, b.receipt_id AS receipt_receipt_id, b.issue_date AS receipt_issue_date, b.vendor_name AS receipt_vendor_name
FROM travel_vouchers a
  JOIN vouchers_receipts j ON j.travel_voucher_id = a.id
  JOIN receipts b ON b.receipt_id = j.receipt_id;
```

| id | voucher_id | submission_date | receipt_receipt_id | receipt_issue_date | receipt_vendor_name |
|---|---|---|---|---|---|
| 1000 | 2986224 | 2025-04-24T03:57:00 | 21087064 | 2023-02-01 | Microsoft Corporation |
| 1000 | 2986224 | 2025-04-24T03:57:00 | 32824 | 2024-07-12 | PureCycle Technologies. |
| 1001 | 5917292 | 2022-09-08T10:14:00 | 32824 | 2024-07-12 | PureCycle Technologies. |
| 1001 | 5917292 | 2022-09-08T10:14:00 | 1366db3e-8fcc-11eb-924d-9cd76263cbd0 | 2025-12-23 | American International Group |
| 1002 | 5006456 | 2023-02-19T17:31:00 | 1366db3e-8fcc-11eb-924d-9cd76263cbd0 | 2025-12-23 | American International Group |
| 1002 | 5006456 | 2023-02-19T17:31:00 | 605943 | 2022-05-07 | American Airlines Group |
| 1003 | 974947 | 2024-07-03T00:48:00 | 605943 | 2022-05-07 | American Airlines Group |
| 1003 | 974947 | 2024-07-03T00:48:00 | 21087064 | 2023-02-01 | Microsoft Corporation |

This view joins `travel_vouchers` to `receipts` through the `vouchers_receipts` junction table. It answers: "Which receipts substantiate each travel voucher?" Row 1 shows voucher `2986224` is substantiated by receipt `2087732` dated `2025-04-24` with amount `112.11`.

**View `v_receipt_travel_voucher`**

```sql
CREATE VIEW v_receipt_travel_voucher AS
SELECT a.receipt_id, a.issue_date, a.vendor_name, a.expense_amount, b.id AS voucher_id, b.voucher_id AS voucher_voucher_id, b.submission_date AS voucher_submission_date
FROM receipts a JOIN travel_vouchers b ON a.travel_voucher_id = b.id;
```

| receipt_id | issue_date | vendor_name | expense_amount | voucher_id | voucher_voucher_id | voucher_submission_date |
|---|---|---|---|---|---|---|
| 21087064 | 2023-02-01 | Microsoft Corporation | 215,884 | 1000 | 2986224 | 2025-04-24T03:57:00 |
| 32824 | 2024-07-12 | PureCycle Technologies. | 42,370 | 1001 | 5917292 | 2022-09-08T10:14:00 |
| 1366db3e-8fcc-11eb-924d-9cd76263cbd0 | 2025-12-23 | American International Group | 2,126 | 1002 | 5006456 | 2023-02-19T17:31:00 |
| 605943 | 2022-05-07 | American Airlines Group | 1,862 | 1003 | 974947 | 2024-07-03T00:48:00 |

This view joins `receipts` to `travel_vouchers` through the `vouchers_receipts` junction table. It answers the inverse: "Which travel voucher does each receipt belong to?" Row 1 shows receipt `2087732` belongs to voucher `2986224`.

**View `v_office_service_request_administrative_staff_member`**

```sql
CREATE VIEW v_office_service_request_administrative_staff_member AS
SELECT a.id, a.request_id, a.submission_date, a.service_type, b.id AS member_id, b.staff_id AS member_staff_id, b.full_name AS member_full_name
FROM office_service_requests a JOIN administrative_staff_members b ON a.administrative_staff_member_id = b.id;
```

| id | request_id | submission_date | service_type | member_id | member_staff_id | member_full_name |
|---|---|---|---|---|---|---|
| 1000 | 2087732 | 2025-04-24T03:57:00 | composite-service-81 | 1 | 937735 | Theodore Mcgrath |
| 1001 | 575213 | 2022-09-08T10:14:00 | primary-service-82 | 2 | 3158139 | Account Name |
| 1002 | 103167 | 2023-02-19T17:31:00 | adaptive-service-83 | 3 | 8189502 | Saipan International Airport |
| 1003 | 611510 | 2024-07-03T00:48:00 | distributed-service-84 | 4 | 69438 | Norma Fisher |

This view joins `office_service_requests` to `administrative_staff_members` on `office_service_requests.administrative_staff_member_id = administrative_staff_members.id`. It answers: "Who submitted each office service request?" Row 1 shows service request `2087732` was submitted by staff member `937735` (Theodore Mcgrath).

**View `v_office_service_request_request_form`**

```sql
CREATE VIEW v_office_service_request_request_form AS
SELECT a.id, a.request_id, a.submission_date, a.service_type, b.form_id AS form_form_id, b.form_type AS form_form_type, b.is_complete AS form_is_complete
FROM office_service_requests a JOIN request_forms b ON a.form_id = b.form_id;
```

| id | request_id | submission_date | service_type | form_form_id | form_form_type | form_is_complete |
|---|---|---|---|---|---|---|
| 1000 | 2087732 | 2025-04-24T03:57:00 | composite-service-81 | template_impcode_pagata_20det10 | legacy-form-61 | false |
| 1001 | 575213 | 2022-09-08T10:14:00 | primary-service-82 | 937744 | compact-form-62 | true |
| 1002 | 103167 | 2023-02-19T17:31:00 | adaptive-service-83 | 1250195 | composite-form-63 | false |
| 1003 | 611510 | 2024-07-03T00:48:00 | distributed-service-84 | 3355762 | primary-form-64 | true |

This view joins `office_service_requests` to `request_forms` on `office_service_requests.id = request_forms.office_service_request_id`. It answers: "Which request forms are associated with each service request?" Row 1 shows service request `2087732` is associated with form `2087732` of type `seasonal-form-89`.

**View `v_request_form_office_service_request`**

```sql
CREATE VIEW v_request_form_office_service_request AS
SELECT a.form_id, a.form_type, a.is_complete, a.copyright_info_provided, b.id AS request_id, b.request_id AS request_request_id, b.submission_date AS request_submission_date
FROM request_forms a JOIN office_service_requests b ON a.office_service_request_id = b.id;
```

| form_id | form_type | is_complete | copyright_info_provided | request_id | request_request_id | request_submission_date |
|---|---|---|---|---|---|---|
| template_impcode_pagata_20det10 | legacy-form-61 | false | false | 1000 | 2087732 | 2025-04-24T03:57:00 |
| 937744 | compact-form-62 | true | true | 1001 | 575213 | 2022-09-08T10:14:00 |
| 1250195 | composite-form-63 | false | false | 1002 | 103167 | 2023-02-19T17:31:00 |
| 3355762 | primary-form-64 | true | true | 1003 | 611510 | 2024-07-03T00:48:00 |

This view joins `request_forms` to `office_service_requests` on `request_forms.office_service_request_id = office_service_requests.id`. It answers the inverse: "Which service request does each request form belong to?" Row 1 shows form `2087732` belongs to service request `2087732`.

### Synthesis

The schema models five entity types — staff members, roles, office rooms, equipment, and travel documents (requests, vouchers, receipts) — plus two service-request entities. Relationships are expressed through foreign keys that enforce cardinality constraints: each staff member holds one role and occupies one room; each room contains one equipment item and is assigned to one staff member; each travel request generates one voucher; each voucher is substantiated by many receipts through the `vouchers_receipts` junction table. The views are not additional storage but declarative joins that reconstruct domain facts — who holds which role, which room contains which equipment, which receipts substantiate which voucher — from the normalised base tables. This separation of concerns between storage (normalised tables with explicit foreign keys) and access (views that materialise business questions) is the hallmark of a well-designed relational schema.