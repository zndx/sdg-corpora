---
chapter_id: ch_live_ebpfprogram_basic_9bf9ce
topic_id: 97
family: 04_ebpf_kernel
cited_terms: ['ebpfprogram_basic', 'claim_refuted_by_evidence', 'directive_union_constraint_or_policy']
model: engine-refine
---

The governance of eBPF programs within a regulated infrastructure demands precise tracking of both program identity and operational characteristics. Each eBPF program is assigned a unique identifier—EBPF-0001 through EBPF-0004 serve as canonical keys—and linked to a program key that may differ from its identifier, as seen when EBPF-0002 maps to key EBPF-0003 while EBPF-0001 and EBPF-0003 share the same key value. The dimension table enriches these identifiers with human-readable labels such as "Ebpfprogram Label 01" and categorical classifications like "Ebpfprogram Category 01," enabling analysts to group and filter programs by function rather than by opaque identifier alone. The fact table records the physical footprint of each program in bytes—values ranging from 113,209,263 bytes for EBPF-0003 to 784,335,640 bytes for EBPF-0001—and associates a version number, with versions 9, 11, and 12 appearing across the dataset. This separation of dimension and fact tables permits independent evolution of descriptive metadata and measurable properties, a design choice that supports auditability when program sizes or versions change without altering the program's categorical classification.

**fact_ebpfprogram**

| id | ebpfprogram_key | size_bytes | version |
| --- | --- | --- | --- |
| EBPF-0001 | EBPF-0001 | 784335640 | 12 |
| EBPF-0002 | EBPF-0003 | 641704069 | 9 |
| EBPF-0003 | EBPF-0003 | 113209263 | 11 |
| EBPF-0004 | EBPF-0005 | 161013093 | 12 |
| EBPF-0005 | EBPF-0004 | 352203820 | 12 |
| EBPF-0006 | EBPF-0003 | 167519051 | 1 |

**dim_ebpfprogram**

| id | ebpfprogram_label | ebpfprogram_category |
| --- | --- | --- |
| EBPF-0001 | Ebpfprogram Label 01 | Ebpfprogram Category 01 |
| EBPF-0002 | Ebpfprogram Label 02 | Ebpfprogram Category 02 |
| EBPF-0003 | Ebpfprogram Label 03 | Ebpfprogram Category 03 |
| EBPF-0004 | Ebpfprogram Label 04 | Ebpfprogram Category 04 |
| EBPF-0005 | Ebpfprogram Label 05 | Ebpfprogram Category 05 |
| EBPF-0006 | Ebpfprogram Label 06 | Ebpfprogram Category 06 |
| EBPF-0007 | Ebpfprogram Label 07 | Ebpfprogram Category 07 |
| EBPF-0008 | Ebpfprogram Label 08 | Ebpfprogram Category 08 |

Evidence-based compliance validation operates through a tripartite structure that links claims to the evidence that refutes them and assigns a role to each linkage. The claim table records assertions such as "Carbon emissions peaked," "Patient dosage exceeds limit," "Supply chain disruption," and "Firmware update breaks encryption," each carrying its own identifier from EVID-0001 through EVID-0004. The refutation evidence table provides the counter-evidence—compliance checklists at version 2.1 appear repeatedly as the refuting artifact, while satellite imagery timestamp serves as a distinct modality of proof. The junction table binds these two entities together, recording which claim (identified by claim_id) is refuted by which evidence (identified by refuted_by_evidence_id), and assigning a role to the relationship. In the observed data, the role "observer" appears in three of four linkages, while "reviewer" appears once, suggesting a distinction between entities that witness a refutation and those that formally adjudicate it. Notably, claim EVID-0006 and EVID-0007 appear as subjects even though they do not exist as rows in the claim table, indicating that the junction table accommodates claims defined elsewhere in the system.

**t_claim_refuted_by_evidence**

| id | claim |
| --- | --- |
| EVID-0001 | Carbon emissions peaked |
| EVID-0002 | Patient dosage exceeds limit |
| EVID-0003 | Supply chain disruption |
| EVID-0004 | Firmware update breaks encryption |
| EVID-0005 | Algorithm bias flagged |
| EVID-0006 | Market volatility threshold |
| EVID-0007 | Carbon emissions peaked |

**t_claim_refuted_by_evidence_refuted_by_evidence**

| id | refuted_by_evidence |
| --- | --- |
| EVID-0001 | Compliance checklist v2.1 |
| EVID-0002 | Compliance checklist v2.1 |
| EVID-0003 | Compliance checklist v2.1 |
| EVID-0004 | Satellite imagery timestamp |
| EVID-0005 | Peer reviewed study 10.1234 |
| EVID-0006 | Lab bench measurement sheet |
| EVID-0007 | Satellite imagery timestamp |
| EVID-0008 | Clinical trial phase III |

**t_claim_refuted_by_evidence__refuted_by_evidence**

| id | claim_id | refuted_by_evidence_id | role |
| --- | --- | --- | --- |
| EVID-0001 | EVID-0006 | EVID-0004 | observer |
| EVID-0002 | EVID-0007 | EVID-0004 | observer |
| EVID-0003 | EVID-0003 | EVID-0007 | observer |
| EVID-0004 | EVID-0001 | EVID-0003 | reviewer |
| EVID-0005 | EVID-0004 | EVID-0005 | reviewer |
| EVID-0006 | EVID-0001 | EVID-0007 | contributor |
| EVID-0007 | EVID-0007 | EVID-0005 | owner |
| EVID-0008 | EVID-0003 | EVID-0001 | owner |

