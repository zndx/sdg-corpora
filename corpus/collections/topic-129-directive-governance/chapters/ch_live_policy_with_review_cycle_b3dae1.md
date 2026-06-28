---
chapter_id: ch_live_policy_with_review_cycle_b3dae1
topic_id: 129
family: 03_directive_governance
cited_terms: ['policy_with_review_cycle', 'observation_records_state', 'evidence_for_audit']
model: engine-refine
---

In compliance architectures of the sort deployed by the European Bank for Reconstruction and Development in its sectoral strategies, the governance of policy review cycles, audit evidence, and operational observations rests upon a disciplined separation of identity, definition, and value. Each record—whether a policy subject to periodic review, an observation of system behaviour, or a piece of audit evidence—is assigned a unique identifier that serves as the immutable anchor for all downstream references. Identifiers such as CYCL-0001 through CYCL-0004 designate the FedRAMP, NIST SP 800-53, CCPA, and SOC 2 Type II frameworks respectively, while STAT-0001 through STAT-0004 enumerate observations ranging from network latency spikes to reactor pressure thresholds, and AUDI-0001 through AUDI-0004 catalogue evidence items including AuditTrail_20231015 and ChainOfCustody_Batch44. These identifiers are not merely labels; they are the join keys that bind the entire relational structure together, ensuring that every attribute value can be traced back to the entity it describes and, through that entity, to the policy or audit cycle it supports.

**t_observation_records_state**

| id | observation | records |
| --- | --- | --- |
| STAT-0001 | Network latency spike | AUDI-0005 |
| STAT-0002 | Water quality anomaly | AUDI-0003 |
| STAT-0003 | Reactor pressure threshold | AUDI-0003 |
| STAT-0004 | Reactor pressure threshold | AUDI-0003 |
| STAT-0005 | Network latency spike | AUDI-0004 |
| STAT-0006 | pH deviation alert | AUDI-0003 |

**t_observation_records_state_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| STAT-0001 | duration_seconds | xsd:decimal |
| STAT-0002 | end_time | xsd:dateTime |
| STAT-0003 | exit_code | xsd:integer |
| STAT-0004 | host_name | xsd:string |
| STAT-0005 | log_level | xsd:string |
| STAT-0006 | phase | xsd:string |
| STAT-0007 | retry_count | xsd:integer |
| STAT-0008 | scheduled_at | xsd:dateTime |

**t_observation_records_state_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| STAT-0001 | STAT-0001 | STAT-0003 | 958 |
| STAT-0002 | STAT-0001 | STAT-0007 | 456 |
| STAT-0003 | STAT-0002 | STAT-0003 | 517 |
| STAT-0004 | STAT-0002 | STAT-0007 | 41 |
| STAT-0005 | STAT-0003 | STAT-0003 | 930 |
| STAT-0006 | STAT-0003 | STAT-0007 | 257 |
| STAT-0007 | STAT-0004 | STAT-0003 | 71 |
| STAT-0008 | STAT-0004 | STAT-0007 | 485 |

**t_observation_records_state_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| STAT-0001 | STAT-0001 | STAT-0004 | worker-07 |
| STAT-0002 | STAT-0001 | STAT-0005 | Log Level 02 |
| STAT-0003 | STAT-0001 | STAT-0006 | execution |
| STAT-0004 | STAT-0001 | STAT-0010 | pending |
| STAT-0005 | STAT-0001 | STAT-0011 | Triggered By 05 |
| STAT-0006 | STAT-0002 | STAT-0004 | node-a01 |
| STAT-0007 | STAT-0002 | STAT-0005 | Log Level 07 |
| STAT-0008 | STAT-0002 | STAT-0006 | closeout |

**t_evidence_for_audit**

| id | evidence |
| --- | --- |
| AUDI-0001 | AuditTrail_20231015 |
| AUDI-0002 | ChainOfCustody_Batch44 |
| AUDI-0003 | ChainOfCustody_Batch44 |
| AUDI-0004 | SignatureBlock_99A1 |
| AUDI-0005 | NetworkPacketCapture_0xFF |
| AUDI-0006 | AuditTrail_20231015 |

