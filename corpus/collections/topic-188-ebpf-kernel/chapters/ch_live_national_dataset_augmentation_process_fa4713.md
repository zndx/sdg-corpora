---
chapter_id: ch_live_national_dataset_augmentation_process_fa4713
topic_id: 188
family: 08_derived
cited_terms: ['national_dataset_augmentation_process', 'nist80053_control_subclass', 'nist80053_high_impact']
model: engine-refine
---

The governance of national geospatial data augmentation rests on a tripartite linkage between processes, observation sources, and the datasets they enhance. Each augmentation process—identified by a code such as PROC-0001 through PROC-0004—encapsulates a distinct operational workflow, exemplified by names like DGIWGBase, NRCANMap, TerrainDataMerge, and EuroStatSync. These processes draw upon Copernicus observation sources, including CopernicusLand, CMEMSDataCube, GLO30Coverage, and CopernicusCrisis, to enrich existing national datasets such as SentinelCoreLoad, GADMAdminLevels, CensusMapAlign, and LandCoverSync. The relationship is explicit: a single augmentation process incorporates one observation source and augments one existing dataset, forming a directed chain from raw observation to integrated national product. This structure ensures traceability from the original data source through the transformation process to the resulting augmented dataset, a requirement critical for auditability and data lineage in national geospatial infrastructure.

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

Complementing the geospatial augmentation framework, the NIST 800-53 control subclassing system provides a parallel mechanism for mapping regulatory standards to implementable control identifiers. The control subclass table associates NIST publications—NIST SP 800-53 Rev 5, NIST SP 800-171, NIST CSF 2.0, and NIST SP 800-207—with specific control designations such as AC-3, CM-3, SI-4, and SA-4. This mapping enables organizations to translate high-level regulatory requirements into discrete, auditable control implementations. The identifier scheme (CONT-0001 through CONT-0004) provides a stable reference point for downstream attribute and value associations, ensuring that each control subclass can be independently addressed within the governance framework.

**t_nist80053_control_subclass**

| id | nist | nist80053_control |
| --- | --- | --- |
| CONT-0001 | NIST SP 800-53 Rev 5 | AC-3 |
| CONT-0002 | NIST SP 800-171 | CM-3 |
| CONT-0003 | NIST CSF 2.0 | SI-4 |
| CONT-0004 | NIST SP 800-207 | SA-4 |
| CONT-0005 | FIPS 140-3 | SR-1 |
| CONT-0006 | NIST SP 800-171 | AU-6 |

**t_nist80053_high_impact**

| id | nist |
| --- | --- |
| IMPA-0001 | NIST SP 800-171 |
| IMPA-0002 | NIST SP 800-61 |
| IMPA-0003 | Zero Trust Architecture |
| IMPA-0004 | NIST SP 800-161 |
| IMPA-0005 | Zero Trust Architecture |
| IMPA-0006 | NIST SP 800-171 |

**t_nist80053_high_impact_at_n_i_s_t_impact_level**

| id | at_n_i_s_t_impact_level |
| --- | --- |
| IMPA-0001 | Moderate |
| IMPA-0002 | Tier-4 |
| IMPA-0003 | Severity-Medium |
| IMPA-0004 | Compliance-Low |
| IMPA-0005 | Essential |
| IMPA-0006 | Controlled-High |

The attribute system for NIST control subclasses employs a normalized, type-dispatched value storage pattern that separates schema from data. The attribute definition table declares property names—effective_date, enforcement, mandatory, priority—alongside their corresponding XML Schema data types: xsd:date, xsd:string, xsd:boolean, and xsd:integer. Value storage is partitioned into four type-specific tables, each holding a value column that serves as the misc carrier for heterogeneous data. Boolean values such as true and false populate the boolean value table, where entity identifiers reference the control subclass and attribute identifiers point to the attribute definition (for example, CONT-0003 as the attr_id across multiple rows). Date values like 2023-01-02, 2024-11-29, 2024-03-23, and 2025-03-12 reside in the date value table, while integer values including 3, 776, 4, and 46 occupy the integer value table. String values such as Encoding 01, Enforcement 02, calibration record, and es are stored in the varchar value table. This type-dispatched architecture enforces data integrity at the storage layer while permitting flexible attribute assignment across control subclasses.

