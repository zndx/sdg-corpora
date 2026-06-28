---
chapter_id: ch_live_audit_conducted_by_b5ce91
topic_id: 11
family: 03_directive_governance
cited_terms: ['audit_conducted_by', 'attestation_about_compliance_claim', 'control_under_framework']
model: engine-refine
---

Attestation is the governed assertion that a compliance-relevant condition holds at a point in time: a labeled claim, keyed for traceability, classified for policy routing, and quantified so reviewers can distinguish durable findings from provisional ones. In operational governance models, attestations do not float as free text; they anchor to stable identifiers such as CLAI-0001 through CLAI-0004, each paired with a human-readable label and a category that places the claim within the organization's taxonomy of evidentiary types. A SOC2 Compliance Review or a Data Retention Policy audit may produce many raw observations, but attestation is what elevates selected observations into accountable statements suitable for control dashboards, regulator inquiry, and remediation workflows. Category therefore functions as the semantic gate: Attestation Category 01 and Attestation Category 04 may both appear in the same reporting period, yet they trigger different review thresholds, escalation paths, and retention rules because the framework treats category as a first-class compliance dimension rather than decorative metadata.

**t_audit_conducted_by**

| id | audit |
| --- | --- |
| COND-0001 | Cloud Infrastructure Review |
| COND-0002 | SOC2 Compliance Review |
| COND-0003 | Lab Safety Inspection |
| COND-0004 | Data Retention Policy |
| COND-0005 | Legacy Migration Check |
| COND-0006 | SOC2 Compliance Review |

**dim_attestation**

| id | attestation_label | attestation_category |
| --- | --- | --- |
| CLAI-0001 | Attestation Label 01 | Attestation Category 01 |
| CLAI-0002 | Attestation Label 02 | Attestation Category 02 |
| CLAI-0003 | Attestation Label 03 | Attestation Category 03 |
| CLAI-0004 | Attestation Label 04 | Attestation Category 04 |
| CLAI-0005 | Attestation Label 05 | Attestation Category 05 |
| CLAI-0006 | Attestation Label 06 | Attestation Category 06 |

Confidence and uncertainty supply the epistemic layer without which attestations would read as binary facts. Confidence expresses graded belief in the truth of a keyed claim on a bounded scale—for example, 0.840 on CLAI-0001 versus 0.051 on CLAI-0004—while uncertainty captures the residual doubt or measurement spread associated with that belief, here ranging from 91.51 to 986.76 across the fact set. High-confidence attestations (0.987) may still carry substantial uncertainty (859.08), signaling that decision-makers must read the two measures jointly: confidence answers whether the claim is accepted for action, uncertainty answers how fragile that acceptance would be under adversarial review or repeated measurement. Numeric attestation values—571.54, 362.06, 96.81, 16.44—are stored as typed miscellany in the fact layer, meaning the same attestation key can reference both the qualitative classification in the dimension and the quantitative payload required for trending, thresholding, or reconciliation against instrumented telemetry.

**fact_attestation**

| id | attestation_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| CLAI-0001 | CLAI-0004 | 0.051 | 91.51 | 571.54 |
| CLAI-0002 | CLAI-0001 | 0.840 | 986.76 | 362.06 |
| CLAI-0003 | CLAI-0003 | 0.482 | 606.80 | 96.81 |
| CLAI-0004 | CLAI-0004 | 0.987 | 859.08 | 16.44 |
| CLAI-0005 | CLAI-0003 | 0.738 | 864.19 | 799.64 |

Beneath attestations, entity-centric attribute models record what was observed about auditable and controllable objects. An entity is the stable object of record—COND-0001 denoting a Cloud Infrastructure Review, FRAM-0003 a Session timeout control—while attributes name the inspectable facets bound to that entity through attr identifiers and attr_type declarations that enforce interpretive discipline. Attr_type is not cosmetic typing; it determines lawful representation and validation. Duration recorded as xsd:decimal (1980.42 seconds on one review, 6184.62 on another), timestamps as xsd:dateTime (2023-06-07T00:47:02 marking an audit boundary), exit codes as xsd:integer (395, 293), host identity as xsd:string (node-a01), effective controls dates as xsd:date (2024-07-12 for a Network firewall under GDPR), and mandatory flags as xsd:boolean (true for HIPAA session controls, false where a baseline is advisory). Separating attr_name and attr_type from stored values prevents schema churn when new inspection dimensions appear: the framework adds attributes and typed value relations rather than widening core entity tables whenever a Lab Safety Inspection begins reporting Log Level 02 or a review state of superseded.

