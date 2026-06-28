---
chapter_id: ch_live_kernelhook_with_hook_kind_896fa3
topic_id: 46
family: 04_ebpf_kernel
cited_terms: ['kernelhook_with_hook_kind', 'requirement_traces_to', 'soc2_security_subclass']
model: engine-refine
---

Kernel hooks serve as the instrumentation layer within the system, each identified by a unique identifier such as `KIND-0001` through `KIND-0004` and classified by a hook kind key that references a dimensional catalog. The `fact_kernelhook` table records operational metadata for each hook instance, including the binary footprint in `size_bytes`—values ranging from approximately 27 million bytes for `KIND-0004` to nearly 561 million bytes for `KIND-0002`—and a `version` number that tracks revisions, with observed versions spanning from 1 to 10. The hook kind dimension, maintained in `dim_hook_kind`, assigns a human-readable `hook_kind_label` like `Hook Kind Label 01` and a `hook_kind_category` such as `Hook Kind Category 01` to each kind, enabling aggregation and reporting by functional classification rather than by individual identifier.

**fact_kernelhook**

| id | hook_kind_key | size_bytes | version |
| --- | --- | --- | --- |
| KIND-0001 | KIND-0002 | 36342735 | 3 |
| KIND-0002 | KIND-0004 | 560962979 | 1 |
| KIND-0003 | KIND-0007 | 456299832 | 10 |
| KIND-0004 | KIND-0004 | 272822846 | 1 |

**dim_hook_kind**

| id | hook_kind_label | hook_kind_category |
| --- | --- | --- |
| KIND-0001 | Hook Kind Label 01 | Hook Kind Category 01 |
| KIND-0002 | Hook Kind Label 02 | Hook Kind Category 02 |
| KIND-0003 | Hook Kind Label 03 | Hook Kind Category 03 |
| KIND-0004 | Hook Kind Label 04 | Hook Kind Category 04 |
| KIND-0005 | Hook Kind Label 05 | Hook Kind Category 05 |
| KIND-0006 | Hook Kind Label 06 | Hook Kind Category 06 |
| KIND-0007 | Hook Kind Label 07 | Hook Kind Category 07 |

Traceability between compliance requirements and their downstream artifacts is captured through a relational junction structure. The `t_requirement_traces_to` table holds requirement records identified by IDs like `TRAC-0001` through `TRAC-0004`, each associated with a requirement description such as `Network Segmentation Rule` or `Privacy Compliance Requirement`. The `t_requirement_traces_to_traces_to` table enumerates the target artifacts—`HIPAA Security Rule`, `Risk Assessment Matrix`, `Compliance Audit Checklist`, and `ISO 27001 Control`—that requirements map to. The association table `t_requirement_traces_to__traces_to` binds a `subject` (the requirement identifier) to a `target` (the artifact identifier) and assigns a `role` that defines the nature of the relationship; for example, `TRAC-0001` acts as `owner` of `TRAC-0004`, while `TRAC-0004` assumes a `reviewer` role against the same target. This role-based linkage makes it possible to audit not only what is traced to what, but who is accountable at each step.

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

SOC 2 security subclass definitions extend the traceability model into domain-specific security controls. The `t_soc2_security_subclass` table links a subclass identifier like `SECU-0001` to a `soc` classification—`SOC2-CloudInfra`, `SOC3-Public`, `SOC2-Fintech`, or `SOC2-IdentityProvider`—and to a `for_s_o_c2_domain` target such as `TRAC-0007`. Each subclass is further characterized by a set of attributes defined in `t_soc2_security_subclass_attr`, where `attr_name` values include `effective_date`, `enforcement`, `mandatory`, and `priority`, and `attr_type` specifies the data type using XML Schema primitives: `xsd:date`, `xsd:string`, `xsd:boolean`, and `xsd:integer`. This schema-level typing ensures that attribute values are validated against their declared format before ingestion.

**t_soc2_security_subclass**

| id | soc | for_s_o_c2_domain |
| --- | --- | --- |
| SECU-0001 | SOC2-CloudInfra | TRAC-0007 |
| SECU-0002 | SOC3-Public | TRAC-0007 |
| SECU-0003 | SOC2-Fintech | TRAC-0005 |
| SECU-0004 | SOC2-IdentityProvider | TRAC-0007 |
| SECU-0005 | SOC2-SaaS | TRAC-0001 |
| SECU-0006 | SOC2-TypeII | TRAC-0007 |
| SECU-0007 | SOC2-SaaS | TRAC-0007 |

