---
chapter_id: ch_live_provenance_agent_signs_audit_ed09b9
topic_id: 168
family: 07_long_tail
cited_terms: ['provenance_agent_signs_audit', 'column_renamed_from', 'measurement_with_unit']
model: engine-refine
---

In governed operational and analytical environments, stable identifiers anchor every assertion of fact to a durable key that survives renames, retries, and downstream reshaping. An identifier is not merely a surrogate primary key; it is the contract by which lineage, attribution, and reconciliation remain possible when the same logical object appears under different surface names. When a column such as `node_cpu_load` is recorded as having been renamed from `UNIT-0005`, or when `batch_run_id` traces to `UNIT-0007`, the identifier pair preserves the semantic continuity that compliance review depends on: auditors can follow a value from its present label back to the unit or measurement definition that originally produced it, without inferring equivalence from string similarity alone. That continuity matters because regulatory and quality systems punish ambiguity—two records that look alike but refer to different origins must remain distinguishable, and two records that differ only in naming must remain joinable.

**t_column_renamed_from**

| id | column | renamed_from |
| --- | --- | --- |
| FROM-0001 | node_cpu_load | UNIT-0005 |
| FROM-0002 | measurement_timestamp | UNIT-0006 |
| FROM-0003 | config_version | UNIT-0002 |
| FROM-0004 | batch_run_id | UNIT-0007 |
| FROM-0005 | event_type | UNIT-0001 |
| FROM-0006 | patient_bmi | UNIT-0008 |

**t_column_renamed_from_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| FROM-0001 | confidence | xsd:decimal |
| FROM-0002 | dimension_kind | xsd:string |
| FROM-0003 | method | xsd:string |
| FROM-0004 | recorded_at | xsd:dateTime |
| FROM-0005 | uncertainty | xsd:decimal |
| FROM-0006 | unit | xsd:string |
| FROM-0007 | value | xsd:decimal |
| FROM-0008 | encoding | xsd:string |

**t_column_renamed_from_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| FROM-0001 | FROM-0001 | FROM-0004 | 2025-03-21T00:09:12 |
| FROM-0002 | FROM-0002 | FROM-0004 | 2023-10-22T03:45:48 |
| FROM-0003 | FROM-0003 | FROM-0004 | 2023-09-09T06:02:35 |
| FROM-0004 | FROM-0004 | FROM-0004 | 2024-12-05T07:04:23 |
| FROM-0005 | FROM-0005 | FROM-0004 | 2023-10-09T20:16:15 |
| FROM-0006 | FROM-0006 | FROM-0004 | 2024-04-24T12:53:41 |

**t_column_renamed_from_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| FROM-0001 | FROM-0001 | FROM-0001 | 0.429 |
| FROM-0002 | FROM-0001 | FROM-0005 | 695.20 |
| FROM-0003 | FROM-0001 | FROM-0007 | 442.17 |
| FROM-0004 | FROM-0002 | FROM-0001 | 0.690 |
| FROM-0005 | FROM-0002 | FROM-0005 | 345.70 |
| FROM-0006 | FROM-0002 | FROM-0007 | 542.71 |
| FROM-0007 | FROM-0003 | FROM-0001 | 0.828 |
| FROM-0008 | FROM-0003 | FROM-0005 | 957.60 |

**t_column_renamed_from_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| FROM-0001 | FROM-0001 | FROM-0002 | Dimension Kind 01 |
| FROM-0002 | FROM-0001 | FROM-0008 | Encoding 02 |
| FROM-0003 | FROM-0001 | FROM-0009 | audit excerpt |
| FROM-0004 | FROM-0001 | FROM-0010 | fr |
| FROM-0005 | FROM-0001 | FROM-0003 | manual |
| FROM-0006 | FROM-0001 | FROM-0006 | deg_C |
| FROM-0007 | FROM-0002 | FROM-0002 | Dimension Kind 07 |
| FROM-0008 | FROM-0002 | FROM-0008 | Encoding 08 |

**t_measurement_with_unit**

| id | measurement |
| --- | --- |
| UNIT-0001 | Blood pressure |
| UNIT-0002 | Ozone concentration |
| UNIT-0003 | Seismic magnitude |
| UNIT-0004 | Network latency |
| UNIT-0005 | Network latency |
| UNIT-0006 | Battery voltage |
| UNIT-0007 | Network latency |
| UNIT-0008 | Blood pressure |

**t_measurement_with_unit_unit**

| id | unit |
| --- | --- |
| UNIT-0001 | milligrams per deciliter |
| UNIT-0002 | Richter scale |
| UNIT-0003 | milliseconds |
| UNIT-0004 | beats per minute |
| UNIT-0005 | milligrams per deciliter |
| UNIT-0006 | beats per minute |

Provenance extends identifier discipline into the question of origin: not only what a record is, but where it came from, under what operational conditions, and with what reliability. Provenance keys such as `AUDI-0003` and `AUDI-0007` tie factual execution records to descriptive dimensions—labels like Provenance Label 03 and categorical assignments such as Provenance Category 03—so that operational telemetry and business classification travel together through the warehouse. Duration in seconds (`2601.59` through `6949.35` in the observed runs) quantifies elapsed wall-clock cost and supports capacity planning, SLA enforcement, and forensic reconstruction of batch windows; exit codes (`256`, `728`, `452`, `985`) encode termination semantics that downstream consumers must interpret consistently, since a non-zero exit may signal hard failure, controlled abort, or policy-driven rejection depending on the job family; retry count (`196`, `304`, `410`, and as low as `23`) exposes instability or contention in upstream dependencies and distinguishes a single long attempt from a pipeline that succeeded only after sustained re-execution. Together, provenance, duration, exit, and retry count form the evidentiary spine of operational governance: they answer whether a published dataset was produced by a healthy run, a degraded run, or a run whose outcome should be quarantined pending review.

