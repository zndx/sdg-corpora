---
chapter_id: ch_live_policy_equiv_jurisdiction_and_scope_214d01
topic_id: 128
family: 03_directive_governance
cited_terms: ['policy_equiv_jurisdiction_and_scope', 'belief_interval_subclass', 'constraint_subclass']
model: engine-refine
---

In relational data models that track cross-domain associations, the structural vocabulary of identifier, subject, target, role, cardinality note, priority, and review cycle days constitutes the foundational grammar of relationship metadata. An identifier serves as the immutable key that anchors every entity and every relationship instance—values such as SCOP-0001, CONS-0003, or INTE-0002 function as the primary keys that guarantee referential integrity across the model. The subject and target columns, by contrast, encode the directional linkage between two distinct entities: a policy record references a jurisdiction record, a belief interval references a lower-bound constraint, a policy references a governing scope. These are not arbitrary pairings but semantically typed edges in a graph of dependencies, where the subject is the originating entity and the target is the entity being referenced or constrained. The role column further qualifies the nature of that linkage—contributor, observer, owner, reviewer—each value signaling a distinct governance posture. A policy may act as the owner of a jurisdiction relationship, while another policy assumes the role of observer, and a belief interval may designate its lower-bound association as either contributor or owner, thereby encoding not merely that a relationship exists but what capacity in which it operates.

**t_policy_equiv_jurisdiction_and_scope**

| id | policy |
| --- | --- |
| SCOP-0001 | AI Model Training |
| SCOP-0002 | Personal Data Processing |
| SCOP-0003 | Supply Chain Logistics |
| SCOP-0004 | Third Party Vendors |
| SCOP-0005 | Cross Border Transfers |
| SCOP-0006 | European Commission |

**t_policy_equiv_jurisdiction_and_scope_jurisdiction**

| id | jurisdiction |
| --- | --- |
| SCOP-0001 | FDA 21 CFR 11 |
| SCOP-0002 | UK Information Commissioner |
| SCOP-0003 | Industrial Control Systems |
| SCOP-0004 | CCPA |
| SCOP-0005 | UK Information Commissioner |
| SCOP-0006 | National Institute of Standards |

**t_policy_equiv_jurisdiction_and_scope__jurisdiction**

| id | policy_id | jurisdiction_id | role |
| --- | --- | --- | --- |
| SCOP-0001 | SCOP-0001 | SCOP-0002 | contributor |
| SCOP-0002 | SCOP-0001 | SCOP-0001 | observer |
| SCOP-0003 | SCOP-0001 | SCOP-0002 | observer |
| SCOP-0004 | SCOP-0002 | SCOP-0006 | owner |
| SCOP-0005 | SCOP-0003 | SCOP-0005 | contributor |
| SCOP-0006 | SCOP-0004 | SCOP-0002 | owner |
| SCOP-0007 | SCOP-0006 | SCOP-0001 | reviewer |
| SCOP-0008 | SCOP-0001 | SCOP-0006 | reviewer |

**t_policy_equiv_jurisdiction_and_scope_governs_scope**

| id | governs_scope |
| --- | --- |
| SCOP-0001 | Basel III |
| SCOP-0002 | CCPA |
| SCOP-0003 | Massachusetts Privacy Board |
| SCOP-0004 | NIST 800-53 |
| SCOP-0005 | EU AI Act |
| SCOP-0006 | EU AI Act |
| SCOP-0007 | Securities Exchange Commission |

**t_policy_equiv_jurisdiction_and_scope__governs_scope**

| id | policy_id | governs_scope_id | role | cardinality_note |
| --- | --- | --- | --- | --- |
| SCOP-0001 | SCOP-0003 | SCOP-0003 | contributor | Cardinality Note 01 |
| SCOP-0002 | SCOP-0004 | SCOP-0007 | contributor | Cardinality Note 02 |
| SCOP-0003 | SCOP-0005 | SCOP-0002 | observer | Cardinality Note 03 |
| SCOP-0004 | SCOP-0002 | SCOP-0002 | reviewer | Cardinality Note 04 |
| SCOP-0005 | SCOP-0002 | SCOP-0002 | owner | Cardinality Note 05 |
| SCOP-0006 | SCOP-0005 | SCOP-0001 | observer | Cardinality Note 06 |
| SCOP-0007 | SCOP-0003 | SCOP-0007 | observer | Cardinality Note 07 |
| SCOP-0008 | SCOP-0006 | SCOP-0006 | contributor | Cardinality Note 08 |

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

**t_constraint_subclass**

| id | constraint | constrains | priority | review_cycle_days |
| --- | --- | --- | --- | --- |
| CONS-0001 | Geofence boundary | SCOP-0004 | 3 | 311 |
| CONS-0002 | Audit log retention | SCOP-0003 | 3 | 467 |
| CONS-0003 | Data retention policy | SCOP-0005 | 4 | 185 |
| CONS-0004 | Encryption standard | SCOP-0003 | 2 | 391 |

The cardinality note column provides the semantic annotation that disambiguates the multiplicity and constraints of a given relationship instance. Where a junction table such as the one linking policies to governing scopes records that policy SCOP-0002 relates to scope SCOP-0002 with the role of reviewer, the cardinality note—Cardinality Note 04—supplies the additional constraint language that governs whether this association is mandatory, optional, one-to-one, or one-to-many. These annotations are not decorative; they are the mechanism by which the data model communicates business rules about relationship multiplicity without resorting to schema-level constraints that are opaque to downstream consumers. Cardinality Note 01 through Cardinality Note 04 each attach to distinct relationship instances, and their values serve as the machine-readable articulation of constraints that would otherwise be expressed only in prose documentation.

Priority and review cycle days operate as temporal governance parameters that govern the lifecycle management of relationships and the entities they connect. The constraint subclass table embeds both fields directly on the entity: the constraint labeled "Encryption standard" carries a priority of 2 and a review cycle of 391 days, while "Data retention policy" bears a priority of 4 and a review cycle of 185 days. Priority values range from 2 to 4 in the observed data, establishing a relative ordering that determines which constraints take precedence during conflict resolution or compliance auditing. Review cycle days—311, 467, 185, 391—encode the cadence at which each constraint must be re-evaluated, ensuring that time-bound obligations such as audit log retention (reviewed every 467 days) or geofence boundary definitions (reviewed every 311 days) remain current. These parameters transform static relationships into governed processes with measurable refresh intervals.

The practical architecture of this model becomes evident when observing how entities in one domain relate to entities in another through junction tables that carry their own metadata. The policy-to-jurisdiction relationship table does not merely store a foreign key pair; it assigns a role—contributor, observer, or owner—to each linkage, thereby enabling fine-grained access control and audit trails. Similarly, the belief interval to lower bound junction table records whether a belief such as "Sensor calibration drift" (INTE-0001) relates to a lower bound of "95 percent threshold" (INTE-0002) through a contributor role or an owner role. The identifier column on the junction table itself—SCOP-0001, INTE-0003—ensures that each relationship instance is independently addressable, queryable, and auditable, independent of the entities it connects. This design permits a single policy to participate in multiple jurisdiction relationships with different roles, and a single belief to relate to multiple lower bounds, each relationship carrying its own metadata without ambiguity.