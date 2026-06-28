---
chapter_id: ch_live_ganglion_cyst_tissue_origin_30381a
topic_id: 135
family: 08_derived
cited_terms: ['ganglion_cyst_tissue_origin', 'ebpfprogram_union_kprobe_or_xdp', 'labrun_subclass']
model: engine-refine
---

A robust data governance framework rests on a disciplined separation between what things are, what properties they carry, and how they relate to one another. At the foundation, every entity receives a stable identifier—such as ORIG-0001 for a ganglion cyst tissue origin or XDP-0001 for an eBPF program—that serves as the immutable anchor for all downstream references. These identifiers are not merely labels; they are the mechanism by which disparate data domains, from anatomical tissue classifications to kernel-level security probes, are brought into a single coherent model. An entity represents any distinct object of interest: a laboratory run like CellCulture-Exp12, a tissue origin such as the sacroiliac joint, or a network policy enforcer. The identifier column is the universal key that ties every attribute, value, and relationship back to its subject.

**t_ganglion_cyst_tissue_origin**

| id | ganglion_cyst_tissue_origin |
| --- | --- |
| ORIG-0001 | sacroiliac joint |
| ORIG-0002 | metacarpophalangeal joint |
| ORIG-0003 | subacromial bursa |
| ORIG-0004 | first dorsal compartment |
| ORIG-0005 | sacroiliac joint |
| ORIG-0006 | distal radioulnar joint |
| ORIG-0007 | popliteal fossa |
| ORIG-0008 | distal radioulnar joint |

**t_ebpfprogram_union_kprobe_or_xdp**

| id | ebpfprogram | ebpfprogram_2 | ebpfprogram_3 | mime_type | size_bytes |
| --- | --- | --- | --- | --- | --- |
| XDP-0001 | seccomp_profile_loader | ptrace_attach_monitor | tcp_state_monitor | application/xml | 613043965 |
| XDP-0002 | network_policy_enforcer | network_interface_stat | network_interface_stat | application/parquet | 757467115 |
| XDP-0003 | xdp_packet_dropper | memory_pressure_observer | perf_cpu_clock_sampler | application/octet-stream | 333629998 |
| XDP-0004 | credential_validation_probe | security_file_open_hook | tcp_state_monitor | text/csv | 79215808 |
| XDP-0005 | syscall_audit_filter | capability_change_hook | memory_pressure_observer | text/plain | 893084779 |
| XDP-0006 | security_file_open_hook | ptrace_attach_monitor | disk_io_latency_probe | application/xml | 924754977 |

**t_labrun_subclass**

| id | labrun | input_sample |
| --- | --- | --- |
| LABR-0001 | CellCulture-Exp12 | XDP-0004 |
| LABR-0002 | FlowCyt-Panel9 | XDP-0001 |
| LABR-0003 | ELISA-Plate88 | XDP-0005 |
| LABR-0004 | PCR-Run-Alpha7 | XDP-0005 |
| LABR-0005 | MassSpec-MS19 | XDP-0006 |
| LABR-0006 | NMR-Stand-04A | XDP-0004 |
| LABR-0007 | FlowCyt-Panel9 | XDP-0002 |
| LABR-0008 | RNASeq-Lib15 | XDP-0006 |

**t_labrun_subclass_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| LABR-0001 | duration_seconds | xsd:decimal |
| LABR-0002 | end_time | xsd:dateTime |
| LABR-0003 | exit_code | xsd:integer |
| LABR-0004 | host_name | xsd:string |
| LABR-0005 | log_level | xsd:string |
| LABR-0006 | phase | xsd:string |
| LABR-0007 | retry_count | xsd:integer |
| LABR-0008 | scheduled_at | xsd:dateTime |

**t_labrun_subclass_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LABR-0001 | LABR-0001 | LABR-0002 | 2023-06-03T03:48:13 |
| LABR-0002 | LABR-0001 | LABR-0008 | 2024-12-03T15:21:58 |
| LABR-0003 | LABR-0001 | LABR-0009 | 2023-08-16T05:52:21 |
| LABR-0004 | LABR-0002 | LABR-0002 | 2024-08-31T23:33:13 |
| LABR-0005 | LABR-0002 | LABR-0008 | 2025-02-13T01:21:55 |
| LABR-0006 | LABR-0002 | LABR-0009 | 2023-04-09T20:59:10 |
| LABR-0007 | LABR-0003 | LABR-0002 | 2024-04-14T13:26:56 |
| LABR-0008 | LABR-0003 | LABR-0008 | 2024-07-04T01:41:44 |

**t_labrun_subclass_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LABR-0001 | LABR-0001 | LABR-0001 | 7187.70 |
| LABR-0002 | LABR-0002 | LABR-0001 | 5360.85 |
| LABR-0003 | LABR-0003 | LABR-0001 | 3249.87 |
| LABR-0004 | LABR-0004 | LABR-0001 | 649.77 |
| LABR-0005 | LABR-0005 | LABR-0001 | 3590.34 |
| LABR-0006 | LABR-0006 | LABR-0001 | 456.45 |
| LABR-0007 | LABR-0007 | LABR-0001 | 5720.89 |
| LABR-0008 | LABR-0008 | LABR-0001 | 7012.99 |

**t_labrun_subclass_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LABR-0001 | LABR-0001 | LABR-0003 | 241 |
| LABR-0002 | LABR-0001 | LABR-0007 | 320 |
| LABR-0003 | LABR-0002 | LABR-0003 | 688 |
| LABR-0004 | LABR-0002 | LABR-0007 | 479 |
| LABR-0005 | LABR-0003 | LABR-0003 | 481 |
| LABR-0006 | LABR-0003 | LABR-0007 | 200 |
| LABR-0007 | LABR-0004 | LABR-0003 | 208 |
| LABR-0008 | LABR-0004 | LABR-0007 | 121 |

