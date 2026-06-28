---
chapter_id: ch_live_ebpf_event_writes_to_map_5b53b7
topic_id: 65
family: 02_observation_measurement
cited_terms: ['ebpf_event_writes_to_map', 'kernelhook_for_subsystem', 'profile_has_distribution']
model: engine-refine
---

Kernel observability and schema governance converge on a small set of cross-cutting metadata primitives whose stability determines whether audit trails remain interpretable across releases. The identifier anchors that interpretability: every measurable event, dimensional classification, and profile-bound attribute value resolves through a durable surrogate key that survives relabeling and subsystem churn. Map-write operations keyed as MAP-0001 through MAP-0004 therefore remain joinable to their semantic envelopes even when operational labels change, while kernel-hook records keyed SUBS-0001 through SUBS-0004 preserve lineage when hooks are redeployed against different subsystems. In the profile–distribution plane, identifiers such as DIST-0001 and DIST-0002 tie a named governance profile to a concrete distribution channel without collapsing the profile’s logical identity into the channel’s physical encoding.

**t_profile_has_distribution**

| id | profile | distribution |
| --- | --- | --- |
| DIST-0001 | Schema Evolution Registry | Kafka Topic Stream |
| DIST-0002 | Anomaly Detection Ruleset | JSON Schema Registry |
| DIST-0003 | Schema Validation Profile | XML Metadata Archive |
| DIST-0004 | Schema Evolution Registry | Parquet Dataset |
| DIST-0005 | Data Contract Specification | JSON Schema Registry |
| DIST-0006 | Lineage Tracking Map | Parquet Dataset |

Category and its companion descriptive misc fields supply the controlled vocabulary and human-readable surface on which compliance review depends. A writes-to-map dimension classified under Writes To Map Category 01 and exposed as Writes To Map Label 01 gives reviewers a stable taxonomic slot independent of the raw map key referenced by the fact grain; the same pattern holds for kernel subsystems, where For Kernel Subsystem Category 03 and For Kernel Subsystem Label 03 contextualize hook placement without encoding placement in the hook’s binary footprint. Misc values in the attribute-value layer carry the instantiated semantics those types permit: varchar misc holds lexical tokens such as Dimension Kind 01 and Encoding 02, decimal misc stores magnitudes including 0.522 and 0.997, and datetime misc records provenance instants like 2024-02-01T19:38:09 and 2025-05-10T14:15:47. Together, category frames what something is for policy purposes, while misc holds what was actually observed or declared at execution time.

**dim_writes_to_map**

| id | writes_to_map_label | writes_to_map_category |
| --- | --- | --- |
| MAP-0001 | Writes To Map Label 01 | Writes To Map Category 01 |
| MAP-0002 | Writes To Map Label 02 | Writes To Map Category 02 |
| MAP-0003 | Writes To Map Label 03 | Writes To Map Category 03 |
| MAP-0004 | Writes To Map Label 04 | Writes To Map Category 04 |
| MAP-0005 | Writes To Map Label 05 | Writes To Map Category 05 |
| MAP-0006 | Writes To Map Label 06 | Writes To Map Category 06 |
| MAP-0007 | Writes To Map Label 07 | Writes To Map Category 07 |

Attr and attr_type constitute the contract layer that keeps heterogeneous distributions legally comparable under a single profile. Attributes named confidence, dimension_kind, method, and recorded_at are not interchangeable columns; each is typed—xsd:decimal, xsd:string, xsd:string, and xsd:dateTime respectively—so validators can reject structurally valid but semantically illegal payloads before they enter downstream archives. That typing discipline explains why values partition across entity–attr bindings rather than a single wide table: entity DIST-0001 may carry decimal confidence 0.522 and varchar dimension_kind Dimension Kind 01 under distinct attr identifiers, while entity DIST-0004’s recorded_at value 2025-03-10T08:03:10 lands in the datetime store because only the declared attr_type authorizes temporal comparison and retention scheduling. Entity, in this EAV pattern, is the governed object whose attribute set is evaluated as a whole; attr is the named facet; attr_type is the enforcement rule; misc is the evaluated literal.

**t_profile_has_distribution_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| DIST-0001 | confidence | xsd:decimal |
| DIST-0002 | dimension_kind | xsd:string |
| DIST-0003 | method | xsd:string |
| DIST-0004 | recorded_at | xsd:dateTime |
| DIST-0005 | uncertainty | xsd:decimal |
| DIST-0006 | unit | xsd:string |
| DIST-0007 | value | xsd:decimal |
| DIST-0008 | encoding | xsd:string |

**t_profile_has_distribution_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DIST-0001 | DIST-0001 | DIST-0004 | 2024-02-01T19:38:09 |
| DIST-0002 | DIST-0002 | DIST-0004 | 2025-05-10T14:15:47 |
| DIST-0003 | DIST-0003 | DIST-0004 | 2024-06-29T13:14:55 |
| DIST-0004 | DIST-0004 | DIST-0004 | 2025-03-10T08:03:10 |
| DIST-0005 | DIST-0005 | DIST-0004 | 2025-05-31T19:13:55 |
| DIST-0006 | DIST-0006 | DIST-0004 | 2024-10-12T04:18:41 |

