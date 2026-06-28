---
chapter_id: ch_live_control_implements_eaccad
topic_id: 90
family: 03_directive_governance
cited_terms: ['control_implements', 'verification_basic', 'policy_supersedes']
model: engine-refine
---

In a compliance and governance information model, an identifier is the durable handle by which every governed object is addressed, retrieved, and correlated across operational and audit contexts. Identifiers such as IMPL-0001, VERI-0002, and SUPE-0003 are not display labels; they are stable keys that survive renaming, supersession, and cross-system integration. When a Change Advisory Board control is recorded as implementing Automated Backup Scripts under IMPL-0001, or when a Calibration certificate review is keyed as VERI-0002, the identifier binds the policy statement, the verification event, and any downstream evidence to a single canonical record. Without that binding, priority rankings, scope declarations, and attribute values cannot be reconciled across review cycles or compared year over year.

**t_control_implements**

| id | control | implements | priority | scope |
| --- | --- | --- | --- | --- |
| IMPL-0001 | Change Advisory Board | Automated Backup Scripts | 5 | regional |
| IMPL-0002 | Data Retention Schedule | Automated Backup Scripts | 3 | global |
| IMPL-0003 | Access Review Cycle | Database Audit Trails | 1 | team |
| IMPL-0004 | Data Retention Schedule | Patch Deployment Pipeline | 3 | team |
| IMPL-0005 | GDPR Data Minimization | Container Image Scanning | 1 | global |
| IMPL-0006 | Incident Response Protocol | Network Firewall Rules | 1 | global |
| IMPL-0007 | NIST SP 800-53 | Container Image Scanning | 2 | local |

**t_verification_basic**

| id | verification |
| --- | --- |
| VERI-0001 | Compliance snapshot test |
| VERI-0002 | Calibration certificate review |
| VERI-0003 | Pipeline integrity check |
| VERI-0004 | Sensor drift assessment |
| VERI-0005 | Access control audit |
| VERI-0006 | Metadata reconciliation |

An entity is the thing being described—the verification run, the control implementation, the policy lineage entry—while attr names the facet of that entity under measurement or assertion. Verification work illustrates the pattern plainly: duration_seconds, end_time, exit_code, and host_name are attributes declared once and reused wherever a verification record requires them. The entity identifier VERI-0001 may therefore accumulate multiple attribute bindings in a single execution context, as when end_time, exit_code, and host_name all attach to the same compliance snapshot test without collapsing distinct measurements into one undifferentiated field. Separating entity from attr preserves semantic clarity: the entity answers what was verified; the attribute answers which dimension of that verification is being recorded.

attr_type governs how values are represented, validated, and compared, and it is what permits heterogeneous evidence to coexist in one governance framework without type confusion. Declaring duration_seconds as xsd:decimal and end_time as xsd:dateTime establishes enforceable contracts at ingestion—quantities such as 500.97 and 4488.38 remain numeric for aggregation and thresholding, while timestamps such as 2023-02-01T08:41:13 and 2023-06-08T16:52:03 support ordering, retention windows, and correlation with incident timelines. Integer-typed exit_code and review-interval counters (182, 65, 828, 38) support pass-fail logic and numeric policy parameters; string-typed host_name and status literals (ingest-21, Log Level 02, execution, complete) carry operational context that resists silent coercion. attr_type is thus the bridge between human-readable governance language and machine-checkable conformance.

The misc value is the instantiated fact—the concrete reading, timestamp, code, or label stored for a given entity–attribute pair. In practice, misc is where verification ceases to be abstract and becomes auditable evidence: a decimal duration, a datetime boundary, an integer exit code, a varchar host identifier. Because values are typed and keyed, auditors can distinguish a failed pipeline integrity check (VERI-0003, duration_seconds 4833.98) from a sensor drift assessment (VERI-0004, 3565.06) without ambiguity about units or field meaning. misc does not float freely; it inherits meaning only through its entity, its attr, and its attr_type, which together form a traceable assertion suitable for export, replay, and dispute resolution.

**t_verification_basic_attr**

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

