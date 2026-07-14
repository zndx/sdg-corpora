# Chapter 7 — Relational Modelling of a VPN Infrastructure Domain

## 7.1 Domain Scenario

Enterprise VPN deployments span a hierarchy of interconnected components: gateway servers enforce security policies, clients establish tunnels to those servers, protocols define the cryptographic and transport characteristics of each tunnel, network segments partition the address space, and endpoint devices roam across segments while authenticating through their associated clients. Data packets flow from devices, through clients, across servers, and are governed by the security policies and protocols configured at each layer. This chapter documents how that hierarchy is captured in a normalized relational schema — which entity types exist, how their attributes and cardinality-bounded relationships become columns, foreign keys, and junction tables, and how each materialized view reconstructs a domain fact from the normalized tables.

## 7.2 Core Entity Tables

### 7.2.1 VPN Servers

**Table `vpn_servers`**

| vpn_server_id | serial_number | firmware_version | max_concurrent_connections | power_consumption_watts | form_factor | status | security_policy_id |
|---|---|---|---|---|---|---|---|
| 100 | 5844275 | distributed-firmware-48 | 18 | 19.45 | distributed-form-42 | active | 1 |
| 101 | 69422 | baseline-firmware-49 | 27 | 21.90 | baseline-form-43 | standby | 2 |
| 102 | 7731874 | pilot-firmware-50 | 36 | 24.35 | pilot-form-44 | offline | 3 |
| 103 | 10445632 | extended-firmware-51 | 45 | 26.80 | extended-form-45 | maintenance | 4 |

The `vpn_servers` table anchors the infrastructure hierarchy. Each row represents a physical or virtual VPN gateway identified by a surrogate `vpn_server_id` (values 100 through 103 in the sample data) and a human-readable `serial_number` such as `5844275` or `10445632`. Operational metadata includes `firmware_version` (e.g., `distributed-firmware-48`), `max_concurrent_connections` (an integer capacity like 18 or 45), `power_consumption_watts` (a decimal such as 19.45 or 26.80), and `form_factor` (a categorical label like `distributed-form-42`). The `status` column constrains each server to one of five states — `active`, `standby`, `offline`, or `maintenance` — and the `security_policy_id` column is a foreign key referencing `security_policies.id`, binding each server to exactly one policy. In the sample, server 100 carries policy 1, server 101 carries policy 2, and so on through server 103 with policy 4.

### 7.2.2 VPN Clients

**Table `vpn_clients`**

| vpn_client_id | serial_number | firmware_version | connection_mode | routing_mode | mac_address | status | vpn_server_id |
|---|---|---|---|---|---|---|---|
| 1 | 5844275 | distributed-firmware-48 | automatic | all_traffic | primary-mac-94 | connected | 100 |
| 2 | 69422 | baseline-firmware-49 | manual | split_tunnel | adaptive-mac-95 | disconnected | 101 |
| 3 | 7731874 | pilot-firmware-50 | disabled | passthrough | distributed-mac-96 | error | 102 |
| 4 | 10445632 | extended-firmware-51 | automatic | all_traffic | baseline-mac-97 | idle | 103 |

The `vpn_clients` table models the endpoint side of the VPN. Each client has a surrogate `vpn_client_id` (1 through 4), a `serial_number` that coincidentally mirrors server serials in the sample (`5844275`, `69422`, etc.), and a `firmware_version` string. Two categorical columns describe connection behaviour: `connection_mode` (values `automatic`, `manual`, or `disabled`) and `routing_mode` (values `all_traffic`, `split_tunnel`, or `passthrough`). The `mac_address` column (e.g., `primary-mac-94`) provides a hardware identifier, while `status` constrains the client to one of `connected`, `disconnected`, `error`, or `idle`. The critical foreign key is `vpn_server_id`, which establishes a many-to-one relationship: multiple clients may connect to the same server, as seen with client 1 attached to server 100 and client 4 attached to server 103.

### 7.2.3 VPN Protocols

**Table `vpn_protocols`**

| id | protocol_name | encryption_standard | port_number | transport_layer | is_deprecated | security_rating | created_at |
|---|---|---|---|---|---|---|---|
| 1 | Baseline Initiative D | pilot-encrypti-26 | 18 | tcp | true | high | 2025-01-01 00:14:00 |
| 2 | Distributed Model | extended-encrypti-27 | 23 | udp | false | medium | 2025-02-06 03:14:00 |
| 3 | Adaptive Cluster | integrated-encrypti-28 | 28 | icmp | true | low | 2025-03-11 06:14:00 |
| 4 | Primary Review A | seasonal-encrypti-29 | 33 | tcp | false | untrusted | 2025-04-16 09:14:00 |

The `vpn_protocols` table is a lookup catalogue of supported tunnel protocols. Each row carries a surrogate `id` (1 through 4), a `protocol_name` (e.g., `Baseline Initiative D`, `Distributed Model`), an `encryption_standard` string (`pilot-encrypti-26`, `extended-encrypti-27`), a `port_number` (18, 23, 28, 33), a `transport_layer` enum (`tcp`, `udp`, `icmp`), a boolean `is_deprecated` flag, a `security_rating` enum (`high`, `medium`, `low`, `untrusted`), and a `created_at` timestamp. This table is intentionally denormalized as a reference catalogue; protocols are not directly foreign-keyed to servers or clients in the base schema — instead, many-to-many associations are expressed through junction tables described in Section 7.4.

### 7.2.4 Security Policies

**Table `security_policies`**

| id | policy_id | policy_name | last_updated | encryption_level | access_control_mode | audit_log_retention_days | vpn_server_id | network_segment_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 5844252 | Regional Series | 2023-06-17T17:27:00 | none | open | 42 | 100 | 100 |
| 2 | 10207142 | Seasonal Assessment D | 2024-11-01T00:44:00 | standard | whitelist | 50 | 101 | 101 |
| 3 | 1562847 | Integrated Survey | 2025-04-12T07:01:00 | high | blacklist | 58 | 102 | 102 |
| 4 | ChIJkzsYUIBt5kcRM6_JHx26ONk | Extended Corridor | 2022-09-23T14:18:00 | military_grade | certificate_based | 66 | 103 | 103 |