**t_labrun_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LABR-0001 | LABR-0001 | LABR-0004 | node-b14 |
| LABR-0002 | LABR-0001 | LABR-0005 | Log Level 02 |
| LABR-0003 | LABR-0001 | LABR-0006 | closeout |
| LABR-0004 | LABR-0001 | LABR-0010 | pending |
| LABR-0005 | LABR-0001 | LABR-0011 | Triggered By 05 |
| LABR-0006 | LABR-0002 | LABR-0004 | ingest-21 |
| LABR-0007 | LABR-0002 | LABR-0005 | Log Level 07 |
| LABR-0008 | LABR-0002 | LABR-0006 | closeout |

Attributes and their types form the second pillar of the model, providing a schema for describing entity properties without hardcoding column structures into the domain tables. An attribute definition pairs a human-readable name with a formal type constraint—for instance, the attribute duration_seconds is declared as xsd:decimal, while end_time carries the type xsd:dateTime and exit_code is xsd:integer. This type discipline ensures that values are validated at ingestion and that downstream consumers can reason about data semantics without inspecting raw content. The attribute catalog itself is extensible: new attributes can be introduced without schema migration, and existing ones can be retired gracefully. In practice, a single laboratory run such as LABR-0001 may carry multiple attributes simultaneously—a host_name of node-b14, an exit_code of 241, a duration of 7187.70 seconds, and an end_time of 2023-06-03T03:48:13—each stored in its own typed value table to preserve type safety.

Typed value tables enforce the attribute type contract by segregating values according to their schema. Decimal values like 7187.70, 5360.85, and 3249.87 reside in the decimal value table; integer values such as 241, 320, and 688 in the integer table; datetime values like 2024-12-03T15:21:58 in the datetime table; and free-form strings such as node-b14, Log Level 02, closeout, and pending in the varchar table. Each value row references its owning entity and its defining attribute, creating a sparse but fully typed property graph. This design avoids the common pitfall of storing all values as strings and then casting at query time, which introduces ambiguity and runtime errors. Instead, the type is declared once in the attribute definition and enforced by the value table's column type, making the model both type-safe and schema-flexible.

Relationships between entities are captured through junction tables that carry not only the subject and target identifiers but also a role that describes the nature of the connection. In the ganglion cyst tissue origin model, a tissue origin identified as ORIG-0007 may be linked to a connective tissue structure ORIG-0001 with the role of reviewer, while ORIG-0002 connects to ORIG-0006 as owner. The subject column points to the originating entity and the target column to the referenced entity, while the role column—taking values such as reviewer, contributor, or owner—adds semantic context that would be lost in a simple foreign-key pair. This tripartite relationship model supports complex provenance and ownership tracking, which is essential for compliance auditing where knowing who owns a data asset and who reviewed it is as important as knowing what the asset is.

**t_ganglion_cyst_tissue_origin_part_of**

| id | part_of |
| --- | --- |
| ORIG-0001 | periosteal layer |
| ORIG-0002 | joint capsule |
| ORIG-0003 | deep fascia |
| ORIG-0004 | fibrous adventitia |
| ORIG-0005 | periosteal layer |
| ORIG-0006 | periosteal layer |

**t_ganglion_cyst_tissue_origin__part_of**

| id | ganglion_id | part_of_id | role |
| --- | --- | --- | --- |
| ORIG-0001 | ORIG-0007 | ORIG-0001 | reviewer |
| ORIG-0002 | ORIG-0008 | ORIG-0001 | contributor |
| ORIG-0003 | ORIG-0007 | ORIG-0005 | owner |
| ORIG-0004 | ORIG-0002 | ORIG-0006 | owner |
| ORIG-0005 | ORIG-0003 | ORIG-0005 | reviewer |
| ORIG-0006 | ORIG-0008 | ORIG-0006 | observer |
| ORIG-0007 | ORIG-0003 | ORIG-0005 | contributor |
| ORIG-0008 | ORIG-0005 | ORIG-0005 | observer |

The model also accommodates domain-specific metadata that does not fit the generic attribute-value pattern. eBPF programs carry a MIME type—application/xml for a seccomp profile loader, application/parquet for a network policy enforcer, application/octet-stream for an XDP packet dropper, text/csv for a credential validation probe—and a size in bytes, such as 613043965 bytes for the seccomp profile loader or 79215808 bytes for the credential validation probe. These properties are stored directly on the entity rather than through the attribute system because they are intrinsic to the object's identity and are queried with high frequency. Similarly, the anatomical domain distinguishes between a tissue origin (sacroiliac joint, metacarpophalangeal joint, subacromial bursa, first dorsal compartment) and the connective tissue structure it belongs to (periosteal layer, joint capsule, deep fascia, fibrous adventitia), maintaining these as separate but linked concepts.

Laboratory runs bridge these domains by referencing external entities as input samples. A run named FlowCyt-Panel9 (LABR-0002) takes XDP-0001 as its input sample, while ELISA-Plate88 (LABR-0003) and PCR-Run-Alpha7 (LABR-0004) both reference XDP-0005. This cross-domain referencing demonstrates that the identifier is truly universal: the same key space that identifies a tissue origin also identifies an eBPF program and a laboratory run, and the relationships between them are expressed through the same subject-target-role pattern. The result is a unified data fabric where compliance controls can be applied consistently—whether auditing the provenance of a biological sample, the integrity of a kernel security module, or the attributes of a laboratory experiment—because every object, property, and relationship is governed by the same structural principles.