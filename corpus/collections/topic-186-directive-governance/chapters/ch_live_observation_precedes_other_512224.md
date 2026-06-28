---
chapter_id: ch_live_observation_precedes_other_512224
topic_id: 186
family: 02_observation_measurement
cited_terms: ['observation_precedes_other', 'artifact_with_existential', 'constraint_only_constrains']
model: engine-refine
---

In operational governance frameworks, every observable phenomenon or policy artifact is anchored by a unique identifier that serves as the immutable reference point across all downstream records. Identifiers such as OTHE-0001, EXIS-0001, and CONS-0001 function as primary keys that establish a single source of truth for each relationship instance—whether that relationship captures a temporal precedence between events like server_disk_full leading to firmware_update_init, an existential dependency between artifacts like edge-gateway and environmental-monitor, or a constraint relationship such as data_retention_policy governing telemetry_streams. These identifiers are not merely labels; they are the structural backbone that enables referential integrity across a distributed data model, ensuring that every attribute assignment and value binding can be traced back to its originating relationship without ambiguity.

**t_artifact_with_existential**

| id | artifact | related |
| --- | --- | --- |
| EXIS-0001 | provenance-cert | backup-storage-array |
| EXIS-0002 | edge-gateway | environmental-monitor |
| EXIS-0003 | edge-gateway | network-traffic-capture |
| EXIS-0004 | audit-log-2023 | field-site-alpha |
| EXIS-0005 | edge-gateway | ingestion-pipeline |
| EXIS-0006 | audit-log-2023 | data-retention-policy |

**t_artifact_with_existential_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| EXIS-0001 | checksum | xsd:string |
| EXIS-0002 | created_date | xsd:date |
| EXIS-0003 | identifier | cco:DesignativeICE |
| EXIS-0004 | license | xsd:string |
| EXIS-0005 | mime_type | xsd:string |
| EXIS-0006 | size_bytes | xsd:long |
| EXIS-0007 | uri | xsd:string |
| EXIS-0008 | version | xsd:integer |

**t_constraint_only_constrains**

| id | constraint | constrains |
| --- | --- | --- |
| CONS-0001 | log_level_filter | query_engine |
| CONS-0002 | checksum_algorithm | network_interface |
| CONS-0003 | data_retention_policy | telemetry_streams |
| CONS-0004 | data_retention_policy | telemetry_streams |
| CONS-0005 | data_retention_policy | sensor_reading |
| CONS-0006 | access_control_matrix | api_gateway |

Attributes and their associated types form the descriptive layer that gives meaning to each relationship instance. An attribute name—duration_seconds, end_time, exit_code, host_name, checksum, created_date, effective_date, enforcement, mandatory, or priority—specifies what dimension of the relationship is being characterized, while the attribute type enforces semantic discipline by declaring the expected data format. The type system draws from standardized vocabularies: xsd:decimal for numeric measurements, xsd:dateTime and xsd:date for temporal values, xsd:integer and xsd:boolean for discrete states, xsd:string for free-form text, and domain-specific types such as cco:DesignativeICE for designative identifiers. This separation of attribute definition from value storage allows the model to remain extensible; new attributes can be introduced without restructuring existing tables, and type declarations provide a contract that validation logic can enforce at ingestion time.

Entity references and misc values complete the data binding by connecting attribute definitions to concrete data points. The entity column acts as a foreign key pointing back to the identifier of the relationship instance to which the attribute value applies, creating a many-to-one mapping where multiple attributes can describe a single relationship. For example, the observation precedence OTHE-0001 carries attributes describing its duration (1684.40 seconds), its end time (2023-06-01T02:07:24), and its exit code (701), each stored in a type-specific value table that preserves data integrity through schema-level constraints. Similarly, the artifact relationship EXIS-0001 between provenance-cert and backup-storage-array is enriched with a checksum value of 5e8f3c91, a creation date of 2024-03-17, and an identifier of urn:uuid:9f2a, while the constraint CONS-0001 establishing log_level_filter over query_engine carries an effective date of 2023-09-12, an enforcement level of 996, and a mandatory flag set to true.

**t_observation_precedes_other**

| id | observation | precedes |
| --- | --- | --- |
| OTHE-0001 | server_disk_full | firmware_update_init |
| OTHE-0002 | server_disk_full | firmware_update_init |
| OTHE-0003 | server_disk_full | system_boot_sequence |
| OTHE-0004 | packet_drop_event | power_stabilization |
| OTHE-0005 | sensor_calibration_cycle | sensor_warmup_phase |
| OTHE-0006 | sensor_calibration_cycle | data_buffer_reset |
| OTHE-0007 | server_disk_full | config_load_event |

**t_observation_precedes_other_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| OTHE-0001 | duration_seconds | xsd:decimal |
| OTHE-0002 | end_time | xsd:dateTime |
| OTHE-0003 | exit_code | xsd:integer |
| OTHE-0004 | host_name | xsd:string |
| OTHE-0005 | log_level | xsd:string |
| OTHE-0006 | phase | xsd:string |
| OTHE-0007 | retry_count | xsd:integer |
| OTHE-0008 | scheduled_at | xsd:dateTime |

