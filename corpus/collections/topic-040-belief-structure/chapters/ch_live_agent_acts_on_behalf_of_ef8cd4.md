---
chapter_id: ch_live_agent_acts_on_behalf_of_ef8cd4
topic_id: 40
family: 05_provo_lineage
cited_terms: ['agent_acts_on_behalf_of', 'subclass_disjoint_from_artifact', 'attestation_min_one_signer']
model: engine-refine
---

In any structured provenance or attestation framework, the foundational distinction between an entity and its attributes determines how information is organized, queried, and enforced. An entity represents a discrete, identifiable thing within the system—a specific attestation record such as SIGN-0001, which corresponds to a Chain of Custody Review, or an agent identifier like BEHA-0001, which denotes the AuditLogger component. Each entity receives a stable identifier, a string token that serves as the primary key across all relational tables. These identifiers follow a consistent naming convention: a domain prefix (SIGN, BEHA, ARTI) paired with a zero-padded sequence number, ensuring that every row in every table can be unambiguously traced back to its source entity. The identifier is not merely a label; it is the anchor that permits cross-table joins, enforces referential integrity, and supports auditability across the entire data fabric.

**t_attestation_min_one_signer**

| id | attestation |
| --- | --- |
| SIGN-0001 | Chain of Custody Review |
| SIGN-0002 | Security Baseline Validation |
| SIGN-0003 | Chain of Custody Review |
| SIGN-0004 | SOC 2 Type II Audit |
| SIGN-0005 | HIPAA Compliance Verification |
| SIGN-0006 | Data Residency Certification |

Attributes and their types form the second pillar of this architecture. An attribute defines a named property of an entity—duration_seconds, end_time, exit_code, host_name—while the attribute type constrains the kind of value that property may hold. The type system is explicit and schema-enforced: xsd:decimal for numeric quantities such as 1355.00 or 6713.34, xsd:dateTime for temporal markers like 2023-01-30T09:27:18 or 2024-10-31T01:25:16, xsd:integer for whole-number measures including 392 or 567, and xsd:string for free-form text such as node-b14, Log Level 02, review, or complete. This separation of attribute definition from attribute value is deliberate. The attribute metadata table (t_attestation_min_one_signer_attr) declares what properties exist and what types they carry, while four distinct value tables—t_attestation_min_one_signer_val_datetime, t_attestation_min_one_signer_val_decimal, t_attestation_min_one_signer_val_int, and t_attestation_min_one_signer_val_varchar—store the actual misc values, each typed to its column. The entity_id column in each value table links a specific value back to its owning entity, and the attr_id column links it to its attribute definition, creating a normalized, type-safe key-value store that avoids the pitfalls of untyped attribute columns.

**t_attestation_min_one_signer_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| SIGN-0001 | duration_seconds | xsd:decimal |
| SIGN-0002 | end_time | xsd:dateTime |
| SIGN-0003 | exit_code | xsd:integer |
| SIGN-0004 | host_name | xsd:string |
| SIGN-0005 | log_level | xsd:string |
| SIGN-0006 | phase | xsd:string |
| SIGN-0007 | retry_count | xsd:integer |
| SIGN-0008 | scheduled_at | xsd:dateTime |

**t_attestation_min_one_signer_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SIGN-0001 | SIGN-0001 | SIGN-0002 | 2023-01-30T09:27:18 |
| SIGN-0002 | SIGN-0001 | SIGN-0008 | 2023-11-17T23:13:16 |
| SIGN-0003 | SIGN-0001 | SIGN-0009 | 2024-10-31T01:25:16 |
| SIGN-0004 | SIGN-0002 | SIGN-0002 | 2024-07-02T14:51:27 |
| SIGN-0005 | SIGN-0002 | SIGN-0008 | 2025-02-15T22:43:11 |
| SIGN-0006 | SIGN-0002 | SIGN-0009 | 2025-01-24T22:56:47 |
| SIGN-0007 | SIGN-0003 | SIGN-0002 | 2024-08-04T06:50:35 |
| SIGN-0008 | SIGN-0003 | SIGN-0008 | 2024-10-17T00:50:44 |

**t_attestation_min_one_signer_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SIGN-0001 | SIGN-0001 | SIGN-0001 | 1355.00 |
| SIGN-0002 | SIGN-0002 | SIGN-0001 | 2257.11 |
| SIGN-0003 | SIGN-0003 | SIGN-0001 | 6713.34 |
| SIGN-0004 | SIGN-0004 | SIGN-0001 | 6673.35 |
| SIGN-0005 | SIGN-0005 | SIGN-0001 | 1063.66 |
| SIGN-0006 | SIGN-0006 | SIGN-0001 | 1.74 |

**t_attestation_min_one_signer_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SIGN-0001 | SIGN-0001 | SIGN-0003 | 392 |
| SIGN-0002 | SIGN-0001 | SIGN-0007 | 373 |
| SIGN-0003 | SIGN-0002 | SIGN-0003 | 567 |
| SIGN-0004 | SIGN-0002 | SIGN-0007 | 384 |
| SIGN-0005 | SIGN-0003 | SIGN-0003 | 347 |
| SIGN-0006 | SIGN-0003 | SIGN-0007 | 188 |
| SIGN-0007 | SIGN-0004 | SIGN-0003 | 103 |
| SIGN-0008 | SIGN-0004 | SIGN-0007 | 410 |

