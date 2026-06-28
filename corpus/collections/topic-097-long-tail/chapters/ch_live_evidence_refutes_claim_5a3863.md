---
chapter_id: ch_live_evidence_refutes_claim_5a3863
topic_id: 97
family: 06_belief_structure
cited_terms: ['evidence_refutes_claim', 'control_with_classification_tier', 'measurement_with_method']
model: engine-refine
---

Within a structured governance framework, controls serve as the foundational objects of compliance enforcement, each identified by a stable identifier such as TIER-0001 through TIER-0004 and described by a functional label—Input sanitization, Role based access, Encryption at rest, Session expiration. These controls are not monolithic; they carry a rich set of attributes that govern their applicability and behavior. The attribute schema is itself parameterized: each attribute carries a name, such as effective_date, enforcement, mandatory, or priority, and a type drawn from the XML Schema definition space—xsd:date, xsd:string, xsd:boolean, xsd:integer. This separation of attribute definition from attribute value enables a flexible, extensible model where new attributes can be introduced without schema migration. A control like TIER-0001, for instance, may have an effective_date of 2023-02-10, while TIER-0004 carries a priority value of 2 alongside a secondary attribute with value 715, illustrating how integer-typed attributes can encode quantitative thresholds or severity indices. Boolean attributes distinguish mandatory enforcement: TIER-0002 through TIER-0004 all register true for their mandatory flag, whereas TIER-0001 registers false, signaling a non-enforced or advisory posture. String-valued attributes further enrich the model, carrying values such as Encoding 01, Enforcement 02, or audit excerpt, each tied to a specific entity-attribute pair through a normalized junction table.

**t_control_with_classification_tier**

| id | control |
| --- | --- |
| TIER-0001 | Input sanitization |
| TIER-0002 | Role based access |
| TIER-0003 | Encryption at rest |
| TIER-0004 | Session expiration |
| TIER-0005 | Firewall rule set |
| TIER-0006 | Encryption at rest |

**t_control_with_classification_tier_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| TIER-0001 | effective_date | xsd:date |
| TIER-0002 | enforcement | xsd:string |
| TIER-0003 | mandatory | xsd:boolean |
| TIER-0004 | priority | xsd:integer |
| TIER-0005 | review_cycle_days | xsd:integer |
| TIER-0006 | scope | xsd:string |
| TIER-0007 | encoding | xsd:string |
| TIER-0008 | label_text | xsd:string |

**t_control_with_classification_tier_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TIER-0001 | TIER-0001 | TIER-0003 | false |
| TIER-0002 | TIER-0002 | TIER-0003 | true |
| TIER-0003 | TIER-0003 | TIER-0003 | true |
| TIER-0004 | TIER-0004 | TIER-0003 | true |
| TIER-0005 | TIER-0005 | TIER-0003 | true |
| TIER-0006 | TIER-0006 | TIER-0003 | false |

**t_control_with_classification_tier_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TIER-0001 | TIER-0001 | TIER-0001 | 2023-02-10 |
| TIER-0002 | TIER-0002 | TIER-0001 | 2023-09-02 |
| TIER-0003 | TIER-0003 | TIER-0001 | 2024-01-29 |
| TIER-0004 | TIER-0004 | TIER-0001 | 2024-02-25 |
| TIER-0005 | TIER-0005 | TIER-0001 | 2025-05-01 |
| TIER-0006 | TIER-0006 | TIER-0001 | 2023-03-16 |

**t_control_with_classification_tier_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TIER-0001 | TIER-0001 | TIER-0004 | 2 |
| TIER-0002 | TIER-0001 | TIER-0005 | 715 |
| TIER-0003 | TIER-0002 | TIER-0004 | 4 |
| TIER-0004 | TIER-0002 | TIER-0005 | 86 |
| TIER-0005 | TIER-0003 | TIER-0004 | 1 |
| TIER-0006 | TIER-0003 | TIER-0005 | 78 |
| TIER-0007 | TIER-0004 | TIER-0004 | 5 |
| TIER-0008 | TIER-0004 | TIER-0005 | 174 |

