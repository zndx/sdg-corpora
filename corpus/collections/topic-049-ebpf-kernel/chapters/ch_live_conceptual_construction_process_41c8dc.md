---
chapter_id: ch_live_conceptual_construction_process_41c8dc
topic_id: 49
family: 08_derived
cited_terms: ['conceptual_construction_process', 'ebpfprogram_with_license', 'annotation_assigned_by']
model: engine-refine
---

An attribute-value architecture organises knowledge by decoupling the definition of properties from their concrete instantiations, thereby supporting heterogeneous data types within a single modelling framework. Attribute definitions reside in a schema table that records each attribute's name and its corresponding XML Schema type—`confidence` as `xsd:decimal`, `dimension_kind` as `xsd:string`, `method` as `xsd:string`, and `recorded_at` as `xsd:dateTime`—while value storage is partitioned into type-specific tables that hold the actual data. A decimal attribute such as `confidence` stores values like `0.167` and `103.53` in a dedicated decimal table, a string attribute such as `dimension_kind` stores values like `Dimension Kind 01` and `calibration record` in a varchar table, and a datetime attribute such as `recorded_at` stores timestamps like `2025-05-21T21:38:03` and `2024-06-17T00:22:41` in a datetime table. Each value row carries an `entity_id` that anchors it to a parent annotation record and an `attr_id` that resolves to the attribute definition, forming a normalised entity-attribute-value structure that avoids null proliferation and enforces type discipline at the storage layer.

The entity-attribute-value model is instantiated through annotation records that capture operational metadata about data lineage and governance actions. Annotations such as `compliance_audit`, `telemetry_ingestion`, and `provenance_trace` are assigned to responsible entities via an `assigned_by` relationship that references an external identifier—`LICE-0005` and `LICE-0006` appear as assignors across these annotations—while the annotation's own identifier (e.g., `ASSI-0001` through `ASSI-0004`) serves as the primary key for all downstream attribute-value associations. This separation between the annotation entity and its typed attributes allows a single annotation to carry multiple heterogeneous properties without schema modification, and the type-specific value tables ensure that queries on numeric, textual, and temporal attributes can be routed to optimised storage paths.

**t_annotation_assigned_by**

| id | annotation | assigned_by |
| --- | --- | --- |
| ASSI-0001 | compliance_audit | LICE-0005 |
| ASSI-0002 | telemetry_ingestion | LICE-0006 |
| ASSI-0003 | provenance_trace | LICE-0005 |
| ASSI-0004 | provenance_trace | LICE-0006 |
| ASSI-0005 | source_system_sync | LICE-0004 |
| ASSI-0006 | source_system_sync | LICE-0004 |

**t_annotation_assigned_by_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ASSI-0001 | confidence | xsd:decimal |
| ASSI-0002 | dimension_kind | xsd:string |
| ASSI-0003 | method | xsd:string |
| ASSI-0004 | recorded_at | xsd:dateTime |
| ASSI-0005 | uncertainty | xsd:decimal |
| ASSI-0006 | unit | xsd:string |
| ASSI-0007 | value | xsd:decimal |
| ASSI-0008 | encoding | xsd:string |

**t_annotation_assigned_by_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ASSI-0001 | ASSI-0001 | ASSI-0004 | 2025-05-21T21:38:03 |
| ASSI-0002 | ASSI-0002 | ASSI-0004 | 2024-06-17T00:22:41 |
| ASSI-0003 | ASSI-0003 | ASSI-0004 | 2023-06-05T19:53:01 |
| ASSI-0004 | ASSI-0004 | ASSI-0004 | 2025-01-30T17:11:59 |
| ASSI-0005 | ASSI-0005 | ASSI-0004 | 2023-08-08T10:34:13 |
| ASSI-0006 | ASSI-0006 | ASSI-0004 | 2023-06-13T10:27:19 |

**t_annotation_assigned_by_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ASSI-0001 | ASSI-0001 | ASSI-0001 | 0.167 |
| ASSI-0002 | ASSI-0001 | ASSI-0005 | 103.53 |
| ASSI-0003 | ASSI-0001 | ASSI-0007 | 863.30 |
| ASSI-0004 | ASSI-0002 | ASSI-0001 | 0.404 |
| ASSI-0005 | ASSI-0002 | ASSI-0005 | 720.81 |
| ASSI-0006 | ASSI-0002 | ASSI-0007 | 58.05 |
| ASSI-0007 | ASSI-0003 | ASSI-0001 | 0.783 |
| ASSI-0008 | ASSI-0003 | ASSI-0005 | 338.86 |

