---
chapter_id: ch_live_attestation_basic_3a4129
topic_id: 181
family: 03_directive_governance
cited_terms: ['attestation_basic', 'control_observed_via', 'span_with_attribute']
model: engine-refine
---

This Controlled Document establishes the governance framework for structured attestation data, wherein each compliance event is captured through a normalized schema of typed attributes, categorical classifications, and role-based relationships. At the core of the architecture, attestation records are uniquely identified by an identifier—values such as ATTE-0001, ATTE-0002, ATTE-0003, and ATTE-0004 anchor individual compliance activities, ranging from Vendor risk assessment and HIPAA compliance review to ML model fairness audit. These identifiers serve as the primary key for all downstream attribute-value associations, ensuring referential integrity across the data model. The attestation itself constitutes the subject of governance scrutiny, while the entity field establishes the binding relationship between an attestation record and its concrete attribute values, effectively linking abstract compliance events to their measurable characteristics.

**t_attestation_basic**

| id | attestation |
| --- | --- |
| ATTE-0001 | Vendor risk assessment |
| ATTE-0002 | HIPAA compliance review |
| ATTE-0003 | ML model fairness audit |
| ATTE-0004 | HIPAA compliance review |
| ATTE-0005 | SOC 2 Type II audit |
| ATTE-0006 | Vendor risk assessment |

**t_attestation_basic_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ATTE-0001 | duration_seconds | xsd:decimal |
| ATTE-0002 | end_time | xsd:dateTime |
| ATTE-0003 | exit_code | xsd:integer |
| ATTE-0004 | host_name | xsd:string |
| ATTE-0005 | log_level | xsd:string |
| ATTE-0006 | phase | xsd:string |
| ATTE-0007 | retry_count | xsd:integer |
| ATTE-0008 | scheduled_at | xsd:dateTime |

**t_attestation_basic_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTE-0001 | ATTE-0001 | ATTE-0002 | 2024-11-18T12:26:52 |
| ATTE-0002 | ATTE-0001 | ATTE-0008 | 2023-12-15T15:31:35 |
| ATTE-0003 | ATTE-0001 | ATTE-0009 | 2023-03-05T20:41:52 |
| ATTE-0004 | ATTE-0002 | ATTE-0002 | 2023-09-08T13:00:56 |
| ATTE-0005 | ATTE-0002 | ATTE-0008 | 2024-07-29T18:29:50 |
| ATTE-0006 | ATTE-0002 | ATTE-0009 | 2024-08-01T11:14:05 |
| ATTE-0007 | ATTE-0003 | ATTE-0002 | 2023-01-08T06:41:42 |
| ATTE-0008 | ATTE-0003 | ATTE-0008 | 2025-06-10T02:28:19 |

**t_attestation_basic_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTE-0001 | ATTE-0001 | ATTE-0001 | 7132.97 |
| ATTE-0002 | ATTE-0002 | ATTE-0001 | 6429.54 |
| ATTE-0003 | ATTE-0003 | ATTE-0001 | 3894.03 |
| ATTE-0004 | ATTE-0004 | ATTE-0001 | 6507.32 |
| ATTE-0005 | ATTE-0005 | ATTE-0001 | 5722.64 |
| ATTE-0006 | ATTE-0006 | ATTE-0001 | 4627.41 |

**t_attestation_basic_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTE-0001 | ATTE-0001 | ATTE-0003 | 898 |
| ATTE-0002 | ATTE-0001 | ATTE-0007 | 487 |
| ATTE-0003 | ATTE-0002 | ATTE-0003 | 71 |
| ATTE-0004 | ATTE-0002 | ATTE-0007 | 180 |
| ATTE-0005 | ATTE-0003 | ATTE-0003 | 107 |
| ATTE-0006 | ATTE-0003 | ATTE-0007 | 326 |
| ATTE-0007 | ATTE-0004 | ATTE-0003 | 620 |
| ATTE-0008 | ATTE-0004 | ATTE-0007 | 392 |

**t_attestation_basic_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTE-0001 | ATTE-0001 | ATTE-0004 | ingest-21 |
| ATTE-0002 | ATTE-0001 | ATTE-0005 | Log Level 02 |
| ATTE-0003 | ATTE-0001 | ATTE-0006 | initiation |
| ATTE-0004 | ATTE-0001 | ATTE-0010 | superseded |
| ATTE-0005 | ATTE-0001 | ATTE-0011 | Triggered By 05 |
| ATTE-0006 | ATTE-0002 | ATTE-0004 | gw-12 |
| ATTE-0007 | ATTE-0002 | ATTE-0005 | Log Level 07 |
| ATTE-0008 | ATTE-0002 | ATTE-0006 | execution |

**t_control_observed_via**

| id | control |
| --- | --- |
| VIA-0001 | Quality Gate Checkpoint |
| VIA-0002 | Validation Workflow Definition |
| VIA-0003 | Quality Gate Checkpoint |
| VIA-0004 | Quality Gate Checkpoint |
| VIA-0005 | Reference Monitoring Threshold |
| VIA-0006 | Baseline Calibration Protocol |

