---
chapter_id: ch_live_claim_observed_by_event_1a28d5
topic_id: 125
family: 07_long_tail
cited_terms: ['claim_observed_by_event', 'attestation_signed_by', 'syscall_with_return_type']
model: engine-refine
---

In governance and compliance systems that bind operational telemetry to auditable assertions, the identifier serves as the stable referent that permits heterogeneous records to be joined without collapsing distinct evidentiary roles into a single namespace. A claim is not merely a proposition but a keyed assertion whose epistemic weight is carried explicitly: confidence expresses the assessed probability or strength of belief that the assertion holds under current evidence, while uncertainty quantifies the residual dispersion or bound on that belief. Where EVEN-0002 is associated with confidence 0.596 and uncertainty 43.01, the pairing signals a moderately supported assertion whose error envelope is comparatively tight; by contrast, the same claim_key on another fact row may register confidence 0.364 with uncertainty 296.86, illustrating how repeated evidentiary draws over the same claim can diverge in both central estimate and spread. Category partitions the claim universe into policy-relevant groupings—Claim Category 02 versus Claim Category 04—so that reviewers may apply tiered controls, retention rules, and escalation thresholds without re-deriving taxonomy from free text each cycle.

**fact_claim**

| id | claim_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| EVEN-0001 | EVEN-0002 | 0.621 | 571.46 | 164.54 |
| EVEN-0002 | EVEN-0002 | 0.596 | 43.01 | 173.58 |
| EVEN-0003 | EVEN-0006 | 0.338 | 142.53 | 166.95 |
| EVEN-0004 | EVEN-0002 | 0.364 | 296.86 | 152.06 |
| EVEN-0005 | EVEN-0001 | 0.316 | 715.93 | 997.16 |
| EVEN-0006 | EVEN-0006 | 0.410 | 701.36 | 614.41 |
| EVEN-0007 | EVEN-0003 | 0.162 | 133.33 | 142.05 |

Entity and attribute together instantiate the object–property pattern that makes attestations machine-checkable rather than narrative-only. An entity such as SIGN-0001 denotes a concrete attestation instance—here, a System Access Certification—while attr names the measured or declared property (`duration_seconds`, `end_time`, `exit_code`, `host_name`) and attr_type fixes the interpretive contract under which values must be parsed, compared, and validated. Typed storage is not cosmetic: `xsd:decimal` values (2368.11, 5757.34) land in decimal tables, `xsd:dateTime` timestamps (2023-11-18T17:18:55, 2025-06-04T16:32:01) in datetime tables, `xsd:integer` exit codes (407, 633) in integer tables, and `xsd:string` host or status literals (`gw-12`, `pending`) in varchar tables. The same entity_id may therefore accumulate multiple attr_id bindings across types, yielding a composite evidentiary profile—SIGN-0001 simultaneously carries duration, temporal bounds, exit status, and host identity—without forcing a single untyped bag of strings that would defeat schema validation and cross-system interchange.

The misc dimension captures payload fields that are intentionally polymorphic: human-readable claim labels (Claim Label 01 through Claim Label 04), syscall classification codes (C-07, B-12), and raw measured values (164.54, 173.58) that participate in analytics but do not themselves define the structural role of the record. In practice, misc values travel with identifiers and typed slots; auditors treat them as display, lineage, or auxiliary metrics unless governance maps them explicitly to control objectives. Checksumalgo enters where integrity of typed artifacts must be demonstrated at rest or in transit: associating `recvfrom` with sha1, `openat` and `sendto` with md5, and `write` with crc32 shows that algorithm choice is bound to the syscall and return_type context (`int64_t`, `long`, `size_t`, `pid_t`), not applied uniformly. That binding matters because verification policies often mandate algorithm families per sensitivity class; a crc32 on a hot-path write trace may suffice for detection of accidental corruption, whereas md5 or sha1 on attestation-bearing structures may be required where downstream consumers recompute digests before trust decisions.

**t_attestation_signed_by**

| id | attestation |
| --- | --- |
| SIGN-0001 | System Access Certification |
| SIGN-0002 | Data Lineage Certification |
| SIGN-0003 | Privacy Impact Assessment |
| SIGN-0004 | System Access Certification |
| SIGN-0005 | Data Lineage Certification |
| SIGN-0006 | Model Performance Signoff |

**t_syscall_with_return_type**

| id | syscall | return_type | checksum_algo | code |
| --- | --- | --- | --- | --- |
| TYPE-0001 | recvfrom | int64_t | sha1 | C-07 |
| TYPE-0002 | openat | long | md5 | B-12 |
| TYPE-0003 | write | size_t | crc32 | C-07 |
| TYPE-0004 | sendto | pid_t | md5 | C-07 |
| TYPE-0005 | connect | int | blake2b | C-07 |
| TYPE-0006 | mmap | size_t | sha1 | A-01 |
| TYPE-0007 | sendto | long | md5 | D-33 |
| TYPE-0008 | accept | int | crc32 | B-12 |

Operationally, reviewers traverse from identifier to entity, from entity through attr and attr_type to misc-bearing value stores, and from claim through category to confidence–uncertainty tuples when adjudicating whether an assertion may be relied upon for access certification, data lineage attestation, or privacy impact assessment. High confidence with low uncertainty invites routine acceptance within category-specific tolerances; low confidence or high uncertainty triggers supplemental evidence, independent attestation, or quarantine regardless of label readability. Attestation diversity—System Access Certification appearing twice under SIGN-0001 and SIGN-0004, Data Lineage Certification under SIGN-0002, Privacy Impact Assessment under SIGN-0003—demonstrates that identical control families may be instantiated under distinct entities with non-overlapping attribute sets, preventing false equivalence when exit_code 30 on one run is compared to 373 on another. Checksumalgo consistency across code families (multiple C-07 rows sharing md5) further allows batch integrity checks without re-reading full syscall semantics.

**dim_claim**

| id | claim_label | claim_category |
| --- | --- | --- |
| EVEN-0001 | Claim Label 01 | Claim Category 01 |
| EVEN-0002 | Claim Label 02 | Claim Category 02 |
| EVEN-0003 | Claim Label 03 | Claim Category 03 |
| EVEN-0004 | Claim Label 04 | Claim Category 04 |
| EVEN-0005 | Claim Label 05 | Claim Category 05 |
| EVEN-0006 | Claim Label 06 | Claim Category 06 |

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

Taken together, these constructs form a layered evidence grammar: identifiers anchor; entities and typed attrs materialize what was observed or certified; categories and claims organize what is asserted about risk and compliance; confidence and uncertainty quantify how firmly those assertions rest on data; misc carries the residual surface detail; and checksumalgo supplies the cryptographic hook by which typed records prove they have not been altered since capture. Mature deployments treat each layer as independently governable—schema evolution in attr_type, rotation policy in checksumalgo, thresholding in confidence—so that a single weak field does not silently collapse the evidential chain that auditors, automated policy engines, and cross-domain correlators depend upon when reconciling host_name `gw-12` with duration_seconds 2368.11 against a claim whose value 166.95 still carries uncertainty 142.53 at confidence 0.338.