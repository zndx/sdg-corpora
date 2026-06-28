---
chapter_id: ch_live_metric_with_unit_0873cf
topic_id: 14
family: 07_long_tail
cited_terms: ['metric_with_unit', 'audit_with_findings', 'schemaorg_event_starttime']
model: engine-refine
---

In governed measurement and audit systems, the identifier functions as the durable handle by which records remain traceable across ingestion, validation, and reporting cycles. Designations such as UNIT-0001 through UNIT-0004, FIND-0001 through FIND-0004, and STAR-0001 through STAR-0005 are not merely serial numbers; they establish referential integrity so that a metric definition, its attribute schema, its instantiated values, and any downstream finding or fact row can be joined without ambiguity. Where an entity receives multiple attribute bindings—as when UNIT-0001 carries checksum c0ffee42, identifier oid:1.3.6.1, license GPL-3.0, and region eu-west-3—the entity identifier anchors those disparate misc values to a single governed object, permitting auditors and data stewards to reconstruct provenance and enforce policy at the unit of accountability rather than at the level of isolated fields.

**t_metric_with_unit**

| id | metric | metric_unit |
| --- | --- | --- |
| UNIT-0001 | megabytes per second | FIND-0002 |
| UNIT-0002 | network bandwidth | FIND-0004 |
| UNIT-0003 | degrees Celsius | FIND-0003 |
| UNIT-0004 | hertz | FIND-0004 |
| UNIT-0005 | temperature | FIND-0004 |
| UNIT-0006 | megabytes per second | FIND-0001 |

**t_metric_with_unit_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| UNIT-0001 | UNIT-0001 | UNIT-0002 | 2023-09-28 |
| UNIT-0002 | UNIT-0002 | UNIT-0002 | 2024-02-22 |
| UNIT-0003 | UNIT-0003 | UNIT-0002 | 2023-12-02 |
| UNIT-0004 | UNIT-0004 | UNIT-0002 | 2024-09-28 |
| UNIT-0005 | UNIT-0005 | UNIT-0002 | 2024-02-26 |
| UNIT-0006 | UNIT-0006 | UNIT-0002 | 2024-12-06 |

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

Attribute and attr type together constitute the contract under which misc values may be admitted, interpreted, and retained. An attr such as created_date is not interchangeable with checksum or license even when all appear as rows in the same administrative catalogue, because attr type prescribes the semantic and syntactic regime: xsd:date constrains created_date to calendar instants (2023-09-28, 2024-02-22, 2023-12-02, 2024-09-28), xsd:string governs checksum and license literals, and cco:DesignativeICE signals a designative identifier class suitable for formal designation of entities. Partitioning concrete values into type-aligned stores—integer misc for counts and scores (97, 2, 477, 11), varchar misc for opaque or symbolic tokens, date misc for temporal attestations—prevents silent coercion and supports automated conformance checking. In practice, stewards treat attr type as the authoritative declaration of permissible operations: comparison, aggregation, redaction, and retention scheduling all derive from it.

Category supplies the interpretive frame within which otherwise homogeneous time or event keys acquire operational meaning. Event start time, materialized both as a fact foreign key (STAR-0005, STAR-0003, STAR-0001) and as a dimension carrying labels and categories, exemplifies the separation of measurable occurrence from classificatory context: the same STAR-0001 key may label “Event Start Time Label 01” while residing in “Event Start Time Category 01,” allowing roll-ups that are stable under relabelling and comparable across versioned extracts. Category therefore matters for compliance reporting because it defines the buckets—temporal, jurisdictional, or procedural—into which size_bytes and versioned artefacts are summarized without re-deriving taxonomy from raw timestamps on each analytic pass.

**fact_schemaorg**

| id | event_start_time_key | size_bytes | version |
| --- | --- | --- | --- |
| STAR-0001 | STAR-0005 | 895265030 | 3 |
| STAR-0002 | STAR-0003 | 114301972 | 5 |
| STAR-0003 | STAR-0001 | 338701831 | 4 |
| STAR-0004 | STAR-0001 | 998785819 | 8 |

