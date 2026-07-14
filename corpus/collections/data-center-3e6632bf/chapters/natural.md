## Infrastructure Operations and Access Control

Modern data center operations demand coordinated management of physical facilities, computing hardware, network topology, and security systems. Organizations maintain detailed records of every component in their infrastructure estate, from the power supply reliability of a facility to the TLS version negotiated on a peering link. The domain under discussion captures this complexity through a set of interrelated records that track data centers, servers, remote access control systems (RACS), unified management modules (UMMS), network configurations, arbour systems, and the access events that occur across them. Understanding how these records relate to one another is essential for auditing, capacity planning, and incident response.

At the foundation of the estate are the data centers themselves—physical locations where computing and networking resources reside. Each center is characterized by its location name, power supply reliability, guarding schedule, access control level, whether it hosts a national interconnect, and the latency reduction strategy it employs.

**Table `data_centers`**

| id | location | power_supply_reliability | guarding_schedule | access_control_level | hosts_national_interconnect | latency_reduction_strategy |
|---|---|---|---|---|---|---|
| 1000 | extended-location-99 | high | regional-guarding-60 | multi-level | false | baseline-latency-37 |
| 1001 | integrated-location-100 | medium | legacy-guarding-61 | biometric | true | pilot-latency-38 |
| 1002 | seasonal-location-101 | low | compact-guarding-62 | surveillance | false | extended-latency-39 |
| 1003 | regional-location-102 | high | composite-guarding-63 | multi-level | true | integrated-latency-40 |

Consider the center at `extended-location-99` (id 1000). It operates with high power supply reliability, regional guarding on schedule 60, multi-level access control, and does not host a national interconnect. Its latency reduction strategy is `baseline-latency-37`. By contrast, `integrated-location-100` (id 1001) carries biometric access control, hosts a national interconnect, and runs `pilot-latency-38`. These attributes determine which servers and networks can be deployed at each site and what security posture is expected.

Servers represent the compute layer. Each server record carries a unique server identifier, an operating system type, whether a RACS client is installed, the access level granted to that server, the timestamp of its last log push, its operational status, and the RACS system that manages it.

**Table `servers`**

| id | server_id | os_type | racs_client_installed | access_level | last_log_push | status | r_a_c_s_id |
|---|---|---|---|---|---|---|---|
| 100 | 911352d5dab64576b7a6da51aa69d76d | extended-os-27 | Carlos Kennedy | command | 2022-09-22T08:12:00 | active | 1 |
| 101 | 1450637 | integrated-os-28 | Walter Pratt | directory | 2023-02-06T15:29:00 | inactive | 2 |
| 102 | 4985152 | seasonal-os-29 | Garrison Keillor | application | 2024-07-17T22:46:00 | maintenance | 3 |
| 103 | 9736887 | regional-os-30 | Stephanie Sutton | command | 2025-12-01T05:03:00 | active | 4 |

Server `911352d5dab64576b7a6da51aa69d76d` (id 100) runs `extended-os-27`, has a RACS client installed under the name Carlos Kennedy, holds command-level access, last pushed logs on 2022-09-22, and is currently active. It is managed by RACS system id 1. Server `1450637` (id 101), running `integrated-os-28` under Walter Pratt, holds directory-level access and is currently inactive, managed by RACS system id 2. The status field—active, inactive, or maintenance—provides an immediate signal of whether a server is available for production workloads.

The RACS systems are the security backbone of the operation. Each RACS instance has a system identifier, a version string, a deployment type, a high-availability flag, the date of its last audit, the compliance standard it adheres to, the UMMS module it is associated with, and a creation timestamp.

**Table `r_a_c_ses`**

| id | system_id | version | deployment_type | ha_enabled | last_audit_date | compliance_standard | u_m_m_id | created_at |
|---|---|---|---|---|---|---|---|---|
| 1 | 8189503 | seasonal-version-71 | compact-deployme-68 | false | 2023-10-23 | SOX | 100 | 2025-01-01 00:14:00 |
| 2 | 3717623 | regional-version-72 | composite-deployme-69 | true | 2024-03-07 | IT-GCC | 101 | 2025-02-06 03:14:00 |
| 3 | 7441161 | legacy-version-73 | primary-deployme-70 | false | 2025-08-18 | SOX | 102 | 2025-03-11 06:14:00 |
| 4 | 605963 | compact-version-74 | adaptive-deployme-71 | true | 2022-01-02 | IT-GCC | 103 | 2025-04-16 09:14:00 |

