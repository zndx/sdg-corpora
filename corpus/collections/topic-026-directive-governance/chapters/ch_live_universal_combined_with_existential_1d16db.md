---
chapter_id: ch_live_universal_combined_with_existential_1d16db
topic_id: 26
family: 01_foundation
cited_terms: ['universal_combined_with_existential', 'requirement_traces_to', 'metric_with_aggregation']
model: engine-refine
---

In compliance and governance frameworks, every auditable object must be precisely identified, attributed, and linked to the obligations it satisfies. An identifier serves as the immutable handle for any entity in the system—whether that entity is a physical asset like a Lab_Centrifuge_Rotor, a supply chain event like a Supply_Chain_Shipment, or a regulatory artifact like a GDPR_Consent_Record. These identifiers, formatted as EXIS-0001 through EXIS-0004, anchor each entity to a chain of traceability that connects it to specific compliance requirements. A Network Segmentation Rule or an Access Control Mandate does not exist in isolation; it is traced to concrete targets such as the HIPAA Security Rule, the ISO 27001 Control framework, or a Risk Assessment Matrix, and each link in that chain carries a governance role—owner, reviewer, or contributor—that assigns accountability for maintaining the relationship.

**t_universal_combined_with_existential**

| id | universal | related |
| --- | --- | --- |
| EXIS-0001 | Lab_Centrifuge_Rotor | TRAC-0005 |
| EXIS-0002 | Supply_Chain_Shipment | TRAC-0006 |
| EXIS-0003 | GDPR_Consent_Record | TRAC-0003 |
| EXIS-0004 | Database_Backup_Volume | TRAC-0004 |
| EXIS-0005 | GDPR_Consent_Record | TRAC-0002 |
| EXIS-0006 | Spectral_Analyzer_Module | TRAC-0004 |
| EXIS-0007 | GDPR_Consent_Record | TRAC-0002 |
| EXIS-0008 | Blood_Glucose_Assay | TRAC-0003 |

Attributes are the descriptive properties that give an entity its operational meaning. A metric like memory_usage_gigabytes or api_response_time_p99 is not merely a number; it is a structured observation defined by an attribute name and an attribute type that governs how its value is stored and interpreted. The attribute type encodes semantic constraints—xsd:string for free-form text like a checksum or license identifier, xsd:date for temporal data such as 2025-01-26 or 2024-12-19, and domain-specific types like cco:DesignativeICE for designative identifiers. This type discipline ensures that a license value of Apache-2.0 is stored and validated differently from a date value, and that a numeric reading of 105 or 324 is handled as an integer rather than a string.

**t_metric_with_aggregation**

| id | metric | aggregation_temporality |
| --- | --- | --- |
| AGGR-0001 | memory_usage_gigabytes | TRAC-0005 |
| AGGR-0002 | log_error_rate_per_minute | TRAC-0003 |
| AGGR-0003 | cpu_utilization_percent | TRAC-0007 |
| AGGR-0004 | api_response_time_p99 | TRAC-0006 |
| AGGR-0005 | queue_depth_messages | TRAC-0001 |
| AGGR-0006 | database_connection_pool_active | TRAC-0002 |
| AGGR-0007 | http_request_latency_ms | TRAC-0006 |
| AGGR-0008 | api_response_time_p99 | TRAC-0005 |

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

The entity-attribute-value pattern is the mechanism by which compliance data is materialized. An entity—identified by a key such as AGGR-0001—becomes the subject of one or more attribute assignments, each producing a value that lives in a type-specific storage table. The same entity might carry a varchar value of 1a4b6c2d for a checksum attribute, a date value of 2025-05-29 for a created_date attribute, and an integer value of 11 for a utilization counter. This separation of attribute metadata from attribute values allows the system to evolve its schema without restructuring stored data, while preserving the ability to query all values of a given type across all entities.

Subject and target roles formalize the directionality and responsibility of trace relationships. In a requirement-traces-to-traces-to linkage, the subject is the requirement identifier—TRAC-0001, for instance—while the target is the standard or control it maps to. The role column then specifies the nature of the relationship: the same requirement TRAC-0001 might appear as an owner of its trace to TRAC-0004 in one context and as a contributor in another, reflecting that a single compliance obligation can carry multiple layers of accountability. This role-based framing is essential for audit readiness, because it answers not only which standards a requirement satisfies but also who is responsible for maintaining that satisfaction.

**t_requirement_traces_to**

| id | requirement |
| --- | --- |
| TRAC-0001 | Network Segmentation Rule |
| TRAC-0002 | Access Control Mandate |
| TRAC-0003 | Privacy Compliance Requirement |
| TRAC-0004 | Privacy Compliance Requirement |
| TRAC-0005 | Access Control Mandate |
| TRAC-0006 | Encryption Standard |
| TRAC-0007 | System Availability Target |

**t_requirement_traces_to_traces_to**

| id | traces_to |
| --- | --- |
| TRAC-0001 | HIPAA Security Rule |
| TRAC-0002 | Risk Assessment Matrix |
| TRAC-0003 | Compliance Audit Checklist |
| TRAC-0004 | ISO 27001 Control |
| TRAC-0005 | Penetration Test Suite |
| TRAC-0006 | NIST SP 800-53 |
| TRAC-0007 | Vulnerability Scan Config |

**t_requirement_traces_to__traces_to**

| id | requirement_id | traces_to_id | role |
| --- | --- | --- | --- |
| TRAC-0001 | TRAC-0001 | TRAC-0004 | owner |
| TRAC-0002 | TRAC-0004 | TRAC-0004 | reviewer |
| TRAC-0003 | TRAC-0004 | TRAC-0004 | reviewer |
| TRAC-0004 | TRAC-0001 | TRAC-0004 | contributor |
| TRAC-0005 | TRAC-0007 | TRAC-0005 | contributor |
| TRAC-0006 | TRAC-0002 | TRAC-0003 | observer |
| TRAC-0007 | TRAC-0007 | TRAC-0002 | owner |
| TRAC-0008 | TRAC-0001 | TRAC-0002 | observer |

The practical value of this structure emerges when auditors or compliance officers need to answer questions that span physical assets, regulatory requirements, and operational metrics simultaneously. A Database_Backup_Volume identified as EXIS-0004 traces to requirement TRAC-0004, which in turn maps to the ISO 27001 Control framework under a reviewer role. The same requirement TRAC-0004 also appears as a subject with an owner role in a different linkage, indicating that the Privacy Compliance Requirement it represents has dual accountability. Meanwhile, the metrics monitoring the systems that handle that backup volume—cpu_utilization_percent, log_error_rate_per_minute—carry their own attributes and values, creating a continuous thread from physical infrastructure through compliance obligations to measurable performance indicators.