---
chapter_id: ch_live_policy_only_applies_to_5addfc
topic_id: 14
family: 01_foundation
cited_terms: ['policy_only_applies_to', 'gdpr_article_subclass', 'trace_supports_claim']
model: engine-refine
---

Policy applicability in the governance framework is governed by a structured registry where each rule carries a unique identifier—APPL-0001 through APPL-0004—anchoring it to a specific mandate such as Privacy Shield Compliance, Encryption Baseline, or Data Classification Guideline. The applies_to column designates the operational scope of each policy, constraining it to domains like Public APIs, Production Clusters, or Third Party Vendors, while the effectivedate field establishes the temporal validity of the rule, with dates ranging from 2023-08-21 to 2023-12-18. Priority values, encoded as integers from 3 to 5, impose a resolution hierarchy when multiple policies intersect, ensuring that higher-priority directives take precedence during compliance evaluation. This triad of identifier, effective date, and priority forms the backbone of policy lifecycle management, enabling auditors to reconstruct which rules were in force at any given point and which carried decisive authority.

**t_policy_only_applies_to**

| id | policy | applies_to | effective_date | priority |
| --- | --- | --- | --- | --- |
| APPL-0001 | Privacy Shield Compliance | Public APIs | 2023-08-29 | 5 |
| APPL-0002 | Encryption Baseline | Production Clusters | 2023-11-05 | 5 |
| APPL-0003 | Data Classification Guideline | Third Party Vendors | 2023-08-21 | 3 |
| APPL-0004 | Data Classification Guideline | Third Party Vendors | 2023-12-18 | 3 |
| APPL-0005 | Data Retention Standard | Legacy Mainframe | 2024-11-09 | 4 |
| APPL-0006 | Data Classification Guideline | CI/CD Pipelines | 2023-01-13 | 2 |
| APPL-0007 | Vendor Risk Assessment | Financial Records | 2025-03-17 | 2 |
| APPL-0008 | Network Segmentation Rule | Legacy Mainframe | 2024-05-19 | 2 |

The regulatory taxonomy extends through a subclassification layer that maps GDPR articles to their international equivalents and cross-references them with complementary frameworks. Identifiers ARTI-0001 through ARTI-0004 anchor entries whose gdpr column references jurisdictions including Brazilian LGPD and Canadian PIPEDA, while the gdpr_article column enumerates the specific articles or acts—Australian Privacy Act, Japanese APPI, Brazilian LGPD, and Article 9—against which compliance is measured. A junction table, t_gdpr_article_subclass__gdpr_article, resolves the many-to-many relationships between these entities through a subject column (gdpr_id) and a target column (gdpr_article_id), each carrying its own identifier and together forming the foreign-key backbone of the regulatory mapping. The role column on this junction—taking values of observer, contributor, or owner—encodes the nature of the relationship, distinguishing between frameworks that merely reference an article and those that actively derive obligations from it.

**t_gdpr_article_subclass**

| id | gdpr |
| --- | --- |
| ARTI-0001 | Brazilian LGPD |
| ARTI-0002 | Canadian PIPEDA |
| ARTI-0003 | Brazilian LGPD |
| ARTI-0004 | Canadian PIPEDA |
| ARTI-0005 | Canadian PIPEDA |
| ARTI-0006 | General Data Protection Regulation |
| ARTI-0007 | Article 6 |
| ARTI-0008 | Swiss FADP |

**t_gdpr_article_subclass_gdpr_article**

| id | gdpr_article |
| --- | --- |
| ARTI-0001 | Australian Privacy Act |
| ARTI-0002 | Japanese APPI |
| ARTI-0003 | Brazilian LGPD |
| ARTI-0004 | Article 9 |
| ARTI-0005 | ePrivacy Directive |
| ARTI-0006 | Canadian PIPEDA |

**t_gdpr_article_subclass__gdpr_article**

| id | gdpr_id | gdpr_article_id | role |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0005 | ARTI-0005 | observer |
| ARTI-0002 | ARTI-0007 | ARTI-0005 | contributor |
| ARTI-0003 | ARTI-0007 | ARTI-0005 | observer |
| ARTI-0004 | ARTI-0004 | ARTI-0006 | owner |
| ARTI-0005 | ARTI-0001 | ARTI-0002 | owner |
| ARTI-0006 | ARTI-0004 | ARTI-0003 | reviewer |
| ARTI-0007 | ARTI-0006 | ARTI-0002 | observer |
| ARTI-0008 | ARTI-0005 | ARTI-0006 | contributor |

