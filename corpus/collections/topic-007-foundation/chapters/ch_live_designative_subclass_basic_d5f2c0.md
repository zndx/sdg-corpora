---
chapter_id: ch_live_designative_subclass_basic_d5f2c0
topic_id: 7
family: 01_foundation
cited_terms: ['designative_subclass_basic', 'schemaorg_product_brand', 'entity_type_belongs_to']
model: engine-refine
---

The governance of data assets rests upon a disciplined taxonomy of identifiers, attributes, and their typed values, each serving as a structural anchor within the broader metadata architecture. Every entity—whether an operational component such as `edge_gateway_12` or `sensor_node_47`, or a conceptual construct like `governance_policy_fin`—receives a stable surrogate key, exemplified by the `BELO-0001` through `BELO-0004` sequence, which disambiguates records across the dimensional model. These identifiers propagate through the schema as foreign keys, binding the entity-to-type membership table to its associated value tables and ensuring referential integrity regardless of the underlying attribute's data type. The `t_entity_type_belongs_to` table establishes the classification hierarchy itself, mapping each entity to its semantic category: an `edge_gateway_12` resolves to `IoT Edge Device`, while `sensor_node_47` may simultaneously belong to both `Message Broker Topic` and `Data Quality Rule`, reflecting the multi-faceted nature of modern data assets.

**t_entity_type_belongs_to**

| id | entity | entity_type_belongs_to |
| --- | --- | --- |
| BELO-0001 | edge_gateway_12 | IoT Edge Device |
| BELO-0002 | sensor_node_47 | Message Broker Topic |
| BELO-0003 | governance_policy_fin | Cloud Storage Bucket |
| BELO-0004 | sensor_node_47 | Data Quality Rule |
| BELO-0005 | edge_gateway_12 | Network Telemetry |
| BELO-0006 | edge_gateway_12 | Data Quality Rule |
| BELO-0007 | ml_feature_store_prod | Message Broker Topic |

**t_entity_type_belongs_to_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| BELO-0001 | confidence | xsd:decimal |
| BELO-0002 | dimension_kind | xsd:string |
| BELO-0003 | method | xsd:string |
| BELO-0004 | recorded_at | xsd:dateTime |
| BELO-0005 | uncertainty | xsd:decimal |
| BELO-0006 | unit | xsd:string |
| BELO-0007 | value | xsd:decimal |
| BELO-0008 | encoding | xsd:string |

**t_entity_type_belongs_to_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| BELO-0001 | BELO-0001 | BELO-0004 | 2025-04-30T12:57:36 |
| BELO-0002 | BELO-0002 | BELO-0004 | 2023-11-10T02:05:22 |
| BELO-0003 | BELO-0003 | BELO-0004 | 2023-12-19T19:26:36 |
| BELO-0004 | BELO-0004 | BELO-0004 | 2023-01-25T21:39:36 |
| BELO-0005 | BELO-0005 | BELO-0004 | 2023-12-09T03:03:32 |
| BELO-0006 | BELO-0006 | BELO-0004 | 2023-09-18T08:14:48 |
| BELO-0007 | BELO-0007 | BELO-0004 | 2024-05-10T13:50:46 |

**t_entity_type_belongs_to_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| BELO-0001 | BELO-0001 | BELO-0001 | 0.703 |
| BELO-0002 | BELO-0001 | BELO-0005 | 525.54 |
| BELO-0003 | BELO-0001 | BELO-0007 | 691.11 |
| BELO-0004 | BELO-0002 | BELO-0001 | 0.351 |
| BELO-0005 | BELO-0002 | BELO-0005 | 906.27 |
| BELO-0006 | BELO-0002 | BELO-0007 | 385.85 |
| BELO-0007 | BELO-0003 | BELO-0001 | 0.357 |
| BELO-0008 | BELO-0003 | BELO-0005 | 529.91 |

**t_entity_type_belongs_to_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| BELO-0001 | BELO-0001 | BELO-0002 | Dimension Kind 01 |
| BELO-0002 | BELO-0001 | BELO-0008 | Encoding 02 |
| BELO-0003 | BELO-0001 | BELO-0009 | nightly summary |
| BELO-0004 | BELO-0001 | BELO-0010 | es |
| BELO-0005 | BELO-0001 | BELO-0003 | hybrid |
| BELO-0006 | BELO-0001 | BELO-0006 | ms |
| BELO-0007 | BELO-0002 | BELO-0002 | Dimension Kind 07 |
| BELO-0008 | BELO-0002 | BELO-0008 | Encoding 08 |

