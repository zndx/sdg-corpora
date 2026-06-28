---
chapter_id: ch_live_observation_precedes_other_2f6d96
topic_id: 26
family: 02_observation_measurement
cited_terms: ['observation_precedes_other', 'profiling_with_method', 'profile_has_cardinality']
model: engine-refine
---

In operational compliance and infrastructure governance, every auditable assertion must be anchored by a stable identifier that survives reprocessing, cross-system joins, and longitudinal review. Identifiers such as OTHE-0001 or METH-0003 are not merely surrogate keys; they are the durable handles auditors, incident responders, and automated validators use to retrieve the same fact months later. An entity, in turn, is the governed object those identifiers denote—the observation–precedence relationship itself, a host, a method run, or a cardinality assessment. When multiple typed facts attach to a single entity, as when OTHE-0001 carries both a duration of 1684.40 seconds and a host name of node-a01, the entity becomes the compositional unit of evidence: a bundle of attributes that together describe one governed occurrence rather than a scattered set of unrelated fields.

**t_observation_precedes_other**

| id | observation | precedes |
| --- | --- | --- |
| OTHE-0001 | server_disk_full | firmware_update_init |
| OTHE-0002 | server_disk_full | firmware_update_init |
| OTHE-0003 | server_disk_full | system_boot_sequence |
| OTHE-0004 | packet_drop_event | power_stabilization |
| OTHE-0005 | sensor_calibration_cycle | sensor_warmup_phase |
| OTHE-0006 | sensor_calibration_cycle | data_buffer_reset |
| OTHE-0007 | server_disk_full | config_load_event |

**t_observation_precedes_other_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| OTHE-0001 | duration_seconds | xsd:decimal |
| OTHE-0002 | end_time | xsd:dateTime |
| OTHE-0003 | exit_code | xsd:integer |
| OTHE-0004 | host_name | xsd:string |
| OTHE-0005 | log_level | xsd:string |
| OTHE-0006 | phase | xsd:string |
| OTHE-0007 | retry_count | xsd:integer |
| OTHE-0008 | scheduled_at | xsd:dateTime |

**t_observation_precedes_other_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OTHE-0001 | OTHE-0001 | OTHE-0003 | 701 |
| OTHE-0002 | OTHE-0001 | OTHE-0007 | 352 |
| OTHE-0003 | OTHE-0002 | OTHE-0003 | 884 |
| OTHE-0004 | OTHE-0002 | OTHE-0007 | 291 |
| OTHE-0005 | OTHE-0003 | OTHE-0003 | 330 |
| OTHE-0006 | OTHE-0003 | OTHE-0007 | 402 |
| OTHE-0007 | OTHE-0004 | OTHE-0003 | 564 |
| OTHE-0008 | OTHE-0004 | OTHE-0007 | 418 |

**t_observation_precedes_other_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OTHE-0001 | OTHE-0001 | OTHE-0004 | node-a01 |
| OTHE-0002 | OTHE-0001 | OTHE-0005 | Log Level 02 |
| OTHE-0003 | OTHE-0001 | OTHE-0006 | execution |
| OTHE-0004 | OTHE-0001 | OTHE-0010 | pending |
| OTHE-0005 | OTHE-0001 | OTHE-0011 | Triggered By 05 |
| OTHE-0006 | OTHE-0002 | OTHE-0004 | worker-07 |
| OTHE-0007 | OTHE-0002 | OTHE-0005 | Log Level 07 |
| OTHE-0008 | OTHE-0002 | OTHE-0006 | execution |

Attributes name what is being measured or asserted, while attribute type governs how values may legally be stored, compared, and aggregated. Declaring duration_seconds as xsd:decimal and end_time as xsd:dateTime is not cosmetic schema decoration; it enforces validation boundaries that prevent category errors in downstream analytics. A decimal duration belongs in a numeric fact store where sums and thresholds are meaningful, whereas a datetime such as 2023-06-01T02:07:24 belongs in a temporal store where ordering and interval logic apply. Exit codes and retry counts, typed as integers, signal discrete operational outcomes—exit values like 725 or 348 and retry counts ranging from 186 to 303—that compliance tooling can threshold, trend, and correlate without ambiguity. String-typed miscellany—labels such as execution or pending, or host identifiers—fills descriptive gaps that numbers cannot capture, yet still participates in the same entity-centric model because every value row binds back through entity and attribute keys.

**t_observation_precedes_other_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OTHE-0001 | OTHE-0001 | OTHE-0002 | 2023-06-01T02:07:24 |
| OTHE-0002 | OTHE-0001 | OTHE-0008 | 2024-03-08T22:48:06 |
| OTHE-0003 | OTHE-0001 | OTHE-0009 | 2024-11-20T05:59:50 |
| OTHE-0004 | OTHE-0002 | OTHE-0002 | 2024-10-01T01:54:05 |
| OTHE-0005 | OTHE-0002 | OTHE-0008 | 2023-05-04T16:55:24 |
| OTHE-0006 | OTHE-0002 | OTHE-0009 | 2025-04-07T12:49:05 |
| OTHE-0007 | OTHE-0003 | OTHE-0002 | 2025-01-06T09:52:42 |
| OTHE-0008 | OTHE-0003 | OTHE-0008 | 2024-04-17T14:38:04 |

