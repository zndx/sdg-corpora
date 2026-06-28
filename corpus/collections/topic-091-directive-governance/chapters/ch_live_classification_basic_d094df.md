---
chapter_id: ch_live_classification_basic_d094df
topic_id: 91
family: 03_directive_governance
cited_terms: ['classification_basic', 'classification_subclass', 'classification_under_taxonomy']
model: engine-refine
---

Operational classification in governed data environments rests on a small set of cross-cutting primitives whose names recur across persistence layers, audit exports, and reconciliation jobs long after the originating workflow has closed. Among these, the identifier anchors every downstream join: a value such as CLAS-0001 or TAXO-0001 is not merely a surrogate key but a durable handle that survives reclassification, subprocess retries, and cross-system federation, so that a sensor calibration run referenced at the basic tier can still be resolved when the same logical object reappears under OWASP Risk Rating or Lab Sample Category at a finer grain. Without such stable identifiers, phase transitions and status rollups would collapse into ambiguous narrative logs rather than machine-verifiable lineage.

**t_classification_basic**

| id | classification | phase | triggered_by |
| --- | --- | --- | --- |
| CLAS-0001 | sensor calibration | execution | schedule |
| CLAS-0002 | data validation | review | manual |
| CLAS-0003 | pipeline orchestration | execution | schedule |
| CLAS-0004 | sensor calibration | review | retry |
| CLAS-0005 | data ingestion | execution | event |
| CLAS-0006 | batch processing | review | retry |

**t_classification_under_taxonomy**

| id | classification | under_taxonomy |
| --- | --- | --- |
| TAXO-0001 | Lab Sample Category | EDAM Ontology |
| TAXO-0002 | Anomaly Detection Model | DQO Framework |
| TAXO-0003 | Experiment Phase Code | LOINC Code Set |
| TAXO-0004 | Telemetry Stream Type | SAREK Pipeline |
| TAXO-0005 | Compliance Framework Set | ENVO Biological |
| TAXO-0006 | Experiment Phase Code | PROMISE Metrics |
| TAXO-0007 | Metadata Schema Version | SAREK Pipeline |
| TAXO-0008 | Experiment Phase Code | OMOP CDM |

Phase and triggeredby together describe where a classified activity sits in its control lifecycle and what event admitted it into that state. A record carrying phase execution signals that automated or scheduled work is in flight—pipeline orchestration admitted on schedule, or sensor calibration underway—whereas phase review marks a gate at which human attestation or policy comparison is expected before promotion or closure. The triggeredby dimension makes that admission explicit: schedule denotes time-driven batch admission, manual denotes operator intent, and retry denotes re-entry after a prior attempt left residual risk or incomplete evidence. Observing CLAS-0001 in execution under schedule alongside CLAS-0004 in review under retry illustrates how the same classification family can occupy different control postures depending on initiation path, not merely on elapsed clock time.

Exitcode and status translate procedural outcomes into comparable signals for orchestrators, dashboards, and exception queues. Exit codes such as 493, 301, 581, and 197 function as typed termination semantics—distinct from HTTP or shell conventions yet equally binding within the governing framework—while status failed, pending, and complete expresses aggregate disposition independent of the numeric detail. A subclass row pairing OWASP Risk Rating with exit code 493 and status failed communicates that the compliance slice terminated in a governed fault state, whereas GDPR Data Category entries at 301 pending and 581 complete show how identical classification labels can diverge in closure posture across parallel assessment tracks. Operators therefore treat exitcode as the machine-readable fact of termination and status as the workflow-facing rollup suitable for SLA and backlog management.

**t_classification_subclass**

| id | classification | exit_code | status |
| --- | --- | --- | --- |
| CLAS-0001 | OWASP Risk Rating | 493 | failed |
| CLAS-0002 | GDPR Data Category | 301 | pending |
| CLAS-0003 | GDPR Data Category | 581 | complete |
| CLAS-0004 | CIS Benchmark | 197 | complete |
| CLAS-0005 | OWASP Risk Rating | 912 | complete |

Taxonomic placement extends classification beyond flat labels into structured ontologies and reference frameworks. When Lab Sample Category sits under EDAM Ontology, Anomaly Detection Model under DQO Framework, Experiment Phase Code under LOINC Code Set, and Telemetry Stream Type under SAREK Pipeline, each entity inherits interpretive context—what vocabulary applies, which validation rules bind, and which external corpora supply authoritative definitions. That under_taxonomy relationship is what permits a single governance program to host scientific, clinical, and infrastructure semantics without collapsing them into one undifferentiated namespace.

