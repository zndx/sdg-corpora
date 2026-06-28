---
chapter_id: ch_live_equiv_intersect_with_negation_29f198
topic_id: 62
family: 01_foundation
cited_terms: ['equiv_intersect_with_negation', 'schemaorg_label_alignment', 'schemaorg_product_sku']
model: engine-refine
---

Attributes, their types, entities, and identifiers constitute the foundational vocabulary of any structured data governance framework. An entity represents a distinct, addressable thing within the data model—whether a product such as the Pixel 8 Pro or the Galaxy S24 Ultra, a schema.org class like Person or Place, or a conceptual construct such as ClinicalTrial or SensorGateway. Each entity receives a unique identifier, a stable key that enables unambiguous reference across all downstream operations. In the alignment domain, identifiers such as ALIG-0001 and ALIG-0002 anchor rows that map schema.org terms to their corresponding labels; in the product domain, identifiers like SKU-0001 and SKU-0002 anchor rows that associate schema.org classes with commercial SKUs such as SNY-PS5-STD and APL-IP15-256-BLK. The identifier is the invariant thread through which all attribute definitions and attribute values are connected to their parent entity.

**t_schemaorg_label_alignment**

| id | schemaorg | aligned_to_schema_org_label |
| --- | --- | --- |
| ALIG-0001 | Pixel 8 Pro | geo_location |
| ALIG-0002 | Place | geo_location |
| ALIG-0003 | Galaxy S24 Ultra | Pixel 8 Pro |
| ALIG-0004 | work_title | event_timestamp |
| ALIG-0005 | role_title | geo_location |
| ALIG-0006 | event_timestamp | Pixel 8 Pro |
| ALIG-0007 | Artisan 5-qt | Dataset |
| ALIG-0008 | MedicalCondition | work_title |

**t_schemaorg_label_alignment_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ALIG-0001 | confidence | xsd:decimal |
| ALIG-0002 | dimension_kind | xsd:string |
| ALIG-0003 | method | xsd:string |
| ALIG-0004 | recorded_at | xsd:dateTime |
| ALIG-0005 | uncertainty | xsd:decimal |
| ALIG-0006 | unit | xsd:string |
| ALIG-0007 | value | xsd:decimal |
| ALIG-0008 | encoding | xsd:string |

**t_schemaorg_label_alignment_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ALIG-0001 | ALIG-0001 | ALIG-0004 | 2024-11-29T12:22:57 |
| ALIG-0002 | ALIG-0002 | ALIG-0004 | 2024-10-21T02:32:32 |
| ALIG-0003 | ALIG-0003 | ALIG-0004 | 2024-04-16T22:29:51 |
| ALIG-0004 | ALIG-0004 | ALIG-0004 | 2024-04-08T02:25:07 |
| ALIG-0005 | ALIG-0005 | ALIG-0004 | 2024-04-01T00:20:16 |
| ALIG-0006 | ALIG-0006 | ALIG-0004 | 2024-06-23T20:04:43 |
| ALIG-0007 | ALIG-0007 | ALIG-0004 | 2025-03-29T09:58:30 |
| ALIG-0008 | ALIG-0008 | ALIG-0004 | 2024-10-23T02:04:00 |

**t_schemaorg_label_alignment_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ALIG-0001 | ALIG-0001 | ALIG-0001 | 0.916 |
| ALIG-0002 | ALIG-0001 | ALIG-0005 | 747.18 |
| ALIG-0003 | ALIG-0001 | ALIG-0007 | 963.37 |
| ALIG-0004 | ALIG-0002 | ALIG-0001 | 0.264 |
| ALIG-0005 | ALIG-0002 | ALIG-0005 | 721.79 |
| ALIG-0006 | ALIG-0002 | ALIG-0007 | 736.70 |
| ALIG-0007 | ALIG-0003 | ALIG-0001 | 0.758 |
| ALIG-0008 | ALIG-0003 | ALIG-0005 | 440.87 |

