---
chapter_id: ch_live_artifact_not_deprecated_39bec1
topic_id: 20
family: 07_long_tail
cited_terms: ['artifact_not_deprecated', 'verification_concludes_with', 'metric_with_unit']
model: engine-refine
---

An artifact, in governed data and compliance operations, is a versioned deliverable whose physical presence is expressed through byte extent and whose administrative identity is carried by a stable identifier. Artifacts are not anonymous blobs: each governed instance receives a designative key that may align with or diverge from its record identifier, permitting the same logical object to be referenced across fact and dimension contexts while preserving audit lineage. Where DEPR-0004 appears as both identifier and artifact key in one fact row yet pairs with version 10 at 597369362 bytes, the record asserts a specific materialization of a deliverable whose scale—ranging from 42978804 bytes on an earlier revision to 996080316 bytes on another—signals substantive change in content rather than cosmetic relabeling. Version integers (5, 6, 10) therefore function as ordinal governance markers: they tell reviewers which instantiation was scanned, hashed, or promoted, and they anchor retention, rollback, and evidentiary comparison without requiring reinterpretation of the underlying payload.

Category and miscellaneous descriptive fields supply the semantic layer that byte counts and version numbers cannot. Artifact Category 01 through Artifact Category 04 partition the inventory into operational classes—installation evidence, telemetry bundles, lineage extracts, integrity attestations—while labels such as Artifact Label 03 furnish human-readable handles for dashboards, work queues, and exception routing. Identifier strings (DEPR-0001, WITH-0004, UNIT-0003) remain the authoritative join keys across the model; they are deliberately opaque to casual reading yet unambiguous for automation. In practice, an auditor traces a verification event from its identifier backward to the artifact dimension and forward to the unit of measure that concluded the check, never inferring identity from label text alone.

**dim_artifact**

| id | artifact_label | artifact_category |
| --- | --- | --- |
| DEPR-0001 | Artifact Label 01 | Artifact Category 01 |
| DEPR-0002 | Artifact Label 02 | Artifact Category 02 |
| DEPR-0003 | Artifact Label 03 | Artifact Category 03 |
| DEPR-0004 | Artifact Label 04 | Artifact Category 04 |
| DEPR-0005 | Artifact Label 05 | Artifact Category 05 |
| DEPR-0006 | Artifact Label 06 | Artifact Category 06 |

Entity denotes the instance to which attributes attach: a verification concludes-with record (WITH-0001), a metric-with-unit definition (UNIT-0002), or any other governed row that participates in a typed property graph. Attributes name what is being asserted—duration_seconds, end_time, exit_code, host_name on verification outcomes; checksum, created_date, identifier, license on metric units—and attr type declares the interpretive contract under which values must be parsed, compared, and validated. Binding attr_name to xsd:decimal, xsd:dateTime, xsd:integer, or xsd:string (and, where domain extensions apply, cco:DesignativeICE) prevents category errors at ingestion: a duration of 5022.45 is not coerced into a timestamp, and an exit code of 299 remains an integer verdict rather than free text. Typed storage is therefore not a schema exercise for its own sake; it is the enforcement mechanism that keeps compliance evidence machine-checkable and legally defensible.

**t_verification_concludes_with**

| id | verification | concludes_with |
| --- | --- | --- |
| WITH-0001 | Compliance Gateway Scan | UNIT-0002 |
| WITH-0002 | Telemetry Sync Verify | UNIT-0005 |
| WITH-0003 | Data Lineage Trace | UNIT-0004 |
| WITH-0004 | Artifact Hash Check | UNIT-0003 |
| WITH-0005 | Model Drift Assessment | UNIT-0006 |
| WITH-0006 | Artifact Hash Check | UNIT-0006 |

**t_verification_concludes_with_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| WITH-0001 | duration_seconds | xsd:decimal |
| WITH-0002 | end_time | xsd:dateTime |
| WITH-0003 | exit_code | xsd:integer |
| WITH-0004 | host_name | xsd:string |
| WITH-0005 | log_level | xsd:string |
| WITH-0006 | phase | xsd:string |
| WITH-0007 | retry_count | xsd:integer |
| WITH-0008 | scheduled_at | xsd:dateTime |

