The domain under examination is a DDoS (Distributed Denial of Service) mitigation ecosystem, where network traffic is monitored, attacked, and defended across a distributed infrastructure of appliances, platforms, and scrubbing centers. At the heart of the model lies a set of seven base tables that capture the lifecycle of an attack—from its detection on a network service, through its engagement with a Forti DDoS appliance, to its redirection to a scrubbing center for cleansing. The relational schema is designed so that each table owns a distinct entity type, with foreign keys encoding the cardinality-bounded relationships that bind the entities together. Views then materialize the joins needed to answer operational questions about which attack affected which service, which appliance defended which service, and which scrubbing center absorbed which attack's traffic.

**Table `d_do_s_attacks`**

| id | attack_id | attack_type | layer | peak_bandwidth | start_date_time | end_date_time | is_mitigated | network_service_id | forti_d_do_s_appliance_id |
|---|---|---|---|---|---|---|---|---|---|
| 1000 | 7441144 | volumetric | 3 | 23.70 | 2024-07-24T18:42:00 | 2025-12-16T11:09:00 | false | 1 | 1 |
| 1001 | 1450639 | application_layer | 4 | 28.40 | 2025-12-08T01:59:00 | 2022-05-27T18:26:00 | true | 2 | 2 |
| 1002 | 9085260 | protocol | 7 | 33.10 | 2022-05-19T08:16:00 | 2023-10-11T01:43:00 | false | 3 | 3 |
| 1003 | 9085261 | slow | 3 | 37.80 | 2023-10-03T15:33:00 | 2024-03-22T08:00:00 | true | 4 | 4 |

The `d_do_s_attacks` table is the central event table of the schema. Each row represents a discrete DDoS attack event, identified by a surrogate primary key `id` and a business-level `attack_id` such as `7441144` or `1450639`. The `attack_type` column classifies the attack as `volumetric`, `application_layer`, `protocol`, or `slow`, while the `layer` column records the OSI layer at which the attack operates—values like `3`, `4`, `7`, and `3` again reflecting the diversity of attack vectors. The `peak_bandwidth` column captures the maximum traffic volume in Gbps, with observed values ranging from `23.70` to `37.80`. Temporal boundaries are recorded in `start_date_time` and `end_date_time`, for example `2024-07-24T18:42:00` through `2025-12-16T11:09:00` for attack `7441144`. The boolean `is_mitigated` flag indicates whether the attack was successfully mitigated, and the two foreign keys `network_service_id` and `forti_d_do_s_appliance_id` link the attack to the network service it targeted and the appliance that engaged it.

**Table `forti_d_do_s_appliances`**

| id | appliance_id | model | firmware_version | deployment_location | max_throughput_gbps | is_always_on | last_health_check | network_service_id | service_id | d_do_s_attack_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | b_VB-IC-12 | composite-model-81 | distributed-firmware-48 | composite-deployme-93 | 9.70 | false | 2023-06-08T05:39:00 | 1 | 1996925 | 1000 |
| 2 | CH9UT3 | primary-model-82 | baseline-firmware-49 | primary-deployme-94 | 11.40 | true | 2024-11-19T12:56:00 | 2 | 3990164 | 1001 |
| 3 | 790487 | adaptive-model-83 | pilot-firmware-50 | adaptive-deployme-95 | 13.10 | false | 2025-04-03T19:13:00 | 3 | 5844258 | 1002 |
| 4 | 9125640 | distributed-model-84 | extended-firmware-51 | distributed-deployme-96 | 14.80 | true | 2022-09-14T02:30:00 | 4 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | 1003 |

The `forti_d_do_s_appliances` table models the hardware and software assets deployed to defend network services. Each appliance is identified by `appliance_id` (e.g., `b_VB-IC-12`, `CH9UT3`, `790487`, `9125640`) and described by a `model` such as `composite-model-81` or `primary-model-82`, a `firmware_version` like `distributed-firmware-48`, and a `deployment_location` such as `composite-deployme-93`. The `max_throughput_gbps` column quantifies the appliance's capacity, with values from `9.70` to `14.80` Gbps. The `is_always_on` flag indicates whether the appliance runs continuously, and `last_health_check` records the most recent health probe timestamp. Three foreign keys anchor the appliance to the broader ecosystem: `network_service_id` links to the network service it protects, `service_id` links to a `verisign_d_do_s_services` record, and `d_do_s_attack_id` links to the attack it engaged.

**Table `verisign_d_do_s_services`**