The `security_policies` table defines the governance rules applied at each server. Each row has a surrogate `id` (1 through 4), a business-level `policy_id` (e.g., `5844252`, `10207142`, `1562847`, or the UUID-like `ChIJkzsYUIBt5kcRM6_JHx26ONk`), a `policy_name` (`Regional Series`, `Seasonal Assessment D`, `Integrated Survey`, `Extended Corridor`), a `last_updated` timestamp, an `encryption_level` enum (`none`, `standard`, `high`, `military_grade`), an `access_control_mode` enum (`open`, `whitelist`, `blacklist`, `certificate_based`), and an `audit_log_retention_days` integer (42 through 66). Two foreign keys anchor the policy to the infrastructure: `vpn_server_id` links the policy back to the server it governs, and `network_segment_id` links it to the network segment it applies to. In the sample, policy 1 governs server 100 and segment 100; policy 4 governs server 103 and segment 103.

### 7.2.5 Network Segments

**Table `network_segments`**

| network_segment_id | segment_id | segment_name | subnet_mask | gateway_ip | location_type | isolation_level | vpn_server_id |
|---|---|---|---|---|---|---|---|
| 100 | 422a03c4-8fcc-11eb-924d-9cd76263cbd0 | Adaptive Series | distributed-subnet-30 | regional-gateway-54 | home | isolated | 100 |
| 101 | 32825 | Primary Assessment | baseline-subnet-31 | legacy-gateway-55 | corporate | restricted | 101 |
| 102 | 974920 | Composite Survey D | pilot-subnet-32 | compact-gateway-56 | remote_branch | open | 102 |
| 103 | 2933482 | Compact Corridor | extended-subnet-33 | composite-gateway-57 | home | isolated | 103 |

The `network_segments` table partitions the address space into logical zones. Each row has a surrogate `network_segment_id` (100 through 103), a business `segment_id` (UUIDs like `422a03c4-8fcc-11eb-924d-9cd76263cbd0` or integers like `32825`), a `segment_name` (`Adaptive Series`, `Primary Assessment`, `Composite Survey D`, `Compact Corridor`), a `subnet_mask` string (`distributed-subnet-30`, `baseline-subnet-31`), a `gateway_ip` string (`regional-gateway-54`, `legacy-gateway-55`), a `location_type` enum (`home`, `corporate`, `remote_branch`), and an `isolation_level` enum (`isolated`, `restricted`, `open`). The `vpn_server_id` foreign key binds each segment to the server that routes traffic for it. Segment 100 is a `home` location with `isolated` status served by server 100; segment 102 is a `remote_branch` with `open` isolation served by server 102.

### 7.2.6 Network Devices

**Table `network_devices`**

| id | device_id | device_name | device_type | os_version | mac_address | last_seen | is_authenticated | vpn_client_id | network_segment_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 3744015 | Pilot Assessment | desktop | integrated-os-46 | primary-mac-94 | 2023-02-23T13:51:00 | false | 1 | 100 |
| 2 | 392495 | Baseline Survey | mobile | seasonal-os-47 | adaptive-mac-95 | 2024-07-07T20:08:00 | true | 2 | 101 |
| 3 | 209205 | Distributed Corridor A | iot | regional-os-48 | distributed-mac-96 | 2025-12-18T03:25:00 | false | 3 | 102 |
| 4 | 22106999 | Adaptive Series | server | legacy-os-49 | baseline-mac-97 | 2022-05-02T10:42:00 | true | 4 | 103 |

The `network_devices` table models endpoint hardware — desktops, mobiles, IoT sensors, and servers. Each row has a surrogate `id` (1 through 4), a business `device_id` (e.g., `3744015`, `392495`), a `device_name` (`Pilot Assessment`, `Baseline Survey`, `Distributed Corridor A`, `Adaptive Series`), a `device_type` enum (`desktop`, `mobile`, `iot`, `server`), an `os_version` string (`integrated-os-46`, `seasonal-os-47`), a `mac_address` (`primary-mac-94`, `adaptive-mac-95`), a `last_seen` timestamp, a boolean `is_authenticated`, and two foreign keys: `vpn_client_id` (linking the device to the client that manages it) and `network_segment_id` (linking the device to the segment it resides in). Device 1 is a `desktop` running `integrated-os-46`, authenticated as `false`, managed by client 1 in segment 100. Device 4 is a `server` running `legacy-os-49`, authenticated as `true`, managed by client 4 in segment 103.

### 7.2.7 Data Packets

**Table `data_packets`**

| packet_id | payload_size_bytes | timestamp | encryption_algorithm | protocol_type | is_encrypted | integrity_check_hash | vpn_client_id | vpn_server_id | network_device_id |
|---|---|---|---|---|---|---|---|---|---|
| gd_acc_762000 | 34 | 2024-07-08T18:18:00 | primary-encrypti-82 | http | false | pilot-integrit-50 | 1 | 100 | 1 |
| 605946 | 37 | 2025-12-19T01:35:00 | adaptive-encrypti-83 | https | true | extended-integrit-51 | 2 | 101 | 2 |
| 32826 | 40 | 2022-05-03T08:52:00 | distributed-encrypti-84 | ftp | false | integrated-integrit-52 | 3 | 102 | 3 |
| BJamUT | 43 | 2023-10-14T15:09:00 | baseline-encrypti-85 | ssh | true | seasonal-integrit-53 | 4 | 103 | 4 |

