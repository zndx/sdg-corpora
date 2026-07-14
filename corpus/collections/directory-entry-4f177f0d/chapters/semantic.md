The domain under examination is a network directory management system, one that tracks the intersection of human and organizational entities with the network infrastructure they operate, contact, and depend upon. Directory entries represent individuals and organizations—each with contact details such as telephone numbers, mailing addresses, and network mailbox identifiers—while network information centers, directory services, and network hosts model the technical infrastructure. Junction tables `centers_entries` and `mailboxes_entries` resolve many-to-many associations between directory entries and the two infrastructure domains. The materialized views then reassemble these normalized tables into readable domain facts, each answering a specific query about which person or organization is associated with which service, host, or center.

**Table `directory_entries`**

| id | handle | full_name | middle_initial | mailing_address | zip_code | telephone | autovon_number | fts_number | network_mailbox | registration_date | network_information_center_id | network_host_id | network_mailbox_id |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | distributed-handle-60 | Friedrich Nietzsche | regional-middle-30 | compact-mailing-32 | 9fffb746-9bac-11eb-a8a2-19ed5c03f8d3 | extended-telephon-15 | AUT-2593 | FTS-2551 | composite-network-27 | 2023-10-21T09:51:00 | 100 | 1 | 1 |
| 2 | baseline-handle-61 | Theodore Mcgrath | legacy-middle-31 | composite-mailing-33 | 7731887 | integrated-telephon-16 | AUT-2599 | FTS-2552 | primary-network-28 | 2024-03-05T16:08:00 | 101 | 2 | 2 |
| 3 | pilot-handle-62 | Patrick Mckee | compact-middle-32 | primary-mailing-34 | 4793464 | seasonal-telephon-17 | AUT-2605 | FTS-2553 | adaptive-network-29 | 2025-08-16T23:25:00 | 102 | 3 | 3 |
| 4 | extended-handle-63 | Jay Cunningham | composite-middle-33 | adaptive-mailing-35 | 3012821 | regional-telephon-18 | AUT-2611 | FTS-2554 | distributed-network-30 | 2022-01-27T06:42:00 | 103 | 4 | 4 |

The `directory_entries` table is the central entity in the domain, storing contact and identification records for people and organizations. Its primary key `id` is a surrogate integer, while the `handle` column provides a human-readable identifier such as `distributed-handle-60` or `baseline-handle-61`. The `full_name` column carries the entity's name—`Friedrich Nietzsche`, `Theodore Mcgrath`, `Patrick Mckee`, and `Jay Cunningham` in the sample data—supplemented by an optional `middle_initial` (values like `regional-middle-30`) and a `mailing_address` (e.g. `compact-mailing-32`). The `zip_code` column stores postal codes, which in the data appear as both UUID fragments (`9fffb746-9bac-11eb-a8a2-19ed5c03f8d3`) and plain integers (`7731887`). Contact is captured through `telephone` (e.g. `extended-telephon-15`), `autovon_number` (e.g. `AUT-2593`), and `fts_number` (e.g. `FTS-2551`). The `network_mailbox` column holds a free-text mailbox label such as `composite-network-27`, while `registration_date` records the timestamp of entry creation (`2023-10-21T09:51:00`, `2024-03-05T16:08:00`, etc.). Three foreign keys—`network_information_center_id`, `network_host_id`, and `network_mailbox_id`—anchor the entry to infrastructure records, each referencing the primary key of its respective table.

**Table `network_information_centers`**

| id | center_name | operating_institution | sponsoring_agency | service_port | service_protocol | service_host | service_status | directory_service_id |
|---|---|---|---|---|---|---|---|---|
| 100 | Legacy Protocol D | baseline-operatin-91 | The GEO Group Inc. | 30 | primary-service-46 | integrated-service-16 | active | 1000 |
| 101 | Regional Programme | pilot-operatin-92 | Tata Steel | 41 | adaptive-service-47 | seasonal-service-17 | deprecated | 1001 |
| 102 | Seasonal Standard | extended-operatin-93 | RECRUIT EXPRESS PTE LTD | 52 | distributed-service-48 | regional-service-18 | active | 1002 |
| 103 | Integrated Framework A | integrated-operatin-94 | American Institutes for Research | 63 | baseline-service-49 | legacy-service-19 | deprecated | 1003 |

