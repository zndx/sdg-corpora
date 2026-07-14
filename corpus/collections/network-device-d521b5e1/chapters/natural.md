## Network Infrastructure Governance and Service Delivery

Modern network operations demand a structured approach to managing the interplay between physical devices, contractual service commitments, traffic prioritization, admission control, resource allocation, and continuous performance measurement. An organization's infrastructure portfolio consists of routers, switches, firewalls, and servers, each operating under defined firmware baselines and connected to service level agreements that codify the quality of service expected by customers. Traffic flowing through these devices is classified, shaped, and governed by admission controls that decide whether new flows can be accommodated without degrading existing commitments. Resource management systems continuously optimize capacity against those commitments, while performance metrics provide the empirical evidence needed to validate whether the network is delivering on its promises.

The foundation of this operational model rests on six interconnected record types that capture the state of the infrastructure at any given moment.

**Table `network_devices`**

| network_device_id | device_id | device_type | ip_address | firmware_version | status | last_heartbeat | service_level_agreement_id | performance_metric_id |
|---|---|---|---|---|---|---|---|---|
| 100 | 3744015 | router | extended-ip-15 | distributed-firmware-48 | active | 2022-09-07T20:36:00 | 100 | 100 |
| 101 | 392495 | switch | integrated-ip-16 | baseline-firmware-49 | inactive | 2023-02-18T03:53:00 | 101 | 101 |
| 102 | 209205 | firewall | seasonal-ip-17 | pilot-firmware-50 | maintenance | 2024-07-02T10:10:00 | 102 | 102 |
| 103 | 22106999 | server | regional-ip-18 | extended-firmware-51 | active | 2025-12-13T17:27:00 | 103 | 103 |

The network devices table records the physical and logical endpoints that form the operational backbone. Each entry carries a unique device identifier, a type classification, and an IP address that may be a concrete numeric address or a symbolic label such as `extended-ip-15` or `regional-ip-18`. Firmware versions follow a consistent naming convention—`distributed-firmware-48`, `baseline-firmware-49`, `pilot-firmware-50`, and `extended-firmware-51`—indicating the software baseline currently deployed. The status field tracks the operational posture of each device: `active` devices like the router at `network_device_id` 100 and the server at 103 are fully operational, while the switch at 101 sits in `inactive` status and the firewall at 102 is under `maintenance`. The `last_heartbeat` column provides a timestamp of the most recent communication, ranging from September 2022 through December 2025, giving operators a clear picture of device responsiveness. Each device is linked to a service level agreement and a performance metric, anchoring it within the broader governance framework.

**Table `service_level_agreements`**

| service_level_agreement_id | sla_id | provider_id | customer_class | max_bandwidth | latency_threshold | packet_loss_limit | effective_date | expiration_date | traffic_class_id | resource_management_system_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 100 | 9568441 | 3717633 | gold | 13.95 | 5.70 | 5.20 | 2023-02-14 | 2025-08-18 | 1 | 1000 |
| 101 | 884346 | ChIJYRd8uPtt5kcRunQjrWb4IKs | silver | 16.90 | 7.40 | 9.40 | 2024-07-25 | 2022-01-02 | 2 | 1001 |
| 102 | 9424932 | 8928519 | bronze | 19.85 | 9.10 | 13.60 | 2025-12-09 | 2023-06-13 | 3 | 1002 |
| 103 | 7731866 | lu_tax_code_template_m13 | gold | 22.80 | 10.80 | 17.80 | 2022-05-20 | 2024-11-24 | 4 | 1003 |

Service level agreements formalize the quality-of-service commitments between providers and customers. The agreements table captures the contractual parameters: `gold`, `silver`, and `bronze` customer classes map to progressively more generous bandwidth allowances and relaxed latency thresholds. Agreement 100, classified as `gold`, specifies a maximum bandwidth of 13.95 units and a latency threshold of 5.70, with a packet loss limit of 5.20, and is effective from February 2023 through August 2025. Agreement 101, a `silver` tier, permits 16.90 bandwidth with a 7.40 latency threshold. The `bronze` agreement 102 allows 19.85 bandwidth and 9.10 latency, while the second `gold` agreement 103 offers the most generous parameters at 22.80 bandwidth and 10.80 latency. Provider identifiers range from numeric codes like `3717633` to structured identifiers such as `ChIJYRd8uPtt5kcRunQjrWb4IKs` and tax code templates like `lu_tax_code_template_m13`, reflecting the diverse nature of service providers in the ecosystem. Each agreement references a traffic class and a resource management system, creating the contractual bridge between traffic handling and capacity optimization.

**Table `traffic_classes`**

| id | traffic_class_id | dscp_code | priority_level | bandwidth_allocation | max_latency | jitter_tolerance | network_device_id | service_level_agreement_id | call_admission_control_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 20963968 | 20 | 22 | 4.70 | 17.70 | 11.95 | 100 | 100 | 1 |
| 2 | IVC20det50 | 24 | 25 | 7.40 | 22.40 | 13.90 | 101 | 101 | 2 |
| 3 | c747f9a8-8fcc-11eb-924d-9cd76263cbd0 | 28 | 28 | 10.10 | 27.10 | 15.85 | 102 | 102 | 3 |
| 4 | 9125622 | 32 | 31 | 12.80 | 31.80 | 17.80 | 103 | 103 | 4 |

