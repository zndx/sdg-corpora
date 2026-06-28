---
chapter_id: ch_live_taper_tolerance_constraint_bae257
topic_id: 168
family: 08_derived
cited_terms: ['taper_tolerance_constraint', 'observation_with_participant', 'claim_basic']
model: engine-refine
---

Taper tolerance constraints serve as the foundational entities in a machining quality framework, each identified by a unique constraint identifier such as CONS-0001 through CONS-0004 and classified by its specification standard—ISO 7/24, R8 Taper, HSK 63A, or Brown Sharpe. These standards define the geometric and dimensional boundaries within which tool interfaces must operate, and their enforcement requires a structured attribute model capable of capturing heterogeneous metadata. Rather than hard-coding every possible property into the constraint table itself, the system employs an Entity-Attribute-Value pattern where attributes are defined separately with a name and a typed schema. An attribute such as confidence carries an xsd:decimal type, dimension_kind and method are xsd:string, and recorded_at is xsd:dateTime, allowing the same constraint to carry a rich, extensible set of properties without schema migration.

**t_taper_tolerance_constraint**

| id | taper_tolerance_constraint |
| --- | --- |
| CONS-0001 | ISO 7/24 |
| CONS-0002 | R8 Taper |
| CONS-0003 | HSK 63A |
| CONS-0004 | Brown Sharpe |
| CONS-0005 | R8 Taper |
| CONS-0006 | HSK 63A |
| CONS-0007 | HSK 63A |

**t_taper_tolerance_constraint_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| CONS-0001 | confidence | xsd:decimal |
| CONS-0002 | dimension_kind | xsd:string |
| CONS-0003 | method | xsd:string |
| CONS-0004 | recorded_at | xsd:dateTime |
| CONS-0005 | uncertainty | xsd:decimal |
| CONS-0006 | unit | xsd:string |
| CONS-0007 | value | xsd:decimal |
| CONS-0008 | encoding | xsd:string |

**t_taper_tolerance_constraint_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONS-0001 | CONS-0001 | CONS-0004 | 2023-04-13T01:14:03 |
| CONS-0002 | CONS-0002 | CONS-0004 | 2023-11-17T04:32:31 |
| CONS-0003 | CONS-0003 | CONS-0004 | 2024-02-24T21:07:21 |
| CONS-0004 | CONS-0004 | CONS-0004 | 2024-03-22T07:54:37 |
| CONS-0005 | CONS-0005 | CONS-0004 | 2024-06-16T09:28:12 |
| CONS-0006 | CONS-0006 | CONS-0004 | 2025-04-01T15:47:40 |
| CONS-0007 | CONS-0007 | CONS-0004 | 2023-11-02T02:01:06 |

**t_taper_tolerance_constraint_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONS-0001 | CONS-0001 | CONS-0001 | 0.573 |
| CONS-0002 | CONS-0001 | CONS-0005 | 111.04 |
| CONS-0003 | CONS-0001 | CONS-0007 | 682.01 |
| CONS-0004 | CONS-0002 | CONS-0001 | 0.728 |
| CONS-0005 | CONS-0002 | CONS-0005 | 404.41 |
| CONS-0006 | CONS-0002 | CONS-0007 | 774.28 |
| CONS-0007 | CONS-0003 | CONS-0001 | 0.546 |
| CONS-0008 | CONS-0003 | CONS-0005 | 913.78 |

**t_taper_tolerance_constraint_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONS-0001 | CONS-0001 | CONS-0002 | Dimension Kind 01 |
| CONS-0002 | CONS-0001 | CONS-0008 | Encoding 02 |
| CONS-0003 | CONS-0001 | CONS-0009 | nightly summary |
| CONS-0004 | CONS-0001 | CONS-0010 | en |
| CONS-0005 | CONS-0001 | CONS-0003 | hybrid |
| CONS-0006 | CONS-0001 | CONS-0006 | ratio |
| CONS-0007 | CONS-0002 | CONS-0002 | Dimension Kind 07 |
| CONS-0008 | CONS-0002 | CONS-0008 | Encoding 08 |

**t_claim_basic_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CLAI-0001 | CLAI-0001 | CLAI-0004 | 2025-05-28T11:02:08 |
| CLAI-0002 | CLAI-0002 | CLAI-0004 | 2025-04-22T09:44:09 |
| CLAI-0003 | CLAI-0003 | CLAI-0004 | 2025-01-23T06:41:57 |
| CLAI-0004 | CLAI-0004 | CLAI-0004 | 2024-03-14T10:07:11 |
| CLAI-0005 | CLAI-0005 | CLAI-0004 | 2023-08-27T20:51:04 |
| CLAI-0006 | CLAI-0006 | CLAI-0004 | 2025-04-10T08:56:25 |

The typed value tables materialize these attributes by linking an entity identifier to an attribute identifier and storing the actual value in the appropriate type-specific table. A decimal attribute like confidence might hold a value of 0.573 for one constraint entity and 0.728 for another, while a string attribute such as dimension_kind stores values like "Dimension Kind 01" and method stores "Encoding 02". Timestamp attributes record when measurements were taken—2023-04-13T01:14:03 or 2025-05-28T11:02:08—providing an audit trail for when each attribute was last updated. This separation of attribute definitions from their values enables the system to support multiple constraint types and claim categories within a single, uniform query model, where the entity column in each value table points back to the originating constraint or claim identifier.

