---
chapter_id: ch_live_classification_basic_3278f2
topic_id: 91
family: 03_directive_governance
cited_terms: ['classification_basic', 'electricity_usage_pattern_record', 'subclass_not_basic']
model: engine-refine
---

In operational data architectures, the integrity of cross-entity relationships depends upon a disciplined separation between the entities themselves and the metadata that governs how they interact. Every operational artifact receives a stable identifier—`CLAS-0001` through `CLAS-0004` for classification records, `RECO-0001` through `RECO-0004` for usage pattern records, and `NOT-0001` through `NOT-0004` for subclass entries—ensuring that downstream associations can be resolved without ambiguity. These identifiers anchor the entire relationship graph, appearing as both primary keys in entity tables and as foreign references in association tables where the same record may participate in multiple relationship contexts simultaneously. A single usage pattern record such as `SmartMeter-8842` (identified as `RECO-0002`) can thus be referenced across tariff mappings, service category assignments, and classification linkages without any risk of conflation.

The phase and triggered_by attributes together define the operational lifecycle of a classification record, establishing when and why a given classification becomes active. Classifications such as `sensor calibration`, `data validation`, and `pipeline orchestration` are not static labels; they transition through discrete phases—`execution` or `review`—and are activated by specific triggers including `schedule`, `manual`, and `retry`. The classification `sensor calibration` appears in both `execution` and `review` phases, triggered respectively by `schedule` and `manual` intervention, which indicates that the same classification can be re-entered into the lifecycle under different conditions. This dual-phase treatment is essential for auditability: an operator can distinguish between a classification that was automatically activated by a recurring schedule and one that was manually escalated for review.

Usage pattern records serve as the central aggregation point for electricity consumption metadata, capturing identifiers such as `BaseLoad-Res09`, `SmartMeter-8842`, `CommHVAC-15`, and their associated service usage categories. The service usage category—values including `RuralCoopDist`, `DataCenterIT`, `IndustrialProcess`, and `ResidentialGeneral`—provides the domain context for each consumption record, enabling downstream systems to route, price, and analyze usage data according to sector-specific rules. A record like `CommHVAC-15` maps to the `IndustrialProcess` category, while `BaseLoad-Res09` aligns with `RuralCoopDist`, and these mappings are not one-to-one: the association table `t_electricity_usage_pattern_record__records_service_category` permits a single usage pattern record to relate to multiple service categories, each with its own role designation. The role attribute—taking values such as `reviewer`, `owner`, and `observer`—specifies the functional relationship between the usage pattern record and the service category, so that `RECO-0004` may act as `owner` of one category while serving as `reviewer` of another.

**t_electricity_usage_pattern_record**

| id | usage_pattern_record |
| --- | --- |
| RECO-0001 | BaseLoad-Res09 |
| RECO-0002 | SmartMeter-8842 |
| RECO-0003 | CommHVAC-15 |
| RECO-0004 | SmartMeter-8842 |
| RECO-0005 | LoadProfile-77B |
| RECO-0006 | ResNight-22 |

**t_electricity_usage_pattern_record_records_service_category**

| id | records_service_category |
| --- | --- |
| RECO-0001 | RuralCoopDist |
| RECO-0002 | DataCenterIT |
| RECO-0003 | IndustrialProcess |
| RECO-0004 | ResidentialGeneral |
| RECO-0005 | MunicipalLighting |
| RECO-0006 | MunicipalLighting |

**t_electricity_usage_pattern_record__records_service_category**

| id | electricity_id | records_service_category_id | role |
| --- | --- | --- | --- |
| RECO-0001 | RECO-0004 | RECO-0006 | reviewer |
| RECO-0002 | RECO-0001 | RECO-0004 | owner |
| RECO-0003 | RECO-0006 | RECO-0001 | observer |
| RECO-0004 | RECO-0006 | RECO-0006 | owner |
| RECO-0005 | RECO-0005 | RECO-0004 | observer |
| RECO-0006 | RECO-0001 | RECO-0001 | observer |
| RECO-0007 | RECO-0006 | RECO-0003 | owner |
| RECO-0008 | RECO-0004 | RECO-0005 | contributor |

