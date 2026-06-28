---
chapter_id: ch_live_column_tag_from_annotator_4c1979
topic_id: 186
family: 07_long_tail
cited_terms: ['column_tag_from_annotator', 'directive_union_constraint_or_policy', 'outlier_claim_supported_by']
model: engine-refine
---

Governance and compliance systems rarely treat metadata as a flat label attached to a field. They model the world as entities—column tags, policy directives, outlier findings—each carrying a stable identifier that survives joins, audits, and lineage queries. An identifier such as ANNO-0001 or POLI-0004 is not decorative; it is the anchor that lets an annotation on ingestion_latency, a mandatory flag on an access-control policy, and a downstream outlier assertion refer to the same logical object across typed value stores, attribute registries, and fact tables. Entity, in this sense, is the governed thing under description: the annotation record ANNO-0001, the policy POLI-0001, or the evidentiary node SUPP-0003. Operations depend on resolving entity identifiers consistently so that a confidence score, an effective date, and a recorded timestamp all attach to the correct subject rather than to a coincidentally similar name.

Attributes name what is being said about an entity, while attr type declares how that statement must be interpreted and stored. Confidence is typed as xsd:decimal; dimension_kind and method as xsd:string; recorded_at as xsd:dateTime; policy effective_date as xsd:date; mandatory as xsd:boolean; priority as xsd:integer. That typing is operational, not cosmetic: it routes values into the appropriate representation—decimals for scores like 0.302 on ANNO-0001 or 0.049 on ANNO-0002, varchar payloads such as Dimension Kind 01 and nightly summary, datetime instants including 2025-01-07T23:20:10, and boolean mandates where three policies carry mandatory true while POLI-0004 records false. Attr thus functions as the semantic contract; attr type enforces parseability, comparability, and validation at ingestion and at review time.

The misc dimension captures the concrete payload once typing has done its work—the literal string, number, date, or timestamp that auditors and downstream systems must read. A single entity often accumulates many misc values across attributes: ANNO-0001 holds confidence 0.302 alongside varchar annotations Encoding 02 and en, while ANNO-0002 pairs a low confidence of 0.049 with a recorded_at of 2024-03-06T18:58:36. Policy entities exhibit the same pattern: POLI-0001 combines effective_date 2024-10-31, enforcement Encoding 01, and integer priorities 3 and 17, illustrating how governance records are bundles of typed facts rather than monolithic documents. Treating misc as typed fragments rather than opaque blobs preserves queryability—one can filter on mandatory false, rank by priority 854, or reconstruct the evidentiary timeline of when an annotation was recorded—without collapsing heterogeneous semantics into a single column.

Category supplies the coarse taxonomy that groups otherwise disparate records for reporting, routing, and control selection. In provenance dimensions, supported_by_category values such as Supported By Category 01 through 04 classify the lineage labels that decorate outlier and supporting facts. Category does not replace attr-level precision; it orients humans and automation toward the right review playbook. A finding tagged under one category may trigger statistical revalidation, while another invokes policy re-read or instrument calibration checks. Used well, category bridges operational metadata and compliance workflow: it tells reviewers what kind of support they are looking at before they interpret the numeric detail underneath.

Confidence and uncertainty jointly express epistemic posture—how strongly a system or annotator stands behind a claim, and how wide the residual doubt remains. Annotator confidence 0.302 on a latency column tag signals provisional human judgment, materially weaker than 0.877 attached to outlier SUPP-0001, yet both numbers demand the same interpretive discipline: they are comparable only within a defined scoring model and must be read beside the attribute definition that produced them. Uncertainty complements confidence by quantifying dispersion or unresolved variance—516.58 versus 10.24 across outlier rows—so that a moderately confident assertion with very high uncertainty receives different treatment than a modestly confident one with tight bounds. Governance frameworks should treat the pair as a decision surface: high confidence with low uncertainty warrants automated promotion; low confidence or high uncertainty should gate escalation, withhold enforcement actions, or require secondary corroboration before a compliance_flag or retention rule is acted upon.

