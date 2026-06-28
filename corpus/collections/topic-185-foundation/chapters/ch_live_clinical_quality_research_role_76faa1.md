---
chapter_id: ch_live_clinical_quality_research_role_76faa1
topic_id: 185
family: 08_derived
cited_terms: ['clinical_quality_research_role', 'dempster_combines_audit_evidences', 'measurement_subclass_only_one_unit']
model: engine-refine
---

Clinical quality research governance rests on a structured taxonomy of research roles, each anchored by a unique identifier such as ROLE-0001 or ROLE-0002 and classified under the clinicalqualityresearchrole domain. These roles—Quality Assurance Lead, Safety Monitor, Data Integrity Auditor—serve as the primary actors within regulated clinical environments, and their authority is mediated through association with EMS authorities including the EMA Governance Office, CDC Regulatory Division, Joint Commission Authority, and DoD Clinical Trial Office. The relationship between a role and an authority is not merely declarative; it is captured in a junction table that additionally records the functional posture of the association, whether reviewer, observer, or other operational stance, thereby encoding the precise nature of delegated oversight. A Safety Monitor, for instance, holds an association with the CDC Regulatory Division, while the same role identifier may simultaneously participate in a distinct authority relationship through a separate junction record, reflecting the multi-institutional reality of modern clinical research.

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

The scope of each role's influence is further constrained by the clinicalqualitydata to which it applies. An Adverse Event Log, a Procedure Coding Set, an Electronic Health Record Extract, and an Imaging Metadata Archive each represent distinct data domains, and the mapping between roles and these domains is governed by a cardinality constraint captured in the cardinality_note column—Cardinality Note 01 through Cardinality Note 04—alongside a functional role designation such as owner or contributor. This dual-layer specification ensures that data stewardship is unambiguous: a role may own one data domain while contributing to another, and the cardinality note provides the structural context for how many such associations are permissible. The identifier ROLE-0005 appears as a clinical_id in the junction table without a corresponding entry in the primary role table, suggesting that role identifiers can be introduced dynamically through association records, a design choice that supports the evolution of governance structures without requiring schema modification.

**t_clinical_quality_research_role_applies_to**

| id | applies_to |
| --- | --- |
| ROLE-0001 | Adverse Event Log |
| ROLE-0002 | Procedure Coding Set |
| ROLE-0003 | Electronic Health Record Extract |
| ROLE-0004 | Imaging Metadata Archive |
| ROLE-0005 | Vital Signs Stream |
| ROLE-0006 | Laboratory Results Database |

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

Evidence evaluation within this framework draws upon Dempster-Shafer theory, implemented through the fact_dempster and dim_dempster tables. Each evidence entry carries a dempster_key—EVID-0007, EVID-0003, EVID-0004—that references a categorical dimension defined in the dimension table, where Dempster Category 01 through Dempster Category 04 provide the classification schema. The factual table records three quantitative attributes: confidence, ranging from 0.014 for EVID-0002 to 0.728 for EVID-0004; uncertainty, spanning from 9.49 for EVID-0001 to 687.80 for EVID-0003; and a misc value, such as 520.46 or 846.10, which captures the measured magnitude. The inverse relationship between confidence and uncertainty is evident in the data—EVID-0004 exhibits the highest confidence (0.728) alongside a moderate uncertainty of 479.57, while EVID-0002 shows minimal confidence (0.014) paired with substantial uncertainty (392.06)—illustrating how the framework quantifies evidentiary strength.

**fact_dempster**

| id | dempster_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| EVID-0001 | EVID-0007 | 0.153 | 9.49 | 520.46 |
| EVID-0002 | EVID-0003 | 0.014 | 392.06 | 137.18 |
| EVID-0003 | EVID-0004 | 0.025 | 687.80 | 197.61 |
| EVID-0004 | EVID-0007 | 0.728 | 479.57 | 846.10 |
| EVID-0005 | EVID-0005 | 0.918 | 172.36 | 296.96 |
| EVID-0006 | EVID-0006 | 0.755 | 608.06 | 341.51 |

**dim_dempster**

| id | dempster_label | dempster_category |
| --- | --- | --- |
| EVID-0001 | Dempster Label 01 | Dempster Category 01 |
| EVID-0002 | Dempster Label 02 | Dempster Category 02 |
| EVID-0003 | Dempster Label 03 | Dempster Category 03 |
| EVID-0004 | Dempster Label 04 | Dempster Category 04 |
| EVID-0005 | Dempster Label 05 | Dempster Category 05 |
| EVID-0006 | Dempster Label 06 | Dempster Category 06 |
| EVID-0007 | Dempster Label 07 | Dempster Category 07 |
| EVID-0008 | Dempster Label 08 | Dempster Category 08 |

