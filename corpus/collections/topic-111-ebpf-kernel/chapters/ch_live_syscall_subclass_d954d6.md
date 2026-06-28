---
chapter_id: ch_live_syscall_subclass_d954d6
topic_id: 111
family: 04_ebpf_kernel
cited_terms: ['syscall_subclass', 'mass_function_min_one_focal', 'ebpfprogram_basic']
model: engine-refine
---

Syscall subsystem observability is captured through a star-schema arrangement that separates measurable event tallies from descriptive metadata. The fact table records each invocation with a surrogate key such as SYSC-0001 and a foreign key pointing to the owning subsystem, alongside a counter that quantifies occurrences—238 events for one subsystem, 382 for another, 198 for a third, and 52 for a fourth. The corresponding dimension table supplies human-readable labels and categorical classifications, pairing identifiers like SYSC-0001 with labels such as In Syscall Subsystem Label 01 and categories such as In Syscall Subsystem Category 01, thereby enabling analysts to aggregate event counts by functional grouping rather than by opaque numeric codes.

**fact_syscall**

| id | in_syscall_subsystem_key | event_count |
| --- | --- | --- |
| SYSC-0001 | SYSC-0004 | 238 |
| SYSC-0002 | SYSC-0002 | 52 |
| SYSC-0003 | SYSC-0003 | 198 |
| SYSC-0004 | SYSC-0005 | 382 |
| SYSC-0005 | SYSC-0002 | 283 |
| SYSC-0006 | SYSC-0001 | 288 |

**dim_in_syscall_subsystem**

| id | in_syscall_subsystem_label | in_syscall_subsystem_category |
| --- | --- | --- |
| SYSC-0001 | In Syscall Subsystem Label 01 | In Syscall Subsystem Category 01 |
| SYSC-0002 | In Syscall Subsystem Label 02 | In Syscall Subsystem Category 02 |
| SYSC-0003 | In Syscall Subsystem Label 03 | In Syscall Subsystem Category 03 |
| SYSC-0004 | In Syscall Subsystem Label 04 | In Syscall Subsystem Category 04 |
| SYSC-0005 | In Syscall Subsystem Label 05 | In Syscall Subsystem Category 05 |
| SYSC-0006 | In Syscall Subsystem Label 06 | In Syscall Subsystem Category 06 |

eBPF program inventory follows an identical dimensional pattern, anchoring binary artefacts to their operational characteristics. Each fact row carries a surrogate identifier—EBPF-0001 through EBPF-0004—and a foreign key that references the program's canonical definition, while recording the compiled size in bytes and the version number. Sizes range from 113 209 263 bytes for one programme to 784 335 640 bytes for another, with version numbers spanning 9 through 12; the dimension table then attaches descriptive labels and category tags, such as Ebpfprogram Label 03 mapped to Ebpfprogram Category 03, so that capacity planning and compliance audits can be performed at the categorical level without resolving every binary identifier individually.

**fact_ebpfprogram**

| id | ebpfprogram_key | size_bytes | version |
| --- | --- | --- | --- |
| EBPF-0001 | EBPF-0001 | 784335640 | 12 |
| EBPF-0002 | EBPF-0003 | 641704069 | 9 |
| EBPF-0003 | EBPF-0003 | 113209263 | 11 |
| EBPF-0004 | EBPF-0005 | 161013093 | 12 |
| EBPF-0005 | EBPF-0004 | 352203820 | 12 |
| EBPF-0006 | EBPF-0003 | 167519051 | 1 |

**dim_ebpfprogram**

| id | ebpfprogram_label | ebpfprogram_category |
| --- | --- | --- |
| EBPF-0001 | Ebpfprogram Label 01 | Ebpfprogram Category 01 |
| EBPF-0002 | Ebpfprogram Label 02 | Ebpfprogram Category 02 |
| EBPF-0003 | Ebpfprogram Label 03 | Ebpfprogram Category 03 |
| EBPF-0004 | Ebpfprogram Label 04 | Ebpfprogram Category 04 |
| EBPF-0005 | Ebpfprogram Label 05 | Ebpfprogram Category 05 |
| EBPF-0006 | Ebpfprogram Label 06 | Ebpfprogram Category 06 |
| EBPF-0007 | Ebpfprogram Label 07 | Ebpfprogram Category 07 |
| EBPF-0008 | Ebpfprogram Label 08 | Ebpfprogram Category 08 |