**fact_provenance**

| id | provenance_key | duration_seconds | exit_code | retry_count |
| --- | --- | --- | --- | --- |
| AUDI-0001 | AUDI-0003 | 2601.59 | 256 | 196 |
| AUDI-0002 | AUDI-0007 | 4921.58 | 728 | 304 |
| AUDI-0003 | AUDI-0008 | 2216.74 | 452 | 410 |
| AUDI-0004 | AUDI-0007 | 6949.35 | 985 | 23 |

Category and miscellaneous descriptive fields supply the human-legible layer atop that spine. Category partitions provenance into managed taxonomies—Provenance Category 01 through Provenance Category 04 in the sample—so that policy can be applied by class rather than by individual key: retention rules, access controls, and escalation paths often bind to category, not to every execution identifier. Miscellaneous values (`misc`) carry the variable payload that resists rigid typing: provenance labels for operator-facing dashboards, string encodings such as `Encoding 02`, audit excerpts, locale markers like `fr`, and typed literals once they have been materialized for storage. The misc designation signals intentional heterogeneity; governance treats these fields as governed content, not junk drawers, because misc values frequently appear in disclosure packages and incident narratives where auditors expect readable provenance without exposing internal schema mechanics.

**dim_provenance**

| id | provenance_label | provenance_category |
| --- | --- | --- |
| AUDI-0001 | Provenance Label 01 | Provenance Category 01 |
| AUDI-0002 | Provenance Label 02 | Provenance Category 02 |
| AUDI-0003 | Provenance Label 03 | Provenance Category 03 |
| AUDI-0004 | Provenance Label 04 | Provenance Category 04 |
| AUDI-0005 | Provenance Label 05 | Provenance Category 05 |
| AUDI-0006 | Provenance Label 06 | Provenance Category 06 |
| AUDI-0007 | Provenance Label 07 | Provenance Category 07 |
| AUDI-0008 | Provenance Label 08 | Provenance Category 08 |

Entity–attribute modeling separates *who or what is being described* from *what is being said about it*. The entity (`entity_id`) identifies the row or object instance—here aligned with rename-lineage records `FROM-0001` through `FROM-0004`—while attr names (`confidence`, `dimension_kind`, `method`, `recorded_at`) declare the semantic slot being populated. Attr type enforces interpretability at the boundary: `xsd:decimal` for quantities such as `0.429` and `695.20`, `xsd:string` for controlled vocabulary entries like Dimension Kind 01, and `xsd:dateTime` for instants including `2025-03-21T00:09:12`. Splitting values across type-aligned stores (decimal, varchar, datetime) is a practical pattern for index efficiency and constraint enforcement; it also prevents silent coercion—treating a timestamp as a number or a category code as free text—which is a common source of compliance drift. Multiple attributes may attach to the same entity (`FROM-0001` carrying both decimal confidence and varchar dimension kind), and a single attribute such as `recorded_at` may repeat across entities with distinct values, illustrating that governance must track cardinality and cardinality rules per attr, not assume one-value-per-row simplicity.

Subject and role complete the relational vocabulary when measurements, units, and actors participate in many-to-many associations rather than flat denormalized tables. In unit association patterns, the subject (`measurement_id` referencing definitions such as network latency linked to `UNIT-0004`, or ozone concentration linked to `UNIT-0002`) is the governed object whose quantities must be reported with correct dimensional context—milligrams per deciliter, Richter scale, milliseconds, beats per minute. Role (`owner`, `reviewer`, `observer`) states the capacity in which a unit or party is bound to that subject: ownership establishes accountability for definition and change control, reviewer confers validation authority, and observer grants read-only evidentiary access without edit rights. The same measurement may therefore relate to more than one unit under different roles, and governance workflows must reject publications where required roles—commonly owner plus reviewer—are absent or conflicted.

Operational practice treats these elements as a closed loop. Identifiers and rename lineage preserve referential integrity across schema evolution; provenance facts with duration, exit, and retry count qualify datasets before they enter certified marts; category and misc fields make lineage legible to policy owners; entity, attr, and attr type govern what may be stored and how it may be compared; and subject–role bindings ensure measurements are interpreted with correct units and accountable parties. A record that lacks a resolvable provenance key, carries an unexplained exit, or attaches a decimal attr without a declared attr type should fail validation—not because the schema is pedantic, but because without that evidence chain the organization cannot defend the number in an audit, reproduce the pipeline state at publication time, or explain why a blood-pressure reading was expressed in milliseconds rather than beats per minute. Dense metadata of this kind is the difference between data that merely exists and data that can be trusted under scrutiny.

**t_measurement_with_unit__unit**

| id | measurement_id | unit_id | role |
| --- | --- | --- | --- |
| UNIT-0001 | UNIT-0004 | UNIT-0001 | owner |
| UNIT-0002 | UNIT-0002 | UNIT-0002 | reviewer |
| UNIT-0003 | UNIT-0008 | UNIT-0005 | observer |
| UNIT-0004 | UNIT-0005 | UNIT-0006 | reviewer |
| UNIT-0005 | UNIT-0007 | UNIT-0003 | contributor |
| UNIT-0006 | UNIT-0003 | UNIT-0002 | contributor |
| UNIT-0007 | UNIT-0005 | UNIT-0006 | contributor |
| UNIT-0008 | UNIT-0006 | UNIT-0004 | contributor |