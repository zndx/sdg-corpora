---
chapter_id: ch_live_carbon_credit_transaction_d21222
topic_id: 23
family: 08_derived
cited_terms: ['carbon_credit_transaction', 'ebpfprogram_equiv_typed_with_hook', 'policy_attests_artifact']
model: engine-refine
---

Carbon credit transactions are anchored to their originating projects through a derivation relationship that establishes provenance and traceability across the registry. A transaction such as TRAN-0001, carrying the credit identifier CAR-2023-6677, derives from the Iceland-Geothermal project, while TRAN-0002 (VCS-TRX-8812) traces to Nepal-Afforestation. The junction table t_carbon_credit_transaction__derives_from_project mediates this relationship with a role attribute that distinguishes between owner and contributor designations—TRAN-0002 holds the owner role against project TRAN-0005, whereas TRAN-0003, TRAN-0004, and TRAN-0006 are classified as contributors. This role-based mediation permits a single transaction to reference multiple project entities with differentiated semantic weight, and the cardinality constraints embedded in the transfer relationship (see below) ensure that such multiplicity is governed by explicit cardinality notes ranging from Cardinality Note 01 through Cardinality Note 04.

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

The disposition of carbon credits is captured through the transfer relationship linking transactions to purchasing entities, a relationship similarly mediated by a junction table that records both the role of the purchasing entity and a cardinality note constraining the multiplicity of the association. TRAN-0001 transfers to Norway-Wealth with the purchasing entity holding an owner role, while TRAN-0002 transfers to AFK-Environmental as a contributor. The purchasing entity Orsted-NetZero receives TRAN-0003 under an owner designation, and Maersk-Offsetting acquires TRAN-0004 as an observer. The cardinality notes attached to each transfer record—Cardinality Note 01 through Cardinality Note 04—serve as governance markers that encode business rules about permissible transfer multiplicities, ensuring that the registry enforces contractual and regulatory constraints on how credits may be redistributed across the supply chain.

Beyond carbon credit registries, the same structural pattern of attaching to a hook and classifying by program type appears in the eBPF program dimension. The fact table fact_ebpfprogram records each program by its identifier (HOOK-0001 through HOOK-0004), its program type key, and the hook to which it attaches. Program HOOK-0001 attaches to hook HOOK-0006 and carries program type HOOK-0007 with a size of 784,335,640 bytes and version 12; program HOOK-0003 attaches to hook HOOK-0001 with program type HOOK-0005, occupying 113,209,263 bytes at version 11. The program type and hook dimensions are themselves classified by category—dim_program_type assigns Program Type Category 01 through 04 to program types labeled Program Type Label 01 through 04, while dim_attaches_to_hook assigns Attaches To Hook Category 01 through 04 to hooks labeled Attaches To Hook Label 01 through 04. This two-level classification (label plus category) enables both human-readable identification and machine-enforceable grouping of programs by functional domain.

**fact_ebpfprogram**

| id | program_type_key | attaches_to_hook_key | size_bytes | version |
| --- | --- | --- | --- | --- |
| HOOK-0001 | HOOK-0007 | HOOK-0006 | 784335640 | 12 |
| HOOK-0002 | HOOK-0006 | HOOK-0006 | 641704069 | 9 |
| HOOK-0003 | HOOK-0005 | HOOK-0001 | 113209263 | 11 |
| HOOK-0004 | HOOK-0001 | HOOK-0002 | 161013093 | 12 |
| HOOK-0005 | HOOK-0003 | HOOK-0002 | 352203820 | 12 |
| HOOK-0006 | HOOK-0007 | HOOK-0006 | 167519051 | 1 |

**dim_program_type**

| id | program_type_label | program_type_category |
| --- | --- | --- |
| HOOK-0001 | Program Type Label 01 | Program Type Category 01 |
| HOOK-0002 | Program Type Label 02 | Program Type Category 02 |
| HOOK-0003 | Program Type Label 03 | Program Type Category 03 |
| HOOK-0004 | Program Type Label 04 | Program Type Category 04 |
| HOOK-0005 | Program Type Label 05 | Program Type Category 05 |
| HOOK-0006 | Program Type Label 06 | Program Type Category 06 |
| HOOK-0007 | Program Type Label 07 | Program Type Category 07 |
| HOOK-0008 | Program Type Label 08 | Program Type Category 08 |

**dim_attaches_to_hook**