RACS system id 1 runs `seasonal-version-71` under a `compact-deployme-68` deployment type, does not have high availability enabled, was last audited on 2023-10-23, complies with SOX, and is linked to UMMS module 100. RACS system id 2, running `regional-version-72` with `composite-deployme-69`, has HA enabled, was audited on 2024-03-07, complies with IT-GCC, and maps to UMMS module 101. The compliance standard—either SOX or IT-GCC—dictates the regulatory framework under which the system operates.

UMMS records describe the unified management modules that underpin RACS deployments. Each module has a module identifier, a database type, an authentication protocol, the count of registered applications, a last sync date, a status, and creation and update timestamps.

**Table `u_m_ms`**

| u_m_m_id | module_id | database_type | authentication_protocol | registered_applications | last_sync_date | status | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|
| 100 | 13061773 | MySQL | adaptive-authenti-71 | 27 | 2023-10-02T09:39:00 | active | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 101 | template_ivacode_pagata_0 | LDAP | distributed-authenti-72 | 38 | 2024-03-13T16:56:00 | inactive | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 102 | 3744024 | MySQL | baseline-authenti-73 | 49 | 2025-08-24T23:13:00 | active | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 103 | 727063 | LDAP | pilot-authenti-74 | 60 | 2022-01-08T06:30:00 | inactive | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

UMMS module 100 uses MySQL as its database, `adaptive-authenti-71` for authentication, has 27 registered applications, last synced on 2023-10-02, and is currently active. UMMS module 101 relies on LDAP, `distributed-authenti-72`, 38 registered applications, and is inactive. The database type and authentication protocol together define the module's integration profile with external identity providers and data stores.

Access logs capture every authenticated interaction with a server. Each log entry has a log identifier, a timestamp, a user identifier, the server it targeted, the operation type (login, command, or file_access), the outcome status, the server that generated the log, and the RACS system responsible.

**Table `access_logs`**

| id | log_id | timestamp | user_id | server_id | operation_type | status | generated_by_server_id | r_a_c_s_id |
|---|---|---|---|---|---|---|---|---|
| 1 | d5dc19c8-8fc1-11eb-924d-9cd76263cbd0 | 2024-07-08T18:18:00 | 9736910 | 911352d5dab64576b7a6da51aa69d76d | login | success | 100 | 1 |
| 2 | 2618582 | 2025-12-19T01:35:00 | 40c1e50ce74c42d6801b1e2f409c1cfc | 1450637 | command | failure | 101 | 2 |
| 3 | 10449536 | 2022-05-03T08:52:00 | 92297f70-9bad-11eb-a8a2-19ed5c03f8d3 | 4985152 | file_access | success | 102 | 3 |
| 4 | 6564387 | 2023-10-14T15:09:00 | 9125634 | 9736887 | login | failure | 103 | 4 |

Log entry `d5dc19c8-8fc1-11eb-924d-9cd76263cbd0` (id 1) records a successful login by user 9736910 to server `911352d5dab64576b7a6da51aa69d76d` at 2024-07-08T18:18:00, generated by server 100 under RACS system 1. Log entry 2 (id 2) records a failed command execution by user `40c1e50ce74c42d6801b1e2f409c1cfc` on server `1450637` at 2025-12-19T01:35:00, generated by server 101 under RACS system 2. The operation_type and status fields together enable security teams to detect anomalous patterns such as repeated login failures.

Networks define the connectivity fabric. Each network record includes a network identifier, a peering type, whether a firewall is enabled, whether VPN is required, the TLS version in use, whether DDoS protection is active, and the arbour system it belongs to.

**Table `networks`**

