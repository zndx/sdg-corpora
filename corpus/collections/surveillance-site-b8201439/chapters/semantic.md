## Ontology-Grounded Schema Design for the Surveillance Infrastructure Domain

The surveillance infrastructure domain captures the physical and logical topology of a distributed monitoring network. At its core, the system comprises geographically dispersed surveillance sites, centrally managed control centres, radar stations equipped with data acquisition hardware, network links that bind the infrastructure together, and the software stack—processing servers and monitoring applications—that turns raw telemetry into actionable intelligence. Operational events, ranging from faults to scheduled maintenance, are recorded against the sites they affect. The relational schema models this ecosystem by separating persistent entities into base tables, resolving many-to-many associations through junction tables, and exposing denormalized views that reconstruct domain facts for reporting and analysis.

**Table `surveillance_sites`**

| surveillance_site_id | site_identifier | site_name | latitude | longitude | site_type | operational_status | deployment_date |
|---|---|---|---|---|---|---|---|
| 1 | SIT-2771 | Composite Review | 13.95 | 21.20 | radar | online | 2023-02-14 |
| 2 | SIT-2772 | Compact Initiative A | 17.90 | 25.40 | sensor | offline | 2024-07-25 |
| 3 | SIT-2773 | Legacy Model | 21.85 | 29.60 | mixed | maintenance | 2025-12-09 |
| 4 | SIT-2774 | Regional Cluster | 25.80 | 33.80 | radar | decommissioned | 2022-05-20 |

The `surveillance_sites` table anchors the physical layer. Each row represents a deployment location identified by a composite key (`surveillance_site_id` as primary key, `site_identifier` as a human-readable code such as `SIT-2771`). The `site_name` column carries descriptive labels like *Composite Review* or *Regional Cluster*, while `latitude` and `longitude` (e.g., `13.95`, `21.20`) fix the site on a map. The `site_type` enum (`radar`, `sensor`, `mixed`) classifies the sensor modality, `operational_status` tracks lifecycle state (`online`, `offline`, `maintenance`, `decommissioned`), and `deployment_date` records when the site went live. Site `SIT-2774`, for instance, carries a `decommissioned` status and a `deployment_date` of `2022-05-20`, signalling an asset that is no longer in service.

**Table `control_centres`**

| id | centre_identifier | centre_name | jurisdiction | centre_type | established_date | is_primary |
|---|---|---|---|---|---|---|
| 1000 | CEN-2480 | Regional Cluster | regional-jurisdic-30 | fixed | 2024-03-27 | true |
| 1001 | CEN-2487 | Seasonal Review D | legacy-jurisdic-31 | deployable | 2025-08-11 | false |
| 1002 | CEN-2494 | Integrated Initiative | compact-jurisdic-32 | mobile | 2022-01-22 | true |
| 1003 | CEN-2501 | Extended Model | composite-jurisdic-33 | fixed | 2023-06-06 | false |

Control centres provide the administrative and operational hub for the network. The `control_centres` table uses `id` as its surrogate primary key and `centre_identifier` (e.g., `CEN-2480`) as the business key. The `centre_name` column mirrors naming conventions found across the domain—*Regional Cluster*, *Seasonal Review D*—while `jurisdiction` encodes the administrative boundary (`regional-jurisdic-30`, `legacy-jurisdic-31`). The `centre_type` enum (`fixed`, `deployable`, `mobile`) distinguishes permanent installations from mobile assets, `established_date` records commissioning, and `is_primary` flags the lead centre within a jurisdictional cluster. Centre `CEN-2494`, for example, is a `mobile` type with `is_primary` set to `true`, indicating it serves as the primary node for `compact-jurisdic-32`.

**Table `radar_stations`**

| radar_station_id | radar_identifier | radar_model | frequency_band | max_range | installation_date | last_maintenance_date | is_upgraded | surveillance_site_id | data_acquisition_unit_id |
|---|---|---|---|---|---|---|---|---|---|
| 1000 | RAD-2323 | adaptive-radar-65 | integrated-frequenc-94 | 2.70 | 2022-01-10 | 2024-03-27 | false | 1 | 1000 |
| 1001 | RAD-2330 | distributed-radar-66 | seasonal-frequenc-95 | 5.40 | 2023-06-21 | 2025-08-11 | true | 2 | 1001 |
| 1002 | RAD-2337 | baseline-radar-67 | regional-frequenc-96 | 8.10 | 2024-11-05 | 2022-01-22 | false | 3 | 1002 |
| 1003 | RAD-2344 | pilot-radar-68 | legacy-frequenc-97 | 10.80 | 2025-04-16 | 2023-06-06 | true | 4 | 1003 |

Radar stations are the sensing hardware deployed at surveillance sites. The `radar_stations` table stores technical specifications: `radar_identifier` (e.g., `RAD-2323`), `radar_model` (`adaptive-radar-65`, `distributed-radar-66`), `frequency_band` (`integrated-frequenc-94`), and `max_range` in kilometres (`2.70`, `5.40`). Maintenance history is captured via `installation_date` and `last_maintenance_date`, while `is_upgraded` is a boolean flag. Two foreign keys anchor the station to the physical and data layers: `surveillance_site_id` links the radar to its host site, and `data_acquisition_unit_id` links it to the unit that digitizes its output. Station `RAD-2323` at site `1` uses firmware unit `1000` and operates on the `integrated-frequenc-94` band with a maximum range of `2.70` km.

**Table `data_acquisition_units`**

| id | acquisition_unit_id | firmware_version | sampling_rate | data_format | status | last_sync_timestamp | radar_station_id |
|---|---|---|---|---|---|---|---|
| 1000 | 2106717 | distributed-firmware-48 | 18.45 | primary-data-16 | active | 2022-05-25T16:48:00 | 1000 |
| 1001 | state_uk_16 | baseline-firmware-49 | 22.90 | adaptive-data-17 | standby | 2023-10-09T23:05:00 | 1001 |
| 1002 | 1450653 | pilot-firmware-50 | 27.35 | distributed-data-18 | fault | 2024-03-20T06:22:00 | 1002 |
| 1003 | 6926350 | extended-firmware-51 | 31.80 | baseline-data-19 | active | 2025-08-04T13:39:00 | 1003 |

Data acquisition units (DAUs) are the hardware intermediaries between radar sensors and the processing pipeline. The `data_acquisition_units` table records `id` as the primary key, `acquisition_unit_id` as the business identifier (e.g., `2106717`, `state_uk_16`), `firmware_version` (`distributed-firmware-48`), `sampling_rate` (e.g., `18.45` Hz), `data_format` (`primary-data-16`), and `status` (`active`, `standby`, `fault`). The `last_sync_timestamp` column (e.g., `2022-05-25T16:48:00`) tracks the most recent data handshake. A foreign key `radar_station_id` binds each DAU to exactly one radar station, enforcing a one-to-one or one-to-many relationship depending on deployment topology. Unit `1003` with firmware `extended-firmware-51` is in `active` status and last synced at `2025-08-04T13:39:00`.

**Table `network_links`**

| id | link_identifier | link_type | bandwidth | latency | is_redundant | protocol | surveillance_site_id | control_centre_id |
|---|---|---|---|---|---|---|---|---|
| 1 | https://www.robertchristgau.com/get_album.php?id=4445 | leased_line | 20.20 | 13.45 | true | seasonal-protocol-11 | 1 | 1000 |
| 2 | https://bugs.launchpad.net/murano/+bug/1287690 | surveillance_network | 23.40 | 17.90 | false | regional-protocol-12 | 2 | 1001 |
| 3 | http://hdl.handle.net/10419/142700 | satellite | 26.60 | 22.35 | true | legacy-protocol-13 | 3 | 1002 |
| 4 | https://www.nature.com/articles/nphys3742 | leased_line | 29.80 | 26.80 | false | compact-protocol-14 | 4 | 1003 |

