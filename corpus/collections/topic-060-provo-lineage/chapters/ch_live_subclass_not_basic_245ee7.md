---
chapter_id: ch_live_subclass_not_basic_245ee7
topic_id: 60
family: 01_foundation
cited_terms: ['subclass_not_basic', 'schema_revision_of', 'pignistic_transformation']
model: engine-refine
---

In any relational schema, the identifier serves as the immutable anchor of a record, a stable key that survives the churn of attribute updates and cross-references alike. Consider the subclass taxonomy where entries such as `NOT-0001` through `NOT-0004` carry the labels `Not 01` through `Not 04` and their secondary designations `Not 2 01` through `Not 2 04`; the identifier `NOT-0001` remains the point of contact regardless of whether the human-readable label shifts or the secondary classification is reindexed. Similarly, revision records carry identifiers like `REVI-0001` through `REVI-0004`, and transformation records carry `TRAN-0001` through `TRAN-0004`. These keys are not merely convenient handles; they are the referential substrate that permits a relationship table to bind two distinct entities without ambiguity, and they are the mechanism by which audit trails, provenance chains, and governance workflows can be traced across schema boundaries.

**t_subclass_not_basic**

| id | not | not_2 |
| --- | --- | --- |
| NOT-0001 | Not 01 | Not 2 01 |
| NOT-0002 | Not 02 | Not 2 02 |
| NOT-0003 | Not 03 | Not 2 03 |
| NOT-0004 | Not 04 | Not 2 04 |
| NOT-0005 | Not 05 | Not 2 05 |
| NOT-0006 | Not 06 | Not 2 06 |

**t_schema_revision_of**

| id | schema |
| --- | --- |
| REVI-0001 | network_flow_record |
| REVI-0002 | product_inventory_catalog |
| REVI-0003 | network_flow_record |
| REVI-0004 | clinical_trial_protocol |
| REVI-0005 | financial_ledger_format |
| REVI-0006 | network_flow_record |
| REVI-0007 | api_gateway_routing |
| REVI-0008 | compliance_audit_log |

**t_schema_revision_of_schema_revision_of**

| id | schema_revision_of |
| --- | --- |
| REVI-0001 | legacy_compliance_log |
| REVI-0002 | legacy_compliance_log |
| REVI-0003 | legacy_compliance_log |
| REVI-0004 | legacy_network_record |
| REVI-0005 | legacy_api_gateway |
| REVI-0006 | legacy_api_gateway |

The subject and target of a relationship are the two entities that a ternary link connects, and their distinction is structural rather than semantic. In the schema-revision relationship table, the column `schema_id` designates the subject—the entity that initiates or owns the relationship—while `schema_revision_of_id` designates the target—the entity being acted upon or referenced. The record with identifier `REVI-0001` establishes that schema `REVI-0001` bears a relationship to schema `REVI-0006`, and the record `REVI-0003` links schema `REVI-0001` to schema `REVI-0003`. The same pattern appears in the pignistic-transformation relationship table, where `pignistic_id` is the subject and `pignistic_transform_id` is the target; here, transformation `TRAN-0008` relates to transformation `TRAN-0005`, and transformation `TRAN-0005` relates to both `TRAN-0006` and `TRAN-0002`. The subject-target distinction is what allows a single relationship table to model directed edges in a graph, preserving the asymmetry of the connection.

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

The role column is the third vertex of the ternary relationship, and it is where governance semantics enter the data model. A relationship between two entities is not a bare link; it carries a predicate that describes the nature of the connection. In the schema-revision table, the roles `reviewer`, `contributor`, and `owner` appear as values: the record `REVI-0001` assigns the role `reviewer` to the link between schema `REVI-0001` and schema `REVI-0006`, while the record `REVI-0004` assigns the role `owner` to the link between schema `REVI-0007` and schema `REVI-0003`. In the pignistic-transformation table, the role `reviewer` appears three times and `contributor` once, distinguishing the relationship between transformation `TRAN-0008` and `TRAN-0005` from the relationship between transformation `TRAN-0005` and `TRAN-0006`. The role is what transforms a foreign-key pair into a governed relationship, and it is the column that policy engines, access-control lists, and compliance auditors inspect to determine whether a given subject-target pairing is authorized.

The practical consequence of this three-part structure—identifier, subject, target, role—is that every relationship in the system is fully addressable and semantically complete. A query that joins `t_schema_revision_of__schema_revision_of` to `t_schema_revision_of` on the subject column retrieves not only the names of the schemas involved (`network_flow_record`, `product_inventory_catalog`, `clinical_trial_protocol`) but also the provenance chain that led to them, since the target column points into `t_schema_revision_of_schema_revision_of`, which in turn records what each revision supersedes (`legacy_compliance_log`, `legacy_network_record`). The same join pattern applied to the pignistic-transformation tables yields the diagnostic confidence matrices and telemetry belief assignments that serve as subjects, the transformed belief states and betting probability sets that serve as targets, and the reviewer or contributor roles that govern the transformation. The identifiers `REVI-0001` through `REVI-0004` and `TRAN-0001` through `TRAN-0004` are the stable keys that make all of this joinable; the subject and target columns are the directed edges; and the role column is the predicate that gives the edge its governance meaning.

**t_schema_revision_of__schema_revision_of**

| id | schema_id | schema_revision_of_id | role |
| --- | --- | --- | --- |
| REVI-0001 | REVI-0001 | REVI-0006 | reviewer |
| REVI-0002 | REVI-0001 | REVI-0001 | contributor |
| REVI-0003 | REVI-0001 | REVI-0003 | reviewer |
| REVI-0004 | REVI-0007 | REVI-0003 | owner |
| REVI-0005 | REVI-0006 | REVI-0001 | contributor |
| REVI-0006 | REVI-0005 | REVI-0001 | observer |
| REVI-0007 | REVI-0006 | REVI-0004 | owner |
| REVI-0008 | REVI-0007 | REVI-0004 | reviewer |

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