| id | network_id | peering_i_s_ps | firewall_enabled | vpn_required | tls_version | ddos_protection_enabled | arbour_system_id |
|---|---|---|---|---|---|---|---|
| 1 | e6196808-8fd1-11eb-924d-9cd76263cbd0 | distributed-peering-48 | false | false | regional-tls-90 | true | 1 |
| 2 | 7441146 | baseline-peering-49 | true | true | legacy-tls-91 | false | 2 |
| 3 | 8387535 | pilot-peering-50 | false | false | compact-tls-92 | true | 3 |
| 4 | 6589 | extended-peering-51 | true | true | composite-tls-93 | false | 4 |

Network `e6196808-8fd1-11eb-924d-9cd76263cbd0` (id 1) uses `distributed-peering-48`, has no firewall, requires no VPN, negotiates `regional-tls-90`, has DDoS protection enabled, and is managed by arbour system 1. Network `7441146` (id 2) uses `baseline-peering-49`, has both firewall and VPN enabled, negotiates `legacy-tls-91`, lacks DDoS protection, and is managed by arbour system 2. The combination of firewall, VPN, and TLS settings determines the security posture of the peering link.

Arbour systems serve as the overarching network management and security controllers. Each arbour system is linked to one or more networks and provides centralized policy enforcement.

**Table `arbour_systems`**

| id | system_id | monitoring_schedule | alert_proactive | filtering_automatic | last_analysis_date | status | network_id |
|---|---|---|---|---|---|---|---|
| 1 | 8189503 | compact-monitori-56 | true | false | 2023-06-16T17:39:00 | active | 1 |
| 2 | 3717623 | composite-monitori-57 | false | true | 2024-11-27T00:56:00 | inactive | 2 |
| 3 | 7441161 | primary-monitori-58 | true | false | 2025-04-11T07:13:00 | active | 3 |
| 4 | 605963 | adaptive-monitori-59 | false | true | 2022-09-22T14:30:00 | inactive | 4 |

The junction tables establish the physical and logical placement of resources. The `centers_servers` table maps servers to the data centers they reside in, `centers_networks` maps networks to data centers, and `servers_logs` links access log entries to the servers they reference.

**Table `centers_servers`**

| data_center_id | server_id |
|---|---|
| 1000 | 100 |
| 1000 | 101 |
| 1001 | 101 |
| 1001 | 102 |
| 1002 | 102 |
| 1002 | 103 |
| 1003 | 103 |
| 1003 | 100 |

**Table `centers_networks`**

| data_center_id | network_id |
|---|---|
| 1000 | 1 |
| 1000 | 2 |
| 1001 | 2 |
| 1001 | 3 |
| 1002 | 3 |
| 1002 | 4 |
| 1003 | 4 |
| 1003 | 1 |

**Table `servers_logs`**

| server_id | access_log_id |
|---|---|
| 100 | 1 |
| 100 | 2 |
| 101 | 2 |
| 101 | 3 |
| 102 | 3 |
| 102 | 4 |
| 103 | 4 |
| 103 | 1 |

The `ses_servers` and `ses_logs` tables connect Secure Environment System (SES) records to servers and access logs respectively, providing an additional layer of environmental monitoring and event correlation.

**Table `ses_servers`**

| r_a_c_s_id | server_id |
|---|---|
| 1 | 100 |
| 1 | 101 |
| 2 | 101 |
| 2 | 102 |
| 3 | 102 |
| 3 | 103 |
| 4 | 103 |
| 4 | 100 |

**Table `ses_logs`**

| r_a_c_s_id | access_log_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

The `networks_centers` table establishes which networks are associated with which data centers, completing the topology map.

**Table `networks_centers`**

| network_id | data_center_id |
|---|---|
| 1 | 1000 |
| 1 | 1001 |
| 2 | 1001 |
| 2 | 1002 |
| 3 | 1002 |
| 3 | 1003 |
| 4 | 1003 |
| 4 | 1000 |

With the base tables in place, the domain provides a set of materialized views that join these records into actionable summaries. Each view answers a specific operational question.

The view `v_data_center_server_detail` joins data centers with their resident servers, answering which servers are deployed at each facility and what their operational status is.

**View `v_data_center_server_detail`**

```sql
CREATE VIEW v_data_center_server_detail AS
SELECT a.id, a.location, a.power_supply_reliability, b.id AS server_id, b.server_id AS server_server_id, b.os_type AS server_os_type
FROM data_centers a
  JOIN centers_servers j ON j.data_center_id = a.id
  JOIN servers b ON b.id = j.server_id;
```