Supported by closes the loop between assertion and evidence, encoding which upstream artifact or analytical step grounds a fact. Outlier records reference supported_by_key values—SUPP-0006, SUPP-0002, SUPP-0001, SUPP-0003—that resolve through lineage dimensions to human-readable labels and categorical placement. The same structural pattern appears when column tags declare by_annotator POLI-0007 for api_version, explicitly binding descriptive metadata to directive_union entities such as Access Control Policy and its associated Logging Level Directive and Calibration Frequency Spec. Provenance is therefore bidirectional: policies supply normative context for annotations, while supported_by chains justify why an outlier value of 453.93 or 757.32 was surfaced at all. Mature practice stores identifiers for both the governed entity and its supporting parents, types every attribute, records misc values in disciplined stores, classifies support for workflow routing, and reads confidence together with uncertainty so that compliance actions remain traceable, proportionate, and reversible when the evidential basis shifts.

**t_column_tag_from_annotator**

| id | column | by_annotator |
| --- | --- | --- |
| ANNO-0001 | ingestion_latency | POLI-0001 |
| ANNO-0002 | compliance_flag | POLI-0007 |
| ANNO-0003 | api_version | POLI-0004 |
| ANNO-0004 | api_version | POLI-0007 |
| ANNO-0005 | compliance_flag | POLI-0001 |
| ANNO-0006 | event_timestamp | POLI-0007 |

**t_column_tag_from_annotator_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ANNO-0001 | confidence | xsd:decimal |
| ANNO-0002 | dimension_kind | xsd:string |
| ANNO-0003 | method | xsd:string |
| ANNO-0004 | recorded_at | xsd:dateTime |
| ANNO-0005 | uncertainty | xsd:decimal |
| ANNO-0006 | unit | xsd:string |
| ANNO-0007 | value | xsd:decimal |
| ANNO-0008 | encoding | xsd:string |

**t_column_tag_from_annotator_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ANNO-0001 | ANNO-0001 | ANNO-0004 | 2025-01-07T23:20:10 |
| ANNO-0002 | ANNO-0002 | ANNO-0004 | 2024-03-06T18:58:36 |
| ANNO-0003 | ANNO-0003 | ANNO-0004 | 2024-05-08T12:18:31 |
| ANNO-0004 | ANNO-0004 | ANNO-0004 | 2023-05-11T14:25:42 |
| ANNO-0005 | ANNO-0005 | ANNO-0004 | 2023-11-26T14:31:09 |
| ANNO-0006 | ANNO-0006 | ANNO-0004 | 2024-05-18T09:15:26 |

**t_column_tag_from_annotator_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ANNO-0001 | ANNO-0001 | ANNO-0001 | 0.302 |
| ANNO-0002 | ANNO-0001 | ANNO-0005 | 639.96 |
| ANNO-0003 | ANNO-0001 | ANNO-0007 | 206.06 |
| ANNO-0004 | ANNO-0002 | ANNO-0001 | 0.049 |
| ANNO-0005 | ANNO-0002 | ANNO-0005 | 98.50 |
| ANNO-0006 | ANNO-0002 | ANNO-0007 | 895.36 |
| ANNO-0007 | ANNO-0003 | ANNO-0001 | 0.609 |
| ANNO-0008 | ANNO-0003 | ANNO-0005 | 158.17 |

**t_column_tag_from_annotator_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ANNO-0001 | ANNO-0001 | ANNO-0002 | Dimension Kind 01 |
| ANNO-0002 | ANNO-0001 | ANNO-0008 | Encoding 02 |
| ANNO-0003 | ANNO-0001 | ANNO-0009 | nightly summary |
| ANNO-0004 | ANNO-0001 | ANNO-0010 | en |
| ANNO-0005 | ANNO-0001 | ANNO-0003 | hybrid |
| ANNO-0006 | ANNO-0001 | ANNO-0006 | kg |
| ANNO-0007 | ANNO-0002 | ANNO-0002 | Dimension Kind 07 |
| ANNO-0008 | ANNO-0002 | ANNO-0008 | Encoding 08 |

**t_directive_union_constraint_or_policy**

