---
chapter_id: ch_live_audit_for_period_dbfec4
topic_id: 26
family: 03_directive_governance
cited_terms: ['audit_for_period', 'verification_targets_artifact', 'evidence_at_quality_tier']
model: engine-refine
---

In compliance and assurance systems, the stable naming of records is the precondition for any defensible chain of custody. An identifier is the durable handle by which a regulator, auditor, or automated control can retrieve the same object across time, systems, and review cycles without ambiguity. Prefix conventions such as PERI-0001 for period-scoped audit activities, ARTI-0002 for verification artifacts, and TIER-0003 for evidence graded at a quality tier signal domain lineage at a glance and prevent the conflation of superficially similar records. When PERI-0001 is referenced both as an audit instance carrying a Data Privacy Impact Assessment and, in a separate association row, as the subject of a scoped engagement, the identifier remains constant while the semantic frame shifts; that separation is what permits longitudinal traceability without collapsing distinct governance facts into a single undifferentiated label.

**t_audit_for_period**

| id | audit |
| --- | --- |
| PERI-0001 | Data Privacy Impact Assessment |
| PERI-0002 | Data Privacy Impact Assessment |
| PERI-0003 | Annual-2022 |
| PERI-0004 | GDPR Compliance Review |
| PERI-0005 | FINRA Rule 4511 Examination |
| PERI-0006 | Q4-2023 |
| PERI-0007 | FINRA Rule 4511 Examination |
| PERI-0008 | ISO 27001 Certification |

**t_audit_for_period_for_audit_period**

| id | for_audit_period |
| --- | --- |
| PERI-0001 | HIPAA Security Audit |
| PERI-0002 | SOC2 Type II |
| PERI-0003 | HIPAA Security Audit |
| PERI-0004 | ITIL Service Audit |
| PERI-0005 | HIPAA Security Audit |
| PERI-0006 | Q4-2023 |

**t_evidence_at_quality_tier**

| id | evidence | at_quality_tier |
| --- | --- | --- |
| TIER-0001 | network packets | PERI-0004 |
| TIER-0002 | audit trails | PERI-0001 |
| TIER-0003 | network packets | PERI-0004 |
| TIER-0004 | inspection photos | PERI-0005 |
| TIER-0005 | telemetry streams | PERI-0001 |
| TIER-0006 | field measurements | PERI-0005 |
| TIER-0007 | device firmware | PERI-0004 |
| TIER-0008 | audit trails | PERI-0008 |

Entity denotes the thing to which descriptive facts attach, distinct from the facts themselves and from the relationships in which the thing may participate. In evidence management, the entity is the graded evidence record—network packets at TIER-0001, audit trails at TIER-0002—not the packet capture file in isolation nor the audit program that commissioned its collection. Attributes name the measurable or declarative properties that qualify that entity: confidence as a quantitative score, dimension_kind as a categorical descriptor, method as the provenance of acquisition, recorded_at as the temporal anchor of registration. Attribute type governs interpretation and validation at the boundary of storage and analysis; declaring confidence as xsd:decimal and recorded_at as xsd:dateTime establishes parseable contracts so that downstream reviewers do not treat a timestamp as a free-text annotation or a decimal confidence as an opaque string. Typed value stores then hold the instantiated miscellany—the concrete value payloads—partitioned by representation so that 0.731, Dimension Kind 01, and 2024-11-19T18:15:43 each land in the store appropriate to its declared type rather than in a single undifferentiated text field that forfeits queryability and integrity checks.

Subject and target articulate directed participation in governed relationships, and role qualifies the nature of that participation so that accountability is legible rather than merely implied. Where an audit for a period is associated with a for-audit-period scope, the audit identifier functions as subject and the period identifier as target: PERI-0001 linked to PERI-0003 with role observer, or PERI-0005 linked to PERI-0003 with role reviewer, encodes who examines under what mandate without collapsing observer and reviewer into an undifferentiated "involved party." The same structural pattern recurs in verification against artifacts, where verification_id ARTI-0002 targets targets_artifact_id ARTI-0003 under role owner, while ARTI-0005 targets ARTI-0001 under role contributor—distinctions material to segregation-of-duties analysis because ownership and contribution carry different evidentiary weight and different escalation paths when findings are disputed. A reviewer on PERI-0004's GDPR Compliance Review engagement is not interchangeable with an observer on PERI-0001's HIPAA Security Audit scope; the tripartite subject–target–role tuple makes that difference machine-checkable and audit-ready.

**t_audit_for_period__for_audit_period**

| id | audit_id | for_audit_period_id | role |
| --- | --- | --- | --- |
| PERI-0001 | PERI-0001 | PERI-0003 | observer |
| PERI-0002 | PERI-0002 | PERI-0005 | reviewer |
| PERI-0003 | PERI-0001 | PERI-0003 | observer |
| PERI-0004 | PERI-0005 | PERI-0003 | reviewer |
| PERI-0005 | PERI-0007 | PERI-0004 | reviewer |
| PERI-0006 | PERI-0001 | PERI-0001 | owner |
| PERI-0007 | PERI-0003 | PERI-0001 | reviewer |
| PERI-0008 | PERI-0008 | PERI-0002 | observer |

**t_verification_targets_artifact**

| id | verification |
| --- | --- |
| ARTI-0001 | Compliance review cycle |
| ARTI-0002 | Compliance review cycle |
| ARTI-0003 | Data lineage audit |
| ARTI-0004 | Compliance review cycle |
| ARTI-0005 | Test suite execution |
| ARTI-0006 | Governance policy scan |

**t_verification_targets_artifact_targets_artifact**

