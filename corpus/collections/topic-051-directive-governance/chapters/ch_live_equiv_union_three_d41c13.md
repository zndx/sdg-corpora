---
chapter_id: ch_live_equiv_union_three_d41c13
topic_id: 51
family: 01_foundation
cited_terms: ['equiv_union_three', 'evidence_at_quality_tier', 'evidence_basic']
model: engine-refine
---

Evidence quality in operational systems is governed through a structured attribute framework that separates the definition of metadata from its assignment to specific evidence items. Each quality tier carries a schema of named attributes—such as confidence, dimension_kind, method, and recorded_at—each bound to a precise type constraint, whether xsd:decimal for numeric precision, xsd:string for categorical labels, or xsd:dateTime for temporal anchoring. This type discipline ensures that a confidence score like 0.731 or 0.358 is never conflated with a dimension label such as Dimension Kind 01 or a timestamp like 2024-11-19T18:15:43, preserving semantic integrity across heterogeneous evidence sources. The attribute definitions themselves are decoupled from their values, allowing the same schema to be applied uniformly across evidence items ranging from telemetry streams and temperature spike alerts to compliance checklists and audit trail entries.

The dimension_kind field anchors evidence to its physical or logical measurement domain, distinguishing between temperature, count, and pressure readings with the same rigor that encoding specifications—ascii, latin1, utf8—govern character representation. A temperature spike alert carries dimension_kind temperature with ascii encoding, while an error rate histogram bears dimension_kind pressure encoded in utf8, reflecting the operational context in which each datum was captured. These classifications are not merely descriptive; they determine how evidence is routed through validation pipelines, how it is aggregated across sources, and which equivalence mappings apply. The equivalence taxonomy itself operates across four orthogonal axes: a primary category such as telemetry_stream_alpha or governance_policy_alpha, a structural role like switch_board or firewall_rule, a behavioral mode including idle_mode or rate_limit, and a serialization format ranging from flat_text through json_payload, protobuf_msg, to yaml_config. An evidence item classified as THRE-0001, for instance, maps to telemetry_stream_alpha as its primary category, switch_board as its structural role, idle_mode as its behavioral mode, and flat_text as its serialization format, establishing a complete classification profile.

Entity identifiers serve as the binding mechanism between evidence items and their quality attributes, creating a many-to-many relationship that allows a single evidence record to carry multiple typed attributes while a single attribute definition can apply across numerous evidence items. The entity_id in the value tables references specific evidence records—TIER-0001 through TIER-0004—while the attr_id points to the attribute definition being instantiated, and the value column holds the actual datum, whether a decimal precision like 574.79 or 563.53, a string classification such as Encoding 02 or change rationale, or a temporal marker like 2023-02-10T23:54:33. This three-way join structure—entity, attribute, value—enables flexible schema evolution: new attributes can be added to the definition table without modifying existing evidence records, and existing evidence can be enriched with additional attributes as quality requirements mature. The quality tier linkage further constrains this structure, as each evidence item is assigned to a tier (THRE-0001 through THRE-0004) that determines which attribute set is applicable, creating a governance hierarchy where higher tiers impose stricter attribute requirements.

**t_equiv_union_three**

| id | equiv | equiv_2 | equiv_3 | equiv_4 |
| --- | --- | --- | --- | --- |
| THRE-0001 | telemetry_stream_alpha | switch_board | idle_mode | flat_text |
| THRE-0002 | governance_policy_alpha | firewall_rule | rate_limit | json_payload |
| THRE-0003 | governance_policy_alpha | backup_node | maintenance_window | protobuf_msg |
| THRE-0004 | metadata_registry | primary_gateway | rate_limit | yaml_config |
| THRE-0005 | governance_policy_alpha | relay_module | error_recovery | parquet_file |
| THRE-0006 | sensor_array_delta | switch_board | idle_mode | json_payload |

**t_evidence_at_quality_tier**

