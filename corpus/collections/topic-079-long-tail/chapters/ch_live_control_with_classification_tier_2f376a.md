---
chapter_id: ch_live_control_with_classification_tier_2f376a
topic_id: 79
family: 03_directive_governance
cited_terms: ['control_with_classification_tier', 'column_lineage_for_compliance_claim', 'annotation_assigned_by']
model: engine-refine
---

The governance architecture distinguishes between the definition of a control and the assignment of its properties to concrete entities. A control—such as Input sanitization, Role based access, Encryption at rest, or Session expiration—is identified by a stable key like TIER-0001 through TIER-0004. Each control carries a set of attributes, where an attribute name (effective_date, enforcement, mandatory, priority) is paired with a strict type constraint (xsd:date, xsd:string, xsd:boolean, xsd:integer). This separation of schema from instance data ensures that attribute values are validated at ingestion time and that the type system remains decoupled from the business logic governing which controls apply to which entities.

**t_control_with_classification_tier**

| id | control |
| --- | --- |
| TIER-0001 | Input sanitization |
| TIER-0002 | Role based access |
| TIER-0003 | Encryption at rest |
| TIER-0004 | Session expiration |
| TIER-0005 | Firewall rule set |
| TIER-0006 | Encryption at rest |

**t_control_with_classification_tier_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| TIER-0001 | effective_date | xsd:date |
| TIER-0002 | enforcement | xsd:string |
| TIER-0003 | mandatory | xsd:boolean |
| TIER-0004 | priority | xsd:integer |
| TIER-0005 | review_cycle_days | xsd:integer |
| TIER-0006 | scope | xsd:string |
| TIER-0007 | encoding | xsd:string |
| TIER-0008 | label_text | xsd:string |

Attribute values are materialized in type-dispatched value tables, each keyed by a unique identifier and linked to an entity through an entity_id foreign key and to an attribute through an attr_id foreign key. Boolean attributes resolve to true or false across entities TIER-0001 through TIER-0004, all referencing attribute TIER-0003. Date attributes carry effective dates such as 2023-02-10, 2023-09-02, 2024-01-29, and 2024-02-25, each bound to attribute TIER-0001. Integer attributes encode numeric measures—2, 715, 4, 86—associated with attributes TIER-0004 and TIER-0005. Varchar attributes hold free-form strings including Encoding 01, Enforcement 02, audit excerpt, and en, distributed across attributes TIER-0007, TIER-0002, TIER-0008, and TIER-0009. The entity_id column in each value table establishes the many-to-many relationship between entities and attributes, enabling a single entity to carry heterogeneous properties while a single attribute definition can be instantiated across multiple entities.

**t_control_with_classification_tier_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TIER-0001 | TIER-0001 | TIER-0003 | false |
| TIER-0002 | TIER-0002 | TIER-0003 | true |
| TIER-0003 | TIER-0003 | TIER-0003 | true |
| TIER-0004 | TIER-0004 | TIER-0003 | true |
| TIER-0005 | TIER-0005 | TIER-0003 | true |
| TIER-0006 | TIER-0006 | TIER-0003 | false |

**t_control_with_classification_tier_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TIER-0001 | TIER-0001 | TIER-0001 | 2023-02-10 |
| TIER-0002 | TIER-0002 | TIER-0001 | 2023-09-02 |
| TIER-0003 | TIER-0003 | TIER-0001 | 2024-01-29 |
| TIER-0004 | TIER-0004 | TIER-0001 | 2024-02-25 |
| TIER-0005 | TIER-0005 | TIER-0001 | 2025-05-01 |
| TIER-0006 | TIER-0006 | TIER-0001 | 2023-03-16 |

**t_control_with_classification_tier_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TIER-0001 | TIER-0001 | TIER-0004 | 2 |
| TIER-0002 | TIER-0001 | TIER-0005 | 715 |
| TIER-0003 | TIER-0002 | TIER-0004 | 4 |
| TIER-0004 | TIER-0002 | TIER-0005 | 86 |
| TIER-0005 | TIER-0003 | TIER-0004 | 1 |
| TIER-0006 | TIER-0003 | TIER-0005 | 78 |
| TIER-0007 | TIER-0004 | TIER-0004 | 5 |
| TIER-0008 | TIER-0004 | TIER-0005 | 174 |

**t_control_with_classification_tier_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TIER-0001 | TIER-0001 | TIER-0007 | Encoding 01 |
| TIER-0002 | TIER-0001 | TIER-0002 | Enforcement 02 |
| TIER-0003 | TIER-0001 | TIER-0008 | audit excerpt |
| TIER-0004 | TIER-0001 | TIER-0009 | en |
| TIER-0005 | TIER-0001 | TIER-0006 | Scope 05 |
| TIER-0006 | TIER-0002 | TIER-0007 | Encoding 06 |
| TIER-0007 | TIER-0002 | TIER-0002 | Enforcement 07 |
| TIER-0008 | TIER-0002 | TIER-0008 | change rationale |

**t_annotation_assigned_by_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ASSI-0001 | confidence | xsd:decimal |
| ASSI-0002 | dimension_kind | xsd:string |
| ASSI-0003 | method | xsd:string |
| ASSI-0004 | recorded_at | xsd:dateTime |
| ASSI-0005 | uncertainty | xsd:decimal |
| ASSI-0006 | unit | xsd:string |
| ASSI-0007 | value | xsd:decimal |
| ASSI-0008 | encoding | xsd:string |

