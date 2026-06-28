---
chapter_id: ch_live_lineage_governed_by_directive_7ea87b
topic_id: 186
family: 05_provo_lineage
cited_terms: ['lineage_governed_by_directive', 'lineage_edge_at_run_time', 'quantum_cyber_security_field']
model: engine-refine
---

Identifiers form the backbone of any governance framework, providing stable, machine-readable handles that anchor every artifact to its authoritative record. In practice, these identifiers follow structured naming conventions—DIRE-0001 through DIRE-0004 for directives, TIME-0001 through TIME-0004 for runtime lineage edges, and FIEL-0001 through FIEL-0004 for quantum cybersecurity fields—each prefix signaling the artifact's domain while the numeric suffix ensures uniqueness within that namespace. The identifier alone carries no semantic weight beyond its referential function; it is the relationships and attributes bound to it that give the record operational meaning. A directive such as DIRE-0001 governs the user-behavior-trace lineage, while TIME-0001 captures the API Request Trace at a specific execution point, and FIEL-0001 designates the Quantum Secure Direct Communication field. This separation of identity from content enables independent evolution of metadata, supports cross-referencing across domains, and allows governance policies to be applied uniformly regardless of the underlying artifact type.

**t_lineage_edge_at_run_time**

| id | lineage |
| --- | --- |
| TIME-0001 | API Request Trace |
| TIME-0002 | fraud-detection-flow |
| TIME-0003 | Compliance Report Archive |
| TIME-0004 | Financial Audit Log |
| TIME-0005 | inventory-sync-process |
| TIME-0006 | sensor-telemetry-ingest |

**t_lineage_edge_at_run_time_at_run_time**

| id | at_run_time |
| --- | --- |
| TIME-0001 | worker-node-12 |
| TIME-0002 | job-run-8842 |
| TIME-0003 | worker-node-12 |
| TIME-0004 | batch-queue-primary |
| TIME-0005 | job-run-8842 |
| TIME-0006 | execution-window-4 |

**t_quantum_cyber_security_field**

| id | quantum_cyber_security_field |
| --- | --- |
| FIEL-0001 | Quantum Secure Direct Communication |
| FIEL-0002 | Measurement-Device-Independent QKD |
| FIEL-0003 | Post-Quantum Cryptography |
| FIEL-0004 | Post-Quantum Cryptography |
| FIEL-0005 | Quantum Digital Signatures |
| FIEL-0006 | Quantum Key Distribution |

**t_quantum_cyber_security_field_studies_domain_aspect**

| id | studies_domain_aspect |
| --- | --- |
| FIEL-0001 | Emitter Calibration Drift |
| FIEL-0002 | Channel Eavesdropping Detection |
| FIEL-0003 | Quantum Memory Coherence |
| FIEL-0004 | Channel Eavesdropping Detection |
| FIEL-0005 | Protocol Authentication Tokens |
| FIEL-0006 | Network Topology Integrity |

The quantum cybersecurity field represents a specialized domain of study and operational concern, encompassing disciplines such as Quantum Secure Direct Communication, Measurement-Device-Independent QKD, and Post-Quantum Cryptography. Each field is associated with one or more communication security aspects that define the specific threat models, vulnerability classes, or calibration concerns under investigation. Channel Eavesdropping Detection, for instance, appears as a domain aspect studied across multiple fields, reflecting its cross-cutting relevance to both Quantum Secure Direct Communication and Measurement-Device-Independent QKD. Quantum Memory Coherence is the domain aspect tied to Post-Quantum Cryptography, while Emitter Calibration Drift anchors the study of Quantum Secure Direct Communication. These aspects are not merely labels; they encode the precise security properties that must be validated, monitored, or mitigated within each field's scope.

