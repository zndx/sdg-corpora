## Facility Operations and Resource Management

Aquatic facility management demands a coordinated approach to tracking physical infrastructure, personnel qualifications, maintenance schedules, and public programming. A single facility may host multiple staff members across different employment categories, maintain diverse equipment assets, and run a calendar of events ranging from daily public sessions to specialized swim lessons. The records in this system capture every layer of that operation—from the compliance status of a building to the expiration date of a lifeguard's certification. Understanding how these records interrelate is essential for anyone responsible for keeping a pool safe, compliant, and operationally sound.

The foundation of the system is the facility registry, which stores the core attributes of each aquatic location.

**Table `pool_facilities`**

| pool_facility_id | facility_id | facility_name | municipality | state | is_outdoor | operating_season | last_inspection_date | health_department_compliance_status |
|---|---|---|---|---|---|---|---|---|
| 1 | 69447 | Integrated Protocol A | extended-municipa-99 | distributed-state-84 | false | primary-operatin-58 | 2025-04-12 | compliant |
| 2 | 1040 | Extended Programme | integrated-municipa-100 | baseline-state-85 | true | adaptive-operatin-59 | 2022-09-23 | non-compliant |
| 3 | 2986228 | Pilot Standard | seasonal-municipa-101 | pilot-state-86 | false | distributed-operatin-60 | 2023-02-07 | pending |
| 4 | ChIJvSxSbfdv5kcRanVzI8RRu20 | Baseline Framework D | regional-municipa-102 | extended-state-87 | true | baseline-operatin-61 | 2024-07-18 | compliant |

Each facility record carries a unique identifier, a human-readable name, and geographic context through municipality and state fields. The `is_outdoor` flag distinguishes indoor from outdoor operations, while `operating_season` captures whether the facility runs on a primary, adaptive, seasonal, or distributed schedule. The `last_inspection_date` and `health_department_compliance_status` fields provide a snapshot of regulatory standing. In the current data, facility 1 (Integrated Protocol A) is an indoor location in distributed-state-84 with compliant health department status, while facility 2 (Extended Programme) is an outdoor site marked non-compliant. Facility 4 uses a Google Place ID (`ChIJvSxSbfdv5kcRanVzI8RRu20`) as its internal identifier, illustrating that the system accommodates externally sourced identifiers alongside numeric keys.

Personnel records are maintained in a separate table that links each staff member to a facility and tracks their employment details.

**Table `pool_staff_members`**

| id | staff_id | full_name | position_title | employment_status | hire_date | termination_date | supervisor_id | certifications | pool_staff_member_id | pool_facility_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 937735 | Theodore Mcgrath | Extended Model | seasonal | 2023-06-01 | 2022-09-11 | account_pymes_255 | distributed-certific-78 | 1 | 1 |
| 2 | 3158139 | Account Name | Pilot Cluster A | temporary | 2024-11-12 | 2023-02-22 | 328 | baseline-certific-79 | 2 | 2 |
| 3 | 8189502 | Saipan International Airport | Baseline Review | full-time | 2025-04-23 | 2024-07-06 | 1996938 | pilot-certific-80 | 3 | 3 |
| 4 | 69438 | Norma Fisher | Distributed Initiative | part-time | 2022-09-07 | 2025-12-17 | ChIJIbRFlPtt5kcR5kM81XdpSfI | extended-certific-81 | 4 | 4 |

The `pool_staff_members` table stores the full name, position title, and employment status of each worker, along with hire and termination dates. The `supervisor_id` field creates a hierarchical reporting structure within the organization, and the `certifications` column holds a reference to the staff member's primary certification. Every staff record is tied to a facility through `pool_facility_id`, establishing the operational assignment. For example, Theodore Mcgrath (staff ID 937735) holds the position of Extended Model at facility 1, is classified as seasonal, and has a supervisor identified as `account_pymes_255`. Account Name (staff ID 3158139) works at facility 2 as a Pilot Cluster A employee on a temporary basis. The data shows that termination dates can precede hire dates in the raw records, a pattern that may reflect data entry artifacts or retroactive corrections that operations teams should audit.

Qualification tracking is handled through the safety certifications table, which records the credentials that staff members must maintain.

**Table `safety_certifications`**

| id | cert_id | cert_type | issuing_body | issue_date | expiration_date | is_current |
|---|---|---|---|---|---|---|
| 1 | 1152669 | lifeguard | baseline-issuing-13 | 2023-02-01 | 2025-08-18 | true |
| 2 | 10966226 | water_safety_instructor | pilot-issuing-14 | 2024-07-12 | 2022-01-02 | false |
| 3 | 9085245 | first_aid | extended-issuing-15 | 2025-12-23 | 2023-06-13 | true |
| 4 | 15213461 | cpr | integrated-issuing-16 | 2022-05-07 | 2024-11-24 | false |

