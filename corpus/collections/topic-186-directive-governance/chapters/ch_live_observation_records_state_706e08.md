---
chapter_id: ch_live_observation_records_state_706e08
topic_id: 186
family: 02_observation_measurement
cited_terms: ['observation_records_state', 'existential_with_has_part', 'schemaorg_creativework_author']
model: engine-refine
---

Attributes, attribute types, entities, identifiers, and the miscellaneous value layer form the spine of a typed knowledge graph used to record operational observations, document provenance, and assert structural composition. An identifier is not merely a surrogate key in a relational sense; it is the durable handle by which governance systems correlate an event, an artifact, and a subsystem across time, audits, and downstream analytics. When a network latency spike is logged under STAT-0001 and linked to creative-work record AUTH-0001, that pairing depends on identifiers remaining stable and unambiguous: STAT-0001 always denotes the same observation episode, AUTH-0001 always denotes the same authoritative document, and neither identifier may be reassigned or conflated with a peer. The same discipline applies at finer granularity—attribute definitions carry their own identifiers (STAT-0002 for end_time, AUTH-0002 for created_date)—so that value rows, validation rules, and retention policies can reference a precise semantic slot rather than a loosely named column. In existential composition, PART-0001 identifies BatchIngestionPipeline as a whole while naming FirewallRule as a constituent part; the identifier thus anchors both identity and membership in a partonomy that compliance reviewers use to trace which control surfaces belong to which operational envelope.

**t_existential_with_has_part**

| id | existential | has_part |
| --- | --- | --- |
| PART-0001 | BatchIngestionPipeline | FirewallRule |
| PART-0002 | GlobalMetadataCatalog | StorageVolume |
| PART-0003 | AuditLogArchive | WorkerProcess |
| PART-0004 | CoreControlSubsystem | TemperatureProbe |
| PART-0005 | ComputeNodePool | BackupSnapshot |
| PART-0006 | GlobalMetadataCatalog | ChecksumAlgorithm |

**t_schemaorg_creativework_author_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| AUTH-0001 | checksum | xsd:string |
| AUTH-0002 | created_date | xsd:date |
| AUTH-0003 | identifier | cco:DesignativeICE |
| AUTH-0004 | license | xsd:string |
| AUTH-0005 | mime_type | xsd:string |
| AUTH-0006 | size_bytes | xsd:long |
| AUTH-0007 | uri | xsd:string |
| AUTH-0008 | version | xsd:integer |

**t_schemaorg_creativework_author_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AUTH-0001 | AUTH-0001 | AUTH-0002 | 2023-12-01 |
| AUTH-0002 | AUTH-0002 | AUTH-0002 | 2024-12-04 |
| AUTH-0003 | AUTH-0003 | AUTH-0002 | 2023-05-29 |
| AUTH-0004 | AUTH-0004 | AUTH-0002 | 2023-07-08 |
| AUTH-0005 | AUTH-0005 | AUTH-0002 | 2025-04-18 |
| AUTH-0006 | AUTH-0006 | AUTH-0002 | 2023-08-09 |
| AUTH-0007 | AUTH-0007 | AUTH-0002 | 2024-11-19 |
| AUTH-0008 | AUTH-0008 | AUTH-0002 | 2024-04-19 |

**t_schemaorg_creativework_author_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AUTH-0001 | AUTH-0001 | AUTH-0006 | 363 |
| AUTH-0002 | AUTH-0001 | AUTH-0008 | 12 |
| AUTH-0003 | AUTH-0002 | AUTH-0006 | 393 |
| AUTH-0004 | AUTH-0002 | AUTH-0008 | 3 |
| AUTH-0005 | AUTH-0003 | AUTH-0006 | 58 |
| AUTH-0006 | AUTH-0003 | AUTH-0008 | 9 |
| AUTH-0007 | AUTH-0004 | AUTH-0006 | 306 |
| AUTH-0008 | AUTH-0004 | AUTH-0008 | 8 |

An entity is the thing about which the system holds structured assertions: an observation record, a Schema.org CreativeWork and its authorship lineage, or a composite subsystem decomposed into parts. Entities are intentionally typed by domain—observation episodes versus documentary artifacts versus infrastructural assemblies—because governance obligations differ. An observation entity such as STAT-0003 (a reactor pressure threshold event) must support time-bounded forensic reconstruction; a creative-work entity such as AUTH-0003 (an API Reference Guide) must support bibliographic integrity, licensing, and checksum verification; an existential entity such as CoreControlSubsystem must support architectural accountability for embedded components like TemperatureProbe. The entity identifier appearing in value tables (entity_id) is the foreign anchor that binds a misc value back to exactly one such subject. Multiple value rows may share an entity_id—STAT-0001 carries both a decimal duration and a varchar host_name—reflecting the ordinary reality that any governed object is described by a bundle of coexisting properties rather than a single scalar fact.

