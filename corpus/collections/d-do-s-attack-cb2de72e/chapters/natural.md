## DDoS Mitigation Infrastructure: Records, Relationships, and Operational Context

Modern distributed denial-of-service (DDoS) defense relies on a layered architecture of appliances, platforms, scrubbing centers, and network services working in concert to detect, classify, and neutralize volumetric, protocol, application-layer, and slow-rate attacks. The records in this dataset capture a snapshot of that ecosystem: individual attack events, the security appliances tasked with responding to them, the upstream services and platforms that provide capacity, and the scrubbing centers that absorb and cleanse malicious traffic before it reaches production infrastructure. Understanding how these pieces interlock requires reading the tables not as isolated spreadsheets but as a connected operational map.

**Table `d_do_s_attacks`**

| id | attack_id | attack_type | layer | peak_bandwidth | start_date_time | end_date_time | is_mitigated | network_service_id | forti_d_do_s_appliance_id |
|---|---|---|---|---|---|---|---|---|---|
| 1000 | 7441144 | volumetric | 3 | 23.70 | 2024-07-24T18:42:00 | 2025-12-16T11:09:00 | false | 1 | 1 |
| 1001 | 1450639 | application_layer | 4 | 28.40 | 2025-12-08T01:59:00 | 2022-05-27T18:26:00 | true | 2 | 2 |
| 1002 | 9085260 | protocol | 7 | 33.10 | 2022-05-19T08:16:00 | 2023-10-11T01:43:00 | false | 3 | 3 |
| 1003 | 9085261 | slow | 3 | 37.80 | 2023-10-03T15:33:00 | 2024-03-22T08:00:00 | true | 4 | 4 |

The attack registry is the anchor of the dataset. Each row represents a single DDoS event identified by a numeric `attack_id` such as `7441144` or `1450639`, classified into one of four types—`volumetric`, `application_layer`, `protocol`, or `slow`—and measured at the network layer, which ranges from layer 3 through layer 7. The `peak_bandwidth` column records the maximum observed throughput of the attack in gigabits per second, with values in the sample ranging from 23.70 Gbps to 37.80 Gbps. Temporal boundaries are captured in `start_date_time` and `end_date_time`, while the boolean `is_mitigated` flag indicates whether the attack was successfully neutralized. In the provided rows, attacks with IDs `1450639` and `9085261` are marked as mitigated, whereas `7441144` and `9085260` remain unresolved. Each attack is linked to a `network_service_id` and a `forti_d_do_s_appliance_id`, establishing the first layer of relational context.

**Table `forti_d_do_s_appliances`**

| id | appliance_id | model | firmware_version | deployment_location | max_throughput_gbps | is_always_on | last_health_check | network_service_id | service_id | d_do_s_attack_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | b_VB-IC-12 | composite-model-81 | distributed-firmware-48 | composite-deployme-93 | 9.70 | false | 2023-06-08T05:39:00 | 1 | 1996925 | 1000 |
| 2 | CH9UT3 | primary-model-82 | baseline-firmware-49 | primary-deployme-94 | 11.40 | true | 2024-11-19T12:56:00 | 2 | 3990164 | 1001 |
| 3 | 790487 | adaptive-model-83 | pilot-firmware-50 | adaptive-deployme-95 | 13.10 | false | 2025-04-03T19:13:00 | 3 | 5844258 | 1002 |
| 4 | 9125640 | distributed-model-84 | extended-firmware-51 | distributed-deployme-96 | 14.80 | true | 2022-09-14T02:30:00 | 4 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | 1003 |

Forti DDoS appliances are the physical or virtual security devices deployed at the network edge. Each appliance carries a unique `appliance_id`—for example, `b_VB-IC-12` or `CH9UT3`—and is described by a `model` designation such as `composite-model-81` or `primary-model-82`. The `firmware_version` field, with values like `distributed-firmware-48` and `baseline-firmware-49`, tracks the software state of each device. Deployment location is captured in `deployment_location`, using labels such as `composite-deployme-93` and `primary-deployme-94`. The `max_throughput_gbps` column quantifies the appliance's processing capacity, ranging from 9.70 Gbps to 14.80 Gbps in the sample data. The `is_always_on` flag indicates whether the appliance operates continuously or is activated on demand. Health monitoring is reflected in `last_health_check`, a timestamp that shows when the device was last verified. Each appliance row connects to a `network_service_id`, a `service_id` referencing a Verisign DDoS service, and the `d_do_s_attack_id` it is assigned to defend.

**Table `verisign_d_do_s_services`**

