---
chapter_id: ch_live_policy_only_for_high_impact_e31623
topic_id: 159
family: 07_long_tail
cited_terms: ['policy_only_for_high_impact', 'subclass_to_process', 'outlier_claim_supported_by_lift']
model: engine-refine
---

At the heart of the governance framework lies a disciplined identification scheme, where every record carries a stable identifier—IMPA-0001, PROC-0001, LIFT-0001—that anchors it within the broader data architecture. These identifiers serve as the primary keys for policy records, process definitions, and outlier claims alike, ensuring referential integrity across the model. Policy records are classified by their NIST impact level, which maps to a dimension table providing both a human-readable label and a categorical grouping; for instance, IMPA-0002 carries the impact level label "At N I S T Impact Level Label 02" within category "At N I S T Impact Level Category 02." Each policy also carries a priority ranking—values such as 2, 3, and 5 denote relative urgency—and a review cycle measured in days, ranging from 258 to 950, which dictates how frequently the policy must be reassessed. This combination of identifier, impact classification, priority, and review cadence establishes a structured governance posture that aligns compliance obligations with organizational risk tolerance.

**fact_policy**

| id | at_n_i_s_t_impact_level_key | priority | review_cycle_days |
| --- | --- | --- | --- |
| IMPA-0001 | IMPA-0006 | 2 | 258 |
| IMPA-0002 | IMPA-0002 | 3 | 710 |
| IMPA-0003 | IMPA-0002 | 3 | 866 |
| IMPA-0004 | IMPA-0004 | 5 | 950 |
| IMPA-0005 | IMPA-0001 | 1 | 305 |
| IMPA-0006 | IMPA-0002 | 2 | 729 |

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

**t_subclass_to_process**

| id | process |
| --- | --- |
| PROC-0001 | incident response |
| PROC-0002 | data validation |
| PROC-0003 | telemetry aggregation |
| PROC-0004 | batch ingestion |
| PROC-0005 | data validation |
| PROC-0006 | stream processing |

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

Process definitions are similarly identified but extend into a flexible attribute model that captures the characteristics of each process. A process such as "incident response" or "batch ingestion" is associated with a set of attributes—duration_seconds, end_time, exit_code, host_name—each declared with a precise type from the XSD namespace: xsd:decimal, xsd:dateTime, xsd:integer, or xsd:string. This type discipline ensures that values stored against these attributes are semantically consistent and machine-interpretable. The attribute definitions are decoupled from their values, allowing the same schema to describe multiple processes while supporting type-safe validation at query time.

Values are materialized in type-specific tables keyed by entity and attribute, where the entity column references the process identifier and the attribute column references the attribute definition. For example, the decimal attribute duration_seconds holds values like 5106.96 and 6532.76 for different process entities, while the string attribute host_name records identifiers such as worker-07. The misc column in these value tables serves as the generic value container, accommodating the heterogeneous data types that the schema distributes across separate tables—datetime values like 2024-02-25T00:58:35, integer codes like 684 and 195, and freeform text like "pending" or "closeout." This normalization by type preserves data integrity while enabling efficient storage and retrieval.

**t_subclass_to_process_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| PROC-0001 | duration_seconds | xsd:decimal |
| PROC-0002 | end_time | xsd:dateTime |
| PROC-0003 | exit_code | xsd:integer |
| PROC-0004 | host_name | xsd:string |
| PROC-0005 | log_level | xsd:string |
| PROC-0006 | phase | xsd:string |
| PROC-0007 | retry_count | xsd:integer |
| PROC-0008 | scheduled_at | xsd:dateTime |

**t_subclass_to_process_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PROC-0001 | PROC-0001 | PROC-0002 | 2024-02-25T00:58:35 |
| PROC-0002 | PROC-0001 | PROC-0008 | 2025-01-11T16:52:13 |
| PROC-0003 | PROC-0001 | PROC-0009 | 2024-01-24T01:55:59 |
| PROC-0004 | PROC-0002 | PROC-0002 | 2024-06-21T23:54:50 |
| PROC-0005 | PROC-0002 | PROC-0008 | 2023-12-17T03:43:06 |
| PROC-0006 | PROC-0002 | PROC-0009 | 2023-12-07T20:42:12 |
| PROC-0007 | PROC-0003 | PROC-0002 | 2024-06-16T15:41:50 |
| PROC-0008 | PROC-0003 | PROC-0008 | 2025-01-20T06:41:15 |

**t_subclass_to_process_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PROC-0001 | PROC-0001 | PROC-0001 | 5106.96 |
| PROC-0002 | PROC-0002 | PROC-0001 | 6532.76 |
| PROC-0003 | PROC-0003 | PROC-0001 | 6219.83 |
| PROC-0004 | PROC-0004 | PROC-0001 | 2715.88 |
| PROC-0005 | PROC-0005 | PROC-0001 | 3614.44 |
| PROC-0006 | PROC-0006 | PROC-0001 | 6690.61 |

**t_subclass_to_process_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PROC-0001 | PROC-0001 | PROC-0003 | 684 |
| PROC-0002 | PROC-0001 | PROC-0007 | 195 |
| PROC-0003 | PROC-0002 | PROC-0003 | 63 |
| PROC-0004 | PROC-0002 | PROC-0007 | 361 |
| PROC-0005 | PROC-0003 | PROC-0003 | 107 |
| PROC-0006 | PROC-0003 | PROC-0007 | 1 |
| PROC-0007 | PROC-0004 | PROC-0003 | 32 |
| PROC-0008 | PROC-0004 | PROC-0007 | 2 |

**t_subclass_to_process_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PROC-0001 | PROC-0001 | PROC-0004 | worker-07 |
| PROC-0002 | PROC-0001 | PROC-0005 | Log Level 02 |
| PROC-0003 | PROC-0001 | PROC-0006 | closeout |
| PROC-0004 | PROC-0001 | PROC-0010 | pending |
| PROC-0005 | PROC-0001 | PROC-0011 | Triggered By 05 |
| PROC-0006 | PROC-0002 | PROC-0004 | worker-07 |
| PROC-0007 | PROC-0002 | PROC-0005 | Log Level 07 |
| PROC-0008 | PROC-0002 | PROC-0006 | closeout |

Outlier claims and their supporting evidence are governed by a relationship model that assigns roles and cardinality constraints to each association. A subject column identifies the outlier claim—flow_rate_anomaly, voltage_sag_incident, seismic_tremor_signal, or packet_loss_surge—while the relationship itself is annotated with a role such as observer, reviewer, contributor, or owner, which clarifies the nature of the connection. For instance, a provenance_chain_hash may serve as a reviewer of an outlier claim, while a baseline_variance_report might act as a contributor. The cardinality_note column—Cardinality Note 01 through Cardinality Note 04—documents multiplicity constraints on these relationships, ensuring that the graph of claims, evidence, and attribute sets remains semantically well-defined. Together, subject, role, and cardinality_note provide a rich, expressive layer for modeling the provenance and justification of analytical findings.

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