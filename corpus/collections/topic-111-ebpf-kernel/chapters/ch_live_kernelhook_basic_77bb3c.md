---
chapter_id: ch_live_kernelhook_basic_77bb3c
topic_id: 111
family: 04_ebpf_kernel
cited_terms: ['kernelhook_basic', 'kernelhook_for_subsystem', 'kernelhook_in_kernel_module']
model: engine-refine
---

Kernel hook identifiers serve as the primary keys for tracking individual instrumentation points within the operating system kernel, with designations such as KERN-0001 through KERN-0004 mapping to concrete mechanisms including EPT_Memory_Trace for extended page table–based memory observation, BPF-co-re-syscall for eBPF Common Reuse–based syscall interception, KeAttachProcess_Spy for kernel-mode process attachment monitoring, and IDT_KiDispatch_Stub for interrupt descriptor table–level dispatch stubbing. Each identifier anchors a rich attribute model that captures metadata about the hook's properties and constraints. Attribute definitions are formalized through a typed schema where attribute names such as checksum, created_date, identifier, and license are paired with their corresponding data types—xsd:string for textual and checksum values, xsd:date for temporal metadata, and cco:DesignativeICE for designative identifiers—ensuring that every attribute value conforms to a well-defined schema namespace and can be validated at ingestion time.

**t_kernelhook_basic**

| id | kernelhook |
| --- | --- |
| KERN-0001 | EPT_Memory_Trace |
| KERN-0002 | BPF-co-re-syscall |
| KERN-0003 | KeAttachProcess_Spy |
| KERN-0004 | IDT_KiDispatch_Stub |
| KERN-0005 | Tracepoint-block-io |
| KERN-0006 | Fentry-kernel-init |

**t_kernelhook_basic_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| KERN-0001 | checksum | xsd:string |
| KERN-0002 | created_date | xsd:date |
| KERN-0003 | identifier | cco:DesignativeICE |
| KERN-0004 | license | xsd:string |
| KERN-0005 | mime_type | xsd:string |
| KERN-0006 | size_bytes | xsd:long |
| KERN-0007 | uri | xsd:string |
| KERN-0008 | version | xsd:integer |

The attribute-value relationship is materialized through entity-centric value tables that separate data by type to preserve schema integrity and query performance. Date attributes are stored in a dedicated value table where entity identifiers such as KERN-0001 through KERN-0004 are linked to their respective created_date attributes, yielding temporal values ranging from 2023-02-05 through 2025-01-30, thereby establishing a clear audit trail of when each hook was registered or last modified. Integer attributes, including values such as 323, 12, 186, and 2, are similarly isolated in a typed value store and associated with entities through foreign-key joins on entity_id and attr_id, supporting efficient range queries and aggregation over numeric properties. Variable-length string attributes—such as the checksum a3f9c21e, the resource identifier gid://svc/77, the license designation Apache-2.0, and the geographic region eu-west-3—are captured in a varchar value table, enabling flexible storage of unstructured or semi-structured metadata without compromising the type discipline enforced at the schema level.

**t_kernelhook_basic_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| KERN-0001 | KERN-0001 | KERN-0002 | 2023-02-05 |
| KERN-0002 | KERN-0002 | KERN-0002 | 2024-05-21 |
| KERN-0003 | KERN-0003 | KERN-0002 | 2024-01-08 |
| KERN-0004 | KERN-0004 | KERN-0002 | 2025-01-30 |
| KERN-0005 | KERN-0005 | KERN-0002 | 2023-03-23 |
| KERN-0006 | KERN-0006 | KERN-0002 | 2024-01-11 |

**t_kernelhook_basic_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| KERN-0001 | KERN-0001 | KERN-0006 | 323 |
| KERN-0002 | KERN-0001 | KERN-0008 | 12 |
| KERN-0003 | KERN-0002 | KERN-0006 | 186 |
| KERN-0004 | KERN-0002 | KERN-0008 | 2 |
| KERN-0005 | KERN-0003 | KERN-0006 | 276 |
| KERN-0006 | KERN-0003 | KERN-0008 | 4 |
| KERN-0007 | KERN-0004 | KERN-0006 | 346 |
| KERN-0008 | KERN-0004 | KERN-0008 | 11 |

