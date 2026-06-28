---
chapter_id: ch_live_outlier_claim_against_baseline_42a6de
topic_id: 67
family: 02_observation_measurement
cited_terms: ['outlier_claim_against_baseline', 'column_lineage_for_table_column', 'labrun_basic']
model: engine-refine
---

Attributes and their typed values constitute the foundational mechanism by which operational entities are described and audited within the data fabric. Each entity—identified by a stable key such as LABR-0001 or BASE-0001—serves as the anchor point for a collection of named properties, where the attribute name (duration_seconds, end_time, exit_code, host_name) is paired with a schema-level type declaration (xsd:decimal, xsd:dateTime, xsd:integer, xsd:string) that governs validation and serialization. The typed value tables separate scalar data by type, ensuring that a single entity like LABR-0001 can carry a decimal duration of 1438.98, an integer exit code of 918, a timestamp of 2025-01-01T00:58:28, and a string host identifier of edge-03, each stored in its own typed column family. This type-disaggregated design permits precise schema evolution and eliminates the ambiguity inherent in monolithic value columns, while the entity_id and attr_id foreign keys maintain referential integrity across the attribute-value graph.

**dim_column_2**

| id | column_2_label | column_2_category |
| --- | --- | --- |
| COLU-0001 | Column 2 Label 01 | Column 2 Category 01 |
| COLU-0002 | Column 2 Label 02 | Column 2 Category 02 |
| COLU-0003 | Column 2 Label 03 | Column 2 Category 03 |
| COLU-0004 | Column 2 Label 04 | Column 2 Category 04 |
| COLU-0005 | Column 2 Label 05 | Column 2 Category 05 |
| COLU-0006 | Column 2 Label 06 | Column 2 Category 06 |
| COLU-0007 | Column 2 Label 07 | Column 2 Category 07 |
| COLU-0008 | Column 2 Label 08 | Column 2 Category 08 |

**t_labrun_basic**

| id | labrun |
| --- | --- |
| LABR-0001 | Microplate_Scan_9A |
| LABR-0002 | MassSpec_Triplicate |
| LABR-0003 | ELISA_Screen_4B |
| LABR-0004 | PCR_Amplification |
| LABR-0005 | FlowCytometry_Sweep |
| LABR-0006 | WesternBlot_22 |
| LABR-0007 | WesternBlot_22 |
| LABR-0008 | FlowCytometry_Sweep |

**t_labrun_basic_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| LABR-0001 | duration_seconds | xsd:decimal |
| LABR-0002 | end_time | xsd:dateTime |
| LABR-0003 | exit_code | xsd:integer |
| LABR-0004 | host_name | xsd:string |
| LABR-0005 | log_level | xsd:string |
| LABR-0006 | phase | xsd:string |
| LABR-0007 | retry_count | xsd:integer |
| LABR-0008 | scheduled_at | xsd:dateTime |

**t_labrun_basic_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LABR-0001 | LABR-0001 | LABR-0002 | 2025-01-01T00:58:28 |
| LABR-0002 | LABR-0001 | LABR-0008 | 2023-02-28T02:17:46 |
| LABR-0003 | LABR-0001 | LABR-0009 | 2024-11-14T14:13:50 |
| LABR-0004 | LABR-0002 | LABR-0002 | 2025-05-09T16:03:58 |
| LABR-0005 | LABR-0002 | LABR-0008 | 2023-08-07T03:38:58 |
| LABR-0006 | LABR-0002 | LABR-0009 | 2023-11-05T10:47:29 |
| LABR-0007 | LABR-0003 | LABR-0002 | 2024-07-22T03:34:20 |
| LABR-0008 | LABR-0003 | LABR-0008 | 2023-11-18T18:40:00 |

**t_labrun_basic_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LABR-0001 | LABR-0001 | LABR-0001 | 1438.98 |
| LABR-0002 | LABR-0002 | LABR-0001 | 6523.97 |
| LABR-0003 | LABR-0003 | LABR-0001 | 7176.32 |
| LABR-0004 | LABR-0004 | LABR-0001 | 6375.34 |
| LABR-0005 | LABR-0005 | LABR-0001 | 876.07 |
| LABR-0006 | LABR-0006 | LABR-0001 | 5075.37 |
| LABR-0007 | LABR-0007 | LABR-0001 | 485.96 |
| LABR-0008 | LABR-0008 | LABR-0001 | 1443.01 |

**t_labrun_basic_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LABR-0001 | LABR-0001 | LABR-0003 | 918 |
| LABR-0002 | LABR-0001 | LABR-0007 | 57 |
| LABR-0003 | LABR-0002 | LABR-0003 | 674 |
| LABR-0004 | LABR-0002 | LABR-0007 | 220 |
| LABR-0005 | LABR-0003 | LABR-0003 | 637 |
| LABR-0006 | LABR-0003 | LABR-0007 | 406 |
| LABR-0007 | LABR-0004 | LABR-0003 | 597 |
| LABR-0008 | LABR-0004 | LABR-0007 | 367 |

