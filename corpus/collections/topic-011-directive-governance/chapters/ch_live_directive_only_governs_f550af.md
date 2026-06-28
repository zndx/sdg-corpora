---
chapter_id: ch_live_directive_only_governs_f550af
topic_id: 11
family: 01_foundation
cited_terms: ['directive_only_governs', 'requirement_basic', 'requirement_equiv_specifies_target']
model: engine-refine
---

Compliance architectures require a disciplined vocabulary for expressing how regulatory obligations bind to technical controls, and the data model achieves this through a layered distinction between identifiers, attributes, and their typed values. Each entity carries a stable identifier—GOVE-0001 through GOVE-0004 for directives, REQU-0001 through REQU-0004 for requirements, and TARG-0001 through TARG-0007 for targets—that serves as the immutable anchor across all relationships. Directives such as CCPA Section 1798.100, ICH Q10, FDA 21 CFR Part 11, and PCI DSS v4.0 are each assigned a unique identifier and linked to one or more requirements; for instance, GOVE-0001 (CCPA Section 1798.100) references REQU-0002, while GOVE-0004 (PCI DSS v4.0) maps to REQU-0005. The effective_date and enforcement columns on the directive table establish temporal and regulatory force: every recorded directive carries an enforcement value of mandatory, with effective dates ranging from 2023-04-09 (ICH Q10) through 2024-03-28 (FDA 21 CFR Part 11), ensuring that compliance auditors can reconstruct the chronological applicability of each obligation.

**t_directive_only_governs**

| id | directive | related | effective_date | enforcement |
| --- | --- | --- | --- | --- |
| GOVE-0001 | CCPA Section 1798.100 | REQU-0002 | 2023-05-14 | mandatory |
| GOVE-0002 | ICH Q10 | REQU-0008 | 2023-04-09 | mandatory |
| GOVE-0003 | FDA 21 CFR Part 11 | REQU-0002 | 2024-03-28 | mandatory |
| GOVE-0004 | PCI DSS v4.0 | REQU-0005 | 2023-10-25 | mandatory |
| GOVE-0005 | HIPAA Privacy Rule | REQU-0004 | 2023-11-19 | advisory |
| GOVE-0006 | PCI DSS v4.0 | REQU-0001 | 2023-08-29 | advisory |
| GOVE-0007 | HIPAA Privacy Rule | REQU-0003 | 2025-01-19 | advisory |
| GOVE-0008 | HIPAA Privacy Rule | REQU-0008 | 2024-12-25 | advisory |

**t_requirement_basic**

| id | requirement |
| --- | --- |
| REQU-0001 | Privacy Constraint |
| REQU-0002 | Encryption Standard |
| REQU-0003 | Encryption Standard |
| REQU-0004 | Privacy Constraint |
| REQU-0005 | Latency Threshold |
| REQU-0006 | Performance SLA |
| REQU-0007 | Encryption Standard |
| REQU-0008 | Data Quality Check |

**t_requirement_basic_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| REQU-0001 | effective_date | xsd:date |
| REQU-0002 | enforcement | xsd:string |
| REQU-0003 | mandatory | xsd:boolean |
| REQU-0004 | priority | xsd:integer |
| REQU-0005 | review_cycle_days | xsd:integer |
| REQU-0006 | scope | xsd:string |
| REQU-0007 | encoding | xsd:string |
| REQU-0008 | label_text | xsd:string |

**t_requirement_basic_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| REQU-0001 | REQU-0001 | REQU-0001 | 2025-06-11 |
| REQU-0002 | REQU-0002 | REQU-0001 | 2024-12-28 |
| REQU-0003 | REQU-0003 | REQU-0001 | 2023-09-17 |
| REQU-0004 | REQU-0004 | REQU-0001 | 2024-08-31 |
| REQU-0005 | REQU-0005 | REQU-0001 | 2024-05-25 |
| REQU-0006 | REQU-0006 | REQU-0001 | 2024-05-27 |
| REQU-0007 | REQU-0007 | REQU-0001 | 2023-07-24 |
| REQU-0008 | REQU-0008 | REQU-0001 | 2023-09-16 |

**t_requirement_basic_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| REQU-0001 | REQU-0001 | REQU-0004 | 5 |
| REQU-0002 | REQU-0001 | REQU-0005 | 962 |
| REQU-0003 | REQU-0002 | REQU-0004 | 5 |
| REQU-0004 | REQU-0002 | REQU-0005 | 675 |
| REQU-0005 | REQU-0003 | REQU-0004 | 5 |
| REQU-0006 | REQU-0003 | REQU-0005 | 160 |
| REQU-0007 | REQU-0004 | REQU-0004 | 5 |
| REQU-0008 | REQU-0004 | REQU-0005 | 57 |

**t_requirement_basic_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| REQU-0001 | REQU-0001 | REQU-0007 | Encoding 01 |
| REQU-0002 | REQU-0001 | REQU-0002 | Enforcement 02 |
| REQU-0003 | REQU-0001 | REQU-0008 | calibration record |
| REQU-0004 | REQU-0001 | REQU-0009 | en |
| REQU-0005 | REQU-0001 | REQU-0006 | Scope 05 |
| REQU-0006 | REQU-0002 | REQU-0007 | Encoding 06 |
| REQU-0007 | REQU-0002 | REQU-0002 | Enforcement 07 |
| REQU-0008 | REQU-0002 | REQU-0008 | calibration record |

**t_requirement_equiv_specifies_target**

| id | requirement |
| --- | --- |
| TARG-0001 | LatencyThreshold |
| TARG-0002 | DataLineageTrace |
| TARG-0003 | LatencyThreshold |
| TARG-0004 | AuditLogFormat |
| TARG-0005 | TelemetrySamplingRate |
| TARG-0006 | LatencyThreshold |

