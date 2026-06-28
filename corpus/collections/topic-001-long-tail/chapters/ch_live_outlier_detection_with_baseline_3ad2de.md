---
chapter_id: ch_live_outlier_detection_with_baseline_3ad2de
topic_id: 1
family: 02_observation_measurement
cited_terms: ['outlier_detection_with_baseline', 'hipaa_safeguard_technical', 'professional_expertise_domain']
model: engine-refine
---

Domains function as the primary organizational primitives for structuring professional expertise, regulatory safeguards, and anomaly-detection patterns within a unified governance framework. A domain encapsulates a coherent body of knowledge or operational capability—whether that is a Cybersecurity Auditor covering Manufacturing Operations and providing Asset Valuation services, a Forensic Accountant operating within Public Infrastructure to deliver Contract Drafting, or a Clinical Psychologist similarly situated in Public Infrastructure yet oriented toward Asset Valuation. Each domain carries a professional_expertise_domain identifier, a covers_sector designation that anchors it to an industry vertical, and a provides_service_type that specifies the deliverable. The domain construct thus serves as a tripartite binding of who, where, and what, enabling traceability from professional qualification through sectoral applicability to the concrete service rendered.

**t_professional_expertise_domain**

| id | professional_expertise_domain | covers_sector | provides_service_type |
| --- | --- | --- | --- |
| DOMA-0001 | Cybersecurity Auditor | Manufacturing Operations | Asset Valuation |
| DOMA-0002 | Cybersecurity Auditor | Commercial Real Estate | Regulatory Compliance |
| DOMA-0003 | Forensic Accountant | Public Infrastructure | Contract Drafting |
| DOMA-0004 | Clinical Psychologist | Public Infrastructure | Asset Valuation |
| DOMA-0005 | Data Architect | Healthcare Delivery | Regulatory Compliance |
| DOMA-0006 | Data Architect | Manufacturing Operations | Clinical Diagnosis |
| DOMA-0007 | Forensic Accountant | Manufacturing Operations | Network Penetration Testing |
| DOMA-0008 | Structural Engineer | Financial Services | Asset Valuation |

**t_professional_expertise_domain_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| DOMA-0001 | confidence | xsd:decimal |
| DOMA-0002 | dimension_kind | xsd:string |
| DOMA-0003 | method | xsd:string |
| DOMA-0004 | recorded_at | xsd:dateTime |
| DOMA-0005 | uncertainty | xsd:decimal |
| DOMA-0006 | unit | xsd:string |
| DOMA-0007 | value | xsd:decimal |
| DOMA-0008 | encoding | xsd:string |

Domains are not monolithic; they decompose into typed attributes that capture the dimensional properties of the expertise or safeguard in question. A domain such as DOMA-0001 may carry a confidence attribute of type xsd:decimal, a dimension_kind of type xsd:string, a method attribute also typed as xsd:string, and a recorded_at timestamp of type xsd:dateTime. The attribute definitions are themselves first-class entities—DOMA-0001 through DOMA-0004 each declare an attr_name and an attr_type, establishing a schema that governs how values are subsequently stored. This separation of attribute metadata from attribute values permits heterogeneous value types to coexist within a single domain without schema mutation.

Value storage follows a type-dispatch pattern: boolean, date, integer, and varchar values are persisted in dedicated tables keyed by entity_id and attr_id, ensuring type safety at query time. A domain entity DOMA-0001 might record a confidence value of 0.863 against attribute DOMA-0001, a secondary decimal measurement of 628.37 against DOMA-0005, and a third of 315.52 against DOMA-0007, while its dimension_kind values include "Dimension Kind 01," "Encoding 02," "calibration record," and "ja" across attributes DOMA-0002, DOMA-0008, DOMA-0009, and DOMA-0010. Timestamps such as 2024-07-30T07:07:17, 2024-12-04T20:31:19, 2024-05-12T06:41:36, and 2024-07-23T14:51:29 anchor each domain instance to a point in time, enabling temporal auditing of when expertise was recorded or reassessed.

**t_professional_expertise_domain_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DOMA-0001 | DOMA-0001 | DOMA-0001 | 0.863 |
| DOMA-0002 | DOMA-0001 | DOMA-0005 | 628.37 |
| DOMA-0003 | DOMA-0001 | DOMA-0007 | 315.52 |
| DOMA-0004 | DOMA-0002 | DOMA-0001 | 0.147 |
| DOMA-0005 | DOMA-0002 | DOMA-0005 | 438.62 |
| DOMA-0006 | DOMA-0002 | DOMA-0007 | 381.17 |
| DOMA-0007 | DOMA-0003 | DOMA-0001 | 0.471 |
| DOMA-0008 | DOMA-0003 | DOMA-0005 | 940.55 |

