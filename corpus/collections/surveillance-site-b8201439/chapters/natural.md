## The Surveillance and Radar Monitoring Domain

A modern surveillance infrastructure spans physical sites, processing facilities, and the communication fabric that binds them into a coherent operational network. At the edge of this system sit surveillance sites—georeferenced installations that collect raw observations and relay them inward. Each site carries a unique identifier, a human-readable name, geographic coordinates, a type classification, and an operational status that reflects its current readiness. The site at identifier SIT-2771, named Composite Review, sits at latitude 13.95 and longitude 21.20 and operates as a radar-type installation with an online status since its deployment on 2023-02-14. By contrast, SIT-2772 (Compact Initiative A) is a sensor-type site currently offline, while SIT-2773 (Legacy Model) is in maintenance and SIT-2774 (Regional Cluster) has been decommissioned entirely.

**Table `surveillance_sites`**

| surveillance_site_id | site_identifier | site_name | latitude | longitude | site_type | operational_status | deployment_date |
|---|---|---|---|---|---|---|---|
| 1 | SIT-2771 | Composite Review | 13.95 | 21.20 | radar | online | 2023-02-14 |
| 2 | SIT-2772 | Compact Initiative A | 17.90 | 25.40 | sensor | offline | 2024-07-25 |
| 3 | SIT-2773 | Legacy Model | 21.85 | 29.60 | mixed | maintenance | 2025-12-09 |
| 4 | SIT-2774 | Regional Cluster | 25.80 | 33.80 | radar | decommissioned | 2022-05-20 |

Data flows from these edge sites into control centres, which serve as the administrative and analytical hubs of the network. A control centre is defined by its identifier, name, jurisdiction, type (fixed, deployable, or mobile), establishment date, and a flag indicating whether it is the primary centre for its jurisdiction. The centre CEN-2480, named Regional Cluster, is a fixed facility under the jurisdiction regional-jurisdic-30, established on 2024-03-27 and designated as primary. CEN-2487 (Seasonal Review D) is a deployable centre under legacy-jurisdic-31, while CEN-2494 (Integrated Initiative) is a mobile primary centre under compact-jurisdic-32. The centre CEN-2501 (Extended Model) is a non-primary fixed installation under composite-jurisdic-33.

**Table `control_centres`**

| id | centre_identifier | centre_name | jurisdiction | centre_type | established_date | is_primary |
|---|---|---|---|---|---|---|
| 1000 | CEN-2480 | Regional Cluster | regional-jurisdic-30 | fixed | 2024-03-27 | true |
| 1001 | CEN-2487 | Seasonal Review D | legacy-jurisdic-31 | deployable | 2025-08-11 | false |
| 1002 | CEN-2494 | Integrated Initiative | compact-jurisdic-32 | mobile | 2022-01-22 | true |
| 1003 | CEN-2501 | Extended Model | composite-jurisdic-33 | fixed | 2023-06-06 | false |

Radar stations represent the specialised hardware deployed at or near surveillance sites. Each radar station carries an identifier, a model designation, a frequency band, a maximum detection range, installation and maintenance dates, an upgrade flag, and foreign-key references to the surveillance site and data acquisition unit it is associated with. The station RAD-2323 (adaptive-radar-65) operates on the integrated-frequenc-94 band with a maximum range of 2.70 km, was installed on 2022-01-10, and is linked to surveillance site 1 and data acquisition unit 1000. RAD-2330 (distributed-radar-66) is an upgraded unit on the seasonal-frequenc-95 band with a 5.40 km range, associated with site 2 and unit 1001. RAD-2337 (baseline-radar-67) and RAD-2344 (pilot-radar-68) extend the range to 8.10 and 10.80 km respectively, each tied to their own sites and units.

**Table `radar_stations`**

| radar_station_id | radar_identifier | radar_model | frequency_band | max_range | installation_date | last_maintenance_date | is_upgraded | surveillance_site_id | data_acquisition_unit_id |
|---|---|---|---|---|---|---|---|---|---|
| 1000 | RAD-2323 | adaptive-radar-65 | integrated-frequenc-94 | 2.70 | 2022-01-10 | 2024-03-27 | false | 1 | 1000 |
| 1001 | RAD-2330 | distributed-radar-66 | seasonal-frequenc-95 | 5.40 | 2023-06-21 | 2025-08-11 | true | 2 | 1001 |
| 1002 | RAD-2337 | baseline-radar-67 | regional-frequenc-96 | 8.10 | 2024-11-05 | 2022-01-22 | false | 3 | 1002 |
| 1003 | RAD-2344 | pilot-radar-68 | legacy-frequenc-97 | 10.80 | 2025-04-16 | 2023-06-06 | true | 4 | 1003 |