**t_audit_conducted_by_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| COND-0001 | duration_seconds | xsd:decimal |
| COND-0002 | end_time | xsd:dateTime |
| COND-0003 | exit_code | xsd:integer |
| COND-0004 | host_name | xsd:string |
| COND-0005 | log_level | xsd:string |
| COND-0006 | phase | xsd:string |
| COND-0007 | retry_count | xsd:integer |
| COND-0008 | scheduled_at | xsd:dateTime |

**t_control_under_framework**

| id | control | under_framework |
| --- | --- | --- |
| FRAM-0001 | Network firewall | GDPR |
| FRAM-0002 | Threat detection | NIST 800-53 |
| FRAM-0003 | Session timeout | HIPAA |
| FRAM-0004 | Configuration baseline | GDPR |
| FRAM-0005 | Vulnerability scan | NIST CSF |
| FRAM-0006 | Access review | COBIT |

**t_control_under_framework_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| FRAM-0001 | effective_date | xsd:date |
| FRAM-0002 | enforcement | xsd:string |
| FRAM-0003 | mandatory | xsd:boolean |
| FRAM-0004 | priority | xsd:integer |
| FRAM-0005 | review_cycle_days | xsd:integer |
| FRAM-0006 | scope | xsd:string |
| FRAM-0007 | encoding | xsd:string |
| FRAM-0008 | label_text | xsd:string |

Identifiers knit the model into an auditable graph. Primary identifiers on entity rows (COND-0004, FRAM-0002) remain distinct from the attr_id keys that type individual measurements and from attestation_key references that link factual confidence back to dimensional claims. In value relations, entity_id and attr_id pairs locate misc—the concrete stored value—within the correct semantic cell: the same COND-0001 entity may simultaneously carry decimal duration, integer exit_code, datetime end_time, and varchar host_name without collision because each tuple is keyed by its attribute identity. This pattern scales across domains. Controls mapped under_framework to GDPR, NIST 800-53, or HIPAA inherit heterogeneous attribute sets—enforcement as xsd:string (Enforcement 02), priority as xsd:integer (3 versus 994), mandatory as xsd:boolean—while preserving a uniform query surface for assessors who must answer whether Threat detection or Configuration baseline obligations are effective, enforced, and prioritized consistently.

**t_audit_conducted_by_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| COND-0001 | COND-0001 | COND-0002 | 2023-06-07T00:47:02 |
| COND-0002 | COND-0001 | COND-0008 | 2025-06-08T04:54:48 |
| COND-0003 | COND-0001 | COND-0009 | 2023-02-14T08:05:22 |
| COND-0004 | COND-0002 | COND-0002 | 2023-03-04T06:34:44 |
| COND-0005 | COND-0002 | COND-0008 | 2025-02-11T04:03:38 |
| COND-0006 | COND-0002 | COND-0009 | 2024-11-06T16:59:35 |
| COND-0007 | COND-0003 | COND-0002 | 2024-02-26T03:59:36 |
| COND-0008 | COND-0003 | COND-0008 | 2023-10-26T01:36:07 |

**t_audit_conducted_by_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| COND-0001 | COND-0001 | COND-0001 | 1980.42 |
| COND-0002 | COND-0002 | COND-0001 | 6184.62 |
| COND-0003 | COND-0003 | COND-0001 | 3332.18 |
| COND-0004 | COND-0004 | COND-0001 | 5867.45 |
| COND-0005 | COND-0005 | COND-0001 | 1263.06 |
| COND-0006 | COND-0006 | COND-0001 | 5705.65 |

**t_audit_conducted_by_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| COND-0001 | COND-0001 | COND-0003 | 395 |
| COND-0002 | COND-0001 | COND-0007 | 293 |
| COND-0003 | COND-0002 | COND-0003 | 558 |
| COND-0004 | COND-0002 | COND-0007 | 143 |
| COND-0005 | COND-0003 | COND-0003 | 950 |
| COND-0006 | COND-0003 | COND-0007 | 140 |
| COND-0007 | COND-0004 | COND-0003 | 458 |
| COND-0008 | COND-0004 | COND-0007 | 234 |

**t_audit_conducted_by_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| COND-0001 | COND-0001 | COND-0004 | node-a01 |
| COND-0002 | COND-0001 | COND-0005 | Log Level 02 |
| COND-0003 | COND-0001 | COND-0006 | review |
| COND-0004 | COND-0001 | COND-0010 | superseded |
| COND-0005 | COND-0001 | COND-0011 | Triggered By 05 |
| COND-0006 | COND-0002 | COND-0004 | worker-07 |
| COND-0007 | COND-0002 | COND-0005 | Log Level 07 |
| COND-0008 | COND-0002 | COND-0006 | review |

