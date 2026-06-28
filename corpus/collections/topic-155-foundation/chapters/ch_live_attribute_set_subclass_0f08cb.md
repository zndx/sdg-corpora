---
chapter_id: ch_live_attribute_set_subclass_0f08cb
topic_id: 155
family: 02_observation_measurement
cited_terms: ['attribute_set_subclass', 'requirement_refines', 'instrument_with_function']
model: engine-refine
---

In governed data architectures, the identifier serves as the immutable anchor of every record, a stable key that survives the transience of labels and values. Across the fact_attribute dimension, identifiers such as SET-0001 through SET-0004 provide the primary keys that bind measured quantities to their semantic descriptors; similarly, the requirement-refinement table employs REFI-0001 through REFI-0004 to trace how high-level policies like the Access Control Matrix and the Data Retention Policy decompose into executable functions. The instrument-function mapping extends this pattern further, with FUNC-0001 through FUNC-0004 serving as the bridge between physical apparatus—Keysight DSOX3024T oscilloscopes, Thermo Q Exactive mass spectrometers, Zygo NewView interferometers, Agilent 5975C chromatographs—and the abstract functions they realize. An entity, in this schema, is any such identifiable object: a requirement, an instrument, or a functional capability, each distinguished by its identifier and contextualized through its relationships to other entities.

**t_instrument_with_function**

| id | instrument | realizes_function |
| --- | --- | --- |
| FUNC-0001 | Keysight DSOX3024T | REFI-0002 |
| FUNC-0002 | Thermo Q Exactive | REFI-0003 |
| FUNC-0003 | Zygo NewView | REFI-0005 |
| FUNC-0004 | Agilent 5975C | REFI-0005 |
| FUNC-0005 | Agilent 5975C | REFI-0002 |
| FUNC-0006 | Agilent 5975C | REFI-0003 |

**t_instrument_with_function_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| FUNC-0001 | FUNC-0001 | FUNC-0006 | 359 |
| FUNC-0002 | FUNC-0001 | FUNC-0008 | 4 |
| FUNC-0003 | FUNC-0002 | FUNC-0006 | 439 |
| FUNC-0004 | FUNC-0002 | FUNC-0008 | 6 |
| FUNC-0005 | FUNC-0003 | FUNC-0006 | 255 |
| FUNC-0006 | FUNC-0003 | FUNC-0008 | 10 |
| FUNC-0007 | FUNC-0004 | FUNC-0006 | 467 |
| FUNC-0008 | FUNC-0004 | FUNC-0008 | 3 |

The attribute itself is the unit of measured or described property, and its meaning derives from the dimension table dim_attribute, where each identifier maps to a human-readable label and a categorical classification. Attribute Label 01 through Attribute Label 04 are grouped under Attribute Category 01 through Attribute Category 04 respectively, establishing a taxonomy that allows downstream consumers to reason about properties at the level of abstraction they require. The attribute_key column in fact_attribute—taking values such as SET-0005 and SET-0003—links back to this taxonomy, ensuring that every numeric observation carries with it a reference to its definitional context. This separation of attribute definition from attribute measurement is a deliberate design choice: it permits the same attribute to be measured repeatedly under different conditions, each measurement carrying its own confidence and uncertainty estimates.

**fact_attribute**

| id | attribute_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| SET-0001 | SET-0005 | 0.926 | 957.49 | 482.01 |
| SET-0002 | SET-0003 | 0.786 | 274.08 | 742.87 |
| SET-0003 | SET-0005 | 0.123 | 455.70 | 100.75 |
| SET-0004 | SET-0003 | 0.178 | 516.20 | 779.52 |

**dim_attribute**

| id | attribute_label | attribute_category |
| --- | --- | --- |
| SET-0001 | Attribute Label 01 | Attribute Category 01 |
| SET-0002 | Attribute Label 02 | Attribute Category 02 |
| SET-0003 | Attribute Label 03 | Attribute Category 03 |
| SET-0004 | Attribute Label 04 | Attribute Category 04 |
| SET-0005 | Attribute Label 05 | Attribute Category 05 |
| SET-0006 | Attribute Label 06 | Attribute Category 06 |

