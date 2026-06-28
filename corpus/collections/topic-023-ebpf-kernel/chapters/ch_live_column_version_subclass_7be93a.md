---
chapter_id: ch_live_column_version_subclass_7be93a
topic_id: 23
family: 07_long_tail
cited_terms: ['column_version_subclass', 'ebpf_program_governed_by_directive', 'outlier_detection_with_baseline']
model: engine-refine
---

An identifier functions as the immutable anchor of any data element, a stable key that survives the transience of values and the evolution of schemas. Within the column-versioning architecture, identifiers such as VERS-0001 through VERS-0004 serve as the primary keys of the subclass registry, each binding a column name—timestamp_utc, operator_code, humidity_pct—to a particular version designation like BASE-0005 or BASE-0002. The ebpf governance domain employs an analogous scheme, with DIRE-0001 through DIRE-0004 anchoring directives that govern programs such as tracepoint_sched, xdp_fwd, and tc_egress. Outlier detection baselines carry their own identifier namespace, BASE-0001 through BASE-0004, each associated with a detected anomaly pattern—network latency jump, log flood, sensor drift—and a corresponding reference against which the anomaly is evaluated, whether an expected distribution, a nominal profile, or a seasonal pattern. The identifier, in every case, is the datum that persists across value mutations, type migrations, and structural refactoring.

**t_column_version_subclass**

| id | column | column_version |
| --- | --- | --- |
| VERS-0001 | timestamp_utc | BASE-0005 |
| VERS-0002 | operator_code | BASE-0002 |
| VERS-0003 | timestamp_utc | BASE-0006 |
| VERS-0004 | humidity_pct | BASE-0004 |
| VERS-0005 | sample_volume_ml | BASE-0001 |
| VERS-0006 | ph_level | BASE-0005 |

**t_column_version_subclass_attr**

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

**t_ebpf_program_governed_by_directive**

| id | ebpf |
| --- | --- |
| DIRE-0001 | tracepoint_sched |
| DIRE-0002 | xdp_fwd |
| DIRE-0003 | tc_egress |
| DIRE-0004 | xdp_fwd |
| DIRE-0005 | tracepoint_sched |
| DIRE-0006 | tc_egress |

**t_ebpf_program_governed_by_directive_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| DIRE-0001 | effective_date | xsd:date |
| DIRE-0002 | enforcement | xsd:string |
| DIRE-0003 | mandatory | xsd:boolean |
| DIRE-0004 | priority | xsd:integer |
| DIRE-0005 | review_cycle_days | xsd:integer |
| DIRE-0006 | scope | xsd:string |
| DIRE-0007 | encoding | xsd:string |
| DIRE-0008 | label_text | xsd:string |

**t_outlier_detection_with_baseline**

| id | outlier |
| --- | --- |
| BASE-0001 | network latency jump |
| BASE-0002 | network latency jump |
| BASE-0003 | log flood |
| BASE-0004 | sensor drift |
| BASE-0005 | API error surge |
| BASE-0006 | disk I/O stall |

**t_outlier_detection_with_baseline_against**

| id | against |
| --- | --- |
| BASE-0001 | expected distribution |
| BASE-0002 | nominal profile |
| BASE-0003 | seasonal pattern |
| BASE-0004 | seasonal pattern |
| BASE-0005 | statistical baseline |
| BASE-0006 | control group dataset |
| BASE-0007 | seasonal pattern |

An attribute is the named property of an entity, a semantic slot whose meaning is declared once and instantiated many times. The attribute registry distinguishes between the attribute's name and its type: confidence carries the type xsd:decimal, dimension_kind and method are xsd:string, and recorded_at is xsd:dateTime. In the ebpf governance domain, attributes include effective_date (xsd:date), enforcement (xsd:string), mandatory (xsd:boolean), and priority (xsd:integer). The type declaration is not merely metadata; it dictates the physical storage layout, the validation constraints, and the query semantics. A decimal attribute such as confidence resolves to a value table storing numerics like 0.648, 428.43, and 933.19, while a boolean attribute such as mandatory is persisted in a dedicated boolean store with values of true or false. The separation of attribute definition from attribute value is structural: the definition declares what the property is, the value table records what it currently is.

