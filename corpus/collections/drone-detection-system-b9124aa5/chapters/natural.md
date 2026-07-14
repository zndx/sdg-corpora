## Detection Infrastructure

The drone detection ecosystem operates as a distributed network of ground-based sensors, each responsible for monitoring a defined volume of airspace and reporting on aerial activity within its coverage area. At the heart of this infrastructure are the detection systems themselves, which serve as the primary data collection nodes. Each system is uniquely identified by a system identifier, manufactured by a specific organization, and assigned a model number that encodes its hardware generation. The deployment status of each unit—whether active, discontinued, or deprecated—determines its role in the current operational picture.

**Table `drone_detection_systems`**

| id | system_identifier | manufacturer | model_number | deployment_status | effective_range_meters | last_firmware_version | module_serial_number |
|---|---|---|---|---|---|---|---|
| 100 | SYS-2050 | Standard Chartered | MOD-2238 | active | 10.45 | regional-last-36 | e604b688-8fd1-11eb-924d-9cd76263cbd0 |
| 101 | SYS-2051 | General Motors | MOD-2244 | discontinued | 14.90 | legacy-last-37 | 8189475 |
| 102 | SYS-2052 | Column Name cannot be empty | MOD-2250 | deprecated | 19.35 | compact-last-38 | 5082969 |
| 103 | SYS-2053 | Financial Information Service Co. Ltd. | MOD-2256 | active | 23.80 | composite-last-39 | 1562833 |

Consider the system identified as SYS-2050, manufactured by Standard Chartered under model MOD-2238. This unit remains active with an effective range of 10.45 meters and runs the regional-last-36 firmware revision. Its associated module serial number, e604b688-8fd1-11eb-924d-9cd76263cbd0, ties it to a specific firmware and encryption configuration. By contrast, SYS-2051 from General Motors (MOD-2244) carries a longer effective range of 14.90 meters but has been discontinued, while SYS-2052 from Column Name cannot be empty (MOD-2250) is marked deprecated with a range of 19.35 meters. The most capable unit in the registry, SYS-2053 from Financial Information Service Co. Ltd. (MOD-2256), achieves a 23.80-meter effective range and remains active on the composite-last-39 firmware. These range figures and firmware versions directly influence the quality and scope of signal acquisition each node provides.

## Upgrade and Firmware Management

Every detection system relies on an upgrade module that governs its firmware state, encryption standard, and authentication posture. The upgrade module is the central configuration object that determines whether a system can securely process and relay detection data. Each module carries a unique serial number, a firmware version string, an encryption standard designation, and an authentication status that reflects whether the module has been successfully verified. The session key provides the cryptographic credential for secure communications, while the compatibility status indicates whether the module is suitable for its assigned detection system.

**Table `upgrade_modules`**

| module_serial_number | firmware_version | encryption_standard | authentication_status | session_key | compatibility_status | drone_detection_system_id | manufacturer_server_id |
|---|---|---|---|---|---|---|---|
| e604b688-8fd1-11eb-924d-9cd76263cbd0 | distributed-firmware-48 | pilot-encrypti-26 | pending | SES-2026 | compatible | 100 | 1 |
| 8189475 | baseline-firmware-49 | extended-encrypti-27 | authenticated | SES-2031 | incompatible | 101 | 2 |
| 5082969 | pilot-firmware-50 | integrated-encrypti-28 | failed | SES-2036 | unknown | 102 | 3 |
| 1562833 | extended-firmware-51 | seasonal-encrypti-29 | pending | SES-2041 | compatible | 103 | 4 |

The module e604b688-8fd1-11eb-924d-9cd76263cbd0, paired with detection system SYS-2050, runs the distributed-firmware-48 revision under the pilot-encrypti-26 standard. Its authentication status is pending, and the session key SES-2026 is active. The compatibility status reads compatible, confirming the module is properly matched to its host system. In contrast, module 8189475 assigned to SYS-2051 uses baseline-firmware-49 with extended-encrypti-27, has completed authentication, but reports an incompatible compatibility status—a configuration that would prevent normal operation despite successful authentication. Module 5082969 for SYS-2052 has a failed authentication status and an unknown compatibility assessment, while module 1562833 for SYS-2053 runs extended-firmware-51 under seasonal-encrypti-29 with a pending authentication and a confirmed compatible status.

## Signal Acquisition and Tracking

Detection systems continuously monitor the electromagnetic spectrum for drone transmissions, recording each encounter as a signal event. Each signal record captures the signal identifier, the drone serial number emitting the transmission, the drone's current flight status, the pilot's reported location, the encryption state of the signal, and a precise timestamp of detection. The signal is linked to a specific drone in the fleet registry and to the upgrade module of the detection system that captured it, creating a traceable chain from raw signal to system configuration.

