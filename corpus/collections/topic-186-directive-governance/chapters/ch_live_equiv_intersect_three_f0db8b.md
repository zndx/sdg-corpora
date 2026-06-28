---
chapter_id: ch_live_equiv_intersect_three_f0db8b
topic_id: 186
family: 01_foundation
cited_terms: ['equiv_intersect_three', 'nist80053_moderate_impact', 'aggregation_uses_function']
model: engine-refine
---

An identifier serves as the immutable anchor for every record in a relational data model, guaranteeing that each entity can be referenced unambiguously across all tables and queries. In practice, identifiers follow structured naming conventions that encode their provenance: the prefix THRE-0001 through THRE-0004 denotes equivalence-intersection records, IMPA-0001 through IMPA-0004 identifies NIST moderate-impact compliance entries, and FUNC-0001 through FUNC-0005 tags aggregation-function definitions. These identifiers are not arbitrary strings but structured keys that enable foreign-key relationships to resolve correctly, ensuring referential integrity when a fact record points to a dimension record or when a relationship table links two distinct entities. Without such disciplined identification, traceability collapses and audit trails become unreliable.

**t_equiv_intersect_three**

| id | equiv | equiv_2 | equiv_3 | equiv_4 |
| --- | --- | --- | --- | --- |
| THRE-0001 | lab_sample_registry | orc_table | crosswalk_rule | dev_sandbox |
| THRE-0002 | governance_policy_alpha | orc_table | lineage_node | hot_cache |
| THRE-0003 | governance_policy_alpha | csv_archive | standard_mapping | air_gapped |
| THRE-0004 | sensor_array_gamma | hdf5_archive | crosswalk_rule | staging_zone |
| THRE-0005 | telemetry_stream_alpha | netcdf_file | retention_policy | dev_sandbox |
| THRE-0006 | lab_sample_registry | parquet_dataset | schema_binding | edge_node |

**t_nist80053_moderate_impact**

| id | nist |
| --- | --- |
| IMPA-0001 | SP 800-53 |
| IMPA-0002 | SP 800-53 |
| IMPA-0003 | SP 800-171 |
| IMPA-0004 | SP 800-218 |
| IMPA-0005 | NIST AI RMF |
| IMPA-0006 | SP 800-171 |
| IMPA-0007 | SP 800-37 |

**t_nist80053_moderate_impact_at_n_i_s_t_impact_level**

| id | at_n_i_s_t_impact_level |
| --- | --- |
| IMPA-0001 | Moderate Threshold |
| IMPA-0002 | System Security Moderate |
| IMPA-0003 | Impact Level Moderate |
| IMPA-0004 | Moderate Baseline |
| IMPA-0005 | Moderate Threshold |
| IMPA-0006 | Moderate |
| IMPA-0007 | Availability Moderate |

**fact_aggregation**

| id | uses_aggregation_function_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| FUNC-0001 | FUNC-0001 | 0.857 | 811.48 | 835.01 |
| FUNC-0002 | FUNC-0004 | 0.688 | 850.83 | 952.80 |
| FUNC-0003 | FUNC-0004 | 0.639 | 844.56 | 52.67 |
| FUNC-0004 | FUNC-0005 | 0.024 | 527.80 | 996.14 |
| FUNC-0005 | FUNC-0002 | 0.062 | 315.40 | 941.21 |

A category provides the organizational taxonomy that groups related entities into meaningful classes, enabling both human comprehension and programmatic filtering. In the aggregation-function domain, the category dimension assigns labels such as Category Name 01 through Category Name 04 to distinct aggregation function definitions, while the function dimension itself carries a secondary classification—Uses Aggregation Function Category 01 through 03—that further refines the grouping. The category_id foreign key in the dimension table establishes the linkage between a specific aggregation function and its parent category, creating a hierarchical structure where functions inherit categorical properties. This two-level categorization allows analysts to roll up metrics by broad class or drill down to individual function behavior, supporting both summary reporting and granular diagnostics.

**dim_uses_aggregation_function_category**

| id | category_name |
| --- | --- |
| FUNC-0001 | Category Name 01 |
| FUNC-0002 | Category Name 02 |
| FUNC-0003 | Category Name 03 |
| FUNC-0004 | Category Name 04 |
| FUNC-0005 | Category Name 05 |
| FUNC-0006 | Category Name 06 |

