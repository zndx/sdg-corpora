---
chapter_id: ch_live_control_with_classification_tier_dd0274
topic_id: 61
family: 03_directive_governance
cited_terms: ['control_with_classification_tier', 'subclass_disjoint_from_artifact', 'claim_subclass']
model: engine-refine
---

The classification of security controls rests on a tripartite structure of identifiers, typed attributes, and value assignments that together encode governance policy with machine-readable precision. Each control—whether input sanitization, role-based access, encryption at rest, or session expiration—is anchored by a unique identifier such as TIER-0001 through TIER-0004, establishing a stable reference point across all downstream metadata. The attribute schema then decomposes each control into dimensioned properties: effective_date, enforcement, mandatory, and priority, each bound to a strict type constraint drawn from the XML Schema definition space. A date attribute carries an xsd:date type, enforcement and mandatory resolve to xsd:string and xsd:boolean respectively, while priority is typed as xsd:integer. This type discipline ensures that every value assignment is validated at ingestion, preventing semantic drift across the classification pipeline.

**t_control_with_classification_tier**

| id | control |
| --- | --- |
| TIER-0001 | Input sanitization |
| TIER-0002 | Role based access |
| TIER-0003 | Encryption at rest |
| TIER-0004 | Session expiration |
| TIER-0005 | Firewall rule set |
| TIER-0006 | Encryption at rest |

**t_control_with_classification_tier_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| TIER-0001 | effective_date | xsd:date |
| TIER-0002 | enforcement | xsd:string |
| TIER-0003 | mandatory | xsd:boolean |
| TIER-0004 | priority | xsd:integer |
| TIER-0005 | review_cycle_days | xsd:integer |
| TIER-0006 | scope | xsd:string |
| TIER-0007 | encoding | xsd:string |
| TIER-0008 | label_text | xsd:string |

**t_control_with_classification_tier_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TIER-0001 | TIER-0001 | TIER-0003 | false |
| TIER-0002 | TIER-0002 | TIER-0003 | true |
| TIER-0003 | TIER-0003 | TIER-0003 | true |
| TIER-0004 | TIER-0004 | TIER-0003 | true |
| TIER-0005 | TIER-0005 | TIER-0003 | true |
| TIER-0006 | TIER-0006 | TIER-0003 | false |

**t_control_with_classification_tier_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TIER-0001 | TIER-0001 | TIER-0001 | 2023-02-10 |
| TIER-0002 | TIER-0002 | TIER-0001 | 2023-09-02 |
| TIER-0003 | TIER-0003 | TIER-0001 | 2024-01-29 |
| TIER-0004 | TIER-0004 | TIER-0001 | 2024-02-25 |
| TIER-0005 | TIER-0005 | TIER-0001 | 2025-05-01 |
| TIER-0006 | TIER-0006 | TIER-0001 | 2023-03-16 |

**t_control_with_classification_tier_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TIER-0001 | TIER-0001 | TIER-0004 | 2 |
| TIER-0002 | TIER-0001 | TIER-0005 | 715 |
| TIER-0003 | TIER-0002 | TIER-0004 | 4 |
| TIER-0004 | TIER-0002 | TIER-0005 | 86 |
| TIER-0005 | TIER-0003 | TIER-0004 | 1 |
| TIER-0006 | TIER-0003 | TIER-0005 | 78 |
| TIER-0007 | TIER-0004 | TIER-0004 | 5 |
| TIER-0008 | TIER-0004 | TIER-0005 | 174 |

**t_control_with_classification_tier_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TIER-0001 | TIER-0001 | TIER-0007 | Encoding 01 |
| TIER-0002 | TIER-0001 | TIER-0002 | Enforcement 02 |
| TIER-0003 | TIER-0001 | TIER-0008 | audit excerpt |
| TIER-0004 | TIER-0001 | TIER-0009 | en |
| TIER-0005 | TIER-0001 | TIER-0006 | Scope 05 |
| TIER-0006 | TIER-0002 | TIER-0007 | Encoding 06 |
| TIER-0007 | TIER-0002 | TIER-0002 | Enforcement 07 |
| TIER-0008 | TIER-0002 | TIER-0008 | change rationale |