An entity is the thing to which attributes are bound, the subject of predication. In the column-versioning model, an entity is a specific column version—VERS-0001, for instance, which is the entity that carries the attribute confidence with value 0.648, the attribute dimension_kind with value Dimension Kind 01, and the attribute recorded_at with value 2024-04-09T04:38:55. The same entity VERS-0001 also holds the decimal attribute values 428.43 and 933.19 under attribute identifiers VERS-0005 and VERS-0007 respectively, and the varchar attributes Encoding 02, intake form, and de under identifiers VERS-0008, VERS-0009, and VERS-0010. In the ebpf governance model, entity DIRE-0001 is the directive governing tracepoint_sched, and it carries the effective_date 2024-06-04, the enforcement string Encoding 01, the mandatory flag false, and the priority integer 5. The entity is the pivot around which the attribute-value pairs orbit; it is the row in the conceptual entity-relationship model, the subject of every fact.

**t_column_version_subclass_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERS-0001 | VERS-0001 | VERS-0004 | 2024-04-09T04:38:55 |
| VERS-0002 | VERS-0002 | VERS-0004 | 2024-01-02T00:15:06 |
| VERS-0003 | VERS-0003 | VERS-0004 | 2023-01-13T23:21:50 |
| VERS-0004 | VERS-0004 | VERS-0004 | 2023-03-07T00:33:45 |
| VERS-0005 | VERS-0005 | VERS-0004 | 2023-12-29T06:33:45 |
| VERS-0006 | VERS-0006 | VERS-0004 | 2023-10-05T00:14:22 |

**t_column_version_subclass_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERS-0001 | VERS-0001 | VERS-0001 | 0.648 |
| VERS-0002 | VERS-0001 | VERS-0005 | 428.43 |
| VERS-0003 | VERS-0001 | VERS-0007 | 933.19 |
| VERS-0004 | VERS-0002 | VERS-0001 | 0.532 |
| VERS-0005 | VERS-0002 | VERS-0005 | 783.47 |
| VERS-0006 | VERS-0002 | VERS-0007 | 645.78 |
| VERS-0007 | VERS-0003 | VERS-0001 | 0.438 |
| VERS-0008 | VERS-0003 | VERS-0005 | 787.07 |

**t_column_version_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERS-0001 | VERS-0001 | VERS-0002 | Dimension Kind 01 |
| VERS-0002 | VERS-0001 | VERS-0008 | Encoding 02 |
| VERS-0003 | VERS-0001 | VERS-0009 | intake form |
| VERS-0004 | VERS-0001 | VERS-0010 | de |
| VERS-0005 | VERS-0001 | VERS-0003 | hybrid |
| VERS-0006 | VERS-0001 | VERS-0006 | ms |
| VERS-0007 | VERS-0002 | VERS-0002 | Dimension Kind 07 |
| VERS-0008 | VERS-0002 | VERS-0008 | Encoding 08 |

**t_ebpf_program_governed_by_directive_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DIRE-0001 | DIRE-0001 | DIRE-0003 | false |
| DIRE-0002 | DIRE-0002 | DIRE-0003 | true |
| DIRE-0003 | DIRE-0003 | DIRE-0003 | true |
| DIRE-0004 | DIRE-0004 | DIRE-0003 | true |
| DIRE-0005 | DIRE-0005 | DIRE-0003 | false |
| DIRE-0006 | DIRE-0006 | DIRE-0003 | false |

