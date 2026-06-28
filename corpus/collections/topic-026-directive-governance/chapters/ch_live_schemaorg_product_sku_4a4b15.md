---
chapter_id: ch_live_schemaorg_product_sku_4a4b15
topic_id: 26
family: 07_long_tail
cited_terms: ['schemaorg_product_sku', 'policy_min_one_enforcer', 'requirement_traces_to']
model: engine-refine
---

In governed data environments, an **entity** is the durable object of record—the product, policy, requirement, or organizational artifact that compliance systems must describe, audit, and relate over time. Entities are not self-describing; they acquire meaning through **attributes** (*attr*), which name the properties that matter for governance. A commercial SKU such as the Pixel 8 Pro is an entity identified as `SKU-0001`, but its enforceability in a control framework depends on whether it carries a `checksum`, a `created_date`, a formal `identifier`, or a `license`—each of those names denotes an attribute whose presence, absence, and population state become audit questions. The separation between entity and attribute is foundational: the entity answers *what* is in scope, while attributes answer *what is known about it* and *under what semantic contract that knowledge is expressed*.

**t_schemaorg_product_sku**

| id | schemaorg | s_k_u |
| --- | --- | --- |
| SKU-0001 | Pixel 8 Pro | ENFO-0004 |
| SKU-0002 | MX Master 3S | ENFO-0006 |
| SKU-0003 | Galaxy S24 Ultra | ENFO-0002 |
| SKU-0004 | PlayStation 5 | ENFO-0001 |
| SKU-0005 | PlayStation 5 | ENFO-0005 |
| SKU-0006 | QuietComfort Ultra | ENFO-0004 |

**t_schemaorg_product_sku_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SKU-0001 | SKU-0001 | SKU-0002 | 2025-05-15 |
| SKU-0002 | SKU-0002 | SKU-0002 | 2023-06-09 |
| SKU-0003 | SKU-0003 | SKU-0002 | 2025-02-16 |
| SKU-0004 | SKU-0004 | SKU-0002 | 2024-10-26 |
| SKU-0005 | SKU-0005 | SKU-0002 | 2025-01-20 |
| SKU-0006 | SKU-0006 | SKU-0002 | 2023-04-12 |

**t_policy_min_one_enforcer**

| id | policy |
| --- | --- |
| ENFO-0001 | SOC 2 Type II Controls |
| ENFO-0002 | ISO 13485 QMS |
| ENFO-0003 | GDPR Compliance Framework |
| ENFO-0004 | EU AI Act Risk Management |
| ENFO-0005 | ISO 13485 QMS |
| ENFO-0006 | ISO 13485 QMS |

**t_policy_min_one_enforcer_enforced_by**

| id | enforced_by |
| --- | --- |
| ENFO-0001 | Regulatory Affairs Division |
| ENFO-0002 | Compliance Audit Board |
| ENFO-0003 | Privacy Officer |
| ENFO-0004 | Data Stewardship Council |
| ENFO-0005 | Automated Policy Engine |
| ENFO-0006 | Risk Management Committee |

**t_requirement_traces_to**

| id | requirement |
| --- | --- |
| TRAC-0001 | Network Segmentation Rule |
| TRAC-0002 | Access Control Mandate |
| TRAC-0003 | Privacy Compliance Requirement |
| TRAC-0004 | Privacy Compliance Requirement |
| TRAC-0005 | Access Control Mandate |
| TRAC-0006 | Encryption Standard |
| TRAC-0007 | System Availability Target |

**t_requirement_traces_to_traces_to**

| id | traces_to |
| --- | --- |
| TRAC-0001 | HIPAA Security Rule |
| TRAC-0002 | Risk Assessment Matrix |
| TRAC-0003 | Compliance Audit Checklist |
| TRAC-0004 | ISO 27001 Control |
| TRAC-0005 | Penetration Test Suite |
| TRAC-0006 | NIST SP 800-53 |
| TRAC-0007 | Vulnerability Scan Config |

