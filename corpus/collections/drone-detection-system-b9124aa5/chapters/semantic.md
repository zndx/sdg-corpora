## Domain Ontology and Relational Materialization

The drone detection ecosystem is a multi-layered surveillance architecture in which physical detection hardware, firmware upgrade infrastructure, airborne drone entities, and regulated airspace zones interact through a network of manufacturer servers. Each detection system—identified by a human-readable code such as `SYS-2050` or `SYS-2053`—is deployed at a fixed location, operates within a defined effective range, and is maintained by a manufacturer server that pushes firmware upgrade modules. Drones flying within the detection range emit signals that are captured, timestamped, and correlated against the airspace zones they traverse. The relational schema materializes this ontology through six core entity tables, nine junction tables that resolve many-to-many associations, and fourteen denormalized views that reconstruct domain facts for reporting.

**Table `drone_detection_systems`**

| id | system_identifier | manufacturer | model_number | deployment_status | effective_range_meters | last_firmware_version | module_serial_number |
|---|---|---|---|---|---|---|---|
| 100 | SYS-2050 | Standard Chartered | MOD-2238 | active | 10.45 | regional-last-36 | e604b688-8fd1-11eb-924d-9cd76263cbd0 |
| 101 | SYS-2051 | General Motors | MOD-2244 | discontinued | 14.90 | legacy-last-37 | 8189475 |
| 102 | SYS-2052 | Column Name cannot be empty | MOD-2250 | deprecated | 19.35 | compact-last-38 | 5082969 |
| 103 | SYS-2053 | Financial Information Service Co. Ltd. | MOD-2256 | active | 23.80 | composite-last-39 | 1562833 |

The `drone_detection_systems` table anchors the ontology. Each row represents a physical detection installation. The surrogate primary key `id` (values 100–103) is opaque to domain users, who instead reference the `system_identifier` column—`SYS-2050`, `SYS-2051`, and so on. The `manufacturer` column records the vendor (e.g., `Standard Chartered`, `General Motors`, `Financial Information Service Co. Ltd.`), while `model_number` (e.g., `MOD-2238`) identifies the hardware variant. The `deployment_status` column constrains the system lifecycle to one of three states: `active`, `discontinued`, or `deprecated`. The `effective_range_meters` column stores a floating-point radius—10.45, 14.90, 19.35, 23.80—defining the circular detection footprint. The `last_firmware_version` column (e.g., `regional-last-36`) tracks the most recent firmware applied, and `module_serial_number` is a foreign key into `upgrade_modules`, establishing a one-to-one link between a detection system and its current upgrade module.

**Table `upgrade_modules`**

| module_serial_number | firmware_version | encryption_standard | authentication_status | session_key | compatibility_status | drone_detection_system_id | manufacturer_server_id |
|---|---|---|---|---|---|---|---|
| e604b688-8fd1-11eb-924d-9cd76263cbd0 | distributed-firmware-48 | pilot-encrypti-26 | pending | SES-2026 | compatible | 100 | 1 |
| 8189475 | baseline-firmware-49 | extended-encrypti-27 | authenticated | SES-2031 | incompatible | 101 | 2 |
| 5082969 | pilot-firmware-50 | integrated-encrypti-28 | failed | SES-2036 | unknown | 102 | 3 |
| 1562833 | extended-firmware-51 | seasonal-encrypti-29 | pending | SES-2041 | compatible | 103 | 4 |

The `upgrade_modules` table stores firmware packages. Its primary key `module_serial_number` is a UUID or integer (e.g., `e604b688-8fd1-11eb-924d-9cd76263cbd0`, `8189475`). The `firmware_version` column (e.g., `distributed-firmware-48`, `baseline-firmware-49`) names the release. The `encryption_standard` column (e.g., `pilot-encrypti-26`, `extended-encrypti-27`) specifies the cryptographic algorithm. The `authentication_status` column constrains to `pending`, `authenticated`, or `failed`. The `session_key` column (e.g., `SES-2026`) holds the active session token. The `compatibility_status` column (values `compatible`, `incompatible`, `unknown`) indicates whether the module is verified for the target system. Two foreign keys, `drone_detection_system_id` and `manufacturer_server_id`, link the module to its host detection system and the manufacturer server that distributes it, respectively.

**Table `drone_signals`**

