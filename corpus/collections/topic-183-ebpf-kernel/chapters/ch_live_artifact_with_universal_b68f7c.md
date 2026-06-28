---
chapter_id: ch_live_artifact_with_universal_b68f7c
topic_id: 183
family: 01_foundation
cited_terms: ['artifact_with_universal', 'schemaorg_product_brand', 'column_added_at_version']
model: engine-refine
---

Every managed asset in a governed data environment requires a stable identity, a precise point of origin, and a known deployment context. The identifier serves as the immutable anchor across all operational records, ensuring that downstream processes can unambiguously reference the same object regardless of where it appears in the pipeline. Creation timestamps establish a definitive provenance window, anchoring each record to a specific moment in the organizational timeline—for instance, the Audit_Reporter artifact was registered on 2024-12-09, while the Feature_Vector_Store predates it to 2024-11-04. Location metadata further contextualizes these assets by specifying their runtime environment, distinguishing cloud-native deployments in us-east-1 from legacy infrastructure housed in on-prem-dc1. Together, these fields form the foundational triad for asset tracking, enabling compliance auditors to reconstruct the lifecycle of any component from initial registration through active deployment.

As data models mature, their structural definitions must evolve without breaking downstream consumers, which necessitates rigorous version control over schema attributes. Each attr introduced into a schema carries a formal attr type declaration that dictates validation rules, storage semantics, and query behavior. For example, a confidence metric is typed as xsd:decimal to preserve numerical precision, whereas a recording timestamp uses xsd:dateTime to enforce ISO 8601 compliance, and categorical descriptors like dimension_kind are constrained to xsd:string. These attribute definitions are not static; they are logged against specific schema releases such as telemetry_v4.0 or release_2023q4, creating an auditable trail of when each field was introduced and under which version it became active. This versioned attribute registry ensures that data engineers and compliance officers can trace exactly which structural changes were applied to a dataset at any point in time.

**t_column_added_at_version_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERS-0001 | VERS-0001 | VERS-0004 | 2025-04-06T14:28:17 |
| VERS-0002 | VERS-0002 | VERS-0004 | 2024-08-02T01:36:48 |
| VERS-0003 | VERS-0003 | VERS-0004 | 2025-02-20T12:13:34 |
| VERS-0004 | VERS-0004 | VERS-0004 | 2024-08-09T17:04:50 |
| VERS-0005 | VERS-0005 | VERS-0004 | 2025-03-12T11:57:30 |
| VERS-0006 | VERS-0006 | VERS-0004 | 2023-01-03T00:21:42 |

The actual values assigned to these attributes are captured through an entity-attribute-value pattern that separates metadata definitions from their runtime instantiations. Each entity record acts as a container for multiple attribute measurements, with the stored values categorized by their semantic type to optimize storage and querying. Numeric attributes like throughput_mbps or batch_number are persisted as decimal values such as 0.705 or 536.45, while textual descriptors like Encoding 02 or change rationale are stored as variable-length strings in the misc value fields. Temporal attributes capture precise moments in time, recording events at 2025-04-06T14:28:17 or 2024-08-02T01:36:48. By segregating value types into dedicated storage paths, the system maintains type safety while allowing flexible, schema-on-read expansion without requiring rigid table alterations.

**t_column_added_at_version_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERS-0001 | VERS-0001 | VERS-0001 | 0.705 |
| VERS-0002 | VERS-0001 | VERS-0005 | 536.45 |
| VERS-0003 | VERS-0001 | VERS-0007 | 797.42 |
| VERS-0004 | VERS-0002 | VERS-0001 | 0.546 |
| VERS-0005 | VERS-0002 | VERS-0005 | 698.14 |
| VERS-0006 | VERS-0002 | VERS-0007 | 151.31 |
| VERS-0007 | VERS-0003 | VERS-0001 | 0.806 |
| VERS-0008 | VERS-0003 | VERS-0005 | 213.36 |

**t_column_added_at_version_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERS-0001 | VERS-0001 | VERS-0002 | Dimension Kind 01 |
| VERS-0002 | VERS-0001 | VERS-0008 | Encoding 02 |
| VERS-0003 | VERS-0001 | VERS-0009 | change rationale |
| VERS-0004 | VERS-0001 | VERS-0010 | de |
| VERS-0005 | VERS-0001 | VERS-0003 | manual |
| VERS-0006 | VERS-0001 | VERS-0006 | kg |
| VERS-0007 | VERS-0002 | VERS-0002 | Dimension Kind 07 |
| VERS-0008 | VERS-0002 | VERS-0008 | Encoding 08 |

