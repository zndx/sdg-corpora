---
chapter_id: ch_live_schemaorg_org_legalname_b12200
topic_id: 104
family: 07_long_tail
cited_terms: ['schemaorg_org_legalname', 'observation_with_participant', 'attribute_set_subclass']
model: engine-refine
---

Organizational identity in enterprise registries rests upon a dual-key architecture wherein a stable identifier anchors both a schema-level designation and a legally registered name, with the relationship between the two mediated by a role that specifies the capacity in which the legal entity participates. An identifier such as LEGA-0001 binds the schemaorg value NexusLabs to the legal name TerraForma Holdings Ltd., while LEGA-0002 associates BioSynth with CloudNative Solutions LLC; the junction table then assigns a role—reviewer, observer, or contributor—to each subject-to-target linkage, so that schemaorg_id LEGA-0002 assumes the role of reviewer against legal_name_id LEGA-0005, and schemaorg_id LEGA-0004 simultaneously serves as reviewer against LEGA-0007 and as contributor against LEGA-0008. This separation of concerns ensures that the same legal entity can appear under multiple schemaorg references with distinct governance roles, and that the mapping remains auditable through the composite key of subject, target, and role.

**t_schemaorg_org_legalname**

| id | schemaorg |
| --- | --- |
| LEGA-0001 | NexusLabs |
| LEGA-0002 | BioSynth |
| LEGA-0003 | GlobalDataInc |
| LEGA-0004 | AeroSpaceX |
| LEGA-0005 | QuantumEdge |
| LEGA-0006 | AcmeCorp |
| LEGA-0007 | GlobalDataInc |

**t_schemaorg_org_legalname_legal_name**

| id | legal_name |
| --- | --- |
| LEGA-0001 | TerraForma Holdings Ltd. |
| LEGA-0002 | CloudNative Solutions LLC |
| LEGA-0003 | Global Data Systems LLC |
| LEGA-0004 | Acme Corporation |
| LEGA-0005 | CloudNative Solutions LLC |
| LEGA-0006 | DataBridge Analytics Corp. |
| LEGA-0007 | TerraForma Holdings Ltd. |
| LEGA-0008 | Nexus Laboratories Inc. |

**t_schemaorg_org_legalname__legal_name**

| id | schemaorg_id | legal_name_id | role |
| --- | --- | --- | --- |
| LEGA-0001 | LEGA-0002 | LEGA-0005 | reviewer |
| LEGA-0002 | LEGA-0004 | LEGA-0007 | observer |
| LEGA-0003 | LEGA-0004 | LEGA-0004 | reviewer |
| LEGA-0004 | LEGA-0006 | LEGA-0008 | contributor |
| LEGA-0005 | LEGA-0003 | LEGA-0001 | reviewer |
| LEGA-0006 | LEGA-0007 | LEGA-0007 | reviewer |
| LEGA-0007 | LEGA-0005 | LEGA-0006 | owner |
| LEGA-0008 | LEGA-0003 | LEGA-0001 | contributor |

Observations constitute the temporal layer of the data model, each record carrying an identifier that ties a measured event to its categorical classification and a set of operational metrics. The observation dimension assigns a label and a category—PART-0001 maps to Observation Label 01 and Observation Category 01, while PART-0004 carries Observation Label 04 and Observation Category 04—whereas the observation fact table records the duration in seconds, the exit code, and the retry count for each instance. A single observation key may recur across multiple fact records: PART-0002 appears with a duration of 5760.93 seconds and an exit code of 181 after 395 retries, and again with a duration of 2397.39 seconds and exit code 6 after only 33 retries, indicating that the same logical observation can be re-executed under varying conditions with divergent outcomes. The exit codes—181, 130, 6, and 901—encode termination states that, when correlated with retry counts ranging from 33 to 395, provide a granular signal of system stability and failure recovery patterns.

**fact_observation**

