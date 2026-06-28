---
chapter_id: ch_live_attestation_basic_d07f72
topic_id: 191
family: 03_directive_governance
cited_terms: ['attestation_basic', 'attestation_min_one_signer', 'attestation_signed_by']
model: engine-refine
---

In attestation governance, an identifier is the durable handle by which a compliance record is addressed, retrieved, and correlated across control planes. Identifiers such as ATTE-0001 and SIGN-0002 are not display labels; they are stable keys that survive renaming of human-readable attestation titles and permit joins between the attestation definition, its attribute catalog, and every typed value store without ambiguity. When an ISO 27001 security assessment and a SOC 2 Type II Audit both carry distinct identifiers yet share a common attribute vocabulary, auditors can trace which procedural artifact produced which measured outcome, and downstream systems can enforce referential integrity when attestations are superseded, re-run, or compared across fiscal periods. The identifier therefore anchors accountability: it is the unit at which retention, access control, and evidentiary chain-of-custody attach.

An entity, in this domain, is the governed object to which attribute values are bound. The entity identifier on a value row—entity_id ATTE-0001 on a duration_seconds measurement, or SIGN-0001 on an end_time stamp—declares membership: this datum belongs to that attestation instance, not to the attribute definition globally and not to an unrelated record that happens to share a name. Multiple values may accrue to a single entity across execution cycles, as when ATTE-0001 records both a decimal duration of 7132.97 seconds and a datetime terminus of 2024-11-18T12:26:52, each keyed separately but unified under the same entity. Entity scoping is what converts a flat key-value store into a structured compliance narrative; without it, host_name ingest-21 and exit_code 898 would be orphaned literals rather than evidence tied to a Vendor Risk Evaluation or Pipeline Security Audit.

An attr is the named dimension along which an attestation is measured or described. Attributes such as duration_seconds, end_time, exit_code, and host_name constitute a reusable measurement schema applied consistently across attestation families—basic attestations, minimum-signer requirements, and signed-by workflows—so that control owners compare like with like when evaluating SOC2 Compliance Review against Incident Response Verification. The attribute is referenced twice in practice: once by semantic name in the attribute registry, and again by attr_id in value rows (for example ATTE-0001 for duration_seconds, ATTE-0002 for end_time), which permits the same logical attribute to be instantiated many times across entities while preserving a single authoritative definition. Governance teams treat attrs as the contract surface between policy language (“record execution duration,” “capture completion timestamp,” “persist process exit status,” “identify executing host”) and the operational telemetry that proves the control ran.

attr_type governs interpretability, validation, and physical storage. Declaring xsd:decimal for duration_seconds, xsd:dateTime for end_time, xsd:integer for exit_code, and xsd:string for host_name is not a cosmetic annotation; it fixes the legal set of operations auditors and automated validators may perform. Decimal durations such as 6429.54 and 6507.32 support aggregation and threshold comparison; datetime values including 2023-12-15T15:31:35 and 2025-06-04T16:32:01 enable temporal ordering and freshness checks; integer exit codes 71, 180, and 487 admit enumerated success and failure semantics; string values ranging from ingest-21 and node-b14 to initiation, review, complete, pending, and superseded carry categorical state that resists silent coercion. Partitioning values into type-aligned stores—decimal, datetime, integer, varchar—enforces attr_type at the persistence boundary so that a host name cannot be written into a numeric column and a compliance engine cannot misread a timestamp as a floating-point quantity.

The misc field—here realized as value—holds the instantiated evidence: the concrete reading that satisfies or fails a control at a point in time. Misc is deliberately generic at the column level because the attr and attr_type pair supply meaning; value 3894.03 is meaningful only when entity_id ATTE-0003 and attr_id ATTE-0001 identify it as duration_seconds for a SOC 2 Type II Audit, just as value gw-12 under SIGN-0001 and attr_id SIGN-0004 denotes the executing host for a SOC2 Compliance Review. Operational guides treat misc values as audit artifacts subject to immutability rules once an attestation is signed or closed out; a varchar of superseded on one row and complete on another documents lifecycle transitions that identifiers alone cannot express. Cross-family comparison illustrates why the five-tuple—identifier, entity, attr, attr_type, misc—must be read together: SIGN-0002 may record end_time 2024-07-02T14:51:27 under minimum-signer rules while ATTE-0002 records 2023-09-08T13:00:56 under basic attestation, and only the full binding resolves which control framework and which evidentiary standard applies.

