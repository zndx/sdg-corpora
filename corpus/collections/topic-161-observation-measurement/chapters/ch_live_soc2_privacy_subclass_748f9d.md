---
chapter_id: ch_live_soc2_privacy_subclass_748f9d
topic_id: 161
family: 07_long_tail
cited_terms: ['soc2_privacy_subclass', 'uretprobe_subclass', 'measurement_max_one_value']
model: engine-refine
---

The foundational unit of any structured data model is the identifier, a stable reference that anchors every entity to a unique, machine-readable key. Within the SOC 2 privacy taxonomy, identifiers such as PRIV-0001 through PRIV-0004 designate distinct privacy subclassifications, each carrying a classification label—SOC1-Control-Statement, SOC1-TypeII, SOC2-Processing-Integrity—and a domain assignment like incidentResponse, securityCriteria, or dataRetention. In the uretprobe subsystem, identifiers follow the same discipline: URET-0001 through URET-0004 name return-probe subclasses attached to specific hooks (pthread_create_ret, qt_delete_ret, ssl_read_ret), while VALU-0001 through VALU-0004 identify measurement types ranging from Soil pH to CPU load. The identifier is not merely a label; it is the join key that permits cross-referencing across tables, enabling a single entity to participate in multiple relationship contexts without ambiguity.

**t_soc2_privacy_subclass**

| id | soc |
| --- | --- |
| PRIV-0001 | SOC1-Control-Statement |
| PRIV-0002 | SOC1-TypeII |
| PRIV-0003 | SOC2-Processing-Integrity |
| PRIV-0004 | SOC1-TypeII |
| PRIV-0005 | SOC1-TypeII |
| PRIV-0006 | SOC2-Business-Critical |

**t_soc2_privacy_subclass_for_s_o_c2_domain**

| id | for_s_o_c2_domain |
| --- | --- |
| PRIV-0001 | incidentResponse |
| PRIV-0002 | incidentResponse |
| PRIV-0003 | securityCriteria |
| PRIV-0004 | dataRetention |
| PRIV-0005 | encryptionStandards |
| PRIV-0006 | securityCriteria |

**t_uretprobe_subclass**

| id | uretprobe | attaches_to_return_hook |
| --- | --- | --- |
| URET-0001 | pthread_create_ret | VALU-0004 |
| URET-0002 | pthread_create_ret | VALU-0001 |
| URET-0003 | qt_delete_ret | VALU-0004 |
| URET-0004 | ssl_read_ret | VALU-0003 |
| URET-0005 | libc_malloc_ret | VALU-0001 |
| URET-0006 | pthread_create_ret | VALU-0002 |
| URET-0007 | pthread_create_ret | VALU-0007 |

**t_uretprobe_subclass_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| URET-0001 | checksum | xsd:string |
| URET-0002 | created_date | xsd:date |
| URET-0003 | identifier | cco:DesignativeICE |
| URET-0004 | license | xsd:string |
| URET-0005 | mime_type | xsd:string |
| URET-0006 | size_bytes | xsd:long |
| URET-0007 | uri | xsd:string |
| URET-0008 | version | xsd:integer |

**t_uretprobe_subclass_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| URET-0001 | URET-0001 | URET-0006 | 365 |
| URET-0002 | URET-0001 | URET-0008 | 12 |
| URET-0003 | URET-0002 | URET-0006 | 45 |
| URET-0004 | URET-0002 | URET-0008 | 10 |
| URET-0005 | URET-0003 | URET-0006 | 43 |
| URET-0006 | URET-0003 | URET-0008 | 3 |
| URET-0007 | URET-0004 | URET-0006 | 104 |
| URET-0008 | URET-0004 | URET-0008 | 4 |

**t_uretprobe_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| URET-0001 | URET-0001 | URET-0001 | 9d2b7a16 |
| URET-0002 | URET-0001 | URET-0003 | ARN:res/41 |
| URET-0003 | URET-0001 | URET-0004 | CC-BY-4.0 |
| URET-0004 | URET-0001 | URET-0009 | us-east-1 |
| URET-0005 | URET-0001 | URET-0005 | application/octet-stream |
| URET-0006 | URET-0001 | URET-0010 | Name 06 |
| URET-0007 | URET-0001 | URET-0011 | data-engineering |
| URET-0008 | URET-0001 | URET-0012 | Tags 08 |

Attributes and their types constitute the schema layer that describes what properties an entity may carry. An attribute—checksum, created_date, identifier, license—carries a declared type that constrains the shape of its values: xsd:string for free-form text, xsd:date for calendar dates, cco:DesignativeICE for structured designations. This type declaration is not decorative; it governs how values are stored, validated, and queried. The attribute type sits at the intersection of data governance and implementation, ensuring that a created_date field accepts only ISO 8601 dates (2024-10-13, 2023-10-28) while a license field accepts license identifiers (CC-BY-4.0) and an identifier attribute accepts designative ICEs rather than arbitrary strings.