| id | signal_id | drone_serial_number | flight_status | pilot_location | encryption_status | timestamp | drone_id | module_serial_number | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 317 | 10238261 | idle | adaptive-pilot-83 | encrypted | 2024-07-08T18:18:00 | 1 | e604b688-8fd1-11eb-924d-9cd76263cbd0 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | 6564371 | 15213461 | flying | distributed-pilot-84 | unencrypted | 2025-12-19T01:35:00 | 2 | 8189475 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | 4463669 | BjoernKW | landing | baseline-pilot-85 | unknown | 2022-05-03T08:52:00 | 3 | 5082969 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | 6969425 | 611502 | unknown | pilot-pilot-86 | encrypted | 2023-10-14T15:09:00 | 4 | 1562833 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The `drone_signals` table captures each signal event emitted by a drone within a detection range. Its surrogate key `id` (1–4) is opaque. The `signal_id` column (e.g., `317`, `6564371`) is a domain-level signal identifier. The `drone_serial_number` column (e.g., `10238261`, `BjoernKW`, `611502`) identifies the airborne device. The `flight_status` column constrains to `idle`, `flying`, `landing`, or `unknown`. The `pilot_location` column (e.g., `adaptive-pilot-83`, `distributed-pilot-84`) records the operator's position label. The `encryption_status` column (values `encrypted`, `unencrypted`, `unknown`) indicates signal security. The `timestamp` column (e.g., `2024-07-08T18:18:00`) records the signal capture time. The `created_at` and `updated_at` columns track audit timestamps. Two foreign keys, `drone_id` and `module_serial_number`, link the signal to its originating drone and the upgrade module active on the detecting system at capture time.

**Table `manufacturer_servers`**

| manufacturer_server_id | server_id | server_location | access_level | last_maintenance_date | security_audit_status |
|---|---|---|---|---|---|
| 1 | 911352d5dab64576b7a6da51aa69d76d | extended-server-99 | public | 2024-03-27 | passed |
| 2 | 1450637 | integrated-server-100 | restricted | 2025-08-11 | failed |
| 3 | 4985152 | seasonal-server-101 | government | 2022-01-22 | pending |
| 4 | 9736887 | regional-server-102 | public | 2023-06-06 | passed |

The `manufacturer_servers` table models the infrastructure that distributes firmware. The surrogate key `manufacturer_server_id` (1–4) is internal. The `server_id` column (e.g., `911352d5dab64576b7a6da51aa69d76d`) is a UUID identifying the server instance. The `server_location` column (e.g., `extended-server-99`, `integrated-server-100`) names the deployment site. The `access_level` column constrains to `public`, `restricted`, or `government`. The `last_maintenance_date` column (e.g., `2024-03-27`) records the most recent maintenance event. The `security_audit_status` column (values `passed`, `failed`, `pending`) tracks compliance.

**Table `airspace_zones`**

| zone_id | zone_type | altitude_limit_meters | radius_meters | enforcement_level | created_at | updated_at |
|---|---|---|---|---|---|---|
| 937724 | no-fly | 10.45 | 9.20 | advisory | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 99504 | restricted | 13.90 | 11.40 | mandatory | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 10207142 | controlled | 17.35 | 13.60 | prohibited | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 | public | 20.80 | 15.80 | advisory | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The `airspace_zones` table defines regulated airspace regions. The surrogate key `zone_id` (e.g., `937724`, `99504`, `10207142`, `f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3`) is internal. The `zone_type` column constrains to `no-fly`, `restricted`, `controlled`, or `public`. The `altitude_limit_meters` column (e.g., `10.45`, `13.90`, `17.35`, `20.80`) sets the vertical boundary. The `radius_meters` column (e.g., `9.20`, `11.40`, `13.60`, `15.80`) sets the horizontal boundary. The `enforcement_level` column (values `advisory`, `mandatory`, `prohibited`) defines the regulatory strictness. The `created_at` and `updated_at` columns track the zone's lifecycle.

**Table `drones`**

| id | drone_id | manufacturer | model | serial_number | operational_status |
|---|---|---|---|---|---|
| 1 | 1437577 | Standard Chartered | composite-model-81 | 5844275 | active |
| 2 | 5917277 | General Motors | primary-model-82 | 69422 | inactive |
| 3 | 5917276 | Column Name cannot be empty | adaptive-model-83 | 7731874 | decommissioned |
| 4 | 3990167 | Financial Information Service Co. Ltd. | distributed-model-84 | 10445632 | active |

