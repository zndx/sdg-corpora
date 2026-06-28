---
chapter_id: ch_live_summary_metric_subclass_e585e3
topic_id: 186
family: 07_long_tail
cited_terms: ['summary_metric_subclass', 'survey_response_record', 'synthetic_apriori_judgment']
model: engine-refine
---

Within the data governance architecture, metric subclasses form the foundational classification layer, each identified by a stable identifier such as METR-0001 through METR-0004 and categorized by descriptive summaries like network_bandwidth_rollup, batch_job_completion_rate, and error_rate_dashboard. These subclasses are further distinguished by their metric_kind—whether count or distribution—which determines how their associated values are aggregated and interpreted. The attribute schema for each subclass is defined separately, with attribute names including checksum, created_date, identifier, and license, each bound to a specific type such as xsd:string, xsd:date, or cco:DesignativeICE. This separation of metric definition from attribute specification enables flexible composition: a single metric subclass can carry multiple typed attributes, and the same attribute type can be reused across different subclasses without duplication.

**t_summary_metric_subclass**

| id | summary | metric_kind |
| --- | --- | --- |
| METR-0001 | network_bandwidth_rollup | count |
| METR-0002 | network_bandwidth_rollup | count |
| METR-0003 | batch_job_completion_rate | distribution |
| METR-0004 | error_rate_dashboard | count |
| METR-0005 | resource_utilization_snapshot | maximum |
| METR-0006 | storage_io_throughput | delta |
| METR-0007 | system_uptime_window | average |

**t_summary_metric_subclass_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| METR-0001 | checksum | xsd:string |
| METR-0002 | created_date | xsd:date |
| METR-0003 | identifier | cco:DesignativeICE |
| METR-0004 | license | xsd:string |
| METR-0005 | mime_type | xsd:string |
| METR-0006 | size_bytes | xsd:long |
| METR-0007 | uri | xsd:string |
| METR-0008 | version | xsd:integer |

The actual values for these attributes are materialized across three value tables, each specialized for a distinct data type. Date attributes resolve to values like 2023-11-11, 2024-08-19, 2023-07-21, and 2023-02-24 in the date-valued table, while integer attributes hold numeric measures such as 23, 7, 245, and 1 in the integer-valued table. String-valued attributes capture identifiers and metadata including the hash fragment 7b14de08, the object identifier oid:1.3.6.1, the license designation MPL-2.0, and the regional endpoint ap-south-2. Each value row links back to its owning entity through entity_id and to its defining attribute through attr_id, creating a normalized structure where the entity serves as the primary referent and the attribute as the property descriptor. This three-way join between metric subclass, attribute definition, and typed value table ensures type safety at query time while preserving the extensibility needed for evolving metric taxonomies.

**t_summary_metric_subclass_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| METR-0001 | METR-0001 | METR-0002 | 2023-11-11 |
| METR-0002 | METR-0002 | METR-0002 | 2024-08-19 |
| METR-0003 | METR-0003 | METR-0002 | 2023-07-21 |
| METR-0004 | METR-0004 | METR-0002 | 2023-02-24 |
| METR-0005 | METR-0005 | METR-0002 | 2024-01-28 |
| METR-0006 | METR-0006 | METR-0002 | 2025-06-08 |
| METR-0007 | METR-0007 | METR-0002 | 2023-06-04 |

**t_summary_metric_subclass_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| METR-0001 | METR-0001 | METR-0006 | 23 |
| METR-0002 | METR-0001 | METR-0008 | 7 |
| METR-0003 | METR-0002 | METR-0006 | 245 |
| METR-0004 | METR-0002 | METR-0008 | 1 |
| METR-0005 | METR-0003 | METR-0006 | 376 |
| METR-0006 | METR-0003 | METR-0008 | 2 |
| METR-0007 | METR-0004 | METR-0006 | 195 |
| METR-0008 | METR-0004 | METR-0008 | 7 |

**t_summary_metric_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| METR-0001 | METR-0001 | METR-0001 | 7b14de08 |
| METR-0002 | METR-0001 | METR-0003 | oid:1.3.6.1 |
| METR-0003 | METR-0001 | METR-0004 | MPL-2.0 |
| METR-0004 | METR-0001 | METR-0009 | ap-south-2 |
| METR-0005 | METR-0001 | METR-0005 | application/avro |
| METR-0006 | METR-0001 | METR-0010 | Name 06 |
| METR-0007 | METR-0001 | METR-0011 | ml-infra |
| METR-0008 | METR-0001 | METR-0012 | Tags 08 |

