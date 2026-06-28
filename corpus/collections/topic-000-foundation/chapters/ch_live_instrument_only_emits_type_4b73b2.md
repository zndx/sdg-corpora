---
chapter_id: ch_live_instrument_only_emits_type_4b73b2
topic_id: 0
family: 01_foundation
cited_terms: ['instrument_only_emits_type', 'ebpfprogram_governed_by_security_policy', 'bpf_helper_called_by']
model: engine-refine
---

In kernel observability and policy governance, identifier and entity establish the referential spine on which every audit artifact hangs. An identifier is a stable, designative key—TYPE-0001 for an instrument emission profile, POLI-0003 for a loaded eBPF policy object, CALL-0002 for a helper-invocation record—that survives renaming, relabeling, and redeployment without breaking lineage. Entity denotes the governed object to which attributes attach: the same CALL-0002 row that names xdp_router as the invoked BPF helper also appears as entity_id in typed value stores, so compliance queries can traverse from program behavior to declared metadata without conflating the record key with the semantic subject. Where attr_type resolves to cco:DesignativeICE, as it does for the identifier attribute on CALL-0003, the type system signals that the value participates in a controlled vocabulary of designative identifiers rather than free text, a distinction material when reconciling inventory against runtime attachment.

**t_bpf_helper_called_by**

| id | bpf | called_by_program |
| --- | --- | --- |
| CALL-0001 | socket_connect_trace | envoy |
| CALL-0002 | xdp_router | kubelet |
| CALL-0003 | lsm:inode_create | falco |
| CALL-0004 | tracepoint:sched_process_exit | kubelet |
| CALL-0005 | raw_tracepoint:sys_enter | kubelet |
| CALL-0006 | cgroup_skb_ingress | istiod |

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

Attr and attr_type constitute the declarative contract layer. An attr names what is being asserted—checksum, created_date, license—while attr_type constrains how that assertion may be represented and validated: xsd:string for license and checksum, xsd:date for created_date. This separation matters because a single helper call, such as socket_connect_trace invoked by envoy, may simultaneously carry a varchar checksum (1a4b6c2d), an integer counter (67), and a date-valued created_date (2024-07-02), each routed to the value relation whose physical typing matches the declared attr_type. Governance frameworks that omit attr_type force auditors to infer semantics from storage location alone; frameworks that preserve it permit cross-entity comparison—e.g., whether every program listing a license attr of type xsd:string also holds a non-null varchar value—without schema archaeology.

Ebpfprogram, category, and version govern the lifecycle and taxonomy of in-kernel instrumentation assets. The ebpfprogram key (POLI-0001, POLI-0003, POLI-0005 in the fact layer) is the operational handle by which a policy is loaded, versioned, and measured; the dimension layer supplies human-readable misc labels (“Ebpfprogram Label 03”) and category partitions (“Ebpfprogram Category 02”) that roll programs into compliance scopes—network path, LSM enforcement, scheduling trace—without overloading the surrogate key. Version records drift explicitly: POLI-0001 at version 12 and POLI-0002 at version 9 coexist in the fact table, so change-management rules can require that production nodes never run a fact-row ebpfprogram_key whose version lags the approved baseline. Category further enables aggregate reporting: auditors group POLI-0004 under Category 04 while still joining to call-site evidence showing kubelet and falco as callers of distinct helpers (lsm:inode_create, tracepoint:sched_process_exit).

Sizebytes and size_bytes quantify the storage and transfer footprint of governed artifacts and thereby anchor capacity, retention, and cost controls. Instrument-only emission types carry sizebytes in the hundreds of millions—TYPE-0002 at 631989835 versus TYPE-0001 at 370347470—reflecting how signal modality (ion chamber versus seismograph) and acquisition history (createddate 2023-12-08 versus 2024-12-01) correlate with archive bulk. For eBPF programs, size_bytes spans an equally wide band, from 161013093 for POLI-0005 to 784335640 for POLI-0001, informing decisions about image bloat, verifier complexity budgets, and whether duplicate keys (POLI-0003 appearing twice in the fact table with 641704069 and 113209263 bytes) represent distinct builds or reconciliation errors. In operational guides, these fields are not decorative metadata; they are evidentiary inputs to tiered retention policies and to alerts when a redeployed program’s byte count departs materially from its versioned predecessor.

**t_instrument_only_emits_type**

| id | instrument | emits_signal | created_date | size_bytes |
| --- | --- | --- | --- | --- |
| TYPE-0001 | Seismograph | Acoustic echo | 2024-12-01 | 370347470 |
| TYPE-0002 | Ion chamber | Ultrasound pulse | 2023-12-08 | 631989835 |
| TYPE-0003 | Acoustic transducer | Infrared radiation | 2023-01-25 | 565520223 |
| TYPE-0004 | Ion chamber | Telemetry stream | 2024-07-30 | 541950157 |
| TYPE-0005 | Spectrometer | RF pulse | 2024-06-22 | 83957422 |
| TYPE-0006 | Magnetometer | Acoustic echo | 2024-05-04 | 105995168 |
| TYPE-0007 | Particle detector | Ultrasound pulse | 2024-10-26 | 587447986 |

Createddate timestamps anchor provenance and temporal compliance. At the instrument layer, createddate orders the introduction of emission classes from 2023-01-25 (TYPE-0003, infrared radiation from an acoustic transducer) through 2024-07-30 (TYPE-0004, telemetry stream). At the attribute-value layer, the same semantic field materializes as attr created_date with attr_type xsd:date and concrete misc values—2025-01-26 for CALL-0002, 2023-11-11 for CALL-0004—stored in the date-typed value relation rather than embedded in the helper-call row. That pattern—scalar attrs externalized by type—permits validators to reject mistyped inserts and allows backdated corrections without rewriting the core entity row. Misc, in turn, names the polymorphic payload column that holds whatever literal fits the governing attr_type: proprietary and zone-b as varchar license or zone designations, ARN:res/41 as a resource pointer, or category and ebpfprogram labels in conformed dimensions where a single descriptive string suffices.

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

In practice, these elements interlock into an evidence chain suitable for handbook-grade assurance. An auditor begins from identifier CALL-0003, confirms the entity’s helper lsm:inode_create and caller falco, reads attr license as xsd:string with misc value proprietary, cross-checks created_date 2024-10-16 against the program’s approved window, and joins upward through ebpfprogram POLI-0003 (version 11, size_bytes 113209263, category Ebpfprogram Category 03) to the instrument lineage that contextualizes signal provenance. Identifier stability, attr typing, categorical roll-up, byte accounting, version discipline, and createddate provenance are not independent columns to be cataloged; they are the minimum orthogonal coordinates—identity, semantics, taxonomy, magnitude, revision, and time—by which a governance framework proves that what runs in the kernel, what a node emits, and what the ledger claims remain mutually consistent under examination.

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