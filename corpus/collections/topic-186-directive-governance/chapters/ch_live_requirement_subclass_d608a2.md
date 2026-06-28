---
chapter_id: ch_live_requirement_subclass_d608a2
topic_id: 186
family: 03_directive_governance
cited_terms: ['requirement_subclass', 'requirement_traces_to', 'requirement_under_standard']
model: engine-refine
---

Requirements in a compliance framework are anchored by unique identifiers such as REQU-0001 through REQU-0004, each denoting a distinct policy artifact like the Event Deduplication Protocol or the Data Retention Policy. These identifiers serve as the primary keys for all downstream references, ensuring that every trace, attribute assignment, and cross-reference resolves unambiguously. Each requirement carries a scope—local, team, or global—that determines its organizational reach, and a language designation such as de, es, fr, or ja that governs its authoritative textual form. For instance, the Metadata Tagging Mandate (REQU-0004) operates at the global scope and is authored in Japanese, while the Event Deduplication Protocol (REQU-0001) is scoped to local deployment and expressed in German. The scope dimension is critical for governance audits, as it establishes the boundary conditions under which a requirement's obligations are enforceable.

**t_requirement_subclass**

| id | requirement | specifies | scope | language |
| --- | --- | --- | --- | --- |
| REQU-0001 | Event Deduplication Protocol | SOC2 Compliance Framework | local | de |
| REQU-0002 | Data Retention Policy | Backup Storage Volume | team | es |
| REQU-0003 | Data Retention Policy | SOC2 Compliance Framework | local | fr |
| REQU-0004 | Metadata Tagging Mandate | Real Time Alerting Engine | global | ja |

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

Standards impose typed attributes on requirements to capture structured metadata beyond the nominal policy text. An attribute—identified by a name such as effective_date, enforcement, mandatory, or priority—is paired with an attribute type that constrains its value domain: xsd:date for calendar dates, xsd:string for free-form text, xsd:boolean for binary flags, and xsd:integer for numeric thresholds. The attribute schema itself is catalogued in a dedicated definition table, where each entry (STAN-0001 through STAN-0004) declares one attr–attr_type pair. This separation of attribute definition from attribute value enables schema evolution: new attribute types can be introduced without altering the value storage layer, and validators can enforce type correctness at ingestion time.

Attribute values are stored in entity-specific value tables partitioned by type, where each row binds an entity identifier to an attribute and a concrete value. The entity—such as STAN-0001 or STAN-0002—represents a requirement-standard pairing, for example the Minimum sampling rate requirement under GDPR or the Quality threshold requirement under NIST SP 800-53. Boolean values like true or false record whether a mandatory flag is active; date values such as 2024-02-08 or 2023-09-30 capture effective dates; integer values like 3, 224, 4, or 622 encode numeric thresholds; and miscellaneous varchar values—including Encoding 01, Enforcement 02, audit excerpt, and de—hold free-form annotations. This value-per-type partitioning ensures that type-specific validation, indexing, and serialization logic remains isolated and efficient.

**t_requirement_under_standard**

| id | requirement | under_standard |
| --- | --- | --- |
| STAN-0001 | Minimum sampling rate | GDPR |
| STAN-0002 | Quality threshold | NIST SP 800-53 |
| STAN-0003 | Provenance tracking | IEEE 802.11 |
| STAN-0004 | Access control policy | HIPAA |
| STAN-0005 | Provenance tracking | IEEE 802.11 |
| STAN-0006 | Access control policy | FAIR Principles |

**t_requirement_under_standard_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| STAN-0001 | effective_date | xsd:date |
| STAN-0002 | enforcement | xsd:string |
| STAN-0003 | mandatory | xsd:boolean |
| STAN-0004 | priority | xsd:integer |
| STAN-0005 | review_cycle_days | xsd:integer |
| STAN-0006 | scope | xsd:string |
| STAN-0007 | encoding | xsd:string |
| STAN-0008 | label_text | xsd:string |

**t_requirement_under_standard_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| STAN-0001 | STAN-0001 | STAN-0003 | true |
| STAN-0002 | STAN-0002 | STAN-0003 | true |
| STAN-0003 | STAN-0003 | STAN-0003 | true |
| STAN-0004 | STAN-0004 | STAN-0003 | false |
| STAN-0005 | STAN-0005 | STAN-0003 | false |
| STAN-0006 | STAN-0006 | STAN-0003 | true |

**t_requirement_under_standard_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| STAN-0001 | STAN-0001 | STAN-0001 | 2024-02-08 |
| STAN-0002 | STAN-0002 | STAN-0001 | 2024-03-15 |
| STAN-0003 | STAN-0003 | STAN-0001 | 2024-09-13 |
| STAN-0004 | STAN-0004 | STAN-0001 | 2023-09-30 |
| STAN-0005 | STAN-0005 | STAN-0001 | 2025-02-13 |
| STAN-0006 | STAN-0006 | STAN-0001 | 2025-01-10 |

**t_requirement_under_standard_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| STAN-0001 | STAN-0001 | STAN-0004 | 3 |
| STAN-0002 | STAN-0001 | STAN-0005 | 224 |
| STAN-0003 | STAN-0002 | STAN-0004 | 4 |
| STAN-0004 | STAN-0002 | STAN-0005 | 622 |
| STAN-0005 | STAN-0003 | STAN-0004 | 1 |
| STAN-0006 | STAN-0003 | STAN-0005 | 177 |
| STAN-0007 | STAN-0004 | STAN-0004 | 5 |
| STAN-0008 | STAN-0004 | STAN-0005 | 817 |

**t_requirement_under_standard_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| STAN-0001 | STAN-0001 | STAN-0007 | Encoding 01 |
| STAN-0002 | STAN-0001 | STAN-0002 | Enforcement 02 |
| STAN-0003 | STAN-0001 | STAN-0008 | audit excerpt |
| STAN-0004 | STAN-0001 | STAN-0009 | de |
| STAN-0005 | STAN-0001 | STAN-0006 | Scope 05 |
| STAN-0006 | STAN-0002 | STAN-0007 | Encoding 06 |
| STAN-0007 | STAN-0002 | STAN-0002 | Enforcement 07 |
| STAN-0008 | STAN-0002 | STAN-0008 | nightly summary |

Trace relationships connect requirements to other requirements or standards through subject–target pairs mediated by a role. A trace record (TRAC-0001 through TRAC-0004) identifies a source requirement—such as the Network Segmentation Rule or the Privacy Compliance Requirement—and links it to a target artifact like the HIPAA Security Rule, the Risk Assessment Matrix, the Compliance Audit Checklist, or the ISO 27001 Control. The join table between traces and their targets assigns a role—owner, reviewer, or contributor—that describes the nature of the relationship. For example, the Network Segmentation Rule may own its trace to the HIPAA Security Rule, while the Privacy Compliance Requirement assumes both the reviewer and contributor roles on its trace to the ISO 27001 Control. This role-annotated graph enables auditors to reconstruct the full lineage of a requirement, identifying which standards it derives from, which controls it satisfies, and which parties are accountable for each link.

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