**t_control_observed_via_observed_via**

| id | observed_via |
| --- | --- |
| VIA-0001 | Audit Log Aggregator |
| VIA-0002 | Quality Check Pipeline |
| VIA-0003 | Audit Log Aggregator |
| VIA-0004 | Audit Log Aggregator |
| VIA-0005 | Reference Monitor Service |
| VIA-0006 | Trace Collector Daemon |

**t_control_observed_via__observed_via**

| id | control_id | observed_via_id | role |
| --- | --- | --- | --- |
| VIA-0001 | VIA-0001 | VIA-0004 | observer |
| VIA-0002 | VIA-0004 | VIA-0004 | reviewer |
| VIA-0003 | VIA-0006 | VIA-0005 | owner |
| VIA-0004 | VIA-0005 | VIA-0003 | reviewer |
| VIA-0005 | VIA-0005 | VIA-0006 | reviewer |
| VIA-0006 | VIA-0005 | VIA-0002 | owner |
| VIA-0007 | VIA-0003 | VIA-0003 | contributor |
| VIA-0008 | VIA-0004 | VIA-0003 | contributor |

Attribute definitions are formalized through a dedicated schema that pairs each attr_name with a corresponding attr_type, enforcing strict data typing across the repository. Duration_seconds, end_time, exit_code, and host_name are among the attributes catalogued, each bound to an XML Schema datatype—xsd:decimal, xsd:dateTime, xsd:integer, and xsd:string respectively—ensuring that value storage and validation conform to standardized type semantics. This separation of attribute metadata from value storage enables a flexible, extensible model where new attributes can be introduced without schema migration, and where the misc values are stored in type-specific tables: decimal values such as 7132.97, 6429.54, 3894.03, and 6507.32 reside in one repository, datetime values like 2024-11-18T12:26:52 and 2023-12-15T15:31:35 in another, integer values including 898, 487, 71, and 180 in a third, and string values such as ingest-21, Log Level 02, initiation, and superseded in a fourth. The entity_id and attr_id columns in each value table form the foreign-key bridge that reconstructs the attribute-value pairs at query time.

The span dimension introduces operational telemetry into the compliance framework, where fact_span records capture execution-level metrics for each span_attribute_key. Duration_seconds values—4963.54, 410.92, 3549.11, and 1972.36—quantify the elapsed time of individual spans, while exit_code values of 767, 893, 599, and 91 encode the termination status of each operation. Retry_count measurements of 494, 145, 428, and 306 provide a direct signal of operational instability, enabling governance teams to correlate compliance failures with system-level degradation. The span_attribute_key column references the dim_span_attribute dimension, which classifies each attribute under a span_attribute_category—Span Attribute Category 01 through 04—and assigns a human-readable span_attribute_label such as Span Attribute Label 01 through Span Attribute Label 04. This categorical taxonomy permits aggregation and filtering of span metrics by functional domain.

**fact_span**

| id | span_attribute_key | duration_seconds | exit_code | retry_count |
| --- | --- | --- | --- | --- |
| ATTR-0001 | ATTR-0002 | 4963.54 | 767 | 494 |
| ATTR-0002 | ATTR-0004 | 410.92 | 893 | 145 |
| ATTR-0003 | ATTR-0004 | 3549.11 | 599 | 428 |
| ATTR-0004 | ATTR-0004 | 1972.36 | 91 | 306 |
| ATTR-0005 | ATTR-0003 | 1000.45 | 966 | 278 |
| ATTR-0006 | ATTR-0004 | 2614.88 | 676 | 0 |

**dim_span_attribute**

| id | span_attribute_label | span_attribute_category |
| --- | --- | --- |
| ATTR-0001 | Span Attribute Label 01 | Span Attribute Category 01 |
| ATTR-0002 | Span Attribute Label 02 | Span Attribute Category 02 |
| ATTR-0003 | Span Attribute Label 03 | Span Attribute Category 03 |
| ATTR-0004 | Span Attribute Label 04 | Span Attribute Category 04 |
| ATTR-0005 | Span Attribute Label 05 | Span Attribute Category 05 |
| ATTR-0006 | Span Attribute Label 06 | Span Attribute Category 06 |

Control observation relationships are modeled through a tripartite structure that links a control to its observed_via mechanism with an explicit role assignment. The control table enumerates governance checkpoints—Quality Gate Checkpoint and Validation Workflow Definition—while the observed_via table identifies the mechanisms by which compliance is verified, including Audit Log Aggregator and Quality Check Pipeline. The join table t_control_observed_via__observed_via binds these entities together, assigning each pair a role: observer, reviewer, or owner. For instance, control VIA-0001 is linked to observed_via VIA-0004 with the role of observer, while VIA-0004 and VIA-0005 carry the reviewer role, and VIA-0003 is associated with the owner role. This role-based linkage ensures that every control observation is traceable to a responsible party, establishing an auditable chain of accountability that satisfies regulatory requirements for evidence provenance and oversight.