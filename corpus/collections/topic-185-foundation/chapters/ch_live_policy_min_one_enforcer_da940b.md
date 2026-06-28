---
chapter_id: ch_live_policy_min_one_enforcer_da940b
topic_id: 185
family: 03_directive_governance
cited_terms: ['policy_min_one_enforcer', 'schema_evolution_under_directive', 'dempster_combines_audit_evidences']
model: engine-refine
---

Within any structured governance architecture, the identifier serves as the immutable anchor for every entity, policy, and evidentiary record. Identifiers such as ENFO-0001 through ENFO-0004 designate enforcement policies—SOC 2 Type II Controls, ISO 13485 QMS, GDPR Compliance Framework, and EU AI Act Risk Management—while DIRE-0001 through DIRE-0004 and EVID-0001 through EVID-0004 respectively index schema facts and Dempster-Shafer evidence records. These identifiers are not arbitrary; they establish referential integrity across fact and dimension tables, enabling precise joins between enforcement policies and the bodies that enforce them, between schema facts and their categorical labels, and between Dempster evidence and its descriptive metadata. The prefix convention—ENFO for enforcement, DIRE for directive schema facts, EVID for Dempster evidence—provides an immediate semantic signal about the entity's domain without requiring schema inspection.

**t_policy_min_one_enforcer**

| id | policy |
| --- | --- |
| ENFO-0001 | SOC 2 Type II Controls |
| ENFO-0002 | ISO 13485 QMS |
| ENFO-0003 | GDPR Compliance Framework |
| ENFO-0004 | EU AI Act Risk Management |
| ENFO-0005 | ISO 13485 QMS |
| ENFO-0006 | ISO 13485 QMS |

The schema and Dempster tables form parallel dimensional structures, each comprising a fact table and a corresponding dimension table. The fact_schema table records quantitative observations keyed by a schema_key (DIRE-0007, DIRE-0004) alongside a confidence measure and an uncertainty value, while fact_dempster similarly anchors evidence records to a dempster_key (EVID-0007, EVID-0003, EVID-0004) with its own confidence and uncertainty metrics. The dimension tables—dim_schema and dim_dempster—supply the human-readable labels (Schema Label 01 through 04, Dempster Label 01 through 04) and the category assignments (Schema Category 01 through 04, Dempster Category 01 through 04) that classify these records into meaningful groups. This fact-dimension pairing mirrors the star-schema pattern common in analytical data warehouses, except that the analytical dimensions here are regulatory and evidentiary rather than temporal or geographic.

**fact_schema**

| id | schema_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| DIRE-0001 | DIRE-0007 | 0.346 | 496.72 | 934.63 |
| DIRE-0002 | DIRE-0004 | 0.128 | 36.42 | 722.91 |
| DIRE-0003 | DIRE-0007 | 0.279 | 132.28 | 890.32 |
| DIRE-0004 | DIRE-0007 | 0.559 | 435.16 | 628.85 |
| DIRE-0005 | DIRE-0002 | 0.314 | 996.56 | 660.34 |
| DIRE-0006 | DIRE-0003 | 0.661 | 71.96 | 765.11 |
| DIRE-0007 | DIRE-0005 | 0.981 | 108.29 | 904.01 |

**fact_dempster**

| id | dempster_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| EVID-0001 | EVID-0007 | 0.153 | 9.49 | 520.46 |
| EVID-0002 | EVID-0003 | 0.014 | 392.06 | 137.18 |
| EVID-0003 | EVID-0004 | 0.025 | 687.80 | 197.61 |
| EVID-0004 | EVID-0007 | 0.728 | 479.57 | 846.10 |
| EVID-0005 | EVID-0005 | 0.918 | 172.36 | 296.96 |
| EVID-0006 | EVID-0006 | 0.755 | 608.06 | 341.51 |

