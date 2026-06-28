---
chapter_id: ch_live_lineage_edge_at_run_time_54bffb
topic_id: 102
family: 05_provo_lineage
cited_terms: ['lineage_edge_at_run_time', 'outlier_claim_subclass', 'nist80053_high_impact']
model: engine-refine
---

In governed data environments, identifier, role, subject, and target form the minimal vocabulary for asserting who or what stands in relation to what else, under which capacity, and with what durable referential integrity. An identifier is not merely a surrogate key but the stable handle by which audits, lineage reconstructions, and control attestations can cite the same entity across time and system boundaries. Records such as TIME-0001 through TIME-0004, CLAI-0001 through CLAI-0004, and IMPA-0001 through IMPA-0004 exemplify the convention: opaque, sequential tokens that decouple operational naming from human-readable labels while preserving joinability across normalized stores. Without such identifiers, a claim that genomic-sequence-align executed on worker-node-12 could not be distinguished from a structurally similar but historically distinct assertion about batch-revenue-aggregation, and downstream reviewers would lack a canonical anchor for approval or retraction.

Subject and target partition the directed semantics of a relationship. The subject is the entity that acts, originates, or bears primary accountability; the target is the entity upon which that action bears, to which attribution applies, or within which an effect is situated. In lineage governance, TIME-0004 as subject paired with TIME-0005 as target binds genomic-sequence-align to a specific runtime locus, while a parallel assertion may place the same lineage identifier against TIME-0001 with a different role, signalling that identical pipeline names may participate in multiple runtime edges without collapsing their evidentiary distinction. The outlier-claim domain makes the asymmetry explicit: CLAI-0005 as subject explaining an anomaly in CLAI-0002 as target differs materially from CLAI-0001 explaining CLAI-0006, even when both subjects denote Network_Bandwidth_Spike, because subject–target orientation fixes the direction of explanatory force rather than the lexical similarity of outlier labels. Compliance mappings exhibit the same structure when IMPA-0006 is subjected to IMPA-0002 for impact classification, or when IMPA-0003 is directed at IMPA-0003 under Zero Trust Architecture, demonstrating that subject and target are orthogonal to the human-readable strings NIST SP 800-171 or Tier-4.

**t_lineage_edge_at_run_time**

| id | lineage |
| --- | --- |
| TIME-0001 | batch-revenue-aggregation |
| TIME-0002 | customer-churn-pipeline |
| TIME-0003 | climate-data-ingest |
| TIME-0004 | genomic-sequence-align |
| TIME-0005 | model-training-workflow |
| TIME-0006 | user-behavior-trace |

**t_lineage_edge_at_run_time_at_run_time**

| id | at_run_time |
| --- | --- |
| TIME-0001 | worker-node-12 |
| TIME-0002 | job-run-8842 |
| TIME-0003 | worker-node-12 |
| TIME-0004 | batch-queue-primary |
| TIME-0005 | job-run-8842 |
| TIME-0006 | execution-window-4 |

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

Role qualifies the relationship without reifying it as a separate entity. Owner, observer, reviewer, and contributor are not decorative tags; they delimit authority, visibility, and evidentiary weight in ways that governance frameworks must enforce consistently. An owner on a lineage edge at runtime—such as the association carrying role owner between subject TIME-0004 and target TIME-0005—implies accountability for correctness and change control over that binding, whereas observer on CLAI-0001 toward CLAI-0006 signals read-only participation in an explanatory chain that does not confer edit rights over the underlying anomaly classification. Reviewer appears across domains with comparable force: on a lineage assertion it certifies the edge before promotion; on an outlier claim it validates that Network_Bandwidth_Spike adequately explains conditions in Power_Grid_Substation rather than Automotive_Test_Drive; on a NIST high-impact mapping it attests that Zero Trust Architecture has been assessed at Severity-Medium rather than Moderate. Contributor, confined in the sample to compliance tuples, denotes participatory construction of the mapping without sole ownership, as when IMPA-0006 is linked to IMPA-0002 with role contributor while a separate observer role governs read access to IMPA-0002 at Compliance-Low.

Operationally, these four elements interlock through a recurring pattern: dimension tables hold identifier-keyed attributes (lineage names, runtime hosts, outlier taxa, framework titles, impact tiers), while associative tables carry the quadruple of identifier, subject identifier, target identifier, and role. Runtime placement thus becomes auditable fact rather than log inference: customer-churn-pipeline on job-run-8842, climate-data-ingest again on worker-node-12, batch-revenue-aggregation on batch-queue-primary—each a distinct tuple whose identifier TIME-0002, TIME-0003, or TIME-0001 preserves provenance even when execution substrates repeat. Anomaly governance likewise depends on the junction layer to separate subclass identity from situational scope; Patient_Vital_Anomaly and Log_Flood_Event remain class-level identifiers, but only the subject–target–role triple determines whether a claim is owned, reviewed, or merely observed within Financial_Trading_Queue versus Automotive_Test_Drive. High-impact control catalogs extend the same mechanism to statutory objects, pairing NIST SP 800-61 with Tier-4 under contributor roles while Zero Trust Architecture inherits reviewer scrutiny at Severity-Medium, thereby embedding impact level not in the framework string itself but in the governed edge.

