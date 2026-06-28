---
chapter_id: ch_live_evidence_correlated_with_92a000
topic_id: 187
family: 07_long_tail
cited_terms: ['evidence_correlated_with', 'evidence_for_audit', 'evidence_independent_of']
model: engine-refine
---

Evidence in compliance and audit contexts is never a monolithic datum but rather a structured constellation of identifiers, attributes, and relational links that together establish provenance and trustworthiness. Each piece of evidence—whether a `NetworkPacketCapture_0xFF`, a `compliance certification record`, or a `batch processing checksum`—is assigned a unique identifier such as `AUDI-0001` or `AUDI-0002`, which serves as the immutable anchor for all subsequent metadata. These identifiers propagate across the evidence lifecycle: they appear as entity references when attribute values are attached, as subject keys when evidence is linked to other evidence, and as target references when dependency relationships are recorded. The identifier is the single point of reference that allows an auditor to reconstruct the full provenance chain of any claim, from raw capture through classification to final assessment.

**t_evidence_for_audit**

| id | evidence |
| --- | --- |
| AUDI-0001 | NetworkPacketCapture_0xFF |
| AUDI-0002 | audit log entry |
| AUDI-0003 | compliance certification record |
| AUDI-0004 | batch processing checksum |
| AUDI-0005 | sensor calibration trace |
| AUDI-0006 | NetworkPacketCapture_0xFF |

**t_evidence_for_audit_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| AUDI-0001 | confidence | xsd:decimal |
| AUDI-0002 | dimension_kind | xsd:string |
| AUDI-0003 | method | xsd:string |
| AUDI-0004 | recorded_at | xsd:dateTime |
| AUDI-0005 | uncertainty | xsd:decimal |
| AUDI-0006 | unit | xsd:string |
| AUDI-0007 | value | xsd:decimal |
| AUDI-0008 | encoding | xsd:string |

**t_evidence_for_audit_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AUDI-0001 | AUDI-0001 | AUDI-0004 | 2024-10-15T21:07:57 |
| AUDI-0002 | AUDI-0002 | AUDI-0004 | 2024-11-22T11:38:19 |
| AUDI-0003 | AUDI-0003 | AUDI-0004 | 2023-06-03T22:32:06 |
| AUDI-0004 | AUDI-0004 | AUDI-0004 | 2024-07-15T05:43:09 |
| AUDI-0005 | AUDI-0005 | AUDI-0004 | 2024-03-30T03:15:54 |
| AUDI-0006 | AUDI-0006 | AUDI-0004 | 2024-06-18T04:52:41 |

**t_evidence_for_audit_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AUDI-0001 | AUDI-0001 | AUDI-0001 | 0.978 |
| AUDI-0002 | AUDI-0001 | AUDI-0005 | 590.71 |
| AUDI-0003 | AUDI-0001 | AUDI-0007 | 212.01 |
| AUDI-0004 | AUDI-0002 | AUDI-0001 | 0.546 |
| AUDI-0005 | AUDI-0002 | AUDI-0005 | 882.77 |
| AUDI-0006 | AUDI-0002 | AUDI-0007 | 90.06 |
| AUDI-0007 | AUDI-0003 | AUDI-0001 | 0.051 |
| AUDI-0008 | AUDI-0003 | AUDI-0005 | 692.35 |

**t_evidence_for_audit_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AUDI-0001 | AUDI-0001 | AUDI-0002 | Dimension Kind 01 |
| AUDI-0002 | AUDI-0001 | AUDI-0008 | Encoding 02 |
| AUDI-0003 | AUDI-0001 | AUDI-0009 | intake form |
| AUDI-0004 | AUDI-0001 | AUDI-0010 | fr |
| AUDI-0005 | AUDI-0001 | AUDI-0003 | automated |
| AUDI-0006 | AUDI-0001 | AUDI-0006 | count |
| AUDI-0007 | AUDI-0002 | AUDI-0002 | Dimension Kind 07 |
| AUDI-0008 | AUDI-0002 | AUDI-0008 | Encoding 08 |

**t_evidence_independent_of**

| id | evidence |
| --- | --- |
| INDE-0001 | ComplianceManifest_v3 |
| INDE-0002 | environmental monitoring report |
| INDE-0003 | CalibrationLog_Nov2023 |
| INDE-0004 | AuditTrail_20231015 |
| INDE-0005 | telemetry snapshot |
| INDE-0006 | audit log entry |
| INDE-0007 | environmental monitoring report |

**t_evidence_independent_of_evidence_independent_of**

| id | evidence_independent_of |
| --- | --- |
| INDE-0001 | data warehouse |
| INDE-0002 | labeling schema |
| INDE-0003 | measurement device |
| INDE-0004 | data warehouse |
| INDE-0005 | partition strategy |
| INDE-0006 | git repository |
| INDE-0007 | monitoring dashboard |
| INDE-0008 | labeling schema |

