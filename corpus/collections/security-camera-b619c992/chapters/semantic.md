## Modelling Security Surveillance as a Normalised Relational Schema

The domain under examination concerns the management of physical security infrastructure across a portfolio of library properties. At its core, the model tracks four interlocking concerns: the surveillance hardware deployed on-site, the properties themselves, the video recordings those cameras produce, and the security incidents that arise. Supporting these are the personnel who operate the system, the law-enforcement agencies that respond to incidents, and the data-storage systems that retain the recordings. The relational schema is designed so that every domain entity becomes a base table, every attribute becomes a column, and every foreign-key relationship becomes an explicit join path. Views then materialise the most common multi-entity questions as single-row facts.

**Table `secu_security_cameras`**

| security_camera_id | camera_id | location | installation_date | is_audio_enabled | status | library_property_id | video_surveillance_data_id |
|---|---|---|---|---|---|---|---|
| 1 | 98a0473a-8fcd-11eb-924d-9cd76263cbd0 | extended-location-99 | 2022-01-10T00:12:00 | true | active | 100 | 1 |
| 2 | 4e383924-8fcc-11eb-924d-9cd76263cbd0 | integrated-location-100 | 2023-06-21T07:29:00 | false | inactive | 101 | 2 |
| 3 | 1450647 | seasonal-location-101 | 2024-11-05T14:46:00 | true | maintenance | 102 | 3 |
| 4 | 2839509 | regional-location-102 | 2025-04-16T21:03:00 | false | active | 103 | 4 |

The `secu_security_cameras` table is the hardware registry. Each row represents one camera, identified by a surrogate `security_camera_id` (an auto-incrementing integer) and a business `camera_id` that carries a UUID such as `98a0473a-8fcd-11eb-924d-9cd76263cbd0` or a short numeric code like `1450647`. The `location` column stores a human-readable site label — `extended-location-99`, `integrated-location-100`, `seasonal-location-101` — while `installation_date` records when the hardware was commissioned. Boolean `is_audio_enabled` and categorical `status` (values include `active`, `inactive`, `maintenance`) describe the camera's operational posture. Two foreign-key columns, `library_property_id` and `video_surveillance_data_id`, anchor the camera to the property it monitors and to the first video recording it produced. Row 1, for example, links camera `98a0473a-8fcd-11eb-924d-9cd76263cbd0` at `extended-location-99` to property `100` and to video data record `1`.

**Table `secu_library_properties`**

| library_property_id | property_id | address | property_type | square_footage | last_inspection_date | security_camera_id | incident_id |
|---|---|---|---|---|---|---|---|
| 100 | 23461971 | distributed-address-72 | exterior | 7.45 | 2025-04-12 | 1 | 1336174 |
| 101 | 9424936 | baseline-address-73 | interior | 11.90 | 2022-09-23 | 2 | state_uk_4 |
| 102 | 4985172 | pilot-address-74 | parking_lot | 16.35 | 2023-02-07 | 3 | 2933483 |
| 103 | 25566008 | extended-address-75 | exterior | 20.80 | 2024-07-18 | 4 | 2986243 |

The `secu_library_properties` table models the physical sites. Its surrogate key is `library_property_id` (100–103 in the sample), and the business identifier `property_id` carries values such as `23461971` or `25566008`. The `address` column holds descriptive strings like `distributed-address-72` or `baseline-address-73`, while `property_type` classifies the site as `exterior`, `interior`, or `parking_lot`. `square_footage` stores a decimal measurement (7.45 through 20.80 in the sample), and `last_inspection_date` records the most recent audit. Foreign keys `security_camera_id` and `incident_id` create a direct link from each property to the camera installed there and to the most recent incident logged at that site. Property `100` (`distributed-address-72`, `exterior`, 7.45 sq ft) is monitored by camera `1` and has incident `1336174` on record.

**Table `secu_video_surveillance_datas`**

| id | data_id | capture_date_time | duration_seconds | data_format | storage_status | access_level | security_camera_id | incident_id | data_storage_system_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 505998 | 2023-10-26T09:51:00 | 31 | mp4 | archived | public | 1 | 1336174 | 1 |
| 2 | 7441152 | 2024-03-10T16:08:00 | 37 | avi | active | staff_only | 2 | state_uk_4 | 2 |
| 3 | 3775 | 2025-08-21T23:25:00 | 43 | mkv | deleted | director_only | 3 | 2933483 | 3 |
| 4 | dirrh | 2022-01-05T06:42:00 | 49 | mp4 | archived | public | 4 | 2986243 | 4 |

