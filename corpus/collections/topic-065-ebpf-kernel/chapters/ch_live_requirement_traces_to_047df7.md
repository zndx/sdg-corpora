---
chapter_id: ch_live_requirement_traces_to_047df7
topic_id: 65
family: 03_directive_governance
cited_terms: ['requirement_traces_to', 'gdpr_data_subject_right', 'syscall_only_in_kernel_subsystem']
model: engine-refine
---

Compliance traceability and data governance frameworks depend on a disciplined separation between the identification of artifacts and the characterization of their properties. Every requirement, right, or subsystem entry is assigned a unique identifier—TRAC-0001 through TRAC-0004 for traceability records, RIGH-0001 through RIGH-0004 for GDPR data subject rights, and SUBS-0001 through SUBS-0004 for kernel subsystem classifications—ensuring that each entity can be referenced unambiguously across the entire dataset. These identifiers serve as the primary keys for all relational joins, anchoring the linkage between requirements and the standards they satisfy, between data subject rights and the requirements they grant, and between system calls and the kernel subsystems in which they operate exclusively.

**t_gdpr_data_subject_right**

| id | gdpr | grants_data_subject_right |
| --- | --- | --- |
| RIGH-0001 | Right to Withdraw Consent | TRAC-0006 |
| RIGH-0002 | California CCPA | TRAC-0001 |
| RIGH-0003 | Right to Object | TRAC-0001 |
| RIGH-0004 | Right to Lodge Complaint | TRAC-0006 |
| RIGH-0005 | Right to Automated Decisions | TRAC-0003 |
| RIGH-0006 | Right to Withdraw Consent | TRAC-0002 |

**t_gdpr_data_subject_right_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RIGH-0001 | RIGH-0001 | RIGH-0003 | true |
| RIGH-0002 | RIGH-0002 | RIGH-0003 | true |
| RIGH-0003 | RIGH-0003 | RIGH-0003 | false |
| RIGH-0004 | RIGH-0004 | RIGH-0003 | true |
| RIGH-0005 | RIGH-0005 | RIGH-0003 | true |
| RIGH-0006 | RIGH-0006 | RIGH-0003 | true |

**t_gdpr_data_subject_right_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RIGH-0001 | RIGH-0001 | RIGH-0004 | 5 |
| RIGH-0002 | RIGH-0001 | RIGH-0005 | 122 |
| RIGH-0003 | RIGH-0002 | RIGH-0004 | 3 |
| RIGH-0004 | RIGH-0002 | RIGH-0005 | 392 |
| RIGH-0005 | RIGH-0003 | RIGH-0004 | 1 |
| RIGH-0006 | RIGH-0003 | RIGH-0005 | 97 |
| RIGH-0007 | RIGH-0004 | RIGH-0004 | 3 |
| RIGH-0008 | RIGH-0004 | RIGH-0005 | 865 |

**t_gdpr_data_subject_right_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RIGH-0001 | RIGH-0001 | RIGH-0007 | Encoding 01 |
| RIGH-0002 | RIGH-0001 | RIGH-0002 | Enforcement 02 |
| RIGH-0003 | RIGH-0001 | RIGH-0008 | change rationale |
| RIGH-0004 | RIGH-0001 | RIGH-0009 | ja |
| RIGH-0005 | RIGH-0001 | RIGH-0006 | Scope 05 |
| RIGH-0006 | RIGH-0002 | RIGH-0007 | Encoding 06 |
| RIGH-0007 | RIGH-0002 | RIGH-0002 | Enforcement 07 |
| RIGH-0008 | RIGH-0002 | RIGH-0008 | change rationale |

The attribute model decouples property definitions from their concrete values, enabling a type-safe, extensible schema. Attribute names such as effective_date, enforcement, mandatory, and priority are declared once with their corresponding types—xsd:date, xsd:string, xsd:boolean, and xsd:integer respectively—and then instantiated across entities through dedicated value tables. A boolean attribute like mandatory yields values of true or false depending on the entity, while an integer attribute such as priority accommodates values ranging from 3 to 392. Date attributes record effective dates spanning from 2023-03-03 to 2025-05-21, and string attributes capture descriptive content like "Encoding 01" or "change rationale." This separation ensures that schema evolution—adding a new attribute or changing a type—does not require restructuring existing entity records.

Relationships between entities are mediated through junction tables that carry not only the subject and target identifiers but also a role qualifier that describes the nature of the linkage. In the requirement traceability matrix, requirement TRAC-0001 (the Network Segmentation Rule) traces to requirement TRAC-0004 (a second instance of Privacy Compliance Requirement) with the role of owner, while TRAC-0004 itself traces to TRAC-0004 in a self-referential loop under the role of reviewer. The same pair appears again with the role of contributor, demonstrating that a single subject-target pair can support multiple distinct relationships. Similarly, GDPR rights such as the Right to Withdraw Consent and the Right to Lodge Complaint both grant the requirement TRAC-0001, while the California CCPA and Right to Object grant TRAC-0006, establishing a many-to-many mapping between regulatory rights and underlying compliance requirements.

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

Temporal provenance is captured through issued_date fields that record when entries were created or last modified. Kernel subsystem records carry dates such as 2024-01-17 for the read syscall in the namespaces subsystem, 2023-04-09 for the write syscall in inotify, and 2024-04-20 for the execve syscall in the vDSO subsystem, providing an audit trail of when each classification was established. These dates, combined with the role and identifier fields, enable reconstruction of the full provenance chain for any compliance artifact.

**t_syscall_only_in_kernel_subsystem**

| id | syscall | in_syscall_subsystem | code | issued_date |
| --- | --- | --- | --- | --- |
| SUBS-0001 | read | namespaces | C-07 | 2024-01-17 |
| SUBS-0002 | write | inotify | B-12 | 2023-04-09 |
| SUBS-0003 | openat | fsnotify | E-21 | 2024-01-29 |
| SUBS-0004 | execve | vDSO | E-21 | 2024-04-20 |
| SUBS-0005 | read | inotify | C-07 | 2025-01-29 |

Supplementary metadata is stored in a misc column that accommodates heterogeneous values without imposing a rigid type structure. Code identifiers such as C-07, B-12, and E-21 appear alongside subsystem entries, while string values like "ja" and "Enforcement 02" populate miscellaneous fields in the GDPR rights tables. This design preserves flexibility for values that do not fit the typed attribute model while maintaining the integrity of structured data through the dedicated attr and attr_type columns.

**t_gdpr_data_subject_right_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| RIGH-0001 | effective_date | xsd:date |
| RIGH-0002 | enforcement | xsd:string |
| RIGH-0003 | mandatory | xsd:boolean |
| RIGH-0004 | priority | xsd:integer |
| RIGH-0005 | review_cycle_days | xsd:integer |
| RIGH-0006 | scope | xsd:string |
| RIGH-0007 | encoding | xsd:string |
| RIGH-0008 | label_text | xsd:string |

**t_gdpr_data_subject_right_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RIGH-0001 | RIGH-0001 | RIGH-0001 | 2025-05-21 |
| RIGH-0002 | RIGH-0002 | RIGH-0001 | 2023-03-20 |
| RIGH-0003 | RIGH-0003 | RIGH-0001 | 2023-03-03 |
| RIGH-0004 | RIGH-0004 | RIGH-0001 | 2025-02-10 |
| RIGH-0005 | RIGH-0005 | RIGH-0001 | 2023-06-13 |
| RIGH-0006 | RIGH-0006 | RIGH-0001 | 2024-07-25 |