**t_evidence_for_audit_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| AUDI-0001 | confidence | xsd:decimal |
| AUDI-0002 | dimension_kind | xsd:string |
| AUDI-0003 | method | xsd:string |
| AUDI-0004 | recorded_at | xsd:dateTime |
| AUDI-0005 | uncertainty | xsd:decimal |
| AUDI-0006 | unit | xsd:string |
| AUDI-0007 | value | xsd:decimal |
| AUDI-0008 | encoding | xsd:string |

**t_evidence_for_audit_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AUDI-0001 | AUDI-0001 | AUDI-0004 | 2024-10-15T21:07:57 |
| AUDI-0002 | AUDI-0002 | AUDI-0004 | 2024-11-22T11:38:19 |
| AUDI-0003 | AUDI-0003 | AUDI-0004 | 2023-06-03T22:32:06 |
| AUDI-0004 | AUDI-0004 | AUDI-0004 | 2024-07-15T05:43:09 |
| AUDI-0005 | AUDI-0005 | AUDI-0004 | 2024-03-30T03:15:54 |
| AUDI-0006 | AUDI-0006 | AUDI-0004 | 2024-06-18T04:52:41 |

**t_evidence_for_audit_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AUDI-0001 | AUDI-0001 | AUDI-0001 | 0.978 |
| AUDI-0002 | AUDI-0001 | AUDI-0005 | 590.71 |
| AUDI-0003 | AUDI-0001 | AUDI-0007 | 212.01 |
| AUDI-0004 | AUDI-0002 | AUDI-0001 | 0.546 |
| AUDI-0005 | AUDI-0002 | AUDI-0005 | 882.77 |
| AUDI-0006 | AUDI-0002 | AUDI-0007 | 90.06 |
| AUDI-0007 | AUDI-0003 | AUDI-0001 | 0.051 |
| AUDI-0008 | AUDI-0003 | AUDI-0005 | 692.35 |

**t_evidence_for_audit_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AUDI-0001 | AUDI-0001 | AUDI-0002 | Dimension Kind 01 |
| AUDI-0002 | AUDI-0001 | AUDI-0008 | Encoding 02 |
| AUDI-0003 | AUDI-0001 | AUDI-0009 | intake form |
| AUDI-0004 | AUDI-0001 | AUDI-0010 | fr |
| AUDI-0005 | AUDI-0001 | AUDI-0003 | automated |
| AUDI-0006 | AUDI-0001 | AUDI-0006 | count |
| AUDI-0007 | AUDI-0002 | AUDI-0002 | Dimension Kind 07 |
| AUDI-0008 | AUDI-0002 | AUDI-0008 | Encoding 08 |

Attributes and their types constitute the definitional layer that gives meaning to the values stored against each entity. An attribute name—duration_seconds, end_time, exit_code, host_name in the case of observation records, or confidence, dimension_kind, method, recorded_at for audit evidence—specifies what dimension of the entity is being captured, while the attribute type—xsd:decimal, xsd:dateTime, xsd:integer, xsd:string—constrains the domain of permissible values. This separation of schema from data is essential in compliance contexts where the set of measurable properties may evolve without restructuring the underlying records. The type system ensures that a value such as 4243.13, recorded against the duration_seconds attribute, is stored in the decimal value table and validated against xsd:decimal, while a timestamp like 2023-08-02T17:44:58, associated with the end_time attribute, resides in the datetime value table under xsd:dateTime. The integrity of this typed partitioning is what allows auditors to query for specific attribute types across heterogeneous entities without ambiguity.