Each certification record includes a type—such as `lifeguard`, `water_safety_instructor`, `first_aid`, or `cpr`—along with the issuing body, issue date, and expiration date. The `is_current` boolean provides a quick status check. In the current dataset, certification 1 (lifeguard, issued by baseline-issuing-13) is current with an expiration of 2025-08-18, while certification 2 (water_safety_instructor, issued by pilot-issuing-14) has expired as of 2022-01-02. The system distinguishes between the certification itself and the person who holds it; the linkage between staff and certifications is managed through junction tables that support many-to-many relationships.

Maintenance activities form a critical operational layer, documenting the work performed to keep facilities and equipment in safe working order.

**Table `maintenance_activities`**

| maintenance_activity_id | activity_id | activity_type | scheduled_date | completed_date | performed_by | health_standard_compliance | notes | pool_facility_id | pool_staff_member_id |
|---|---|---|---|---|---|---|---|---|---|
| 100 | 8843761 | water_quality_monitoring | 2024-11-27 | 2023-02-11 | extended-performe-57 | false | extended-notes-75 | 1 | 1 |
| 101 | 4180957 | filtration_service | 2025-04-11 | 2024-07-22 | integrated-performe-58 | true | integrated-notes-76 | 2 | 2 |
| 102 | 168545 | chemical_treatment | 2022-09-22 | 2025-12-06 | seasonal-performe-59 | false | seasonal-notes-77 | 3 | 3 |
| 103 | default_chart_a_account_53 | equipment_inspection | 2023-02-06 | 2022-05-17 | regional-performe-60 | true | regional-notes-78 | 4 | 4 |

The `maintenance_activities` table records each activity with a type (e.g., `water_quality_monitoring`, `filtration_service`, `chemical_treatment`, `equipment_inspection`), a scheduled date, and the actual completion date. The `performed_by` field identifies the worker or team responsible, while `health_standard_compliance` indicates whether the activity met regulatory standards. Notes provide additional context. Activity 100, a water quality monitoring task at facility 1, was scheduled for 2024-11-27 but completed on 2023-02-11 and did not meet health standards. Activity 101, a filtration service at facility 2, was completed on time and achieved compliance. Each maintenance record is linked to both a facility and a staff member, creating a clear audit trail of who performed what work and where.

Equipment assets are tracked in their own table, with each entry tied to a facility and an assigned staff member.

**Table `pool_equipments`**

| pool_equipment_id | equipment_id | equipment_name | equipment_type | installation_date | last_maintenance_date | operational_status | weight_kg | pool_facility_id | pool_staff_member_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 128 | Legacy Review D | filtration_system | 2022-01-10 | 2024-03-27 | operational | 1.48 | 1 | 1 |
| 2 | lu_tax_code_template_m_I_2 | Regional Initiative | valve | 2023-06-21 | 2025-08-11 | maintenance | 0.385 | 2 | 2 |
| 3 | 1336190 | Seasonal Model | lifeguard_chair | 2024-11-05 | 2022-01-22 | decommissioned | 0.5465680900000001 | 3 | 3 |
| 4 | 611514 | Integrated Cluster A | chemical_storage | 2025-04-16 | 2023-06-06 | operational | 0.9 | 4 | 4 |

The `pool_equipments` table captures the equipment name, type (such as `filtration_system`, `valve`, `lifeguard_chair`, or `chemical_storage`), installation date, last maintenance date, and operational status. The `weight_kg` field provides physical specifications useful for logistics and safety planning. Equipment 1 (Legacy Review D, a filtration system) is operational at facility 1 and weighs 1.48 kg. Equipment 2 (Regional Initiative, a valve) is at facility 2 and currently in maintenance status. Equipment 3 (Seasonal Model, a lifeguard chair) at facility 3 is decommissioned. The operational status values—`operational`, `maintenance`, and `decommissioned`—give managers an at-a-glance view of asset health across the facility portfolio.

Public programming is recorded in the aquatic events table, which captures the logistics of each scheduled activity.

**Table `aquatic_events`**

| aquatic_event_id | event_id | event_name | event_type | start_date | end_date | capacity | registration_fee | is_cancelled | pool_facility_id |
|---|---|---|---|---|---|---|---|---|---|
| 1000 | 2002007020060 | Seasonal Standard | public_session | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | 32 | 24.01 | false | 1 |
| 1001 | 168535 | Integrated Framework | swim_lesson | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | 41 | 12.87 | true | 2 |
| 1002 | ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 | Extended Protocol D | rental | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | 50 | 19.72 | false | 3 |
| 1003 | 1186089 | Pilot Programme | special_event | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | 59 | 16.11 | true | 4 |

Each event has a name, type (such as `public_session`, `swim_lesson`, `rental`, or `special_event`), start and end dates, capacity, registration fee, and a cancellation flag. Event 1000 (Seasonal Standard, a public session) at facility 1 has a capacity of 32 and a registration fee of $24.01, and is not cancelled. Event 1001 (Integrated Framework, a swim lesson) at facility 2 has a capacity of 41, a fee of $12.87, and is marked as cancelled. The system supports both free and paid events, and the cancellation flag allows for last-minute schedule changes without deleting historical records.

