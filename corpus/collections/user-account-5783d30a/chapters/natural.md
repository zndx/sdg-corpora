## Identity and Access in Managed Device Environments

Organizations that deploy and maintain fleets of computing devices must track a complex web of relationships between user identities, authentication materials, hardware assets, and the network services those assets consume. In this domain, every Macintosh workstation is assigned to a user account, each account carries password credentials, and every device connects to configured network environments that expose specific services. The records below capture these relationships at a granular level, enabling administrators to audit access, verify credential freshness, and understand which devices communicate with which services. The data model supports both operational queries—such as "which accounts have expired passwords?"—and investigative ones, such as tracing a credential back through the account it belongs to, the device it was last used on, and the network service it authenticates against.

**Table `user_accounts`**

| account_id | username | last_password_change_date | password_expiry_days | account_status | mac_book_pro_id |
|---|---|---|---|---|---|
| fbc33b0c-9bac-11eb-a8a2-19ed5c03f8d3 | Pilot Review | 2022-09-19T20:36:00 | 47 | active | 1000 |
| 10207152 | Baseline Initiative | 2023-02-03T03:53:00 | 55 | locked | 1001 |
| a4afb8ee-9bad-11eb-a8a2-19ed5c03f8d3 | Distributed Model A | 2024-07-14T10:10:00 | 63 | expired | 1002 |
| 3717632 | Adaptive Cluster | 2025-12-25T17:27:00 | 71 | active | 1003 |

The user account table forms the anchor of the identity layer. Each row represents a distinct account identified by a UUID or numeric identifier, with a human-readable username such as "Pilot Review" or "Adaptive Cluster." The `last_password_change_date` column records the most recent password rotation, while `password_expiry_days` indicates the policy window before the credential must be renewed. The `account_status` field classifies each account as active, locked, or expired. For example, the account "Pilot Review" (fbc33b0c-9bac-11eb-a8a2-19ed5c03f8d3) is active with a 47-day expiry window, whereas "Distributed Model A" (a4afb8ee-9bad-11eb-a8a2-19ed5c03f8d3) has expired. Each account is also linked to a specific Macintosh workstation via `mac_book_pro_id`, establishing a direct one-to-one mapping between the identity and the hardware it operates on.

**Table `password_credentials`**

| password_credential_id | credential_id | hash_algorithm | strength_level | is_expired | rotation_policy_id | account_id | service_id |
|---|---|---|---|---|---|---|---|
| 1 | 168538 | primary-hash-34 | 42 | true | 7441163 | fbc33b0c-9bac-11eb-a8a2-19ed5c03f8d3 | 1996925 |
| 2 | default_chart_a_tax_10 | adaptive-hash-35 | 46 | false | 1450635 | 10207152 | 3990164 |
| 3 | ChIJIbRFlPtt5kcR5kM81XdpSfI | distributed-hash-36 | 50 | true | 10782173 | a4afb8ee-9bad-11eb-a8a2-19ed5c03f8d3 | 5844258 |
| 4 | 2002007020220 | baseline-hash-37 | 54 | false | IVC20det40 | 3717632 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 |

Password credentials store the cryptographic materials that authenticate users to services. Each credential row carries a unique `password_credential_id`, a `credential_id` that may be numeric or alphanumeric, and a `hash_algorithm` designation such as primary-hash-34 or adaptive-hash-35. The `strength_level` column provides a numeric measure of credential robustness, ranging from 42 to 54 in the current dataset. The `is_expired` flag distinguishes between valid and expired credentials, while `rotation_policy_id` ties the credential to a rotation schedule. Each credential is associated with an `account_id` and a `service_id`, indicating which user owns the credential and which network service it authenticates to. The credential with ID 4, for instance, belongs to account 3717632 (Adaptive Cluster) and is linked to service e29bafe2-8fd1-11eb-924d-9cd76263cbd0, using baseline-hash-37 with a strength level of 54.

**Table `mac_book_pros`**

