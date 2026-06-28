---
chapter_id: ch_live_column_type_changed_from_c9181a
topic_id: 2
family: 07_long_tail
cited_terms: ['column_type_changed_from', 'artifact_with_role', 'control_with_evidence_requirement']
model: engine-refine
---

Data lineage and quality assurance in governed environments depend upon a structured taxonomy of identifiers, confidence metrics, and enforcement classifications that together enable auditable tracking of schema evolution and artifact integrity. Each record within the governance framework carries a unique identifier—such as FROM-0001 or ROLE-0001—that anchors it within a referential network, ensuring that every type change, artifact, and control requirement can be traced to its origin. The type_changed_from dimension captures the prior state of a column before modification, assigning both a categorical classification and a human-readable label; for instance, FROM-0001 maps to Type Changed From Category 01 and Type Changed From Label 01, while FROM-0003 and FROM-0004 both fall under Type Changed From Category 06, indicating that multiple schema modifications may share a common classification despite differing in their specific identifiers. This categorical grouping supports aggregation and trend analysis across schema changes, allowing governance teams to identify which categories of type modifications occur most frequently and warrant closer scrutiny.

**fact_column**

| id | type_changed_from_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| FROM-0001 | FROM-0006 | 0.164 | 560.21 | 257.80 |
| FROM-0002 | FROM-0003 | 0.068 | 744.10 | 571.55 |
| FROM-0003 | FROM-0006 | 0.107 | 984.09 | 140.18 |
| FROM-0004 | FROM-0006 | 0.354 | 404.01 | 131.27 |
| FROM-0005 | FROM-0001 | 0.790 | 109.97 | 235.19 |
| FROM-0006 | FROM-0002 | 0.934 | 653.09 | 813.74 |
| FROM-0007 | FROM-0004 | 0.938 | 827.04 | 409.13 |
| FROM-0008 | FROM-0003 | 0.734 | 419.22 | 492.32 |

**dim_type_changed_from**

| id | type_changed_from_label | type_changed_from_category |
| --- | --- | --- |
| FROM-0001 | Type Changed From Label 01 | Type Changed From Category 01 |
| FROM-0002 | Type Changed From Label 02 | Type Changed From Category 02 |
| FROM-0003 | Type Changed From Label 03 | Type Changed From Category 03 |
| FROM-0004 | Type Changed From Label 04 | Type Changed From Category 04 |
| FROM-0005 | Type Changed From Label 05 | Type Changed From Category 05 |
| FROM-0006 | Type Changed From Label 06 | Type Changed From Category 06 |

**t_artifact_with_role**

| id | artifact | role | checksum | size_bytes |
| --- | --- | --- | --- | --- |
| ROLE-0001 | patient-cohorts-2023 | REQU-0001 | 5e8f3c91 | 666903238 |
| ROLE-0002 | patient-cohorts-2023 | REQU-0004 | 7b14de08 | 309925726 |
| ROLE-0003 | feature-store-cache | REQU-0003 | a3f9c21e | 29914871 |
| ROLE-0004 | feature-store-cache | REQU-0001 | 9d2b7a16 | 347040623 |
| ROLE-0005 | raw-exports-batch-9 | REQU-0003 | c0ffee42 | 485402723 |
| ROLE-0006 | patient-cohorts-2023 | REQU-0005 | 5e8f3c91 | 504986609 |

Associated with each type change record are quantitative measures of confidence and uncertainty that reflect the reliability of the captured metadata. Confidence values range from 0.068 for FROM-0002 to 0.354 for FROM-0004, while uncertainty metrics span from 404.01 to 984.09, with FROM-0003 exhibiting the highest uncertainty at 984.09 despite a moderate confidence of 0.107. These paired metrics serve as quality signals: a record with low confidence and high uncertainty, such as FROM-0002 (confidence 0.068, uncertainty 744.10), suggests that the type change was either poorly documented or inferred through automated heuristics, whereas FROM-0004 (confidence 0.354, uncertainty 404.01) represents a more reliably captured modification. The value column, classified as miscellaneous data, provides an additional numeric anchor for each record—values such as 257.80, 571.55, 140.18, and 131.27 may represent derived statistics or supplementary measurements relevant to the change context.

Artifact integrity within the governance framework is established through cryptographic checksums and size measurements that together form a verifiable fingerprint for each stored component. The t_artifact_with_role table associates artifacts such as patient-cohorts-2023 and feature-store-cache with specific roles and integrity attributes; patient-cohorts-2023 appears under two distinct roles (REQU-0001 and REQU-0004) with corresponding checksums 5e8f3c91 and 7b14de08, and sizes of 666903238 and 309925726 bytes respectively, indicating that the same logical artifact may be stored or cached in multiple forms. Similarly, feature-store-cache is tracked under roles REQU-0003 and REQU-0001 with checksums a3f9c21e and 9d2b7a16 and sizes 29914871 and 347040623 bytes, demonstrating that artifact replication across roles necessitates independent integrity verification. The checksums—short hexadecimal strings like 5e8f3c91—provide a compact yet collision-resistant verification mechanism, while the size_bytes field, measured in bytes, enables capacity planning and anomaly detection when unexpected size variations occur.

Compliance enforcement is governed through a control framework that specifies not only what evidence is required but also the regulatory weight of each requirement and the language in which it is expressed. The t_control_with_evidence_requirement table links controls such as DataEncryptionAtRest and BaselineConfigurationCheck to evidence roles with varying enforcement classifications: DataEncryptionAtRest appears three times (under REQU-0001, REQU-0003, and REQU-0004) with enforcement levels of deprecated, deprecated, and mandatory respectively, illustrating that the same control may carry different regulatory significance depending on its contextual application. The requirement REQU-0002, governing BaselineConfigurationCheck, carries an advisory enforcement level, signaling that compliance is encouraged but not mandated. Language localization is also tracked, with requirements expressed in English (en), Spanish (es), and Japanese (ja), ensuring that governance documentation reaches stakeholders in their operational language. The evidence requirements themselves reference artifact roles—ROLE-0001, ROLE-0003, ROLE-0006—creating a cross-referential structure that ties compliance obligations to the verifiable artifacts and their integrity checksums.

**t_control_with_evidence_requirement**

| id | control | requires_evidence | enforcement | language |
| --- | --- | --- | --- | --- |
| REQU-0001 | DataEncryptionAtRest | ROLE-0001 | deprecated | en |
| REQU-0002 | BaselineConfigurationCheck | ROLE-0006 | advisory | es |
| REQU-0003 | DataEncryptionAtRest | ROLE-0003 | deprecated | en |
| REQU-0004 | DataEncryptionAtRest | ROLE-0001 | mandatory | ja |
| REQU-0005 | MultiFactorAuth | ROLE-0004 | advisory | ja |
| REQU-0006 | DataEncryptionAtRest | ROLE-0003 | blocking | en |