**t_nist80053_control_subclass_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| CONT-0001 | effective_date | xsd:date |
| CONT-0002 | enforcement | xsd:string |
| CONT-0003 | mandatory | xsd:boolean |
| CONT-0004 | priority | xsd:integer |
| CONT-0005 | review_cycle_days | xsd:integer |
| CONT-0006 | scope | xsd:string |
| CONT-0007 | encoding | xsd:string |
| CONT-0008 | label_text | xsd:string |

**t_nist80053_control_subclass_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONT-0001 | CONT-0001 | CONT-0003 | true |
| CONT-0002 | CONT-0002 | CONT-0003 | true |
| CONT-0003 | CONT-0003 | CONT-0003 | true |
| CONT-0004 | CONT-0004 | CONT-0003 | false |
| CONT-0005 | CONT-0005 | CONT-0003 | true |
| CONT-0006 | CONT-0006 | CONT-0003 | true |

**t_nist80053_control_subclass_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONT-0001 | CONT-0001 | CONT-0001 | 2023-01-02 |
| CONT-0002 | CONT-0002 | CONT-0001 | 2024-11-29 |
| CONT-0003 | CONT-0003 | CONT-0001 | 2024-03-23 |
| CONT-0004 | CONT-0004 | CONT-0001 | 2025-03-12 |
| CONT-0005 | CONT-0005 | CONT-0001 | 2024-03-19 |
| CONT-0006 | CONT-0006 | CONT-0001 | 2023-10-15 |

**t_nist80053_control_subclass_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONT-0001 | CONT-0001 | CONT-0004 | 3 |
| CONT-0002 | CONT-0001 | CONT-0005 | 776 |
| CONT-0003 | CONT-0002 | CONT-0004 | 4 |
| CONT-0004 | CONT-0002 | CONT-0005 | 46 |
| CONT-0005 | CONT-0003 | CONT-0004 | 1 |
| CONT-0006 | CONT-0003 | CONT-0005 | 151 |
| CONT-0007 | CONT-0004 | CONT-0004 | 4 |
| CONT-0008 | CONT-0004 | CONT-0005 | 507 |

**t_nist80053_control_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONT-0001 | CONT-0001 | CONT-0007 | Encoding 01 |
| CONT-0002 | CONT-0001 | CONT-0002 | Enforcement 02 |
| CONT-0003 | CONT-0001 | CONT-0008 | calibration record |
| CONT-0004 | CONT-0001 | CONT-0009 | es |
| CONT-0005 | CONT-0001 | CONT-0006 | Scope 05 |
| CONT-0006 | CONT-0002 | CONT-0007 | Encoding 06 |
| CONT-0007 | CONT-0002 | CONT-0002 | Enforcement 07 |
| CONT-0008 | CONT-0002 | CONT-0008 | audit excerpt |

High-impact NIST standards are classified through a separate but structurally analogous relationship network. The high-impact table identifies standards of elevated significance—NIST SP 800-171, NIST SP 800-61, Zero Trust Architecture, and NIST SP 800-161—each carrying an associated impact level designation: Moderate, Tier-4, Severity-Medium, and Compliance-Low. The junction table t_nist80053_high_impact__at_n_i_s_t_impact_level resolves the many-to-many relationship between high-impact standards and impact levels, introducing a role attribute that characterizes the nature of each association. Roles such as contributor, reviewer, and observer distinguish between standards that actively shape an impact classification and those that merely reference or observe it. For instance, IMPA-0006 contributes to IMPA-0002, IMPA-0003 both contributes to and reviews IMPA-0003, and IMPA-0002 observes IMPA-0004. This role-enriched relationship model captures the nuanced governance dynamics through which standards interact, enabling precise attribution of influence and accountability within the regulatory framework.

**t_nist80053_high_impact__at_n_i_s_t_impact_level**

| id | nist_id | at_n_i_s_t_impact_level_id | role |
| --- | --- | --- | --- |
| IMPA-0001 | IMPA-0006 | IMPA-0002 | contributor |
| IMPA-0002 | IMPA-0003 | IMPA-0003 | contributor |
| IMPA-0003 | IMPA-0003 | IMPA-0003 | reviewer |
| IMPA-0004 | IMPA-0002 | IMPA-0004 | observer |
| IMPA-0005 | IMPA-0005 | IMPA-0002 | reviewer |
| IMPA-0006 | IMPA-0004 | IMPA-0006 | contributor |
| IMPA-0007 | IMPA-0003 | IMPA-0003 | reviewer |
| IMPA-0008 | IMPA-0001 | IMPA-0001 | reviewer |