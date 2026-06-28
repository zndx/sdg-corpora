---
chapter_id: ch_live_profile_has_distribution_ad1253
topic_id: 91
family: 02_observation_measurement
cited_terms: ['profile_has_distribution', 'classification_basic', 'artifact_not_deprecated']
model: engine-refine
---

The foundational registry of operational assets begins with the artifact identifier, a persistent key that anchors every downstream audit trail and compliance checkpoint. Each artifact is formally assigned a category to establish its regulatory scope, with designations such as Artifact Category 01 through Artifact Category 04 delineating distinct handling requirements across the enterprise. The physical footprint of these assets is strictly quantified in size bytes, where measured payloads range from compact 42,978,804-byte records to substantial 996,080,316-byte archives, ensuring that storage quotas and transfer thresholds are enforced without ambiguity. Versioning protocols further govern asset integrity, tracking revisions from initial deployment at version 1 through mature iterations at version 10, while cross-referencing artifact keys like DEPR-0004 and DEPR-0005 maintains continuity across legacy and active deployments. This structured taxonomy guarantees that every binary, configuration bundle, or data payload remains traceable from ingestion through decommissioning.

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

Governance over these assets is operationalized through a rigorous classification framework that maps each item to its appropriate lifecycle stage and authorization pathway. Classifications such as sensor calibration, data validation, and pipeline orchestration dictate the procedural controls applied during each phase of the asset’s tenure. The execution phase demands real-time monitoring and automated safeguards, whereas the review phase introduces manual oversight and compliance verification. These transitions are not arbitrary; they are explicitly triggeredby schedule-based cadences, manual intervention requests, or automated retry mechanisms following system anomalies. By anchoring classification decisions to identifiers like CLAS-0001 through CLAS-0004, the framework ensures that every procedural handoff is logged, auditable, and aligned with organizational risk tolerance.

**t_classification_basic**

| id | classification | phase | triggered_by |
| --- | --- | --- | --- |
| CLAS-0001 | sensor calibration | execution | schedule |
| CLAS-0002 | data validation | review | manual |
| CLAS-0003 | pipeline orchestration | execution | schedule |
| CLAS-0004 | sensor calibration | review | retry |
| CLAS-0005 | data ingestion | execution | event |
| CLAS-0006 | batch processing | review | retry |

Beyond static classification, the system enforces granular control over how assets are distributed and what metadata accompanies them. Distribution profiles—ranging from the Schema Evolution Registry and Anomaly Detection Ruleset to the Schema Validation Profile—govern the routing and transformation logic applied to data streams. These profiles interface with concrete distribution channels such as Kafka Topic Stream, JSON Schema Registry, XML Metadata Archive, and Parquet Dataset, each requiring distinct serialization and validation protocols. To maintain schema integrity across these channels, each attr is rigorously typed: confidence scores are stored as xsd:decimal, categorical descriptors like dimension_kind and method as xsd:string, and temporal markers such as recorded_at as xsd:dateTime. This strict attr type enforcement prevents type coercion errors and ensures that downstream consumers receive data in a predictable, machine-readable format.

**t_profile_has_distribution**

| id | profile | distribution |
| --- | --- | --- |
| DIST-0001 | Schema Evolution Registry | Kafka Topic Stream |
| DIST-0002 | Anomaly Detection Ruleset | JSON Schema Registry |
| DIST-0003 | Schema Validation Profile | XML Metadata Archive |
| DIST-0004 | Schema Evolution Registry | Parquet Dataset |
| DIST-0005 | Data Contract Specification | JSON Schema Registry |
| DIST-0006 | Lineage Tracking Map | Parquet Dataset |

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

The actual metadata values are resolved through an entity-centric resolution model that decouples attribute definitions from their concrete instantiations. Each entity, referenced by identifiers such as DIST-0001 through DIST-0004, carries a suite of misc attributes that capture operational context without bloating the core schema. Decimal measurements like 0.522, 445.38, 68.45, and 0.997 quantify performance thresholds and confidence intervals, while string payloads such as Dimension Kind 01, Encoding 02, nightly summary, and de provide categorical and linguistic context. Temporal attributes are anchored to precise ISO 8601 timestamps—2024-02-01T19:38:09, 2025-05-10T14:15:47, 2024-06-29T13:14:55, and 2025-03-10T08:03:10—enabling exact reproducibility and time-series auditing. This separation of definition from instantiation allows the system to scale attribute storage horizontally while preserving referential integrity.

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

Collectively, these components form a cohesive governance architecture that transforms raw data operations into auditable, policy-driven workflows. The interplay between artifact sizing, version control, classification phases, and typed attribute distributions ensures that every data movement, transformation, and archival action is governed by explicit rules rather than implicit assumptions. When combined with deterministic triggers and entity-resolved value stores, the framework eliminates ambiguity in compliance reporting and accelerates forensic analysis during incident response. Organizations adopting this model achieve deterministic traceability across their data estate, where every byte, timestamp, and revision can be reconstructed, validated, and certified against regulatory standards.