---
chapter_id: ch_live_classification_basic_1ceabb
topic_id: 19
family: 03_directive_governance
cited_terms: ['classification_basic', 'subclass_to_descriptive_ice', 'mass_function_with_normalization']
model: engine-refine
---

The classification framework organizes operational activities through a structured taxonomy wherein each classification entry carries an identifier, a phase designation, and a trigger mechanism. Classifications such as sensor calibration, data validation, and pipeline orchestration are assigned to discrete lifecycle stages—execution or review—and are initiated through schedule, manual, or retry triggers. The identifier CLAS-0001, for instance, anchors a sensor calibration activity that proceeds through the execution phase and is triggered by schedule, while CLAS-0002 captures a data validation activity under review, initiated manually. This tripartite structure—identifier, phase, and trigger—ensures that every classification is traceable to its operational context and its point of origin, whether automated or human-initiated.

**t_classification_basic**

| id | classification | phase | triggered_by |
| --- | --- | --- | --- |
| CLAS-0001 | sensor calibration | execution | schedule |
| CLAS-0002 | data validation | review | manual |
| CLAS-0003 | pipeline orchestration | execution | schedule |
| CLAS-0004 | sensor calibration | review | retry |
| CLAS-0005 | data ingestion | execution | event |
| CLAS-0006 | batch processing | review | retry |

Descriptive metadata is maintained in a separate construct that associates each entry with a descriptive term, a label text, and a language code. Entries such as ICE-0001 carry the descriptive term schema_version_patch with the label text intake form in English, whereas ICE-0003 holds the descriptive term metadata_registry paired with the label text calibration record in German. The language field supports multilingual labeling, with entries recorded in English, German, and Japanese, enabling the system to present classification metadata in the appropriate linguistic context for its consumers. The label text serves as a human-readable anchor—intake form, calibration record, audit excerpt—while the descriptive term provides the machine-consumable identifier for the subclass.

**t_subclass_to_descriptive_ice**

| id | descriptive | label_text | language |
| --- | --- | --- | --- |
| ICE-0001 | schema_version_patch | intake form | en |
| ICE-0002 | annotation_layer_b | intake form | de |
| ICE-0003 | metadata_registry | calibration record | de |
| ICE-0004 | metadata_registry | audit excerpt | en |
| ICE-0005 | quality_flag_alpha | nightly summary | fr |
| ICE-0006 | telemetry_header | intake form | es |

The mass function with normalization table bridges classifications to their descriptive metadata through a normalization constant that references an entry in the descriptive table. A mass value such as Rotor-Assembly-M (identifier NORM-0001) is normalized against ICE-0005, while Batch-7721 (NORM-0002) normalizes against ICE-0003, and Dust-Collection-1 (NORM-0004) against ICE-0001. This linkage ensures that every mass assignment is grounded in a known descriptive term and its associated label and language, creating a chain of traceability from the operational mass through to its human-readable description.

**t_mass_function_with_normalization**

| id | mass | normalization_constant |
| --- | --- | --- |
| NORM-0001 | Rotor-Assembly-M | ICE-0005 |
| NORM-0002 | Batch-7721 | ICE-0003 |
| NORM-0003 | Core-Segment-12 | ICE-0006 |
| NORM-0004 | Dust-Collection-1 | ICE-0001 |
| NORM-0005 | Powder-Grade-B | ICE-0002 |
| NORM-0006 | Rotor-Assembly-M | ICE-0006 |

Attributes are defined with a name and a type, establishing the schema against which values are validated. The attribute confidence is typed as xsd:decimal, dimension_kind and method as xsd:string, and recorded_at as xsd:dateTime. These type declarations constrain the domain of permissible values and enable the system to route attribute values to the appropriate storage table. The attribute definition table thus serves as the schema registry, decoupling structural definitions from the data they govern.

Attribute values are stored in type-specific tables, each keyed by entity and attribute identifiers. Decimal values such as 0.715 and 0.608 populate the confidence attribute for entities NORM-0001 and NORM-0002, while dimension_kind records values like 279.33 and 243.08. String attributes carry values including Dimension Kind 01, Encoding 02, nightly summary, and ja, with the latter indicating a Japanese-language value. Datetime attributes store timestamps such as 2024-12-04T17:58:43 and 2023-02-03T12:29:30, providing precise temporal provenance for recorded events. The entity identifier in each value row references the mass function entry, the attribute identifier references the attribute definition, and the value column holds the misc data—the actual measurement, label, or timestamp—completing the chain from classification through description to measured fact.

**t_mass_function_with_normalization_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| NORM-0001 | confidence | xsd:decimal |
| NORM-0002 | dimension_kind | xsd:string |
| NORM-0003 | method | xsd:string |
| NORM-0004 | recorded_at | xsd:dateTime |
| NORM-0005 | uncertainty | xsd:decimal |
| NORM-0006 | unit | xsd:string |
| NORM-0007 | value | xsd:decimal |
| NORM-0008 | encoding | xsd:string |

**t_mass_function_with_normalization_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| NORM-0001 | NORM-0001 | NORM-0004 | 2024-12-04T17:58:43 |
| NORM-0002 | NORM-0002 | NORM-0004 | 2023-02-03T12:29:30 |
| NORM-0003 | NORM-0003 | NORM-0004 | 2024-03-08T15:41:30 |
| NORM-0004 | NORM-0004 | NORM-0004 | 2023-01-16T04:53:31 |
| NORM-0005 | NORM-0005 | NORM-0004 | 2023-05-04T19:41:54 |
| NORM-0006 | NORM-0006 | NORM-0004 | 2025-01-09T01:34:48 |

**t_mass_function_with_normalization_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| NORM-0001 | NORM-0001 | NORM-0001 | 0.715 |
| NORM-0002 | NORM-0001 | NORM-0005 | 279.33 |
| NORM-0003 | NORM-0001 | NORM-0007 | 243.08 |
| NORM-0004 | NORM-0002 | NORM-0001 | 0.608 |
| NORM-0005 | NORM-0002 | NORM-0005 | 643.66 |
| NORM-0006 | NORM-0002 | NORM-0007 | 319.15 |
| NORM-0007 | NORM-0003 | NORM-0001 | 0.596 |
| NORM-0008 | NORM-0003 | NORM-0005 | 676.31 |

**t_mass_function_with_normalization_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| NORM-0001 | NORM-0001 | NORM-0002 | Dimension Kind 01 |
| NORM-0002 | NORM-0001 | NORM-0008 | Encoding 02 |
| NORM-0003 | NORM-0001 | NORM-0009 | nightly summary |
| NORM-0004 | NORM-0001 | NORM-0010 | ja |
| NORM-0005 | NORM-0001 | NORM-0003 | manual |
| NORM-0006 | NORM-0001 | NORM-0006 | count |
| NORM-0007 | NORM-0002 | NORM-0002 | Dimension Kind 07 |
| NORM-0008 | NORM-0002 | NORM-0008 | Encoding 08 |