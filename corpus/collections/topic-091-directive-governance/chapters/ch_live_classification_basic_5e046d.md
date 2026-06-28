---
chapter_id: ch_live_classification_basic_5e046d
topic_id: 91
family: 03_directive_governance
cited_terms: ['classification_basic', 'carbon_credit_transaction', 'control_equiv_implements_with_owner']
model: engine-refine
---

Carbon credit projects serve as the foundational provenance for all issued credits, with each transaction traceable to a specific originating project. The Iceland-Geothermal project, the Nepal-Afforestation initiative, and the Brazil-Biochar program each generate distinct credit instruments that carry standardized identifiers such as CAR-2023-6677, VCS-TRX-8812, GS-TRX-8814, and ACR-CC-7721. These identifiers encode both the standard under which the credit was validated—whether Verified Carbon Standard, Gold Standard, American Carbon Registry, or a proprietary scheme—and a sequential transaction number, enabling unambiguous tracking across registries and transfer chains. The derivation relationship between project and transaction is not merely referential; it establishes legal and environmental integrity, since the retirement or transfer of any credit implicitly traces back to the verified emission reductions or removals documented under the originating project's methodology.

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

**t_carbon_credit_transaction_transferred_to**

| id | transferred_to |
| --- | --- |
| TRAN-0001 | Norway-Wealth |
| TRAN-0002 | AFK-Environmental |
| TRAN-0003 | Orsted-NetZero |
| TRAN-0004 | Maersk-Offsetting |
| TRAN-0005 | Orsted-NetZero |
| TRAN-0006 | AFK-Environmental |

The transfer of carbon credits to purchasing entities introduces a second relational layer that governs ownership, contribution, and oversight. Entities such as Norway-Wealth, AFK-Environmental, Orsted-NetZero, and Maersk-Offsetting acquire credits through structured transfer relationships that are themselves classified by role—owner, contributor, or observer—and governed by cardinality constraints that dictate how many purchasing entities may be associated with a single transaction and vice versa. Cardinality Note 01 through Cardinality Note 04 encode these multiplicity rules, ensuring that the data model accurately reflects whether a credit is exclusively owned by a single buyer, shared across multiple parties, or held in a monitoring capacity by a third-party observer. The role assignment within these transfer relationships determines who bears the environmental claim, who finances the acquisition, and who retains audit visibility, creating a transparent chain of custody that satisfies regulatory and voluntary market requirements alike.

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

Classification and lifecycle management of the underlying data and operational processes are governed by a separate but parallel control framework. Classifications such as sensor calibration, data validation, and pipeline orchestration are assigned to specific phases—execution or review—and are triggered by schedule, manual intervention, or retry logic. The classification CLAS-0001, for instance, maps sensor calibration to the execution phase under a schedule trigger, while CLAS-0002 maps data validation to the review phase under a manual trigger, and CLAS-0004 maps a second sensor calibration instance to the review phase under a retry trigger. This phase-and-trigger model ensures that data quality controls are applied at the appropriate point in the credit lifecycle, preventing invalid or uncalibrated data from propagating into transaction records or transfer documentation.

**t_classification_basic**

| id | classification | phase | triggered_by |
| --- | --- | --- | --- |
| CLAS-0001 | sensor calibration | execution | schedule |
| CLAS-0002 | data validation | review | manual |
| CLAS-0003 | pipeline orchestration | execution | schedule |
| CLAS-0004 | sensor calibration | review | retry |
| CLAS-0005 | data ingestion | execution | event |
| CLAS-0006 | batch processing | review | retry |

Enforcement of these controls is mediated through an implementation layer that binds specific controls to operational mechanisms with defined enforcement strictness and language localization. The SOC2 Type II control is implemented through a Code Signing Pipeline with blocking enforcement in Japanese (ja), while the Data Retention Policy is enforced mandatorily through Network Access Control, also in Japanese. The PII Masking Rule applies blocking enforcement through Network Access Control in English (en), and the NIST AC-2 control implements mandatory enforcement via Code Signing Pipeline in Japanese. The enforcement dimension—blocking versus mandatory—determines whether a violation halts the operation entirely or permits it with a recorded exception, and the language field ensures that control documentation and system messages are rendered in the appropriate locale for the operating team. This combination of control, implementation, enforcement, and language creates a governance matrix that is both technically precise and organizationally actionable, ensuring that carbon credit data integrity is maintained through enforceable, localized, and phase-appropriate controls.

**t_control_equiv_implements_with_owner**

| id | control | implements | enforcement | language |
| --- | --- | --- | --- | --- |
| OWNE-0001 | SOC2 Type II | Code Signing Pipeline | blocking | ja |
| OWNE-0002 | Data Retention Policy | Network Access Control | mandatory | ja |
| OWNE-0003 | PII Masking Rule | Network Access Control | blocking | en |
| OWNE-0004 | NIST AC-2 | Code Signing Pipeline | mandatory | ja |