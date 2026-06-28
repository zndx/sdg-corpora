---
chapter_id: ch_live_attribute_set_basic_d0de14
topic_id: 186
family: 02_observation_measurement
cited_terms: ['attribute_set_basic', 'schemaorg_event_starttime', 'ebpfprogram_union_kprobe_or_xdp']
model: engine-refine
---

In governed data environments, every assertion about a real-world object must be addressable, typed, and bound to the thing it describes. The identifier serves as the immutable handle that survives renames, repartitioning, and cross-system federation: a sensor reading lineage might be traced through SET-0001 while a schema.org fact remains STAR-0001 and an eBPF artifact stays XDP-0001, each key stable enough to support audit replay without conflating distinct records. The entity is the subject of those assertions—not the attribute definition, but the instance being characterized. When confidence scores of 0.501 and 0.946 attach to entity SET-0001 and SET-0002 respectively, the governance question is not merely what was measured but which sensor or data source instance the measurement belongs to, a distinction enforced by repeating entity identifiers across typed value stores so that joins and compliance queries can reconstruct a complete profile per object.

**t_attribute_set_basic**

| id | attribute |
| --- | --- |
| SET-0001 | Sensor ID |
| SET-0002 | Sensor ID |
| SET-0003 | Sensor ID |
| SET-0004 | Data Source |
| SET-0005 | Sample Mass |
| SET-0006 | Quality Flag |

**t_attribute_set_basic_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| SET-0001 | confidence | xsd:decimal |
| SET-0002 | dimension_kind | xsd:string |
| SET-0003 | method | xsd:string |
| SET-0004 | recorded_at | xsd:dateTime |
| SET-0005 | uncertainty | xsd:decimal |
| SET-0006 | unit | xsd:string |
| SET-0007 | value | xsd:decimal |
| SET-0008 | encoding | xsd:string |

Attributes and their types form the contract layer between producers and consumers. An attr such as confidence, dimension_kind, method, or recorded_at names the semantic role of a value, while attr_type—here expressed as XSD primitives like xsd:decimal, xsd:string, and xsd:dateTime—dictates validation rules, serialization, and the physical store in which values may legally reside. Decimal confidence and dimensional magnitudes (613.30, 863.60) land in numeric tables; string encodings and audit excerpts ("Encoding 02", "audit excerpt", locale code "fr") land in varchar stores; and temporal stamps including 2025-04-11T14:14:38 and 2023-07-18T04:02:37 land in datetime stores. This separation is not cosmetic: it prevents type coercion errors in analytics pipelines, enables schema evolution without rewriting unrelated columns, and gives compliance officers a machine-checkable basis for asserting that recorded_at values were captured as instants rather than free text. The misc designation captures payload values whose interpretation depends on context—the same slot may hold a timestamp, a human-readable dimension label ("Dimension Kind 01"), or a jurisdictional marker—requiring consumers to resolve meaning through the paired attr and attr_type metadata rather than inferring semantics from storage location alone.

Temporal governance introduces event start time as the anchor that situates facts within reporting periods, retention windows, and incident timelines. Facts reference event_start_time through surrogate keys such as STAR-0005 or STAR-0001, while a conformed dimension supplies human-legible labels ("Event Start Time Label 01" through "04") and category groupings ("Event Start Time Category 01" through "04") that roll individual instants into policy-relevant buckets. A fact tying STAR-0001 to event_start_time_key STAR-0001 therefore inherits both a specific temporal identity and a categorical posture suitable for SLA dashboards, regulatory cutoffs, and cross-dataset alignment. Category in this role is not a vague tag but a controlled vocabulary element that standardizes how otherwise heterogeneous timestamps participate in the same compliance narrative—whether the underlying event is a ingestion boundary, a billing cycle, or a security observation window.

Binary and semi-structured artifacts extend the same governance primitives into operational telemetry and executable content. Mime type—application/xml, application/parquet, application/octet-stream, text/csv—declares how downstream systems must parse, validate, and retain payloads ranging from seccomp profile loaders to credential validation probes, determining which integrity checks apply and which export controls may trigger. Size measurements appear under both size_bytes and sizebytes naming conventions but serve an identical operational purpose: quantifying storage footprint (from roughly 79 MB through nearly 998 MB in the observed samples) for capacity planning, cost allocation, and retention enforcement. Large parquet or XML program bundles demand different backup tiers and deletion approvals than compact CSV extracts; recording byte counts alongside identifiers makes those decisions auditable rather than anecdotal.

