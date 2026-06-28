---
chapter_id: ch_live_subclass_to_designative_ice_244600
topic_id: 7
family: 01_foundation
cited_terms: ['subclass_to_designative_ice', 'lineage_observed_by_event', 'attrkey_subclass']
model: engine-refine
---

Attributes constitute the fundamental units of metadata binding within the data lineage architecture, each defined by a name and a type that together establish a contract for the values they carry. An attribute such as `confidence` is declared with type `xsd:decimal`, while `recorded_at` carries type `xsd:dateTime`, and `dimension_kind` is typed as `xsd:string`; these type declarations are not merely annotations but structural constraints that govern how values are stored, validated, and interpreted across the system. The attribute registry is partitioned by subclass domain, so that the designative ICE subclass carries attributes like `encoding`, `label_text`, and `language`—all typed as `xsd:string`—whereas the event-based lineage subclass exposes a richer type vocabulary including `xsd:decimal` for numeric measures and `xsd:dateTime` for temporal stamps. This separation ensures that attribute semantics remain scoped to their conceptual domain, preventing cross-domain confusion between, say, the string-valued `language` attribute of an ICE entity and the decimal-valued `confidence` attribute of an event.

**t_subclass_to_designative_ice_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ICE-0001 | encoding | xsd:string |
| ICE-0002 | label_text | xsd:string |
| ICE-0003 | language | xsd:string |

Entities serve as the primary referents to which attributes are bound, and each entity is identified by a stable identifier that anchors the entire attribute-value graph. An ICE entity bearing the identifier `ICE-0001` is designatively labeled `CryoStream-Link`, and this same identifier appears as the `entity_id` in value rows that assign it the attribute values `Encoding 01` for the `encoding` attribute, `change rationale` for `label_text`, and `es` for `language`. Similarly, event entities such as `EVEN-0001`—which carries the lineage designation `sensor-fusion-pipeline`—are bound to attribute values through foreign-key joins: the decimal value `0.142` is associated with attribute `EVEN-0001` (typed as `xsd:decimal`), the string value `Dimension Kind 01` with attribute `EVEN-0002` (typed as `xsd:string`), and the datetime value `2024-07-15T19:59:01` with attribute `EVEN-0004` (typed as `xsd:dateTime`). The entity identifier thus functions as the pivot around which the entire attribute-value relationship rotates, enabling multiple attributes to be resolved to a single entity and, conversely, a single attribute definition to be instantiated across many entities.

**t_lineage_observed_by_event**

| id | lineage |
| --- | --- |
| EVEN-0001 | sensor-fusion-pipeline |
| EVEN-0002 | financial-risk-model |
| EVEN-0003 | data-lake-ingestion |
| EVEN-0004 | quality-control-assay |
| EVEN-0005 | iot-telemetry-ingest |
| EVEN-0006 | financial-risk-model |

**t_lineage_observed_by_event_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| EVEN-0001 | confidence | xsd:decimal |
| EVEN-0002 | dimension_kind | xsd:string |
| EVEN-0003 | method | xsd:string |
| EVEN-0004 | recorded_at | xsd:dateTime |
| EVEN-0005 | uncertainty | xsd:decimal |
| EVEN-0006 | unit | xsd:string |
| EVEN-0007 | value | xsd:decimal |
| EVEN-0008 | encoding | xsd:string |

**t_lineage_observed_by_event_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVEN-0001 | EVEN-0001 | EVEN-0004 | 2024-07-15T19:59:01 |
| EVEN-0002 | EVEN-0002 | EVEN-0004 | 2023-01-03T08:23:46 |
| EVEN-0003 | EVEN-0003 | EVEN-0004 | 2024-06-13T23:29:26 |
| EVEN-0004 | EVEN-0004 | EVEN-0004 | 2023-03-31T12:19:15 |
| EVEN-0005 | EVEN-0005 | EVEN-0004 | 2023-03-05T06:53:09 |
| EVEN-0006 | EVEN-0006 | EVEN-0004 | 2023-03-19T16:32:15 |

**t_lineage_observed_by_event_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVEN-0001 | EVEN-0001 | EVEN-0001 | 0.142 |
| EVEN-0002 | EVEN-0001 | EVEN-0005 | 754.57 |
| EVEN-0003 | EVEN-0001 | EVEN-0007 | 852.05 |
| EVEN-0004 | EVEN-0002 | EVEN-0001 | 0.607 |
| EVEN-0005 | EVEN-0002 | EVEN-0005 | 551.25 |
| EVEN-0006 | EVEN-0002 | EVEN-0007 | 531.16 |
| EVEN-0007 | EVEN-0003 | EVEN-0001 | 0.333 |
| EVEN-0008 | EVEN-0003 | EVEN-0005 | 159.50 |

