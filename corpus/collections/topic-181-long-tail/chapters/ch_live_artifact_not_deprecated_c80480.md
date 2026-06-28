---
chapter_id: ch_live_artifact_not_deprecated_c80480
topic_id: 181
family: 07_long_tail
cited_terms: ['artifact_not_deprecated', 'artifact_not_revoked', 'artifact_subclass_two_parents']
model: engine-refine
---

An artifact is a managed, versioned entity within a data governance ecosystem—anything from a compliance report to an inference pipeline to a dataset definition. Each artifact carries a unique identifier such as `DEPR-0001` or `REVO-0001`, and may be further distinguished by human-readable labels like "Artifact Label 01" and classified into categories such as "Artifact Category 03." Artifacts are not merely named; they are quantified. A single artifact can occupy hundreds of megabytes—`996080316` bytes for one, `42978804` for another—and each version of that artifact is tracked independently, with versions ranging from `5` to `10` for the same logical artifact key. This versioning discipline ensures that every iteration of a model, schema, or manifest can be reproduced, audited, and, when necessary, revoked.

**fact_artifact**

| id | artifact_key | size_bytes | version |
| --- | --- | --- | --- |
| DEPR-0001 | DEPR-0004 | 123155790 | 6 |
| DEPR-0002 | DEPR-0005 | 42978804 | 5 |
| DEPR-0003 | DEPR-0004 | 996080316 | 5 |
| DEPR-0004 | DEPR-0005 | 597369362 | 10 |
| DEPR-0005 | DEPR-0006 | 12061913 | 9 |
| DEPR-0006 | DEPR-0001 | 792675668 | 5 |

**dim_artifact**

| id | artifact_label | artifact_category |
| --- | --- | --- |
| DEPR-0001 | Artifact Label 01 | Artifact Category 01 |
| DEPR-0002 | Artifact Label 02 | Artifact Category 02 |
| DEPR-0003 | Artifact Label 03 | Artifact Category 03 |
| DEPR-0004 | Artifact Label 04 | Artifact Category 04 |
| DEPR-0005 | Artifact Label 05 | Artifact Category 05 |
| DEPR-0006 | Artifact Label 06 | Artifact Category 06 |

**t_artifact_not_revoked**

| id | artifact | artifact_2 |
| --- | --- | --- |
| REVO-0001 | audit-log-sept | backup-manifest-9 |
| REVO-0002 | compliance-report-x | inference-pipeline-3 |
| REVO-0003 | schema-def-current | backup-manifest-9 |
| REVO-0004 | dataset-sanitized | runtime-env-prod |
| REVO-0005 | audit-log-sept | backup-manifest-9 |
| REVO-0006 | compliance-report-x | staging-logs-v2 |

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

Attributes provide the structured metadata that gives artifacts their operational meaning. An attribute is a named property—`checksum`, `created_date`, `identifier`, `license`—each bound to a specific type that constrains the shape of its value. Type declarations such as `xsd:string`, `xsd:date`, and `cco:DesignativeICE` enforce schema discipline across the system, ensuring that a checksum like `c0ffee42` is stored as a string, a creation date like `2024-01-18` as a date, and a designative identifier as a specialized ICE type. Values are partitioned by type into dedicated stores: date values capture timestamps ranging from `2023-01-26` to `2024-08-03`, integer values record counts such as `140` or `115`, and string values hold everything from license identifiers like `Apache-2.0` to rack assignments like `rack-7`. This typed separation allows the system to validate, query, and transform attributes without ambiguity.

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

Entities serve as the connective tissue between artifacts and their attributes. An entity—identified by keys such as `REVO-0001` or `REVO-0002`—represents a concrete instance of an artifact at a point in time, and each entity can carry multiple attributes. The same entity may hold a checksum, a creation date, and a license, all linked through a common entity identifier. This design decouples the definition of an attribute from its instantiation: the attribute `created_date` is defined once with its type `xsd:date`, but it is applied independently to each entity, producing distinct values like `2023-09-26` for one entity and `2024-08-03` for another. The result is a flexible, graph-like structure where artifacts, attributes, and values compose a rich, queryable knowledge graph.

**t_artifact_not_revoked_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| REVO-0001 | REVO-0001 | REVO-0002 | 2024-01-18 |
| REVO-0002 | REVO-0002 | REVO-0002 | 2023-09-26 |
| REVO-0003 | REVO-0003 | REVO-0002 | 2023-01-26 |
| REVO-0004 | REVO-0004 | REVO-0002 | 2024-08-03 |
| REVO-0005 | REVO-0005 | REVO-0002 | 2024-04-14 |
| REVO-0006 | REVO-0006 | REVO-0002 | 2023-07-20 |

Artifacts may also carry external identifiers and classification tags that bridge the governed system with the wider world. Identifiers follow established namespaces—`doi:10.1109/x` for a digital object, `oid:1.3.6.1` for an object identifier, `urn:uuid:9f2a` for a universally unique identifier—enabling cross-referencing with external registries and publications. Tags such as `verified`, `pii`, and `internal` provide lightweight classification that supports filtering, access control, and compliance workflows. An artifact tagged `pii` signals that it contains personally identifiable information and warrants heightened protection; one tagged `verified` indicates that its integrity has been confirmed through a review process. Together, identifiers and tags extend the governance model beyond internal tracking into the broader ecosystem of data stewardship.

**t_artifact_subclass_two_parents**

| id | artifact | artifact_2 | identifier | tags |
| --- | --- | --- | --- | --- |
| PARE-0001 | streaming-window-5min | ingestion-script-v2 | doi:10.1109/x | verified |
| PARE-0002 | streaming-window-5min | metadata-registry-sync | oid:1.3.6.1 | pii |
| PARE-0003 | telemetry-aggregate-q3 | encryption-key-rotation | ref-8842 | verified |
| PARE-0004 | model-checkpoint-epoch12 | master-schema-v1 | urn:uuid:9f2a | internal |
| PARE-0005 | telemetry-aggregate-q3 | master-schema-v1 | oid:1.3.6.1 | public |
| PARE-0006 | model-checkpoint-epoch12 | ingestion-script-v2 | doi:10.1109/x | verified |
| PARE-0007 | index-rebuild-prod | validation-ruleset-strict | urn:uuid:9f2a | verified |