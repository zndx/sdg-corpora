---
chapter_id: ch_live_anomaly_in_metric_27a52c
topic_id: 186
family: 07_long_tail
cited_terms: ['anomaly_in_metric', 'transformation_subclass', 'subclass_to_artifact']
model: engine-refine
---

In governed operational and compliance systems, every observable fact must be anchored to a durable **identifier** that survives renames, reprocessing, and cross-system exchange. Identifiers such as `METR-0001`, `TRAN-0003`, and `ARTI-0002` are not display labels; they are stable keys that let auditors, pipelines, and human reviewers refer to the same object unambiguously across time and storage boundaries. When a cache eviction storm is correlated with network bandwidth saturation under `METR-0001`, or when log pattern extraction is tracked as `TRAN-0003`, the identifier becomes the join point that binds narrative description, measured attributes, transformation history, and downstream artifacts into one auditable chain of custody.

An **entity** is the thing those identifiers name: a detected anomaly-in-metric association, a transformation subclass, or a deliverable artifact. Entities carry identity; they do not, by themselves, carry every fact worth recording. A single entity may accumulate many observations over its lifecycle—confidence scores, dimension classifications, calibration notes, timestamps—each of which must remain attributable to the correct subject. In practice, attribute values are stored with an explicit `entity_id` reference back to the governing record, so a decimal confidence of `0.515` and a varchar label such as `Dimension Kind 01` can both be tied to `METR-0001` without collapsing heterogeneous data into one wide, brittle row. That separation matters for compliance: it preserves provenance, enables partial updates, and keeps review scopes narrow when only one facet of an entity changes.

**t_anomaly_in_metric**

| id | anomaly | anomaly_in_metric |
| --- | --- | --- |
| METR-0001 | Cache Eviction Storm | Network Bandwidth Saturation |
| METR-0002 | Memory Leak Spike | Throughput Drop |
| METR-0003 | Memory Leak Spike | Disk Write Bytes |
| METR-0004 | DNS Resolution Timeout | Request Latency P99 |
| METR-0005 | Kernel Panic | Error Rate Delta |
| METR-0006 | Memory Leak Spike | Network Bandwidth Saturation |

**t_anomaly_in_metric_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| METR-0001 | confidence | xsd:decimal |
| METR-0002 | dimension_kind | xsd:string |
| METR-0003 | method | xsd:string |
| METR-0004 | recorded_at | xsd:dateTime |
| METR-0005 | uncertainty | xsd:decimal |
| METR-0006 | unit | xsd:string |
| METR-0007 | value | xsd:decimal |
| METR-0008 | encoding | xsd:string |

**t_anomaly_in_metric_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| METR-0001 | METR-0001 | METR-0004 | 2025-04-23T06:08:33 |
| METR-0002 | METR-0002 | METR-0004 | 2025-05-24T14:06:40 |
| METR-0003 | METR-0003 | METR-0004 | 2024-05-21T09:32:53 |
| METR-0004 | METR-0004 | METR-0004 | 2024-12-09T22:35:58 |
| METR-0005 | METR-0005 | METR-0004 | 2024-11-21T20:37:39 |
| METR-0006 | METR-0006 | METR-0004 | 2024-09-07T09:05:43 |

**t_anomaly_in_metric_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| METR-0001 | METR-0001 | METR-0001 | 0.515 |
| METR-0002 | METR-0001 | METR-0005 | 505.78 |
| METR-0003 | METR-0001 | METR-0007 | 646.06 |
| METR-0004 | METR-0002 | METR-0001 | 0.337 |
| METR-0005 | METR-0002 | METR-0005 | 475.15 |
| METR-0006 | METR-0002 | METR-0007 | 359.78 |
| METR-0007 | METR-0003 | METR-0001 | 0.527 |
| METR-0008 | METR-0003 | METR-0005 | 251.95 |

**t_anomaly_in_metric_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| METR-0001 | METR-0001 | METR-0002 | Dimension Kind 01 |
| METR-0002 | METR-0001 | METR-0008 | Encoding 02 |
| METR-0003 | METR-0001 | METR-0009 | calibration record |
| METR-0004 | METR-0001 | METR-0010 | de |
| METR-0005 | METR-0001 | METR-0003 | hybrid |
| METR-0006 | METR-0001 | METR-0006 | m/s |
| METR-0007 | METR-0002 | METR-0002 | Dimension Kind 07 |
| METR-0008 | METR-0002 | METR-0008 | Encoding 08 |

