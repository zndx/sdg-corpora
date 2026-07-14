The video surveillance domain is modelled as a collection of six entity types—video management systems, analytics modules, surveillance cameras, video streams, control centers, and forensic evidences—interconnected through four junction tables that resolve many-to-many relationships. The schema follows a star-and-spoke pattern: each entity type is normalised into its own base table, while the junction tables (`systems_modules`, `systems_cameras`, `modules_streams`, `modules_evidences`) and a set of denormalised views reconstruct the composite facts that operators and auditors need to answer operational questions. The following sections walk through the entity types, their attributes, the cardinality-bounded relationships that become foreign keys and junction tables, and finally the views that materialise domain-level insights from the normalised grain.

## Video Management Systems and Control Centers

The `video_management_systems` table is the central organisational entity. Each row represents a deployed VMS instance identified by a `system_identifier` such as `SYS-2050` or `SYS-2051`, carrying a `version_number` (`VER-2245` through `VER-2257`), a `deployment_mode` (`Edge`, `Server`, or `Embedded`), a boolean `is_scalable` flag, a `last_maintenance_date`, a `manufacturer_id` (e.g. `Esperion Therapeutics Inc.` or `Microsoft Corporation`), a `center_id` linking to the controlling facility, and a `created_at` timestamp. The `center_id` column is a foreign key into the `control_centers` table, establishing a one-to-many relationship: a single control centre can oversee multiple VMS deployments.

**Table `video_management_systems`**

| system_identifier | version_number | deployment_mode | is_scalable | last_maintenance_date | manufacturer_id | center_id | created_at |
|---|---|---|---|---|---|---|---|
| SYS-2050 | VER-2245 | Edge | false | 2024-03-27 | Esperion Therapeutics Inc. | 5844261 | 2025-01-01 00:14:00 |
| SYS-2051 | VER-2249 | Server | true | 2025-08-11 | Microsoft Corporation | 1437588 | 2025-02-06 03:14:00 |
| SYS-2052 | VER-2253 | Embedded | false | 2022-01-22 | Northrop Grumman | 6564397 | 2025-03-11 06:14:00 |
| SYS-2053 | VER-2257 | Edge | true | 2023-06-06 | Switch Card Services Ltd. | default_chart_a_tax_13 | 2025-04-16 09:14:00 |

The `control_centers` table holds the facility-level metadata. Each centre is identified by `center_id` (e.g. `5844261` or `default_chart_a_tax_13`), named (`Seasonal Survey`, `Integrated Corridor`, `Extended Series D`, `Pilot Assessment`), and annotated with boolean flags `has_video_wall` and `has25_d_maps`, an `operator_capacity` (27–48), an `operational_status` (`Active`, `Maintenance`, or `Offline`), and a `video_management_system_version_number` that records the VMS version the centre is currently running. The `video_management_system_version_number` column in `control_centers` is a foreign key back into `video_management_systems.version_number`, creating a bidirectional linkage: a VMS row points to its centre via `center_id`, and the centre row points back to the VMS version it operates.

**Table `control_centers`**

| center_id | center_name | has_video_wall | has25_d_maps | operator_capacity | operational_status | video_management_system_version_number |
|---|---|---|---|---|---|---|
| 5844261 | Seasonal Survey | false | true | 27 | Active | VER-2245 |
| 1437588 | Integrated Corridor | true | false | 34 | Maintenance | VER-2249 |
| 6564397 | Extended Series D | false | true | 41 | Offline | VER-2253 |
| default_chart_a_tax_13 | Pilot Assessment | true | false | 48 | Active | VER-2257 |

## Video Analytics Modules

Analytics modules are software components that process video feeds. The `video_analytics_modules` table stores one row per module, keyed by a surrogate `id` (1000–1003) and an `analytics_id` (`IVCart15`, `de_CH`, `15392839`, `account_pymes_132`). Each module carries a `rule_count` (2–16), a boolean `is_multi_rule_enabled`, a `detection_type` (`IntrusionDetection`, `PeopleCounting`, `LicensePlateRecognition`, `SpeedViolation`), an `sdk_version` (`legacy-sdk-13` through `primary-sdk-16`), a `processing_location` (`Edge`, `Server`, or `Embedded`), and a `video_management_system_version_number` foreign key into `video_management_systems`. This foreign key enforces that every analytics module is associated with exactly one VMS version, reflecting the deployment topology: modules run inside or alongside a specific VMS instance.

