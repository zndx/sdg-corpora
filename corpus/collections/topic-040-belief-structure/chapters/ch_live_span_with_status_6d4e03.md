---
chapter_id: ch_live_span_with_status_6d4e03
topic_id: 40
family: 07_long_tail
cited_terms: ['span_with_status', 'agent_acts_on_behalf_of', 'cardinality_exactly_one_generic']
model: engine-refine
---

In distributed operations and data-governance registries, every durable assertion is carried by four cooperating primitives: identifier, role, subject, and target. The identifier supplies the stable handle under which a record may be cited, versioned, audited, and joined across tables without ambiguity; in span-status telemetry, handles such as STAT-0001 through STAT-0004 name both operational spans and their associated status rows, while BEHA-0001 through BEHA-0004 anchor parallel assertions about delegated agency. Because identifiers are keyed and treated as authoritative keys in the schema, they function as the ledger’s primary coordinates: a compliance review can trace degraded handling on certificate-renewal-cycle, timeout on a second renewal-cycle instance, or partial_failure on data-ingestion-batch and api-gateway-request without collapsing distinct events into a single narrative thread.

**t_span_with_status**

| id | span |
| --- | --- |
| STAT-0001 | certificate-renewal-cycle |
| STAT-0002 | certificate-renewal-cycle |
| STAT-0003 | data-ingestion-batch |
| STAT-0004 | api-gateway-request |
| STAT-0005 | certificate-renewal-cycle |
| STAT-0006 | session-initialization |

**t_span_with_status_span_status**

| id | span_status |
| --- | --- |
| STAT-0001 | degraded |
| STAT-0002 | timeout |
| STAT-0003 | partial_failure |
| STAT-0004 | partial_failure |
| STAT-0005 | partial_failure |
| STAT-0006 | degraded |

**t_span_with_status__span_status**

| id | span_id | span_status_id | role |
| --- | --- | --- | --- |
| STAT-0001 | STAT-0001 | STAT-0005 | contributor |
| STAT-0002 | STAT-0005 | STAT-0006 | observer |
| STAT-0003 | STAT-0001 | STAT-0001 | contributor |
| STAT-0004 | STAT-0001 | STAT-0002 | observer |
| STAT-0005 | STAT-0003 | STAT-0002 | owner |
| STAT-0006 | STAT-0001 | STAT-0001 | owner |
| STAT-0007 | STAT-0004 | STAT-0006 | observer |
| STAT-0008 | STAT-0003 | STAT-0004 | reviewer |

The subject is the entity that bears the relationship or carries the state being described; it is the “from” pole of the assertion. A span identified as certificate-renewal-cycle or data-ingestion-batch is the subject when status is attributed, and an agent such as AuditLogger, LogAggregator, ProvenanceTracker, or ETLBatchScheduler is the subject when the registry records acts-on-behalf-of behavior. Subjects are not merely labels: they delimit accountability. When STAT-0001 is linked multiple times as span_id, the same renewal-cycle span becomes the common subject across distinct status bindings, which is precisely how operators detect that one span can participate in more than one governed outcome without duplicating the span definition itself.

**t_agent_acts_on_behalf_of**

| id | agent |
| --- | --- |
| BEHA-0001 | AuditLogger |
| BEHA-0002 | LogAggregator |
| BEHA-0003 | ProvenanceTracker |
| BEHA-0004 | ETLBatchScheduler |
| BEHA-0005 | ReconciliationBot |
| BEHA-0006 | ETLBatchScheduler |

The target is the entity toward which the subject is directed—the “to” pole that completes the semantic arc. Span_status values including degraded, timeout, and partial_failure appear as targets referenced by span_status_id, while governance bodies and divisions including DataGovernanceBoard, AnalyticsDivision, and SecurityOperations appear as acted_on_behalf_of targets referenced by acted_on_behalf_of_id. Targets encode the class of obligation, outcome, or principal being engaged: partial_failure as a target on api-gateway-request signals a bounded fault domain rather than total unavailability, and SecurityOperations as a target under delegation signals which organizational principal’s policy envelope applies when an automated agent executes.

Role qualifies how the subject stands relative to the target within a typed edge, and it is role that prevents a binary link from being misread as ownership, authorship, or mere observation. In span-status associations, contributor and observer distinguish participation that materially affects status propagation from participation that is recorded for traceability only; in agency chains, owner, reviewer, contributor, and observer separate execution authority from attestation and from read-only oversight. A ProvenanceTracker mapped with role owner toward a DataGovernanceBoard target expresses a different compliance posture than an AuditLogger mapped as observer toward the same class of principal, even when both agents are automated and both appear in the same acts-on-behalf-of family of tables.

These four primitives interlock in practice through junction records that bind subject identifiers to target identifiers under an explicit role, while entity tables hold the descriptive payload at the x and y positions of each relationship pattern. Span definitions carry span at x; free-standing status rows carry span_status at y; agent rows carry agent at x; principal rows carry acted_on_behalf_of at y. The junction layer—exemplified by associations in which span_id STAT-0001 meets span_status_id STAT-0005 under contributor, or agent_id BEHA-0003 meets acted_on_behalf_of_id BEHA-0001 under owner—is where governance becomes operational: auditors reconcile who did what, in what capacity, and with respect to which outcome or principal, without inferring those answers from naming alone.

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

Cardinality constraints close the model by enforcing that certain subjects or targets may appear at most once in a given relationship shape, which is essential when exclusivity is a control objective rather than a convenience. Records declaring ExclusiveOwner and StrictParent cardinality, with related designations such as CoreService, SingleSource, DesignatedOwner, and SourceSystem, encode hard limits on how many edges of a given kind may exist: an exclusive owner cannot share ownership with a second claimant, and a strict parent cannot acquire sibling parents without violating the registry. Taken together, identifier, role, subject, and target form the minimum orthogonal basis for evidence-grade operational prose—dense enough to support renewal-cycle degradation reviews, batch partial-failure triage, gateway fault classification, and delegated-agent attestation in a single coherent compliance vocabulary.

**t_cardinality_exactly_one_generic**

| id | cardinality | related |
| --- | --- | --- |
| GENE-0001 | ExclusiveOwner | CoreService |
| GENE-0002 | ExclusiveOwner | SingleSource |
| GENE-0003 | StrictParent | DesignatedOwner |
| GENE-0004 | StrictParent | SourceSystem |
| GENE-0005 | ExclusiveOwner | TargetNode |