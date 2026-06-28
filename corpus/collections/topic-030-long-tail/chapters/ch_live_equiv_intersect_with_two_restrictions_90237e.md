---
chapter_id: ch_live_equiv_intersect_with_two_restrictions_90237e
topic_id: 30
family: 01_foundation
cited_terms: ['equiv_intersect_with_two_restrictions', 'kernelhook_in_kernel_module', 'ebpfmap_used_by_program']
model: engine-refine
---

Governed technical inventories treat **identifier** as the non-negotiable anchor that survives renaming, redeployment, and audit replay. Whether the record denotes a restriction intersection (`REST-0001` through `REST-0004`), a kernel-module hook binding (`MODU-0001` through `MODU-0004`), or a program lineage node (`PROG-0001` through `PROG-0004`), the identifier is what permits joins across fact and dimension tables without collapsing distinct assets into a single narrative. In restriction governance, the same identifier may simultaneously encode equivalence classes—`telemetry_stream_alpha` paired with `ml_model_checkpoint`, or `sensor_node_array` appearing under two distinct restriction keys—while **related** associations (`storage_volume`, `encryption_key`, `pressure_transducer`) express operational adjacency rather than semantic sameness. Auditors and automation pipelines therefore treat identifier stability as a control: any drift in key assignment breaks traceability from policy to runtime artifact.

**t_equiv_intersect_with_two_restrictions**

| id | equiv | equiv_2 | related | related_2 |
| --- | --- | --- | --- | --- |
| REST-0001 | telemetry_stream_alpha | ml_model_checkpoint | storage_volume | inference_dataset |
| REST-0002 | governance_policy_set | sensor_node_array | encryption_key | backup_volume |
| REST-0003 | ml_feature_vector | sensor_node_array | centrifuge_tube | pressure_transducer |
| REST-0004 | lab_assay_batch | ml_model_checkpoint | ingestion_connector | pressure_transducer |
| REST-0005 | edge_gateway_unit | validation_schema | protocol_adapter | incubator_chamber |
| REST-0006 | batch_pipeline_gamma | sensor_node_array | schema_registry | catalog_entry |
| REST-0007 | telemetry_stream_alpha | ml_model_checkpoint | centrifuge_tube | inference_dataset |

**Category** supplies the coarse taxonomy that filters obligations before detail is examined. Program consumption records attach each governed program to a **used_by_program_category** value (Category 01–04 in the reference set), which typically drives reporting roll-ups, access tiers, and retention schedules. Category is deliberately orthogonal to **misc** descriptive fields such as **used_by_program_label** (“Used By Program Label 01” through “04”): labels communicate human intent and service ownership, whereas category encodes the compliance class—telemetry ingest, inference serving, batch analytics, or laboratory workflow—under which license, location, and size constraints are evaluated. When Category 02 and Category 04 programs both reference downstream consumers, category remains the first gate for whether GPL copyleft, MIT permissiveness, or data-residency rules apply in aggregate.

**License** and **location** jointly determine where software may execute and under what redistribution and modification terms. Kernel-hook registrations illustrate the pairing explicitly: `PsSetCreateProcessNotify_Monitor` bindings carry **CC-BY-4.0** and **GPL-3.0** respectively, while storage and display stack modules (`nvlddmkm.sys`, `storport.sys`) are recorded under **MIT**; concurrently, **location** spans `zone-b`, `us-east-1`, `eu-west-3`, and `ap-south-2`, mapping each module’s approved deployment geography. Compliance officers read license not as a comment field but as an enforceable attribute tied to **in_kernel_module** hosts (`ntoskrnl.exe`, `kdcom.sys`, `IDT_KiDispatch_Stub`, `hal.dll`): a hook permitted in one jurisdiction under MIT may still be prohibited where export-control or driver-signing policy diverges. Location therefore operationalizes license geography—cross-region promotion of `storport.sys` from `eu-west-3` to `ap-south-2` is not a mere DNS change but a license-and-residency re-certification event.

**t_kernelhook_in_kernel_module**