**Table `drone_signals`**

| id | signal_id | drone_serial_number | flight_status | pilot_location | encryption_status | timestamp | drone_id | module_serial_number | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 317 | 10238261 | idle | adaptive-pilot-83 | encrypted | 2024-07-08T18:18:00 | 1 | e604b688-8fd1-11eb-924d-9cd76263cbd0 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | 6564371 | 15213461 | flying | distributed-pilot-84 | unencrypted | 2025-12-19T01:35:00 | 2 | 8189475 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | 4463669 | BjoernKW | landing | baseline-pilot-85 | unknown | 2022-05-03T08:52:00 | 3 | 5082969 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | 6969425 | 611502 | unknown | pilot-pilot-86 | encrypted | 2023-10-14T15:09:00 | 4 | 1562833 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Signal 317, detected on 2024-07-08 at 18:18 UTC, originated from drone serial 10238261, which was in an idle flight status. The pilot location was recorded as adaptive-pilot-83, and the signal was encrypted. This signal was captured by the detection system running module e604b688-8fd1-11eb-924d-9cd76263cbd0 and is associated with drone record 1. Signal 6564371, recorded on 2025-12-19 at 01:35 UTC, came from drone 15213461 in a flying state, with an unencrypted transmission from distributed-pilot-84, captured by module 8189475 and linked to drone 2. Signal 4463669 from 2022-05-03 shows drone BjoernKW in landing status with an unknown encryption state, while signal 6969425 from 2023-10-14 captures drone 611502 with an encrypted transmission from pilot-pilot-86. The created_at and updated_at timestamps on each signal record provide an audit trail of when the detection was first logged and when it was last reviewed.

## Manufacturer Server Infrastructure

The manufacturer servers form the backend infrastructure that supports firmware distribution, module management, and system configuration across the detection network. Each server is assigned a unique server identifier, a location designation, an access level that controls who can interact with it, a last maintenance date, and a security audit status that reflects the outcome of the most recent compliance review.

**Table `manufacturer_servers`**

| manufacturer_server_id | server_id | server_location | access_level | last_maintenance_date | security_audit_status |
|---|---|---|---|---|---|
| 1 | 911352d5dab64576b7a6da51aa69d76d | extended-server-99 | public | 2024-03-27 | passed |
| 2 | 1450637 | integrated-server-100 | restricted | 2025-08-11 | failed |
| 3 | 4985152 | seasonal-server-101 | government | 2022-01-22 | pending |
| 4 | 9736887 | regional-server-102 | public | 2023-06-06 | passed |

Server 911352d5dab64576b7a6da51aa69d76d, designated extended-server-99, operates at a public access level and passed its security audit on 2024-03-27. Server 1450637 (integrated-server-100) restricts access to authorized personnel and failed its audit on 2025-08-11, indicating a potential compliance gap. Server 4985152 (seasonal-server-101) is restricted to government access with a pending audit status, while server 9736887 (regional-server-102) is publicly accessible and passed its audit on 2023-06-06. The security audit outcomes directly influence which upgrade modules can be distributed through each server, as incompatible or unverified modules are blocked from deployment.

## Airspace Zone Management

The operational area is partitioned into airspace zones, each with a defined zone type, altitude limit, radius of coverage, and enforcement level. These zones determine the regulatory constraints under which detected drones must operate, and the enforcement level—ranging from advisory to prohibited—dictates the response required when a drone enters a restricted area.

**Table `airspace_zones`**

| zone_id | zone_type | altitude_limit_meters | radius_meters | enforcement_level | created_at | updated_at |
|---|---|---|---|---|---|---|
| 937724 | no-fly | 10.45 | 9.20 | advisory | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 99504 | restricted | 13.90 | 11.40 | mandatory | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 10207142 | controlled | 17.35 | 13.60 | prohibited | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 | public | 20.80 | 15.80 | advisory | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Zone 937724 is classified as a no-fly zone with an altitude limit of 10.45 meters and a radius of 9.20 meters, operating under advisory enforcement. Zone 99504 is a restricted zone reaching 13.90 meters altitude with an 11.40-meter radius under mandatory enforcement. Zone 10207142 is a controlled zone with a 17.35-meter altitude ceiling, 13.60-meter radius, and prohibited enforcement level—the strictest category. Zone f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 is a public zone allowing operations up to 20.80 meters within a 15.80-meter radius under advisory enforcement. The enforcement levels create a graduated response framework that detection systems use to classify and report drone activity.

## Drone Fleet Registry

The drone fleet registry maintains the authoritative inventory of all aerial assets under observation. Each drone record includes a drone identifier, the manufacturer, the model designation, a serial number, and an operational status that reflects whether the drone is currently active, inactive, or decommissioned.

