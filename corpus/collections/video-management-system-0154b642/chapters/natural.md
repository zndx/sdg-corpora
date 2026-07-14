## The Architecture of Video Surveillance and Analytics

Modern video surveillance infrastructure extends far beyond simple recording. It is a distributed ecosystem of management systems, analytics engines, camera hardware, and forensic evidence pipelines, all coordinated through centralized control centers. Each component carries precise identifiers, versioned software stacks, and operational metadata that together determine the reliability and analytical capability of the entire installation. Understanding how these pieces interlock—how a camera feeds a stream, how a stream is processed by an analytics module, and how the resulting evidence is catalogued and stored—requires a disciplined view of the data that records every relationship.

**Table `video_management_systems`**

| system_identifier | version_number | deployment_mode | is_scalable | last_maintenance_date | manufacturer_id | center_id | created_at |
|---|---|---|---|---|---|---|---|
| SYS-2050 | VER-2245 | Edge | false | 2024-03-27 | Esperion Therapeutics Inc. | 5844261 | 2025-01-01 00:14:00 |
| SYS-2051 | VER-2249 | Server | true | 2025-08-11 | Microsoft Corporation | 1437588 | 2025-02-06 03:14:00 |
| SYS-2052 | VER-2253 | Embedded | false | 2022-01-22 | Northrop Grumman | 6564397 | 2025-03-11 06:14:00 |
| SYS-2053 | VER-2257 | Edge | true | 2023-06-06 | Switch Card Services Ltd. | default_chart_a_tax_13 | 2025-04-16 09:14:00 |

The video management system is the organizational backbone of any surveillance deployment. Each system is identified by a unique system identifier such as `SYS-2050` or `SYS-2053`, and carries a version number like `VER-2245` or `VER-2257` that tracks software revisions across the fleet. The deployment mode—Edge, Server, or Embedded—determines where processing occurs relative to the camera hardware. Scalability flags indicate whether the system can be expanded, and the last maintenance date provides an operational health indicator. Every system is manufactured by a vendor, whether Esperion Therapeutics Inc., Microsoft Corporation, Northrop Grumman, or Switch Card Services Ltd., and is assigned to a control center via the `center_id` column, linking it to the facility that oversees its operations.

**Table `video_analytics_modules`**

| id | analytics_id | rule_count | is_multi_rule_enabled | detection_type | sdk_version | processing_location | video_management_system_version_number |
|---|---|---|---|---|---|---|---|
| 1000 | IVCart15 | 2 | true | IntrusionDetection | legacy-sdk-13 | Edge | VER-2245 |
| 1001 | de_CH | 9 | false | PeopleCounting | compact-sdk-14 | Server | VER-2249 |
| 1002 | 15392839 | 9 | true | LicensePlateRecognition | composite-sdk-15 | Embedded | VER-2253 |
| 1003 | account_pymes_132 | 16 | false | SpeedViolation | primary-sdk-16 | Edge | VER-2257 |

Analytics modules sit at the intelligence layer of the surveillance stack. Each module carries a numeric identifier, an analytics identifier such as `IVCart15` or `account_pymes_132`, and a rule count that reflects the complexity of its detection logic. The `is_multi_rule_enabled` flag indicates whether multiple detection rules can run concurrently. Detection types range from IntrusionDetection and PeopleCounting to LicensePlateRecognition and SpeedViolation, each tailored to a specific monitoring objective. The SDK version and processing location (Edge, Server, or Embedded) describe the software environment, while the `video_management_system_version_number` column ties the module back to the management system it serves.

**Table `surveillance_cameras`**

| id | camera_serial_number | camera_type | resolution | is_embedded_analytics | installation_date | firmware_version | video_stream_id | video_management_system_version_number |
|---|---|---|---|---|---|---|---|---|
| 1000 | 611515 | IP | regional-resoluti-30 | true | 2022-01-10 | distributed-firmware-48 | 1 | VER-2245 |
| 1001 | 7441164 | Megapixel | legacy-resoluti-31 | false | 2023-06-21 | baseline-firmware-49 | 2 | VER-2249 |
| 1002 | 5082966 | Analog | compact-resoluti-32 | true | 2024-11-05 | pilot-firmware-50 | 3 | VER-2253 |
| 1003 | 1186082 | ThermalImager | composite-resoluti-33 | false | 2025-04-16 | extended-firmware-51 | 4 | VER-2257 |

