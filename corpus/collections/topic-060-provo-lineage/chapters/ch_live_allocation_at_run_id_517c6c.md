---
chapter_id: ch_live_allocation_at_run_id_517c6c
topic_id: 60
family: 05_provo_lineage
cited_terms: ['allocation_at_run_id', 'policy_subclass', 'pignistic_transformation']
model: engine-refine
---

Policy attributes are modelled through a disciplined separation of definition and instantiation: the attribute catalogue enumerates properties such as `effective_date`, `enforcement`, `mandatory`, and `priority`, each bound to a precise type—`xsd:date`, `xsd:string`, `xsd:boolean`, or `xsd:integer`—while the corresponding value tables materialise those definitions as concrete assignments. A policy identified as `POLI-0001` (the Telemetry Privacy Standard, which governs Data Lakes) carries an `effective_date` of `2023-01-31`, a `mandatory` flag set to `false`, a `priority` of `1`, and a varchar attribute yielding values like `Encoding 01` and `nightly summary`; the same policy also references an `enforcement` attribute whose value is `Enforcement 02`. The type-disaggregated value tables—boolean, date, integer, and varchar—each receive an `entity_id` pointing to the policy, an `attr_id` pointing to the attribute definition, and a `value` column that holds the miscellany of actual data, ensuring that type safety is enforced at the schema level while preserving the flexibility to attach heterogeneous metadata to any governed entity.

**t_policy_subclass_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0003 | false |
| POLI-0002 | POLI-0002 | POLI-0003 | true |
| POLI-0003 | POLI-0003 | POLI-0003 | true |
| POLI-0004 | POLI-0004 | POLI-0003 | false |
| POLI-0005 | POLI-0005 | POLI-0003 | true |
| POLI-0006 | POLI-0006 | POLI-0003 | false |

**t_policy_subclass_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0001 | 2023-01-31 |
| POLI-0002 | POLI-0002 | POLI-0001 | 2024-06-17 |
| POLI-0003 | POLI-0003 | POLI-0001 | 2023-06-01 |
| POLI-0004 | POLI-0004 | POLI-0001 | 2024-01-12 |
| POLI-0005 | POLI-0005 | POLI-0001 | 2024-07-01 |
| POLI-0006 | POLI-0006 | POLI-0001 | 2023-07-28 |

**t_policy_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0007 | Encoding 01 |
| POLI-0002 | POLI-0001 | POLI-0002 | Enforcement 02 |
| POLI-0003 | POLI-0001 | POLI-0008 | nightly summary |
| POLI-0004 | POLI-0001 | POLI-0009 | fr |
| POLI-0005 | POLI-0001 | POLI-0006 | Scope 05 |
| POLI-0006 | POLI-0002 | POLI-0007 | Encoding 06 |
| POLI-0007 | POLI-0002 | POLI-0002 | Enforcement 07 |
| POLI-0008 | POLI-0002 | POLI-0008 | audit excerpt |

The governance scope of each policy is articulated through a `governs` column that names the target domain—Data Lakes, Research Archives, Sensor Networks, API Gateways—thereby establishing a declarative mapping between regulatory instrument and operational asset. This mapping is not merely descriptive; it underpins the attribution mechanism by which attributes are scoped to the entities they regulate. When a boolean attribute such as `mandatory` is evaluated, the value `true` for `POLI-0003` (the Data Retention Policy governing Sensor Networks) signals a binding constraint, whereas the same attribute set to `false` for `POLI-0001` indicates an advisory posture. The integer `priority` values—`1` and `3` for `POLI-0001`, `740` and `958` for `POLI-0002` (Provenance Directive)—provide a quantitative ordering that can be consumed by enforcement engines without requiring ad-hoc interpretation.

Beyond policy attributes, the same relational architecture supports allocation and transformation relationships through a subject–target–role triad. In the allocation domain, identifiers such as `RUN-0001` through `RUN-0004` anchor allocation records whose descriptive values—`batch-etl-override`, `model-training-v3`, `data-sync-nightly`, `ml-inference-run`—are linked to execution identifiers like `exec-token-4491`, `job-context-99a`, `tx-id-7721b`, and `run-7a2b4c1d` via a join table that assigns each pairing a `role` of either `observer` or `reviewer`. The join table's composite key structure, with `allocation_id` as the subject and `at_run_identifier_id` as the target, enforces referential integrity while the role column captures the semantic relationship between the two entities. A single allocation may thus participate in multiple relationships, each distinguished by its role and its target identifier.

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