**Table `video_analytics_modules`**

| id | analytics_id | rule_count | is_multi_rule_enabled | detection_type | sdk_version | processing_location | video_management_system_version_number |
|---|---|---|---|---|---|---|---|
| 1000 | IVCart15 | 2 | true | IntrusionDetection | legacy-sdk-13 | Edge | VER-2245 |
| 1001 | de_CH | 9 | false | PeopleCounting | compact-sdk-14 | Server | VER-2249 |
| 1002 | 15392839 | 9 | true | LicensePlateRecognition | composite-sdk-15 | Embedded | VER-2253 |
| 1003 | account_pymes_132 | 16 | false | SpeedViolation | primary-sdk-16 | Edge | VER-2257 |

The existence of the `systems_modules` junction table indicates that the designers anticipated a many-to-many relationship between VMS instances and analytics modules—i.e. a single VMS could host multiple modules, and a module could potentially be shared across VMS instances. In the current data, however, each module's `video_management_system_version_number` column already provides a direct foreign key, so `systems_modules` serves as an auxiliary mapping layer that can be queried when the relationship is truly many-to-many.

## Surveillance Cameras and Video Streams

The `surveillance_cameras` table describes physical or virtual cameras. Each camera has a surrogate `id` (1000–1003), a `camera_serial_number` (e.g. `611515` or `7441164`), a `camera_type` (`IP`, `Megapixel`, `Analog`, `ThermalImager`), a `resolution` string (`regional-resoluti-30` through `composite-resoluti-33`), a boolean `is_embedded_analytics`, an `installation_date`, a `firmware_version` (`distributed-firmware-48` through `extended-firmware-51`), a `video_stream_id` foreign key into `video_streams`, and a `video_management_system_version_number` foreign key into `video_management_systems`. The dual foreign keys mean each camera is simultaneously bound to one video stream and one VMS version.

**Table `surveillance_cameras`**

| id | camera_serial_number | camera_type | resolution | is_embedded_analytics | installation_date | firmware_version | video_stream_id | video_management_system_version_number |
|---|---|---|---|---|---|---|---|---|
| 1000 | 611515 | IP | regional-resoluti-30 | true | 2022-01-10 | distributed-firmware-48 | 1 | VER-2245 |
| 1001 | 7441164 | Megapixel | legacy-resoluti-31 | false | 2023-06-21 | baseline-firmware-49 | 2 | VER-2249 |
| 1002 | 5082966 | Analog | compact-resoluti-32 | true | 2024-11-05 | pilot-firmware-50 | 3 | VER-2253 |
| 1003 | 1186082 | ThermalImager | composite-resoluti-33 | false | 2025-04-16 | extended-firmware-51 | 4 | VER-2257 |

The `video_streams` table captures the real-time media characteristics of each feed. Each stream has a surrogate `id` (1–4), a `stream_id` (numeric like `2839512` or UUID-like like `e7a5231e-8fc3-11eb-924d-9cd76263cbd0`), a `bitrate` (18.20–30.80), a `frame_rate` (5.70–16.80), a `codec_type` (`compact-codec-86` through `adaptive-codec-89`), boolean `encryption_status` and `recording_status` flags, a `surveillance_camera_id` foreign key into `surveillance_cameras`, and a `video_analytics_module_id` foreign key into `video_analytics_modules`. The `surveillance_camera_id` and `video_analytics_module_id` columns create a bridge: each video stream is produced by exactly one camera and consumed by exactly one analytics module.

**Table `video_streams`**

| id | stream_id | bitrate | frame_rate | codec_type | encryption_status | recording_status | surveillance_camera_id | video_analytics_module_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 2839512 | 18.20 | 5.70 | compact-codec-86 | false | Active | 1000 | 1000 |
| 2 | e7a5231e-8fc3-11eb-924d-9cd76263cbd0 | 22.40 | 9.40 | composite-codec-87 | true | Paused | 1001 | 1001 |
| 3 | 3e41f384-9bac-11eb-a8a2-19ed5c03f8d3 | 26.60 | 13.10 | primary-codec-88 | false | Stopped | 1002 | 1002 |
| 4 | 1186092 | 30.80 | 16.80 | adaptive-codec-89 | true | Active | 1003 | 1003 |

