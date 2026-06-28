---
chapter_id: ch_live_outlier_claim_has_confidence_eb0853
topic_id: 124
family: 02_observation_measurement
cited_terms: ['outlier_claim_has_confidence', 'dataset_subclass', 'agent_identified_by_uri']
model: engine-refine
---

In governed data architectures, the attr (attribute) and its corresponding attr type form the foundational descriptors of an entity, while identifier, location, misc, and owner establish the traceability, placement, contextual metadata, and stewardship required for operational compliance. Attributes constitute the primary mechanism for capturing observable properties, and their attr types enforce the semantic and technical boundaries that govern storage, validation, and query execution. Each attribute is formally bound to a canonical type—xsd:decimal for quantitative measurements, xsd:string for categorical or textual descriptors, and xsd:dateTime for temporal markers—which ensures type safety across heterogeneous ingestion pipelines. A confidence metric, for example, is persisted as a decimal value such as 0.904 or 369.80, whereas a recording timestamp is strictly constrained to an ISO 8601 format like 2023-06-24T17:04:07. This typed partitioning prevents schema drift and enables downstream systems to apply appropriate serialization, indexing, and constraint logic without runtime coercion. When an attribute such as dimension_kind or method is declared as a string, it accommodates enumerated or free-form values like Dimension Kind 01 or Encoding 02, preserving human-readable context while maintaining structural predictability.

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

**t_dataset_subclass**

| id | dataset | column | location | name |
| --- | --- | --- | --- | --- |
| DATA-0001 | sensor_telemetry_q4 | latency_ms | eu-west-3 | IoT Device Inventory |
| DATA-0002 | iot_device_registry | sensor_id | rack-7 | Supply Chain Manifest |
| DATA-0003 | financial_ledger_jan | patient_id | rack-7 | Genomic Variant Registry |
| DATA-0004 | iot_device_registry | device_mac | us-east-1 | Geo Spatial Raster Map |
| DATA-0005 | compliance_audit_log | geo_lat | us-east-1 | Supply Chain Manifest |
| DATA-0006 | network_traffic_capture | temperature_c | rack-7 | IoT Device Inventory |
| DATA-0007 | network_traffic_capture | temperature_c | on-prem-dc1 | Financial Ledger Q1 |
| DATA-0008 | financial_ledger_jan | patient_id | eu-west-3 | Clinical Vitals Archive |

**t_agent_identified_by_uri**

| id | agent | identified_by_u_r_i | identifier | owner |
| --- | --- | --- | --- | --- |
| URI-0001 | weather-station-alpha | ark:/13030/n8yy3r | ref-8842 | data-engineering |
| URI-0002 | compliance-audit-bot | ark:/13030/n8yy3r | ARN:res/41 | ml-infra |
| URI-0003 | genomics-lab-director | urn:isbn:978316148 | urn:uuid:9f2a | ml-infra |
| URI-0004 | edge-device-gateway | urn:isbn:978316148 | ARN:res/41 | ml-infra |
| URI-0005 | genomics-lab-director | doi:10.5281/zenodo | urn:uuid:9f2a | analytics |
| URI-0006 | edge-device-gateway | doi:10.5281/zenodo | doi:10.1109/x | sre |
| URI-0007 | cern-alice-analysis | urn:isbn:978316148 | urn:uuid:9f2a | sre |

Entities represent the discrete subjects of observation, management, or transaction, and they are rendered traceable through a layered identifier architecture that supports both internal resolution and cross-system interoperability. Each entity is assigned a scoped internal key—CONF-0001 through CONF-0004 for outlier claims, DATA-0001 through DATA-0004 for dataset subclasses, and URI-0001 through URI-0004 for agent registrations—which anchors attribute assignments and value records to a consistent namespace. Beyond internal keys, persistent identifiers provide globally resolvable references that survive infrastructure migrations and organizational restructurings. Agents such as weather-station-alpha or compliance-audit-bot are linked to archival URIs like ark:/13030/n8yy3r, while resources may carry ARN:res/41 for cloud-native routing, urn:isbn:978316148 for bibliographic or regulatory alignment, or urn:uuid:9f2a for decentralized generation. This multi-tiered identification strategy ensures that every attribute value, regardless of its originating system, can be unambiguously attributed to its parent entity and traced through its full lifecycle.

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

Location serves as the infrastructural and jurisdictional anchor for data assets, establishing the physical or logical placement that dictates latency characteristics, data residency obligations, and fault-domain boundaries. In regulated environments, location is not merely a routing hint but a compliance-critical attribute that must be explicitly declared alongside dataset and column definitions. Telemetry streams such as sensor_telemetry_q4 or registry tables like iot_device_registry are bound to specific regions or racks—eu-west-3, rack-7, or us-east-1—ensuring that data processing pipelines respect sovereignty constraints and network topology. When a column such as latency_ms or device_mac is associated with a location, the system can enforce placement-aware indexing, replicate data according to proximity rules, and generate audit trails that satisfy regulatory requirements for data provenance and geographic containment. This spatial anchoring transforms abstract records into physically accountable assets.

Ownership establishes the stewardship chain that assigns accountability for data quality, access control, and lifecycle management. Rather than treating ownership as a static label, modern governance frameworks bind it to the agents and resources that interact with the data, creating a verifiable lineage from ingestion to archival. Teams such as data-engineering or ml-infra are explicitly registered as owners of specific agents—compliance-audit-bot, genomics-lab-director, or edge-device-gateway—linking operational responsibility to technical identity. This association enables granular policy enforcement, where access permissions, retention schedules, and anomaly-handling workflows are inherited from the owner entity. When an outlier claim exhibits a power fluctuation or calibration drift, the assigned owner determines whether the anomaly triggers an automated flag, requires manual review, or demands expert verification, thereby closing the loop between detection, attribution, and remediation.

Miscellaneous contextual values capture the operational nuance that rigid schemas cannot accommodate, providing a structured yet flexible repository for rationales, language codes, categorical tags, and procedural annotations. Fields designated for misc storage hold entries such as change rationale or fr, allowing analysts to embed domain-specific metadata without altering the underlying type system. These values complement the typed attributes and location bindings by supplying the explanatory layer necessary for auditability and reproducibility. Together, attr, attr type, entity, identifier, location, misc, and owner form a cohesive metadata fabric that transforms raw telemetry, registry records, and transactional logs into governed, traceable, and actionable assets. By enforcing strict typing, persistent identification, geographic anchoring, and explicit stewardship, this architecture ensures that every data point carries its own provenance, compliance posture, and operational intent.