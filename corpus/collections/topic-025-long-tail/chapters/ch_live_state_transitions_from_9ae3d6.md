---
chapter_id: ch_live_state_transitions_from_9ae3d6
topic_id: 25
family: 02_observation_measurement
cited_terms: ['state_transitions_from', 'requirement_only_satisfied_by', 'equiv_intersect_with_negation']
model: engine-refine
---

In formal data architectures, the quadruple of identifier, subject, target, and role constitutes the minimal vocabulary for expressing structured relationships with unambiguous provenance. An identifier serves as the immutable anchor of a fact, a stable key that survives the migration of its associated values across systems and time. Consider the identifiers FROM-0001 through FROM-0004, which persist as the primary keys of state-transition records regardless of whether the underlying state is MaintenanceWindow, DrainingEndpoint, or SynchronizedState; similarly, SATI-0001 through SATI-0004 and NEGA-0001 through NEGA-0004 carry their respective requirement and equivalence records through every join, filter, and audit. The identifier is not the meaning of the record but its handle — the mechanism by which a subject or target can be referenced without ambiguity in a join condition, a foreign key, or a compliance assertion.

**t_state_transitions_from**

| id | state |
| --- | --- |
| FROM-0001 | MaintenanceWindow |
| FROM-0002 | DrainingEndpoint |
| FROM-0003 | MaintenanceWindow |
| FROM-0004 | SynchronizedState |
| FROM-0005 | DrainingEndpoint |
| FROM-0006 | ReplicationGap |
| FROM-0007 | CorruptionDetected |

**t_state_transitions_from_transitions_from**

| id | transitions_from |
| --- | --- |
| FROM-0001 | StagingDataset |
| FROM-0002 | ValidationQueue |
| FROM-0003 | ArchiveBucket |
| FROM-0004 | BackupSnapshot |
| FROM-0005 | ProductionMirror |
| FROM-0006 | LegacyWarehouse |
| FROM-0007 | LegacyWarehouse |

**t_state_transitions_from__transitions_from**

| id | state_id | transitions_from_id | role |
| --- | --- | --- | --- |
| FROM-0001 | FROM-0007 | FROM-0006 | contributor |
| FROM-0002 | FROM-0005 | FROM-0004 | reviewer |
| FROM-0003 | FROM-0006 | FROM-0001 | observer |
| FROM-0004 | FROM-0002 | FROM-0006 | reviewer |
| FROM-0005 | FROM-0007 | FROM-0004 | reviewer |
| FROM-0006 | FROM-0006 | FROM-0005 | observer |
| FROM-0007 | FROM-0003 | FROM-0002 | owner |
| FROM-0008 | FROM-0003 | FROM-0006 | observer |

**t_requirement_only_satisfied_by**

| id | requirement |
| --- | --- |
| SATI-0001 | OWASP authentication flow |
| SATI-0002 | IEEE 802.1Q tagging |
| SATI-0003 | IEEE 802.1Q tagging |
| SATI-0004 | TLS 1.3 cipher suite |
| SATI-0005 | NIST 800-53 audit logging |
| SATI-0006 | GDPR data residency |

**t_requirement_only_satisfied_by_satisfied_by**

| id | satisfied_by |
| --- | --- |
| SATI-0001 | Let's Encrypt |
| SATI-0002 | OpenSSL 3.0 |
| SATI-0003 | FIPS 140-3 module |
| SATI-0004 | Zstd library |
| SATI-0005 | AWS KMS |
| SATI-0006 | AWS KMS |
| SATI-0007 | Zstd library |

**t_requirement_only_satisfied_by__satisfied_by**

