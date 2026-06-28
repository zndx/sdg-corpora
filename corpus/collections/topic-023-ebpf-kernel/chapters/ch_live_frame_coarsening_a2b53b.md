---
chapter_id: ch_live_frame_coarsening_a2b53b
topic_id: 23
family: 07_long_tail
cited_terms: ['frame_coarsening', 'frame_refinement', 'frozen_artifact_governed_by']
model: engine-refine
---

The architecture of attribute-driven data management rests on a disciplined separation between what is described and how it is described. Each entity—identified by a stable, opaque key such as COAR-0001, REFI-0001, or GOVE-0001—serves as the anchor point for a collection of attributes, where an attribute is a named property with a declared type. The attribute catalogue, exemplified by entries like `confidence`, `dimension_kind`, `method`, and `recorded_at` in the coarsening domain, or `effective_date`, `enforcement`, `mandatory`, and `priority` in the governance domain, establishes the schema of observables. Each attribute carries an `attr_type` drawn from the XSD vocabulary—`xsd:decimal` for numeric measures, `xsd:string` for categorical labels, `xsd:dateTime` and `xsd:date` for temporal markers, `xsd:boolean` for binary flags, and `xsd:integer` for ordinal ranks—ensuring that every value slot is typed before data ever enters it. This type discipline is not decorative; it governs validation, query semantics, and the physical storage layout across the value tables that follow.

**t_frame_coarsening_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| COAR-0001 | COAR-0001 | COAR-0004 | 2025-04-27T07:32:48 |
| COAR-0002 | COAR-0002 | COAR-0004 | 2023-03-09T02:04:03 |
| COAR-0003 | COAR-0003 | COAR-0004 | 2024-05-12T02:02:48 |
| COAR-0004 | COAR-0004 | COAR-0004 | 2023-04-01T23:44:45 |
| COAR-0005 | COAR-0005 | COAR-0004 | 2024-09-19T04:18:56 |
| COAR-0006 | COAR-0006 | COAR-0004 | 2024-03-20T18:21:57 |

**t_frame_coarsening_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| COAR-0001 | COAR-0001 | COAR-0001 | 0.517 |
| COAR-0002 | COAR-0001 | COAR-0005 | 121.11 |
| COAR-0003 | COAR-0001 | COAR-0007 | 637.59 |
| COAR-0004 | COAR-0002 | COAR-0001 | 0.922 |
| COAR-0005 | COAR-0002 | COAR-0005 | 777.00 |
| COAR-0006 | COAR-0002 | COAR-0007 | 979.20 |
| COAR-0007 | COAR-0003 | COAR-0001 | 0.376 |
| COAR-0008 | COAR-0003 | COAR-0005 | 973.40 |

The value tables themselves embody the entity-attribute-value (EAV) pattern, partitioned by type to preserve the guarantees that the attribute catalogue promises. A decimal attribute such as `confidence` (attr_id COAR-0001) yields a value of 0.517 for entity COAR-0001 and 0.922 for entity COAR-0002, while the same attribute on a different entity may carry 121.11 or 637.59 depending on the attribute variant (COAR-0005, COAR-0007). String-valued attributes store human-readable descriptors: `dimension_kind` resolves to `Dimension Kind 01`, `method` to `Encoding 02` or `nightly summary`, and a language tag to `en` or `es`. Temporal attributes record precise moments—`2025-04-27T07:32:48`, `2023-03-09T02:04:03`, `2024-05-12T02:02:48`—and governance artifacts carry effective dates such as `2025-04-28` and `2024-02-08`. Boolean attributes encode policy mandates: `mandatory` is `true` for GOVE-0002 and GOVE-0004, `false` for GOVE-0001 and GOVE-0003. Integer attributes capture ordinal severity or priority, with values ranging from 1 to 718 across governance records. The `misc` column, a generic value holder, is the sole carrier of these literals; its name is deliberately uninformative because the meaning of the value is fully determined by the `attr_id` it is joined to.

