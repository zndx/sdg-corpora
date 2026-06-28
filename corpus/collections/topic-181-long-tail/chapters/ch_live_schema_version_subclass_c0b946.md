---
chapter_id: ch_live_schema_version_subclass_c0b946
topic_id: 181
family: 07_long_tail
cited_terms: ['schema_version_subclass', 'equiv_intersect_with_restriction', 'internal_communication_requirement']
model: engine-refine
---

Within a schema-versioning architecture, each registered schema receives a unique identifier—such as VERS-0001 through VERS-0004—that anchors a versioned record alongside its schema name and release tag. The EventCatalog schema appears under release-11.0, while the AccessControlMatrix schema is tracked across an rc-2.1 candidate and an alpha-0.9 snapshot, and the TelemetryStream schema carries a patch-3.2 designation. These identifiers serve as the primary keys for all downstream attribute definitions and value assignments, ensuring that every property and its associated data can be traced back to a specific schema version.

**t_schema_version_subclass**

| id | schema | schema_version |
| --- | --- | --- |
| VERS-0001 | EventCatalog | release-11.0 |
| VERS-0002 | AccessControlMatrix | rc-2.1 |
| VERS-0003 | AccessControlMatrix | alpha-0.9 |
| VERS-0004 | TelemetryStream | patch-3.2 |
| VERS-0005 | AccessControlMatrix | rc-2.1 |
| VERS-0006 | AssetRegistry | hotfix-2.0 |
| VERS-0007 | AccessControlMatrix | alpha-0.9 |
| VERS-0008 | EventCatalog | hotfix-2.0 |

Attributes are declared against each schema version through a dedicated definition layer that pairs an attribute name with its type. The AccessControlMatrix schema, for instance, carries a checksum defined as an xsd:string, a created_date typed as xsd:date, an identifier with the custom type cco:DesignativeICE, and a license stored as xsd:string. The type system distinguishes between standard XML Schema primitives and domain-specific types, enabling the engine to validate and serialize values according to the correct semantic model. Attribute identifiers themselves—also drawn from the VERS-000x namespace—link these definitions to the concrete values stored in the value tables.

**t_schema_version_subclass_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| VERS-0001 | checksum | xsd:string |
| VERS-0002 | created_date | xsd:date |
| VERS-0003 | identifier | cco:DesignativeICE |
| VERS-0004 | license | xsd:string |
| VERS-0005 | mime_type | xsd:string |
| VERS-0006 | size_bytes | xsd:long |
| VERS-0007 | uri | xsd:string |
| VERS-0008 | version | xsd:integer |

Attribute values are materialized in type-specific tables keyed by a composite of the value record identifier, the entity to which the value belongs, and the attribute being populated. String-valued attributes such as checksums and licenses resolve to values like a3f9c21e, doi:10.1109/x, MPL-2.0, and on-prem-dc1. Date attributes carry ISO-formatted dates including 2024-06-07, 2024-09-26, 2024-06-05, and 2023-07-15. Integer attributes hold numeric measures such as 24, 11, 16, and 12. The entity column in each value table references the schema version identifier, establishing a foreign-key relationship that binds every concrete datum to its originating schema version and attribute definition.

**t_schema_version_subclass_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERS-0001 | VERS-0001 | VERS-0002 | 2024-06-07 |
| VERS-0002 | VERS-0002 | VERS-0002 | 2024-09-26 |
| VERS-0003 | VERS-0003 | VERS-0002 | 2024-06-05 |
| VERS-0004 | VERS-0004 | VERS-0002 | 2023-07-15 |
| VERS-0005 | VERS-0005 | VERS-0002 | 2025-03-15 |
| VERS-0006 | VERS-0006 | VERS-0002 | 2024-09-16 |
| VERS-0007 | VERS-0007 | VERS-0002 | 2023-01-08 |
| VERS-0008 | VERS-0008 | VERS-0002 | 2023-05-20 |

