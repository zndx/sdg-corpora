---
chapter_id: ch_live_requirement_traces_to_482ed9
topic_id: 183
family: 03_directive_governance
cited_terms: ['requirement_traces_to', 'column_value_distribution', 'allocation_at_run_id']
model: engine-refine
---

Identifiers serve as the immutable anchors of any relational data model, providing stable references that survive schema evolution and cross-system integration. In practice, an identifier is a unique key—typically a short, structured string such as `TRAC-0001` or `RUN-0001`—that distinguishes one entity from all others within its domain. These identifiers appear in every table, whether the entity is a compliance requirement like `Network Segmentation Rule`, a data distribution profile such as `pareto_shape`, or a runtime allocation like `model-training-v3`. The identifier is the primary key, the column that every foreign key eventually resolves to, and the single point of truth that prevents ambiguity when the same logical entity is referenced across multiple relationship tables.

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

Roles define the semantics of a relationship, answering not merely that two entities are connected but how they are connected. A single requirement such as `Privacy Compliance Requirement` (`TRAC-0004`) may participate in multiple relationships with the same target—`ISO 27001 Control`—yet assume different roles in each: `owner` in one context and `reviewer` in another. This distinction is critical in governance frameworks where accountability must be unambiguous. The role column transforms a bare foreign-key link into a typed association, enabling queries that distinguish between the entity that owns a control, the one that reviews it, and the one that merely contributes to its implementation. Without roles, relationship tables collapse into undifferentiated adjacency lists, losing the very semantics that make audit trails and responsibility matrices meaningful.

Subjects and targets complete the relationship triad by establishing directionality. In a relationship record, the subject is the entity that initiates or owns the association, while the target is the entity toward which the association points. Consider the compliance trace where `TRAC-0001` (the subject, representing `Network Segmentation Rule`) links to `TRAC-0004` (the target, representing `Privacy Compliance Requirement`) with the role `owner`—this reads as a clear statement that the network segmentation requirement is owned by the privacy compliance requirement, or more precisely, that the former traces to the latter under an ownership relationship. The same pattern appears in data profiling, where column `DIST-0007` (the subject) is linked to distribution `DIST-0001` (the target) with the role `contributor`, indicating that the column's value distribution is contributed by a particular statistical profile. Directionality matters because it determines query orientation: filtering by subject yields all relationships initiated by an entity, while filtering by target reveals all entities that an entity depends on or references.

The three-table pattern—entity table, target table, and join table with role—repeats across domains because it is a general solution to a universal modeling problem. In the compliance domain, `t_requirement_traces_to` holds requirements, `t_requirement_traces_to_traces_to` holds the targets they reference, and `t_requirement_traces_to__traces_to` binds them with roles like `owner`, `reviewer`, and `contributor`. In the data profiling domain, `t_column_value_distribution` holds column names such as `patient_bmi` and `device_serial`, `t_column_value_distribution_value_distribution` holds distribution types like `binomial_profile` and `poisson_profile`, and the join table connects them with the same role vocabulary. In the runtime allocation domain, `t_allocation_at_run_id` holds allocations like `batch-etl-override` and `data-sync-nightly`, `t_allocation_at_run_id_at_run_identifier` holds execution tokens such as `exec-token-4491` and `tx-id-7721b`, and the join table links them with roles like `observer` and `reviewer`. The consistency of this pattern across domains is not accidental; it reflects a shared underlying ontology where every relationship is a triple of subject, target, and role, and every entity is identified by a stable, globally unique key.

**t_requirement_traces_to**

| id | requirement |
| --- | --- |
| TRAC-0001 | Network Segmentation Rule |
| TRAC-0002 | Access Control Mandate |
| TRAC-0003 | Privacy Compliance Requirement |
| TRAC-0004 | Privacy Compliance Requirement |
| TRAC-0005 | Access Control Mandate |
| TRAC-0006 | Encryption Standard |
| TRAC-0007 | System Availability Target |

**t_requirement_traces_to_traces_to**

| id | traces_to |
| --- | --- |
| TRAC-0001 | HIPAA Security Rule |
| TRAC-0002 | Risk Assessment Matrix |
| TRAC-0003 | Compliance Audit Checklist |
| TRAC-0004 | ISO 27001 Control |
| TRAC-0005 | Penetration Test Suite |
| TRAC-0006 | NIST SP 800-53 |
| TRAC-0007 | Vulnerability Scan Config |

**t_requirement_traces_to__traces_to**

| id | requirement_id | traces_to_id | role |
| --- | --- | --- | --- |
| TRAC-0001 | TRAC-0001 | TRAC-0004 | owner |
| TRAC-0002 | TRAC-0004 | TRAC-0004 | reviewer |
| TRAC-0003 | TRAC-0004 | TRAC-0004 | reviewer |
| TRAC-0004 | TRAC-0001 | TRAC-0004 | contributor |
| TRAC-0005 | TRAC-0007 | TRAC-0005 | contributor |
| TRAC-0006 | TRAC-0002 | TRAC-0003 | observer |
| TRAC-0007 | TRAC-0007 | TRAC-0002 | owner |
| TRAC-0008 | TRAC-0001 | TRAC-0002 | observer |

**t_column_value_distribution**

| id | column |
| --- | --- |
| DIST-0001 | request_count |
| DIST-0002 | patient_bmi |
| DIST-0003 | device_serial |
| DIST-0004 | request_count |
| DIST-0005 | sensor_temperature |
| DIST-0006 | sensor_temperature |
| DIST-0007 | device_serial |

**t_column_value_distribution_value_distribution**

| id | value_distribution |
| --- | --- |
| DIST-0001 | pareto_shape |
| DIST-0002 | binomial_profile |
| DIST-0003 | uniform_range |
| DIST-0004 | poisson_profile |
| DIST-0005 | bernoulli_curve |
| DIST-0006 | binomial_profile |
| DIST-0007 | uniform_range |
| DIST-0008 | uniform_range |

**t_column_value_distribution__value_distribution**

| id | column_id | value_distribution_id | role |
| --- | --- | --- | --- |
| DIST-0001 | DIST-0007 | DIST-0006 | contributor |
| DIST-0002 | DIST-0003 | DIST-0002 | reviewer |
| DIST-0003 | DIST-0007 | DIST-0006 | contributor |
| DIST-0004 | DIST-0007 | DIST-0001 | contributor |
| DIST-0005 | DIST-0002 | DIST-0007 | contributor |
| DIST-0006 | DIST-0007 | DIST-0002 | owner |
| DIST-0007 | DIST-0004 | DIST-0001 | reviewer |
| DIST-0008 | DIST-0002 | DIST-0003 | contributor |

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