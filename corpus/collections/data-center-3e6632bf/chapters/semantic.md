In the infrastructure management domain, organizations maintain a distributed fleet of data centers, each housing servers that run critical applications under the governance of Remote Access Control Systems (RACS). These systems enforce compliance standards, log every access event, and interconnect through a network fabric managed by arbour systems. The relational schema captures this ecosystem as a set of normalized base tables linked by foreign keys and junction tables, with materialized views reconstructing domain facts for operational reporting.

## The Core Entity Hierarchy

The foundation of the model rests on seven base tables that encode the principal entity types and their attributes.

**Table `data_centers`**

| id | location | power_supply_reliability | guarding_schedule | access_control_level | hosts_national_interconnect | latency_reduction_strategy |
|---|---|---|---|---|---|---|
| 1000 | extended-location-99 | high | regional-guarding-60 | multi-level | false | baseline-latency-37 |
| 1001 | integrated-location-100 | medium | legacy-guarding-61 | biometric | true | pilot-latency-38 |
| 1002 | seasonal-location-101 | low | compact-guarding-62 | surveillance | false | extended-latency-39 |
| 1003 | regional-location-102 | high | composite-guarding-63 | multi-level | true | integrated-latency-40 |

The `data_centers` table stores one row per facility, keyed by a surrogate integer `id` (1000 through 1003 in the sample). Each center carries descriptive and operational attributes: `location` holds human-readable identifiers such as `extended-location-99` or `regional-location-102`; `power_supply_reliability` is a categorical column with values like `high`, `medium`, and `low`; `guarding_schedule` encodes the physical security regime (e.g., `regional-guarding-60`, `legacy-guarding-61`); `access_control_level` distinguishes between `multi-level`, `biometric`, and `surveillance` tiers; `hosts_national_interconnect` is a boolean flag indicating whether the center connects to a national backbone; and `latency_reduction_strategy` captures the network optimization approach, with values such as `baseline-latency-37` and `pilot-latency-38`.

**Table `servers`**

| id | server_id | os_type | racs_client_installed | access_level | last_log_push | status | r_a_c_s_id |
|---|---|---|---|---|---|---|---|
| 100 | 911352d5dab64576b7a6da51aa69d76d | extended-os-27 | Carlos Kennedy | command | 2022-09-22T08:12:00 | active | 1 |
| 101 | 1450637 | integrated-os-28 | Walter Pratt | directory | 2023-02-06T15:29:00 | inactive | 2 |
| 102 | 4985152 | seasonal-os-29 | Garrison Keillor | application | 2024-07-17T22:46:00 | maintenance | 3 |
| 103 | 9736887 | regional-os-30 | Stephanie Sutton | command | 2025-12-01T05:03:00 | active | 4 |

The `servers` table represents individual compute nodes. Its primary key is the integer `id` (100–103 in the sample), while `server_id` stores a distinct identifier — either a UUID-style string like `911352d5dab64576b7a6da51aa69d76d` or a numeric code such as `1450637`. The `os_type` column classifies the operating system (e.g., `extended-os-27`, `integrated-os-28`), and `racs_client_installed` records the name of the installed RACS client agent (e.g., `Carlos Kennedy`, `Walter Pratt`). The `access_level` attribute takes values like `command`, `directory`, and `application`; `last_log_push` is a timestamp (e.g., `2022-09-22T08:12:00`); `status` is an enum over `active`, `inactive`, and `maintenance`; and `r_a_c_s_id` is a foreign key referencing the `r_a_c_ses` table, binding each server to its governing RACS instance.

**Table `r_a_c_ses`**

| id | system_id | version | deployment_type | ha_enabled | last_audit_date | compliance_standard | u_m_m_id | created_at |
|---|---|---|---|---|---|---|---|---|
| 1 | 8189503 | seasonal-version-71 | compact-deployme-68 | false | 2023-10-23 | SOX | 100 | 2025-01-01 00:14:00 |
| 2 | 3717623 | regional-version-72 | composite-deployme-69 | true | 2024-03-07 | IT-GCC | 101 | 2025-02-06 03:14:00 |
| 3 | 7441161 | legacy-version-73 | primary-deployme-70 | false | 2025-08-18 | SOX | 102 | 2025-03-11 06:14:00 |
| 4 | 605963 | compact-version-74 | adaptive-deployme-71 | true | 2022-01-02 | IT-GCC | 103 | 2025-04-16 09:14:00 |

