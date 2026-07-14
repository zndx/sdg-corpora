Administrative operations within modern organizations demand rigorous coordination across personnel management, facility allocation, and travel logistics. Every department requires a structured system for tracking who holds which role, which office spaces are assigned to whom, what equipment resides in each room, and how travel expenditures are authorized, documented, and reconciled. The records described here capture the full lifecycle of these administrative processes—from initial role assignment and office assignment through travel request submission, voucher creation, receipt collection, and final reconciliation. Each record carries identifiers that link personnel to their roles, their rooms, their equipment, and their travel activities, forming an interconnected web of operational accountability.

## Administrative Personnel and Role Management

The foundation of any administrative operation is a clear roster of personnel and their assigned responsibilities. The administrative staff members table records each individual with a unique internal identifier, a staff number, a full name, an office location designation, a phone number, a role title, a department assignment, and foreign keys linking to their specific administrative role and assigned office room.

**Table `administrative_staff_members`**

| id | staff_id | full_name | office_location | phone_number | role_title | department | administrative_role_id | office_room_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 937735 | Theodore Mcgrath | composite-office-99 | PHO-2092 | Distributed Standard | adaptive-departme-89 | 1000 | 1 |
| 2 | 3158139 | Account Name | primary-office-100 | PHO-2093 | Adaptive Framework D | distributed-departme-90 | 1001 | 2 |
| 3 | 8189502 | Saipan International Airport | adaptive-office-101 | PHO-2094 | Primary Protocol | baseline-departme-91 | 1002 | 3 |
| 4 | 69438 | Norma Fisher | distributed-office-102 | PHO-2095 | Composite Programme | pilot-departme-92 | 1003 | 4 |

Consider the first record: Theodore Mcgrath, staff number 937735, is located at composite-office-99 and can be reached at PHO-2092. He holds the role title Distributed Standard within the adaptive-departme-89 department and is linked to administrative role 1000 and office room 1. The second record, labeled Account Name with staff number 3158139, operates from primary-office-100 under the adaptive framework designation within distributed-departme-90. Saipan International Airport, staff number 8189502, occupies adaptive-office-101 with the role title Primary Protocol in baseline-departme-91. Norma Fisher, staff number 69438, is stationed at distributed-office-102 as a Composite Programme operator within pilot-departme-92.

The administrative roles table defines the organizational structure that staff members inhabit. Each role carries an identifier, a name, a category, a supervisory flag, a reporting line, and a link back to the staff member who holds it.

**Table `administrative_roles`**

| administrative_role_id | role_name | role_category | is_supervisory | reporting_line | administrative_staff_member_id |
|---|---|---|---|---|---|
| 1000 | Seasonal Programme | adaptive-role-83 | true | pilot-reportin-32 | 1 |
| 1001 | Integrated Standard | distributed-role-84 | false | extended-reportin-33 | 2 |
| 1002 | Extended Framework D | baseline-role-85 | true | integrated-reportin-34 | 3 |
| 1003 | Pilot Protocol | pilot-role-86 | false | seasonal-reportin-35 | 4 |

Role 1000, named Seasonal Programme, falls under the adaptive-role-83 category and carries supervisory authority, reporting through pilot-reportin-32. Role 1001, Integrated Standard, belongs to distributed-role-84 and is non-supervisory, reporting through extended-reportin-33. Role 1002, Extended Framework D, is a baseline-role-85 category position with supervisory status, reporting through integrated-reportin-34. Role 1003, Pilot Protocol, is a non-supervisory pilot-role-86 position reporting through seasonal-reportin-35.

The relationship between staff members and their roles is captured in a dedicated view that joins the two tables, answering the question of which person holds which role and whether that role carries supervisory authority.

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

In this joined view, Theodore Mcgrath appears with the role Seasonal Programme, confirming his supervisory status under the adaptive-role-83 category. Account Name is associated with the Integrated Standard role, which is non-supervisory and falls under distributed-role-84. The view also presents the reverse linkage, showing how each role maps back to its assigned staff member.

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