The `network_information_centers` table models the organizational units that provide network services. Its primary key `id` is an integer (the sample values are `100` through `103`). The `center_name` column gives a descriptive label such as `Legacy Protocol D` or `Regional Programme`. The `operating_institution` column identifies the operating body (e.g. `baseline-operatin-91`), while `sponsoring_agency` names the funding organization—`The GEO Group Inc.`, `Tata Steel`, `RECRUIT EXPRESS PTE LTD`, and `American Institutes for Research` in the data. Service exposure is captured through `service_port` (integers `30`, `41`, `52`, `63`), `service_protocol` (e.g. `primary-service-46`), and `service_host` (e.g. `integrated-service-16`). The `service_status` column is an enumerated field with values `active` and `deprecated`. A single foreign key, `directory_service_id`, links each center to a directory service record.

**Table `directory_services`**

| id | service_name | protocol | port_number | host_address | response_format | connection_behavior | directory_entry_id | network_host_id |
|---|---|---|---|---|---|---|---|---|
| 1000 | Distributed Review | distributed-protocol-24 | 30 | adaptive-host-65 | human-readable | stateless | 1 | 1 |
| 1001 | Adaptive Initiative D | baseline-protocol-25 | 35 | distributed-host-66 | machine-readable | stateful | 2 | 2 |
| 1002 | Primary Model | pilot-protocol-26 | 40 | baseline-host-67 | human-readable | stateless | 3 | 3 |
| 1003 | Composite Cluster | extended-protocol-27 | 45 | pilot-host-68 | machine-readable | stateful | 4 | 4 |

Directory services represent the actual network-facing services—named entities like `Distributed Review` or `Adaptive Initiative D`—that run on hosts and are registered with information centers. The primary key `id` is an integer (`1000`–`1003`). The `service_name` column carries the human-readable name, while `protocol` stores the protocol identifier (e.g. `distributed-protocol-24`). The `port_number` column is an integer (`30`, `35`, `40`, `45`), and `host_address` identifies the host on which the service runs (e.g. `adaptive-host-65`). The `response_format` column distinguishes between `human-readable` and `machine-readable` outputs, and `connection_behavior` records whether the service is `stateless` or `stateful`. Two foreign keys anchor the service: `directory_entry_id` links it to the directory entry that registered or owns it, and `network_host_id` links it to the host machine.

**Table `network_hosts`**

| network_host_id | host_name | ip_address | network_type | operating_system | host_status | directory_entry_id | directory_service_id |
|---|---|---|---|---|---|---|---|
| 1 | Seasonal Initiative | legacy-ip-49 | ARPANET | adaptive-operatin-71 | active | 1 | 1000 |
| 2 | Integrated Model | compact-ip-50 | MILNET | distributed-operatin-72 | inactive | 2 | 1001 |
| 3 | Extended Cluster D | composite-ip-51 | DDN | baseline-operatin-73 | active | 3 | 1002 |
| 4 | Pilot Review | primary-ip-52 | ARPANET | pilot-operatin-74 | inactive | 4 | 1003 |

The `network_hosts` table models the physical or virtual machines on which services execute. Its primary key `network_host_id` is an integer (`1`–`4`). The `host_name` column provides a label such as `Seasonal Initiative` or `Integrated Model`. The `ip_address` column stores the network address (e.g. `legacy-ip-49`), while `network_type` identifies the network family—`ARPANET`, `MILNET`, or `DDN` in the sample data. The `operating_system` column names the OS (e.g. `adaptive-operatin-71`), and `host_status` is an enumerated field with values `active` and `inactive`. Two foreign keys, `directory_entry_id` and `directory_service_id`, associate each host with a directory entry and a directory service, respectively.

**Table `network_mailboxes`**

