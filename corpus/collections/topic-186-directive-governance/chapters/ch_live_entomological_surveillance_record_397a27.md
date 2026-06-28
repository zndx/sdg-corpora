---
chapter_id: ch_live_entomological_surveillance_record_397a27
topic_id: 186
family: 08_derived
cited_terms: ['entomological_surveillance_record', 'histogram_metric_subclass', 'constraint_check_subclass']
model: engine-refine
---

In operational data governance, every measurable entity requires a stable, machine-readable identifier that survives schema evolution and cross-system reconciliation. The tracking framework assigns identifiers such as RECO-0001 through RECO-0004 to entomological observation records and METR-0001 through METR-0004 to metric histogram entries, while constraint checks receive identifiers like CHEC-0001 through CHEC-0004. These identifiers serve as the primary keys that anchor fact tables to their corresponding dimension tables, enabling consistent joins across the warehouse regardless of how labels or categories shift over time. An identifier is never ambiguous: it is the single point of reference that links an event count of 485 in one record to its realized objective and its associated control framework.

**t_constraint_check_subclass**

| id | constraint | checks | mandatory | priority |
| --- | --- | --- | --- | --- |
| CHEC-0001 | Null field rejection | Great Expectations validator | true | 1 |
| CHEC-0002 | Null field rejection | Schema registry linter | true | 5 |
| CHEC-0003 | Anomaly detection threshold | Great Expectations validator | true | 4 |
| CHEC-0004 | Header presence check | Audit log parser | false | 1 |
| CHEC-0005 | Batch size limit | Prometheus alertmanager | false | 4 |

The fact tables capture quantitative measurements that are meaningful only when contextualized through foreign-key relationships to dimension tables. The entomological fact table records event counts—311, 166, 49, and 485 occurrences—each tied to a realizes dimension and an associated_with dimension via their respective foreign keys. A single realizes entry, such as RECO-0004, may be referenced by multiple fact rows, reflecting that one realized objective can be evidenced by several distinct observation records. Similarly, the histogram fact table stores size_bytes values ranging from approximately 194 million to 824 million bytes, each linked to a metric_kind foreign key that classifies the measurement type. This star-schema design ensures that raw quantities remain decoupled from their semantic labels, allowing the dimension tables to evolve independently without altering the fact data.

**fact_entomological**

| id | realizes_key | associated_with_key | event_count |
| --- | --- | --- | --- |
| RECO-0001 | RECO-0002 | RECO-0001 | 311 |
| RECO-0002 | RECO-0005 | RECO-0005 | 166 |
| RECO-0003 | RECO-0004 | RECO-0003 | 49 |
| RECO-0004 | RECO-0004 | RECO-0001 | 485 |
| RECO-0005 | RECO-0006 | RECO-0001 | 380 |
| RECO-0006 | RECO-0003 | RECO-0005 | 490 |
| RECO-0007 | RECO-0004 | RECO-0007 | 321 |
| RECO-0008 | RECO-0002 | RECO-0003 | 179 |

**fact_histogram**

| id | metric_kind_key | size_bytes | version |
| --- | --- | --- | --- |
| METR-0001 | METR-0005 | 239999637 | 3 |
| METR-0002 | METR-0005 | 652318299 | 9 |
| METR-0003 | METR-0005 | 823666310 | 5 |
| METR-0004 | METR-0003 | 194252236 | 3 |
| METR-0005 | METR-0002 | 858858459 | 12 |
| METR-0006 | METR-0006 | 40060793 | 9 |
| METR-0007 | METR-0007 | 831460623 | 10 |
| METR-0008 | METR-0001 | 408712850 | 1 |

Dimension tables provide the categorical and descriptive context that transforms raw identifiers into actionable metadata. The realizes dimension assigns labels such as "Realizes Label 01" and categories like "Realizes Category 01" to each realized objective, while the associated_with dimension provides parallel labels and categories for the entities or processes linked to each observation. The metric_kind dimension follows the same pattern, classifying histogram entries by their measurement type. The misc column in each dimension table holds human-readable labels that support reporting and auditing, while the category column enables aggregation and filtering at a semantic level. Together, these dimensions allow analysts to slice event counts and byte sizes by objective, by association, and by measurement type without hardcoding any of these groupings into the fact tables themselves.

**dim_realizes**

| id | realizes_label | realizes_category |
| --- | --- | --- |
| RECO-0001 | Realizes Label 01 | Realizes Category 01 |
| RECO-0002 | Realizes Label 02 | Realizes Category 02 |
| RECO-0003 | Realizes Label 03 | Realizes Category 03 |
| RECO-0004 | Realizes Label 04 | Realizes Category 04 |
| RECO-0005 | Realizes Label 05 | Realizes Category 05 |
| RECO-0006 | Realizes Label 06 | Realizes Category 06 |

**dim_associated_with**

| id | associated_with_label | associated_with_category |
| --- | --- | --- |
| RECO-0001 | Associated With Label 01 | Associated With Category 01 |
| RECO-0002 | Associated With Label 02 | Associated With Category 02 |
| RECO-0003 | Associated With Label 03 | Associated With Category 03 |
| RECO-0004 | Associated With Label 04 | Associated With Category 04 |
| RECO-0005 | Associated With Label 05 | Associated With Category 05 |
| RECO-0006 | Associated With Label 06 | Associated With Category 06 |
| RECO-0007 | Associated With Label 07 | Associated With Category 07 |
| RECO-0008 | Associated With Label 08 | Associated With Category 08 |

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

Data quality and compliance are enforced through a constraint-check subsystem that catalogs validation rules, their implementation tools, and their operational urgency. Each constraint check—whether it is a "Null field rejection" rule, an "Anomaly detection threshold," or a "Header presence check"—is assigned a mandatory flag and a priority level from 1 to 5. Mandatory checks, such as the null field rejection rules implemented via Great Expectations validators and schema registry linters, carry priority 1 or 4, indicating that they must pass before data is accepted into the warehouse. Non-mandatory checks, like the header presence check implemented through an audit log parser, carry lower priority and may be applied selectively. This separation of mandatory and optional controls, combined with explicit priority ordering, ensures that the most critical validations are evaluated first and that compliance gaps are surfaced in a deterministic, auditable sequence.

Versioning and size tracking provide the operational telemetry needed to manage data lifecycle and storage costs. Histogram entries carry version numbers—3, 5, and 9 in the observed data—that track how measurement definitions have evolved, enabling rollback and reproducibility when downstream reports depend on a specific version of a metric. The size_bytes column, with values in the hundreds of millions, allows capacity planners to forecast storage requirements and identify outliers that may warrant compression or archival. When combined with the categorical metadata from the metric_kind dimension, these size and version attributes give data engineers the information needed to optimize storage, enforce retention policies, and maintain an audit trail of how each metric has changed over time.