Version completes the lineage story for evolving standards and regenerated datasets. Schema.org facts carrying versions 3, 5, 4, and 8 signal that the same logical identifier may denote materially different shapes or enrichment passes over time, requiring consumers to declare compatibility expectations and migration paths. Together, identifier, entity, attr, attr_type, category, event_start_time, mimetype, misc, size_bytes, sizebytes, and version constitute a layered evidence model: stable keys bind assertions to instances; typed attributes define what may be said; categories and temporal dimensions place assertions in policy context; mime and size govern artifact handling; and version marks the epoch in which a record's meaning was valid. Practitioners who treat these fields as first-class governance objects—not incidental columns—gain defensible provenance, interoperable validation, and operational controls that scale from sensor metadata through warehouse facts to kernel-level program inventories.

**t_attribute_set_basic_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SET-0001 | SET-0001 | SET-0004 | 2025-04-11T14:14:38 |
| SET-0002 | SET-0002 | SET-0004 | 2024-10-27T12:43:31 |
| SET-0003 | SET-0003 | SET-0004 | 2023-07-18T04:02:37 |
| SET-0004 | SET-0004 | SET-0004 | 2025-04-28T09:26:57 |
| SET-0005 | SET-0005 | SET-0004 | 2023-08-28T23:05:03 |
| SET-0006 | SET-0006 | SET-0004 | 2024-02-14T11:29:41 |

**t_attribute_set_basic_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SET-0001 | SET-0001 | SET-0001 | 0.501 |
| SET-0002 | SET-0001 | SET-0005 | 613.30 |
| SET-0003 | SET-0001 | SET-0007 | 863.60 |
| SET-0004 | SET-0002 | SET-0001 | 0.946 |
| SET-0005 | SET-0002 | SET-0005 | 609.02 |
| SET-0006 | SET-0002 | SET-0007 | 173.62 |
| SET-0007 | SET-0003 | SET-0001 | 0.926 |
| SET-0008 | SET-0003 | SET-0005 | 843.81 |

**t_attribute_set_basic_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SET-0001 | SET-0001 | SET-0002 | Dimension Kind 01 |
| SET-0002 | SET-0001 | SET-0008 | Encoding 02 |
| SET-0003 | SET-0001 | SET-0009 | audit excerpt |
| SET-0004 | SET-0001 | SET-0010 | fr |
| SET-0005 | SET-0001 | SET-0003 | hybrid |
| SET-0006 | SET-0001 | SET-0006 | ratio |
| SET-0007 | SET-0002 | SET-0002 | Dimension Kind 07 |
| SET-0008 | SET-0002 | SET-0008 | Encoding 08 |

**fact_schemaorg**

| id | event_start_time_key | size_bytes | version |
| --- | --- | --- | --- |
| STAR-0001 | STAR-0005 | 895265030 | 3 |
| STAR-0002 | STAR-0003 | 114301972 | 5 |
| STAR-0003 | STAR-0001 | 338701831 | 4 |
| STAR-0004 | STAR-0001 | 998785819 | 8 |

**dim_event_start_time**

| id | event_start_time_label | event_start_time_category |
| --- | --- | --- |
| STAR-0001 | Event Start Time Label 01 | Event Start Time Category 01 |
| STAR-0002 | Event Start Time Label 02 | Event Start Time Category 02 |
| STAR-0003 | Event Start Time Label 03 | Event Start Time Category 03 |
| STAR-0004 | Event Start Time Label 04 | Event Start Time Category 04 |
| STAR-0005 | Event Start Time Label 05 | Event Start Time Category 05 |
| STAR-0006 | Event Start Time Label 06 | Event Start Time Category 06 |

**t_ebpfprogram_union_kprobe_or_xdp**

| id | ebpfprogram | ebpfprogram_2 | ebpfprogram_3 | mime_type | size_bytes |
| --- | --- | --- | --- | --- | --- |
| XDP-0001 | seccomp_profile_loader | ptrace_attach_monitor | tcp_state_monitor | application/xml | 613043965 |
| XDP-0002 | network_policy_enforcer | network_interface_stat | network_interface_stat | application/parquet | 757467115 |
| XDP-0003 | xdp_packet_dropper | memory_pressure_observer | perf_cpu_clock_sampler | application/octet-stream | 333629998 |
| XDP-0004 | credential_validation_probe | security_file_open_hook | tcp_state_monitor | text/csv | 79215808 |
| XDP-0005 | syscall_audit_filter | capability_change_hook | memory_pressure_observer | text/plain | 893084779 |