This reverse perspective confirms that role 1000 (Seasonal Programme) is held by staff member 937735 (Theodore Mcgrath), while role 1001 (Integrated Standard) corresponds to staff member 3158139 (Account Name). The reporting lines remain visible, enabling managers to trace the chain of authority from any given role upward through the organizational structure.

## Office Space and Equipment Allocation

Physical workspace management requires tracking which rooms exist, what equipment they contain, and which staff members are assigned to them. The office rooms table records each room with an identifier, a room number, a building name, a floor number, a room type, a lock status, and foreign keys linking to the equipment in the room and the staff member assigned there.

**Table `office_rooms`**

| office_room_id | room_number | building_name | floor_number | room_type | is_locked | office_equipment_id | administrative_staff_member_id |
|---|---|---|---|---|---|---|---|
| 1 | ROO-2106 | Compact Initiative | 10 | legacy-room-25 | true | 1 | 1 |
| 2 | ROO-2113 | Legacy Model | 14 | compact-room-26 | false | 2 | 2 |
| 3 | ROO-2120 | Regional Cluster A | 18 | composite-room-27 | true | 3 | 3 |
| 4 | ROO-2127 | Seasonal Review | 22 | primary-room-28 | false | 4 | 4 |

Room ROO-2106 is located in the Compact Initiative building on floor 10, classified as a legacy-room-25 type, and is currently locked. It is linked to equipment ID 1 and staff member ID 1 (Theodore Mcgrath). Room ROO-2113 in the Legacy Model building on floor 14 is a compact-room-26 type that remains unlocked, associated with equipment ID 2 and staff member ID 2 (Account Name). Room ROO-2120 in Regional Cluster A building on floor 18 is a composite-room-27 type that is locked, tied to equipment ID 3 and staff member ID 3 (Saipan International Airport). Room ROO-2127 in the Seasonal Review building on floor 22 is a primary-room-28 type that is unlocked, linked to equipment ID 4 and staff member ID 4 (Norma Fisher).

The office equipments table catalogs the physical assets within each room. Each equipment record carries an identifier, an equipment code, a type designation, a location room reference, a restriction flag, a maintenance status, and foreign keys to the room and staff member.

**Table `office_equipments`**

| id | equipment_id | equipment_type | location_room | is_restricted | maintenance_status | office_room_id | administrative_staff_member_id |
|---|---|---|---|---|---|---|---|
| 1 | 128 | integrated-equipmen-58 | baseline-location-97 | false | extended-maintena-33 | 1 | 1 |
| 2 | lu_tax_code_template_m_I_2 | seasonal-equipmen-59 | pilot-location-98 | true | integrated-maintena-34 | 2 | 2 |
| 3 | 1336190 | regional-equipmen-60 | extended-location-99 | false | seasonal-maintena-35 | 3 | 3 |
| 4 | 611514 | legacy-equipmen-61 | integrated-location-100 | true | regional-maintena-36 | 4 | 4 |

Equipment ID 128 is an integrated-equipmen-58 type located at baseline-location-97, not restricted, with an extended-maintena-33 maintenance status. It resides in room 1 and is assigned to staff member 1. Equipment lu_tax_code_template_m_I_2 is a seasonal-equipmen-59 type at pilot-location-98, marked as restricted, with integrated-maintena-34 maintenance status, located in room 2 and assigned to staff member 2. Equipment ID 1336190 is a regional-equipmen-60 type at extended-location-99, not restricted, with seasonal-maintena-35 maintenance status, in room 3 and assigned to staff member 3. Equipment ID 611514 is a legacy-equipmen-61 type at integrated-location-100, restricted, with regional-maintena-36 maintenance status, in room 4 and assigned to staff member 4.

The view joining office rooms with their equipment answers the question of which equipment resides in which room and who is responsible for it.

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