**Table `drones`**

| id | drone_id | manufacturer | model | serial_number | operational_status |
|---|---|---|---|---|---|
| 1 | 1437577 | Standard Chartered | composite-model-81 | 5844275 | active |
| 2 | 5917277 | General Motors | primary-model-82 | 69422 | inactive |
| 3 | 5917276 | Column Name cannot be empty | adaptive-model-83 | 7731874 | decommissioned |
| 4 | 3990167 | Financial Information Service Co. Ltd. | distributed-model-84 | 10445632 | active |

Drone 1437577, manufactured by Standard Chartered as composite-model-81 with serial 5844275, is currently active. Drone 5917277 from General Motors (primary-model-82, serial 69422) is inactive, while drone 5917276 (adaptive-model-83, serial 7731874) from Column Name cannot be empty has been decommissioned. Drone 3990167, a distributed-model-84 manufactured by Financial Information Service Co. Ltd. with serial 10445632, remains active. The operational status of each drone, combined with the flight status recorded in signal events, provides a comprehensive picture of fleet readiness and activity.

## Cross-Reference Relationships

The detection ecosystem relies on a network of cross-reference tables that link systems to signals, zones, and servers, enabling complex queries about the relationships between infrastructure components. The systems_signals table records which detection systems have captured which signals, creating a direct mapping from raw detection events to the hardware that observed them. The systems_zones table associates detection systems with the airspace zones they monitor, defining the spatial coverage of each node.

**Table `systems_signals`**

| drone_detection_system_id | drone_signal_id |
|---|---|
| 100 | 1 |
| 100 | 2 |
| 101 | 2 |
| 101 | 3 |
| 102 | 3 |
| 102 | 4 |
| 103 | 4 |
| 103 | 1 |

**Table `systems_zones`**

| drone_detection_system_id | zone_id |
|---|---|
| 100 | 937724 |
| 100 | 99504 |
| 101 | 99504 |
| 101 | 10207142 |
| 102 | 10207142 |
| 102 | f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 |
| 103 | f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 |
| 103 | 937724 |

The signals_systems table provides the inverse mapping, allowing queries to trace from a specific signal back to the detection system that recorded it. This bidirectional linking ensures that every signal can be attributed to both the drone that emitted it and the system that detected it.

**Table `signals_systems`**

| drone_signal_id | drone_detection_system_id |
|---|---|
| 1 | 100 |
| 1 | 101 |
| 2 | 101 |
| 2 | 102 |
| 3 | 102 |
| 3 | 103 |
| 4 | 103 |
| 4 | 100 |

Server relationships are captured through servers_modules, which link manufacturer servers to the upgrade modules they host and distribute, and servers_systems, which associate servers with the detection systems they support.

**Table `servers_modules`**

| manufacturer_server_id | module_serial_number |
|---|---|
| 1 | e604b688-8fd1-11eb-924d-9cd76263cbd0 |
| 1 | 8189475 |
| 2 | 8189475 |
| 2 | 5082969 |
| 3 | 5082969 |
| 3 | 1562833 |
| 4 | 1562833 |
| 4 | e604b688-8fd1-11eb-924d-9cd76263cbd0 |

**Table `servers_systems`**

| manufacturer_server_id | drone_detection_system_id |
|---|---|
| 1 | 100 |
| 1 | 101 |
| 2 | 101 |
| 2 | 102 |
| 3 | 102 |
| 3 | 103 |
| 4 | 103 |
| 4 | 100 |

Zone relationships are maintained through zones_systems, which define which detection systems are responsible for which airspace zones, and zones_drones, which record which drones have been observed within which zones.

**Table `zones_systems`**

| zone_id | drone_detection_system_id |
|---|---|
| 937724 | 100 |
| 937724 | 101 |
| 99504 | 101 |
| 99504 | 102 |
| 10207142 | 102 |
| 10207142 | 103 |
| f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 | 103 |
| f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 | 100 |

**Table `zones_drones`**

| zone_id | drone_id |
|---|---|
| 937724 | 1 |
| 937724 | 2 |
| 99504 | 2 |
| 99504 | 3 |
| 10207142 | 3 |
| 10207142 | 4 |
| f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 | 4 |
| f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 | 1 |

The drones_signals table links drones directly to the signals they have emitted, providing a chronological record of each drone's transmission history. The drones_zones table records the spatial relationship between drones and the zones they have entered, enabling compliance monitoring and enforcement tracking.

**Table `drones_signals`**

| drone_id | drone_signal_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

**Table `drones_zones`**

