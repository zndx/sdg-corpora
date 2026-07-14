In the surveillance infrastructure domain, every deployment is a project that brings together hardware, storage, software, an end client, and a channel partner. The relational model captures this by anchoring all facts to a single `surveillance_installations` table, which acts as the central hub of a star-like schema. Each installation records a project name, its scale, a deployment date, a lifecycle status, and a total cost, while also carrying five foreign keys that point to the five supporting entity tables. The model normalizes each concern into its own table, then reconstructs the full picture through a family of ten views — five that read outward from the installation and five that read inward from the supporting entities.

## The Hub: `surveillance_installations`

The `surveillance_installations` table is the fact table of the schema. Every row represents one surveillance deployment project. Its primary key is `surveillance_installation_id`, a surrogate integer identifier. The business-facing `installation_id` column carries a distinct project number (for example, `5917288` for the project named "Compact Survey"). The `project_name` column holds human-readable labels such as "Compact Survey", "Legacy Corridor", "Regional Series A", and "Seasonal Assessment". The `target_scale` column constrains the project to one of three categories — `small-scale`, `mid-sized`, or `large-scale` — while `deployment_date` stores an ISO-8601 timestamp like `2023-02-14T13:51:00`. The `status` column tracks the project lifecycle with values including `designing`, `implementation`, `pricing`, and `complete`. The `total_cost` column is a numeric field (e.g., `61.82`) that records the project's budget.

**Table `surveillance_installations`**

| surveillance_installation_id | installation_id | project_name | target_scale | deployment_date | status | total_cost | server_hardware_id | storage_system_id | video_management_software_id | client_organization_org_id | channel_partner_id |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 100 | 5917288 | Compact Survey | small-scale | 2023-02-14T13:51:00 | designing | 61.82 | 100 | 1 | 1 | 790471 | 1 |
| 101 | 325468 | Legacy Corridor | mid-sized | 2024-07-25T20:08:00 | implementation | 89.53 | 101 | 2 | 2 | 1717 | 2 |
| 102 | 2106712 | Regional Series A | large-scale | 2025-12-09T03:25:00 | pricing | 29.24 | 102 | 3 | 3 | 69437 | 3 |
| 103 | 611502 | Seasonal Assessment | small-scale | 2022-05-20T10:42:00 | complete | 13.94 | 103 | 4 | 4 | m16 | 4 |

The five remaining columns in this table are foreign keys. `server_hardware_id` references `server_hardwares.id`, `storage_system_id` references `storage_systems.id`, `video_management_software_id` references `video_management_softwares.id`, `client_organization_org_id` references `client_organizations.org_id`, and `channel_partner_id` references `channel_partners.id`. Each installation is therefore associated with exactly one server, one storage system, one video management software, one client organization, and one channel partner. This one-to-one cardinality is enforced by the foreign key constraints and is reflected in the data: installation `100` links to server hardware `100`, storage `1`, software `1`, client `790471`, and partner `1`.

## The Supporting Entities

Five entity tables sit at the periphery of the star schema. Each stores attributes specific to its domain and carries a back-reference foreign key to `surveillance_installations`.

The `server_hardwares` table holds the physical server specifications. Its primary key is `id`. The `server_id` column carries a UUID-like identifier (e.g., `911352d5dab64576b7a6da51aa69d76d`), while `manufacturer` records the vendor name — "Standard Chartered", "General Motors", "Column Name cannot be empty", or "Financial Information Service Co. Ltd." The `form_factor` column constrains the chassis type to values such as `rack`, `blade`, `tower`, or `hyperscale`. The `model_number` and `serial_number` columns provide product identification, and `warranty_expiry` stores a date. The boolean `is_managed_service` flag indicates whether the server is under a managed service contract. The foreign key `surveillance_installation_id` points back to the installation that uses this server.

**Table `server_hardwares`**

