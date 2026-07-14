## Domain Modelling and Relational Materialisation

The data under examination describes an IT asset management domain in which user accounts, laptop devices, network configurations, and network services are interrelated through credentialing mechanisms. Each user account is tied to a specific Mac Book Pro device; each device is provisioned with a network configuration; each network configuration exposes one or more network services; and each service may require a password credential for access. The accounts_credentials junction table captures the many-to-many relationship between user accounts and password credentials, allowing a single account to hold multiple credentials and a single credential to be shared across accounts. The following sections walk through the base tables, their columns and cardinality-bounded relationships, and then interpret each materialised view as a reconstructed domain fact.

**Table `user_accounts`**

| account_id | username | last_password_change_date | password_expiry_days | account_status | mac_book_pro_id |
|---|---|---|---|---|---|
| fbc33b0c-9bac-11eb-a8a2-19ed5c03f8d3 | Pilot Review | 2022-09-19T20:36:00 | 47 | active | 1000 |
| 10207152 | Baseline Initiative | 2023-02-03T03:53:00 | 55 | locked | 1001 |
| a4afb8ee-9bad-11eb-a8a2-19ed5c03f8d3 | Distributed Model A | 2024-07-14T10:10:00 | 63 | expired | 1002 |
| 3717632 | Adaptive Cluster | 2025-12-25T17:27:00 | 71 | active | 1003 |

The `user_accounts` table is the central identity anchor. Its primary key `account_id` is a composite of UUIDs (for example `fbc33b0c-9bac-11eb-a8a2-19ed5c03f8d3`) and plain integers (for example `10207152`), reflecting a system that has migrated from one identifier scheme to another. The `username` column carries human-readable labels such as *Pilot Review* and *Adaptive Cluster*. Password lifecycle metadata is stored in `last_password_change_date` (a `TIMESTAMP` value like `2022-09-19T20:36:00`) and `password_expiry_days` (an integer ranging from 47 to 71 in the sample data). The `account_status` column constrains accounts to the domain values `active`, `locked`, and `expired`. Finally, the foreign key `mac_book_pro_id` links each account to exactly one laptop, enforcing a one-to-one relationship between accounts and devices.

**Table `password_credentials`**

| password_credential_id | credential_id | hash_algorithm | strength_level | is_expired | rotation_policy_id | account_id | service_id |
|---|---|---|---|---|---|---|---|
| 1 | 168538 | primary-hash-34 | 42 | true | 7441163 | fbc33b0c-9bac-11eb-a8a2-19ed5c03f8d3 | 1996925 |
| 2 | default_chart_a_tax_10 | adaptive-hash-35 | 46 | false | 1450635 | 10207152 | 3990164 |
| 3 | ChIJIbRFlPtt5kcR5kM81XdpSfI | distributed-hash-36 | 50 | true | 10782173 | a4afb8ee-9bad-11eb-a8a2-19ed5c03f8d3 | 5844258 |
| 4 | 2002007020220 | baseline-hash-37 | 54 | false | IVC20det40 | 3717632 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 |

The `password_credentials` table stores the cryptographic artefacts associated with accounts and services. Its surrogate primary key `password_credential_id` is a sequential integer (1, 2, 3, 4). The `credential_id` column holds a heterogeneous mix of identifiers — a plain integer (`168538`), a string (`default_chart_a_tax_10`), a base-64 token (`ChIJIbRFlPtt5kcR5kM81XdpSfI`), and another integer (`2002007020220`). The `hash_algorithm` column records the algorithm family used to derive the stored secret, with values such as `primary-hash-34` and `distributed-hash-36`. The `strength_level` column is an integer score (42–54) that quantifies credential robustness. A boolean `is_expired` flag indicates whether the credential has passed its validity window. The `rotation_policy_id` column references a rotation policy (values include both integers like `7441163` and strings like `IVC20det40`). The foreign key `account_id` points back to `user_accounts.account_id`, and the foreign key `service_id` points to `network_services.service_id`, thereby binding each credential to a specific user and a specific network service.

**Table `mac_book_pros`**

| mac_book_pro_id | serial_number | model_identifier | os_version | last_reboot_date | is_reboot_required | account_id | network_configuration_id |
|---|---|---|---|---|---|---|---|
| 1000 | 5844275 | MOD-2065 | integrated-os-46 | 2024-07-06T06:18:00 | true | fbc33b0c-9bac-11eb-a8a2-19ed5c03f8d3 | 1 |
| 1001 | 69422 | MOD-2070 | seasonal-os-47 | 2025-12-17T13:35:00 | false | 10207152 | 2 |
| 1002 | 7731874 | MOD-2075 | regional-os-48 | 2022-05-01T20:52:00 | true | a4afb8ee-9bad-11eb-a8a2-19ed5c03f8d3 | 3 |
| 1003 | 10445632 | MOD-2080 | legacy-os-49 | 2023-10-12T03:09:00 | false | 3717632 | 4 |

