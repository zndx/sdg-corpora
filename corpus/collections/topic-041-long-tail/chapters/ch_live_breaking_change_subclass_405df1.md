---
chapter_id: ch_live_breaking_change_subclass_405df1
topic_id: 41
family: 07_long_tail
cited_terms: ['breaking_change_subclass', 'identifier_uniquely_identifies', 'storage_structure_composition']
model: engine-refine
---

Breaking-change classification is anchored by a canonical identifier space in which each subclass receives a stable key—CHAN-0001 through CHAN-0004—serving as the primary reference for downstream attribute binding and value resolution. The subclass table captures the nature of the change itself, pairing identifiers with descriptive labels such as *Telemetry schema evolution*, *Provenance graph migration*, and *OAuth2 token rotation*, while simultaneously recording the system or service affected, ranging from *device telemetry collector* and *inventory management API* to *legacy mobile app* and *real-time event stream*. This dual-column structure ensures that every breaking change is both semantically characterized and operationally scoped, providing the foundation for attribute-level tracking and impact analysis.

**t_breaking_change_subclass**

| id | breaking | breaking_change_for |
| --- | --- | --- |
| CHAN-0001 | Telemetry schema evolution | device telemetry collector |
| CHAN-0002 | Telemetry schema evolution | inventory management API |
| CHAN-0003 | Provenance graph migration | legacy mobile app |
| CHAN-0004 | OAuth2 token rotation | real-time event stream |
| CHAN-0005 | Schema field removal | internal microservice mesh |
| CHAN-0006 | Sensor sampling rate drop | customer dashboard frontend |
| CHAN-0007 | Provenance graph migration | compliance audit logger |
| CHAN-0008 | TLS 1.3 enforcement | third-party analytics SDK |

**t_breaking_change_subclass_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| CHAN-0001 | confidence | xsd:decimal |
| CHAN-0002 | dimension_kind | xsd:string |
| CHAN-0003 | method | xsd:string |
| CHAN-0004 | recorded_at | xsd:dateTime |
| CHAN-0005 | uncertainty | xsd:decimal |
| CHAN-0006 | unit | xsd:string |
| CHAN-0007 | value | xsd:decimal |
| CHAN-0008 | encoding | xsd:string |

Attributes are declared in a dedicated schema table that assigns each a human-readable name and an XML Schema datatype, thereby enforcing type discipline across all value tables. The attribute catalogue includes *confidence* typed as `xsd:decimal`, *dimension_kind* and *method* as `xsd:string`, and *recorded_at* as `xsd:dateTime`, among others extending through CHAN-0010. Each attribute declaration is itself identified by a surrogate key, and these keys serve as foreign references in the value tables, which are partitioned by type to accommodate the heterogeneity of stored data. The datetime value table records timestamps such as `2023-07-26T14:07:49` and `2025-01-03T20:08:42`, the decimal table holds numeric measures like `0.203`, `700.59`, and `64.61`, and the varchar table stores free-form strings including *Dimension Kind 01*, *Encoding 02*, *calibration record*, and the two-letter code *en*. In each case, the entity column binds the value to a specific breaking-change subclass, while the attribute column resolves to the corresponding declaration, forming a normalized triple of entity, attribute, and typed value.

**t_breaking_change_subclass_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CHAN-0001 | CHAN-0001 | CHAN-0004 | 2023-07-26T14:07:49 |
| CHAN-0002 | CHAN-0002 | CHAN-0004 | 2025-01-03T20:08:42 |
| CHAN-0003 | CHAN-0003 | CHAN-0004 | 2024-04-10T03:15:13 |
| CHAN-0004 | CHAN-0004 | CHAN-0004 | 2023-07-21T06:41:40 |
| CHAN-0005 | CHAN-0005 | CHAN-0004 | 2023-07-01T02:58:50 |
| CHAN-0006 | CHAN-0006 | CHAN-0004 | 2024-07-07T11:26:39 |
| CHAN-0007 | CHAN-0007 | CHAN-0004 | 2024-07-12T18:30:29 |
| CHAN-0008 | CHAN-0008 | CHAN-0004 | 2024-11-14T05:00:21 |

**t_breaking_change_subclass_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CHAN-0001 | CHAN-0001 | CHAN-0001 | 0.203 |
| CHAN-0002 | CHAN-0001 | CHAN-0005 | 700.59 |
| CHAN-0003 | CHAN-0001 | CHAN-0007 | 64.61 |
| CHAN-0004 | CHAN-0002 | CHAN-0001 | 0.645 |
| CHAN-0005 | CHAN-0002 | CHAN-0005 | 584.78 |
| CHAN-0006 | CHAN-0002 | CHAN-0007 | 672.81 |
| CHAN-0007 | CHAN-0003 | CHAN-0001 | 0.769 |
| CHAN-0008 | CHAN-0003 | CHAN-0005 | 136.48 |

