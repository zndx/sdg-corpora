## Aerial Surveillance and Security Infrastructure

Modern aerial surveillance ecosystems integrate unmanned aircraft, ground-based detection systems, cryptographic communications, and networked server infrastructure into a unified operational fabric. At the heart of this architecture lies the aero scope system—a logical grouping that binds detection hardware, dongle modules, drones, and network segments into a single accountable unit. Each aero scope system carries a unique system identifier, runs a specific firmware version, and reports a measurable detection range in kilometres. System 8189503, for instance, operates with distributed-firmware-48 and covers 2.70 km, while system 605963 runs extended-firmware-51 and extends its reach to 7.80 km. The status field tracks the lifecycle stage of each system, ranging from active and upgraded to discontinued, with maintenance dates anchoring each unit to a concrete point in time.

**Table `aero_scope_systems`**

| id | system_id | firmware_version | detection_range_km | status | last_maintenance_date | dongle_module_id | drone_id | network_segment_id |
|---|---|---|---|---|---|---|---|---|
| 1000 | 8189503 | distributed-firmware-48 | 2.70 | active | 2024-03-27T14:06:00 | 100 | 1 | 1 |
| 1001 | 3717623 | baseline-firmware-49 | 4.40 | discontinued | 2025-08-11T21:23:00 | 101 | 2 | 2 |
| 1002 | 7441161 | pilot-firmware-50 | 6.10 | upgraded | 2022-01-22T04:40:00 | 102 | 3 | 3 |
| 1003 | 605963 | extended-firmware-51 | 7.80 | active | 2023-06-06T11:57:00 | 103 | 4 | 4 |

The dongle module serves as the cryptographic and communication bridge between the aero scope system and external servers. Each module carries a dongle identifier, a firmware hash that identifies its software baseline, and a manufacture date. The encryption_support flag indicates whether the module can perform on-the-fly data encryption, while the security_risk_level categorises its exposure—low, medium, high, or critical. Module 100, manufactured on 2023-06-05 with firmware hash adaptive-firmware-53, supports encryption and carries a low risk rating. By contrast, module 103, produced on 2022-09-11 with pilot-firmware-56, lacks encryption support and is classified as critical risk. Every dongle module is linked to both a DJI server and an aero scope system, forming the hardware backbone of the surveillance chain.

**Table `dongle_modules`**

| id | dongle_id | firmware_hash | manufacture_date | encryption_support | security_risk_level | server_id | aero_scope_system_id |
|---|---|---|---|---|---|---|---|
| 100 | 8843746 | adaptive-firmware-53 | 2023-06-05 | true | low | 911352d5dab64576b7a6da51aa69d76d | 1000 |
| 101 | 4277021 | distributed-firmware-54 | 2024-11-16 | false | medium | 1450637 | 1001 |
| 102 | 1996912 | baseline-firmware-55 | 2025-04-27 | true | high | 4985152 | 1002 |
| 103 | 4060638 | pilot-firmware-56 | 2022-09-11 | false | critical | 9736887 | 1003 |

Drones represent the airborne assets deployed within each scope. A drone record captures its serial number, manufacturer, flight status, last known location, and encryption state. Drone 5844275, manufactured by Standard Chartered, remains active at location pilot-last-26 with encrypted communications. Drone 69422 from General Motors sits idle at extended-last-27 and runs unencrypted. Drone 7731874, attributed to Column Name cannot be empty, has crashed at integrated-last-28 with an unknown encryption state. Drone 10445632, built by Financial Information Service Co. Ltd., reports an unknown flight status at seasonal-last-29 and maintains encrypted channels. Each drone is associated with an aero scope system and a data package, tying its operational identity to the broader surveillance infrastructure.

**Table `drones`**

| id | serial_number | manufacturer | flight_status | last_known_location | encryption_status | aero_scope_system_id | data_package_id | created_at |
|---|---|---|---|---|---|---|---|---|
| 1 | 5844275 | Standard Chartered | active | pilot-last-26 | encrypted | 1000 | 1 | 2025-01-01 00:14:00 |
| 2 | 69422 | General Motors | idle | extended-last-27 | unencrypted | 1001 | 2 | 2025-02-06 03:14:00 |
| 3 | 7731874 | Column Name cannot be empty | crashed | integrated-last-28 | unknown | 1002 | 3 | 2025-03-11 06:14:00 |
| 4 | 10445632 | Financial Information Service Co. Ltd. | unknown | seasonal-last-29 | encrypted | 1003 | 4 | 2025-04-16 09:14:00 |

Data packages encapsulate the payloads transmitted during surveillance missions. Each package carries a package identifier, a timestamp, a payload size in bytes, an encryption algorithm, and a decryption status. Package 9424918, recorded on 2024-07-08, contains a 34-byte payload encrypted with primary-encrypti-82 and has been successfully decrypted. Package account_pymes_1044, logged on 2025-12-19, holds 37 bytes under adaptive-encrypti-83 and remains in an encrypted state. Package 5844275 from 2022-05-03, with 40 bytes and distributed-encrypti-84, shows a failed decryption status. Package 2106710, timestamped 2023-10-14, carries 43 bytes encrypted with baseline-encrypti-85 and has been decrypted. Every data package is linked to a drone and an aero scope system, forming the data layer of the mission record.

**Table `data_packages`**

| id | package_id | timestamp | payload_size_bytes | encryption_algorithm | decryption_status | drone_id | aero_scope_system_id |
|---|---|---|---|---|---|---|---|
| 1 | 9424918 | 2024-07-08T18:18:00 | 34 | primary-encrypti-82 | decrypted | 1 | 1000 |
| 2 | account_pymes_1044 | 2025-12-19T01:35:00 | 37 | adaptive-encrypti-83 | encrypted | 2 | 1001 |
| 3 | 5844275 | 2022-05-03T08:52:00 | 40 | distributed-encrypti-84 | failed | 3 | 1002 |
| 4 | 2106710 | 2023-10-14T15:09:00 | 43 | baseline-encrypti-85 | decrypted | 4 | 1003 |

Flight path points document the geographic trajectory of each surveillance mission. Each point records a point identifier, latitude, longitude, altitude in metres, and a timestamp. Point lu_tax_code_template_m13 sits at coordinates 13.95, 21.20 at an altitude of 18.70 metres, logged on 2024-07-08. Point 1367e39e-8fcc-11eb-924d-9cd76263cbd0 is located at 17.90, 25.40 at 23.40 metres, recorded on 2025-12-19. Point a29214b2-9bad-11eb-a8a2-19ed5c03f8d3 occupies 21.85, 29.60 at 28.10 metres, timestamped 2022-05-03. Point 575198 rests at 25.80, 33.80 at 32.80 metres, logged on 2023-10-14. Each flight path point is associated with a data package and an aero scope system, anchoring geographic data to the mission timeline.

**Table `flight_path_points`**

