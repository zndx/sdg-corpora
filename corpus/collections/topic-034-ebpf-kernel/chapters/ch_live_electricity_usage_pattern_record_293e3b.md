---
chapter_id: ch_live_electricity_usage_pattern_record_293e3b
topic_id: 34
family: 08_derived
cited_terms: ['electricity_usage_pattern_record', 'policy_only_for_high_impact', 'gauge_metric_subclass']
model: engine-refine
---

NIST impact levels serve as the foundational classification mechanism for governing the sensitivity and criticality of policies within an enterprise data architecture. Each policy record carries an impact level designation that determines its security posture, with associated priorities ranging from 2 through 5 and review cycles spanning from 258 to 950 days. A policy classified at a higher impact tier typically demands more frequent scrutiny, as evidenced by policies with priority 2 undergoing reviews every 258 days, while those at priority 5 may cycle only once every 950 days. The impact level dimension itself is enriched with categorical labels that group policies into broader classification families, enabling governance teams to apply consistent controls across similarly situated records. This two-tier structure—where the fact table anchors each policy to an impact level key and the dimension table supplies the human-readable label and category—ensures that both automated enforcement engines and human auditors reference the same authoritative classification.

**fact_policy**

| id | at_n_i_s_t_impact_level_key | priority | review_cycle_days |
| --- | --- | --- | --- |
| IMPA-0001 | IMPA-0006 | 2 | 258 |
| IMPA-0002 | IMPA-0002 | 3 | 710 |
| IMPA-0003 | IMPA-0002 | 3 | 866 |
| IMPA-0004 | IMPA-0004 | 5 | 950 |
| IMPA-0005 | IMPA-0001 | 1 | 305 |
| IMPA-0006 | IMPA-0002 | 2 | 729 |

Cardinality notes provide the semantic glue that describes how relationships between entities are constrained, particularly in many-to-many associations. When an electricity usage pattern maps to a tariff structure, the junction table captures not only the foreign-key references but also a cardinality note that documents the nature of that multiplicity. For instance, the relationship between usage pattern RECO-0004 and tariff RECO-0002 carries Cardinality Note 02, while the link from RECO-0001 to RECO-0003 is annotated with Cardinality Note 04. These annotations are essential for data lineage and impact analysis, as they clarify whether a single usage pattern can correspond to multiple tariffs or whether a tariff applies to a single pattern exclusively. Without such annotations, downstream ETL pipelines and query engines would lack the context needed to correctly aggregate or deduplicate related records.

**t_electricity_usage_pattern_record_corresponds_to_tariff**

| id | corresponds_to_tariff |
| --- | --- |
| RECO-0001 | RealTimeWholesale |
| RECO-0002 | RealTimeWholesale |
| RECO-0003 | CriticalPeakReward |
| RECO-0004 | RealTimeWholesale |
| RECO-0005 | RealTimeWholesale |
| RECO-0006 | BasicServicePlan |
| RECO-0007 | TieredResidential |
| RECO-0008 | RealTimeWholesale |

**t_electricity_usage_pattern_record__corresponds_to_tariff**

| id | electricity_id | corresponds_to_tariff_id | role | cardinality_note |
| --- | --- | --- | --- | --- |
| RECO-0001 | RECO-0006 | RECO-0002 | contributor | Cardinality Note 01 |
| RECO-0002 | RECO-0004 | RECO-0001 | contributor | Cardinality Note 02 |
| RECO-0003 | RECO-0004 | RECO-0008 | observer | Cardinality Note 03 |
| RECO-0004 | RECO-0001 | RECO-0003 | observer | Cardinality Note 04 |
| RECO-0005 | RECO-0002 | RECO-0002 | observer | Cardinality Note 05 |
| RECO-0006 | RECO-0005 | RECO-0001 | contributor | Cardinality Note 06 |
| RECO-0007 | RECO-0006 | RECO-0005 | observer | Cardinality Note 07 |
| RECO-0008 | RECO-0006 | RECO-0001 | reviewer | Cardinality Note 08 |

Categories function as the organizational taxonomy that groups both impact levels and metric kinds into coherent families. The NIST impact level dimension assigns each level to a category such as At N I S T Impact Level Category 01 through Category 04, while the metric kind dimension similarly classifies metrics into Metric Kind Category 01 through Metric Kind Category 04. This parallel categorization enables cross-domain filtering and reporting; a governance dashboard can, for example, aggregate all policies under Category 03 regardless of their specific impact level label, or group gauge metrics by their kind category to identify which measurement types dominate storage consumption. The category column thus operates as a high-level partition key that supports both analytical rollups and access-control scoping.

**dim_metric_kind**

| id | metric_kind_label | metric_kind_category |
| --- | --- | --- |
| METR-0001 | Metric Kind Label 01 | Metric Kind Category 01 |
| METR-0002 | Metric Kind Label 02 | Metric Kind Category 02 |
| METR-0003 | Metric Kind Label 03 | Metric Kind Category 03 |
| METR-0004 | Metric Kind Label 04 | Metric Kind Category 04 |
| METR-0005 | Metric Kind Label 05 | Metric Kind Category 05 |
| METR-0006 | Metric Kind Label 06 | Metric Kind Category 06 |
| METR-0007 | Metric Kind Label 07 | Metric Kind Category 07 |

