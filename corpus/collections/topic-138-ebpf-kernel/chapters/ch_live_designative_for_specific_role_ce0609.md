---
chapter_id: ch_live_designative_for_specific_role_ce0609
topic_id: 138
family: 01_foundation
cited_terms: ['designative_for_specific_role', 'equiv_intersect_with_restriction', 'ice_about_artifact']
model: engine-refine
---

Attributes, their types, encodings, and the entities they describe form the foundational metadata layer of any system concerned with traceability and compliance. An attribute is a named property of an entity, and its type constrains the kind of value it may carry. In the artifact registry, attributes such as `encoding`, `label_text`, and `language` are all declared with the type `xsd:string`, establishing a uniform textual constraint across heterogeneous metadata fields. This type declaration lives in its own table, `t_ice_about_artifact_attr`, where each row pairs an attribute name with its type, decoupling the schema definition from the actual values. The values themselves are stored separately in `t_ice_about_artifact_val_varchar`, which links an `entity_id` to an `attr_id` and records the concrete `value`—for instance, the entity `ARTI-0001` carries the attribute `ARTI-0001` (encoding) with the value `Encoding 01`, while the same entity also holds attribute `ARTI-0003` (language) with the value `es`. This three-table pattern—artifact, attribute definition, and attribute value—enables a flexible, schema-on-read model where new attributes can be introduced without schema migration.

**t_ice_about_artifact_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ARTI-0001 | encoding | xsd:string |
| ARTI-0002 | label_text | xsd:string |
| ARTI-0003 | language | xsd:string |

**t_ice_about_artifact_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0001 | Encoding 01 |
| ARTI-0002 | ARTI-0001 | ARTI-0002 | calibration record |
| ARTI-0003 | ARTI-0001 | ARTI-0003 | es |
| ARTI-0004 | ARTI-0002 | ARTI-0001 | Encoding 04 |
| ARTI-0005 | ARTI-0002 | ARTI-0002 | calibration record |
| ARTI-0006 | ARTI-0002 | ARTI-0003 | de |
| ARTI-0007 | ARTI-0003 | ARTI-0001 | Encoding 07 |
| ARTI-0008 | ARTI-0003 | ARTI-0002 | nightly summary |

The entities to which these attributes attach are themselves catalogued as artifacts in `t_ice_about_artifact`. Each artifact receives a stable identifier—`ARTI-0001` through `ARTI-0004`—and a descriptive label such as `Compliance-Audit-Log`, `Supply-Chain-Declaration`, or `Calibration-Certificate-2024`. The repetition of `Calibration-Certificate-2024` across two artifact rows (`ARTI-0003` and `ARTI-0004`) illustrates that the identifier, not the label, is the authoritative handle; two distinct artifact records may describe the same logical document, perhaps reflecting different versions or provenance chains. The attribute values table resolves this by binding values to the identifier, ensuring that queries on `ARTI-0001` will always retrieve the same set of properties regardless of how the artifact is described in natural language.

**t_ice_about_artifact**

| id | ice |
| --- | --- |
| ARTI-0001 | Compliance-Audit-Log |
| ARTI-0002 | Supply-Chain-Declaration |
| ARTI-0003 | Calibration-Certificate-2024 |
| ARTI-0004 | Calibration-Certificate-2024 |
| ARTI-0005 | Design-Specification-Draft |
| ARTI-0006 | Validation-Protocol-7B |

Beyond the artifact registry, the system maintains a parallel namespace of designatives that serve as operational identifiers for specific roles within the infrastructure. The table `t_designative_for_specific_role` maps a designative—such as `Sensor-Array-Beta` or `CoreSample-X22`—to what it identifies, whether that be a `Calibration-Standard-ISO`, a `Network-Edge-Router`, or a `Data-Lake-Partition`. Each designative is assigned a short code (`D-33`, `B-12`, `E-21`, `A-01`) and an encoding (`ascii` or `unicode`), which governs how the designative is serialized in downstream systems. The encoding choice is not merely cosmetic; it determines interoperability with legacy systems that expect ASCII-only identifiers versus modern services that require Unicode support. The designative-to-identified mapping provides a resolution layer: operators query by designative, and the system returns the underlying resource, abstracting away the resource's own internal identifier.

**t_designative_for_specific_role**

| id | designative | identifies | code | encoding |
| --- | --- | --- | --- | --- |
| ROLE-0001 | Sensor-Array-Beta | Calibration-Standard-ISO | D-33 | ascii |
| ROLE-0002 | Unit-Shift-Log | Network-Edge-Router | B-12 | unicode |
| ROLE-0003 | CoreSample-X22 | Data-Lake-Partition | E-21 | unicode |
| ROLE-0004 | Batch-Alpha-99 | Quality-Control-Log | A-01 | ascii |
| ROLE-0005 | CoreSample-X22 | Bioreactor-Module-B | D-33 | latin1 |
| ROLE-0006 | LIDAR-Array-7 | Data-Lake-Partition | C-07 | ascii |
| ROLE-0007 | LIDAR-Array-7 | Quality-Control-Log | D-33 | ascii |
| ROLE-0008 | LIDAR-Array-7 | Geolocation-Map-Grid | A-01 | latin1 |

Equivalence relationships between system components are captured in `t_equiv_intersect_with_restriction`, which records pairs of equivalent entities and the infrastructure through which their equivalence is mediated. The entity `sensor_array_gamma` is equivalent to `stream_processor_8`, with the mediation path routed through `s3_export_bucket`; similarly, `event_bus_core` maps to `sensor_bridge_delta` via `snowflake_warehouse_prod`. These equivalence chains are not arbitrary—they reflect data replication, mirroring, or logical aliasing across heterogeneous storage and processing layers. The `related` column anchors each equivalence to a concrete system component, whether an S3 bucket, a Snowflake warehouse, or a Prometheus scrape target, providing an auditable trail from abstract equivalence to physical implementation. This table enables the system to reason about data lineage and redundancy: if `sensor_array_gamma` and `stream_processor_8` are equivalent, a compliance check on one applies to the other, and the related infrastructure component is the point of verification.

**t_equiv_intersect_with_restriction**

| id | equiv | equiv_2 | related |
| --- | --- | --- | --- |
| REST-0001 | sensor_array_gamma | stream_processor_8 | s3_export_bucket |
| REST-0002 | event_bus_core | sensor_bridge_delta | snowflake_warehouse_prod |
| REST-0003 | kafka_stream_primary | batch_mirror_main | s3_export_bucket |
| REST-0004 | telemetry_broker_alpha | vector_cache_prod | prometheus_scrape_target |

The interplay between these tables creates a layered identification and attribution model. Artifacts carry typed attributes with concrete values, designatives resolve to identified resources with encoding constraints, and equivalence relationships bind distributed components together through verifiable infrastructure paths. An auditor tracing a `Calibration-Certificate-2024` (`ARTI-0003`) would first consult the artifact table for its identifier, then the attribute-value table for its encoding and language properties, and finally the designative table to determine which sensor array or calibration standard the certificate pertains to. If that sensor array appears in the equivalence table as related to a particular S3 export bucket, the auditor has a complete chain from document to data store. The identifiers—`ARTI-*`, `ROLE-*`, `REST-*`—serve as the stable anchors throughout this chain, ensuring that every reference point is unambiguous and queryable.