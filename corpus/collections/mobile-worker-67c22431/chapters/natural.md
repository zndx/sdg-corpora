## Mobile Workforce Access Architecture

Modern enterprises distribute their digital assets across a layered access infrastructure that connects remote personnel to corporate resources through controlled gateways. A mobile worker—whether operating from a laptop, tablet, or smartphone—must authenticate through a designated server, traverse a VPN gateway, enter a corporate network, and ultimately reach a business resource whose access is governed by a user role. The records in this system capture every element of that chain, from the physical equipment powering each gateway to the firmware version running on network hardware, from the encryption protocol securing the tunnel to the last login timestamp of the individual on the other side. Understanding how these records interlock is essential for capacity planning, security auditing, and operational troubleshooting.

**Table `mobile_workers`**

| mobile_worker_id | worker_id | employee_name | department | role | device_type | os_platform | authentication_realm | last_login_timestamp | authentication_server_id | user_role_id | v_p_n_gateway_id | created_at |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | Tangguhkan | Cole Vasquez | adaptive-departme-89 | Standard | Laptop | Windows | AD | 2024-11-16T10:42:00 | 100 | 100 | 1 | 2025-01-01 00:14:00 |
| 2 | 207 | Susan Levy | distributed-departme-90 | Admin | Tablet | macOS | LDAP | 2025-04-27T17:59:00 | 101 | 101 | 2 | 2025-02-06 03:14:00 |
| 3 | 7021001070072 | Tasha Rodriguez | baseline-departme-91 | Guest | Smartphone | Linux | RADIUS | 2022-09-11T00:16:00 | 102 | 102 | 3 | 2025-03-11 06:14:00 |
| 4 | 3717625 | Sarah Villanueva | pilot-departme-92 | Standard | Laptop | Android | AD | 2023-02-22T07:33:00 | 103 | 103 | 4 | 2025-04-16 09:14:00 |

The mobile workers table is the human anchor of the architecture. Each row represents a person who requires remote access, carrying a unique worker identifier, a full name, and a department assignment such as adaptive-departme-89 or pilot-departme-92. The role column distinguishes between Standard, Admin, and Guest access tiers, while the device_type and os_platform columns describe the endpoint hardware and operating system—Laptops running Windows, Tablets on macOS, Smartphones on Linux or Android. The authentication_realm field indicates which identity provider the worker belongs to, with values like AD, LDAP, and RADIUS appearing across the dataset. The last_login_timestamp records the most recent successful authentication, ranging from 2022 through 2025, and the foreign keys authentication_server_id, user_role_id, and v_p_n_gateway_id tie each worker to the infrastructure components they depend on.

**Table `v_p_n_gateways`**

| v_p_n_gateway_id | gateway_id | location | region | max_concurrent_users | encryption_protocol | status | capacity_utilization | corporate_network_id | equipment_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 9085257 | New York | NA | 33 | IPsec | Active | 7.20 | 1 | 128 |
| 2 | 1996915 | Houston | EMEA | 43 | SSL | Maintenance | 9.40 | 2 | lu_tax_code_template_m_I_2 |
| 3 | 3001009030300 | Sacramento | LATAM | 53 | IPsec | Offline | 11.60 | 3 | 1336190 |
| 4 | 884341 | London | APAC | 63 | SSL | Active | 13.80 | 4 | 611514 |

VPN gateways serve as the perimeter choke points through which all remote traffic flows. The v_p_n_gateways table catalogs these gateways by location and region: a gateway in New York serving the NA region, another in Houston for EMEA, one in Sacramento covering LATAM, and a fourth in London for APAC. Each gateway has a maximum concurrent user capacity—33, 43, 53, and 63 respectively—and an encryption protocol designation of either IPsec or SSL. The status column reflects operational state, with Active, Maintenance, and Offline states represented. Capacity utilization values, such as 7.20 and 13.80, indicate the current load relative to maximum capacity. The corporate_network_id and equipment_id columns link each gateway to its parent network and the physical or virtual equipment it runs on.

**Table `corporate_networks`**