The `r_a_c_ses` table defines the Remote Access Control Systems themselves. Its surrogate key `id` (1–4) identifies each RACS deployment. The `system_id` column stores a numeric identifier (e.g., `8189503`, `3717623`), `version` holds a semantic version string such as `seasonal-version-71`, and `deployment_type` categorizes the rollout pattern (`compact-deployme-68`, `composite-deployme-69`, `primary-deployme-70`, `adaptive-deployme-71`). The boolean `ha_enabled` flag indicates high-availability configuration, while `last_audit_date` records the most recent compliance audit (e.g., `2023-10-23`). The `compliance_standard` column constrains the RACS to a regulatory framework — either `SOX` or `IT-GCC` — and `u_m_m_id` is a foreign key pointing to the `u_m_ms` table, linking the RACS to its underlying module. The `created_at` timestamp (e.g., `2025-01-01 00:14:00`) records deployment time.

**Table `u_m_ms`**

| u_m_m_id | module_id | database_type | authentication_protocol | registered_applications | last_sync_date | status | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|
| 100 | 13061773 | MySQL | adaptive-authenti-71 | 27 | 2023-10-02T09:39:00 | active | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 101 | template_ivacode_pagata_0 | LDAP | distributed-authenti-72 | 38 | 2024-03-13T16:56:00 | inactive | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 102 | 3744024 | MySQL | baseline-authenti-73 | 49 | 2025-08-24T23:13:00 | active | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 103 | 727063 | LDAP | pilot-authenti-74 | 60 | 2022-01-08T06:30:00 | inactive | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The `u_m_ms` table captures the module-level configuration that underpins each RACS instance. Its primary key is `u_m_m_id` (100–103), which is referenced by `r_a_c_ses.u_m_m_id`. The `module_id` column stores either a numeric identifier (`13061773`, `3744024`, `727063`) or a template string (`template_ivacode_pagata_0`). The `database_type` attribute is categorical, taking values `MySQL` or `LDAP` (the latter also serving as the `authentication_protocol` value in some rows). The `registered_applications` column holds an integer count (27, 38, 49, 60), `last_sync_date` is a timestamp (e.g., `2023-10-02T09:39:00`), and `status` is an enum over `active` and `inactive`. The `created_at` and `updated_at` columns track the module's lifecycle.

**Table `access_logs`**

| id | log_id | timestamp | user_id | server_id | operation_type | status | generated_by_server_id | r_a_c_s_id |
|---|---|---|---|---|---|---|---|---|
| 1 | d5dc19c8-8fc1-11eb-924d-9cd76263cbd0 | 2024-07-08T18:18:00 | 9736910 | 911352d5dab64576b7a6da51aa69d76d | login | success | 100 | 1 |
| 2 | 2618582 | 2025-12-19T01:35:00 | 40c1e50ce74c42d6801b1e2f409c1cfc | 1450637 | command | failure | 101 | 2 |
| 3 | 10449536 | 2022-05-03T08:52:00 | 92297f70-9bad-11eb-a8a2-19ed5c03f8d3 | 4985152 | file_access | success | 102 | 3 |
| 4 | 6564387 | 2023-10-14T15:09:00 | 9125634 | 9736887 | login | failure | 103 | 4 |

The `access_logs` table records every access event. Its surrogate key `id` (1–4) identifies each log entry, while `log_id` stores a distinct event identifier — either a UUID (`d5dc19c8-8fc1-11eb-924d-9cd76263cbd0`) or a numeric code (`2618582`, `10449536`). The `timestamp` column (e.g., `2024-07-08T18:18:00`) records when the event occurred. The `user_id` column identifies the actor, using UUIDs (`9736910`, `40c1e50ce74c42d6801b1e2f409c1cfc`) or numeric codes (`9125634`). The `server_id` column references the target server (matching `servers.server_id`), `operation_type` is categorical (`login`, `command`, `file_access`), and `status` records `success` or `failure`. The `generated_by_server_id` column is a foreign key to `servers.id`, indicating which server generated the log. The `r_a_c_s_id` column is a foreign key to `r_a_c_ses.id`, binding the log to its governing RACS.

