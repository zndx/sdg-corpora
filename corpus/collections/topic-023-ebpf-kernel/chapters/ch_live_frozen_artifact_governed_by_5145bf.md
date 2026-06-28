---
chapter_id: ch_live_frozen_artifact_governed_by_5145bf
topic_id: 23
family: 07_long_tail
cited_terms: ['frozen_artifact_governed_by', 'outlier_claim_has_confidence', 'constraint_only_constrains']
model: engine-refine
---

Attributes, their types, entities, and identifiers form the structural backbone of any governance framework, providing the vocabulary and scaffolding through which policy, compliance, and operational constraints are articulated, stored, and enforced. An identifier serves as the immutable key by which a governed artifact or constraint is referenced across the system—values such as `GOVE-0001` through `GOVE-0004` anchor frozen artifacts like `Log-Archive-23Q4`, `Model-Prod-v4`, `Q3-2023-Snapshot`, and `Compliance-09`, while `CONF-0001` through `CONF-0004` and `CONS-0001` through `CONS-0004` similarly tag outlier claims and constraint relationships. These identifiers are not merely labels; they are the join keys that bind attribute definitions to their concrete values, ensuring that every datum can be traced back to the artifact or constraint it qualifies. The separation of identifier from value is deliberate: it permits the same attribute schema to be applied across heterogeneous entities without duplication, and it allows the system to evolve its attribute vocabulary independently of the artifacts it governs.

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

**t_constraint_only_constrains**

| id | constraint | constrains |
| --- | --- | --- |
| CONS-0001 | log_level_filter | query_engine |
| CONS-0002 | checksum_algorithm | network_interface |
| CONS-0003 | data_retention_policy | telemetry_streams |
| CONS-0004 | data_retention_policy | telemetry_streams |
| CONS-0005 | data_retention_policy | sensor_reading |
| CONS-0006 | access_control_matrix | api_gateway |

**t_constraint_only_constrains_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| CONS-0001 | effective_date | xsd:date |
| CONS-0002 | enforcement | xsd:string |
| CONS-0003 | mandatory | xsd:boolean |
| CONS-0004 | priority | xsd:integer |
| CONS-0005 | review_cycle_days | xsd:integer |
| CONS-0006 | scope | xsd:string |
| CONS-0007 | encoding | xsd:string |
| CONS-0008 | label_text | xsd:string |

**t_constraint_only_constrains_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONS-0001 | CONS-0001 | CONS-0004 | 4 |
| CONS-0002 | CONS-0001 | CONS-0005 | 996 |
| CONS-0003 | CONS-0002 | CONS-0004 | 1 |
| CONS-0004 | CONS-0002 | CONS-0005 | 40 |
| CONS-0005 | CONS-0003 | CONS-0004 | 3 |
| CONS-0006 | CONS-0003 | CONS-0005 | 497 |
| CONS-0007 | CONS-0004 | CONS-0004 | 2 |
| CONS-0008 | CONS-0004 | CONS-0005 | 719 |

**t_constraint_only_constrains_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONS-0001 | CONS-0001 | CONS-0007 | Encoding 01 |
| CONS-0002 | CONS-0001 | CONS-0002 | Enforcement 02 |
| CONS-0003 | CONS-0001 | CONS-0008 | intake form |
| CONS-0004 | CONS-0001 | CONS-0009 | ja |
| CONS-0005 | CONS-0001 | CONS-0006 | Scope 05 |
| CONS-0006 | CONS-0002 | CONS-0007 | Encoding 06 |
| CONS-0007 | CONS-0002 | CONS-0002 | Enforcement 07 |
| CONS-0008 | CONS-0002 | CONS-0008 | pre-release note |

Attribute types define the semantic and syntactic constraints on the values that may be assigned to a given attribute. In the governance domain, attributes such as `effective_date`, `enforcement`, `mandatory`, and `priority` are declared with their corresponding XML Schema types—`xsd:date`, `xsd:string`, `xsd:boolean`, and `xsd:integer`—establishing a contract between the metadata layer and the value layer. This type discipline is not decorative; it governs validation, queryability, and interoperability. A date attribute like `effective_date` accepts values such as `2025-04-28` or `2024-02-08`, which are machine-parseable and sortable, while a boolean attribute like `mandatory` admits only `true` or `false`, as seen in the enforcement flags for governed artifacts. The type system thus acts as a gatekeeper, rejecting malformed values before they can corrupt downstream processes.

**t_constraint_only_constrains_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONS-0001 | CONS-0001 | CONS-0003 | true |
| CONS-0002 | CONS-0002 | CONS-0003 | false |
| CONS-0003 | CONS-0003 | CONS-0003 | true |
| CONS-0004 | CONS-0004 | CONS-0003 | true |
| CONS-0005 | CONS-0005 | CONS-0003 | false |
| CONS-0006 | CONS-0006 | CONS-0003 | false |

**t_constraint_only_constrains_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONS-0001 | CONS-0001 | CONS-0001 | 2023-09-12 |
| CONS-0002 | CONS-0002 | CONS-0001 | 2025-06-06 |
| CONS-0003 | CONS-0003 | CONS-0001 | 2023-06-09 |
| CONS-0004 | CONS-0004 | CONS-0001 | 2024-12-03 |
| CONS-0005 | CONS-0005 | CONS-0001 | 2024-06-17 |
| CONS-0006 | CONS-0006 | CONS-0001 | 2025-05-30 |