| mac_book_pro_id | serial_number | model_identifier | os_version | last_reboot_date | is_reboot_required | account_id | network_configuration_id |
|---|---|---|---|---|---|---|---|
| 1000 | 5844275 | MOD-2065 | integrated-os-46 | 2024-07-06T06:18:00 | true | fbc33b0c-9bac-11eb-a8a2-19ed5c03f8d3 | 1 |
| 1001 | 69422 | MOD-2070 | seasonal-os-47 | 2025-12-17T13:35:00 | false | 10207152 | 2 |
| 1002 | 7731874 | MOD-2075 | regional-os-48 | 2022-05-01T20:52:00 | true | a4afb8ee-9bad-11eb-a8a2-19ed5c03f8d3 | 3 |
| 1003 | 10445632 | MOD-2080 | legacy-os-49 | 2023-10-12T03:09:00 | false | 3717632 | 4 |

The device inventory table catalogs every Macintosh workstation under management. Each entry is identified by a `mac_book_pro_id` and includes a `serial_number`, a `model_identifier` such as MOD-2065 or MOD-2080, and the `os_version` currently installed—ranging from integrated-os-46 to legacy-os-49. The `last_reboot_date` records the most recent system restart, and `is_reboot_required` flags devices pending a reboot. Each device is assigned to a user account through `account_id` and connected to a network environment via `network_configuration_id`. Device 1000, for example, runs integrated-os-46, requires a reboot, and is assigned to account fbc33b0c-9bac-11eb-a8a2-19ed5c03f8d3 on network configuration 1.

**Table `network_configurations`**

| id | config_id | ssid_name | security_protocol | is_auto_join_enabled | last_updated_date | mac_book_pro_id | service_id |
|---|---|---|---|---|---|---|---|
| 1 | 6564391 | Adaptive Cluster | composite-security-93 | false | 2025-12-20T23:09:00 | 1000 | 1996925 |
| 2 | 3158161 | Primary Review | primary-security-94 | true | 2022-05-04T06:26:00 | 1001 | 3990164 |
| 3 | 34039f3e-9bad-11eb-a8a2-19ed5c03f8d3 | Composite Initiative D | adaptive-security-95 | false | 2023-10-15T13:43:00 | 1002 | 5844258 |
| 4 | gd_taxp_nr_1 | Compact Model | distributed-security-96 | true | 2024-03-26T20:00:00 | 1003 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 |

Network configurations define the wireless and wired environments that devices join. Each configuration has a numeric or UUID-based `id`, a `config_id`, and an `ssid_name` such as "Adaptive Cluster" or "Compact Model." The `security_protocol` column specifies the encryption standard in use—composite-security-93, primary-security-94, adaptive-security-95, or distributed-security-96. The `is_auto_join_enabled` flag indicates whether devices automatically connect to this network, and `last_updated_date` records when the configuration was last modified. Each configuration is associated with a `mac_book_pro_id` and a `service_id`, linking the network environment to both the device that uses it and the service it provides. Configuration 1, for instance, uses composite-security-93, disables auto-join, and is tied to device 1000 and service 1996925.

**Table `network_services`**

| service_id | service_name | protocol_type | requires_credential | last_credential_update | network_configuration_id | password_credential_id |
|---|---|---|---|---|---|---|
| 1996925 | Distributed Initiative | composite-protocol-57 | false | 2023-06-03T17:27:00 | 1 | 1 |
| 3990164 | Adaptive Model D | primary-protocol-58 | true | 2024-11-14T00:44:00 | 2 | 2 |
| 5844258 | Primary Cluster | adaptive-protocol-59 | false | 2025-04-25T07:01:00 | 3 | 3 |
| e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | Composite Review | distributed-protocol-60 | true | 2022-09-09T14:18:00 | 4 | 4 |

