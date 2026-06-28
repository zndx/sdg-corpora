---
chapter_id: ch_live_perf_event_subclass_653345
topic_id: 16
family: 07_long_tail
cited_terms: ['perf_event_subclass', 'column_dropped_at_version', 'gdpr_lawful_basis']
model: engine-refine
---

Identifier serves as the universal anchor across the data model, a stable key that threads through every layer of the registry—from performance event subclass definitions bearing codes such as EVEN-0001 through EVEN-0004, to schema version records identified as VERS-0001 through VERS-0004, to lawful basis entries labeled BASI-0001 through BASI-0004. Each identifier is scoped to its domain: performance events, schema deprecations, and regulatory compliance frameworks respectively—yet all share the same structural role as the immutable handle by which records are referenced, joined, and audited. The entity column extends this referencing discipline into the value layer, where attribute values are not stored inline with their definitions but are instead resolved through a foreign-key link back to the parent record. In the performance event subclass, for instance, date attributes such as created_date are resolved against entity identifiers like EVEN-0001 and EVEN-0002, with actual values ranging from 2023-08-29 to 2025-04-08, while integer attributes tied to the same entities carry values such as 193, 8, 332, and 11. The GDPR lawful basis follows the same pattern: effective_date values like 2023-01-18 and 2025-03-25 are resolved against entity identifiers BASI-0001 through BASI-0004, and boolean flags such as mandatory are stored as true or false for each corresponding entity.

**t_perf_event_subclass**

| id | perf | perf_event_config |
| --- | --- | --- |
| EVEN-0001 | thread_contention | hardware_counter_select |
| EVEN-0002 | disk_io_ops | cpu_affinity_filter |
| EVEN-0003 | disk_io_ops | cpu_affinity_filter |
| EVEN-0004 | network_bytes | sampling_interval_10ms |
| EVEN-0005 | network_bytes | 4gb_memory_pool |
| EVEN-0006 | jvm_heap_used | drop_in_place_policy |

**t_perf_event_subclass_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| EVEN-0001 | checksum | xsd:string |
| EVEN-0002 | created_date | xsd:date |
| EVEN-0003 | identifier | cco:DesignativeICE |
| EVEN-0004 | license | xsd:string |
| EVEN-0005 | mime_type | xsd:string |
| EVEN-0006 | size_bytes | xsd:long |
| EVEN-0007 | uri | xsd:string |
| EVEN-0008 | version | xsd:integer |

**t_perf_event_subclass_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVEN-0001 | EVEN-0001 | EVEN-0002 | 2024-03-08 |
| EVEN-0002 | EVEN-0002 | EVEN-0002 | 2023-08-29 |
| EVEN-0003 | EVEN-0003 | EVEN-0002 | 2025-04-08 |
| EVEN-0004 | EVEN-0004 | EVEN-0002 | 2024-10-09 |
| EVEN-0005 | EVEN-0005 | EVEN-0002 | 2024-06-29 |
| EVEN-0006 | EVEN-0006 | EVEN-0002 | 2025-04-11 |

**t_perf_event_subclass_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVEN-0001 | EVEN-0001 | EVEN-0006 | 193 |
| EVEN-0002 | EVEN-0001 | EVEN-0008 | 8 |
| EVEN-0003 | EVEN-0002 | EVEN-0006 | 332 |
| EVEN-0004 | EVEN-0002 | EVEN-0008 | 11 |
| EVEN-0005 | EVEN-0003 | EVEN-0006 | 351 |
| EVEN-0006 | EVEN-0003 | EVEN-0008 | 10 |
| EVEN-0007 | EVEN-0004 | EVEN-0006 | 314 |
| EVEN-0008 | EVEN-0004 | EVEN-0008 | 12 |

**t_perf_event_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVEN-0001 | EVEN-0001 | EVEN-0001 | 9d2b7a16 |
| EVEN-0002 | EVEN-0001 | EVEN-0003 | oid:1.3.6.1 |
| EVEN-0003 | EVEN-0001 | EVEN-0004 | MPL-2.0 |
| EVEN-0004 | EVEN-0001 | EVEN-0009 | ap-south-2 |
| EVEN-0005 | EVEN-0001 | EVEN-0005 | application/json |
| EVEN-0006 | EVEN-0001 | EVEN-0010 | Name 06 |
| EVEN-0007 | EVEN-0001 | EVEN-0011 | data-engineering |
| EVEN-0008 | EVEN-0001 | EVEN-0012 | Tags 08 |