Subject-target relationships, mediated by roles, define how governance directives, runtime lineage edges, and quantum cybersecurity fields interact within the broader architecture. A role—such as owner, observer, or reviewer—specifies the nature of the relationship between a subject and its target. In the runtime lineage graph, the Financial Audit Log (TIME-0004) is owned by one execution context and reviewed by another, with the owner role conferring write authority and the reviewer role granting read-only audit access. Similarly, within the quantum cybersecurity domain, Post-Quantum Cryptography (FIEL-0003) contributes to the study of Emitter Calibration Drift (FIEL-0001), while Quantum Secure Direct Communication (FIEL-0001) serves as the owner of that same aspect. The role field thus captures a permission or responsibility semantic that is distinct from the structural linkage itself, enabling fine-grained access control and accountability tracking without conflating topology with policy.

**t_lineage_edge_at_run_time__at_run_time**

| id | lineage_id | at_run_time_id | role |
| --- | --- | --- | --- |
| TIME-0001 | TIME-0004 | TIME-0005 | owner |
| TIME-0002 | TIME-0006 | TIME-0003 | observer |
| TIME-0003 | TIME-0004 | TIME-0005 | owner |
| TIME-0004 | TIME-0004 | TIME-0001 | reviewer |
| TIME-0005 | TIME-0002 | TIME-0006 | contributor |
| TIME-0006 | TIME-0004 | TIME-0006 | owner |
| TIME-0007 | TIME-0005 | TIME-0004 | contributor |
| TIME-0008 | TIME-0005 | TIME-0003 | observer |

**t_quantum_cyber_security_field__studies_domain_aspect**

| id | quantum_id | studies_domain_aspect_id | role |
| --- | --- | --- | --- |
| FIEL-0001 | FIEL-0003 | FIEL-0001 | contributor |
| FIEL-0002 | FIEL-0005 | FIEL-0003 | contributor |
| FIEL-0003 | FIEL-0001 | FIEL-0001 | contributor |
| FIEL-0004 | FIEL-0001 | FIEL-0001 | owner |
| FIEL-0005 | FIEL-0003 | FIEL-0006 | owner |
| FIEL-0006 | FIEL-0001 | FIEL-0005 | contributor |
| FIEL-0007 | FIEL-0002 | FIEL-0004 | contributor |
| FIEL-0008 | FIEL-0004 | FIEL-0004 | reviewer |

Lineage tracking extends these relationships into the operational runtime, where each lineage edge is bound to a specific execution context identified by an at_run_time value such as worker-node-12, job-run-8842, or batch-queue-primary. The runtime lineage edge TIME-0001, for example, connects the Financial Audit Log to worker-node-12, establishing a provable chain of custody for audit artifacts as they traverse the processing pipeline. The fraud-detection-flow and Compliance Report Archive lineage edges are similarly anchored to concrete execution targets, ensuring that every data transformation can be traced back to the node or job that performed it. This runtime binding is essential for incident response, compliance auditing, and forensic analysis, as it closes the loop between governance directives and their actual execution.

Units and languages provide the dimensional and linguistic context necessary for directives to be unambiguous across international and multi-modal deployments. The unit field captures the physical or logical measure associated with a lineage—milliseconds for timing-sensitive traces like user-behavior-trace, meters per second for telemetry streams, or simple counts for archival records. Language codes such as ja, de, and en indicate the human language in which the directive's content is authored, ensuring that compliance artifacts are accessible to the appropriate stakeholder communities. An API Request Trace governed by directive DIRE-0004 is documented in English with a unit of m/s, while the user-behavior-trace under DIRE-0001 is recorded in Japanese with millisecond precision. These attributes do not affect the structural integrity of the lineage graph, but they are critical for operational clarity, regulatory compliance, and cross-organizational interoperability.

**t_lineage_governed_by_directive**

| id | lineage | unit | language |
| --- | --- | --- | --- |
| DIRE-0001 | user-behavior-trace | ms | ja |
| DIRE-0002 | Sensor Telemetry Stream | m/s | de |
| DIRE-0003 | Compliance Report Archive | count | en |
| DIRE-0004 | API Request Trace | m/s | en |
| DIRE-0005 | inventory-sync-process | ratio | es |
| DIRE-0006 | customer-churn-pipeline | nm | de |
| DIRE-0007 | API Request Trace | kg | en |
| DIRE-0008 | climate-data-ingest | nm | ja |