The `drones` table models airborne entities. The surrogate key `id` (1–4) is internal. The `drone_id` column (e.g., `1437577`, `5917277`) is a domain-level identifier. The `manufacturer` column (e.g., `Standard Chartered`, `General Motors`) records the drone vendor. The `model` column (e.g., `composite-model-81`, `primary-model-82`) identifies the hardware variant. The `serial_number` column (e.g., `5844275`, `69422`) is the device serial. The `operational_status` column constrains to `active`, `inactive`, or `decommissioned`.

The six entity tables above are the foundation. The remaining nine tables are junction tables that resolve many-to-many relationships between entities.

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

The `systems_signals` junction table links detection systems to the signals they capture. Each row pairs a `system_id` with a `signal_id`, establishing that a particular detection system recorded a particular signal event. This table materializes the many-to-many relationship between `drone_detection_systems` and `drone_signals`.

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

The `systems_zones` junction table links detection systems to the airspace zones they monitor. Each row pairs a `system_id` with a `zone_id`, indicating that a detection system's effective range overlaps a specific airspace zone. This table materializes the many-to-many relationship between `drone_detection_systems` and `airspace_zones`.

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

The `signals_systems` junction table is the inverse of `systems_signals`, linking signals back to the systems that captured them. Each row pairs a `signal_id` with a `system_id`. This redundancy supports bidirectional navigation in reporting queries.

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

The `servers_modules` junction table links manufacturer servers to the upgrade modules they distribute. Each row pairs a `server_id` with a `module_serial_number`, establishing that a manufacturer server is the source of a particular firmware package. This table materializes the many-to-many relationship between `manufacturer_servers` and `upgrade_modules`.

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

The `servers_systems` junction table links manufacturer servers to the detection systems they service. Each row pairs a `server_id` with a `system_id`, indicating that a manufacturer server is responsible for maintaining a particular detection system. This table materializes the many-to-many relationship between `manufacturer_servers` and `drone_detection_systems`.

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

The `zones_systems` junction table is the inverse of `systems_zones`, linking airspace zones back to the detection systems that monitor them. Each row pairs a `zone_id` with a `system_id`. This redundancy supports bidirectional navigation in reporting queries.

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

The `zones_drones` junction table links airspace zones to the drones that operate within them. Each row pairs a `zone_id` with a `drone_id`, indicating that a drone has been detected or is known to operate in a specific airspace zone. This table materializes the many-to-many relationship between `airspace_zones` and `drones`.

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

The `drones_signals` junction table links drones to the signals they emit. Each row pairs a `drone_id` with a `signal_id`, establishing that a particular drone generated a particular signal event. This table materializes the many-to-many relationship between `drones` and `drone_signals`.

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

The `drones_zones` junction table is the inverse of `zones_drones`, linking drones back to the airspace zones they traverse. Each row pairs a `drone_id` with a `zone_id`. This redundancy supports bidirectional navigation in reporting queries.

The junction tables above normalize the schema by eliminating repeating groups and enforcing referential integrity. The views below denormalize selected combinations of these tables into flat, query-ready structures that reconstruct domain facts.

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

This view joins `drone_detection_systems` to `upgrade_modules` on the `module_serial_number` foreign key, producing one row per detection system with its current firmware details. It answers the question: "What upgrade module is each detection system running?" For example, the row for `SYS-2050` shows that the `Standard Chartered` system with effective range 10.45 meters is running firmware `distributed-firmware-48` with encryption standard `pilot-encrypti-26` and authentication status `pending`. The row for `SYS-2051` shows a `General Motors` system running `baseline-firmware-49` with `extended-encrypti-27` and authentication status `authenticated`.

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

This view joins `drone_detection_systems` to `drone_signals` through the `module_serial_number` linkage, producing one row per signal event enriched with the detecting system's identity. It answers: "Which detection system captured each drone signal, and under what firmware conditions?" For instance, signal `317` from drone serial `10238261` (flight status `idle`, pilot location `adaptive-pilot-83`) was captured by system `SYS-2050` running firmware `distributed-firmware-48`. Signal `6564371` from drone serial `15213461` (flight status `flying`, pilot location `distributed-pilot-84`) was captured by system `SYS-2051` running firmware `baseline-firmware-49`.

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

