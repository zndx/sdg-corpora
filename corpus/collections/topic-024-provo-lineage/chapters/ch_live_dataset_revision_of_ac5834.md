---
chapter_id: ch_live_dataset_revision_of_ac5834
topic_id: 24
family: 05_provo_lineage
cited_terms: ['dataset_revision_of', 'profile_has_distribution', 'kernelhook_for_subsystem']
model: engine-refine
---

The governance of data assets rests upon a disciplined architecture of identifiers, ownership, and type discipline that together enforce traceability across the full lifecycle of a dataset. Each revision of a dataset is assigned a unique identifier—REVI-0001 through REVI-0004 in the current registry—and is explicitly linked to the artifact it supersedes, such that the sensor-fusion-calibration dataset is recorded as a revision of grid-load-forecast-base, while customer-churn-features revises market-index-initial. Ownership is declared at the point of revision: the ml-infra team retains stewardship over sensor-fusion-calibration, satellite-telemetry-v2, and genomics-raw-reads-q3, whereas governance assumes responsibility for the market-index-initial lineage. The format of each revision is captured through its MIME type—application/xml for grid-load-forecast-base, application/octet-stream for both market-index-initial and proteomics-mass-spec-v1, and application/parquet for baseline-genomics-q2—ensuring that downstream consumers can resolve serialization expectations without ambiguity.

**t_dataset_revision_of**

| id | dataset | was_revision_of | mime_type | owner |
| --- | --- | --- | --- | --- |
| REVI-0001 | sensor-fusion-calibration | grid-load-forecast-base | application/xml | ml-infra |
| REVI-0002 | customer-churn-features | market-index-initial | application/octet-stream | governance |
| REVI-0003 | satellite-telemetry-v2 | proteomics-mass-spec-v1 | application/octet-stream | ml-infra |
| REVI-0004 | genomics-raw-reads-q3 | baseline-genomics-q2 | application/parquet | ml-infra |

Attribute definitions form the structural backbone of distribution-level profiling, where each attribute is identified by a human-readable name and bound to a precise XSD type. The confidence attribute carries the xsd:decimal type, dimension_kind and method are xsd:string, and recorded_at is xsd:dateTime, establishing a schema that governs how values are stored, validated, and queried. These attributes are not abstract; they are materialized across dedicated value tables partitioned by type, so that decimal-valued attributes such as confidence are persisted with precision—0.522 and 0.997 appearing as distinct measurements within the same distribution entity—while string-valued attributes capture categorical metadata like Dimension Kind 01, Encoding 02, nightly summary, and the locale code de. Temporal attributes are stored separately in a datetime table, where recorded_at values such as 2024-02-01T19:38:09 and 2025-05-10T14:15:47 anchor each distribution to a point in time, enabling temporal queries and audit trails.

**t_profile_has_distribution_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DIST-0001 | DIST-0001 | DIST-0004 | 2024-02-01T19:38:09 |
| DIST-0002 | DIST-0002 | DIST-0004 | 2025-05-10T14:15:47 |
| DIST-0003 | DIST-0003 | DIST-0004 | 2024-06-29T13:14:55 |
| DIST-0004 | DIST-0004 | DIST-0004 | 2025-03-10T08:03:10 |
| DIST-0005 | DIST-0005 | DIST-0004 | 2025-05-31T19:13:55 |
| DIST-0006 | DIST-0006 | DIST-0004 | 2024-10-12T04:18:41 |

Distribution entities serve as the connective tissue between profiles and their concrete data representations. A profile such as Schema Evolution Registry is associated with a Kafka Topic Stream and a JSON Schema Registry through distribution links, while Anomaly Detection Ruleset maps to an XML Metadata Archive and Schema Validation Profile to a Parquet Dataset. Each distribution carries its own identifier—DIST-0001 through DIST-0004—and its attributes are resolved through a many-to-many relationship: the same recorded_at attribute (DIST-0004) is referenced across all four distribution entities, each with its own timestamp, while other attributes like DIST-0001 (confidence) appear in multiple entities with distinct decimal values (0.522, 445.38, 68.45, 0.997), reflecting the heterogeneity of measurements across different data streams.

**t_profile_has_distribution**

| id | profile | distribution |
| --- | --- | --- |
| DIST-0001 | Schema Evolution Registry | Kafka Topic Stream |
| DIST-0002 | Anomaly Detection Ruleset | JSON Schema Registry |
| DIST-0003 | Schema Validation Profile | XML Metadata Archive |
| DIST-0004 | Schema Evolution Registry | Parquet Dataset |
| DIST-0005 | Data Contract Specification | JSON Schema Registry |
| DIST-0006 | Lineage Tracking Map | Parquet Dataset |

**t_profile_has_distribution_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| DIST-0001 | confidence | xsd:decimal |
| DIST-0002 | dimension_kind | xsd:string |
| DIST-0003 | method | xsd:string |
| DIST-0004 | recorded_at | xsd:dateTime |
| DIST-0005 | uncertainty | xsd:decimal |
| DIST-0006 | unit | xsd:string |
| DIST-0007 | value | xsd:decimal |
| DIST-0008 | encoding | xsd:string |

**t_profile_has_distribution_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DIST-0001 | DIST-0001 | DIST-0001 | 0.522 |
| DIST-0002 | DIST-0001 | DIST-0005 | 445.38 |
| DIST-0003 | DIST-0001 | DIST-0007 | 68.45 |
| DIST-0004 | DIST-0002 | DIST-0001 | 0.997 |
| DIST-0005 | DIST-0002 | DIST-0005 | 691.41 |
| DIST-0006 | DIST-0002 | DIST-0007 | 957.20 |
| DIST-0007 | DIST-0003 | DIST-0001 | 0.423 |
| DIST-0008 | DIST-0003 | DIST-0005 | 321.82 |

**t_profile_has_distribution_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DIST-0001 | DIST-0001 | DIST-0002 | Dimension Kind 01 |
| DIST-0002 | DIST-0001 | DIST-0008 | Encoding 02 |
| DIST-0003 | DIST-0001 | DIST-0009 | nightly summary |
| DIST-0004 | DIST-0001 | DIST-0010 | de |
| DIST-0005 | DIST-0001 | DIST-0003 | automated |
| DIST-0006 | DIST-0001 | DIST-0006 | kg |
| DIST-0007 | DIST-0002 | DIST-0002 | Dimension Kind 07 |
| DIST-0008 | DIST-0002 | DIST-0008 | Encoding 08 |

Kernel subsystems introduce a parallel dimension of resource accounting and version control. Each subsystem is identified by a key—SUBS-0001 through SUBS-0007—and is associated with a label and a category that classify its operational domain. The fact table for kernel hooks records the binary footprint of each subsystem in bytes: one subsystem occupies 36,342,735 bytes at version 3, another consumes 560,962,979 bytes at version 1, a third registers 456,299,832 bytes at version 10, and a fourth holds 272,822,846 bytes at version 1. These size metrics, coupled with version numbers, provide a quantitative basis for capacity planning, upgrade impact assessment, and compliance reporting, ensuring that every kernel-level component can be traced to its resource consumption and software lineage.

**fact_kernelhook**

| id | for_kernel_subsystem_key | size_bytes | version |
| --- | --- | --- | --- |
| SUBS-0001 | SUBS-0005 | 36342735 | 3 |
| SUBS-0002 | SUBS-0007 | 560962979 | 1 |
| SUBS-0003 | SUBS-0001 | 456299832 | 10 |
| SUBS-0004 | SUBS-0005 | 272822846 | 1 |

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