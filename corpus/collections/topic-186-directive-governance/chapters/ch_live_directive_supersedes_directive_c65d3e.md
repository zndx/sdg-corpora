---
chapter_id: ch_live_directive_supersedes_directive_c65d3e
topic_id: 186
family: 03_directive_governance
cited_terms: ['directive_supersedes_directive', 'artifact_max_one_owner', 'log_record_subclass']
model: engine-refine
---

Directive supersession records anchor compliance tracking through stable identifiers such as DIRE-0001 through DIRE-0004, each referencing a specific regulatory standard—PCI DSS v4.0 or NERC CIP-003—while a parallel attribute schema defines the metadata properties that govern how each directive is interpreted and enforced. The attribute definitions themselves carry typed descriptors: effective_date maps to xsd:date, enforcement to xsd:string, mandatory to xsd:boolean, and priority to xsd:integer, establishing a disciplined type system that constrains the values permitted for each property. This type discipline propagates into the value tables, where boolean attributes store true or false flags, date attributes hold values like 2024-04-11 or 2023-05-24, integer attributes carry numeric priorities such as 2, 436, 3, or 990, and string attributes capture free-form content including Encoding 01, Enforcement 02, audit excerpt, and en. The separation of attribute definitions from their typed values enables flexible schema evolution without altering the core directive entity, and the entity_id column in each value table binds a particular value back to the directive record it qualifies, creating a normalized star-like structure where the directive identifier serves as the central key.

**t_directive_supersedes_directive**

| id | directive |
| --- | --- |
| DIRE-0001 | PCI DSS v4.0 |
| DIRE-0002 | PCI DSS v4.0 |
| DIRE-0003 | NERC CIP-003 |
| DIRE-0004 | PCI DSS v4.0 |
| DIRE-0005 | NIST SP 800-53 |
| DIRE-0006 | NERC CIP-003 |
| DIRE-0007 | FedRAMP Moderate |
| DIRE-0008 | NERC CIP-003 |

**t_directive_supersedes_directive_attr**

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

The artifact ownership model mirrors this attribute-value decomposition but applies it to resource governance rather than regulatory compliance. Records identified by OWNE-0001 through OWNE-0004 associate artifacts—telemetry-archive-2023, etl-transform-stable, ml-inference-v2.1—with their designated owners, where the owner column references directive identifiers such as DIRE-0003, DIRE-0004, and DIRE-0007, thereby linking resource custody back to the compliance framework. The artifact attribute schema defines checksum, created_date, identifier, and license, with types including xsd:string, xsd:date, cco:DesignativeICE, and xsd:string, and the value tables store concrete instances: checksums like c0ffee42, creation dates spanning 2023-04-04 through 2025-04-14, integer metadata values such as 427 and 401, and license identifiers including MIT alongside rack-7. The one-to-one cardinality implied by the table name ensures each artifact-ownership pairing carries exactly one set of attribute values, simplifying queries that resolve an artifact's provenance or compliance posture.

**t_artifact_max_one_owner**

| id | artifact | owner |
| --- | --- | --- |
| OWNE-0001 | telemetry-archive-2023 | DIRE-0003 |
| OWNE-0002 | etl-transform-stable | DIRE-0004 |
| OWNE-0003 | etl-transform-stable | DIRE-0007 |
| OWNE-0004 | ml-inference-v2.1 | DIRE-0007 |
| OWNE-0005 | ml-inference-v2.1 | DIRE-0002 |
| OWNE-0006 | etl-transform-stable | DIRE-0006 |

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

Log telemetry is captured through a fact table that records individual log entries identified by RECO-0001 through RECO-0004, each tagged with a severity key—RECO-0006, RECO-0004, RECO-0007, RECO-0001—that references a dimension table providing human-readable labels and categorical groupings. The fact table also stores size_bytes, with values ranging from 442,933,768 to 913,386,183 bytes, and version numbers such as 2, 6, and 7, enabling capacity planning and version-based filtering of log data. The dimension table decouples the severity classification from the raw fact records, allowing severity labels and categories to be updated independently of the telemetry data, and supporting analytical queries that aggregate log volume by severity category or track version distribution across severity levels. This star-schema pattern—fact table with foreign keys into dimension tables—is the structural backbone that makes the log data analytically tractable while preserving normalization.

Across all three domains, the identifier column serves as the universal primary key, consistently prefixed to convey provenance: DIRE- for directives, OWNE- for artifact ownership, and RECO- for log records. The entity_id column in value tables acts as the foreign key linking typed values back to their parent entity, whether that entity is a directive, an artifact ownership record, or a log fact. The attr_name and attr_type columns in attribute definition tables establish the schema for each entity type, while the value tables—partitioned by type into boolean, date, integer, and varchar variants—enforce type safety at the storage layer. The category and misc columns in the severity dimension and value tables respectively provide classification and free-form metadata that complement the structured attributes, and the size_bytes and version columns in the log fact table supply quantitative and temporal dimensions for operational analysis. Together, these patterns form a coherent relational architecture where identifiers anchor entities, attributes define their properties, typed values store the data, and foreign keys bind everything into a navigable graph.

