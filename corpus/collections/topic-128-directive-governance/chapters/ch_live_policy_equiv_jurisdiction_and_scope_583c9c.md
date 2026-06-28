---
chapter_id: ch_live_policy_equiv_jurisdiction_and_scope_583c9c
topic_id: 128
family: 03_directive_governance
cited_terms: ['policy_equiv_jurisdiction_and_scope', 'claim_basic', 'conceptual_construction_process']
model: engine-refine
---

Policy jurisdiction and scope management is modelled through a tripartite structure that binds regulatory policies to their applicable jurisdictions and governing frameworks. The core entity, `t_policy_equiv_jurisdiction_and_scope`, anchors each policy record with an identifier such as `SCOP-0001` through `SCOP-0004`, alongside a descriptive policy label—`AI Model Training`, `Personal Data Processing`, `Supply Chain Logistics`, and `Third Party Vendors` being representative instances. These policies are then linked to specific regulatory jurisdictions via the `t_policy_equiv_jurisdiction_and_scope_jurisdiction` table, which maps each policy scope to its corresponding authority: `FDA 21 CFR 11`, `UK Information Commissioner`, `Industrial Control Systems`, and `CCPA`. The relational glue is the associative table `t_policy_equiv_jurisdiction_and_scope__jurisdiction`, which records the nature of each policy-to-jurisdiction linkage through a `role` attribute taking values such as `contributor`, `observer`, and `owner`, thereby capturing whether a jurisdiction actively shapes a policy, passively monitors it, or exercises direct governance.

**t_policy_equiv_jurisdiction_and_scope**

| id | policy |
| --- | --- |
| SCOP-0001 | AI Model Training |
| SCOP-0002 | Personal Data Processing |
| SCOP-0003 | Supply Chain Logistics |
| SCOP-0004 | Third Party Vendors |
| SCOP-0005 | Cross Border Transfers |
| SCOP-0006 | European Commission |

**t_policy_equiv_jurisdiction_and_scope_jurisdiction**

| id | jurisdiction |
| --- | --- |
| SCOP-0001 | FDA 21 CFR 11 |
| SCOP-0002 | UK Information Commissioner |
| SCOP-0003 | Industrial Control Systems |
| SCOP-0004 | CCPA |
| SCOP-0005 | UK Information Commissioner |
| SCOP-0006 | National Institute of Standards |

**t_policy_equiv_jurisdiction_and_scope__jurisdiction**

| id | policy_id | jurisdiction_id | role |
| --- | --- | --- | --- |
| SCOP-0001 | SCOP-0001 | SCOP-0002 | contributor |
| SCOP-0002 | SCOP-0001 | SCOP-0001 | observer |
| SCOP-0003 | SCOP-0001 | SCOP-0002 | observer |
| SCOP-0004 | SCOP-0002 | SCOP-0006 | owner |
| SCOP-0005 | SCOP-0003 | SCOP-0005 | contributor |
| SCOP-0006 | SCOP-0004 | SCOP-0002 | owner |
| SCOP-0007 | SCOP-0006 | SCOP-0001 | reviewer |
| SCOP-0008 | SCOP-0001 | SCOP-0006 | reviewer |

**t_policy_equiv_jurisdiction_and_scope_governs_scope**

| id | governs_scope |
| --- | --- |
| SCOP-0001 | Basel III |
| SCOP-0002 | CCPA |
| SCOP-0003 | Massachusetts Privacy Board |
| SCOP-0004 | NIST 800-53 |
| SCOP-0005 | EU AI Act |
| SCOP-0006 | EU AI Act |
| SCOP-0007 | Securities Exchange Commission |

A parallel association structure connects policies to their governing scopes through `t_policy_equiv_jurisdiction_and_scope_governs_scope`, which enumerates frameworks such as `Basel III`, `CCPA`, `Massachusetts Privacy Board`, and `NIST 800-53`. The join table `t_policy_equiv_jurisdiction_and_scope__governs_scope` extends this linkage with both a `role`—taking values including `contributor`, `observer`, and `reviewer`—and a `cardinality_note` field (e.g., `Cardinality Note 01` through `Cardinality Note 04`) that documents multiplicity constraints on the relationship. This dual-layer role-and-cardinality annotation enables fine-grained governance semantics: a policy may contribute to a framework while another policy serves as its reviewer, and cardinality constraints govern whether the association is one-to-one, one-to-many, or many-to-many.

**t_policy_equiv_jurisdiction_and_scope__governs_scope**

| id | policy_id | governs_scope_id | role | cardinality_note |
| --- | --- | --- | --- | --- |
| SCOP-0001 | SCOP-0003 | SCOP-0003 | contributor | Cardinality Note 01 |
| SCOP-0002 | SCOP-0004 | SCOP-0007 | contributor | Cardinality Note 02 |
| SCOP-0003 | SCOP-0005 | SCOP-0002 | observer | Cardinality Note 03 |
| SCOP-0004 | SCOP-0002 | SCOP-0002 | reviewer | Cardinality Note 04 |
| SCOP-0005 | SCOP-0002 | SCOP-0002 | owner | Cardinality Note 05 |
| SCOP-0006 | SCOP-0005 | SCOP-0001 | observer | Cardinality Note 06 |
| SCOP-0007 | SCOP-0003 | SCOP-0007 | observer | Cardinality Note 07 |
| SCOP-0008 | SCOP-0006 | SCOP-0006 | contributor | Cardinality Note 08 |