Beyond the core entity tables, the system includes junction tables that manage the many-to-many relationships between facilities, staff, certifications, activities, and events. These tables enable flexible assignment patterns where a single staff member may work across multiple facilities, a facility may host multiple events simultaneously, and certifications may be shared or transferred between personnel.

**Table `facilities_members`**

| pool_facility_id | pool_staff_member_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

The `facilities_members` table links facilities to staff members, supporting assignments that go beyond the primary facility recorded in the staff member's main record. This allows for cross-facility coverage, temporary reassignments, and shared staffing models.

**Table `facilities_activities`**

| pool_facility_id | maintenance_activity_id |
|---|---|
| 1 | 100 |
| 1 | 101 |
| 2 | 101 |
| 2 | 102 |
| 3 | 102 |
| 3 | 103 |
| 4 | 103 |
| 4 | 100 |

The `facilities_activities` table connects facilities to maintenance activities, providing a secondary linkage that supports activities performed at multiple locations or activities that span several facilities.

**Table `facilities_events`**

| pool_facility_id | aquatic_event_id |
|---|---|
| 1 | 1000 |
| 1 | 1001 |
| 2 | 1001 |
| 2 | 1002 |
| 3 | 1002 |
| 3 | 1003 |
| 4 | 1003 |
| 4 | 1000 |

The `facilities_events` table links facilities to aquatic events, enabling events that are hosted across multiple venues or that have satellite locations.

**Table `members_certifications`**

| pool_staff_member_id | safety_certification_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

The `members_certifications` table establishes the relationship between staff members and their safety certifications. This junction table allows a single staff member to hold multiple certifications and supports the tracking of certification history over time.

**Table `certifications_members`**

| safety_certification_id | pool_staff_member_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

The `certifications_members` table provides the inverse linkage, connecting certifications back to the staff members who hold them. Together with `members_certifications`, this dual-junction structure supports bidirectional queries and ensures data integrity in the certification assignment process.

**Table `activities_equipments`**

| maintenance_activity_id | pool_equipment_id |
|---|---|
| 100 | 1 |
| 100 | 2 |
| 101 | 2 |
| 101 | 3 |
| 102 | 3 |
| 102 | 4 |
| 103 | 4 |
| 103 | 1 |

The `activities_equipments` table links maintenance activities to the equipment they affect. A single maintenance activity may involve multiple pieces of equipment, and a single piece of equipment may be serviced in multiple activities over its lifecycle.

**Table `equipments_activities`**

| pool_equipment_id | maintenance_activity_id |
|---|---|
| 1 | 100 |
| 1 | 101 |
| 2 | 101 |
| 2 | 102 |
| 3 | 102 |
| 3 | 103 |
| 4 | 103 |
| 4 | 100 |

The `equipments_activities` table provides the inverse relationship, connecting equipment records back to the maintenance activities that have been performed on them. This supports equipment history tracking and lifecycle analysis.

**Table `events_members`**

| aquatic_event_id | pool_staff_member_id |
|---|---|
| 1000 | 1 |
| 1000 | 2 |
| 1001 | 2 |
| 1001 | 3 |
| 1002 | 3 |
| 1002 | 4 |
| 1003 | 4 |
| 1003 | 1 |

The `events_members` table links aquatic events to the staff members assigned to them. A single event may require multiple staff members, and a staff member may be assigned to multiple events across the calendar.

**Table `events_activities`**

| aquatic_event_id | maintenance_activity_id |
|---|---|
| 1000 | 100 |
| 1000 | 101 |
| 1001 | 101 |
| 1001 | 102 |
| 1002 | 102 |
| 1002 | 103 |
| 1003 | 103 |
| 1003 | 100 |

The `events_activities` table connects aquatic events to maintenance activities, capturing any preparatory or post-event maintenance that is tied to a specific event. This ensures that event-related work is tracked alongside the event itself.

With the base tables and junction tables in place, the system provides a set of detail views that join these records into readable, actionable summaries. Each view answers a specific operational question by bringing together related records from multiple tables.

**View `v_pool_facility_pool_staff_member_detail`**

```sql
CREATE VIEW v_pool_facility_pool_staff_member_detail AS
SELECT a.pool_facility_id, a.facility_id, a.facility_name, b.id AS member_id, b.staff_id AS member_staff_id, b.full_name AS member_full_name
FROM pool_facilities a
  JOIN facilities_members j ON j.pool_facility_id = a.pool_facility_id
  JOIN pool_staff_members b ON b.id = j.pool_staff_member_id;
```

| pool_facility_id | facility_id | facility_name | member_id | member_staff_id | member_full_name |
|---|---|---|---|---|---|
| 1 | 69447 | Integrated Protocol A | 1 | 937735 | Theodore Mcgrath |
| 1 | 69447 | Integrated Protocol A | 2 | 3158139 | Account Name |
| 2 | 1040 | Extended Programme | 2 | 3158139 | Account Name |
| 2 | 1040 | Extended Programme | 3 | 8189502 | Saipan International Airport |
| 3 | 2986228 | Pilot Standard | 3 | 8189502 | Saipan International Airport |
| 3 | 2986228 | Pilot Standard | 4 | 69438 | Norma Fisher |
| 4 | ChIJvSxSbfdv5kcRanVzI8RRu20 | Baseline Framework D | 4 | 69438 | Norma Fisher |
| 4 | ChIJvSxSbfdv5kcRanVzI8RRu20 | Baseline Framework D | 1 | 937735 | Theodore Mcgrath |

