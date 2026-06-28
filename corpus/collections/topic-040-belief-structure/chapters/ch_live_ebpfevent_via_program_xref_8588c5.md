---
chapter_id: ch_live_ebpfevent_via_program_xref_8588c5
topic_id: 40
family: 04_ebpf_kernel
cited_terms: ['ebpfevent_via_program_xref', 'soc2_trust_criterion', 'directive_authored_and_applies']
model: engine-refine
---

An entity is the governed object under observation or control—the operational incident, the trust criterion, the regulatory directive—whose identity must remain stable across ingestion, audit, and enforcement cycles. In enterprise telemetry and compliance registries alike, that stability is conferred by the identifier, a durable surrogate key that outlives renaming, reclassification, or downstream replication. When a data-lake synchronisation failure is recorded as DATA_LAKE_SYNC_FAIL and bound to XREF-0001, or when CyberShield Ltd’s Transaction Accuracy criterion is anchored at CRIT-0001 and HIPAA Audit Logging at APPL-0001, the identifier does not describe behaviour; it permits unambiguous reference so that attributes, evidence, and lineage can attach to the same subject without collision across workers, jurisdictions, or reporting periods.

**t_soc2_trust_criterion**

| id | soc | soc2_trust_criterion |
| --- | --- | --- |
| CRIT-0001 | CyberShield Ltd | Transaction Accuracy |
| CRIT-0002 | DataVault Inc | Transaction Accuracy |
| CRIT-0003 | CloudScale Services | Data Privacy |
| CRIT-0004 | HealthSys Networks | Security |
| CRIT-0005 | RetailChain Partners | Security |
| CRIT-0006 | FinTech Global | Transaction Accuracy |

**t_soc2_trust_criterion_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| CRIT-0001 | effective_date | xsd:date |
| CRIT-0002 | enforcement | xsd:string |
| CRIT-0003 | mandatory | xsd:boolean |
| CRIT-0004 | priority | xsd:integer |
| CRIT-0005 | review_cycle_days | xsd:integer |
| CRIT-0006 | scope | xsd:string |
| CRIT-0007 | encoding | xsd:string |
| CRIT-0008 | label_text | xsd:string |

**t_soc2_trust_criterion_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CRIT-0001 | CRIT-0001 | CRIT-0003 | false |
| CRIT-0002 | CRIT-0002 | CRIT-0003 | false |
| CRIT-0003 | CRIT-0003 | CRIT-0003 | true |
| CRIT-0004 | CRIT-0004 | CRIT-0003 | false |
| CRIT-0005 | CRIT-0005 | CRIT-0003 | false |
| CRIT-0006 | CRIT-0006 | CRIT-0003 | false |

**t_soc2_trust_criterion_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CRIT-0001 | CRIT-0001 | CRIT-0004 | 2 |
| CRIT-0002 | CRIT-0001 | CRIT-0005 | 749 |
| CRIT-0003 | CRIT-0002 | CRIT-0004 | 4 |
| CRIT-0004 | CRIT-0002 | CRIT-0005 | 767 |
| CRIT-0005 | CRIT-0003 | CRIT-0004 | 3 |
| CRIT-0006 | CRIT-0003 | CRIT-0005 | 559 |
| CRIT-0007 | CRIT-0004 | CRIT-0004 | 1 |
| CRIT-0008 | CRIT-0004 | CRIT-0005 | 187 |

**t_soc2_trust_criterion_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CRIT-0001 | CRIT-0001 | CRIT-0007 | Encoding 01 |
| CRIT-0002 | CRIT-0001 | CRIT-0002 | Enforcement 02 |
| CRIT-0003 | CRIT-0001 | CRIT-0008 | change rationale |
| CRIT-0004 | CRIT-0001 | CRIT-0009 | en |
| CRIT-0005 | CRIT-0001 | CRIT-0006 | Scope 05 |
| CRIT-0006 | CRIT-0002 | CRIT-0007 | Encoding 06 |
| CRIT-0007 | CRIT-0002 | CRIT-0002 | Enforcement 07 |
| CRIT-0008 | CRIT-0002 | CRIT-0008 | audit excerpt |