**t_schemaorg_creativework_author**

| id | schemaorg | author |
| --- | --- | --- |
| AUTH-0001 | API_Reference_Guide | STAT-0006 |
| AUTH-0002 | Provenance_Trace_Report | STAT-0005 |
| AUTH-0003 | API_Reference_Guide | STAT-0006 |
| AUTH-0004 | Provenance_Trace_Report | STAT-0004 |
| AUTH-0005 | Sensor_Network_Spec | STAT-0006 |
| AUTH-0006 | Catalog_Metadata_Index | STAT-0005 |
| AUTH-0007 | Telemetry_Config_Spec | STAT-0003 |
| AUTH-0008 | Catalog_Metadata_Index | STAT-0005 |

**t_schemaorg_creativework_author_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AUTH-0001 | AUTH-0001 | AUTH-0001 | 7b14de08 |
| AUTH-0002 | AUTH-0001 | AUTH-0003 | gid://svc/77 |
| AUTH-0003 | AUTH-0001 | AUTH-0004 | GPL-3.0 |
| AUTH-0004 | AUTH-0001 | AUTH-0009 | on-prem-dc1 |
| AUTH-0005 | AUTH-0001 | AUTH-0005 | text/plain |
| AUTH-0006 | AUTH-0001 | AUTH-0010 | Name 06 |
| AUTH-0007 | AUTH-0001 | AUTH-0011 | ml-infra |
| AUTH-0008 | AUTH-0001 | AUTH-0012 | Tags 08 |

An attribute (attr) names what is being asserted about an entity: duration_seconds, exit_code, host_name, checksum, license, and comparable slots. Attributes are defined independently of their current values so that schema evolution, mandatory-field policies, and cross-entity reporting can proceed without rewriting historical records. The attr_name is the human-legible contract—“end_time” signals an interval boundary, “identifier” signals a designative reference under a controlled vocabulary, “has_part” signals mereological structure—while the attr_id ties that contract to a specific registration row. Because the same attr_name may appear in different entity registries with different governance implications, identifiers disambiguate: STAT-0004’s host_name and AUTH-0004’s license are homonymous labels attached to distinct attribute registrations, each with its own attr_type and compliance treatment. Attribute catalogs therefore function as controlled dictionaries: they declare which facets of reality the organization agrees to measure, document, or assert, and they give auditors a checklist against which completeness can be judged.

Attribute type (attr_type) governs interpretability, storage routing, and interchange. Declaring xsd:decimal for duration_seconds routes measurements such as 4243.13 and 5274.11 into a decimal value store where aggregation, threshold comparison, and unit normalization are well defined; declaring xsd:dateTime for end_time ensures values like 2023-08-02T17:44:58 participate in temporal ordering and retention schedules; xsd:integer constrains exit_code to discrete outcomes (958 versus 41) suitable for enumerated error taxonomies; xsd:string and xsd:date accommodate lexical artifacts (worker-07, GPL-3.0) and calendar dates (2023-12-01) respectively. Domain-specific types extend the baseline: cco:DesignativeICE on the identifier attribute signals that certain string values are not free text but designative identifiers within an information content entity framework, affecting how deduplication and citation chains are validated. Type discipline is a compliance mechanism: it prevents silent coercion (treating a timestamp as a label), enables schema-aware export to standards consumers, and partitions value tables so that constraints—precision, timezone semantics, charset, cardinality—can be enforced per type without compromising neighboring properties.

The miscellaneous value layer—misc—is where assertions become inspectable evidence. Each value row is a triple in practice: entity_id selects the subject, attr_id selects the predicate slot, and value carries the literal payload stored in the table appropriate to attr_type. Thus STAT-0002’s water-quality anomaly may simultaneously possess an end_time of 2024-01-02T12:08:53, an exit_code of 517, and contextual varchar annotations such as Log Level 02, each stored separately yet rejoinable through shared entity and attribute keys. Creative-work governance exhibits the same pattern at AUTH-0001: created_date 2023-12-01, checksum 7b14de08, license GPL-3.0, and deployment identifier on-prem-dc1 form a documentary fingerprint that can be verified against the observation records (AUTH-0001, AUTH-0005) cited by state rows. When attr_id references do not align with the attr registry visible in a single catalog slice—value rows pointing at STAT-0007, STAT-0008, STAT-0009, or AUTH-0006 through AUTH-0009—the discrepancy itself becomes an operational signal: either the attribute registry is partitioned across extensions, or referential integrity checks must run before attestations are accepted. Misc values are therefore the evidentiary substrate; identifiers and types are the notary marks that make those values admissible in trace reports, threshold investigations, and provenance audits.

**t_observation_records_state**