**t_outlier_claim_subclass**

| id | outlier |
| --- | --- |
| CLAI-0001 | Network_Bandwidth_Spike |
| CLAI-0002 | Patient_Vital_Anomaly |
| CLAI-0003 | Network_Bandwidth_Spike |
| CLAI-0004 | Log_Flood_Event |
| CLAI-0005 | Patient_Vital_Anomaly |
| CLAI-0006 | Elevator_Vibration_Spike |
| CLAI-0007 | Reactor_Core_Temp_Peak |

**t_outlier_claim_subclass_explains_anomaly_in**

| id | explains_anomaly_in |
| --- | --- |
| CLAI-0001 | Automotive_Test_Drive |
| CLAI-0002 | Automotive_Test_Drive |
| CLAI-0003 | Power_Grid_Substation |
| CLAI-0004 | Financial_Trading_Queue |
| CLAI-0005 | US_East_Data_Center |
| CLAI-0006 | Financial_Trading_Queue |

**t_outlier_claim_subclass__explains_anomaly_in**

| id | outlier_id | explains_anomaly_in_id | role |
| --- | --- | --- | --- |
| CLAI-0001 | CLAI-0005 | CLAI-0002 | reviewer |
| CLAI-0002 | CLAI-0006 | CLAI-0002 | owner |
| CLAI-0003 | CLAI-0001 | CLAI-0005 | reviewer |
| CLAI-0004 | CLAI-0001 | CLAI-0006 | observer |
| CLAI-0005 | CLAI-0007 | CLAI-0002 | owner |
| CLAI-0006 | CLAI-0005 | CLAI-0004 | observer |
| CLAI-0007 | CLAI-0003 | CLAI-0005 | owner |
| CLAI-0008 | CLAI-0002 | CLAI-0001 | owner |

**t_nist80053_high_impact**

| id | nist |
| --- | --- |
| IMPA-0001 | NIST SP 800-171 |
| IMPA-0002 | NIST SP 800-61 |
| IMPA-0003 | Zero Trust Architecture |
| IMPA-0004 | NIST SP 800-161 |
| IMPA-0005 | Zero Trust Architecture |
| IMPA-0006 | NIST SP 800-171 |

**t_nist80053_high_impact_at_n_i_s_t_impact_level**

| id | at_n_i_s_t_impact_level |
| --- | --- |
| IMPA-0001 | Moderate |
| IMPA-0002 | Tier-4 |
| IMPA-0003 | Severity-Medium |
| IMPA-0004 | Compliance-Low |
| IMPA-0005 | Essential |
| IMPA-0006 | Controlled-High |

**t_nist80053_high_impact__at_n_i_s_t_impact_level**

| id | nist_id | at_n_i_s_t_impact_level_id | role |
| --- | --- | --- | --- |
| IMPA-0001 | IMPA-0006 | IMPA-0002 | contributor |
| IMPA-0002 | IMPA-0003 | IMPA-0003 | contributor |
| IMPA-0003 | IMPA-0003 | IMPA-0003 | reviewer |
| IMPA-0004 | IMPA-0002 | IMPA-0004 | observer |
| IMPA-0005 | IMPA-0005 | IMPA-0002 | reviewer |
| IMPA-0006 | IMPA-0004 | IMPA-0006 | contributor |
| IMPA-0007 | IMPA-0003 | IMPA-0003 | reviewer |
| IMPA-0008 | IMPA-0001 | IMPA-0001 | reviewer |

The practical consequence for compliance and operations is that queries, access policies, and incident workflows should be framed over identifiers and typed edges, not over denormalized labels alone. A policy granting owners edit rights on lineage edges must key off role and subject–target pairs, lest two owner assignments on the same lineage name—genomic-sequence-align appearing under both TIME-0001 and TIME-0004 with different targets and roles—produce ambiguous authorization. Likewise, forensic reconstruction of a Network_Bandwidth_Spike event requires traversing from CLAI-0001 or CLAI-0005 through explains_anomaly_in_id to the correct operational context, because the outlier string alone does not disambiguate Power_Grid_Substation from duplicated Automotive_Test_Drive attestations. For assessors, the NIST tuples show that impact level Moderate, Tier-4, Severity-Medium, and Compliance-Low are not intrinsic properties of IMPA-0001 through IMPA-0004 but properties of the relationship in which a given nist_id participates, which is why reassessment changes the edge or its role rather than overwriting the canonical framework identifier.

Taken together, identifier supplies permanence, subject and target supply directed semantics, and role supplies the governance overlay without which multi-party systems cannot distinguish accountability from observation or contribution from certification. The evidence clusters—runtime lineage, outlier explanation, and high-impact control mapping—are independent domains yet structurally cognate: each preserves human-meaningful labels in keyed registries while entrusting enforceable meaning to small, typed, identifier-grounded assertions. That separation is what allows batch-revenue-aggregation and genomic-sequence-align to coexist in the same compliance handbook as Network_Bandwidth_Spike and NIST SP 800-161 without semantic collision, and what obliges implementers to treat role-aware subject–target edges as first-class records rather than incidental join table debris.