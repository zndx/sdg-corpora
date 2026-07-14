## The Security Surveillance Domain

A library's physical security infrastructure rests on the coordinated interaction of cameras, properties, recorded footage, incidents, personnel, and external agencies. Each element is tracked through dedicated records that capture identifiers, timestamps, operational states, and cross-references to related entities. The domain's data model organizes these records into seven base tables and a set of analytical views that join them to answer operational questions—what footage exists for a given camera, which incident triggered a particular recording, which staff member reported an event, and which law enforcement body was notified. Understanding the domain requires reading the tables as living records of an active surveillance program and reading the views as lenses that bring related records into a single frame.

**Table `secu_security_cameras`**

| security_camera_id | camera_id | location | installation_date | is_audio_enabled | status | library_property_id | video_surveillance_data_id |
|---|---|---|---|---|---|---|---|
| 1 | 98a0473a-8fcd-11eb-924d-9cd76263cbd0 | extended-location-99 | 2022-01-10T00:12:00 | true | active | 100 | 1 |
| 2 | 4e383924-8fcc-11eb-924d-9cd76263cbd0 | integrated-location-100 | 2023-06-21T07:29:00 | false | inactive | 101 | 2 |
| 3 | 1450647 | seasonal-location-101 | 2024-11-05T14:46:00 | true | maintenance | 102 | 3 |
| 4 | 2839509 | regional-location-102 | 2025-04-16T21:03:00 | false | active | 103 | 4 |

Security cameras form the physical layer of the surveillance network. Each camera carries a UUID-style `camera_id` and a human-readable `location` label such as `extended-location-99` or `regional-location-102`. The `installation_date` anchors the device in time; camera 1 was installed on 2022-01-10, while camera 4 arrived most recently on 2025-04-16. The boolean `is_audio_enabled` flag distinguishes audio-capable units (cameras 1 and 3) from audio-disabled ones (cameras 2 and 4). The `status` column tracks operational readiness: `active`, `inactive`, and `maintenance` are the three states observed in the data. Each camera is associated with a `library_property_id` and a `video_surveillance_data_id`, establishing the first set of cross-references that tie hardware to location and to the footage it produces.

**Table `secu_library_properties`**

| library_property_id | property_id | address | property_type | square_footage | last_inspection_date | security_camera_id | incident_id |
|---|---|---|---|---|---|---|---|
| 100 | 23461971 | distributed-address-72 | exterior | 7.45 | 2025-04-12 | 1 | 1336174 |
| 101 | 9424936 | baseline-address-73 | interior | 11.90 | 2022-09-23 | 2 | state_uk_4 |
| 102 | 4985172 | pilot-address-74 | parking_lot | 16.35 | 2023-02-07 | 3 | 2933483 |
| 103 | 25566008 | extended-address-75 | exterior | 20.80 | 2024-07-18 | 4 | 2986243 |

Library properties represent the physical sites under surveillance. The `property_id` is a numeric identifier, while `address` provides a descriptive label like `distributed-address-72` or `extended-address-75`. The `property_type` categorizes the site as `exterior`, `interior`, or `parking_lot`. The `square_footage` field records the area in some unit (values range from 7.45 to 20.80 in the sample). The `last_inspection_date` tracks the most recent inspection, and the `security_camera_id` and `incident_id` columns create direct links back to the camera monitoring the property and the incident most recently associated with it. Property 100, for example, is an exterior site of 7.45 square feet monitored by camera 1 and linked to incident 1336174.

**Table `secu_video_surveillance_datas`**

| id | data_id | capture_date_time | duration_seconds | data_format | storage_status | access_level | security_camera_id | incident_id | data_storage_system_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 505998 | 2023-10-26T09:51:00 | 31 | mp4 | archived | public | 1 | 1336174 | 1 |
| 2 | 7441152 | 2024-03-10T16:08:00 | 37 | avi | active | staff_only | 2 | state_uk_4 | 2 |
| 3 | 3775 | 2025-08-21T23:25:00 | 43 | mkv | deleted | director_only | 3 | 2933483 | 3 |
| 4 | dirrh | 2022-01-05T06:42:00 | 49 | mp4 | archived | public | 4 | 2986243 | 4 |

