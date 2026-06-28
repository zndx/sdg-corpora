---
chapter_id: ch_live_nist80053_control_subclass_88849d
topic_id: 188
family: 07_long_tail
cited_terms: ['nist80053_control_subclass', 'ebpfprogram_union_kprobe_or_xdp', 'ebpfmap_with_key_type']
model: engine-refine
---

In governance and telemetry registries, an identifier is the durable surrogate key that binds a record across normalized stores without relying on display names that may change or collide. Control subclasses in a NIST SP 800-53–aligned catalog carry identifiers such as CONT-0001 through CONT-0004, each anchoring a distinct control family—AC-3 under NIST SP 800-53 Rev 5, CM-3 under NIST SP 800-171, SI-4 under NIST CSF 2.0, SA-4 under NIST SP 800-207—so that audit evidence, attribute values, and crosswalks can be joined on a single stable token rather than on free-text control titles. The same principle extends to runtime instrumentation artifacts: eBPF program union records use XDP-0001–XDP-0004 to distinguish, for example, a seccomp_profile_loader from a credential_validation_probe, while map fact rows employ TYPE-0001–TYPE-0004 to track concrete map instances independently of their key-type semantics. Identifier discipline is therefore not merely naming convenience; it is the precondition for referential integrity when facts are partitioned across typed value tables, dimension tables, and binary payload registries.

**t_nist80053_control_subclass**

| id | nist | nist80053_control |
| --- | --- | --- |
| CONT-0001 | NIST SP 800-53 Rev 5 | AC-3 |
| CONT-0002 | NIST SP 800-171 | CM-3 |
| CONT-0003 | NIST CSF 2.0 | SI-4 |
| CONT-0004 | NIST SP 800-207 | SA-4 |
| CONT-0005 | FIPS 140-3 | SR-1 |
| CONT-0006 | NIST SP 800-171 | AU-6 |

**t_nist80053_control_subclass_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| CONT-0001 | effective_date | xsd:date |
| CONT-0002 | enforcement | xsd:string |
| CONT-0003 | mandatory | xsd:boolean |
| CONT-0004 | priority | xsd:integer |
| CONT-0005 | review_cycle_days | xsd:integer |
| CONT-0006 | scope | xsd:string |
| CONT-0007 | encoding | xsd:string |
| CONT-0008 | label_text | xsd:string |

**t_nist80053_control_subclass_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONT-0001 | CONT-0001 | CONT-0004 | 3 |
| CONT-0002 | CONT-0001 | CONT-0005 | 776 |
| CONT-0003 | CONT-0002 | CONT-0004 | 4 |
| CONT-0004 | CONT-0002 | CONT-0005 | 46 |
| CONT-0005 | CONT-0003 | CONT-0004 | 1 |
| CONT-0006 | CONT-0003 | CONT-0005 | 151 |
| CONT-0007 | CONT-0004 | CONT-0004 | 4 |
| CONT-0008 | CONT-0004 | CONT-0005 | 507 |

An entity is the governed or operational object those identifiers denote—the control subclass, the loaded program bundle, or the map whose lifecycle compliance officers and platform engineers must reason about jointly. Attribute definitions (attr) name the measurable or declarative facets attached to an entity, and attr_type declares the validation and storage contract under which each facet must be interpreted. In the control-subclass pattern, effective_date is typed as xsd:date, enforcement as xsd:string, mandatory as xsd:boolean, and priority as xsd:integer, which forces values into segregated physical stores matched to their datatype rather than into a single untyped bag. Boolean mandatory flags for CONT-0001–CONT-0003 resolve to true while CONT-0004 resolves to false; effective dates span 2023-01-02 through 2025-03-12; integer priorities include both small ordinals (3, 4) and large operational weights (776, 46); varchar enforcement strings carry human-readable tokens such as "Enforcement 02" and locale markers such as "es." The attr/attr_type pairing thus operationalizes schema-on-write for compliance metadata: auditors know that a date field cannot silently absorb a string, and engineers can index and query each datatype without lossy coercion.

**t_nist80053_control_subclass_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONT-0001 | CONT-0001 | CONT-0003 | true |
| CONT-0002 | CONT-0002 | CONT-0003 | true |
| CONT-0003 | CONT-0003 | CONT-0003 | true |
| CONT-0004 | CONT-0004 | CONT-0003 | false |
| CONT-0005 | CONT-0005 | CONT-0003 | true |
| CONT-0006 | CONT-0006 | CONT-0003 | true |

**t_nist80053_control_subclass_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONT-0001 | CONT-0001 | CONT-0001 | 2023-01-02 |
| CONT-0002 | CONT-0002 | CONT-0001 | 2024-11-29 |
| CONT-0003 | CONT-0003 | CONT-0001 | 2024-03-23 |
| CONT-0004 | CONT-0004 | CONT-0001 | 2025-03-12 |
| CONT-0005 | CONT-0005 | CONT-0001 | 2024-03-19 |
| CONT-0006 | CONT-0006 | CONT-0001 | 2023-10-15 |

**t_nist80053_control_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONT-0001 | CONT-0001 | CONT-0007 | Encoding 01 |
| CONT-0002 | CONT-0001 | CONT-0002 | Enforcement 02 |
| CONT-0003 | CONT-0001 | CONT-0008 | calibration record |
| CONT-0004 | CONT-0001 | CONT-0009 | es |
| CONT-0005 | CONT-0001 | CONT-0006 | Scope 05 |
| CONT-0006 | CONT-0002 | CONT-0007 | Encoding 06 |
| CONT-0007 | CONT-0002 | CONT-0002 | Enforcement 07 |
| CONT-0008 | CONT-0002 | CONT-0008 | audit excerpt |