| id | evidence | at_quality_tier |
| --- | --- | --- |
| TIER-0001 | telemetry streams | THRE-0004 |
| TIER-0002 | Compliance checklist | THRE-0003 |
| TIER-0003 | telemetry streams | THRE-0002 |
| TIER-0004 | Audit trail entry | THRE-0001 |
| TIER-0005 | Sensor calibration log | THRE-0001 |
| TIER-0006 | audit trails | THRE-0003 |
| TIER-0007 | Temperature spike alert | THRE-0002 |
| TIER-0008 | Data lineage graph | THRE-0004 |

**t_evidence_at_quality_tier_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| TIER-0001 | confidence | xsd:decimal |
| TIER-0002 | dimension_kind | xsd:string |
| TIER-0003 | method | xsd:string |
| TIER-0004 | recorded_at | xsd:dateTime |
| TIER-0005 | uncertainty | xsd:decimal |
| TIER-0006 | unit | xsd:string |
| TIER-0007 | value | xsd:decimal |
| TIER-0008 | encoding | xsd:string |

**t_evidence_at_quality_tier_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TIER-0001 | TIER-0001 | TIER-0004 | 2024-11-19T18:15:43 |
| TIER-0002 | TIER-0002 | TIER-0004 | 2023-02-10T23:54:33 |
| TIER-0003 | TIER-0003 | TIER-0004 | 2023-06-07T05:45:43 |
| TIER-0004 | TIER-0004 | TIER-0004 | 2024-08-05T11:37:21 |
| TIER-0005 | TIER-0005 | TIER-0004 | 2025-03-30T21:54:34 |
| TIER-0006 | TIER-0006 | TIER-0004 | 2023-10-26T18:53:01 |
| TIER-0007 | TIER-0007 | TIER-0004 | 2023-09-26T03:30:22 |
| TIER-0008 | TIER-0008 | TIER-0004 | 2023-04-10T10:08:00 |

**t_evidence_at_quality_tier_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TIER-0001 | TIER-0001 | TIER-0001 | 0.731 |
| TIER-0002 | TIER-0001 | TIER-0005 | 574.79 |
| TIER-0003 | TIER-0001 | TIER-0007 | 563.53 |
| TIER-0004 | TIER-0002 | TIER-0001 | 0.358 |
| TIER-0005 | TIER-0002 | TIER-0005 | 139.04 |
| TIER-0006 | TIER-0002 | TIER-0007 | 944.94 |
| TIER-0007 | TIER-0003 | TIER-0001 | 0.228 |
| TIER-0008 | TIER-0003 | TIER-0005 | 33.93 |

**t_evidence_at_quality_tier_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TIER-0001 | TIER-0001 | TIER-0002 | Dimension Kind 01 |
| TIER-0002 | TIER-0001 | TIER-0008 | Encoding 02 |
| TIER-0003 | TIER-0001 | TIER-0009 | change rationale |
| TIER-0004 | TIER-0001 | TIER-0010 | ja |
| TIER-0005 | TIER-0001 | TIER-0003 | hybrid |
| TIER-0006 | TIER-0001 | TIER-0006 | kg |
| TIER-0007 | TIER-0002 | TIER-0002 | Dimension Kind 07 |
| TIER-0008 | TIER-0002 | TIER-0008 | Encoding 08 |

**t_evidence_basic**

| id | evidence | dimension_kind | encoding |
| --- | --- | --- | --- |
| EVID-0001 | Temperature spike alert | temperature | ascii |
| EVID-0002 | telemetry streams | count | latin1 |
| EVID-0003 | Compliance checklist | temperature | utf8 |
| EVID-0004 | Error rate histogram | pressure | utf8 |
| EVID-0005 | Incident postmortem | length | utf8 |

The practical effect of this architecture is that evidence governance becomes a matter of attribute composition rather than rigid schema enforcement. A compliance checklist and a telemetry stream may both carry a confidence decimal and a recorded_at timestamp, but the compliance checklist might additionally carry a method attribute with value ja, while the telemetry stream carries a dimension_kind of temperature. The encoding specification—whether ascii, latin1, or utf8—operates at the evidence level rather than the attribute level, reflecting that character encoding is a property of the evidence artifact itself rather than its metadata. This separation of concerns allows the system to handle heterogeneous evidence sources with varying structural requirements while maintaining a consistent quality framework, where the equivalence taxonomy provides the classification vocabulary and the attribute-value structure provides the instantiation mechanism.