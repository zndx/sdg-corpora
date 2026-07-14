## VPN Infrastructure Management: Architecture, Policy, and Traffic Flow

Modern virtual private network (VPN) deployments span a complex ecosystem of servers, clients, protocols, security policies, network segments, and endpoint devices. Each component carries measurable attributes—firmware versions, power consumption, encryption standards, isolation levels—that together determine the operational posture of the entire infrastructure. Practitioners must understand not only the individual properties of each entity but also the relationships that bind them: which server enforces which policy, which client connects through which device, and how data packets traverse the network. The records in this domain capture a snapshot of that complexity, with concrete identifiers and values that serve as the basis for monitoring, auditing, and capacity planning.

## VPN Servers and Their Configuration

At the core of any VPN deployment are the servers that terminate tunnels and manage client sessions. The server inventory records four distinct units, each identified by a numeric `vpn_server_id` and a human-readable `serial_number`. Server 100, carrying serial number 5844275, runs distributed-firmware-48 and supports up to 18 concurrent connections while consuming 19.45 watts of power. It operates in an active state within a distributed-form-42 chassis. Server 101 (serial 69422) runs baseline-firmware-49, handles 27 concurrent connections at 21.90 watts, and holds a standby status in a baseline-form-43 enclosure. Server 102 (serial 7731874) is currently offline, running pilot-firmware-50 with a capacity of 36 connections at 24.35 watts. Server 103 (serial 10445632) is in maintenance mode, running extended-firmware-51 with the highest capacity of 45 concurrent connections at 26.80 watts.

**Table `vpn_servers`**

| vpn_server_id | serial_number | firmware_version | max_concurrent_connections | power_consumption_watts | form_factor | status | security_policy_id |
|---|---|---|---|---|---|---|---|
| 100 | 5844275 | distributed-firmware-48 | 18 | 19.45 | distributed-form-42 | active | 1 |
| 101 | 69422 | baseline-firmware-49 | 27 | 21.90 | baseline-form-43 | standby | 2 |
| 102 | 7731874 | pilot-firmware-50 | 36 | 24.35 | pilot-form-44 | offline | 3 |
| 103 | 10445632 | extended-firmware-51 | 45 | 26.80 | extended-form-45 | maintenance | 4 |

Each server is associated with a `security_policy_id`, linking it to the access controls and audit requirements that govern its operation. The `status` field—active, standby, offline, or maintenance—provides an immediate operational signal, while `max_concurrent_connections` and `power_consumption_watts` inform capacity planning and energy budgeting.

## VPN Clients and Connection Modes

Clients are the endpoints that initiate connections to VPN servers. The client registry contains four entries, each with a `vpn_client_id`, a `serial_number` that mirrors the server naming convention, and a `firmware_version` indicating the software stack in use. Client 1, serial 5844275, is currently connected to server 100, operating in automatic connection mode with all_traffic routing and a primary-mac-94 MAC address. Client 2, serial 69422, is disconnected from server 101, configured for manual connection with split_tunnel routing and adaptive-mac-95. Client 3, serial 7731874, reports an error state while associated with server 102, running in disabled mode with passthrough routing and distributed-mac-96. Client 4, serial 10445632, is idle on server 103, using automatic mode with all_traffic routing and baseline-mac-97.

**Table `vpn_clients`**

| vpn_client_id | serial_number | firmware_version | connection_mode | routing_mode | mac_address | status | vpn_server_id |
|---|---|---|---|---|---|---|---|
| 1 | 5844275 | distributed-firmware-48 | automatic | all_traffic | primary-mac-94 | connected | 100 |
| 2 | 69422 | baseline-firmware-49 | manual | split_tunnel | adaptive-mac-95 | disconnected | 101 |
| 3 | 7731874 | pilot-firmware-50 | disabled | passthrough | distributed-mac-96 | error | 102 |
| 4 | 10445632 | extended-firmware-51 | automatic | all_traffic | baseline-mac-97 | idle | 103 |

The `connection_mode` field—automatic, manual, or disabled—determines how the client establishes and maintains its tunnel. The `routing_mode` field—split_tunnel, all_traffic, or passthrough—controls whether client traffic is fully or partially directed through the VPN. The `status` field (connected, disconnected, error, idle) provides real-time operational visibility.

## VPN Protocols and Their Characteristics

The protocols table defines the transport and encryption mechanisms available for VPN tunnels. Four protocols are catalogued, each with a unique `id`, a `protocol_name`, an `encryption_standard`, a `port_number`, and a `transport_layer` designation. Protocol 1, named "Baseline Initiative D," uses pilot-encrypti-26 encryption on port 18 over TCP and is marked as deprecated with a high security rating. Protocol 2, "Distributed Model," employs extended-encrypti-27 on port 23 over UDP and is active with a medium security rating. Protocol 3, "Adaptive Cluster," uses integrated-encrypti-28 on port 28 over ICMP, is deprecated, and carries a low security rating. Protocol 4, "Primary Review A," applies seasonal-encrypti-29 on port 33 over TCP, remains active, and is rated untrusted.