Traffic classes define how different categories of network traffic are prioritized and shaped. Each class carries a DSCP code—20, 24, 28, and 32—that determines the per-hop forwarding behavior at network equipment. The priority levels, ranging from 22 to 31, establish the relative importance of each class within the scheduling hierarchy. Bandwidth allocations increase progressively from 4.70 for the lowest-priority class to 12.80 for the highest. Maximum latency tolerances scale from 17.70 to 31.80, and jitter tolerances from 11.95 to 17.80, reflecting the trade-off between priority and strictness. The traffic class identifiers themselves vary in format: numeric values like `20963968` and `9125622`, structured identifiers like `IVC20det50`, and UUIDs such as `c747f9a8-8fcc-11eb-924d-9cd76263cbd0`. Each traffic class is associated with a specific network device, service level agreement, and call admission control, forming a complete chain of traffic governance.

**Table `call_admission_controls`**

| call_admission_control_id | cac_id | algorithm_type | current_load | threshold_utilization | decision_status | timestamp | traffic_class_id | service_level_agreement_id | resource_management_system_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 4793475 | per-flow | 20.95 | 5.20 | admitted | 2024-07-08T18:18:00 | 1 | 100 | 1000 |
| 2 | 3001009030250 | aggregate | 22.90 | 8.40 | rejected | 2025-12-19T01:35:00 | 2 | 101 | 1001 |
| 3 | 605946 | dynamic | 24.85 | 11.60 | pending | 2022-05-03T08:52:00 | 3 | 102 | 1002 |
| 4 | 32811 | per-flow | 26.80 | 14.80 | admitted | 2023-10-14T15:09:00 | 4 | 103 | 1003 |

Call admission controls enforce the gatekeeping function that determines whether new traffic flows can be accepted without violating existing commitments. The algorithm types—`per-flow`, `aggregate`, and `dynamic`—represent different strategies for evaluating resource availability. The `per-flow` algorithm, used in controls 1 and 4, evaluates each individual flow against the threshold. The `aggregate` approach in control 2 considers the total load across all flows, while the `dynamic` algorithm in control 3 adapts its evaluation criteria over time. Current load values range from 20.95 to 26.80, while threshold utilization values—5.20, 8.40, 11.60, and 14.80—represent the utilization levels at which admission decisions are triggered. The decision status field records the outcome: `admitted` for controls 1 and 4, `rejected` for control 2, and `pending` for control 3. Timestamps span from May 2022 to December 2025, providing an audit trail of admission decisions. Each control is tied to a traffic class, service level agreement, and resource management system.

**Table `resource_management_systems`**

| resource_management_system_id | rms_id | system_version | optimization_goal | total_capacity | allocated_capacity | last_optimization_run | service_level_agreement_id | performance_metric_id |
|---|---|---|---|---|---|---|---|---|
| 1000 | id_23 | seasonal-system-41 | revenue | 22.45 | 15.45 | 2024-11-02T22:06:00 | 100 | 100 |
| 1001 | 10238280 | regional-system-42 | utilization | 25.90 | 18.90 | 2025-04-13T05:23:00 | 101 | 101 |
| 1002 | 4985156 | legacy-system-43 | latency | 29.35 | 22.35 | 2022-09-24T12:40:00 | 102 | 102 |
| 1003 | 5082963 | compact-system-44 | revenue | 32.80 | 25.80 | 2023-02-08T19:57:00 | 103 | 103 |

Resource management systems provide the optimization engine that allocates and reclaims capacity across the infrastructure. System versions follow a descriptive naming pattern: `seasonal-system-41`, `regional-system-42`, `legacy-system-43`, and `compact-system-44`. The optimization goals—`revenue`, `utilization`, and `latency`—define the primary objective of each system. Total capacity values range from 22.45 to 32.80, while allocated capacity ranges from 15.45 to 25.80, indicating the proportion of resources currently committed. The last optimization run timestamps provide visibility into how recently each system has recalculated its allocation strategy. Each resource management system is linked to a service level agreement and a performance metric, ensuring that optimization decisions are grounded in measurable outcomes.

**Table `performance_metrics`**

| id | metric_id | metric_type | value | unit | sample_time | source_device_id | network_device_id | service_level_agreement_id | resource_management_system_id |
|---|---|---|---|---|---|---|---|---|---|
| 100 | 3744010 | bandwidth | 19.95 | Mbps | 2022-01-13T12:48:00 | 14827 | 100 | 100 | 1000 |
| 101 | 136630a8-8fcc-11eb-924d-9cd76263cbd0 | latency | 21.90 | ms | 2023-06-24T19:05:00 | 468 | 101 | 101 | 1001 |
| 102 | 2986226 | packetLoss | 23.85 | percent | 2024-11-08T02:22:00 | 3355789 | 102 | 102 | 1002 |
| 103 | 2002007020010 | jitter | 25.80 | Mbps | 2025-04-19T09:39:00 | 2002007020050 | 103 | 103 | 1003 |

Performance metrics supply the empirical data that validates whether the network is meeting its commitments. The metric types—`bandwidth`, `latency`, `packetLoss`, and `jitter`—correspond to the fundamental dimensions of network quality. Values range from 19.95 Mbps for bandwidth to 25.80 Mbps for jitter, with units varying by metric type. Sample times span from January 2022 to April 2025, providing a temporal record of network behavior. Source device identifiers range from small numeric values like `468` to large identifiers like `3744010` and `2002007020010`. Each metric is associated with a network device, service level agreement, and resource management system, creating a complete chain from measurement to governance.

The power of this operational model emerges when these records are joined into analytical views that answer specific operational questions.

**View `vw_network_device_service_level_agreement`**