**t_verification_basic_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERI-0001 | VERI-0001 | VERI-0002 | 2023-02-01T08:41:13 |
| VERI-0002 | VERI-0001 | VERI-0008 | 2023-06-06T17:03:25 |
| VERI-0003 | VERI-0001 | VERI-0009 | 2025-05-09T15:15:58 |
| VERI-0004 | VERI-0002 | VERI-0002 | 2023-06-08T16:52:03 |
| VERI-0005 | VERI-0002 | VERI-0008 | 2025-05-17T22:11:58 |
| VERI-0006 | VERI-0002 | VERI-0009 | 2024-06-13T13:20:10 |
| VERI-0007 | VERI-0003 | VERI-0002 | 2023-04-20T09:43:00 |
| VERI-0008 | VERI-0003 | VERI-0008 | 2023-10-14T11:07:55 |

**t_verification_basic_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERI-0001 | VERI-0001 | VERI-0001 | 500.97 |
| VERI-0002 | VERI-0002 | VERI-0001 | 4488.38 |
| VERI-0003 | VERI-0003 | VERI-0001 | 4833.98 |
| VERI-0004 | VERI-0004 | VERI-0001 | 3565.06 |
| VERI-0005 | VERI-0005 | VERI-0001 | 2509.98 |
| VERI-0006 | VERI-0006 | VERI-0001 | 2611.50 |

**t_verification_basic_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERI-0001 | VERI-0001 | VERI-0003 | 182 |
| VERI-0002 | VERI-0001 | VERI-0007 | 65 |
| VERI-0003 | VERI-0002 | VERI-0003 | 828 |
| VERI-0004 | VERI-0002 | VERI-0007 | 38 |
| VERI-0005 | VERI-0003 | VERI-0003 | 137 |
| VERI-0006 | VERI-0003 | VERI-0007 | 337 |
| VERI-0007 | VERI-0004 | VERI-0003 | 858 |
| VERI-0008 | VERI-0004 | VERI-0007 | 112 |

**t_verification_basic_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERI-0001 | VERI-0001 | VERI-0004 | ingest-21 |
| VERI-0002 | VERI-0001 | VERI-0005 | Log Level 02 |
| VERI-0003 | VERI-0001 | VERI-0006 | execution |
| VERI-0004 | VERI-0001 | VERI-0010 | complete |
| VERI-0005 | VERI-0001 | VERI-0011 | Triggered By 05 |
| VERI-0006 | VERI-0002 | VERI-0004 | edge-03 |
| VERI-0007 | VERI-0002 | VERI-0005 | Log Level 07 |
| VERI-0008 | VERI-0002 | VERI-0006 | initiation |

priority and scope allocate attention and authority within the control portfolio. Priority ranks competing implementations when resources, remediation windows, or escalation paths must be ordered: Access Review Cycle mapped to Database Audit Trails at priority 1 signals precedence over Data Retention Schedule implementations at priority 3 or a Change Advisory Board linkage at priority 5, even when multiple controls address overlapping risk domains. Scope declares the jurisdictional or organizational envelope—regional for IMPL-0001, global for IMPL-0002, team for IMPL-0003 and IMPL-0004—so that the same control name does not imply uniform applicability. A global backup obligation and a team-scoped patch pipeline may both be valid simultaneously; scope prevents inappropriate inheritance of requirements across boundaries that policy has deliberately separated.

reviewcycledays and language extend governance from point-in-time compliance to sustained, locale-aware maintenance. reviewcycledays encodes the mandated re-examination interval for superseding policy relationships: Privacy Impact Assessment replacing Legacy Vendor Checklist on a 262-day cycle, Incident Response Protocol on 131 or 336 days depending on lineage, Data Residency Rule on 716 days. These intervals operationalize the duty to revalidate controls before drift becomes exposure. language, here uniformly es across SUPE-0001 through SUPE-0004, designates the authoritative linguistic edition under which stakeholders interpret obligations—critical when supersession chains (Incident Response Protocol over Legacy Data Handling or Draft Audit Logging) must be read, attested, and published in the governing tongue. Taken together, identifier, entity, attr, attr_type, misc, priority, scope, reviewcycledays, and language define a coherent evidence architecture: entities are named, attributes are typed, values are anchored, controls are ranked and bounded, and policies are renewed and communicated on predictable cycles that auditors and operators can rely upon in practice.

**t_policy_supersedes**

| id | policy | supersedes | review_cycle_days | language |
| --- | --- | --- | --- | --- |
| SUPE-0001 | Privacy Impact Assessment | Legacy Vendor Checklist | 262 | es |
| SUPE-0002 | Incident Response Protocol | Legacy Data Handling | 131 | es |
| SUPE-0003 | Data Residency Rule | Legacy Vendor Checklist | 716 | es |
| SUPE-0004 | Incident Response Protocol | Draft Audit Logging | 336 | es |