**t_gdpr_lawful_basis**

| id | gdpr | lawful_basis |
| --- | --- | --- |
| BASI-0001 | AI Act Framework | Legitimate interests |
| BASI-0002 | CCPA Policy | Health research |
| BASI-0003 | CCPA Policy | Health research |
| BASI-0004 | CCPA Policy | Marketing opt-in |
| BASI-0005 | AI Act Framework | Explicit consent |
| BASI-0006 | NIS Directive | Legitimate interests |

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

Attribute metadata—captured as attr_name and attr_type—provides the schema-level contract that governs how values are interpreted. The attr_name column enumerates the semantic labels applied to each property: checksum, created_date, identifier, license for performance events; effective_date, enforcement, mandatory, priority for lawful bases. The attr_type column enforces type discipline through a mix of standard XML Schema types and domain-specific vocabularies, including xsd:string for free-form text, xsd:date for calendar dates, xsd:boolean for binary flags, xsd:integer for whole numbers, and cco:DesignativeICE for coded identifiers. This separation of attribute definition from attribute value is deliberate: it allows the same set of attribute types to be reused across entirely different domains—performance monitoring, schema versioning, and regulatory compliance—without requiring schema changes to the value storage layer.

The value tables themselves are partitioned by data type, each carrying a value column that holds the actual data—varchar values such as 9d2b7a16, oid:1.3.6.1, MPL-2.0, and ap-south-2 in one table; integer values like 4, 683, and 470 in another; boolean values of true and false in a third; and date values spanning from 2023-01-18 to 2025-03-25 in a fourth. This type-partitioned design ensures that type coercion never occurs at query time and that each value table can be optimized for its specific data shape. The identifier column in each value table provides a unique handle for the value row itself, while entity_id and attr_id together form a composite foreign key that resolves the value to a specific attribute on a specific entity.

Confidence and uncertainty form a paired quality metric applied to measured values in the fact column, where the value column holds numeric observations such as 257.80, 571.55, 140.18, and 131.27. Confidence scores—0.164, 0.068, 0.107, and 0.354—quantify the degree of certainty attached to each measurement, while uncertainty values—560.21, 744.10, 984.09, and 404.01—express the magnitude of potential deviation. These metrics are not abstract; they are attached to specific records identified by VERS-0001 through VERS-0004 and are resolved against a dimension table that tracks schema version lifecycle. The dropped_at_schema_version_key column in the fact table links each measurement to a schema version record, and the dimension table provides both a dropped_at_schema_version_label—such as "Dropped At Schema Version Label 01" through "Dropped At Schema Version Label 04"—and a dropped_at_schema_version_category—such as "Dropped At Schema Version Category 01" through "Dropped At Schema Version Category 04"—that classifies the deprecation event. This structure enables auditors to trace any measured value back to the schema version under which it was valid, and to assess whether the confidence and uncertainty associated with that value are acceptable for downstream use.

**fact_column**

| id | dropped_at_schema_version_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| VERS-0001 | VERS-0006 | 0.164 | 560.21 | 257.80 |
| VERS-0002 | VERS-0004 | 0.068 | 744.10 | 571.55 |
| VERS-0003 | VERS-0006 | 0.107 | 984.09 | 140.18 |
| VERS-0004 | VERS-0001 | 0.354 | 404.01 | 131.27 |
| VERS-0005 | VERS-0005 | 0.790 | 109.97 | 235.19 |
| VERS-0006 | VERS-0001 | 0.934 | 653.09 | 813.74 |
| VERS-0007 | VERS-0006 | 0.938 | 827.04 | 409.13 |
| VERS-0008 | VERS-0001 | 0.734 | 419.22 | 492.32 |

**dim_dropped_at_schema_version**

| id | dropped_at_schema_version_label | dropped_at_schema_version_category |
| --- | --- | --- |
| VERS-0001 | Dropped At Schema Version Label 01 | Dropped At Schema Version Category 01 |
| VERS-0002 | Dropped At Schema Version Label 02 | Dropped At Schema Version Category 02 |
| VERS-0003 | Dropped At Schema Version Label 03 | Dropped At Schema Version Category 03 |
| VERS-0004 | Dropped At Schema Version Label 04 | Dropped At Schema Version Category 04 |
| VERS-0005 | Dropped At Schema Version Label 05 | Dropped At Schema Version Category 05 |
| VERS-0006 | Dropped At Schema Version Label 06 | Dropped At Schema Version Category 06 |