| id | location | power_supply_reliability | server_id | server_server_id | server_os_type |
|---|---|---|---|---|---|
| 1000 | extended-location-99 | high | 100 | 911352d5dab64576b7a6da51aa69d76d | extended-os-27 |
| 1000 | extended-location-99 | high | 101 | 1450637 | integrated-os-28 |
| 1001 | integrated-location-100 | medium | 101 | 1450637 | integrated-os-28 |
| 1001 | integrated-location-100 | medium | 102 | 4985152 | seasonal-os-29 |
| 1002 | seasonal-location-101 | low | 102 | 4985152 | seasonal-os-29 |
| 1002 | seasonal-location-101 | low | 103 | 9736887 | regional-os-30 |
| 1003 | regional-location-102 | high | 103 | 9736887 | regional-os-30 |
| 1003 | regional-location-102 | high | 100 | 911352d5dab64576b7a6da51aa69d76d | extended-os-27 |

Reading a row from this view, one might see that data center `extended-location-99` (id 1000) hosts server `911352d5dab64576b7a6da51aa69d76d` (id 100), which is active and running `extended-os-27`. This tells an operations engineer that the server is online and ready for workload assignment. Another row might show `integrated-location-100` (id 1001) hosting server `1450637` (id 101), which is inactive—prompting a review of whether the server should be decommissioned or brought back online.

The view `v_data_center_network_detail` joins data centers with their associated networks, revealing the connectivity profile of each facility.

**View `v_data_center_network_detail`**

```sql
CREATE VIEW v_data_center_network_detail AS
SELECT a.id, a.location, a.power_supply_reliability, b.id AS network_id, b.network_id AS network_network_id, b.peering_i_s_ps AS network_peering_i_s_ps
FROM data_centers a
  JOIN centers_networks j ON j.data_center_id = a.id
  JOIN networks b ON b.id = j.network_id;
```

| id | location | power_supply_reliability | network_id | network_network_id | network_peering_i_s_ps |
|---|---|---|---|---|---|
| 1000 | extended-location-99 | high | 1 | e6196808-8fd1-11eb-924d-9cd76263cbd0 | distributed-peering-48 |
| 1000 | extended-location-99 | high | 2 | 7441146 | baseline-peering-49 |
| 1001 | integrated-location-100 | medium | 2 | 7441146 | baseline-peering-49 |
| 1001 | integrated-location-100 | medium | 3 | 8387535 | pilot-peering-50 |
| 1002 | seasonal-location-101 | low | 3 | 8387535 | pilot-peering-50 |
| 1002 | seasonal-location-101 | low | 4 | 6589 | extended-peering-51 |
| 1003 | regional-location-102 | high | 4 | 6589 | extended-peering-51 |
| 1003 | regional-location-102 | high | 1 | e6196808-8fd1-11eb-924d-9cd76263cbd0 | distributed-peering-48 |

A row from this view might show that `extended-location-99` (id 1000) is connected to network `e6196808-8fd1-11eb-924d-9cd76263cbd0` (id 1), which uses `distributed-peering-48`, has DDoS protection enabled, and negotiates `regional-tls-90`. This allows a network architect to verify that the facility meets the required security baseline.

The view `v_server_r_a_c_s` joins servers with their managing RACS systems, providing a clear mapping of which security system controls which server.

**View `v_server_r_a_c_s`**

```sql
CREATE VIEW v_server_r_a_c_s AS
SELECT a.id, a.server_id, a.os_type, a.racs_client_installed, b.id AS s_id, b.system_id AS s_system_id, b.version AS s_version
FROM servers a JOIN r_a_c_ses b ON a.r_a_c_s_id = b.id;
```

| id | server_id | os_type | racs_client_installed | s_id | s_system_id | s_version |
|---|---|---|---|---|---|---|
| 100 | 911352d5dab64576b7a6da51aa69d76d | extended-os-27 | Carlos Kennedy | 1 | 8189503 | seasonal-version-71 |
| 101 | 1450637 | integrated-os-28 | Walter Pratt | 2 | 3717623 | regional-version-72 |
| 102 | 4985152 | seasonal-os-29 | Garrison Keillor | 3 | 7441161 | legacy-version-73 |
| 103 | 9736887 | regional-os-30 | Stephanie Sutton | 4 | 605963 | compact-version-74 |

