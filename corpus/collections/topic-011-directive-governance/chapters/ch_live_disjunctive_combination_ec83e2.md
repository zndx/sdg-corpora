---
chapter_id: ch_live_disjunctive_combination_ec83e2
topic_id: 11
family: 07_long_tail
cited_terms: ['disjunctive_combination', 'mass_function_assigns_to_subset', 'requirement_has_priority']
model: engine-refine
---

Disjunctive combination rules, mass-assignment functions, and requirement-priority bindings share a common representational discipline in which every durable record is addressable by a stable identifier, every describable fact is carried as a typed attribute on an entity, and every cross-entity dependency is expressed as a directed association whose semantics may be further qualified by role. Identifiers such as COMB-0001, SUBS-0006, and PRIO-0003 are not merely surrogate keys for storage convenience; they constitute the interoperable handles by which validation engines, audit trails, and downstream governance workflows resolve the same logical object across attribute registries, value partitions, and relationship tables without ambiguity. When COMB-0001 is referenced simultaneously as a disjunctive-combination record, as the entity_id anchoring multiple attribute assertions, and as the subject of a disjunctively_combines link to SUBS-0006, the identifier enforces referential coherence: a change to confidence, dimension_kind, or recorded_at is always attributable to one canonical combination object rather than to an ad hoc row label.

**t_disjunctive_combination**

| id | disjunctive | disjunctively_combines |
| --- | --- | --- |
| COMB-0001 | Schema_validation_union | SUBS-0006 |
| COMB-0002 | OR_filter_rule | SUBS-0005 |
| COMB-0003 | OR_filter_rule | SUBS-0001 |
| COMB-0004 | Schema_validation_union | SUBS-0005 |
| COMB-0005 | Metric_aggregation_branch | SUBS-0004 |
| COMB-0006 | Compliance_check_union | SUBS-0004 |

**t_disjunctive_combination_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| COMB-0001 | confidence | xsd:decimal |
| COMB-0002 | dimension_kind | xsd:string |
| COMB-0003 | method | xsd:string |
| COMB-0004 | recorded_at | xsd:dateTime |
| COMB-0005 | uncertainty | xsd:decimal |
| COMB-0006 | unit | xsd:string |
| COMB-0007 | value | xsd:decimal |
| COMB-0008 | encoding | xsd:string |

**t_disjunctive_combination_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| COMB-0001 | COMB-0001 | COMB-0004 | 2023-12-19T10:56:22 |
| COMB-0002 | COMB-0002 | COMB-0004 | 2025-06-13T05:31:45 |
| COMB-0003 | COMB-0003 | COMB-0004 | 2023-09-21T03:35:03 |
| COMB-0004 | COMB-0004 | COMB-0004 | 2025-01-18T01:14:05 |
| COMB-0005 | COMB-0005 | COMB-0004 | 2023-04-13T14:48:56 |
| COMB-0006 | COMB-0006 | COMB-0004 | 2023-06-17T09:04:58 |

**t_disjunctive_combination_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| COMB-0001 | COMB-0001 | COMB-0001 | 0.084 |
| COMB-0002 | COMB-0001 | COMB-0005 | 689.68 |
| COMB-0003 | COMB-0001 | COMB-0007 | 250.05 |
| COMB-0004 | COMB-0002 | COMB-0001 | 0.409 |
| COMB-0005 | COMB-0002 | COMB-0005 | 133.59 |
| COMB-0006 | COMB-0002 | COMB-0007 | 440.04 |
| COMB-0007 | COMB-0003 | COMB-0001 | 0.271 |
| COMB-0008 | COMB-0003 | COMB-0005 | 418.58 |

**t_disjunctive_combination_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| COMB-0001 | COMB-0001 | COMB-0002 | Dimension Kind 01 |
| COMB-0002 | COMB-0001 | COMB-0008 | Encoding 02 |
| COMB-0003 | COMB-0001 | COMB-0009 | calibration record |
| COMB-0004 | COMB-0001 | COMB-0010 | ja |
| COMB-0005 | COMB-0001 | COMB-0003 | hybrid |
| COMB-0006 | COMB-0001 | COMB-0006 | count |
| COMB-0007 | COMB-0002 | COMB-0002 | Dimension Kind 07 |
| COMB-0008 | COMB-0002 | COMB-0008 | Encoding 08 |

**t_requirement_has_priority**

