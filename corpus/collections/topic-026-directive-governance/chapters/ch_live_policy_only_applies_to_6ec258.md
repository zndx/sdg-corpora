---
chapter_id: ch_live_policy_only_applies_to_6ec258
topic_id: 26
family: 01_foundation
cited_terms: ['policy_only_applies_to', 'perf_event_subclass', 'claim_basic']
model: engine-refine
---

At the foundation of any governance or operational data model lies a rigorous addressing scheme built on identifiers and entities. The identifier column serves as the immutable primary key for every record, whether it tracks a policy application, a performance event, or a compliance claim. Reference codes such as APPL-0001, EVEN-0001, and CLAI-0001 provide deterministic routing across subsystems, ensuring that audit trails, telemetry streams, and regulatory filings can be correlated without ambiguity. The entity column, by contrast, points to the specific business object or system component that is the subject of governance. When a policy like Privacy Shield Compliance or an encryption baseline is evaluated, the entity field anchors the rule to a concrete target—CLAI-0003 or CLAI-0005—creating a clear line of sight from abstract regulation to operational reality.

**t_perf_event_subclass**

| id | perf | perf_event_config |
| --- | --- | --- |
| EVEN-0001 | thread_contention | CLAI-0004 |
| EVEN-0002 | disk_io_ops | CLAI-0001 |
| EVEN-0003 | disk_io_ops | CLAI-0003 |
| EVEN-0004 | network_bytes | CLAI-0004 |
| EVEN-0005 | network_bytes | CLAI-0004 |
| EVEN-0006 | jvm_heap_used | CLAI-0003 |

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

**t_claim_basic**

| id | claim |
| --- | --- |
| CLAI-0001 | Model accuracy below SLA |
| CLAI-0002 | Schema version deprecated |
| CLAI-0003 | Model accuracy below SLA |
| CLAI-0004 | File checksum matches |
| CLAI-0005 | Compliance audit passed |
| CLAI-0006 | Compliance audit passed |

**t_claim_basic_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CLAI-0001 | CLAI-0001 | CLAI-0004 | 2025-05-28T11:02:08 |
| CLAI-0002 | CLAI-0002 | CLAI-0004 | 2025-04-22T09:44:09 |
| CLAI-0003 | CLAI-0003 | CLAI-0004 | 2025-01-23T06:41:57 |
| CLAI-0004 | CLAI-0004 | CLAI-0004 | 2024-03-14T10:07:11 |
| CLAI-0005 | CLAI-0005 | CLAI-0004 | 2023-08-27T20:51:04 |
| CLAI-0006 | CLAI-0006 | CLAI-0004 | 2025-04-10T08:56:25 |

Once targets are identified, the model captures their metadata through a structured attribute system defined by the attr and attr_type columns. Rather than hardcoding fields into rigid tables, the framework declares properties like checksum, confidence, created_date, and license as discrete attribute names, each bound to a precise data contract via attr_type. This separation of definition from storage enables cross-domain compatibility: a checksum might be typed as xsd:string for raw hex values, while confidence scores are constrained to xsd:decimal for mathematical aggregation, and designative codes like cco:DesignativeICE enforce namespace-aware validation. By decoupling attribute semantics from physical storage, the architecture supports dynamic schema evolution without disrupting downstream analytics or compliance reporting pipelines.

The actual data populating these attributes resides in type-specialized value tables, where the misc column functions as a unified carrier for heterogeneous payloads. Because governance data spans timestamps, floating-point metrics, integers, and free-form strings, the system routes values into dedicated storage buckets while preserving a consistent relational contract. A decimal value such as 0.443 or 443.93 flows into the numeric valuation table, while temporal markers like 2024-03-08 or 2025-05-28T11:02:08 are persisted in date-specific stores. Similarly, opaque identifiers like 9d2b7a16 or 193, and regional tags like ap-south-2 or MPL-2.0, are captured in varchar containers. This value-type segregation guarantees type safety at ingestion while the misc column maintains a single logical interface for retrieval engines and compliance dashboards.

**t_claim_basic_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| CLAI-0001 | confidence | xsd:decimal |
| CLAI-0002 | dimension_kind | xsd:string |
| CLAI-0003 | method | xsd:string |
| CLAI-0004 | recorded_at | xsd:dateTime |
| CLAI-0005 | uncertainty | xsd:decimal |
| CLAI-0006 | unit | xsd:string |
| CLAI-0007 | value | xsd:decimal |
| CLAI-0008 | encoding | xsd:string |

**t_claim_basic_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CLAI-0001 | CLAI-0001 | CLAI-0001 | 0.443 |
| CLAI-0002 | CLAI-0001 | CLAI-0005 | 443.93 |
| CLAI-0003 | CLAI-0001 | CLAI-0007 | 257.71 |
| CLAI-0004 | CLAI-0002 | CLAI-0001 | 0.828 |
| CLAI-0005 | CLAI-0002 | CLAI-0005 | 729.35 |
| CLAI-0006 | CLAI-0002 | CLAI-0007 | 717.18 |
| CLAI-0007 | CLAI-0003 | CLAI-0001 | 0.004 |
| CLAI-0008 | CLAI-0003 | CLAI-0005 | 534.68 |

**t_claim_basic_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CLAI-0001 | CLAI-0001 | CLAI-0002 | Dimension Kind 01 |
| CLAI-0002 | CLAI-0001 | CLAI-0008 | Encoding 02 |
| CLAI-0003 | CLAI-0001 | CLAI-0009 | audit excerpt |
| CLAI-0004 | CLAI-0001 | CLAI-0010 | fr |
| CLAI-0005 | CLAI-0001 | CLAI-0003 | automated |
| CLAI-0006 | CLAI-0001 | CLAI-0006 | m/s |
| CLAI-0007 | CLAI-0002 | CLAI-0002 | Dimension Kind 07 |
| CLAI-0008 | CLAI-0002 | CLAI-0008 | Encoding 08 |

Operational rules and policy applications are further governed through effectivedate and priority columns, which together enforce temporal validity and enforcement hierarchy. The effectivedate column establishes the precise moment a regulation or guideline becomes active, allowing organizations to manage regulatory transitions without data loss; policies such as the Encryption Baseline or Data Classification Guideline are timestamped to dates like 2023-11-05 or 2023-12-18, ensuring that historical claims can be evaluated against the correct regulatory version. Concurrently, the priority column assigns a numerical weight—typically ranging from 3 to 5 in standard deployments—to resolve conflicts when multiple rules apply to the same entity. Higher-priority directives override lower-priority ones during automated compliance checks, guaranteeing that critical security mandates take precedence over administrative guidelines.

**t_policy_only_applies_to**

| id | policy | applies_to | effective_date | priority |
| --- | --- | --- | --- | --- |
| APPL-0001 | Privacy Shield Compliance | CLAI-0003 | 2023-08-29 | 5 |
| APPL-0002 | Encryption Baseline | CLAI-0005 | 2023-11-05 | 5 |
| APPL-0003 | Data Classification Guideline | CLAI-0006 | 2023-08-21 | 3 |
| APPL-0004 | Data Classification Guideline | CLAI-0003 | 2023-12-18 | 3 |
| APPL-0005 | Data Retention Standard | CLAI-0006 | 2024-11-09 | 4 |
| APPL-0006 | Data Classification Guideline | CLAI-0003 | 2023-01-13 | 2 |
| APPL-0007 | Vendor Risk Assessment | CLAI-0001 | 2025-03-17 | 2 |
| APPL-0008 | Network Segmentation Rule | CLAI-0002 | 2024-05-19 | 2 |