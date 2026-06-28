---
chapter_id: ch_live_directive_only_governs_324ad3
topic_id: 47
family: 01_foundation
cited_terms: ['directive_only_governs', 'directive_only_governs_artifact', 'directive_supersedes_directive']
model: engine-refine
---

Governance architectures require precise anchoring to track regulatory obligations across evolving compliance landscapes. Within this framework, each directive, artifact, and relational mapping is assigned a unique identifier—such as GOVE-0001 for PCI DSS v4.0 Compliance or ARTI-0001 for HIPAA Privacy Rule implementations—that serves as the immutable reference point for audit trails and policy lineage. These identifiers do not merely label records; they establish the structural backbone of the entity model, where every governed object, whether a standalone directive like DIRE-0001 (HIPAA Data Privacy Rule) or a cross-referenced artifact, maintains a deterministic relationship to its parent policy. The entity construct thus functions as the operational node through which compliance scope is defined, ensuring that every regulatory requirement can be traced to a specific artifact, a related directive, or a supersession chain without ambiguity.

**t_directive_only_governs_artifact**

| id | directive | governs |
| --- | --- | --- |
| ARTI-0001 | HIPAA Privacy Rule | DIRE-0006 |
| ARTI-0002 | ISO 27001 Security Policy | DIRE-0007 |
| ARTI-0003 | FedRAMP Moderate | DIRE-0008 |
| ARTI-0004 | GLP Chapter 4 | DIRE-0005 |
| ARTI-0005 | ISO 27001:2022 | DIRE-0008 |
| ARTI-0006 | CCPA Section 1798.100 | DIRE-0005 |
| ARTI-0007 | NERC CIP-003 | DIRE-0001 |

**t_directive_only_governs_artifact_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0003 | true |
| ARTI-0002 | ARTI-0002 | ARTI-0003 | true |
| ARTI-0003 | ARTI-0003 | ARTI-0003 | true |
| ARTI-0004 | ARTI-0004 | ARTI-0003 | false |
| ARTI-0005 | ARTI-0005 | ARTI-0003 | false |
| ARTI-0006 | ARTI-0006 | ARTI-0003 | true |
| ARTI-0007 | ARTI-0007 | ARTI-0003 | false |

**t_directive_only_governs_artifact_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0004 | 5 |
| ARTI-0002 | ARTI-0001 | ARTI-0005 | 959 |
| ARTI-0003 | ARTI-0002 | ARTI-0004 | 4 |
| ARTI-0004 | ARTI-0002 | ARTI-0005 | 97 |
| ARTI-0005 | ARTI-0003 | ARTI-0004 | 5 |
| ARTI-0006 | ARTI-0003 | ARTI-0005 | 179 |
| ARTI-0007 | ARTI-0004 | ARTI-0004 | 4 |
| ARTI-0008 | ARTI-0004 | ARTI-0005 | 356 |

**t_directive_only_governs_artifact_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0007 | Encoding 01 |
| ARTI-0002 | ARTI-0001 | ARTI-0002 | Enforcement 02 |
| ARTI-0003 | ARTI-0001 | ARTI-0008 | nightly summary |
| ARTI-0004 | ARTI-0001 | ARTI-0009 | en |
| ARTI-0005 | ARTI-0001 | ARTI-0006 | Scope 05 |
| ARTI-0006 | ARTI-0002 | ARTI-0007 | Encoding 06 |
| ARTI-0007 | ARTI-0002 | ARTI-0002 | Enforcement 07 |
| ARTI-0008 | ARTI-0002 | ARTI-0008 | pre-release note |

**t_directive_supersedes_directive**

| id | directive |
| --- | --- |
| DIRE-0001 | HIPAA Data Privacy Rule |
| DIRE-0002 | HIPAA Data Privacy Rule |
| DIRE-0003 | NIST Cybersecurity Framework |
| DIRE-0004 | FAIR Data Principles Directive |
| DIRE-0005 | CMMC Level 3 |
| DIRE-0006 | NIST Cybersecurity Framework |
| DIRE-0007 | GLP Chapter 4 |
| DIRE-0008 | NIST Cybersecurity Framework |

