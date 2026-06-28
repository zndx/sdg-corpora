---
chapter_id: ch_live_control_with_owner_98deb8
topic_id: 10
family: 03_directive_governance
cited_terms: ['control_with_owner', 'ebpfevent_observes_syscall_xref', 'ebpfprogram_not_unloaded']
model: engine-refine
---

The governance architecture rests upon a rigorously typed attribute model that binds policy definitions to operational entities through standardized identifier assignments. Each control baseline—such as a Vendor Risk Assessment or Data Retention Policy—is assigned a unique identifier (e.g., OWNE-0001 through OWNE-0004) that serves as the primary key for downstream metadata resolution. Attribute definitions, designated as attr, are cataloged with explicit attr type constraints (xsd:date, xsd:string, xsd:boolean, xsd:integer, or cco:DesignativeICE) to enforce schema discipline across the compliance layer. These typed attributes do not exist in isolation; they are resolved against an entity, which functions as the operational anchor receiving the policy assignment. The categorical taxonomy further segments these relationships, assigning each event or control lineage to a category (e.g., Ebpfevent Category 01 through 04) to enable hierarchical audit routing and regulatory mapping.

**t_control_with_owner**

| id | control |
| --- | --- |
| OWNE-0001 | Vendor Risk Assessment |
| OWNE-0002 | Data Retention Policy |
| OWNE-0003 | Vendor Risk Assessment |
| OWNE-0004 | Data Retention Policy |
| OWNE-0005 | Password Complexity Policy |
| OWNE-0006 | MFA Enforcement |
| OWNE-0007 | Data Retention Policy |

**t_control_with_owner_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| OWNE-0001 | effective_date | xsd:date |
| OWNE-0002 | enforcement | xsd:string |
| OWNE-0003 | mandatory | xsd:boolean |
| OWNE-0004 | priority | xsd:integer |
| OWNE-0005 | review_cycle_days | xsd:integer |
| OWNE-0006 | scope | xsd:string |
| OWNE-0007 | encoding | xsd:string |
| OWNE-0008 | label_text | xsd:string |

**t_control_with_owner_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OWNE-0001 | OWNE-0001 | OWNE-0003 | true |
| OWNE-0002 | OWNE-0002 | OWNE-0003 | true |
| OWNE-0003 | OWNE-0003 | OWNE-0003 | false |
| OWNE-0004 | OWNE-0004 | OWNE-0003 | true |
| OWNE-0005 | OWNE-0005 | OWNE-0003 | true |
| OWNE-0006 | OWNE-0006 | OWNE-0003 | true |
| OWNE-0007 | OWNE-0007 | OWNE-0003 | true |

**t_control_with_owner_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OWNE-0001 | OWNE-0001 | OWNE-0001 | 2024-04-04 |
| OWNE-0002 | OWNE-0002 | OWNE-0001 | 2025-04-01 |
| OWNE-0003 | OWNE-0003 | OWNE-0001 | 2025-05-22 |
| OWNE-0004 | OWNE-0004 | OWNE-0001 | 2024-09-08 |
| OWNE-0005 | OWNE-0005 | OWNE-0001 | 2023-05-30 |
| OWNE-0006 | OWNE-0006 | OWNE-0001 | 2023-06-07 |
| OWNE-0007 | OWNE-0007 | OWNE-0001 | 2025-03-19 |

**t_ebpfprogram_not_unloaded**

| id | ebpfprogram | ebpfprogram_2 |
| --- | --- | --- |
| UNLO-0001 | flow_dissector | tracepoint_sched_switch |
| UNLO-0002 | cgroup_device | perf_event_open |
| UNLO-0003 | socket_cookie | xdp_router |
| UNLO-0004 | kretprobe_mmap | cgroup_device |
| UNLO-0005 | netns_attach | flow_dissector |
| UNLO-0006 | cgroup_skb_ingress | cgroup_device |

**t_ebpfprogram_not_unloaded_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| UNLO-0001 | checksum | xsd:string |
| UNLO-0002 | created_date | xsd:date |
| UNLO-0003 | identifier | cco:DesignativeICE |
| UNLO-0004 | license | xsd:string |
| UNLO-0005 | mime_type | xsd:string |
| UNLO-0006 | size_bytes | xsd:long |
| UNLO-0007 | uri | xsd:string |
| UNLO-0008 | version | xsd:integer |

Value resolution occurs through a normalized misc store that preserves type fidelity while decoupling attribute definitions from their runtime assignments. When an entity receives an attribute binding, the corresponding value is persisted as a misc record, cross-referenced by the entity identifier and the target attr identifier. Date-bound attributes such as effective_date resolve to ISO-formatted timestamps (2024-04-04, 2025-04-01, 2025-05-22), while boolean enforcement flags (mandatory) capture compliance posture as true or false across distinct control instances. Numeric thresholds and string descriptors follow the same pattern: priority levels register as integers (4, 5, 806, 150), and operational descriptors like Encoding 01 or MPL-2.0 license identifiers are stored as varchar misc entries. This separation of schema (attr type) from payload (misc) ensures that policy evolution does not require structural migration, only versioned value insertion.

**t_control_with_owner_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OWNE-0001 | OWNE-0001 | OWNE-0007 | Encoding 01 |
| OWNE-0002 | OWNE-0001 | OWNE-0002 | Enforcement 02 |
| OWNE-0003 | OWNE-0001 | OWNE-0008 | change rationale |
| OWNE-0004 | OWNE-0001 | OWNE-0009 | es |
| OWNE-0005 | OWNE-0001 | OWNE-0006 | Scope 05 |
| OWNE-0006 | OWNE-0002 | OWNE-0007 | Encoding 06 |
| OWNE-0007 | OWNE-0002 | OWNE-0002 | Enforcement 07 |
| OWNE-0008 | OWNE-0002 | OWNE-0008 | intake form |

