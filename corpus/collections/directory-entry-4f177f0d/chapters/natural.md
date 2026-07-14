## The Architecture of Networked Directory Systems

Modern telecommunications infrastructure relies on a layered directory architecture that binds individuals, computing hosts, and messaging endpoints into a coherent addressing fabric. At the core of this fabric are directory entries—records that capture the identity and contact attributes of persons or organizations operating within a networked environment. Each entry carries a handle, a full name, a middle initial, a mailing address, a zip code, and multiple telephone identifiers including an autovon number and an FTS number. A directory entry is further anchored to a network mailbox, a network host, and a network information center, forming the foundational triad of identity, computation, and service.

**Table `directory_entries`**

| id | handle | full_name | middle_initial | mailing_address | zip_code | telephone | autovon_number | fts_number | network_mailbox | registration_date | network_information_center_id | network_host_id | network_mailbox_id |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | distributed-handle-60 | Friedrich Nietzsche | regional-middle-30 | compact-mailing-32 | 9fffb746-9bac-11eb-a8a2-19ed5c03f8d3 | extended-telephon-15 | AUT-2593 | FTS-2551 | composite-network-27 | 2023-10-21T09:51:00 | 100 | 1 | 1 |
| 2 | baseline-handle-61 | Theodore Mcgrath | legacy-middle-31 | composite-mailing-33 | 7731887 | integrated-telephon-16 | AUT-2599 | FTS-2552 | primary-network-28 | 2024-03-05T16:08:00 | 101 | 2 | 2 |
| 3 | pilot-handle-62 | Patrick Mckee | compact-middle-32 | primary-mailing-34 | 4793464 | seasonal-telephon-17 | AUT-2605 | FTS-2553 | adaptive-network-29 | 2025-08-16T23:25:00 | 102 | 3 | 3 |
| 4 | extended-handle-63 | Jay Cunningham | composite-middle-33 | adaptive-mailing-35 | 3012821 | regional-telephon-18 | AUT-2611 | FTS-2554 | distributed-network-30 | 2022-01-27T06:42:00 | 103 | 4 | 4 |

Consider the entry for Friedrich Nietzsche, registered on 2023-10-21 and reachable at FTS-2551 and AUT-2593. His record is bound to network information center 100, host 1, and mailbox 1. Theodore Mcgrath, registered more recently on 2024-03-05, carries FTS-2552 and is associated with center 101, host 2, and mailbox 2. The pattern holds across all four records: each directory entry is a nexus point where personal identity converges with network infrastructure.

## Network Information Centers

Network information centers serve as the administrative and service-oriented layer of the directory architecture. Each center publishes a name, an operating institution, a sponsoring agency, and a set of service endpoints defined by port, protocol, and host. The service status—either active or deprecated—indicates whether the center currently provides operational support.

**Table `network_information_centers`**

| id | center_name | operating_institution | sponsoring_agency | service_port | service_protocol | service_host | service_status | directory_service_id |
|---|---|---|---|---|---|---|---|---|
| 100 | Legacy Protocol D | baseline-operatin-91 | The GEO Group Inc. | 30 | primary-service-46 | integrated-service-16 | active | 1000 |
| 101 | Regional Programme | pilot-operatin-92 | Tata Steel | 41 | adaptive-service-47 | seasonal-service-17 | deprecated | 1001 |
| 102 | Seasonal Standard | extended-operatin-93 | RECRUIT EXPRESS PTE LTD | 52 | distributed-service-48 | regional-service-18 | active | 1002 |
| 103 | Integrated Framework A | integrated-operatin-94 | American Institutes for Research | 63 | baseline-service-49 | legacy-service-19 | deprecated | 1003 |

Legacy Protocol D, operated by baseline-operatin-91 and sponsored by The GEO Group Inc., listens on port 30 using primary-service-46 at integrated-service-16 and holds active status. Its directory service identifier is 1000. Regional Programme, sponsored by Tata Steel, runs on port 41 with adaptive-service-47 and carries a deprecated status, signaling that its service lifecycle has concluded. Seasonal Standard and Integrated Framework A follow the same structural pattern, each anchoring a distinct service profile within the directory ecosystem.

## Directory Services

Directory services define the protocol-level mechanisms through which directory data is queried, resolved, and delivered. Each service specifies a name, a protocol, a port number, a host address, a response format, and a connection behavior. The response format distinguishes between human-readable and machine-readable output, while the connection behavior indicates whether the service maintains state across interactions.

**Table `directory_services`**

