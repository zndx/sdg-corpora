---
chapter_id: ch_live_kernelhook_with_attached_program_c5f579
topic_id: 46
family: 04_ebpf_kernel
cited_terms: ['kernelhook_with_attached_program', 'verification_basic', 'schemaorg_person_named']
model: engine-refine
---

Attached programs constitute the deployable software units that governance frameworks must inventory, classify, and bind to runtime enforcement points before any compliance assertion can be considered authoritative. Each program carries a stable identifier—PROG-0001 through PROG-0004 in the reference corpus—and a human-readable label together with a categorical assignment that partitions the population into operational families such as Attached Program Category 01 and Attached Program Category 04. Category is not decorative metadata; it determines which verification procedures apply, which retention policies govern associated evidence, and which escalation paths activate when a hook reports anomalous behavior. The identifier anchors every downstream reference: kernel hooks, verification runs, and cross-entity associations all resolve through these keys, ensuring that a program referenced as PROG-0006 in one fact row and PROG-0001 in another can be traced unambiguously even when labels or versions change.

**dim_attached_program**

| id | attached_program_label | attached_program_category |
| --- | --- | --- |
| PROG-0001 | Attached Program Label 01 | Attached Program Category 01 |
| PROG-0002 | Attached Program Label 02 | Attached Program Category 02 |
| PROG-0003 | Attached Program Label 03 | Attached Program Category 03 |
| PROG-0004 | Attached Program Label 04 | Attached Program Category 04 |
| PROG-0005 | Attached Program Label 05 | Attached Program Category 05 |
| PROG-0006 | Attached Program Label 06 | Attached Program Category 06 |

**t_verification_basic**

| id | verification |
| --- | --- |
| VERI-0001 | Compliance snapshot test |
| VERI-0002 | Calibration certificate review |
| VERI-0003 | Pipeline integrity check |
| VERI-0004 | Sensor drift assessment |
| VERI-0005 | Access control audit |
| VERI-0006 | Metadata reconciliation |

Kernel hooks materialize the attachment relationship between a host enforcement mechanism and the program under supervision. The fact_kernelhook records pair each hook instance—PROG-0001, PROG-0002, PROG-0003, PROG-0004—with an attached_program_key that names the governed artifact, while size_bytes and version capture the physical and revisionary state at the moment of binding. Footprints range from roughly thirty-six megabytes to over five hundred sixty megabytes, and version numbers diverge sharply—version 10 on one hook against version 1 on another—signaling that compliance posture depends not merely on program identity but on which build generation is actually resident in the execution environment. Auditors treat version and size_bytes as corroborating evidence: a mismatch between declared artifact dimensions and observed hook metadata often indicates an undeclared upgrade or a partial deployment that invalidates prior certification.

**fact_kernelhook**

| id | attached_program_key | size_bytes | version |
| --- | --- | --- | --- |
| PROG-0001 | PROG-0006 | 36342735 | 3 |
| PROG-0002 | PROG-0004 | 560962979 | 1 |
| PROG-0003 | PROG-0001 | 456299832 | 10 |
| PROG-0004 | PROG-0001 | 272822846 | 1 |

Verification entities extend the governance model from static inventory into executed assurance events. Each entity—VERI-0001 through VERI-0004—represents a discrete verification act such as a compliance snapshot test, a calibration certificate review, a pipeline integrity check, or a sensor drift assessment. The entity identifier is the grain at which evidentiary facts accumulate; every measured outcome, timestamp, and textual annotation hangs off that key. This separation matters in practice because a single verification run may produce dozens of typed observations, yet auditors reason about pass-fail and evidentiary sufficiency at the entity level first, then drill into constituent attributes only when dispute or recurrence demands finer resolution.

**t_verification_basic_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| VERI-0001 | duration_seconds | xsd:decimal |
| VERI-0002 | end_time | xsd:dateTime |
| VERI-0003 | exit_code | xsd:integer |
| VERI-0004 | host_name | xsd:string |
| VERI-0005 | log_level | xsd:string |
| VERI-0006 | phase | xsd:string |
| VERI-0007 | retry_count | xsd:integer |
| VERI-0008 | scheduled_at | xsd:dateTime |

Attributes and attribute types supply the typed vocabulary through which verification outcomes are expressed without collapsing heterogeneous measurements into a single undifferentiated store. An attribute such as duration_seconds is declared with attr_type xsd:decimal, end_time with xsd:dateTime, exit_code with xsd:integer, and host_name with xsd:string—each binding a semantic name to a schema-constrained representation that governs validation, comparison, and aggregation. In operation, attr definitions function as a contract: downstream consumers know that decimal-valued duration_seconds observations like 500.97 or 4833.98 are commensurable, while datetime-valued end_time records such as 2023-02-01T08:41:13 and 2025-05-09T15:15:58 support temporal sequencing across multi-year audit windows. Integer exit codes—182, 65, 828, 38—and varchar miscellany including ingest-21, execution, and complete populate the misc dimension: values that resist rigid typing yet remain indispensable for operational narration, log correlation, and human-readable status reporting.