Video surveillance data records are the digital output of the camera network. Each record carries a numeric `id`, a `data_id`, a `capture_date_time`, and a `duration_seconds` value ranging from 31 to 49 seconds in the sample. The `data_format` field indicates the file format—`mp4`, `avi`, or `mkv`—while `storage_status` tracks the lifecycle state: `archived`, `active`, or `deleted`. The `access_level` column controls who may view the recording: `public`, `staff_only`, or `director_only`. Each surveillance data record references a `security_camera_id`, an `incident_id`, and a `data_storage_system_id`, forming the central hub of the domain's relational structure. Record 1, captured on 2023-10-26 in mp4 format and archived for public access, is tied to camera 1 and incident 1336174.

**Table `secu_security_incidents`**

| incident_id | incident_date_time | incident_type | severity_level | status | reported_by | library_property_id | video_surveillance_data_id | staff_member_id | law_enforcement_agency_id | created_at |
|---|---|---|---|---|---|---|---|---|---|---|
| 1336174 | 2022-01-08T00:48:00 | theft | low | open | seasonal-reported-77 | 100 | 1 | 100 | 1 | 2025-01-01 00:14:00 |
| state_uk_4 | 2023-06-19T07:05:00 | vandalism | medium | investigating | regional-reported-78 | 101 | 2 | 101 | 2 | 2025-02-06 03:14:00 |
| 2933483 | 2024-11-03T14:22:00 | disruption | high | resolved | legacy-reported-79 | 102 | 3 | 102 | 3 | 2025-03-11 06:14:00 |
| 2986243 | 2025-04-14T21:39:00 | trespassing | critical | closed | compact-reported-80 | 103 | 4 | 103 | 4 | 2025-04-16 09:14:00 |

Security incidents document events that triggered a response from the surveillance system. The `incident_id` serves as the primary key and can be numeric (1336174, 2933483) or alphanumeric (state_uk_4). The `incident_date_time` records when the event occurred, and `incident_type` classifies it as `theft`, `vandalism`, `disruption`, or `trespassing`. The `severity_level` ranges from `low` to `critical`, while `status` tracks the investigation lifecycle: `open`, `investigating`, `resolved`, and `closed`. The `reported_by` field names the source of the report. Each incident links to a `library_property_id`, a `video_surveillance_data_id`, a `staff_member_id`, and a `law_enforcement_agency_id`. Incident 2986243, a critical trespassing event on 2025-04-14, was reported by `compact-reported-80` and is associated with property 103, surveillance data 4, staff member 103, and law enforcement agency 4.

**Table `secu_staff_members`**

| staff_member_id | staff_id | full_name | role | access_level | hire_date | video_surveillance_data_id | incident_id | reports_to_staff_member_id |
|---|---|---|---|---|---|---|---|---|
| 100 | 937735 | Theodore Mcgrath | library_director | full | 2023-06-01 | 1 | 1336174 | 100 |
| 101 | 3158139 | Account Name | board_chair | limited | 2024-11-12 | 2 | state_uk_4 | 101 |
| 102 | 8189502 | Saipan International Airport | staff | none | 2025-04-23 | 3 | 2933483 | 102 |
| 103 | 69438 | Norma Fisher | other | full | 2022-09-07 | 4 | 2986243 | 103 |

Staff members are the personnel who operate and respond within the surveillance domain. The `staff_member_id` is the primary key, and `staff_id` provides an additional identifier. The `full_name` field holds the person's name—Theodore Mcgrath, Account Name, Saipan International Airport, Norma Fisher—while `role` classifies their position as `library_director`, `board_chair`, `staff`, or `other`. The `access_level` determines their system permissions (`full`, `limited`, or `none`), and `hire_date` records their start date. Each staff member record references a `video_surveillance_data_id`, an `incident_id`, and a `reports_to_staff_member_id`, enabling hierarchical and event-based queries. Staff member 100, Theodore Mcgrath, holds the `library_director` role with full access and reports to themselves, indicating a top-level position.

**Table `secu_law_enforcement_agencies`**

| law_enforcement_agency_id | agency_id | agency_name | agency_type | contact_email | contact_phone | video_surveillance_data_id | incident_id |
|---|---|---|---|---|---|---|---|
| 1 | U.S. Steel | FSG Social Impact Advisors | police | Christopher Wilson | Joe Tsai | 1 | 1336174 |
| 2 | Nikola Corporation | Whirlpool Corporation | dfs | Charles Larsen | Stephanie Collins | 2 | state_uk_4 |
| 3 | Oberthur Technologies | Education Writers Association | federal | Mary Alvarez | Tasha Rodriguez | 3 | 2933483 |
| 4 | General Telephone & Electronics | Switch Card Services Ltd. | state | April Snyder | Walter Pratt | 4 | 2986243 |