| id | network_id | network_name | ip_range | security_level | last_audit_date | v_p_n_gateway_id |
|---|---|---|---|---|---|---|
| 1 | e6196808-8fd1-11eb-924d-9cd76263cbd0 | Seasonal Programme | integrated-ip-70 | High | 2023-10-23 | 1 |
| 2 | 7441146 | Integrated Standard | seasonal-ip-71 | Medium | 2024-03-07 | 2 |
| 3 | 8387535 | Extended Framework D | regional-ip-72 | Low | 2025-08-18 | 3 |
| 4 | 6589 | Pilot Protocol | legacy-ip-73 | High | 2022-01-02 | 4 |

Corporate networks define the internal address spaces and security postures that gateways protect. Each network carries a UUID-style network identifier, a descriptive name like Seasonal Programme or Pilot Protocol, and an IP range label such as integrated-ip-70 or legacy-ip-73. The security_level column assigns a classification of High, Medium, or Low, while last_audit_date records the most recent compliance review, spanning from 2022 to 2025. The v_p_n_gateway_id foreign key establishes which gateway provides remote access to that network, creating a direct mapping between perimeter infrastructure and internal network segments.

**Table `business_resources`**

| id | resource_id | resource_name | resource_type | access_protocol | is_s_s_o_supported | max_connections | user_role_id | corporate_network_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|
| 100 | 1167 | Adaptive Corridor | Web URL | HTTPS | true | 28 | 100 | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 101 | 2106708 | Primary Series | Terminal Service | RDP | false | 34 | 101 | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 102 | 4180945 | Composite Assessment D | File Share | SSH | true | 40 | 102 | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 103 | 10238270 | Compact Survey | Email | SMB | false | 46 | 103 | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Business resources are the actual applications, services, and data stores that workers need to reach. The resource_name column contains identifiers like Adaptive Corridor, Primary Series, and Compact Survey, while resource_type distinguishes between Web URL, Terminal Service, File Share, and Email access methods. The access_protocol column specifies the transport—HTTPS, RDP, SSH, or SMB—and the is_s_s_o_supported boolean indicates whether single sign-on is available for that resource. The max_connections field sets a concurrency limit, ranging from 28 to 46 in the current dataset. Each resource is assigned to a user_role and a corporate_network, defining both the permission tier and the network segment where the resource resides.

**Table `user_roles`**

| id | role_id | role_name | role_description | max_resources | mobile_worker_id |
|---|---|---|---|---|---|
| 100 | 2933463 | Terry Pratchett | Composite Programme | 21 | 1 |
| 101 | id_3 | Theodore Mcgrath | Compact Standard A | 30 | 2 |
| 102 | gd_taxc_2111 | Janice Johnston | Legacy Framework | 39 | 3 |
| 103 | 994a4fa0-9bad-11eb-a8a2-19ed5c03f8d3 | Theodore Mcgrath | Regional Protocol | 48 | 4 |

User roles encode the permission model that governs resource access. The role_name column contains entries such as Terry Pratchett, Theodore Mcgrath, and Janice Johnston, while role_description provides a functional label like Composite Programme, Compact Standard A, and Legacy Framework. The max_resources column sets a quota on how many resources a role can access, with values of 21, 30, 39, and 48. The mobile_worker_id foreign key ties each role to a specific worker, establishing a one-to-one assignment in this dataset.

**Table `network_equipments`**

| equipment_id | manufacturer | model | firmware_version | status | v_p_n_gateway_id |
|---|---|---|---|---|---|
| 128 | Standard Chartered | composite-model-81 | distributed-firmware-48 | Operational | 1 |
| lu_tax_code_template_m_I_2 | General Motors | primary-model-82 | baseline-firmware-49 | Degraded | 2 |
| 1336190 | Column Name cannot be empty | adaptive-model-83 | pilot-firmware-50 | Failed | 3 |
| 611514 | Financial Information Service Co. Ltd. | distributed-model-84 | extended-firmware-51 | Operational | 4 |

Network equipment records the hardware or virtual instances that host VPN gateways. The manufacturer column lists entities such as Standard Chartered, General Motors, and Financial Information Service Co. Ltd., while the model column provides designations like composite-model-81 and distributed-model-84. The firmware_version field tracks the running software, with values including distributed-firmware-48 and extended-firmware-51. The status column reports operational health as Operational, Degraded, or Failed. The v_p_n_gateway_id foreign key links each equipment record to the gateway it supports, enabling infrastructure-level diagnostics.