| id | server_id | manufacturer | form_factor | model_number | serial_number | warranty_expiry | is_managed_service | surveillance_installation_id |
|---|---|---|---|---|---|---|---|---|
| 100 | 911352d5dab64576b7a6da51aa69d76d | Standard Chartered | rack | MOD-2238 | 5844275 | 2024-11-09 | true | 100 |
| 101 | 1450637 | General Motors | blade | MOD-2244 | 69422 | 2025-04-20 | false | 101 |
| 102 | 4985152 | Column Name cannot be empty | tower | MOD-2250 | 7731874 | 2022-09-04 | true | 102 |
| 103 | 9736887 | Financial Information Service Co. Ltd. | hyperscale | MOD-2256 | 10445632 | 2023-02-15 | false | 103 |

The `storage_systems` table captures storage infrastructure details. Its primary key is `id`. The `storage_id` column holds a business identifier (e.g., `82868` or `ZUGLB8`). The `storage_type` column classifies the system as `SAN`, `NAS`, `DAS`, or `backup`. The `capacity_t_b` column stores the capacity in terabytes (e.g., `15.45`, `17.90`, `20.35`, `22.80`). The `manufacturer`, `model_number`, and `encryption_enabled` columns mirror the pattern of the server table. The back-reference `surveillance_installation_id` links the storage system to its installation.

**Table `storage_systems`**

| id | storage_id | storage_type | capacity_t_b | manufacturer | model_number | encryption_enabled | surveillance_installation_id |
|---|---|---|---|---|---|---|---|
| 1 | 82868 | SAN | 15.45 | Standard Chartered | MOD-2238 | false | 100 |
| 2 | 611501 | NAS | 17.90 | General Motors | MOD-2244 | true | 101 |
| 3 | id_29 | DAS | 20.35 | Column Name cannot be empty | MOD-2250 | false | 102 |
| 4 | ZUGLB8 | backup | 22.80 | Financial Information Service Co. Ltd. | MOD-2256 | true | 103 |

The `video_management_softwares` table stores the VMS product details. Its primary key is `id`. The `software_id` column carries a product identifier (e.g., `gd_taxc_2111` or `5917273`). The `version` column holds a version string such as `seasonal-version-71` or `regional-version-72`. The `license_type` column records the licensing model — `regional-license-78`, `legacy-license-79`, `compact-license-80`, or `composite-license-81`. The `max_cameras` column is an integer indicating the maximum supported camera count (e.g., `34`, `37`, `40`, `43`). Three boolean columns — `supports_h_d`, `supports_i_p`, and `supports_analog` — describe protocol capabilities. The back-reference `surveillance_installation_id` ties the software to its installation.

**Table `video_management_softwares`**

| id | software_id | version | license_type | max_cameras | supports_h_d | supports_i_p | supports_analog | surveillance_installation_id |
|---|---|---|---|---|---|---|---|---|
| 1 | gd_taxc_2111 | seasonal-version-71 | regional-license-78 | 34 | true | false | true | 100 |
| 2 | 5917273 | regional-version-72 | legacy-license-79 | 37 | false | true | false | 101 |
| 3 | id_4 | legacy-version-73 | compact-license-80 | 40 | true | false | true | 102 |
| 4 | 8928496 | compact-version-74 | composite-license-81 | 43 | false | true | false | 103 |

The `client_organizations` table describes the end customer. Its primary key is `org_id`, which can be numeric (e.g., `790471`, `1717`, `69437`) or alphanumeric (e.g., `m16`). The `org_name` column holds the organization's name — "Nancy Garrison", "Stephenie Meyer", "Brian Hamilton", or "Doctor Bob". The `sector` column constrains the industry to values like `government`, `industry`, `banking`, or `retail`. The `region` column stores a geographic code such as `Africa`, `ME`, or `SAARC`. The `org_size` column classifies the organization as `small`, `medium`, or `large`. The foreign key `surveillance_installation_id` links the organization to the installation it commissioned.

**Table `client_organizations`**

| org_id | org_name | sector | region | org_size | surveillance_installation_id |
|---|---|---|---|---|---|
| 790471 | Nancy Garrison | government | Africa | small | 100 |
| 1717 | Stephenie Meyer | industry | ME | medium | 101 |
| 69437 | Brian Hamilton | banking | SAARC | large | 102 |
| m16 | Doctor Bob | retail | Africa | small | 103 |