```sql
CREATE VIEW vw_network_device_service_level_agreement AS
SELECT a.network_device_id, a.device_id, a.device_type, a.ip_address, b.service_level_agreement_id AS agreement_service_level_agreement_id, b.sla_id AS agreement_sla_id, b.provider_id AS agreement_provider_id
FROM network_devices a JOIN service_level_agreements b ON a.service_level_agreement_id = b.service_level_agreement_id;
```

| network_device_id | device_id | device_type | ip_address | agreement_service_level_agreement_id | agreement_sla_id | agreement_provider_id |
|---|---|---|---|---|---|---|
| 100 | 3744015 | router | extended-ip-15 | 100 | 9568441 | 3717633 |
| 101 | 392495 | switch | integrated-ip-16 | 101 | 884346 | ChIJYRd8uPtt5kcRunQjrWb4IKs |
| 102 | 209205 | firewall | seasonal-ip-17 | 102 | 9424932 | 8928519 |
| 103 | 22106999 | server | regional-ip-18 | 103 | 7731866 | lu_tax_code_template_m13 |

This view answers which service level agreements apply to each network device, joining device records with their associated agreements. The router at `device_id` 3744015 operates under the `gold` agreement 100 with a 5.70 latency threshold, while the switch at `device_id` 392495 is bound to the `silver` agreement 101 with a 7.40 latency threshold. The firewall at `device_id` 209205 falls under the `bronze` agreement 102, and the server at `device_id` 22106999 is covered by the second `gold` agreement 103. This join enables operators to quickly assess whether a device's operational status aligns with its contractual obligations.

**View `vw_network_device_performance_metric`**

```sql
CREATE VIEW vw_network_device_performance_metric AS
SELECT a.network_device_id, a.device_id, a.device_type, a.ip_address, b.id AS metric_id, b.metric_id AS metric_metric_id, b.metric_type AS metric_metric_type
FROM network_devices a JOIN performance_metrics b ON a.performance_metric_id = b.id;
```

| network_device_id | device_id | device_type | ip_address | metric_id | metric_metric_id | metric_metric_type |
|---|---|---|---|---|---|---|
| 100 | 3744015 | router | extended-ip-15 | 100 | 3744010 | bandwidth |
| 101 | 392495 | switch | integrated-ip-16 | 101 | 136630a8-8fcc-11eb-924d-9cd76263cbd0 | latency |
| 102 | 209205 | firewall | seasonal-ip-17 | 102 | 2986226 | packetLoss |
| 103 | 22106999 | server | regional-ip-18 | 103 | 2002007020010 | jitter |

This view correlates each network device with its current performance measurement, enabling direct comparison between device state and measured quality. The router at `device_id` 3744015 has a bandwidth measurement of 19.95 Mbps recorded on January 13, 2022. The switch at `device_id` 392495 shows a latency measurement of 21.90 ms from June 24, 2023. The firewall at `device_id` 209205 has a packet loss measurement of 23.85 percent from November 8, 2024, and the server at `device_id` 22106999 has a jitter measurement of 25.80 Mbps from April 19, 2025. This join allows operators to identify devices whose measured performance may be drifting from their service level commitments.

**View `vw_service_level_agreement_network_device_detail`**

```sql
CREATE VIEW vw_service_level_agreement_network_device_detail AS
SELECT a.service_level_agreement_id, a.sla_id, a.provider_id, b.network_device_id AS device_network_device_id, b.device_id AS device_device_id, b.device_type AS device_device_type
FROM service_level_agreements a
  JOIN agreements_devices j ON j.service_level_agreement_id = a.service_level_agreement_id
  JOIN network_devices b ON b.network_device_id = j.network_device_id;
```

| service_level_agreement_id | sla_id | provider_id | device_network_device_id | device_device_id | device_device_type |
|---|---|---|---|---|---|
| 100 | 9568441 | 3717633 | 100 | 3744015 | router |
| 100 | 9568441 | 3717633 | 101 | 392495 | switch |
| 101 | 884346 | ChIJYRd8uPtt5kcRunQjrWb4IKs | 101 | 392495 | switch |
| 101 | 884346 | ChIJYRd8uPtt5kcRunQjrWb4IKs | 102 | 209205 | firewall |
| 102 | 9424932 | 8928519 | 102 | 209205 | firewall |
| 102 | 9424932 | 8928519 | 103 | 22106999 | server |
| 103 | 7731866 | lu_tax_code_template_m13 | 103 | 22106999 | server |
| 103 | 7731866 | lu_tax_code_template_m13 | 100 | 3744015 | router |

This view provides a detailed profile of each service level agreement by joining it with the network devices it covers. Agreement 100, the `gold` tier with 13.95 maximum bandwidth and 5.70 latency threshold, is associated with the active router at `device_id` 3744015 running `distributed-firmware-48`. Agreement 101, the `silver` tier, covers the inactive switch at `device_id` 392495 running `baseline-firmware-49`. Agreement 102, the `bronze` tier, applies to the firewall at `device_id` 209205 under `maintenance` with `pilot-firmware-50`. Agreement 103, the second `gold` tier, governs the server at `device_id` 22106999 running `extended-firmware-51`. This join is essential for capacity planning, as it reveals which devices are responsible for delivering each tier of service.

**View `vw_service_level_agreement_traffic_class`**

```sql
CREATE VIEW vw_service_level_agreement_traffic_class AS
SELECT a.service_level_agreement_id, a.sla_id, a.provider_id, a.customer_class, b.id AS class_id, b.traffic_class_id AS class_traffic_class_id, b.dscp_code AS class_dscp_code
FROM service_level_agreements a JOIN traffic_classes b ON a.traffic_class_id = b.id;
```

