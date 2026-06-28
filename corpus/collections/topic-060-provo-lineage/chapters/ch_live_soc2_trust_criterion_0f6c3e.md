---
chapter_id: ch_live_soc2_trust_criterion_0f6c3e
topic_id: 60
family: 07_long_tail
cited_terms: ['soc2_trust_criterion', 'outlier_detection_with_baseline', 'mass_function_with_focal_element']
model: engine-refine
---

Compliance architectures depend upon stable identifiers to anchor trust criteria to specific organizational entities, ensuring that audit boundaries remain unambiguous across disparate reporting periods. Each criterion receives a persistent identifier—CRIT-0001, CRIT-0002, and so forth—that ties directly to an operating entity such as CyberShield Ltd or DataVault Inc, while simultaneously mapping to a baseline reference point like BASE-0005. This identifier-to-entity linkage establishes the foundational scope of assurance, guaranteeing that control evaluations are traceable to the exact business unit or service line under review. Without such deterministic tagging, evidence aggregation would collapse into ambiguity, rendering cross-organizational compliance reporting unreliable.

**t_soc2_trust_criterion**

| id | soc | soc2_trust_criterion |
| --- | --- | --- |
| CRIT-0001 | CyberShield Ltd | BASE-0005 |
| CRIT-0002 | DataVault Inc | BASE-0004 |
| CRIT-0003 | CloudScale Services | BASE-0006 |
| CRIT-0004 | HealthSys Networks | BASE-0003 |
| CRIT-0005 | RetailChain Partners | BASE-0006 |
| CRIT-0006 | FinTech Global | BASE-0002 |

**t_soc2_trust_criterion_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| CRIT-0001 | effective_date | xsd:date |
| CRIT-0002 | enforcement | xsd:string |
| CRIT-0003 | mandatory | xsd:boolean |
| CRIT-0004 | priority | xsd:integer |
| CRIT-0005 | review_cycle_days | xsd:integer |
| CRIT-0006 | scope | xsd:string |
| CRIT-0007 | encoding | xsd:string |
| CRIT-0008 | label_text | xsd:string |

**t_soc2_trust_criterion_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CRIT-0001 | CRIT-0001 | CRIT-0003 | false |
| CRIT-0002 | CRIT-0002 | CRIT-0003 | false |
| CRIT-0003 | CRIT-0003 | CRIT-0003 | true |
| CRIT-0004 | CRIT-0004 | CRIT-0003 | false |
| CRIT-0005 | CRIT-0005 | CRIT-0003 | false |
| CRIT-0006 | CRIT-0006 | CRIT-0003 | false |

**t_soc2_trust_criterion_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CRIT-0001 | CRIT-0001 | CRIT-0001 | 2025-04-05 |
| CRIT-0002 | CRIT-0002 | CRIT-0001 | 2024-03-02 |
| CRIT-0003 | CRIT-0003 | CRIT-0001 | 2023-07-21 |
| CRIT-0004 | CRIT-0004 | CRIT-0001 | 2023-05-30 |
| CRIT-0005 | CRIT-0005 | CRIT-0001 | 2023-01-08 |
| CRIT-0006 | CRIT-0006 | CRIT-0001 | 2024-01-19 |

**t_soc2_trust_criterion_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CRIT-0001 | CRIT-0001 | CRIT-0004 | 2 |
| CRIT-0002 | CRIT-0001 | CRIT-0005 | 749 |
| CRIT-0003 | CRIT-0002 | CRIT-0004 | 4 |
| CRIT-0004 | CRIT-0002 | CRIT-0005 | 767 |
| CRIT-0005 | CRIT-0003 | CRIT-0004 | 3 |
| CRIT-0006 | CRIT-0003 | CRIT-0005 | 559 |
| CRIT-0007 | CRIT-0004 | CRIT-0004 | 1 |
| CRIT-0008 | CRIT-0004 | CRIT-0005 | 187 |

**t_soc2_trust_criterion_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CRIT-0001 | CRIT-0001 | CRIT-0007 | Encoding 01 |
| CRIT-0002 | CRIT-0001 | CRIT-0002 | Enforcement 02 |
| CRIT-0003 | CRIT-0001 | CRIT-0008 | change rationale |
| CRIT-0004 | CRIT-0001 | CRIT-0009 | en |
| CRIT-0005 | CRIT-0001 | CRIT-0006 | Scope 05 |
| CRIT-0006 | CRIT-0002 | CRIT-0007 | Encoding 06 |
| CRIT-0007 | CRIT-0002 | CRIT-0002 | Enforcement 07 |
| CRIT-0008 | CRIT-0002 | CRIT-0008 | audit excerpt |