From this view, one can see that server `911352d5dab64576b7a6da51aa69d76d` (id 100) is managed by RACS system id 1, which runs `seasonal-version-71` under SOX compliance. This is critical for auditors who need to verify that every server is under a compliant RACS instance.

The view `v_server_access_log_detail` joins servers with their access logs, giving a complete picture of who accessed which server and what operations were performed.

**View `v_server_access_log_detail`**

```sql
CREATE VIEW v_server_access_log_detail AS
SELECT a.id, a.server_id, a.os_type, b.id AS log_id, b.log_id AS log_log_id, b.timestamp AS log_timestamp
FROM servers a
  JOIN servers_logs j ON j.server_id = a.id
  JOIN access_logs b ON b.id = j.access_log_id;
```

| id | server_id | os_type | log_id | log_log_id | log_timestamp |
|---|---|---|---|---|---|
| 100 | 911352d5dab64576b7a6da51aa69d76d | extended-os-27 | 1 | d5dc19c8-8fc1-11eb-924d-9cd76263cbd0 | 2024-07-08T18:18:00 |
| 100 | 911352d5dab64576b7a6da51aa69d76d | extended-os-27 | 2 | 2618582 | 2025-12-19T01:35:00 |
| 101 | 1450637 | integrated-os-28 | 2 | 2618582 | 2025-12-19T01:35:00 |
| 101 | 1450637 | integrated-os-28 | 3 | 10449536 | 2022-05-03T08:52:00 |
| 102 | 4985152 | seasonal-os-29 | 3 | 10449536 | 2022-05-03T08:52:00 |
| 102 | 4985152 | seasonal-os-29 | 4 | 6564387 | 2023-10-14T15:09:00 |
| 103 | 9736887 | regional-os-30 | 4 | 6564387 | 2023-10-14T15:09:00 |
| 103 | 9736887 | regional-os-30 | 1 | d5dc19c8-8fc1-11eb-924d-9cd76263cbd0 | 2024-07-08T18:18:00 |

A row from this view might show that server `911352d5dab64576b7a6da51aa69d76d` (id 100) received a successful login from user 9736910 at 2024-07-08T18:18:00. Another row might show server `1450637` (id 101) with a failed command execution by user `40c1e50ce74c42d6801b1e2f409c1cfc` at 2025-12-19T01:35:00. Security teams use this view to investigate incidents and trace the sequence of operations on a given server.

The view `v_r_a_c_s_server_detail` joins RACS systems with the servers they manage, answering which servers fall under each RACS instance's control.

**View `v_r_a_c_s_server_detail`**

```sql
CREATE VIEW v_r_a_c_s_server_detail AS
SELECT a.id, a.system_id, a.version, b.id AS server_id, b.server_id AS server_server_id, b.os_type AS server_os_type
FROM r_a_c_ses a
  JOIN ses_servers j ON j.r_a_c_s_id = a.id
  JOIN servers b ON b.id = j.server_id;
```

| id | system_id | version | server_id | server_server_id | server_os_type |
|---|---|---|---|---|---|
| 1 | 8189503 | seasonal-version-71 | 100 | 911352d5dab64576b7a6da51aa69d76d | extended-os-27 |
| 1 | 8189503 | seasonal-version-71 | 101 | 1450637 | integrated-os-28 |
| 2 | 3717623 | regional-version-72 | 101 | 1450637 | integrated-os-28 |
| 2 | 3717623 | regional-version-72 | 102 | 4985152 | seasonal-os-29 |
| 3 | 7441161 | legacy-version-73 | 102 | 4985152 | seasonal-os-29 |
| 3 | 7441161 | legacy-version-73 | 103 | 9736887 | regional-os-30 |
| 4 | 605963 | compact-version-74 | 103 | 9736887 | regional-os-30 |
| 4 | 605963 | compact-version-74 | 100 | 911352d5dab64576b7a6da51aa69d76d | extended-os-27 |