| drone_id | zone_id |
|---|---|
| 1 | 937724 |
| 1 | 99504 |
| 2 | 99504 |
| 2 | 10207142 |
| 3 | 10207142 |
| 3 | f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 |
| 4 | f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 |
| 4 | 937724 |

## Analytical Views

The analytical views synthesize the base tables into focused perspectives that answer specific operational questions. Each view joins multiple tables to produce a consolidated record that combines infrastructure details, signal data, zone information, and drone status into a single queryable result.

The view vw_drone_detection_system_upgrade_module joins detection systems with their upgrade modules, answering the question of which firmware and encryption configuration each system is running. A row from this view might show SYS-2050 paired with module e604b688-8fd1-11eb-924d-9cd76263cbd0, running distributed-firmware-48 under pilot-encrypti-26 with a compatible status.

**View `vw_drone_detection_system_upgrade_module`**

```sql
CREATE VIEW vw_drone_detection_system_upgrade_module AS
SELECT a.id, a.system_identifier, a.manufacturer, a.model_number, b.module_serial_number AS module_module_serial_number, b.firmware_version AS module_firmware_version, b.encryption_standard AS module_encryption_standard
FROM drone_detection_systems a JOIN upgrade_modules b ON a.module_serial_number = b.module_serial_number;
```

| id | system_identifier | manufacturer | model_number | module_module_serial_number | module_firmware_version | module_encryption_standard |
|---|---|---|---|---|---|---|
| 100 | SYS-2050 | Standard Chartered | MOD-2238 | e604b688-8fd1-11eb-924d-9cd76263cbd0 | distributed-firmware-48 | pilot-encrypti-26 |
| 101 | SYS-2051 | General Motors | MOD-2244 | 8189475 | baseline-firmware-49 | extended-encrypti-27 |
| 102 | SYS-2052 | Column Name cannot be empty | MOD-2250 | 5082969 | pilot-firmware-50 | integrated-encrypti-28 |
| 103 | SYS-2053 | Financial Information Service Co. Ltd. | MOD-2256 | 1562833 | extended-firmware-51 | seasonal-encrypti-29 |

The view vw_drone_detection_system_drone_signal_detail combines detection system information with the signals they have captured, enabling operators to see which systems detected which drones and under what conditions. A representative row could link SYS-2050 to signal 317 from drone 10238261, showing the idle flight status and encrypted transmission state.

**View `vw_drone_detection_system_drone_signal_detail`**

```sql
CREATE VIEW vw_drone_detection_system_drone_signal_detail AS
SELECT a.id, a.system_identifier, a.manufacturer, b.id AS signal_id, b.signal_id AS signal_signal_id, b.drone_serial_number AS signal_drone_serial_number
FROM drone_detection_systems a
  JOIN systems_signals j ON j.drone_detection_system_id = a.id
  JOIN drone_signals b ON b.id = j.drone_signal_id;
```

| id | system_identifier | manufacturer | signal_id | signal_signal_id | signal_drone_serial_number |
|---|---|---|---|---|---|
| 100 | SYS-2050 | Standard Chartered | 1 | 317 | 10238261 |
| 100 | SYS-2050 | Standard Chartered | 2 | 6564371 | 15213461 |
| 101 | SYS-2051 | General Motors | 2 | 6564371 | 15213461 |
| 101 | SYS-2051 | General Motors | 3 | 4463669 | BjoernKW |
| 102 | SYS-2052 | Column Name cannot be empty | 3 | 4463669 | BjoernKW |
| 102 | SYS-2052 | Column Name cannot be empty | 4 | 6969425 | 611502 |
| 103 | SYS-2053 | Financial Information Service Co. Ltd. | 4 | 6969425 | 611502 |
| 103 | SYS-2053 | Financial Information Service Co. Ltd. | 1 | 317 | 10238261 |

The view vw_drone_detection_system_airspace_zone_detail maps detection systems to the airspace zones they monitor, providing a spatial coverage report. A row might associate SYS-2050 with zone 937724, a no-fly zone under advisory enforcement with a 10.45-meter altitude limit.

**View `vw_drone_detection_system_airspace_zone_detail`**

```sql
CREATE VIEW vw_drone_detection_system_airspace_zone_detail AS
SELECT a.id, a.system_identifier, a.manufacturer, b.zone_id AS zone_zone_id, b.zone_type AS zone_zone_type, b.altitude_limit_meters AS zone_altitude_limit_meters
FROM drone_detection_systems a
  JOIN systems_zones j ON j.drone_detection_system_id = a.id
  JOIN airspace_zones b ON b.zone_id = j.zone_id;
```

