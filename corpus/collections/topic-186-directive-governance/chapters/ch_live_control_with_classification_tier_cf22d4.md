---
chapter_id: ch_live_control_with_classification_tier_cf22d4
topic_id: 186
family: 03_directive_governance
cited_terms: ['control_with_classification_tier', 'requirement_under_standard', 'belief_interval_subclass']
model: engine-refine
---

In compliance and governance frameworks, the ability to attach rich, typed metadata to discrete entities is foundational to auditability and enforcement. Controls such as "Input sanitization," "Role based access," "Encryption at rest," and "Session expiration" each carry a suite of attributes—effective dates, enforcement modes, mandatory flags, and priority levels—that define their operational scope and regulatory standing. These attributes are not ad hoc; they are declared with explicit types drawn from the XML Schema definition space, including `xsd:date` for temporal applicability, `xsd:string` for categorical descriptors, `xsd:boolean` for binary mandates, and `xsd:integer` for quantitative thresholds. This type discipline ensures that every value attached to a control is semantically coherent and machine-processable, enabling automated validation and consistent interpretation across systems.

The entity-attribute-value (EAV) pattern underpins this metadata architecture, decoupling the definition of what can be measured from the actual measurements themselves. An entity—identified by a stable key such as `TIER-0001` or `STAN-0001`—serves as the anchor point to which attribute values are affixed. For instance, the control `TIER-0001` (Input sanitization) carries an effective date of `2023-02-10`, a mandatory flag set to `false`, and a priority value of `2`, while `TIER-0002` (Role based access) is marked mandatory with a priority of `715`. The same structural pattern applies to requirements under standards: `STAN-0001` (Minimum sampling rate) has an effective date of `2024-02-08`, is mandatory, and carries a priority of `3`. By separating attribute definitions from their values, the framework supports dynamic schema evolution—new attributes can be introduced without altering the entity table, and values can be updated independently of their type declarations.

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

**t_requirement_under_standard_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| STAN-0001 | effective_date | xsd:date |
| STAN-0002 | enforcement | xsd:string |
| STAN-0003 | mandatory | xsd:boolean |
| STAN-0004 | priority | xsd:integer |
| STAN-0005 | review_cycle_days | xsd:integer |
| STAN-0006 | scope | xsd:string |
| STAN-0007 | encoding | xsd:string |
| STAN-0008 | label_text | xsd:string |

**t_requirement_under_standard_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| STAN-0001 | STAN-0001 | STAN-0003 | true |
| STAN-0002 | STAN-0002 | STAN-0003 | true |
| STAN-0003 | STAN-0003 | STAN-0003 | true |
| STAN-0004 | STAN-0004 | STAN-0003 | false |
| STAN-0005 | STAN-0005 | STAN-0003 | false |
| STAN-0006 | STAN-0006 | STAN-0003 | true |

**t_requirement_under_standard_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| STAN-0001 | STAN-0001 | STAN-0001 | 2024-02-08 |
| STAN-0002 | STAN-0002 | STAN-0001 | 2024-03-15 |
| STAN-0003 | STAN-0003 | STAN-0001 | 2024-09-13 |
| STAN-0004 | STAN-0004 | STAN-0001 | 2023-09-30 |
| STAN-0005 | STAN-0005 | STAN-0001 | 2025-02-13 |
| STAN-0006 | STAN-0006 | STAN-0001 | 2025-01-10 |

**t_requirement_under_standard_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| STAN-0001 | STAN-0001 | STAN-0004 | 3 |
| STAN-0002 | STAN-0001 | STAN-0005 | 224 |
| STAN-0003 | STAN-0002 | STAN-0004 | 4 |
| STAN-0004 | STAN-0002 | STAN-0005 | 622 |
| STAN-0005 | STAN-0003 | STAN-0004 | 1 |
| STAN-0006 | STAN-0003 | STAN-0005 | 177 |
| STAN-0007 | STAN-0004 | STAN-0004 | 5 |
| STAN-0008 | STAN-0004 | STAN-0005 | 817 |

**t_requirement_under_standard_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| STAN-0001 | STAN-0001 | STAN-0007 | Encoding 01 |
| STAN-0002 | STAN-0001 | STAN-0002 | Enforcement 02 |
| STAN-0003 | STAN-0001 | STAN-0008 | audit excerpt |
| STAN-0004 | STAN-0001 | STAN-0009 | de |
| STAN-0005 | STAN-0001 | STAN-0006 | Scope 05 |
| STAN-0006 | STAN-0002 | STAN-0007 | Encoding 06 |
| STAN-0007 | STAN-0002 | STAN-0002 | Enforcement 07 |
| STAN-0008 | STAN-0002 | STAN-0008 | nightly summary |

