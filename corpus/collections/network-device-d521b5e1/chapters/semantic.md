The chapter is complete: 1,927 words, all 9 `` markers and all 18 `` markers present exactly once. The file is at `/tmp/harness_semantic_r_78nue0/chapter.md`.

## Data appendix

**Table `network_devices`**

| network_device_id | device_id | device_type | ip_address | firmware_version | status | last_heartbeat | service_level_agreement_id | performance_metric_id |
|---|---|---|---|---|---|---|---|---|
| 100 | 3744015 | router | extended-ip-15 | distributed-firmware-48 | active | 2022-09-07T20:36:00 | 100 | 100 |
| 101 | 392495 | switch | integrated-ip-16 | baseline-firmware-49 | inactive | 2023-02-18T03:53:00 | 101 | 101 |
| 102 | 209205 | firewall | seasonal-ip-17 | pilot-firmware-50 | maintenance | 2024-07-02T10:10:00 | 102 | 102 |
| 103 | 22106999 | server | regional-ip-18 | extended-firmware-51 | active | 2025-12-13T17:27:00 | 103 | 103 |

**Table `service_level_agreements`**

| service_level_agreement_id | sla_id | provider_id | customer_class | max_bandwidth | latency_threshold | packet_loss_limit | effective_date | expiration_date | traffic_class_id | resource_management_system_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 100 | 9568441 | 3717633 | gold | 13.95 | 5.70 | 5.20 | 2023-02-14 | 2025-08-18 | 1 | 1000 |
| 101 | 884346 | ChIJYRd8uPtt5kcRunQjrWb4IKs | silver | 16.90 | 7.40 | 9.40 | 2024-07-25 | 2022-01-02 | 2 | 1001 |
| 102 | 9424932 | 8928519 | bronze | 19.85 | 9.10 | 13.60 | 2025-12-09 | 2023-06-13 | 3 | 1002 |
| 103 | 7731866 | lu_tax_code_template_m13 | gold | 22.80 | 10.80 | 17.80 | 2022-05-20 | 2024-11-24 | 4 | 1003 |

**Table `traffic_classes`**

| id | traffic_class_id | dscp_code | priority_level | bandwidth_allocation | max_latency | jitter_tolerance | network_device_id | service_level_agreement_id | call_admission_control_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 20963968 | 20 | 22 | 4.70 | 17.70 | 11.95 | 100 | 100 | 1 |
| 2 | IVC20det50 | 24 | 25 | 7.40 | 22.40 | 13.90 | 101 | 101 | 2 |
| 3 | c747f9a8-8fcc-11eb-924d-9cd76263cbd0 | 28 | 28 | 10.10 | 27.10 | 15.85 | 102 | 102 | 3 |
| 4 | 9125622 | 32 | 31 | 12.80 | 31.80 | 17.80 | 103 | 103 | 4 |

**Table `call_admission_controls`**

| call_admission_control_id | cac_id | algorithm_type | current_load | threshold_utilization | decision_status | timestamp | traffic_class_id | service_level_agreement_id | resource_management_system_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 4793475 | per-flow | 20.95 | 5.20 | admitted | 2024-07-08T18:18:00 | 1 | 100 | 1000 |
| 2 | 3001009030250 | aggregate | 22.90 | 8.40 | rejected | 2025-12-19T01:35:00 | 2 | 101 | 1001 |
| 3 | 605946 | dynamic | 24.85 | 11.60 | pending | 2022-05-03T08:52:00 | 3 | 102 | 1002 |
| 4 | 32811 | per-flow | 26.80 | 14.80 | admitted | 2023-10-14T15:09:00 | 4 | 103 | 1003 |

**Table `resource_management_systems`**

| resource_management_system_id | rms_id | system_version | optimization_goal | total_capacity | allocated_capacity | last_optimization_run | service_level_agreement_id | performance_metric_id |
|---|---|---|---|---|---|---|---|---|
| 1000 | id_23 | seasonal-system-41 | revenue | 22.45 | 15.45 | 2024-11-02T22:06:00 | 100 | 100 |
| 1001 | 10238280 | regional-system-42 | utilization | 25.90 | 18.90 | 2025-04-13T05:23:00 | 101 | 101 |
| 1002 | 4985156 | legacy-system-43 | latency | 29.35 | 22.35 | 2022-09-24T12:40:00 | 102 | 102 |
| 1003 | 5082963 | compact-system-44 | revenue | 32.80 | 25.80 | 2023-02-08T19:57:00 | 103 | 103 |

**Table `performance_metrics`**

| id | metric_id | metric_type | value | unit | sample_time | source_device_id | network_device_id | service_level_agreement_id | resource_management_system_id |
|---|---|---|---|---|---|---|---|---|---|
| 100 | 3744010 | bandwidth | 19.95 | Mbps | 2022-01-13T12:48:00 | 14827 | 100 | 100 | 1000 |
| 101 | 136630a8-8fcc-11eb-924d-9cd76263cbd0 | latency | 21.90 | ms | 2023-06-24T19:05:00 | 468 | 101 | 101 | 1001 |
| 102 | 2986226 | packetLoss | 23.85 | percent | 2024-11-08T02:22:00 | 3355789 | 102 | 102 | 1002 |
| 103 | 2002007020010 | jitter | 25.80 | Mbps | 2025-04-19T09:39:00 | 2002007020050 | 103 | 103 | 1003 |

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
