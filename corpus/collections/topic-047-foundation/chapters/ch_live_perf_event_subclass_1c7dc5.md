---
chapter_id: ch_live_perf_event_subclass_1c7dc5
topic_id: 47
family: 07_long_tail
cited_terms: ['perf_event_subclass', 'ice_exactly_one_subject', 'mass_function_with_focal_element']
model: engine-refine
---

The evidentiary backbone of the system rests on mass-function assignments that bind concrete physical samples to abstract focal elements through quantified confidence and documented provenance. Each assignment carries a mass value—such as a 1.5 L coolant sample, a 3.7 g soil core, or a 920 g polymer pellet—paired with a confidence coefficient ranging from 0.033 to 0.941, and a method designation of manual, hybrid, or automated. The focal element to which each mass is assigned is itself an entity identifier, for instance SUBJ-0002 or SUBJ-0003, linking the physical observation to a structured subject such as a Calibration Manifest, a Provenance Graph Export, or a Raw Observation Feed. This triad of mass, confidence, and method constitutes the primary evidentiary record, enabling downstream reasoning that distinguishes high-certainty assignments (0.941 for a 920 g polymer pellet processed through an automated pipeline) from those warranting skepticism (0.033 for a 3.7 g soil core derived via hybrid methodology).

**t_ice_exactly_one_subject**

| id | ice | related |
| --- | --- | --- |
| SUBJ-0001 | Calibration Manifest | ELEM-0003 |
| SUBJ-0002 | Provenance Graph Export | ELEM-0004 |
| SUBJ-0003 | Raw Observation Feed | ELEM-0001 |
| SUBJ-0004 | Provenance Graph Export | ELEM-0006 |
| SUBJ-0005 | Schema Registry Entry | ELEM-0005 |
| SUBJ-0006 | Audit Trail Report | ELEM-0002 |
| SUBJ-0007 | Schema Registry Entry | ELEM-0004 |
| SUBJ-0008 | Sensor Configuration File | ELEM-0003 |

**t_mass_function_with_focal_element**

| id | mass | focal_element | confidence | method |
| --- | --- | --- | --- | --- |
| ELEM-0001 | 1.5L coolant sample | SUBJ-0002 | 0.863 | manual |
| ELEM-0002 | 3.7g soil core | SUBJ-0005 | 0.119 | hybrid |
| ELEM-0003 | 920g polymer pellet | SUBJ-0002 | 0.941 | automated |
| ELEM-0004 | 3.7g soil core | SUBJ-0003 | 0.033 | hybrid |
| ELEM-0005 | 500MB telemetry dump | SUBJ-0007 | 0.250 | hybrid |
| ELEM-0006 | 3.8kg sensor housing | SUBJ-0006 | 0.713 | manual |

Entities are identified through a uniform identifier scheme that spans both performance-event and subject domains. Performance events carry identifiers such as EVEN-0001 through EVEN-0004, each associated with a specific metric—thread_contention, disk_io_ops, or network_bytes—and a reference to an element configuration like ELEM-0001 or ELEM-0004. Subject entities, by contrast, bear identifiers such as SUBJ-0001 through SUBJ-0004 and are linked to element references including ELEM-0001, ELEM-0003, ELEM-0004, and ELEM-0006. The identifier space is thus partitioned by domain prefix, yet both categories participate in the same attribute-value architecture, allowing a single entity to carry heterogeneous data without schema collision.

**t_perf_event_subclass**

| id | perf | perf_event_config |
| --- | --- | --- |
| EVEN-0001 | thread_contention | ELEM-0004 |
| EVEN-0002 | disk_io_ops | ELEM-0001 |
| EVEN-0003 | disk_io_ops | ELEM-0003 |
| EVEN-0004 | network_bytes | ELEM-0004 |
| EVEN-0005 | network_bytes | ELEM-0004 |
| EVEN-0006 | jvm_heap_used | ELEM-0003 |

**t_perf_event_subclass_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVEN-0001 | EVEN-0001 | EVEN-0006 | 193 |
| EVEN-0002 | EVEN-0001 | EVEN-0008 | 8 |
| EVEN-0003 | EVEN-0002 | EVEN-0006 | 332 |
| EVEN-0004 | EVEN-0002 | EVEN-0008 | 11 |
| EVEN-0005 | EVEN-0003 | EVEN-0006 | 351 |
| EVEN-0006 | EVEN-0003 | EVEN-0008 | 10 |
| EVEN-0007 | EVEN-0004 | EVEN-0006 | 314 |
| EVEN-0008 | EVEN-0004 | EVEN-0008 | 12 |

