---
chapter_id: ch_live_artifact_with_universal_703432
topic_id: 186
family: 01_foundation
cited_terms: ['artifact_with_universal', 'syscall_basic', 'bpf_helper_subclass']
model: engine-refine
---

The metadata management framework relies on a disciplined identifier scheme to anchor every tracked resource across heterogeneous data domains. Identifiers follow a structured prefix convention—`UNIV-0001` for universal artifacts, `SYSC-0001` for system call records, and `HELP-0001` for BPF helper subclasses—providing a consistent, machine-parseable key that serves as the primary reference point for all cross-table relationships. This identifier column appears not only as the primary key in entity-defining tables such as `t_artifact_with_universal`, `t_syscall_basic`, and `t_bpf_helper_subclass`, but also as a typed attribute itself within the attribute registry, where it is classified under the `cco:DesignativeICE` type, signaling that identifiers are treated as first-class metadata properties rather than mere structural artifacts.

**t_artifact_with_universal**

| id | artifact | related | created_date | location |
| --- | --- | --- | --- | --- |
| UNIV-0001 | Audit_Reporter | GPU_Compute_Pool | 2024-12-09 | us-east-1 |
| UNIV-0002 | Feature_Vector_Store | Metadata_Registry | 2024-11-04 | us-east-1 |
| UNIV-0003 | Schema_Definition | GPU_Compute_Pool | 2024-10-11 | on-prem-dc1 |
| UNIV-0004 | Container_Image_Release | Compliance_Audit_Log | 2024-10-15 | us-east-1 |
| UNIV-0005 | Data_Pipeline_Export | Metadata_Registry | 2023-07-24 | eu-west-3 |
| UNIV-0006 | Feature_Vector_Store | Metrics_Stream_Prometheus | 2025-04-25 | ap-south-2 |
| UNIV-0007 | Workflow_Scheduler | GPU_Compute_Pool | 2023-11-17 | on-prem-dc1 |

**t_bpf_helper_subclass**

| id | bpf | b_p_f_helper_function |
| --- | --- | --- |
| HELP-0001 | xdp_router_v4 | perf_cpu_idle |
| HELP-0002 | perf_cpu_idle | bpf_get_current_pid_tgid |
| HELP-0003 | bpf_skb_change_head | bpf_perf_event_output |
| HELP-0004 | bpf_redirect | tc_ingress_filter |
| HELP-0005 | bpf_map_lookup_elem | bpf_probe_read |
| HELP-0006 | bpf_skb_change_head | bpf_redirect |
| HELP-0007 | bpf_perf_event_output | bpf_probe_read |

**t_bpf_helper_subclass_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| HELP-0001 | checksum | xsd:string |
| HELP-0002 | created_date | xsd:date |
| HELP-0003 | identifier | cco:DesignativeICE |
| HELP-0004 | license | xsd:string |
| HELP-0005 | mime_type | xsd:string |
| HELP-0006 | size_bytes | xsd:long |
| HELP-0007 | uri | xsd:string |
| HELP-0008 | version | xsd:integer |

**t_bpf_helper_subclass_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| HELP-0001 | HELP-0001 | HELP-0006 | 475 |
| HELP-0002 | HELP-0001 | HELP-0008 | 7 |
| HELP-0003 | HELP-0002 | HELP-0006 | 134 |
| HELP-0004 | HELP-0002 | HELP-0008 | 6 |
| HELP-0005 | HELP-0003 | HELP-0006 | 422 |
| HELP-0006 | HELP-0003 | HELP-0008 | 7 |
| HELP-0007 | HELP-0004 | HELP-0006 | 484 |
| HELP-0008 | HELP-0004 | HELP-0008 | 3 |

Attributes and their associated types form the schema layer that governs what properties can be recorded and how they are validated. The attribute registry in `t_bpf_helper_subclass_attr` maps attribute names such as `checksum`, `created_date`, `identifier`, and `license` to their corresponding data types—`xsd:string`, `xsd:date`, `cco:DesignativeICE`, and `xsd:string` respectively—enforcing type discipline across the system. This separation of attribute definition from attribute value allows the framework to support heterogeneous value storage: date values reside in `t_bpf_helper_subclass_val_date`, integer values in `t_bpf_helper_subclass_val_int`, and string values in `t_bpf_helper_subclass_val_varchar`, each table carrying the same structural columns of `id`, `entity_id`, `attr_id`, and `value` while differing only in the semantic type of the stored data.

