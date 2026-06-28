---
chapter_id: ch_live_audit_for_period_b0c69f
topic_id: 26
family: 03_directive_governance
cited_terms: ['audit_for_period', 'gauge_metric_subclass', 'table_provenance_source']
model: engine-refine
---

Audit governance frameworks require precise attribution of every assessment to a defined period and a clearly articulated scope. Period identifiers such as PERI-0001 through PERI-0004 anchor individual reviews to discrete reporting windows, while the audit classification—whether a Data Privacy Impact Assessment, an Annual-2022 review, or a GDPR Compliance Review—establishes the substantive domain under examination. These period-audit pairings do not exist in isolation; each audit may be cross-referenced against additional audit periods, producing a matrix of interdependencies. A HIPAA Security Audit, for instance, can serve as the target of a Data Privacy Impact Assessment, while a SOC2 Type II or ITIL Service Audit occupies parallel positions in the same relational graph. The subject and target columns encode the directionality of these relationships: PERI-0001 appears as the subject when it references PERI-0003 as its target, and the role column—observer or reviewer—assigns functional responsibility to each linkage, ensuring that accountability is traceable across every audit-to-audit dependency.

**t_audit_for_period**

| id | audit |
| --- | --- |
| PERI-0001 | Data Privacy Impact Assessment |
| PERI-0002 | Data Privacy Impact Assessment |
| PERI-0003 | Annual-2022 |
| PERI-0004 | GDPR Compliance Review |
| PERI-0005 | FINRA Rule 4511 Examination |
| PERI-0006 | Q4-2023 |
| PERI-0007 | FINRA Rule 4511 Examination |
| PERI-0008 | ISO 27001 Certification |

**t_audit_for_period_for_audit_period**

| id | for_audit_period |
| --- | --- |
| PERI-0001 | HIPAA Security Audit |
| PERI-0002 | SOC2 Type II |
| PERI-0003 | HIPAA Security Audit |
| PERI-0004 | ITIL Service Audit |
| PERI-0005 | HIPAA Security Audit |
| PERI-0006 | Q4-2023 |

**t_audit_for_period__for_audit_period**

| id | audit_id | for_audit_period_id | role |
| --- | --- | --- | --- |
| PERI-0001 | PERI-0001 | PERI-0003 | observer |
| PERI-0002 | PERI-0002 | PERI-0005 | reviewer |
| PERI-0003 | PERI-0001 | PERI-0003 | observer |
| PERI-0004 | PERI-0005 | PERI-0003 | reviewer |
| PERI-0005 | PERI-0007 | PERI-0004 | reviewer |
| PERI-0006 | PERI-0001 | PERI-0001 | owner |
| PERI-0007 | PERI-0003 | PERI-0001 | reviewer |
| PERI-0008 | PERI-0008 | PERI-0002 | observer |

Metric measurement operates on a parallel architecture, where each gauge record carries an identifier such as METR-0001 through METR-0004 and is classified by a metric kind key that points to a dimension table for semantic context. The dimension table resolves these keys into human-readable labels—Metric Kind Label 01, Metric Kind Label 02—and categories—Metric Kind Category 01 through Metric Kind Category 04—that enable aggregation and filtering at the category level. The size_bytes column quantifies the data footprint of each metric, with values ranging from 15,628,556 bytes for METR-0004 to 944,581,501 bytes for METR-0001, a spread that reflects the heterogeneity of underlying data sources and the varying granularity of measurement. Version numbers, ranging from 4 to 11, provide a revision mechanism that allows historical comparisons and ensures that downstream consumers can distinguish between stale and current metric definitions.

**fact_gauge**

| id | metric_kind_key | size_bytes | version |
| --- | --- | --- | --- |
| METR-0001 | METR-0004 | 944581501 | 10 |
| METR-0002 | METR-0002 | 721525656 | 10 |
| METR-0003 | METR-0006 | 182468524 | 11 |
| METR-0004 | METR-0005 | 15628556 | 4 |
| METR-0005 | METR-0001 | 256894862 | 9 |
| METR-0006 | METR-0007 | 696827242 | 7 |
| METR-0007 | METR-0003 | 732080346 | 4 |
| METR-0008 | METR-0005 | 330247350 | 8 |