Every attribute carries an **attr type** that fixes the interpretive and validation rules under which its values may be stored, compared, and exchanged. Types such as `xsd:string`, `xsd:date`, and domain-specific classes like `cco:DesignativeICE` are not cosmetic labels; they determine which value stores are authoritative, which comparators apply, and which downstream systems may consume the data without loss of meaning. When `created_date` is typed as `xsd:date`, the system routes its values into a date-valued store and expects representations like `2025-05-15` for the MX Master 3S (`SKU-0002`) or `2024-10-26` for the PlayStation 5 (`SKU-0004`). Integer-typed facts—`222` and `9` associated with `SKU-0001`, `488` and `10` with `SKU-0002`—and string-typed facts such as `c0ffee42`, `ARN:res/41`, `Apache-2.0`, and `eu-west-3` land in parallel typed repositories precisely because attr type governs integrity constraints at write time and interoperability at read time. Mis-typing an attribute is therefore a governance failure: it silently permits invalid literals, breaks traceability joins, and undermines cross-framework mappings.

The **identifier** is the stable key that binds these layers together across tables, policies, and evidence chains. Identifiers such as `SKU-0001` through `SKU-0004` for products, `ENFO-0001` through `ENFO-0004` for enforcement artifacts, and `TRAC-0001` through `TRAC-0004` for requirements function as the spine of referential integrity: they allow an entity to be referenced unambiguously even when its display name changes, when multiple frameworks describe the same object, or when relational edges outlive any single document revision. In attribute-value patterns, identifiers appear twice in every fact row—once for the row itself and again as `entity_id` and `attr_id` foreign keys—so that a single entity may hold many typed values without collapsing distinct properties into one undifferentiated field. The attribute literally named `identifier`, typed as `cco:DesignativeICE`, illustrates a second layer of identification: some properties are themselves authoritative naming constructs (`ARN:res/41` on `SKU-0001`) that external systems treat as the canonical handle, distinct from the internal surrogate key.

**t_schemaorg_product_sku_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| SKU-0001 | checksum | xsd:string |
| SKU-0002 | created_date | xsd:date |
| SKU-0003 | identifier | cco:DesignativeICE |
| SKU-0004 | license | xsd:string |
| SKU-0005 | mime_type | xsd:string |
| SKU-0006 | size_bytes | xsd:long |
| SKU-0007 | uri | xsd:string |
| SKU-0008 | version | xsd:integer |

Values stored against attributes constitute the **misc** dimension of the model—the concrete literals, codes, timestamps, and references that turn schema into evidence. Misc is where operational reality meets control design: a `license` value of `Apache-2.0` on `SKU-0001` may trigger open-source compliance review; a `created_date` of `2023-06-09` on `SKU-0002` establishes temporal provenance for change-management attestations; integer misc entries may encode counts, severities, or version stamps depending on attribute definition. Because misc is partitioned by attr type into dedicated value stores, retrieval is both efficient and semantically safe—auditors query dates without coercing strings, and integrators never receive a date where they expected an integer. The misc layer is also where gaps become visible: an entity with a defined `checksum` attribute but no corresponding varchar value is materially different from one fully populated, and that difference is often the basis for pass/fail judgments in continuous compliance monitoring.

Beyond intrinsic properties, governance frameworks require **subject–target** relationships annotated by **role**. A subject is the originating node in a directed association—the policy or requirement that asserts an obligation or lineage—while a target is the node it connects to: an enforcing body, a parent standard, or another control artifact. Policy enforcement illustrates the pattern: subjects such as `ENFO-0005` (linked to frameworks including the EU AI Act Risk Management context) connect to targets including `ENFO-0002` (the Compliance Audit Board) and `ENFO-0004` (the Data Stewardship Council), with roles distinguishing *owner* from *contributor* from *observer*. The role is not metadata for display; it encodes accountability. An *owner* bears attestation authority; a *contributor* supplies evidence or implementation detail; an *observer* may review without signing. The same structural grammar appears in requirement traceability, where a Network Segmentation Rule (`TRAC-0001`) as subject traces to targets such as ISO 27001 Control (`TRAC-0004`), while duplicated Privacy Compliance Requirement subjects (`TRAC-0004`) consolidate review relationships with *reviewer* roles—showing how one target standard can absorb multiple originating requirements without collapsing their distinct audit narratives.