This view joins facility records with their assigned staff members, answering the question of which personnel are responsible at each location. Reading a row from this view, one can see that facility 1 (Integrated Protocol A) has Theodore Mcgrath assigned, with his position title, employment status, and certification all visible in a single record. This eliminates the need for manual cross-referencing between the facility and staff tables.

**View `v_pool_facility_maintenance_activity_detail`**

```sql
CREATE VIEW v_pool_facility_maintenance_activity_detail AS
SELECT a.pool_facility_id, a.facility_id, a.facility_name, b.maintenance_activity_id AS activity_maintenance_activity_id, b.activity_id AS activity_activity_id, b.activity_type AS activity_activity_type
FROM pool_facilities a
  JOIN facilities_activities j ON j.pool_facility_id = a.pool_facility_id
  JOIN maintenance_activities b ON b.maintenance_activity_id = j.maintenance_activity_id;
```

| pool_facility_id | facility_id | facility_name | activity_maintenance_activity_id | activity_activity_id | activity_activity_type |
|---|---|---|---|---|---|
| 1 | 69447 | Integrated Protocol A | 100 | 8843761 | water_quality_monitoring |
| 1 | 69447 | Integrated Protocol A | 101 | 4180957 | filtration_service |
| 2 | 1040 | Extended Programme | 101 | 4180957 | filtration_service |
| 2 | 1040 | Extended Programme | 102 | 168545 | chemical_treatment |
| 3 | 2986228 | Pilot Standard | 102 | 168545 | chemical_treatment |
| 3 | 2986228 | Pilot Standard | 103 | default_chart_a_account_53 | equipment_inspection |
| 4 | ChIJvSxSbfdv5kcRanVzI8RRu20 | Baseline Framework D | 103 | default_chart_a_account_53 | equipment_inspection |
| 4 | ChIJvSxSbfdv5kcRanVzI8RRu20 | Baseline Framework D | 100 | 8843761 | water_quality_monitoring |

This view combines facility information with maintenance activity records, providing a facility-centric view of all work performed. A row from this view might show facility 2 (Extended Programme) alongside its filtration service activity (101), including the scheduled date, completion date, and compliance status. Operations managers use this view to identify facilities with overdue or non-compliant maintenance.

**View `v_pool_facility_aquatic_event_detail`**

```sql
CREATE VIEW v_pool_facility_aquatic_event_detail AS
SELECT a.pool_facility_id, a.facility_id, a.facility_name, b.aquatic_event_id AS event_aquatic_event_id, b.event_id AS event_event_id, b.event_name AS event_event_name
FROM pool_facilities a
  JOIN facilities_events j ON j.pool_facility_id = a.pool_facility_id
  JOIN aquatic_events b ON b.aquatic_event_id = j.aquatic_event_id;
```

| pool_facility_id | facility_id | facility_name | event_aquatic_event_id | event_event_id | event_event_name |
|---|---|---|---|---|---|
| 1 | 69447 | Integrated Protocol A | 1000 | 2002007020060 | Seasonal Standard |
| 1 | 69447 | Integrated Protocol A | 1001 | 168535 | Integrated Framework |
| 2 | 1040 | Extended Programme | 1001 | 168535 | Integrated Framework |
| 2 | 1040 | Extended Programme | 1002 | ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 | Extended Protocol D |
| 3 | 2986228 | Pilot Standard | 1002 | ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 | Extended Protocol D |
| 3 | 2986228 | Pilot Standard | 1003 | 1186089 | Pilot Programme |
| 4 | ChIJvSxSbfdv5kcRanVzI8RRu20 | Baseline Framework D | 1003 | 1186089 | Pilot Programme |
| 4 | ChIJvSxSbfdv5kcRanVzI8RRu20 | Baseline Framework D | 1000 | 2002007020060 | Seasonal Standard |

This view joins facility records with their scheduled aquatic events, giving a facility-level calendar of programming. A row from this view could show facility 3 (Pilot Standard) hosting the Extended Protocol D rental event with its capacity, fee, and cancellation status all visible. This view supports scheduling conflicts detection and resource planning.

**View `v_pool_staff_member_pool_staff_member`**

```sql
CREATE VIEW v_pool_staff_member_pool_staff_member AS
SELECT a.id, a.staff_id, a.full_name, a.position_title, b.id AS member_id, b.staff_id AS member_staff_id, b.full_name AS member_full_name
FROM pool_staff_members a JOIN pool_staff_members b ON a.pool_staff_member_id = b.id;
```

