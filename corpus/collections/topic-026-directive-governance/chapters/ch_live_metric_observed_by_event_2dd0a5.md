---
chapter_id: ch_live_metric_observed_by_event_2dd0a5
topic_id: 26
family: 07_long_tail
cited_terms: ['metric_observed_by_event', 'audit_subclass', 'schemaorg_person_email']
model: engine-refine
---

The attribute-value architecture separates schema definition from data instantiation through a disciplined tripartite structure: each entity carries an identifier that anchors a set of named attributes, each attribute carries a type declaration, and each attribute–entity pairing is resolved into typed values stored in dedicated value tables. In the metric observation domain, identifiers such as EVEN-0001 through EVEN-0004 designate distinct performance observations—Memory latency, Disk IOPS, Cache hit ratio, and CPU utilization respectively—while the attribute registry (t_metric_observed_by_event_attr) enumerates the metadata properties applicable to those observations. Attribute names like confidence, dimension_kind, method, and recorded_at are paired with XML Schema types (xsd:decimal, xsd:string, xsd:dateTime) that govern how their values are stored and validated. This type-driven decomposition means that a single observation entity can carry heterogeneous attribute values without requiring a monolithic row structure; instead, decimal values such as 0.221 or 966.79 reside in t_metric_observed_by_event_val_decimal, temporal values like 2023-03-01T06:18:02 in t_metric_observed_by_event_val_datetime, and free-form strings such as "Dimension Kind 01" or "calibration record" in t_metric_observed_by_event_val_varchar. The entity_id column in each value table references back to the observation identifier, while attr_id resolves to the attribute definition, forming a normalized many-to-many relationship between entities and their typed attributes.

**t_metric_observed_by_event**

| id | metric |
| --- | --- |
| EVEN-0001 | Memory latency |
| EVEN-0002 | Disk IOPS |
| EVEN-0003 | Cache hit ratio |
| EVEN-0004 | CPU utilization |
| EVEN-0005 | Queue depth |
| EVEN-0006 | Cache hit ratio |

**t_metric_observed_by_event_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| EVEN-0001 | confidence | xsd:decimal |
| EVEN-0002 | dimension_kind | xsd:string |
| EVEN-0003 | method | xsd:string |
| EVEN-0004 | recorded_at | xsd:dateTime |
| EVEN-0005 | uncertainty | xsd:decimal |
| EVEN-0006 | unit | xsd:string |
| EVEN-0007 | value | xsd:decimal |
| EVEN-0008 | encoding | xsd:string |

**t_metric_observed_by_event_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVEN-0001 | EVEN-0001 | EVEN-0004 | 2023-03-01T06:18:02 |
| EVEN-0002 | EVEN-0002 | EVEN-0004 | 2025-03-12T18:54:27 |
| EVEN-0003 | EVEN-0003 | EVEN-0004 | 2023-04-23T18:00:40 |
| EVEN-0004 | EVEN-0004 | EVEN-0004 | 2023-07-24T13:02:38 |
| EVEN-0005 | EVEN-0005 | EVEN-0004 | 2025-03-15T05:43:19 |
| EVEN-0006 | EVEN-0006 | EVEN-0004 | 2024-11-18T14:01:50 |

**t_metric_observed_by_event_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVEN-0001 | EVEN-0001 | EVEN-0001 | 0.221 |
| EVEN-0002 | EVEN-0001 | EVEN-0005 | 966.79 |
| EVEN-0003 | EVEN-0001 | EVEN-0007 | 495.10 |
| EVEN-0004 | EVEN-0002 | EVEN-0001 | 0.669 |
| EVEN-0005 | EVEN-0002 | EVEN-0005 | 143.93 |
| EVEN-0006 | EVEN-0002 | EVEN-0007 | 270.10 |
| EVEN-0007 | EVEN-0003 | EVEN-0001 | 0.103 |
| EVEN-0008 | EVEN-0003 | EVEN-0005 | 271.02 |

**t_metric_observed_by_event_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVEN-0001 | EVEN-0001 | EVEN-0002 | Dimension Kind 01 |
| EVEN-0002 | EVEN-0001 | EVEN-0008 | Encoding 02 |
| EVEN-0003 | EVEN-0001 | EVEN-0009 | calibration record |
| EVEN-0004 | EVEN-0001 | EVEN-0010 | es |
| EVEN-0005 | EVEN-0001 | EVEN-0003 | manual |
| EVEN-0006 | EVEN-0001 | EVEN-0006 | mg/L |
| EVEN-0007 | EVEN-0002 | EVEN-0002 | Dimension Kind 07 |
| EVEN-0008 | EVEN-0002 | EVEN-0008 | Encoding 08 |

The audit subclass tables mirror this same architectural pattern, applying it to compliance and governance data rather than performance telemetry. Identifiers AUDI-0001 through AUDI-0004 correspond to distinct audit engagements—SOC2 Type II Review, PCI DSS Certification, GDPR Data Flow Assessment, and HIPAA Security Audit—and each engagement carries its own attribute schema defined in t_audit_subclass_attr. Attribute names such as duration_seconds, end_time, exit_code, and host_name are typed as xsd:decimal, xsd:dateTime, xsd:integer, and xsd:string respectively, and their values are distributed across five value tables. Decimal values like 6622.09 or 3520.06 represent duration_seconds; integer values such as 943 or 337 encode exit_code; datetime values including 2023-11-27T16:16:19 capture end_time; and varchar values like "node-b14" or "running" store host_name and status descriptors. The entity_id in each value table points to the audit identifier, and attr_id resolves to the attribute definition, maintaining the same referential discipline as the metric domain.