| id | point_id | latitude | longitude | altitude_meters | timestamp | data_package_id | aero_scope_system_id |
|---|---|---|---|---|---|---|---|
| 1 | lu_tax_code_template_m13 | 13.95 | 21.20 | 18.70 | 2024-07-08T18:18:00 | 1 | 1000 |
| 2 | 1367e39e-8fcc-11eb-924d-9cd76263cbd0 | 17.90 | 25.40 | 23.40 | 2025-12-19T01:35:00 | 2 | 1001 |
| 3 | a29214b2-9bad-11eb-a8a2-19ed5c03f8d3 | 21.85 | 29.60 | 28.10 | 2022-05-03T08:52:00 | 3 | 1002 |
| 4 | 575198 | 25.80 | 33.80 | 32.80 | 2023-10-14T15:09:00 | 4 | 1003 |

The DJI server infrastructure provides the backend communication layer for the entire ecosystem. Each server carries a server identifier, an IP address, a last communication timestamp, a response latency in milliseconds, and a security audit status. Server 911352d5dab64576b7a6da51aa69d76d, at IP extended-ip-15, last communicated on 2022-01-19 with a response latency of 43 ms and has passed its security audit. Server 1450637 at integrated-ip-16 last communicated on 2023-06-03 with 53 ms latency and has failed its audit. Server 4985152 at seasonal-ip-17 last communicated on 2024-11-14 with 63 ms latency and has a pending audit. Server 9736887 at regional-ip-18 last communicated on 2025-04-25 with 73 ms latency and has passed its audit. Each server is linked to a dongle module, an encryption key, and a network segment.

**Table `dji_servers`**

| server_id | ip_address | last_communication_time | response_latency_ms | security_audit_status | dongle_module_id | key_id | network_segment_id |
|---|---|---|---|---|---|---|---|
| 911352d5dab64576b7a6da51aa69d76d | extended-ip-15 | 2022-01-19T00:00:00 | 43 | passed | 100 | 2087751 | 1 |
| 1450637 | integrated-ip-16 | 2023-06-03T07:17:00 | 53 | failed | 101 | 2618562 | 2 |
| 4985152 | seasonal-ip-17 | 2024-11-14T14:34:00 | 63 | pending | 102 | 8843769 | 3 |
| 9736887 | regional-ip-18 | 2025-04-25T21:51:00 | 73 | passed | 103 | 065525fa-8fb2-11eb-924d-9cd76263cbd0 | 4 |

Encryption keys secure the data pipeline between drones, servers, and ground stations. Each key is identified by a key identifier and associated with a DJI server and a dongle module. The key infrastructure ensures that data packages remain confidential during transmission and can be decrypted only by authorised recipients.

**Table `encryption_keys`**

| key_id | algorithm_type | key_length_bits | expiration_date | usage_count | server_id | dongle_module_id | data_package_id |
|---|---|---|---|---|---|---|---|
| 2087751 | primary-algorith-10 | 17 | 2025-08-18 | 87 | 911352d5dab64576b7a6da51aa69d76d | 100 | 1 |
| 2618562 | adaptive-algorith-11 | 28 | 2022-01-02 | 20 | 1450637 | 101 | 2 |
| 8843769 | distributed-algorith-12 | 39 | 2023-06-13 | 33 | 4985152 | 102 | 3 |
| 065525fa-8fb2-11eb-924d-9cd76263cbd0 | baseline-algorith-13 | 50 | 2024-11-24 | 15 | 9736887 | 103 | 4 |

Network segments partition the communication topology into isolated zones. Each segment is identified by a numeric ID and linked to an aero scope system, a DJI server, and a security policy. These segments enforce traffic isolation and policy boundaries across the surveillance infrastructure.

**Table `network_segments`**

| network_segment_id | segment_id | security_level | firewall_enabled | last_audit_date | connected_devices_count | aero_scope_system_id | server_id | security_policy_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 422a03c4-8fcc-11eb-924d-9cd76263cbd0 | public | false | 2023-10-23 | 39 | 1000 | 911352d5dab64576b7a6da51aa69d76d | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | 32825 | internal | true | 2024-03-07 | 36 | 1001 | 1450637 | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | 974920 | classified | false | 2025-08-18 | 10 | 1002 | 4985152 | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | 2933482 | public | true | 2022-01-02 | 14 | 1003 | 9736887 | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Security policies define the rules governing data handling, access control, and compliance requirements within each network segment. They serve as the regulatory framework that security audits evaluate against actual system behaviour.

**Table `security_policies`**

| id | policy_id | policy_name | effective_date | last_review_date | compliance_status | network_segment_id | audit_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 5844252 | Regional Series | 2023-02-14 | 2022-09-03 | compliant | 1 | bjackman | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | 10207142 | Seasonal Assessment D | 2024-07-25 | 2023-02-14 | non-compliant | 2 | 69430 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | 1562847 | Integrated Survey | 2025-12-09 | 2024-07-25 | under-review | 3 | 10238266 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | ChIJkzsYUIBt5kcRM6_JHx26ONk | Extended Corridor | 2022-05-20 | 2025-12-09 | compliant | 4 | 6969437 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Security audits record the outcomes of compliance evaluations performed on network segments. Each audit references a network segment and a security policy, and its result feeds into the vulnerability management lifecycle.

**Table `security_audits`**

| audit_id | audit_date | auditor_name | findings_count | risk_rating | network_segment_id | security_policy_id | vulnerability_report_id |
|---|---|---|---|---|---|---|---|
| bjackman | 2025-12-04T23:33:00 | Compact Initiative | 2 | low | 1 | 1 | 1 |
| 69430 | 2022-05-15T06:50:00 | Legacy Model | 33 | medium | 2 | 2 | 2 |
| 10238266 | 2023-10-26T13:07:00 | Regional Cluster A | 23 | high | 3 | 3 | 3 |
| 6969437 | 2024-03-10T20:24:00 | Seasonal Review | 0 | critical | 4 | 4 | 4 |

Vulnerability reports document identified weaknesses in the infrastructure, linked to the network segments and security policies they affect. These reports close the loop between audit findings and remediation actions.

**Table `vulnerability_reports`**

| vulnerability_report_id | report_id | vulnerability_type | severity_score | discovery_date | remediation_status | audit_id | network_segment_id | security_policy_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 1202-0008-S | regional-vulnerab-36 | 8.45 | 2024-03-23 | open | bjackman | 1 | 1 |
| 2 | 8189500 | legacy-vulnerab-37 | 12.90 | 2025-08-07 | in-progress | 69430 | 2 | 2 |
| 3 | L355 | compact-vulnerab-38 | 17.35 | 2022-01-18 | resolved | 10238266 | 3 | 3 |
| 4 | 5844272 | composite-vulnerab-39 | 21.80 | 2023-06-02 | accepted | 6969437 | 4 | 4 |

The junction table packages_points connects data packages to flight path points, enabling the reconstruction of complete mission trajectories by associating each payload with its corresponding geographic coordinates.

**Table `packages_points`**

| data_package_id | flight_path_point_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

### Operational Relationships and Joined Views

The joined views provide the analytical lens through which operators understand the relationships between entities. The view vw_aero_scope_system_dongle_module answers the question of which dongle modules are assigned to each aero scope system. Row 1000 links to dongle module 100, which carries firmware hash adaptive-firmware-53, supports encryption, and carries a low security risk. Row 1003 links to dongle module 103, which carries pilot-firmware-56, lacks encryption support, and carries a critical risk rating. This join enables operators to assess the cryptographic capability and risk posture of every scope system.

