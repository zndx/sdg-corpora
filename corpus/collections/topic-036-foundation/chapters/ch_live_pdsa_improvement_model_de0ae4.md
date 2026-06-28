---
chapter_id: ch_live_pdsa_improvement_model_de0ae4
topic_id: 36
family: 08_derived
cited_terms: ['pdsa_improvement_model', 'process_produces_ice', 'constraint_with_violation_consequence']
model: engine-refine
---

The PDSA improvement model framework organizes quality-improvement initiatives through a structured entity-relationship architecture, where each model is uniquely identified by an alphanumeric identifier such as MODE-0001 through MODE-0004 and classified by its operational focus—Opioid-Taper-Init, Insulin-Protocol-Opt, Sepsis-Protocol-V2, and Bedside-Handoff-Rev. These identifiers serve as the primary keys anchoring all downstream relationships, ensuring referential integrity across the improvement model's associations with clinical care standards and patient outcomes. The models are not isolated artifacts; they function as nodes within a directed graph of improvement activities, where each node participates in relationships that specify what clinical practices it improves and which patient outcomes it optimizes.

**t_pdsa_improvement_model**

| id | p_d_s_a_improvement_model |
| --- | --- |
| MODE-0001 | Opioid-Taper-Init |
| MODE-0002 | Insulin-Protocol-Opt |
| MODE-0003 | Sepsis-Protocol-V2 |
| MODE-0004 | Bedside-Handoff-Rev |
| MODE-0005 | Fall-Prevention-Q4 |
| MODE-0006 | Bedside-Handoff-Rev |

**t_pdsa_improvement_model_improves**

| id | improves |
| --- | --- |
| MODE-0001 | Wound-Care-Standard |
| MODE-0002 | Wound-Care-Standard |
| MODE-0003 | Hand-Hygiene-Protocol |
| MODE-0004 | Wound-Care-Standard |
| MODE-0005 | Medication-Reconciliation |
| MODE-0006 | Ventilator-Management |
| MODE-0007 | Ventilator-Management |
| MODE-0008 | Wound-Care-Standard |

**t_pdsa_improvement_model_optimizes**

| id | optimizes |
| --- | --- |
| MODE-0001 | Pain-Management-Score |
| MODE-0002 | Complication-Rate |
| MODE-0003 | Adverse-Event-Frequency |
| MODE-0004 | Functional-Recovery-Time |
| MODE-0005 | LOS-Reduction |
| MODE-0006 | Complication-Rate |

**t_process_produces_ice**

| id | process |
| --- | --- |
| ICE-0001 | Plate freezing |
| ICE-0002 | Cryogenic freezing |
| ICE-0003 | Spray cooling |
| ICE-0004 | Direct expansion freezing |
| ICE-0005 | Directional solidification |
| ICE-0006 | Spiral freezing |

The relationship model employs a subject-target paradigm mediated by a role attribute, enabling fine-grained attribution of responsibility within improvement activities. In the improvement model's association with clinical care standards, the subject column references the originating PDSA model while the target column identifies the clinical care entity being enhanced—Wound-Care-Standard and Hand-Hygiene-Protocol appear as recurring targets across multiple models, indicating that certain clinical standards serve as focal points for concurrent improvement efforts. The role attribute distinguishes between reviewer, contributor, and owner designations, establishing a governance layer that clarifies accountability: a single model such as MODE-0001 may simultaneously hold reviewer and owner roles across different relationship instances, reflecting the multi-stakeholder nature of healthcare quality initiatives.

**t_pdsa_improvement_model__improves**

| id | pdsa_id | improves_id | role |
| --- | --- | --- | --- |
| MODE-0001 | MODE-0001 | MODE-0005 | reviewer |
| MODE-0002 | MODE-0001 | MODE-0006 | contributor |
| MODE-0003 | MODE-0004 | MODE-0003 | contributor |
| MODE-0004 | MODE-0005 | MODE-0004 | owner |
| MODE-0005 | MODE-0003 | MODE-0005 | contributor |
| MODE-0006 | MODE-0003 | MODE-0002 | owner |
| MODE-0007 | MODE-0001 | MODE-0008 | owner |
| MODE-0008 | MODE-0001 | MODE-0008 | observer |

**t_pdsa_improvement_model__optimizes**

| id | pdsa_id | optimizes_id | role | cardinality_note |
| --- | --- | --- | --- | --- |
| MODE-0001 | MODE-0005 | MODE-0005 | reviewer | Cardinality Note 01 |
| MODE-0002 | MODE-0001 | MODE-0004 | owner | Cardinality Note 02 |
| MODE-0003 | MODE-0003 | MODE-0001 | contributor | Cardinality Note 03 |
| MODE-0004 | MODE-0005 | MODE-0004 | owner | Cardinality Note 04 |
| MODE-0005 | MODE-0005 | MODE-0003 | contributor | Cardinality Note 05 |
| MODE-0006 | MODE-0005 | MODE-0004 | observer | Cardinality Note 06 |
| MODE-0007 | MODE-0005 | MODE-0006 | owner | Cardinality Note 07 |
| MODE-0008 | MODE-0006 | MODE-0004 | reviewer | Cardinality Note 08 |

Patient outcome optimization follows an analogous relational structure, where each PDSA model is linked to measurable clinical endpoints including Pain-Management-Score, Complication-Rate, Adverse-Event-Frequency, and Functional-Recovery-Time. The cardinality_note column introduces a constraint dimension to these associations, with entries such as Cardinality Note 01 through Cardinality Note 04 encoding relationship multiplicity rules that govern how many outcomes a single model may target or how many models may converge on a single outcome. This cardinality metadata is essential for capacity planning and impact analysis, as it delineates whether an improvement model has a one-to-one or many-to-many relationship with patient outcomes—a distinction that directly affects resource allocation and the interpretation of outcome attribution.