**Table `authentication_servers`**

| id | server_id | server_type | server_address | is_primary | mobile_worker_id |
|---|---|---|---|---|---|
| 100 | 911352d5dab64576b7a6da51aa69d76d | Active Directory | integrated-server-28 | true | 1 |
| 101 | 1450637 | LDAP | seasonal-server-29 | false | 2 |
| 102 | 4985152 | RADIUS | regional-server-30 | true | 3 |
| 103 | 9736887 | Active Directory | legacy-server-31 | false | 4 |

Authentication servers are the identity providers that validate worker credentials. Each server is identified by an authentication_server_id and associated with a specific authentication realm—AD, LDAP, or RADIUS—matching the realms recorded in the mobile workers table. The server records capture configuration details and operational status that determine whether a worker can successfully authenticate.

**Table `gateways_workers`**

| v_p_n_gateway_id | mobile_worker_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

The gateways_workers table establishes the many-to-many relationships between VPN gateways and mobile workers. In the current dataset, each worker is assigned to exactly one gateway, but the junction table structure supports scenarios where workers rotate between gateways or where a single gateway serves multiple workers across different time windows.

**Table `networks_resources`**

| corporate_network_id | business_resource_id |
|---|---|
| 1 | 100 |
| 1 | 101 |
| 2 | 101 |
| 2 | 102 |
| 3 | 102 |
| 3 | 103 |
| 4 | 103 |
| 4 | 100 |

The networks_resources table links corporate networks to the business resources they host. This junction table enables a network to contain multiple resources and a resource to be accessible from multiple network segments, supporting complex multi-site architectures.

**Table `roles_resources`**

| user_role_id | business_resource_id |
|---|---|
| 100 | 100 |
| 100 | 101 |
| 101 | 101 |
| 101 | 102 |
| 102 | 102 |
| 102 | 103 |
| 103 | 103 |
| 103 | 100 |

The roles_resources table defines which user roles are permitted to access which business resources. This many-to-many mapping allows a single role to grant access to multiple resources and a single resource to be accessible by multiple roles, providing fine-grained permission control.

### Gateway-to-Network Relationships

**View `v_p_n_gateway_corporate_network_view`**

```sql
CREATE VIEW v_p_n_gateway_corporate_network_view AS
SELECT a.v_p_n_gateway_id, a.gateway_id, a.location, a.region, b.id AS network_id, b.network_id AS network_network_id, b.network_name AS network_network_name
FROM v_p_n_gateways a JOIN corporate_networks b ON a.corporate_network_id = b.id;
```

| v_p_n_gateway_id | gateway_id | location | region | network_id | network_network_id | network_network_name |
|---|---|---|---|---|---|---|
| 1 | 9085257 | New York | NA | 1 | e6196808-8fd1-11eb-924d-9cd76263cbd0 | Seasonal Programme |
| 2 | 1996915 | Houston | EMEA | 2 | 7441146 | Integrated Standard |
| 3 | 3001009030300 | Sacramento | LATAM | 3 | 8387535 | Extended Framework D |
| 4 | 884341 | London | APAC | 4 | 6589 | Pilot Protocol |

This view joins VPN gateways with their associated corporate networks, answering the question of which gateway provides remote access to which internal network segment. The result reveals that gateway 9085257 in New York serves the Seasonal Programme network (integrated-ip-70) with High security classification, while gateway 884341 in London serves the Pilot Protocol network (legacy-ip-73), also classified as High security. The encryption protocol and gateway status become directly attributable to the network they protect, enabling capacity and security audits at the network level.

### Gateway-to-Equipment Relationships

**View `v_p_n_gateway_network_equipment_view`**

```sql
CREATE VIEW v_p_n_gateway_network_equipment_view AS
SELECT a.v_p_n_gateway_id, a.gateway_id, a.location, a.region, b.equipment_id AS equipment_equipment_id, b.manufacturer AS equipment_manufacturer, b.model AS equipment_model
FROM v_p_n_gateways a JOIN network_equipments b ON a.equipment_id = b.equipment_id;
```

