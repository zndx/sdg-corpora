---
chapter_id: ch_live_clinical_quality_research_role_608682
topic_id: 61
family: 08_derived
cited_terms: ['clinical_quality_research_role', 'subclass_disjoint_from_artifact', 'log_record_subclass']
model: engine-refine
---

Within clinical quality research governance, authority assignment follows a tripartite structure that separates role definition, jurisdictional assignment, and data applicability into distinct but interlocking registries. The role catalogue enumerates positions such as Quality Assurance Lead, Safety Monitor, and Data Integrity Auditor, each anchored by a stable identifier like ROLE-0001 through ROLE-0004. These designations do not exist in isolation; they are bound to regulatory authorities through a secondary mapping that associates each role with its governing body—EMA Governance Office, CDC Regulatory Division, Joint Commission Authority, and DoD Clinical Trial Office respectively. The binding is not one-to-one in practice: the junction table t_clinical_quality_research_role__holds_role_in permits a single clinical entity to hold multiple positions across different authorities, as evidenced by clinical_id ROLE-0002 appearing twice with distinct holds_role_in_id values (ROLE-0006 and ROLE-0008), each qualified by a participation role of either reviewer or observer. This design accommodates the reality that a single investigator may serve as a Safety Monitor under one regulatory umbrella while simultaneously acting as a reviewer for another.

**t_clinical_quality_research_role**

| id | clinical_quality_research_role |
| --- | --- |
| ROLE-0001 | Quality Assurance Lead |
| ROLE-0002 | Safety Monitor |
| ROLE-0003 | Safety Monitor |
| ROLE-0004 | Data Integrity Auditor |
| ROLE-0005 | Principal Investigator |
| ROLE-0006 | Regulatory Submission Specialist |

**t_clinical_quality_research_role_holds_role_in**

| id | holds_role_in |
| --- | --- |
| ROLE-0001 | EMA Governance Office |
| ROLE-0002 | CDC Regulatory Division |
| ROLE-0003 | Joint Commission Authority |
| ROLE-0004 | DoD Clinical Trial Office |
| ROLE-0005 | NHS Research Ethics Board |
| ROLE-0006 | VA Research Authority |
| ROLE-0007 | CDC Regulatory Division |
| ROLE-0008 | VA Research Authority |

**t_clinical_quality_research_role__holds_role_in**

| id | clinical_id | holds_role_in_id | role |
| --- | --- | --- | --- |
| ROLE-0001 | ROLE-0002 | ROLE-0006 | reviewer |
| ROLE-0002 | ROLE-0002 | ROLE-0008 | observer |
| ROLE-0003 | ROLE-0005 | ROLE-0008 | reviewer |
| ROLE-0004 | ROLE-0006 | ROLE-0001 | reviewer |
| ROLE-0005 | ROLE-0004 | ROLE-0005 | owner |
| ROLE-0006 | ROLE-0005 | ROLE-0006 | owner |
| ROLE-0007 | ROLE-0003 | ROLE-0007 | owner |
| ROLE-0008 | ROLE-0001 | ROLE-0004 | owner |

**t_clinical_quality_research_role_applies_to**

| id | applies_to |
| --- | --- |
| ROLE-0001 | Adverse Event Log |
| ROLE-0002 | Procedure Coding Set |
| ROLE-0003 | Electronic Health Record Extract |
| ROLE-0004 | Imaging Metadata Archive |
| ROLE-0005 | Vital Signs Stream |
| ROLE-0006 | Laboratory Results Database |

Data applicability follows an analogous pattern, where the t_clinical_quality_research_role_applies_to table establishes which clinical quality datasets fall under each role's purview. The datasets span the full lifecycle of clinical evidence: Adverse Event Log, Procedure Coding Set, Electronic Health Record Extract, and Imaging Metadata Archive. The many-to-many relationship between roles and data sources is resolved through t_clinical_quality_research_role__applies_to, which introduces two additional dimensions of control. The role column distinguishes between owner and contributor relationships—ROLE-0005 holds ownership over ROLE-0006, while ROLE-0001 holds contributor status over ROLE-0005—ensuring that access rights and accountability are explicitly modeled rather than inferred. The cardinality_note column (Cardinality Note 01 through Cardinality Note 04) provides a mechanism for attaching business rules to each relationship, such as whether a contributor may act as a sole owner or must share stewardship with another party.