**View `vw_aero_scope_system_dongle_module`**

```sql
CREATE VIEW vw_aero_scope_system_dongle_module AS
SELECT a.id, a.system_id, a.firmware_version, a.detection_range_km, b.id AS module_id, b.dongle_id AS module_dongle_id, b.firmware_hash AS module_firmware_hash
FROM aero_scope_systems a JOIN dongle_modules b ON a.dongle_module_id = b.id;
```

| id | system_id | firmware_version | detection_range_km | module_id | module_dongle_id | module_firmware_hash |
|---|---|---|---|---|---|---|
| 1000 | 8189503 | distributed-firmware-48 | 2.70 | 100 | 8843746 | adaptive-firmware-53 |
| 1001 | 3717623 | baseline-firmware-49 | 4.40 | 101 | 4277021 | distributed-firmware-54 |
| 1002 | 7441161 | pilot-firmware-50 | 6.10 | 102 | 1996912 | baseline-firmware-55 |
| 1003 | 605963 | extended-firmware-51 | 7.80 | 103 | 4060638 | pilot-firmware-56 |

The view vw_aero_scope_system_drone reveals which drones are deployed under each aero scope system. System 8189503 operates drone 5844275 from Standard Chartered, which is active and encrypted. System 605963 operates drone 10445632 from Financial Information Service Co. Ltd., which reports an unknown flight status but maintains encrypted communications. This relationship allows mission planners to verify that every drone under a given scope meets the required encryption and operational criteria.

**View `vw_aero_scope_system_drone`**

```sql
CREATE VIEW vw_aero_scope_system_drone AS
SELECT a.id, a.system_id, a.firmware_version, a.detection_range_km, b.id AS drone_id, b.serial_number AS drone_serial_number, b.manufacturer AS drone_manufacturer
FROM aero_scope_systems a JOIN drones b ON a.drone_id = b.id;
```

| id | system_id | firmware_version | detection_range_km | drone_id | drone_serial_number | drone_manufacturer |
|---|---|---|---|---|---|---|
| 1000 | 8189503 | distributed-firmware-48 | 2.70 | 1 | 5844275 | Standard Chartered |
| 1001 | 3717623 | baseline-firmware-49 | 4.40 | 2 | 69422 | General Motors |
| 1002 | 7441161 | pilot-firmware-50 | 6.10 | 3 | 7731874 | Column Name cannot be empty |
| 1003 | 605963 | extended-firmware-51 | 7.80 | 4 | 10445632 | Financial Information Service Co. Ltd. |

The view vw_aero_scope_system_network_segment maps each aero scope system to its assigned network segment. System 8189503 is assigned to network segment 1, while system 605963 is assigned to network segment 4. This mapping ensures that each scope system operates within a defined network boundary with its own security policy and server infrastructure.

**View `vw_aero_scope_system_network_segment`**

```sql
CREATE VIEW vw_aero_scope_system_network_segment AS
SELECT a.id, a.system_id, a.firmware_version, a.detection_range_km, b.network_segment_id AS segment_network_segment_id, b.segment_id AS segment_segment_id, b.security_level AS segment_security_level
FROM aero_scope_systems a JOIN network_segments b ON a.network_segment_id = b.network_segment_id;
```

| id | system_id | firmware_version | detection_range_km | segment_network_segment_id | segment_segment_id | segment_security_level |
|---|---|---|---|---|---|---|
| 1000 | 8189503 | distributed-firmware-48 | 2.70 | 1 | 422a03c4-8fcc-11eb-924d-9cd76263cbd0 | public |
| 1001 | 3717623 | baseline-firmware-49 | 4.40 | 2 | 32825 | internal |
| 1002 | 7441161 | pilot-firmware-50 | 6.10 | 3 | 974920 | classified |
| 1003 | 605963 | extended-firmware-51 | 7.80 | 4 | 2933482 | public |

The view vw_dongle_module_dji_server establishes the server assignment for each dongle module. Dongle module 100 is assigned to server 911352d5dab64576b7a6da51aa69d76d, which has passed its security audit and exhibits a response latency of 43 ms. Dongle module 103 is assigned to server 9736887, which has also passed its audit but shows a higher latency of 73 ms. This join is essential for diagnosing communication performance and audit compliance at the hardware level.

**View `vw_dongle_module_dji_server`**

```sql
CREATE VIEW vw_dongle_module_dji_server AS
SELECT a.id, a.dongle_id, a.firmware_hash, a.manufacture_date, b.server_id AS server_server_id, b.ip_address AS server_ip_address, b.last_communication_time AS server_last_communication_time
FROM dongle_modules a JOIN dji_servers b ON a.server_id = b.server_id;
```

| id | dongle_id | firmware_hash | manufacture_date | server_server_id | server_ip_address | server_last_communication_time |
|---|---|---|---|---|---|---|
| 100 | 8843746 | adaptive-firmware-53 | 2023-06-05 | 911352d5dab64576b7a6da51aa69d76d | extended-ip-15 | 2022-01-19T00:00:00 |
| 101 | 4277021 | distributed-firmware-54 | 2024-11-16 | 1450637 | integrated-ip-16 | 2023-06-03T07:17:00 |
| 102 | 1996912 | baseline-firmware-55 | 2025-04-27 | 4985152 | seasonal-ip-17 | 2024-11-14T14:34:00 |
| 103 | 4060638 | pilot-firmware-56 | 2022-09-11 | 9736887 | regional-ip-18 | 2025-04-25T21:51:00 |

The view vw_dongle_module_aero_scope_system provides the reverse linkage from dongle module to its parent aero scope system. Module 100 belongs to system 1000, module 101 to system 1001, module 102 to system 1002, and module 103 to system 1003. This relationship confirms the one-to-one binding between modules and systems, ensuring accountability for each hardware component.

**View `vw_dongle_module_aero_scope_system`**

```sql
CREATE VIEW vw_dongle_module_aero_scope_system AS
SELECT a.id, a.dongle_id, a.firmware_hash, a.manufacture_date, b.id AS system_id, b.system_id AS system_system_id, b.firmware_version AS system_firmware_version
FROM dongle_modules a JOIN aero_scope_systems b ON a.aero_scope_system_id = b.id;
```

| id | dongle_id | firmware_hash | manufacture_date | system_id | system_system_id | system_firmware_version |
|---|---|---|---|---|---|---|
| 100 | 8843746 | adaptive-firmware-53 | 2023-06-05 | 1000 | 8189503 | distributed-firmware-48 |
| 101 | 4277021 | distributed-firmware-54 | 2024-11-16 | 1001 | 3717623 | baseline-firmware-49 |
| 102 | 1996912 | baseline-firmware-55 | 2025-04-27 | 1002 | 7441161 | pilot-firmware-50 |
| 103 | 4060638 | pilot-firmware-56 | 2022-09-11 | 1003 | 605963 | extended-firmware-51 |

