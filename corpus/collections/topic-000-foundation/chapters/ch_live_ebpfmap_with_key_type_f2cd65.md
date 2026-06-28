---
chapter_id: ch_live_ebpfmap_with_key_type_f2cd65
topic_id: 0
family: 04_ebpf_kernel
cited_terms: ['ebpfmap_with_key_type', 'aggregation_aggregates_measurement', 'profiling_only_targets_datasets']
model: engine-refine
---

In governed telemetry and kernel-observability corpora, every durable object is stabilized by an identifier—a surrogate key that survives relabeling, schema drift, and cross-table joins without conflating homonyms. Identifiers such as TYPE-0001 through TYPE-0004 for key-type dimensions, MEAS-0001 through MEAS-0004 for aggregate measures, and DATA-0001 through DATA-0004 for profiling targets function as the canonical handles through which facts reference dimensions and through which lineage can be reconstructed when human-readable labels diverge. The identifier is therefore not merely a storage convenience but the anchor of auditability: it permits a fact row keyed to TYPE-0002 to be joined unambiguously to its dimension even when the associated key_type_label reads "Key Type Label 02" and its key_type_category reads "Key Type Category 02," preserving referential integrity across operational and analytical stores.

**dim_key_type**

| id | key_type_label | key_type_category |
| --- | --- | --- |
| TYPE-0001 | Key Type Label 01 | Key Type Category 01 |
| TYPE-0002 | Key Type Label 02 | Key Type Category 02 |
| TYPE-0003 | Key Type Label 03 | Key Type Category 03 |
| TYPE-0004 | Key Type Label 04 | Key Type Category 04 |
| TYPE-0005 | Key Type Label 05 | Key Type Category 05 |
| TYPE-0006 | Key Type Label 06 | Key Type Category 06 |

**t_profiling_only_targets_datasets**

| id | profiling |
| --- | --- |
| DATA-0001 | null rate analysis |
| DATA-0002 | cardinality profiling |
| DATA-0003 | data lineage sweep |
| DATA-0004 | hash integrity check |
| DATA-0005 | null rate analysis |
| DATA-0006 | field distribution scan |

**t_profiling_only_targets_datasets_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| DATA-0001 | duration_seconds | xsd:decimal |
| DATA-0002 | end_time | xsd:dateTime |
| DATA-0003 | exit_code | xsd:integer |
| DATA-0004 | host_name | xsd:string |
| DATA-0005 | log_level | xsd:string |
| DATA-0006 | phase | xsd:string |
| DATA-0007 | retry_count | xsd:integer |
| DATA-0008 | scheduled_at | xsd:dateTime |

Type operates at two complementary strata. At the structural stratum, type denotes the classification of a governed artifact—here, the key_type_key that binds an eBPF map fact to its dimensional semantics, so that a map instance identified as TYPE-0001 carries key_type_key TYPE-0005 while TYPE-0004 resolves to TYPE-0002, encoding inheritance or reuse of type definitions across distinct map instances. At the attribute stratum, attr_type fixes the interpretive contract for observed values: duration_seconds is typed xsd:decimal, end_time as xsd:dateTime, exit_code as xsd:integer, and host_name as xsd:string, which in turn routes each observation into the appropriate value store and governs validation, comparison, and unit semantics. Type thus mediates both taxonomy—what something is—and representation—how its properties may legally be recorded.

Entity and attr jointly instantiate the entity–attribute–value pattern that underlies profiling and compliance attestation. An entity, identified by entity_id, denotes the unit of observation: DATA-0001 may accumulate multiple attribute bindings, as when the same entity_id appears with attr_id DATA-0002 (end_time, yielding 2024-10-18T20:19:23), DATA-0003 (exit_code, 255), DATA-0004 (host_name, gw-12), and DATA-0001 (duration_seconds, 30.48), while DATA-0002 contributes end_time 2024-11-09T19:11:07 and duration_seconds 6189.13. The attr dimension names the property (duration_seconds, end_time, exit_code, host_name), and attr_id resolves the join between entity and typed value. This decomposition matters because governance rules attach to attributes—null-rate thresholds on exit_code, cardinality bounds on host_name—not to opaque row blobs; profiling operations such as null rate analysis, cardinality profiling, data lineage sweep, and hash integrity check are therefore declared against dataset targets and executed attribute by attribute.

**t_profiling_only_targets_datasets_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DATA-0001 | DATA-0001 | DATA-0002 | 2024-10-18T20:19:23 |
| DATA-0002 | DATA-0001 | DATA-0008 | 2025-02-03T06:32:48 |
| DATA-0003 | DATA-0001 | DATA-0009 | 2023-04-17T19:14:01 |
| DATA-0004 | DATA-0002 | DATA-0002 | 2024-11-09T19:11:07 |
| DATA-0005 | DATA-0002 | DATA-0008 | 2025-06-11T19:41:26 |
| DATA-0006 | DATA-0002 | DATA-0009 | 2023-12-25T21:51:31 |
| DATA-0007 | DATA-0003 | DATA-0002 | 2024-07-30T10:10:32 |
| DATA-0008 | DATA-0003 | DATA-0008 | 2025-03-13T05:29:50 |