| service_id | platform_name | api_endpoint | support_level | is_active | last_updated | forti_d_do_s_appliance_id | athena_platform_id | d_do_s_attack_id | created_at |
|---|---|---|---|---|---|---|---|---|---|
| 1996925 | Baseline Initiative D | integrated-api-64 | extended-support-39 | true | 2023-06-17T17:27:00 | 1 | 1 | 1000 | 2025-01-01 00:14:00 |
| 3990164 | Distributed Model | seasonal-api-65 | integrated-support-40 | false | 2024-11-01T00:44:00 | 2 | 2 | 1001 | 2025-02-06 03:14:00 |
| 5844258 | Adaptive Cluster | regional-api-66 | seasonal-support-41 | true | 2025-04-12T07:01:00 | 3 | 3 | 1002 | 2025-03-11 06:14:00 |
| e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | Primary Review A | legacy-api-67 | regional-support-42 | false | 2022-09-23T14:18:00 | 4 | 4 | 1003 | 2025-04-16 09:14:00 |

The `verisign_d_do_s_services` table captures the commercial and technical services offered by Verisign's DDoS protection portfolio. Each service is identified by `service_id` (e.g., `1996925`, `3990164`, `5844258`, `e29bafe2-8fd1-11eb-924d-9cd76263cbd0`) and associated with a `platform_name` such as `Baseline Initiative D` or `Distributed Model`. The `api_endpoint` column stores the integration point (e.g., `integrated-api-64`), while `support_level` records the tier of support like `extended-support-39`. The `is_active` flag indicates current availability, and `last_updated` provides a timestamp of the most recent service metadata change. Three foreign keys connect the service to its infrastructure: `forti_d_do_s_appliance_id` links to the defending appliance, `athena_platform_id` links to the underlying Athena platform, and `d_do_s_attack_id` links to the attack the service mitigated.

**Table `athena_platforms`**

| id | platform_id | region | capacity_tbps | is_operational | last_maintenance | scrubbing_center_id |
|---|---|---|---|---|---|---|
| 1 | state_uk_28 | distributed-region-12 | 7.45 | true | 2025-08-22 | 100 |
| 2 | e6ce01fe-8fc3-11eb-924d-9cd76263cbd0 | baseline-region-13 | 9.90 | false | 2022-01-06 | 101 |
| 3 | 4716417 | pilot-region-14 | 12.35 | true | 2023-06-17 | 102 |
| 4 | 10966228 | extended-region-15 | 14.80 | false | 2024-11-01 | 103 |

The `athena_platforms` table models the cloud computing platforms that host the scrubbing and mitigation infrastructure. Each platform is identified by `platform_id` (e.g., `state_uk_28`, `e6ce01fe-8fc3-11eb-924d-9cd76263cbd0`) and assigned to a `region` such as `distributed-region-12` or `baseline-region-13`. The `capacity_tbps` column records the platform's bandwidth capacity in terabits per second, with values from `7.45` to `14.80`. The `is_operational` flag indicates whether the platform is currently accepting workloads, and `last_maintenance` records the most recent maintenance window. A single foreign key, `scrubbing_center_id`, links each platform to the scrubbing center it hosts.

**Table `scrubbing_centers`**

| id | center_id | location | current_load_percent | is_accepting_traffic | last_traffic_redirect | d_do_s_attack_id | athena_platform_id |
|---|---|---|---|---|---|---|---|
| 100 | 5844261 | extended-location-99 | 10.95 | true | 2024-07-27T06:54:00 | 1000 | 1 |
| 101 | 1437588 | integrated-location-100 | 14.90 | false | 2025-12-11T13:11:00 | 1001 | 2 |
| 102 | 6564397 | seasonal-location-101 | 18.85 | true | 2022-05-22T20:28:00 | 1002 | 3 |
| 103 | default_chart_a_tax_13 | regional-location-102 | 22.80 | false | 2023-10-06T03:45:00 | 1003 | 4 |

The `scrubbing_centers` table represents the physical or logical facilities where malicious traffic is diverted and cleansed. Each center is identified by `center_id` (e.g., `5844261`, `1437588`, `6564397`, `default_chart_a_tax_13`) and located at a `location` such as `extended-location-99` or `integrated-location-100`. The `current_load_percent` column tracks the facility's utilization, with observed values from `10.95` to `22.80` percent. The `is_accepting_traffic` flag indicates whether the center is currently online, and `last_traffic_redirect` records the most recent traffic diversion event. Two foreign keys anchor the center: `d_do_s_attack_id` links to the attack it mitigated, and `athena_platform_id` links to the platform that hosts it.

**Table `network_services`**

| id | service_id | service_name | ip_address | port | protocol | criticality_level | is_internet_facing | d_do_s_attack_id | forti_d_do_s_appliance_id | scrubbing_center_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 1996925 | Distributed Initiative | extended-ip-15 | 39 | seasonal-protocol-11 | low | false | 1000 | 1 | 100 |
| 2 | 3990164 | Adaptive Model D | integrated-ip-16 | 48 | regional-protocol-12 | medium | true | 1001 | 2 | 101 |
| 3 | 5844258 | Primary Cluster | seasonal-ip-17 | 57 | legacy-protocol-13 | high | false | 1002 | 3 | 102 |
| 4 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | Composite Review | regional-ip-18 | 66 | compact-protocol-14 | critical | true | 1003 | 4 | 103 |