**Table `vpn_protocols`**

| id | protocol_name | encryption_standard | port_number | transport_layer | is_deprecated | security_rating | created_at |
|---|---|---|---|---|---|---|---|
| 1 | Baseline Initiative D | pilot-encrypti-26 | 18 | tcp | true | high | 2025-01-01 00:14:00 |
| 2 | Distributed Model | extended-encrypti-27 | 23 | udp | false | medium | 2025-02-06 03:14:00 |
| 3 | Adaptive Cluster | integrated-encrypti-28 | 28 | icmp | true | low | 2025-03-11 06:14:00 |
| 4 | Primary Review A | seasonal-encrypti-29 | 33 | tcp | false | untrusted | 2025-04-16 09:14:00 |

The `is_deprecated` flag signals whether a protocol should be phased out, while `security_rating` (high, medium, low, untrusted) provides a quick assessment of its trustworthiness. The `transport_layer` field—tcp, udp, or icmp—determines the underlying transport semantics, which has implications for firewall rules and NAT traversal.

## Security Policies and Access Controls

Security policies define the governance framework for VPN operations. The policies table contains four entries, each with a `policy_id`, a `policy_name`, an `encryption_level`, an `access_control_mode`, and an `audit_log_retention_days` value. Policy 1, "Regional Series" (policy_id 5844252), applies no encryption, uses open access control, and retains audit logs for 42 days. Policy 2, "Seasonal Assessment D" (policy_id 10207142), enforces standard encryption with whitelist-based access control and 50 days of log retention. Policy 3, "Integrated Survey" (policy_id 1562847), requires high encryption with blacklist-based access control and 58 days of retention. Policy 4, "Extended Corridor" (policy_id ChIJkzsYUIBt5kcRM6_JHx26ONk), mandates military_grade encryption with certificate_based access control and 66 days of retention.

**Table `security_policies`**

| id | policy_id | policy_name | last_updated | encryption_level | access_control_mode | audit_log_retention_days | vpn_server_id | network_segment_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 5844252 | Regional Series | 2023-06-17T17:27:00 | none | open | 42 | 100 | 100 |
| 2 | 10207142 | Seasonal Assessment D | 2024-11-01T00:44:00 | standard | whitelist | 50 | 101 | 101 |
| 3 | 1562847 | Integrated Survey | 2025-04-12T07:01:00 | high | blacklist | 58 | 102 | 102 |
| 4 | ChIJkzsYUIBt5kcRM6_JHx26ONk | Extended Corridor | 2022-09-23T14:18:00 | military_grade | certificate_based | 66 | 103 | 103 |

The `encryption_level` field—none, standard, high, or military_grade—indicates the strength of data protection. The `access_control_mode` field—open, whitelist, blacklist, or certificate_based—determines how client authorization is enforced. The `last_updated` timestamp provides a change-tracking reference for compliance audits.

## Network Segments and Isolation

Network segments partition the infrastructure into logical zones with distinct isolation characteristics. The segments table records four entries, each with a `network_segment_id`, a UUID-based `segment_id`, a `segment_name`, a `subnet_mask`, a `gateway_ip`, a `location_type`, and an `isolation_level`. Segment 100, "Adaptive Series," uses distributed-subnet-30 with regional-gateway-54 at a home location type and isolated isolation level. Segment 101, "Primary Assessment," uses baseline-subnet-31 with legacy-gateway-55 at a corporate location type and restricted isolation level. Segment 102, "Composite Survey D," uses pilot-subnet-32 with compact-gateway-56 at a remote_branch location type and open isolation level. Segment 103, "Compact Corridor," uses extended-subnet-33 with composite-gateway-57 at a home location type and isolated isolation level.

**Table `network_segments`**

| network_segment_id | segment_id | segment_name | subnet_mask | gateway_ip | location_type | isolation_level | vpn_server_id |
|---|---|---|---|---|---|---|---|
| 100 | 422a03c4-8fcc-11eb-924d-9cd76263cbd0 | Adaptive Series | distributed-subnet-30 | regional-gateway-54 | home | isolated | 100 |
| 101 | 32825 | Primary Assessment | baseline-subnet-31 | legacy-gateway-55 | corporate | restricted | 101 |
| 102 | 974920 | Composite Survey D | pilot-subnet-32 | compact-gateway-56 | remote_branch | open | 102 |
| 103 | 2933482 | Compact Corridor | extended-subnet-33 | composite-gateway-57 | home | isolated | 103 |

