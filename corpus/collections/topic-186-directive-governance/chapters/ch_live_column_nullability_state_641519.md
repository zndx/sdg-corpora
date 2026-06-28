---
chapter_id: ch_live_column_nullability_state_641519
topic_id: 186
family: 07_long_tail
cited_terms: ['column_nullability_state', 'subclass_to_artifact', 'policy_classification_tier']
model: engine-refine
---

In any structured governance framework, the identifier serves as the immutable anchor for every tracked object, whether it is a column nullability state such as `STAT-0001`, an artifact like `ARTI-0001`, or a policy classification tier such as `TIER-0001`. These identifiers are not arbitrary; they encode the provenance and category of the entity they represent, enabling unambiguous cross-referencing across the system. An entity is the concrete instance to which attributes are bound—`STAT-0001`, for example, may represent a specific column's nullability state, while `STAT-0002` represents another. The distinction between identifier and entity is subtle but important: the identifier is the key by which the entity is addressed, and the entity is the conceptual thing that carries properties.

**t_column_nullability_state**

| id | column | nullability_state |
| --- | --- | --- |
| STAT-0001 | timestamp_utc | TIER-0003 |
| STAT-0002 | checksum_sha256 | TIER-0004 |
| STAT-0003 | latency_ms | TIER-0004 |
| STAT-0004 | timestamp_utc | TIER-0003 |
| STAT-0005 | timestamp_utc | TIER-0005 |
| STAT-0006 | checksum_sha256 | TIER-0004 |

**t_column_nullability_state_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| STAT-0001 | confidence | xsd:decimal |
| STAT-0002 | dimension_kind | xsd:string |
| STAT-0003 | method | xsd:string |
| STAT-0004 | recorded_at | xsd:dateTime |
| STAT-0005 | uncertainty | xsd:decimal |
| STAT-0006 | unit | xsd:string |
| STAT-0007 | value | xsd:decimal |
| STAT-0008 | encoding | xsd:string |

**t_column_nullability_state_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| STAT-0001 | STAT-0001 | STAT-0004 | 2024-12-29T19:38:29 |
| STAT-0002 | STAT-0002 | STAT-0004 | 2023-05-04T12:31:25 |
| STAT-0003 | STAT-0003 | STAT-0004 | 2023-11-12T04:10:53 |
| STAT-0004 | STAT-0004 | STAT-0004 | 2024-08-13T21:58:19 |
| STAT-0005 | STAT-0005 | STAT-0004 | 2023-08-07T04:27:45 |
| STAT-0006 | STAT-0006 | STAT-0004 | 2025-03-15T00:17:24 |

**t_column_nullability_state_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| STAT-0001 | STAT-0001 | STAT-0001 | 0.294 |
| STAT-0002 | STAT-0001 | STAT-0005 | 568.73 |
| STAT-0003 | STAT-0001 | STAT-0007 | 519.24 |
| STAT-0004 | STAT-0002 | STAT-0001 | 0.734 |
| STAT-0005 | STAT-0002 | STAT-0005 | 854.57 |
| STAT-0006 | STAT-0002 | STAT-0007 | 958.56 |
| STAT-0007 | STAT-0003 | STAT-0001 | 0.295 |
| STAT-0008 | STAT-0003 | STAT-0005 | 90.08 |

**t_column_nullability_state_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| STAT-0001 | STAT-0001 | STAT-0002 | Dimension Kind 01 |
| STAT-0002 | STAT-0001 | STAT-0008 | Encoding 02 |
| STAT-0003 | STAT-0001 | STAT-0009 | intake form |
| STAT-0004 | STAT-0001 | STAT-0010 | fr |
| STAT-0005 | STAT-0001 | STAT-0003 | automated |
| STAT-0006 | STAT-0001 | STAT-0006 | ratio |
| STAT-0007 | STAT-0002 | STAT-0002 | Dimension Kind 07 |
| STAT-0008 | STAT-0002 | STAT-0008 | Encoding 08 |

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

Attributes and their types form the descriptive layer that captures metadata about each entity. An attribute—such as `confidence`, `dimension_kind`, `method`, or `recorded_at`—is declared with a precise type from the XSD namespace: `xsd:decimal` for numeric precision, `xsd:string` for categorical labels, and `xsd:dateTime` for temporal markers. This typed attribute registry ensures that every value stored against an entity conforms to an expected schema. The actual values are materialized in dedicated value tables keyed by the entity and attribute identifiers. A decimal attribute might hold `0.294` or `568.73`, a varchar attribute might carry `Dimension Kind 01` or `intake form`, and a datetime attribute might record `2024-12-29T19:38:29`. The `misc` designation for these value columns reflects their heterogeneous nature: they store the actual data payloads that give attributes their meaning.

Artifact provenance is tracked through a parallel mechanism centered on the checksum and the license. Each artifact—whether it is a `checksum-manifest-v4`, `batch-processor-logs`, `genomic-sequence-17`, or `sensor-calibration-v2`—is assigned a checksum such as `c0ffee42` or `5e8f3c91` to verify integrity, and a license such as `BSD-3-Clause`, `CC-BY-4.0`, or `MIT` to govern its use. The checksum provides a cryptographic fingerprint that can be recomputed and compared to detect tampering or corruption, while the license establishes the legal and operational constraints under which the artifact may be distributed or modified. Together, these fields ensure that every software or data artifact in the system carries both its integrity signature and its usage terms.

**t_subclass_to_artifact**

| id | artifact | checksum | license |
| --- | --- | --- | --- |
| ARTI-0001 | checksum-manifest-v4 | c0ffee42 | BSD-3-Clause |
| ARTI-0002 | batch-processor-logs | 5e8f3c91 | CC-BY-4.0 |
| ARTI-0003 | genomic-sequence-17 | 1a4b6c2d | MIT |
| ARTI-0004 | sensor-calibration-v2 | 5e8f3c91 | CC-BY-4.0 |
| ARTI-0005 | model-weights-resnet50 | 5e8f3c91 | proprietary |
| ARTI-0006 | pipeline-output-stage3 | 9d2b7a16 | Apache-2.0 |
| ARTI-0007 | lab-reagent-batch-A7 | 7b14de08 | Apache-2.0 |
| ARTI-0008 | batch-processor-logs | 1a4b6c2d | BSD-3-Clause |

Policy governance introduces the concepts of subject, target, and role to model the relationships between policies and classification tiers. A policy—such as the `Medical Privacy Directive` or the `Financial SEC Reporting Rule`—is linked to a classification tier like `Tier 3 Critical` or `Level 2 Sensitive` through a relationship record that specifies the role of the policy within that linkage. The policy acts as the subject of the relationship, the classification tier as the target, and the role—`owner`, `observer`, `contributor`, or `reviewer`—defines the nature of the association. This triad enables fine-grained access control and accountability: an `owner` policy may dictate requirements, an `observer` policy may monitor compliance, a `contributor` may supply data, and a `reviewer` may validate adherence. The nullability state of columns is itself classified into tiers (`TIER-0003`, `TIER-0004`), which are in turn governed by these policy-tier relationships, creating a chain of governance from data column to policy mandate.

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