Network links model the communication fabric connecting surveillance sites to control centres. The `network_links` table uses `id` as primary key, `link_identifier` as a URL-like business key (e.g., `https://www.robertchristgau.com/get_album.php?id=4445`), and `link_type` (`leased_line`, `surveillance_network`, `satellite`). Performance characteristics are captured in `bandwidth` (e.g., `20.20` Mbps) and `latency` (e.g., `13.45` ms). The `is_redundant` boolean and `protocol` enum (`seasonal-protocol-11`, `regional-protocol-12`) describe reliability and transport layer properties. Foreign keys `surveillance_site_id` and `control_centre_id` establish the endpoints of each link, creating a direct site-to-centre connectivity graph. Link `1` connects site `1` to centre `1000` over a `leased_line` with `20.20` Mbps bandwidth and `13.45` ms latency.

**Table `monitoring_events`**

| id | event_id | event_timestamp | event_type | severity | description | resolved | resolution_time | surveillance_site_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 2002007020060 | 2025-04-17T15:57:00 | fault | critical | Extended Survey | true | 2024-11-10T10:30:00 | 1 |
| 2 | 168535 | 2022-09-01T22:14:00 | warning | high | Pilot Corridor A | false | 2025-04-21T17:47:00 | 2 |
| 3 | ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 | 2023-02-12T05:31:00 | status_change | medium | Baseline Series | true | 2022-09-05T00:04:00 | 3 |
| 4 | 1186089 | 2024-07-23T12:48:00 | maintenance | low | Distributed Assessment | false | 2023-02-16T07:21:00 | 4 |

Monitoring events record operational incidents and state changes. The `monitoring_events` table stores `id` as primary key, `event_id` as a composite business identifier (e.g., `2002007020060`, `ab8e1d18-8fcd-11eb-924d-9cd76263cbd0`), `event_timestamp` for when the event occurred, `event_type` (`fault`, `warning`, `status_change`, `maintenance`), and `severity` (`critical`, `high`, `medium`, `low`). The `description` column provides a human-readable summary (*Extended Survey*, *Pilot Corridor A*), `resolved` is a boolean flag, and `resolution_time` records when the event was closed. The foreign key `surveillance_site_id` ties each event to the site it affects. Event `1` is a `critical` fault at site `1` that was resolved with a resolution time of `2024-11-10T10:30:00`.

**Table `processing_servers`**

| id | server_id | server_role | os_version | database_type | uptime | last_health_check | control_centre_id |
|---|---|---|---|---|---|---|---|
| 1 | 911352d5dab64576b7a6da51aa69d76d | primary | integrated-os-46 | distributed-database-60 | 6.70 | 2023-06-08T05:39:00 | 1000 |
| 2 | 1450637 | redundant | seasonal-os-47 | baseline-database-61 | 8.40 | 2024-11-19T12:56:00 | 1001 |
| 3 | 4985152 | backup | regional-os-48 | pilot-database-62 | 10.10 | 2025-04-03T19:13:00 | 1002 |
| 4 | 9736887 | primary | legacy-os-49 | extended-database-63 | 11.80 | 2022-09-14T02:30:00 | 1003 |

Processing servers form the compute layer of the monitoring stack. The table (not shown in the payload block but referenced in the schema) stores server identifiers, hardware specifications, and operational metadata. These servers host monitoring applications and are linked to data acquisition units and control centres through junction tables that capture the deployment topology.

**Table `monitoring_applications`**

| monitoring_application_id | app_id | app_name | version | interface_type | is_customized | last_updated | control_centre_id |
|---|---|---|---|---|---|---|---|
| 100 | d6267a5e-8fc1-11eb-924d-9cd76263cbd0 | Pilot Cluster | seasonal-version-71 | web | true | 2023-06-17T17:27:00 | 1000 |
| 101 | 4463647 | Baseline Review | regional-version-72 | desktop | false | 2024-11-01T00:44:00 | 1001 |
| 102 | ceffd6ca-8fd1-11eb-924d-9cd76263cbd0 | Distributed Initiative A | legacy-version-73 | api | true | 2025-04-12T07:01:00 | 1002 |
| 103 | 89820 | Adaptive Model | compact-version-74 | web | false | 2022-09-23T14:18:00 | 1003 |

Monitoring applications represent the software services running on processing servers. The table stores application identifiers, version information, and deployment metadata. Applications are bound to servers via the `applications_servers` junction table and to control centres and surveillance sites through additional junction tables, reflecting a many-to-many deployment model where a single application may run on multiple servers across multiple sites.

The base entity tables above define the core domain objects. Their relationships are not all direct: some associations are many-to-many and require junction tables to materialize. The following junction tables resolve these relationships, each containing two foreign keys that reference the primary keys of the participating base tables.

**Table `sites_centres`**

| surveillance_site_id | control_centre_id |
|---|---|
| 1 | 1000 |
| 1 | 1001 |
| 2 | 1001 |
| 2 | 1002 |
| 3 | 1002 |
| 3 | 1003 |
| 4 | 1003 |
| 4 | 1000 |

The `sites_centres` junction table resolves the many-to-many relationship between surveillance sites and control centres. Each row contains a foreign key to `surveillance_sites.surveillance_site_id` and a foreign key to `control_centres.id`, representing an administrative or operational association between a site and a centre. This table enables a site to be managed by multiple centres and a centre to oversee multiple sites.

**Table `sites_stations`**

| surveillance_site_id | radar_station_id |
|---|---|
| 1 | 1000 |
| 1 | 1001 |
| 2 | 1001 |
| 2 | 1002 |
| 3 | 1002 |
| 3 | 1003 |
| 4 | 1003 |
| 4 | 1000 |

The `sites_stations` junction table captures the association between surveillance sites and radar stations. While `radar_stations` already carries a `surveillance_site_id` foreign key for a direct one-to-many link, `sites_stations` provides an explicit many-to-many resolution, allowing a site to host multiple radar stations and a station to be associated with multiple sites in complex deployments.

**Table `sites_links`**

| surveillance_site_id | network_link_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

The `sites_links` junction table resolves the relationship between surveillance sites and network links. Each row links a `surveillance_site_id` to a `network_links.id`, documenting which sites are endpoints of which network connections. This complements the direct `surveillance_site_id` foreign key in `network_links` by providing an explicit association table for reporting and audit purposes.

**Table `centres_sites`**

| control_centre_id | surveillance_site_id |
|---|---|
| 1000 | 1 |
| 1000 | 2 |
| 1001 | 2 |
| 1001 | 3 |
| 1002 | 3 |
| 1002 | 4 |
| 1003 | 4 |
| 1003 | 1 |

The `centres_sites` junction table is the inverse of `sites_centres`, providing the same many-to-many relationship from the control centre perspective. Each row contains a `control_centre_id` foreign key and a `surveillance_site_id` foreign key, enabling queries that start from a centre and enumerate all associated sites.

**Table `centres_applications`**

| control_centre_id | monitoring_application_id |
|---|---|
| 1000 | 100 |
| 1000 | 101 |
| 1001 | 101 |
| 1001 | 102 |
| 1002 | 102 |
| 1002 | 103 |
| 1003 | 103 |
| 1003 | 100 |

The `centres_applications` junction table resolves the many-to-many relationship between control centres and monitoring applications. A centre may deploy multiple applications, and an application may be deployed across multiple centres. Each row contains a `control_centre_id` and a `monitoring_applications.id`.

**Table `centres_links`**

| control_centre_id | network_link_id |
|---|---|
| 1000 | 1 |
| 1000 | 2 |
| 1001 | 2 |
| 1001 | 3 |
| 1002 | 3 |
| 1002 | 4 |
| 1003 | 4 |
| 1003 | 1 |

The `centres_links` junction table captures the association between control centres and network links. Each row links a `control_centre_id` to a `network_links.id`, documenting which centres are endpoints of which network connections. This complements the direct `control_centre_id` foreign key in `network_links`.

**Table `stations_centres`**

| radar_station_id | control_centre_id |
|---|---|
| 1000 | 1000 |
| 1000 | 1001 |
| 1001 | 1001 |
| 1001 | 1002 |
| 1002 | 1002 |
| 1002 | 1003 |
| 1003 | 1003 |
| 1003 | 1000 |

The `stations_centres` junction table resolves the relationship between radar stations and control centres. Each row contains a `radar_station_id` and a `control_centre_id`, documenting which radar stations report to or are managed by which control centres.

**Table `units_links`**

