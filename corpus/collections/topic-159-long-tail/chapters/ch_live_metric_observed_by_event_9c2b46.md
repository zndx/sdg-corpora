---
chapter_id: ch_live_metric_observed_by_event_9c2b46
topic_id: 159
family: 07_long_tail
cited_terms: ['metric_observed_by_event', 'dempster_combinant_second', 'division_assignment_record']
model: engine-refine
---

Athlete-to-division assignment is the operational hinge of eligibility, roster compliance, and competitive integrity: each decision binds a participant identity to a governing partition—weight class, age bracket, competitive tier, or jurisdictional scope—under rules that must be auditable after the fact. The assignment is never merely nominal. It carries a measured belief about correctness and an explicit acknowledgment of residual doubt. A record linking RECO-0001 to division RECO-0007 at confidence 0.517 and uncertainty 96.89 sits alongside another pairing the same athlete key to RECO-0001 at 0.257 confidence and 500.56 uncertainty, illustrating how governance systems must tolerate competing or revised placements rather than collapsing history into a single authoritative row. The dimensional layers that name these relationships—labels such as Assigns Athlete Label 01 grouped under Assigns Athlete Category 01, and parallel division labels slotted into Assigns Division Category 01—supply the categorical vocabulary auditors use to interpret what was assigned, not just which surrogate keys were joined.

Identifiers anchor the entire chain of evidence. Every observable fact, dimensional member, and combinant artifact resolves through a stable key—EVEN-0001 for a memory-latency observation, SECO-0001 for an evidence-fusion node, RECO-0001 for an athlete assignment grain—so that lineage, appeal, and cross-system reconciliation do not depend on display strings that may be renamed or localized. The identifier is the contract between ingestion, storage, and downstream analytics: once EVEN-0002 is cited in a compliance packet, every attribute value, timestamp, and confidence score tied to that entity must be retrievable without ambiguity. Entity, in this sense, is the governed object under description—the metric event, the Dempster combinant pair, the assignment fact—not the column that happens to hold its foreign key. Operational guides treat entity as the unit of provenance: what was measured, what was fused, who was placed where.

**t_metric_observed_by_event**

| id | metric |
| --- | --- |
| EVEN-0001 | Memory latency |
| EVEN-0002 | Disk IOPS |
| EVEN-0003 | Cache hit ratio |
| EVEN-0004 | CPU utilization |
| EVEN-0005 | Queue depth |
| EVEN-0006 | Cache hit ratio |

**t_metric_observed_by_event_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| EVEN-0001 | confidence | xsd:decimal |
| EVEN-0002 | dimension_kind | xsd:string |
| EVEN-0003 | method | xsd:string |
| EVEN-0004 | recorded_at | xsd:dateTime |
| EVEN-0005 | uncertainty | xsd:decimal |
| EVEN-0006 | unit | xsd:string |
| EVEN-0007 | value | xsd:decimal |
| EVEN-0008 | encoding | xsd:string |

**t_metric_observed_by_event_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVEN-0001 | EVEN-0001 | EVEN-0004 | 2023-03-01T06:18:02 |
| EVEN-0002 | EVEN-0002 | EVEN-0004 | 2025-03-12T18:54:27 |
| EVEN-0003 | EVEN-0003 | EVEN-0004 | 2023-04-23T18:00:40 |
| EVEN-0004 | EVEN-0004 | EVEN-0004 | 2023-07-24T13:02:38 |
| EVEN-0005 | EVEN-0005 | EVEN-0004 | 2025-03-15T05:43:19 |
| EVEN-0006 | EVEN-0006 | EVEN-0004 | 2024-11-18T14:01:50 |

**t_metric_observed_by_event_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVEN-0001 | EVEN-0001 | EVEN-0001 | 0.221 |
| EVEN-0002 | EVEN-0001 | EVEN-0005 | 966.79 |
| EVEN-0003 | EVEN-0001 | EVEN-0007 | 495.10 |
| EVEN-0004 | EVEN-0002 | EVEN-0001 | 0.669 |
| EVEN-0005 | EVEN-0002 | EVEN-0005 | 143.93 |
| EVEN-0006 | EVEN-0002 | EVEN-0007 | 270.10 |
| EVEN-0007 | EVEN-0003 | EVEN-0001 | 0.103 |
| EVEN-0008 | EVEN-0003 | EVEN-0005 | 271.02 |

**t_metric_observed_by_event_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVEN-0001 | EVEN-0001 | EVEN-0002 | Dimension Kind 01 |
| EVEN-0002 | EVEN-0001 | EVEN-0008 | Encoding 02 |
| EVEN-0003 | EVEN-0001 | EVEN-0009 | calibration record |
| EVEN-0004 | EVEN-0001 | EVEN-0010 | es |
| EVEN-0005 | EVEN-0001 | EVEN-0003 | manual |
| EVEN-0006 | EVEN-0001 | EVEN-0006 | mg/L |
| EVEN-0007 | EVEN-0002 | EVEN-0002 | Dimension Kind 07 |
| EVEN-0008 | EVEN-0002 | EVEN-0008 | Encoding 08 |