| v_p_n_gateway_id | gateway_id | location | region | equipment_equipment_id | equipment_manufacturer | equipment_model |
|---|---|---|---|---|---|---|
| 1 | 9085257 | New York | NA | 128 | Standard Chartered | composite-model-81 |
| 2 | 1996915 | Houston | EMEA | lu_tax_code_template_m_I_2 | General Motors | primary-model-82 |
| 3 | 3001009030300 | Sacramento | LATAM | 1336190 | Column Name cannot be empty | adaptive-model-83 |
| 4 | 884341 | London | APAC | 611514 | Financial Information Service Co. Ltd. | distributed-model-84 |

This view connects VPN gateways to the network equipment that hosts them, answering which hardware or virtual instance is responsible for each gateway's operation. Gateway 9085257 runs on equipment manufactured by Standard Chartered (model composite-model-81) with firmware distributed-firmware-48 in Operational status. In contrast, gateway 3001009030300 in Sacramento runs on equipment from Column Name cannot be empty (model adaptive-model-83) with firmware pilot-firmware-50 in Failed status—a condition that would require immediate remediation. The view makes it possible to correlate gateway performance issues with specific equipment health states.

### Gateway-to-Worker Relationships

**View `v_p_n_gateway_mobile_worker_detail_view`**

```sql
CREATE VIEW v_p_n_gateway_mobile_worker_detail_view AS
SELECT a.v_p_n_gateway_id, a.gateway_id, a.location, b.mobile_worker_id AS worker_mobile_worker_id, b.worker_id AS worker_worker_id, b.employee_name AS worker_employee_name
FROM v_p_n_gateways a
  JOIN gateways_workers j ON j.v_p_n_gateway_id = a.v_p_n_gateway_id
  JOIN mobile_workers b ON b.mobile_worker_id = j.mobile_worker_id;
```

| v_p_n_gateway_id | gateway_id | location | worker_mobile_worker_id | worker_worker_id | worker_employee_name |
|---|---|---|---|---|---|
| 1 | 9085257 | New York | 1 | Tangguhkan | Cole Vasquez |
| 1 | 9085257 | New York | 2 | 207 | Susan Levy |
| 2 | 1996915 | Houston | 2 | 207 | Susan Levy |
| 2 | 1996915 | Houston | 3 | 7021001070072 | Tasha Rodriguez |
| 3 | 3001009030300 | Sacramento | 3 | 7021001070072 | Tasha Rodriguez |
| 3 | 3001009030300 | Sacramento | 4 | 3717625 | Sarah Villanueva |
| 4 | 884341 | London | 4 | 3717625 | Sarah Villanueva |
| 4 | 884341 | London | 1 | Tangguhkan | Cole Vasquez |

This view joins VPN gateways with the mobile workers they serve, answering which workers are routed through which gateway. Worker Cole Vasquez (worker_id Tangguhkan) from department adaptive-departme-89 is assigned to gateway 9085257 in New York, while worker Tasha Rodriguez (worker_id 7021001070072) from department baseline-departme-91 is assigned to gateway 3001009030300 in Sacramento. The view surfaces the worker's device type, operating system, and authentication realm alongside the gateway's location and encryption protocol, providing a complete picture of the access path for each worker.

### Worker-to-Gateway Relationships

**View `mobile_worker_v_p_n_gateway_view`**

```sql
CREATE VIEW mobile_worker_v_p_n_gateway_view AS
SELECT a.mobile_worker_id, a.worker_id, a.employee_name, a.department, b.v_p_n_gateway_id AS gateway_v_p_n_gateway_id, b.gateway_id AS gateway_gateway_id, b.location AS gateway_location
FROM mobile_workers a JOIN v_p_n_gateways b ON a.v_p_n_gateway_id = b.v_p_n_gateway_id;
```

| mobile_worker_id | worker_id | employee_name | department | gateway_v_p_n_gateway_id | gateway_gateway_id | gateway_location |
|---|---|---|---|---|---|---|
| 1 | Tangguhkan | Cole Vasquez | adaptive-departme-89 | 1 | 9085257 | New York |
| 2 | 207 | Susan Levy | distributed-departme-90 | 2 | 1996915 | Houston |
| 3 | 7021001070072 | Tasha Rodriguez | baseline-departme-91 | 3 | 3001009030300 | Sacramento |
| 4 | 3717625 | Sarah Villanueva | pilot-departme-92 | 4 | 884341 | London |

