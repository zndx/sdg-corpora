---
chapter_id: ch_live_policy_subclass_bcd16c
topic_id: 1
family: 01_foundation
cited_terms: ['policy_subclass', 'outlier_detection_basic', 'control_only_addresses_threat_class']
model: engine-refine
---

Governance frameworks of this caliber rest upon a dual architecture of policy definitions and their operational attributes, where each policy identifier—POLI-0001 through POLI-0004—encodes a distinct regulatory instrument such as the Telemetry Privacy Standard, the Provenance Directive, the Data Retention Policy, or the Metadata Governance mandate. These instruments do not exist in isolation; each governs one or more threat classes, establishing a traceable chain from abstract obligation to concrete risk mitigation. The Multi-Factor Authentication control, for instance, addresses POLI-0004, while the Incident Response Plan maps to both POLI-0001 and POLI-0002, demonstrating how a single control can satisfy multiple policy requirements simultaneously. This many-to-many relationship between policies and controls forms the backbone of compliance mapping, ensuring that every regulatory requirement can be traced to an implementable safeguard and vice versa.

**t_policy_subclass**

| id | policy | governs |
| --- | --- | --- |
| POLI-0001 | Telemetry Privacy Standard | THRE-0006 |
| POLI-0002 | Provenance Directive | THRE-0002 |
| POLI-0003 | Data Retention Policy | THRE-0003 |
| POLI-0004 | Metadata Governance | THRE-0005 |
| POLI-0005 | Telemetry Privacy Standard | THRE-0008 |
| POLI-0006 | Provenance Directive | THRE-0005 |

**t_control_only_addresses_threat_class**

| id | control | addresses_risk |
| --- | --- | --- |
| THRE-0001 | Multi-Factor Authentication | POLI-0004 |
| THRE-0002 | Incident Response Plan | POLI-0001 |
| THRE-0003 | Incident Response Plan | POLI-0002 |
| THRE-0004 | Access Review Policy | POLI-0005 |
| THRE-0005 | Backup Retention Schedule | POLI-0001 |
| THRE-0006 | Backup Retention Schedule | POLI-0003 |
| THRE-0007 | Access Review Policy | POLI-0002 |
| THRE-0008 | Incident Response Plan | POLI-0005 |

**t_control_only_addresses_threat_class_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| THRE-0001 | effective_date | xsd:date |
| THRE-0002 | enforcement | xsd:string |
| THRE-0003 | mandatory | xsd:boolean |
| THRE-0004 | priority | xsd:integer |
| THRE-0005 | review_cycle_days | xsd:integer |
| THRE-0006 | scope | xsd:string |
| THRE-0007 | encoding | xsd:string |
| THRE-0008 | label_text | xsd:string |

Attributes provide the dimensional granularity that transforms static policy declarations into actionable, time-bound obligations. Each policy and control entity carries a suite of typed attributes—effective_date as xsd:date, enforcement as xsd:string, mandatory as xsd:boolean, and priority as xsd:integer—whose values are stored in type-specific valuation tables to preserve schema integrity and query efficiency. The effective_date for POLI-0001 resolves to 2023-01-31, while POLI-0002 carries 2024-06-17, reflecting staggered implementation schedules across the policy portfolio. Boolean attributes such as mandatory yield values of true or false to distinguish compulsory from discretionary requirements; the Incident Response Plan associated with THRE-0002 registers as false on mandatory status, whereas THRE-0001 and THRE-0004 both register true, signaling a deliberate differentiation in enforcement posture. Integer priority values range from 1 to 958 across entities, with POLI-0002 attaining 958 and THRE-0002 reaching 926, establishing a quantitative hierarchy that drives remediation sequencing and resource allocation. String-valued attributes capture enforcement classifications such as "Enforcement 02" and operational metadata including "nightly summary" and locale designators like "fr," while date attributes for controls span from 2023-01-13 through 2025-01-04, reflecting a rolling compliance calendar that extends well into the future.