Entity-value pairs materialize attributes as concrete facts. An entity—say, URET-0001, which names a return-probe subclass—acquires its properties through value assignments that reference both the entity and the attribute. The created_date attribute (URET-0002) receives values such as 2024-10-13 and 2023-10-28 across different entities, stored in a dedicated date-value table. Integer attributes (URET-0006, URET-0008) hold numeric facts like 365 and 12, while varchar attributes (URET-0001, URET-0003, URET-0004, URET-0009) carry strings including 9d2b7a16, ARN:res/41, and us-east-1. The separation of value tables by type—date, integer, varchar—reflects a pragmatic normalization: each value type requires its own storage format, and the entity_id and attr_id columns jointly specify which entity's attribute receives which value.

Relationships between entities are modeled through subject-target-role triples, a pattern that generalizes across domains. In the SOC 2 privacy model, a privacy subclass (subject, e.g., PRIV-0003) relates to a domain (target, e.g., PRIV-0001) through a role such as contributor or owner. The same triple structure appears in the measurement domain, where a measurement (subject, e.g., VALU-0005, representing Soil pH) relates to a numeric value (target, e.g., VALU-0001, holding 98.6) through roles like reviewer or observer. The role column is the semantic glue: it disambiguates why two entities are connected, transforming a bare link into a statement with meaning. A measurement's numeric value is not merely associated with the measurement; it is associated as an observer's reading, a contributor's entry, or a reviewer's annotation.

The interplay of these constructs—identifier, attribute, type, entity, value, subject, target, role—forms a coherent architecture for representing structured knowledge. Identifiers provide stable anchors; attributes and types define the vocabulary of description; entities are the things described; values instantiate properties; and subject-target-role triples encode the relationships that bind entities into a graph rather than a collection of silos. This architecture supports both the rigid typing required for data integrity (xsd:date values in a date column, numeric values in a numeric column) and the flexible relationship modeling required for governance frameworks (a privacy subclass contributing to a domain, a measurement observed by a numeric value). The result is a system where every fact is traceable to its source entity, its attribute definition, and its relational context.

**t_soc2_privacy_subclass__for_s_o_c2_domain**

| id | soc_id | for_s_o_c2_domain_id | role |
| --- | --- | --- | --- |
| PRIV-0001 | PRIV-0003 | PRIV-0001 | contributor |
| PRIV-0002 | PRIV-0006 | PRIV-0005 | contributor |
| PRIV-0003 | PRIV-0003 | PRIV-0003 | owner |
| PRIV-0004 | PRIV-0002 | PRIV-0006 | contributor |
| PRIV-0005 | PRIV-0003 | PRIV-0003 | contributor |
| PRIV-0006 | PRIV-0005 | PRIV-0006 | contributor |
| PRIV-0007 | PRIV-0006 | PRIV-0003 | observer |
| PRIV-0008 | PRIV-0002 | PRIV-0002 | observer |

**t_uretprobe_subclass_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| URET-0001 | URET-0001 | URET-0002 | 2024-10-13 |
| URET-0002 | URET-0002 | URET-0002 | 2023-10-28 |
| URET-0003 | URET-0003 | URET-0002 | 2024-07-11 |
| URET-0004 | URET-0004 | URET-0002 | 2023-10-14 |
| URET-0005 | URET-0005 | URET-0002 | 2023-07-03 |
| URET-0006 | URET-0006 | URET-0002 | 2023-12-10 |
| URET-0007 | URET-0007 | URET-0002 | 2023-01-22 |

**t_measurement_max_one_value**

| id | measurement |
| --- | --- |
| VALU-0001 | Soil pH |
| VALU-0002 | Water turbidity |
| VALU-0003 | Air particulate |
| VALU-0004 | CPU load |
| VALU-0005 | Battery voltage |
| VALU-0006 | Air particulate |
| VALU-0007 | Core temperature |

**t_measurement_max_one_value_numeric_value**

| id | numeric_value |
| --- | --- |
| VALU-0001 | 98.6 |
| VALU-0002 | 120.5 |
| VALU-0003 | 98.6 |
| VALU-0004 | 0.042 |
| VALU-0005 | 0.042 |
| VALU-0006 | 0.85 |

**t_measurement_max_one_value__numeric_value**

| id | measurement_id | numeric_value_id | role |
| --- | --- | --- | --- |
| VALU-0001 | VALU-0005 | VALU-0001 | reviewer |
| VALU-0002 | VALU-0002 | VALU-0003 | observer |
| VALU-0003 | VALU-0005 | VALU-0005 | contributor |
| VALU-0004 | VALU-0003 | VALU-0001 | observer |
| VALU-0005 | VALU-0007 | VALU-0005 | owner |
| VALU-0006 | VALU-0004 | VALU-0005 | observer |
| VALU-0007 | VALU-0003 | VALU-0006 | contributor |
| VALU-0008 | VALU-0002 | VALU-0006 | owner |