The `isolation_level` field—open, restricted, or isolated—controls how strictly traffic is contained within the segment. The `location_type` field—home, corporate, or remote_branch—provides geographic or organizational context for network topology planning.

## Network Devices and Authentication

Network devices represent the physical or virtual endpoints that connect through VPN clients. The devices table contains four entries, each with a `device_id`, a `device_name`, a `device_type`, an `os_version`, a `mac_address`, a `last_seen` timestamp, and an `is_authenticated` flag. Device 1, "Pilot Assessment" (device_id 3744015), is a desktop running integrated-os-46 with MAC address primary-mac-94, last seen on 2023-02-23, and is not authenticated. Device 2, "Baseline Survey" (device_id 392495), is a mobile device running seasonal-os-47 with MAC address adaptive-mac-95, last seen on 2024-07-07, and is authenticated. Device 3, "Distributed Corridor A" (device_id 209205), is an IoT device running regional-os-48 with MAC address distributed-mac-96, last seen on 2025-12-18, and is not authenticated. Device 4, "Adaptive Series" (device_id 22106999), is a server running legacy-os-49 with MAC address baseline-mac-97, last seen on 2022-05-02, and is authenticated.

**Table `network_devices`**

| id | device_id | device_name | device_type | os_version | mac_address | last_seen | is_authenticated | vpn_client_id | network_segment_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 3744015 | Pilot Assessment | desktop | integrated-os-46 | primary-mac-94 | 2023-02-23T13:51:00 | false | 1 | 100 |
| 2 | 392495 | Baseline Survey | mobile | seasonal-os-47 | adaptive-mac-95 | 2024-07-07T20:08:00 | true | 2 | 101 |
| 3 | 209205 | Distributed Corridor A | iot | regional-os-48 | distributed-mac-96 | 2025-12-18T03:25:00 | false | 3 | 102 |
| 4 | 22106999 | Adaptive Series | server | legacy-os-49 | baseline-mac-97 | 2022-05-02T10:42:00 | true | 4 | 103 |

The `device_type` field—desktop, mobile, iot, or server—categorizes the endpoint, which influences security posture and resource requirements. The `is_authenticated` flag indicates whether the device has completed the authentication handshake, a prerequisite for data transmission.

## Data Packets and Traffic Records

Data packets capture the actual traffic flowing through the VPN infrastructure. Each packet record includes a `packet_id`, a `vpn_client_id` identifying the originating client, a `vpn_server_id` identifying the destination server, a `network_device_id` identifying the endpoint device, a `protocol_id` identifying the transport protocol, a `bytes_transferred` measurement, a `packet_status`, and a `timestamp`. The packet records link clients to servers, devices, and protocols, forming the basis for traffic analysis and bandwidth accounting.

**Table `data_packets`**

| packet_id | payload_size_bytes | timestamp | encryption_algorithm | protocol_type | is_encrypted | integrity_check_hash | vpn_client_id | vpn_server_id | network_device_id |
|---|---|---|---|---|---|---|---|---|---|
| gd_acc_762000 | 34 | 2024-07-08T18:18:00 | primary-encrypti-82 | http | false | pilot-integrit-50 | 1 | 100 | 1 |
| 605946 | 37 | 2025-12-19T01:35:00 | adaptive-encrypti-83 | https | true | extended-integrit-51 | 2 | 101 | 2 |
| 32826 | 40 | 2022-05-03T08:52:00 | distributed-encrypti-84 | ftp | false | integrated-integrit-52 | 3 | 102 | 3 |
| BJamUT | 43 | 2023-10-14T15:09:00 | baseline-encrypti-85 | ssh | true | seasonal-integrit-53 | 4 | 103 | 4 |

## Relationship Tables

The domain includes several relationship tables that model the many-to-many associations between core entities. The `servers_protocols` table records which VPN servers support which protocols, enabling capacity and compatibility analysis. The `servers_clients` table maps server-to-client assignments, showing which clients are authorized to connect to which servers. The `clients_protocols` table captures the protocol preferences or assignments for each client, informing tunnel configuration. The `clients_devices` table links VPN clients to their underlying network devices, establishing the endpoint chain from device to server.

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

The `protocols_servers` table provides the inverse mapping of servers to protocols, useful for protocol-centric queries. The `protocols_clients` table maps protocols to clients, supporting protocol adoption analysis. The `segments_devices` table associates network segments with devices, defining the logical placement of endpoints. The `devices_packets` table links devices to the packets they generate or forward, enabling device-level traffic accounting.

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

## Analytical Views

The analytical views synthesize the base tables into focused queries that answer specific operational questions. Each view joins multiple tables to produce a flattened result set that practitioners can query directly.