Organizational taxonomy and storage footprint tracking operate as parallel governance layers that sit above the technical metadata. Brand identifiers map to human-readable labels and categorical classifications, enabling business units to group assets by product line or operational domain. A record tagged with BRAN-0001 corresponds to Brand Label 01 and falls under Brand Category 01, providing a consistent hierarchy for reporting and access control. Alongside this classification, size bytes quantifies the storage footprint of each schema version, with entries ranging from approximately 114 million bytes to nearly 896 million bytes. This metric is critical for capacity planning, cost allocation, and retention policy enforcement, ensuring that high-volume datasets are monitored against storage budgets and compliance retention windows.

**fact_schemaorg**

| id | brand_key | size_bytes | version |
| --- | --- | --- | --- |
| BRAN-0001 | BRAN-0003 | 895265030 | 3 |
| BRAN-0002 | BRAN-0005 | 114301972 | 5 |
| BRAN-0003 | BRAN-0004 | 338701831 | 4 |
| BRAN-0004 | BRAN-0002 | 998785819 | 8 |

**dim_brand**

| id | brand_label | brand_category |
| --- | --- | --- |
| BRAN-0001 | Brand Label 01 | Brand Category 01 |
| BRAN-0002 | Brand Label 02 | Brand Category 02 |
| BRAN-0003 | Brand Label 03 | Brand Category 03 |
| BRAN-0004 | Brand Label 04 | Brand Category 04 |
| BRAN-0005 | Brand Label 05 | Brand Category 05 |
| BRAN-0006 | Brand Label 06 | Brand Category 06 |

**t_column_added_at_version**

| id | column | added_at_schema_version |
| --- | --- | --- |
| VERS-0001 | throughput_mbps | telemetry_v4.0 |
| VERS-0002 | geo_lat_dd | telemetry_v4.0 |
| VERS-0003 | batch_number | release_2023q4 |
| VERS-0004 | air_pressure_hpa | prod_v5.2 |
| VERS-0005 | sensor_id | staging_v1.1 |
| VERS-0006 | throughput_mbps | prod_v5.2 |

When integrated, these metadata dimensions create a comprehensive governance fabric that supports auditability, regulatory compliance, and operational transparency. The identifier links every artifact, attribute definition, and value record into a single navigable graph, while createddate and versioned schema changes provide chronological accountability. Location tags and brand categorizations align technical assets with business and infrastructure contexts, and size metrics enforce storage governance. Compliance teams can query this structure to verify that all deployed components were registered with proper provenance, that schema evolutions were formally versioned and typed, and that storage consumption remains within approved thresholds. This unified metadata architecture transforms raw operational data into a traceable, auditable asset that meets rigorous governance standards.

**t_artifact_with_universal**

| id | artifact | related | created_date | location |
| --- | --- | --- | --- | --- |
| UNIV-0001 | Audit_Reporter | GPU_Compute_Pool | 2024-12-09 | us-east-1 |
| UNIV-0002 | Feature_Vector_Store | Metadata_Registry | 2024-11-04 | us-east-1 |
| UNIV-0003 | Schema_Definition | GPU_Compute_Pool | 2024-10-11 | on-prem-dc1 |
| UNIV-0004 | Container_Image_Release | Compliance_Audit_Log | 2024-10-15 | us-east-1 |
| UNIV-0005 | Data_Pipeline_Export | Metadata_Registry | 2023-07-24 | eu-west-3 |
| UNIV-0006 | Feature_Vector_Store | Metrics_Stream_Prometheus | 2025-04-25 | ap-south-2 |
| UNIV-0007 | Workflow_Scheduler | GPU_Compute_Pool | 2023-11-17 | on-prem-dc1 |

**t_column_added_at_version_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| VERS-0001 | confidence | xsd:decimal |
| VERS-0002 | dimension_kind | xsd:string |
| VERS-0003 | method | xsd:string |
| VERS-0004 | recorded_at | xsd:dateTime |
| VERS-0005 | uncertainty | xsd:decimal |
| VERS-0006 | unit | xsd:string |
| VERS-0007 | value | xsd:decimal |
| VERS-0008 | encoding | xsd:string |