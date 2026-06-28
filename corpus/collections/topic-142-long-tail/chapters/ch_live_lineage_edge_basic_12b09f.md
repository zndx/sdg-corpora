---
chapter_id: ch_live_lineage_edge_basic_12b09f
topic_id: 142
family: 05_provo_lineage
cited_terms: ['lineage_edge_basic', 'schemaorg_event_endtime', 'measurement_subclass']
model: engine-refine
---

Lineage edges serve as the foundational connective tissue in data governance architectures, each edge uniquely identified by a composite key such as EDGE-0001 through EDGE-0004 and annotated with a descriptive lineage label that conveys its operational purpose. A Financial Reconciliation Trace, for instance, documents the provenance path of financial data as it flows through reconciliation systems, while a Compliance Verification Path records the audit trail of regulatory checks, and a Data Lake Ingestion Chain captures the ingestion lineage of raw data entering a lakehouse environment. These edges are not merely identifiers; they are semantic anchors that enable downstream systems to reason about data movement, accountability, and trustworthiness across heterogeneous pipelines. The edge-level metadata is further enriched through a dedicated attribute schema, where each attribute carries a name—such as confidence, dimension_kind, method, or recorded_at—and a type constraint drawn from the XML Schema definition namespace, including xsd:decimal for numeric precision, xsd:string for categorical labels, and xsd:dateTime for temporal stamps. This typed attribute model ensures that every measurement appended to an edge is both semantically meaningful and structurally validated against a shared vocabulary.

**t_lineage_edge_basic**

| id | lineage |
| --- | --- |
| EDGE-0001 | Financial Reconciliation Trace |
| EDGE-0002 | Compliance Verification Path |
| EDGE-0003 | Data Lake Ingestion Chain |
| EDGE-0004 | Supply Chain Audit Trail |
| EDGE-0005 | Sensor Calibration Pipeline |
| EDGE-0006 | Supply Chain Audit Trail |
| EDGE-0007 | Document Revision History |
| EDGE-0008 | Genomic Variant Processing |

**t_lineage_edge_basic_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| EDGE-0001 | confidence | xsd:decimal |
| EDGE-0002 | dimension_kind | xsd:string |
| EDGE-0003 | method | xsd:string |
| EDGE-0004 | recorded_at | xsd:dateTime |
| EDGE-0005 | uncertainty | xsd:decimal |
| EDGE-0006 | unit | xsd:string |
| EDGE-0007 | value | xsd:decimal |
| EDGE-0008 | encoding | xsd:string |

**t_lineage_edge_basic_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EDGE-0001 | EDGE-0001 | EDGE-0004 | 2023-06-18T00:21:12 |
| EDGE-0002 | EDGE-0002 | EDGE-0004 | 2023-11-20T00:15:50 |
| EDGE-0003 | EDGE-0003 | EDGE-0004 | 2023-03-09T06:34:54 |
| EDGE-0004 | EDGE-0004 | EDGE-0004 | 2023-04-04T09:21:45 |
| EDGE-0005 | EDGE-0005 | EDGE-0004 | 2025-02-06T04:35:19 |
| EDGE-0006 | EDGE-0006 | EDGE-0004 | 2023-09-20T23:51:28 |
| EDGE-0007 | EDGE-0007 | EDGE-0004 | 2023-03-25T22:49:39 |
| EDGE-0008 | EDGE-0008 | EDGE-0004 | 2025-02-12T13:04:31 |

**t_lineage_edge_basic_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EDGE-0001 | EDGE-0001 | EDGE-0001 | 0.947 |
| EDGE-0002 | EDGE-0001 | EDGE-0005 | 637.72 |
| EDGE-0003 | EDGE-0001 | EDGE-0007 | 513.28 |
| EDGE-0004 | EDGE-0002 | EDGE-0001 | 0.497 |
| EDGE-0005 | EDGE-0002 | EDGE-0005 | 852.97 |
| EDGE-0006 | EDGE-0002 | EDGE-0007 | 198.62 |
| EDGE-0007 | EDGE-0003 | EDGE-0001 | 0.290 |
| EDGE-0008 | EDGE-0003 | EDGE-0005 | 468.80 |

**t_measurement_subclass**

| id | measurement |
| --- | --- |
| MEAS-0001 | Heart rate |
| MEAS-0002 | Seismic magnitude |
| MEAS-0003 | Soil moisture |
| MEAS-0004 | Soil moisture |
| MEAS-0005 | Bandwidth throughput |
| MEAS-0006 | Seismic magnitude |

**t_measurement_subclass_dimension**

| id | dimension |
| --- | --- |
| MEAS-0001 | Electric current |
| MEAS-0002 | Power |
| MEAS-0003 | Energy |
| MEAS-0004 | Mass |
| MEAS-0005 | Mass |
| MEAS-0006 | Luminous intensity |