Survey response records operate as a parallel but distinct entity class, capturing structured feedback from researchers through a schema that ties each response to a specific survey and profile attribute. Identifiers such as RECO-0001 through RECO-0004 anchor individual records, while the survey_response_record column distinguishes between submission contexts like Peer-Review-Submission and Q3-2023-Feedback, or operational checks such as Safety-Compliance-Check. Each record captures a particular researcher profile attribute—Clearance-Level, Domain-Expertise-Code, or Protocol-Approval-Ref—and carries metadata about its encoding (ascii, unicode, or utf8) and language (es, de, or en). The encoding field is critical for data integrity: it signals how the response payload was serialized, ensuring that downstream consumers can correctly interpret byte sequences, while the language field supports multilingual survey deployments and locale-aware processing pipelines.

**t_survey_response_record**

| id | survey_response_record | captures_profile_attribute | encoding | language |
| --- | --- | --- | --- | --- |
| RECO-0001 | Peer-Review-Submission | Clearance-Level | ascii | es |
| RECO-0002 | Q3-2023-Feedback | Domain-Expertise-Code | unicode | de |
| RECO-0003 | Safety-Compliance-Check | Protocol-Approval-Ref | ascii | es |
| RECO-0004 | Q3-2023-Feedback | Protocol-Approval-Ref | utf8 | en |
| RECO-0005 | Incident-Report-Form | Funding-Source-ID | ascii | es |
| RECO-0006 | Field-Obs-Log | Institutional-Affiliation | unicode | de |
| RECO-0007 | Dev-Team-Performance | Protocol-Approval-Ref | ascii | ja |

The synthetic a priori judgment table introduces an epistemic layer that sits above both the metric and survey infrastructures. Each judgment—identified by codes such as JUDG-0001 through JUDG-0004 and named for its domain function, as in NetworkTopologyInference, LatencyThresholdRule, DataQualityHeuristic, and CalibrationOffsetTag—encodes a rule or inference that extends beyond the data it operates on. Every judgment relies on an intuitive foundation, which may be a SchemaExtensionRule, a DataAugmentationRule, or an ExpertHeuristicCache, and exhibits ampliative content in the form of a ContextualAssumptionSet or an OperatorHeuristicSet. The ampliative content is what distinguishes these judgments from mere data transformations: it represents the inferential leap that allows a system to draw conclusions not explicitly contained in the input records. Uncertainty is quantified numerically for each judgment, with values ranging from 4.78 for the NetworkTopologyInference to 940.95 for the CalibrationOffsetTag, and a computed value—such as 520.09, 428.93, 700.04, or 207.45—captures the judgment's output magnitude. This structure makes explicit the assumptions and confidence bounds that underlie automated reasoning, providing an audit trail from raw metric values and survey responses through to the higher-order inferences they support.

**t_synthetic_apriori_judgment**

| id | synthetic_apriori_judgment | relies_on_intuition | exhibits_ampliation | uncertainty | value |
| --- | --- | --- | --- | --- | --- |
| JUDG-0001 | NetworkTopologyInference | SchemaExtensionRule | ContextualAssumptionSet | 4.78 | 520.09 |
| JUDG-0002 | LatencyThresholdRule | DataAugmentationRule | OperatorHeuristicSet | 573.40 | 428.93 |
| JUDG-0003 | DataQualityHeuristic | ExpertHeuristicCache | ObservationExtensionTag | 661.11 | 700.04 |
| JUDG-0004 | CalibrationOffsetTag | ExpertHeuristicCache | ContextualAssumptionSet | 940.95 | 207.45 |
| JUDG-0005 | FaultPropagationMap | TelemetryEnrichmentTag | SchemaExtensionRule | 577.05 | 829.13 |
| JUDG-0006 | LatencyThresholdRule | DerivedInsightSet | DerivedInsightSet | 856.34 | 868.32 |
| JUDG-0007 | FaultPropagationMap | OperatorHeuristicSet | DerivedInsightSet | 29.46 | 167.85 |