The `network_services` table models the internet-facing network services that are the targets of DDoS attacks. Each service is identified by `service_id` (e.g., `1996925`, `3990164`, `5844258`, `e29bafe2-8fd1-11eb-924d-9cd76263cbd0`) and named with a `service_name` such as `Distributed Initiative` or `Adaptive Model D`. The `ip_address` and `port` columns (e.g., `extended-ip-15` on port `39`) identify the network endpoint, while `protocol` records the transport protocol (e.g., `seasonal-protocol-11`). The `criticality_level` column classifies the service as `low`, `medium`, `high`, or `critical`, and `is_internet_facing` indicates whether the service is exposed to the public internet. Three foreign keys link the service to its context: `d_do_s_attack_id` to the attack it suffered, `forti_d_do_s_appliance_id` to the appliance defending it, and `scrubbing_center_id` to the center that absorbed its traffic.

**Table `mitigation_alerts`**

| mitigation_alert_id | alert_id | severity | threshold_exceeded | generated_date_time | is_acknowledged | status | forti_d_do_s_appliance_id | service_id | d_do_s_attack_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 2839509 | info | 7.70 | 2025-12-14T23:33:00 | true | pending | 1 | 1996925 | 1000 |
| 2 | 2087750 | warning | 9.40 | 2022-05-25T06:50:00 | false | evaluating | 2 | 3990164 | 1001 |
| 3 | 234 | critical | 11.10 | 2023-10-09T13:07:00 | true | mitigating | 3 | 5844258 | 1002 |
| 4 | 325444 | info | 12.80 | 2024-03-20T20:24:00 | false | resolved | 4 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | 1003 |

The `mitigation_alerts` table records the operational alerts generated during the attack lifecycle. Each alert is associated with a `forti_d_do_s_appliance_id` identifying the appliance that raised it, a `verisign_d_do_s_service_id` identifying the service under attack, and a `d_do_s_attack_id` identifying the specific attack event. This table serves as the operational log that ties together the defensive infrastructure, the commercial service, and the attack event into a single auditable record.

The views in the schema materialize the joins necessary to answer specific operational questions. Each view reconstructs a domain fact from the normalized tables by joining on the foreign keys established above.

**View `v_d_do_s_attack_network_service`**

```sql
CREATE VIEW v_d_do_s_attack_network_service AS
SELECT a.id, a.attack_id, a.attack_type, a.layer, b.id AS service_id, b.service_id AS service_service_id, b.service_name AS service_service_name
FROM d_do_s_attacks a JOIN network_services b ON a.network_service_id = b.id;
```

| id | attack_id | attack_type | layer | service_id | service_service_id | service_service_name |
|---|---|---|---|---|---|---|
| 1000 | 7441144 | volumetric | 3 | 1 | 1996925 | Distributed Initiative |
| 1001 | 1450639 | application_layer | 4 | 2 | 3990164 | Adaptive Model D |
| 1002 | 9085260 | protocol | 7 | 3 | 5844258 | Primary Cluster |
| 1003 | 9085261 | slow | 3 | 4 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | Composite Review |

This view joins `d_do_s_attacks` with `network_services` on `d_do_s_attacks.network_service_id = network_services.id` to answer the question: which network service did each attack target? For example, the row for attack `7441144` (a `volumetric` attack on layer `3` with peak bandwidth `23.70`) is joined with network service `1996925` (`Distributed Initiative`, `extended-ip-15`, port `39`, `seasonal-protocol-11`, `low` criticality, not internet-facing). The view produces a flat record that correlates the attack's temporal and bandwidth characteristics with the network service's topology and criticality, enabling analysts to assess whether high-criticality services are disproportionately targeted.

**View `v_d_do_s_attack_forti_d_do_s_appliance`**

```sql
CREATE VIEW v_d_do_s_attack_forti_d_do_s_appliance AS
SELECT a.id, a.attack_id, a.attack_type, a.layer, b.id AS appliance_id, b.appliance_id AS appliance_appliance_id, b.model AS appliance_model
FROM d_do_s_attacks a JOIN forti_d_do_s_appliances b ON a.forti_d_do_s_appliance_id = b.id;
```

| id | attack_id | attack_type | layer | appliance_id | appliance_appliance_id | appliance_model |
|---|---|---|---|---|---|---|
| 1000 | 7441144 | volumetric | 3 | 1 | b_VB-IC-12 | composite-model-81 |
| 1001 | 1450639 | application_layer | 4 | 2 | CH9UT3 | primary-model-82 |
| 1002 | 9085260 | protocol | 7 | 3 | 790487 | adaptive-model-83 |
| 1003 | 9085261 | slow | 3 | 4 | 9125640 | distributed-model-84 |

This view joins `d_do_s_attacks` with `forti_d_do_s_appliances` on `d_do_s_attacks.forti_d_do_s_appliance_id = forti_d_do_s_appliances.id` to answer: which appliance defended against each attack? Attack `1450639` (an `application_layer` attack on layer `4` with peak bandwidth `28.40`, mitigated) is joined with appliance `CH9UT3` (`primary-model-82`, `baseline-firmware-49`, `primary-deployme-94`, `11.40` Gbps throughput, always-on). This join allows operators to evaluate whether certain appliance models or firmware versions correlate with successful mitigation outcomes.