Video recordings live in `secu_video_surveillance_datas`. The surrogate `id` (1–4) is paired with a business `data_id` such as `505998` or `dirrh`. The `capture_date_time` column (e.g. `2023-10-26T09:51:00`) and `duration_seconds` (31–49) describe the recording window. `data_format` stores the codec (`mp4`, `avi`, `mkv`), while `storage_status` (`archived`, `active`, `deleted`) and `access_level` (`public`, `staff_only`, `director_only`) govern retention and permissions. Three foreign keys — `security_camera_id`, `incident_id`, and `data_storage_system_id` — tie each recording to the camera that captured it, the incident it documents, and the storage system that holds it.

**Table `secu_security_incidents`**

| incident_id | incident_date_time | incident_type | severity_level | status | reported_by | library_property_id | video_surveillance_data_id | staff_member_id | law_enforcement_agency_id | created_at |
|---|---|---|---|---|---|---|---|---|---|---|
| 1336174 | 2022-01-08T00:48:00 | theft | low | open | seasonal-reported-77 | 100 | 1 | 100 | 1 | 2025-01-01 00:14:00 |
| state_uk_4 | 2023-06-19T07:05:00 | vandalism | medium | investigating | regional-reported-78 | 101 | 2 | 101 | 2 | 2025-02-06 03:14:00 |
| 2933483 | 2024-11-03T14:22:00 | disruption | high | resolved | legacy-reported-79 | 102 | 3 | 102 | 3 | 2025-03-11 06:14:00 |
| 2986243 | 2025-04-14T21:39:00 | trespassing | critical | closed | compact-reported-80 | 103 | 4 | 103 | 4 | 2025-04-16 09:14:00 |

The `secu_security_incidents` table is the incident ledger. Its `incident_id` column carries mixed identifiers: numeric values like `1336174` and string codes such as `state_uk_4`. The `incident_date_time` (e.g. `2022-01-08T00:48:00`), `incident_type` (`theft`, `vandalism`, `disruption`, `trespassing`), `severity_level` (`low`, `medium`, `high`, `critical`), and `status` (`open`, `investigating`, `resolved`, `closed`) describe the event. The `reported_by` column stores a free-text reporter label like `seasonal-reported-77`. Four foreign keys — `library_property_id`, `video_surveillance_data_id`, `staff_member_id`, and `law_enforcement_agency_id` — link each incident to the property where it occurred, the video evidence, the staff member who reported it, and the responding law-enforcement agency.

**Table `secu_staff_members`**

| staff_member_id | staff_id | full_name | role | access_level | hire_date | video_surveillance_data_id | incident_id | reports_to_staff_member_id |
|---|---|---|---|---|---|---|---|---|
| 100 | 937735 | Theodore Mcgrath | library_director | full | 2023-06-01 | 1 | 1336174 | 100 |
| 101 | 3158139 | Account Name | board_chair | limited | 2024-11-12 | 2 | state_uk_4 | 101 |
| 102 | 8189502 | Saipan International Airport | staff | none | 2025-04-23 | 3 | 2933483 | 102 |
| 103 | 69438 | Norma Fisher | other | full | 2022-09-07 | 4 | 2986243 | 103 |

Personnel are modelled in `secu_staff_members`. The surrogate `staff_member_id` (100–103) is paired with a business `staff_id` (e.g. `937735`, `69438`). The `full_name` column stores names such as `Theodore Mcgrath` or `Norma Fisher`, while `role` classifies the person as `library_director`, `board_chair`, `staff`, or `other`. `access_level` (`full`, `limited`, `none`) and `hire_date` (2022–2025) describe permissions and tenure. Foreign keys `video_surveillance_data_id` and `incident_id` link a staff member to the recording and incident they are associated with. A self-referencing foreign key `reports_to_staff_member_id` creates an organisational hierarchy; in the sample data every staff member reports to themselves, but the column is designed for multi-level chains.

**Table `secu_law_enforcement_agencies`**

| law_enforcement_agency_id | agency_id | agency_name | agency_type | contact_email | contact_phone | video_surveillance_data_id | incident_id |
|---|---|---|---|---|---|---|---|
| 1 | U.S. Steel | FSG Social Impact Advisors | police | Christopher Wilson | Joe Tsai | 1 | 1336174 |
| 2 | Nikola Corporation | Whirlpool Corporation | dfs | Charles Larsen | Stephanie Collins | 2 | state_uk_4 |
| 3 | Oberthur Technologies | Education Writers Association | federal | Mary Alvarez | Tasha Rodriguez | 3 | 2933483 |
| 4 | General Telephone & Electronics | Switch Card Services Ltd. | state | April Snyder | Walter Pratt | 4 | 2986243 |