The `data_packets` table captures individual packet records flowing through the infrastructure. While the sample payload does not display rows, the table exists as a leaf entity in the hierarchy, linked to network devices via the `devices_packets` junction table and to VPN clients and servers through the views `v_data_packet_vpn_client`, `v_data_packet_vpn_server`, and `v_data_packet_network_device`.

## 7.3 Cardinality-Bounded Relationships

The schema distinguishes between direct foreign-key relationships (cardinality bounded at the column level) and many-to-many relationships (expressed through junction tables).

**Direct FK relationships** appear as columns in the base tables:
- `vpn_clients.vpn_server_id` → `vpn_servers.vpn_server_id` (many clients to one server)
- `security_policies.vpn_server_id` → `vpn_servers.vpn_server_id` (one policy per server in this model)
- `security_policies.network_segment_id` → `network_segments.network_segment_id` (one segment per policy)
- `network_segments.vpn_server_id` → `vpn_servers.vpn_server_id` (one server per segment)
- `network_devices.vpn_client_id` → `vpn_clients.vpn_client_id` (many devices to one client)
- `network_devices.network_segment_id` → `network_segments.network_segment_id` (many devices to one segment)

These columns enforce referential integrity at the row level: a client row cannot reference a non-existent server, and a device row cannot reference a non-existent client or segment.

**Many-to-many relationships** require junction tables because a single entity on one side can relate to multiple entities on the other, and vice versa. The schema provides seven such tables:

- `servers_protocols` and `protocols_servers` — bidirectional links between VPN servers and protocols. A server can support multiple protocols (e.g., server 100 might support both `Baseline Initiative D` and `Distributed Model`), and a protocol can be used by multiple servers.
- `servers_clients` — links servers to clients, capturing which clients are provisioned on which servers beyond the direct FK in `vpn_clients`.
- `clients_protocols` and `protocols_clients` — bidirectional links between VPN clients and protocols. Client 1 (in `automatic` mode with `all_traffic` routing) might use protocol 1 (`Baseline Initiative D`), while client 2 (in `manual` mode with `split_tunnel` routing) might use protocol 2 (`Distributed Model`).
- `clients_devices` — links VPN clients to network devices, capturing the client-to-device assignment beyond the direct FK in `network_devices`.
- `segments_devices` — links network segments to devices, capturing which devices are assigned to which segments beyond the direct FK in `network_devices`.
- `devices_packets` — links network devices to data packets, capturing which device generated or forwarded each packet.

The dual naming convention (`servers_protocols` / `protocols_servers`, `clients_protocols` / `protocols_clients`) reflects a modelling choice to store the relationship from both entity perspectives, enabling efficient reverse lookups without requiring self-joins on a single junction table.

## 7.4 Materialized Views

Each view materializes a specific domain fact by joining two or more base tables. The following sections interpret what question each view answers and illustrate with concrete rows.

### 7.4.1 Server-Centric Views

**View `v_vpn_server_security_policy`**

```sql
CREATE VIEW v_vpn_server_security_policy AS
SELECT a.vpn_server_id, a.serial_number, a.firmware_version, a.max_concurrent_connections, b.id AS policy_id, b.policy_id AS policy_policy_id, b.policy_name AS policy_policy_name
FROM vpn_servers a JOIN security_policies b ON a.security_policy_id = b.id;
```

| vpn_server_id | serial_number | firmware_version | max_concurrent_connections | policy_id | policy_policy_id | policy_policy_name |
|---|---|---|---|---|---|---|
| 100 | 5844275 | distributed-firmware-48 | 18 | 1 | 5844252 | Regional Series |
| 101 | 69422 | baseline-firmware-49 | 27 | 2 | 10207142 | Seasonal Assessment D |
| 102 | 7731874 | pilot-firmware-50 | 36 | 3 | 1562847 | Integrated Survey |
| 103 | 10445632 | extended-firmware-51 | 45 | 4 | ChIJkzsYUIBt5kcRM6_JHx26ONk | Extended Corridor |

This view joins `vpn_servers` to `security_policies` on `vpn_server_id`, answering: *What security policy governs each VPN server?* A row for server 100 would show `Regional Series` with `none` encryption level and `open` access control, while server 103 would show `Extended Corridor` with `military_grade` encryption and `certificate_based` access control.

**View `v_vpn_server_vpn_protocol_detail`**

```sql
CREATE VIEW v_vpn_server_vpn_protocol_detail AS
SELECT a.vpn_server_id, a.serial_number, a.firmware_version, b.id AS protocol_id, b.protocol_name AS protocol_protocol_name, b.encryption_standard AS protocol_encryption_standard
FROM vpn_servers a
  JOIN servers_protocols j ON j.vpn_server_id = a.vpn_server_id
  JOIN vpn_protocols b ON b.id = j.vpn_protocol_id;
```

| vpn_server_id | serial_number | firmware_version | protocol_id | protocol_protocol_name | protocol_encryption_standard |
|---|---|---|---|---|---|
| 100 | 5844275 | distributed-firmware-48 | 1 | Baseline Initiative D | pilot-encrypti-26 |
| 100 | 5844275 | distributed-firmware-48 | 2 | Distributed Model | extended-encrypti-27 |
| 101 | 69422 | baseline-firmware-49 | 2 | Distributed Model | extended-encrypti-27 |
| 101 | 69422 | baseline-firmware-49 | 3 | Adaptive Cluster | integrated-encrypti-28 |
| 102 | 7731874 | pilot-firmware-50 | 3 | Adaptive Cluster | integrated-encrypti-28 |
| 102 | 7731874 | pilot-firmware-50 | 4 | Primary Review A | seasonal-encrypti-29 |
| 103 | 10445632 | extended-firmware-51 | 4 | Primary Review A | seasonal-encrypti-29 |
| 103 | 10445632 | extended-firmware-51 | 1 | Baseline Initiative D | pilot-encrypti-26 |

