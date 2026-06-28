---
chapter_id: ch_live_lineage_edge_with_confidence_8611c5
topic_id: 119
family: 05_provo_lineage
cited_terms: ['lineage_edge_with_confidence', 'control_min_one_owner', 'policy_applies_to']
model: engine-refine
---

In governed data environments, every assertion about a control, policy, or lineage relationship must be anchored to a durable identifier that survives renames, migrations, and cross-system reconciliation. Identifiers such as OWNE-0001 through OWNE-0004 designate concrete control obligations—Rate Limit Threshold, Encryption At Rest, RBAC Assignment Policy, Backup Retention Directive—while APPL-0001 through APPL-0004 bind higher-order policy instruments (Cloud Security Baseline, Zero Trust Architecture Guideline, GDPR Compliance Directive, Data Retention Standard) to the entities they govern. The identifier is not merely a surrogate key; it is the join surface across ownership registries, applicability matrices, attribute catalogs, and evidentiary value stores, and auditors treat identifier stability as a prerequisite for demonstrating that a control assessed in one reporting period is the same control cited in the next.

**t_control_min_one_owner**

| id | control |
| --- | --- |
| OWNE-0001 | Rate Limit Threshold |
| OWNE-0002 | Encryption At Rest |
| OWNE-0003 | RBAC Assignment Policy |
| OWNE-0004 | Backup Retention Directive |
| OWNE-0005 | MFA Enforcement |
| OWNE-0006 | Change Approval Workflow |
| OWNE-0007 | Change Approval Workflow |

**t_control_min_one_owner_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| OWNE-0001 | effective_date | xsd:date |
| OWNE-0002 | enforcement | xsd:string |
| OWNE-0003 | mandatory | xsd:boolean |
| OWNE-0004 | priority | xsd:integer |
| OWNE-0005 | review_cycle_days | xsd:integer |
| OWNE-0006 | scope | xsd:string |
| OWNE-0007 | encoding | xsd:string |
| OWNE-0008 | label_text | xsd:string |

Entity denotes the governed object to which typed facts attach, and attr names the dimension along which those facts are expressed. A single entity may carry multiple attributes—effective_date, enforcement, mandatory, priority—each registered under OWNE-0001 through OWNE-0004 in the attribute catalog, while entity_id in the value registries points back to the control instance whose posture is being recorded. This separation of entity from attr prevents conflation of what is being controlled with how it is being described; Encryption At Rest (OWNE-0002) and RBAC Assignment Policy (OWNE-0003) remain distinct entities even when both share a mandatory attribute, and governance reviewers rely on the entity–attr pairing to determine whether a finding applies to configuration, access, or operational procedure.

Attr type establishes the interpretive contract under which misc values may be admitted, compared, and enforced. Declarations of xsd:date, xsd:string, xsd:boolean, and xsd:integer compel storage and validation in segregated value domains rather than in a single undifferentiated text field, so that 2023-12-25 and 2025-01-07 are recognized as calendar facts, false and true as compliance predicates, 5 and 705 as ordinal or numeric thresholds, and Encoding 01 or audit excerpt as lexical evidence. Where attr type is honored at ingest, downstream rules can reject incoherent bindings—an integer priority cannot be substituted for a boolean mandatory flag—and where it is neglected, reconciliation across OWNE-0001 through OWNE-0004 becomes a manual exercise in guesswork that undermines both automation and audit defensibility.

EffectiveDate governs temporal jurisdiction: a policy or control binding does not obligate until the stated calendar boundary is reached, and it may cease to obligate when superseded. Applicability records carry effective_date values such as 2025-01-11 for Cloud Security Baseline, 2023-03-13 for Zero Trust Architecture Guideline, 2024-06-14 for GDPR Compliance Directive, and 2024-05-03 for Data Retention Standard, each paired with an applies_to reference that specifies which control entity falls within scope. Control-level effective_date attributes recorded as 2023-12-25, 2023-01-26, 2024-02-04, and 2025-01-07 further localize when individual enforcement parameters take effect, and compliance officers routinely intersect these dates with assessment windows to determine whether a deviation was permissible, latent, or a true violation.

**t_policy_applies_to**

| id | policy | applies_to | effective_date | label_text |
| --- | --- | --- | --- | --- |
| APPL-0001 | Cloud Security Baseline | OWNE-0004 | 2025-01-11 | audit excerpt |
| APPL-0002 | Zero Trust Architecture Guideline | OWNE-0007 | 2023-03-13 | nightly summary |
| APPL-0003 | GDPR Compliance Directive | OWNE-0005 | 2024-06-14 | nightly summary |
| APPL-0004 | Data Retention Standard | OWNE-0002 | 2024-05-03 | pre-release note |
| APPL-0005 | Cloud Security Baseline | OWNE-0004 | 2024-11-13 | nightly summary |
| APPL-0006 | Incident Response Procedure | OWNE-0006 | 2023-05-19 | change rationale |
| APPL-0007 | Zero Trust Architecture Guideline | OWNE-0001 | 2024-07-03 | nightly summary |

