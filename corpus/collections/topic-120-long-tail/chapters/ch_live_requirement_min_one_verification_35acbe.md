---
chapter_id: ch_live_requirement_min_one_verification_35acbe
topic_id: 120
family: 03_directive_governance
cited_terms: ['requirement_min_one_verification', 'storage_structure_composition', 'outlier_claim_against_baseline']
model: engine-refine
---

Requirements verification operates as a structured governance mechanism wherein each requirement is assigned to a verifying authority and enriched with typed metadata. The verification registry records entries such as VERI-0001, which maps the requirement "Latency threshold 50ms" to the Architecture Review Board, and VERI-0003, which assigns "Backup frequency daily" to the Internal Audit Team. Attribute definitions establish the schema for supplementary properties: effective_date carries an xsd:date type, enforcement is xsd:string, mandatory is xsd:boolean, and priority is xsd:integer. These attribute types are materialized through dedicated value tables that enforce type discipline at the storage layer. Boolean values for the mandatory attribute resolve to true or false across verification records; date values span from 2023-08-17 through 2025-02-12, anchoring requirements to specific temporal scopes; integer priority values range from 1 to 542, reflecting graded urgency; and varchar attributes capture free-text annotations such as "change rationale" and locale codes like "fr". The entity-attr cross-reference structure permits a single verification record to carry multiple typed attributes, enabling rich, multi-dimensional requirement profiles without schema mutation.

**t_requirement_min_one_verification**

| id | requirement | verified_by |
| --- | --- | --- |
| VERI-0001 | Latency threshold 50ms | Architecture Review Board |
| VERI-0002 | Audit log completeness | Architecture Review Board |
| VERI-0003 | Backup frequency daily | Internal Audit Team |
| VERI-0004 | Backup frequency daily | Certification Authority |
| VERI-0005 | Schema validation strict | NIST 800-53 |
| VERI-0006 | PII masking rule | Architecture Review Board |

**t_requirement_min_one_verification_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| VERI-0001 | effective_date | xsd:date |
| VERI-0002 | enforcement | xsd:string |
| VERI-0003 | mandatory | xsd:boolean |
| VERI-0004 | priority | xsd:integer |
| VERI-0005 | review_cycle_days | xsd:integer |
| VERI-0006 | scope | xsd:string |
| VERI-0007 | encoding | xsd:string |
| VERI-0008 | label_text | xsd:string |

**t_requirement_min_one_verification_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERI-0001 | VERI-0001 | VERI-0003 | false |
| VERI-0002 | VERI-0002 | VERI-0003 | true |
| VERI-0003 | VERI-0003 | VERI-0003 | false |
| VERI-0004 | VERI-0004 | VERI-0003 | false |
| VERI-0005 | VERI-0005 | VERI-0003 | false |
| VERI-0006 | VERI-0006 | VERI-0003 | false |

**t_requirement_min_one_verification_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERI-0001 | VERI-0001 | VERI-0001 | 2023-09-25 |
| VERI-0002 | VERI-0002 | VERI-0001 | 2024-02-07 |
| VERI-0003 | VERI-0003 | VERI-0001 | 2023-08-17 |
| VERI-0004 | VERI-0004 | VERI-0001 | 2025-02-12 |
| VERI-0005 | VERI-0005 | VERI-0001 | 2023-06-21 |
| VERI-0006 | VERI-0006 | VERI-0001 | 2024-04-16 |

**t_requirement_min_one_verification_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERI-0001 | VERI-0001 | VERI-0004 | 1 |
| VERI-0002 | VERI-0001 | VERI-0005 | 285 |
| VERI-0003 | VERI-0002 | VERI-0004 | 1 |
| VERI-0004 | VERI-0002 | VERI-0005 | 542 |
| VERI-0005 | VERI-0003 | VERI-0004 | 5 |
| VERI-0006 | VERI-0003 | VERI-0005 | 517 |
| VERI-0007 | VERI-0004 | VERI-0004 | 2 |
| VERI-0008 | VERI-0004 | VERI-0005 | 72 |

**t_requirement_min_one_verification_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERI-0001 | VERI-0001 | VERI-0007 | Encoding 01 |
| VERI-0002 | VERI-0001 | VERI-0002 | Enforcement 02 |
| VERI-0003 | VERI-0001 | VERI-0008 | change rationale |
| VERI-0004 | VERI-0001 | VERI-0009 | fr |
| VERI-0005 | VERI-0001 | VERI-0006 | Scope 05 |
| VERI-0006 | VERI-0002 | VERI-0007 | Encoding 06 |
| VERI-0007 | VERI-0002 | VERI-0002 | Enforcement 07 |
| VERI-0008 | VERI-0002 | VERI-0008 | intake form |

