---
chapter_id: ch_live_dengue_transmission_process_4cf9db
topic_id: 5
family: 08_derived
cited_terms: ['dengue_transmission_process', 'salary_requirement', 'evidence_correlated_with']
model: engine-refine
---

The architecture supports multi-dimensional analysis by linking fact tables to dimension tables through foreign keys, enabling categorical classification and contextual enrichment. Each fact record—whether tracking dengue events, salary metrics, or evidence correlations—carries an identifier and references its corresponding dimension, which provides both categorical labels and descriptive metadata. This structure allows analysts to filter, aggregate, and cross-reference data across multiple classification schemes while maintaining traceability to the underlying records.

In the dengue surveillance domain, the fact table records transmission events through identifiers such as PROC-0001 through PROC-0004, each quantified by an event count that ranges from 56 to 444 occurrences. Every event record is anchored to two dimension tables: one describing the involved host and another describing the involved vector. The host dimension assigns categorical classifications like Involves Host Category 01 alongside free-text labels such as Involves Host Label 01, while the vector dimension similarly provides Involves Vector Category 01 through 04 paired with corresponding labels. The foreign keys in the fact table—pointing to identifiers like PROC-0002 for the host and PROC-0004 for the vector—establish the biological relationships that define each transmission event, enabling queries that cross-tabulate host types against vector species and their associated event volumes.

**fact_dengue**

| id | involves_host_key | involves_vector_key | event_count |
| --- | --- | --- | --- |
| PROC-0001 | PROC-0002 | PROC-0004 | 251 |
| PROC-0002 | PROC-0001 | PROC-0002 | 444 |
| PROC-0003 | PROC-0005 | PROC-0007 | 56 |
| PROC-0004 | PROC-0002 | PROC-0003 | 167 |
| PROC-0005 | PROC-0002 | PROC-0008 | 168 |

**dim_involves_host**

| id | involves_host_label | involves_host_category |
| --- | --- | --- |
| PROC-0001 | Involves Host Label 01 | Involves Host Category 01 |
| PROC-0002 | Involves Host Label 02 | Involves Host Category 02 |
| PROC-0003 | Involves Host Label 03 | Involves Host Category 03 |
| PROC-0004 | Involves Host Label 04 | Involves Host Category 04 |
| PROC-0005 | Involves Host Label 05 | Involves Host Category 05 |
| PROC-0006 | Involves Host Label 06 | Involves Host Category 06 |

**dim_involves_vector**

| id | involves_vector_label | involves_vector_category |
| --- | --- | --- |
| PROC-0001 | Involves Vector Label 01 | Involves Vector Category 01 |
| PROC-0002 | Involves Vector Label 02 | Involves Vector Category 02 |
| PROC-0003 | Involves Vector Label 03 | Involves Vector Category 03 |
| PROC-0004 | Involves Vector Label 04 | Involves Vector Category 04 |
| PROC-0005 | Involves Vector Label 05 | Involves Vector Category 05 |
| PROC-0006 | Involves Vector Label 06 | Involves Vector Category 06 |
| PROC-0007 | Involves Vector Label 07 | Involves Vector Category 07 |
| PROC-0008 | Involves Vector Label 08 | Involves Vector Category 08 |

The salary fact table operates under an analogous pattern but introduces probabilistic measures alongside its quantitative core. Records identified as REQU-0001 through REQU-0004 each reference a salary dimension through a salary key, where the dimension supplies both a salary category—Salary Category 01 through 04—and a descriptive label such as Salary Label 01. The fact table itself carries a value field, with observations ranging from 3.89 to 876.17, but more critically it records a confidence score and an uncertainty metric for each entry. Confidence values span from 0.077 to 0.982, reflecting varying degrees of analytical certainty, while uncertainty figures—measured on a scale from 60.14 to 883.10—quantify the dispersion or risk associated with each salary observation. These paired measures enable downstream governance processes to flag low-confidence entries, such as the record with confidence 0.077 and uncertainty 60.14, for manual review or imputation.

Evidence correlation follows the same dimensional design, with fact records identified as WITH-0001 through WITH-0004 each referencing a correlated evidence dimension through an evidence_correlated_with_key. The dimension table supplies an evidence_correlated_with_category—Evidence Correlated With Category 01 through 04—and a corresponding label such as Evidence Correlated With Label 01. The fact table records a value field alongside confidence and uncertainty measures, where confidence ranges from 0.052 to 0.474 and uncertainty spans from 125.66 to 477.82. The notably low confidence of 0.052 in record WITH-0001, paired with an uncertainty of 125.66 and a value of 192.81, illustrates how the schema captures weak associations that may require additional corroboration before being acted upon.

Across all three fact tables, the consistent use of identifiers, foreign keys, categorical dimensions, and probabilistic measures creates a unified analytical framework. The identifier column—whether formatted as PROC-0001, REQU-0001, or WITH-0001—serves as the primary key for each fact record and the bridge to its dimensional attributes. The category columns in each dimension table provide the classification layer that supports aggregation and reporting, while the misc columns—labels and values—supply human-readable context. Confidence and uncertainty columns, present in both the salary and evidence fact tables, introduce a risk-aware dimension that distinguishes high-certainty observations from those requiring further investigation. Event count, unique to the dengue fact table, provides a direct volumetric measure that can be correlated with host and vector categories to identify transmission hotspots. This design ensures that every analytical query can be traced from aggregate category totals back to individual fact records, with confidence and uncertainty metrics providing the necessary context for interpreting the strength of each observation.

**fact_salary**

| id | salary_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| REQU-0001 | REQU-0004 | 0.077 | 60.14 | 3.89 |
| REQU-0002 | REQU-0007 | 0.644 | 75.00 | 226.77 |
| REQU-0003 | REQU-0004 | 0.791 | 883.10 | 851.90 |
| REQU-0004 | REQU-0005 | 0.982 | 701.98 | 876.17 |

**dim_salary**

| id | salary_label | salary_category |
| --- | --- | --- |
| REQU-0001 | Salary Label 01 | Salary Category 01 |
| REQU-0002 | Salary Label 02 | Salary Category 02 |
| REQU-0003 | Salary Label 03 | Salary Category 03 |
| REQU-0004 | Salary Label 04 | Salary Category 04 |
| REQU-0005 | Salary Label 05 | Salary Category 05 |
| REQU-0006 | Salary Label 06 | Salary Category 06 |
| REQU-0007 | Salary Label 07 | Salary Category 07 |

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