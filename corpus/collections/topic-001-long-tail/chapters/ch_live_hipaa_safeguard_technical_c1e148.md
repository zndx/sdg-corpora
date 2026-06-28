---
chapter_id: ch_live_hipaa_safeguard_technical_c1e148
topic_id: 1
family: 07_long_tail
cited_terms: ['hipaa_safeguard_technical', 'outlier_detection_basic', 'dempster_conflict_mass']
model: engine-refine
---

Within the HIPAA safeguard registry, each technical control is anchored by a unique identifier—TECH-0001 through TECH-0004—that serves as the stable reference point across all attribute and value tables. These identifiers are not merely labels; they are the join keys that bind the core safeguard record to its typed attribute definitions and to the heterogeneous value stores that hold actual data. A safeguard such as the Transaction Rule or the Breach Notification Rule is thus decomposed into a set of named attributes—effective_date, enforcement, mandatory, priority—each declared with a precise XSD type: xsd:date, xsd:string, xsd:boolean, xsd:integer. This type discipline dictates which value table receives the data. Boolean attributes flow into t_hipaa_safeguard_technical_val_boolean, where entity_id references the safeguard's identifier and attr_id points to the attribute definition, yielding values such as true or false; date attributes land in t_hipaa_safeguard_technical_val_date with concrete dates like 2025-01-15 and 2023-08-04; integer attributes populate t_hipaa_safeguard_technical_val_int with values ranging from 2 to 784; and string attributes are stored in t_hipaa_safeguard_technical_val_varchar with entries such as Encoding 01, Enforcement 02, and change rationale. The entity column in each value table is the foreign key back to the safeguard's identifier, and the attr_id column is the foreign key to the attribute definition, creating a normalized structure that separates schema from instance data.

**t_hipaa_safeguard_technical**

| id | hipaa | hipaa_safeguard |
| --- | --- | --- |
| TECH-0001 | Transaction Rule | Intrusion Detection |
| TECH-0002 | Data Backup | Enforcement Rule |
| TECH-0003 | Enforcement Rule | Breach Notification Rule |
| TECH-0004 | Breach Notification Rule | Privacy Rule |
| TECH-0005 | Breach Notification Rule | Transmission Security |
| TECH-0006 | Access Control | Enforcement Rule |

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

The outlier detection subsystem operates on a parallel dimensional model, where each detected anomaly is identified by a key such as DETE-0001 through DETE-0004 and enriched with a categorical label and category from the dimension table. The outlier dimension assigns descriptive labels—Outlier Label 01 through Outlier Label 04—and categories—Outlier Category 01 through Outlier Category 04—that classify the nature of the deviation. The fact table records the operational telemetry of each outlier event: duration_seconds captures the elapsed time of the anomalous condition, with observed values spanning from 1182.39 seconds for DETE-0003 to 6466.78 seconds for DETE-0002; exit_code records the termination status, with codes such as 760, 4, 490, and 124 indicating different failure modes; and retry_count quantifies the number of recovery attempts, ranging from 101 for DETE-0002 to 308 for DETE-0003. The outlier_key in the fact table is a foreign key into the dimension table, enabling categorical rollups and filtering on the nature of the detected anomaly.

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

The Dempster-Shafer conflict mass framework introduces a distinct analytical layer where evidence fusion is quantified through confidence and uncertainty measures. Each conflict mass instance—identified by keys such as MASS-0001 through MASS-0004—is classified by a label and category in the dimension table, with entries like Conflict Mass Label 01 and Conflict Mass Category 01 providing semantic context. The fact table records the numerical outputs of the evidence combination process: confidence values range from 0.014 for MASS-0002 to 0.728 for MASS-0001, reflecting the degree of belief assigned to a fused proposition; uncertainty values span from 9.49 for MASS-0001 to 687.80 for MASS-0003, capturing the residual ignorance; and the value column holds the computed mass assignments, with figures such as 520.46, 137.18, 197.61, and 846.10. The conflict_mass_key in the fact table references the dimension table, allowing categorical analysis of which types of conflict mass exhibit the highest confidence or uncertainty.

**fact_dempster**

| id | conflict_mass_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| MASS-0001 | MASS-0003 | 0.153 | 9.49 | 520.46 |
| MASS-0002 | MASS-0002 | 0.014 | 392.06 | 137.18 |
| MASS-0003 | MASS-0005 | 0.025 | 687.80 | 197.61 |
| MASS-0004 | MASS-0001 | 0.728 | 479.57 | 846.10 |
| MASS-0005 | MASS-0006 | 0.918 | 172.36 | 296.96 |
| MASS-0006 | MASS-0001 | 0.755 | 608.06 | 341.51 |

Across all three subsystems—the HIPAA safeguard registry, the outlier detection pipeline, and the Dempster-Shafer evidence fusion engine—the same structural pattern recurs: a dimension table provides the categorical and descriptive metadata, while a fact table records the measurable, numeric, or typed values. The identifier column in every table serves as the primary key, and foreign key columns—entity_id, attr_id, outlier_key, conflict_mass_key—establish the relational links that enable aggregation, filtering, and cross-table joins. The misc column appears in value tables as a generic storage location for heterogeneous data, while category columns in dimension tables provide the classification hierarchy. This normalization ensures that attribute definitions, outlier classifications, and conflict mass categories remain stable reference points even as the underlying values change, supporting auditability and reproducibility in compliance reporting.

**dim_outlier**

| id | outlier_label | outlier_category |
| --- | --- | --- |
| DETE-0001 | Outlier Label 01 | Outlier Category 01 |
| DETE-0002 | Outlier Label 02 | Outlier Category 02 |
| DETE-0003 | Outlier Label 03 | Outlier Category 03 |
| DETE-0004 | Outlier Label 04 | Outlier Category 04 |
| DETE-0005 | Outlier Label 05 | Outlier Category 05 |
| DETE-0006 | Outlier Label 06 | Outlier Category 06 |

**dim_conflict_mass**

| id | conflict_mass_label | conflict_mass_category |
| --- | --- | --- |
| MASS-0001 | Conflict Mass Label 01 | Conflict Mass Category 01 |
| MASS-0002 | Conflict Mass Label 02 | Conflict Mass Category 02 |
| MASS-0003 | Conflict Mass Label 03 | Conflict Mass Category 03 |
| MASS-0004 | Conflict Mass Label 04 | Conflict Mass Category 04 |
| MASS-0005 | Conflict Mass Label 05 | Conflict Mass Category 05 |
| MASS-0006 | Conflict Mass Label 06 | Conflict Mass Category 06 |