| id | attaches_to_hook_label | attaches_to_hook_category |
| --- | --- | --- |
| HOOK-0001 | Attaches To Hook Label 01 | Attaches To Hook Category 01 |
| HOOK-0002 | Attaches To Hook Label 02 | Attaches To Hook Category 02 |
| HOOK-0003 | Attaches To Hook Label 03 | Attaches To Hook Category 03 |
| HOOK-0004 | Attaches To Hook Label 04 | Attaches To Hook Category 04 |
| HOOK-0005 | Attaches To Hook Label 05 | Attaches To Hook Category 05 |
| HOOK-0006 | Attaches To Hook Label 06 | Attaches To Hook Category 06 |

Policy attestation artifacts employ a parallel typed-attribute pattern, where each artifact is governed by a policy such as FedRAMP Storage Mandate, Zero Trust Access Policy, NIST Encryption Protocol, or HIPAA Data Minimization Rule, and each artifact carries attributes of distinct types—effective_date (xsd:date), enforcement (xsd:string), mandatory (xsd:boolean), and priority (xsd:integer). The value tables are partitioned by type: t_policy_attests_artifact_val_boolean stores boolean values such as true and false for the mandatory attribute across entities ARTI-0001 through ARTI-0004; t_policy_attests_artifact_val_date stores date values including 2023-10-01, 2024-11-14, 2024-03-16, and 2025-04-17 for the effective_date attribute; t_policy_attests_artifact_val_int stores integer values such as 2, 49, 2, and 915 for priority attributes; and t_policy_attests_artifact_val_varchar stores string values like Encoding 01, Enforcement 02, intake form, and en for text attributes. The entity_id and attr_id columns in each value table form the foreign-key bridge between the typed value and its governing attribute definition, ensuring that type safety is enforced at the data level rather than through application logic.

**t_policy_attests_artifact**

| id | policy |
| --- | --- |
| ARTI-0001 | FedRAMP Storage Mandate |
| ARTI-0002 | Zero Trust Access Policy |
| ARTI-0003 | NIST Encryption Protocol |
| ARTI-0004 | HIPAA Data Minimization Rule |
| ARTI-0005 | ISO Privacy Guideline |
| ARTI-0006 | Zero Trust Access Policy |

**t_policy_attests_artifact_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ARTI-0001 | effective_date | xsd:date |
| ARTI-0002 | enforcement | xsd:string |
| ARTI-0003 | mandatory | xsd:boolean |
| ARTI-0004 | priority | xsd:integer |
| ARTI-0005 | review_cycle_days | xsd:integer |
| ARTI-0006 | scope | xsd:string |
| ARTI-0007 | encoding | xsd:string |
| ARTI-0008 | label_text | xsd:string |

**t_policy_attests_artifact_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0003 | true |
| ARTI-0002 | ARTI-0002 | ARTI-0003 | true |
| ARTI-0003 | ARTI-0003 | ARTI-0003 | true |
| ARTI-0004 | ARTI-0004 | ARTI-0003 | false |
| ARTI-0005 | ARTI-0005 | ARTI-0003 | true |
| ARTI-0006 | ARTI-0006 | ARTI-0003 | false |

**t_policy_attests_artifact_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0001 | 2023-10-01 |
| ARTI-0002 | ARTI-0002 | ARTI-0001 | 2024-11-14 |
| ARTI-0003 | ARTI-0003 | ARTI-0001 | 2024-03-16 |
| ARTI-0004 | ARTI-0004 | ARTI-0001 | 2025-04-17 |
| ARTI-0005 | ARTI-0005 | ARTI-0001 | 2025-02-23 |
| ARTI-0006 | ARTI-0006 | ARTI-0001 | 2024-06-05 |

**t_policy_attests_artifact_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0004 | 2 |
| ARTI-0002 | ARTI-0001 | ARTI-0005 | 49 |
| ARTI-0003 | ARTI-0002 | ARTI-0004 | 2 |
| ARTI-0004 | ARTI-0002 | ARTI-0005 | 915 |
| ARTI-0005 | ARTI-0003 | ARTI-0004 | 3 |
| ARTI-0006 | ARTI-0003 | ARTI-0005 | 439 |
| ARTI-0007 | ARTI-0004 | ARTI-0004 | 5 |
| ARTI-0008 | ARTI-0004 | ARTI-0005 | 254 |

**t_policy_attests_artifact_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0007 | Encoding 01 |
| ARTI-0002 | ARTI-0001 | ARTI-0002 | Enforcement 02 |
| ARTI-0003 | ARTI-0001 | ARTI-0008 | intake form |
| ARTI-0004 | ARTI-0001 | ARTI-0009 | en |
| ARTI-0005 | ARTI-0001 | ARTI-0006 | Scope 05 |
| ARTI-0006 | ARTI-0002 | ARTI-0007 | Encoding 06 |
| ARTI-0007 | ARTI-0002 | ARTI-0002 | Enforcement 07 |
| ARTI-0008 | ARTI-0002 | ARTI-0008 | calibration record |