**t_attestation_min_one_signer_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SIGN-0001 | SIGN-0001 | SIGN-0004 | node-b14 |
| SIGN-0002 | SIGN-0001 | SIGN-0005 | Log Level 02 |
| SIGN-0003 | SIGN-0001 | SIGN-0006 | review |
| SIGN-0004 | SIGN-0001 | SIGN-0010 | complete |
| SIGN-0005 | SIGN-0001 | SIGN-0011 | Triggered By 05 |
| SIGN-0006 | SIGN-0002 | SIGN-0004 | ingest-21 |
| SIGN-0007 | SIGN-0002 | SIGN-0005 | Log Level 07 |
| SIGN-0008 | SIGN-0002 | SIGN-0006 | execution |

The subject-target-role triad governs how entities relate to one another in a semantically meaningful way. In the agent delegation model, the junction table t_agent_acts_on_behalf_of__acted_on_behalf_of captures a ternary relationship: a subject (agent_id, such as BEHA-0005 or BEHA-0001) acts on behalf of a target (acted_on_behalf_of_id, such as BEHA-0003 or BEHA-0006) under a specific role (observer, contributor, owner, reviewer). The subject is the active party—the agent performing the action—while the target is the entity on whose behalf the action is taken. The role qualifies the nature of the relationship, distinguishing between oversight (observer), participation (contributor), authority (owner), and validation (reviewer). This pattern generalizes beyond agent delegation; any relationship that requires a named role between two parties can be modeled with the same subject-target-role structure, making it a reusable primitive for access control, accountability mapping, and provenance tracking.

**t_agent_acts_on_behalf_of**

| id | agent |
| --- | --- |
| BEHA-0001 | AuditLogger |
| BEHA-0002 | LogAggregator |
| BEHA-0003 | ProvenanceTracker |
| BEHA-0004 | ETLBatchScheduler |
| BEHA-0005 | ReconciliationBot |
| BEHA-0006 | ETLBatchScheduler |

**t_agent_acts_on_behalf_of_acted_on_behalf_of**

| id | acted_on_behalf_of |
| --- | --- |
| BEHA-0001 | DataGovernanceBoard |
| BEHA-0002 | DataGovernanceBoard |
| BEHA-0003 | AnalyticsDivision |
| BEHA-0004 | SecurityOperations |
| BEHA-0005 | ComplianceAudit |
| BEHA-0006 | SecurityOperations |

**t_agent_acts_on_behalf_of__acted_on_behalf_of**

| id | agent_id | acted_on_behalf_of_id | role |
| --- | --- | --- | --- |
| BEHA-0001 | BEHA-0005 | BEHA-0003 | observer |
| BEHA-0002 | BEHA-0001 | BEHA-0006 | contributor |
| BEHA-0003 | BEHA-0003 | BEHA-0001 | owner |
| BEHA-0004 | BEHA-0006 | BEHA-0005 | reviewer |
| BEHA-0005 | BEHA-0003 | BEHA-0002 | observer |
| BEHA-0006 | BEHA-0006 | BEHA-0001 | reviewer |
| BEHA-0007 | BEHA-0005 | BEHA-0001 | contributor |
| BEHA-0008 | BEHA-0006 | BEHA-0006 | owner |

Disjoint-type constraints and attestation records represent higher-level constructs built upon these primitives. The t_subclass_disjoint_from_artifact table enforces that certain artifact subclasses—lab-assay-protocol, sensor-telemetry-stream, telemetry-metadata-index—are mutually exclusive, preventing an entity from being simultaneously classified as more than one disjoint type. Meanwhile, attestation records such as SIGN-0001 (Chain of Custody Review), SIGN-0002 (Security Baseline Validation), and SIGN-0004 (SOC 2 Type II Audit) serve as composite entities that aggregate multiple typed attributes into a single auditable unit. An attestation entity may carry a duration of 1355.00 seconds, an end time of 2023-11-17T23:13:16, an exit code of 392, and a host name of node-b14, all linked through the same entity_id and attr_id join keys. The attestation is thus not a single value but a structured collection of typed facts, each independently queryable and collectively forming a verifiable record.

**t_subclass_disjoint_from_artifact**

| id | disjoint |
| --- | --- |
| ARTI-0001 | lab-assay-protocol |
| ARTI-0002 | sensor-telemetry-stream |
| ARTI-0003 | telemetry-metadata-index |
| ARTI-0004 | telemetry-metadata-index |
| ARTI-0005 | artifact-manifest-record |
| ARTI-0006 | feature-vector-cache |
| ARTI-0007 | provenance-chain-hash |

The practical significance of this design lies in its ability to separate concerns without sacrificing queryability. Identifiers provide stable references; attributes and their types provide a schema for what can be said about an entity; values provide the actual data; roles provide the semantics of relationships; and disjoint constraints provide type safety. Together, they form a graph-like data model implemented in relational form, where every fact is a triple—entity, attribute, value—or a quadruple—subject, target, role, and optionally a timestamp or qualifier. This structure supports both the rigid consistency requirements of compliance frameworks and the flexible querying needs of operational analytics, because every piece of information is explicitly typed, explicitly linked, and explicitly attributable to a specific entity and a specific point in time.