| id | mailbox_address | mailbox_type | mailbox_status |
|---|---|---|---|
| 1 | integrated-mailbox-82 | user | active |
| 2 | seasonal-mailbox-83 | organization | inactive |
| 3 | regional-mailbox-84 | user | active |
| 4 | legacy-mailbox-85 | organization | inactive |

The `network_mailboxes` table stores email or messaging mailbox records. Its primary key `id` is an integer (`1`–`4`). The `mailbox_address` column holds the address label (e.g. `integrated-mailbox-82`), `mailbox_type` distinguishes between `user` and `organization` types, and `mailbox_status` records whether the mailbox is `active` or `inactive`.

**Table `centers_entries`**

| network_information_center_id | directory_entry_id |
|---|---|
| 100 | 1 |
| 100 | 2 |
| 101 | 2 |
| 101 | 3 |
| 102 | 3 |
| 102 | 4 |
| 103 | 4 |
| 103 | 1 |

The `centers_entries` junction table resolves the many-to-many relationship between `network_information_centers` and `directory_entries`. Its composite key consists of `network_information_center_id` and `directory_entry_id`, both foreign keys referencing their respective parent tables. The sample data shows that each center is associated with two directory entries, and each directory entry participates in two center associations. For instance, center `100` (Legacy Protocol D) is linked to directory entries `1` and `2`, while directory entry `1` (Friedrich Nietzsche) is associated with centers `100` and `103`. This structure allows any directory entity to be affiliated with multiple information centers and vice versa.

**Table `mailboxes_entries`**

| network_mailbox_id | directory_entry_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

The `mailboxes_entries` junction table resolves the many-to-many relationship between `network_mailboxes` and `directory_entries`. Its composite key consists of `network_mailbox_id` and `directory_entry_id`. The sample data shows that each mailbox is associated with two directory entries, and each directory entry participates in two mailbox associations. For instance, mailbox `1` (integrated-mailbox-82) is linked to directory entries `1` and `2`, while directory entry `1` is associated with mailboxes `1` and `2`. This mirrors the structure of `centers_entries` and provides symmetric flexibility in the mailbox domain.

The materialized views reassemble these normalized tables into domain-level facts. Each view performs a join across the base and junction tables to answer a specific question about the network directory ecosystem.

**View `v_directory_entry_network_information_center`**

```sql
CREATE VIEW v_directory_entry_network_information_center AS
SELECT a.id, a.handle, a.full_name, a.middle_initial, b.id AS center_id, b.center_name AS center_center_name, b.operating_institution AS center_operating_institution
FROM directory_entries a JOIN network_information_centers b ON a.network_information_center_id = b.id;
```

| id | handle | full_name | middle_initial | center_id | center_center_name | center_operating_institution |
|---|---|---|---|---|---|---|
| 1 | distributed-handle-60 | Friedrich Nietzsche | regional-middle-30 | 100 | Legacy Protocol D | baseline-operatin-91 |
| 2 | baseline-handle-61 | Theodore Mcgrath | legacy-middle-31 | 101 | Regional Programme | pilot-operatin-92 |
| 3 | pilot-handle-62 | Patrick Mckee | compact-middle-32 | 102 | Seasonal Standard | extended-operatin-93 |
| 4 | extended-handle-63 | Jay Cunningham | composite-middle-33 | 103 | Integrated Framework A | integrated-operatin-94 |

This view joins `directory_entries` with `network_information_centers` through the `centers_entries` junction table, answering the question: which information centers is a given directory entry affiliated with? A row for directory entry `1` (Friedrich Nietzsche, handle `distributed-handle-60`) would show its association with center `100` (Legacy Protocol D, sponsored by The GEO Group Inc.) and center `103` (Integrated Framework A, sponsored by American Institutes for Research). The view reconstructs the full name, handle, and registration date of the directory entry alongside the center name, operating institution, and service status, allowing a reader to see at a glance which organizational units a person or entity is connected to.

**View `v_directory_entry_network_host`**

```sql
CREATE VIEW v_directory_entry_network_host AS
SELECT a.id, a.handle, a.full_name, a.middle_initial, b.network_host_id AS host_network_host_id, b.host_name AS host_host_name, b.ip_address AS host_ip_address
FROM directory_entries a JOIN network_hosts b ON a.network_host_id = b.network_host_id;
```