| data_acquisition_unit_id | network_link_id |
|---|---|
| 1000 | 1 |
| 1000 | 2 |
| 1001 | 2 |
| 1001 | 3 |
| 1002 | 3 |
| 1002 | 4 |
| 1003 | 4 |
| 1003 | 1 |

The `units_links` junction table captures the association between data acquisition units and network links. Each row contains a `data_acquisition_unit_id` and a `network_links.id`, documenting which DAUs use which network links for data transmission.

**Table `units_servers`**

| data_acquisition_unit_id | processing_server_id |
|---|---|
| 1000 | 1 |
| 1000 | 2 |
| 1001 | 2 |
| 1001 | 3 |
| 1002 | 3 |
| 1002 | 4 |
| 1003 | 4 |
| 1003 | 1 |

The `units_servers` junction table resolves the relationship between data acquisition units and processing servers. Each row contains a `data_acquisition_unit_id` and a `processing_server_id`, documenting which DAUs feed data to which servers.

**Table `links_units`**

| network_link_id | data_acquisition_unit_id |
|---|---|
| 1 | 1000 |
| 1 | 1001 |
| 2 | 1001 |
| 2 | 1002 |
| 3 | 1002 |
| 3 | 1003 |
| 4 | 1003 |
| 4 | 1000 |

The `links_units` junction table is the inverse of `units_links`, providing the same association from the network link perspective. Each row contains a `network_links.id` and a `data_acquisition_unit_id`.

**Table `events_stations`**

| monitoring_event_id | radar_station_id |
|---|---|
| 1 | 1000 |
| 1 | 1001 |
| 2 | 1001 |
| 2 | 1002 |
| 3 | 1002 |
| 3 | 1003 |
| 4 | 1003 |
| 4 | 1000 |

The `events_stations` junction table resolves the relationship between monitoring events and radar stations. Each row contains a `monitoring_event_id` and a `radar_station_id`, documenting which radar stations are implicated in which events.

**Table `events_units`**

| monitoring_event_id | data_acquisition_unit_id |
|---|---|
| 1 | 1000 |
| 1 | 1001 |
| 2 | 1001 |
| 2 | 1002 |
| 3 | 1002 |
| 3 | 1003 |
| 4 | 1003 |
| 4 | 1000 |

The `events_units` junction table captures the association between monitoring events and data acquisition units. Each row contains a `monitoring_event_id` and a `data_acquisition_unit_id`, documenting which DAUs are affected by or contribute to which events.

**Table `events_centres`**

| monitoring_event_id | control_centre_id |
|---|---|
| 1 | 1000 |
| 1 | 1001 |
| 2 | 1001 |
| 2 | 1002 |
| 3 | 1002 |
| 3 | 1003 |
| 4 | 1003 |
| 4 | 1000 |

The `events_centres` junction table resolves the relationship between monitoring events and control centres. Each row contains a `monitoring_event_id` and a `control_centre_id`, documenting which centres are responsible for or notified about which events.

**Table `servers_units`**

| processing_server_id | data_acquisition_unit_id |
|---|---|
| 1 | 1000 |
| 1 | 1001 |
| 2 | 1001 |
| 2 | 1002 |
| 3 | 1002 |
| 3 | 1003 |
| 4 | 1003 |
| 4 | 1000 |

The `servers_units` junction table is the inverse of `units_servers`, providing the same association from the processing server perspective. Each row contains a `processing_server_id` and a `data_acquisition_unit_id`.

**Table `servers_applications`**

| processing_server_id | monitoring_application_id |
|---|---|
| 1 | 100 |
| 1 | 101 |
| 2 | 101 |
| 2 | 102 |
| 3 | 102 |
| 3 | 103 |
| 4 | 103 |
| 4 | 100 |

The `servers_applications` junction table resolves the many-to-many relationship between processing servers and monitoring applications. Each row contains a `processing_server_id` and a `monitoring_applications.id`, documenting which applications run on which servers.

**Table `applications_servers`**

| monitoring_application_id | processing_server_id |
|---|---|
| 100 | 1 |
| 100 | 2 |
| 101 | 2 |
| 101 | 3 |
| 102 | 3 |
| 102 | 4 |
| 103 | 4 |
| 103 | 1 |

The `applications_servers` junction table is the inverse of `servers_applications`, providing the same association from the application perspective. Each row contains a `monitoring_applications.id` and a `processing_server_id`.

**Table `applications_sites`**

| monitoring_application_id | surveillance_site_id |
|---|---|
| 100 | 1 |
| 100 | 2 |
| 101 | 2 |
| 101 | 3 |
| 102 | 3 |
| 102 | 4 |
| 103 | 4 |
| 103 | 1 |

The `applications_sites` junction table resolves the relationship between monitoring applications and surveillance sites. Each row contains a `monitoring_applications.id` and a `surveillance_site_id`, documenting which applications are deployed at which sites.

With the base tables and junction tables defining the normalized schema, the view layer reconstructs domain facts by joining these tables. Each view answers a specific analytical question by denormalizing a subset of the schema into a flat, queryable result set.

**View `v_surveillance_site_control_centre_detail`**

```sql
CREATE VIEW v_surveillance_site_control_centre_detail AS
SELECT a.surveillance_site_id, a.site_identifier, a.site_name, b.id AS centre_id, b.centre_identifier AS centre_centre_identifier, b.centre_name AS centre_centre_name
FROM surveillance_sites a
  JOIN sites_centres j ON j.surveillance_site_id = a.surveillance_site_id
  JOIN control_centres b ON b.id = j.control_centre_id;
```

| surveillance_site_id | site_identifier | site_name | centre_id | centre_centre_identifier | centre_centre_name |
|---|---|---|---|---|---|
| 1 | SIT-2771 | Composite Review | 1000 | CEN-2480 | Regional Cluster |
| 1 | SIT-2771 | Composite Review | 1001 | CEN-2487 | Seasonal Review D |
| 2 | SIT-2772 | Compact Initiative A | 1001 | CEN-2487 | Seasonal Review D |
| 2 | SIT-2772 | Compact Initiative A | 1002 | CEN-2494 | Integrated Initiative |
| 3 | SIT-2773 | Legacy Model | 1002 | CEN-2494 | Integrated Initiative |
| 3 | SIT-2773 | Legacy Model | 1003 | CEN-2501 | Extended Model |
| 4 | SIT-2774 | Regional Cluster | 1003 | CEN-2501 | Extended Model |
| 4 | SIT-2774 | Regional Cluster | 1000 | CEN-2480 | Regional Cluster |

This view joins `surveillance_sites` to `sites_centres` and then to `control_centres`, producing a flat record that pairs each site with its managing centre. It answers the question: *Which control centre manages which surveillance site?* A row might show site `SIT-2771` (Composite Review) managed by centre `CEN-2480` (Regional Cluster), enabling operators to quickly identify the administrative chain of command.

**View `v_surveillance_site_radar_station_detail`**

```sql
CREATE VIEW v_surveillance_site_radar_station_detail AS
SELECT a.surveillance_site_id, a.site_identifier, a.site_name, b.radar_station_id AS station_radar_station_id, b.radar_identifier AS station_radar_identifier, b.radar_model AS station_radar_model
FROM surveillance_sites a
  JOIN sites_stations j ON j.surveillance_site_id = a.surveillance_site_id
  JOIN radar_stations b ON b.radar_station_id = j.radar_station_id;
```

| surveillance_site_id | site_identifier | site_name | station_radar_station_id | station_radar_identifier | station_radar_model |
|---|---|---|---|---|---|
| 1 | SIT-2771 | Composite Review | 1000 | RAD-2323 | adaptive-radar-65 |
| 1 | SIT-2771 | Composite Review | 1001 | RAD-2330 | distributed-radar-66 |
| 2 | SIT-2772 | Compact Initiative A | 1001 | RAD-2330 | distributed-radar-66 |
| 2 | SIT-2772 | Compact Initiative A | 1002 | RAD-2337 | baseline-radar-67 |
| 3 | SIT-2773 | Legacy Model | 1002 | RAD-2337 | baseline-radar-67 |
| 3 | SIT-2773 | Legacy Model | 1003 | RAD-2344 | pilot-radar-68 |
| 4 | SIT-2774 | Regional Cluster | 1003 | RAD-2344 | pilot-radar-68 |
| 4 | SIT-2774 | Regional Cluster | 1000 | RAD-2323 | adaptive-radar-65 |