**t_schema_version_subclass_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERS-0001 | VERS-0001 | VERS-0006 | 24 |
| VERS-0002 | VERS-0001 | VERS-0008 | 11 |
| VERS-0003 | VERS-0002 | VERS-0006 | 16 |
| VERS-0004 | VERS-0002 | VERS-0008 | 12 |
| VERS-0005 | VERS-0003 | VERS-0006 | 266 |
| VERS-0006 | VERS-0003 | VERS-0008 | 11 |
| VERS-0007 | VERS-0004 | VERS-0006 | 422 |
| VERS-0008 | VERS-0004 | VERS-0008 | 5 |

**t_schema_version_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERS-0001 | VERS-0001 | VERS-0001 | a3f9c21e |
| VERS-0002 | VERS-0001 | VERS-0003 | doi:10.1109/x |
| VERS-0003 | VERS-0001 | VERS-0004 | MPL-2.0 |
| VERS-0004 | VERS-0001 | VERS-0009 | on-prem-dc1 |
| VERS-0005 | VERS-0001 | VERS-0005 | application/octet-stream |
| VERS-0006 | VERS-0001 | VERS-0010 | Name 06 |
| VERS-0007 | VERS-0001 | VERS-0011 | governance |
| VERS-0008 | VERS-0001 | VERS-0012 | Tags 08 |

Beyond schema-level metadata, the system enforces governance through internal communication requirements that specify how organizational policies are disseminated and maintained. Each requirement—such as the Remote Work Policy Update, the Employee Feedback Loop Mandate, or the Incident Response Notification Rule—is assigned to an enterprise social media platform like Yammer, Discord Internal, or Chatter, and is aligned with an organizational communication goal including Safety Protocol Awareness, Change Management Adoption, or Regulatory Compliance. Review cycles are expressed in days, ranging from 186 days for the Incident Response Notification Rule to 750 days for the Remote Work Policy Update, and each requirement is localized to a language such as English or Japanese. These fields collectively define the operational cadence and audience for each policy communication.

**t_internal_communication_requirement**

| id | internal_communication_requirement | specifies_platform | targets_goal | review_cycle_days | language |
| --- | --- | --- | --- | --- | --- |
| REQU-0001 | Remote Work Policy Update | Yammer | Safety Protocol Awareness | 750 | en |
| REQU-0002 | Employee Feedback Loop Mandate | Discord Internal | Change Management Adoption | 478 | en |
| REQU-0003 | Employee Feedback Loop Mandate | Chatter | Regulatory Compliance | 606 | ja |
| REQU-0004 | Incident Response Notification Rule | Yammer | Regulatory Compliance | 186 | en |
| REQU-0005 | Q3 Transparency Directive | Yammer | Regulatory Compliance | 572 | en |
| REQU-0006 | Internal Knowledge Sharing Standard | Mattermost | Culture Reinforcement | 940 | ja |

A separate equivalence-and-restriction table captures relationships between system components and their associated infrastructure targets. Sensor arrays, event buses, Kafka streams, and telemetry brokers are paired with downstream processors or caches—such as stream_processor_8, sensor_bridge_delta, batch_mirror_main, and vector_cache_prod—and linked to supporting infrastructure like s3_export_bucket, snowflake_warehouse_prod, and prometheus_scrape_target. These relationships enforce data-flow constraints and ensure that communication requirements and schema attributes are evaluated against the correct operational context.

**t_equiv_intersect_with_restriction**

| id | equiv | equiv_2 | related |
| --- | --- | --- | --- |
| REST-0001 | sensor_array_gamma | stream_processor_8 | s3_export_bucket |
| REST-0002 | event_bus_core | sensor_bridge_delta | snowflake_warehouse_prod |
| REST-0003 | kafka_stream_primary | batch_mirror_main | s3_export_bucket |
| REST-0004 | telemetry_broker_alpha | vector_cache_prod | prometheus_scrape_target |