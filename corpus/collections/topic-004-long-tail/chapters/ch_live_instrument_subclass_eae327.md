---
chapter_id: ch_live_instrument_subclass_eae327
topic_id: 4
family: 01_foundation
cited_terms: ['instrument_subclass', 'column_dropped_at_version', 'shell_dimension_specification']
model: engine-refine
---

In robust data governance frameworks, the integrity of an analytical system relies on precise entity identification and lifecycle tracking. Every asset, whether a physical instrument like an X-Ray Diffractometer Bruker D8 or a biological shell dimension specification (`shelldimensionspecification`) such as *Venus_venerupis_Mediterranean*, is anchored by a unique identifier (e.g., `INST-0001` or `SPEC-0001`). These identifiers serve as the primary keys for auditing and lineage. The temporal dimension of these entities is captured through creation dates (`createddate`), such as `2023-09-27`, ensuring that historical context is preserved. Furthermore, metadata tags—ranging from `archived` to `verified`—provide immediate operational status, allowing systems to distinguish between active assets and those reserved for historical reference or internal use.

**t_instrument_subclass**

| id | instrument | produces_measurement | created_date | tags |
| --- | --- | --- | --- | --- |
| INST-0001 | X-Ray Diffractometer Bruker D8 | ion intensity | 2023-09-27 | archived |
| INST-0002 | Flow Cytometer BD FACSCanto | infrared radiation | 2023-08-26 | internal |
| INST-0003 | Seismometer CMG-3ESP | ground acceleration | 2023-03-12 | verified |
| INST-0004 | Spectrophotometer XPS-500 | ground acceleration | 2023-09-07 | verified |
| INST-0005 | Flow Cytometer BD FACSCanto | voltage waveform | 2023-03-06 | pii |
| INST-0006 | Thermal Imager FLIR T640 | ion intensity | 2024-03-26 | archived |

**t_shell_dimension_specification**

| id | shell_dimension_specification |
| --- | --- |
| SPEC-0001 | Venus_venerupis_Mediterranean |
| SPEC-0002 | Cypraea_tigris_Asian |
| SPEC-0003 | Littorina_obtusa_Urban |
| SPEC-0004 | Strombus_gigas_Tropical |
| SPEC-0005 | Ostrea_gigas_Brittany |
| SPEC-0006 | Nassa_pertenuis_Coast |
| SPEC-0007 | Strongylocentrotus_pacificus_Puget |

**t_shell_dimension_specification_attr**

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

**t_shell_dimension_specification_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SPEC-0001 | SPEC-0001 | SPEC-0004 | 2024-08-09T04:20:11 |
| SPEC-0002 | SPEC-0002 | SPEC-0004 | 2023-01-11T02:33:00 |
| SPEC-0003 | SPEC-0003 | SPEC-0004 | 2025-04-11T22:51:28 |
| SPEC-0004 | SPEC-0004 | SPEC-0004 | 2025-04-30T10:31:45 |
| SPEC-0005 | SPEC-0005 | SPEC-0004 | 2023-04-03T22:35:38 |
| SPEC-0006 | SPEC-0006 | SPEC-0004 | 2023-08-11T07:42:35 |
| SPEC-0007 | SPEC-0007 | SPEC-0004 | 2025-04-06T02:27:44 |

**t_shell_dimension_specification_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SPEC-0001 | SPEC-0001 | SPEC-0001 | 0.130 |
| SPEC-0002 | SPEC-0001 | SPEC-0005 | 733.39 |
| SPEC-0003 | SPEC-0001 | SPEC-0007 | 125.34 |
| SPEC-0004 | SPEC-0002 | SPEC-0001 | 0.624 |
| SPEC-0005 | SPEC-0002 | SPEC-0005 | 68.87 |
| SPEC-0006 | SPEC-0002 | SPEC-0007 | 303.82 |
| SPEC-0007 | SPEC-0003 | SPEC-0001 | 0.168 |
| SPEC-0008 | SPEC-0003 | SPEC-0005 | 203.41 |

