---
chapter_id: ch_live_ebpfprogram_subclass_e3c9b0
topic_id: 47
family: 04_ebpf_kernel
cited_terms: ['ebpfprogram_subclass', 'subclass_to_information_content_entity', 'identifier_subclass']
model: engine-refine
---

The foundational construct of any structured identification system is the entity, an abstract or concrete thing that must be distinguished from all others. An entity acquires its distinguishability through an identifier, a string or composite value that serves as its canonical reference within a given namespace. Identifiers are not merely labels; they carry semantic weight and structural conventions that signal their provenance and intended use. A handle such as `HANDLE-1234/5678` encodes both a prefix denoting its category and a slash-delimited composite that may itself carry hierarchical meaning, while `SEQ-NF2024` and `ACCN-GSM7829104` follow analogous patterns of domain-specific formatting. Each identifier points to exactly one identified thing—`telemetry-stream` in the case of the first three, `calibration-run` for the fourth—establishing a univocal mapping between the symbolic reference and the referent it stands for.

Identifiers are not monolithic; they decompose into attributes, each of which captures a distinct dimension of the identifier's specification. An attribute is defined by its name and its type, where the type constrains the kind of value the attribute may hold. The attribute `checksum_algo` is typed as `xsd:string`, as are `code` and `format`, while `issued_date` carries the type `xsd:date`, reflecting its temporal semantics. This type discipline is not decorative—it governs validation, serialization, and the interoperability of identifiers across systems. When an attribute value is materialized, it is stored in a value table keyed by both the entity (the identifier record to which it belongs) and the attribute (the definition it instantiates), with separate tables for date and string types to enforce type safety at the storage layer. The value `Checksum Algo 01` attached to entity `IDEN-0001` via attribute `IDEN-0001`, or the date `2023-11-13` bound to the same entity through attribute `IDEN-0004`, are concrete instantiations of this attribute-value pairing.

**t_identifier_subclass_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| IDEN-0001 | checksum_algo | xsd:string |
| IDEN-0002 | code | xsd:string |
| IDEN-0003 | format | xsd:string |
| IDEN-0004 | issued_date | xsd:date |
| IDEN-0005 | namespace | xsd:string |
| IDEN-0006 | encoding | xsd:string |
| IDEN-0007 | label_text | xsd:string |
| IDEN-0008 | language | xsd:string |

**t_identifier_subclass_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| IDEN-0001 | IDEN-0001 | IDEN-0004 | 2023-11-13 |
| IDEN-0002 | IDEN-0002 | IDEN-0004 | 2024-05-25 |
| IDEN-0003 | IDEN-0003 | IDEN-0004 | 2024-09-11 |
| IDEN-0004 | IDEN-0004 | IDEN-0004 | 2025-05-27 |
| IDEN-0005 | IDEN-0005 | IDEN-0004 | 2023-08-09 |
| IDEN-0006 | IDEN-0006 | IDEN-0004 | 2023-03-27 |
| IDEN-0007 | IDEN-0007 | IDEN-0004 | 2023-01-25 |

**t_identifier_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| IDEN-0001 | IDEN-0001 | IDEN-0001 | Checksum Algo 01 |
| IDEN-0002 | IDEN-0001 | IDEN-0002 | B-12 |
| IDEN-0003 | IDEN-0001 | IDEN-0006 | Encoding 03 |
| IDEN-0004 | IDEN-0001 | IDEN-0003 | JSON |
| IDEN-0005 | IDEN-0001 | IDEN-0007 | pre-release note |
| IDEN-0006 | IDEN-0001 | IDEN-0008 | es |
| IDEN-0007 | IDEN-0001 | IDEN-0005 | Namespace 07 |
| IDEN-0008 | IDEN-0002 | IDEN-0001 | Checksum Algo 08 |

The relationship between an identifier and what it identifies is itself a first-class construct, captured in a dedicated column that records the identified thing. This column—`identifies` in the identifier subclass table—holds values such as `telemetry-stream` and `calibration-run`, making explicit the referential intent of each identifier. In more complex domains, the same pattern extends to relationships between operational entities: an eBPF program subclass such as `kprobe_tcp_connect` (identified by `EBPF-0001`) attaches to a hook point like `cgroup/sock_create` (identified by `EBPF-0003`), and the join table that records this attachment carries both a subject column, pointing to the program, and a target column, pointing to the hook. These directional labels—subject and target—encode the asymmetry of the relationship, distinguishing the agent from the recipient in a way that is essential for traversal, auditing, and policy enforcement.

