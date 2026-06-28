---
chapter_id: ch_live_profile_of_dataset_bdbc07
topic_id: 2
family: 02_observation_measurement
cited_terms: ['profile_of_dataset', 'nonbreaking_change_subclass', 'control_with_evidence_requirement']
model: engine-refine
---

The foundational architecture of the registry relies on stable identifiers to anchor every entity, whether it be a profile, a change subclass, or a compliance requirement. Each record is assigned a unique identifier—such as DATA-0001 for a profile fact or CHAN-0001 for a non-breaking change subclass—which serves as the primary key for relational integrity across the schema. These identifiers bind the fact_profile table to its dimensional counterpart, dim_profile, establishing a clear lineage between a measured profile instance and its descriptive metadata. Within the fact table, each profile instance is evaluated against dual metrics of reliability: confidence and uncertainty. A profile keyed as DATA-0005 may exhibit a high confidence of 0.994 alongside an uncertainty of 557.92, whereas another instance of the same key might register a confidence of merely 0.299 with an uncertainty of 284.36. These paired values quantify the precision of the profile measurement, allowing downstream consumers to weigh the validity of the recorded value—ranging from 380.57 to 728.94—against the inherent variance of the observation.

**fact_profile**

| id | profile_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| DATA-0001 | DATA-0005 | 0.299 | 284.36 | 728.94 |
| DATA-0002 | DATA-0005 | 0.994 | 557.92 | 380.57 |
| DATA-0003 | DATA-0003 | 0.773 | 622.09 | 607.36 |
| DATA-0004 | DATA-0006 | 0.226 | 488.10 | 448.09 |

**t_nonbreaking_change_subclass**

| id | nonbreaking |
| --- | --- |
| CHAN-0001 | Metric Name Addition |
| CHAN-0002 | Dependency Version Bump |
| CHAN-0003 | License Header Update |
| CHAN-0004 | Field Nullability Change |
| CHAN-0005 | Field Nullability Change |
| CHAN-0006 | Log Format Extension |

**t_nonbreaking_change_subclass_non_breaking_change_for**

| id | non_breaking_change_for |
| --- | --- |
| CHAN-0001 | ML Feature Store |
| CHAN-0002 | Cloud Storage Bucket |
| CHAN-0003 | GraphQL Endpoint |
| CHAN-0004 | Event Ingestion Pipeline |
| CHAN-0005 | REST API Gateway |
| CHAN-0006 | Data Lake Warehouse |

To impose semantic structure upon these measured profiles, the system employs a categorical taxonomy managed through dim_profile_category and the profile_category attribute within dim_profile. Every profile is classified under a specific category, such as Category Name 01 or Category Name 02, which is formally linked via the category_id foreign key. This categorization operates in tandem with misc attributes, specifically the profile_label, which provides a human-readable designation like Profile Label 01 or Profile Label 03. The dimensional profile table thus acts as a bridge, mapping the raw identifiers to their respective category classifications and descriptive labels, ensuring that the quantitative data captured in the fact table is contextualized within a standardized governance framework.

**dim_profile_category**

| id | category_name |
| --- | --- |
| DATA-0001 | Category Name 01 |
| DATA-0002 | Category Name 02 |
| DATA-0003 | Category Name 03 |
| DATA-0004 | Category Name 04 |
| DATA-0005 | Category Name 05 |
| DATA-0006 | Category Name 06 |

**dim_profile**

| id | profile_label | profile_category | category_id |
| --- | --- | --- | --- |
| DATA-0001 | Profile Label 01 | Profile Category 01 | DATA-0004 |
| DATA-0002 | Profile Label 02 | Profile Category 02 | DATA-0006 |
| DATA-0003 | Profile Label 03 | Profile Category 03 | DATA-0005 |
| DATA-0004 | Profile Label 04 | Profile Category 04 | DATA-0001 |
| DATA-0005 | Profile Label 05 | Profile Category 05 | DATA-0002 |
| DATA-0006 | Profile Label 06 | Profile Category 06 | DATA-0004 |
| DATA-0007 | Profile Label 07 | Profile Category 07 | DATA-0002 |

Beyond static profiling, the registry models dynamic relationships between change events and the systems they impact, distinguishing between the subject of a modification and the target system affected. The t_nonbreaking_change_subclass table enumerates specific change types—such as Metric Name Addition, Dependency Version Bump, or Field Nullability Change—each identified by a CHAN-prefixed key. These subjects are mapped to their respective target environments, including the ML Feature Store, Cloud Storage Bucket, or Event Ingestion Pipeline, through a junction table that also assigns a role to the relationship. A single subject, such as CHAN-0004 (Field Nullability Change), may act as an observer against one target while a different subject, like CHAN-0001 (Metric Name Addition), assumes a contributor role against another, illustrating the granular access and impact modeling required for complex infrastructure.

**t_nonbreaking_change_subclass__non_breaking_change_for**

| id | nonbreaking_id | non_breaking_change_for_id | role |
| --- | --- | --- | --- |
| CHAN-0001 | CHAN-0004 | CHAN-0006 | observer |
| CHAN-0002 | CHAN-0006 | CHAN-0005 | contributor |
| CHAN-0003 | CHAN-0001 | CHAN-0003 | reviewer |
| CHAN-0004 | CHAN-0003 | CHAN-0002 | contributor |
| CHAN-0005 | CHAN-0002 | CHAN-0006 | observer |
| CHAN-0006 | CHAN-0005 | CHAN-0001 | reviewer |
| CHAN-0007 | CHAN-0001 | CHAN-0005 | reviewer |
| CHAN-0008 | CHAN-0002 | CHAN-0006 | owner |

Finally, the governance layer enforces compliance through the t_control_with_evidence_requirement table, which dictates how controls are applied, validated, and communicated. Each control, such as DataEncryptionAtRest or BaselineConfigurationCheck, is bound to a specific piece of evidence—identified by a CHAN key—and is subject to a defined enforcement posture, which may be mandatory, advisory, or deprecated. This enforcement directive ensures that the appropriate level of rigor is applied to the control, while the language attribute (en, es, ja) standardizes the documentation and communication of these requirements across multilingual operational teams. By explicitly linking the control mechanism to its evidence source and regulatory weight, the system guarantees that compliance is not merely a theoretical state but a verifiable, auditable condition.

**t_control_with_evidence_requirement**

| id | control | requires_evidence | enforcement | language |
| --- | --- | --- | --- | --- |
| REQU-0001 | DataEncryptionAtRest | CHAN-0001 | deprecated | en |
| REQU-0002 | BaselineConfigurationCheck | CHAN-0006 | advisory | es |
| REQU-0003 | DataEncryptionAtRest | CHAN-0003 | deprecated | en |
| REQU-0004 | DataEncryptionAtRest | CHAN-0001 | mandatory | ja |