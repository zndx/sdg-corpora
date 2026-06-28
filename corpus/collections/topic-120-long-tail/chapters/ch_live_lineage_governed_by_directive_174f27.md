---
chapter_id: ch_live_lineage_governed_by_directive_174f27
topic_id: 120
family: 05_provo_lineage
cited_terms: ['lineage_governed_by_directive', 'lineage_observed_by_event', 'log_record_subclass']
model: engine-refine
---

In governed data-lineage systems, stable identifiers anchor every assertion about provenance, observation, and operational state. Directive records such as DIRE-0001 through DIRE-0004 name distinct lineage subjects—quality-control-assay, supply-chain-audit, Patient Cohort Dataset, ETL Pipeline Alpha—while event identifiers EVEN-0001 through EVEN-0004 mark discrete observations of those subjects, including financial-risk-model runs, data-lake-ingestion batches, lab-sample-tracking updates, and repeated quality-control-assay captures. The identifier is not merely a surrogate key; it is the durable handle by which auditors, stewards, and downstream consumers reconcile directives, events, attribute definitions, typed value stores, and fact tables without ambiguity. Entity references extend that discipline into the value layer: each stored datum binds to an entity_id that names the observation or record instance to which the datum applies, so that confidence scores, dimension labels, encoding notes, and timestamps remain attributable even when many values share a single event context.

**t_lineage_observed_by_event**

| id | lineage |
| --- | --- |
| EVEN-0001 | financial-risk-model |
| EVEN-0002 | data-lake-ingestion |
| EVEN-0003 | lab-sample-tracking |
| EVEN-0004 | quality-control-assay |
| EVEN-0005 | Patient Cohort Dataset |
| EVEN-0006 | data-lake-ingestion |

**t_lineage_observed_by_event_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| EVEN-0001 | confidence | xsd:decimal |
| EVEN-0002 | dimension_kind | xsd:string |
| EVEN-0003 | method | xsd:string |
| EVEN-0004 | recorded_at | xsd:dateTime |
| EVEN-0005 | uncertainty | xsd:decimal |
| EVEN-0006 | unit | xsd:string |
| EVEN-0007 | value | xsd:decimal |
| EVEN-0008 | encoding | xsd:string |

Attributes formalize what may be said about an entity, and attribute types prescribe how those statements may be encoded and validated. An attribute registry associates each event with named properties—confidence, dimension_kind, method, recorded_at—and declares their logical types as xsd:decimal, xsd:string, or xsd:dateTime, thereby enforcing a typed observation contract before any value is accepted. In practice, type governs routing: decimal measurements such as 0.142 and 0.607 attach to confidence attributes, varchar payloads such as Dimension Kind 01 and pre-release note attach to string-typed descriptors, and datetime instants including 2024-07-15T19:59:01 and 2023-03-31T12:19:15 attach exclusively to temporal attributes like recorded_at. This separation prevents category errors at ingestion—strings cannot silently masquerade as numerics, and timestamps cannot be stored without parseable ISO-8601 structure—while preserving a uniform attr_id linkage pattern across heterogeneous value relations.

The misc designation denotes the polymorphic payload column that holds the actual asserted value once entity and attribute keys are resolved. Because lineage observation spans multiple physical representations, misc appears in parallel typed stores rather than as a single undifferentiated heap: decimals, varchars, and datetimes each occupy purpose-built tables, yet all share the same conceptual role of carrying the evidence body referenced by identifier triples. Multiple rows may therefore reference the same entity_id and attr_id combination when an event accumulates several measurements or when repeated captures refine a single attribute over time; conversely, a single entity may fan out across distinct attr_id values, as when EVEN-0001 simultaneously carries a confidence decimal, a dimension_kind string, and ancillary varchar annotations including Encoding 02 and language code en. Misc thus functions as the value surface of the governance model, while identifier, entity, and attr constitute its structural skeleton.

**t_lineage_observed_by_event_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVEN-0001 | EVEN-0001 | EVEN-0004 | 2024-07-15T19:59:01 |
| EVEN-0002 | EVEN-0002 | EVEN-0004 | 2023-01-03T08:23:46 |
| EVEN-0003 | EVEN-0003 | EVEN-0004 | 2024-06-13T23:29:26 |
| EVEN-0004 | EVEN-0004 | EVEN-0004 | 2023-03-31T12:19:15 |
| EVEN-0005 | EVEN-0005 | EVEN-0004 | 2023-03-05T06:53:09 |
| EVEN-0006 | EVEN-0006 | EVEN-0004 | 2023-03-19T16:32:15 |

**t_lineage_observed_by_event_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVEN-0001 | EVEN-0001 | EVEN-0001 | 0.142 |
| EVEN-0002 | EVEN-0001 | EVEN-0005 | 754.57 |
| EVEN-0003 | EVEN-0001 | EVEN-0007 | 852.05 |
| EVEN-0004 | EVEN-0002 | EVEN-0001 | 0.607 |
| EVEN-0005 | EVEN-0002 | EVEN-0005 | 551.25 |
| EVEN-0006 | EVEN-0002 | EVEN-0007 | 531.16 |
| EVEN-0007 | EVEN-0003 | EVEN-0001 | 0.333 |
| EVEN-0008 | EVEN-0003 | EVEN-0005 | 159.50 |