| id | handle | full_name | middle_initial | host_network_host_id | host_host_name | host_ip_address |
|---|---|---|---|---|---|---|
| 1 | distributed-handle-60 | Friedrich Nietzsche | regional-middle-30 | 1 | Seasonal Initiative | legacy-ip-49 |
| 2 | baseline-handle-61 | Theodore Mcgrath | legacy-middle-31 | 2 | Integrated Model | compact-ip-50 |
| 3 | pilot-handle-62 | Patrick Mckee | compact-middle-32 | 3 | Extended Cluster D | composite-ip-51 |
| 4 | extended-handle-63 | Jay Cunningham | composite-middle-33 | 4 | Pilot Review | primary-ip-52 |

This view joins `directory_entries` with `network_hosts` via the `network_host_id` foreign key in `directory_entries`, answering: which network host is associated with a given directory entry? For directory entry `2` (Theodore Mcgrath, handle `baseline-handle-61`), the view would surface host `2` (Integrated Model, IP `compact-ip-50`, network type `MILNET`, operating system `distributed-operatin-72`, status `inactive`). The join reconstructs the directory entry's contact details alongside the host's technical attributes, enabling a quick lookup of the machine a person or organization is linked to.

**View `v_directory_entry_network_mailbox`**

```sql
CREATE VIEW v_directory_entry_network_mailbox AS
SELECT a.id, a.handle, a.full_name, a.middle_initial, b.id AS mailbox_id, b.mailbox_address AS mailbox_mailbox_address, b.mailbox_type AS mailbox_mailbox_type
FROM directory_entries a JOIN network_mailboxes b ON a.network_mailbox_id = b.id;
```

| id | handle | full_name | middle_initial | mailbox_id | mailbox_mailbox_address | mailbox_mailbox_type |
|---|---|---|---|---|---|---|
| 1 | distributed-handle-60 | Friedrich Nietzsche | regional-middle-30 | 1 | integrated-mailbox-82 | user |
| 2 | baseline-handle-61 | Theodore Mcgrath | legacy-middle-31 | 2 | seasonal-mailbox-83 | organization |
| 3 | pilot-handle-62 | Patrick Mckee | compact-middle-32 | 3 | regional-mailbox-84 | user |
| 4 | extended-handle-63 | Jay Cunningham | composite-middle-33 | 4 | legacy-mailbox-85 | organization |

This view joins `directory_entries` with `network_mailboxes` through the `network_mailbox_id` foreign key, answering: which mailbox is associated with a given directory entry? For directory entry `3` (Patrick Mckee, handle `pilot-handle-62`), the view would surface mailbox `3` (regional-mailbox-84, type `user`, status `active`). The join reconstructs the directory entry's full name, telephone, and registration date alongside the mailbox address and type, providing a direct mapping from person to messaging address.

**View `v_network_information_center_directory_entry_detail`**

```sql
CREATE VIEW v_network_information_center_directory_entry_detail AS
SELECT a.id, a.center_name, a.operating_institution, b.id AS entry_id, b.handle AS entry_handle, b.full_name AS entry_full_name
FROM network_information_centers a
  JOIN centers_entries j ON j.network_information_center_id = a.id
  JOIN directory_entries b ON b.id = j.directory_entry_id;
```

| id | center_name | operating_institution | entry_id | entry_handle | entry_full_name |
|---|---|---|---|---|---|
| 100 | Legacy Protocol D | baseline-operatin-91 | 1 | distributed-handle-60 | Friedrich Nietzsche |
| 100 | Legacy Protocol D | baseline-operatin-91 | 2 | baseline-handle-61 | Theodore Mcgrath |
| 101 | Regional Programme | pilot-operatin-92 | 2 | baseline-handle-61 | Theodore Mcgrath |
| 101 | Regional Programme | pilot-operatin-92 | 3 | pilot-handle-62 | Patrick Mckee |
| 102 | Seasonal Standard | extended-operatin-93 | 3 | pilot-handle-62 | Patrick Mckee |
| 102 | Seasonal Standard | extended-operatin-93 | 4 | extended-handle-63 | Jay Cunningham |
| 103 | Integrated Framework A | integrated-operatin-94 | 4 | extended-handle-63 | Jay Cunningham |
| 103 | Integrated Framework A | integrated-operatin-94 | 1 | distributed-handle-60 | Friedrich Nietzsche |

