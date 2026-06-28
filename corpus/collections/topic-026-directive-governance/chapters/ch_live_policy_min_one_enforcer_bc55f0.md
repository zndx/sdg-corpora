---
chapter_id: ch_live_policy_min_one_enforcer_bc55f0
topic_id: 26
family: 03_directive_governance
cited_terms: ['policy_min_one_enforcer', 'soc2_availability_subclass', 'column_added_at_version']
model: engine-refine
---

Within governance frameworks that track policy enforcement and compliance posture, every record is anchored by a stable identifier—such as `ENFO-0001` for a SOC 2 Type II Controls policy or `AVAI-0001` for a SOC 3 Public Report availability subclass. These identifiers serve as the primary keys that allow disparate compliance artifacts to be referenced unambiguously across systems. A policy like `ENFO-0003`, which encodes a GDPR Compliance Framework, can be linked to multiple enforcement bodies—Privacy Officer, Data Stewardship Council, or Compliance Audit Board—through a junction table that captures not merely which entities are involved, but the nature of their involvement. This is where the concepts of subject, target, and role converge: the subject identifies the policy or control being enforced, the target identifies the enforcing entity, and the role—whether contributor, observer, or owner—describes the capacity in which that target participates. For instance, the policy `ENFO-0005` is enforced by `ENFO-0002` in a contributor capacity, while `ENFO-0003` assigns `ENFO-0004` the role of owner, establishing a clear accountability chain.

**t_soc2_availability_subclass**

| id | soc | for_s_o_c2_domain |
| --- | --- | --- |
| AVAI-0001 | SOC 3 Public Report | ENFO-0006 |
| AVAI-0002 | SOC 2 Privacy Assessment | ENFO-0004 |
| AVAI-0003 | SOC 2 Type I Assessment | ENFO-0004 |
| AVAI-0004 | SOC 1 Financial Audit | ENFO-0001 |
| AVAI-0005 | SOC 2 Type I Assessment | ENFO-0001 |
| AVAI-0006 | SOC 1 Type I Report | ENFO-0001 |
| AVAI-0007 | SOC 2 Privacy Assessment | ENFO-0003 |

**t_soc2_availability_subclass_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| AVAI-0001 | effective_date | xsd:date |
| AVAI-0002 | enforcement | xsd:string |
| AVAI-0003 | mandatory | xsd:boolean |
| AVAI-0004 | priority | xsd:integer |
| AVAI-0005 | review_cycle_days | xsd:integer |
| AVAI-0006 | scope | xsd:string |
| AVAI-0007 | encoding | xsd:string |
| AVAI-0008 | label_text | xsd:string |

**t_soc2_availability_subclass_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AVAI-0001 | AVAI-0001 | AVAI-0003 | true |
| AVAI-0002 | AVAI-0002 | AVAI-0003 | true |
| AVAI-0003 | AVAI-0003 | AVAI-0003 | false |
| AVAI-0004 | AVAI-0004 | AVAI-0003 | false |
| AVAI-0005 | AVAI-0005 | AVAI-0003 | false |
| AVAI-0006 | AVAI-0006 | AVAI-0003 | true |
| AVAI-0007 | AVAI-0007 | AVAI-0003 | false |

**t_soc2_availability_subclass_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AVAI-0001 | AVAI-0001 | AVAI-0001 | 2024-07-01 |
| AVAI-0002 | AVAI-0002 | AVAI-0001 | 2024-03-01 |
| AVAI-0003 | AVAI-0003 | AVAI-0001 | 2023-09-25 |
| AVAI-0004 | AVAI-0004 | AVAI-0001 | 2024-01-04 |
| AVAI-0005 | AVAI-0005 | AVAI-0001 | 2023-04-30 |
| AVAI-0006 | AVAI-0006 | AVAI-0001 | 2024-05-11 |
| AVAI-0007 | AVAI-0007 | AVAI-0001 | 2023-07-31 |

**t_soc2_availability_subclass_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AVAI-0001 | AVAI-0001 | AVAI-0004 | 5 |
| AVAI-0002 | AVAI-0001 | AVAI-0005 | 378 |
| AVAI-0003 | AVAI-0002 | AVAI-0004 | 4 |
| AVAI-0004 | AVAI-0002 | AVAI-0005 | 753 |
| AVAI-0005 | AVAI-0003 | AVAI-0004 | 1 |
| AVAI-0006 | AVAI-0003 | AVAI-0005 | 952 |
| AVAI-0007 | AVAI-0004 | AVAI-0004 | 1 |
| AVAI-0008 | AVAI-0004 | AVAI-0005 | 575 |