Operational telemetry from assessment activity—durationseconds and hostname—documents how governance work was performed, not merely what it concluded. Durations of 5564.74 s for a HIPAA Security Assessment on worker-07, 1140.43 s for a Data Lake Governance Review on node-a01, 7105.34 s for a SOC 2 Type II Review on node-b14, and 2350.00 s for an ISO 27001 Certification on edge-03 establish an evidence chain linking programme scope to execution context: long-running reviews on designated workers versus shorter edge-hosted certification runs imply different control surfaces, scheduling assumptions, and evidentiary capture paths. Hostname attribution prevents findings from floating as anonymous outcomes; it ties each measured interval to infrastructure identity so that repeatability, segregation of duties, and incident reconstruction can be defended under examination.

At the analytic boundary, size_bytes and version quantify the material footprint and lineage of published knowledge. Schema.org-aligned facts recording 895265030, 114301972, 338701831, and 998785819 bytes at versions 3, 5, 4, and 8 respectively demonstrate that governance is exercised over corpora whose bulk and revision state vary independently: a smaller payload may carry a higher version number, signalling iterative refinement rather than monotonic growth. Size_bytes supports capacity planning, data-minimization review, and transfer-risk assessment; version supports change control, backward compatibility, and the identification of superseded disclosures. Together with event start time keys, these measures allow stewards to answer, for any reporting period, which categorical slice of activity produced which byte-weighted artefact under which schema generation.

Across the domain, attr, attr type, category, durationseconds, entity, event start time, hostname, identifier, misc, size_bytes, and version interlock as complementary evidence types rather than redundant descriptors. Identifiers and entities stabilize reference; attrs and attr types stabilize meaning; misc columns carry the admitted literals; categories organize time and event semantics for aggregation; durationseconds and hostname attest execution; size_bytes and version attest corpus state. Findings that resolve to UNIT-0006 across HIPAA, data-lake, SOC 2, and ISO programmes illustrate the closing loop: metric units implicated in audits become the locus where measured throughput (megabytes per second, network bandwidth), environmental quantities (degrees Celsius, hertz), and their governed attributes must be reconciled with the operational record. Mature practice treats each field as a distinct evidential obligation—define it precisely, populate it under type discipline, and retain the joins that allow a reviewer to move from hostname and elapsed seconds to entity-level misc values, categorical event context, and versioned byte totals without inferential gaps.

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

**t_audit_with_findings**

| id | audit | findings | duration_seconds | host_name |
| --- | --- | --- | --- | --- |
| FIND-0001 | HIPAA Security Assessment | UNIT-0006 | 5564.74 | worker-07 |
| FIND-0002 | Data Lake Governance Review | UNIT-0006 | 1140.43 | node-a01 |
| FIND-0003 | SOC 2 Type II Review | UNIT-0006 | 7105.34 | node-b14 |
| FIND-0004 | ISO 27001 Certification | UNIT-0006 | 2350.00 | edge-03 |
| FIND-0005 | Third-Party Vendor Review | UNIT-0002 | 2041.65 | worker-07 |
| FIND-0006 | Data Lake Governance Review | UNIT-0005 | 3303.91 | ingest-21 |
| FIND-0007 | ML Model Drift Audit | UNIT-0003 | 5489.56 | ingest-21 |

**dim_event_start_time**

| id | event_start_time_label | event_start_time_category |
| --- | --- | --- |
| STAR-0001 | Event Start Time Label 01 | Event Start Time Category 01 |
| STAR-0002 | Event Start Time Label 02 | Event Start Time Category 02 |
| STAR-0003 | Event Start Time Label 03 | Event Start Time Category 03 |
| STAR-0004 | Event Start Time Label 04 | Event Start Time Category 04 |
| STAR-0005 | Event Start Time Label 05 | Event Start Time Category 05 |
| STAR-0006 | Event Start Time Label 06 | Event Start Time Category 06 |