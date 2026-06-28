---
chapter_id: ch_live_allocation_basic_13bd6f
topic_id: 79
family: 05_provo_lineage
cited_terms: ['allocation_basic', 'material_density_specification', 'kernel_anomaly_supports_claim']
model: engine-refine
---

Allocation records constitute the operational backbone of a material processing pipeline, each entry identified by a unique allocation key and linked to its parent allocation through a self-referential foreign key. The fact table captures the temporal and procedural dimensions of each allocation: duration spans from 1,151.17 seconds for the briefest cycle to 7,031.31 seconds for the most protracted, while exit codes—ranging from 141 to 988—encode the termination state of each run. Retry counts further illuminate system resilience, with values of 32, 49, 282, and 415 reflecting varying degrees of transient failure recovery. These factual records are enriched by a dimension table that assigns each allocation a human-readable label, such as Allocation Label 01 through Allocation Label 04, and a categorical classification—Allocation Category 01 through Allocation Category 04—that groups allocations by functional purpose. The allocation_key column in the fact table references other allocation identifiers, establishing a directed graph of allocation dependencies that supports lineage tracing and cascade analysis.

**fact_allocation**

| id | allocation_key | duration_seconds | exit_code | retry_count |
| --- | --- | --- | --- | --- |
| ALLO-0001 | ALLO-0002 | 6322.19 | 604 | 49 |
| ALLO-0002 | ALLO-0003 | 1151.17 | 457 | 282 |
| ALLO-0003 | ALLO-0003 | 4950.80 | 988 | 415 |
| ALLO-0004 | ALLO-0003 | 7031.31 | 141 | 32 |
| ALLO-0005 | ALLO-0001 | 3728.13 | 271 | 498 |
| ALLO-0006 | ALLO-0005 | 4892.58 | 91 | 385 |
| ALLO-0007 | ALLO-0002 | 586.50 | 781 | 414 |
| ALLO-0008 | ALLO-0004 | 850.51 | 189 | 222 |

**dim_allocation**

| id | allocation_label | allocation_category |
| --- | --- | --- |
| ALLO-0001 | Allocation Label 01 | Allocation Category 01 |
| ALLO-0002 | Allocation Label 02 | Allocation Category 02 |
| ALLO-0003 | Allocation Label 03 | Allocation Category 03 |
| ALLO-0004 | Allocation Label 04 | Allocation Category 04 |
| ALLO-0005 | Allocation Label 05 | Allocation Category 05 |
| ALLO-0006 | Allocation Label 06 | Allocation Category 06 |

Material density specifications form a parallel domain of technical parameters, each specification identified by a unique code and described by a material designation such as Monocrystalline Silicon, 316 Stainless Steel, High-Density Polyethylene, or Aerogel Composite. The attribute schema governing these specifications is itself a first-class entity: attribute names including confidence, dimension_kind, method, and recorded_at are catalogued with their corresponding data types—xsd:decimal, xsd:string, and xsd:dateTime—ensuring type-safe evaluation at query time. This attribute registry decouples the definition of measurable properties from their runtime values, enabling schema evolution without altering the fact tables that consume them.

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

The separation of attribute values by type yields three distinct value tables, each optimized for its data domain. Decimal values such as 0.346, 525.66, 299.45, and 0.826 populate the numeric store, while string-valued attributes like Dimension Kind 01, Encoding 02, change rationale, and ja reside in the varchar table. Temporal attributes—recorded_at timestamps including 2023-09-01T16:18:03, 2024-08-02T02:03:27, 2024-12-26T11:45:06, and 2025-05-04T17:35:25—are stored in the datetime table. Each value row references both an entity, which identifies the material density specification to which the value pertains, and an attribute, which identifies the property being measured. This entity-attribute-value pattern, partitioned by type, supports arbitrary extensibility: new attributes require only a registry entry, not a schema migration.

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

Kernel facts introduce a probabilistic layer to the specification framework. Each kernel record carries a confidence score—0.004, 0.607, 0.772, 0.943—quantifying the system's certainty in the associated measurement, alongside an uncertainty magnitude ranging from 157.11 to 449.10 and a raw value between 40.61 and 830.48. The kernel_key column references other kernel identifiers, mirroring the self-referential pattern found in allocations and enabling the construction of dependency chains across kernel evaluations. A companion dimension table assigns each kernel a label—Kernel Label 01 through Kernel Label 04—and a category—Kernel Category 01 through Kernel Category 04—providing the same classification infrastructure that supports allocation grouping. Together, the allocation and kernel domains form a dual-axis model: allocations track process execution and outcomes, while kernels encode the confidence-weighted measurements that drive downstream decisions.

**fact_kernel**

| id | kernel_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| CLAI-0001 | CLAI-0002 | 0.772 | 402.55 | 40.61 |
| CLAI-0002 | CLAI-0005 | 0.607 | 449.10 | 348.13 |
| CLAI-0003 | CLAI-0002 | 0.004 | 157.11 | 830.48 |
| CLAI-0004 | CLAI-0002 | 0.943 | 437.87 | 235.95 |
| CLAI-0005 | CLAI-0003 | 0.101 | 474.03 | 682.21 |
| CLAI-0006 | CLAI-0003 | 0.671 | 334.23 | 633.25 |
| CLAI-0007 | CLAI-0006 | 0.159 | 653.45 | 469.91 |
| CLAI-0008 | CLAI-0004 | 0.545 | 224.87 | 822.30 |

**dim_kernel**

| id | kernel_label | kernel_category |
| --- | --- | --- |
| CLAI-0001 | Kernel Label 01 | Kernel Category 01 |
| CLAI-0002 | Kernel Label 02 | Kernel Category 02 |
| CLAI-0003 | Kernel Label 03 | Kernel Category 03 |
| CLAI-0004 | Kernel Label 04 | Kernel Category 04 |
| CLAI-0005 | Kernel Label 05 | Kernel Category 05 |
| CLAI-0006 | Kernel Label 06 | Kernel Category 06 |