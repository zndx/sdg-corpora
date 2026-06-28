---
chapter_id: ch_live_requirement_applies_to_system_36ffe8
topic_id: 185
family: 03_directive_governance
cited_terms: ['requirement_applies_to_system', 'ebpfmap_with_key_type', 'attrkey_with_value_type']
model: engine-refine
---

Governed systems in enterprise compliance frameworks are not monolithic records but decomposable objects whose obligations, metadata, and runtime artifacts must remain addressable across schema evolution, audit replay, and cross-domain reconciliation. The **identifier** serves as the primary stability anchor: a durable surrogate key that survives renaming, reclassification, and storage migration without breaking referential integrity. In operational practice, identifiers such as SYST-0001 through SYST-0004 denote distinct governed systems—each bound to a concrete obligation (latency under 50ms, audit logging enabled, encryption at rest, backup frequency daily)—while parallel identifier namespaces (TYPE-0001 through TYPE-0004) partition runtime instrumentation from policy metadata. Because identifiers are typed by convention and enforced by key constraints, they function as the lingua franca linking requirement definitions, attribute declarations, typed value stores, and observability facts; a control assessor tracing mandatory=false on SYST-0004 can follow attr_id SYST-0003 through the boolean value plane without ambiguity about which semantic slot is under review.

**t_requirement_applies_to_system**

| id | requirement |
| --- | --- |
| SYST-0001 | latency under 50ms |
| SYST-0002 | audit logging enabled |
| SYST-0003 | encryption at rest |
| SYST-0004 | backup frequency daily |
| SYST-0005 | network segmentation mandatory |
| SYST-0006 | network segmentation mandatory |

**t_requirement_applies_to_system_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| SYST-0001 | effective_date | xsd:date |
| SYST-0002 | enforcement | xsd:string |
| SYST-0003 | mandatory | xsd:boolean |
| SYST-0004 | priority | xsd:integer |
| SYST-0005 | review_cycle_days | xsd:integer |
| SYST-0006 | scope | xsd:string |
| SYST-0007 | encoding | xsd:string |
| SYST-0008 | label_text | xsd:string |

An **entity** is the governed object to which attributes attach; in requirement governance, entity_id binds a value occurrence to the system instance that must satisfy or evidence a control. The separation of entity from identifier at the value layer is deliberate: the entity answers “which system bears this fact,” while attr_id answers “which declared slot receives it.” Thus SYST-0001 may simultaneously carry effective_date=2025-05-21 (attr_id SYST-0001), priority values 1 and 391 (attr_id SYST-0004 and SYST-0005), and varchar miscellany including Encoding 01 and audit excerpt (attr_id SYST-0007, SYST-0002, SYST-0008)—all without collapsing heterogeneous semantics into a single untyped bag. Entity-centric modeling matters because enforcement workflows, exception grants, and remediation tickets are filed against systems, not against abstract attribute rows; misc, as the value carrier column within each typed store, holds the payload whose interpretation is entirely determined by the paired attr and attr_type metadata rather than by the column name alone.

**t_requirement_applies_to_system_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SYST-0001 | SYST-0001 | SYST-0003 | false |
| SYST-0002 | SYST-0002 | SYST-0003 | true |
| SYST-0003 | SYST-0003 | SYST-0003 | true |
| SYST-0004 | SYST-0004 | SYST-0003 | false |
| SYST-0005 | SYST-0005 | SYST-0003 | true |
| SYST-0006 | SYST-0006 | SYST-0003 | false |

**t_requirement_applies_to_system_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SYST-0001 | SYST-0001 | SYST-0001 | 2025-05-21 |
| SYST-0002 | SYST-0002 | SYST-0001 | 2024-02-21 |
| SYST-0003 | SYST-0003 | SYST-0001 | 2023-05-13 |
| SYST-0004 | SYST-0004 | SYST-0001 | 2023-08-26 |
| SYST-0005 | SYST-0005 | SYST-0001 | 2025-01-01 |
| SYST-0006 | SYST-0006 | SYST-0001 | 2023-04-22 |

**t_requirement_applies_to_system_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SYST-0001 | SYST-0001 | SYST-0004 | 1 |
| SYST-0002 | SYST-0001 | SYST-0005 | 391 |
| SYST-0003 | SYST-0002 | SYST-0004 | 5 |
| SYST-0004 | SYST-0002 | SYST-0005 | 295 |
| SYST-0005 | SYST-0003 | SYST-0004 | 2 |
| SYST-0006 | SYST-0003 | SYST-0005 | 418 |
| SYST-0007 | SYST-0004 | SYST-0004 | 4 |
| SYST-0008 | SYST-0004 | SYST-0005 | 590 |

**t_requirement_applies_to_system_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SYST-0001 | SYST-0001 | SYST-0007 | Encoding 01 |
| SYST-0002 | SYST-0001 | SYST-0002 | Enforcement 02 |
| SYST-0003 | SYST-0001 | SYST-0008 | audit excerpt |
| SYST-0004 | SYST-0001 | SYST-0009 | fr |
| SYST-0005 | SYST-0001 | SYST-0006 | Scope 05 |
| SYST-0006 | SYST-0002 | SYST-0007 | Encoding 06 |
| SYST-0007 | SYST-0002 | SYST-0002 | Enforcement 07 |
| SYST-0008 | SYST-0002 | SYST-0008 | intake form |

