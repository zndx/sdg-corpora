---
chapter_id: ch_live_subclass_to_process_6f2789
topic_id: 191
family: 01_foundation
cited_terms: ['subclass_to_process', 'attestation_min_one_signer', 'nist80053_low_impact']
model: engine-refine
---

In governed operational and compliance systems, every auditable fact must be addressable, typed, and attributable before it can support authorization, reporting, or evidentiary review. The identifier fulfills that first obligation: a stable, surrogate key that names a record without embedding semantics that would complicate migration or reconciliation. Process executions carry identifiers such as PROC-0001 through PROC-0004, each bound to a distinct operational class—incident response, data validation, telemetry aggregation, or batch ingestion—while attestation records use the parallel SIGN-0001 through SIGN-0004 namespace for Chain of Custody Review, Security Baseline Validation, and SOC 2 Type II Audit obligations. Framework references such as IMPA-0001 through IMPA-0004 likewise receive immutable keys even when their human-readable labels (SP 800-171 Rev 2, SP 800-37 Rev 2, CSF 1.1, RMF Guide) evolve across publication cycles. Identifier discipline matters because downstream joins, retention schedules, and access-control policies key off these values rather than display text; a reviewer querying exit_code for PROC-0001 must resolve the same logical record whether the underlying row was ingested yesterday or archived three years prior.

**t_subclass_to_process**

| id | process |
| --- | --- |
| PROC-0001 | incident response |
| PROC-0002 | data validation |
| PROC-0003 | telemetry aggregation |
| PROC-0004 | batch ingestion |
| PROC-0005 | data validation |
| PROC-0006 | stream processing |

**t_subclass_to_process_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| PROC-0001 | duration_seconds | xsd:decimal |
| PROC-0002 | end_time | xsd:dateTime |
| PROC-0003 | exit_code | xsd:integer |
| PROC-0004 | host_name | xsd:string |
| PROC-0005 | log_level | xsd:string |
| PROC-0006 | phase | xsd:string |
| PROC-0007 | retry_count | xsd:integer |
| PROC-0008 | scheduled_at | xsd:dateTime |

The entity denotes the object to which observable properties attach—the process run, the signed attestation, or the control-framework artifact—not the property itself and not the storage row that carries the property’s payload. When duration_seconds is recorded as 5106.96 for PROC-0001 and again as 6532.76 for PROC-0002, the decimal magnitude differs, but entity_id consistently points at the process instance entitled to that measurement. The same pattern holds for attestations: SIGN-0001 may simultaneously own an end_time of 2023-01-30T09:27:18, an exit_code of 392, and a host_name of node-b14, each stored in a separate typed container yet unified under a single entity key. Treating entity as the anchor of attribution prevents attribute definitions from collapsing into undifferentiated key-value sprawl and ensures that multi-attribute profiles—runtime telemetry on one side, signer accountability on the other—remain composable without conflating distinct business objects.

An attr names the governed dimension being asserted, while attr_type declares the validation grammar and physical store that will accept it. The canonical quartet—duration_seconds, end_time, exit_code, host_name—recurs across both process and attestation domains, but each name is meaningless for enforcement until paired with xsd:decimal, xsd:dateTime, xsd:integer, or xsd:string respectively. Type assignment is not cosmetic: end_time values such as 2024-02-25T00:58:35 and 2024-06-21T23:54:50 land only in datetime-qualified repositories, exit_code integers (684, 195, 63, 361) in integer stores, and host_name strings (worker-07, node-b14) in varchar partitions. attr_id references in value records (PROC-0002 paired with a timestamp, PROC-0003 paired with an exit_code) implement the join between semantic name and typed slot, so ingest pipelines can reject mistyped payloads before they corrupt analytics or audit trails. attr_type therefore functions as the contract boundary between schema designers, who publish allowable attributes, and operators, who must supply conforming observations.

The misc column—or, conceptually, the miscellaneous typed payload—materializes the attr–entity pairing as an evidentiary datum suitable for measurement, comparison, and disposition. Decimal durations (6219.83 seconds on PROC-0003, 2715.88 on PROC-0004) support SLA arithmetic; varchar misc values encode operational state (“closeout,” “pending,” “review,” “complete”) and environmental context (“Log Level 02”); datetime misc fixes events to absolute timelines spanning 2023-01-30 through 2025-01-11. Because misc is partitioned by attr_type rather than commingled in a single untyped column, queries inherit database-enforced integrity: a decimal cannot masquerade as a timestamp, and an integer exit_code cannot silently truncate into a string sort order. In compliance workflows, misc is the inspectable residue—what an auditor extracts when verifying that PROC-0002’s batch ingestion completed with exit_code 361 on host worker-07, or that SIGN-0004’s SOC 2 attestation closed at 6673.35 measured seconds with status complete.

Associations among framework artifacts introduce subject, target, and role as the relational vocabulary for directed, qualified links that identifiers and attributes alone cannot express. A subject (here, nist_id) initiates or owns the association: IMPA-0001 (SP 800-171 Rev 2) links twice under different role assignments, while IMPA-0002 (SP 800-37 Rev 2) and IMPA-0003 (CSF 1.1) each assert a single outbound edge. The target (at_nist_impact_level_id) receives the association’s classificatory endpoint—baseline, category 1, minimal—so that IMPA-0001 may simultaneously target IMPA-0004 as baseline context and, in a separate row, target IMPA-0006 as category 1 without collapsing distinct governance postures into one undifferentiated tag. Role qualifies how the subject participates relative to that target: reviewer on the baseline edge, contributor on the category 1 edge, observer on linkages involving SP 800-37 and CSF 1.1. This triad enables many-to-many policy graphs—SP 800-171 at baseline versus category 1, RMF Guide postures, CSF minimal tiers—while preserving provenance sufficient for access reviews and control inheritance.