Responding agencies are stored in `secu_law_enforcement_agencies`. The surrogate `law_enforcement_agency_id` (1–4) is paired with a business `agency_id` such as `U.S. Steel` or `Nikola Corporation`. The `agency_name` column holds values like `FSG Social Impact Advisors` or `Whirlpool Corporation`, while `agency_type` classifies the agency as `police`, `dfs`, `federal`, or `state`. Contact details are stored in `contact_email` and `contact_phone`. Foreign keys `video_surveillance_data_id` and `incident_id` link each agency to the recording and incident it is associated with.

**Table `secu_data_storage_systems`**

| id | system_id | system_name | storage_capacity_g_b | last_backup_date | encryption_status | video_surveillance_data_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|
| 1 | 8189503 | Legacy Programme D | 4.20 | 2022-05-27 | false | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | 3717623 | Regional Standard | 7.40 | 2023-10-11 | true | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | 7441161 | Seasonal Framework | 10.60 | 2024-03-22 | false | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | 605963 | Integrated Protocol A | 13.80 | 2025-08-06 | true | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The `secu_data_storage_systems` table (not shown in the sample rows but referenced via foreign key) stores the data-storage infrastructure. Each system is linked to one or more video recordings through the `data_storage_system_id` column in `secu_video_surveillance_datas`.

The normalised design distributes attributes across seven base tables to eliminate redundancy. A camera's location lives only in `secu_security_cameras`; a property's square footage lives only in `secu_library_properties`; a recording's format lives only in `secu_video_surveillance_datas`. Relationships are expressed through foreign keys rather than embedded lists. The cardinality of each relationship is bounded by the presence or absence of a foreign-key value: a camera may reference at most one property and one video record; a property may reference at most one camera and one incident; a video record may reference one camera, one incident, and one storage system; an incident may reference one property, one video record, one staff member, and one agency; a staff member may reference one video record, one incident, and one supervisor.

The views in the schema materialise the most common analytical questions by joining two base tables along their shared foreign-key columns. Each view answers a single domain question and returns a denormalised row that combines attributes from both entities.

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

The view `v_security_camera_library_property` joins `secu_security_cameras` to `secu_library_properties` on `security_camera_id = library_property_id` (via the shared `library_property_id` / `security_camera_id` foreign keys). It answers the question: "Which property does this camera monitor, and what are the property's characteristics?" Row 1 of the join shows camera `98a0473a-8fcd-11eb-924d-9cd76263cbd0` at `extended-location-99` monitoring property `distributed-address-72` (type `exterior`, 7.45 sq ft).

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

The view `v_security_camera_video_surveillance_data` joins cameras to their recordings. It answers: "What video data did this camera produce?" The join on `security_camera_id` pairs camera `1450647` at `seasonal-location-101` with video record `3775` captured on `2025-08-21T23:25:00` in `mkv` format, 43 seconds long.

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

The view `v_library_property_security_camera` is the symmetric counterpart: it starts from the property and lists the camera installed there. It answers: "Which camera is deployed at this property?" Property `baseline-address-73` (interior, 11.90 sq ft) is monitored by camera `4e383924-8fcc-11eb-924d-9cd76263cbd0` at `integrated-location-100`.

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

The view `v_library_property_security_incident` joins properties to their incidents. It answers: "What incident occurred at this property?" Property `pilot-address-74` (parking_lot, 16.35 sq ft) is linked to incident `2933483`, a `disruption` of `high` severity that was `resolved`.

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

The view `v_video_surveillance_data_security_camera` is the symmetric camera-to-video join, starting from the recording. It answers: "Which camera captured this video?" Video record `505998` (captured `2023-10-26T09:51:00`, `mp4`, archived, public) was captured by camera `98a0473a-8fcd-11eb-924d-9cd76263cbd0`.

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

The view `v_video_surveillance_data_security_incident` joins video recordings to the incidents they document. It answers: "Which incident does this recording evidence?" Video record `7441152` (captured `2024-03-10T16:08:00`, `avi`, active, staff_only) is linked to incident `state_uk_4`, a `vandalism` of `medium` severity currently `investigating`.

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

The view `v_video_surveillance_data_data_storage_system` joins recordings to their storage systems. It answers: "Where is this video stored?" Video record `dirrh` (captured `2022-01-05T06:42:00`, `mp4`, archived, public) is stored on storage system `4`.

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