**t_ebpf_program_governed_by_directive_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DIRE-0001 | DIRE-0001 | DIRE-0001 | 2024-06-04 |
| DIRE-0002 | DIRE-0002 | DIRE-0001 | 2025-03-23 |
| DIRE-0003 | DIRE-0003 | DIRE-0001 | 2025-01-20 |
| DIRE-0004 | DIRE-0004 | DIRE-0001 | 2024-06-12 |
| DIRE-0005 | DIRE-0005 | DIRE-0001 | 2025-03-15 |
| DIRE-0006 | DIRE-0006 | DIRE-0001 | 2024-12-23 |

**t_ebpf_program_governed_by_directive_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DIRE-0001 | DIRE-0001 | DIRE-0004 | 5 |
| DIRE-0002 | DIRE-0001 | DIRE-0005 | 280 |
| DIRE-0003 | DIRE-0002 | DIRE-0004 | 3 |
| DIRE-0004 | DIRE-0002 | DIRE-0005 | 996 |
| DIRE-0005 | DIRE-0003 | DIRE-0004 | 5 |
| DIRE-0006 | DIRE-0003 | DIRE-0005 | 471 |
| DIRE-0007 | DIRE-0004 | DIRE-0004 | 1 |
| DIRE-0008 | DIRE-0004 | DIRE-0005 | 105 |

**t_ebpf_program_governed_by_directive_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DIRE-0001 | DIRE-0001 | DIRE-0007 | Encoding 01 |
| DIRE-0002 | DIRE-0001 | DIRE-0002 | Enforcement 02 |
| DIRE-0003 | DIRE-0001 | DIRE-0008 | audit excerpt |
| DIRE-0004 | DIRE-0001 | DIRE-0009 | en |
| DIRE-0005 | DIRE-0001 | DIRE-0006 | Scope 05 |
| DIRE-0006 | DIRE-0002 | DIRE-0007 | Encoding 06 |
| DIRE-0007 | DIRE-0002 | DIRE-0002 | Enforcement 07 |
| DIRE-0008 | DIRE-0002 | DIRE-0008 | audit excerpt |

The misc column in the value tables is the generic carrier of the actual datum, a type-erased storage slot whose content is interpreted according to the attribute's declared type. In the decimal value table, misc holds 0.648 and 428.43; in the varchar table, it holds intake form and de; in the datetime table, it holds 2023-01-13T23:21:50 and 2023-03-07T00:33:45; in the integer table, it holds 280 and 996. This design permits a single attribute definition to be instantiated across multiple physical tables without schema duplication, at the cost of a join between the attribute registry and the appropriate value store. The entity_id and attr_id columns in each value table form the foreign-key pair that binds a misc value to its entity and its attribute, completing the triple: entity, attribute, value.

A subject and a target are relational roles played by entities in a binary association. The junction table t_outlier_detection_with_baseline__against encodes the relationship between an outlier and the baseline against which it is evaluated, with outlier_id serving as the subject and against_id as the target. The same baseline entity can appear as subject in one tuple and as target in another: BASE-0001 is the subject paired with target BASE-0005 in the role of observer, while BASE-0004 is the subject paired with target BASE-0002 in the role of reviewer. The role column—observer, owner, reviewer—qualifies the nature of the subject-target relationship, transforming a simple edge into a typed, labeled arc. This triad of subject, target, and role is the minimal structure for expressing directed, typed relationships between entities, and it recurs wherever one entity is related to another in a way that is neither symmetric nor incidental.

**t_outlier_detection_with_baseline__against**

| id | outlier_id | against_id | role |
| --- | --- | --- | --- |
| BASE-0001 | BASE-0001 | BASE-0005 | observer |
| BASE-0002 | BASE-0001 | BASE-0004 | owner |
| BASE-0003 | BASE-0004 | BASE-0002 | reviewer |
| BASE-0004 | BASE-0003 | BASE-0002 | observer |
| BASE-0005 | BASE-0004 | BASE-0007 | observer |
| BASE-0006 | BASE-0005 | BASE-0003 | observer |
| BASE-0007 | BASE-0006 | BASE-0006 | owner |
| BASE-0008 | BASE-0001 | BASE-0003 | reviewer |