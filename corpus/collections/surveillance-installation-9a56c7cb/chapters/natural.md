## The Architecture of Surveillance Deployment

Organizations that deploy physical security infrastructure must coordinate hardware procurement, software licensing, client requirements, and partner capabilities across the lifecycle of each installation. A surveillance deployment is not merely a collection of cameras and cables; it is a managed project with a defined scope, a budget, a timeline, and a set of technical components that must interoperate. The records below capture the full picture of such deployments, from the initial design phase through implementation and completion, linking every piece of equipment to the organization that commissioned it and the partner that delivered it.

**Table `surveillance_installations`**

| surveillance_installation_id | installation_id | project_name | target_scale | deployment_date | status | total_cost | server_hardware_id | storage_system_id | video_management_software_id | client_organization_org_id | channel_partner_id |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 100 | 5917288 | Compact Survey | small-scale | 2023-02-14T13:51:00 | designing | 61.82 | 100 | 1 | 1 | 790471 | 1 |
| 101 | 325468 | Legacy Corridor | mid-sized | 2024-07-25T20:08:00 | implementation | 89.53 | 101 | 2 | 2 | 1717 | 2 |
| 102 | 2106712 | Regional Series A | large-scale | 2025-12-09T03:25:00 | pricing | 29.24 | 102 | 3 | 3 | 69437 | 3 |
| 103 | 611502 | Seasonal Assessment | small-scale | 2022-05-20T10:42:00 | complete | 13.94 | 103 | 4 | 4 | m16 | 4 |

The surveillance installations table is the central ledger of deployed projects. Each row represents a single installation, identified by a composite key consisting of a surrogate `surveillance_installation_id` and a human-readable `installation_id`. The `project_name` column carries the internal designation—Compact Survey, Legacy Corridor, Regional Series A, Seasonal Assessment—while `target_scale` classifies the scope as small-scale, mid-sized, or large-scale. Deployment dates range from early 2022 through late 2025, and the `status` column tracks the project's current phase: designing, implementation, pricing, or complete. The `total_cost` field, expressed in thousands of currency units, varies from 13.94 for the compact Seasonal Assessment project to 89.53 for the mid-sized Legacy Corridor effort. Foreign keys `server_hardware_id`, `storage_system_id`, `video_management_software_id`, `client_organization_org_id`, and `channel_partner_id` anchor each installation to its supporting components and stakeholders.

**Table `server_hardwares`**

| id | server_id | manufacturer | form_factor | model_number | serial_number | warranty_expiry | is_managed_service | surveillance_installation_id |
|---|---|---|---|---|---|---|---|---|
| 100 | 911352d5dab64576b7a6da51aa69d76d | Standard Chartered | rack | MOD-2238 | 5844275 | 2024-11-09 | true | 100 |
| 101 | 1450637 | General Motors | blade | MOD-2244 | 69422 | 2025-04-20 | false | 101 |
| 102 | 4985152 | Column Name cannot be empty | tower | MOD-2250 | 7731874 | 2022-09-04 | true | 102 |
| 103 | 9736887 | Financial Information Service Co. Ltd. | hyperscale | MOD-2256 | 10445632 | 2023-02-15 | false | 103 |

Server hardware forms the computational backbone of every surveillance installation. The `server_hardwares` table records each server unit with a unique `id`, a UUID-style `server_id`, and attributes describing its physical and contractual characteristics. The `manufacturer` field identifies the vendor—Standard Chartered, General Motors, Column Name cannot be empty, and Financial Information Service Co. Ltd. appear across the four records. The `form_factor` distinguishes between rack-mounted, blade, tower, and hyperscale configurations, reflecting the physical deployment strategy. Model numbers such as MOD-2238 and MOD-2256, along with serial numbers like 5844275 and 10445632, provide traceability for warranty and maintenance purposes. The `warranty_expiry` dates range from September 2022 to April 2025, and the `is_managed_service` boolean indicates whether the server is covered under a managed services agreement. Each hardware record links back to its parent installation via `surveillance_installation_id`.

**Table `storage_systems`**

| id | storage_id | storage_type | capacity_t_b | manufacturer | model_number | encryption_enabled | surveillance_installation_id |
|---|---|---|---|---|---|---|---|
| 1 | 82868 | SAN | 15.45 | Standard Chartered | MOD-2238 | false | 100 |
| 2 | 611501 | NAS | 17.90 | General Motors | MOD-2244 | true | 101 |
| 3 | id_29 | DAS | 20.35 | Column Name cannot be empty | MOD-2250 | false | 102 |
| 4 | ZUGLB8 | backup | 22.80 | Financial Information Service Co. Ltd. | MOD-2256 | true | 103 |

