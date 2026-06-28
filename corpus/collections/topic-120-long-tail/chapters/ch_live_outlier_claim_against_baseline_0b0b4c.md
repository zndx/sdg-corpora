---
chapter_id: ch_live_outlier_claim_against_baseline_0b0b4c
topic_id: 120
family: 02_observation_measurement
cited_terms: ['outlier_claim_against_baseline', 'outlier_claim_basic', 'outlier_claim_has_confidence']
model: engine-refine
---

An attribute constitutes a named property of an entity, typed to a specific data domain, and the attribute type governs how values are stored, validated, and compared across the system. In the outlier-claim model, attributes such as `confidence`, `dimension_kind`, `method`, and `recorded_at` are each bound to an XSD type—`xsd:decimal`, `xsd:string`, or `xsd:dateTime`—ensuring that every value assigned to a given attribute conforms to a single, predictable schema. This separation of attribute definition from attribute value is not merely structural; it permits the same attribute name to carry different semantic weight in different contexts. The attribute `confidence`, for instance, appears both as a decimal measure (values such as 0.904 or 0.504) and as a categorical label (values such as "high certainty", "expert verified", "manual review", "automated flag"), with the type system distinguishing the numeric precision of the former from the free-text nature of the latter.

**t_outlier_claim_has_confidence_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| CONF-0001 | confidence | xsd:decimal |
| CONF-0002 | dimension_kind | xsd:string |
| CONF-0003 | method | xsd:string |
| CONF-0004 | recorded_at | xsd:dateTime |
| CONF-0005 | uncertainty | xsd:decimal |
| CONF-0006 | unit | xsd:string |
| CONF-0007 | value | xsd:decimal |
| CONF-0008 | encoding | xsd:string |

**t_outlier_claim_has_confidence_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONF-0001 | CONF-0001 | CONF-0004 | 2023-06-24T17:04:07 |
| CONF-0002 | CONF-0002 | CONF-0004 | 2024-09-22T13:07:31 |
| CONF-0003 | CONF-0003 | CONF-0004 | 2023-12-24T05:49:34 |
| CONF-0004 | CONF-0004 | CONF-0004 | 2025-01-22T02:31:25 |
| CONF-0005 | CONF-0005 | CONF-0004 | 2023-07-07T20:57:08 |
| CONF-0006 | CONF-0006 | CONF-0004 | 2023-12-11T12:48:41 |
| CONF-0007 | CONF-0007 | CONF-0004 | 2024-11-29T10:12:10 |
| CONF-0008 | CONF-0008 | CONF-0004 | 2024-08-28T09:33:36 |

An entity is the identifiable thing to which attributes are attached, and the entity identifier serves as the stable key that ties all values back to a single conceptual object. Outlier claims are identified by prefixes that signal their provenance: claims originating from the baseline comparison layer carry identifiers such as `BASE-0001` through `BASE-0004`, while those arising from the basic claim registry are prefixed `CLAI-0001` through `CLAI-0004`, and confidence-tagged claims use the `CONF-` prefix. Within each entity, multiple attribute values may coexist. Entity `CLAI-0001`, for example, carries a confidence decimal of 0.504, a dimension kind of "Dimension Kind 01", an encoding of "Encoding 02", a recorded-at timestamp of `2024-03-15T03:40:40`, and a change rationale of "change rationale" alongside a locale code of "en". The entity identifier is the anchor that allows these disparate values to be retrieved as a coherent record.

**t_outlier_claim_against_baseline**

| id | outlier |
| --- | --- |
| BASE-0001 | provenance_hash_mismatch_0x |
| BASE-0002 | timestamp_gap_03 |
| BASE-0003 | provenance_hash_mismatch_0x |
| BASE-0004 | telemetry gap |
| BASE-0005 | spectral_line_550nm_anomaly |
| BASE-0006 | cpu_throttle_event_892 |