Data provenance is captured through a fact table that records each measurement alongside its confidence and uncertainty attributes, creating a dual-axis quality model. Confidence values—0.274, 0.140, 0.609, 0.874—express the degree of assurance that a given measurement is accurate, while uncertainty values—648.78, 899.39, 885.54, 289.58—quantify the expected deviation from the reported value. These two metrics are not redundant: a measurement with high confidence (0.874 for SOUR-0004) and low uncertainty (289.58) represents a robust observation, whereas SOUR-0002, with confidence of 0.140 and uncertainty of 899.39, signals a result that should be treated as provisional. The value column—608.50, 639.23, 470.53, 720.41—holds the actual measurement, and the sourced_from_table_key column traces each fact back to its origin table, enabling lineage verification.

**fact_table**

| id | sourced_from_table_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| SOUR-0001 | SOUR-0008 | 0.274 | 648.78 | 608.50 |
| SOUR-0002 | SOUR-0006 | 0.140 | 899.39 | 639.23 |
| SOUR-0003 | SOUR-0006 | 0.609 | 885.54 | 470.53 |
| SOUR-0004 | SOUR-0006 | 0.874 | 289.58 | 720.41 |

The sourced_from_table dimension table provides the categorical and labeling infrastructure for provenance tracking. Each source table identifier—SOUR-0001 through SOUR-0008—is associated with a label such as Sourced From Table Label 01 and a category like Sourced From Table Category 01, allowing analysts to group measurements by their origin without hard-coding table names into queries. This separation of identity from classification mirrors the metric kind dimension and reflects a deliberate design choice: identifiers remain stable across schema changes, while labels and categories can be reorganized to accommodate evolving governance taxonomies. The misc column, which appears in both the metric kind and sourced-from-table dimensions as well as in the fact table's value field, serves as a catch-all for attributes that do not fit the primary classification scheme, ensuring that the schema remains extensible without requiring structural modifications.

**dim_metric_kind**

| id | metric_kind_label | metric_kind_category |
| --- | --- | --- |
| METR-0001 | Metric Kind Label 01 | Metric Kind Category 01 |
| METR-0002 | Metric Kind Label 02 | Metric Kind Category 02 |
| METR-0003 | Metric Kind Label 03 | Metric Kind Category 03 |
| METR-0004 | Metric Kind Label 04 | Metric Kind Category 04 |
| METR-0005 | Metric Kind Label 05 | Metric Kind Category 05 |
| METR-0006 | Metric Kind Label 06 | Metric Kind Category 06 |
| METR-0007 | Metric Kind Label 07 | Metric Kind Category 07 |

**dim_sourced_from_table**

| id | sourced_from_table_label | sourced_from_table_category |
| --- | --- | --- |
| SOUR-0001 | Sourced From Table Label 01 | Sourced From Table Category 01 |
| SOUR-0002 | Sourced From Table Label 02 | Sourced From Table Category 02 |
| SOUR-0003 | Sourced From Table Label 03 | Sourced From Table Category 03 |
| SOUR-0004 | Sourced From Table Label 04 | Sourced From Table Category 04 |
| SOUR-0005 | Sourced From Table Label 05 | Sourced From Table Category 05 |
| SOUR-0006 | Sourced From Table Label 06 | Sourced From Table Category 06 |
| SOUR-0007 | Sourced From Table Label 07 | Sourced From Table Category 07 |
| SOUR-0008 | Sourced From Table Label 08 | Sourced From Table Category 08 |

Together, these tables form a relational fabric that supports audit traceability, metric quality assessment, and data lineage verification. The audit period tables ensure that every review can be mapped to a specific window and cross-referenced against related assessments, with roles providing an audit trail of who observed and who reviewed each linkage. The metric and gauge tables ensure that measurements are classified, versioned, and sized appropriately for capacity planning and performance monitoring. The fact and dimension tables ensure that every data point carries its own quality certificate—confidence and uncertainty—and a verifiable path back to its source. In a compliance context, this structure is not merely organizational; it is evidentiary. An auditor can follow a measurement from its value through its confidence and uncertainty scores, back to its source table, and then forward to the audit period that triggered the assessment, with every step anchored by stable identifiers and documented roles.