This view joins `surveillance_sites` to `sites_stations` and then to `radar_stations`, producing a flat record that pairs each site with its radar station. It answers: *Which radar station is deployed at which surveillance site?* A row might show site `SIT-2771` hosting radar station `RAD-2323` (adaptive-radar-65), providing a clear view of the sensor inventory per site.

**View `v_surveillance_site_network_link_detail`**

```sql
CREATE VIEW v_surveillance_site_network_link_detail AS
SELECT a.surveillance_site_id, a.site_identifier, a.site_name, b.id AS link_id, b.link_identifier AS link_link_identifier, b.link_type AS link_link_type
FROM surveillance_sites a
  JOIN sites_links j ON j.surveillance_site_id = a.surveillance_site_id
  JOIN network_links b ON b.id = j.network_link_id;
```

| surveillance_site_id | site_identifier | site_name | link_id | link_link_identifier | link_link_type |
|---|---|---|---|---|---|
| 1 | SIT-2771 | Composite Review | 1 | https://www.robertchristgau.com/get_album.php?id=4445 | leased_line |
| 1 | SIT-2771 | Composite Review | 2 | https://bugs.launchpad.net/murano/+bug/1287690 | surveillance_network |
| 2 | SIT-2772 | Compact Initiative A | 2 | https://bugs.launchpad.net/murano/+bug/1287690 | surveillance_network |
| 2 | SIT-2772 | Compact Initiative A | 3 | http://hdl.handle.net/10419/142700 | satellite |
| 3 | SIT-2773 | Legacy Model | 3 | http://hdl.handle.net/10419/142700 | satellite |
| 3 | SIT-2773 | Legacy Model | 4 | https://www.nature.com/articles/nphys3742 | leased_line |
| 4 | SIT-2774 | Regional Cluster | 4 | https://www.nature.com/articles/nphys3742 | leased_line |
| 4 | SIT-2774 | Regional Cluster | 1 | https://www.robertchristgau.com/get_album.php?id=4445 | leased_line |

This view joins `surveillance_sites` to `sites_links` and then to `network_links`, producing a flat record that pairs each site with its network links. It answers: *Which network links terminate at which surveillance site?* A row might show site `SIT-2771` connected via link `1` (a `leased_line` with `20.20` Mbps bandwidth), enabling network capacity planning per site.

**View `v_control_centre_surveillance_site_detail`**

```sql
CREATE VIEW v_control_centre_surveillance_site_detail AS
SELECT a.id, a.centre_identifier, a.centre_name, b.surveillance_site_id AS site_surveillance_site_id, b.site_identifier AS site_site_identifier, b.site_name AS site_site_name
FROM control_centres a
  JOIN centres_sites j ON j.control_centre_id = a.id
  JOIN surveillance_sites b ON b.surveillance_site_id = j.surveillance_site_id;
```

| id | centre_identifier | centre_name | site_surveillance_site_id | site_site_identifier | site_site_name |
|---|---|---|---|---|---|
| 1000 | CEN-2480 | Regional Cluster | 1 | SIT-2771 | Composite Review |
| 1000 | CEN-2480 | Regional Cluster | 2 | SIT-2772 | Compact Initiative A |
| 1001 | CEN-2487 | Seasonal Review D | 2 | SIT-2772 | Compact Initiative A |
| 1001 | CEN-2487 | Seasonal Review D | 3 | SIT-2773 | Legacy Model |
| 1002 | CEN-2494 | Integrated Initiative | 3 | SIT-2773 | Legacy Model |
| 1002 | CEN-2494 | Integrated Initiative | 4 | SIT-2774 | Regional Cluster |
| 1003 | CEN-2501 | Extended Model | 4 | SIT-2774 | Regional Cluster |
| 1003 | CEN-2501 | Extended Model | 1 | SIT-2771 | Composite Review |

This view joins `control_centres` to `centres_sites` and then to `surveillance_sites`, producing a flat record that pairs each centre with its managed sites. It answers: *Which surveillance sites fall under which control centre?* A row might show centre `CEN-2480` (Regional Cluster) managing site `SIT-2771` (Composite Review), providing a centre-centric operational view.

**View `v_control_centre_monitoring_application_detail`**

```sql
CREATE VIEW v_control_centre_monitoring_application_detail AS
SELECT a.id, a.centre_identifier, a.centre_name, b.monitoring_application_id AS application_monitoring_application_id, b.app_id AS application_app_id, b.app_name AS application_app_name
FROM control_centres a
  JOIN centres_applications j ON j.control_centre_id = a.id
  JOIN monitoring_applications b ON b.monitoring_application_id = j.monitoring_application_id;
```

| id | centre_identifier | centre_name | application_monitoring_application_id | application_app_id | application_app_name |
|---|---|---|---|---|---|
| 1000 | CEN-2480 | Regional Cluster | 100 | d6267a5e-8fc1-11eb-924d-9cd76263cbd0 | Pilot Cluster |
| 1000 | CEN-2480 | Regional Cluster | 101 | 4463647 | Baseline Review |
| 1001 | CEN-2487 | Seasonal Review D | 101 | 4463647 | Baseline Review |
| 1001 | CEN-2487 | Seasonal Review D | 102 | ceffd6ca-8fd1-11eb-924d-9cd76263cbd0 | Distributed Initiative A |
| 1002 | CEN-2494 | Integrated Initiative | 102 | ceffd6ca-8fd1-11eb-924d-9cd76263cbd0 | Distributed Initiative A |
| 1002 | CEN-2494 | Integrated Initiative | 103 | 89820 | Adaptive Model |
| 1003 | CEN-2501 | Extended Model | 103 | 89820 | Adaptive Model |
| 1003 | CEN-2501 | Extended Model | 100 | d6267a5e-8fc1-11eb-924d-9cd76263cbd0 | Pilot Cluster |

This view joins `control_centres` to `centres_applications` and then to `monitoring_applications`, producing a flat record that pairs each centre with its deployed applications. It answers: *Which monitoring applications are deployed at which control centre?* A row might show centre `CEN-2480` running a specific monitoring application, enabling software inventory and version tracking per centre.

**View `v_control_centre_network_link_detail`**

```sql
CREATE VIEW v_control_centre_network_link_detail AS
SELECT a.id, a.centre_identifier, a.centre_name, b.id AS link_id, b.link_identifier AS link_link_identifier, b.link_type AS link_link_type
FROM control_centres a
  JOIN centres_links j ON j.control_centre_id = a.id
  JOIN network_links b ON b.id = j.network_link_id;
```

| id | centre_identifier | centre_name | link_id | link_link_identifier | link_link_type |
|---|---|---|---|---|---|
| 1000 | CEN-2480 | Regional Cluster | 1 | https://www.robertchristgau.com/get_album.php?id=4445 | leased_line |
| 1000 | CEN-2480 | Regional Cluster | 2 | https://bugs.launchpad.net/murano/+bug/1287690 | surveillance_network |
| 1001 | CEN-2487 | Seasonal Review D | 2 | https://bugs.launchpad.net/murano/+bug/1287690 | surveillance_network |
| 1001 | CEN-2487 | Seasonal Review D | 3 | http://hdl.handle.net/10419/142700 | satellite |
| 1002 | CEN-2494 | Integrated Initiative | 3 | http://hdl.handle.net/10419/142700 | satellite |
| 1002 | CEN-2494 | Integrated Initiative | 4 | https://www.nature.com/articles/nphys3742 | leased_line |
| 1003 | CEN-2501 | Extended Model | 4 | https://www.nature.com/articles/nphys3742 | leased_line |
| 1003 | CEN-2501 | Extended Model | 1 | https://www.robertchristgau.com/get_album.php?id=4445 | leased_line |

This view joins `control_centres` to `centres_links` and then to `network_links`, producing a flat record that pairs each centre with its network links. It answers: *Which network links are associated with which control centre?* A row might show centre `CEN-2480` connected via link `1` (a `leased_line`), enabling network topology analysis from the centre perspective.

**View `v_radar_station_surveillance_site`**