**t_outlier_claim_against_baseline_against**

| id | against |
| --- | --- |
| BASE-0001 | policy_rule_governance |
| BASE-0002 | sla_latency_threshold |
| BASE-0003 | regulatory_limit_max |
| BASE-0004 | policy_rule_governance |
| BASE-0005 | policy_rule_governance |
| BASE-0006 | baseline_model_v4 |

**t_outlier_claim_basic**

| id | outlier |
| --- | --- |
| CLAI-0001 | signal dropout |
| CLAI-0002 | schema_drift_v2 |
| CLAI-0003 | telemetry gap |
| CLAI-0004 | reagent failure |
| CLAI-0005 | sensor_drift_734 |
| CLAI-0006 | spectral_line_550nm_anomaly |

**t_outlier_claim_basic_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| CLAI-0001 | confidence | xsd:decimal |
| CLAI-0002 | dimension_kind | xsd:string |
| CLAI-0003 | method | xsd:string |
| CLAI-0004 | recorded_at | xsd:dateTime |
| CLAI-0005 | uncertainty | xsd:decimal |
| CLAI-0006 | unit | xsd:string |
| CLAI-0007 | value | xsd:decimal |
| CLAI-0008 | encoding | xsd:string |

**t_outlier_claim_basic_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CLAI-0001 | CLAI-0001 | CLAI-0004 | 2024-03-15T03:40:40 |
| CLAI-0002 | CLAI-0002 | CLAI-0004 | 2024-01-06T03:41:39 |
| CLAI-0003 | CLAI-0003 | CLAI-0004 | 2024-07-22T19:11:00 |
| CLAI-0004 | CLAI-0004 | CLAI-0004 | 2024-01-05T19:13:32 |
| CLAI-0005 | CLAI-0005 | CLAI-0004 | 2024-05-18T14:20:48 |
| CLAI-0006 | CLAI-0006 | CLAI-0004 | 2024-11-02T05:08:03 |

**t_outlier_claim_basic_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CLAI-0001 | CLAI-0001 | CLAI-0001 | 0.504 |
| CLAI-0002 | CLAI-0001 | CLAI-0005 | 834.64 |
| CLAI-0003 | CLAI-0001 | CLAI-0007 | 880.81 |
| CLAI-0004 | CLAI-0002 | CLAI-0001 | 0.093 |
| CLAI-0005 | CLAI-0002 | CLAI-0005 | 347.65 |
| CLAI-0006 | CLAI-0002 | CLAI-0007 | 472.12 |
| CLAI-0007 | CLAI-0003 | CLAI-0001 | 0.859 |
| CLAI-0008 | CLAI-0003 | CLAI-0005 | 734.07 |

**t_outlier_claim_basic_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CLAI-0001 | CLAI-0001 | CLAI-0002 | Dimension Kind 01 |
| CLAI-0002 | CLAI-0001 | CLAI-0008 | Encoding 02 |
| CLAI-0003 | CLAI-0001 | CLAI-0009 | change rationale |
| CLAI-0004 | CLAI-0001 | CLAI-0010 | en |
| CLAI-0005 | CLAI-0001 | CLAI-0003 | manual |
| CLAI-0006 | CLAI-0001 | CLAI-0006 | mg/L |
| CLAI-0007 | CLAI-0002 | CLAI-0002 | Dimension Kind 07 |
| CLAI-0008 | CLAI-0002 | CLAI-0008 | Encoding 08 |

**t_outlier_claim_has_confidence**

| id | outlier | confidence |
| --- | --- | --- |
| CONF-0001 | signal dropout | high certainty |
| CONF-0002 | latency_spike_alpha | expert verified |
| CONF-0003 | latency_spike_alpha | manual review |
| CONF-0004 | cpu_throttle_event | automated flag |
| CONF-0005 | thermal spike | sensor validated |
| CONF-0006 | schema_drift_column_count | probabilistic score |
| CONF-0007 | cpu_throttle_event | baseline deviation |
| CONF-0008 | packet loss burst | manual review |

