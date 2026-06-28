---
chapter_id: ch_live_mass_function_only_assigns_subsets_0b33c9
topic_id: 14
family: 06_belief_structure
cited_terms: ['mass_function_only_assigns_subsets', 'ice_subclass_with_part', 'audit_with_findings']
model: engine-refine
---

In governed data environments, stable identifiers anchor every assertion that must survive reconciliation, audit, and downstream reuse. A subset record such as SUBS-0001 is not merely a row label; it is the durable key through which mass-function assignments, attribute declarations, and typed value assertions remain joinable across operational stores and compliance exports. The same identifier discipline extends to partition artefacts—PART-0001 through PART-0004—and to audit findings keyed as FIND-0001, so that a governance reviewer can trace how a telemetry-confidence subset maps to a calibration record without collapsing distinct roles into a single surrogate key. Where identifiers are reused consistently—as when every datetime value row references SUBS-0004 as attr_id for recorded_at—the model enforces referential integrity at the semantic layer rather than relying on ad hoc string matching in reports.

**t_mass_function_only_assigns_subsets**

| id | mass | assigns_mass_to |
| --- | --- | --- |
| SUBS-0001 | data_quality | PART-0001 |
| SUBS-0002 | edge_node | PART-0003 |
| SUBS-0003 | thermal_fusion | PART-0004 |
| SUBS-0004 | telemetry_confidence | PART-0003 |
| SUBS-0005 | signal_integrity | PART-0003 |
| SUBS-0006 | edge_node | PART-0006 |

**t_mass_function_only_assigns_subsets_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| SUBS-0001 | confidence | xsd:decimal |
| SUBS-0002 | dimension_kind | xsd:string |
| SUBS-0003 | method | xsd:string |
| SUBS-0004 | recorded_at | xsd:dateTime |
| SUBS-0005 | uncertainty | xsd:decimal |
| SUBS-0006 | unit | xsd:string |
| SUBS-0007 | value | xsd:decimal |
| SUBS-0008 | encoding | xsd:string |

Entity and attribute together express what is being described and under which named property the description holds. Entity_id binds a value to the subject of record: confidence readings attach to SUBS-0001, while a separate decimal assertion for SUBS-0002 carries 0.512 under the same confidence attribute family. Attribute names—confidence, dimension_kind, method, recorded_at—function as the controlled vocabulary of observable facts, and attr_type declares the interpretive contract each name carries. Declaring confidence as xsd:decimal and recorded_at as xsd:dateTime is not cosmetic typing; it routes persistence to the correct value store, activates schema validation, and prevents category errors such as treating a timestamp as a free-text label. Method and dimension_kind, both xsd:string, accept lexical values including nightly summary and de, yet remain distinguishable from numeric and temporal facts because their attr_type governs parsing, comparison, and display rules at ingestion and at audit.

The misc field, in practice, is the materialised assertion: the typed payload once entity, attr, and attr_type have fixed the slot into which it belongs. Decimal misc values—0.589, 503.17, 721.15—support quantitative controls on data quality and thermal-fusion workflows; datetime misc values—2024-10-19T15:01:03 through 2024-04-26T17:49:00—establish evidentiary timelines for when subsets were recorded or reconciled; varchar misc carries human-interpretable qualifiers such as Dimension Kind 01 and Encoding 02 that often encode business semantics not reducible to numbers alone. Partitioning values by type rather than coercing all misc into a single column preserves fidelity: a decimal confidence of 0.589 remains arithmetically comparable, while a recorded_at instant remains sortable and timezone-normalisable without string parsing heuristics. Operators and auditors therefore treat misc not as miscellaneous overflow but as the evidentiary cell whose meaning is fully determined by its entity–attribute–type context.

Encoding and labeltext govern how artefacts are represented and how operators recognise them in review workflows. Encoding declares the character repertoire and interchange rules under which serialized content is valid: ascii for a sensor_calibration_record and model_feature_catalog, unicode for observatory_metadata and event_stream_format. Mismatched encoding—writing unicode content against an ascii-declared partition—produces silent corruption or validation failures at export, which is why encoding sits alongside the ICE subclass rather than being inferred from filename or MIME guesswork. Labeltext supplies the human-facing descriptor—intake form, pre-release note, calibration record, nightly summary—that aligns technical partitions with procedure names auditors already use in control libraries. A label does not replace identifier or encoding; it orients reviewers toward intent, while identifier and encoding secure machine-verifiable identity and representation.

**t_ice_subclass_with_part**

| id | ice | encoding | label_text |
| --- | --- | --- | --- |
| PART-0001 | sensor_calibration_record | ascii | intake form |
| PART-0002 | observatory_metadata | unicode | pre-release note |
| PART-0003 | event_stream_format | unicode | calibration record |
| PART-0004 | model_feature_catalog | ascii | nightly summary |
| PART-0005 | compliance_audit_report | utf8 | pre-release note |
| PART-0006 | customer_transaction_log | latin1 | audit excerpt |