Surveillance cameras are the physical sensors that capture the visual feed. Each camera has a numeric identifier, a serial number such as `611515` or `1186082`, and a type—IP, Megapixel, Analog, or ThermalImager—that defines its hardware class. Resolution values like `regional-resoluti-30` or `composite-resoluti-33` describe the output quality. The `is_embedded_analytics` flag indicates whether the camera performs on-device processing, and the installation date and firmware version track its lifecycle. Crucially, each camera references a video stream via `video_stream_id` and a management system via `video_management_system_version_number`, anchoring it within the broader architecture.

**Table `video_streams`**

| id | stream_id | bitrate | frame_rate | codec_type | encryption_status | recording_status | surveillance_camera_id | video_analytics_module_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 2839512 | 18.20 | 5.70 | compact-codec-86 | false | Active | 1000 | 1000 |
| 2 | e7a5231e-8fc3-11eb-924d-9cd76263cbd0 | 22.40 | 9.40 | composite-codec-87 | true | Paused | 1001 | 1001 |
| 3 | 3e41f384-9bac-11eb-a8a2-19ed5c03f8d3 | 26.60 | 13.10 | primary-codec-88 | false | Stopped | 1002 | 1002 |
| 4 | 1186092 | 30.80 | 16.80 | adaptive-codec-89 | true | Active | 1003 | 1003 |

Video streams are the data conduits that carry encoded footage from cameras to processing endpoints. Each stream has a numeric identifier, a stream identifier that may be a numeric value like `2839512` or a UUID such as `e7a5231e-8fc3-11eb-924d-9cd76263cbd0`, and technical parameters including bitrate (ranging from 18.20 to 30.80), frame rate (from 5.70 to 16.80), and codec type (compact-codec, composite-codec, primary-codec, or adaptive-codec). The encryption status indicates whether the stream is secured in transit, and the recording status—Active, Paused, or Stopped—reflects current operational state. Each stream links to a specific surveillance camera via `surveillance_camera_id` and to an analytics module via `video_analytics_module_id`, forming the bridge between capture and analysis.

**Table `control_centers`**

| center_id | center_name | has_video_wall | has25_d_maps | operator_capacity | operational_status | video_management_system_version_number |
|---|---|---|---|---|---|---|
| 5844261 | Seasonal Survey | false | true | 27 | Active | VER-2245 |
| 1437588 | Integrated Corridor | true | false | 34 | Maintenance | VER-2249 |
| 6564397 | Extended Series D | false | true | 41 | Offline | VER-2253 |
| default_chart_a_tax_13 | Pilot Assessment | true | false | 48 | Active | VER-2257 |

Control centers are the operational facilities that oversee surveillance deployments. Each center has a numeric `center_id`, a descriptive name such as Seasonal Survey or Integrated Corridor, and infrastructure indicators: `has_video_wall` and `has25_d_maps` denote the presence of display and mapping capabilities. The `operator_capacity` specifies how many operators the center can support, and the `operational_status`—Active, Maintenance, or Offline—reflects its current state. Every center is associated with one or more video management systems through the `video_management_system_version_number` column, establishing which systems fall under its jurisdiction.

**Table `forensic_evidences`**

| id | evidence_id | event_timestamp | evidence_type | confidence_score | is_verified | storage_location | video_analytics_module_id | video_management_system_version_number | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 195358 | 2025-04-17T15:57:00 | IntrusionAlert | 8.20 | true | distributed-storage-48 | 1000 | VER-2245 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | 6564396 | 2022-09-01T22:14:00 | SpeedViolation | 10.40 | false | baseline-storage-49 | 1001 | VER-2249 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | 047473c0-9bac-11eb-a8a2-19ed5c03f8d3 | 2023-02-12T05:31:00 | LicensePlateCapture | 12.60 | true | pilot-storage-50 | 1002 | VER-2253 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | 4985170 | 2024-07-23T12:48:00 | PeopleCount | 14.80 | false | extended-storage-51 | 1003 | VER-2257 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Forensic evidence records are the audit trail of detected events. Each evidence entry carries a numeric identifier, an evidence identifier such as `195358` or `047473c0-9bac-11eb-a8a2-19ed5c03f8d3`, and an event timestamp that pinpoints when the detected event occurred. The evidence type—IntrusionAlert, SpeedViolation, LicensePlateCapture, or PeopleCount—corresponds to the detection category. A confidence score quantifies the analytics module's certainty, while the `is_verified` flag indicates whether a human operator has confirmed the finding. Storage locations like `distributed-storage-48` or `extended-storage-51` describe where the evidence payload is retained, and the `video_analytics_module_id` and `video_management_system_version_number` columns trace the evidence back to its source system and processing module.

