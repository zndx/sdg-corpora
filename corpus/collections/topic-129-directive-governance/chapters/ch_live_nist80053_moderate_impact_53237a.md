---
chapter_id: ch_live_nist80053_moderate_impact_53237a
topic_id: 129
family: 07_long_tail
cited_terms: ['nist80053_moderate_impact', 'verification_min_one_evidence', 'column_value_distribution']
model: engine-refine
---

The foundational architecture of compliance and verification registries rests upon a disciplined decomposition of governance records into entity, identifier, and attr definitions. Each entity functions as an immutable anchor for a specific audit object or control mapping, distinguished by a stable identifier such as IMPA-0001 or EVID-0001 that persists across all relational joins. Attached to these entities are attr definitions, formally declared through an attr type registry that enforces strict schema discipline over the misc values they carry. Temporal boundaries are captured as `xsd:dateTime` quantities yielding timestamps like `2023-07-04T07:08:55`, while performance metrics are stored as `xsd:decimal` measures such as `2280.75`. Discrete operational states and host identifiers adhere to `xsd:integer` and `xsd:string` conventions, producing values like `414` and `node-a01`. This attr type framework ensures that every piece of misc evidence—whether a cryptographic verification result, a system log entry, or a migration validation flag—remains structurally consistent and machine-auditable.

**t_verification_min_one_evidence**

| id | verification | produces_evidence |
| --- | --- | --- |
| EVID-0001 | ISO27001 Compliance Audit | IMPA-0004 |
| EVID-0002 | Data Lineage Trace | IMPA-0001 |
| EVID-0003 | Cryptographic Signature Check | IMPA-0003 |
| EVID-0004 | Schema Migration Validation | IMPA-0001 |
| EVID-0005 | Data Lineage Trace | IMPA-0001 |
| EVID-0006 | Schema Migration Validation | IMPA-0005 |

**t_verification_min_one_evidence_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| EVID-0001 | duration_seconds | xsd:decimal |
| EVID-0002 | end_time | xsd:dateTime |
| EVID-0003 | exit_code | xsd:integer |
| EVID-0004 | host_name | xsd:string |
| EVID-0005 | log_level | xsd:string |
| EVID-0006 | phase | xsd:string |
| EVID-0007 | retry_count | xsd:integer |
| EVID-0008 | scheduled_at | xsd:dateTime |

**t_verification_min_one_evidence_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVID-0001 | EVID-0001 | EVID-0002 | 2023-07-04T07:08:55 |
| EVID-0002 | EVID-0001 | EVID-0008 | 2025-01-31T12:45:17 |
| EVID-0003 | EVID-0001 | EVID-0009 | 2025-03-23T07:51:24 |
| EVID-0004 | EVID-0002 | EVID-0002 | 2023-01-29T08:52:43 |
| EVID-0005 | EVID-0002 | EVID-0008 | 2025-02-10T17:00:11 |
| EVID-0006 | EVID-0002 | EVID-0009 | 2023-01-05T10:52:26 |
| EVID-0007 | EVID-0003 | EVID-0002 | 2023-12-08T22:39:20 |
| EVID-0008 | EVID-0003 | EVID-0008 | 2023-06-23T05:07:56 |

**t_verification_min_one_evidence_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVID-0001 | EVID-0001 | EVID-0001 | 2280.75 |
| EVID-0002 | EVID-0002 | EVID-0001 | 2844.65 |
| EVID-0003 | EVID-0003 | EVID-0001 | 2804.04 |
| EVID-0004 | EVID-0004 | EVID-0001 | 5144.39 |
| EVID-0005 | EVID-0005 | EVID-0001 | 1607.16 |
| EVID-0006 | EVID-0006 | EVID-0001 | 959.65 |

**t_verification_min_one_evidence_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVID-0001 | EVID-0001 | EVID-0003 | 414 |
| EVID-0002 | EVID-0001 | EVID-0007 | 360 |
| EVID-0003 | EVID-0002 | EVID-0003 | 47 |
| EVID-0004 | EVID-0002 | EVID-0007 | 492 |
| EVID-0005 | EVID-0003 | EVID-0003 | 443 |
| EVID-0006 | EVID-0003 | EVID-0007 | 122 |
| EVID-0007 | EVID-0004 | EVID-0003 | 839 |
| EVID-0008 | EVID-0004 | EVID-0007 | 199 |

**t_verification_min_one_evidence_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVID-0001 | EVID-0001 | EVID-0004 | node-a01 |
| EVID-0002 | EVID-0001 | EVID-0005 | Log Level 02 |
| EVID-0003 | EVID-0001 | EVID-0006 | review |
| EVID-0004 | EVID-0001 | EVID-0010 | failed |
| EVID-0005 | EVID-0001 | EVID-0011 | Triggered By 05 |
| EVID-0006 | EVID-0002 | EVID-0004 | edge-03 |
| EVID-0007 | EVID-0002 | EVID-0005 | Log Level 07 |
| EVID-0008 | EVID-0002 | EVID-0006 | closeout |

