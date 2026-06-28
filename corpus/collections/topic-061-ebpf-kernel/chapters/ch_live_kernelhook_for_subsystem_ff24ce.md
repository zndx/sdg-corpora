---
chapter_id: ch_live_kernelhook_for_subsystem_ff24ce
topic_id: 61
family: 04_ebpf_kernel
cited_terms: ['kernelhook_for_subsystem', 'two_disjoint_artifacts', 'counter_metric_subclass']
model: engine-refine
---

Kernel subsystems are catalogued through a dimensional model that separates descriptive metadata from quantitative measurements, a design that enforces normalization while permitting analytical queries across heterogeneous data sources. The dimension table for kernel subsystems anchors each subsystem with a unique identifier—SUBS-0001 through SUBS-0004—and attaches human-readable labels such as "For Kernel Subsystem Label 01" alongside categorical groupings like "For Kernel Subsystem Category 01." This separation of identity from classification mirrors the dimensional modeling principle that labels and categories may evolve independently of the entity key, allowing governance teams to reclassify subsystems without propagating referential changes through dependent fact tables.

**dim_for_kernel_subsystem**

| id | for_kernel_subsystem_label | for_kernel_subsystem_category |
| --- | --- | --- |
| SUBS-0001 | For Kernel Subsystem Label 01 | For Kernel Subsystem Category 01 |
| SUBS-0002 | For Kernel Subsystem Label 02 | For Kernel Subsystem Category 02 |
| SUBS-0003 | For Kernel Subsystem Label 03 | For Kernel Subsystem Category 03 |
| SUBS-0004 | For Kernel Subsystem Label 04 | For Kernel Subsystem Category 04 |
| SUBS-0005 | For Kernel Subsystem Label 05 | For Kernel Subsystem Category 05 |
| SUBS-0006 | For Kernel Subsystem Label 06 | For Kernel Subsystem Category 06 |
| SUBS-0007 | For Kernel Subsystem Label 07 | For Kernel Subsystem Category 07 |

The kernel hook fact table records measurable properties of individual hook instances, each identified by the same SUBS-prefixed identifiers and linked to the dimension table through the for_kernel_subsystem_key column. A hook instance identified as SUBS-0001 occupies 36,342,735 bytes and carries version 3, while its counterpart SUBS-0002 consumes 560,962,979 bytes at version 1. The for_kernel_subsystem_key in the fact table resolves to SUBS-0005, SUBS-0007, SUBS-0001, and SUBS-0005 respectively, indicating that multiple hook instances may reference the same logical subsystem—a many-to-one relationship that aggregates hook-level telemetry under a shared subsystem identity. Version numbers here serve as revision markers, enabling traceability across deployments and supporting rollback procedures when a particular hook configuration proves incompatible with a given subsystem release.

**fact_kernelhook**

| id | for_kernel_subsystem_key | size_bytes | version |
| --- | --- | --- | --- |
| SUBS-0001 | SUBS-0005 | 36342735 | 3 |
| SUBS-0002 | SUBS-0007 | 560962979 | 1 |
| SUBS-0003 | SUBS-0001 | 456299832 | 10 |
| SUBS-0004 | SUBS-0005 | 272822846 | 1 |

A parallel dimensional structure governs metric kinds, where the dimension table assigns identifiers METR-0001 through METR-0004 to descriptive labels such as "Metric Kind Label 01" and categories like "Metric Kind Category 01." The counter fact table references these metric kinds through the metric_kind_key column, which resolves to METR-0005, METR-0004, METR-0003, and METR-0003 across four recorded instances. Size measurements range from 422,660,739 bytes for METR-0003 to 977,102,405 bytes for METR-0005, and version numbers span from 5 to 12, reflecting the more granular revision tracking typical of metric definitions that undergo frequent schema adjustments as monitoring requirements evolve. The repetition of METR-0003 in two fact rows demonstrates that a single metric kind can generate multiple counter records, each capturing a distinct measurement snapshot or aggregation window.

**fact_counter**

| id | metric_kind_key | size_bytes | version |
| --- | --- | --- | --- |
| METR-0001 | METR-0005 | 977102405 | 12 |
| METR-0002 | METR-0004 | 609833100 | 8 |
| METR-0003 | METR-0003 | 881633277 | 7 |
| METR-0004 | METR-0003 | 422660739 | 5 |

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