**t_ebpfprogram_not_unloaded_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| UNLO-0001 | UNLO-0001 | UNLO-0002 | 2025-04-28 |
| UNLO-0002 | UNLO-0002 | UNLO-0002 | 2025-01-07 |
| UNLO-0003 | UNLO-0003 | UNLO-0002 | 2025-02-14 |
| UNLO-0004 | UNLO-0004 | UNLO-0002 | 2025-06-17 |
| UNLO-0005 | UNLO-0005 | UNLO-0002 | 2025-05-28 |
| UNLO-0006 | UNLO-0006 | UNLO-0002 | 2023-03-06 |

**t_ebpfprogram_not_unloaded_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| UNLO-0001 | UNLO-0001 | UNLO-0006 | 186 |
| UNLO-0002 | UNLO-0001 | UNLO-0008 | 5 |
| UNLO-0003 | UNLO-0002 | UNLO-0006 | 206 |
| UNLO-0004 | UNLO-0002 | UNLO-0008 | 3 |
| UNLO-0005 | UNLO-0003 | UNLO-0006 | 203 |
| UNLO-0006 | UNLO-0003 | UNLO-0008 | 2 |
| UNLO-0007 | UNLO-0004 | UNLO-0006 | 499 |
| UNLO-0008 | UNLO-0004 | UNLO-0008 | 1 |

**t_ebpfprogram_not_unloaded_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| UNLO-0001 | UNLO-0001 | UNLO-0001 | 9d2b7a16 |
| UNLO-0002 | UNLO-0001 | UNLO-0003 | oid:1.3.6.1 |
| UNLO-0003 | UNLO-0001 | UNLO-0004 | MPL-2.0 |
| UNLO-0004 | UNLO-0001 | UNLO-0009 | us-east-1 |
| UNLO-0005 | UNLO-0001 | UNLO-0005 | application/json |
| UNLO-0006 | UNLO-0001 | UNLO-0010 | Name 06 |
| UNLO-0007 | UNLO-0001 | UNLO-0011 | analytics |
| UNLO-0008 | UNLO-0001 | UNLO-0012 | Tags 08 |

Operational telemetry is captured through the ebpfevent dimension, which records execution lifecycles alongside their performance and termination signatures. Each ebpfevent instance is keyed (e.g., XREF-0001 through XREF-0005) and classified under a category that dictates its regulatory or technical handling path. Duration seconds measures the elapsed execution window, ranging from sub-minute spans (889.87 seconds) to extended processing cycles exceeding ninety minutes (5696.76 seconds), providing a quantitative baseline for service-level compliance. Exit codes (988, 313, 278, 158) document the termination state of each event, while retry count quantifies resilience behavior, with observed values spanning from 38 to 427 re-execution attempts. Together, these metrics form an auditable trail of operational discipline, enabling deviation detection and corrective action routing.

The integration of typed attribute resolution with event telemetry establishes a closed-loop compliance framework. Identifiers anchor both static policy definitions and dynamic execution records, ensuring that every misc value and ebpfevent measurement can be traced to a specific entity and control baseline. Attr type constraints prevent semantic drift in regulatory metadata, while category assignments direct analytical queries toward appropriate governance workstreams. Duration seconds and retry count data feed into operational risk models, correlating execution latency and failure recovery with exit code distributions to identify systemic control degradation. This architecture supports continuous compliance monitoring by maintaining a single source of truth where policy attributes, entity bindings, and event telemetry converge under a unified identifier namespace.

**t_control_with_owner_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OWNE-0001 | OWNE-0001 | OWNE-0004 | 4 |
| OWNE-0002 | OWNE-0001 | OWNE-0005 | 806 |
| OWNE-0003 | OWNE-0002 | OWNE-0004 | 5 |
| OWNE-0004 | OWNE-0002 | OWNE-0005 | 150 |
| OWNE-0005 | OWNE-0003 | OWNE-0004 | 1 |
| OWNE-0006 | OWNE-0003 | OWNE-0005 | 596 |
| OWNE-0007 | OWNE-0004 | OWNE-0004 | 2 |
| OWNE-0008 | OWNE-0004 | OWNE-0005 | 663 |

**fact_ebpfevent**

| id | ebpfevent_key | duration_seconds | exit_code | retry_count |
| --- | --- | --- | --- | --- |
| XREF-0001 | XREF-0003 | 889.87 | 988 | 278 |
| XREF-0002 | XREF-0005 | 1832.41 | 313 | 427 |
| XREF-0003 | XREF-0001 | 3410.73 | 278 | 133 |
| XREF-0004 | XREF-0005 | 5696.76 | 158 | 38 |
| XREF-0005 | XREF-0005 | 4846.66 | 7 | 455 |
| XREF-0006 | XREF-0004 | 4215.38 | 52 | 460 |
| XREF-0007 | XREF-0006 | 653.90 | 100 | 108 |
| XREF-0008 | XREF-0005 | 2673.38 | 169 | 73 |

**dim_ebpfevent**

| id | ebpfevent_label | ebpfevent_category |
| --- | --- | --- |
| XREF-0001 | Ebpfevent Label 01 | Ebpfevent Category 01 |
| XREF-0002 | Ebpfevent Label 02 | Ebpfevent Category 02 |
| XREF-0003 | Ebpfevent Label 03 | Ebpfevent Category 03 |
| XREF-0004 | Ebpfevent Label 04 | Ebpfevent Category 04 |
| XREF-0005 | Ebpfevent Label 05 | Ebpfevent Category 05 |
| XREF-0006 | Ebpfevent Label 06 | Ebpfevent Category 06 |