**t_breaking_change_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CHAN-0001 | CHAN-0001 | CHAN-0002 | Dimension Kind 01 |
| CHAN-0002 | CHAN-0001 | CHAN-0008 | Encoding 02 |
| CHAN-0003 | CHAN-0001 | CHAN-0009 | calibration record |
| CHAN-0004 | CHAN-0001 | CHAN-0010 | en |
| CHAN-0005 | CHAN-0001 | CHAN-0003 | hybrid |
| CHAN-0006 | CHAN-0001 | CHAN-0006 | deg_C |
| CHAN-0007 | CHAN-0002 | CHAN-0002 | Dimension Kind 07 |
| CHAN-0008 | CHAN-0002 | CHAN-0008 | Encoding 08 |

Identifier governance is handled through a separate registry that maps stable identifiers to the entities they designate, recording both the syntactic format and the date of issuance. Identifiers follow distinct naming conventions—DOI resolvers such as `doi:10.1145/3641519`, ISBN URNs like `urn:isbn:9780131103627`, ORCID iDs including `orcid:0000-0002-1825-0097`—and each entry specifies the target entity, for example *provenance node root*, *data pipeline stage 3*, or *container image sha256*. The format column documents the serialization or encoding convention (JSON, E.164, CSV), and the issued date column anchors the assignment to a point in time, with values such as `2024-09-07`, `2023-03-13`, and `2024-01-30` establishing a temporal audit trail for identifier lifecycle management.

**t_identifier_uniquely_identifies**

| id | identifier | identifies | format | issued_date |
| --- | --- | --- | --- | --- |
| IDEN-0001 | doi:10.1145/3641519 | provenance node root | JSON | 2024-09-07 |
| IDEN-0002 | urn:isbn:9780131103627 | data pipeline stage 3 | E.164 | 2023-03-13 |
| IDEN-0003 | doi:10.1145/3641519 | container image sha256 | CSV | 2024-01-30 |
| IDEN-0004 | orcid:0000-0002-1825-0097 | data pipeline stage 3 | JSON | 2023-03-01 |
| IDEN-0005 | pmid:12345678 | metadata registry entry | E.164 | 2025-03-08 |
| IDEN-0006 | doi:10.1016/j.softx.2020.100312 | metadata registry entry | ISO-8601 | 2025-05-18 |
| IDEN-0007 | orcid:0000-0002-1825-0097 | data pipeline stage 3 | RFC-3339 | 2024-09-01 |

Storage architecture is modeled through a composition hierarchy that decomposes logical storage structures into their constituent database containers. A composition entry such as *tiered-storage-pool* or *archive-tape-library* is linked to specific containers—*dev-mongo-shard*, *staging-redis-cluster*, *s3-logs-bucket*, *cassandra-data-node*—via a comprises relationship that is itself mediated by a role-bearing junction table. This junction table assigns each pair a role, distinguishing between *observer* and *reviewer* designations, and references the composition through a subject column and the contained component through a target column. The role attribute thus encodes the semantic nature of the containment relationship, enabling policies or workflows to differentiate between containers that are passively monitored and those subject to active review within a given storage structure.

**t_storage_structure_composition**

| id | storage_structure_composition |
| --- | --- |
| COMP-0001 | tiered-storage-pool |
| COMP-0002 | archive-tape-library |
| COMP-0003 | tiered-storage-pool |
| COMP-0004 | san-disk-array |
| COMP-0005 | archive-tape-library |
| COMP-0006 | flash-memory-pool |

**t_storage_structure_composition_comprises**

| id | comprises |
| --- | --- |
| COMP-0001 | dev-mongo-shard |
| COMP-0002 | staging-redis-cluster |
| COMP-0003 | s3-logs-bucket |
| COMP-0004 | cassandra-data-node |
| COMP-0005 | oracle-tablespace-main |
| COMP-0006 | neo4j-graph-store |

**t_storage_structure_composition__comprises**

| id | storage_id | comprises_id | role |
| --- | --- | --- | --- |
| COMP-0001 | COMP-0003 | COMP-0006 | observer |
| COMP-0002 | COMP-0002 | COMP-0004 | reviewer |
| COMP-0003 | COMP-0006 | COMP-0001 | observer |
| COMP-0004 | COMP-0003 | COMP-0006 | reviewer |
| COMP-0005 | COMP-0002 | COMP-0002 | contributor |
| COMP-0006 | COMP-0001 | COMP-0006 | reviewer |
| COMP-0007 | COMP-0006 | COMP-0003 | owner |
| COMP-0008 | COMP-0002 | COMP-0006 | reviewer |