| service_level_agreement_id | sla_id | provider_id | customer_class | class_id | class_traffic_class_id | class_dscp_code |
|---|---|---|---|---|---|---|
| 100 | 9568441 | 3717633 | gold | 1 | 20963968 | 20 |
| 101 | 884346 | ChIJYRd8uPtt5kcRunQjrWb4IKs | silver | 2 | IVC20det50 | 24 |
| 102 | 9424932 | 8928519 | bronze | 3 | c747f9a8-8fcc-11eb-924d-9cd76263cbd0 | 28 |
| 103 | 7731866 | lu_tax_code_template_m13 | gold | 4 | 9125622 | 32 |

This view links service level agreements to their associated traffic classes, revealing how contractual commitments translate into traffic handling policies. The `gold` agreement 100 is paired with traffic class 1, which has a DSCP code of 20, priority level 22, and a bandwidth allocation of 4.70. The `silver` agreement 101 maps to traffic class 2 with DSCP code 24 and priority level 25. The `bronze` agreement 102 corresponds to traffic class 3 with DSCP code 28 and priority level 28. The second `gold` agreement 103 is associated with traffic class 4, carrying DSCP code 32 and priority level 31. This join demonstrates how higher-priority traffic classes are assigned to premium service tiers.

**View `vw_service_level_agreement_resource_management_system`**

```sql
CREATE VIEW vw_service_level_agreement_resource_management_system AS
SELECT a.service_level_agreement_id, a.sla_id, a.provider_id, a.customer_class, b.resource_management_system_id AS system_resource_management_system_id, b.rms_id AS system_rms_id, b.system_version AS system_system_version
FROM service_level_agreements a JOIN resource_management_systems b ON a.resource_management_system_id = b.resource_management_system_id;
```

| service_level_agreement_id | sla_id | provider_id | customer_class | system_resource_management_system_id | system_rms_id | system_system_version |
|---|---|---|---|---|---|---|
| 100 | 9568441 | 3717633 | gold | 1000 | id_23 | seasonal-system-41 |
| 101 | 884346 | ChIJYRd8uPtt5kcRunQjrWb4IKs | silver | 1001 | 10238280 | regional-system-42 |
| 102 | 9424932 | 8928519 | bronze | 1002 | 4985156 | legacy-system-43 |
| 103 | 7731866 | lu_tax_code_template_m13 | gold | 1003 | 5082963 | compact-system-44 |

This view connects service level agreements to the resource management systems responsible for optimizing their capacity. Agreement 100 is managed by the `seasonal-system-41` (system 1000), which optimizes for `revenue` with a total capacity of 22.45 and allocated capacity of 15.45. Agreement 101 is handled by `regional-system-42` (system 1001), targeting `utilization` with 25.90 total and 18.90 allocated capacity. Agreement 102 is overseen by `legacy-system-43` (system 1002), optimizing for `latency` with 29.35 total and 22.35 allocated capacity. Agreement 103 is managed by `compact-system-44` (system 1003), again targeting `revenue` with 32.80 total and 25.80 allocated capacity. This join reveals the allocation efficiency of each system, with utilization rates ranging from approximately 69% to 76%.

**View `vw_traffic_class_network_device`**

```sql
CREATE VIEW vw_traffic_class_network_device AS
SELECT a.id, a.traffic_class_id, a.dscp_code, a.priority_level, b.network_device_id AS device_network_device_id, b.device_id AS device_device_id, b.device_type AS device_device_type
FROM traffic_classes a JOIN network_devices b ON a.network_device_id = b.network_device_id;
```

| id | traffic_class_id | dscp_code | priority_level | device_network_device_id | device_device_id | device_device_type |
|---|---|---|---|---|---|---|
| 1 | 20963968 | 20 | 22 | 100 | 3744015 | router |
| 2 | IVC20det50 | 24 | 25 | 101 | 392495 | switch |
| 3 | c747f9a8-8fcc-11eb-924d-9cd76263cbd0 | 28 | 28 | 102 | 209205 | firewall |
| 4 | 9125622 | 32 | 31 | 103 | 22106999 | server |

This view associates traffic classes with the network devices that handle them, clarifying the physical infrastructure responsible for each traffic priority. Traffic class 1 (DSCP 20, priority 22) is handled by the active router at `device_id` 3744015. Traffic class 2 (DSCP 24, priority 25) is managed by the inactive switch at `device_id` 392495. Traffic class 3 (DSCP 28, priority 28) is processed by the firewall at `device_id` 209205 under `maintenance`. Traffic class 4 (DSCP 32, priority 31) is served by the active server at `device_id` 22106999. This join is critical for troubleshooting, as it identifies which device is responsible for a given traffic priority.

**View `vw_traffic_class_service_level_agreement`**

```sql
CREATE VIEW vw_traffic_class_service_level_agreement AS
SELECT a.id, a.traffic_class_id, a.dscp_code, a.priority_level, b.service_level_agreement_id AS agreement_service_level_agreement_id, b.sla_id AS agreement_sla_id, b.provider_id AS agreement_provider_id
FROM traffic_classes a JOIN service_level_agreements b ON a.service_level_agreement_id = b.service_level_agreement_id;
```

