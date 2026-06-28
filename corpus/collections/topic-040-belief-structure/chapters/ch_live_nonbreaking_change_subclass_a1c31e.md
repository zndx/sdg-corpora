---
chapter_id: ch_live_nonbreaking_change_subclass_a1c31e
topic_id: 40
family: 07_long_tail
cited_terms: ['nonbreaking_change_subclass', 'profile_has_null_rate', 'agent_acts_on_behalf_of']
model: engine-refine
---

In governed data environments, every assertion of relationship must be addressable, attributable, and semantically constrained. The quartet identifier, role, subject, and target constitutes the minimum viable grammar for such assertions: the identifier supplies an immutable handle under which a fact may be cited, audited, and reconciled across revisions; the subject names the party or artifact that originates or bears the obligation; the target names the entity upon which that obligation is exercised or to which it applies; and the role qualifies the modality of participation, distinguishing observation from contribution, review from ownership, so that policy engines need not infer intent from topology alone. Without this decomposition, change classification, quality profiling, and delegated agency collapse into undifferentiated prose that cannot be machine-checked, versioned, or bound to control objectives.

Identifiers in operational registries follow a prefix–sequence convention that encodes domain lineage at a glance. Change-subclass records carry CHAN keys (CHAN-0001 through CHAN-0004) anchoring canonical non-breaking change types—Metric Name Addition, Dependency Version Bump, License Header Update, Field Nullability Change—while parallel registries assign RATE keys to null-rate profiles and BEHA keys to agency relationships. The identifier does not merely label a row; it becomes the join surface across normalized tables, the citation key in audit trails, and the stable referent when descriptive labels evolve. A governance board reviewing Field Nullability Change need not re-key its dossier when the underlying storage layout shifts, provided CHAN-0004 remains the authoritative identifier for that subclass.

**t_nonbreaking_change_subclass**

| id | nonbreaking |
| --- | --- |
| CHAN-0001 | Metric Name Addition |
| CHAN-0002 | Dependency Version Bump |
| CHAN-0003 | License Header Update |
| CHAN-0004 | Field Nullability Change |
| CHAN-0005 | Field Nullability Change |
| CHAN-0006 | Log Format Extension |

**t_nonbreaking_change_subclass_non_breaking_change_for**

| id | non_breaking_change_for |
| --- | --- |
| CHAN-0001 | ML Feature Store |
| CHAN-0002 | Cloud Storage Bucket |
| CHAN-0003 | GraphQL Endpoint |
| CHAN-0004 | Event Ingestion Pipeline |
| CHAN-0005 | REST API Gateway |
| CHAN-0006 | Data Lake Warehouse |

**t_profile_has_null_rate**

| id | profile |
| --- | --- |
| RATE-0001 | QualityGateConfig |
| RATE-0002 | QualityGateConfig |
| RATE-0003 | ObservationProtocolAlpha |
| RATE-0004 | SensorTelemetryV2 |
| RATE-0005 | TelemetryStreamSchema |
| RATE-0006 | TelemetryStreamSchema |
| RATE-0007 | QualityGateConfig |

**t_profile_has_null_rate_null_rate**

| id | null_rate |
| --- | --- |
| RATE-0001 | dropRate |
| RATE-0002 | absentMetric |
| RATE-0003 | missingBaseline |
| RATE-0004 | absentMetric |
| RATE-0005 | absentMetric |
| RATE-0006 | zeroPointTwo |

Subject and target partition directed relationships so that accountability flows in one discernible direction. In non-breaking change governance, the subject nonbreaking_id names the change subclass that is in scope—CHAN-0004 for Field Nullability Change, CHAN-0006 for another subclass in the junction set—while non_breaking_change_for_id names the system or surface affected: ML Feature Store, Cloud Storage Bucket, GraphQL Endpoint, Event Ingestion Pipeline. The pairing is never symmetric: the subject declares what kind of permissible drift is under consideration; the target declares where that drift may manifest. An entry keyed CHAN-0001 that binds subject CHAN-0004 to target CHAN-0006 therefore documents a specific subclass-to-surface applicability, not a reversible equivalence. The same structural discipline appears in profile-to-metric linkage, where profile_id (RATE-0003, RATE-0007, RATE-0004) denotes the governing configuration—QualityGateConfig, ObservationProtocolAlpha, SensorTelemetryV2—and null_rate_id (RATE-0005, RATE-0002, RATE-0006, RATE-0001) denotes the measured absence class: dropRate, absentMetric, missingBaseline.