The view vw_drone_aero_scope_system reiterates the drone-to-system assignment from the drone perspective. Drone 5844275 is managed by system 1000, drone 69422 by system 1001, drone 7731874 by system 1002, and drone 10445632 by system 1003. This view is useful for drone-centric queries, such as identifying all systems that manage a particular manufacturer's fleet.

**View `vw_drone_aero_scope_system`**

```sql
CREATE VIEW vw_drone_aero_scope_system AS
SELECT a.id, a.serial_number, a.manufacturer, a.flight_status, b.id AS system_id, b.system_id AS system_system_id, b.firmware_version AS system_firmware_version
FROM drones a JOIN aero_scope_systems b ON a.aero_scope_system_id = b.id;
```

| id | serial_number | manufacturer | flight_status | system_id | system_system_id | system_firmware_version |
|---|---|---|---|---|---|---|
| 1 | 5844275 | Standard Chartered | active | 1000 | 8189503 | distributed-firmware-48 |
| 2 | 69422 | General Motors | idle | 1001 | 3717623 | baseline-firmware-49 |
| 3 | 7731874 | Column Name cannot be empty | crashed | 1002 | 7441161 | pilot-firmware-50 |
| 4 | 10445632 | Financial Information Service Co. Ltd. | unknown | 1003 | 605963 | extended-firmware-51 |

The view vw_drone_data_package links each drone to its associated data package. Drone 5844275 is associated with package 9424918, which contains a 34-byte payload encrypted with primary-encrypti-82 and has been decrypted. Drone 69422 is associated with package account_pymes_1044, holding 37 bytes under adaptive-encrypti-83 in an encrypted state. This join enables operators to trace data from the airborne asset to the specific payload it transmitted.

**View `vw_drone_data_package`**

```sql
CREATE VIEW vw_drone_data_package AS
SELECT a.id, a.serial_number, a.manufacturer, a.flight_status, b.id AS package_id, b.package_id AS package_package_id, b.timestamp AS package_timestamp
FROM drones a JOIN data_packages b ON a.data_package_id = b.id;
```

| id | serial_number | manufacturer | flight_status | package_id | package_package_id | package_timestamp |
|---|---|---|---|---|---|---|
| 1 | 5844275 | Standard Chartered | active | 1 | 9424918 | 2024-07-08T18:18:00 |
| 2 | 69422 | General Motors | idle | 2 | account_pymes_1044 | 2025-12-19T01:35:00 |
| 3 | 7731874 | Column Name cannot be empty | crashed | 3 | 5844275 | 2022-05-03T08:52:00 |
| 4 | 10445632 | Financial Information Service Co. Ltd. | unknown | 4 | 2106710 | 2023-10-14T15:09:00 |

The view vw_data_package_drone provides the reverse linkage from data package to drone. Package 9424918 originates from drone 5844275, package account_pymes_1044 from drone 69422, package 5844275 from drone 7731874, and package 2106710 from drone 10445632. This perspective is valuable when investigating a specific data package and needing to identify its source aircraft.

**View `vw_data_package_drone`**

```sql
CREATE VIEW vw_data_package_drone AS
SELECT a.id, a.package_id, a.timestamp, a.payload_size_bytes, b.id AS drone_id, b.serial_number AS drone_serial_number, b.manufacturer AS drone_manufacturer
FROM data_packages a JOIN drones b ON a.drone_id = b.id;
```

| id | package_id | timestamp | payload_size_bytes | drone_id | drone_serial_number | drone_manufacturer |
|---|---|---|---|---|---|---|
| 1 | 9424918 | 2024-07-08T18:18:00 | 34 | 1 | 5844275 | Standard Chartered |
| 2 | account_pymes_1044 | 2025-12-19T01:35:00 | 37 | 2 | 69422 | General Motors |
| 3 | 5844275 | 2022-05-03T08:52:00 | 40 | 3 | 7731874 | Column Name cannot be empty |
| 4 | 2106710 | 2023-10-14T15:09:00 | 43 | 4 | 10445632 | Financial Information Service Co. Ltd. |

The view vw_data_package_aero_scope_system connects each data package to its parent aero scope system. Package 9424918 belongs to system 1000, package account_pymes_1044 to system 1001, package 5844275 to system 1002, and package 2106710 to system 1003. This relationship ensures that every data payload can be traced back to the scope system that authorised its transmission.

**View `vw_data_package_aero_scope_system`**

```sql
CREATE VIEW vw_data_package_aero_scope_system AS
SELECT a.id, a.package_id, a.timestamp, a.payload_size_bytes, b.id AS system_id, b.system_id AS system_system_id, b.firmware_version AS system_firmware_version
FROM data_packages a JOIN aero_scope_systems b ON a.aero_scope_system_id = b.id;
```

| id | package_id | timestamp | payload_size_bytes | system_id | system_system_id | system_firmware_version |
|---|---|---|---|---|---|---|
| 1 | 9424918 | 2024-07-08T18:18:00 | 34 | 1000 | 8189503 | distributed-firmware-48 |
| 2 | account_pymes_1044 | 2025-12-19T01:35:00 | 37 | 1001 | 3717623 | baseline-firmware-49 |
| 3 | 5844275 | 2022-05-03T08:52:00 | 40 | 1002 | 7441161 | pilot-firmware-50 |
| 4 | 2106710 | 2023-10-14T15:09:00 | 43 | 1003 | 605963 | extended-firmware-51 |

The view vw_data_package_flight_path_point_detail joins data packages with their corresponding flight path points. Package 9424918 is associated with point lu_tax_code_template_m13 at coordinates 13.95, 21.20 and altitude 18.70 metres. Package account_pymes_1044 links to point 1367e39e-8fcc-11eb-924d-9cd76263cbd0 at 17.90, 25.40 and 23.40 metres. This join reconstructs the spatial context of each data payload, enabling operators to correlate transmitted data with geographic position.

**View `vw_data_package_flight_path_point_detail`**

```sql
CREATE VIEW vw_data_package_flight_path_point_detail AS
SELECT a.id, a.package_id, a.timestamp, b.id AS point_id, b.point_id AS point_point_id, b.latitude AS point_latitude
FROM data_packages a
  JOIN packages_points j ON j.data_package_id = a.id
  JOIN flight_path_points b ON b.id = j.flight_path_point_id;
```

| id | package_id | timestamp | point_id | point_point_id | point_latitude |
|---|---|---|---|---|---|
| 1 | 9424918 | 2024-07-08T18:18:00 | 1 | lu_tax_code_template_m13 | 13.95 |
| 1 | 9424918 | 2024-07-08T18:18:00 | 2 | 1367e39e-8fcc-11eb-924d-9cd76263cbd0 | 17.90 |
| 2 | account_pymes_1044 | 2025-12-19T01:35:00 | 2 | 1367e39e-8fcc-11eb-924d-9cd76263cbd0 | 17.90 |
| 2 | account_pymes_1044 | 2025-12-19T01:35:00 | 3 | a29214b2-9bad-11eb-a8a2-19ed5c03f8d3 | 21.85 |
| 3 | 5844275 | 2022-05-03T08:52:00 | 3 | a29214b2-9bad-11eb-a8a2-19ed5c03f8d3 | 21.85 |
| 3 | 5844275 | 2022-05-03T08:52:00 | 4 | 575198 | 25.80 |
| 4 | 2106710 | 2023-10-14T15:09:00 | 4 | 575198 | 25.80 |
| 4 | 2106710 | 2023-10-14T15:09:00 | 1 | lu_tax_code_template_m13 | 13.95 |