Law enforcement agencies represent the external bodies notified of security incidents. The `law_enforcement_agency_id` is the primary key, and `agency_id` provides an additional identifier that in the sample data contains organization names such as U.S. Steel and Nikola Corporation. The `agency_name` field holds the formal name (FSG Social Impact Advisors, Whirlpool Corporation, Education Writers Association, Switch Card Services Ltd.), while `agency_type` classifies the agency as `police`, `dfs`, `federal`, or `state`. The `contact_email` and `contact_phone` fields store contact information. Each agency references a `video_surveillance_data_id` and an `incident_id`, linking it to the specific event and footage that triggered the notification. Agency 1, FSG Social Impact Advisors, is a police agency contacted regarding incident 1336174.

**Table `secu_data_storage_systems`**

| id | system_id | system_name | storage_capacity_g_b | last_backup_date | encryption_status | video_surveillance_data_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|
| 1 | 8189503 | Legacy Programme D | 4.20 | 2022-05-27 | false | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | 3717623 | Regional Standard | 7.40 | 2023-10-11 | true | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | 7441161 | Seasonal Framework | 10.60 | 2024-03-22 | false | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | 605963 | Integrated Protocol A | 13.80 | 2025-08-06 | true | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Data storage systems provide the infrastructure for retaining video surveillance recordings. Each system is identified by a `data_storage_system_id` and carries a `system_name`, `storage_capacity_gb`, `current_usage_gb`, `storage_type`, `location`, and `status` fields. The `status` column tracks whether a system is `active` or `inactive`. The `video_surveillance_data_id` column links each storage system to the specific surveillance data it holds. In the sample, four storage systems are in active status, each associated with one surveillance data record.

The base tables establish the entities; the views bring them together to answer operational questions. Each view is a join that combines two or more tables, producing a result set that answers a specific query about the domain.

**View `v_security_camera_library_property`**

```sql
CREATE VIEW v_security_camera_library_property AS
SELECT a.security_camera_id, a.camera_id, a.location, a.installation_date, b.library_property_id AS property_library_property_id, b.property_id AS property_property_id, b.address AS property_address
FROM secu_security_cameras a JOIN secu_library_properties b ON a.library_property_id = b.library_property_id;
```

| security_camera_id | camera_id | location | installation_date | property_library_property_id | property_property_id | property_address |
|---|---|---|---|---|---|---|
| 1 | 98a0473a-8fcd-11eb-924d-9cd76263cbd0 | extended-location-99 | 2022-01-10T00:12:00 | 100 | 23461971 | distributed-address-72 |
| 2 | 4e383924-8fcc-11eb-924d-9cd76263cbd0 | integrated-location-100 | 2023-06-21T07:29:00 | 101 | 9424936 | baseline-address-73 |
| 3 | 1450647 | seasonal-location-101 | 2024-11-05T14:46:00 | 102 | 4985172 | pilot-address-74 |
| 4 | 2839509 | regional-location-102 | 2025-04-16T21:03:00 | 103 | 25566008 | extended-address-75 |

This view joins security cameras with their associated library properties, answering the question: which property does each camera monitor? The result combines the camera's `camera_id`, `location`, `installation_date`, `is_audio_enabled`, and `status` with the property's `property_id`, `address`, `property_type`, `square_footage`, and `last_inspection_date`. Camera 1 at `extended-location-99`, installed on 2022-01-10 with audio enabled and active status, monitors property 100 at `distributed-address-72`, an exterior site of 7.45 square feet last inspected on 2025-04-12.

**View `v_security_camera_video_surveillance_data`**

```sql
CREATE VIEW v_security_camera_video_surveillance_data AS
SELECT a.security_camera_id, a.camera_id, a.location, a.installation_date, b.id AS data_id, b.data_id AS data_data_id, b.capture_date_time AS data_capture_date_time
FROM secu_security_cameras a JOIN secu_video_surveillance_datas b ON a.video_surveillance_data_id = b.id;
```

| security_camera_id | camera_id | location | installation_date | data_id | data_data_id | data_capture_date_time |
|---|---|---|---|---|---|---|
| 1 | 98a0473a-8fcd-11eb-924d-9cd76263cbd0 | extended-location-99 | 2022-01-10T00:12:00 | 1 | 505998 | 2023-10-26T09:51:00 |
| 2 | 4e383924-8fcc-11eb-924d-9cd76263cbd0 | integrated-location-100 | 2023-06-21T07:29:00 | 2 | 7441152 | 2024-03-10T16:08:00 |
| 3 | 1450647 | seasonal-location-101 | 2024-11-05T14:46:00 | 3 | 3775 | 2025-08-21T23:25:00 |
| 4 | 2839509 | regional-location-102 | 2025-04-16T21:03:00 | 4 | dirrh | 2022-01-05T06:42:00 |

