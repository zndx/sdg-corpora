---
chapter_id: ch_live_labrun_subclass_a09aa9
topic_id: 72
family: 02_observation_measurement
cited_terms: ['labrun_subclass', 'attestation_about_compliance_claim', 'artifact_not_revoked']
model: engine-refine
---

Laboratory run subclasses are identified by stable keys such as LABR-0001 through LABR-0004, each bound to a named execution context—CellCulture-Exp12, FlowCyt-Panel9, ELISA-Plate88, PCR-Run-Alpha7—and traced to an originating input sample like REVO-0004 or REVO-0001. These identifiers serve as the immutable anchor for all downstream metadata; they do not change across revisions, and every attribute value, attestation, and revocation check resolves back to them. The same identification discipline applies to artifacts, where keys such as REVO-0001 through REVO-0004 denote concrete deliverables—audit-log-sept, compliance-report-x, schema-def-current, dataset-sanitized—each paired with a secondary reference like backup-manifest-9 or runtime-env-prod that establishes lineage.

**t_artifact_not_revoked**

| id | artifact | artifact_2 |
| --- | --- | --- |
| REVO-0001 | audit-log-sept | backup-manifest-9 |
| REVO-0002 | compliance-report-x | inference-pipeline-3 |
| REVO-0003 | schema-def-current | backup-manifest-9 |
| REVO-0004 | dataset-sanitized | runtime-env-prod |
| REVO-0005 | audit-log-sept | backup-manifest-9 |
| REVO-0006 | compliance-report-x | staging-logs-v2 |

Attributes are declared as typed properties against these entities. A lab run subclass may carry duration_seconds as an xsd:decimal, end_time as an xsd:dateTime, exit_code as an xsd:integer, and host_name as an xsd:string; an artifact may carry checksum, created_date, identifier, and license, the latter typed as cco:DesignativeICE. The attr_type column encodes the XML Schema or custom namespace that governs serialization, validation, and query semantics. Values are stored in type-dispatched tables—t_labrun_subclass_val_decimal for numeric measures such as 7187.70, 5360.85, 3249.87, and 649.77; t_labrun_subclass_val_datetime for timestamps like 2023-06-03T03:48:13 and 2024-12-03T15:21:58; t_labrun_subclass_val_int for integer metrics including 241, 320, 688, and 479; and t_labrun_subclass_val_varchar for free-form strings such as node-b14, Log Level 02, closeout, and pending. Each value row binds an entity_id to an attr_id, ensuring that the same attribute definition can be instantiated across multiple entities without ambiguity.

**t_labrun_subclass**

| id | labrun | input_sample |
| --- | --- | --- |
| LABR-0001 | CellCulture-Exp12 | REVO-0004 |
| LABR-0002 | FlowCyt-Panel9 | REVO-0001 |
| LABR-0003 | ELISA-Plate88 | REVO-0005 |
| LABR-0004 | PCR-Run-Alpha7 | REVO-0005 |
| LABR-0005 | MassSpec-MS19 | REVO-0006 |
| LABR-0006 | NMR-Stand-04A | REVO-0004 |
| LABR-0007 | FlowCyt-Panel9 | REVO-0002 |
| LABR-0008 | RNASeq-Lib15 | REVO-0006 |

**t_labrun_subclass_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| LABR-0001 | duration_seconds | xsd:decimal |
| LABR-0002 | end_time | xsd:dateTime |
| LABR-0003 | exit_code | xsd:integer |
| LABR-0004 | host_name | xsd:string |
| LABR-0005 | log_level | xsd:string |
| LABR-0006 | phase | xsd:string |
| LABR-0007 | retry_count | xsd:integer |
| LABR-0008 | scheduled_at | xsd:dateTime |