**Attr** and **attr_type** constitute the schema contract: attr_name declares the governance meaning (effective_date, enforcement, mandatory, priority), while attr_type declares the validation and persistence plane (xsd:date, xsd:string, xsd:boolean, xsd:integer). This bifurcation is why boolean mandatory values materialize separately from date effective_date values and integer priority values—the type system prevents silent coercion that would corrupt audit evidence. attr_type alignment with XSD families signals interchange readiness for regulatory submissions and cross-organizational attestations; a date stored as 2024-02-21 for SYST-0002 is comparable epoch-to-epoch with 2023-05-13 on SYST-0003 because both resolve through the same date value relation. Where attr_type is varchar-backed, misc accommodates lexical tokens (Enforcement 02, fr) whose business semantics may be opaque at storage time but become legible when joined to code tables or locale registries; the attr layer therefore governs discoverability and constraint, not merely labeling.

Runtime observability and policy metadata converge on **type**, **category**, **size_bytes**, and **version** when instrumentation artifacts—here, eBPF map facts—must be reconciled against declared key-type dimensions. In fact_ebpfmap, each row’s key_type_key (TYPE-0005, TYPE-0006, TYPE-0002) classifies the map’s logical keying strategy, while size_bytes quantifies material footprint (208979093, 156714508, 31105012, 354373995 bytes) for capacity planning, retention budgeting, and anomaly detection; version (3, 6, 12, 5) records generational state so that breaking layout changes do not masquerade as data drift. The dimension table supplies human-legible **category** groupings (Key Type Category 01 through 04) atop machine **type** identifiers, enabling rollup reporting without sacrificing join precision. Together, type and category establish a taxonomy bridge: operators reason in categories during incident triage, while automated validators reason in type identifiers during schema checks.

**fact_ebpfmap**

| id | key_type_key | size_bytes | version |
| --- | --- | --- | --- |
| TYPE-0001 | TYPE-0005 | 208979093 | 3 |
| TYPE-0002 | TYPE-0006 | 156714508 | 6 |
| TYPE-0003 | TYPE-0006 | 31105012 | 12 |
| TYPE-0004 | TYPE-0002 | 354373995 | 5 |
| TYPE-0005 | TYPE-0004 | 866267293 | 2 |

Integrity and provenance for attribute keys depend on **checksumalgo**, which specifies the digest function applied when attrkey values (config_hash, data_quality_flag, event_type, timestamp_utc) are materialized or transmitted. Pairing sha256 with data_quality_flag and event_type versus md5 with config_hash and timestamp_utc reflects a risk-weighted policy—stronger algorithms where misc codes (A-01, E-21, C-07) denote control-critical lineage, lighter algorithms where historical compatibility or volume dominates. The value_type foreign key (SYST-0002, SYST-0005, SYST-0004) ties each attrkey to its permitted value plane, so checksum validation and type validation compose: a mismatch in either dimension fails closed before polluted hashes enter downstream analytics. In practice, checksumalgo is not decorative cryptography; it is the reproducibility hook that lets two independently built compliance pipelines agree that the same governed configuration produced the same attestation artifact.

**t_attrkey_with_value_type**

| id | attrkey | value_type | checksum_algo | code |
| --- | --- | --- | --- | --- |
| TYPE-0001 | config_hash | SYST-0002 | md5 | C-07 |
| TYPE-0002 | data_quality_flag | SYST-0005 | sha256 | A-01 |
| TYPE-0003 | event_type | SYST-0005 | sha256 | A-01 |
| TYPE-0004 | timestamp_utc | SYST-0004 | md5 | E-21 |
| TYPE-0005 | batch_number | SYST-0006 | md5 | E-21 |
| TYPE-0006 | timestamp_utc | SYST-0006 | sha1 | E-21 |
| TYPE-0007 | device_mac | SYST-0002 | md5 | C-07 |
| TYPE-0008 | firmware_version | SYST-0003 | blake2b | B-12 |

Across these constructs, the operational invariant is referential closure: identifier namespaces partition concerns, entity anchors ground facts in accountable systems, attr and attr_type prescribe meaning and storage discipline, type and category organize runtime and dimensional knowledge, size_bytes and version quantify and generation-lock physical artifacts, and checksumalgo seals semantic keys against silent mutation. A reviewer examining why SYST-0002 shows mandatory=true while SYST-0001 shows mandatory=false does not interrogate isolated booleans but traverses the full lattice—entity to attr to attr_type to misc—possibly extending into ebpf map versions and attrkey digests when the control’s evidence chain spans configuration stores and kernel-side telemetry. That traversal model is precisely why these fields matter: they convert compliance from narrative assertion into an evidence graph whose edges are typed, keyed, versioned, and checksum-verifiable.

**dim_key_type**

| id | key_type_label | key_type_category |
| --- | --- | --- |
| TYPE-0001 | Key Type Label 01 | Key Type Category 01 |
| TYPE-0002 | Key Type Label 02 | Key Type Category 02 |
| TYPE-0003 | Key Type Label 03 | Key Type Category 03 |
| TYPE-0004 | Key Type Label 04 | Key Type Category 04 |
| TYPE-0005 | Key Type Label 05 | Key Type Category 05 |
| TYPE-0006 | Key Type Label 06 | Key Type Category 06 |