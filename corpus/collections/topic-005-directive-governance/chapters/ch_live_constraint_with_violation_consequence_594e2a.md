---
chapter_id: ch_live_constraint_with_violation_consequence_594e2a
topic_id: 5
family: 01_foundation
cited_terms: ['constraint_with_violation_consequence', 'control_addresses_risk', 'control_at_severity']
model: engine-refine
---

Constraint governance in regulated environments depends on a disciplined separation between the declarative definition of a control and the heterogeneous attribute values that qualify its application. The constraint catalogue—identified by opaque handles such as CONS-0001 through CONS-0004—encodes policy statements like "Schema validation rule" and "Lab safety protocol," each bound to a specific risk exposure (RISK-0003, RISK-0004, RISK-0006) and paired with an enforcement action on violation, ranging from "Experiment halt" to "Pipeline termination." This linkage establishes the normative backbone: every constraint is a rule, every rule targets a risk, and every risk breach triggers a prescribed consequence. The integrity of this chain rests on the identifier column, a stable primary key that anchors all downstream references and ensures that attribute assignments, severity mappings, and cross-control relationships resolve unambiguously to a single policy statement.

**t_constraint_with_violation_consequence**

| id | constraint | constrains | on_violation |
| --- | --- | --- | --- |
| CONS-0001 | Schema validation rule | RISK-0003 | Experiment halt |
| CONS-0002 | Provenance audit requirement | RISK-0004 | Access revocation |
| CONS-0003 | Lab safety protocol | RISK-0006 | Rate throttling |
| CONS-0004 | Lab safety protocol | RISK-0004 | Pipeline termination |
| CONS-0005 | Access control matrix | RISK-0004 | Network partitioning |
| CONS-0006 | Encryption standard | RISK-0004 | Compliance flagging |

**t_constraint_with_violation_consequence_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| CONS-0001 | effective_date | xsd:date |
| CONS-0002 | enforcement | xsd:string |
| CONS-0003 | mandatory | xsd:boolean |
| CONS-0004 | priority | xsd:integer |
| CONS-0005 | review_cycle_days | xsd:integer |
| CONS-0006 | scope | xsd:string |
| CONS-0007 | encoding | xsd:string |
| CONS-0008 | label_text | xsd:string |

**t_constraint_with_violation_consequence_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONS-0001 | CONS-0001 | CONS-0003 | true |
| CONS-0002 | CONS-0002 | CONS-0003 | false |
| CONS-0003 | CONS-0003 | CONS-0003 | false |
| CONS-0004 | CONS-0004 | CONS-0003 | false |
| CONS-0005 | CONS-0005 | CONS-0003 | false |
| CONS-0006 | CONS-0006 | CONS-0003 | false |

**t_constraint_with_violation_consequence_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONS-0001 | CONS-0001 | CONS-0001 | 2024-01-12 |
| CONS-0002 | CONS-0002 | CONS-0001 | 2023-06-10 |
| CONS-0003 | CONS-0003 | CONS-0001 | 2023-06-27 |
| CONS-0004 | CONS-0004 | CONS-0001 | 2023-12-08 |
| CONS-0005 | CONS-0005 | CONS-0001 | 2024-04-22 |
| CONS-0006 | CONS-0006 | CONS-0001 | 2025-05-17 |

**t_constraint_with_violation_consequence_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONS-0001 | CONS-0001 | CONS-0004 | 5 |
| CONS-0002 | CONS-0001 | CONS-0005 | 21 |
| CONS-0003 | CONS-0002 | CONS-0004 | 3 |
| CONS-0004 | CONS-0002 | CONS-0005 | 404 |
| CONS-0005 | CONS-0003 | CONS-0004 | 1 |
| CONS-0006 | CONS-0003 | CONS-0005 | 896 |
| CONS-0007 | CONS-0004 | CONS-0004 | 5 |
| CONS-0008 | CONS-0004 | CONS-0005 | 236 |

**t_constraint_with_violation_consequence_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONS-0001 | CONS-0001 | CONS-0007 | Encoding 01 |
| CONS-0002 | CONS-0001 | CONS-0002 | Enforcement 02 |
| CONS-0003 | CONS-0001 | CONS-0008 | calibration record |
| CONS-0004 | CONS-0001 | CONS-0009 | fr |
| CONS-0005 | CONS-0001 | CONS-0006 | Scope 05 |
| CONS-0006 | CONS-0002 | CONS-0007 | Encoding 06 |
| CONS-0007 | CONS-0002 | CONS-0002 | Enforcement 07 |
| CONS-0008 | CONS-0002 | CONS-0008 | change rationale |

**t_control_addresses_risk**

| id | control |
| --- | --- |
| RISK-0001 | Log Retention Policy |
| RISK-0002 | Segregation of Duties |
| RISK-0003 | Vendor Assessment |
| RISK-0004 | MFA Enforcement |
| RISK-0005 | Access Review Cycle |
| RISK-0006 | Threat Modeling |

**t_control_addresses_risk_addresses_risk**

| id | addresses_risk |
| --- | --- |
| RISK-0001 | Insider Threat |
| RISK-0002 | Configuration Drift |
| RISK-0003 | Third-Party Failure |
| RISK-0004 | Insider Threat |
| RISK-0005 | Regulatory Penalty |
| RISK-0006 | Configuration Drift |
| RISK-0007 | Regulatory Penalty |

