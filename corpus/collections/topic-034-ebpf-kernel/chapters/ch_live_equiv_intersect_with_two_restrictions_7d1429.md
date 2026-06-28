---
chapter_id: ch_live_equiv_intersect_with_two_restrictions_7d1429
topic_id: 34
family: 01_foundation
cited_terms: ['equiv_intersect_with_two_restrictions', 'policy_with_review_cycle', 'syscall_at_security_tier']
model: engine-refine
---

Security tier classification anchors how organizations partition defensive posture, monitoring intensity, and control inheritance across heterogeneous workloads. Each tier receives a stable identifier—TIER-0001 through TIER-0004 in the reference corpus—that functions as the join key between dimensional metadata and operational telemetry. The tier dimension carries two descriptive attributes that practitioners routinely distinguish: category, which groups tiers into coarse assurance bands (At Security Tier Category 01 through At Security Tier Category 04), and miscellaneous label text that supplies human-readable naming without altering enforcement semantics (At Security Tier Label 01 through At Security Tier Label 04). Category governs which control families apply by default; the label field supports dashboards, audit packets, and cross-team communication where numeric or opaque keys would impede review. Together, identifier, category, and label establish a vocabulary that remains stable even as underlying infrastructure churns.

**dim_at_security_tier**

| id | at_security_tier_label | at_security_tier_category |
| --- | --- | --- |
| TIER-0001 | At Security Tier Label 01 | At Security Tier Category 01 |
| TIER-0002 | At Security Tier Label 02 | At Security Tier Category 02 |
| TIER-0003 | At Security Tier Label 03 | At Security Tier Category 03 |
| TIER-0004 | At Security Tier Label 04 | At Security Tier Category 04 |
| TIER-0005 | At Security Tier Label 05 | At Security Tier Category 05 |
| TIER-0006 | At Security Tier Label 06 | At Security Tier Category 06 |

Event count quantifies observed activity attributed to each tier and supplies the empirical basis for capacity planning, anomaly detection, and tier reassignment. In syscall-level fact records, volumes range from 52 events at the lowest-observed tier assignment through 382 at the highest, with intermediate counts of 198 and 238 demonstrating that tier elevation does not imply uniform traffic density. Analysts treat event_count as a normalized workload signal: spikes relative to tier baseline may indicate misclassification, privilege escalation, or undocumented service coupling. Because counts bind to at_security_tier_key rather than to label text, reporting remains consistent when labels are revised during annual taxonomy updates. Operational guides therefore mandate that escalation workflows reference tier keys and verified counts, not display strings alone.

Identifier discipline extends beyond tiers into the policy and restriction layers that complete the governance graph. Policy review cycles carry identifiers such as CYCL-0001 through CYCL-0004, each naming a compliance instrument—FedRAMP, NIST SP 800-53, CCPA, or SOC 2 Type II—and binding that instrument to a scheduled reassessment anchor (REST-0006, REST-0001, REST-0004, REST-0002). Restriction records (REST-0001 through REST-0004) express equivalence classes over technical artifacts: telemetry_stream_alpha paired with ml_model_checkpoint, governance_policy_set with sensor_node_array, ml_feature_vector again with sensor_node_array, and lab_assay_batch with ml_model_checkpoint, while related policy hooks (CYCL-0008, CYCL-0003, CYCL-0002, CYCL-0006) and secondary related assets (inference_dataset, backup_volume, pressure_transducer) trace how controls propagate across data planes. Identifiers make these relationships auditable; without them, intersection queries across two independent restriction dimensions collapse into ambiguous string matching.

**t_equiv_intersect_with_two_restrictions**

| id | equiv | equiv_2 | related | related_2 |
| --- | --- | --- | --- | --- |
| REST-0001 | telemetry_stream_alpha | ml_model_checkpoint | CYCL-0008 | inference_dataset |
| REST-0002 | governance_policy_set | sensor_node_array | CYCL-0003 | backup_volume |
| REST-0003 | ml_feature_vector | sensor_node_array | CYCL-0002 | pressure_transducer |
| REST-0004 | lab_assay_batch | ml_model_checkpoint | CYCL-0006 | pressure_transducer |
| REST-0005 | edge_gateway_unit | validation_schema | CYCL-0008 | incubator_chamber |
| REST-0006 | batch_pipeline_gamma | sensor_node_array | CYCL-0008 | catalog_entry |
| REST-0007 | telemetry_stream_alpha | ml_model_checkpoint | CYCL-0007 | inference_dataset |

**t_policy_with_review_cycle**

| id | policy | review_cycle | scope | language |
| --- | --- | --- | --- | --- |
| CYCL-0001 | FedRAMP | REST-0006 | local | ja |
| CYCL-0002 | NIST SP 800-53 | REST-0001 | team | ja |
| CYCL-0003 | CCPA | REST-0004 | regional | fr |
| CYCL-0004 | SOC 2 Type II | REST-0002 | regional | ja |
| CYCL-0005 | GDPR | REST-0002 | global | ja |
| CYCL-0006 | FedRAMP | REST-0007 | global | fr |
| CYCL-0007 | SOC 2 Type II | REST-0001 | global | ja |
| CYCL-0008 | CCPA | REST-0006 | local | ja |

Scope and language attributes localize policy obligations to the audiences and jurisdictions they actually govern. Scope values in the reference set—local, team, and regional—delimit whether a control applies to a single enclave, a product squad, or a geographic operating unit; NIST SP 800-53 and SOC 2 Type II both carry regional scope, signaling federated review across sites, whereas FedRAMP at local scope may reflect tenant-boundary constraints inside a shared authorization boundary. Language records the authoritative publication locale of each policy artifact: Japanese (ja) for FedRAMP, NIST SP 800-53, and SOC 2 Type II entries, and French (fr) for CCPA, which affects which translated control narratives, assessor worksheets, and exception logs are considered binding during examination. Compliance officers treat scope and language as orthogonal to tier: a regional-tier workload may still fall under a team-scoped policy when contractual flow-downs require it, and multilingual estates must ensure that tier labels and event-count thresholds referenced in non-default languages reconcile to the same identifier keys used in English-language SOC pipelines.

In practice, these fields interoperate through keyed joins and periodic reconciliation. Security operations maps syscall facts to dim_at_security_tier rows to produce tier-stratified event totals; GRC teams align CYCL identifiers to REST review anchors so that FedRAMP reassessment on REST-0006 and CCPA on REST-0002 fire on predictable calendars; infrastructure owners verify that equiv and related tuples do not orphan assets when tiers migrate. Where fact keys reference tiers absent from the dimension—such as a syscall row pointing at TIER-0005 while the dimension tops out at TIER-0004—governance processes flag referential drift before it corrupts dashboards. The resulting operational picture is neither a flat control checklist nor a raw telemetry dump, but a layered model: tiers and categories define posture, event counts evidence runtime behavior, identifiers stitch policies to assets and schedules, and scope plus language ensure that the right obligation reaches the right steward in the right jurisdiction. Mature programs instrument each linkage, review mismatches at cycle boundaries, and treat the full attribute set as mandatory metadata for any control that claims to be enforceable, measurable, and attributable.

**fact_syscall**

| id | at_security_tier_key | event_count |
| --- | --- | --- |
| TIER-0001 | TIER-0003 | 238 |
| TIER-0002 | TIER-0001 | 52 |
| TIER-0003 | TIER-0005 | 198 |
| TIER-0004 | TIER-0004 | 382 |
| TIER-0005 | TIER-0001 | 283 |
| TIER-0006 | TIER-0002 | 288 |