**t_frozen_artifact_governed_by_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| GOVE-0001 | GOVE-0001 | GOVE-0003 | false |
| GOVE-0002 | GOVE-0002 | GOVE-0003 | true |
| GOVE-0003 | GOVE-0003 | GOVE-0003 | false |
| GOVE-0004 | GOVE-0004 | GOVE-0003 | true |
| GOVE-0005 | GOVE-0005 | GOVE-0003 | false |
| GOVE-0006 | GOVE-0006 | GOVE-0003 | false |

**t_frozen_artifact_governed_by_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| GOVE-0001 | GOVE-0001 | GOVE-0001 | 2025-04-28 |
| GOVE-0002 | GOVE-0002 | GOVE-0001 | 2024-02-08 |
| GOVE-0003 | GOVE-0003 | GOVE-0001 | 2024-10-20 |
| GOVE-0004 | GOVE-0004 | GOVE-0001 | 2024-01-16 |
| GOVE-0005 | GOVE-0005 | GOVE-0001 | 2024-06-17 |
| GOVE-0006 | GOVE-0006 | GOVE-0001 | 2024-04-05 |

Beyond the attribute-value axis, the data model captures relationships between entities through a triadic construct: subject, target, and role. The table `t_frame_refinement__refines_frame` materializes the refinement relationship as a many-to-many join, where each row declares that a `frame_id` (the subject) participates in a `refines_frame_id` (the target) under a named `role`. The role values—`observer`, `owner`, `contributor`, `reviewer`—are not metadata appended to the relationship; they are the relationship's defining characteristic, determining what the subject entity is permitted to do with respect to the target. For instance, REFI-0005 acts as `observer` of REFI-0004, REFI-0006 as `owner` of REFI-0005, and REFI-0002 as `reviewer` of REFI-0005. This triad generalizes beyond frame refinement: any binary relationship in the model can be expressed as a subject-target pair annotated with a role, enabling fine-grained access control, audit trails, and provenance tracking without altering the entity or attribute schemas.

**t_frame_refinement__refines_frame**

| id | frame_id | refines_frame_id | role |
| --- | --- | --- | --- |
| REFI-0001 | REFI-0005 | REFI-0004 | observer |
| REFI-0002 | REFI-0006 | REFI-0005 | owner |
| REFI-0003 | REFI-0003 | REFI-0006 | contributor |
| REFI-0004 | REFI-0002 | REFI-0005 | reviewer |
| REFI-0005 | REFI-0003 | REFI-0006 | contributor |
| REFI-0006 | REFI-0004 | REFI-0004 | owner |
| REFI-0007 | REFI-0005 | REFI-0003 | owner |
| REFI-0008 | REFI-0002 | REFI-0006 | contributor |

The coarsening and refinement domains illustrate how the same structural primitives apply across different operational contexts. In the coarsening domain, a `frame` such as `logical dataset slice` or `hourly metric stream` may `coarsens_frame` into a `geographic sector alpha` or `pipeline input stage`, with the relationship mediated by the same identifier-based join pattern. In the refinement domain, a `frame` like `micro batch window` or `Environmental Sensor Array` `refines_frame` a `Ground Station Uplink` or `Ku Band Downlink`, again through identifier keys. The governance domain extends this pattern to frozen artifacts—`Log-Archive-23Q4`, `Model-Prod-v4`, `Q3-2023-Snapshot`, `Compliance-09`—each governed by a set of typed attributes that encode when the governance took effect, whether it is mandatory, and what priority level it carries. The uniformity of the identifier, attribute, and value tables across these domains means that adding a new artifact type requires no schema migration; it requires only the insertion of new rows into the existing tables, with the type system enforcing consistency at query time.

**t_frame_coarsening**

| id | frame | coarsens_frame |
| --- | --- | --- |
| COAR-0001 | logical dataset slice | geographic sector alpha |
| COAR-0002 | hourly metric stream | sector boundary map |
| COAR-0003 | monthly audit boundary | pipeline input stage |
| COAR-0004 | quarterly region cluster | pipeline input stage |
| COAR-0005 | daily log segment | Environmental Sensor Array |
| COAR-0006 | hourly sensor grid | compliance baseline record |

