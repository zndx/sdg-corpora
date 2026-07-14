## Domain Modelling and Relational Materialization

The domain under examination describes a corporate remote-access infrastructure in which mobile workers connect through virtual private network gateways to reach business resources hosted on corporate networks. The architecture spans physical and logical layers: employees carry devices of varying types and operating systems, each device authenticating against a designated server; gateways sit at network perimeters, provisioned with capacity limits and encryption protocols, and are attached to corporate networks that define security boundaries; business resources—ranging from web URLs to terminal services—are assigned to roles and networks, controlling who may access what and through which protocol. The relational schema captures this multi-layered structure through a set of base tables that model each entity type, junction tables that resolve many-to-many associations, and a suite of materialized views that reassemble the normalized facts into domain-meaningful projections.

### Base Tables and Entity Types

The foundation of the schema consists of seven entity tables, each anchored by a surrogate primary key and enriched with attributes that reflect the real-world properties of the entity.

**Table `mobile_workers`**

| mobile_worker_id | worker_id | employee_name | department | role | device_type | os_platform | authentication_realm | last_login_timestamp | authentication_server_id | user_role_id | v_p_n_gateway_id | created_at |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | Tangguhkan | Cole Vasquez | adaptive-departme-89 | Standard | Laptop | Windows | AD | 2024-11-16T10:42:00 | 100 | 100 | 1 | 2025-01-01 00:14:00 |
| 2 | 207 | Susan Levy | distributed-departme-90 | Admin | Tablet | macOS | LDAP | 2025-04-27T17:59:00 | 101 | 101 | 2 | 2025-02-06 03:14:00 |
| 3 | 7021001070072 | Tasha Rodriguez | baseline-departme-91 | Guest | Smartphone | Linux | RADIUS | 2022-09-11T00:16:00 | 102 | 102 | 3 | 2025-03-11 06:14:00 |
| 4 | 3717625 | Sarah Villanueva | pilot-departme-92 | Standard | Laptop | Android | AD | 2023-02-22T07:33:00 | 103 | 103 | 4 | 2025-04-16 09:14:00 |

The `mobile_workers` table models the human-and-device layer. Its primary key `mobile_worker_id` is a sequential integer, while the business identifier `worker_id` carries heterogeneous values: the string `Tangguhkan` for Cole Vasquez, the numeric-looking string `207` for Susan Levy, and the long identifier `7021001070072` for Tasha Rodriguez. The `employee_name` column stores full names such as `Cole Vasquez` and `Sarah Villanueva`. The `department` column uses synthetic identifiers like `adaptive-departme-89` and `pilot-departme-92`. The `role` column classifies workers into three tiers—`Standard`, `Admin`, and `Guest`—while `device_type` and `os_platform` capture the endpoint characteristics: `Laptop` on `Windows`, `Tablet` on `macOS`, `Smartphone` on `Linux`, and `Laptop` on `Android`. The `authentication_realm` column distinguishes between `AD`, `LDAP`, and `RADIUS` directories. Timestamps `last_login_timestamp` and `created_at` provide temporal context, with values ranging from `2022-09-11T00:16:00` to `2025-04-27T17:59:00`. Three foreign keys—`authentication_server_id`, `user_role_id`, and `v_p_n_gateway_id`—link each worker to the authentication infrastructure, the role assignment, and the gateway through which they connect.

**Table `v_p_n_gateways`**

| v_p_n_gateway_id | gateway_id | location | region | max_concurrent_users | encryption_protocol | status | capacity_utilization | corporate_network_id | equipment_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 9085257 | New York | NA | 33 | IPsec | Active | 7.20 | 1 | 128 |
| 2 | 1996915 | Houston | EMEA | 43 | SSL | Maintenance | 9.40 | 2 | lu_tax_code_template_m_I_2 |
| 3 | 3001009030300 | Sacramento | LATAM | 53 | IPsec | Offline | 11.60 | 3 | 1336190 |
| 4 | 884341 | London | APAC | 63 | SSL | Active | 13.80 | 4 | 611514 |