The network services table enumerates the services exposed across the managed infrastructure. Each service has a `service_id`, a `service_name` such as "Distributed Initiative" or "Composite Review," and a `protocol_type` like composite-protocol-57 or distributed-protocol-60. The `requires_credential` flag indicates whether authentication is mandatory for access, and `last_credential_update` records when the associated credentials were last refreshed. Each service references a `network_configuration_id` and a `password_credential_id`, establishing its network context and authentication material. Service e29bafe2-8fd1-11eb-924d-9cd76263cbd0 (Composite Review) uses distributed-protocol-60, requires credentials, and is linked to network configuration 4 and password credential 4.

**Table `accounts_credentials`**

| account_id | password_credential_id |
|---|---|
| fbc33b0c-9bac-11eb-a8a2-19ed5c03f8d3 | 1 |
| fbc33b0c-9bac-11eb-a8a2-19ed5c03f8d3 | 2 |
| 10207152 | 2 |
| 10207152 | 3 |
| a4afb8ee-9bad-11eb-a8a2-19ed5c03f8d3 | 3 |
| a4afb8ee-9bad-11eb-a8a2-19ed5c03f8d3 | 4 |
| 3717632 | 4 |
| 3717632 | 1 |

The accounts_credentials table serves as a many-to-many linkage between user accounts and password credentials. A single account may hold multiple credentials, and a single credential may be shared across accounts. Account fbc33b0c-9bac-11eb-a8a2-19ed5c03f8d3 (Pilot Review) holds credentials 1 and 2, while account 10207152 (Baseline Initiative) holds credentials 2 and 3. This cross-reference table enables administrators to audit credential distribution and identify accounts with excessive or insufficient credential assignments.

## Cross-Reference Views

The following views join the base tables to answer specific operational questions. Each view materializes a particular relationship that would otherwise require manual multi-table queries.

**View `v_user_account_password_credential_detail`**

```sql
CREATE VIEW v_user_account_password_credential_detail AS
SELECT a.account_id, a.username, a.last_password_change_date, b.password_credential_id AS credential_password_credential_id, b.credential_id AS credential_credential_id, b.hash_algorithm AS credential_hash_algorithm
FROM user_accounts a
  JOIN accounts_credentials j ON j.account_id = a.account_id
  JOIN password_credentials b ON b.password_credential_id = j.password_credential_id;
```

| account_id | username | last_password_change_date | credential_password_credential_id | credential_credential_id | credential_hash_algorithm |
|---|---|---|---|---|---|
| fbc33b0c-9bac-11eb-a8a2-19ed5c03f8d3 | Pilot Review | 2022-09-19T20:36:00 | 1 | 168538 | primary-hash-34 |
| fbc33b0c-9bac-11eb-a8a2-19ed5c03f8d3 | Pilot Review | 2022-09-19T20:36:00 | 2 | default_chart_a_tax_10 | adaptive-hash-35 |
| 10207152 | Baseline Initiative | 2023-02-03T03:53:00 | 2 | default_chart_a_tax_10 | adaptive-hash-35 |
| 10207152 | Baseline Initiative | 2023-02-03T03:53:00 | 3 | ChIJIbRFlPtt5kcR5kM81XdpSfI | distributed-hash-36 |
| a4afb8ee-9bad-11eb-a8a2-19ed5c03f8d3 | Distributed Model A | 2024-07-14T10:10:00 | 3 | ChIJIbRFlPtt5kcR5kM81XdpSfI | distributed-hash-36 |
| a4afb8ee-9bad-11eb-a8a2-19ed5c03f8d3 | Distributed Model A | 2024-07-14T10:10:00 | 4 | 2002007020220 | baseline-hash-37 |
| 3717632 | Adaptive Cluster | 2025-12-25T17:27:00 | 4 | 2002007020220 | baseline-hash-37 |
| 3717632 | Adaptive Cluster | 2025-12-25T17:27:00 | 1 | 168538 | primary-hash-34 |