```sql
CREATE VIEW v_radar_station_surveillance_site AS
SELECT a.radar_station_id, a.radar_identifier, a.radar_model, a.frequency_band, b.surveillance_site_id AS site_surveillance_site_id, b.site_identifier AS site_site_identifier, b.site_name AS site_site_name
FROM radar_stations a JOIN surveillance_sites b ON a.surveillance_site_id = b.surveillance_site_id;
```

| radar_station_id | radar_identifier | radar_model | frequency_band | site_surveillance_site_id | site_site_identifier | site_site_name |
|---|---|---|---|---|---|---|
| 1000 | RAD-2323 | adaptive-radar-65 | integrated-frequenc-94 | 1 | SIT-2771 | Composite Review |
| 1001 | RAD-2330 | distributed-radar-66 | seasonal-frequenc-95 | 2 | SIT-2772 | Compact Initiative A |
| 1002 | RAD-2337 | baseline-radar-67 | regional-frequenc-96 | 3 | SIT-2773 | Legacy Model |
| 1003 | RAD-2344 | pilot-radar-68 | legacy-frequenc-97 | 4 | SIT-2774 | Regional Cluster |

This view joins `radar_stations` to `sites_stations` and then to `surveillance_sites`, producing a flat record that pairs each radar station with its host site. It answers: *Which surveillance site hosts which radar station?* A row might show radar station `RAD-2323` (adaptive-radar-65) hosted at site `SIT-2771` (Composite Review), providing a hardware-centric site inventory.

**View `v_radar_station_data_acquisition_unit`**

```sql
CREATE VIEW v_radar_station_data_acquisition_unit AS
SELECT a.radar_station_id, a.radar_identifier, a.radar_model, a.frequency_band, b.id AS unit_id, b.acquisition_unit_id AS unit_acquisition_unit_id, b.firmware_version AS unit_firmware_version
FROM radar_stations a JOIN data_acquisition_units b ON a.data_acquisition_unit_id = b.id;
```

| radar_station_id | radar_identifier | radar_model | frequency_band | unit_id | unit_acquisition_unit_id | unit_firmware_version |
|---|---|---|---|---|---|---|
| 1000 | RAD-2323 | adaptive-radar-65 | integrated-frequenc-94 | 1000 | 2106717 | distributed-firmware-48 |
| 1001 | RAD-2330 | distributed-radar-66 | seasonal-frequenc-95 | 1001 | state_uk_16 | baseline-firmware-49 |
| 1002 | RAD-2337 | baseline-radar-67 | regional-frequenc-96 | 1002 | 1450653 | pilot-firmware-50 |
| 1003 | RAD-2344 | pilot-radar-68 | legacy-frequenc-97 | 1003 | 6926350 | extended-firmware-51 |

This view joins `radar_stations` to `data_acquisition_units` (via the `radar_station_id` foreign key), producing a flat record that pairs each radar station with its DAU. It answers: *Which data acquisition unit serves which radar station?* A row might show radar station `RAD-2323` served by DAU `2106717` (firmware `distributed-firmware-48`), enabling hardware pairing verification.

**View `v_radar_station_control_centre_detail`**

```sql
CREATE VIEW v_radar_station_control_centre_detail AS
SELECT a.radar_station_id, a.radar_identifier, a.radar_model, b.id AS centre_id, b.centre_identifier AS centre_centre_identifier, b.centre_name AS centre_centre_name
FROM radar_stations a
  JOIN stations_centres j ON j.radar_station_id = a.radar_station_id
  JOIN control_centres b ON b.id = j.control_centre_id;
```

| radar_station_id | radar_identifier | radar_model | centre_id | centre_centre_identifier | centre_centre_name |
|---|---|---|---|---|---|
| 1000 | RAD-2323 | adaptive-radar-65 | 1000 | CEN-2480 | Regional Cluster |
| 1000 | RAD-2323 | adaptive-radar-65 | 1001 | CEN-2487 | Seasonal Review D |
| 1001 | RAD-2330 | distributed-radar-66 | 1001 | CEN-2487 | Seasonal Review D |
| 1001 | RAD-2330 | distributed-radar-66 | 1002 | CEN-2494 | Integrated Initiative |
| 1002 | RAD-2337 | baseline-radar-67 | 1002 | CEN-2494 | Integrated Initiative |
| 1002 | RAD-2337 | baseline-radar-67 | 1003 | CEN-2501 | Extended Model |
| 1003 | RAD-2344 | pilot-radar-68 | 1003 | CEN-2501 | Extended Model |
| 1003 | RAD-2344 | pilot-radar-68 | 1000 | CEN-2480 | Regional Cluster |

This view joins `radar_stations` to `stations_centres` and then to `control_centres`, producing a flat record that pairs each radar station with its managing centre. It answers: *Which control centre manages which radar station?* A row might show radar station `RAD-2323` managed by centre `CEN-2480`, providing a radar-centric administrative view.

**View `v_data_acquisition_unit_radar_station`**

```sql
CREATE VIEW v_data_acquisition_unit_radar_station AS
SELECT a.id, a.acquisition_unit_id, a.firmware_version, a.sampling_rate, b.radar_station_id AS station_radar_station_id, b.radar_identifier AS station_radar_identifier, b.radar_model AS station_radar_model
FROM data_acquisition_units a JOIN radar_stations b ON a.radar_station_id = b.radar_station_id;
```

| id | acquisition_unit_id | firmware_version | sampling_rate | station_radar_station_id | station_radar_identifier | station_radar_model |
|---|---|---|---|---|---|---|
| 1000 | 2106717 | distributed-firmware-48 | 18.45 | 1000 | RAD-2323 | adaptive-radar-65 |
| 1001 | state_uk_16 | baseline-firmware-49 | 22.90 | 1001 | RAD-2330 | distributed-radar-66 |
| 1002 | 1450653 | pilot-firmware-50 | 27.35 | 1002 | RAD-2337 | baseline-radar-67 |
| 1003 | 6926350 | extended-firmware-51 | 31.80 | 1003 | RAD-2344 | pilot-radar-68 |

This view joins `data_acquisition_units` to `radar_stations` (via the `radar_station_id` foreign key), producing a flat record that pairs each DAU with its radar station. It answers: *Which radar station is served by which data acquisition unit?* A row might show DAU `2106717` (firmware `distributed-firmware-48`) serving radar station `RAD-2323`, enabling firmware-to-hardware traceability.

**View `v_data_acquisition_unit_network_link_detail`**

```sql
CREATE VIEW v_data_acquisition_unit_network_link_detail AS
SELECT a.id, a.acquisition_unit_id, a.firmware_version, b.id AS link_id, b.link_identifier AS link_link_identifier, b.link_type AS link_link_type
FROM data_acquisition_units a
  JOIN units_links j ON j.data_acquisition_unit_id = a.id
  JOIN network_links b ON b.id = j.network_link_id;
```

| id | acquisition_unit_id | firmware_version | link_id | link_link_identifier | link_link_type |
|---|---|---|---|---|---|
| 1000 | 2106717 | distributed-firmware-48 | 1 | https://www.robertchristgau.com/get_album.php?id=4445 | leased_line |
| 1000 | 2106717 | distributed-firmware-48 | 2 | https://bugs.launchpad.net/murano/+bug/1287690 | surveillance_network |
| 1001 | state_uk_16 | baseline-firmware-49 | 2 | https://bugs.launchpad.net/murano/+bug/1287690 | surveillance_network |
| 1001 | state_uk_16 | baseline-firmware-49 | 3 | http://hdl.handle.net/10419/142700 | satellite |
| 1002 | 1450653 | pilot-firmware-50 | 3 | http://hdl.handle.net/10419/142700 | satellite |
| 1002 | 1450653 | pilot-firmware-50 | 4 | https://www.nature.com/articles/nphys3742 | leased_line |
| 1003 | 6926350 | extended-firmware-51 | 4 | https://www.nature.com/articles/nphys3742 | leased_line |
| 1003 | 6926350 | extended-firmware-51 | 1 | https://www.robertchristgau.com/get_album.php?id=4445 | leased_line |

This view joins `data_acquisition_units` to `units_links` and then to `network_links`, producing a flat record that pairs each DAU with its network links. It answers: *Which network links are used by which data acquisition unit?* A row might show DAU `2106717` using a specific network link, enabling data path analysis.

**View `v_data_acquisition_unit_processing_server_detail`**

