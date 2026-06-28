---
chapter_id: ch_live_policy_authored_by_9b8946
topic_id: 183
family: 01_foundation
cited_terms: ['policy_authored_by', 'subclass_to_process', 'survey_response_record']
model: engine-refine
---

Attribute-driven data modeling separates the definition of what properties an entity possesses from the storage of their actual values, enabling flexible, type-safe representation of heterogeneous information. In this framework, each attribute is declared with a name and a type—such as `duration_seconds` typed as `xsd:decimal`, `end_time` as `xsd:dateTime`, `exit_code` as `xsd:integer`, and `host_name` as `xsd:string`—which establishes a contract for how values must be formatted and validated. This separation is critical in operational domains where process metadata must accommodate diverse data shapes without schema migrations; for instance, the `incident response` process carries a duration measured in decimal seconds (5106.96, 6532.76, 6219.83, 2715.88), an exit code as an integer (684, 195, 63, 361), and a hostname as a string (worker-07, Log Level 02, closeout, pending), each stored in its own typed value table to preserve type integrity.

**t_subclass_to_process_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PROC-0001 | PROC-0001 | PROC-0001 | 5106.96 |
| PROC-0002 | PROC-0002 | PROC-0001 | 6532.76 |
| PROC-0003 | PROC-0003 | PROC-0001 | 6219.83 |
| PROC-0004 | PROC-0004 | PROC-0001 | 2715.88 |
| PROC-0005 | PROC-0005 | PROC-0001 | 3614.44 |
| PROC-0006 | PROC-0006 | PROC-0001 | 6690.61 |

The entity-attribute-value pattern extends across multiple entity types, each identified by a unique identifier that serves as the join key between the attribute definition and its concrete values. Process entities such as `PROC-0001` and `PROC-0002` reference attributes like `PROC-0001` (duration_seconds), `PROC-0002` (end_time), and `PROC-0003` (exit_code) through their respective value tables, with datetime values such as `2024-02-25T00:58:35` and `2025-01-11T16:52:13` anchoring temporal events. This design allows a single process entity to accumulate an arbitrary set of typed attributes without requiring a fixed column structure, supporting extensibility as new process characteristics are discovered.

**t_subclass_to_process**

| id | process |
| --- | --- |
| PROC-0001 | incident response |
| PROC-0002 | data validation |
| PROC-0003 | telemetry aggregation |
| PROC-0004 | batch ingestion |
| PROC-0005 | data validation |
| PROC-0006 | stream processing |

**t_subclass_to_process_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| PROC-0001 | duration_seconds | xsd:decimal |
| PROC-0002 | end_time | xsd:dateTime |
| PROC-0003 | exit_code | xsd:integer |
| PROC-0004 | host_name | xsd:string |
| PROC-0005 | log_level | xsd:string |
| PROC-0006 | phase | xsd:string |
| PROC-0007 | retry_count | xsd:integer |
| PROC-0008 | scheduled_at | xsd:dateTime |

**t_subclass_to_process_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PROC-0001 | PROC-0001 | PROC-0002 | 2024-02-25T00:58:35 |
| PROC-0002 | PROC-0001 | PROC-0008 | 2025-01-11T16:52:13 |
| PROC-0003 | PROC-0001 | PROC-0009 | 2024-01-24T01:55:59 |
| PROC-0004 | PROC-0002 | PROC-0002 | 2024-06-21T23:54:50 |
| PROC-0005 | PROC-0002 | PROC-0008 | 2023-12-17T03:43:06 |
| PROC-0006 | PROC-0002 | PROC-0009 | 2023-12-07T20:42:12 |
| PROC-0007 | PROC-0003 | PROC-0002 | 2024-06-16T15:41:50 |
| PROC-0008 | PROC-0003 | PROC-0008 | 2025-01-20T06:41:15 |

**t_subclass_to_process_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PROC-0001 | PROC-0001 | PROC-0003 | 684 |
| PROC-0002 | PROC-0001 | PROC-0007 | 195 |
| PROC-0003 | PROC-0002 | PROC-0003 | 63 |
| PROC-0004 | PROC-0002 | PROC-0007 | 361 |
| PROC-0005 | PROC-0003 | PROC-0003 | 107 |
| PROC-0006 | PROC-0003 | PROC-0007 | 1 |
| PROC-0007 | PROC-0004 | PROC-0003 | 32 |
| PROC-0008 | PROC-0004 | PROC-0007 | 2 |

