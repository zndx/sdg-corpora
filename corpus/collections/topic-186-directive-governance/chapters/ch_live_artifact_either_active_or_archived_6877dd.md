---
chapter_id: ch_live_artifact_either_active_or_archived_6877dd
topic_id: 186
family: 07_long_tail
cited_terms: ['artifact_either_active_or_archived', 'equiv_intersect_with_two_restrictions', 'control_basic']
model: engine-refine
---

In governed data and artifact environments, every object that must be audited, retained, or bound to policy needs a stable identifier that survives lifecycle changes—activation, archival, migration, and cross-system reference. An identifier is not merely a surrogate key; when modeled as a first-class attribute with a designative semantic type such as `cco:DesignativeICE`, it signals that the value participates in identity and referential integrity rather than in descriptive metadata. Artifacts such as `sensor-telemetry-v4`, `config-repo-main`, and `event-stream-kafka` therefore exist as entities—concrete instances keyed by identifiers like `ARCH-0001` through `ARCH-0004`—while companion records (`output-sink-delta`, `schema-registry`, `checksum-validator`) capture relational or contextual roles without collapsing the entity’s primary identity. This separation matters because compliance queries, lineage graphs, and control mappings all resolve through the entity’s identifier first; downstream tables store facts *about* entities, not definitions *of* them.

**t_artifact_either_active_or_archived**

| id | artifact | artifact_2 | artifact_3 |
| --- | --- | --- | --- |
| ARCH-0001 | sensor-telemetry-v4 | output-sink-delta | test-dataset |
| ARCH-0002 | config-repo-main | schema-registry | deployment-target |
| ARCH-0003 | data-catalog-index | upstream-source-beta | test-dataset |
| ARCH-0004 | event-stream-kafka | checksum-validator | compliance-tier |
| ARCH-0005 | config-repo-main | checksum-validator | production-cluster |
| ARCH-0006 | ml-feature-store | validation-module | test-dataset |
| ARCH-0007 | sensor-telemetry-v4 | validation-module | deployment-target |
| ARCH-0008 | batch-ingest-queue | validation-module | dev-sandbox |

**t_artifact_either_active_or_archived_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ARCH-0001 | checksum | xsd:string |
| ARCH-0002 | created_date | xsd:date |
| ARCH-0003 | identifier | cco:DesignativeICE |
| ARCH-0004 | license | xsd:string |
| ARCH-0005 | mime_type | xsd:string |
| ARCH-0006 | size_bytes | xsd:long |
| ARCH-0007 | uri | xsd:string |
| ARCH-0008 | version | xsd:integer |

**t_artifact_either_active_or_archived_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARCH-0001 | ARCH-0001 | ARCH-0006 | 356 |
| ARCH-0002 | ARCH-0001 | ARCH-0008 | 2 |
| ARCH-0003 | ARCH-0002 | ARCH-0006 | 77 |
| ARCH-0004 | ARCH-0002 | ARCH-0008 | 4 |
| ARCH-0005 | ARCH-0003 | ARCH-0006 | 218 |
| ARCH-0006 | ARCH-0003 | ARCH-0008 | 10 |
| ARCH-0007 | ARCH-0004 | ARCH-0006 | 431 |
| ARCH-0008 | ARCH-0004 | ARCH-0008 | 2 |

**t_artifact_either_active_or_archived_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARCH-0001 | ARCH-0001 | ARCH-0001 | 7b14de08 |
| ARCH-0002 | ARCH-0001 | ARCH-0003 | ref-8842 |
| ARCH-0003 | ARCH-0001 | ARCH-0004 | BSD-3-Clause |
| ARCH-0004 | ARCH-0001 | ARCH-0009 | ap-south-2 |
| ARCH-0005 | ARCH-0001 | ARCH-0005 | text/csv |
| ARCH-0006 | ARCH-0001 | ARCH-0010 | Name 06 |
| ARCH-0007 | ARCH-0001 | ARCH-0011 | analytics |
| ARCH-0008 | ARCH-0001 | ARCH-0012 | Tags 08 |

Attributes name the governed properties an entity may carry, and attribute type (`attr_type`) determines how those properties are interpreted, validated, and physically stored. A checksum is typed as `xsd:string`, a created date as `xsd:date`, a license as `xsd:string`, while identifier-as-attribute uses a domain-specific type rather than a primitive—signaling that parsers, export formats, and access rules must treat it differently from free text. Typed attribute definitions decouple schema evolution from entity records: new compliance dimensions (license, region, tier) can be introduced without altering the core entity table, and consumers know in advance whether to expect lexical, temporal, or identity-bearing values. In practice, attribute typing is what makes heterogeneous metadata governable at scale; without it, the same column might hold `BSD-3-Clause`, `2024-02-12`, and `ref-8842` with no reliable coercion or constraint.