**t_professional_expertise_domain_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DOMA-0001 | DOMA-0001 | DOMA-0002 | Dimension Kind 01 |
| DOMA-0002 | DOMA-0001 | DOMA-0008 | Encoding 02 |
| DOMA-0003 | DOMA-0001 | DOMA-0009 | calibration record |
| DOMA-0004 | DOMA-0001 | DOMA-0010 | ja |
| DOMA-0005 | DOMA-0001 | DOMA-0003 | manual |
| DOMA-0006 | DOMA-0001 | DOMA-0006 | mg/L |
| DOMA-0007 | DOMA-0002 | DOMA-0002 | Dimension Kind 07 |
| DOMA-0008 | DOMA-0002 | DOMA-0008 | Encoding 08 |

The domain model extends beyond professional expertise to encompass outlier detection and HIPAA safeguard mappings, each sharing the same structural DNA. Outlier detection domains—BASE-0001 through BASE-0004—capture anomalies such as network latency jump, log flood, and sensor drift, each evaluated against a baseline like expected distribution, nominal profile, or seasonal pattern. These outlier-baseline pairings are mediated through a junction table that assigns roles: observer, owner, and reviewer determine who monitors, who owns, and who audits each detection event. BASE-0001, for instance, maps an outlier_id of BASE-0001 against an against_id of BASE-0005 with the role of observer, while the same outlier_id paired against BASE-0004 carries the role of owner, reflecting a multi-stakeholder governance model where the same anomaly is simultaneously observed and owned.

**t_outlier_detection_with_baseline**

| id | outlier |
| --- | --- |
| BASE-0001 | network latency jump |
| BASE-0002 | network latency jump |
| BASE-0003 | log flood |
| BASE-0004 | sensor drift |
| BASE-0005 | API error surge |
| BASE-0006 | disk I/O stall |

**t_outlier_detection_with_baseline_against**

| id | against |
| --- | --- |
| BASE-0001 | expected distribution |
| BASE-0002 | nominal profile |
| BASE-0003 | seasonal pattern |
| BASE-0004 | seasonal pattern |
| BASE-0005 | statistical baseline |
| BASE-0006 | control group dataset |
| BASE-0007 | seasonal pattern |

**t_outlier_detection_with_baseline__against**

| id | outlier_id | against_id | role |
| --- | --- | --- | --- |
| BASE-0001 | BASE-0001 | BASE-0005 | observer |
| BASE-0002 | BASE-0001 | BASE-0004 | owner |
| BASE-0003 | BASE-0004 | BASE-0002 | reviewer |
| BASE-0004 | BASE-0003 | BASE-0002 | observer |
| BASE-0005 | BASE-0004 | BASE-0007 | observer |
| BASE-0006 | BASE-0005 | BASE-0003 | observer |
| BASE-0007 | BASE-0006 | BASE-0006 | owner |
| BASE-0008 | BASE-0001 | BASE-0003 | reviewer |

HIPAA safeguard technical domains—TECH-0001 through TECH-0004—bind regulatory rules to operational safeguards. The Transaction Rule, Data Backup, Enforcement Rule, and Breach Notification Rule each map to baseline identifiers (BASE-0001, BASE-0004, BASE-0002, BASE-0001), creating a compliance matrix that traces which safeguard addresses which rule. Attributes such as effective_date (typed xsd:date), enforcement (xsd:string), mandatory (xsd:boolean), and priority (xsd:integer) are stored in type-specific value tables. A boolean mandatory attribute might evaluate to true for TECH-0001 and TECH-0002 but false for TECH-0003 and TECH-0004; effective_dates range from 2023-08-04 through 2025-02-09; and integer priority values span from 2 to 784, providing a granular ranking of safeguard importance. Varchar attributes capture free-text values such as "Encoding 01," "Enforcement 02," "change rationale," and "fr," allowing unstructured commentary alongside typed metadata.

**t_hipaa_safeguard_technical**

| id | hipaa | hipaa_safeguard |
| --- | --- | --- |
| TECH-0001 | Transaction Rule | BASE-0001 |
| TECH-0002 | Data Backup | BASE-0004 |
| TECH-0003 | Enforcement Rule | BASE-0002 |
| TECH-0004 | Breach Notification Rule | BASE-0001 |
| TECH-0005 | Breach Notification Rule | BASE-0002 |
| TECH-0006 | Access Control | BASE-0006 |