| service_id | platform_name | api_endpoint | support_level | is_active | last_updated | forti_d_do_s_appliance_id | athena_platform_id | d_do_s_attack_id | created_at |
|---|---|---|---|---|---|---|---|---|---|
| 1996925 | Baseline Initiative D | integrated-api-64 | extended-support-39 | true | 2023-06-17T17:27:00 | 1 | 1 | 1000 | 2025-01-01 00:14:00 |
| 3990164 | Distributed Model | seasonal-api-65 | integrated-support-40 | false | 2024-11-01T00:44:00 | 2 | 2 | 1001 | 2025-02-06 03:14:00 |
| 5844258 | Adaptive Cluster | regional-api-66 | seasonal-support-41 | true | 2025-04-12T07:01:00 | 3 | 3 | 1002 | 2025-03-11 06:14:00 |
| e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | Primary Review A | legacy-api-67 | regional-support-42 | false | 2022-09-23T14:18:00 | 4 | 4 | 1003 | 2025-04-16 09:14:00 |

Verisign DDoS services represent the commercial or operational service offerings that sit between appliances and the broader platform ecosystem. Each service is identified by a `service_id`, which in the sample includes both numeric identifiers like `1996925` and UUIDs such as `e29bafe2-8fd1-11eb-924d-9cd76263cbd0`. The `platform_name` field—values like `Baseline Initiative D` and `Distributed Model`—names the service tier. An `api_endpoint` column, with entries such as `integrated-api-64` and `seasonal-api-65`, specifies the integration point. Support levels are categorized as `extended-support-39`, `integrated-support-40`, `seasonal-support-41`, or `regional-support-42`. The `is_active` flag indicates whether the service is currently in production, and `last_updated` records the most recent configuration change. Each service row ties back to a specific Forti appliance via `forti_d_do_s_appliance_id`, an `athena_platform_id` for platform-level capacity, and the `d_do_s_attack_id` it is associated with.

**Table `athena_platforms`**

| id | platform_id | region | capacity_tbps | is_operational | last_maintenance | scrubbing_center_id |
|---|---|---|---|---|---|---|
| 1 | state_uk_28 | distributed-region-12 | 7.45 | true | 2025-08-22 | 100 |
| 2 | e6ce01fe-8fc3-11eb-924d-9cd76263cbd0 | baseline-region-13 | 9.90 | false | 2022-01-06 | 101 |
| 3 | 4716417 | pilot-region-14 | 12.35 | true | 2023-06-17 | 102 |
| 4 | 10966228 | extended-region-15 | 14.80 | false | 2024-11-01 | 103 |

Athena platforms provide the regional compute and capacity backbone for the mitigation stack. Each platform is identified by a `platform_id` such as `state_uk_28` or `e6ce01fe-8fc3-11eb-924d-9cd76263cbd0`, and assigned to a `region` labeled with descriptors like `distributed-region-12` and `baseline-region-13`. The `capacity_tbps` column measures the platform's throughput capacity in terabits per second, ranging from 7.45 to 14.80 TBps in the sample. The `is_operational` flag indicates whether the platform is currently available for traffic, and `last_maintenance` records the date of the most recent maintenance window. Each platform is linked to a `scrubbing_center_id`, establishing the downstream relationship to traffic-cleansing infrastructure.

**Table `scrubbing_centers`**

| id | center_id | location | current_load_percent | is_accepting_traffic | last_traffic_redirect | d_do_s_attack_id | athena_platform_id |
|---|---|---|---|---|---|---|---|
| 100 | 5844261 | extended-location-99 | 10.95 | true | 2024-07-27T06:54:00 | 1000 | 1 |
| 101 | 1437588 | integrated-location-100 | 14.90 | false | 2025-12-11T13:11:00 | 1001 | 2 |
| 102 | 6564397 | seasonal-location-101 | 18.85 | true | 2022-05-22T20:28:00 | 1002 | 3 |
| 103 | default_chart_a_tax_13 | regional-location-102 | 22.80 | false | 2023-10-06T03:45:00 | 1003 | 4 |

Scrubbing centers are the physical or virtual facilities where malicious traffic is diverted, filtered, and returned to the network. Each center has a `center_id`—for instance, `5844261` or `1437588`—and a `location` label such as `extended-location-99` or `integrated-location-100`. The `current_load_percent` field tracks real-time utilization, with values in the sample ranging from 10.95% to 22.80%. The `is_accepting_traffic` flag indicates whether the center is currently online and ready to receive diverted traffic. The `last_traffic_redirect` timestamp records when traffic was most recently rerouted to the center. Each scrubbing center row connects to a `d_do_s_attack_id` and an `athena_platform_id`, completing the chain from attack event through platform to scrubbing facility.