**t_classification_under_taxonomy_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| TAXO-0001 | duration_seconds | xsd:decimal |
| TAXO-0002 | end_time | xsd:dateTime |
| TAXO-0003 | exit_code | xsd:integer |
| TAXO-0004 | host_name | xsd:string |
| TAXO-0005 | log_level | xsd:string |
| TAXO-0006 | phase | xsd:string |
| TAXO-0007 | retry_count | xsd:integer |
| TAXO-0008 | scheduled_at | xsd:dateTime |

Attr and attr_type specify the observable properties that may be asserted about taxonomic entities and constrain how those properties may legally be recorded. Declaring duration_seconds as xsd:decimal, end_time as xsd:dateTime, exit_code as xsd:integer, and host_name as xsd:string establishes a contract: orchestration may persist 4845.29 or 852.80 as durations, ISO-8601 instants such as 2024-03-16T10:40:44 as temporal bounds, integers 123 or 682 where cardinality matters, and lexical tokens worker-07 or initiation where enumeration or host identity is required. Attr_type enforcement prevents silent coercion—dates mistaken for strings, exit codes rounded into floats—that would otherwise corrupt analytics and invalidate compliance attestations.

Entity and misc complete the pattern by binding concrete observations to the schema. The entity reference selects which taxonomic object carries the assertion—TAXO-0001 accumulating multiple attrs across datetime, decimal, integer, and varchar stores, TAXO-0002 receiving complementary measures—while misc holds the literal value materialized in the type-appropriate store. Thus host_name resolves to worker-07, duration_seconds to 5805.70, and status-adjacent vocabulary to superseded or Log Level 02, each fact keyed by entity and attr so that lineage queries can reconstruct a defensible snapshot of what was known at review time. In practice, practitioners reason from identifier through phase and triggeredby to outcome signals, then drill into taxonomy-qualified entities whose attrs—typed and valued—supply the evidential substrate audits demand.

**t_classification_under_taxonomy_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TAXO-0001 | TAXO-0001 | TAXO-0002 | 2024-03-16T10:40:44 |
| TAXO-0002 | TAXO-0001 | TAXO-0008 | 2023-03-15T13:57:05 |
| TAXO-0003 | TAXO-0001 | TAXO-0009 | 2024-10-13T12:06:31 |
| TAXO-0004 | TAXO-0002 | TAXO-0002 | 2023-01-11T10:30:50 |
| TAXO-0005 | TAXO-0002 | TAXO-0008 | 2025-05-19T08:08:31 |
| TAXO-0006 | TAXO-0002 | TAXO-0009 | 2025-04-05T18:33:08 |
| TAXO-0007 | TAXO-0003 | TAXO-0002 | 2024-01-05T08:57:44 |
| TAXO-0008 | TAXO-0003 | TAXO-0008 | 2024-10-15T05:44:13 |

**t_classification_under_taxonomy_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TAXO-0001 | TAXO-0001 | TAXO-0001 | 4845.29 |
| TAXO-0002 | TAXO-0002 | TAXO-0001 | 4012.23 |
| TAXO-0003 | TAXO-0003 | TAXO-0001 | 5805.70 |
| TAXO-0004 | TAXO-0004 | TAXO-0001 | 852.80 |
| TAXO-0005 | TAXO-0005 | TAXO-0001 | 5949.40 |
| TAXO-0006 | TAXO-0006 | TAXO-0001 | 1054.63 |
| TAXO-0007 | TAXO-0007 | TAXO-0001 | 5765.70 |
| TAXO-0008 | TAXO-0008 | TAXO-0001 | 2142.87 |

**t_classification_under_taxonomy_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TAXO-0001 | TAXO-0001 | TAXO-0003 | 123 |
| TAXO-0002 | TAXO-0001 | TAXO-0007 | 306 |
| TAXO-0003 | TAXO-0002 | TAXO-0003 | 682 |
| TAXO-0004 | TAXO-0002 | TAXO-0007 | 349 |
| TAXO-0005 | TAXO-0003 | TAXO-0003 | 409 |
| TAXO-0006 | TAXO-0003 | TAXO-0007 | 189 |
| TAXO-0007 | TAXO-0004 | TAXO-0003 | 329 |
| TAXO-0008 | TAXO-0004 | TAXO-0007 | 345 |

**t_classification_under_taxonomy_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TAXO-0001 | TAXO-0001 | TAXO-0004 | worker-07 |
| TAXO-0002 | TAXO-0001 | TAXO-0005 | Log Level 02 |
| TAXO-0003 | TAXO-0001 | TAXO-0006 | initiation |
| TAXO-0004 | TAXO-0001 | TAXO-0010 | superseded |
| TAXO-0005 | TAXO-0001 | TAXO-0011 | Triggered By 05 |
| TAXO-0006 | TAXO-0002 | TAXO-0004 | ingest-21 |
| TAXO-0007 | TAXO-0002 | TAXO-0005 | Log Level 07 |
| TAXO-0008 | TAXO-0002 | TAXO-0006 | review |