**t_kernelhook_basic_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| KERN-0001 | KERN-0001 | KERN-0001 | a3f9c21e |
| KERN-0002 | KERN-0001 | KERN-0003 | gid://svc/77 |
| KERN-0003 | KERN-0001 | KERN-0004 | Apache-2.0 |
| KERN-0004 | KERN-0001 | KERN-0009 | eu-west-3 |
| KERN-0005 | KERN-0001 | KERN-0005 | text/plain |
| KERN-0006 | KERN-0001 | KERN-0010 | Name 06 |
| KERN-0007 | KERN-0001 | KERN-0011 | governance |
| KERN-0008 | KERN-0001 | KERN-0012 | Tags 08 |

Kernel subsystems are modeled as a dimensional hierarchy that classifies hooks by their operational domain and functional category. The fact table for kernel hooks links each subsystem key—SUBS-0001 through SUBS-0007—to concrete measurements of binary footprint and version lineage, with size_bytes values spanning from approximately 27.3 million bytes (SUBS-0005 at 272822846 bytes) to 560.9 million bytes (SUBS-0007 at 560962979 bytes), and version numbers ranging from 1 to 10, reflecting the maturity and iteration history of each subsystem component. The corresponding dimension table provides human-readable labels such as For Kernel Subsystem Label 01 through For Kernel Subsystem Label 04, alongside categorical classifications like For Kernel Subsystem Category 01 through For Kernel Subsystem Category 04, enabling analytical slicing by functional domain—whether memory management, file system operations, network stack, or device driver infrastructure.

**fact_kernelhook**

| id | for_kernel_subsystem_key | size_bytes | version |
| --- | --- | --- | --- |
| SUBS-0001 | SUBS-0005 | 36342735 | 3 |
| SUBS-0002 | SUBS-0007 | 560962979 | 1 |
| SUBS-0003 | SUBS-0001 | 456299832 | 10 |
| SUBS-0004 | SUBS-0005 | 272822846 | 1 |

**dim_for_kernel_subsystem**

| id | for_kernel_subsystem_label | for_kernel_subsystem_category |
| --- | --- | --- |
| SUBS-0001 | For Kernel Subsystem Label 01 | For Kernel Subsystem Category 01 |
| SUBS-0002 | For Kernel Subsystem Label 02 | For Kernel Subsystem Category 02 |
| SUBS-0003 | For Kernel Subsystem Label 03 | For Kernel Subsystem Category 03 |
| SUBS-0004 | For Kernel Subsystem Label 04 | For Kernel Subsystem Category 04 |
| SUBS-0005 | For Kernel Subsystem Label 05 | For Kernel Subsystem Category 05 |
| SUBS-0006 | For Kernel Subsystem Label 06 | For Kernel Subsystem Category 06 |
| SUBS-0007 | For Kernel Subsystem Label 07 | For Kernel Subsystem Category 07 |

The deployment context of each kernel hook is further enriched by module-level metadata that captures licensing obligations and geographic deployment zones. Hooks such as KeAttachProcess_Spy are associated with kernel modules like VFS-mkdir and Tracepoint-block-io under licenses including GPL-3.0 and MIT, while the Netfilter-conntrack module carries both CC-BY-4.0 and MIT licensing terms depending on the specific hook variant, and the proprietary amdkmdag.sys module hosts the Netfilter-conntrack hook in the ap-south-2 region. Geographic locations span multiple cloud availability zones—zone-b, us-east-1, eu-west-3, and ap-south-2—reflecting the distributed nature of modern kernel instrumentation deployments and the need to track compliance boundaries across jurisdictions. This module-level provenance data, combined with the attribute-value model and subsystem categorization, forms a comprehensive governance framework that supports license compliance auditing, version tracking, footprint analysis, and operational oversight across heterogeneous kernel environments.

**t_kernelhook_in_kernel_module**

| id | kernelhook | in_kernel_module | license | location |
| --- | --- | --- | --- | --- |
| MODU-0001 | KeAttachProcess_Spy | Netfilter-conntrack | CC-BY-4.0 | zone-b |
| MODU-0002 | KeAttachProcess_Spy | VFS-mkdir | GPL-3.0 | us-east-1 |
| MODU-0003 | Security-file-open | Tracepoint-block-io | MIT | eu-west-3 |
| MODU-0004 | Netfilter-conntrack | amdkmdag.sys | MIT | ap-south-2 |
| MODU-0005 | nvlddmkm.sys | Inline_NtQuerySystem | proprietary | zone-b |
| MODU-0006 | LSM-apparmor | KeAttachProcess_Spy | CC-BY-4.0 | eu-west-3 |
| MODU-0007 | Security-file-open | XDP-rx-filter | CC-BY-4.0 | eu-west-3 |
| MODU-0008 | ObRegisterCallbacks_Logger | Syscall-read | MPL-2.0 | zone-b |