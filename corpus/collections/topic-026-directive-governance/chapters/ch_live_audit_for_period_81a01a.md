---
chapter_id: ch_live_audit_for_period_81a01a
topic_id: 26
family: 03_directive_governance
cited_terms: ['audit_for_period', 'claim_supported_by_evidence', 'attrkey_subclass']
model: engine-refine
---

An attribute in this framework is a named property bound to a specific type and anchored by a unique identifier such as `ATTR-0002` or `ATTR-0004`. Attributes serve as the fundamental units of metadata, each carrying a semantic label—`confidence`, `dimension_kind`, `method`, `recorded_at`—and a corresponding XSD type that constrains its value domain: `xsd:decimal`, `xsd:string`, or `xsd:dateTime`. This type discipline ensures that every piece of evidence attached to a claim carries a predictable shape. A claim such as "Model accuracy benchmark" or "Server latency threshold breach" is not asserted in isolation; it is supported by evidence attributes whose types guarantee that downstream consumers can parse, validate, and compare values without ambiguity. The attribute key itself—`lot_number`, `batch_id`, `operator_code`, `voltage_read`—encodes the domain of the property it describes, and the `describes_property` column ties each attribute to a concrete audit period, for instance `PERI-0006` or `PERI-0003`, establishing a traceable link between the metadata and the compliance event it annotates.

**t_audit_for_period**

| id | audit |
| --- | --- |
| PERI-0001 | Data Privacy Impact Assessment |
| PERI-0002 | Data Privacy Impact Assessment |
| PERI-0003 | Annual-2022 |
| PERI-0004 | GDPR Compliance Review |
| PERI-0005 | FINRA Rule 4511 Examination |
| PERI-0006 | Q4-2023 |
| PERI-0007 | FINRA Rule 4511 Examination |
| PERI-0008 | ISO 27001 Certification |

**t_audit_for_period_for_audit_period**

| id | for_audit_period |
| --- | --- |
| PERI-0001 | HIPAA Security Audit |
| PERI-0002 | SOC2 Type II |
| PERI-0003 | HIPAA Security Audit |
| PERI-0004 | ITIL Service Audit |
| PERI-0005 | HIPAA Security Audit |
| PERI-0006 | Q4-2023 |

**t_claim_supported_by_evidence**

| id | claim | supported_by_evidence |
| --- | --- | --- |
| EVID-0001 | Model accuracy benchmark | ATTR-0002 |
| EVID-0002 | Server latency threshold breach | ATTR-0006 |
| EVID-0003 | Server latency threshold breach | ATTR-0002 |
| EVID-0004 | Emissions compliance record | ATTR-0004 |
| EVID-0005 | Emissions compliance record | ATTR-0007 |
| EVID-0006 | Batch ingestion delay anomaly | ATTR-0001 |

**t_claim_supported_by_evidence_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| EVID-0001 | confidence | xsd:decimal |
| EVID-0002 | dimension_kind | xsd:string |
| EVID-0003 | method | xsd:string |
| EVID-0004 | recorded_at | xsd:dateTime |
| EVID-0005 | uncertainty | xsd:decimal |
| EVID-0006 | unit | xsd:string |
| EVID-0007 | value | xsd:decimal |
| EVID-0008 | encoding | xsd:string |

The entity-attribute-value pattern materializes through a family of typed value tables that store attribute data in columns specialized by type. Decimal-valued attributes such as `confidence` appear in `t_claim_supported_by_evidence_val_decimal` with values like `0.768` and `0.833`, while string-valued attributes such as `dimension_kind` and `method` reside in `t_claim_supported_by_evidence_val_varchar` with entries like "Dimension Kind 01", "Encoding 02", and "nightly summary". Temporal attributes are stored in `t_claim_supported_by_evidence_val_datetime`, where `recorded_at` carries ISO 8601 timestamps such as `2024-08-09T04:01:38` and `2023-12-19T17:45:47`. Each value row is keyed by an evidence identifier (`EVID-0001` through `EVID-0004`) and references both the entity being described and the attribute to which the value belongs, creating a normalized structure that separates schema from data while preserving referential integrity across types.

**t_claim_supported_by_evidence_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVID-0001 | EVID-0001 | EVID-0004 | 2024-08-09T04:01:38 |
| EVID-0002 | EVID-0002 | EVID-0004 | 2023-12-19T17:45:47 |
| EVID-0003 | EVID-0003 | EVID-0004 | 2024-10-20T14:55:58 |
| EVID-0004 | EVID-0004 | EVID-0004 | 2024-09-01T03:06:06 |
| EVID-0005 | EVID-0005 | EVID-0004 | 2024-01-23T04:47:13 |
| EVID-0006 | EVID-0006 | EVID-0004 | 2024-03-02T02:15:09 |

