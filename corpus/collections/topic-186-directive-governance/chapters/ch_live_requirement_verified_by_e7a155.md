---
chapter_id: ch_live_requirement_verified_by_e7a155
topic_id: 186
family: 03_directive_governance
cited_terms: ['requirement_verified_by', 'national_dataset_augmentation_process', 'artifact_max_one_owner']
model: engine-refine
---

Within the governance framework, every resource is anchored by a structured identifier system that distinguishes verification records, augmentation processes, and artifact ownership entries through prefixed codes such as VERI-0001, PROC-0001, and OWNE-0001. These identifiers serve as the primary keys for entities—discrete records that represent obligations, data transformations, or asset assignments. An entity may denote a compliance requirement like a data retention policy or a compliance baseline, a national dataset augmentation process such as DGIWGBase or NRCANMap, or a software artifact like telemetry-archive-2023, etl-transform-stable, and ml-inference-v2.1. The entity concept provides the relational anchor around which attributes, relationships, and values are organized, ensuring that every piece of metadata can be traced back to a specific governance object.

**t_requirement_verified_by**

| id | requirement |
| --- | --- |
| VERI-0001 | Data retention policy |
| VERI-0002 | Compliance baseline |
| VERI-0003 | Data retention policy |
| VERI-0004 | Data retention policy |
| VERI-0005 | Audit logging mandate |
| VERI-0006 | Provenance tracking spec |

**t_requirement_verified_by_verified_by**

| id | verified_by |
| --- | --- |
| VERI-0001 | Automated scanner |
| VERI-0002 | Lab director |
| VERI-0003 | Internal audit team |
| VERI-0004 | System validator |
| VERI-0005 | Automated scanner |
| VERI-0006 | Automated scanner |

**t_national_dataset_augmentation_process**

| id | national_dataset_augmentation_process | incorporates_observation_source | augments_existing_dataset |
| --- | --- | --- | --- |
| PROC-0001 | DGIWGBase | CopernicusLand | SentinelCoreLoad |
| PROC-0002 | NRCANMap | CMEMSDataCube | GADMAdminLevels |
| PROC-0003 | TerrainDataMerge | GLO30Coverage | CensusMapAlign |
| PROC-0004 | EuroStatSync | CopernicusCrisis | LandCoverSync |
| PROC-0005 | CensusMapAlign | CMEMSDataCube | CensusMapAlign |
| PROC-0006 | DGIWGBase | CopernicusCrisis | GADMAdminLevels |
| PROC-0007 | LandCoverSync | CAMSReanalysis | GADMv32 |

**t_artifact_max_one_owner**

| id | artifact | owner |
| --- | --- | --- |
| OWNE-0001 | telemetry-archive-2023 | VERI-0005 |
| OWNE-0002 | etl-transform-stable | VERI-0006 |
| OWNE-0003 | etl-transform-stable | VERI-0005 |
| OWNE-0004 | ml-inference-v2.1 | VERI-0003 |
| OWNE-0005 | ml-inference-v2.1 | VERI-0004 |
| OWNE-0006 | etl-transform-stable | VERI-0006 |

**t_artifact_max_one_owner_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OWNE-0001 | OWNE-0001 | OWNE-0002 | 2023-04-04 |
| OWNE-0002 | OWNE-0002 | OWNE-0002 | 2025-04-14 |
| OWNE-0003 | OWNE-0003 | OWNE-0002 | 2024-04-27 |
| OWNE-0004 | OWNE-0004 | OWNE-0002 | 2025-03-27 |
| OWNE-0005 | OWNE-0005 | OWNE-0002 | 2025-06-10 |
| OWNE-0006 | OWNE-0006 | OWNE-0002 | 2023-03-24 |

**t_artifact_max_one_owner_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OWNE-0001 | OWNE-0001 | OWNE-0006 | 427 |
| OWNE-0002 | OWNE-0001 | OWNE-0008 | 2 |
| OWNE-0003 | OWNE-0002 | OWNE-0006 | 401 |
| OWNE-0004 | OWNE-0002 | OWNE-0008 | 12 |
| OWNE-0005 | OWNE-0003 | OWNE-0006 | 38 |
| OWNE-0006 | OWNE-0003 | OWNE-0008 | 7 |
| OWNE-0007 | OWNE-0004 | OWNE-0006 | 393 |
| OWNE-0008 | OWNE-0004 | OWNE-0008 | 7 |