**t_schemaorg_label_alignment_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ALIG-0001 | ALIG-0001 | ALIG-0002 | Dimension Kind 01 |
| ALIG-0002 | ALIG-0001 | ALIG-0008 | Encoding 02 |
| ALIG-0003 | ALIG-0001 | ALIG-0009 | nightly summary |
| ALIG-0004 | ALIG-0001 | ALIG-0010 | fr |
| ALIG-0005 | ALIG-0001 | ALIG-0003 | automated |
| ALIG-0006 | ALIG-0001 | ALIG-0006 | count |
| ALIG-0007 | ALIG-0002 | ALIG-0002 | Dimension Kind 07 |
| ALIG-0008 | ALIG-0002 | ALIG-0008 | Encoding 08 |

**t_schemaorg_product_sku**

| id | schemaorg | s_k_u |
| --- | --- | --- |
| SKU-0001 | Person | SNY-PS5-STD |
| SKU-0002 | org_id | KCH-A5-RED |
| SKU-0003 | Galaxy S24 Ultra | BSQ-QC4-BRN |
| SKU-0004 | work_title | APL-IP15-256-BLK |
| SKU-0005 | role_title | APL-IP15-256-BLK |
| SKU-0006 | course_title | BSQ-QC4-BRN |

**t_schemaorg_product_sku_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| SKU-0001 | checksum | xsd:string |
| SKU-0002 | created_date | xsd:date |
| SKU-0003 | identifier | cco:DesignativeICE |
| SKU-0004 | license | xsd:string |
| SKU-0005 | mime_type | xsd:string |
| SKU-0006 | size_bytes | xsd:long |
| SKU-0007 | uri | xsd:string |
| SKU-0008 | version | xsd:integer |

**t_schemaorg_product_sku_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SKU-0001 | SKU-0001 | SKU-0006 | 222 |
| SKU-0002 | SKU-0001 | SKU-0008 | 9 |
| SKU-0003 | SKU-0002 | SKU-0006 | 488 |
| SKU-0004 | SKU-0002 | SKU-0008 | 10 |
| SKU-0005 | SKU-0003 | SKU-0006 | 413 |
| SKU-0006 | SKU-0003 | SKU-0008 | 5 |
| SKU-0007 | SKU-0004 | SKU-0006 | 223 |
| SKU-0008 | SKU-0004 | SKU-0008 | 4 |

Attributes define the properties of an entity, each with a name and a declared type that governs how values are stored and validated. The attribute schema establishes the contract: an attribute named confidence carries the type xsd:decimal, while recorded_at carries xsd:dateTime, and dimension_kind carries xsd:string. This type discipline is not decorative—it determines which value table receives a given datum. Decimal-valued attributes such as confidence, with observed values of 0.916 and 0.264, are persisted in the decimal value store alongside measurements like 747.18 and 963.37. String-valued attributes such as dimension_kind hold values like Dimension Kind 01 and Encoding 02, while date-valued attributes such as created_date store temporal markers like 2025-05-15 and 2023-06-09. Integer-valued attributes capture counts and identifiers—222, 9, 488, 10—without the overhead of string serialization. The attr_type column encodes the XML Schema or Content Commons ontology namespace (xsd:decimal, xsd:string, xsd:dateTime, cco:DesignativeICE), ensuring that type enforcement is explicit and machine-readable.

The value tables implement a vertical partitioning strategy that separates data by type while preserving relational integrity through foreign keys. Each value row carries an entity_id that points back to the entity definition, an attr_id that points to the attribute definition, and a value column whose semantics are determined by the table itself. For alignment entities, the datetime value table stores timestamps such as 2024-11-29T12:22:57 and 2024-04-08T02:25:07, all referencing attr_id ALIG-0004, which corresponds to the recorded_at attribute. The decimal value table distributes its rows across multiple attributes—ALIG-0001, ALIG-0005, ALIG-0007—allowing a single entity like ALIG-0001 to carry three distinct decimal measurements (0.916, 747.18, 963.37) without schema modification. The varchar value table similarly supports multiple string attributes per entity, with ALIG-0001 holding values ranging from nightly summary to the locale code fr. This design avoids nullable columns and type coercion, at the cost of requiring joins across four value tables to reconstruct a complete entity profile.