**t_attestation_basic**

| id | attestation |
| --- | --- |
| ATTE-0001 | ISO 27001 security assessment |
| ATTE-0002 | Vendor Risk Evaluation |
| ATTE-0003 | SOC 2 Type II Audit |
| ATTE-0004 | SOC2 Compliance Review |
| ATTE-0005 | GDPR data mapping certification |
| ATTE-0006 | Metadata Governance Signoff |

**t_attestation_basic_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ATTE-0001 | duration_seconds | xsd:decimal |
| ATTE-0002 | end_time | xsd:dateTime |
| ATTE-0003 | exit_code | xsd:integer |
| ATTE-0004 | host_name | xsd:string |
| ATTE-0005 | log_level | xsd:string |
| ATTE-0006 | phase | xsd:string |
| ATTE-0007 | retry_count | xsd:integer |
| ATTE-0008 | scheduled_at | xsd:dateTime |

**t_attestation_basic_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTE-0001 | ATTE-0001 | ATTE-0002 | 2024-11-18T12:26:52 |
| ATTE-0002 | ATTE-0001 | ATTE-0008 | 2023-12-15T15:31:35 |
| ATTE-0003 | ATTE-0001 | ATTE-0009 | 2023-03-05T20:41:52 |
| ATTE-0004 | ATTE-0002 | ATTE-0002 | 2023-09-08T13:00:56 |
| ATTE-0005 | ATTE-0002 | ATTE-0008 | 2024-07-29T18:29:50 |
| ATTE-0006 | ATTE-0002 | ATTE-0009 | 2024-08-01T11:14:05 |
| ATTE-0007 | ATTE-0003 | ATTE-0002 | 2023-01-08T06:41:42 |
| ATTE-0008 | ATTE-0003 | ATTE-0008 | 2025-06-10T02:28:19 |

**t_attestation_basic_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTE-0001 | ATTE-0001 | ATTE-0001 | 7132.97 |
| ATTE-0002 | ATTE-0002 | ATTE-0001 | 6429.54 |
| ATTE-0003 | ATTE-0003 | ATTE-0001 | 3894.03 |
| ATTE-0004 | ATTE-0004 | ATTE-0001 | 6507.32 |
| ATTE-0005 | ATTE-0005 | ATTE-0001 | 5722.64 |
| ATTE-0006 | ATTE-0006 | ATTE-0001 | 4627.41 |

**t_attestation_basic_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTE-0001 | ATTE-0001 | ATTE-0003 | 898 |
| ATTE-0002 | ATTE-0001 | ATTE-0007 | 487 |
| ATTE-0003 | ATTE-0002 | ATTE-0003 | 71 |
| ATTE-0004 | ATTE-0002 | ATTE-0007 | 180 |
| ATTE-0005 | ATTE-0003 | ATTE-0003 | 107 |
| ATTE-0006 | ATTE-0003 | ATTE-0007 | 326 |
| ATTE-0007 | ATTE-0004 | ATTE-0003 | 620 |
| ATTE-0008 | ATTE-0004 | ATTE-0007 | 392 |

**t_attestation_basic_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTE-0001 | ATTE-0001 | ATTE-0004 | ingest-21 |
| ATTE-0002 | ATTE-0001 | ATTE-0005 | Log Level 02 |
| ATTE-0003 | ATTE-0001 | ATTE-0006 | initiation |
| ATTE-0004 | ATTE-0001 | ATTE-0010 | superseded |
| ATTE-0005 | ATTE-0001 | ATTE-0011 | Triggered By 05 |
| ATTE-0006 | ATTE-0002 | ATTE-0004 | gw-12 |
| ATTE-0007 | ATTE-0002 | ATTE-0005 | Log Level 07 |
| ATTE-0008 | ATTE-0002 | ATTE-0006 | execution |

**t_attestation_min_one_signer**