Data acquisition units (DAUs) sit between radar stations and the broader network, responsible for sampling, formatting, and forwarding raw sensor data. Each DAU has a firmware version, a sampling rate, a data format designation, a status (active, standby, or fault), a last synchronization timestamp, and a reference to its parent radar station. DAU 1000 runs distributed-firmware-48 at a sampling rate of 18.45, outputs primary-data-16 format, and is active with its last sync on 2022-05-25T16:48:00. DAU 1001 (baseline-firmware-49) operates at 22.90 sampling rate in standby mode, while DAU 1002 (pilot-firmware-50) is in fault status at 27.35 sampling rate. DAU 1003 (extended-firmware-51) is active at 31.80 sampling rate with baseline-data-19 output.

**Table `data_acquisition_units`**

| id | acquisition_unit_id | firmware_version | sampling_rate | data_format | status | last_sync_timestamp | radar_station_id |
|---|---|---|---|---|---|---|---|
| 1000 | 2106717 | distributed-firmware-48 | 18.45 | primary-data-16 | active | 2022-05-25T16:48:00 | 1000 |
| 1001 | state_uk_16 | baseline-firmware-49 | 22.90 | adaptive-data-17 | standby | 2023-10-09T23:05:00 | 1001 |
| 1002 | 1450653 | pilot-firmware-50 | 27.35 | distributed-data-18 | fault | 2024-03-20T06:22:00 | 1002 |
| 1003 | 6926350 | extended-firmware-51 | 31.80 | baseline-data-19 | active | 2025-08-04T13:39:00 | 1003 |

Network links provide the communication pathways between surveillance sites and control centres. Each link has an identifier (often a URL), a type (leased_line, surveillance_network, or satellite), bandwidth and latency measurements, a redundancy flag, a protocol designation, and foreign keys to the originating surveillance site and destination control centre. Link 1 connects site 1 to centre 1000 via a leased_line with 20.20 bandwidth and 13.45 latency, marked as redundant and using seasonal-protocol-11. Link 2 (surveillance_network, 23.40 bandwidth, 17.90 latency) connects site 2 to centre 1001. Link 3 (satellite, 26.60 bandwidth, 22.35 latency) links site 3 to centre 1002 and is redundant. Link 4 (leased_line, 29.80 bandwidth, 26.80 latency) connects site 4 to centre 1003.

**Table `network_links`**

| id | link_identifier | link_type | bandwidth | latency | is_redundant | protocol | surveillance_site_id | control_centre_id |
|---|---|---|---|---|---|---|---|---|
| 1 | https://www.robertchristgau.com/get_album.php?id=4445 | leased_line | 20.20 | 13.45 | true | seasonal-protocol-11 | 1 | 1000 |
| 2 | https://bugs.launchpad.net/murano/+bug/1287690 | surveillance_network | 23.40 | 17.90 | false | regional-protocol-12 | 2 | 1001 |
| 3 | http://hdl.handle.net/10419/142700 | satellite | 26.60 | 22.35 | true | legacy-protocol-13 | 3 | 1002 |
| 4 | https://www.nature.com/articles/nphys3742 | leased_line | 29.80 | 26.80 | false | compact-protocol-14 | 4 | 1003 |

Monitoring events capture incidents, status changes, and maintenance activities across the infrastructure. Each event has a unique event ID, a timestamp, a type (fault, warning, status_change, or maintenance), a severity level (critical, high, medium, low), a description, a resolution flag, a resolution timestamp, and a reference to the surveillance site where the event occurred. Event 2002007020060 is a critical fault at site 1 on 2025-04-17, described as "Extended Survey," and was resolved on 2024-11-10T10:30:00. Event 168535 is a high-severity warning at site 2 ("Pilot Corridor A") that remains unresolved. Event ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 is a medium-severity status change at site 3 ("Baseline Series") that was resolved. Event 1186089 is a low-severity maintenance event at site 4 ("Distributed Assessment") that is still open.

**Table `monitoring_events`**

| id | event_id | event_timestamp | event_type | severity | description | resolved | resolution_time | surveillance_site_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 2002007020060 | 2025-04-17T15:57:00 | fault | critical | Extended Survey | true | 2024-11-10T10:30:00 | 1 |
| 2 | 168535 | 2022-09-01T22:14:00 | warning | high | Pilot Corridor A | false | 2025-04-21T17:47:00 | 2 |
| 3 | ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 | 2023-02-12T05:31:00 | status_change | medium | Baseline Series | true | 2022-09-05T00:04:00 | 3 |
| 4 | 1186089 | 2024-07-23T12:48:00 | maintenance | low | Distributed Assessment | false | 2023-02-16T07:21:00 | 4 |

