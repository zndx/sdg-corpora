---
chapter_id: ch_live_belief_interval_for_claim_8487f3
topic_id: 92
family: 06_belief_structure
cited_terms: ['belief_interval_for_claim', 'baseline_for_metric', 'attribute_set_max_attrs']
model: engine-refine
---

The attribute registry establishes a typed property system wherein each attribute carries a name and an associated XML Schema type, forming the backbone of a schema-on-read measurement framework. An attribute such as `voltage_dc` or `flow_rate_lpm` is declared once in the attribute set, then its metadata—including the attribute name, type, and classification—is resolved through a separate definition layer where `confidence` maps to `xsd:decimal`, `dimension_kind` to `xsd:string`, and `recorded_at` to `xsd:dateTime`. This separation of attribute declaration from attribute typing permits the same logical property to be stored across heterogeneous value tables without schema migration: decimal values like `0.687` and `125.69` reside in the decimal store, string values such as `Dimension Kind 01` and `audit excerpt` in the varchar store, and temporal markers like `2024-07-05T18:39:47` in the datetime store. Each value row is anchored to an entity through a foreign key, and the entity itself may be any resource in the system, from a sensor reading to a configuration object, identified by a stable key such as `ATTR-0001`.

**t_attribute_set_max_attrs_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTR-0001 | ATTR-0001 | ATTR-0004 | 2024-07-05T18:39:47 |
| ATTR-0002 | ATTR-0002 | ATTR-0004 | 2024-04-21T13:05:05 |
| ATTR-0003 | ATTR-0003 | ATTR-0004 | 2023-05-25T09:01:45 |
| ATTR-0004 | ATTR-0004 | ATTR-0004 | 2025-03-29T09:43:13 |
| ATTR-0005 | ATTR-0005 | ATTR-0004 | 2024-03-07T20:41:06 |
| ATTR-0006 | ATTR-0006 | ATTR-0004 | 2024-01-09T06:52:17 |

**t_attribute_set_max_attrs_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTR-0001 | ATTR-0001 | ATTR-0001 | 0.687 |
| ATTR-0002 | ATTR-0001 | ATTR-0005 | 125.69 |
| ATTR-0003 | ATTR-0001 | ATTR-0007 | 391.05 |
| ATTR-0004 | ATTR-0002 | ATTR-0001 | 0.041 |
| ATTR-0005 | ATTR-0002 | ATTR-0005 | 165.49 |
| ATTR-0006 | ATTR-0002 | ATTR-0007 | 169.37 |
| ATTR-0007 | ATTR-0003 | ATTR-0001 | 0.232 |
| ATTR-0008 | ATTR-0003 | ATTR-0005 | 309.64 |

**t_attribute_set_max_attrs_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTR-0001 | ATTR-0001 | ATTR-0002 | Dimension Kind 01 |
| ATTR-0002 | ATTR-0001 | ATTR-0008 | Encoding 02 |
| ATTR-0003 | ATTR-0001 | ATTR-0009 | audit excerpt |
| ATTR-0004 | ATTR-0001 | ATTR-0010 | de |
| ATTR-0005 | ATTR-0001 | ATTR-0003 | hybrid |
| ATTR-0006 | ATTR-0001 | ATTR-0006 | kg |
| ATTR-0007 | ATTR-0002 | ATTR-0002 | Dimension Kind 07 |
| ATTR-0008 | ATTR-0002 | ATTR-0008 | Encoding 08 |

Dimension kind operates as a semantic classifier that constrains and contextualizes measured intervals within a claim. When a belief—`Network packet loss`, `CPU utilization rate`, `Checksum mismatch found`, or `Pipeline latency elevated`—is asserted against a claim identified as `METR-0006` or `METR-0001`, the dimension kind column assigns a physical or categorical axis: `time`, `length`, `count`, or `mass`. The associated numeric value, ranging from `457.08` to `866.46`, is not merely a magnitude but a magnitude qualified by its dimensional category, enabling downstream systems to validate that a `count` dimension is not conflated with a `mass` dimension during aggregation or comparison. This dimensional discipline is critical in environments where heterogeneous telemetry streams converge, as it prevents type-level errors from propagating into analytical pipelines.