**t_frame_coarsening_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| COAR-0001 | confidence | xsd:decimal |
| COAR-0002 | dimension_kind | xsd:string |
| COAR-0003 | method | xsd:string |
| COAR-0004 | recorded_at | xsd:dateTime |
| COAR-0005 | uncertainty | xsd:decimal |
| COAR-0006 | unit | xsd:string |
| COAR-0007 | value | xsd:decimal |
| COAR-0008 | encoding | xsd:string |

**t_frame_coarsening_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| COAR-0001 | COAR-0001 | COAR-0002 | Dimension Kind 01 |
| COAR-0002 | COAR-0001 | COAR-0008 | Encoding 02 |
| COAR-0003 | COAR-0001 | COAR-0009 | nightly summary |
| COAR-0004 | COAR-0001 | COAR-0010 | en |
| COAR-0005 | COAR-0001 | COAR-0003 | hybrid |
| COAR-0006 | COAR-0001 | COAR-0006 | count |
| COAR-0007 | COAR-0002 | COAR-0002 | Dimension Kind 07 |
| COAR-0008 | COAR-0002 | COAR-0008 | Encoding 08 |

**t_frame_refinement**

| id | frame |
| --- | --- |
| REFI-0001 | micro batch window |
| REFI-0002 | geographic sector alpha |
| REFI-0003 | Environmental Sensor Array |
| REFI-0004 | sector boundary map |
| REFI-0005 | daily log segment |
| REFI-0006 | Manufacturing Quality Check |

**t_frame_refinement_refines_frame**

| id | refines_frame |
| --- | --- |
| REFI-0001 | Ground Station Uplink |
| REFI-0002 | Sterile Container Variant |
| REFI-0003 | IPv4 Header Format |
| REFI-0004 | Ku Band Downlink |
| REFI-0005 | Sterile Container Variant |
| REFI-0006 | Ground Station Uplink |

**t_frozen_artifact_governed_by**

| id | frozen |
| --- | --- |
| GOVE-0001 | Log-Archive-23Q4 |
| GOVE-0002 | Model-Prod-v4 |
| GOVE-0003 | Q3-2023-Snapshot |
| GOVE-0004 | Compliance-09 |
| GOVE-0005 | Audit-Baseline-2024 |
| GOVE-0006 | Log-Archive-23Q4 |

**t_frozen_artifact_governed_by_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| GOVE-0001 | effective_date | xsd:date |
| GOVE-0002 | enforcement | xsd:string |
| GOVE-0003 | mandatory | xsd:boolean |
| GOVE-0004 | priority | xsd:integer |
| GOVE-0005 | review_cycle_days | xsd:integer |
| GOVE-0006 | scope | xsd:string |
| GOVE-0007 | encoding | xsd:string |
| GOVE-0008 | label_text | xsd:string |

**t_frozen_artifact_governed_by_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| GOVE-0001 | GOVE-0001 | GOVE-0004 | 1 |
| GOVE-0002 | GOVE-0001 | GOVE-0005 | 718 |
| GOVE-0003 | GOVE-0002 | GOVE-0004 | 5 |
| GOVE-0004 | GOVE-0002 | GOVE-0005 | 330 |
| GOVE-0005 | GOVE-0003 | GOVE-0004 | 4 |
| GOVE-0006 | GOVE-0003 | GOVE-0005 | 316 |
| GOVE-0007 | GOVE-0004 | GOVE-0004 | 5 |
| GOVE-0008 | GOVE-0004 | GOVE-0005 | 796 |

**t_frozen_artifact_governed_by_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| GOVE-0001 | GOVE-0001 | GOVE-0007 | Encoding 01 |
| GOVE-0002 | GOVE-0001 | GOVE-0002 | Enforcement 02 |
| GOVE-0003 | GOVE-0001 | GOVE-0008 | calibration record |
| GOVE-0004 | GOVE-0001 | GOVE-0009 | es |
| GOVE-0005 | GOVE-0001 | GOVE-0006 | Scope 05 |
| GOVE-0006 | GOVE-0002 | GOVE-0007 | Encoding 06 |
| GOVE-0007 | GOVE-0002 | GOVE-0002 | Enforcement 07 |
| GOVE-0008 | GOVE-0002 | GOVE-0008 | nightly summary |