**t_profile_has_distribution_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DIST-0001 | DIST-0001 | DIST-0001 | 0.522 |
| DIST-0002 | DIST-0001 | DIST-0005 | 445.38 |
| DIST-0003 | DIST-0001 | DIST-0007 | 68.45 |
| DIST-0004 | DIST-0002 | DIST-0001 | 0.997 |
| DIST-0005 | DIST-0002 | DIST-0005 | 691.41 |
| DIST-0006 | DIST-0002 | DIST-0007 | 957.20 |
| DIST-0007 | DIST-0003 | DIST-0001 | 0.423 |
| DIST-0008 | DIST-0003 | DIST-0005 | 321.82 |

**t_profile_has_distribution_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DIST-0001 | DIST-0001 | DIST-0002 | Dimension Kind 01 |
| DIST-0002 | DIST-0001 | DIST-0008 | Encoding 02 |
| DIST-0003 | DIST-0001 | DIST-0009 | nightly summary |
| DIST-0004 | DIST-0001 | DIST-0010 | de |
| DIST-0005 | DIST-0001 | DIST-0003 | automated |
| DIST-0006 | DIST-0001 | DIST-0006 | kg |
| DIST-0007 | DIST-0002 | DIST-0002 | Dimension Kind 07 |
| DIST-0008 | DIST-0002 | DIST-0008 | Encoding 08 |

Operational telemetry for kernel-adjacent instrumentation introduces a parallel fact grain where duration_seconds, exit, retry_count, size_bytes, version, and for_kernel_subsystem describe execution outcomes rather than schema conformance. Duration_seconds quantifies how long map-write paths remained active—5223.15 s for MAP-0001 versus 4285.04 s for MAP-0004—surfacing tail latency and stuck-transaction risk that category labels alone cannot expose. Exit codes (224, 266, 948, 381) classify termination semantics for automation and incident response; paired with retry_count (439 retries on MAP-0001 against 25 on MAP-0002), they distinguish brittle hot paths from intermittently failing but eventually successful ones. On the hook side, size_bytes ranging from 272822846 to 560962979 signals deployable artifact weight and memory pressure, while version (3 versus 1 versus 10) marks compatibility boundaries; for_kernel_subsystem linkage—SUBS-0005 and SUBS-0007 among the referenced keys—places each hook in the subsystem taxonomy so capacity and change-management reviews can scope blast radius when a hook version advances.

Profile-to-distribution binding closes the loop between kernel-originated facts and enterprise data contracts. A Schema Evolution Registry profile associated with both Kafka Topic Stream and Parquet Dataset distributions implies the same evolutionary rules must govern stream ingress and columnar export, with attr-level typing ensuring confidence and recorded_at remain auditable regardless of serialization. An Anomaly Detection Ruleset bound to JSON Schema Registry distribution elevates method and dimension_kind from descriptive misc to enforceable rule metadata. Schema Validation Profile paired with XML Metadata Archive distribution shows how category-oriented validation policies attach to document-centric channels without diluting attr_type constraints. Governance therefore treats identifier as the spine, category and misc as the readable policy envelope, attr and attr_type as the machine-checkable obligations, entity as the unit of compliance assessment, and duration_seconds, exit, retry_count, size_bytes, version, and for_kernel_subsystem as the empirical evidence that declared policies and deployed kernel artifacts behave as intended under production load.

**fact_ebpf**

| id | writes_to_map_key | duration_seconds | exit_code | retry_count |
| --- | --- | --- | --- | --- |
| MAP-0001 | MAP-0002 | 5223.15 | 224 | 439 |
| MAP-0002 | MAP-0004 | 6511.30 | 266 | 25 |
| MAP-0003 | MAP-0001 | 6092.75 | 948 | 201 |
| MAP-0004 | MAP-0006 | 4285.04 | 381 | 33 |
| MAP-0005 | MAP-0001 | 4316.18 | 956 | 335 |

**fact_kernelhook**

| id | for_kernel_subsystem_key | size_bytes | version |
| --- | --- | --- | --- |
| SUBS-0001 | SUBS-0005 | 36342735 | 3 |
| SUBS-0002 | SUBS-0007 | 560962979 | 1 |
| SUBS-0003 | SUBS-0001 | 456299832 | 10 |
| SUBS-0004 | SUBS-0005 | 272822846 | 1 |

**dim_for_kernel_subsystem**

| id | for_kernel_subsystem_label | for_kernel_subsystem_category |
| --- | --- | --- |
| SUBS-0001 | For Kernel Subsystem Label 01 | For Kernel Subsystem Category 01 |
| SUBS-0002 | For Kernel Subsystem Label 02 | For Kernel Subsystem Category 02 |
| SUBS-0003 | For Kernel Subsystem Label 03 | For Kernel Subsystem Category 03 |
| SUBS-0004 | For Kernel Subsystem Label 04 | For Kernel Subsystem Category 04 |
| SUBS-0005 | For Kernel Subsystem Label 05 | For Kernel Subsystem Category 05 |
| SUBS-0006 | For Kernel Subsystem Label 06 | For Kernel Subsystem Category 06 |
| SUBS-0007 | For Kernel Subsystem Label 07 | For Kernel Subsystem Category 07 |