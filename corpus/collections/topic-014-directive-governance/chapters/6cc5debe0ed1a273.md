---
chapter_id: 6cc5debe0ed1a273
topic_id: 14
family: 02_observation_measurement
cited_terms: ['outlier_claim_min_one_attribute', 'alert_triggered_by', 'outlier_claim_basic', 'metric_emission_subclass', 'aggregation_basic']
model: xai/grok-4.3
---

# Ontological Modeling of Descriptive Entities in Metric-Driven Monitoring

This chapter presents five tables derived from OWL axioms for descriptive information content entities and related processes. The model supports cross-table queries over outlier claims, alerts, and metric emissions within a data quality monitoring schema.

## 1 Scope and Table Derivation

The tables instantiate axioms that classify descriptive information content entities and processes that emit or are triggered by metrics. Primary keys serve as stable identifiers for each class instance. Foreign keys encode the existential restrictions and property assertions required by the axioms, enabling joins that reconstruct multi-hop relationships such as an alert triggered by a metric emitted from an outlier claim.

### 1.1 t_outlier_claim_min_one_attribute

This table embodies AXIOM 1 by requiring each descriptive information content entity instance to reference at least one attribute set via the y column. The primary key is id; y is a foreign key to t_alert_triggered_by(id). A reader can join on y to retrieve the alert that satisfies the minimum cardinality constraint for a given claim.

| id | x | y |
|----|---|---|
| ocm1 | OutlierClaim_MinAttr_01 | atb3 |
| ocm2 | OutlierClaim_MinAttr_02 | atb1 |
| ocm3 | OutlierClaim_MinAttr_03 | atb4 |
| ocm4 | OutlierClaim_MinAttr_04 | atb2 |
| ocm5 | OutlierClaim_MinAttr_05 | atb5 |

### 1.2 t_alert_triggered_by

This table embodies AXIOM 2 by recording processes that are triggered by a metric. The primary key is id; y is a foreign key to t_outlier_claim_min_one_attribute(id). Joining on y yields the specific claim whose attribute set satisfies the trigger condition.

| id | x | y |
|----|---|---|
| atb1 | Alert_Triggered_01 | ocm2 |
| atb2 | Alert_Triggered_02 | ocm4 |
| atb3 | Alert_Triggered_03 | ocm1 |
| atb4 | Alert_Triggered_04 | ocm3 |
| atb5 | Alert_Triggered_05 | ocm5 |

### 1.3 t_outlier_claim_basic

This table embodies AXIOM 3 by classifying instances that are descriptive information content entities without additional cardinality restrictions. The primary key is id; x holds the class reference.

| id | x |
|----|---|
| ocb1 | OutlierClaim_Basic_01 |
| ocb2 | OutlierClaim_Basic_02 |
| ocb3 | OutlierClaim_Basic_03 |
| ocb4 | OutlierClaim_Basic_04 |
| ocb5 | OutlierClaim_Basic_05 |
| ocb6 | OutlierClaim_Basic_06 |

### 1.4 t_metric_emission_subclass

This table embodies AXIOM 4 by linking a process subclass to the metric it emits. The primary key is id; y is a foreign key to t_outlier_claim_min_one_attribute(id). A join on y connects an emission event to the claim that carries the required attribute.

| id | x | y |
|----|---|---|
| mes1 | MetricEmission_Subclass_01 | ocm1 |
| mes2 | MetricEmission_Subclass_02 | ocm3 |
| mes3 | MetricEmission_Subclass_03 | ocm5 |
| mes4 | MetricEmission_Subclass_04 | ocm2 |
| mes5 | MetricEmission_Subclass_05 | ocm4 |

### 1.5 t_aggregation_basic

This table embodies AXIOM 5 by classifying aggregation instances that are descriptive information content entities. The primary key is id; x holds the class reference.

| id | x |
|----|---|
| agb1 | Aggregation_Basic_01 |
| agb2 | Aggregation_Basic_02 |
| agb3 | Aggregation_Basic_03 |
| agb4 | Aggregation_Basic_04 |
| agb5 | Aggregation_Basic_05 |
| agb6 | Aggregation_Basic_06 |
| agb7 | Aggregation_Basic_07 |

## 2 Cross-Join Demonstration

To determine the alert and emission details associated with outlier claim ocm1, first locate the row in t_outlier_claim_min_one_attribute where id = ocm1 (y = atb3). Follow the foreign key to t_alert_triggered_by where id = atb3. Then join t_metric_emission_subclass on y = ocm1. The resulting joined row is:

ocm1 | OutlierClaim_MinAttr_01 | atb3 | Alert_Triggered_03 | mes1 | MetricEmission_Subclass_01

```json
{"tables": [{"name": "t_outlier_claim_min_one_attribute", "rows": [["ocm1", "OutlierClaim_MinAttr_01", "atb3"], ["ocm2", "OutlierClaim_MinAttr_02", "atb1"], ["ocm3", "OutlierClaim_MinAttr_03", "atb4"], ["ocm4", "OutlierClaim_MinAttr_04", "atb2"], ["ocm5", "OutlierClaim_MinAttr_05", "atb5"]]}, {"name": "t_alert_triggered_by", "rows": [["atb1", "Alert_Triggered_01", "ocm2"], ["atb2", "Alert_Triggered_02", "ocm4"], ["atb3", "Alert_Triggered_03", "ocm1"], ["atb4", "Alert_Triggered_04", "ocm3"], ["atb5", "Alert_Triggered_05", "ocm5"]]}, {"name": "t_outlier_claim_basic", "rows": [["ocb1", "OutlierClaim_Basic_01"], ["ocb2", "OutlierClaim_Basic_02"], ["ocb3", "OutlierClaim_Basic_03"], ["ocb4", "OutlierClaim_Basic_04"], ["ocb5", "OutlierClaim_Basic_05"], ["ocb6", "OutlierClaim_Basic_06"]]}, {"name": "t_metric_emission_subclass", "rows": [["mes1", "MetricEmission_Subclass_01", "ocm1"], ["mes2", "MetricEmission_Subclass_02", "ocm3"], ["mes3", "MetricEmission_Subclass_03", "ocm5"], ["mes4", "MetricEmission_Subclass_04", "ocm2"], ["mes5", "MetricEmission_Subclass_05", "ocm4"]]}, {"name": "t_aggregation_basic", "rows": [["agb1", "Aggregation_Basic_01"], ["agb2", "Aggregation_Basic_02"], ["agb3", "Aggregation_Basic_03"], ["agb4", "Aggregation_Basic_04"], ["agb5", "Aggregation_Basic_05"], ["agb6", "Aggregation_Basic_06"], ["agb7", "Aggregation_Basic_07"]]}]}
```