Data retention in surveillance systems depends on storage architecture, which the `storage_systems` table catalogs by `storage_type`—SAN, NAS, DAS, and backup configurations appear in the dataset. The `capacity_t_b` column quantifies storage in terabytes, ranging from 15.45 TB for the SAN deployment in installation 100 to 22.80 TB for the backup system in installation 103. The `storage_id` provides an additional identifier, while `manufacturer` and `model_number` mirror the hardware traceability pattern. The `encryption_enabled` flag indicates whether data-at-rest encryption is active; installations 101 and 103 have encryption enabled, while 100 and 102 do not. Each storage record is tied to its installation through `surveillance_installation_id`.

**Table `video_management_softwares`**

| id | software_id | version | license_type | max_cameras | supports_h_d | supports_i_p | supports_analog | surveillance_installation_id |
|---|---|---|---|---|---|---|---|---|
| 1 | gd_taxc_2111 | seasonal-version-71 | regional-license-78 | 34 | true | false | true | 100 |
| 2 | 5917273 | regional-version-72 | legacy-license-79 | 37 | false | true | false | 101 |
| 3 | id_4 | legacy-version-73 | compact-license-80 | 40 | true | false | true | 102 |
| 4 | 8928496 | compact-version-74 | composite-license-81 | 43 | false | true | false | 103 |

Video management software (VMS) orchestrates camera feeds, recording schedules, and playback across the surveillance network. The `video_management_softwares` table captures the software stack with a `version` string such as seasonal-version-71 or compact-version-74, a `license_type` like regional-license-78 or legacy-license-79, and a `max_cameras` capacity ranging from 34 to 43 cameras. Feature flags `supports_h_d`, `supports_i_p`, and `supports_analog` describe the protocol and signal compatibility of each VMS instance. Installation 100 runs a regional license supporting HD and analog but not IP, while installation 101 uses a legacy license with IP and analog support but no HD. The `software_id` column provides an additional identifier, and `surveillance_installation_id` links the software to its deployment.

**Table `client_organizations`**

| org_id | org_name | sector | region | org_size | surveillance_installation_id |
|---|---|---|---|---|---|
| 790471 | Nancy Garrison | government | Africa | small | 100 |
| 1717 | Stephenie Meyer | industry | ME | medium | 101 |
| 69437 | Brian Hamilton | banking | SAARC | large | 102 |
| m16 | Doctor Bob | retail | Africa | small | 103 |

The `client_organizations` table identifies the entities that commission surveillance installations. Each record carries an `org_id`, an `org_name` that in this dataset represents a contact person rather than a corporate entity—Nancy Garrison, Stephenie Meyer, Brian Hamilton, and Doctor Bob—a `sector` spanning government, industry, banking, and retail, a `region` such as Africa, ME, or SAARC, and an `org_size` classification of small, medium, or large. Installation 100 serves a small government organization in Africa, while installation 102 supports a large banking client in the SAARC region. The `surveillance_installation_id` foreign key connects each organization to its project.

**Table `channel_partners`**

| id | partner_id | partner_name | certification_level | service_area | surveillance_installation_id |
|---|---|---|---|---|---|
| 1 | 69420 | Composite Review | seasonal-certific-59 | baseline-service-67 | 100 |
| 2 | 9085260 | Compact Initiative A | regional-certific-60 | pilot-service-68 | 101 |
| 3 | 195367 | Legacy Model | legacy-certific-61 | extended-service-69 | 102 |
| 4 | b_VB-EC-12 | Regional Cluster | compact-certific-62 | integrated-service-70 | 103 |

Channel partners deliver and support surveillance deployments. The `channel_partners` table records each partner with an `id`, a `partner_id`, a `partner_name` such as Composite Review or Compact Initiative A, a `certification_level` like seasonal-certific-59 or compact-certific-62, and a `service_area` ranging from baseline-service-67 to integrated-service-70. The service area indicates the scope of support the partner provides, from pilot-level engagements to fully integrated service delivery. Each partner record is associated with a specific installation via `surveillance_installation_id`.

The relationships between these base tables become most visible through the installation-centric views, which join the central installation record to each of its component domains.

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

This view answers the question: what server hardware is deployed in each surveillance installation? By joining `surveillance_installations` to `server_hardwares` on `surveillance_installation_id`, the result presents the installation's project name, scale, and status alongside the server's manufacturer, form factor, and warranty details. For installation 5917288 (Compact Survey), the view reveals a rack-mounted server from Standard Chartered, model MOD-2238, serial 5844275, with warranty expiring 2024-11-09 and covered by a managed service. For installation 325468 (Legacy Corridor), the paired hardware is a blade server from General Motors, model MOD-2244, serial 69422, with warranty through 2025-04-20 and no managed service. The view makes it straightforward to audit hardware coverage across the portfolio.

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

