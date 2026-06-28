---
chapter_id: ch_live_claim_subclass_408ea9
topic_id: 20
family: 06_belief_structure
cited_terms: ['claim_subclass', 'verification_traces_requirement', 'metric_with_unit']
model: engine-refine
---

Identifier and entity form the foundational architecture of any compliance traceability framework, establishing unambiguous anchors for cross-domain verification. Each operational object—whether a failure assertion such as “QC sample failed” or “Packet loss SLA breach,” a verification activity like “ISO 9001 Compliance Audit,” or a performance metric measured in “megabytes per second”—is assigned a persistent identifier (CLAI-0001, REQU-0001, UNIT-0001) that survives schema evolution and system migration. These identifiers do not merely label records; they construct a navigable graph where claims explicitly reference their underlying requirements, and where metrics are bound to their governing units. The entity, in this context, is the operational reality being audited, while the identifier serves as the immutable key that permits regulators, auditors, and automated governance engines to reconstruct the full lineage of any assertion.

**t_verification_traces_requirement**

| id | verification |
| --- | --- |
| REQU-0001 | Functional Safety Assessment |
| REQU-0002 | Type Certification Review |
| REQU-0003 | ISO 9001 Compliance Audit |
| REQU-0004 | FAT Factory Acceptance |
| REQU-0005 | Type Certification Review |
| REQU-0006 | Type Certification Review |

**t_metric_with_unit**

| id | metric | metric_unit |
| --- | --- | --- |
| UNIT-0001 | megabytes per second | REQU-0005 |
| UNIT-0002 | network bandwidth | REQU-0005 |
| UNIT-0003 | degrees Celsius | REQU-0003 |
| UNIT-0004 | hertz | REQU-0005 |
| UNIT-0005 | temperature | REQU-0006 |
| UNIT-0006 | megabytes per second | REQU-0006 |

**t_metric_with_unit_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| UNIT-0001 | UNIT-0001 | UNIT-0006 | 97 |
| UNIT-0002 | UNIT-0001 | UNIT-0008 | 2 |
| UNIT-0003 | UNIT-0002 | UNIT-0006 | 477 |
| UNIT-0004 | UNIT-0002 | UNIT-0008 | 11 |
| UNIT-0005 | UNIT-0003 | UNIT-0006 | 499 |
| UNIT-0006 | UNIT-0003 | UNIT-0008 | 7 |
| UNIT-0007 | UNIT-0004 | UNIT-0006 | 214 |
| UNIT-0008 | UNIT-0004 | UNIT-0008 | 1 |

**t_metric_with_unit_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| UNIT-0001 | UNIT-0001 | UNIT-0001 | c0ffee42 |
| UNIT-0002 | UNIT-0001 | UNIT-0003 | oid:1.3.6.1 |
| UNIT-0003 | UNIT-0001 | UNIT-0004 | GPL-3.0 |
| UNIT-0004 | UNIT-0001 | UNIT-0009 | eu-west-3 |
| UNIT-0005 | UNIT-0001 | UNIT-0005 | application/parquet |
| UNIT-0006 | UNIT-0001 | UNIT-0010 | Name 06 |
| UNIT-0007 | UNIT-0001 | UNIT-0011 | data-engineering |
| UNIT-0008 | UNIT-0001 | UNIT-0012 | Tags 08 |

The `attr` and `attr type` registry extends this backbone by providing a type-safe, extensible metadata layer that decouples structural definition from instance data. Rather than hardcoding measurement fields into rigid tables, the framework declares attributes such as duration_seconds, end_time, exit_code, and host_name, each bound to a canonical type like xsd:decimal, xsd:dateTime, xsd:integer, or xsd:string. For specialized domains, custom type namespaces such as cco:DesignativeICE accommodate proprietary classification schemes. This separation ensures that every verification trace and metric carries a consistent schema, enabling downstream systems to validate, transform, and query metadata without risking type coercion errors or schema drift. The attribute registry thus functions as the governance contract that guarantees data integrity across heterogeneous measurement pipelines.

**t_metric_with_unit_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| UNIT-0001 | checksum | xsd:string |
| UNIT-0002 | created_date | xsd:date |
| UNIT-0003 | identifier | cco:DesignativeICE |
| UNIT-0004 | license | xsd:string |
| UNIT-0005 | mime_type | xsd:string |
| UNIT-0006 | size_bytes | xsd:long |
| UNIT-0007 | uri | xsd:string |
| UNIT-0008 | version | xsd:integer |

The `misc` value tables operationalize this contract by partitioning heterogeneous data into type-specific storage while preserving relational integrity through entity and attribute foreign keys. Timestamps like 2025-01-18T10:03:30 and 2023-06-09T08:44:28 are isolated in datetime stores, decimal measurements such as 5386.82 and 3098.08 reside in dedicated numeric partitions, and integer counters like 954 and 641 are maintained separately from string payloads including gw-12, oid:1.3.6.1, and eu-west-3. This normalization strategy prevents storage bloat, enforces strict validation at ingestion, and allows compliance engines to execute type-aware queries across millions of verification records. By segregating values according to their semantic type, the architecture guarantees that audit evidence remains both machine-readable and mathematically precise.