This view joins user accounts with their password credentials, answering the question of which credentials belong to which accounts and what the authentication properties are. A row for account "Pilot Review" would show credential 1 with hash algorithm primary-hash-34, strength level 42, and an expired status. The view surfaces the full credential lifecycle alongside the account's own status, allowing administrators to identify accounts whose passwords have expired while the account itself remains active—a common security risk.

**View `v_user_account_mac_book_pro`**

```sql
CREATE VIEW v_user_account_mac_book_pro AS
SELECT a.account_id, a.username, a.last_password_change_date, a.password_expiry_days, b.mac_book_pro_id AS pro_mac_book_pro_id, b.serial_number AS pro_serial_number, b.model_identifier AS pro_model_identifier
FROM user_accounts a JOIN mac_book_pros b ON a.mac_book_pro_id = b.mac_book_pro_id;
```

| account_id | username | last_password_change_date | password_expiry_days | pro_mac_book_pro_id | pro_serial_number | pro_model_identifier |
|---|---|---|---|---|---|---|
| fbc33b0c-9bac-11eb-a8a2-19ed5c03f8d3 | Pilot Review | 2022-09-19T20:36:00 | 47 | 1000 | 5844275 | MOD-2065 |
| 10207152 | Baseline Initiative | 2023-02-03T03:53:00 | 55 | 1001 | 69422 | MOD-2070 |
| a4afb8ee-9bad-11eb-a8a2-19ed5c03f8d3 | Distributed Model A | 2024-07-14T10:10:00 | 63 | 1002 | 7731874 | MOD-2075 |
| 3717632 | Adaptive Cluster | 2025-12-25T17:27:00 | 71 | 1003 | 10445632 | MOD-2080 |

This view links user accounts to their assigned Macintosh workstations, answering which device each user operates. The row for account "Pilot Review" (fbc33b0c-9bac-11eb-a8a2-19ed5c03f8d3) maps to device 1000, serial number 5844275, running integrated-os-46 with a pending reboot. The row for "Adaptive Cluster" (3717632) maps to device 1003, serial number 10445632, running legacy-os-49 with no reboot required. This view is essential for asset reconciliation and for determining which devices need attention based on account status.

**View `v_password_credential_user_account`**

```sql
CREATE VIEW v_password_credential_user_account AS
SELECT a.password_credential_id, a.credential_id, a.hash_algorithm, a.strength_level, b.account_id AS account_account_id, b.username AS account_username, b.last_password_change_date AS account_last_password_change_date
FROM password_credentials a JOIN user_accounts b ON a.account_id = b.account_id;
```

| password_credential_id | credential_id | hash_algorithm | strength_level | account_account_id | account_username | account_last_password_change_date |
|---|---|---|---|---|---|---|
| 1 | 168538 | primary-hash-34 | 42 | fbc33b0c-9bac-11eb-a8a2-19ed5c03f8d3 | Pilot Review | 2022-09-19T20:36:00 |
| 2 | default_chart_a_tax_10 | adaptive-hash-35 | 46 | 10207152 | Baseline Initiative | 2023-02-03T03:53:00 |
| 3 | ChIJIbRFlPtt5kcR5kM81XdpSfI | distributed-hash-36 | 50 | a4afb8ee-9bad-11eb-a8a2-19ed5c03f8d3 | Distributed Model A | 2024-07-14T10:10:00 |
| 4 | 2002007020220 | baseline-hash-37 | 54 | 3717632 | Adaptive Cluster | 2025-12-25T17:27:00 |

This view reverses the perspective, starting from password credentials and showing which user accounts hold them. Credential 168538 (primary-hash-34, strength 42, expired) is held by account fbc33b0c-9bac-11eb-a8a2-19ed5c03f8d3 (Pilot Review). Credential default_chart_a_tax_10 (adaptive-hash-35, strength 46, not expired) is held by account 10207152 (Baseline Initiative). This view supports credential-centric audits, such as identifying all accounts using a particular hash algorithm or finding credentials that have not been rotated within the policy window.