This view joins `drone_detection_systems` to `airspace_zones` through the `systems_zones` junction table, producing one row per system-zone overlap. It answers: "Which airspace zones does each detection system monitor?" For example, system `SYS-2050` (effective range 10.45 meters) overlaps with the `no-fly` zone `937724` (altitude limit 10.45 meters, radius 9.20 meters, enforcement level `advisory`). System `SYS-2051` (effective range 14.90 meters) overlaps with the `restricted` zone `99504` (altitude limit 13.90 meters, radius 11.40 meters, enforcement level `mandatory`).

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

This view is the inverse of `vw_drone_detection_system_upgrade_module`, joining `upgrade_modules` to `drone_detection_systems` to answer: "Which detection system is each upgrade module assigned to?" For example, the module `e604b688-8fd1-11eb-924d-9cd76263cbd0` (firmware `distributed-firmware-48`, encryption `pilot-encrypti-26`, session key `SES-2026`, compatibility `compatible`) is assigned to system `SYS-2050` manufactured by `Standard Chartered`. The module `8189475` (firmware `baseline-firmware-49`, encryption `extended-encrypti-27`, session key `SES-2031`, compatibility `incompatible`) is assigned to system `SYS-2051` manufactured by `General Motors`.

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

This view joins `upgrade_modules` to `manufacturer_servers` on `manufacturer_server_id`, answering: "Which manufacturer server distributes each upgrade module?" For example, module `e604b688-8fd1-11eb-924d-9cd76263cbd0` is distributed by server `911352d5dab64576b7a6da51aa69d76d` (`extended-server-99`, access level `public`, last maintenance `2024-03-27`, audit status `passed`). Module `8189475` is distributed by server `1450637` (`integrated-server-100`, access level `restricted`, last maintenance `2025-08-11`, audit status `failed`).

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

This view joins `drone_signals` to `drone_detection_systems` through the `module_serial_number` foreign key, answering: "For each signal event, what is the identity and configuration of the detecting system?" For example, signal `317` (drone serial `10238261`, flight status `idle`, encryption `encrypted`, timestamp `2024-07-08T18:18:00`) was detected by system `SYS-2050` (`Standard Chartered`, model `MOD-2238`, deployment status `active`, effective range 10.45 meters). Signal `4463669` (drone serial `BjoernKW`, flight status `landing`, encryption `unknown`, timestamp `2022-05-03T08:52:00`) was detected by system `SYS-2052` (`Column Name cannot be empty`, model `MOD-2250`, deployment status `deprecated`, effective range 19.35 meters).

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

This view joins `drone_signals` to `drones` on `drone_id`, answering: "For each signal event, what are the identity and operational status of the originating drone?" For example, signal `317` was emitted by drone `1437577` (manufacturer `Standard Chartered`, model `composite-model-81`, serial `5844275`, operational status `active`). Signal `4463669` was emitted by drone `5917276` (manufacturer `Column Name cannot be empty`, model `adaptive-model-83`, serial `7731874`, operational status `decommissioned`).

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

This view joins `drone_signals` to `upgrade_modules` on `module_serial_number`, answering: "Which upgrade module was active on the detecting system when each signal was captured?" For example, signal `317` was captured while module `e604b688-8fd1-11eb-924d-9cd76263cbd0` (firmware `distributed-firmware-48`, encryption `pilot-encrypti-26`, authentication `pending`, session key `SES-2026`, compatibility `compatible`) was active. Signal `6564371` was captured while module `8189475` (firmware `baseline-firmware-49`, encryption `extended-encrypti-27`, authentication `authenticated`, session key `SES-2031`, compatibility `incompatible`) was active.

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

This view joins `manufacturer_servers` to `upgrade_modules` on `manufacturer_server_id`, answering: "Which upgrade modules does each manufacturer server distribute, and what are their configurations?" For example, server `911352d5dab64576b7a6da51aa69d76d` (`extended-server-99`, access level `public`, audit status `passed`) distributes module `e604b688-8fd1-11eb-924d-9cd76263cbd0` (firmware `distributed-firmware-48`, encryption `pilot-encrypti-26`, authentication `pending`, compatibility `compatible`). Server `1450637` (`integrated-server-100`, access level `restricted`, audit status `failed`) distributes module `8189475` (firmware `baseline-firmware-49`, encryption `extended-encrypti-27`, authentication `authenticated`, compatibility `incompatible`).

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