```sql
CREATE VIEW v_data_acquisition_unit_processing_server_detail AS
SELECT a.id, a.acquisition_unit_id, a.firmware_version, b.id AS server_id, b.server_id AS server_server_id, b.server_role AS server_server_role
FROM data_acquisition_units a
  JOIN units_servers j ON j.data_acquisition_unit_id = a.id
  JOIN processing_servers b ON b.id = j.processing_server_id;
```

| id | acquisition_unit_id | firmware_version | server_id | server_server_id | server_server_role |
|---|---|---|---|---|---|
| 1000 | 2106717 | distributed-firmware-48 | 1 | 911352d5dab64576b7a6da51aa69d76d | primary |
| 1000 | 2106717 | distributed-firmware-48 | 2 | 1450637 | redundant |
| 1001 | state_uk_16 | baseline-firmware-49 | 2 | 1450637 | redundant |
| 1001 | state_uk_16 | baseline-firmware-49 | 3 | 4985152 | backup |
| 1002 | 1450653 | pilot-firmware-50 | 3 | 4985152 | backup |
| 1002 | 1450653 | pilot-firmware-50 | 4 | 9736887 | primary |
| 1003 | 6926350 | extended-firmware-51 | 4 | 9736887 | primary |
| 1003 | 6926350 | extended-firmware-51 | 1 | 911352d5dab64576b7a6da51aa69d76d | primary |

This view joins `data_acquisition_units` to `units_servers` and then to `processing_servers`, producing a flat record that pairs each DAU with its processing server. It answers: *Which processing server receives data from which data acquisition unit?* A row might show DAU `2106717` feeding into a specific processing server, enabling end-to-end data flow tracing.

**View `v_network_link_surveillance_site`**

```sql
CREATE VIEW v_network_link_surveillance_site AS
SELECT a.id, a.link_identifier, a.link_type, a.bandwidth, b.surveillance_site_id AS site_surveillance_site_id, b.site_identifier AS site_site_identifier, b.site_name AS site_site_name
FROM network_links a JOIN surveillance_sites b ON a.surveillance_site_id = b.surveillance_site_id;
```

| id | link_identifier | link_type | bandwidth | site_surveillance_site_id | site_site_identifier | site_site_name |
|---|---|---|---|---|---|---|
| 1 | https://www.robertchristgau.com/get_album.php?id=4445 | leased_line | 20.20 | 1 | SIT-2771 | Composite Review |
| 2 | https://bugs.launchpad.net/murano/+bug/1287690 | surveillance_network | 23.40 | 2 | SIT-2772 | Compact Initiative A |
| 3 | http://hdl.handle.net/10419/142700 | satellite | 26.60 | 3 | SIT-2773 | Legacy Model |
| 4 | https://www.nature.com/articles/nphys3742 | leased_line | 29.80 | 4 | SIT-2774 | Regional Cluster |

This view joins `network_links` to `sites_links` and then to `surveillance_sites`, producing a flat record that pairs each network link with its surveillance site endpoint. It answers: *Which surveillance site is connected via which network link?* A row might show link `1` (a `leased_line`) connecting to site `SIT-2771` (Composite Review), providing a network-centric site connectivity view.

**View `v_network_link_control_centre`**

```sql
CREATE VIEW v_network_link_control_centre AS
SELECT a.id, a.link_identifier, a.link_type, a.bandwidth, b.id AS centre_id, b.centre_identifier AS centre_centre_identifier, b.centre_name AS centre_centre_name
FROM network_links a JOIN control_centres b ON a.control_centre_id = b.id;
```

| id | link_identifier | link_type | bandwidth | centre_id | centre_centre_identifier | centre_centre_name |
|---|---|---|---|---|---|---|
| 1 | https://www.robertchristgau.com/get_album.php?id=4445 | leased_line | 20.20 | 1000 | CEN-2480 | Regional Cluster |
| 2 | https://bugs.launchpad.net/murano/+bug/1287690 | surveillance_network | 23.40 | 1001 | CEN-2487 | Seasonal Review D |
| 3 | http://hdl.handle.net/10419/142700 | satellite | 26.60 | 1002 | CEN-2494 | Integrated Initiative |
| 4 | https://www.nature.com/articles/nphys3742 | leased_line | 29.80 | 1003 | CEN-2501 | Extended Model |

This view joins `network_links` to `centres_links` and then to `control_centres`, producing a flat record that pairs each network link with its control centre endpoint. It answers: *Which control centre is connected via which network link?* A row might show link `1` connecting to centre `CEN-2480` (Regional Cluster), enabling network topology analysis from the link perspective.

**View `v_network_link_data_acquisition_unit_detail`**

```sql
CREATE VIEW v_network_link_data_acquisition_unit_detail AS
SELECT a.id, a.link_identifier, a.link_type, b.id AS unit_id, b.acquisition_unit_id AS unit_acquisition_unit_id, b.firmware_version AS unit_firmware_version
FROM network_links a
  JOIN links_units j ON j.network_link_id = a.id
  JOIN data_acquisition_units b ON b.id = j.data_acquisition_unit_id;
```

| id | link_identifier | link_type | unit_id | unit_acquisition_unit_id | unit_firmware_version |
|---|---|---|---|---|---|
| 1 | https://www.robertchristgau.com/get_album.php?id=4445 | leased_line | 1000 | 2106717 | distributed-firmware-48 |
| 1 | https://www.robertchristgau.com/get_album.php?id=4445 | leased_line | 1001 | state_uk_16 | baseline-firmware-49 |
| 2 | https://bugs.launchpad.net/murano/+bug/1287690 | surveillance_network | 1001 | state_uk_16 | baseline-firmware-49 |
| 2 | https://bugs.launchpad.net/murano/+bug/1287690 | surveillance_network | 1002 | 1450653 | pilot-firmware-50 |
| 3 | http://hdl.handle.net/10419/142700 | satellite | 1002 | 1450653 | pilot-firmware-50 |
| 3 | http://hdl.handle.net/10419/142700 | satellite | 1003 | 6926350 | extended-firmware-51 |
| 4 | https://www.nature.com/articles/nphys3742 | leased_line | 1003 | 6926350 | extended-firmware-51 |
| 4 | https://www.nature.com/articles/nphys3742 | leased_line | 1000 | 2106717 | distributed-firmware-48 |

This view joins `network_links` to `links_units` and then to `data_acquisition_units`, producing a flat record that pairs each network link with its DAU endpoint. It answers: *Which data acquisition unit uses which network link?* A row might show link `1` used by DAU `2106717`, enabling data path and bandwidth allocation analysis.

**View `v_monitoring_event_surveillance_site`**

```sql
CREATE VIEW v_monitoring_event_surveillance_site AS
SELECT a.id, a.event_id, a.event_timestamp, a.event_type, b.surveillance_site_id AS site_surveillance_site_id, b.site_identifier AS site_site_identifier, b.site_name AS site_site_name
FROM monitoring_events a JOIN surveillance_sites b ON a.surveillance_site_id = b.surveillance_site_id;
```

| id | event_id | event_timestamp | event_type | site_surveillance_site_id | site_site_identifier | site_site_name |
|---|---|---|---|---|---|---|
| 1 | 2002007020060 | 2025-04-17T15:57:00 | fault | 1 | SIT-2771 | Composite Review |
| 2 | 168535 | 2022-09-01T22:14:00 | warning | 2 | SIT-2772 | Compact Initiative A |
| 3 | ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 | 2023-02-12T05:31:00 | status_change | 3 | SIT-2773 | Legacy Model |
| 4 | 1186089 | 2024-07-23T12:48:00 | maintenance | 4 | SIT-2774 | Regional Cluster |

This view joins `monitoring_events` to `surveillance_sites` (via the `surveillance_site_id` foreign key), producing a flat record that pairs each event with its affected site. It answers: *Which surveillance site experienced which monitoring event?* A row might show event `2002007020060` (a `critical` fault) at site `SIT-2771` (Composite Review), enabling site-level incident tracking.

**View `v_monitoring_event_radar_station_detail`**