Artifact attributes follow an entity-attribute-value pattern that decouples schema definition from data storage, enabling dynamic attribute addition without table restructuring. The attribute definition table assigns names such as checksum, created_date, identifier, and license to attribute identifiers ARTI-0001 through ARTI-0004, each annotated with a type constraint—xsd:string for checksum and license, xsd:date for created_date, and cco:DesignativeICE for identifier. These type annotations enforce semantic discipline: a checksum value like 9d2b7a16 is validated as a string, a license value of MPL-2.0 carries the same type, and a created_date value such as 2023-05-13 conforms to the date schema. The entity-attribute-value decomposition distributes actual values across three type-specific tables—varchar values including urn:uuid:9f2a and ap-south-2, integer values such as 36 and 462, and date values spanning 2023-05-13 through 2024-03-29—each table keyed by entity_id and attr_id to reconstruct the full attribute set for any given artifact.

**t_two_disjoint_artifacts_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0001 | 9d2b7a16 |
| ARTI-0002 | ARTI-0001 | ARTI-0003 | urn:uuid:9f2a |
| ARTI-0003 | ARTI-0001 | ARTI-0004 | MPL-2.0 |
| ARTI-0004 | ARTI-0001 | ARTI-0009 | ap-south-2 |
| ARTI-0005 | ARTI-0001 | ARTI-0005 | application/xml |
| ARTI-0006 | ARTI-0001 | ARTI-0010 | Name 06 |
| ARTI-0007 | ARTI-0001 | ARTI-0011 | governance |
| ARTI-0008 | ARTI-0001 | ARTI-0012 | Tags 08 |

The disjoint artifact table establishes the entity layer by pairing artifacts into binary relationships, with entries like etl-job paired with data-lake, config-bundle with traffic-router and access-policy, and data-pipeline-v4 with service-discovery. These pairings define the entity_id values that anchor the attribute-value tables, ensuring that every recorded attribute—whether a checksum, a creation date, or an integer counter—can be traced back to a specific artifact and its associated relationship. The attr_id columns in the value tables reference the attribute definition table, creating a three-hop join path from artifact pair through attribute definition to attribute value that, while requiring more complex queries, provides the flexibility to add new attributes without schema migration and to store heterogeneous data types within a unified governance framework.

**t_two_disjoint_artifacts**

| id | two | two_2 |
| --- | --- | --- |
| ARTI-0001 | etl-job | data-lake |
| ARTI-0002 | config-bundle | traffic-router |
| ARTI-0003 | config-bundle | access-policy |
| ARTI-0004 | data-pipeline-v4 | service-discovery |
| ARTI-0005 | audit-log | traffic-router |
| ARTI-0006 | ingestion-service | traffic-router |

**t_two_disjoint_artifacts_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ARTI-0001 | checksum | xsd:string |
| ARTI-0002 | created_date | xsd:date |
| ARTI-0003 | identifier | cco:DesignativeICE |
| ARTI-0004 | license | xsd:string |
| ARTI-0005 | mime_type | xsd:string |
| ARTI-0006 | size_bytes | xsd:long |
| ARTI-0007 | uri | xsd:string |
| ARTI-0008 | version | xsd:integer |

**t_two_disjoint_artifacts_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0002 | 2023-05-13 |
| ARTI-0002 | ARTI-0002 | ARTI-0002 | 2024-02-28 |
| ARTI-0003 | ARTI-0003 | ARTI-0002 | 2024-03-29 |
| ARTI-0004 | ARTI-0004 | ARTI-0002 | 2023-09-19 |
| ARTI-0005 | ARTI-0005 | ARTI-0002 | 2025-06-16 |
| ARTI-0006 | ARTI-0006 | ARTI-0002 | 2023-10-09 |

**t_two_disjoint_artifacts_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0006 | 36 |
| ARTI-0002 | ARTI-0001 | ARTI-0008 | 5 |
| ARTI-0003 | ARTI-0002 | ARTI-0006 | 462 |
| ARTI-0004 | ARTI-0002 | ARTI-0008 | 3 |
| ARTI-0005 | ARTI-0003 | ARTI-0006 | 31 |
| ARTI-0006 | ARTI-0003 | ARTI-0008 | 5 |
| ARTI-0007 | ARTI-0004 | ARTI-0006 | 427 |
| ARTI-0008 | ARTI-0004 | ARTI-0008 | 10 |