This view shows that room ROO-2106 in the Compact Initiative building contains equipment 128 (integrated-equipmen-58), which is not restricted and under extended maintenance. Room ROO-2113 in the Legacy Model building holds equipment lu_tax_code_template_m_I_2 (seasonal-equipmen-59), which is restricted and under integrated maintenance. The reverse view presents the same data from the equipment's perspective.

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

From the equipment side, equipment 128 is located in room ROO-2106 on floor 10 of the Compact Initiative building, while equipment lu_tax_code_template_m_I_2 is in room ROO-2113 on floor 14 of the Legacy Model building. This bidirectional linkage ensures that facility managers can query either from the room or from the equipment to determine ownership and location.

The staff-to-room assignment is captured in a dedicated view that links administrative staff members to their assigned office rooms.

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

Theodore Mcgrath (staff 937735) is assigned to room ROO-2106 in the Compact Initiative building on floor 10, a legacy-room-25 type that is currently locked. Account Name (staff 3158139) occupies room ROO-2113 in the Legacy Model building on floor 14, a compact-room-26 type that remains unlocked. The reverse view presents the same linkage from the room's perspective, confirming that room ROO-2106 is assigned to staff member Theodore Mcgrath and room ROO-2113 to Account Name.

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

A third perspective on the room-staff relationship is provided by the office equipment to staff member view, which traces the chain from equipment through its room to the assigned staff member.

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

Equipment 128 (integrated-equipmen-58) is located in room ROO-2106, which is assigned to Theodore Mcgrath. Equipment lu_tax_code_template_m_I_2 (seasonal-equipmen-59) is in room ROO-2113, assigned to Account Name. This three-way linkage ensures that any equipment query can resolve to both its physical location and its responsible personnel.

## Travel Request and Voucher Processing

Travel management involves a multi-stage process: a staff member submits a travel request, the request is approved, a travel voucher is created to document expenses, receipts are collected, and the voucher is reconciled against those receipts. The travel_requests table captures the initial authorization phase.

**Table `travel_requests`**

| id | request_id | submission_date | travel_purpose | destination | funding_source | approval_status | is_emergency | administrative_staff_member_id | processed_by_administrative_staff_member_id | travel_voucher_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 2087732 | 2025-04-24T03:57:00 | legacy-travel-43 | seasonal-destinat-53 | baseline-funding-73 | adaptive-approval-65 | true | 1 | 1 | 1000 |
| 2 | 575213 | 2022-09-08T10:14:00 | compact-travel-44 | regional-destinat-54 | pilot-funding-74 | distributed-approval-66 | false | 2 | 2 | 1001 |
| 3 | 103167 | 2023-02-19T17:31:00 | composite-travel-45 | legacy-destinat-55 | extended-funding-75 | baseline-approval-67 | true | 3 | 3 | 1002 |
| 4 | 611510 | 2024-07-03T00:48:00 | primary-travel-46 | compact-destinat-56 | integrated-funding-76 | pilot-approval-68 | false | 4 | 4 | 1003 |

Request ID 2087732 was submitted on 2025-04-24 for a legacy-travel-43 purpose, destined for seasonal-destinat-53, funded through baseline-funding-73. It carries an adaptive-approval-65 status, is marked as an emergency request, was submitted by staff member 1 (Theodore Mcgrath), processed by staff member 1, and is linked to travel voucher 1000. Request ID 575213 was submitted on 2022-09-08 for compact-travel-44 to regional-destinat-54, funded by pilot-funding-74, with distributed-approval-66 status, not an emergency, submitted and processed by staff member 2 (Account Name), linked to voucher 1001. Request ID 103167 was submitted on 2023-02-19 for composite-travel-45 to legacy-destinat-55, funded by extended-funding-75, with baseline-approval-67 status, marked as emergency, submitted and processed by staff member 3 (Saipan International Airport), linked to voucher 1002. Request ID 611510 was submitted on 2024-07-03 for primary-travel-46 to compact-destinat-56, funded by integrated-funding-76, with pilot-approval-68 status, not an emergency, submitted and processed by staff member 4 (Norma Fisher), linked to voucher 1003.

