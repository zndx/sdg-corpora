---
chapter_id: ch_live_designative_with_naming_authority_361452
topic_id: 7
family: 01_foundation
cited_terms: ['designative_with_naming_authority', 'policy_classification_tier', 'outlier_claim_against_baseline']
model: engine-refine
---

In a formal governance architecture, the assignment of designative identifiers to named entities requires both an authoritative provenance chain and a cryptographic integrity mechanism. Each designative—such as `OGC-API-Feat`, `DCAT-AP-3.0`, `HAN-0092`, or `RFC-7578`—is registered under a unique identifier (`AUTH-0001` through `AUTH-0004`) and attributed to a designated naming authority, itself referenced by a tier identifier like `TIER-0001` or `TIER-0005`. The integrity of each registration is enforced through a `checksum_algo` field that records the algorithm applied at time of assignment: `md5` for the OGC and DCAT entries, `blake2b` for `HAN-0092`, and `sha1` for `RFC-7578`. These algorithmic choices are not arbitrary; they reflect a tiered security posture in which legacy registries retain `md5` or `sha1` while newer or higher-assurance designatives migrate to `blake2b`. Supplementary classification codes—`C-07`, `E-21`, `D-33`—provide an orthogonal indexing layer, enabling cross-referencing against external taxonomies without conflating them with the primary identifier space.

**t_designative_with_naming_authority**

| id | designative | assigned_by | checksum_algo | code |
| --- | --- | --- | --- | --- |
| AUTH-0001 | OGC-API-Feat | TIER-0005 | md5 | C-07 |
| AUTH-0002 | DCAT-AP-3.0 | TIER-0004 | md5 | E-21 |
| AUTH-0003 | HAN-0092 | TIER-0003 | blake2b | C-07 |
| AUTH-0004 | RFC-7578 | TIER-0001 | sha1 | D-33 |

The naming authorities themselves are classified by policy tier, each tier carrying both a descriptive policy label and a sensitivity classification. `TIER-0001` and `TIER-0004` both map to the "Medical Privacy Directive" policy, yet they diverge in their sensitivity posture: `TIER-0001` is classified as "Tier 3 Critical" while `TIER-0004` carries "Restricted Access." `TIER-0003` enforces the "Environmental EPA Emissions Standard" at "Level 2 Sensitive," and `TIER-0002` governs "Financial SEC Reporting Rule" under "Restricted Access." This two-dimensional classification—policy domain intersected with sensitivity level—ensures that a naming authority's operational constraints are determined not merely by its regulatory provenance but by the classification rigor applied to its outputs.

Relationships between policy tiers and their sensitivity classifications are mediated through a junction table that introduces a `role` attribute to each association. In this model, a policy identifier (the `subject`) and a classification-tier identifier (the `target`) are linked with an explicit functional role—`owner`, `observer`, `contributor`, or `reviewer`—that defines the nature of the association. For instance, `TIER-0002` (Financial SEC Reporting Rule) is linked to `TIER-0002` (Restricted Access) with the role of `owner`, while the same policy is linked to `TIER-0003` (Level 2 Sensitive) with the role of `observer`. This role-bearing relationship model permits a single policy to participate in multiple classification contexts simultaneously, each with a distinct governance posture, rather than forcing a monolithic classification assignment.

**t_policy_classification_tier**

| id | policy |
| --- | --- |
| TIER-0001 | Medical Privacy Directive |
| TIER-0002 | Financial SEC Reporting Rule |
| TIER-0003 | Environmental EPA Emissions Standard |
| TIER-0004 | Medical Privacy Directive |
| TIER-0005 | Open Source License Policy |
| TIER-0006 | National Cybersecurity Strategy |

**t_policy_classification_tier_at_classification_tier**

| id | at_classification_tier |
| --- | --- |
| TIER-0001 | Tier 3 Critical |
| TIER-0002 | Restricted Access |
| TIER-0003 | Level 2 Sensitive |
| TIER-0004 | Restricted Access |
| TIER-0005 | Restricted Access |
| TIER-0006 | Restricted Access |
| TIER-0007 | Level 4 Sensitive |

**t_policy_classification_tier__at_classification_tier**

| id | policy_id | at_classification_tier_id | role |
| --- | --- | --- | --- |
| TIER-0001 | TIER-0002 | TIER-0002 | owner |
| TIER-0002 | TIER-0002 | TIER-0003 | observer |
| TIER-0003 | TIER-0006 | TIER-0004 | contributor |
| TIER-0004 | TIER-0004 | TIER-0005 | reviewer |
| TIER-0005 | TIER-0001 | TIER-0003 | observer |
| TIER-0006 | TIER-0006 | TIER-0003 | owner |
| TIER-0007 | TIER-0004 | TIER-0002 | owner |
| TIER-0008 | TIER-0005 | TIER-0001 | owner |

A parallel structure governs outlier claims against baselines. Each outlier—identified by a baseline identifier such as `BASE-0001` through `BASE-0004` and described by a claim like `telemetry_log_error_404`, `pH_reading_11_2_deviation`, or `schema_drift_column_count`—is evaluated against a reference standard. The reference standard itself is a distinct entity: `policy_rule_governance`, `sla_latency_threshold`, or `regulatory_limit_max`. The relationship between an outlier and its baseline is again mediated by a junction table that assigns a `role` to the pairing. `BASE-0001` appears as an outlier against `BASE-0005` with the role of `reviewer`, and also against `BASE-0006` with the same role, demonstrating that a single outlier claim can be assessed against multiple baselines under identical governance functions. Conversely, `BASE-0005` serves as an outlier against `BASE-0001` with the role of `contributor`, inverting the relationship and illustrating that the subject-target pairing is directional: the same pair of identifiers can participate in the relationship in either orientation, each with its own role semantics.

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