This view links cameras to the surveillance data they produce, answering: what footage has each camera generated? The join combines camera attributes with the recording's `data_id`, `capture_date_time`, `duration_seconds`, `data_format`, `storage_status`, and `access_level`. Camera 1 produced recording 1, captured on 2023-10-26 at 09:51, lasting 31 seconds in mp4 format, archived and publicly accessible.

**View `v_library_property_security_camera`**

```sql
CREATE VIEW v_library_property_security_camera AS
SELECT a.library_property_id, a.property_id, a.address, a.property_type, b.security_camera_id AS camera_security_camera_id, b.camera_id AS camera_camera_id, b.location AS camera_location
FROM secu_library_properties a JOIN secu_security_cameras b ON a.security_camera_id = b.security_camera_id;
```

| library_property_id | property_id | address | property_type | camera_security_camera_id | camera_camera_id | camera_location |
|---|---|---|---|---|---|---|
| 100 | 23461971 | distributed-address-72 | exterior | 1 | 98a0473a-8fcd-11eb-924d-9cd76263cbd0 | extended-location-99 |
| 101 | 9424936 | baseline-address-73 | interior | 2 | 4e383924-8fcc-11eb-924d-9cd76263cbd0 | integrated-location-100 |
| 102 | 4985172 | pilot-address-74 | parking_lot | 3 | 1450647 | seasonal-location-101 |
| 103 | 25566008 | extended-address-75 | exterior | 4 | 2839509 | regional-location-102 |

This view presents the relationship from the property's perspective, answering: which camera is assigned to this property? It mirrors the information in `v_security_camera_library_property` but is structured to support queries that start from a property and look outward to its monitoring equipment. Property 103 at `extended-address-75`, an exterior site of 20.80 square feet, is monitored by camera 4 at `regional-location-102`, installed on 2025-04-16 with audio disabled and active status.

**View `v_library_property_security_incident`**

```sql
CREATE VIEW v_library_property_security_incident AS
SELECT a.library_property_id, a.property_id, a.address, a.property_type, b.incident_id AS incident_incident_id, b.incident_date_time AS incident_incident_date_time, b.incident_type AS incident_incident_type
FROM secu_library_properties a JOIN secu_security_incidents b ON a.incident_id = b.incident_id;
```

| library_property_id | property_id | address | property_type | incident_incident_id | incident_incident_date_time | incident_incident_type |
|---|---|---|---|---|---|---|
| 100 | 23461971 | distributed-address-72 | exterior | 1336174 | 2022-01-08T00:48:00 | theft |
| 101 | 9424936 | baseline-address-73 | interior | state_uk_4 | 2023-06-19T07:05:00 | vandalism |
| 102 | 4985172 | pilot-address-74 | parking_lot | 2933483 | 2024-11-03T14:22:00 | disruption |
| 103 | 25566008 | extended-address-75 | exterior | 2986243 | 2025-04-14T21:39:00 | trespassing |

This view connects properties to incidents, answering: what incidents have been associated with each property? The join brings together property details with incident attributes including `incident_date_time`, `incident_type`, `severity_level`, `status`, and `reported_by`. Property 101 at `baseline-address-73` is linked to incident `state_uk_4`, a vandalism event of medium severity, currently under investigation, reported by `regional-reported-78` on 2023-06-19.

**View `v_video_surveillance_data_security_camera`**

```sql
CREATE VIEW v_video_surveillance_data_security_camera AS
SELECT a.id, a.data_id, a.capture_date_time, a.duration_seconds, b.security_camera_id AS camera_security_camera_id, b.camera_id AS camera_camera_id, b.location AS camera_location
FROM secu_video_surveillance_datas a JOIN secu_security_cameras b ON a.security_camera_id = b.security_camera_id;
```

| id | data_id | capture_date_time | duration_seconds | camera_security_camera_id | camera_camera_id | camera_location |
|---|---|---|---|---|---|---|
| 1 | 505998 | 2023-10-26T09:51:00 | 31 | 1 | 98a0473a-8fcd-11eb-924d-9cd76263cbd0 | extended-location-99 |
| 2 | 7441152 | 2024-03-10T16:08:00 | 37 | 2 | 4e383924-8fcc-11eb-924d-9cd76263cbd0 | integrated-location-100 |
| 3 | 3775 | 2025-08-21T23:25:00 | 43 | 3 | 1450647 | seasonal-location-101 |
| 4 | dirrh | 2022-01-05T06:42:00 | 49 | 4 | 2839509 | regional-location-102 |