The view vw_flight_path_point_data_package provides the reverse linkage from flight path point to data package. Point lu_tax_code_template_m13 corresponds to package 9424918, point 1367e39e-8fcc-11eb-924d-9cd76263cbd0 to package account_pymes_1044, point a29214b2-9bad-11eb-a8a2-19ed5c03f8d3 to package 5844275, and point 575198 to package 2106710. This view supports geographic queries, such as retrieving all data packages transmitted at a given location.

**View `vw_flight_path_point_data_package`**

```sql
CREATE VIEW vw_flight_path_point_data_package AS
SELECT a.id, a.point_id, a.latitude, a.longitude, b.id AS package_id, b.package_id AS package_package_id, b.timestamp AS package_timestamp
FROM flight_path_points a JOIN data_packages b ON a.data_package_id = b.id;
```

| id | point_id | latitude | longitude | package_id | package_package_id | package_timestamp |
|---|---|---|---|---|---|---|
| 1 | lu_tax_code_template_m13 | 13.95 | 21.20 | 1 | 9424918 | 2024-07-08T18:18:00 |
| 2 | 1367e39e-8fcc-11eb-924d-9cd76263cbd0 | 17.90 | 25.40 | 2 | account_pymes_1044 | 2025-12-19T01:35:00 |
| 3 | a29214b2-9bad-11eb-a8a2-19ed5c03f8d3 | 21.85 | 29.60 | 3 | 5844275 | 2022-05-03T08:52:00 |
| 4 | 575198 | 25.80 | 33.80 | 4 | 2106710 | 2023-10-14T15:09:00 |

The view vw_flight_path_point_aero_scope_system links flight path points to their parent aero scope systems. Point lu_tax_code_template_m13 belongs to system 1000, point 1367e39e-8fcc-11eb-924d-9cd76263cbd0 to system 1001, point a29214b2-9bad-11eb-a8a2-19ed5c03f8d3 to system 1002, and point 575198 to system 1003. This relationship ensures that every geographic coordinate can be attributed to the scope system that directed the flight.

**View `vw_flight_path_point_aero_scope_system`**

```sql
CREATE VIEW vw_flight_path_point_aero_scope_system AS
SELECT a.id, a.point_id, a.latitude, a.longitude, b.id AS system_id, b.system_id AS system_system_id, b.firmware_version AS system_firmware_version
FROM flight_path_points a JOIN aero_scope_systems b ON a.aero_scope_system_id = b.id;
```

| id | point_id | latitude | longitude | system_id | system_system_id | system_firmware_version |
|---|---|---|---|---|---|---|
| 1 | lu_tax_code_template_m13 | 13.95 | 21.20 | 1000 | 8189503 | distributed-firmware-48 |
| 2 | 1367e39e-8fcc-11eb-924d-9cd76263cbd0 | 17.90 | 25.40 | 1001 | 3717623 | baseline-firmware-49 |
| 3 | a29214b2-9bad-11eb-a8a2-19ed5c03f8d3 | 21.85 | 29.60 | 1002 | 7441161 | pilot-firmware-50 |
| 4 | 575198 | 25.80 | 33.80 | 1003 | 605963 | extended-firmware-51 |

The view vw_dji_server_dongle_module presents the server-to-dongle assignment from the server perspective. Server 911352d5dab64576b7a6da51aa69d76d manages dongle module 100, server 1450637 manages module 101, server 4985152 manages module 102, and server 9736887 manages module 103. This view is useful for server-centric diagnostics, such as identifying all dongles managed by a server with a failed audit status.

**View `vw_dji_server_dongle_module`**

```sql
CREATE VIEW vw_dji_server_dongle_module AS
SELECT a.server_id, a.ip_address, a.last_communication_time, a.response_latency_ms, b.id AS module_id, b.dongle_id AS module_dongle_id, b.firmware_hash AS module_firmware_hash
FROM dji_servers a JOIN dongle_modules b ON a.dongle_module_id = b.id;
```

| server_id | ip_address | last_communication_time | response_latency_ms | module_id | module_dongle_id | module_firmware_hash |
|---|---|---|---|---|---|---|
| 911352d5dab64576b7a6da51aa69d76d | extended-ip-15 | 2022-01-19T00:00:00 | 43 | 100 | 8843746 | adaptive-firmware-53 |
| 1450637 | integrated-ip-16 | 2023-06-03T07:17:00 | 53 | 101 | 4277021 | distributed-firmware-54 |
| 4985152 | seasonal-ip-17 | 2024-11-14T14:34:00 | 63 | 102 | 1996912 | baseline-firmware-55 |
| 9736887 | regional-ip-18 | 2025-04-25T21:51:00 | 73 | 103 | 4060638 | pilot-firmware-56 |

The view vw_dji_server_encryption_key connects each DJI server to its assigned encryption key. Server 911352d5dab64576b7a6da51aa69d76d is associated with key 2087751, server 1450637 with key 2618562, server 4985152 with key 8843769, and server 9736887 with key 065525fa-8fb2-11eb-924d-9cd76263cbd0. This join ensures that every server has a cryptographic identity for securing communications.

**View `vw_dji_server_encryption_key`**

```sql
CREATE VIEW vw_dji_server_encryption_key AS
SELECT a.server_id, a.ip_address, a.last_communication_time, a.response_latency_ms, b.key_id AS key_key_id, b.algorithm_type AS key_algorithm_type, b.key_length_bits AS key_key_length_bits
FROM dji_servers a JOIN encryption_keys b ON a.key_id = b.key_id;
```

| server_id | ip_address | last_communication_time | response_latency_ms | key_key_id | key_algorithm_type | key_key_length_bits |
|---|---|---|---|---|---|---|
| 911352d5dab64576b7a6da51aa69d76d | extended-ip-15 | 2022-01-19T00:00:00 | 43 | 2087751 | primary-algorith-10 | 17 |
| 1450637 | integrated-ip-16 | 2023-06-03T07:17:00 | 53 | 2618562 | adaptive-algorith-11 | 28 |
| 4985152 | seasonal-ip-17 | 2024-11-14T14:34:00 | 63 | 8843769 | distributed-algorith-12 | 39 |
| 9736887 | regional-ip-18 | 2025-04-25T21:51:00 | 73 | 065525fa-8fb2-11eb-924d-9cd76263cbd0 | baseline-algorith-13 | 50 |

The view vw_dji_server_network_segment maps each DJI server to its network segment. Server 911352d5dab64576b7a6da51aa69d76d operates in segment 1, server 1450637 in segment 2, server 4985152 in segment 3, and server 9736887 in segment 4. This relationship enforces network isolation and ensures that server traffic is routed through the correct policy boundary.

**View `vw_dji_server_network_segment`**

