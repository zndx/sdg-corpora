---
chapter_id: ch_live_control_with_evidence_requirement_3dec85
topic_id: 2
family: 03_directive_governance
cited_terms: ['control_with_evidence_requirement', 'control_with_owner', 'counter_metric_subclass']
model: engine-refine
---

A compliance framework requires that every control obligation be anchored to a precise identifier, an enforcement posture, and a language scope, so that auditors can trace a requirement from its declaration through its evidence to its jurisdictional applicability. The evidence requirement registry assigns each obligation a unique key—REQU-0001 through REQU-0004—and binds it to a control such as DataEncryptionAtRest or BaselineConfigurationCheck, while simultaneously specifying the evidence artifact demanded, whether SystemAuditLog, ISO27001Certification, or ManagerApprovalEmail. The enforcement designation then determines the weight of that obligation: mandatory directives carry binding force, advisory items signal recommended practice, and deprecated entries have been withdrawn from active consideration. Language codes—en, es, ja—further constrain the applicable audience, ensuring that a single control can be administered across multilingual environments without ambiguity. This triad of identifier, enforcement, and language forms the foundational layer upon which all subsequent governance metadata is constructed.

**t_control_with_evidence_requirement**

| id | control | requires_evidence | enforcement | language |
| --- | --- | --- | --- | --- |
| REQU-0001 | DataEncryptionAtRest | SystemAuditLog | deprecated | en |
| REQU-0002 | BaselineConfigurationCheck | ISO27001Certification | advisory | es |
| REQU-0003 | DataEncryptionAtRest | SystemAuditLog | deprecated | en |
| REQU-0004 | DataEncryptionAtRest | ManagerApprovalEmail | mandatory | ja |

Ownership attribution extends the control model by decoupling the obligation from its stewardship. The owner registry assigns identifiers OWNE-0001 through OWNE-0004 to controls such as Vendor Risk Assessment and Data Retention Policy, establishing a clear line of accountability. Rather than embedding owner-specific properties directly into the control record, the framework employs an attribute definition layer that declares the shape of each supplementary property: effective_date as an xsd:date, enforcement as an xsd:string, mandatory as an xsd:boolean, and priority as an xsd:integer. This separation of schema from instance permits the attribute taxonomy to evolve independently of the control catalog, allowing new metadata fields to be introduced without restructuring the core governance model.

**t_control_with_owner**

| id | control |
| --- | --- |
| OWNE-0001 | Vendor Risk Assessment |
| OWNE-0002 | Data Retention Policy |
| OWNE-0003 | Vendor Risk Assessment |
| OWNE-0004 | Data Retention Policy |
| OWNE-0005 | Password Complexity Policy |
| OWNE-0006 | MFA Enforcement |
| OWNE-0007 | Data Retention Policy |

Attribute values are materialized through a type-dispatched storage pattern that routes each property to the appropriate value table based on its declared type. Date attributes such as effective_date resolve to concrete calendar values—2024-04-04, 2025-04-01, 2025-05-22, 2024-09-08—anchoring controls to temporal boundaries that govern when they become operative or expire. Boolean attributes like mandatory store truth values across entity-attribute pairs, with entries OWNE-0001 through OWNE-0004 each carrying a definitive true or false designation on the mandatory flag. Integer attributes capture priority rankings and numeric thresholds, with values ranging from 4 to 806 and 5 to 150, enabling quantitative comparison of control significance. String attributes hold free-form descriptors such as Encoding 01, Enforcement 02, change rationale, and es, providing the textual flexibility that typed fields cannot accommodate. Each value row carries an entity identifier that links back to the owner registry and an attribute identifier that resolves to the schema definition, creating a fully navigable graph from obligation to property to concrete value.

**t_control_with_owner_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| OWNE-0001 | effective_date | xsd:date |
| OWNE-0002 | enforcement | xsd:string |
| OWNE-0003 | mandatory | xsd:boolean |
| OWNE-0004 | priority | xsd:integer |
| OWNE-0005 | review_cycle_days | xsd:integer |
| OWNE-0006 | scope | xsd:string |
| OWNE-0007 | encoding | xsd:string |
| OWNE-0008 | label_text | xsd:string |