| id | system_identifier | manufacturer | zone_zone_id | zone_zone_type | zone_altitude_limit_meters |
|---|---|---|---|---|---|
| 100 | SYS-2050 | Standard Chartered | 937724 | no-fly | 10.45 |
| 100 | SYS-2050 | Standard Chartered | 99504 | restricted | 13.90 |
| 101 | SYS-2051 | General Motors | 99504 | restricted | 13.90 |
| 101 | SYS-2051 | General Motors | 10207142 | controlled | 17.35 |
| 102 | SYS-2052 | Column Name cannot be empty | 10207142 | controlled | 17.35 |
| 102 | SYS-2052 | Column Name cannot be empty | f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 | public | 20.80 |
| 103 | SYS-2053 | Financial Information Service Co. Ltd. | f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 | public | 20.80 |
| 103 | SYS-2053 | Financial Information Service Co. Ltd. | 937724 | no-fly | 10.45 |

The view vw_upgrade_module_drone_detection_system presents the relationship from the module's perspective, showing which detection system each upgrade module is assigned to. This is useful for auditing module deployments and identifying systems that may need firmware updates.

**View `vw_upgrade_module_drone_detection_system`**

```sql
CREATE VIEW vw_upgrade_module_drone_detection_system AS
SELECT a.module_serial_number, a.firmware_version, a.encryption_standard, a.authentication_status, b.id AS system_id, b.system_identifier AS system_system_identifier, b.manufacturer AS system_manufacturer
FROM upgrade_modules a JOIN drone_detection_systems b ON a.drone_detection_system_id = b.id;
```

| module_serial_number | firmware_version | encryption_standard | authentication_status | system_id | system_system_identifier | system_manufacturer |
|---|---|---|---|---|---|---|
| e604b688-8fd1-11eb-924d-9cd76263cbd0 | distributed-firmware-48 | pilot-encrypti-26 | pending | 100 | SYS-2050 | Standard Chartered |
| 8189475 | baseline-firmware-49 | extended-encrypti-27 | authenticated | 101 | SYS-2051 | General Motors |
| 5082969 | pilot-firmware-50 | integrated-encrypti-28 | failed | 102 | SYS-2052 | Column Name cannot be empty |
| 1562833 | extended-firmware-51 | seasonal-encrypti-29 | pending | 103 | SYS-2053 | Financial Information Service Co. Ltd. |

The view vw_upgrade_module_manufacturer_server links upgrade modules to the manufacturer servers that distribute them, answering which server is responsible for which module. A row might connect module e604b688-8fd1-11eb-924d-9cd76263cbd0 to server extended-server-99.

**View `vw_upgrade_module_manufacturer_server`**

```sql
CREATE VIEW vw_upgrade_module_manufacturer_server AS
SELECT a.module_serial_number, a.firmware_version, a.encryption_standard, a.authentication_status, b.manufacturer_server_id AS server_manufacturer_server_id, b.server_id AS server_server_id, b.server_location AS server_server_location
FROM upgrade_modules a JOIN manufacturer_servers b ON a.manufacturer_server_id = b.manufacturer_server_id;
```

| module_serial_number | firmware_version | encryption_standard | authentication_status | server_manufacturer_server_id | server_server_id | server_server_location |
|---|---|---|---|---|---|---|
| e604b688-8fd1-11eb-924d-9cd76263cbd0 | distributed-firmware-48 | pilot-encrypti-26 | pending | 1 | 911352d5dab64576b7a6da51aa69d76d | extended-server-99 |
| 8189475 | baseline-firmware-49 | extended-encrypti-27 | authenticated | 2 | 1450637 | integrated-server-100 |
| 5082969 | pilot-firmware-50 | integrated-encrypti-28 | failed | 3 | 4985152 | seasonal-server-101 |
| 1562833 | extended-firmware-51 | seasonal-encrypti-29 | pending | 4 | 9736887 | regional-server-102 |

The view vw_drone_signal_drone_detection_system_detail provides a signal-centric view that includes the full detection system context for each recorded signal. This is valuable for post-incident analysis, where operators need to understand the detection conditions for a specific signal event.

**View `vw_drone_signal_drone_detection_system_detail`**

```sql
CREATE VIEW vw_drone_signal_drone_detection_system_detail AS
SELECT a.id, a.signal_id, a.drone_serial_number, b.id AS system_id, b.system_identifier AS system_system_identifier, b.manufacturer AS system_manufacturer
FROM drone_signals a
  JOIN signals_systems j ON j.drone_signal_id = a.id
  JOIN drone_detection_systems b ON b.id = j.drone_detection_system_id;
```