**t_observation_precedes_other_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OTHE-0001 | OTHE-0001 | OTHE-0001 | 1684.40 |
| OTHE-0002 | OTHE-0002 | OTHE-0001 | 6255.67 |
| OTHE-0003 | OTHE-0003 | OTHE-0001 | 601.58 |
| OTHE-0004 | OTHE-0004 | OTHE-0001 | 5555.66 |
| OTHE-0005 | OTHE-0005 | OTHE-0001 | 2575.99 |
| OTHE-0006 | OTHE-0006 | OTHE-0001 | 3246.85 |
| OTHE-0007 | OTHE-0007 | OTHE-0001 | 663.52 |

The applies method construct records how a standardized analytical or enforcement procedure was invoked against governed material. Profiling facts tie a method key to runtime telemetry: duration_seconds in the thousands (6716.87, 2546.61), non-zero exit codes, and elevated retry_count figures that together reveal whether compliance automation succeeded cleanly or fought through transient failures. When the same method key—METH-0007—appears across multiple profiling rows with different durations and exit codes, practitioners infer repeated application under changing conditions rather than a single canonical run. Category dimensions sit above raw method identifiers to supply the taxonomic layer auditors need for rollup reporting: Applies Method Category 01 through 04, or Cardinality Category 01 through 04, translate opaque keys into policy-meaningful groupings without collapsing the granularity required for root-cause work.

**fact_profiling**

| id | applies_method_key | duration_seconds | exit_code | retry_count |
| --- | --- | --- | --- | --- |
| METH-0001 | METH-0001 | 6716.87 | 725 | 209 |
| METH-0002 | METH-0007 | 1113.38 | 809 | 186 |
| METH-0003 | METH-0007 | 2546.61 | 348 | 303 |
| METH-0004 | METH-0004 | 2074.93 | 827 | 264 |

**dim_applies_method_category**

| id | category_name |
| --- | --- |
| METH-0001 | Category Name 01 |
| METH-0002 | Category Name 02 |
| METH-0003 | Category Name 03 |
| METH-0004 | Category Name 04 |
| METH-0005 | Category Name 05 |
| METH-0006 | Category Name 06 |

Cardinality, in this domain, quantifies relational structure—how often, how strongly, or under what multiplicity constraints one governed fact connects to another—and confidence expresses how much trust to place in that quantification. A cardinality fact pairing confidence 0.994 with a measured value near 380.57 invites different governance action than one at confidence 0.226 with value 448.09; the former may justify automated remediation or policy closure, while the latter demands human review or supplementary collection. Uncertainty figures running in the hundreds alongside confidence provide a second axis: high confidence does not eliminate residual doubt, and low confidence does not always imply unusable signal when uncertainty bounds are tight. Category labels on cardinality dimensions further contextualize whether a measurement speaks to infrastructure topology, process fan-out, or observational linkage strength.

**fact_profile**

| id | cardinality_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| CARD-0001 | CARD-0001 | 0.299 | 284.36 | 728.94 |
| CARD-0002 | CARD-0003 | 0.994 | 557.92 | 380.57 |
| CARD-0003 | CARD-0005 | 0.773 | 622.09 | 607.36 |
| CARD-0004 | CARD-0002 | 0.226 | 488.10 | 448.09 |

Temporal precedence relationships form the causal spine on which typed attributes and method applications hang. Recording that server_disk_full precedes firmware_update_init, or that packet_drop_event precedes power_stabilization, establishes ordered evidence chains compliance investigators use to test hypothesized failure modes. Duration_seconds on those precedence records—601.58 seconds separating disk pressure from boot sequence in one case, 6255.67 in another—turn qualitative ordering into quantified windows suitable for SLA review and control effectiveness testing. End timestamps distributed across 2023 and 2024 anchor those intervals in calendar time, supporting retention policies and cross-incident correlation. Host names and operational states such as pending show that precedence is never abstract: it always materializes on named infrastructure under observable execution conditions.

Taken together, identifier, entity, attribute, attribute type, category, applies method, cardinality, confidence, duration_seconds, exit, misc, and retry_count implement a layered evidence architecture. Identifiers and entities preserve referential integrity; attributes and types enforce semantic discipline; categories and methods supply policy vocabulary and procedural provenance; cardinality and confidence govern how strongly to act on inferred structure; and duration, exit, and retry telemetry ground governance conclusions in measurable operational reality. Practitioners who treat these elements as an integrated system—not as isolated columns—can reconstruct what happened, how it was evaluated, how certain that evaluation was, and whether automated compliance machinery executed reliably or only after substantial retry burden.

**dim_applies_method**

| id | applies_method_label | applies_method_category | category_id |
| --- | --- | --- | --- |
| METH-0001 | Applies Method Label 01 | Applies Method Category 01 | METH-0006 |
| METH-0002 | Applies Method Label 02 | Applies Method Category 02 | METH-0001 |
| METH-0003 | Applies Method Label 03 | Applies Method Category 03 | METH-0003 |
| METH-0004 | Applies Method Label 04 | Applies Method Category 04 | METH-0001 |
| METH-0005 | Applies Method Label 05 | Applies Method Category 05 | METH-0002 |
| METH-0006 | Applies Method Label 06 | Applies Method Category 06 | METH-0001 |
| METH-0007 | Applies Method Label 07 | Applies Method Category 07 | METH-0001 |

**dim_cardinality**

| id | cardinality_label | cardinality_category |
| --- | --- | --- |
| CARD-0001 | Cardinality Label 01 | Cardinality Category 01 |
| CARD-0002 | Cardinality Label 02 | Cardinality Category 02 |
| CARD-0003 | Cardinality Label 03 | Cardinality Category 03 |
| CARD-0004 | Cardinality Label 04 | Cardinality Category 04 |
| CARD-0005 | Cardinality Label 05 | Cardinality Category 05 |
| CARD-0006 | Cardinality Label 06 | Cardinality Category 06 |