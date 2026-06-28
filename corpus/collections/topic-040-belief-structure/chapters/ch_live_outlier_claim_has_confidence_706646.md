---
chapter_id: ch_live_outlier_claim_has_confidence_706646
topic_id: 40
family: 02_observation_measurement
cited_terms: ['outlier_claim_has_confidence', 'claim_not_disconfirmed', 'existential_anchored_to_artifact_via_part']
model: engine-refine
---

Attributes, their types, and the entities they describe form the foundational vocabulary of any system that must track, audit, and reason about state. An attribute is a named property—confidence, dimension_kind, method, recorded_at—each bound to a schema type such as xsd:decimal, xsd:string, or xsd:dateTime, which governs how values are stored, validated, and compared. The attr_type column does not merely label a column; it enforces a contract between the data model and the query engine, ensuring that a confidence score expressed as 0.904 or 0.145 remains numerically comparable across records, while a recorded_at timestamp like 2023-06-24T17:04:07 or 2024-09-22T13:07:31 is parsed and indexed as temporal data. This separation of name from type from value is what permits a single entity to carry heterogeneous properties without ambiguity.

Entities are the things to which attributes attach. In the outlier domain, an entity might represent a claim that a power fluctuation occurred and was assessed with high certainty or expert verified; in the disconfirmation domain, an entity might encode the assertion that a redundancy failover was successful or that a secondary sensor is aligned. Each entity receives a stable identifier—CONF-0001 through CONF-0004 in the outlier set, DISC-0001 through DISC-0004 in the disconfirmation set—which serves as the primary key for all downstream joins. The identifier is opaque to the domain logic; it exists solely to guarantee referential integrity when the same entity is referenced across multiple value tables. A single entity, CONF-0001 for instance, may simultaneously carry a decimal confidence of 0.904, a dimension_kind of Dimension Kind 01, a method described as change rationale, and a recorded_at timestamp of 2023-06-24T17:04:07, all resolved through the entity_id foreign key.

**t_outlier_claim_has_confidence**

| id | outlier | confidence |
| --- | --- | --- |
| CONF-0001 | power fluctuation | high certainty |
| CONF-0002 | power fluctuation | expert verified |
| CONF-0003 | power fluctuation | manual review |
| CONF-0004 | calibration drift | automated flag |
| CONF-0005 | telemetry gap | sensor validated |
| CONF-0006 | signal dropout | probabilistic score |
| CONF-0007 | memory leak | baseline deviation |
| CONF-0008 | calibration drift | manual review |

**t_outlier_claim_has_confidence_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONF-0001 | CONF-0001 | CONF-0004 | 2023-06-24T17:04:07 |
| CONF-0002 | CONF-0002 | CONF-0004 | 2024-09-22T13:07:31 |
| CONF-0003 | CONF-0003 | CONF-0004 | 2023-12-24T05:49:34 |
| CONF-0004 | CONF-0004 | CONF-0004 | 2025-01-22T02:31:25 |
| CONF-0005 | CONF-0005 | CONF-0004 | 2023-07-07T20:57:08 |
| CONF-0006 | CONF-0006 | CONF-0004 | 2023-12-11T12:48:41 |
| CONF-0007 | CONF-0007 | CONF-0004 | 2024-11-29T10:12:10 |
| CONF-0008 | CONF-0008 | CONF-0004 | 2024-08-28T09:33:36 |

**t_outlier_claim_has_confidence_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONF-0001 | CONF-0001 | CONF-0001 | 0.904 |
| CONF-0002 | CONF-0001 | CONF-0005 | 369.80 |
| CONF-0003 | CONF-0001 | CONF-0007 | 179.72 |
| CONF-0004 | CONF-0002 | CONF-0001 | 0.503 |
| CONF-0005 | CONF-0002 | CONF-0005 | 659.89 |
| CONF-0006 | CONF-0002 | CONF-0007 | 72.27 |
| CONF-0007 | CONF-0003 | CONF-0001 | 0.694 |
| CONF-0008 | CONF-0003 | CONF-0005 | 15.75 |

**t_outlier_claim_has_confidence_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONF-0001 | CONF-0001 | CONF-0002 | Dimension Kind 01 |
| CONF-0002 | CONF-0001 | CONF-0008 | Encoding 02 |
| CONF-0003 | CONF-0001 | CONF-0009 | change rationale |
| CONF-0004 | CONF-0001 | CONF-0010 | fr |
| CONF-0005 | CONF-0001 | CONF-0003 | manual |
| CONF-0006 | CONF-0001 | CONF-0006 | ratio |
| CONF-0007 | CONF-0002 | CONF-0002 | Dimension Kind 07 |
| CONF-0008 | CONF-0002 | CONF-0008 | Encoding 08 |

**t_claim_not_disconfirmed**

| id | claim | claim_2 |
| --- | --- | --- |
| DISC-0001 | redundancy failover successful | data pipeline stalled |
| DISC-0002 | secondary sensor aligned | latency under SLA bounds |
| DISC-0003 | firmware version outdated | threshold limits expanded |
| DISC-0004 | thermal monitoring active | secondary sensor aligned |
| DISC-0005 | firmware version outdated | network latency spike unexplained |
| DISC-0006 | temperature sensor offline | redundancy failover successful |
| DISC-0007 | latency under SLA bounds | network latency spike unexplained |