The `channel_partners` table records the implementation partner. Its primary key is `id`. The `partner_id` column carries a business identifier (e.g., `69420`, `9085260`, `195367`, or `b_VB-EC-12`). The `partner_name` column holds the partner's name — "Composite Review", "Compact Initiative A", "Legacy Model", or "Regional Cluster". The `certification_level` column stores a certification code such as `seasonal-certific-59` or `regional-certific-60`. The `service_area` column describes the scope of services offered — `baseline-service-67`, `pilot-service-68`, `extended-service-69`, or `integrated-service-70`. The back-reference `surveillance_installation_id` links the partner to the installation it supports.

**Table `channel_partners`**

| id | partner_id | partner_name | certification_level | service_area | surveillance_installation_id |
|---|---|---|---|---|---|
| 1 | 69420 | Composite Review | seasonal-certific-59 | baseline-service-67 | 100 |
| 2 | 9085260 | Compact Initiative A | regional-certific-60 | pilot-service-68 | 101 |
| 3 | 195367 | Legacy Model | legacy-certific-61 | extended-service-69 | 102 |
| 4 | b_VB-EC-12 | Regional Cluster | compact-certific-62 | integrated-service-70 | 103 |

## Views from the Installation Outward

The first five views each join `surveillance_installations` to one supporting entity, producing a denormalized row that answers a single business question: "What are the details of the installation together with its server hardware?" or "What are the details of the installation together with its storage system?" and so on.

The view `vw_surveillance_installation_server_hardware` joins `surveillance_installations` to `server_hardwares` on `surveillance_installations.server_hardware_id = server_hardwares.id`. The result is a single row per installation that combines the project metadata with the server's manufacturer, form factor, model number, serial number, warranty expiry, and managed service flag. For installation `100` ("Compact Survey"), the joined row shows that the server is manufactured by "Standard Chartered", has a `rack` form factor, model `MOD-2238`, serial `5844275`, a warranty expiring on `2024-11-09`, and `is_managed_service` set to `true`. For installation `103` ("Seasonal Assessment"), the server is manufactured by "Financial Information Service Co. Ltd.", has a `hyperscale` form factor, and `is_managed_service` is `false`. This view answers the question "Which server is deployed at which installation, and what are its specifications?"

**View `vw_surveillance_installation_server_hardware`**

```sql
CREATE VIEW vw_surveillance_installation_server_hardware AS
SELECT a.surveillance_installation_id, a.installation_id, a.project_name, a.target_scale, b.id AS hardware_id, b.server_id AS hardware_server_id, b.manufacturer AS hardware_manufacturer
FROM surveillance_installations a JOIN server_hardwares b ON a.server_hardware_id = b.id;
```

| surveillance_installation_id | installation_id | project_name | target_scale | hardware_id | hardware_server_id | hardware_manufacturer |
|---|---|---|---|---|---|---|
| 100 | 5917288 | Compact Survey | small-scale | 100 | 911352d5dab64576b7a6da51aa69d76d | Standard Chartered |
| 101 | 325468 | Legacy Corridor | mid-sized | 101 | 1450637 | General Motors |
| 102 | 2106712 | Regional Series A | large-scale | 102 | 4985152 | Column Name cannot be empty |
| 103 | 611502 | Seasonal Assessment | small-scale | 103 | 9736887 | Financial Information Service Co. Ltd. |

The view `vw_surveillance_installation_storage_system` joins `surveillance_installations` to `storage_systems` on `surveillance_installations.storage_system_id = storage_systems.id`. The result combines the project metadata with the storage system's type, capacity, manufacturer, model number, and encryption status. For installation `100`, the joined row reveals a `SAN` storage system with `15.45` TB capacity, manufactured by "Standard Chartered", model `MOD-2238`, and `encryption_enabled` set to `false`. For installation `103`, the storage type is `backup`, capacity is `22.80` TB, and encryption is enabled. This view answers "What storage system is deployed at which installation, and what are its specifications?"

