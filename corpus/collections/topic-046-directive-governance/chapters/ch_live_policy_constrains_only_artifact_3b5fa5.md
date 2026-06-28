---
chapter_id: ch_live_policy_constrains_only_artifact_3b5fa5
topic_id: 46
family: 01_foundation
cited_terms: ['policy_constrains_only_artifact', 'schemaorg_person_named', 'schema_version_subclass']
model: engine-refine
---

In governed information systems, an identifier is the stable handle by which every registrable object—policy rule, schema release, named person record, or typed attribute definition—remains addressable across time, tooling, and audit trails. Identifiers such as ARTI-0001 through ARTI-0004, NAME-0001 through NAME-0004, and VERS-0001 through VERS-0004 are not merely surrogate keys; they are the join fabric that lets enforcement decisions, semantic bindings, and attribute payloads refer unambiguously to the same logical thing even when display labels change or when multiple schemas coexist. Without that invariant, a compliance control cannot be shown to have applied to the artifact that was actually deployed, nor can a reviewer reconstruct which version of a subclass carried which value at the moment of certification.

**t_schemaorg_person_named**

| id | schemaorg |
| --- | --- |
| NAME-0001 | person/rosalind_franklin |
| NAME-0002 | NetworkFlow |
| NAME-0003 | LabAssayProtocol |
| NAME-0004 | person/alan_kay |
| NAME-0005 | person/alan_turing |
| NAME-0006 | AccessControlMatrix |
| NAME-0007 | RegulatoryCompliance |

**t_schema_version_subclass**

| id | schema | schema_version |
| --- | --- | --- |
| VERS-0001 | RegulatoryCompliance | release-11.0 |
| VERS-0002 | person/john_von_neumann | rc-2.1 |
| VERS-0003 | NetworkFlow | alpha-0.9 |
| VERS-0004 | IoTDeviceManifest | patch-3.2 |
| VERS-0005 | person/john_von_neumann | rc-2.1 |
| VERS-0006 | AssetRegistry | hotfix-2.0 |
| VERS-0007 | NetworkFlow | alpha-0.9 |
| VERS-0008 | RegulatoryCompliance | hotfix-2.0 |

**t_schema_version_subclass_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| VERS-0001 | checksum | xsd:string |
| VERS-0002 | created_date | xsd:date |
| VERS-0003 | identifier | cco:DesignativeICE |
| VERS-0004 | license | xsd:string |
| VERS-0005 | mime_type | xsd:string |
| VERS-0006 | size_bytes | xsd:long |
| VERS-0007 | uri | xsd:string |
| VERS-0008 | version | xsd:integer |

Enforcement and scope together specify how a policy obligation becomes operational reality rather than aspirational text. Enforcement characterizes the consequence of non-conformance—mandatory obligations that must be satisfied before work proceeds, or blocking gates that halt release until remediation—and the evidence shows both modes in live use: SOX controls on ARTI-0002 carry blocking enforcement, whereas CCPA and the remaining SOX entries are mandatory. Scope, in turn, delimits the population and context to which that obligation applies: a team-scoped rule governs only the collaborating unit that owns the artifact, a local scope narrows applicability to a bounded deployment or jurisdiction, and global scope extends the same requirement across the entire estate. The pairing of CCPA with global scope on ARTI-0001 and ARTI-0004 illustrates how privacy regimes are often elevated to organization-wide baselines, while SOX on ARTI-0003 under local scope reflects financial-controls tailoring that does not automatically propagate beyond the regulated boundary.

**t_policy_constrains_only_artifact**

| id | policy | enforcement | scope |
| --- | --- | --- | --- |
| ARTI-0001 | CCPA | mandatory | team |
| ARTI-0002 | SOX | blocking | global |
| ARTI-0003 | SOX | mandatory | local |
| ARTI-0004 | CCPA | mandatory | global |
| ARTI-0005 | Basel-III | deprecated | team |
| ARTI-0006 | NIST-800-53 | deprecated | regional |
| ARTI-0007 | NIST-800-53 | advisory | regional |

Entity, attr, and attr_type form the typed description layer through which versioned schema subclasses are made machine-checkable. An entity is the thing being described—here, schema-version records such as RegulatoryCompliance at release-11.0, NetworkFlow at alpha-0.9, or IoTDeviceManifest at patch-3.2—while attr names the slot within that entity’s contract (checksum, created_date, identifier, license) and attr_type declares the interpretive grammar auditors and validators must apply. Typed distinctions matter in practice: created_date is constrained as xsd:date, checksum and license as xsd:string, and identifier as cco:DesignativeICE, signaling that some values are not free text but designative identifiers within a controlled vocabulary. Attribute definitions are version-scoped themselves (VERS-0001 through VERS-0004 in the attribute registry), which allows the same logical field name to evolve its validation rules across schema releases without silently rewriting historical records.