**t_subclass_to_process_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PROC-0001 | PROC-0001 | PROC-0004 | worker-07 |
| PROC-0002 | PROC-0001 | PROC-0005 | Log Level 02 |
| PROC-0003 | PROC-0001 | PROC-0006 | closeout |
| PROC-0004 | PROC-0001 | PROC-0010 | pending |
| PROC-0005 | PROC-0001 | PROC-0011 | Triggered By 05 |
| PROC-0006 | PROC-0002 | PROC-0004 | worker-07 |
| PROC-0007 | PROC-0002 | PROC-0005 | Log Level 07 |
| PROC-0008 | PROC-0002 | PROC-0006 | closeout |

Encoding and language metadata govern how textual and structured data is serialized and interpreted across systems, particularly in multi-lingual or cross-border contexts. Survey response records such as `Peer-Review-Submission`, `Q3-2023-Feedback`, and `Safety-Compliance-Check` capture researcher profile attributes like `Clearance-Level`, `Domain-Expertise-Code`, and `Protocol-Approval-Ref` while explicitly declaring their encoding (ascii, unicode, utf8) and language (es, de, en). This dual specification ensures that a Spanish-language response (`es`) encoded in ascii can be correctly distinguished from a German-language response (`de`) in unicode, preventing data corruption during ingestion or exchange. Similarly, policy documents authored by bodies such as the European Commission, NIST Computer Security, and the Federal Trade Commission carry encoding declarations (latin1, ascii) that reflect the character sets of their source materials, with policies like `ISO 27001 Controls` and `EU AI Risk Framework` marked as mandatory (`true`) to enforce compliance requirements.

**t_policy_authored_by**

| id | policy | authored_by | mandatory | encoding |
| --- | --- | --- | --- | --- |
| AUTH-0001 | AWS IAM Permission Boundary | European Commission | false | latin1 |
| AUTH-0002 | PCI DSS Access Standards | NIST Computer Security | false | latin1 |
| AUTH-0003 | ISO 27001 Controls | NIST Computer Security | true | ascii |
| AUTH-0004 | EU AI Risk Framework | Federal Trade Commission | true | latin1 |
| AUTH-0005 | PCI DSS Access Standards | Federal Trade Commission | false | latin1 |
| AUTH-0006 | AWS IAM Permission Boundary | AWS Compliance Office | false | ascii |
| AUTH-0007 | PCI DSS Access Standards | SOC 2 Audit Board | true | unicode |
| AUTH-0008 | CCPA Consumer Rights | Federal Trade Commission | false | unicode |

**t_survey_response_record**

| id | survey_response_record | captures_profile_attribute | encoding | language |
| --- | --- | --- | --- | --- |
| RECO-0001 | Peer-Review-Submission | Clearance-Level | ascii | es |
| RECO-0002 | Q3-2023-Feedback | Domain-Expertise-Code | unicode | de |
| RECO-0003 | Safety-Compliance-Check | Protocol-Approval-Ref | ascii | es |
| RECO-0004 | Q3-2023-Feedback | Protocol-Approval-Ref | utf8 | en |
| RECO-0005 | Incident-Report-Form | Funding-Source-ID | ascii | es |
| RECO-0006 | Field-Obs-Log | Institutional-Affiliation | unicode | de |
| RECO-0007 | Dev-Team-Performance | Protocol-Approval-Ref | ascii | ja |

The mandatory flag on policy-authorship relationships enforces governance constraints at the data level, ensuring that critical policies cannot exist without a documented author. When `ismandatory` is set to `true`, as with `ISO 27001 Controls` and `EU AI Risk Framework`, the system requires a valid `authored_by` reference; when `false`, as with `AWS IAM Permission Boundary` and `PCI DSS Access Standards`, the author field may remain unpopulated. This distinction between required and optional metadata enables differentiated validation rules without hard-coding business logic into application code, allowing governance policies to evolve through data configuration rather than software changes.