**Attr** names the semantic slot an observation occupies—`confidence`, `dimension_kind`, `method`, `recorded_at`—while **attr type** declares the contract under which values are interpreted and validated. Typing is not cosmetic metadata; it governs which storage path applies, which comparators are legal, and which downstream transforms may consume the field without silent coercion. A confidence score registered as `xsd:decimal` belongs in decimal-valued tables and can be range-checked; a `recorded_at` field typed as `xsd:dateTime` must round-trip as an ISO-8601 instant such as `2025-04-23T06:08:33`, not as an unparsed string that different locales might read differently. String-typed attributes like `method` or `dimension_kind` tolerate lexical variation—`Encoding 02`, `calibration record`—but still require consistent naming in the attr registry so reports and policy rules do not fork on synonyms.

The **misc** dimension, in this pattern, is the carried payload: the concrete value stored once entity and attribute context are resolved. Misc is deliberately type-partitioned—decimals, varchars, datetimes—so integrity constraints stay close to the data. The same attr id may appear across many entities (`METR-0004` for `recorded_at` on four distinct metric records), and one entity may fan out across multiple attrs and attr ids (`METR-0001` holding decimal, varchar, and datetime observations under different attribute keys). That many-to-many shape is how operational systems scale attribute richness without denormalizing every possible column into every core table. Reviewers can then ask precise questions—what was the confidence at detection time, what encoding was applied, when was the row recorded—without inferring meaning from column order or undocumented nulls.

Governance extends beyond measured facts to **phase** and **status**, which encode where a controlled process stands in its lifecycle and whether it has satisfied exit criteria. A transformation subclass such as signal bandpass filtering may sit in **review** while still **failed**, signaling that design or evidence requirements were not met before execution authority is granted. By contrast, provenance hash computation and telemetry aggregation rollup in **execution** with **complete** status indicate that runtime work finished and can be cited in audit packets. **Pending** on log pattern extraction shows an in-flight obligation: the entity exists in the catalog, but consumers must not treat its outputs as authoritative until status advances. Phase and status together prevent “completed” language from being applied to artifacts that never left human gatekeeping, and they give compliance officers a machine-readable backlog of blocked or deficient work.

**t_transformation_subclass**

| id | transformation | uses_entity | phase | status |
| --- | --- | --- | --- | --- |
| TRAN-0001 | Signal Bandpass Filtering | REST API Response Bodies | review | failed |
| TRAN-0002 | Provenance Hash Computation | Reagent Batch Alpha | execution | complete |
| TRAN-0003 | Log Pattern Extraction | PCAP Archive Files | execution | pending |
| TRAN-0004 | Telemetry Aggregation Rollup | PostgreSQL Schema Definitions | execution | complete |

Finally, where entities materialize as files, manifests, or other publishable **artifacts**, **checksum** and **license** close the loop on integrity and lawful use. Checksums such as `c0ffee42` for `checksum-manifest-v4` and `5e8f3c91` for both `batch-processor-logs` and `sensor-calibration-v2` provide deterministic equality checks: recipients can verify they received unaltered content, and registries can detect accidental duplication or improper republication of the same bits under different names. **License** terms—`BSD-3-Clause`, `MIT`, `CC-BY-4.0`—attach explicit redistribution, attribution, and modification obligations to each artifact, which matters when genomic sequence data, calibration packages, or log extracts cross organizational boundaries. Taken together, identifier, entity, attr, attr type, misc, phase, status, checksum, and license form a coherent compliance vocabulary: identity names the subject, attributes typed values describe it, lifecycle fields control when it may be trusted, and checksum plus license govern how its tangible outputs may be verified and shared.

**t_subclass_to_artifact**

| id | artifact | checksum | license |
| --- | --- | --- | --- |
| ARTI-0001 | checksum-manifest-v4 | c0ffee42 | BSD-3-Clause |
| ARTI-0002 | batch-processor-logs | 5e8f3c91 | CC-BY-4.0 |
| ARTI-0003 | genomic-sequence-17 | 1a4b6c2d | MIT |
| ARTI-0004 | sensor-calibration-v2 | 5e8f3c91 | CC-BY-4.0 |
| ARTI-0005 | model-weights-resnet50 | 5e8f3c91 | proprietary |
| ARTI-0006 | pipeline-output-stage3 | 9d2b7a16 | Apache-2.0 |
| ARTI-0007 | lab-reagent-batch-A7 | 7b14de08 | Apache-2.0 |
| ARTI-0008 | batch-processor-logs | 1a4b6c2d | BSD-3-Clause |