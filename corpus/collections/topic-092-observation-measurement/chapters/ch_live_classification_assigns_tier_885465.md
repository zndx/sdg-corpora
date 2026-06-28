---
chapter_id: ch_live_classification_assigns_tier_885465
topic_id: 92
family: 03_directive_governance
cited_terms: ['classification_assigns_tier', 'attribute_set_basic', 'outlier_claim_against_baseline']
model: engine-refine
---

The attribute registry establishes a typed schema for sensor and telemetry data, where each attribute carries a precise datatype—`xsd:decimal` for numeric readings such as `0.501` and `613.30`, `xsd:string` for categorical labels like `Dimension Kind 01` and `Encoding 02`, and `xsd:dateTime` for temporal stamps including `2025-04-11T14:14:38` and `2024-10-27T12:43:31`. This type discipline is enforced through a three-tier value store: decimal, varchar, and datetime columns each hold the concrete measurements for a given entity, ensuring that type coercion never occurs at query time. An entity, identified by a stable key such as `SET-0001`, aggregates its attributes across these value tables, so that a single sensor reading might simultaneously carry a confidence score of `0.946`, a recorded timestamp, and a dimension classification, all retrievable through the entity's identifier.

**t_classification_assigns_tier**

| id | classification | assigns_tier | log_level | retry_count |
| --- | --- | --- | --- | --- |
| TIER-0001 | Governance Registry | Sandbox Tier | info | 379 |
| TIER-0002 | Security Baseline | Internal Distribution | error | 176 |
| TIER-0003 | Data Classification Scheme | Restricted Access | debug | 195 |
| TIER-0004 | Data Lineage Map | Restricted Access | debug | 460 |
| TIER-0005 | Metadata Schema | Sandbox Tier | critical | 23 |

**t_attribute_set_basic**

| id | attribute |
| --- | --- |
| SET-0001 | Sensor ID |
| SET-0002 | Sensor ID |
| SET-0003 | Sensor ID |
| SET-0004 | Data Source |
| SET-0005 | Sample Mass |
| SET-0006 | Quality Flag |

**t_attribute_set_basic_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| SET-0001 | confidence | xsd:decimal |
| SET-0002 | dimension_kind | xsd:string |
| SET-0003 | method | xsd:string |
| SET-0004 | recorded_at | xsd:dateTime |
| SET-0005 | uncertainty | xsd:decimal |
| SET-0006 | unit | xsd:string |
| SET-0007 | value | xsd:decimal |
| SET-0008 | encoding | xsd:string |

**t_attribute_set_basic_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SET-0001 | SET-0001 | SET-0004 | 2025-04-11T14:14:38 |
| SET-0002 | SET-0002 | SET-0004 | 2024-10-27T12:43:31 |
| SET-0003 | SET-0003 | SET-0004 | 2023-07-18T04:02:37 |
| SET-0004 | SET-0004 | SET-0004 | 2025-04-28T09:26:57 |
| SET-0005 | SET-0005 | SET-0004 | 2023-08-28T23:05:03 |
| SET-0006 | SET-0006 | SET-0004 | 2024-02-14T11:29:41 |

**t_attribute_set_basic_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SET-0001 | SET-0001 | SET-0001 | 0.501 |
| SET-0002 | SET-0001 | SET-0005 | 613.30 |
| SET-0003 | SET-0001 | SET-0007 | 863.60 |
| SET-0004 | SET-0002 | SET-0001 | 0.946 |
| SET-0005 | SET-0002 | SET-0005 | 609.02 |
| SET-0006 | SET-0002 | SET-0007 | 173.62 |
| SET-0007 | SET-0003 | SET-0001 | 0.926 |
| SET-0008 | SET-0003 | SET-0005 | 843.81 |

**t_attribute_set_basic_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SET-0001 | SET-0001 | SET-0002 | Dimension Kind 01 |
| SET-0002 | SET-0001 | SET-0008 | Encoding 02 |
| SET-0003 | SET-0001 | SET-0009 | audit excerpt |
| SET-0004 | SET-0001 | SET-0010 | fr |
| SET-0005 | SET-0001 | SET-0003 | hybrid |
| SET-0006 | SET-0001 | SET-0006 | ratio |
| SET-0007 | SET-0002 | SET-0002 | Dimension Kind 07 |
| SET-0008 | SET-0002 | SET-0008 | Encoding 08 |

Governance over these attribute sets is mediated by a classification-to-tier mapping that assigns each registry entry to an access tier—`Sandbox Tier`, `Internal Distribution`, or `Restricted Access`—and couples that assignment with operational metadata. The classification `Governance Registry` maps to `Sandbox Tier` with an `info` log level and a retry count of `379`, while `Data Lineage Map` and `Data Classification Scheme` both land in `Restricted Access` with `debug` logging and retry counts of `460` and `195` respectively. The `retry_count` field captures the number of attempted reconciliations before a classification assignment stabilizes, and `log_level` determines the verbosity of audit trails for that tier; a `Security Baseline` entry, for instance, carries an `error` log level and a retry count of `176`, reflecting its stricter monitoring posture.

Outlier detection operates by asserting that a particular observation—`telemetry_log_error_404`, `pH_reading_11_2_deviation`, or `schema_drift_column_count`—deviates from an established baseline such as `policy_rule_governance`, `sla_latency_threshold`, or `regulatory_limit_max`. These assertions are not monolithic; the same outlier claim can be evaluated against multiple baselines simultaneously, and each pairing carries a `role` that defines the claimant's function in the evaluation. A single outlier identifier like `BASE-0001` may appear with the role `reviewer` against one baseline and `contributor` against another, while a separate claim might assume the role `observer`, indicating a passive monitoring posture rather than an active challenge.

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

The subject-target relationship in this framework is explicit: the `subject` is the outlier claim identifier that initiates the deviation assertion, and the `target` is the baseline identifier against which the claim is measured. This bipartite structure allows a single outlier to be cross-referenced against multiple governance rules or performance thresholds, with each edge in the graph independently annotated by role. The `against` table resolves the human-readable baseline name—`policy_rule_governance` or `regulatory_limit_max`—while the join table materializes the directed edges, ensuring that the provenance of every deviation claim is traceable to both its origin and its point of comparison.

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