---
chapter_id: ch_live_lineage_governed_by_directive_64ff40
topic_id: 46
family: 05_provo_lineage
cited_terms: ['lineage_governed_by_directive', 'directive_traces_to_requirement', 'aggregation_aggregates_measurement']
model: engine-refine
---

In governed data ecosystems, every artifact is anchored by a unique identifier that serves as its immutable reference point across systems. Directives such as DIRE-0001 through DIRE-0004 trace their lineage to concrete data sources—the Model Training Registry, Patient Cohort Dataset, and Sensor Telemetry Stream—each carrying metadata about the unit of measurement (milliseconds, meters per second, or raw counts) and the language of the governing documentation (Japanese, German, or English). This lineage metadata ensures that downstream consumers can verify not only where a dataset originated but also the contextual parameters under which it was produced, a prerequisite for auditability and regulatory compliance.

**t_lineage_governed_by_directive**

| id | lineage | unit | language |
| --- | --- | --- | --- |
| DIRE-0001 | Model Training Registry | ms | ja |
| DIRE-0002 | Patient Cohort Dataset | m/s | de |
| DIRE-0003 | Sensor Telemetry Stream | count | en |
| DIRE-0004 | Patient Cohort Dataset | m/s | en |
| DIRE-0005 | API Request Trace | ratio | es |
| DIRE-0006 | Laboratory Batch Records | nm | de |
| DIRE-0007 | Patient Cohort Dataset | kg | en |
| DIRE-0008 | Inventory Sync Job | nm | ja |

Directives map to specific requirements—ISO 27001:2022, PCI DSS v4.0, the EU AI Act Article 9, and internal Data Classification Policies—each of which carries a set of typed attributes. An attribute such as effective_date is declared with the type xsd:date, while enforcement uses xsd:string, mandatory is xsd:boolean, and priority is xsd:integer. The separation of attribute definitions from their values enables schema-level validation: the system knows that a boolean attribute must hold only true or false, that a date attribute must conform to an ISO 8601 format, and that an integer attribute must contain whole numbers. Values are stored in dedicated type-specific tables, so the boolean attribute mandatory evaluates to true for requirement REQU-0003 and false for the others, the effective_date attribute carries dates such as 2023-08-06 and 2025-05-18 across different requirements, and string attributes hold values like Encoding 01, Enforcement 02, nightly summary, and ja. Integer attributes capture quantitative metadata such as priority scores of 4, 132, and 453. This type-disaggregated design prevents type confusion and supports efficient indexing on the most commonly queried value types.

Aggregates represent computed or summarized measures derived from underlying data, and each aggregate is classified into a category that provides semantic grouping. An aggregate identified as MEAS-0001 carries the label Aggregates Label 01 and belongs to Aggregates Category 01, while MEAS-0002 and MEAS-0003 are grouped under Aggregates Category 02 and Aggregates Category 03 respectively. The category dimension allows dashboards and reports to roll up measures by thematic groupings rather than by individual identifier, enabling analysts to compare performance across related metrics without manually correlating disparate IDs.

**dim_aggregates_category**

| id | category_name |
| --- | --- |
| MEAS-0001 | Category Name 01 |
| MEAS-0002 | Category Name 02 |
| MEAS-0003 | Category Name 03 |
| MEAS-0004 | Category Name 04 |
| MEAS-0005 | Category Name 05 |
| MEAS-0006 | Category Name 06 |

**dim_aggregates**

| id | aggregates_label | aggregates_category | category_id |
| --- | --- | --- | --- |
| MEAS-0001 | Aggregates Label 01 | Aggregates Category 01 | MEAS-0002 |
| MEAS-0002 | Aggregates Label 02 | Aggregates Category 02 | MEAS-0003 |
| MEAS-0003 | Aggregates Label 03 | Aggregates Category 03 | MEAS-0003 |
| MEAS-0004 | Aggregates Label 04 | Aggregates Category 04 | MEAS-0005 |
| MEAS-0005 | Aggregates Label 05 | Aggregates Category 05 | MEAS-0001 |
| MEAS-0006 | Aggregates Label 06 | Aggregates Category 06 | MEAS-0001 |
| MEAS-0007 | Aggregates Label 07 | Aggregates Category 07 | MEAS-0003 |

Every aggregate measure carries two companion fields—confidence and uncertainty—that quantify the reliability of the reported value. A measure with a value of 835.01 might have a confidence of 0.857 and an uncertainty of 811.48, indicating a relatively strong signal with a wide absolute error band. By contrast, a measure reporting 996.14 may carry a confidence of only 0.024 and an uncertainty of 527.80, signaling that the value should be treated as highly provisional. Confidence is expressed as a normalized probability between zero and one, while uncertainty is an absolute magnitude in the measure's native unit. Together, these fields allow downstream consumers to apply threshold-based filtering, weight aggregated results in decision models, or flag low-confidence measures for manual review.