The `modules_streams` junction table exists to support a many-to-many relationship between analytics modules and video streams. In the current dataset, the direct foreign key `video_analytics_module_id` in `video_streams` already constrains each stream to a single module, but `modules_streams` provides the flexibility to model scenarios where a module processes multiple streams or a stream is analysed by multiple modules.

## Forensic Evidences

The `forensic_evidences` table records events detected and preserved by analytics modules. Each evidence row has a surrogate `id` (1–4), an `evidence_id` (`195358`, `6564396`, `047473c0-9bac-11eb-a8a2-19ed5c03f8d3`, `4985170`), an `event_timestamp` (e.g. `2025-04-17T15:57:00`), an `evidence_type` (`IntrusionAlert`, `SpeedViolation`, `LicensePlateCapture`, `PeopleCount`), a `confidence_score` (8.20–14.80), a boolean `is_verified`, a `storage_location` (`distributed-storage-48` through `extended-storage-51`), a `video_analytics_module_id` foreign key, a `video_management_system_version_number` foreign key, and `created_at` / `updated_at` timestamps. The dual foreign keys tie each piece of evidence to both the analytics module that generated it and the VMS version under which it was recorded.

**Table `forensic_evidences`**

| id | evidence_id | event_timestamp | evidence_type | confidence_score | is_verified | storage_location | video_analytics_module_id | video_management_system_version_number | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 195358 | 2025-04-17T15:57:00 | IntrusionAlert | 8.20 | true | distributed-storage-48 | 1000 | VER-2245 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | 6564396 | 2022-09-01T22:14:00 | SpeedViolation | 10.40 | false | baseline-storage-49 | 1001 | VER-2249 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | 047473c0-9bac-11eb-a8a2-19ed5c03f8d3 | 2023-02-12T05:31:00 | LicensePlateCapture | 12.60 | true | pilot-storage-50 | 1002 | VER-2253 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | 4985170 | 2024-07-23T12:48:00 | PeopleCount | 14.80 | false | extended-storage-51 | 1003 | VER-2257 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The `modules_evidences` junction table mirrors the pattern seen in `systems_modules` and `modules_streams`: it exists to support a many-to-many relationship between analytics modules and forensic evidences. In the current data, the direct `video_analytics_module_id` column in `forensic_evidences` constrains each evidence to a single module, but the junction table provides the structural capacity for multi-module attribution.

## Junction Tables and Relationship Cardinality

The four junction tables—`systems_modules`, `systems_cameras`, `modules_streams`, and `modules_evidences`—are the relational mechanism that resolves many-to-many relationships between the six entity types. Each junction table contains at least two foreign keys referencing the primary keys of the entities it connects. For example, `systems_modules` links `video_management_systems.system_identifier` to `video_analytics_modules.id`, while `systems_cameras` links `video_management_systems.system_identifier` to `surveillance_cameras.id`. The presence of these junction tables alongside direct foreign keys in the base tables (such as `video_management_system_version_number` in `video_analytics_modules`, `surveillance_cameras`, and `forensic_evidences`) reflects a hybrid modelling approach: the direct foreign keys capture the current one-to-many or many-to-one relationships in the data, while the junction tables preserve the schema's capacity to express many-to-many relationships as the domain evolves.

## Denormalised Views: Reconstructing Domain Facts

The twelve views materialise the normalised tables into queryable, domain-level perspectives. Each view is a join that answers a specific operational question by pulling together attributes from two or more base tables.

### VMS-Centric Views

The view `vw_video_management_system_video_analytics_module_detail` joins `video_management_systems` with `video_analytics_modules` to answer: "Which analytics modules are deployed on each VMS?" A row from this view might show `SYS-2050` paired with module `IVCart15` running `IntrusionDetection` on `Edge` with `VER-2245`.

**View `vw_video_management_system_video_analytics_module_detail`**

```sql
CREATE VIEW vw_video_management_system_video_analytics_module_detail AS
SELECT a.system_identifier, a.version_number, a.deployment_mode, b.id AS module_id, b.analytics_id AS module_analytics_id, b.rule_count AS module_rule_count
FROM video_management_systems a
  JOIN systems_modules j ON j.video_management_system_version_number = a.version_number
  JOIN video_analytics_modules b ON b.id = j.video_analytics_module_id;
```

