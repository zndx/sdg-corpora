---
chapter_id: ch_live_schemaorg_place_latitude_c2743b
topic_id: 0
family: 07_long_tail
cited_terms: ['schemaorg_place_latitude', 'state_transitions_from', 'material_density_specification']
model: engine-refine
---

The governance of material specifications rests upon a disciplined separation between the specification itself and the attributes that qualify it. A material density specification—whether Monocrystalline Silicon, 316 Stainless Steel, High-Density Polyethylene, or Aerogel Composite—is identified by a stable identifier such as SPEC-0001 or SPEC-0004, and its descriptive properties are captured through an attribute registry that pairs each attribute name with a precise type. The attribute registry records confidence as xsd:decimal, dimension_kind and method as xsd:string, and recorded_at as xsd:dateTime, thereby enforcing type discipline across heterogeneous value stores. This tripartite structure—specification, attribute definition, and typed value—ensures that every datum carries both semantic meaning and structural constraints, a design that prevents the kind of type drift that undermines auditability in production environments.

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

Values for these attributes are materialized in dedicated value tables keyed by entity and attribute, each table corresponding to a distinct data type. Decimal attributes such as confidence resolve to concrete measurements—0.346, 525.66, 299.45, 0.826—while string attributes capture categorical descriptors like Dimension Kind 01, Encoding 02, change rationale, and ja. Temporal attributes anchor observations to precise instants: 2023-09-01T16:18:03, 2024-08-02T02:03:27, 2024-12-26T11:45:06, 2025-05-04T17:35:25. The entity column in each value table binds the datum to its parent specification, and the attr column binds it to its definition, creating a sparse but fully navigable graph of property assignments. This normalization strategy permits any specification to carry any subset of attributes without schema migration, while preserving referential integrity through the entity and attr foreign keys.

Latitude dimensions introduce a parallel taxonomy that classifies and labels geographic or positional metadata through a fact-dimension pairing. The fact table fact_schemaorg associates each identifier—LATI-0001 through LATI-0004—with a latitude_key (LATI-0002, LATI-0003, LATI-0005), a size_bytes measurement ranging from 114,301,972 to 998,785,819 bytes, and a version number between 3 and 8. The corresponding dimension table dim_latitude resolves each identifier to a human-readable label such as Latitude Label 01 and a category classification like Latitude Category 01. This separation of measured quantities from their descriptive metadata mirrors the specification-attribute pattern, establishing a consistent architectural idiom across the data model.

**fact_schemaorg**

| id | latitude_key | size_bytes | version |
| --- | --- | --- | --- |
| LATI-0001 | LATI-0002 | 895265030 | 3 |
| LATI-0002 | LATI-0003 | 114301972 | 5 |
| LATI-0003 | LATI-0002 | 338701831 | 4 |
| LATI-0004 | LATI-0005 | 998785819 | 8 |

**dim_latitude**

| id | latitude_label | latitude_category |
| --- | --- | --- |
| LATI-0001 | Latitude Label 01 | Latitude Category 01 |
| LATI-0002 | Latitude Label 02 | Latitude Category 02 |
| LATI-0003 | Latitude Label 03 | Latitude Category 03 |
| LATI-0004 | Latitude Label 04 | Latitude Category 04 |
| LATI-0005 | Latitude Label 05 | Latitude Category 05 |
| LATI-0006 | Latitude Label 06 | Latitude Category 06 |
| LATI-0007 | Latitude Label 07 | Latitude Category 07 |
| LATI-0008 | Latitude Label 08 | Latitude Category 08 |

State transitions are governed by a three-table junction that distinguishes the originating state from the source of the transition and the role of the actor initiating it. The state table records states such as MaintenanceWindow, DrainingEndpoint, and SynchronizedState, while the transitions_from table enumerates sources including StagingDataset, ValidationQueue, ArchiveBucket, and BackupSnapshot. The junction table t_state_transitions_from__transitions_from links a subject—the originating state identifier—to a target—the transitions_from identifier—under a role that classifies the relationship as contributor, reviewer, or observer. This explicit role dimension enables fine-grained access control and audit trails, as the same state-to-source pairing can carry different permissions depending on whether the actor is contributing data, reviewing a transition, or observing it passively.

**t_state_transitions_from**

| id | state |
| --- | --- |
| FROM-0001 | MaintenanceWindow |
| FROM-0002 | DrainingEndpoint |
| FROM-0003 | MaintenanceWindow |
| FROM-0004 | SynchronizedState |
| FROM-0005 | DrainingEndpoint |
| FROM-0006 | ReplicationGap |
| FROM-0007 | CorruptionDetected |

**t_state_transitions_from_transitions_from**

| id | transitions_from |
| --- | --- |
| FROM-0001 | StagingDataset |
| FROM-0002 | ValidationQueue |
| FROM-0003 | ArchiveBucket |
| FROM-0004 | BackupSnapshot |
| FROM-0005 | ProductionMirror |
| FROM-0006 | LegacyWarehouse |
| FROM-0007 | LegacyWarehouse |

**t_state_transitions_from__transitions_from**

| id | state_id | transitions_from_id | role |
| --- | --- | --- | --- |
| FROM-0001 | FROM-0007 | FROM-0006 | contributor |
| FROM-0002 | FROM-0005 | FROM-0004 | reviewer |
| FROM-0003 | FROM-0006 | FROM-0001 | observer |
| FROM-0004 | FROM-0002 | FROM-0006 | reviewer |
| FROM-0005 | FROM-0007 | FROM-0004 | reviewer |
| FROM-0006 | FROM-0006 | FROM-0005 | observer |
| FROM-0007 | FROM-0003 | FROM-0002 | owner |
| FROM-0008 | FROM-0003 | FROM-0006 | observer |