| id | traffic_class_id | dscp_code | priority_level | agreement_service_level_agreement_id | agreement_sla_id | agreement_provider_id |
|---|---|---|---|---|---|---|
| 1 | 20963968 | 20 | 22 | 100 | 9568441 | 3717633 |
| 2 | IVC20det50 | 24 | 25 | 101 | 884346 | ChIJYRd8uPtt5kcRunQjrWb4IKs |
| 3 | c747f9a8-8fcc-11eb-924d-9cd76263cbd0 | 28 | 28 | 102 | 9424932 | 8928519 |
| 4 | 9125622 | 32 | 31 | 103 | 7731866 | lu_tax_code_template_m13 |

This view maps traffic classes to their governing service level agreements, showing how traffic handling policies are anchored to contractual commitments. Traffic class 1 with its 4.70 bandwidth allocation and 17.70 maximum latency is governed by the `gold` agreement 100. Traffic class 2, with 7.40 bandwidth allocation and 22.40 maximum latency, falls under the `silver` agreement 101. Traffic class 3, offering 10.10 bandwidth and 27.10 maximum latency, is covered by the `bronze` agreement 102. Traffic class 4, with the highest bandwidth allocation of 12.80 and maximum latency of 31.80, is managed by the second `gold` agreement 103. This join illustrates the relationship between traffic class generosity and service tier.

**View `vw_traffic_class_call_admission_control`**

```sql
CREATE VIEW vw_traffic_class_call_admission_control AS
SELECT a.id, a.traffic_class_id, a.dscp_code, a.priority_level, b.call_admission_control_id AS control_call_admission_control_id, b.cac_id AS control_cac_id, b.algorithm_type AS control_algorithm_type
FROM traffic_classes a JOIN call_admission_controls b ON a.call_admission_control_id = b.call_admission_control_id;
```

| id | traffic_class_id | dscp_code | priority_level | control_call_admission_control_id | control_cac_id | control_algorithm_type |
|---|---|---|---|---|---|---|
| 1 | 20963968 | 20 | 22 | 1 | 4793475 | per-flow |
| 2 | IVC20det50 | 24 | 25 | 2 | 3001009030250 | aggregate |
| 3 | c747f9a8-8fcc-11eb-924d-9cd76263cbd0 | 28 | 28 | 3 | 605946 | dynamic |
| 4 | 9125622 | 32 | 31 | 4 | 32811 | per-flow |

This view links traffic classes to their call admission controls, revealing how admission policies are tailored to different traffic priorities. Traffic class 1 is governed by call admission control 1, which uses the `per-flow` algorithm with a current load of 20.95 and threshold utilization of 5.20, resulting in an `admitted` decision. Traffic class 2 is managed by control 2, using the `aggregate` algorithm with a load of 22.90 and threshold of 8.40, resulting in a `rejected` decision. Traffic class 3 is handled by control 3, employing the `dynamic` algorithm with a load of 24.85 and threshold of 11.60, with a `pending` decision. Traffic class 4 is overseen by control 4, using `per-flow` with a load of 26.80 and threshold of 14.80, resulting in `admitted`. This join highlights how admission decisions vary across traffic classes and algorithms.

**View `vw_call_admission_control_traffic_class`**

```sql
CREATE VIEW vw_call_admission_control_traffic_class AS
SELECT a.call_admission_control_id, a.cac_id, a.algorithm_type, a.current_load, b.id AS class_id, b.traffic_class_id AS class_traffic_class_id, b.dscp_code AS class_dscp_code
FROM call_admission_controls a JOIN traffic_classes b ON a.traffic_class_id = b.id;
```

| call_admission_control_id | cac_id | algorithm_type | current_load | class_id | class_traffic_class_id | class_dscp_code |
|---|---|---|---|---|---|---|
| 1 | 4793475 | per-flow | 20.95 | 1 | 20963968 | 20 |
| 2 | 3001009030250 | aggregate | 22.90 | 2 | IVC20det50 | 24 |
| 3 | 605946 | dynamic | 24.85 | 3 | c747f9a8-8fcc-11eb-924d-9cd76263cbd0 | 28 |
| 4 | 32811 | per-flow | 26.80 | 4 | 9125622 | 32 |

This view presents call admission controls from the perspective of their associated traffic classes, providing a traffic-centric view of admission governance. Control 1, using the `per-flow` algorithm, admits traffic class 1 (DSCP 20, priority 22) with a current load of 20.95 against a threshold of 5.20. Control 2, using the `aggregate` algorithm, rejects traffic class 2 (DSCP 24, priority 25) with a load of 22.90 against a threshold of 8.40. Control 3, using the `dynamic` algorithm, has a pending decision for traffic class 3 (DSCP 28, priority 28) with a load of 24.85 and threshold of 11.60. Control 4, also `per-flow`, admits traffic class 4 (DSCP 32, priority 31) with a load of 26.80 against a threshold of 14.80. This join is useful for understanding why certain traffic classes are being admitted while others are rejected.

**View `vw_call_admission_control_service_level_agreement`**

```sql
CREATE VIEW vw_call_admission_control_service_level_agreement AS
SELECT a.call_admission_control_id, a.cac_id, a.algorithm_type, a.current_load, b.service_level_agreement_id AS agreement_service_level_agreement_id, b.sla_id AS agreement_sla_id, b.provider_id AS agreement_provider_id
FROM call_admission_controls a JOIN service_level_agreements b ON a.service_level_agreement_id = b.service_level_agreement_id;
```