**Table `network_services`**

| id | service_id | service_name | ip_address | port | protocol | criticality_level | is_internet_facing | d_do_s_attack_id | forti_d_do_s_appliance_id | scrubbing_center_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 1996925 | Distributed Initiative | extended-ip-15 | 39 | seasonal-protocol-11 | low | false | 1000 | 1 | 100 |
| 2 | 3990164 | Adaptive Model D | integrated-ip-16 | 48 | regional-protocol-12 | medium | true | 1001 | 2 | 101 |
| 3 | 5844258 | Primary Cluster | seasonal-ip-17 | 57 | legacy-protocol-13 | high | false | 1002 | 3 | 102 |
| 4 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | Composite Review | regional-ip-18 | 66 | compact-protocol-14 | critical | true | 1003 | 4 | 103 |

Network services represent the actual production services under protection—web applications, APIs, or infrastructure endpoints. Each service has a `service_id` matching the Verisign service identifiers, a `service_name` such as `Distributed Initiative` or `Adaptive Model D`, and a network address defined by `ip_address` and `port` (values like `extended-ip-15` on port 39, or `regional-ip-18` on port 66). The `protocol` field uses labels like `seasonal-protocol-11` and `compact-protocol-14`. The `criticality_level` column classifies the service as `low`, `medium`, `high`, or `critical`. The `is_internet_facing` flag indicates whether the service is exposed to the public internet. Each network service row links to a `d_do_s_attack_id`, a `forti_d_do_s_appliance_id`, and a `scrubbing_center_id`, making it the central join point across the entire dataset.

**Table `mitigation_alerts`**

| mitigation_alert_id | alert_id | severity | threshold_exceeded | generated_date_time | is_acknowledged | status | forti_d_do_s_appliance_id | service_id | d_do_s_attack_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 2839509 | info | 7.70 | 2025-12-14T23:33:00 | true | pending | 1 | 1996925 | 1000 |
| 2 | 2087750 | warning | 9.40 | 2022-05-25T06:50:00 | false | evaluating | 2 | 3990164 | 1001 |
| 3 | 234 | critical | 11.10 | 2023-10-09T13:07:00 | true | mitigating | 3 | 5844258 | 1002 |
| 4 | 325444 | info | 12.80 | 2024-03-20T20:24:00 | false | resolved | 4 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | 1003 |

Mitigation alerts capture the operational events triggered when attacks are detected, escalated, or resolved. While the detailed columns of this table are injected by the payload block, the alerts serve as the operational log that ties together the attack, the appliance, and the service into a time-ordered sequence of events. They are the mechanism by which operators and automated systems track the lifecycle of each mitigation event.

The views in this dataset answer specific operational questions by joining these base tables. Each view represents a particular lens through which an operator might assess the state of the defense infrastructure.

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

This view answers the question: which network services are targeted by which DDoS attacks? By joining `d_do_s_attacks` with `network_services` on the attack identifier, the result maps each attack event to the specific service it impacts. For example, attack `7441144` (a layer-3 volumetric attack peaking at 23.70 Gbps) is associated with the network service `Distributed Initiative` on `extended-ip-15` at port 39. Similarly, attack `9085261` (a layer-3 slow-rate attack at 37.80 Gbps) targets the service `Composite Review` on `regional-ip-18` at port 66. This view is essential for capacity planning and for understanding which services are under the most pressure.

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

This view maps attacks to the Forti appliances assigned to defend them. Joining `d_do_s_attacks` with `forti_d_do_s_appliances` reveals the operational assignment of security devices to specific threats. Attack `7441144` is assigned to appliance `b_VB-IC-12` (a `composite-model-81` with 9.70 Gbps throughput), while attack `1450639` is handled by appliance `CH9UT3` (a `primary-model-82` with 11.40 Gbps throughput). This view is critical for assessing whether appliance capacity is sufficient for the attacks it faces.

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

This view connects Forti appliances to the network services they protect. The join between `forti_d_do_s_appliances` and `network_services` on the appliance identifier shows which security device is responsible for which production service. Appliance `b_VB-IC-12` protects the `Distributed Initiative` service, while appliance `CH9UT3` protects `Adaptive Model D`. This view helps operators understand the blast radius of any single appliance failure.

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