The attribute values themselves are materialized across three distinct value tables, each specialized for a particular data type, thereby separating concerns of storage, query performance, and type safety. Decimal-valued attributes such as confidence scores are persisted in the decimal value store, where an edge may carry a confidence of 0.947 or a magnitude reading of 637.72, while string-valued attributes like dimension_kind and method are stored in the varchar value table, holding entries such as Dimension Kind 01, Encoding 02, or the free-text change rationale. Temporal attributes, notably recorded_at, are materialized in the datetime value table, anchoring each measurement to a precise point in time—2023-06-18T00:21:12, 2023-11-20T00:15:50, 2023-03-09T06:34:54, or 2023-04-04T09:21:45—thereby enabling temporal reasoning over lineage provenance and supporting time-bound compliance queries. The entity_id column in each value table serves as the foreign key binding a specific attribute value back to its parent edge, while the attr_id column resolves to the corresponding attribute definition, forming a triadic relationship that is both query-efficient and semantically unambiguous.

**t_lineage_edge_basic_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EDGE-0001 | EDGE-0001 | EDGE-0002 | Dimension Kind 01 |
| EDGE-0002 | EDGE-0001 | EDGE-0008 | Encoding 02 |
| EDGE-0003 | EDGE-0001 | EDGE-0009 | change rationale |
| EDGE-0004 | EDGE-0001 | EDGE-0010 | de |
| EDGE-0005 | EDGE-0001 | EDGE-0003 | manual |
| EDGE-0006 | EDGE-0001 | EDGE-0006 | count |
| EDGE-0007 | EDGE-0002 | EDGE-0002 | Dimension Kind 07 |
| EDGE-0008 | EDGE-0002 | EDGE-0008 | Encoding 08 |

Event end times constitute a parallel dimension of temporal governance, decoupled from the edge-level recorded_at timestamps to capture the broader lifecycle boundaries of data assets. The event end time dimension table provides a categorical taxonomy—Event End Time Category 01 through Event End Time Category 04—each associated with a human-readable label such as Event End Time Label 01, enabling both machine-readable classification and operator-facing reporting. These categories are referenced by the fact schemaorg table, which acts as the central fact table for event lifecycle tracking, linking each event end time key—ENDT-0004, ENDT-0002, ENDT-0007—to a specific data asset identified by its own edge-level identifier, a size in bytes ranging from 114,301,972 to 998,785,819, and a version number spanning from 3 to 8. This design supports versioned asset tracking within a dimensional model, where the size_bytes column captures the storage footprint of each asset at its recorded version, and the event_end_time_key provides the temporal context for when the asset's lifecycle concluded.

**fact_schemaorg**

| id | event_end_time_key | size_bytes | version |
| --- | --- | --- | --- |
| ENDT-0001 | ENDT-0004 | 895265030 | 3 |
| ENDT-0002 | ENDT-0002 | 114301972 | 5 |
| ENDT-0003 | ENDT-0007 | 338701831 | 4 |
| ENDT-0004 | ENDT-0007 | 998785819 | 8 |

**dim_event_end_time**

| id | event_end_time_label | event_end_time_category |
| --- | --- | --- |
| ENDT-0001 | Event End Time Label 01 | Event End Time Category 01 |
| ENDT-0002 | Event End Time Label 02 | Event End Time Category 02 |
| ENDT-0003 | Event End Time Label 03 | Event End Time Category 03 |
| ENDT-0004 | Event End Time Label 04 | Event End Time Category 04 |
| ENDT-0005 | Event End Time Label 05 | Event End Time Category 05 |
| ENDT-0006 | Event End Time Label 06 | Event End Time Category 06 |
| ENDT-0007 | Event End Time Label 07 | Event End Time Category 07 |

Measurement subclassifications introduce a further layer of ontological structure, mapping physical and operational measurements to their constituent dimensions through a many-to-many relationship mediated by a role attribute. The measurement subclass table enumerates measurement types such as Heart rate, Seismic magnitude, and Soil moisture, while the measurement subclass dimension table defines the dimensional axes—Electric current, Power, Energy, Mass—against which these measurements are evaluated. The junction table t_measurement_subclass__dimension binds a measurement subject to a dimension target through a role that specifies the nature of the relationship: an owner role indicates that the measurement directly defines or produces the dimension, whereas a reviewer role signifies that the measurement is evaluated against or audited by the dimension. For example, Soil moisture (MEAS-0004) may be owned by Mass (MEAS-0003) as a fundamental physical property, while simultaneously being reviewed against Energy (MEAS-0005) in the context of thermal analysis, illustrating how a single measurement can participate in multiple dimensional relationships with distinct governance roles.

**t_measurement_subclass__dimension**

| id | measurement_id | dimension_id | role |
| --- | --- | --- | --- |
| MEAS-0001 | MEAS-0004 | MEAS-0003 | owner |
| MEAS-0002 | MEAS-0004 | MEAS-0005 | owner |
| MEAS-0003 | MEAS-0006 | MEAS-0005 | reviewer |
| MEAS-0004 | MEAS-0005 | MEAS-0001 | reviewer |
| MEAS-0005 | MEAS-0003 | MEAS-0002 | owner |
| MEAS-0006 | MEAS-0005 | MEAS-0006 | contributor |
| MEAS-0007 | MEAS-0003 | MEAS-0006 | contributor |
| MEAS-0008 | MEAS-0004 | MEAS-0001 | contributor |