**t_verification_traces_requirement_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| REQU-0001 | REQU-0001 | REQU-0002 | 2025-01-18T10:03:30 |
| REQU-0002 | REQU-0001 | REQU-0008 | 2023-06-09T08:44:28 |
| REQU-0003 | REQU-0001 | REQU-0009 | 2025-02-02T23:23:29 |
| REQU-0004 | REQU-0002 | REQU-0002 | 2024-03-08T07:44:16 |
| REQU-0005 | REQU-0002 | REQU-0008 | 2024-10-17T04:41:38 |
| REQU-0006 | REQU-0002 | REQU-0009 | 2024-09-18T04:36:09 |
| REQU-0007 | REQU-0003 | REQU-0002 | 2025-05-20T16:00:41 |
| REQU-0008 | REQU-0003 | REQU-0008 | 2025-05-09T00:47:08 |

**t_verification_traces_requirement_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| REQU-0001 | REQU-0001 | REQU-0001 | 5386.82 |
| REQU-0002 | REQU-0002 | REQU-0001 | 3098.08 |
| REQU-0003 | REQU-0003 | REQU-0001 | 4624.20 |
| REQU-0004 | REQU-0004 | REQU-0001 | 6273.82 |
| REQU-0005 | REQU-0005 | REQU-0001 | 833.29 |
| REQU-0006 | REQU-0006 | REQU-0001 | 3490.28 |

`Labeltext` and `method` provide the evidentiary classification layer that determines how claims are sourced, assessed, and weighted within the governance framework. Labeltext anchors each assertion to its documentary origin—whether an audit excerpt, intake form, pre-release note, or calibration record—establishing a clear chain of custody for compliance artifacts. Method specifies the assessment pathway employed to derive or validate the claim, distinguishing between automated telemetry collection, hybrid human-in-the-loop review, and inferred statistical modeling. Together, these fields assign provenance and confidence levels to every record, enabling risk-based prioritization and regulatory reporting. An auditor can instantly distinguish a factory-accepted calibration record validated through automated sensors from an inferred claim derived from indirect telemetry, ensuring that compliance decisions are grounded in appropriately weighted evidence.

The interplay of these components yields a verifiable audit graph capable of supporting continuous compliance, incident response, and regulatory examination. Identifiers bind entities across domains; attributes and their types enforce structural discipline; misc partitions preserve measurement fidelity; and labeltext with method codify provenance and assessment rigor. When a claim such as “Authentication microservice” references requirement REQU-0002, the framework automatically resolves the associated verification activity, retrieves its typed attributes, and surfaces the originating labeltext and method. This end-to-end traceability eliminates siloed data, reduces reconciliation overhead, and provides regulators with an immutable, queryable record of how operational assertions are measured, validated, and documented.

**t_claim_subclass**

| id | claim | claim_about | method | label_text |
| --- | --- | --- | --- | --- |
| CLAI-0001 | Lab centrifuge unit-7 | REQU-0003 | automated | audit excerpt |
| CLAI-0002 | QC sample failed | REQU-0002 | hybrid | intake form |
| CLAI-0003 | Packet loss SLA breach | REQU-0004 | hybrid | pre-release note |
| CLAI-0004 | Authentication microservice | REQU-0002 | inferred | calibration record |

**t_verification_traces_requirement_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| REQU-0001 | duration_seconds | xsd:decimal |
| REQU-0002 | end_time | xsd:dateTime |
| REQU-0003 | exit_code | xsd:integer |
| REQU-0004 | host_name | xsd:string |
| REQU-0005 | log_level | xsd:string |
| REQU-0006 | phase | xsd:string |
| REQU-0007 | retry_count | xsd:integer |
| REQU-0008 | scheduled_at | xsd:dateTime |

**t_verification_traces_requirement_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| REQU-0001 | REQU-0001 | REQU-0003 | 954 |
| REQU-0002 | REQU-0001 | REQU-0007 | 329 |
| REQU-0003 | REQU-0002 | REQU-0003 | 641 |
| REQU-0004 | REQU-0002 | REQU-0007 | 69 |
| REQU-0005 | REQU-0003 | REQU-0003 | 829 |
| REQU-0006 | REQU-0003 | REQU-0007 | 87 |
| REQU-0007 | REQU-0004 | REQU-0003 | 46 |
| REQU-0008 | REQU-0004 | REQU-0007 | 237 |

**t_verification_traces_requirement_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| REQU-0001 | REQU-0001 | REQU-0004 | gw-12 |
| REQU-0002 | REQU-0001 | REQU-0005 | Log Level 02 |
| REQU-0003 | REQU-0001 | REQU-0006 | execution |
| REQU-0004 | REQU-0001 | REQU-0010 | complete |
| REQU-0005 | REQU-0001 | REQU-0011 | Triggered By 05 |
| REQU-0006 | REQU-0002 | REQU-0004 | ingest-21 |
| REQU-0007 | REQU-0002 | REQU-0005 | Log Level 07 |
| REQU-0008 | REQU-0002 | REQU-0006 | execution |

**t_metric_with_unit_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| UNIT-0001 | UNIT-0001 | UNIT-0002 | 2023-09-28 |
| UNIT-0002 | UNIT-0002 | UNIT-0002 | 2024-02-22 |
| UNIT-0003 | UNIT-0003 | UNIT-0002 | 2023-12-02 |
| UNIT-0004 | UNIT-0004 | UNIT-0002 | 2024-09-28 |
| UNIT-0005 | UNIT-0005 | UNIT-0002 | 2024-02-26 |
| UNIT-0006 | UNIT-0006 | UNIT-0002 | 2024-12-06 |