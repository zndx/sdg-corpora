---
chapter_id: ch_live_column_tag_from_annotator_238586
topic_id: 186
family: 07_long_tail
cited_terms: ['column_tag_from_annotator', 'trace_originates_from', 'artifact_min_one_owner']
model: engine-refine
---

In governed data environments, every assertion about a column, artifact, or pipeline run must be addressable, typed, and traceable back to whoever or whatever produced it. The **identifier** is the spine of that discipline: a stable surrogate such as `ANNO-0001` or `FROM-0003` that survives renames, reprocessing, and cross-system joins without collapsing distinct facts into one ambiguous row. Identifiers do not themselves explain meaning; they anchor meaning elsewhere. A compliance review of `ingestion_latency` tagged by a `lab_technician`, or of `api_version` tagged separately by an `auto_classifier` and a `compliance_officer`, depends on being able to retrieve exactly those annotation records years later and prove they were never conflated with a sibling tag on the same physical column.

**t_column_tag_from_annotator**

| id | column | by_annotator |
| --- | --- | --- |
| ANNO-0001 | ingestion_latency | lab_technician |
| ANNO-0002 | compliance_flag | lab_technician |
| ANNO-0003 | api_version | auto_classifier |
| ANNO-0004 | api_version | compliance_officer |
| ANNO-0005 | compliance_flag | governance_board |
| ANNO-0006 | event_timestamp | ml_inference_engine |

An **entity** is the thing being described, and an **attr** is the named facet of that thing. Confidence on a latency measurement, `dimension_kind` on a compliance flag, `method` on a classifier output, and `recorded_at` on an API-version assertion are all attributes, but they are not interchangeable: each answers a different audit question. **Attr type** enforces that separation at the storage boundary. When `confidence` is declared `xsd:decimal`, its values—`0.302` for one entity, `0.049` for another—live in a decimal-valued store and participate in numeric tolerance checks. When `recorded_at` is `xsd:dateTime`, timestamps such as `2025-01-07T23:20:10` and `2023-05-11T14:25:42` are compared with interval logic, not string collation. String-typed facets like `dimension_kind` (`Dimension Kind 01`) or operational labels (`Encoding 02`, `nightly summary`, locale `en`) belong in character-valued stores. The typed split is not pedantry; it is how validators reject category errors before bad metadata propagates into retention rules, access policies, or downstream models.

The **misc** role in this domain is deliberately heterogeneous: it holds human-readable **category** labels and free-form attribute payloads that resist a single rigid column semantics. **Category** answers “which bucket does this belong in?” without encoding the full story. An origin classified as `Originates From Category 03` or an owner grouped under `Owner Category 03` tells compliance officers which control matrix, escalation path, or data-handling standard applies before anyone reads the longer **misc** label (`Originates From Label 03`, `Owner Label 03`). Categories compress governance vocabulary; misc fields carry the remainder—display names, enumerated tokens, or literal values that auditors quote in findings. Used together, they let the same identifier participate in both machine routing (category-driven policy) and human review (label- and value-driven narrative).

**dim_originates_from**

| id | originates_from_label | originates_from_category |
| --- | --- | --- |
| FROM-0001 | Originates From Label 01 | Originates From Category 01 |
| FROM-0002 | Originates From Label 02 | Originates From Category 02 |
| FROM-0003 | Originates From Label 03 | Originates From Category 03 |
| FROM-0004 | Originates From Label 04 | Originates From Category 04 |
| FROM-0005 | Originates From Label 05 | Originates From Category 05 |
| FROM-0006 | Originates From Label 06 | Originates From Category 06 |
| FROM-0007 | Originates From Label 07 | Originates From Category 07 |

**dim_owner**

| id | owner_label | owner_category |
| --- | --- | --- |
| OWNE-0001 | Owner Label 01 | Owner Category 01 |
| OWNE-0002 | Owner Label 02 | Owner Category 02 |
| OWNE-0003 | Owner Label 03 | Owner Category 03 |
| OWNE-0004 | Owner Label 04 | Owner Category 04 |
| OWNE-0005 | Owner Label 05 | Owner Category 05 |
| OWNE-0006 | Owner Label 06 | Owner Category 06 |

Operational and lineage metadata extend the same pattern from static annotations to executed work. **Originates from** ties a trace fact to a known source dimension: a run keyed `FROM-0003` points at an upstream origin record, placing that execution inside a labeled, categorized provenance chain rather than leaving it as an orphan log line. Against that anchor, **duration seconds** (`3940.66` on one trace, `1874.27` on another) quantify elapsed cost and help separate slow-but-healthy jobs from runaway work, while **exit** codes (`491`, `900`, `420`, `60`) classify terminal state for incident triage and control effectiveness testing. **Retry count** (`399`, `179`, `396`, `459`) exposes resilience behavior: elevated retries may indicate flaky dependencies, misconfigured backoff, or deliberate re-execution under compliance replay—each with different remediation. Treating exit and retries as first-class facts, not log footnotes, is what makes SLA dashboards and regulatory reconstructions defensible.