**t_outlier_claim_has_confidence_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONF-0001 | CONF-0001 | CONF-0001 | 0.904 |
| CONF-0002 | CONF-0001 | CONF-0005 | 369.80 |
| CONF-0003 | CONF-0001 | CONF-0007 | 179.72 |
| CONF-0004 | CONF-0002 | CONF-0001 | 0.503 |
| CONF-0005 | CONF-0002 | CONF-0005 | 659.89 |
| CONF-0006 | CONF-0002 | CONF-0007 | 72.27 |
| CONF-0007 | CONF-0003 | CONF-0001 | 0.694 |
| CONF-0008 | CONF-0003 | CONF-0005 | 15.75 |

**t_outlier_claim_has_confidence_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONF-0001 | CONF-0001 | CONF-0002 | Dimension Kind 01 |
| CONF-0002 | CONF-0001 | CONF-0008 | Encoding 02 |
| CONF-0003 | CONF-0001 | CONF-0009 | change rationale |
| CONF-0004 | CONF-0001 | CONF-0010 | fr |
| CONF-0005 | CONF-0001 | CONF-0003 | manual |
| CONF-0006 | CONF-0001 | CONF-0006 | ratio |
| CONF-0007 | CONF-0002 | CONF-0002 | Dimension Kind 07 |
| CONF-0008 | CONF-0002 | CONF-0008 | Encoding 08 |

The misc column captures the actual value of an attribute for a given entity, and its content is shaped by the attribute type. Decimal attributes hold numeric measures—0.504, 834.64, 880.81 for entity `CLAI-0001`, or 0.904, 369.80, 179.72 for entity `CONF-0001`. String attributes hold human-readable descriptors such as "Dimension Kind 01", "Encoding 02", "change rationale", or locale codes like "en" and "fr". Datetime attributes hold ISO 8601 timestamps such as `2024-01-06T03:41:39` or `2025-01-22T02:31:25`. The misc column is thus a polymorphic value store: its semantics are determined not by the column itself but by the attr_id that references the attribute definition, and by the attr_type that governs the value's format. This design permits a single entity to carry values of fundamentally different types without requiring a fixed set of typed columns.

A subject is the entity that plays an active role in a relationship, and a target is the entity that is the object of that relationship. The relationship between an outlier claim and the policy or rule it is measured against is mediated through a junction record that carries a role. Outlier `BASE-0001` acts as a reviewer against target `BASE-0005`, while the same outlier also reviews target `BASE-0006`. Outlier `BASE-0005`, by contrast, assumes the role of contributor or observer against target `BASE-0001`. The role column—taking values such as "reviewer", "contributor", or "observer"—is the semantic glue that distinguishes one relationship from another even when the subject and target are identical. This triad of subject, target, and role is the minimal unit of relational meaning: it encodes not just that two entities are connected, but how they are connected.

The outlier itself—the phenomenon being reported—carries its own identity and classification. Baseline outliers include `provenance_hash_mismatch_0x`, `timestamp_gap_03`, and `telemetry gap`; basic claim outliers include `signal dropout`, `schema_drift_v2`, and `reagent failure`; confidence-tagged outliers include `latency_spike_alpha` and `cpu_throttle_event`. Each outlier is measured against a target such as `policy_rule_governance`, `sla_latency_threshold`, or `regulatory_limit_max`, and the relationship between the two is governed by a role. The system thus supports a rich, multi-dimensional model of outlier reporting: an outlier claim is identified, typed, attributed with values of various types, and placed in a relational context defined by subject, target, and role. Every piece of evidence—the numeric confidence score, the ISO timestamp, the dimension kind, the policy rule, the reviewer role—contributes to a single, queryable record of why an observation deviates from expectation and who is accountable for that deviation.

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