The `v_p_n_gateways` table models the network perimeter layer. Its surrogate key `v_p_n_gateway_id` is an integer, while the business identifier `gateway_id` carries values such as `9085257`, `1996915`, and the composite `3001009030300`. The `location` column stores city names—`New York`, `Houston`, `Sacramento`, `London`—and `region` maps them to geographic zones: `NA`, `EMEA`, `LATAM`, `APAC`. Capacity is expressed through `max_concurrent_users` (values `33`, `43`, `53`, `63`) and `capacity_utilization` (floats like `7.20` and `13.80`). The `encryption_protocol` column alternates between `IPsec` and `SSL`, while `status` records operational states: `Active`, `Maintenance`, and `Offline`. Two foreign keys, `corporate_network_id` and `equipment_id`, bind each gateway to its owning network and the physical or virtual appliance it runs on.

**Table `corporate_networks`**

| id | network_id | network_name | ip_range | security_level | last_audit_date | v_p_n_gateway_id |
|---|---|---|---|---|---|---|
| 1 | e6196808-8fd1-11eb-924d-9cd76263cbd0 | Seasonal Programme | integrated-ip-70 | High | 2023-10-23 | 1 |
| 2 | 7441146 | Integrated Standard | seasonal-ip-71 | Medium | 2024-03-07 | 2 |
| 3 | 8387535 | Extended Framework D | regional-ip-72 | Low | 2025-08-18 | 3 |
| 4 | 6589 | Pilot Protocol | legacy-ip-73 | High | 2022-01-02 | 4 |

The `corporate_networks` table defines the security boundary layer. Its surrogate `id` is an integer, while `network_id` carries UUIDs such as `e6196808-8fd1-11eb-924d-9cd76263cbd0` and short identifiers like `6589`. The `network_name` column uses descriptive labels—`Seasonal Programme`, `Integrated Standard`, `Extended Framework D`, `Pilot Protocol`—and `ip_range` stores synthetic ranges like `integrated-ip-70` and `legacy-ip-73`. The `security_level` column classifies networks as `High`, `Medium`, or `Low`, and `last_audit_date` records the most recent compliance check. The foreign key `v_p_n_gateway_id` links each network to the gateway that provides external access.

**Table `business_resources`**

| id | resource_id | resource_name | resource_type | access_protocol | is_s_s_o_supported | max_connections | user_role_id | corporate_network_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|
| 100 | 1167 | Adaptive Corridor | Web URL | HTTPS | true | 28 | 100 | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 101 | 2106708 | Primary Series | Terminal Service | RDP | false | 34 | 101 | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 102 | 4180945 | Composite Assessment D | File Share | SSH | true | 40 | 102 | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 103 | 10238270 | Compact Survey | Email | SMB | false | 46 | 103 | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The `business_resources` table models the asset layer. Its surrogate `id` is an integer, while `resource_id` carries values like `1167`, `2106708`, and `10238270`. The `resource_name` column stores names such as `Adaptive Corridor`, `Primary Series`, and `Compact Survey`. The `resource_type` column classifies resources by access modality: `Web URL`, `Terminal Service`, `File Share`, and `Email`. The `access_protocol` column specifies the transport—`HTTPS`, `RDP`, `SSH`, `SMB`—and `is_s_s_o_supported` is a boolean flag (`true` or `false`). The `max_connections` column sets concurrency limits (values `28`, `34`, `40`, `46`). Timestamps `created_at` and `updated_at` track the resource lifecycle. Two foreign keys, `user_role_id` and `corporate_network_id`, assign each resource to a role and a network.

**Table `user_roles`**

| id | role_id | role_name | role_description | max_resources | mobile_worker_id |
|---|---|---|---|---|---|
| 100 | 2933463 | Terry Pratchett | Composite Programme | 21 | 1 |
| 101 | id_3 | Theodore Mcgrath | Compact Standard A | 30 | 2 |
| 102 | gd_taxc_2111 | Janice Johnston | Legacy Framework | 39 | 3 |
| 103 | 994a4fa0-9bad-11eb-a8a2-19ed5c03f8d3 | Theodore Mcgrath | Regional Protocol | 48 | 4 |

