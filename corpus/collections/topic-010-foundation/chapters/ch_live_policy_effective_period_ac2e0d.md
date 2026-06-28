---
chapter_id: ch_live_policy_effective_period_ac2e0d
topic_id: 10
family: 01_foundation
cited_terms: ['policy_effective_period', 'outlier_claim_supported_by_lift', 'artifact_described_by_attrkey']
model: engine-refine
---

Cardinality note, identifier, language, location, role, scope, subject, target, uri — these are the structural primitives by which relational datasets encode provenance, constraint, and linkage. An identifier anchors a row to a unique key within its table, whether the policy period designated PERI-0001 for the HIPAA Privacy Rule or the outlier event LIFT-0001 for a flow_rate_anomaly; it is the immutable handle by which every other table can refer back to that entity. A subject and a target are the paired ends of a foreign-key relationship: the subject is the entity initiating the reference, the target the entity being referenced, and the join table itself — the bridge — carries its own identifier and, critically, a role that qualifies the nature of the linkage. In the outlier support graph, the row with identifier LIFT-0001 records that outlier LIFT-0005 (subject) is linked to support LIFT-0007 (target) in the role of observer, while the row LIFT-0002 records that outlier LIFT-0002 is linked to support LIFT-0002 in the role of reviewer — the same identifier space for both outlier and support entities, disambiguated only by the semantic column that distinguishes subject from target.

**t_policy_effective_period**

| id | policy | effective_during | scope | language |
| --- | --- | --- | --- | --- |
| PERI-0001 | HIPAA Privacy Rule | Q4 2022 | local | es |
| PERI-0002 | GDPR Compliance | Q3 2023 | local | es |
| PERI-0003 | PCI DSS v4.0 | Q1 2025 | global | fr |
| PERI-0004 | NIST SP 800-53 | Q4 2022 | team | es |
| PERI-0005 | CCPA Data Rights | Q4 2025 | team | es |

The cardinality note, a column that appears exclusively on the join table between outlier claims and their attribute sets, qualifies the multiplicity and constraint of that relationship: Cardinality Note 01 through Cardinality Note 04 are not arbitrary labels but operational descriptors attached to specific subject-target pairs — for instance, the pairing of outlier LIFT-0002 with attribute_set LIFT-0001 carries Cardinality Note 02 and the role of contributor, whereas the pairing of outlier LIFT-0002 with attribute_set LIFT-0002 carries Cardinality Note 03 and the role of owner. This distinction matters because the same subject may relate to multiple targets under different cardinality constraints and roles, and the join table must capture each combination as a separate row with its own identifier (LIFT-0003 and LIFT-0004, respectively). Without the cardinality note, the relationship is merely existential; with it, the relationship is qualified, auditable, and enforceable.

**t_outlier_claim_supported_by_lift**

| id | outlier |
| --- | --- |
| LIFT-0001 | flow_rate_anomaly |
| LIFT-0002 | voltage_sag_incident |
| LIFT-0003 | seismic_tremor_signal |
| LIFT-0004 | packet_loss_surge |
| LIFT-0005 | pH_deviation_alert |
| LIFT-0006 | network_latency_burst |
| LIFT-0007 | thermal_runaway_event |

**t_outlier_claim_supported_by_lift_supported_by**

| id | supported_by |
| --- | --- |
| LIFT-0001 | provenance_chain_hash |
| LIFT-0002 | baseline_variance_report |
| LIFT-0003 | baseline_variance_report |
| LIFT-0004 | provenance_chain_hash |
| LIFT-0005 | validation_rule_match |
| LIFT-0006 | audit_trail_entry |
| LIFT-0007 | anomaly_detection_score |
| LIFT-0008 | historical_trend_chart |

**t_outlier_claim_supported_by_lift__supported_by**

| id | outlier_id | supported_by_id | role |
| --- | --- | --- | --- |
| LIFT-0001 | LIFT-0005 | LIFT-0007 | observer |
| LIFT-0002 | LIFT-0002 | LIFT-0002 | reviewer |
| LIFT-0003 | LIFT-0007 | LIFT-0005 | contributor |
| LIFT-0004 | LIFT-0007 | LIFT-0006 | reviewer |
| LIFT-0005 | LIFT-0007 | LIFT-0008 | reviewer |
| LIFT-0006 | LIFT-0002 | LIFT-0002 | reviewer |
| LIFT-0007 | LIFT-0003 | LIFT-0006 | contributor |
| LIFT-0008 | LIFT-0001 | LIFT-0001 | observer |

