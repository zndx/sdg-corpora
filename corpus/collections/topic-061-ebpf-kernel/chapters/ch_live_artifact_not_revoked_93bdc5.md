---
chapter_id: ch_live_artifact_not_revoked_93bdc5
topic_id: 61
family: 07_long_tail
cited_terms: ['artifact_not_revoked', 'existential_anchored_to_artifact_via_part', 'two_disjoint_artifacts']
model: engine-refine
---

The persistence of artifacts through their lifecycle is governed by a tripartite structure of identifiers, typed attributes, and value assignments that together form a queryable provenance graph. Each artifact—whether designated as `audit-log-sept`, `compliance-report-x`, `schema-def-current`, or `dataset-sanitized`—receives a stable identifier such as `REVO-0001` or `REVO-0002`, and is paired with a secondary artifact like `backup-manifest-9` or `inference-pipeline-3` to capture dependency or lineage relationships. Disjoint artifact pairs follow the same pattern under distinct identifiers: `etl-job` maps to `data-lake`, `config-bundle` to `traffic-router` and `access-policy`, and `data-pipeline-v4` to `service-discovery`, each anchored by keys like `ARTI-0001` through `ARTI-0004`. This separation of artifact identity from attribute semantics ensures that revocation events can be tracked without collapsing structural metadata into value noise.

**t_artifact_not_revoked**

| id | artifact | artifact_2 |
| --- | --- | --- |
| REVO-0001 | audit-log-sept | backup-manifest-9 |
| REVO-0002 | compliance-report-x | inference-pipeline-3 |
| REVO-0003 | schema-def-current | backup-manifest-9 |
| REVO-0004 | dataset-sanitized | runtime-env-prod |
| REVO-0005 | audit-log-sept | backup-manifest-9 |
| REVO-0006 | compliance-report-x | staging-logs-v2 |

**t_artifact_not_revoked_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| REVO-0001 | checksum | xsd:string |
| REVO-0002 | created_date | xsd:date |
| REVO-0003 | identifier | cco:DesignativeICE |
| REVO-0004 | license | xsd:string |
| REVO-0005 | mime_type | xsd:string |
| REVO-0006 | size_bytes | xsd:long |
| REVO-0007 | uri | xsd:string |
| REVO-0008 | version | xsd:integer |

**t_artifact_not_revoked_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| REVO-0001 | REVO-0001 | REVO-0006 | 140 |
| REVO-0002 | REVO-0001 | REVO-0008 | 2 |
| REVO-0003 | REVO-0002 | REVO-0006 | 115 |
| REVO-0004 | REVO-0002 | REVO-0008 | 2 |
| REVO-0005 | REVO-0003 | REVO-0006 | 293 |
| REVO-0006 | REVO-0003 | REVO-0008 | 12 |
| REVO-0007 | REVO-0004 | REVO-0006 | 361 |
| REVO-0008 | REVO-0004 | REVO-0008 | 1 |

**t_two_disjoint_artifacts**

| id | two | two_2 |
| --- | --- | --- |
| ARTI-0001 | etl-job | data-lake |
| ARTI-0002 | config-bundle | traffic-router |
| ARTI-0003 | config-bundle | access-policy |
| ARTI-0004 | data-pipeline-v4 | service-discovery |
| ARTI-0005 | audit-log | traffic-router |
| ARTI-0006 | ingestion-service | traffic-router |

**t_two_disjoint_artifacts_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ARTI-0001 | checksum | xsd:string |
| ARTI-0002 | created_date | xsd:date |
| ARTI-0003 | identifier | cco:DesignativeICE |
| ARTI-0004 | license | xsd:string |
| ARTI-0005 | mime_type | xsd:string |
| ARTI-0006 | size_bytes | xsd:long |
| ARTI-0007 | uri | xsd:string |
| ARTI-0008 | version | xsd:integer |

**t_two_disjoint_artifacts_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0002 | 2023-05-13 |
| ARTI-0002 | ARTI-0002 | ARTI-0002 | 2024-02-28 |
| ARTI-0003 | ARTI-0003 | ARTI-0002 | 2024-03-29 |
| ARTI-0004 | ARTI-0004 | ARTI-0002 | 2023-09-19 |
| ARTI-0005 | ARTI-0005 | ARTI-0002 | 2025-06-16 |
| ARTI-0006 | ARTI-0006 | ARTI-0002 | 2023-10-09 |

**t_two_disjoint_artifacts_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0006 | 36 |
| ARTI-0002 | ARTI-0001 | ARTI-0008 | 5 |
| ARTI-0003 | ARTI-0002 | ARTI-0006 | 462 |
| ARTI-0004 | ARTI-0002 | ARTI-0008 | 3 |
| ARTI-0005 | ARTI-0003 | ARTI-0006 | 31 |
| ARTI-0006 | ARTI-0003 | ARTI-0008 | 5 |
| ARTI-0007 | ARTI-0004 | ARTI-0006 | 427 |
| ARTI-0008 | ARTI-0004 | ARTI-0008 | 10 |

**t_two_disjoint_artifacts_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0001 | 9d2b7a16 |
| ARTI-0002 | ARTI-0001 | ARTI-0003 | urn:uuid:9f2a |
| ARTI-0003 | ARTI-0001 | ARTI-0004 | MPL-2.0 |
| ARTI-0004 | ARTI-0001 | ARTI-0009 | ap-south-2 |
| ARTI-0005 | ARTI-0001 | ARTI-0005 | application/xml |
| ARTI-0006 | ARTI-0001 | ARTI-0010 | Name 06 |
| ARTI-0007 | ARTI-0001 | ARTI-0011 | governance |
| ARTI-0008 | ARTI-0001 | ARTI-0012 | Tags 08 |