Attributes name the measurable or declarative facets that make an entity legible to policy engines and human reviewers. Duration in seconds, end time, exit code, and host name characterise pipeline execution; effective date, enforcement mode, mandatory flag, and priority rank govern how a SOC 2 trust criterion or a directive authored by the FDA Compliance Office or NIST Cyber Division is to be interpreted in force. Each attribute is registered once in a catalogue and referenced by identifier thereafter, so that duration_seconds and end_time are not redefined per event and mandatory does not acquire conflicting semantics between APPL-0001 and CRIT-0003. Attribute identity is thus orthogonal to entity identity: the same attr_id may appear on many entities, and one entity may carry many attributes, with the pairing resolved only at the value layer.

**t_soc2_trust_criterion_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CRIT-0001 | CRIT-0001 | CRIT-0001 | 2025-04-05 |
| CRIT-0002 | CRIT-0002 | CRIT-0001 | 2024-03-02 |
| CRIT-0003 | CRIT-0003 | CRIT-0001 | 2023-07-21 |
| CRIT-0004 | CRIT-0004 | CRIT-0001 | 2023-05-30 |
| CRIT-0005 | CRIT-0005 | CRIT-0001 | 2023-01-08 |
| CRIT-0006 | CRIT-0006 | CRIT-0001 | 2024-01-19 |

**t_directive_authored_and_applies**

| id | directive | authored_by | applies_to |
| --- | --- | --- | --- |
| APPL-0001 | HIPAA Audit Logging | FDA Compliance Office | ISO Certified Facilities |
| APPL-0002 | FDA 21 CFR Compliance | HSA Regulatory Board | Edge Gateway Nodes |
| APPL-0003 | ISO 27001 Access Control | NIST Cyber Division | Cloud Storage Buckets |
| APPL-0004 | FDA 21 CFR Compliance | CISA National Director | Customer PII Datasets |
| APPL-0005 | ISO 27001 Access Control | FDA Compliance Office | Financial Ledger Tables |
| APPL-0006 | GDPR Data Retention | European Commission | HIPAA Covered Entities |

**t_directive_authored_and_applies_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| APPL-0001 | effective_date | xsd:date |
| APPL-0002 | enforcement | xsd:string |
| APPL-0003 | mandatory | xsd:boolean |
| APPL-0004 | priority | xsd:integer |
| APPL-0005 | review_cycle_days | xsd:integer |
| APPL-0006 | scope | xsd:string |
| APPL-0007 | encoding | xsd:string |
| APPL-0008 | label_text | xsd:string |

**t_directive_authored_and_applies_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| APPL-0001 | APPL-0001 | APPL-0003 | true |
| APPL-0002 | APPL-0002 | APPL-0003 | true |
| APPL-0003 | APPL-0003 | APPL-0003 | true |
| APPL-0004 | APPL-0004 | APPL-0003 | true |
| APPL-0005 | APPL-0005 | APPL-0003 | false |
| APPL-0006 | APPL-0006 | APPL-0003 | false |

**t_directive_authored_and_applies_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| APPL-0001 | APPL-0001 | APPL-0001 | 2023-01-05 |
| APPL-0002 | APPL-0002 | APPL-0001 | 2024-10-27 |
| APPL-0003 | APPL-0003 | APPL-0001 | 2025-04-09 |
| APPL-0004 | APPL-0004 | APPL-0001 | 2024-01-05 |
| APPL-0005 | APPL-0005 | APPL-0001 | 2023-12-27 |
| APPL-0006 | APPL-0006 | APPL-0001 | 2023-04-20 |

**t_directive_authored_and_applies_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| APPL-0001 | APPL-0001 | APPL-0004 | 5 |
| APPL-0002 | APPL-0001 | APPL-0005 | 736 |
| APPL-0003 | APPL-0002 | APPL-0004 | 5 |
| APPL-0004 | APPL-0002 | APPL-0005 | 165 |
| APPL-0005 | APPL-0003 | APPL-0004 | 3 |
| APPL-0006 | APPL-0003 | APPL-0005 | 417 |
| APPL-0007 | APPL-0004 | APPL-0004 | 1 |
| APPL-0008 | APPL-0004 | APPL-0005 | 521 |