This view joins `network_information_centers` with `directory_entries` through the `centers_entries` junction table, answering the inverse question: which directory entries are affiliated with a given information center? For center `101` (Regional Programme, operating institution `pilot-operatin-92`, sponsored by Tata Steel), the view would surface directory entries `2` (Theodore Mcgrath) and `3` (Patrick Mckee). The reconstructed row includes the center's service port, protocol, and status alongside the directory entry's full name, handle, and registration date, enabling administrators to see which entities are associated with a particular center's services.

**View `v_network_information_center_directory_service`**

```sql
CREATE VIEW v_network_information_center_directory_service AS
SELECT a.id, a.center_name, a.operating_institution, a.sponsoring_agency, b.id AS service_id, b.service_name AS service_service_name, b.protocol AS service_protocol
FROM network_information_centers a JOIN directory_services b ON a.directory_service_id = b.id;
```

| id | center_name | operating_institution | sponsoring_agency | service_id | service_service_name | service_protocol |
|---|---|---|---|---|---|---|
| 100 | Legacy Protocol D | baseline-operatin-91 | The GEO Group Inc. | 1000 | Distributed Review | distributed-protocol-24 |
| 101 | Regional Programme | pilot-operatin-92 | Tata Steel | 1001 | Adaptive Initiative D | baseline-protocol-25 |
| 102 | Seasonal Standard | extended-operatin-93 | RECRUIT EXPRESS PTE LTD | 1002 | Primary Model | pilot-protocol-26 |
| 103 | Integrated Framework A | integrated-operatin-94 | American Institutes for Research | 1003 | Composite Cluster | extended-protocol-27 |

This view joins `network_information_centers` with `directory_services` via the `directory_service_id` foreign key in `network_information_centers`, answering: which directory service does a given information center expose? For center `102` (Seasonal Standard, sponsored by RECRUIT EXPRESS PTE LTD), the view would surface directory service `1002` (Primary Model, protocol `pilot-protocol-26`, port `40`, host address `baseline-host-67`, response format `human-readable`, connection behavior `stateless`). The join reconstructs the center's name and service port alongside the service's protocol, host address, and behavioral attributes, allowing operators to verify which services are registered under which centers.

**View `v_directory_service_directory_entry`**

```sql
CREATE VIEW v_directory_service_directory_entry AS
SELECT a.id, a.service_name, a.protocol, a.port_number, b.id AS entry_id, b.handle AS entry_handle, b.full_name AS entry_full_name
FROM directory_services a JOIN directory_entries b ON a.directory_entry_id = b.id;
```

| id | service_name | protocol | port_number | entry_id | entry_handle | entry_full_name |
|---|---|---|---|---|---|---|
| 1000 | Distributed Review | distributed-protocol-24 | 30 | 1 | distributed-handle-60 | Friedrich Nietzsche |
| 1001 | Adaptive Initiative D | baseline-protocol-25 | 35 | 2 | baseline-handle-61 | Theodore Mcgrath |
| 1002 | Primary Model | pilot-protocol-26 | 40 | 3 | pilot-handle-62 | Patrick Mckee |
| 1003 | Composite Cluster | extended-protocol-27 | 45 | 4 | extended-handle-63 | Jay Cunningham |

This view joins `directory_services` with `directory_entries` via the `directory_entry_id` foreign key, answering: which directory entry registered or owns a given directory service? For directory service `1001` (Adaptive Initiative D, protocol `baseline-protocol-25`, port `35`, host address `distributed-host-66`, response format `machine-readable`, connection behavior `stateful`), the view would surface directory entry `2` (Theodore Mcgrath, handle `baseline-handle-61`, telephone `extended-telephon-15`, registration date `2024-03-05T16:08:00`). The reconstructed row provides the service's technical details alongside the owner's contact information, enabling accountability tracing from service back to entity.