This view joins `vpn_servers` to `vpn_protocols` (via `servers_protocols` or `protocols_servers`), answering: *Which protocols are available on each VPN server?* A row might pair server 100 with protocol 1 (`Baseline Initiative D`, port 18, `tcp`, `high` security rating), revealing the cryptographic capabilities of that gateway.

**View `v_vpn_server_vpn_client_detail`**

```sql
CREATE VIEW v_vpn_server_vpn_client_detail AS
SELECT a.vpn_server_id, a.serial_number, a.firmware_version, b.vpn_client_id AS client_vpn_client_id, b.serial_number AS client_serial_number, b.firmware_version AS client_firmware_version
FROM vpn_servers a
  JOIN servers_clients j ON j.vpn_server_id = a.vpn_server_id
  JOIN vpn_clients b ON b.vpn_client_id = j.vpn_client_id;
```

| vpn_server_id | serial_number | firmware_version | client_vpn_client_id | client_serial_number | client_firmware_version |
|---|---|---|---|---|---|
| 100 | 5844275 | distributed-firmware-48 | 1 | 5844275 | distributed-firmware-48 |
| 100 | 5844275 | distributed-firmware-48 | 2 | 69422 | baseline-firmware-49 |
| 101 | 69422 | baseline-firmware-49 | 2 | 69422 | baseline-firmware-49 |
| 101 | 69422 | baseline-firmware-49 | 3 | 7731874 | pilot-firmware-50 |
| 102 | 7731874 | pilot-firmware-50 | 3 | 7731874 | pilot-firmware-50 |
| 102 | 7731874 | pilot-firmware-50 | 4 | 10445632 | extended-firmware-51 |
| 103 | 10445632 | extended-firmware-51 | 4 | 10445632 | extended-firmware-51 |
| 103 | 10445632 | extended-firmware-51 | 1 | 5844275 | distributed-firmware-48 |

This view joins `vpn_servers` to `vpn_clients` on `vpn_server_id`, answering: *Which clients are connected to each server?* A row for server 100 would show client 1 (status `connected`, mode `automatic`, routing `all_traffic`), while server 101 would show client 2 (status `disconnected`, mode `manual`, routing `split_tunnel`).

### 7.4.2 Client-Centric Views

**View `v_vpn_client_vpn_server`**

```sql
CREATE VIEW v_vpn_client_vpn_server AS
SELECT a.vpn_client_id, a.serial_number, a.firmware_version, a.connection_mode, b.vpn_server_id AS server_vpn_server_id, b.serial_number AS server_serial_number, b.firmware_version AS server_firmware_version
FROM vpn_clients a JOIN vpn_servers b ON a.vpn_server_id = b.vpn_server_id;
```

| vpn_client_id | serial_number | firmware_version | connection_mode | server_vpn_server_id | server_serial_number | server_firmware_version |
|---|---|---|---|---|---|---|
| 1 | 5844275 | distributed-firmware-48 | automatic | 100 | 5844275 | distributed-firmware-48 |
| 2 | 69422 | baseline-firmware-49 | manual | 101 | 69422 | baseline-firmware-49 |
| 3 | 7731874 | pilot-firmware-50 | disabled | 102 | 7731874 | pilot-firmware-50 |
| 4 | 10445632 | extended-firmware-51 | automatic | 103 | 10445632 | extended-firmware-51 |

This view joins `vpn_clients` to `vpn_servers` on `vpn_server_id`, answering: *Which server does each client connect to?* A row for client 1 would show server 100 with `active` status and 18 max connections; client 3 would show server 102 with `offline` status and 36 max connections.

**View `v_vpn_client_vpn_protocol_detail`**

```sql
CREATE VIEW v_vpn_client_vpn_protocol_detail AS
SELECT a.vpn_client_id, a.serial_number, a.firmware_version, b.id AS protocol_id, b.protocol_name AS protocol_protocol_name, b.encryption_standard AS protocol_encryption_standard
FROM vpn_clients a
  JOIN clients_protocols j ON j.vpn_client_id = a.vpn_client_id
  JOIN vpn_protocols b ON b.id = j.vpn_protocol_id;
```

| vpn_client_id | serial_number | firmware_version | protocol_id | protocol_protocol_name | protocol_encryption_standard |
|---|---|---|---|---|---|
| 1 | 5844275 | distributed-firmware-48 | 1 | Baseline Initiative D | pilot-encrypti-26 |
| 1 | 5844275 | distributed-firmware-48 | 2 | Distributed Model | extended-encrypti-27 |
| 2 | 69422 | baseline-firmware-49 | 2 | Distributed Model | extended-encrypti-27 |
| 2 | 69422 | baseline-firmware-49 | 3 | Adaptive Cluster | integrated-encrypti-28 |
| 3 | 7731874 | pilot-firmware-50 | 3 | Adaptive Cluster | integrated-encrypti-28 |
| 3 | 7731874 | pilot-firmware-50 | 4 | Primary Review A | seasonal-encrypti-29 |
| 4 | 10445632 | extended-firmware-51 | 4 | Primary Review A | seasonal-encrypti-29 |
| 4 | 10445632 | extended-firmware-51 | 1 | Baseline Initiative D | pilot-encrypti-26 |

This view joins `vpn_clients` to `vpn_protocols` (via `clients_protocols` or `protocols_clients`), answering: *Which protocol does each client use?* A row might pair client 1 with protocol 1 (`Baseline Initiative D`, `tcp`, `high` rating), while client 2 might pair with protocol 2 (`Distributed Model`, `udp`, `medium` rating).

**View `v_vpn_client_network_device_detail`**

```sql
CREATE VIEW v_vpn_client_network_device_detail AS
SELECT a.vpn_client_id, a.serial_number, a.firmware_version, b.id AS device_id, b.device_id AS device_device_id, b.device_name AS device_device_name
FROM vpn_clients a
  JOIN clients_devices j ON j.vpn_client_id = a.vpn_client_id
  JOIN network_devices b ON b.id = j.network_device_id;
```