**Table `networks`**

| id | network_id | peering_i_s_ps | firewall_enabled | vpn_required | tls_version | ddos_protection_enabled | arbour_system_id |
|---|---|---|---|---|---|---|---|
| 1 | e6196808-8fd1-11eb-924d-9cd76263cbd0 | distributed-peering-48 | false | false | regional-tls-90 | true | 1 |
| 2 | 7441146 | baseline-peering-49 | true | true | legacy-tls-91 | false | 2 |
| 3 | 8387535 | pilot-peering-50 | false | false | compact-tls-92 | true | 3 |
| 4 | 6589 | extended-peering-51 | true | true | composite-tls-93 | false | 4 |

The `networks` table describes the network fabric. Its surrogate key `id` (1–4) identifies each network. The `network_id` column stores a distinct identifier — either a UUID (`e6196808-8fd1-11eb-924d-9cd76263cbd0`) or a numeric code (`7441146`, `8387535`, `6589`). The `peering_i_s_ps` column classifies the peering strategy (e.g., `distributed-peering-48`, `baseline-peering-49`). Boolean flags `firewall_enabled` and `vpn_required` indicate security posture, `tls_version` stores the TLS configuration (e.g., `regional-tls-90`, `legacy-tls-91`), `ddos_protection_enabled` is a boolean, and `arbour_system_id` is a foreign key to the `arbour_systems` table, linking the network to its managing arbour system.

**Table `arbour_systems`**

| id | system_id | monitoring_schedule | alert_proactive | filtering_automatic | last_analysis_date | status | network_id |
|---|---|---|---|---|---|---|---|
| 1 | 8189503 | compact-monitori-56 | true | false | 2023-06-16T17:39:00 | active | 1 |
| 2 | 3717623 | composite-monitori-57 | false | true | 2024-11-27T00:56:00 | inactive | 2 |
| 3 | 7441161 | primary-monitori-58 | true | false | 2025-04-11T07:13:00 | active | 3 |
| 4 | 605963 | adaptive-monitori-59 | false | true | 2022-09-22T14:30:00 | inactive | 4 |

The `arbour_systems` table defines the arbour systems that manage the network fabric. Each row represents one arbour system, with its surrogate key `id` (1–4) referenced by `networks.arbour_system_id`. The table captures the arbour system's identity and operational parameters, serving as the parent entity in the networks-to-arbour-systems relationship.

## Junction Tables and Many-to-Many Relationships

Several relationships in this domain are many-to-many, requiring junction tables to materialize the associations in normalized form.

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

The `centers_servers` junction table links `data_centers` to `servers`. Each row represents an assignment of a server to a data center, with foreign keys pointing to `data_centers.id` and `servers.id`. This table captures the physical or logical placement of servers within data centers, allowing a single server to be associated with multiple centers and vice versa.

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

The `centers_networks` junction table associates `data_centers` with `networks`. Each row encodes a connection between a data center and a network, with foreign keys referencing `data_centers.id` and `networks.id`. This enables a data center to span multiple networks and a network to serve multiple centers.

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

The `servers_logs` junction table connects `servers` to `access_logs`. Each row represents a server's participation in an access log event, with foreign keys pointing to `servers.id` and `access_logs.id`. This decouples the log entries from the servers they reference, supporting the many-to-many relationship where a server generates multiple logs and a log entry may reference multiple servers.

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

The `ses_servers` junction table links `r_a_c_ses` to `servers`. Each row indicates that a RACS instance governs a particular server, with foreign keys referencing `r_a_c_ses.id` and `servers.id`. While `servers.r_a_c_s_id` already provides a direct foreign key from server to RACS, this junction table supports the many-to-many variant where a RACS can manage multiple servers and a server can be governed by multiple RACS instances.

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