The `user_roles` table defines the permission layer. Its surrogate `id` is an integer, while `role_id` carries heterogeneous identifiers: `2933463`, `id_3`, `gd_taxc_2111`, and the UUID `994a4fa0-9bad-11eb-a8a2-19ed5c03f8d3`. The `role_name` column stores names such as `Terry Pratchett` and `Theodore Mcgrath`, while `role_description` provides labels like `Composite Programme`, `Compact Standard A`, `Legacy Framework`, and `Regional Protocol`. The `max_resources` column constrains the number of resources a role may access (values `21`, `30`, `39`, `48`). The foreign key `mobile_worker_id` links each role to its assigned worker.

**Table `network_equipments`**

| equipment_id | manufacturer | model | firmware_version | status | v_p_n_gateway_id |
|---|---|---|---|---|---|
| 128 | Standard Chartered | composite-model-81 | distributed-firmware-48 | Operational | 1 |
| lu_tax_code_template_m_I_2 | General Motors | primary-model-82 | baseline-firmware-49 | Degraded | 2 |
| 1336190 | Column Name cannot be empty | adaptive-model-83 | pilot-firmware-50 | Failed | 3 |
| 611514 | Financial Information Service Co. Ltd. | distributed-model-84 | extended-firmware-51 | Operational | 4 |

The `network_equipments` table models the physical/virtual appliance layer. Its primary key `equipment_id` carries values such as `128`, `lu_tax_code_template_m_I_2`, `1336190`, and `611514`. The `manufacturer` column stores vendor names including `Standard Chartered`, `General Motors`, `Column Name cannot be empty`, and `Financial Information Service Co. Ltd.`. The `model` column uses synthetic model identifiers like `composite-model-81` and `distributed-model-84`. The `firmware_version` column records versions such as `distributed-firmware-48` and `extended-firmware-51`. The `status` column tracks appliance health: `Operational`, `Degraded`, and `Failed`. The foreign key `v_p_n_gateway_id` binds each equipment instance to the gateway it serves.

**Table `authentication_servers`**

| id | server_id | server_type | server_address | is_primary | mobile_worker_id |
|---|---|---|---|---|---|
| 100 | 911352d5dab64576b7a6da51aa69d76d | Active Directory | integrated-server-28 | true | 1 |
| 101 | 1450637 | LDAP | seasonal-server-29 | false | 2 |
| 102 | 4985152 | RADIUS | regional-server-30 | true | 3 |
| 103 | 9736887 | Active Directory | legacy-server-31 | false | 4 |

The `authentication_servers` table models the identity infrastructure. Each server is identified by a surrogate key and a business identifier, with attributes capturing its operational status and the authentication realm it serves. Workers reference this table through the `authentication_server_id` foreign key in `mobile_workers`, establishing a direct mapping between each employee and the directory service responsible for their credentials.

### Junction Tables and Many-to-Many Relationships

Three junction tables resolve associations that are inherently many-to-many in the domain.

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

The `gateways_workers` table resolves the relationship between gateways and workers. A single gateway may serve multiple workers, and a worker may be associated with multiple gateways across different contexts. This table contains foreign keys referencing both `v_p_n_gateway_id` and `mobile_worker_id`, enabling the schema to express the flexible assignment of workers to gateways without forcing a rigid one-to-one constraint.

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

The `networks_resources` table resolves the relationship between corporate networks and business resources. A network may host multiple resources, and a resource may be accessible from multiple networks. Foreign keys referencing `corporate_network_id` and `business_resource_id` allow the schema to express this flexible mapping, supporting scenarios where resources are replicated or mirrored across network boundaries.

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

The `roles_resources` table resolves the relationship between user roles and business resources. A role may grant access to multiple resources, and a resource may be accessible to multiple roles. Foreign keys referencing `user_role_id` and `business_resource_id` enable the schema to express the flexible permission model, supporting the principle of least privilege through granular role-to-resource assignments.

### Materialized Views and Domain Projections

The view layer reassembles the normalized tables into projections that answer specific domain questions. Each view performs a controlled join across two or more base or junction tables, producing a denormalized result that reads naturally to domain practitioners.

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

