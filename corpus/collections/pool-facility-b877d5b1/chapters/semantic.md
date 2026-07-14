The domain under examination is the operational management of public swimming pool facilities, where every physical asset, personnel action, and scheduled event must be tracked against health and safety standards. A municipal authority oversees multiple sites—each with its own compliance posture, seasonal operating window, and roster of certified staff. Within each site, maintenance activities are performed on specialized equipment, aquatic events are hosted for the public, and staff members hold safety certifications that authorize them to work. The ontology that captures this domain distinguishes six core entity types—facilities, staff members, safety certifications, maintenance activities, pool equipments, and aquatic events—and a set of many-to-many associations that bind them together in a normalized relational schema. Every entity type materializes as a base table whose primary key is a surrogate identifier, while its attributes become columns whose data types reflect the semantics of the underlying concept. Relationships that are cardinality-bounded (one-to-many or many-to-one) are expressed as foreign keys embedded in the child table; relationships that are genuinely many-to-many are materialized as junction tables that carry no attributes of their own beyond the two foreign keys. Views then reassemble the normalized facts into denormalized projections that answer the operational questions facility managers actually ask.

**Table `pool_facilities`**

| pool_facility_id | facility_id | facility_name | municipality | state | is_outdoor | operating_season | last_inspection_date | health_department_compliance_status |
|---|---|---|---|---|---|---|---|---|
| 1 | 69447 | Integrated Protocol A | extended-municipa-99 | distributed-state-84 | false | primary-operatin-58 | 2025-04-12 | compliant |
| 2 | 1040 | Extended Programme | integrated-municipa-100 | baseline-state-85 | true | adaptive-operatin-59 | 2022-09-23 | non-compliant |
| 3 | 2986228 | Pilot Standard | seasonal-municipa-101 | pilot-state-86 | false | distributed-operatin-60 | 2023-02-07 | pending |
| 4 | ChIJvSxSbfdv5kcRanVzI8RRu20 | Baseline Framework D | regional-municipa-102 | extended-state-87 | true | baseline-operatin-61 | 2024-07-18 | compliant |

The `pool_facilities` table is the anchor of the schema. Its surrogate primary key, `pool_facility_id`, is an integer that uniquely identifies each site. The business identifier `facility_id` carries a different format—sometimes an integer such as `69447`, sometimes a Google Place ID such as `ChIJvSxSbfdv5kcRanVzI8RRu20`—demonstrating that the ontology allows heterogeneous external identifiers. The `facility_name` column stores human-readable labels like *Integrated Protocol A* or *Baseline Framework D*. The `municipality` and `state` columns hold coded locality identifiers (e.g., `extended-municipa-99`, `distributed-state-84`) rather than free-text addresses, which keeps the schema amenable to geographic joins. The boolean `is_outdoor` distinguishes indoor from outdoor sites, while `operating_season` encodes the seasonal pattern (e.g., `primary-operatin-58`, `adaptive-operatin-59`). The `last_inspection_date` column records the date of the most recent health inspection, and `health_department_compliance_status` captures the outcome as one of `compliant`, `non-compliant`, or `pending`. Together these columns describe a facility's identity, location, operational profile, and regulatory standing.

**Table `pool_staff_members`**

| id | staff_id | full_name | position_title | employment_status | hire_date | termination_date | supervisor_id | certifications | pool_staff_member_id | pool_facility_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 937735 | Theodore Mcgrath | Extended Model | seasonal | 2023-06-01 | 2022-09-11 | account_pymes_255 | distributed-certific-78 | 1 | 1 |
| 2 | 3158139 | Account Name | Pilot Cluster A | temporary | 2024-11-12 | 2023-02-22 | 328 | baseline-certific-79 | 2 | 2 |
| 3 | 8189502 | Saipan International Airport | Baseline Review | full-time | 2025-04-23 | 2024-07-06 | 1996938 | pilot-certific-80 | 3 | 3 |
| 4 | 69438 | Norma Fisher | Distributed Initiative | part-time | 2022-09-07 | 2025-12-17 | ChIJIbRFlPtt5kcR5kM81XdpSfI | extended-certific-81 | 4 | 4 |

