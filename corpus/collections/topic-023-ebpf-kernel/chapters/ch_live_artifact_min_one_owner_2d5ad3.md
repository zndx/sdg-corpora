---
chapter_id: ch_live_artifact_min_one_owner_2d5ad3
topic_id: 23
family: 07_long_tail
cited_terms: ['artifact_min_one_owner', 'ebpfprogram_attaches_kernelhook_xref', 'transformation_informed_by']
model: engine-refine
---

Governed observability and compliance rest on a lattice of stable identifiers that bind heterogeneous records into auditable wholes without collapsing distinct semantic roles. An identifier such as `XREF-0001` denotes a concrete eBPF program attachment—here, `dns_query_parser`—while parallel identifier namespaces (`OWNE-0003`, `INFO-0002`) respectively anchor ownership accountability and transformation provenance. The designative type `cco:DesignativeICE` applied to the attribute named `identifier` signals that certain keys are not merely surrogate integers but normative designations within an interchange and compliance ontology; when `ref-8842` is recorded against entity `XREF-0001`, auditors can traverse from kernel-hook instrumentation back to an externally meaningful reference without inferring identity from program name alone. Identifier discipline thus underwrites every downstream control: without it, typed attribute values, owner roll-ups, and transformation lineage cannot be joined under a single evidentiary chain.

**t_ebpfprogram_attaches_kernelhook_xref**

| id | ebpfprogram |
| --- | --- |
| XREF-0001 | dns_query_parser |
| XREF-0002 | network_latency_tracker |
| XREF-0003 | block_io_monitor |
| XREF-0004 | tcp_retrans_monitor |
| XREF-0005 | tcp_retrans_monitor |
| XREF-0006 | syscall_trace_logger |

**t_ebpfprogram_attaches_kernelhook_xref_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| XREF-0001 | checksum | xsd:string |
| XREF-0002 | created_date | xsd:date |
| XREF-0003 | identifier | cco:DesignativeICE |
| XREF-0004 | license | xsd:string |
| XREF-0005 | mime_type | xsd:string |
| XREF-0006 | size_bytes | xsd:long |
| XREF-0007 | uri | xsd:string |
| XREF-0008 | version | xsd:integer |

Attributes and attribute types constitute the typed metadata envelope through which entities disclose the properties regulators and operators must evaluate. Each attribute—`checksum`, `created_date`, `license`—is declared with an explicit type (`xsd:string`, `xsd:date`, `xsd:string`, respectively) so that validation, retention policy, and disclosure scope can be applied mechanically rather than interpretively. The separation of attribute definition from attribute value is operationally decisive: `created_date` is uniformly typed as `xsd:date` across entities, yet its instantiated values (`2025-04-17` for `XREF-0001`, `2023-07-21` for `XREF-0004`) encode materially different compliance postures, distinguishing recently attested hooks from long-deployed instrumentation whose renewal or re-certification may be overdue. String-typed license metadata (`Apache-2.0` bound to the same entity) further illustrates how a single entity aggregates orthogonal compliance dimensions—temporal, cryptographic, and legal—each governed by its own type contract.

The entity is the governed object to which attributes accrue; in practice it is the attachment record (`XREF-0001` through `XREF-0004`) linking programs (`network_latency_tracker`, `tcp_retrans_monitor`, and others) to the attribute-value planes partitioned by datatype. Integer-valued facets (`268`, `11` on `XREF-0001`; `212`, `1` on `XREF-0002`) and varchar-held miscellany (`7b14de08`, `ap-south-2`) attach to the same entity identifier yet answer different control questions—integrity evidence, regional deployment scope, checksum material—without overloading a single wide column. Misc fields, in this architecture, are not unstructured noise but deliberately heterogeneous payloads whose interpretation is delegated to the pairing of `entity` and `attr`: a date in one store is a lifecycle timestamp, while a short string in another is a region code or license token. Category complements entity-level description by supplying taxonomic grouping at the dimension layer: `Owner Category 03` and `Informed By Category 02` classify accountable parties and provenance sources (`Owner Label 03`, `Informed By Label 02`) so that policy thresholds, escalation paths, and reporting cohorts can be defined on classes rather than on individual keys.

**dim_owner**

| id | owner_label | owner_category |
| --- | --- | --- |
| OWNE-0001 | Owner Label 01 | Owner Category 01 |
| OWNE-0002 | Owner Label 02 | Owner Category 02 |
| OWNE-0003 | Owner Label 03 | Owner Category 03 |
| OWNE-0004 | Owner Label 04 | Owner Category 04 |
| OWNE-0005 | Owner Label 05 | Owner Category 05 |
| OWNE-0006 | Owner Label 06 | Owner Category 06 |

**t_ebpfprogram_attaches_kernelhook_xref_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| XREF-0001 | XREF-0001 | XREF-0002 | 2025-04-17 |
| XREF-0002 | XREF-0002 | XREF-0002 | 2025-02-23 |
| XREF-0003 | XREF-0003 | XREF-0002 | 2025-06-16 |
| XREF-0004 | XREF-0004 | XREF-0002 | 2023-07-21 |
| XREF-0005 | XREF-0005 | XREF-0002 | 2024-01-20 |
| XREF-0006 | XREF-0006 | XREF-0002 | 2025-03-02 |

