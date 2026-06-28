---
chapter_id: ch_live_subclass_basic_43972b
topic_id: 86
family: 01_foundation
cited_terms: ['subclass_basic', 'attribute_set_min_one', 'settlement_financing_activity']
model: engine-refine
---

Within the data governance architecture, attribute measurements are captured as quantitative observations alongside their associated confidence and uncertainty metrics, forming the core of a fact-based measurement system. Each recorded attribute carries a confidence score that reflects the reliability of the observation—values such as 0.926 indicate high confidence in the measurement, whereas scores of 0.123 or 0.178 signal substantial doubt about the accuracy of the recorded value. Paired with confidence is an uncertainty magnitude, expressed as a continuous value like 957.49 or 274.08, which quantifies the absolute range of potential deviation from the reported measurement. The measured value itself, whether 482.01 or 779.52, represents the best available estimate of the underlying phenomenon. This dual-metric approach—confidence as a relative reliability indicator and uncertainty as an absolute error bound—enables downstream consumers to weight observations appropriately in aggregation and decision-making contexts.

The attribute dimension provides the semantic layer that gives these measurements meaning. Each attribute identifier maps to a human-readable label, such as Attribute Label 01 through Attribute Label 04, and is classified into a categorical grouping like Attribute Category 01 through Attribute Category 04. This classification scheme supports filtering, roll-up, and cross-tabulation across attribute types, allowing analysts to group related measurements and compare confidence and uncertainty patterns within and across categories. The separation of the attribute dimension from the fact table ensures that label changes and category reassignments can be managed independently of historical measurement records, preserving data integrity while supporting evolving taxonomies.

**t_subclass_basic**

| id | subject | subject_2 |
| --- | --- | --- |
| TSUB-0001 | ISO 8601 timestamp | Query execution engine |
| TSUB-0002 | Parquet row group | Kestrel telemetry probe |
| TSUB-0003 | Remote sensing platform | Atmospheric instrument |
| TSUB-0004 | Query execution engine | Edge gateway node |
| TSUB-0005 | Edge gateway node | Data serialization method |
| TSUB-0006 | Argo float array | ISO 8601 timestamp |
| TSUB-0007 | Measurement apparatus | Environmental monitoring device |

**fact_attribute**

| id | attribute_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| ONE-0001 | ONE-0005 | 0.926 | 957.49 | 482.01 |
| ONE-0002 | ONE-0003 | 0.786 | 274.08 | 742.87 |
| ONE-0003 | ONE-0005 | 0.123 | 455.70 | 100.75 |
| ONE-0004 | ONE-0003 | 0.178 | 516.20 | 779.52 |

**dim_attribute**

| id | attribute_label | attribute_category |
| --- | --- | --- |
| ONE-0001 | Attribute Label 01 | Attribute Category 01 |
| ONE-0002 | Attribute Label 02 | Attribute Category 02 |
| ONE-0003 | Attribute Label 03 | Attribute Category 03 |
| ONE-0004 | Attribute Label 04 | Attribute Category 04 |
| ONE-0005 | Attribute Label 05 | Attribute Category 05 |
| ONE-0006 | Attribute Label 06 | Attribute Category 06 |

Subject classification relationships are captured through a subclass mapping structure that links primary subjects to their subordinate or related entities. A subject such as "Query execution engine" may appear as a primary entity in one record and as a related subject in another, where it is paired with a parent subject like "ISO 8601 timestamp" or "Parquet row group." Similarly, "Remote sensing platform" connects to "Atmospheric instrument," and "Edge gateway node" relates to "Kestrel telemetry probe." These relationships, identified by codes such as TSUB-0001 through TSUB-0004, establish a graph of subject interdependencies that supports traversal, impact analysis, and the propagation of attribute measurements across related entities.

Settlement and financing activities are tracked through a dedicated activity registry that links operational transactions to their funding sources and project beneficiaries. Activities such as T-PLUS-ONE-CLEAR, INTERBANK-SETTLE, CASH-SETTLE-99, and SEC-SETTLE-8812 represent distinct settlement mechanisms, each associated with a financial institution—HSBC Holdings, Goldman Sachs, or Deutsche Bank AG—and a settlement project such as the SWIFT GPI Rollout, Regional Clearing Hub, or Cross-Border Rail initiative. The same financial institution may fund multiple activities, and a single project like the SWIFT GPI Rollout may receive benefits from more than one activity, creating a many-to-many relationship structure that supports multi-party settlement tracking and project-level financial attribution.

**t_settlement_financing_activity**

| id | settlement_financing_activity | funds | benefits |
| --- | --- | --- | --- |
| ACTI-0001 | T-PLUS-ONE-CLEAR | HSBC Holdings | SWIFT GPI Rollout |
| ACTI-0002 | INTERBANK-SETTLE | Goldman Sachs | Regional Clearing Hub |
| ACTI-0003 | CASH-SETTLE-99 | Deutsche Bank AG | SWIFT GPI Rollout |
| ACTI-0004 | SEC-SETTLE-8812 | Deutsche Bank AG | Cross-Border Rail |
| ACTI-0005 | CASH-SETTLE-99 | Deutsche Bank AG | Cross-Border Rail |