| vpn_client_id | serial_number | firmware_version | device_id | device_device_id | device_device_name |
|---|---|---|---|---|---|
| 1 | 5844275 | distributed-firmware-48 | 1 | 3744015 | Pilot Assessment |
| 1 | 5844275 | distributed-firmware-48 | 2 | 392495 | Baseline Survey |
| 2 | 69422 | baseline-firmware-49 | 2 | 392495 | Baseline Survey |
| 2 | 69422 | baseline-firmware-49 | 3 | 209205 | Distributed Corridor A |
| 3 | 7731874 | pilot-firmware-50 | 3 | 209205 | Distributed Corridor A |
| 3 | 7731874 | pilot-firmware-50 | 4 | 22106999 | Adaptive Series |
| 4 | 10445632 | extended-firmware-51 | 4 | 22106999 | Adaptive Series |
| 4 | 10445632 | extended-firmware-51 | 1 | 3744015 | Pilot Assessment |

This view joins `vpn_clients` to `network_devices` on `vpn_client_id`, answering: *Which devices are managed by each client?* A row for client 1 would show device 1 (a `desktop` named `Pilot Assessment`, running `integrated-os-46`, last seen `2023-02-23T13:51:00`, not authenticated). Client 4 would show device 4 (a `server` named `Adaptive Series`, running `legacy-os-49`, authenticated).

### 7.4.3 Protocol-Centric Views

**View `v_vpn_protocol_vpn_server_detail`**

```sql
CREATE VIEW v_vpn_protocol_vpn_server_detail AS
SELECT a.id, a.protocol_name, a.encryption_standard, b.vpn_server_id AS server_vpn_server_id, b.serial_number AS server_serial_number, b.firmware_version AS server_firmware_version
FROM vpn_protocols a
  JOIN protocols_servers j ON j.vpn_protocol_id = a.id
  JOIN vpn_servers b ON b.vpn_server_id = j.vpn_server_id;
```

| id | protocol_name | encryption_standard | server_vpn_server_id | server_serial_number | server_firmware_version |
|---|---|---|---|---|---|
| 1 | Baseline Initiative D | pilot-encrypti-26 | 100 | 5844275 | distributed-firmware-48 |
| 1 | Baseline Initiative D | pilot-encrypti-26 | 101 | 69422 | baseline-firmware-49 |
| 2 | Distributed Model | extended-encrypti-27 | 101 | 69422 | baseline-firmware-49 |
| 2 | Distributed Model | extended-encrypti-27 | 102 | 7731874 | pilot-firmware-50 |
| 3 | Adaptive Cluster | integrated-encrypti-28 | 102 | 7731874 | pilot-firmware-50 |
| 3 | Adaptive Cluster | integrated-encrypti-28 | 103 | 10445632 | extended-firmware-51 |
| 4 | Primary Review A | seasonal-encrypti-29 | 103 | 10445632 | extended-firmware-51 |
| 4 | Primary Review A | seasonal-encrypti-29 | 100 | 5844275 | distributed-firmware-48 |

This view joins `vpn_protocols` to `vpn_servers` (via `protocols_servers` or `servers_protocols`), answering: *Which servers support each protocol?* A row for protocol 1 (`Baseline Initiative D`, deprecated `true`, `high` rating) might show server 100, indicating that the deprecated but high-security protocol is still in use on an active gateway.

**View `v_vpn_protocol_vpn_client_detail`**

```sql
CREATE VIEW v_vpn_protocol_vpn_client_detail AS
SELECT a.id, a.protocol_name, a.encryption_standard, b.vpn_client_id AS client_vpn_client_id, b.serial_number AS client_serial_number, b.firmware_version AS client_firmware_version
FROM vpn_protocols a
  JOIN protocols_clients j ON j.vpn_protocol_id = a.id
  JOIN vpn_clients b ON b.vpn_client_id = j.vpn_client_id;
```

| id | protocol_name | encryption_standard | client_vpn_client_id | client_serial_number | client_firmware_version |
|---|---|---|---|---|---|
| 1 | Baseline Initiative D | pilot-encrypti-26 | 1 | 5844275 | distributed-firmware-48 |
| 1 | Baseline Initiative D | pilot-encrypti-26 | 2 | 69422 | baseline-firmware-49 |
| 2 | Distributed Model | extended-encrypti-27 | 2 | 69422 | baseline-firmware-49 |
| 2 | Distributed Model | extended-encrypti-27 | 3 | 7731874 | pilot-firmware-50 |
| 3 | Adaptive Cluster | integrated-encrypti-28 | 3 | 7731874 | pilot-firmware-50 |
| 3 | Adaptive Cluster | integrated-encrypti-28 | 4 | 10445632 | extended-firmware-51 |
| 4 | Primary Review A | seasonal-encrypti-29 | 4 | 10445632 | extended-firmware-51 |
| 4 | Primary Review A | seasonal-encrypti-29 | 1 | 5844275 | distributed-firmware-48 |

This view joins `vpn_protocols` to `vpn_clients` (via `protocols_clients` or `clients_protocols`), answering: *Which clients use each protocol?* A row for protocol 3 (`Adaptive Cluster`, `icmp`, `low` rating, deprecated `true`) might show client 3, revealing that a client in `error` status is using a deprecated, low-security protocol.

### 7.4.4 Security Policy Views

**View `v_security_policy_vpn_server`**

```sql
CREATE VIEW v_security_policy_vpn_server AS
SELECT a.id, a.policy_id, a.policy_name, a.last_updated, b.vpn_server_id AS server_vpn_server_id, b.serial_number AS server_serial_number, b.firmware_version AS server_firmware_version
FROM security_policies a JOIN vpn_servers b ON a.vpn_server_id = b.vpn_server_id;
```