**t_ebpfprogram_subclass**

| id | ebpfprogram |
| --- | --- |
| EBPF-0001 | kprobe_tcp_connect |
| EBPF-0002 | kprobe_tcp_connect |
| EBPF-0003 | kprobe_tcp_connect |
| EBPF-0004 | tracepoint_sched_switch |
| EBPF-0005 | sockops_monitor |
| EBPF-0006 | cgroup_sock_bind |

**t_ebpfprogram_subclass_attaches_to_hook**

| id | attaches_to_hook |
| --- | --- |
| EBPF-0001 | cgroup/sock_create |
| EBPF-0002 | xdp/eth0 |
| EBPF-0003 | netfilter/ingress |
| EBPF-0004 | sk_skb/stream_parser |
| EBPF-0005 | tracepoint/sched/sched_switch |
| EBPF-0006 | cgroup/sock_create |

**t_ebpfprogram_subclass__attaches_to_hook**

| id | ebpfprogram_id | attaches_to_hook_id | role |
| --- | --- | --- | --- |
| EBPF-0001 | EBPF-0005 | EBPF-0003 | reviewer |
| EBPF-0002 | EBPF-0006 | EBPF-0006 | reviewer |
| EBPF-0003 | EBPF-0001 | EBPF-0001 | reviewer |
| EBPF-0004 | EBPF-0003 | EBPF-0002 | observer |
| EBPF-0005 | EBPF-0005 | EBPF-0004 | contributor |
| EBPF-0006 | EBPF-0002 | EBPF-0005 | observer |
| EBPF-0007 | EBPF-0005 | EBPF-0003 | owner |
| EBPF-0008 | EBPF-0001 | EBPF-0005 | contributor |

**t_identifier_subclass**

| id | identifier | identifies |
| --- | --- | --- |
| IDEN-0001 | HANDLE-1234/5678 | telemetry-stream |
| IDEN-0002 | SEQ-NF2024 | telemetry-stream |
| IDEN-0003 | SN-8842XJ | telemetry-stream |
| IDEN-0004 | ACCN-GSM7829104 | calibration-run |
| IDEN-0005 | RUN-20231105 | wet-lab-sample |
| IDEN-0006 | GUID-f47ac10b | quality-control-report |
| IDEN-0007 | DOI-10.1234/abc | clinical-trial-arm |

The role column further qualifies the relationship between subject and target, assigning a functional characterization to each link. In the eBPF attachment model, the role takes values such as `reviewer` and `observer`, indicating the capacity in which the subject participates in the relationship with the target. This is not metadata appended after the fact; it is an integral part of the relationship's definition, affecting how the system interprets, enforces, and reports on the connection. A program that attaches as a `reviewer` may have different permissions or behavioral expectations than one attaching as an `observer`, and this distinction is queryable at the relational level without requiring application-layer inference.

Information content entities introduce a parallel layer of classification, where the thing being identified is not an operational resource but a piece of documented knowledge. An information content entity carries an `information` value—`schema_registry`, `telemetry_stream`, `compliance_audit`, `data_catalog_entry`—that categorizes the nature of the content, alongside a `label_text` such as `nightly summary`, `pre-release note`, `intake form`, or `change rationale` that provides a human-readable title. The `language` column, holding values like `en`, `ja`, and `es`, anchors the label to a specific linguistic context, enabling multilingual systems to resolve the correct label for a given audience. This triad of information, label text, and language forms a self-contained descriptor that can be referenced independently of the underlying data it describes, supporting localization, versioning, and cross-referencing in governance and compliance workflows.

**t_subclass_to_information_content_entity**

| id | information | label_text | language |
| --- | --- | --- | --- |
| ENTI-0001 | schema_registry | nightly summary | en |
| ENTI-0002 | telemetry_stream | pre-release note | ja |
| ENTI-0003 | compliance_audit | intake form | ja |
| ENTI-0004 | data_catalog_entry | change rationale | es |
| ENTI-0005 | model_weights | nightly summary | en |
| ENTI-0006 | deployment_manifest | pre-release note | en |