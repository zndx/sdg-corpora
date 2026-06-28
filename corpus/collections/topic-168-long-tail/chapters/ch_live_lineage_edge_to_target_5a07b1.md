---
chapter_id: ch_live_lineage_edge_to_target_5a07b1
topic_id: 168
family: 05_provo_lineage
cited_terms: ['lineage_edge_to_target', 'provenance_agent_signs_audit', 'safety_planning_process']
model: engine-refine
---

In victim-services and crisis-response governance, provenance is the evidentiary spine that binds operational artifacts to the pipelines, human decisions, and system runs that produced them. Each provenance record is anchored by a stable identifier—AUDI-0001 through AUDI-0004 in the reference corpus—so that audit events remain addressable across dimensions, fact tables, and downstream lineage graphs even when labels change or categories are reclassified. The provenance_key field expresses referential continuity: AUDI-0007 appears twice in the fact layer, signaling that distinct execution episodes may legitimately share a parent provenance definition while retaining separate duration, exit, and retry telemetry. Duration in seconds quantifies wall-clock exposure of the producing job—values ranging from 2216.74 to 6949.35 seconds illustrate how ingestion and transformation workloads vary by category and source complexity, and why service-level objectives must be stated in elapsed time rather than row counts alone. Exit codes (256, 728, 452, 985) encode termination semantics for compliance review: a non-zero exit does not automatically invalidate downstream facts, but it flags the record for human adjudication before the artifact enters authoritative reporting. Retry count captures resilience behavior under transient failure; the spread from 23 to 410 retries in a single corpus slice demonstrates that operational maturity cannot be inferred from success alone—high retry volume may indicate brittle dependencies, quota pressure, or misconfigured backoff policies that nonetheless eventually converge.

**fact_provenance**

| id | provenance_key | duration_seconds | exit_code | retry_count |
| --- | --- | --- | --- | --- |
| AUDI-0001 | AUDI-0003 | 2601.59 | 256 | 196 |
| AUDI-0002 | AUDI-0007 | 4921.58 | 728 | 304 |
| AUDI-0003 | AUDI-0008 | 2216.74 | 452 | 410 |
| AUDI-0004 | AUDI-0007 | 6949.35 | 985 | 23 |

**dim_provenance**

| id | provenance_label | provenance_category |
| --- | --- | --- |
| AUDI-0001 | Provenance Label 01 | Provenance Category 01 |
| AUDI-0002 | Provenance Label 02 | Provenance Category 02 |
| AUDI-0003 | Provenance Label 03 | Provenance Category 03 |
| AUDI-0004 | Provenance Label 04 | Provenance Category 04 |
| AUDI-0005 | Provenance Label 05 | Provenance Category 05 |
| AUDI-0006 | Provenance Label 06 | Provenance Category 06 |
| AUDI-0007 | Provenance Label 07 | Provenance Category 07 |
| AUDI-0008 | Provenance Label 08 | Provenance Category 08 |

Dimensional provenance enriches bare execution facts with categorical and descriptive context. Category partitions the provenance universe into governance-relevant taxa—here, Provenance Category 01 through Provenance Category 04—so that policy controls, retention schedules, and access reviews can be applied at class granularity rather than per arbitrary string. The misc dimension carries human-readable provenance labels (Provenance Label 01–04) and other non-key descriptors that do not participate in join logic but materially aid investigators during incident response; misc fields are deliberately excluded from uniqueness constraints because their purpose is legibility, not identity. Together, identifier, category, and misc establish a three-tier naming model: machine-stable keys for joins, controlled vocabularies for policy, and free-form annotation for operational narrative. Practitioners should treat category drift as a first-class risk: renumbering or merging categories without remapping historical facts breaks longitudinal compliance dashboards and can orphan records that still carry valid identifiers.

Safety planning processes constitute the programmatic core of domestic-violence response governance—structured workflows such as SAFEPLAN-RED, VICTIM-ADVOC-12, SHIELD-PROTOCOL, and COMMUNITY-SAFE that translate policy into repeatable intervention sequences. Each process receives its own identifier (PROC-0001 et seq.) so that versioned protocols, jurisdictional variants, and pilot deployments can coexist in the same registry without collision. Processes do not operate in isolation; they employ crisis intervention methods—HOTLINE-TRIAGE, LEGAL-ADVOCACY, SAFE-ROOM-SET, DOCUMENT-GATHER—that represent concrete tactical modalities a case manager may authorize or delegate. The employs association is further qualified by role (owner, reviewer) and by cardinality_note, a governance annotation that documents the intended multiplicity between process and method: Cardinality Note 01 through Cardinality Note 04 record whether a given process must bind exactly one hotline pathway, may stack multiple legal-advocacy engagements, or permits optional document-gathering steps without blocking case closure. Cardinality notes matter because they prevent silent schema violations—when a reviewer role on PROC-0005 employs PROC-0002 while an owner on PROC-0004 employs the same method, the note explains whether that duplication is an exception, a data-quality defect, or an explicitly allowed many-to-many pattern.

**t_safety_planning_process**

| id | safety_planning_process |
| --- | --- |
| PROC-0001 | SAFEPLAN-RED |
| PROC-0002 | VICTIM-ADVOC-12 |
| PROC-0003 | SHIELD-PROTOCOL |
| PROC-0004 | COMMUNITY-SAFE |
| PROC-0005 | CIRCULAR-RED |
| PROC-0006 | CIRCULAR-RED |

