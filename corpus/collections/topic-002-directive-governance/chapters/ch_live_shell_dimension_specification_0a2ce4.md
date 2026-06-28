---
chapter_id: ch_live_shell_dimension_specification_0a2ce4
topic_id: 2
family: 08_derived
cited_terms: ['shell_dimension_specification', 'tc_classifier_subclass', 'policy_with_jurisdiction']
model: engine-refine
---

Shell dimension specifications serve as the foundational entities for a classification system that tracks measurable characteristics across distinct biological and environmental categories. Each specification is assigned a unique identifier—SPEC-0001 through SPEC-0004—and is associated with a descriptive designation such as Venus_venerupis_Mediterranean, Cypraea_tigris_Asian, Littorina_obtusa_Urban, or Strombus_gigas_Tropical, which encodes both the taxonomic origin and the contextual environment of the specimen. These identifiers function as the primary keys that anchor all subsequent attribute definitions and value assignments, ensuring that every measurement, classification, and metadata entry can be traced back to its originating specification with unambiguous referential integrity.

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

The attribute schema governing these specifications is itself a structured registry, where each attribute is defined by a name and a typed datatype drawn from the XML Schema standard. Attributes such as confidence, dimension_kind, method, and recorded_at are declared with their corresponding types—xsd:decimal, xsd:string, and xsd:dateTime—establishing a rigid type discipline that prevents value coercion errors at the schema level. This separation of attribute metadata from actual values enables the system to support heterogeneous data types within a unified framework: decimal measurements like 0.130 and 733.39 coexist alongside string descriptors such as Dimension Kind 01 and Encoding 02, temporal stamps including 2024-08-09T04:20:11 and 2025-04-11T22:51:28, and categorical flags like nightly summary and ja, all without requiring schema modifications when new attribute types are introduced.

The value storage architecture employs a type-partitioned design, where attribute values are distributed across dedicated tables keyed by their datatype—datetime, decimal, and varchar—each maintaining a consistent triad of entity reference, attribute reference, and the value itself. This normalization pattern ensures that the entity_id column in each value table points back to the originating specification identifier, while the attr_id column resolves to the corresponding attribute definition, creating a three-way join that reconstructs the complete attribute-value pairing. The entity_id and attr_id columns serve as foreign keys that enforce referential constraints, guaranteeing that no value can be assigned to a non-existent entity or attribute, and that every value is semantically anchored to both its source specification and its defined attribute.

The classifier fact table extends this attribute-value model into the domain of classification metadata, where each classifier record is identified by a code such as CLAS-0001 through CLAS-0004 and carries a directional classification reference, a size measurement in bytes, and a version number. The size_bytes column captures substantial storage allocations—643947353, 883422563, 772730446, and 623892633 bytes—reflecting the scale of the classified artifacts, while the version column tracks revision states ranging from 1 to 9, enabling temporal lineage of classification decisions. The t_c_direction_key column links each classifier to a directional dimension, which is itself defined in a separate dimension table that assigns categorical labels and categories to each direction code, forming a lookup structure where directional identifiers such as CLAS-0001 and CLAS-0004 resolve to human-readable labels like T C Direction Label 01 and T C Direction Label 04, organized under categories including T C Direction Category 01 through T C Direction Category 04.

**fact_classifier**

| id | t_c_direction_key | size_bytes | version |
| --- | --- | --- | --- |
| CLAS-0001 | CLAS-0001 | 643947353 | 2 |
| CLAS-0002 | CLAS-0004 | 883422563 | 1 |
| CLAS-0003 | CLAS-0001 | 772730446 | 1 |
| CLAS-0004 | CLAS-0006 | 623892633 | 9 |
| CLAS-0005 | CLAS-0002 | 61512113 | 4 |
| CLAS-0006 | CLAS-0007 | 798328963 | 5 |
| CLAS-0007 | CLAS-0002 | 968248258 | 9 |

**dim_t_c_direction**

| id | t_c_direction_label | t_c_direction_category |
| --- | --- | --- |
| CLAS-0001 | T C Direction Label 01 | T C Direction Category 01 |
| CLAS-0002 | T C Direction Label 02 | T C Direction Category 02 |
| CLAS-0003 | T C Direction Label 03 | T C Direction Category 03 |
| CLAS-0004 | T C Direction Label 04 | T C Direction Category 04 |
| CLAS-0005 | T C Direction Label 05 | T C Direction Category 05 |
| CLAS-0006 | T C Direction Label 06 | T C Direction Category 06 |
| CLAS-0007 | T C Direction Label 07 | T C Direction Category 07 |

