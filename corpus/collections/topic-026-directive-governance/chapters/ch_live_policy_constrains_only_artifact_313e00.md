---
chapter_id: ch_live_policy_constrains_only_artifact_313e00
topic_id: 26
family: 01_foundation
cited_terms: ['policy_constrains_only_artifact', 'profiling_produces_profile', 'mass_function_min_one_focal']
model: engine-refine
---

Within governed data architectures, the identifier serves as the universal anchor across all analytical and policy layers, uniquely surfacing every entity from artifact constraints to profiling facts to mass-function assignments. An identifier such as ARTI-0001 or PROF-0001 does not merely label a row; it stitches together disparate evidence streams so that a compliance policy, a profiling run, and an attribute-value assertion can be traced to a single subject. This cross-referencing capability is what allows an organization to answer questions like which policy governs a given artifact, how long a profiling job ran, or what attributes were recorded for a particular focal element.

**t_mass_function_min_one_focal**

| id | mass | focal_element |
| --- | --- | --- |
| FOCA-0001 | audit_trail_eta | ARTI-0006 |
| FOCA-0002 | audit_trail_eta | ARTI-0002 |
| FOCA-0003 | provenance_record_epsilon | ARTI-0001 |
| FOCA-0004 | sensor_array_gamma | ARTI-0007 |
| FOCA-0005 | governance_log_delta | ARTI-0002 |
| FOCA-0006 | provenance_record_epsilon | ARTI-0003 |

**t_mass_function_min_one_focal_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| FOCA-0001 | confidence | xsd:decimal |
| FOCA-0002 | dimension_kind | xsd:string |
| FOCA-0003 | method | xsd:string |
| FOCA-0004 | recorded_at | xsd:dateTime |
| FOCA-0005 | uncertainty | xsd:decimal |
| FOCA-0006 | unit | xsd:string |
| FOCA-0007 | value | xsd:decimal |
| FOCA-0008 | encoding | xsd:string |

**t_mass_function_min_one_focal_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| FOCA-0001 | FOCA-0001 | FOCA-0004 | 2023-06-19T06:37:58 |
| FOCA-0002 | FOCA-0002 | FOCA-0004 | 2023-01-26T15:54:26 |
| FOCA-0003 | FOCA-0003 | FOCA-0004 | 2024-04-19T20:46:34 |
| FOCA-0004 | FOCA-0004 | FOCA-0004 | 2023-08-08T03:21:21 |
| FOCA-0005 | FOCA-0005 | FOCA-0004 | 2023-12-10T16:04:01 |
| FOCA-0006 | FOCA-0006 | FOCA-0004 | 2024-10-11T01:06:45 |

**t_mass_function_min_one_focal_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| FOCA-0001 | FOCA-0001 | FOCA-0001 | 0.223 |
| FOCA-0002 | FOCA-0001 | FOCA-0005 | 391.04 |
| FOCA-0003 | FOCA-0001 | FOCA-0007 | 110.73 |
| FOCA-0004 | FOCA-0002 | FOCA-0001 | 0.161 |
| FOCA-0005 | FOCA-0002 | FOCA-0005 | 309.80 |
| FOCA-0006 | FOCA-0002 | FOCA-0007 | 695.08 |
| FOCA-0007 | FOCA-0003 | FOCA-0001 | 0.178 |
| FOCA-0008 | FOCA-0003 | FOCA-0005 | 14.20 |

**t_mass_function_min_one_focal_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| FOCA-0001 | FOCA-0001 | FOCA-0002 | Dimension Kind 01 |
| FOCA-0002 | FOCA-0001 | FOCA-0008 | Encoding 02 |
| FOCA-0003 | FOCA-0001 | FOCA-0009 | calibration record |
| FOCA-0004 | FOCA-0001 | FOCA-0010 | es |
| FOCA-0005 | FOCA-0001 | FOCA-0003 | hybrid |
| FOCA-0006 | FOCA-0001 | FOCA-0006 | ratio |
| FOCA-0007 | FOCA-0002 | FOCA-0002 | Dimension Kind 07 |
| FOCA-0008 | FOCA-0002 | FOCA-0008 | Encoding 08 |

