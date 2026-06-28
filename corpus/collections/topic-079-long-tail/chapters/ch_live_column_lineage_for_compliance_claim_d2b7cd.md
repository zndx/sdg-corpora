---
chapter_id: ch_live_column_lineage_for_compliance_claim_d2b7cd
topic_id: 79
family: 07_long_tail
cited_terms: ['column_lineage_for_compliance_claim', 'syscall_basic', 'outlier_claim_supported_by']
model: engine-refine
---

In governed analytical environments, every measurable assertion must be traceable to a stable identifier that survives schema evolution, report regeneration, and cross-system reconciliation. Identifiers such as CLAI-0001 through CLAI-0004, SYSC-0001 through SYSC-0004, and SUPP-0001 through SUPP-0004 function as durable keys: they do not describe business meaning by themselves, but they bind facts to dimensions, permit idempotent updates, and allow auditors to confirm that the same logical entity referenced in a March calibration run is the same entity cited in a subsequent exception review. Where identifiers appear as foreign keys—column_key in fact_column pointing at CLAI-0005, CLAI-0006, CLAI-0004, and CLAI-0001, or supported_by_key in fact_outlier referencing SUPP-0006, SUPP-0002, SUPP-0001, and SUPP-0003—the governance model encodes relational integrity as a compliance obligation rather than as an implementation detail.

Column, in this domain, denotes the governed field or observational slot to which a fact applies, not merely a physical database column name. Dimension records attach human-facing structure to that abstraction: column_label values such as Column Label 01 through Column Label 04 supply presentation text, while column_category values from Column Category 01 through Column Category 04 supply the taxonomic frame within which reviewers interpret variance, authorize disclosure, and scope control testing. Category thus performs normative work—it partitions the measurement universe so that policy thresholds, retention rules, and escalation paths can differ by class of observation without redefining the underlying identifiers. A single category assignment can determine whether a low confidence score triggers informational logging or mandatory human attestation.

Labeltext carries a parallel but distinct function: it records the verbatim or curated textual annotation that accompanies an operational event, especially where syscall-level telemetry must be read by engineers and compliance officers alike. In t_syscall_basic, label_text entries including pre-release note, nightly summary, and calibration record contextualize syscall observations such as execve, mmap, and stat without collapsing them into opaque codes. The misc attribute absorbs values that are material to analysis yet resist clean dimensional typing—numeric magnitudes in fact_column and fact_outlier (for instance 257.80, 571.55, 140.18, and 131.27 on the column axis, or 453.93, 510.05, 369.89, and 757.32 among outliers), operational codes such as D-33, B-12, and E-21, and supplementary labels in dimension tables. Misc is not an excuse for ambiguity; it is the controlled receptacle for evidence that must be preserved even when no enumerated category yet exists.

**t_syscall_basic**

| id | syscall | code | label_text |
| --- | --- | --- | --- |
| SYSC-0001 | execve | D-33 | pre-release note |
| SYSC-0002 | mmap | B-12 | nightly summary |
| SYSC-0003 | stat | E-21 | calibration record |
| SYSC-0004 | stat | E-21 | pre-release note |
| SYSC-0005 | socket | B-12 | audit excerpt |
| SYSC-0006 | ioctl | C-07 | pre-release note |
| SYSC-0007 | stat | C-07 | audit excerpt |
| SYSC-0008 | unlink | B-12 | calibration record |

Confidence and uncertainty jointly express the epistemic status of a recorded fact and therefore govern how downstream consumers may rely upon it. Confidence scores ranging from 0.068 to 0.354 in fact_column and from 0.147 to 0.877 in fact_outlier quantify estimated correctness or model agreement on a bounded scale, while paired uncertainty magnitudes—404.01 through 984.09 for column facts, and as low as 10.24 where outlier SUPP-0003 exhibits 0.792 confidence—encode residual doubt, measurement spread, or adjudication disagreement in the unit appropriate to the metric. Operational practice treats these fields as composable controls: a high-confidence outlier at 0.877 may still demand review when uncertainty remains elevated at 516.58, whereas the combination of 0.792 confidence with 10.24 uncertainty signals a comparatively tight determination suitable for automated propagation. Policies typically specify minimum confidence floors, maximum uncertainty ceilings, and mandatory re-measurement intervals, with breaches recorded against the same identifier that originated the fact.

The supported_by construct closes the provenance loop by documenting which evidential artifact, subsystem, or attestation chain backs a given outlier or exception record. Dimension entries under supported_by_label and supported_by_category—Supported By Label 01 through Supported By Label 04 paired with Supported By Category 01 through Supported By Category 04—translate opaque SUPP keys into reviewable lineage, while fact_outlier.supported_by_key enacts the actual dependency graph, including self-referential and cross-referential patterns visible when SUPP-0002 and SUPP-0001 appear both as subjects and as supporting keys. In practice, supported_by governs evidentiary sufficiency: an outlier cannot advance to corrective action, regulatory notification, or production deployment unless the cited supporter is itself valid, current, and category-appropriate. Reviewers therefore read supported_by as a chain of custody field—linking syscall annotations, column-level measurements, and outlier adjudications into a single auditable narrative anchored by identifier, qualified by confidence and uncertainty, and explained through category, column, labeltext, and misc wherever precision alone would fail to capture operational reality.

**fact_column**

| id | column_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| CLAI-0001 | CLAI-0005 | 0.164 | 560.21 | 257.80 |
| CLAI-0002 | CLAI-0006 | 0.068 | 744.10 | 571.55 |
| CLAI-0003 | CLAI-0004 | 0.107 | 984.09 | 140.18 |
| CLAI-0004 | CLAI-0001 | 0.354 | 404.01 | 131.27 |
| CLAI-0005 | CLAI-0006 | 0.790 | 109.97 | 235.19 |
| CLAI-0006 | CLAI-0003 | 0.934 | 653.09 | 813.74 |
| CLAI-0007 | CLAI-0005 | 0.938 | 827.04 | 409.13 |
| CLAI-0008 | CLAI-0002 | 0.734 | 419.22 | 492.32 |

**dim_column**

| id | column_label | column_category |
| --- | --- | --- |
| CLAI-0001 | Column Label 01 | Column Category 01 |
| CLAI-0002 | Column Label 02 | Column Category 02 |
| CLAI-0003 | Column Label 03 | Column Category 03 |
| CLAI-0004 | Column Label 04 | Column Category 04 |
| CLAI-0005 | Column Label 05 | Column Category 05 |
| CLAI-0006 | Column Label 06 | Column Category 06 |

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