**t_observation_precedes_other_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OTHE-0001 | OTHE-0001 | OTHE-0002 | 2023-06-01T02:07:24 |
| OTHE-0002 | OTHE-0001 | OTHE-0008 | 2024-03-08T22:48:06 |
| OTHE-0003 | OTHE-0001 | OTHE-0009 | 2024-11-20T05:59:50 |
| OTHE-0004 | OTHE-0002 | OTHE-0002 | 2024-10-01T01:54:05 |
| OTHE-0005 | OTHE-0002 | OTHE-0008 | 2023-05-04T16:55:24 |
| OTHE-0006 | OTHE-0002 | OTHE-0009 | 2025-04-07T12:49:05 |
| OTHE-0007 | OTHE-0003 | OTHE-0002 | 2025-01-06T09:52:42 |
| OTHE-0008 | OTHE-0003 | OTHE-0008 | 2024-04-17T14:38:04 |

**t_observation_precedes_other_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OTHE-0001 | OTHE-0001 | OTHE-0001 | 1684.40 |
| OTHE-0002 | OTHE-0002 | OTHE-0001 | 6255.67 |
| OTHE-0003 | OTHE-0003 | OTHE-0001 | 601.58 |
| OTHE-0004 | OTHE-0004 | OTHE-0001 | 5555.66 |
| OTHE-0005 | OTHE-0005 | OTHE-0001 | 2575.99 |
| OTHE-0006 | OTHE-0006 | OTHE-0001 | 3246.85 |
| OTHE-0007 | OTHE-0007 | OTHE-0001 | 663.52 |

**t_observation_precedes_other_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OTHE-0001 | OTHE-0001 | OTHE-0003 | 701 |
| OTHE-0002 | OTHE-0001 | OTHE-0007 | 352 |
| OTHE-0003 | OTHE-0002 | OTHE-0003 | 884 |
| OTHE-0004 | OTHE-0002 | OTHE-0007 | 291 |
| OTHE-0005 | OTHE-0003 | OTHE-0003 | 330 |
| OTHE-0006 | OTHE-0003 | OTHE-0007 | 402 |
| OTHE-0007 | OTHE-0004 | OTHE-0003 | 564 |
| OTHE-0008 | OTHE-0004 | OTHE-0007 | 418 |

**t_observation_precedes_other_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OTHE-0001 | OTHE-0001 | OTHE-0004 | node-a01 |
| OTHE-0002 | OTHE-0001 | OTHE-0005 | Log Level 02 |
| OTHE-0003 | OTHE-0001 | OTHE-0006 | execution |
| OTHE-0004 | OTHE-0001 | OTHE-0010 | pending |
| OTHE-0005 | OTHE-0001 | OTHE-0011 | Triggered By 05 |
| OTHE-0006 | OTHE-0002 | OTHE-0004 | worker-07 |
| OTHE-0007 | OTHE-0002 | OTHE-0005 | Log Level 07 |
| OTHE-0008 | OTHE-0002 | OTHE-0006 | execution |

**t_artifact_with_existential_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EXIS-0001 | EXIS-0001 | EXIS-0002 | 2024-03-17 |
| EXIS-0002 | EXIS-0002 | EXIS-0002 | 2024-10-14 |
| EXIS-0003 | EXIS-0003 | EXIS-0002 | 2023-12-18 |
| EXIS-0004 | EXIS-0004 | EXIS-0002 | 2023-02-05 |
| EXIS-0005 | EXIS-0005 | EXIS-0002 | 2024-03-19 |
| EXIS-0006 | EXIS-0006 | EXIS-0002 | 2025-01-11 |

**t_artifact_with_existential_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EXIS-0001 | EXIS-0001 | EXIS-0006 | 401 |
| EXIS-0002 | EXIS-0001 | EXIS-0008 | 10 |
| EXIS-0003 | EXIS-0002 | EXIS-0006 | 361 |
| EXIS-0004 | EXIS-0002 | EXIS-0008 | 7 |
| EXIS-0005 | EXIS-0003 | EXIS-0006 | 386 |
| EXIS-0006 | EXIS-0003 | EXIS-0008 | 10 |
| EXIS-0007 | EXIS-0004 | EXIS-0006 | 351 |
| EXIS-0008 | EXIS-0004 | EXIS-0008 | 8 |

**t_artifact_with_existential_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EXIS-0001 | EXIS-0001 | EXIS-0001 | 5e8f3c91 |
| EXIS-0002 | EXIS-0001 | EXIS-0003 | urn:uuid:9f2a |
| EXIS-0003 | EXIS-0001 | EXIS-0004 | proprietary |
| EXIS-0004 | EXIS-0001 | EXIS-0009 | on-prem-dc1 |
| EXIS-0005 | EXIS-0001 | EXIS-0005 | application/json |
| EXIS-0006 | EXIS-0001 | EXIS-0010 | Name 06 |
| EXIS-0007 | EXIS-0001 | EXIS-0011 | platform-team |
| EXIS-0008 | EXIS-0001 | EXIS-0012 | Tags 08 |

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

The practical effect of this architecture is that governance data becomes both queryable and auditable at granular levels. An operator can reconstruct the full attribute profile of any relationship by joining the identifier through the entity column to the appropriate value tables, then cross-referencing attribute names and types from the attribute definition table. This design supports complex queries across heterogeneous data types—numeric thresholds like the priority value of 4 on log_level_filter, temporal boundaries like the 2025-06-06 effective date on checksum_algorithm, boolean enforcement flags, and textual descriptors like node-a01 or Encoding 01—while maintaining a consistent structural pattern that scales across different relationship domains. The result is a data model where identifiers provide stability, attributes provide context, types provide validation, entities provide linkage, and values provide the operational detail necessary for compliance verification and incident investigation.