Attributes are declared in a dedicated schema layer where each attribute carries a name and a type that constrains its permissible values. The attribute vocabulary spans `checksum`, `created_date`, `identifier`, and `license`, with types drawn from both standard XML Schema primitives and domain-specific ontologies: `xsd:string` for free-form text, `xsd:date` for temporal markers, and `cco:DesignativeICE` for designative identifiers that carry semantic weight beyond plain strings. The type system is not decorative; it dictates which value table receives a given assignment and enforces that `2024-01-18` lands in the date store while `c0ffee42` and `Apache-2.0` reside in the varchar store, and integer counts such as `140` or `462` are routed to the integer store. This type-aware dispatch prevents type confusion at query time and makes schema evolution a matter of adding attribute declarations rather than restructuring value tables.

Value assignment follows an entity-attribute-value pattern that decouples the attribute definition from its concrete instantiation. An entity—identified by the same key space as its parent artifact, so that `REVO-0001` serves simultaneously as artifact identifier and entity anchor—receives multiple attribute values, each stored in the table corresponding to its declared type. The `created_date` attribute, typed as `xsd:date`, yields values like `2024-01-18`, `2023-09-26`, `2023-01-26`, and `2024-08-03` across the `REVO` artifact set, while the same attribute on the `ARTI` set produces `2023-05-13`, `2024-02-28`, `2024-03-29`, and `2023-09-19`. Integer attributes capture quantitative metadata—`140` and `2` for one entity, `115` and `2` for another, `36` and `5` for a disjoint pair, `462` and `3` for another—while varchar attributes hold checksums like `c0ffee42` and `9d2b7a16`, reference codes such as `ref-8842`, license designations including `Apache-2.0` and `MPL-2.0`, and location or rack identifiers like `rack-7` and `ap-south-2`. The entity-to-attribute linkage is explicit: every value row carries both an `entity_id` and an `attr_id`, making it possible to reconstruct the full attribute profile of any entity by joining across the three value tables.

**t_artifact_not_revoked_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| REVO-0001 | REVO-0001 | REVO-0002 | 2024-01-18 |
| REVO-0002 | REVO-0002 | REVO-0002 | 2023-09-26 |
| REVO-0003 | REVO-0003 | REVO-0002 | 2023-01-26 |
| REVO-0004 | REVO-0004 | REVO-0002 | 2024-08-03 |
| REVO-0005 | REVO-0005 | REVO-0002 | 2024-04-14 |
| REVO-0006 | REVO-0006 | REVO-0002 | 2023-07-20 |

**t_artifact_not_revoked_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| REVO-0001 | REVO-0001 | REVO-0001 | c0ffee42 |
| REVO-0002 | REVO-0001 | REVO-0003 | ref-8842 |
| REVO-0003 | REVO-0001 | REVO-0004 | Apache-2.0 |
| REVO-0004 | REVO-0001 | REVO-0009 | rack-7 |
| REVO-0005 | REVO-0001 | REVO-0005 | text/plain |
| REVO-0006 | REVO-0001 | REVO-0010 | Name 06 |
| REVO-0007 | REVO-0001 | REVO-0011 | analytics |
| REVO-0008 | REVO-0001 | REVO-0012 | Tags 08 |

Beyond artifact-centric provenance, the system maintains an existential layer that anchors abstract entities—governance rules, sensors, gateways, samples—to concrete locations and resource URIs. `GovernanceRule77` resolves to `hdfs://cluster/staging` in `rack-7`, `ObservationDrone04` and `EdgeGateway-12` both map to `abfss://prod/silver` but differ in physical placement (`eu-west-3` versus `on-prem-dc1`), and `LabSampleVial-7` lives at `s3://lake/raw` in `rack-7`. The URI column encodes the resource address in cloud-native protocols—HDFS, Azure Blob File System, S3—while the location column captures the physical or logical deployment site, enabling cross-referencing between logical resource paths and infrastructure topology. This existential anchoring is itself keyed by identifiers like `PART-0001` through `PART-0004`, and the `rack-7` location appears in both the existential table and the varchar value store, creating a bridge between attribute-level metadata and infrastructure-level placement.

**t_existential_anchored_to_artifact_via_part**

| id | existential | uri | location |
| --- | --- | --- | --- |
| PART-0001 | GovernanceRule77 | hdfs://cluster/staging | rack-7 |
| PART-0002 | ObservationDrone04 | abfss://prod/silver | eu-west-3 |
| PART-0003 | EdgeGateway-12 | abfss://prod/silver | on-prem-dc1 |
| PART-0004 | LabSampleVial-7 | s3://lake/raw | rack-7 |
| PART-0005 | ObservationDrone04 | abfss://prod/silver | zone-b |
| PART-0006 | ProvenanceLedger2 | s3://lake/raw | on-prem-dc1 |

The practical effect of this architecture is that provenance queries can traverse from a revocation event through artifact identity, attribute values, and existential anchors without schema changes. When `dataset-sanitized` (`REVO-0003`) is paired with `backup-manifest-9` and carries a `created_date` of `2023-01-26`, the full provenance chain is recoverable from the identifier alone. When `config-bundle` (`ARTI-0002`) has a checksum of `9d2b7a16`, a creation date of `2024-02-28`, and an integer attribute value of `462`, all three value tables contribute to a single entity profile. The separation of attribute declarations from value assignments means that adding a new attribute—say, a `revision_count` typed as `xsd:integer`—requires only a row in the attribute table; no DDL changes cascade to the value stores. This design supports compliance auditing at scale: every artifact's state, its dependencies, its typed attributes, and its existential anchors are queryable through a consistent key space, and the type system ensures that `Apache-2.0` is never confused with `2024-01-18` or `140`.