| id | attestation |
| --- | --- |
| SIGN-0001 | Pipeline Security Audit |
| SIGN-0002 | ISO 27001 Certification Review |
| SIGN-0003 | Incident Response Verification |
| SIGN-0004 | SOC2 Compliance Review |
| SIGN-0005 | Vendor risk assessment |
| SIGN-0006 | Release Readiness Approval |

**t_attestation_min_one_signer_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| SIGN-0001 | duration_seconds | xsd:decimal |
| SIGN-0002 | end_time | xsd:dateTime |
| SIGN-0003 | exit_code | xsd:integer |
| SIGN-0004 | host_name | xsd:string |
| SIGN-0005 | log_level | xsd:string |
| SIGN-0006 | phase | xsd:string |
| SIGN-0007 | retry_count | xsd:integer |
| SIGN-0008 | scheduled_at | xsd:dateTime |

**t_attestation_min_one_signer_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SIGN-0001 | SIGN-0001 | SIGN-0002 | 2023-01-30T09:27:18 |
| SIGN-0002 | SIGN-0001 | SIGN-0008 | 2023-11-17T23:13:16 |
| SIGN-0003 | SIGN-0001 | SIGN-0009 | 2024-10-31T01:25:16 |
| SIGN-0004 | SIGN-0002 | SIGN-0002 | 2024-07-02T14:51:27 |
| SIGN-0005 | SIGN-0002 | SIGN-0008 | 2025-02-15T22:43:11 |
| SIGN-0006 | SIGN-0002 | SIGN-0009 | 2025-01-24T22:56:47 |
| SIGN-0007 | SIGN-0003 | SIGN-0002 | 2024-08-04T06:50:35 |
| SIGN-0008 | SIGN-0003 | SIGN-0008 | 2024-10-17T00:50:44 |

**t_attestation_min_one_signer_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SIGN-0001 | SIGN-0001 | SIGN-0001 | 1355.00 |
| SIGN-0002 | SIGN-0002 | SIGN-0001 | 2257.11 |
| SIGN-0003 | SIGN-0003 | SIGN-0001 | 6713.34 |
| SIGN-0004 | SIGN-0004 | SIGN-0001 | 6673.35 |
| SIGN-0005 | SIGN-0005 | SIGN-0001 | 1063.66 |
| SIGN-0006 | SIGN-0006 | SIGN-0001 | 1.74 |

**t_attestation_min_one_signer_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SIGN-0001 | SIGN-0001 | SIGN-0003 | 392 |
| SIGN-0002 | SIGN-0001 | SIGN-0007 | 373 |
| SIGN-0003 | SIGN-0002 | SIGN-0003 | 567 |
| SIGN-0004 | SIGN-0002 | SIGN-0007 | 384 |
| SIGN-0005 | SIGN-0003 | SIGN-0003 | 347 |
| SIGN-0006 | SIGN-0003 | SIGN-0007 | 188 |
| SIGN-0007 | SIGN-0004 | SIGN-0003 | 103 |
| SIGN-0008 | SIGN-0004 | SIGN-0007 | 410 |

**t_attestation_min_one_signer_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SIGN-0001 | SIGN-0001 | SIGN-0004 | node-b14 |
| SIGN-0002 | SIGN-0001 | SIGN-0005 | Log Level 02 |
| SIGN-0003 | SIGN-0001 | SIGN-0006 | review |
| SIGN-0004 | SIGN-0001 | SIGN-0010 | complete |
| SIGN-0005 | SIGN-0001 | SIGN-0011 | Triggered By 05 |
| SIGN-0006 | SIGN-0002 | SIGN-0004 | ingest-21 |
| SIGN-0007 | SIGN-0002 | SIGN-0005 | Log Level 07 |
| SIGN-0008 | SIGN-0002 | SIGN-0006 | execution |

**t_attestation_signed_by**

| id | attestation |
| --- | --- |
| SIGN-0001 | SOC2 Compliance Review |
| SIGN-0002 | GDPR data mapping certification |
| SIGN-0003 | ML model fairness audit |
| SIGN-0004 | Data Lineage Audit |
| SIGN-0005 | Pipeline Security Audit |
| SIGN-0006 | Cryptographic signature verification |

