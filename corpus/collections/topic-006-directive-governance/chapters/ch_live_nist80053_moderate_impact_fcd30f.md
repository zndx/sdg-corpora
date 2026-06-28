---
chapter_id: ch_live_nist80053_moderate_impact_fcd30f
topic_id: 6
family: 07_long_tail
cited_terms: ['nist80053_moderate_impact', 'instrument_with_function', 'verification_produces_evidence']
model: engine-refine
---

In compliance and operational governance frameworks, precise attribution of metadata to operational entities requires a structured attr-value architecture anchored by a unique identifier. Each record—designated by reference codes such as IMPA-0001, FUNC-0001, or EVID-0001—serves as the immutable pivot point across distributed verification systems. The attr column defines the dimensions of observability, capturing fields like checksum, created_date, identifier, and license, while the attr type column enforces schema-level validation through standardized formats including xsd:string, xsd:date, and cco:DesignativeICE. This typed attribute model ensures that heterogeneous data streams, whether they store cryptographic hashes like a3f9c21e, geographic regions like us-east-1, or licensing terms like MPL-2.0, are parsed within a unified governance ontology. The entity column functions as the relational bridge, binding these discrete attribute values back to their originating instruments or processes, thereby preserving lineage and auditability across the telemetry stack.

**t_instrument_with_function**

| id | instrument | realizes_function |
| --- | --- | --- |
| FUNC-0001 | Keysight DSOX3024T | EVID-0002 |
| FUNC-0002 | Thermo Q Exactive | EVID-0003 |
| FUNC-0003 | Zygo NewView | EVID-0005 |
| FUNC-0004 | Agilent 5975C | EVID-0005 |
| FUNC-0005 | Agilent 5975C | EVID-0002 |
| FUNC-0006 | Agilent 5975C | EVID-0003 |

**t_instrument_with_function_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| FUNC-0001 | checksum | xsd:string |
| FUNC-0002 | created_date | xsd:date |
| FUNC-0003 | identifier | cco:DesignativeICE |
| FUNC-0004 | license | xsd:string |
| FUNC-0005 | mime_type | xsd:string |
| FUNC-0006 | size_bytes | xsd:long |
| FUNC-0007 | uri | xsd:string |
| FUNC-0008 | version | xsd:integer |

**t_instrument_with_function_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| FUNC-0001 | FUNC-0001 | FUNC-0002 | 2024-09-19 |
| FUNC-0002 | FUNC-0002 | FUNC-0002 | 2023-09-07 |
| FUNC-0003 | FUNC-0003 | FUNC-0002 | 2024-09-12 |
| FUNC-0004 | FUNC-0004 | FUNC-0002 | 2024-08-15 |
| FUNC-0005 | FUNC-0005 | FUNC-0002 | 2025-05-20 |
| FUNC-0006 | FUNC-0006 | FUNC-0002 | 2023-09-16 |

Beyond isolated metadata, governance frameworks require explicit relationship modeling to map regulatory standards to operational realities. The subject-target architecture establishes directional linkages between compliance benchmarks and impact classifications, where a subject such as IMPA-0002 may reference a target like IMPA-0007 to denote a specific security alignment. The role column operationalizes these connections by assigning semantic functions—observer, contributor, or owner—that dictate accountability and data-flow permissions. A record marked as owner assumes direct stewardship over the target impact level, whereas an observer role grants read-only visibility without modification rights. This tripartite structure transforms abstract policy documents into executable governance graphs, enabling automated compliance tracing across multi-tiered security baselines like the Moderate Threshold or System Security Moderate.

**t_nist80053_moderate_impact**

| id | nist |
| --- | --- |
| IMPA-0001 | SP 800-53 |
| IMPA-0002 | SP 800-53 |
| IMPA-0003 | SP 800-171 |
| IMPA-0004 | SP 800-218 |
| IMPA-0005 | NIST AI RMF |
| IMPA-0006 | SP 800-171 |
| IMPA-0007 | SP 800-37 |

**t_nist80053_moderate_impact_at_n_i_s_t_impact_level**

| id | at_n_i_s_t_impact_level |
| --- | --- |
| IMPA-0001 | Moderate Threshold |
| IMPA-0002 | System Security Moderate |
| IMPA-0003 | Impact Level Moderate |
| IMPA-0004 | Moderate Baseline |
| IMPA-0005 | Moderate Threshold |
| IMPA-0006 | Moderate |
| IMPA-0007 | Availability Moderate |