The view `v_security_incident_library_property` is the symmetric property-to-incident join. It answers: "At which property did this incident occur?" Incident `1336174` (a `theft` of `low` severity, `open`) occurred at property `distributed-address-72` (exterior, 7.45 sq ft).

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

The view `v_security_incident_video_surveillance_data` is the symmetric incident-to-video join. It answers: "What video evidence exists for this incident?" Incident `2933483` (a `disruption`, `high`, `resolved`) is supported by video record `3775` (captured `2025-08-21T23:25:00`, `mkv`, deleted, director_only).

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

The view `v_security_incident_staff_member` joins incidents to the staff members who reported them. It answers: "Who reported this incident?" Incident `2986243` (a `trespassing` of `critical` severity, `closed`) was reported by staff member `Norma Fisher` (role `other`, access level `full`, hired `2022-09-07`).

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

The view `v_security_incident_law_enforcement_agency` joins incidents to the responding agencies. It answers: "Which agency responded to this incident?" Incident `state_uk_4` (a `vandalism`, `medium`, `investigating`) was handled by agency `Whirlpool Corporation` (type `dfs`, contact `Charles Larsen`).

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

The view `v_staff_member_video_surveillance_data` joins staff members to the recordings they are associated with. It answers: "Which video is linked to this staff member?" Staff member `Theodore Mcgrath` (library director, full access) is linked to video record `505998`.

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

The view `v_staff_member_security_incident` is the symmetric incident-to-staff join. It answers: "Which staff member is associated with this incident?" Incident `1336174` is associated with staff member `Theodore Mcgrath`.

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

The view `v_staff_member_staff_member` is a self-join on the `reports_to_staff_member_id` foreign key. It answers: "Who does this staff member report to?" Staff member `Account Name` (board chair, limited access) reports to staff member `Account Name` (themselves, in the sample data). This view materialises the organisational hierarchy as a denormalised pair of rows.

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

The view `v_law_enforcement_agency_video_surveillance_data` joins agencies to the recordings they are associated with. It answers: "Which video is linked to this agency?" Agency `FSG Social Impact Advisors` (police, contact `Christopher Wilson`) is linked to video record `505998`.

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

The view `v_law_enforcement_agency_security_incident` is the symmetric incident-to-agency join. It answers: "Which agency responded to this incident?" Incident `2986243` (a `trespassing`, `critical`, `closed`) was handled by agency `Switch Card Services Ltd.` (type `state`, contact `April Snyder`).

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

The view `v_data_storage_system_video_surveillance_data` joins storage systems to the recordings they hold. It answers: "Which videos are stored on this system?" Storage system `4` holds video record `dirrh` (captured `2022-01-05T06:42:00`, `mp4`, archived, public).

The materialisation pattern is uniform across all views: a simple `INNER JOIN` on the shared foreign-key column, selecting attributes from both sides. The join reconstructs a domain fact that would otherwise require traversing multiple tables. For example, the fact "camera `98a0473a-8fcd-11eb-924d-9cd76263cbd0` at `extended-location-99` monitors property `distributed-address-72` (exterior, 7.45 sq ft)" is stored as two rows in two tables but retrieved as a single row from `v_security_camera_library_property`.

The schema's design choices reflect a balance between normalisation and query convenience. Base tables are in at least third normal form, eliminating transitive dependencies — a camera's location is not repeated in the property table, and a recording's format is not repeated in the incident table. Foreign keys enforce referential integrity: a video record cannot reference a camera that does not exist, and an incident cannot reference a property that does not exist. The self-referencing foreign key in `secu_staff_members` (`reports_to_staff_member_id`) allows the organisational hierarchy to grow beyond a single level without schema changes.

The views, while denormalising the data for query purposes, do not introduce redundancy at the storage level — they are virtual tables computed on demand. Each view answers a specific analytical question by joining exactly two base tables, keeping the join graph simple and the query planner's job straightforward. The bidirectional naming convention (e.g. `v_security_camera_library_property` and `v_library_property_security_camera`) ensures that analysts can query from either entity's perspective without needing to remember which table holds the foreign key.

In summary, the security surveillance domain is modelled as a set of seven normalised base tables connected by foreign-key relationships, with twenty-one views that materialise the most common two-entity joins. The base tables capture the entities — cameras, properties, recordings, incidents, staff, agencies, and storage systems — while the views answer the questions that operators and investigators actually ask: which camera monitors which property, which incident is supported by which video, which staff member reported which incident, and which agency responded. The schema is extensible: new cameras, properties, or incidents can be added without modifying the structure, and new views can be created for additional analytical questions by joining the existing tables along their foreign-key paths.