| id | signal_id | drone_serial_number | system_id | system_system_identifier | system_manufacturer |
|---|---|---|---|---|---|
| 1 | 317 | 10238261 | 100 | SYS-2050 | Standard Chartered |
| 1 | 317 | 10238261 | 101 | SYS-2051 | General Motors |
| 2 | 6564371 | 15213461 | 101 | SYS-2051 | General Motors |
| 2 | 6564371 | 15213461 | 102 | SYS-2052 | Column Name cannot be empty |
| 3 | 4463669 | BjoernKW | 102 | SYS-2052 | Column Name cannot be empty |
| 3 | 4463669 | BjoernKW | 103 | SYS-2053 | Financial Information Service Co. Ltd. |
| 4 | 6969425 | 611502 | 103 | SYS-2053 | Financial Information Service Co. Ltd. |
| 4 | 6969425 | 611502 | 100 | SYS-2050 | Standard Chartered |

The view vw_drone_signal_drone joins signal records with their corresponding drone registry entries, combining transmission data with drone identity and operational status. A row might show signal 317 from drone 1437577 (composite-model-81, active status), providing a complete picture of the emitting asset.

**View `vw_drone_signal_drone`**

```sql
CREATE VIEW vw_drone_signal_drone AS
SELECT a.id, a.signal_id, a.drone_serial_number, a.flight_status, b.id AS drone_id, b.drone_id AS drone_drone_id, b.manufacturer AS drone_manufacturer
FROM drone_signals a JOIN drones b ON a.drone_id = b.id;
```

| id | signal_id | drone_serial_number | flight_status | drone_id | drone_drone_id | drone_manufacturer |
|---|---|---|---|---|---|---|
| 1 | 317 | 10238261 | idle | 1 | 1437577 | Standard Chartered |
| 2 | 6564371 | 15213461 | flying | 2 | 5917277 | General Motors |
| 3 | 4463669 | BjoernKW | landing | 3 | 5917276 | Column Name cannot be empty |
| 4 | 6969425 | 611502 | unknown | 4 | 3990167 | Financial Information Service Co. Ltd. |

The view vw_drone_signal_upgrade_module links signals to the upgrade modules of the detection systems that captured them, enabling analysis of how firmware and encryption configurations affect signal detection quality.

**View `vw_drone_signal_upgrade_module`**

```sql
CREATE VIEW vw_drone_signal_upgrade_module AS
SELECT a.id, a.signal_id, a.drone_serial_number, a.flight_status, b.module_serial_number AS module_module_serial_number, b.firmware_version AS module_firmware_version, b.encryption_standard AS module_encryption_standard
FROM drone_signals a JOIN upgrade_modules b ON a.module_serial_number = b.module_serial_number;
```

| id | signal_id | drone_serial_number | flight_status | module_module_serial_number | module_firmware_version | module_encryption_standard |
|---|---|---|---|---|---|---|
| 1 | 317 | 10238261 | idle | e604b688-8fd1-11eb-924d-9cd76263cbd0 | distributed-firmware-48 | pilot-encrypti-26 |
| 2 | 6564371 | 15213461 | flying | 8189475 | baseline-firmware-49 | extended-encrypti-27 |
| 3 | 4463669 | BjoernKW | landing | 5082969 | pilot-firmware-50 | integrated-encrypti-28 |
| 4 | 6969425 | 611502 | unknown | 1562833 | extended-firmware-51 | seasonal-encrypti-29 |

The view vw_manufacturer_server_upgrade_module_detail presents a server-centric view of the modules they distribute, including module firmware versions and compatibility status. This view supports inventory management and compliance auditing of the firmware distribution pipeline.

**View `vw_manufacturer_server_upgrade_module_detail`**

```sql
CREATE VIEW vw_manufacturer_server_upgrade_module_detail AS
SELECT a.manufacturer_server_id, a.server_id, a.server_location, b.module_serial_number AS module_module_serial_number, b.firmware_version AS module_firmware_version, b.encryption_standard AS module_encryption_standard
FROM manufacturer_servers a
  JOIN servers_modules j ON j.manufacturer_server_id = a.manufacturer_server_id
  JOIN upgrade_modules b ON b.module_serial_number = j.module_serial_number;
```

| manufacturer_server_id | server_id | server_location | module_module_serial_number | module_firmware_version | module_encryption_standard |
|---|---|---|---|---|---|
| 1 | 911352d5dab64576b7a6da51aa69d76d | extended-server-99 | e604b688-8fd1-11eb-924d-9cd76263cbd0 | distributed-firmware-48 | pilot-encrypti-26 |
| 1 | 911352d5dab64576b7a6da51aa69d76d | extended-server-99 | 8189475 | baseline-firmware-49 | extended-encrypti-27 |
| 2 | 1450637 | integrated-server-100 | 8189475 | baseline-firmware-49 | extended-encrypti-27 |
| 2 | 1450637 | integrated-server-100 | 5082969 | pilot-firmware-50 | integrated-encrypti-28 |
| 3 | 4985152 | seasonal-server-101 | 5082969 | pilot-firmware-50 | integrated-encrypti-28 |
| 3 | 4985152 | seasonal-server-101 | 1562833 | extended-firmware-51 | seasonal-encrypti-29 |
| 4 | 9736887 | regional-server-102 | 1562833 | extended-firmware-51 | seasonal-encrypti-29 |
| 4 | 9736887 | regional-server-102 | e604b688-8fd1-11eb-924d-9cd76263cbd0 | distributed-firmware-48 | pilot-encrypti-26 |

