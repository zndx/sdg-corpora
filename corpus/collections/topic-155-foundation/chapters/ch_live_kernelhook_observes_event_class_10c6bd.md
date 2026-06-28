---
chapter_id: ch_live_kernelhook_observes_event_class_10c6bd
topic_id: 155
family: 04_ebpf_kernel
cited_terms: ['kernelhook_observes_event_class', 'bpf_helper_called_by', 'national_dataset_augmentation_process']
model: engine-refine
---

Kernel-level observability in modern systems rests on a disciplined mapping between instrumentation hooks and the events they capture, a relationship formalized through a registry of kernel hooks—perf-monitor, syscall-hook, kernel-watcher, telemetry-daemon—each bound to specific event classes such as disk-io, net-packet-capture, and thread-schedule. These mappings carry operational provenance: a probe named probe_capture_main in ap-south-2 may observe disk-io, while net_watch_stream in zone-b captures net-packet-capture, and event_feed_prod in us-east-1 feeds thread-schedule events. The location dimension anchors each observation to a geographic or logical deployment zone, ensuring that telemetry can be correlated with infrastructure topology and regulatory boundaries.

**t_kernelhook_observes_event_class**

| id | kernelhook | observes_event | location | name |
| --- | --- | --- | --- | --- |
| EVEN-0001 | perf-monitor | disk-io | ap-south-2 | probe_capture_main |
| EVEN-0002 | syscall-hook | net-packet-capture | us-east-1 | audit_log_stream |
| EVEN-0003 | kernel-watcher | net-packet-capture | zone-b | net_watch_stream |
| EVEN-0004 | telemetry-daemon | thread-schedule | us-east-1 | event_feed_prod |
| EVEN-0005 | ebpf-probe | thread-schedule | on-prem-dc1 | probe_capture_main |

BPF helper programs extend this observability layer by providing kernel-space primitives that user-space and kernel-space consumers invoke. The helper registry enumerates socket_connect_trace, xdp_router, lsm:inode_create, and tracepoint:sched_process_exit, each called by distinct orchestrators and security agents—envoy for network tracing, kubelet for container lifecycle events, and falco for security policy enforcement. The relationship between helper and caller is not one-to-one; kubelet, for instance, invokes both xdp_router and tracepoint:sched_process_exit, reflecting the multi-faceted responsibilities of container runtime agents within a Kubernetes control plane.

**t_bpf_helper_called_by**

| id | bpf | called_by_program |
| --- | --- | --- |
| CALL-0001 | socket_connect_trace | envoy |
| CALL-0002 | xdp_router | kubelet |
| CALL-0003 | lsm:inode_create | falco |
| CALL-0004 | tracepoint:sched_process_exit | kubelet |
| CALL-0005 | raw_tracepoint:sys_enter | kubelet |
| CALL-0006 | cgroup_skb_ingress | istiod |

To support provenance and policy evaluation, each BPF helper invocation carries a set of typed attributes—checksum, created_date, identifier, and license—whose data types are declared as xsd:string, xsd:date, cco:DesignativeICE, and xsd:string respectively. This attribute schema is materialized through a value-oriented entity-attribute-value pattern, where date attributes such as created_date resolve to concrete timestamps like 2024-07-02, 2025-01-26, 2024-10-16, and 2023-11-11; integer attributes yield values including 67, 11, 259, and 9; and string attributes carry identifiers such as 1a4b6c2d, resource references like ARN:res/41, classification labels such as proprietary, and location tags like zone-b. The separation of value types into dedicated tables—date, integer, and variable-length character—preserves type safety while enabling efficient indexing on the most frequently queried attribute categories.

**t_bpf_helper_called_by_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| CALL-0001 | checksum | xsd:string |
| CALL-0002 | created_date | xsd:date |
| CALL-0003 | identifier | cco:DesignativeICE |
| CALL-0004 | license | xsd:string |
| CALL-0005 | mime_type | xsd:string |
| CALL-0006 | size_bytes | xsd:long |
| CALL-0007 | uri | xsd:string |
| CALL-0008 | version | xsd:integer |

**t_bpf_helper_called_by_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CALL-0001 | CALL-0001 | CALL-0002 | 2024-07-02 |
| CALL-0002 | CALL-0002 | CALL-0002 | 2025-01-26 |
| CALL-0003 | CALL-0003 | CALL-0002 | 2024-10-16 |
| CALL-0004 | CALL-0004 | CALL-0002 | 2023-11-11 |
| CALL-0005 | CALL-0005 | CALL-0002 | 2024-05-09 |
| CALL-0006 | CALL-0006 | CALL-0002 | 2025-02-22 |

**t_bpf_helper_called_by_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CALL-0001 | CALL-0001 | CALL-0006 | 67 |
| CALL-0002 | CALL-0001 | CALL-0008 | 11 |
| CALL-0003 | CALL-0002 | CALL-0006 | 259 |
| CALL-0004 | CALL-0002 | CALL-0008 | 9 |
| CALL-0005 | CALL-0003 | CALL-0006 | 333 |
| CALL-0006 | CALL-0003 | CALL-0008 | 11 |
| CALL-0007 | CALL-0004 | CALL-0006 | 103 |
| CALL-0008 | CALL-0004 | CALL-0008 | 4 |

**t_bpf_helper_called_by_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CALL-0001 | CALL-0001 | CALL-0001 | 1a4b6c2d |
| CALL-0002 | CALL-0001 | CALL-0003 | ARN:res/41 |
| CALL-0003 | CALL-0001 | CALL-0004 | proprietary |
| CALL-0004 | CALL-0001 | CALL-0009 | zone-b |
| CALL-0005 | CALL-0001 | CALL-0005 | application/octet-stream |
| CALL-0006 | CALL-0001 | CALL-0010 | Name 06 |
| CALL-0007 | CALL-0001 | CALL-0011 | data-engineering |
| CALL-0008 | CALL-0001 | CALL-0012 | Tags 08 |

Beyond kernel telemetry, the same attribute-value architecture underpins the governance of geospatial and statistical datasets through a national dataset augmentation process registry. Processes such as DGIWGBase, NRCANMap, TerrainDataMerge, and EuroStatSync each incorporate an observation source—CopernicusLand, CMEMSDataCube, GLO30Coverage, CopernicusCrisis—and target an existing dataset for enrichment, including SentinelCoreLoad, GADMAdminLevels, CensusMapAlign, and LandCoverSync. This tripartite linkage (process, source, target) establishes an auditable chain of data lineage, ensuring that every augmentation can be traced to its observational provenance and its downstream consumer dataset. The structural parallel between the BPF helper attribute model and the augmentation process model—both relying on typed attributes and entity-valued associations—demonstrates a unified approach to metadata management across system observability and geospatial data governance.

**t_national_dataset_augmentation_process**

| id | national_dataset_augmentation_process | incorporates_observation_source | augments_existing_dataset |
| --- | --- | --- | --- |
| PROC-0001 | DGIWGBase | CopernicusLand | SentinelCoreLoad |
| PROC-0002 | NRCANMap | CMEMSDataCube | GADMAdminLevels |
| PROC-0003 | TerrainDataMerge | GLO30Coverage | CensusMapAlign |
| PROC-0004 | EuroStatSync | CopernicusCrisis | LandCoverSync |
| PROC-0005 | CensusMapAlign | CMEMSDataCube | CensusMapAlign |
| PROC-0006 | DGIWGBase | CopernicusCrisis | GADMAdminLevels |
| PROC-0007 | LandCoverSync | CAMSReanalysis | GADMv32 |