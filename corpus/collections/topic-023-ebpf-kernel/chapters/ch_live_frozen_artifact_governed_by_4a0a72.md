---
chapter_id: ch_live_frozen_artifact_governed_by_4a0a72
topic_id: 23
family: 07_long_tail
cited_terms: ['frozen_artifact_governed_by', 'strategic_commitment', 'histogram_metric_subclass']
model: engine-refine
---

Governance artifacts are captured as immutable snapshots whose identity and metadata are decoupled from their attribute values through a normalized entity-attribute-value architecture. Each governed artifact carries a stable identifier—GOVE-0001 through GOVE-0004 in the observed corpus—and a human-readable designation such as Log-Archive-23Q4, Model-Prod-v4, Q3-2023-Snapshot, or Compliance-09. The attribute schema itself is declared once in a dedicated definition table, where attr_name enumerates the semantic dimensions (effective_date, enforcement, mandatory, priority) and attr_type constrains each to an XML Schema datatype: xsd:date, xsd:string, xsd:boolean, or xsd:integer. This separation of schema from instance data ensures that attribute definitions can evolve independently of the artifacts they describe, while the type declarations enforce value integrity at ingestion time.

**t_frozen_artifact_governed_by**

| id | frozen |
| --- | --- |
| GOVE-0001 | Log-Archive-23Q4 |
| GOVE-0002 | Model-Prod-v4 |
| GOVE-0003 | Q3-2023-Snapshot |
| GOVE-0004 | Compliance-09 |
| GOVE-0005 | Audit-Baseline-2024 |
| GOVE-0006 | Log-Archive-23Q4 |

**t_frozen_artifact_governed_by_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| GOVE-0001 | effective_date | xsd:date |
| GOVE-0002 | enforcement | xsd:string |
| GOVE-0003 | mandatory | xsd:boolean |
| GOVE-0004 | priority | xsd:integer |
| GOVE-0005 | review_cycle_days | xsd:integer |
| GOVE-0006 | scope | xsd:string |
| GOVE-0007 | encoding | xsd:string |
| GOVE-0008 | label_text | xsd:string |

**t_frozen_artifact_governed_by_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| GOVE-0001 | GOVE-0001 | GOVE-0003 | false |
| GOVE-0002 | GOVE-0002 | GOVE-0003 | true |
| GOVE-0003 | GOVE-0003 | GOVE-0003 | false |
| GOVE-0004 | GOVE-0004 | GOVE-0003 | true |
| GOVE-0005 | GOVE-0005 | GOVE-0003 | false |
| GOVE-0006 | GOVE-0006 | GOVE-0003 | false |

**t_frozen_artifact_governed_by_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| GOVE-0001 | GOVE-0001 | GOVE-0001 | 2025-04-28 |
| GOVE-0002 | GOVE-0002 | GOVE-0001 | 2024-02-08 |
| GOVE-0003 | GOVE-0003 | GOVE-0001 | 2024-10-20 |
| GOVE-0004 | GOVE-0004 | GOVE-0001 | 2024-01-16 |
| GOVE-0005 | GOVE-0005 | GOVE-0001 | 2024-06-17 |
| GOVE-0006 | GOVE-0006 | GOVE-0001 | 2024-04-05 |

**t_frozen_artifact_governed_by_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| GOVE-0001 | GOVE-0001 | GOVE-0004 | 1 |
| GOVE-0002 | GOVE-0001 | GOVE-0005 | 718 |
| GOVE-0003 | GOVE-0002 | GOVE-0004 | 5 |
| GOVE-0004 | GOVE-0002 | GOVE-0005 | 330 |
| GOVE-0005 | GOVE-0003 | GOVE-0004 | 4 |
| GOVE-0006 | GOVE-0003 | GOVE-0005 | 316 |
| GOVE-0007 | GOVE-0004 | GOVE-0004 | 5 |
| GOVE-0008 | GOVE-0004 | GOVE-0005 | 796 |