Tariff structure associations follow an analogous pattern but introduce the cardinality_note attribute, which explicitly documents the multiplicity constraints of the relationship. Usage pattern records correspond to tariff structures such as `RealTimeWholesale` and `CriticalPeakReward`, and the association table `t_electricity_usage_pattern_record__corresponds_to_tariff` records not only the subject-target pairing but also the role (e.g., `contributor` or `observer`) and a cardinality note—`Cardinality Note 01` through `Cardinality Note 04`—that constrains how many tariff structures may apply to a given usage pattern record and vice versa. The record `RECO-0001` maps to tariff `RECO-0003` with the role `observer` and cardinality note `Cardinality Note 04`, while `RECO-0004` participates in two distinct tariff associations: one as `contributor` to `RECO-0001` under `Cardinality Note 02`, and another as `observer` of `RECO-0008` under `Cardinality Note 03`. This explicit cardinality documentation prevents ambiguous many-to-many interpretations and provides operators with a machine-readable contract for relationship multiplicity.

**t_electricity_usage_pattern_record_corresponds_to_tariff**

| id | corresponds_to_tariff |
| --- | --- |
| RECO-0001 | RealTimeWholesale |
| RECO-0002 | RealTimeWholesale |
| RECO-0003 | CriticalPeakReward |
| RECO-0004 | RealTimeWholesale |
| RECO-0005 | RealTimeWholesale |
| RECO-0006 | BasicServicePlan |
| RECO-0007 | TieredResidential |
| RECO-0008 | RealTimeWholesale |

**t_electricity_usage_pattern_record__corresponds_to_tariff**

| id | electricity_id | corresponds_to_tariff_id | role | cardinality_note |
| --- | --- | --- | --- | --- |
| RECO-0001 | RECO-0006 | RECO-0002 | contributor | Cardinality Note 01 |
| RECO-0002 | RECO-0004 | RECO-0001 | contributor | Cardinality Note 02 |
| RECO-0003 | RECO-0004 | RECO-0008 | observer | Cardinality Note 03 |
| RECO-0004 | RECO-0001 | RECO-0003 | observer | Cardinality Note 04 |
| RECO-0005 | RECO-0002 | RECO-0002 | observer | Cardinality Note 05 |
| RECO-0006 | RECO-0005 | RECO-0001 | contributor | Cardinality Note 06 |
| RECO-0007 | RECO-0006 | RECO-0005 | observer | Cardinality Note 07 |
| RECO-0008 | RECO-0006 | RECO-0001 | reviewer | Cardinality Note 08 |

The subclass table `t_subclass_not_basic` extends the classification hierarchy with its own identifier space (`NOT-0001` through `NOT-0004`) and two attribute columns (`not` and `not_2`), providing a mechanism for granular sub-classification that operates independently of the basic classification table. While the basic classification table captures the primary operational context—what is being classified, in which phase, and by what trigger—the subclass table allows for secondary attributes that refine or qualify the classification without altering the primary record. This separation of concerns ensures that the core classification lifecycle remains stable even as subclass attributes evolve, and it enables systems to query or filter on subclass criteria without joining back to the primary classification table.

**t_classification_basic**

| id | classification | phase | triggered_by |
| --- | --- | --- | --- |
| CLAS-0001 | sensor calibration | execution | schedule |
| CLAS-0002 | data validation | review | manual |
| CLAS-0003 | pipeline orchestration | execution | schedule |
| CLAS-0004 | sensor calibration | review | retry |
| CLAS-0005 | data ingestion | execution | event |
| CLAS-0006 | batch processing | review | retry |

**t_subclass_not_basic**

| id | not | not_2 |
| --- | --- | --- |
| NOT-0001 | Not 01 | Not 2 01 |
| NOT-0002 | Not 02 | Not 2 02 |
| NOT-0003 | Not 03 | Not 2 03 |
| NOT-0004 | Not 04 | Not 2 04 |
| NOT-0005 | Not 05 | Not 2 05 |
| NOT-0006 | Not 06 | Not 2 06 |