**t_annotation_assigned_by_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ASSI-0001 | ASSI-0001 | ASSI-0002 | Dimension Kind 01 |
| ASSI-0002 | ASSI-0001 | ASSI-0008 | Encoding 02 |
| ASSI-0003 | ASSI-0001 | ASSI-0009 | calibration record |
| ASSI-0004 | ASSI-0001 | ASSI-0010 | de |
| ASSI-0005 | ASSI-0001 | ASSI-0003 | hybrid |
| ASSI-0006 | ASSI-0001 | ASSI-0006 | nm |
| ASSI-0007 | ASSI-0002 | ASSI-0002 | Dimension Kind 07 |
| ASSI-0008 | ASSI-0002 | ASSI-0008 | Encoding 08 |

Conceptual construction processes formalise the transformation of raw inputs into structured knowledge artefacts by specifying a source subject, a processing method, and a generated predicate. A process identified as `PROC-0001` applies the `HierarchicalEdge` construction method to the subject `Raw Data Dictionary` and produces the predicate `CrossReferenceLink`, while `PROC-0003` applies `Semantic Enrichment` to `Raw Metadata Catalog` to yield `Data Model Refinement`. Other processes include `PROC-0002` which transforms `Unstructured Log Streams` through `HierarchicalEdge` into `Provenance Tracing`, and `PROC-0004` which converts `Raw Sensor Readings` via `CausalDependency` into `Schema Derivation`. Each process is uniquely identified (e.g., `PROC-0001` through `PROC-0004`) and the four columns together encode a complete transformation rule: what is consumed, how it is processed, and what output predicate is produced.

Subject-target relationships are mediated through role-typed associations that capture the nature of the connection between two entities. In the licensing domain, eBPF programs such as `uprobe_syscall`, `cgroup_sock_release`, `socket_filter`, and `lsm_bpf` are linked to licenses including `MPL-2.0`, `EUPL-1.2`, `Unlicense`, and `ISC` through a junction table where each association row carries a `role` value—`contributor`, `reviewer`, or `observer`—that qualifies the relationship. The same row carries both an `ebpfprogram_id` (the subject) and a `license_id` (the target), enabling multi-valued associations where a single program may participate in multiple licensed relationships with different roles, and a single license may be associated with multiple programs. This role-annotated bipartite structure generalises beyond simple foreign-key references to express the semantic context of each linkage.

**t_ebpfprogram_with_license**

| id | ebpfprogram |
| --- | --- |
| LICE-0001 | uprobe_syscall |
| LICE-0002 | cgroup_sock_release |
| LICE-0003 | socket_filter |
| LICE-0004 | lsm_bpf |
| LICE-0005 | xdp_router |
| LICE-0006 | cgroup_sock_release |

**t_ebpfprogram_with_license_license**

| id | license |
| --- | --- |
| LICE-0001 | MPL-2.0 |
| LICE-0002 | EUPL-1.2 |
| LICE-0003 | Unlicense |
| LICE-0004 | ISC |
| LICE-0005 | Apache-2.0 |
| LICE-0006 | LGPL-2.1 |
| LICE-0007 | Zlib |

**t_ebpfprogram_with_license__license**

| id | ebpfprogram_id | license_id | role |
| --- | --- | --- | --- |
| LICE-0001 | LICE-0002 | LICE-0004 | contributor |
| LICE-0002 | LICE-0006 | LICE-0002 | reviewer |
| LICE-0003 | LICE-0002 | LICE-0001 | observer |
| LICE-0004 | LICE-0002 | LICE-0006 | contributor |
| LICE-0005 | LICE-0003 | LICE-0004 | reviewer |
| LICE-0006 | LICE-0005 | LICE-0003 | contributor |
| LICE-0007 | LICE-0005 | LICE-0005 | reviewer |
| LICE-0008 | LICE-0006 | LICE-0003 | contributor |

The identifier namespace spans these distinct entity types—`PROC-` prefixed keys for construction processes, `LICE-` prefixed keys for eBPF programs and licenses, and `ASSI-` prefixed keys for annotations—providing a unified addressing scheme that supports cross-table references without ambiguity. The `assigned_by` annotation table, for instance, references `LICE-` identifiers as assignors, while the annotation attribute tables reference `ASSI-` identifiers as both entity anchors and attribute definitions. This consistent use of typed identifiers across the schema ensures that every value, relationship, and transformation can be traced back to its defining entity, supporting auditability and provenance queries that span the full lifecycle from raw input through conceptual construction to annotated output.

**t_conceptual_construction_process**

| id | conceptual_construction_process | transforms_subject | generates_predicate |
| --- | --- | --- | --- |
| PROC-0001 | HierarchicalEdge | Raw Data Dictionary | CrossReferenceLink |
| PROC-0002 | HierarchicalEdge | Unstructured Log Streams | Provenance Tracing |
| PROC-0003 | Semantic Enrichment | Raw Metadata Catalog | Data Model Refinement |
| PROC-0004 | CausalDependency | Raw Sensor Readings | Schema Derivation |
| PROC-0005 | HierarchicalEdge | Unaligned Concept Lists | Schema Derivation |