| id | observation_key | duration_seconds | exit_code | retry_count |
| --- | --- | --- | --- | --- |
| PART-0001 | PART-0002 | 5760.93 | 181 | 395 |
| PART-0002 | PART-0001 | 1055.05 | 130 | 277 |
| PART-0003 | PART-0002 | 2397.39 | 6 | 33 |
| PART-0004 | PART-0005 | 6608.55 | 901 | 249 |
| PART-0005 | PART-0001 | 2665.81 | 726 | 235 |
| PART-0006 | PART-0002 | 238.54 | 293 | 25 |
| PART-0007 | PART-0002 | 5114.82 | 801 | 303 |

Attributes follow an analogous dimensional-fact decomposition, where the dimension table supplies a human-readable label and a category for each attribute key, and the fact table records a numeric value alongside a confidence score and an uncertainty measure. Attribute Label 01 (category 01) and Attribute Label 02 (category 02) are anchored by identifiers SET-0001 and SET-0002 respectively, while the fact records link attribute keys SET-0003 and SET-0005 to measured values such as 482.01, 742.87, 100.75, and 779.52. Confidence values span a wide range—from 0.926 for SET-0001 to 0.123 for SET-0003—reflecting the varying degrees of certainty attached to each measurement, and the corresponding uncertainty figures (957.49, 274.08, 455.70, 516.20) quantify the absolute margin of error. The inverse relationship between confidence and uncertainty is not uniform: SET-0004 exhibits a low confidence of 0.178 with an uncertainty of 516.20, whereas SET-0002 shows a moderate confidence of 0.786 with the lowest uncertainty of 274.08, suggesting that confidence and uncertainty capture complementary but distinct aspects of measurement quality.

The misc column serves as a catch-all for free-form or non-categorical metadata that does not fit the structured label or category fields, appearing in both the observation and attribute dimension tables as observation_label and attribute_label respectively. These labels—Observation Label 01 through 04 and Attribute Label 01 through 04—provide a stable human-readable reference that persists independently of the numeric identifiers used in join operations, enabling downstream reporting and audit trails to remain intelligible even as the underlying key space evolves. The category column, by contrast, imposes a coarse-grained classification that groups observations and attributes into thematic buckets such as Observation Category 01 through 04 and Attribute Category 01 through 04, supporting aggregation and filtering at the domain level without requiring schema changes.

**dim_observation**

| id | observation_label | observation_category |
| --- | --- | --- |
| PART-0001 | Observation Label 01 | Observation Category 01 |
| PART-0002 | Observation Label 02 | Observation Category 02 |
| PART-0003 | Observation Label 03 | Observation Category 03 |
| PART-0004 | Observation Label 04 | Observation Category 04 |
| PART-0005 | Observation Label 05 | Observation Category 05 |
| PART-0006 | Observation Label 06 | Observation Category 06 |

**dim_attribute**

| id | attribute_label | attribute_category |
| --- | --- | --- |
| SET-0001 | Attribute Label 01 | Attribute Category 01 |
| SET-0002 | Attribute Label 02 | Attribute Category 02 |
| SET-0003 | Attribute Label 03 | Attribute Category 03 |
| SET-0004 | Attribute Label 04 | Attribute Category 04 |
| SET-0005 | Attribute Label 05 | Attribute Category 05 |
| SET-0006 | Attribute Label 06 | Attribute Category 06 |

Together, these constructs form a coherent framework for tracking organizational identities, operational observations, and measured attributes across systems that demand both machine-readable precision and human-interpretable context. The identifier provides the immutable anchor, the subject and target columns express relational dependencies, the role column captures the nature of those dependencies, and the category and misc columns supply the semantic layer that bridges structured data with domain vocabulary. Confidence and uncertainty quantify the reliability of attribute measurements, while duration seconds, exit codes, and retry counts characterize the operational behavior of observations, ensuring that every recorded fact carries with it the metadata necessary to assess its provenance, its validity, and its fitness for downstream use.

**fact_attribute**

| id | attribute_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| SET-0001 | SET-0005 | 0.926 | 957.49 | 482.01 |
| SET-0002 | SET-0003 | 0.786 | 274.08 | 742.87 |
| SET-0003 | SET-0005 | 0.123 | 455.70 | 100.75 |
| SET-0004 | SET-0003 | 0.178 | 516.20 | 779.52 |