| id | staff_id | full_name | position_title | member_id | member_staff_id | member_full_name |
|---|---|---|---|---|---|---|
| 1 | 937735 | Theodore Mcgrath | Extended Model | 1 | 937735 | Theodore Mcgrath |
| 2 | 3158139 | Account Name | Pilot Cluster A | 2 | 3158139 | Account Name |
| 3 | 8189502 | Saipan International Airport | Baseline Review | 3 | 8189502 | Saipan International Airport |
| 4 | 69438 | Norma Fisher | Distributed Initiative | 4 | 69438 | Norma Fisher |

This view provides a staff member self-reference, linking each staff record to its own details. While seemingly redundant, this pattern supports hierarchical queries where a supervisor (identified by `supervisor_id`) can be resolved to their own staff record, enabling org-chart generation and reporting chain analysis.

**View `v_pool_staff_member_pool_facility`**

```sql
CREATE VIEW v_pool_staff_member_pool_facility AS
SELECT a.id, a.staff_id, a.full_name, a.position_title, b.pool_facility_id AS facility_pool_facility_id, b.facility_id AS facility_facility_id, b.facility_name AS facility_facility_name
FROM pool_staff_members a JOIN pool_facilities b ON a.pool_facility_id = b.pool_facility_id;
```

| id | staff_id | full_name | position_title | facility_pool_facility_id | facility_facility_id | facility_facility_name |
|---|---|---|---|---|---|---|
| 1 | 937735 | Theodore Mcgrath | Extended Model | 1 | 69447 | Integrated Protocol A |
| 2 | 3158139 | Account Name | Pilot Cluster A | 2 | 1040 | Extended Programme |
| 3 | 8189502 | Saipan International Airport | Baseline Review | 3 | 2986228 | Pilot Standard |
| 4 | 69438 | Norma Fisher | Distributed Initiative | 4 | ChIJvSxSbfdv5kcRanVzI8RRu20 | Baseline Framework D |

This view joins staff member records with their assigned facilities, answering which facility each staff member is primarily assigned to. A row from this view shows that staff member 4 (Norma Fisher, Distributed Initiative) is assigned to facility 4 (Baseline Framework D). This view is useful for workload distribution analysis and staffing audits.

**View `v_pool_staff_member_safety_certification_detail`**

```sql
CREATE VIEW v_pool_staff_member_safety_certification_detail AS
SELECT a.id, a.staff_id, a.full_name, b.id AS certification_id, b.cert_id AS certification_cert_id, b.cert_type AS certification_cert_type
FROM pool_staff_members a
  JOIN members_certifications j ON j.pool_staff_member_id = a.id
  JOIN safety_certifications b ON b.id = j.safety_certification_id;
```

| id | staff_id | full_name | certification_id | certification_cert_id | certification_cert_type |
|---|---|---|---|---|---|
| 1 | 937735 | Theodore Mcgrath | 1 | 1152669 | lifeguard |
| 1 | 937735 | Theodore Mcgrath | 2 | 10966226 | water_safety_instructor |
| 2 | 3158139 | Account Name | 2 | 10966226 | water_safety_instructor |
| 2 | 3158139 | Account Name | 3 | 9085245 | first_aid |
| 3 | 8189502 | Saipan International Airport | 3 | 9085245 | first_aid |
| 3 | 8189502 | Saipan International Airport | 4 | 15213461 | cpr |
| 4 | 69438 | Norma Fisher | 4 | 15213461 | cpr |
| 4 | 69438 | Norma Fisher | 1 | 1152669 | lifeguard |

This view connects staff members with their safety certifications, providing a personnel-centric view of qualification status. A row from this view might show Theodore Mcgrath alongside his distributed-certific-78 credential, including the certification type, issuing body, and current status. This view is essential for compliance monitoring and identifying staff whose certifications are approaching expiration.

**View `v_safety_certification_pool_staff_member_detail`**

```sql
CREATE VIEW v_safety_certification_pool_staff_member_detail AS
SELECT a.id, a.cert_id, a.cert_type, b.id AS member_id, b.staff_id AS member_staff_id, b.full_name AS member_full_name
FROM safety_certifications a
  JOIN certifications_members j ON j.safety_certification_id = a.id
  JOIN pool_staff_members b ON b.id = j.pool_staff_member_id;
```

| id | cert_id | cert_type | member_id | member_staff_id | member_full_name |
|---|---|---|---|---|---|
| 1 | 1152669 | lifeguard | 1 | 937735 | Theodore Mcgrath |
| 1 | 1152669 | lifeguard | 2 | 3158139 | Account Name |
| 2 | 10966226 | water_safety_instructor | 2 | 3158139 | Account Name |
| 2 | 10966226 | water_safety_instructor | 3 | 8189502 | Saipan International Airport |
| 3 | 9085245 | first_aid | 3 | 8189502 | Saipan International Airport |
| 3 | 9085245 | first_aid | 4 | 69438 | Norma Fisher |
| 4 | 15213461 | cpr | 4 | 69438 | Norma Fisher |
| 4 | 15213461 | cpr | 1 | 937735 | Theodore Mcgrath |