Equivalence and negation mappings operate as a parallel indexing layer, independent of the schema.org alignment infrastructure but sharing the same identifier discipline. The equivalence intersection table assigns identifiers such as NEGA-0001 through NEGA-0004 to triples of related terms. NEGA-0001 links ClinicalTrial, RegistryCatalog, and NonCompliant; NEGA-0002 and NEGA-0004 both reference SensorGateway paired with DependencyGraph and Automated, suggesting a many-to-many relationship where a single equivalence class can be expressed through multiple term combinations. These mappings serve as a semantic bridge, enabling systems to recognize that ClinicalTrial and RegistryCatalog belong to the same conceptual intersection even when they appear under different naming conventions. The negation qualifier—NonCompliant versus Automated—adds a polarity dimension that can drive filtering, alerting, or compliance decision logic.

**t_equiv_intersect_with_negation**

| id | equiv | equiv_2 | equiv_3 |
| --- | --- | --- | --- |
| NEGA-0001 | ClinicalTrial | RegistryCatalog | NonCompliant |
| NEGA-0002 | SensorGateway | DependencyGraph | Automated |
| NEGA-0003 | DataLineage | DependencyGraph | Automated |
| NEGA-0004 | SensorGateway | TrialPhase | RealTime |
| NEGA-0005 | TelemetryStream | NetworkDevice | Manual |
| NEGA-0006 | TelemetryStream | NetworkDevice | Manual |
| NEGA-0007 | KafkaPipeline | TrialPhase | NonCompliant |

Product SKU alignment extends the same attribute-value pattern into the commercial domain. The product SKU table maps schema.org classes such as Person, org_id, and work_title to concrete SKU identifiers like BSQ-QC4-BRN and KCH-A5-RED. Its attribute schema defines properties including checksum (xsd:string), created_date (xsd:date), identifier (cco:DesignativeICE), and license (xsd:string). Values are stored in type-specific tables: the varchar value table holds checksums like c0ffee42, resource ARNs such as ARN:res/41, license identifiers like Apache-2.0, and region codes like eu-west-3; the date value table stores creation timestamps; and the integer value table captures numeric properties. The entity_id and attr_id foreign keys enforce the same referential discipline as the alignment tables, ensuring that every value can be traced to its entity and its attribute definition. This uniformity across domains—alignment, equivalence, and product—means that governance policies, audit queries, and data quality checks can be expressed in a single query language without domain-specific adapters.

**t_schemaorg_product_sku_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SKU-0001 | SKU-0001 | SKU-0002 | 2025-05-15 |
| SKU-0002 | SKU-0002 | SKU-0002 | 2023-06-09 |
| SKU-0003 | SKU-0003 | SKU-0002 | 2025-02-16 |
| SKU-0004 | SKU-0004 | SKU-0002 | 2024-10-26 |
| SKU-0005 | SKU-0005 | SKU-0002 | 2025-01-20 |
| SKU-0006 | SKU-0006 | SKU-0002 | 2023-04-12 |

**t_schemaorg_product_sku_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SKU-0001 | SKU-0001 | SKU-0001 | c0ffee42 |
| SKU-0002 | SKU-0001 | SKU-0003 | ARN:res/41 |
| SKU-0003 | SKU-0001 | SKU-0004 | Apache-2.0 |
| SKU-0004 | SKU-0001 | SKU-0009 | eu-west-3 |
| SKU-0005 | SKU-0001 | SKU-0005 | application/json |
| SKU-0006 | SKU-0001 | SKU-0010 | Name 06 |
| SKU-0007 | SKU-0001 | SKU-0011 | data-engineering |
| SKU-0008 | SKU-0001 | SKU-0012 | Tags 08 |