This view presents the inverse perspective, joining mobile workers with their assigned VPN gateways. It confirms that Susan Levy (worker_id 207), an Admin-level worker on a macOS Tablet using LDAP authentication, is routed through gateway 1996915 in Houston, which operates under SSL encryption and is currently in Maintenance status. The view is useful for identifying workers who may be affected by gateway maintenance events or capacity constraints.

### Worker-to-Authentication Server Relationships

**View `mobile_worker_authentication_server_view`**

```sql
CREATE VIEW mobile_worker_authentication_server_view AS
SELECT a.mobile_worker_id, a.worker_id, a.employee_name, a.department, b.id AS server_id, b.server_id AS server_server_id, b.server_type AS server_server_type
FROM mobile_workers a JOIN authentication_servers b ON a.authentication_server_id = b.id;
```

| mobile_worker_id | worker_id | employee_name | department | server_id | server_server_id | server_server_type |
|---|---|---|---|---|---|---|
| 1 | Tangguhkan | Cole Vasquez | adaptive-departme-89 | 100 | 911352d5dab64576b7a6da51aa69d76d | Active Directory |
| 2 | 207 | Susan Levy | distributed-departme-90 | 101 | 1450637 | LDAP |
| 3 | 7021001070072 | Tasha Rodriguez | baseline-departme-91 | 102 | 4985152 | RADIUS |
| 4 | 3717625 | Sarah Villanueva | pilot-departme-92 | 103 | 9736887 | Active Directory |

This view joins mobile workers with their authentication servers, answering which identity provider validates each worker's credentials. The result maps workers to their authentication realms—AD, LDAP, or RADIUS—and surfaces the server's operational configuration. This relationship is critical for diagnosing authentication failures, as a worker's last_login_timestamp can be correlated with server availability and configuration changes.

### Authentication Server-to-Worker Relationships

**View `authentication_server_mobile_worker_view`**

```sql
CREATE VIEW authentication_server_mobile_worker_view AS
SELECT a.id, a.server_id, a.server_type, a.server_address, b.mobile_worker_id AS worker_mobile_worker_id, b.worker_id AS worker_worker_id, b.employee_name AS worker_employee_name
FROM authentication_servers a JOIN mobile_workers b ON a.mobile_worker_id = b.mobile_worker_id;
```

| id | server_id | server_type | server_address | worker_mobile_worker_id | worker_worker_id | worker_employee_name |
|---|---|---|---|---|---|---|
| 100 | 911352d5dab64576b7a6da51aa69d76d | Active Directory | integrated-server-28 | 1 | Tangguhkan | Cole Vasquez |
| 101 | 1450637 | LDAP | seasonal-server-29 | 2 | 207 | Susan Levy |
| 102 | 4985152 | RADIUS | regional-server-30 | 3 | 7021001070072 | Tasha Rodriguez |
| 103 | 9736887 | Active Directory | legacy-server-31 | 4 | 3717625 | Sarah Villanueva |

This view presents the inverse perspective, joining authentication servers with the mobile workers they authenticate. It reveals that a single authentication server may handle credentials for multiple workers across different departments and device types, enabling capacity planning for identity infrastructure.

### Worker-to-Role Relationships

**View `mobile_worker_user_role_view`**

```sql
CREATE VIEW mobile_worker_user_role_view AS
SELECT a.mobile_worker_id, a.worker_id, a.employee_name, a.department, b.id AS role_id, b.role_id AS role_role_id, b.role_name AS role_role_name
FROM mobile_workers a JOIN user_roles b ON a.user_role_id = b.id;
```

| mobile_worker_id | worker_id | employee_name | department | role_id | role_role_id | role_role_name |
|---|---|---|---|---|---|---|
| 1 | Tangguhkan | Cole Vasquez | adaptive-departme-89 | 100 | 2933463 | Terry Pratchett |
| 2 | 207 | Susan Levy | distributed-departme-90 | 101 | id_3 | Theodore Mcgrath |
| 3 | 7021001070072 | Tasha Rodriguez | baseline-departme-91 | 102 | gd_taxc_2111 | Janice Johnston |
| 4 | 3717625 | Sarah Villanueva | pilot-departme-92 | 103 | 994a4fa0-9bad-11eb-a8a2-19ed5c03f8d3 | Theodore Mcgrath |