To standardize how compliance metadata is captured across heterogeneous regulatory domains, the system employs a typed attribute registry. Each attr, paired with its corresponding attr_type, enforces strict data discipline while preserving semantic clarity. Temporal markers are constrained to xsd:date, enforcement posture to xsd:string, binary compliance flags to xsd:boolean, and quantitative thresholds to xsd:integer. This typological rigor prevents schema drift when ingesting requirements from disparate frameworks such as SOC 2 Type II Standard, ICH Q10, or FedRAMP Moderate. By decoupling attribute definitions from their runtime values, the architecture accommodates evolving regulatory taxonomies without requiring structural migrations, allowing auditors to query compliance posture through a consistent, type-safe interface.

Temporal governance and enforcement posture form the operational core of regulatory compliance tracking. The effectivedate field establishes the precise moment a directive or artifact relationship becomes active, anchoring policy transitions to auditable chronologies. For instance, the ISO 27001 Security Policy relationship (GOVE-0004) carries an effective_date of 2023-10-25, while the HIPAA Data Privacy Rule supersession (DIRE-0002) took effect on 2024-01-18. These dates are not administrative footnotes; they dictate the temporal validity of compliance obligations and determine which regulatory version governs a given audit window. Coupled with the enforcement field—which uniformly registers mandatory posture across foundational mappings like PCI DSS v4.0 and ICH Q10, or specifies granular classifications such as Enforcement 02—these fields collectively define the binding nature and operational timeline of each regulatory requirement.

**t_directive_only_governs**

| id | directive | related | effective_date | enforcement |
| --- | --- | --- | --- | --- |
| GOVE-0001 | PCI DSS v4.0 Compliance | DIRE-0002 | 2023-05-14 | mandatory |
| GOVE-0002 | SOC 2 Type II Standard | DIRE-0008 | 2023-04-09 | mandatory |
| GOVE-0003 | ICH Q10 | DIRE-0002 | 2024-03-28 | mandatory |
| GOVE-0004 | ISO 27001 Security Policy | DIRE-0005 | 2023-10-25 | mandatory |
| GOVE-0005 | FedRAMP Moderate | DIRE-0004 | 2023-11-19 | advisory |
| GOVE-0006 | PCI DSS v4.0 | DIRE-0001 | 2023-08-29 | advisory |
| GOVE-0007 | ISO 27001:2022 | DIRE-0003 | 2025-01-19 | advisory |
| GOVE-0008 | GDPR Compliance Mandate | DIRE-0008 | 2024-12-25 | advisory |

The actual instantiation of compliance attributes resides in a polymorphic value store, where the misc column accommodates heterogeneous data types without compromising referential integrity. Boolean enforcement flags, such as true or false, attach directly to entity-attr pairs to indicate binary compliance states. Quantitative metrics—ranging from a priority score of 5 to a risk index of 959—are stored as integers, while textual descriptors like nightly summary or en capture procedural and localization metadata. Date instances such as 2025-04-15 or 2024-03-21 populate temporal fields, and string values like Encoding 01 preserve formatting specifications. This design allows the system to model complex, multi-dimensional compliance attributes while maintaining a normalized relational structure, ensuring that every value remains traceable to its originating entity and attribute definition.

**t_directive_supersedes_directive_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DIRE-0001 | DIRE-0001 | DIRE-0003 | true |
| DIRE-0002 | DIRE-0002 | DIRE-0003 | false |
| DIRE-0003 | DIRE-0003 | DIRE-0003 | true |
| DIRE-0004 | DIRE-0004 | DIRE-0003 | false |
| DIRE-0005 | DIRE-0005 | DIRE-0003 | false |
| DIRE-0006 | DIRE-0006 | DIRE-0003 | false |
| DIRE-0007 | DIRE-0007 | DIRE-0003 | false |
| DIRE-0008 | DIRE-0008 | DIRE-0003 | true |

When integrated, these constructs form a cohesive governance substrate capable of managing regulatory supersession, artifact mapping, and attribute-driven compliance tracking. The supersedes relationship, for example, links legacy frameworks like NIST Cybersecurity Framework to updated directives, while the artifact-to-directive mapping ensures that implementation artifacts remain bound to their governing standards. By coupling typed attributes with precise effective dates, mandatory enforcement postures, and a flexible misc value repository, the architecture supports continuous compliance monitoring without rigid schema constraints. Auditors and compliance officers can reconstruct policy lineage, validate temporal applicability, and verify enforcement posture across multi-framework environments, transforming regulatory complexity into a queryable, auditable, and operationally actionable dataset.