| system_identifier | version_number | deployment_mode | module_id | module_analytics_id | module_rule_count |
|---|---|---|---|---|---|
| SYS-2050 | VER-2245 | Edge | 1000 | IVCart15 | 2 |
| SYS-2050 | VER-2245 | Edge | 1001 | de_CH | 9 |
| SYS-2051 | VER-2249 | Server | 1001 | de_CH | 9 |
| SYS-2051 | VER-2249 | Server | 1002 | 15392839 | 9 |
| SYS-2052 | VER-2253 | Embedded | 1002 | 15392839 | 9 |
| SYS-2052 | VER-2253 | Embedded | 1003 | account_pymes_132 | 16 |
| SYS-2053 | VER-2257 | Edge | 1003 | account_pymes_132 | 16 |
| SYS-2053 | VER-2257 | Edge | 1000 | IVCart15 | 2 |

The view `vw_video_management_system_surveillance_camera_detail` joins `video_management_systems` with `surveillance_cameras` to answer: "Which cameras are managed by each VMS?" A representative row links `SYS-2051` (manufactured by `Microsoft Corporation`, `Server` deployment) to camera `7441164` (a `Megapixel` type with `legacy-resoluti-31` resolution, installed on `2023-06-21`).

**View `vw_video_management_system_surveillance_camera_detail`**

```sql
CREATE VIEW vw_video_management_system_surveillance_camera_detail AS
SELECT a.system_identifier, a.version_number, a.deployment_mode, b.id AS camera_id, b.camera_serial_number AS camera_camera_serial_number, b.camera_type AS camera_camera_type
FROM video_management_systems a
  JOIN systems_cameras j ON j.video_management_system_version_number = a.version_number
  JOIN surveillance_cameras b ON b.id = j.surveillance_camera_id;
```

| system_identifier | version_number | deployment_mode | camera_id | camera_camera_serial_number | camera_camera_type |
|---|---|---|---|---|---|
| SYS-2050 | VER-2245 | Edge | 1000 | 611515 | IP |
| SYS-2050 | VER-2245 | Edge | 1001 | 7441164 | Megapixel |
| SYS-2051 | VER-2249 | Server | 1001 | 7441164 | Megapixel |
| SYS-2051 | VER-2249 | Server | 1002 | 5082966 | Analog |
| SYS-2052 | VER-2253 | Embedded | 1002 | 5082966 | Analog |
| SYS-2052 | VER-2253 | Embedded | 1003 | 1186082 | ThermalImager |
| SYS-2053 | VER-2257 | Edge | 1003 | 1186082 | ThermalImager |
| SYS-2053 | VER-2257 | Edge | 1000 | 611515 | IP |

The view `vw_video_management_system_control_center` joins `video_management_systems` with `control_centers` to answer: "Which control centre oversees each VMS?" A row might show `SYS-2050` managed by `Seasonal Survey` (centre `5844261`, `Active` status, 27 operators, no video wall but with 2.5D maps).

**View `vw_video_management_system_control_center`**

```sql
CREATE VIEW vw_video_management_system_control_center AS
SELECT a.system_identifier, a.version_number, a.deployment_mode, a.is_scalable, b.center_id AS center_center_id, b.center_name AS center_center_name, b.has_video_wall AS center_has_video_wall
FROM video_management_systems a JOIN control_centers b ON a.center_id = b.center_id;
```

| system_identifier | version_number | deployment_mode | is_scalable | center_center_id | center_center_name | center_has_video_wall |
|---|---|---|---|---|---|---|
| SYS-2050 | VER-2245 | Edge | false | 5844261 | Seasonal Survey | false |
| SYS-2051 | VER-2249 | Server | true | 1437588 | Integrated Corridor | true |
| SYS-2052 | VER-2253 | Embedded | false | 6564397 | Extended Series D | false |
| SYS-2053 | VER-2257 | Edge | true | default_chart_a_tax_13 | Pilot Assessment | true |

### Analytics Module-Centric Views

The view `vw_video_analytics_module_video_management_system` performs the inverse of the first VMS-centric view: it starts from `video_analytics_modules` and joins to `video_management_systems` to answer: "Which VMS hosts each analytics module?" A row might show module `de_CH` (9 rules, `PeopleCounting`, `Server` processing) running on VMS `SYS-2051` (`VER-2249`).

**View `vw_video_analytics_module_video_management_system`**