Staff members are captured in `pool_staff_members`, whose surrogate primary key is `id`. The business identifier `staff_id` (e.g., `937735`, `3158139`) is distinct from the surrogate. The `full_name` column stores names such as *Theodore Mcgrath* or *Norma Fisher*. The `position_title` column (e.g., *Extended Model*, *Pilot Cluster A*) describes the role, while `employment_status` constrains the value to one of `seasonal`, `temporary`, `full-time`, or `part-time`. The `hire_date` and `termination_date` columns record the employment window; note that in the sample data the termination date can precede the hire date, a data-quality artifact that the ontology does not yet constrain. The `supervisor_id` column is a self-referencing foreign key that points to another row in `pool_staff_members`, establishing a hierarchical reporting structure. The `certifications` column holds a coded certification identifier (e.g., `distributed-certific-78`), and the two foreign keys `pool_staff_member_id` and `pool_facility_id` bind the staff member to their assigned facility. The presence of both `pool_staff_member_id` and `id` as identifiers suggests a dual-key design where `pool_staff_member_id` serves as the stable business key referenced by other tables.

**Table `safety_certifications`**

| id | cert_id | cert_type | issuing_body | issue_date | expiration_date | is_current |
|---|---|---|---|---|---|---|
| 1 | 1152669 | lifeguard | baseline-issuing-13 | 2023-02-01 | 2025-08-18 | true |
| 2 | 10966226 | water_safety_instructor | pilot-issuing-14 | 2024-07-12 | 2022-01-02 | false |
| 3 | 9085245 | first_aid | extended-issuing-15 | 2025-12-23 | 2023-06-13 | true |
| 4 | 15213461 | cpr | integrated-issuing-16 | 2022-05-07 | 2024-11-24 | false |

The `safety_certifications` table stores the credentials that authorize staff to perform safety-critical tasks. Its surrogate primary key is `id`, and the business identifier `cert_id` (e.g., `1152669`, `10966226`) is distinct. The `cert_type` column constrains values to types such as `lifeguard`, `water_safety_instructor`, `first_aid`, and `cpr`. The `issuing_body` column records the organization that granted the credential (e.g., `baseline-issuing-13`). The `issue_date` and `expiration_date` columns define the validity window, and the boolean `is_current` provides a denormalized flag that can be derived from the date columns but is stored explicitly for query efficiency.

**Table `maintenance_activities`**

| maintenance_activity_id | activity_id | activity_type | scheduled_date | completed_date | performed_by | health_standard_compliance | notes | pool_facility_id | pool_staff_member_id |
|---|---|---|---|---|---|---|---|---|---|
| 100 | 8843761 | water_quality_monitoring | 2024-11-27 | 2023-02-11 | extended-performe-57 | false | extended-notes-75 | 1 | 1 |
| 101 | 4180957 | filtration_service | 2025-04-11 | 2024-07-22 | integrated-performe-58 | true | integrated-notes-76 | 2 | 2 |
| 102 | 168545 | chemical_treatment | 2022-09-22 | 2025-12-06 | seasonal-performe-59 | false | seasonal-notes-77 | 3 | 3 |
| 103 | default_chart_a_account_53 | equipment_inspection | 2023-02-06 | 2022-05-17 | regional-performe-60 | true | regional-notes-78 | 4 | 4 |

Maintenance activities are recorded in `maintenance_activities`, whose surrogate primary key is `maintenance_activity_id`. The business identifier `activity_id` (e.g., `8843761`, `4180957`) is distinct. The `activity_type` column categorizes the work as `water_quality_monitoring`, `filtration_service`, `chemical_treatment`, or `equipment_inspection`. The `scheduled_date` and `completed_date` columns capture the planned and actual execution dates. The `performed_by` column holds a coded performer identifier (e.g., `extended-performe-57`), while `health_standard_compliance` is a boolean indicating whether the activity met regulatory standards. The `notes` column stores free-text observations. Two foreign keys, `pool_facility_id` and `pool_staff_member_id`, bind the activity to the site where it was performed and the staff member who performed it.

**Table `pool_equipments`**