**t_claim_basic**

| id | claim |
| --- | --- |
| CLAI-0001 | Model accuracy below SLA |
| CLAI-0002 | Schema version deprecated |
| CLAI-0003 | Model accuracy below SLA |
| CLAI-0004 | File checksum matches |
| CLAI-0005 | Compliance audit passed |
| CLAI-0006 | Compliance audit passed |

**t_claim_basic_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| CLAI-0001 | confidence | xsd:decimal |
| CLAI-0002 | dimension_kind | xsd:string |
| CLAI-0003 | method | xsd:string |
| CLAI-0004 | recorded_at | xsd:dateTime |
| CLAI-0005 | uncertainty | xsd:decimal |
| CLAI-0006 | unit | xsd:string |
| CLAI-0007 | value | xsd:decimal |
| CLAI-0008 | encoding | xsd:string |

**t_claim_basic_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CLAI-0001 | CLAI-0001 | CLAI-0001 | 0.443 |
| CLAI-0002 | CLAI-0001 | CLAI-0005 | 443.93 |
| CLAI-0003 | CLAI-0001 | CLAI-0007 | 257.71 |
| CLAI-0004 | CLAI-0002 | CLAI-0001 | 0.828 |
| CLAI-0005 | CLAI-0002 | CLAI-0005 | 729.35 |
| CLAI-0006 | CLAI-0002 | CLAI-0007 | 717.18 |
| CLAI-0007 | CLAI-0003 | CLAI-0001 | 0.004 |
| CLAI-0008 | CLAI-0003 | CLAI-0005 | 534.68 |

**t_claim_basic_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CLAI-0001 | CLAI-0001 | CLAI-0002 | Dimension Kind 01 |
| CLAI-0002 | CLAI-0001 | CLAI-0008 | Encoding 02 |
| CLAI-0003 | CLAI-0001 | CLAI-0009 | audit excerpt |
| CLAI-0004 | CLAI-0001 | CLAI-0010 | fr |
| CLAI-0005 | CLAI-0001 | CLAI-0003 | automated |
| CLAI-0006 | CLAI-0001 | CLAI-0006 | m/s |
| CLAI-0007 | CLAI-0002 | CLAI-0002 | Dimension Kind 07 |
| CLAI-0008 | CLAI-0002 | CLAI-0008 | Encoding 08 |

Observations represent the measurable outcomes of enforcing these constraints, captured in a fact table that records the duration of each observation in seconds—ranging from 1055.05 seconds for a brief check to 6608.55 seconds for a prolonged test—and the exit code that terminated the observation, such as 181, 130, 6, or 901. The retry count tracks how many times the system attempted to satisfy the constraint before reaching a terminal state, with values spanning from 33 retries for a relatively stable observation to 395 retries for a persistently failing one. Each observation fact row is keyed by an observation identifier like PART-0001 and linked to an observation label and category through a dimension table, where categories such as Observation Category 01 through Observation Category 04 provide a classification layer for grouping and aggregating results.

**fact_observation**

| id | observation_key | duration_seconds | exit_code | retry_count |
| --- | --- | --- | --- | --- |
| PART-0001 | PART-0002 | 5760.93 | 181 | 395 |
| PART-0002 | PART-0001 | 1055.05 | 130 | 277 |
| PART-0003 | PART-0002 | 2397.39 | 6 | 33 |
| PART-0004 | PART-0005 | 6608.55 | 901 | 249 |
| PART-0005 | PART-0001 | 2665.81 | 726 | 235 |
| PART-0006 | PART-0002 | 238.54 | 293 | 25 |
| PART-0007 | PART-0002 | 5114.82 | 801 | 303 |

**dim_observation**

| id | observation_label | observation_category |
| --- | --- | --- |
| PART-0001 | Observation Label 01 | Observation Category 01 |
| PART-0002 | Observation Label 02 | Observation Category 02 |
| PART-0003 | Observation Label 03 | Observation Category 03 |
| PART-0004 | Observation Label 04 | Observation Category 04 |
| PART-0005 | Observation Label 05 | Observation Category 05 |
| PART-0006 | Observation Label 06 | Observation Category 06 |

The same attribute-value architecture extends to claim entities, which document compliance deviations and verification outcomes. A claim such as "Model accuracy below SLA" or "File checksum matches" is identified by CLAI-0001 through CLAI-0004 and carries the same set of typed attributes—confidence as a decimal (0.443 or 0.828), dimension_kind and method as strings ("Dimension Kind 01", "audit excerpt"), and recorded_at as a timestamp (2024-03-14T10:07:11 through 2025-05-28T11:02:08). The language attribute stores locale codes like "en" or "fr", enabling multilingual claim documentation. By reusing the identical attribute schema across both constraint and claim domains, the system ensures consistent metadata handling, simplifies reporting queries, and supports cross-domain correlation between tolerance violations and their associated compliance claims.