**t_frozen_artifact_governed_by_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| GOVE-0001 | GOVE-0001 | GOVE-0007 | Encoding 01 |
| GOVE-0002 | GOVE-0001 | GOVE-0002 | Enforcement 02 |
| GOVE-0003 | GOVE-0001 | GOVE-0008 | calibration record |
| GOVE-0004 | GOVE-0001 | GOVE-0009 | es |
| GOVE-0005 | GOVE-0001 | GOVE-0006 | Scope 05 |
| GOVE-0006 | GOVE-0002 | GOVE-0007 | Encoding 06 |
| GOVE-0007 | GOVE-0002 | GOVE-0002 | Enforcement 07 |
| GOVE-0008 | GOVE-0002 | GOVE-0008 | nightly summary |

Attribute values are materialized across four parallel value tables, each keyed by a composite of entity_id and attr_id that references the governing artifact and the attribute definition respectively. Boolean attributes resolve to true or false; for instance, the mandatory attribute (attr_id GOVE-0003) evaluates to true for entities GOVE-0002 and GOVE-0004, and false for GOVE-0001 and GOVE-0003. Date attributes store ISO-formatted timestamps such as 2025-04-28, 2024-02-08, 2024-10-20, and 2024-01-16 against the effective_date attribute (attr_id GOVE-0001). Integer attributes carry numeric magnitudes—1, 718, 5, and 330 for priority (attr_id GOVE-0004), and 718 and 330 for a secondary integer dimension (attr_id GOVE-0005). Varchar attributes hold free-form strings including Encoding 01, Enforcement 02, calibration record, and es, distributed across attributes identified as GOVE-0007, GOVE-0002, GOVE-0008, and GOVE-0009. The composite primary key in each value table (id) provides a stable row handle while the foreign keys (entity_id, attr_id) maintain referential integrity to the artifact and attribute definition layers.

The same normalized pattern is replicated for strategic commitments, where the entity layer is populated by identifiers COMM-0001 through COMM-0004 and the attribute schema mirrors the governance artifact definition with identical attr_name and attr_type columns. Strategic commitments are further contextualized by two additional columns in the entity table: pursues_objective, which links each commitment to an organizational objective such as QualityAssurance, RegulatoryCompliance, or RiskMitigation, and supports_stakeholder, which associates the commitment with an external or internal stakeholder including UrbanTransitAuthority, BioGenLabs, AlphaManufacturing, and AtlanticShippingLine. The strategic commitment corpus enumerates commitments such as RenewableEnergyAdoption, CircularEconomyRoadmap, SupplyChainResilienceInitiative, and CybersecurityHardening, each of which inherits the same four-attribute structure (effective_date as xsd:date, enforcement as xsd:string, mandatory as xsd:boolean, priority as xsd:integer) and the same four parallel value tables. Boolean mandatory flags are true for COMM-0001 and COMM-0002 and false for COMM-0003 and COMM-0004; effective_date values span 2024-11-04, 2024-08-07, 2023-08-27, and 2025-05-25; integer priority and secondary dimension values include 2, 663, and 397; and varchar attributes carry Encoding 01, Enforcement 02, change rationale, and es.

**t_strategic_commitment**

| id | strategic_commitment | pursues_objective | supports_stakeholder |
| --- | --- | --- | --- |
| COMM-0001 | RenewableEnergyAdoption | QualityAssurance | UrbanTransitAuthority |
| COMM-0002 | CircularEconomyRoadmap | RegulatoryCompliance | BioGenLabs |
| COMM-0003 | SupplyChainResilienceInitiative | QualityAssurance | AlphaManufacturing |
| COMM-0004 | CybersecurityHardening | RiskMitigation | AtlanticShippingLine |
| COMM-0005 | CybersecurityHardening | TalentAcquisition | FinServePartners |
| COMM-0006 | RenewableEnergyAdoption | MarketExpansion | TechCorpGlobal |

**t_strategic_commitment_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| COMM-0001 | effective_date | xsd:date |
| COMM-0002 | enforcement | xsd:string |
| COMM-0003 | mandatory | xsd:boolean |
| COMM-0004 | priority | xsd:integer |
| COMM-0005 | review_cycle_days | xsd:integer |
| COMM-0006 | scope | xsd:string |
| COMM-0007 | encoding | xsd:string |
| COMM-0008 | label_text | xsd:string |