Durationseconds and hostname close the loop between governance activity and the infrastructure on which it was executed. Duration_seconds quantifies audit labour and automated scan elapsed time in seconds—5564.74 for a HIPAA Security Assessment, 7105.34 for a SOC 2 Type II Review—so capacity planning, SLA evidence, and repeatability analysis can compare engagements on a common scale rather than on narrative estimates. Host_name—worker-07, node-a01, node-b14, edge-03—attributes each run to a concrete execution surface, which matters when findings such as PART-0006 must be correlated with edge-node subsets, worker pools, or segmented network zones. Together, duration and hostname transform an audit from a abstract compliance title into an operational record: how long the control evidence was gathered, and where the gathering occurred, under frameworks spanning HIPAA, data-lake governance, SOC 2, and ISO 27001.

**t_audit_with_findings**

| id | audit | findings | duration_seconds | host_name |
| --- | --- | --- | --- | --- |
| FIND-0001 | HIPAA Security Assessment | PART-0006 | 5564.74 | worker-07 |
| FIND-0002 | Data Lake Governance Review | PART-0006 | 1140.43 | node-a01 |
| FIND-0003 | SOC 2 Type II Review | PART-0006 | 7105.34 | node-b14 |
| FIND-0004 | ISO 27001 Certification | PART-0006 | 2350.00 | edge-03 |
| FIND-0005 | Third-Party Vendor Review | PART-0002 | 2041.65 | worker-07 |
| FIND-0006 | Data Lake Governance Review | PART-0005 | 3303.91 | ingest-21 |
| FIND-0007 | ML Model Drift Audit | PART-0003 | 5489.56 | ingest-21 |

Taken across mass-function subset assignment, typed attribute registries, ICE-encoded partitions, and instrumented audit runs, these elements form a single evidentiary grammar. Identifiers stitch subgraphs; entity and attr name the subject and predicate; attr_type and specialised misc stores enforce interpretability; encoding and labeltext bridge machine interchange and human procedure; durationseconds and hostname bind governance outcomes to time and place. A reviewer who reads 0.589 confidence on SUBS-0001, unicode encoding on observatory_metadata labelled pre-release note, and a 1140.43-second Data Lake Governance Review on node-a01 is not parsing isolated fields but reconstructing a chain of custody from subset definition through partition representation to audited finding—exactly the reconstruction compliance handbooks require when evidence must stand outside the system that produced it.

**t_mass_function_only_assigns_subsets_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SUBS-0001 | SUBS-0001 | SUBS-0004 | 2024-10-19T15:01:03 |
| SUBS-0002 | SUBS-0002 | SUBS-0004 | 2023-10-05T14:35:44 |
| SUBS-0003 | SUBS-0003 | SUBS-0004 | 2024-02-24T01:03:34 |
| SUBS-0004 | SUBS-0004 | SUBS-0004 | 2024-04-26T17:49:00 |
| SUBS-0005 | SUBS-0005 | SUBS-0004 | 2024-01-29T11:02:31 |
| SUBS-0006 | SUBS-0006 | SUBS-0004 | 2023-11-16T17:14:50 |

**t_mass_function_only_assigns_subsets_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SUBS-0001 | SUBS-0001 | SUBS-0001 | 0.589 |
| SUBS-0002 | SUBS-0001 | SUBS-0005 | 503.17 |
| SUBS-0003 | SUBS-0001 | SUBS-0007 | 721.15 |
| SUBS-0004 | SUBS-0002 | SUBS-0001 | 0.512 |
| SUBS-0005 | SUBS-0002 | SUBS-0005 | 595.07 |
| SUBS-0006 | SUBS-0002 | SUBS-0007 | 721.26 |
| SUBS-0007 | SUBS-0003 | SUBS-0001 | 0.645 |
| SUBS-0008 | SUBS-0003 | SUBS-0005 | 722.55 |

**t_mass_function_only_assigns_subsets_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SUBS-0001 | SUBS-0001 | SUBS-0002 | Dimension Kind 01 |
| SUBS-0002 | SUBS-0001 | SUBS-0008 | Encoding 02 |
| SUBS-0003 | SUBS-0001 | SUBS-0009 | nightly summary |
| SUBS-0004 | SUBS-0001 | SUBS-0010 | de |
| SUBS-0005 | SUBS-0001 | SUBS-0003 | manual |
| SUBS-0006 | SUBS-0001 | SUBS-0006 | mg/L |
| SUBS-0007 | SUBS-0002 | SUBS-0002 | Dimension Kind 07 |
| SUBS-0008 | SUBS-0002 | SUBS-0008 | Encoding 08 |