The `mac_book_pros` table describes the laptop fleet. Its primary key `mac_book_pro_id` is a small integer (1000–1003). The `serial_number` column carries device-specific identifiers such as `5844275` and `69422`. The `model_identifier` column uses a prefix `MOD-` followed by a four-digit number (e.g. `MOD-2065`). The `os_version` column stores OS release labels like `integrated-os-46` and `seasonal-os-47`. The `last_reboot_date` column is a `TIMESTAMP` (e.g. `2024-07-06T06:18:00`), and `is_reboot_required` is a boolean indicating pending reboots. The foreign key `account_id` links the device to its owner in `user_accounts`, and the foreign key `network_configuration_id` links the device to its network profile in `network_configurations`.

**Table `network_configurations`**

| id | config_id | ssid_name | security_protocol | is_auto_join_enabled | last_updated_date | mac_book_pro_id | service_id |
|---|---|---|---|---|---|---|---|
| 1 | 6564391 | Adaptive Cluster | composite-security-93 | false | 2025-12-20T23:09:00 | 1000 | 1996925 |
| 2 | 3158161 | Primary Review | primary-security-94 | true | 2022-05-04T06:26:00 | 1001 | 3990164 |
| 3 | 34039f3e-9bad-11eb-a8a2-19ed5c03f8d3 | Composite Initiative D | adaptive-security-95 | false | 2023-10-15T13:43:00 | 1002 | 5844258 |
| 4 | gd_taxp_nr_1 | Compact Model | distributed-security-96 | true | 2024-03-26T20:00:00 | 1003 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 |

The `network_configurations` table captures Wi-Fi and network profile definitions. Its primary key `id` is a small integer (1–4). The `config_id` column holds configuration identifiers that are themselves heterogeneous — integers (`6564391`), strings (`3158161`), UUIDs (`34039f3e-9bad-11eb-a8a2-19ed5c03f8d3`), and alphanumeric codes (`gd_taxp_nr_1`). The `ssid_name` column stores the network SSID (e.g. *Adaptive Cluster*, *Primary Review*). The `security_protocol` column records the protocol family (`composite-security-93`, `primary-security-94`, etc.). The boolean `is_auto_join_enabled` indicates whether the device auto-joins the network. The `last_updated_date` column is a `TIMESTAMP`. The foreign key `mac_book_pro_id` links the configuration to a specific laptop, and the foreign key `service_id` links it to a network service.

**Table `network_services`**

| service_id | service_name | protocol_type | requires_credential | last_credential_update | network_configuration_id | password_credential_id |
|---|---|---|---|---|---|---|
| 1996925 | Distributed Initiative | composite-protocol-57 | false | 2023-06-03T17:27:00 | 1 | 1 |
| 3990164 | Adaptive Model D | primary-protocol-58 | true | 2024-11-14T00:44:00 | 2 | 2 |
| 5844258 | Primary Cluster | adaptive-protocol-59 | false | 2025-04-25T07:01:00 | 3 | 3 |
| e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | Composite Review | distributed-protocol-60 | true | 2022-09-09T14:18:00 | 4 | 4 |

The `network_services` table enumerates the services exposed on the network. Its primary key `service_id` is a heterogeneous mix of integers (`1996925`, `3990164`) and UUIDs (`e29bafe2-8fd1-11eb-924d-9cd76263cbd0`). The `service_name` column carries labels such as *Distributed Initiative* and *Adaptive Model D*. The `protocol_type` column records the protocol family (`composite-protocol-57`, `primary-protocol-58`, etc.). The boolean `requires_credential` indicates whether the service demands authentication. The `last_credential_update` column is a `TIMESTAMP`. The foreign key `network_configuration_id` links the service to its parent configuration, and the foreign key `password_credential_id` links it to the credential that authenticates access.

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

The `accounts_credentials` table is a junction table that resolves the many-to-many relationship between `user_accounts` and `password_credentials`. Its composite key consists of `account_id` and `password_credential_id`. In the sample data, the account `fbc33b0c-9bac-11eb-a8a2-19ed5c03f8d3` holds two credentials (IDs 1 and 2), while the account `3717632` holds credentials 4 and 1. This table enables a single credential to be shared across multiple accounts and a single account to manage multiple credentials.

### Base-Table Relationships and Normalisation