From this view, RACS system id 1 (running `seasonal-version-71`, SOX-compliant) manages server `911352d5dab64576b7a6da51aa69d76d` (id 100), which is active. RACS system id 2 (running `regional-version-72`, IT-GCC-compliant) manages server `1450637` (id 101), which is inactive. This view is essential for capacity planning within each RACS instance.

The view `v_r_a_c_s_u_m_m` joins RACS systems with their associated UMMS modules, revealing the management stack behind each RACS deployment.

**View `v_r_a_c_s_u_m_m`**

```sql
CREATE VIEW v_r_a_c_s_u_m_m AS
SELECT a.id, a.system_id, a.version, a.deployment_type, b.u_m_m_id AS m_u_m_m_id, b.module_id AS m_module_id, b.database_type AS m_database_type
FROM r_a_c_ses a JOIN u_m_ms b ON a.u_m_m_id = b.u_m_m_id;
```

| id | system_id | version | deployment_type | m_u_m_m_id | m_module_id | m_database_type |
|---|---|---|---|---|---|---|
| 1 | 8189503 | seasonal-version-71 | compact-deployme-68 | 100 | 13061773 | MySQL |
| 2 | 3717623 | regional-version-72 | composite-deployme-69 | 101 | template_ivacode_pagata_0 | LDAP |
| 3 | 7441161 | legacy-version-73 | primary-deployme-70 | 102 | 3744024 | MySQL |
| 4 | 605963 | compact-version-74 | adaptive-deployme-71 | 103 | 727063 | LDAP |

A row from this view shows that RACS system id 1 (SOX-compliant) is backed by UMMS module 100, which uses MySQL and `adaptive-authenti-71` with 27 registered applications. RACS system id 2 (IT-GCC-compliant) is backed by UMMS module 101, which uses LDAP and `distributed-authenti-72` with 38 registered applications. This view helps infrastructure teams understand the dependency chain from RACS down to the management module.

The view `v_r_a_c_s_access_log_detail` joins RACS systems with the access logs they generate, providing a compliance-oriented view of who accessed what under which RACS instance.

**View `v_r_a_c_s_access_log_detail`**

```sql
CREATE VIEW v_r_a_c_s_access_log_detail AS
SELECT a.id, a.system_id, a.version, b.id AS log_id, b.log_id AS log_log_id, b.timestamp AS log_timestamp
FROM r_a_c_ses a
  JOIN ses_logs j ON j.r_a_c_s_id = a.id
  JOIN access_logs b ON b.id = j.access_log_id;
```

| id | system_id | version | log_id | log_log_id | log_timestamp |
|---|---|---|---|---|---|
| 1 | 8189503 | seasonal-version-71 | 1 | d5dc19c8-8fc1-11eb-924d-9cd76263cbd0 | 2024-07-08T18:18:00 |
| 1 | 8189503 | seasonal-version-71 | 2 | 2618582 | 2025-12-19T01:35:00 |
| 2 | 3717623 | regional-version-72 | 2 | 2618582 | 2025-12-19T01:35:00 |
| 2 | 3717623 | regional-version-72 | 3 | 10449536 | 2022-05-03T08:52:00 |
| 3 | 7441161 | legacy-version-73 | 3 | 10449536 | 2022-05-03T08:52:00 |
| 3 | 7441161 | legacy-version-73 | 4 | 6564387 | 2023-10-14T15:09:00 |
| 4 | 605963 | compact-version-74 | 4 | 6564387 | 2023-10-14T15:09:00 |
| 4 | 605963 | compact-version-74 | 1 | d5dc19c8-8fc1-11eb-924d-9cd76263cbd0 | 2024-07-08T18:18:00 |

From this view, one can see that RACS system id 1 (SOX-compliant) generated log entry `d5dc19c8-8fc1-11eb-924d-9cd76263cbd0` (id 1), a successful login to server `911352d5dab64576b7a6da51aa69d76d`. RACS system id 2 (IT-GCC-compliant) generated log entry 2 (id 2), a failed command on server `1450637`. This view is particularly useful for regulatory audits that require per-RACS logging evidence.

The view `v_access_log_server` joins access logs with their target servers, answering which server each log entry pertains to.

**View `v_access_log_server`**