The relationships between these entities are formalized through association tables that resolve many-to-many mappings.

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

The `systems_modules` table records which analytics modules are deployed within which video management systems, enabling a single system to host multiple analytics engines or a module to be referenced across systems.

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

The `systems_cameras` table maps surveillance cameras to their parent video management systems, supporting deployments where cameras may be reassigned or shared across management boundaries.

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

The `modules_streams` table captures the association between analytics modules and video streams, allowing the system to track which streams are being analyzed by which modules.

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

The `modules_evidences` table links forensic evidence records to the analytics modules that generated them, providing an auditable chain from detection to evidence storage.

With the base tables established, the following views synthesize these relationships into actionable detail. Each view answers a specific operational question by joining the relevant tables.

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

This view answers the question: which analytics modules are deployed within each video management system, and what are their capabilities? A row linking `SYS-2050` to module `1000` (analytics ID `IVCart15`, IntrusionDetection, Edge processing) shows that the Edge-deployed system hosts a module with 2 rules and multi-rule capability. Another row connecting `SYS-2053` to module `1003` (analytics ID `account_pymes_132`, SpeedViolation, Edge processing, 16 rules) demonstrates how a scalable Edge system can run a complex, single-rule analytics engine.

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

This view answers: which cameras are associated with each video management system, and what are their hardware characteristics? A row pairing `SYS-2050` with camera `1000` (IP type, serial `611515`, embedded analytics enabled) reveals that an Edge management system oversees a camera with on-device processing. A row linking `SYS-2052` with camera `1002` (Analog type, serial `5082966`, embedded analytics enabled) shows that even non-scalable Embedded systems can manage cameras with local analytics.

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

This view answers: which control centers are responsible for which video management systems, and what are the centers' operational states? A row connecting `SYS-2050` to center `5844261` (Seasonal Survey, Active, capacity 27, no video wall) indicates that an Active center manages an Edge system. A row linking `SYS-2051` to center `1437588` (Integrated Corridor, Maintenance, capacity 34, with video wall) shows that a Server-based system is currently under maintenance oversight at a well-equipped center.

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

This view answers: which video management systems host each analytics module, and what are the system configurations? A row showing module `1000` (IVCart15, IntrusionDetection) hosted on `SYS-2050` (Edge, non-scalable, manufactured by Esperion Therapeutics Inc.) illustrates how a lightweight, non-scalable system can still run intrusion detection. A row connecting module `1003` (account_pymes_132, SpeedViolation) to `SYS-2053` (Edge, scalable, manufactured by Switch Card Services Ltd.) demonstrates that scalable systems can support complex speed violation analytics.

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

This view answers: which video streams are being processed by each analytics module, and what are the stream characteristics? A row linking module `1000` to stream `1` (bitrate 18.20, frame rate 5.70, compact-codec, unencrypted, Active recording) shows that an IntrusionDetection module processes a low-bitrate, unencrypted stream with active recording. A row connecting module `1001` to stream `2` (bitrate 22.40, frame rate 9.40, composite-codec, encrypted, Paused recording) reveals that a PeopleCounting module is associated with an encrypted stream that is currently paused.

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

This view answers: which forensic evidence records were generated by each analytics module, and what are the evidence characteristics? A row showing module `1000` (IVCart15) linked to evidence `1` (IntrusionAlert, confidence 8.20, verified, stored in distributed-storage-48) demonstrates that an intrusion detection module produced a verified alert with moderate confidence. A row connecting module `1002` (15392839, LicensePlateRecognition) to evidence `3` (LicensePlateCapture, confidence 12.60, verified, stored in pilot-storage-50) shows that a license plate recognition module generated a high-confidence, verified evidence record.

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