Evidence collection for compliance claims is structured around typed attributes that capture measurement metadata with schema-level precision. The t_trace_supports_claim table assigns identifiers CLAI-0001 through CLAI-0004 to trace records such as compliance-audit-cycle, sensor-calibration-seq, incident-response-workflow, and telemetry-ingestion-stream, each representing a distinct evidentiary pathway. The t_trace_supports_claim_attr table defines the attribute schema for these traces, pairing attr_name values—confidence, dimension_kind, method, recorded_at—with their corresponding attr_type declarations in XSD form, including xsd:decimal, xsd:string, and xsd:dateTime. This type discipline ensures that every captured value conforms to its declared format, preventing semantic drift across heterogeneous data sources.

**t_trace_supports_claim**

| id | trace |
| --- | --- |
| CLAI-0001 | compliance-audit-cycle |
| CLAI-0002 | sensor-calibration-seq |
| CLAI-0003 | incident-response-workflow |
| CLAI-0004 | telemetry-ingestion-stream |
| CLAI-0005 | incident-response-workflow |
| CLAI-0006 | log-aggregation-cycle |

**t_trace_supports_claim_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| CLAI-0001 | confidence | xsd:decimal |
| CLAI-0002 | dimension_kind | xsd:string |
| CLAI-0003 | method | xsd:string |
| CLAI-0004 | recorded_at | xsd:dateTime |
| CLAI-0005 | uncertainty | xsd:decimal |
| CLAI-0006 | unit | xsd:string |
| CLAI-0007 | value | xsd:decimal |
| CLAI-0008 | encoding | xsd:string |

The actual values of these attributes are partitioned across three type-specific tables—t_trace_supports_claim_val_datetime, t_trace_supports_claim_val_decimal, and t_trace_supports_claim_val_varchar—each linking an entity_id and attr_id to a misc column that holds the concrete measurement. Decimal attributes record quantitative evidence such as 0.088 and 473.29, datetime attributes capture temporal markers like 2024-06-12T18:13:41 and 2024-09-25T21:45:51, and varchar attributes store categorical descriptors including Dimension Kind 01, Encoding 02, intake form, and es. The entity_id column on each value table serves as the foreign key connecting back to the claim identifier, while attr_id references the attribute definition, creating a normalized structure that separates schema from instance data. This separation enables the framework to accommodate evolving attribute definitions without restructuring stored evidence, a critical requirement for long-lived compliance programs where historical records must remain queryable against current schemas.

**t_trace_supports_claim_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CLAI-0001 | CLAI-0001 | CLAI-0004 | 2024-06-12T18:13:41 |
| CLAI-0002 | CLAI-0002 | CLAI-0004 | 2024-04-03T22:44:05 |
| CLAI-0003 | CLAI-0003 | CLAI-0004 | 2024-09-25T21:45:51 |
| CLAI-0004 | CLAI-0004 | CLAI-0004 | 2024-07-08T19:08:05 |
| CLAI-0005 | CLAI-0005 | CLAI-0004 | 2023-05-02T18:38:21 |
| CLAI-0006 | CLAI-0006 | CLAI-0004 | 2023-03-27T11:44:46 |

**t_trace_supports_claim_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CLAI-0001 | CLAI-0001 | CLAI-0001 | 0.088 |
| CLAI-0002 | CLAI-0001 | CLAI-0005 | 473.29 |
| CLAI-0003 | CLAI-0001 | CLAI-0007 | 607.77 |
| CLAI-0004 | CLAI-0002 | CLAI-0001 | 0.802 |
| CLAI-0005 | CLAI-0002 | CLAI-0005 | 968.55 |
| CLAI-0006 | CLAI-0002 | CLAI-0007 | 413.59 |
| CLAI-0007 | CLAI-0003 | CLAI-0001 | 0.176 |
| CLAI-0008 | CLAI-0003 | CLAI-0005 | 496.89 |

**t_trace_supports_claim_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CLAI-0001 | CLAI-0001 | CLAI-0002 | Dimension Kind 01 |
| CLAI-0002 | CLAI-0001 | CLAI-0008 | Encoding 02 |
| CLAI-0003 | CLAI-0001 | CLAI-0009 | intake form |
| CLAI-0004 | CLAI-0001 | CLAI-0010 | es |
| CLAI-0005 | CLAI-0001 | CLAI-0003 | hybrid |
| CLAI-0006 | CLAI-0001 | CLAI-0006 | count |
| CLAI-0007 | CLAI-0002 | CLAI-0002 | Dimension Kind 07 |
| CLAI-0008 | CLAI-0002 | CLAI-0008 | Encoding 08 |