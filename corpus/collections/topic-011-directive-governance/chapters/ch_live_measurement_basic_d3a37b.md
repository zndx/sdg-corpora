---
chapter_id: ch_live_measurement_basic_d3a37b
topic_id: 11
family: 02_observation_measurement
cited_terms: ['measurement_basic', 'requirement_equiv_specifies_target', 'column_version_subclass']
model: engine-refine
---

Attributes constitute the extensible metadata layer that decorates core entities with contextual information, enabling a single measurement record to carry heterogeneous properties without schema modification. In the measurement domain, each entity—identified by a surrogate key such as `MEAS-0001` or `MEAS-0004` and associated with a measurement label like *Air Quality Index*, *Disk Throughput*, or *Water pH Level*—is augmented by a set of attribute definitions stored in a dedicated catalog. These definitions pair an attribute name, for instance `confidence`, `dimension_kind`, `method`, or `recorded_at`, with a strict type constraint drawn from the XSD namespace: `xsd:decimal` for numeric confidence scores, `xsd:string` for categorical dimensions and procedural methods, and `xsd:dateTime` for temporal stamps. This separation of attribute schema from attribute values permits the system to evolve independently; new measurement types inherit the same attribute vocabulary without requiring structural migration.

Attribute values are materialized across three type-specialized value tables, each enforcing homogeneity within its column while collectively supporting the full range of attribute types. Decimal-valued attributes resolve to precise floating-point quantities—`0.231`, `407.80`, `947.91`—and are linked to their owning entities through a foreign key on `entity_id` that references the measurement identifier, while the `attr_id` column points into the attribute catalog to resolve the semantic meaning of the stored number. String-valued attributes capture free-form or enumerated content such as *Dimension Kind 01*, *Encoding 02*, *calibration record*, and locale codes like `es`; datetime-valued attributes store ISO 8601 timestamps including `2024-05-15T18:00:29` and `2023-06-19T08:04:37`. The tripartite value architecture ensures type safety at query time while preserving the flexibility of an entity-attribute-value pattern, a design choice that trades join complexity for schema agility in environments where attribute cardinality is volatile.

**t_measurement_basic**

| id | measurement |
| --- | --- |
| MEAS-0001 | Air Quality Index |
| MEAS-0002 | Disk Throughput |
| MEAS-0003 | Water pH Level |
| MEAS-0004 | Air Quality Index |
| MEAS-0005 | Network Latency |
| MEAS-0006 | Air Quality Index |
| MEAS-0007 | Disk Throughput |

**t_measurement_basic_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| MEAS-0001 | confidence | xsd:decimal |
| MEAS-0002 | dimension_kind | xsd:string |
| MEAS-0003 | method | xsd:string |
| MEAS-0004 | recorded_at | xsd:dateTime |
| MEAS-0005 | uncertainty | xsd:decimal |
| MEAS-0006 | unit | xsd:string |
| MEAS-0007 | value | xsd:decimal |
| MEAS-0008 | encoding | xsd:string |

**t_measurement_basic_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| MEAS-0001 | MEAS-0001 | MEAS-0004 | 2024-05-15T18:00:29 |
| MEAS-0002 | MEAS-0002 | MEAS-0004 | 2024-04-18T18:40:50 |
| MEAS-0003 | MEAS-0003 | MEAS-0004 | 2023-06-19T08:04:37 |
| MEAS-0004 | MEAS-0004 | MEAS-0004 | 2024-12-12T18:49:55 |
| MEAS-0005 | MEAS-0005 | MEAS-0004 | 2024-07-10T05:51:16 |
| MEAS-0006 | MEAS-0006 | MEAS-0004 | 2023-05-22T02:44:37 |
| MEAS-0007 | MEAS-0007 | MEAS-0004 | 2023-01-22T19:04:55 |

**t_measurement_basic_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| MEAS-0001 | MEAS-0001 | MEAS-0001 | 0.231 |
| MEAS-0002 | MEAS-0001 | MEAS-0005 | 407.80 |
| MEAS-0003 | MEAS-0001 | MEAS-0007 | 947.91 |
| MEAS-0004 | MEAS-0002 | MEAS-0001 | 0.117 |
| MEAS-0005 | MEAS-0002 | MEAS-0005 | 521.52 |
| MEAS-0006 | MEAS-0002 | MEAS-0007 | 399.99 |
| MEAS-0007 | MEAS-0003 | MEAS-0001 | 0.530 |
| MEAS-0008 | MEAS-0003 | MEAS-0005 | 792.36 |