**t_dempster_combinant_second_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SECO-0001 | SECO-0001 | SECO-0004 | 2024-10-02T15:13:46 |
| SECO-0002 | SECO-0002 | SECO-0004 | 2024-09-30T23:04:21 |
| SECO-0003 | SECO-0003 | SECO-0004 | 2023-05-15T03:36:40 |
| SECO-0004 | SECO-0004 | SECO-0004 | 2023-03-27T03:16:31 |
| SECO-0005 | SECO-0005 | SECO-0004 | 2024-02-17T20:31:55 |
| SECO-0006 | SECO-0006 | SECO-0004 | 2025-02-25T15:10:20 |
| SECO-0007 | SECO-0007 | SECO-0004 | 2023-11-24T02:27:20 |

**t_dempster_combinant_second_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SECO-0001 | SECO-0001 | SECO-0002 | Dimension Kind 01 |
| SECO-0002 | SECO-0001 | SECO-0008 | Encoding 02 |
| SECO-0003 | SECO-0001 | SECO-0009 | nightly summary |
| SECO-0004 | SECO-0001 | SECO-0010 | en |
| SECO-0005 | SECO-0001 | SECO-0003 | manual |
| SECO-0006 | SECO-0001 | SECO-0006 | deg_C |
| SECO-0007 | SECO-0002 | SECO-0002 | Dimension Kind 07 |
| SECO-0008 | SECO-0002 | SECO-0008 | Encoding 08 |

Attributes and attribute types encode the semantics of what may legally be said about an entity. An attribute name such as confidence declares the role of a value; its type—xsd:decimal for confidence, xsd:string for dimension_kind or method, xsd:dateTime for recorded_at—declares how processors must validate, compare, and aggregate it. Typed attribute registries prevent silent category errors: a confidence of 0.669 stored as decimal for a CPU-utilization event is comparable across observations, while a dimension_kind value of Dimension Kind 01 or an encoding marker of Encoding 02 remains string-typed metadata that governs interpretation without pretending to be arithmetic. In practice, attr and attr_type work as a lightweight ontology: they tell compliance officers which fields are evidentiary magnitudes, which are procedural descriptors, and which are temporal anchors. A recorded_at stamp of 2023-07-24T13:02:38 on EVEN-0004 closes the loop on when a disk-IOPS observation entered the record, independent of when an analyst later queried it.

The misc field absorbs the heterogeneous residue that strict typing cannot exhaust—human-readable labels, free-form method notes, locale tags such as es or en, calibration prose, nightly summary markers—without breaking the typed core. Category elevates misc into governed taxonomy: Assigns Division Category 03 classifies a division dimension for reporting rollups, just as athlete categories partition the participant universe for rule application. Confidence and uncertainty form the quantitative face of that taxonomy in assignment facts. High confidence (0.806 on one RECO-0004-to-RECO-0003 link) signals that available evidence strongly supports the placement; low confidence (0.083 when RECO-0007 is assigned to RECO-0001) triggers review thresholds, provisional status, or manual adjudication. Uncertainty magnitudes in the hundreds—738.86, 740.08—are not mere complements of confidence; in fusion-oriented architectures they often encode spread, conflict among sources, or epistemic mass left uncommitted after combination rules run. Treating them as interchangeable with (1 − confidence) is a common operational failure this framework is designed to prevent.

**fact_division**

| id | assigns_athlete_key | assigns_division_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- | --- |
| RECO-0001 | RECO-0001 | RECO-0007 | 0.517 | 96.89 | 330.50 |
| RECO-0002 | RECO-0004 | RECO-0003 | 0.806 | 738.86 | 254.97 |
| RECO-0003 | RECO-0001 | RECO-0001 | 0.257 | 500.56 | 407.11 |
| RECO-0004 | RECO-0007 | RECO-0001 | 0.083 | 740.08 | 404.52 |
| RECO-0005 | RECO-0006 | RECO-0007 | 0.281 | 881.15 | 8.05 |
| RECO-0006 | RECO-0007 | RECO-0004 | 0.538 | 6.12 | 177.48 |
| RECO-0007 | RECO-0003 | RECO-0005 | 0.833 | 343.27 | 857.73 |

**dim_assigns_athlete**