**View `v_password_credential_network_service`**

```sql
CREATE VIEW v_password_credential_network_service AS
SELECT a.password_credential_id, a.credential_id, a.hash_algorithm, a.strength_level, b.service_id AS service_service_id, b.service_name AS service_service_name, b.protocol_type AS service_protocol_type
FROM password_credentials a JOIN network_services b ON a.service_id = b.service_id;
```

| password_credential_id | credential_id | hash_algorithm | strength_level | service_service_id | service_service_name | service_protocol_type |
|---|---|---|---|---|---|---|
| 1 | 168538 | primary-hash-34 | 42 | 1996925 | Distributed Initiative | composite-protocol-57 |
| 2 | default_chart_a_tax_10 | adaptive-hash-35 | 46 | 3990164 | Adaptive Model D | primary-protocol-58 |
| 3 | ChIJIbRFlPtt5kcR5kM81XdpSfI | distributed-hash-36 | 50 | 5844258 | Primary Cluster | adaptive-protocol-59 |
| 4 | 2002007020220 | baseline-hash-37 | 54 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | Composite Review | distributed-protocol-60 |

This view connects password credentials to the network services they authenticate against, answering which service each credential protects. Credential 1 (primary-hash-34) authenticates to service 1996925 (Distributed Initiative), while credential 4 (baseline-hash-37) authenticates to service e29bafe2-8fd1-11eb-924d-9cd76263cbd0 (Composite Review). The view reveals whether a credential serves a service that requires authentication or one that does not, enabling risk assessments around unauthenticated service access.

**View `v_mac_book_pro_user_account`**

```sql
CREATE VIEW v_mac_book_pro_user_account AS
SELECT a.mac_book_pro_id, a.serial_number, a.model_identifier, a.os_version, b.account_id AS account_account_id, b.username AS account_username, b.last_password_change_date AS account_last_password_change_date
FROM mac_book_pros a JOIN user_accounts b ON a.account_id = b.account_id;
```

| mac_book_pro_id | serial_number | model_identifier | os_version | account_account_id | account_username | account_last_password_change_date |
|---|---|---|---|---|---|---|
| 1000 | 5844275 | MOD-2065 | integrated-os-46 | fbc33b0c-9bac-11eb-a8a2-19ed5c03f8d3 | Pilot Review | 2022-09-19T20:36:00 |
| 1001 | 69422 | MOD-2070 | seasonal-os-47 | 10207152 | Baseline Initiative | 2023-02-03T03:53:00 |
| 1002 | 7731874 | MOD-2075 | regional-os-48 | a4afb8ee-9bad-11eb-a8a2-19ed5c03f8d3 | Distributed Model A | 2024-07-14T10:10:00 |
| 1003 | 10445632 | MOD-2080 | legacy-os-49 | 3717632 | Adaptive Cluster | 2025-12-25T17:27:00 |

This view presents the device-to-account mapping from the hardware perspective, answering which user operates each Macintosh. Device 1000 (MOD-2065, serial 5844275) is operated by account fbc33b0c-9bac-11eb-a8a2-19ed5c03f8d3 (Pilot Review). Device 1002 (MOD-2075, serial 7731874) is operated by account a4afb8ee-9bad-11eb-a8a2-19ed5c03f8d3 (Distributed Model A). This view is particularly useful for device lifecycle management, as it surfaces which accounts are associated with devices that require reboots or are running outdated operating systems.

**View `v_mac_book_pro_network_configuration`**

```sql
CREATE VIEW v_mac_book_pro_network_configuration AS
SELECT a.mac_book_pro_id, a.serial_number, a.model_identifier, a.os_version, b.id AS configuration_id, b.config_id AS configuration_config_id, b.ssid_name AS configuration_ssid_name
FROM mac_book_pros a JOIN network_configurations b ON a.network_configuration_id = b.id;
```