Attributes and their types form the backbone of metadata enrichment, attaching structured properties to entities in a typed, queryable fashion. An attribute such as confidence, dimension_kind, method, or recorded_at is declared with a precise type—xsd:decimal, xsd:string, or xsd:dateTime—that governs how its value is stored and validated. The value tables separate these types into dedicated stores: decimal values like 0.223 or 391.04 live alongside string values such as Dimension Kind 01 or calibration record, while datetime values like 2023-06-19T06:37:58 occupy their own column family. Each value is linked to an entity and an attribute, creating a flexible entity-attribute-value model that accommodates heterogeneous metadata without sacrificing type safety. The misc column, as it appears across these value tables, is the generic carrier for whatever the attribute's value happens to be, whether a timestamp, a numeric measure, or a free-form label.

The produces dimension captures what each profiling run or analytical process generates, pairing a produces label—Produces Label 01 through Produces Label 04—with a produces category such as Produces Category 01 or Produces Category 02. This categorization enables downstream aggregation and filtering: an analyst can group all outputs by category to understand which types of artifacts are being produced most frequently, or trace a specific produces label back to its originating profiling run. The produces_key in the profiling fact table ties each run to its output, creating a direct lineage from execution to artifact.

**dim_produces**

| id | produces_label | produces_category |
| --- | --- | --- |
| PROF-0001 | Produces Label 01 | Produces Category 01 |
| PROF-0002 | Produces Label 02 | Produces Category 02 |
| PROF-0003 | Produces Label 03 | Produces Category 03 |
| PROF-0004 | Produces Label 04 | Produces Category 04 |
| PROF-0005 | Produces Label 05 | Produces Category 05 |
| PROF-0006 | Produces Label 06 | Produces Category 06 |

Profiling runs themselves are characterized by three operational metrics that together paint a picture of execution health and resource consumption. Duration seconds records how long a run took, ranging from 1113.38 seconds for a quick job to 6716.87 seconds for a longer-running process. Exit code captures the termination status—values like 725, 809, 348, and 827 indicate various success or failure conditions that downstream systems can act upon. Retry count measures how many times a run was retried before completing, with observed values spanning from 186 to 303 retries, suggesting that some processes encounter significant transient failures. Together, these metrics allow operators to identify problematic runs, optimize resource allocation, and set alerting thresholds.

**fact_profiling**

| id | produces_key | duration_seconds | exit_code | retry_count |
| --- | --- | --- | --- | --- |
| PROF-0001 | PROF-0001 | 6716.87 | 725 | 209 |
| PROF-0002 | PROF-0004 | 1113.38 | 809 | 186 |
| PROF-0003 | PROF-0004 | 2546.61 | 348 | 303 |
| PROF-0004 | PROF-0006 | 2074.93 | 827 | 264 |

Policy constraints govern which rules apply to which artifacts and with what force. Each constraint is identified by an identifier like ARTI-0001 and specifies a policy—CCPA or SOX—along with an enforcement level of mandatory or blocking and a scope of team, local, or global. A blocking enforcement under a global SOX policy means that no artifact can violate the rule regardless of which team owns it, while a mandatory enforcement scoped to a team allows for more localized control. The mass-function tables extend this governance model by linking focal elements—such as ARTI-0006 or ARTI-0002—to specific evidence types like audit_trail_eta or provenance_record_epsilon, with an associated mass value that quantifies the degree of belief in that evidence. This Dempster-Shafer framework allows the system to reason about uncertainty in compliance evidence, combining multiple sources of proof to arrive at a confidence-weighted assessment of whether an artifact meets its policy obligations.

**t_policy_constrains_only_artifact**

| id | policy | enforcement | scope |
| --- | --- | --- | --- |
| ARTI-0001 | CCPA | mandatory | team |
| ARTI-0002 | SOX | blocking | global |
| ARTI-0003 | SOX | mandatory | local |
| ARTI-0004 | CCPA | mandatory | global |
| ARTI-0005 | Basel-III | deprecated | team |
| ARTI-0006 | NIST-800-53 | deprecated | regional |
| ARTI-0007 | NIST-800-53 | advisory | regional |