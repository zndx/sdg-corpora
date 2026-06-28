---
chapter_id: ch_live_national_dataset_augmentation_process_95abd2
topic_id: 4
family: 08_derived
cited_terms: ['national_dataset_augmentation_process', 'artifact_either_internal_or_external', 'policy_subclass_governs']
model: engine-refine
---

Within operational data management, every artifact is anchored by a unique identifier that serves as the immutable reference point across the entire lifecycle. The identifier convention—such as EXTE-0001 or EXTE-0004—provides a stable key that links dimensional metadata to factual records, ensuring traceability from ingestion through archival. Dimensional tables attach descriptive labels and categorical classifications to these identifiers, grouping artifacts into coherent families like Artifact Category 01 through Artifact Category 04, each carrying a human-readable label such as Artifact Label 01. The factual layer records the physical and version attributes of each artifact: size in bytes, which can vary dramatically from approximately 43 megabytes (42,978,804 bytes for EXTE-0002) to nearly one gigabyte (996,080,316 bytes for EXTE-0003), and version numbers that track evolution, ranging from version 5 for EXTE-0002 to version 10 for EXTE-0004. This separation of dimensional metadata from factual measurements enables flexible classification without duplicating size or version data across categories.

**fact_artifact**

| id | artifact_key | size_bytes | version |
| --- | --- | --- | --- |
| EXTE-0001 | EXTE-0004 | 123155790 | 6 |
| EXTE-0002 | EXTE-0005 | 42978804 | 5 |
| EXTE-0003 | EXTE-0004 | 996080316 | 5 |
| EXTE-0004 | EXTE-0005 | 597369362 | 10 |
| EXTE-0005 | EXTE-0006 | 12061913 | 9 |
| EXTE-0006 | EXTE-0001 | 792675668 | 5 |

**dim_artifact**

| id | artifact_label | artifact_category |
| --- | --- | --- |
| EXTE-0001 | Artifact Label 01 | Artifact Category 01 |
| EXTE-0002 | Artifact Label 02 | Artifact Category 02 |
| EXTE-0003 | Artifact Label 03 | Artifact Category 03 |
| EXTE-0004 | Artifact Label 04 | Artifact Category 04 |
| EXTE-0005 | Artifact Label 05 | Artifact Category 05 |
| EXTE-0006 | Artifact Label 06 | Artifact Category 06 |

National dataset augmentation processes represent the structured mechanisms by which existing geospatial and statistical datasets are enhanced through the incorporation of external observation sources. Each augmentation process is uniquely identified—PROC-0001 through PROC-0004—and named according to its operational lineage, whether DGIWGBase, NRCANMap, TerrainDataMerge, or EuroStatSync. These processes draw from observation sources such as CopernicusLand, CMEMSDataCube, GLO30Coverage, and CopernicusCrisis, each representing a distinct data provenance that feeds into the augmentation pipeline. The target of augmentation is equally specific: SentinelCoreLoad, GADMAdminLevels, CensusMapAlign, and LandCoverSync are the existing national datasets that receive the enriched data. This three-way relationship—process, source, and target—creates an auditable chain of custody that documents not only what data was added but through what mechanism and from what origin, a critical requirement for regulatory compliance in geospatial data governance.

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

Governance policies establish the priority and review cadence that govern how artifacts and augmentation processes are managed over time. The policy subclass framework assigns each governing policy a priority level from 1 to 5, with priority 1 (as seen in the Containerized Microservices policy) indicating the highest operational urgency, while priority 5 (as assigned to the Data Classification Framework) reflects a lower but still mandatory review frequency. The review cycle, measured in days, determines how frequently the policy's applicability and effectiveness must be reassessed—ranging from 277 days for Production Databases governance to 799 days for High-Performance Clusters. These review cycles are not arbitrary; they reflect the risk profile and regulatory exposure of the governed scope, whether that scope is an Audit Log Preservation Guideline, Containerized Microservices, or other operational domains. The interplay between priority and review cycle creates a risk-weighted governance model where higher-priority policies may have shorter or longer review periods depending on the specific compliance requirements of their scope.

**t_policy_subclass_governs**

| id | policy | governs_scope | priority | review_cycle_days |
| --- | --- | --- | --- | --- |
| GOVE-0001 | High-Performance Clusters | Audit Log Preservation Guideline | 4 | 799 |
| GOVE-0002 | Data Classification Framework | Containerized Microservices | 5 | 632 |
| GOVE-0003 | Containerized Microservices | Audit Log Preservation Guideline | 1 | 507 |
| GOVE-0004 | Production Databases | Containerized Microservices | 4 | 277 |
| GOVE-0005 | Data Classification Framework | Edge Telemetry Nodes | 3 | 143 |
| GOVE-0006 | Audit Log Preservation Guideline | Incident Response Protocol | 5 | 666 |