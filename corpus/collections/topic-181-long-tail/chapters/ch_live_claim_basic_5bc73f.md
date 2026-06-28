---
chapter_id: ch_live_claim_basic_5bc73f
topic_id: 181
family: 06_belief_structure
cited_terms: ['claim_basic', 'allocation_with_output_facets', 'carbon_credit_transaction']
model: engine-refine
---

Carbon credit governance systems must capture both the provenance of emission reductions and the operational metadata that validates them, and the data model achieves this through a dual-layer architecture of typed attribute-value pairs and relational transaction records. At the foundation, each claim or asset record carries a stable identifier—CLAI-0001 through CLAI-0004 in the reference data—alongside a descriptive claim field that documents conditions such as "Model accuracy below SLA," "Schema version deprecated," or "File checksum matches." Rather than embedding attribute definitions within the claim record itself, the model separates schema from instance: attribute names like `confidence`, `dimension_kind`, `method`, and `recorded_at` are declared in a dedicated attribute catalog alongside their XML Schema types (`xsd:decimal`, `xsd:string`, `xsd:dateTime`). This separation enables the same attribute definition to be reused across multiple claim entities while preserving type safety, and it allows the system to evolve its attribute vocabulary without restructuring existing records.

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

**t_claim_basic_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CLAI-0001 | CLAI-0001 | CLAI-0004 | 2025-05-28T11:02:08 |
| CLAI-0002 | CLAI-0002 | CLAI-0004 | 2025-04-22T09:44:09 |
| CLAI-0003 | CLAI-0003 | CLAI-0004 | 2025-01-23T06:41:57 |
| CLAI-0004 | CLAI-0004 | CLAI-0004 | 2024-03-14T10:07:11 |
| CLAI-0005 | CLAI-0005 | CLAI-0004 | 2023-08-27T20:51:04 |
| CLAI-0006 | CLAI-0006 | CLAI-0004 | 2025-04-10T08:56:25 |

**t_carbon_credit_transaction**

| id | carbon_credit_transaction |
| --- | --- |
| TRAN-0001 | CAR-2023-6677 |
| TRAN-0002 | VCS-TRX-8812 |
| TRAN-0003 | GS-TRX-8814 |
| TRAN-0004 | ACR-CC-7721 |
| TRAN-0005 | CARB-2024-3305 |
| TRAN-0006 | CARB-2024-3305 |

**t_carbon_credit_transaction_transferred_to**

| id | transferred_to |
| --- | --- |
| TRAN-0001 | Norway-Wealth |
| TRAN-0002 | AFK-Environmental |
| TRAN-0003 | Orsted-NetZero |
| TRAN-0004 | Maersk-Offsetting |
| TRAN-0005 | Orsted-NetZero |
| TRAN-0006 | AFK-Environmental |

Values for these typed attributes are materialized in type-specific value tables, each keyed by a surrogate identifier and linked back to the claim entity and the attribute definition through foreign keys. Decimal attributes such as confidence scores are stored as precise numeric values—0.443, 0.828, 443.93, 257.71—while string attributes capture categorical or free-text data like "Dimension Kind 01," "Encoding 02," "audit excerpt," and locale codes such as "fr." Timestamp attributes record the moment of data capture with full ISO 8601 precision, with values ranging from 2024-03-14T10:07:11 to 2025-05-28T11:02:08. This type-disaggregated storage pattern ensures that queries can target the appropriate value table without type coercion overhead, and it enforces schema-level constraints at the database engine rather than in application logic.

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

The carbon credit transaction layer operates as the central hub of the registry, linking emission reduction projects to their purchasers through a network of relational associations. Each transaction receives a unique identifier—TRAN-0001 through TRAN-0004—and is assigned a market-specific transaction code such as CAR-2023-6677, VCS-TRX-8812, GS-TRX-8814, or ACR-CC-7721, reflecting the standards body (Verified Carbon Standard, Gold Standard, American Carbon Registry) under which the credit was issued. Transactions derive from named projects—Iceland-Geothermal, Nepal-Afforestation, Brazil-Biochar—that represent the underlying emission reduction activities, and the model captures this derivation through a junction table that records not only the project-to-transaction linkage but also the role of each party, distinguishing between "owner" and "contributor" relationships.

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

Purchasing entities receive carbon credits through transfer relationships that are similarly modeled as a junction table with explicit role assignments and cardinality metadata. The reference data shows transactions transferred to entities such as Norway-Wealth, AFK-Environmental, Orsted-NetZero, and Maersk-Offsetting, with roles including "owner," "contributor," and "observer" indicating the nature of the purchasing entity's relationship to the transaction. Cardinality notes—labeled Cardinality Note 01 through Cardinality Note 04 in the schema—provide additional constraints on the multiplicity of these relationships, enabling the system to enforce business rules such as one-to-many or many-to-one transfer patterns. This explicit role and cardinality metadata transforms what would otherwise be a simple foreign key into a semantically rich relationship that supports audit trails, compliance reporting, and multi-party transaction workflows.

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

Complementing the carbon credit domain, the model also tracks operational allocations and their associated output facets, each bound to specific hostnames and lifecycle statuses. Allocations such as "Telemetry buffer lease," "Cloud VM instance pool," "Kubernetes pod allocation," and "API rate limit tier" are associated with output facets like "Storage usage metric," "Data quality score," "Telemetry timestamp stream," and "Lab sample ID registry," and are pinned to compute nodes identified by hostnames such as node-a01 and node-b14. The status field—alternating between "running" and "pending"—provides a lightweight lifecycle indicator that enables operational dashboards to surface allocation health without requiring separate status tables. Together, these allocation records form the infrastructure layer that supports the data collection and telemetry pipelines feeding the carbon credit and claim management systems.

**t_allocation_with_output_facets**

| id | allocation | output_facet | host_name | status |
| --- | --- | --- | --- | --- |
| FACE-0001 | Telemetry buffer lease | Storage usage metric | node-a01 | running |
| FACE-0002 | Cloud VM instance pool | Data quality score | node-b14 | pending |
| FACE-0003 | Kubernetes pod allocation | Telemetry timestamp stream | node-a01 | running |
| FACE-0004 | API rate limit tier | Lab sample ID registry | node-a01 | pending |
| FACE-0005 | Batch ingest pipeline | Lab sample ID registry | edge-03 | failed |
| FACE-0006 | Cloud VM instance pool | API response latency | gw-12 | pending |
| FACE-0007 | Data lake partition write | Network throughput counter | gw-12 | failed |