**t_hipaa_safeguard_technical_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| TECH-0001 | effective_date | xsd:date |
| TECH-0002 | enforcement | xsd:string |
| TECH-0003 | mandatory | xsd:boolean |
| TECH-0004 | priority | xsd:integer |
| TECH-0005 | review_cycle_days | xsd:integer |
| TECH-0006 | scope | xsd:string |
| TECH-0007 | encoding | xsd:string |
| TECH-0008 | label_text | xsd:string |

**t_hipaa_safeguard_technical_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TECH-0001 | TECH-0001 | TECH-0003 | true |
| TECH-0002 | TECH-0002 | TECH-0003 | true |
| TECH-0003 | TECH-0003 | TECH-0003 | false |
| TECH-0004 | TECH-0004 | TECH-0003 | false |
| TECH-0005 | TECH-0005 | TECH-0003 | true |
| TECH-0006 | TECH-0006 | TECH-0003 | true |

**t_hipaa_safeguard_technical_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TECH-0001 | TECH-0001 | TECH-0001 | 2025-01-15 |
| TECH-0002 | TECH-0002 | TECH-0001 | 2025-02-09 |
| TECH-0003 | TECH-0003 | TECH-0001 | 2023-08-04 |
| TECH-0004 | TECH-0004 | TECH-0001 | 2024-09-26 |
| TECH-0005 | TECH-0005 | TECH-0001 | 2025-05-30 |
| TECH-0006 | TECH-0006 | TECH-0001 | 2024-11-22 |

**t_hipaa_safeguard_technical_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TECH-0001 | TECH-0001 | TECH-0004 | 2 |
| TECH-0002 | TECH-0001 | TECH-0005 | 620 |
| TECH-0003 | TECH-0002 | TECH-0004 | 3 |
| TECH-0004 | TECH-0002 | TECH-0005 | 784 |
| TECH-0005 | TECH-0003 | TECH-0004 | 3 |
| TECH-0006 | TECH-0003 | TECH-0005 | 568 |
| TECH-0007 | TECH-0004 | TECH-0004 | 1 |
| TECH-0008 | TECH-0004 | TECH-0005 | 831 |

**t_hipaa_safeguard_technical_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TECH-0001 | TECH-0001 | TECH-0007 | Encoding 01 |
| TECH-0002 | TECH-0001 | TECH-0002 | Enforcement 02 |
| TECH-0003 | TECH-0001 | TECH-0008 | change rationale |
| TECH-0004 | TECH-0001 | TECH-0009 | fr |
| TECH-0005 | TECH-0001 | TECH-0006 | Scope 05 |
| TECH-0006 | TECH-0002 | TECH-0007 | Encoding 06 |
| TECH-0007 | TECH-0002 | TECH-0002 | Enforcement 07 |
| TECH-0008 | TECH-0002 | TECH-0008 | intake form |

The domain architecture thus provides a unified, extensible framework for representing professional expertise, regulatory compliance, and operational anomaly detection within a single data model. By separating entity definitions from attribute schemas and from typed value storage, the model supports heterogeneous data without sacrificing type safety or query performance. Roles—observer, owner, reviewer—introduce a governance layer that distinguishes between monitoring, accountability, and audit functions. Sectoral coverage, service types, and baseline comparisons ground abstract expertise in concrete industry contexts and measurable expectations. The result is a domain model that scales from individual professional qualifications to enterprise-wide compliance programs while maintaining a consistent structural vocabulary across all use cases.

**t_professional_expertise_domain_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DOMA-0001 | DOMA-0001 | DOMA-0004 | 2024-07-30T07:07:17 |
| DOMA-0002 | DOMA-0002 | DOMA-0004 | 2024-12-04T20:31:19 |
| DOMA-0003 | DOMA-0003 | DOMA-0004 | 2024-05-12T06:41:36 |
| DOMA-0004 | DOMA-0004 | DOMA-0004 | 2024-07-23T14:51:29 |
| DOMA-0005 | DOMA-0005 | DOMA-0004 | 2023-05-19T17:35:21 |
| DOMA-0006 | DOMA-0006 | DOMA-0004 | 2023-07-26T00:07:35 |
| DOMA-0007 | DOMA-0007 | DOMA-0004 | 2023-03-21T08:57:17 |
| DOMA-0008 | DOMA-0008 | DOMA-0004 | 2023-06-16T10:20:06 |