---
chapter_id: ch_live_belief_interval_subclass_47d847
topic_id: 66
family: 06_belief_structure
cited_terms: ['belief_interval_subclass', 'summary_metric_subclass', 'agent_software_or_human']
model: engine-refine
---

In governed operational systems, every assertion, metric, and agent must be addressable without ambiguity, and that requirement is what makes the identifier the foundational designative anchor. Identifiers such as INTE-0001, METR-0003, and HUMA-0002 are not display labels or transient keys; they are durable handles that survive renaming, reclassification, and cross-system federation. When a belief interval concerning sensor calibration drift is recorded under INTE-0001 and later paired with a lower bound expressed as a 0.85 probability, auditors and automated validators can trace the same logical object across tables, pipelines, and retention policies because the identifier remains invariant even as descriptive text or measurement semantics evolve. In compliance-oriented architectures, identifier discipline is therefore prerequisite to lineage, access control, and evidentiary reconstruction: without it, role assignments, license attestations, and metric rollups cannot be bound to accountable subjects.

**t_belief_interval_subclass_belief_lower_bound**

| id | belief_lower_bound |
| --- | --- |
| INTE-0001 | 0.85 probability |
| INTE-0002 | Three sigma limit |
| INTE-0003 | ISO ninety eight |
| INTE-0004 | 95 percent threshold |
| INTE-0005 | 99.9 percent uptime |
| INTE-0006 | 0.85 probability |
| INTE-0007 | 128 megabytes |
| INTE-0008 | 256 units |

An entity is the thing that carries state within that addressing scheme—the summary metric, the belief interval subclass, the agent record—not merely a row container but the governed object to which policy applies. Summary entities METR-0001 through METR-0004 instantiate this pattern concretely: network_bandwidth_rollup, batch_job_completion_rate, and error_rate_dashboard each exist as distinct operational artifacts whose provenance, classification, and permissible use must be evaluated independently. Entities acquire meaning through typed attributes rather than through ad hoc columns scattered across application schemas. The attribute, or attr, names the facet under governance—checksum, created_date, identifier, license—while attr type declares the interpretive contract that validators and downstream consumers must honor. A created_date attr typed as xsd:date demands lexical and temporal conformance; an identifier attr typed as cco:DesignativeICE signals a designative, information-content entity in a common core ontology, not a free-form string; license attrs remain xsd:string at the schema layer yet invoke legal semantics at the policy layer. Separating attr from attr type is what allows the same attr name to appear in multiple entity classes without collapsing distinct validation rules, and what allows compliance engines to reject misc values that are syntactically well formed but semantically impermissible.

**t_belief_interval_subclass**

| id | belief |
| --- | --- |
| INTE-0001 | Sensor calibration drift |
| INTE-0002 | Model convergence state |
| INTE-0003 | Model convergence state |
| INTE-0004 | Sensor calibration drift |
| INTE-0005 | Data ingestion rate |
| INTE-0006 | Reagent shelf life |

**t_summary_metric_subclass**

| id | summary | metric_kind |
| --- | --- | --- |
| METR-0001 | network_bandwidth_rollup | INTE-0005 |
| METR-0002 | network_bandwidth_rollup | INTE-0005 |
| METR-0003 | batch_job_completion_rate | INTE-0005 |
| METR-0004 | error_rate_dashboard | INTE-0006 |
| METR-0005 | resource_utilization_snapshot | INTE-0003 |
| METR-0006 | storage_io_throughput | INTE-0002 |
| METR-0007 | system_uptime_window | INTE-0002 |

**t_summary_metric_subclass_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| METR-0001 | checksum | xsd:string |
| METR-0002 | created_date | xsd:date |
| METR-0003 | identifier | cco:DesignativeICE |
| METR-0004 | license | xsd:string |
| METR-0005 | mime_type | xsd:string |
| METR-0006 | size_bytes | xsd:long |
| METR-0007 | uri | xsd:string |
| METR-0008 | version | xsd:integer |

**t_summary_metric_subclass_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| METR-0001 | METR-0001 | METR-0002 | 2023-11-11 |
| METR-0002 | METR-0002 | METR-0002 | 2024-08-19 |
| METR-0003 | METR-0003 | METR-0002 | 2023-07-21 |
| METR-0004 | METR-0004 | METR-0002 | 2023-02-24 |
| METR-0005 | METR-0005 | METR-0002 | 2024-01-28 |
| METR-0006 | METR-0006 | METR-0002 | 2025-06-08 |
| METR-0007 | METR-0007 | METR-0002 | 2023-06-04 |

**t_summary_metric_subclass_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| METR-0001 | METR-0001 | METR-0006 | 23 |
| METR-0002 | METR-0001 | METR-0008 | 7 |
| METR-0003 | METR-0002 | METR-0006 | 245 |
| METR-0004 | METR-0002 | METR-0008 | 1 |
| METR-0005 | METR-0003 | METR-0006 | 376 |
| METR-0006 | METR-0003 | METR-0008 | 2 |
| METR-0007 | METR-0004 | METR-0006 | 195 |
| METR-0008 | METR-0004 | METR-0008 | 7 |

**t_summary_metric_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| METR-0001 | METR-0001 | METR-0001 | 7b14de08 |
| METR-0002 | METR-0001 | METR-0003 | oid:1.3.6.1 |
| METR-0003 | METR-0001 | METR-0004 | MPL-2.0 |
| METR-0004 | METR-0001 | METR-0009 | ap-south-2 |
| METR-0005 | METR-0001 | METR-0005 | application/avro |
| METR-0006 | METR-0001 | METR-0010 | Name 06 |
| METR-0007 | METR-0001 | METR-0011 | ml-infra |
| METR-0008 | METR-0001 | METR-0012 | Tags 08 |