The travel_vouchers table records the financial documentation for each approved trip.

**Table `travel_vouchers`**

| id | voucher_id | submission_date | total_amount | currency | is_notarized | receipt_count | administrative_staff_member_id | travel_request_id | created_at |
|---|---|---|---|---|---|---|---|---|---|
| 1000 | 2986224 | 2025-04-24T03:57:00 | 112.11 | seasonal-currency-71 | true | 28 | 1 | 1 | 2025-01-01 00:14:00 |
| 1001 | 5917292 | 2022-09-08T10:14:00 | 1,979 | regional-currency-72 | false | 10 | 2 | 2 | 2025-02-06 03:14:00 |
| 1002 | 5006456 | 2023-02-19T17:31:00 | 15,418 | legacy-currency-73 | true | 65 | 3 | 3 | 2025-03-11 06:14:00 |
| 1003 | 974947 | 2024-07-03T00:48:00 | 12,579 | compact-currency-74 | false | 83 | 4 | 4 | 2025-04-16 09:14:00 |

Voucher 2986224 was submitted on 2025-04-24 with a total amount of 112.11 in seasonal-currency-71, is notarized, contains 28 receipts, was created by staff member 1, and is linked to travel request 1. Voucher 5917292 was submitted on 2022-09-08 with a total amount of 1,979 in regional-currency-72, is not notarized, contains 10 receipts, was created by staff member 2, and is linked to travel request 2. Voucher 5006456 was submitted on 2023-02-19 with a total amount of 15,418 in legacy-currency-73, is notarized, contains 65 receipts, was created by staff member 3, and is linked to travel request 3. Voucher 974947 was submitted on 2024-07-03 with a total amount of 12,579 in compact-currency-74, is not notarized, contains 83 receipts, was created by staff member 4, and is linked to travel request 4.

The view joining travel requests with their staff members clarifies who initiated each trip and who processed it.

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

This view shows that request 2087732 was submitted by Theodore Mcgrath (staff 937735) and processed by the same individual. Request 575213 was submitted and processed by Account Name (staff 3158139). The view preserves the full request metadata including purpose, destination, funding source, approval status, and emergency designation alongside the staff member's details.

The view joining travel requests with their vouchers answers the question of which voucher corresponds to which request and whether the financial documentation has been completed.

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

Request 2087732 is linked to voucher 2986224 with a total of 112.11 and 28 receipts. Request 575213 maps to voucher 5917292 with 1,979 total and 10 receipts. Request 103167 maps to voucher 5006456 with 15,418 total and 65 receipts. Request 611510 maps to voucher 974947 with 12,579 total and 83 receipts. The reverse view presents the same linkage from the voucher's perspective.

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

Voucher 2986224 corresponds to request 2087732 for legacy-travel-43 to seasonal-destinat-53. Voucher 5917292 corresponds to request 575213 for compact-travel-44 to regional-destinat-54. This bidirectional linkage ensures that auditors can trace from either the request or the voucher to the other document in the chain.

The view joining travel vouchers with their submitting staff members confirms who is financially responsible for each voucher.

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

Voucher 2986224 was created by Theodore Mcgrath (staff 937735) and is linked to request 2087732. Voucher 5917292 was created by Account Name (staff 3158139) and is linked to request 575213. The notarization status and receipt counts are preserved, enabling financial reviewers to assess the completeness of documentation.

The view joining travel vouchers with their receipt details provides the granular evidence needed for expense reconciliation.

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

Voucher 2986224 has 28 receipts attached, voucher 5917292 has 10, voucher 5006456 has 65, and voucher 974947 has 83. The receipt count serves as a proxy for documentation completeness—higher counts indicate more detailed expense breakdowns. The reverse view presents the same linkage from the receipt's perspective.

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

