---
chapter_id: ch_live_identifier_uniquely_identifies_2e3131
topic_id: 78
family: 01_foundation
cited_terms: ['identifier_uniquely_identifies', 'measurement_with_method', 'syscall_audited_by']
model: engine-refine
---

In governed data environments, an identifier is the durable handle by which an artifact, actor, or process node is referenced across systems, audits, and lineage graphs. Identifiers are not interchangeable strings: each carries a declared format that constrains parsing, validation, and interchange. A Digital Object Identifier such as `doi:10.1145/3641519` may denote a provenance root under a JSON serialization regime, while an ISBN URN (`urn:isbn:9780131103627`) may anchor a pipeline stage whose records are exchanged as CSV. An ORCID (`orcid:0000-0002-1825-0097`) illustrates person-centric identification under E.164-adjacent normalization rules, and a container image digest referenced in the same identifier registry shows that cryptographic hashes participate in the same governance layer as bibliographic and organizational keys. The `issueddate` associated with each identifier record—whether `2024-09-07`, `2023-03-13`, `2024-01-30`, or `2023-03-01`—establishes temporal authority: compliance reviews, retention policies, and supersession rules typically key off issuance rather than first observation, so that an identifier’s validity interval can be reconstructed even when the underlying asset has been redeployed or re-ingested.

Format and language function as cross-cutting control dimensions that determine how an identifier or audit event may be interpreted without ambiguity. Format declarations—JSON, CSV, UUID, E.164—specify the structural contract under which payloads are produced, consumed, and validated; they are therefore prerequisite to automated conformance checking and to safe handoff between subsystems that do not share a common runtime. Language metadata, recorded as `fr`, `en`, or `ja` in syscall audit contexts, governs human-readable labeling, localized error surfaces, and the locale assumptions embedded in log parsers and review workflows. Where the same syscall—`unlinkat`, `execve`, `epoll_ctl`, or `clone`—is audited under differing format and language pairings, reviewers must treat the audit tuple as a compound assertion: the event occurred, it was serialized in a stated representation, and it was captured under a stated linguistic regime. Misalignment among identifier format, payload format, and audit format is a common source of false non-compliance in automated assessments.

**t_syscall_audited_by**

| id | syscall | format | language |
| --- | --- | --- | --- |
| AUDI-0001 | unlinkat | JSON | fr |
| AUDI-0002 | execve | UUID | en |
| AUDI-0003 | epoll_ctl | CSV | ja |
| AUDI-0004 | clone | UUID | en |

Measurements in this domain are explicitly method-bound: every recorded value is understood to have been obtained via a particular via method, and that method is classified so that aggregations and risk scoring remain semantically sound. The via method dimension supplies both a categorical scaffold—Via Method Category 01 through Via Method Category 04—and a human-facing label in the miscellaneous descriptive field (`Via Method Label 01` through `Via Method Label 04`), allowing policy to distinguish, for example, direct instrumentation from inferred derivation without collapsing distinct operational paths into a single score. Fact-level measurements reference their producing method through foreign keys; where `METH-0003` or `METH-0005` appears as the via method for a given observation, downstream consumers inherit the epistemic posture of that method’s category rather than treating the numeric outcome as self-evident truth.

Confidence and uncertainty articulate complementary aspects of measurement quality that compliance frameworks require to be co-present rather than substituted for one another. Confidence, expressed on a unit interval—values such as `0.945` signal comparatively high trust, whereas `0.307` signals material doubt—communicates the assessor’s or model’s belief that the measurement correctly reflects the target quantity under stated assumptions. Uncertainty, recorded in the same fact rows as magnitudes like `279.24` or `364.07`, quantifies the dispersion or error budget around the reported value; a high-confidence reading paired with wide uncertainty still demands cautious use in threshold tests, while a moderate-confidence reading with narrow uncertainty may suffice for operational monitoring but not for attestations. The miscellaneous value field holds the measured quantity itself—`353.34`, `660.64`, `878.99`, `64.10`—and must always be read in conjunction with its via method, confidence, and uncertainty tuple; taken alone, such figures are inadmissible as evidentiary claims.

Category assignment for via methods operationalizes the principle that not all acquisition paths carry equal weight in governance decisions. Categories partition the method inventory so that policy modules may apply stricter evidentiary bars to categories associated with indirect inference, batch reconciliation, or third-party relay, while permitting lighter review for categories tied to primary observation or cryptographically anchored extraction. Because identifiers may resolve to the same logical target under different formats and issuance dates—`doi:10.1145/3641519` appears more than once in the identifier registry with distinct `identifies` bindings and issuance timestamps—category-aware measurement review prevents silent conflation of lineage snapshots taken at different pipeline stages. Auditors correlating syscall evidence with measurement facts should therefore trace a complete chain: identifier and `issueddate` establish what was named and when that naming was authoritative; format and language establish how evidence was encoded and localized; via method and category establish how values were produced; and confidence, uncertainty, and the recorded miscellaneous value jointly determine whether a given figure may enter a compliance determination without supplemental corroboration.

**t_identifier_uniquely_identifies**

| id | identifier | identifies | format | issued_date |
| --- | --- | --- | --- | --- |
| IDEN-0001 | doi:10.1145/3641519 | provenance node root | JSON | 2024-09-07 |
| IDEN-0002 | urn:isbn:9780131103627 | data pipeline stage 3 | E.164 | 2023-03-13 |
| IDEN-0003 | doi:10.1145/3641519 | container image sha256 | CSV | 2024-01-30 |
| IDEN-0004 | orcid:0000-0002-1825-0097 | data pipeline stage 3 | JSON | 2023-03-01 |
| IDEN-0005 | pmid:12345678 | metadata registry entry | E.164 | 2025-03-08 |
| IDEN-0006 | doi:10.1016/j.softx.2020.100312 | metadata registry entry | ISO-8601 | 2025-05-18 |
| IDEN-0007 | orcid:0000-0002-1825-0097 | data pipeline stage 3 | RFC-3339 | 2024-09-01 |

**fact_measurement**

| id | via_method_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| METH-0001 | METH-0003 | 0.496 | 306.26 | 353.34 |
| METH-0002 | METH-0002 | 0.945 | 279.24 | 660.64 |
| METH-0003 | METH-0005 | 0.506 | 120.70 | 878.99 |
| METH-0004 | METH-0005 | 0.307 | 364.07 | 64.10 |
| METH-0005 | METH-0001 | 0.923 | 642.96 | 897.70 |

**dim_via_method**

| id | via_method_label | via_method_category |
| --- | --- | --- |
| METH-0001 | Via Method Label 01 | Via Method Category 01 |
| METH-0002 | Via Method Label 02 | Via Method Category 02 |
| METH-0003 | Via Method Label 03 | Via Method Category 03 |
| METH-0004 | Via Method Label 04 | Via Method Category 04 |
| METH-0005 | Via Method Label 05 | Via Method Category 05 |
| METH-0006 | Via Method Label 06 | Via Method Category 06 |