This view presents the camera-to-data relationship from the recording's perspective, answering: which camera generated this recording? It pairs surveillance data attributes with the originating camera's location, installation date, audio capability, and status. Recording 3, captured on 2025-08-21 in mkv format with 43 seconds duration and deleted storage status, was produced by camera 3 at `seasonal-location-101`, which is currently in maintenance.

**View `v_video_surveillance_data_security_incident`**

```sql
CREATE VIEW v_video_surveillance_data_security_incident AS
SELECT a.id, a.data_id, a.capture_date_time, a.duration_seconds, b.incident_id AS incident_incident_id, b.incident_date_time AS incident_incident_date_time, b.incident_type AS incident_incident_type
FROM secu_video_surveillance_datas a JOIN secu_security_incidents b ON a.incident_id = b.incident_id;
```

| id | data_id | capture_date_time | duration_seconds | incident_incident_id | incident_incident_date_time | incident_incident_type |
|---|---|---|---|---|---|---|
| 1 | 505998 | 2023-10-26T09:51:00 | 31 | 1336174 | 2022-01-08T00:48:00 | theft |
| 2 | 7441152 | 2024-03-10T16:08:00 | 37 | state_uk_4 | 2023-06-19T07:05:00 | vandalism |
| 3 | 3775 | 2025-08-21T23:25:00 | 43 | 2933483 | 2024-11-03T14:22:00 | disruption |
| 4 | dirrh | 2022-01-05T06:42:00 | 49 | 2986243 | 2025-04-14T21:39:00 | trespassing |

This view links surveillance recordings to the incidents they document, answering: what incident does this recording relate to? The join combines recording details with incident attributes. Recording 2, an avi file captured on 2024-03-10 lasting 37 seconds with staff-only access, is associated with incident `state_uk_4`, a vandalism event of medium severity that is currently being investigated.

**View `v_video_surveillance_data_data_storage_system`**

```sql
CREATE VIEW v_video_surveillance_data_data_storage_system AS
SELECT a.id, a.data_id, a.capture_date_time, a.duration_seconds, b.id AS system_id, b.system_id AS system_system_id, b.system_name AS system_system_name
FROM secu_video_surveillance_datas a JOIN secu_data_storage_systems b ON a.data_storage_system_id = b.id;
```

| id | data_id | capture_date_time | duration_seconds | system_id | system_system_id | system_system_name |
|---|---|---|---|---|---|---|
| 1 | 505998 | 2023-10-26T09:51:00 | 31 | 1 | 8189503 | Legacy Programme D |
| 2 | 7441152 | 2024-03-10T16:08:00 | 37 | 2 | 3717623 | Regional Standard |
| 3 | 3775 | 2025-08-21T23:25:00 | 43 | 3 | 7441161 | Seasonal Framework |
| 4 | dirrh | 2022-01-05T06:42:00 | 49 | 4 | 605963 | Integrated Protocol A |

This view connects surveillance data to the storage systems that hold it, answering: where is this recording stored? The join pairs recording attributes with the storage system's name, capacity, usage, type, location, and status. Recording 4, an mp4 file captured on 2022-01-05 with archived status, is stored on data storage system 4, which is active.

**View `v_security_incident_library_property`**

```sql
CREATE VIEW v_security_incident_library_property AS
SELECT a.incident_id, a.incident_date_time, a.incident_type, a.severity_level, b.library_property_id AS property_library_property_id, b.property_id AS property_property_id, b.address AS property_address
FROM secu_security_incidents a JOIN secu_library_properties b ON a.library_property_id = b.library_property_id;
```

| incident_id | incident_date_time | incident_type | severity_level | property_library_property_id | property_property_id | property_address |
|---|---|---|---|---|---|---|
| 1336174 | 2022-01-08T00:48:00 | theft | low | 100 | 23461971 | distributed-address-72 |
| state_uk_4 | 2023-06-19T07:05:00 | vandalism | medium | 101 | 9424936 | baseline-address-73 |
| 2933483 | 2024-11-03T14:22:00 | disruption | high | 102 | 4985172 | pilot-address-74 |
| 2986243 | 2025-04-14T21:39:00 | trespassing | critical | 103 | 25566008 | extended-address-75 |

