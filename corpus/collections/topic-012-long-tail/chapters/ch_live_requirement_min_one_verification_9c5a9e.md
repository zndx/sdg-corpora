---
chapter_id: ch_live_requirement_min_one_verification_9c5a9e
topic_id: 12
family: 03_directive_governance
cited_terms: ['requirement_min_one_verification', 'labrun_produces_measurement', 'settlement_financing_activity']
model: engine-refine
---

Settlement financing and operational assurance rest on a shared vocabulary of stable identifiers, typed attributes, and measurable execution outcomes. An identifier such as VERI-0001 or ACTI-0003 is not merely a surrogate key: it is the durable handle by which auditors, certification authorities, and downstream systems refer to a single obligation, lab execution, or financing event across revisions, reconciliations, and cross-institutional reporting. When the Architecture Review Board attests a latency threshold of 50ms under VERI-0001, or when Deutsche Bank AG appears twice—as funds provider for both CASH-SETTLE-99 and SEC-SETTLE-8812—the identifier preserves lineage so that enforcement history, settlement benefits such as SWIFT GPI Rollout or Cross-Border Rail, and evidentiary artifacts remain joinable without ambiguity.

Attributes and attribute types form the semantic layer through which requirements acquire enforceable shape. Each attr—effective_date, enforcement, mandatory, priority—names a governed dimension; attr_type declares the validation contract under which values must be stored and interpreted, whether as xsd:date, xsd:string, xsd:boolean, or xsd:integer. The entity linkage binds every typed value back to the parent record: VERI-0003’s mandatory flag resolves to false while VERI-0002’s resolves to true, and effective_date values of 2023-09-25, 2024-02-07, 2023-08-17, and 2025-02-12 attach to distinct entities even when the attribute name is shared. Priority integers of 1 and 285, alongside varchar misc values such as Encoding 01, Enforcement 02, change rationale, and locale code fr, illustrate how heterogeneous evidentiary detail coexists under one governance model without collapsing type safety.

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

Laboratory runs supply the operational counterweight to policy metadata: they record how controlled environments behave under repeated execution. A labrun key such as MEAS-0002 may surface in multiple fact rows, signaling retested or partitioned measurements whose duration_seconds—4856.18, 4308.22, 4764.89, 5155.73—quantify elapsed wall-clock effort in seconds fine enough to detect drift. Category classifies each run at a coarser grain—Labrun Category 01 through Labrun Category 04—while misc fields carry human-readable labrun_label values that orient operators during incident review. Exit codes (122, 691, 566, 3) encode termination semantics: success, controlled failure, or abnormal halt; retry_count (265, 244, 106, 12) exposes resilience posture, distinguishing runs that exhausted extensive retry budgets from those that stabilized after twelve attempts.

**fact_labrun**

| id | labrun_key | duration_seconds | exit_code | retry_count |
| --- | --- | --- | --- | --- |
| MEAS-0001 | MEAS-0002 | 4856.18 | 122 | 265 |
| MEAS-0002 | MEAS-0006 | 4308.22 | 691 | 244 |
| MEAS-0003 | MEAS-0002 | 4764.89 | 566 | 106 |
| MEAS-0004 | MEAS-0005 | 5155.73 | 3 | 12 |
| MEAS-0005 | MEAS-0002 | 385.91 | 81 | 197 |

Settlement financing activity names the institutional mechanism by which funds movement is authorized and settled. Values such as T-PLUS-ONE-CLEAR, INTERBANK-SETTLE, CASH-SETTLE-99, and SEC-SETTLE-8812 denote distinct rails—next-day clearing, interbank netting, near-cash settlement, and securities-specific settlement—each with its own regulatory footprint and counterparty risk profile. The financialinstitution dimension identifies which institution supplies or intermediates funds: HSBC Holdings and Goldman Sachs anchor separate activities, while Deutsche Bank AG’s recurrence across two activity types signals multi-rail participation rather than duplicate records. Benefits linkage to settlement projects—Regional Clearing Hub alongside repeated SWIFT GPI Rollout associations—shows how financing activities are justified not in isolation but as enablers of named infrastructure or messaging programs.

In practice, these constructs interlock during compliance examination and production governance. Verification requirements verified_by the Internal Audit Team or Certification Authority must present at least one typed attribute value per obligation—the mandatory boolean under attr_id VERI-0003, the effective_date under VERI-0001—before an entity can be marked substantively complete. Labrun facts with elevated exit codes and high retry_count trigger escalation against the same requirement set that governs backup frequency daily, where duplicate requirement text still demands distinct evidentiary rows verified_by different authorities. Settlement financing activities, meanwhile, supply the business context in which latency thresholds and audit-log completeness requirements acquire materiality: a 50ms breach or incomplete logging during INTERBANK-SETTLE processing carries different settlement and reputational exposure than during a categorized labrun rehearsal.

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

Operators and control owners should treat attr_type as a non-negotiable constraint, entity as the authoritative scope of attribution, and identifier as the audit spine. Misc columns absorb values that resist rigid typing—labels, rationales, encodings—while category, duration_seconds, exit, and retry_count furnish the quantitative and classificatory evidence needed to demonstrate that settlementfinancingactivity controls were exercised under observable conditions. Taken together, the domain describes a closed loop: policy declared through typed attributes on identified entities, behavior measured through labrun execution metrics, and institutional settlement activity providing the commercial frame within which both policy and measurement acquire regulatory meaning.

**dim_labrun**

| id | labrun_label | labrun_category |
| --- | --- | --- |
| MEAS-0001 | Labrun Label 01 | Labrun Category 01 |
| MEAS-0002 | Labrun Label 02 | Labrun Category 02 |
| MEAS-0003 | Labrun Label 03 | Labrun Category 03 |
| MEAS-0004 | Labrun Label 04 | Labrun Category 04 |
| MEAS-0005 | Labrun Label 05 | Labrun Category 05 |
| MEAS-0006 | Labrun Label 06 | Labrun Category 06 |

**t_settlement_financing_activity**

| id | settlement_financing_activity | funds | benefits |
| --- | --- | --- | --- |
| ACTI-0001 | T-PLUS-ONE-CLEAR | HSBC Holdings | SWIFT GPI Rollout |
| ACTI-0002 | INTERBANK-SETTLE | Goldman Sachs | Regional Clearing Hub |
| ACTI-0003 | CASH-SETTLE-99 | Deutsche Bank AG | SWIFT GPI Rollout |
| ACTI-0004 | SEC-SETTLE-8812 | Deutsche Bank AG | Cross-Border Rail |
| ACTI-0005 | CASH-SETTLE-99 | Deutsche Bank AG | Cross-Border Rail |