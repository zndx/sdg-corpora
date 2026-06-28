---
chapter_id: ch_live_schemaorg_person_named_3afb42
topic_id: 46
family: 07_long_tail
cited_terms: ['schemaorg_person_named', 'reference_within_dataset', 'constraint_min_one_check']
model: engine-refine
---

A governance framework for data provenance and constraint management rests on a disciplined separation of identity, attribute definition, and value assignment, where each entity receives a stable identifier that anchors all subsequent metadata. In the person registry, identifiers such as `NAME-0001` through `NAME-0004` serve as the immutable keys that bind together disparate name representations—`person/tim_berners_lee`, `person/alan_kay`, `person/alan_turing`, and `person/john_von_neumann`—while the full-name table independently maps the same identifier space to canonical forms like Grace Hopper, Donald Knuth, and John von Neumann. The junction table `t_schemaorg_person_named__full_name` reconciles these two registries through a subject–target relationship: the `schemaorg_id` column (subject) references the person entity, the `full_name_id` column (target) references the full-name entity, and a `role` column—taking values such as `owner`, `observer`, or `reviewer`—expresses the nature of the association. This triad of subject, target, and role is a recurring pattern: it decouples the entities being related from the semantics of their relationship, allowing a single person to appear as subject in one association and as target in another without ambiguity.

**t_schemaorg_person_named**

| id | schemaorg |
| --- | --- |
| NAME-0001 | person/tim_berners_lee |
| NAME-0002 | person/alan_kay |
| NAME-0003 | person/alan_turing |
| NAME-0004 | person/john_von_neumann |
| NAME-0005 | person/donald_knuth |
| NAME-0006 | person/grace_hopper |
| NAME-0007 | person/john_von_neumann |

**t_schemaorg_person_named_full_name**

| id | full_name |
| --- | --- |
| NAME-0001 | Grace Hopper |
| NAME-0002 | Donald Knuth |
| NAME-0003 | John von Neumann |
| NAME-0004 | Grace Hopper |
| NAME-0005 | Ada Lovelace |
| NAME-0006 | Alan Kay |

**t_schemaorg_person_named__full_name**

| id | schemaorg_id | full_name_id | role |
| --- | --- | --- | --- |
| NAME-0001 | NAME-0003 | NAME-0002 | owner |
| NAME-0002 | NAME-0004 | NAME-0003 | observer |
| NAME-0003 | NAME-0003 | NAME-0002 | reviewer |
| NAME-0004 | NAME-0005 | NAME-0002 | owner |
| NAME-0005 | NAME-0003 | NAME-0001 | contributor |
| NAME-0006 | NAME-0007 | NAME-0005 | observer |
| NAME-0007 | NAME-0006 | NAME-0002 | observer |
| NAME-0008 | NAME-0006 | NAME-0005 | owner |

The dataset reference layer applies the same architectural discipline to provenance tracking and constraint enforcement. Each reference record—identified by keys like `DATA-0001` through `DATA-0004`—carries a `reference` label such as `PROVENANCE-MAP-V4`, `SCHEMA-REF-ALPHA`, or `QC-PROTOCOL-V2`, a `points_to` foreign key that resolves to a constraint check (e.g., `CHEC-0003`, `CHEC-0006`, `CHEC-0004`), and a `part_of` context that situates the reference within an operational domain like `ml_training_run`, `regulatory_submission`, `cloud_storage_bucket`, or `enterprise_data_catalog`. The `points_to` column is the critical foreign key linking the reference layer to the constraint registry, while `part_of` provides a logical grouping that is not enforced by a relational constraint but is essential for audit and traceability.

Attribute definitions and their values are stored in a normalized, entity–attribute–value (EAV) structure that separates schema from instance data. The attribute catalog—`t_reference_within_dataset_attr`—declares each attribute by name (`checksum_algo`, `code`, `format`, `issued_date`) and type (`xsd:string`, `xsd:date`), establishing a type contract that governs how values are validated. Values are then materialized in two separate value tables keyed by `attr_id`, which points back to the attribute definition: `t_reference_within_dataset_val_varchar` holds string-valued attributes such as `Checksum Algo 01`, `A-01`, `Encoding 03`, and `RFC-3339`, while `t_reference_within_dataset_val_date` holds date-valued attributes with values like `2024-10-25`, `2024-06-06`, `2023-04-24`, and `2023-10-13`. Both value tables carry an `entity_id` column that identifies the dataset reference to which the attribute–value pair belongs, and a `misc` column that holds the actual value. This separation of string and date values by type avoids the need for nullable columns or type coercion at query time, at the cost of requiring a join across two value tables to reconstruct a complete attribute profile for any given entity.

