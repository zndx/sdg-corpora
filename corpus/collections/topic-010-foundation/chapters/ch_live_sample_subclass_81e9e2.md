---
chapter_id: ch_live_sample_subclass_81e9e2
topic_id: 10
family: 01_foundation
cited_terms: ['sample_subclass', 'column_added_at_version', 'ebpfmap_basic']
model: engine-refine
---

The governance of schema evolution and attribute metadata is captured through a versioned registry that binds column definitions to their introduction points within a data pipeline. Each schema version entry records the column name alongside the version tag at which it was introduced—throughput_mbps and geo_lat_dd both entered the telemetry schema at version telemetry_v4.0, whereas batch_number arrived with release_2023q4 and air_pressure_hpa with prod_v5.2. The attribute catalogue extends this registry by pairing each attribute with its semantic type: confidence is typed as xsd:decimal, dimension_kind and method as xsd:string, and recorded_at as xsd:dateTime. This type discipline ensures that downstream consumers can validate values against their declared schema without runtime inference.

**t_column_added_at_version**

| id | column | added_at_schema_version |
| --- | --- | --- |
| VERS-0001 | throughput_mbps | telemetry_v4.0 |
| VERS-0002 | geo_lat_dd | telemetry_v4.0 |
| VERS-0003 | batch_number | release_2023q4 |
| VERS-0004 | air_pressure_hpa | prod_v5.2 |
| VERS-0005 | sensor_id | staging_v1.1 |
| VERS-0006 | throughput_mbps | prod_v5.2 |

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

**t_column_added_at_version_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERS-0001 | VERS-0001 | VERS-0004 | 2025-04-06T14:28:17 |
| VERS-0002 | VERS-0002 | VERS-0004 | 2024-08-02T01:36:48 |
| VERS-0003 | VERS-0003 | VERS-0004 | 2025-02-20T12:13:34 |
| VERS-0004 | VERS-0004 | VERS-0004 | 2024-08-09T17:04:50 |
| VERS-0005 | VERS-0005 | VERS-0004 | 2025-03-12T11:57:30 |
| VERS-0006 | VERS-0006 | VERS-0004 | 2023-01-03T00:21:42 |

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

Attribute values are materialised in a normalised entity–attribute–value triad that separates concerns by data type. Decimal-valued attributes are stored in a dedicated value table where entity VERS-0001 carries a confidence of 0.705 against attribute VERS-0001, while the same entity also holds a dimension_kind value of 536.45 under attribute VERS-0005 and a secondary measure of 797.42 under VERS-0007. String-valued attributes occupy a parallel table: entity VERS-0001 is associated with dimension_kind 01, encoding 02, a change rationale, and the abbreviation de across attributes VERS-0002, VERS-0008, VERS-0009, and VERS-0010 respectively. Temporal attributes are recorded in a third value table, where each entry links an entity to an attribute and a precise timestamp—2025-04-06T14:28:17, 2024-08-02T01:36:48, 2025-02-20T12:13:34, and 2024-08-09T17:04:50—all resolved against attribute VERS-0004. The foreign-key constraints on entity_id and attr_id enforce referential integrity across these three value tables, guaranteeing that every value traces back to a declared attribute and a known entity.

The eBPF map domain is modelled as a star schema comprising a fact table and a dimension table. The fact table records each map instance by its identifier, its key reference, its on-disk size in bytes, and a version number. Map EBPF-0001 occupies 354,373,995 bytes at version 5, EBPF-0002 spans 208,979,093 bytes at version 3, EBPF-0003 measures 31,105,012 bytes at version 12, and EBPF-0004 totals 156,714,508 bytes at version 6. The dimension table supplies human-readable labels and categorical classifications for each map—Ebpfmap Label 01 through 04 mapped to categories Ebpfmap Category 01 through 04—enabling analytical roll-ups by category without exposing internal key names to business-level queries.

**fact_ebpfmap**

| id | ebpfmap_key | size_bytes | version |
| --- | --- | --- | --- |
| EBPF-0001 | EBPF-0002 | 208979093 | 3 |
| EBPF-0002 | EBPF-0005 | 156714508 | 6 |
| EBPF-0003 | EBPF-0003 | 31105012 | 12 |
| EBPF-0004 | EBPF-0001 | 354373995 | 5 |
| EBPF-0005 | EBPF-0002 | 866267293 | 2 |

**dim_ebpfmap**

| id | ebpfmap_label | ebpfmap_category |
| --- | --- | --- |
| EBPF-0001 | Ebpfmap Label 01 | Ebpfmap Category 01 |
| EBPF-0002 | Ebpfmap Label 02 | Ebpfmap Category 02 |
| EBPF-0003 | Ebpfmap Label 03 | Ebpfmap Category 03 |
| EBPF-0004 | Ebpfmap Label 04 | Ebpfmap Category 04 |
| EBPF-0005 | Ebpfmap Label 05 | Ebpfmap Category 05 |
| EBPF-0006 | Ebpfmap Label 06 | Ebpfmap Category 06 |

Sample provenance is tracked in a subclass table that records the origin, location, and cross-referenced identifiers of each specimen. Samples such as ENV-WATER-7B, TELEMETRY-PKG-9, TRACE-CACHE-5, and SEDIMENT-LAKE-9 are assigned unique identifiers SAMP-0001 through SAMP-0004 and linked to collection sources including Data-Pipeline-Alpha and Sensor-Array-7. Geographic and infrastructural locations span us-east-1, rack-7, on-prem-dc1, and ap-south-2, while external identifiers resolve to URNs such as gid://svc/77, a reference code ref-8842, and a DOI doi:10.1109/x. This table provides the audit trail required for data lineage, enabling any downstream attribute value or eBPF measurement to be traced back to its physical or logical source.

**t_sample_subclass**

| id | sample | collected_from | identifier | location |
| --- | --- | --- | --- | --- |
| SAMP-0001 | ENV-WATER-7B | Data-Pipeline-Alpha | gid://svc/77 | us-east-1 |
| SAMP-0002 | TELEMETRY-PKG-9 | Data-Pipeline-Alpha | gid://svc/77 | rack-7 |
| SAMP-0003 | TRACE-CACHE-5 | Sensor-Array-7 | ref-8842 | on-prem-dc1 |
| SAMP-0004 | SEDIMENT-LAKE-9 | Data-Pipeline-Alpha | doi:10.1109/x | ap-south-2 |
| SAMP-0005 | TELEMETRY-PKG-9 | Well-42 | ref-8842 | on-prem-dc1 |