| id | requirement | priority |
| --- | --- | --- |
| PRIO-0001 | Latency threshold | SUBS-0003 |
| PRIO-0002 | Backup interval | SUBS-0002 |
| PRIO-0003 | Throughput minimum | SUBS-0006 |
| PRIO-0004 | Audit log frequency | SUBS-0005 |
| PRIO-0005 | Throughput minimum | SUBS-0001 |
| PRIO-0006 | Encryption standard | SUBS-0003 |
| PRIO-0007 | Throughput minimum | SUBS-0001 |
| PRIO-0008 | Fault tolerance level | SUBS-0005 |

**t_requirement_has_priority_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| PRIO-0001 | effective_date | xsd:date |
| PRIO-0002 | enforcement | xsd:string |
| PRIO-0003 | mandatory | xsd:boolean |
| PRIO-0004 | priority | xsd:integer |
| PRIO-0005 | review_cycle_days | xsd:integer |
| PRIO-0006 | scope | xsd:string |
| PRIO-0007 | encoding | xsd:string |
| PRIO-0008 | label_text | xsd:string |

**t_requirement_has_priority_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PRIO-0001 | PRIO-0001 | PRIO-0004 | 3 |
| PRIO-0002 | PRIO-0001 | PRIO-0005 | 56 |
| PRIO-0003 | PRIO-0002 | PRIO-0004 | 2 |
| PRIO-0004 | PRIO-0002 | PRIO-0005 | 806 |
| PRIO-0005 | PRIO-0003 | PRIO-0004 | 5 |
| PRIO-0006 | PRIO-0003 | PRIO-0005 | 944 |
| PRIO-0007 | PRIO-0004 | PRIO-0004 | 4 |
| PRIO-0008 | PRIO-0004 | PRIO-0005 | 343 |

**t_requirement_has_priority_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PRIO-0001 | PRIO-0001 | PRIO-0007 | Encoding 01 |
| PRIO-0002 | PRIO-0001 | PRIO-0002 | Enforcement 02 |
| PRIO-0003 | PRIO-0001 | PRIO-0008 | intake form |
| PRIO-0004 | PRIO-0001 | PRIO-0009 | ja |
| PRIO-0005 | PRIO-0001 | PRIO-0006 | Scope 05 |
| PRIO-0006 | PRIO-0002 | PRIO-0007 | Encoding 06 |
| PRIO-0007 | PRIO-0002 | PRIO-0002 | Enforcement 07 |
| PRIO-0008 | PRIO-0002 | PRIO-0008 | intake form |

An entity is the unit of description—the thing about which the system holds structured knowledge—while an attr names the facet under consideration and attr_type declares the constraining datatype against which any asserted misc value must be validated and physically stored. The separation of attr from attr_type is operationally decisive because the same conceptual property may require different validation grammars and persistence strategies; confidence is governed as xsd:decimal and therefore materializes in decimal-valued stores as 0.084 for COMB-0001, whereas recorded_at is xsd:dateTime and appears as 2023-12-19T10:56:22, and mandatory on requirement-priority records is xsd:boolean and uniformly resolves to false across PRIO-0001 through PRIO-0004. Attribute typing thus routes each misc—the concrete lexical or numeric payload—to the correct value domain: integers such as 3 and 806 for priority, dates such as 2024-08-03 for effective_date, and strings such as Enforcement 02 or ja for enforcement and locale-like markers, each bound to its entity through the paired entity_id and attr_id keys that tie a specific assertion back to both the described object and the named property definition.

**t_requirement_has_priority_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PRIO-0001 | PRIO-0001 | PRIO-0003 | false |
| PRIO-0002 | PRIO-0002 | PRIO-0003 | false |
| PRIO-0003 | PRIO-0003 | PRIO-0003 | false |
| PRIO-0004 | PRIO-0004 | PRIO-0003 | false |
| PRIO-0005 | PRIO-0005 | PRIO-0003 | true |
| PRIO-0006 | PRIO-0006 | PRIO-0003 | false |
| PRIO-0007 | PRIO-0007 | PRIO-0003 | false |
| PRIO-0008 | PRIO-0008 | PRIO-0003 | true |

**t_requirement_has_priority_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PRIO-0001 | PRIO-0001 | PRIO-0001 | 2023-09-07 |
| PRIO-0002 | PRIO-0002 | PRIO-0001 | 2024-08-03 |
| PRIO-0003 | PRIO-0003 | PRIO-0001 | 2024-06-06 |
| PRIO-0004 | PRIO-0004 | PRIO-0001 | 2023-04-21 |
| PRIO-0005 | PRIO-0005 | PRIO-0001 | 2025-04-04 |
| PRIO-0006 | PRIO-0006 | PRIO-0001 | 2024-12-07 |
| PRIO-0007 | PRIO-0007 | PRIO-0001 | 2025-04-01 |
| PRIO-0008 | PRIO-0008 | PRIO-0001 | 2024-09-28 |

