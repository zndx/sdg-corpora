---
chapter_id: ch_live_agent_basic_48eb6a
topic_id: 35
family: 05_provo_lineage
cited_terms: ['agent_basic', 'agent_identified_by_uri', 'agent_responsible_for']
model: engine-refine
---

Enterprise agent registries require deterministic profiling to ensure traceability, compliance, and lifecycle management. Each agent instance is anchored by a unique identifier and accompanied by dimensional attributes that capture its functional classification, miscellaneous metadata, operational footprint, and release state. An agent designated as Agent Label 01, classified under Agent Category 01, registers a binary footprint of 211,345,771 bytes and maintains version 7. A companion instance, Agent Label 03 under Agent Category 03, occupies 548,859,900 bytes while running version 1, demonstrating how storage consumption and software maturity diverge across deployments. These dimensional records—encompassing agent labels, categorical tags, and size metrics—constitute the foundational registry for capacity planning and audit readiness.

**fact_agent**

| id | agent_key | size_bytes | version |
| --- | --- | --- | --- |
| AGEN-0001 | AGEN-0005 | 211345771 | 7 |
| AGEN-0002 | AGEN-0003 | 458577289 | 1 |
| AGEN-0003 | AGEN-0004 | 548859900 | 1 |
| AGEN-0004 | AGEN-0004 | 20883723 | 12 |
| AGEN-0005 | AGEN-0006 | 490849751 | 11 |

**dim_agent**

| id | agent_label | agent_category |
| --- | --- | --- |
| AGEN-0001 | Agent Label 01 | Agent Category 01 |
| AGEN-0002 | Agent Label 02 | Agent Category 02 |
| AGEN-0003 | Agent Label 03 | Agent Category 03 |
| AGEN-0004 | Agent Label 04 | Agent Category 04 |
| AGEN-0005 | Agent Label 05 | Agent Category 05 |
| AGEN-0006 | Agent Label 06 | Agent Category 06 |

**t_agent_responsible_for**

| id | agent |
| --- | --- |
| RESP-0001 | cern-alice-analysis |
| RESP-0002 | compliance-audit-bot |
| RESP-0003 | ml-training-cluster |
| RESP-0004 | KafkaSource |
| RESP-0005 | FieldStationAlpha |
| RESP-0006 | FieldStationAlpha |
| RESP-0007 | edge-device-gateway |
| RESP-0008 | nasa-goddard-telemetry |

**t_agent_responsible_for_responsible_for**

| id | responsible_for |
| --- | --- |
| RESP-0001 | CustomerTransactions |
| RESP-0002 | LabSamples |
| RESP-0003 | PipelineMetrics |
| RESP-0004 | AuditTrail |
| RESP-0005 | ResearchDataset |
| RESP-0006 | PipelineMetrics |

Beyond internal registries, agents must be externally addressable and organizationally attributable. The identification layer maps each agent to persistent, resolvable URIs and cross-referenced identifiers that survive infrastructure migrations. A data ingestion service such as KafkaSource resolves through the persistent handle ark:/13030/n8yy3r and is cross-referenced as ref-8842, while the machine learning pipeline cern-alice-analysis shares the same archival handle but is distinguished internally by ARN:res/41. Ownership is explicitly assigned at this layer; infrastructure domains such as data-engineering or ml-infra are bound to these identifiers, establishing clear lines of accountability for maintenance, security patching, and cost allocation.

**t_agent_identified_by_uri**

| id | agent | identified_by_u_r_i | identifier | owner |
| --- | --- | --- | --- | --- |
| URI-0001 | KafkaSource | ark:/13030/n8yy3r | ref-8842 | data-engineering |
| URI-0002 | cern-alice-analysis | ark:/13030/n8yy3r | ARN:res/41 | ml-infra |
| URI-0003 | edge-device-gateway | urn:isbn:978316148 | urn:uuid:9f2a | ml-infra |
| URI-0004 | ComplianceOfficer | urn:isbn:978316148 | ARN:res/41 | ml-infra |
| URI-0005 | ml-training-cluster | doi:10.5281/zenodo | urn:uuid:9f2a | analytics |
| URI-0006 | weather-station-alpha | doi:10.5281/zenodo | doi:10.1109/x | sre |
| URI-0007 | AuditDaemon | urn:isbn:978316148 | urn:uuid:9f2a | sre |

Attribution extends into operational governance through subject-target relationship matrices that formalize an agent’s scope of authority. Rather than treating agents as monolithic entities, the framework decomposes responsibility into discrete subject-to-target mappings, each annotated with a precise role designation. An agent may act as the owner of a specific resource, assume a reviewer capacity for compliance checkpoints, or function as an observer within audit workflows. The ComplianceOfficer agent, resolved via urn:isbn:978316148, is explicitly bound to the ml-infra ownership domain and participates in responsibility matrices where it assumes the reviewer role over designated targets. Similarly, KafkaSource operates under the data-engineering umbrella while maintaining distinct subject-target linkages that dictate its access boundaries.

The interplay between categorical classification, persistent identification, and role-based responsibility creates a deterministic governance topology. When an agent’s version is incremented, its size footprint shifts, and its categorical label is reassigned, the downstream impact on subject-target obligations is immediately traceable through the relational graph. This structure eliminates ambiguous ownership, enforces least-privilege access through explicit role declarations, and provides auditors with an immutable chain of custody from the agent’s binary release to its operational mandate. In regulated environments, such granularity ensures that every byte of computational overhead and every external identifier maps directly to an accountable entity, a defined category, and a strict operational role.

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