**View `vw_surveillance_installation_storage_system`**

```sql
CREATE VIEW vw_surveillance_installation_storage_system AS
SELECT a.surveillance_installation_id, a.installation_id, a.project_name, a.target_scale, b.id AS system_id, b.storage_id AS system_storage_id, b.storage_type AS system_storage_type
FROM surveillance_installations a JOIN storage_systems b ON a.storage_system_id = b.id;
```

| surveillance_installation_id | installation_id | project_name | target_scale | system_id | system_storage_id | system_storage_type |
|---|---|---|---|---|---|---|
| 100 | 5917288 | Compact Survey | small-scale | 1 | 82868 | SAN |
| 101 | 325468 | Legacy Corridor | mid-sized | 2 | 611501 | NAS |
| 102 | 2106712 | Regional Series A | large-scale | 3 | id_29 | DAS |
| 103 | 611502 | Seasonal Assessment | small-scale | 4 | ZUGLB8 | backup |

The view `vw_surveillance_installation_video_management_software` joins `surveillance_installations` to `video_management_softwares` on `surveillance_installations.video_management_software_id = video_management_softwares.id`. The result combines the project metadata with the VMS version, license type, maximum camera count, and protocol support flags. For installation `100`, the joined row shows version `seasonal-version-71`, license type `regional-license-78`, a maximum of `34` cameras, HD support enabled, IP support disabled, and analog support enabled. For installation `101`, the version is `regional-version-72`, the license is `legacy-license-79`, the maximum camera count is `37`, HD support is disabled, IP support is enabled, and analog support is disabled. This view answers "Which VMS product is deployed at which installation, and what are its capabilities?"

**View `vw_surveillance_installation_video_management_software`**

```sql
CREATE VIEW vw_surveillance_installation_video_management_software AS
SELECT a.surveillance_installation_id, a.installation_id, a.project_name, a.target_scale, b.id AS software_id, b.software_id AS software_software_id, b.version AS software_version
FROM surveillance_installations a JOIN video_management_softwares b ON a.video_management_software_id = b.id;
```

| surveillance_installation_id | installation_id | project_name | target_scale | software_id | software_software_id | software_version |
|---|---|---|---|---|---|---|
| 100 | 5917288 | Compact Survey | small-scale | 1 | gd_taxc_2111 | seasonal-version-71 |
| 101 | 325468 | Legacy Corridor | mid-sized | 2 | 5917273 | regional-version-72 |
| 102 | 2106712 | Regional Series A | large-scale | 3 | id_4 | legacy-version-73 |
| 103 | 611502 | Seasonal Assessment | small-scale | 4 | 8928496 | compact-version-74 |

The view `vw_surveillance_installation_client_organization` joins `surveillance_installations` to `client_organizations` on `surveillance_installations.client_organization_org_id = client_organizations.org_id`. The result combines the project metadata with the client's name, sector, region, and size. For installation `100`, the joined row shows the client is "Nancy Garrison", operating in the `government` sector, located in `Africa`, and classified as `small`. For installation `102`, the client is "Brian Hamilton", in the `banking` sector, region `SAARC`, and `large` size. This view answers "Which organization commissioned which installation, and what are its characteristics?"

**View `vw_surveillance_installation_client_organization`**

```sql
CREATE VIEW vw_surveillance_installation_client_organization AS
SELECT a.surveillance_installation_id, a.installation_id, a.project_name, a.target_scale, b.org_id AS organization_org_id, b.org_name AS organization_org_name, b.sector AS organization_sector
FROM surveillance_installations a JOIN client_organizations b ON a.client_organization_org_id = b.org_id;
```

| surveillance_installation_id | installation_id | project_name | target_scale | organization_org_id | organization_org_name | organization_sector |
|---|---|---|---|---|---|---|
| 100 | 5917288 | Compact Survey | small-scale | 790471 | Nancy Garrison | government |
| 101 | 325468 | Legacy Corridor | mid-sized | 1717 | Stephenie Meyer | industry |
| 102 | 2106712 | Regional Series A | large-scale | 69437 | Brian Hamilton | banking |
| 103 | 611502 | Seasonal Assessment | small-scale | m16 | Doctor Bob | retail |