Confidence and uncertainty constitute the quantitative backbone of the fact tables, capturing the degree of belief and the associated epistemic variance for each recorded observation. In fact_schema, confidence values range from 0.128 (DIRE-0002) to 0.559 (DIRE-0004), while uncertainty spans from 36.42 to 496.72, suggesting that lower confidence correlates with higher uncertainty in at least some records. The fact_dempster table exhibits a wider confidence spread, from 0.014 (EVID-0002) to 0.728 (EVID-0004), with uncertainty values reaching 687.80 for the record with the lowest confidence. These paired metrics are not independent; they reflect the Dempster-Shafer theory of evidence, where belief is distributed across a frame of discernment and the gap between belief and plausibility quantifies ignorance or uncertainty. The value column in both fact tables (ranging from 520.46 to 934.63 in fact_schema and 137.18 to 846.10 in fact_dempster) represents the measured or assessed magnitude associated with each observation, providing the substantive content that confidence and uncertainty qualify.

The junction table t_policy_min_one_enforcer__enforced_by introduces the role dimension to the enforcement relationship, transforming a simple many-to-many association between policies and enforcing bodies into a semantically rich linkage. Each row carries a subject column (policy_id, referencing ENFO-0004 or ENFO-0005) and a target column (enforced_by_id, referencing ENFO-0002, ENFO-0003, or ENFO-0004), while the role column specifies the nature of the enforcing body's participation—contributor, observer, or owner. For instance, the enforcement body ENFO-0002 appears as a contributor for policy ENFO-0005 and as an owner for policy ENFO-0004, indicating that the same entity can hold different governance responsibilities depending on the policy context. This role-based relationship model enables fine-grained accountability tracking, distinguishing between entities that actively contribute to enforcement, those that observe compliance, and those that bear ownership responsibility.

**t_policy_min_one_enforcer_enforced_by**

| id | enforced_by |
| --- | --- |
| ENFO-0001 | Regulatory Affairs Division |
| ENFO-0002 | Compliance Audit Board |
| ENFO-0003 | Privacy Officer |
| ENFO-0004 | Data Stewardship Council |
| ENFO-0005 | Automated Policy Engine |
| ENFO-0006 | Risk Management Committee |

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

The category field in both dim_schema and dim_dempster provides the primary classification mechanism for organizing records into thematic groups. Schema categories (Schema Category 01 through 04) and Dempster categories (Dempster Category 01 through 04) serve as high-level groupings that can be aggregated for reporting, auditing, or risk assessment purposes. The misc column—populated with schema_label and dempster_label values such as Schema Label 01 and Dempster Label 03—supplements category with descriptive identifiers that are more granular than categories but less formal than the primary keys. Together, category, misc, and identifier form a three-tier classification system: the identifier provides uniqueness, the misc label provides human-readable context, and the category enables aggregation and filtering across the dataset.

**dim_schema**

| id | schema_label | schema_category |
| --- | --- | --- |
| DIRE-0001 | Schema Label 01 | Schema Category 01 |
| DIRE-0002 | Schema Label 02 | Schema Category 02 |
| DIRE-0003 | Schema Label 03 | Schema Category 03 |
| DIRE-0004 | Schema Label 04 | Schema Category 04 |
| DIRE-0005 | Schema Label 05 | Schema Category 05 |
| DIRE-0006 | Schema Label 06 | Schema Category 06 |
| DIRE-0007 | Schema Label 07 | Schema Category 07 |

**dim_dempster**

| id | dempster_label | dempster_category |
| --- | --- | --- |
| EVID-0001 | Dempster Label 01 | Dempster Category 01 |
| EVID-0002 | Dempster Label 02 | Dempster Category 02 |
| EVID-0003 | Dempster Label 03 | Dempster Category 03 |
| EVID-0004 | Dempster Label 04 | Dempster Category 04 |
| EVID-0005 | Dempster Label 05 | Dempster Category 05 |
| EVID-0006 | Dempster Label 06 | Dempster Category 06 |
| EVID-0007 | Dempster Label 07 | Dempster Category 07 |
| EVID-0008 | Dempster Label 08 | Dempster Category 08 |