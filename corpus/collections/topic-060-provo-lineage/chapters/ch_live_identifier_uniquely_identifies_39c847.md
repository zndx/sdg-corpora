---
chapter_id: ch_live_identifier_uniquely_identifies_39c847
topic_id: 60
family: 01_foundation
cited_terms: ['identifier_uniquely_identifies', 'carbon_credit_transaction', 'lineage_edge_within_dataset_only']
model: engine-refine
---

Carbon credit transactions are anchored to their originating projects through a dual-layer linkage that distinguishes the substantive derivation relationship from its administrative attribution. A transaction such as CAR-2023-6677 or VCS-TRX-8812 derives from a project—Iceland-Geothermal, Nepal-Afforestation, Brazil-Biochar—yet the same transaction may participate in that derivation under different roles: owner, contributor. The junction table `t_carbon_credit_transaction__derives_from_project` materialises this many-to-many relationship, pairing a `carbon_id` subject with a `derives_from_project_id` target and assigning a `role` that clarifies whether the transaction holds primary claim or secondary association. In practice, TRAN-0002 appears as the owner of its derivation while TRAN-0006 and TRAN-0003 assume contributor status, reflecting the operational reality that a single carbon credit instrument may be jointly attributable across multiple project entities or stakeholder arrangements.

**t_carbon_credit_transaction_derives_from_project**

| id | derives_from_project |
| --- | --- |
| TRAN-0001 | Iceland-Geothermal |
| TRAN-0002 | Nepal-Afforestation |
| TRAN-0003 | Brazil-Biochar |
| TRAN-0004 | Nepal-Afforestation |
| TRAN-0005 | Amazonia-REDD |
| TRAN-0006 | Kerala-Mangrove |

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

The disposition of carbon credits follows an equally structured path, with transactions transferred to purchasing entities such as Norway-Wealth, AFK-Environmental, Orsted-NetZero, and Maersk-Offsetting. The relationship is captured in `t_carbon_credit_transaction__transferred_to`, which records the `carbon_id` subject, the `transferred_to_id` target, and a `role` designation—owner, contributor, or observer—that encodes the purchasing entity's position in the transfer chain. Notably, this junction table carries a `cardinality_note` column (Cardinality Note 01 through Cardinality Note 04), which documents the multiplicity constraints governing the transfer relationship: whether a transaction may be transferred to a single entity, multiple entities, or whether the transfer is conditional upon prior state. The presence of an observer role alongside owner and contributor further signals that the transfer ledger accommodates passive participants—regulators, auditors, or third-party verifiers—who are recorded in the relationship without holding economic interest.

**t_carbon_credit_transaction_transferred_to**

| id | transferred_to |
| --- | --- |
| TRAN-0001 | Norway-Wealth |
| TRAN-0002 | AFK-Environmental |
| TRAN-0003 | Orsted-NetZero |
| TRAN-0004 | Maersk-Offsetting |
| TRAN-0005 | Orsted-NetZero |
| TRAN-0006 | AFK-Environmental |

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

Every transaction and project identifier in the system is itself subject to a formal identification regime. The `t_identifier` table assigns a unique `identifier`—such as doi:10.1145/3641519, urn:isbn:9780131103627, or orcid:0000-0002-1825-0097—to an `identifies` target, which may be a provenance node root, a data pipeline stage, or a container image sha256 digest. Each identification carries a `format` (JSON, E.164, CSV) that specifies the serialization or encoding convention, and an `issued_date` (2024-09-07, 2023-03-13, 2024-01-30) that establishes the temporal provenance of the identifier itself. This layer of indirection ensures that carbon credit identifiers like TRAN-0001 are not merely opaque keys but are traceable to formally issued, format-stamped references that can be independently validated.

**t_identifier_uniquely_identifies**

| id | identifier | identifies | format | issued_date |
| --- | --- | --- | --- | --- |
| IDEN-0001 | doi:10.1145/3641519 | provenance node root | JSON | 2024-09-07 |
| IDEN-0002 | urn:isbn:9780131103627 | data pipeline stage 3 | E.164 | 2023-03-13 |
| IDEN-0003 | doi:10.1145/3641519 | container image sha256 | CSV | 2024-01-30 |
| IDEN-0004 | orcid:0000-0002-1825-0097 | data pipeline stage 3 | JSON | 2023-03-01 |
| IDEN-0005 | pmid:12345678 | metadata registry entry | E.164 | 2025-03-08 |
| IDEN-0006 | doi:10.1016/j.softx.2020.100312 | metadata registry entry | ISO-8601 | 2025-05-18 |
| IDEN-0007 | orcid:0000-0002-1825-0097 | data pipeline stage 3 | RFC-3339 | 2024-09-01 |

**t_carbon_credit_transaction**

| id | carbon_credit_transaction |
| --- | --- |
| TRAN-0001 | CAR-2023-6677 |
| TRAN-0002 | VCS-TRX-8812 |
| TRAN-0003 | GS-TRX-8814 |
| TRAN-0004 | ACR-CC-7721 |
| TRAN-0005 | CARB-2024-3305 |
| TRAN-0006 | CARB-2024-3305 |

Data quality and lineage within the carbon credit registry are quantified through a fact-dimension model that attaches confidence scores and uncertainty bounds to individual lineage records. The `fact_lineage` table records a `confidence` value—ranging from 0.071 for ONLY-0002 to 0.779 for ONLY-0004—alongside an `uncertainty` magnitude (612.22, 133.03, 76.69, 708.23) and a `value` metric (903.86, 832.18, 862.00, 259.55) that together characterise the reliability of the lineage assertion. These facts are keyed to a `within_dataset_key` that references the `dim_within_dataset` dimension, where each dimension member carries a `within_dataset_label` (Within Dataset Label 01 through 04) and a `within_dataset_category` (Within Dataset Category 01 through 04). The category field provides the semantic grouping for lineage records, enabling aggregation and filtering by data provenance type, while the misc label offers a human-readable descriptor. The interplay of confidence and uncertainty is critical for downstream compliance reporting: a lineage fact with confidence 0.071 and uncertainty 133.03 demands substantially more scrutiny than one with confidence 0.779 and uncertainty 708.23, even though the latter exhibits a larger absolute uncertainty value.

**fact_lineage**

| id | within_dataset_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| ONLY-0001 | ONLY-0003 | 0.645 | 612.22 | 903.86 |
| ONLY-0002 | ONLY-0004 | 0.071 | 133.03 | 832.18 |
| ONLY-0003 | ONLY-0005 | 0.404 | 76.69 | 862.00 |
| ONLY-0004 | ONLY-0006 | 0.779 | 708.23 | 259.55 |
| ONLY-0005 | ONLY-0001 | 0.376 | 801.99 | 986.33 |
| ONLY-0006 | ONLY-0004 | 0.744 | 956.79 | 34.40 |

**dim_within_dataset**

| id | within_dataset_label | within_dataset_category |
| --- | --- | --- |
| ONLY-0001 | Within Dataset Label 01 | Within Dataset Category 01 |
| ONLY-0002 | Within Dataset Label 02 | Within Dataset Category 02 |
| ONLY-0003 | Within Dataset Label 03 | Within Dataset Category 03 |
| ONLY-0004 | Within Dataset Label 04 | Within Dataset Category 04 |
| ONLY-0005 | Within Dataset Label 05 | Within Dataset Category 05 |
| ONLY-0006 | Within Dataset Label 06 | Within Dataset Category 06 |