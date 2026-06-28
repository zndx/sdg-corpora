---
chapter_id: ch_live_outlier_claim_supported_by_lift_5cb0c7
topic_id: 80
family: 02_observation_measurement
cited_terms: ['outlier_claim_supported_by_lift', 'lineage_edge_describes_column_flow', 'foreign_key_relation']
model: engine-refine
---

Outlier claims are anchored to unique identifiers that serve as the primary key for every record in the evidence graph. Each identifier follows a structured prefix convention—LIFT-0001 through LIFT-0004 for lift-supported claims, FLOW-0001 through FLOW-0004 for lineage records, and RELA-0001 through RELA-0004 for foreign key relations—ensuring that every entity, whether it represents a flow_rate_anomaly, a voltage_sag_incident, or a batch_workflow, can be unambiguously referenced across the entire schema. These identifiers are not merely labels; they are the join keys that enable the relational structure to express complex support relationships, attribute associations, and lineage dependencies without redundancy.

**t_outlier_claim_supported_by_lift**

| id | outlier |
| --- | --- |
| LIFT-0001 | flow_rate_anomaly |
| LIFT-0002 | voltage_sag_incident |
| LIFT-0003 | seismic_tremor_signal |
| LIFT-0004 | packet_loss_surge |
| LIFT-0005 | pH_deviation_alert |
| LIFT-0006 | network_latency_burst |
| LIFT-0007 | thermal_runaway_event |

**t_outlier_claim_supported_by_lift_supported_by**

| id | supported_by |
| --- | --- |
| LIFT-0001 | provenance_chain_hash |
| LIFT-0002 | baseline_variance_report |
| LIFT-0003 | baseline_variance_report |
| LIFT-0004 | provenance_chain_hash |
| LIFT-0005 | validation_rule_match |
| LIFT-0006 | audit_trail_entry |
| LIFT-0007 | anomaly_detection_score |
| LIFT-0008 | historical_trend_chart |

**t_outlier_claim_supported_by_lift__supported_by**

| id | outlier_id | supported_by_id | role |
| --- | --- | --- | --- |
| LIFT-0001 | LIFT-0005 | LIFT-0007 | observer |
| LIFT-0002 | LIFT-0002 | LIFT-0002 | reviewer |
| LIFT-0003 | LIFT-0007 | LIFT-0005 | contributor |
| LIFT-0004 | LIFT-0007 | LIFT-0006 | reviewer |
| LIFT-0005 | LIFT-0007 | LIFT-0008 | reviewer |
| LIFT-0006 | LIFT-0002 | LIFT-0002 | reviewer |
| LIFT-0007 | LIFT-0003 | LIFT-0006 | contributor |
| LIFT-0008 | LIFT-0001 | LIFT-0001 | observer |

**t_outlier_claim_supported_by_lift_attribute_set**

| id | attribute_set |
| --- | --- |
| LIFT-0001 | frequency_range_limit |
| LIFT-0002 | error_rate_percent |
| LIFT-0003 | confidence_level_95 |
| LIFT-0004 | deviation_sigma_count |
| LIFT-0005 | pressure_tolerance_band |
| LIFT-0006 | detection_window_hours |

**t_outlier_claim_supported_by_lift__attribute_set**

| id | outlier_id | attribute_set_id | role | cardinality_note |
| --- | --- | --- | --- | --- |
| LIFT-0001 | LIFT-0002 | LIFT-0002 | owner | Cardinality Note 01 |
| LIFT-0002 | LIFT-0007 | LIFT-0001 | contributor | Cardinality Note 02 |
| LIFT-0003 | LIFT-0002 | LIFT-0002 | owner | Cardinality Note 03 |
| LIFT-0004 | LIFT-0001 | LIFT-0001 | reviewer | Cardinality Note 04 |
| LIFT-0005 | LIFT-0006 | LIFT-0004 | contributor | Cardinality Note 05 |
| LIFT-0006 | LIFT-0001 | LIFT-0001 | owner | Cardinality Note 06 |
| LIFT-0007 | LIFT-0003 | LIFT-0001 | observer | Cardinality Note 07 |
| LIFT-0008 | LIFT-0005 | LIFT-0004 | contributor | Cardinality Note 08 |

**t_foreign_key_relation**

| id | foreign |
| --- | --- |
| RELA-0001 | batch_workflows |
| RELA-0002 | config_snapshots |
| RELA-0003 | metric_snapshots |
| RELA-0004 | schema_versions |
| RELA-0005 | query_executions |
| RELA-0006 | batch_workflows |
| RELA-0007 | data_ingestion_jobs |
| RELA-0008 | metric_snapshots |

**t_foreign_key_relation_foreign_key_to**

| id | foreign_key_to |
| --- | --- |
| RELA-0001 | system_clocks |
| RELA-0002 | schema_definitions |
| RELA-0003 | data_lake_catalog |
| RELA-0004 | core_products |
| RELA-0005 | identity_provider |
| RELA-0006 | data_lake_catalog |