The misc column name signals a deliberate polymorphism: it holds the payload proper when that payload is either descriptive text or a value whose interpretation is delegated to sibling columns (entity, attr) rather than to a dedicated scalar type in the column header itself. On dimension rows, misc carries key_type_label values ("Key Type Label 01" through "Key Type Label 04"), while category supplies the coarser partition—"Key Type Category 01" through "Key Type Category 04"—that roll-ups and access policies typically consume. Category therefore answers "which family does this belong to?" whereas type, often expressed as a foreign key such as key_type_key referencing TYPE-0005 or TYPE-0006, answers "which precise semantic template governs structure and behavior?" A fact_ebpfmap row at TYPE-0001 with key_type_key TYPE-0005, size_bytes 208979093, and version 3 is not interchangeable with TYPE-0003 at 31105012 bytes and version 12 even if both maps serve observability goals; version increments capture material revisions to layout, compatibility, or population rules that identifiers alone would obscure.

**fact_ebpfmap**

| id | key_type_key | size_bytes | version |
| --- | --- | --- | --- |
| TYPE-0001 | TYPE-0005 | 208979093 | 3 |
| TYPE-0002 | TYPE-0006 | 156714508 | 6 |
| TYPE-0003 | TYPE-0006 | 31105012 | 12 |
| TYPE-0004 | TYPE-0002 | 354373995 | 5 |
| TYPE-0005 | TYPE-0004 | 866267293 | 2 |

**dim_key_type**

| id | key_type_label | key_type_category |
| --- | --- | --- |
| TYPE-0001 | Key Type Label 01 | Key Type Category 01 |
| TYPE-0002 | Key Type Label 02 | Key Type Category 02 |
| TYPE-0003 | Key Type Label 03 | Key Type Category 03 |
| TYPE-0004 | Key Type Label 04 | Key Type Category 04 |
| TYPE-0005 | Key Type Label 05 | Key Type Category 05 |
| TYPE-0006 | Key Type Label 06 | Key Type Category 06 |

Binary and semi-structured artifacts introduce mimetype and byte-scale fields as first-class governance dimensions. The mimetype (also surfaced as mime_type in union registries) states how a consumer must decode a payload: application/xml for structured policy interchange, application/parquet for columnar analytic extracts, application/octet-stream for opaque compiled objects, text/csv for tabular exports. Pairing mimetype with size_bytes—or the orthographically equivalent sizebytes—quantifies retention, transfer, and integrity-check expectations independently of logical type. An XDP-0002 network_policy_enforcer artifact at 757467115 bytes under application/parquet implies a different evidence chain than XDP-0004 credential_validation_probe output at 79215808 bytes as text/csv; storage planners treat the 613043965-byte application/xml bundle associated with XDP-0001 as a capacity and archival-tier decision, while security reviewers treat mimetype as the gate for permitted parsers and sandbox boundaries. Because the same physical measure may appear under size_bytes or sizebytes depending on table lineage, operational guides should treat them as one concept—octet length of the stored artifact—while enforcing unit consistency in cross-table analytics.

Type and version jointly complete the operational picture that identifiers and categories begin. Type keys knit facts to dimensions: fact_ebpfmap rows reference key_type_key values TYPE-0002 and TYPE-0006, resolving through dim_key_type into labeled, categorized semantics usable in policy engines and dashboards. Version on fact rows records generational drift—values 3, 6, 12, and 5 across TYPE-0001–TYPE-0004—so that breaking changes to map definition, eviction policy, or value width trigger explicit migration workflows rather than silent overwrite. In the eBPF program union, logical type is further distributed across multiple program slots (ebpfprogram, ebpfprogram_2, ebpfprogram_3), reflecting that a single deployed identifier such as XDP-0003 may bundle an xdp_packet_dropper with a memory_pressure_observer and a perf_cpu_clock_sampler under one octet-stream envelope of 333629998 bytes. Taken together, identifier, entity, attr, attr_type, category, type, mimetype, misc, size measures, and version form a layered evidence model: stable keys, typed metadata, hierarchical classification, decode contracts, measured payloads, and revision history—each field answering a distinct question auditors and operators must not conflate if attestations are to remain defensible under examination.

**t_ebpfprogram_union_kprobe_or_xdp**

| id | ebpfprogram | ebpfprogram_2 | ebpfprogram_3 | mime_type | size_bytes |
| --- | --- | --- | --- | --- | --- |
| XDP-0001 | seccomp_profile_loader | ptrace_attach_monitor | tcp_state_monitor | application/xml | 613043965 |
| XDP-0002 | network_policy_enforcer | network_interface_stat | network_interface_stat | application/parquet | 757467115 |
| XDP-0003 | xdp_packet_dropper | memory_pressure_observer | perf_cpu_clock_sampler | application/octet-stream | 333629998 |
| XDP-0004 | credential_validation_probe | security_file_open_hook | tcp_state_monitor | text/csv | 79215808 |
| XDP-0005 | syscall_audit_filter | capability_change_hook | memory_pressure_observer | text/plain | 893084779 |