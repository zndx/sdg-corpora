---
chapter_id: ch_live_claim_supported_by_evidence_dbc279
topic_id: 92
family: 06_belief_structure
cited_terms: ['claim_supported_by_evidence', 'claim_with_belief_interval', 'classification_assigns_tier']
model: engine-refine
---

Evidence-backed governance rests on the ability to name, relate, and qualify assertions without ambiguity, and the identifier supplies that stable spine across every downstream operation. When a record such as EVID-0001 asserts that network bandwidth is saturated and is linked to classification tier TIER-0003 under the Data Classification Scheme, the identifier is what permits auditors, ingestion pipelines, and reconciliation jobs to treat that assertion as the same object whether it appears in a claim row, an attribute definition, or a typed value store. The same principle extends to belief-interval claims (INTE-0001 through INTE-0004) and tier-assignment records (TIER-0001 through TIER-0004): without durable keys, cross-table joins degenerate into brittle string matching, and compliance traceability—knowing precisely which evidentiary object supported which classification act—cannot be reconstructed after the fact.

**t_claim_supported_by_evidence**

| id | claim | supported_by_evidence |
| --- | --- | --- |
| EVID-0001 | Network bandwidth saturated | TIER-0003 |
| EVID-0002 | Temperature stability log | TIER-0001 |
| EVID-0003 | Temperature stability log | TIER-0003 |
| EVID-0004 | Patient dosage compliance | TIER-0003 |
| EVID-0005 | Patient dosage compliance | TIER-0003 |
| EVID-0006 | Network packet loss rate | TIER-0003 |

**t_claim_supported_by_evidence_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| EVID-0001 | confidence | xsd:decimal |
| EVID-0002 | dimension_kind | xsd:string |
| EVID-0003 | method | xsd:string |
| EVID-0004 | recorded_at | xsd:dateTime |
| EVID-0005 | uncertainty | xsd:decimal |
| EVID-0006 | unit | xsd:string |
| EVID-0007 | value | xsd:decimal |
| EVID-0008 | encoding | xsd:string |

**t_claim_with_belief_interval**

| id | claim |
| --- | --- |
| INTE-0001 | Server latency threshold breach |
| INTE-0002 | Server latency threshold breach |
| INTE-0003 | Encryption key rotated |
| INTE-0004 | API response time degraded |
| INTE-0005 | Emissions compliance record |
| INTE-0006 | Server CPU exceeds threshold |

**t_claim_with_belief_interval_belief_interval**

| id | belief_interval |
| --- | --- |
| INTE-0001 | low medium high tier |
| INTE-0002 | 0.75 to 0.88 interval |
| INTE-0003 | 0.75 to 0.88 interval |
| INTE-0004 | plus minus two units |
| INTE-0005 | 70 to 85 percent range |
| INTE-0006 | medium certainty window |
| INTE-0007 | 0.75 to 0.88 interval |
| INTE-0008 | 0.8 to 0.95 certainty |

Entity and attr partition what is being described from how it is described. The entity anchors a concrete evidentiary or claim instance—EVID-0001 as a distinct evidentiary body, or INTE-0004 as a distinct latency-threshold assertion—while attr names the facet under measurement: confidence as a decimal belief score, dimension_kind as a categorical descriptor, method as a procedural label, or recorded_at as a temporal stamp. Attr type enforces interpretive discipline at the boundary where raw payloads enter the model: confidence values such as 0.768 and 0.833 are admitted only under xsd:decimal, dimension_kind and method under xsd:string, and recorded_at under xsd:dateTime, so that values like 2024-08-09T04:01:38 and 2024-09-01T03:06:06 remain comparable and machine-validatable rather than free-text annotations. Misc carries the instantiated value itself—the confidence coefficient, the string "Dimension Kind 01", the locale code "de", the nightly summary method label—stored in type-appropriate tables so that semantic intent (what the attribute means) remains separable from syntactic representation (how the value is serialized).

Subject, target, and role govern directed relationships in which neither endpoint is sufficient on its own. A belief-interval association does not merely pair INTE-0004 with INTE-0002; it specifies that INTE-0004 is the subject of the linkage and INTE-0002 the target, with role reviewer assigning accountability for interpretation rather than ownership of the underlying claim. The same pattern appears when INTE-0001 is linked to INTE-0004 under role reviewer, or when INTE-0001 is linked to INTE-0005 under role owner—distinctions that matter in escalation workflows, sign-off chains, and segregation-of-duties reviews, because a reviewer and an owner carry different evidentiary weight when a belief interval such as "0.75 to 0.88 interval" or "low medium high tier" is disputed. Encoding subject and target explicitly prevents symmetric readings that would collapse governance intent: the claim about server latency threshold breach (INTE-0001) is not interchangeable with the interval descriptor (INTE-0002) merely because both share a table row.

**t_claim_with_belief_interval__belief_interval**