**t_lineage_observed_by_event_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVEN-0001 | EVEN-0001 | EVEN-0002 | Dimension Kind 01 |
| EVEN-0002 | EVEN-0001 | EVEN-0008 | Encoding 02 |
| EVEN-0003 | EVEN-0001 | EVEN-0009 | pre-release note |
| EVEN-0004 | EVEN-0001 | EVEN-0010 | en |
| EVEN-0005 | EVEN-0001 | EVEN-0003 | manual |
| EVEN-0006 | EVEN-0001 | EVEN-0006 | ratio |
| EVEN-0007 | EVEN-0002 | EVEN-0002 | Dimension Kind 07 |
| EVEN-0008 | EVEN-0002 | EVEN-0008 | Encoding 08 |

Directive-level metadata extends lineage assertions beyond raw observation into jurisdictional and metrological context. Language codes ja, de, and en signal the linguistic locale under which a governed directive is authored or interpreted, a requirement that matters when assay protocols, audit rubrics, or cohort documentation must be displayed, searched, or legally cited in the tongue of the controlling authority. Unit declarations—ms, m/s, and count—attach to directives so that downstream analytics and compliance checks can normalize measurements and reject unit-incompatible aggregations before they corrupt dashboards or regulatory filings. Where EVEN-0004’s recorded_at values are stored as xsd:dateTime misc entries, directive-level units on sibling lineage subjects ensure that duration- or velocity-derived metrics drawn from the same governance family are not commingled without explicit dimensional conversion.

**t_lineage_governed_by_directive**

| id | lineage | unit | language |
| --- | --- | --- | --- |
| DIRE-0001 | quality-control-assay | ms | ja |
| DIRE-0002 | supply-chain-audit | m/s | de |
| DIRE-0003 | Patient Cohort Dataset | count | en |
| DIRE-0004 | ETL Pipeline Alpha | m/s | en |
| DIRE-0005 | Sensor Telemetry Stream | ratio | es |
| DIRE-0006 | genomics-variant-call | nm | de |
| DIRE-0007 | ETL Pipeline Alpha | kg | en |
| DIRE-0008 | financial-risk-model | nm | ja |

Operational logging introduces a parallel axis of control organized around log severity, category, version, and size_bytes. Severity is modeled as a conformed dimension whose identifiers RECO-0001 through RECO-0007 classify fact_log rows by discrete labels and higher-level categories, enabling policy engines to treat Log Severity Category 01 differently from Category 04 without re-parsing free text on every query. Each fact record—RECO-0001 through RECO-0004—carries a log_severity_key foreign to that dimension, a version integer documenting the schema or payload generation under which the log was materialized, and a size_bytes measure quantifying stored bulk in bytes, here ranging from roughly 304 million to 913 million. Version supports reproducible replay and drift detection: two records at version 7 may be compared under identical parsing rules, while a version-2 artifact signals an older retention or serialization contract. Size_bytes underwrites capacity planning, retention tiering, and anomaly detection, because sudden inflation in logged payload mass often precedes ingestion failure or unbounded diagnostic verbosity.

**fact_log**

| id | log_severity_key | size_bytes | version |
| --- | --- | --- | --- |
| RECO-0001 | RECO-0006 | 913386183 | 6 |
| RECO-0002 | RECO-0004 | 303816232 | 7 |
| RECO-0003 | RECO-0007 | 758542341 | 7 |
| RECO-0004 | RECO-0001 | 442933768 | 2 |

Taken together, identifier, entity, attr, attr_type, category, language, unit, log severity, misc, size_bytes, and version constitute the minimum vocabulary for evidence-grade lineage and operations governance. Identifiers and entities establish who and what is being described; attributes and types establish which properties are admissible and in what form; misc carries the substantiating values; language and unit situate directives for human and computational interpretation; and severity, category, version, and byte sizing close the loop on how operational records are classified, evolved, and measured at scale. A reviewer tracing quality-control-assay from directive DIRE-0001 through event EVEN-0004 can therefore follow the same conceptual chain—from typed attr declaration to misc value persistence to severity-weighted fact_log evidence—without conflating nomenclature, measurement dimension, or temporal provenance, which is precisely the interoperability outcome these fields are designed to secure.

**dim_log_severity**

| id | log_severity_label | log_severity_category |
| --- | --- | --- |
| RECO-0001 | Log Severity Label 01 | Log Severity Category 01 |
| RECO-0002 | Log Severity Label 02 | Log Severity Category 02 |
| RECO-0003 | Log Severity Label 03 | Log Severity Category 03 |
| RECO-0004 | Log Severity Label 04 | Log Severity Category 04 |
| RECO-0005 | Log Severity Label 05 | Log Severity Category 05 |
| RECO-0006 | Log Severity Label 06 | Log Severity Category 06 |
| RECO-0007 | Log Severity Label 07 | Log Severity Category 07 |