The entity–attribute–value pattern operationalizes this vocabulary by partitioning observations across type-specialized value stores while preserving a uniform join semantics through entity_id and attr_id foreign keys. A single entity such as VERI-0001 may simultaneously own a decimal duration, multiple datetime boundaries, integer exit codes, and varchar host identifiers, each stored in the table whose physical type matches the declared attr_type. This design trades storage normalization for audit clarity: reviewers can query all datetime facts for a given verification without coercing strings, and integrity checks can reject a decimal placed in a varchar column before it corrupts aggregate statistics. Misc values in this layer are not second-class; they frequently carry the evidentiary phrases—Log Level 02, complete—that examiners quote when reconstructing decision rationale.

**t_verification_basic_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERI-0001 | VERI-0001 | VERI-0002 | 2023-02-01T08:41:13 |
| VERI-0002 | VERI-0001 | VERI-0008 | 2023-06-06T17:03:25 |
| VERI-0003 | VERI-0001 | VERI-0009 | 2025-05-09T15:15:58 |
| VERI-0004 | VERI-0002 | VERI-0002 | 2023-06-08T16:52:03 |
| VERI-0005 | VERI-0002 | VERI-0008 | 2025-05-17T22:11:58 |
| VERI-0006 | VERI-0002 | VERI-0009 | 2024-06-13T13:20:10 |
| VERI-0007 | VERI-0003 | VERI-0002 | 2023-04-20T09:43:00 |
| VERI-0008 | VERI-0003 | VERI-0008 | 2023-10-14T11:07:55 |

**t_verification_basic_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERI-0001 | VERI-0001 | VERI-0001 | 500.97 |
| VERI-0002 | VERI-0002 | VERI-0001 | 4488.38 |
| VERI-0003 | VERI-0003 | VERI-0001 | 4833.98 |
| VERI-0004 | VERI-0004 | VERI-0001 | 3565.06 |
| VERI-0005 | VERI-0005 | VERI-0001 | 2509.98 |
| VERI-0006 | VERI-0006 | VERI-0001 | 2611.50 |

**t_verification_basic_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERI-0001 | VERI-0001 | VERI-0003 | 182 |
| VERI-0002 | VERI-0001 | VERI-0007 | 65 |
| VERI-0003 | VERI-0002 | VERI-0003 | 828 |
| VERI-0004 | VERI-0002 | VERI-0007 | 38 |
| VERI-0005 | VERI-0003 | VERI-0003 | 137 |
| VERI-0006 | VERI-0003 | VERI-0007 | 337 |
| VERI-0007 | VERI-0004 | VERI-0003 | 858 |
| VERI-0008 | VERI-0004 | VERI-0007 | 112 |

**t_verification_basic_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERI-0001 | VERI-0001 | VERI-0004 | ingest-21 |
| VERI-0002 | VERI-0001 | VERI-0005 | Log Level 02 |
| VERI-0003 | VERI-0001 | VERI-0006 | execution |
| VERI-0004 | VERI-0001 | VERI-0010 | complete |
| VERI-0005 | VERI-0001 | VERI-0011 | Triggered By 05 |
| VERI-0006 | VERI-0002 | VERI-0004 | edge-03 |
| VERI-0007 | VERI-0002 | VERI-0005 | Log Level 07 |
| VERI-0008 | VERI-0002 | VERI-0006 | initiation |

Subject–target–role triples govern relational assertions among named entities when simple attribute attachment is insufficient to express directed responsibility or observational standing. In the schema.org person naming subgraph, a subject identifier such as NAME-0003 or NAME-0004 links to a target full-name record—NAME-0002 or NAME-0003—under an explicit role of owner, observer, or reviewer. Role is doing contractual work here: owner implies accountability for assertion accuracy, observer permits read-only attestation, and reviewer confers evaluative authority without ownership transfer. When the same subject maps to multiple targets or duplicate full-name strings appear under distinct identifiers, role disambiguates which linkage is authoritative for a given governance action. Together, identifier stability, categorical classification, versioned attachment, typed attributes, partitioned values, and directed role assignments form the composable machinery through which compliance handbooks translate abstract policy requirements into queryable, evidence-anchored operational fact.

**t_schemaorg_person_named**

| id | schemaorg |
| --- | --- |
| NAME-0001 | person/tim_berners_lee |
| NAME-0002 | person/alan_kay |
| NAME-0003 | person/alan_turing |
| NAME-0004 | person/john_von_neumann |
| NAME-0005 | person/donald_knuth |
| NAME-0006 | person/grace_hopper |
| NAME-0007 | person/john_von_neumann |

**t_schemaorg_person_named_full_name**

| id | full_name |
| --- | --- |
| NAME-0001 | Grace Hopper |
| NAME-0002 | Donald Knuth |
| NAME-0003 | John von Neumann |
| NAME-0004 | Grace Hopper |
| NAME-0005 | Ada Lovelace |
| NAME-0006 | Alan Kay |

**t_schemaorg_person_named__full_name**

| id | schemaorg_id | full_name_id | role |
| --- | --- | --- | --- |
| NAME-0001 | NAME-0003 | NAME-0002 | owner |
| NAME-0002 | NAME-0004 | NAME-0003 | observer |
| NAME-0003 | NAME-0003 | NAME-0002 | reviewer |
| NAME-0004 | NAME-0005 | NAME-0002 | owner |
| NAME-0005 | NAME-0003 | NAME-0001 | contributor |
| NAME-0006 | NAME-0007 | NAME-0005 | observer |
| NAME-0007 | NAME-0006 | NAME-0002 | observer |
| NAME-0008 | NAME-0006 | NAME-0005 | owner |