**t_annotation_assigned_by_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ASSI-0001 | ASSI-0001 | ASSI-0002 | Dimension Kind 01 |
| ASSI-0002 | ASSI-0001 | ASSI-0008 | Encoding 02 |
| ASSI-0003 | ASSI-0001 | ASSI-0009 | calibration record |
| ASSI-0004 | ASSI-0001 | ASSI-0010 | de |
| ASSI-0005 | ASSI-0001 | ASSI-0003 | hybrid |
| ASSI-0006 | ASSI-0001 | ASSI-0006 | nm |
| ASSI-0007 | ASSI-0002 | ASSI-0002 | Dimension Kind 07 |
| ASSI-0008 | ASSI-0002 | ASSI-0008 | Encoding 08 |

A parallel annotation subsystem follows the same structural pattern. Annotations such as compliance_audit, telemetry_ingestion, and provenance_trace are assigned to responsible systems—policy_engine_v2, catalog_sync_daemon, schema_registry_service, etl_pipeline_runner—via the assigned_by column. Annotation attributes include confidence (xsd:decimal), dimension_kind (xsd:string), method (xsd:string), and recorded_at (xsd:dateTime). DateTime values such as 2025-05-21T21:38:03, 2024-06-17T00:22:41, 2023-06-05T19:53:01, and 2025-01-30T17:11:59 are stored in a dedicated value table keyed to attribute ASSI-0004. Decimal values like 0.167, 103.53, 863.30, and 0.404 populate the confidence and measurement tables, while varchar values including Dimension Kind 01, Encoding 02, calibration record, and de are stored against attributes ASSI-0002, ASSI-0008, ASSI-0009, and ASSI-0010. This symmetry between the control and annotation domains permits uniform querying, auditing, and lifecycle management across both.

**t_annotation_assigned_by**

| id | annotation | assigned_by |
| --- | --- | --- |
| ASSI-0001 | compliance_audit | policy_engine_v2 |
| ASSI-0002 | telemetry_ingestion | catalog_sync_daemon |
| ASSI-0003 | provenance_trace | schema_registry_service |
| ASSI-0004 | provenance_trace | etl_pipeline_runner |
| ASSI-0005 | source_system_sync | data_steward_cli |
| ASSI-0006 | source_system_sync | catalog_sync_daemon |

**t_annotation_assigned_by_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ASSI-0001 | ASSI-0001 | ASSI-0004 | 2025-05-21T21:38:03 |
| ASSI-0002 | ASSI-0002 | ASSI-0004 | 2024-06-17T00:22:41 |
| ASSI-0003 | ASSI-0003 | ASSI-0004 | 2023-06-05T19:53:01 |
| ASSI-0004 | ASSI-0004 | ASSI-0004 | 2025-01-30T17:11:59 |
| ASSI-0005 | ASSI-0005 | ASSI-0004 | 2023-08-08T10:34:13 |
| ASSI-0006 | ASSI-0006 | ASSI-0004 | 2023-06-13T10:27:19 |

**t_annotation_assigned_by_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ASSI-0001 | ASSI-0001 | ASSI-0001 | 0.167 |
| ASSI-0002 | ASSI-0001 | ASSI-0005 | 103.53 |
| ASSI-0003 | ASSI-0001 | ASSI-0007 | 863.30 |
| ASSI-0004 | ASSI-0002 | ASSI-0001 | 0.404 |
| ASSI-0005 | ASSI-0002 | ASSI-0005 | 720.81 |
| ASSI-0006 | ASSI-0002 | ASSI-0007 | 58.05 |
| ASSI-0007 | ASSI-0003 | ASSI-0001 | 0.783 |
| ASSI-0008 | ASSI-0003 | ASSI-0005 | 338.86 |

Column-level metadata is organized through a fact-dimension model that separates categorical classification from quantitative assessment. The dimension table dim_column assigns each column a label (Column Label 01 through Column Label 04) and a category (Column Category 01 through Column Category 04), providing the human-readable and organizational context. The fact table fact_column records the analytical properties of each column: a column_key that references another column identifier (for example, CLAI-0005, CLAI-0006, CLAI-0004, CLAI-0001), a confidence score ranging from 0.068 to 0.354, an uncertainty measure spanning 404.01 to 984.09, and a misc value (257.80, 571.55, 140.18, 131.27) that captures residual or unclassified information. Confidence and uncertainty are complementary metrics—lower confidence corresponds to higher uncertainty, as seen in the pair 0.068 and 744.10, while higher confidence (0.354) aligns with lower uncertainty (404.01)—enabling downstream consumers to weight column-level evidence appropriately in data quality assessments and lineage tracing.

**fact_column**

| id | column_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| CLAI-0001 | CLAI-0005 | 0.164 | 560.21 | 257.80 |
| CLAI-0002 | CLAI-0006 | 0.068 | 744.10 | 571.55 |
| CLAI-0003 | CLAI-0004 | 0.107 | 984.09 | 140.18 |
| CLAI-0004 | CLAI-0001 | 0.354 | 404.01 | 131.27 |
| CLAI-0005 | CLAI-0006 | 0.790 | 109.97 | 235.19 |
| CLAI-0006 | CLAI-0003 | 0.934 | 653.09 | 813.74 |
| CLAI-0007 | CLAI-0005 | 0.938 | 827.04 | 409.13 |
| CLAI-0008 | CLAI-0002 | 0.734 | 419.22 | 492.32 |

**dim_column**

| id | column_label | column_category |
| --- | --- | --- |
| CLAI-0001 | Column Label 01 | Column Category 01 |
| CLAI-0002 | Column Label 02 | Column Category 02 |
| CLAI-0003 | Column Label 03 | Column Category 03 |
| CLAI-0004 | Column Label 04 | Column Category 04 |
| CLAI-0005 | Column Label 05 | Column Category 05 |
| CLAI-0006 | Column Label 06 | Column Category 06 |