**dim_uses_aggregation_function**

| id | uses_aggregation_function_label | uses_aggregation_function_category | category_id |
| --- | --- | --- | --- |
| FUNC-0001 | Uses Aggregation Function Label 01 | Uses Aggregation Function Category 01 | FUNC-0003 |
| FUNC-0002 | Uses Aggregation Function Label 02 | Uses Aggregation Function Category 02 | FUNC-0003 |
| FUNC-0003 | Uses Aggregation Function Label 03 | Uses Aggregation Function Category 03 | FUNC-0002 |
| FUNC-0004 | Uses Aggregation Function Label 04 | Uses Aggregation Function Category 04 | FUNC-0005 |
| FUNC-0005 | Uses Aggregation Function Label 05 | Uses Aggregation Function Category 05 | FUNC-0006 |
| FUNC-0006 | Uses Aggregation Function Label 06 | Uses Aggregation Function Category 06 | FUNC-0002 |

The uses aggregation function concept represents the analytical operation applied to a fact record, serving as the bridge between raw measurements and computed summaries. Each fact record carries a uses_aggregation_function_key that references a definition in the dimension table, and through that reference, inherits both a human-readable label—such as Uses Aggregation Function Label 01—and its categorical classification. This indirection is critical: it decouples the analytical semantics from the numeric values, allowing the same aggregation function definition to be reused across multiple fact records without duplication. When a fact references FUNC-0001, for instance, the system can resolve that key to its full label and category context, ensuring that downstream consumers understand precisely what computation produced the reported value.

Confidence and uncertainty form the dual metrics that quantify the reliability of any measured or computed value. Confidence is expressed as a probability between zero and one, where a value of 0.857 indicates strong assurance in the underlying data, while 0.024 signals near-total unreliability. Uncertainty, measured on an absolute scale, captures the margin of error: values such as 811.48, 850.83, 844.56, and 527.80 represent the expected deviation from the reported figure. These two metrics are complementary—high confidence corresponds to low uncertainty and vice versa—and together they enable risk-aware decision-making. A fact with a value of 996.14 paired with a confidence of 0.024 and uncertainty of 527.80 demands fundamentally different handling than a fact with a value of 835.01, confidence of 0.857, and uncertainty of 811.48, even though both carry similar absolute uncertainty magnitudes.

The misc column accommodates auxiliary or supplementary data that does not fit neatly into the primary analytical schema. In the fact table, it holds the measured value itself—835.01, 952.80, 52.67, 996.14—while in dimension tables, it carries descriptive labels that provide human-readable context for otherwise opaque identifiers. This dual usage reflects a pragmatic design choice: misc serves as the catch-all for any attribute that is essential for interpretation but does not participate in join logic or aggregation semantics.

Subject, target, and role define the relationships between entities in a governed framework, encoding not just how things connect but the nature of those connections. In the NIST moderate-impact relationship table, the subject column (nist_id) identifies the source entity—IMPA-0002, IMPA-0006, IMPA-0007—while the target column (at_n_i_s_t_impact_level_id) identifies the destination—IMPA-0007, IMPA-0004, IMPA-0001, IMPA-0001. The role column specifies the relationship type: observer, contributor, or owner. An observer relationship indicates passive awareness without responsibility, a contributor relationship denotes active participation in the target entity's lifecycle, and an owner relationship confers full accountability. This triad—subject, target, role—forms a standard subject-target-role triple that can model any governed relationship, from compliance mappings to data lineage, without requiring a separate relationship table for each domain.

**t_nist80053_moderate_impact__at_n_i_s_t_impact_level**

| id | nist_id | at_n_i_s_t_impact_level_id | role |
| --- | --- | --- | --- |
| IMPA-0001 | IMPA-0002 | IMPA-0007 | observer |
| IMPA-0002 | IMPA-0002 | IMPA-0004 | observer |
| IMPA-0003 | IMPA-0006 | IMPA-0001 | contributor |
| IMPA-0004 | IMPA-0007 | IMPA-0007 | owner |
| IMPA-0005 | IMPA-0003 | IMPA-0002 | owner |
| IMPA-0006 | IMPA-0004 | IMPA-0005 | observer |
| IMPA-0007 | IMPA-0001 | IMPA-0006 | contributor |
| IMPA-0008 | IMPA-0003 | IMPA-0007 | owner |