Outlier detection operates as a parallel monitoring layer, capturing anomalous execution events through a fact table that records identifier, outlier key, duration in seconds, exit code, and retry count. Detection records such as DETE-0001 through DETE-0004 carry outlier keys that may reference prior detections—DETE-0003 appears as both an identifier and an outlier key within the same dataset—indicating a self-referential chain of anomaly correlation. Duration measurements exhibit substantial variance: DETE-0002 persisted for 6466.78 seconds, DETE-0003 for 5282.09 seconds, DETE-0001 for 3360.34 seconds, and DETE-0004 for a comparatively brief 1182.39 seconds, suggesting that outlier severity cannot be assessed by duration alone. Exit codes further differentiate failure modes, ranging from the low-severity code 4 associated with DETE-0002 and DETE-0001 to the elevated code 760 recorded for DETE-0001, while retry counts span from 101 for DETE-0003 to 308 for DETE-0004, revealing that systems under stress may require hundreds of recovery attempts before stabilization.

**fact_outlier**

| id | outlier_key | duration_seconds | exit_code | retry_count |
| --- | --- | --- | --- | --- |
| DETE-0001 | DETE-0003 | 3360.34 | 760 | 293 |
| DETE-0002 | DETE-0001 | 6466.78 | 4 | 225 |
| DETE-0003 | DETE-0002 | 5282.09 | 490 | 101 |
| DETE-0004 | DETE-0003 | 1182.39 | 124 | 308 |
| DETE-0005 | DETE-0002 | 3041.72 | 808 | 59 |
| DETE-0006 | DETE-0005 | 3852.38 | 619 | 489 |
| DETE-0007 | DETE-0003 | 1453.07 | 682 | 1 |

The dimensional outlier table complements these factual measurements with categorical labels—Outlier Label 01 through Outlier Label 04 paired with Outlier Category 01 through Outlier Category 04—that provide the semantic context necessary for triage and reporting. Together, the fact and dimension tables enable a complete picture: an outlier is not merely a numeric deviation but a classified event with a measurable duration, a definitive exit status, a quantified retry burden, and a categorical identity that determines its placement within the broader risk taxonomy. This separation of measured facts from descriptive dimensions follows established dimensional modeling principles, allowing compliance analysts to slice outlier data by category, by duration thresholds, or by retry frequency without compromising the integrity of the underlying measurements.

The attr, attr_type, category, duration_seconds, entity, exit, identifier, misc, outlier, and retry_count constructs collectively form a unified observability and governance substrate. Policies and controls define what must be done; attributes define when, how strictly, and at what priority; outlier facts define what went wrong, for how long, and how many times the system attempted recovery; and outlier dimensions define what category of failure occurred. Every identifier—whether POLI-0001, THRE-0002, or DETE-0003—serves as a stable anchor point across these layers, enabling cross-referential queries that answer questions no single table could resolve alone: Which policies govern a threat class whose associated control has an effective date beyond the current quarter? Which outlier categories correlate with the highest retry counts? Which mandatory policies have priority values exceeding the operational threshold? The architecture answers these questions not through denormalization but through disciplined relational integrity, where foreign keys bind policy to threat, threat to control, control to attribute, and attribute to its typed value, while outlier identifiers bind measurements to their categorical context.

**t_policy_subclass_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| POLI-0001 | effective_date | xsd:date |
| POLI-0002 | enforcement | xsd:string |
| POLI-0003 | mandatory | xsd:boolean |
| POLI-0004 | priority | xsd:integer |
| POLI-0005 | review_cycle_days | xsd:integer |
| POLI-0006 | scope | xsd:string |
| POLI-0007 | encoding | xsd:string |
| POLI-0008 | label_text | xsd:string |

**t_policy_subclass_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0003 | false |
| POLI-0002 | POLI-0002 | POLI-0003 | true |
| POLI-0003 | POLI-0003 | POLI-0003 | true |
| POLI-0004 | POLI-0004 | POLI-0003 | false |
| POLI-0005 | POLI-0005 | POLI-0003 | true |
| POLI-0006 | POLI-0006 | POLI-0003 | false |

**t_policy_subclass_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0001 | 2023-01-31 |
| POLI-0002 | POLI-0002 | POLI-0001 | 2024-06-17 |
| POLI-0003 | POLI-0003 | POLI-0001 | 2023-06-01 |
| POLI-0004 | POLI-0004 | POLI-0001 | 2024-01-12 |
| POLI-0005 | POLI-0005 | POLI-0001 | 2024-07-01 |
| POLI-0006 | POLI-0006 | POLI-0001 | 2023-07-28 |

