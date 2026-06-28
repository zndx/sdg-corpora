---
chapter_id: ch_live_reference_subclass_a425e3
topic_id: 7
family: 01_foundation
cited_terms: ['reference_subclass', 'outlier_claim_against_baseline', 'plausibility_function_for']
model: engine-refine
---

An identifier serves as the immutable anchor of any structured record, a unique key that survives across joins, lookups, and temporal evolution. In the reference subsystem, identifiers such as REFE-0001 through REFE-0004 designate discrete citation entries, each carrying a human-readable label—Reference 01, Reference 02—and a directional pointer to a target resource, exemplified by Points To 01 and Points To 03. Outlier claims follow the same convention, with identifiers like BASE-0001 and BASE-0004 anchoring observations ranging from telemetry_log_error_404 to schema_drift_column_count. Plausibility functions are similarly keyed, FUNC-0001 through FUNC-0004, each associated with an assessment such as firmware_version_mismatch or weak_indication. The identifier is never the content itself; it is the handle by which content is retrieved, correlated, and audited.

**t_plausibility_function_for**

| id | plausibility | plausibility_for_claim |
| --- | --- | --- |
| FUNC-0001 | firmware_version_mismatch | BASE-0006 |
| FUNC-0002 | disputed_rating | BASE-0003 |
| FUNC-0003 | weak_indication | BASE-0001 |
| FUNC-0004 | model_convergence_failure | BASE-0006 |
| FUNC-0005 | network_latency_spike | BASE-0004 |
| FUNC-0006 | authentication_token_expired | BASE-0003 |
| FUNC-0007 | packet_loss_rate_high | BASE-0002 |

Attributes and their types form the typed property layer that gives substance to every entity. An attribute name—confidence, dimension_kind, method, recorded_at—declares what dimension of the entity is being measured, while the attribute type constrains the shape of admissible values to xsd:decimal, xsd:string, or xsd:dateTime. This separation of name from type enables a single entity to carry heterogeneous properties without schema drift. A plausibility function identified as FUNC-0001, for instance, holds a decimal attribute valued at 0.286 and another at 84.30, a string attribute reading Dimension Kind 01, and a datetime attribute stamped 2023-05-06T07:18:55. The same attribute name recorded_at, typed as xsd:dateTime, recurs across FUNC-0001 through FUNC-0004, each carrying a distinct timestamp—2023-03-14T16:18:20, 2024-05-13T15:52:44, 2025-06-06T01:40:51—reflecting the moment each function was captured or last modified.

**t_plausibility_function_for_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| FUNC-0001 | confidence | xsd:decimal |
| FUNC-0002 | dimension_kind | xsd:string |
| FUNC-0003 | method | xsd:string |
| FUNC-0004 | recorded_at | xsd:dateTime |
| FUNC-0005 | uncertainty | xsd:decimal |
| FUNC-0006 | unit | xsd:string |
| FUNC-0007 | value | xsd:decimal |
| FUNC-0008 | encoding | xsd:string |

**t_plausibility_function_for_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| FUNC-0001 | FUNC-0001 | FUNC-0004 | 2023-05-06T07:18:55 |
| FUNC-0002 | FUNC-0002 | FUNC-0004 | 2023-03-14T16:18:20 |
| FUNC-0003 | FUNC-0003 | FUNC-0004 | 2024-05-13T15:52:44 |
| FUNC-0004 | FUNC-0004 | FUNC-0004 | 2025-06-06T01:40:51 |
| FUNC-0005 | FUNC-0005 | FUNC-0004 | 2023-05-21T17:57:56 |
| FUNC-0006 | FUNC-0006 | FUNC-0004 | 2024-10-18T22:54:00 |
| FUNC-0007 | FUNC-0007 | FUNC-0004 | 2023-11-29T06:24:08 |