**View `v_forti_d_do_s_appliance_network_service`**

```sql
CREATE VIEW v_forti_d_do_s_appliance_network_service AS
SELECT a.id, a.appliance_id, a.model, a.firmware_version, b.id AS service_id, b.service_id AS service_service_id, b.service_name AS service_service_name
FROM forti_d_do_s_appliances a JOIN network_services b ON a.network_service_id = b.id;
```

| id | appliance_id | model | firmware_version | service_id | service_service_id | service_service_name |
|---|---|---|---|---|---|---|
| 1 | b_VB-IC-12 | composite-model-81 | distributed-firmware-48 | 1 | 1996925 | Distributed Initiative |
| 2 | CH9UT3 | primary-model-82 | baseline-firmware-49 | 2 | 3990164 | Adaptive Model D |
| 3 | 790487 | adaptive-model-83 | pilot-firmware-50 | 3 | 5844258 | Primary Cluster |
| 4 | 9125640 | distributed-model-84 | extended-firmware-51 | 4 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | Composite Review |

This view joins `forti_d_do_s_appliances` with `network_services` on `forti_d_do_s_appliances.network_service_id = network_services.id` to answer: which network service does each appliance protect? Appliance `b_VB-IC-12` (`composite-model-81`, `9.70` Gbps, not always-on) is joined with network service `1996925` (`Distributed Initiative`, `extended-ip-15`, port `39`, `seasonal-protocol-11`, `low` criticality). This view supports capacity planning by revealing the mapping between appliance throughput and the criticality of the services they defend.

**View `v_forti_d_do_s_appliance_verisign_d_do_s_service`**

```sql
CREATE VIEW v_forti_d_do_s_appliance_verisign_d_do_s_service AS
SELECT a.id, a.appliance_id, a.model, a.firmware_version, b.service_id AS service_service_id, b.platform_name AS service_platform_name, b.api_endpoint AS service_api_endpoint
FROM forti_d_do_s_appliances a JOIN verisign_d_do_s_services b ON a.service_id = b.service_id;
```

| id | appliance_id | model | firmware_version | service_service_id | service_platform_name | service_api_endpoint |
|---|---|---|---|---|---|---|
| 1 | b_VB-IC-12 | composite-model-81 | distributed-firmware-48 | 1996925 | Baseline Initiative D | integrated-api-64 |
| 2 | CH9UT3 | primary-model-82 | baseline-firmware-49 | 3990164 | Distributed Model | seasonal-api-65 |
| 3 | 790487 | adaptive-model-83 | pilot-firmware-50 | 5844258 | Adaptive Cluster | regional-api-66 |
| 4 | 9125640 | distributed-model-84 | extended-firmware-51 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | Primary Review A | legacy-api-67 |

This view joins `forti_d_do_s_appliances` with `verisign_d_do_s_services` on `forti_d_do_s_appliances.service_id = verisign_d_do_s_services.service_id` to answer: which Verisign service does each appliance support? Appliance `790487` (`adaptive-model-83`, `13.10` Gbps, not always-on) is joined with service `5844258` (`Adaptive Cluster`, `regional-api-66`, `seasonal-support-41`, active). This join reveals the commercial-infrastructural linkage between hardware assets and the service tiers they enable.

**View `v_forti_d_do_s_appliance_d_do_s_attack`**

```sql
CREATE VIEW v_forti_d_do_s_appliance_d_do_s_attack AS
SELECT a.id, a.appliance_id, a.model, a.firmware_version, b.id AS attack_id, b.attack_id AS attack_attack_id, b.attack_type AS attack_attack_type
FROM forti_d_do_s_appliances a JOIN d_do_s_attacks b ON a.d_do_s_attack_id = b.id;
```

| id | appliance_id | model | firmware_version | attack_id | attack_attack_id | attack_attack_type |
|---|---|---|---|---|---|---|
| 1 | b_VB-IC-12 | composite-model-81 | distributed-firmware-48 | 1000 | 7441144 | volumetric |
| 2 | CH9UT3 | primary-model-82 | baseline-firmware-49 | 1001 | 1450639 | application_layer |
| 3 | 790487 | adaptive-model-83 | pilot-firmware-50 | 1002 | 9085260 | protocol |
| 4 | 9125640 | distributed-model-84 | extended-firmware-51 | 1003 | 9085261 | slow |

This view joins `forti_d_do_s_appliances` with `d_do_s_attacks` on `forti_d_do_s_appliances.d_do_s_attack_id = d_do_s_attacks.id` to answer: which attack did each appliance engage? Appliance `9125640` (`distributed-model-84`, `14.80` Gbps, always-on) is joined with attack `9085261` (a `slow` attack on layer `3` with peak bandwidth `37.80`, mitigated). This view provides a direct appliance-to-attack trace for post-incident analysis.