**t_claim_supported_by_evidence_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVID-0001 | EVID-0001 | EVID-0001 | 0.768 |
| EVID-0002 | EVID-0001 | EVID-0005 | 631.25 |
| EVID-0003 | EVID-0001 | EVID-0007 | 135.16 |
| EVID-0004 | EVID-0002 | EVID-0001 | 0.833 |
| EVID-0005 | EVID-0002 | EVID-0005 | 5.88 |
| EVID-0006 | EVID-0002 | EVID-0007 | 87.07 |
| EVID-0007 | EVID-0003 | EVID-0001 | 0.936 |
| EVID-0008 | EVID-0003 | EVID-0005 | 975.53 |

**t_claim_supported_by_evidence_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVID-0001 | EVID-0001 | EVID-0002 | Dimension Kind 01 |
| EVID-0002 | EVID-0001 | EVID-0008 | Encoding 02 |
| EVID-0003 | EVID-0001 | EVID-0009 | nightly summary |
| EVID-0004 | EVID-0001 | EVID-0010 | de |
| EVID-0005 | EVID-0001 | EVID-0003 | automated |
| EVID-0006 | EVID-0001 | EVID-0006 | ms |
| EVID-0007 | EVID-0002 | EVID-0002 | Dimension Kind 07 |
| EVID-0008 | EVID-0002 | EVID-0008 | Encoding 08 |

Attributes are further organized into namespaces that delineate their operational domain. The `governance` namespace encompasses attributes like `lot_number` and `batch_id`, which are used in compliance and audit contexts, while the `telemetry` namespace contains `operator_code` and `voltage_read`, which serve operational monitoring purposes. Each attribute also carries a format specification—`CSV`, `UUID`, or `E.164`—that dictates how the underlying data is encoded or transmitted. This dual classification by namespace and format enables automated routing of attribute values to the appropriate downstream systems and ensures that data consumers can apply the correct parsing logic based on the attribute's declared format.

**t_attrkey_subclass**

| id | attrkey | describes_property | format | namespace |
| --- | --- | --- | --- | --- |
| ATTR-0001 | lot_number | PERI-0006 | CSV | governance |
| ATTR-0002 | batch_id | PERI-0004 | UUID | governance |
| ATTR-0003 | operator_code | PERI-0004 | UUID | telemetry |
| ATTR-0004 | voltage_read | PERI-0003 | E.164 | telemetry |
| ATTR-0005 | flow_rate | PERI-0007 | E.164 | governance |
| ATTR-0006 | lot_number | PERI-0007 | CSV | governance |
| ATTR-0007 | ambient_temp | PERI-0006 | JSON | catalog |

Relationships between audit periods are expressed through a subject-target-role triad that captures not only which entities are connected but also the nature of their connection. The junction table `t_audit_for_period__for_audit_period` links a subject audit—identified by `audit_id` such as `PERI-0001` or `PERI-0005`—to a target audit period—identified by `for_audit_period_id` such as `PERI-0003` or `PERI-0005`—and assigns a `role` to the relationship, which in this context takes values of `observer` or `reviewer`. This pattern allows a single audit period like `PERI-0001`, which is itself classified as a "Data Privacy Impact Assessment", to serve as the subject of one relationship and the target of another, with different roles governing its participation in each. The same relationship structure applies across the broader audit ecosystem, where periods classified as "HIPAA Security Audit", "SOC2 Type II", "GDPR Compliance Review", and "ITIL Service Audit" interconnect through these role-labeled edges, forming a directed graph of compliance dependencies.

**t_audit_for_period__for_audit_period**

| id | audit_id | for_audit_period_id | role |
| --- | --- | --- | --- |
| PERI-0001 | PERI-0001 | PERI-0003 | observer |
| PERI-0002 | PERI-0002 | PERI-0005 | reviewer |
| PERI-0003 | PERI-0001 | PERI-0003 | observer |
| PERI-0004 | PERI-0005 | PERI-0003 | reviewer |
| PERI-0005 | PERI-0007 | PERI-0004 | reviewer |
| PERI-0006 | PERI-0001 | PERI-0001 | owner |
| PERI-0007 | PERI-0003 | PERI-0001 | reviewer |
| PERI-0008 | PERI-0008 | PERI-0002 | observer |