The view vw_manufacturer_server_drone_detection_system_detail connects manufacturer servers to the detection systems they support, providing a clear picture of server-to-system assignments and enabling capacity planning for the backend infrastructure.

**View `vw_manufacturer_server_drone_detection_system_detail`**

```sql
CREATE VIEW vw_manufacturer_server_drone_detection_system_detail AS
SELECT a.manufacturer_server_id, a.server_id, a.server_location, b.id AS system_id, b.system_identifier AS system_system_identifier, b.manufacturer AS system_manufacturer
FROM manufacturer_servers a
  JOIN servers_systems j ON j.manufacturer_server_id = a.manufacturer_server_id
  JOIN drone_detection_systems b ON b.id = j.drone_detection_system_id;
```

| manufacturer_server_id | server_id | server_location | system_id | system_system_identifier | system_manufacturer |
|---|---|---|---|---|---|
| 1 | 911352d5dab64576b7a6da51aa69d76d | extended-server-99 | 100 | SYS-2050 | Standard Chartered |
| 1 | 911352d5dab64576b7a6da51aa69d76d | extended-server-99 | 101 | SYS-2051 | General Motors |
| 2 | 1450637 | integrated-server-100 | 101 | SYS-2051 | General Motors |
| 2 | 1450637 | integrated-server-100 | 102 | SYS-2052 | Column Name cannot be empty |
| 3 | 4985152 | seasonal-server-101 | 102 | SYS-2052 | Column Name cannot be empty |
| 3 | 4985152 | seasonal-server-101 | 103 | SYS-2053 | Financial Information Service Co. Ltd. |
| 4 | 9736887 | regional-server-102 | 103 | SYS-2053 | Financial Information Service Co. Ltd. |
| 4 | 9736887 | regional-server-102 | 100 | SYS-2050 | Standard Chartered |

The view vw_airspace_zone_drone_detection_system_detail maps airspace zones to the detection systems responsible for monitoring them, answering which systems cover which regulatory areas. A row might link no-fly zone 937724 to detection system SYS-2050.

**View `vw_airspace_zone_drone_detection_system_detail`**

```sql
CREATE VIEW vw_airspace_zone_drone_detection_system_detail AS
SELECT a.zone_id, a.zone_type, a.altitude_limit_meters, b.id AS system_id, b.system_identifier AS system_system_identifier, b.manufacturer AS system_manufacturer
FROM airspace_zones a
  JOIN zones_systems j ON j.zone_id = a.zone_id
  JOIN drone_detection_systems b ON b.id = j.drone_detection_system_id;
```

| zone_id | zone_type | altitude_limit_meters | system_id | system_system_identifier | system_manufacturer |
|---|---|---|---|---|---|
| 937724 | no-fly | 10.45 | 100 | SYS-2050 | Standard Chartered |
| 937724 | no-fly | 10.45 | 101 | SYS-2051 | General Motors |
| 99504 | restricted | 13.90 | 101 | SYS-2051 | General Motors |
| 99504 | restricted | 13.90 | 102 | SYS-2052 | Column Name cannot be empty |
| 10207142 | controlled | 17.35 | 102 | SYS-2052 | Column Name cannot be empty |
| 10207142 | controlled | 17.35 | 103 | SYS-2053 | Financial Information Service Co. Ltd. |
| f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 | public | 20.80 | 103 | SYS-2053 | Financial Information Service Co. Ltd. |
| f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 | public | 20.80 | 100 | SYS-2050 | Standard Chartered |

The view vw_airspace_zone_drone_detail combines zone information with drone data, showing which drones have been observed in which zones. This view is essential for compliance monitoring and enforcement reporting.

**View `vw_airspace_zone_drone_detail`**

```sql
CREATE VIEW vw_airspace_zone_drone_detail AS
SELECT a.zone_id, a.zone_type, a.altitude_limit_meters, b.id AS drone_id, b.drone_id AS drone_drone_id, b.manufacturer AS drone_manufacturer
FROM airspace_zones a
  JOIN zones_drones j ON j.zone_id = a.zone_id
  JOIN drones b ON b.id = j.drone_id;
```