Attributes and their types form the second pillar of this taxonomy, defining not only what properties an entity possesses but how those properties are constrained at the schema level. The `t_entity_type_belongs_to_attr` table declares attribute names such as `confidence`, `dimension_kind`, `method`, and `recorded_at`, each bound to an XSD type—`xsd:decimal`, `xsd:string`, or `xsd:dateTime`—that governs validation and serialization. This separation of attribute definition from attribute value is deliberate: it permits a single attribute definition to be referenced across multiple entity instances while the actual values reside in type-specific value tables. The `t_entity_type_belongs_to_val_datetime` table stores temporal values like `2025-04-30T12:57:36` and `2023-11-10T02:05:22`; the `t_entity_type_belongs_to_val_decimal` table holds numeric measures such as `0.703`, `525.54`, and `691.11`; and the `t_entity_type_belongs_to_val_varchar` table captures free-form strings including `Dimension Kind 01`, `Encoding 02`, `nightly summary`, and the language code `es`. By partitioning values along type boundaries, the schema enforces type safety at query time while preserving the flexibility to extend the attribute vocabulary without schema migration.

Brand metadata occupies a parallel dimensional structure, anchored in the `dim_brand` table where each brand receives a unique identifier (`BRAN-0001` through `BRAN-0004`), a human-readable label (`Brand Label 01` through `Brand Label 04`), and a categorical classification (`Brand Category 01` through `Brand Category 04`). This dimension feeds into the `fact_schemaorg` table, which records brand associations through the `brand_key` column—pointing, for instance, to `BRAN-0003`, `BRAN-0005`, `BRAN-0004`, and `BRAN-0002`—alongside technical metadata including `size_bytes` values ranging from `114301972` to `998785819` bytes and `version` numbers spanning `3` through `8`. The size and version fields capture the physical footprint and revision state of schemaorg-aligned assets, enabling capacity planning and change tracking within the governance framework.

**fact_schemaorg**

| id | brand_key | size_bytes | version |
| --- | --- | --- | --- |
| BRAN-0001 | BRAN-0003 | 895265030 | 3 |
| BRAN-0002 | BRAN-0005 | 114301972 | 5 |
| BRAN-0003 | BRAN-0004 | 338701831 | 4 |
| BRAN-0004 | BRAN-0002 | 998785819 | 8 |

**dim_brand**

| id | brand_label | brand_category |
| --- | --- | --- |
| BRAN-0001 | Brand Label 01 | Brand Category 01 |
| BRAN-0002 | Brand Label 02 | Brand Category 02 |
| BRAN-0003 | Brand Label 03 | Brand Category 03 |
| BRAN-0004 | Brand Label 04 | Brand Category 04 |
| BRAN-0005 | Brand Label 05 | Brand Category 05 |
| BRAN-0006 | Brand Label 06 | Brand Category 06 |

The `t_designative_subclass_basic` table introduces a parallel nomenclature layer, where designative codes such as `DESI-0001` through `DESI-0004` identify designative subclasses like `event_tag_crash`, `plate_A04`, and `barcode_8842X`. Each designative carries a classification code (`D-33`, `B-12`, `E-21`) and a language designation (`fr`, `es`), enabling multilingual governance of designative assets. The repetition of `event_tag_crash` across `DESI-0001` and `DESI-0004` with differing language assignments (`fr` and `es` respectively) illustrates how the same designative concept can be localized across linguistic contexts while retaining its structural identity. This multilingual capability, combined with the misc-coded classification system, supports internationalized metadata management without requiring separate tables per language.

**t_designative_subclass_basic**

| id | designative | code | language |
| --- | --- | --- | --- |
| DESI-0001 | event_tag_crash | D-33 | fr |
| DESI-0002 | plate_A04 | B-12 | es |
| DESI-0003 | barcode_8842X | E-21 | fr |
| DESI-0004 | event_tag_crash | D-33 | es |
| DESI-0005 | reagent_Lot_B22 | B-12 | es |
| DESI-0006 | registry_ISO9001 | C-07 | fr |
| DESI-0007 | event_tag_crash | A-01 | es |

Together, these tables constitute a unified metadata governance framework in which identifiers provide stable references, attributes and their types define the schema vocabulary, entity-to-type relationships establish classification hierarchies, and type-specific value tables store actual data while preserving type safety. Brand dimensions and designative subclass tables extend the framework to cover commercial and nomenclatural metadata, respectively. The architecture's strength lies in its normalization: attribute definitions are decoupled from values, brands are separated from their technical metadata, and designatives are localized independently of their structural codes. This separation enables independent evolution of each layer—new attribute types can be added without modifying value tables, brand categories can be reclassified without touching fact records, and designatives can be localized without altering their classification codes.