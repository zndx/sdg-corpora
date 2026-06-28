---
chapter_id: ch_live_functional_dependency_rhs_6becbb
topic_id: 163
family: 07_long_tail
cited_terms: ['functional_dependency_rhs', 'schemaorg_review_rating', 'transformation_only_uses_datasets']
model: engine-refine
---

Identifiers serve as the immutable anchors of relational integrity, each table in the reference corpus employing a distinct prefix scheme to guarantee cross-table disambiguation: the functional dependency domain uses the prefix `RHS-` (as in `RHS-0001` through `RHS-0004`), the schemaorg review rating domain uses `RATI-` (with values such as `RATI-0001` through `RATI-0004`), and the transformation dataset domain uses `DATA-` (with values such as `DATA-0001` through `DATA-0004`). These identifiers are not merely sequential labels; they encode the domain of the entity they identify, enabling foreign-key references to be validated at the schema level without ambiguity. The `t_functional_dependency_rhs` table, for instance, assigns `RHS-0001` to the functional entity "data ingestion pipeline" and `RHS-0002` to "encryption transformation," while the `t_schemaorg_review_rating` table assigns `RATI-0003` and `RATI-0004` both to "iPhone 15 Pro"—demonstrating that identifiers are unique even when the semantic content they annotate is not.

**t_functional_dependency_rhs**

| id | functional |
| --- | --- |
| RHS-0001 | data ingestion pipeline |
| RHS-0002 | encryption transformation |
| RHS-0003 | telemetry aggregation service |
| RHS-0004 | access control evaluator |
| RHS-0005 | telemetry aggregation service |
| RHS-0006 | schema validation routine |

**t_schemaorg_review_rating**

| id | schemaorg |
| --- | --- |
| RATI-0001 | Adobe Photoshop |
| RATI-0002 | The Great Gatsby |
| RATI-0003 | iPhone 15 Pro |
| RATI-0004 | iPhone 15 Pro |
| RATI-0005 | Marriott International |
| RATI-0006 | Marriott International |

**t_schemaorg_review_rating_review_rating**

| id | review_rating |
| --- | --- |
| RATI-0001 | 3.2 points |
| RATI-0002 | 100 percentile |
| RATI-0003 | 9.1 rating |
| RATI-0004 | 4.0 average |
| RATI-0005 | 47 score |
| RATI-0006 | 5.0 scale |
| RATI-0007 | 8.7 out of 10 |
| RATI-0008 | 88 out of 100 |

The subject-target relationship is the structural mechanism by which entities are connected to their associated values or dependent attributes, and it is always mediated through a junction table that carries a role qualifier. In the functional dependency domain, the junction table `t_functional_dependency_rhs__f_d_right_hand_side` links a functional entity (the subject, referenced via `functional_id`) to a right-hand-side value (the target, referenced via `f_d_right_hand_side_id`). A concrete instance is the row where `functional_id` is `RHS-0003` (the "telemetry aggregation service") and `f_d_right_hand_side_id` is `RHS-0007`, with the role column recording "contributor"—indicating that the telemetry aggregation service contributes to the determination of the right-hand-side value identified by `RHS-0007`. The same subject may appear with different targets and roles: `RHS-0003` also appears with `f_d_right_hand_side_id` `RHS-0006` under the role "owner," establishing that the same functional entity can hold multiple, distinct relationships to different targets, each semantically differentiated by its role.

**t_functional_dependency_rhs__f_d_right_hand_side**

| id | functional_id | f_d_right_hand_side_id | role |
| --- | --- | --- | --- |
| RHS-0001 | RHS-0003 | RHS-0007 | contributor |
| RHS-0002 | RHS-0004 | RHS-0001 | owner |
| RHS-0003 | RHS-0002 | RHS-0005 | owner |
| RHS-0004 | RHS-0003 | RHS-0006 | owner |
| RHS-0005 | RHS-0003 | RHS-0001 | owner |
| RHS-0006 | RHS-0001 | RHS-0005 | owner |
| RHS-0007 | RHS-0001 | RHS-0006 | contributor |
| RHS-0008 | RHS-0002 | RHS-0001 | contributor |

The role column is the critical semantic layer that distinguishes otherwise structurally identical foreign-key pairs. Across all three domains in the corpus, the role values are drawn from a constrained vocabulary: "owner" appears in the functional dependency junction table to denote authoritative determination of a right-hand-side value; "contributor" appears both there and in the transformation junction table to denote partial or supporting influence; "reviewer" appears in the schemaorg review rating junction table and the transformation junction table to denote evaluative or auditing authority; and "observer" appears in the transformation junction table to denote passive awareness without decision-making power. The row in `t_schemaorg_review_rating__review_rating` where `schemaorg_id` is `RATI-0001` (corresponding to "Adobe Photoshop") and `review_rating_id` is `RATI-0004` carries the role "contributor," whereas the row where `schemaorg_id` is `RATI-0004` (corresponding to "iPhone 15 Pro") and `review_rating_id` is `RATI-0001` carries the role "reviewer"—the same pair of identifiers, the same two tables, but a different role assignment that changes the nature of the relationship from contributory to evaluative.