| zone_id | zone_type | altitude_limit_meters | drone_id | drone_drone_id | drone_manufacturer |
|---|---|---|---|---|---|
| 937724 | no-fly | 10.45 | 1 | 1437577 | Standard Chartered |
| 937724 | no-fly | 10.45 | 2 | 5917277 | General Motors |
| 99504 | restricted | 13.90 | 2 | 5917277 | General Motors |
| 99504 | restricted | 13.90 | 3 | 5917276 | Column Name cannot be empty |
| 10207142 | controlled | 17.35 | 3 | 5917276 | Column Name cannot be empty |
| 10207142 | controlled | 17.35 | 4 | 3990167 | Financial Information Service Co. Ltd. |
| f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 | public | 20.80 | 4 | 3990167 | Financial Information Service Co. Ltd. |
| f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 | public | 20.80 | 1 | 1437577 | Standard Chartered |

The view vw_drone_drone_signal_detail joins drone registry entries with their signal records, providing a chronological transmission history for each drone. A row might connect drone 1437577 to signal 317, showing the idle flight status and encrypted state at the time of detection.

**View `vw_drone_drone_signal_detail`**

```sql
CREATE VIEW vw_drone_drone_signal_detail AS
SELECT a.id, a.drone_id, a.manufacturer, b.id AS signal_id, b.signal_id AS signal_signal_id, b.drone_serial_number AS signal_drone_serial_number
FROM drones a
  JOIN drones_signals j ON j.drone_id = a.id
  JOIN drone_signals b ON b.id = j.drone_signal_id;
```

| id | drone_id | manufacturer | signal_id | signal_signal_id | signal_drone_serial_number |
|---|---|---|---|---|---|
| 1 | 1437577 | Standard Chartered | 1 | 317 | 10238261 |
| 1 | 1437577 | Standard Chartered | 2 | 6564371 | 15213461 |
| 2 | 5917277 | General Motors | 2 | 6564371 | 15213461 |
| 2 | 5917277 | General Motors | 3 | 4463669 | BjoernKW |
| 3 | 5917276 | Column Name cannot be empty | 3 | 4463669 | BjoernKW |
| 3 | 5917276 | Column Name cannot be empty | 4 | 6969425 | 611502 |
| 4 | 3990167 | Financial Information Service Co. Ltd. | 4 | 6969425 | 611502 |
| 4 | 3990167 | Financial Information Service Co. Ltd. | 1 | 317 | 10238261 |

The view vw_drone_airspace_zone_detail links drones to the airspace zones they have entered, creating a compliance trail that shows which drones operated in which regulatory areas and under what enforcement levels.

**View `vw_drone_airspace_zone_detail`**

```sql
CREATE VIEW vw_drone_airspace_zone_detail AS
SELECT a.id, a.drone_id, a.manufacturer, b.zone_id AS zone_zone_id, b.zone_type AS zone_zone_type, b.altitude_limit_meters AS zone_altitude_limit_meters
FROM drones a
  JOIN drones_zones j ON j.drone_id = a.id
  JOIN airspace_zones b ON b.zone_id = j.zone_id;
```

| id | drone_id | manufacturer | zone_zone_id | zone_zone_type | zone_altitude_limit_meters |
|---|---|---|---|---|---|
| 1 | 1437577 | Standard Chartered | 937724 | no-fly | 10.45 |
| 1 | 1437577 | Standard Chartered | 99504 | restricted | 13.90 |
| 2 | 5917277 | General Motors | 99504 | restricted | 13.90 |
| 2 | 5917277 | General Motors | 10207142 | controlled | 17.35 |
| 3 | 5917276 | Column Name cannot be empty | 10207142 | controlled | 17.35 |
| 3 | 5917276 | Column Name cannot be empty | f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 | public | 20.80 |
| 4 | 3990167 | Financial Information Service Co. Ltd. | f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 | public | 20.80 |
| 4 | 3990167 | Financial Information Service Co. Ltd. | 937724 | no-fly | 10.45 |

## Synthesis

The drone detection ecosystem is a tightly integrated network of hardware, firmware, signals, and regulatory zones. Detection systems serve as the primary data collection points, each configured with a specific upgrade module that determines its firmware state and encryption capabilities. Manufacturer servers distribute and manage these modules, while airspace zones define the regulatory boundaries within which all operations must occur. Drones emit signals that are captured by detection systems, and every event in this chain—from firmware deployment to signal detection to zone entry—is recorded and cross-referenced across the system. The analytical views consolidate these relationships into actionable perspectives, enabling operators to trace any signal back to its source drone, its capturing detection system, its firmware configuration, and the airspace zone in which it was observed. This comprehensive data model supports real-time monitoring, post-incident analysis, compliance auditing, and infrastructure planning across the entire detection network.