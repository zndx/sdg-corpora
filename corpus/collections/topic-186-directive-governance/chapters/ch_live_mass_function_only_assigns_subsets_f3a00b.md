---
chapter_id: ch_live_mass_function_only_assigns_subsets_f3a00b
topic_id: 186
family: 06_belief_structure
cited_terms: ['mass_function_only_assigns_subsets', 'constraint_min_one_check', 'control_with_owner']
model: engine-refine
---

A governance framework requires the ability to attach rich, typed metadata to every control and constraint, and the attribute model provides exactly that mechanism. Each attribute is declared with a name and a type—such as confidence as xsd:decimal, dimension_kind as xsd:string, method as xsd:string, or recorded_at as xsd:dateTime—and this type declaration governs how values are stored and validated downstream. The same pattern appears in the control layer, where attributes like effective_date (xsd:date), enforcement (xsd:string), mandatory (xsd:boolean), and priority (xsd:integer) are defined with precise schema types. This separation of attribute definition from value storage enables the system to evolve its metadata schema without restructuring the value tables, and it ensures type safety when constraints are evaluated.

The identifier column serves as the primary key that anchors every record in the attribute-value chain. In the mass function assignments, identifiers such as SUBS-0001 through SUBS-0002 link a mass type—data_quality, edge_node, thermal_fusion, or telemetry_confidence—to a target check like CHEC-0001, CHEC-0003, or CHEC-0004. In the control layer, identifiers like OWNE-0001 through OWNE-0004 anchor controls such as Vendor Risk Assessment and Data Retention Policy to their respective attribute values. The identifier is the stable reference point that allows the system to resolve which attributes belong to which entity, and which values belong to which attribute, forming the backbone of the metadata graph.

**t_mass_function_only_assigns_subsets**

| id | mass | assigns_mass_to |
| --- | --- | --- |
| SUBS-0001 | data_quality | CHEC-0001 |
| SUBS-0002 | edge_node | CHEC-0003 |
| SUBS-0003 | thermal_fusion | CHEC-0004 |
| SUBS-0004 | telemetry_confidence | CHEC-0003 |
| SUBS-0005 | signal_integrity | CHEC-0003 |
| SUBS-0006 | edge_node | CHEC-0006 |

**t_mass_function_only_assigns_subsets_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| SUBS-0001 | confidence | xsd:decimal |
| SUBS-0002 | dimension_kind | xsd:string |
| SUBS-0003 | method | xsd:string |
| SUBS-0004 | recorded_at | xsd:dateTime |
| SUBS-0005 | uncertainty | xsd:decimal |
| SUBS-0006 | unit | xsd:string |
| SUBS-0007 | value | xsd:decimal |
| SUBS-0008 | encoding | xsd:string |

**t_mass_function_only_assigns_subsets_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SUBS-0001 | SUBS-0001 | SUBS-0004 | 2024-10-19T15:01:03 |
| SUBS-0002 | SUBS-0002 | SUBS-0004 | 2023-10-05T14:35:44 |
| SUBS-0003 | SUBS-0003 | SUBS-0004 | 2024-02-24T01:03:34 |
| SUBS-0004 | SUBS-0004 | SUBS-0004 | 2024-04-26T17:49:00 |
| SUBS-0005 | SUBS-0005 | SUBS-0004 | 2024-01-29T11:02:31 |
| SUBS-0006 | SUBS-0006 | SUBS-0004 | 2023-11-16T17:14:50 |

**t_mass_function_only_assigns_subsets_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SUBS-0001 | SUBS-0001 | SUBS-0001 | 0.589 |
| SUBS-0002 | SUBS-0001 | SUBS-0005 | 503.17 |
| SUBS-0003 | SUBS-0001 | SUBS-0007 | 721.15 |
| SUBS-0004 | SUBS-0002 | SUBS-0001 | 0.512 |
| SUBS-0005 | SUBS-0002 | SUBS-0005 | 595.07 |
| SUBS-0006 | SUBS-0002 | SUBS-0007 | 721.26 |
| SUBS-0007 | SUBS-0003 | SUBS-0001 | 0.645 |
| SUBS-0008 | SUBS-0003 | SUBS-0005 | 722.55 |

**t_mass_function_only_assigns_subsets_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SUBS-0001 | SUBS-0001 | SUBS-0002 | Dimension Kind 01 |
| SUBS-0002 | SUBS-0001 | SUBS-0008 | Encoding 02 |
| SUBS-0003 | SUBS-0001 | SUBS-0009 | nightly summary |
| SUBS-0004 | SUBS-0001 | SUBS-0010 | de |
| SUBS-0005 | SUBS-0001 | SUBS-0003 | manual |
| SUBS-0006 | SUBS-0001 | SUBS-0006 | mg/L |
| SUBS-0007 | SUBS-0002 | SUBS-0002 | Dimension Kind 07 |
| SUBS-0008 | SUBS-0002 | SUBS-0008 | Encoding 08 |

**t_constraint_min_one_check**

| id | constraint | checks | effective_date | scope |
| --- | --- | --- | --- | --- |
| CHEC-0001 | Unique Index | SUBS-0004 | 2023-05-21 | team |
| CHEC-0002 | Latency Limit | SUBS-0002 | 2023-05-17 | team |
| CHEC-0003 | Primary Key Rule | SUBS-0003 | 2025-03-18 | local |
| CHEC-0004 | Range Validation | SUBS-0001 | 2023-05-11 | regional |
| CHEC-0005 | Referential Integrity | SUBS-0002 | 2023-08-12 | regional |
| CHEC-0006 | Format Check | SUBS-0006 | 2024-01-08 | global |