| call_admission_control_id | cac_id | algorithm_type | current_load | agreement_service_level_agreement_id | agreement_sla_id | agreement_provider_id |
|---|---|---|---|---|---|---|
| 1 | 4793475 | per-flow | 20.95 | 100 | 9568441 | 3717633 |
| 2 | 3001009030250 | aggregate | 22.90 | 101 | 884346 | ChIJYRd8uPtt5kcRunQjrWb4IKs |
| 3 | 605946 | dynamic | 24.85 | 102 | 9424932 | 8928519 |
| 4 | 32811 | per-flow | 26.80 | 103 | 7731866 | lu_tax_code_template_m13 |

This view connects call admission controls to their governing service level agreements, showing how admission decisions are evaluated against contractual commitments. Control 1 evaluates traffic against the `gold` agreement 100, admitting the flow with a load of 20.95. Control 2 evaluates against the `silver` agreement 101, rejecting the flow with a load of 22.90. Control 3 evaluates against the `bronze` agreement 102, with a pending decision and a load of 24.85. Control 4 evaluates against the second `gold` agreement 103, admitting the flow with a load of 26.80. This join enables operators to assess whether admission decisions are consistent with the quality of service promised in each agreement.

**View `vw_call_admission_control_resource_management_system`**

```sql
CREATE VIEW vw_call_admission_control_resource_management_system AS
SELECT a.call_admission_control_id, a.cac_id, a.algorithm_type, a.current_load, b.resource_management_system_id AS system_resource_management_system_id, b.rms_id AS system_rms_id, b.system_version AS system_system_version
FROM call_admission_controls a JOIN resource_management_systems b ON a.resource_management_system_id = b.resource_management_system_id;
```

| call_admission_control_id | cac_id | algorithm_type | current_load | system_resource_management_system_id | system_rms_id | system_system_version |
|---|---|---|---|---|---|---|
| 1 | 4793475 | per-flow | 20.95 | 1000 | id_23 | seasonal-system-41 |
| 2 | 3001009030250 | aggregate | 22.90 | 1001 | 10238280 | regional-system-42 |
| 3 | 605946 | dynamic | 24.85 | 1002 | 4985156 | legacy-system-43 |
| 4 | 32811 | per-flow | 26.80 | 1003 | 5082963 | compact-system-44 |

This view links call admission controls to the resource management systems that provide capacity data for admission decisions. Control 1 draws capacity information from `seasonal-system-41` (system 1000), which has 15.45 of 22.45 total capacity allocated. Control 2 uses `regional-system-42` (system 1001), with 18.90 of 25.90 allocated. Control 3 relies on `legacy-system-43` (system 1002), with 22.35 of 29.35 allocated. Control 4 uses `compact-system-44` (system 1003), with 25.80 of 32.80 allocated. This join is essential for understanding the capacity context in which admission decisions are made.

**View `vw_resource_management_system_network_device_detail`**

```sql
CREATE VIEW vw_resource_management_system_network_device_detail AS
SELECT a.resource_management_system_id, a.rms_id, a.system_version, b.network_device_id AS device_network_device_id, b.device_id AS device_device_id, b.device_type AS device_device_type
FROM resource_management_systems a
  JOIN systems_devices j ON j.resource_management_system_id = a.resource_management_system_id
  JOIN network_devices b ON b.network_device_id = j.network_device_id;
```

| resource_management_system_id | rms_id | system_version | device_network_device_id | device_device_id | device_device_type |
|---|---|---|---|---|---|
| 1000 | id_23 | seasonal-system-41 | 100 | 3744015 | router |
| 1000 | id_23 | seasonal-system-41 | 101 | 392495 | switch |
| 1001 | 10238280 | regional-system-42 | 101 | 392495 | switch |
| 1001 | 10238280 | regional-system-42 | 102 | 209205 | firewall |
| 1002 | 4985156 | legacy-system-43 | 102 | 209205 | firewall |
| 1002 | 4985156 | legacy-system-43 | 103 | 22106999 | server |
| 1003 | 5082963 | compact-system-44 | 103 | 22106999 | server |
| 1003 | 5082963 | compact-system-44 | 100 | 3744015 | router |

This view provides a detailed profile of each resource management system by joining it with the network devices it manages. System 1000 (`seasonal-system-41`), optimizing for `revenue`, manages the active router at `device_id` 3744015. System 1001 (`regional-system-42`), targeting `utilization`, oversees the inactive switch at `device_id` 392495. System 1002 (`legacy-system-43`), optimizing for `latency`, handles the firewall at `device_id` 209205 under `maintenance`. System 1003 (`compact-system-44`), again targeting `revenue`, manages the active server at `device_id` 22106999. This join helps operators understand which systems are responsible for which devices and whether the optimization goals align with device operational status.

**View `vw_resource_management_system_service_level_agreement`**

```sql
CREATE VIEW vw_resource_management_system_service_level_agreement AS
SELECT a.resource_management_system_id, a.rms_id, a.system_version, a.optimization_goal, b.service_level_agreement_id AS agreement_service_level_agreement_id, b.sla_id AS agreement_sla_id, b.provider_id AS agreement_provider_id
FROM resource_management_systems a JOIN service_level_agreements b ON a.service_level_agreement_id = b.service_level_agreement_id;
```

| resource_management_system_id | rms_id | system_version | optimization_goal | agreement_service_level_agreement_id | agreement_sla_id | agreement_provider_id |
|---|---|---|---|---|---|---|
| 1000 | id_23 | seasonal-system-41 | revenue | 100 | 9568441 | 3717633 |
| 1001 | 10238280 | regional-system-42 | utilization | 101 | 884346 | ChIJYRd8uPtt5kcRunQjrWb4IKs |
| 1002 | 4985156 | legacy-system-43 | latency | 102 | 9424932 | 8928519 |
| 1003 | 5082963 | compact-system-44 | revenue | 103 | 7731866 | lu_tax_code_template_m13 |

