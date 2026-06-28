---
chapter_id: ch_live_schemaorg_org_legalname_1947f4
topic_id: 104
family: 07_long_tail
cited_terms: ['schemaorg_org_legalname', 'descriptive_either_evidence_or_claim', 'column_added_at_version']
model: engine-refine
---

An identifier serves as the immutable primary key that anchors every record across the data model, providing a stable reference point regardless of how attribute values or organizational details evolve. Within the corporate registry, identifiers such as `LEGA-0001` through `LEGA-0004` distinguish legal entities whose commercial names—`NexusLabs`, `BioSynth`, `GlobalDataInc`, `AeroSpaceX`—may diverge from their registered legal names, which include `TerraForma Holdings Ltd.`, `CloudNative Solutions LLC`, `Global Data Systems LLC`, and `Acme Corporation`. Similarly, evidence and claim records carry identifiers like `CLAI-0001` through `CLAI-0004`, while schema versioning entries use `VERS-0001` through `VERS-0004`, each forming a distinct namespace for its respective domain. The identifier is the sole invariant; everything else—the descriptive content, the attribute values, the relationships—may change without affecting the entity's continuity.

**t_schemaorg_org_legalname**

| id | schemaorg |
| --- | --- |
| LEGA-0001 | NexusLabs |
| LEGA-0002 | BioSynth |
| LEGA-0003 | GlobalDataInc |
| LEGA-0004 | AeroSpaceX |
| LEGA-0005 | QuantumEdge |
| LEGA-0006 | AcmeCorp |
| LEGA-0007 | GlobalDataInc |

**t_schemaorg_org_legalname_legal_name**

| id | legal_name |
| --- | --- |
| LEGA-0001 | TerraForma Holdings Ltd. |
| LEGA-0002 | CloudNative Solutions LLC |
| LEGA-0003 | Global Data Systems LLC |
| LEGA-0004 | Acme Corporation |
| LEGA-0005 | CloudNative Solutions LLC |
| LEGA-0006 | DataBridge Analytics Corp. |
| LEGA-0007 | TerraForma Holdings Ltd. |
| LEGA-0008 | Nexus Laboratories Inc. |

**t_descriptive_either_evidence_or_claim**

| id | descriptive | descriptive_2 | descriptive_3 |
| --- | --- | --- | --- |
| CLAI-0001 | pipeline run log | checksum mismatch alert | validation rule set |
| CLAI-0002 | compliance audit trail | field condition note | validation rule set |
| CLAI-0003 | network latency trace | calibration certificate | chain of custody tag |
| CLAI-0004 | pipeline run log | data quality flag | sampling interval ms |
| CLAI-0005 | data ingestion manifest | retention policy label | retention expiry date |
| CLAI-0006 | compliance audit trail | data quality flag | hash algorithm ID |

**t_descriptive_either_evidence_or_claim_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| CLAI-0001 | confidence | xsd:decimal |
| CLAI-0002 | dimension_kind | xsd:string |
| CLAI-0003 | method | xsd:string |
| CLAI-0004 | recorded_at | xsd:dateTime |
| CLAI-0005 | uncertainty | xsd:decimal |
| CLAI-0006 | unit | xsd:string |
| CLAI-0007 | value | xsd:decimal |
| CLAI-0008 | encoding | xsd:string |

**t_descriptive_either_evidence_or_claim_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CLAI-0001 | CLAI-0001 | CLAI-0004 | 2023-12-14T23:50:57 |
| CLAI-0002 | CLAI-0002 | CLAI-0004 | 2024-02-16T02:04:00 |
| CLAI-0003 | CLAI-0003 | CLAI-0004 | 2024-04-20T14:09:40 |
| CLAI-0004 | CLAI-0004 | CLAI-0004 | 2025-04-28T22:05:41 |
| CLAI-0005 | CLAI-0005 | CLAI-0004 | 2023-01-08T15:26:20 |
| CLAI-0006 | CLAI-0006 | CLAI-0004 | 2023-08-14T20:31:38 |

