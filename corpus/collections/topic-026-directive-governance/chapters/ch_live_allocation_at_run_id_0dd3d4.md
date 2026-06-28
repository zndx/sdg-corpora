---
chapter_id: ch_live_allocation_at_run_id_0dd3d4
topic_id: 26
family: 05_provo_lineage
cited_terms: ['allocation_at_run_id', 'mass_function_min_one_focal', 'settlement_financing_activity']
model: engine-refine
---

In operational data governance, computational workloads are tracked through a layered allocation model that binds resource assignments to execution contexts. Each allocation—such as `batch-etl-override`, `model-training-v3`, `data-sync-nightly`, or `ml-inference-run`—represents a distinct resource commitment, while run identifiers like `exec-token-4491`, `job-context-99a`, `tx-id-7721b`, and `run-7a2b4c1d` capture the runtime context in which that allocation is exercised. The relationship between allocations and run identifiers is not one-to-one; instead, a junction table mediates a many-to-many association, attaching a role—`observer` or `reviewer`—to each pairing. This role metadata enables audit trails that distinguish between entities passively monitoring a run and those actively reviewing its outcomes, a distinction critical for compliance frameworks that require clear delineation of responsibility across distributed data pipelines.

**t_allocation_at_run_id**

| id | allocation |
| --- | --- |
| RUN-0001 | batch-etl-override |
| RUN-0002 | model-training-v3 |
| RUN-0003 | data-sync-nightly |
| RUN-0004 | ml-inference-run |
| RUN-0005 | ml-inference-run |
| RUN-0006 | batch-etl-override |
| RUN-0007 | ml-inference-run |

**t_allocation_at_run_id_at_run_identifier**

| id | at_run_identifier |
| --- | --- |
| RUN-0001 | exec-token-4491 |
| RUN-0002 | job-context-99a |
| RUN-0003 | tx-id-7721b |
| RUN-0004 | run-7a2b4c1d |
| RUN-0005 | run-hash-66d |
| RUN-0006 | epoch-tag-8812 |
| RUN-0007 | pipeline-run-zeta |
| RUN-0008 | job-context-99a |

**t_allocation_at_run_id__at_run_identifier**

| id | allocation_id | at_run_identifier_id | role |
| --- | --- | --- | --- |
| RUN-0001 | RUN-0001 | RUN-0003 | observer |
| RUN-0002 | RUN-0004 | RUN-0007 | reviewer |
| RUN-0003 | RUN-0003 | RUN-0004 | observer |
| RUN-0004 | RUN-0005 | RUN-0001 | observer |
| RUN-0005 | RUN-0007 | RUN-0002 | contributor |
| RUN-0006 | RUN-0007 | RUN-0001 | reviewer |
| RUN-0007 | RUN-0003 | RUN-0005 | owner |
| RUN-0008 | RUN-0007 | RUN-0004 | contributor |

Evidence and provenance are captured through a mass-function model that associates focal elements with quantified support. Each focal element—`calibration_status`, `user_agent`, or `data_quality_flag`—is assigned a mass value such as `audit_trail_eta`, `provenance_record_epsilon`, or `sensor_array_gamma`, reflecting the degree of evidential support for that element within a belief structure. This approach, rooted in evidence theory, allows the system to represent uncertainty and partial knowledge rather than forcing binary truth assignments. The mass function entities are extensible: their attributes are defined in a separate registry that specifies both the attribute name and its type, using standard XML Schema datatypes such as `xsd:decimal`, `xsd:string`, and `xsd:dateTime`. This separation of attribute schema from attribute values enables the system to evolve its provenance model without schema migrations.

Attribute values are stored in a type-dispatched entity-attribute-value pattern, with dedicated tables for datetime, decimal, and varchar values. A single entity, such as `FOCA-0001`, can carry multiple attributes of different types: a decimal confidence score of `0.223`, a string dimension kind of `Dimension Kind 01`, a recorded timestamp of `2023-06-19T06:37:58`, and a calibration record value of `calibration record`. The entity identifier serves as the foreign key linking back to the mass function focal element, while the attribute identifier references the attribute definition in the schema table. This design ensures type safety at query time while preserving the flexibility to add new provenance attributes without altering the underlying table structure.

**t_mass_function_min_one_focal**