**t_soc2_availability_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AVAI-0001 | AVAI-0001 | AVAI-0007 | Encoding 01 |
| AVAI-0002 | AVAI-0001 | AVAI-0002 | Enforcement 02 |
| AVAI-0003 | AVAI-0001 | AVAI-0008 | nightly summary |
| AVAI-0004 | AVAI-0001 | AVAI-0009 | fr |
| AVAI-0005 | AVAI-0001 | AVAI-0006 | Scope 05 |
| AVAI-0006 | AVAI-0002 | AVAI-0007 | Encoding 06 |
| AVAI-0007 | AVAI-0002 | AVAI-0002 | Enforcement 07 |
| AVAI-0008 | AVAI-0002 | AVAI-0008 | pre-release note |

Attributes provide the dimensional structure through which entities are described and evaluated. Each attribute carries a name and a type: `effective_date` is typed as `xsd:date`, `mandatory` as `xsd:boolean`, `priority` as `xsd:integer`, and `enforcement` as `xsd:string`. In the column-versioning domain, attributes such as `confidence` (`xsd:decimal`), `dimension_kind` (`xsd:string`), `method` (`xsd:string`), and `recorded_at` (`xsd:dateTime`) define the metadata schema for tracking when and how schema changes were introduced. The attribute type is not merely a technical annotation; it constrains the shape of permissible values and ensures type safety across the value tables that store actual data. An attribute like `mandatory` with type `xsd:boolean` can only accept `true` or `false`—values observed across entities `AVAI-0001` through `AVAI-0004`—whereas `priority` of type `xsd:integer` accommodates numeric magnitudes such as `5` or `4` for availability subclass `AVAI-0001` and `AVAI-0002` respectively.

The misc values table family is where the abstract attribute definitions meet concrete data. Boolean values, date values, integer values, string values, decimal values, and datetime values are each stored in their own typed value tables, each linking an entity to an attribute and holding a single misc value. Entity `AVAI-0001` carries an effective date of `2024-07-01`, a mandatory flag of `true`, a priority of `5`, and a string value of `Encoding 01`. Entity `AVAI-0002` shares the same mandatory status (`true`) but diverges on priority (`4`) and effective date (`2024-03-01`). In the versioning domain, entity `VERS-0001` records a confidence of `0.705`, a dimension kind of `Dimension Kind 01`, and a recorded-at timestamp of `2025-04-06T14:28:17`. This value-per-type separation avoids the pitfalls of untyped value columns while preserving the flexibility of an entity-attribute-value model: any entity can acquire new attributes without schema migration, and each value is validated against its declared type at ingestion.

**t_column_added_at_version_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERS-0001 | VERS-0001 | VERS-0004 | 2025-04-06T14:28:17 |
| VERS-0002 | VERS-0002 | VERS-0004 | 2024-08-02T01:36:48 |
| VERS-0003 | VERS-0003 | VERS-0004 | 2025-02-20T12:13:34 |
| VERS-0004 | VERS-0004 | VERS-0004 | 2024-08-09T17:04:50 |
| VERS-0005 | VERS-0005 | VERS-0004 | 2025-03-12T11:57:30 |
| VERS-0006 | VERS-0006 | VERS-0004 | 2023-01-03T00:21:42 |

**t_column_added_at_version_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERS-0001 | VERS-0001 | VERS-0001 | 0.705 |
| VERS-0002 | VERS-0001 | VERS-0005 | 536.45 |
| VERS-0003 | VERS-0001 | VERS-0007 | 797.42 |
| VERS-0004 | VERS-0002 | VERS-0001 | 0.546 |
| VERS-0005 | VERS-0002 | VERS-0005 | 698.14 |
| VERS-0006 | VERS-0002 | VERS-0007 | 151.31 |
| VERS-0007 | VERS-0003 | VERS-0001 | 0.806 |
| VERS-0008 | VERS-0003 | VERS-0005 | 213.36 |

**t_column_added_at_version_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERS-0001 | VERS-0001 | VERS-0002 | Dimension Kind 01 |
| VERS-0002 | VERS-0001 | VERS-0008 | Encoding 02 |
| VERS-0003 | VERS-0001 | VERS-0009 | change rationale |
| VERS-0004 | VERS-0001 | VERS-0010 | de |
| VERS-0005 | VERS-0001 | VERS-0003 | manual |
| VERS-0006 | VERS-0001 | VERS-0006 | kg |
| VERS-0007 | VERS-0002 | VERS-0002 | Dimension Kind 07 |
| VERS-0008 | VERS-0002 | VERS-0008 | Encoding 08 |