This view provides the inverse perspective, joining certification records with the staff members who hold them. A row from this view might show the lifeguard certification (issued by baseline-issuing-13) alongside Theodore Mcgrath's name and position. This view supports certification-level queries, such as identifying all staff holding a specific credential or finding which certifications are most common across the organization.

**View `v_maintenance_activity_pool_facility`**

```sql
CREATE VIEW v_maintenance_activity_pool_facility AS
SELECT a.maintenance_activity_id, a.activity_id, a.activity_type, a.scheduled_date, b.pool_facility_id AS facility_pool_facility_id, b.facility_id AS facility_facility_id, b.facility_name AS facility_facility_name
FROM maintenance_activities a JOIN pool_facilities b ON a.pool_facility_id = b.pool_facility_id;
```

| maintenance_activity_id | activity_id | activity_type | scheduled_date | facility_pool_facility_id | facility_facility_id | facility_facility_name |
|---|---|---|---|---|---|---|
| 100 | 8843761 | water_quality_monitoring | 2024-11-27 | 1 | 69447 | Integrated Protocol A |
| 101 | 4180957 | filtration_service | 2025-04-11 | 2 | 1040 | Extended Programme |
| 102 | 168545 | chemical_treatment | 2022-09-22 | 3 | 2986228 | Pilot Standard |
| 103 | default_chart_a_account_53 | equipment_inspection | 2023-02-06 | 4 | ChIJvSxSbfdv5kcRanVzI8RRu20 | Baseline Framework D |

This view joins maintenance activities with their assigned facilities, providing an activity-centric view of where work is being performed. A row from this view might show the water quality monitoring activity (100) at facility 1, with the facility's compliance status and operating season visible alongside the activity's completion date and health standard compliance. This view supports facility-level maintenance reporting.

**View `v_maintenance_activity_pool_staff_member`**

```sql
CREATE VIEW v_maintenance_activity_pool_staff_member AS
SELECT a.maintenance_activity_id, a.activity_id, a.activity_type, a.scheduled_date, b.id AS member_id, b.staff_id AS member_staff_id, b.full_name AS member_full_name
FROM maintenance_activities a JOIN pool_staff_members b ON a.pool_staff_member_id = b.id;
```

| maintenance_activity_id | activity_id | activity_type | scheduled_date | member_id | member_staff_id | member_full_name |
|---|---|---|---|---|---|---|
| 100 | 8843761 | water_quality_monitoring | 2024-11-27 | 1 | 937735 | Theodore Mcgrath |
| 101 | 4180957 | filtration_service | 2025-04-11 | 2 | 3158139 | Account Name |
| 102 | 168545 | chemical_treatment | 2022-09-22 | 3 | 8189502 | Saipan International Airport |
| 103 | default_chart_a_account_53 | equipment_inspection | 2023-02-06 | 4 | 69438 | Norma Fisher |

This view connects maintenance activities with the staff members who performed them, answering the question of who did what work. A row from this view might show that Norma Fisher (staff member 4) performed the equipment inspection activity (103) at facility 4. This view is critical for performance tracking, workload balancing, and accountability.

**View `v_maintenance_activity_pool_equipment_detail`**

```sql
CREATE VIEW v_maintenance_activity_pool_equipment_detail AS
SELECT a.maintenance_activity_id, a.activity_id, a.activity_type, b.pool_equipment_id AS equipment_pool_equipment_id, b.equipment_id AS equipment_equipment_id, b.equipment_name AS equipment_equipment_name
FROM maintenance_activities a
  JOIN activities_equipments j ON j.maintenance_activity_id = a.maintenance_activity_id
  JOIN pool_equipments b ON b.pool_equipment_id = j.pool_equipment_id;
```

| maintenance_activity_id | activity_id | activity_type | equipment_pool_equipment_id | equipment_equipment_id | equipment_equipment_name |
|---|---|---|---|---|---|
| 100 | 8843761 | water_quality_monitoring | 1 | 128 | Legacy Review D |
| 100 | 8843761 | water_quality_monitoring | 2 | lu_tax_code_template_m_I_2 | Regional Initiative |
| 101 | 4180957 | filtration_service | 2 | lu_tax_code_template_m_I_2 | Regional Initiative |
| 101 | 4180957 | filtration_service | 3 | 1336190 | Seasonal Model |
| 102 | 168545 | chemical_treatment | 3 | 1336190 | Seasonal Model |
| 102 | 168545 | chemical_treatment | 4 | 611514 | Integrated Cluster A |
| 103 | default_chart_a_account_53 | equipment_inspection | 4 | 611514 | Integrated Cluster A |
| 103 | default_chart_a_account_53 | equipment_inspection | 1 | 128 | Legacy Review D |

This view joins maintenance activities with the equipment they affected, providing a detailed record of equipment maintenance history. A row from this view might show the filtration service activity (101) performed on the Regional Initiative valve at facility 2, including the equipment's operational status and weight. This view supports equipment lifecycle analysis and preventive maintenance scheduling.

**View `v_pool_equipment_pool_facility`**

