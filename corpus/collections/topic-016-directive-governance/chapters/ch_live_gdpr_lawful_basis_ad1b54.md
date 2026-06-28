---
chapter_id: ch_live_gdpr_lawful_basis_ad1b54
topic_id: 16
family: 07_long_tail
cited_terms: ['gdpr_lawful_basis', 'equiv_union_ice_branches', 'metric_with_aggregation']
model: engine-refine
---

The foundational architecture of the compliance data model rests on a disciplined separation between entities, their attributes, and the typed values those attributes assume. Each entity—whether a GDPR lawful basis record identified by codes such as BASI-0001 or a performance metric like memory_usage_gigabytes identified by AGGR-0001—serves as the anchor point for a set of descriptive properties. These properties, or attributes, are declared independently in schema tables that pair an attr_name with an attr_type, establishing the semantic and structural contract before any value is committed. Attribute names range from effective_date and enforcement to checksum and license, while their declared types span xsd:date, xsd:string, xsd:boolean, xsd:integer, and domain-specific designations such as cco:DesignativeICE. This decoupling of definition from instantiation permits the same attribute vocabulary to be reused across heterogeneous entity families without schema drift.

**t_gdpr_lawful_basis_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| BASI-0001 | effective_date | xsd:date |
| BASI-0002 | enforcement | xsd:string |
| BASI-0003 | mandatory | xsd:boolean |
| BASI-0004 | priority | xsd:integer |
| BASI-0005 | review_cycle_days | xsd:integer |
| BASI-0006 | scope | xsd:string |
| BASI-0007 | encoding | xsd:string |
| BASI-0008 | label_text | xsd:string |

**t_gdpr_lawful_basis_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| BASI-0001 | BASI-0001 | BASI-0003 | false |
| BASI-0002 | BASI-0002 | BASI-0003 | true |
| BASI-0003 | BASI-0003 | BASI-0003 | true |
| BASI-0004 | BASI-0004 | BASI-0003 | false |
| BASI-0005 | BASI-0005 | BASI-0003 | true |
| BASI-0006 | BASI-0006 | BASI-0003 | false |

Value storage follows a type-partitioned pattern that mirrors the declared attr_type. Boolean attributes such as mandatory are persisted in a dedicated value table where each row carries an entity_id, an attr_id, and a value of true or false—records BASI-0001 through BASI-0004 all reference attr_id BASI-0003, yielding values of false, true, true, and false respectively. Date attributes such as effective_date occupy their own value table, with entity BASI-0001 recording 2023-01-18 and entity BASI-0003 recording 2025-03-25, while integer attributes like priority store numeric magnitudes such as 683 and 470 in a parallel table. Variable-length string values—including Encoding 01, intake form, and ja—are routed to a varchar-specific value table. This partitioning ensures type safety at query time and eliminates the need for runtime type coercion, a design choice that matters when compliance auditors require deterministic data contracts across regulatory regimes.

The lawful basis entity table itself illustrates how core business semantics are captured at the entity level. Each row carries an identifier (BASI-0001 through BASI-0004), a gdpr column indicating the applicable regulatory framework—AI Act Framework for BASI-0001 and CCPA Policy for the remaining three—and a lawful_basis column specifying the justification, such as Legitimate interests, Health research, or Marketing opt-in. These three columns form the immutable identity and regulatory context of the record; all additional descriptive metadata flows through the attribute-value tables. The same pattern applies to the metric aggregation entities, where the core table holds the metric name (cpu_utilization_percent, api_response_time_p99) and its aggregation_temporality (per_minute, 5_minutes, 24_hours), while attributes like created_date, identifier, and license are stored externally and linked back through entity_id foreign keys.

**t_gdpr_lawful_basis**

| id | gdpr | lawful_basis |
| --- | --- | --- |
| BASI-0001 | AI Act Framework | Legitimate interests |
| BASI-0002 | CCPA Policy | Health research |
| BASI-0003 | CCPA Policy | Health research |
| BASI-0004 | CCPA Policy | Marketing opt-in |
| BASI-0005 | AI Act Framework | Explicit consent |
| BASI-0006 | NIS Directive | Legitimate interests |

**t_gdpr_lawful_basis_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| BASI-0001 | BASI-0001 | BASI-0001 | 2023-01-18 |
| BASI-0002 | BASI-0002 | BASI-0001 | 2023-01-24 |
| BASI-0003 | BASI-0003 | BASI-0001 | 2025-03-25 |
| BASI-0004 | BASI-0004 | BASI-0001 | 2023-04-09 |
| BASI-0005 | BASI-0005 | BASI-0001 | 2024-12-12 |
| BASI-0006 | BASI-0006 | BASI-0001 | 2025-03-12 |

**t_gdpr_lawful_basis_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| BASI-0001 | BASI-0001 | BASI-0004 | 4 |
| BASI-0002 | BASI-0001 | BASI-0005 | 683 |
| BASI-0003 | BASI-0002 | BASI-0004 | 4 |
| BASI-0004 | BASI-0002 | BASI-0005 | 470 |
| BASI-0005 | BASI-0003 | BASI-0004 | 2 |
| BASI-0006 | BASI-0003 | BASI-0005 | 535 |
| BASI-0007 | BASI-0004 | BASI-0004 | 1 |
| BASI-0008 | BASI-0004 | BASI-0005 | 87 |

**t_gdpr_lawful_basis_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| BASI-0001 | BASI-0001 | BASI-0007 | Encoding 01 |
| BASI-0002 | BASI-0001 | BASI-0002 | Enforcement 02 |
| BASI-0003 | BASI-0001 | BASI-0008 | intake form |
| BASI-0004 | BASI-0001 | BASI-0009 | ja |
| BASI-0005 | BASI-0001 | BASI-0006 | Scope 05 |
| BASI-0006 | BASI-0002 | BASI-0007 | Encoding 06 |
| BASI-0007 | BASI-0002 | BASI-0002 | Enforcement 07 |
| BASI-0008 | BASI-0002 | BASI-0008 | nightly summary |