| id | policy_id | policy_name | last_updated | server_vpn_server_id | server_serial_number | server_firmware_version |
|---|---|---|---|---|---|---|
| 1 | 5844252 | Regional Series | 2023-06-17T17:27:00 | 100 | 5844275 | distributed-firmware-48 |
| 2 | 10207142 | Seasonal Assessment D | 2024-11-01T00:44:00 | 101 | 69422 | baseline-firmware-49 |
| 3 | 1562847 | Integrated Survey | 2025-04-12T07:01:00 | 102 | 7731874 | pilot-firmware-50 |
| 4 | ChIJkzsYUIBt5kcRM6_JHx26ONk | Extended Corridor | 2022-09-23T14:18:00 | 103 | 10445632 | extended-firmware-51 |

This view joins `security_policies` to `vpn_servers` on `vpn_server_id`, answering: *Which server is governed by each policy?* A row for policy 1 (`Regional Series`, `none` encryption, `open` access control, 42-day audit retention) would show server 100, highlighting a server with minimal security controls.

**View `v_security_policy_network_segment`**

```sql
CREATE VIEW v_security_policy_network_segment AS
SELECT a.id, a.policy_id, a.policy_name, a.last_updated, b.network_segment_id AS segment_network_segment_id, b.segment_id AS segment_segment_id, b.segment_name AS segment_segment_name
FROM security_policies a JOIN network_segments b ON a.network_segment_id = b.network_segment_id;
```

| id | policy_id | policy_name | last_updated | segment_network_segment_id | segment_segment_id | segment_segment_name |
|---|---|---|---|---|---|---|
| 1 | 5844252 | Regional Series | 2023-06-17T17:27:00 | 100 | 422a03c4-8fcc-11eb-924d-9cd76263cbd0 | Adaptive Series |
| 2 | 10207142 | Seasonal Assessment D | 2024-11-01T00:44:00 | 101 | 32825 | Primary Assessment |
| 3 | 1562847 | Integrated Survey | 2025-04-12T07:01:00 | 102 | 974920 | Composite Survey D |
| 4 | ChIJkzsYUIBt5kcRM6_JHx26ONk | Extended Corridor | 2022-09-23T14:18:00 | 103 | 2933482 | Compact Corridor |

This view joins `security_policies` to `network_segments` on `network_segment_id`, answering: *Which segment is governed by each policy?* A row for policy 4 (`Extended Corridor`, `military_grade` encryption, `certificate_based` access, 66-day retention) would show segment 103 (`Compact Corridor`, `home` location, `isolated`), revealing the most restrictive policy applied to an isolated home segment.

### 7.4.5 Network Segment Views

**View `v_network_segment_network_device_detail`**

```sql
CREATE VIEW v_network_segment_network_device_detail AS
SELECT a.network_segment_id, a.segment_id, a.segment_name, b.id AS device_id, b.device_id AS device_device_id, b.device_name AS device_device_name
FROM network_segments a
  JOIN segments_devices j ON j.network_segment_id = a.network_segment_id
  JOIN network_devices b ON b.id = j.network_device_id;
```

| network_segment_id | segment_id | segment_name | device_id | device_device_id | device_device_name |
|---|---|---|---|---|---|
| 100 | 422a03c4-8fcc-11eb-924d-9cd76263cbd0 | Adaptive Series | 1 | 3744015 | Pilot Assessment |
| 100 | 422a03c4-8fcc-11eb-924d-9cd76263cbd0 | Adaptive Series | 2 | 392495 | Baseline Survey |
| 101 | 32825 | Primary Assessment | 2 | 392495 | Baseline Survey |
| 101 | 32825 | Primary Assessment | 3 | 209205 | Distributed Corridor A |
| 102 | 974920 | Composite Survey D | 3 | 209205 | Distributed Corridor A |
| 102 | 974920 | Composite Survey D | 4 | 22106999 | Adaptive Series |
| 103 | 2933482 | Compact Corridor | 4 | 22106999 | Adaptive Series |
| 103 | 2933482 | Compact Corridor | 1 | 3744015 | Pilot Assessment |

This view joins `network_segments` to `network_devices` on `network_segment_id`, answering: *Which devices reside in each segment?* A row for segment 100 (`Adaptive Series`, `home`, `isolated`) would show device 1 (a `desktop` named `Pilot Assessment`), while segment 103 (`Compact Corridor`, `home`, `isolated`) would show device 4 (a `server` named `Adaptive Series`).

**View `v_network_segment_vpn_server`**

```sql
CREATE VIEW v_network_segment_vpn_server AS
SELECT a.network_segment_id, a.segment_id, a.segment_name, a.subnet_mask, b.vpn_server_id AS server_vpn_server_id, b.serial_number AS server_serial_number, b.firmware_version AS server_firmware_version
FROM network_segments a JOIN vpn_servers b ON a.vpn_server_id = b.vpn_server_id;
```

| network_segment_id | segment_id | segment_name | subnet_mask | server_vpn_server_id | server_serial_number | server_firmware_version |
|---|---|---|---|---|---|---|
| 100 | 422a03c4-8fcc-11eb-924d-9cd76263cbd0 | Adaptive Series | distributed-subnet-30 | 100 | 5844275 | distributed-firmware-48 |
| 101 | 32825 | Primary Assessment | baseline-subnet-31 | 101 | 69422 | baseline-firmware-49 |
| 102 | 974920 | Composite Survey D | pilot-subnet-32 | 102 | 7731874 | pilot-firmware-50 |
| 103 | 2933482 | Compact Corridor | extended-subnet-33 | 103 | 10445632 | extended-firmware-51 |

This view joins `network_segments` to `vpn_servers` on `vpn_server_id`, answering: *Which server routes traffic for each segment?* A row for segment 101 (`Primary Assessment`, `corporate`, `restricted`) would show server 101 (`standby` status, `baseline-firmware-49`), indicating a corporate segment served by a standby gateway.