The interplay between identifiers, entities, attributes, and categories forms a navigable graph that supports traceability from high-level policy down to individual data points. A directive identifier like DIRE-0001 connects to a lineage source and a unit of measurement; that directive traces to a requirement such as REQU-0001, which carries typed attributes with concrete values; and those requirements, in turn, may govern the collection or aggregation of measures like MEAS-0001, each annotated with confidence and uncertainty. Language and unit metadata travel alongside the lineage, ensuring that any consumer—whether a compliance auditor reviewing the Patient Cohort Dataset in German or an engineering team monitoring Sensor Telemetry Stream in meters per second—has the contextual information needed to interpret the data correctly. This layered structure, where identifiers serve as the connective tissue and typed attributes provide the semantic detail, is what makes large-scale governance frameworks both machine-readable and human-auditable.

**t_directive_traces_to_requirement**

| id | directive |
| --- | --- |
| REQU-0001 | ISO 27001:2022 |
| REQU-0002 | PCI DSS v4.0 |
| REQU-0003 | EU AI Act Article 9 |
| REQU-0004 | Data Classification Policy |
| REQU-0005 | PCI DSS v4.0 |
| REQU-0006 | HIPAA Privacy Rule |

**t_directive_traces_to_requirement_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| REQU-0001 | effective_date | xsd:date |
| REQU-0002 | enforcement | xsd:string |
| REQU-0003 | mandatory | xsd:boolean |
| REQU-0004 | priority | xsd:integer |
| REQU-0005 | review_cycle_days | xsd:integer |
| REQU-0006 | scope | xsd:string |
| REQU-0007 | encoding | xsd:string |
| REQU-0008 | label_text | xsd:string |

**t_directive_traces_to_requirement_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| REQU-0001 | REQU-0001 | REQU-0003 | false |
| REQU-0002 | REQU-0002 | REQU-0003 | false |
| REQU-0003 | REQU-0003 | REQU-0003 | true |
| REQU-0004 | REQU-0004 | REQU-0003 | false |
| REQU-0005 | REQU-0005 | REQU-0003 | false |
| REQU-0006 | REQU-0006 | REQU-0003 | true |

**t_directive_traces_to_requirement_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| REQU-0001 | REQU-0001 | REQU-0001 | 2023-08-06 |
| REQU-0002 | REQU-0002 | REQU-0001 | 2023-10-19 |
| REQU-0003 | REQU-0003 | REQU-0001 | 2025-05-18 |
| REQU-0004 | REQU-0004 | REQU-0001 | 2023-12-14 |
| REQU-0005 | REQU-0005 | REQU-0001 | 2024-01-08 |
| REQU-0006 | REQU-0006 | REQU-0001 | 2024-04-02 |

**t_directive_traces_to_requirement_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| REQU-0001 | REQU-0001 | REQU-0004 | 4 |
| REQU-0002 | REQU-0001 | REQU-0005 | 132 |
| REQU-0003 | REQU-0002 | REQU-0004 | 4 |
| REQU-0004 | REQU-0002 | REQU-0005 | 453 |
| REQU-0005 | REQU-0003 | REQU-0004 | 4 |
| REQU-0006 | REQU-0003 | REQU-0005 | 497 |
| REQU-0007 | REQU-0004 | REQU-0004 | 4 |
| REQU-0008 | REQU-0004 | REQU-0005 | 899 |

**t_directive_traces_to_requirement_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| REQU-0001 | REQU-0001 | REQU-0007 | Encoding 01 |
| REQU-0002 | REQU-0001 | REQU-0002 | Enforcement 02 |
| REQU-0003 | REQU-0001 | REQU-0008 | nightly summary |
| REQU-0004 | REQU-0001 | REQU-0009 | ja |
| REQU-0005 | REQU-0001 | REQU-0006 | Scope 05 |
| REQU-0006 | REQU-0002 | REQU-0007 | Encoding 06 |
| REQU-0007 | REQU-0002 | REQU-0002 | Enforcement 07 |
| REQU-0008 | REQU-0002 | REQU-0008 | change rationale |

**fact_aggregation**

| id | aggregates_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| MEAS-0001 | MEAS-0003 | 0.857 | 811.48 | 835.01 |
| MEAS-0002 | MEAS-0004 | 0.688 | 850.83 | 952.80 |
| MEAS-0003 | MEAS-0006 | 0.639 | 844.56 | 52.67 |
| MEAS-0004 | MEAS-0003 | 0.024 | 527.80 | 996.14 |
| MEAS-0005 | MEAS-0004 | 0.062 | 315.40 | 941.21 |