```sql
CREATE VIEW vw_dji_server_network_segment AS
SELECT a.server_id, a.ip_address, a.last_communication_time, a.response_latency_ms, b.network_segment_id AS segment_network_segment_id, b.segment_id AS segment_segment_id, b.security_level AS segment_security_level
FROM dji_servers a JOIN network_segments b ON a.network_segment_id = b.network_segment_id;
```

| server_id | ip_address | last_communication_time | response_latency_ms | segment_network_segment_id | segment_segment_id | segment_security_level |
|---|---|---|---|---|---|---|
| 911352d5dab64576b7a6da51aa69d76d | extended-ip-15 | 2022-01-19T00:00:00 | 43 | 1 | 422a03c4-8fcc-11eb-924d-9cd76263cbd0 | public |
| 1450637 | integrated-ip-16 | 2023-06-03T07:17:00 | 53 | 2 | 32825 | internal |
| 4985152 | seasonal-ip-17 | 2024-11-14T14:34:00 | 63 | 3 | 974920 | classified |
| 9736887 | regional-ip-18 | 2025-04-25T21:51:00 | 73 | 4 | 2933482 | public |

The view vw_encryption_key_dji_server provides the reverse linkage from encryption key to DJI server. Key 2087751 belongs to server 911352d5dab64576b7a6da51aa69d76d, key 2618562 to server 1450637, key 8843769 to server 4985152, and key 065525fa-8fb2-11eb-924d-9cd76263cbd0 to server 9736887. This perspective is valuable when auditing key rotation or identifying which server uses a particular cryptographic identity.

**View `vw_encryption_key_dji_server`**

```sql
CREATE VIEW vw_encryption_key_dji_server AS
SELECT a.key_id, a.algorithm_type, a.key_length_bits, a.expiration_date, b.server_id AS server_server_id, b.ip_address AS server_ip_address, b.last_communication_time AS server_last_communication_time
FROM encryption_keys a JOIN dji_servers b ON a.server_id = b.server_id;
```

| key_id | algorithm_type | key_length_bits | expiration_date | server_server_id | server_ip_address | server_last_communication_time |
|---|---|---|---|---|---|---|
| 2087751 | primary-algorith-10 | 17 | 2025-08-18 | 911352d5dab64576b7a6da51aa69d76d | extended-ip-15 | 2022-01-19T00:00:00 |
| 2618562 | adaptive-algorith-11 | 28 | 2022-01-02 | 1450637 | integrated-ip-16 | 2023-06-03T07:17:00 |
| 8843769 | distributed-algorith-12 | 39 | 2023-06-13 | 4985152 | seasonal-ip-17 | 2024-11-14T14:34:00 |
| 065525fa-8fb2-11eb-924d-9cd76263cbd0 | baseline-algorith-13 | 50 | 2024-11-24 | 9736887 | regional-ip-18 | 2025-04-25T21:51:00 |

The view vw_encryption_key_dongle_module links encryption keys to their associated dongle modules. Key 2087751 is used by dongle module 100, key 2618562 by module 101, key 8843769 by module 102, and key 065525fa-8fb2-11eb-924d-9cd76263cbd0 by module 103. This join confirms the cryptographic chain from hardware module through server to key, ensuring end-to-end encryption coverage.

**View `vw_encryption_key_dongle_module`**

```sql
CREATE VIEW vw_encryption_key_dongle_module AS
SELECT a.key_id, a.algorithm_type, a.key_length_bits, a.expiration_date, b.id AS module_id, b.dongle_id AS module_dongle_id, b.firmware_hash AS module_firmware_hash
FROM encryption_keys a JOIN dongle_modules b ON a.dongle_module_id = b.id;
```

| key_id | algorithm_type | key_length_bits | expiration_date | module_id | module_dongle_id | module_firmware_hash |
|---|---|---|---|---|---|---|
| 2087751 | primary-algorith-10 | 17 | 2025-08-18 | 100 | 8843746 | adaptive-firmware-53 |
| 2618562 | adaptive-algorith-11 | 28 | 2022-01-02 | 101 | 4277021 | distributed-firmware-54 |
| 8843769 | distributed-algorith-12 | 39 | 2023-06-13 | 102 | 1996912 | baseline-firmware-55 |
| 065525fa-8fb2-11eb-924d-9cd76263cbd0 | baseline-algorith-13 | 50 | 2024-11-24 | 103 | 4060638 | pilot-firmware-56 |

The view vw_encryption_key_data_package connects encryption keys to the data packages they protect. Key 2087751 secures package 9424918, key 2618562 secures package account_pymes_1044, key 8843769 secures package 5844275, and key 065525fa-8fb2-11eb-924d-9cd76263cbd0 secures package 2106710. This relationship is critical for verifying that every transmitted payload was encrypted with the correct key and can be traced to its cryptographic origin.

**View `vw_encryption_key_data_package`**

```sql
CREATE VIEW vw_encryption_key_data_package AS
SELECT a.key_id, a.algorithm_type, a.key_length_bits, a.expiration_date, b.id AS package_id, b.package_id AS package_package_id, b.timestamp AS package_timestamp
FROM encryption_keys a JOIN data_packages b ON a.data_package_id = b.id;
```

| key_id | algorithm_type | key_length_bits | expiration_date | package_id | package_package_id | package_timestamp |
|---|---|---|---|---|---|---|
| 2087751 | primary-algorith-10 | 17 | 2025-08-18 | 1 | 9424918 | 2024-07-08T18:18:00 |
| 2618562 | adaptive-algorith-11 | 28 | 2022-01-02 | 2 | account_pymes_1044 | 2025-12-19T01:35:00 |
| 8843769 | distributed-algorith-12 | 39 | 2023-06-13 | 3 | 5844275 | 2022-05-03T08:52:00 |
| 065525fa-8fb2-11eb-924d-9cd76263cbd0 | baseline-algorith-13 | 50 | 2024-11-24 | 4 | 2106710 | 2023-10-14T15:09:00 |

The view vw_network_segment_aero_scope_system maps network segments back to their assigned aero scope systems. Segment 1 hosts system 1000, segment 2 hosts system 1001, segment 3 hosts system 1002, and segment 4 hosts system 1003. This view supports network-centric queries, such as identifying all scope systems operating within a given network boundary.

**View `vw_network_segment_aero_scope_system`**

```sql
CREATE VIEW vw_network_segment_aero_scope_system AS
SELECT a.network_segment_id, a.segment_id, a.security_level, a.firewall_enabled, b.id AS system_id, b.system_id AS system_system_id, b.firmware_version AS system_firmware_version
FROM network_segments a JOIN aero_scope_systems b ON a.aero_scope_system_id = b.id;
```

| network_segment_id | segment_id | security_level | firewall_enabled | system_id | system_system_id | system_firmware_version |
|---|---|---|---|---|---|---|
| 1 | 422a03c4-8fcc-11eb-924d-9cd76263cbd0 | public | false | 1000 | 8189503 | distributed-firmware-48 |
| 2 | 32825 | internal | true | 1001 | 3717623 | baseline-firmware-49 |
| 3 | 974920 | classified | false | 1002 | 7441161 | pilot-firmware-50 |
| 4 | 2933482 | public | true | 1003 | 605963 | extended-firmware-51 |