The misc field, in this architecture, is deliberately generic in name because it denotes the value proper once type resolution has occurred; its apparent heterogeneity—0.409 beside Dimension Kind 01 beside calibration record—is not schema inconsistency but evidence of a normalized entity–attribute–value pattern partitioned by attr_type for query efficiency, constraint enforcement, and index suitability. Governance value lies precisely in this partition: auditors can scan boolean mandatory flags independently of varchar enforcement policies, and engineers can apply decimal range checks to confidence without traversing unrelated string encodings. Attribute registries (attr_name paired with attr_type at the combination or requirement level) establish the contract; value tables fulfill the contract instance by instance, so that when COMB-0004 carries method as xsd:string and recorded_at as xsd:dateTime, the system can prove not only what was recorded (2025-01-18T01:14:05) but also that the timestamp conforms to the declared type rather than being coerced from an untyped text field.

Directed relationships introduce subject and target as complementary poles of linkage, with role supplying the interpretive qualifier that prevents symmetric edges from being read as interchangeable. In mass-function assignment, SUBS-0006 as subject and SUBS-0002 as target, both under role observer, states that a particular mass-function subset participates in an assigns_mass_to association toward another subset in a defined capacity rather than as an undifferentiated foreign-key pair. The same subject–target–role grammar appears at higher logical levels: disjunctively_combines pairs COMB-0002 with SUBS-0005 under OR_filter_rule, while requirement_has_priority binds Latency threshold to SUBS-0003, encoding that priority allocation is not an intrinsic property of the requirement string alone but a relational commitment to a prioritized subset. Roles accumulate evidential weight when repeated—observer appears consistently across SUBS-0001 through SUBS-0004—signaling a uniform participation pattern that compliance reviewers can test for completeness rather than infer from isolated joins.

**t_mass_function_assigns_to_subset**

| id | mass |
| --- | --- |
| SUBS-0001 | FlightMass_Empty |
| SUBS-0002 | TestMass_Aluminum |
| SUBS-0003 | FlightMass_Empty |
| SUBS-0004 | DroneMass_Complete |
| SUBS-0005 | CargoMass_Max |
| SUBS-0006 | DroneMass_Complete |

**t_mass_function_assigns_to_subset_assigns_mass_to**

| id | assigns_mass_to |
| --- | --- |
| SUBS-0001 | live_stream |
| SUBS-0002 | ObservationRecord |
| SUBS-0003 | DataQualityMetric |
| SUBS-0004 | FlightProfile |
| SUBS-0005 | MeasurementUnit |
| SUBS-0006 | sensor_primary_signal |

**t_mass_function_assigns_to_subset__assigns_mass_to**

| id | mass_id | assigns_mass_to_id | role |
| --- | --- | --- | --- |
| SUBS-0001 | SUBS-0006 | SUBS-0002 | observer |
| SUBS-0002 | SUBS-0006 | SUBS-0004 | observer |
| SUBS-0003 | SUBS-0001 | SUBS-0003 | observer |
| SUBS-0004 | SUBS-0006 | SUBS-0003 | observer |
| SUBS-0005 | SUBS-0002 | SUBS-0004 | owner |
| SUBS-0006 | SUBS-0002 | SUBS-0003 | reviewer |
| SUBS-0007 | SUBS-0005 | SUBS-0004 | reviewer |
| SUBS-0008 | SUBS-0006 | SUBS-0003 | observer |

Taken together, identifier, entity, attr, attr_type, misc, subject, target, and role form a layered evidence model suitable for operational guides and governance frameworks: identifiers stabilize identity; entities and typed attributes define what may be said; misc values supply the auditable matter of record; and subject–target–role triples express how independently described entities combine into enforceable structures such as Schema_validation_union groupings, FlightMass_Empty assignments toward ObservationRecord, or throughput minima prioritized via SUBS-0006. Readers approaching the domain for audit or engineering purposes should treat each cited value not as an isolated datum but as a cross-reference point—0.084 evidences a decimal confidence assertion on COMB-0001, false evidences a boolean mandatory posture on PRIO-0003, and observer evidences a repeatable relational semantics—through which the system’s separation of naming, typing, valuation, and linkage can be verified in practice without collapsing those distinct responsibilities into a single undifferentiated table.