**t_ebpfprogram_attaches_kernelhook_xref_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| XREF-0001 | XREF-0001 | XREF-0006 | 268 |
| XREF-0002 | XREF-0001 | XREF-0008 | 11 |
| XREF-0003 | XREF-0002 | XREF-0006 | 212 |
| XREF-0004 | XREF-0002 | XREF-0008 | 1 |
| XREF-0005 | XREF-0003 | XREF-0006 | 251 |
| XREF-0006 | XREF-0003 | XREF-0008 | 5 |
| XREF-0007 | XREF-0004 | XREF-0006 | 130 |
| XREF-0008 | XREF-0004 | XREF-0008 | 6 |

**t_ebpfprogram_attaches_kernelhook_xref_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| XREF-0001 | XREF-0001 | XREF-0001 | 7b14de08 |
| XREF-0002 | XREF-0001 | XREF-0003 | ref-8842 |
| XREF-0003 | XREF-0001 | XREF-0004 | Apache-2.0 |
| XREF-0004 | XREF-0001 | XREF-0009 | ap-south-2 |
| XREF-0005 | XREF-0001 | XREF-0005 | application/octet-stream |
| XREF-0006 | XREF-0001 | XREF-0010 | Name 06 |
| XREF-0007 | XREF-0001 | XREF-0011 | platform-team |
| XREF-0008 | XREF-0001 | XREF-0012 | Tags 08 |

**dim_informed_by**

| id | informed_by_label | informed_by_category |
| --- | --- | --- |
| INFO-0001 | Informed By Label 01 | Informed By Category 01 |
| INFO-0002 | Informed By Label 02 | Informed By Category 02 |
| INFO-0003 | Informed By Label 03 | Informed By Category 03 |
| INFO-0004 | Informed By Label 04 | Informed By Category 04 |
| INFO-0005 | Informed By Label 05 | Informed By Category 05 |
| INFO-0006 | Informed By Label 06 | Informed By Category 06 |

Ownership and artifact scale close the loop between instrumentation governance and the material artifacts those programs produce or depend upon. Owner linkage concentrates accountability: three artifacts (`OWNE-0001`, `OWNE-0002`, `OWNE-0003`) roll up to `OWNE-0003`, while a fourth (`OWNE-0004`) sits under `OWNE-0005`, making custodial boundaries explicit for access review and breach notification. Size in bytes (`123155790`, `42978804`, `996080316`, `597369362`) quantifies storage footprint and transfer risk, informing retention caps, backup prioritization, and data-sovereignty assessments when combined with deployment misc such as `ap-south-2`. Version integers (`6`, `5`, `10`) further situate each artifact within an evolution history, so that compliance attestation can be tied to a specific build rather than to a mutable label.

**fact_artifact**

| id | owner_key | size_bytes | version |
| --- | --- | --- | --- |
| OWNE-0001 | OWNE-0003 | 123155790 | 6 |
| OWNE-0002 | OWNE-0003 | 42978804 | 5 |
| OWNE-0003 | OWNE-0003 | 996080316 | 5 |
| OWNE-0004 | OWNE-0005 | 597369362 | 10 |
| OWNE-0005 | OWNE-0006 | 12061913 | 9 |
| OWNE-0006 | OWNE-0004 | 792675668 | 5 |

Transformation observability—captured through duration in seconds, exit status, retry count, and informed-by lineage—translates governance intent into operational evidence. Elapsed durations ranging from `150.01` seconds to `5474.59` seconds discriminate routine ingestion from protracted or stalled jobs, while non-zero exit codes (`354`, `220`, `471`, `302`) signal that completion semantics are not uniformly success-shaped and must be mapped to controlled failure taxonomies. Retry counts (`25`, `357`, `150`, `85`) expose resilience behavior under stress: a transformation informed by `INFO-0002` that accumulated `357` retries before reporting exit `220` presents a different risk profile than `INFO-0003`’s brief `150.01`-second run with exit `471` and `150` retries. The informed-by dimension (`INFO-0001` self-referential, `INFO-0006` external to the illustrated label set) records which scheduler, policy engine, or upstream pipeline asserted the run, enabling auditors to reconstruct causality when artifact versions, hook attributes, and transformation outcomes must be defended as a single compliance narrative. Taken together, identifier anchoring, typed attributes on entities, categorical classification, custodial ownership, byte-scale materiality, and timed exit/retry telemetry form the operational grammar through which kernel-level observability programs and their downstream artifacts remain legible to governance frameworks that demand evidence, not assertion.

**fact_transformation**

| id | informed_by_key | duration_seconds | exit_code | retry_count |
| --- | --- | --- | --- | --- |
| INFO-0001 | INFO-0001 | 2399.22 | 354 | 25 |
| INFO-0002 | INFO-0002 | 5474.59 | 220 | 357 |
| INFO-0003 | INFO-0006 | 150.01 | 471 | 150 |
| INFO-0004 | INFO-0004 | 5248.45 | 302 | 85 |
| INFO-0005 | INFO-0004 | 6668.88 | 184 | 484 |
| INFO-0006 | INFO-0001 | 777.01 | 996 | 445 |
| INFO-0007 | INFO-0005 | 6572.74 | 634 | 341 |