**t_reference_within_dataset_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| DATA-0001 | checksum_algo | xsd:string |
| DATA-0002 | code | xsd:string |
| DATA-0003 | format | xsd:string |
| DATA-0004 | issued_date | xsd:date |
| DATA-0005 | namespace | xsd:string |
| DATA-0006 | encoding | xsd:string |
| DATA-0007 | label_text | xsd:string |
| DATA-0008 | language | xsd:string |

**t_reference_within_dataset_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DATA-0001 | DATA-0001 | DATA-0004 | 2024-10-25 |
| DATA-0002 | DATA-0002 | DATA-0004 | 2024-06-06 |
| DATA-0003 | DATA-0003 | DATA-0004 | 2023-04-24 |
| DATA-0004 | DATA-0004 | DATA-0004 | 2023-10-13 |
| DATA-0005 | DATA-0005 | DATA-0004 | 2023-04-15 |
| DATA-0006 | DATA-0006 | DATA-0004 | 2024-06-08 |

**t_reference_within_dataset_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DATA-0001 | DATA-0001 | DATA-0001 | Checksum Algo 01 |
| DATA-0002 | DATA-0001 | DATA-0002 | A-01 |
| DATA-0003 | DATA-0001 | DATA-0006 | Encoding 03 |
| DATA-0004 | DATA-0001 | DATA-0003 | RFC-3339 |
| DATA-0005 | DATA-0001 | DATA-0007 | intake form |
| DATA-0006 | DATA-0001 | DATA-0008 | en |
| DATA-0007 | DATA-0001 | DATA-0005 | Namespace 07 |
| DATA-0008 | DATA-0002 | DATA-0001 | Checksum Algo 08 |

Constraint definitions introduce temporal and organizational dimensions that govern when and where a rule applies. The constraint table `t_constraint_min_one_check` records each constraint by name—`Unique Index`, `Latency Limit`, `Primary Key Rule`, `Range Validation`—and links it to the dataset references it validates through a `checks` column that references the `id` of `t_reference_within_dataset`. Two additional columns shape the constraint's applicability: `effective_date`, which records the date from which the constraint becomes active (for example, `2023-05-21` for the Unique Index constraint, `2025-03-18` for the Primary Key Rule, or `2023-05-11` for Range Validation), and `scope`, which delineates the organizational boundary of enforcement—`team`, `local`, or `regional`. The `effective_date` column is particularly important in compliance contexts, where a constraint may be retroactively applied or phased in gradually across different scopes; querying constraints for a given point in time requires filtering on this column to determine which rules were in force.

Together, these tables form a layered provenance model in which identifiers provide stable anchors, attributes and values are decoupled from their definitions, relationships are expressed through explicit subject–target–role triples, and constraints carry both temporal and organizational metadata. The foreign-key chains—`t_reference_within_dataset.points_to` → `t_constraint_min_one_check.id`, `t_reference_within_dataset_val_varchar.attr_id` → `t_reference_within_dataset_attr.id`, `t_schemaorg_person_named__full_name.schemaorg_id` → `t_schemaorg_person_named.id` and `full_name_id` → `t_schemaorg_person_named_full_name.id`—ensure referential integrity across the model, while the `role`, `scope`, and `effective_date` columns add the governance dimensions necessary for auditability and compliance reporting.

**t_reference_within_dataset**

| id | reference | points_to | part_of |
| --- | --- | --- | --- |
| DATA-0001 | PROVENANCE-MAP-V4 | CHEC-0003 | ml_training_run |
| DATA-0002 | SCHEMA-REF-ALPHA | CHEC-0003 | regulatory_submission |
| DATA-0003 | PROVENANCE-MAP-V4 | CHEC-0006 | cloud_storage_bucket |
| DATA-0004 | QC-PROTOCOL-V2 | CHEC-0004 | enterprise_data_catalog |
| DATA-0005 | DOC-2023-04A | CHEC-0003 | compliance_audit_cycle |
| DATA-0006 | DATA-DICT-PROD | CHEC-0001 | regulatory_submission |

**t_constraint_min_one_check**

| id | constraint | checks | effective_date | scope |
| --- | --- | --- | --- | --- |
| CHEC-0001 | Unique Index | DATA-0004 | 2023-05-21 | team |
| CHEC-0002 | Latency Limit | DATA-0002 | 2023-05-17 | team |
| CHEC-0003 | Primary Key Rule | DATA-0003 | 2025-03-18 | local |
| CHEC-0004 | Range Validation | DATA-0001 | 2023-05-11 | regional |
| CHEC-0005 | Referential Integrity | DATA-0002 | 2023-08-12 | regional |
| CHEC-0006 | Format Check | DATA-0006 | 2024-01-08 | global |