---
chapter_id: ch_live_national_dataset_augmentation_process_bd7e75
topic_id: 136
family: 08_derived
cited_terms: ['national_dataset_augmentation_process', 'equiv_intersect_artifact_with_part', 'claim_basic']
model: engine-refine
---

Data augmentation pipelines for national geospatial datasets rely on a structured taxonomy of processes, observation sources, and target datasets to ensure reproducible enrichment. Each augmentation process—identified by a unique identifier such as PROC-0001 through PROC-0004—is defined by three core references: the national dataset augmentation process itself (for example, DGIWGBase, NRCANMap, TerrainDataMerge, or EuroStatSync), the Copernicus observation source it incorporates (CopernicusLand, CMEMSDataCube, GLO30Coverage, or CopernicusCrisis), and the existing national dataset it augments (SentinelCoreLoad, GADMAdminLevels, CensusMapAlign, or LandCoverSync). This tripartite linkage guarantees that every enrichment action is traceable to its provenance, the data it draws from, and the baseline it modifies, which is essential for auditability and regulatory compliance in national statistical and geospatial infrastructures.

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

At the artifact level, integrity and ownership are enforced through a separate mapping layer that records equivalence relationships between composite artifacts and their constituent parts. Each mapping entry carries a unique identifier (PART-0001 through PART-0004), an equivalence classification such as data_lineage_node, log_pattern_delta, or record_linkage_set, and a reference to the part it decomposes into (CLAI-0001 through CLAI-0004). A checksum—values like c0ffee42, 1a4b6c2d, or a3f9c21e—provides a deterministic fingerprint for verifying that the artifact has not been altered since the mapping was recorded. Ownership is explicitly assigned to teams such as platform-team, governance, or ml-infra, establishing clear accountability for the lifecycle and maintenance of each artifact.

**t_equiv_intersect_artifact_with_part**

| id | equiv | has_part | checksum | owner |
| --- | --- | --- | --- | --- |
| PART-0001 | data_lineage_node | CLAI-0003 | c0ffee42 | platform-team |
| PART-0002 | log_pattern_delta | CLAI-0001 | 1a4b6c2d | platform-team |
| PART-0003 | record_linkage_set | CLAI-0004 | a3f9c21e | governance |
| PART-0004 | data_lineage_node | CLAI-0004 | c0ffee42 | ml-infra |
| PART-0005 | contract_alpha_v2 | CLAI-0001 | 1a4b6c2d | ml-infra |
| PART-0006 | entity_resolution_run | CLAI-0005 | 7b14de08 | analytics |
| PART-0007 | metric_namespace_prod | CLAI-0002 | c0ffee42 | ml-infra |

Claims serve as the primary mechanism for recording assertions about data quality, model performance, and compliance status. Each claim is identified by a claim identifier (CLAI-0001 through CLAI-0004) and carries a human-readable statement—for instance, "Model accuracy below SLA," "Schema version deprecated," or "File checksum matches." These claims are not monolithic; they are decomposed into typed attributes that capture structured metadata alongside the free-text assertion. The attribute schema is defined separately, with each attribute identified by an attr identifier and described by an attr_name (such as confidence, dimension_kind, method, or recorded_at) and an attr_type drawn from the XSD type system (xsd:decimal, xsd:string, xsd:dateTime). This separation of claim text from attribute metadata enables both human-readable reporting and machine-readable validation.

**t_claim_basic**

| id | claim |
| --- | --- |
| CLAI-0001 | Model accuracy below SLA |
| CLAI-0002 | Schema version deprecated |
| CLAI-0003 | Model accuracy below SLA |
| CLAI-0004 | File checksum matches |
| CLAI-0005 | Compliance audit passed |
| CLAI-0006 | Compliance audit passed |

**t_claim_basic_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| CLAI-0001 | confidence | xsd:decimal |
| CLAI-0002 | dimension_kind | xsd:string |
| CLAI-0003 | method | xsd:string |
| CLAI-0004 | recorded_at | xsd:dateTime |
| CLAI-0005 | uncertainty | xsd:decimal |
| CLAI-0006 | unit | xsd:string |
| CLAI-0007 | value | xsd:decimal |
| CLAI-0008 | encoding | xsd:string |

The typed attribute values are stored in dedicated value tables, each specialized for a particular XSD type. Decimal attributes—such as confidence scores or dimensional measurements—are persisted in a decimal value table where each row links an entity (the claim identifier acting as the entity reference) to an attribute and stores a numeric value like 0.443, 443.93, or 0.828. String attributes—capturing values like "Dimension Kind 01," "Encoding 02," "audit excerpt," or locale codes such as "fr"—are stored in a varchar value table with the same entity-to-attribute linkage pattern. Datetime attributes—recording timestamps such as 2025-05-28T11:02:08 or 2024-03-14T10:07:11—are stored in a dedicated datetime value table. The generic value column across these tables is labeled misc, reflecting its role as a type-erased carrier for heterogeneous data that is semantically disambiguated by the attr_type reference.

**t_claim_basic_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CLAI-0001 | CLAI-0001 | CLAI-0004 | 2025-05-28T11:02:08 |
| CLAI-0002 | CLAI-0002 | CLAI-0004 | 2025-04-22T09:44:09 |
| CLAI-0003 | CLAI-0003 | CLAI-0004 | 2025-01-23T06:41:57 |
| CLAI-0004 | CLAI-0004 | CLAI-0004 | 2024-03-14T10:07:11 |
| CLAI-0005 | CLAI-0005 | CLAI-0004 | 2023-08-27T20:51:04 |
| CLAI-0006 | CLAI-0006 | CLAI-0004 | 2025-04-10T08:56:25 |

**t_claim_basic_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CLAI-0001 | CLAI-0001 | CLAI-0001 | 0.443 |
| CLAI-0002 | CLAI-0001 | CLAI-0005 | 443.93 |
| CLAI-0003 | CLAI-0001 | CLAI-0007 | 257.71 |
| CLAI-0004 | CLAI-0002 | CLAI-0001 | 0.828 |
| CLAI-0005 | CLAI-0002 | CLAI-0005 | 729.35 |
| CLAI-0006 | CLAI-0002 | CLAI-0007 | 717.18 |
| CLAI-0007 | CLAI-0003 | CLAI-0001 | 0.004 |
| CLAI-0008 | CLAI-0003 | CLAI-0005 | 534.68 |

**t_claim_basic_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CLAI-0001 | CLAI-0001 | CLAI-0002 | Dimension Kind 01 |
| CLAI-0002 | CLAI-0001 | CLAI-0008 | Encoding 02 |
| CLAI-0003 | CLAI-0001 | CLAI-0009 | audit excerpt |
| CLAI-0004 | CLAI-0001 | CLAI-0010 | fr |
| CLAI-0005 | CLAI-0001 | CLAI-0003 | automated |
| CLAI-0006 | CLAI-0001 | CLAI-0006 | m/s |
| CLAI-0007 | CLAI-0002 | CLAI-0002 | Dimension Kind 07 |
| CLAI-0008 | CLAI-0002 | CLAI-0008 | Encoding 08 |