```sql
CREATE VIEW v_access_log_server AS
SELECT a.id, a.log_id, a.timestamp, a.user_id, b.id AS server_id, b.server_id AS server_server_id, b.os_type AS server_os_type
FROM access_logs a JOIN servers b ON a.generated_by_server_id = b.id;
```

| id | log_id | timestamp | user_id | server_id | server_server_id | server_os_type |
|---|---|---|---|---|---|---|
| 1 | d5dc19c8-8fc1-11eb-924d-9cd76263cbd0 | 2024-07-08T18:18:00 | 9736910 | 100 | 911352d5dab64576b7a6da51aa69d76d | extended-os-27 |
| 2 | 2618582 | 2025-12-19T01:35:00 | 40c1e50ce74c42d6801b1e2f409c1cfc | 101 | 1450637 | integrated-os-28 |
| 3 | 10449536 | 2022-05-03T08:52:00 | 92297f70-9bad-11eb-a8a2-19ed5c03f8d3 | 102 | 4985152 | seasonal-os-29 |
| 4 | 6564387 | 2023-10-14T15:09:00 | 9125634 | 103 | 9736887 | regional-os-30 |

A row from this view might show that log entry `d5dc19c8-8fc1-11eb-924d-9cd76263cbd0` (id 1) targets server `911352d5dab64576b7a6da51aa69d76d` (id 100), which runs `extended-os-27` and is active. This view is useful for correlating log events with server health and configuration data.

The view `v_access_log_r_a_c_s` joins access logs with their managing RACS systems, answering which RACS instance is responsible for each logged event.

**View `v_access_log_r_a_c_s`**

```sql
CREATE VIEW v_access_log_r_a_c_s AS
SELECT a.id, a.log_id, a.timestamp, a.user_id, b.id AS s_id, b.system_id AS s_system_id, b.version AS s_version
FROM access_logs a JOIN r_a_c_ses b ON a.r_a_c_s_id = b.id;
```

| id | log_id | timestamp | user_id | s_id | s_system_id | s_version |
|---|---|---|---|---|---|---|
| 1 | d5dc19c8-8fc1-11eb-924d-9cd76263cbd0 | 2024-07-08T18:18:00 | 9736910 | 1 | 8189503 | seasonal-version-71 |
| 2 | 2618582 | 2025-12-19T01:35:00 | 40c1e50ce74c42d6801b1e2f409c1cfc | 2 | 3717623 | regional-version-72 |
| 3 | 10449536 | 2022-05-03T08:52:00 | 92297f70-9bad-11eb-a8a2-19ed5c03f8d3 | 3 | 7441161 | legacy-version-73 |
| 4 | 6564387 | 2023-10-14T15:09:00 | 9125634 | 4 | 605963 | compact-version-74 |

From this view, log entry `d5dc19c8-8fc1-11eb-924d-9cd76263cbd0` (id 1) is managed by RACS system id 1, which runs `seasonal-version-71` and complies with SOX. Log entry 2 (id 2) is managed by RACS system id 2, which runs `regional-version-72` and complies with IT-GCC. This view enables compliance teams to trace every access event back to its governing RACS instance and its applicable regulatory standard.

The view `v_network_data_center_detail` joins networks with their associated data centers, answering which facility each network serves.

**View `v_network_data_center_detail`**

```sql
CREATE VIEW v_network_data_center_detail AS
SELECT a.id, a.network_id, a.peering_i_s_ps, b.id AS center_id, b.location AS center_location, b.power_supply_reliability AS center_power_supply_reliability
FROM networks a
  JOIN networks_centers j ON j.network_id = a.id
  JOIN data_centers b ON b.id = j.data_center_id;
```

| id | network_id | peering_i_s_ps | center_id | center_location | center_power_supply_reliability |
|---|---|---|---|---|---|
| 1 | e6196808-8fd1-11eb-924d-9cd76263cbd0 | distributed-peering-48 | 1000 | extended-location-99 | high |
| 1 | e6196808-8fd1-11eb-924d-9cd76263cbd0 | distributed-peering-48 | 1001 | integrated-location-100 | medium |
| 2 | 7441146 | baseline-peering-49 | 1001 | integrated-location-100 | medium |
| 2 | 7441146 | baseline-peering-49 | 1002 | seasonal-location-101 | low |
| 3 | 8387535 | pilot-peering-50 | 1002 | seasonal-location-101 | low |
| 3 | 8387535 | pilot-peering-50 | 1003 | regional-location-102 | high |
| 4 | 6589 | extended-peering-51 | 1003 | regional-location-102 | high |
| 4 | 6589 | extended-peering-51 | 1000 | extended-location-99 | high |