**t_policy_min_one_enforcer__enforced_by**

| id | policy_id | enforced_by_id | role |
| --- | --- | --- | --- |
| ENFO-0001 | ENFO-0005 | ENFO-0002 | contributor |
| ENFO-0002 | ENFO-0004 | ENFO-0002 | observer |
| ENFO-0003 | ENFO-0005 | ENFO-0004 | owner |
| ENFO-0004 | ENFO-0005 | ENFO-0003 | contributor |
| ENFO-0005 | ENFO-0003 | ENFO-0001 | contributor |
| ENFO-0006 | ENFO-0002 | ENFO-0004 | reviewer |
| ENFO-0007 | ENFO-0004 | ENFO-0003 | owner |
| ENFO-0008 | ENFO-0001 | ENFO-0002 | reviewer |

**t_requirement_traces_to__traces_to**

| id | requirement_id | traces_to_id | role |
| --- | --- | --- | --- |
| TRAC-0001 | TRAC-0001 | TRAC-0004 | owner |
| TRAC-0002 | TRAC-0004 | TRAC-0004 | reviewer |
| TRAC-0003 | TRAC-0004 | TRAC-0004 | reviewer |
| TRAC-0004 | TRAC-0001 | TRAC-0004 | contributor |
| TRAC-0005 | TRAC-0007 | TRAC-0005 | contributor |
| TRAC-0006 | TRAC-0002 | TRAC-0003 | observer |
| TRAC-0007 | TRAC-0007 | TRAC-0002 | owner |
| TRAC-0008 | TRAC-0001 | TRAC-0002 | observer |

Taken together, identifier, entity, attr, attr type, misc, subject, target, and role form a composable language for evidence-backed governance. Identifiers stabilize reference; entities anchor scope; attributes and attr types define what may be said and how; misc records what was actually said; and subject–target–role triples express who enforces what, and which operational requirements inherit from which normative sources. A SKU mapped to Schema.org product semantics, attributed with license and provenance fields, and linked through enforcement policies to named organizational roles is no longer merely catalog data—it is a inspectable node in a compliance graph. Practitioners who master these primitives can reconstruct audit trails without ad hoc spreadsheets: they follow identifiers to entities, entities to typed attributes, attributes to misc values, and entities or requirements to directed relationships whose roles reveal authority and participation. That composability is why these constructs matter in practice—they convert fragmented tables and policies into a single, queryable fabric suitable for attestation, impact analysis, and regulator-ready exposition.

**t_schemaorg_product_sku_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SKU-0001 | SKU-0001 | SKU-0006 | 222 |
| SKU-0002 | SKU-0001 | SKU-0008 | 9 |
| SKU-0003 | SKU-0002 | SKU-0006 | 488 |
| SKU-0004 | SKU-0002 | SKU-0008 | 10 |
| SKU-0005 | SKU-0003 | SKU-0006 | 413 |
| SKU-0006 | SKU-0003 | SKU-0008 | 5 |
| SKU-0007 | SKU-0004 | SKU-0006 | 223 |
| SKU-0008 | SKU-0004 | SKU-0008 | 4 |

**t_schemaorg_product_sku_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SKU-0001 | SKU-0001 | SKU-0001 | c0ffee42 |
| SKU-0002 | SKU-0001 | SKU-0003 | ARN:res/41 |
| SKU-0003 | SKU-0001 | SKU-0004 | Apache-2.0 |
| SKU-0004 | SKU-0001 | SKU-0009 | eu-west-3 |
| SKU-0005 | SKU-0001 | SKU-0005 | application/json |
| SKU-0006 | SKU-0001 | SKU-0010 | Name 06 |
| SKU-0007 | SKU-0001 | SKU-0011 | data-engineering |
| SKU-0008 | SKU-0001 | SKU-0012 | Tags 08 |