**t_plausibility_function_for_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| FUNC-0001 | FUNC-0001 | FUNC-0001 | 0.286 |
| FUNC-0002 | FUNC-0001 | FUNC-0005 | 84.30 |
| FUNC-0003 | FUNC-0001 | FUNC-0007 | 878.30 |
| FUNC-0004 | FUNC-0002 | FUNC-0001 | 0.033 |
| FUNC-0005 | FUNC-0002 | FUNC-0005 | 492.02 |
| FUNC-0006 | FUNC-0002 | FUNC-0007 | 356.58 |
| FUNC-0007 | FUNC-0003 | FUNC-0001 | 0.482 |
| FUNC-0008 | FUNC-0003 | FUNC-0005 | 926.97 |

**t_plausibility_function_for_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| FUNC-0001 | FUNC-0001 | FUNC-0002 | Dimension Kind 01 |
| FUNC-0002 | FUNC-0001 | FUNC-0008 | Encoding 02 |
| FUNC-0003 | FUNC-0001 | FUNC-0009 | pre-release note |
| FUNC-0004 | FUNC-0001 | FUNC-0010 | en |
| FUNC-0005 | FUNC-0001 | FUNC-0003 | manual |
| FUNC-0006 | FUNC-0001 | FUNC-0006 | kg |
| FUNC-0007 | FUNC-0002 | FUNC-0002 | Dimension Kind 07 |
| FUNC-0008 | FUNC-0002 | FUNC-0008 | Encoding 08 |

An entity is the unit of description to which attributes bind. In this framework, entities are not monolithic rows but distributed collections of typed values indexed by a composite of entity identifier and attribute identifier. The decimal value table, the datetime value table, and the varchar value table each store a fragment of the same entity's profile, and the entity_id column—FUNC-0001 appearing across all three—reconstitutes the whole at query time. This normalization is deliberate: it permits heterogeneous value types to coexist under a single entity without forcing every column to accommodate every data shape, and it preserves referential integrity between the attribute definition and its concrete instantiation.

The namespace column provides the contextual scope within which an identifier or reference derives meaning. A reference bearing namespace provenance signals that its authority derives from origin tracking; one bearing lineage indicates a chain of derivation; governance marks a reference subject to policy oversight. These namespaces are not labels applied after the fact but structural constraints that govern how a reference may be resolved, who may assert it, and under what audit trail it persists.

**t_reference_subclass**

| id | reference | points_to | issued_date | namespace |
| --- | --- | --- | --- | --- |
| REFE-0001 | Reference 01 | Points To 01 | 2024-02-21 | provenance |
| REFE-0002 | Reference 02 | Points To 02 | 2024-12-07 | lineage |
| REFE-0003 | Reference 03 | Points To 03 | 2025-05-30 | governance |
| REFE-0004 | Reference 04 | Points To 04 | 2023-09-26 | lineage |
| REFE-0005 | Reference 05 | Points To 05 | 2024-10-25 | provenance |
| REFE-0006 | Reference 06 | Points To 06 | 2023-04-21 | catalog |

Subject and target, mediated by role, encode the relational fabric of the system. A subject is the entity that initiates or holds a claim; a target is the entity against which that claim is evaluated. The join table t_outlier_claim_against_baseline__against materializes these relationships explicitly: BASE-0001 appears as a subject paired with BASE-0005 and BASE-0006 as targets, each association carrying a role—reviewer, contributor, or observer—that qualifies the nature of the linkage. The same subject BASE-0005 relates to BASE-0001 under both contributor and observer roles, demonstrating that a single entity can occupy multiple relational positions simultaneously, each role imposing distinct permissions and provenance expectations.

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

The issued_date column anchors temporal provenance to every reference record. Dates such as 2024-02-21, 2024-12-07, 2025-05-30, and 2023-09-26 establish a chronological ordering that governs version resolution, expiration logic, and audit compliance. Unlike the attribute-level recorded_at timestamps that capture when a specific property was set, issued_date marks the authoritative publication moment of the reference itself, serving as the canonical point from which validity windows and dependency chains are computed.