The view vw_network_segment_dji_server links network segments to their DJI servers. Segment 1 contains server 911352d5dab64576b7a6da51aa69d76d, segment 2 contains server 1450637, segment 3 contains server 4985152, and segment 4 contains server 9736887. This join ensures that each network segment has a dedicated server endpoint for managing communications.

**View `vw_network_segment_dji_server`**

```sql
CREATE VIEW vw_network_segment_dji_server AS
SELECT a.network_segment_id, a.segment_id, a.security_level, a.firewall_enabled, b.server_id AS server_server_id, b.ip_address AS server_ip_address, b.last_communication_time AS server_last_communication_time
FROM network_segments a JOIN dji_servers b ON a.server_id = b.server_id;
```

| network_segment_id | segment_id | security_level | firewall_enabled | server_server_id | server_ip_address | server_last_communication_time |
|---|---|---|---|---|---|---|
| 1 | 422a03c4-8fcc-11eb-924d-9cd76263cbd0 | public | false | 911352d5dab64576b7a6da51aa69d76d | extended-ip-15 | 2022-01-19T00:00:00 |
| 2 | 32825 | internal | true | 1450637 | integrated-ip-16 | 2023-06-03T07:17:00 |
| 3 | 974920 | classified | false | 4985152 | seasonal-ip-17 | 2024-11-14T14:34:00 |
| 4 | 2933482 | public | true | 9736887 | regional-ip-18 | 2025-04-25T21:51:00 |

The view vw_network_segment_security_policy connects network segments to the security policies that govern them. Each segment is bound to a specific policy, ensuring that traffic isolation is accompanied by enforceable rules for data handling and access control.

**View `vw_network_segment_security_policy`**

```sql
CREATE VIEW vw_network_segment_security_policy AS
SELECT a.network_segment_id, a.segment_id, a.security_level, a.firewall_enabled, b.id AS policy_id, b.policy_id AS policy_policy_id, b.policy_name AS policy_policy_name
FROM network_segments a JOIN security_policies b ON a.security_policy_id = b.id;
```

| network_segment_id | segment_id | security_level | firewall_enabled | policy_id | policy_policy_id | policy_policy_name |
|---|---|---|---|---|---|---|
| 1 | 422a03c4-8fcc-11eb-924d-9cd76263cbd0 | public | false | 1 | 5844252 | Regional Series |
| 2 | 32825 | internal | true | 2 | 10207142 | Seasonal Assessment D |
| 3 | 974920 | classified | false | 3 | 1562847 | Integrated Survey |
| 4 | 2933482 | public | true | 4 | ChIJkzsYUIBt5kcRM6_JHx26ONk | Extended Corridor |

The view vw_security_policy_network_segment provides the reverse linkage from security policy to network segment. Each policy is associated with exactly one segment, confirming the one-to-one binding between regulatory rules and the network zone they protect.

**View `vw_security_policy_network_segment`**

```sql
CREATE VIEW vw_security_policy_network_segment AS
SELECT a.id, a.policy_id, a.policy_name, a.effective_date, b.network_segment_id AS segment_network_segment_id, b.segment_id AS segment_segment_id, b.security_level AS segment_security_level
FROM security_policies a JOIN network_segments b ON a.network_segment_id = b.network_segment_id;
```

| id | policy_id | policy_name | effective_date | segment_network_segment_id | segment_segment_id | segment_security_level |
|---|---|---|---|---|---|---|
| 1 | 5844252 | Regional Series | 2023-02-14 | 1 | 422a03c4-8fcc-11eb-924d-9cd76263cbd0 | public |
| 2 | 10207142 | Seasonal Assessment D | 2024-07-25 | 2 | 32825 | internal |
| 3 | 1562847 | Integrated Survey | 2025-12-09 | 3 | 974920 | classified |
| 4 | ChIJkzsYUIBt5kcRM6_JHx26ONk | Extended Corridor | 2022-05-20 | 4 | 2933482 | public |

The view vw_security_policy_security_audit links security policies to the audits that evaluate compliance against them. Each audit references its governing policy, enabling operators to trace audit findings back to the specific rules that were tested.

**View `vw_security_policy_security_audit`**

```sql
CREATE VIEW vw_security_policy_security_audit AS
SELECT a.id, a.policy_id, a.policy_name, a.effective_date, b.audit_id AS audit_audit_id, b.audit_date AS audit_audit_date, b.auditor_name AS audit_auditor_name
FROM security_policies a JOIN security_audits b ON a.audit_id = b.audit_id;
```

| id | policy_id | policy_name | effective_date | audit_audit_id | audit_audit_date | audit_auditor_name |
|---|---|---|---|---|---|---|
| 1 | 5844252 | Regional Series | 2023-02-14 | bjackman | 2025-12-04T23:33:00 | Compact Initiative |
| 2 | 10207142 | Seasonal Assessment D | 2024-07-25 | 69430 | 2022-05-15T06:50:00 | Legacy Model |
| 3 | 1562847 | Integrated Survey | 2025-12-09 | 10238266 | 2023-10-26T13:07:00 | Regional Cluster A |
| 4 | ChIJkzsYUIBt5kcRM6_JHx26ONk | Extended Corridor | 2022-05-20 | 6969437 | 2024-03-10T20:24:00 | Seasonal Review |

The view vw_security_audit_network_segment connects security audits to the network segments they evaluate. An audit on segment 1 assesses the compliance of system 1000's network environment, while an audit on segment 4 assesses system 1003's environment. This join is essential for identifying which network zones have passed or failed their compliance evaluations.

**View `vw_security_audit_network_segment`**

```sql
CREATE VIEW vw_security_audit_network_segment AS
SELECT a.audit_id, a.audit_date, a.auditor_name, a.findings_count, b.network_segment_id AS segment_network_segment_id, b.segment_id AS segment_segment_id, b.security_level AS segment_security_level
FROM security_audits a JOIN network_segments b ON a.network_segment_id = b.network_segment_id;
```

| audit_id | audit_date | auditor_name | findings_count | segment_network_segment_id | segment_segment_id | segment_security_level |
|---|---|---|---|---|---|---|
| bjackman | 2025-12-04T23:33:00 | Compact Initiative | 2 | 1 | 422a03c4-8fcc-11eb-924d-9cd76263cbd0 | public |
| 69430 | 2022-05-15T06:50:00 | Legacy Model | 33 | 2 | 32825 | internal |
| 10238266 | 2023-10-26T13:07:00 | Regional Cluster A | 23 | 3 | 974920 | classified |
| 6969437 | 2024-03-10T20:24:00 | Seasonal Review | 0 | 4 | 2933482 | public |

The view vw_security_audit_security_policy provides the reverse linkage from security audit to its governing policy. Each audit is tied to a specific policy, ensuring that compliance results can be attributed to the correct regulatory framework.

**View `vw_security_audit_security_policy`**

```sql
CREATE VIEW vw_security_audit_security_policy AS
SELECT a.audit_id, a.audit_date, a.auditor_name, a.findings_count, b.id AS policy_id, b.policy_id AS policy_policy_id, b.policy_name AS policy_policy_name
FROM security_audits a JOIN security_policies b ON a.security_policy_id = b.id;
```

