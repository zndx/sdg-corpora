---
chapter_id: ch_live_transformation_with_input_dataset_191653
topic_id: 54
family: 05_provo_lineage
cited_terms: ['transformation_with_input_dataset', 'policy_effective_period', 'material_density_specification']
model: engine-refine
---

Data lineage and regulatory compliance rest on two complementary tracking mechanisms: one that records the execution of data transformations against their source material, and another that governs the temporal applicability of policy regimes. The transformation registry assigns each processing run a unique identifier—DATA-0001 through DATA-0004—and captures the nature of the operation, the provenance of the input dataset, the elapsed duration in seconds, and the number of retry attempts incurred. A log aggregation job consuming patient vitals data required 7,022.59 seconds and 337 retries; a feature extraction pipeline operating on network traffic capture completed in 3,575.88 seconds with 418 retries. These metrics, alongside the transformation classification (ETL pipeline, data masking, genomic sequencing reads processing) and the input dataset type, form an auditable execution ledger. The retry count, in particular, serves as a proxy for data quality or system instability, with values ranging from 276 for a data masking operation on financial trade records to 418 for the network traffic feature extraction.

**t_transformation_with_input_dataset**

| id | transformation | input_dataset | duration_seconds | retry_count |
| --- | --- | --- | --- | --- |
| DATA-0001 | log aggregation | patient vitals | 7022.59 | 337 |
| DATA-0002 | feature extraction | network traffic capture | 3575.88 | 418 |
| DATA-0003 | data masking | financial trade records | 722.03 | 276 |
| DATA-0004 | ETL pipeline | genomic sequencing reads | 6380.45 | 352 |
| DATA-0005 | metadata enrichment | raw sensor logs | 5901.31 | 65 |
| DATA-0006 | ETL pipeline | genomic sequencing reads | 1979.98 | 431 |
| DATA-0007 | ETL pipeline | field survey records | 6357.24 | 452 |

Complementing this operational ledger, the policy effectiveness framework delineates which regulatory regimes apply during specific time windows, across defined organizational scopes, and in designated languages. The HIPAA Privacy Rule and NIST SP 800-53 both took effect during Q4 2022, yet they diverge in scope: the former applies at the local level while the latter extends to the team level. The GDPR Compliance regime, scoped globally and expressed in French (fr), becomes operative in Q1 2025, whereas PCI DSS v4.0, also scoped locally and rendered in Spanish (es), was active during Q3 2023. The scope dimension—local, global, or team—determines the breadth of organizational coverage, while the language field governs the linguistic register of policy documentation and user-facing communications.

**t_policy_effective_period**

| id | policy | effective_during | scope | language |
| --- | --- | --- | --- | --- |
| PERI-0001 | HIPAA Privacy Rule | Q4 2022 | local | es |
| PERI-0002 | GDPR Compliance | Q3 2023 | local | es |
| PERI-0003 | PCI DSS v4.0 | Q1 2025 | global | fr |
| PERI-0004 | NIST SP 800-53 | Q4 2022 | team | es |
| PERI-0005 | CCPA Data Rights | Q4 2025 | team | es |

Material density specifications introduce a third dimension of structured metadata, where each material—Monocrystalline Silicon, 316 Stainless Steel, High-Density Polyethylene, Aerogel Composite—is assigned a unique identifier (SPEC-0001 through SPEC-0004) and a set of typed attributes. The attribute registry defines the schema of these properties: confidence is modeled as xsd:decimal, dimension_kind and method as xsd:string, and recorded_at as xsd:dateTime. This type discipline ensures that values stored against each attribute conform to the expected semantic domain, enabling both programmatic validation and cross-system interoperability.

**t_material_density_specification**

