---
chapter_id: ch_live_gauge_metric_subclass_982f51
topic_id: 5
family: 07_long_tail
cited_terms: ['gauge_metric_subclass', 'evidence_correlated_with', 'trace_subclass']
model: engine-refine
---

Governance of distributed telemetry relies on a disciplined taxonomy of identifiers, categories, and confidence measures that together render raw observations actionable. Every metric, span, and evidence record carries a unique identifier—METR-0001, TRAC-0001, WITH-0001—that anchors it to a dimensional reference table where human-readable labels and categorical classifications reside. The identifier METR-0001, for instance, maps through the fact_gauge table to a metric_kind_key that resolves against dim_metric_kind, where the same identifier bears the label Metric Kind Label 01 and the classification Metric Kind Category 01. This two-tier lookup—fact table to dimension table via a foreign key—ensures that every numeric observation can be traced back to a controlled vocabulary, preventing ambiguity when operators at different levels of an organization interpret the same signal.

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

The fact_gauge table captures the volumetric footprint of each metric recording. Size_bytes ranges from a modest 15,628,556 bytes for METR-0004 to nearly one gigabyte at 944,581,501 bytes for METR-0001, a spread that directly influences storage provisioning and retention policy. Each gauge entry also carries a version number—versions 4, 10, and 11 appear across the four records—allowing downstream consumers to detect schema drift or reclassification of the underlying metric kind. The metric_kind_key column in fact_gauge is the foreign key pointing to dim_metric_kind, so that the category and label metadata are maintained in a single source of truth rather than duplicated across every measurement.

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

Evidence records introduce a probabilistic layer to the telemetry model. The fact_evidence table stores a confidence value and an uncertainty figure alongside a measured value and a correlation key. Confidence spans from 0.052 for WITH-0001 to 0.474 for WITH-0003, while uncertainty ranges from 125.66 to 477.82, reflecting the inverse relationship that analysts expect: lower confidence correlates with higher uncertainty in the associated measurement. The evidence_correlated_with_key column links each fact_evidence row to dim_evidence_correlated_with, where the identifier WITH-0001 carries the label Evidence Correlated With Label 01 and the classification Evidence Correlated With Category 01. This linkage permits an analyst to ask not only what was observed but what other signals it was correlated with, and under what categorical framing.

**fact_evidence**

| id | evidence_correlated_with_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| WITH-0001 | WITH-0005 | 0.052 | 125.66 | 192.81 |
| WITH-0002 | WITH-0003 | 0.146 | 477.82 | 84.19 |
| WITH-0003 | WITH-0006 | 0.474 | 366.82 | 641.37 |
| WITH-0004 | WITH-0002 | 0.138 | 430.96 | 8.37 |

**dim_evidence_correlated_with**

| id | evidence_correlated_with_label | evidence_correlated_with_category |
| --- | --- | --- |
| WITH-0001 | Evidence Correlated With Label 01 | Evidence Correlated With Category 01 |
| WITH-0002 | Evidence Correlated With Label 02 | Evidence Correlated With Category 02 |
| WITH-0003 | Evidence Correlated With Label 03 | Evidence Correlated With Category 03 |
| WITH-0004 | Evidence Correlated With Label 04 | Evidence Correlated With Category 04 |
| WITH-0005 | Evidence Correlated With Label 05 | Evidence Correlated With Category 05 |
| WITH-0006 | Evidence Correlated With Label 06 | Evidence Correlated With Category 06 |
| WITH-0007 | Evidence Correlated With Label 07 | Evidence Correlated With Category 07 |

**dim_spans_category**

| id | category_name |
| --- | --- |
| TRAC-0001 | Category Name 01 |
| TRAC-0002 | Category Name 02 |
| TRAC-0003 | Category Name 03 |
| TRAC-0004 | Category Name 04 |
| TRAC-0005 | Category Name 05 |
| TRAC-0006 | Category Name 06 |

**dim_spans**

| id | spans_label | spans_category | category_id |
| --- | --- | --- | --- |
| TRAC-0001 | Spans Label 01 | Spans Category 01 | TRAC-0001 |
| TRAC-0002 | Spans Label 02 | Spans Category 02 | TRAC-0006 |
| TRAC-0003 | Spans Label 03 | Spans Category 03 | TRAC-0006 |
| TRAC-0004 | Spans Label 04 | Spans Category 04 | TRAC-0003 |
| TRAC-0005 | Spans Label 05 | Spans Category 05 | TRAC-0003 |
| TRAC-0006 | Spans Label 06 | Spans Category 06 | TRAC-0006 |

Trace records capture the temporal and operational dimensions of a distributed operation. Duration_seconds in fact_trace ranges from 1,874.27 seconds for TRAC-0001 to 3,940.66 seconds for TRAC-0003, while exit_code values—491, 900, 420, and 60—encode the termination status of each trace. Retry_count varies from 179 for TRAC-0002 to 459 for TRAC-0004, indicating the number of recovery attempts before the trace reached its final state. The spans_key foreign key in fact_trace resolves to dim_spans, which itself carries a category_id that points to dim_spans_category. This chain—fact_trace to dim_spans to dim_spans_category—means that every trace duration, exit code, and retry count can be classified hierarchically: TRAC-0001, for example, belongs to Spans Label 01 in Spans Category 01, and its category_id TRAC-0001 resolves in dim_spans_category to Category Name 01.

**fact_trace**

| id | spans_key | duration_seconds | exit_code | retry_count |
| --- | --- | --- | --- | --- |
| TRAC-0001 | TRAC-0005 | 1874.27 | 491 | 399 |
| TRAC-0002 | TRAC-0002 | 2092.44 | 900 | 179 |
| TRAC-0003 | TRAC-0004 | 3940.66 | 420 | 396 |
| TRAC-0004 | TRAC-0006 | 3336.66 | 60 | 459 |

The interplay between these tables forms a queryable governance graph. An operator investigating a high-retry trace begins with fact_trace, reads the spans_key to reach dim_spans, follows category_id to dim_spans_category for the classification, and then correlates the trace with evidence records through the evidence_correlated_with_key linkage. Simultaneously, the metric_kind_key in fact_gauge provides the categorical context for any gauge measurements taken during the same operational window. The result is a unified model where identifiers serve as join keys, categories provide semantic grouping, confidence and uncertainty quantify reliability, duration and retry counts capture operational effort, and size_bytes governs storage economics—all anchored to controlled vocabularies that prevent semantic drift across the telemetry pipeline.