| pool_equipment_id | equipment_id | equipment_name | equipment_type | installation_date | last_maintenance_date | operational_status | weight_kg | pool_facility_id | pool_staff_member_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 128 | Legacy Review D | filtration_system | 2022-01-10 | 2024-03-27 | operational | 1.48 | 1 | 1 |
| 2 | lu_tax_code_template_m_I_2 | Regional Initiative | valve | 2023-06-21 | 2025-08-11 | maintenance | 0.385 | 2 | 2 |
| 3 | 1336190 | Seasonal Model | lifeguard_chair | 2024-11-05 | 2022-01-22 | decommissioned | 0.5465680900000001 | 3 | 3 |
| 4 | 611514 | Integrated Cluster A | chemical_storage | 2025-04-16 | 2023-06-06 | operational | 0.9 | 4 | 4 |

Pool equipments are stored in `pool_equipments`, whose surrogate primary key is `pool_equipment_id`. The business identifier `equipment_id` (e.g., `128`, `lu_tax_code_template_m_I_2`) is distinct. The `equipment_name` column stores labels such as *Legacy Review D* or *Regional Initiative*. The `equipment_type` column categorizes the asset as `filtration_system`, `valve`, `lifeguard_chair`, or `chemical_storage`. The `installation_date` and `last_maintenance_date` columns track the asset's lifecycle. The `operational_status` column constrains values to `operational`, `maintenance`, or `decommissioned`. The `weight_kg` column stores a numeric weight (e.g., `1.48`, `0.385`). Two foreign keys, `pool_facility_id` and `pool_staff_member_id`, bind the equipment to its home facility and its assigned custodian.

**Table `aquatic_events`**

| aquatic_event_id | event_id | event_name | event_type | start_date | end_date | capacity | registration_fee | is_cancelled | pool_facility_id |
|---|---|---|---|---|---|---|---|---|---|
| 1000 | 2002007020060 | Seasonal Standard | public_session | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | 32 | 24.01 | false | 1 |
| 1001 | 168535 | Integrated Framework | swim_lesson | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | 41 | 12.87 | true | 2 |
| 1002 | ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 | Extended Protocol D | rental | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | 50 | 19.72 | false | 3 |
| 1003 | 1186089 | Pilot Programme | special_event | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | 59 | 16.11 | true | 4 |

Aquatic events are captured in `aquatic_events`, whose surrogate primary key is `aquatic_event_id`. The business identifier `event_id` (e.g., `2002007020060`, `ab8e1d18-8fcd-11eb-924d-9cd76263cbd0`) is distinct and can be a UUID. The `event_name` column stores labels such as *Seasonal Standard* or *Extended Protocol D*. The `event_type` column categorizes the event as `public_session`, `swim_lesson`, `rental`, or `special_event`. The `start_date` and `end_date` columns store ISO 8601 timestamps (e.g., `2022-09-05T20:24:00`). The `capacity` column is an integer, and `registration_fee` is a decimal (e.g., `24.01`, `12.87`). The boolean `is_cancelled` indicates whether the event was cancelled. The foreign key `pool_facility_id` binds the event to the hosting site.

The six base tables above represent the core entities. The remaining tables are junction tables that materialize many-to-many relationships. In the ontology, a facility can be associated with multiple staff members, and a staff member can be associated with multiple facilities; similarly, facilities are associated with activities and events, staff members hold certifications, and activities involve equipment. These relationships are too complex to express as simple foreign keys and instead require junction tables.

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

The `facilities_members` junction table links facilities to members (staff). It contains at least two foreign keys: one referencing `pool_facilities` and one referencing `pool_staff_members`. This table allows a single facility to have many staff members and a single staff member to be assigned to many facilities.

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

The `facilities_activities` junction table links facilities to maintenance activities. It contains foreign keys referencing `pool_facilities` and `maintenance_activities`, enabling a facility to host many activities and an activity to be associated with multiple facilities.

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

The `facilities_events` junction table links facilities to aquatic events. It contains foreign keys referencing `pool_facilities` and `aquatic_events`, supporting the many-to-many relationship between sites and events.

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

The `members_certifications` junction table links staff members to their safety certifications. It contains foreign keys referencing `pool_staff_members` and `safety_certifications`, allowing a staff member to hold multiple certifications and a certification type to be held by multiple staff members.

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