**t_directive_supersedes_directive_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DIRE-0001 | DIRE-0001 | DIRE-0003 | true |
| DIRE-0002 | DIRE-0002 | DIRE-0003 | false |
| DIRE-0003 | DIRE-0003 | DIRE-0003 | true |
| DIRE-0004 | DIRE-0004 | DIRE-0003 | false |
| DIRE-0005 | DIRE-0005 | DIRE-0003 | false |
| DIRE-0006 | DIRE-0006 | DIRE-0003 | false |
| DIRE-0007 | DIRE-0007 | DIRE-0003 | false |
| DIRE-0008 | DIRE-0008 | DIRE-0003 | true |

**t_directive_supersedes_directive_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DIRE-0001 | DIRE-0001 | DIRE-0001 | 2024-04-11 |
| DIRE-0002 | DIRE-0002 | DIRE-0001 | 2024-01-18 |
| DIRE-0003 | DIRE-0003 | DIRE-0001 | 2023-05-24 |
| DIRE-0004 | DIRE-0004 | DIRE-0001 | 2023-10-24 |
| DIRE-0005 | DIRE-0005 | DIRE-0001 | 2024-12-26 |
| DIRE-0006 | DIRE-0006 | DIRE-0001 | 2025-05-10 |
| DIRE-0007 | DIRE-0007 | DIRE-0001 | 2025-05-06 |
| DIRE-0008 | DIRE-0008 | DIRE-0001 | 2024-01-25 |

**t_directive_supersedes_directive_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DIRE-0001 | DIRE-0001 | DIRE-0004 | 2 |
| DIRE-0002 | DIRE-0001 | DIRE-0005 | 436 |
| DIRE-0003 | DIRE-0002 | DIRE-0004 | 3 |
| DIRE-0004 | DIRE-0002 | DIRE-0005 | 990 |
| DIRE-0005 | DIRE-0003 | DIRE-0004 | 2 |
| DIRE-0006 | DIRE-0003 | DIRE-0005 | 360 |
| DIRE-0007 | DIRE-0004 | DIRE-0004 | 4 |
| DIRE-0008 | DIRE-0004 | DIRE-0005 | 588 |

**t_directive_supersedes_directive_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DIRE-0001 | DIRE-0001 | DIRE-0007 | Encoding 01 |
| DIRE-0002 | DIRE-0001 | DIRE-0002 | Enforcement 02 |
| DIRE-0003 | DIRE-0001 | DIRE-0008 | audit excerpt |
| DIRE-0004 | DIRE-0001 | DIRE-0009 | en |
| DIRE-0005 | DIRE-0001 | DIRE-0006 | Scope 05 |
| DIRE-0006 | DIRE-0002 | DIRE-0007 | Encoding 06 |
| DIRE-0007 | DIRE-0002 | DIRE-0002 | Enforcement 07 |
| DIRE-0008 | DIRE-0002 | DIRE-0008 | nightly summary |

**t_artifact_max_one_owner_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OWNE-0001 | OWNE-0001 | OWNE-0002 | 2023-04-04 |
| OWNE-0002 | OWNE-0002 | OWNE-0002 | 2025-04-14 |
| OWNE-0003 | OWNE-0003 | OWNE-0002 | 2024-04-27 |
| OWNE-0004 | OWNE-0004 | OWNE-0002 | 2025-03-27 |
| OWNE-0005 | OWNE-0005 | OWNE-0002 | 2025-06-10 |
| OWNE-0006 | OWNE-0006 | OWNE-0002 | 2023-03-24 |

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

**fact_log**

| id | log_severity_key | size_bytes | version |
| --- | --- | --- | --- |
| RECO-0001 | RECO-0006 | 913386183 | 6 |
| RECO-0002 | RECO-0004 | 303816232 | 7 |
| RECO-0003 | RECO-0007 | 758542341 | 7 |
| RECO-0004 | RECO-0001 | 442933768 | 2 |

**dim_log_severity**

| id | log_severity_label | log_severity_category |
| --- | --- | --- |
| RECO-0001 | Log Severity Label 01 | Log Severity Category 01 |
| RECO-0002 | Log Severity Label 02 | Log Severity Category 02 |
| RECO-0003 | Log Severity Label 03 | Log Severity Category 03 |
| RECO-0004 | Log Severity Label 04 | Log Severity Category 04 |
| RECO-0005 | Log Severity Label 05 | Log Severity Category 05 |
| RECO-0006 | Log Severity Label 06 | Log Severity Category 06 |
| RECO-0007 | Log Severity Label 07 | Log Severity Category 07 |