**t_soc2_security_subclass_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| SECU-0001 | effective_date | xsd:date |
| SECU-0002 | enforcement | xsd:string |
| SECU-0003 | mandatory | xsd:boolean |
| SECU-0004 | priority | xsd:integer |
| SECU-0005 | review_cycle_days | xsd:integer |
| SECU-0006 | scope | xsd:string |
| SECU-0007 | encoding | xsd:string |
| SECU-0008 | label_text | xsd:string |

**t_soc2_security_subclass_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SECU-0001 | SECU-0001 | SECU-0003 | true |
| SECU-0002 | SECU-0002 | SECU-0003 | false |
| SECU-0003 | SECU-0003 | SECU-0003 | true |
| SECU-0004 | SECU-0004 | SECU-0003 | false |
| SECU-0005 | SECU-0005 | SECU-0003 | false |
| SECU-0006 | SECU-0006 | SECU-0003 | false |
| SECU-0007 | SECU-0007 | SECU-0003 | false |

**t_soc2_security_subclass_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SECU-0001 | SECU-0001 | SECU-0001 | 2023-08-15 |
| SECU-0002 | SECU-0002 | SECU-0001 | 2024-04-12 |
| SECU-0003 | SECU-0003 | SECU-0001 | 2024-01-26 |
| SECU-0004 | SECU-0004 | SECU-0001 | 2025-05-01 |
| SECU-0005 | SECU-0005 | SECU-0001 | 2023-05-03 |
| SECU-0006 | SECU-0006 | SECU-0001 | 2025-05-11 |
| SECU-0007 | SECU-0007 | SECU-0001 | 2024-10-21 |

**t_soc2_security_subclass_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SECU-0001 | SECU-0001 | SECU-0004 | 5 |
| SECU-0002 | SECU-0001 | SECU-0005 | 926 |
| SECU-0003 | SECU-0002 | SECU-0004 | 1 |
| SECU-0004 | SECU-0002 | SECU-0005 | 849 |
| SECU-0005 | SECU-0003 | SECU-0004 | 2 |
| SECU-0006 | SECU-0003 | SECU-0005 | 409 |
| SECU-0007 | SECU-0004 | SECU-0004 | 5 |
| SECU-0008 | SECU-0004 | SECU-0005 | 551 |

Attribute values are stored in type-specialized tables that reference both the `entity` (the subclass instance) and the `attr` (the attribute definition). Boolean attributes, recorded in `t_soc2_security_subclass_val_boolean`, hold values of `true` or `false`—for instance, `SECU-0001` and `SECU-0003` evaluate to `true` for the `mandatory` attribute, while `SECU-0002` and `SECU-0004` evaluate to `false`. Date attributes in `t_soc2_security_subclass_val_date` capture effective dates such as `2023-08-15`, `2024-04-12`, `2024-01-26`, and `2025-05-01`, enabling temporal reasoning about when controls became active. Integer attributes in `t_soc2_security_subclass_val_int` store numeric values like `5` and `1` for `priority`, and larger magnitudes such as `926` and `849` for other measures. String attributes in `t_soc2_security_subclass_val_varchar` hold free-form text including `Encoding 01`, `Enforcement 02`, and `audit excerpt`, providing a flexible `misc` container for unstructured metadata. Together, these value tables implement an entity-attribute-value pattern that scales across heterogeneous attribute types while preserving type safety through physical separation.

**t_soc2_security_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SECU-0001 | SECU-0001 | SECU-0007 | Encoding 01 |
| SECU-0002 | SECU-0001 | SECU-0002 | Enforcement 02 |
| SECU-0003 | SECU-0001 | SECU-0008 | audit excerpt |
| SECU-0004 | SECU-0001 | SECU-0009 | de |
| SECU-0005 | SECU-0001 | SECU-0006 | Scope 05 |
| SECU-0006 | SECU-0002 | SECU-0007 | Encoding 06 |
| SECU-0007 | SECU-0002 | SECU-0002 | Enforcement 07 |
| SECU-0008 | SECU-0002 | SECU-0008 | audit excerpt |