**t_observation_records_state_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| STAT-0001 | STAT-0001 | STAT-0002 | 2023-08-02T17:44:58 |
| STAT-0002 | STAT-0001 | STAT-0008 | 2025-03-10T03:55:42 |
| STAT-0003 | STAT-0001 | STAT-0009 | 2024-08-16T12:27:34 |
| STAT-0004 | STAT-0002 | STAT-0002 | 2024-01-02T12:08:53 |
| STAT-0005 | STAT-0002 | STAT-0008 | 2024-04-22T02:15:44 |
| STAT-0006 | STAT-0002 | STAT-0009 | 2025-02-09T01:29:13 |
| STAT-0007 | STAT-0003 | STAT-0002 | 2023-02-01T11:57:40 |
| STAT-0008 | STAT-0003 | STAT-0008 | 2023-09-23T07:16:43 |

**t_observation_records_state_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| STAT-0001 | STAT-0001 | STAT-0001 | 4243.13 |
| STAT-0002 | STAT-0002 | STAT-0001 | 4365.77 |
| STAT-0003 | STAT-0003 | STAT-0001 | 5274.11 |
| STAT-0004 | STAT-0004 | STAT-0001 | 1567.00 |
| STAT-0005 | STAT-0005 | STAT-0001 | 420.59 |
| STAT-0006 | STAT-0006 | STAT-0001 | 6894.95 |

The entity column in the value tables serves as the foreign key that reattaches typed values to their parent records, completing the entity-attribute-value triad. For observation records, entity_id values such as STAT-0001 and STAT-0002 link back to the corresponding observation entries, while for audit evidence, entity_id values such as AUDI-0001 and AUDI-0002 perform the same function. The attr_id column, meanwhile, references the attribute definition, ensuring that the value 958 stored against attr_id STAT-0003 is correctly interpreted as an exit_code of type xsd:integer, and that the string worker-07 stored against attr_id STAT-0004 is understood as a host_name of type xsd:string. This two-level indirection—entity to attribute to value—provides the flexibility required to accommodate diverse compliance data without imposing a rigid, monolithic schema.

Beyond the structural mechanics of attributes and values, the governance framework incorporates metadata dimensions that govern the applicability and interpretation of policies. The scope attribute distinguishes between local, team, and regional policy applicability, with FedRAMP and NIST SP 800-53 scoped to local and team levels respectively, while CCPA and SOC 2 Type II are designated as regional. The language attribute records the linguistic context of each policy, with Japanese (ja) assigned to FedRAMP and NIST SP 800-53, and French (fr) to CCPA. These dimensions are not merely descriptive; they determine which stakeholders are responsible for review, which regulatory jurisdictions apply, and which translations or localisations of policy documentation must be maintained.

**t_policy_with_review_cycle**

| id | policy | review_cycle | scope | language |
| --- | --- | --- | --- | --- |
| CYCL-0001 | FedRAMP | AUDI-0002 | local | ja |
| CYCL-0002 | NIST SP 800-53 | AUDI-0005 | team | ja |
| CYCL-0003 | CCPA | AUDI-0004 | regional | fr |
| CYCL-0004 | SOC 2 Type II | AUDI-0005 | regional | ja |
| CYCL-0005 | GDPR | AUDI-0002 | global | ja |
| CYCL-0006 | FedRAMP | AUDI-0005 | global | fr |
| CYCL-0007 | SOC 2 Type II | AUDI-0001 | global | ja |
| CYCL-0008 | CCPA | AUDI-0004 | local | ja |

The cross-referencing between policies, observations, and audit evidence establishes the traceability chain that compliance frameworks require. A policy such as NIST SP 800-53 carries a review_cycle reference to AUDI-0005, while an observation like Reactor pressure threshold carries a records reference to AUDI-0003, which in turn corresponds to the evidence item ChainOfCustody_Batch44. Audit evidence items themselves carry typed attributes: the confidence attribute, of type xsd:decimal, holds values such as 0.978 for AuditTrail_20231015 and 0.546 for the evidence linked to AUDI-0002; the recorded_at attribute, of type xsd:dateTime, captures timestamps ranging from 2023-06-03T22:32:06 to 2024-11-22T11:38:19; and the dimension_kind attribute, of type xsd:string, holds values such as Dimension Kind 01. This layered structure—where policies reference audit cycles, observations reference audit records, and audit records carry their own attributes and values—creates a complete audit trail from regulatory requirement through operational observation to evidentiary support.