**t_clinical_quality_research_role__applies_to**

| id | clinical_id | applies_to_id | role | cardinality_note |
| --- | --- | --- | --- | --- |
| ROLE-0001 | ROLE-0005 | ROLE-0006 | owner | Cardinality Note 01 |
| ROLE-0002 | ROLE-0002 | ROLE-0001 | owner | Cardinality Note 02 |
| ROLE-0003 | ROLE-0001 | ROLE-0005 | contributor | Cardinality Note 03 |
| ROLE-0004 | ROLE-0004 | ROLE-0001 | contributor | Cardinality Note 04 |
| ROLE-0005 | ROLE-0001 | ROLE-0002 | observer | Cardinality Note 05 |
| ROLE-0006 | ROLE-0002 | ROLE-0006 | owner | Cardinality Note 06 |
| ROLE-0007 | ROLE-0003 | ROLE-0001 | observer | Cardinality Note 07 |
| ROLE-0008 | ROLE-0006 | ROLE-0004 | owner | Cardinality Note 08 |

The governance framework extends beyond role and data relationships into artifact classification, where the t_subclass_disjoint_from_artifact table enforces type exclusivity constraints. Entries such as lab-assay-protocol, sensor-telemetry-stream, and telemetry-metadata-index are declared disjoint from one another, meaning a single artifact instance cannot simultaneously belong to multiple subclasses. The repetition of telemetry-metadata-index across ARTI-0003 and ARTI-0004 suggests either a redundant constraint declaration or a deliberate cross-reference to multiple disjointness rules, a pattern that warrants audit review in any formal data governance assessment.

**t_subclass_disjoint_from_artifact**

| id | disjoint |
| --- | --- |
| ARTI-0001 | lab-assay-protocol |
| ARTI-0002 | sensor-telemetry-stream |
| ARTI-0003 | telemetry-metadata-index |
| ARTI-0004 | telemetry-metadata-index |
| ARTI-0005 | artifact-manifest-record |
| ARTI-0006 | feature-vector-cache |
| ARTI-0007 | provenance-chain-hash |

Operational observability is captured through a star schema centered on the fact_log fact table, which records individual log entries identified by RECO-0001 through RECO-0004. Each entry carries a log_severity_key foreign key pointing to the dim_log_severity dimension, where severity is described by a human-readable label (Log Severity Label 01 through Log Severity Label 04) and grouped into a category (Log Severity Category 01 through Log Severity Category 04). The fact table also records the physical footprint of each log entry in size_bytes—values ranging from approximately 443 MB (RECO-0004) to 913 MB (RECO-0001)—and a version number (2 through 7), enabling capacity planning and version-aware log retention policies. The dimension table's log_severity_category column, typed as category, provides the grouping mechanism that allows analysts to aggregate severity data across categories rather than individual labels, supporting both granular incident tracking and high-level compliance reporting.

**fact_log**

| id | log_severity_key | size_bytes | version |
| --- | --- | --- | --- |
| RECO-0001 | RECO-0006 | 913386183 | 6 |
| RECO-0002 | RECO-0004 | 303816232 | 7 |
| RECO-0003 | RECO-0007 | 758542341 | 7 |
| RECO-0004 | RECO-0001 | 442933768 | 2 |

**dim_log_severity**

| id | log_severity_label | log_severity_category |
| --- | --- | --- |
| RECO-0001 | Log Severity Label 01 | Log Severity Category 01 |
| RECO-0002 | Log Severity Label 02 | Log Severity Category 02 |
| RECO-0003 | Log Severity Label 03 | Log Severity Category 03 |
| RECO-0004 | Log Severity Label 04 | Log Severity Category 04 |
| RECO-0005 | Log Severity Label 05 | Log Severity Category 05 |
| RECO-0006 | Log Severity Label 06 | Log Severity Category 06 |
| RECO-0007 | Log Severity Label 07 | Log Severity Category 07 |