| id | observation | records |
| --- | --- | --- |
| STAT-0001 | Network latency spike | AUTH-0001 |
| STAT-0002 | Water quality anomaly | AUTH-0005 |
| STAT-0003 | Reactor pressure threshold | AUTH-0001 |
| STAT-0004 | Reactor pressure threshold | AUTH-0005 |
| STAT-0005 | Network latency spike | AUTH-0008 |
| STAT-0006 | pH deviation alert | AUTH-0001 |

**t_observation_records_state_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| STAT-0001 | duration_seconds | xsd:decimal |
| STAT-0002 | end_time | xsd:dateTime |
| STAT-0003 | exit_code | xsd:integer |
| STAT-0004 | host_name | xsd:string |
| STAT-0005 | log_level | xsd:string |
| STAT-0006 | phase | xsd:string |
| STAT-0007 | retry_count | xsd:integer |
| STAT-0008 | scheduled_at | xsd:dateTime |

**t_observation_records_state_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| STAT-0001 | STAT-0001 | STAT-0002 | 2023-08-02T17:44:58 |
| STAT-0002 | STAT-0001 | STAT-0008 | 2025-03-10T03:55:42 |
| STAT-0003 | STAT-0001 | STAT-0009 | 2024-08-16T12:27:34 |
| STAT-0004 | STAT-0002 | STAT-0002 | 2024-01-02T12:08:53 |
| STAT-0005 | STAT-0002 | STAT-0008 | 2024-04-22T02:15:44 |
| STAT-0006 | STAT-0002 | STAT-0009 | 2025-02-09T01:29:13 |
| STAT-0007 | STAT-0003 | STAT-0002 | 2023-02-01T11:57:40 |
| STAT-0008 | STAT-0003 | STAT-0008 | 2023-09-23T07:16:43 |

**t_observation_records_state_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| STAT-0001 | STAT-0001 | STAT-0001 | 4243.13 |
| STAT-0002 | STAT-0002 | STAT-0001 | 4365.77 |
| STAT-0003 | STAT-0003 | STAT-0001 | 5274.11 |
| STAT-0004 | STAT-0004 | STAT-0001 | 1567.00 |
| STAT-0005 | STAT-0005 | STAT-0001 | 420.59 |
| STAT-0006 | STAT-0006 | STAT-0001 | 6894.95 |

**t_observation_records_state_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| STAT-0001 | STAT-0001 | STAT-0003 | 958 |
| STAT-0002 | STAT-0001 | STAT-0007 | 456 |
| STAT-0003 | STAT-0002 | STAT-0003 | 517 |
| STAT-0004 | STAT-0002 | STAT-0007 | 41 |
| STAT-0005 | STAT-0003 | STAT-0003 | 930 |
| STAT-0006 | STAT-0003 | STAT-0007 | 257 |
| STAT-0007 | STAT-0004 | STAT-0003 | 71 |
| STAT-0008 | STAT-0004 | STAT-0007 | 485 |

**t_observation_records_state_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| STAT-0001 | STAT-0001 | STAT-0004 | worker-07 |
| STAT-0002 | STAT-0001 | STAT-0005 | Log Level 02 |
| STAT-0003 | STAT-0001 | STAT-0006 | execution |
| STAT-0004 | STAT-0001 | STAT-0010 | pending |
| STAT-0005 | STAT-0001 | STAT-0011 | Triggered By 05 |
| STAT-0006 | STAT-0002 | STAT-0004 | node-a01 |
| STAT-0007 | STAT-0002 | STAT-0005 | Log Level 07 |
| STAT-0008 | STAT-0002 | STAT-0006 | closeout |

Taken together, the five constructs implement a separation of concerns that operational and compliance programs rely on daily. Identifiers stabilize reference; entities delimit accountability scope; attrs declare what may be said; attr_types determine how it may be said and stored; misc holds what was actually said at a point in time. A reactor pressure threshold duplicated across STAT-0003 and STAT-0004 with distinct duration measurements (5274.11 versus 1567.00) but shared documentary linkage to AUTH-0005 illustrates why this layering matters: investigators can distinguish recurring conditions from unique episodes, compare magnitudes with type-safe arithmetic, and open the authoritative Provenance_Trace_Report (AUTH-0002, AUTH-0004) attributed to STAT-0005 and STAT-0004 without collapsing distinct events into one narrative. Subsystem partonomies (GlobalMetadataCatalog composed of StorageVolume, AuditLogArchive of WorkerProcess) further show that the same identifier–entity–attr–type–value machinery scales from telemetry facts to architectural claims. Mature governance treats the attribute catalog as versioned policy, attr_type as enforceable contract, and misc values as immutable or append-only attestations wherever regulatory defensibility is required—so that when an auditor asks not merely what happened but whether the record could have meant something else, the system answers with typed, keyed, entity-bound evidence rather than undifferentiated text.