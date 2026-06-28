---
chapter_id: ch_live_labrun_basic_023e74
topic_id: 47
family: 02_observation_measurement
cited_terms: ['labrun_basic', 'subclass_to_directive_ice', 'schemaorg_person_roleat']
model: engine-refine
---

The architecture of modern data governance relies on the strict decoupling of attribute definitions from their runtime values, a design that enforces schema integrity while permitting dynamic extension. At the foundation of this model, the `attr` column establishes the semantic namespace for each measurable or descriptive property, while `attr type` binds that property to a canonical data standard. For instance, operational metrics such as `duration_seconds` are formally declared as `xsd:decimal`, ensuring arithmetic precision across distributed pipelines, whereas temporal markers like `end_time` are constrained to `xsd:dateTime`, guaranteeing unambiguous chronological ordering. This type-level discipline prevents silent coercion errors and provides a machine-readable contract that downstream validators can enforce without inspecting raw payloads.

Within this normalized structure, the `identifier` serves as the immutable anchor for every record, while the `entity` column maps each attribute-value pair to its originating instance. Identifiers such as `LABR-0001`, `ICE-0001`, and `ROLE-0001` function as cross-referential keys that traverse multiple attribute stores, allowing a single laboratory run or policy directive to accumulate heterogeneous metadata without denormalization. The `entity` field explicitly ties each measurement back to its source context, ensuring that a value like `1438.98` or `918` is never interpreted in isolation but is instead resolved against a known operational record. This relational binding is essential for auditability, as it preserves the provenance chain required for compliance frameworks and reproducible research workflows.

**t_labrun_basic**

| id | labrun |
| --- | --- |
| LABR-0001 | Microplate_Scan_9A |
| LABR-0002 | MassSpec_Triplicate |
| LABR-0003 | ELISA_Screen_4B |
| LABR-0004 | PCR_Amplification |
| LABR-0005 | FlowCytometry_Sweep |
| LABR-0006 | WesternBlot_22 |
| LABR-0007 | WesternBlot_22 |
| LABR-0008 | FlowCytometry_Sweep |

**t_labrun_basic_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LABR-0001 | LABR-0001 | LABR-0002 | 2025-01-01T00:58:28 |
| LABR-0002 | LABR-0001 | LABR-0008 | 2023-02-28T02:17:46 |
| LABR-0003 | LABR-0001 | LABR-0009 | 2024-11-14T14:13:50 |
| LABR-0004 | LABR-0002 | LABR-0002 | 2025-05-09T16:03:58 |
| LABR-0005 | LABR-0002 | LABR-0008 | 2023-08-07T03:38:58 |
| LABR-0006 | LABR-0002 | LABR-0009 | 2023-11-05T10:47:29 |
| LABR-0007 | LABR-0003 | LABR-0002 | 2024-07-22T03:34:20 |
| LABR-0008 | LABR-0003 | LABR-0008 | 2023-11-18T18:40:00 |

**t_labrun_basic_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LABR-0001 | LABR-0001 | LABR-0001 | 1438.98 |
| LABR-0002 | LABR-0002 | LABR-0001 | 6523.97 |
| LABR-0003 | LABR-0003 | LABR-0001 | 7176.32 |
| LABR-0004 | LABR-0004 | LABR-0001 | 6375.34 |
| LABR-0005 | LABR-0005 | LABR-0001 | 876.07 |
| LABR-0006 | LABR-0006 | LABR-0001 | 5075.37 |
| LABR-0007 | LABR-0007 | LABR-0001 | 485.96 |
| LABR-0008 | LABR-0008 | LABR-0001 | 1443.01 |

**t_labrun_basic_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LABR-0001 | LABR-0001 | LABR-0003 | 918 |
| LABR-0002 | LABR-0001 | LABR-0007 | 57 |
| LABR-0003 | LABR-0002 | LABR-0003 | 674 |
| LABR-0004 | LABR-0002 | LABR-0007 | 220 |
| LABR-0005 | LABR-0003 | LABR-0003 | 637 |
| LABR-0006 | LABR-0003 | LABR-0007 | 406 |
| LABR-0007 | LABR-0004 | LABR-0003 | 597 |
| LABR-0008 | LABR-0004 | LABR-0007 | 367 |

**t_labrun_basic_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LABR-0001 | LABR-0001 | LABR-0004 | edge-03 |
| LABR-0002 | LABR-0001 | LABR-0005 | Log Level 02 |
| LABR-0003 | LABR-0001 | LABR-0006 | execution |
| LABR-0004 | LABR-0001 | LABR-0010 | complete |
| LABR-0005 | LABR-0001 | LABR-0011 | Triggered By 05 |
| LABR-0006 | LABR-0002 | LABR-0004 | ingest-21 |
| LABR-0007 | LABR-0002 | LABR-0005 | Log Level 07 |
| LABR-0008 | LABR-0002 | LABR-0006 | initiation |

**t_schemaorg_person_roleat**

| id | schemaorg | role_at |
| --- | --- | --- |
| ROLE-0001 | SANS Institute | LABR-0004 |
| ROLE-0002 | WHO Cyber Health | LABR-0008 |
| ROLE-0003 | NASA Ames Research | LABR-0007 |
| ROLE-0004 | DARPA InfoTech | LABR-0006 |
| ROLE-0005 | Red Hat OpenShift | LABR-0008 |
| ROLE-0006 | IEEE Standards | LABR-0005 |
| ROLE-0007 | DARPA InfoTech | LABR-0003 |