**t_nist80053_moderate_impact__at_n_i_s_t_impact_level**

| id | nist_id | at_n_i_s_t_impact_level_id | role |
| --- | --- | --- | --- |
| IMPA-0001 | IMPA-0002 | IMPA-0007 | observer |
| IMPA-0002 | IMPA-0002 | IMPA-0004 | observer |
| IMPA-0003 | IMPA-0006 | IMPA-0001 | contributor |
| IMPA-0004 | IMPA-0007 | IMPA-0007 | owner |
| IMPA-0005 | IMPA-0003 | IMPA-0002 | owner |
| IMPA-0006 | IMPA-0004 | IMPA-0005 | observer |
| IMPA-0007 | IMPA-0001 | IMPA-0006 | contributor |
| IMPA-0008 | IMPA-0003 | IMPA-0007 | owner |

The execution of verification procedures generates operational telemetry that must be captured with both machine-readable precision and human-readable context. Exitcode values, such as 568, 821, 938, and 88, provide granular diagnostic signals that map directly to underlying system states, protocol violations, or resource constraints encountered during evidence collection. These numeric indicators are paired with status fields—complete, failed, or pending—to deliver a dual-layer reporting mechanism that supports both automated remediation workflows and manual audit reviews. When a compliance audit Q3 yields a failed status alongside exitcode 821, the system can immediately isolate the defective evidence artifact, trigger corrective action protocols, and update downstream dependency graphs without human intervention. This structured outcome taxonomy ensures that verification pipelines maintain deterministic state transitions and provide auditable trails for regulatory scrutiny.

In practice, these components form an integrated compliance telemetry stack that bridges policy definition, instrument configuration, and verification execution. A measurement device like the Keysight DSOX3024T or Thermo Q Exactive is registered with a functional identifier, its attributes typed and populated with operational misc values, and its outputs linked to evidence artifacts through standardized relationship mappings. When verification routines execute against these artifacts, the resulting exitcode and status flags propagate back through the entity graph, updating impact levels and role assignments accordingly. This closed-loop architecture ensures that every compliance checkpoint—from initial instrument calibration to final audit sign-off—leaves a cryptographically verifiable, role-aware, and status-tracked footprint, enabling organizations to maintain continuous regulatory alignment while preserving the granular provenance required for forensic analysis and third-party assurance.

**t_instrument_with_function_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| FUNC-0001 | FUNC-0001 | FUNC-0006 | 359 |
| FUNC-0002 | FUNC-0001 | FUNC-0008 | 4 |
| FUNC-0003 | FUNC-0002 | FUNC-0006 | 439 |
| FUNC-0004 | FUNC-0002 | FUNC-0008 | 6 |
| FUNC-0005 | FUNC-0003 | FUNC-0006 | 255 |
| FUNC-0006 | FUNC-0003 | FUNC-0008 | 10 |
| FUNC-0007 | FUNC-0004 | FUNC-0006 | 467 |
| FUNC-0008 | FUNC-0004 | FUNC-0008 | 3 |

**t_instrument_with_function_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| FUNC-0001 | FUNC-0001 | FUNC-0001 | a3f9c21e |
| FUNC-0002 | FUNC-0001 | FUNC-0003 | ref-8842 |
| FUNC-0003 | FUNC-0001 | FUNC-0004 | MPL-2.0 |
| FUNC-0004 | FUNC-0001 | FUNC-0009 | us-east-1 |
| FUNC-0005 | FUNC-0001 | FUNC-0005 | text/plain |
| FUNC-0006 | FUNC-0001 | FUNC-0010 | Name 06 |
| FUNC-0007 | FUNC-0001 | FUNC-0011 | sre |
| FUNC-0008 | FUNC-0001 | FUNC-0012 | Tags 08 |

**t_verification_produces_evidence**

| id | verification | produces_evidence | exit_code | status |
| --- | --- | --- | --- | --- |
| EVID-0001 | Compliance audit Q3 | FUNC-0006 | 568 | complete |
| EVID-0002 | Compliance audit Q3 | FUNC-0001 | 821 | failed |
| EVID-0003 | Compliance audit Q3 | FUNC-0005 | 938 | failed |
| EVID-0004 | Compliance audit Q3 | FUNC-0003 | 88 | pending |
| EVID-0005 | Compliance audit Q3 | FUNC-0002 | 761 | pending |
| EVID-0006 | Compliance audit Q3 | FUNC-0005 | 718 | running |