The miscellaneous value field—`misc` in operational parlance, or simply the stored value—is where assertion meets evidence. Rather than forcing all facts into one untyped column, values are partitioned by representation: dates (`2024-02-12`, `2023-06-04`, `2025-05-16`), integers (`356`, `77`, `2`, `4`), and variable-character payloads (`7b14de08`, `BSD-3-Clause`, `ap-south-2`) each land in storage suited to their attribute type. Each value row binds an entity to an attribute definition, so `ARCH-0001` may simultaneously assert a checksum hash, a license string, and a created date without ambiguity about which property is which. This entity–attribute–value pattern is the workhorse of compliance registries because it accommodates sparse, evolving metadata: not every artifact carries every attribute, yet every populated attribute remains typed, queryable, and attributable to a specific entity instance.

**t_artifact_either_active_or_archived_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARCH-0001 | ARCH-0001 | ARCH-0002 | 2024-02-12 |
| ARCH-0002 | ARCH-0002 | ARCH-0002 | 2023-06-04 |
| ARCH-0003 | ARCH-0003 | ARCH-0002 | 2025-05-16 |
| ARCH-0004 | ARCH-0004 | ARCH-0002 | 2024-07-03 |
| ARCH-0005 | ARCH-0005 | ARCH-0002 | 2024-07-21 |
| ARCH-0006 | ARCH-0006 | ARCH-0002 | 2024-03-16 |
| ARCH-0007 | ARCH-0007 | ARCH-0002 | 2025-02-16 |
| ARCH-0008 | ARCH-0008 | ARCH-0002 | 2024-07-02 |

Controls translate metadata into obligations, and two fields—effective date and mandatory flag—govern when and how strongly those obligations apply. Effective date (`effectivedate`) marks the point from which a control is operative for assessment and enforcement; an anomaly detection limit effective `2025-01-22` is not evaluated against pre-effective behavior, while a data retention mandate effective `2024-12-05` may already bind historical records. The mandatory flag (`ismandatory`) distinguishes hard requirements from recommended practice: a retention mandate marked mandatory must be satisfied for conformance, whereas audit logging standards or non-mandatory anomaly limits may inform risk posture without blocking certification. Observing two anomaly detection limit controls—one mandatory effective `2025-05-27`, another non-mandatory effective `2025-01-22`—illustrates how the same control family can be staged or scoped differently across environments.

**t_control_basic**

| id | control | effective_date | mandatory |
| --- | --- | --- | --- |
| CONT-0001 | Anomaly detection limit | 2025-01-22 | false |
| CONT-0002 | Audit logging standard | 2025-04-27 | false |
| CONT-0003 | Data retention mandate | 2024-12-05 | true |
| CONT-0004 | Anomaly detection limit | 2025-05-27 | true |
| CONT-0005 | PII masking policy | 2025-02-05 | false |
| CONT-0006 | Rate limiting rule | 2023-06-05 | false |
| CONT-0007 | Checksum verification rule | 2024-10-11 | false |

Equivalence and restriction structures connect abstract controls to the entities and assets they regulate. Restriction records pair logical equivalences—`telemetry_stream_alpha` with `ml_model_checkpoint`, or `lab_assay_batch` with related sensor infrastructure—against control identifiers such as `CONT-0001` or `CONT-0004`, often with secondary related assets (`pressure_transducer`, `inference_dataset`) that narrow applicability. That linkage closes the loop between identifier-anchored entities, typed attribute assertions, and dated, mandatory controls: an artifact’s checksum, license, and creation date establish what it is; restriction mappings establish which policies attach; effective dates and mandatory flags establish when failure to comply constitutes a violation. Operators who master this domain read identifiers as anchors, attributes and types as contracts, misc values as evidentiary claims, and effective date plus mandatory status as the enforcement envelope—together yielding a traceable, time-bounded compliance posture rather than a flat checklist of fields.

**t_equiv_intersect_with_two_restrictions**

| id | equiv | equiv_2 | related | related_2 |
| --- | --- | --- | --- | --- |
| REST-0001 | telemetry_stream_alpha | ml_model_checkpoint | CONT-0007 | inference_dataset |
| REST-0002 | governance_policy_set | sensor_node_array | CONT-0005 | backup_volume |
| REST-0003 | ml_feature_vector | sensor_node_array | CONT-0004 | pressure_transducer |
| REST-0004 | lab_assay_batch | ml_model_checkpoint | CONT-0001 | pressure_transducer |
| REST-0005 | edge_gateway_unit | validation_schema | CONT-0003 | incubator_chamber |
| REST-0006 | batch_pipeline_gamma | sensor_node_array | CONT-0004 | catalog_entry |
| REST-0007 | telemetry_stream_alpha | ml_model_checkpoint | CONT-0007 | inference_dataset |