The view `vw_surveillance_installation_channel_partner` joins `surveillance_installations` to `channel_partners` on `surveillance_installations.channel_partner_id = channel_partners.id`. The result combines the project metadata with the partner's name, certification level, and service area. For installation `100`, the joined row shows the partner is "Composite Review", with certification `seasonal-certific-59` and service area `baseline-service-67`. For installation `103`, the partner is "Regional Cluster", certified at `compact-certific-62`, with service area `integrated-service-70`. This view answers "Which channel partner supports which installation, and what is their certification and service scope?"

**View `vw_surveillance_installation_channel_partner`**

```sql
CREATE VIEW vw_surveillance_installation_channel_partner AS
SELECT a.surveillance_installation_id, a.installation_id, a.project_name, a.target_scale, b.id AS partner_id, b.partner_id AS partner_partner_id, b.partner_name AS partner_partner_name
FROM surveillance_installations a JOIN channel_partners b ON a.channel_partner_id = b.id;
```

| surveillance_installation_id | installation_id | project_name | target_scale | partner_id | partner_partner_id | partner_partner_name |
|---|---|---|---|---|---|---|
| 100 | 5917288 | Compact Survey | small-scale | 1 | 69420 | Composite Review |
| 101 | 325468 | Legacy Corridor | mid-sized | 2 | 9085260 | Compact Initiative A |
| 102 | 2106712 | Regional Series A | large-scale | 3 | 195367 | Legacy Model |
| 103 | 611502 | Seasonal Assessment | small-scale | 4 | b_VB-EC-12 | Regional Cluster |

## Views from the Supporting Entities Inward

The remaining five views reverse the join direction. Each starts from a supporting entity table and joins to `surveillance_installations`, answering the question "Which installation uses this server/storage/software/client/partner?" These views are useful when the query originates from the entity side — for example, "Show me all installations that use a server from Standard Chartered."

The view `vw_server_hardware_surveillance_installation` joins `server_hardwares` to `surveillance_installations` on `server_hardwares.surveillance_installation_id = surveillance_installations.surveillance_installation_id`. The result is a row per server hardware that includes the installation's project name, scale, deployment date, status, and cost. For server hardware `100` (manufactured by "Standard Chartered", rack form factor), the joined row shows the installation is "Compact Survey", `small-scale`, deployed on `2023-02-14T13:51:00`, with status `designing` and total cost `61.82`. For server hardware `103` (manufactured by "Financial Information Service Co. Ltd.", hyperscale form factor), the installation is "Seasonal Assessment", `small-scale`, deployed on `2022-05-20T10:42:00`, with status `complete` and total cost `13.94`. This view answers "Which installation is associated with each server hardware unit?"

**View `vw_server_hardware_surveillance_installation`**

```sql
CREATE VIEW vw_server_hardware_surveillance_installation AS
SELECT a.id, a.server_id, a.manufacturer, a.form_factor, b.surveillance_installation_id AS installation_surveillance_installation_id, b.installation_id AS installation_installation_id, b.project_name AS installation_project_name
FROM server_hardwares a JOIN surveillance_installations b ON a.surveillance_installation_id = b.surveillance_installation_id;
```

| id | server_id | manufacturer | form_factor | installation_surveillance_installation_id | installation_installation_id | installation_project_name |
|---|---|---|---|---|---|---|
| 100 | 911352d5dab64576b7a6da51aa69d76d | Standard Chartered | rack | 100 | 5917288 | Compact Survey |
| 101 | 1450637 | General Motors | blade | 101 | 325468 | Legacy Corridor |
| 102 | 4985152 | Column Name cannot be empty | tower | 102 | 2106712 | Regional Series A |
| 103 | 9736887 | Financial Information Service Co. Ltd. | hyperscale | 103 | 611502 | Seasonal Assessment |