**t_labrun_subclass_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LABR-0001 | LABR-0001 | LABR-0002 | 2023-06-03T03:48:13 |
| LABR-0002 | LABR-0001 | LABR-0008 | 2024-12-03T15:21:58 |
| LABR-0003 | LABR-0001 | LABR-0009 | 2023-08-16T05:52:21 |
| LABR-0004 | LABR-0002 | LABR-0002 | 2024-08-31T23:33:13 |
| LABR-0005 | LABR-0002 | LABR-0008 | 2025-02-13T01:21:55 |
| LABR-0006 | LABR-0002 | LABR-0009 | 2023-04-09T20:59:10 |
| LABR-0007 | LABR-0003 | LABR-0002 | 2024-04-14T13:26:56 |
| LABR-0008 | LABR-0003 | LABR-0008 | 2024-07-04T01:41:44 |

**t_labrun_subclass_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LABR-0001 | LABR-0001 | LABR-0001 | 7187.70 |
| LABR-0002 | LABR-0002 | LABR-0001 | 5360.85 |
| LABR-0003 | LABR-0003 | LABR-0001 | 3249.87 |
| LABR-0004 | LABR-0004 | LABR-0001 | 649.77 |
| LABR-0005 | LABR-0005 | LABR-0001 | 3590.34 |
| LABR-0006 | LABR-0006 | LABR-0001 | 456.45 |
| LABR-0007 | LABR-0007 | LABR-0001 | 5720.89 |
| LABR-0008 | LABR-0008 | LABR-0001 | 7012.99 |

**t_labrun_subclass_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LABR-0001 | LABR-0001 | LABR-0003 | 241 |
| LABR-0002 | LABR-0001 | LABR-0007 | 320 |
| LABR-0003 | LABR-0002 | LABR-0003 | 688 |
| LABR-0004 | LABR-0002 | LABR-0007 | 479 |
| LABR-0005 | LABR-0003 | LABR-0003 | 481 |
| LABR-0006 | LABR-0003 | LABR-0007 | 200 |
| LABR-0007 | LABR-0004 | LABR-0003 | 208 |
| LABR-0008 | LABR-0004 | LABR-0007 | 121 |

**t_labrun_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LABR-0001 | LABR-0001 | LABR-0004 | node-b14 |
| LABR-0002 | LABR-0001 | LABR-0005 | Log Level 02 |
| LABR-0003 | LABR-0001 | LABR-0006 | closeout |
| LABR-0004 | LABR-0001 | LABR-0010 | pending |
| LABR-0005 | LABR-0001 | LABR-0011 | Triggered By 05 |
| LABR-0006 | LABR-0002 | LABR-0004 | ingest-21 |
| LABR-0007 | LABR-0002 | LABR-0005 | Log Level 07 |
| LABR-0008 | LABR-0002 | LABR-0006 | closeout |

**t_artifact_not_revoked_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| REVO-0001 | checksum | xsd:string |
| REVO-0002 | created_date | xsd:date |
| REVO-0003 | identifier | cco:DesignativeICE |
| REVO-0004 | license | xsd:string |
| REVO-0005 | mime_type | xsd:string |
| REVO-0006 | size_bytes | xsd:long |
| REVO-0007 | uri | xsd:string |
| REVO-0008 | version | xsd:integer |

**t_artifact_not_revoked_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| REVO-0001 | REVO-0001 | REVO-0002 | 2024-01-18 |
| REVO-0002 | REVO-0002 | REVO-0002 | 2023-09-26 |
| REVO-0003 | REVO-0003 | REVO-0002 | 2023-01-26 |
| REVO-0004 | REVO-0004 | REVO-0002 | 2024-08-03 |
| REVO-0005 | REVO-0005 | REVO-0002 | 2024-04-14 |
| REVO-0006 | REVO-0006 | REVO-0002 | 2023-07-20 |

**t_artifact_not_revoked_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| REVO-0001 | REVO-0001 | REVO-0006 | 140 |
| REVO-0002 | REVO-0001 | REVO-0008 | 2 |
| REVO-0003 | REVO-0002 | REVO-0006 | 115 |
| REVO-0004 | REVO-0002 | REVO-0008 | 2 |
| REVO-0005 | REVO-0003 | REVO-0006 | 293 |
| REVO-0006 | REVO-0003 | REVO-0008 | 12 |
| REVO-0007 | REVO-0004 | REVO-0006 | 361 |
| REVO-0008 | REVO-0004 | REVO-0008 | 1 |

