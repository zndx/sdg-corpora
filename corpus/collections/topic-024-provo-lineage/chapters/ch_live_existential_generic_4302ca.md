---
chapter_id: ch_live_existential_generic_4302ca
topic_id: 24
family: 01_foundation
cited_terms: ['existential_generic', 'identifier_subclass', 'dataset_was_derived_from']
model: engine-refine
---

In distributed data ecosystems, stable identifiers serve as the primary anchors for tracking digital objects across their lifecycle. Rather than relying on mutable names or transient references, systems assign persistent handles such as `HANDLE-1234/5678`, `SEQ-NF2024`, `SN-8842XJ`, or `ACCN-GSM7829104` that explicitly declare what they identify—whether a `telemetry-stream`, a `calibration-run`, or an archival record. These identifiers function as the foundational nodes in a relational graph, each bound to a concrete entity that persists independently of its representation. By decoupling the handle from the object it references, the architecture ensures that downstream consumers can resolve, version, and audit assets without entangling business logic with naming conventions. The entity, therefore, is not merely a database row but the semantic core that survives schema migrations, pipeline reruns, and cross-system integrations.

**t_identifier_subclass**

| id | identifier | identifies |
| --- | --- | --- |
| IDEN-0001 | HANDLE-1234/5678 | telemetry-stream |
| IDEN-0002 | SEQ-NF2024 | telemetry-stream |
| IDEN-0003 | SN-8842XJ | telemetry-stream |
| IDEN-0004 | ACCN-GSM7829104 | calibration-run |
| IDEN-0005 | RUN-20231105 | wet-lab-sample |
| IDEN-0006 | GUID-f47ac10b | quality-control-report |
| IDEN-0007 | DOI-10.1234/abc | clinical-trial-arm |

**t_dataset_was_derived_from**

| id | dataset |
| --- | --- |
| FROM-0001 | iot_edge_logs |
| FROM-0002 | patient_demographics_clean |
| FROM-0003 | market_index_history |
| FROM-0004 | patient_demographics_clean |
| FROM-0005 | sensor_readings_2023 |
| FROM-0006 | sensor_readings_2023 |

**t_dataset_was_derived_from_was_derived_from**

| id | was_derived_from |
| --- | --- |
| FROM-0001 | raw_sensor_stream |
| FROM-0002 | warehouse_staging_area |
| FROM-0003 | regulatory_filing_pdf |
| FROM-0004 | archival_tape_restore |
| FROM-0005 | external_credit_bureau |
| FROM-0006 | archival_tape_restore |
| FROM-0007 | external_credit_bureau |
| FROM-0008 | external_credit_bureau |

Once an entity is anchored by an identifier, its descriptive and operational properties are captured through a structured attribute system. Each attribute carries a name—such as `checksum_algo`, `code`, `format`, or `issued_date`—and is bound to a strict attr type like `xsd:string` or `xsd:date` that governs validation, storage, and query semantics. Because relational engines optimize for type-specific persistence, string-valued metadata like `Checksum Algo 01`, `B-12`, `Encoding 03`, and `JSON` are stored separately from temporal markers such as `2023-11-13`, `2024-05-25`, `2024-09-11`, and `2025-05-27`. This separation preserves type integrity while allowing heterogeneous metadata to attach flexibly to the same identifier. Within the misc column, these disparate values are uniformly governed by their declared attr type, ensuring that downstream parsers, compliance scanners, and audit tools can interpret them without heuristic guessing.

**t_identifier_subclass_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| IDEN-0001 | checksum_algo | xsd:string |
| IDEN-0002 | code | xsd:string |
| IDEN-0003 | format | xsd:string |
| IDEN-0004 | issued_date | xsd:date |
| IDEN-0005 | namespace | xsd:string |
| IDEN-0006 | encoding | xsd:string |
| IDEN-0007 | label_text | xsd:string |
| IDEN-0008 | language | xsd:string |