**t_shell_dimension_specification_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SPEC-0001 | SPEC-0001 | SPEC-0002 | Dimension Kind 01 |
| SPEC-0002 | SPEC-0001 | SPEC-0008 | Encoding 02 |
| SPEC-0003 | SPEC-0001 | SPEC-0009 | nightly summary |
| SPEC-0004 | SPEC-0001 | SPEC-0010 | ja |
| SPEC-0005 | SPEC-0001 | SPEC-0003 | manual |
| SPEC-0006 | SPEC-0001 | SPEC-0006 | nm |
| SPEC-0007 | SPEC-0002 | SPEC-0002 | Dimension Kind 07 |
| SPEC-0008 | SPEC-0002 | SPEC-0008 | Encoding 08 |

As analytical models mature, schema evolution becomes a critical governance concern, particularly regarding the deprecation of columns or data elements. The concept of a "dropped at schema version" dictates when a specific data element is retired from the active schema, ensuring backward compatibility and clean data migration. This deprecation process is categorized to provide context; for instance, a version might be classified under `Dropped At Schema Version Category 01` or `02`, linking the technical retirement of a column to a broader governance category. By mapping these version identifiers (such as `VERS-0001` through `VERS-0006`) to descriptive labels, data stewards can trace exactly when and why specific data structures were phased out, maintaining a clear audit trail of the system's architectural history.

**fact_column**

| id | dropped_at_schema_version_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| VERS-0001 | VERS-0006 | 0.164 | 560.21 | 257.80 |
| VERS-0002 | VERS-0004 | 0.068 | 744.10 | 571.55 |
| VERS-0003 | VERS-0006 | 0.107 | 984.09 | 140.18 |
| VERS-0004 | VERS-0001 | 0.354 | 404.01 | 131.27 |
| VERS-0005 | VERS-0005 | 0.790 | 109.97 | 235.19 |
| VERS-0006 | VERS-0001 | 0.934 | 653.09 | 813.74 |
| VERS-0007 | VERS-0006 | 0.938 | 827.04 | 409.13 |
| VERS-0008 | VERS-0001 | 0.734 | 419.22 | 492.32 |

**dim_dropped_at_schema_version**

| id | dropped_at_schema_version_label | dropped_at_schema_version_category |
| --- | --- | --- |
| VERS-0001 | Dropped At Schema Version Label 01 | Dropped At Schema Version Category 01 |
| VERS-0002 | Dropped At Schema Version Label 02 | Dropped At Schema Version Category 02 |
| VERS-0003 | Dropped At Schema Version Label 03 | Dropped At Schema Version Category 03 |
| VERS-0004 | Dropped At Schema Version Label 04 | Dropped At Schema Version Category 04 |
| VERS-0005 | Dropped At Schema Version Label 05 | Dropped At Schema Version Category 05 |
| VERS-0006 | Dropped At Schema Version Label 06 | Dropped At Schema Version Category 06 |

To support flexible yet rigorous data modeling, the system employs a typed-attribute architecture where metadata is decoupled from the entity itself. An `attr` (attribute) defines a specific characteristic of an entity, such as `confidence`, `dimension_kind`, or `recorded_at`. Crucially, each attribute is bound to a strict `attr_type`, such as `xsd:decimal`, `xsd:string`, or `xsd:dateTime`, which enforces data integrity at the schema level. This typing mechanism dictates how values are stored; for example, a `dimension_kind` is persisted as a string like `Dimension Kind 01`, while a numeric measurement is stored as a decimal value like `0.130` in a `misc` column. Similarly, temporal attributes capture precise timestamps, such as `2024-08-09T04:20:11`, ensuring that all entity properties adhere to their defined semantic types.

Beyond structural integrity, the framework quantifies the reliability of data through explicit measures of confidence and uncertainty. In measurement-heavy domains, such as tracking the output of a Flow Cytometer BD FACSCanto or a Seismometer CMG-3ESP, raw values must be contextualized by their precision. The system captures this through a `confidence` score—represented as a decimal like `0.164` or `0.354`—which inversely correlates with the `uncertainty` margin, recorded as a magnitude such as `560.21` or `984.09`. These metrics, often stored alongside the actual measurement value (misc), allow downstream consumers to weigh the trustworthiness of the data. Whether evaluating the `ion intensity` produced by an instrument or the dimensions of a shell specimen, these quantitative quality indicators are essential for risk-aware analytics and compliant reporting.