**t_functional_dependency_rhs_f_d_right_hand_side**

| id | f_d_right_hand_side |
| --- | --- |
| RHS-0001 | aggregated event count |
| RHS-0002 | sanitized email address |
| RHS-0003 | partition key value |
| RHS-0004 | enriched sensor reading |
| RHS-0005 | derived priority level |
| RHS-0006 | computed latency metric |
| RHS-0007 | computed latency metric |

The separation of entity definitions from their associated values into distinct tables—what might be called the subject table and the target table—enables independent lifecycle management and supports many-to-many cardinality. The `t_transformation_only_uses_datasets` table defines transformations such as "validation check" (`DATA-0001`), "signal denoising filter" (`DATA-0002`), "calibration routine" (`DATA-0003`), and "telemetry ingestion filter" (`DATA-0004`), while the `t_transformation_only_uses_datasets_uses_entity` table defines the datasets they may consume: "event log archive" (`DATA-0001`), "feature registry cache" (`DATA-0002`), "ingestion buffer queue" (`DATA-0003`), and "historical metrics dataset" (`DATA-0004`). The junction table `t_transformation_only_uses_datasets__uses_entity` then expresses the actual usage relationships: `DATA-0003` (calibration routine) uses `DATA-0002` (feature registry cache) with role "reviewer," and the same transformation `DATA-0003` also uses `DATA-0003` (ingestion buffer queue) with role "contributor," while `DATA-0001` (validation check) uses both `DATA-0002` (with role "observer") and `DATA-0004` (with role "contributor"). This structure allows a single transformation to consume multiple datasets under different semantic roles, and a single dataset to be consumed by multiple transformations, without requiring denormalization or redundant columns.

**t_transformation_only_uses_datasets**

| id | transformation |
| --- | --- |
| DATA-0001 | validation check |
| DATA-0002 | signal denoising filter |
| DATA-0003 | calibration routine |
| DATA-0004 | telemetry ingestion filter |
| DATA-0005 | feature engineering step |
| DATA-0006 | format conversion layer |

**t_transformation_only_uses_datasets_uses_entity**

| id | uses_entity |
| --- | --- |
| DATA-0001 | event log archive |
| DATA-0002 | feature registry cache |
| DATA-0003 | ingestion buffer queue |
| DATA-0004 | historical metrics dataset |
| DATA-0005 | configuration manifest |
| DATA-0006 | configuration manifest |

**t_transformation_only_uses_datasets__uses_entity**

| id | transformation_id | uses_entity_id | role |
| --- | --- | --- | --- |
| DATA-0001 | DATA-0003 | DATA-0002 | reviewer |
| DATA-0002 | DATA-0001 | DATA-0002 | observer |
| DATA-0003 | DATA-0003 | DATA-0003 | contributor |
| DATA-0004 | DATA-0001 | DATA-0004 | contributor |
| DATA-0005 | DATA-0005 | DATA-0001 | observer |
| DATA-0006 | DATA-0005 | DATA-0003 | reviewer |
| DATA-0007 | DATA-0003 | DATA-0006 | reviewer |
| DATA-0008 | DATA-0005 | DATA-0003 | contributor |

In practice, this three-table pattern—subject definition, target definition, and role-bearing junction—provides a governance-ready model for tracking data lineage, access control, and functional responsibility. The functional dependency domain encodes which system components determine which output values and in what capacity (owner versus contributor), the schemaorg domain encodes which products or works are associated with which ratings and by what authority (reviewer versus contributor), and the transformation domain encodes which data processing steps consume which datasets and with what level of engagement (observer, contributor, or reviewer). The identifiers provide the referential backbone, the foreign keys provide the structural connectivity, and the role column provides the semantic precision necessary for audit trails, compliance reporting, and operational decision-making.

**t_schemaorg_review_rating__review_rating**

| id | schemaorg_id | review_rating_id | role |
| --- | --- | --- | --- |
| RATI-0001 | RATI-0004 | RATI-0001 | reviewer |
| RATI-0002 | RATI-0006 | RATI-0007 | reviewer |
| RATI-0003 | RATI-0001 | RATI-0004 | contributor |
| RATI-0004 | RATI-0005 | RATI-0003 | reviewer |
| RATI-0005 | RATI-0006 | RATI-0001 | owner |
| RATI-0006 | RATI-0006 | RATI-0007 | owner |
| RATI-0007 | RATI-0001 | RATI-0008 | owner |
| RATI-0008 | RATI-0006 | RATI-0008 | observer |