**t_bpf_helper_subclass_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| HELP-0001 | HELP-0001 | HELP-0002 | 2024-01-27 |
| HELP-0002 | HELP-0002 | HELP-0002 | 2025-05-03 |
| HELP-0003 | HELP-0003 | HELP-0002 | 2023-03-14 |
| HELP-0004 | HELP-0004 | HELP-0002 | 2025-02-18 |
| HELP-0005 | HELP-0005 | HELP-0002 | 2024-07-06 |
| HELP-0006 | HELP-0006 | HELP-0002 | 2023-07-25 |
| HELP-0007 | HELP-0007 | HELP-0002 | 2024-02-22 |

**t_bpf_helper_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| HELP-0001 | HELP-0001 | HELP-0001 | 9d2b7a16 |
| HELP-0002 | HELP-0001 | HELP-0003 | urn:uuid:9f2a |
| HELP-0003 | HELP-0001 | HELP-0004 | Apache-2.0 |
| HELP-0004 | HELP-0001 | HELP-0009 | on-prem-dc1 |
| HELP-0005 | HELP-0001 | HELP-0005 | application/parquet |
| HELP-0006 | HELP-0001 | HELP-0010 | Name 06 |
| HELP-0007 | HELP-0001 | HELP-0011 | governance |
| HELP-0008 | HELP-0001 | HELP-0012 | Tags 08 |

The entity-attribute-value (EAV) pattern instantiated across the three value tables provides a flexible mechanism for associating properties with specific entities without requiring a fixed schema. An entity, identified by `entity_id`, can have multiple attributes attached through `attr_id`, and the same attribute can be defined once in the registry and reused across many entities. For example, the `checksum` attribute (`HELP-0001`) holds the value `9d2b7a16` for entity `HELP-0001`, while the `license` attribute (`HELP-0004`) carries `Apache-2.0` for the same entity, and the `identifier` attribute (`HELP-0003`) stores `urn:uuid:9f2a`—all within the varchar value table, demonstrating how a single entity can accumulate a rich set of string-valued properties through a uniform join pattern.

Temporal tracking is handled through the `createddate` concept, which appears both as a dedicated column in the artifact table and as a typed attribute in the attribute registry. In `t_artifact_with_universal`, created dates such as `2024-12-09` for `Audit_Reporter` and `2024-10-11` for `Schema_Definition` provide a straightforward audit trail of when each artifact was registered. The same temporal concept is also modeled as an attribute with the `xsd:date` type in the registry, and its values are stored in the date-specific value table, where entities like `HELP-0001` carry a `created_date` of `2024-01-27` and `HELP-0002` carries `2025-05-03`. This dual treatment—both as a structural column and as a first-class attribute—reflects the importance of provenance tracking across the system.

Location and provenance information is captured through the `location` column in the artifact table, where values such as `us-east-1` and `on-prem-dc1` distinguish between cloud-hosted and on-premises deployments. The artifact `Container_Image_Release` is associated with `on-prem-dc1`, while `Feature_Vector_Store` and `Compliance_Audit_Log` both reside in `us-east-1`, providing immediate visibility into the infrastructure context of each resource. This location data complements the broader attribute system, where the same `on-prem-dc1` value also appears as a string-valued property of entity `HELP-0001` in the varchar value table, illustrating how location can be recorded either as a dedicated column or as a generic attribute depending on the entity type and the query patterns it supports.

Human-readable context and heterogeneous metadata are provided through `labeltext` and the `misc` value column. The `label_text` column in `t_syscall_basic` carries descriptive labels such as `pre-release note` for `SYSC-0001` (the `execve` syscall), `nightly summary` for `SYSC-0002` (the `mmap` syscall), and `calibration record` for both `SYSC-0003` and `SYSC-0004` (both `stat` syscalls), offering a layer of human-interpretable classification alongside the machine-readable syscall codes. The `misc` column, used as the value carrier in all three EAV value tables, accommodates values of varying semantics—whether a date like `2023-03-14`, an integer like `475`, or a string like `9d2b7a16`—demonstrating how the framework unifies disparate data types under a single storage pattern while preserving type discipline through the attribute registry.

**t_syscall_basic**

| id | syscall | code | label_text |
| --- | --- | --- | --- |
| SYSC-0001 | execve | D-33 | pre-release note |
| SYSC-0002 | mmap | B-12 | nightly summary |
| SYSC-0003 | stat | E-21 | calibration record |
| SYSC-0004 | stat | E-21 | pre-release note |
| SYSC-0005 | socket | B-12 | audit excerpt |
| SYSC-0006 | ioctl | C-07 | pre-release note |
| SYSC-0007 | stat | C-07 | audit excerpt |
| SYSC-0008 | unlink | B-12 | calibration record |