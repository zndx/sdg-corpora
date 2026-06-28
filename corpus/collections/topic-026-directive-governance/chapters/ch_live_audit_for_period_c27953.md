---
chapter_id: ch_live_audit_for_period_c27953
topic_id: 26
family: 03_directive_governance
cited_terms: ['audit_for_period', 'xdp_action_drop', 'artifact_max_one_owner']
model: engine-refine
---

Audit governance and data retention rely on a disciplined separation between identifiers, attributes, entities, and the values that bind them. Period identifiers such as PERI-0001 through PERI-0004 anchor audit records to discrete review cycles—Data Privacy Impact Assessment, Annual-2022, and GDPR Compliance Review—while cross-referencing tables map one audit period to another, designating a subject and a target to express dependency or sequencing. Within these mappings, a role column assigns functional positions like observer or reviewer, ensuring that every relationship between audit periods carries an explicit governance posture. The same pattern recurs in artifact ownership, where resources such as telemetry-archive-2023 and etl-transform-stable are linked to owner identifiers like PERI-0003 and PERI-0007, establishing accountability chains that are traceable through the identifier namespace.

**t_audit_for_period**

| id | audit |
| --- | --- |
| PERI-0001 | Data Privacy Impact Assessment |
| PERI-0002 | Data Privacy Impact Assessment |
| PERI-0003 | Annual-2022 |
| PERI-0004 | GDPR Compliance Review |
| PERI-0005 | FINRA Rule 4511 Examination |
| PERI-0006 | Q4-2023 |
| PERI-0007 | FINRA Rule 4511 Examination |
| PERI-0008 | ISO 27001 Certification |

**t_audit_for_period_for_audit_period**

| id | for_audit_period |
| --- | --- |
| PERI-0001 | HIPAA Security Audit |
| PERI-0002 | SOC2 Type II |
| PERI-0003 | HIPAA Security Audit |
| PERI-0004 | ITIL Service Audit |
| PERI-0005 | HIPAA Security Audit |
| PERI-0006 | Q4-2023 |

**t_audit_for_period__for_audit_period**

| id | audit_id | for_audit_period_id | role |
| --- | --- | --- | --- |
| PERI-0001 | PERI-0001 | PERI-0003 | observer |
| PERI-0002 | PERI-0002 | PERI-0005 | reviewer |
| PERI-0003 | PERI-0001 | PERI-0003 | observer |
| PERI-0004 | PERI-0005 | PERI-0003 | reviewer |
| PERI-0005 | PERI-0007 | PERI-0004 | reviewer |
| PERI-0006 | PERI-0001 | PERI-0001 | owner |
| PERI-0007 | PERI-0003 | PERI-0001 | reviewer |
| PERI-0008 | PERI-0008 | PERI-0002 | observer |

**t_artifact_max_one_owner**

| id | artifact | owner |
| --- | --- | --- |
| OWNE-0001 | telemetry-archive-2023 | PERI-0003 |
| OWNE-0002 | etl-transform-stable | PERI-0004 |
| OWNE-0003 | etl-transform-stable | PERI-0007 |
| OWNE-0004 | ml-inference-v2.1 | PERI-0007 |
| OWNE-0005 | ml-inference-v2.1 | PERI-0002 |
| OWNE-0006 | etl-transform-stable | PERI-0006 |

**t_artifact_max_one_owner_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OWNE-0001 | OWNE-0001 | OWNE-0006 | 427 |
| OWNE-0002 | OWNE-0001 | OWNE-0008 | 2 |
| OWNE-0003 | OWNE-0002 | OWNE-0006 | 401 |
| OWNE-0004 | OWNE-0002 | OWNE-0008 | 12 |
| OWNE-0005 | OWNE-0003 | OWNE-0006 | 38 |
| OWNE-0006 | OWNE-0003 | OWNE-0008 | 7 |
| OWNE-0007 | OWNE-0004 | OWNE-0006 | 393 |
| OWNE-0008 | OWNE-0004 | OWNE-0008 | 7 |

**t_artifact_max_one_owner_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OWNE-0001 | OWNE-0001 | OWNE-0001 | c0ffee42 |
| OWNE-0002 | OWNE-0001 | OWNE-0003 | ARN:res/41 |
| OWNE-0003 | OWNE-0001 | OWNE-0004 | MIT |
| OWNE-0004 | OWNE-0001 | OWNE-0009 | rack-7 |
| OWNE-0005 | OWNE-0001 | OWNE-0005 | application/octet-stream |
| OWNE-0006 | OWNE-0001 | OWNE-0010 | Name 06 |
| OWNE-0007 | OWNE-0001 | OWNE-0011 | sre |
| OWNE-0008 | OWNE-0001 | OWNE-0012 | Tags 08 |

Attributes and their types form the schema layer that gives meaning to otherwise opaque values. In both the XDP action drop and artifact ownership domains, attribute definitions enumerate names such as checksum, created_date, identifier, and license, each paired with a type annotation—xsd:string, xsd:date, cco:DesignativeICE—that constrains how values may be stored and validated. The cco:DesignativeICE type, for instance, signals a designative identifier conforming to a controlled vocabulary, while xsd:date enforces ISO 8601 formatting. This type discipline is not decorative; it governs which value table receives a given attribute's data and ensures that downstream queries can rely on consistent semantics across heterogeneous entities.