### 7.4.6 Network Device Views

**View `v_network_device_vpn_client`**

```sql
CREATE VIEW v_network_device_vpn_client AS
SELECT a.id, a.device_id, a.device_name, a.device_type, b.vpn_client_id AS client_vpn_client_id, b.serial_number AS client_serial_number, b.firmware_version AS client_firmware_version
FROM network_devices a JOIN vpn_clients b ON a.vpn_client_id = b.vpn_client_id;
```

| id | device_id | device_name | device_type | client_vpn_client_id | client_serial_number | client_firmware_version |
|---|---|---|---|---|---|---|
| 1 | 3744015 | Pilot Assessment | desktop | 1 | 5844275 | distributed-firmware-48 |
| 2 | 392495 | Baseline Survey | mobile | 2 | 69422 | baseline-firmware-49 |
| 3 | 209205 | Distributed Corridor A | iot | 3 | 7731874 | pilot-firmware-50 |
| 4 | 22106999 | Adaptive Series | server | 4 | 10445632 | extended-firmware-51 |

This view joins `network_devices` to `vpn_clients` on `vpn_client_id`, answering: *Which client manages each device?* A row for device 2 (a `mobile` named `Baseline Survey`, `seasonal-os-47`, authenticated `true`) would show client 2 (status `disconnected`, mode `manual`), revealing a device that is authenticated but whose managing client is currently disconnected.

**View `v_network_device_network_segment`**

```sql
CREATE VIEW v_network_device_network_segment AS
SELECT a.id, a.device_id, a.device_name, a.device_type, b.network_segment_id AS segment_network_segment_id, b.segment_id AS segment_segment_id, b.segment_name AS segment_segment_name
FROM network_devices a JOIN network_segments b ON a.network_segment_id = b.network_segment_id;
```

| id | device_id | device_name | device_type | segment_network_segment_id | segment_segment_id | segment_segment_name |
|---|---|---|---|---|---|---|
| 1 | 3744015 | Pilot Assessment | desktop | 100 | 422a03c4-8fcc-11eb-924d-9cd76263cbd0 | Adaptive Series |
| 2 | 392495 | Baseline Survey | mobile | 101 | 32825 | Primary Assessment |
| 3 | 209205 | Distributed Corridor A | iot | 102 | 974920 | Composite Survey D |
| 4 | 22106999 | Adaptive Series | server | 103 | 2933482 | Compact Corridor |

This view joins `network_devices` to `network_segments` on `network_segment_id`, answering: *Which segment does each device belong to?* A row for device 3 (an `iot` device named `Distributed Corridor A`, `regional-os-48`, not authenticated) would show segment 102 (`Composite Survey D`, `remote_branch`, `open`), indicating an unauthenticated IoT device in an open remote-branch segment.

**View `v_network_device_data_packet_detail`**

```sql
CREATE VIEW v_network_device_data_packet_detail AS
SELECT a.id, a.device_id, a.device_name, b.packet_id AS packet_packet_id, b.payload_size_bytes AS packet_payload_size_bytes, b.timestamp AS packet_timestamp
FROM network_devices a
  JOIN devices_packets j ON j.network_device_id = a.id
  JOIN data_packets b ON b.packet_id = j.packet_id;
```

| id | device_id | device_name | packet_packet_id | packet_payload_size_bytes | packet_timestamp |
|---|---|---|---|---|---|
| 1 | 3744015 | Pilot Assessment | gd_acc_762000 | 34 | 2024-07-08T18:18:00 |
| 1 | 3744015 | Pilot Assessment | 605946 | 37 | 2025-12-19T01:35:00 |
| 2 | 392495 | Baseline Survey | 605946 | 37 | 2025-12-19T01:35:00 |
| 2 | 392495 | Baseline Survey | 32826 | 40 | 2022-05-03T08:52:00 |
| 3 | 209205 | Distributed Corridor A | 32826 | 40 | 2022-05-03T08:52:00 |
| 3 | 209205 | Distributed Corridor A | BJamUT | 43 | 2023-10-14T15:09:00 |
| 4 | 22106999 | Adaptive Series | BJamUT | 43 | 2023-10-14T15:09:00 |
| 4 | 22106999 | Adaptive Series | gd_acc_762000 | 34 | 2024-07-08T18:18:00 |

This view joins `network_devices` to `data_packets` (via `devices_packets`), answering: *Which packets are associated with each device?* A row would pair device 1 with a packet record, enabling packet-level forensic analysis per endpoint.

### 7.4.7 Data Packet Views

**View `v_data_packet_vpn_client`**

```sql
CREATE VIEW v_data_packet_vpn_client AS
SELECT a.packet_id, a.payload_size_bytes, a.timestamp, a.encryption_algorithm, b.vpn_client_id AS client_vpn_client_id, b.serial_number AS client_serial_number, b.firmware_version AS client_firmware_version
FROM data_packets a JOIN vpn_clients b ON a.vpn_client_id = b.vpn_client_id;
```

| packet_id | payload_size_bytes | timestamp | encryption_algorithm | client_vpn_client_id | client_serial_number | client_firmware_version |
|---|---|---|---|---|---|---|
| gd_acc_762000 | 34 | 2024-07-08T18:18:00 | primary-encrypti-82 | 1 | 5844275 | distributed-firmware-48 |
| 605946 | 37 | 2025-12-19T01:35:00 | adaptive-encrypti-83 | 2 | 69422 | baseline-firmware-49 |
| 32826 | 40 | 2022-05-03T08:52:00 | distributed-encrypti-84 | 3 | 7731874 | pilot-firmware-50 |
| BJamUT | 43 | 2023-10-14T15:09:00 | baseline-encrypti-85 | 4 | 10445632 | extended-firmware-51 |

