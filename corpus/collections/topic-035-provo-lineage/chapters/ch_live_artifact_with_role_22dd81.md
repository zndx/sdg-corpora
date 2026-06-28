---
chapter_id: ch_live_artifact_with_role_22dd81
topic_id: 35
family: 01_foundation
cited_terms: ['artifact_with_role', 'agent_responsible_for', 'telemetry_span_observes_syscall']
model: engine-refine
---

Within the governance and telemetry architecture, every managed object is anchored by a unique identifier—a structured token such as ROLE-0001, RESP-0001, or SYSC-0001—that serves as the immutable primary key across all relational tables. These identifiers disambiguate records regardless of the semantic domain they inhabit, whether an artifact, an agent, or a telemetry span. The identifier column appears consistently as the keyed column in every table, establishing a uniform addressing scheme that permits cross-table joins without ambiguity. When an artifact such as patient-cohorts-2023 is assigned the identifier ROLE-0001, that identifier becomes the stable reference point for all downstream relationships, including size measurements, checksum verifications, and role assignments.

**t_artifact_with_role**

| id | artifact | role | checksum | size_bytes |
| --- | --- | --- | --- | --- |
| ROLE-0001 | patient-cohorts-2023 | source-dataset | 5e8f3c91 | 666903238 |
| ROLE-0002 | patient-cohorts-2023 | transform-stage | 7b14de08 | 309925726 |
| ROLE-0003 | feature-store-cache | output-sink | a3f9c21e | 29914871 |
| ROLE-0004 | feature-store-cache | archival-copy | 9d2b7a16 | 347040623 |

**t_agent_responsible_for**

| id | agent |
| --- | --- |
| RESP-0001 | KafkaSource |
| RESP-0002 | LabSpectrometer |
| RESP-0003 | AuditDaemon |
| RESP-0004 | ComplianceOfficer |
| RESP-0005 | MetadataIndexer |
| RESP-0006 | MetadataIndexer |
| RESP-0007 | SampleHandler |
| RESP-0008 | PipelineOrchestrator |

**t_agent_responsible_for_responsible_for**

| id | responsible_for |
| --- | --- |
| RESP-0001 | CustomerTransactions |
| RESP-0002 | LabSamples |
| RESP-0003 | PipelineMetrics |
| RESP-0004 | AuditTrail |
| RESP-0005 | ResearchDataset |
| RESP-0006 | PipelineMetrics |

**t_telemetry_span_observes_syscall**

| id | telemetry |
| --- | --- |
| SYSC-0001 | Prometheus |
| SYSC-0002 | SignalFx Stream Processor |
| SYSC-0003 | Dynatrace OneAgent |
| SYSC-0004 | Prometheus |
| SYSC-0005 | OpenTelemetry Collector |
| SYSC-0006 | Honeycomb Collector |

The checksum column provides a content-integrity mechanism for artifacts, storing short hash values such as 5e8f3c91 and 7b14de08 that enable downstream systems to verify that patient-cohorts-2023 has not been altered since ingestion. This is complemented by the size_bytes column, which records the byte footprint of each artifact—666903238 bytes for the source-dataset variant of patient-cohorts-2023, for instance—allowing capacity planning and transfer estimation. Together, checksum and size_bytes form a lightweight provenance envelope: any discrepancy between a stored checksum and a freshly computed hash triggers an integrity alert, while size_bytes informs storage budgeting and pipeline throughput calculations.

Role functions as a dual-purpose descriptor. In the artifact table, role classifies the functional purpose of an artifact within a data pipeline—source-dataset, transform-stage, output-sink, and archival-copy are the four enumerated roles, each indicating a distinct position in the data lifecycle. In the agent-responsibility join table, role takes on a governance meaning, assigning agents such as ComplianceOfficer, KafkaSource, LabSpectrometer, or AuditDaemon to responsibilities with designations like owner, reviewer, or observer. The same column name thus bridges two distinct conceptual layers: artifact classification on one side, and accountability assignment on the other.