Identifiers anchor every entity and relationship with a stable, machine-parseable key. Usage pattern records carry identifiers such as RECO-0001 through RECO-0004, policy impact levels use IMPA-0001 through IMPA-0004, and metric gauges are keyed by METR-0001 through METR-0004. These identifiers appear not only as primary keys in their respective dimension and fact tables but also as foreign-key references in relationship tables, where they serve as the subject and target of associations. In the junction table linking usage patterns to service categories, the electricity_id column (the subject) might hold RECO-0006 while the records_service_category_id column (the target) holds RECO-0001, establishing a directed relationship between two otherwise independent entities.

**t_electricity_usage_pattern_record**

| id | usage_pattern_record |
| --- | --- |
| RECO-0001 | BaseLoad-Res09 |
| RECO-0002 | SmartMeter-8842 |
| RECO-0003 | CommHVAC-15 |
| RECO-0004 | SmartMeter-8842 |
| RECO-0005 | LoadProfile-77B |
| RECO-0006 | ResNight-22 |

**t_electricity_usage_pattern_record_records_service_category**

| id | records_service_category |
| --- | --- |
| RECO-0001 | RuralCoopDist |
| RECO-0002 | DataCenterIT |
| RECO-0003 | IndustrialProcess |
| RECO-0004 | ResidentialGeneral |
| RECO-0005 | MunicipalLighting |
| RECO-0006 | MunicipalLighting |

**t_electricity_usage_pattern_record__records_service_category**

| id | electricity_id | records_service_category_id | role |
| --- | --- | --- | --- |
| RECO-0001 | RECO-0004 | RECO-0006 | reviewer |
| RECO-0002 | RECO-0001 | RECO-0004 | owner |
| RECO-0003 | RECO-0006 | RECO-0001 | observer |
| RECO-0004 | RECO-0006 | RECO-0006 | owner |
| RECO-0005 | RECO-0005 | RECO-0004 | observer |
| RECO-0006 | RECO-0001 | RECO-0001 | observer |
| RECO-0007 | RECO-0006 | RECO-0003 | owner |
| RECO-0008 | RECO-0004 | RECO-0005 | contributor |

**dim_at_n_i_s_t_impact_level**

| id | at_n_i_s_t_impact_level_label | at_n_i_s_t_impact_level_category |
| --- | --- | --- |
| IMPA-0001 | At N I S T Impact Level Label 01 | At N I S T Impact Level Category 01 |
| IMPA-0002 | At N I S T Impact Level Label 02 | At N I S T Impact Level Category 02 |
| IMPA-0003 | At N I S T Impact Level Label 03 | At N I S T Impact Level Category 03 |
| IMPA-0004 | At N I S T Impact Level Label 04 | At N I S T Impact Level Category 04 |
| IMPA-0005 | At N I S T Impact Level Label 05 | At N I S T Impact Level Category 05 |
| IMPA-0006 | At N I S T Impact Level Label 06 | At N I S T Impact Level Category 06 |
| IMPA-0007 | At N I S T Impact Level Label 07 | At N I S T Impact Level Category 07 |
| IMPA-0008 | At N I S T Impact Level Label 08 | At N I S T Impact Level Category 08 |

Roles further qualify these relationships by specifying the functional capacity in which each entity participates. A usage pattern record may be linked to a service category with the role of owner, indicating direct responsibility, or with the role of observer, indicating a read-only or informational relationship. Similarly, the tariff association table assigns roles such as contributor or observer to the same relationship, allowing the same pair of entities to participate in multiple relationship types with different responsibilities. This role-based relationship model supports fine-grained access control and audit trails, as a reviewer role might grant read access while an owner role confers write privileges.

Service usage categories, metric sizes, and version numbers round out the metadata landscape by providing operational context. Electricity usage patterns are classified into categories such as RuralCoopDist, DataCenterIT, IndustrialProcess, and ResidentialGeneral, each reflecting the domain in which the consumption occurs. Metric gauges carry size measurements in bytes—ranging from approximately 15 million bytes for METR-0004 to nearly 945 million bytes for METR-0001—and version numbers from 4 to 11, enabling capacity planning and backward-compatibility checks. Together, these attributes ensure that every record carries sufficient context for governance enforcement, capacity forecasting, and regulatory reporting without requiring external lookups.

**fact_gauge**

| id | metric_kind_key | size_bytes | version |
| --- | --- | --- | --- |
| METR-0001 | METR-0004 | 944581501 | 10 |
| METR-0002 | METR-0002 | 721525656 | 10 |
| METR-0003 | METR-0006 | 182468524 | 11 |
| METR-0004 | METR-0005 | 15628556 | 4 |
| METR-0005 | METR-0001 | 256894862 | 9 |
| METR-0006 | METR-0007 | 696827242 | 7 |
| METR-0007 | METR-0003 | 732080346 | 4 |
| METR-0008 | METR-0005 | 330247350 | 8 |