Processing servers and monitoring applications form the computational backbone. Processing servers host the analytical workloads, while monitoring applications provide the user-facing and automated monitoring functions. These entities are linked through a series of association tables that define which sites connect to which centres, which stations attach to which sites, which links serve which sites, and how centres, stations, units, servers, and applications interrelate.

**Table `processing_servers`**

| id | server_id | server_role | os_version | database_type | uptime | last_health_check | control_centre_id |
|---|---|---|---|---|---|---|---|
| 1 | 911352d5dab64576b7a6da51aa69d76d | primary | integrated-os-46 | distributed-database-60 | 6.70 | 2023-06-08T05:39:00 | 1000 |
| 2 | 1450637 | redundant | seasonal-os-47 | baseline-database-61 | 8.40 | 2024-11-19T12:56:00 | 1001 |
| 3 | 4985152 | backup | regional-os-48 | pilot-database-62 | 10.10 | 2025-04-03T19:13:00 | 1002 |
| 4 | 9736887 | primary | legacy-os-49 | extended-database-63 | 11.80 | 2022-09-14T02:30:00 | 1003 |

**Table `monitoring_applications`**

| monitoring_application_id | app_id | app_name | version | interface_type | is_customized | last_updated | control_centre_id |
|---|---|---|---|---|---|---|---|
| 100 | d6267a5e-8fc1-11eb-924d-9cd76263cbd0 | Pilot Cluster | seasonal-version-71 | web | true | 2023-06-17T17:27:00 | 1000 |
| 101 | 4463647 | Baseline Review | regional-version-72 | desktop | false | 2024-11-01T00:44:00 | 1001 |
| 102 | ceffd6ca-8fd1-11eb-924d-9cd76263cbd0 | Distributed Initiative A | legacy-version-73 | api | true | 2025-04-12T07:01:00 | 1002 |
| 103 | 89820 | Adaptive Model | compact-version-74 | web | false | 2022-09-23T14:18:00 | 1003 |

The association table sites_centres records which surveillance sites are administratively associated with which control centres, establishing the primary reporting relationships. Similarly, sites_stations captures the physical or logical placement of radar stations at surveillance sites, while sites_links documents the network connectivity between sites and centres.

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

The reverse perspective is captured in centres_sites, which enumerates every surveillance site under the purview of each control centre. Centres_applications links monitoring applications to their controlling centres, and centres_links records the network links managed by each centre.

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

Radar stations are tied to control centres through stations_centres, indicating which centre oversees which radar installations. Data acquisition units connect to control centres via units_links, and to processing servers via units_servers, forming the data pipeline from edge sampling to server-side processing.

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

Network links are further detailed in links_units, which maps each link to the data acquisition units that traverse it. Monitoring events are cross-referenced through events_stations, events_units, and events_centres, allowing any incident to be traced back to the radar station, DAU, and control centre involved.

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

Processing servers are linked to data acquisition units through servers_units, and to monitoring applications through servers_applications, defining the compute topology. Applications, in turn, are associated with processing servers via applications_servers and with surveillance sites via applications_sites, completing the operational graph.

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

## Detail Views and Operational Reporting

The system provides a suite of detail views that join these base tables and association records into readable reports. Each view answers a specific operational question by presenting the relevant entities side by side.

The view v_surveillance_site_control_centre_detail answers which control centre is responsible for each surveillance site, presenting the site's identifier, name, and status alongside the centre's identifier, name, and type. A row for site SIT-2771 (Composite Review, online) would show its association with centre CEN-2480 (Regional Cluster, fixed).

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

The view v_surveillance_site_radar_station_detail pairs each surveillance site with its radar station, showing the radar model, frequency band, range, and upgrade status. Site SIT-2771 maps to radar station RAD-2323 (adaptive-radar-65, integrated-frequenc-94, 2.70 km range, not upgraded).

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

The view v_surveillance_site_network_link_detail presents the network link connecting a surveillance site to its control centre, including link type, bandwidth, latency, redundancy, and protocol. Site SIT-2771 uses a leased_line link with 20.20 bandwidth and 13.45 latency, marked redundant and using seasonal-protocol-11.

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

The view v_control_centre_surveillance_site_detail inverts the relationship, listing all surveillance sites under each control centre. Centre CEN-2480 (Regional Cluster) would appear with its associated sites, enabling operators to see the full scope of a centre's coverage.

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

The view v_control_centre_monitoring_application_detail shows which monitoring applications are deployed under each control centre, along with the application's name and version. Centre CEN-2480 would be listed alongside its assigned applications.

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