Values are partitioned by type into dedicated storage tables, each enforcing the constraints of its declared attribute type. Boolean values—such as the mandatory flag for `TIER-0001` being `false` versus `TIER-0002` being `true`—reside in a type-specific table that guarantees type safety. Date values like `2024-01-29` and `2024-02-25` are stored in a separate table, preserving temporal integrity. Integer values span a wide range, from a low priority of `2` for `TIER-0001` to a high priority of `715` for the same entity, and from `3` to `622` across requirement entities. String values capture free-form and coded descriptors alike: "audit excerpt," "Encoding 01," "Enforcement 02," and locale codes such as `en` and `de`. This type-partitioned storage prevents type confusion and enables efficient querying by value category.

Beyond the entity-attribute-value model, the framework employs a subject-target-role relationship structure to express how belief intervals and their lower bounds interconnect. In this triadic relationship, a subject—such as a belief entity identified by `INTE-0001` (Sensor calibration drift) or `INTE-0002` (Model convergence state)—is linked to a target, which is a belief lower bound entity carrying bounds like "0.85 probability" or "Three sigma limit." The role column specifies the nature of the link: a subject may act as a "contributor" to a lower bound, or as its "owner." For example, `INTE-0001` serves as a contributor to lower bound `INTE-0002`, while `INTE-0002` owns lower bound `INTE-0008`. This role-aware linking enables nuanced provenance tracking, where the same lower bound can be associated with multiple subjects in different capacities, supporting audit trails that distinguish between primary ownership and secondary contribution.

**t_belief_interval_subclass**

| id | belief |
| --- | --- |
| INTE-0001 | Sensor calibration drift |
| INTE-0002 | Model convergence state |
| INTE-0003 | Model convergence state |
| INTE-0004 | Sensor calibration drift |
| INTE-0005 | Data ingestion rate |
| INTE-0006 | Reagent shelf life |

**t_belief_interval_subclass_belief_lower_bound**

| id | belief_lower_bound |
| --- | --- |
| INTE-0001 | 0.85 probability |
| INTE-0002 | Three sigma limit |
| INTE-0003 | ISO ninety eight |
| INTE-0004 | 95 percent threshold |
| INTE-0005 | 99.9 percent uptime |
| INTE-0006 | 0.85 probability |
| INTE-0007 | 128 megabytes |
| INTE-0008 | 256 units |

**t_belief_interval_subclass__belief_lower_bound**

| id | belief_id | belief_lower_bound_id | role |
| --- | --- | --- | --- |
| INTE-0001 | INTE-0004 | INTE-0008 | contributor |
| INTE-0002 | INTE-0005 | INTE-0006 | owner |
| INTE-0003 | INTE-0001 | INTE-0002 | contributor |
| INTE-0004 | INTE-0002 | INTE-0008 | owner |
| INTE-0005 | INTE-0006 | INTE-0001 | contributor |
| INTE-0006 | INTE-0002 | INTE-0008 | reviewer |
| INTE-0007 | INTE-0001 | INTE-0006 | owner |
| INTE-0008 | INTE-0005 | INTE-0007 | contributor |

The cross-cutting nature of this metadata model becomes evident when requirements are mapped to standards. A requirement such as "Access control policy" (`STAN-0004`) sits under standard `INTE-0002` (Model convergence state), while "Provenance tracking" (`STAN-0003`) falls under `INTE-0004` (Sensor calibration drift). Each requirement inherits the same attribute-value machinery as controls, carrying its own effective dates, enforcement modes, mandatory flags, and priority levels. This uniformity means that compliance officers can query across the entire framework—controls, requirements, and standards—using a consistent metadata vocabulary, enabling holistic assessments of coverage, gaps, and enforcement posture. The identifier system (`TIER-*` for controls, `STAN-*` for requirements, `INTE-*` for standards and beliefs) provides a clear namespace that prevents collisions and supports hierarchical reasoning about which standards govern which requirements, and which controls implement which requirements.

**t_requirement_under_standard**

| id | requirement | under_standard |
| --- | --- | --- |
| STAN-0001 | Minimum sampling rate | INTE-0004 |
| STAN-0002 | Quality threshold | INTE-0002 |
| STAN-0003 | Provenance tracking | INTE-0004 |
| STAN-0004 | Access control policy | INTE-0002 |
| STAN-0005 | Provenance tracking | INTE-0002 |
| STAN-0006 | Access control policy | INTE-0001 |