**t_directive_authored_and_applies_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| APPL-0001 | APPL-0001 | APPL-0007 | Encoding 01 |
| APPL-0002 | APPL-0001 | APPL-0002 | Enforcement 02 |
| APPL-0003 | APPL-0001 | APPL-0008 | pre-release note |
| APPL-0004 | APPL-0001 | APPL-0009 | ja |
| APPL-0005 | APPL-0001 | APPL-0006 | Scope 05 |
| APPL-0006 | APPL-0002 | APPL-0007 | Encoding 06 |
| APPL-0007 | APPL-0002 | APPL-0002 | Enforcement 07 |
| APPL-0008 | APPL-0002 | APPL-0008 | pre-release note |

Attr type supplies the contract under which values may be stored, compared, and validated. Assignment to an XSD-aligned type—xsd:decimal for elapsed runtime, xsd:dateTime for termination timestamps, xsd:integer for process exit codes, xsd:string for originating hosts, xsd:date for criterion effective dates, xsd:boolean for mandatory flags—determines which value store receives a fact, which comparators apply in rule evaluation, and which coercions are forbidden at ingest. A duration of 523.38 seconds and an exit code of 165 belong in decimal and integer stores respectively; conflating them would corrupt aggregation of runtimes or miscount failure rates. Type discipline also bounds audit narrative: a reviewer may trust that 2024-04-10T05:27:34 is a genuine instant, that 2025-04-05 marks criterion commencement, and that mandatory rendered as true for APPL-0001 through APPL-0004 denotes binding obligation rather than lexical coincidence.

The misc dimension—miscellaneous only in name—is the typed payload itself, the evidentiary residue that satisfies an attribute on a specific entity. Each value row is a triple in practice: entity_id selects the governed subject, attr_id selects the facet, and value carries the fact under the attr type’s constraints. Thus XREF-0001 may simultaneously hold worker-07 as host_name, 523.38 under duration_seconds, 165 as exit_code, and 2024-04-10T05:27:34 as end_time, while XREF-0002 inherits a distinct exit_code of 408 and a separate end_time without overwriting sibling records. On the compliance plane, CRIT-0003 carries mandatory false against Data Privacy for HealthSys Networks even as CRIT-0004 records mandatory true under Security, and APPL-0002’s enforcement string Enforcement 02 sits alongside priority 736—heterogeneous misc values unified only by their shared referencing grammar.

Partitioning misc across type-specific stores is an operational necessity, not an ornamental normalisation. Datetime, decimal, integer, varchar, boolean, and date tables each honour a single comparison algebra, permitting index-friendly range scans on intervals such as 2023-11-22T11:52:36 through 2023-06-01T11:10:59, summation of durations reaching 4000.50 on BATCH_ETL_COMPLETE-bound XREF-0004, and boolean filtering that separates optional from compulsory controls. VARCHAR misc further accommodates semi-structured tokens—Log Level 02, review, failed, Encoding 01, pre-release note, locale markers such as en and ja—where strict typing would foreclose legitimate governance vocabulary. The pattern repeats across ebpfevent programme cross-references, SOC 2 trust criteria for CloudScale Services and DataVault Inc, and directives applying to Edge Gateway Nodes or Customer PII Datasets: one entity spine, one attribute vocabulary, many typed misc depositions.

**t_ebpfevent_via_program_xref**

| id | ebpfevent |
| --- | --- |
| XREF-0001 | DATA_LAKE_SYNC_FAIL |
| XREF-0002 | DATA_LAKE_SYNC_FAIL |
| XREF-0003 | TELEMETRY_HEARTBEAT |
| XREF-0004 | BATCH_ETL_COMPLETE |
| XREF-0005 | BATCH_ETL_COMPLETE |
| XREF-0006 | BATCH_ETL_COMPLETE |
| XREF-0007 | AUDIT_LOG_ROTATE |
| XREF-0008 | SYS_METRIC_COLLECT_9 |