Entity identifiers establish the relationship between an attribute definition and its concrete value, creating a many-to-many mapping that supports multiple values per attribute and multiple attributes per entity. For instance, entity SUBS-0001 carries decimal values of 0.589 and 503.17 against different attributes, while entity SUBS-0002 carries 0.512. In the control domain, entity OWNE-0001 stores the integer priority 4 alongside the integer 806, and entity OWNE-0002 stores 5 and 150. The entity column is always paired with an attr_id that points back to the attribute definition, ensuring that every value is semantically grounded in its type context.

**t_control_with_owner**

| id | control |
| --- | --- |
| OWNE-0001 | Vendor Risk Assessment |
| OWNE-0002 | Data Retention Policy |
| OWNE-0003 | Vendor Risk Assessment |
| OWNE-0004 | Data Retention Policy |
| OWNE-0005 | Password Complexity Policy |
| OWNE-0006 | MFA Enforcement |
| OWNE-0007 | Data Retention Policy |

**t_control_with_owner_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| OWNE-0001 | effective_date | xsd:date |
| OWNE-0002 | enforcement | xsd:string |
| OWNE-0003 | mandatory | xsd:boolean |
| OWNE-0004 | priority | xsd:integer |
| OWNE-0005 | review_cycle_days | xsd:integer |
| OWNE-0006 | scope | xsd:string |
| OWNE-0007 | encoding | xsd:string |
| OWNE-0008 | label_text | xsd:string |

**t_control_with_owner_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OWNE-0001 | OWNE-0001 | OWNE-0003 | true |
| OWNE-0002 | OWNE-0002 | OWNE-0003 | true |
| OWNE-0003 | OWNE-0003 | OWNE-0003 | false |
| OWNE-0004 | OWNE-0004 | OWNE-0003 | true |
| OWNE-0005 | OWNE-0005 | OWNE-0003 | true |
| OWNE-0006 | OWNE-0006 | OWNE-0003 | true |
| OWNE-0007 | OWNE-0007 | OWNE-0003 | true |

**t_control_with_owner_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OWNE-0001 | OWNE-0001 | OWNE-0001 | 2024-04-04 |
| OWNE-0002 | OWNE-0002 | OWNE-0001 | 2025-04-01 |
| OWNE-0003 | OWNE-0003 | OWNE-0001 | 2025-05-22 |
| OWNE-0004 | OWNE-0004 | OWNE-0001 | 2024-09-08 |
| OWNE-0005 | OWNE-0005 | OWNE-0001 | 2023-05-30 |
| OWNE-0006 | OWNE-0006 | OWNE-0001 | 2023-06-07 |
| OWNE-0007 | OWNE-0007 | OWNE-0001 | 2025-03-19 |

**t_control_with_owner_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OWNE-0001 | OWNE-0001 | OWNE-0004 | 4 |
| OWNE-0002 | OWNE-0001 | OWNE-0005 | 806 |
| OWNE-0003 | OWNE-0002 | OWNE-0004 | 5 |
| OWNE-0004 | OWNE-0002 | OWNE-0005 | 150 |
| OWNE-0005 | OWNE-0003 | OWNE-0004 | 1 |
| OWNE-0006 | OWNE-0003 | OWNE-0005 | 596 |
| OWNE-0007 | OWNE-0004 | OWNE-0004 | 2 |
| OWNE-0008 | OWNE-0004 | OWNE-0005 | 663 |

**t_control_with_owner_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OWNE-0001 | OWNE-0001 | OWNE-0007 | Encoding 01 |
| OWNE-0002 | OWNE-0001 | OWNE-0002 | Enforcement 02 |
| OWNE-0003 | OWNE-0001 | OWNE-0008 | change rationale |
| OWNE-0004 | OWNE-0001 | OWNE-0009 | es |
| OWNE-0005 | OWNE-0001 | OWNE-0006 | Scope 05 |
| OWNE-0006 | OWNE-0002 | OWNE-0007 | Encoding 06 |
| OWNE-0007 | OWNE-0002 | OWNE-0002 | Enforcement 07 |
| OWNE-0008 | OWNE-0002 | OWNE-0008 | intake form |

The value storage is split across type-specific tables—decimal, datetime, varchar, and boolean—each holding the misc column where the actual value resides. Decimal values such as 0.589, 503.17, and 721.15 live in the decimal table; datetime values like 2024-10-19T15:01:03, 2023-10-05T14:35:44, 2024-02-24T01:03:34, and 2024-04-26T17:49:00 reside in the datetime table; string values including Dimension Kind 01, Encoding 02, nightly summary, de, change rationale, and es are stored in the varchar table; and boolean values true and false appear in the boolean table. This normalization by type prevents type coercion errors and allows each table to be indexed and queried according to the access patterns of its data type.

Effective date and scope provide temporal and organizational context to constraints, determining when a rule is active and where it applies. The constraint table records effective dates such as 2023-05-21, 2023-05-17, 2025-03-18, and 2023-05-11, allowing the system to evaluate which constraints were in force at any point in time. Scope values of team, local, and regional define the organizational reach of each constraint—Unique Index and Latency Limit apply at the team level, Primary Key Rule at the local level, and Range Validation at the regional level. Together, these two columns ensure that governance rules are not static declarations but time-bound, scope-aware policies that can be audited and enforced with precision.