Attributes and their types form the descriptive layer that gives evidence its interpretive context. An attribute—such as `confidence`, `dimension_kind`, `method`, or `recorded_at`—is a named property whose semantics are governed by a type declaration drawn from the XML Schema Definition namespace: `xsd:decimal` for numeric measures, `xsd:string` for categorical labels, and `xsd:dateTime` for temporal stamps. This type discipline is not merely syntactic; it determines how values are stored, compared, and aggregated. A confidence score of `0.978` is a decimal that can be thresholded or weighted in a risk calculation, while a dimension kind of `Dimension Kind 01` is a string that classifies the evidence along a taxonomy. The recorded-at timestamp `2024-10-15T21:07:57` anchors the evidence to a precise moment, enabling temporal correlation across audit trails. Because attributes are decoupled from their values, the same entity—say, `AUDI-0001`—can carry multiple attribute-value pairs across different value tables: a decimal confidence of `0.978`, a string encoding of `Encoding 02`, and a datetime stamp, each stored in its own typed column family.

The entity concept is the linchpin that binds attributes to evidence. An entity is not a separate record but rather the evidence itself, viewed as the subject of attribution. When a value table references `entity_id: AUDI-0001`, it is saying that the attribute value—whether `0.978`, `Dimension Kind 01`, or `2024-10-15T21:07:57`—belongs to the evidence item identified by `AUDI-0001`. This design allows a single piece of evidence to accumulate a rich, heterogeneous set of properties without requiring a fixed schema: new attribute types can be introduced by adding rows to the attribute definition table, and their values flow into the appropriate typed value table. The entity is thus a dynamic container, its shape determined by the attributes that have been assigned to it rather than by a rigid table structure.

Confidence and uncertainty quantify the epistemic state of evidence, transforming it from a binary assertion into a graded claim. Confidence values such as `0.052`, `0.146`, `0.474`, and `0.138` represent the degree of belief that a piece of evidence supports a given conclusion, while uncertainty values—`125.66`, `477.82`, `366.82`, `430.96`—capture the magnitude of residual doubt. These are not abstract numbers; they are operational parameters that feed into risk models, audit scoring engines, and compliance dashboards. A piece of evidence with a confidence of `0.474` and an uncertainty of `366.82` carries substantially different weight than one with `0.052` confidence and `125.66` uncertainty, and the distinction matters when evidence items are aggregated or when thresholds determine whether an audit finding is elevated. The value column—holding measurements like `192.81`, `84.19`, `641.37`, `8.37`—provides the raw quantitative substrate from which confidence and uncertainty are derived or independently assessed.

**fact_evidence**

| id | evidence_correlated_with_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| WITH-0001 | WITH-0005 | 0.052 | 125.66 | 192.81 |
| WITH-0002 | WITH-0003 | 0.146 | 477.82 | 84.19 |
| WITH-0003 | WITH-0006 | 0.474 | 366.82 | 641.37 |
| WITH-0004 | WITH-0002 | 0.138 | 430.96 | 8.37 |

Evidence does not exist in isolation; it is correlated with, dependent upon, and attributed to other evidence through a network of subject-target-role relationships. The `evidence_correlated_with` construct links one evidence item to another, creating a graph of interdependencies. In the correlation dimension, each link is classified by a category—`Evidence Correlated With Category 01` through `04`—and labeled for human readability, such as `Evidence Correlated With Label 01`. This categorization is essential for understanding the nature of the dependency: is the correlation one of derivation, validation, contradiction, or supplementation? The independent-of relationship goes further, establishing that certain evidence—`ComplianceManifest_v3`, `environmental monitoring report`, `CalibrationLog_Nov2023`, `AuditTrail_20231015`—stands independently of foundational systems like a `data warehouse`, a `labeling schema`, or a `measurement device`. The junction table that materializes these relationships introduces the role concept: the same evidence item can serve as a `contributor`, a `reviewer`, or an `observer` depending on the relationship context. When `INDE-0003` appears as a subject linked to `INDE-0008` with the role of `reviewer`, it signals that the calibration log is being evaluated against the data warehouse, not merely derived from it. This role-aware linking transforms a flat list of evidence items into a structured argument graph, where the provenance of each claim can be traced through its contributors, reviewers, and observers.

**dim_evidence_correlated_with**

| id | evidence_correlated_with_label | evidence_correlated_with_category |
| --- | --- | --- |
| WITH-0001 | Evidence Correlated With Label 01 | Evidence Correlated With Category 01 |
| WITH-0002 | Evidence Correlated With Label 02 | Evidence Correlated With Category 02 |
| WITH-0003 | Evidence Correlated With Label 03 | Evidence Correlated With Category 03 |
| WITH-0004 | Evidence Correlated With Label 04 | Evidence Correlated With Category 04 |
| WITH-0005 | Evidence Correlated With Label 05 | Evidence Correlated With Category 05 |
| WITH-0006 | Evidence Correlated With Label 06 | Evidence Correlated With Category 06 |
| WITH-0007 | Evidence Correlated With Label 07 | Evidence Correlated With Category 07 |

**t_evidence_independent_of__evidence_independent_of**

| id | evidence_id | evidence_independent_of_id | role |
| --- | --- | --- | --- |
| INDE-0001 | INDE-0005 | INDE-0008 | contributor |
| INDE-0002 | INDE-0003 | INDE-0008 | reviewer |
| INDE-0003 | INDE-0003 | INDE-0008 | observer |
| INDE-0004 | INDE-0002 | INDE-0005 | reviewer |
| INDE-0005 | INDE-0002 | INDE-0003 | observer |
| INDE-0006 | INDE-0006 | INDE-0001 | contributor |
| INDE-0007 | INDE-0001 | INDE-0005 | contributor |
| INDE-0008 | INDE-0002 | INDE-0005 | contributor |