**t_ebpfevent_via_program_xref_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| XREF-0001 | duration_seconds | xsd:decimal |
| XREF-0002 | end_time | xsd:dateTime |
| XREF-0003 | exit_code | xsd:integer |
| XREF-0004 | host_name | xsd:string |
| XREF-0005 | log_level | xsd:string |
| XREF-0006 | phase | xsd:string |
| XREF-0007 | retry_count | xsd:integer |
| XREF-0008 | scheduled_at | xsd:dateTime |

**t_ebpfevent_via_program_xref_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| XREF-0001 | XREF-0001 | XREF-0002 | 2024-04-10T05:27:34 |
| XREF-0002 | XREF-0001 | XREF-0008 | 2023-11-22T11:52:36 |
| XREF-0003 | XREF-0001 | XREF-0009 | 2023-03-12T23:52:23 |
| XREF-0004 | XREF-0002 | XREF-0002 | 2023-06-01T11:10:59 |
| XREF-0005 | XREF-0002 | XREF-0008 | 2025-03-29T17:45:15 |
| XREF-0006 | XREF-0002 | XREF-0009 | 2025-05-05T19:52:00 |
| XREF-0007 | XREF-0003 | XREF-0002 | 2025-04-08T16:02:54 |
| XREF-0008 | XREF-0003 | XREF-0008 | 2023-08-28T04:07:50 |

**t_ebpfevent_via_program_xref_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| XREF-0001 | XREF-0001 | XREF-0001 | 523.38 |
| XREF-0002 | XREF-0002 | XREF-0001 | 5096.06 |
| XREF-0003 | XREF-0003 | XREF-0001 | 3292.30 |
| XREF-0004 | XREF-0004 | XREF-0001 | 4000.50 |
| XREF-0005 | XREF-0005 | XREF-0001 | 6997.28 |
| XREF-0006 | XREF-0006 | XREF-0001 | 6461.53 |
| XREF-0007 | XREF-0007 | XREF-0001 | 396.42 |
| XREF-0008 | XREF-0008 | XREF-0001 | 2149.89 |

**t_ebpfevent_via_program_xref_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| XREF-0001 | XREF-0001 | XREF-0003 | 165 |
| XREF-0002 | XREF-0001 | XREF-0007 | 480 |
| XREF-0003 | XREF-0002 | XREF-0003 | 408 |
| XREF-0004 | XREF-0002 | XREF-0007 | 150 |
| XREF-0005 | XREF-0003 | XREF-0003 | 507 |
| XREF-0006 | XREF-0003 | XREF-0007 | 419 |
| XREF-0007 | XREF-0004 | XREF-0003 | 413 |
| XREF-0008 | XREF-0004 | XREF-0007 | 9 |

**t_ebpfevent_via_program_xref_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| XREF-0001 | XREF-0001 | XREF-0004 | worker-07 |
| XREF-0002 | XREF-0001 | XREF-0005 | Log Level 02 |
| XREF-0003 | XREF-0001 | XREF-0006 | review |
| XREF-0004 | XREF-0001 | XREF-0010 | failed |
| XREF-0005 | XREF-0001 | XREF-0011 | Triggered By 05 |
| XREF-0006 | XREF-0002 | XREF-0004 | ingest-21 |
| XREF-0007 | XREF-0002 | XREF-0005 | Log Level 07 |
| XREF-0008 | XREF-0002 | XREF-0006 | execution |

Taken together, identifier, entity, attr, attr_type, and misc constitute the referential skeleton on which evidence-based control rests. Identifiers stabilise subjects; attributes declare what may be said about them; attr types enforce how it may be said; misc records what was said, when, and in what form. An auditor tracing DATA_LAKE_SYNC_FAIL from XREF-0001 through host_name worker-07 to exit_code 165 reasons over the same primitives as a compliance officer weighing whether Transaction Accuracy at priority 2 or Data Privacy at priority 4 demands precedence, or whether ISO 27001 Access Control, mandatory and effective 2025-04-09, applies with equal force to Cloud Storage Buckets and Customer PII Datasets. The architecture does not merely catalogue facts; it preserves interpretability under scale, so that operational telemetry and regulatory metadata remain commensurable inputs to a single governance calculus.