| id | service_name | protocol | port_number | host_address | response_format | connection_behavior | directory_entry_id | network_host_id |
|---|---|---|---|---|---|---|---|---|
| 1000 | Distributed Review | distributed-protocol-24 | 30 | adaptive-host-65 | human-readable | stateless | 1 | 1 |
| 1001 | Adaptive Initiative D | baseline-protocol-25 | 35 | distributed-host-66 | machine-readable | stateful | 2 | 2 |
| 1002 | Primary Model | pilot-protocol-26 | 40 | baseline-host-67 | human-readable | stateless | 3 | 3 |
| 1003 | Composite Cluster | extended-protocol-27 | 45 | pilot-host-68 | machine-readable | stateful | 4 | 4 |

Distributed Review, identified as service 1000, operates on distributed-protocol-24 at port 30, resolves against adaptive-host-65, returns human-readable responses, and behaves statelessly. It is linked to directory entry 1 and network host 1. Adaptive Initiative D, service 1001, uses baseline-protocol-25 at port 35, targets distributed-host-66, produces machine-readable output, and maintains stateful connections. The four services collectively span the matrix of response formats and connection behaviors, providing a balanced service portfolio for the directory system.

## Network Hosts

Network hosts represent the computational nodes that underpin the directory infrastructure. Each host carries a name, an IP address, a network type, an operating system, and a status indicator. The network type—ARPANET, MILNET, or DDN—reflects the underlying network fabric, while the host status signals whether the node is currently active or inactive.

**Table `network_hosts`**

| network_host_id | host_name | ip_address | network_type | operating_system | host_status | directory_entry_id | directory_service_id |
|---|---|---|---|---|---|---|---|
| 1 | Seasonal Initiative | legacy-ip-49 | ARPANET | adaptive-operatin-71 | active | 1 | 1000 |
| 2 | Integrated Model | compact-ip-50 | MILNET | distributed-operatin-72 | inactive | 2 | 1001 |
| 3 | Extended Cluster D | composite-ip-51 | DDN | baseline-operatin-73 | active | 3 | 1002 |
| 4 | Pilot Review | primary-ip-52 | ARPANET | pilot-operatin-74 | inactive | 4 | 1003 |

Seasonal Initiative, the host associated with directory entry 1, resides on legacy-ip-49 within the ARPANET fabric, runs adaptive-operatin-71, and is currently active. Integrated Model, linked to entry 2, sits on compact-ip-50 in the MILNET environment, executes distributed-operatin-72, and holds an inactive status. Extended Cluster D and Pilot Review complete the set, with the former active on DDN and the latter inactive on ARPANET. Each host is also bound to a directory service, creating a direct path from computational resource to service protocol.

## Network Mailboxes

Network mailboxes provide the messaging layer of the directory architecture. Each mailbox has an address, a type (user or organization), and a status (active or inactive). Mailboxes serve as the communication endpoint for directory entries, enabling both individual and organizational messaging within the networked system.

**Table `network_mailboxes`**

| id | mailbox_address | mailbox_type | mailbox_status |
|---|---|---|---|
| 1 | integrated-mailbox-82 | user | active |
| 2 | seasonal-mailbox-83 | organization | inactive |
| 3 | regional-mailbox-84 | user | active |
| 4 | legacy-mailbox-85 | organization | inactive |

The integrated-mailbox-82 mailbox, of type user and currently active, is the messaging endpoint for directory entry 1. seasonal-mailbox-83, an organization-type mailbox in inactive state, corresponds to entry 2. regional-mailbox-84 and legacy-mailbox-85 follow the same pattern, with the former active and user-oriented, and the latter inactive and organization-oriented. The mailbox status directly reflects the operational readiness of the associated directory entry's communication channel.

## Junction Records and Cross-References

The relationship between directory entries and network information centers is mediated through the centers_entries table, which records which entries are associated with which centers. This many-to-many relationship allows a single directory entry to be linked to multiple centers and a single center to serve multiple entries.

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

Network information center 100 serves directory entries 1 and 2. Center 101 serves entries 2 and 3. Center 102 serves entries 3 and 4. Center 103 serves entries 4 and 1. The pattern reveals a cyclic overlap: each entry is served by exactly two centers, and each center serves exactly two entries. This overlapping topology ensures redundancy—if one center becomes deprecated, the associated entries retain coverage through their second center.

The mailboxes_entries table performs a similar bridging function for the mailbox-to-entry relationship, recording which mailboxes are associated with which directory entries.

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

## Cross-Domain Views

The directory architecture gains its analytical power through a set of joined views that bring together records from multiple base tables. Each view answers a specific operational question by combining identity, service, host, and mailbox data into a single queryable result.