This view presents the incident-to-property relationship, answering: which property was affected by this incident? It combines incident details with property information. Incident 2933483, a high-severity disruption on 2024-11-03 that has been resolved, affected property 102 at `pilot-address-74`, a parking lot of 16.35 square feet last inspected on 2023-02-07.

**View `v_security_incident_video_surveillance_data`**

```sql
CREATE VIEW v_security_incident_video_surveillance_data AS
SELECT a.incident_id, a.incident_date_time, a.incident_type, a.severity_level, b.id AS data_id, b.data_id AS data_data_id, b.capture_date_time AS data_capture_date_time
FROM secu_security_incidents a JOIN secu_video_surveillance_datas b ON a.video_surveillance_data_id = b.id;
```

| incident_id | incident_date_time | incident_type | severity_level | data_id | data_data_id | data_capture_date_time |
|---|---|---|---|---|---|---|
| 1336174 | 2022-01-08T00:48:00 | theft | low | 1 | 505998 | 2023-10-26T09:51:00 |
| state_uk_4 | 2023-06-19T07:05:00 | vandalism | medium | 2 | 7441152 | 2024-03-10T16:08:00 |
| 2933483 | 2024-11-03T14:22:00 | disruption | high | 3 | 3775 | 2025-08-21T23:25:00 |
| 2986243 | 2025-04-14T21:39:00 | trespassing | critical | 4 | dirrh | 2022-01-05T06:42:00 |

This view links incidents to their associated recordings, answering: what footage documents this incident? The join pairs incident attributes with recording details. Incident 1336174, a low-severity theft on 2022-01-08 that remains open, is documented by recording 1, an mp4 file of 31 seconds duration captured on 2023-10-26 and archived for public access.

**View `v_security_incident_staff_member`**

```sql
CREATE VIEW v_security_incident_staff_member AS
SELECT a.incident_id, a.incident_date_time, a.incident_type, a.severity_level, b.staff_member_id AS member_staff_member_id, b.staff_id AS member_staff_id, b.full_name AS member_full_name
FROM secu_security_incidents a JOIN secu_staff_members b ON a.staff_member_id = b.staff_member_id;
```

| incident_id | incident_date_time | incident_type | severity_level | member_staff_member_id | member_staff_id | member_full_name |
|---|---|---|---|---|---|---|
| 1336174 | 2022-01-08T00:48:00 | theft | low | 100 | 937735 | Theodore Mcgrath |
| state_uk_4 | 2023-06-19T07:05:00 | vandalism | medium | 101 | 3158139 | Account Name |
| 2933483 | 2024-11-03T14:22:00 | disruption | high | 102 | 8189502 | Saipan International Airport |
| 2986243 | 2025-04-14T21:39:00 | trespassing | critical | 103 | 69438 | Norma Fisher |

This view connects incidents to the staff members who reported them, answering: which staff member reported this incident? The join combines incident details with staff member attributes including name, role, access level, and hire date. Incident 2986243, a critical trespassing event that is now closed, was reported by staff member 103, Norma Fisher, who holds the `other` role with full access and was hired on 2022-09-07.

**View `v_security_incident_law_enforcement_agency`**

```sql
CREATE VIEW v_security_incident_law_enforcement_agency AS
SELECT a.incident_id, a.incident_date_time, a.incident_type, a.severity_level, b.law_enforcement_agency_id AS agency_law_enforcement_agency_id, b.agency_id AS agency_agency_id, b.agency_name AS agency_agency_name
FROM secu_security_incidents a JOIN secu_law_enforcement_agencies b ON a.law_enforcement_agency_id = b.law_enforcement_agency_id;
```

| incident_id | incident_date_time | incident_type | severity_level | agency_law_enforcement_agency_id | agency_agency_id | agency_agency_name |
|---|---|---|---|---|---|---|
| 1336174 | 2022-01-08T00:48:00 | theft | low | 1 | U.S. Steel | FSG Social Impact Advisors |
| state_uk_4 | 2023-06-19T07:05:00 | vandalism | medium | 2 | Nikola Corporation | Whirlpool Corporation |
| 2933483 | 2024-11-03T14:22:00 | disruption | high | 3 | Oberthur Technologies | Education Writers Association |
| 2986243 | 2025-04-14T21:39:00 | trespassing | critical | 4 | General Telephone & Electronics | Switch Card Services Ltd. |

This view links incidents to the law enforcement agencies that were notified, answering: which agency was contacted for this incident? The join pairs incident attributes with agency details. Incident `state_uk_4`, a medium-severity vandalism event under investigation, was referred to agency 2, Whirlpool Corporation, a dfs-type agency contacted via Charles Larsen at the phone number listed as Stephanie Collins.