Beyond the relational graph of improvement models, the system employs a flexible attribute-value pattern for capturing heterogeneous metadata across all entity types. The attr and attr_type columns define a schema for extensible properties, where attribute names such as duration_seconds, end_time, exit_code, and host_name are paired with their corresponding XML Schema types—xsd:decimal, xsd:dateTime, xsd:integer, and xsd:string—enabling type-safe storage of diverse data without requiring schema migrations. Values are materialized in dedicated typed value tables, where the entity column references the subject entity, the attr column references the attribute definition, and the value column holds the misc data in its appropriate type. For instance, duration_seconds values range from 2298.30 to 6078.60 decimal units, end_time values are ISO 8601 timestamps such as 2024-12-21T05:38:52, and string attributes capture operational states like running, initiation, and ingest-21.

**t_process_produces_ice_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ICE-0001 | duration_seconds | xsd:decimal |
| ICE-0002 | end_time | xsd:dateTime |
| ICE-0003 | exit_code | xsd:integer |
| ICE-0004 | host_name | xsd:string |
| ICE-0005 | log_level | xsd:string |
| ICE-0006 | phase | xsd:string |
| ICE-0007 | retry_count | xsd:integer |
| ICE-0008 | scheduled_at | xsd:dateTime |

**t_process_produces_ice_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ICE-0001 | ICE-0001 | ICE-0002 | 2024-12-21T05:38:52 |
| ICE-0002 | ICE-0001 | ICE-0008 | 2023-10-15T09:29:56 |
| ICE-0003 | ICE-0001 | ICE-0009 | 2023-08-06T18:23:28 |
| ICE-0004 | ICE-0002 | ICE-0002 | 2023-05-16T09:39:52 |
| ICE-0005 | ICE-0002 | ICE-0008 | 2023-09-23T10:34:19 |
| ICE-0006 | ICE-0002 | ICE-0009 | 2025-02-04T21:26:44 |
| ICE-0007 | ICE-0003 | ICE-0002 | 2023-02-04T12:13:18 |
| ICE-0008 | ICE-0003 | ICE-0008 | 2024-02-01T06:54:56 |

**t_process_produces_ice_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ICE-0001 | ICE-0001 | ICE-0001 | 5646.64 |
| ICE-0002 | ICE-0002 | ICE-0001 | 6078.60 |
| ICE-0003 | ICE-0003 | ICE-0001 | 2298.30 |
| ICE-0004 | ICE-0004 | ICE-0001 | 3884.97 |
| ICE-0005 | ICE-0005 | ICE-0001 | 5116.46 |
| ICE-0006 | ICE-0006 | ICE-0001 | 5090.16 |

**t_process_produces_ice_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ICE-0001 | ICE-0001 | ICE-0003 | 140 |
| ICE-0002 | ICE-0001 | ICE-0007 | 235 |
| ICE-0003 | ICE-0002 | ICE-0003 | 217 |
| ICE-0004 | ICE-0002 | ICE-0007 | 99 |
| ICE-0005 | ICE-0003 | ICE-0003 | 880 |
| ICE-0006 | ICE-0003 | ICE-0007 | 326 |
| ICE-0007 | ICE-0004 | ICE-0003 | 176 |
| ICE-0008 | ICE-0004 | ICE-0007 | 291 |

**t_process_produces_ice_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ICE-0001 | ICE-0001 | ICE-0004 | ingest-21 |
| ICE-0002 | ICE-0001 | ICE-0005 | Log Level 02 |
| ICE-0003 | ICE-0001 | ICE-0006 | initiation |
| ICE-0004 | ICE-0001 | ICE-0010 | running |
| ICE-0005 | ICE-0001 | ICE-0011 | Triggered By 05 |
| ICE-0006 | ICE-0002 | ICE-0004 | edge-03 |
| ICE-0007 | ICE-0002 | ICE-0005 | Log Level 07 |
| ICE-0008 | ICE-0002 | ICE-0006 | closeout |

Constraint management extends this attribute-value architecture to governance rules, where each constraint—Schema validation rule, Provenance audit requirement, Lab safety protocol—is associated with typed attributes including effective_date (xsd:date), enforcement (xsd:string), mandatory (xsd:boolean), and priority (xsd:integer). Boolean mandatory flags such as true and false determine whether a constraint is obligatory, while integer priority values ranging from 3 to 404 establish enforcement hierarchy. The constraint system further specifies what each rule constrains—Database schemas, User accounts, Storage volumes, Cloud regions—and defines on_violation consequences including Experiment halt, Access revocation, Rate throttling, and Pipeline termination, creating a complete audit trail from rule definition through enforcement action.

**t_constraint_with_violation_consequence**

| id | constraint | constrains | on_violation |
| --- | --- | --- | --- |
| CONS-0001 | Schema validation rule | Database schemas | Experiment halt |
| CONS-0002 | Provenance audit requirement | User accounts | Access revocation |
| CONS-0003 | Lab safety protocol | Storage volumes | Rate throttling |
| CONS-0004 | Lab safety protocol | Cloud regions | Pipeline termination |
| CONS-0005 | Access control matrix | Telemetry agents | Network partitioning |
| CONS-0006 | Encryption standard | Telemetry agents | Compliance flagging |

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