Beyond these two operational domains, the schema accommodates evidence-theoretic attribute tracking through a mass-function model that associates focal elements with typed attribute values. The focal-element table assigns a mass value—audit_trail_eta, provenance_record_epsilon, or sensor_array_gamma—to each focal element, which itself represents a proposition such as calibration_status, user_agent, or data_quality_flag. Attribute metadata is stored separately, enumerating names like confidence, dimension_kind, method, and recorded_at alongside their XML Schema types (xsd:decimal, xsd:string, xsd:dateTime), which governs how values are validated and compared across the evidence model.

**t_mass_function_min_one_focal**

| id | mass | focal_element |
| --- | --- | --- |
| FOCA-0001 | audit_trail_eta | calibration_status |
| FOCA-0002 | audit_trail_eta | calibration_status |
| FOCA-0003 | provenance_record_epsilon | user_agent |
| FOCA-0004 | sensor_array_gamma | data_quality_flag |
| FOCA-0005 | governance_log_delta | network_latency |
| FOCA-0006 | provenance_record_epsilon | location_geo |

**t_mass_function_min_one_focal_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| FOCA-0001 | confidence | xsd:decimal |
| FOCA-0002 | dimension_kind | xsd:string |
| FOCA-0003 | method | xsd:string |
| FOCA-0004 | recorded_at | xsd:dateTime |
| FOCA-0005 | uncertainty | xsd:decimal |
| FOCA-0006 | unit | xsd:string |
| FOCA-0007 | value | xsd:decimal |
| FOCA-0008 | encoding | xsd:string |

**t_mass_function_min_one_focal_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| FOCA-0001 | FOCA-0001 | FOCA-0004 | 2023-06-19T06:37:58 |
| FOCA-0002 | FOCA-0002 | FOCA-0004 | 2023-01-26T15:54:26 |
| FOCA-0003 | FOCA-0003 | FOCA-0004 | 2024-04-19T20:46:34 |
| FOCA-0004 | FOCA-0004 | FOCA-0004 | 2023-08-08T03:21:21 |
| FOCA-0005 | FOCA-0005 | FOCA-0004 | 2023-12-10T16:04:01 |
| FOCA-0006 | FOCA-0006 | FOCA-0004 | 2024-10-11T01:06:45 |

**t_mass_function_min_one_focal_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| FOCA-0001 | FOCA-0001 | FOCA-0001 | 0.223 |
| FOCA-0002 | FOCA-0001 | FOCA-0005 | 391.04 |
| FOCA-0003 | FOCA-0001 | FOCA-0007 | 110.73 |
| FOCA-0004 | FOCA-0002 | FOCA-0001 | 0.161 |
| FOCA-0005 | FOCA-0002 | FOCA-0005 | 309.80 |
| FOCA-0006 | FOCA-0002 | FOCA-0007 | 695.08 |
| FOCA-0007 | FOCA-0003 | FOCA-0001 | 0.178 |
| FOCA-0008 | FOCA-0003 | FOCA-0005 | 14.20 |

**t_mass_function_min_one_focal_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| FOCA-0001 | FOCA-0001 | FOCA-0002 | Dimension Kind 01 |
| FOCA-0002 | FOCA-0001 | FOCA-0008 | Encoding 02 |
| FOCA-0003 | FOCA-0001 | FOCA-0009 | calibration record |
| FOCA-0004 | FOCA-0001 | FOCA-0010 | es |
| FOCA-0005 | FOCA-0001 | FOCA-0003 | hybrid |
| FOCA-0006 | FOCA-0001 | FOCA-0006 | ratio |
| FOCA-0007 | FOCA-0002 | FOCA-0002 | Dimension Kind 07 |
| FOCA-0008 | FOCA-0002 | FOCA-0008 | Encoding 08 |

Typed value tables materialise the attribute assignments for each entity. Decimal attributes such as confidence receive floating-point measurements—0.223 and 0.161 for one entity, 391.04 and 110.73 for another—while varchar attributes capture categorical descriptors like Dimension Kind 01, Encoding 02, calibration record, and es. DateTime attributes record timestamps in ISO 8601 format, with values such as 2023-06-19T06:37:58, 2023-01-26T15:54:26, 2024-04-19T20:46:34, and 2023-08-08T03:21:21, enabling temporal correlation of evidence assertions. Each value row carries a surrogate identifier, an entity reference, and an attribute reference, forming a normalized junction that preserves type safety while supporting arbitrary attribute cardinality per entity.