| id | mass | focal_element |
| --- | --- | --- |
| FOCA-0001 | audit_trail_eta | calibration_status |
| FOCA-0002 | audit_trail_eta | calibration_status |
| FOCA-0003 | provenance_record_epsilon | user_agent |
| FOCA-0004 | sensor_array_gamma | data_quality_flag |
| FOCA-0005 | governance_log_delta | network_latency |
| FOCA-0006 | provenance_record_epsilon | location_geo |

**t_mass_function_min_one_focal_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| FOCA-0001 | confidence | xsd:decimal |
| FOCA-0002 | dimension_kind | xsd:string |
| FOCA-0003 | method | xsd:string |
| FOCA-0004 | recorded_at | xsd:dateTime |
| FOCA-0005 | uncertainty | xsd:decimal |
| FOCA-0006 | unit | xsd:string |
| FOCA-0007 | value | xsd:decimal |
| FOCA-0008 | encoding | xsd:string |

**t_mass_function_min_one_focal_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| FOCA-0001 | FOCA-0001 | FOCA-0004 | 2023-06-19T06:37:58 |
| FOCA-0002 | FOCA-0002 | FOCA-0004 | 2023-01-26T15:54:26 |
| FOCA-0003 | FOCA-0003 | FOCA-0004 | 2024-04-19T20:46:34 |
| FOCA-0004 | FOCA-0004 | FOCA-0004 | 2023-08-08T03:21:21 |
| FOCA-0005 | FOCA-0005 | FOCA-0004 | 2023-12-10T16:04:01 |
| FOCA-0006 | FOCA-0006 | FOCA-0004 | 2024-10-11T01:06:45 |

**t_mass_function_min_one_focal_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| FOCA-0001 | FOCA-0001 | FOCA-0001 | 0.223 |
| FOCA-0002 | FOCA-0001 | FOCA-0005 | 391.04 |
| FOCA-0003 | FOCA-0001 | FOCA-0007 | 110.73 |
| FOCA-0004 | FOCA-0002 | FOCA-0001 | 0.161 |
| FOCA-0005 | FOCA-0002 | FOCA-0005 | 309.80 |
| FOCA-0006 | FOCA-0002 | FOCA-0007 | 695.08 |
| FOCA-0007 | FOCA-0003 | FOCA-0001 | 0.178 |
| FOCA-0008 | FOCA-0003 | FOCA-0005 | 14.20 |

**t_mass_function_min_one_focal_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| FOCA-0001 | FOCA-0001 | FOCA-0002 | Dimension Kind 01 |
| FOCA-0002 | FOCA-0001 | FOCA-0008 | Encoding 02 |
| FOCA-0003 | FOCA-0001 | FOCA-0009 | calibration record |
| FOCA-0004 | FOCA-0001 | FOCA-0010 | es |
| FOCA-0005 | FOCA-0001 | FOCA-0003 | hybrid |
| FOCA-0006 | FOCA-0001 | FOCA-0006 | ratio |
| FOCA-0007 | FOCA-0002 | FOCA-0002 | Dimension Kind 07 |
| FOCA-0008 | FOCA-0002 | FOCA-0008 | Encoding 08 |

Settlement financing activities form the operational backbone of inter-institutional financial clearing. Each activity—`T-PLUS-ONE-CLEAR`, `INTERBANK-SETTLE`, `CASH-SETTLE-99`, or `SEC-SETTLE-8812`—is associated with a funding institution such as `HSBC Holdings`, `Goldman Sachs`, or `Deutsche Bank AG`, and linked to a settlement project like `SWIFT GPI Rollout`, `Regional Clearing Hub`, or `Cross-Border Rail`. The financial institution column identifies the source of capital, while the benefits column captures the downstream project or initiative that receives the settlement proceeds. This tripartite structure—activity, funder, and beneficiary—provides a complete audit trail for regulatory reporting, enabling institutions to trace the flow of funds from clearing event through to project allocation.

**t_settlement_financing_activity**

| id | settlement_financing_activity | funds | benefits |
| --- | --- | --- | --- |
| ACTI-0001 | T-PLUS-ONE-CLEAR | HSBC Holdings | SWIFT GPI Rollout |
| ACTI-0002 | INTERBANK-SETTLE | Goldman Sachs | Regional Clearing Hub |
| ACTI-0003 | CASH-SETTLE-99 | Deutsche Bank AG | SWIFT GPI Rollout |
| ACTI-0004 | SEC-SETTLE-8812 | Deutsche Bank AG | Cross-Border Rail |
| ACTI-0005 | CASH-SETTLE-99 | Deutsche Bank AG | Cross-Border Rail |