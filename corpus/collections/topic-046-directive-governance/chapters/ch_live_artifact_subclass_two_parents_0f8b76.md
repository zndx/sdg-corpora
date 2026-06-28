---
chapter_id: ch_live_artifact_subclass_two_parents_0f8b76
topic_id: 46
family: 01_foundation
cited_terms: ['artifact_subclass_two_parents', 'third_party_data_sharing', 'social_enterprise_annual_income']
model: engine-refine
---

Artifact lineage and provenance are captured through a dual-parent relationship model that records how composite artifacts derive from two distinct upstream sources. Each record carries a stable identifier such as `PARE-0001` and references two artifact parents—for instance, `streaming-window-5min` and `ingestion-script-v2`—alongside a resolvable identifier like `doi:10.1109/x` or `urn:uuid:9f2a` that anchors the composite to external registries. Classification tags such as `verified`, `pii`, and `internal` provide lightweight governance metadata, enabling downstream systems to filter or restrict access based on sensitivity and audit status. This structure supports traceability across complex data pipelines where artifacts inherit characteristics from multiple predecessors, a common pattern in streaming analytics and model training workflows where both the data transformation and the model checkpoint must be tracked together.

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

Third-party data sharing arrangements are modeled as explicit relationships between a sharing agreement and its participating entities. Agreements such as `PartnerAnalyticsBridge` and `GeospatialInfoExchange` are linked to organizational participants including `RegionalHealthNetwork`, `AcmeAnalyticsCorp`, `FinServDataHub`, and `GlobalLogisticsInc`, forming a clear audit trail of which parties are involved in each data exchange. The same agreement name can appear across multiple records with different participants, reflecting that a single data-sharing framework may govern several bilateral relationships. This design separates the policy or agreement definition from its instantiation with specific partners, allowing governance teams to reason about sharing obligations at both the agreement level and the participant level.

**t_third_party_data_sharing**

| id | third_party_data_sharing | has_participant |
| --- | --- | --- |
| SHAR-0001 | PartnerAnalyticsBridge | RegionalHealthNetwork |
| SHAR-0002 | GeospatialInfoExchange | AcmeAnalyticsCorp |
| SHAR-0003 | GeospatialInfoExchange | FinServDataHub |
| SHAR-0004 | GeospatialInfoExchange | GlobalLogisticsInc |
| SHAR-0005 | IoTSensorDataBridge | AutoOEMDataTeam |
| SHAR-0006 | ResearchCollabDataFlow | TelecomPartnerOps |

Social enterprise income records serve as the central entity around which a rich set of attributes is organized. Enterprises such as `BrightFuture Learning`, `Sustainable Harvest Fund`, and `Urban Harvest Co-op` are each assigned a unique identifier like `INCO-0001` and can carry multiple measured or descriptive attributes. The attribute schema itself is defined in a separate registry where each attribute has a name and a typed definition—for example, `confidence` mapped to `xsd:decimal`, `dimension_kind` to `xsd:string`, `method` to `xsd:string`, and `recorded_at` to `xsd:dateTime`. This separation of attribute metadata from attribute values enables flexible schema evolution without requiring structural changes to the value storage layer.

**t_social_enterprise_annual_income**

| id | social_enterprise_annual_income |
| --- | --- |
| INCO-0001 | BrightFuture Learning |
| INCO-0002 | Sustainable Harvest Fund |
| INCO-0003 | Urban Harvest Co-op |
| INCO-0004 | Urban Harvest Co-op |
| INCO-0005 | CleanTech Ventures |
| INCO-0006 | FairTrade Roots |

**t_social_enterprise_annual_income_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| INCO-0001 | confidence | xsd:decimal |
| INCO-0002 | dimension_kind | xsd:string |
| INCO-0003 | method | xsd:string |
| INCO-0004 | recorded_at | xsd:dateTime |
| INCO-0005 | uncertainty | xsd:decimal |
| INCO-0006 | unit | xsd:string |
| INCO-0007 | value | xsd:decimal |
| INCO-0008 | encoding | xsd:string |

**t_social_enterprise_annual_income_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| INCO-0001 | INCO-0001 | INCO-0004 | 2024-11-16T11:00:06 |
| INCO-0002 | INCO-0002 | INCO-0004 | 2025-02-04T05:23:06 |
| INCO-0003 | INCO-0003 | INCO-0004 | 2023-12-18T07:36:57 |
| INCO-0004 | INCO-0004 | INCO-0004 | 2024-08-27T04:35:14 |
| INCO-0005 | INCO-0005 | INCO-0004 | 2023-06-07T02:54:49 |
| INCO-0006 | INCO-0006 | INCO-0004 | 2024-06-20T22:31:31 |

**t_social_enterprise_annual_income_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| INCO-0001 | INCO-0001 | INCO-0001 | 0.063 |
| INCO-0002 | INCO-0001 | INCO-0005 | 21.38 |
| INCO-0003 | INCO-0001 | INCO-0007 | 997.65 |
| INCO-0004 | INCO-0002 | INCO-0001 | 0.705 |
| INCO-0005 | INCO-0002 | INCO-0005 | 716.05 |
| INCO-0006 | INCO-0002 | INCO-0007 | 442.00 |
| INCO-0007 | INCO-0003 | INCO-0001 | 0.150 |
| INCO-0008 | INCO-0003 | INCO-0005 | 767.65 |

**t_social_enterprise_annual_income_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| INCO-0001 | INCO-0001 | INCO-0002 | Dimension Kind 01 |
| INCO-0002 | INCO-0001 | INCO-0008 | Encoding 02 |
| INCO-0003 | INCO-0001 | INCO-0009 | change rationale |
| INCO-0004 | INCO-0001 | INCO-0010 | fr |
| INCO-0005 | INCO-0001 | INCO-0003 | automated |
| INCO-0006 | INCO-0001 | INCO-0006 | deg_C |
| INCO-0007 | INCO-0002 | INCO-0002 | Dimension Kind 07 |
| INCO-0008 | INCO-0002 | INCO-0008 | Encoding 08 |

Attribute values are materialized across three type-specific tables that implement a typed Entity-Attribute-Value pattern. Decimal-valued attributes such as `confidence` store numeric measurements like `0.063`, `21.38`, `997.65`, and `0.705` in a dedicated decimal table, while string-valued attributes such as `dimension_kind` hold values like `Dimension Kind 01`, `Encoding 02`, `change rationale`, and `fr` in a varchar table. Timestamp attributes like `recorded_at` are stored in a separate datetime table with values such as `2024-11-16T11:00:06` and `2025-02-04T05:23:06`. Each value row references both the entity it belongs to and the attribute definition it satisfies, ensuring that every measurement is traceable to its semantic definition and its source enterprise. This typed value partitioning avoids the pitfalls of untyped EAV stores by enforcing type safety at the storage level while preserving the flexibility to add new attributes without schema migrations.