```sql
CREATE VIEW v_pool_equipment_pool_facility AS
SELECT a.pool_equipment_id, a.equipment_id, a.equipment_name, a.equipment_type, b.pool_facility_id AS facility_pool_facility_id, b.facility_id AS facility_facility_id, b.facility_name AS facility_facility_name
FROM pool_equipments a JOIN pool_facilities b ON a.pool_facility_id = b.pool_facility_id;
```

| pool_equipment_id | equipment_id | equipment_name | equipment_type | facility_pool_facility_id | facility_facility_id | facility_facility_name |
|---|---|---|---|---|---|---|
| 1 | 128 | Legacy Review D | filtration_system | 1 | 69447 | Integrated Protocol A |
| 2 | lu_tax_code_template_m_I_2 | Regional Initiative | valve | 2 | 1040 | Extended Programme |
| 3 | 1336190 | Seasonal Model | lifeguard_chair | 3 | 2986228 | Pilot Standard |
| 4 | 611514 | Integrated Cluster A | chemical_storage | 4 | ChIJvSxSbfdv5kcRanVzI8RRu20 | Baseline Framework D |

This view joins equipment records with their assigned facilities, answering which facility each piece of equipment is located at. A row from this view might show the Legacy Review D filtration system at facility 1, with the facility's name and compliance status visible. This view supports asset inventory and facility-level equipment audits.

**View `v_pool_equipment_pool_staff_member`**

```sql
CREATE VIEW v_pool_equipment_pool_staff_member AS
SELECT a.pool_equipment_id, a.equipment_id, a.equipment_name, a.equipment_type, b.id AS member_id, b.staff_id AS member_staff_id, b.full_name AS member_full_name
FROM pool_equipments a JOIN pool_staff_members b ON a.pool_staff_member_id = b.id;
```

| pool_equipment_id | equipment_id | equipment_name | equipment_type | member_id | member_staff_id | member_full_name |
|---|---|---|---|---|---|---|
| 1 | 128 | Legacy Review D | filtration_system | 1 | 937735 | Theodore Mcgrath |
| 2 | lu_tax_code_template_m_I_2 | Regional Initiative | valve | 2 | 3158139 | Account Name |
| 3 | 1336190 | Seasonal Model | lifeguard_chair | 3 | 8189502 | Saipan International Airport |
| 4 | 611514 | Integrated Cluster A | chemical_storage | 4 | 69438 | Norma Fisher |

This view connects equipment records with the staff members assigned to them, identifying who is responsible for each piece of equipment. A row from this view might show that Theodore Mcgrath is assigned to the Legacy Review D filtration system. This view supports accountability and ensures that equipment maintenance responsibilities are clearly assigned.

**View `v_pool_equipment_maintenance_activity_detail`**

```sql
CREATE VIEW v_pool_equipment_maintenance_activity_detail AS
SELECT a.pool_equipment_id, a.equipment_id, a.equipment_name, b.maintenance_activity_id AS activity_maintenance_activity_id, b.activity_id AS activity_activity_id, b.activity_type AS activity_activity_type
FROM pool_equipments a
  JOIN equipments_activities j ON j.pool_equipment_id = a.pool_equipment_id
  JOIN maintenance_activities b ON b.maintenance_activity_id = j.maintenance_activity_id;
```

| pool_equipment_id | equipment_id | equipment_name | activity_maintenance_activity_id | activity_activity_id | activity_activity_type |
|---|---|---|---|---|---|
| 1 | 128 | Legacy Review D | 100 | 8843761 | water_quality_monitoring |
| 1 | 128 | Legacy Review D | 101 | 4180957 | filtration_service |
| 2 | lu_tax_code_template_m_I_2 | Regional Initiative | 101 | 4180957 | filtration_service |
| 2 | lu_tax_code_template_m_I_2 | Regional Initiative | 102 | 168545 | chemical_treatment |
| 3 | 1336190 | Seasonal Model | 102 | 168545 | chemical_treatment |
| 3 | 1336190 | Seasonal Model | 103 | default_chart_a_account_53 | equipment_inspection |
| 4 | 611514 | Integrated Cluster A | 103 | default_chart_a_account_53 | equipment_inspection |
| 4 | 611514 | Integrated Cluster A | 100 | 8843761 | water_quality_monitoring |

This view joins equipment records with their maintenance activities, providing a complete maintenance history for each asset. A row from this view might show the Legacy Review D filtration system alongside its water quality monitoring activity (100), including the activity's compliance status and notes. This view is essential for equipment reliability analysis and warranty tracking.

**View `v_aquatic_event_pool_facility`**

```sql
CREATE VIEW v_aquatic_event_pool_facility AS
SELECT a.aquatic_event_id, a.event_id, a.event_name, a.event_type, b.pool_facility_id AS facility_pool_facility_id, b.facility_id AS facility_facility_id, b.facility_name AS facility_facility_name
FROM aquatic_events a JOIN pool_facilities b ON a.pool_facility_id = b.pool_facility_id;
```