| id | directive | directive_2 | directive_3 |
| --- | --- | --- | --- |
| POLI-0001 | Compliance Validation Spec | Retention Duration Rule | Sensor Calibration Directive |
| POLI-0002 | Refresh Cycle Rule | Retention Duration Rule | Batch Size Constraint |
| POLI-0003 | Lab Assay Protocol | pH Range Specification | Telemetry Sampling Rule |
| POLI-0004 | Access Control Policy | Logging Level Directive | Calibration Frequency Spec |
| POLI-0005 | Access Control Policy | Retention Duration Rule | Integrity Check Requirement |
| POLI-0006 | Calibration Frequency Spec | Access Control Policy | Sampling Interval Rule |
| POLI-0007 | Data Quality Standard | Validation Check | Audit Log Requirement |

**t_directive_union_constraint_or_policy_attr**

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

**t_directive_union_constraint_or_policy_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0003 | true |
| POLI-0002 | POLI-0002 | POLI-0003 | true |
| POLI-0003 | POLI-0003 | POLI-0003 | true |
| POLI-0004 | POLI-0004 | POLI-0003 | false |
| POLI-0005 | POLI-0005 | POLI-0003 | true |
| POLI-0006 | POLI-0006 | POLI-0003 | true |
| POLI-0007 | POLI-0007 | POLI-0003 | false |

**t_directive_union_constraint_or_policy_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0001 | 2024-10-31 |
| POLI-0002 | POLI-0002 | POLI-0001 | 2024-11-24 |
| POLI-0003 | POLI-0003 | POLI-0001 | 2023-02-17 |
| POLI-0004 | POLI-0004 | POLI-0001 | 2024-05-10 |
| POLI-0005 | POLI-0005 | POLI-0001 | 2025-01-01 |
| POLI-0006 | POLI-0006 | POLI-0001 | 2024-10-28 |
| POLI-0007 | POLI-0007 | POLI-0001 | 2023-09-29 |

**t_directive_union_constraint_or_policy_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0004 | 3 |
| POLI-0002 | POLI-0001 | POLI-0005 | 17 |
| POLI-0003 | POLI-0002 | POLI-0004 | 5 |
| POLI-0004 | POLI-0002 | POLI-0005 | 854 |
| POLI-0005 | POLI-0003 | POLI-0004 | 1 |
| POLI-0006 | POLI-0003 | POLI-0005 | 61 |
| POLI-0007 | POLI-0004 | POLI-0004 | 4 |
| POLI-0008 | POLI-0004 | POLI-0005 | 65 |

**t_directive_union_constraint_or_policy_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0007 | Encoding 01 |
| POLI-0002 | POLI-0001 | POLI-0002 | Enforcement 02 |
| POLI-0003 | POLI-0001 | POLI-0008 | change rationale |
| POLI-0004 | POLI-0001 | POLI-0009 | fr |
| POLI-0005 | POLI-0001 | POLI-0006 | Scope 05 |
| POLI-0006 | POLI-0002 | POLI-0007 | Encoding 06 |
| POLI-0007 | POLI-0002 | POLI-0002 | Enforcement 07 |
| POLI-0008 | POLI-0002 | POLI-0008 | calibration record |

**fact_outlier**

| id | supported_by_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| SUPP-0001 | SUPP-0006 | 0.877 | 516.58 | 453.93 |
| SUPP-0002 | SUPP-0002 | 0.147 | 368.22 | 510.05 |
| SUPP-0003 | SUPP-0001 | 0.792 | 10.24 | 369.89 |
| SUPP-0004 | SUPP-0003 | 0.479 | 719.33 | 757.32 |
| SUPP-0005 | SUPP-0003 | 0.986 | 245.64 | 972.07 |
| SUPP-0006 | SUPP-0004 | 0.386 | 5.02 | 16.62 |
| SUPP-0007 | SUPP-0003 | 0.047 | 979.09 | 828.93 |

**dim_supported_by**

| id | supported_by_label | supported_by_category |
| --- | --- | --- |
| SUPP-0001 | Supported By Label 01 | Supported By Category 01 |
| SUPP-0002 | Supported By Label 02 | Supported By Category 02 |
| SUPP-0003 | Supported By Label 03 | Supported By Category 03 |
| SUPP-0004 | Supported By Label 04 | Supported By Category 04 |
| SUPP-0005 | Supported By Label 05 | Supported By Category 05 |
| SUPP-0006 | Supported By Label 06 | Supported By Category 06 |