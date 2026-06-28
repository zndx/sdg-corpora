---
chapter_id: ch_live_subclass_to_descriptive_ice_05fa64
topic_id: 7
family: 01_foundation
cited_terms: ['subclass_to_descriptive_ice', 'subclass_to_designative_ice', 'subclass_to_directive_ice']
model: engine-refine
---

Attribute definitions in this schema are organized through a disciplined separation of metadata specification from value storage, a pattern that supports both type safety and flexible data population. The attribute catalogue—captured in the designative attribute table—establishes each attribute by name and type, where attributes such as `encoding`, `label_text`, and `language` are all declared with the `xsd:string` type, ensuring uniform serialization constraints across the attribute family. These attribute identifiers (e.g., `ICE-0001` through `ICE-0003`) serve as the stable keys that bind the attribute definition layer to the value layer, where actual data resides in the varchar value table. That value table maps each attribute back to a specific `entity_id`, creating a normalized entity-attribute-value structure: for instance, entity `ICE-0001` carries the attribute values "Encoding 01", "change rationale", and "es" across its three associated attributes, while entity `ICE-0002` holds "Encoding 04" and "es" under a different attribute assignment. This decoupling allows attributes to be defined once and referenced across multiple entities without schema modification.

**t_subclass_to_designative_ice**

| id | designative |
| --- | --- |
| ICE-0001 | CryoStream-Link |
| ICE-0002 | CryoVault-Label |
| ICE-0003 | AeroFrost-ID |
| ICE-0004 | IceSheet-Ref |
| ICE-0005 | CryoStream-Link |
| ICE-0006 | IceSheet-Ref |

**t_subclass_to_designative_ice_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ICE-0001 | encoding | xsd:string |
| ICE-0002 | label_text | xsd:string |
| ICE-0003 | language | xsd:string |

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

Encoding, as both an attribute concept and a concrete data property, operates at two distinct levels within the architecture. At the value level, entities store encoding identifiers such as "Encoding 01" and "Encoding 04" as string values attached to the `encoding` attribute, functioning as internal classification codes that may reference character set conventions or data format specifications. At the directive level, encoding appears as a structural property of the directive records themselves, where directives like `ProvenanceTraceRequirement` and `EncryptionStandard` are annotated with the encoding `ascii`, while `CalibrationInstruction` records carry the encoding `unicode`. This dual presence—encoding as a stored entity attribute and encoding as a directive-level metadata field—reflects the distinction between data that describes an entity's properties and data that governs how the entity's content should be processed or transmitted.

**t_subclass_to_directive_ice**

| id | directive | encoding | label_text |
| --- | --- | --- | --- |
| ICE-0001 | ProvenanceTraceRequirement | ascii | intake form |
| ICE-0002 | EncryptionStandard | ascii | calibration record |
| ICE-0003 | CalibrationInstruction | unicode | nightly summary |
| ICE-0004 | CalibrationInstruction | unicode | intake form |
| ICE-0005 | BatchIngestionRule | ascii | nightly summary |

The identifier system provides the connective tissue across all five tables, with values such as `ICE-0001`, `ICE-0002`, `ICE-0003`, and `ICE-0004` serving as the universal reference point. Each identifier anchors a coherent cluster of related information: `ICE-0001` links to the designative value `CryoStream-Link`, the descriptive label "intake form" in English, the directive `ProvenanceTraceRequirement` with `ascii` encoding, and a set of three attribute values spanning encoding, rationale, and language specification. The identifier's role as a foreign key across the descriptive, designative, directive, and value tables ensures referential integrity while allowing each table to evolve independently—new attributes can be added to the attribute catalogue without touching existing descriptive or directive records, and new entities can be populated by inserting value rows that reference existing attribute identifiers.

**t_subclass_to_descriptive_ice**

| id | descriptive | label_text | language |
| --- | --- | --- | --- |
| ICE-0001 | schema_version_patch | intake form | en |
| ICE-0002 | annotation_layer_b | intake form | de |
| ICE-0003 | metadata_registry | calibration record | de |
| ICE-0004 | metadata_registry | audit excerpt | en |

Label text and language function as complementary descriptive dimensions that qualify both entities and directives. The descriptive table associates label texts such as "intake form", "calibration record", and "audit excerpt" with their corresponding identifiers, while also recording the language of each label—`en` for English entries like "intake form" and `de` for German-language labels. The same label text may appear across multiple identifiers ("intake form" is associated with both `ICE-0001` and `ICE-0002`), suggesting that labels serve as reusable classification tokens rather than unique descriptors. In the directive table, label texts follow a similar pattern: "intake form" appears alongside directives `ProvenanceTraceRequirement` and `CalibrationInstruction`, while "calibration record" and "nightly summary" provide additional contextual framing. The language attribute, defined as `xsd:string` in the attribute catalogue, is itself populated as a value in the entity-attribute-value table (with values like "es"), demonstrating that language metadata is treated as a first-class attribute that can be attached to entities just like encoding or label text.