**t_requirement_equiv_specifies_target_specifies**

| id | specifies |
| --- | --- |
| TARG-0001 | KafkaProtocol |
| TARG-0002 | GDPRArticle |
| TARG-0003 | KafkaProtocol |
| TARG-0004 | JSONSchema |
| TARG-0005 | JSONSchema |
| TARG-0006 | OpenTelemetry |
| TARG-0007 | JSONSchema |

Attributes provide the mechanism by which requirements acquire additional properties beyond their core definition. The attribute schema—captured in the attribute registry—declares names such as effective_date, enforcement, mandatory, and priority, each bound to an XSD type: xsd:date, xsd:string, xsd:boolean, or xsd:integer. This type discipline is enforced through a value partitioning strategy in which boolean, date, integer, and string values are stored in separate tables, each keyed by the entity identifier and the attribute identifier. A requirement such as REQU-0001 (Privacy Constraint) may carry an effective_date of 2025-06-11, a mandatory flag set to true, and a priority value of 5, while REQU-0002 (Encryption Standard) carries an effective_date of 2024-12-28, a mandatory flag of false, and a priority of 5—demonstrating that the same attribute schema applies uniformly across entities while permitting heterogeneous values.

**t_requirement_basic_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| REQU-0001 | REQU-0001 | REQU-0003 | true |
| REQU-0002 | REQU-0002 | REQU-0003 | false |
| REQU-0003 | REQU-0003 | REQU-0003 | false |
| REQU-0004 | REQU-0004 | REQU-0003 | false |
| REQU-0005 | REQU-0005 | REQU-0003 | true |
| REQU-0006 | REQU-0006 | REQU-0003 | false |
| REQU-0007 | REQU-0007 | REQU-0003 | false |
| REQU-0008 | REQU-0008 | REQU-0003 | false |

The value tables also accommodate miscellaneous string properties that do not fit the typed categories. Values such as "Encoding 01", "Enforcement 02", "calibration record", and "en" are stored alongside their entity and attribute references, enabling free-form annotations without compromising the type safety of structured attributes. This separation of concerns—typed values in dedicated tables, free-form strings in a varchar store—allows the system to support both machine-checkable constraints and human-readable metadata within a single coherent model.

Relationships between requirements and targets are expressed through a subject-target-role triad that captures not only which entities are connected but the nature of the connection. A target requirement such as LatencyThreshold (TARG-0001) or DataLineageTrace (TARG-0002) may specify a protocol or standard—KafkaProtocol, GDPRArticle, JSONSchema—through a specifies relationship, while the same target may apply to an infrastructure element such as CloudStorage, EUDataCenter, or DataLake through an applies_to relationship. The role column distinguishes the function of each link: reviewer, owner, contributor, and observer appear across both relationship types, indicating that a single entity can occupy different positions depending on context. For example, TARG-0004 (AuditLogFormat) assumes the role of reviewer when linked to TARG-0002, but shifts to owner when linked to TARG-0004, reflecting the multi-faceted governance of audit-related controls.

**t_requirement_equiv_specifies_target__specifies**

| id | requirement_id | specifies_id | role |
| --- | --- | --- | --- |
| TARG-0001 | TARG-0004 | TARG-0002 | reviewer |
| TARG-0002 | TARG-0002 | TARG-0002 | owner |
| TARG-0003 | TARG-0004 | TARG-0007 | contributor |
| TARG-0004 | TARG-0002 | TARG-0004 | owner |
| TARG-0005 | TARG-0002 | TARG-0004 | observer |
| TARG-0006 | TARG-0006 | TARG-0007 | contributor |
| TARG-0007 | TARG-0005 | TARG-0006 | reviewer |
| TARG-0008 | TARG-0001 | TARG-0007 | reviewer |

**t_requirement_equiv_specifies_target_applies_to**

| id | applies_to |
| --- | --- |
| TARG-0001 | CloudStorage |
| TARG-0002 | EUDataCenter |
| TARG-0003 | DataLake |
| TARG-0004 | DataLake |
| TARG-0005 | EUDataCenter |
| TARG-0006 | CustomerTable |

Cardinality notes attached to applies_to relationships provide additional semantic context for how many targets a requirement may govern. Entries such as Cardinality Note 01 through Cardinality Note 04 accompany the role and entity references, enabling auditors to distinguish between one-to-one mappings and one-to-many deployments. The combination of subject, target, role, and cardinality note forms a complete relationship record that supports traceability from a directive like PCI DSS v4.0 through its associated requirements, to the technical targets and infrastructure elements where those requirements are enforced. This layered model—identifiers anchoring entities, attributes typed and partitioned by value domain, and relationships enriched with roles and cardinality—provides the structural rigor necessary for compliance verification across heterogeneous regulatory regimes.

**t_requirement_equiv_specifies_target__applies_to**

| id | requirement_id | applies_to_id | role | cardinality_note |
| --- | --- | --- | --- | --- |
| TARG-0001 | TARG-0001 | TARG-0001 | contributor | Cardinality Note 01 |
| TARG-0002 | TARG-0005 | TARG-0002 | contributor | Cardinality Note 02 |
| TARG-0003 | TARG-0006 | TARG-0003 | observer | Cardinality Note 03 |
| TARG-0004 | TARG-0002 | TARG-0004 | reviewer | Cardinality Note 04 |
| TARG-0005 | TARG-0001 | TARG-0006 | reviewer | Cardinality Note 05 |
| TARG-0006 | TARG-0004 | TARG-0003 | observer | Cardinality Note 06 |
| TARG-0007 | TARG-0003 | TARG-0001 | observer | Cardinality Note 07 |
| TARG-0008 | TARG-0005 | TARG-0002 | reviewer | Cardinality Note 08 |