**t_measurement_basic_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| MEAS-0001 | MEAS-0001 | MEAS-0002 | Dimension Kind 01 |
| MEAS-0002 | MEAS-0001 | MEAS-0008 | Encoding 02 |
| MEAS-0003 | MEAS-0001 | MEAS-0009 | calibration record |
| MEAS-0004 | MEAS-0001 | MEAS-0010 | es |
| MEAS-0005 | MEAS-0001 | MEAS-0003 | automated |
| MEAS-0006 | MEAS-0001 | MEAS-0006 | ms |
| MEAS-0007 | MEAS-0002 | MEAS-0002 | Dimension Kind 07 |
| MEAS-0008 | MEAS-0002 | MEAS-0008 | Encoding 08 |

The same attribute-value decomposition applies uniformly to the column version subclass hierarchy, where individual column definitions—such as `timestamp_utc`, `operator_code`, and `humidity_pct`—are versioned against measurement identifiers like `MEAS-0002` and `MEAS-0007` and enriched with the identical attribute vocabulary. Column version `VERS-0001` carries a confidence of `0.648` and a recorded timestamp of `2024-04-09T04:38:55`, while version `VERS-0003` associates with `humidity_pct` and bears the method descriptor *intake form* alongside the locale code `de`. This structural symmetry between measurement-level and column-version-level attributes indicates a shared metadata engine, where the attribute catalog and value tables are parameterized by a generic entity type rather than hard-coded to a single domain concept.

**t_requirement_equiv_specifies_target_applies_to**

| id | applies_to |
| --- | --- |
| TARG-0001 | CloudStorage |
| TARG-0002 | EUDataCenter |
| TARG-0003 | DataLake |
| TARG-0004 | DataLake |
| TARG-0005 | EUDataCenter |
| TARG-0006 | CustomerTable |

**t_column_version_subclass**

| id | column | column_version |
| --- | --- | --- |
| VERS-0001 | timestamp_utc | MEAS-0002 |
| VERS-0002 | operator_code | MEAS-0007 |
| VERS-0003 | timestamp_utc | MEAS-0007 |
| VERS-0004 | humidity_pct | MEAS-0001 |
| VERS-0005 | sample_volume_ml | MEAS-0004 |
| VERS-0006 | ph_level | MEAS-0002 |

**t_column_version_subclass_attr**

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

**t_column_version_subclass_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERS-0001 | VERS-0001 | VERS-0004 | 2024-04-09T04:38:55 |
| VERS-0002 | VERS-0002 | VERS-0004 | 2024-01-02T00:15:06 |
| VERS-0003 | VERS-0003 | VERS-0004 | 2023-01-13T23:21:50 |
| VERS-0004 | VERS-0004 | VERS-0004 | 2023-03-07T00:33:45 |
| VERS-0005 | VERS-0005 | VERS-0004 | 2023-12-29T06:33:45 |
| VERS-0006 | VERS-0006 | VERS-0004 | 2023-10-05T00:14:22 |

**t_column_version_subclass_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERS-0001 | VERS-0001 | VERS-0001 | 0.648 |
| VERS-0002 | VERS-0001 | VERS-0005 | 428.43 |
| VERS-0003 | VERS-0001 | VERS-0007 | 933.19 |
| VERS-0004 | VERS-0002 | VERS-0001 | 0.532 |
| VERS-0005 | VERS-0002 | VERS-0005 | 783.47 |
| VERS-0006 | VERS-0002 | VERS-0007 | 645.78 |
| VERS-0007 | VERS-0003 | VERS-0001 | 0.438 |
| VERS-0008 | VERS-0003 | VERS-0005 | 787.07 |

**t_column_version_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERS-0001 | VERS-0001 | VERS-0002 | Dimension Kind 01 |
| VERS-0002 | VERS-0001 | VERS-0008 | Encoding 02 |
| VERS-0003 | VERS-0001 | VERS-0009 | intake form |
| VERS-0004 | VERS-0001 | VERS-0010 | de |
| VERS-0005 | VERS-0001 | VERS-0003 | hybrid |
| VERS-0006 | VERS-0001 | VERS-0006 | ms |
| VERS-0007 | VERS-0002 | VERS-0002 | Dimension Kind 07 |
| VERS-0008 | VERS-0002 | VERS-0008 | Encoding 08 |