**t_verification_concludes_with_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| WITH-0001 | WITH-0001 | WITH-0002 | 2023-03-17T15:14:20 |
| WITH-0002 | WITH-0001 | WITH-0008 | 2023-03-29T16:58:23 |
| WITH-0003 | WITH-0001 | WITH-0009 | 2023-05-17T22:59:07 |
| WITH-0004 | WITH-0002 | WITH-0002 | 2023-10-18T10:06:06 |
| WITH-0005 | WITH-0002 | WITH-0008 | 2023-06-18T21:36:06 |
| WITH-0006 | WITH-0002 | WITH-0009 | 2025-01-08T20:27:31 |
| WITH-0007 | WITH-0003 | WITH-0002 | 2025-05-26T17:08:43 |
| WITH-0008 | WITH-0003 | WITH-0008 | 2023-08-15T17:46:49 |

**t_verification_concludes_with_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| WITH-0001 | WITH-0001 | WITH-0001 | 5022.45 |
| WITH-0002 | WITH-0002 | WITH-0001 | 4498.56 |
| WITH-0003 | WITH-0003 | WITH-0001 | 4177.56 |
| WITH-0004 | WITH-0004 | WITH-0001 | 216.79 |
| WITH-0005 | WITH-0005 | WITH-0001 | 4466.82 |
| WITH-0006 | WITH-0006 | WITH-0001 | 6044.91 |

**t_verification_concludes_with_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| WITH-0001 | WITH-0001 | WITH-0003 | 299 |
| WITH-0002 | WITH-0001 | WITH-0007 | 242 |
| WITH-0003 | WITH-0002 | WITH-0003 | 130 |
| WITH-0004 | WITH-0002 | WITH-0007 | 120 |
| WITH-0005 | WITH-0003 | WITH-0003 | 587 |
| WITH-0006 | WITH-0003 | WITH-0007 | 195 |
| WITH-0007 | WITH-0004 | WITH-0003 | 700 |
| WITH-0008 | WITH-0004 | WITH-0007 | 420 |

**t_metric_with_unit**

| id | metric | metric_unit |
| --- | --- | --- |
| UNIT-0001 | megabytes per second | WITH-0005 |
| UNIT-0002 | network bandwidth | WITH-0005 |
| UNIT-0003 | degrees Celsius | WITH-0003 |
| UNIT-0004 | hertz | WITH-0005 |
| UNIT-0005 | temperature | WITH-0006 |
| UNIT-0006 | megabytes per second | WITH-0006 |

**t_metric_with_unit_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| UNIT-0001 | checksum | xsd:string |
| UNIT-0002 | created_date | xsd:date |
| UNIT-0003 | identifier | cco:DesignativeICE |
| UNIT-0004 | license | xsd:string |
| UNIT-0005 | mime_type | xsd:string |
| UNIT-0006 | size_bytes | xsd:long |
| UNIT-0007 | uri | xsd:string |
| UNIT-0008 | version | xsd:integer |

**t_metric_with_unit_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| UNIT-0001 | UNIT-0001 | UNIT-0002 | 2023-09-28 |
| UNIT-0002 | UNIT-0002 | UNIT-0002 | 2024-02-22 |
| UNIT-0003 | UNIT-0003 | UNIT-0002 | 2023-12-02 |
| UNIT-0004 | UNIT-0004 | UNIT-0002 | 2024-09-28 |
| UNIT-0005 | UNIT-0005 | UNIT-0002 | 2024-02-26 |
| UNIT-0006 | UNIT-0006 | UNIT-0002 | 2024-12-06 |

Miscellaneous value columns hold the evidentiary particulars once entity, attribute, and type are resolved. A verification WITH-0001 may simultaneously record duration_seconds as 5022.45, end_time as 2023-03-17T15:14:20, exit_code 299, and host_name ingest-21—four orthogonal facts about one governed event, each stored in the physical table that matches its attr type. The same pattern appears when UNIT-0001 carries checksum c0ffee42, created_date 2023-09-28, identifier oid:1.3.6.1, and license GPL-3.0: miscellaneous fields aggregate into a composite characterization of the measuring context (megabytes per second concluding UNIT-0002 after Compliance Gateway Scan) rather than collapsing into a single undifferentiated note. Reviewers read these values as audit primitives—timestamps bound to wall-clock accountability, exit codes summarizing pass-fail semantics, host names tying execution to infrastructure inventory.