This view connects resource management systems to their governing service level agreements, showing how capacity optimization is tied to contractual obligations. System 1000 optimizes for `revenue` under the `gold` agreement 100, with 15.45 of 22.45 capacity allocated. System 1001 targets `utilization` under the `silver` agreement 101, with 18.90 of 25.90 allocated. System 1002 optimizes for `latency` under the `bronze` agreement 102, with 22.35 of 29.35 allocated. System 1003 targets `revenue` under the second `gold` agreement 103, with 25.80 of 32.80 allocated. This join reveals how different optimization goals are applied across service tiers.

**View `vw_resource_management_system_call_admission_control_detail`**

```sql
CREATE VIEW vw_resource_management_system_call_admission_control_detail AS
SELECT a.resource_management_system_id, a.rms_id, a.system_version, b.call_admission_control_id AS control_call_admission_control_id, b.cac_id AS control_cac_id, b.algorithm_type AS control_algorithm_type
FROM resource_management_systems a
  JOIN systems_controls j ON j.resource_management_system_id = a.resource_management_system_id
  JOIN call_admission_controls b ON b.call_admission_control_id = j.call_admission_control_id;
```

| resource_management_system_id | rms_id | system_version | control_call_admission_control_id | control_cac_id | control_algorithm_type |
|---|---|---|---|---|---|
| 1000 | id_23 | seasonal-system-41 | 1 | 4793475 | per-flow |
| 1000 | id_23 | seasonal-system-41 | 2 | 3001009030250 | aggregate |
| 1001 | 10238280 | regional-system-42 | 2 | 3001009030250 | aggregate |
| 1001 | 10238280 | regional-system-42 | 3 | 605946 | dynamic |
| 1002 | 4985156 | legacy-system-43 | 3 | 605946 | dynamic |
| 1002 | 4985156 | legacy-system-43 | 4 | 32811 | per-flow |
| 1003 | 5082963 | compact-system-44 | 4 | 32811 | per-flow |
| 1003 | 5082963 | compact-system-44 | 1 | 4793475 | per-flow |

This view presents resource management systems alongside their associated call admission controls, showing how capacity data feeds admission decisions. System 1000 (`seasonal-system-41`) supports control 1, which uses `per-flow` admission with a load of 20.95 and threshold of 5.20, resulting in an `admitted` decision. System 1001 (`regional-system-42`) supports control 2, using `aggregate` admission with a load of 22.90 and threshold of 8.40, resulting in `rejected`. System 1002 (`legacy-system-43`) supports control 3, using `dynamic` admission with a load of 24.85 and threshold of 11.60, with a `pending` decision. System 1003 (`compact-system-44`) supports control 4, using `per-flow` admission with a load of 26.80 and threshold of 14.80, resulting in `admitted`. This join is critical for understanding the relationship between capacity allocation and admission outcomes.

**View `vw_resource_management_system_performance_metric`**

```sql
CREATE VIEW vw_resource_management_system_performance_metric AS
SELECT a.resource_management_system_id, a.rms_id, a.system_version, a.optimization_goal, b.id AS metric_id, b.metric_id AS metric_metric_id, b.metric_type AS metric_metric_type
FROM resource_management_systems a JOIN performance_metrics b ON a.performance_metric_id = b.id;
```

| resource_management_system_id | rms_id | system_version | optimization_goal | metric_id | metric_metric_id | metric_metric_type |
|---|---|---|---|---|---|---|
| 1000 | id_23 | seasonal-system-41 | revenue | 100 | 3744010 | bandwidth |
| 1001 | 10238280 | regional-system-42 | utilization | 101 | 136630a8-8fcc-11eb-924d-9cd76263cbd0 | latency |
| 1002 | 4985156 | legacy-system-43 | latency | 102 | 2986226 | packetLoss |
| 1003 | 5082963 | compact-system-44 | revenue | 103 | 2002007020010 | jitter |

This view links resource management systems to the performance metrics they monitor, showing how optimization decisions are informed by empirical data. System 1000 monitors the bandwidth metric (19.95 Mbps) recorded on January 13, 2022. System 1001 monitors the latency metric (21.90 ms) from June 24, 2023. System 1002 monitors the packet loss metric (23.85 percent) from November 8, 2024. System 1003 monitors the jitter metric (25.80 Mbps) from April 19, 2025. This join enables operators to assess whether the optimization goals of each system are aligned with the metrics they track.

**View `vw_performance_metric_network_device`**

```sql
CREATE VIEW vw_performance_metric_network_device AS
SELECT a.id, a.metric_id, a.metric_type, a.value, b.network_device_id AS device_network_device_id, b.device_id AS device_device_id, b.device_type AS device_device_type
FROM performance_metrics a JOIN network_devices b ON a.network_device_id = b.network_device_id;
```

| id | metric_id | metric_type | value | device_network_device_id | device_device_id | device_device_type |
|---|---|---|---|---|---|---|
| 100 | 3744010 | bandwidth | 19.95 | 100 | 3744015 | router |
| 101 | 136630a8-8fcc-11eb-924d-9cd76263cbd0 | latency | 21.90 | 101 | 392495 | switch |
| 102 | 2986226 | packetLoss | 23.85 | 102 | 209205 | firewall |
| 103 | 2002007020010 | jitter | 25.80 | 103 | 22106999 | server |