Beyond attribute enrichment, the framework models compliance and specification relationships through a target-centric graph that binds requirements to their governing specifications and application domains. A requirement entity—identified by keys such as `TARG-0001` and `TARG-0003` and labeled with obligations like *LatencyThreshold*, *DataLineageTrace*, and *AuditLogFormat*—is linked to one or more specification artifacts, including *KafkaProtocol*, *GDPRArticle*, and *JSONSchema*, through a junction table that encodes the nature of the relationship via a `role` column. Roles observed in this linkage include *reviewer*, *owner*, and *contributor*, each denoting a distinct governance posture: an *owner* bears accountability for the requirement-specification pairing, a *reviewer* validates its correctness, and a *contributor* supplies content or evidence. The same requirement may participate in multiple roles across different specification bindings, reflecting the multi-stakeholder reality of compliance frameworks where a single obligation such as *AuditLogFormat* (`TARG-0004`) is simultaneously owned and reviewed by different parties.

**t_requirement_equiv_specifies_target**

| id | requirement |
| --- | --- |
| TARG-0001 | LatencyThreshold |
| TARG-0002 | DataLineageTrace |
| TARG-0003 | LatencyThreshold |
| TARG-0004 | AuditLogFormat |
| TARG-0005 | TelemetrySamplingRate |
| TARG-0006 | LatencyThreshold |

**t_requirement_equiv_specifies_target_specifies**

| id | specifies |
| --- | --- |
| TARG-0001 | KafkaProtocol |
| TARG-0002 | GDPRArticle |
| TARG-0003 | KafkaProtocol |
| TARG-0004 | JSONSchema |
| TARG-0005 | JSONSchema |
| TARG-0006 | OpenTelemetry |
| TARG-0007 | JSONSchema |

**t_requirement_equiv_specifies_target__specifies**

| id | requirement_id | specifies_id | role |
| --- | --- | --- | --- |
| TARG-0001 | TARG-0004 | TARG-0002 | reviewer |
| TARG-0002 | TARG-0002 | TARG-0002 | owner |
| TARG-0003 | TARG-0004 | TARG-0007 | contributor |
| TARG-0004 | TARG-0002 | TARG-0004 | owner |
| TARG-0005 | TARG-0002 | TARG-0004 | observer |
| TARG-0006 | TARG-0006 | TARG-0007 | contributor |
| TARG-0007 | TARG-0005 | TARG-0006 | reviewer |
| TARG-0008 | TARG-0001 | TARG-0007 | reviewer |

The application scope of each requirement is captured in a parallel junction table that associates requirements with target environments—*CloudStorage*, *EUDataCenter*, and *DataLake*—and annotates each association with both a `role` and a `cardinality_note`. Cardinality annotations such as *Cardinality Note 01* through *Cardinality Note 04* provide machine-readable constraints on the multiplicity of the requirement-to-environment mapping, while roles like *contributor* and *reviewer* reappear in this context to signal who is responsible for maintaining the applicability claim. The decoupling of specification linkage from application linkage allows a requirement to reference *KafkaProtocol* as its governing standard while applying to *DataLake* under a different governance role, enabling fine-grained traceability from obligation through specification to deployment target without conflating the three relationship dimensions.

**t_requirement_equiv_specifies_target__applies_to**

| id | requirement_id | applies_to_id | role | cardinality_note |
| --- | --- | --- | --- | --- |
| TARG-0001 | TARG-0001 | TARG-0001 | contributor | Cardinality Note 01 |
| TARG-0002 | TARG-0005 | TARG-0002 | contributor | Cardinality Note 02 |
| TARG-0003 | TARG-0006 | TARG-0003 | observer | Cardinality Note 03 |
| TARG-0004 | TARG-0002 | TARG-0004 | reviewer | Cardinality Note 04 |
| TARG-0005 | TARG-0001 | TARG-0006 | reviewer | Cardinality Note 05 |
| TARG-0006 | TARG-0004 | TARG-0003 | observer | Cardinality Note 06 |
| TARG-0007 | TARG-0003 | TARG-0001 | observer | Cardinality Note 07 |
| TARG-0008 | TARG-0005 | TARG-0002 | reviewer | Cardinality Note 08 |