The value storage layer is deliberately type-disaggregated, with separate tables for varchar, decimal, and datetime values, each carrying the composite key of `id`, `entity_id`, `attr_id`, and `value`. This normalization pattern means that the varchar value `Encoding 04` for entity `ICE-0002` and attribute `ICE-0001` is stored independently from the decimal value `754.57` for entity `EVEN-001` and attribute `EVEN-005`, and the datetime value `2023-01-03T08:23:46` for entity `EVEN-0002` and attribute `EVEN-0004`. The type-specific value tables enforce schema discipline at the storage level: a value row in `t_lineage_observed_by_event_val_decimal` can only contain numeric data, while `t_lineage_observed_by_event_val_datetime` is constrained to ISO 8601 datetime strings, and `t_lineage_observed_by_event_val_varchar` accommodates free-form text such as `pre-release note` or `en`. This disaggregation, while introducing join complexity, provides type safety and enables efficient indexing on value columns of a single data type.

**t_lineage_observed_by_event_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVEN-0001 | EVEN-0001 | EVEN-0002 | Dimension Kind 01 |
| EVEN-0002 | EVEN-0001 | EVEN-0008 | Encoding 02 |
| EVEN-0003 | EVEN-0001 | EVEN-0009 | pre-release note |
| EVEN-0004 | EVEN-0001 | EVEN-0010 | en |
| EVEN-0005 | EVEN-0001 | EVEN-0003 | manual |
| EVEN-0006 | EVEN-0001 | EVEN-0006 | ratio |
| EVEN-0007 | EVEN-0002 | EVEN-0002 | Dimension Kind 07 |
| EVEN-0008 | EVEN-0002 | EVEN-0008 | Encoding 08 |

Formats and namespaces provide the organizational scaffolding that gives attribute keys their operational context. The attribute key registry maps each `attrkey`—such as `lot_number`, `batch_id`, `operator_code`, or `voltage_read`—to a `describes_property` like `ambient_temperature`, `production_batch`, or `equipment_calibration`, and further annotates it with a `format` specification and a `namespace` designation. The attribute key `lot_number` is formatted as `CSV` and belongs to the `governance` namespace, while `batch_id` uses `UUID` format within the same namespace; by contrast, `operator_code` and `voltage_read` reside in the `telemetry` namespace, both formatted as `UUID` and `E.164` respectively. The namespace distinction between `governance` and `telemetry` is not merely categorical but operational: it signals that governance attributes pertain to regulatory and batch-tracking concerns, whereas telemetry attributes relate to equipment monitoring and calibration data, each with its own compliance requirements and data retention policies.

**t_attrkey_subclass**

| id | attrkey | describes_property | format | namespace |
| --- | --- | --- | --- | --- |
| ATTR-0001 | lot_number | ambient_temperature | CSV | governance |
| ATTR-0002 | batch_id | ambient_temperature | UUID | governance |
| ATTR-0003 | operator_code | production_batch | UUID | telemetry |
| ATTR-0004 | voltage_read | equipment_calibration | E.164 | telemetry |
| ATTR-0005 | flow_rate | equipment_calibration | E.164 | governance |
| ATTR-0006 | lot_number | data_integrity_status | CSV | governance |
| ATTR-0007 | ambient_temp | electrical_voltage | JSON | catalog |

Identifiers throughout the architecture follow a consistent naming convention—`ICE-0001`, `EVEN-0001`, `ATTR-0001`—that encodes both the subclass domain and a sequential position within that domain. The designative identifiers (`CryoStream-Link`, `AeroFrost-ID`, `IceSheet-Ref`) provide human-readable labels for ICE entities, while the lineage identifiers (`sensor-fusion-pipeline`, `financial-risk-model`, `data-lake-ingestion`, `quality-control-assay`) serve the same purpose for event entities. These designative values are not keys but descriptive metadata that accompany the machine-readable identifiers, enabling operators to correlate abstract entity references with their real-world counterparts. The identifier space is partitioned by subclass: ICE identifiers never collide with event identifiers or attribute key identifiers, and the foreign-key relationships between `entity_id` columns and their referenced tables enforce referential integrity across the entire attribute-value graph.

**t_subclass_to_designative_ice**

| id | designative |
| --- | --- |
| ICE-0001 | CryoStream-Link |
| ICE-0002 | CryoVault-Label |
| ICE-0003 | AeroFrost-ID |
| ICE-0004 | IceSheet-Ref |
| ICE-0005 | CryoStream-Link |
| ICE-0006 | IceSheet-Ref |

**t_subclass_to_designative_ice_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ICE-0001 | ICE-0001 | ICE-0001 | Encoding 01 |
| ICE-0002 | ICE-0001 | ICE-0002 | change rationale |
| ICE-0003 | ICE-0001 | ICE-0003 | es |
| ICE-0004 | ICE-0002 | ICE-0001 | Encoding 04 |
| ICE-0005 | ICE-0002 | ICE-0002 | nightly summary |
| ICE-0006 | ICE-0002 | ICE-0003 | fr |
| ICE-0007 | ICE-0003 | ICE-0001 | Encoding 07 |
| ICE-0008 | ICE-0003 | ICE-0002 | change rationale |