Each receipt is traceable back to its parent voucher, and each voucher to its originating travel request, forming a complete audit trail from the initial authorization through to the final receipt collection.

## Office Service and Request Form Management

Office operations also require a system for tracking service requests and their associated forms. The office_service_requests table records service needs, while the request_forms table captures the formal documentation supporting each request. The vouchers_receipts table links travel vouchers to their supporting receipts, completing the financial reconciliation chain.

**Table `office_service_requests`**

| id | request_id | submission_date | service_type | page_count | is_copyrighted | estimated_completion_time | is_emergency | administrative_staff_member_id | processed_by_administrative_staff_member_id | form_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1000 | 2087732 | 2025-04-24T03:57:00 | composite-service-81 | 6 | false | composite-estimate-57 | true | 1 | 1 | template_impcode_pagata_20det10 |
| 1001 | 575213 | 2022-09-08T10:14:00 | primary-service-82 | 7 | true | primary-estimate-58 | false | 2 | 2 | 937744 |
| 1002 | 103167 | 2023-02-19T17:31:00 | adaptive-service-83 | 0 | false | adaptive-estimate-59 | true | 3 | 3 | 1250195 |
| 1003 | 611510 | 2024-07-03T00:48:00 | distributed-service-84 | 15 | true | distributed-estimate-60 | false | 4 | 4 | 3355762 |

**Table `request_forms`**

| form_id | form_type | is_complete | copyright_info_provided | location_in_office | office_service_request_id |
|---|---|---|---|---|---|
| template_impcode_pagata_20det10 | legacy-form-61 | false | false | compact-location-14 | 1000 |
| 937744 | compact-form-62 | true | true | composite-location-15 | 1001 |
| 1250195 | composite-form-63 | false | false | primary-location-16 | 1002 |
| 3355762 | primary-form-64 | true | true | adaptive-location-17 | 1003 |

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

The view joining office service requests with their staff members identifies who initiated each service need.

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

This view links each service request to the staff member who submitted it, preserving the request details alongside the staff member's name, department, and role title. The reverse view presents the same linkage from the staff member's perspective, showing all service requests initiated by a given individual.

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

This view joins service requests with their associated request forms, answering the question of which formal documentation supports each service need. The reverse view presents the same linkage from the form's perspective.

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

Each request form can be traced back to its parent service request, ensuring that every administrative action has a corresponding formal record. This bidirectional linkage between service requests and request forms provides the documentation integrity required for compliance audits and operational reviews.

## Closing Synthesis

The administrative operations domain described here spans four interconnected layers: personnel and role management, physical workspace and equipment allocation, travel authorization and financial reconciliation, and office service request processing. Each layer is represented by base tables that store the raw records and by views that join those records into meaningful relationships. The foreign keys—linking staff members to roles, rooms, and travel activities; linking rooms to equipment and staff; linking travel requests to vouchers and vouchers to receipts—form a coherent network of accountability. Every transaction, from Theodore Mcgrath's emergency travel request with its 28 supporting receipts to Account Name's non-emergency trip with 10 receipts, is traceable through this network from initiation through approval, documentation, and final reconciliation. The system ensures that no administrative action exists in isolation; every role assignment, room allocation, equipment deployment, and travel expense is connected to a person, a place, and a paper trail.

## Data appendix

**Table `receipts`**

| receipt_id | issue_date | vendor_name | expense_amount | expense_category | is_original | travel_voucher_id |
|---|---|---|---|---|---|---|
| 21087064 | 2023-02-01 | Microsoft Corporation | 215,884 | integrated-expense-16 | false | 1000 |
| 32824 | 2024-07-12 | PureCycle Technologies. | 42,370 | seasonal-expense-17 | true | 1001 |
| 1366db3e-8fcc-11eb-924d-9cd76263cbd0 | 2025-12-23 | American International Group | 2,126 | regional-expense-18 | false | 1002 |
| 605943 | 2022-05-07 | American Airlines Group | 1,862 | legacy-expense-19 | true | 1003 |