| audit_id | audit_date | auditor_name | findings_count | policy_id | policy_policy_id | policy_policy_name |
|---|---|---|---|---|---|---|
| bjackman | 2025-12-04T23:33:00 | Compact Initiative | 2 | 1 | 5844252 | Regional Series |
| 69430 | 2022-05-15T06:50:00 | Legacy Model | 33 | 2 | 10207142 | Seasonal Assessment D |
| 10238266 | 2023-10-26T13:07:00 | Regional Cluster A | 23 | 3 | 1562847 | Integrated Survey |
| 6969437 | 2024-03-10T20:24:00 | Seasonal Review | 0 | 4 | ChIJkzsYUIBt5kcRM6_JHx26ONk | Extended Corridor |

The view vw_security_audit_vulnerability_report connects security audits to the vulnerability reports they generate. When an audit fails, it produces a vulnerability report that documents the identified weaknesses. Audit results on segment 2, which have failed, are directly linked to vulnerability reports that trigger remediation workflows.

**View `vw_security_audit_vulnerability_report`**

```sql
CREATE VIEW vw_security_audit_vulnerability_report AS
SELECT a.audit_id, a.audit_date, a.auditor_name, a.findings_count, b.vulnerability_report_id AS report_vulnerability_report_id, b.report_id AS report_report_id, b.vulnerability_type AS report_vulnerability_type
FROM security_audits a JOIN vulnerability_reports b ON a.vulnerability_report_id = b.vulnerability_report_id;
```

| audit_id | audit_date | auditor_name | findings_count | report_vulnerability_report_id | report_report_id | report_vulnerability_type |
|---|---|---|---|---|---|---|
| bjackman | 2025-12-04T23:33:00 | Compact Initiative | 2 | 1 | 1202-0008-S | regional-vulnerab-36 |
| 69430 | 2022-05-15T06:50:00 | Legacy Model | 33 | 2 | 8189500 | legacy-vulnerab-37 |
| 10238266 | 2023-10-26T13:07:00 | Regional Cluster A | 23 | 3 | L355 | compact-vulnerab-38 |
| 6969437 | 2024-03-10T20:24:00 | Seasonal Review | 0 | 4 | 5844272 | composite-vulnerab-39 |

The view vw_vulnerability_report_security_audit provides the reverse linkage from vulnerability report to its originating security audit. Each report traces back to the audit that identified the weakness, enabling operators to understand the context and scope of each finding.

**View `vw_vulnerability_report_security_audit`**

```sql
CREATE VIEW vw_vulnerability_report_security_audit AS
SELECT a.vulnerability_report_id, a.report_id, a.vulnerability_type, a.severity_score, b.audit_id AS audit_audit_id, b.audit_date AS audit_audit_date, b.auditor_name AS audit_auditor_name
FROM vulnerability_reports a JOIN security_audits b ON a.audit_id = b.audit_id;
```

| vulnerability_report_id | report_id | vulnerability_type | severity_score | audit_audit_id | audit_audit_date | audit_auditor_name |
|---|---|---|---|---|---|---|
| 1 | 1202-0008-S | regional-vulnerab-36 | 8.45 | bjackman | 2025-12-04T23:33:00 | Compact Initiative |
| 2 | 8189500 | legacy-vulnerab-37 | 12.90 | 69430 | 2022-05-15T06:50:00 | Legacy Model |
| 3 | L355 | compact-vulnerab-38 | 17.35 | 10238266 | 2023-10-26T13:07:00 | Regional Cluster A |
| 4 | 5844272 | composite-vulnerab-39 | 21.80 | 6969437 | 2024-03-10T20:24:00 | Seasonal Review |

The view vw_vulnerability_report_network_segment links vulnerability reports to the network segments they affect. Reports generated from audits on segment 2 pertain to the infrastructure within that segment, including server 1450637 and its associated dongle module 101. This join ensures that vulnerability remediation is targeted at the correct network zone.

**View `vw_vulnerability_report_network_segment`**

```sql
CREATE VIEW vw_vulnerability_report_network_segment AS
SELECT a.vulnerability_report_id, a.report_id, a.vulnerability_type, a.severity_score, b.network_segment_id AS segment_network_segment_id, b.segment_id AS segment_segment_id, b.security_level AS segment_security_level
FROM vulnerability_reports a JOIN network_segments b ON a.network_segment_id = b.network_segment_id;
```

| vulnerability_report_id | report_id | vulnerability_type | severity_score | segment_network_segment_id | segment_segment_id | segment_security_level |
|---|---|---|---|---|---|---|
| 1 | 1202-0008-S | regional-vulnerab-36 | 8.45 | 1 | 422a03c4-8fcc-11eb-924d-9cd76263cbd0 | public |
| 2 | 8189500 | legacy-vulnerab-37 | 12.90 | 2 | 32825 | internal |
| 3 | L355 | compact-vulnerab-38 | 17.35 | 3 | 974920 | classified |
| 4 | 5844272 | composite-vulnerab-39 | 21.80 | 4 | 2933482 | public |

The view vw_vulnerability_report_security_policy connects vulnerability reports to the security policies they violate. Each report references the policy whose requirements were not met, enabling compliance teams to prioritise remediation based on the severity of the policy breach.

**View `vw_vulnerability_report_security_policy`**

```sql
CREATE VIEW vw_vulnerability_report_security_policy AS
SELECT a.vulnerability_report_id, a.report_id, a.vulnerability_type, a.severity_score, b.id AS policy_id, b.policy_id AS policy_policy_id, b.policy_name AS policy_policy_name
FROM vulnerability_reports a JOIN security_policies b ON a.security_policy_id = b.id;
```

| vulnerability_report_id | report_id | vulnerability_type | severity_score | policy_id | policy_policy_id | policy_policy_name |
|---|---|---|---|---|---|---|
| 1 | 1202-0008-S | regional-vulnerab-36 | 8.45 | 1 | 5844252 | Regional Series |
| 2 | 8189500 | legacy-vulnerab-37 | 12.90 | 2 | 10207142 | Seasonal Assessment D |
| 3 | L355 | compact-vulnerab-38 | 17.35 | 3 | 1562847 | Integrated Survey |
| 4 | 5844272 | composite-vulnerab-39 | 21.80 | 4 | ChIJkzsYUIBt5kcRM6_JHx26ONk | Extended Corridor |

### Synthesis

The aerial surveillance ecosystem is a tightly coupled network of detection systems, airborne assets, cryptographic infrastructure, and security governance. Aero scope systems serve as the central organisational unit, binding together dongle modules, drones, data packages, flight path points, DJI servers, encryption keys, and network segments into accountable operational groups. The joined views provide the analytical pathways needed to trace any entity back to its parent system and forward to its downstream dependencies. Operators can verify that every drone is encrypted, every data package has a corresponding flight path, every server has passed its audit, and every network segment is governed by an active security policy. The vulnerability management loop—audits producing reports that reference policies and segments—closes the compliance cycle, ensuring that weaknesses identified in the infrastructure are systematically tracked and remediated. Together, these records form a complete operational picture of the surveillance domain, from the physical drone on the runway to the cryptographic key securing its data in transit.