| id | kernelhook | in_kernel_module | license | location |
| --- | --- | --- | --- | --- |
| MODU-0001 | PsSetCreateProcessNotify_Monitor | ntoskrnl.exe | CC-BY-4.0 | zone-b |
| MODU-0002 | PsSetCreateProcessNotify_Monitor | kdcom.sys | GPL-3.0 | us-east-1 |
| MODU-0003 | nvlddmkm.sys | IDT_KiDispatch_Stub | MIT | eu-west-3 |
| MODU-0004 | storport.sys | hal.dll | MIT | ap-south-2 |
| MODU-0005 | iaStorAC.sys | iaStorAC.sys | proprietary | zone-b |
| MODU-0006 | ntoskrnl.exe | storport.sys | CC-BY-4.0 | eu-west-3 |
| MODU-0007 | nvlddmkm.sys | Inline_NtQuerySystem | CC-BY-4.0 | eu-west-3 |
| MODU-0008 | dxgkrnl.sys | SSDT_Dispatch_Rewrite | MPL-2.0 | zone-b |

**Size_bytes** and **version** quantify runtime state and temporal drift for programs whose footprint directly affects capacity, cost, and security surface. eBPF map facts record allocations from roughly 31 MB (`PROG-0003`, 31,105,012 bytes) to approximately 355 MB (`PROG-0004`, 354,373,995 bytes), with intermediate holdings near 157 MB and 209 MB for sibling programs—magnitudes that inform memory quotas, cgroup limits, and incident-response prioritization when map exhaustion threatens observability loss. **Version** integers (3, 6, 12, 5 across the same fact set) mark generational change independently of byte size: a program may shrink after compaction yet still require a major version bump if map layout or verifier semantics change. Capacity planners therefore monitor size_bytes for trend anomalies; change managers treat version increments as migration triggers even when labels and categories appear unchanged.

The **used_by_program** relationship closes the loop between dimensional classification and factual consumption, expressing directed dependency rather than symmetric equivalence. Fact rows reference consumer keys such as `PROG-0005` and `PROG-0004`, including reciprocal patterns where `PROG-0002` both consumes and is consumed—topology that restriction tables echo when `sensor_node_array` and `ml_model_checkpoint` recur across equivalence and related columns. This dependency graph is how governance answers “who bears obligation”: a Category 01 program at version 3 inheriting a 209 MB map footprint may delegate runtime behavior to `PROG-0005`, yet retain license and location accountability if it remains the registered producer. **Misc** labels then provide the audit-facing prose layer atop that graph, ensuring investigators can reconcile ticket systems and runbooks with machine keys without conflating display names with identifiers.

**dim_used_by_program**

| id | used_by_program_label | used_by_program_category |
| --- | --- | --- |
| PROG-0001 | Used By Program Label 01 | Used By Program Category 01 |
| PROG-0002 | Used By Program Label 02 | Used By Program Category 02 |
| PROG-0003 | Used By Program Label 03 | Used By Program Category 03 |
| PROG-0004 | Used By Program Label 04 | Used By Program Category 04 |
| PROG-0005 | Used By Program Label 05 | Used By Program Category 05 |
| PROG-0006 | Used By Program Label 06 | Used By Program Category 06 |

Operational practice merges these attributes into invariant checks: identifier joins must resolve; category must match the obligation matrix; license and location must be co-validated before promotion; size_bytes and version must be snapshotted at change windows; used_by_program edges must remain acyclic under policy or explicitly documented as allowed cycles; misc labels must not substitute for keys in automated enforcement. The reference tuples—`REST-0002` linking `governance_policy_set` to `sensor_node_array` and `backup_volume`, `MODU-0003` anchoring `nvlddmkm.sys` under MIT in `eu-west-3`, `PROG-0001` at version 3 consuming `PROG-0005` within Category 01—are exemplars of a single principle: compliance is not inferred from filenames or informal names but reconstructed from typed, joinable attributes that remain legible under retrospective examination.

**fact_ebpfmap**

| id | used_by_program_key | size_bytes | version |
| --- | --- | --- | --- |
| PROG-0001 | PROG-0005 | 208979093 | 3 |
| PROG-0002 | PROG-0004 | 156714508 | 6 |
| PROG-0003 | PROG-0005 | 31105012 | 12 |
| PROG-0004 | PROG-0002 | 354373995 | 5 |
| PROG-0005 | PROG-0004 | 866267293 | 2 |