Measurement data is organized through a subclass architecture that enforces a single unit per measurement type, with measurements including temperature gradient, soil pH, soil moisture, and torque, each paired with its corresponding unit: newton meters, decibels, lumens, or degrees celsius. The structural integrity of this model is maintained through attribute definitions stored in the attr table, where attr_name values such as confidence, dimension_kind, method, and recorded_at are typed using XML Schema datatypes—xsd:decimal, xsd:string, and xsd:dateTime—ensuring type-safe value storage. The recorded_at attribute, typed as xsd:dateTime, receives values like 2024-07-02T10:17:22 and 2025-05-17T18:10:32 through a dedicated value table that links entity identifiers to attribute identifiers, while decimal attributes such as confidence receive numeric values like 0.584 and 0.929 through a separate decimal value table, and string attributes like dimension_kind receive values such as Dimension Kind 01 and Encoding 02 through a varchar value table. This separation of value types by schema type enforces data integrity at the storage layer while supporting the heterogeneous nature of clinical measurement metadata.

**t_measurement_subclass_only_one_unit**

| id | measurement | unit |
| --- | --- | --- |
| UNIT-0001 | temperature gradient | newton meters |
| UNIT-0002 | soil pH | decibels |
| UNIT-0003 | soil moisture | lumens |
| UNIT-0004 | torque | degrees celsius |
| UNIT-0005 | heart rate | lumens |
| UNIT-0006 | packet loss | percent |

**t_measurement_subclass_only_one_unit_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| UNIT-0001 | confidence | xsd:decimal |
| UNIT-0002 | dimension_kind | xsd:string |
| UNIT-0003 | method | xsd:string |
| UNIT-0004 | recorded_at | xsd:dateTime |
| UNIT-0005 | uncertainty | xsd:decimal |
| UNIT-0006 | unit | xsd:string |
| UNIT-0007 | value | xsd:decimal |
| UNIT-0008 | encoding | xsd:string |

**t_measurement_subclass_only_one_unit_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| UNIT-0001 | UNIT-0001 | UNIT-0004 | 2024-07-02T10:17:22 |
| UNIT-0002 | UNIT-0002 | UNIT-0004 | 2025-05-17T18:10:32 |
| UNIT-0003 | UNIT-0003 | UNIT-0004 | 2023-09-23T07:34:54 |
| UNIT-0004 | UNIT-0004 | UNIT-0004 | 2023-07-03T17:50:57 |
| UNIT-0005 | UNIT-0005 | UNIT-0004 | 2025-03-23T11:32:54 |
| UNIT-0006 | UNIT-0006 | UNIT-0004 | 2024-10-11T18:39:44 |

**t_measurement_subclass_only_one_unit_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| UNIT-0001 | UNIT-0001 | UNIT-0001 | 0.584 |
| UNIT-0002 | UNIT-0001 | UNIT-0005 | 680.89 |
| UNIT-0003 | UNIT-0001 | UNIT-0007 | 977.36 |
| UNIT-0004 | UNIT-0002 | UNIT-0001 | 0.929 |
| UNIT-0005 | UNIT-0002 | UNIT-0005 | 548.84 |
| UNIT-0006 | UNIT-0002 | UNIT-0007 | 51.31 |
| UNIT-0007 | UNIT-0003 | UNIT-0001 | 0.964 |
| UNIT-0008 | UNIT-0003 | UNIT-0005 | 305.75 |

**t_measurement_subclass_only_one_unit_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| UNIT-0001 | UNIT-0001 | UNIT-0002 | Dimension Kind 01 |
| UNIT-0002 | UNIT-0001 | UNIT-0008 | Encoding 02 |
| UNIT-0003 | UNIT-0001 | UNIT-0009 | change rationale |
| UNIT-0004 | UNIT-0001 | UNIT-0010 | fr |
| UNIT-0005 | UNIT-0001 | UNIT-0003 | hybrid |
| UNIT-0006 | UNIT-0001 | UNIT-0006 | nm |
| UNIT-0007 | UNIT-0002 | UNIT-0002 | Dimension Kind 07 |
| UNIT-0008 | UNIT-0002 | UNIT-0008 | Encoding 08 |