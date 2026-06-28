---
chapter_id: ch_live_profile_has_distribution_5787aa
topic_id: 45
family: 02_observation_measurement
cited_terms: ['profile_has_distribution', 'ebpfmap_only_one_value_type', 'column_property_subclass']
model: engine-refine
---

In governed metadata systems, stable identifiers anchor every assertion that a profile, distribution binding, column property, or kernel-resident map can be traced, compared across revisions, and joined without ambiguity. A distribution record such as DIST-0001 denotes a concrete attachment between a named profile (for example, Schema Evolution Registry) and a property identifier (PROP-0005), while sibling keys DIST-0002 through DIST-0004 preserve parallel bindings for Anomaly Detection Ruleset, Schema Validation Profile, and a second Schema Evolution Registry linkage to PROP-0002. The same identifier discipline extends to column-property subclasses, where PROP-0001 through PROP-0004 identify annotations on fields including user_agent, device_serial, request_payload, and event_code, each tied to a parent distribution context such as DIST-0003 or DIST-0002. Because identifiers are reused as foreign keys in value stores and fact tables, they function not merely as surrogate keys but as the durable handles through which audit, lineage, and compliance queries resolve “which governed object asserted what, when, and under which type contract.”

**t_profile_has_distribution**

| id | profile | distribution |
| --- | --- | --- |
| DIST-0001 | Schema Evolution Registry | PROP-0005 |
| DIST-0002 | Anomaly Detection Ruleset | PROP-0002 |
| DIST-0003 | Schema Validation Profile | PROP-0004 |
| DIST-0004 | Schema Evolution Registry | PROP-0002 |
| DIST-0005 | Data Contract Specification | PROP-0002 |
| DIST-0006 | Lineage Tracking Map | PROP-0002 |

**t_column_property_subclass**

| id | column | annotates_property_of |
| --- | --- | --- |
| PROP-0001 | user_agent | DIST-0003 |
| PROP-0002 | device_serial | DIST-0002 |
| PROP-0003 | request_payload | DIST-0003 |
| PROP-0004 | event_code | DIST-0006 |
| PROP-0005 | batch_id | DIST-0006 |
| PROP-0006 | batch_id | DIST-0002 |

**t_column_property_subclass_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| PROP-0001 | confidence | xsd:decimal |
| PROP-0002 | dimension_kind | xsd:string |
| PROP-0003 | method | xsd:string |
| PROP-0004 | recorded_at | xsd:dateTime |
| PROP-0005 | uncertainty | xsd:decimal |
| PROP-0006 | unit | xsd:string |
| PROP-0007 | value | xsd:decimal |
| PROP-0008 | encoding | xsd:string |

Entity, in this architecture, names the governed object that carries attribute values, distinct from the attribute definition that names and types those values. Value rows reference entity_id to indicate ownership—DIST-0001 may hold a decimal confidence of 0.522, a varchar dimension_kind of Dimension Kind 01, and a recorded_at timestamp of 2024-02-01T19:38:09—while attr_id selects which declared attribute slot is populated, so the same entity can accumulate heterogeneous facts without collapsing them into a wide, schema-fragile table. The pattern repeats for property subclasses: PROP-0001 stores 0.032 under its confidence attribute, PROP-0002 stores 0.502, and PROP-0003 records method as pre-release note alongside encoding and locale miscellany on PROP-0001. Separating entity from attr is what permits multiple profiles and column annotations to share an attribute vocabulary—confidence, dimension_kind, method, recorded_at—yet remain independently queryable and versionable.

**t_column_property_subclass_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PROP-0001 | PROP-0001 | PROP-0004 | 2023-02-03T11:52:35 |
| PROP-0002 | PROP-0002 | PROP-0004 | 2024-03-26T09:45:05 |
| PROP-0003 | PROP-0003 | PROP-0004 | 2024-11-24T00:57:54 |
| PROP-0004 | PROP-0004 | PROP-0004 | 2024-09-15T13:40:19 |
| PROP-0005 | PROP-0005 | PROP-0004 | 2024-02-28T16:30:22 |
| PROP-0006 | PROP-0006 | PROP-0004 | 2023-07-03T15:24:35 |

**t_column_property_subclass_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PROP-0001 | PROP-0001 | PROP-0001 | 0.032 |
| PROP-0002 | PROP-0001 | PROP-0005 | 504.02 |
| PROP-0003 | PROP-0001 | PROP-0007 | 422.21 |
| PROP-0004 | PROP-0002 | PROP-0001 | 0.502 |
| PROP-0005 | PROP-0002 | PROP-0005 | 491.17 |
| PROP-0006 | PROP-0002 | PROP-0007 | 376.20 |
| PROP-0007 | PROP-0003 | PROP-0001 | 0.755 |
| PROP-0008 | PROP-0003 | PROP-0005 | 531.73 |

**t_column_property_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PROP-0001 | PROP-0001 | PROP-0002 | Dimension Kind 01 |
| PROP-0002 | PROP-0001 | PROP-0008 | Encoding 02 |
| PROP-0003 | PROP-0001 | PROP-0009 | pre-release note |
| PROP-0004 | PROP-0001 | PROP-0010 | es |
| PROP-0005 | PROP-0001 | PROP-0003 | manual |
| PROP-0006 | PROP-0001 | PROP-0006 | m/s |
| PROP-0007 | PROP-0002 | PROP-0002 | Dimension Kind 07 |
| PROP-0008 | PROP-0002 | PROP-0008 | Encoding 08 |

