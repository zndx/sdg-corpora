---
chapter_id: ch_live_carbon_credit_transaction_b3ec9d
topic_id: 58
family: 08_derived
cited_terms: ['carbon_credit_transaction', 'nist80053_moderate_impact', 'measurement_with_op_artifact']
model: engine-refine
---

Carbon credit accounting relies on a rigorous chain of custody that traces financial instruments back to physical mitigation efforts and final purchasers. Each `carboncredittransaction` is anchored by a unique `identifier`—such as `TRAN-0001`—which serves as the primary key for audit trails and regulatory reporting. These identifiers map to standardized transaction codes like `CAR-2023-6677` or `VCS-TRX-8812`, ensuring interoperability across voluntary and compliance markets. The transactional layer explicitly links to its origin through the `carboncreditproject` dimension, binding financial trades to verifiable on-the-ground initiatives like `Iceland-Geothermal`, `Nepal-Afforestation`, or `Brazil-Biochar`. Simultaneously, the `purchasingentity` field captures the acquiring organization, whether a sovereign wealth fund like `Norway-Wealth` or a corporate offset program such as `Maersk-Offsetting`, thereby closing the loop between emission reduction and financial settlement.

**t_carbon_credit_transaction**

| id | carbon_credit_transaction |
| --- | --- |
| TRAN-0001 | CAR-2023-6677 |
| TRAN-0002 | VCS-TRX-8812 |
| TRAN-0003 | GS-TRX-8814 |
| TRAN-0004 | ACR-CC-7721 |
| TRAN-0005 | CARB-2024-3305 |
| TRAN-0006 | CARB-2024-3305 |

**t_carbon_credit_transaction_derives_from_project**

| id | derives_from_project |
| --- | --- |
| TRAN-0001 | Iceland-Geothermal |
| TRAN-0002 | Nepal-Afforestation |
| TRAN-0003 | Brazil-Biochar |
| TRAN-0004 | Nepal-Afforestation |
| TRAN-0005 | Amazonia-REDD |
| TRAN-0006 | Kerala-Mangrove |

**t_carbon_credit_transaction_transferred_to**

| id | transferred_to |
| --- | --- |
| TRAN-0001 | Norway-Wealth |
| TRAN-0002 | AFK-Environmental |
| TRAN-0003 | Orsted-NetZero |
| TRAN-0004 | Maersk-Offsetting |
| TRAN-0005 | Orsted-NetZero |
| TRAN-0006 | AFK-Environmental |

Governance frameworks require precise relationship modeling to prevent double-counting and ensure transparent attribution. Cross-referential mappings utilize a `subject`-to-`target` architecture, where the `subject` denotes the originating record and the `target` indicates the destination or linked entity. The nature of this linkage is formalized through a `role` attribute, which classifies the relationship as `owner`, `contributor`, or `observer`, depending on the stakeholder’s operational or financial involvement. To maintain structural integrity across these mappings, a `cardinality note` field documents multiplicity constraints and relationship rules, ensuring that downstream systems enforce correct one-to-many or many-to-many associations. This explicit role-based routing allows compliance officers to reconstruct exactly how a single project’s output was distributed across multiple transactions and counterparties.

**t_carbon_credit_transaction__transferred_to**

| id | carbon_id | transferred_to_id | role | cardinality_note |
| --- | --- | --- | --- | --- |
| TRAN-0001 | TRAN-0002 | TRAN-0001 | contributor | Cardinality Note 01 |
| TRAN-0002 | TRAN-0005 | TRAN-0003 | owner | Cardinality Note 02 |
| TRAN-0003 | TRAN-0001 | TRAN-0002 | owner | Cardinality Note 03 |
| TRAN-0004 | TRAN-0006 | TRAN-0003 | observer | Cardinality Note 04 |
| TRAN-0005 | TRAN-0004 | TRAN-0001 | reviewer | Cardinality Note 05 |
| TRAN-0006 | TRAN-0001 | TRAN-0004 | observer | Cardinality Note 06 |
| TRAN-0007 | TRAN-0002 | TRAN-0005 | owner | Cardinality Note 07 |
| TRAN-0008 | TRAN-0002 | TRAN-0006 | observer | Cardinality Note 08 |

Operational verification and measurement data are decoupled from transactional records through a flexible attribute system built around the `entity` concept. An `entity` represents a discrete measurement artifact or calibration event, such as a seismic or turbidity assessment, and is associated with specific properties defined as `attr` fields. These attributes—ranging from `confidence` and `dimension_kind` to `method` and `recorded_at`—are strictly typed via `attr type` definitions like `xsd:decimal`, `xsd:string`, and `xsd:dateTime`, which enforce data integrity at the ingestion layer. Actual measurements are stored in type-specific value tables under a `misc` column, allowing the system to accommodate numerical precision, textual metadata, or timestamped records without altering the underlying schema. For instance, a confidence score of `0.340` or a calibration timestamp of `2024-07-05T11:56:13` is preserved exactly as recorded, supporting forensic auditability.

**t_measurement_with_op_artifact**

| id | measurement | about |
| --- | --- | --- |
| ARTI-0001 | Seismic Calibration Unit | IMPA-0007 |
| ARTI-0002 | Seismic Calibration Unit | IMPA-0005 |
| ARTI-0003 | Turbidity Index | IMPA-0003 |
| ARTI-0004 | Seismic Calibration Unit | IMPA-0004 |
| ARTI-0005 | pH Batch Alpha Assay | IMPA-0007 |
| ARTI-0006 | Soil Moisture Profile | IMPA-0003 |