| id | claim_id | belief_interval_id | role |
| --- | --- | --- | --- |
| INTE-0001 | INTE-0004 | INTE-0005 | reviewer |
| INTE-0002 | INTE-0001 | INTE-0002 | owner |
| INTE-0003 | INTE-0001 | INTE-0004 | reviewer |
| INTE-0004 | INTE-0004 | INTE-0002 | reviewer |
| INTE-0005 | INTE-0006 | INTE-0003 | reviewer |
| INTE-0006 | INTE-0006 | INTE-0008 | reviewer |
| INTE-0007 | INTE-0002 | INTE-0001 | contributor |
| INTE-0008 | INTE-0001 | INTE-0007 | reviewer |

Loglevel and retrycount sit at the operational seam where policy meets runtime behaviour. Classification assignments that map Governance Registry, Security Baseline, Data Classification Scheme, and Data Lineage Map to evidentiary targets carry loglevel settings—info for TIER-0001, error for TIER-0002, debug for TIER-0003 and TIER-0004—that calibrate how aggressively the platform surfaces assignment outcomes during ingestion, reconciliation, and periodic audit sweeps. Retrycount records the persistence cost of achieving a consistent tier binding: 379 attempts for the Governance Registry path, 176 for Security Baseline, 195 and 460 respectively for the two Data-scheme mappings, figures that inform capacity planning, alert thresholds, and the decision to treat a classification pipeline as healthy or degraded. Together, loglevel and retrycount translate abstract compliance rules into observable telemetry; without them, a failed tier assignment to EVID-0005 or EVID-0006 would leave no graded signal and no quantitative basis for intervention.

In practice, these constructs compose a closed evidentiary loop. An identifier ties a claim—whether "Patient dosage compliance" (EVID-0004) or "API response time degraded" (INTE-0004)—to typed attributes and, where applicable, to a supporting tier (TIER-0003 for multiple EVID records, TIER-0001 for temperature stability evidence). Entity–attr–misc triples materialize the claim's measurable footprint: a confidence of 0.833 on EVID-0002, a dimension_kind of "Dimension Kind 01", a method of "nightly summary", and a recorded_at spanning 2023-12-19 through 2024-10-20. Subject–target–role edges attach interpretive bands—numeric intervals, ordinal tiers, or tolerance windows such as "plus minus two units"—to the claims they qualify. Loglevel and retrycount on the tier-assignment plane ensure that when classifications are applied, the organisation can both verify what was asserted and demonstrate how reliably the asserting machinery performed. That integration is why these fields are not incidental metadata: they are the minimum vocabulary for defensible, queryable, and operationally accountable compliance evidence.

**t_claim_supported_by_evidence_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVID-0001 | EVID-0001 | EVID-0004 | 2024-08-09T04:01:38 |
| EVID-0002 | EVID-0002 | EVID-0004 | 2023-12-19T17:45:47 |
| EVID-0003 | EVID-0003 | EVID-0004 | 2024-10-20T14:55:58 |
| EVID-0004 | EVID-0004 | EVID-0004 | 2024-09-01T03:06:06 |
| EVID-0005 | EVID-0005 | EVID-0004 | 2024-01-23T04:47:13 |
| EVID-0006 | EVID-0006 | EVID-0004 | 2024-03-02T02:15:09 |

**t_claim_supported_by_evidence_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVID-0001 | EVID-0001 | EVID-0001 | 0.768 |
| EVID-0002 | EVID-0001 | EVID-0005 | 631.25 |
| EVID-0003 | EVID-0001 | EVID-0007 | 135.16 |
| EVID-0004 | EVID-0002 | EVID-0001 | 0.833 |
| EVID-0005 | EVID-0002 | EVID-0005 | 5.88 |
| EVID-0006 | EVID-0002 | EVID-0007 | 87.07 |
| EVID-0007 | EVID-0003 | EVID-0001 | 0.936 |
| EVID-0008 | EVID-0003 | EVID-0005 | 975.53 |

**t_claim_supported_by_evidence_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVID-0001 | EVID-0001 | EVID-0002 | Dimension Kind 01 |
| EVID-0002 | EVID-0001 | EVID-0008 | Encoding 02 |
| EVID-0003 | EVID-0001 | EVID-0009 | nightly summary |
| EVID-0004 | EVID-0001 | EVID-0010 | de |
| EVID-0005 | EVID-0001 | EVID-0003 | automated |
| EVID-0006 | EVID-0001 | EVID-0006 | ms |
| EVID-0007 | EVID-0002 | EVID-0002 | Dimension Kind 07 |
| EVID-0008 | EVID-0002 | EVID-0008 | Encoding 08 |

**t_classification_assigns_tier**

| id | classification | assigns_tier | log_level | retry_count |
| --- | --- | --- | --- | --- |
| TIER-0001 | Governance Registry | EVID-0005 | info | 379 |
| TIER-0002 | Security Baseline | EVID-0002 | error | 176 |
| TIER-0003 | Data Classification Scheme | EVID-0006 | debug | 195 |
| TIER-0004 | Data Lineage Map | EVID-0006 | debug | 460 |
| TIER-0005 | Metadata Schema | EVID-0002 | critical | 23 |
| TIER-0006 | Risk Assessment Matrix | EVID-0006 | debug | 281 |