**t_control_with_owner_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OWNE-0001 | OWNE-0001 | OWNE-0003 | true |
| OWNE-0002 | OWNE-0002 | OWNE-0003 | true |
| OWNE-0003 | OWNE-0003 | OWNE-0003 | false |
| OWNE-0004 | OWNE-0004 | OWNE-0003 | true |
| OWNE-0005 | OWNE-0005 | OWNE-0003 | true |
| OWNE-0006 | OWNE-0006 | OWNE-0003 | true |
| OWNE-0007 | OWNE-0007 | OWNE-0003 | true |

**t_control_with_owner_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OWNE-0001 | OWNE-0001 | OWNE-0001 | 2024-04-04 |
| OWNE-0002 | OWNE-0002 | OWNE-0001 | 2025-04-01 |
| OWNE-0003 | OWNE-0003 | OWNE-0001 | 2025-05-22 |
| OWNE-0004 | OWNE-0004 | OWNE-0001 | 2024-09-08 |
| OWNE-0005 | OWNE-0005 | OWNE-0001 | 2023-05-30 |
| OWNE-0006 | OWNE-0006 | OWNE-0001 | 2023-06-07 |
| OWNE-0007 | OWNE-0007 | OWNE-0001 | 2025-03-19 |

**t_control_with_owner_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OWNE-0001 | OWNE-0001 | OWNE-0004 | 4 |
| OWNE-0002 | OWNE-0001 | OWNE-0005 | 806 |
| OWNE-0003 | OWNE-0002 | OWNE-0004 | 5 |
| OWNE-0004 | OWNE-0002 | OWNE-0005 | 150 |
| OWNE-0005 | OWNE-0003 | OWNE-0004 | 1 |
| OWNE-0006 | OWNE-0003 | OWNE-0005 | 596 |
| OWNE-0007 | OWNE-0004 | OWNE-0004 | 2 |
| OWNE-0008 | OWNE-0004 | OWNE-0005 | 663 |

**t_control_with_owner_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OWNE-0001 | OWNE-0001 | OWNE-0007 | Encoding 01 |
| OWNE-0002 | OWNE-0001 | OWNE-0002 | Enforcement 02 |
| OWNE-0003 | OWNE-0001 | OWNE-0008 | change rationale |
| OWNE-0004 | OWNE-0001 | OWNE-0009 | es |
| OWNE-0005 | OWNE-0001 | OWNE-0006 | Scope 05 |
| OWNE-0006 | OWNE-0002 | OWNE-0007 | Encoding 06 |
| OWNE-0007 | OWNE-0002 | OWNE-0002 | Enforcement 07 |
| OWNE-0008 | OWNE-0002 | OWNE-0008 | intake form |

The metric dimension of the framework operates on a star-schema topology that separates measured facts from their categorical descriptors. The fact counter table records observations identified by METR-0001 through METR-0004, each associated with a metric kind key—METR-0005, METR-0004, METR-0003—that references the dimension table for semantic classification. Size measurements in bytes, such as 977102405, 609833100, 881633277, and 422660739, quantify the scope or volume of the measured entity, while version numbers—12, 8, 7, 5—track the iteration state of the underlying control or policy artifact. The metric kind dimension table provides the human-readable labels and categorical groupings that give these numeric observations their analytical meaning, with entries like Metric Kind Label 01 through Metric Kind Label 04 mapped to categories Metric Kind Category 01 through Metric Kind Category 04. This separation of fact from dimension enables efficient aggregation and filtering across metric types without duplicating categorical metadata within each measurement record.

**fact_counter**

| id | metric_kind_key | size_bytes | version |
| --- | --- | --- | --- |
| METR-0001 | METR-0005 | 977102405 | 12 |
| METR-0002 | METR-0004 | 609833100 | 8 |
| METR-0003 | METR-0003 | 881633277 | 7 |
| METR-0004 | METR-0003 | 422660739 | 5 |

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