**t_schema_version_subclass_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERS-0001 | VERS-0001 | VERS-0002 | 2024-06-07 |
| VERS-0002 | VERS-0002 | VERS-0002 | 2024-09-26 |
| VERS-0003 | VERS-0003 | VERS-0002 | 2024-06-05 |
| VERS-0004 | VERS-0004 | VERS-0002 | 2023-07-15 |
| VERS-0005 | VERS-0005 | VERS-0002 | 2025-03-15 |
| VERS-0006 | VERS-0006 | VERS-0002 | 2024-09-16 |
| VERS-0007 | VERS-0007 | VERS-0002 | 2023-01-08 |
| VERS-0008 | VERS-0008 | VERS-0002 | 2023-05-20 |

**t_schema_version_subclass_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERS-0001 | VERS-0001 | VERS-0006 | 24 |
| VERS-0002 | VERS-0001 | VERS-0008 | 11 |
| VERS-0003 | VERS-0002 | VERS-0006 | 16 |
| VERS-0004 | VERS-0002 | VERS-0008 | 12 |
| VERS-0005 | VERS-0003 | VERS-0006 | 266 |
| VERS-0006 | VERS-0003 | VERS-0008 | 11 |
| VERS-0007 | VERS-0004 | VERS-0006 | 422 |
| VERS-0008 | VERS-0004 | VERS-0008 | 5 |

**t_schema_version_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERS-0001 | VERS-0001 | VERS-0001 | a3f9c21e |
| VERS-0002 | VERS-0001 | VERS-0003 | doi:10.1109/x |
| VERS-0003 | VERS-0001 | VERS-0004 | MPL-2.0 |
| VERS-0004 | VERS-0001 | VERS-0009 | on-prem-dc1 |
| VERS-0005 | VERS-0001 | VERS-0005 | application/octet-stream |
| VERS-0006 | VERS-0001 | VERS-0010 | Name 06 |
| VERS-0007 | VERS-0001 | VERS-0011 | governance |
| VERS-0008 | VERS-0001 | VERS-0012 | Tags 08 |

The misc dimension—carried in value stores partitioned by representation—holds the instantiated facts that prove an entity satisfied its declared attributes at a point in time. Date-valued misc entries attach created_date to concrete timestamps (2024-06-07 on VERS-0001, 2024-09-26 on VERS-0002, and so forth), integer misc captures quantitative facets such as 24 and 11 on VERS-0001 or 16 and 12 on VERS-0002, and varchar misc materializes lexical payloads including checksum a3f9c21e, license MPL-2.0, identifier doi:10.1109/x, and deployment marker on-prem-dc1. Partitioning values by storage shape is a governance choice: it preserves type integrity at persistence boundaries, simplifies automated range and format checks, and yields cleaner evidentiary exports when regulators ask not “what did the system know?” but “what typed claim was recorded, under which attribute definition, for which entity?”

Subject, target, and role articulate directed relationships among independently identified records, especially where canonical semantics and human-readable identity must remain separable yet linkable. In person-oriented registries, schema.org-aligned subjects (person/rosalind_franklin, NetworkFlow, LabAssayProtocol, person/alan_kay) can be associated with full-name targets (Grace Hopper, Donald Knuth, John von Neumann) through junction records that also carry role: owner, observer, or reviewer. The evidence exposes both sound bindings and stress cases worth designing for—NAME-0004 again resolves to Grace Hopper, demonstrating legitimate many-to-one naming, while NAME-0004’s junction row references schemaorg_id NAME-0005, a subject not present in the primary named-person set, which is precisely the class of referential defect automated compliance graphs must detect before access decisions or publication workflows rely on it. Role is not decorative metadata; it determines whether a principal may alter lineage, attest to correctness, or merely consume results, and therefore belongs in the same evidentiary chain as enforcement mode and scope.

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

Taken together, these constructs implement a compliance handbook’s core promise: policies with explicit enforcement and scope govern artifacts; versioned entities expose typed attributes whose misc values constitute auditable state; identifiers stitch the graph; and subject–target–role edges express accountable relationships among semantic and human-facing identities. Operational maturity shows up in how consistently each layer is populated—blocking SOX on a globally scoped artifact is meaningless if created_date misc is missing, a DesignativeICE identifier is stored as an untyped string elsewhere, or a reviewer role points at a subject key that cannot be resolved. Dense, evidence-anchored registries therefore function less as passive documentation and more as executable governance: every field is a potential control point, and the worked examples above are the minimum material needed to teach validators, integrators, and auditors what to expect when the framework is functioning as designed.