This view answers: which video stream is associated with each surveillance camera, and what are the stream's technical parameters? A row linking camera `1000` (IP type, serial `611515`, embedded analytics enabled) to stream `1` (bitrate 18.20, compact-codec, Active recording) shows that an IP camera with on-device analytics feeds a low-bitrate, actively recorded stream. A row connecting camera `1003` (ThermalImager type, serial `1186082`, no embedded analytics) to stream `4` (bitrate 30.80, adaptive-codec, encrypted, Active recording) reveals that a high-resolution thermal camera produces a high-bitrate, encrypted stream.

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

This view answers: which video management system oversees each surveillance camera, and what are the system's deployment characteristics? A row pairing camera `1000` with `SYS-2050` (Edge, non-scalable, last maintenance 2024-03-27) shows that a non-scalable Edge system manages an IP camera with embedded analytics. A row linking camera `1003` with `SYS-2053` (Edge, scalable, last maintenance 2023-06-06) demonstrates that a scalable Edge system can manage a ThermalImager camera.

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

This view answers: which surveillance camera feeds each video stream, and what are the camera's hardware specifications? A row showing stream `1` fed by camera `1000` (IP type, serial `611515`, resolution `regional-resoluti-30`, installed 2022-01-10) reveals that a regional-resolution IP camera has been in service since early 2022. A row connecting stream `4` to camera `1003` (ThermalImager, serial `1186082`, resolution `composite-resoluti-33`, installed 2025-04-16) shows that a recently installed thermal camera feeds a high-bitrate stream.

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

This view answers: which analytics module processes each video stream, and what are the module's detection capabilities? A row linking stream `1` to module `1000` (IVCart15, IntrusionDetection, 2 rules, Edge processing) shows that a low-rule-count module handles intrusion detection on a compact-codec stream. A row connecting stream `4` to module `1003` (account_pymes_132, SpeedViolation, 16 rules, Edge processing) reveals that a high-rule-count module processes speed violations on an adaptive-codec stream.

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

This view answers: which video management systems are overseen by each control center, and what are the center's infrastructure capabilities? A row showing center `5844261` (Seasonal Survey, Active, capacity 27, no video wall, has 2.5D maps) managing `SYS-2050` (Edge, non-scalable) indicates that a map-equipped but wall-less center oversees a simple Edge deployment. A row linking center `default_chart_a_tax_13` (Pilot Assessment, Active, capacity 48, has video wall, no 2.5D maps) to `SYS-2053` (Edge, scalable) demonstrates that a well-equipped center manages a scalable system.

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

This view answers: which analytics module generated each forensic evidence record, and what are the module's processing characteristics? A row connecting evidence `1` (IntrusionAlert, confidence 8.20) to module `1000` (IVCart15, IntrusionDetection, Edge processing, legacy-sdk-13) shows that a legacy SDK module on the Edge produced a moderate-confidence alert. A row linking evidence `4` (PeopleCount, confidence 14.80) to module `1003` (account_pymes_132, SpeedViolation, Edge processing, primary-sdk-16) reveals that a primary SDK module generated a high-confidence people count record.

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

This view answers: which video management system is associated with each forensic evidence record, and what are the system's deployment details? A row showing evidence `1` (IntrusionAlert, verified, distributed-storage-48) linked to `SYS-2050` (Edge, non-scalable, manufactured by Esperion Therapeutics Inc.) demonstrates that a non-scalable Edge system's intrusion detection produced verified evidence stored in a distributed location. A row connecting evidence `4` (PeopleCount, unverified, extended-storage-51) to `SYS-2053` (Edge, scalable, manufactured by Switch Card Services Ltd.) reveals that a scalable Edge system generated an unverified people count record stored in an extended storage facility.

The surveillance and analytics domain is defined by its layered relationships: cameras feed streams, streams are analyzed by modules, modules generate evidence, and all of it is managed by systems under the oversight of control centers. The association tables ensure that these relationships can be many-to-many, supporting flexible reconfigurations as deployments evolve. The views provide the synthesized detail needed for operational decision-making—whether assessing which systems need maintenance, which modules are producing high-confidence evidence, or which cameras are feeding streams that require higher bandwidth. Every identifier, version number, and status flag in the data serves as a traceable link in the chain from physical capture to forensic record, ensuring that the entire surveillance infrastructure remains auditable, manageable, and accountable.