The baseline architecture introduces a directed relationship model between metrics and their reference standards, mediated by a junction table that encodes both the subject and the target of the relationship alongside a role qualifier. A baseline identified as `METR-0001` may serve as the `owner` of a relationship to target `METR-0005`, while `METR-0007` assumes the `contributor` role toward `METR-0004`, and `METR-0002` acts as an `observer` of `METR-0005`. The role field—`owner`, `contributor`, `observer`—is not decorative; it determines precedence in conflict resolution, audit lineage, and the direction of dependency traversal. A metric such as `Steady_State_Vibration` can be both a baseline for another metric and a target of a baseline relationship, creating a graph structure where baselines reference baselines and the role annotation disambiguates the semantic direction of each edge.

Identifier conventions provide the stable keys that bind these structures together across tables. Claim identifiers follow the pattern `CLAI-0001` through `CLAI-0004`, metric identifiers use `METR-0001` through `METR-0007`, and attribute identifiers use `ATTR-0001` through `ATTR-0010`. These prefixes are not arbitrary; they encode the entity class at a glance, enabling index design and query planning to partition lookups by type. The identifier `METR-0001` appears as a claim reference in `t_belief_interval_for_claim`, as a baseline in `t_baseline_for_metric`, and as both subject and target in the baseline junction table, demonstrating that a single identifier can participate in multiple relationship contexts without ambiguity—the surrounding table and column names disambiguate its role in each case.

**t_belief_interval_for_claim**

| id | belief | for_claim | dimension_kind | value |
| --- | --- | --- | --- | --- |
| CLAI-0001 | Network packet loss | METR-0006 | time | 547.06 |
| CLAI-0002 | CPU utilization rate | METR-0001 | length | 866.46 |
| CLAI-0003 | Checksum mismatch found | METR-0003 | count | 659.49 |
| CLAI-0004 | Pipeline latency elevated | METR-0001 | mass | 457.08 |

**t_baseline_for_metric**

| id | baseline |
| --- | --- |
| METR-0001 | Standard_Daylight_Cycle |
| METR-0002 | Power_Consumption |
| METR-0003 | Structural_Stress |
| METR-0004 | Steady_State_Vibration |
| METR-0005 | Factory_A_NightShift |
| METR-0006 | Battery_Capacity |
| METR-0007 | Standard_Daylight_Cycle |

**t_baseline_for_metric_baseline_for**

| id | baseline_for |
| --- | --- |
| METR-0001 | Data_Ingestion_Rate |
| METR-0002 | Data_Ingestion_Rate |
| METR-0003 | Steady_State_Vibration |
| METR-0004 | Power_Consumption |
| METR-0005 | Battery_Capacity |
| METR-0006 | Steady_State_Vibration |

**t_baseline_for_metric__baseline_for**

| id | baseline_id | baseline_for_id | role |
| --- | --- | --- | --- |
| METR-0001 | METR-0007 | METR-0004 | owner |
| METR-0002 | METR-0002 | METR-0005 | contributor |
| METR-0003 | METR-0001 | METR-0005 | observer |
| METR-0004 | METR-0007 | METR-0003 | contributor |
| METR-0005 | METR-0007 | METR-0004 | contributor |
| METR-0006 | METR-0001 | METR-0002 | reviewer |
| METR-0007 | METR-0004 | METR-0006 | reviewer |
| METR-0008 | METR-0007 | METR-0002 | reviewer |

**t_attribute_set_max_attrs**

| id | attribute |
| --- | --- |
| ATTR-0001 | voltage_dc |
| ATTR-0002 | flow_rate_lpm |
| ATTR-0003 | humidity_percent |
| ATTR-0004 | particulate_um |
| ATTR-0005 | particulate_um |
| ATTR-0006 | humidity_percent |

**t_attribute_set_max_attrs_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ATTR-0001 | confidence | xsd:decimal |
| ATTR-0002 | dimension_kind | xsd:string |
| ATTR-0003 | method | xsd:string |
| ATTR-0004 | recorded_at | xsd:dateTime |
| ATTR-0005 | uncertainty | xsd:decimal |
| ATTR-0006 | unit | xsd:string |
| ATTR-0007 | value | xsd:decimal |
| ATTR-0008 | encoding | xsd:string |

The misc column, appearing across multiple tables, serves as the value carrier for heterogeneous data that does not fit the primary typed schema. In the belief-interval table, misc holds floating-point measurements like `547.06` and `659.49`; in the attribute value tables, it holds decimals, strings, and datetimes depending on the target column. This design avoids the performance penalty of a fully generic key-value store while retaining the flexibility to store unstructured or semi-structured values alongside typed attributes. The trade-off is that query-time type safety shifts from the schema layer to the application layer, requiring consumers to resolve the attribute type from the definition table before interpreting the misc value—a deliberate architectural choice that favors write scalability and schema evolution over strict read-time enforcement.