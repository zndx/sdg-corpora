---
chapter_id: ch_live_regional_quality_benchmark_50f2a7
topic_id: 97
family: 08_derived
cited_terms: ['regional_quality_benchmark', 'evidence_refutes_claim', 'gdpr_article_subclass']
model: engine-refine
---

In compliance registries and evidence-tracking systems, every assertion, measurement, and regulatory mapping is anchored by a stable identifier—such as `BENC-0001` or `CLAI-0001`—that serves as the immutable key across fact tables, dimension tables, and junction tables alike. These identifiers do not merely label rows; they enable referential integrity between disparate concerns. The `fact_regional` table, for instance, uses `id` as its primary key while simultaneously carrying a `regional_key` that points back to `dim_regional.id`, thereby binding quantitative regional observations to their categorical metadata. Similarly, the evidence-refutation ledger (`t_evidence_refutes_claim`) assigns each refutation record an identifier like `CLAI-0001` and then references the target claim via `refutes_claim`, which resolves to an entry in `t_gdpr_article_subclass` (e.g., `ARTI-0008`). This chain of identifiers—`BENC-0001` → `dim_regional` → `fact_regional`, or `CLAI-0001` → `ARTI-0008` → `t_gdpr_article_subclass`—forms the backbone of traceability, ensuring that any measurement, label, or regulatory mapping can be audited back to its origin.

**t_evidence_refutes_claim**

| id | evidence | refutes_claim | method | label_text |
| --- | --- | --- | --- | --- |
| CLAI-0001 | Benchmark result v2.1 | ARTI-0008 | manual | calibration record |
| CLAI-0002 | Audit report FY2023 | ARTI-0008 | hybrid | audit excerpt |
| CLAI-0003 | Sensor drift calibration | ARTI-0002 | automated | intake form |
| CLAI-0004 | Data lineage snapshot | ARTI-0008 | hybrid | pre-release note |
| CLAI-0005 | Audit report FY2023 | ARTI-0005 | hybrid | calibration record |
| CLAI-0006 | Compliance checklist 7.4 | ARTI-0007 | automated | change rationale |
| CLAI-0007 | Incident summary Aug | ARTI-0006 | inferred | intake form |

**t_gdpr_article_subclass**

| id | gdpr |
| --- | --- |
| ARTI-0001 | Brazilian LGPD |
| ARTI-0002 | Canadian PIPEDA |
| ARTI-0003 | Brazilian LGPD |
| ARTI-0004 | Canadian PIPEDA |
| ARTI-0005 | Canadian PIPEDA |
| ARTI-0006 | General Data Protection Regulation |
| ARTI-0007 | Article 6 |
| ARTI-0008 | Swiss FADP |

**t_gdpr_article_subclass_gdpr_article**

| id | gdpr_article |
| --- | --- |
| ARTI-0001 | Australian Privacy Act |
| ARTI-0002 | Japanese APPI |
| ARTI-0003 | Brazilian LGPD |
| ARTI-0004 | Article 9 |
| ARTI-0005 | ePrivacy Directive |
| ARTI-0006 | Canadian PIPEDA |

Confidence and uncertainty operate as paired epistemic measures that quantify the reliability of regional observations and, by extension, the claims they support. Within `fact_regional`, confidence values such as `0.036` and `0.601` express the degree of assurance attached to a given regional measurement, while uncertainty values like `509.32` and `762.47` capture the associated margin of error or variance. These figures are not abstract; they are tied to concrete `value` entries—`915.44`, `567.07`, `179.17`—that represent the actual observed quantities. A confidence of `0.818` paired with an uncertainty of `510.50` on a value of `179.17` signals a measurement that, while relatively certain, carries substantial absolute deviation. In governance contexts, such paired metrics allow auditors to distinguish between observations that are both precise and reliable and those that warrant further investigation before being cited as evidence against a regulatory claim.

**fact_regional**

| id | regional_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| BENC-0001 | BENC-0001 | 0.036 | 509.32 | 915.44 |
| BENC-0002 | BENC-0001 | 0.601 | 253.71 | 567.07 |
| BENC-0003 | BENC-0004 | 0.818 | 510.50 | 179.17 |
| BENC-0004 | BENC-0006 | 0.286 | 762.47 | 261.10 |
| BENC-0005 | BENC-0004 | 0.995 | 619.46 | 410.15 |
| BENC-0006 | BENC-0005 | 0.995 | 647.39 | 276.26 |