| id | requirement_id | satisfied_by_id | role |
| --- | --- | --- | --- |
| SATI-0001 | SATI-0001 | SATI-0004 | reviewer |
| SATI-0002 | SATI-0003 | SATI-0005 | observer |
| SATI-0003 | SATI-0002 | SATI-0002 | reviewer |
| SATI-0004 | SATI-0003 | SATI-0003 | reviewer |
| SATI-0005 | SATI-0006 | SATI-0002 | observer |
| SATI-0006 | SATI-0001 | SATI-0003 | contributor |
| SATI-0007 | SATI-0003 | SATI-0004 | observer |
| SATI-0008 | SATI-0005 | SATI-0001 | owner |

The subject is the entity that originates or bears a relationship, the node from which a directed edge departs. In the state-transition domain, the subject of a relationship is a state such as MaintenanceWindow or SynchronizedState, each of which may participate in multiple transitions depending on the source from which it derives. In the requirements domain, the subject is the requirement itself — the OWASP authentication flow, the IEEE 802.1Q tagging specification, the TLS 1.3 cipher suite — a normative constraint that must be satisfied by one or more concrete implementations. In the equivalence domain, the subject is the canonical term, whether ClinicalTrial, SensorGateway, or DataLineage, against which alternative representations are measured. The subject is always the entity whose properties or obligations are under examination; it is the grammatical agent of the relational sentence.

The target is the entity that receives the relationship, the node at which a directed edge terminates. A state such as MaintenanceWindow may target a source transition like StagingDataset or ValidationQueue, indicating the provenance of that state in a workflow. A requirement such as IEEE 802.1Q tagging may be satisfied by the target implementation OpenSSL 3.0 or FIPS 140-3 module, establishing a traceability link from normative text to deployed artifact. In the equivalence mapping, the target is the alternative representation — RegistryCatalog, DependencyGraph, NonCompliant, Automated, RealTime — that stands in a defined relationship to the canonical subject. The target is the entity that fulfills, replaces, or derives from the subject; it is the grammatical patient of the relational sentence.

The role disambiguates the nature of the relationship between subject and target, transforming a bare edge into a typed assertion. In the state-transition junction, the role distinguishes whether a source transition acts as contributor, reviewer, or observer of a given state — FROM-0001 carries the role contributor while FROM-0002 and FROM-0004 both carry reviewer, and FROM-0003 carries observer, even though all four share the same identifier prefix and may reference overlapping states. In the requirements satisfaction junction, the role similarly qualifies the nature of each requirement-to-implementation link: SATI-0001 assigns reviewer to the satisfaction of the OWASP authentication flow by Let's Encrypt, while SATI-0002 assigns reviewer to the satisfaction of IEEE 802.1Q tagging by OpenSSL 3.0, and SATI-0003 assigns observer to the satisfaction of IEEE 802.1Q tagging by FIPS 140-3 module. The role is the semantic qualifier that prevents conflation of distinct relationship types between the same pair of entities.

This four-part structure — identifier, subject, target, role — enables precise, auditable, and composable knowledge representation. It separates the stable identity of a record from the mutable semantics of its relationships, allowing a single subject such as IEEE 802.1Q tagging to appear in multiple satisfaction records with different targets and different roles, each independently verifiable. It permits a single target such as Automated to participate in multiple equivalence mappings with different subjects and different implicit negations, each independently traceable. The pattern is not a schema prescription but a relational discipline: every fact is anchored by an identifier, attributed to a subject and a target, and qualified by a role, producing a graph of assertions that is both machine-readable and human-auditable.

**t_equiv_intersect_with_negation**

| id | equiv | equiv_2 | equiv_3 |
| --- | --- | --- | --- |
| NEGA-0001 | ClinicalTrial | RegistryCatalog | NonCompliant |
| NEGA-0002 | SensorGateway | DependencyGraph | Automated |
| NEGA-0003 | DataLineage | DependencyGraph | Automated |
| NEGA-0004 | SensorGateway | TrialPhase | RealTime |
| NEGA-0005 | TelemetryStream | NetworkDevice | Manual |
| NEGA-0006 | TelemetryStream | NetworkDevice | Manual |
| NEGA-0007 | KafkaPipeline | TrialPhase | NonCompliant |