**t_profiling_only_targets_datasets_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DATA-0001 | DATA-0001 | DATA-0001 | 30.48 |
| DATA-0002 | DATA-0002 | DATA-0001 | 6189.13 |
| DATA-0003 | DATA-0003 | DATA-0001 | 4326.04 |
| DATA-0004 | DATA-0004 | DATA-0001 | 4636.52 |
| DATA-0005 | DATA-0005 | DATA-0001 | 5515.53 |
| DATA-0006 | DATA-0006 | DATA-0001 | 6410.37 |

**t_profiling_only_targets_datasets_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DATA-0001 | DATA-0001 | DATA-0003 | 255 |
| DATA-0002 | DATA-0001 | DATA-0007 | 337 |
| DATA-0003 | DATA-0002 | DATA-0003 | 67 |
| DATA-0004 | DATA-0002 | DATA-0007 | 59 |
| DATA-0005 | DATA-0003 | DATA-0003 | 29 |
| DATA-0006 | DATA-0003 | DATA-0007 | 312 |
| DATA-0007 | DATA-0004 | DATA-0003 | 538 |
| DATA-0008 | DATA-0004 | DATA-0007 | 235 |

**t_profiling_only_targets_datasets_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DATA-0001 | DATA-0001 | DATA-0004 | gw-12 |
| DATA-0002 | DATA-0001 | DATA-0005 | Log Level 02 |
| DATA-0003 | DATA-0001 | DATA-0006 | closeout |
| DATA-0004 | DATA-0001 | DATA-0010 | failed |
| DATA-0005 | DATA-0001 | DATA-0011 | Triggered By 05 |
| DATA-0006 | DATA-0002 | DATA-0004 | node-b14 |
| DATA-0007 | DATA-0002 | DATA-0005 | Log Level 07 |
| DATA-0008 | DATA-0002 | DATA-0006 | closeout |

Category supplies the hierarchical and reporting vocabulary within which aggregates and dimensions are grouped for policy application and executive summary. Key types inherit key_type_category labels; aggregates carry aggregates_category alongside a category_id foreign key that may point beyond the local dimension row—as when MEAS-0004 references category_id MEAS-0005 while its aggregates_category reads "Aggregates Category 04," and dim_aggregates_category supplies parallel category_name strings ("Category Name 01" through "Category Name 04"). Category alignment is seldom one-to-one with identifier equality: MEAS-0003 and MEAS-0004 both map category_id to MEAS-0003, signaling shared rollup lineage despite distinct aggregate labels. In practice, category is the bridge between fine-grained measurement identity and coarser control frameworks—retention classes, escalation tiers, or compliance domains—so that an aggregate need not be re-keyed when its reporting bucket changes.

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

Aggregates condense distributed observations into governed summary measures, each keyed by aggregates_key and annotated with a reported value, a confidence, and an uncertainty that jointly qualify fitness for downstream decisioning. The fact_aggregation rows illustrate the full epistemic range: MEAS-0001 reports value 835.01 at confidence 0.857 with uncertainty 811.48; MEAS-0002 reports 952.80 at 0.688 and 850.83; MEAS-0003 reports 52.67 at 0.639 and 844.56; MEAS-0004 reports 996.14 at confidence 0.024 with uncertainty 527.80. High confidence does not imply low uncertainty, nor does a large point estimate guarantee reliability—MEAS-0004’s confidence of 0.024 marks the measure as unsuitable for automated enforcement despite a value approaching the upper range of its peers. Aggregates_key further encodes derivation topology: MEAS-0001 and MEAS-0004 both reference MEAS-0003, indicating shared upstream provenance or recomputation from a common base aggregate, a relationship invisible if one inspects only the scalar value field.

**fact_aggregation**

| id | aggregates_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| MEAS-0001 | MEAS-0003 | 0.857 | 811.48 | 835.01 |
| MEAS-0002 | MEAS-0004 | 0.688 | 850.83 | 952.80 |
| MEAS-0003 | MEAS-0006 | 0.639 | 844.56 | 52.67 |
| MEAS-0004 | MEAS-0003 | 0.024 | 527.80 | 996.14 |
| MEAS-0005 | MEAS-0004 | 0.062 | 315.40 | 941.21 |

Version and size_bytes ground the abstract type system in operational reality for kernel-adjacent artifacts whose footprint and revision history bear directly on capacity planning and change control. eBPF map facts record size_bytes spanning 31105012 for TYPE-0003 through 354373995 for TYPE-0004, with intermediate allocations of 208979093 and 156714508, and carry version numbers 3, 6, 12, and 5 respectively—non-monotonic across identifiers, as expected when versions track per-instance deployment state rather than a global sequence. Version governs compatibility of map layout and probe attachment; size_bytes quantifies memory pressure and serialization cost. Together with type classification, they complete the governance picture: an identifier names the object, type and category place it in policy space, entity and attr decompose its observable properties, aggregates and their confidence/uncertainty summarize evidentiary strength, and version with size_bytes certify that the measured system state is both current and proportionate to the infrastructure budget allocated for its retention and analysis.

**fact_ebpfmap**

| id | key_type_key | size_bytes | version |
| --- | --- | --- | --- |
| TYPE-0001 | TYPE-0005 | 208979093 | 3 |
| TYPE-0002 | TYPE-0006 | 156714508 | 6 |
| TYPE-0003 | TYPE-0006 | 31105012 | 12 |
| TYPE-0004 | TYPE-0002 | 354373995 | 5 |
| TYPE-0005 | TYPE-0004 | 866267293 | 2 |