**t_audit_subclass**

| id | audit |
| --- | --- |
| AUDI-0001 | SOC2 Type II Review |
| AUDI-0002 | PCI DSS Certification |
| AUDI-0003 | GDPR Data Flow Assessment |
| AUDI-0004 | HIPAA Security Audit |
| AUDI-0005 | HIPAA Security Audit |
| AUDI-0006 | 21 CFR Part 11 Audit |

**t_audit_subclass_attr**

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

**t_audit_subclass_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AUDI-0001 | AUDI-0001 | AUDI-0002 | 2023-11-27T16:16:19 |
| AUDI-0002 | AUDI-0001 | AUDI-0008 | 2024-01-27T14:20:44 |
| AUDI-0003 | AUDI-0001 | AUDI-0009 | 2024-07-11T22:06:19 |
| AUDI-0004 | AUDI-0002 | AUDI-0002 | 2023-02-20T00:46:50 |
| AUDI-0005 | AUDI-0002 | AUDI-0008 | 2024-05-24T19:51:15 |
| AUDI-0006 | AUDI-0002 | AUDI-0009 | 2024-12-09T14:14:21 |
| AUDI-0007 | AUDI-0003 | AUDI-0002 | 2024-03-22T08:33:34 |
| AUDI-0008 | AUDI-0003 | AUDI-0008 | 2024-07-04T21:25:06 |

**t_audit_subclass_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AUDI-0001 | AUDI-0001 | AUDI-0001 | 6622.09 |
| AUDI-0002 | AUDI-0002 | AUDI-0001 | 3520.06 |
| AUDI-0003 | AUDI-0003 | AUDI-0001 | 6281.16 |
| AUDI-0004 | AUDI-0004 | AUDI-0001 | 5487.90 |
| AUDI-0005 | AUDI-0005 | AUDI-0001 | 1334.65 |
| AUDI-0006 | AUDI-0006 | AUDI-0001 | 3072.32 |

**t_audit_subclass_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AUDI-0001 | AUDI-0001 | AUDI-0003 | 943 |
| AUDI-0002 | AUDI-0001 | AUDI-0007 | 337 |
| AUDI-0003 | AUDI-0002 | AUDI-0003 | 718 |
| AUDI-0004 | AUDI-0002 | AUDI-0007 | 453 |
| AUDI-0005 | AUDI-0003 | AUDI-0003 | 258 |
| AUDI-0006 | AUDI-0003 | AUDI-0007 | 371 |
| AUDI-0007 | AUDI-0004 | AUDI-0003 | 509 |
| AUDI-0008 | AUDI-0004 | AUDI-0007 | 469 |

**t_audit_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AUDI-0001 | AUDI-0001 | AUDI-0004 | node-b14 |
| AUDI-0002 | AUDI-0001 | AUDI-0005 | Log Level 02 |
| AUDI-0003 | AUDI-0001 | AUDI-0006 | execution |
| AUDI-0004 | AUDI-0001 | AUDI-0010 | running |
| AUDI-0005 | AUDI-0001 | AUDI-0011 | Triggered By 05 |
| AUDI-0006 | AUDI-0002 | AUDI-0004 | worker-07 |
| AUDI-0007 | AUDI-0002 | AUDI-0005 | Log Level 07 |
| AUDI-0008 | AUDI-0002 | AUDI-0006 | execution |

The email domain departs from the EAV pattern in favor of a star schema that couples a fact table with a dimension table. The fact table (fact_schemaorg) is keyed by identifiers EMAI-0001 through EMAI-0004 and carries three non-key columns: email_key, size_bytes, and version. The email_key column functions as a foreign key into the dimension table (dim_email), whose primary key is id and whose descriptive columns are email_label and email_category. A single fact row such as EMAI-0001 references email_key EMAI-0004, which resolves to dim_email row EMAI-0004 bearing email_label "Email Label 04" and email_category "Email Category 04". The size_bytes column stores large integer values—895265030, 114301972, 338701831, 998785819—representing the byte size of the associated email entity, while version stores small integers (3, 5, 4, 8) that track schema or content revisions. This design isolates the categorical and labeling metadata in the dimension table while preserving the measurable quantities (size, version) in the fact table, enabling efficient aggregation and filtering on the numeric columns without joining to descriptive attributes.

**fact_schemaorg**

| id | email_key | size_bytes | version |
| --- | --- | --- | --- |
| EMAI-0001 | EMAI-0004 | 895265030 | 3 |
| EMAI-0002 | EMAI-0002 | 114301972 | 5 |
| EMAI-0003 | EMAI-0005 | 338701831 | 4 |
| EMAI-0004 | EMAI-0005 | 998785819 | 8 |

**dim_email**

| id | email_label | email_category |
| --- | --- | --- |
| EMAI-0001 | Email Label 01 | Email Category 01 |
| EMAI-0002 | Email Label 02 | Email Category 02 |
| EMAI-0003 | Email Label 03 | Email Category 03 |
| EMAI-0004 | Email Label 04 | Email Category 04 |
| EMAI-0005 | Email Label 05 | Email Category 05 |
| EMAI-0006 | Email Label 06 | Email Category 06 |