The policy and jurisdiction framework mirrors this attribute-value architecture, applying the same structural pattern to regulatory and compliance data. Policy entries such as Financial Conduct Authority, European Union, and FISMA are paired with their corresponding jurisdictions—European Data Protection Board, CCPA, European Union, and Basel III—and enriched with typed attributes including effective_date, enforcement, mandatory, and priority, each governed by its schema type of xsd:date, xsd:string, xsd:boolean, and xsd:integer respectively. Boolean enforcement flags take values of true or false, effective dates span from 2023-11-22 through 2025-06-18, and integer priority levels range from 1 to 326, all stored in type-specific value tables that maintain the same entity-attribute-value join pattern established by the shell dimension specifications. This uniform structural approach across biological classification, artifact classification, and regulatory compliance domains ensures that the data model remains extensible, type-safe, and semantically consistent regardless of the subject matter being catalogued.

**t_policy_with_jurisdiction**

| id | policy | jurisdiction |
| --- | --- | --- |
| JURI-0001 | Financial Conduct Authority | European Data Protection Board |
| JURI-0002 | European Union | CCPA |
| JURI-0003 | European Union | European Union |
| JURI-0004 | FISMA | Basel III |
| JURI-0005 | California Attorney General | EU Data Act |
| JURI-0006 | Federal Trade Commission | National Institute of Standards |

**t_policy_with_jurisdiction_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| JURI-0001 | effective_date | xsd:date |
| JURI-0002 | enforcement | xsd:string |
| JURI-0003 | mandatory | xsd:boolean |
| JURI-0004 | priority | xsd:integer |
| JURI-0005 | review_cycle_days | xsd:integer |
| JURI-0006 | scope | xsd:string |
| JURI-0007 | encoding | xsd:string |
| JURI-0008 | label_text | xsd:string |

**t_policy_with_jurisdiction_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| JURI-0001 | JURI-0001 | JURI-0003 | false |
| JURI-0002 | JURI-0002 | JURI-0003 | false |
| JURI-0003 | JURI-0003 | JURI-0003 | true |
| JURI-0004 | JURI-0004 | JURI-0003 | false |
| JURI-0005 | JURI-0005 | JURI-0003 | false |
| JURI-0006 | JURI-0006 | JURI-0003 | true |

**t_policy_with_jurisdiction_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| JURI-0001 | JURI-0001 | JURI-0001 | 2023-11-22 |
| JURI-0002 | JURI-0002 | JURI-0001 | 2024-05-18 |
| JURI-0003 | JURI-0003 | JURI-0001 | 2025-06-18 |
| JURI-0004 | JURI-0004 | JURI-0001 | 2023-05-18 |
| JURI-0005 | JURI-0005 | JURI-0001 | 2025-03-17 |
| JURI-0006 | JURI-0006 | JURI-0001 | 2024-10-08 |

**t_policy_with_jurisdiction_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| JURI-0001 | JURI-0001 | JURI-0004 | 4 |
| JURI-0002 | JURI-0001 | JURI-0005 | 326 |
| JURI-0003 | JURI-0002 | JURI-0004 | 1 |
| JURI-0004 | JURI-0002 | JURI-0005 | 210 |
| JURI-0005 | JURI-0003 | JURI-0004 | 2 |
| JURI-0006 | JURI-0003 | JURI-0005 | 496 |
| JURI-0007 | JURI-0004 | JURI-0004 | 2 |
| JURI-0008 | JURI-0004 | JURI-0005 | 607 |

**t_policy_with_jurisdiction_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| JURI-0001 | JURI-0001 | JURI-0007 | Encoding 01 |
| JURI-0002 | JURI-0001 | JURI-0002 | Enforcement 02 |
| JURI-0003 | JURI-0001 | JURI-0008 | intake form |
| JURI-0004 | JURI-0001 | JURI-0009 | ja |
| JURI-0005 | JURI-0001 | JURI-0006 | Scope 05 |
| JURI-0006 | JURI-0002 | JURI-0007 | Encoding 06 |
| JURI-0007 | JURI-0002 | JURI-0002 | Enforcement 07 |
| JURI-0008 | JURI-0002 | JURI-0008 | change rationale |