**t_schemaorg_person_roleat_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ROLE-0001 | ROLE-0001 | ROLE-0006 | 325 |
| ROLE-0002 | ROLE-0001 | ROLE-0008 | 7 |
| ROLE-0003 | ROLE-0002 | ROLE-0006 | 319 |
| ROLE-0004 | ROLE-0002 | ROLE-0008 | 10 |
| ROLE-0005 | ROLE-0003 | ROLE-0006 | 407 |
| ROLE-0006 | ROLE-0003 | ROLE-0008 | 6 |
| ROLE-0007 | ROLE-0004 | ROLE-0006 | 258 |
| ROLE-0008 | ROLE-0004 | ROLE-0008 | 6 |

**t_schemaorg_person_roleat_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ROLE-0001 | ROLE-0001 | ROLE-0001 | c0ffee42 |
| ROLE-0002 | ROLE-0001 | ROLE-0003 | urn:uuid:9f2a |
| ROLE-0003 | ROLE-0001 | ROLE-0004 | CC-BY-4.0 |
| ROLE-0004 | ROLE-0001 | ROLE-0009 | zone-b |
| ROLE-0005 | ROLE-0001 | ROLE-0005 | text/plain |
| ROLE-0006 | ROLE-0001 | ROLE-0010 | Name 06 |
| ROLE-0007 | ROLE-0001 | ROLE-0011 | platform-team |
| ROLE-0008 | ROLE-0001 | ROLE-0012 | Tags 08 |

The actual data payloads are segregated into type-specific value stores, collectively referenced as `misc`, which eliminates storage bloat and optimizes query performance for heterogeneous workloads. Numerical outputs such as `6523.97` and `7176.32` reside in decimal partitions, while integer counters like `674` and `220` are routed to integer stores, preserving exact precision without floating-point rounding artifacts. Textual descriptors, including host identifiers like `edge-03` and status markers such as `execution`, occupy variable-character fields, and timestamped events like `2025-01-01T00:58:28` are isolated in datetime repositories. This partitioning strategy ensures that type coercion occurs only at ingestion, leaving the query layer free to operate on homogenous, index-optimized columns.

Beyond structural typing, interoperability and human interpretability are governed by the `encoding` and `labeltext` dimensions, which bridge machine parsing with operational semantics. Policy directives such as `ProvenanceTraceRequirement` and `EncryptionStandard` are explicitly tagged with `ascii` or `unicode` encodings, guaranteeing byte-level consistency across heterogeneous infrastructure and legacy systems. Each directive is paired with a `labeltext` descriptor—`intake form`, `calibration record`, or `nightly summary`—that provides immediate contextual grounding for analysts and automated governance engines alike. These human-readable anchors do not merely decorate the data; they enforce semantic alignment across distributed teams, ensuring that a cryptographic standard or a calibration instruction is recognized identically regardless of the originating subsystem.

**t_subclass_to_directive_ice**

| id | directive | encoding | label_text |
| --- | --- | --- | --- |
| ICE-0001 | ProvenanceTraceRequirement | ascii | intake form |
| ICE-0002 | EncryptionStandard | ascii | calibration record |
| ICE-0003 | CalibrationInstruction | unicode | nightly summary |
| ICE-0004 | CalibrationInstruction | unicode | intake form |
| ICE-0005 | BatchIngestionRule | ascii | nightly summary |

Collectively, these components form a cohesive metadata fabric that supports rigorous compliance, traceability, and operational transparency. By separating attribute definitions, type constraints, entity bindings, and value storage from encoding standards and human-readable labels, the framework achieves both machine efficiency and regulatory clarity. Every measurement, from a spectral scan duration to a cryptographic license identifier, is anchored to a unique key, validated against a canonical type, and contextualized through explicit encoding and labeling conventions. This disciplined separation of concerns ensures that data remains auditable, extensible, and interoperable across the full lifecycle of laboratory operations, policy enforcement, and cross-institutional reporting.

**t_labrun_basic_attr**

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

**t_schemaorg_person_roleat_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ROLE-0001 | checksum | xsd:string |
| ROLE-0002 | created_date | xsd:date |
| ROLE-0003 | identifier | cco:DesignativeICE |
| ROLE-0004 | license | xsd:string |
| ROLE-0005 | mime_type | xsd:string |
| ROLE-0006 | size_bytes | xsd:long |
| ROLE-0007 | uri | xsd:string |
| ROLE-0008 | version | xsd:integer |

**t_schemaorg_person_roleat_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ROLE-0001 | ROLE-0001 | ROLE-0002 | 2025-01-23 |
| ROLE-0002 | ROLE-0002 | ROLE-0002 | 2024-08-11 |
| ROLE-0003 | ROLE-0003 | ROLE-0002 | 2023-01-21 |
| ROLE-0004 | ROLE-0004 | ROLE-0002 | 2023-10-22 |
| ROLE-0005 | ROLE-0005 | ROLE-0002 | 2023-09-13 |
| ROLE-0006 | ROLE-0006 | ROLE-0002 | 2023-05-29 |
| ROLE-0007 | ROLE-0007 | ROLE-0002 | 2024-03-07 |