**t_safety_planning_process_employs**

| id | employs |
| --- | --- |
| PROC-0001 | HOTLINE-TRIAGE |
| PROC-0002 | LEGAL-ADVOCACY |
| PROC-0003 | SAFE-ROOM-SET |
| PROC-0004 | DOCUMENT-GATHER |
| PROC-0005 | HOTLINE-TRIAGE |
| PROC-0006 | DOCUMENT-GATHER |
| PROC-0007 | ESCAPE-BAG-PREP |
| PROC-0008 | SHELTER-NAVIGATE |

**t_safety_planning_process__employs**

| id | safety_id | employs_id | role | cardinality_note |
| --- | --- | --- | --- | --- |
| PROC-0001 | PROC-0001 | PROC-0002 | reviewer | Cardinality Note 01 |
| PROC-0002 | PROC-0004 | PROC-0002 | owner | Cardinality Note 02 |
| PROC-0003 | PROC-0005 | PROC-0002 | reviewer | Cardinality Note 03 |
| PROC-0004 | PROC-0005 | PROC-0003 | owner | Cardinality Note 04 |
| PROC-0005 | PROC-0005 | PROC-0002 | owner | Cardinality Note 05 |
| PROC-0006 | PROC-0001 | PROC-0006 | contributor | Cardinality Note 06 |
| PROC-0007 | PROC-0001 | PROC-0008 | observer | Cardinality Note 07 |
| PROC-0008 | PROC-0006 | PROC-0002 | owner | Cardinality Note 08 |

Domestic violence survivor, in this framework, denotes the protected subject or case artifact toward which a safety planning process is directed—not merely a demographic label but a governed target entity that may be pseudonymized (NOMINEE-338), operational (FLEE-442-B), or infrastructural (backup_snapshot, incident_triage_report) depending on whether the plan safeguards a person, a document bundle, or a continuity asset. Associating processes to targets through role-qualified junctions (owner versus observer versus reviewer) enforces separation of duties: an owner on PROC-0001 may hold authority over PROC-0001 targets while an observer on PROC-0002 may witness but not mutate the same relationship graph. The parallel targets tables—one listing direct domesticviolencesurvivor values, another binding safety_id to targets_id—illustrate why governance models split declarative intent from enforced linkage; declarative rows state who or what is nominally in scope, while junction rows with roles express accountable stewardship under audit.

**t_safety_planning_process_targets**

| id | targets |
| --- | --- |
| PROC-0001 | NOMINEE-338 |
| PROC-0002 | incident_triage_report |
| PROC-0003 | backup_snapshot |
| PROC-0004 | FLEE-442-B |
| PROC-0005 | governance_catalog |
| PROC-0006 | REFUGEE-771 |
| PROC-0007 | PROTECT-002 |

Lineage edges complete the picture by tracing how safety and provenance artifacts propagate into analytical and operational stores. Each edge identifier (TARG-0001–TARG-0004) records a directed transformation from a lineage source—ml_model_checkpoint, knowledge_base_dump, raw_telemetry_feed—to a to_target destination such as DV-SVR-8842, backup_snapshot, or feature_store_table, with unit and misc value fields expressing the measured quantity at the handoff (nanometers, ratio, count, kilograms in the reference slice). When a safety process targets backup_snapshot and a lineage edge also terminates at backup_snapshot, investigators can correlate human-directed safety actions with automated replication paths, closing the loop between crisis intervention governance and data-platform accountability. Identifier stability across provenance facts, dimensional categories, safety processes, survivor targets, intervention methods, and lineage edges is therefore not an implementation detail but the precondition for defensible compliance: without it, duration and retry telemetry cannot be attributed, exit anomalies cannot be escalated, roles cannot be audited, and cardinality constraints cannot be enforced—leaving organizations unable to demonstrate that safety planning processes were applied to the correct subjects, through authorized methods, with traceable provenance from source to governed outcome.

**t_lineage_edge_to_target**

| id | lineage | to_target | unit | value |
| --- | --- | --- | --- | --- |
| TARG-0001 | ml_model_checkpoint | backup_snapshot | nm | 555.98 |
| TARG-0002 | knowledge_base_dump | DV-SVR-8842 | ratio | 967.34 |
| TARG-0003 | ml_model_checkpoint | backup_snapshot | count | 771.21 |
| TARG-0004 | raw_telemetry_feed | feature_store_table | kg | 171.35 |
| TARG-0005 | lab_sample_manifest | REFUGEE-771 | count | 934.12 |
| TARG-0006 | quality_validation_suite | CASE-991-A | count | 626.71 |

**t_safety_planning_process__targets**

| id | safety_id | targets_id | role |
| --- | --- | --- | --- |
| PROC-0001 | PROC-0005 | PROC-0001 | owner |
| PROC-0002 | PROC-0001 | PROC-0001 | observer |
| PROC-0003 | PROC-0004 | PROC-0007 | reviewer |
| PROC-0004 | PROC-0002 | PROC-0005 | owner |
| PROC-0005 | PROC-0006 | PROC-0007 | owner |
| PROC-0006 | PROC-0003 | PROC-0006 | observer |
| PROC-0007 | PROC-0006 | PROC-0006 | observer |
| PROC-0008 | PROC-0003 | PROC-0007 | reviewer |