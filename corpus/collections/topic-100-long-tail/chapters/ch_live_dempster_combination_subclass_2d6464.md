---
chapter_id: ch_live_dempster_combination_subclass_2d6464
topic_id: 100
family: 07_long_tail
cited_terms: ['dempster_combination_subclass', 'evidence_independent_or_correlated', 'trace_in_service']
model: engine-refine
---

Dempster–Shafer evidence fusion operates through a structured registry of identifiers, attributes, and typed values that together preserve the provenance and semantics of every combination step. Each fusion event receives a unique identifier—COMB-0001 through COMB-0004 in the working set—and is catalogued in a fact table that records the confidence assigned to the combined result, the residual uncertainty, and the aggregate value produced by the operation. Confidence values span a wide dynamic range: one entry registers a confidence of 0.153 against an uncertainty of 9.49 and a resulting value of 520.46, while another achieves a confidence of 0.728 with uncertainty of 479.57 and value 846.10. The fact table also carries a foreign key pointing to the specific Dempster combination it derives from, enabling a chain of derivations to be traced backward through the fusion graph.

**t_trace_in_service**

| id | trace | in_service |
| --- | --- | --- |
| SERV-0001 | ci-cd-deploy-run | kafka-cluster-east |
| SERV-0002 | nightly-data-sync | consul-registry |
| SERV-0003 | microservice-call-path | elastic-search-idx |
| SERV-0004 | sensor-telemetry-batch | vault-secrets-mgr |
| SERV-0005 | nightly-data-sync | prometheus-scrape |
| SERV-0006 | microservice-call-path | jaeger-collector |

**t_trace_in_service_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| SERV-0001 | duration_seconds | xsd:decimal |
| SERV-0002 | end_time | xsd:dateTime |
| SERV-0003 | exit_code | xsd:integer |
| SERV-0004 | host_name | xsd:string |
| SERV-0005 | log_level | xsd:string |
| SERV-0006 | phase | xsd:string |
| SERV-0007 | retry_count | xsd:integer |
| SERV-0008 | scheduled_at | xsd:dateTime |

The dimension table for Dempster combinations supplies human-readable labels and categorical classifications that anchor each fusion event to an operational context. Labels such as Combines Via Dempster Label 01 through 04 pair with categories like Combines Via Dempster Category 01 through 04, providing a stable lookup layer that decouples presentation semantics from the numeric identifiers used in the fact table. This separation allows downstream consumers to filter, group, or annotate fusion results by category without hard-coding identifier values, and it supports the addition of new categories without schema migration.

**dim_combines_via_dempster**

| id | combines_via_dempster_label | combines_via_dempster_category |
| --- | --- | --- |
| COMB-0001 | Combines Via Dempster Label 01 | Combines Via Dempster Category 01 |
| COMB-0002 | Combines Via Dempster Label 02 | Combines Via Dempster Category 02 |
| COMB-0003 | Combines Via Dempster Label 03 | Combines Via Dempster Category 03 |
| COMB-0004 | Combines Via Dempster Label 04 | Combines Via Dempster Category 04 |
| COMB-0005 | Combines Via Dempster Label 05 | Combines Via Dempster Category 05 |
| COMB-0006 | Combines Via Dempster Label 06 | Combines Via Dempster Category 06 |
| COMB-0007 | Combines Via Dempster Label 07 | Combines Via Dempster Category 07 |

Evidence records—whether independent or correlated—are modelled as entities whose attributes are defined separately from their values, following a star-schema pattern that accommodates heterogeneous data types. The attribute definition table assigns a name and an XML Schema type to each property: confidence is typed as xsd:decimal, dimension_kind as xsd:string, method as xsd:string, and recorded_at as xsd:dateTime. Values are then stored in dedicated type-specific tables keyed by entity identifier and attribute identifier, ensuring that decimal values such as 0.175, 667.59, 420.06, and 0.415 are stored in the decimal value table, string values like Dimension Kind 01, Encoding 02, intake form, and en in the varchar table, and timestamped values such as 2024-06-09T05:47:42 and 2023-11-11T17:14:05 in the datetime table. This type-disaggregated design prevents null proliferation and preserves type safety across a schema that must support dozens of optional attributes per entity.