The `certifications_members` junction table is the inverse perspective of `members_certifications`, linking certifications to members. It contains foreign keys referencing `safety_certifications` and `pool_staff_members`. The existence of both `members_certifications` and `certifications_members` in the schema suggests a bidirectional association model, where each direction is represented as a separate junction table to support efficient queries from either side.

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

The `activities_equipments` junction table links maintenance activities to pool equipments. It contains foreign keys referencing `maintenance_activities` and `pool_equipments`, enabling an activity to involve multiple pieces of equipment and an equipment item to be serviced by multiple activities.

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

The `equipments_activities` junction table is the inverse perspective of `activities_equipments`, linking equipments to activities. It contains foreign keys referencing `pool_equipments` and `maintenance_activities`.

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

The `events_members` junction table links aquatic events to staff members. It contains foreign keys referencing `aquatic_events` and `pool_staff_members`, allowing an event to have multiple staff members assigned and a staff member to work at multiple events.

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

The `events_activities` junction table links aquatic events to maintenance activities. It contains foreign keys referencing `aquatic_events` and `maintenance_activities`, supporting the relationship between events and the maintenance work performed in conjunction with them.

With the base tables and junction tables in place, the schema provides a fully normalized representation of the domain. Views then reassemble these normalized facts into denormalized projections that answer specific operational questions. Each view is a `SELECT` statement that joins the relevant base tables on their foreign keys, producing a wide row that contains all the attributes needed for a particular analytical or reporting purpose.

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

The view `v_pool_facility_pool_staff_member_detail` joins `pool_facilities` with `pool_staff_members` on the facility foreign key. It answers the question: *Which staff members are assigned to which facilities, and what are their employment details?* A row from this view might show that *Theodore Mcgrath* (staff_id `937735`, position *Extended Model*, status `seasonal`) is assigned to the facility named *Integrated Protocol A* (municipality `extended-municipa-99`, state `distributed-state-84`, outdoor `false`). This view is the primary interface for facility staffing reports.

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

The view `v_pool_facility_maintenance_activity_detail` joins `pool_facilities` with `maintenance_activities` on the facility foreign key. It answers: *What maintenance activities have been performed at each facility, and were they compliant?* A row might show that a `water_quality_monitoring` activity (activity_id `8843761`, scheduled `2024-11-27`, completed `2023-02-11`) was performed at *Integrated Protocol A* with `health_standard_compliance` set to `false`. This view supports compliance auditing.

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

The view `v_pool_facility_aquatic_event_detail` joins `pool_facilities` with `aquatic_events` on the facility foreign key. It answers: *What aquatic events are hosted at each facility, and what are their logistical details?* A row might show that *Seasonal Standard* (event_id `2002007020060`, type `public_session`, capacity `32`, fee `24.01`) is hosted at *Integrated Protocol A* and is not cancelled. This view supports event scheduling and revenue tracking.

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

The view `v_pool_staff_member_pool_staff_member` performs a self-join on `pool_staff_members` using the `supervisor_id` column. It answers: *Who reports to whom within the staff hierarchy?* A row might show that *Theodore Mcgrath* (id `1`) reports to supervisor `account_pymes_255`. This view supports organizational chart generation.

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

The view `v_pool_staff_member_pool_facility` joins `pool_staff_members` with `pool_facilities` on the facility foreign key. It answers: *Which facility does each staff member work at, and what is that facility's compliance status?* A row might show that *Account Name* (position *Pilot Cluster A*, status `temporary`) works at *Extended Programme* (municipality `integrated-municipa-100`, compliance `non-compliant`). This view supports facility-level staffing summaries.

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

The view `v_pool_staff_member_safety_certification_detail` joins `pool_staff_members` with `safety_certifications` through the `members_certifications` junction table. It answers: *What safety certifications does each staff member hold, and are they current?* A row might show that *Theodore Mcgrath* holds the certification `distributed-certific-78`. This view supports credential compliance tracking.

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

The view `v_safety_certification_pool_staff_member_detail` joins `safety_certifications` with `pool_staff_members` through the `certifications_members` junction table. It answers the inverse question: *Which staff members hold each certification?* A row might show that the `lifeguard` certification (cert_id `1152669`, issued by `baseline-issuing-13`, currently `true`) is held by a specific staff member. This view supports certification-level staffing analysis.

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