**t_measurement_with_op_artifact_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ARTI-0001 | confidence | xsd:decimal |
| ARTI-0002 | dimension_kind | xsd:string |
| ARTI-0003 | method | xsd:string |
| ARTI-0004 | recorded_at | xsd:dateTime |
| ARTI-0005 | uncertainty | xsd:decimal |
| ARTI-0006 | unit | xsd:string |
| ARTI-0007 | value | xsd:decimal |
| ARTI-0008 | encoding | xsd:string |

**t_measurement_with_op_artifact_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0004 | 2024-07-05T11:56:13 |
| ARTI-0002 | ARTI-0002 | ARTI-0004 | 2024-04-19T15:36:13 |
| ARTI-0003 | ARTI-0003 | ARTI-0004 | 2023-08-09T17:12:55 |
| ARTI-0004 | ARTI-0004 | ARTI-0004 | 2023-08-07T05:21:09 |
| ARTI-0005 | ARTI-0005 | ARTI-0004 | 2024-01-27T15:32:18 |
| ARTI-0006 | ARTI-0006 | ARTI-0004 | 2024-09-24T04:37:52 |

**t_measurement_with_op_artifact_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0001 | 0.340 |
| ARTI-0002 | ARTI-0001 | ARTI-0005 | 723.57 |
| ARTI-0003 | ARTI-0001 | ARTI-0007 | 106.04 |
| ARTI-0004 | ARTI-0002 | ARTI-0001 | 0.434 |
| ARTI-0005 | ARTI-0002 | ARTI-0005 | 258.77 |
| ARTI-0006 | ARTI-0002 | ARTI-0007 | 846.45 |
| ARTI-0007 | ARTI-0003 | ARTI-0001 | 0.917 |
| ARTI-0008 | ARTI-0003 | ARTI-0005 | 397.02 |

**t_measurement_with_op_artifact_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0002 | Dimension Kind 01 |
| ARTI-0002 | ARTI-0001 | ARTI-0008 | Encoding 02 |
| ARTI-0003 | ARTI-0001 | ARTI-0009 | change rationale |
| ARTI-0004 | ARTI-0001 | ARTI-0010 | fr |
| ARTI-0005 | ARTI-0001 | ARTI-0003 | manual |
| ARTI-0006 | ARTI-0001 | ARTI-0006 | m/s |
| ARTI-0007 | ARTI-0002 | ARTI-0002 | Dimension Kind 07 |
| ARTI-0008 | ARTI-0002 | ARTI-0008 | Encoding 08 |

This layered architecture directly supports regulatory alignment and impact assessment. By separating identifiers, relational roles, and typed attributes, the framework enables granular impact tagging against standards such as `SP 800-53` or `SP 800-171`, with impact classifications like `Moderate Threshold` or `System Security Moderate` applied through dedicated mapping layers. The result is a unified data model where financial transactions, project origins, purchaser obligations, and physical measurements coexist within a single traceable graph. Compliance teams can query across these dimensions to verify that every `carboncredittransaction` is backed by a legitimate `carboncreditproject`, properly attributed to a `purchasingentity`, and supported by auditable `attr` values that meet the required `attr type` constraints. This structural discipline transforms fragmented carbon accounting into a verifiable, standards-compliant operational record.

**t_carbon_credit_transaction__derives_from_project**

| id | carbon_id | derives_from_project_id | role |
| --- | --- | --- | --- |
| TRAN-0001 | TRAN-0002 | TRAN-0005 | owner |
| TRAN-0002 | TRAN-0006 | TRAN-0003 | contributor |
| TRAN-0003 | TRAN-0003 | TRAN-0005 | contributor |
| TRAN-0004 | TRAN-0001 | TRAN-0005 | contributor |
| TRAN-0005 | TRAN-0002 | TRAN-0002 | contributor |
| TRAN-0006 | TRAN-0004 | TRAN-0003 | contributor |
| TRAN-0007 | TRAN-0003 | TRAN-0003 | owner |
| TRAN-0008 | TRAN-0006 | TRAN-0006 | reviewer |

**t_nist80053_moderate_impact**

| id | nist |
| --- | --- |
| IMPA-0001 | SP 800-53 |
| IMPA-0002 | SP 800-53 |
| IMPA-0003 | SP 800-171 |
| IMPA-0004 | SP 800-218 |
| IMPA-0005 | NIST AI RMF |
| IMPA-0006 | SP 800-171 |
| IMPA-0007 | SP 800-37 |

**t_nist80053_moderate_impact_at_n_i_s_t_impact_level**

| id | at_n_i_s_t_impact_level |
| --- | --- |
| IMPA-0001 | Moderate Threshold |
| IMPA-0002 | System Security Moderate |
| IMPA-0003 | Impact Level Moderate |
| IMPA-0004 | Moderate Baseline |
| IMPA-0005 | Moderate Threshold |
| IMPA-0006 | Moderate |
| IMPA-0007 | Availability Moderate |

**t_nist80053_moderate_impact__at_n_i_s_t_impact_level**

| id | nist_id | at_n_i_s_t_impact_level_id | role |
| --- | --- | --- | --- |
| IMPA-0001 | IMPA-0002 | IMPA-0007 | observer |
| IMPA-0002 | IMPA-0002 | IMPA-0004 | observer |
| IMPA-0003 | IMPA-0006 | IMPA-0001 | contributor |
| IMPA-0004 | IMPA-0007 | IMPA-0007 | owner |
| IMPA-0005 | IMPA-0003 | IMPA-0002 | owner |
| IMPA-0006 | IMPA-0004 | IMPA-0005 | observer |
| IMPA-0007 | IMPA-0001 | IMPA-0006 | contributor |
| IMPA-0008 | IMPA-0003 | IMPA-0007 | owner |