This view joins mobile workers with their assigned user roles, answering what permission tier each worker holds. Worker Cole Vasquez holds the role named Terry Pratchett (role_description: Composite Programme) with a maximum resource quota of 21, while worker Sarah Villanueva holds the role named Theodore Mcgrath (role_description: Regional Protocol) with a quota of 48. The view makes it straightforward to audit whether worker permissions align with their departmental responsibilities and device types.

### Role-to-Worker Relationships

**View `user_role_mobile_worker_view`**

```sql
CREATE VIEW user_role_mobile_worker_view AS
SELECT a.id, a.role_id, a.role_name, a.role_description, b.mobile_worker_id AS worker_mobile_worker_id, b.worker_id AS worker_worker_id, b.employee_name AS worker_employee_name
FROM user_roles a JOIN mobile_workers b ON a.mobile_worker_id = b.mobile_worker_id;
```

| id | role_id | role_name | role_description | worker_mobile_worker_id | worker_worker_id | worker_employee_name |
|---|---|---|---|---|---|---|
| 100 | 2933463 | Terry Pratchett | Composite Programme | 1 | Tangguhkan | Cole Vasquez |
| 101 | id_3 | Theodore Mcgrath | Compact Standard A | 2 | 207 | Susan Levy |
| 102 | gd_taxc_2111 | Janice Johnston | Legacy Framework | 3 | 7021001070072 | Tasha Rodriguez |
| 103 | 994a4fa0-9bad-11eb-a8a2-19ed5c03f8d3 | Theodore Mcgrath | Regional Protocol | 4 | 3717625 | Sarah Villanueva |

This view presents the inverse perspective, joining user roles with the mobile workers assigned to them. It confirms the one-to-one assignment pattern in the current dataset and provides a quick reference for determining which worker holds a given role, useful for access reviews and permission escalations.

### Role-to-Resource Relationships

**View `user_role_business_resource_detail_view`**

```sql
CREATE VIEW user_role_business_resource_detail_view AS
SELECT a.id, a.role_id, a.role_name, b.id AS resource_id, b.resource_id AS resource_resource_id, b.resource_name AS resource_resource_name
FROM user_roles a
  JOIN roles_resources j ON j.user_role_id = a.id
  JOIN business_resources b ON b.id = j.business_resource_id;
```

| id | role_id | role_name | resource_id | resource_resource_id | resource_resource_name |
|---|---|---|---|---|---|
| 100 | 2933463 | Terry Pratchett | 100 | 1167 | Adaptive Corridor |
| 100 | 2933463 | Terry Pratchett | 101 | 2106708 | Primary Series |
| 101 | id_3 | Theodore Mcgrath | 101 | 2106708 | Primary Series |
| 101 | id_3 | Theodore Mcgrath | 102 | 4180945 | Composite Assessment D |
| 102 | gd_taxc_2111 | Janice Johnston | 102 | 4180945 | Composite Assessment D |
| 102 | gd_taxc_2111 | Janice Johnston | 103 | 10238270 | Compact Survey |
| 103 | 994a4fa0-9bad-11eb-a8a2-19ed5c03f8d3 | Theodore Mcgrath | 103 | 10238270 | Compact Survey |
| 103 | 994a4fa0-9bad-11eb-a8a2-19ed5c03f8d3 | Theodore Mcgrath | 100 | 1167 | Adaptive Corridor |

This view joins user roles with the business resources they can access, answering what resources are available to each permission tier. The role Terry Pratchett (quota 21) is associated with the resource Adaptive Corridor (resource_type: Web URL, access_protocol: HTTPS), while the role Janice Johnston (quota 39) is associated with Composite Assessment D (resource_type: File Share, access_protocol: SSH). The view surfaces the resource's SSO support status and maximum connection limit alongside the role's quota, enabling permission audits.

### Resource-to-Role Relationships

**View `business_resource_user_role_view`**

```sql
CREATE VIEW business_resource_user_role_view AS
SELECT a.id, a.resource_id, a.resource_name, a.resource_type, b.id AS role_id, b.role_id AS role_role_id, b.role_name AS role_role_name
FROM business_resources a JOIN user_roles b ON a.user_role_id = b.id;
```