Policy and directive management follows an Entity-Attribute-Value pattern that decouples attribute definitions from their concrete values, enabling type-safe storage across heterogeneous data types. The policy table defines directives such as "Compliance Validation Spec," "Refresh Cycle Rule," "Lab Assay Protocol," and "Access Control Policy," each carrying two additional directive columns—for instance, "Compliance Validation Spec" is paired with "Retention Duration Rule" and "Sensor Calibration Directive." The attribute definition table enumerates the properties that policies can possess, with attribute names including "effective_date," "enforcement," "mandatory," and "priority," and corresponding XML Schema types: xsd:date, xsd:string, xsd:boolean, and xsd:integer. This type declaration is not merely documentary; it governs which value table receives the concrete assignment. Boolean attributes flow into the boolean value table, where the "mandatory" attribute (attr_id POLI-0003) takes the value true for policies POLI-0001 through POLI-0003 and false for POLI-0004. Date attributes populate the date value table, with effective dates such as 2024-10-31, 2024-11-24, 2023-02-17, and 2024-05-10 distributed across the four policies. Integer attributes reside in the integer value table, where the "priority" attribute (attr_id POLI-0004) carries values of 3 and 5 for POLI-0001 and POLI-0002 respectively, while a second attribute (attr_id POLI-0005) records values of 17 and 854. String attributes are stored in the varchar value table, with values including "Encoding 01," "Enforcement 02," "change rationale," and "fr." This multi-table value storage ensures that each attribute's value is stored in a column type that matches its declared schema, preventing type coercion errors and supporting precise query semantics across the policy registry.

**t_directive_union_constraint_or_policy**

| id | directive | directive_2 | directive_3 |
| --- | --- | --- | --- |
| POLI-0001 | Compliance Validation Spec | Retention Duration Rule | Sensor Calibration Directive |
| POLI-0002 | Refresh Cycle Rule | Retention Duration Rule | Batch Size Constraint |
| POLI-0003 | Lab Assay Protocol | pH Range Specification | Telemetry Sampling Rule |
| POLI-0004 | Access Control Policy | Logging Level Directive | Calibration Frequency Spec |
| POLI-0005 | Access Control Policy | Retention Duration Rule | Integrity Check Requirement |
| POLI-0006 | Calibration Frequency Spec | Access Control Policy | Sampling Interval Rule |
| POLI-0007 | Data Quality Standard | Validation Check | Audit Log Requirement |

**t_directive_union_constraint_or_policy_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| POLI-0001 | effective_date | xsd:date |
| POLI-0002 | enforcement | xsd:string |
| POLI-0003 | mandatory | xsd:boolean |
| POLI-0004 | priority | xsd:integer |
| POLI-0005 | review_cycle_days | xsd:integer |
| POLI-0006 | scope | xsd:string |
| POLI-0007 | encoding | xsd:string |
| POLI-0008 | label_text | xsd:string |

**t_directive_union_constraint_or_policy_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0003 | true |
| POLI-0002 | POLI-0002 | POLI-0003 | true |
| POLI-0003 | POLI-0003 | POLI-0003 | true |
| POLI-0004 | POLI-0004 | POLI-0003 | false |
| POLI-0005 | POLI-0005 | POLI-0003 | true |
| POLI-0006 | POLI-0006 | POLI-0003 | true |
| POLI-0007 | POLI-0007 | POLI-0003 | false |

**t_directive_union_constraint_or_policy_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0001 | 2024-10-31 |
| POLI-0002 | POLI-0002 | POLI-0001 | 2024-11-24 |
| POLI-0003 | POLI-0003 | POLI-0001 | 2023-02-17 |
| POLI-0004 | POLI-0004 | POLI-0001 | 2024-05-10 |
| POLI-0005 | POLI-0005 | POLI-0001 | 2025-01-01 |
| POLI-0006 | POLI-0006 | POLI-0001 | 2024-10-28 |
| POLI-0007 | POLI-0007 | POLI-0001 | 2023-09-29 |

**t_directive_union_constraint_or_policy_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0004 | 3 |
| POLI-0002 | POLI-0001 | POLI-0005 | 17 |
| POLI-0003 | POLI-0002 | POLI-0004 | 5 |
| POLI-0004 | POLI-0002 | POLI-0005 | 854 |
| POLI-0005 | POLI-0003 | POLI-0004 | 1 |
| POLI-0006 | POLI-0003 | POLI-0005 | 61 |
| POLI-0007 | POLI-0004 | POLI-0004 | 4 |
| POLI-0008 | POLI-0004 | POLI-0005 | 65 |

**t_directive_union_constraint_or_policy_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0007 | Encoding 01 |
| POLI-0002 | POLI-0001 | POLI-0002 | Enforcement 02 |
| POLI-0003 | POLI-0001 | POLI-0008 | change rationale |
| POLI-0004 | POLI-0001 | POLI-0009 | fr |
| POLI-0005 | POLI-0001 | POLI-0006 | Scope 05 |
| POLI-0006 | POLI-0002 | POLI-0007 | Encoding 06 |
| POLI-0007 | POLI-0002 | POLI-0002 | Enforcement 07 |
| POLI-0008 | POLI-0002 | POLI-0008 | calibration record |