**t_evidence_independent_or_correlated**

| id | evidence | evidence_2 | evidence_3 |
| --- | --- | --- | --- |
| CORR-0001 | Provenance-Chain-Hash | Metrics-Pool-Index | Provenance-Node-Hash |
| CORR-0002 | Metrics-Cache-Ref | Provenance-Chain-Hash | Telemetry-Stream-Alpha |
| CORR-0003 | Provenance-Leaf-Node | Telemetry-Stream-Alpha | Telemetry-Stream-Alpha |
| CORR-0004 | Independent-Array-Trace | Quarterly-Audit-Trail | Governance-Verification-File |
| CORR-0005 | Independent-Sensor-Trace | Observation-Grid-Fourteen | Governance-Compliance-Report |
| CORR-0006 | Quarterly-Audit-Trail | Metrics-Bucket-Index | Correlation-Stream-Gamma |

**t_evidence_independent_or_correlated_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| CORR-0001 | confidence | xsd:decimal |
| CORR-0002 | dimension_kind | xsd:string |
| CORR-0003 | method | xsd:string |
| CORR-0004 | recorded_at | xsd:dateTime |
| CORR-0005 | uncertainty | xsd:decimal |
| CORR-0006 | unit | xsd:string |
| CORR-0007 | value | xsd:decimal |
| CORR-0008 | encoding | xsd:string |

**t_evidence_independent_or_correlated_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CORR-0001 | CORR-0001 | CORR-0004 | 2024-06-09T05:47:42 |
| CORR-0002 | CORR-0002 | CORR-0004 | 2023-11-11T17:14:05 |
| CORR-0003 | CORR-0003 | CORR-0004 | 2023-01-17T16:04:18 |
| CORR-0004 | CORR-0004 | CORR-0004 | 2024-01-18T01:21:21 |
| CORR-0005 | CORR-0005 | CORR-0004 | 2025-02-19T18:21:28 |
| CORR-0006 | CORR-0006 | CORR-0004 | 2023-04-21T22:33:15 |

**t_evidence_independent_or_correlated_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CORR-0001 | CORR-0001 | CORR-0001 | 0.175 |
| CORR-0002 | CORR-0001 | CORR-0005 | 667.59 |
| CORR-0003 | CORR-0001 | CORR-0007 | 420.06 |
| CORR-0004 | CORR-0002 | CORR-0001 | 0.415 |
| CORR-0005 | CORR-0002 | CORR-0005 | 386.38 |
| CORR-0006 | CORR-0002 | CORR-0007 | 519.11 |
| CORR-0007 | CORR-0003 | CORR-0001 | 0.685 |
| CORR-0008 | CORR-0003 | CORR-0005 | 275.29 |

**t_evidence_independent_or_correlated_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CORR-0001 | CORR-0001 | CORR-0002 | Dimension Kind 01 |
| CORR-0002 | CORR-0001 | CORR-0008 | Encoding 02 |
| CORR-0003 | CORR-0001 | CORR-0009 | intake form |
| CORR-0004 | CORR-0001 | CORR-0010 | en |
| CORR-0005 | CORR-0001 | CORR-0003 | hybrid |
| CORR-0006 | CORR-0001 | CORR-0006 | kg |
| CORR-0007 | CORR-0002 | CORR-0002 | Dimension Kind 07 |
| CORR-0008 | CORR-0002 | CORR-0008 | Encoding 08 |

The same attribute-value pattern applies to service-trace records, where each trace—ci-cd-deploy-run, nightly-data-sync, microservice-call-path, sensor-telemetry-batch—is linked to the service it runs in, whether kafka-cluster-east, consul-registry, elastic-search-idx, or vault-secrets-mgr. Trace attributes include duration_seconds (xsd:decimal), end_time (xsd:dateTime), exit_code (xsd:integer), and host_name (xsd:string), with values distributed across type-specific tables: durations of 4381.06, 2102.62, 5138.88, and 2082.99 seconds; exit codes of 744, 59, 247, and 232; host names such as node-b14; and log levels like Log Level 02. The separation of attribute definitions from value storage means that new trace properties can be added by inserting a row into the attribute table and populating the corresponding value table, without altering any existing table structure.