**t_policy_subclass**

| id | policy | governs |
| --- | --- | --- |
| POLI-0001 | Telemetry Privacy Standard | Data Lakes |
| POLI-0002 | Provenance Directive | Research Archives |
| POLI-0003 | Data Retention Policy | Sensor Networks |
| POLI-0004 | Metadata Governance | API Gateways |
| POLI-0005 | Telemetry Privacy Standard | Telemetry Streams |
| POLI-0006 | Provenance Directive | Sensor Networks |

**t_pignistic_transformation**

| id | pignistic |
| --- | --- |
| TRAN-0001 | diagnostic confidence matrix |
| TRAN-0002 | telemetry belief assignment |
| TRAN-0003 | anomaly likelihood set |
| TRAN-0004 | diagnostic confidence matrix |
| TRAN-0005 | predictive uncertainty record |
| TRAN-0006 | anomaly likelihood set |
| TRAN-0007 | anomaly likelihood set |
| TRAN-0008 | telemetry belief assignment |

**t_pignistic_transformation_pignistic_transform**

| id | pignistic_transform |
| --- | --- |
| TRAN-0001 | pignistic probability distribution |
| TRAN-0002 | transformed belief state |
| TRAN-0003 | transformed belief state |
| TRAN-0004 | betting probability set |
| TRAN-0005 | risk probability assignment |
| TRAN-0006 | decision support distribution |
| TRAN-0007 | betting probability set |
| TRAN-0008 | transformed belief state |

**t_pignistic_transformation__pignistic_transform**

| id | pignistic_id | pignistic_transform_id | role |
| --- | --- | --- | --- |
| TRAN-0001 | TRAN-0008 | TRAN-0005 | reviewer |
| TRAN-0002 | TRAN-0006 | TRAN-0003 | reviewer |
| TRAN-0003 | TRAN-0005 | TRAN-0006 | contributor |
| TRAN-0004 | TRAN-0005 | TRAN-0002 | reviewer |
| TRAN-0005 | TRAN-0006 | TRAN-0002 | owner |
| TRAN-0006 | TRAN-0003 | TRAN-0008 | reviewer |
| TRAN-0007 | TRAN-0007 | TRAN-0005 | observer |
| TRAN-0008 | TRAN-0008 | TRAN-0008 | reviewer |

The pignistic transformation tables mirror this pattern with identical structural intent. Transformations identified as `TRAN-0001` through `TRAN-0004` carry descriptive labels—`diagnostic confidence matrix`, `telemetry belief assignment`, `anomaly likelihood set`—and are associated with transformed states such as `pignistic probability distribution` and `transformed belief state`. The join table `t_pignistic_transformation__pignistic_transform` links a `pignistic_id` (subject) to a `pignistic_transform_id` (target) with a `role` that is uniformly `reviewer` or `contributor` across the observed rows. This uniformity suggests a governance convention: transformations are reviewed before contribution, and the role column encodes the stage of the workflow rather than a permanent property of the entities involved.

Across all three domains—policy attributes, allocation relationships, and transformation linkages—the vocabulary of `identifier`, `entity`, `attr`, `attr_type`, `misc`, `subject`, `target`, and `role` constitutes a minimal but complete ontology for relational governance. The `identifier` is the stable key that survives cross-table references; the `entity` is the instance to which attributes are bound; the `attr` and `attr_type` pair defines what can be measured and how; the `misc` column absorbs the actual value without imposing type constraints at the storage level; the `subject` and `target` delimit the endpoints of a relationship; and the `role` annotates the nature of that relationship. Together, they form a schema that is at once rigid in its referential discipline and flexible in its capacity to express heterogeneous metadata, governance scope, and workflow semantics within a single relational framework.

**t_policy_subclass_attr**

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

**t_policy_subclass_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0004 | 1 |
| POLI-0002 | POLI-0001 | POLI-0005 | 740 |
| POLI-0003 | POLI-0002 | POLI-0004 | 3 |
| POLI-0004 | POLI-0002 | POLI-0005 | 958 |
| POLI-0005 | POLI-0003 | POLI-0004 | 5 |
| POLI-0006 | POLI-0003 | POLI-0005 | 462 |
| POLI-0007 | POLI-0004 | POLI-0004 | 5 |
| POLI-0008 | POLI-0004 | POLI-0005 | 496 |