The view `vw_storage_system_surveillance_installation` joins `storage_systems` to `surveillance_installations` on `storage_systems.surveillance_installation_id = surveillance_installations.surveillance_installation_id`. The result is a row per storage system that includes the installation's project name, scale, deployment date, status, and cost. For storage system `1` (type `SAN`, `15.45` TB, manufactured by "Standard Chartered"), the joined row shows the installation is "Compact Survey", `small-scale`, deployed on `2023-02-14T13:51:00`, with status `designing` and total cost `61.82`. For storage system `4` (type `backup`, `22.80` TB, manufactured by "Financial Information Service Co. Ltd."), the installation is "Seasonal Assessment", `small-scale`, deployed on `2022-05-20T10:42:00`, with status `complete` and total cost `13.94`. This view answers "Which installation is associated with each storage system?"

**View `vw_storage_system_surveillance_installation`**

```sql
CREATE VIEW vw_storage_system_surveillance_installation AS
SELECT a.id, a.storage_id, a.storage_type, a.capacity_t_b, b.surveillance_installation_id AS installation_surveillance_installation_id, b.installation_id AS installation_installation_id, b.project_name AS installation_project_name
FROM storage_systems a JOIN surveillance_installations b ON a.surveillance_installation_id = b.surveillance_installation_id;
```

| id | storage_id | storage_type | capacity_t_b | installation_surveillance_installation_id | installation_installation_id | installation_project_name |
|---|---|---|---|---|---|---|
| 1 | 82868 | SAN | 15.45 | 100 | 5917288 | Compact Survey |
| 2 | 611501 | NAS | 17.90 | 101 | 325468 | Legacy Corridor |
| 3 | id_29 | DAS | 20.35 | 102 | 2106712 | Regional Series A |
| 4 | ZUGLB8 | backup | 22.80 | 103 | 611502 | Seasonal Assessment |

The view `vw_video_management_software_surveillance_installation` joins `video_management_softwares` to `surveillance_installations` on `video_management_softwares.surveillance_installation_id = surveillance_installations.surveillance_installation_id`. The result is a row per VMS product that includes the installation's project name, scale, deployment date, status, and cost. For VMS product `1` (version `seasonal-version-71`, license `regional-license-78`, max `34` cameras), the joined row shows the installation is "Compact Survey", `small-scale`, deployed on `2023-02-14T13:51:00`, with status `designing` and total cost `61.82`. For VMS product `4` (version `compact-version-74`, license `composite-license-81`, max `43` cameras), the installation is "Seasonal Assessment", `small-scale`, deployed on `2022-05-20T10:42:00`, with status `complete` and total cost `13.94`. This view answers "Which installation is associated with each video management software product?"

**View `vw_video_management_software_surveillance_installation`**

```sql
CREATE VIEW vw_video_management_software_surveillance_installation AS
SELECT a.id, a.software_id, a.version, a.license_type, b.surveillance_installation_id AS installation_surveillance_installation_id, b.installation_id AS installation_installation_id, b.project_name AS installation_project_name
FROM video_management_softwares a JOIN surveillance_installations b ON a.surveillance_installation_id = b.surveillance_installation_id;
```

| id | software_id | version | license_type | installation_surveillance_installation_id | installation_installation_id | installation_project_name |
|---|---|---|---|---|---|---|
| 1 | gd_taxc_2111 | seasonal-version-71 | regional-license-78 | 100 | 5917288 | Compact Survey |
| 2 | 5917273 | regional-version-72 | legacy-license-79 | 101 | 325468 | Legacy Corridor |
| 3 | id_4 | legacy-version-73 | compact-license-80 | 102 | 2106712 | Regional Series A |
| 4 | 8928496 | compact-version-74 | composite-license-81 | 103 | 611502 | Seasonal Assessment |