**t_labrun_basic_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LABR-0001 | LABR-0001 | LABR-0004 | edge-03 |
| LABR-0002 | LABR-0001 | LABR-0005 | Log Level 02 |
| LABR-0003 | LABR-0001 | LABR-0006 | execution |
| LABR-0004 | LABR-0001 | LABR-0010 | complete |
| LABR-0005 | LABR-0001 | LABR-0011 | Triggered By 05 |
| LABR-0006 | LABR-0002 | LABR-0004 | ingest-21 |
| LABR-0007 | LABR-0002 | LABR-0005 | Log Level 07 |
| LABR-0008 | LABR-0002 | LABR-0006 | initiation |

The outlier claim framework extends this entity-attribute model into the domain of compliance monitoring, where deviations are formally asserted against governance references. An outlier such as telemetry_log_error_404 or pH_reading_11_2_deviation is linked to a baseline identifier (BASE-0001 through BASE-0004), which in turn is associated with a regulatory or policy target—policy_rule_governance, sla_latency_threshold, or regulatory_limit_max. The junction table between outlier claims and their targets introduces a role dimension, classifying each relationship as reviewer, contributor, or observer. This role attribute is not merely descriptive; it encodes the accountability chain, determining which organizational function owns the claim, which function authored it, and which function monitors it. The same baseline identifier may participate in multiple claim-target pairs with different roles, reflecting the multi-stakeholder nature of compliance assertions.

**t_outlier_claim_against_baseline**

| id | outlier |
| --- | --- |
| BASE-0001 | telemetry_log_error_404 |
| BASE-0002 | pH_reading_11_2_deviation |
| BASE-0003 | telemetry_log_error_404 |
| BASE-0004 | schema_drift_column_count |
| BASE-0005 | metric_latency_p99_exceed |
| BASE-0006 | pH_reading_11_2_deviation |

**t_outlier_claim_against_baseline_against**

| id | against |
| --- | --- |
| BASE-0001 | policy_rule_governance |
| BASE-0002 | sla_latency_threshold |
| BASE-0003 | regulatory_limit_max |
| BASE-0004 | policy_rule_governance |
| BASE-0005 | policy_rule_governance |
| BASE-0006 | baseline_model_v4 |

Column-level metadata introduces a secondary layer of categorical organization and quality quantification. The dimension table for column classifications assigns each column a human-readable label (Column 2 Label 01 through Column 2 Label 04) and a category designation (Column 2 Category 01 through Column 2 Category 04), enabling hierarchical grouping and filtering of data assets. The fact table for columns goes further by quantifying the quality of each column's data through confidence and uncertainty metrics. Confidence values range from 0.068 to 0.354, representing the proportion of data that meets quality thresholds, while uncertainty values span from 404.01 to 984.09, capturing the magnitude of measurement error or data gap. These paired metrics allow downstream consumers to weight column values appropriately—COLU-0001 with its confidence of 0.164 and uncertainty of 560.21 carries substantially less analytical weight than COLU-0002 with confidence of 0.354 and uncertainty of 404.01.

**fact_column**

| id | column_2_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| COLU-0001 | COLU-0003 | 0.164 | 560.21 | 257.80 |
| COLU-0002 | COLU-0004 | 0.068 | 744.10 | 571.55 |
| COLU-0003 | COLU-0006 | 0.107 | 984.09 | 140.18 |
| COLU-0004 | COLU-0002 | 0.354 | 404.01 | 131.27 |
| COLU-0005 | COLU-0003 | 0.790 | 109.97 | 235.19 |
| COLU-0006 | COLU-0003 | 0.934 | 653.09 | 813.74 |
| COLU-0007 | COLU-0005 | 0.938 | 827.04 | 409.13 |
| COLU-0008 | COLU-0003 | 0.734 | 419.22 | 492.32 |

The subject-target relationship, as instantiated in the outlier claim junction, formalizes the directional nature of compliance assertions. The subject column identifies the outlier entity making the claim, while the target column identifies the governance reference against which the claim is measured. Together with the role attribute, these columns form a triple that fully specifies who is asserting what against whom and in what capacity. This triple structure mirrors the subject-predicate-object pattern of RDF-style knowledge graphs, but is grounded in relational constraints that enforce referential integrity. The identifier columns across all tables—whether LABR-0001 for lab runs, BASE-0001 for baseline claims, or COLU-0001 for column facts—serve as the universal addressing scheme that allows these disparate entity types to interoperate within a single queryable fabric.

**t_outlier_claim_against_baseline__against**

| id | outlier_id | against_id | role |
| --- | --- | --- | --- |
| BASE-0001 | BASE-0001 | BASE-0005 | reviewer |
| BASE-0002 | BASE-0001 | BASE-0006 | reviewer |
| BASE-0003 | BASE-0005 | BASE-0001 | contributor |
| BASE-0004 | BASE-0005 | BASE-0001 | observer |
| BASE-0005 | BASE-0003 | BASE-0002 | observer |
| BASE-0006 | BASE-0001 | BASE-0003 | observer |
| BASE-0007 | BASE-0002 | BASE-0006 | observer |
| BASE-0008 | BASE-0001 | BASE-0002 | observer |