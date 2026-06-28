---
chapter_id: ch_live_measurement_max_one_value_77d64e
topic_id: 44
family: 02_observation_measurement
cited_terms: ['measurement_max_one_value', 'gauge_metric_subclass', 'ebpfprogram_writes_to_map_xref']
model: engine-refine
---

The architecture of the measurement registry is predicated upon a tripartite decomposition that separates the semantic identity of an observation from its quantification and the governance role assigned to its linkage. A measurement such as Soil pH or CPU load is first instantiated under a unique identifier—VALU-0001 through VALU-0004—each representing a distinct observational datum. The numerical instantiation of that measurement is stored in a parallel registry, where the same identifier space yields values ranging from 0.042 for CPU load to 120.5 for Water turbidity, with 98.6 appearing as the numeric value for both Soil pH and Air particulate, a convergence that reflects the underlying data rather than any normalization convention. The association between measurement and numeric value is not implicit; it is mediated by a junction table that explicitly records the subject of the measurement, the target numeric value, and the role of the party effecting that association. Roles observed in this linkage layer include reviewer, observer, and contributor, with observer appearing in two of four recorded associations, suggesting a preponderance of passive validation over active contribution in the current dataset.

**t_measurement_max_one_value**

| id | measurement |
| --- | --- |
| VALU-0001 | Soil pH |
| VALU-0002 | Water turbidity |
| VALU-0003 | Air particulate |
| VALU-0004 | CPU load |
| VALU-0005 | Battery voltage |
| VALU-0006 | Air particulate |
| VALU-0007 | Core temperature |

**t_measurement_max_one_value_numeric_value**

| id | numeric_value |
| --- | --- |
| VALU-0001 | 98.6 |
| VALU-0002 | 120.5 |
| VALU-0003 | 98.6 |
| VALU-0004 | 0.042 |
| VALU-0005 | 0.042 |
| VALU-0006 | 0.85 |

**t_measurement_max_one_value__numeric_value**

| id | measurement_id | numeric_value_id | role |
| --- | --- | --- | --- |
| VALU-0001 | VALU-0005 | VALU-0001 | reviewer |
| VALU-0002 | VALU-0002 | VALU-0003 | observer |
| VALU-0003 | VALU-0005 | VALU-0005 | contributor |
| VALU-0004 | VALU-0003 | VALU-0001 | observer |
| VALU-0005 | VALU-0007 | VALU-0005 | owner |
| VALU-0006 | VALU-0004 | VALU-0005 | observer |
| VALU-0007 | VALU-0003 | VALU-0006 | contributor |
| VALU-0008 | VALU-0002 | VALU-0006 | owner |

The metric domain is organized along a fact-dimension axis that mirrors the measurement structure but operates at a higher level of abstraction. Each entry in the fact table for gauges carries an identifier—METR-0001 through METR-0004—and references a metric kind through a foreign key, while simultaneously recording the size in bytes of the underlying data artifact and the version of the metric definition. Size values span several orders of magnitude: METR-0001 records 944,581,501 bytes, METR-0002 holds 721,525,656 bytes, while METR-0003 and METR-0004 contain 182,468,524 and 15,628,556 bytes respectively. Versions are discrete integers, with three entries at version 10 or 11 and one at version 4, indicating that the metric definitions have undergone revision cycles of varying intensity. The dimension table for metric kinds resolves each foreign key into a human-readable label and a categorical classification. Labels such as Metric Kind Label 01 through Metric Kind Label 04 are paired with categories Metric Kind Category 01 through Metric Kind Category 04, establishing a one-to-one correspondence in the current sample that partitions the metric universe into distinct taxonomic buckets.

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

The eBPF program registry follows an identical fact-dimension pattern, confirming that the architectural approach is domain-agnostic rather than specific to any single class of instrumented entity. The fact table for eBPF programs uses identifiers XREF-0001 through XREF-0004 and references an eBPF program through a foreign key, with size_bytes values of 784,335,640, 641,704,069, 113,209,263, and 161,013,093. Notably, the eBPF program key XREF-0003 appears twice, indicating that two distinct fact records—XREF-0002 and XREF-0003—reference the same underlying program, a pattern that suggests either versioned snapshots or parallel deployments of the same binary. Versions in this table range from 9 to 12, with XREF-0001 and XREF-0004 both at version 12, while XREF-0002 sits at version 9 and XREF-0003 at version 11, revealing that the eBPF program registry is actively maintained with divergent revision histories across entries. The dimension table resolves program keys into labels and categories, with Ebpfprogram Label 01 through 04 and Ebpfprogram Category 01 through 04 providing the human-interpretable layer.

**fact_ebpfprogram**

| id | ebpfprogram_key | size_bytes | version |
| --- | --- | --- | --- |
| XREF-0001 | XREF-0001 | 784335640 | 12 |
| XREF-0002 | XREF-0003 | 641704069 | 9 |
| XREF-0003 | XREF-0003 | 113209263 | 11 |
| XREF-0004 | XREF-0005 | 161013093 | 12 |
| XREF-0005 | XREF-0004 | 352203820 | 12 |
| XREF-0006 | XREF-0003 | 167519051 | 1 |

The role column in the measurement-to-numeric-value junction table introduces a governance dimension that is absent from the metric and eBPF registries, where fact entries are self-contained and do not encode provenance or authorization metadata. This asymmetry is deliberate: the measurement domain deals with observational data whose integrity depends on knowing who linked which value to which measurement, whereas the metric and eBPF domains deal with programmatic artifacts whose version and size are sufficient for traceability. The identifiers in the measurement junction table—VALU-0001 through VALU-0004—serve as the primary keys for the linkage records themselves, while the subject and target columns carry foreign keys to the measurement and numeric value registries respectively. In the current data, the subject VALU-0005 appears in two of four rows despite not being present in the measurement registry's own identifier space, a discrepancy that either reflects a data quality issue or indicates that the measurement registry is a subset of a larger population.

The consistent use of identifier columns across all tables—whether prefixed VALU- for measurements, METR- for metrics, or XREF- for eBPF programs—establishes a naming convention that encodes domain membership at the lexical level. This convention, combined with the foreign-key relationships that connect fact tables to their respective dimension tables, creates a navigable graph of entities where each node carries both a machine-readable key and a human-readable label. The size_bytes column, present in both fact_gauge and fact_ebpfprogram, serves as a quantitative anchor for capacity planning and storage governance, while the version column provides a temporal axis for auditing changes. The misc and category columns in the dimension tables provide orthogonal classification axes that enable filtering and aggregation beyond the primary key, supporting analytical queries that cut across the fact-dimension boundary.

**dim_ebpfprogram**

| id | ebpfprogram_label | ebpfprogram_category |
| --- | --- | --- |
| XREF-0001 | Ebpfprogram Label 01 | Ebpfprogram Category 01 |
| XREF-0002 | Ebpfprogram Label 02 | Ebpfprogram Category 02 |
| XREF-0003 | Ebpfprogram Label 03 | Ebpfprogram Category 03 |
| XREF-0004 | Ebpfprogram Label 04 | Ebpfprogram Category 04 |
| XREF-0005 | Ebpfprogram Label 05 | Ebpfprogram Category 05 |
| XREF-0006 | Ebpfprogram Label 06 | Ebpfprogram Category 06 |
| XREF-0007 | Ebpfprogram Label 07 | Ebpfprogram Category 07 |
| XREF-0008 | Ebpfprogram Label 08 | Ebpfprogram Category 08 |