```sql
CREATE VIEW vw_video_analytics_module_video_management_system AS
SELECT a.id, a.analytics_id, a.rule_count, a.is_multi_rule_enabled, b.system_identifier AS system_system_identifier, b.version_number AS system_version_number, b.deployment_mode AS system_deployment_mode
FROM video_analytics_modules a JOIN video_management_systems b ON a.video_management_system_version_number = b.version_number;
```

| id | analytics_id | rule_count | is_multi_rule_enabled | system_system_identifier | system_version_number | system_deployment_mode |
|---|---|---|---|---|---|---|
| 1000 | IVCart15 | 2 | true | SYS-2050 | VER-2245 | Edge |
| 1001 | de_CH | 9 | false | SYS-2051 | VER-2249 | Server |
| 1002 | 15392839 | 9 | true | SYS-2052 | VER-2253 | Embedded |
| 1003 | account_pymes_132 | 16 | false | SYS-2053 | VER-2257 | Edge |

The view `vw_video_analytics_module_video_stream_detail` joins `video_analytics_modules` with `video_streams` to answer: "Which video streams does each analytics module process?" A representative row links module `1000` (`IVCart15`, `IntrusionDetection`) to stream `2839512` with bitrate `18.20`, frame rate `5.70`, `compact-codec-86`, encryption `false`, and `Active` recording status.

**View `vw_video_analytics_module_video_stream_detail`**

```sql
CREATE VIEW vw_video_analytics_module_video_stream_detail AS
SELECT a.id, a.analytics_id, a.rule_count, b.id AS stream_id, b.stream_id AS stream_stream_id, b.bitrate AS stream_bitrate
FROM video_analytics_modules a
  JOIN modules_streams j ON j.video_analytics_module_id = a.id
  JOIN video_streams b ON b.id = j.video_stream_id;
```

| id | analytics_id | rule_count | stream_id | stream_stream_id | stream_bitrate |
|---|---|---|---|---|---|
| 1000 | IVCart15 | 2 | 1 | 2839512 | 18.20 |
| 1000 | IVCart15 | 2 | 2 | e7a5231e-8fc3-11eb-924d-9cd76263cbd0 | 22.40 |
| 1001 | de_CH | 9 | 2 | e7a5231e-8fc3-11eb-924d-9cd76263cbd0 | 22.40 |
| 1001 | de_CH | 9 | 3 | 3e41f384-9bac-11eb-a8a2-19ed5c03f8d3 | 26.60 |
| 1002 | 15392839 | 9 | 3 | 3e41f384-9bac-11eb-a8a2-19ed5c03f8d3 | 26.60 |
| 1002 | 15392839 | 9 | 4 | 1186092 | 30.80 |
| 1003 | account_pymes_132 | 16 | 4 | 1186092 | 30.80 |
| 1003 | account_pymes_132 | 16 | 1 | 2839512 | 18.20 |

The view `vw_video_analytics_module_forensic_evidence_detail` joins `video_analytics_modules` with `forensic_evidences` to answer: "Which forensic evidences were generated by each analytics module?" A row might show module `1002` (`15392839`, `LicensePlateRecognition`) linked to evidence `047473c0-9bac-11eb-a8a2-19ed5c03f8d3` of type `LicensePlateCapture` with confidence `12.60`, verified `true`, stored in `pilot-storage-50`.

**View `vw_video_analytics_module_forensic_evidence_detail`**

```sql
CREATE VIEW vw_video_analytics_module_forensic_evidence_detail AS
SELECT a.id, a.analytics_id, a.rule_count, b.id AS evidence_id, b.evidence_id AS evidence_evidence_id, b.event_timestamp AS evidence_event_timestamp
FROM video_analytics_modules a
  JOIN modules_evidences j ON j.video_analytics_module_id = a.id
  JOIN forensic_evidences b ON b.id = j.forensic_evidence_id;
```

| id | analytics_id | rule_count | evidence_id | evidence_evidence_id | evidence_event_timestamp |
|---|---|---|---|---|---|
| 1000 | IVCart15 | 2 | 1 | 195358 | 2025-04-17T15:57:00 |
| 1000 | IVCart15 | 2 | 2 | 6564396 | 2022-09-01T22:14:00 |
| 1001 | de_CH | 9 | 2 | 6564396 | 2022-09-01T22:14:00 |
| 1001 | de_CH | 9 | 3 | 047473c0-9bac-11eb-a8a2-19ed5c03f8d3 | 2023-02-12T05:31:00 |
| 1002 | 15392839 | 9 | 3 | 047473c0-9bac-11eb-a8a2-19ed5c03f8d3 | 2023-02-12T05:31:00 |
| 1002 | 15392839 | 9 | 4 | 4985170 | 2024-07-23T12:48:00 |
| 1003 | account_pymes_132 | 16 | 4 | 4985170 | 2024-07-23T12:48:00 |
| 1003 | account_pymes_132 | 16 | 1 | 195358 | 2025-04-17T15:57:00 |