**t_claim_not_disconfirmed_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DISC-0001 | DISC-0001 | DISC-0004 | 2023-08-09T14:45:08 |
| DISC-0002 | DISC-0002 | DISC-0004 | 2023-07-14T01:11:42 |
| DISC-0003 | DISC-0003 | DISC-0004 | 2023-07-27T10:01:23 |
| DISC-0004 | DISC-0004 | DISC-0004 | 2024-07-11T23:49:48 |
| DISC-0005 | DISC-0005 | DISC-0004 | 2024-06-18T23:43:54 |
| DISC-0006 | DISC-0006 | DISC-0004 | 2023-11-25T07:03:11 |
| DISC-0007 | DISC-0007 | DISC-0004 | 2025-06-11T19:52:01 |

**t_claim_not_disconfirmed_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DISC-0001 | DISC-0001 | DISC-0001 | 0.145 |
| DISC-0002 | DISC-0001 | DISC-0005 | 669.01 |
| DISC-0003 | DISC-0001 | DISC-0007 | 65.74 |
| DISC-0004 | DISC-0002 | DISC-0001 | 0.678 |
| DISC-0005 | DISC-0002 | DISC-0005 | 525.06 |
| DISC-0006 | DISC-0002 | DISC-0007 | 361.13 |
| DISC-0007 | DISC-0003 | DISC-0001 | 0.813 |
| DISC-0008 | DISC-0003 | DISC-0005 | 578.57 |

**t_claim_not_disconfirmed_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DISC-0001 | DISC-0001 | DISC-0002 | Dimension Kind 01 |
| DISC-0002 | DISC-0001 | DISC-0008 | Encoding 02 |
| DISC-0003 | DISC-0001 | DISC-0009 | intake form |
| DISC-0004 | DISC-0001 | DISC-0010 | ja |
| DISC-0005 | DISC-0001 | DISC-0003 | hybrid |
| DISC-0006 | DISC-0001 | DISC-0006 | mg/L |
| DISC-0007 | DISC-0002 | DISC-0002 | Dimension Kind 07 |
| DISC-0008 | DISC-0002 | DISC-0008 | Encoding 08 |

The value tables implement a vertical partitioning strategy that isolates heterogeneous data types into dedicated stores. Decimal values such as 369.80, 179.72, 669.01, and 65.74 reside in the decimal value table, each linked to its entity and attribute through entity_id and attr_id pairs. String values—Encoding 02, intake form, fr, ja—occupy the varchar table, while datetime values populate their own table. This design avoids the cost and complexity of nullable columns or type-coercion at query time; a query for confidence scores never scans string data, and a temporal range filter never encounters a decimal. The attr_id columns in the value tables reference back to the attribute definition table, creating a three-level indirection: entity → attribute definition → typed value. This indirection is what allows the schema to evolve—new attributes can be added without altering any value table.

Beyond the abstract attribute-entity relationship, the system must also ground entities in physical and logical space. The existential-to-artifact mapping table anchors entities such as GovernanceRule77, ObservationDrone04, EdgeGateway-12, and LabSampleVial-7 to concrete locations—rack-7, eu-west-3, on-prem-dc1—and to resource identifiers like hdfs://cluster/staging, abfss://prod/silver, and s3://lake/raw. The uri column encodes the protocol and path by which an artifact is addressed; the location column records where it physically or logically resides. An EdgeGateway-12 may be reachable at abfss://prod/silver and simultaneously located on-prem-dc1, while a LabSampleVial-7 may be at s3://lake/raw and stationed at rack-7. This dual addressing—logical URI plus physical location—is essential for systems that must route queries, enforce data residency policies, or trace the provenance of an observation from sensor to storage.

**t_existential_anchored_to_artifact_via_part**

| id | existential | uri | location |
| --- | --- | --- | --- |
| PART-0001 | GovernanceRule77 | hdfs://cluster/staging | rack-7 |
| PART-0002 | ObservationDrone04 | abfss://prod/silver | eu-west-3 |
| PART-0003 | EdgeGateway-12 | abfss://prod/silver | on-prem-dc1 |
| PART-0004 | LabSampleVial-7 | s3://lake/raw | rack-7 |
| PART-0005 | ObservationDrone04 | abfss://prod/silver | zone-b |
| PART-0006 | ProvenanceLedger2 | s3://lake/raw | on-prem-dc1 |

The interplay between these layers—attributes, entities, identifiers, typed values, URIs, and locations—creates a graph-like structure that supports both narrow, attribute-specific queries and broad, cross-entity investigations. A compliance auditor might trace a single outlier claim (CONF-0001) through its confidence assessment, its decimal score, its recorded timestamp, and the artifact that generated it, all while respecting the type constraints that guarantee data integrity. An operations engineer might query all entities located at rack-7 or accessible via abfss://prod/silver, regardless of their attribute composition. The schema does not prescribe a single access pattern; it enables every pattern by keeping identifiers stable, types explicit, and values partitioned by kind.

**t_outlier_claim_has_confidence_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| CONF-0001 | confidence | xsd:decimal |
| CONF-0002 | dimension_kind | xsd:string |
| CONF-0003 | method | xsd:string |
| CONF-0004 | recorded_at | xsd:dateTime |
| CONF-0005 | uncertainty | xsd:decimal |
| CONF-0006 | unit | xsd:string |
| CONF-0007 | value | xsd:decimal |
| CONF-0008 | encoding | xsd:string |

**t_claim_not_disconfirmed_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| DISC-0001 | confidence | xsd:decimal |
| DISC-0002 | dimension_kind | xsd:string |
| DISC-0003 | method | xsd:string |
| DISC-0004 | recorded_at | xsd:dateTime |
| DISC-0005 | uncertainty | xsd:decimal |
| DISC-0006 | unit | xsd:string |
| DISC-0007 | value | xsd:decimal |
| DISC-0008 | encoding | xsd:string |