This view joins `manufacturer_servers` to `drone_detection_systems` through the `servers_systems` junction table, answering: "Which detection systems does each manufacturer server service?" For example, server `911352d5dab64576b7a6da51aa69d76d` (`extended-server-99`, access level `public`) services system `SYS-2050` (`Standard Chartered`, model `MOD-2238`, deployment status `active`, effective range 10.45 meters). Server `1450637` (`integrated-server-100`, access level `restricted`) services system `SYS-2051` (`General Motors`, model `MOD-2244`, deployment status `discontinued`, effective range 14.90 meters).

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

This view joins `airspace_zones` to `drone_detection_systems` through the `zones_systems` junction table, answering: "Which detection systems monitor each airspace zone?" For example, zone `937724` (`no-fly`, altitude limit 10.45 meters, radius 9.20 meters, enforcement level `advisory`) is monitored by system `SYS-2050` (`Standard Chartered`, model `MOD-2238`, deployment status `active`, effective range 10.45 meters). Zone `99504` (`restricted`, altitude limit 13.90 meters, radius 11.40 meters, enforcement level `mandatory`) is monitored by system `SYS-2051` (`General Motors`, model `MOD-2244`, deployment status `discontinued`, effective range 14.90 meters).

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

This view joins `airspace_zones` to `drones` through the `zones_drones` junction table, answering: "Which drones operate within each airspace zone?" For example, zone `937724` (`no-fly`, altitude limit 10.45 meters, radius 9.20 meters, enforcement level `advisory`) contains drone `1437577` (manufacturer `Standard Chartered`, model `composite-model-81`, serial `5844275`, operational status `active`). Zone `99504` (`restricted`, altitude limit 13.90 meters, radius 11.40 meters, enforcement level `mandatory`) contains drone `5917277` (manufacturer `General Motors`, model `primary-model-82`, serial `69422`, operational status `inactive`).

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

This view joins `drones` to `drone_signals` on `drone_id`, answering: "What signals has each drone emitted, and under what flight conditions?" For example, drone `1437577` (manufacturer `Standard Chartered`, model `composite-model-81`, serial `5844275`, operational status `active`) emitted signal `317` (drone serial `10238261`, flight status `idle`, pilot location `adaptive-pilot-83`, encryption `encrypted`, timestamp `2024-07-08T18:18:00`). Drone `5917276` (manufacturer `Column Name cannot be empty`, model `adaptive-model-83`, serial `7731874`, operational status `decommissioned`) emitted signal `4463669` (drone serial `BjoernKW`, flight status `landing`, pilot location `baseline-pilot-85`, encryption `unknown`, timestamp `2022-05-03T08:52:00`).

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

This view joins `drones` to `airspace_zones` through the `drones_zones` junction table, answering: "Which airspace zones does each drone traverse?" For example, drone `1437577` (manufacturer `Standard Chartered`, model `composite-model-81`, serial `5844275`, operational status `active`) operates in zone `937724` (`no-fly`, altitude limit 10.45 meters, radius 9.20 meters, enforcement level `advisory`). Drone `5917277` (manufacturer `General Motors`, model `primary-model-82`, serial `69422`, operational status `inactive`) operates in zone `99504` (`restricted`, altitude limit 13.90 meters, radius 11.40 meters, enforcement level `mandatory`).

The schema design follows a clear normalization pattern: six entity tables store atomic facts about detection systems, upgrade modules, drone signals, manufacturer servers, airspace zones, and drones. Nine junction tables resolve the many-to-many relationships between these entities—systems-to-signals, systems-to-zones, servers-to-modules, servers-to-systems, zones-to-drones, and their inverses. The fourteen views then denormalize specific entity combinations into flat, query-ready structures that reconstruct domain facts: which firmware each system runs, which signals each drone emits, which zones each system monitors, and which drones operate in which zones. This separation of normalized storage from denormalized access patterns allows the schema to support both referential integrity at the base tables and efficient read access through the views, faithfully materializing the drone detection ontology in relational form.