Across both evidence and trace domains, the entity identifier serves as the common join key that binds attribute definitions to their typed values, and the identifier also propagates into the Dempster fact table as the combines_via_dempster_key, linking each fusion result back to the evidence entities it synthesises. Confidence and uncertainty are themselves treated as attributes—typed as xsd:decimal and stored in the decimal value table—allowing them to be queried alongside other properties of an entity without requiring special-case columns. The misc column in the value tables holds the actual data, and its type is determined by the table in which the row resides, making the schema extensible to additional types such as boolean or binary without further modification. This architecture ensures that every piece of metadata—whether a provenance chain hash, a telemetry stream reference, a governance verification file, or a combination of all three—carries its type, its timestamp, and its confidence score in a uniformly queryable form.

**fact_dempster**

| id | combines_via_dempster_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| COMB-0001 | COMB-0004 | 0.153 | 9.49 | 520.46 |
| COMB-0002 | COMB-0006 | 0.014 | 392.06 | 137.18 |
| COMB-0003 | COMB-0003 | 0.025 | 687.80 | 197.61 |
| COMB-0004 | COMB-0004 | 0.728 | 479.57 | 846.10 |
| COMB-0005 | COMB-0005 | 0.918 | 172.36 | 296.96 |
| COMB-0006 | COMB-0001 | 0.755 | 608.06 | 341.51 |

**t_trace_in_service_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SERV-0001 | SERV-0001 | SERV-0002 | 2023-02-11T21:39:45 |
| SERV-0002 | SERV-0001 | SERV-0008 | 2025-04-17T05:33:23 |
| SERV-0003 | SERV-0001 | SERV-0009 | 2024-09-24T02:59:34 |
| SERV-0004 | SERV-0002 | SERV-0002 | 2023-11-01T18:02:16 |
| SERV-0005 | SERV-0002 | SERV-0008 | 2023-07-24T15:59:25 |
| SERV-0006 | SERV-0002 | SERV-0009 | 2023-09-19T06:42:34 |
| SERV-0007 | SERV-0003 | SERV-0002 | 2025-04-22T19:55:46 |
| SERV-0008 | SERV-0003 | SERV-0008 | 2024-12-15T02:05:50 |

**t_trace_in_service_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SERV-0001 | SERV-0001 | SERV-0001 | 4381.06 |
| SERV-0002 | SERV-0002 | SERV-0001 | 2102.62 |
| SERV-0003 | SERV-0003 | SERV-0001 | 5138.88 |
| SERV-0004 | SERV-0004 | SERV-0001 | 2082.99 |
| SERV-0005 | SERV-0005 | SERV-0001 | 6123.82 |
| SERV-0006 | SERV-0006 | SERV-0001 | 5465.25 |

**t_trace_in_service_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SERV-0001 | SERV-0001 | SERV-0003 | 744 |
| SERV-0002 | SERV-0001 | SERV-0007 | 59 |
| SERV-0003 | SERV-0002 | SERV-0003 | 247 |
| SERV-0004 | SERV-0002 | SERV-0007 | 232 |
| SERV-0005 | SERV-0003 | SERV-0003 | 916 |
| SERV-0006 | SERV-0003 | SERV-0007 | 56 |
| SERV-0007 | SERV-0004 | SERV-0003 | 376 |
| SERV-0008 | SERV-0004 | SERV-0007 | 417 |

**t_trace_in_service_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SERV-0001 | SERV-0001 | SERV-0004 | node-b14 |
| SERV-0002 | SERV-0001 | SERV-0005 | Log Level 02 |
| SERV-0003 | SERV-0001 | SERV-0006 | initiation |
| SERV-0004 | SERV-0001 | SERV-0010 | failed |
| SERV-0005 | SERV-0001 | SERV-0011 | Triggered By 05 |
| SERV-0006 | SERV-0002 | SERV-0004 | node-b14 |
| SERV-0007 | SERV-0002 | SERV-0005 | Log Level 07 |
| SERV-0008 | SERV-0002 | SERV-0006 | initiation |