The view v_directory_entry_network_information_center joins directory entries with their associated network information centers, answering the question: which centers serve which directory entries? Reading the row for Friedrich Nietzsche, we see his entry linked to Legacy Protocol D, a center sponsored by The GEO Group Inc. operating on port 30 with active status. Theodore Mcgrath's entry maps to Regional Programme, a deprecated center on port 41. This view is essential for capacity planning and service coverage analysis.

The view v_directory_entry_network_host brings together directory entries and their associated network hosts, answering: which hosts are responsible for which directory entries? Friedrich Nietzsche's entry is served by Seasonal Initiative, an active ARPANET host running adaptive-operatin-71. Theodore Mcgrath's entry maps to Integrated Model, an inactive MILNET host executing distributed-operatin-72. This view supports host utilization audits and network type distribution analysis.

The view v_directory_entry_network_mailbox joins directory entries with their network mailboxes, answering: which mailboxes correspond to which directory entries? Friedrich Nietzsche's entry is linked to integrated-mailbox-82, an active user mailbox. Theodore Mcgrath's entry maps to seasonal-mailbox-83, an inactive organization mailbox. This view is critical for communication channel audits and mailbox lifecycle management.

The view v_network_information_center_directory_entry_detail inverts the perspective, starting from network information centers and listing the directory entries they serve. Center 100 (Legacy Protocol D) serves Friedrich Nietzsche and Theodore Mcgrath. Center 101 (Regional Programme) serves Theodore Mcgrath and Patrick Mckee. This center-centric view is useful for identifying which entries depend on deprecated services and require migration.

The view v_network_information_center_directory_service joins network information centers with their directory services, answering: which directory services are associated with which centers? Center 100 maps to service 1000 (Distributed Review), a stateless, human-readable service on distributed-protocol-24. Center 101 maps to service 1001 (Adaptive Initiative D), a stateful, machine-readable service on baseline-protocol-25. This view supports protocol portfolio analysis and service lifecycle tracking.

The view v_directory_service_directory_entry joins directory services with their associated directory entries, answering: which directory entries are resolved through which services? Service 1000 (Distributed Review) resolves entry 1 (Friedrich Nietzsche). Service 1001 (Adaptive Initiative D) resolves entry 2 (Theodore Mcgrath). This view is essential for tracing the resolution path from service protocol to individual identity.

The view v_directory_service_network_host joins directory services with their associated network hosts, answering: which hosts execute which directory services? Service 1000 runs on Seasonal Initiative (host 1), an active ARPANET node. Service 1001 runs on Integrated Model (host 2), an inactive MILNET node. This view supports host-to-service mapping and infrastructure dependency analysis.

The view v_network_host_directory_entry joins network hosts with their associated directory entries, answering: which directory entries are backed by which hosts? Host 1 (Seasonal Initiative) backs entry 1 (Friedrich Nietzsche). Host 2 (Integrated Model) backs entry 2 (Theodore Mcgrath). This view is valuable for host capacity planning and entry availability assessment.

The view v_network_host_directory_service joins network hosts with their associated directory services, answering: which services run on which hosts? Host 1 (Seasonal Initiative) runs service 1000 (Distributed Review). Host 2 (Integrated Model) runs service 1001 (Adaptive Initiative D). This view supports service placement analysis and host workload evaluation.

The view v_network_mailbox_directory_entry_detail joins network mailboxes with their associated directory entries, answering: which directory entries use which mailboxes? Mailbox integrated-mailbox-82 serves Friedrich Nietzsche. Mailbox seasonal-mailbox-83 serves Theodore Mcgrath. This view is essential for mailbox utilization analysis and communication channel auditing.

## Synthesis

The directory architecture described here forms a tightly interwoven system of identity, service, computation, and messaging. Directory entries anchor the system as the primary identity records, each bound to a network information center, a network host, and a network mailbox. Network information centers provide the administrative and service layer, with overlapping coverage ensured by the centers_entries junction table. Directory services define the protocol-level mechanisms for data resolution, while network hosts supply the computational substrate. Network mailboxes complete the picture by providing the messaging endpoint.

The ten cross-domain views collectively enable every possible cross-reference between the five base entities, supporting operational queries from host utilization to service lifecycle tracking. The data values—Friedrich Nietzsche at FTS-2551 on an active ARPANET host, Theodore Mcgrath at FTS-2552 on an inactive MILNET node, Patrick Mckee and Jay Cunningham completing the quartet—illustrate a system in which identity, infrastructure, and service are inseparable. Practitioners who understand these relationships can diagnose service disruptions, plan capacity, and manage the lifecycle of directory resources with precision.

## Data appendix

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