Attr and attr_type jointly constitute the semantic contract under which misc values are admitted, validated, and physically stored. Attribute names declare intent: confidence signals a scored belief, dimension_kind classifies analytic geometry, method captures procedural provenance, and recorded_at timestamps anchor evidentiary freshness. Attr_type binds each name to an XSD datatype—xsd:decimal for confidence, xsd:string for dimension_kind and method, xsd:dateTime for recorded_at—thereby routing payloads into type-specialized value relations rather than a single untyped bag. That routing is operationally decisive: decimal stores hold 0.522 and 445.38 for DIST-0001, 0.997 for DIST-0002, and 422.21 for PROP-0003; varchar stores carry Dimension Kind 01, Encoding 02, nightly summary, and locale codes such as de and es; datetime stores preserve ISO-8601 instants from 2023-02-03T11:52:35 through 2025-05-10T14:15:47. Governance teams rely on attr_type because it enforces parseability, bounds checking, and retention policy at ingestion time, long before downstream analytics or enforcement engines consume the facts.

Misc, within this framework, denotes the substantive payload or descriptive surface that identifiers and types alone do not convey—the human- or machine-readable content that answers compliance questions once structure is fixed. On the profile–distribution side, misc appears as varchar method values (nightly summary), dimension labels, and encodings; on the property-subclass side, it surfaces as pre-release note and localized tokens. In the type-map dimension, misc manifests as value_type_map_label entries (Value Type Map Label 01 through Value Type Map Label 04), which give operators readable names atop otherwise opaque TYPE-000n keys. Misc is deliberately heterogeneous: it may be numeric text, categorical prose, or temporal evidence, but it is always interpreted through the attr_type gate and attributed to an entity, which prevents ambiguous coercions that would undermine evidentiary weight in audits or incident reconstructions.

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

**t_profile_has_distribution_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DIST-0001 | DIST-0001 | DIST-0004 | 2024-02-01T19:38:09 |
| DIST-0002 | DIST-0002 | DIST-0004 | 2025-05-10T14:15:47 |
| DIST-0003 | DIST-0003 | DIST-0004 | 2024-06-29T13:14:55 |
| DIST-0004 | DIST-0004 | DIST-0004 | 2025-03-10T08:03:10 |
| DIST-0005 | DIST-0005 | DIST-0004 | 2025-05-31T19:13:55 |
| DIST-0006 | DIST-0006 | DIST-0004 | 2024-10-12T04:18:41 |

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

Category and type map elevate misc from isolated strings to a classified catalog that runtime artifacts can reference uniformly. dim_value_type_map assigns each TYPE-000n identifier a category (Value Type Map Category 01–04) alongside its label, establishing a controlled vocabulary for how kernel-side value layouts are grouped and reported. fact_ebpfmap then materializes operational instances: rows reference value_type_map_key (notably TYPE-0002 for three entries and TYPE-0003 for one), binding concrete maps to that catalog. Type map keys thus bridge declarative governance—what kinds of maps exist and how they are categorized—and deployed state— which map instance is live, how large it is, and which revision it carries. Analysts use category to roll up capacity planning, access-control scopes, and change windows without scanning raw map contents; engineers use type_map foreign keys to ensure a map’s in-memory layout conforms to the dimension row it claims.

**dim_value_type_map**

| id | value_type_map_label | value_type_map_category |
| --- | --- | --- |
| TYPE-0001 | Value Type Map Label 01 | Value Type Map Category 01 |
| TYPE-0002 | Value Type Map Label 02 | Value Type Map Category 02 |
| TYPE-0003 | Value Type Map Label 03 | Value Type Map Category 03 |
| TYPE-0004 | Value Type Map Label 04 | Value Type Map Category 04 |
| TYPE-0005 | Value Type Map Label 05 | Value Type Map Category 05 |
| TYPE-0006 | Value Type Map Label 06 | Value Type Map Category 06 |

Size_bytes and version complete the operational picture by quantifying footprint and temporal authority over governed artifacts whose identifiers and attributes may remain stable while their contents evolve. Recorded sizes—208979093, 156714508, 31105012, and 354373995 bytes—expose the storage and transfer cost of ebpf map instances sharing TYPE-0002 or TYPE-0003 lineage, informing rollout risk when multiple versions coexist. Version integers (3, 6, 12, 5) mark generational boundaries independent of label or category, so a TYPE-0002 map at version 6 can be distinguished from version 12 even when both reference the same type_map key and category. In practice, compliance workflows join identifier to entity and attr for semantic traceability, attr_type and misc for evidential substance, category and type_map for taxonomic control, and size_bytes with version for change management—yielding a coherent chain from schema profile and column annotation through typed attribute assertions to classified, versioned runtime maps suitable for audit, capacity governance, and controlled deployment.

**fact_ebpfmap**

| id | value_type_map_key | size_bytes | version |
| --- | --- | --- | --- |
| TYPE-0001 | TYPE-0002 | 208979093 | 3 |
| TYPE-0002 | TYPE-0002 | 156714508 | 6 |
| TYPE-0003 | TYPE-0002 | 31105012 | 12 |
| TYPE-0004 | TYPE-0003 | 354373995 | 5 |
| TYPE-0005 | TYPE-0002 | 866267293 | 2 |