| id | material_density_specification |
| --- | --- |
| SPEC-0001 | Monocrystalline Silicon |
| SPEC-0002 | 316 Stainless Steel |
| SPEC-0003 | High-Density Polyethylene |
| SPEC-0004 | Aerogel Composite |
| SPEC-0005 | Titanium Grade 5 |
| SPEC-0006 | Polyethylene Terephthalate |
| SPEC-0007 | CFRP |
| SPEC-0008 | Aerospace Grade Aluminum |

**t_material_density_specification_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| SPEC-0001 | confidence | xsd:decimal |
| SPEC-0002 | dimension_kind | xsd:string |
| SPEC-0003 | method | xsd:string |
| SPEC-0004 | recorded_at | xsd:dateTime |
| SPEC-0005 | uncertainty | xsd:decimal |
| SPEC-0006 | unit | xsd:string |
| SPEC-0007 | value | xsd:decimal |
| SPEC-0008 | encoding | xsd:string |

The value storage layer implements an entity-attribute-value (EAV) pattern, partitioning values by type into three specialized tables to preserve type safety while maintaining a flexible schema. For the recorded_at attribute (SPEC-0004), the datetime table records timestamps such as 2023-09-01T16:18:03 for Monocrystalline Silicon and 2025-05-04T17:35:25 for Aerogel Composite, establishing a temporal provenance for each specification. The decimal table stores numeric measurements—0.346, 525.66, 299.45, 0.826—against entity-attribute pairs, while the varchar table captures categorical and free-text values including Dimension Kind 01, Encoding 02, change rationale, and ja. The entity column in each value table references the material density specification identifier, and the attr column references the attribute definition, creating a navigable graph from material through property to typed value.

**t_material_density_specification_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SPEC-0001 | SPEC-0001 | SPEC-0004 | 2023-09-01T16:18:03 |
| SPEC-0002 | SPEC-0002 | SPEC-0004 | 2024-08-02T02:03:27 |
| SPEC-0003 | SPEC-0003 | SPEC-0004 | 2024-12-26T11:45:06 |
| SPEC-0004 | SPEC-0004 | SPEC-0004 | 2025-05-04T17:35:25 |
| SPEC-0005 | SPEC-0005 | SPEC-0004 | 2024-11-11T19:06:53 |
| SPEC-0006 | SPEC-0006 | SPEC-0004 | 2024-02-29T08:13:20 |
| SPEC-0007 | SPEC-0007 | SPEC-0004 | 2023-02-28T18:42:10 |
| SPEC-0008 | SPEC-0008 | SPEC-0004 | 2023-07-14T09:35:28 |

**t_material_density_specification_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SPEC-0001 | SPEC-0001 | SPEC-0001 | 0.346 |
| SPEC-0002 | SPEC-0001 | SPEC-0005 | 525.66 |
| SPEC-0003 | SPEC-0001 | SPEC-0007 | 299.45 |
| SPEC-0004 | SPEC-0002 | SPEC-0001 | 0.826 |
| SPEC-0005 | SPEC-0002 | SPEC-0005 | 839.98 |
| SPEC-0006 | SPEC-0002 | SPEC-0007 | 704.76 |
| SPEC-0007 | SPEC-0003 | SPEC-0001 | 0.814 |
| SPEC-0008 | SPEC-0003 | SPEC-0005 | 216.55 |

**t_material_density_specification_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SPEC-0001 | SPEC-0001 | SPEC-0002 | Dimension Kind 01 |
| SPEC-0002 | SPEC-0001 | SPEC-0008 | Encoding 02 |
| SPEC-0003 | SPEC-0001 | SPEC-0009 | change rationale |
| SPEC-0004 | SPEC-0001 | SPEC-0010 | ja |
| SPEC-0005 | SPEC-0001 | SPEC-0003 | automated |
| SPEC-0006 | SPEC-0001 | SPEC-0006 | m/s |
| SPEC-0007 | SPEC-0002 | SPEC-0002 | Dimension Kind 07 |
| SPEC-0008 | SPEC-0002 | SPEC-0008 | Encoding 08 |