**View `v_staff_member_video_surveillance_data`**

```sql
CREATE VIEW v_staff_member_video_surveillance_data AS
SELECT a.staff_member_id, a.staff_id, a.full_name, a.role, b.id AS data_id, b.data_id AS data_data_id, b.capture_date_time AS data_capture_date_time
FROM secu_staff_members a JOIN secu_video_surveillance_datas b ON a.video_surveillance_data_id = b.id;
```

| staff_member_id | staff_id | full_name | role | data_id | data_data_id | data_capture_date_time |
|---|---|---|---|---|---|---|
| 100 | 937735 | Theodore Mcgrath | library_director | 1 | 505998 | 2023-10-26T09:51:00 |
| 101 | 3158139 | Account Name | board_chair | 2 | 7441152 | 2024-03-10T16:08:00 |
| 102 | 8189502 | Saipan International Airport | staff | 3 | 3775 | 2025-08-21T23:25:00 |
| 103 | 69438 | Norma Fisher | other | 4 | dirrh | 2022-01-05T06:42:00 |

This view connects staff members to the surveillance data they are associated with, answering: what footage is linked to this staff member? The join combines staff member attributes with recording details. Staff member 101, Account Name, a board chair with limited access hired on 2024-11-12, is associated with recording 2, an avi file of 37 seconds duration captured on 2024-03-10 with staff-only access.

**View `v_staff_member_security_incident`**

```sql
CREATE VIEW v_staff_member_security_incident AS
SELECT a.staff_member_id, a.staff_id, a.full_name, a.role, b.incident_id AS incident_incident_id, b.incident_date_time AS incident_incident_date_time, b.incident_type AS incident_incident_type
FROM secu_staff_members a JOIN secu_security_incidents b ON a.incident_id = b.incident_id;
```

| staff_member_id | staff_id | full_name | role | incident_incident_id | incident_incident_date_time | incident_incident_type |
|---|---|---|---|---|---|---|
| 100 | 937735 | Theodore Mcgrath | library_director | 1336174 | 2022-01-08T00:48:00 | theft |
| 101 | 3158139 | Account Name | board_chair | state_uk_4 | 2023-06-19T07:05:00 | vandalism |
| 102 | 8189502 | Saipan International Airport | staff | 2933483 | 2024-11-03T14:22:00 | disruption |
| 103 | 69438 | Norma Fisher | other | 2986243 | 2025-04-14T21:39:00 | trespassing |

This view links staff members to the incidents they reported, answering: what incidents has this staff member reported? The join pairs staff member details with incident attributes. Staff member 100, Theodore Mcgrath, the library director with full access hired on 2023-06-01, reported incident 1336174, a low-severity theft that remains open.

**View `v_staff_member_staff_member`**

```sql
CREATE VIEW v_staff_member_staff_member AS
SELECT a.staff_member_id, a.staff_id, a.full_name, a.role, b.staff_member_id AS member_staff_member_id, b.staff_id AS member_staff_id, b.full_name AS member_full_name
FROM secu_staff_members a JOIN secu_staff_members b ON a.reports_to_staff_member_id = b.staff_member_id;
```

| staff_member_id | staff_id | full_name | role | member_staff_member_id | member_staff_id | member_full_name |
|---|---|---|---|---|---|---|
| 100 | 937735 | Theodore Mcgrath | library_director | 100 | 937735 | Theodore Mcgrath |
| 101 | 3158139 | Account Name | board_chair | 101 | 3158139 | Account Name |
| 102 | 8189502 | Saipan International Airport | staff | 102 | 8189502 | Saipan International Airport |
| 103 | 69438 | Norma Fisher | other | 103 | 69438 | Norma Fisher |

This view captures the reporting hierarchy among staff members, answering: who does each staff member report to? The join links a staff member's attributes with their supervisor's attributes. Staff member 100, Theodore Mcgrath, reports to staff member 100, indicating a self-referencing top-level position. Staff member 101, Account Name, reports to staff member 101, also self-referencing.

**View `v_law_enforcement_agency_video_surveillance_data`**

```sql
CREATE VIEW v_law_enforcement_agency_video_surveillance_data AS
SELECT a.law_enforcement_agency_id, a.agency_id, a.agency_name, a.agency_type, b.id AS data_id, b.data_id AS data_data_id, b.capture_date_time AS data_capture_date_time
FROM secu_law_enforcement_agencies a JOIN secu_video_surveillance_datas b ON a.video_surveillance_data_id = b.id;
```