### Camera-Centric Views

The view `vw_surveillance_camera_video_stream` joins `surveillance_cameras` with `video_streams` to answer: "Which video stream does each camera produce?" A representative row links camera `1000` (`611515`, `IP` type, `regional-resoluti-30`, embedded analytics `true`) to stream `2839512` with `Active` recording.

**View `vw_surveillance_camera_video_stream`**

```sql
CREATE VIEW vw_surveillance_camera_video_stream AS
SELECT a.id, a.camera_serial_number, a.camera_type, a.resolution, b.id AS stream_id, b.stream_id AS stream_stream_id, b.bitrate AS stream_bitrate
FROM surveillance_cameras a JOIN video_streams b ON a.video_stream_id = b.id;
```

| id | camera_serial_number | camera_type | resolution | stream_id | stream_stream_id | stream_bitrate |
|---|---|---|---|---|---|---|
| 1000 | 611515 | IP | regional-resoluti-30 | 1 | 2839512 | 18.20 |
| 1001 | 7441164 | Megapixel | legacy-resoluti-31 | 2 | e7a5231e-8fc3-11eb-924d-9cd76263cbd0 | 22.40 |
| 1002 | 5082966 | Analog | compact-resoluti-32 | 3 | 3e41f384-9bac-11eb-a8a2-19ed5c03f8d3 | 26.60 |
| 1003 | 1186082 | ThermalImager | composite-resoluti-33 | 4 | 1186092 | 30.80 |

The view `vw_surveillance_camera_video_management_system` joins `surveillance_cameras` with `video_management_systems` to answer: "Which VMS manages each camera?" A row might show camera `1003` (`1186082`, `ThermalImager`, `composite-resoluti-33`) managed by VMS `SYS-2053` (`VER-2257`, `Edge` deployment, `Switch Card Services Ltd.`).

**View `vw_surveillance_camera_video_management_system`**

```sql
CREATE VIEW vw_surveillance_camera_video_management_system AS
SELECT a.id, a.camera_serial_number, a.camera_type, a.resolution, b.system_identifier AS system_system_identifier, b.version_number AS system_version_number, b.deployment_mode AS system_deployment_mode
FROM surveillance_cameras a JOIN video_management_systems b ON a.video_management_system_version_number = b.version_number;
```

| id | camera_serial_number | camera_type | resolution | system_system_identifier | system_version_number | system_deployment_mode |
|---|---|---|---|---|---|---|
| 1000 | 611515 | IP | regional-resoluti-30 | SYS-2050 | VER-2245 | Edge |
| 1001 | 7441164 | Megapixel | legacy-resoluti-31 | SYS-2051 | VER-2249 | Server |
| 1002 | 5082966 | Analog | compact-resoluti-32 | SYS-2052 | VER-2253 | Embedded |
| 1003 | 1186082 | ThermalImager | composite-resoluti-33 | SYS-2053 | VER-2257 | Edge |

### Stream-Centric Views

The view `vw_video_stream_surveillance_camera` joins `video_streams` with `surveillance_cameras` to answer: "Which camera feeds each video stream?" A representative row links stream `e7a5231e-8fc3-11eb-924d-9cd76263cbd0` (bitrate `22.40`, `composite-codec-87`, encryption `true`, `Paused` recording) to camera `1001` (`7441164`, `Megapixel`, `legacy-resoluti-31`).

**View `vw_video_stream_surveillance_camera`**

```sql
CREATE VIEW vw_video_stream_surveillance_camera AS
SELECT a.id, a.stream_id, a.bitrate, a.frame_rate, b.id AS camera_id, b.camera_serial_number AS camera_camera_serial_number, b.camera_type AS camera_camera_type
FROM video_streams a JOIN surveillance_cameras b ON a.surveillance_camera_id = b.id;
```