The methodological provenance of each piece of evidence is recorded through the `method` column in `t_evidence_refutes_claim`, which classifies how a refutation was established—whether through `manual` review, `automated` processing, or a `hybrid` approach. This classification is inseparable from the `label_text` field, which provides a human-readable descriptor of the evidence artifact itself: `calibration record`, `audit excerpt`, `intake form`, `pre-release note`. These labels are not decorative; they signal the nature and authority of the underlying document. An `audit excerpt` from `Audit report FY2023` carries different evidentiary weight than a `calibration record` derived from `Sensor drift calibration`, even when both target the same claim (`ARTI-0008`). The method-label pairing thus enables downstream consumers of the data to assess not only what was refuted, but how and by what instrument the refutation was produced.

Regional categorization is handled through the `dim_regional` dimension table, which maps each regional identifier to a `regional_label` (e.g., `Regional Label 01`) and a `regional_category` (e.g., `Regional Category 01`). This dimension acts as the interpretive layer over the raw quantitative facts in `fact_regional`, where `regional_key` resolves to `dim_regional.id`. The separation of categorical metadata from measured values follows a star-schema convention that permits the same set of regional categories to be reused across multiple fact records without duplication. A regional observation with `regional_key` = `BENC-0001` inherits the category `Regional Category 01` and label `Regional Label 01`, while a separate observation keyed to `BENC-0004` carries `Regional Category 04` and `Regional Label 04`. This design ensures that regional classification remains consistent and independently maintainable, even as new measurements are appended to the fact table.

**dim_regional**

| id | regional_label | regional_category |
| --- | --- | --- |
| BENC-0001 | Regional Label 01 | Regional Category 01 |
| BENC-0002 | Regional Label 02 | Regional Category 02 |
| BENC-0003 | Regional Label 03 | Regional Category 03 |
| BENC-0004 | Regional Label 04 | Regional Category 04 |
| BENC-0005 | Regional Label 05 | Regional Category 05 |
| BENC-0006 | Regional Label 06 | Regional Category 06 |

The regulatory mapping layer—spanning `t_gdpr_article_subclass`, `t_gdpr_article_subclass_gdpr_article`, and the junction table `t_gdpr_article_subclass__gdpr_article`—encodes the relationships between legal frameworks, specific articles, and the roles that entities play within those frameworks. The `t_gdpr_article_subclass` table associates identifiers like `ARTI-0001` with broad regulatory regimes such as `Brazilian LGPD` or `Canadian PIPEDA`. The intermediate table `t_gdpr_article_subclass_gdpr_article` refines this mapping by linking each subclass to a specific article, such as `Australian Privacy Act` or `Article 9`. Finally, the junction table `t_gdpr_article_subclass__gdpr_article` introduces the `subject` and `target` columns—both referencing `t_gdpr_article_subclass` entries—and a `role` column that classifies the relationship as `observer`, `contributor`, or `owner`. For example, the record with `id` = `ARTI-0001` designates `ARTI-0005` as the subject and `ARTI-0005` as the target, with the role `observer`, while `ARTI-0004` assigns `owner` status to the same subject-target pairing. This tripartite structure allows the system to model not only which regulation applies, but which entities are subject to it, which articles are targeted, and in what capacity they participate.

**t_gdpr_article_subclass__gdpr_article**

| id | gdpr_id | gdpr_article_id | role |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0005 | ARTI-0005 | observer |
| ARTI-0002 | ARTI-0007 | ARTI-0005 | contributor |
| ARTI-0003 | ARTI-0007 | ARTI-0005 | observer |
| ARTI-0004 | ARTI-0004 | ARTI-0006 | owner |
| ARTI-0005 | ARTI-0001 | ARTI-0002 | owner |
| ARTI-0006 | ARTI-0004 | ARTI-0003 | reviewer |
| ARTI-0007 | ARTI-0006 | ARTI-0002 | observer |
| ARTI-0008 | ARTI-0005 | ARTI-0006 | contributor |