This view associates performance metrics with the network devices that generate them, providing a device-centric view of measured quality. The bandwidth metric of 19.95 Mbps is generated by the active router at `device_id` 3744015. The latency metric of 21.90 ms comes from the inactive switch at `device_id` 392495. The packet loss metric of 23.85 percent is measured from the firewall at `device_id` 209205 under `maintenance`. The jitter metric of 25.80 Mbps is recorded by the active server at `device_id` 22106999. This join is essential for correlating device operational status with measured performance.

**View `vw_performance_metric_service_level_agreement`**

```sql
CREATE VIEW vw_performance_metric_service_level_agreement AS
SELECT a.id, a.metric_id, a.metric_type, a.value, b.service_level_agreement_id AS agreement_service_level_agreement_id, b.sla_id AS agreement_sla_id, b.provider_id AS agreement_provider_id
FROM performance_metrics a JOIN service_level_agreements b ON a.service_level_agreement_id = b.service_level_agreement_id;
```

| id | metric_id | metric_type | value | agreement_service_level_agreement_id | agreement_sla_id | agreement_provider_id |
|---|---|---|---|---|---|---|
| 100 | 3744010 | bandwidth | 19.95 | 100 | 9568441 | 3717633 |
| 101 | 136630a8-8fcc-11eb-924d-9cd76263cbd0 | latency | 21.90 | 101 | 884346 | ChIJYRd8uPtt5kcRunQjrWb4IKs |
| 102 | 2986226 | packetLoss | 23.85 | 102 | 9424932 | 8928519 |
| 103 | 2002007020010 | jitter | 25.80 | 103 | 7731866 | lu_tax_code_template_m13 |

This view connects performance metrics to their governing service level agreements, showing how measured quality relates to contractual commitments. The bandwidth metric of 19.95 Mbps is evaluated against the `gold` agreement 100, which specifies a maximum bandwidth of 13.95. The latency metric of 21.90 ms is assessed against the `silver` agreement 101, with a threshold of 7.40. The packet loss metric of 23.85 percent is measured against the `bronze` agreement 102, with a limit of 13.60. The jitter metric of 25.80 Mbps is evaluated against the second `gold` agreement 103. This join enables operators to identify which agreements are being met and which are at risk.

**View `vw_performance_metric_resource_management_system`**

```sql
CREATE VIEW vw_performance_metric_resource_management_system AS
SELECT a.id, a.metric_id, a.metric_type, a.value, b.resource_management_system_id AS system_resource_management_system_id, b.rms_id AS system_rms_id, b.system_version AS system_system_version
FROM performance_metrics a JOIN resource_management_systems b ON a.resource_management_system_id = b.resource_management_system_id;
```

| id | metric_id | metric_type | value | system_resource_management_system_id | system_rms_id | system_system_version |
|---|---|---|---|---|---|---|
| 100 | 3744010 | bandwidth | 19.95 | 1000 | id_23 | seasonal-system-41 |
| 101 | 136630a8-8fcc-11eb-924d-9cd76263cbd0 | latency | 21.90 | 1001 | 10238280 | regional-system-42 |
| 102 | 2986226 | packetLoss | 23.85 | 1002 | 4985156 | legacy-system-43 |
| 103 | 2002007020010 | jitter | 25.80 | 1003 | 5082963 | compact-system-44 |

This view links performance metrics to the resource management systems that use them for optimization decisions. The bandwidth metric of 19.95 Mbps is monitored by system 1000 (`seasonal-system-41`), which optimizes for `revenue`. The latency metric of 21.90 ms is tracked by system 1001 (`regional-system-42`), targeting `utilization`. The packet loss metric of 23.85 percent is observed by system 1002 (`legacy-system-43`), optimizing for `latency`. The jitter metric of 25.80 Mbps is measured by system 1003 (`compact-system-44`), again targeting `revenue`. This join helps operators understand how different optimization goals are informed by different types of performance data.

The operational integrity of a modern network depends on the continuous alignment between physical infrastructure, contractual commitments, traffic policies, admission decisions, capacity allocation, and measured performance. Each record type captures a distinct dimension of this ecosystem, and the views that join them provide the analytical lens through which operators can assess compliance, diagnose issues, and plan for capacity changes. The data reveals a coherent operational model: active devices under `gold` agreements with `per-flow` admission controls and `revenue`-optimized resource systems are performing within expected parameters, while inactive or maintenance-status devices under different service tiers may require attention. The interplay between these records forms the operational backbone of network governance, ensuring that every packet traversing the infrastructure does so within the bounds of agreed quality and available capacity.

## Data appendix

**Table `agreements_devices`**

| service_level_agreement_id | network_device_id |
|---|---|
| 100 | 100 |
| 100 | 101 |
| 101 | 101 |
| 101 | 102 |
| 102 | 102 |
| 102 | 103 |
| 103 | 103 |
| 103 | 100 |

**Table `systems_devices`**

| resource_management_system_id | network_device_id |
|---|---|
| 1000 | 100 |
| 1000 | 101 |
| 1001 | 101 |
| 1001 | 102 |
| 1002 | 102 |
| 1002 | 103 |
| 1003 | 103 |
| 1003 | 100 |

**Table `systems_controls`**

| resource_management_system_id | call_admission_control_id |
|---|---|
| 1000 | 1 |
| 1000 | 2 |
| 1001 | 2 |
| 1001 | 3 |
| 1002 | 3 |
| 1002 | 4 |
| 1003 | 4 |
| 1003 | 1 |