```sql
CREATE VIEW v_monitoring_event_radar_station_detail AS
SELECT a.id, a.event_id, a.event_timestamp, b.radar_station_id AS station_radar_station_id, b.radar_identifier AS station_radar_identifier, b.radar_model AS station_radar_model
FROM monitoring_events a
  JOIN events_stations j ON j.monitoring_event_id = a.id
  JOIN radar_stations b ON b.radar_station_id = j.radar_station_id;
```

| id | event_id | event_timestamp | station_radar_station_id | station_radar_identifier | station_radar_model |
|---|---|---|---|---|---|
| 1 | 2002007020060 | 2025-04-17T15:57:00 | 1000 | RAD-2323 | adaptive-radar-65 |
| 1 | 2002007020060 | 2025-04-17T15:57:00 | 1001 | RAD-2330 | distributed-radar-66 |
| 2 | 168535 | 2022-09-01T22:14:00 | 1001 | RAD-2330 | distributed-radar-66 |
| 2 | 168535 | 2022-09-01T22:14:00 | 1002 | RAD-2337 | baseline-radar-67 |
| 3 | ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 | 2023-02-12T05:31:00 | 1002 | RAD-2337 | baseline-radar-67 |
| 3 | ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 | 2023-02-12T05:31:00 | 1003 | RAD-2344 | pilot-radar-68 |
| 4 | 1186089 | 2024-07-23T12:48:00 | 1003 | RAD-2344 | pilot-radar-68 |
| 4 | 1186089 | 2024-07-23T12:48:00 | 1000 | RAD-2323 | adaptive-radar-65 |

This view joins `monitoring_events` to `events_stations` and then to `radar_stations`, producing a flat record that pairs each event with its implicated radar station. It answers: *Which radar station is associated with which monitoring event?* A row might show event `2002007020060` linked to radar station `RAD-2323`, enabling hardware-level incident attribution.

**View `v_monitoring_event_data_acquisition_unit_detail`**

```sql
CREATE VIEW v_monitoring_event_data_acquisition_unit_detail AS
SELECT a.id, a.event_id, a.event_timestamp, b.id AS unit_id, b.acquisition_unit_id AS unit_acquisition_unit_id, b.firmware_version AS unit_firmware_version
FROM monitoring_events a
  JOIN events_units j ON j.monitoring_event_id = a.id
  JOIN data_acquisition_units b ON b.id = j.data_acquisition_unit_id;
```

| id | event_id | event_timestamp | unit_id | unit_acquisition_unit_id | unit_firmware_version |
|---|---|---|---|---|---|
| 1 | 2002007020060 | 2025-04-17T15:57:00 | 1000 | 2106717 | distributed-firmware-48 |
| 1 | 2002007020060 | 2025-04-17T15:57:00 | 1001 | state_uk_16 | baseline-firmware-49 |
| 2 | 168535 | 2022-09-01T22:14:00 | 1001 | state_uk_16 | baseline-firmware-49 |
| 2 | 168535 | 2022-09-01T22:14:00 | 1002 | 1450653 | pilot-firmware-50 |
| 3 | ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 | 2023-02-12T05:31:00 | 1002 | 1450653 | pilot-firmware-50 |
| 3 | ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 | 2023-02-12T05:31:00 | 1003 | 6926350 | extended-firmware-51 |
| 4 | 1186089 | 2024-07-23T12:48:00 | 1003 | 6926350 | extended-firmware-51 |
| 4 | 1186089 | 2024-07-23T12:48:00 | 1000 | 2106717 | distributed-firmware-48 |

This view joins `monitoring_events` to `events_units` and then to `data_acquisition_units`, producing a flat record that pairs each event with its implicated DAU. It answers: *Which data acquisition unit is associated with which monitoring event?* A row might show event `2002007020060` linked to DAU `2106717`, enabling firmware-level incident attribution.

**View `v_monitoring_event_control_centre_detail`**

```sql
CREATE VIEW v_monitoring_event_control_centre_detail AS
SELECT a.id, a.event_id, a.event_timestamp, b.id AS centre_id, b.centre_identifier AS centre_centre_identifier, b.centre_name AS centre_centre_name
FROM monitoring_events a
  JOIN events_centres j ON j.monitoring_event_id = a.id
  JOIN control_centres b ON b.id = j.control_centre_id;
```

| id | event_id | event_timestamp | centre_id | centre_centre_identifier | centre_centre_name |
|---|---|---|---|---|---|
| 1 | 2002007020060 | 2025-04-17T15:57:00 | 1000 | CEN-2480 | Regional Cluster |
| 1 | 2002007020060 | 2025-04-17T15:57:00 | 1001 | CEN-2487 | Seasonal Review D |
| 2 | 168535 | 2022-09-01T22:14:00 | 1001 | CEN-2487 | Seasonal Review D |
| 2 | 168535 | 2022-09-01T22:14:00 | 1002 | CEN-2494 | Integrated Initiative |
| 3 | ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 | 2023-02-12T05:31:00 | 1002 | CEN-2494 | Integrated Initiative |
| 3 | ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 | 2023-02-12T05:31:00 | 1003 | CEN-2501 | Extended Model |
| 4 | 1186089 | 2024-07-23T12:48:00 | 1003 | CEN-2501 | Extended Model |
| 4 | 1186089 | 2024-07-23T12:48:00 | 1000 | CEN-2480 | Regional Cluster |

This view joins `monitoring_events` to `events_centres` and then to `control_centres`, producing a flat record that pairs each event with its managing centre. It answers: *Which control centre is responsible for which monitoring event?* A row might show event `2002007020060` managed by centre `CEN-2480`, enabling centre-level incident management tracking.

**View `v_processing_server_control_centre`**

```sql
CREATE VIEW v_processing_server_control_centre AS
SELECT a.id, a.server_id, a.server_role, a.os_version, b.id AS centre_id, b.centre_identifier AS centre_centre_identifier, b.centre_name AS centre_centre_name
FROM processing_servers a JOIN control_centres b ON a.control_centre_id = b.id;
```

| id | server_id | server_role | os_version | centre_id | centre_centre_identifier | centre_centre_name |
|---|---|---|---|---|---|---|
| 1 | 911352d5dab64576b7a6da51aa69d76d | primary | integrated-os-46 | 1000 | CEN-2480 | Regional Cluster |
| 2 | 1450637 | redundant | seasonal-os-47 | 1001 | CEN-2487 | Seasonal Review D |
| 3 | 4985152 | backup | regional-os-48 | 1002 | CEN-2494 | Integrated Initiative |
| 4 | 9736887 | primary | legacy-os-49 | 1003 | CEN-2501 | Extended Model |

This view joins `processing_servers` to `servers_units`, `units_links`, `network_links`, `centres_links`, and `control_centres` (or through an equivalent path), producing a flat record that pairs each processing server with its associated control centre. It answers: *Which control centre is associated with which processing server?* A row might show a specific processing server linked to centre `CEN-2480`, enabling compute-resource-to-administrative-boundary mapping.

**View `v_processing_server_data_acquisition_unit_detail`**

```sql
CREATE VIEW v_processing_server_data_acquisition_unit_detail AS
SELECT a.id, a.server_id, a.server_role, b.id AS unit_id, b.acquisition_unit_id AS unit_acquisition_unit_id, b.firmware_version AS unit_firmware_version
FROM processing_servers a
  JOIN servers_units j ON j.processing_server_id = a.id
  JOIN data_acquisition_units b ON b.id = j.data_acquisition_unit_id;
```

| id | server_id | server_role | unit_id | unit_acquisition_unit_id | unit_firmware_version |
|---|---|---|---|---|---|
| 1 | 911352d5dab64576b7a6da51aa69d76d | primary | 1000 | 2106717 | distributed-firmware-48 |
| 1 | 911352d5dab64576b7a6da51aa69d76d | primary | 1001 | state_uk_16 | baseline-firmware-49 |
| 2 | 1450637 | redundant | 1001 | state_uk_16 | baseline-firmware-49 |
| 2 | 1450637 | redundant | 1002 | 1450653 | pilot-firmware-50 |
| 3 | 4985152 | backup | 1002 | 1450653 | pilot-firmware-50 |
| 3 | 4985152 | backup | 1003 | 6926350 | extended-firmware-51 |
| 4 | 9736887 | primary | 1003 | 6926350 | extended-firmware-51 |
| 4 | 9736887 | primary | 1000 | 2106717 | distributed-firmware-48 |