**t_artifact_max_one_owner_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OWNE-0001 | OWNE-0001 | OWNE-0001 | c0ffee42 |
| OWNE-0002 | OWNE-0001 | OWNE-0003 | ARN:res/41 |
| OWNE-0003 | OWNE-0001 | OWNE-0004 | MIT |
| OWNE-0004 | OWNE-0001 | OWNE-0009 | rack-7 |
| OWNE-0005 | OWNE-0001 | OWNE-0005 | application/octet-stream |
| OWNE-0006 | OWNE-0001 | OWNE-0010 | Name 06 |
| OWNE-0007 | OWNE-0001 | OWNE-0011 | sre |
| OWNE-0008 | OWNE-0001 | OWNE-0012 | Tags 08 |

Attributes and their types form the extensible property system that describes entities without requiring schema changes. The attr column defines property names such as checksum, created_date, identifier, and license, while attr_type assigns a formal data type from standards like xsd:string, xsd:date, and cco:DesignativeICE. This separation of attribute definition from value storage enables heterogeneous data to be managed uniformly. Attribute values are stored across specialized value tables distinguished by type: date values such as 2023-04-04, 2025-04-14, 2024-04-27, and 2025-03-27 reside in the date value table; integer values like 427, 2, 401, and 12 in the integer value table; and string values including c0ffee42, ARN:res/41, MIT, and rack-7 in the varchar value table. The misc column serves as the generic value carrier across these tables, holding whatever content is appropriate to the attribute's declared type.

The national dataset augmentation process table models how geospatial and statistical datasets are enriched through defined transformation workflows. Each augmentation process—such as DGIWGBase, NRCANMap, TerrainDataMerge, and EuroStatSync—specifies both the observation source it incorporates and the existing dataset it augments. Observation sources drawn from the Copernicus program include CopernicusLand, CMEMSDataCube, GLO30Coverage, and CopernicusCrisis, reflecting the framework's integration with European Earth observation and crisis monitoring services. The target datasets being augmented include SentinelCoreLoad, GADMAdminLevels, CensusMapAlign, and LandCoverSync, demonstrating how raw observational feeds are merged into operational national datasets. This structure makes the lineage of every augmented dataset explicit, documenting which Copernicus observation source contributed to which existing national dataset through which augmentation process.

Relationships between entities are expressed through subject-target pairs annotated with a role, establishing who or what is responsible for what. In the verification linkage table, the subject column (requirement_id) references a compliance requirement while the target column (verified_by_id) references the verifying entity, and the role column classifies the relationship as owner, observer, or reviewer. For example, requirement VERI-0006 is linked to verifier VERI-0006 with the role of owner, while VERI-0002 connects to VERI-0003 as an observer. The verification records themselves map to concrete verification methods: Automated scanner, Lab director, Internal audit team, and System validator. This role-based relationship model ensures that accountability is explicit and queryable, distinguishing between those who own a requirement, those who review it, and those who merely observe its status.

**t_requirement_verified_by__verified_by**

| id | requirement_id | verified_by_id | role |
| --- | --- | --- | --- |
| VERI-0001 | VERI-0006 | VERI-0006 | owner |
| VERI-0002 | VERI-0002 | VERI-0003 | observer |
| VERI-0003 | VERI-0004 | VERI-0006 | reviewer |
| VERI-0004 | VERI-0003 | VERI-0005 | observer |
| VERI-0005 | VERI-0004 | VERI-0001 | owner |
| VERI-0006 | VERI-0004 | VERI-0002 | owner |
| VERI-0007 | VERI-0001 | VERI-0002 | reviewer |
| VERI-0008 | VERI-0004 | VERI-0001 | observer |

Artifact ownership extends this relationship model to software and data assets. The artifact_max_one_owner table assigns each artifact to a single owner identified by a verification record ID, creating a direct link between asset custody and the governance framework's verification entities. Artifacts such as telemetry-archive-2023, etl-transform-stable, and ml-inference-v2.1 are each owned by specific verifiers (VERI-0005, VERI-0006, VERI-0003), tying operational assets to compliance accountability. The attribute system then enriches these ownership records with typed metadata—checksums as strings, creation dates, designative identifiers, and license information—allowing the framework to track not just who owns an artifact but its technical properties and legal terms. Together, these tables form a cohesive governance model where identifiers anchor entities, attributes describe them, relationships assign responsibility, and value tables store the concrete data that makes the framework operational.

**t_artifact_max_one_owner_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| OWNE-0001 | checksum | xsd:string |
| OWNE-0002 | created_date | xsd:date |
| OWNE-0003 | identifier | cco:DesignativeICE |
| OWNE-0004 | license | xsd:string |
| OWNE-0005 | mime_type | xsd:string |
| OWNE-0006 | size_bytes | xsd:long |
| OWNE-0007 | uri | xsd:string |
| OWNE-0008 | version | xsd:integer |