**t_outlier_detection_with_baseline**

| id | outlier |
| --- | --- |
| BASE-0001 | network latency jump |
| BASE-0002 | network latency jump |
| BASE-0003 | log flood |
| BASE-0004 | sensor drift |
| BASE-0005 | API error surge |
| BASE-0006 | disk I/O stall |

**t_outlier_detection_with_baseline_against**

| id | against |
| --- | --- |
| BASE-0001 | expected distribution |
| BASE-0002 | nominal profile |
| BASE-0003 | seasonal pattern |
| BASE-0004 | seasonal pattern |
| BASE-0005 | statistical baseline |
| BASE-0006 | control group dataset |
| BASE-0007 | seasonal pattern |

To govern how metadata attaches to these criteria, the framework defines attributes with strict attr type constraints that prevent semantic drift and guarantee downstream validation. An attr such as effective_date conforms to xsd:date, enforcement to xsd:string, mandatory to xsd:boolean, and priority to xsd:integer, establishing a rigid schema for compliance signals. The actual attribute values are partitioned by type into specialized storage domains, each capturing misc data that reflects the operational reality of the audited environment. Boolean flags record control posture as true or false; temporal metadata anchors policy rollouts to concrete dates like 2025-04-05 or 2024-03-02; integer fields quantify priority levels ranging from 2 to 767; and free-text fields preserve contextual notes such as Encoding 01, Enforcement 02, or change rationale. This multi-typed value architecture ensures that heterogeneous compliance evidence remains queryable and type-safe.

Beyond static criteria, continuous monitoring requires correlating anomalous signals against established baselines through a subject-target relationship governed by explicit role assignments. An outlier such as a network latency jump or sensor drift functions as the subject, while the reference model—whether an expected distribution, nominal profile, or seasonal pattern—serves as the target. The junction between them is not merely relational but functional: a baseline may act as observer, owner, or reviewer, dictating how evidence is aggregated and which thresholds trigger escalation. This role-based linkage transforms raw telemetry into auditable chains of custody, where every deviation is contextualized by its supervisory relationship to the control environment, ensuring that anomaly resolution follows a documented chain of responsibility.

**t_outlier_detection_with_baseline__against**

| id | outlier_id | against_id | role |
| --- | --- | --- | --- |
| BASE-0001 | BASE-0001 | BASE-0005 | observer |
| BASE-0002 | BASE-0001 | BASE-0004 | owner |
| BASE-0003 | BASE-0004 | BASE-0002 | reviewer |
| BASE-0004 | BASE-0003 | BASE-0002 | observer |
| BASE-0005 | BASE-0004 | BASE-0007 | observer |
| BASE-0006 | BASE-0005 | BASE-0003 | observer |
| BASE-0007 | BASE-0006 | BASE-0006 | owner |
| BASE-0008 | BASE-0001 | BASE-0003 | reviewer |

When evidence must be fused across heterogeneous sources, Dempster-Shafer mass functions assign belief to focal elements using quantified confidence scores and documented collection methods. A physical specimen like a 1.5L coolant sample or 3.7g soil core is evaluated through a specific method—manual inspection, hybrid instrumentation, or automated telemetry—and mapped to a criterion identifier with a confidence value ranging from 0.033 to 0.941. High confidence readings substantiate strong belief assignments, whereas marginal scores flag ambiguous evidence requiring corroboration. By coupling method provenance with numerical confidence, the framework distinguishes between verified control performance and speculative indicators, enabling risk managers to weight competing signals appropriately during assurance reviews and maintain defensible audit trails.

**t_mass_function_with_focal_element**

| id | mass | focal_element | confidence | method |
| --- | --- | --- | --- | --- |
| ELEM-0001 | 1.5L coolant sample | CRIT-0002 | 0.863 | manual |
| ELEM-0002 | 3.7g soil core | CRIT-0005 | 0.119 | hybrid |
| ELEM-0003 | 920g polymer pellet | CRIT-0002 | 0.941 | automated |
| ELEM-0004 | 3.7g soil core | CRIT-0003 | 0.033 | hybrid |
| ELEM-0005 | 500MB telemetry dump | CRIT-0005 | 0.250 | hybrid |