**t_strategic_commitment_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| COMM-0001 | COMM-0001 | COMM-0003 | true |
| COMM-0002 | COMM-0002 | COMM-0003 | true |
| COMM-0003 | COMM-0003 | COMM-0003 | false |
| COMM-0004 | COMM-0004 | COMM-0003 | false |
| COMM-0005 | COMM-0005 | COMM-0003 | false |
| COMM-0006 | COMM-0006 | COMM-0003 | true |

**t_strategic_commitment_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| COMM-0001 | COMM-0001 | COMM-0001 | 2024-11-04 |
| COMM-0002 | COMM-0002 | COMM-0001 | 2024-08-07 |
| COMM-0003 | COMM-0003 | COMM-0001 | 2023-08-27 |
| COMM-0004 | COMM-0004 | COMM-0001 | 2025-05-25 |
| COMM-0005 | COMM-0005 | COMM-0001 | 2024-04-23 |
| COMM-0006 | COMM-0006 | COMM-0001 | 2025-03-12 |

**t_strategic_commitment_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| COMM-0001 | COMM-0001 | COMM-0004 | 2 |
| COMM-0002 | COMM-0001 | COMM-0005 | 663 |
| COMM-0003 | COMM-0002 | COMM-0004 | 2 |
| COMM-0004 | COMM-0002 | COMM-0005 | 397 |
| COMM-0005 | COMM-0003 | COMM-0004 | 3 |
| COMM-0006 | COMM-0003 | COMM-0005 | 741 |
| COMM-0007 | COMM-0004 | COMM-0004 | 2 |
| COMM-0008 | COMM-0004 | COMM-0005 | 292 |

**t_strategic_commitment_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| COMM-0001 | COMM-0001 | COMM-0007 | Encoding 01 |
| COMM-0002 | COMM-0001 | COMM-0002 | Enforcement 02 |
| COMM-0003 | COMM-0001 | COMM-0008 | change rationale |
| COMM-0004 | COMM-0001 | COMM-0009 | es |
| COMM-0005 | COMM-0001 | COMM-0006 | Scope 05 |
| COMM-0006 | COMM-0002 | COMM-0007 | Encoding 06 |
| COMM-0007 | COMM-0002 | COMM-0002 | Enforcement 07 |
| COMM-0008 | COMM-0002 | COMM-0008 | calibration record |

Metric measurements are organized through a star schema that separates the measured quantity from its categorical classification. The fact table, identified by METR-0001 through METR-0004, records size_bytes as a numeric measure—239,999,637, 652,318,299, 823,666,310, and 194,252,236—alongside a version number (3, 9, 5, 3) and a foreign key metric_kind_key that references the dimension table. The dimension table, keyed by METR-0001 through METR-0004, provides metric_kind_label (Metric Kind Label 01 through Metric Kind Label 04) and metric_kind_category (Metric Kind Category 01 through Metric Kind Category 04), enabling aggregation and filtering of metric facts by their categorical classification. The metric_kind_key column in the fact table takes values such as METR-0005 and METR-0003, indicating that multiple fact rows can reference the same dimension entry, thereby supporting many-to-one cardinality between measurements and their kind classifications.

**fact_histogram**

| id | metric_kind_key | size_bytes | version |
| --- | --- | --- | --- |
| METR-0001 | METR-0005 | 239999637 | 3 |
| METR-0002 | METR-0005 | 652318299 | 9 |
| METR-0003 | METR-0005 | 823666310 | 5 |
| METR-0004 | METR-0003 | 194252236 | 3 |
| METR-0005 | METR-0002 | 858858459 | 12 |
| METR-0006 | METR-0006 | 40060793 | 9 |
| METR-0007 | METR-0007 | 831460623 | 10 |
| METR-0008 | METR-0001 | 408712850 | 1 |

**dim_metric_kind**

| id | metric_kind_label | metric_kind_category |
| --- | --- | --- |
| METR-0001 | Metric Kind Label 01 | Metric Kind Category 01 |
| METR-0002 | Metric Kind Label 02 | Metric Kind Category 02 |
| METR-0003 | Metric Kind Label 03 | Metric Kind Category 03 |
| METR-0004 | Metric Kind Label 04 | Metric Kind Category 04 |
| METR-0005 | Metric Kind Label 05 | Metric Kind Category 05 |
| METR-0006 | Metric Kind Label 06 | Metric Kind Category 06 |
| METR-0007 | Metric Kind Label 07 | Metric Kind Category 07 |