**t_descriptive_either_evidence_or_claim_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CLAI-0001 | CLAI-0001 | CLAI-0001 | 0.015 |
| CLAI-0002 | CLAI-0001 | CLAI-0005 | 195.73 |
| CLAI-0003 | CLAI-0001 | CLAI-0007 | 92.51 |
| CLAI-0004 | CLAI-0002 | CLAI-0001 | 0.355 |
| CLAI-0005 | CLAI-0002 | CLAI-0005 | 482.72 |
| CLAI-0006 | CLAI-0002 | CLAI-0007 | 420.42 |
| CLAI-0007 | CLAI-0003 | CLAI-0001 | 0.827 |
| CLAI-0008 | CLAI-0003 | CLAI-0005 | 514.52 |

**t_descriptive_either_evidence_or_claim_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CLAI-0001 | CLAI-0001 | CLAI-0002 | Dimension Kind 01 |
| CLAI-0002 | CLAI-0001 | CLAI-0008 | Encoding 02 |
| CLAI-0003 | CLAI-0001 | CLAI-0009 | change rationale |
| CLAI-0004 | CLAI-0001 | CLAI-0010 | es |
| CLAI-0005 | CLAI-0001 | CLAI-0003 | manual |
| CLAI-0006 | CLAI-0001 | CLAI-0006 | deg_C |
| CLAI-0007 | CLAI-0002 | CLAI-0002 | Dimension Kind 07 |
| CLAI-0008 | CLAI-0002 | CLAI-0008 | Encoding 08 |

An attribute defines the semantic dimension along which an entity is described, and its type constrains the permissible values to a specific schema datatype. The attribute registry maps names such as `confidence`, `dimension_kind`, `method`, and `recorded_at` to their corresponding types—`xsd:decimal`, `xsd:string`, `xsd:string`, and `xsd:dateTime` respectively—ensuring that every value stored against an attribute conforms to its declared schema. This type discipline is not merely declarative; it governs how values are stored, compared, and queried across the heterogeneous value tables. A `confidence` attribute of type `xsd:decimal` will have its values materialized in the decimal value store, while a `recorded_at` attribute of type `xsd:dateTime` directs its values to the datetime store, and a `dimension_kind` attribute of type `xsd:string` routes its values to the varchar store. The attr-type pairing thus functions as a routing mechanism, partitioning value storage by datatype while preserving a unified attribute namespace.

An entity is the thing being described—the evidence record, the schema version, the legal entity—and it is the entity identifier that serves as the foreign key linking back to the value stores. Each value row carries an `entity_id` that references the entity it belongs to, an `attr_id` that references the attribute whose value it represents, and a `value` column holding the actual datum. For instance, the entity `CLAI-0001` has a confidence value of `0.015` and a recorded_at timestamp of `2023-12-14T23:50:57`, while entity `CLAI-0002` carries a confidence of `0.355` and a recorded_at of `2024-02-16T02:04:00`. The varchar value store similarly captures categorical metadata: entity `CLAI-0001` has a `dimension_kind` of `Dimension Kind 01`, an `encoding` of `Encoding 02`, a `change rationale`, and a language tag of `es`. This entity-attribute-value triad, materialized across three separate value tables, enables a flexible schema where entities can carry arbitrary attributes without requiring DDL changes.

**t_column_added_at_version**

| id | column | added_at_schema_version |
| --- | --- | --- |
| VERS-0001 | throughput_mbps | telemetry_v4.0 |
| VERS-0002 | geo_lat_dd | telemetry_v4.0 |
| VERS-0003 | batch_number | release_2023q4 |
| VERS-0004 | air_pressure_hpa | prod_v5.2 |
| VERS-0005 | sensor_id | staging_v1.1 |
| VERS-0006 | throughput_mbps | prod_v5.2 |

**t_column_added_at_version_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERS-0001 | VERS-0001 | VERS-0001 | 0.705 |
| VERS-0002 | VERS-0001 | VERS-0005 | 536.45 |
| VERS-0003 | VERS-0001 | VERS-0007 | 797.42 |
| VERS-0004 | VERS-0002 | VERS-0001 | 0.546 |
| VERS-0005 | VERS-0002 | VERS-0005 | 698.14 |
| VERS-0006 | VERS-0002 | VERS-0007 | 151.31 |
| VERS-0007 | VERS-0003 | VERS-0001 | 0.806 |
| VERS-0008 | VERS-0003 | VERS-0005 | 213.36 |

