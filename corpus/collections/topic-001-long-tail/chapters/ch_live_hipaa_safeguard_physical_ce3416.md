---
chapter_id: ch_live_hipaa_safeguard_physical_ce3416
topic_id: 1
family: 07_long_tail
cited_terms: ['hipaa_safeguard_physical', 'hipaa_safeguard_technical', 'histogram_metric_subclass']
model: engine-refine
---

HIPAA safeguard governance rests upon a disciplined taxonomy of identifiers, attributes, and typed values that together encode compliance obligations with machine-enforceable precision. Physical safeguards are distinguished by identifiers such as PHYS-0001 through PHYS-0004, each carrying a descriptive label—Integrity Controls, CCTV Monitoring, Business Associate Rule—that situates the safeguard within a regulatory domain. These identifiers serve as the immutable anchor for every downstream relationship: a safeguard is never referenced by name, but always by its key, ensuring referential integrity across the model. Technical safeguards follow the same convention under TECH-0001 through TECH-0004, with labels such as Cabinet Lockdown Procedure and Media Disposal Protocol. The separation between a safeguard's high-level description and its concrete implementation—Lockdown Switch, Data Encryption, Keycard Reader, Access Control Log—reflects a deliberate architectural choice: the safeguard catalog defines what must be done, while the implementation layer specifies how it is realized.

**t_hipaa_safeguard_physical**

| id | hipaa |
| --- | --- |
| PHYS-0001 | Integrity Controls |
| PHYS-0002 | CCTV Monitoring |
| PHYS-0003 | Business Associate Rule |
| PHYS-0004 | CCTV Monitoring |
| PHYS-0005 | Audit Controls |
| PHYS-0006 | Audit Controls |

**t_hipaa_safeguard_physical_hipaa_safeguard**

| id | hipaa_safeguard |
| --- | --- |
| PHYS-0001 | Lockdown Switch |
| PHYS-0002 | Data Encryption |
| PHYS-0003 | Workstation Security Policy |
| PHYS-0004 | Visitor Escort Policy |
| PHYS-0005 | Intrusion Detection |
| PHYS-0006 | Minimum Necessary Standard |
| PHYS-0007 | Transaction Rule |
| PHYS-0008 | Data Backup |

**t_hipaa_safeguard_technical**

| id | hipaa | hipaa_safeguard |
| --- | --- | --- |
| TECH-0001 | Cabinet Lockdown Procedure | Keycard Reader |
| TECH-0002 | Media Disposal Protocol | Security Camera Array |
| TECH-0003 | Security Rule | Access Control Log |
| TECH-0004 | Power Redundancy Plan | Enforcement Rule |
| TECH-0005 | Power Redundancy Plan | Breach Notification Rule |
| TECH-0006 | Visitor Escort Policy | Security Camera Array |

**t_hipaa_safeguard_technical_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| TECH-0001 | effective_date | xsd:date |
| TECH-0002 | enforcement | xsd:string |
| TECH-0003 | mandatory | xsd:boolean |
| TECH-0004 | priority | xsd:integer |
| TECH-0005 | review_cycle_days | xsd:integer |
| TECH-0006 | scope | xsd:string |
| TECH-0007 | encoding | xsd:string |
| TECH-0008 | label_text | xsd:string |

**t_hipaa_safeguard_technical_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TECH-0001 | TECH-0001 | TECH-0003 | true |
| TECH-0002 | TECH-0002 | TECH-0003 | true |
| TECH-0003 | TECH-0003 | TECH-0003 | false |
| TECH-0004 | TECH-0004 | TECH-0003 | false |
| TECH-0005 | TECH-0005 | TECH-0003 | true |
| TECH-0006 | TECH-0006 | TECH-0003 | true |

**t_hipaa_safeguard_technical_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TECH-0001 | TECH-0001 | TECH-0001 | 2025-01-15 |
| TECH-0002 | TECH-0002 | TECH-0001 | 2025-02-09 |
| TECH-0003 | TECH-0003 | TECH-0001 | 2023-08-04 |
| TECH-0004 | TECH-0004 | TECH-0001 | 2024-09-26 |
| TECH-0005 | TECH-0005 | TECH-0001 | 2025-05-30 |
| TECH-0006 | TECH-0006 | TECH-0001 | 2024-11-22 |

**t_hipaa_safeguard_technical_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TECH-0001 | TECH-0001 | TECH-0004 | 2 |
| TECH-0002 | TECH-0001 | TECH-0005 | 620 |
| TECH-0003 | TECH-0002 | TECH-0004 | 3 |
| TECH-0004 | TECH-0002 | TECH-0005 | 784 |
| TECH-0005 | TECH-0003 | TECH-0004 | 3 |
| TECH-0006 | TECH-0003 | TECH-0005 | 568 |
| TECH-0007 | TECH-0004 | TECH-0004 | 1 |
| TECH-0008 | TECH-0004 | TECH-0005 | 831 |