The five core entity tables are normalised to third normal form. The `user_accounts` table owns the account identity and references exactly one `mac_book_pro` through `mac_book_pro_id`. The `mac_book_pros` table, in turn, references one `network_configuration` through `network_configuration_id`. The `network_configurations` table references one `network_service` through `service_id`. The `network_services` table references one `password_credential` through `password_credential_id`. The `password_credentials` table references back to `user_accounts` through `account_id` and to `network_services` through `service_id`. The `accounts_credentials` junction table sits orthogonal to this chain, providing an additional many-to-many bridge between accounts and credentials that is not enforced by the primary entity chain.

### View Interpretations

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

The view `v_user_account_password_credential_detail` joins `user_accounts` to `password_credentials` on `account_id`, producing a flat row per credential that carries the user's identity alongside the credential's cryptographic metadata. Reading the first row, the account *Pilot Review* (`fbc33b0c-9bac-11eb-a8a2-19ed5c03f8d3`) holds a credential with `hash_algorithm = primary-hash-34`, `strength_level = 42`, and `is_expired = true`. This view answers the question: *which credentials belong to which accounts, and what are their properties?*

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

The view `v_user_account_mac_book_pro` joins `user_accounts` to `mac_book_pros` on `account_id`, producing one row per device that carries both the account and device attributes. The first row shows the account *Pilot Review* paired with device `5844275` (model `MOD-2065`, OS `integrated-os-46`), where `is_reboot_required = true`. This view answers: *which laptop is assigned to which user, and what is the device's current state?*

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

The view `v_password_credential_user_account` joins `password_credentials` to `user_accounts` on `account_id`, effectively the same relationship as `v_user_account_password_credential_detail` but from the credential's perspective. The first row shows credential ID 1 (`hash_algorithm = primary-hash-34`) belonging to account `fbc33b0c-9bac-11eb-a8a2-19ed5c03f8d3` (*Pilot Review*). This view answers: *given a credential, which user owns it?*

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

The view `v_password_credential_network_service` joins `password_credentials` to `network_services` on `service_id`. The first row pairs credential ID 1 with service `1996925` (*Distributed Initiative*, protocol `composite-protocol-57`). This view answers: *which network service does a given credential authenticate against?*

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

The view `v_mac_book_pro_user_account` joins `mac_book_pros` to `user_accounts` on `account_id`, the inverse of `v_user_account_mac_book_pro`. The first row shows device `5844275` (model `MOD-2065`) owned by account *Pilot Review*. This view answers: *given a laptop, who is its assigned user?*

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

The view `v_mac_book_pro_network_configuration` joins `mac_book_pros` to `network_configurations` on `network_configuration_id`. The first row links device `5844275` to configuration `6564391` (SSID *Adaptive Cluster*, security `composite-security-93`). This view answers: *which network configuration is provisioned on a given laptop?*

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

The view `v_network_configuration_mac_book_pro` joins `network_configurations` to `mac_book_pros` on `mac_book_pro_id`, the inverse of the preceding view. The first row shows configuration `6564391` (SSID *Adaptive Cluster*) assigned to device `5844275`. This view answers: *given a network configuration, which laptop does it serve?*

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

The view `v_network_configuration_network_service` joins `network_configurations` to `network_services` on `service_id`. The first row links configuration `6564391` (SSID *Adaptive Cluster*) to service `1996925` (*Distributed Initiative*, protocol `composite-protocol-57`). This view answers: *which network service is exposed through a given configuration?*

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

The view `v_network_service_network_configuration` joins `network_services` to `network_configurations` on `network_configuration_id`, the inverse of the preceding view. The first row shows service `1996925` (*Distributed Initiative*) served by configuration `6564391` (SSID *Adaptive Cluster*). This view answers: *given a network service, which configuration exposes it?*

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

The view `v_network_service_password_credential` joins `network_services` to `password_credentials` on `password_credential_id`. The first row links service `1996925` (*Distributed Initiative*) to credential ID 1 (`hash_algorithm = primary-hash-34`, `strength_level = 42`). This view answers: *which credential authenticates access to a given network service?*

### Closing Synthesis

The domain model decomposes into five entity tables and one junction table, each capturing a distinct concept in the IT asset management space. The primary entity chain — `user_accounts` → `mac_book_pros` → `network_configurations` → `network_services` → `password_credentials` — forms a linear one-to-one path that can be traversed in either direction. The `accounts_credentials` junction table adds a many-to-many overlay between accounts and credentials. The ten materialised views each project a two-table join that reconstructs a single domain fact from the normalised tables, enabling downstream consumers to query relationships without writing explicit join logic. Together, the base tables and views provide a complete, denormalised surface over a tightly constrained relational schema.