**fact_trace**

| id | originates_from_key | duration_seconds | exit_code | retry_count |
| --- | --- | --- | --- | --- |
| FROM-0001 | FROM-0002 | 1874.27 | 491 | 399 |
| FROM-0002 | FROM-0001 | 2092.44 | 900 | 179 |
| FROM-0003 | FROM-0005 | 3940.66 | 420 | 396 |
| FROM-0004 | FROM-0004 | 3336.66 | 60 | 459 |

Artifact governance closes the loop on custody and capacity. **Owner** resolves through a dimension key to accountable party and **category**, so three large artifacts all referencing the same owner key (`OWNE-0003`) can be reviewed as a single custodial boundary even when their **size bytes** differ by orders of magnitude (`123155790` versus `996080316`). Size is a control input: it drives storage charges, transfer windows, encryption scope, and evidence-package limits in legal hold. Version numbers sitting beside size remind operators that governance attaches to a specific revision, not a floating filename. When an artifact outgrows policy thresholds or an owner’s category changes, identifier-stable records allow retroactive impact analysis without re-scanning raw storage.

**fact_artifact**

| id | owner_key | size_bytes | version |
| --- | --- | --- | --- |
| OWNE-0001 | OWNE-0003 | 123155790 | 6 |
| OWNE-0002 | OWNE-0003 | 42978804 | 5 |
| OWNE-0003 | OWNE-0003 | 996080316 | 5 |
| OWNE-0004 | OWNE-0005 | 597369362 | 10 |
| OWNE-0005 | OWNE-0006 | 12061913 | 9 |
| OWNE-0006 | OWNE-0004 | 792675668 | 5 |

In practice, these elements interlock rather than standing alone. An annotator issues an identifier-backed tag on `compliance_flag`; typed attrs record how the tag was produced and when; trace facts show which originating pipeline run materialized the column with what exit and retry profile; artifact facts prove who owned the output and how large it was at rest. Compliance succeeds when each hop—entity, attr, attr type, category, misc value, origin, duration, exit, retry, owner, size—can be joined on identifiers and interpreted under shared typing rules. That is the difference between a metadata appendix and an evidence chain: every field is a testable claim, and the domain vocabulary exists so those claims remain comparable across systems, time, and auditors.

**t_column_tag_from_annotator_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ANNO-0001 | confidence | xsd:decimal |
| ANNO-0002 | dimension_kind | xsd:string |
| ANNO-0003 | method | xsd:string |
| ANNO-0004 | recorded_at | xsd:dateTime |
| ANNO-0005 | uncertainty | xsd:decimal |
| ANNO-0006 | unit | xsd:string |
| ANNO-0007 | value | xsd:decimal |
| ANNO-0008 | encoding | xsd:string |

**t_column_tag_from_annotator_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ANNO-0001 | ANNO-0001 | ANNO-0004 | 2025-01-07T23:20:10 |
| ANNO-0002 | ANNO-0002 | ANNO-0004 | 2024-03-06T18:58:36 |
| ANNO-0003 | ANNO-0003 | ANNO-0004 | 2024-05-08T12:18:31 |
| ANNO-0004 | ANNO-0004 | ANNO-0004 | 2023-05-11T14:25:42 |
| ANNO-0005 | ANNO-0005 | ANNO-0004 | 2023-11-26T14:31:09 |
| ANNO-0006 | ANNO-0006 | ANNO-0004 | 2024-05-18T09:15:26 |

**t_column_tag_from_annotator_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ANNO-0001 | ANNO-0001 | ANNO-0001 | 0.302 |
| ANNO-0002 | ANNO-0001 | ANNO-0005 | 639.96 |
| ANNO-0003 | ANNO-0001 | ANNO-0007 | 206.06 |
| ANNO-0004 | ANNO-0002 | ANNO-0001 | 0.049 |
| ANNO-0005 | ANNO-0002 | ANNO-0005 | 98.50 |
| ANNO-0006 | ANNO-0002 | ANNO-0007 | 895.36 |
| ANNO-0007 | ANNO-0003 | ANNO-0001 | 0.609 |
| ANNO-0008 | ANNO-0003 | ANNO-0005 | 158.17 |

**t_column_tag_from_annotator_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ANNO-0001 | ANNO-0001 | ANNO-0002 | Dimension Kind 01 |
| ANNO-0002 | ANNO-0001 | ANNO-0008 | Encoding 02 |
| ANNO-0003 | ANNO-0001 | ANNO-0009 | nightly summary |
| ANNO-0004 | ANNO-0001 | ANNO-0010 | en |
| ANNO-0005 | ANNO-0001 | ANNO-0003 | hybrid |
| ANNO-0006 | ANNO-0001 | ANNO-0006 | kg |
| ANNO-0007 | ANNO-0002 | ANNO-0002 | Dimension Kind 07 |
| ANNO-0008 | ANNO-0002 | ANNO-0008 | Encoding 08 |