**View `v_directory_service_network_host`**

```sql
CREATE VIEW v_directory_service_network_host AS
SELECT a.id, a.service_name, a.protocol, a.port_number, b.network_host_id AS host_network_host_id, b.host_name AS host_host_name, b.ip_address AS host_ip_address
FROM directory_services a JOIN network_hosts b ON a.network_host_id = b.network_host_id;
```

| id | service_name | protocol | port_number | host_network_host_id | host_host_name | host_ip_address |
|---|---|---|---|---|---|---|
| 1000 | Distributed Review | distributed-protocol-24 | 30 | 1 | Seasonal Initiative | legacy-ip-49 |
| 1001 | Adaptive Initiative D | baseline-protocol-25 | 35 | 2 | Integrated Model | compact-ip-50 |
| 1002 | Primary Model | pilot-protocol-26 | 40 | 3 | Extended Cluster D | composite-ip-51 |
| 1003 | Composite Cluster | extended-protocol-27 | 45 | 4 | Pilot Review | primary-ip-52 |

This view joins `directory_services` with `network_hosts` via the `network_host_id` foreign key in `directory_services`, answering: on which network host does a given directory service run? For directory service `1003` (Composite Cluster, protocol `extended-protocol-27`, port `45`, response format `machine-readable`, connection behavior `stateful`), the view would surface network host `4` (Pilot Review, IP `primary-ip-52`, network type `ARPANET`, operating system `pilot-operatin-74`, status `inactive`). The join reconstructs the service's name and protocol alongside the host's IP address, network type, and status, enabling infrastructure operators to locate the physical or virtual machine hosting a particular service.

**View `v_network_host_directory_entry`**

```sql
CREATE VIEW v_network_host_directory_entry AS
SELECT a.network_host_id, a.host_name, a.ip_address, a.network_type, b.id AS entry_id, b.handle AS entry_handle, b.full_name AS entry_full_name
FROM network_hosts a JOIN directory_entries b ON a.directory_entry_id = b.id;
```

| network_host_id | host_name | ip_address | network_type | entry_id | entry_handle | entry_full_name |
|---|---|---|---|---|---|---|
| 1 | Seasonal Initiative | legacy-ip-49 | ARPANET | 1 | distributed-handle-60 | Friedrich Nietzsche |
| 2 | Integrated Model | compact-ip-50 | MILNET | 2 | baseline-handle-61 | Theodore Mcgrath |
| 3 | Extended Cluster D | composite-ip-51 | DDN | 3 | pilot-handle-62 | Patrick Mckee |
| 4 | Pilot Review | primary-ip-52 | ARPANET | 4 | extended-handle-63 | Jay Cunningham |

This view joins `network_hosts` with `directory_entries` via the `directory_entry_id` foreign key in `network_hosts`, answering: which directory entry is associated with a given network host? For network host `3` (Extended Cluster D, IP `composite-ip-51`, network type `DDN`, operating system `baseline-operatin-73`, status `active`), the view would surface directory entry `3` (Patrick Mckee, handle `pilot-handle-62`, middle initial `compact-middle-32`, mailing address `primary-mailing-34`, zip code `4793464`, telephone `seasonal-telephon-17`, AUT number `AUT-2605`, FTS number `FTS-2553`, network mailbox `adaptive-network-29`, registration date `2025-08-16T23:25:00`). The reconstructed row provides the host's technical attributes alongside the full contact record of the associated directory entity, enabling a comprehensive view of the person-machine relationship.

**View `v_network_host_directory_service`**

```sql
CREATE VIEW v_network_host_directory_service AS
SELECT a.network_host_id, a.host_name, a.ip_address, a.network_type, b.id AS service_id, b.service_name AS service_service_name, b.protocol AS service_protocol
FROM network_hosts a JOIN directory_services b ON a.directory_service_id = b.id;
```