The `ses_logs` junction table connects `r_a_c_ses` to `access_logs`. Each row records that a RACS instance is responsible for an access log event, with foreign keys pointing to `r_a_c_ses.id` and `access_logs.id`. This complements the direct `access_logs.r_a_c_s_id` foreign key, enabling many-to-many associations between RACS deployments and log events.

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

The `networks_centers` junction table associates `networks` with `data_centers`. Each row encodes a network-to-center connection, with foreign keys referencing `networks.id` and `data_centers.id`. This table mirrors the `centers_networks` relationship from the opposite direction, ensuring bidirectional navigability between networks and data centers.

## Materialized Views: Reconstructing Domain Facts

The normalized base tables and junction tables are combined through a set of materialized views that reconstruct domain facts for operational reporting. Each view performs a specific join to answer a concrete question about the infrastructure.

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

The `v_data_center_server_detail` view joins `data_centers` with `servers` through the `centers_servers` junction table, producing a denormalized row per server-center assignment. This view answers the question: "Which servers reside in which data centers, and what are their operational attributes?" For example, a row might show that server `911352d5dab64576b7a6da51aa69d76d` (running `extended-os-27`, status `active`) is hosted in data center `extended-location-99` (power reliability `high`, access control `multi-level`). The view concatenates the center's `location`, `power_supply_reliability`, and `latency_reduction_strategy` with the server's `os_type`, `access_level`, and `status`, enabling administrators to assess server placement quality at a glance.

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

The `v_data_center_network_detail` view joins `data_centers` with `networks` through the `centers_networks` junction table, producing a row per center-network pairing. This view answers: "Which networks serve which data centers, and what are their security configurations?" A sample row might pair data center `regional-location-102` (power reliability `low`, guarding schedule `compact-guarding-62`) with network `8387535` (peering `pilot-peering-50`, firewall `false`, VPN `false`, TLS `compact-tls-92`, DDoS protection `true`). The view exposes both the center's operational profile and the network's security posture in a single row, facilitating capacity and security audits.

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

The `v_server_r_a_c_s` view joins `servers` with `r_a_c_ses` through the `ses_servers` junction table (or directly via `servers.r_a_c_s_id`), producing a row per server-RACS pairing. This view answers: "Which RACS governs each server, and what are the RACS's compliance and deployment characteristics?" A representative row might show server `1450637` (OS `integrated-os-28`, access level `directory`, status `inactive`) governed by RACS `3717623` (version `regional-version-72`, deployment `composite-deployme-69`, HA enabled, compliance standard `IT-GCC`). The view enables compliance officers to verify that every active server is covered by a compliant RACS instance.

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

The `v_server_access_log_detail` view joins `servers` with `access_logs` through the `servers_logs` junction table, producing a row per log entry enriched with server context. This view answers: "What access events occurred on each server, and what were their outcomes?" A sample row might show log `d5dc19c8-8fc1-11eb-924d-9cd76263cbd0` (timestamp `2024-07-08T18:18:00`, operation `login`, status `success`) on server `911352d5dab64576b7a6da51aa69d76d` (OS `extended-os-27`, status `active`). The view allows security teams to correlate access patterns with server status and operating system type.

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

The `v_r_a_c_s_server_detail` view joins `r_a_c_ses` with `servers` through the `ses_servers` junction table, producing a row per RACS-server pairing. This view answers: "Which servers are managed by each RACS, and what are their operational states?" A representative row might show RACS `8189503` (version `seasonal-version-71`, deployment `compact-deployme-68`, compliance `SOX`) managing server `911352d5dab64576b7a6da51aa69d76d` (OS `extended-os-27`, access level `command`, status `active`). This view supports RACS capacity planning and compliance auditing by revealing the server portfolio of each RACS instance.

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

The `v_r_a_c_s_u_m_m` view joins `r_a_c_ses` with `u_m_ms` on the `u_m_m_id` foreign key, producing a row per RACS-module pairing. This view answers: "Which module configuration underpins each RACS, and what is the module's operational status?" A sample row might show RACS `7441161` (version `legacy-version-73`, compliance `SOX`) backed by module `3744024` (database `MySQL`, authentication `baseline-authenti-73`, 49 registered applications, status `active`). The view enables infrastructure architects to trace RACS deployments back to their module configurations and identify modules that are inactive while still serving active RACS instances.

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