| id | targets_artifact |
| --- | --- |
| ARTI-0001 | Sensor calibration matrix |
| ARTI-0002 | Source code branch |
| ARTI-0003 | Sensor calibration matrix |
| ARTI-0004 | Sensor calibration matrix |
| ARTI-0005 | Ingestion manifest |
| ARTI-0006 | Ingestion manifest |

**t_verification_targets_artifact__targets_artifact**

| id | verification_id | targets_artifact_id | role |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0002 | ARTI-0002 | reviewer |
| ARTI-0002 | ARTI-0004 | ARTI-0003 | owner |
| ARTI-0003 | ARTI-0005 | ARTI-0001 | reviewer |
| ARTI-0004 | ARTI-0005 | ARTI-0001 | contributor |
| ARTI-0005 | ARTI-0002 | ARTI-0005 | reviewer |
| ARTI-0006 | ARTI-0005 | ARTI-0006 | owner |
| ARTI-0007 | ARTI-0006 | ARTI-0004 | owner |
| ARTI-0008 | ARTI-0006 | ARTI-0002 | reviewer |

The practical force of this model emerges when evidence is bound to the assurance context that gives it meaning. Evidence at quality tier records do not float as anonymous artifacts; they are situated—network packets and inspection photos graded against tier anchors such as PERI-0004 and PERI-0001—so that a confidence of 0.358 on TIER-0002 and a recorded_at of 2023-02-10T23:54:33 are interpretable only in light of the tier assignment and the attribute schema that declared their types. Verification cycles that target Sensor calibration matrix or Source code branch (ARTI-0001, ARTI-0002) establish what was examined; audit programs from Annual-2022 through ITIL Service Audit name the control frame within which examination occurred; roles determine whether the examining party had decision authority or observational standing. Misc values—the literal stored payloads—are therefore never merely "data points"; they are typed, attributed, entity-bound facts whose admissibility in a compliance narrative depends on the integrity of the identifier that locates them, the entity that owns them, the attr and attr_type that define them, and the subject–target–role fabric that situates them inside an accountable review.

**t_evidence_at_quality_tier_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| TIER-0001 | confidence | xsd:decimal |
| TIER-0002 | dimension_kind | xsd:string |
| TIER-0003 | method | xsd:string |
| TIER-0004 | recorded_at | xsd:dateTime |
| TIER-0005 | uncertainty | xsd:decimal |
| TIER-0006 | unit | xsd:string |
| TIER-0007 | value | xsd:decimal |
| TIER-0008 | encoding | xsd:string |

**t_evidence_at_quality_tier_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TIER-0001 | TIER-0001 | TIER-0004 | 2024-11-19T18:15:43 |
| TIER-0002 | TIER-0002 | TIER-0004 | 2023-02-10T23:54:33 |
| TIER-0003 | TIER-0003 | TIER-0004 | 2023-06-07T05:45:43 |
| TIER-0004 | TIER-0004 | TIER-0004 | 2024-08-05T11:37:21 |
| TIER-0005 | TIER-0005 | TIER-0004 | 2025-03-30T21:54:34 |
| TIER-0006 | TIER-0006 | TIER-0004 | 2023-10-26T18:53:01 |
| TIER-0007 | TIER-0007 | TIER-0004 | 2023-09-26T03:30:22 |
| TIER-0008 | TIER-0008 | TIER-0004 | 2023-04-10T10:08:00 |

**t_evidence_at_quality_tier_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TIER-0001 | TIER-0001 | TIER-0001 | 0.731 |
| TIER-0002 | TIER-0001 | TIER-0005 | 574.79 |
| TIER-0003 | TIER-0001 | TIER-0007 | 563.53 |
| TIER-0004 | TIER-0002 | TIER-0001 | 0.358 |
| TIER-0005 | TIER-0002 | TIER-0005 | 139.04 |
| TIER-0006 | TIER-0002 | TIER-0007 | 944.94 |
| TIER-0007 | TIER-0003 | TIER-0001 | 0.228 |
| TIER-0008 | TIER-0003 | TIER-0005 | 33.93 |

**t_evidence_at_quality_tier_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TIER-0001 | TIER-0001 | TIER-0002 | Dimension Kind 01 |
| TIER-0002 | TIER-0001 | TIER-0008 | Encoding 02 |
| TIER-0003 | TIER-0001 | TIER-0009 | change rationale |
| TIER-0004 | TIER-0001 | TIER-0010 | ja |
| TIER-0005 | TIER-0001 | TIER-0003 | hybrid |
| TIER-0006 | TIER-0001 | TIER-0006 | kg |
| TIER-0007 | TIER-0002 | TIER-0002 | Dimension Kind 07 |
| TIER-0008 | TIER-0002 | TIER-0008 | Encoding 08 |

Operational maturity in such a framework is measured by whether these primitives compose without leakage across boundaries. When PERI-0005 appears as audit_id in an association but is absent from the canonical audit register, or when attr_id TIER-0005 is cited in a decimal value row without a corresponding attribute definition, the model exposes a referential fracture that no amount of narrative prose in a final report can safely paper over. Conversely, when identifiers resolve, entities carry consistently typed attributes, and every subject–target link bears an explicit role, an inspector can reconstruct—from Data lineage audit through SOC2 Type II, from change rationale encoded as xsd:string to confidence scored at 0.731—who looked at what, under which control regime, with what measurable properties, and at what time the fact entered the record. That reconstructability is the operational purpose of the vocabulary: not cataloguing tables, but ensuring that assurance claims rest on evidence whose names, types, relationships, and values remain mutually consistent under scrutiny.