| id | stream_id | bitrate | frame_rate | camera_id | camera_camera_serial_number | camera_camera_type |
|---|---|---|---|---|---|---|
| 1 | 2839512 | 18.20 | 5.70 | 1000 | 611515 | IP |
| 2 | e7a5231e-8fc3-11eb-924d-9cd76263cbd0 | 22.40 | 9.40 | 1001 | 7441164 | Megapixel |
| 3 | 3e41f384-9bac-11eb-a8a2-19ed5c03f8d3 | 26.60 | 13.10 | 1002 | 5082966 | Analog |
| 4 | 1186092 | 30.80 | 16.80 | 1003 | 1186082 | ThermalImager |

The view `vw_video_stream_video_analytics_module` joins `video_streams` with `video_analytics_modules` to answer: "Which analytics module analyses each video stream?" A row might show stream `1186092` (bitrate `30.80`, `adaptive-codec-89`, encryption `true`, `Active` recording) analysed by module `1003` (`account_pymes_132`, `SpeedViolation`, `Edge` processing, `primary-sdk-16`).

**View `vw_video_stream_video_analytics_module`**

```sql
CREATE VIEW vw_video_stream_video_analytics_module AS
SELECT a.id, a.stream_id, a.bitrate, a.frame_rate, b.id AS module_id, b.analytics_id AS module_analytics_id, b.rule_count AS module_rule_count
FROM video_streams a JOIN video_analytics_modules b ON a.video_analytics_module_id = b.id;
```

| id | stream_id | bitrate | frame_rate | module_id | module_analytics_id | module_rule_count |
|---|---|---|---|---|---|---|
| 1 | 2839512 | 18.20 | 5.70 | 1000 | IVCart15 | 2 |
| 2 | e7a5231e-8fc3-11eb-924d-9cd76263cbd0 | 22.40 | 9.40 | 1001 | de_CH | 9 |
| 3 | 3e41f384-9bac-11eb-a8a2-19ed5c03f8d3 | 26.60 | 13.10 | 1002 | 15392839 | 9 |
| 4 | 1186092 | 30.80 | 16.80 | 1003 | account_pymes_132 | 16 |

### Control Center-Centric Views

The view `vw_control_center_video_management_system` joins `control_centers` with `video_management_systems` to answer: "Which VMS instances are overseen by each control centre?" A representative row links centre `Integrated Corridor` (`1437588`, `Active` status, 34 operators, has video wall) to VMS `SYS-2051` (`VER-2249`, `Server` deployment, `Microsoft Corporation`).

**View `vw_control_center_video_management_system`**

```sql
CREATE VIEW vw_control_center_video_management_system AS
SELECT a.center_id, a.center_name, a.has_video_wall, a.has25_d_maps, b.system_identifier AS system_system_identifier, b.version_number AS system_version_number, b.deployment_mode AS system_deployment_mode
FROM control_centers a JOIN video_management_systems b ON a.video_management_system_version_number = b.version_number;
```

| center_id | center_name | has_video_wall | has25_d_maps | system_system_identifier | system_version_number | system_deployment_mode |
|---|---|---|---|---|---|---|
| 5844261 | Seasonal Survey | false | true | SYS-2050 | VER-2245 | Edge |
| 1437588 | Integrated Corridor | true | false | SYS-2051 | VER-2249 | Server |
| 6564397 | Extended Series D | false | true | SYS-2052 | VER-2253 | Embedded |
| default_chart_a_tax_13 | Pilot Assessment | true | false | SYS-2053 | VER-2257 | Edge |

### Forensic Evidence-Centric Views

The view `vw_forensic_evidence_video_analytics_module` joins `forensic_evidences` with `video_analytics_modules` to answer: "Which analytics module generated each forensic evidence?" A row might show evidence `195358` (type `IntrusionAlert`, confidence `8.20`, verified `true`, stored in `distributed-storage-48`) generated by module `1000` (`IVCart15`, `IntrusionDetection`, `Edge` processing).

**View `vw_forensic_evidence_video_analytics_module`**

```sql
CREATE VIEW vw_forensic_evidence_video_analytics_module AS
SELECT a.id, a.evidence_id, a.event_timestamp, a.evidence_type, b.id AS module_id, b.analytics_id AS module_analytics_id, b.rule_count AS module_rule_count
FROM forensic_evidences a JOIN video_analytics_modules b ON a.video_analytics_module_id = b.id;
```