LabelText supplies the human-legible provenance and intent that identifiers and typed values alone cannot convey. Values such as audit excerpt, nightly summary, and pre-release note annotate why a policy applicability row exists and under what operational context it should be interpreted, distinguishing a Cloud Security Baseline binding documented from audit evidence from a Data Retention Standard binding tagged for pre-release review. Label text does not replace machine-readable attr values; it orients reviewers and incident responders who must decide, in minutes rather than in query cycles, whether a cited control falls within the evidentiary frame of an investigation or a release gate.

RecordedAt and unit extend the same evidentiary discipline to lineage and measurement assertions that attr and entity extend to controls. RecordedAt timestamps—including 2024-07-21T21:36:51 for an ml_training_dataset_prep lineage edge and 2023-02-17T19:37:00 for a data_lake_warehouse_sync edge—establish when a confidence judgment was captured, which matters when partial_match and statistical_overlap assessments are later superseded by 95_percent determinations; without recordedAt, drift in data provenance cannot be ordered or attributed. Unit qualifies the numeric or comparative semantics of a lineage confidence or observational reading: deg_C, mg/L, ratio, and nm signal that a reported value is temperature, concentration, dimensionless proportion, or nanometric scale, and ingestion pipelines that persist unit alongside magnitude prevent silent unit conversion errors that would otherwise corrupt cross-dataset lineage claims identified as CONF-0001 through CONF-0004. Together, identifier, entity, attr, attr type, misc, effectiveDate, labelText, recordedAt, and unit form the minimum typed vocabulary through which governance frameworks express obligation, evidence, temporality, and measurable trust in operational data.

**t_lineage_edge_with_confidence**

| id | lineage | confidence | recorded_at | unit |
| --- | --- | --- | --- | --- |
| CONF-0001 | ml_training_dataset_prep | partial_match | 2024-07-21T21:36:51 | deg_C |
| CONF-0002 | data_lake_warehouse_sync | statistical_overlap | 2025-03-12T13:46:59 | mg/L |
| CONF-0003 | data_lake_warehouse_sync | 95_percent | 2023-02-17T19:37:00 | ratio |
| CONF-0004 | data_lake_warehouse_sync | 95_percent | 2024-01-06T01:59:57 | nm |
| CONF-0005 | api_log_aggregation | partial_match | 2025-01-27T14:57:11 | deg_C |
| CONF-0006 | geospatial_raster_processing | high | 2023-11-04T09:37:36 | nm |

**t_control_min_one_owner_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OWNE-0001 | OWNE-0001 | OWNE-0003 | false |
| OWNE-0002 | OWNE-0002 | OWNE-0003 | false |
| OWNE-0003 | OWNE-0003 | OWNE-0003 | true |
| OWNE-0004 | OWNE-0004 | OWNE-0003 | false |
| OWNE-0005 | OWNE-0005 | OWNE-0003 | true |
| OWNE-0006 | OWNE-0006 | OWNE-0003 | true |
| OWNE-0007 | OWNE-0007 | OWNE-0003 | true |

**t_control_min_one_owner_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OWNE-0001 | OWNE-0001 | OWNE-0001 | 2023-12-25 |
| OWNE-0002 | OWNE-0002 | OWNE-0001 | 2023-01-26 |
| OWNE-0003 | OWNE-0003 | OWNE-0001 | 2024-02-04 |
| OWNE-0004 | OWNE-0004 | OWNE-0001 | 2025-01-07 |
| OWNE-0005 | OWNE-0005 | OWNE-0001 | 2023-09-08 |
| OWNE-0006 | OWNE-0006 | OWNE-0001 | 2023-04-04 |
| OWNE-0007 | OWNE-0007 | OWNE-0001 | 2024-01-22 |

**t_control_min_one_owner_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OWNE-0001 | OWNE-0001 | OWNE-0004 | 5 |
| OWNE-0002 | OWNE-0001 | OWNE-0005 | 245 |
| OWNE-0003 | OWNE-0002 | OWNE-0004 | 1 |
| OWNE-0004 | OWNE-0002 | OWNE-0005 | 705 |
| OWNE-0005 | OWNE-0003 | OWNE-0004 | 3 |
| OWNE-0006 | OWNE-0003 | OWNE-0005 | 899 |
| OWNE-0007 | OWNE-0004 | OWNE-0004 | 2 |
| OWNE-0008 | OWNE-0004 | OWNE-0005 | 438 |

**t_control_min_one_owner_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OWNE-0001 | OWNE-0001 | OWNE-0007 | Encoding 01 |
| OWNE-0002 | OWNE-0001 | OWNE-0002 | Enforcement 02 |
| OWNE-0003 | OWNE-0001 | OWNE-0008 | audit excerpt |
| OWNE-0004 | OWNE-0001 | OWNE-0009 | de |
| OWNE-0005 | OWNE-0001 | OWNE-0006 | Scope 05 |
| OWNE-0006 | OWNE-0002 | OWNE-0007 | Encoding 06 |
| OWNE-0007 | OWNE-0002 | OWNE-0002 | Enforcement 07 |
| OWNE-0008 | OWNE-0002 | OWNE-0008 | pre-release note |