**View `v_verisign_d_do_s_service_forti_d_do_s_appliance`**

```sql
CREATE VIEW v_verisign_d_do_s_service_forti_d_do_s_appliance AS
SELECT a.service_id, a.platform_name, a.api_endpoint, a.support_level, b.id AS appliance_id, b.appliance_id AS appliance_appliance_id, b.model AS appliance_model
FROM verisign_d_do_s_services a JOIN forti_d_do_s_appliances b ON a.forti_d_do_s_appliance_id = b.id;
```

| service_id | platform_name | api_endpoint | support_level | appliance_id | appliance_appliance_id | appliance_model |
|---|---|---|---|---|---|---|
| 1996925 | Baseline Initiative D | integrated-api-64 | extended-support-39 | 1 | b_VB-IC-12 | composite-model-81 |
| 3990164 | Distributed Model | seasonal-api-65 | integrated-support-40 | 2 | CH9UT3 | primary-model-82 |
| 5844258 | Adaptive Cluster | regional-api-66 | seasonal-support-41 | 3 | 790487 | adaptive-model-83 |
| e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | Primary Review A | legacy-api-67 | regional-support-42 | 4 | 9125640 | distributed-model-84 |

This view joins `verisign_d_do_s_services` with `forti_d_do_s_appliances` on `verisign_d_do_s_services.forti_d_do_s_appliance_id = forti_d_do_s_appliances.id` to answer: which appliance defends each Verisign service? Service `1996925` (`Baseline Initiative D`, `integrated-api-64`, `extended-support-39`, active) is joined with appliance `b_VB-IC-12` (`composite-model-81`, `9.70` Gbps, not always-on). This perspective is useful for service-level agreement (SLA) verification, confirming that each commercial service has a corresponding defensive appliance.

**View `v_verisign_d_do_s_service_athena_platform`**

```sql
CREATE VIEW v_verisign_d_do_s_service_athena_platform AS
SELECT a.service_id, a.platform_name, a.api_endpoint, a.support_level, b.id AS platform_id, b.platform_id AS platform_platform_id, b.region AS platform_region
FROM verisign_d_do_s_services a JOIN athena_platforms b ON a.athena_platform_id = b.id;
```

| service_id | platform_name | api_endpoint | support_level | platform_id | platform_platform_id | platform_region |
|---|---|---|---|---|---|---|
| 1996925 | Baseline Initiative D | integrated-api-64 | extended-support-39 | 1 | state_uk_28 | distributed-region-12 |
| 3990164 | Distributed Model | seasonal-api-65 | integrated-support-40 | 2 | e6ce01fe-8fc3-11eb-924d-9cd76263cbd0 | baseline-region-13 |
| 5844258 | Adaptive Cluster | regional-api-66 | seasonal-support-41 | 3 | 4716417 | pilot-region-14 |
| e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | Primary Review A | legacy-api-67 | regional-support-42 | 4 | 10966228 | extended-region-15 |

This view joins `verisign_d_do_s_services` with `athena_platforms` on `verisign_d_do_s_services.athena_platform_id = athena_platforms.id` to answer: which Athena platform hosts each Verisign service? Service `3990164` (`Distributed Model`, `seasonal-api-65`, `integrated-support-40`, inactive) is joined with platform `e6ce01fe-8fc3-11eb-924d-9cd76263cbd0` (`baseline-region-13`, `9.90` TBps, not operational). This view supports infrastructure cost allocation by linking commercial services to their underlying platform resources.

**View `v_verisign_d_do_s_service_d_do_s_attack`**

```sql
CREATE VIEW v_verisign_d_do_s_service_d_do_s_attack AS
SELECT a.service_id, a.platform_name, a.api_endpoint, a.support_level, b.id AS attack_id, b.attack_id AS attack_attack_id, b.attack_type AS attack_attack_type
FROM verisign_d_do_s_services a JOIN d_do_s_attacks b ON a.d_do_s_attack_id = b.id;
```

| service_id | platform_name | api_endpoint | support_level | attack_id | attack_attack_id | attack_attack_type |
|---|---|---|---|---|---|---|
| 1996925 | Baseline Initiative D | integrated-api-64 | extended-support-39 | 1000 | 7441144 | volumetric |
| 3990164 | Distributed Model | seasonal-api-65 | integrated-support-40 | 1001 | 1450639 | application_layer |
| 5844258 | Adaptive Cluster | regional-api-66 | seasonal-support-41 | 1002 | 9085260 | protocol |
| e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | Primary Review A | legacy-api-67 | regional-support-42 | 1003 | 9085261 | slow |

This view joins `verisign_d_do_s_services` with `d_do_s_attacks` on `verisign_d_do_s_services.d_do_s_attack_id = d_do_s_attacks.id` to answer: which attack did each Verisign service mitigate? Service `5844258` (`Adaptive Cluster`, `regional-api-66`, `seasonal-support-41`, active) is joined with attack `9085260` (a `protocol` attack on layer `7` with peak bandwidth `33.10`, not mitigated). This view enables service-level incident reporting, correlating commercial service performance with attack severity.