The view `v_maintenance_activity_pool_facility` joins `maintenance_activities` with `pool_facilities` on the facility foreign key. It answers: *At which facility was each maintenance activity performed?* A row might show that the `filtration_service` activity (activity_id `4180957`, completed `2024-07-22`, compliant `true`) was performed at *Extended Programme*. This view supports facility-level maintenance reporting.

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

The view `v_maintenance_activity_pool_staff_member` joins `maintenance_activities` with `pool_staff_members` on the staff member foreign key. It answers: *Which staff member performed each maintenance activity?* A row might show that the `chemical_treatment` activity (activity_id `168545`, scheduled `2022-09-22`) was performed by the staff member assigned to facility `3`. This view supports staff workload analysis.

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

The view `v_maintenance_activity_pool_equipment_detail` joins `maintenance_activities` with `pool_equipments` through the `activities_equipments` or `equipments_activities` junction table. It answers: *Which equipment was serviced by each maintenance activity?* A row might show that the `equipment_inspection` activity (activity_id `default_chart_a_account_53`) involved a specific piece of equipment. This view supports equipment maintenance history tracking.

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

The view `v_pool_equipment_pool_facility` joins `pool_equipments` with `pool_facilities` on the facility foreign key. It answers: *Which facility owns each piece of equipment?* A row might show that the *Legacy Review D* filtration system (pool_equipment_id `1`, weight `1.48` kg, status `operational`) is located at *Integrated Protocol A*. This view supports asset inventory reporting.

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

The view `v_pool_equipment_pool_staff_member` joins `pool_equipments` with `pool_staff_members` on the staff member foreign key. It answers: *Which staff member is responsible for each piece of equipment?* A row might show that the *Regional Initiative* valve (pool_equipment_id `2`, status `maintenance`) is custodied by the staff member at facility `2`. This view supports equipment accountability tracking.

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

The view `v_pool_equipment_maintenance_activity_detail` joins `pool_equipments` with `maintenance_activities` through the junction tables. It answers: *What maintenance activities have been performed on each piece of equipment?* A row might show that the *Seasonal Model* lifeguard chair (pool_equipment_id `3`, last maintenance `2022-01-22`, status `decommissioned`) has associated maintenance records. This view supports equipment lifecycle management.

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

The view `v_aquatic_event_pool_facility` joins `aquatic_events` with `pool_facilities` on the facility foreign key. It answers: *Which facility hosts each aquatic event?* A row might show that *Integrated Framework* (event_id `168535`, type `swim_lesson`, capacity `41`, fee `12.87`, cancelled `true`) is hosted at *Extended Programme*. This view supports event venue reporting.

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

The view `v_aquatic_event_pool_staff_member_detail` joins `aquatic_events` with `pool_staff_members` through the `events_members` junction table. It answers: *Which staff members are assigned to each aquatic event?* A row might show that the *Extended Protocol D* rental event (capacity `50`) has specific staff assignments. This view supports event staffing coordination.

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

The view `v_aquatic_event_maintenance_activity_detail` joins `aquatic_events` with `maintenance_activities` through the `events_activities` junction table. It answers: *What maintenance activities are associated with each aquatic event?* A row might show that the *Pilot Programme* special event (event_id `1186089`, cancelled `true`) has associated maintenance work. This view supports event preparation and safety compliance tracking.

The schema as a whole demonstrates a clean separation between entity data and relationship data. The six base tables store entity attributes in a normalized form, with surrogate primary keys providing stable identifiers and foreign keys encoding one-to-many relationships. The nine junction tables materialize the many-to-many associations that the ontology requires, each carrying two foreign keys and no additional attributes. The twelve views then reassemble these normalized facts into denormalized projections that answer the specific operational questions facility managers need to address. Every view is a deterministic join of its constituent tables, and reading a row from any view is equivalent to reading the corresponding entity records and following their foreign key paths. This design ensures that the relational schema faithfully reflects the ontology's structure while remaining efficient for the analytical queries that drive daily operations.