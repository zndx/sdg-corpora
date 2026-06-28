---
chapter_id: ch_live_control_basic_fbf604
topic_id: 159
family: 03_directive_governance
cited_terms: ['control_basic', 'host_connection_process', 'lineage_edge_subclass']
model: engine-refine
---

In governed operational environments, every assertion about policy, process, or data movement must be anchored to a durable identifier that survives renaming, reorganization, and system migration. Identifiers such as CONT-0001 or EDGE-0003 function as the canonical handles through which auditors, automation pipelines, and cross-domain linkages resolve the same entity unambiguously. Without this stability, temporal rules cannot be enforced consistently, lineage graphs fragment across repositories, and role assignments lose their referential integrity when underlying records are updated or superseded.

Compliance controls gain operational meaning only when their authority is bounded in time and in obligation. An effective date establishes the moment a control enters force—whether that is the data retention mandate taking effect on 2024-12-05 or a revised anomaly detection limit becoming operative on 2025-05-27—so that retrospective evaluation applies the rule set that was actually in force at the time of an event, not the configuration visible today. The mandatory flag distinguishes binding requirements from advisory standards: a true value on the data retention mandate signals that non-compliance constitutes a governance failure requiring remediation, whereas false on the audit logging standard indicates a recommended practice whose absence may be documented as a gap but does not automatically trigger enforcement action. Together, effective dating and mandatory classification transform abstract policy language into machine-checkable obligations that downstream systems can evaluate at query time.

Host connection processes model how distinct entities establish and maintain structural relationships within a governed ecosystem. In biological terms, a process such as Zea mays B73 or Hordeum vulgare describes the host-side context in which connection occurs; the parasitic plant participant—haustorium penetrating vascular tissue, or cortical cells at the interface—represents the connecting agent whose behavior must be characterized, monitored, and attributed. The same relational pattern applies beyond botany: any integration architecture in which one system establishes a persistent attachment to another can be expressed as a host connection process with named participants, enabling consistent documentation of what is being joined, through what mechanism, and under which biological or technical constraints.

Participation is not merely presence; it is qualified by role, subject, and target semantics that specify directionality and accountability within the relationship graph. The subject identifies the anchoring process instance—here, the host connection identified as PROC-0007—while the target points to the participant entity being linked, such as PROC-0003 or PROC-0004. Role assignment completes the triad: an observer participates without ownership authority, an owner bears primary responsibility for the connection's integrity, and a reviewer holds evaluative authority over its compliance posture. When the same host connection process carries multiple participants in different roles, governance systems can distinguish passive monitoring from operational accountability, ensuring that audit trails attribute actions to the correct party rather than collapsing all participants into an undifferentiated set.

**t_host_connection_process__has_participant**

| id | host_id | has_participant_id | role |
| --- | --- | --- | --- |
| PROC-0001 | PROC-0007 | PROC-0003 | observer |
| PROC-0002 | PROC-0007 | PROC-0007 | observer |
| PROC-0003 | PROC-0007 | PROC-0004 | owner |
| PROC-0004 | PROC-0007 | PROC-0003 | reviewer |
| PROC-0005 | PROC-0005 | PROC-0005 | contributor |
| PROC-0006 | PROC-0001 | PROC-0008 | contributor |
| PROC-0007 | PROC-0003 | PROC-0002 | contributor |
| PROC-0008 | PROC-0004 | PROC-0004 | owner |

Data lineage extends these governance primitives into the provenance layer, where edges record how information traverses from source systems into analytical or regulatory contexts. A lineage assertion such as ManufacturingBatchTrace originating from GCSRawZone carries an associated confidence score—0.101 indicating substantial uncertainty, 1.000 indicating verified certainty—that quantifies how much trust downstream consumers should place in the edge. Confidence is not decorative metadata; it drives automated routing decisions, escalation thresholds, and human review queues. Low-confidence edges demand corroboration before they inform compliance conclusions; high-confidence edges may flow directly into mandatory control evaluations without additional validation overhead.

Label text provides the human-interpretable bridge between machine-readable lineage structure and operational vocabulary. Terms such as intake form or calibration record classify the semantic nature of a lineage edge independently of its technical transport mechanism, allowing policy engines to apply domain-specific rules—retention periods, access controls, anomaly detection limits—based on what the data represents rather than merely where it was stored. A financial ledger sync edge and a network traffic dump edge may share identical ingestion infrastructure yet require entirely different control treatments because their label text situates them in distinct regulatory categories. In practice, identifiers bind entities across control, process, and lineage domains; effective dates and mandatory flags govern when and how strictly controls apply; host connection processes with parasitic plant participants and qualified roles model relational accountability; and confidence together with label text ensures that provenance assertions are both trustworthy and meaningfully classified for compliance decision-making.

**t_control_basic**

| id | control | effective_date | mandatory |
| --- | --- | --- | --- |
| CONT-0001 | Anomaly detection limit | 2025-01-22 | false |
| CONT-0002 | Audit logging standard | 2025-04-27 | false |
| CONT-0003 | Data retention mandate | 2024-12-05 | true |
| CONT-0004 | Anomaly detection limit | 2025-05-27 | true |
| CONT-0005 | PII masking policy | 2025-02-05 | false |
| CONT-0006 | Rate limiting rule | 2023-06-05 | false |
| CONT-0007 | Checksum verification rule | 2024-10-11 | false |

**t_host_connection_process**

| id | host_connection_process |
| --- | --- |
| PROC-0001 | Zea mays B73 |
| PROC-0002 | Helianthus annuus |
| PROC-0003 | Hordeum vulgare |
| PROC-0004 | Quercus robur |
| PROC-0005 | Helianthus annuus |
| PROC-0006 | Populus trichocarpa |
| PROC-0007 | Gossypium hirsutum |

**t_host_connection_process_has_participant**

| id | has_participant |
| --- | --- |
| PROC-0001 | Haustorium |
| PROC-0002 | Cortical cells |
| PROC-0003 | Haustorium |
| PROC-0004 | Cortical cells |
| PROC-0005 | Parasite root tip |
| PROC-0006 | Sieve tube element |
| PROC-0007 | Vascular cambium |
| PROC-0008 | Root xylem |

**t_lineage_edge_subclass**

| id | lineage | from_source | confidence | label_text |
| --- | --- | --- | --- | --- |
| EDGE-0001 | NetworkTrafficDump | PostgreSQLRawDB | 0.584 | intake form |
| EDGE-0002 | ManufacturingBatchTrace | GCSRawZone | 0.101 | calibration record |
| EDGE-0003 | ManufacturingBatchTrace | RESTAPIGateway | 0.280 | intake form |
| EDGE-0004 | FinancialLedgerSync | S3ArchivalBucket | 1.000 | calibration record |
| EDGE-0005 | ManufacturingBatchTrace | RedisCacheStore | 0.544 | audit excerpt |
| EDGE-0006 | NetworkTrafficDump | OracleERPSystem | 0.796 | calibration record |
| EDGE-0007 | PatientAdmissionRecord | RedisCacheStore | 0.907 | change rationale |
| EDGE-0008 | InventoryReconciliation | KafkaEventsStream | 0.508 | audit excerpt |