Relationships between entities are materialized through junction tables that carry subject and target columns, which respectively reference the originating entity and the entity being related to. In the lift support graph, an outlier such as LIFT-0005 may be linked to a supporting artifact like LIFT-0007, while in the foreign key relation graph, a foreign entity such as batch_workflows or config_snapshots is connected to its referenced counterpart—system_clocks, schema_definitions, data_lake_catalog, or core_products. These subject-target pairs form the edges of a directed graph, where the directionality encodes the semantic flow of dependency or support.

**t_foreign_key_relation__foreign_key_to**

| id | foreign_id | foreign_key_to_id | role |
| --- | --- | --- | --- |
| RELA-0001 | RELA-0003 | RELA-0005 | owner |
| RELA-0002 | RELA-0003 | RELA-0006 | owner |
| RELA-0003 | RELA-0007 | RELA-0006 | contributor |
| RELA-0004 | RELA-0006 | RELA-0002 | contributor |
| RELA-0005 | RELA-0008 | RELA-0004 | owner |
| RELA-0006 | RELA-0007 | RELA-0003 | owner |
| RELA-0007 | RELA-0004 | RELA-0002 | owner |
| RELA-0008 | RELA-0005 | RELA-0001 | owner |

The role column annotates each relationship edge with a functional designation that clarifies the nature of the association. In the lift-to-support mapping, roles include observer, reviewer, and contributor, distinguishing between entities that merely witness a claim and those that actively validate or author it. Similarly, in the attribute association graph, roles such as owner and reviewer appear, indicating whether an attribute set is governed by the outlier or merely examined by it. This role dimension is critical for governance: it enables downstream systems to apply different trust policies depending on whether a relationship is one of ownership, contribution, or passive observation.

Cardinality notes provide metadata about the multiplicity constraints of a relationship, ensuring that consumers of the graph understand whether a given association is one-to-one, one-to-many, or many-to-many. In the attribute association table, cardinality notes such as Cardinality Note 01 through Cardinality Note 04 accompany each outlier-to-attribute binding, signaling to query engines and data catalogues how many attributes may be associated with a given outlier and under what conditions. These notes are essential for schema validation and for preventing incorrect assumptions about data completeness during downstream analytics.

Lineage records introduce two additional dimensions—confidence and uncertainty—that quantify the reliability of column flow descriptions. A lineage record with identifier FLOW-0001 carries a confidence of 0.645 and an uncertainty of 612.22, while FLOW-0004 exhibits a higher confidence of 0.779 with a substantially lower uncertainty of 708.23. These paired metrics allow data governance systems to rank lineage assertions by trustworthiness, flagging records where uncertainty exceeds acceptable thresholds for production use. The value column, holding numeric measures such as 903.86 or 259.55, provides the quantitative payload associated with each lineage assertion, enabling threshold-based alerting and trend analysis.

**fact_lineage**

| id | describes_column_flow_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| FLOW-0001 | FLOW-0006 | 0.645 | 612.22 | 903.86 |
| FLOW-0002 | FLOW-0005 | 0.071 | 133.03 | 832.18 |
| FLOW-0003 | FLOW-0004 | 0.404 | 76.69 | 862.00 |
| FLOW-0004 | FLOW-0005 | 0.779 | 708.23 | 259.55 |
| FLOW-0005 | FLOW-0002 | 0.376 | 801.99 | 986.33 |
| FLOW-0006 | FLOW-0003 | 0.744 | 956.79 | 34.40 |

Dimension tables supply categorical labels and descriptive metadata that enrich the graph with human-readable context. The describes_column_flow dimension attaches a label—such as Describes Column Flow Label 01—and a category—such as Describes Column Flow Category 01—to each lineage record, enabling filtering, grouping, and reporting by functional domain. Similarly, attribute sets carry descriptive properties like frequency_range_limit, error_rate_percent, confidence_level_95, and deviation_sigma_count, which define the measurement framework within which outlier claims are evaluated. Together, these categorical and descriptive columns transform a purely relational graph into a semantically rich knowledge base suitable for governance, auditing, and automated data quality enforcement.

**dim_describes_column_flow**

| id | describes_column_flow_label | describes_column_flow_category |
| --- | --- | --- |
| FLOW-0001 | Describes Column Flow Label 01 | Describes Column Flow Category 01 |
| FLOW-0002 | Describes Column Flow Label 02 | Describes Column Flow Category 02 |
| FLOW-0003 | Describes Column Flow Label 03 | Describes Column Flow Category 03 |
| FLOW-0004 | Describes Column Flow Label 04 | Describes Column Flow Category 04 |
| FLOW-0005 | Describes Column Flow Label 05 | Describes Column Flow Category 05 |
| FLOW-0006 | Describes Column Flow Label 06 | Describes Column Flow Category 06 |
| FLOW-0007 | Describes Column Flow Label 07 | Describes Column Flow Category 07 |