**t_nist80053_low_impact**

| id | nist |
| --- | --- |
| IMPA-0001 | SP 800-171 Rev 2 |
| IMPA-0002 | SP 800-37 Rev 2 |
| IMPA-0003 | CSF 1.1 |
| IMPA-0004 | RMF Guide |
| IMPA-0005 | CSF 1.1 |
| IMPA-0006 | SP 800-218 |
| IMPA-0007 | SP 800-37 Rev 2 |
| IMPA-0008 | CSF 1.1 |

**t_nist80053_low_impact_at_n_i_s_t_impact_level**

| id | at_n_i_s_t_impact_level |
| --- | --- |
| IMPA-0001 | baseline |
| IMPA-0002 | category 1 |
| IMPA-0003 | minimal |
| IMPA-0004 | category 1 |
| IMPA-0005 | minimal |
| IMPA-0006 | minimal |
| IMPA-0007 | baseline |
| IMPA-0008 | low impact |

**t_nist80053_low_impact__at_n_i_s_t_impact_level**

| id | nist_id | at_n_i_s_t_impact_level_id | role |
| --- | --- | --- | --- |
| IMPA-0001 | IMPA-0001 | IMPA-0004 | reviewer |
| IMPA-0002 | IMPA-0003 | IMPA-0008 | observer |
| IMPA-0003 | IMPA-0002 | IMPA-0006 | observer |
| IMPA-0004 | IMPA-0001 | IMPA-0006 | contributor |
| IMPA-0005 | IMPA-0007 | IMPA-0003 | owner |
| IMPA-0006 | IMPA-0001 | IMPA-0002 | reviewer |
| IMPA-0007 | IMPA-0007 | IMPA-0001 | contributor |
| IMPA-0008 | IMPA-0008 | IMPA-0008 | reviewer |

Taken together, identifier, entity, attr, attr_type, misc, subject, target, and role constitute a layered evidence model in which keys stabilize identity, entities collect typed observations, attributes and types govern admissible facts, misc supplies verifiable content, and subject–target–role tuples encode normative relationships among standards and impact levels. Operational processes and signer attestations populate the observation layer with concrete measurements; framework registries populate the association layer with reviewer, observer, and contributor bindings to baseline and category 1 classifications. Systems that honor this separation gain defensible auditability: every reported value traces to a named entity and typed attribute, every standard citation resolves through a keyed subject to an explicit target under a declared role, and every compliance narrative can be reconstructed from evidence that was valid at capture time rather than reinterpreted after the fact.

**t_subclass_to_process_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PROC-0001 | PROC-0001 | PROC-0002 | 2024-02-25T00:58:35 |
| PROC-0002 | PROC-0001 | PROC-0008 | 2025-01-11T16:52:13 |
| PROC-0003 | PROC-0001 | PROC-0009 | 2024-01-24T01:55:59 |
| PROC-0004 | PROC-0002 | PROC-0002 | 2024-06-21T23:54:50 |
| PROC-0005 | PROC-0002 | PROC-0008 | 2023-12-17T03:43:06 |
| PROC-0006 | PROC-0002 | PROC-0009 | 2023-12-07T20:42:12 |
| PROC-0007 | PROC-0003 | PROC-0002 | 2024-06-16T15:41:50 |
| PROC-0008 | PROC-0003 | PROC-0008 | 2025-01-20T06:41:15 |

**t_subclass_to_process_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PROC-0001 | PROC-0001 | PROC-0001 | 5106.96 |
| PROC-0002 | PROC-0002 | PROC-0001 | 6532.76 |
| PROC-0003 | PROC-0003 | PROC-0001 | 6219.83 |
| PROC-0004 | PROC-0004 | PROC-0001 | 2715.88 |
| PROC-0005 | PROC-0005 | PROC-0001 | 3614.44 |
| PROC-0006 | PROC-0006 | PROC-0001 | 6690.61 |

**t_subclass_to_process_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PROC-0001 | PROC-0001 | PROC-0003 | 684 |
| PROC-0002 | PROC-0001 | PROC-0007 | 195 |
| PROC-0003 | PROC-0002 | PROC-0003 | 63 |
| PROC-0004 | PROC-0002 | PROC-0007 | 361 |
| PROC-0005 | PROC-0003 | PROC-0003 | 107 |
| PROC-0006 | PROC-0003 | PROC-0007 | 1 |
| PROC-0007 | PROC-0004 | PROC-0003 | 32 |
| PROC-0008 | PROC-0004 | PROC-0007 | 2 |

**t_subclass_to_process_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PROC-0001 | PROC-0001 | PROC-0004 | worker-07 |
| PROC-0002 | PROC-0001 | PROC-0005 | Log Level 02 |
| PROC-0003 | PROC-0001 | PROC-0006 | closeout |
| PROC-0004 | PROC-0001 | PROC-0010 | pending |
| PROC-0005 | PROC-0001 | PROC-0011 | Triggered By 05 |
| PROC-0006 | PROC-0002 | PROC-0004 | worker-07 |
| PROC-0007 | PROC-0002 | PROC-0005 | Log Level 07 |
| PROC-0008 | PROC-0002 | PROC-0006 | closeout |

**t_attestation_min_one_signer**

| id | attestation |
| --- | --- |
| SIGN-0001 | Chain of Custody Review |
| SIGN-0002 | Security Baseline Validation |
| SIGN-0003 | Chain of Custody Review |
| SIGN-0004 | SOC 2 Type II Audit |
| SIGN-0005 | HIPAA Compliance Verification |
| SIGN-0006 | Data Residency Certification |

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