**t_control_with_classification_tier_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TIER-0001 | TIER-0001 | TIER-0007 | Encoding 01 |
| TIER-0002 | TIER-0001 | TIER-0002 | Enforcement 02 |
| TIER-0003 | TIER-0001 | TIER-0008 | audit excerpt |
| TIER-0004 | TIER-0001 | TIER-0009 | en |
| TIER-0005 | TIER-0001 | TIER-0006 | Scope 05 |
| TIER-0006 | TIER-0002 | TIER-0007 | Encoding 06 |
| TIER-0007 | TIER-0002 | TIER-0002 | Enforcement 07 |
| TIER-0008 | TIER-0002 | TIER-0008 | change rationale |

The provenance of compliance assertions is captured through an evidence-refutation model that links discrete pieces of evidence to the claims they undermine. Each record in this model carries an identifier such as CLAI-0001, a body of evidence—Benchmark result v2.1, Audit report FY2023, Sensor drift calibration, Data lineage snapshot—that directly refutes a target claim identified by a control reference like TIER-0004 or TIER-0002. The method by which the refutation was established is itself classified as manual, hybrid, or automated, a distinction that carries weight in audit trails and regulatory review. Accompanying each record is a label_text field—calibration record, audit excerpt, intake form, pre-release note—that provides a human-readable descriptor of the evidence artifact, enabling auditors to quickly assess the nature and source of the refutation without inspecting the underlying data.

**t_evidence_refutes_claim**

| id | evidence | refutes_claim | method | label_text |
| --- | --- | --- | --- | --- |
| CLAI-0001 | Benchmark result v2.1 | TIER-0004 | manual | calibration record |
| CLAI-0002 | Audit report FY2023 | TIER-0004 | hybrid | audit excerpt |
| CLAI-0003 | Sensor drift calibration | TIER-0002 | automated | intake form |
| CLAI-0004 | Data lineage snapshot | TIER-0006 | hybrid | pre-release note |
| CLAI-0005 | Audit report FY2023 | TIER-0005 | hybrid | calibration record |
| CLAI-0006 | Compliance checklist 7.4 | TIER-0003 | automated | change rationale |
| CLAI-0007 | Incident summary Aug | TIER-0006 | inferred | intake form |

**dim_via_method**

| id | via_method_label | via_method_category |
| --- | --- | --- |
| METH-0001 | Via Method Label 01 | Via Method Category 01 |
| METH-0002 | Via Method Label 02 | Via Method Category 02 |
| METH-0003 | Via Method Label 03 | Via Method Category 03 |
| METH-0004 | Via Method Label 04 | Via Method Category 04 |
| METH-0005 | Via Method Label 05 | Via Method Category 05 |
| METH-0006 | Via Method Label 06 | Via Method Category 06 |

Measurement quality within this framework is quantified through confidence and uncertainty metrics, each anchored to a specific measurement record and a via_method reference. The fact_measurement table stores a numeric value—353.34, 660.64, 878.99, 64.10—alongside a confidence score ranging from 0.307 to 0.945 and an uncertainty magnitude spanning 120.70 to 364.07. A measurement with confidence 0.945 and uncertainty 279.24 represents a high-certainty observation, whereas a record with confidence 0.307 and uncertainty 364.07 signals a low-confidence, highly uncertain assessment that warrants further investigation. The via_method_key column links each measurement to a dimension table that classifies the method by a human-readable label—Via Method Label 01 through Via Method Label 04—and a category—Via Method Category 01 through Via Method Category 04—enabling aggregation and filtering of measurements by the technique or instrument used to produce them. This dual-layer classification of methods supports both operational reporting and regulatory compliance, as auditors can trace each measurement back to the method category that produced it and evaluate whether the confidence and uncertainty levels are acceptable for the intended use case.

**fact_measurement**

| id | via_method_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| METH-0001 | METH-0003 | 0.496 | 306.26 | 353.34 |
| METH-0002 | METH-0002 | 0.945 | 279.24 | 660.64 |
| METH-0003 | METH-0005 | 0.506 | 120.70 | 878.99 |
| METH-0004 | METH-0005 | 0.307 | 364.07 | 64.10 |
| METH-0005 | METH-0001 | 0.923 | 642.96 | 897.70 |