The relationship layer—where subject, target, and role are defined—transforms a flat collection of policies and entities into a governed network of accountability. The junction table `t_policy_min_one_enforcer__enforced_by` maps policies to their enforcement bodies with an explicit role, enabling queries such as "which entities own policy `ENFO-0005`?" or "which bodies observe policy `ENFO-0004`?" The role column is itself an attribute in the broader model, typed as a string and carrying values like `contributor`, `observer`, and `owner`. This design supports multi-role assignments: a single enforcement body can hold different roles across different policies, and a single policy can be enforced by multiple bodies, each with distinct responsibilities. The identifier columns in this junction table (`policy_id` as subject, `enforced_by_id` as target) create a directed graph of compliance relationships that can be traversed to produce audit trails, responsibility matrices, and gap analyses.

**t_policy_min_one_enforcer**

| id | policy |
| --- | --- |
| ENFO-0001 | SOC 2 Type II Controls |
| ENFO-0002 | ISO 13485 QMS |
| ENFO-0003 | GDPR Compliance Framework |
| ENFO-0004 | EU AI Act Risk Management |
| ENFO-0005 | ISO 13485 QMS |
| ENFO-0006 | ISO 13485 QMS |

**t_policy_min_one_enforcer_enforced_by**

| id | enforced_by |
| --- | --- |
| ENFO-0001 | Regulatory Affairs Division |
| ENFO-0002 | Compliance Audit Board |
| ENFO-0003 | Privacy Officer |
| ENFO-0004 | Data Stewardship Council |
| ENFO-0005 | Automated Policy Engine |
| ENFO-0006 | Risk Management Committee |

**t_policy_min_one_enforcer__enforced_by**

| id | policy_id | enforced_by_id | role |
| --- | --- | --- | --- |
| ENFO-0001 | ENFO-0005 | ENFO-0002 | contributor |
| ENFO-0002 | ENFO-0004 | ENFO-0002 | observer |
| ENFO-0003 | ENFO-0005 | ENFO-0004 | owner |
| ENFO-0004 | ENFO-0005 | ENFO-0003 | contributor |
| ENFO-0005 | ENFO-0003 | ENFO-0001 | contributor |
| ENFO-0006 | ENFO-0002 | ENFO-0004 | reviewer |
| ENFO-0007 | ENFO-0004 | ENFO-0003 | owner |
| ENFO-0008 | ENFO-0001 | ENFO-0002 | reviewer |

Schema evolution is tracked through the column-versioning tables, which record when a column was introduced and what attributes describe that introduction. A column such as `throughput_mbps` was added at schema version `ENFO-0003`, while `geo_lat_dd` arrived at version `ENFO-0004`. The attributes of these version records—`confidence` (`0.705` for `VERS-0001`), `dimension_kind` (`Dimension Kind 01`), `method` (not explicitly shown but typed as `xsd:string`), and `recorded_at` (`2025-04-06T14:28:17` for `VERS-0001`)—provide a complete provenance chain. The decimal values like `536.45` and `797.42` attached to version attributes suggest quantitative measures of confidence or impact associated with each schema change. This versioning layer ensures that any attribute value observed in the misc tables can be traced back to the schema version that defined its attribute, creating an auditable lineage from raw compliance data through the schema that governs its interpretation.

**t_column_added_at_version**

| id | column | added_at_schema_version |
| --- | --- | --- |
| VERS-0001 | throughput_mbps | ENFO-0003 |
| VERS-0002 | geo_lat_dd | ENFO-0004 |
| VERS-0003 | batch_number | ENFO-0003 |
| VERS-0004 | air_pressure_hpa | ENFO-0002 |
| VERS-0005 | sensor_id | ENFO-0005 |
| VERS-0006 | throughput_mbps | ENFO-0006 |

**t_column_added_at_version_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| VERS-0001 | confidence | xsd:decimal |
| VERS-0002 | dimension_kind | xsd:string |
| VERS-0003 | method | xsd:string |
| VERS-0004 | recorded_at | xsd:dateTime |
| VERS-0005 | uncertainty | xsd:decimal |
| VERS-0006 | unit | xsd:string |
| VERS-0007 | value | xsd:decimal |
| VERS-0008 | encoding | xsd:string |