This view answers the question: which authentication server is responsible for each mobile worker? By joining `mobile_workers` with `authentication_servers` on `authentication_server_id`, the result pairs each worker's name and department with the server that validates their credentials. For example, Cole Vasquez from `adaptive-departme-89` is associated with authentication server `100`, while Susan Levy from `distributed-departme-90` maps to server `101`.

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

This view answers: what role has been assigned to each mobile worker? The join between `mobile_workers` and `user_roles` on `user_role_id` produces rows that pair worker names with role descriptions. Cole Vasquez holds the role described as `Composite Programme`, Susan Levy holds `Compact Standard A`, Tasha Rodriguez holds `Legacy Framework`, and Sarah Villanueva holds `Regional Protocol`.

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

This view answers: through which VPN gateway does each mobile worker connect? The join between `mobile_workers` and `v_p_n_gateways` on `v_p_n_gateway_id` produces rows that pair worker names with gateway locations and regions. Cole Vasquez connects through the gateway in `New York` (region `NA`), Susan Levy through `Houston` (region `EMEA`), Tasha Rodriguez through `Sacramento` (region `LATAM`), and Sarah Villanueva through `London` (region `APAC`).

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

This view answers: which corporate network is served by each VPN gateway? The join between `v_p_n_gateways` and `corporate_networks` on `corporate_network_id` produces rows that pair gateway locations with network names and security levels. The gateway in `New York` serves the `Seasonal Programme` network at `High` security, the gateway in `Houston` serves `Integrated Standard` at `Medium` security, the gateway in `Sacramento` serves `Extended Framework D` at `Low` security, and the gateway in `London` serves `Pilot Protocol` at `High` security.

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

This view answers: which mobile workers are associated with each VPN gateway, and what are their details? The join between `v_p_n_gateways` and `mobile_workers` on `v_p_n_gateway_id` produces rows that pair gateway locations with worker names, departments, and device types. The `New York` gateway serves Cole Vasquez, a `Standard` worker on a `Laptop` running `Windows`; the `Houston` gateway serves Susan Levy, an `Admin` on a `Tablet` running `macOS`; the `Sacramento` gateway serves Tasha Rodriguez, a `Guest` on a `Smartphone` running `Linux`; and the `London` gateway serves Sarah Villanueva, a `Standard` worker on a `Laptop` running `Android`.

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

This view answers: which network equipment is deployed at each VPN gateway? The join between `v_p_n_gateways` and `network_equipments` on `equipment_id` produces rows that pair gateway locations with equipment manufacturers, models, and operational status. The `New York` gateway runs equipment from `Standard Chartered` (model `composite-model-81`) in `Operational` status; the `Houston` gateway runs equipment from `General Motors` (model `primary-model-82`) in `Degraded` status; the `Sacramento` gateway runs equipment from `Column Name cannot be empty` (model `adaptive-model-83`) in `Failed` status; and the `London` gateway runs equipment from `Financial Information Service Co. Ltd.` (model `distributed-model-84`) in `Operational` status.

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

This view answers: which business resources are hosted on each corporate network? The join between `corporate_networks` and `business_resources` on `corporate_network_id` produces rows that pair network names with resource names, types, and access protocols. The `Seasonal Programme` network hosts the `Adaptive Corridor` resource (a `Web URL` accessible via `HTTPS`); the `Integrated Standard` network hosts `Primary Series` (a `Terminal Service` accessible via `RDP`); the `Extended Framework D` network hosts `Composite Assessment D` (a `File Share` accessible via `SSH`); and the `Pilot Protocol` network hosts `Compact Survey` (an `Email` resource accessible via `SMB`).

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

This view answers: which VPN gateway provides external access to each corporate network? The join between `corporate_networks` and `v_p_n_gateways` on `v_p_n_gateway_id` produces rows that pair network names with gateway locations and encryption protocols. The `Seasonal Programme` network is accessed through the `New York` gateway using `IPsec`; the `Integrated Standard` network through `Houston` using `SSL`; the `Extended Framework D` network through `Sacramento` using `IPsec`; and the `Pilot Protocol` network through `London` using `SSL`.

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