Value assignments materialize the abstract attribute definitions through a set of type-dispatch tables, each keyed by a composite of entity identifier and attribute identifier. Boolean attributes such as mandatory yield values of either true or false, as observed when TIER-0003 is marked mandatory across entities TIER-0002, TIER-0003, and TIER-0004 but not TIER-0001. Date attributes resolve to concrete calendar points—2023-02-10, 2023-09-02, 2024-01-29, 2024-02-25—anchoring the effective_date of control TIER-0001 to specific temporal boundaries that govern when each control becomes operative. Integer attributes capture priority scores ranging from 2 to 86, with values such as 715 and 86 indicating a wide dynamic range in the relative importance assigned to controls TIER-0004 and TIER-0005. String-valued attributes encode freeform descriptors including Encoding 01, Enforcement 02, audit excerpt, and en, providing human-readable annotations alongside the structured fields.

The entity-to-attribute linkage operates through a normalized join pattern: the entity_id column in each value table references the identifier of the control being classified, while the attr_id column points to the attribute definition in the attribute registry. This design permits a single control to carry multiple attribute values of different types without schema modification, and conversely allows a single attribute definition to be instantiated across many controls. The foreign-key relationships are explicit and referential—entity_id in the value tables maps to id in the control definition table, and attr_id maps to id in the attribute definition table—creating a graph of dependencies that can be traversed for compliance auditing or policy impact analysis.

Parallel to the control classification framework, artifact subclass relationships are governed by disjointness constraints that enforce ontological separation between categories of technical objects. Artifacts identified as ARTI-0001 through ARTI-0004 are each associated with a disjoint type—lab-assay-protocol, sensor-telemetry-stream, telemetry-metadata-index—ensuring that an artifact instance belongs to exactly one subclass and cannot be ambiguously classified across competing taxonomies. This disjointness axiom prevents classification collisions in downstream reasoning engines and supports clean partitioning of telemetry and assay data streams.

**t_subclass_disjoint_from_artifact**

| id | disjoint |
| --- | --- |
| ARTI-0001 | lab-assay-protocol |
| ARTI-0002 | sensor-telemetry-stream |
| ARTI-0003 | telemetry-metadata-index |
| ARTI-0004 | telemetry-metadata-index |
| ARTI-0005 | artifact-manifest-record |
| ARTI-0006 | feature-vector-cache |
| ARTI-0007 | provenance-chain-hash |

Claims about these artifacts are recorded with full provenance metadata, including the claim text itself, the artifact it references, the method by which the claim was derived, and the label text that categorizes the supporting documentation. A claim such as "Lab centrifuge unit-7" is asserted about artifact ARTI-0002 via an automated method and annotated with the label text audit excerpt, while "QC sample failed" targets ARTI-0006 through a hybrid derivation path labeled intake form. The method column distinguishes between automated, hybrid, and inferred provenance tracks, each carrying different assurance levels for downstream consumers. Label text values—audit excerpt, intake form, pre-release note, calibration record—serve as document-type classifiers that enable rapid retrieval of the evidentiary basis for any given claim. The claim_about foreign key binds each assertion to its target artifact, while the method and label_text columns together form a dual-axis provenance index that supports both methodological and documentary filtering.

**t_claim_subclass**

| id | claim | claim_about | method | label_text |
| --- | --- | --- | --- | --- |
| CLAI-0001 | Lab centrifuge unit-7 | ARTI-0002 | automated | audit excerpt |
| CLAI-0002 | QC sample failed | ARTI-0006 | hybrid | intake form |
| CLAI-0003 | Packet loss SLA breach | ARTI-0007 | hybrid | pre-release note |
| CLAI-0004 | Authentication microservice | ARTI-0007 | inferred | calibration record |