Attributes and their types form the secondary layer, allowing each constraint to carry metadata that governs its operational behavior. The attribute catalogue enumerates property names—effective_date, enforcement, mandatory, priority—each declared against an XSD type that constrains the shape of permissible values: xsd:date for temporal bounds, xsd:string for free-form labels, xsd:boolean for binary flags, and xsd:integer for numeric thresholds. This type discipline is not decorative; it guarantees that a value store can validate inputs before they propagate into enforcement logic. For instance, the mandatory flag on CONS-0001 is recorded as true, while the same attribute on CONS-0002, CONS-0003, and CONS-0004 is false, signaling that only the schema validation rule carries an unconditional requirement. Similarly, the effective_date attribute anchors each constraint to a calendar point—2024-01-12 for CONS-0001, 2023-06-10 for CONS-0002, 2023-06-27 for CONS-0003, and 2023-12-08 for CONS-0004—enabling auditors to reconstruct the temporal scope of each policy. Numeric attributes such as priority admit values like 5 and 21 for CONS-0001, and 3 and 404 for CONS-0002, providing a quantitative basis for conflict resolution when multiple constraints apply to the same risk.

The value tables implement a vertical, entity-attribute-value pattern that decouples attribute definitions from their concrete assignments. Each row carries an entity_id pointing back to the constraint identifier, an attr_id referencing the attribute definition, and a value column whose semantics are determined by the attribute's type. Boolean values populate the boolean value table with true or false entries; date values carry ISO-formatted strings such as 2024-01-12; integer values hold unbounded numerics including 404; and varchar values store free-form text like "calibration record," "Encoding 01," "Enforcement 02," and the language code "fr." This normalization allows a single constraint to accumulate an arbitrary number of attributes without schema modification, and it permits the same attribute to assume different values across constraints—CONS-0001 and CONS-0002 each carry two integer priority entries, while CONS-0001 alone accumulates four varchar attributes. The entity_id column is the join key that binds each value to its owning constraint, ensuring that attribute retrieval is always scoped to the correct policy.

Control-to-risk mappings extend the governance model beyond individual constraints into the broader architecture of risk mitigation. The control catalogue—identified by handles such as RISK-0001 through RISK-0004—lists operational measures like "Log Retention Policy," "Segregation of Duties," "Vendor Assessment," and "MFA Enforcement," each associated with one or more risk categories including "Insider Threat," "Configuration Drift," and "Third-Party Failure." A junction table mediates the many-to-many relationship between controls and risks, introducing two foreign keys: a subject column (control_id) and a target column (addresses_risk_id), together with a role column that classifies the nature of the relationship. In this schema, a role of "contributor" indicates that the control actively mitigates the risk, while "observer" denotes a monitoring or awareness relationship. For example, control RISK-0002 contributes to risk RISK-0005, control RISK-0005 observes risk RISK-0002, and control RISK-0001 contributes to risk RISK-0002—each pairing explicitly declared rather than inferred.

**t_control_addresses_risk__addresses_risk**

| id | control_id | addresses_risk_id | role |
| --- | --- | --- | --- |
| RISK-0001 | RISK-0002 | RISK-0005 | contributor |
| RISK-0002 | RISK-0005 | RISK-0002 | observer |
| RISK-0003 | RISK-0001 | RISK-0002 | contributor |
| RISK-0004 | RISK-0005 | RISK-0006 | observer |
| RISK-0005 | RISK-0003 | RISK-0004 | contributor |
| RISK-0006 | RISK-0001 | RISK-0004 | reviewer |
| RISK-0007 | RISK-0005 | RISK-0003 | contributor |
| RISK-0008 | RISK-0006 | RISK-0002 | reviewer |

Severity mappings and internationalization metadata sit at the intersection of controls and constraints, adding a localization dimension to the governance fabric. The severity table links controls such as "Log retention 90 days," "Rate limiting API," "Access review quarterly," and "Network segmentation east-west" to constraint identifiers like CONS-0006 and CONS-0003, while recording the character encoding (latin1, unicode, utf8) and language (de, ja) of the associated documentation or policy text. This encoding-language pair ensures that multilingual compliance artifacts are stored with their native character sets intact, preventing corruption when German-language records (de, latin1) coexist with Japanese-language records (ja, unicode) in the same repository. The presence of "fr" as a varchar value in the attribute value store further confirms that language codes circulate as data within the attribute system itself, enabling downstream tools to route policy documents to the appropriate linguistic audience.

**t_control_at_severity**

| id | control | at_severity | encoding | language |
| --- | --- | --- | --- | --- |
| SEVE-0001 | Log retention 90 days | CONS-0006 | latin1 | de |
| SEVE-0002 | Rate limiting API | CONS-0006 | unicode | ja |
| SEVE-0003 | Access review quarterly | CONS-0003 | unicode | de |
| SEVE-0004 | Network segmentation east-west | CONS-0003 | utf8 | de |
| SEVE-0005 | Network segmentation east-west | CONS-0004 | latin1 | fr |
| SEVE-0006 | Backup verification daily | CONS-0001 | latin1 | en |
| SEVE-0007 | PII masking pipeline | CONS-0002 | unicode | ja |
| SEVE-0008 | Backup verification daily | CONS-0006 | unicode | de |