This view answers: which user roles have access to each business resource? The join between `business_resources` and `user_roles` on `user_role_id` produces rows that pair resource names with role names and descriptions. The `Adaptive Corridor` resource is accessible under the `Terry Pratchett` role (`Composite Programme`); `Primary Series` under `Theodore Mcgrath` (`Compact Standard A`); `Composite Assessment D` under `Janice Johnston` (`Legacy Framework`); and `Compact Survey` under `Theodore Mcgrath` (`Regional Protocol`).

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

This view answers: on which corporate network is each business resource hosted? The join between `business_resources` and `corporate_networks` on `corporate_network_id` produces rows that pair resource names with network names and security levels. The `Adaptive Corridor` resource is hosted on the `Seasonal Programme` network at `High` security; `Primary Series` on `Integrated Standard` at `Medium` security; `Composite Assessment D` on `Extended Framework D` at `Low` security; and `Compact Survey` on `Pilot Protocol` at `High` security.

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

This view answers: which business resources are accessible under each user role, and what are their details? The join between `user_roles` and `business_resources` on `user_role_id` produces rows that pair role names with resource names, types, and access protocols. The `Terry Pratchett` role grants access to `Adaptive Corridor` (a `Web URL` via `HTTPS`); `Theodore Mcgrath` (`Compact Standard A`) grants access to `Primary Series` (a `Terminal Service` via `RDP`); `Janice Johnston` (`Legacy Framework`) grants access to `Composite Assessment D` (a `File Share` via `SSH`); and `Theodore Mcgrath` (`Regional Protocol`) grants access to `Compact Survey` (an `Email` resource via `SMB`).

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

This view answers: which mobile worker is assigned to each user role? The join between `user_roles` and `mobile_workers` on `mobile_worker_id` produces rows that pair role names with worker names and departments. The `Terry Pratchett` role is assigned to Cole Vasquez from `adaptive-departme-89`; `Theodore Mcgrath` (`Compact Standard A`) to Susan Levy from `distributed-departme-90`; `Janice Johnston` (`Legacy Framework`) to Tasha Rodriguez from `baseline-departme-91`; and `Theodore Mcgrath` (`Regional Protocol`) to Sarah Villanueva from `pilot-departme-92`.

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

This view answers: which VPN gateway is served by each network equipment instance? The join between `network_equipments` and `v_p_n_gateways` on `v_p_n_gateway_id` produces rows that pair equipment manufacturers and models with gateway locations and regions. The `Standard Chartered` equipment (model `composite-model-81`) serves the `New York` gateway in the `NA` region; `General Motors` equipment (model `primary-model-82`) serves `Houston` in `EMEA`; `Column Name cannot be empty` equipment (model `adaptive-model-83`) serves `Sacramento` in `LATAM`; and `Financial Information Service Co. Ltd.` equipment (model `distributed-model-84`) serves `London` in `APAC`.

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

This view answers: which mobile workers are authenticated by each authentication server? The join between `authentication_servers` and `mobile_workers` on `authentication_server_id` produces rows that pair server identifiers with worker names, departments, and authentication realms. Authentication server `100` authenticates Cole Vasquez from `adaptive-departme-89` using the `AD` realm; server `101` authenticates Susan Levy from `distributed-departme-90` using `LDAP`; server `102` authenticates Tasha Rodriguez from `baseline-departme-91` using `RADIUS`; and server `103` authenticates Sarah Villanueva from `pilot-departme-92` using `AD`.

### Synthesis

The schema implements a clean separation between entity types (workers, gateways, networks, resources, roles, equipment, authentication servers) and association types (gateway-worker, network-resource, role-resource), with foreign keys enforcing referential integrity at every junction. The base tables capture the structural facts of the domain in normalized form, while the junction tables handle the many-to-many relationships that the base tables cannot express directly. The view layer then reassembles these normalized facts into projections that answer concrete operational questions: which server authenticates which worker, which gateway serves which network, which resources are accessible under which role, and which equipment is deployed at which gateway. Each view is a deterministic join over a well-defined set of tables, ensuring that the denormalized output is always consistent with the underlying normalized schema. The result is a model that is both structurally rigorous—respecting first normal form and explicit foreign-key constraints—and practically useful, with views that map directly to the questions domain practitioners need to ask about the remote-access infrastructure.