| aquatic_event_id | event_id | event_name | event_type | facility_pool_facility_id | facility_facility_id | facility_facility_name |
|---|---|---|---|---|---|---|
| 1000 | 2002007020060 | Seasonal Standard | public_session | 1 | 69447 | Integrated Protocol A |
| 1001 | 168535 | Integrated Framework | swim_lesson | 2 | 1040 | Extended Programme |
| 1002 | ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 | Extended Protocol D | rental | 3 | 2986228 | Pilot Standard |
| 1003 | 1186089 | Pilot Programme | special_event | 4 | ChIJvSxSbfdv5kcRanVzI8RRu20 | Baseline Framework D |

This view joins aquatic events with their host facilities, providing an event-centric view of where programming takes place. A row from this view might show the Seasonal Standard public session at facility 1, with the facility's operating season and compliance status visible. This view supports venue utilization analysis and facility-level event reporting.

**View `v_aquatic_event_pool_staff_member_detail`**

```sql
CREATE VIEW v_aquatic_event_pool_staff_member_detail AS
SELECT a.aquatic_event_id, a.event_id, a.event_name, b.id AS member_id, b.staff_id AS member_staff_id, b.full_name AS member_full_name
FROM aquatic_events a
  JOIN events_members j ON j.aquatic_event_id = a.aquatic_event_id
  JOIN pool_staff_members b ON b.id = j.pool_staff_member_id;
```

| aquatic_event_id | event_id | event_name | member_id | member_staff_id | member_full_name |
|---|---|---|---|---|---|
| 1000 | 2002007020060 | Seasonal Standard | 1 | 937735 | Theodore Mcgrath |
| 1000 | 2002007020060 | Seasonal Standard | 2 | 3158139 | Account Name |
| 1001 | 168535 | Integrated Framework | 2 | 3158139 | Account Name |
| 1001 | 168535 | Integrated Framework | 3 | 8189502 | Saipan International Airport |
| 1002 | ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 | Extended Protocol D | 3 | 8189502 | Saipan International Airport |
| 1002 | ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 | Extended Protocol D | 4 | 69438 | Norma Fisher |
| 1003 | 1186089 | Pilot Programme | 4 | 69438 | Norma Fisher |
| 1003 | 1186089 | Pilot Programme | 1 | 937735 | Theodore Mcgrath |

This view connects aquatic events with the staff members assigned to them, providing a detailed staffing roster for each event. A row from this view might show the Seasonal Standard public session with Theodore Mcgrath listed as an assigned staff member, including his position title and certification status. This view is critical for event staffing compliance, ensuring that each event has adequately credentialed personnel.

**View `v_aquatic_event_maintenance_activity_detail`**

```sql
CREATE VIEW v_aquatic_event_maintenance_activity_detail AS
SELECT a.aquatic_event_id, a.event_id, a.event_name, b.maintenance_activity_id AS activity_maintenance_activity_id, b.activity_id AS activity_activity_id, b.activity_type AS activity_activity_type
FROM aquatic_events a
  JOIN events_activities j ON j.aquatic_event_id = a.aquatic_event_id
  JOIN maintenance_activities b ON b.maintenance_activity_id = j.maintenance_activity_id;
```

| aquatic_event_id | event_id | event_name | activity_maintenance_activity_id | activity_activity_id | activity_activity_type |
|---|---|---|---|---|---|
| 1000 | 2002007020060 | Seasonal Standard | 100 | 8843761 | water_quality_monitoring |
| 1000 | 2002007020060 | Seasonal Standard | 101 | 4180957 | filtration_service |
| 1001 | 168535 | Integrated Framework | 101 | 4180957 | filtration_service |
| 1001 | 168535 | Integrated Framework | 102 | 168545 | chemical_treatment |
| 1002 | ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 | Extended Protocol D | 102 | 168545 | chemical_treatment |
| 1002 | ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 | Extended Protocol D | 103 | default_chart_a_account_53 | equipment_inspection |
| 1003 | 1186089 | Pilot Programme | 103 | default_chart_a_account_53 | equipment_inspection |
| 1003 | 1186089 | Pilot Programme | 100 | 8843761 | water_quality_monitoring |

This view joins aquatic events with their associated maintenance activities, capturing any preparatory or post-event work. A row from this view might show the Seasonal Standard public session alongside the water quality monitoring activity (100) performed at facility 1. This view ensures that event-related maintenance is tracked in context with the event itself, supporting post-event analysis and continuous improvement.

The interlocking structure of these tables and views creates a comprehensive operational picture of aquatic facility management. Facilities serve as the anchor point, with staff, equipment, maintenance activities, and events all radiating outward from them. Staff members carry certifications that must be current, perform maintenance activities that are recorded with compliance status, and are assigned to equipment and events. The junction tables provide the flexibility needed for real-world operations where assignments are fluid and relationships are many-to-many. The detail views synthesize these relationships into readable summaries that support day-to-day decision-making, compliance monitoring, and strategic planning. Together, they form the operational backbone of a system designed to keep aquatic facilities safe, compliant, and well-managed.