**t_control_under_framework_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| FRAM-0001 | FRAM-0001 | FRAM-0003 | true |
| FRAM-0002 | FRAM-0002 | FRAM-0003 | true |
| FRAM-0003 | FRAM-0003 | FRAM-0003 | true |
| FRAM-0004 | FRAM-0004 | FRAM-0003 | false |
| FRAM-0005 | FRAM-0005 | FRAM-0003 | false |
| FRAM-0006 | FRAM-0006 | FRAM-0003 | false |

**t_control_under_framework_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| FRAM-0001 | FRAM-0001 | FRAM-0001 | 2024-07-12 |
| FRAM-0002 | FRAM-0002 | FRAM-0001 | 2023-06-25 |
| FRAM-0003 | FRAM-0003 | FRAM-0001 | 2024-04-08 |
| FRAM-0004 | FRAM-0004 | FRAM-0001 | 2023-08-28 |
| FRAM-0005 | FRAM-0005 | FRAM-0001 | 2025-04-10 |
| FRAM-0006 | FRAM-0006 | FRAM-0001 | 2024-04-05 |

**t_control_under_framework_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| FRAM-0001 | FRAM-0001 | FRAM-0004 | 3 |
| FRAM-0002 | FRAM-0001 | FRAM-0005 | 104 |
| FRAM-0003 | FRAM-0002 | FRAM-0004 | 1 |
| FRAM-0004 | FRAM-0002 | FRAM-0005 | 994 |
| FRAM-0005 | FRAM-0003 | FRAM-0004 | 5 |
| FRAM-0006 | FRAM-0003 | FRAM-0005 | 358 |
| FRAM-0007 | FRAM-0004 | FRAM-0004 | 3 |
| FRAM-0008 | FRAM-0004 | FRAM-0005 | 95 |

**t_control_under_framework_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| FRAM-0001 | FRAM-0001 | FRAM-0007 | Encoding 01 |
| FRAM-0002 | FRAM-0001 | FRAM-0002 | Enforcement 02 |
| FRAM-0003 | FRAM-0001 | FRAM-0008 | pre-release note |
| FRAM-0004 | FRAM-0001 | FRAM-0009 | ja |
| FRAM-0005 | FRAM-0001 | FRAM-0006 | Scope 05 |
| FRAM-0006 | FRAM-0002 | FRAM-0007 | Encoding 06 |
| FRAM-0007 | FRAM-0002 | FRAM-0002 | Enforcement 07 |
| FRAM-0008 | FRAM-0002 | FRAM-0008 | calibration record |

In practice, practitioners move along a repeatable evidence chain: instrument an entity, declare attrs with XSD-grounded types, persist misc in typed stores, derive or register attestations with category and confidence, and govern action under uncertainty-aware thresholds. A Cloud Infrastructure Review that records 3332.18 seconds of observed runtime and an exit_code of 558 does not, by itself, constitute organizational proof; attestation transforms selected measurements into CLAI-keyed claims whose acceptance is explicit. Conversely, a low-confidence attestation (0.482) may still warrant attention when its category implicates a material control class, because governance frameworks weight category and confidence jointly rather than applying a single scalar rule. Framework placement reinforces this logic: a Session timeout control under HIPAA with mandatory true and effective_date 2024-04-08 defines the policy context within which audit observations and downstream attestations must be read, ensuring that raw misc never bypasses control lineage.

Operational maturity shows in how organizations treat misc not as miscellaneous debris but as typed evidence payloads, and uncertainty not as noise but as the honest accounting of measurement limits, sampling bias, or conflicting sources. When varchar misc carries operational semantics—review versus superseded, pre-release note, locale tag ja—the framework preserves those distinctions without collapsing them into undifferentiated text fields. When datetime misc spans years (2023-02-14 through 2025-06-08), retention and supersession analysis become first-class compliance tasks rather than ad hoc spreadsheet work. Identifier stability across audits, controls, and attestations is what makes such analysis possible: the same COND and CLAI and FRAM keys survive re-measurement, enabling period-over-period comparison of confidence, uncertainty, and underlying attr values. Taken together, attestation, attribute typing, categorical classification, entity identity, and the paired confidence–uncertainty calculus form the minimum viable grammar for evidence-backed governance—dense enough to automate, explicit enough to defend under scrutiny, and structured enough that a briefing note, regulator packet, or internal audit trail can cite specific values only where they illuminate a point, yet still reconstruct the full chain from observation to accepted claim.