The entity column in the value tables is the linchpin that connects an attribute instance to a specific governed object. In the frozen artifact value tables, `entity_id` values such as `GOVE-0001` and `GOVE-0002` appear repeatedly, each time paired with an `attr_id` that specifies which attribute is being assigned and a `value` that provides the concrete datum. For example, the integer attribute `priority` takes on values of `718` and `330` for entity `GOVE-0001` and `GOVE-0002` respectively, while the string attribute `enforcement` carries values like `Enforcement 02` for the same entities. This many-to-many relationship—where a single entity can carry many attributes and a single attribute definition can be instantiated across many entities—enables fine-grained, per-artifact customization of governance policies without requiring schema changes.

The same architectural pattern recurs across domains. In the outlier confidence domain, attributes such as `confidence`, `dimension_kind`, `method`, and `recorded_at` are typed as `xsd:decimal`, `xsd:string`, `xsd:string`, and `xsd:dateTime` respectively, and their values—`0.904`, `369.80`, `179.72`, `Dimension Kind 01`, `2023-06-24T17:04:07`—are stored in type-specific value tables keyed by `entity_id` and `attr_id`. Similarly, the constraint domain declares attributes `effective_date`, `enforcement`, `mandatory`, and `priority` with identical types to the governance domain, and assigns values such as `2023-09-12`, `true`, `4`, and `996` to constraints like `log_level_filter` and `data_retention_policy` that govern components such as `query_engine`, `network_interface`, and `telemetry_streams`. The repetition of attribute names and types across domains is not redundancy; it is a deliberate normalization that allows governance rules, outlier assessments, and constraint definitions to share a common attribute vocabulary while remaining independently instantiated.

**t_outlier_claim_has_confidence_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONF-0001 | CONF-0001 | CONF-0004 | 2023-06-24T17:04:07 |
| CONF-0002 | CONF-0002 | CONF-0004 | 2024-09-22T13:07:31 |
| CONF-0003 | CONF-0003 | CONF-0004 | 2023-12-24T05:49:34 |
| CONF-0004 | CONF-0004 | CONF-0004 | 2025-01-22T02:31:25 |
| CONF-0005 | CONF-0005 | CONF-0004 | 2023-07-07T20:57:08 |
| CONF-0006 | CONF-0006 | CONF-0004 | 2023-12-11T12:48:41 |
| CONF-0007 | CONF-0007 | CONF-0004 | 2024-11-29T10:12:10 |
| CONF-0008 | CONF-0008 | CONF-0004 | 2024-08-28T09:33:36 |

This separation of concerns—identifiers as keys, types as validators, entities as join targets, and values as the mutable content—yields a system that is both rigid in its structure and flexible in its content. New attributes can be introduced by adding rows to the attribute definition table without altering any value tables. Existing attributes can be re-typed or re-purposed by updating their definitions. And the value tables, partitioned by type, ensure that queries for dates, booleans, integers, and strings are routed to the correct storage without ambiguity. The result is a governance data model that scales with the complexity of the policies it encodes, from the simple boolean flag of whether a constraint is mandatory to the precise decimal confidence of an outlier claim, all anchored by identifiers that make every datum auditable and traceable.

**t_outlier_claim_has_confidence**

| id | outlier | confidence |
| --- | --- | --- |
| CONF-0001 | power fluctuation | GOVE-0002 |
| CONF-0002 | power fluctuation | GOVE-0004 |
| CONF-0003 | power fluctuation | GOVE-0003 |
| CONF-0004 | calibration drift | GOVE-0005 |
| CONF-0005 | telemetry gap | GOVE-0006 |
| CONF-0006 | signal dropout | GOVE-0003 |
| CONF-0007 | memory leak | GOVE-0001 |
| CONF-0008 | calibration drift | GOVE-0004 |

**t_outlier_claim_has_confidence_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| CONF-0001 | confidence | xsd:decimal |
| CONF-0002 | dimension_kind | xsd:string |
| CONF-0003 | method | xsd:string |
| CONF-0004 | recorded_at | xsd:dateTime |
| CONF-0005 | uncertainty | xsd:decimal |
| CONF-0006 | unit | xsd:string |
| CONF-0007 | value | xsd:decimal |
| CONF-0008 | encoding | xsd:string |

**t_outlier_claim_has_confidence_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONF-0001 | CONF-0001 | CONF-0001 | 0.904 |
| CONF-0002 | CONF-0001 | CONF-0005 | 369.80 |
| CONF-0003 | CONF-0001 | CONF-0007 | 179.72 |
| CONF-0004 | CONF-0002 | CONF-0001 | 0.503 |
| CONF-0005 | CONF-0002 | CONF-0005 | 659.89 |
| CONF-0006 | CONF-0002 | CONF-0007 | 72.27 |
| CONF-0007 | CONF-0003 | CONF-0001 | 0.694 |
| CONF-0008 | CONF-0003 | CONF-0005 | 15.75 |

**t_outlier_claim_has_confidence_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONF-0001 | CONF-0001 | CONF-0002 | Dimension Kind 01 |
| CONF-0002 | CONF-0001 | CONF-0008 | Encoding 02 |
| CONF-0003 | CONF-0001 | CONF-0009 | change rationale |
| CONF-0004 | CONF-0001 | CONF-0010 | fr |
| CONF-0005 | CONF-0001 | CONF-0003 | manual |
| CONF-0006 | CONF-0001 | CONF-0006 | ratio |
| CONF-0007 | CONF-0002 | CONF-0002 | Dimension Kind 07 |
| CONF-0008 | CONF-0002 | CONF-0008 | Encoding 08 |