**View `v_athena_platform_scrubbing_center`**

```sql
CREATE VIEW v_athena_platform_scrubbing_center AS
SELECT a.id, a.platform_id, a.region, a.capacity_tbps, b.id AS center_id, b.center_id AS center_center_id, b.location AS center_location
FROM athena_platforms a JOIN scrubbing_centers b ON a.scrubbing_center_id = b.id;
```

| id | platform_id | region | capacity_tbps | center_id | center_center_id | center_location |
|---|---|---|---|---|---|---|
| 1 | state_uk_28 | distributed-region-12 | 7.45 | 100 | 5844261 | extended-location-99 |
| 2 | e6ce01fe-8fc3-11eb-924d-9cd76263cbd0 | baseline-region-13 | 9.90 | 101 | 1437588 | integrated-location-100 |
| 3 | 4716417 | pilot-region-14 | 12.35 | 102 | 6564397 | seasonal-location-101 |
| 4 | 10966228 | extended-region-15 | 14.80 | 103 | default_chart_a_tax_13 | regional-location-102 |

This view joins `athena_platforms` with `scrubbing_centers` on `athena_platforms.id = scrubbing_centers.athena_platform_id` to answer: which scrubbing center is hosted on each Athena platform? Platform `state_uk_28` (`distributed-region-12`, `7.45` TBps, operational) is joined with scrubbing center `5844261` (`extended-location-99`, `10.95`% load, accepting traffic). This view supports capacity planning by revealing the platform-to-center mapping and allowing operators to assess whether scrubbing center loads are balanced across platforms.

**View `v_scrubbing_center_d_do_s_attack`**

```sql
CREATE VIEW v_scrubbing_center_d_do_s_attack AS
SELECT a.id, a.center_id, a.location, a.current_load_percent, b.id AS attack_id, b.attack_id AS attack_attack_id, b.attack_type AS attack_attack_type
FROM scrubbing_centers a JOIN d_do_s_attacks b ON a.d_do_s_attack_id = b.id;
```

| id | center_id | location | current_load_percent | attack_id | attack_attack_id | attack_attack_type |
|---|---|---|---|---|---|---|
| 100 | 5844261 | extended-location-99 | 10.95 | 1000 | 7441144 | volumetric |
| 101 | 1437588 | integrated-location-100 | 14.90 | 1001 | 1450639 | application_layer |
| 102 | 6564397 | seasonal-location-101 | 18.85 | 1002 | 9085260 | protocol |
| 103 | default_chart_a_tax_13 | regional-location-102 | 22.80 | 1003 | 9085261 | slow |

This view joins `scrubbing_centers` with `d_do_s_attacks` on `scrubbing_centers.d_do_s_attack_id = d_do_s_attacks.id` to answer: which attack did each scrubbing center mitigate? Scrubbing center `1437588` (`integrated-location-100`, `14.90`% load, not accepting traffic) is joined with attack `1450639` (an `application_layer` attack on layer `4` with peak bandwidth `28.40`, mitigated). This view provides a scrubbing-center-level incident summary, useful for capacity and load analysis.

**View `v_scrubbing_center_athena_platform`**

```sql
CREATE VIEW v_scrubbing_center_athena_platform AS
SELECT a.id, a.center_id, a.location, a.current_load_percent, b.id AS platform_id, b.platform_id AS platform_platform_id, b.region AS platform_region
FROM scrubbing_centers a JOIN athena_platforms b ON a.athena_platform_id = b.id;
```

| id | center_id | location | current_load_percent | platform_id | platform_platform_id | platform_region |
|---|---|---|---|---|---|---|
| 100 | 5844261 | extended-location-99 | 10.95 | 1 | state_uk_28 | distributed-region-12 |
| 101 | 1437588 | integrated-location-100 | 14.90 | 2 | e6ce01fe-8fc3-11eb-924d-9cd76263cbd0 | baseline-region-13 |
| 102 | 6564397 | seasonal-location-101 | 18.85 | 3 | 4716417 | pilot-region-14 |
| 103 | default_chart_a_tax_13 | regional-location-102 | 22.80 | 4 | 10966228 | extended-region-15 |

This view joins `scrubbing_centers` with `athena_platforms` on `scrubbing_centers.athena_platform_id = athena_platforms.id` to answer: which Athena platform hosts each scrubbing center? Scrubbing center `6564397` (`seasonal-location-101`, `18.85`% load, accepting traffic) is joined with platform `4716417` (`pilot-region-14`, `12.35` TBps, operational). This view is the inverse of `v_athena_platform_scrubbing_center` and supports infrastructure auditing by confirming the platform-to-center relationship from the scrubbing center's perspective.

**View `v_network_service_d_do_s_attack`**