Attribute definitions govern the shape and semantics of every datum stored against an entity. An attribute is declared by name and type; the type encodes the expected value format, whether xsd:string for free-form text, xsd:date for temporal values, xsd:string for encoding or language metadata, or cco:DesignativeICE for designative identifiers. For performance events, attributes include checksum, created_date, identifier, and license, each typed accordingly. For subjects, the attribute set comprises encoding, label_text, and language, all of xsd:string. The attr_name and attr_type columns together form a lightweight schema registry that constrains and describes the values subsequently stored in the value tables, ensuring that a date value such as 2024-03-08 or 2023-08-29 is only ever written against an attribute of type xsd:date, and that a license string like MPL-2.0 or an OID such as oid:1.3.6.1 is routed to the correct varchar store.

**t_perf_event_subclass_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| EVEN-0001 | checksum | xsd:string |
| EVEN-0002 | created_date | xsd:date |
| EVEN-0003 | identifier | cco:DesignativeICE |
| EVEN-0004 | license | xsd:string |
| EVEN-0005 | mime_type | xsd:string |
| EVEN-0006 | size_bytes | xsd:long |
| EVEN-0007 | uri | xsd:string |
| EVEN-0008 | version | xsd:integer |

**t_perf_event_subclass_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVEN-0001 | EVEN-0001 | EVEN-0002 | 2024-03-08 |
| EVEN-0002 | EVEN-0002 | EVEN-0002 | 2023-08-29 |
| EVEN-0003 | EVEN-0003 | EVEN-0002 | 2025-04-08 |
| EVEN-0004 | EVEN-0004 | EVEN-0002 | 2024-10-09 |
| EVEN-0005 | EVEN-0005 | EVEN-0002 | 2024-06-29 |
| EVEN-0006 | EVEN-0006 | EVEN-0002 | 2025-04-11 |

**t_perf_event_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVEN-0001 | EVEN-0001 | EVEN-0001 | 9d2b7a16 |
| EVEN-0002 | EVEN-0001 | EVEN-0003 | oid:1.3.6.1 |
| EVEN-0003 | EVEN-0001 | EVEN-0004 | MPL-2.0 |
| EVEN-0004 | EVEN-0001 | EVEN-0009 | ap-south-2 |
| EVEN-0005 | EVEN-0001 | EVEN-0005 | application/json |
| EVEN-0006 | EVEN-0001 | EVEN-0010 | Name 06 |
| EVEN-0007 | EVEN-0001 | EVEN-0011 | data-engineering |
| EVEN-0008 | EVEN-0001 | EVEN-0012 | Tags 08 |

**t_ice_exactly_one_subject_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| SUBJ-0001 | encoding | xsd:string |
| SUBJ-0002 | label_text | xsd:string |
| SUBJ-0003 | language | xsd:string |

**t_ice_exactly_one_subject_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SUBJ-0001 | SUBJ-0001 | SUBJ-0001 | Encoding 01 |
| SUBJ-0002 | SUBJ-0001 | SUBJ-0002 | nightly summary |
| SUBJ-0003 | SUBJ-0001 | SUBJ-0003 | fr |
| SUBJ-0004 | SUBJ-0002 | SUBJ-0001 | Encoding 04 |
| SUBJ-0005 | SUBJ-0002 | SUBJ-0002 | intake form |
| SUBJ-0006 | SUBJ-0002 | SUBJ-0003 | de |
| SUBJ-0007 | SUBJ-0003 | SUBJ-0001 | Encoding 07 |
| SUBJ-0008 | SUBJ-0003 | SUBJ-0002 | intake form |

Value storage is partitioned by type to preserve type safety while supporting the full range of data encountered in practice. Date values are written to a dedicated date table, where entity_id and attr_id columns jointly reference the target entity and attribute, and the value column holds dates such as 2024-10-09 or 2025-04-08. Integer values—193, 8, 332, 11—reside in an integer table with the same entity_id and attr_id foreign keys, while string values occupy a varchar table, carrying identifiers like 9d2b7a16, regional endpoints such as ap-south-2, descriptive labels like nightly summary, and language codes such as fr. The entity_id column in each value table is the foreign key that binds the datum to its subject or event, and the attr_id column resolves to the corresponding attribute definition, creating a three-way join between entity, attribute, and value that is both type-safe and extensible.

The method column in the mass-function table provides the provenance layer that distinguishes how each evidentiary assignment was produced. Manual assignments, such as the one linking a 1.5 L coolant sample to SUBJ-0002 with a confidence of 0.863, carry an implicit human review step. Hybrid assignments—like the 3.7 g soil core linked to SUBJ-0005 at 0.119 confidence or the 3.7 g soil core linked to SUBJ-0003 at 0.033 confidence—indicate a mixed pipeline where automated processing was supplemented by human intervention. Automated assignments, exemplified by the 920 g polymer pellet at 0.941 confidence, reflect fully instrumented workflows. This method provenance, combined with the confidence coefficient, allows consumers of the data to weight evidence appropriately and to audit the chain of custody from raw observation through to final assignment.