**t_identifier_subclass_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| IDEN-0001 | IDEN-0001 | IDEN-0004 | 2023-11-13 |
| IDEN-0002 | IDEN-0002 | IDEN-0004 | 2024-05-25 |
| IDEN-0003 | IDEN-0003 | IDEN-0004 | 2024-09-11 |
| IDEN-0004 | IDEN-0004 | IDEN-0004 | 2025-05-27 |
| IDEN-0005 | IDEN-0005 | IDEN-0004 | 2023-08-09 |
| IDEN-0006 | IDEN-0006 | IDEN-0004 | 2023-03-27 |
| IDEN-0007 | IDEN-0007 | IDEN-0004 | 2023-01-25 |

**t_identifier_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| IDEN-0001 | IDEN-0001 | IDEN-0001 | Checksum Algo 01 |
| IDEN-0002 | IDEN-0001 | IDEN-0002 | B-12 |
| IDEN-0003 | IDEN-0001 | IDEN-0006 | Encoding 03 |
| IDEN-0004 | IDEN-0001 | IDEN-0003 | JSON |
| IDEN-0005 | IDEN-0001 | IDEN-0007 | pre-release note |
| IDEN-0006 | IDEN-0001 | IDEN-0008 | es |
| IDEN-0007 | IDEN-0001 | IDEN-0005 | Namespace 07 |
| IDEN-0008 | IDEN-0002 | IDEN-0001 | Checksum Algo 08 |

Provenance tracking extends this attribute model into relational chains that document how datasets emerge from upstream sources. A derivation event links a subject dataset—such as `iot_edge_logs`, `patient_demographics_clean`, or `market_index_history`—to a target source like `raw_sensor_stream`, `warehouse_staging_area`, `regulatory_filing_pdf`, or `archival_tape_restore`. The relationship is never implicit; it is explicitly qualified by a role that defines the nature of the contribution. When a source acts as an `owner`, it asserts primary custodianship over the lineage; when it functions as a `contributor`, it signals partial or supplementary input. This subject-target-role triad transforms raw data movement into auditable provenance, enabling traceability from final analytical outputs back to their original ingestion points.

**t_dataset_was_derived_from__was_derived_from**

| id | dataset_id | was_derived_from_id | role |
| --- | --- | --- | --- |
| FROM-0001 | FROM-0002 | FROM-0004 | contributor |
| FROM-0002 | FROM-0001 | FROM-0001 | contributor |
| FROM-0003 | FROM-0005 | FROM-0006 | contributor |
| FROM-0004 | FROM-0001 | FROM-0002 | owner |
| FROM-0005 | FROM-0006 | FROM-0006 | owner |
| FROM-0006 | FROM-0003 | FROM-0008 | owner |
| FROM-0007 | FROM-0006 | FROM-0005 | reviewer |
| FROM-0008 | FROM-0004 | FROM-0005 | contributor |

Beyond lineage, the architecture captures existential dependencies that bind operational assets to governance constraints. An existential entity such as `ml-model-v3`, `telemetry-stream-7`, `ingestion-pipeline-5`, or `edge-gateway-19` is explicitly related to compliance frameworks like `compliance-framework-iso`, operational dependencies like `pipeline-dependency-3`, or security controls like `access-policy-admin`. These relationships do not describe data flow but rather runtime and policy dependencies that dictate how systems must behave, what standards they must satisfy, and which controls govern their execution. Together with the identifier-attribute-derivation graph, they form a unified metadata fabric where every asset, its properties, its lineage, and its compliance posture are queryable, versioned, and enforceable.

**t_existential_generic**

| id | existential | related |
| --- | --- | --- |
| GENE-0001 | ml-model-v3 | compliance-framework-iso |
| GENE-0002 | telemetry-stream-7 | pipeline-dependency-3 |
| GENE-0003 | ingestion-pipeline-5 | access-policy-admin |
| GENE-0004 | edge-gateway-19 | pipeline-dependency-3 |
| GENE-0005 | batch-ingest-902 | cloud-storage-prod |
| GENE-0006 | batch-ingest-902 | validation-ruleset-9 |
| GENE-0007 | sensor-node-44 | backup-replication-4 |