**t_hipaa_safeguard_technical_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TECH-0001 | TECH-0001 | TECH-0007 | Encoding 01 |
| TECH-0002 | TECH-0001 | TECH-0002 | Enforcement 02 |
| TECH-0003 | TECH-0001 | TECH-0008 | change rationale |
| TECH-0004 | TECH-0001 | TECH-0009 | fr |
| TECH-0005 | TECH-0001 | TECH-0006 | Scope 05 |
| TECH-0006 | TECH-0002 | TECH-0007 | Encoding 06 |
| TECH-0007 | TECH-0002 | TECH-0002 | Enforcement 07 |
| TECH-0008 | TECH-0002 | TECH-0008 | intake form |

The attribute system provides the extensible mechanism by which safeguards acquire additional metadata beyond their core identity. Technical safeguards carry attributes such as effective_date, enforcement, mandatory, and priority, each declared with a strict type—xsd:date, xsd:string, xsd:boolean, xsd:integer—that governs the shape of permissible values. This type discipline is enforced through a family of value tables partitioned by type: boolean values like true and false populate the boolean store, date values such as 2025-01-15 and 2023-08-04 reside in the date store, and integer values including 2, 620, 3, and 784 are stored separately from string values like Encoding 01, change rationale, and fr. The entity column in each value table links a concrete safeguard instance to its attribute, while the attr_id column identifies which attribute is being assigned. This normalization—splitting values by type rather than storing them in a single heterogeneous column—preserves type safety and enables efficient range queries on numeric and temporal attributes without sacrificing the flexibility to attach arbitrary metadata to any safeguard.

Relationships between safeguards are mediated through a junction table that encodes not only which safeguards are connected but the nature of that connection. The role column—owner, reviewer, observer—distinguishes the subject from the target: PHYS-0006 is the subject (hipaa_id) linked to PHYS-0002 as the target (hipaa_safeguard_id) under the role of owner, while PHYS-0001 is the subject linked to PHYS-0008 as the target under the same role. This triad of subject, target, and role forms a directed relationship graph that captures accountability and dependency without conflating the two directions of influence. A safeguard may simultaneously appear as a subject in one relationship and a target in another, enabling complex dependency chains that mirror real-world compliance workflows where one control's effectiveness depends on another's implementation.

**t_hipaa_safeguard_physical__hipaa_safeguard**

| id | hipaa_id | hipaa_safeguard_id | role |
| --- | --- | --- | --- |
| PHYS-0001 | PHYS-0006 | PHYS-0002 | owner |
| PHYS-0002 | PHYS-0004 | PHYS-0005 | reviewer |
| PHYS-0003 | PHYS-0002 | PHYS-0008 | observer |
| PHYS-0004 | PHYS-0001 | PHYS-0008 | owner |
| PHYS-0005 | PHYS-0004 | PHYS-0003 | observer |
| PHYS-0006 | PHYS-0006 | PHYS-0004 | owner |
| PHYS-0007 | PHYS-0001 | PHYS-0001 | reviewer |
| PHYS-0008 | PHYS-0002 | PHYS-0008 | contributor |

Metrics and their classification form a parallel dimension of the model, captured in a fact-dimension structure that separates measured quantities from their semantic labels. The fact table records observations with a metric_kind_key that references a dimension table, a size_bytes column storing magnitudes such as 239999637, 652318299, 823666310, and 194252236, and a version column with values 3, 9, 5, and 3 that tracks the provenance of each measurement. The dimension table resolves each metric kind key to a human-readable label—Metric Kind Label 01 through Metric Kind Label 04—and a category—Metric Kind Category 01 through Metric Kind Category 04—that groups related kinds into logical families. This separation of fact from dimension enables independent evolution of measurement definitions and their classifications, while the version column on the fact table provides an audit trail for regulatory review, ensuring that any historical snapshot of compliance posture can be reconstructed from the stored records.

**fact_histogram**

| id | metric_kind_key | size_bytes | version |
| --- | --- | --- | --- |
| METR-0001 | METR-0005 | 239999637 | 3 |
| METR-0002 | METR-0005 | 652318299 | 9 |
| METR-0003 | METR-0005 | 823666310 | 5 |
| METR-0004 | METR-0003 | 194252236 | 3 |
| METR-0005 | METR-0002 | 858858459 | 12 |
| METR-0006 | METR-0006 | 40060793 | 9 |
| METR-0007 | METR-0007 | 831460623 | 10 |
| METR-0008 | METR-0001 | 408712850 | 1 |

**dim_metric_kind**

| id | metric_kind_label | metric_kind_category |
| --- | --- | --- |
| METR-0001 | Metric Kind Label 01 | Metric Kind Category 01 |
| METR-0002 | Metric Kind Label 02 | Metric Kind Category 02 |
| METR-0003 | Metric Kind Label 03 | Metric Kind Category 03 |
| METR-0004 | Metric Kind Label 04 | Metric Kind Category 04 |
| METR-0005 | Metric Kind Label 05 | Metric Kind Category 05 |
| METR-0006 | Metric Kind Label 06 | Metric Kind Category 06 |
| METR-0007 | Metric Kind Label 07 | Metric Kind Category 07 |