**t_directive_only_governs_artifact_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ARTI-0001 | effective_date | xsd:date |
| ARTI-0002 | enforcement | xsd:string |
| ARTI-0003 | mandatory | xsd:boolean |
| ARTI-0004 | priority | xsd:integer |
| ARTI-0005 | review_cycle_days | xsd:integer |
| ARTI-0006 | scope | xsd:string |
| ARTI-0007 | encoding | xsd:string |
| ARTI-0008 | label_text | xsd:string |

**t_directive_only_governs_artifact_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0001 | 2023-09-27 |
| ARTI-0002 | ARTI-0002 | ARTI-0001 | 2025-04-15 |
| ARTI-0003 | ARTI-0003 | ARTI-0001 | 2024-03-21 |
| ARTI-0004 | ARTI-0004 | ARTI-0001 | 2024-02-09 |
| ARTI-0005 | ARTI-0005 | ARTI-0001 | 2023-02-02 |
| ARTI-0006 | ARTI-0006 | ARTI-0001 | 2024-08-24 |
| ARTI-0007 | ARTI-0007 | ARTI-0001 | 2023-05-03 |

**t_directive_supersedes_directive_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| DIRE-0001 | effective_date | xsd:date |
| DIRE-0002 | enforcement | xsd:string |
| DIRE-0003 | mandatory | xsd:boolean |
| DIRE-0004 | priority | xsd:integer |
| DIRE-0005 | review_cycle_days | xsd:integer |
| DIRE-0006 | scope | xsd:string |
| DIRE-0007 | encoding | xsd:string |
| DIRE-0008 | label_text | xsd:string |

**t_directive_supersedes_directive_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DIRE-0001 | DIRE-0001 | DIRE-0001 | 2024-04-11 |
| DIRE-0002 | DIRE-0002 | DIRE-0001 | 2024-01-18 |
| DIRE-0003 | DIRE-0003 | DIRE-0001 | 2023-05-24 |
| DIRE-0004 | DIRE-0004 | DIRE-0001 | 2023-10-24 |
| DIRE-0005 | DIRE-0005 | DIRE-0001 | 2024-12-26 |
| DIRE-0006 | DIRE-0006 | DIRE-0001 | 2025-05-10 |
| DIRE-0007 | DIRE-0007 | DIRE-0001 | 2025-05-06 |
| DIRE-0008 | DIRE-0008 | DIRE-0001 | 2024-01-25 |

**t_directive_supersedes_directive_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DIRE-0001 | DIRE-0001 | DIRE-0004 | 2 |
| DIRE-0002 | DIRE-0001 | DIRE-0005 | 436 |
| DIRE-0003 | DIRE-0002 | DIRE-0004 | 3 |
| DIRE-0004 | DIRE-0002 | DIRE-0005 | 990 |
| DIRE-0005 | DIRE-0003 | DIRE-0004 | 2 |
| DIRE-0006 | DIRE-0003 | DIRE-0005 | 360 |
| DIRE-0007 | DIRE-0004 | DIRE-0004 | 4 |
| DIRE-0008 | DIRE-0004 | DIRE-0005 | 588 |

**t_directive_supersedes_directive_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DIRE-0001 | DIRE-0001 | DIRE-0007 | Encoding 01 |
| DIRE-0002 | DIRE-0001 | DIRE-0002 | Enforcement 02 |
| DIRE-0003 | DIRE-0001 | DIRE-0008 | audit excerpt |
| DIRE-0004 | DIRE-0001 | DIRE-0009 | en |
| DIRE-0005 | DIRE-0001 | DIRE-0006 | Scope 05 |
| DIRE-0006 | DIRE-0002 | DIRE-0007 | Encoding 06 |
| DIRE-0007 | DIRE-0002 | DIRE-0002 | Enforcement 07 |
| DIRE-0008 | DIRE-0002 | DIRE-0008 | nightly summary |