Cross-referential governance is governed by a directional subject-to-target relationship model, wherein a source entity (subject) is bound to a destination entity (target) under an explicitly declared operational role. In regulatory alignment matrices, a NIST control identifier such as IMPA-0002 may serve as the subject pointing to an impact level target like IMPA-0007, with the relationship classified as `observer` to denote passive compliance alignment. Conversely, statistical modeling registries assign a `contributor` role when a column identifier such as DIST-0007 is linked to a distribution target like DIST-0006, indicating active participation in the data generation pipeline. The `owner` and `reviewer` roles further delineate accountability boundaries, ensuring that every cross-reference carries an explicit governance posture rather than an ambiguous pointer, thereby establishing clear lines of technical and administrative responsibility.

**t_nist80053_moderate_impact**

| id | nist |
| --- | --- |
| IMPA-0001 | SP 800-53 |
| IMPA-0002 | SP 800-53 |
| IMPA-0003 | SP 800-171 |
| IMPA-0004 | SP 800-218 |
| IMPA-0005 | NIST AI RMF |
| IMPA-0006 | SP 800-171 |
| IMPA-0007 | SP 800-37 |

**t_nist80053_moderate_impact_at_n_i_s_t_impact_level**

| id | at_n_i_s_t_impact_level |
| --- | --- |
| IMPA-0001 | Moderate Threshold |
| IMPA-0002 | System Security Moderate |
| IMPA-0003 | Impact Level Moderate |
| IMPA-0004 | Moderate Baseline |
| IMPA-0005 | Moderate Threshold |
| IMPA-0006 | Moderate |
| IMPA-0007 | Availability Moderate |

**t_nist80053_moderate_impact__at_n_i_s_t_impact_level**

| id | nist_id | at_n_i_s_t_impact_level_id | role |
| --- | --- | --- | --- |
| IMPA-0001 | IMPA-0002 | IMPA-0007 | observer |
| IMPA-0002 | IMPA-0002 | IMPA-0004 | observer |
| IMPA-0003 | IMPA-0006 | IMPA-0001 | contributor |
| IMPA-0004 | IMPA-0007 | IMPA-0007 | owner |
| IMPA-0005 | IMPA-0003 | IMPA-0002 | owner |
| IMPA-0006 | IMPA-0004 | IMPA-0005 | observer |
| IMPA-0007 | IMPA-0001 | IMPA-0006 | contributor |
| IMPA-0008 | IMPA-0003 | IMPA-0007 | owner |

**t_column_value_distribution**

| id | column |
| --- | --- |
| DIST-0001 | request_count |
| DIST-0002 | patient_bmi |
| DIST-0003 | device_serial |
| DIST-0004 | request_count |
| DIST-0005 | sensor_temperature |
| DIST-0006 | sensor_temperature |
| DIST-0007 | device_serial |

**t_column_value_distribution_value_distribution**

| id | value_distribution |
| --- | --- |
| DIST-0001 | pareto_shape |
| DIST-0002 | binomial_profile |
| DIST-0003 | uniform_range |
| DIST-0004 | poisson_profile |
| DIST-0005 | bernoulli_curve |
| DIST-0006 | binomial_profile |
| DIST-0007 | uniform_range |
| DIST-0008 | uniform_range |

**t_column_value_distribution__value_distribution**

| id | column_id | value_distribution_id | role |
| --- | --- | --- | --- |
| DIST-0001 | DIST-0007 | DIST-0006 | contributor |
| DIST-0002 | DIST-0003 | DIST-0002 | reviewer |
| DIST-0003 | DIST-0007 | DIST-0006 | contributor |
| DIST-0004 | DIST-0007 | DIST-0001 | contributor |
| DIST-0005 | DIST-0002 | DIST-0007 | contributor |
| DIST-0006 | DIST-0007 | DIST-0002 | owner |
| DIST-0007 | DIST-0004 | DIST-0001 | reviewer |
| DIST-0008 | DIST-0002 | DIST-0003 | contributor |

When instantiated within federal security frameworks, this relational topology maps abstract standards to concrete implementation baselines. Specifications such as SP 800-53, SP 800-171, and SP 800-218 are anchored to impact classifications including Moderate Threshold, System Security Moderate, and Moderate Baseline, creating a traceable chain from policy directive to technical control. Verification processes like ISO27001 Compliance Audit or Data Lineage Trace generate evidence records that reference these mapped identifiers, effectively closing the loop between procedural validation and system hardening. Similarly, within data governance contexts, analytical columns such as request_count, patient_bmi, and device_serial are associated with statistical profiles like pareto_shape, binomial_profile, and poisson_profile, allowing analytical workloads to be audited against their underlying distributional assumptions and ensuring that metadata lineage remains verifiable.

The interplay of entity, identifier, and role-bound relationships constitutes a deterministic audit fabric. Rather than relying on monolithic records, the model decomposes compliance and verification into discrete, queryable components that can be recombined across regulatory domains. An identifier like IMPA-0001 simultaneously anchors a NIST standard, an impact level, and a verification output, while its associated attr definitions capture the precise timing, duration, and host context of the assessment. This granular composition enables precise traceability, supports automated compliance checking, and maintains a rigorous separation between structural metadata and the misc values that populate it, thereby ensuring that governance frameworks remain both extensible and auditable.