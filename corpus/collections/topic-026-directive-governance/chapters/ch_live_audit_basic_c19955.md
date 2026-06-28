---
chapter_id: ch_live_audit_basic_c19955
topic_id: 26
family: 03_directive_governance
cited_terms: ['audit_basic', 'schemaorg_product_sku', 'cardinality_min_one_generic']
model: engine-refine
---

In data governance frameworks, the distinction between an entity and its attributes forms the foundation of structured metadata management. An entity represents a discrete, identifiable object within a domain—whether that is an audit activity such as "Telemetry Integrity Check" or "Model Drift Validation," or a commercial product like the "Pixel 8 Pro" or "PlayStation 5." Each entity receives a stable, machine-readable identifier that serves as its primary key across all downstream references. Audit entities carry identifiers in the form AUDI-0001 through AUDI-0004, while product entities use SKU-0001 through SKU-0004, and these identifiers appear consistently as foreign keys in every attribute-value association table, ensuring referential integrity regardless of the attribute's data type.

**t_audit_basic**

| id | audit |
| --- | --- |
| AUDI-0001 | Telemetry Integrity Check |
| AUDI-0002 | Logging Compliance Review |
| AUDI-0003 | Logging Compliance Review |
| AUDI-0004 | Model Drift Validation |
| AUDI-0005 | Model Drift Validation |
| AUDI-0006 | Pipeline Latency Review |

**t_audit_basic_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| AUDI-0001 | duration_seconds | xsd:decimal |
| AUDI-0002 | end_time | xsd:dateTime |
| AUDI-0003 | exit_code | xsd:integer |
| AUDI-0004 | host_name | xsd:string |
| AUDI-0005 | log_level | xsd:string |
| AUDI-0006 | phase | xsd:string |
| AUDI-0007 | retry_count | xsd:integer |
| AUDI-0008 | scheduled_at | xsd:dateTime |

**t_audit_basic_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AUDI-0001 | AUDI-0001 | AUDI-0002 | 2024-05-14T01:27:39 |
| AUDI-0002 | AUDI-0001 | AUDI-0008 | 2024-03-24T17:57:06 |
| AUDI-0003 | AUDI-0001 | AUDI-0009 | 2023-07-30T11:39:04 |
| AUDI-0004 | AUDI-0002 | AUDI-0002 | 2024-03-11T10:39:38 |
| AUDI-0005 | AUDI-0002 | AUDI-0008 | 2025-01-11T17:40:44 |
| AUDI-0006 | AUDI-0002 | AUDI-0009 | 2024-09-25T22:35:18 |
| AUDI-0007 | AUDI-0003 | AUDI-0002 | 2025-04-27T05:17:32 |
| AUDI-0008 | AUDI-0003 | AUDI-0008 | 2023-12-11T03:24:19 |

**t_audit_basic_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AUDI-0001 | AUDI-0001 | AUDI-0001 | 2391.38 |
| AUDI-0002 | AUDI-0002 | AUDI-0001 | 1955.36 |
| AUDI-0003 | AUDI-0003 | AUDI-0001 | 919.71 |
| AUDI-0004 | AUDI-0004 | AUDI-0001 | 338.61 |
| AUDI-0005 | AUDI-0005 | AUDI-0001 | 1120.15 |
| AUDI-0006 | AUDI-0006 | AUDI-0001 | 6419.06 |

**t_audit_basic_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AUDI-0001 | AUDI-0001 | AUDI-0003 | 765 |
| AUDI-0002 | AUDI-0001 | AUDI-0007 | 217 |
| AUDI-0003 | AUDI-0002 | AUDI-0003 | 123 |
| AUDI-0004 | AUDI-0002 | AUDI-0007 | 33 |
| AUDI-0005 | AUDI-0003 | AUDI-0003 | 601 |
| AUDI-0006 | AUDI-0003 | AUDI-0007 | 361 |
| AUDI-0007 | AUDI-0004 | AUDI-0003 | 79 |
| AUDI-0008 | AUDI-0004 | AUDI-0007 | 456 |

**t_audit_basic_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AUDI-0001 | AUDI-0001 | AUDI-0004 | node-a01 |
| AUDI-0002 | AUDI-0001 | AUDI-0005 | Log Level 02 |
| AUDI-0003 | AUDI-0001 | AUDI-0006 | initiation |
| AUDI-0004 | AUDI-0001 | AUDI-0010 | pending |
| AUDI-0005 | AUDI-0001 | AUDI-0011 | Triggered By 05 |
| AUDI-0006 | AUDI-0002 | AUDI-0004 | ingest-21 |
| AUDI-0007 | AUDI-0002 | AUDI-0005 | Log Level 07 |
| AUDI-0008 | AUDI-0002 | AUDI-0006 | closeout |

**t_schemaorg_product_sku**

| id | schemaorg | s_k_u |
| --- | --- | --- |
| SKU-0001 | Pixel 8 Pro | AUDI-0004 |
| SKU-0002 | MX Master 3S | AUDI-0006 |
| SKU-0003 | Galaxy S24 Ultra | AUDI-0002 |
| SKU-0004 | PlayStation 5 | AUDI-0001 |
| SKU-0005 | PlayStation 5 | AUDI-0005 |
| SKU-0006 | QuietComfort Ultra | AUDI-0004 |