Role is the semantic valve that prevents homogenization of otherwise identical subject–target pairs. Two contributors may attach to the same profile and null-rate combination yet remain distinguishable only if their roles differ from those of reviewers or owners; likewise, an observer on a non-breaking change applicability matrix incurs no mutation authority, whereas a contributor may execute or attest. Observed assignments include observer on CHAN-0001, contributor on CHAN-0002 and CHAN-0004, reviewer on CHAN-0003; among null-rate bindings, owner on RATE-0001, contributor on RATE-0002 and RATE-0004, reviewer on RATE-0003; and within agency delegation, owner for BEHA-0003 acting toward BEHA-0001, contributor and reviewer on sibling BEHA rows, observer on BEHA-0001. Policy interpretation should treat role as non-optional metadata: omitting it forces downstream systems to grant least-privilege defaults or, worse, to over-permit by structural adjacency alone.

Delegated agency extends the same quartet into principal–agent chains that compliance frameworks require for segregation of duties. Agent identifiers (BEHA-0001 through BEHA-0004) name operational actors—AuditLogger, LogAggregator, ProvenanceTracker, ETLBatchScheduler—while acted_on_behalf_of identifiers name the organizational or functional principals: DataGovernanceBoard, AnalyticsDivision, SecurityOperations. Junction rows reassign subject agent_id and target acted_on_behalf_of_id so that a single catalog agent may appear as subject in one assertion and as target in another, reflecting reciprocal visibility without conflating legal authority. ProvenanceTracker (BEHA-0003) may act on behalf of AnalyticsDivision with contributor authority in one row while DataGovernanceBoard appears as target in a separate BEHA-0003 linkage, illustrating how identifiers stabilize identity even as role and directionality vary.

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

In practice, implementers materialize these four elements across a hub-and-spoke pattern: entity tables hold identifiers and human-readable attributes (nonbreaking, profile, agent), companion tables hold target vocabularies (non_breaking_change_for, null_rate, acted_on_behalf_of), and associative tables carry subject_id, target_id, and role under their own identifiers. Evidence reviews should trace each control to a junction key—CHAN, RATE, or BEHA—then expand subject, target, and role before evaluating sufficiency. Metric Name Addition scoped to ML Feature Store, absentMetric monitored under QualityGateConfig, AuditLogger observing on behalf of DataGovernanceBoard: each triplet is legible to auditors because the grammar is uniform even when the domain is not. Identifier, role, subject, and target thus function not as incidental columns but as the composable atoms of governable statement-making, without which cross-system non-breaking change policy, null-rate quality gates, and delegated operational authority cannot be stated precisely, compared across releases, or enforced without ambiguity.

**t_nonbreaking_change_subclass__non_breaking_change_for**

| id | nonbreaking_id | non_breaking_change_for_id | role |
| --- | --- | --- | --- |
| CHAN-0001 | CHAN-0004 | CHAN-0006 | observer |
| CHAN-0002 | CHAN-0006 | CHAN-0005 | contributor |
| CHAN-0003 | CHAN-0001 | CHAN-0003 | reviewer |
| CHAN-0004 | CHAN-0003 | CHAN-0002 | contributor |
| CHAN-0005 | CHAN-0002 | CHAN-0006 | observer |
| CHAN-0006 | CHAN-0005 | CHAN-0001 | reviewer |
| CHAN-0007 | CHAN-0001 | CHAN-0005 | reviewer |
| CHAN-0008 | CHAN-0002 | CHAN-0006 | owner |

**t_profile_has_null_rate__null_rate**

| id | profile_id | null_rate_id | role |
| --- | --- | --- | --- |
| RATE-0001 | RATE-0003 | RATE-0005 | owner |
| RATE-0002 | RATE-0007 | RATE-0002 | contributor |
| RATE-0003 | RATE-0004 | RATE-0006 | reviewer |
| RATE-0004 | RATE-0004 | RATE-0001 | contributor |
| RATE-0005 | RATE-0007 | RATE-0003 | observer |
| RATE-0006 | RATE-0007 | RATE-0006 | owner |
| RATE-0007 | RATE-0001 | RATE-0001 | contributor |
| RATE-0008 | RATE-0004 | RATE-0001 | contributor |