| mac_book_pro_id | serial_number | model_identifier | os_version | configuration_id | configuration_config_id | configuration_ssid_name |
|---|---|---|---|---|---|---|
| 1000 | 5844275 | MOD-2065 | integrated-os-46 | 1 | 6564391 | Adaptive Cluster |
| 1001 | 69422 | MOD-2070 | seasonal-os-47 | 2 | 3158161 | Primary Review |
| 1002 | 7731874 | MOD-2075 | regional-os-48 | 3 | 34039f3e-9bad-11eb-a8a2-19ed5c03f8d3 | Composite Initiative D |
| 1003 | 10445632 | MOD-2080 | legacy-os-49 | 4 | gd_taxp_nr_1 | Compact Model |

This view links Macintosh workstations to their network configurations, answering which network environment each device is joined to. Device 1000 is configured for network configuration 1 (SSID: Adaptive Cluster, security: composite-security-93, auto-join disabled). Device 1003 is configured for network configuration 4 (SSID: Compact Model, security: distributed-security-96, auto-join enabled). This view supports network compliance audits, allowing administrators to verify that devices are connected to networks with appropriate security protocols.

**View `v_network_configuration_mac_book_pro`**

```sql
CREATE VIEW v_network_configuration_mac_book_pro AS
SELECT a.id, a.config_id, a.ssid_name, a.security_protocol, b.mac_book_pro_id AS pro_mac_book_pro_id, b.serial_number AS pro_serial_number, b.model_identifier AS pro_model_identifier
FROM network_configurations a JOIN mac_book_pros b ON a.mac_book_pro_id = b.mac_book_pro_id;
```

| id | config_id | ssid_name | security_protocol | pro_mac_book_pro_id | pro_serial_number | pro_model_identifier |
|---|---|---|---|---|---|---|
| 1 | 6564391 | Adaptive Cluster | composite-security-93 | 1000 | 5844275 | MOD-2065 |
| 2 | 3158161 | Primary Review | primary-security-94 | 1001 | 69422 | MOD-2070 |
| 3 | 34039f3e-9bad-11eb-a8a2-19ed5c03f8d3 | Composite Initiative D | adaptive-security-95 | 1002 | 7731874 | MOD-2075 |
| 4 | gd_taxp_nr_1 | Compact Model | distributed-security-96 | 1003 | 10445632 | MOD-2080 |

This view reverses the device-to-network relationship, starting from network configurations and listing the devices joined to each. Configuration 1 (Adaptive Cluster) is used by device 1000, while configuration 4 (Compact Model) is used by device 1003. This perspective is valuable for network administrators who need to understand the device footprint of each network configuration and assess whether auto-join settings are appropriate for the connected devices.

**View `v_network_configuration_network_service`**

```sql
CREATE VIEW v_network_configuration_network_service AS
SELECT a.id, a.config_id, a.ssid_name, a.security_protocol, b.service_id AS service_service_id, b.service_name AS service_service_name, b.protocol_type AS service_protocol_type
FROM network_configurations a JOIN network_services b ON a.service_id = b.service_id;
```

| id | config_id | ssid_name | security_protocol | service_service_id | service_service_name | service_protocol_type |
|---|---|---|---|---|---|---|
| 1 | 6564391 | Adaptive Cluster | composite-security-93 | 1996925 | Distributed Initiative | composite-protocol-57 |
| 2 | 3158161 | Primary Review | primary-security-94 | 3990164 | Adaptive Model D | primary-protocol-58 |
| 3 | 34039f3e-9bad-11eb-a8a2-19ed5c03f8d3 | Composite Initiative D | adaptive-security-95 | 5844258 | Primary Cluster | adaptive-protocol-59 |
| 4 | gd_taxp_nr_1 | Compact Model | distributed-security-96 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | Composite Review | distributed-protocol-60 |

This view connects network configurations to the services they host, answering which services are available on each network. Configuration 1 (Adaptive Cluster) hosts service 1996925 (Distributed Initiative), while configuration 4 (Compact Model) hosts service e29bafe2-8fd1-11eb-924d-9cd76263cbd0 (Composite Review). This view enables administrators to map service availability across network environments and identify configurations that expose services requiring credentials versus those that do not.