**t_outlier_claim_supported_by_lift_attribute_set**

| id | attribute_set |
| --- | --- |
| LIFT-0001 | frequency_range_limit |
| LIFT-0002 | error_rate_percent |
| LIFT-0003 | confidence_level_95 |
| LIFT-0004 | deviation_sigma_count |
| LIFT-0005 | pressure_tolerance_band |
| LIFT-0006 | detection_window_hours |

**t_outlier_claim_supported_by_lift__attribute_set**

| id | outlier_id | attribute_set_id | role | cardinality_note |
| --- | --- | --- | --- | --- |
| LIFT-0001 | LIFT-0002 | LIFT-0002 | owner | Cardinality Note 01 |
| LIFT-0002 | LIFT-0007 | LIFT-0001 | contributor | Cardinality Note 02 |
| LIFT-0003 | LIFT-0002 | LIFT-0002 | owner | Cardinality Note 03 |
| LIFT-0004 | LIFT-0001 | LIFT-0001 | reviewer | Cardinality Note 04 |
| LIFT-0005 | LIFT-0006 | LIFT-0004 | contributor | Cardinality Note 05 |
| LIFT-0006 | LIFT-0001 | LIFT-0001 | owner | Cardinality Note 06 |
| LIFT-0007 | LIFT-0003 | LIFT-0001 | observer | Cardinality Note 07 |
| LIFT-0008 | LIFT-0005 | LIFT-0004 | contributor | Cardinality Note 08 |

Scope and language are policy-level qualifiers that constrain the applicability of a rule to a geographic, organizational, or linguistic boundary. The policy period PERI-0001 for the HIPAA Privacy Rule is scoped to local deployment and expressed in es (Spanish), while PERI-0003 for PCI DSS v4.0 is scoped to global reach and expressed in fr (French); PERI-0004 for NIST SP 800-53 is scoped to team-level enforcement and again in es. These two columns together define the jurisdictional envelope within which a policy is operative — scope determines where the rule applies, language determines in what linguistic register it is communicated — and both are necessary for compliance engines to resolve the correct policy variant for a given deployment context.

Location and uri serve as the physical and logical addressing layer for artifacts. The artifact telemetry-stream-88f is described by two distinct URIs — hdfs://cluster/staging and gs://warehouse/gold — each associated with a different location (us-east-1 and ap-south-2, respectively), demonstrating that a single artifact may have multiple logical representations distributed across storage systems and regions. The artifact lab-report-mutation carries the URI s3://lake/curated at location us-east-1, while manifest-checksum-a1b carries hdfs://cluster/staging at location zone-b. The uri column provides the addressable path within a storage protocol, and the location column provides the geographic or availability-zone anchor; together they enable data governance systems to resolve where an artifact lives, which region's compliance regime applies to it, and which replication or backup policies are relevant.

**t_artifact_described_by_attrkey**

| id | artifact | uri | location |
| --- | --- | --- | --- |
| ATTR-0001 | telemetry-stream-88f | hdfs://cluster/staging | us-east-1 |
| ATTR-0002 | lab-report-mutation | s3://lake/curated | us-east-1 |
| ATTR-0003 | manifest-checksum-a1b | hdfs://cluster/staging | zone-b |
| ATTR-0004 | telemetry-stream-88f | gs://warehouse/gold | ap-south-2 |
| ATTR-0005 | provenance-trace-log | s3://lake/curated | ap-south-2 |

The attribute set table — with entries such as frequency_range_limit, error_rate_percent, confidence_level_95, and deviation_sigma_count — defines the measurable dimensions against which outlier claims are evaluated, while the supporting evidence table — with entries such as provenance_chain_hash and baseline_variance_report — defines the evidentiary basis for those claims. The join between outlier claims and attribute sets, and the join between outlier claims and supporting evidence, are both mediated by role: owner, contributor, reviewer, and observer. These roles are not metadata; they are governance controls. An owner has authority over the attribute definition, a contributor has editing rights, a reviewer has approval authority, and an observer has read-only access. The same attribute_set LIFT-0002 is associated with outlier LIFT-0002 in the role of owner and with outlier LIFT-0007 in the role of contributor, illustrating that roles are per-relationship, not per-entity.