**t_agent_software_or_human**

| id | agent | agent_2 | agent_3 | license | name |
| --- | --- | --- | --- | --- | --- |
| HUMA-0001 | LegacySystemBridge | PlatformEngineer | PrometheusCollector | GPL-3.0 | ComplianceChecker |
| HUMA-0002 | SecurityAnalyst | IncidentResponder | LegalHoldService | Apache-2.0 | IncidentTriage |
| HUMA-0003 | MLopsSpecialist | PrometheusCollector | SentinelAuditBot | MPL-2.0 | LogAggregator |
| HUMA-0004 | AirflowDAGRunner | PagerOnCallDispatcher | DevOpsCoordinator | MIT | ModelValidator |
| HUMA-0005 | ShiftSupervisor | AirflowDAGRunner | KafkaStreamProcessor | Apache-2.0 | ModelValidator |
| HUMA-0006 | MLopsSpecialist | VaultSecretRotator | LegalHoldService | Apache-2.0 | LogAggregator |
| HUMA-0007 | IncidentResponder | PrometheusCollector | GlacierRecoveryJob | Apache-2.0 | AccessAuditor |
| HUMA-0008 | QualityAssuranceLead | MLopsSpecialist | PrometheusCollector | MPL-2.0 | IncidentTriage |

The misc designation marks the value plane where entity-specific facts land once attr and attr type have fixed the slot. Misc is not an invitation to unstructured dumping; in practice it is the evidence field—dates such as 2023-11-11 and 2024-08-19 on created_date, integers 23 and 245 where cardinality or counts matter, and varchar payloads including 7b14de08, oid:1.3.6.1, MPL-2.0, and ap-south-2 where strings encode checksums, object identifiers, license tokens, or regional deployment scope. Partitioning misc across typed value stores (date, integer, varchar) preserves query efficiency and constraint enforcement while keeping a uniform entity–attr binding model: METR-0001 may hold checksum 7b14de08 and license MPL-2.0 without forcing every metric to allocate nullable columns for every possible attr. For governance, misc is where operational reality meets the schema; auditors compare misc values against license obligations, retention schedules keyed on created_date, and integrity expectations attached to checksum attrs.

License merits treatment as both attr and standalone compliance primitive because it governs redistribution, modification, and operational liability across human and software agents alike. When METR-0001 carries MPL-2.0 in a license attr slot, that string participates in the same compliance graph as explicit license fields on agents—GPL-3.0 on HUMA-0001’s ComplianceChecker lineage, Apache-2.0 on HUMA-0002’s IncidentTriage stack, MIT on HUMA-0004’s ModelValidator—so that platform engineering, legal hold, and audit automation can answer whether a metric rollup, belief assertion, or orchestration agent may be composed, shipped, or retained in a given jurisdiction. License consistency across entity classes prevents the common failure mode in which application metadata declares one obligation while agent registration declares another; convergence on MPL-2.0 or Apache-2.0 becomes a verifiable invariant rather than a narrative footnote.

Relational governance further requires that entities participate in directed associations where responsibility and dependency are explicit. Subject and target name the oriented endpoints of such a link: the subject is the originating or owning participant, the target the referenced or dependent participant. In belief-interval composition, a subject belief_id INTE-0004 paired with target belief_lower_bound_id INTE-0008 attaches sensor calibration drift to a 95 percent threshold, while INTE-0001 as subject and INTE-0002 as target binds model convergence state to an ISO ninety eight lower bound—distinct evidentiary chains that must not be inverted without changing the legal meaning of the assertion. Role qualifies that edge: contributor versus owner is not decorative vocabulary but allocation of duty—owners bear attestation and change-control accountability, contributors supply supporting measurements or derived bounds without assuming sole liability. The same four-tuple pattern—subject, target, role, identifier on the association itself—scales to metric_kind linkage, where METR-0001’s network_bandwidth_rollup points at INTE-0005, embedding operational summaries within the belief taxonomy that defines what counts as admissible evidence.

**t_belief_interval_subclass__belief_lower_bound**

| id | belief_id | belief_lower_bound_id | role |
| --- | --- | --- | --- |
| INTE-0001 | INTE-0004 | INTE-0008 | contributor |
| INTE-0002 | INTE-0005 | INTE-0006 | owner |
| INTE-0003 | INTE-0001 | INTE-0002 | contributor |
| INTE-0004 | INTE-0002 | INTE-0008 | owner |
| INTE-0005 | INTE-0006 | INTE-0001 | contributor |
| INTE-0006 | INTE-0002 | INTE-0008 | reviewer |
| INTE-0007 | INTE-0001 | INTE-0006 | owner |
| INTE-0008 | INTE-0005 | INTE-0007 | contributor |

Taken together, identifier, entity, attr, attr type, misc, license, subject, target, and role form an interlocking compliance grammar rather than a loose catalog of fields. Identifiers stabilize reference; entities bear attrs whose types constrain misc; licenses thread through metrics and agents under uniform interpretive rules; subject–target edges, qualified by role, express who stands behind which bound, threshold, or rollup. A reviewer examining why batch_job_completion_rate (METR-0003) retained a created_date of 2023-07-21, why error_rate_dashboard (METR-0004) classifies under INTE-0006, or why AirflowDAGRunner and DevOpsCoordinator cohabit HUMA-0004 under MIT need not reconstruct an application schema—only read how designative IDs, typed attrs, misc evidence, license tokens, and oriented roles compose a single auditable graph. That composability is precisely why these constructs matter in practice: they convert operational telemetry and organizational assertion into structures that policy engines can traverse, enforce, and reproduce under examination.