**t_xdp_action_drop**

| id | xdp | x_d_p_action |
| --- | --- | --- |
| DROP-0001 | wlan0_monitor | PERI-0004 |
| DROP-0002 | veth1_filter | PERI-0008 |
| DROP-0003 | docker0_hook | PERI-0006 |
| DROP-0004 | nfqueue_bridge | PERI-0003 |
| DROP-0005 | eth0_ingress | PERI-0007 |
| DROP-0006 | wlan0_monitor | PERI-0002 |

**t_xdp_action_drop_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| DROP-0001 | checksum | xsd:string |
| DROP-0002 | created_date | xsd:date |
| DROP-0003 | identifier | cco:DesignativeICE |
| DROP-0004 | license | xsd:string |
| DROP-0005 | mime_type | xsd:string |
| DROP-0006 | size_bytes | xsd:long |
| DROP-0007 | uri | xsd:string |
| DROP-0008 | version | xsd:integer |

**t_xdp_action_drop_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DROP-0001 | DROP-0001 | DROP-0002 | 2025-02-22 |
| DROP-0002 | DROP-0002 | DROP-0002 | 2023-10-04 |
| DROP-0003 | DROP-0003 | DROP-0002 | 2025-04-21 |
| DROP-0004 | DROP-0004 | DROP-0002 | 2023-05-09 |
| DROP-0005 | DROP-0005 | DROP-0002 | 2023-08-28 |
| DROP-0006 | DROP-0006 | DROP-0002 | 2023-05-04 |

**t_xdp_action_drop_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DROP-0001 | DROP-0001 | DROP-0006 | 265 |
| DROP-0002 | DROP-0001 | DROP-0008 | 7 |
| DROP-0003 | DROP-0002 | DROP-0006 | 394 |
| DROP-0004 | DROP-0002 | DROP-0008 | 7 |
| DROP-0005 | DROP-0003 | DROP-0006 | 114 |
| DROP-0006 | DROP-0003 | DROP-0008 | 8 |
| DROP-0007 | DROP-0004 | DROP-0006 | 460 |
| DROP-0008 | DROP-0004 | DROP-0008 | 9 |

**t_artifact_max_one_owner_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| OWNE-0001 | checksum | xsd:string |
| OWNE-0002 | created_date | xsd:date |
| OWNE-0003 | identifier | cco:DesignativeICE |
| OWNE-0004 | license | xsd:string |
| OWNE-0005 | mime_type | xsd:string |
| OWNE-0006 | size_bytes | xsd:long |
| OWNE-0007 | uri | xsd:string |
| OWNE-0008 | version | xsd:integer |

**t_artifact_max_one_owner_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OWNE-0001 | OWNE-0001 | OWNE-0002 | 2023-04-04 |
| OWNE-0002 | OWNE-0002 | OWNE-0002 | 2025-04-14 |
| OWNE-0003 | OWNE-0003 | OWNE-0002 | 2024-04-27 |
| OWNE-0004 | OWNE-0004 | OWNE-0002 | 2025-03-27 |
| OWNE-0005 | OWNE-0005 | OWNE-0002 | 2025-06-10 |
| OWNE-0006 | OWNE-0006 | OWNE-0002 | 2023-03-24 |

Entity instances serve as the pivot around which attributes and values orbit. An entity identifier such as DROP-0001 or OWNE-0001 does not carry the attribute data itself; instead, it references a row in one of three value tables—val_date, val_int, or val_varchar—depending on the attribute's declared type. The val_date table stores temporal metadata like 2025-02-22 and 2023-10-04, the val_int table holds numeric measures such as 265 and 394, and the val_varchar table accommodates free-form strings including 1a4b6c2d, urn:uuid:9f2a, CC-BY-4.0, and us-east-1. This tripartite value store eliminates the need for nullable columns and preserves type safety at query time, since each value row is guaranteed to conform to its attribute's declared type.

**t_xdp_action_drop_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DROP-0001 | DROP-0001 | DROP-0001 | 1a4b6c2d |
| DROP-0002 | DROP-0001 | DROP-0003 | urn:uuid:9f2a |
| DROP-0003 | DROP-0001 | DROP-0004 | CC-BY-4.0 |
| DROP-0004 | DROP-0001 | DROP-0009 | us-east-1 |
| DROP-0005 | DROP-0001 | DROP-0005 | application/parquet |
| DROP-0006 | DROP-0001 | DROP-0010 | Name 06 |
| DROP-0007 | DROP-0001 | DROP-0011 | ml-infra |
| DROP-0008 | DROP-0001 | DROP-0012 | Tags 08 |

The practical effect of this architecture is a system where identifiers provide stable references, attributes supply the vocabulary, entities instantiate the data model, and roles encode governance intent. When an XDP action drop record references PERI-0004 through its x_d_p_action column, it ties a network interface such as wlan0_monitor or docker0_hook to a specific audit period, while the associated attribute values—checksums, creation dates, license identifiers—document the provenance and compliance posture of that action. Similarly, artifact ownership records link resources like ml-inference-v2.1 to owner PERI-0007 and attach attributes whose values include rack-7 and ARN:res/41, enabling auditors to reconstruct the full chain of custody from identifier to attribute to value without ambiguity.