```sql
CREATE VIEW v_network_service_d_do_s_attack AS
SELECT a.id, a.service_id, a.service_name, a.ip_address, b.id AS attack_id, b.attack_id AS attack_attack_id, b.attack_type AS attack_attack_type
FROM network_services a JOIN d_do_s_attacks b ON a.d_do_s_attack_id = b.id;
```

| id | service_id | service_name | ip_address | attack_id | attack_attack_id | attack_attack_type |
|---|---|---|---|---|---|---|
| 1 | 1996925 | Distributed Initiative | extended-ip-15 | 1000 | 7441144 | volumetric |
| 2 | 3990164 | Adaptive Model D | integrated-ip-16 | 1001 | 1450639 | application_layer |
| 3 | 5844258 | Primary Cluster | seasonal-ip-17 | 1002 | 9085260 | protocol |
| 4 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | Composite Review | regional-ip-18 | 1003 | 9085261 | slow |

This view joins `network_services` with `d_do_s_attacks` on `network_services.d_do_s_attack_id = d_do_s_attacks.id` to answer: which attack targeted each network service? Network service `5844258` (`Primary Cluster`, `seasonal-ip-17`, port `57`, `legacy-protocol-13`, `high` criticality, not internet-facing) is joined with attack `9085260` (a `protocol` attack on layer `7` with peak bandwidth `33.10`, not mitigated). This view enables service-level risk assessment by correlating service criticality with attack characteristics.

**View `v_network_service_forti_d_do_s_appliance`**

```sql
CREATE VIEW v_network_service_forti_d_do_s_appliance AS
SELECT a.id, a.service_id, a.service_name, a.ip_address, b.id AS appliance_id, b.appliance_id AS appliance_appliance_id, b.model AS appliance_model
FROM network_services a JOIN forti_d_do_s_appliances b ON a.forti_d_do_s_appliance_id = b.id;
```

| id | service_id | service_name | ip_address | appliance_id | appliance_appliance_id | appliance_model |
|---|---|---|---|---|---|---|
| 1 | 1996925 | Distributed Initiative | extended-ip-15 | 1 | b_VB-IC-12 | composite-model-81 |
| 2 | 3990164 | Adaptive Model D | integrated-ip-16 | 2 | CH9UT3 | primary-model-82 |
| 3 | 5844258 | Primary Cluster | seasonal-ip-17 | 3 | 790487 | adaptive-model-83 |
| 4 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | Composite Review | regional-ip-18 | 4 | 9125640 | distributed-model-84 |

This view joins `network_services` with `forti_d_do_s_appliances` on `network_services.forti_d_do_s_appliance_id = forti_d_do_s_appliances.id` to answer: which appliance defends each network service? Network service `e29bafe2-8fd1-11eb-924d-9cd76263cbd0` (`Composite Review`, `regional-ip-18`, port `66`, `compact-protocol-14`, `critical` criticality, internet-facing) is joined with appliance `9125640` (`distributed-model-84`, `14.80` Gbps, always-on). This view supports defensive coverage analysis, ensuring that critical internet-facing services have appropriately capable appliances.

**View `v_network_service_scrubbing_center`**

```sql
CREATE VIEW v_network_service_scrubbing_center AS
SELECT a.id, a.service_id, a.service_name, a.ip_address, b.id AS center_id, b.center_id AS center_center_id, b.location AS center_location
FROM network_services a JOIN scrubbing_centers b ON a.scrubbing_center_id = b.id;
```

| id | service_id | service_name | ip_address | center_id | center_center_id | center_location |
|---|---|---|---|---|---|---|
| 1 | 1996925 | Distributed Initiative | extended-ip-15 | 100 | 5844261 | extended-location-99 |
| 2 | 3990164 | Adaptive Model D | integrated-ip-16 | 101 | 1437588 | integrated-location-100 |
| 3 | 5844258 | Primary Cluster | seasonal-ip-17 | 102 | 6564397 | seasonal-location-101 |
| 4 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | Composite Review | regional-ip-18 | 103 | default_chart_a_tax_13 | regional-location-102 |

This view joins `network_services` with `scrubbing_centers` on `network_services.scrubbing_center_id = scrubbing_centers.id` to answer: which scrubbing center absorbs traffic from each network service? Network service `1996925` (`Distributed Initiative`, `extended-ip-15`, port `39`, `seasonal-protocol-11`, `low` criticality, not internet-facing) is joined with scrubbing center `5844261` (`extended-location-99`, `10.95`% load, accepting traffic). This view supports traffic routing analysis, confirming that network services are correctly mapped to their scrubbing destinations.

**View `v_mitigation_alert_forti_d_do_s_appliance`**

```sql
CREATE VIEW v_mitigation_alert_forti_d_do_s_appliance AS
SELECT a.mitigation_alert_id, a.alert_id, a.severity, a.threshold_exceeded, b.id AS appliance_id, b.appliance_id AS appliance_appliance_id, b.model AS appliance_model
FROM mitigation_alerts a JOIN forti_d_do_s_appliances b ON a.forti_d_do_s_appliance_id = b.id;
```