**t_attestation_signed_by_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| SIGN-0001 | duration_seconds | xsd:decimal |
| SIGN-0002 | end_time | xsd:dateTime |
| SIGN-0003 | exit_code | xsd:integer |
| SIGN-0004 | host_name | xsd:string |
| SIGN-0005 | log_level | xsd:string |
| SIGN-0006 | phase | xsd:string |
| SIGN-0007 | retry_count | xsd:integer |
| SIGN-0008 | scheduled_at | xsd:dateTime |

**t_attestation_signed_by_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SIGN-0001 | SIGN-0001 | SIGN-0002 | 2023-11-18T17:18:55 |
| SIGN-0002 | SIGN-0001 | SIGN-0008 | 2024-04-18T06:27:25 |
| SIGN-0003 | SIGN-0001 | SIGN-0009 | 2023-01-19T17:50:39 |
| SIGN-0004 | SIGN-0002 | SIGN-0002 | 2025-06-04T16:32:01 |
| SIGN-0005 | SIGN-0002 | SIGN-0008 | 2025-04-02T11:15:56 |
| SIGN-0006 | SIGN-0002 | SIGN-0009 | 2023-07-13T05:58:46 |
| SIGN-0007 | SIGN-0003 | SIGN-0002 | 2023-10-19T08:02:32 |
| SIGN-0008 | SIGN-0003 | SIGN-0008 | 2025-01-01T00:25:23 |

**t_attestation_signed_by_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SIGN-0001 | SIGN-0001 | SIGN-0001 | 2368.11 |
| SIGN-0002 | SIGN-0002 | SIGN-0001 | 5757.34 |
| SIGN-0003 | SIGN-0003 | SIGN-0001 | 785.50 |
| SIGN-0004 | SIGN-0004 | SIGN-0001 | 5676.02 |
| SIGN-0005 | SIGN-0005 | SIGN-0001 | 992.24 |
| SIGN-0006 | SIGN-0006 | SIGN-0001 | 815.51 |

**t_attestation_signed_by_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SIGN-0001 | SIGN-0001 | SIGN-0003 | 407 |
| SIGN-0002 | SIGN-0001 | SIGN-0007 | 30 |
| SIGN-0003 | SIGN-0002 | SIGN-0003 | 633 |
| SIGN-0004 | SIGN-0002 | SIGN-0007 | 373 |
| SIGN-0005 | SIGN-0003 | SIGN-0003 | 166 |
| SIGN-0006 | SIGN-0003 | SIGN-0007 | 260 |
| SIGN-0007 | SIGN-0004 | SIGN-0003 | 596 |
| SIGN-0008 | SIGN-0004 | SIGN-0007 | 36 |

**t_attestation_signed_by_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SIGN-0001 | SIGN-0001 | SIGN-0004 | gw-12 |
| SIGN-0002 | SIGN-0001 | SIGN-0005 | Log Level 02 |
| SIGN-0003 | SIGN-0001 | SIGN-0006 | closeout |
| SIGN-0004 | SIGN-0001 | SIGN-0010 | pending |
| SIGN-0005 | SIGN-0001 | SIGN-0011 | Triggered By 05 |
| SIGN-0006 | SIGN-0002 | SIGN-0004 | worker-07 |
| SIGN-0007 | SIGN-0002 | SIGN-0005 | Log Level 07 |
| SIGN-0008 | SIGN-0002 | SIGN-0006 | review |

Identifiers, entities, attrs, attr_types, and misc values jointly implement a typed entity–attribute–value model suited to heterogeneous compliance telemetry. Attestation families differ in procedural requirements—basic recording, mandatory signer presence, cryptographically attributed sign-off—yet converge on an identical attribute quartet, which allows enterprise risk functions to normalize reporting without flattening the semantic distinctions among GDPR data mapping certification, ML model fairness audit, and Data Lineage Audit. Implementers wire validation so attr_type precedes write, entity_id precedes read authorization, and identifier stability precedes archival; reviewers reconstruct execution context by traversing from identifier to entity-bound attrs to typed misc values. That traversal is the practical mechanics of evidence anchoring: policy states what must be attested, attrs state what must be captured, attr_type states how it may be stored and compared, entity states to which run it belongs, and misc states what was actually observed—7132.97 seconds on ingest-21 with exit_code 898, or 1355.00 seconds on node-b14 with exit_code 392—forming the auditable substrate on which governance conclusions rest.