| id | evidence_id | event_timestamp | evidence_type | module_id | module_analytics_id | module_rule_count |
|---|---|---|---|---|---|---|
| 1 | 195358 | 2025-04-17T15:57:00 | IntrusionAlert | 1000 | IVCart15 | 2 |
| 2 | 6564396 | 2022-09-01T22:14:00 | SpeedViolation | 1001 | de_CH | 9 |
| 3 | 047473c0-9bac-11eb-a8a2-19ed5c03f8d3 | 2023-02-12T05:31:00 | LicensePlateCapture | 1002 | 15392839 | 9 |
| 4 | 4985170 | 2024-07-23T12:48:00 | PeopleCount | 1003 | account_pymes_132 | 16 |

The view `vw_forensic_evidence_video_management_system` joins `forensic_evidences` with `video_management_systems` to answer: "Under which VMS version was each forensic evidence recorded?" A representative row links evidence `6564396` (type `SpeedViolation`, confidence `10.40`, not verified, stored in `baseline-storage-49`) to VMS `SYS-2051` (`VER-2249`, `Server` deployment, `Microsoft Corporation`).

**View `vw_forensic_evidence_video_management_system`**

```sql
CREATE VIEW vw_forensic_evidence_video_management_system AS
SELECT a.id, a.evidence_id, a.event_timestamp, a.evidence_type, b.system_identifier AS system_system_identifier, b.version_number AS system_version_number, b.deployment_mode AS system_deployment_mode
FROM forensic_evidences a JOIN video_management_systems b ON a.video_management_system_version_number = b.version_number;
```

| id | evidence_id | event_timestamp | evidence_type | system_system_identifier | system_version_number | system_deployment_mode |
|---|---|---|---|---|---|---|
| 1 | 195358 | 2025-04-17T15:57:00 | IntrusionAlert | SYS-2050 | VER-2245 | Edge |
| 2 | 6564396 | 2022-09-01T22:14:00 | SpeedViolation | SYS-2051 | VER-2249 | Server |
| 3 | 047473c0-9bac-11eb-a8a2-19ed5c03f8d3 | 2023-02-12T05:31:00 | LicensePlateCapture | SYS-2052 | VER-2253 | Embedded |
| 4 | 4985170 | 2024-07-23T12:48:00 | PeopleCount | SYS-2053 | VER-2257 | Edge |

## Closing Synthesis

The schema models a video surveillance ecosystem as six entity types connected through a combination of direct foreign keys and four junction tables. The base tables capture the atomic facts—VMS deployments, analytics modules, cameras, streams, control centres, and forensic evidences—each with attributes that reflect the operational reality of the domain. The junction tables (`systems_modules`, `systems_cameras`, `modules_streams`, `modules_evidences`) provide the relational scaffolding for many-to-many relationships that may arise as the system scales. The twelve views materialise these normalised relationships into queryable, domain-level perspectives, each answering a specific question by joining the appropriate tables. Together, the tables and views form a coherent model that supports both the granular inspection of individual entities and the composite analysis of cross-entity relationships, from the camera-to-stream pipeline to the module-to-evidence forensic chain.

## Data appendix

**Table `systems_modules`**

| video_management_system_version_number | video_analytics_module_id |
|---|---|
| VER-2245 | 1000 |
| VER-2245 | 1001 |
| VER-2249 | 1001 |
| VER-2249 | 1002 |
| VER-2253 | 1002 |
| VER-2253 | 1003 |
| VER-2257 | 1003 |
| VER-2257 | 1000 |

**Table `systems_cameras`**

| video_management_system_version_number | surveillance_camera_id |
|---|---|
| VER-2245 | 1000 |
| VER-2245 | 1001 |
| VER-2249 | 1001 |
| VER-2249 | 1002 |
| VER-2253 | 1002 |
| VER-2253 | 1003 |
| VER-2257 | 1003 |
| VER-2257 | 1000 |

**Table `modules_streams`**

| video_analytics_module_id | video_stream_id |
|---|---|
| 1000 | 1 |
| 1000 | 2 |
| 1001 | 2 |
| 1001 | 3 |
| 1002 | 3 |
| 1002 | 4 |
| 1003 | 4 |
| 1003 | 1 |

**Table `modules_evidences`**

| video_analytics_module_id | forensic_evidence_id |
|---|---|
| 1000 | 1 |
| 1000 | 2 |
| 1001 | 2 |
| 1001 | 3 |
| 1002 | 3 |
| 1002 | 4 |
| 1003 | 4 |
| 1003 | 1 |