This view links Forti appliances to the Verisign services they support. By joining on the appliance identifier, the result shows which commercial service offering each appliance is configured to handle. Appliance `b_VB-IC-12` supports the `Baseline Initiative D` service with extended support, while appliance `CH9UT3` supports the `Distributed Model` service with integrated support. This view is useful for billing, SLA tracking, and support escalation.

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

This view provides a direct mapping of Forti appliances to the attacks they are defending. It is essentially the inverse of the attack-to-appliance view but organized from the appliance's perspective. Appliance `b_VB-IC-12` is defending attack `7441144`, a volumetric layer-3 attack, while appliance `790487` is defending attack `9085260`, a layer-7 protocol attack. This view is the primary operational dashboard for security teams monitoring appliance workload.

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

This view presents the relationship from the Verisign service perspective, showing which Forti appliance backs each service. Service `Baseline Initiative D` is backed by appliance `b_VB-IC-12`, and service `Distributed Model` is backed by appliance `CH9UT3`. This view is useful for service-level reporting and for understanding the dependency chain from commercial offering to physical infrastructure.

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

This view connects Verisign services to the Athena platforms that provide their regional capacity. Service `Baseline Initiative D` runs on platform `state_uk_28` in the `distributed-region-12` region with 7.45 TBps capacity, while service `Distributed Model` runs on platform `e6ce01fe-8fc3-11eb-924d-9cd76263cbd0` in the `baseline-region-13` region with 9.90 TBps capacity. This view is essential for capacity planning and for understanding regional distribution of service load.

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

This view maps Verisign services to the attacks they are associated with. Service `Baseline Initiative D` is linked to attack `7441144`, and service `Adaptive Cluster` is linked to attack `9085260`. This view helps correlate service health with attack events and is useful for post-incident analysis.

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

This view connects Athena platforms to the scrubbing centers they feed into. Platform `state_uk_28` is linked to scrubbing center `5844261` at `extended-location-99`, while platform `e6ce01fe-8fc3-11eb-924d-9cd76263cbd0` is linked to center `1437588` at `integrated-location-100`. This view is critical for understanding the traffic flow path from regional platform to scrubbing facility.

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

This view maps scrubbing centers to the attacks they are processing. Center `5844261` is handling attack `7441144`, and center `1437588` is handling attack `1450639`. This view is essential for monitoring scrubbing center utilization and for ensuring that traffic diversion is correctly routed during active attacks.

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

This view presents the relationship from the scrubbing center perspective, showing which Athena platform each center serves. Center `5844261` serves platform `state_uk_28`, and center `1437588` serves platform `e6ce01fe-8fc3-11eb-924d-9cd76263cbd0`. This view helps operators understand the upstream capacity dependencies of each scrubbing facility.

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

This view joins network services with their associated attacks, providing a service-centric view of the threat landscape. Service `Distributed Initiative` is under attack from `7441144`, while service `Adaptive Model D` is under attack from `1450639`. This view is the primary reference for service owners assessing their exposure.

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

This view connects network services to the Forti appliances protecting them. Service `Distributed Initiative` is protected by appliance `b_VB-IC-12`, and service `Adaptive Model D` is protected by appliance `CH9UT3`. This view is essential for understanding the protection chain and for planning failover scenarios.

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

This view links network services to the scrubbing centers that process their diverted traffic. Service `Distributed Initiative` routes through center `5844261`, while service `Adaptive Model D` routes through center `1437588`. This view is critical for capacity planning at the scrubbing layer and for understanding traffic diversion paths.

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

This view connects mitigation alerts to the Forti appliances that generated or are associated with them. It provides an operational timeline of alert events mapped to specific security devices, enabling operators to correlate appliance health with alert volume and to identify appliances that may be generating excessive alerts or failing to respond.

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

This view links mitigation alerts to the Verisign services they impact. It allows operators to assess which service offerings are experiencing the most alert activity and to prioritize response efforts based on service criticality and support level.

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

This view maps mitigation alerts to the specific DDoS attacks they reference. It provides the operational log that ties alert events to attack identifiers, enabling post-incident analysis and correlation between alert patterns and attack characteristics.

The dataset as a whole forms a coherent operational model of DDoS defense infrastructure. Attacks are classified and measured, appliances are provisioned and monitored, services are cataloged and supported, platforms provide regional capacity, scrubbing centers absorb and cleanse traffic, and network services represent the production endpoints under protection. The views weave these elements together into answerable questions: which service is under attack, which appliance defends it, which platform provides capacity, and which scrubbing center processes the diverted traffic. Together, the tables and views form a complete record of the mitigation ecosystem, enabling operators to assess capacity, track incidents, plan failover, and maintain the integrity of the defense architecture.