Storage structure composition models the hierarchical decomposition of infrastructure into logical pools and their constituent database containers. A composition such as COMP-0001, designated as a tiered-storage-pool, comprises the dev-mongo-shard database container, while COMP-0002, an archive-tape-library, encompasses the staging-redis-cluster. The composition-to-container mapping is further mediated by a role-annotated relationship table that assigns each pairing a functional role—observer or reviewer—thereby distinguishing passive monitoring relationships from active governance relationships. Cross-composition references appear in entries like COMP-0003, which links storage_id COMP-0003 to comprises_id COMP-0006 with the role observer, and COMP-0004, which links COMP-0003 to COMP-0006 with the role reviewer. This dual-layer design—where a composition both declares its container members and participates as a member of other compositions—supports recursive infrastructure modeling.

**t_storage_structure_composition_comprises**

| id | comprises |
| --- | --- |
| COMP-0001 | dev-mongo-shard |
| COMP-0002 | staging-redis-cluster |
| COMP-0003 | s3-logs-bucket |
| COMP-0004 | cassandra-data-node |
| COMP-0005 | oracle-tablespace-main |
| COMP-0006 | neo4j-graph-store |

**t_storage_structure_composition__comprises**

| id | storage_id | comprises_id | role |
| --- | --- | --- | --- |
| COMP-0001 | COMP-0003 | COMP-0006 | observer |
| COMP-0002 | COMP-0002 | COMP-0004 | reviewer |
| COMP-0003 | COMP-0006 | COMP-0001 | observer |
| COMP-0004 | COMP-0003 | COMP-0006 | reviewer |
| COMP-0005 | COMP-0002 | COMP-0002 | contributor |
| COMP-0006 | COMP-0001 | COMP-0006 | reviewer |
| COMP-0007 | COMP-0006 | COMP-0003 | owner |
| COMP-0008 | COMP-0002 | COMP-0006 | reviewer |

Outlier claims against baseline establish a parallel governance structure for detecting and attributing deviations from established norms. The outlier registry records anomalies such as BASE-0001, which flags telemetry_log_error_404, and BASE-0004, which identifies schema_drift_column_count. Each outlier is associated with a baseline reference through a separate table: BASE-0001 is measured against policy_rule_governance, BASE-0002 against sla_latency_threshold, and BASE-0003 against regulatory_limit_max. The linking relationship table introduces a role dimension to these associations, assigning reviewer, contributor, or observer roles to the connections between outlier identifiers and baseline identifiers. Notably, a single outlier such as BASE-0001 participates in multiple role-annotated links—connecting to both BASE-0005 and BASE-0006 as reviewer—while a single baseline like BASE-0001 receives contributions from multiple outliers, including BASE-0005 acting as contributor. This many-to-many role-annotated relationship pattern mirrors the storage composition architecture, suggesting a unified design philosophy for governance relationships across domains.

**t_storage_structure_composition**

| id | storage_structure_composition |
| --- | --- |
| COMP-0001 | tiered-storage-pool |
| COMP-0002 | archive-tape-library |
| COMP-0003 | tiered-storage-pool |
| COMP-0004 | san-disk-array |
| COMP-0005 | archive-tape-library |
| COMP-0006 | flash-memory-pool |

**t_outlier_claim_against_baseline**

| id | outlier |
| --- | --- |
| BASE-0001 | telemetry_log_error_404 |
| BASE-0002 | pH_reading_11_2_deviation |
| BASE-0003 | telemetry_log_error_404 |
| BASE-0004 | schema_drift_column_count |
| BASE-0005 | metric_latency_p99_exceed |
| BASE-0006 | pH_reading_11_2_deviation |

**t_outlier_claim_against_baseline_against**

| id | against |
| --- | --- |
| BASE-0001 | policy_rule_governance |
| BASE-0002 | sla_latency_threshold |
| BASE-0003 | regulatory_limit_max |
| BASE-0004 | policy_rule_governance |
| BASE-0005 | policy_rule_governance |
| BASE-0006 | baseline_model_v4 |

**t_outlier_claim_against_baseline__against**

| id | outlier_id | against_id | role |
| --- | --- | --- | --- |
| BASE-0001 | BASE-0001 | BASE-0005 | reviewer |
| BASE-0002 | BASE-0001 | BASE-0006 | reviewer |
| BASE-0003 | BASE-0005 | BASE-0001 | contributor |
| BASE-0004 | BASE-0005 | BASE-0001 | observer |
| BASE-0005 | BASE-0003 | BASE-0002 | observer |
| BASE-0006 | BASE-0001 | BASE-0003 | observer |
| BASE-0007 | BASE-0002 | BASE-0006 | observer |
| BASE-0008 | BASE-0001 | BASE-0002 | observer |