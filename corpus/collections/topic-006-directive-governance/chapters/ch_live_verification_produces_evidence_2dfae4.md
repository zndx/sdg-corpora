---
chapter_id: ch_live_verification_produces_evidence_2dfae4
topic_id: 6
family: 03_directive_governance
cited_terms: ['verification_produces_evidence', 'verification_subclass', 'verification_targets_artifact']
model: engine-refine
---

In the governance of complex compliance frameworks, the integrity of an operational audit relies upon the precise instantiation of verification entities, each uniquely distinguished by a standardized identifier. Whether designated as an evidence record such as `EVID-0001` or a procedural verification like `VERI-0001`, these entities serve as the foundational units of accountability, capturing the execution of rigorous assessments ranging from "Compliance audit Q3" to "GDPR data flow review." Each entity is tasked with producing tangible evidence—such as a "Validation result" or a "TLS certificate"—thereby creating an immutable chain of custody for regulatory requirements. The systematic assignment of these identifiers ensures that every operational action can be traced back to its source, maintaining the structural coherence of the audit trail across disparate verification subclasses.

**t_verification_produces_evidence**

| id | verification | produces_evidence | exit_code | status |
| --- | --- | --- | --- | --- |
| EVID-0001 | Compliance audit Q3 | Validation result | 568 | complete |
| EVID-0002 | Compliance audit Q3 | TLS certificate | 821 | failed |
| EVID-0003 | Compliance audit Q3 | Validation result | 938 | failed |
| EVID-0004 | Compliance audit Q3 | TLS certificate | 88 | pending |
| EVID-0005 | Compliance audit Q3 | Risk score | 761 | pending |

**t_verification_subclass**

| id | verification |
| --- | --- |
| VERI-0001 | Compliance renewal verification |
| VERI-0002 | GDPR data flow review |
| VERI-0003 | GDPR data flow review |
| VERI-0004 | Security posture assessment |
| VERI-0005 | Regulatory compliance sweep |
| VERI-0006 | Traceability certification run |
| VERI-0007 | Security posture assessment |

**t_verification_subclass_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERI-0001 | VERI-0001 | VERI-0003 | 616 |
| VERI-0002 | VERI-0001 | VERI-0007 | 105 |
| VERI-0003 | VERI-0002 | VERI-0003 | 713 |
| VERI-0004 | VERI-0002 | VERI-0007 | 29 |
| VERI-0005 | VERI-0003 | VERI-0003 | 18 |
| VERI-0006 | VERI-0003 | VERI-0007 | 388 |
| VERI-0007 | VERI-0004 | VERI-0003 | 901 |
| VERI-0008 | VERI-0004 | VERI-0007 | 260 |

**t_verification_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERI-0001 | VERI-0001 | VERI-0004 | node-a01 |
| VERI-0002 | VERI-0001 | VERI-0005 | Log Level 02 |
| VERI-0003 | VERI-0001 | VERI-0006 | review |
| VERI-0004 | VERI-0001 | VERI-0010 | running |
| VERI-0005 | VERI-0001 | VERI-0011 | Triggered By 05 |
| VERI-0006 | VERI-0002 | VERI-0004 | ingest-21 |
| VERI-0007 | VERI-0002 | VERI-0005 | Log Level 07 |
| VERI-0008 | VERI-0002 | VERI-0006 | execution |

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

To quantify the scope and parameters of these verifications, the system employs a structured attribute registry where each `attr` is bound to a strict `attr_type`, dictating the format of the data stored within the `misc` value columns. This type-safe architecture allows for the precise measurement of temporal and quantitative metrics; for instance, an attribute named `duration_seconds` is typed as `xsd:decimal`, capturing execution times such as `5469.69` or `821.61`. Similarly, temporal boundaries are enforced through `xsd:dateTime` attributes recording `end_time` values like `2024-10-23T14:58:17`, while system-level diagnostics utilize `xsd:string` types to log host identifiers such as `node-a01` or configuration states like `Log Level 02`. By segregating values according to their semantic types, the framework guarantees that the metadata associated with a verification remains both machine-readable and semantically unambiguous.

**t_verification_subclass_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| VERI-0001 | duration_seconds | xsd:decimal |
| VERI-0002 | end_time | xsd:dateTime |
| VERI-0003 | exit_code | xsd:integer |
| VERI-0004 | host_name | xsd:string |
| VERI-0005 | log_level | xsd:string |
| VERI-0006 | phase | xsd:string |
| VERI-0007 | retry_count | xsd:integer |
| VERI-0008 | scheduled_at | xsd:dateTime |

**t_verification_subclass_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERI-0001 | VERI-0001 | VERI-0002 | 2024-10-23T14:58:17 |
| VERI-0002 | VERI-0001 | VERI-0008 | 2024-02-27T03:56:28 |
| VERI-0003 | VERI-0001 | VERI-0009 | 2024-10-31T01:53:25 |
| VERI-0004 | VERI-0002 | VERI-0002 | 2024-01-09T21:40:31 |
| VERI-0005 | VERI-0002 | VERI-0008 | 2023-01-30T12:31:57 |
| VERI-0006 | VERI-0002 | VERI-0009 | 2024-01-31T06:48:16 |
| VERI-0007 | VERI-0003 | VERI-0002 | 2024-07-16T09:25:28 |
| VERI-0008 | VERI-0003 | VERI-0008 | 2025-02-02T11:50:21 |

**t_verification_subclass_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERI-0001 | VERI-0001 | VERI-0001 | 5469.69 |
| VERI-0002 | VERI-0002 | VERI-0001 | 821.61 |
| VERI-0003 | VERI-0003 | VERI-0001 | 4016.93 |
| VERI-0004 | VERI-0004 | VERI-0001 | 4484.04 |
| VERI-0005 | VERI-0005 | VERI-0001 | 1841.34 |
| VERI-0006 | VERI-0006 | VERI-0001 | 4375.47 |
| VERI-0007 | VERI-0007 | VERI-0001 | 6751.14 |

The culmination of a verification process is formally recorded through its `status` and a corresponding `exitcode`, which together provide an unambiguous assessment of operational compliance. The `status` field acts as the primary indicator of lifecycle progression, categorizing the entity as `complete`, `failed`, or `pending`, thereby allowing governance bodies to instantly identify bottlenecks or non-conformities. Concurrently, the `exitcode` serves as a granular, numeric diagnostic marker—such as `568`, `821`, or `938`—that pinpoints the specific nature of the outcome. For example, a verification yielding a "Validation result" might terminate with an exit code of `938` and a `failed` status, signaling a critical deviation that requires immediate remediation, whereas a code of `88` might indicate a successful but conditional completion.

Operational verifications do not exist in isolation; they are intrinsically linked to the physical and digital assets they interrogate, establishing a relational matrix between the `subject` of the audit and the `target` artifacts under review. In this architecture, the verification acts as the `subject`, exerting its evaluative authority over specific `target` entities, such as a "Sensor calibration matrix" or a "Source code branch." The nature of this interaction is defined by the `role` assigned to the target artifact, which dictates its functional relationship to the verification process. An artifact may serve as a `reviewer`, providing the criteria against which compliance is measured; as an `owner`, bearing ultimate responsibility for the asset's integrity; or as a `contributor`, supplying the raw data necessary for the assessment. This tripartite relationship ensures that every verification is grounded in the specific context of the assets it governs.

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