| id | resource_id | resource_name | resource_type | role_id | role_role_id | role_role_name |
|---|---|---|---|---|---|---|
| 100 | 1167 | Adaptive Corridor | Web URL | 100 | 2933463 | Terry Pratchett |
| 101 | 2106708 | Primary Series | Terminal Service | 101 | id_3 | Theodore Mcgrath |
| 102 | 4180945 | Composite Assessment D | File Share | 102 | gd_taxc_2111 | Janice Johnston |
| 103 | 10238270 | Compact Survey | Email | 103 | 994a4fa0-9bad-11eb-a8a2-19ed5c03f8d3 | Theodore Mcgrath |

This view presents the inverse perspective, joining business resources with the user roles that can access them. It reveals that the resource Primary Series (resource_type: Terminal Service, access_protocol: RDP) is accessible under the role Theodore Mcgrath (Compact Standard A), and that the resource Compact Survey (resource_type: Email, access_protocol: SMB) is accessible under the role Theodore Mcgrath (Regional Protocol). The view is useful for identifying resources that may be over- or under-provisioned relative to the number of roles that can reach them.

### Network-to-Resource Relationships

**View `corporate_network_business_resource_detail_view`**

```sql
CREATE VIEW corporate_network_business_resource_detail_view AS
SELECT a.id, a.network_id, a.network_name, b.id AS resource_id, b.resource_id AS resource_resource_id, b.resource_name AS resource_resource_name
FROM corporate_networks a
  JOIN networks_resources j ON j.corporate_network_id = a.id
  JOIN business_resources b ON b.id = j.business_resource_id;
```

| id | network_id | network_name | resource_id | resource_resource_id | resource_resource_name |
|---|---|---|---|---|---|
| 1 | e6196808-8fd1-11eb-924d-9cd76263cbd0 | Seasonal Programme | 100 | 1167 | Adaptive Corridor |
| 1 | e6196808-8fd1-11eb-924d-9cd76263cbd0 | Seasonal Programme | 101 | 2106708 | Primary Series |
| 2 | 7441146 | Integrated Standard | 101 | 2106708 | Primary Series |
| 2 | 7441146 | Integrated Standard | 102 | 4180945 | Composite Assessment D |
| 3 | 8387535 | Extended Framework D | 102 | 4180945 | Composite Assessment D |
| 3 | 8387535 | Extended Framework D | 103 | 10238270 | Compact Survey |
| 4 | 6589 | Pilot Protocol | 103 | 10238270 | Compact Survey |
| 4 | 6589 | Pilot Protocol | 100 | 1167 | Adaptive Corridor |

This view joins corporate networks with the business resources they host, answering which resources reside within which network segment. The Seasonal Programme network (integrated-ip-70, High security) hosts the resource Adaptive Corridor, while the Integrated Standard network (seasonal-ip-71, Medium security) hosts the resource Primary Series. The view surfaces the resource's access protocol and SSO support status alongside the network's security classification, enabling compliance assessments.

### Resource-to-Network Relationships

**View `business_resource_corporate_network_view`**

```sql
CREATE VIEW business_resource_corporate_network_view AS
SELECT a.id, a.resource_id, a.resource_name, a.resource_type, b.id AS network_id, b.network_id AS network_network_id, b.network_name AS network_network_name
FROM business_resources a JOIN corporate_networks b ON a.corporate_network_id = b.id;
```

| id | resource_id | resource_name | resource_type | network_id | network_network_id | network_network_name |
|---|---|---|---|---|---|---|
| 100 | 1167 | Adaptive Corridor | Web URL | 1 | e6196808-8fd1-11eb-924d-9cd76263cbd0 | Seasonal Programme |
| 101 | 2106708 | Primary Series | Terminal Service | 2 | 7441146 | Integrated Standard |
| 102 | 4180945 | Composite Assessment D | File Share | 3 | 8387535 | Extended Framework D |
| 103 | 10238270 | Compact Survey | Email | 4 | 6589 | Pilot Protocol |

This view presents the inverse perspective, joining business resources with the corporate networks they belong to. It confirms that each resource is assigned to exactly one network in the current dataset and provides a quick reference for locating a resource within the network topology.