**t_policy_subclass_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0004 | 1 |
| POLI-0002 | POLI-0001 | POLI-0005 | 740 |
| POLI-0003 | POLI-0002 | POLI-0004 | 3 |
| POLI-0004 | POLI-0002 | POLI-0005 | 958 |
| POLI-0005 | POLI-0003 | POLI-0004 | 5 |
| POLI-0006 | POLI-0003 | POLI-0005 | 462 |
| POLI-0007 | POLI-0004 | POLI-0004 | 5 |
| POLI-0008 | POLI-0004 | POLI-0005 | 496 |

**t_policy_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0007 | Encoding 01 |
| POLI-0002 | POLI-0001 | POLI-0002 | Enforcement 02 |
| POLI-0003 | POLI-0001 | POLI-0008 | nightly summary |
| POLI-0004 | POLI-0001 | POLI-0009 | fr |
| POLI-0005 | POLI-0001 | POLI-0006 | Scope 05 |
| POLI-0006 | POLI-0002 | POLI-0007 | Encoding 06 |
| POLI-0007 | POLI-0002 | POLI-0002 | Enforcement 07 |
| POLI-0008 | POLI-0002 | POLI-0008 | audit excerpt |

**dim_outlier**

| id | outlier_label | outlier_category |
| --- | --- | --- |
| DETE-0001 | Outlier Label 01 | Outlier Category 01 |
| DETE-0002 | Outlier Label 02 | Outlier Category 02 |
| DETE-0003 | Outlier Label 03 | Outlier Category 03 |
| DETE-0004 | Outlier Label 04 | Outlier Category 04 |
| DETE-0005 | Outlier Label 05 | Outlier Category 05 |
| DETE-0006 | Outlier Label 06 | Outlier Category 06 |

**t_control_only_addresses_threat_class_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| THRE-0001 | THRE-0001 | THRE-0003 | true |
| THRE-0002 | THRE-0002 | THRE-0003 | false |
| THRE-0003 | THRE-0003 | THRE-0003 | false |
| THRE-0004 | THRE-0004 | THRE-0003 | true |
| THRE-0005 | THRE-0005 | THRE-0003 | true |
| THRE-0006 | THRE-0006 | THRE-0003 | false |
| THRE-0007 | THRE-0007 | THRE-0003 | true |
| THRE-0008 | THRE-0008 | THRE-0003 | true |

**t_control_only_addresses_threat_class_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| THRE-0001 | THRE-0001 | THRE-0001 | 2024-12-09 |
| THRE-0002 | THRE-0002 | THRE-0001 | 2024-12-21 |
| THRE-0003 | THRE-0003 | THRE-0001 | 2025-01-04 |
| THRE-0004 | THRE-0004 | THRE-0001 | 2023-01-13 |
| THRE-0005 | THRE-0005 | THRE-0001 | 2023-09-02 |
| THRE-0006 | THRE-0006 | THRE-0001 | 2023-12-08 |
| THRE-0007 | THRE-0007 | THRE-0001 | 2025-01-04 |
| THRE-0008 | THRE-0008 | THRE-0001 | 2024-03-28 |

**t_control_only_addresses_threat_class_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| THRE-0001 | THRE-0001 | THRE-0004 | 5 |
| THRE-0002 | THRE-0001 | THRE-0005 | 99 |
| THRE-0003 | THRE-0002 | THRE-0004 | 5 |
| THRE-0004 | THRE-0002 | THRE-0005 | 926 |
| THRE-0005 | THRE-0003 | THRE-0004 | 1 |
| THRE-0006 | THRE-0003 | THRE-0005 | 740 |
| THRE-0007 | THRE-0004 | THRE-0004 | 4 |
| THRE-0008 | THRE-0004 | THRE-0005 | 301 |

**t_control_only_addresses_threat_class_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| THRE-0001 | THRE-0001 | THRE-0007 | Encoding 01 |
| THRE-0002 | THRE-0001 | THRE-0002 | Enforcement 02 |
| THRE-0003 | THRE-0001 | THRE-0008 | change rationale |
| THRE-0004 | THRE-0001 | THRE-0009 | fr |
| THRE-0005 | THRE-0001 | THRE-0006 | Scope 05 |
| THRE-0006 | THRE-0002 | THRE-0007 | Encoding 06 |
| THRE-0007 | THRE-0002 | THRE-0002 | Enforcement 07 |
| THRE-0008 | THRE-0002 | THRE-0008 | nightly summary |