A row from this view might show that network `e6196808-8fd1-11eb-924d-9cd76263cbd0` (id 1), which uses `distributed-peering-48` and has DDoS protection enabled, serves data center `extended-location-99` (id 1000). This view helps network engineers verify that each facility has the required connectivity and security configurations.

The view `v_network_arbour_system` joins networks with their managing arbour systems, revealing which arbour system controls which network.

**View `v_network_arbour_system`**

```sql
CREATE VIEW v_network_arbour_system AS
SELECT a.id, a.network_id, a.peering_i_s_ps, a.firewall_enabled, b.id AS system_id, b.system_id AS system_system_id, b.monitoring_schedule AS system_monitoring_schedule
FROM networks a JOIN arbour_systems b ON a.arbour_system_id = b.id;
```

| id | network_id | peering_i_s_ps | firewall_enabled | system_id | system_system_id | system_monitoring_schedule |
|---|---|---|---|---|---|---|
| 1 | e6196808-8fd1-11eb-924d-9cd76263cbd0 | distributed-peering-48 | false | 1 | 8189503 | compact-monitori-56 |
| 2 | 7441146 | baseline-peering-49 | true | 2 | 3717623 | composite-monitori-57 |
| 3 | 8387535 | pilot-peering-50 | false | 3 | 7441161 | primary-monitori-58 |
| 4 | 6589 | extended-peering-51 | true | 4 | 605963 | adaptive-monitori-59 |

From this view, network `e6196808-8fd1-11eb-924d-9cd76263cbd0` (id 1) is managed by arbour system 1, which uses `distributed-peering-48` and has DDoS protection enabled. Network `7441146` (id 2) is managed by arbour system 2, which uses `baseline-peering-49` and has both firewall and VPN enabled. This view is essential for understanding the hierarchy of network management.

The view `v_arbour_system_network` joins arbour systems with their associated networks, answering which networks fall under each arbour system's jurisdiction.

**View `v_arbour_system_network`**

```sql
CREATE VIEW v_arbour_system_network AS
SELECT a.id, a.system_id, a.monitoring_schedule, a.alert_proactive, b.id AS network_id, b.network_id AS network_network_id, b.peering_i_s_ps AS network_peering_i_s_ps
FROM arbour_systems a JOIN networks b ON a.network_id = b.id;
```

| id | system_id | monitoring_schedule | alert_proactive | network_id | network_network_id | network_peering_i_s_ps |
|---|---|---|---|---|---|---|
| 1 | 8189503 | compact-monitori-56 | true | 1 | e6196808-8fd1-11eb-924d-9cd76263cbd0 | distributed-peering-48 |
| 2 | 3717623 | composite-monitori-57 | false | 2 | 7441146 | baseline-peering-49 |
| 3 | 7441161 | primary-monitori-58 | true | 3 | 8387535 | pilot-peering-50 |
| 4 | 605963 | adaptive-monitori-59 | false | 4 | 6589 | extended-peering-51 |

A row from this view might show that arbour system 1 manages network `e6196808-8fd1-11eb-924d-9cd76263cbd0` (id 1), which uses `distributed-peering-48` and has DDoS protection enabled. Arbour system 2 manages network `7441146` (id 2), which uses `baseline-peering-49` and has firewall and VPN enabled. This view provides a top-down perspective on network management responsibility.

Together, these tables and views form a comprehensive record of an organization's data center operations. The base tables capture the static configuration of facilities, servers, networks, and security systems, while the access logs record the dynamic events that occur within that infrastructure. The junction tables establish the physical and logical relationships between these entities, and the views synthesize these relationships into actionable summaries for operations, security, and compliance teams. Understanding this structure allows practitioners to answer questions about server placement, network topology, RACS coverage, access patterns, and compliance posture with precision.