The attribute system—comprising attr (attribute name), attr_type (attribute type), entity (the entity to which the attribute is bound), and misc (the miscellaneous value column)—implements a flexible key-value metadata store. Telemetry spans such as Prometheus or SignalFx Stream Processor carry typed attributes: checksum_algo and code are xsd:string values, while issued_date is xsd:date. The entity_id column in the value tables links a specific attribute instance back to its parent telemetry span, and the misc column holds the actual value—E.164 for a code attribute, 2024-08-07 for an issued_date, or Checksum Algo 01 for a checksum_algo. This design permits heterogeneous metadata to be stored without schema migrations, as new attribute names and types can be introduced by inserting rows into the attribute definition table and the corresponding value table for the appropriate data type.

**t_telemetry_span_observes_syscall_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| SYSC-0001 | checksum_algo | xsd:string |
| SYSC-0002 | code | xsd:string |
| SYSC-0003 | format | xsd:string |
| SYSC-0004 | issued_date | xsd:date |
| SYSC-0005 | namespace | xsd:string |
| SYSC-0006 | encoding | xsd:string |
| SYSC-0007 | label_text | xsd:string |
| SYSC-0008 | language | xsd:string |

**t_telemetry_span_observes_syscall_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SYSC-0001 | SYSC-0001 | SYSC-0004 | 2024-08-07 |
| SYSC-0002 | SYSC-0002 | SYSC-0004 | 2023-04-29 |
| SYSC-0003 | SYSC-0003 | SYSC-0004 | 2024-09-27 |
| SYSC-0004 | SYSC-0004 | SYSC-0004 | 2023-06-07 |
| SYSC-0005 | SYSC-0005 | SYSC-0004 | 2025-01-16 |
| SYSC-0006 | SYSC-0006 | SYSC-0004 | 2023-10-29 |

**t_telemetry_span_observes_syscall_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SYSC-0001 | SYSC-0001 | SYSC-0001 | Checksum Algo 01 |
| SYSC-0002 | SYSC-0001 | SYSC-0002 | D-33 |
| SYSC-0003 | SYSC-0001 | SYSC-0006 | Encoding 03 |
| SYSC-0004 | SYSC-0001 | SYSC-0003 | E.164 |
| SYSC-0005 | SYSC-0001 | SYSC-0007 | nightly summary |
| SYSC-0006 | SYSC-0001 | SYSC-0008 | fr |
| SYSC-0007 | SYSC-0001 | SYSC-0005 | Namespace 07 |
| SYSC-0008 | SYSC-0002 | SYSC-0001 | Checksum Algo 08 |

Subject and target complete the relationship vocabulary by naming the endpoints of binary associations. In the agent-responsibility join table, subject_id references the agent record (for example, RESP-0004, which maps to the ComplianceOfficer agent), while target_id references the responsibility record (such as RESP-0004, which maps to the AuditTrail responsibility). The role column in the same row—reviewer in this case—describes the nature of the relationship between subject and target. This triad of subject, target, and role forms a classic subject-object-role pattern, enabling the system to express that a ComplianceOfficer reviews an AuditTrail, a KafkaSource observes PipelineMetrics, or an AuditDaemon observes PipelineMetrics as an observer. The pattern generalizes across all responsibility assignments, providing a uniform representation for governance relationships that can be queried, audited, and enforced.

**t_agent_responsible_for__responsible_for**

| id | agent_id | responsible_for_id | role |
| --- | --- | --- | --- |
| RESP-0001 | RESP-0004 | RESP-0004 | owner |
| RESP-0002 | RESP-0008 | RESP-0003 | reviewer |
| RESP-0003 | RESP-0007 | RESP-0004 | reviewer |
| RESP-0004 | RESP-0007 | RESP-0006 | observer |
| RESP-0005 | RESP-0007 | RESP-0003 | owner |
| RESP-0006 | RESP-0005 | RESP-0003 | reviewer |
| RESP-0007 | RESP-0007 | RESP-0004 | observer |
| RESP-0008 | RESP-0007 | RESP-0004 | observer |