**t_schemaorg_product_sku_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| SKU-0001 | checksum | xsd:string |
| SKU-0002 | created_date | xsd:date |
| SKU-0003 | identifier | cco:DesignativeICE |
| SKU-0004 | license | xsd:string |
| SKU-0005 | mime_type | xsd:string |
| SKU-0006 | size_bytes | xsd:long |
| SKU-0007 | uri | xsd:string |
| SKU-0008 | version | xsd:integer |

**t_schemaorg_product_sku_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SKU-0001 | SKU-0001 | SKU-0006 | 222 |
| SKU-0002 | SKU-0001 | SKU-0008 | 9 |
| SKU-0003 | SKU-0002 | SKU-0006 | 488 |
| SKU-0004 | SKU-0002 | SKU-0008 | 10 |
| SKU-0005 | SKU-0003 | SKU-0006 | 413 |
| SKU-0006 | SKU-0003 | SKU-0008 | 5 |
| SKU-0007 | SKU-0004 | SKU-0006 | 223 |
| SKU-0008 | SKU-0004 | SKU-0008 | 4 |

**t_schemaorg_product_sku_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SKU-0001 | SKU-0001 | SKU-0001 | c0ffee42 |
| SKU-0002 | SKU-0001 | SKU-0003 | ARN:res/41 |
| SKU-0003 | SKU-0001 | SKU-0004 | Apache-2.0 |
| SKU-0004 | SKU-0001 | SKU-0009 | eu-west-3 |
| SKU-0005 | SKU-0001 | SKU-0005 | application/json |
| SKU-0006 | SKU-0001 | SKU-0010 | Name 06 |
| SKU-0007 | SKU-0001 | SKU-0011 | data-engineering |
| SKU-0008 | SKU-0001 | SKU-0012 | Tags 08 |

Attributes define the properties or characteristics that can be measured, recorded, or queried for any given entity. Rather than embedding attribute definitions directly within entity records, a normalized schema separates the attribute schema from its values, enabling flexible extension without schema migration. For audit entities, attributes include duration_seconds, end_time, exit_code, and host_name; for product entities, attributes encompass checksum, created_date, identifier, and license. Each attribute is itself assigned a unique identifier—AUDI-0001 through AUDI-0010 for audit attributes, SKU-0001 through SKU-0009 for product attributes—which becomes the join key in value tables. This two-level identification (entity identifier plus attribute identifier) creates a composite key that uniquely addresses any single data point within the model.

**t_schemaorg_product_sku_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SKU-0001 | SKU-0001 | SKU-0002 | 2025-05-15 |
| SKU-0002 | SKU-0002 | SKU-0002 | 2023-06-09 |
| SKU-0003 | SKU-0003 | SKU-0002 | 2025-02-16 |
| SKU-0004 | SKU-0004 | SKU-0002 | 2024-10-26 |
| SKU-0005 | SKU-0005 | SKU-0002 | 2025-01-20 |
| SKU-0006 | SKU-0006 | SKU-0002 | 2023-04-12 |

Attribute typing governs how values are stored, validated, and queried, and the schema enforces type safety through dedicated value tables per data type. The attribute definition table declares each attribute's type using a vocabulary that includes XML Schema types such as xsd:decimal, xsd:dateTime, xsd:integer, xsd:string, and xsd:date, as well as domain-specific types like cco:DesignativeICE. Values are then materialized in type-specific tables: decimal values such as 2391.38 and 1955.36 for audit durations reside in the decimal value table; datetime values like 2024-05-14T01:27:39 and 2023-07-30T11:39:04 in the datetime table; integer values including 765, 217, and 123 for exit codes in the integer table; and string values such as node-a01, Log Level 02, c0ffee42, and Apache-2.0 in the varchar table. This type-disaggregated design ensures that each value is stored in the most appropriate physical representation while maintaining a uniform logical interface through the entity_id and attr_id foreign keys.

Cardinality constraints and cross-domain mappings extend the model beyond simple key-value storage into governed data relationships. Cardinality rules such as exactlyOne, minOne, and required enforce business constraints on how many related entities must exist—for instance, the constraint GENE-0001 specifying exactlyOne for the related entity AUDI-0004 establishes a mandatory one-to-one relationship. Meanwhile, product-to-audit mappings via the SKU table link commercial identifiers to audit records, as when the Pixel 8 Pro (SKU-0001) references audit entry AUDI-0004, or the MX Master 3S (SKU-0002) references AUDI-0002. These cross-references demonstrate how the same attribute-value infrastructure supports both operational telemetry data and product catalog governance within a unified schema, with the identifier column serving as the connective tissue across all entity types and domains.

**t_cardinality_min_one_generic**

| id | cardinality | related |
| --- | --- | --- |
| GENE-0001 | exactlyOne | AUDI-0004 |
| GENE-0002 | minOne | AUDI-0004 |
| GENE-0003 | minOne | AUDI-0004 |
| GENE-0004 | required | AUDI-0005 |
| GENE-0005 | minOne | AUDI-0004 |
| GENE-0006 | many | AUDI-0001 |