The storage-system view joins installations to their storage configurations, answering which storage architecture, capacity, and encryption posture each project employs. Installation 5917288 uses a 15.45 TB SAN from Standard Chartered without encryption, while installation 325468 deploys a 17.90 TB NAS from General Motors with encryption enabled. Installation 2106712 (Regional Series A) relies on a 20.35 TB DAS configuration, and installation 611502 (Seasonal Assessment) uses a 22.80 TB backup system with encryption. The join surface allows security auditors to verify that encryption is applied consistently or to identify installations that may need remediation.

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

This view links each installation to its VMS instance, presenting the software version, license type, camera capacity, and protocol support alongside the installation's metadata. Installation 5917288 runs seasonal-version-71 under a regional license supporting 34 cameras with HD and analog compatibility but no IP support. Installation 325468 uses regional-version-72 under a legacy license for 37 cameras, supporting IP and analog but not HD. The view enables capacity planning by showing the maximum camera count per installation and feature coverage across the deployment base.

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

The client-organization view associates each installation with the commissioning entity, revealing the sector, region, and size of the client alongside the project details. Installation 5917288 serves Nancy Garrison's small government organization in Africa, while installation 325468 supports Stephenie Meyer's medium industry client in the ME region. Installation 2106712 targets Brian Hamilton's large banking organization in SAARC, and installation 611502 serves Doctor Bob's small retail client in Africa. This join is essential for revenue analysis by sector and region, as well as for understanding the relationship between client size and project scale.

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

This view connects installations to their delivering channel partners, showing the partner name, certification level, and service area alongside the project information. Installation 5917288 is delivered by Composite Review, holding seasonal-certific-59 and providing baseline-service-67 support. Installation 325468 is handled by Compact Initiative A with regional-certific-60 and pilot-service-68 coverage. Installation 2106712 involves Legacy Model (legacy-certific-61, extended-service-69), and installation 611502 is managed by Regional Cluster (compact-certific-62, integrated-service-70). The view supports partner performance evaluation and service-level auditing.

The reverse-direction views answer the complementary question: for a given hardware, storage, software, client, or partner record, which surveillance installations reference it? These views are useful for impact analysis and lifecycle management.

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

This view inverts the hardware relationship, presenting each server's attributes alongside the installation it serves. The Standard Chartered rack server (MOD-2238, serial 5844275) is deployed in the Compact Survey project (installation 5917288), a small-scale effort currently in the designing phase with a budget of 61.82. The General Motors blade server (MOD-2244, serial 69422) supports the Legacy Corridor project (installation 325468), a mid-sized implementation at 89.53 in cost. If a hardware recall or warranty claim arises, this view immediately surfaces the affected installations.

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

The storage-inversion view pairs each storage system with its parent installation. The 15.45 TB SAN without encryption (storage_id 82868) serves the Compact Survey installation, while the 17.90 TB NAS with encryption (storage_id 611501) supports Legacy Corridor. The 20.35 TB DAS (storage_id id_29) is allocated to Regional Series A, and the 22.80 TB backup system (storage_id ZUGLB8) backs Seasonal Assessment. This view is critical for capacity forecasting and encryption compliance audits.

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

This view maps each VMS instance to its deployment. The seasonal-version-71 software (software_id gd_taxc_2111) with a regional license and 34-camera capacity runs on the Compact Survey installation. The regional-version-72 software (software_id 5917273) with a legacy license and 37-camera capacity is deployed on Legacy Corridor. If a software vulnerability is disclosed, this view identifies the installations that require patching.

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

The client-inversion view links each organization to its surveillance project. Nancy Garrison's small government organization in Africa (org_id 790471) commissioned the Compact Survey installation, while Stephenie Meyer's medium industry client in ME (org_id 1717) commissioned Legacy Corridor. Brian Hamilton's large banking organization in SAARC (org_id 69437) commissioned Regional Series A, and Doctor Bob's small retail client in Africa (org_id m16) commissioned Seasonal Assessment. This view supports account management and cross-selling analysis.

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

This final view maps each channel partner to its assigned installation. Composite Review (partner_id 69420) with seasonal certification and baseline service delivery is assigned to Compact Survey. Compact Initiative A (partner_id 9085260) with regional certification and pilot service is assigned to Legacy Corridor. Legacy Model (partner_id 195367) with legacy certification and extended service supports Regional Series A, and Regional Cluster (partner_id b_VB-EC-12) with compact certification and integrated service handles Seasonal Assessment. This view enables partner workload balancing and service-quality tracking.

The surveillance installation domain demonstrates how a single project record serves as the hub for a network of hardware, storage, software, client, and partner relationships. Each base table captures the attributes of its respective component, while the installation-centric views provide a unified project-level perspective and the reverse views enable component-level impact tracing. Together, these records support the full lifecycle of surveillance deployment—from initial design through implementation to completion—ensuring that every camera, server, terabyte of storage, and license is accounted for within the context of the project that requires it.