The `v_r_a_c_s_access_log_detail` view joins `r_a_c_ses` with `access_logs` through the `ses_logs` junction table, producing a row per RACS-log pairing. This view answers: "Which access events fall under the governance of each RACS, and what were their outcomes?" A representative row might show RACS `605963` (version `compact-version-74`, deployment `adaptive-deployme-71`, compliance `IT-GCC`) governing log `6564387` (timestamp `2023-10-14T15:09:00`, operation `login`, status `failure`). This view supports compliance reporting by aggregating access events by RACS and compliance standard.

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

The `v_access_log_server` view joins `access_logs` with `servers` on the `server_id` foreign key (or through `servers_logs`), producing a row per log entry enriched with server details. This view answers: "What server was targeted by each access event, and what is its current status?" A sample row might show log `10449536` (timestamp `2022-05-03T08:52:00`, operation `file_access`, status `success`) targeting server `4985152` (OS `seasonal-os-29`, access level `application`, status `maintenance`). The view enables post-incident analysis by correlating access outcomes with server operational states.

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

The `v_access_log_r_a_c_s` view joins `access_logs` with `r_a_c_ses` on the `r_a_c_s_id` foreign key, producing a row per log entry enriched with RACS context. This view answers: "Which RACS governed each access event, and what compliance standard applies?" A representative row might show log `2618582` (timestamp `2025-12-19T01:35:00`, operation `command`, status `failure`) governed by RACS `3717623` (version `regional-version-72`, compliance `IT-GCC`, HA enabled). The view supports regulatory reporting by grouping access events by compliance standard and RACS deployment type.

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

The `v_network_data_center_detail` view joins `networks` with `data_centers` through the `networks_centers` junction table, producing a row per network-center pairing. This view answers: "Which data centers are served by each network, and what are their operational profiles?" A sample row might pair network `7441146` (peering `baseline-peering-49`, firewall `true`, VPN `true`, TLS `legacy-tls-91`, DDoS protection `false`) with data center `integrated-location-100` (power reliability `medium`, guarding schedule `legacy-guarding-61`, access control `biometric`). The view enables network architects to assess whether network security configurations align with data center access control requirements.

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

The `v_network_arbour_system` view joins `networks` with `arbour_systems` on the `arbour_system_id` foreign key, producing a row per network-arbour-system pairing. This view answers: "Which arbour system manages each network, and what are the network's security settings?" A representative row might show network `e6196808-8fd1-11eb-924d-9cd76263cbd0` (peering `distributed-peering-48`, firewall `false`, VPN `false`, TLS `regional-tls-90`, DDoS protection `true`) managed by arbour system `1`. The view supports network governance audits by revealing the arbour-system-to-network mapping alongside security posture.

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

The `v_arbour_system_network` view joins `arbour_systems` with `networks` on the `arbour_system_id` foreign key, producing a row per arbour-system-network pairing. This view answers: "Which networks are managed by each arbour system, and what are their configurations?" A sample row might show arbour system `2` managing network `7441146` (peering `baseline-peering-49`, firewall `true`, VPN `true`, TLS `legacy-tls-91`). The view provides a top-down perspective on arbour system responsibilities, enabling administrators to verify that each arbour system's network portfolio matches its operational capacity.

## Synthesis

The relational schema models the infrastructure management domain as a hierarchy of entities — data centers, servers, RACS instances, modules, access logs, networks, and arbour systems — connected through foreign keys and junction tables that capture many-to-many relationships. Each base table normalizes a distinct entity type into columns that reflect its attributes, with surrogate integer keys providing stable identifiers. The junction tables (`centers_servers`, `centers_networks`, `servers_logs`, `ses_servers`, `ses_logs`, `networks_centers`) materialize the associative relationships that cannot be expressed through simple foreign keys. The materialized views then reconstruct domain facts by joining these normalized tables, producing denormalized result sets that answer specific operational questions — from server placement and compliance coverage to access event analysis and network governance. This architecture separates the concerns of data storage (normalized base tables) from data consumption (denormalized views), enabling both referential integrity and analytical clarity.