---
chapter_id: ch_live_policy_subclass_governs_e9d99a
topic_id: 19
family: 03_directive_governance
cited_terms: ['policy_subclass_governs', 'state_basic', 'policy_applies_to']
model: engine-refine
---

The governance framework rests upon a hierarchy of identifiers that anchor every policy instrument to its operational scope. Each directive receives a unique identifier—GOVE-0001 through GOVE-0004—through which it is classified, tracked, and enforced. The policy subclass governing table establishes which directives apply to which application scopes; the Edge Telemetry Nodes directive (GOVE-0001) governs scope APPL-0006, while the GDPR Compliance Directive (GOVE-0003) and Data Classification Framework (GOVE-0004) both converge on APPL-0005 and APPL-0007 respectively. This many-to-many mapping ensures that a single policy can cascade across multiple application domains without duplication, and conversely that each application scope can be traced to its complete set of governing directives.

**t_policy_subclass_governs**

| id | policy | governs_scope | priority | review_cycle_days |
| --- | --- | --- | --- | --- |
| GOVE-0001 | Edge Telemetry Nodes | APPL-0006 | 4 | 799 |
| GOVE-0002 | Incident Response Protocol | APPL-0007 | 5 | 632 |
| GOVE-0003 | GDPR Compliance Directive | APPL-0007 | 1 | 507 |
| GOVE-0004 | Data Classification Framework | APPL-0005 | 4 | 277 |
| GOVE-0005 | Incident Response Protocol | APPL-0003 | 3 | 143 |
| GOVE-0006 | Data Retention Protocol | APPL-0004 | 5 | 666 |

**t_policy_applies_to**

| id | policy | applies_to | effective_date | label_text |
| --- | --- | --- | --- | --- |
| APPL-0001 | Laboratory Safety Mandate | GOVE-0002 | 2025-01-11 | audit excerpt |
| APPL-0002 | Audit Trail Requirement | GOVE-0001 | 2023-03-13 | nightly summary |
| APPL-0003 | GDPR Compliance Directive | GOVE-0004 | 2024-06-14 | nightly summary |
| APPL-0004 | ISO 27001 Control Framework | GOVE-0003 | 2024-05-03 | pre-release note |
| APPL-0005 | Laboratory Safety Mandate | GOVE-0001 | 2024-11-13 | nightly summary |
| APPL-0006 | Data Classification Framework | GOVE-0001 | 2023-05-19 | change rationale |
| APPL-0007 | Third-Party API Integrations | GOVE-0003 | 2024-07-03 | nightly summary |

Assigned to each governing relationship are two temporal and operational parameters: priority and review cycle days. Priority operates as an ordinal scale—values of 1 through 5 in the observed data—where the GDPR Compliance Directive carries the highest designation of 1, signaling its regulatory urgency, while the Edge Telemetry Nodes and Data Classification Framework directives share a priority of 4, reflecting their secondary but still material importance. The review cycle days field quantifies the interval between mandatory reassessments, ranging from 277 days for the Data Classification Framework to 799 days for Edge Telemetry Nodes. These intervals are not arbitrary; they correlate inversely with priority, such that the most critical directives demand more frequent scrutiny.

The policy-to-governance linkage is further articulated through the applies-to relationship, which binds a named policy instrument to a governing scope with an effective date and a descriptive label. The Laboratory Safety Mandate, for instance, became operative on 2023-03-13 under the label "audit excerpt," while the ISO 27001 Control Framework took effect on 2024-05-03 with the label "pre-release note." The GDPR Compliance Directive appears under two distinct effective dates—2024-06-14 and 2023-03-13—suggesting either phased implementation or parallel applicability across different governance scopes. These effective dates establish the temporal boundary of enforceability, and the label text provides a human-readable annotation that distinguishes between audit documentation, nightly summaries, and pre-release notes.

State tracking introduces a probabilistic dimension to the governance model. The state dimension table assigns each state a categorical classification—State Category 01 through State Category 04—and a human-readable label such as State Label 01. These categorical assignments are then populated with factual observations in the state facts table, where each state key is accompanied by a confidence score, an uncertainty magnitude, and a miscellaneous value. Confidence values range from 0.012 for STAT-0004 to 0.523 for STAT-0003, indicating that some state observations carry substantial analytical certainty while others remain highly speculative. The corresponding uncertainty field quantifies this imprecision in absolute terms, with values spanning from 366.30 to 951.90, and the miscellaneous value field captures auxiliary measurements—such as 619.50 for STAT-0003 or 143.04 for STAT-0004—that may represent derived metrics or contextual annotations.

**fact_state**

| id | state_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| STAT-0001 | STAT-0001 | 0.422 | 951.90 | 195.86 |
| STAT-0002 | STAT-0004 | 0.012 | 416.12 | 143.04 |
| STAT-0003 | STAT-0005 | 0.075 | 421.79 | 237.15 |
| STAT-0004 | STAT-0003 | 0.523 | 366.30 | 619.50 |

**dim_state**

| id | state_label | state_category |
| --- | --- | --- |
| STAT-0001 | State Label 01 | State Category 01 |
| STAT-0002 | State Label 02 | State Category 02 |
| STAT-0003 | State Label 03 | State Category 03 |
| STAT-0004 | State Label 04 | State Category 04 |
| STAT-0005 | State Label 05 | State Category 05 |
| STAT-0006 | State Label 06 | State Category 06 |
| STAT-0007 | State Label 07 | State Category 07 |
| STAT-0008 | State Label 08 | State Category 08 |

Together, these constructs form a governance architecture that is simultaneously deterministic and probabilistic. The identifiers, effective dates, priorities, and review cycles establish a rigid scaffold of enforceable obligations; the state categories, confidence scores, and uncertainty measures provide a mechanism for monitoring compliance in conditions of incomplete information. An auditor reviewing the GDPR Compliance Directive would encounter its priority of 1, its review cycle of 507 days, its effective date of 2024-06-14, and the associated state observations whose confidence of 0.523 and uncertainty of 366.30 suggest a moderate degree of analytical reliability. This dual structure—certainty where it can be codified, and measured doubt where it cannot—ensures that the framework remains operational across the full spectrum of governance conditions.