| mitigation_alert_id | alert_id | severity | threshold_exceeded | appliance_id | appliance_appliance_id | appliance_model |
|---|---|---|---|---|---|---|
| 1 | 2839509 | info | 7.70 | 1 | b_VB-IC-12 | composite-model-81 |
| 2 | 2087750 | warning | 9.40 | 2 | CH9UT3 | primary-model-82 |
| 3 | 234 | critical | 11.10 | 3 | 790487 | adaptive-model-83 |
| 4 | 325444 | info | 12.80 | 4 | 9125640 | distributed-model-84 |

This view joins `mitigation_alerts` with `forti_d_do_s_appliances` on `mitigation_alerts.forti_d_do_s_appliance_id = forti_d_do_s_appliances.id` to answer: which appliance generated each mitigation alert? This join produces a flat record that correlates alert-level operational events with the appliance metadata (model, firmware, throughput, deployment location), enabling operators to identify whether certain appliance configurations produce more alerts than others.

**View `v_mitigation_alert_verisign_d_do_s_service`**

```sql
CREATE VIEW v_mitigation_alert_verisign_d_do_s_service AS
SELECT a.mitigation_alert_id, a.alert_id, a.severity, a.threshold_exceeded, b.service_id AS service_service_id, b.platform_name AS service_platform_name, b.api_endpoint AS service_api_endpoint
FROM mitigation_alerts a JOIN verisign_d_do_s_services b ON a.service_id = b.service_id;
```

| mitigation_alert_id | alert_id | severity | threshold_exceeded | service_service_id | service_platform_name | service_api_endpoint |
|---|---|---|---|---|---|---|
| 1 | 2839509 | info | 7.70 | 1996925 | Baseline Initiative D | integrated-api-64 |
| 2 | 2087750 | warning | 9.40 | 3990164 | Distributed Model | seasonal-api-65 |
| 3 | 234 | critical | 11.10 | 5844258 | Adaptive Cluster | regional-api-66 |
| 4 | 325444 | info | 12.80 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | Primary Review A | legacy-api-67 |

This view joins `mitigation_alerts` with `verisign_d_do_s_services` on `mitigation_alerts.verisign_d_do_s_service_id = verisign_d_do_s_services.service_id` to answer: which Verisign service triggered each mitigation alert? This join correlates alert events with service metadata (platform name, API endpoint, support level, active status), allowing operators to determine whether specific service tiers or platform configurations are more prone to triggering alerts.

**View `v_mitigation_alert_d_do_s_attack`**

```sql
CREATE VIEW v_mitigation_alert_d_do_s_attack AS
SELECT a.mitigation_alert_id, a.alert_id, a.severity, a.threshold_exceeded, b.id AS attack_id, b.attack_id AS attack_attack_id, b.attack_type AS attack_attack_type
FROM mitigation_alerts a JOIN d_do_s_attacks b ON a.d_do_s_attack_id = b.id;
```

| mitigation_alert_id | alert_id | severity | threshold_exceeded | attack_id | attack_attack_id | attack_attack_type |
|---|---|---|---|---|---|---|
| 1 | 2839509 | info | 7.70 | 1000 | 7441144 | volumetric |
| 2 | 2087750 | warning | 9.40 | 1001 | 1450639 | application_layer |
| 3 | 234 | critical | 11.10 | 1002 | 9085260 | protocol |
| 4 | 325444 | info | 12.80 | 1003 | 9085261 | slow |

This view joins `mitigation_alerts` with `d_do_s_attacks` on `mitigation_alerts.d_do_s_attack_id = d_do_s_attacks.id` to answer: which attack event generated each mitigation alert? This join correlates alert events with attack metadata (type, layer, peak bandwidth, mitigation status), enabling operators to assess whether certain attack profiles (e.g., `volumetric` on layer `3` with high bandwidth) are more likely to trigger operational alerts.

The schema as a whole embodies a star-and-fact pattern where `d_do_s_attacks` serves as the central fact table, surrounded by dimension tables (`network_services`, `forti_d_do_s_appliances`, `verisign_d_do_s_services`, `athena_platforms`, `scrubbing_centers`) that provide descriptive context. The `mitigation_alerts` table acts as a secondary fact table, linking the operational log to the same dimensional entities. The foreign keys are consistently oriented: each dimension table holds a reference to `d_do_s_attacks` where the relationship is one-to-many from the attack's perspective, while the attack table holds references to `network_services` and `forti_d_do_s_appliances` to capture the specific service and appliance involved in each event. The views materialize the most common join paths, allowing analysts to query the normalized schema without writing joins explicitly. This design balances normalization (avoiding redundancy in appliance, service, and platform metadata) with query convenience (pre-joined views for the most frequent analytical patterns), and it supports both operational monitoring and post-incident forensic analysis of the DDoS mitigation lifecycle.