Claims are represented as discrete factual assertions in `t_claim_basic`, where each record carries an identifier such as `CLAI-0001` through `CLAI-0004` and a claim text like `Model accuracy below SLA`, `Schema version deprecated`, or `File checksum matches`. The attribute schema for claims is defined in `t_claim_basic_attr`, which specifies attribute names (`confidence`, `dimension_kind`, `method`, `recorded_at`) and their corresponding data types in XSD notation—`xsd:decimal`, `xsd:string`, and `xsd:dateTime`—establishing a typed attribute vocabulary that constrains the kinds of metadata that can be attached to any given claim.

**t_claim_basic**

| id | claim |
| --- | --- |
| CLAI-0001 | Model accuracy below SLA |
| CLAI-0002 | Schema version deprecated |
| CLAI-0003 | Model accuracy below SLA |
| CLAI-0004 | File checksum matches |
| CLAI-0005 | Compliance audit passed |
| CLAI-0006 | Compliance audit passed |

**t_claim_basic_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| CLAI-0001 | confidence | xsd:decimal |
| CLAI-0002 | dimension_kind | xsd:string |
| CLAI-0003 | method | xsd:string |
| CLAI-0004 | recorded_at | xsd:dateTime |
| CLAI-0005 | uncertainty | xsd:decimal |
| CLAI-0006 | unit | xsd:string |
| CLAI-0007 | value | xsd:decimal |
| CLAI-0008 | encoding | xsd:string |

**t_claim_basic_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CLAI-0001 | CLAI-0001 | CLAI-0004 | 2025-05-28T11:02:08 |
| CLAI-0002 | CLAI-0002 | CLAI-0004 | 2025-04-22T09:44:09 |
| CLAI-0003 | CLAI-0003 | CLAI-0004 | 2025-01-23T06:41:57 |
| CLAI-0004 | CLAI-0004 | CLAI-0004 | 2024-03-14T10:07:11 |
| CLAI-0005 | CLAI-0005 | CLAI-0004 | 2023-08-27T20:51:04 |
| CLAI-0006 | CLAI-0006 | CLAI-0004 | 2025-04-10T08:56:25 |

**t_claim_basic_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CLAI-0001 | CLAI-0001 | CLAI-0001 | 0.443 |
| CLAI-0002 | CLAI-0001 | CLAI-0005 | 443.93 |
| CLAI-0003 | CLAI-0001 | CLAI-0007 | 257.71 |
| CLAI-0004 | CLAI-0002 | CLAI-0001 | 0.828 |
| CLAI-0005 | CLAI-0002 | CLAI-0005 | 729.35 |
| CLAI-0006 | CLAI-0002 | CLAI-0007 | 717.18 |
| CLAI-0007 | CLAI-0003 | CLAI-0001 | 0.004 |
| CLAI-0008 | CLAI-0003 | CLAI-0005 | 534.68 |

**t_claim_basic_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CLAI-0001 | CLAI-0001 | CLAI-0002 | Dimension Kind 01 |
| CLAI-0002 | CLAI-0001 | CLAI-0008 | Encoding 02 |
| CLAI-0003 | CLAI-0001 | CLAI-0009 | audit excerpt |
| CLAI-0004 | CLAI-0001 | CLAI-0010 | fr |
| CLAI-0005 | CLAI-0001 | CLAI-0003 | automated |
| CLAI-0006 | CLAI-0001 | CLAI-0006 | m/s |
| CLAI-0007 | CLAI-0002 | CLAI-0002 | Dimension Kind 07 |
| CLAI-0008 | CLAI-0002 | CLAI-0008 | Encoding 08 |

Attribute values are materialised across three value tables partitioned by type, each linking a claim entity to an attribute definition and a concrete value. The datetime values table stores timestamps such as `2025-05-28T11:02:08` and `2024-03-14T10:07:11` against the `recorded_at` attribute; the decimal values table holds numeric measurements like `0.443`, `443.93`, and `257.71` against attributes such as `confidence`; and the varchar values table captures string literals including `Dimension Kind 01`, `Encoding 02`, `audit excerpt`, and `fr`. This normalised value-store pattern ensures type safety at query time while keeping the attribute definition layer decoupled from the value layer, allowing new attributes to be introduced without schema migration.

The conceptual construction process table formalises the transformation pipeline that converts raw informational inputs into structured predicates. Each process record—identified by `PROC-0001` through `PROC-0004`—specifies a `conceptual_construction_process` name such as `HierarchicalEdge`, `Semantic Enrichment`, or `CausalDependency`; a `transforms_subject` source, which may be a `Raw Data Dictionary`, `Unstructured Log Streams`, `Raw Metadata Catalog`, or `Raw Sensor Readings`; and a `generates_predicate` output, including `CrossReferenceLink`, `Provenance Tracing`, `Data Model Refinement`, and `Schema Derivation`. This tripartite specification captures the full transformation chain from raw input through a named construction mechanism to a derived relational predicate, providing an auditable provenance trail for how structured knowledge elements are produced from unstructured or semi-structured sources.

**t_conceptual_construction_process**

| id | conceptual_construction_process | transforms_subject | generates_predicate |
| --- | --- | --- | --- |
| PROC-0001 | HierarchicalEdge | Raw Data Dictionary | CrossReferenceLink |
| PROC-0002 | HierarchicalEdge | Unstructured Log Streams | Provenance Tracing |
| PROC-0003 | Semantic Enrichment | Raw Metadata Catalog | Data Model Refinement |
| PROC-0004 | CausalDependency | Raw Sensor Readings | Schema Derivation |
| PROC-0005 | HierarchicalEdge | Unaligned Concept Lists | Schema Derivation |