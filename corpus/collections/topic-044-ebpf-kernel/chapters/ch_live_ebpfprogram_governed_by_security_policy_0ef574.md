---
chapter_id: ch_live_ebpfprogram_governed_by_security_policy_0ef574
topic_id: 44
family: 04_ebpf_kernel
cited_terms: ['ebpfprogram_governed_by_security_policy', 'soc2_confidentiality_subclass', 'metric_with_aggregation']
model: engine-refine
---

The governance of eBPF programs within a SOC2 compliance architecture requires precise tracking of program identity, version lineage, and resource footprint. Each eBPF program is assigned a unique identifier—POLI-0001 through POLI-0005 serve as the canonical keys—and is further characterized by its version number and compiled size in bytes. Version 12 appears for programs POLI-0001 and POLI-0004, while version 9 governs POLI-0002 and version 11 applies to POLI-0003, reflecting a non-uniform versioning cadence that signals divergent release cycles or policy branches. The compiled artifacts range from 113,209,263 bytes for POLI-0003 to 784,335,640 bytes for POLI-0001, a nearly sevenfold variance that carries direct implications for memory footprint, load latency, and audit scope. These programs are further classified by category—Ebpfprogram Category 01 through 04—and assigned descriptive labels such as Ebpfprogram Label 01 through 04, enabling operators to group and reason about programs by function rather than by identifier alone.

**fact_ebpfprogram**

| id | ebpfprogram_key | size_bytes | version |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | 784335640 | 12 |
| POLI-0002 | POLI-0003 | 641704069 | 9 |
| POLI-0003 | POLI-0003 | 113209263 | 11 |
| POLI-0004 | POLI-0005 | 161013093 | 12 |
| POLI-0005 | POLI-0004 | 352203820 | 12 |
| POLI-0006 | POLI-0003 | 167519051 | 1 |

**dim_ebpfprogram**

| id | ebpfprogram_label | ebpfprogram_category |
| --- | --- | --- |
| POLI-0001 | Ebpfprogram Label 01 | Ebpfprogram Category 01 |
| POLI-0002 | Ebpfprogram Label 02 | Ebpfprogram Category 02 |
| POLI-0003 | Ebpfprogram Label 03 | Ebpfprogram Category 03 |
| POLI-0004 | Ebpfprogram Label 04 | Ebpfprogram Category 04 |
| POLI-0005 | Ebpfprogram Label 05 | Ebpfprogram Category 05 |
| POLI-0006 | Ebpfprogram Label 06 | Ebpfprogram Category 06 |
| POLI-0007 | Ebpfprogram Label 07 | Ebpfprogram Category 07 |
| POLI-0008 | Ebpfprogram Label 08 | Ebpfprogram Category 08 |

SOC2 domain governance introduces a parallel dimension of prioritization and temporal discipline. The fact_soc table encodes each domain instance with a priority level ranging from 1 to 5, where priority 1 represents the highest urgency and priority 5 the lowest. Review cycle days impose the temporal cadence on each domain: CONF-0001 mandates a 494-day review interval, CONF-0002 requires 767 days, CONF-0003 extends to 890 days, and CONF-0004 compresses the cycle to 372 days. These intervals are not arbitrary; they reflect the risk posture and regulatory exposure of each domain. The for_s_o_c2_domain_key column links each fact record to its corresponding domain entity, while the dim_for_s_o_c2_domain table provides the categorical and labeling metadata—For S O C2 Domain Category 01 through 04 and For S O C2 Domain Label 01 through 04—that gives human-readable meaning to the domain identifiers.

**fact_soc**

| id | for_s_o_c2_domain_key | priority | review_cycle_days |
| --- | --- | --- | --- |
| CONF-0001 | CONF-0002 | 3 | 494 |
| CONF-0002 | CONF-0005 | 2 | 767 |
| CONF-0003 | CONF-0003 | 1 | 890 |
| CONF-0004 | CONF-0005 | 5 | 372 |

**dim_for_s_o_c2_domain**

| id | for_s_o_c2_domain_label | for_s_o_c2_domain_category |
| --- | --- | --- |
| CONF-0001 | For S O C2 Domain Label 01 | For S O C2 Domain Category 01 |
| CONF-0002 | For S O C2 Domain Label 02 | For S O C2 Domain Category 02 |
| CONF-0003 | For S O C2 Domain Label 03 | For S O C2 Domain Category 03 |
| CONF-0004 | For S O C2 Domain Label 04 | For S O C2 Domain Category 04 |
| CONF-0005 | For S O C2 Domain Label 05 | For S O C2 Domain Category 05 |
| CONF-0006 | For S O C2 Domain Label 06 | For S O C2 Domain Category 06 |

The attribute system provides the extensible property layer that binds entities to their descriptive and operational characteristics. The t_metric_with_aggregation_attr table defines attributes by name and type: checksum and license are typed as xsd:string, created_date as xsd:date, and identifier as cco:DesignativeICE, a custom ontology type indicating a designative identifier within the compliance framework. These attribute definitions are then instantiated against entities through value tables that separate data by type. Date values such as 2025-01-26, 2024-12-19, 2025-05-29, and 2024-03-19 populate the date value table, integer values including 105, 11, 324, and 2 occupy the integer value table, and string values like 1a4b6c2d, ref-8842, Apache-2.0, and zone-b reside in the varchar value table. The entity_id column in each value table references the entity being described, while attr_id points to the attribute definition, forming a normalized entity-attribute-value pattern that supports arbitrary property extension without schema modification.