### Gateway-to-Corporate-Network Relationships

**View `corporate_network_v_p_n_gateway_view`**

```sql
CREATE VIEW corporate_network_v_p_n_gateway_view AS
SELECT a.id, a.network_id, a.network_name, a.ip_range, b.v_p_n_gateway_id AS gateway_v_p_n_gateway_id, b.gateway_id AS gateway_gateway_id, b.location AS gateway_location
FROM corporate_networks a JOIN v_p_n_gateways b ON a.v_p_n_gateway_id = b.v_p_n_gateway_id;
```

| id | network_id | network_name | ip_range | gateway_v_p_n_gateway_id | gateway_gateway_id | gateway_location |
|---|---|---|---|---|---|---|
| 1 | e6196808-8fd1-11eb-924d-9cd76263cbd0 | Seasonal Programme | integrated-ip-70 | 1 | 9085257 | New York |
| 2 | 7441146 | Integrated Standard | seasonal-ip-71 | 2 | 1996915 | Houston |
| 3 | 8387535 | Extended Framework D | regional-ip-72 | 3 | 3001009030300 | Sacramento |
| 4 | 6589 | Pilot Protocol | legacy-ip-73 | 4 | 884341 | London |

This view joins corporate networks with their associated VPN gateways, answering which gateway provides remote access to each network. The Seasonal Programme network (High security, last audit 2023-10-23) is served by gateway 9085257 in New York with IPsec encryption, while the Extended Framework D network (Low security, last audit 2025-08-18) is served by gateway 3001009030300 in Sacramento, also using IPsec. The view is essential for capacity planning, as it reveals which gateways are handling traffic for which security-classified networks.

### Equipment-to-Gateway Relationships

**View `network_equipment_v_p_n_gateway_view`**

```sql
CREATE VIEW network_equipment_v_p_n_gateway_view AS
SELECT a.equipment_id, a.manufacturer, a.model, a.firmware_version, b.v_p_n_gateway_id AS gateway_v_p_n_gateway_id, b.gateway_id AS gateway_gateway_id, b.location AS gateway_location
FROM network_equipments a JOIN v_p_n_gateways b ON a.v_p_n_gateway_id = b.v_p_n_gateway_id;
```

| equipment_id | manufacturer | model | firmware_version | gateway_v_p_n_gateway_id | gateway_gateway_id | gateway_location |
|---|---|---|---|---|---|---|
| 128 | Standard Chartered | composite-model-81 | distributed-firmware-48 | 1 | 9085257 | New York |
| lu_tax_code_template_m_I_2 | General Motors | primary-model-82 | baseline-firmware-49 | 2 | 1996915 | Houston |
| 1336190 | Column Name cannot be empty | adaptive-model-83 | pilot-firmware-50 | 3 | 3001009030300 | Sacramento |
| 611514 | Financial Information Service Co. Ltd. | distributed-model-84 | extended-firmware-51 | 4 | 884341 | London |

This view joins network equipment with the VPN gateways they host, answering which hardware instance is responsible for each gateway's operation. The equipment manufactured by Standard Chartered (model composite-model-81, firmware distributed-firmware-48, status Operational) hosts gateway 9085257, while the equipment from Financial Information Service Co. Ltd. (model distributed-model-84, firmware extended-firmware-51, status Operational) hosts gateway 884341 in London. The view enables infrastructure-level troubleshooting by correlating gateway status with equipment health.

### Synthesis

The architecture captured in these records describes a complete remote access chain: a mobile worker authenticates through an authentication server, traverses a VPN gateway running on specific network equipment, enters a corporate network with a defined security classification, and reaches a business resource whose access is governed by a user role. Each layer of this chain is independently tracked—workers carry device and realm attributes, gateways carry location and capacity metrics, networks carry security classifications, resources carry protocol and connection limits, roles carry permission quotas, and equipment carries firmware and health status. The junction tables (gateways_workers, networks_resources, roles_resources) provide the flexibility to reassign workers, relocate resources, or modify permissions without restructuring the underlying records. Together, the base tables and the fourteen joined views form a comprehensive reference for auditing access paths, diagnosing infrastructure failures, and planning capacity across a distributed enterprise.