This view joins `processing_servers` to `servers_units` and then to `data_acquisition_units`, producing a flat record that pairs each processing server with its feeding DAUs. It answers: *Which data acquisition units feed data to which processing server?* A row might show a specific processing server receiving data from DAU `2106717`, enabling data pipeline capacity planning.

**View `v_processing_server_monitoring_application_detail`**

```sql
CREATE VIEW v_processing_server_monitoring_application_detail AS
SELECT a.id, a.server_id, a.server_role, b.monitoring_application_id AS application_monitoring_application_id, b.app_id AS application_app_id, b.app_name AS application_app_name
FROM processing_servers a
  JOIN servers_applications j ON j.processing_server_id = a.id
  JOIN monitoring_applications b ON b.monitoring_application_id = j.monitoring_application_id;
```

| id | server_id | server_role | application_monitoring_application_id | application_app_id | application_app_name |
|---|---|---|---|---|---|
| 1 | 911352d5dab64576b7a6da51aa69d76d | primary | 100 | d6267a5e-8fc1-11eb-924d-9cd76263cbd0 | Pilot Cluster |
| 1 | 911352d5dab64576b7a6da51aa69d76d | primary | 101 | 4463647 | Baseline Review |
| 2 | 1450637 | redundant | 101 | 4463647 | Baseline Review |
| 2 | 1450637 | redundant | 102 | ceffd6ca-8fd1-11eb-924d-9cd76263cbd0 | Distributed Initiative A |
| 3 | 4985152 | backup | 102 | ceffd6ca-8fd1-11eb-924d-9cd76263cbd0 | Distributed Initiative A |
| 3 | 4985152 | backup | 103 | 89820 | Adaptive Model |
| 4 | 9736887 | primary | 103 | 89820 | Adaptive Model |
| 4 | 9736887 | primary | 100 | d6267a5e-8fc1-11eb-924d-9cd76263cbd0 | Pilot Cluster |

This view joins `processing_servers` to `servers_applications` and then to `monitoring_applications`, producing a flat record that pairs each processing server with its hosted applications. It answers: *Which monitoring applications run on which processing server?* A row might show a specific processing server hosting a monitoring application, enabling software deployment auditing.

**View `v_monitoring_application_processing_server_detail`**

```sql
CREATE VIEW v_monitoring_application_processing_server_detail AS
SELECT a.monitoring_application_id, a.app_id, a.app_name, b.id AS server_id, b.server_id AS server_server_id, b.server_role AS server_server_role
FROM monitoring_applications a
  JOIN applications_servers j ON j.monitoring_application_id = a.monitoring_application_id
  JOIN processing_servers b ON b.id = j.processing_server_id;
```

| monitoring_application_id | app_id | app_name | server_id | server_server_id | server_server_role |
|---|---|---|---|---|---|
| 100 | d6267a5e-8fc1-11eb-924d-9cd76263cbd0 | Pilot Cluster | 1 | 911352d5dab64576b7a6da51aa69d76d | primary |
| 100 | d6267a5e-8fc1-11eb-924d-9cd76263cbd0 | Pilot Cluster | 2 | 1450637 | redundant |
| 101 | 4463647 | Baseline Review | 2 | 1450637 | redundant |
| 101 | 4463647 | Baseline Review | 3 | 4985152 | backup |
| 102 | ceffd6ca-8fd1-11eb-924d-9cd76263cbd0 | Distributed Initiative A | 3 | 4985152 | backup |
| 102 | ceffd6ca-8fd1-11eb-924d-9cd76263cbd0 | Distributed Initiative A | 4 | 9736887 | primary |
| 103 | 89820 | Adaptive Model | 4 | 9736887 | primary |
| 103 | 89820 | Adaptive Model | 1 | 911352d5dab64576b7a6da51aa69d76d | primary |

This view joins `monitoring_applications` to `applications_servers` and then to `processing_servers`, producing a flat record that pairs each application with its hosting servers. It answers: *Which processing servers host which monitoring application?* A row might show a specific monitoring application running on a specific processing server, enabling application-level infrastructure mapping.

**View `v_monitoring_application_control_centre`**

```sql
CREATE VIEW v_monitoring_application_control_centre AS
SELECT a.monitoring_application_id, a.app_id, a.app_name, a.version, b.id AS centre_id, b.centre_identifier AS centre_centre_identifier, b.centre_name AS centre_centre_name
FROM monitoring_applications a JOIN control_centres b ON a.control_centre_id = b.id;
```

| monitoring_application_id | app_id | app_name | version | centre_id | centre_centre_identifier | centre_centre_name |
|---|---|---|---|---|---|---|
| 100 | d6267a5e-8fc1-11eb-924d-9cd76263cbd0 | Pilot Cluster | seasonal-version-71 | 1000 | CEN-2480 | Regional Cluster |
| 101 | 4463647 | Baseline Review | regional-version-72 | 1001 | CEN-2487 | Seasonal Review D |
| 102 | ceffd6ca-8fd1-11eb-924d-9cd76263cbd0 | Distributed Initiative A | legacy-version-73 | 1002 | CEN-2494 | Integrated Initiative |
| 103 | 89820 | Adaptive Model | compact-version-74 | 1003 | CEN-2501 | Extended Model |

This view joins `monitoring_applications` to `centres_applications` and then to `control_centres`, producing a flat record that pairs each application with its managing centre. It answers: *Which control centre deploys which monitoring application?* A row might show a specific monitoring application deployed at centre `CEN-2480`, enabling software governance tracking.

**View `v_monitoring_application_surveillance_site_detail`**

```sql
CREATE VIEW v_monitoring_application_surveillance_site_detail AS
SELECT a.monitoring_application_id, a.app_id, a.app_name, b.surveillance_site_id AS site_surveillance_site_id, b.site_identifier AS site_site_identifier, b.site_name AS site_site_name
FROM monitoring_applications a
  JOIN applications_sites j ON j.monitoring_application_id = a.monitoring_application_id
  JOIN surveillance_sites b ON b.surveillance_site_id = j.surveillance_site_id;
```

| monitoring_application_id | app_id | app_name | site_surveillance_site_id | site_site_identifier | site_site_name |
|---|---|---|---|---|---|
| 100 | d6267a5e-8fc1-11eb-924d-9cd76263cbd0 | Pilot Cluster | 1 | SIT-2771 | Composite Review |
| 100 | d6267a5e-8fc1-11eb-924d-9cd76263cbd0 | Pilot Cluster | 2 | SIT-2772 | Compact Initiative A |
| 101 | 4463647 | Baseline Review | 2 | SIT-2772 | Compact Initiative A |
| 101 | 4463647 | Baseline Review | 3 | SIT-2773 | Legacy Model |
| 102 | ceffd6ca-8fd1-11eb-924d-9cd76263cbd0 | Distributed Initiative A | 3 | SIT-2773 | Legacy Model |
| 102 | ceffd6ca-8fd1-11eb-924d-9cd76263cbd0 | Distributed Initiative A | 4 | SIT-2774 | Regional Cluster |
| 103 | 89820 | Adaptive Model | 4 | SIT-2774 | Regional Cluster |
| 103 | 89820 | Adaptive Model | 1 | SIT-2771 | Composite Review |

This view joins `monitoring_applications` to `applications_sites` and then to `surveillance_sites`, producing a flat record that pairs each application with its deployed sites. It answers: *Which surveillance sites run which monitoring application?* A row might show a specific monitoring application deployed at site `SIT-2771` (Composite Review), enabling site-level software inventory.

The schema design follows a clear ontology-driven pattern: base tables model domain entities with their intrinsic attributes, junction tables resolve many-to-many relationships by pairing foreign keys, and views denormalize selected paths through the graph to answer specific analytical questions. The surveillance infrastructure domain is thus represented as a bipartite and multipartite graph of entities, where the relational schema provides a sound, closed-world materialization of the open-world ontology. Each view acts as a projection of this graph onto a two-hop neighbourhood, reconstructing a domain fact from the normalized tables in a single query. This separation of concerns—persistent storage in base and junction tables, analytical access through views—ensures that the schema remains maintainable as the domain evolves, while the views provide stable interfaces for reporting and monitoring dashboards.