**t_metric_with_aggregation**

| id | metric | aggregation_temporality |
| --- | --- | --- |
| AGGR-0001 | memory_usage_gigabytes | per_minute |
| AGGR-0002 | log_error_rate_per_minute | 24_hours |
| AGGR-0003 | cpu_utilization_percent | 5_minutes |
| AGGR-0004 | api_response_time_p99 | 5_minutes |
| AGGR-0005 | queue_depth_messages | 1_month |
| AGGR-0006 | database_connection_pool_active | per_minute |
| AGGR-0007 | http_request_latency_ms | 30_minutes |
| AGGR-0008 | api_response_time_p99 | 1_hour |

**t_metric_with_aggregation_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| AGGR-0001 | checksum | xsd:string |
| AGGR-0002 | created_date | xsd:date |
| AGGR-0003 | identifier | cco:DesignativeICE |
| AGGR-0004 | license | xsd:string |
| AGGR-0005 | mime_type | xsd:string |
| AGGR-0006 | size_bytes | xsd:long |
| AGGR-0007 | uri | xsd:string |
| AGGR-0008 | version | xsd:integer |

**t_metric_with_aggregation_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AGGR-0001 | AGGR-0001 | AGGR-0002 | 2025-01-26 |
| AGGR-0002 | AGGR-0002 | AGGR-0002 | 2024-12-19 |
| AGGR-0003 | AGGR-0003 | AGGR-0002 | 2025-05-29 |
| AGGR-0004 | AGGR-0004 | AGGR-0002 | 2024-03-19 |
| AGGR-0005 | AGGR-0005 | AGGR-0002 | 2023-09-16 |
| AGGR-0006 | AGGR-0006 | AGGR-0002 | 2023-04-28 |
| AGGR-0007 | AGGR-0007 | AGGR-0002 | 2024-03-10 |
| AGGR-0008 | AGGR-0008 | AGGR-0002 | 2024-10-06 |

**t_metric_with_aggregation_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AGGR-0001 | AGGR-0001 | AGGR-0006 | 105 |
| AGGR-0002 | AGGR-0001 | AGGR-0008 | 11 |
| AGGR-0003 | AGGR-0002 | AGGR-0006 | 324 |
| AGGR-0004 | AGGR-0002 | AGGR-0008 | 2 |
| AGGR-0005 | AGGR-0003 | AGGR-0006 | 334 |
| AGGR-0006 | AGGR-0003 | AGGR-0008 | 9 |
| AGGR-0007 | AGGR-0004 | AGGR-0006 | 424 |
| AGGR-0008 | AGGR-0004 | AGGR-0008 | 12 |

**t_metric_with_aggregation_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AGGR-0001 | AGGR-0001 | AGGR-0001 | 1a4b6c2d |
| AGGR-0002 | AGGR-0001 | AGGR-0003 | ref-8842 |
| AGGR-0003 | AGGR-0001 | AGGR-0004 | Apache-2.0 |
| AGGR-0004 | AGGR-0001 | AGGR-0009 | zone-b |
| AGGR-0005 | AGGR-0001 | AGGR-0005 | text/plain |
| AGGR-0006 | AGGR-0001 | AGGR-0010 | Name 06 |
| AGGR-0007 | AGGR-0001 | AGGR-0011 | data-engineering |
| AGGR-0008 | AGGR-0001 | AGGR-0012 | Tags 08 |

Metric aggregation temporality further structures how compliance data is collected and reported. Metrics such as memory_usage_gigabytes, log_error_rate_per_minute, cpu_utilization_percent, and api_response_time_p99 are each associated with an aggregation temporality—per_minute, 5_minutes, or 24_hours—that dictates the granularity and window of measurement. This temporal dimension is critical for SOC2 reporting, as different controls require different sampling rates: real-time monitoring of API response times at the p99 percentile demands 5-minute aggregation, while license compliance tracking may only require 24-hour snapshots. The identifier column in each metric table serves as the primary key, linking metrics to their attribute definitions and value records through the entity-attribute-value chain.

The interplay between these tables forms a coherent governance model. An eBPF program (identified by POLI-0001, for instance) carries version 12 and occupies 784,335,640 bytes of compiled space, while a SOC2 domain (identified by CONF-0001) operates at priority 3 with a 494-day review cycle. Both are enriched by categorical metadata and linked to attribute-value pairs that capture operational state, compliance status, and audit trail information. The entity-attribute-value pattern ensures that any property—whether a checksum like 1a4b6c2d, a license designation like Apache-2.0, or a date such as 2025-01-26—can be attached to any entity without altering the underlying schema. This design supports the evolving nature of SOC2 requirements, where new controls, attributes, and review cycles can be introduced without disrupting existing data structures.