The view `vw_client_organization_surveillance_installation` joins `client_organizations` to `surveillance_installations` on `client_organizations.surveillance_installation_id = surveillance_installations.surveillance_installation_id`. The result is a row per client organization that includes the installation's project name, scale, deployment date, status, and cost. For client organization `790471` ("Nancy Garrison", `government` sector, `Africa` region, `small` size), the joined row shows the installation is "Compact Survey", `small-scale`, deployed on `2023-02-14T13:51:00`, with status `designing` and total cost `61.82`. For client organization `m16` ("Doctor Bob", `retail` sector, `Africa` region, `small` size), the installation is "Seasonal Assessment", `small-scale`, deployed on `2022-05-20T10:42:00`, with status `complete` and total cost `13.94`. This view answers "Which installation is associated with each client organization?"

**View `vw_client_organization_surveillance_installation`**

```sql
CREATE VIEW vw_client_organization_surveillance_installation AS
SELECT a.org_id, a.org_name, a.sector, a.region, b.surveillance_installation_id AS installation_surveillance_installation_id, b.installation_id AS installation_installation_id, b.project_name AS installation_project_name
FROM client_organizations a JOIN surveillance_installations b ON a.surveillance_installation_id = b.surveillance_installation_id;
```

| org_id | org_name | sector | region | installation_surveillance_installation_id | installation_installation_id | installation_project_name |
|---|---|---|---|---|---|---|
| 790471 | Nancy Garrison | government | Africa | 100 | 5917288 | Compact Survey |
| 1717 | Stephenie Meyer | industry | ME | 101 | 325468 | Legacy Corridor |
| 69437 | Brian Hamilton | banking | SAARC | 102 | 2106712 | Regional Series A |
| m16 | Doctor Bob | retail | Africa | 103 | 611502 | Seasonal Assessment |

The view `vw_channel_partner_surveillance_installation` joins `channel_partners` to `surveillance_installations` on `channel_partners.surveillance_installation_id = surveillance_installations.surveillance_installation_id`. The result is a row per channel partner that includes the installation's project name, scale, deployment date, status, and cost. For partner `1` ("Composite Review", certification `seasonal-certific-59`, service area `baseline-service-67`), the joined row shows the installation is "Compact Survey", `small-scale`, deployed on `2023-02-14T13:51:00`, with status `designing` and total cost `61.82`. For partner `4` ("Regional Cluster", certification `compact-certific-62`, service area `integrated-service-70`), the installation is "Seasonal Assessment", `small-scale`, deployed on `2022-05-20T10:42:00`, with status `complete` and total cost `13.94`. This view answers "Which installation is associated with each channel partner?"

**View `vw_channel_partner_surveillance_installation`**

```sql
CREATE VIEW vw_channel_partner_surveillance_installation AS
SELECT a.id, a.partner_id, a.partner_name, a.certification_level, b.surveillance_installation_id AS installation_surveillance_installation_id, b.installation_id AS installation_installation_id, b.project_name AS installation_project_name
FROM channel_partners a JOIN surveillance_installations b ON a.surveillance_installation_id = b.surveillance_installation_id;
```

| id | partner_id | partner_name | certification_level | installation_surveillance_installation_id | installation_installation_id | installation_project_name |
|---|---|---|---|---|---|---|
| 1 | 69420 | Composite Review | seasonal-certific-59 | 100 | 5917288 | Compact Survey |
| 2 | 9085260 | Compact Initiative A | regional-certific-60 | 101 | 325468 | Legacy Corridor |
| 3 | 195367 | Legacy Model | legacy-certific-61 | 102 | 2106712 | Regional Series A |
| 4 | b_VB-EC-12 | Regional Cluster | compact-certific-62 | 103 | 611502 | Seasonal Assessment |

## Synthesis

The surveillance infrastructure schema models a deployment as a central fact surrounded by five supporting entities. The `surveillance_installations` table anchors the model with its surrogate key, business identifier, project metadata, and five foreign keys. Each supporting entity table stores its own attributes and carries a back-reference foreign key to the installation, creating a symmetric relationship that can be traversed in either direction. The ten views materialize this symmetry: five outward-facing views answer questions that start from the installation and drill into a specific entity's details, while five inward-facing views answer questions that start from an entity and discover which installation it serves. Together, the base tables and views provide a complete, normalized representation of the surveillance deployment domain, with every fact reconstructible through a single join from the hub table to one of the five peripheral tables.