Confidence and uncertainty form a complementary pair that quantifies the reliability of every measurement. In the fact_attribute table, confidence scores range from 0.123 for identifier SET-0003 to 0.926 for SET-0001, while the corresponding uncertainty values—455.70, 957.49, 274.08, and 516.20—express the magnitude of doubt in absolute terms. The inverse relationship is not strictly monotonic, reflecting the fact that confidence is a normalized probability while uncertainty carries the units of the measured quantity; a value of 482.01 with confidence 0.926 and uncertainty 957.49 tells a different story than a value of 100.75 with confidence 0.123 and uncertainty 455.70. Together, these two columns enable risk-aware decision-making: an operator can filter or weight observations by their reliability, or propagate uncertainty through downstream calculations with mathematical rigor.

The attribute type system further structures how values are interpreted, distinguishing between string, date, and specialized designative types. The t_instrument_with_function_attr table declares that the checksum attribute is an xsd:string, the created_date attribute is an xsd:date, the identifier attribute carries the cco:DesignativeICE type, and the license attribute is again an xsd:string. This type information is enforced through a value-dispatch pattern: date values such as 2024-09-19, 2023-09-07, 2024-09-12, and 2024-08-15 are stored in t_instrument_with_function_val_date; integer values like 359, 4, 439, and 6 reside in t_instrument_with_function_val_int; and string values including a3f9c21e, ref-8842, MPL-2.0, and us-east-1 are held in t_instrument_with_function_val_varchar. Each value row references its entity through entity_id and its attribute through attr_id, creating a normalized star schema where the fact tables carry only foreign keys and the dimension tables carry the descriptive metadata.

**t_instrument_with_function_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| FUNC-0001 | checksum | xsd:string |
| FUNC-0002 | created_date | xsd:date |
| FUNC-0003 | identifier | cco:DesignativeICE |
| FUNC-0004 | license | xsd:string |
| FUNC-0005 | mime_type | xsd:string |
| FUNC-0006 | size_bytes | xsd:long |
| FUNC-0007 | uri | xsd:string |
| FUNC-0008 | version | xsd:integer |

**t_instrument_with_function_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| FUNC-0001 | FUNC-0001 | FUNC-0002 | 2024-09-19 |
| FUNC-0002 | FUNC-0002 | FUNC-0002 | 2023-09-07 |
| FUNC-0003 | FUNC-0003 | FUNC-0002 | 2024-09-12 |
| FUNC-0004 | FUNC-0004 | FUNC-0002 | 2024-08-15 |
| FUNC-0005 | FUNC-0005 | FUNC-0002 | 2025-05-20 |
| FUNC-0006 | FUNC-0006 | FUNC-0002 | 2023-09-16 |

**t_instrument_with_function_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| FUNC-0001 | FUNC-0001 | FUNC-0001 | a3f9c21e |
| FUNC-0002 | FUNC-0001 | FUNC-0003 | ref-8842 |
| FUNC-0003 | FUNC-0001 | FUNC-0004 | MPL-2.0 |
| FUNC-0004 | FUNC-0001 | FUNC-0009 | us-east-1 |
| FUNC-0005 | FUNC-0001 | FUNC-0005 | text/plain |
| FUNC-0006 | FUNC-0001 | FUNC-0010 | Name 06 |
| FUNC-0007 | FUNC-0001 | FUNC-0011 | sre |
| FUNC-0008 | FUNC-0001 | FUNC-0012 | Tags 08 |

Scope and language provide the contextual boundaries within which requirements and their refinements apply. The t_requirement_refines table records that the Data Retention Policy is refined by function FUNC-0003 under a regional scope in English (en), by FUNC-0006 under a local scope in French (fr), and by FUNC-0003 under a team scope in Spanish (es); the Access Control Matrix is refined by FUNC-0003 under a global scope in English. These two columns—scope and language—encode the operational constraints that determine which refinement is applicable in a given jurisdiction or organizational unit. The language field, in particular, signals that the requirement text itself may be localized, while scope determines the breadth of applicability, from a single team's internal procedures to a global enterprise mandate. This dual-axis contextualization ensures that governance artifacts are not merely abstract specifications but are grounded in the organizational and linguistic realities of their deployment.

**t_requirement_refines**

| id | requirement | refines | scope | language |
| --- | --- | --- | --- | --- |
| REFI-0001 | Access Control Matrix | FUNC-0003 | team | es |
| REFI-0002 | Data Retention Policy | FUNC-0001 | regional | en |
| REFI-0003 | Data Retention Policy | FUNC-0003 | local | en |
| REFI-0004 | Data Retention Policy | FUNC-0006 | global | fr |
| REFI-0005 | Access Control Matrix | FUNC-0002 | global | es |
| REFI-0006 | Data Retention Policy | FUNC-0001 | local | ja |