Verification workflows articulate how artifacts enter the compliance posture: Compliance Gateway Scan, Telemetry Sync Verify, Data Lineage Trace, and Artifact Hash Check each conclude_with a metric-with-unit anchor (UNIT-0002, UNIT-0005, UNIT-0004, UNIT-0003), establishing which dimensional frame—network bandwidth, degrees Celsius, hertz—governs interpretation of the measured outcome. Cross-linkage is intentional: WITH-0005 associates repeatedly with UNIT-0005 across metric definitions, while WITH-0003 pairs with UNIT-0004 for lineage-sensitive checks. Integer misc values such as 97, 477, and 11 on unit records may encode tier, priority, or sampling parameters depending on operational convention; varchar misc values including eu-west-3 locate the evidentiary act inside regional control boundaries. Together, artifact version and size_bytes answer “what changed and how large,” category and label answer “what class of evidence,” identifier answers “which row is canonical,” entity and attr answer “what is being said about whom,” attr type answers “how to read it,” and misc answers “what was observed”—a closed loop from deliverable through verification to measurable conclusion.

**fact_artifact**

| id | artifact_key | size_bytes | version |
| --- | --- | --- | --- |
| DEPR-0001 | DEPR-0004 | 123155790 | 6 |
| DEPR-0002 | DEPR-0005 | 42978804 | 5 |
| DEPR-0003 | DEPR-0004 | 996080316 | 5 |
| DEPR-0004 | DEPR-0005 | 597369362 | 10 |
| DEPR-0005 | DEPR-0006 | 12061913 | 9 |
| DEPR-0006 | DEPR-0001 | 792675668 | 5 |

**t_verification_concludes_with_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| WITH-0001 | WITH-0001 | WITH-0004 | ingest-21 |
| WITH-0002 | WITH-0001 | WITH-0005 | Log Level 02 |
| WITH-0003 | WITH-0001 | WITH-0006 | review |
| WITH-0004 | WITH-0001 | WITH-0010 | complete |
| WITH-0005 | WITH-0001 | WITH-0011 | Triggered By 05 |
| WITH-0006 | WITH-0002 | WITH-0004 | gw-12 |
| WITH-0007 | WITH-0002 | WITH-0005 | Log Level 07 |
| WITH-0008 | WITH-0002 | WITH-0006 | execution |

**t_metric_with_unit_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| UNIT-0001 | UNIT-0001 | UNIT-0006 | 97 |
| UNIT-0002 | UNIT-0001 | UNIT-0008 | 2 |
| UNIT-0003 | UNIT-0002 | UNIT-0006 | 477 |
| UNIT-0004 | UNIT-0002 | UNIT-0008 | 11 |
| UNIT-0005 | UNIT-0003 | UNIT-0006 | 499 |
| UNIT-0006 | UNIT-0003 | UNIT-0008 | 7 |
| UNIT-0007 | UNIT-0004 | UNIT-0006 | 214 |
| UNIT-0008 | UNIT-0004 | UNIT-0008 | 1 |

**t_metric_with_unit_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| UNIT-0001 | UNIT-0001 | UNIT-0001 | c0ffee42 |
| UNIT-0002 | UNIT-0001 | UNIT-0003 | oid:1.3.6.1 |
| UNIT-0003 | UNIT-0001 | UNIT-0004 | GPL-3.0 |
| UNIT-0004 | UNIT-0001 | UNIT-0009 | eu-west-3 |
| UNIT-0005 | UNIT-0001 | UNIT-0005 | application/parquet |
| UNIT-0006 | UNIT-0001 | UNIT-0010 | Name 06 |
| UNIT-0007 | UNIT-0001 | UNIT-0011 | data-engineering |
| UNIT-0008 | UNIT-0001 | UNIT-0012 | Tags 08 |

Operational teams rely on this separation because governance failures most often arise at the seams: a relabeled artifact mistaken for a new version, a string typed exit code that breaks aggregation, or a verification logged without the unit that defines permissible thresholds. Maintaining distinct identifiers for fact rows (DEPR-0002 at version 5, 42978804 bytes) and dimension rows (Artifact Label 02 under Artifact Category 02) allows promotion pipelines to advance version while preserving historical fact for immutability requirements. When Artifact Hash Check concludes_with UNIT-0003 and records duration_seconds 4177.56 alongside end_time 2023-05-17T22:59:07, investigators can reconstruct latency, timing, and outcome in a single entity without reopening raw logs. That reconstructability—anchored in typed attributes, stable identifiers, and versioned artifacts—is the practical reason these constructs matter: they convert operational activity into durable, queryable compliance evidence rather than anecdotal assurance.