**t_artifact_not_revoked_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| REVO-0001 | REVO-0001 | REVO-0001 | c0ffee42 |
| REVO-0002 | REVO-0001 | REVO-0003 | ref-8842 |
| REVO-0003 | REVO-0001 | REVO-0004 | Apache-2.0 |
| REVO-0004 | REVO-0001 | REVO-0009 | rack-7 |
| REVO-0005 | REVO-0001 | REVO-0005 | text/plain |
| REVO-0006 | REVO-0001 | REVO-0010 | Name 06 |
| REVO-0007 | REVO-0001 | REVO-0011 | analytics |
| REVO-0008 | REVO-0001 | REVO-0012 | Tags 08 |

Attestations introduce a layer of certified claims about entity state. Each attestation is identified by a key such as CLAI-0001 through CLAI-0004, labeled Attestation Label 01 through Attestation Label 04, and categorized under Attestation Category 01 through Attestation Category 04. The factual core of an attestation is captured in a measure table that records a value—571.54, 362.06, 96.81, 16.44—alongside a confidence score ranging from 0.051 to 0.987 and an uncertainty magnitude spanning 91.51 to 986.76. Confidence quantifies the degree of belief in the attested value; uncertainty quantifies the dispersion or error bound around it. An attestation with confidence 0.987 and uncertainty 859.08 signals high certainty but wide variance, whereas confidence 0.051 paired with uncertainty 91.51 indicates a claim that is both weakly held and tightly bounded—a pattern that demands distinct handling in downstream risk assessments.

The entity-attr-value triad forms the backbone of this model: an entity (identified by entity_id) owns a set of attributes (identified by attr_id), and each attribute holds one or more typed values. This design permits heterogeneous data—dates, decimals, integers, strings—to coexist under a single conceptual umbrella while preserving type safety through the attr_type registry. Revocation tracking operates analogously; artifacts that have not been revoked are cataloged with their own attribute definitions and value tables, where dates such as 2024-01-18 and 2023-09-26, integers like 140 and 115, and strings including c0ffee42, ref-8842, Apache-2.0, and rack-7 are bound to the same entity-attr linkage pattern. The separation of attribute schema from attribute values ensures that schema evolution—adding a new attr_name or retyping an existing one—does not invalidate historical data.

In practice, the interplay of identifier, attribute, category, confidence, and uncertainty enables auditable provenance. A reviewer can trace a decimal value of 7187.70 on entity LABR-0001 back through its attr_id to the definition duration_seconds (xsd:decimal), then cross-reference the attestation CLAI-0001 (category Attestation Category 01) that certifies a value of 571.54 with confidence 0.051 and uncertainty 91.51. The low confidence and moderate uncertainty flag the claim for manual review, while the category label provides the governance context—whether this is a quality gate, a compliance checkpoint, or an operational alert. The same discipline applies to artifacts: the checksum c0ffee42 on REVO-0001, created 2024-01-18, licensed under Apache-2.0, and hosted on rack-7, can be attested, categorized, and scored for confidence and uncertainty in exactly the same framework, unifying laboratory metadata and software artifact governance under a single attestation model.

**fact_attestation**

| id | attestation_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| CLAI-0001 | CLAI-0004 | 0.051 | 91.51 | 571.54 |
| CLAI-0002 | CLAI-0001 | 0.840 | 986.76 | 362.06 |
| CLAI-0003 | CLAI-0003 | 0.482 | 606.80 | 96.81 |
| CLAI-0004 | CLAI-0004 | 0.987 | 859.08 | 16.44 |
| CLAI-0005 | CLAI-0003 | 0.738 | 864.19 | 799.64 |

**dim_attestation**

| id | attestation_label | attestation_category |
| --- | --- | --- |
| CLAI-0001 | Attestation Label 01 | Attestation Category 01 |
| CLAI-0002 | Attestation Label 02 | Attestation Category 02 |
| CLAI-0003 | Attestation Label 03 | Attestation Category 03 |
| CLAI-0004 | Attestation Label 04 | Attestation Category 04 |
| CLAI-0005 | Attestation Label 05 | Attestation Category 05 |
| CLAI-0006 | Attestation Label 06 | Attestation Category 06 |