This view joins `data_packets` to `vpn_clients` (via `devices_packets` and `network_devices`), answering: *Which client is associated with each data packet?* A row would link a packet to client 1 (connected, `automatic` mode), enabling traceability from packet to client.

**View `v_data_packet_vpn_server`**

```sql
CREATE VIEW v_data_packet_vpn_server AS
SELECT a.packet_id, a.payload_size_bytes, a.timestamp, a.encryption_algorithm, b.vpn_server_id AS server_vpn_server_id, b.serial_number AS server_serial_number, b.firmware_version AS server_firmware_version
FROM data_packets a JOIN vpn_servers b ON a.vpn_server_id = b.vpn_server_id;
```

| packet_id | payload_size_bytes | timestamp | encryption_algorithm | server_vpn_server_id | server_serial_number | server_firmware_version |
|---|---|---|---|---|---|---|
| gd_acc_762000 | 34 | 2024-07-08T18:18:00 | primary-encrypti-82 | 100 | 5844275 | distributed-firmware-48 |
| 605946 | 37 | 2025-12-19T01:35:00 | adaptive-encrypti-83 | 101 | 69422 | baseline-firmware-49 |
| 32826 | 40 | 2022-05-03T08:52:00 | distributed-encrypti-84 | 102 | 7731874 | pilot-firmware-50 |
| BJamUT | 43 | 2023-10-14T15:09:00 | baseline-encrypti-85 | 103 | 10445632 | extended-firmware-51 |

This view joins `data_packets` to `vpn_servers` (via `devices_packets`, `network_devices`, `vpn_clients`, and `vpn_servers`), answering: *Which server is associated with each data packet?* A row would link a packet to server 100 (`active`, `distributed-firmware-48`), enabling server-level packet auditing.

**View `v_data_packet_network_device`**

```sql
CREATE VIEW v_data_packet_network_device AS
SELECT a.packet_id, a.payload_size_bytes, a.timestamp, a.encryption_algorithm, b.id AS device_id, b.device_id AS device_device_id, b.device_name AS device_device_name
FROM data_packets a JOIN network_devices b ON a.network_device_id = b.id;
```

| packet_id | payload_size_bytes | timestamp | encryption_algorithm | device_id | device_device_id | device_device_name |
|---|---|---|---|---|---|---|
| gd_acc_762000 | 34 | 2024-07-08T18:18:00 | primary-encrypti-82 | 1 | 3744015 | Pilot Assessment |
| 605946 | 37 | 2025-12-19T01:35:00 | adaptive-encrypti-83 | 2 | 392495 | Baseline Survey |
| 32826 | 40 | 2022-05-03T08:52:00 | distributed-encrypti-84 | 3 | 209205 | Distributed Corridor A |
| BJamUT | 43 | 2023-10-14T15:09:00 | baseline-encrypti-85 | 4 | 22106999 | Adaptive Series |

This view joins `data_packets` to `network_devices` on the device identifier (via `devices_packets`), answering: *Which device generated or forwarded each packet?* A row would pair a packet with device 4 (a `server` named `Adaptive Series`, `legacy-os-49`, authenticated), providing endpoint-level packet provenance.

## 7.5 Synthesis

The schema models a VPN infrastructure as a hierarchy of seven base tables connected by six direct foreign keys and seven junction tables. The core entities — servers, clients, protocols, policies, segments, devices, and packets — each carry a surrogate primary key and a set of domain attributes that capture operational, cryptographic, and governance metadata. Cardinality-bounded relationships (many clients to one server, many devices to one client, many devices to one segment) are enforced through foreign-key columns, while many-to-many relationships (server-protocol, client-protocol, server-client, client-device, segment-device, device-packet) are expressed through explicit junction tables that preserve referential integrity in both directions.

The twenty-three materialized views each answer a specific analytical question by joining two base tables — or three, in the case of packet-to-server traces — and projecting the relevant columns. Together, the base tables and views provide a complete relational representation of the VPN domain: from the physical gateway (server) through the cryptographic layer (protocol, policy) to the endpoint (client, device, packet), with every join reconstructing a verifiable domain fact from the normalized tables.

## Data appendix

**Table `servers_protocols`**

| vpn_server_id | vpn_protocol_id |
|---|---|
| 100 | 1 |
| 100 | 2 |
| 101 | 2 |
| 101 | 3 |
| 102 | 3 |
| 102 | 4 |
| 103 | 4 |
| 103 | 1 |

**Table `servers_clients`**

| vpn_server_id | vpn_client_id |
|---|---|
| 100 | 1 |
| 100 | 2 |
| 101 | 2 |
| 101 | 3 |
| 102 | 3 |
| 102 | 4 |
| 103 | 4 |
| 103 | 1 |

**Table `clients_protocols`**

| vpn_client_id | vpn_protocol_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

**Table `clients_devices`**

| vpn_client_id | network_device_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

**Table `protocols_servers`**

| vpn_protocol_id | vpn_server_id |
|---|---|
| 1 | 100 |
| 1 | 101 |
| 2 | 101 |
| 2 | 102 |
| 3 | 102 |
| 3 | 103 |
| 4 | 103 |
| 4 | 100 |

**Table `protocols_clients`**

| vpn_protocol_id | vpn_client_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

**Table `segments_devices`**

| network_segment_id | network_device_id |
|---|---|
| 100 | 1 |
| 100 | 2 |
| 101 | 2 |
| 101 | 3 |
| 102 | 3 |
| 102 | 4 |
| 103 | 4 |
| 103 | 1 |

**Table `devices_packets`**

| network_device_id | packet_id |
|---|---|
| 1 | gd_acc_762000 |
| 1 | 605946 |
| 2 | 605946 |
| 2 | 32826 |
| 3 | 32826 |
| 3 | BJamUT |
| 4 | BJamUT |
| 4 | gd_acc_762000 |