The view v_control_centre_network_link_detail enumerates all network links managed by each control centre, showing link type, bandwidth, latency, and redundancy. Centre CEN-2480 would appear with its leased_line link details.

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

The view v_radar_station_surveillance_site presents each radar station alongside its parent surveillance site, confirming the physical deployment location. Station RAD-2323 (adaptive-radar-65) is shown at site SIT-2771 (Composite Review).

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

The view v_radar_station_data_acquisition_unit pairs each radar station with its data acquisition unit, showing the DAU's firmware version, sampling rate, and status. Station RAD-2323 is paired with DAU 1000 (distributed-firmware-48, 18.45 sampling rate, active).

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

The view v_radar_station_control_centre_detail traces the chain from radar station through its associated site and network link to the controlling centre, providing a full end-to-end operational picture. Station RAD-2323 connects through site SIT-2771 to centre CEN-2480.

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

The view v_data_acquisition_unit_radar_station shows each DAU alongside its parent radar station, confirming the hardware lineage. DAU 1000 (distributed-firmware-48) is linked to radar station RAD-2323 (adaptive-radar-65).

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

The view v_data_acquisition_unit_network_link_detail presents the network link associated with each DAU, including bandwidth, latency, and protocol information. DAU 1000's link shows 20.20 bandwidth and 13.45 latency over a leased_line.

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

The view v_data_acquisition_unit_processing_server_detail maps each DAU to its processing server, showing the server's identifier and the application it hosts. DAU 1000 would be listed with its assigned processing server.

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

The view v_network_link_surveillance_site presents each network link alongside its originating surveillance site, confirming the edge endpoint. Link 1 (leased_line) originates at site SIT-2771 (Composite Review).

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

The view v_network_link_control_centre pairs each network link with its destination control centre, showing the centre's identifier and type. Link 1 terminates at centre CEN-2480 (Regional Cluster, fixed).

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

The view v_network_link_data_acquisition_unit_detail shows the DAU associated with each network link, including firmware version and sampling rate. Link 1 is associated with DAU 1000 (distributed-firmware-48, 18.45 sampling rate).

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

The view v_monitoring_event_surveillance_site presents each monitoring event alongside its originating surveillance site, showing the site's name and status. Event 2002007020060 (critical fault, "Extended Survey") is associated with site SIT-2771 (Composite Review, online).

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

The view v_monitoring_event_radar_station_detail traces each event to its associated radar station, showing the radar model and frequency band. Event 2002007020060 at site 1 would link to radar station RAD-2323 (adaptive-radar-65).

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

The view v_monitoring_event_data_acquisition_unit_detail connects each event to its DAU, showing firmware version and status. Event 2002007020060 would be associated with DAU 1000 (distributed-firmware-48, active).

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

The view v_monitoring_event_control_centre_detail traces each event to its controlling centre, showing the centre's name and type. Event 2002007020060 at site 1 would be reported to centre CEN-2480 (Regional Cluster, fixed).

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

The view v_processing_server_control_centre shows each processing server alongside its controlling centre, confirming the administrative hierarchy. A processing server would appear with centre CEN-2480 (Regional Cluster).

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

The view v_processing_server_data_acquisition_unit_detail maps each processing server to its associated DAUs, showing firmware versions and sampling rates. A server would be listed with DAU 1000 (distributed-firmware-48, 18.45 sampling rate).

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

The view v_processing_server_monitoring_application_detail shows which monitoring applications run on each processing server, including the application name and version. A server would be listed with its hosted applications.

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

The view v_monitoring_application_processing_server_detail inverts the relationship, showing each monitoring application alongside the processing server it runs on, confirming the deployment topology. An application would be listed with its hosting server.

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

The view v_monitoring_application_control_centre pairs each monitoring application with its controlling centre, showing the centre's name and type. An application would be listed with centre CEN-2480 (Regional Cluster, fixed).

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

The view v_monitoring_application_surveillance_site_detail traces each monitoring application to the surveillance sites it monitors, showing the site's identifier, name, and status. An application would be listed with site SIT-2771 (Composite Review, online).

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

## Synthesis

The surveillance and radar monitoring domain is defined by a layered architecture: edge sites collect observations, radar stations and data acquisition units process raw signals, network links transport data to control centres, and processing servers with monitoring applications perform analysis and present results. Every entity in this chain is traceable through association tables and detail views, ensuring that an operator can start from any point—a fault event, a radar station, a network link—and follow the relationships to understand the full operational context. The identifiers, coordinates, statuses, and timestamps recorded in each table provide the factual basis for monitoring, maintenance scheduling, and incident response across the entire infrastructure.