| id | assigns_athlete_label | assigns_athlete_category |
| --- | --- | --- |
| RECO-0001 | Assigns Athlete Label 01 | Assigns Athlete Category 01 |
| RECO-0002 | Assigns Athlete Label 02 | Assigns Athlete Category 02 |
| RECO-0003 | Assigns Athlete Label 03 | Assigns Athlete Category 03 |
| RECO-0004 | Assigns Athlete Label 04 | Assigns Athlete Category 04 |
| RECO-0005 | Assigns Athlete Label 05 | Assigns Athlete Category 05 |
| RECO-0006 | Assigns Athlete Label 06 | Assigns Athlete Category 06 |
| RECO-0007 | Assigns Athlete Label 07 | Assigns Athlete Category 07 |

**dim_assigns_division**

| id | assigns_division_label | assigns_division_category |
| --- | --- | --- |
| RECO-0001 | Assigns Division Label 01 | Assigns Division Category 01 |
| RECO-0002 | Assigns Division Label 02 | Assigns Division Category 02 |
| RECO-0003 | Assigns Division Label 03 | Assigns Division Category 03 |
| RECO-0004 | Assigns Division Label 04 | Assigns Division Category 04 |
| RECO-0005 | Assigns Division Label 05 | Assigns Division Category 05 |
| RECO-0006 | Assigns Division Label 06 | Assigns Division Category 06 |
| RECO-0007 | Assigns Division Label 07 | Assigns Division Category 07 |

Evidence combination is where assignment quality is manufactured before it ever reaches a roster fact. Dempster combinant structures pair a fusion engine—EvidenceCombinationBeta, AnomalyFusionEngine, LabDataCombinerNode, GovernanceEvidenceModel—with a second source channel such as SourceMetadataRegistry, GPSPositionLog, BaselineTelemetryTrace, or ThermalImagingFeed. Each combinant carries its own confidence decimal (0.328 on SECO-0001, 0.558 on SECO-0002), dimensional metadata, method strings, and recorded_at timestamps parallel to the metric-event pattern, because fusion nodes are themselves entities subject to the same attr discipline. Metric observations on the performance plane—memory latency at 0.221, cache-hit telemetry at 495.10, CPU utilization confidence at 0.669—feed the evidentiary substrate that fusion consumes. A governance officer tracing why an athlete landed in Assigns Division Label 04 follows identifiers backward from the fact row through combinant confidence into the underlying event attributes, rather than accepting the assignment label alone.

**t_dempster_combinant_second**

| id | dempster | second_combinant |
| --- | --- | --- |
| SECO-0001 | EvidenceCombinationBeta | SourceMetadataRegistry |
| SECO-0002 | AnomalyFusionEngine | GPSPositionLog |
| SECO-0003 | LabDataCombinerNode | BaselineTelemetryTrace |
| SECO-0004 | GovernanceEvidenceModel | ThermalImagingFeed |
| SECO-0005 | GovernanceEvidenceModel | ThermalImagingFeed |
| SECO-0006 | GovernanceEvidenceModel | SpectralAnalysisOutput |
| SECO-0007 | CrossDomainEvidenceRule | PressureSensorArray |

**t_dempster_combinant_second_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| SECO-0001 | confidence | xsd:decimal |
| SECO-0002 | dimension_kind | xsd:string |
| SECO-0003 | method | xsd:string |
| SECO-0004 | recorded_at | xsd:dateTime |
| SECO-0005 | uncertainty | xsd:decimal |
| SECO-0006 | unit | xsd:string |
| SECO-0007 | value | xsd:decimal |
| SECO-0008 | encoding | xsd:string |

**t_dempster_combinant_second_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SECO-0001 | SECO-0001 | SECO-0001 | 0.328 |
| SECO-0002 | SECO-0001 | SECO-0005 | 597.98 |
| SECO-0003 | SECO-0001 | SECO-0007 | 738.09 |
| SECO-0004 | SECO-0002 | SECO-0001 | 0.558 |
| SECO-0005 | SECO-0002 | SECO-0005 | 817.82 |
| SECO-0006 | SECO-0002 | SECO-0007 | 989.70 |
| SECO-0007 | SECO-0003 | SECO-0001 | 0.241 |
| SECO-0008 | SECO-0003 | SECO-0005 | 869.27 |

Operational compliance therefore hinges on reading the stack as a single narrative: category and misc humanize the keys; identifier and entity preserve immutable referential integrity; attr and attr_type enforce valid assertions; confidence states warranted belief at the point of decision; uncertainty preserves what remains disputed or unallocated after evidence combination. When RECO-0001 appears twice in assignment facts with different division keys and divergent confidence-uncertainty profiles, the handbook expectation is not to delete the weaker row but to document adjudication rationale, refresh combinant inputs if new telemetry arrives, and only then supersede prior placements with a new identifier-linked fact. That discipline—typed attributes on every entity, dimensional categories for every assignable role, and explicit dual measures of belief and doubt—is what allows athlete-division governance to withstand audit, appeal, and cross-season statistical reuse without collapsing into untyped spreadsheets or irreversible key overwrites.