**View `v_network_service_network_configuration`**

```sql
CREATE VIEW v_network_service_network_configuration AS
SELECT a.service_id, a.service_name, a.protocol_type, a.requires_credential, b.id AS configuration_id, b.config_id AS configuration_config_id, b.ssid_name AS configuration_ssid_name
FROM network_services a JOIN network_configurations b ON a.network_configuration_id = b.id;
```

| service_id | service_name | protocol_type | requires_credential | configuration_id | configuration_config_id | configuration_ssid_name |
|---|---|---|---|---|---|---|
| 1996925 | Distributed Initiative | composite-protocol-57 | false | 1 | 6564391 | Adaptive Cluster |
| 3990164 | Adaptive Model D | primary-protocol-58 | true | 2 | 3158161 | Primary Review |
| 5844258 | Primary Cluster | adaptive-protocol-59 | false | 3 | 34039f3e-9bad-11eb-a8a2-19ed5c03f8d3 | Composite Initiative D |
| e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | Composite Review | distributed-protocol-60 | true | 4 | gd_taxp_nr_1 | Compact Model |

This view presents the service-to-network mapping from the service perspective, answering which network configuration each service runs on. Service 1996925 (Distributed Initiative) runs on configuration 1, and service e29bafe2-8fd1-11eb-924d-9cd76263cbd0 (Composite Review) runs on configuration 4. This view supports service discovery and capacity planning, as it reveals the network infrastructure supporting each service and whether the associated security protocols meet organizational standards.

**View `v_network_service_password_credential`**

```sql
CREATE VIEW v_network_service_password_credential AS
SELECT a.service_id, a.service_name, a.protocol_type, a.requires_credential, b.password_credential_id AS credential_password_credential_id, b.credential_id AS credential_credential_id, b.hash_algorithm AS credential_hash_algorithm
FROM network_services a JOIN password_credentials b ON a.password_credential_id = b.password_credential_id;
```

| service_id | service_name | protocol_type | requires_credential | credential_password_credential_id | credential_credential_id | credential_hash_algorithm |
|---|---|---|---|---|---|---|
| 1996925 | Distributed Initiative | composite-protocol-57 | false | 1 | 168538 | primary-hash-34 |
| 3990164 | Adaptive Model D | primary-protocol-58 | true | 2 | default_chart_a_tax_10 | adaptive-hash-35 |
| 5844258 | Primary Cluster | adaptive-protocol-59 | false | 3 | ChIJIbRFlPtt5kcR5kM81XdpSfI | distributed-hash-36 |
| e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | Composite Review | distributed-protocol-60 | true | 4 | 2002007020220 | baseline-hash-37 |

This view links network services to their password credentials, answering which credential authenticates to each service. Service 1996925 (Distributed Initiative) uses credential 1 (primary-hash-34, strength 42, expired), while service e29bafe2-8fd1-11eb-924d-9cd76263cbd0 (Composite Review) uses credential 4 (baseline-hash-37, strength 54, not expired). This view is critical for credential lifecycle management, as it surfaces services that rely on expired credentials and identifies credentials with varying strength levels across the service portfolio.

## Synthesis

The records and views described above form an interconnected system for managing identity, authentication, hardware, and network access. User accounts anchor the identity layer, each tied to a specific Macintosh workstation and one or more password credentials. Those credentials authenticate users to network services, which are themselves hosted on configured network environments. The many-to-many relationship between accounts and credentials, captured in the accounts_credentials table, allows for flexible credential sharing while maintaining an auditable trail. The cross-reference views translate these relationships into actionable formats, enabling administrators to answer questions about credential freshness, device compliance, network security, and service access. Together, these tables and views provide a comprehensive operational picture of a managed device environment, supporting both routine maintenance and security investigations.