| network_host_id | host_name | ip_address | network_type | service_id | service_service_name | service_protocol |
|---|---|---|---|---|---|---|
| 1 | Seasonal Initiative | legacy-ip-49 | ARPANET | 1000 | Distributed Review | distributed-protocol-24 |
| 2 | Integrated Model | compact-ip-50 | MILNET | 1001 | Adaptive Initiative D | baseline-protocol-25 |
| 3 | Extended Cluster D | composite-ip-51 | DDN | 1002 | Primary Model | pilot-protocol-26 |
| 4 | Pilot Review | primary-ip-52 | ARPANET | 1003 | Composite Cluster | extended-protocol-27 |

This view joins `network_hosts` with `directory_services` via the `directory_service_id` foreign key in `network_hosts`, answering: which directory service is running on a given network host? For network host `1` (Seasonal Initiative, IP `legacy-ip-49`, network type `ARPANET`, operating system `adaptive-operatin-71`, status `active`), the view would surface directory service `1000` (Distributed Review, protocol `distributed-protocol-24`, port `30`, host address `adaptive-host-65`, response format `human-readable`, connection behavior `stateless`). The join reconstructs the host's name and status alongside the service's name, protocol, port, and behavioral attributes, enabling infrastructure operators to verify the service-to-host mapping.

**View `v_network_mailbox_directory_entry_detail`**

```sql
CREATE VIEW v_network_mailbox_directory_entry_detail AS
SELECT a.id, a.mailbox_address, a.mailbox_type, b.id AS entry_id, b.handle AS entry_handle, b.full_name AS entry_full_name
FROM network_mailboxes a
  JOIN mailboxes_entries j ON j.network_mailbox_id = a.id
  JOIN directory_entries b ON b.id = j.directory_entry_id;
```

| id | mailbox_address | mailbox_type | entry_id | entry_handle | entry_full_name |
|---|---|---|---|---|---|
| 1 | integrated-mailbox-82 | user | 1 | distributed-handle-60 | Friedrich Nietzsche |
| 1 | integrated-mailbox-82 | user | 2 | baseline-handle-61 | Theodore Mcgrath |
| 2 | seasonal-mailbox-83 | organization | 2 | baseline-handle-61 | Theodore Mcgrath |
| 2 | seasonal-mailbox-83 | organization | 3 | pilot-handle-62 | Patrick Mckee |
| 3 | regional-mailbox-84 | user | 3 | pilot-handle-62 | Patrick Mckee |
| 3 | regional-mailbox-84 | user | 4 | extended-handle-63 | Jay Cunningham |
| 4 | legacy-mailbox-85 | organization | 4 | extended-handle-63 | Jay Cunningham |
| 4 | legacy-mailbox-85 | organization | 1 | distributed-handle-60 | Friedrich Nietzsche |

This view joins `network_mailboxes` with `directory_entries` through the `mailboxes_entries` junction table, answering the inverse question: which directory entries are associated with a given network mailbox? For mailbox `2` (seasonal-mailbox-83, type `organization`, status `inactive`), the view would surface directory entries `2` (Theodore Mcgrath, handle `baseline-handle-61`, telephone `extended-telephon-15`, registration date `2024-03-05T16:08:00`) and `3` (Patrick Mckee, handle `pilot-handle-62`, telephone `seasonal-telephon-17`, registration date `2025-08-16T23:25:00`). The reconstructed rows include the mailbox address and type alongside each directory entry's full name, handle, and registration date, enabling administrators to see which entities share or are linked to a particular mailbox.

The schema design reflects a deliberate normalization strategy: core entities (`directory_entries`, `network_information_centers`, `directory_services`, `network_hosts`, `network_mailboxes`) store their own attributes in dedicated tables, while many-to-many relationships are resolved through junction tables (`centers_entries`, `mailboxes_entries`). Foreign keys in the base tables provide direct one-to-many links where appropriate (e.g., a directory entry directly references a single network host and mailbox), while the junction tables handle the more complex many-to-many associations. The materialized views then perform the necessary joins to reconstruct domain-level facts, each view answering a specific query about the relationships between people, organizations, and network infrastructure. This separation of concerns—storage in normalized tables, retrieval through purpose-built views—ensures that the schema remains flexible for data modification while providing clear, readable interfaces for querying the domain.