**t_metric_with_aggregation_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AGGR-0001 | AGGR-0001 | AGGR-0002 | 2025-01-26 |
| AGGR-0002 | AGGR-0002 | AGGR-0002 | 2024-12-19 |
| AGGR-0003 | AGGR-0003 | AGGR-0002 | 2025-05-29 |
| AGGR-0004 | AGGR-0004 | AGGR-0002 | 2024-03-19 |
| AGGR-0005 | AGGR-0005 | AGGR-0002 | 2023-09-16 |
| AGGR-0006 | AGGR-0006 | AGGR-0002 | 2023-04-28 |
| AGGR-0007 | AGGR-0007 | AGGR-0002 | 2024-03-10 |
| AGGR-0008 | AGGR-0008 | AGGR-0002 | 2024-10-06 |

Multilingual labeling and cross-registry equivalence are handled through a dedicated branch table that pairs an equiv identifier with a label_text and a language code. The equiv column carries machine-readable identifiers such as Calibration_Offset, Equipment_Model, and Data_Retention_Policy, while label_text provides the human-facing rendering—calibration record, change rationale, intake form—and language disambiguates the locale, with values of fr, es, and de appearing across the four rows. This structure supports internationalized compliance documentation where the same conceptual branch must be presented in multiple languages without duplicating the underlying entity definition. The language column functions as a discriminator in composite lookups, ensuring that a query for the Spanish rendering of Equipment_Model returns change rationale rather than conflating it with the French or German variants.

**t_equiv_union_ice_branches**

| id | equiv | label_text | language |
| --- | --- | --- | --- |
| BRAN-0001 | Calibration_Offset | calibration record | fr |
| BRAN-0002 | Equipment_Model | change rationale | es |
| BRAN-0003 | Data_Retention_Policy | calibration record | es |
| BRAN-0004 | Quality_Score | intake form | de |
| BRAN-0005 | Quality_Score | change rationale | de |
| BRAN-0006 | Observation_Code | nightly summary | es |
| BRAN-0007 | Safety_Protocol | nightly summary | es |
| BRAN-0008 | Quality_Score | pre-release note | fr |

Identifier conventions throughout the model follow a prefix-based scheme that encodes provenance at a glance. Codes beginning with BASI denote lawful-basis entities, AGGR denote metric-aggregation entities, and BRAN denote equivalence branches, each followed by a zero-padded sequence number. These identifiers serve as primary keys in their respective core tables and as foreign keys in every value table, creating a web of referential integrity that ties typed values back to their entity and attribute definitions. The attr_id column in value tables references the declaration table to resolve the attribute name and type, while the entity_id column resolves to the owning record. This two-hop indirection—value table to attribute table to entity table—is the operational mechanism by which the model achieves both flexibility and traceability, allowing auditors to reconstruct the full attribute profile of any entity by joining across the type-partitioned value stores and verifying each value against its declared attr_type.

**t_metric_with_aggregation**

| id | metric | aggregation_temporality |
| --- | --- | --- |
| AGGR-0001 | memory_usage_gigabytes | per_minute |
| AGGR-0002 | log_error_rate_per_minute | 24_hours |
| AGGR-0003 | cpu_utilization_percent | 5_minutes |
| AGGR-0004 | api_response_time_p99 | 5_minutes |
| AGGR-0005 | queue_depth_messages | 1_month |
| AGGR-0006 | database_connection_pool_active | per_minute |
| AGGR-0007 | http_request_latency_ms | 30_minutes |
| AGGR-0008 | api_response_time_p99 | 1_hour |

**t_metric_with_aggregation_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| AGGR-0001 | checksum | xsd:string |
| AGGR-0002 | created_date | xsd:date |
| AGGR-0003 | identifier | cco:DesignativeICE |
| AGGR-0004 | license | xsd:string |
| AGGR-0005 | mime_type | xsd:string |
| AGGR-0006 | size_bytes | xsd:long |
| AGGR-0007 | uri | xsd:string |
| AGGR-0008 | version | xsd:integer |

**t_metric_with_aggregation_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AGGR-0001 | AGGR-0001 | AGGR-0006 | 105 |
| AGGR-0002 | AGGR-0001 | AGGR-0008 | 11 |
| AGGR-0003 | AGGR-0002 | AGGR-0006 | 324 |
| AGGR-0004 | AGGR-0002 | AGGR-0008 | 2 |
| AGGR-0005 | AGGR-0003 | AGGR-0006 | 334 |
| AGGR-0006 | AGGR-0003 | AGGR-0008 | 9 |
| AGGR-0007 | AGGR-0004 | AGGR-0006 | 424 |
| AGGR-0008 | AGGR-0004 | AGGR-0008 | 12 |

**t_metric_with_aggregation_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AGGR-0001 | AGGR-0001 | AGGR-0001 | 1a4b6c2d |
| AGGR-0002 | AGGR-0001 | AGGR-0003 | ref-8842 |
| AGGR-0003 | AGGR-0001 | AGGR-0004 | Apache-2.0 |
| AGGR-0004 | AGGR-0001 | AGGR-0009 | zone-b |
| AGGR-0005 | AGGR-0001 | AGGR-0005 | text/plain |
| AGGR-0006 | AGGR-0001 | AGGR-0010 | Name 06 |
| AGGR-0007 | AGGR-0001 | AGGR-0011 | data-engineering |
| AGGR-0008 | AGGR-0001 | AGGR-0012 | Tags 08 |