| law_enforcement_agency_id | agency_id | agency_name | agency_type | data_id | data_data_id | data_capture_date_time |
|---|---|---|---|---|---|---|
| 1 | U.S. Steel | FSG Social Impact Advisors | police | 1 | 505998 | 2023-10-26T09:51:00 |
| 2 | Nikola Corporation | Whirlpool Corporation | dfs | 2 | 7441152 | 2024-03-10T16:08:00 |
| 3 | Oberthur Technologies | Education Writers Association | federal | 3 | 3775 | 2025-08-21T23:25:00 |
| 4 | General Telephone & Electronics | Switch Card Services Ltd. | state | 4 | dirrh | 2022-01-05T06:42:00 |

This view connects law enforcement agencies to the surveillance data relevant to their cases, answering: what footage is associated with this agency's incidents? The join pairs agency details with recording attributes. Agency 3, Education Writers Association, a federal agency contacted via Mary Alvarez, is associated with recording 3, an mkv file of 43 seconds duration captured on 2025-08-21 with deleted storage status.

**View `v_law_enforcement_agency_security_incident`**

```sql
CREATE VIEW v_law_enforcement_agency_security_incident AS
SELECT a.law_enforcement_agency_id, a.agency_id, a.agency_name, a.agency_type, b.incident_id AS incident_incident_id, b.incident_date_time AS incident_incident_date_time, b.incident_type AS incident_incident_type
FROM secu_law_enforcement_agencies a JOIN secu_security_incidents b ON a.incident_id = b.incident_id;
```

| law_enforcement_agency_id | agency_id | agency_name | agency_type | incident_incident_id | incident_incident_date_time | incident_incident_type |
|---|---|---|---|---|---|---|
| 1 | U.S. Steel | FSG Social Impact Advisors | police | 1336174 | 2022-01-08T00:48:00 | theft |
| 2 | Nikola Corporation | Whirlpool Corporation | dfs | state_uk_4 | 2023-06-19T07:05:00 | vandalism |
| 3 | Oberthur Technologies | Education Writers Association | federal | 2933483 | 2024-11-03T14:22:00 | disruption |
| 4 | General Telephone & Electronics | Switch Card Services Ltd. | state | 2986243 | 2025-04-14T21:39:00 | trespassing |

This view links law enforcement agencies to the incidents they were notified about, answering: what incidents has this agency been involved with? The join combines agency details with incident attributes. Agency 4, Switch Card Services Ltd., a state agency contacted via April Snyder, was notified of incident 2986243, a critical trespassing event that is now closed.

**View `v_data_storage_system_video_surveillance_data`**

```sql
CREATE VIEW v_data_storage_system_video_surveillance_data AS
SELECT a.id, a.system_id, a.system_name, a.storage_capacity_g_b, b.id AS data_id, b.data_id AS data_data_id, b.capture_date_time AS data_capture_date_time
FROM secu_data_storage_systems a JOIN secu_video_surveillance_datas b ON a.video_surveillance_data_id = b.id;
```

| id | system_id | system_name | storage_capacity_g_b | data_id | data_data_id | data_capture_date_time |
|---|---|---|---|---|---|---|
| 1 | 8189503 | Legacy Programme D | 4.20 | 1 | 505998 | 2023-10-26T09:51:00 |
| 2 | 3717623 | Regional Standard | 7.40 | 2 | 7441152 | 2024-03-10T16:08:00 |
| 3 | 7441161 | Seasonal Framework | 10.60 | 3 | 3775 | 2025-08-21T23:25:00 |
| 4 | 605963 | Integrated Protocol A | 13.80 | 4 | dirrh | 2022-01-05T06:42:00 |

This view presents the storage-to-data relationship, answering: what recordings are held by this storage system? The join pairs storage system attributes with recording details. Data storage system 3, which is active, holds recording 3, an mkv file captured on 2025-08-21 with 43 seconds duration and deleted storage status.

The security surveillance domain is a tightly coupled system where cameras, properties, recordings, incidents, personnel, agencies, and storage infrastructure form an integrated operational network. The base tables capture the state of each entity at a point in time, while the views provide the analytical bridges that connect them. A practitioner querying the domain moves naturally between these layers: starting from a camera to find its property, following an incident to its recording, tracing a report to the staff member who filed it, or identifying the storage system that preserves the evidence. The data model supports this navigation through consistent foreign-key relationships and a set of views that answer the most common operational questions without requiring ad hoc joins.