The view `v_vpn_server_security_policy` joins VPN servers with their associated security policies, answering which policy governs each server. Reading the row for server 100, we see it is governed by the "Regional Series" policy with open access control and 42 days of log retention. Server 103, by contrast, operates under "Extended Corridor" with military_grade encryption and certificate_based access control.

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

The view `v_vpn_server_vpn_protocol_detail` joins servers with the protocols they support, answering which protocols are available on each server. A row showing server 100 with protocol "Baseline Initiative D" reveals that a deprecated protocol is still in use, which may warrant a remediation action.

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

The view `v_vpn_server_vpn_client_detail` joins servers with their connected clients, answering which clients are associated with each server. The row for server 100 showing client 1 (connected, automatic mode, all_traffic routing) provides a clear picture of an active tunnel session.

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

The view `v_vpn_client_vpn_server` joins clients with their target servers, answering which server each client is configured to reach. Client 1's association with server 100, combined with its connected status, confirms an established session.

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

The view `v_vpn_client_vpn_protocol_detail` joins clients with the protocols they use, answering which protocol each client is tunneling over. A row showing client 2 using "Distributed Model" (protocol 2, UDP, medium security rating) indicates an active, non-deprecated protocol assignment.

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

The view `v_vpn_client_network_device_detail` joins clients with their underlying devices, answering which device each client is running on. The row for client 1 on device 1 ("Pilot Assessment," desktop, not authenticated) reveals an unauthenticated endpoint, which may require attention.

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

The view `v_vpn_protocol_vpn_server_detail` joins protocols with the servers that support them, answering which servers offer each protocol. A row showing protocol "Adaptive Cluster" (deprecated, low security) on server 102 signals a potential security risk that should be addressed.

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

The view `v_vpn_protocol_vpn_client_detail` joins protocols with the clients that use them, answering which clients are on each protocol. The row for protocol "Primary Review A" (untrusted rating) on client 4 suggests a client using a protocol with minimal security assurance.

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

The view `v_security_policy_vpn_server` joins security policies with the servers they govern, answering which servers fall under each policy. The row for "Seasonal Assessment D" (standard encryption, whitelist access) on server 101 provides a clear policy-to-server mapping.

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

The view `v_security_policy_network_segment` joins security policies with the network segments they apply to, answering which segments are governed by each policy. The row for "Integrated Survey" (high encryption, blacklist access) on segment 102 shows a tightly controlled network zone.

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

The view `v_network_segment_network_device_detail` joins network segments with the devices within them, answering which devices reside in each segment. The row for segment 100 ("Adaptive Series," isolated) containing device 1 ("Pilot Assessment," desktop) provides segment-level device inventory.

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

The view `v_network_segment_vpn_server` joins network segments with the servers that manage them, answering which server governs each segment. The row for segment 103 ("Compact Corridor," isolated) managed by server 103 (maintenance mode) indicates a segment under a server that is not actively serving traffic.

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

The view `v_network_device_vpn_client` joins network devices with the VPN clients they are associated with, answering which client each device connects through. The row for device 2 ("Baseline Survey," mobile, authenticated) on client 2 provides a clear device-to-client mapping.

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

The view `v_network_device_network_segment` joins network devices with their network segments, answering which segment each device belongs to. The row for device 3 ("Distributed Corridor A," IoT, not authenticated) in segment 102 ("Composite Survey D," open isolation) reveals an unauthenticated IoT device in a loosely controlled segment.

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

The view `v_network_device_data_packet_detail` joins network devices with the data packets they generate, answering which packets each device has produced. A row showing device 1 generating a packet with a specific bytes_transferred value enables device-level bandwidth analysis.

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

The view `v_data_packet_vpn_client` joins data packets with their originating VPN clients, answering which client generated each packet. The row for client 1 generating a packet confirms the client's active data transmission.

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

The view `v_data_packet_vpn_server` joins data packets with their destination VPN servers, answering which server received each packet. The row for server 100 receiving a packet confirms the server's role as a traffic destination.

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

The view `v_data_packet_network_device` joins data packets with the network devices that produced them, answering which device generated each packet. The row for device 4 ("Adaptive Series," server, authenticated) generating a packet provides a complete chain from authenticated device through client to server.

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

## Closing Synthesis

The VPN infrastructure domain captures a complete picture of network operations: servers that terminate tunnels, clients that initiate them, protocols that carry the traffic, policies that govern access, segments that partition the network, devices that serve as endpoints, and packets that represent the actual data flow. The relationship tables bind these entities into a coherent graph, while the analytical views flatten that graph into queryable forms. Practitioners use these records to monitor operational status, audit security posture, plan capacity, and troubleshoot connectivity issues. The concrete values—firmware versions, power consumption, encryption levels, isolation levels, authentication states—provide the granular detail needed for informed decision-making in a complex and evolving network environment.