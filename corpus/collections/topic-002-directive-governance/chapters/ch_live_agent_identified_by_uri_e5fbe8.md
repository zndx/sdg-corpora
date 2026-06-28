---
chapter_id: ch_live_agent_identified_by_uri_e5fbe8
topic_id: 2
family: 05_provo_lineage
cited_terms: ['agent_identified_by_uri', 'lift_basic', 'log_record_subclass']
model: engine-refine
---

The identification of operational entities and their associated agents requires a disciplined approach to naming, ownership, and provenance. Each agent—whether a weather station, an audit bot, a genomics laboratory director, or an edge device gateway—is resolved through a canonical URI and cross-referenced against a suite of identifiers, including ARN references such as ARN:res/41, URNs like urn:isbn:978316148, and UUIDs such as urn:uuid:9f2a. Ownership is explicitly attributed to teams such as data-engineering and ml-infra, ensuring that accountability for each identified resource is unambiguous and auditable. The URI-based resolution mechanism, exemplified by persistent handles like ark:/13030/n8yy3r, provides a stable dereferenceable key that survives internal identifier churn and supports long-term resource tracking across organizational boundaries.

**t_agent_identified_by_uri**

| id | agent | identified_by_u_r_i | identifier | owner |
| --- | --- | --- | --- | --- |
| URI-0001 | weather-station-alpha | ark:/13030/n8yy3r | ref-8842 | data-engineering |
| URI-0002 | compliance-audit-bot | ark:/13030/n8yy3r | ARN:res/41 | ml-infra |
| URI-0003 | genomics-lab-director | urn:isbn:978316148 | urn:uuid:9f2a | ml-infra |
| URI-0004 | edge-device-gateway | urn:isbn:978316148 | ARN:res/41 | ml-infra |
| URI-0005 | genomics-lab-director | doi:10.5281/zenodo | urn:uuid:9f2a | analytics |
| URI-0006 | edge-device-gateway | doi:10.5281/zenodo | doi:10.1109/x | sre |
| URI-0007 | cern-alice-analysis | urn:isbn:978316148 | urn:uuid:9f2a | sre |

Attributes and their typed values constitute the primary mechanism by which entity characteristics are captured, validated, and queried. The attribute schema distinguishes between semantic names—confidence, dimension_kind, method, recorded_at—and their corresponding data types, which are expressed in XSD notation as xsd:decimal, xsd:string, and xsd:dateTime. This type discipline is enforced through a value partitioning strategy: decimal measurements such as 0.624, 93.24, and 541.29 are stored separately from temporal stamps like 2024-06-13T06:43:09 and 2024-12-03T09:28:05, while free-form text values including Dimension Kind 01, Encoding 02, and change rationale occupy a distinct varchar store. The separation of value types by schema ensures that each column family is optimized for its native data class, reducing storage overhead and eliminating the need for runtime type coercion during query execution.

Entity resolution operates as the connective tissue between attribute definitions and their concrete values. An entity identifier, such as LIFT-0001, serves as the foreign key that binds a specific lift—whether an Observatory Lift or a Freight Service Lift—to its attribute instances and, transitively, to the actual data values. The entity-attribute-value triad is realized through three parallel value tables, each keyed by a composite of entity and attribute identifiers, so that the same attribute, such as recorded_at, can be evaluated against multiple entities while preserving referential integrity. This design permits heterogeneous attribute sets across entities without requiring a wide, sparse relational schema, and it supports the incremental addition of new attributes without schema migration.

**t_lift_basic**

| id | lift |
| --- | --- |
| LIFT-0001 | Observatory Lift |
| LIFT-0002 | Freight Service Lift |
| LIFT-0003 | Freight Service Lift |
| LIFT-0004 | Observatory Lift |
| LIFT-0005 | Observatory Lift |
| LIFT-0006 | Cargo Bay Lift |
| LIFT-0007 | Cargo Bay Lift |

**t_lift_basic_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| LIFT-0001 | confidence | xsd:decimal |
| LIFT-0002 | dimension_kind | xsd:string |
| LIFT-0003 | method | xsd:string |
| LIFT-0004 | recorded_at | xsd:dateTime |
| LIFT-0005 | uncertainty | xsd:decimal |
| LIFT-0006 | unit | xsd:string |
| LIFT-0007 | value | xsd:decimal |
| LIFT-0008 | encoding | xsd:string |

**t_lift_basic_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LIFT-0001 | LIFT-0001 | LIFT-0004 | 2024-06-13T06:43:09 |
| LIFT-0002 | LIFT-0002 | LIFT-0004 | 2024-12-03T09:28:05 |
| LIFT-0003 | LIFT-0003 | LIFT-0004 | 2024-01-28T22:31:03 |
| LIFT-0004 | LIFT-0004 | LIFT-0004 | 2024-06-11T06:27:27 |
| LIFT-0005 | LIFT-0005 | LIFT-0004 | 2023-05-13T18:59:00 |
| LIFT-0006 | LIFT-0006 | LIFT-0004 | 2023-02-07T19:19:23 |
| LIFT-0007 | LIFT-0007 | LIFT-0004 | 2023-12-22T04:56:51 |

**t_lift_basic_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LIFT-0001 | LIFT-0001 | LIFT-0001 | 0.624 |
| LIFT-0002 | LIFT-0001 | LIFT-0005 | 93.24 |
| LIFT-0003 | LIFT-0001 | LIFT-0007 | 541.29 |
| LIFT-0004 | LIFT-0002 | LIFT-0001 | 0.175 |
| LIFT-0005 | LIFT-0002 | LIFT-0005 | 180.41 |
| LIFT-0006 | LIFT-0002 | LIFT-0007 | 256.73 |
| LIFT-0007 | LIFT-0003 | LIFT-0001 | 0.866 |
| LIFT-0008 | LIFT-0003 | LIFT-0005 | 594.06 |

**t_lift_basic_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LIFT-0001 | LIFT-0001 | LIFT-0002 | Dimension Kind 01 |
| LIFT-0002 | LIFT-0001 | LIFT-0008 | Encoding 02 |
| LIFT-0003 | LIFT-0001 | LIFT-0009 | change rationale |
| LIFT-0004 | LIFT-0001 | LIFT-0010 | de |
| LIFT-0005 | LIFT-0001 | LIFT-0003 | manual |
| LIFT-0006 | LIFT-0001 | LIFT-0006 | m/s |
| LIFT-0007 | LIFT-0002 | LIFT-0002 | Dimension Kind 07 |
| LIFT-0008 | LIFT-0002 | LIFT-0008 | Encoding 08 |

Log severity classification and version tracking form the governance backbone for operational telemetry and system state management. The fact_log table records individual log entries with identifiers such as RECO-0001 through RECO-0004, each associated with a severity key—RECO-0006, RECO-0004, RECO-0007, RECO-0001—that resolves through the dimension_log_severity table to a human-readable label and a categorical classification. The severity dimension, with its structured categories ranging from Log Severity Category 01 through Log Severity Category 04, enables aggregation and filtering of log data by operational criticality, while the size_bytes column—holding values such as 913386183, 303816232, and 758542341—provides a quantitative measure of log volume that supports capacity planning and cost attribution. The version column, with discrete values of 2, 6, and 7, anchors each log record to a specific system release, enabling temporal correlation between log patterns and software changes.

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