**t_column_added_at_version_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERS-0001 | VERS-0001 | VERS-0002 | Dimension Kind 01 |
| VERS-0002 | VERS-0001 | VERS-0008 | Encoding 02 |
| VERS-0003 | VERS-0001 | VERS-0009 | change rationale |
| VERS-0004 | VERS-0001 | VERS-0010 | de |
| VERS-0005 | VERS-0001 | VERS-0003 | manual |
| VERS-0006 | VERS-0001 | VERS-0006 | kg |
| VERS-0007 | VERS-0002 | VERS-0002 | Dimension Kind 07 |
| VERS-0008 | VERS-0002 | VERS-0008 | Encoding 08 |

The schema versioning domain mirrors this same entity-attribute-value pattern but applies it to column lifecycle management. A column such as `throughput_mbps` was added at schema version `telemetry_v4.0`, while `geo_lat_dd` shares that same version; `batch_number` appeared in `release_2023q4`, and `air_pressure_hpa` in `prod_v5.2`. Each versioned column is itself an entity with attributes—`confidence` at `0.705`, `dimension_kind` as `Dimension Kind 01`, `change rationale`, and a language tag of `de`—and datetime values such as `2025-04-06T14:28:17` and `2024-08-02T01:36:48` that record when the version metadata was last updated. The parallel structure between the evidence/claim domain and the versioning domain demonstrates that the entity-attribute-value pattern is not domain-specific but a general-purpose modeling construct applicable wherever entities require flexible, type-safe attribute storage.

**t_column_added_at_version_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| VERS-0001 | confidence | xsd:decimal |
| VERS-0002 | dimension_kind | xsd:string |
| VERS-0003 | method | xsd:string |
| VERS-0004 | recorded_at | xsd:dateTime |
| VERS-0005 | uncertainty | xsd:decimal |
| VERS-0006 | unit | xsd:string |
| VERS-0007 | value | xsd:decimal |
| VERS-0008 | encoding | xsd:string |

**t_column_added_at_version_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERS-0001 | VERS-0001 | VERS-0004 | 2025-04-06T14:28:17 |
| VERS-0002 | VERS-0002 | VERS-0004 | 2024-08-02T01:36:48 |
| VERS-0003 | VERS-0003 | VERS-0004 | 2025-02-20T12:13:34 |
| VERS-0004 | VERS-0004 | VERS-0004 | 2024-08-09T17:04:50 |
| VERS-0005 | VERS-0005 | VERS-0004 | 2025-03-12T11:57:30 |
| VERS-0006 | VERS-0006 | VERS-0004 | 2023-01-03T00:21:42 |

A relationship table connects two entities through a subject, a target, and a role, encoding not just that a connection exists but what kind of connection it is. The junction table linking schemaorg entries to legal names uses `schemaorg_id` as the subject, `legal_name_id` as the target, and `role` to specify the nature of the association—`reviewer`, `observer`, or `contributor`. For example, the schemaorg entry `LEGA-0002` is connected to legal name `LEGA-0005` with the role `reviewer`, while `LEGA-0004` connects to `LEGA-0007` as `observer` and to `LEGA-0004` as `reviewer`. The role column transforms a simple many-to-many relationship into a semantically rich association, allowing the same pair of entities to participate in multiple distinct relationships distinguished by their role. This subject-target-role pattern is the relational mechanism by which the data model captures organizational structure, governance relationships, and the contextual meaning of connections between entities.

**t_schemaorg_org_legalname__legal_name**

| id | schemaorg_id | legal_name_id | role |
| --- | --- | --- | --- |
| LEGA-0001 | LEGA-0002 | LEGA-0005 | reviewer |
| LEGA-0002 | LEGA-0004 | LEGA-0007 | observer |
| LEGA-0003 | LEGA-0004 | LEGA-0004 | reviewer |
| LEGA-0004 | LEGA-0006 | LEGA-0008 | contributor |
| LEGA-0005 | LEGA-0003 | LEGA-0001 | reviewer |
| LEGA-0006 | LEGA-0007 | LEGA-0007 | reviewer |
| LEGA-0007 | LEGA-0005 | LEGA-0006 | owner |
| LEGA-0008 | LEGA-0003 | LEGA-0001 | contributor |